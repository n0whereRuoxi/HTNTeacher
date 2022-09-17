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

  ( :method DELIVER-6PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-7PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?obj7 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) ( OBJ-AT ?obj7 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1687 - OBJ
      ?auto_1688 - LOCATION
    )
    :vars
    (
      ?auto_1690 - LOCATION
      ?auto_1691 - CITY
      ?auto_1689 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1690 ?auto_1691 ) ( IN-CITY ?auto_1688 ?auto_1691 ) ( not ( = ?auto_1688 ?auto_1690 ) ) ( OBJ-AT ?auto_1687 ?auto_1690 ) ( TRUCK-AT ?auto_1689 ?auto_1688 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1689 ?auto_1688 ?auto_1690 ?auto_1691 )
      ( !LOAD-TRUCK ?auto_1687 ?auto_1689 ?auto_1690 )
      ( !DRIVE-TRUCK ?auto_1689 ?auto_1690 ?auto_1688 ?auto_1691 )
      ( !UNLOAD-TRUCK ?auto_1687 ?auto_1689 ?auto_1688 )
      ( DELIVER-1PKG-VERIFY ?auto_1687 ?auto_1688 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1702 - OBJ
      ?auto_1704 - OBJ
      ?auto_1703 - LOCATION
    )
    :vars
    (
      ?auto_1705 - LOCATION
      ?auto_1707 - CITY
      ?auto_1708 - LOCATION
      ?auto_1706 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1704 ?auto_1702 ) ( IN-CITY ?auto_1705 ?auto_1707 ) ( IN-CITY ?auto_1703 ?auto_1707 ) ( not ( = ?auto_1703 ?auto_1705 ) ) ( OBJ-AT ?auto_1704 ?auto_1705 ) ( IN-CITY ?auto_1708 ?auto_1707 ) ( not ( = ?auto_1703 ?auto_1708 ) ) ( OBJ-AT ?auto_1702 ?auto_1708 ) ( TRUCK-AT ?auto_1706 ?auto_1703 ) ( not ( = ?auto_1702 ?auto_1704 ) ) ( not ( = ?auto_1705 ?auto_1708 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1702 ?auto_1703 )
      ( DELIVER-1PKG ?auto_1704 ?auto_1703 )
      ( DELIVER-2PKG-VERIFY ?auto_1702 ?auto_1704 ?auto_1703 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1720 - OBJ
      ?auto_1722 - OBJ
      ?auto_1723 - OBJ
      ?auto_1721 - LOCATION
    )
    :vars
    (
      ?auto_1724 - LOCATION
      ?auto_1726 - CITY
      ?auto_1728 - LOCATION
      ?auto_1727 - LOCATION
      ?auto_1725 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1722 ?auto_1720 ) ( GREATER-THAN ?auto_1723 ?auto_1720 ) ( GREATER-THAN ?auto_1723 ?auto_1722 ) ( IN-CITY ?auto_1724 ?auto_1726 ) ( IN-CITY ?auto_1721 ?auto_1726 ) ( not ( = ?auto_1721 ?auto_1724 ) ) ( OBJ-AT ?auto_1723 ?auto_1724 ) ( IN-CITY ?auto_1728 ?auto_1726 ) ( not ( = ?auto_1721 ?auto_1728 ) ) ( OBJ-AT ?auto_1722 ?auto_1728 ) ( IN-CITY ?auto_1727 ?auto_1726 ) ( not ( = ?auto_1721 ?auto_1727 ) ) ( OBJ-AT ?auto_1720 ?auto_1727 ) ( TRUCK-AT ?auto_1725 ?auto_1721 ) ( not ( = ?auto_1720 ?auto_1722 ) ) ( not ( = ?auto_1728 ?auto_1727 ) ) ( not ( = ?auto_1720 ?auto_1723 ) ) ( not ( = ?auto_1722 ?auto_1723 ) ) ( not ( = ?auto_1724 ?auto_1728 ) ) ( not ( = ?auto_1724 ?auto_1727 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1720 ?auto_1722 ?auto_1721 )
      ( DELIVER-1PKG ?auto_1723 ?auto_1721 )
      ( DELIVER-3PKG-VERIFY ?auto_1720 ?auto_1722 ?auto_1723 ?auto_1721 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1741 - OBJ
      ?auto_1743 - OBJ
      ?auto_1744 - OBJ
      ?auto_1745 - OBJ
      ?auto_1742 - LOCATION
    )
    :vars
    (
      ?auto_1747 - LOCATION
      ?auto_1746 - CITY
      ?auto_1750 - LOCATION
      ?auto_1749 - LOCATION
      ?auto_1748 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1743 ?auto_1741 ) ( GREATER-THAN ?auto_1744 ?auto_1741 ) ( GREATER-THAN ?auto_1744 ?auto_1743 ) ( GREATER-THAN ?auto_1745 ?auto_1741 ) ( GREATER-THAN ?auto_1745 ?auto_1743 ) ( GREATER-THAN ?auto_1745 ?auto_1744 ) ( IN-CITY ?auto_1747 ?auto_1746 ) ( IN-CITY ?auto_1742 ?auto_1746 ) ( not ( = ?auto_1742 ?auto_1747 ) ) ( OBJ-AT ?auto_1745 ?auto_1747 ) ( IN-CITY ?auto_1750 ?auto_1746 ) ( not ( = ?auto_1742 ?auto_1750 ) ) ( OBJ-AT ?auto_1744 ?auto_1750 ) ( IN-CITY ?auto_1749 ?auto_1746 ) ( not ( = ?auto_1742 ?auto_1749 ) ) ( OBJ-AT ?auto_1743 ?auto_1749 ) ( OBJ-AT ?auto_1741 ?auto_1747 ) ( TRUCK-AT ?auto_1748 ?auto_1742 ) ( not ( = ?auto_1741 ?auto_1743 ) ) ( not ( = ?auto_1749 ?auto_1747 ) ) ( not ( = ?auto_1741 ?auto_1744 ) ) ( not ( = ?auto_1743 ?auto_1744 ) ) ( not ( = ?auto_1750 ?auto_1749 ) ) ( not ( = ?auto_1750 ?auto_1747 ) ) ( not ( = ?auto_1741 ?auto_1745 ) ) ( not ( = ?auto_1743 ?auto_1745 ) ) ( not ( = ?auto_1744 ?auto_1745 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1741 ?auto_1743 ?auto_1744 ?auto_1742 )
      ( DELIVER-1PKG ?auto_1745 ?auto_1742 )
      ( DELIVER-4PKG-VERIFY ?auto_1741 ?auto_1743 ?auto_1744 ?auto_1745 ?auto_1742 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1764 - OBJ
      ?auto_1766 - OBJ
      ?auto_1767 - OBJ
      ?auto_1768 - OBJ
      ?auto_1769 - OBJ
      ?auto_1765 - LOCATION
    )
    :vars
    (
      ?auto_1772 - LOCATION
      ?auto_1770 - CITY
      ?auto_1773 - LOCATION
      ?auto_1774 - LOCATION
      ?auto_1771 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1766 ?auto_1764 ) ( GREATER-THAN ?auto_1767 ?auto_1764 ) ( GREATER-THAN ?auto_1767 ?auto_1766 ) ( GREATER-THAN ?auto_1768 ?auto_1764 ) ( GREATER-THAN ?auto_1768 ?auto_1766 ) ( GREATER-THAN ?auto_1768 ?auto_1767 ) ( GREATER-THAN ?auto_1769 ?auto_1764 ) ( GREATER-THAN ?auto_1769 ?auto_1766 ) ( GREATER-THAN ?auto_1769 ?auto_1767 ) ( GREATER-THAN ?auto_1769 ?auto_1768 ) ( IN-CITY ?auto_1772 ?auto_1770 ) ( IN-CITY ?auto_1765 ?auto_1770 ) ( not ( = ?auto_1765 ?auto_1772 ) ) ( OBJ-AT ?auto_1769 ?auto_1772 ) ( OBJ-AT ?auto_1768 ?auto_1772 ) ( IN-CITY ?auto_1773 ?auto_1770 ) ( not ( = ?auto_1765 ?auto_1773 ) ) ( OBJ-AT ?auto_1767 ?auto_1773 ) ( IN-CITY ?auto_1774 ?auto_1770 ) ( not ( = ?auto_1765 ?auto_1774 ) ) ( OBJ-AT ?auto_1766 ?auto_1774 ) ( OBJ-AT ?auto_1764 ?auto_1772 ) ( TRUCK-AT ?auto_1771 ?auto_1765 ) ( not ( = ?auto_1764 ?auto_1766 ) ) ( not ( = ?auto_1774 ?auto_1772 ) ) ( not ( = ?auto_1764 ?auto_1767 ) ) ( not ( = ?auto_1766 ?auto_1767 ) ) ( not ( = ?auto_1773 ?auto_1774 ) ) ( not ( = ?auto_1773 ?auto_1772 ) ) ( not ( = ?auto_1764 ?auto_1768 ) ) ( not ( = ?auto_1766 ?auto_1768 ) ) ( not ( = ?auto_1767 ?auto_1768 ) ) ( not ( = ?auto_1764 ?auto_1769 ) ) ( not ( = ?auto_1766 ?auto_1769 ) ) ( not ( = ?auto_1767 ?auto_1769 ) ) ( not ( = ?auto_1768 ?auto_1769 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_1764 ?auto_1766 ?auto_1767 ?auto_1768 ?auto_1765 )
      ( DELIVER-1PKG ?auto_1769 ?auto_1765 )
      ( DELIVER-5PKG-VERIFY ?auto_1764 ?auto_1766 ?auto_1767 ?auto_1768 ?auto_1769 ?auto_1765 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1789 - OBJ
      ?auto_1791 - OBJ
      ?auto_1792 - OBJ
      ?auto_1793 - OBJ
      ?auto_1794 - OBJ
      ?auto_1795 - OBJ
      ?auto_1790 - LOCATION
    )
    :vars
    (
      ?auto_1798 - LOCATION
      ?auto_1796 - CITY
      ?auto_1800 - LOCATION
      ?auto_1799 - LOCATION
      ?auto_1797 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1791 ?auto_1789 ) ( GREATER-THAN ?auto_1792 ?auto_1789 ) ( GREATER-THAN ?auto_1792 ?auto_1791 ) ( GREATER-THAN ?auto_1793 ?auto_1789 ) ( GREATER-THAN ?auto_1793 ?auto_1791 ) ( GREATER-THAN ?auto_1793 ?auto_1792 ) ( GREATER-THAN ?auto_1794 ?auto_1789 ) ( GREATER-THAN ?auto_1794 ?auto_1791 ) ( GREATER-THAN ?auto_1794 ?auto_1792 ) ( GREATER-THAN ?auto_1794 ?auto_1793 ) ( GREATER-THAN ?auto_1795 ?auto_1789 ) ( GREATER-THAN ?auto_1795 ?auto_1791 ) ( GREATER-THAN ?auto_1795 ?auto_1792 ) ( GREATER-THAN ?auto_1795 ?auto_1793 ) ( GREATER-THAN ?auto_1795 ?auto_1794 ) ( IN-CITY ?auto_1798 ?auto_1796 ) ( IN-CITY ?auto_1790 ?auto_1796 ) ( not ( = ?auto_1790 ?auto_1798 ) ) ( OBJ-AT ?auto_1795 ?auto_1798 ) ( OBJ-AT ?auto_1794 ?auto_1798 ) ( OBJ-AT ?auto_1793 ?auto_1798 ) ( IN-CITY ?auto_1800 ?auto_1796 ) ( not ( = ?auto_1790 ?auto_1800 ) ) ( OBJ-AT ?auto_1792 ?auto_1800 ) ( IN-CITY ?auto_1799 ?auto_1796 ) ( not ( = ?auto_1790 ?auto_1799 ) ) ( OBJ-AT ?auto_1791 ?auto_1799 ) ( OBJ-AT ?auto_1789 ?auto_1798 ) ( TRUCK-AT ?auto_1797 ?auto_1790 ) ( not ( = ?auto_1789 ?auto_1791 ) ) ( not ( = ?auto_1799 ?auto_1798 ) ) ( not ( = ?auto_1789 ?auto_1792 ) ) ( not ( = ?auto_1791 ?auto_1792 ) ) ( not ( = ?auto_1800 ?auto_1799 ) ) ( not ( = ?auto_1800 ?auto_1798 ) ) ( not ( = ?auto_1789 ?auto_1793 ) ) ( not ( = ?auto_1791 ?auto_1793 ) ) ( not ( = ?auto_1792 ?auto_1793 ) ) ( not ( = ?auto_1789 ?auto_1794 ) ) ( not ( = ?auto_1791 ?auto_1794 ) ) ( not ( = ?auto_1792 ?auto_1794 ) ) ( not ( = ?auto_1793 ?auto_1794 ) ) ( not ( = ?auto_1789 ?auto_1795 ) ) ( not ( = ?auto_1791 ?auto_1795 ) ) ( not ( = ?auto_1792 ?auto_1795 ) ) ( not ( = ?auto_1793 ?auto_1795 ) ) ( not ( = ?auto_1794 ?auto_1795 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1789 ?auto_1791 ?auto_1792 ?auto_1793 ?auto_1794 ?auto_1790 )
      ( DELIVER-1PKG ?auto_1795 ?auto_1790 )
      ( DELIVER-6PKG-VERIFY ?auto_1789 ?auto_1791 ?auto_1792 ?auto_1793 ?auto_1794 ?auto_1795 ?auto_1790 ) )
  )

  ( :method DELIVER-7PKG
    :parameters
    (
      ?auto_1816 - OBJ
      ?auto_1818 - OBJ
      ?auto_1819 - OBJ
      ?auto_1820 - OBJ
      ?auto_1821 - OBJ
      ?auto_1822 - OBJ
      ?auto_1823 - OBJ
      ?auto_1817 - LOCATION
    )
    :vars
    (
      ?auto_1824 - LOCATION
      ?auto_1826 - CITY
      ?auto_1828 - LOCATION
      ?auto_1827 - LOCATION
      ?auto_1825 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1818 ?auto_1816 ) ( GREATER-THAN ?auto_1819 ?auto_1816 ) ( GREATER-THAN ?auto_1819 ?auto_1818 ) ( GREATER-THAN ?auto_1820 ?auto_1816 ) ( GREATER-THAN ?auto_1820 ?auto_1818 ) ( GREATER-THAN ?auto_1820 ?auto_1819 ) ( GREATER-THAN ?auto_1821 ?auto_1816 ) ( GREATER-THAN ?auto_1821 ?auto_1818 ) ( GREATER-THAN ?auto_1821 ?auto_1819 ) ( GREATER-THAN ?auto_1821 ?auto_1820 ) ( GREATER-THAN ?auto_1822 ?auto_1816 ) ( GREATER-THAN ?auto_1822 ?auto_1818 ) ( GREATER-THAN ?auto_1822 ?auto_1819 ) ( GREATER-THAN ?auto_1822 ?auto_1820 ) ( GREATER-THAN ?auto_1822 ?auto_1821 ) ( GREATER-THAN ?auto_1823 ?auto_1816 ) ( GREATER-THAN ?auto_1823 ?auto_1818 ) ( GREATER-THAN ?auto_1823 ?auto_1819 ) ( GREATER-THAN ?auto_1823 ?auto_1820 ) ( GREATER-THAN ?auto_1823 ?auto_1821 ) ( GREATER-THAN ?auto_1823 ?auto_1822 ) ( IN-CITY ?auto_1824 ?auto_1826 ) ( IN-CITY ?auto_1817 ?auto_1826 ) ( not ( = ?auto_1817 ?auto_1824 ) ) ( OBJ-AT ?auto_1823 ?auto_1824 ) ( IN-CITY ?auto_1828 ?auto_1826 ) ( not ( = ?auto_1817 ?auto_1828 ) ) ( OBJ-AT ?auto_1822 ?auto_1828 ) ( OBJ-AT ?auto_1821 ?auto_1828 ) ( OBJ-AT ?auto_1820 ?auto_1828 ) ( OBJ-AT ?auto_1819 ?auto_1824 ) ( IN-CITY ?auto_1827 ?auto_1826 ) ( not ( = ?auto_1817 ?auto_1827 ) ) ( OBJ-AT ?auto_1818 ?auto_1827 ) ( OBJ-AT ?auto_1816 ?auto_1828 ) ( TRUCK-AT ?auto_1825 ?auto_1817 ) ( not ( = ?auto_1816 ?auto_1818 ) ) ( not ( = ?auto_1827 ?auto_1828 ) ) ( not ( = ?auto_1816 ?auto_1819 ) ) ( not ( = ?auto_1818 ?auto_1819 ) ) ( not ( = ?auto_1824 ?auto_1827 ) ) ( not ( = ?auto_1824 ?auto_1828 ) ) ( not ( = ?auto_1816 ?auto_1820 ) ) ( not ( = ?auto_1818 ?auto_1820 ) ) ( not ( = ?auto_1819 ?auto_1820 ) ) ( not ( = ?auto_1816 ?auto_1821 ) ) ( not ( = ?auto_1818 ?auto_1821 ) ) ( not ( = ?auto_1819 ?auto_1821 ) ) ( not ( = ?auto_1820 ?auto_1821 ) ) ( not ( = ?auto_1816 ?auto_1822 ) ) ( not ( = ?auto_1818 ?auto_1822 ) ) ( not ( = ?auto_1819 ?auto_1822 ) ) ( not ( = ?auto_1820 ?auto_1822 ) ) ( not ( = ?auto_1821 ?auto_1822 ) ) ( not ( = ?auto_1816 ?auto_1823 ) ) ( not ( = ?auto_1818 ?auto_1823 ) ) ( not ( = ?auto_1819 ?auto_1823 ) ) ( not ( = ?auto_1820 ?auto_1823 ) ) ( not ( = ?auto_1821 ?auto_1823 ) ) ( not ( = ?auto_1822 ?auto_1823 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1816 ?auto_1818 ?auto_1819 ?auto_1820 ?auto_1821 ?auto_1822 ?auto_1817 )
      ( DELIVER-1PKG ?auto_1823 ?auto_1817 )
      ( DELIVER-7PKG-VERIFY ?auto_1816 ?auto_1818 ?auto_1819 ?auto_1820 ?auto_1821 ?auto_1822 ?auto_1823 ?auto_1817 ) )
  )

)

