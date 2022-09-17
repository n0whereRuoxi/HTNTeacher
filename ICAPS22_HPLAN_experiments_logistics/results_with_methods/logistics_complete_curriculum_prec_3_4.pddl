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
      ?auto_1753 - OBJ
      ?auto_1754 - LOCATION
    )
    :vars
    (
      ?auto_1755 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1755 ?auto_1754 ) ( IN-TRUCK ?auto_1753 ?auto_1755 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1753 ?auto_1755 ?auto_1754 )
      ( DELIVER-1PKG-VERIFY ?auto_1753 ?auto_1754 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1758 - OBJ
      ?auto_1759 - LOCATION
    )
    :vars
    (
      ?auto_1760 - TRUCK
      ?auto_1761 - LOCATION
      ?auto_1762 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1758 ?auto_1760 ) ( TRUCK-AT ?auto_1760 ?auto_1761 ) ( IN-CITY ?auto_1761 ?auto_1762 ) ( IN-CITY ?auto_1759 ?auto_1762 ) ( not ( = ?auto_1759 ?auto_1761 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1760 ?auto_1761 ?auto_1759 ?auto_1762 )
      ( DELIVER-1PKG ?auto_1758 ?auto_1759 )
      ( DELIVER-1PKG-VERIFY ?auto_1758 ?auto_1759 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1765 - OBJ
      ?auto_1766 - LOCATION
    )
    :vars
    (
      ?auto_1768 - TRUCK
      ?auto_1769 - LOCATION
      ?auto_1767 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1768 ?auto_1769 ) ( IN-CITY ?auto_1769 ?auto_1767 ) ( IN-CITY ?auto_1766 ?auto_1767 ) ( not ( = ?auto_1766 ?auto_1769 ) ) ( OBJ-AT ?auto_1765 ?auto_1769 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1765 ?auto_1768 ?auto_1769 )
      ( DELIVER-1PKG ?auto_1765 ?auto_1766 )
      ( DELIVER-1PKG-VERIFY ?auto_1765 ?auto_1766 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1772 - OBJ
      ?auto_1773 - LOCATION
    )
    :vars
    (
      ?auto_1776 - LOCATION
      ?auto_1774 - CITY
      ?auto_1775 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1776 ?auto_1774 ) ( IN-CITY ?auto_1773 ?auto_1774 ) ( not ( = ?auto_1773 ?auto_1776 ) ) ( OBJ-AT ?auto_1772 ?auto_1776 ) ( TRUCK-AT ?auto_1775 ?auto_1773 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1775 ?auto_1773 ?auto_1776 ?auto_1774 )
      ( DELIVER-1PKG ?auto_1772 ?auto_1773 )
      ( DELIVER-1PKG-VERIFY ?auto_1772 ?auto_1773 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1779 - OBJ
      ?auto_1780 - LOCATION
    )
    :vars
    (
      ?auto_1781 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1781 ?auto_1780 ) ( IN-TRUCK ?auto_1779 ?auto_1781 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1779 ?auto_1781 ?auto_1780 )
      ( DELIVER-1PKG-VERIFY ?auto_1779 ?auto_1780 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1784 - OBJ
      ?auto_1785 - LOCATION
    )
    :vars
    (
      ?auto_1786 - TRUCK
      ?auto_1787 - LOCATION
      ?auto_1788 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1784 ?auto_1786 ) ( TRUCK-AT ?auto_1786 ?auto_1787 ) ( IN-CITY ?auto_1787 ?auto_1788 ) ( IN-CITY ?auto_1785 ?auto_1788 ) ( not ( = ?auto_1785 ?auto_1787 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1786 ?auto_1787 ?auto_1785 ?auto_1788 )
      ( DELIVER-1PKG ?auto_1784 ?auto_1785 )
      ( DELIVER-1PKG-VERIFY ?auto_1784 ?auto_1785 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1791 - OBJ
      ?auto_1792 - LOCATION
    )
    :vars
    (
      ?auto_1794 - TRUCK
      ?auto_1795 - LOCATION
      ?auto_1793 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1794 ?auto_1795 ) ( IN-CITY ?auto_1795 ?auto_1793 ) ( IN-CITY ?auto_1792 ?auto_1793 ) ( not ( = ?auto_1792 ?auto_1795 ) ) ( OBJ-AT ?auto_1791 ?auto_1795 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1791 ?auto_1794 ?auto_1795 )
      ( DELIVER-1PKG ?auto_1791 ?auto_1792 )
      ( DELIVER-1PKG-VERIFY ?auto_1791 ?auto_1792 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1798 - OBJ
      ?auto_1799 - LOCATION
    )
    :vars
    (
      ?auto_1800 - LOCATION
      ?auto_1801 - CITY
      ?auto_1802 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1800 ?auto_1801 ) ( IN-CITY ?auto_1799 ?auto_1801 ) ( not ( = ?auto_1799 ?auto_1800 ) ) ( OBJ-AT ?auto_1798 ?auto_1800 ) ( TRUCK-AT ?auto_1802 ?auto_1799 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1802 ?auto_1799 ?auto_1800 ?auto_1801 )
      ( DELIVER-1PKG ?auto_1798 ?auto_1799 )
      ( DELIVER-1PKG-VERIFY ?auto_1798 ?auto_1799 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1806 - OBJ
      ?auto_1808 - OBJ
      ?auto_1807 - LOCATION
    )
    :vars
    (
      ?auto_1809 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1808 ?auto_1806 ) ( TRUCK-AT ?auto_1809 ?auto_1807 ) ( IN-TRUCK ?auto_1808 ?auto_1809 ) ( OBJ-AT ?auto_1806 ?auto_1807 ) ( not ( = ?auto_1806 ?auto_1808 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1808 ?auto_1807 )
      ( DELIVER-2PKG-VERIFY ?auto_1806 ?auto_1808 ?auto_1807 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1813 - OBJ
      ?auto_1815 - OBJ
      ?auto_1814 - LOCATION
    )
    :vars
    (
      ?auto_1817 - TRUCK
      ?auto_1818 - LOCATION
      ?auto_1816 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1815 ?auto_1813 ) ( IN-TRUCK ?auto_1815 ?auto_1817 ) ( TRUCK-AT ?auto_1817 ?auto_1818 ) ( IN-CITY ?auto_1818 ?auto_1816 ) ( IN-CITY ?auto_1814 ?auto_1816 ) ( not ( = ?auto_1814 ?auto_1818 ) ) ( OBJ-AT ?auto_1813 ?auto_1814 ) ( not ( = ?auto_1813 ?auto_1815 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1815 ?auto_1814 )
      ( DELIVER-2PKG-VERIFY ?auto_1813 ?auto_1815 ?auto_1814 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1822 - OBJ
      ?auto_1824 - OBJ
      ?auto_1823 - LOCATION
    )
    :vars
    (
      ?auto_1827 - TRUCK
      ?auto_1825 - LOCATION
      ?auto_1826 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1824 ?auto_1822 ) ( TRUCK-AT ?auto_1827 ?auto_1825 ) ( IN-CITY ?auto_1825 ?auto_1826 ) ( IN-CITY ?auto_1823 ?auto_1826 ) ( not ( = ?auto_1823 ?auto_1825 ) ) ( OBJ-AT ?auto_1824 ?auto_1825 ) ( OBJ-AT ?auto_1822 ?auto_1823 ) ( not ( = ?auto_1822 ?auto_1824 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1824 ?auto_1823 )
      ( DELIVER-2PKG-VERIFY ?auto_1822 ?auto_1824 ?auto_1823 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1831 - OBJ
      ?auto_1833 - OBJ
      ?auto_1832 - LOCATION
    )
    :vars
    (
      ?auto_1836 - LOCATION
      ?auto_1835 - CITY
      ?auto_1834 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1833 ?auto_1831 ) ( IN-CITY ?auto_1836 ?auto_1835 ) ( IN-CITY ?auto_1832 ?auto_1835 ) ( not ( = ?auto_1832 ?auto_1836 ) ) ( OBJ-AT ?auto_1833 ?auto_1836 ) ( TRUCK-AT ?auto_1834 ?auto_1832 ) ( OBJ-AT ?auto_1831 ?auto_1832 ) ( not ( = ?auto_1831 ?auto_1833 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1833 ?auto_1832 )
      ( DELIVER-2PKG-VERIFY ?auto_1831 ?auto_1833 ?auto_1832 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1840 - OBJ
      ?auto_1842 - OBJ
      ?auto_1841 - LOCATION
    )
    :vars
    (
      ?auto_1844 - LOCATION
      ?auto_1845 - CITY
      ?auto_1843 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1842 ?auto_1840 ) ( IN-CITY ?auto_1844 ?auto_1845 ) ( IN-CITY ?auto_1841 ?auto_1845 ) ( not ( = ?auto_1841 ?auto_1844 ) ) ( OBJ-AT ?auto_1842 ?auto_1844 ) ( TRUCK-AT ?auto_1843 ?auto_1841 ) ( not ( = ?auto_1840 ?auto_1842 ) ) ( IN-TRUCK ?auto_1840 ?auto_1843 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1840 ?auto_1841 )
      ( DELIVER-2PKG ?auto_1840 ?auto_1842 ?auto_1841 )
      ( DELIVER-2PKG-VERIFY ?auto_1840 ?auto_1842 ?auto_1841 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1849 - OBJ
      ?auto_1851 - OBJ
      ?auto_1850 - LOCATION
    )
    :vars
    (
      ?auto_1854 - LOCATION
      ?auto_1853 - CITY
      ?auto_1852 - TRUCK
      ?auto_1855 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1851 ?auto_1849 ) ( IN-CITY ?auto_1854 ?auto_1853 ) ( IN-CITY ?auto_1850 ?auto_1853 ) ( not ( = ?auto_1850 ?auto_1854 ) ) ( OBJ-AT ?auto_1851 ?auto_1854 ) ( not ( = ?auto_1849 ?auto_1851 ) ) ( IN-TRUCK ?auto_1849 ?auto_1852 ) ( TRUCK-AT ?auto_1852 ?auto_1855 ) ( IN-CITY ?auto_1855 ?auto_1853 ) ( not ( = ?auto_1850 ?auto_1855 ) ) ( not ( = ?auto_1854 ?auto_1855 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1852 ?auto_1855 ?auto_1850 ?auto_1853 )
      ( DELIVER-2PKG ?auto_1849 ?auto_1851 ?auto_1850 )
      ( DELIVER-2PKG-VERIFY ?auto_1849 ?auto_1851 ?auto_1850 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1859 - OBJ
      ?auto_1861 - OBJ
      ?auto_1860 - LOCATION
    )
    :vars
    (
      ?auto_1865 - LOCATION
      ?auto_1864 - CITY
      ?auto_1862 - TRUCK
      ?auto_1863 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1861 ?auto_1859 ) ( IN-CITY ?auto_1865 ?auto_1864 ) ( IN-CITY ?auto_1860 ?auto_1864 ) ( not ( = ?auto_1860 ?auto_1865 ) ) ( OBJ-AT ?auto_1861 ?auto_1865 ) ( not ( = ?auto_1859 ?auto_1861 ) ) ( TRUCK-AT ?auto_1862 ?auto_1863 ) ( IN-CITY ?auto_1863 ?auto_1864 ) ( not ( = ?auto_1860 ?auto_1863 ) ) ( not ( = ?auto_1865 ?auto_1863 ) ) ( OBJ-AT ?auto_1859 ?auto_1863 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1859 ?auto_1862 ?auto_1863 )
      ( DELIVER-2PKG ?auto_1859 ?auto_1861 ?auto_1860 )
      ( DELIVER-2PKG-VERIFY ?auto_1859 ?auto_1861 ?auto_1860 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1869 - OBJ
      ?auto_1871 - OBJ
      ?auto_1870 - LOCATION
    )
    :vars
    (
      ?auto_1873 - LOCATION
      ?auto_1874 - CITY
      ?auto_1875 - LOCATION
      ?auto_1872 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1871 ?auto_1869 ) ( IN-CITY ?auto_1873 ?auto_1874 ) ( IN-CITY ?auto_1870 ?auto_1874 ) ( not ( = ?auto_1870 ?auto_1873 ) ) ( OBJ-AT ?auto_1871 ?auto_1873 ) ( not ( = ?auto_1869 ?auto_1871 ) ) ( IN-CITY ?auto_1875 ?auto_1874 ) ( not ( = ?auto_1870 ?auto_1875 ) ) ( not ( = ?auto_1873 ?auto_1875 ) ) ( OBJ-AT ?auto_1869 ?auto_1875 ) ( TRUCK-AT ?auto_1872 ?auto_1870 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1872 ?auto_1870 ?auto_1875 ?auto_1874 )
      ( DELIVER-2PKG ?auto_1869 ?auto_1871 ?auto_1870 )
      ( DELIVER-2PKG-VERIFY ?auto_1869 ?auto_1871 ?auto_1870 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1878 - OBJ
      ?auto_1879 - LOCATION
    )
    :vars
    (
      ?auto_1880 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1880 ?auto_1879 ) ( IN-TRUCK ?auto_1878 ?auto_1880 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1878 ?auto_1880 ?auto_1879 )
      ( DELIVER-1PKG-VERIFY ?auto_1878 ?auto_1879 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1883 - OBJ
      ?auto_1884 - LOCATION
    )
    :vars
    (
      ?auto_1885 - TRUCK
      ?auto_1886 - LOCATION
      ?auto_1887 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1883 ?auto_1885 ) ( TRUCK-AT ?auto_1885 ?auto_1886 ) ( IN-CITY ?auto_1886 ?auto_1887 ) ( IN-CITY ?auto_1884 ?auto_1887 ) ( not ( = ?auto_1884 ?auto_1886 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1885 ?auto_1886 ?auto_1884 ?auto_1887 )
      ( DELIVER-1PKG ?auto_1883 ?auto_1884 )
      ( DELIVER-1PKG-VERIFY ?auto_1883 ?auto_1884 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1890 - OBJ
      ?auto_1891 - LOCATION
    )
    :vars
    (
      ?auto_1894 - TRUCK
      ?auto_1893 - LOCATION
      ?auto_1892 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1894 ?auto_1893 ) ( IN-CITY ?auto_1893 ?auto_1892 ) ( IN-CITY ?auto_1891 ?auto_1892 ) ( not ( = ?auto_1891 ?auto_1893 ) ) ( OBJ-AT ?auto_1890 ?auto_1893 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1890 ?auto_1894 ?auto_1893 )
      ( DELIVER-1PKG ?auto_1890 ?auto_1891 )
      ( DELIVER-1PKG-VERIFY ?auto_1890 ?auto_1891 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1897 - OBJ
      ?auto_1898 - LOCATION
    )
    :vars
    (
      ?auto_1901 - LOCATION
      ?auto_1900 - CITY
      ?auto_1899 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1901 ?auto_1900 ) ( IN-CITY ?auto_1898 ?auto_1900 ) ( not ( = ?auto_1898 ?auto_1901 ) ) ( OBJ-AT ?auto_1897 ?auto_1901 ) ( TRUCK-AT ?auto_1899 ?auto_1898 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1899 ?auto_1898 ?auto_1901 ?auto_1900 )
      ( DELIVER-1PKG ?auto_1897 ?auto_1898 )
      ( DELIVER-1PKG-VERIFY ?auto_1897 ?auto_1898 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1906 - OBJ
      ?auto_1908 - OBJ
      ?auto_1909 - OBJ
      ?auto_1907 - LOCATION
    )
    :vars
    (
      ?auto_1910 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1908 ?auto_1906 ) ( GREATER-THAN ?auto_1909 ?auto_1906 ) ( GREATER-THAN ?auto_1909 ?auto_1908 ) ( TRUCK-AT ?auto_1910 ?auto_1907 ) ( IN-TRUCK ?auto_1909 ?auto_1910 ) ( OBJ-AT ?auto_1906 ?auto_1907 ) ( OBJ-AT ?auto_1908 ?auto_1907 ) ( not ( = ?auto_1906 ?auto_1908 ) ) ( not ( = ?auto_1906 ?auto_1909 ) ) ( not ( = ?auto_1908 ?auto_1909 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1909 ?auto_1907 )
      ( DELIVER-3PKG-VERIFY ?auto_1906 ?auto_1908 ?auto_1909 ?auto_1907 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1915 - OBJ
      ?auto_1917 - OBJ
      ?auto_1918 - OBJ
      ?auto_1916 - LOCATION
    )
    :vars
    (
      ?auto_1921 - TRUCK
      ?auto_1920 - LOCATION
      ?auto_1919 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1917 ?auto_1915 ) ( GREATER-THAN ?auto_1918 ?auto_1915 ) ( GREATER-THAN ?auto_1918 ?auto_1917 ) ( IN-TRUCK ?auto_1918 ?auto_1921 ) ( TRUCK-AT ?auto_1921 ?auto_1920 ) ( IN-CITY ?auto_1920 ?auto_1919 ) ( IN-CITY ?auto_1916 ?auto_1919 ) ( not ( = ?auto_1916 ?auto_1920 ) ) ( OBJ-AT ?auto_1915 ?auto_1916 ) ( OBJ-AT ?auto_1917 ?auto_1916 ) ( not ( = ?auto_1915 ?auto_1917 ) ) ( not ( = ?auto_1915 ?auto_1918 ) ) ( not ( = ?auto_1917 ?auto_1918 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1918 ?auto_1916 )
      ( DELIVER-3PKG-VERIFY ?auto_1915 ?auto_1917 ?auto_1918 ?auto_1916 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1926 - OBJ
      ?auto_1928 - OBJ
      ?auto_1929 - OBJ
      ?auto_1927 - LOCATION
    )
    :vars
    (
      ?auto_1930 - TRUCK
      ?auto_1932 - LOCATION
      ?auto_1931 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1928 ?auto_1926 ) ( GREATER-THAN ?auto_1929 ?auto_1926 ) ( GREATER-THAN ?auto_1929 ?auto_1928 ) ( TRUCK-AT ?auto_1930 ?auto_1932 ) ( IN-CITY ?auto_1932 ?auto_1931 ) ( IN-CITY ?auto_1927 ?auto_1931 ) ( not ( = ?auto_1927 ?auto_1932 ) ) ( OBJ-AT ?auto_1929 ?auto_1932 ) ( OBJ-AT ?auto_1926 ?auto_1927 ) ( OBJ-AT ?auto_1928 ?auto_1927 ) ( not ( = ?auto_1926 ?auto_1928 ) ) ( not ( = ?auto_1926 ?auto_1929 ) ) ( not ( = ?auto_1928 ?auto_1929 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1929 ?auto_1927 )
      ( DELIVER-3PKG-VERIFY ?auto_1926 ?auto_1928 ?auto_1929 ?auto_1927 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1937 - OBJ
      ?auto_1939 - OBJ
      ?auto_1940 - OBJ
      ?auto_1938 - LOCATION
    )
    :vars
    (
      ?auto_1942 - LOCATION
      ?auto_1941 - CITY
      ?auto_1943 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1939 ?auto_1937 ) ( GREATER-THAN ?auto_1940 ?auto_1937 ) ( GREATER-THAN ?auto_1940 ?auto_1939 ) ( IN-CITY ?auto_1942 ?auto_1941 ) ( IN-CITY ?auto_1938 ?auto_1941 ) ( not ( = ?auto_1938 ?auto_1942 ) ) ( OBJ-AT ?auto_1940 ?auto_1942 ) ( TRUCK-AT ?auto_1943 ?auto_1938 ) ( OBJ-AT ?auto_1937 ?auto_1938 ) ( OBJ-AT ?auto_1939 ?auto_1938 ) ( not ( = ?auto_1937 ?auto_1939 ) ) ( not ( = ?auto_1937 ?auto_1940 ) ) ( not ( = ?auto_1939 ?auto_1940 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1940 ?auto_1938 )
      ( DELIVER-3PKG-VERIFY ?auto_1937 ?auto_1939 ?auto_1940 ?auto_1938 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1948 - OBJ
      ?auto_1950 - OBJ
      ?auto_1951 - OBJ
      ?auto_1949 - LOCATION
    )
    :vars
    (
      ?auto_1953 - LOCATION
      ?auto_1952 - CITY
      ?auto_1954 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1950 ?auto_1948 ) ( GREATER-THAN ?auto_1951 ?auto_1948 ) ( GREATER-THAN ?auto_1951 ?auto_1950 ) ( IN-CITY ?auto_1953 ?auto_1952 ) ( IN-CITY ?auto_1949 ?auto_1952 ) ( not ( = ?auto_1949 ?auto_1953 ) ) ( OBJ-AT ?auto_1951 ?auto_1953 ) ( TRUCK-AT ?auto_1954 ?auto_1949 ) ( OBJ-AT ?auto_1948 ?auto_1949 ) ( not ( = ?auto_1948 ?auto_1950 ) ) ( not ( = ?auto_1948 ?auto_1951 ) ) ( not ( = ?auto_1950 ?auto_1951 ) ) ( IN-TRUCK ?auto_1950 ?auto_1954 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1950 ?auto_1949 )
      ( DELIVER-3PKG ?auto_1948 ?auto_1950 ?auto_1951 ?auto_1949 )
      ( DELIVER-3PKG-VERIFY ?auto_1948 ?auto_1950 ?auto_1951 ?auto_1949 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1959 - OBJ
      ?auto_1961 - OBJ
      ?auto_1962 - OBJ
      ?auto_1960 - LOCATION
    )
    :vars
    (
      ?auto_1965 - LOCATION
      ?auto_1963 - CITY
      ?auto_1964 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1961 ?auto_1959 ) ( GREATER-THAN ?auto_1962 ?auto_1959 ) ( GREATER-THAN ?auto_1962 ?auto_1961 ) ( IN-CITY ?auto_1965 ?auto_1963 ) ( IN-CITY ?auto_1960 ?auto_1963 ) ( not ( = ?auto_1960 ?auto_1965 ) ) ( OBJ-AT ?auto_1962 ?auto_1965 ) ( OBJ-AT ?auto_1959 ?auto_1960 ) ( not ( = ?auto_1959 ?auto_1961 ) ) ( not ( = ?auto_1959 ?auto_1962 ) ) ( not ( = ?auto_1961 ?auto_1962 ) ) ( IN-TRUCK ?auto_1961 ?auto_1964 ) ( TRUCK-AT ?auto_1964 ?auto_1965 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1964 ?auto_1965 ?auto_1960 ?auto_1963 )
      ( DELIVER-3PKG ?auto_1959 ?auto_1961 ?auto_1962 ?auto_1960 )
      ( DELIVER-3PKG-VERIFY ?auto_1959 ?auto_1961 ?auto_1962 ?auto_1960 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1970 - OBJ
      ?auto_1972 - OBJ
      ?auto_1973 - OBJ
      ?auto_1971 - LOCATION
    )
    :vars
    (
      ?auto_1976 - LOCATION
      ?auto_1975 - CITY
      ?auto_1974 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1972 ?auto_1970 ) ( GREATER-THAN ?auto_1973 ?auto_1970 ) ( GREATER-THAN ?auto_1973 ?auto_1972 ) ( IN-CITY ?auto_1976 ?auto_1975 ) ( IN-CITY ?auto_1971 ?auto_1975 ) ( not ( = ?auto_1971 ?auto_1976 ) ) ( OBJ-AT ?auto_1973 ?auto_1976 ) ( OBJ-AT ?auto_1970 ?auto_1971 ) ( not ( = ?auto_1970 ?auto_1972 ) ) ( not ( = ?auto_1970 ?auto_1973 ) ) ( not ( = ?auto_1972 ?auto_1973 ) ) ( TRUCK-AT ?auto_1974 ?auto_1976 ) ( OBJ-AT ?auto_1972 ?auto_1976 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1972 ?auto_1974 ?auto_1976 )
      ( DELIVER-3PKG ?auto_1970 ?auto_1972 ?auto_1973 ?auto_1971 )
      ( DELIVER-3PKG-VERIFY ?auto_1970 ?auto_1972 ?auto_1973 ?auto_1971 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1981 - OBJ
      ?auto_1983 - OBJ
      ?auto_1984 - OBJ
      ?auto_1982 - LOCATION
    )
    :vars
    (
      ?auto_1986 - LOCATION
      ?auto_1987 - CITY
      ?auto_1985 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1983 ?auto_1981 ) ( GREATER-THAN ?auto_1984 ?auto_1981 ) ( GREATER-THAN ?auto_1984 ?auto_1983 ) ( IN-CITY ?auto_1986 ?auto_1987 ) ( IN-CITY ?auto_1982 ?auto_1987 ) ( not ( = ?auto_1982 ?auto_1986 ) ) ( OBJ-AT ?auto_1984 ?auto_1986 ) ( OBJ-AT ?auto_1981 ?auto_1982 ) ( not ( = ?auto_1981 ?auto_1983 ) ) ( not ( = ?auto_1981 ?auto_1984 ) ) ( not ( = ?auto_1983 ?auto_1984 ) ) ( OBJ-AT ?auto_1983 ?auto_1986 ) ( TRUCK-AT ?auto_1985 ?auto_1982 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1985 ?auto_1982 ?auto_1986 ?auto_1987 )
      ( DELIVER-3PKG ?auto_1981 ?auto_1983 ?auto_1984 ?auto_1982 )
      ( DELIVER-3PKG-VERIFY ?auto_1981 ?auto_1983 ?auto_1984 ?auto_1982 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1992 - OBJ
      ?auto_1994 - OBJ
      ?auto_1995 - OBJ
      ?auto_1993 - LOCATION
    )
    :vars
    (
      ?auto_1997 - LOCATION
      ?auto_1998 - CITY
      ?auto_1996 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1994 ?auto_1992 ) ( GREATER-THAN ?auto_1995 ?auto_1992 ) ( GREATER-THAN ?auto_1995 ?auto_1994 ) ( IN-CITY ?auto_1997 ?auto_1998 ) ( IN-CITY ?auto_1993 ?auto_1998 ) ( not ( = ?auto_1993 ?auto_1997 ) ) ( OBJ-AT ?auto_1995 ?auto_1997 ) ( not ( = ?auto_1992 ?auto_1994 ) ) ( not ( = ?auto_1992 ?auto_1995 ) ) ( not ( = ?auto_1994 ?auto_1995 ) ) ( OBJ-AT ?auto_1994 ?auto_1997 ) ( TRUCK-AT ?auto_1996 ?auto_1993 ) ( IN-TRUCK ?auto_1992 ?auto_1996 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1992 ?auto_1993 )
      ( DELIVER-3PKG ?auto_1992 ?auto_1994 ?auto_1995 ?auto_1993 )
      ( DELIVER-3PKG-VERIFY ?auto_1992 ?auto_1994 ?auto_1995 ?auto_1993 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2003 - OBJ
      ?auto_2005 - OBJ
      ?auto_2006 - OBJ
      ?auto_2004 - LOCATION
    )
    :vars
    (
      ?auto_2007 - LOCATION
      ?auto_2009 - CITY
      ?auto_2008 - TRUCK
      ?auto_2010 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2005 ?auto_2003 ) ( GREATER-THAN ?auto_2006 ?auto_2003 ) ( GREATER-THAN ?auto_2006 ?auto_2005 ) ( IN-CITY ?auto_2007 ?auto_2009 ) ( IN-CITY ?auto_2004 ?auto_2009 ) ( not ( = ?auto_2004 ?auto_2007 ) ) ( OBJ-AT ?auto_2006 ?auto_2007 ) ( not ( = ?auto_2003 ?auto_2005 ) ) ( not ( = ?auto_2003 ?auto_2006 ) ) ( not ( = ?auto_2005 ?auto_2006 ) ) ( OBJ-AT ?auto_2005 ?auto_2007 ) ( IN-TRUCK ?auto_2003 ?auto_2008 ) ( TRUCK-AT ?auto_2008 ?auto_2010 ) ( IN-CITY ?auto_2010 ?auto_2009 ) ( not ( = ?auto_2004 ?auto_2010 ) ) ( not ( = ?auto_2007 ?auto_2010 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2008 ?auto_2010 ?auto_2004 ?auto_2009 )
      ( DELIVER-3PKG ?auto_2003 ?auto_2005 ?auto_2006 ?auto_2004 )
      ( DELIVER-3PKG-VERIFY ?auto_2003 ?auto_2005 ?auto_2006 ?auto_2004 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2015 - OBJ
      ?auto_2017 - OBJ
      ?auto_2018 - OBJ
      ?auto_2016 - LOCATION
    )
    :vars
    (
      ?auto_2021 - LOCATION
      ?auto_2022 - CITY
      ?auto_2020 - TRUCK
      ?auto_2019 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2017 ?auto_2015 ) ( GREATER-THAN ?auto_2018 ?auto_2015 ) ( GREATER-THAN ?auto_2018 ?auto_2017 ) ( IN-CITY ?auto_2021 ?auto_2022 ) ( IN-CITY ?auto_2016 ?auto_2022 ) ( not ( = ?auto_2016 ?auto_2021 ) ) ( OBJ-AT ?auto_2018 ?auto_2021 ) ( not ( = ?auto_2015 ?auto_2017 ) ) ( not ( = ?auto_2015 ?auto_2018 ) ) ( not ( = ?auto_2017 ?auto_2018 ) ) ( OBJ-AT ?auto_2017 ?auto_2021 ) ( TRUCK-AT ?auto_2020 ?auto_2019 ) ( IN-CITY ?auto_2019 ?auto_2022 ) ( not ( = ?auto_2016 ?auto_2019 ) ) ( not ( = ?auto_2021 ?auto_2019 ) ) ( OBJ-AT ?auto_2015 ?auto_2019 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2015 ?auto_2020 ?auto_2019 )
      ( DELIVER-3PKG ?auto_2015 ?auto_2017 ?auto_2018 ?auto_2016 )
      ( DELIVER-3PKG-VERIFY ?auto_2015 ?auto_2017 ?auto_2018 ?auto_2016 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2027 - OBJ
      ?auto_2029 - OBJ
      ?auto_2030 - OBJ
      ?auto_2028 - LOCATION
    )
    :vars
    (
      ?auto_2034 - LOCATION
      ?auto_2032 - CITY
      ?auto_2031 - LOCATION
      ?auto_2033 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2029 ?auto_2027 ) ( GREATER-THAN ?auto_2030 ?auto_2027 ) ( GREATER-THAN ?auto_2030 ?auto_2029 ) ( IN-CITY ?auto_2034 ?auto_2032 ) ( IN-CITY ?auto_2028 ?auto_2032 ) ( not ( = ?auto_2028 ?auto_2034 ) ) ( OBJ-AT ?auto_2030 ?auto_2034 ) ( not ( = ?auto_2027 ?auto_2029 ) ) ( not ( = ?auto_2027 ?auto_2030 ) ) ( not ( = ?auto_2029 ?auto_2030 ) ) ( OBJ-AT ?auto_2029 ?auto_2034 ) ( IN-CITY ?auto_2031 ?auto_2032 ) ( not ( = ?auto_2028 ?auto_2031 ) ) ( not ( = ?auto_2034 ?auto_2031 ) ) ( OBJ-AT ?auto_2027 ?auto_2031 ) ( TRUCK-AT ?auto_2033 ?auto_2028 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2033 ?auto_2028 ?auto_2031 ?auto_2032 )
      ( DELIVER-3PKG ?auto_2027 ?auto_2029 ?auto_2030 ?auto_2028 )
      ( DELIVER-3PKG-VERIFY ?auto_2027 ?auto_2029 ?auto_2030 ?auto_2028 ) )
  )

)

