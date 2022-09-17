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

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1494 - OBJ
      ?auto_1495 - LOCATION
    )
    :vars
    (
      ?auto_1496 - TRUCK
      ?auto_1497 - LOCATION
      ?auto_1498 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1496 ?auto_1497 ) ( IN-CITY ?auto_1497 ?auto_1498 ) ( IN-CITY ?auto_1495 ?auto_1498 ) ( not ( = ?auto_1495 ?auto_1497 ) ) ( OBJ-AT ?auto_1494 ?auto_1497 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1494 ?auto_1496 ?auto_1497 )
      ( !DRIVE-TRUCK ?auto_1496 ?auto_1497 ?auto_1495 ?auto_1498 )
      ( !UNLOAD-TRUCK ?auto_1494 ?auto_1496 ?auto_1495 )
      ( DELIVER-1PKG-VERIFY ?auto_1494 ?auto_1495 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1501 - OBJ
      ?auto_1502 - LOCATION
    )
    :vars
    (
      ?auto_1505 - LOCATION
      ?auto_1503 - CITY
      ?auto_1504 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1505 ?auto_1503 ) ( IN-CITY ?auto_1502 ?auto_1503 ) ( not ( = ?auto_1502 ?auto_1505 ) ) ( OBJ-AT ?auto_1501 ?auto_1505 ) ( TRUCK-AT ?auto_1504 ?auto_1502 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1504 ?auto_1502 ?auto_1505 ?auto_1503 )
      ( DELIVER-1PKG ?auto_1501 ?auto_1502 )
      ( DELIVER-1PKG-VERIFY ?auto_1501 ?auto_1502 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1508 - OBJ
      ?auto_1509 - LOCATION
    )
    :vars
    (
      ?auto_1510 - TRUCK
      ?auto_1511 - LOCATION
      ?auto_1512 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1510 ?auto_1511 ) ( IN-CITY ?auto_1511 ?auto_1512 ) ( IN-CITY ?auto_1509 ?auto_1512 ) ( not ( = ?auto_1509 ?auto_1511 ) ) ( OBJ-AT ?auto_1508 ?auto_1511 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1508 ?auto_1510 ?auto_1511 )
      ( !DRIVE-TRUCK ?auto_1510 ?auto_1511 ?auto_1509 ?auto_1512 )
      ( !UNLOAD-TRUCK ?auto_1508 ?auto_1510 ?auto_1509 )
      ( DELIVER-1PKG-VERIFY ?auto_1508 ?auto_1509 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1515 - OBJ
      ?auto_1516 - LOCATION
    )
    :vars
    (
      ?auto_1517 - LOCATION
      ?auto_1519 - CITY
      ?auto_1518 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1517 ?auto_1519 ) ( IN-CITY ?auto_1516 ?auto_1519 ) ( not ( = ?auto_1516 ?auto_1517 ) ) ( OBJ-AT ?auto_1515 ?auto_1517 ) ( TRUCK-AT ?auto_1518 ?auto_1516 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1518 ?auto_1516 ?auto_1517 ?auto_1519 )
      ( DELIVER-1PKG ?auto_1515 ?auto_1516 )
      ( DELIVER-1PKG-VERIFY ?auto_1515 ?auto_1516 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1523 - OBJ
      ?auto_1525 - OBJ
      ?auto_1524 - LOCATION
    )
    :vars
    (
      ?auto_1527 - LOCATION
      ?auto_1528 - CITY
      ?auto_1526 - TRUCK
      ?auto_1529 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1525 ?auto_1523 ) ( IN-CITY ?auto_1527 ?auto_1528 ) ( IN-CITY ?auto_1524 ?auto_1528 ) ( not ( = ?auto_1524 ?auto_1527 ) ) ( OBJ-AT ?auto_1525 ?auto_1527 ) ( TRUCK-AT ?auto_1526 ?auto_1529 ) ( IN-CITY ?auto_1529 ?auto_1528 ) ( not ( = ?auto_1524 ?auto_1529 ) ) ( OBJ-AT ?auto_1523 ?auto_1529 ) ( not ( = ?auto_1523 ?auto_1525 ) ) ( not ( = ?auto_1527 ?auto_1529 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1523 ?auto_1524 )
      ( DELIVER-1PKG ?auto_1525 ?auto_1524 )
      ( DELIVER-2PKG-VERIFY ?auto_1523 ?auto_1525 ?auto_1524 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1533 - OBJ
      ?auto_1535 - OBJ
      ?auto_1534 - LOCATION
    )
    :vars
    (
      ?auto_1538 - LOCATION
      ?auto_1537 - CITY
      ?auto_1539 - LOCATION
      ?auto_1536 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1535 ?auto_1533 ) ( IN-CITY ?auto_1538 ?auto_1537 ) ( IN-CITY ?auto_1534 ?auto_1537 ) ( not ( = ?auto_1534 ?auto_1538 ) ) ( OBJ-AT ?auto_1535 ?auto_1538 ) ( IN-CITY ?auto_1539 ?auto_1537 ) ( not ( = ?auto_1534 ?auto_1539 ) ) ( OBJ-AT ?auto_1533 ?auto_1539 ) ( not ( = ?auto_1533 ?auto_1535 ) ) ( not ( = ?auto_1538 ?auto_1539 ) ) ( TRUCK-AT ?auto_1536 ?auto_1534 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1536 ?auto_1534 ?auto_1539 ?auto_1537 )
      ( DELIVER-2PKG ?auto_1533 ?auto_1535 ?auto_1534 )
      ( DELIVER-2PKG-VERIFY ?auto_1533 ?auto_1535 ?auto_1534 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1542 - OBJ
      ?auto_1543 - LOCATION
    )
    :vars
    (
      ?auto_1544 - TRUCK
      ?auto_1545 - LOCATION
      ?auto_1546 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1544 ?auto_1545 ) ( IN-CITY ?auto_1545 ?auto_1546 ) ( IN-CITY ?auto_1543 ?auto_1546 ) ( not ( = ?auto_1543 ?auto_1545 ) ) ( OBJ-AT ?auto_1542 ?auto_1545 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1542 ?auto_1544 ?auto_1545 )
      ( !DRIVE-TRUCK ?auto_1544 ?auto_1545 ?auto_1543 ?auto_1546 )
      ( !UNLOAD-TRUCK ?auto_1542 ?auto_1544 ?auto_1543 )
      ( DELIVER-1PKG-VERIFY ?auto_1542 ?auto_1543 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1549 - OBJ
      ?auto_1550 - LOCATION
    )
    :vars
    (
      ?auto_1551 - LOCATION
      ?auto_1553 - CITY
      ?auto_1552 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1551 ?auto_1553 ) ( IN-CITY ?auto_1550 ?auto_1553 ) ( not ( = ?auto_1550 ?auto_1551 ) ) ( OBJ-AT ?auto_1549 ?auto_1551 ) ( TRUCK-AT ?auto_1552 ?auto_1550 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1552 ?auto_1550 ?auto_1551 ?auto_1553 )
      ( DELIVER-1PKG ?auto_1549 ?auto_1550 )
      ( DELIVER-1PKG-VERIFY ?auto_1549 ?auto_1550 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1558 - OBJ
      ?auto_1560 - OBJ
      ?auto_1561 - OBJ
      ?auto_1559 - LOCATION
    )
    :vars
    (
      ?auto_1564 - LOCATION
      ?auto_1563 - CITY
      ?auto_1565 - LOCATION
      ?auto_1562 - TRUCK
      ?auto_1566 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1560 ?auto_1558 ) ( GREATER-THAN ?auto_1561 ?auto_1558 ) ( GREATER-THAN ?auto_1561 ?auto_1560 ) ( IN-CITY ?auto_1564 ?auto_1563 ) ( IN-CITY ?auto_1559 ?auto_1563 ) ( not ( = ?auto_1559 ?auto_1564 ) ) ( OBJ-AT ?auto_1561 ?auto_1564 ) ( IN-CITY ?auto_1565 ?auto_1563 ) ( not ( = ?auto_1559 ?auto_1565 ) ) ( OBJ-AT ?auto_1560 ?auto_1565 ) ( TRUCK-AT ?auto_1562 ?auto_1566 ) ( IN-CITY ?auto_1566 ?auto_1563 ) ( not ( = ?auto_1559 ?auto_1566 ) ) ( OBJ-AT ?auto_1558 ?auto_1566 ) ( not ( = ?auto_1558 ?auto_1560 ) ) ( not ( = ?auto_1565 ?auto_1566 ) ) ( not ( = ?auto_1558 ?auto_1561 ) ) ( not ( = ?auto_1560 ?auto_1561 ) ) ( not ( = ?auto_1564 ?auto_1565 ) ) ( not ( = ?auto_1564 ?auto_1566 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1558 ?auto_1560 ?auto_1559 )
      ( DELIVER-1PKG ?auto_1561 ?auto_1559 )
      ( DELIVER-3PKG-VERIFY ?auto_1558 ?auto_1560 ?auto_1561 ?auto_1559 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1571 - OBJ
      ?auto_1573 - OBJ
      ?auto_1574 - OBJ
      ?auto_1572 - LOCATION
    )
    :vars
    (
      ?auto_1575 - LOCATION
      ?auto_1576 - CITY
      ?auto_1577 - LOCATION
      ?auto_1578 - LOCATION
      ?auto_1579 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1573 ?auto_1571 ) ( GREATER-THAN ?auto_1574 ?auto_1571 ) ( GREATER-THAN ?auto_1574 ?auto_1573 ) ( IN-CITY ?auto_1575 ?auto_1576 ) ( IN-CITY ?auto_1572 ?auto_1576 ) ( not ( = ?auto_1572 ?auto_1575 ) ) ( OBJ-AT ?auto_1574 ?auto_1575 ) ( IN-CITY ?auto_1577 ?auto_1576 ) ( not ( = ?auto_1572 ?auto_1577 ) ) ( OBJ-AT ?auto_1573 ?auto_1577 ) ( IN-CITY ?auto_1578 ?auto_1576 ) ( not ( = ?auto_1572 ?auto_1578 ) ) ( OBJ-AT ?auto_1571 ?auto_1578 ) ( not ( = ?auto_1571 ?auto_1573 ) ) ( not ( = ?auto_1577 ?auto_1578 ) ) ( not ( = ?auto_1571 ?auto_1574 ) ) ( not ( = ?auto_1573 ?auto_1574 ) ) ( not ( = ?auto_1575 ?auto_1577 ) ) ( not ( = ?auto_1575 ?auto_1578 ) ) ( TRUCK-AT ?auto_1579 ?auto_1572 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1579 ?auto_1572 ?auto_1578 ?auto_1576 )
      ( DELIVER-3PKG ?auto_1571 ?auto_1573 ?auto_1574 ?auto_1572 )
      ( DELIVER-3PKG-VERIFY ?auto_1571 ?auto_1573 ?auto_1574 ?auto_1572 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1582 - OBJ
      ?auto_1583 - LOCATION
    )
    :vars
    (
      ?auto_1584 - TRUCK
      ?auto_1585 - LOCATION
      ?auto_1586 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1584 ?auto_1585 ) ( IN-CITY ?auto_1585 ?auto_1586 ) ( IN-CITY ?auto_1583 ?auto_1586 ) ( not ( = ?auto_1583 ?auto_1585 ) ) ( OBJ-AT ?auto_1582 ?auto_1585 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1582 ?auto_1584 ?auto_1585 )
      ( !DRIVE-TRUCK ?auto_1584 ?auto_1585 ?auto_1583 ?auto_1586 )
      ( !UNLOAD-TRUCK ?auto_1582 ?auto_1584 ?auto_1583 )
      ( DELIVER-1PKG-VERIFY ?auto_1582 ?auto_1583 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1589 - OBJ
      ?auto_1590 - LOCATION
    )
    :vars
    (
      ?auto_1593 - LOCATION
      ?auto_1592 - CITY
      ?auto_1591 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1593 ?auto_1592 ) ( IN-CITY ?auto_1590 ?auto_1592 ) ( not ( = ?auto_1590 ?auto_1593 ) ) ( OBJ-AT ?auto_1589 ?auto_1593 ) ( TRUCK-AT ?auto_1591 ?auto_1590 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1591 ?auto_1590 ?auto_1593 ?auto_1592 )
      ( DELIVER-1PKG ?auto_1589 ?auto_1590 )
      ( DELIVER-1PKG-VERIFY ?auto_1589 ?auto_1590 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1599 - OBJ
      ?auto_1601 - OBJ
      ?auto_1602 - OBJ
      ?auto_1603 - OBJ
      ?auto_1600 - LOCATION
    )
    :vars
    (
      ?auto_1605 - LOCATION
      ?auto_1604 - CITY
      ?auto_1607 - LOCATION
      ?auto_1608 - LOCATION
      ?auto_1606 - TRUCK
      ?auto_1609 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1601 ?auto_1599 ) ( GREATER-THAN ?auto_1602 ?auto_1599 ) ( GREATER-THAN ?auto_1602 ?auto_1601 ) ( GREATER-THAN ?auto_1603 ?auto_1599 ) ( GREATER-THAN ?auto_1603 ?auto_1601 ) ( GREATER-THAN ?auto_1603 ?auto_1602 ) ( IN-CITY ?auto_1605 ?auto_1604 ) ( IN-CITY ?auto_1600 ?auto_1604 ) ( not ( = ?auto_1600 ?auto_1605 ) ) ( OBJ-AT ?auto_1603 ?auto_1605 ) ( IN-CITY ?auto_1607 ?auto_1604 ) ( not ( = ?auto_1600 ?auto_1607 ) ) ( OBJ-AT ?auto_1602 ?auto_1607 ) ( IN-CITY ?auto_1608 ?auto_1604 ) ( not ( = ?auto_1600 ?auto_1608 ) ) ( OBJ-AT ?auto_1601 ?auto_1608 ) ( TRUCK-AT ?auto_1606 ?auto_1609 ) ( IN-CITY ?auto_1609 ?auto_1604 ) ( not ( = ?auto_1600 ?auto_1609 ) ) ( OBJ-AT ?auto_1599 ?auto_1609 ) ( not ( = ?auto_1599 ?auto_1601 ) ) ( not ( = ?auto_1608 ?auto_1609 ) ) ( not ( = ?auto_1599 ?auto_1602 ) ) ( not ( = ?auto_1601 ?auto_1602 ) ) ( not ( = ?auto_1607 ?auto_1608 ) ) ( not ( = ?auto_1607 ?auto_1609 ) ) ( not ( = ?auto_1599 ?auto_1603 ) ) ( not ( = ?auto_1601 ?auto_1603 ) ) ( not ( = ?auto_1602 ?auto_1603 ) ) ( not ( = ?auto_1605 ?auto_1607 ) ) ( not ( = ?auto_1605 ?auto_1608 ) ) ( not ( = ?auto_1605 ?auto_1609 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1599 ?auto_1601 ?auto_1602 ?auto_1600 )
      ( DELIVER-1PKG ?auto_1603 ?auto_1600 )
      ( DELIVER-4PKG-VERIFY ?auto_1599 ?auto_1601 ?auto_1602 ?auto_1603 ?auto_1600 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1615 - OBJ
      ?auto_1617 - OBJ
      ?auto_1618 - OBJ
      ?auto_1619 - OBJ
      ?auto_1616 - LOCATION
    )
    :vars
    (
      ?auto_1624 - LOCATION
      ?auto_1622 - CITY
      ?auto_1623 - LOCATION
      ?auto_1625 - LOCATION
      ?auto_1621 - LOCATION
      ?auto_1620 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1617 ?auto_1615 ) ( GREATER-THAN ?auto_1618 ?auto_1615 ) ( GREATER-THAN ?auto_1618 ?auto_1617 ) ( GREATER-THAN ?auto_1619 ?auto_1615 ) ( GREATER-THAN ?auto_1619 ?auto_1617 ) ( GREATER-THAN ?auto_1619 ?auto_1618 ) ( IN-CITY ?auto_1624 ?auto_1622 ) ( IN-CITY ?auto_1616 ?auto_1622 ) ( not ( = ?auto_1616 ?auto_1624 ) ) ( OBJ-AT ?auto_1619 ?auto_1624 ) ( IN-CITY ?auto_1623 ?auto_1622 ) ( not ( = ?auto_1616 ?auto_1623 ) ) ( OBJ-AT ?auto_1618 ?auto_1623 ) ( IN-CITY ?auto_1625 ?auto_1622 ) ( not ( = ?auto_1616 ?auto_1625 ) ) ( OBJ-AT ?auto_1617 ?auto_1625 ) ( IN-CITY ?auto_1621 ?auto_1622 ) ( not ( = ?auto_1616 ?auto_1621 ) ) ( OBJ-AT ?auto_1615 ?auto_1621 ) ( not ( = ?auto_1615 ?auto_1617 ) ) ( not ( = ?auto_1625 ?auto_1621 ) ) ( not ( = ?auto_1615 ?auto_1618 ) ) ( not ( = ?auto_1617 ?auto_1618 ) ) ( not ( = ?auto_1623 ?auto_1625 ) ) ( not ( = ?auto_1623 ?auto_1621 ) ) ( not ( = ?auto_1615 ?auto_1619 ) ) ( not ( = ?auto_1617 ?auto_1619 ) ) ( not ( = ?auto_1618 ?auto_1619 ) ) ( not ( = ?auto_1624 ?auto_1623 ) ) ( not ( = ?auto_1624 ?auto_1625 ) ) ( not ( = ?auto_1624 ?auto_1621 ) ) ( TRUCK-AT ?auto_1620 ?auto_1616 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1620 ?auto_1616 ?auto_1621 ?auto_1622 )
      ( DELIVER-4PKG ?auto_1615 ?auto_1617 ?auto_1618 ?auto_1619 ?auto_1616 )
      ( DELIVER-4PKG-VERIFY ?auto_1615 ?auto_1617 ?auto_1618 ?auto_1619 ?auto_1616 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1628 - OBJ
      ?auto_1629 - LOCATION
    )
    :vars
    (
      ?auto_1630 - TRUCK
      ?auto_1631 - LOCATION
      ?auto_1632 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1630 ?auto_1631 ) ( IN-CITY ?auto_1631 ?auto_1632 ) ( IN-CITY ?auto_1629 ?auto_1632 ) ( not ( = ?auto_1629 ?auto_1631 ) ) ( OBJ-AT ?auto_1628 ?auto_1631 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1628 ?auto_1630 ?auto_1631 )
      ( !DRIVE-TRUCK ?auto_1630 ?auto_1631 ?auto_1629 ?auto_1632 )
      ( !UNLOAD-TRUCK ?auto_1628 ?auto_1630 ?auto_1629 )
      ( DELIVER-1PKG-VERIFY ?auto_1628 ?auto_1629 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1635 - OBJ
      ?auto_1636 - LOCATION
    )
    :vars
    (
      ?auto_1637 - LOCATION
      ?auto_1638 - CITY
      ?auto_1639 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1637 ?auto_1638 ) ( IN-CITY ?auto_1636 ?auto_1638 ) ( not ( = ?auto_1636 ?auto_1637 ) ) ( OBJ-AT ?auto_1635 ?auto_1637 ) ( TRUCK-AT ?auto_1639 ?auto_1636 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1639 ?auto_1636 ?auto_1637 ?auto_1638 )
      ( DELIVER-1PKG ?auto_1635 ?auto_1636 )
      ( DELIVER-1PKG-VERIFY ?auto_1635 ?auto_1636 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1646 - OBJ
      ?auto_1648 - OBJ
      ?auto_1649 - OBJ
      ?auto_1651 - OBJ
      ?auto_1650 - OBJ
      ?auto_1647 - LOCATION
    )
    :vars
    (
      ?auto_1652 - LOCATION
      ?auto_1653 - CITY
      ?auto_1656 - LOCATION
      ?auto_1657 - LOCATION
      ?auto_1654 - TRUCK
      ?auto_1655 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1648 ?auto_1646 ) ( GREATER-THAN ?auto_1649 ?auto_1646 ) ( GREATER-THAN ?auto_1649 ?auto_1648 ) ( GREATER-THAN ?auto_1651 ?auto_1646 ) ( GREATER-THAN ?auto_1651 ?auto_1648 ) ( GREATER-THAN ?auto_1651 ?auto_1649 ) ( GREATER-THAN ?auto_1650 ?auto_1646 ) ( GREATER-THAN ?auto_1650 ?auto_1648 ) ( GREATER-THAN ?auto_1650 ?auto_1649 ) ( GREATER-THAN ?auto_1650 ?auto_1651 ) ( IN-CITY ?auto_1652 ?auto_1653 ) ( IN-CITY ?auto_1647 ?auto_1653 ) ( not ( = ?auto_1647 ?auto_1652 ) ) ( OBJ-AT ?auto_1650 ?auto_1652 ) ( IN-CITY ?auto_1656 ?auto_1653 ) ( not ( = ?auto_1647 ?auto_1656 ) ) ( OBJ-AT ?auto_1651 ?auto_1656 ) ( OBJ-AT ?auto_1649 ?auto_1652 ) ( IN-CITY ?auto_1657 ?auto_1653 ) ( not ( = ?auto_1647 ?auto_1657 ) ) ( OBJ-AT ?auto_1648 ?auto_1657 ) ( TRUCK-AT ?auto_1654 ?auto_1655 ) ( IN-CITY ?auto_1655 ?auto_1653 ) ( not ( = ?auto_1647 ?auto_1655 ) ) ( OBJ-AT ?auto_1646 ?auto_1655 ) ( not ( = ?auto_1646 ?auto_1648 ) ) ( not ( = ?auto_1657 ?auto_1655 ) ) ( not ( = ?auto_1646 ?auto_1649 ) ) ( not ( = ?auto_1648 ?auto_1649 ) ) ( not ( = ?auto_1652 ?auto_1657 ) ) ( not ( = ?auto_1652 ?auto_1655 ) ) ( not ( = ?auto_1646 ?auto_1651 ) ) ( not ( = ?auto_1648 ?auto_1651 ) ) ( not ( = ?auto_1649 ?auto_1651 ) ) ( not ( = ?auto_1656 ?auto_1652 ) ) ( not ( = ?auto_1656 ?auto_1657 ) ) ( not ( = ?auto_1656 ?auto_1655 ) ) ( not ( = ?auto_1646 ?auto_1650 ) ) ( not ( = ?auto_1648 ?auto_1650 ) ) ( not ( = ?auto_1649 ?auto_1650 ) ) ( not ( = ?auto_1651 ?auto_1650 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_1646 ?auto_1648 ?auto_1649 ?auto_1651 ?auto_1647 )
      ( DELIVER-1PKG ?auto_1650 ?auto_1647 )
      ( DELIVER-5PKG-VERIFY ?auto_1646 ?auto_1648 ?auto_1649 ?auto_1651 ?auto_1650 ?auto_1647 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1664 - OBJ
      ?auto_1666 - OBJ
      ?auto_1667 - OBJ
      ?auto_1669 - OBJ
      ?auto_1668 - OBJ
      ?auto_1665 - LOCATION
    )
    :vars
    (
      ?auto_1675 - LOCATION
      ?auto_1674 - CITY
      ?auto_1673 - LOCATION
      ?auto_1672 - LOCATION
      ?auto_1671 - LOCATION
      ?auto_1670 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1666 ?auto_1664 ) ( GREATER-THAN ?auto_1667 ?auto_1664 ) ( GREATER-THAN ?auto_1667 ?auto_1666 ) ( GREATER-THAN ?auto_1669 ?auto_1664 ) ( GREATER-THAN ?auto_1669 ?auto_1666 ) ( GREATER-THAN ?auto_1669 ?auto_1667 ) ( GREATER-THAN ?auto_1668 ?auto_1664 ) ( GREATER-THAN ?auto_1668 ?auto_1666 ) ( GREATER-THAN ?auto_1668 ?auto_1667 ) ( GREATER-THAN ?auto_1668 ?auto_1669 ) ( IN-CITY ?auto_1675 ?auto_1674 ) ( IN-CITY ?auto_1665 ?auto_1674 ) ( not ( = ?auto_1665 ?auto_1675 ) ) ( OBJ-AT ?auto_1668 ?auto_1675 ) ( IN-CITY ?auto_1673 ?auto_1674 ) ( not ( = ?auto_1665 ?auto_1673 ) ) ( OBJ-AT ?auto_1669 ?auto_1673 ) ( OBJ-AT ?auto_1667 ?auto_1675 ) ( IN-CITY ?auto_1672 ?auto_1674 ) ( not ( = ?auto_1665 ?auto_1672 ) ) ( OBJ-AT ?auto_1666 ?auto_1672 ) ( IN-CITY ?auto_1671 ?auto_1674 ) ( not ( = ?auto_1665 ?auto_1671 ) ) ( OBJ-AT ?auto_1664 ?auto_1671 ) ( not ( = ?auto_1664 ?auto_1666 ) ) ( not ( = ?auto_1672 ?auto_1671 ) ) ( not ( = ?auto_1664 ?auto_1667 ) ) ( not ( = ?auto_1666 ?auto_1667 ) ) ( not ( = ?auto_1675 ?auto_1672 ) ) ( not ( = ?auto_1675 ?auto_1671 ) ) ( not ( = ?auto_1664 ?auto_1669 ) ) ( not ( = ?auto_1666 ?auto_1669 ) ) ( not ( = ?auto_1667 ?auto_1669 ) ) ( not ( = ?auto_1673 ?auto_1675 ) ) ( not ( = ?auto_1673 ?auto_1672 ) ) ( not ( = ?auto_1673 ?auto_1671 ) ) ( not ( = ?auto_1664 ?auto_1668 ) ) ( not ( = ?auto_1666 ?auto_1668 ) ) ( not ( = ?auto_1667 ?auto_1668 ) ) ( not ( = ?auto_1669 ?auto_1668 ) ) ( TRUCK-AT ?auto_1670 ?auto_1665 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1670 ?auto_1665 ?auto_1671 ?auto_1674 )
      ( DELIVER-5PKG ?auto_1664 ?auto_1666 ?auto_1667 ?auto_1669 ?auto_1668 ?auto_1665 )
      ( DELIVER-5PKG-VERIFY ?auto_1664 ?auto_1666 ?auto_1667 ?auto_1669 ?auto_1668 ?auto_1665 ) )
  )

)

