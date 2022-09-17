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
      ?auto_1831 - OBJ
      ?auto_1832 - LOCATION
    )
    :vars
    (
      ?auto_1834 - LOCATION
      ?auto_1835 - CITY
      ?auto_1833 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1834 ?auto_1835 ) ( IN-CITY ?auto_1832 ?auto_1835 ) ( not ( = ?auto_1832 ?auto_1834 ) ) ( OBJ-AT ?auto_1831 ?auto_1834 ) ( TRUCK-AT ?auto_1833 ?auto_1832 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1833 ?auto_1832 ?auto_1834 ?auto_1835 )
      ( !LOAD-TRUCK ?auto_1831 ?auto_1833 ?auto_1834 )
      ( !DRIVE-TRUCK ?auto_1833 ?auto_1834 ?auto_1832 ?auto_1835 )
      ( !UNLOAD-TRUCK ?auto_1831 ?auto_1833 ?auto_1832 )
      ( DELIVER-1PKG-VERIFY ?auto_1831 ?auto_1832 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1846 - OBJ
      ?auto_1848 - OBJ
      ?auto_1847 - LOCATION
    )
    :vars
    (
      ?auto_1851 - LOCATION
      ?auto_1850 - CITY
      ?auto_1852 - LOCATION
      ?auto_1849 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1848 ?auto_1846 ) ( IN-CITY ?auto_1851 ?auto_1850 ) ( IN-CITY ?auto_1847 ?auto_1850 ) ( not ( = ?auto_1847 ?auto_1851 ) ) ( OBJ-AT ?auto_1848 ?auto_1851 ) ( IN-CITY ?auto_1852 ?auto_1850 ) ( not ( = ?auto_1847 ?auto_1852 ) ) ( OBJ-AT ?auto_1846 ?auto_1852 ) ( TRUCK-AT ?auto_1849 ?auto_1847 ) ( not ( = ?auto_1846 ?auto_1848 ) ) ( not ( = ?auto_1851 ?auto_1852 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1846 ?auto_1847 )
      ( DELIVER-1PKG ?auto_1848 ?auto_1847 )
      ( DELIVER-2PKG-VERIFY ?auto_1846 ?auto_1848 ?auto_1847 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1864 - OBJ
      ?auto_1866 - OBJ
      ?auto_1867 - OBJ
      ?auto_1865 - LOCATION
    )
    :vars
    (
      ?auto_1869 - LOCATION
      ?auto_1868 - CITY
      ?auto_1872 - LOCATION
      ?auto_1871 - LOCATION
      ?auto_1870 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1866 ?auto_1864 ) ( GREATER-THAN ?auto_1867 ?auto_1864 ) ( GREATER-THAN ?auto_1867 ?auto_1866 ) ( IN-CITY ?auto_1869 ?auto_1868 ) ( IN-CITY ?auto_1865 ?auto_1868 ) ( not ( = ?auto_1865 ?auto_1869 ) ) ( OBJ-AT ?auto_1867 ?auto_1869 ) ( IN-CITY ?auto_1872 ?auto_1868 ) ( not ( = ?auto_1865 ?auto_1872 ) ) ( OBJ-AT ?auto_1866 ?auto_1872 ) ( IN-CITY ?auto_1871 ?auto_1868 ) ( not ( = ?auto_1865 ?auto_1871 ) ) ( OBJ-AT ?auto_1864 ?auto_1871 ) ( TRUCK-AT ?auto_1870 ?auto_1865 ) ( not ( = ?auto_1864 ?auto_1866 ) ) ( not ( = ?auto_1872 ?auto_1871 ) ) ( not ( = ?auto_1864 ?auto_1867 ) ) ( not ( = ?auto_1866 ?auto_1867 ) ) ( not ( = ?auto_1869 ?auto_1872 ) ) ( not ( = ?auto_1869 ?auto_1871 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1864 ?auto_1866 ?auto_1865 )
      ( DELIVER-1PKG ?auto_1867 ?auto_1865 )
      ( DELIVER-3PKG-VERIFY ?auto_1864 ?auto_1866 ?auto_1867 ?auto_1865 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1885 - OBJ
      ?auto_1887 - OBJ
      ?auto_1888 - OBJ
      ?auto_1889 - OBJ
      ?auto_1886 - LOCATION
    )
    :vars
    (
      ?auto_1892 - LOCATION
      ?auto_1890 - CITY
      ?auto_1895 - LOCATION
      ?auto_1893 - LOCATION
      ?auto_1894 - LOCATION
      ?auto_1891 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1887 ?auto_1885 ) ( GREATER-THAN ?auto_1888 ?auto_1885 ) ( GREATER-THAN ?auto_1888 ?auto_1887 ) ( GREATER-THAN ?auto_1889 ?auto_1885 ) ( GREATER-THAN ?auto_1889 ?auto_1887 ) ( GREATER-THAN ?auto_1889 ?auto_1888 ) ( IN-CITY ?auto_1892 ?auto_1890 ) ( IN-CITY ?auto_1886 ?auto_1890 ) ( not ( = ?auto_1886 ?auto_1892 ) ) ( OBJ-AT ?auto_1889 ?auto_1892 ) ( IN-CITY ?auto_1895 ?auto_1890 ) ( not ( = ?auto_1886 ?auto_1895 ) ) ( OBJ-AT ?auto_1888 ?auto_1895 ) ( IN-CITY ?auto_1893 ?auto_1890 ) ( not ( = ?auto_1886 ?auto_1893 ) ) ( OBJ-AT ?auto_1887 ?auto_1893 ) ( IN-CITY ?auto_1894 ?auto_1890 ) ( not ( = ?auto_1886 ?auto_1894 ) ) ( OBJ-AT ?auto_1885 ?auto_1894 ) ( TRUCK-AT ?auto_1891 ?auto_1886 ) ( not ( = ?auto_1885 ?auto_1887 ) ) ( not ( = ?auto_1893 ?auto_1894 ) ) ( not ( = ?auto_1885 ?auto_1888 ) ) ( not ( = ?auto_1887 ?auto_1888 ) ) ( not ( = ?auto_1895 ?auto_1893 ) ) ( not ( = ?auto_1895 ?auto_1894 ) ) ( not ( = ?auto_1885 ?auto_1889 ) ) ( not ( = ?auto_1887 ?auto_1889 ) ) ( not ( = ?auto_1888 ?auto_1889 ) ) ( not ( = ?auto_1892 ?auto_1895 ) ) ( not ( = ?auto_1892 ?auto_1893 ) ) ( not ( = ?auto_1892 ?auto_1894 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1885 ?auto_1887 ?auto_1888 ?auto_1886 )
      ( DELIVER-1PKG ?auto_1889 ?auto_1886 )
      ( DELIVER-4PKG-VERIFY ?auto_1885 ?auto_1887 ?auto_1888 ?auto_1889 ?auto_1886 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_1909 - OBJ
      ?auto_1911 - OBJ
      ?auto_1912 - OBJ
      ?auto_1913 - OBJ
      ?auto_1914 - OBJ
      ?auto_1910 - LOCATION
    )
    :vars
    (
      ?auto_1916 - LOCATION
      ?auto_1915 - CITY
      ?auto_1918 - LOCATION
      ?auto_1921 - LOCATION
      ?auto_1919 - LOCATION
      ?auto_1920 - LOCATION
      ?auto_1917 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1911 ?auto_1909 ) ( GREATER-THAN ?auto_1912 ?auto_1909 ) ( GREATER-THAN ?auto_1912 ?auto_1911 ) ( GREATER-THAN ?auto_1913 ?auto_1909 ) ( GREATER-THAN ?auto_1913 ?auto_1911 ) ( GREATER-THAN ?auto_1913 ?auto_1912 ) ( GREATER-THAN ?auto_1914 ?auto_1909 ) ( GREATER-THAN ?auto_1914 ?auto_1911 ) ( GREATER-THAN ?auto_1914 ?auto_1912 ) ( GREATER-THAN ?auto_1914 ?auto_1913 ) ( IN-CITY ?auto_1916 ?auto_1915 ) ( IN-CITY ?auto_1910 ?auto_1915 ) ( not ( = ?auto_1910 ?auto_1916 ) ) ( OBJ-AT ?auto_1914 ?auto_1916 ) ( IN-CITY ?auto_1918 ?auto_1915 ) ( not ( = ?auto_1910 ?auto_1918 ) ) ( OBJ-AT ?auto_1913 ?auto_1918 ) ( IN-CITY ?auto_1921 ?auto_1915 ) ( not ( = ?auto_1910 ?auto_1921 ) ) ( OBJ-AT ?auto_1912 ?auto_1921 ) ( IN-CITY ?auto_1919 ?auto_1915 ) ( not ( = ?auto_1910 ?auto_1919 ) ) ( OBJ-AT ?auto_1911 ?auto_1919 ) ( IN-CITY ?auto_1920 ?auto_1915 ) ( not ( = ?auto_1910 ?auto_1920 ) ) ( OBJ-AT ?auto_1909 ?auto_1920 ) ( TRUCK-AT ?auto_1917 ?auto_1910 ) ( not ( = ?auto_1909 ?auto_1911 ) ) ( not ( = ?auto_1919 ?auto_1920 ) ) ( not ( = ?auto_1909 ?auto_1912 ) ) ( not ( = ?auto_1911 ?auto_1912 ) ) ( not ( = ?auto_1921 ?auto_1919 ) ) ( not ( = ?auto_1921 ?auto_1920 ) ) ( not ( = ?auto_1909 ?auto_1913 ) ) ( not ( = ?auto_1911 ?auto_1913 ) ) ( not ( = ?auto_1912 ?auto_1913 ) ) ( not ( = ?auto_1918 ?auto_1921 ) ) ( not ( = ?auto_1918 ?auto_1919 ) ) ( not ( = ?auto_1918 ?auto_1920 ) ) ( not ( = ?auto_1909 ?auto_1914 ) ) ( not ( = ?auto_1911 ?auto_1914 ) ) ( not ( = ?auto_1912 ?auto_1914 ) ) ( not ( = ?auto_1913 ?auto_1914 ) ) ( not ( = ?auto_1916 ?auto_1918 ) ) ( not ( = ?auto_1916 ?auto_1921 ) ) ( not ( = ?auto_1916 ?auto_1919 ) ) ( not ( = ?auto_1916 ?auto_1920 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_1909 ?auto_1911 ?auto_1912 ?auto_1913 ?auto_1910 )
      ( DELIVER-1PKG ?auto_1914 ?auto_1910 )
      ( DELIVER-5PKG-VERIFY ?auto_1909 ?auto_1911 ?auto_1912 ?auto_1913 ?auto_1914 ?auto_1910 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1936 - OBJ
      ?auto_1938 - OBJ
      ?auto_1939 - OBJ
      ?auto_1940 - OBJ
      ?auto_1941 - OBJ
      ?auto_1942 - OBJ
      ?auto_1937 - LOCATION
    )
    :vars
    (
      ?auto_1943 - LOCATION
      ?auto_1945 - CITY
      ?auto_1948 - LOCATION
      ?auto_1949 - LOCATION
      ?auto_1950 - LOCATION
      ?auto_1947 - LOCATION
      ?auto_1946 - LOCATION
      ?auto_1944 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1938 ?auto_1936 ) ( GREATER-THAN ?auto_1939 ?auto_1936 ) ( GREATER-THAN ?auto_1939 ?auto_1938 ) ( GREATER-THAN ?auto_1940 ?auto_1936 ) ( GREATER-THAN ?auto_1940 ?auto_1938 ) ( GREATER-THAN ?auto_1940 ?auto_1939 ) ( GREATER-THAN ?auto_1941 ?auto_1936 ) ( GREATER-THAN ?auto_1941 ?auto_1938 ) ( GREATER-THAN ?auto_1941 ?auto_1939 ) ( GREATER-THAN ?auto_1941 ?auto_1940 ) ( GREATER-THAN ?auto_1942 ?auto_1936 ) ( GREATER-THAN ?auto_1942 ?auto_1938 ) ( GREATER-THAN ?auto_1942 ?auto_1939 ) ( GREATER-THAN ?auto_1942 ?auto_1940 ) ( GREATER-THAN ?auto_1942 ?auto_1941 ) ( IN-CITY ?auto_1943 ?auto_1945 ) ( IN-CITY ?auto_1937 ?auto_1945 ) ( not ( = ?auto_1937 ?auto_1943 ) ) ( OBJ-AT ?auto_1942 ?auto_1943 ) ( IN-CITY ?auto_1948 ?auto_1945 ) ( not ( = ?auto_1937 ?auto_1948 ) ) ( OBJ-AT ?auto_1941 ?auto_1948 ) ( IN-CITY ?auto_1949 ?auto_1945 ) ( not ( = ?auto_1937 ?auto_1949 ) ) ( OBJ-AT ?auto_1940 ?auto_1949 ) ( IN-CITY ?auto_1950 ?auto_1945 ) ( not ( = ?auto_1937 ?auto_1950 ) ) ( OBJ-AT ?auto_1939 ?auto_1950 ) ( IN-CITY ?auto_1947 ?auto_1945 ) ( not ( = ?auto_1937 ?auto_1947 ) ) ( OBJ-AT ?auto_1938 ?auto_1947 ) ( IN-CITY ?auto_1946 ?auto_1945 ) ( not ( = ?auto_1937 ?auto_1946 ) ) ( OBJ-AT ?auto_1936 ?auto_1946 ) ( TRUCK-AT ?auto_1944 ?auto_1937 ) ( not ( = ?auto_1936 ?auto_1938 ) ) ( not ( = ?auto_1947 ?auto_1946 ) ) ( not ( = ?auto_1936 ?auto_1939 ) ) ( not ( = ?auto_1938 ?auto_1939 ) ) ( not ( = ?auto_1950 ?auto_1947 ) ) ( not ( = ?auto_1950 ?auto_1946 ) ) ( not ( = ?auto_1936 ?auto_1940 ) ) ( not ( = ?auto_1938 ?auto_1940 ) ) ( not ( = ?auto_1939 ?auto_1940 ) ) ( not ( = ?auto_1949 ?auto_1950 ) ) ( not ( = ?auto_1949 ?auto_1947 ) ) ( not ( = ?auto_1949 ?auto_1946 ) ) ( not ( = ?auto_1936 ?auto_1941 ) ) ( not ( = ?auto_1938 ?auto_1941 ) ) ( not ( = ?auto_1939 ?auto_1941 ) ) ( not ( = ?auto_1940 ?auto_1941 ) ) ( not ( = ?auto_1948 ?auto_1949 ) ) ( not ( = ?auto_1948 ?auto_1950 ) ) ( not ( = ?auto_1948 ?auto_1947 ) ) ( not ( = ?auto_1948 ?auto_1946 ) ) ( not ( = ?auto_1936 ?auto_1942 ) ) ( not ( = ?auto_1938 ?auto_1942 ) ) ( not ( = ?auto_1939 ?auto_1942 ) ) ( not ( = ?auto_1940 ?auto_1942 ) ) ( not ( = ?auto_1941 ?auto_1942 ) ) ( not ( = ?auto_1943 ?auto_1948 ) ) ( not ( = ?auto_1943 ?auto_1949 ) ) ( not ( = ?auto_1943 ?auto_1950 ) ) ( not ( = ?auto_1943 ?auto_1947 ) ) ( not ( = ?auto_1943 ?auto_1946 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1936 ?auto_1938 ?auto_1939 ?auto_1940 ?auto_1941 ?auto_1937 )
      ( DELIVER-1PKG ?auto_1942 ?auto_1937 )
      ( DELIVER-6PKG-VERIFY ?auto_1936 ?auto_1938 ?auto_1939 ?auto_1940 ?auto_1941 ?auto_1942 ?auto_1937 ) )
  )

  ( :method DELIVER-7PKG
    :parameters
    (
      ?auto_1966 - OBJ
      ?auto_1968 - OBJ
      ?auto_1969 - OBJ
      ?auto_1970 - OBJ
      ?auto_1971 - OBJ
      ?auto_1972 - OBJ
      ?auto_1973 - OBJ
      ?auto_1967 - LOCATION
    )
    :vars
    (
      ?auto_1974 - LOCATION
      ?auto_1976 - CITY
      ?auto_1979 - LOCATION
      ?auto_1977 - LOCATION
      ?auto_1980 - LOCATION
      ?auto_1978 - LOCATION
      ?auto_1981 - LOCATION
      ?auto_1975 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1968 ?auto_1966 ) ( GREATER-THAN ?auto_1969 ?auto_1966 ) ( GREATER-THAN ?auto_1969 ?auto_1968 ) ( GREATER-THAN ?auto_1970 ?auto_1966 ) ( GREATER-THAN ?auto_1970 ?auto_1968 ) ( GREATER-THAN ?auto_1970 ?auto_1969 ) ( GREATER-THAN ?auto_1971 ?auto_1966 ) ( GREATER-THAN ?auto_1971 ?auto_1968 ) ( GREATER-THAN ?auto_1971 ?auto_1969 ) ( GREATER-THAN ?auto_1971 ?auto_1970 ) ( GREATER-THAN ?auto_1972 ?auto_1966 ) ( GREATER-THAN ?auto_1972 ?auto_1968 ) ( GREATER-THAN ?auto_1972 ?auto_1969 ) ( GREATER-THAN ?auto_1972 ?auto_1970 ) ( GREATER-THAN ?auto_1972 ?auto_1971 ) ( GREATER-THAN ?auto_1973 ?auto_1966 ) ( GREATER-THAN ?auto_1973 ?auto_1968 ) ( GREATER-THAN ?auto_1973 ?auto_1969 ) ( GREATER-THAN ?auto_1973 ?auto_1970 ) ( GREATER-THAN ?auto_1973 ?auto_1971 ) ( GREATER-THAN ?auto_1973 ?auto_1972 ) ( IN-CITY ?auto_1974 ?auto_1976 ) ( IN-CITY ?auto_1967 ?auto_1976 ) ( not ( = ?auto_1967 ?auto_1974 ) ) ( OBJ-AT ?auto_1973 ?auto_1974 ) ( OBJ-AT ?auto_1972 ?auto_1974 ) ( IN-CITY ?auto_1979 ?auto_1976 ) ( not ( = ?auto_1967 ?auto_1979 ) ) ( OBJ-AT ?auto_1971 ?auto_1979 ) ( IN-CITY ?auto_1977 ?auto_1976 ) ( not ( = ?auto_1967 ?auto_1977 ) ) ( OBJ-AT ?auto_1970 ?auto_1977 ) ( IN-CITY ?auto_1980 ?auto_1976 ) ( not ( = ?auto_1967 ?auto_1980 ) ) ( OBJ-AT ?auto_1969 ?auto_1980 ) ( IN-CITY ?auto_1978 ?auto_1976 ) ( not ( = ?auto_1967 ?auto_1978 ) ) ( OBJ-AT ?auto_1968 ?auto_1978 ) ( IN-CITY ?auto_1981 ?auto_1976 ) ( not ( = ?auto_1967 ?auto_1981 ) ) ( OBJ-AT ?auto_1966 ?auto_1981 ) ( TRUCK-AT ?auto_1975 ?auto_1967 ) ( not ( = ?auto_1966 ?auto_1968 ) ) ( not ( = ?auto_1978 ?auto_1981 ) ) ( not ( = ?auto_1966 ?auto_1969 ) ) ( not ( = ?auto_1968 ?auto_1969 ) ) ( not ( = ?auto_1980 ?auto_1978 ) ) ( not ( = ?auto_1980 ?auto_1981 ) ) ( not ( = ?auto_1966 ?auto_1970 ) ) ( not ( = ?auto_1968 ?auto_1970 ) ) ( not ( = ?auto_1969 ?auto_1970 ) ) ( not ( = ?auto_1977 ?auto_1980 ) ) ( not ( = ?auto_1977 ?auto_1978 ) ) ( not ( = ?auto_1977 ?auto_1981 ) ) ( not ( = ?auto_1966 ?auto_1971 ) ) ( not ( = ?auto_1968 ?auto_1971 ) ) ( not ( = ?auto_1969 ?auto_1971 ) ) ( not ( = ?auto_1970 ?auto_1971 ) ) ( not ( = ?auto_1979 ?auto_1977 ) ) ( not ( = ?auto_1979 ?auto_1980 ) ) ( not ( = ?auto_1979 ?auto_1978 ) ) ( not ( = ?auto_1979 ?auto_1981 ) ) ( not ( = ?auto_1966 ?auto_1972 ) ) ( not ( = ?auto_1968 ?auto_1972 ) ) ( not ( = ?auto_1969 ?auto_1972 ) ) ( not ( = ?auto_1970 ?auto_1972 ) ) ( not ( = ?auto_1971 ?auto_1972 ) ) ( not ( = ?auto_1974 ?auto_1979 ) ) ( not ( = ?auto_1974 ?auto_1977 ) ) ( not ( = ?auto_1974 ?auto_1980 ) ) ( not ( = ?auto_1974 ?auto_1978 ) ) ( not ( = ?auto_1974 ?auto_1981 ) ) ( not ( = ?auto_1966 ?auto_1973 ) ) ( not ( = ?auto_1968 ?auto_1973 ) ) ( not ( = ?auto_1969 ?auto_1973 ) ) ( not ( = ?auto_1970 ?auto_1973 ) ) ( not ( = ?auto_1971 ?auto_1973 ) ) ( not ( = ?auto_1972 ?auto_1973 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_1966 ?auto_1968 ?auto_1969 ?auto_1970 ?auto_1971 ?auto_1972 ?auto_1967 )
      ( DELIVER-1PKG ?auto_1973 ?auto_1967 )
      ( DELIVER-7PKG-VERIFY ?auto_1966 ?auto_1968 ?auto_1969 ?auto_1970 ?auto_1971 ?auto_1972 ?auto_1973 ?auto_1967 ) )
  )

)

