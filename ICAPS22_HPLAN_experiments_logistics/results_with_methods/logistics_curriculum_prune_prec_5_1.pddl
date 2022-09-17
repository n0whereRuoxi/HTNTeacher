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
      ?auto_1738 - OBJ
      ?auto_1739 - LOCATION
    )
    :vars
    (
      ?auto_1748 - LOCATION
      ?auto_1745 - CITY
      ?auto_1740 - TRUCK
      ?auto_1751 - LOCATION
      ?auto_1752 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_1748 ?auto_1745 ) ( IN-CITY ?auto_1739 ?auto_1745 ) ( not ( = ?auto_1739 ?auto_1748 ) ) ( OBJ-AT ?auto_1738 ?auto_1748 ) ( TRUCK-AT ?auto_1740 ?auto_1751 ) ( IN-CITY ?auto_1751 ?auto_1752 ) ( IN-CITY ?auto_1748 ?auto_1752 ) ( not ( = ?auto_1748 ?auto_1751 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1740 ?auto_1751 ?auto_1748 ?auto_1752 )
      ( !LOAD-TRUCK ?auto_1738 ?auto_1740 ?auto_1748 )
      ( !DRIVE-TRUCK ?auto_1740 ?auto_1748 ?auto_1739 ?auto_1745 )
      ( !UNLOAD-TRUCK ?auto_1738 ?auto_1740 ?auto_1739 )
      ( DELIVER-1PKG-VERIFY ?auto_1738 ?auto_1739 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1775 - OBJ
      ?auto_1777 - OBJ
      ?auto_1780 - LOCATION
    )
    :vars
    (
      ?auto_1779 - LOCATION
      ?auto_1781 - CITY
      ?auto_1778 - CITY
      ?auto_1790 - LOCATION
      ?auto_1786 - CITY
      ?auto_1784 - TRUCK
      ?auto_1787 - LOCATION
      ?auto_1788 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1777 ?auto_1775 ) ( IN-CITY ?auto_1779 ?auto_1781 ) ( IN-CITY ?auto_1780 ?auto_1781 ) ( not ( = ?auto_1780 ?auto_1779 ) ) ( OBJ-AT ?auto_1777 ?auto_1779 ) ( IN-CITY ?auto_1780 ?auto_1778 ) ( IN-CITY ?auto_1779 ?auto_1778 ) ( IN-CITY ?auto_1790 ?auto_1786 ) ( IN-CITY ?auto_1780 ?auto_1786 ) ( not ( = ?auto_1780 ?auto_1790 ) ) ( OBJ-AT ?auto_1775 ?auto_1790 ) ( TRUCK-AT ?auto_1784 ?auto_1787 ) ( IN-CITY ?auto_1787 ?auto_1788 ) ( IN-CITY ?auto_1790 ?auto_1788 ) ( not ( = ?auto_1790 ?auto_1787 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1775 ?auto_1780 )
      ( DELIVER-1PKG ?auto_1777 ?auto_1780 )
      ( DELIVER-2PKG-VERIFY ?auto_1775 ?auto_1777 ?auto_1780 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1814 - OBJ
      ?auto_1816 - OBJ
      ?auto_1817 - OBJ
      ?auto_1820 - LOCATION
    )
    :vars
    (
      ?auto_1819 - LOCATION
      ?auto_1818 - CITY
      ?auto_1823 - CITY
      ?auto_1829 - LOCATION
      ?auto_1830 - CITY
      ?auto_1825 - CITY
      ?auto_1834 - LOCATION
      ?auto_1828 - CITY
      ?auto_1822 - TRUCK
      ?auto_1833 - LOCATION
      ?auto_1835 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1816 ?auto_1814 ) ( GREATER-THAN ?auto_1817 ?auto_1814 ) ( GREATER-THAN ?auto_1817 ?auto_1816 ) ( IN-CITY ?auto_1819 ?auto_1818 ) ( IN-CITY ?auto_1820 ?auto_1818 ) ( not ( = ?auto_1820 ?auto_1819 ) ) ( OBJ-AT ?auto_1817 ?auto_1819 ) ( IN-CITY ?auto_1820 ?auto_1823 ) ( IN-CITY ?auto_1819 ?auto_1823 ) ( IN-CITY ?auto_1829 ?auto_1830 ) ( IN-CITY ?auto_1820 ?auto_1830 ) ( not ( = ?auto_1820 ?auto_1829 ) ) ( OBJ-AT ?auto_1816 ?auto_1829 ) ( IN-CITY ?auto_1820 ?auto_1825 ) ( IN-CITY ?auto_1829 ?auto_1825 ) ( IN-CITY ?auto_1834 ?auto_1828 ) ( IN-CITY ?auto_1820 ?auto_1828 ) ( not ( = ?auto_1820 ?auto_1834 ) ) ( OBJ-AT ?auto_1814 ?auto_1834 ) ( TRUCK-AT ?auto_1822 ?auto_1833 ) ( IN-CITY ?auto_1833 ?auto_1835 ) ( IN-CITY ?auto_1834 ?auto_1835 ) ( not ( = ?auto_1834 ?auto_1833 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1814 ?auto_1816 ?auto_1820 )
      ( DELIVER-1PKG ?auto_1817 ?auto_1820 )
      ( DELIVER-3PKG-VERIFY ?auto_1814 ?auto_1816 ?auto_1817 ?auto_1820 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1859 - OBJ
      ?auto_1861 - OBJ
      ?auto_1862 - OBJ
      ?auto_1863 - OBJ
      ?auto_1870 - LOCATION
    )
    :vars
    (
      ?auto_1864 - LOCATION
      ?auto_1866 - CITY
      ?auto_1868 - CITY
      ?auto_1871 - LOCATION
      ?auto_1873 - CITY
      ?auto_1883 - CITY
      ?auto_1878 - LOCATION
      ?auto_1877 - CITY
      ?auto_1880 - CITY
      ?auto_1872 - LOCATION
      ?auto_1879 - CITY
      ?auto_1865 - TRUCK
      ?auto_1881 - LOCATION
      ?auto_1874 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1861 ?auto_1859 ) ( GREATER-THAN ?auto_1862 ?auto_1859 ) ( GREATER-THAN ?auto_1862 ?auto_1861 ) ( GREATER-THAN ?auto_1863 ?auto_1859 ) ( GREATER-THAN ?auto_1863 ?auto_1861 ) ( GREATER-THAN ?auto_1863 ?auto_1862 ) ( IN-CITY ?auto_1864 ?auto_1866 ) ( IN-CITY ?auto_1870 ?auto_1866 ) ( not ( = ?auto_1870 ?auto_1864 ) ) ( OBJ-AT ?auto_1863 ?auto_1864 ) ( IN-CITY ?auto_1870 ?auto_1868 ) ( IN-CITY ?auto_1864 ?auto_1868 ) ( IN-CITY ?auto_1871 ?auto_1873 ) ( IN-CITY ?auto_1870 ?auto_1873 ) ( not ( = ?auto_1870 ?auto_1871 ) ) ( OBJ-AT ?auto_1862 ?auto_1871 ) ( IN-CITY ?auto_1870 ?auto_1883 ) ( IN-CITY ?auto_1871 ?auto_1883 ) ( IN-CITY ?auto_1878 ?auto_1877 ) ( IN-CITY ?auto_1870 ?auto_1877 ) ( not ( = ?auto_1870 ?auto_1878 ) ) ( OBJ-AT ?auto_1861 ?auto_1878 ) ( IN-CITY ?auto_1870 ?auto_1880 ) ( IN-CITY ?auto_1878 ?auto_1880 ) ( IN-CITY ?auto_1872 ?auto_1879 ) ( IN-CITY ?auto_1870 ?auto_1879 ) ( not ( = ?auto_1870 ?auto_1872 ) ) ( OBJ-AT ?auto_1859 ?auto_1872 ) ( TRUCK-AT ?auto_1865 ?auto_1881 ) ( IN-CITY ?auto_1881 ?auto_1874 ) ( IN-CITY ?auto_1872 ?auto_1874 ) ( not ( = ?auto_1872 ?auto_1881 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1859 ?auto_1861 ?auto_1862 ?auto_1870 )
      ( DELIVER-1PKG ?auto_1863 ?auto_1870 )
      ( DELIVER-4PKG-VERIFY ?auto_1859 ?auto_1861 ?auto_1862 ?auto_1863 ?auto_1870 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1910 - OBJ
      ?auto_1912 - OBJ
      ?auto_1913 - OBJ
      ?auto_1914 - OBJ
      ?auto_1915 - OBJ
      ?auto_1917 - LOCATION
    )
    :vars
    (
      ?auto_1918 - LOCATION
      ?auto_1919 - CITY
      ?auto_1920 - CITY
      ?auto_1931 - LOCATION
      ?auto_1939 - CITY
      ?auto_1941 - CITY
      ?auto_1936 - LOCATION
      ?auto_1934 - CITY
      ?auto_1928 - CITY
      ?auto_1935 - LOCATION
      ?auto_1929 - CITY
      ?auto_1925 - CITY
      ?auto_1933 - LOCATION
      ?auto_1926 - CITY
      ?auto_1916 - TRUCK
      ?auto_1927 - LOCATION
      ?auto_1932 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1912 ?auto_1910 ) ( GREATER-THAN ?auto_1913 ?auto_1910 ) ( GREATER-THAN ?auto_1913 ?auto_1912 ) ( GREATER-THAN ?auto_1914 ?auto_1910 ) ( GREATER-THAN ?auto_1914 ?auto_1912 ) ( GREATER-THAN ?auto_1914 ?auto_1913 ) ( GREATER-THAN ?auto_1915 ?auto_1910 ) ( GREATER-THAN ?auto_1915 ?auto_1912 ) ( GREATER-THAN ?auto_1915 ?auto_1913 ) ( GREATER-THAN ?auto_1915 ?auto_1914 ) ( IN-CITY ?auto_1918 ?auto_1919 ) ( IN-CITY ?auto_1917 ?auto_1919 ) ( not ( = ?auto_1917 ?auto_1918 ) ) ( OBJ-AT ?auto_1915 ?auto_1918 ) ( IN-CITY ?auto_1917 ?auto_1920 ) ( IN-CITY ?auto_1918 ?auto_1920 ) ( IN-CITY ?auto_1931 ?auto_1939 ) ( IN-CITY ?auto_1917 ?auto_1939 ) ( not ( = ?auto_1917 ?auto_1931 ) ) ( OBJ-AT ?auto_1914 ?auto_1931 ) ( IN-CITY ?auto_1917 ?auto_1941 ) ( IN-CITY ?auto_1931 ?auto_1941 ) ( IN-CITY ?auto_1936 ?auto_1934 ) ( IN-CITY ?auto_1917 ?auto_1934 ) ( not ( = ?auto_1917 ?auto_1936 ) ) ( OBJ-AT ?auto_1913 ?auto_1936 ) ( IN-CITY ?auto_1917 ?auto_1928 ) ( IN-CITY ?auto_1936 ?auto_1928 ) ( IN-CITY ?auto_1935 ?auto_1929 ) ( IN-CITY ?auto_1917 ?auto_1929 ) ( not ( = ?auto_1917 ?auto_1935 ) ) ( OBJ-AT ?auto_1912 ?auto_1935 ) ( IN-CITY ?auto_1917 ?auto_1925 ) ( IN-CITY ?auto_1935 ?auto_1925 ) ( IN-CITY ?auto_1933 ?auto_1926 ) ( IN-CITY ?auto_1917 ?auto_1926 ) ( not ( = ?auto_1917 ?auto_1933 ) ) ( OBJ-AT ?auto_1910 ?auto_1933 ) ( TRUCK-AT ?auto_1916 ?auto_1927 ) ( IN-CITY ?auto_1927 ?auto_1932 ) ( IN-CITY ?auto_1933 ?auto_1932 ) ( not ( = ?auto_1933 ?auto_1927 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_1910 ?auto_1912 ?auto_1913 ?auto_1914 ?auto_1917 )
      ( DELIVER-1PKG ?auto_1915 ?auto_1917 )
      ( DELIVER-5PKG-VERIFY ?auto_1910 ?auto_1912 ?auto_1913 ?auto_1914 ?auto_1915 ?auto_1917 ) )
  )

)

