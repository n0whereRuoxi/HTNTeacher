( define ( domain zenotravel )
  ( :requirements :strips :typing :htn )
  ( :types aircraft city flevel person )
  ( :predicates
    ( PERSON-AT ?x - PERSON ?c - CITY )
    ( AIRCRAFT-AT ?y - AIRCRAFT ?c - CITY )
    ( IN ?p - PERSON ?a - AIRCRAFT )
    ( FUEL-LEVEL ?a - AIRCRAFT ?l - FLEVEL )
    ( NEXT ?l1 - FLEVEL ?l2 - FLEVEL )
  )
  ( :action !BOARD
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( PERSON-AT ?p ?c ) ) ( IN ?p ?a ) )
  )
  ( :action !DEBARK
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( IN ?p ?a ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( IN ?p ?a ) ) ( PERSON-AT ?p ?c ) )
  )
  ( :action !FLY
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l2 ) )
  )
  ( :action !ZOOM
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
      ?l3 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) ( NEXT ?l3 ?l2 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l3 ) )
  )
  ( :action !REFUEL
    :parameters
    (
      ?a - AIRCRAFT
      ?c - CITY
      ?l - FLEVEL
      ?l1 - FLEVEL
    )
    :precondition
    ( and ( FUEL-LEVEL ?a ?l ) ( NEXT ?l ?l1 ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( FUEL-LEVEL ?a ?l1 ) ( not ( FUEL-LEVEL ?a ?l ) ) )
  )
  ( :method TRAVEL
    :parameters
    (
      ?p - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-2PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1666 - PERSON
      ?auto_1665 - CITY
    )
    :vars
    (
      ?auto_1667 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_1666 ?auto_1667 ) ( AIRCRAFT-AT ?auto_1667 ?auto_1665 ) )
    :subtasks
    ( ( !DEBARK ?auto_1666 ?auto_1667 ?auto_1665 )
      ( FLY-1PPL-VERIFY ?auto_1666 ?auto_1665 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1673 - PERSON
      ?auto_1672 - CITY
    )
    :vars
    (
      ?auto_1674 - AIRCRAFT
      ?auto_1677 - CITY
      ?auto_1675 - FLEVEL
      ?auto_1676 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_1673 ?auto_1674 ) ( AIRCRAFT-AT ?auto_1674 ?auto_1677 ) ( FUEL-LEVEL ?auto_1674 ?auto_1675 ) ( NEXT ?auto_1676 ?auto_1675 ) ( not ( = ?auto_1672 ?auto_1677 ) ) ( not ( = ?auto_1675 ?auto_1676 ) ) )
    :subtasks
    ( ( !FLY ?auto_1674 ?auto_1677 ?auto_1672 ?auto_1675 ?auto_1676 )
      ( FLY-1PPL ?auto_1673 ?auto_1672 )
      ( FLY-1PPL-VERIFY ?auto_1673 ?auto_1672 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1686 - PERSON
      ?auto_1685 - CITY
    )
    :vars
    (
      ?auto_1689 - AIRCRAFT
      ?auto_1688 - CITY
      ?auto_1690 - FLEVEL
      ?auto_1687 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1689 ?auto_1688 ) ( FUEL-LEVEL ?auto_1689 ?auto_1690 ) ( NEXT ?auto_1687 ?auto_1690 ) ( not ( = ?auto_1685 ?auto_1688 ) ) ( not ( = ?auto_1690 ?auto_1687 ) ) ( PERSON-AT ?auto_1686 ?auto_1688 ) )
    :subtasks
    ( ( !BOARD ?auto_1686 ?auto_1689 ?auto_1688 )
      ( FLY-1PPL ?auto_1686 ?auto_1685 )
      ( FLY-1PPL-VERIFY ?auto_1686 ?auto_1685 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1699 - PERSON
      ?auto_1698 - CITY
    )
    :vars
    (
      ?auto_1700 - AIRCRAFT
      ?auto_1703 - CITY
      ?auto_1702 - FLEVEL
      ?auto_1701 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1700 ?auto_1703 ) ( NEXT ?auto_1702 ?auto_1701 ) ( not ( = ?auto_1698 ?auto_1703 ) ) ( not ( = ?auto_1701 ?auto_1702 ) ) ( PERSON-AT ?auto_1699 ?auto_1703 ) ( FUEL-LEVEL ?auto_1700 ?auto_1702 ) )
    :subtasks
    ( ( !REFUEL ?auto_1700 ?auto_1703 ?auto_1702 ?auto_1701 )
      ( FLY-1PPL ?auto_1699 ?auto_1698 )
      ( FLY-1PPL-VERIFY ?auto_1699 ?auto_1698 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1712 - PERSON
      ?auto_1711 - CITY
    )
    :vars
    (
      ?auto_1714 - FLEVEL
      ?auto_1715 - FLEVEL
      ?auto_1716 - CITY
      ?auto_1713 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1714 ?auto_1715 ) ( not ( = ?auto_1711 ?auto_1716 ) ) ( not ( = ?auto_1715 ?auto_1714 ) ) ( PERSON-AT ?auto_1712 ?auto_1716 ) ( AIRCRAFT-AT ?auto_1713 ?auto_1711 ) ( FUEL-LEVEL ?auto_1713 ?auto_1715 ) )
    :subtasks
    ( ( !FLY ?auto_1713 ?auto_1711 ?auto_1716 ?auto_1715 ?auto_1714 )
      ( FLY-1PPL ?auto_1712 ?auto_1711 )
      ( FLY-1PPL-VERIFY ?auto_1712 ?auto_1711 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1725 - PERSON
      ?auto_1724 - CITY
    )
    :vars
    (
      ?auto_1729 - FLEVEL
      ?auto_1728 - FLEVEL
      ?auto_1726 - CITY
      ?auto_1727 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1729 ?auto_1728 ) ( not ( = ?auto_1724 ?auto_1726 ) ) ( not ( = ?auto_1728 ?auto_1729 ) ) ( PERSON-AT ?auto_1725 ?auto_1726 ) ( AIRCRAFT-AT ?auto_1727 ?auto_1724 ) ( FUEL-LEVEL ?auto_1727 ?auto_1729 ) )
    :subtasks
    ( ( !REFUEL ?auto_1727 ?auto_1724 ?auto_1729 ?auto_1728 )
      ( FLY-1PPL ?auto_1725 ?auto_1724 )
      ( FLY-1PPL-VERIFY ?auto_1725 ?auto_1724 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1752 - PERSON
      ?auto_1753 - PERSON
      ?auto_1751 - CITY
    )
    :vars
    (
      ?auto_1754 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_1753 ?auto_1754 ) ( AIRCRAFT-AT ?auto_1754 ?auto_1751 ) ( PERSON-AT ?auto_1752 ?auto_1751 ) ( not ( = ?auto_1752 ?auto_1753 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1753 ?auto_1751 )
      ( FLY-2PPL-VERIFY ?auto_1752 ?auto_1753 ?auto_1751 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1756 - PERSON
      ?auto_1757 - PERSON
      ?auto_1755 - CITY
    )
    :vars
    (
      ?auto_1758 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_1756 ?auto_1758 ) ( AIRCRAFT-AT ?auto_1758 ?auto_1755 ) ( PERSON-AT ?auto_1757 ?auto_1755 ) ( not ( = ?auto_1756 ?auto_1757 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1756 ?auto_1755 )
      ( FLY-2PPL-VERIFY ?auto_1756 ?auto_1757 ?auto_1755 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1770 - PERSON
      ?auto_1771 - PERSON
      ?auto_1769 - CITY
    )
    :vars
    (
      ?auto_1773 - AIRCRAFT
      ?auto_1774 - CITY
      ?auto_1772 - FLEVEL
      ?auto_1775 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_1771 ?auto_1773 ) ( AIRCRAFT-AT ?auto_1773 ?auto_1774 ) ( FUEL-LEVEL ?auto_1773 ?auto_1772 ) ( NEXT ?auto_1775 ?auto_1772 ) ( not ( = ?auto_1769 ?auto_1774 ) ) ( not ( = ?auto_1772 ?auto_1775 ) ) ( PERSON-AT ?auto_1770 ?auto_1769 ) ( not ( = ?auto_1770 ?auto_1771 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1771 ?auto_1769 )
      ( FLY-2PPL-VERIFY ?auto_1770 ?auto_1771 ?auto_1769 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1777 - PERSON
      ?auto_1778 - PERSON
      ?auto_1776 - CITY
    )
    :vars
    (
      ?auto_1779 - AIRCRAFT
      ?auto_1782 - CITY
      ?auto_1780 - FLEVEL
      ?auto_1781 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_1777 ?auto_1779 ) ( AIRCRAFT-AT ?auto_1779 ?auto_1782 ) ( FUEL-LEVEL ?auto_1779 ?auto_1780 ) ( NEXT ?auto_1781 ?auto_1780 ) ( not ( = ?auto_1776 ?auto_1782 ) ) ( not ( = ?auto_1780 ?auto_1781 ) ) ( PERSON-AT ?auto_1778 ?auto_1776 ) ( not ( = ?auto_1778 ?auto_1777 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1778 ?auto_1777 ?auto_1776 )
      ( FLY-2PPL-VERIFY ?auto_1777 ?auto_1778 ?auto_1776 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1792 - PERSON
      ?auto_1791 - CITY
    )
    :vars
    (
      ?auto_1793 - AIRCRAFT
      ?auto_1796 - CITY
      ?auto_1794 - FLEVEL
      ?auto_1795 - FLEVEL
      ?auto_1797 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1793 ?auto_1796 ) ( FUEL-LEVEL ?auto_1793 ?auto_1794 ) ( NEXT ?auto_1795 ?auto_1794 ) ( not ( = ?auto_1791 ?auto_1796 ) ) ( not ( = ?auto_1794 ?auto_1795 ) ) ( PERSON-AT ?auto_1797 ?auto_1791 ) ( not ( = ?auto_1797 ?auto_1792 ) ) ( PERSON-AT ?auto_1792 ?auto_1796 ) )
    :subtasks
    ( ( !BOARD ?auto_1792 ?auto_1793 ?auto_1796 )
      ( FLY-2PPL ?auto_1797 ?auto_1792 ?auto_1791 )
      ( FLY-1PPL-VERIFY ?auto_1792 ?auto_1791 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1799 - PERSON
      ?auto_1800 - PERSON
      ?auto_1798 - CITY
    )
    :vars
    (
      ?auto_1804 - AIRCRAFT
      ?auto_1803 - CITY
      ?auto_1802 - FLEVEL
      ?auto_1801 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1804 ?auto_1803 ) ( FUEL-LEVEL ?auto_1804 ?auto_1802 ) ( NEXT ?auto_1801 ?auto_1802 ) ( not ( = ?auto_1798 ?auto_1803 ) ) ( not ( = ?auto_1802 ?auto_1801 ) ) ( PERSON-AT ?auto_1799 ?auto_1798 ) ( not ( = ?auto_1799 ?auto_1800 ) ) ( PERSON-AT ?auto_1800 ?auto_1803 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1800 ?auto_1798 )
      ( FLY-2PPL-VERIFY ?auto_1799 ?auto_1800 ?auto_1798 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1806 - PERSON
      ?auto_1807 - PERSON
      ?auto_1805 - CITY
    )
    :vars
    (
      ?auto_1809 - AIRCRAFT
      ?auto_1810 - CITY
      ?auto_1811 - FLEVEL
      ?auto_1808 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1809 ?auto_1810 ) ( FUEL-LEVEL ?auto_1809 ?auto_1811 ) ( NEXT ?auto_1808 ?auto_1811 ) ( not ( = ?auto_1805 ?auto_1810 ) ) ( not ( = ?auto_1811 ?auto_1808 ) ) ( PERSON-AT ?auto_1807 ?auto_1805 ) ( not ( = ?auto_1807 ?auto_1806 ) ) ( PERSON-AT ?auto_1806 ?auto_1810 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1807 ?auto_1806 ?auto_1805 )
      ( FLY-2PPL-VERIFY ?auto_1806 ?auto_1807 ?auto_1805 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1821 - PERSON
      ?auto_1820 - CITY
    )
    :vars
    (
      ?auto_1823 - AIRCRAFT
      ?auto_1825 - CITY
      ?auto_1822 - FLEVEL
      ?auto_1826 - FLEVEL
      ?auto_1824 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1823 ?auto_1825 ) ( NEXT ?auto_1822 ?auto_1826 ) ( not ( = ?auto_1820 ?auto_1825 ) ) ( not ( = ?auto_1826 ?auto_1822 ) ) ( PERSON-AT ?auto_1824 ?auto_1820 ) ( not ( = ?auto_1824 ?auto_1821 ) ) ( PERSON-AT ?auto_1821 ?auto_1825 ) ( FUEL-LEVEL ?auto_1823 ?auto_1822 ) )
    :subtasks
    ( ( !REFUEL ?auto_1823 ?auto_1825 ?auto_1822 ?auto_1826 )
      ( FLY-2PPL ?auto_1824 ?auto_1821 ?auto_1820 )
      ( FLY-1PPL-VERIFY ?auto_1821 ?auto_1820 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1828 - PERSON
      ?auto_1829 - PERSON
      ?auto_1827 - CITY
    )
    :vars
    (
      ?auto_1833 - AIRCRAFT
      ?auto_1832 - CITY
      ?auto_1831 - FLEVEL
      ?auto_1830 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1833 ?auto_1832 ) ( NEXT ?auto_1831 ?auto_1830 ) ( not ( = ?auto_1827 ?auto_1832 ) ) ( not ( = ?auto_1830 ?auto_1831 ) ) ( PERSON-AT ?auto_1828 ?auto_1827 ) ( not ( = ?auto_1828 ?auto_1829 ) ) ( PERSON-AT ?auto_1829 ?auto_1832 ) ( FUEL-LEVEL ?auto_1833 ?auto_1831 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1829 ?auto_1827 )
      ( FLY-2PPL-VERIFY ?auto_1828 ?auto_1829 ?auto_1827 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1835 - PERSON
      ?auto_1836 - PERSON
      ?auto_1834 - CITY
    )
    :vars
    (
      ?auto_1839 - AIRCRAFT
      ?auto_1837 - CITY
      ?auto_1840 - FLEVEL
      ?auto_1838 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_1839 ?auto_1837 ) ( NEXT ?auto_1840 ?auto_1838 ) ( not ( = ?auto_1834 ?auto_1837 ) ) ( not ( = ?auto_1838 ?auto_1840 ) ) ( PERSON-AT ?auto_1836 ?auto_1834 ) ( not ( = ?auto_1836 ?auto_1835 ) ) ( PERSON-AT ?auto_1835 ?auto_1837 ) ( FUEL-LEVEL ?auto_1839 ?auto_1840 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1836 ?auto_1835 ?auto_1834 )
      ( FLY-2PPL-VERIFY ?auto_1835 ?auto_1836 ?auto_1834 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1850 - PERSON
      ?auto_1849 - CITY
    )
    :vars
    (
      ?auto_1855 - FLEVEL
      ?auto_1853 - FLEVEL
      ?auto_1852 - CITY
      ?auto_1851 - PERSON
      ?auto_1854 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1855 ?auto_1853 ) ( not ( = ?auto_1849 ?auto_1852 ) ) ( not ( = ?auto_1853 ?auto_1855 ) ) ( PERSON-AT ?auto_1851 ?auto_1849 ) ( not ( = ?auto_1851 ?auto_1850 ) ) ( PERSON-AT ?auto_1850 ?auto_1852 ) ( AIRCRAFT-AT ?auto_1854 ?auto_1849 ) ( FUEL-LEVEL ?auto_1854 ?auto_1853 ) )
    :subtasks
    ( ( !FLY ?auto_1854 ?auto_1849 ?auto_1852 ?auto_1853 ?auto_1855 )
      ( FLY-2PPL ?auto_1851 ?auto_1850 ?auto_1849 )
      ( FLY-1PPL-VERIFY ?auto_1850 ?auto_1849 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1857 - PERSON
      ?auto_1858 - PERSON
      ?auto_1856 - CITY
    )
    :vars
    (
      ?auto_1862 - FLEVEL
      ?auto_1859 - FLEVEL
      ?auto_1860 - CITY
      ?auto_1861 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1862 ?auto_1859 ) ( not ( = ?auto_1856 ?auto_1860 ) ) ( not ( = ?auto_1859 ?auto_1862 ) ) ( PERSON-AT ?auto_1857 ?auto_1856 ) ( not ( = ?auto_1857 ?auto_1858 ) ) ( PERSON-AT ?auto_1858 ?auto_1860 ) ( AIRCRAFT-AT ?auto_1861 ?auto_1856 ) ( FUEL-LEVEL ?auto_1861 ?auto_1859 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1858 ?auto_1856 )
      ( FLY-2PPL-VERIFY ?auto_1857 ?auto_1858 ?auto_1856 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1864 - PERSON
      ?auto_1865 - PERSON
      ?auto_1863 - CITY
    )
    :vars
    (
      ?auto_1867 - FLEVEL
      ?auto_1868 - FLEVEL
      ?auto_1866 - CITY
      ?auto_1869 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1867 ?auto_1868 ) ( not ( = ?auto_1863 ?auto_1866 ) ) ( not ( = ?auto_1868 ?auto_1867 ) ) ( PERSON-AT ?auto_1865 ?auto_1863 ) ( not ( = ?auto_1865 ?auto_1864 ) ) ( PERSON-AT ?auto_1864 ?auto_1866 ) ( AIRCRAFT-AT ?auto_1869 ?auto_1863 ) ( FUEL-LEVEL ?auto_1869 ?auto_1868 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1865 ?auto_1864 ?auto_1863 )
      ( FLY-2PPL-VERIFY ?auto_1864 ?auto_1865 ?auto_1863 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1879 - PERSON
      ?auto_1878 - CITY
    )
    :vars
    (
      ?auto_1881 - FLEVEL
      ?auto_1882 - FLEVEL
      ?auto_1880 - CITY
      ?auto_1884 - PERSON
      ?auto_1883 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1881 ?auto_1882 ) ( not ( = ?auto_1878 ?auto_1880 ) ) ( not ( = ?auto_1882 ?auto_1881 ) ) ( PERSON-AT ?auto_1884 ?auto_1878 ) ( not ( = ?auto_1884 ?auto_1879 ) ) ( PERSON-AT ?auto_1879 ?auto_1880 ) ( AIRCRAFT-AT ?auto_1883 ?auto_1878 ) ( FUEL-LEVEL ?auto_1883 ?auto_1881 ) )
    :subtasks
    ( ( !REFUEL ?auto_1883 ?auto_1878 ?auto_1881 ?auto_1882 )
      ( FLY-2PPL ?auto_1884 ?auto_1879 ?auto_1878 )
      ( FLY-1PPL-VERIFY ?auto_1879 ?auto_1878 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1886 - PERSON
      ?auto_1887 - PERSON
      ?auto_1885 - CITY
    )
    :vars
    (
      ?auto_1889 - FLEVEL
      ?auto_1888 - FLEVEL
      ?auto_1890 - CITY
      ?auto_1891 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1889 ?auto_1888 ) ( not ( = ?auto_1885 ?auto_1890 ) ) ( not ( = ?auto_1888 ?auto_1889 ) ) ( PERSON-AT ?auto_1886 ?auto_1885 ) ( not ( = ?auto_1886 ?auto_1887 ) ) ( PERSON-AT ?auto_1887 ?auto_1890 ) ( AIRCRAFT-AT ?auto_1891 ?auto_1885 ) ( FUEL-LEVEL ?auto_1891 ?auto_1889 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1887 ?auto_1885 )
      ( FLY-2PPL-VERIFY ?auto_1886 ?auto_1887 ?auto_1885 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1893 - PERSON
      ?auto_1894 - PERSON
      ?auto_1892 - CITY
    )
    :vars
    (
      ?auto_1898 - FLEVEL
      ?auto_1896 - FLEVEL
      ?auto_1897 - CITY
      ?auto_1895 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1898 ?auto_1896 ) ( not ( = ?auto_1892 ?auto_1897 ) ) ( not ( = ?auto_1896 ?auto_1898 ) ) ( PERSON-AT ?auto_1894 ?auto_1892 ) ( not ( = ?auto_1894 ?auto_1893 ) ) ( PERSON-AT ?auto_1893 ?auto_1897 ) ( AIRCRAFT-AT ?auto_1895 ?auto_1892 ) ( FUEL-LEVEL ?auto_1895 ?auto_1898 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1894 ?auto_1893 ?auto_1892 )
      ( FLY-2PPL-VERIFY ?auto_1893 ?auto_1894 ?auto_1892 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1908 - PERSON
      ?auto_1907 - CITY
    )
    :vars
    (
      ?auto_1913 - FLEVEL
      ?auto_1911 - FLEVEL
      ?auto_1912 - CITY
      ?auto_1909 - PERSON
      ?auto_1910 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1913 ?auto_1911 ) ( not ( = ?auto_1907 ?auto_1912 ) ) ( not ( = ?auto_1911 ?auto_1913 ) ) ( not ( = ?auto_1909 ?auto_1908 ) ) ( PERSON-AT ?auto_1908 ?auto_1912 ) ( AIRCRAFT-AT ?auto_1910 ?auto_1907 ) ( FUEL-LEVEL ?auto_1910 ?auto_1913 ) ( IN ?auto_1909 ?auto_1910 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1909 ?auto_1907 )
      ( FLY-2PPL ?auto_1909 ?auto_1908 ?auto_1907 )
      ( FLY-1PPL-VERIFY ?auto_1908 ?auto_1907 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1915 - PERSON
      ?auto_1916 - PERSON
      ?auto_1914 - CITY
    )
    :vars
    (
      ?auto_1918 - FLEVEL
      ?auto_1919 - FLEVEL
      ?auto_1917 - CITY
      ?auto_1920 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1918 ?auto_1919 ) ( not ( = ?auto_1914 ?auto_1917 ) ) ( not ( = ?auto_1919 ?auto_1918 ) ) ( not ( = ?auto_1915 ?auto_1916 ) ) ( PERSON-AT ?auto_1916 ?auto_1917 ) ( AIRCRAFT-AT ?auto_1920 ?auto_1914 ) ( FUEL-LEVEL ?auto_1920 ?auto_1918 ) ( IN ?auto_1915 ?auto_1920 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1916 ?auto_1914 )
      ( FLY-2PPL-VERIFY ?auto_1915 ?auto_1916 ?auto_1914 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1922 - PERSON
      ?auto_1923 - PERSON
      ?auto_1921 - CITY
    )
    :vars
    (
      ?auto_1925 - FLEVEL
      ?auto_1926 - FLEVEL
      ?auto_1924 - CITY
      ?auto_1927 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1925 ?auto_1926 ) ( not ( = ?auto_1921 ?auto_1924 ) ) ( not ( = ?auto_1926 ?auto_1925 ) ) ( not ( = ?auto_1923 ?auto_1922 ) ) ( PERSON-AT ?auto_1922 ?auto_1924 ) ( AIRCRAFT-AT ?auto_1927 ?auto_1921 ) ( FUEL-LEVEL ?auto_1927 ?auto_1925 ) ( IN ?auto_1923 ?auto_1927 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1923 ?auto_1922 ?auto_1921 )
      ( FLY-2PPL-VERIFY ?auto_1922 ?auto_1923 ?auto_1921 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_1937 - PERSON
      ?auto_1936 - CITY
    )
    :vars
    (
      ?auto_1939 - FLEVEL
      ?auto_1941 - FLEVEL
      ?auto_1938 - CITY
      ?auto_1940 - PERSON
      ?auto_1942 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1939 ?auto_1941 ) ( not ( = ?auto_1936 ?auto_1938 ) ) ( not ( = ?auto_1941 ?auto_1939 ) ) ( not ( = ?auto_1940 ?auto_1937 ) ) ( PERSON-AT ?auto_1937 ?auto_1938 ) ( IN ?auto_1940 ?auto_1942 ) ( AIRCRAFT-AT ?auto_1942 ?auto_1938 ) ( FUEL-LEVEL ?auto_1942 ?auto_1941 ) )
    :subtasks
    ( ( !FLY ?auto_1942 ?auto_1938 ?auto_1936 ?auto_1941 ?auto_1939 )
      ( FLY-2PPL ?auto_1940 ?auto_1937 ?auto_1936 )
      ( FLY-1PPL-VERIFY ?auto_1937 ?auto_1936 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1944 - PERSON
      ?auto_1945 - PERSON
      ?auto_1943 - CITY
    )
    :vars
    (
      ?auto_1948 - FLEVEL
      ?auto_1947 - FLEVEL
      ?auto_1949 - CITY
      ?auto_1946 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1948 ?auto_1947 ) ( not ( = ?auto_1943 ?auto_1949 ) ) ( not ( = ?auto_1947 ?auto_1948 ) ) ( not ( = ?auto_1944 ?auto_1945 ) ) ( PERSON-AT ?auto_1945 ?auto_1949 ) ( IN ?auto_1944 ?auto_1946 ) ( AIRCRAFT-AT ?auto_1946 ?auto_1949 ) ( FUEL-LEVEL ?auto_1946 ?auto_1947 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_1945 ?auto_1943 )
      ( FLY-2PPL-VERIFY ?auto_1944 ?auto_1945 ?auto_1943 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_1951 - PERSON
      ?auto_1952 - PERSON
      ?auto_1950 - CITY
    )
    :vars
    (
      ?auto_1956 - FLEVEL
      ?auto_1954 - FLEVEL
      ?auto_1955 - CITY
      ?auto_1953 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_1956 ?auto_1954 ) ( not ( = ?auto_1950 ?auto_1955 ) ) ( not ( = ?auto_1954 ?auto_1956 ) ) ( not ( = ?auto_1952 ?auto_1951 ) ) ( PERSON-AT ?auto_1951 ?auto_1955 ) ( IN ?auto_1952 ?auto_1953 ) ( AIRCRAFT-AT ?auto_1953 ?auto_1955 ) ( FUEL-LEVEL ?auto_1953 ?auto_1954 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_1952 ?auto_1951 ?auto_1950 )
      ( FLY-2PPL-VERIFY ?auto_1951 ?auto_1952 ?auto_1950 ) )
  )

)

