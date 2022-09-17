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
      ?auto_1862 - OBJ
      ?auto_1863 - LOCATION
    )
    :vars
    (
      ?auto_1864 - TRUCK
      ?auto_1865 - LOCATION
      ?auto_1866 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1864 ?auto_1865 ) ( IN-CITY ?auto_1865 ?auto_1866 ) ( IN-CITY ?auto_1863 ?auto_1866 ) ( not ( = ?auto_1863 ?auto_1865 ) ) ( OBJ-AT ?auto_1862 ?auto_1865 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1862 ?auto_1864 ?auto_1865 )
      ( !DRIVE-TRUCK ?auto_1864 ?auto_1865 ?auto_1863 ?auto_1866 )
      ( !UNLOAD-TRUCK ?auto_1862 ?auto_1864 ?auto_1863 )
      ( DELIVER-1PKG-VERIFY ?auto_1862 ?auto_1863 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1869 - OBJ
      ?auto_1870 - LOCATION
    )
    :vars
    (
      ?auto_1872 - LOCATION
      ?auto_1873 - CITY
      ?auto_1871 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1872 ?auto_1873 ) ( IN-CITY ?auto_1870 ?auto_1873 ) ( not ( = ?auto_1870 ?auto_1872 ) ) ( OBJ-AT ?auto_1869 ?auto_1872 ) ( TRUCK-AT ?auto_1871 ?auto_1870 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1871 ?auto_1870 ?auto_1872 ?auto_1873 )
      ( DELIVER-1PKG ?auto_1869 ?auto_1870 )
      ( DELIVER-1PKG-VERIFY ?auto_1869 ?auto_1870 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1876 - OBJ
      ?auto_1877 - LOCATION
    )
    :vars
    (
      ?auto_1878 - TRUCK
      ?auto_1879 - LOCATION
      ?auto_1880 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1878 ?auto_1879 ) ( IN-CITY ?auto_1879 ?auto_1880 ) ( IN-CITY ?auto_1877 ?auto_1880 ) ( not ( = ?auto_1877 ?auto_1879 ) ) ( OBJ-AT ?auto_1876 ?auto_1879 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1876 ?auto_1878 ?auto_1879 )
      ( !DRIVE-TRUCK ?auto_1878 ?auto_1879 ?auto_1877 ?auto_1880 )
      ( !UNLOAD-TRUCK ?auto_1876 ?auto_1878 ?auto_1877 )
      ( DELIVER-1PKG-VERIFY ?auto_1876 ?auto_1877 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1883 - OBJ
      ?auto_1884 - LOCATION
    )
    :vars
    (
      ?auto_1887 - LOCATION
      ?auto_1885 - CITY
      ?auto_1886 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1887 ?auto_1885 ) ( IN-CITY ?auto_1884 ?auto_1885 ) ( not ( = ?auto_1884 ?auto_1887 ) ) ( OBJ-AT ?auto_1883 ?auto_1887 ) ( TRUCK-AT ?auto_1886 ?auto_1884 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1886 ?auto_1884 ?auto_1887 ?auto_1885 )
      ( DELIVER-1PKG ?auto_1883 ?auto_1884 )
      ( DELIVER-1PKG-VERIFY ?auto_1883 ?auto_1884 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1891 - OBJ
      ?auto_1893 - OBJ
      ?auto_1892 - LOCATION
    )
    :vars
    (
      ?auto_1895 - LOCATION
      ?auto_1894 - CITY
      ?auto_1896 - TRUCK
      ?auto_1897 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1893 ?auto_1891 ) ( IN-CITY ?auto_1895 ?auto_1894 ) ( IN-CITY ?auto_1892 ?auto_1894 ) ( not ( = ?auto_1892 ?auto_1895 ) ) ( OBJ-AT ?auto_1893 ?auto_1895 ) ( TRUCK-AT ?auto_1896 ?auto_1897 ) ( IN-CITY ?auto_1897 ?auto_1894 ) ( not ( = ?auto_1892 ?auto_1897 ) ) ( OBJ-AT ?auto_1891 ?auto_1897 ) ( not ( = ?auto_1891 ?auto_1893 ) ) ( not ( = ?auto_1895 ?auto_1897 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1891 ?auto_1892 )
      ( DELIVER-1PKG ?auto_1893 ?auto_1892 )
      ( DELIVER-2PKG-VERIFY ?auto_1891 ?auto_1893 ?auto_1892 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1901 - OBJ
      ?auto_1903 - OBJ
      ?auto_1902 - LOCATION
    )
    :vars
    (
      ?auto_1904 - LOCATION
      ?auto_1907 - CITY
      ?auto_1906 - LOCATION
      ?auto_1905 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1903 ?auto_1901 ) ( IN-CITY ?auto_1904 ?auto_1907 ) ( IN-CITY ?auto_1902 ?auto_1907 ) ( not ( = ?auto_1902 ?auto_1904 ) ) ( OBJ-AT ?auto_1903 ?auto_1904 ) ( IN-CITY ?auto_1906 ?auto_1907 ) ( not ( = ?auto_1902 ?auto_1906 ) ) ( OBJ-AT ?auto_1901 ?auto_1906 ) ( not ( = ?auto_1901 ?auto_1903 ) ) ( not ( = ?auto_1904 ?auto_1906 ) ) ( TRUCK-AT ?auto_1905 ?auto_1902 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1905 ?auto_1902 ?auto_1906 ?auto_1907 )
      ( DELIVER-2PKG ?auto_1901 ?auto_1903 ?auto_1902 )
      ( DELIVER-2PKG-VERIFY ?auto_1901 ?auto_1903 ?auto_1902 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1910 - OBJ
      ?auto_1911 - LOCATION
    )
    :vars
    (
      ?auto_1912 - TRUCK
      ?auto_1913 - LOCATION
      ?auto_1914 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1912 ?auto_1913 ) ( IN-CITY ?auto_1913 ?auto_1914 ) ( IN-CITY ?auto_1911 ?auto_1914 ) ( not ( = ?auto_1911 ?auto_1913 ) ) ( OBJ-AT ?auto_1910 ?auto_1913 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1910 ?auto_1912 ?auto_1913 )
      ( !DRIVE-TRUCK ?auto_1912 ?auto_1913 ?auto_1911 ?auto_1914 )
      ( !UNLOAD-TRUCK ?auto_1910 ?auto_1912 ?auto_1911 )
      ( DELIVER-1PKG-VERIFY ?auto_1910 ?auto_1911 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1917 - OBJ
      ?auto_1918 - LOCATION
    )
    :vars
    (
      ?auto_1920 - LOCATION
      ?auto_1919 - CITY
      ?auto_1921 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1920 ?auto_1919 ) ( IN-CITY ?auto_1918 ?auto_1919 ) ( not ( = ?auto_1918 ?auto_1920 ) ) ( OBJ-AT ?auto_1917 ?auto_1920 ) ( TRUCK-AT ?auto_1921 ?auto_1918 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1921 ?auto_1918 ?auto_1920 ?auto_1919 )
      ( DELIVER-1PKG ?auto_1917 ?auto_1918 )
      ( DELIVER-1PKG-VERIFY ?auto_1917 ?auto_1918 ) )
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
      ?auto_1932 - LOCATION
      ?auto_1931 - CITY
      ?auto_1933 - LOCATION
      ?auto_1930 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1928 ?auto_1926 ) ( GREATER-THAN ?auto_1929 ?auto_1926 ) ( GREATER-THAN ?auto_1929 ?auto_1928 ) ( IN-CITY ?auto_1932 ?auto_1931 ) ( IN-CITY ?auto_1927 ?auto_1931 ) ( not ( = ?auto_1927 ?auto_1932 ) ) ( OBJ-AT ?auto_1929 ?auto_1932 ) ( IN-CITY ?auto_1933 ?auto_1931 ) ( not ( = ?auto_1927 ?auto_1933 ) ) ( OBJ-AT ?auto_1928 ?auto_1933 ) ( TRUCK-AT ?auto_1930 ?auto_1932 ) ( OBJ-AT ?auto_1926 ?auto_1932 ) ( not ( = ?auto_1926 ?auto_1928 ) ) ( not ( = ?auto_1933 ?auto_1932 ) ) ( not ( = ?auto_1926 ?auto_1929 ) ) ( not ( = ?auto_1928 ?auto_1929 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1926 ?auto_1928 ?auto_1927 )
      ( DELIVER-1PKG ?auto_1929 ?auto_1927 )
      ( DELIVER-3PKG-VERIFY ?auto_1926 ?auto_1928 ?auto_1929 ?auto_1927 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1938 - OBJ
      ?auto_1940 - OBJ
      ?auto_1941 - OBJ
      ?auto_1939 - LOCATION
    )
    :vars
    (
      ?auto_1944 - LOCATION
      ?auto_1942 - CITY
      ?auto_1945 - LOCATION
      ?auto_1943 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1940 ?auto_1938 ) ( GREATER-THAN ?auto_1941 ?auto_1938 ) ( GREATER-THAN ?auto_1941 ?auto_1940 ) ( IN-CITY ?auto_1944 ?auto_1942 ) ( IN-CITY ?auto_1939 ?auto_1942 ) ( not ( = ?auto_1939 ?auto_1944 ) ) ( OBJ-AT ?auto_1941 ?auto_1944 ) ( IN-CITY ?auto_1945 ?auto_1942 ) ( not ( = ?auto_1939 ?auto_1945 ) ) ( OBJ-AT ?auto_1940 ?auto_1945 ) ( OBJ-AT ?auto_1938 ?auto_1944 ) ( not ( = ?auto_1938 ?auto_1940 ) ) ( not ( = ?auto_1945 ?auto_1944 ) ) ( not ( = ?auto_1938 ?auto_1941 ) ) ( not ( = ?auto_1940 ?auto_1941 ) ) ( TRUCK-AT ?auto_1943 ?auto_1939 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1943 ?auto_1939 ?auto_1944 ?auto_1942 )
      ( DELIVER-3PKG ?auto_1938 ?auto_1940 ?auto_1941 ?auto_1939 )
      ( DELIVER-3PKG-VERIFY ?auto_1938 ?auto_1940 ?auto_1941 ?auto_1939 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1948 - OBJ
      ?auto_1949 - LOCATION
    )
    :vars
    (
      ?auto_1950 - TRUCK
      ?auto_1951 - LOCATION
      ?auto_1952 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1950 ?auto_1951 ) ( IN-CITY ?auto_1951 ?auto_1952 ) ( IN-CITY ?auto_1949 ?auto_1952 ) ( not ( = ?auto_1949 ?auto_1951 ) ) ( OBJ-AT ?auto_1948 ?auto_1951 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1948 ?auto_1950 ?auto_1951 )
      ( !DRIVE-TRUCK ?auto_1950 ?auto_1951 ?auto_1949 ?auto_1952 )
      ( !UNLOAD-TRUCK ?auto_1948 ?auto_1950 ?auto_1949 )
      ( DELIVER-1PKG-VERIFY ?auto_1948 ?auto_1949 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1955 - OBJ
      ?auto_1956 - LOCATION
    )
    :vars
    (
      ?auto_1957 - LOCATION
      ?auto_1958 - CITY
      ?auto_1959 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1957 ?auto_1958 ) ( IN-CITY ?auto_1956 ?auto_1958 ) ( not ( = ?auto_1956 ?auto_1957 ) ) ( OBJ-AT ?auto_1955 ?auto_1957 ) ( TRUCK-AT ?auto_1959 ?auto_1956 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1959 ?auto_1956 ?auto_1957 ?auto_1958 )
      ( DELIVER-1PKG ?auto_1955 ?auto_1956 )
      ( DELIVER-1PKG-VERIFY ?auto_1955 ?auto_1956 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1965 - OBJ
      ?auto_1967 - OBJ
      ?auto_1968 - OBJ
      ?auto_1969 - OBJ
      ?auto_1966 - LOCATION
    )
    :vars
    (
      ?auto_1971 - LOCATION
      ?auto_1972 - CITY
      ?auto_1973 - LOCATION
      ?auto_1970 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1967 ?auto_1965 ) ( GREATER-THAN ?auto_1968 ?auto_1965 ) ( GREATER-THAN ?auto_1968 ?auto_1967 ) ( GREATER-THAN ?auto_1969 ?auto_1965 ) ( GREATER-THAN ?auto_1969 ?auto_1967 ) ( GREATER-THAN ?auto_1969 ?auto_1968 ) ( IN-CITY ?auto_1971 ?auto_1972 ) ( IN-CITY ?auto_1966 ?auto_1972 ) ( not ( = ?auto_1966 ?auto_1971 ) ) ( OBJ-AT ?auto_1969 ?auto_1971 ) ( IN-CITY ?auto_1973 ?auto_1972 ) ( not ( = ?auto_1966 ?auto_1973 ) ) ( OBJ-AT ?auto_1968 ?auto_1973 ) ( OBJ-AT ?auto_1967 ?auto_1971 ) ( TRUCK-AT ?auto_1970 ?auto_1973 ) ( OBJ-AT ?auto_1965 ?auto_1973 ) ( not ( = ?auto_1965 ?auto_1967 ) ) ( not ( = ?auto_1971 ?auto_1973 ) ) ( not ( = ?auto_1965 ?auto_1968 ) ) ( not ( = ?auto_1967 ?auto_1968 ) ) ( not ( = ?auto_1965 ?auto_1969 ) ) ( not ( = ?auto_1967 ?auto_1969 ) ) ( not ( = ?auto_1968 ?auto_1969 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1965 ?auto_1967 ?auto_1968 ?auto_1966 )
      ( DELIVER-1PKG ?auto_1969 ?auto_1966 )
      ( DELIVER-4PKG-VERIFY ?auto_1965 ?auto_1967 ?auto_1968 ?auto_1969 ?auto_1966 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_1979 - OBJ
      ?auto_1981 - OBJ
      ?auto_1982 - OBJ
      ?auto_1983 - OBJ
      ?auto_1980 - LOCATION
    )
    :vars
    (
      ?auto_1985 - LOCATION
      ?auto_1986 - CITY
      ?auto_1984 - LOCATION
      ?auto_1987 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1981 ?auto_1979 ) ( GREATER-THAN ?auto_1982 ?auto_1979 ) ( GREATER-THAN ?auto_1982 ?auto_1981 ) ( GREATER-THAN ?auto_1983 ?auto_1979 ) ( GREATER-THAN ?auto_1983 ?auto_1981 ) ( GREATER-THAN ?auto_1983 ?auto_1982 ) ( IN-CITY ?auto_1985 ?auto_1986 ) ( IN-CITY ?auto_1980 ?auto_1986 ) ( not ( = ?auto_1980 ?auto_1985 ) ) ( OBJ-AT ?auto_1983 ?auto_1985 ) ( IN-CITY ?auto_1984 ?auto_1986 ) ( not ( = ?auto_1980 ?auto_1984 ) ) ( OBJ-AT ?auto_1982 ?auto_1984 ) ( OBJ-AT ?auto_1981 ?auto_1985 ) ( OBJ-AT ?auto_1979 ?auto_1984 ) ( not ( = ?auto_1979 ?auto_1981 ) ) ( not ( = ?auto_1985 ?auto_1984 ) ) ( not ( = ?auto_1979 ?auto_1982 ) ) ( not ( = ?auto_1981 ?auto_1982 ) ) ( not ( = ?auto_1979 ?auto_1983 ) ) ( not ( = ?auto_1981 ?auto_1983 ) ) ( not ( = ?auto_1982 ?auto_1983 ) ) ( TRUCK-AT ?auto_1987 ?auto_1980 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1987 ?auto_1980 ?auto_1984 ?auto_1986 )
      ( DELIVER-4PKG ?auto_1979 ?auto_1981 ?auto_1982 ?auto_1983 ?auto_1980 )
      ( DELIVER-4PKG-VERIFY ?auto_1979 ?auto_1981 ?auto_1982 ?auto_1983 ?auto_1980 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1990 - OBJ
      ?auto_1991 - LOCATION
    )
    :vars
    (
      ?auto_1992 - TRUCK
      ?auto_1993 - LOCATION
      ?auto_1994 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1992 ?auto_1993 ) ( IN-CITY ?auto_1993 ?auto_1994 ) ( IN-CITY ?auto_1991 ?auto_1994 ) ( not ( = ?auto_1991 ?auto_1993 ) ) ( OBJ-AT ?auto_1990 ?auto_1993 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1990 ?auto_1992 ?auto_1993 )
      ( !DRIVE-TRUCK ?auto_1992 ?auto_1993 ?auto_1991 ?auto_1994 )
      ( !UNLOAD-TRUCK ?auto_1990 ?auto_1992 ?auto_1991 )
      ( DELIVER-1PKG-VERIFY ?auto_1990 ?auto_1991 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1997 - OBJ
      ?auto_1998 - LOCATION
    )
    :vars
    (
      ?auto_2000 - LOCATION
      ?auto_2001 - CITY
      ?auto_1999 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2000 ?auto_2001 ) ( IN-CITY ?auto_1998 ?auto_2001 ) ( not ( = ?auto_1998 ?auto_2000 ) ) ( OBJ-AT ?auto_1997 ?auto_2000 ) ( TRUCK-AT ?auto_1999 ?auto_1998 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1999 ?auto_1998 ?auto_2000 ?auto_2001 )
      ( DELIVER-1PKG ?auto_1997 ?auto_1998 )
      ( DELIVER-1PKG-VERIFY ?auto_1997 ?auto_1998 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2008 - OBJ
      ?auto_2010 - OBJ
      ?auto_2011 - OBJ
      ?auto_2013 - OBJ
      ?auto_2012 - OBJ
      ?auto_2009 - LOCATION
    )
    :vars
    (
      ?auto_2016 - LOCATION
      ?auto_2014 - CITY
      ?auto_2017 - LOCATION
      ?auto_2015 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2010 ?auto_2008 ) ( GREATER-THAN ?auto_2011 ?auto_2008 ) ( GREATER-THAN ?auto_2011 ?auto_2010 ) ( GREATER-THAN ?auto_2013 ?auto_2008 ) ( GREATER-THAN ?auto_2013 ?auto_2010 ) ( GREATER-THAN ?auto_2013 ?auto_2011 ) ( GREATER-THAN ?auto_2012 ?auto_2008 ) ( GREATER-THAN ?auto_2012 ?auto_2010 ) ( GREATER-THAN ?auto_2012 ?auto_2011 ) ( GREATER-THAN ?auto_2012 ?auto_2013 ) ( IN-CITY ?auto_2016 ?auto_2014 ) ( IN-CITY ?auto_2009 ?auto_2014 ) ( not ( = ?auto_2009 ?auto_2016 ) ) ( OBJ-AT ?auto_2012 ?auto_2016 ) ( OBJ-AT ?auto_2013 ?auto_2016 ) ( IN-CITY ?auto_2017 ?auto_2014 ) ( not ( = ?auto_2009 ?auto_2017 ) ) ( OBJ-AT ?auto_2011 ?auto_2017 ) ( OBJ-AT ?auto_2010 ?auto_2016 ) ( TRUCK-AT ?auto_2015 ?auto_2017 ) ( OBJ-AT ?auto_2008 ?auto_2017 ) ( not ( = ?auto_2008 ?auto_2010 ) ) ( not ( = ?auto_2016 ?auto_2017 ) ) ( not ( = ?auto_2008 ?auto_2011 ) ) ( not ( = ?auto_2010 ?auto_2011 ) ) ( not ( = ?auto_2008 ?auto_2013 ) ) ( not ( = ?auto_2010 ?auto_2013 ) ) ( not ( = ?auto_2011 ?auto_2013 ) ) ( not ( = ?auto_2008 ?auto_2012 ) ) ( not ( = ?auto_2010 ?auto_2012 ) ) ( not ( = ?auto_2011 ?auto_2012 ) ) ( not ( = ?auto_2013 ?auto_2012 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2008 ?auto_2010 ?auto_2011 ?auto_2013 ?auto_2009 )
      ( DELIVER-1PKG ?auto_2012 ?auto_2009 )
      ( DELIVER-5PKG-VERIFY ?auto_2008 ?auto_2010 ?auto_2011 ?auto_2013 ?auto_2012 ?auto_2009 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2024 - OBJ
      ?auto_2026 - OBJ
      ?auto_2027 - OBJ
      ?auto_2029 - OBJ
      ?auto_2028 - OBJ
      ?auto_2025 - LOCATION
    )
    :vars
    (
      ?auto_2032 - LOCATION
      ?auto_2033 - CITY
      ?auto_2030 - LOCATION
      ?auto_2031 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2026 ?auto_2024 ) ( GREATER-THAN ?auto_2027 ?auto_2024 ) ( GREATER-THAN ?auto_2027 ?auto_2026 ) ( GREATER-THAN ?auto_2029 ?auto_2024 ) ( GREATER-THAN ?auto_2029 ?auto_2026 ) ( GREATER-THAN ?auto_2029 ?auto_2027 ) ( GREATER-THAN ?auto_2028 ?auto_2024 ) ( GREATER-THAN ?auto_2028 ?auto_2026 ) ( GREATER-THAN ?auto_2028 ?auto_2027 ) ( GREATER-THAN ?auto_2028 ?auto_2029 ) ( IN-CITY ?auto_2032 ?auto_2033 ) ( IN-CITY ?auto_2025 ?auto_2033 ) ( not ( = ?auto_2025 ?auto_2032 ) ) ( OBJ-AT ?auto_2028 ?auto_2032 ) ( OBJ-AT ?auto_2029 ?auto_2032 ) ( IN-CITY ?auto_2030 ?auto_2033 ) ( not ( = ?auto_2025 ?auto_2030 ) ) ( OBJ-AT ?auto_2027 ?auto_2030 ) ( OBJ-AT ?auto_2026 ?auto_2032 ) ( OBJ-AT ?auto_2024 ?auto_2030 ) ( not ( = ?auto_2024 ?auto_2026 ) ) ( not ( = ?auto_2032 ?auto_2030 ) ) ( not ( = ?auto_2024 ?auto_2027 ) ) ( not ( = ?auto_2026 ?auto_2027 ) ) ( not ( = ?auto_2024 ?auto_2029 ) ) ( not ( = ?auto_2026 ?auto_2029 ) ) ( not ( = ?auto_2027 ?auto_2029 ) ) ( not ( = ?auto_2024 ?auto_2028 ) ) ( not ( = ?auto_2026 ?auto_2028 ) ) ( not ( = ?auto_2027 ?auto_2028 ) ) ( not ( = ?auto_2029 ?auto_2028 ) ) ( TRUCK-AT ?auto_2031 ?auto_2025 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2031 ?auto_2025 ?auto_2030 ?auto_2033 )
      ( DELIVER-5PKG ?auto_2024 ?auto_2026 ?auto_2027 ?auto_2029 ?auto_2028 ?auto_2025 )
      ( DELIVER-5PKG-VERIFY ?auto_2024 ?auto_2026 ?auto_2027 ?auto_2029 ?auto_2028 ?auto_2025 ) )
  )

)

