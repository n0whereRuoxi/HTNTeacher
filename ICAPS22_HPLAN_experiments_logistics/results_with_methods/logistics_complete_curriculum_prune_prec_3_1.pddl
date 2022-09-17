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
      ?auto_1535 - OBJ
      ?auto_1536 - LOCATION
    )
    :vars
    (
      ?auto_1537 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1537 ?auto_1536 ) ( IN-TRUCK ?auto_1535 ?auto_1537 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1535 ?auto_1537 ?auto_1536 )
      ( DELIVER-1PKG-VERIFY ?auto_1535 ?auto_1536 ) )
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
      ?auto_1548 - LOCATION
      ?auto_1549 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1542 ?auto_1544 ) ( TRUCK-AT ?auto_1544 ?auto_1548 ) ( IN-CITY ?auto_1548 ?auto_1549 ) ( IN-CITY ?auto_1543 ?auto_1549 ) ( not ( = ?auto_1543 ?auto_1548 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1544 ?auto_1548 ?auto_1543 ?auto_1549 )
      ( DELIVER-1PKG ?auto_1542 ?auto_1543 )
      ( DELIVER-1PKG-VERIFY ?auto_1542 ?auto_1543 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1553 - OBJ
      ?auto_1554 - LOCATION
    )
    :vars
    (
      ?auto_1557 - TRUCK
      ?auto_1556 - LOCATION
      ?auto_1555 - CITY
      ?auto_1561 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1557 ?auto_1556 ) ( IN-CITY ?auto_1556 ?auto_1555 ) ( IN-CITY ?auto_1554 ?auto_1555 ) ( not ( = ?auto_1554 ?auto_1556 ) ) ( TRUCK-AT ?auto_1557 ?auto_1561 ) ( OBJ-AT ?auto_1553 ?auto_1561 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1553 ?auto_1557 ?auto_1561 )
      ( DELIVER-1PKG ?auto_1553 ?auto_1554 )
      ( DELIVER-1PKG-VERIFY ?auto_1553 ?auto_1554 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1565 - OBJ
      ?auto_1566 - LOCATION
    )
    :vars
    (
      ?auto_1570 - LOCATION
      ?auto_1568 - CITY
      ?auto_1569 - TRUCK
      ?auto_1574 - LOCATION
      ?auto_1575 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_1570 ?auto_1568 ) ( IN-CITY ?auto_1566 ?auto_1568 ) ( not ( = ?auto_1566 ?auto_1570 ) ) ( OBJ-AT ?auto_1565 ?auto_1570 ) ( TRUCK-AT ?auto_1569 ?auto_1574 ) ( IN-CITY ?auto_1574 ?auto_1575 ) ( IN-CITY ?auto_1570 ?auto_1575 ) ( not ( = ?auto_1570 ?auto_1574 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1569 ?auto_1574 ?auto_1570 ?auto_1575 )
      ( DELIVER-1PKG ?auto_1565 ?auto_1566 )
      ( DELIVER-1PKG-VERIFY ?auto_1565 ?auto_1566 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1624 - OBJ
      ?auto_1626 - OBJ
      ?auto_1625 - LOCATION
    )
    :vars
    (
      ?auto_1627 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1626 ?auto_1624 ) ( TRUCK-AT ?auto_1627 ?auto_1625 ) ( IN-TRUCK ?auto_1626 ?auto_1627 ) ( OBJ-AT ?auto_1624 ?auto_1625 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1626 ?auto_1625 )
      ( DELIVER-2PKG-VERIFY ?auto_1624 ?auto_1626 ?auto_1625 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1633 - OBJ
      ?auto_1635 - OBJ
      ?auto_1634 - LOCATION
    )
    :vars
    (
      ?auto_1637 - TRUCK
      ?auto_1640 - LOCATION
      ?auto_1638 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1635 ?auto_1633 ) ( IN-TRUCK ?auto_1635 ?auto_1637 ) ( TRUCK-AT ?auto_1637 ?auto_1640 ) ( IN-CITY ?auto_1640 ?auto_1638 ) ( IN-CITY ?auto_1634 ?auto_1638 ) ( not ( = ?auto_1634 ?auto_1640 ) ) ( OBJ-AT ?auto_1633 ?auto_1634 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1635 ?auto_1634 )
      ( DELIVER-2PKG-VERIFY ?auto_1633 ?auto_1635 ?auto_1634 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1644 - OBJ
      ?auto_1646 - OBJ
      ?auto_1645 - LOCATION
    )
    :vars
    (
      ?auto_1647 - TRUCK
      ?auto_1648 - LOCATION
      ?auto_1651 - CITY
      ?auto_1649 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1646 ?auto_1644 ) ( TRUCK-AT ?auto_1647 ?auto_1648 ) ( IN-CITY ?auto_1648 ?auto_1651 ) ( IN-CITY ?auto_1645 ?auto_1651 ) ( not ( = ?auto_1645 ?auto_1648 ) ) ( TRUCK-AT ?auto_1647 ?auto_1649 ) ( OBJ-AT ?auto_1646 ?auto_1649 ) ( OBJ-AT ?auto_1644 ?auto_1645 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1646 ?auto_1645 )
      ( DELIVER-2PKG-VERIFY ?auto_1644 ?auto_1646 ?auto_1645 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1656 - OBJ
      ?auto_1658 - OBJ
      ?auto_1657 - LOCATION
    )
    :vars
    (
      ?auto_1663 - LOCATION
      ?auto_1661 - CITY
      ?auto_1664 - TRUCK
      ?auto_1662 - LOCATION
      ?auto_1665 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1658 ?auto_1656 ) ( IN-CITY ?auto_1663 ?auto_1661 ) ( IN-CITY ?auto_1657 ?auto_1661 ) ( not ( = ?auto_1657 ?auto_1663 ) ) ( OBJ-AT ?auto_1658 ?auto_1663 ) ( TRUCK-AT ?auto_1664 ?auto_1662 ) ( IN-CITY ?auto_1662 ?auto_1665 ) ( IN-CITY ?auto_1663 ?auto_1665 ) ( not ( = ?auto_1663 ?auto_1662 ) ) ( OBJ-AT ?auto_1656 ?auto_1657 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1658 ?auto_1657 )
      ( DELIVER-2PKG-VERIFY ?auto_1656 ?auto_1658 ?auto_1657 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1672 - OBJ
      ?auto_1671 - OBJ
      ?auto_1670 - LOCATION
    )
    :vars
    (
      ?auto_1676 - LOCATION
      ?auto_1678 - CITY
      ?auto_1677 - TRUCK
      ?auto_1679 - LOCATION
      ?auto_1674 - CITY
      ?auto_1680 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1671 ?auto_1672 ) ( IN-CITY ?auto_1676 ?auto_1678 ) ( IN-CITY ?auto_1670 ?auto_1678 ) ( not ( = ?auto_1670 ?auto_1676 ) ) ( OBJ-AT ?auto_1671 ?auto_1676 ) ( TRUCK-AT ?auto_1677 ?auto_1679 ) ( IN-CITY ?auto_1679 ?auto_1674 ) ( IN-CITY ?auto_1676 ?auto_1674 ) ( not ( = ?auto_1676 ?auto_1679 ) ) ( TRUCK-AT ?auto_1680 ?auto_1670 ) ( IN-TRUCK ?auto_1672 ?auto_1680 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1672 ?auto_1670 )
      ( DELIVER-2PKG ?auto_1672 ?auto_1671 ?auto_1670 )
      ( DELIVER-2PKG-VERIFY ?auto_1672 ?auto_1671 ?auto_1670 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1686 - OBJ
      ?auto_1688 - OBJ
      ?auto_1687 - LOCATION
    )
    :vars
    (
      ?auto_1689 - LOCATION
      ?auto_1693 - CITY
      ?auto_1697 - CITY
      ?auto_1695 - TRUCK
      ?auto_1699 - LOCATION
      ?auto_1700 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1688 ?auto_1686 ) ( IN-CITY ?auto_1689 ?auto_1693 ) ( IN-CITY ?auto_1687 ?auto_1693 ) ( not ( = ?auto_1687 ?auto_1689 ) ) ( OBJ-AT ?auto_1688 ?auto_1689 ) ( IN-CITY ?auto_1687 ?auto_1697 ) ( IN-CITY ?auto_1689 ?auto_1697 ) ( IN-TRUCK ?auto_1686 ?auto_1695 ) ( TRUCK-AT ?auto_1695 ?auto_1699 ) ( IN-CITY ?auto_1699 ?auto_1700 ) ( IN-CITY ?auto_1687 ?auto_1700 ) ( not ( = ?auto_1687 ?auto_1699 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1695 ?auto_1699 ?auto_1687 ?auto_1700 )
      ( DELIVER-2PKG ?auto_1686 ?auto_1688 ?auto_1687 )
      ( DELIVER-2PKG-VERIFY ?auto_1686 ?auto_1688 ?auto_1687 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1705 - OBJ
      ?auto_1707 - OBJ
      ?auto_1706 - LOCATION
    )
    :vars
    (
      ?auto_1716 - LOCATION
      ?auto_1712 - CITY
      ?auto_1713 - CITY
      ?auto_1715 - TRUCK
      ?auto_1710 - LOCATION
      ?auto_1708 - CITY
      ?auto_1718 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1707 ?auto_1705 ) ( IN-CITY ?auto_1716 ?auto_1712 ) ( IN-CITY ?auto_1706 ?auto_1712 ) ( not ( = ?auto_1706 ?auto_1716 ) ) ( OBJ-AT ?auto_1707 ?auto_1716 ) ( IN-CITY ?auto_1706 ?auto_1713 ) ( IN-CITY ?auto_1716 ?auto_1713 ) ( TRUCK-AT ?auto_1715 ?auto_1710 ) ( IN-CITY ?auto_1710 ?auto_1708 ) ( IN-CITY ?auto_1706 ?auto_1708 ) ( not ( = ?auto_1706 ?auto_1710 ) ) ( TRUCK-AT ?auto_1715 ?auto_1718 ) ( OBJ-AT ?auto_1705 ?auto_1718 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1705 ?auto_1715 ?auto_1718 )
      ( DELIVER-2PKG ?auto_1705 ?auto_1707 ?auto_1706 )
      ( DELIVER-2PKG-VERIFY ?auto_1705 ?auto_1707 ?auto_1706 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1723 - OBJ
      ?auto_1725 - OBJ
      ?auto_1724 - LOCATION
    )
    :vars
    (
      ?auto_1729 - LOCATION
      ?auto_1726 - CITY
      ?auto_1730 - CITY
      ?auto_1734 - LOCATION
      ?auto_1732 - CITY
      ?auto_1733 - TRUCK
      ?auto_1737 - LOCATION
      ?auto_1738 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1725 ?auto_1723 ) ( IN-CITY ?auto_1729 ?auto_1726 ) ( IN-CITY ?auto_1724 ?auto_1726 ) ( not ( = ?auto_1724 ?auto_1729 ) ) ( OBJ-AT ?auto_1725 ?auto_1729 ) ( IN-CITY ?auto_1724 ?auto_1730 ) ( IN-CITY ?auto_1729 ?auto_1730 ) ( IN-CITY ?auto_1734 ?auto_1732 ) ( IN-CITY ?auto_1724 ?auto_1732 ) ( not ( = ?auto_1724 ?auto_1734 ) ) ( OBJ-AT ?auto_1723 ?auto_1734 ) ( TRUCK-AT ?auto_1733 ?auto_1737 ) ( IN-CITY ?auto_1737 ?auto_1738 ) ( IN-CITY ?auto_1734 ?auto_1738 ) ( not ( = ?auto_1734 ?auto_1737 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1733 ?auto_1737 ?auto_1734 ?auto_1738 )
      ( DELIVER-2PKG ?auto_1723 ?auto_1725 ?auto_1724 )
      ( DELIVER-2PKG-VERIFY ?auto_1723 ?auto_1725 ?auto_1724 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1788 - OBJ
      ?auto_1790 - OBJ
      ?auto_1791 - OBJ
      ?auto_1789 - LOCATION
    )
    :vars
    (
      ?auto_1793 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1790 ?auto_1788 ) ( GREATER-THAN ?auto_1791 ?auto_1788 ) ( GREATER-THAN ?auto_1791 ?auto_1790 ) ( TRUCK-AT ?auto_1793 ?auto_1789 ) ( IN-TRUCK ?auto_1791 ?auto_1793 ) ( OBJ-AT ?auto_1788 ?auto_1789 ) ( OBJ-AT ?auto_1790 ?auto_1789 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1791 ?auto_1789 )
      ( DELIVER-3PKG-VERIFY ?auto_1788 ?auto_1790 ?auto_1791 ?auto_1789 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1799 - OBJ
      ?auto_1801 - OBJ
      ?auto_1802 - OBJ
      ?auto_1800 - LOCATION
    )
    :vars
    (
      ?auto_1807 - TRUCK
      ?auto_1803 - LOCATION
      ?auto_1805 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1801 ?auto_1799 ) ( GREATER-THAN ?auto_1802 ?auto_1799 ) ( GREATER-THAN ?auto_1802 ?auto_1801 ) ( IN-TRUCK ?auto_1802 ?auto_1807 ) ( TRUCK-AT ?auto_1807 ?auto_1803 ) ( IN-CITY ?auto_1803 ?auto_1805 ) ( IN-CITY ?auto_1800 ?auto_1805 ) ( not ( = ?auto_1800 ?auto_1803 ) ) ( OBJ-AT ?auto_1799 ?auto_1800 ) ( OBJ-AT ?auto_1801 ?auto_1800 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1802 ?auto_1800 )
      ( DELIVER-3PKG-VERIFY ?auto_1799 ?auto_1801 ?auto_1802 ?auto_1800 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1812 - OBJ
      ?auto_1814 - OBJ
      ?auto_1815 - OBJ
      ?auto_1813 - LOCATION
    )
    :vars
    (
      ?auto_1820 - TRUCK
      ?auto_1818 - LOCATION
      ?auto_1819 - CITY
      ?auto_1821 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1814 ?auto_1812 ) ( GREATER-THAN ?auto_1815 ?auto_1812 ) ( GREATER-THAN ?auto_1815 ?auto_1814 ) ( TRUCK-AT ?auto_1820 ?auto_1818 ) ( IN-CITY ?auto_1818 ?auto_1819 ) ( IN-CITY ?auto_1813 ?auto_1819 ) ( not ( = ?auto_1813 ?auto_1818 ) ) ( TRUCK-AT ?auto_1820 ?auto_1821 ) ( OBJ-AT ?auto_1815 ?auto_1821 ) ( OBJ-AT ?auto_1812 ?auto_1813 ) ( OBJ-AT ?auto_1814 ?auto_1813 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1815 ?auto_1813 )
      ( DELIVER-3PKG-VERIFY ?auto_1812 ?auto_1814 ?auto_1815 ?auto_1813 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1826 - OBJ
      ?auto_1828 - OBJ
      ?auto_1829 - OBJ
      ?auto_1827 - LOCATION
    )
    :vars
    (
      ?auto_1834 - LOCATION
      ?auto_1831 - CITY
      ?auto_1836 - TRUCK
      ?auto_1830 - LOCATION
      ?auto_1833 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1828 ?auto_1826 ) ( GREATER-THAN ?auto_1829 ?auto_1826 ) ( GREATER-THAN ?auto_1829 ?auto_1828 ) ( IN-CITY ?auto_1834 ?auto_1831 ) ( IN-CITY ?auto_1827 ?auto_1831 ) ( not ( = ?auto_1827 ?auto_1834 ) ) ( OBJ-AT ?auto_1829 ?auto_1834 ) ( TRUCK-AT ?auto_1836 ?auto_1830 ) ( IN-CITY ?auto_1830 ?auto_1833 ) ( IN-CITY ?auto_1834 ?auto_1833 ) ( not ( = ?auto_1834 ?auto_1830 ) ) ( OBJ-AT ?auto_1826 ?auto_1827 ) ( OBJ-AT ?auto_1828 ?auto_1827 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1829 ?auto_1827 )
      ( DELIVER-3PKG-VERIFY ?auto_1826 ?auto_1828 ?auto_1829 ?auto_1827 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1841 - OBJ
      ?auto_1850 - OBJ
      ?auto_1844 - OBJ
      ?auto_1842 - LOCATION
    )
    :vars
    (
      ?auto_1851 - OBJ
      ?auto_1848 - LOCATION
      ?auto_1845 - CITY
      ?auto_1846 - TRUCK
      ?auto_1853 - LOCATION
      ?auto_1847 - CITY
      ?auto_1854 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1850 ?auto_1841 ) ( GREATER-THAN ?auto_1844 ?auto_1841 ) ( GREATER-THAN ?auto_1844 ?auto_1850 ) ( GREATER-THAN ?auto_1850 ?auto_1851 ) ( GREATER-THAN ?auto_1844 ?auto_1851 ) ( IN-CITY ?auto_1848 ?auto_1845 ) ( IN-CITY ?auto_1842 ?auto_1845 ) ( not ( = ?auto_1842 ?auto_1848 ) ) ( OBJ-AT ?auto_1844 ?auto_1848 ) ( TRUCK-AT ?auto_1846 ?auto_1853 ) ( IN-CITY ?auto_1853 ?auto_1847 ) ( IN-CITY ?auto_1848 ?auto_1847 ) ( not ( = ?auto_1848 ?auto_1853 ) ) ( OBJ-AT ?auto_1851 ?auto_1842 ) ( TRUCK-AT ?auto_1854 ?auto_1842 ) ( IN-TRUCK ?auto_1850 ?auto_1854 ) ( OBJ-AT ?auto_1841 ?auto_1842 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1850 ?auto_1842 )
      ( DELIVER-3PKG ?auto_1851 ?auto_1850 ?auto_1844 ?auto_1842 )
      ( DELIVER-3PKG-VERIFY ?auto_1841 ?auto_1850 ?auto_1844 ?auto_1842 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1861 - OBJ
      ?auto_1863 - OBJ
      ?auto_1864 - OBJ
      ?auto_1862 - LOCATION
    )
    :vars
    (
      ?auto_1875 - OBJ
      ?auto_1866 - OBJ
      ?auto_1870 - LOCATION
      ?auto_1869 - CITY
      ?auto_1871 - CITY
      ?auto_1873 - TRUCK
      ?auto_1877 - LOCATION
      ?auto_1878 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1863 ?auto_1861 ) ( GREATER-THAN ?auto_1864 ?auto_1861 ) ( GREATER-THAN ?auto_1864 ?auto_1863 ) ( GREATER-THAN ?auto_1863 ?auto_1875 ) ( GREATER-THAN ?auto_1864 ?auto_1875 ) ( GREATER-THAN ?auto_1863 ?auto_1866 ) ( GREATER-THAN ?auto_1864 ?auto_1866 ) ( IN-CITY ?auto_1870 ?auto_1869 ) ( IN-CITY ?auto_1862 ?auto_1869 ) ( not ( = ?auto_1862 ?auto_1870 ) ) ( OBJ-AT ?auto_1864 ?auto_1870 ) ( IN-CITY ?auto_1862 ?auto_1871 ) ( IN-CITY ?auto_1870 ?auto_1871 ) ( OBJ-AT ?auto_1866 ?auto_1862 ) ( IN-TRUCK ?auto_1863 ?auto_1873 ) ( OBJ-AT ?auto_1875 ?auto_1862 ) ( TRUCK-AT ?auto_1873 ?auto_1877 ) ( IN-CITY ?auto_1877 ?auto_1878 ) ( IN-CITY ?auto_1862 ?auto_1878 ) ( not ( = ?auto_1862 ?auto_1877 ) ) ( OBJ-AT ?auto_1861 ?auto_1862 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1873 ?auto_1877 ?auto_1862 ?auto_1878 )
      ( DELIVER-3PKG ?auto_1875 ?auto_1863 ?auto_1864 ?auto_1862 )
      ( DELIVER-3PKG-VERIFY ?auto_1861 ?auto_1863 ?auto_1864 ?auto_1862 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1884 - OBJ
      ?auto_1886 - OBJ
      ?auto_1887 - OBJ
      ?auto_1885 - LOCATION
    )
    :vars
    (
      ?auto_1899 - OBJ
      ?auto_1896 - OBJ
      ?auto_1889 - OBJ
      ?auto_1892 - LOCATION
      ?auto_1894 - CITY
      ?auto_1890 - CITY
      ?auto_1893 - TRUCK
      ?auto_1898 - LOCATION
      ?auto_1897 - CITY
      ?auto_1901 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1886 ?auto_1884 ) ( GREATER-THAN ?auto_1887 ?auto_1884 ) ( GREATER-THAN ?auto_1887 ?auto_1886 ) ( GREATER-THAN ?auto_1886 ?auto_1899 ) ( GREATER-THAN ?auto_1887 ?auto_1899 ) ( GREATER-THAN ?auto_1886 ?auto_1896 ) ( GREATER-THAN ?auto_1887 ?auto_1896 ) ( GREATER-THAN ?auto_1886 ?auto_1889 ) ( GREATER-THAN ?auto_1887 ?auto_1889 ) ( IN-CITY ?auto_1892 ?auto_1894 ) ( IN-CITY ?auto_1885 ?auto_1894 ) ( not ( = ?auto_1885 ?auto_1892 ) ) ( OBJ-AT ?auto_1887 ?auto_1892 ) ( IN-CITY ?auto_1885 ?auto_1890 ) ( IN-CITY ?auto_1892 ?auto_1890 ) ( OBJ-AT ?auto_1889 ?auto_1885 ) ( OBJ-AT ?auto_1896 ?auto_1885 ) ( TRUCK-AT ?auto_1893 ?auto_1898 ) ( IN-CITY ?auto_1898 ?auto_1897 ) ( IN-CITY ?auto_1885 ?auto_1897 ) ( not ( = ?auto_1885 ?auto_1898 ) ) ( OBJ-AT ?auto_1899 ?auto_1885 ) ( TRUCK-AT ?auto_1893 ?auto_1901 ) ( OBJ-AT ?auto_1886 ?auto_1901 ) ( OBJ-AT ?auto_1884 ?auto_1885 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1886 ?auto_1893 ?auto_1901 )
      ( DELIVER-3PKG ?auto_1899 ?auto_1886 ?auto_1887 ?auto_1885 )
      ( DELIVER-3PKG-VERIFY ?auto_1884 ?auto_1886 ?auto_1887 ?auto_1885 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1907 - OBJ
      ?auto_1909 - OBJ
      ?auto_1910 - OBJ
      ?auto_1908 - LOCATION
    )
    :vars
    (
      ?auto_1924 - OBJ
      ?auto_1921 - OBJ
      ?auto_1915 - OBJ
      ?auto_1916 - OBJ
      ?auto_1914 - LOCATION
      ?auto_1917 - CITY
      ?auto_1920 - CITY
      ?auto_1923 - LOCATION
      ?auto_1913 - CITY
      ?auto_1918 - TRUCK
      ?auto_1926 - LOCATION
      ?auto_1927 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1909 ?auto_1907 ) ( GREATER-THAN ?auto_1910 ?auto_1907 ) ( GREATER-THAN ?auto_1910 ?auto_1909 ) ( GREATER-THAN ?auto_1909 ?auto_1924 ) ( GREATER-THAN ?auto_1910 ?auto_1924 ) ( GREATER-THAN ?auto_1909 ?auto_1921 ) ( GREATER-THAN ?auto_1910 ?auto_1921 ) ( GREATER-THAN ?auto_1909 ?auto_1915 ) ( GREATER-THAN ?auto_1910 ?auto_1915 ) ( GREATER-THAN ?auto_1909 ?auto_1916 ) ( GREATER-THAN ?auto_1910 ?auto_1916 ) ( IN-CITY ?auto_1914 ?auto_1917 ) ( IN-CITY ?auto_1908 ?auto_1917 ) ( not ( = ?auto_1908 ?auto_1914 ) ) ( OBJ-AT ?auto_1910 ?auto_1914 ) ( IN-CITY ?auto_1908 ?auto_1920 ) ( IN-CITY ?auto_1914 ?auto_1920 ) ( OBJ-AT ?auto_1916 ?auto_1908 ) ( OBJ-AT ?auto_1915 ?auto_1908 ) ( IN-CITY ?auto_1923 ?auto_1913 ) ( IN-CITY ?auto_1908 ?auto_1913 ) ( not ( = ?auto_1908 ?auto_1923 ) ) ( OBJ-AT ?auto_1921 ?auto_1908 ) ( OBJ-AT ?auto_1909 ?auto_1923 ) ( OBJ-AT ?auto_1924 ?auto_1908 ) ( TRUCK-AT ?auto_1918 ?auto_1926 ) ( IN-CITY ?auto_1926 ?auto_1927 ) ( IN-CITY ?auto_1923 ?auto_1927 ) ( not ( = ?auto_1923 ?auto_1926 ) ) ( OBJ-AT ?auto_1907 ?auto_1908 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1918 ?auto_1926 ?auto_1923 ?auto_1927 )
      ( DELIVER-3PKG ?auto_1924 ?auto_1909 ?auto_1910 ?auto_1908 )
      ( DELIVER-3PKG-VERIFY ?auto_1907 ?auto_1909 ?auto_1910 ?auto_1908 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1951 - OBJ
      ?auto_1935 - OBJ
      ?auto_1936 - OBJ
      ?auto_1934 - LOCATION
    )
    :vars
    (
      ?auto_1943 - LOCATION
      ?auto_1948 - CITY
      ?auto_1937 - CITY
      ?auto_1942 - LOCATION
      ?auto_1947 - CITY
      ?auto_1949 - TRUCK
      ?auto_1941 - LOCATION
      ?auto_1940 - CITY
      ?auto_1953 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1935 ?auto_1951 ) ( GREATER-THAN ?auto_1936 ?auto_1951 ) ( GREATER-THAN ?auto_1936 ?auto_1935 ) ( IN-CITY ?auto_1943 ?auto_1948 ) ( IN-CITY ?auto_1934 ?auto_1948 ) ( not ( = ?auto_1934 ?auto_1943 ) ) ( OBJ-AT ?auto_1936 ?auto_1943 ) ( IN-CITY ?auto_1934 ?auto_1937 ) ( IN-CITY ?auto_1943 ?auto_1937 ) ( IN-CITY ?auto_1942 ?auto_1947 ) ( IN-CITY ?auto_1934 ?auto_1947 ) ( not ( = ?auto_1934 ?auto_1942 ) ) ( OBJ-AT ?auto_1935 ?auto_1942 ) ( TRUCK-AT ?auto_1949 ?auto_1941 ) ( IN-CITY ?auto_1941 ?auto_1940 ) ( IN-CITY ?auto_1942 ?auto_1940 ) ( not ( = ?auto_1942 ?auto_1941 ) ) ( TRUCK-AT ?auto_1953 ?auto_1934 ) ( IN-TRUCK ?auto_1951 ?auto_1953 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1951 ?auto_1934 )
      ( DELIVER-3PKG ?auto_1951 ?auto_1935 ?auto_1936 ?auto_1934 )
      ( DELIVER-3PKG-VERIFY ?auto_1951 ?auto_1935 ?auto_1936 ?auto_1934 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1960 - OBJ
      ?auto_1962 - OBJ
      ?auto_1963 - OBJ
      ?auto_1961 - LOCATION
    )
    :vars
    (
      ?auto_1974 - LOCATION
      ?auto_1972 - CITY
      ?auto_1976 - CITY
      ?auto_1965 - LOCATION
      ?auto_1971 - CITY
      ?auto_1970 - CITY
      ?auto_1973 - TRUCK
      ?auto_1978 - LOCATION
      ?auto_1979 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1962 ?auto_1960 ) ( GREATER-THAN ?auto_1963 ?auto_1960 ) ( GREATER-THAN ?auto_1963 ?auto_1962 ) ( IN-CITY ?auto_1974 ?auto_1972 ) ( IN-CITY ?auto_1961 ?auto_1972 ) ( not ( = ?auto_1961 ?auto_1974 ) ) ( OBJ-AT ?auto_1963 ?auto_1974 ) ( IN-CITY ?auto_1961 ?auto_1976 ) ( IN-CITY ?auto_1974 ?auto_1976 ) ( IN-CITY ?auto_1965 ?auto_1971 ) ( IN-CITY ?auto_1961 ?auto_1971 ) ( not ( = ?auto_1961 ?auto_1965 ) ) ( OBJ-AT ?auto_1962 ?auto_1965 ) ( IN-CITY ?auto_1961 ?auto_1970 ) ( IN-CITY ?auto_1965 ?auto_1970 ) ( IN-TRUCK ?auto_1960 ?auto_1973 ) ( TRUCK-AT ?auto_1973 ?auto_1978 ) ( IN-CITY ?auto_1978 ?auto_1979 ) ( IN-CITY ?auto_1961 ?auto_1979 ) ( not ( = ?auto_1961 ?auto_1978 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1973 ?auto_1978 ?auto_1961 ?auto_1979 )
      ( DELIVER-3PKG ?auto_1960 ?auto_1962 ?auto_1963 ?auto_1961 )
      ( DELIVER-3PKG-VERIFY ?auto_1960 ?auto_1962 ?auto_1963 ?auto_1961 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1985 - OBJ
      ?auto_1987 - OBJ
      ?auto_1988 - OBJ
      ?auto_1986 - LOCATION
    )
    :vars
    (
      ?auto_1998 - LOCATION
      ?auto_2000 - CITY
      ?auto_1991 - CITY
      ?auto_1995 - LOCATION
      ?auto_1992 - CITY
      ?auto_1993 - CITY
      ?auto_1999 - TRUCK
      ?auto_1989 - LOCATION
      ?auto_1990 - CITY
      ?auto_2003 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1987 ?auto_1985 ) ( GREATER-THAN ?auto_1988 ?auto_1985 ) ( GREATER-THAN ?auto_1988 ?auto_1987 ) ( IN-CITY ?auto_1998 ?auto_2000 ) ( IN-CITY ?auto_1986 ?auto_2000 ) ( not ( = ?auto_1986 ?auto_1998 ) ) ( OBJ-AT ?auto_1988 ?auto_1998 ) ( IN-CITY ?auto_1986 ?auto_1991 ) ( IN-CITY ?auto_1998 ?auto_1991 ) ( IN-CITY ?auto_1995 ?auto_1992 ) ( IN-CITY ?auto_1986 ?auto_1992 ) ( not ( = ?auto_1986 ?auto_1995 ) ) ( OBJ-AT ?auto_1987 ?auto_1995 ) ( IN-CITY ?auto_1986 ?auto_1993 ) ( IN-CITY ?auto_1995 ?auto_1993 ) ( TRUCK-AT ?auto_1999 ?auto_1989 ) ( IN-CITY ?auto_1989 ?auto_1990 ) ( IN-CITY ?auto_1986 ?auto_1990 ) ( not ( = ?auto_1986 ?auto_1989 ) ) ( TRUCK-AT ?auto_1999 ?auto_2003 ) ( OBJ-AT ?auto_1985 ?auto_2003 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1985 ?auto_1999 ?auto_2003 )
      ( DELIVER-3PKG ?auto_1985 ?auto_1987 ?auto_1988 ?auto_1986 )
      ( DELIVER-3PKG-VERIFY ?auto_1985 ?auto_1987 ?auto_1988 ?auto_1986 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2009 - OBJ
      ?auto_2011 - OBJ
      ?auto_2012 - OBJ
      ?auto_2010 - LOCATION
    )
    :vars
    (
      ?auto_2021 - LOCATION
      ?auto_2025 - CITY
      ?auto_2016 - CITY
      ?auto_2017 - LOCATION
      ?auto_2014 - CITY
      ?auto_2018 - CITY
      ?auto_2022 - LOCATION
      ?auto_2023 - CITY
      ?auto_2019 - TRUCK
      ?auto_2028 - LOCATION
      ?auto_2029 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2011 ?auto_2009 ) ( GREATER-THAN ?auto_2012 ?auto_2009 ) ( GREATER-THAN ?auto_2012 ?auto_2011 ) ( IN-CITY ?auto_2021 ?auto_2025 ) ( IN-CITY ?auto_2010 ?auto_2025 ) ( not ( = ?auto_2010 ?auto_2021 ) ) ( OBJ-AT ?auto_2012 ?auto_2021 ) ( IN-CITY ?auto_2010 ?auto_2016 ) ( IN-CITY ?auto_2021 ?auto_2016 ) ( IN-CITY ?auto_2017 ?auto_2014 ) ( IN-CITY ?auto_2010 ?auto_2014 ) ( not ( = ?auto_2010 ?auto_2017 ) ) ( OBJ-AT ?auto_2011 ?auto_2017 ) ( IN-CITY ?auto_2010 ?auto_2018 ) ( IN-CITY ?auto_2017 ?auto_2018 ) ( IN-CITY ?auto_2022 ?auto_2023 ) ( IN-CITY ?auto_2010 ?auto_2023 ) ( not ( = ?auto_2010 ?auto_2022 ) ) ( OBJ-AT ?auto_2009 ?auto_2022 ) ( TRUCK-AT ?auto_2019 ?auto_2028 ) ( IN-CITY ?auto_2028 ?auto_2029 ) ( IN-CITY ?auto_2022 ?auto_2029 ) ( not ( = ?auto_2022 ?auto_2028 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2019 ?auto_2028 ?auto_2022 ?auto_2029 )
      ( DELIVER-3PKG ?auto_2009 ?auto_2011 ?auto_2012 ?auto_2010 )
      ( DELIVER-3PKG-VERIFY ?auto_2009 ?auto_2011 ?auto_2012 ?auto_2010 ) )
  )

)

