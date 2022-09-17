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
      ?auto_1944 - OBJ
      ?auto_1945 - LOCATION
    )
    :vars
    (
      ?auto_1954 - LOCATION
      ?auto_1951 - CITY
      ?auto_1946 - TRUCK
      ?auto_1957 - LOCATION
      ?auto_1958 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_1954 ?auto_1951 ) ( IN-CITY ?auto_1945 ?auto_1951 ) ( not ( = ?auto_1945 ?auto_1954 ) ) ( OBJ-AT ?auto_1944 ?auto_1954 ) ( TRUCK-AT ?auto_1946 ?auto_1957 ) ( IN-CITY ?auto_1957 ?auto_1958 ) ( IN-CITY ?auto_1954 ?auto_1958 ) ( not ( = ?auto_1954 ?auto_1957 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1946 ?auto_1957 ?auto_1954 ?auto_1958 )
      ( !LOAD-TRUCK ?auto_1944 ?auto_1946 ?auto_1954 )
      ( !DRIVE-TRUCK ?auto_1946 ?auto_1954 ?auto_1945 ?auto_1951 )
      ( !UNLOAD-TRUCK ?auto_1944 ?auto_1946 ?auto_1945 )
      ( DELIVER-1PKG-VERIFY ?auto_1944 ?auto_1945 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1981 - OBJ
      ?auto_1983 - OBJ
      ?auto_1987 - LOCATION
    )
    :vars
    (
      ?auto_1989 - LOCATION
      ?auto_1985 - CITY
      ?auto_1986 - CITY
      ?auto_1995 - LOCATION
      ?auto_1996 - CITY
      ?auto_1984 - TRUCK
      ?auto_1992 - LOCATION
      ?auto_1991 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_1983 ?auto_1981 ) ( IN-CITY ?auto_1989 ?auto_1985 ) ( IN-CITY ?auto_1987 ?auto_1985 ) ( not ( = ?auto_1987 ?auto_1989 ) ) ( OBJ-AT ?auto_1983 ?auto_1989 ) ( IN-CITY ?auto_1987 ?auto_1986 ) ( IN-CITY ?auto_1989 ?auto_1986 ) ( IN-CITY ?auto_1995 ?auto_1996 ) ( IN-CITY ?auto_1987 ?auto_1996 ) ( not ( = ?auto_1987 ?auto_1995 ) ) ( OBJ-AT ?auto_1981 ?auto_1995 ) ( TRUCK-AT ?auto_1984 ?auto_1992 ) ( IN-CITY ?auto_1992 ?auto_1991 ) ( IN-CITY ?auto_1995 ?auto_1991 ) ( not ( = ?auto_1995 ?auto_1992 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1981 ?auto_1987 )
      ( DELIVER-1PKG ?auto_1983 ?auto_1987 )
      ( DELIVER-2PKG-VERIFY ?auto_1981 ?auto_1983 ?auto_1987 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2020 - OBJ
      ?auto_2022 - OBJ
      ?auto_2023 - OBJ
      ?auto_2029 - LOCATION
    )
    :vars
    (
      ?auto_2030 - LOCATION
      ?auto_2025 - CITY
      ?auto_2024 - CITY
      ?auto_2033 - LOCATION
      ?auto_2034 - CITY
      ?auto_2039 - CITY
      ?auto_2035 - LOCATION
      ?auto_2037 - CITY
      ?auto_2028 - TRUCK
      ?auto_2041 - LOCATION
      ?auto_2036 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2022 ?auto_2020 ) ( GREATER-THAN ?auto_2023 ?auto_2020 ) ( GREATER-THAN ?auto_2023 ?auto_2022 ) ( IN-CITY ?auto_2030 ?auto_2025 ) ( IN-CITY ?auto_2029 ?auto_2025 ) ( not ( = ?auto_2029 ?auto_2030 ) ) ( OBJ-AT ?auto_2023 ?auto_2030 ) ( IN-CITY ?auto_2029 ?auto_2024 ) ( IN-CITY ?auto_2030 ?auto_2024 ) ( IN-CITY ?auto_2033 ?auto_2034 ) ( IN-CITY ?auto_2029 ?auto_2034 ) ( not ( = ?auto_2029 ?auto_2033 ) ) ( OBJ-AT ?auto_2022 ?auto_2033 ) ( IN-CITY ?auto_2029 ?auto_2039 ) ( IN-CITY ?auto_2033 ?auto_2039 ) ( IN-CITY ?auto_2035 ?auto_2037 ) ( IN-CITY ?auto_2029 ?auto_2037 ) ( not ( = ?auto_2029 ?auto_2035 ) ) ( OBJ-AT ?auto_2020 ?auto_2035 ) ( TRUCK-AT ?auto_2028 ?auto_2041 ) ( IN-CITY ?auto_2041 ?auto_2036 ) ( IN-CITY ?auto_2035 ?auto_2036 ) ( not ( = ?auto_2035 ?auto_2041 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2020 ?auto_2022 ?auto_2029 )
      ( DELIVER-1PKG ?auto_2023 ?auto_2029 )
      ( DELIVER-3PKG-VERIFY ?auto_2020 ?auto_2022 ?auto_2023 ?auto_2029 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2065 - OBJ
      ?auto_2067 - OBJ
      ?auto_2068 - OBJ
      ?auto_2069 - OBJ
      ?auto_2073 - LOCATION
    )
    :vars
    (
      ?auto_2076 - LOCATION
      ?auto_2074 - CITY
      ?auto_2075 - CITY
      ?auto_2088 - LOCATION
      ?auto_2090 - CITY
      ?auto_2081 - CITY
      ?auto_2083 - LOCATION
      ?auto_2087 - CITY
      ?auto_2089 - CITY
      ?auto_2086 - LOCATION
      ?auto_2084 - CITY
      ?auto_2072 - TRUCK
      ?auto_2082 - LOCATION
      ?auto_2085 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2067 ?auto_2065 ) ( GREATER-THAN ?auto_2068 ?auto_2065 ) ( GREATER-THAN ?auto_2068 ?auto_2067 ) ( GREATER-THAN ?auto_2069 ?auto_2065 ) ( GREATER-THAN ?auto_2069 ?auto_2067 ) ( GREATER-THAN ?auto_2069 ?auto_2068 ) ( IN-CITY ?auto_2076 ?auto_2074 ) ( IN-CITY ?auto_2073 ?auto_2074 ) ( not ( = ?auto_2073 ?auto_2076 ) ) ( OBJ-AT ?auto_2069 ?auto_2076 ) ( IN-CITY ?auto_2073 ?auto_2075 ) ( IN-CITY ?auto_2076 ?auto_2075 ) ( IN-CITY ?auto_2088 ?auto_2090 ) ( IN-CITY ?auto_2073 ?auto_2090 ) ( not ( = ?auto_2073 ?auto_2088 ) ) ( OBJ-AT ?auto_2068 ?auto_2088 ) ( IN-CITY ?auto_2073 ?auto_2081 ) ( IN-CITY ?auto_2088 ?auto_2081 ) ( IN-CITY ?auto_2083 ?auto_2087 ) ( IN-CITY ?auto_2073 ?auto_2087 ) ( not ( = ?auto_2073 ?auto_2083 ) ) ( OBJ-AT ?auto_2067 ?auto_2083 ) ( IN-CITY ?auto_2073 ?auto_2089 ) ( IN-CITY ?auto_2083 ?auto_2089 ) ( IN-CITY ?auto_2086 ?auto_2084 ) ( IN-CITY ?auto_2073 ?auto_2084 ) ( not ( = ?auto_2073 ?auto_2086 ) ) ( OBJ-AT ?auto_2065 ?auto_2086 ) ( TRUCK-AT ?auto_2072 ?auto_2082 ) ( IN-CITY ?auto_2082 ?auto_2085 ) ( IN-CITY ?auto_2086 ?auto_2085 ) ( not ( = ?auto_2086 ?auto_2082 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2065 ?auto_2067 ?auto_2068 ?auto_2073 )
      ( DELIVER-1PKG ?auto_2069 ?auto_2073 )
      ( DELIVER-4PKG-VERIFY ?auto_2065 ?auto_2067 ?auto_2068 ?auto_2069 ?auto_2073 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2116 - OBJ
      ?auto_2118 - OBJ
      ?auto_2119 - OBJ
      ?auto_2120 - OBJ
      ?auto_2121 - OBJ
      ?auto_2127 - LOCATION
    )
    :vars
    (
      ?auto_2123 - LOCATION
      ?auto_2122 - CITY
      ?auto_2125 - CITY
      ?auto_2137 - LOCATION
      ?auto_2141 - CITY
      ?auto_2139 - CITY
      ?auto_2132 - LOCATION
      ?auto_2142 - CITY
      ?auto_2146 - CITY
      ?auto_2145 - LOCATION
      ?auto_2133 - CITY
      ?auto_2134 - CITY
      ?auto_2144 - LOCATION
      ?auto_2143 - CITY
      ?auto_2124 - TRUCK
      ?auto_2147 - LOCATION
      ?auto_2131 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2118 ?auto_2116 ) ( GREATER-THAN ?auto_2119 ?auto_2116 ) ( GREATER-THAN ?auto_2119 ?auto_2118 ) ( GREATER-THAN ?auto_2120 ?auto_2116 ) ( GREATER-THAN ?auto_2120 ?auto_2118 ) ( GREATER-THAN ?auto_2120 ?auto_2119 ) ( GREATER-THAN ?auto_2121 ?auto_2116 ) ( GREATER-THAN ?auto_2121 ?auto_2118 ) ( GREATER-THAN ?auto_2121 ?auto_2119 ) ( GREATER-THAN ?auto_2121 ?auto_2120 ) ( IN-CITY ?auto_2123 ?auto_2122 ) ( IN-CITY ?auto_2127 ?auto_2122 ) ( not ( = ?auto_2127 ?auto_2123 ) ) ( OBJ-AT ?auto_2121 ?auto_2123 ) ( IN-CITY ?auto_2127 ?auto_2125 ) ( IN-CITY ?auto_2123 ?auto_2125 ) ( IN-CITY ?auto_2137 ?auto_2141 ) ( IN-CITY ?auto_2127 ?auto_2141 ) ( not ( = ?auto_2127 ?auto_2137 ) ) ( OBJ-AT ?auto_2120 ?auto_2137 ) ( IN-CITY ?auto_2127 ?auto_2139 ) ( IN-CITY ?auto_2137 ?auto_2139 ) ( IN-CITY ?auto_2132 ?auto_2142 ) ( IN-CITY ?auto_2127 ?auto_2142 ) ( not ( = ?auto_2127 ?auto_2132 ) ) ( OBJ-AT ?auto_2119 ?auto_2132 ) ( IN-CITY ?auto_2127 ?auto_2146 ) ( IN-CITY ?auto_2132 ?auto_2146 ) ( IN-CITY ?auto_2145 ?auto_2133 ) ( IN-CITY ?auto_2127 ?auto_2133 ) ( not ( = ?auto_2127 ?auto_2145 ) ) ( OBJ-AT ?auto_2118 ?auto_2145 ) ( IN-CITY ?auto_2127 ?auto_2134 ) ( IN-CITY ?auto_2145 ?auto_2134 ) ( IN-CITY ?auto_2144 ?auto_2143 ) ( IN-CITY ?auto_2127 ?auto_2143 ) ( not ( = ?auto_2127 ?auto_2144 ) ) ( OBJ-AT ?auto_2116 ?auto_2144 ) ( TRUCK-AT ?auto_2124 ?auto_2147 ) ( IN-CITY ?auto_2147 ?auto_2131 ) ( IN-CITY ?auto_2144 ?auto_2131 ) ( not ( = ?auto_2144 ?auto_2147 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2116 ?auto_2118 ?auto_2119 ?auto_2120 ?auto_2127 )
      ( DELIVER-1PKG ?auto_2121 ?auto_2127 )
      ( DELIVER-5PKG-VERIFY ?auto_2116 ?auto_2118 ?auto_2119 ?auto_2120 ?auto_2121 ?auto_2127 ) )
  )

)

