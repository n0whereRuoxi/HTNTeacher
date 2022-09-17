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
      ?auto_2036 - OBJ
      ?auto_2037 - LOCATION
    )
    :vars
    (
      ?auto_2038 - TRUCK
      ?auto_2039 - LOCATION
      ?auto_2040 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2038 ?auto_2039 ) ( IN-CITY ?auto_2039 ?auto_2040 ) ( IN-CITY ?auto_2037 ?auto_2040 ) ( not ( = ?auto_2037 ?auto_2039 ) ) ( OBJ-AT ?auto_2036 ?auto_2039 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2036 ?auto_2038 ?auto_2039 )
      ( !DRIVE-TRUCK ?auto_2038 ?auto_2039 ?auto_2037 ?auto_2040 )
      ( !UNLOAD-TRUCK ?auto_2036 ?auto_2038 ?auto_2037 )
      ( DELIVER-1PKG-VERIFY ?auto_2036 ?auto_2037 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2043 - OBJ
      ?auto_2044 - LOCATION
    )
    :vars
    (
      ?auto_2046 - LOCATION
      ?auto_2045 - CITY
      ?auto_2047 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2046 ?auto_2045 ) ( IN-CITY ?auto_2044 ?auto_2045 ) ( not ( = ?auto_2044 ?auto_2046 ) ) ( OBJ-AT ?auto_2043 ?auto_2046 ) ( TRUCK-AT ?auto_2047 ?auto_2044 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2047 ?auto_2044 ?auto_2046 ?auto_2045 )
      ( DELIVER-1PKG ?auto_2043 ?auto_2044 )
      ( DELIVER-1PKG-VERIFY ?auto_2043 ?auto_2044 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2050 - OBJ
      ?auto_2051 - LOCATION
    )
    :vars
    (
      ?auto_2052 - TRUCK
      ?auto_2053 - LOCATION
      ?auto_2054 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2052 ?auto_2053 ) ( IN-CITY ?auto_2053 ?auto_2054 ) ( IN-CITY ?auto_2051 ?auto_2054 ) ( not ( = ?auto_2051 ?auto_2053 ) ) ( OBJ-AT ?auto_2050 ?auto_2053 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2050 ?auto_2052 ?auto_2053 )
      ( !DRIVE-TRUCK ?auto_2052 ?auto_2053 ?auto_2051 ?auto_2054 )
      ( !UNLOAD-TRUCK ?auto_2050 ?auto_2052 ?auto_2051 )
      ( DELIVER-1PKG-VERIFY ?auto_2050 ?auto_2051 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2057 - OBJ
      ?auto_2058 - LOCATION
    )
    :vars
    (
      ?auto_2059 - LOCATION
      ?auto_2060 - CITY
      ?auto_2061 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2059 ?auto_2060 ) ( IN-CITY ?auto_2058 ?auto_2060 ) ( not ( = ?auto_2058 ?auto_2059 ) ) ( OBJ-AT ?auto_2057 ?auto_2059 ) ( TRUCK-AT ?auto_2061 ?auto_2058 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2061 ?auto_2058 ?auto_2059 ?auto_2060 )
      ( DELIVER-1PKG ?auto_2057 ?auto_2058 )
      ( DELIVER-1PKG-VERIFY ?auto_2057 ?auto_2058 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2065 - OBJ
      ?auto_2067 - OBJ
      ?auto_2066 - LOCATION
    )
    :vars
    (
      ?auto_2068 - LOCATION
      ?auto_2069 - CITY
      ?auto_2070 - TRUCK
      ?auto_2071 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2067 ?auto_2065 ) ( IN-CITY ?auto_2068 ?auto_2069 ) ( IN-CITY ?auto_2066 ?auto_2069 ) ( not ( = ?auto_2066 ?auto_2068 ) ) ( OBJ-AT ?auto_2067 ?auto_2068 ) ( TRUCK-AT ?auto_2070 ?auto_2071 ) ( IN-CITY ?auto_2071 ?auto_2069 ) ( not ( = ?auto_2066 ?auto_2071 ) ) ( OBJ-AT ?auto_2065 ?auto_2071 ) ( not ( = ?auto_2065 ?auto_2067 ) ) ( not ( = ?auto_2068 ?auto_2071 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2065 ?auto_2066 )
      ( DELIVER-1PKG ?auto_2067 ?auto_2066 )
      ( DELIVER-2PKG-VERIFY ?auto_2065 ?auto_2067 ?auto_2066 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2075 - OBJ
      ?auto_2077 - OBJ
      ?auto_2076 - LOCATION
    )
    :vars
    (
      ?auto_2079 - LOCATION
      ?auto_2078 - CITY
      ?auto_2081 - LOCATION
      ?auto_2080 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2077 ?auto_2075 ) ( IN-CITY ?auto_2079 ?auto_2078 ) ( IN-CITY ?auto_2076 ?auto_2078 ) ( not ( = ?auto_2076 ?auto_2079 ) ) ( OBJ-AT ?auto_2077 ?auto_2079 ) ( IN-CITY ?auto_2081 ?auto_2078 ) ( not ( = ?auto_2076 ?auto_2081 ) ) ( OBJ-AT ?auto_2075 ?auto_2081 ) ( not ( = ?auto_2075 ?auto_2077 ) ) ( not ( = ?auto_2079 ?auto_2081 ) ) ( TRUCK-AT ?auto_2080 ?auto_2076 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2080 ?auto_2076 ?auto_2081 ?auto_2078 )
      ( DELIVER-2PKG ?auto_2075 ?auto_2077 ?auto_2076 )
      ( DELIVER-2PKG-VERIFY ?auto_2075 ?auto_2077 ?auto_2076 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2084 - OBJ
      ?auto_2085 - LOCATION
    )
    :vars
    (
      ?auto_2086 - TRUCK
      ?auto_2087 - LOCATION
      ?auto_2088 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2086 ?auto_2087 ) ( IN-CITY ?auto_2087 ?auto_2088 ) ( IN-CITY ?auto_2085 ?auto_2088 ) ( not ( = ?auto_2085 ?auto_2087 ) ) ( OBJ-AT ?auto_2084 ?auto_2087 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2084 ?auto_2086 ?auto_2087 )
      ( !DRIVE-TRUCK ?auto_2086 ?auto_2087 ?auto_2085 ?auto_2088 )
      ( !UNLOAD-TRUCK ?auto_2084 ?auto_2086 ?auto_2085 )
      ( DELIVER-1PKG-VERIFY ?auto_2084 ?auto_2085 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2091 - OBJ
      ?auto_2092 - LOCATION
    )
    :vars
    (
      ?auto_2093 - LOCATION
      ?auto_2094 - CITY
      ?auto_2095 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2093 ?auto_2094 ) ( IN-CITY ?auto_2092 ?auto_2094 ) ( not ( = ?auto_2092 ?auto_2093 ) ) ( OBJ-AT ?auto_2091 ?auto_2093 ) ( TRUCK-AT ?auto_2095 ?auto_2092 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2095 ?auto_2092 ?auto_2093 ?auto_2094 )
      ( DELIVER-1PKG ?auto_2091 ?auto_2092 )
      ( DELIVER-1PKG-VERIFY ?auto_2091 ?auto_2092 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2100 - OBJ
      ?auto_2102 - OBJ
      ?auto_2103 - OBJ
      ?auto_2101 - LOCATION
    )
    :vars
    (
      ?auto_2104 - LOCATION
      ?auto_2106 - CITY
      ?auto_2107 - LOCATION
      ?auto_2105 - TRUCK
      ?auto_2108 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2102 ?auto_2100 ) ( GREATER-THAN ?auto_2103 ?auto_2100 ) ( GREATER-THAN ?auto_2103 ?auto_2102 ) ( IN-CITY ?auto_2104 ?auto_2106 ) ( IN-CITY ?auto_2101 ?auto_2106 ) ( not ( = ?auto_2101 ?auto_2104 ) ) ( OBJ-AT ?auto_2103 ?auto_2104 ) ( IN-CITY ?auto_2107 ?auto_2106 ) ( not ( = ?auto_2101 ?auto_2107 ) ) ( OBJ-AT ?auto_2102 ?auto_2107 ) ( TRUCK-AT ?auto_2105 ?auto_2108 ) ( IN-CITY ?auto_2108 ?auto_2106 ) ( not ( = ?auto_2101 ?auto_2108 ) ) ( OBJ-AT ?auto_2100 ?auto_2108 ) ( not ( = ?auto_2100 ?auto_2102 ) ) ( not ( = ?auto_2107 ?auto_2108 ) ) ( not ( = ?auto_2100 ?auto_2103 ) ) ( not ( = ?auto_2102 ?auto_2103 ) ) ( not ( = ?auto_2104 ?auto_2107 ) ) ( not ( = ?auto_2104 ?auto_2108 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2100 ?auto_2102 ?auto_2101 )
      ( DELIVER-1PKG ?auto_2103 ?auto_2101 )
      ( DELIVER-3PKG-VERIFY ?auto_2100 ?auto_2102 ?auto_2103 ?auto_2101 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2113 - OBJ
      ?auto_2115 - OBJ
      ?auto_2116 - OBJ
      ?auto_2114 - LOCATION
    )
    :vars
    (
      ?auto_2117 - LOCATION
      ?auto_2120 - CITY
      ?auto_2119 - LOCATION
      ?auto_2121 - LOCATION
      ?auto_2118 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2115 ?auto_2113 ) ( GREATER-THAN ?auto_2116 ?auto_2113 ) ( GREATER-THAN ?auto_2116 ?auto_2115 ) ( IN-CITY ?auto_2117 ?auto_2120 ) ( IN-CITY ?auto_2114 ?auto_2120 ) ( not ( = ?auto_2114 ?auto_2117 ) ) ( OBJ-AT ?auto_2116 ?auto_2117 ) ( IN-CITY ?auto_2119 ?auto_2120 ) ( not ( = ?auto_2114 ?auto_2119 ) ) ( OBJ-AT ?auto_2115 ?auto_2119 ) ( IN-CITY ?auto_2121 ?auto_2120 ) ( not ( = ?auto_2114 ?auto_2121 ) ) ( OBJ-AT ?auto_2113 ?auto_2121 ) ( not ( = ?auto_2113 ?auto_2115 ) ) ( not ( = ?auto_2119 ?auto_2121 ) ) ( not ( = ?auto_2113 ?auto_2116 ) ) ( not ( = ?auto_2115 ?auto_2116 ) ) ( not ( = ?auto_2117 ?auto_2119 ) ) ( not ( = ?auto_2117 ?auto_2121 ) ) ( TRUCK-AT ?auto_2118 ?auto_2114 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2118 ?auto_2114 ?auto_2121 ?auto_2120 )
      ( DELIVER-3PKG ?auto_2113 ?auto_2115 ?auto_2116 ?auto_2114 )
      ( DELIVER-3PKG-VERIFY ?auto_2113 ?auto_2115 ?auto_2116 ?auto_2114 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2124 - OBJ
      ?auto_2125 - LOCATION
    )
    :vars
    (
      ?auto_2126 - TRUCK
      ?auto_2127 - LOCATION
      ?auto_2128 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2126 ?auto_2127 ) ( IN-CITY ?auto_2127 ?auto_2128 ) ( IN-CITY ?auto_2125 ?auto_2128 ) ( not ( = ?auto_2125 ?auto_2127 ) ) ( OBJ-AT ?auto_2124 ?auto_2127 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2124 ?auto_2126 ?auto_2127 )
      ( !DRIVE-TRUCK ?auto_2126 ?auto_2127 ?auto_2125 ?auto_2128 )
      ( !UNLOAD-TRUCK ?auto_2124 ?auto_2126 ?auto_2125 )
      ( DELIVER-1PKG-VERIFY ?auto_2124 ?auto_2125 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2131 - OBJ
      ?auto_2132 - LOCATION
    )
    :vars
    (
      ?auto_2135 - LOCATION
      ?auto_2133 - CITY
      ?auto_2134 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2135 ?auto_2133 ) ( IN-CITY ?auto_2132 ?auto_2133 ) ( not ( = ?auto_2132 ?auto_2135 ) ) ( OBJ-AT ?auto_2131 ?auto_2135 ) ( TRUCK-AT ?auto_2134 ?auto_2132 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2134 ?auto_2132 ?auto_2135 ?auto_2133 )
      ( DELIVER-1PKG ?auto_2131 ?auto_2132 )
      ( DELIVER-1PKG-VERIFY ?auto_2131 ?auto_2132 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2141 - OBJ
      ?auto_2143 - OBJ
      ?auto_2144 - OBJ
      ?auto_2145 - OBJ
      ?auto_2142 - LOCATION
    )
    :vars
    (
      ?auto_2147 - LOCATION
      ?auto_2148 - CITY
      ?auto_2149 - LOCATION
      ?auto_2150 - LOCATION
      ?auto_2146 - TRUCK
      ?auto_2151 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2143 ?auto_2141 ) ( GREATER-THAN ?auto_2144 ?auto_2141 ) ( GREATER-THAN ?auto_2144 ?auto_2143 ) ( GREATER-THAN ?auto_2145 ?auto_2141 ) ( GREATER-THAN ?auto_2145 ?auto_2143 ) ( GREATER-THAN ?auto_2145 ?auto_2144 ) ( IN-CITY ?auto_2147 ?auto_2148 ) ( IN-CITY ?auto_2142 ?auto_2148 ) ( not ( = ?auto_2142 ?auto_2147 ) ) ( OBJ-AT ?auto_2145 ?auto_2147 ) ( IN-CITY ?auto_2149 ?auto_2148 ) ( not ( = ?auto_2142 ?auto_2149 ) ) ( OBJ-AT ?auto_2144 ?auto_2149 ) ( IN-CITY ?auto_2150 ?auto_2148 ) ( not ( = ?auto_2142 ?auto_2150 ) ) ( OBJ-AT ?auto_2143 ?auto_2150 ) ( TRUCK-AT ?auto_2146 ?auto_2151 ) ( IN-CITY ?auto_2151 ?auto_2148 ) ( not ( = ?auto_2142 ?auto_2151 ) ) ( OBJ-AT ?auto_2141 ?auto_2151 ) ( not ( = ?auto_2141 ?auto_2143 ) ) ( not ( = ?auto_2150 ?auto_2151 ) ) ( not ( = ?auto_2141 ?auto_2144 ) ) ( not ( = ?auto_2143 ?auto_2144 ) ) ( not ( = ?auto_2149 ?auto_2150 ) ) ( not ( = ?auto_2149 ?auto_2151 ) ) ( not ( = ?auto_2141 ?auto_2145 ) ) ( not ( = ?auto_2143 ?auto_2145 ) ) ( not ( = ?auto_2144 ?auto_2145 ) ) ( not ( = ?auto_2147 ?auto_2149 ) ) ( not ( = ?auto_2147 ?auto_2150 ) ) ( not ( = ?auto_2147 ?auto_2151 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2141 ?auto_2143 ?auto_2144 ?auto_2142 )
      ( DELIVER-1PKG ?auto_2145 ?auto_2142 )
      ( DELIVER-4PKG-VERIFY ?auto_2141 ?auto_2143 ?auto_2144 ?auto_2145 ?auto_2142 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2157 - OBJ
      ?auto_2159 - OBJ
      ?auto_2160 - OBJ
      ?auto_2161 - OBJ
      ?auto_2158 - LOCATION
    )
    :vars
    (
      ?auto_2167 - LOCATION
      ?auto_2162 - CITY
      ?auto_2164 - LOCATION
      ?auto_2165 - LOCATION
      ?auto_2163 - LOCATION
      ?auto_2166 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2159 ?auto_2157 ) ( GREATER-THAN ?auto_2160 ?auto_2157 ) ( GREATER-THAN ?auto_2160 ?auto_2159 ) ( GREATER-THAN ?auto_2161 ?auto_2157 ) ( GREATER-THAN ?auto_2161 ?auto_2159 ) ( GREATER-THAN ?auto_2161 ?auto_2160 ) ( IN-CITY ?auto_2167 ?auto_2162 ) ( IN-CITY ?auto_2158 ?auto_2162 ) ( not ( = ?auto_2158 ?auto_2167 ) ) ( OBJ-AT ?auto_2161 ?auto_2167 ) ( IN-CITY ?auto_2164 ?auto_2162 ) ( not ( = ?auto_2158 ?auto_2164 ) ) ( OBJ-AT ?auto_2160 ?auto_2164 ) ( IN-CITY ?auto_2165 ?auto_2162 ) ( not ( = ?auto_2158 ?auto_2165 ) ) ( OBJ-AT ?auto_2159 ?auto_2165 ) ( IN-CITY ?auto_2163 ?auto_2162 ) ( not ( = ?auto_2158 ?auto_2163 ) ) ( OBJ-AT ?auto_2157 ?auto_2163 ) ( not ( = ?auto_2157 ?auto_2159 ) ) ( not ( = ?auto_2165 ?auto_2163 ) ) ( not ( = ?auto_2157 ?auto_2160 ) ) ( not ( = ?auto_2159 ?auto_2160 ) ) ( not ( = ?auto_2164 ?auto_2165 ) ) ( not ( = ?auto_2164 ?auto_2163 ) ) ( not ( = ?auto_2157 ?auto_2161 ) ) ( not ( = ?auto_2159 ?auto_2161 ) ) ( not ( = ?auto_2160 ?auto_2161 ) ) ( not ( = ?auto_2167 ?auto_2164 ) ) ( not ( = ?auto_2167 ?auto_2165 ) ) ( not ( = ?auto_2167 ?auto_2163 ) ) ( TRUCK-AT ?auto_2166 ?auto_2158 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2166 ?auto_2158 ?auto_2163 ?auto_2162 )
      ( DELIVER-4PKG ?auto_2157 ?auto_2159 ?auto_2160 ?auto_2161 ?auto_2158 )
      ( DELIVER-4PKG-VERIFY ?auto_2157 ?auto_2159 ?auto_2160 ?auto_2161 ?auto_2158 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2170 - OBJ
      ?auto_2171 - LOCATION
    )
    :vars
    (
      ?auto_2172 - TRUCK
      ?auto_2173 - LOCATION
      ?auto_2174 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2172 ?auto_2173 ) ( IN-CITY ?auto_2173 ?auto_2174 ) ( IN-CITY ?auto_2171 ?auto_2174 ) ( not ( = ?auto_2171 ?auto_2173 ) ) ( OBJ-AT ?auto_2170 ?auto_2173 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2170 ?auto_2172 ?auto_2173 )
      ( !DRIVE-TRUCK ?auto_2172 ?auto_2173 ?auto_2171 ?auto_2174 )
      ( !UNLOAD-TRUCK ?auto_2170 ?auto_2172 ?auto_2171 )
      ( DELIVER-1PKG-VERIFY ?auto_2170 ?auto_2171 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2177 - OBJ
      ?auto_2178 - LOCATION
    )
    :vars
    (
      ?auto_2181 - LOCATION
      ?auto_2179 - CITY
      ?auto_2180 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2181 ?auto_2179 ) ( IN-CITY ?auto_2178 ?auto_2179 ) ( not ( = ?auto_2178 ?auto_2181 ) ) ( OBJ-AT ?auto_2177 ?auto_2181 ) ( TRUCK-AT ?auto_2180 ?auto_2178 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2180 ?auto_2178 ?auto_2181 ?auto_2179 )
      ( DELIVER-1PKG ?auto_2177 ?auto_2178 )
      ( DELIVER-1PKG-VERIFY ?auto_2177 ?auto_2178 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2188 - OBJ
      ?auto_2190 - OBJ
      ?auto_2191 - OBJ
      ?auto_2193 - OBJ
      ?auto_2192 - OBJ
      ?auto_2189 - LOCATION
    )
    :vars
    (
      ?auto_2194 - LOCATION
      ?auto_2195 - CITY
      ?auto_2200 - LOCATION
      ?auto_2198 - LOCATION
      ?auto_2199 - LOCATION
      ?auto_2196 - TRUCK
      ?auto_2197 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2190 ?auto_2188 ) ( GREATER-THAN ?auto_2191 ?auto_2188 ) ( GREATER-THAN ?auto_2191 ?auto_2190 ) ( GREATER-THAN ?auto_2193 ?auto_2188 ) ( GREATER-THAN ?auto_2193 ?auto_2190 ) ( GREATER-THAN ?auto_2193 ?auto_2191 ) ( GREATER-THAN ?auto_2192 ?auto_2188 ) ( GREATER-THAN ?auto_2192 ?auto_2190 ) ( GREATER-THAN ?auto_2192 ?auto_2191 ) ( GREATER-THAN ?auto_2192 ?auto_2193 ) ( IN-CITY ?auto_2194 ?auto_2195 ) ( IN-CITY ?auto_2189 ?auto_2195 ) ( not ( = ?auto_2189 ?auto_2194 ) ) ( OBJ-AT ?auto_2192 ?auto_2194 ) ( IN-CITY ?auto_2200 ?auto_2195 ) ( not ( = ?auto_2189 ?auto_2200 ) ) ( OBJ-AT ?auto_2193 ?auto_2200 ) ( IN-CITY ?auto_2198 ?auto_2195 ) ( not ( = ?auto_2189 ?auto_2198 ) ) ( OBJ-AT ?auto_2191 ?auto_2198 ) ( IN-CITY ?auto_2199 ?auto_2195 ) ( not ( = ?auto_2189 ?auto_2199 ) ) ( OBJ-AT ?auto_2190 ?auto_2199 ) ( TRUCK-AT ?auto_2196 ?auto_2197 ) ( IN-CITY ?auto_2197 ?auto_2195 ) ( not ( = ?auto_2189 ?auto_2197 ) ) ( OBJ-AT ?auto_2188 ?auto_2197 ) ( not ( = ?auto_2188 ?auto_2190 ) ) ( not ( = ?auto_2199 ?auto_2197 ) ) ( not ( = ?auto_2188 ?auto_2191 ) ) ( not ( = ?auto_2190 ?auto_2191 ) ) ( not ( = ?auto_2198 ?auto_2199 ) ) ( not ( = ?auto_2198 ?auto_2197 ) ) ( not ( = ?auto_2188 ?auto_2193 ) ) ( not ( = ?auto_2190 ?auto_2193 ) ) ( not ( = ?auto_2191 ?auto_2193 ) ) ( not ( = ?auto_2200 ?auto_2198 ) ) ( not ( = ?auto_2200 ?auto_2199 ) ) ( not ( = ?auto_2200 ?auto_2197 ) ) ( not ( = ?auto_2188 ?auto_2192 ) ) ( not ( = ?auto_2190 ?auto_2192 ) ) ( not ( = ?auto_2191 ?auto_2192 ) ) ( not ( = ?auto_2193 ?auto_2192 ) ) ( not ( = ?auto_2194 ?auto_2200 ) ) ( not ( = ?auto_2194 ?auto_2198 ) ) ( not ( = ?auto_2194 ?auto_2199 ) ) ( not ( = ?auto_2194 ?auto_2197 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2188 ?auto_2190 ?auto_2191 ?auto_2193 ?auto_2189 )
      ( DELIVER-1PKG ?auto_2192 ?auto_2189 )
      ( DELIVER-5PKG-VERIFY ?auto_2188 ?auto_2190 ?auto_2191 ?auto_2193 ?auto_2192 ?auto_2189 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2207 - OBJ
      ?auto_2209 - OBJ
      ?auto_2210 - OBJ
      ?auto_2212 - OBJ
      ?auto_2211 - OBJ
      ?auto_2208 - LOCATION
    )
    :vars
    (
      ?auto_2215 - LOCATION
      ?auto_2213 - CITY
      ?auto_2217 - LOCATION
      ?auto_2214 - LOCATION
      ?auto_2216 - LOCATION
      ?auto_2219 - LOCATION
      ?auto_2218 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2209 ?auto_2207 ) ( GREATER-THAN ?auto_2210 ?auto_2207 ) ( GREATER-THAN ?auto_2210 ?auto_2209 ) ( GREATER-THAN ?auto_2212 ?auto_2207 ) ( GREATER-THAN ?auto_2212 ?auto_2209 ) ( GREATER-THAN ?auto_2212 ?auto_2210 ) ( GREATER-THAN ?auto_2211 ?auto_2207 ) ( GREATER-THAN ?auto_2211 ?auto_2209 ) ( GREATER-THAN ?auto_2211 ?auto_2210 ) ( GREATER-THAN ?auto_2211 ?auto_2212 ) ( IN-CITY ?auto_2215 ?auto_2213 ) ( IN-CITY ?auto_2208 ?auto_2213 ) ( not ( = ?auto_2208 ?auto_2215 ) ) ( OBJ-AT ?auto_2211 ?auto_2215 ) ( IN-CITY ?auto_2217 ?auto_2213 ) ( not ( = ?auto_2208 ?auto_2217 ) ) ( OBJ-AT ?auto_2212 ?auto_2217 ) ( IN-CITY ?auto_2214 ?auto_2213 ) ( not ( = ?auto_2208 ?auto_2214 ) ) ( OBJ-AT ?auto_2210 ?auto_2214 ) ( IN-CITY ?auto_2216 ?auto_2213 ) ( not ( = ?auto_2208 ?auto_2216 ) ) ( OBJ-AT ?auto_2209 ?auto_2216 ) ( IN-CITY ?auto_2219 ?auto_2213 ) ( not ( = ?auto_2208 ?auto_2219 ) ) ( OBJ-AT ?auto_2207 ?auto_2219 ) ( not ( = ?auto_2207 ?auto_2209 ) ) ( not ( = ?auto_2216 ?auto_2219 ) ) ( not ( = ?auto_2207 ?auto_2210 ) ) ( not ( = ?auto_2209 ?auto_2210 ) ) ( not ( = ?auto_2214 ?auto_2216 ) ) ( not ( = ?auto_2214 ?auto_2219 ) ) ( not ( = ?auto_2207 ?auto_2212 ) ) ( not ( = ?auto_2209 ?auto_2212 ) ) ( not ( = ?auto_2210 ?auto_2212 ) ) ( not ( = ?auto_2217 ?auto_2214 ) ) ( not ( = ?auto_2217 ?auto_2216 ) ) ( not ( = ?auto_2217 ?auto_2219 ) ) ( not ( = ?auto_2207 ?auto_2211 ) ) ( not ( = ?auto_2209 ?auto_2211 ) ) ( not ( = ?auto_2210 ?auto_2211 ) ) ( not ( = ?auto_2212 ?auto_2211 ) ) ( not ( = ?auto_2215 ?auto_2217 ) ) ( not ( = ?auto_2215 ?auto_2214 ) ) ( not ( = ?auto_2215 ?auto_2216 ) ) ( not ( = ?auto_2215 ?auto_2219 ) ) ( TRUCK-AT ?auto_2218 ?auto_2208 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2218 ?auto_2208 ?auto_2219 ?auto_2213 )
      ( DELIVER-5PKG ?auto_2207 ?auto_2209 ?auto_2210 ?auto_2212 ?auto_2211 ?auto_2208 )
      ( DELIVER-5PKG-VERIFY ?auto_2207 ?auto_2209 ?auto_2210 ?auto_2212 ?auto_2211 ?auto_2208 ) )
  )

)

