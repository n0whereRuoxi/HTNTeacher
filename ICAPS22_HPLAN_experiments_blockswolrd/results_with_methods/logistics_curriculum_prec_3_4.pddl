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
      ?auto_1414 - OBJ
      ?auto_1413 - LOCATION
    )
    :vars
    (
      ?auto_1416 - LOCATION
      ?auto_1417 - CITY
      ?auto_1415 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1416 ?auto_1417 ) ( IN-CITY ?auto_1413 ?auto_1417 ) ( not ( = ?auto_1413 ?auto_1416 ) ) ( OBJ-AT ?auto_1414 ?auto_1416 ) ( TRUCK-AT ?auto_1415 ?auto_1413 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1415 ?auto_1413 ?auto_1416 ?auto_1417 )
      ( !LOAD-TRUCK ?auto_1414 ?auto_1415 ?auto_1416 )
      ( !DRIVE-TRUCK ?auto_1415 ?auto_1416 ?auto_1413 ?auto_1417 )
      ( !UNLOAD-TRUCK ?auto_1414 ?auto_1415 ?auto_1413 )
      ( DELIVER-1PKG-VERIFY ?auto_1414 ?auto_1413 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1421 - OBJ
      ?auto_1420 - LOCATION
    )
    :vars
    (
      ?auto_1423 - LOCATION
      ?auto_1424 - CITY
      ?auto_1422 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1423 ?auto_1424 ) ( IN-CITY ?auto_1420 ?auto_1424 ) ( not ( = ?auto_1420 ?auto_1423 ) ) ( OBJ-AT ?auto_1421 ?auto_1423 ) ( TRUCK-AT ?auto_1422 ?auto_1420 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1422 ?auto_1420 ?auto_1423 ?auto_1424 )
      ( !LOAD-TRUCK ?auto_1421 ?auto_1422 ?auto_1423 )
      ( !DRIVE-TRUCK ?auto_1422 ?auto_1423 ?auto_1420 ?auto_1424 )
      ( !UNLOAD-TRUCK ?auto_1421 ?auto_1422 ?auto_1420 )
      ( DELIVER-1PKG-VERIFY ?auto_1421 ?auto_1420 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1435 - OBJ
      ?auto_1436 - OBJ
      ?auto_1434 - LOCATION
    )
    :vars
    (
      ?auto_1439 - LOCATION
      ?auto_1437 - CITY
      ?auto_1440 - LOCATION
      ?auto_1438 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1439 ?auto_1437 ) ( IN-CITY ?auto_1434 ?auto_1437 ) ( not ( = ?auto_1434 ?auto_1439 ) ) ( OBJ-AT ?auto_1436 ?auto_1439 ) ( IN-CITY ?auto_1440 ?auto_1437 ) ( not ( = ?auto_1434 ?auto_1440 ) ) ( OBJ-AT ?auto_1435 ?auto_1440 ) ( TRUCK-AT ?auto_1438 ?auto_1434 ) ( not ( = ?auto_1435 ?auto_1436 ) ) ( not ( = ?auto_1439 ?auto_1440 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1435 ?auto_1434 )
      ( DELIVER-1PKG ?auto_1436 ?auto_1434 )
      ( DELIVER-2PKG-VERIFY ?auto_1435 ?auto_1436 ?auto_1434 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1442 - OBJ
      ?auto_1443 - OBJ
      ?auto_1441 - LOCATION
    )
    :vars
    (
      ?auto_1444 - LOCATION
      ?auto_1447 - CITY
      ?auto_1446 - LOCATION
      ?auto_1445 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1444 ?auto_1447 ) ( IN-CITY ?auto_1441 ?auto_1447 ) ( not ( = ?auto_1441 ?auto_1444 ) ) ( OBJ-AT ?auto_1442 ?auto_1444 ) ( IN-CITY ?auto_1446 ?auto_1447 ) ( not ( = ?auto_1441 ?auto_1446 ) ) ( OBJ-AT ?auto_1443 ?auto_1446 ) ( TRUCK-AT ?auto_1445 ?auto_1441 ) ( not ( = ?auto_1443 ?auto_1442 ) ) ( not ( = ?auto_1444 ?auto_1446 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1443 ?auto_1442 ?auto_1441 )
      ( DELIVER-2PKG-VERIFY ?auto_1442 ?auto_1443 ?auto_1441 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1459 - OBJ
      ?auto_1458 - LOCATION
    )
    :vars
    (
      ?auto_1461 - LOCATION
      ?auto_1462 - CITY
      ?auto_1460 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1461 ?auto_1462 ) ( IN-CITY ?auto_1458 ?auto_1462 ) ( not ( = ?auto_1458 ?auto_1461 ) ) ( OBJ-AT ?auto_1459 ?auto_1461 ) ( TRUCK-AT ?auto_1460 ?auto_1458 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1460 ?auto_1458 ?auto_1461 ?auto_1462 )
      ( !LOAD-TRUCK ?auto_1459 ?auto_1460 ?auto_1461 )
      ( !DRIVE-TRUCK ?auto_1460 ?auto_1461 ?auto_1458 ?auto_1462 )
      ( !UNLOAD-TRUCK ?auto_1459 ?auto_1460 ?auto_1458 )
      ( DELIVER-1PKG-VERIFY ?auto_1459 ?auto_1458 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1550 - OBJ
      ?auto_1551 - OBJ
      ?auto_1552 - OBJ
      ?auto_1549 - LOCATION
    )
    :vars
    (
      ?auto_1555 - LOCATION
      ?auto_1554 - CITY
      ?auto_1557 - LOCATION
      ?auto_1556 - LOCATION
      ?auto_1553 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1555 ?auto_1554 ) ( IN-CITY ?auto_1549 ?auto_1554 ) ( not ( = ?auto_1549 ?auto_1555 ) ) ( OBJ-AT ?auto_1552 ?auto_1555 ) ( IN-CITY ?auto_1557 ?auto_1554 ) ( not ( = ?auto_1549 ?auto_1557 ) ) ( OBJ-AT ?auto_1551 ?auto_1557 ) ( IN-CITY ?auto_1556 ?auto_1554 ) ( not ( = ?auto_1549 ?auto_1556 ) ) ( OBJ-AT ?auto_1550 ?auto_1556 ) ( TRUCK-AT ?auto_1553 ?auto_1549 ) ( not ( = ?auto_1550 ?auto_1551 ) ) ( not ( = ?auto_1557 ?auto_1556 ) ) ( not ( = ?auto_1550 ?auto_1552 ) ) ( not ( = ?auto_1551 ?auto_1552 ) ) ( not ( = ?auto_1555 ?auto_1557 ) ) ( not ( = ?auto_1555 ?auto_1556 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1551 ?auto_1550 ?auto_1549 )
      ( DELIVER-1PKG ?auto_1552 ?auto_1549 )
      ( DELIVER-3PKG-VERIFY ?auto_1550 ?auto_1551 ?auto_1552 ?auto_1549 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1569 - OBJ
      ?auto_1570 - OBJ
      ?auto_1571 - OBJ
      ?auto_1568 - LOCATION
    )
    :vars
    (
      ?auto_1572 - LOCATION
      ?auto_1576 - CITY
      ?auto_1573 - LOCATION
      ?auto_1574 - LOCATION
      ?auto_1575 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1572 ?auto_1576 ) ( IN-CITY ?auto_1568 ?auto_1576 ) ( not ( = ?auto_1568 ?auto_1572 ) ) ( OBJ-AT ?auto_1570 ?auto_1572 ) ( IN-CITY ?auto_1573 ?auto_1576 ) ( not ( = ?auto_1568 ?auto_1573 ) ) ( OBJ-AT ?auto_1571 ?auto_1573 ) ( IN-CITY ?auto_1574 ?auto_1576 ) ( not ( = ?auto_1568 ?auto_1574 ) ) ( OBJ-AT ?auto_1569 ?auto_1574 ) ( TRUCK-AT ?auto_1575 ?auto_1568 ) ( not ( = ?auto_1569 ?auto_1571 ) ) ( not ( = ?auto_1573 ?auto_1574 ) ) ( not ( = ?auto_1569 ?auto_1570 ) ) ( not ( = ?auto_1571 ?auto_1570 ) ) ( not ( = ?auto_1572 ?auto_1573 ) ) ( not ( = ?auto_1572 ?auto_1574 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1569 ?auto_1571 ?auto_1570 ?auto_1568 )
      ( DELIVER-3PKG-VERIFY ?auto_1569 ?auto_1570 ?auto_1571 ?auto_1568 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1588 - OBJ
      ?auto_1589 - OBJ
      ?auto_1590 - OBJ
      ?auto_1587 - LOCATION
    )
    :vars
    (
      ?auto_1594 - LOCATION
      ?auto_1591 - CITY
      ?auto_1595 - LOCATION
      ?auto_1593 - LOCATION
      ?auto_1592 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1594 ?auto_1591 ) ( IN-CITY ?auto_1587 ?auto_1591 ) ( not ( = ?auto_1587 ?auto_1594 ) ) ( OBJ-AT ?auto_1590 ?auto_1594 ) ( IN-CITY ?auto_1595 ?auto_1591 ) ( not ( = ?auto_1587 ?auto_1595 ) ) ( OBJ-AT ?auto_1588 ?auto_1595 ) ( IN-CITY ?auto_1593 ?auto_1591 ) ( not ( = ?auto_1587 ?auto_1593 ) ) ( OBJ-AT ?auto_1589 ?auto_1593 ) ( TRUCK-AT ?auto_1592 ?auto_1587 ) ( not ( = ?auto_1589 ?auto_1588 ) ) ( not ( = ?auto_1595 ?auto_1593 ) ) ( not ( = ?auto_1589 ?auto_1590 ) ) ( not ( = ?auto_1588 ?auto_1590 ) ) ( not ( = ?auto_1594 ?auto_1595 ) ) ( not ( = ?auto_1594 ?auto_1593 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1589 ?auto_1590 ?auto_1588 ?auto_1587 )
      ( DELIVER-3PKG-VERIFY ?auto_1588 ?auto_1589 ?auto_1590 ?auto_1587 ) )
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
      ?auto_1613 - LOCATION
      ?auto_1610 - CITY
      ?auto_1614 - LOCATION
      ?auto_1612 - LOCATION
      ?auto_1611 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1613 ?auto_1610 ) ( IN-CITY ?auto_1606 ?auto_1610 ) ( not ( = ?auto_1606 ?auto_1613 ) ) ( OBJ-AT ?auto_1608 ?auto_1613 ) ( IN-CITY ?auto_1614 ?auto_1610 ) ( not ( = ?auto_1606 ?auto_1614 ) ) ( OBJ-AT ?auto_1607 ?auto_1614 ) ( IN-CITY ?auto_1612 ?auto_1610 ) ( not ( = ?auto_1606 ?auto_1612 ) ) ( OBJ-AT ?auto_1609 ?auto_1612 ) ( TRUCK-AT ?auto_1611 ?auto_1606 ) ( not ( = ?auto_1609 ?auto_1607 ) ) ( not ( = ?auto_1614 ?auto_1612 ) ) ( not ( = ?auto_1609 ?auto_1608 ) ) ( not ( = ?auto_1607 ?auto_1608 ) ) ( not ( = ?auto_1613 ?auto_1614 ) ) ( not ( = ?auto_1613 ?auto_1612 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1609 ?auto_1608 ?auto_1607 ?auto_1606 )
      ( DELIVER-3PKG-VERIFY ?auto_1607 ?auto_1608 ?auto_1609 ?auto_1606 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1646 - OBJ
      ?auto_1647 - OBJ
      ?auto_1648 - OBJ
      ?auto_1645 - LOCATION
    )
    :vars
    (
      ?auto_1652 - LOCATION
      ?auto_1649 - CITY
      ?auto_1653 - LOCATION
      ?auto_1651 - LOCATION
      ?auto_1650 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1652 ?auto_1649 ) ( IN-CITY ?auto_1645 ?auto_1649 ) ( not ( = ?auto_1645 ?auto_1652 ) ) ( OBJ-AT ?auto_1646 ?auto_1652 ) ( IN-CITY ?auto_1653 ?auto_1649 ) ( not ( = ?auto_1645 ?auto_1653 ) ) ( OBJ-AT ?auto_1648 ?auto_1653 ) ( IN-CITY ?auto_1651 ?auto_1649 ) ( not ( = ?auto_1645 ?auto_1651 ) ) ( OBJ-AT ?auto_1647 ?auto_1651 ) ( TRUCK-AT ?auto_1650 ?auto_1645 ) ( not ( = ?auto_1647 ?auto_1648 ) ) ( not ( = ?auto_1653 ?auto_1651 ) ) ( not ( = ?auto_1647 ?auto_1646 ) ) ( not ( = ?auto_1648 ?auto_1646 ) ) ( not ( = ?auto_1652 ?auto_1653 ) ) ( not ( = ?auto_1652 ?auto_1651 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1647 ?auto_1646 ?auto_1648 ?auto_1645 )
      ( DELIVER-3PKG-VERIFY ?auto_1646 ?auto_1647 ?auto_1648 ?auto_1645 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1665 - OBJ
      ?auto_1666 - OBJ
      ?auto_1667 - OBJ
      ?auto_1664 - LOCATION
    )
    :vars
    (
      ?auto_1671 - LOCATION
      ?auto_1668 - CITY
      ?auto_1672 - LOCATION
      ?auto_1670 - LOCATION
      ?auto_1669 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1671 ?auto_1668 ) ( IN-CITY ?auto_1664 ?auto_1668 ) ( not ( = ?auto_1664 ?auto_1671 ) ) ( OBJ-AT ?auto_1665 ?auto_1671 ) ( IN-CITY ?auto_1672 ?auto_1668 ) ( not ( = ?auto_1664 ?auto_1672 ) ) ( OBJ-AT ?auto_1666 ?auto_1672 ) ( IN-CITY ?auto_1670 ?auto_1668 ) ( not ( = ?auto_1664 ?auto_1670 ) ) ( OBJ-AT ?auto_1667 ?auto_1670 ) ( TRUCK-AT ?auto_1669 ?auto_1664 ) ( not ( = ?auto_1667 ?auto_1666 ) ) ( not ( = ?auto_1672 ?auto_1670 ) ) ( not ( = ?auto_1667 ?auto_1665 ) ) ( not ( = ?auto_1666 ?auto_1665 ) ) ( not ( = ?auto_1671 ?auto_1672 ) ) ( not ( = ?auto_1671 ?auto_1670 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1667 ?auto_1665 ?auto_1666 ?auto_1664 )
      ( DELIVER-3PKG-VERIFY ?auto_1665 ?auto_1666 ?auto_1667 ?auto_1664 ) )
  )

)

