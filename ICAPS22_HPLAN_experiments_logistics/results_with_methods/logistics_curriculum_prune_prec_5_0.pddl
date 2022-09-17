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
      ?auto_1532 - OBJ
      ?auto_1533 - LOCATION
    )
    :vars
    (
      ?auto_1542 - LOCATION
      ?auto_1539 - CITY
      ?auto_1534 - TRUCK
      ?auto_1545 - LOCATION
      ?auto_1546 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_1542 ?auto_1539 ) ( IN-CITY ?auto_1533 ?auto_1539 ) ( not ( = ?auto_1533 ?auto_1542 ) ) ( OBJ-AT ?auto_1532 ?auto_1542 ) ( TRUCK-AT ?auto_1534 ?auto_1545 ) ( IN-CITY ?auto_1545 ?auto_1546 ) ( IN-CITY ?auto_1542 ?auto_1546 ) ( not ( = ?auto_1542 ?auto_1545 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1534 ?auto_1545 ?auto_1542 ?auto_1546 )
      ( !LOAD-TRUCK ?auto_1532 ?auto_1534 ?auto_1542 )
      ( !DRIVE-TRUCK ?auto_1534 ?auto_1542 ?auto_1533 ?auto_1539 )
      ( !UNLOAD-TRUCK ?auto_1532 ?auto_1534 ?auto_1533 )
      ( DELIVER-1PKG-VERIFY ?auto_1532 ?auto_1533 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1569 - OBJ
      ?auto_1571 - OBJ
      ?auto_1575 - LOCATION
    )
    :vars
    (
      ?auto_1574 - LOCATION
      ?auto_1576 - CITY
      ?auto_1572 - CITY
      ?auto_1580 - LOCATION
      ?auto_1579 - CITY
      ?auto_1577 - TRUCK
      ?auto_1582 - LOCATION
      ?auto_1583 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1571 ?auto_1569 ) ( IN-CITY ?auto_1574 ?auto_1576 ) ( IN-CITY ?auto_1575 ?auto_1576 ) ( not ( = ?auto_1575 ?auto_1574 ) ) ( OBJ-AT ?auto_1571 ?auto_1574 ) ( IN-CITY ?auto_1575 ?auto_1572 ) ( IN-CITY ?auto_1574 ?auto_1572 ) ( IN-CITY ?auto_1580 ?auto_1579 ) ( IN-CITY ?auto_1575 ?auto_1579 ) ( not ( = ?auto_1575 ?auto_1580 ) ) ( OBJ-AT ?auto_1569 ?auto_1580 ) ( TRUCK-AT ?auto_1577 ?auto_1582 ) ( IN-CITY ?auto_1582 ?auto_1583 ) ( IN-CITY ?auto_1580 ?auto_1583 ) ( not ( = ?auto_1580 ?auto_1582 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1569 ?auto_1575 )
      ( DELIVER-1PKG ?auto_1571 ?auto_1575 )
      ( DELIVER-2PKG-VERIFY ?auto_1569 ?auto_1571 ?auto_1575 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1608 - OBJ
      ?auto_1610 - OBJ
      ?auto_1611 - OBJ
      ?auto_1618 - LOCATION
    )
    :vars
    (
      ?auto_1614 - LOCATION
      ?auto_1612 - CITY
      ?auto_1615 - CITY
      ?auto_1619 - LOCATION
      ?auto_1621 - CITY
      ?auto_1623 - CITY
      ?auto_1625 - LOCATION
      ?auto_1627 - CITY
      ?auto_1617 - TRUCK
      ?auto_1628 - LOCATION
      ?auto_1626 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1610 ?auto_1608 ) ( GREATER-THAN ?auto_1611 ?auto_1608 ) ( GREATER-THAN ?auto_1611 ?auto_1610 ) ( IN-CITY ?auto_1614 ?auto_1612 ) ( IN-CITY ?auto_1618 ?auto_1612 ) ( not ( = ?auto_1618 ?auto_1614 ) ) ( OBJ-AT ?auto_1611 ?auto_1614 ) ( IN-CITY ?auto_1618 ?auto_1615 ) ( IN-CITY ?auto_1614 ?auto_1615 ) ( IN-CITY ?auto_1619 ?auto_1621 ) ( IN-CITY ?auto_1618 ?auto_1621 ) ( not ( = ?auto_1618 ?auto_1619 ) ) ( OBJ-AT ?auto_1610 ?auto_1619 ) ( IN-CITY ?auto_1618 ?auto_1623 ) ( IN-CITY ?auto_1619 ?auto_1623 ) ( IN-CITY ?auto_1625 ?auto_1627 ) ( IN-CITY ?auto_1618 ?auto_1627 ) ( not ( = ?auto_1618 ?auto_1625 ) ) ( OBJ-AT ?auto_1608 ?auto_1625 ) ( TRUCK-AT ?auto_1617 ?auto_1628 ) ( IN-CITY ?auto_1628 ?auto_1626 ) ( IN-CITY ?auto_1625 ?auto_1626 ) ( not ( = ?auto_1625 ?auto_1628 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1608 ?auto_1610 ?auto_1618 )
      ( DELIVER-1PKG ?auto_1611 ?auto_1618 )
      ( DELIVER-3PKG-VERIFY ?auto_1608 ?auto_1610 ?auto_1611 ?auto_1618 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1653 - OBJ
      ?auto_1655 - OBJ
      ?auto_1656 - OBJ
      ?auto_1657 - OBJ
      ?auto_1662 - LOCATION
    )
    :vars
    (
      ?auto_1658 - LOCATION
      ?auto_1664 - CITY
      ?auto_1663 - CITY
      ?auto_1666 - LOCATION
      ?auto_1668 - CITY
      ?auto_1679 - CITY
      ?auto_1671 - LOCATION
      ?auto_1673 - CITY
      ?auto_1675 - CITY
      ?auto_1674 - LOCATION
      ?auto_1672 - CITY
      ?auto_1661 - TRUCK
      ?auto_1667 - LOCATION
      ?auto_1676 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1655 ?auto_1653 ) ( GREATER-THAN ?auto_1656 ?auto_1653 ) ( GREATER-THAN ?auto_1656 ?auto_1655 ) ( GREATER-THAN ?auto_1657 ?auto_1653 ) ( GREATER-THAN ?auto_1657 ?auto_1655 ) ( GREATER-THAN ?auto_1657 ?auto_1656 ) ( IN-CITY ?auto_1658 ?auto_1664 ) ( IN-CITY ?auto_1662 ?auto_1664 ) ( not ( = ?auto_1662 ?auto_1658 ) ) ( OBJ-AT ?auto_1657 ?auto_1658 ) ( IN-CITY ?auto_1662 ?auto_1663 ) ( IN-CITY ?auto_1658 ?auto_1663 ) ( IN-CITY ?auto_1666 ?auto_1668 ) ( IN-CITY ?auto_1662 ?auto_1668 ) ( not ( = ?auto_1662 ?auto_1666 ) ) ( OBJ-AT ?auto_1656 ?auto_1666 ) ( IN-CITY ?auto_1662 ?auto_1679 ) ( IN-CITY ?auto_1666 ?auto_1679 ) ( IN-CITY ?auto_1671 ?auto_1673 ) ( IN-CITY ?auto_1662 ?auto_1673 ) ( not ( = ?auto_1662 ?auto_1671 ) ) ( OBJ-AT ?auto_1655 ?auto_1671 ) ( IN-CITY ?auto_1662 ?auto_1675 ) ( IN-CITY ?auto_1671 ?auto_1675 ) ( IN-CITY ?auto_1674 ?auto_1672 ) ( IN-CITY ?auto_1662 ?auto_1672 ) ( not ( = ?auto_1662 ?auto_1674 ) ) ( OBJ-AT ?auto_1653 ?auto_1674 ) ( TRUCK-AT ?auto_1661 ?auto_1667 ) ( IN-CITY ?auto_1667 ?auto_1676 ) ( IN-CITY ?auto_1674 ?auto_1676 ) ( not ( = ?auto_1674 ?auto_1667 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1653 ?auto_1655 ?auto_1656 ?auto_1662 )
      ( DELIVER-1PKG ?auto_1657 ?auto_1662 )
      ( DELIVER-4PKG-VERIFY ?auto_1653 ?auto_1655 ?auto_1656 ?auto_1657 ?auto_1662 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1704 - OBJ
      ?auto_1706 - OBJ
      ?auto_1707 - OBJ
      ?auto_1708 - OBJ
      ?auto_1709 - OBJ
      ?auto_1711 - LOCATION
    )
    :vars
    (
      ?auto_1715 - LOCATION
      ?auto_1710 - CITY
      ?auto_1713 - CITY
      ?auto_1719 - LOCATION
      ?auto_1721 - CITY
      ?auto_1735 - CITY
      ?auto_1723 - LOCATION
      ?auto_1724 - CITY
      ?auto_1731 - CITY
      ?auto_1730 - LOCATION
      ?auto_1732 - CITY
      ?auto_1734 - CITY
      ?auto_1727 - LOCATION
      ?auto_1722 - CITY
      ?auto_1712 - TRUCK
      ?auto_1729 - LOCATION
      ?auto_1733 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1706 ?auto_1704 ) ( GREATER-THAN ?auto_1707 ?auto_1704 ) ( GREATER-THAN ?auto_1707 ?auto_1706 ) ( GREATER-THAN ?auto_1708 ?auto_1704 ) ( GREATER-THAN ?auto_1708 ?auto_1706 ) ( GREATER-THAN ?auto_1708 ?auto_1707 ) ( GREATER-THAN ?auto_1709 ?auto_1704 ) ( GREATER-THAN ?auto_1709 ?auto_1706 ) ( GREATER-THAN ?auto_1709 ?auto_1707 ) ( GREATER-THAN ?auto_1709 ?auto_1708 ) ( IN-CITY ?auto_1715 ?auto_1710 ) ( IN-CITY ?auto_1711 ?auto_1710 ) ( not ( = ?auto_1711 ?auto_1715 ) ) ( OBJ-AT ?auto_1709 ?auto_1715 ) ( IN-CITY ?auto_1711 ?auto_1713 ) ( IN-CITY ?auto_1715 ?auto_1713 ) ( IN-CITY ?auto_1719 ?auto_1721 ) ( IN-CITY ?auto_1711 ?auto_1721 ) ( not ( = ?auto_1711 ?auto_1719 ) ) ( OBJ-AT ?auto_1708 ?auto_1719 ) ( IN-CITY ?auto_1711 ?auto_1735 ) ( IN-CITY ?auto_1719 ?auto_1735 ) ( IN-CITY ?auto_1723 ?auto_1724 ) ( IN-CITY ?auto_1711 ?auto_1724 ) ( not ( = ?auto_1711 ?auto_1723 ) ) ( OBJ-AT ?auto_1707 ?auto_1723 ) ( IN-CITY ?auto_1711 ?auto_1731 ) ( IN-CITY ?auto_1723 ?auto_1731 ) ( IN-CITY ?auto_1730 ?auto_1732 ) ( IN-CITY ?auto_1711 ?auto_1732 ) ( not ( = ?auto_1711 ?auto_1730 ) ) ( OBJ-AT ?auto_1706 ?auto_1730 ) ( IN-CITY ?auto_1711 ?auto_1734 ) ( IN-CITY ?auto_1730 ?auto_1734 ) ( IN-CITY ?auto_1727 ?auto_1722 ) ( IN-CITY ?auto_1711 ?auto_1722 ) ( not ( = ?auto_1711 ?auto_1727 ) ) ( OBJ-AT ?auto_1704 ?auto_1727 ) ( TRUCK-AT ?auto_1712 ?auto_1729 ) ( IN-CITY ?auto_1729 ?auto_1733 ) ( IN-CITY ?auto_1727 ?auto_1733 ) ( not ( = ?auto_1727 ?auto_1729 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_1704 ?auto_1706 ?auto_1707 ?auto_1708 ?auto_1711 )
      ( DELIVER-1PKG ?auto_1709 ?auto_1711 )
      ( DELIVER-5PKG-VERIFY ?auto_1704 ?auto_1706 ?auto_1707 ?auto_1708 ?auto_1709 ?auto_1711 ) )
  )

)

