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
      ?auto_1678 - OBJ
      ?auto_1679 - LOCATION
    )
    :vars
    (
      ?auto_1680 - TRUCK
      ?auto_1681 - LOCATION
      ?auto_1682 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1680 ?auto_1681 ) ( IN-CITY ?auto_1681 ?auto_1682 ) ( IN-CITY ?auto_1679 ?auto_1682 ) ( not ( = ?auto_1679 ?auto_1681 ) ) ( OBJ-AT ?auto_1678 ?auto_1681 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1678 ?auto_1680 ?auto_1681 )
      ( !DRIVE-TRUCK ?auto_1680 ?auto_1681 ?auto_1679 ?auto_1682 )
      ( !UNLOAD-TRUCK ?auto_1678 ?auto_1680 ?auto_1679 )
      ( DELIVER-1PKG-VERIFY ?auto_1678 ?auto_1679 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1685 - OBJ
      ?auto_1686 - LOCATION
    )
    :vars
    (
      ?auto_1687 - LOCATION
      ?auto_1688 - CITY
      ?auto_1689 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1687 ?auto_1688 ) ( IN-CITY ?auto_1686 ?auto_1688 ) ( not ( = ?auto_1686 ?auto_1687 ) ) ( OBJ-AT ?auto_1685 ?auto_1687 ) ( TRUCK-AT ?auto_1689 ?auto_1686 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1689 ?auto_1686 ?auto_1687 ?auto_1688 )
      ( DELIVER-1PKG ?auto_1685 ?auto_1686 )
      ( DELIVER-1PKG-VERIFY ?auto_1685 ?auto_1686 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1692 - OBJ
      ?auto_1693 - LOCATION
    )
    :vars
    (
      ?auto_1694 - TRUCK
      ?auto_1695 - LOCATION
      ?auto_1696 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1694 ?auto_1695 ) ( IN-CITY ?auto_1695 ?auto_1696 ) ( IN-CITY ?auto_1693 ?auto_1696 ) ( not ( = ?auto_1693 ?auto_1695 ) ) ( OBJ-AT ?auto_1692 ?auto_1695 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1692 ?auto_1694 ?auto_1695 )
      ( !DRIVE-TRUCK ?auto_1694 ?auto_1695 ?auto_1693 ?auto_1696 )
      ( !UNLOAD-TRUCK ?auto_1692 ?auto_1694 ?auto_1693 )
      ( DELIVER-1PKG-VERIFY ?auto_1692 ?auto_1693 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1699 - OBJ
      ?auto_1700 - LOCATION
    )
    :vars
    (
      ?auto_1703 - LOCATION
      ?auto_1701 - CITY
      ?auto_1702 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1703 ?auto_1701 ) ( IN-CITY ?auto_1700 ?auto_1701 ) ( not ( = ?auto_1700 ?auto_1703 ) ) ( OBJ-AT ?auto_1699 ?auto_1703 ) ( TRUCK-AT ?auto_1702 ?auto_1700 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1702 ?auto_1700 ?auto_1703 ?auto_1701 )
      ( DELIVER-1PKG ?auto_1699 ?auto_1700 )
      ( DELIVER-1PKG-VERIFY ?auto_1699 ?auto_1700 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1707 - OBJ
      ?auto_1709 - OBJ
      ?auto_1708 - LOCATION
    )
    :vars
    (
      ?auto_1712 - LOCATION
      ?auto_1711 - CITY
      ?auto_1710 - TRUCK
      ?auto_1713 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1709 ?auto_1707 ) ( IN-CITY ?auto_1712 ?auto_1711 ) ( IN-CITY ?auto_1708 ?auto_1711 ) ( not ( = ?auto_1708 ?auto_1712 ) ) ( OBJ-AT ?auto_1709 ?auto_1712 ) ( TRUCK-AT ?auto_1710 ?auto_1713 ) ( IN-CITY ?auto_1713 ?auto_1711 ) ( not ( = ?auto_1708 ?auto_1713 ) ) ( OBJ-AT ?auto_1707 ?auto_1713 ) ( not ( = ?auto_1707 ?auto_1709 ) ) ( not ( = ?auto_1712 ?auto_1713 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1707 ?auto_1708 )
      ( DELIVER-1PKG ?auto_1709 ?auto_1708 )
      ( DELIVER-2PKG-VERIFY ?auto_1707 ?auto_1709 ?auto_1708 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1717 - OBJ
      ?auto_1719 - OBJ
      ?auto_1718 - LOCATION
    )
    :vars
    (
      ?auto_1723 - LOCATION
      ?auto_1722 - CITY
      ?auto_1720 - LOCATION
      ?auto_1721 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1719 ?auto_1717 ) ( IN-CITY ?auto_1723 ?auto_1722 ) ( IN-CITY ?auto_1718 ?auto_1722 ) ( not ( = ?auto_1718 ?auto_1723 ) ) ( OBJ-AT ?auto_1719 ?auto_1723 ) ( IN-CITY ?auto_1720 ?auto_1722 ) ( not ( = ?auto_1718 ?auto_1720 ) ) ( OBJ-AT ?auto_1717 ?auto_1720 ) ( not ( = ?auto_1717 ?auto_1719 ) ) ( not ( = ?auto_1723 ?auto_1720 ) ) ( TRUCK-AT ?auto_1721 ?auto_1718 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1721 ?auto_1718 ?auto_1720 ?auto_1722 )
      ( DELIVER-2PKG ?auto_1717 ?auto_1719 ?auto_1718 )
      ( DELIVER-2PKG-VERIFY ?auto_1717 ?auto_1719 ?auto_1718 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1726 - OBJ
      ?auto_1727 - LOCATION
    )
    :vars
    (
      ?auto_1728 - TRUCK
      ?auto_1729 - LOCATION
      ?auto_1730 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1728 ?auto_1729 ) ( IN-CITY ?auto_1729 ?auto_1730 ) ( IN-CITY ?auto_1727 ?auto_1730 ) ( not ( = ?auto_1727 ?auto_1729 ) ) ( OBJ-AT ?auto_1726 ?auto_1729 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1726 ?auto_1728 ?auto_1729 )
      ( !DRIVE-TRUCK ?auto_1728 ?auto_1729 ?auto_1727 ?auto_1730 )
      ( !UNLOAD-TRUCK ?auto_1726 ?auto_1728 ?auto_1727 )
      ( DELIVER-1PKG-VERIFY ?auto_1726 ?auto_1727 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1733 - OBJ
      ?auto_1734 - LOCATION
    )
    :vars
    (
      ?auto_1735 - LOCATION
      ?auto_1736 - CITY
      ?auto_1737 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1735 ?auto_1736 ) ( IN-CITY ?auto_1734 ?auto_1736 ) ( not ( = ?auto_1734 ?auto_1735 ) ) ( OBJ-AT ?auto_1733 ?auto_1735 ) ( TRUCK-AT ?auto_1737 ?auto_1734 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1737 ?auto_1734 ?auto_1735 ?auto_1736 )
      ( DELIVER-1PKG ?auto_1733 ?auto_1734 )
      ( DELIVER-1PKG-VERIFY ?auto_1733 ?auto_1734 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1742 - OBJ
      ?auto_1744 - OBJ
      ?auto_1745 - OBJ
      ?auto_1743 - LOCATION
    )
    :vars
    (
      ?auto_1748 - LOCATION
      ?auto_1746 - CITY
      ?auto_1750 - LOCATION
      ?auto_1747 - TRUCK
      ?auto_1749 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1744 ?auto_1742 ) ( GREATER-THAN ?auto_1745 ?auto_1742 ) ( GREATER-THAN ?auto_1745 ?auto_1744 ) ( IN-CITY ?auto_1748 ?auto_1746 ) ( IN-CITY ?auto_1743 ?auto_1746 ) ( not ( = ?auto_1743 ?auto_1748 ) ) ( OBJ-AT ?auto_1745 ?auto_1748 ) ( IN-CITY ?auto_1750 ?auto_1746 ) ( not ( = ?auto_1743 ?auto_1750 ) ) ( OBJ-AT ?auto_1744 ?auto_1750 ) ( TRUCK-AT ?auto_1747 ?auto_1749 ) ( IN-CITY ?auto_1749 ?auto_1746 ) ( not ( = ?auto_1743 ?auto_1749 ) ) ( OBJ-AT ?auto_1742 ?auto_1749 ) ( not ( = ?auto_1742 ?auto_1744 ) ) ( not ( = ?auto_1750 ?auto_1749 ) ) ( not ( = ?auto_1742 ?auto_1745 ) ) ( not ( = ?auto_1744 ?auto_1745 ) ) ( not ( = ?auto_1748 ?auto_1750 ) ) ( not ( = ?auto_1748 ?auto_1749 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1742 ?auto_1744 ?auto_1743 )
      ( DELIVER-1PKG ?auto_1745 ?auto_1743 )
      ( DELIVER-3PKG-VERIFY ?auto_1742 ?auto_1744 ?auto_1745 ?auto_1743 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1755 - OBJ
      ?auto_1757 - OBJ
      ?auto_1758 - OBJ
      ?auto_1756 - LOCATION
    )
    :vars
    (
      ?auto_1762 - LOCATION
      ?auto_1759 - CITY
      ?auto_1760 - LOCATION
      ?auto_1761 - LOCATION
      ?auto_1763 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1757 ?auto_1755 ) ( GREATER-THAN ?auto_1758 ?auto_1755 ) ( GREATER-THAN ?auto_1758 ?auto_1757 ) ( IN-CITY ?auto_1762 ?auto_1759 ) ( IN-CITY ?auto_1756 ?auto_1759 ) ( not ( = ?auto_1756 ?auto_1762 ) ) ( OBJ-AT ?auto_1758 ?auto_1762 ) ( IN-CITY ?auto_1760 ?auto_1759 ) ( not ( = ?auto_1756 ?auto_1760 ) ) ( OBJ-AT ?auto_1757 ?auto_1760 ) ( IN-CITY ?auto_1761 ?auto_1759 ) ( not ( = ?auto_1756 ?auto_1761 ) ) ( OBJ-AT ?auto_1755 ?auto_1761 ) ( not ( = ?auto_1755 ?auto_1757 ) ) ( not ( = ?auto_1760 ?auto_1761 ) ) ( not ( = ?auto_1755 ?auto_1758 ) ) ( not ( = ?auto_1757 ?auto_1758 ) ) ( not ( = ?auto_1762 ?auto_1760 ) ) ( not ( = ?auto_1762 ?auto_1761 ) ) ( TRUCK-AT ?auto_1763 ?auto_1756 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1763 ?auto_1756 ?auto_1761 ?auto_1759 )
      ( DELIVER-3PKG ?auto_1755 ?auto_1757 ?auto_1758 ?auto_1756 )
      ( DELIVER-3PKG-VERIFY ?auto_1755 ?auto_1757 ?auto_1758 ?auto_1756 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1766 - OBJ
      ?auto_1767 - LOCATION
    )
    :vars
    (
      ?auto_1768 - TRUCK
      ?auto_1769 - LOCATION
      ?auto_1770 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1768 ?auto_1769 ) ( IN-CITY ?auto_1769 ?auto_1770 ) ( IN-CITY ?auto_1767 ?auto_1770 ) ( not ( = ?auto_1767 ?auto_1769 ) ) ( OBJ-AT ?auto_1766 ?auto_1769 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1766 ?auto_1768 ?auto_1769 )
      ( !DRIVE-TRUCK ?auto_1768 ?auto_1769 ?auto_1767 ?auto_1770 )
      ( !UNLOAD-TRUCK ?auto_1766 ?auto_1768 ?auto_1767 )
      ( DELIVER-1PKG-VERIFY ?auto_1766 ?auto_1767 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1773 - OBJ
      ?auto_1774 - LOCATION
    )
    :vars
    (
      ?auto_1775 - LOCATION
      ?auto_1776 - CITY
      ?auto_1777 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1775 ?auto_1776 ) ( IN-CITY ?auto_1774 ?auto_1776 ) ( not ( = ?auto_1774 ?auto_1775 ) ) ( OBJ-AT ?auto_1773 ?auto_1775 ) ( TRUCK-AT ?auto_1777 ?auto_1774 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1777 ?auto_1774 ?auto_1775 ?auto_1776 )
      ( DELIVER-1PKG ?auto_1773 ?auto_1774 )
      ( DELIVER-1PKG-VERIFY ?auto_1773 ?auto_1774 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1783 - OBJ
      ?auto_1785 - OBJ
      ?auto_1786 - OBJ
      ?auto_1787 - OBJ
      ?auto_1784 - LOCATION
    )
    :vars
    (
      ?auto_1789 - LOCATION
      ?auto_1790 - CITY
      ?auto_1793 - LOCATION
      ?auto_1791 - LOCATION
      ?auto_1788 - TRUCK
      ?auto_1792 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1785 ?auto_1783 ) ( GREATER-THAN ?auto_1786 ?auto_1783 ) ( GREATER-THAN ?auto_1786 ?auto_1785 ) ( GREATER-THAN ?auto_1787 ?auto_1783 ) ( GREATER-THAN ?auto_1787 ?auto_1785 ) ( GREATER-THAN ?auto_1787 ?auto_1786 ) ( IN-CITY ?auto_1789 ?auto_1790 ) ( IN-CITY ?auto_1784 ?auto_1790 ) ( not ( = ?auto_1784 ?auto_1789 ) ) ( OBJ-AT ?auto_1787 ?auto_1789 ) ( IN-CITY ?auto_1793 ?auto_1790 ) ( not ( = ?auto_1784 ?auto_1793 ) ) ( OBJ-AT ?auto_1786 ?auto_1793 ) ( IN-CITY ?auto_1791 ?auto_1790 ) ( not ( = ?auto_1784 ?auto_1791 ) ) ( OBJ-AT ?auto_1785 ?auto_1791 ) ( TRUCK-AT ?auto_1788 ?auto_1792 ) ( IN-CITY ?auto_1792 ?auto_1790 ) ( not ( = ?auto_1784 ?auto_1792 ) ) ( OBJ-AT ?auto_1783 ?auto_1792 ) ( not ( = ?auto_1783 ?auto_1785 ) ) ( not ( = ?auto_1791 ?auto_1792 ) ) ( not ( = ?auto_1783 ?auto_1786 ) ) ( not ( = ?auto_1785 ?auto_1786 ) ) ( not ( = ?auto_1793 ?auto_1791 ) ) ( not ( = ?auto_1793 ?auto_1792 ) ) ( not ( = ?auto_1783 ?auto_1787 ) ) ( not ( = ?auto_1785 ?auto_1787 ) ) ( not ( = ?auto_1786 ?auto_1787 ) ) ( not ( = ?auto_1789 ?auto_1793 ) ) ( not ( = ?auto_1789 ?auto_1791 ) ) ( not ( = ?auto_1789 ?auto_1792 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1783 ?auto_1785 ?auto_1786 ?auto_1784 )
      ( DELIVER-1PKG ?auto_1787 ?auto_1784 )
      ( DELIVER-4PKG-VERIFY ?auto_1783 ?auto_1785 ?auto_1786 ?auto_1787 ?auto_1784 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1799 - OBJ
      ?auto_1801 - OBJ
      ?auto_1802 - OBJ
      ?auto_1803 - OBJ
      ?auto_1800 - LOCATION
    )
    :vars
    (
      ?auto_1809 - LOCATION
      ?auto_1805 - CITY
      ?auto_1808 - LOCATION
      ?auto_1806 - LOCATION
      ?auto_1804 - LOCATION
      ?auto_1807 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1801 ?auto_1799 ) ( GREATER-THAN ?auto_1802 ?auto_1799 ) ( GREATER-THAN ?auto_1802 ?auto_1801 ) ( GREATER-THAN ?auto_1803 ?auto_1799 ) ( GREATER-THAN ?auto_1803 ?auto_1801 ) ( GREATER-THAN ?auto_1803 ?auto_1802 ) ( IN-CITY ?auto_1809 ?auto_1805 ) ( IN-CITY ?auto_1800 ?auto_1805 ) ( not ( = ?auto_1800 ?auto_1809 ) ) ( OBJ-AT ?auto_1803 ?auto_1809 ) ( IN-CITY ?auto_1808 ?auto_1805 ) ( not ( = ?auto_1800 ?auto_1808 ) ) ( OBJ-AT ?auto_1802 ?auto_1808 ) ( IN-CITY ?auto_1806 ?auto_1805 ) ( not ( = ?auto_1800 ?auto_1806 ) ) ( OBJ-AT ?auto_1801 ?auto_1806 ) ( IN-CITY ?auto_1804 ?auto_1805 ) ( not ( = ?auto_1800 ?auto_1804 ) ) ( OBJ-AT ?auto_1799 ?auto_1804 ) ( not ( = ?auto_1799 ?auto_1801 ) ) ( not ( = ?auto_1806 ?auto_1804 ) ) ( not ( = ?auto_1799 ?auto_1802 ) ) ( not ( = ?auto_1801 ?auto_1802 ) ) ( not ( = ?auto_1808 ?auto_1806 ) ) ( not ( = ?auto_1808 ?auto_1804 ) ) ( not ( = ?auto_1799 ?auto_1803 ) ) ( not ( = ?auto_1801 ?auto_1803 ) ) ( not ( = ?auto_1802 ?auto_1803 ) ) ( not ( = ?auto_1809 ?auto_1808 ) ) ( not ( = ?auto_1809 ?auto_1806 ) ) ( not ( = ?auto_1809 ?auto_1804 ) ) ( TRUCK-AT ?auto_1807 ?auto_1800 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1807 ?auto_1800 ?auto_1804 ?auto_1805 )
      ( DELIVER-4PKG ?auto_1799 ?auto_1801 ?auto_1802 ?auto_1803 ?auto_1800 )
      ( DELIVER-4PKG-VERIFY ?auto_1799 ?auto_1801 ?auto_1802 ?auto_1803 ?auto_1800 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1812 - OBJ
      ?auto_1813 - LOCATION
    )
    :vars
    (
      ?auto_1814 - TRUCK
      ?auto_1815 - LOCATION
      ?auto_1816 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1814 ?auto_1815 ) ( IN-CITY ?auto_1815 ?auto_1816 ) ( IN-CITY ?auto_1813 ?auto_1816 ) ( not ( = ?auto_1813 ?auto_1815 ) ) ( OBJ-AT ?auto_1812 ?auto_1815 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1812 ?auto_1814 ?auto_1815 )
      ( !DRIVE-TRUCK ?auto_1814 ?auto_1815 ?auto_1813 ?auto_1816 )
      ( !UNLOAD-TRUCK ?auto_1812 ?auto_1814 ?auto_1813 )
      ( DELIVER-1PKG-VERIFY ?auto_1812 ?auto_1813 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1819 - OBJ
      ?auto_1820 - LOCATION
    )
    :vars
    (
      ?auto_1822 - LOCATION
      ?auto_1821 - CITY
      ?auto_1823 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1822 ?auto_1821 ) ( IN-CITY ?auto_1820 ?auto_1821 ) ( not ( = ?auto_1820 ?auto_1822 ) ) ( OBJ-AT ?auto_1819 ?auto_1822 ) ( TRUCK-AT ?auto_1823 ?auto_1820 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1823 ?auto_1820 ?auto_1822 ?auto_1821 )
      ( DELIVER-1PKG ?auto_1819 ?auto_1820 )
      ( DELIVER-1PKG-VERIFY ?auto_1819 ?auto_1820 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1830 - OBJ
      ?auto_1832 - OBJ
      ?auto_1833 - OBJ
      ?auto_1835 - OBJ
      ?auto_1834 - OBJ
      ?auto_1831 - LOCATION
    )
    :vars
    (
      ?auto_1836 - LOCATION
      ?auto_1838 - CITY
      ?auto_1841 - LOCATION
      ?auto_1840 - LOCATION
      ?auto_1837 - TRUCK
      ?auto_1839 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1832 ?auto_1830 ) ( GREATER-THAN ?auto_1833 ?auto_1830 ) ( GREATER-THAN ?auto_1833 ?auto_1832 ) ( GREATER-THAN ?auto_1835 ?auto_1830 ) ( GREATER-THAN ?auto_1835 ?auto_1832 ) ( GREATER-THAN ?auto_1835 ?auto_1833 ) ( GREATER-THAN ?auto_1834 ?auto_1830 ) ( GREATER-THAN ?auto_1834 ?auto_1832 ) ( GREATER-THAN ?auto_1834 ?auto_1833 ) ( GREATER-THAN ?auto_1834 ?auto_1835 ) ( IN-CITY ?auto_1836 ?auto_1838 ) ( IN-CITY ?auto_1831 ?auto_1838 ) ( not ( = ?auto_1831 ?auto_1836 ) ) ( OBJ-AT ?auto_1834 ?auto_1836 ) ( IN-CITY ?auto_1841 ?auto_1838 ) ( not ( = ?auto_1831 ?auto_1841 ) ) ( OBJ-AT ?auto_1835 ?auto_1841 ) ( IN-CITY ?auto_1840 ?auto_1838 ) ( not ( = ?auto_1831 ?auto_1840 ) ) ( OBJ-AT ?auto_1833 ?auto_1840 ) ( OBJ-AT ?auto_1832 ?auto_1836 ) ( TRUCK-AT ?auto_1837 ?auto_1839 ) ( IN-CITY ?auto_1839 ?auto_1838 ) ( not ( = ?auto_1831 ?auto_1839 ) ) ( OBJ-AT ?auto_1830 ?auto_1839 ) ( not ( = ?auto_1830 ?auto_1832 ) ) ( not ( = ?auto_1836 ?auto_1839 ) ) ( not ( = ?auto_1830 ?auto_1833 ) ) ( not ( = ?auto_1832 ?auto_1833 ) ) ( not ( = ?auto_1840 ?auto_1836 ) ) ( not ( = ?auto_1840 ?auto_1839 ) ) ( not ( = ?auto_1830 ?auto_1835 ) ) ( not ( = ?auto_1832 ?auto_1835 ) ) ( not ( = ?auto_1833 ?auto_1835 ) ) ( not ( = ?auto_1841 ?auto_1840 ) ) ( not ( = ?auto_1841 ?auto_1836 ) ) ( not ( = ?auto_1841 ?auto_1839 ) ) ( not ( = ?auto_1830 ?auto_1834 ) ) ( not ( = ?auto_1832 ?auto_1834 ) ) ( not ( = ?auto_1833 ?auto_1834 ) ) ( not ( = ?auto_1835 ?auto_1834 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_1830 ?auto_1832 ?auto_1833 ?auto_1835 ?auto_1831 )
      ( DELIVER-1PKG ?auto_1834 ?auto_1831 )
      ( DELIVER-5PKG-VERIFY ?auto_1830 ?auto_1832 ?auto_1833 ?auto_1835 ?auto_1834 ?auto_1831 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1848 - OBJ
      ?auto_1850 - OBJ
      ?auto_1851 - OBJ
      ?auto_1853 - OBJ
      ?auto_1852 - OBJ
      ?auto_1849 - LOCATION
    )
    :vars
    (
      ?auto_1855 - LOCATION
      ?auto_1858 - CITY
      ?auto_1859 - LOCATION
      ?auto_1856 - LOCATION
      ?auto_1857 - LOCATION
      ?auto_1854 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1850 ?auto_1848 ) ( GREATER-THAN ?auto_1851 ?auto_1848 ) ( GREATER-THAN ?auto_1851 ?auto_1850 ) ( GREATER-THAN ?auto_1853 ?auto_1848 ) ( GREATER-THAN ?auto_1853 ?auto_1850 ) ( GREATER-THAN ?auto_1853 ?auto_1851 ) ( GREATER-THAN ?auto_1852 ?auto_1848 ) ( GREATER-THAN ?auto_1852 ?auto_1850 ) ( GREATER-THAN ?auto_1852 ?auto_1851 ) ( GREATER-THAN ?auto_1852 ?auto_1853 ) ( IN-CITY ?auto_1855 ?auto_1858 ) ( IN-CITY ?auto_1849 ?auto_1858 ) ( not ( = ?auto_1849 ?auto_1855 ) ) ( OBJ-AT ?auto_1852 ?auto_1855 ) ( IN-CITY ?auto_1859 ?auto_1858 ) ( not ( = ?auto_1849 ?auto_1859 ) ) ( OBJ-AT ?auto_1853 ?auto_1859 ) ( IN-CITY ?auto_1856 ?auto_1858 ) ( not ( = ?auto_1849 ?auto_1856 ) ) ( OBJ-AT ?auto_1851 ?auto_1856 ) ( OBJ-AT ?auto_1850 ?auto_1855 ) ( IN-CITY ?auto_1857 ?auto_1858 ) ( not ( = ?auto_1849 ?auto_1857 ) ) ( OBJ-AT ?auto_1848 ?auto_1857 ) ( not ( = ?auto_1848 ?auto_1850 ) ) ( not ( = ?auto_1855 ?auto_1857 ) ) ( not ( = ?auto_1848 ?auto_1851 ) ) ( not ( = ?auto_1850 ?auto_1851 ) ) ( not ( = ?auto_1856 ?auto_1855 ) ) ( not ( = ?auto_1856 ?auto_1857 ) ) ( not ( = ?auto_1848 ?auto_1853 ) ) ( not ( = ?auto_1850 ?auto_1853 ) ) ( not ( = ?auto_1851 ?auto_1853 ) ) ( not ( = ?auto_1859 ?auto_1856 ) ) ( not ( = ?auto_1859 ?auto_1855 ) ) ( not ( = ?auto_1859 ?auto_1857 ) ) ( not ( = ?auto_1848 ?auto_1852 ) ) ( not ( = ?auto_1850 ?auto_1852 ) ) ( not ( = ?auto_1851 ?auto_1852 ) ) ( not ( = ?auto_1853 ?auto_1852 ) ) ( TRUCK-AT ?auto_1854 ?auto_1849 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1854 ?auto_1849 ?auto_1857 ?auto_1858 )
      ( DELIVER-5PKG ?auto_1848 ?auto_1850 ?auto_1851 ?auto_1853 ?auto_1852 ?auto_1849 )
      ( DELIVER-5PKG-VERIFY ?auto_1848 ?auto_1850 ?auto_1851 ?auto_1853 ?auto_1852 ?auto_1849 ) )
  )

)

