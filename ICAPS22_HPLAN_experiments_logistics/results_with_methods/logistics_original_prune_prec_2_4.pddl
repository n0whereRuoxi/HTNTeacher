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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1609 - OBJ
      ?auto_1610 - LOCATION
    )
    :vars
    (
      ?auto_1611 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1611 ?auto_1610 ) ( IN-TRUCK ?auto_1609 ?auto_1611 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1609 ?auto_1611 ?auto_1610 )
      ( DELIVER-1PKG-VERIFY ?auto_1609 ?auto_1610 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1620 - OBJ
      ?auto_1621 - LOCATION
    )
    :vars
    (
      ?auto_1622 - TRUCK
      ?auto_1626 - LOCATION
      ?auto_1627 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1620 ?auto_1622 ) ( TRUCK-AT ?auto_1622 ?auto_1626 ) ( IN-CITY ?auto_1626 ?auto_1627 ) ( IN-CITY ?auto_1621 ?auto_1627 ) ( not ( = ?auto_1621 ?auto_1626 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1622 ?auto_1626 ?auto_1621 ?auto_1627 )
      ( DELIVER-1PKG ?auto_1620 ?auto_1621 )
      ( DELIVER-1PKG-VERIFY ?auto_1620 ?auto_1621 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1637 - OBJ
      ?auto_1638 - LOCATION
    )
    :vars
    (
      ?auto_1642 - TRUCK
      ?auto_1639 - LOCATION
      ?auto_1641 - CITY
      ?auto_1645 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1642 ?auto_1639 ) ( IN-CITY ?auto_1639 ?auto_1641 ) ( IN-CITY ?auto_1638 ?auto_1641 ) ( not ( = ?auto_1638 ?auto_1639 ) ) ( TRUCK-AT ?auto_1642 ?auto_1645 ) ( OBJ-AT ?auto_1637 ?auto_1645 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1637 ?auto_1642 ?auto_1645 )
      ( DELIVER-1PKG ?auto_1637 ?auto_1638 )
      ( DELIVER-1PKG-VERIFY ?auto_1637 ?auto_1638 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1656 - OBJ
      ?auto_1657 - LOCATION
    )
    :vars
    (
      ?auto_1658 - LOCATION
      ?auto_1663 - CITY
      ?auto_1661 - TRUCK
      ?auto_1665 - LOCATION
      ?auto_1666 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_1658 ?auto_1663 ) ( IN-CITY ?auto_1657 ?auto_1663 ) ( not ( = ?auto_1657 ?auto_1658 ) ) ( OBJ-AT ?auto_1656 ?auto_1658 ) ( TRUCK-AT ?auto_1661 ?auto_1665 ) ( IN-CITY ?auto_1665 ?auto_1666 ) ( IN-CITY ?auto_1658 ?auto_1666 ) ( not ( = ?auto_1658 ?auto_1665 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1661 ?auto_1665 ?auto_1658 ?auto_1666 )
      ( DELIVER-1PKG ?auto_1656 ?auto_1657 )
      ( DELIVER-1PKG-VERIFY ?auto_1656 ?auto_1657 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1694 - OBJ
      ?auto_1696 - OBJ
      ?auto_1695 - LOCATION
    )
    :vars
    (
      ?auto_1697 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1696 ?auto_1694 ) ( TRUCK-AT ?auto_1697 ?auto_1695 ) ( IN-TRUCK ?auto_1696 ?auto_1697 ) ( OBJ-AT ?auto_1694 ?auto_1695 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1696 ?auto_1695 )
      ( DELIVER-2PKG-VERIFY ?auto_1694 ?auto_1696 ?auto_1695 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1721 - OBJ
      ?auto_1723 - OBJ
      ?auto_1722 - LOCATION
    )
    :vars
    (
      ?auto_1724 - TRUCK
      ?auto_1727 - LOCATION
      ?auto_1728 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1723 ?auto_1721 ) ( IN-TRUCK ?auto_1723 ?auto_1724 ) ( TRUCK-AT ?auto_1724 ?auto_1727 ) ( IN-CITY ?auto_1727 ?auto_1728 ) ( IN-CITY ?auto_1722 ?auto_1728 ) ( not ( = ?auto_1722 ?auto_1727 ) ) ( OBJ-AT ?auto_1721 ?auto_1722 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1723 ?auto_1722 )
      ( DELIVER-2PKG-VERIFY ?auto_1721 ?auto_1723 ?auto_1722 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1747 - OBJ
      ?auto_1748 - LOCATION
    )
    :vars
    (
      ?auto_1751 - OBJ
      ?auto_1752 - TRUCK
      ?auto_1754 - LOCATION
      ?auto_1749 - CITY
      ?auto_1756 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1747 ?auto_1751 ) ( TRUCK-AT ?auto_1752 ?auto_1754 ) ( IN-CITY ?auto_1754 ?auto_1749 ) ( IN-CITY ?auto_1748 ?auto_1749 ) ( not ( = ?auto_1748 ?auto_1754 ) ) ( OBJ-AT ?auto_1751 ?auto_1748 ) ( TRUCK-AT ?auto_1752 ?auto_1756 ) ( OBJ-AT ?auto_1747 ?auto_1756 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1747 ?auto_1752 ?auto_1756 )
      ( DELIVER-2PKG ?auto_1751 ?auto_1747 ?auto_1748 )
      ( DELIVER-1PKG-VERIFY ?auto_1747 ?auto_1748 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1758 - OBJ
      ?auto_1760 - OBJ
      ?auto_1759 - LOCATION
    )
    :vars
    (
      ?auto_1761 - OBJ
      ?auto_1762 - TRUCK
      ?auto_1767 - LOCATION
      ?auto_1764 - CITY
      ?auto_1766 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1760 ?auto_1758 ) ( GREATER-THAN ?auto_1760 ?auto_1761 ) ( TRUCK-AT ?auto_1762 ?auto_1767 ) ( IN-CITY ?auto_1767 ?auto_1764 ) ( IN-CITY ?auto_1759 ?auto_1764 ) ( not ( = ?auto_1759 ?auto_1767 ) ) ( OBJ-AT ?auto_1761 ?auto_1759 ) ( TRUCK-AT ?auto_1762 ?auto_1766 ) ( OBJ-AT ?auto_1760 ?auto_1766 ) ( OBJ-AT ?auto_1758 ?auto_1759 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1760 ?auto_1759 )
      ( DELIVER-2PKG-VERIFY ?auto_1758 ?auto_1760 ?auto_1759 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1790 - OBJ
      ?auto_1791 - LOCATION
    )
    :vars
    (
      ?auto_1799 - OBJ
      ?auto_1795 - OBJ
      ?auto_1793 - LOCATION
      ?auto_1797 - CITY
      ?auto_1796 - TRUCK
      ?auto_1801 - LOCATION
      ?auto_1802 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1790 ?auto_1799 ) ( GREATER-THAN ?auto_1790 ?auto_1795 ) ( IN-CITY ?auto_1793 ?auto_1797 ) ( IN-CITY ?auto_1791 ?auto_1797 ) ( not ( = ?auto_1791 ?auto_1793 ) ) ( OBJ-AT ?auto_1795 ?auto_1791 ) ( OBJ-AT ?auto_1790 ?auto_1793 ) ( OBJ-AT ?auto_1799 ?auto_1791 ) ( TRUCK-AT ?auto_1796 ?auto_1801 ) ( IN-CITY ?auto_1801 ?auto_1802 ) ( IN-CITY ?auto_1793 ?auto_1802 ) ( not ( = ?auto_1793 ?auto_1801 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1796 ?auto_1801 ?auto_1793 ?auto_1802 )
      ( DELIVER-2PKG ?auto_1799 ?auto_1790 ?auto_1791 )
      ( DELIVER-1PKG-VERIFY ?auto_1790 ?auto_1791 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1804 - OBJ
      ?auto_1806 - OBJ
      ?auto_1805 - LOCATION
    )
    :vars
    (
      ?auto_1815 - OBJ
      ?auto_1807 - OBJ
      ?auto_1812 - LOCATION
      ?auto_1810 - CITY
      ?auto_1809 - TRUCK
      ?auto_1808 - LOCATION
      ?auto_1814 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1806 ?auto_1804 ) ( GREATER-THAN ?auto_1806 ?auto_1815 ) ( GREATER-THAN ?auto_1806 ?auto_1807 ) ( IN-CITY ?auto_1812 ?auto_1810 ) ( IN-CITY ?auto_1805 ?auto_1810 ) ( not ( = ?auto_1805 ?auto_1812 ) ) ( OBJ-AT ?auto_1807 ?auto_1805 ) ( OBJ-AT ?auto_1806 ?auto_1812 ) ( OBJ-AT ?auto_1815 ?auto_1805 ) ( TRUCK-AT ?auto_1809 ?auto_1808 ) ( IN-CITY ?auto_1808 ?auto_1814 ) ( IN-CITY ?auto_1812 ?auto_1814 ) ( not ( = ?auto_1812 ?auto_1808 ) ) ( OBJ-AT ?auto_1804 ?auto_1805 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1806 ?auto_1805 )
      ( DELIVER-2PKG-VERIFY ?auto_1804 ?auto_1806 ?auto_1805 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1842 - OBJ
      ?auto_1843 - LOCATION
    )
    :vars
    (
      ?auto_1845 - OBJ
      ?auto_1853 - LOCATION
      ?auto_1846 - CITY
      ?auto_1852 - TRUCK
      ?auto_1848 - LOCATION
      ?auto_1847 - CITY
      ?auto_1854 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1842 ?auto_1845 ) ( IN-CITY ?auto_1853 ?auto_1846 ) ( IN-CITY ?auto_1843 ?auto_1846 ) ( not ( = ?auto_1843 ?auto_1853 ) ) ( OBJ-AT ?auto_1842 ?auto_1853 ) ( TRUCK-AT ?auto_1852 ?auto_1848 ) ( IN-CITY ?auto_1848 ?auto_1847 ) ( IN-CITY ?auto_1853 ?auto_1847 ) ( not ( = ?auto_1853 ?auto_1848 ) ) ( TRUCK-AT ?auto_1854 ?auto_1843 ) ( IN-TRUCK ?auto_1845 ?auto_1854 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1845 ?auto_1843 )
      ( DELIVER-2PKG ?auto_1845 ?auto_1842 ?auto_1843 )
      ( DELIVER-1PKG-VERIFY ?auto_1842 ?auto_1843 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1857 - OBJ
      ?auto_1859 - OBJ
      ?auto_1858 - LOCATION
    )
    :vars
    (
      ?auto_1865 - LOCATION
      ?auto_1866 - CITY
      ?auto_1861 - TRUCK
      ?auto_1863 - LOCATION
      ?auto_1862 - CITY
      ?auto_1864 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1859 ?auto_1857 ) ( IN-CITY ?auto_1865 ?auto_1866 ) ( IN-CITY ?auto_1858 ?auto_1866 ) ( not ( = ?auto_1858 ?auto_1865 ) ) ( OBJ-AT ?auto_1859 ?auto_1865 ) ( TRUCK-AT ?auto_1861 ?auto_1863 ) ( IN-CITY ?auto_1863 ?auto_1862 ) ( IN-CITY ?auto_1865 ?auto_1862 ) ( not ( = ?auto_1865 ?auto_1863 ) ) ( TRUCK-AT ?auto_1864 ?auto_1858 ) ( IN-TRUCK ?auto_1857 ?auto_1864 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1859 ?auto_1858 )
      ( DELIVER-2PKG-VERIFY ?auto_1857 ?auto_1859 ?auto_1858 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1893 - OBJ
      ?auto_1894 - LOCATION
    )
    :vars
    (
      ?auto_1902 - OBJ
      ?auto_1897 - LOCATION
      ?auto_1898 - CITY
      ?auto_1896 - CITY
      ?auto_1899 - TRUCK
      ?auto_1905 - LOCATION
      ?auto_1906 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1893 ?auto_1902 ) ( IN-CITY ?auto_1897 ?auto_1898 ) ( IN-CITY ?auto_1894 ?auto_1898 ) ( not ( = ?auto_1894 ?auto_1897 ) ) ( OBJ-AT ?auto_1893 ?auto_1897 ) ( IN-CITY ?auto_1894 ?auto_1896 ) ( IN-CITY ?auto_1897 ?auto_1896 ) ( IN-TRUCK ?auto_1902 ?auto_1899 ) ( TRUCK-AT ?auto_1899 ?auto_1905 ) ( IN-CITY ?auto_1905 ?auto_1906 ) ( IN-CITY ?auto_1894 ?auto_1906 ) ( not ( = ?auto_1894 ?auto_1905 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1899 ?auto_1905 ?auto_1894 ?auto_1906 )
      ( DELIVER-2PKG ?auto_1902 ?auto_1893 ?auto_1894 )
      ( DELIVER-1PKG-VERIFY ?auto_1893 ?auto_1894 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1908 - OBJ
      ?auto_1910 - OBJ
      ?auto_1909 - LOCATION
    )
    :vars
    (
      ?auto_1915 - LOCATION
      ?auto_1919 - CITY
      ?auto_1912 - CITY
      ?auto_1913 - TRUCK
      ?auto_1917 - LOCATION
      ?auto_1918 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1910 ?auto_1908 ) ( IN-CITY ?auto_1915 ?auto_1919 ) ( IN-CITY ?auto_1909 ?auto_1919 ) ( not ( = ?auto_1909 ?auto_1915 ) ) ( OBJ-AT ?auto_1910 ?auto_1915 ) ( IN-CITY ?auto_1909 ?auto_1912 ) ( IN-CITY ?auto_1915 ?auto_1912 ) ( IN-TRUCK ?auto_1908 ?auto_1913 ) ( TRUCK-AT ?auto_1913 ?auto_1917 ) ( IN-CITY ?auto_1917 ?auto_1918 ) ( IN-CITY ?auto_1909 ?auto_1918 ) ( not ( = ?auto_1909 ?auto_1917 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1910 ?auto_1909 )
      ( DELIVER-2PKG-VERIFY ?auto_1908 ?auto_1910 ?auto_1909 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1944 - OBJ
      ?auto_1945 - LOCATION
    )
    :vars
    (
      ?auto_1952 - OBJ
      ?auto_1951 - LOCATION
      ?auto_1949 - CITY
      ?auto_1948 - CITY
      ?auto_1946 - TRUCK
      ?auto_1947 - LOCATION
      ?auto_1950 - CITY
      ?auto_1956 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1944 ?auto_1952 ) ( IN-CITY ?auto_1951 ?auto_1949 ) ( IN-CITY ?auto_1945 ?auto_1949 ) ( not ( = ?auto_1945 ?auto_1951 ) ) ( OBJ-AT ?auto_1944 ?auto_1951 ) ( IN-CITY ?auto_1945 ?auto_1948 ) ( IN-CITY ?auto_1951 ?auto_1948 ) ( TRUCK-AT ?auto_1946 ?auto_1947 ) ( IN-CITY ?auto_1947 ?auto_1950 ) ( IN-CITY ?auto_1945 ?auto_1950 ) ( not ( = ?auto_1945 ?auto_1947 ) ) ( TRUCK-AT ?auto_1946 ?auto_1956 ) ( OBJ-AT ?auto_1952 ?auto_1956 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1952 ?auto_1946 ?auto_1956 )
      ( DELIVER-2PKG ?auto_1952 ?auto_1944 ?auto_1945 )
      ( DELIVER-1PKG-VERIFY ?auto_1944 ?auto_1945 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1958 - OBJ
      ?auto_1960 - OBJ
      ?auto_1959 - LOCATION
    )
    :vars
    (
      ?auto_1970 - LOCATION
      ?auto_1964 - CITY
      ?auto_1966 - CITY
      ?auto_1969 - TRUCK
      ?auto_1968 - LOCATION
      ?auto_1967 - CITY
      ?auto_1965 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1960 ?auto_1958 ) ( IN-CITY ?auto_1970 ?auto_1964 ) ( IN-CITY ?auto_1959 ?auto_1964 ) ( not ( = ?auto_1959 ?auto_1970 ) ) ( OBJ-AT ?auto_1960 ?auto_1970 ) ( IN-CITY ?auto_1959 ?auto_1966 ) ( IN-CITY ?auto_1970 ?auto_1966 ) ( TRUCK-AT ?auto_1969 ?auto_1968 ) ( IN-CITY ?auto_1968 ?auto_1967 ) ( IN-CITY ?auto_1959 ?auto_1967 ) ( not ( = ?auto_1959 ?auto_1968 ) ) ( TRUCK-AT ?auto_1969 ?auto_1965 ) ( OBJ-AT ?auto_1958 ?auto_1965 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1960 ?auto_1959 )
      ( DELIVER-2PKG-VERIFY ?auto_1958 ?auto_1960 ?auto_1959 ) )
  )

)

