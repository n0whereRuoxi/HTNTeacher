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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2037 - OBJ
      ?auto_2038 - LOCATION
    )
    :vars
    (
      ?auto_2039 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2039 ?auto_2038 ) ( IN-TRUCK ?auto_2037 ?auto_2039 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_2037 ?auto_2039 ?auto_2038 )
      ( DELIVER-1PKG-VERIFY ?auto_2037 ?auto_2038 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2042 - OBJ
      ?auto_2043 - LOCATION
    )
    :vars
    (
      ?auto_2044 - TRUCK
      ?auto_2045 - LOCATION
      ?auto_2046 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2042 ?auto_2044 ) ( TRUCK-AT ?auto_2044 ?auto_2045 ) ( IN-CITY ?auto_2045 ?auto_2046 ) ( IN-CITY ?auto_2043 ?auto_2046 ) ( not ( = ?auto_2043 ?auto_2045 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2044 ?auto_2045 ?auto_2043 ?auto_2046 )
      ( DELIVER-1PKG ?auto_2042 ?auto_2043 )
      ( DELIVER-1PKG-VERIFY ?auto_2042 ?auto_2043 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2049 - OBJ
      ?auto_2050 - LOCATION
    )
    :vars
    (
      ?auto_2052 - TRUCK
      ?auto_2051 - LOCATION
      ?auto_2053 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2052 ?auto_2051 ) ( IN-CITY ?auto_2051 ?auto_2053 ) ( IN-CITY ?auto_2050 ?auto_2053 ) ( not ( = ?auto_2050 ?auto_2051 ) ) ( OBJ-AT ?auto_2049 ?auto_2051 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2049 ?auto_2052 ?auto_2051 )
      ( DELIVER-1PKG ?auto_2049 ?auto_2050 )
      ( DELIVER-1PKG-VERIFY ?auto_2049 ?auto_2050 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2056 - OBJ
      ?auto_2057 - LOCATION
    )
    :vars
    (
      ?auto_2058 - LOCATION
      ?auto_2060 - CITY
      ?auto_2059 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2058 ?auto_2060 ) ( IN-CITY ?auto_2057 ?auto_2060 ) ( not ( = ?auto_2057 ?auto_2058 ) ) ( OBJ-AT ?auto_2056 ?auto_2058 ) ( TRUCK-AT ?auto_2059 ?auto_2057 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2059 ?auto_2057 ?auto_2058 ?auto_2060 )
      ( DELIVER-1PKG ?auto_2056 ?auto_2057 )
      ( DELIVER-1PKG-VERIFY ?auto_2056 ?auto_2057 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2063 - OBJ
      ?auto_2064 - LOCATION
    )
    :vars
    (
      ?auto_2065 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2065 ?auto_2064 ) ( IN-TRUCK ?auto_2063 ?auto_2065 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_2063 ?auto_2065 ?auto_2064 )
      ( DELIVER-1PKG-VERIFY ?auto_2063 ?auto_2064 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2068 - OBJ
      ?auto_2069 - LOCATION
    )
    :vars
    (
      ?auto_2070 - TRUCK
      ?auto_2071 - LOCATION
      ?auto_2072 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2068 ?auto_2070 ) ( TRUCK-AT ?auto_2070 ?auto_2071 ) ( IN-CITY ?auto_2071 ?auto_2072 ) ( IN-CITY ?auto_2069 ?auto_2072 ) ( not ( = ?auto_2069 ?auto_2071 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2070 ?auto_2071 ?auto_2069 ?auto_2072 )
      ( DELIVER-1PKG ?auto_2068 ?auto_2069 )
      ( DELIVER-1PKG-VERIFY ?auto_2068 ?auto_2069 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2075 - OBJ
      ?auto_2076 - LOCATION
    )
    :vars
    (
      ?auto_2078 - TRUCK
      ?auto_2077 - LOCATION
      ?auto_2079 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2078 ?auto_2077 ) ( IN-CITY ?auto_2077 ?auto_2079 ) ( IN-CITY ?auto_2076 ?auto_2079 ) ( not ( = ?auto_2076 ?auto_2077 ) ) ( OBJ-AT ?auto_2075 ?auto_2077 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2075 ?auto_2078 ?auto_2077 )
      ( DELIVER-1PKG ?auto_2075 ?auto_2076 )
      ( DELIVER-1PKG-VERIFY ?auto_2075 ?auto_2076 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2082 - OBJ
      ?auto_2083 - LOCATION
    )
    :vars
    (
      ?auto_2086 - LOCATION
      ?auto_2085 - CITY
      ?auto_2084 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2086 ?auto_2085 ) ( IN-CITY ?auto_2083 ?auto_2085 ) ( not ( = ?auto_2083 ?auto_2086 ) ) ( OBJ-AT ?auto_2082 ?auto_2086 ) ( TRUCK-AT ?auto_2084 ?auto_2083 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2084 ?auto_2083 ?auto_2086 ?auto_2085 )
      ( DELIVER-1PKG ?auto_2082 ?auto_2083 )
      ( DELIVER-1PKG-VERIFY ?auto_2082 ?auto_2083 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2090 - OBJ
      ?auto_2092 - OBJ
      ?auto_2091 - LOCATION
    )
    :vars
    (
      ?auto_2093 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2092 ?auto_2090 ) ( TRUCK-AT ?auto_2093 ?auto_2091 ) ( IN-TRUCK ?auto_2092 ?auto_2093 ) ( OBJ-AT ?auto_2090 ?auto_2091 ) ( not ( = ?auto_2090 ?auto_2092 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2092 ?auto_2091 )
      ( DELIVER-2PKG-VERIFY ?auto_2090 ?auto_2092 ?auto_2091 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2097 - OBJ
      ?auto_2099 - OBJ
      ?auto_2098 - LOCATION
    )
    :vars
    (
      ?auto_2101 - TRUCK
      ?auto_2100 - LOCATION
      ?auto_2102 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2099 ?auto_2097 ) ( IN-TRUCK ?auto_2099 ?auto_2101 ) ( TRUCK-AT ?auto_2101 ?auto_2100 ) ( IN-CITY ?auto_2100 ?auto_2102 ) ( IN-CITY ?auto_2098 ?auto_2102 ) ( not ( = ?auto_2098 ?auto_2100 ) ) ( OBJ-AT ?auto_2097 ?auto_2098 ) ( not ( = ?auto_2097 ?auto_2099 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2099 ?auto_2098 )
      ( DELIVER-2PKG-VERIFY ?auto_2097 ?auto_2099 ?auto_2098 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2106 - OBJ
      ?auto_2108 - OBJ
      ?auto_2107 - LOCATION
    )
    :vars
    (
      ?auto_2109 - TRUCK
      ?auto_2111 - LOCATION
      ?auto_2110 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2108 ?auto_2106 ) ( TRUCK-AT ?auto_2109 ?auto_2111 ) ( IN-CITY ?auto_2111 ?auto_2110 ) ( IN-CITY ?auto_2107 ?auto_2110 ) ( not ( = ?auto_2107 ?auto_2111 ) ) ( OBJ-AT ?auto_2108 ?auto_2111 ) ( OBJ-AT ?auto_2106 ?auto_2107 ) ( not ( = ?auto_2106 ?auto_2108 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2108 ?auto_2107 )
      ( DELIVER-2PKG-VERIFY ?auto_2106 ?auto_2108 ?auto_2107 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2115 - OBJ
      ?auto_2117 - OBJ
      ?auto_2116 - LOCATION
    )
    :vars
    (
      ?auto_2120 - LOCATION
      ?auto_2119 - CITY
      ?auto_2118 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2117 ?auto_2115 ) ( IN-CITY ?auto_2120 ?auto_2119 ) ( IN-CITY ?auto_2116 ?auto_2119 ) ( not ( = ?auto_2116 ?auto_2120 ) ) ( OBJ-AT ?auto_2117 ?auto_2120 ) ( TRUCK-AT ?auto_2118 ?auto_2116 ) ( OBJ-AT ?auto_2115 ?auto_2116 ) ( not ( = ?auto_2115 ?auto_2117 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2117 ?auto_2116 )
      ( DELIVER-2PKG-VERIFY ?auto_2115 ?auto_2117 ?auto_2116 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2124 - OBJ
      ?auto_2126 - OBJ
      ?auto_2125 - LOCATION
    )
    :vars
    (
      ?auto_2129 - LOCATION
      ?auto_2127 - CITY
      ?auto_2128 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2126 ?auto_2124 ) ( IN-CITY ?auto_2129 ?auto_2127 ) ( IN-CITY ?auto_2125 ?auto_2127 ) ( not ( = ?auto_2125 ?auto_2129 ) ) ( OBJ-AT ?auto_2126 ?auto_2129 ) ( TRUCK-AT ?auto_2128 ?auto_2125 ) ( not ( = ?auto_2124 ?auto_2126 ) ) ( IN-TRUCK ?auto_2124 ?auto_2128 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2124 ?auto_2125 )
      ( DELIVER-2PKG ?auto_2124 ?auto_2126 ?auto_2125 )
      ( DELIVER-2PKG-VERIFY ?auto_2124 ?auto_2126 ?auto_2125 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2133 - OBJ
      ?auto_2135 - OBJ
      ?auto_2134 - LOCATION
    )
    :vars
    (
      ?auto_2138 - LOCATION
      ?auto_2136 - CITY
      ?auto_2137 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2135 ?auto_2133 ) ( IN-CITY ?auto_2138 ?auto_2136 ) ( IN-CITY ?auto_2134 ?auto_2136 ) ( not ( = ?auto_2134 ?auto_2138 ) ) ( OBJ-AT ?auto_2135 ?auto_2138 ) ( not ( = ?auto_2133 ?auto_2135 ) ) ( IN-TRUCK ?auto_2133 ?auto_2137 ) ( TRUCK-AT ?auto_2137 ?auto_2138 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2137 ?auto_2138 ?auto_2134 ?auto_2136 )
      ( DELIVER-2PKG ?auto_2133 ?auto_2135 ?auto_2134 )
      ( DELIVER-2PKG-VERIFY ?auto_2133 ?auto_2135 ?auto_2134 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2142 - OBJ
      ?auto_2144 - OBJ
      ?auto_2143 - LOCATION
    )
    :vars
    (
      ?auto_2147 - LOCATION
      ?auto_2145 - CITY
      ?auto_2146 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2144 ?auto_2142 ) ( IN-CITY ?auto_2147 ?auto_2145 ) ( IN-CITY ?auto_2143 ?auto_2145 ) ( not ( = ?auto_2143 ?auto_2147 ) ) ( OBJ-AT ?auto_2144 ?auto_2147 ) ( not ( = ?auto_2142 ?auto_2144 ) ) ( TRUCK-AT ?auto_2146 ?auto_2147 ) ( OBJ-AT ?auto_2142 ?auto_2147 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2142 ?auto_2146 ?auto_2147 )
      ( DELIVER-2PKG ?auto_2142 ?auto_2144 ?auto_2143 )
      ( DELIVER-2PKG-VERIFY ?auto_2142 ?auto_2144 ?auto_2143 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2151 - OBJ
      ?auto_2153 - OBJ
      ?auto_2152 - LOCATION
    )
    :vars
    (
      ?auto_2156 - LOCATION
      ?auto_2155 - CITY
      ?auto_2154 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2153 ?auto_2151 ) ( IN-CITY ?auto_2156 ?auto_2155 ) ( IN-CITY ?auto_2152 ?auto_2155 ) ( not ( = ?auto_2152 ?auto_2156 ) ) ( OBJ-AT ?auto_2153 ?auto_2156 ) ( not ( = ?auto_2151 ?auto_2153 ) ) ( OBJ-AT ?auto_2151 ?auto_2156 ) ( TRUCK-AT ?auto_2154 ?auto_2152 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2154 ?auto_2152 ?auto_2156 ?auto_2155 )
      ( DELIVER-2PKG ?auto_2151 ?auto_2153 ?auto_2152 )
      ( DELIVER-2PKG-VERIFY ?auto_2151 ?auto_2153 ?auto_2152 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2159 - OBJ
      ?auto_2160 - LOCATION
    )
    :vars
    (
      ?auto_2161 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2161 ?auto_2160 ) ( IN-TRUCK ?auto_2159 ?auto_2161 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_2159 ?auto_2161 ?auto_2160 )
      ( DELIVER-1PKG-VERIFY ?auto_2159 ?auto_2160 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2164 - OBJ
      ?auto_2165 - LOCATION
    )
    :vars
    (
      ?auto_2166 - TRUCK
      ?auto_2167 - LOCATION
      ?auto_2168 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2164 ?auto_2166 ) ( TRUCK-AT ?auto_2166 ?auto_2167 ) ( IN-CITY ?auto_2167 ?auto_2168 ) ( IN-CITY ?auto_2165 ?auto_2168 ) ( not ( = ?auto_2165 ?auto_2167 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2166 ?auto_2167 ?auto_2165 ?auto_2168 )
      ( DELIVER-1PKG ?auto_2164 ?auto_2165 )
      ( DELIVER-1PKG-VERIFY ?auto_2164 ?auto_2165 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2171 - OBJ
      ?auto_2172 - LOCATION
    )
    :vars
    (
      ?auto_2174 - TRUCK
      ?auto_2173 - LOCATION
      ?auto_2175 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2174 ?auto_2173 ) ( IN-CITY ?auto_2173 ?auto_2175 ) ( IN-CITY ?auto_2172 ?auto_2175 ) ( not ( = ?auto_2172 ?auto_2173 ) ) ( OBJ-AT ?auto_2171 ?auto_2173 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2171 ?auto_2174 ?auto_2173 )
      ( DELIVER-1PKG ?auto_2171 ?auto_2172 )
      ( DELIVER-1PKG-VERIFY ?auto_2171 ?auto_2172 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2178 - OBJ
      ?auto_2179 - LOCATION
    )
    :vars
    (
      ?auto_2181 - LOCATION
      ?auto_2182 - CITY
      ?auto_2180 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2181 ?auto_2182 ) ( IN-CITY ?auto_2179 ?auto_2182 ) ( not ( = ?auto_2179 ?auto_2181 ) ) ( OBJ-AT ?auto_2178 ?auto_2181 ) ( TRUCK-AT ?auto_2180 ?auto_2179 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2180 ?auto_2179 ?auto_2181 ?auto_2182 )
      ( DELIVER-1PKG ?auto_2178 ?auto_2179 )
      ( DELIVER-1PKG-VERIFY ?auto_2178 ?auto_2179 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2187 - OBJ
      ?auto_2189 - OBJ
      ?auto_2190 - OBJ
      ?auto_2188 - LOCATION
    )
    :vars
    (
      ?auto_2191 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2189 ?auto_2187 ) ( GREATER-THAN ?auto_2190 ?auto_2187 ) ( GREATER-THAN ?auto_2190 ?auto_2189 ) ( TRUCK-AT ?auto_2191 ?auto_2188 ) ( IN-TRUCK ?auto_2190 ?auto_2191 ) ( OBJ-AT ?auto_2187 ?auto_2188 ) ( OBJ-AT ?auto_2189 ?auto_2188 ) ( not ( = ?auto_2187 ?auto_2189 ) ) ( not ( = ?auto_2187 ?auto_2190 ) ) ( not ( = ?auto_2189 ?auto_2190 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2190 ?auto_2188 )
      ( DELIVER-3PKG-VERIFY ?auto_2187 ?auto_2189 ?auto_2190 ?auto_2188 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2196 - OBJ
      ?auto_2198 - OBJ
      ?auto_2199 - OBJ
      ?auto_2197 - LOCATION
    )
    :vars
    (
      ?auto_2201 - TRUCK
      ?auto_2200 - LOCATION
      ?auto_2202 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2198 ?auto_2196 ) ( GREATER-THAN ?auto_2199 ?auto_2196 ) ( GREATER-THAN ?auto_2199 ?auto_2198 ) ( IN-TRUCK ?auto_2199 ?auto_2201 ) ( TRUCK-AT ?auto_2201 ?auto_2200 ) ( IN-CITY ?auto_2200 ?auto_2202 ) ( IN-CITY ?auto_2197 ?auto_2202 ) ( not ( = ?auto_2197 ?auto_2200 ) ) ( OBJ-AT ?auto_2196 ?auto_2197 ) ( OBJ-AT ?auto_2198 ?auto_2197 ) ( not ( = ?auto_2196 ?auto_2198 ) ) ( not ( = ?auto_2196 ?auto_2199 ) ) ( not ( = ?auto_2198 ?auto_2199 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2199 ?auto_2197 )
      ( DELIVER-3PKG-VERIFY ?auto_2196 ?auto_2198 ?auto_2199 ?auto_2197 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2207 - OBJ
      ?auto_2209 - OBJ
      ?auto_2210 - OBJ
      ?auto_2208 - LOCATION
    )
    :vars
    (
      ?auto_2211 - TRUCK
      ?auto_2212 - LOCATION
      ?auto_2213 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2209 ?auto_2207 ) ( GREATER-THAN ?auto_2210 ?auto_2207 ) ( GREATER-THAN ?auto_2210 ?auto_2209 ) ( TRUCK-AT ?auto_2211 ?auto_2212 ) ( IN-CITY ?auto_2212 ?auto_2213 ) ( IN-CITY ?auto_2208 ?auto_2213 ) ( not ( = ?auto_2208 ?auto_2212 ) ) ( OBJ-AT ?auto_2210 ?auto_2212 ) ( OBJ-AT ?auto_2207 ?auto_2208 ) ( OBJ-AT ?auto_2209 ?auto_2208 ) ( not ( = ?auto_2207 ?auto_2209 ) ) ( not ( = ?auto_2207 ?auto_2210 ) ) ( not ( = ?auto_2209 ?auto_2210 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2210 ?auto_2208 )
      ( DELIVER-3PKG-VERIFY ?auto_2207 ?auto_2209 ?auto_2210 ?auto_2208 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2218 - OBJ
      ?auto_2220 - OBJ
      ?auto_2221 - OBJ
      ?auto_2219 - LOCATION
    )
    :vars
    (
      ?auto_2224 - LOCATION
      ?auto_2222 - CITY
      ?auto_2223 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2220 ?auto_2218 ) ( GREATER-THAN ?auto_2221 ?auto_2218 ) ( GREATER-THAN ?auto_2221 ?auto_2220 ) ( IN-CITY ?auto_2224 ?auto_2222 ) ( IN-CITY ?auto_2219 ?auto_2222 ) ( not ( = ?auto_2219 ?auto_2224 ) ) ( OBJ-AT ?auto_2221 ?auto_2224 ) ( TRUCK-AT ?auto_2223 ?auto_2219 ) ( OBJ-AT ?auto_2218 ?auto_2219 ) ( OBJ-AT ?auto_2220 ?auto_2219 ) ( not ( = ?auto_2218 ?auto_2220 ) ) ( not ( = ?auto_2218 ?auto_2221 ) ) ( not ( = ?auto_2220 ?auto_2221 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2221 ?auto_2219 )
      ( DELIVER-3PKG-VERIFY ?auto_2218 ?auto_2220 ?auto_2221 ?auto_2219 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2229 - OBJ
      ?auto_2231 - OBJ
      ?auto_2232 - OBJ
      ?auto_2230 - LOCATION
    )
    :vars
    (
      ?auto_2234 - LOCATION
      ?auto_2233 - CITY
      ?auto_2235 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2231 ?auto_2229 ) ( GREATER-THAN ?auto_2232 ?auto_2229 ) ( GREATER-THAN ?auto_2232 ?auto_2231 ) ( IN-CITY ?auto_2234 ?auto_2233 ) ( IN-CITY ?auto_2230 ?auto_2233 ) ( not ( = ?auto_2230 ?auto_2234 ) ) ( OBJ-AT ?auto_2232 ?auto_2234 ) ( TRUCK-AT ?auto_2235 ?auto_2230 ) ( OBJ-AT ?auto_2229 ?auto_2230 ) ( not ( = ?auto_2229 ?auto_2231 ) ) ( not ( = ?auto_2229 ?auto_2232 ) ) ( not ( = ?auto_2231 ?auto_2232 ) ) ( IN-TRUCK ?auto_2231 ?auto_2235 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2231 ?auto_2230 )
      ( DELIVER-3PKG ?auto_2229 ?auto_2231 ?auto_2232 ?auto_2230 )
      ( DELIVER-3PKG-VERIFY ?auto_2229 ?auto_2231 ?auto_2232 ?auto_2230 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2240 - OBJ
      ?auto_2242 - OBJ
      ?auto_2243 - OBJ
      ?auto_2241 - LOCATION
    )
    :vars
    (
      ?auto_2245 - LOCATION
      ?auto_2244 - CITY
      ?auto_2246 - TRUCK
      ?auto_2247 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2242 ?auto_2240 ) ( GREATER-THAN ?auto_2243 ?auto_2240 ) ( GREATER-THAN ?auto_2243 ?auto_2242 ) ( IN-CITY ?auto_2245 ?auto_2244 ) ( IN-CITY ?auto_2241 ?auto_2244 ) ( not ( = ?auto_2241 ?auto_2245 ) ) ( OBJ-AT ?auto_2243 ?auto_2245 ) ( OBJ-AT ?auto_2240 ?auto_2241 ) ( not ( = ?auto_2240 ?auto_2242 ) ) ( not ( = ?auto_2240 ?auto_2243 ) ) ( not ( = ?auto_2242 ?auto_2243 ) ) ( IN-TRUCK ?auto_2242 ?auto_2246 ) ( TRUCK-AT ?auto_2246 ?auto_2247 ) ( IN-CITY ?auto_2247 ?auto_2244 ) ( not ( = ?auto_2241 ?auto_2247 ) ) ( not ( = ?auto_2245 ?auto_2247 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2246 ?auto_2247 ?auto_2241 ?auto_2244 )
      ( DELIVER-3PKG ?auto_2240 ?auto_2242 ?auto_2243 ?auto_2241 )
      ( DELIVER-3PKG-VERIFY ?auto_2240 ?auto_2242 ?auto_2243 ?auto_2241 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2252 - OBJ
      ?auto_2254 - OBJ
      ?auto_2255 - OBJ
      ?auto_2253 - LOCATION
    )
    :vars
    (
      ?auto_2259 - LOCATION
      ?auto_2256 - CITY
      ?auto_2257 - TRUCK
      ?auto_2258 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2254 ?auto_2252 ) ( GREATER-THAN ?auto_2255 ?auto_2252 ) ( GREATER-THAN ?auto_2255 ?auto_2254 ) ( IN-CITY ?auto_2259 ?auto_2256 ) ( IN-CITY ?auto_2253 ?auto_2256 ) ( not ( = ?auto_2253 ?auto_2259 ) ) ( OBJ-AT ?auto_2255 ?auto_2259 ) ( OBJ-AT ?auto_2252 ?auto_2253 ) ( not ( = ?auto_2252 ?auto_2254 ) ) ( not ( = ?auto_2252 ?auto_2255 ) ) ( not ( = ?auto_2254 ?auto_2255 ) ) ( TRUCK-AT ?auto_2257 ?auto_2258 ) ( IN-CITY ?auto_2258 ?auto_2256 ) ( not ( = ?auto_2253 ?auto_2258 ) ) ( not ( = ?auto_2259 ?auto_2258 ) ) ( OBJ-AT ?auto_2254 ?auto_2258 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2254 ?auto_2257 ?auto_2258 )
      ( DELIVER-3PKG ?auto_2252 ?auto_2254 ?auto_2255 ?auto_2253 )
      ( DELIVER-3PKG-VERIFY ?auto_2252 ?auto_2254 ?auto_2255 ?auto_2253 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2264 - OBJ
      ?auto_2266 - OBJ
      ?auto_2267 - OBJ
      ?auto_2265 - LOCATION
    )
    :vars
    (
      ?auto_2270 - LOCATION
      ?auto_2268 - CITY
      ?auto_2271 - LOCATION
      ?auto_2269 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2266 ?auto_2264 ) ( GREATER-THAN ?auto_2267 ?auto_2264 ) ( GREATER-THAN ?auto_2267 ?auto_2266 ) ( IN-CITY ?auto_2270 ?auto_2268 ) ( IN-CITY ?auto_2265 ?auto_2268 ) ( not ( = ?auto_2265 ?auto_2270 ) ) ( OBJ-AT ?auto_2267 ?auto_2270 ) ( OBJ-AT ?auto_2264 ?auto_2265 ) ( not ( = ?auto_2264 ?auto_2266 ) ) ( not ( = ?auto_2264 ?auto_2267 ) ) ( not ( = ?auto_2266 ?auto_2267 ) ) ( IN-CITY ?auto_2271 ?auto_2268 ) ( not ( = ?auto_2265 ?auto_2271 ) ) ( not ( = ?auto_2270 ?auto_2271 ) ) ( OBJ-AT ?auto_2266 ?auto_2271 ) ( TRUCK-AT ?auto_2269 ?auto_2265 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2269 ?auto_2265 ?auto_2271 ?auto_2268 )
      ( DELIVER-3PKG ?auto_2264 ?auto_2266 ?auto_2267 ?auto_2265 )
      ( DELIVER-3PKG-VERIFY ?auto_2264 ?auto_2266 ?auto_2267 ?auto_2265 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2276 - OBJ
      ?auto_2278 - OBJ
      ?auto_2279 - OBJ
      ?auto_2277 - LOCATION
    )
    :vars
    (
      ?auto_2280 - LOCATION
      ?auto_2283 - CITY
      ?auto_2282 - LOCATION
      ?auto_2281 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2278 ?auto_2276 ) ( GREATER-THAN ?auto_2279 ?auto_2276 ) ( GREATER-THAN ?auto_2279 ?auto_2278 ) ( IN-CITY ?auto_2280 ?auto_2283 ) ( IN-CITY ?auto_2277 ?auto_2283 ) ( not ( = ?auto_2277 ?auto_2280 ) ) ( OBJ-AT ?auto_2279 ?auto_2280 ) ( not ( = ?auto_2276 ?auto_2278 ) ) ( not ( = ?auto_2276 ?auto_2279 ) ) ( not ( = ?auto_2278 ?auto_2279 ) ) ( IN-CITY ?auto_2282 ?auto_2283 ) ( not ( = ?auto_2277 ?auto_2282 ) ) ( not ( = ?auto_2280 ?auto_2282 ) ) ( OBJ-AT ?auto_2278 ?auto_2282 ) ( TRUCK-AT ?auto_2281 ?auto_2277 ) ( IN-TRUCK ?auto_2276 ?auto_2281 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2276 ?auto_2277 )
      ( DELIVER-3PKG ?auto_2276 ?auto_2278 ?auto_2279 ?auto_2277 )
      ( DELIVER-3PKG-VERIFY ?auto_2276 ?auto_2278 ?auto_2279 ?auto_2277 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2288 - OBJ
      ?auto_2290 - OBJ
      ?auto_2291 - OBJ
      ?auto_2289 - LOCATION
    )
    :vars
    (
      ?auto_2294 - LOCATION
      ?auto_2293 - CITY
      ?auto_2292 - LOCATION
      ?auto_2295 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2290 ?auto_2288 ) ( GREATER-THAN ?auto_2291 ?auto_2288 ) ( GREATER-THAN ?auto_2291 ?auto_2290 ) ( IN-CITY ?auto_2294 ?auto_2293 ) ( IN-CITY ?auto_2289 ?auto_2293 ) ( not ( = ?auto_2289 ?auto_2294 ) ) ( OBJ-AT ?auto_2291 ?auto_2294 ) ( not ( = ?auto_2288 ?auto_2290 ) ) ( not ( = ?auto_2288 ?auto_2291 ) ) ( not ( = ?auto_2290 ?auto_2291 ) ) ( IN-CITY ?auto_2292 ?auto_2293 ) ( not ( = ?auto_2289 ?auto_2292 ) ) ( not ( = ?auto_2294 ?auto_2292 ) ) ( OBJ-AT ?auto_2290 ?auto_2292 ) ( IN-TRUCK ?auto_2288 ?auto_2295 ) ( TRUCK-AT ?auto_2295 ?auto_2292 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2295 ?auto_2292 ?auto_2289 ?auto_2293 )
      ( DELIVER-3PKG ?auto_2288 ?auto_2290 ?auto_2291 ?auto_2289 )
      ( DELIVER-3PKG-VERIFY ?auto_2288 ?auto_2290 ?auto_2291 ?auto_2289 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2300 - OBJ
      ?auto_2302 - OBJ
      ?auto_2303 - OBJ
      ?auto_2301 - LOCATION
    )
    :vars
    (
      ?auto_2307 - LOCATION
      ?auto_2306 - CITY
      ?auto_2305 - LOCATION
      ?auto_2304 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2302 ?auto_2300 ) ( GREATER-THAN ?auto_2303 ?auto_2300 ) ( GREATER-THAN ?auto_2303 ?auto_2302 ) ( IN-CITY ?auto_2307 ?auto_2306 ) ( IN-CITY ?auto_2301 ?auto_2306 ) ( not ( = ?auto_2301 ?auto_2307 ) ) ( OBJ-AT ?auto_2303 ?auto_2307 ) ( not ( = ?auto_2300 ?auto_2302 ) ) ( not ( = ?auto_2300 ?auto_2303 ) ) ( not ( = ?auto_2302 ?auto_2303 ) ) ( IN-CITY ?auto_2305 ?auto_2306 ) ( not ( = ?auto_2301 ?auto_2305 ) ) ( not ( = ?auto_2307 ?auto_2305 ) ) ( OBJ-AT ?auto_2302 ?auto_2305 ) ( TRUCK-AT ?auto_2304 ?auto_2305 ) ( OBJ-AT ?auto_2300 ?auto_2305 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2300 ?auto_2304 ?auto_2305 )
      ( DELIVER-3PKG ?auto_2300 ?auto_2302 ?auto_2303 ?auto_2301 )
      ( DELIVER-3PKG-VERIFY ?auto_2300 ?auto_2302 ?auto_2303 ?auto_2301 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2312 - OBJ
      ?auto_2314 - OBJ
      ?auto_2315 - OBJ
      ?auto_2313 - LOCATION
    )
    :vars
    (
      ?auto_2316 - LOCATION
      ?auto_2318 - CITY
      ?auto_2317 - LOCATION
      ?auto_2319 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2314 ?auto_2312 ) ( GREATER-THAN ?auto_2315 ?auto_2312 ) ( GREATER-THAN ?auto_2315 ?auto_2314 ) ( IN-CITY ?auto_2316 ?auto_2318 ) ( IN-CITY ?auto_2313 ?auto_2318 ) ( not ( = ?auto_2313 ?auto_2316 ) ) ( OBJ-AT ?auto_2315 ?auto_2316 ) ( not ( = ?auto_2312 ?auto_2314 ) ) ( not ( = ?auto_2312 ?auto_2315 ) ) ( not ( = ?auto_2314 ?auto_2315 ) ) ( IN-CITY ?auto_2317 ?auto_2318 ) ( not ( = ?auto_2313 ?auto_2317 ) ) ( not ( = ?auto_2316 ?auto_2317 ) ) ( OBJ-AT ?auto_2314 ?auto_2317 ) ( OBJ-AT ?auto_2312 ?auto_2317 ) ( TRUCK-AT ?auto_2319 ?auto_2313 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2319 ?auto_2313 ?auto_2317 ?auto_2318 )
      ( DELIVER-3PKG ?auto_2312 ?auto_2314 ?auto_2315 ?auto_2313 )
      ( DELIVER-3PKG-VERIFY ?auto_2312 ?auto_2314 ?auto_2315 ?auto_2313 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2322 - OBJ
      ?auto_2323 - LOCATION
    )
    :vars
    (
      ?auto_2324 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2324 ?auto_2323 ) ( IN-TRUCK ?auto_2322 ?auto_2324 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_2322 ?auto_2324 ?auto_2323 )
      ( DELIVER-1PKG-VERIFY ?auto_2322 ?auto_2323 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2327 - OBJ
      ?auto_2328 - LOCATION
    )
    :vars
    (
      ?auto_2329 - TRUCK
      ?auto_2330 - LOCATION
      ?auto_2331 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2327 ?auto_2329 ) ( TRUCK-AT ?auto_2329 ?auto_2330 ) ( IN-CITY ?auto_2330 ?auto_2331 ) ( IN-CITY ?auto_2328 ?auto_2331 ) ( not ( = ?auto_2328 ?auto_2330 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2329 ?auto_2330 ?auto_2328 ?auto_2331 )
      ( DELIVER-1PKG ?auto_2327 ?auto_2328 )
      ( DELIVER-1PKG-VERIFY ?auto_2327 ?auto_2328 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2334 - OBJ
      ?auto_2335 - LOCATION
    )
    :vars
    (
      ?auto_2336 - TRUCK
      ?auto_2338 - LOCATION
      ?auto_2337 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2336 ?auto_2338 ) ( IN-CITY ?auto_2338 ?auto_2337 ) ( IN-CITY ?auto_2335 ?auto_2337 ) ( not ( = ?auto_2335 ?auto_2338 ) ) ( OBJ-AT ?auto_2334 ?auto_2338 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2334 ?auto_2336 ?auto_2338 )
      ( DELIVER-1PKG ?auto_2334 ?auto_2335 )
      ( DELIVER-1PKG-VERIFY ?auto_2334 ?auto_2335 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2341 - OBJ
      ?auto_2342 - LOCATION
    )
    :vars
    (
      ?auto_2345 - LOCATION
      ?auto_2344 - CITY
      ?auto_2343 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2345 ?auto_2344 ) ( IN-CITY ?auto_2342 ?auto_2344 ) ( not ( = ?auto_2342 ?auto_2345 ) ) ( OBJ-AT ?auto_2341 ?auto_2345 ) ( TRUCK-AT ?auto_2343 ?auto_2342 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2343 ?auto_2342 ?auto_2345 ?auto_2344 )
      ( DELIVER-1PKG ?auto_2341 ?auto_2342 )
      ( DELIVER-1PKG-VERIFY ?auto_2341 ?auto_2342 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2351 - OBJ
      ?auto_2353 - OBJ
      ?auto_2354 - OBJ
      ?auto_2355 - OBJ
      ?auto_2352 - LOCATION
    )
    :vars
    (
      ?auto_2356 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2353 ?auto_2351 ) ( GREATER-THAN ?auto_2354 ?auto_2351 ) ( GREATER-THAN ?auto_2354 ?auto_2353 ) ( GREATER-THAN ?auto_2355 ?auto_2351 ) ( GREATER-THAN ?auto_2355 ?auto_2353 ) ( GREATER-THAN ?auto_2355 ?auto_2354 ) ( TRUCK-AT ?auto_2356 ?auto_2352 ) ( IN-TRUCK ?auto_2355 ?auto_2356 ) ( OBJ-AT ?auto_2351 ?auto_2352 ) ( OBJ-AT ?auto_2353 ?auto_2352 ) ( OBJ-AT ?auto_2354 ?auto_2352 ) ( not ( = ?auto_2351 ?auto_2353 ) ) ( not ( = ?auto_2351 ?auto_2354 ) ) ( not ( = ?auto_2351 ?auto_2355 ) ) ( not ( = ?auto_2353 ?auto_2354 ) ) ( not ( = ?auto_2353 ?auto_2355 ) ) ( not ( = ?auto_2354 ?auto_2355 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2355 ?auto_2352 )
      ( DELIVER-4PKG-VERIFY ?auto_2351 ?auto_2353 ?auto_2354 ?auto_2355 ?auto_2352 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2362 - OBJ
      ?auto_2364 - OBJ
      ?auto_2365 - OBJ
      ?auto_2366 - OBJ
      ?auto_2363 - LOCATION
    )
    :vars
    (
      ?auto_2367 - TRUCK
      ?auto_2369 - LOCATION
      ?auto_2368 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2364 ?auto_2362 ) ( GREATER-THAN ?auto_2365 ?auto_2362 ) ( GREATER-THAN ?auto_2365 ?auto_2364 ) ( GREATER-THAN ?auto_2366 ?auto_2362 ) ( GREATER-THAN ?auto_2366 ?auto_2364 ) ( GREATER-THAN ?auto_2366 ?auto_2365 ) ( IN-TRUCK ?auto_2366 ?auto_2367 ) ( TRUCK-AT ?auto_2367 ?auto_2369 ) ( IN-CITY ?auto_2369 ?auto_2368 ) ( IN-CITY ?auto_2363 ?auto_2368 ) ( not ( = ?auto_2363 ?auto_2369 ) ) ( OBJ-AT ?auto_2362 ?auto_2363 ) ( OBJ-AT ?auto_2364 ?auto_2363 ) ( OBJ-AT ?auto_2365 ?auto_2363 ) ( not ( = ?auto_2362 ?auto_2364 ) ) ( not ( = ?auto_2362 ?auto_2365 ) ) ( not ( = ?auto_2362 ?auto_2366 ) ) ( not ( = ?auto_2364 ?auto_2365 ) ) ( not ( = ?auto_2364 ?auto_2366 ) ) ( not ( = ?auto_2365 ?auto_2366 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2366 ?auto_2363 )
      ( DELIVER-4PKG-VERIFY ?auto_2362 ?auto_2364 ?auto_2365 ?auto_2366 ?auto_2363 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2375 - OBJ
      ?auto_2377 - OBJ
      ?auto_2378 - OBJ
      ?auto_2379 - OBJ
      ?auto_2376 - LOCATION
    )
    :vars
    (
      ?auto_2380 - TRUCK
      ?auto_2382 - LOCATION
      ?auto_2381 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2377 ?auto_2375 ) ( GREATER-THAN ?auto_2378 ?auto_2375 ) ( GREATER-THAN ?auto_2378 ?auto_2377 ) ( GREATER-THAN ?auto_2379 ?auto_2375 ) ( GREATER-THAN ?auto_2379 ?auto_2377 ) ( GREATER-THAN ?auto_2379 ?auto_2378 ) ( TRUCK-AT ?auto_2380 ?auto_2382 ) ( IN-CITY ?auto_2382 ?auto_2381 ) ( IN-CITY ?auto_2376 ?auto_2381 ) ( not ( = ?auto_2376 ?auto_2382 ) ) ( OBJ-AT ?auto_2379 ?auto_2382 ) ( OBJ-AT ?auto_2375 ?auto_2376 ) ( OBJ-AT ?auto_2377 ?auto_2376 ) ( OBJ-AT ?auto_2378 ?auto_2376 ) ( not ( = ?auto_2375 ?auto_2377 ) ) ( not ( = ?auto_2375 ?auto_2378 ) ) ( not ( = ?auto_2375 ?auto_2379 ) ) ( not ( = ?auto_2377 ?auto_2378 ) ) ( not ( = ?auto_2377 ?auto_2379 ) ) ( not ( = ?auto_2378 ?auto_2379 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2379 ?auto_2376 )
      ( DELIVER-4PKG-VERIFY ?auto_2375 ?auto_2377 ?auto_2378 ?auto_2379 ?auto_2376 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2388 - OBJ
      ?auto_2390 - OBJ
      ?auto_2391 - OBJ
      ?auto_2392 - OBJ
      ?auto_2389 - LOCATION
    )
    :vars
    (
      ?auto_2394 - LOCATION
      ?auto_2395 - CITY
      ?auto_2393 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2390 ?auto_2388 ) ( GREATER-THAN ?auto_2391 ?auto_2388 ) ( GREATER-THAN ?auto_2391 ?auto_2390 ) ( GREATER-THAN ?auto_2392 ?auto_2388 ) ( GREATER-THAN ?auto_2392 ?auto_2390 ) ( GREATER-THAN ?auto_2392 ?auto_2391 ) ( IN-CITY ?auto_2394 ?auto_2395 ) ( IN-CITY ?auto_2389 ?auto_2395 ) ( not ( = ?auto_2389 ?auto_2394 ) ) ( OBJ-AT ?auto_2392 ?auto_2394 ) ( TRUCK-AT ?auto_2393 ?auto_2389 ) ( OBJ-AT ?auto_2388 ?auto_2389 ) ( OBJ-AT ?auto_2390 ?auto_2389 ) ( OBJ-AT ?auto_2391 ?auto_2389 ) ( not ( = ?auto_2388 ?auto_2390 ) ) ( not ( = ?auto_2388 ?auto_2391 ) ) ( not ( = ?auto_2388 ?auto_2392 ) ) ( not ( = ?auto_2390 ?auto_2391 ) ) ( not ( = ?auto_2390 ?auto_2392 ) ) ( not ( = ?auto_2391 ?auto_2392 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2392 ?auto_2389 )
      ( DELIVER-4PKG-VERIFY ?auto_2388 ?auto_2390 ?auto_2391 ?auto_2392 ?auto_2389 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2401 - OBJ
      ?auto_2403 - OBJ
      ?auto_2404 - OBJ
      ?auto_2405 - OBJ
      ?auto_2402 - LOCATION
    )
    :vars
    (
      ?auto_2407 - LOCATION
      ?auto_2406 - CITY
      ?auto_2408 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2403 ?auto_2401 ) ( GREATER-THAN ?auto_2404 ?auto_2401 ) ( GREATER-THAN ?auto_2404 ?auto_2403 ) ( GREATER-THAN ?auto_2405 ?auto_2401 ) ( GREATER-THAN ?auto_2405 ?auto_2403 ) ( GREATER-THAN ?auto_2405 ?auto_2404 ) ( IN-CITY ?auto_2407 ?auto_2406 ) ( IN-CITY ?auto_2402 ?auto_2406 ) ( not ( = ?auto_2402 ?auto_2407 ) ) ( OBJ-AT ?auto_2405 ?auto_2407 ) ( TRUCK-AT ?auto_2408 ?auto_2402 ) ( OBJ-AT ?auto_2401 ?auto_2402 ) ( OBJ-AT ?auto_2403 ?auto_2402 ) ( not ( = ?auto_2401 ?auto_2403 ) ) ( not ( = ?auto_2401 ?auto_2404 ) ) ( not ( = ?auto_2401 ?auto_2405 ) ) ( not ( = ?auto_2403 ?auto_2404 ) ) ( not ( = ?auto_2403 ?auto_2405 ) ) ( not ( = ?auto_2404 ?auto_2405 ) ) ( IN-TRUCK ?auto_2404 ?auto_2408 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2404 ?auto_2402 )
      ( DELIVER-4PKG ?auto_2401 ?auto_2403 ?auto_2404 ?auto_2405 ?auto_2402 )
      ( DELIVER-4PKG-VERIFY ?auto_2401 ?auto_2403 ?auto_2404 ?auto_2405 ?auto_2402 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2414 - OBJ
      ?auto_2416 - OBJ
      ?auto_2417 - OBJ
      ?auto_2418 - OBJ
      ?auto_2415 - LOCATION
    )
    :vars
    (
      ?auto_2421 - LOCATION
      ?auto_2420 - CITY
      ?auto_2419 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2416 ?auto_2414 ) ( GREATER-THAN ?auto_2417 ?auto_2414 ) ( GREATER-THAN ?auto_2417 ?auto_2416 ) ( GREATER-THAN ?auto_2418 ?auto_2414 ) ( GREATER-THAN ?auto_2418 ?auto_2416 ) ( GREATER-THAN ?auto_2418 ?auto_2417 ) ( IN-CITY ?auto_2421 ?auto_2420 ) ( IN-CITY ?auto_2415 ?auto_2420 ) ( not ( = ?auto_2415 ?auto_2421 ) ) ( OBJ-AT ?auto_2418 ?auto_2421 ) ( OBJ-AT ?auto_2414 ?auto_2415 ) ( OBJ-AT ?auto_2416 ?auto_2415 ) ( not ( = ?auto_2414 ?auto_2416 ) ) ( not ( = ?auto_2414 ?auto_2417 ) ) ( not ( = ?auto_2414 ?auto_2418 ) ) ( not ( = ?auto_2416 ?auto_2417 ) ) ( not ( = ?auto_2416 ?auto_2418 ) ) ( not ( = ?auto_2417 ?auto_2418 ) ) ( IN-TRUCK ?auto_2417 ?auto_2419 ) ( TRUCK-AT ?auto_2419 ?auto_2421 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2419 ?auto_2421 ?auto_2415 ?auto_2420 )
      ( DELIVER-4PKG ?auto_2414 ?auto_2416 ?auto_2417 ?auto_2418 ?auto_2415 )
      ( DELIVER-4PKG-VERIFY ?auto_2414 ?auto_2416 ?auto_2417 ?auto_2418 ?auto_2415 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2427 - OBJ
      ?auto_2429 - OBJ
      ?auto_2430 - OBJ
      ?auto_2431 - OBJ
      ?auto_2428 - LOCATION
    )
    :vars
    (
      ?auto_2433 - LOCATION
      ?auto_2432 - CITY
      ?auto_2434 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2429 ?auto_2427 ) ( GREATER-THAN ?auto_2430 ?auto_2427 ) ( GREATER-THAN ?auto_2430 ?auto_2429 ) ( GREATER-THAN ?auto_2431 ?auto_2427 ) ( GREATER-THAN ?auto_2431 ?auto_2429 ) ( GREATER-THAN ?auto_2431 ?auto_2430 ) ( IN-CITY ?auto_2433 ?auto_2432 ) ( IN-CITY ?auto_2428 ?auto_2432 ) ( not ( = ?auto_2428 ?auto_2433 ) ) ( OBJ-AT ?auto_2431 ?auto_2433 ) ( OBJ-AT ?auto_2427 ?auto_2428 ) ( OBJ-AT ?auto_2429 ?auto_2428 ) ( not ( = ?auto_2427 ?auto_2429 ) ) ( not ( = ?auto_2427 ?auto_2430 ) ) ( not ( = ?auto_2427 ?auto_2431 ) ) ( not ( = ?auto_2429 ?auto_2430 ) ) ( not ( = ?auto_2429 ?auto_2431 ) ) ( not ( = ?auto_2430 ?auto_2431 ) ) ( TRUCK-AT ?auto_2434 ?auto_2433 ) ( OBJ-AT ?auto_2430 ?auto_2433 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2430 ?auto_2434 ?auto_2433 )
      ( DELIVER-4PKG ?auto_2427 ?auto_2429 ?auto_2430 ?auto_2431 ?auto_2428 )
      ( DELIVER-4PKG-VERIFY ?auto_2427 ?auto_2429 ?auto_2430 ?auto_2431 ?auto_2428 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2440 - OBJ
      ?auto_2442 - OBJ
      ?auto_2443 - OBJ
      ?auto_2444 - OBJ
      ?auto_2441 - LOCATION
    )
    :vars
    (
      ?auto_2445 - LOCATION
      ?auto_2447 - CITY
      ?auto_2446 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2442 ?auto_2440 ) ( GREATER-THAN ?auto_2443 ?auto_2440 ) ( GREATER-THAN ?auto_2443 ?auto_2442 ) ( GREATER-THAN ?auto_2444 ?auto_2440 ) ( GREATER-THAN ?auto_2444 ?auto_2442 ) ( GREATER-THAN ?auto_2444 ?auto_2443 ) ( IN-CITY ?auto_2445 ?auto_2447 ) ( IN-CITY ?auto_2441 ?auto_2447 ) ( not ( = ?auto_2441 ?auto_2445 ) ) ( OBJ-AT ?auto_2444 ?auto_2445 ) ( OBJ-AT ?auto_2440 ?auto_2441 ) ( OBJ-AT ?auto_2442 ?auto_2441 ) ( not ( = ?auto_2440 ?auto_2442 ) ) ( not ( = ?auto_2440 ?auto_2443 ) ) ( not ( = ?auto_2440 ?auto_2444 ) ) ( not ( = ?auto_2442 ?auto_2443 ) ) ( not ( = ?auto_2442 ?auto_2444 ) ) ( not ( = ?auto_2443 ?auto_2444 ) ) ( OBJ-AT ?auto_2443 ?auto_2445 ) ( TRUCK-AT ?auto_2446 ?auto_2441 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2446 ?auto_2441 ?auto_2445 ?auto_2447 )
      ( DELIVER-4PKG ?auto_2440 ?auto_2442 ?auto_2443 ?auto_2444 ?auto_2441 )
      ( DELIVER-4PKG-VERIFY ?auto_2440 ?auto_2442 ?auto_2443 ?auto_2444 ?auto_2441 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2453 - OBJ
      ?auto_2455 - OBJ
      ?auto_2456 - OBJ
      ?auto_2457 - OBJ
      ?auto_2454 - LOCATION
    )
    :vars
    (
      ?auto_2458 - LOCATION
      ?auto_2460 - CITY
      ?auto_2459 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2455 ?auto_2453 ) ( GREATER-THAN ?auto_2456 ?auto_2453 ) ( GREATER-THAN ?auto_2456 ?auto_2455 ) ( GREATER-THAN ?auto_2457 ?auto_2453 ) ( GREATER-THAN ?auto_2457 ?auto_2455 ) ( GREATER-THAN ?auto_2457 ?auto_2456 ) ( IN-CITY ?auto_2458 ?auto_2460 ) ( IN-CITY ?auto_2454 ?auto_2460 ) ( not ( = ?auto_2454 ?auto_2458 ) ) ( OBJ-AT ?auto_2457 ?auto_2458 ) ( OBJ-AT ?auto_2453 ?auto_2454 ) ( not ( = ?auto_2453 ?auto_2455 ) ) ( not ( = ?auto_2453 ?auto_2456 ) ) ( not ( = ?auto_2453 ?auto_2457 ) ) ( not ( = ?auto_2455 ?auto_2456 ) ) ( not ( = ?auto_2455 ?auto_2457 ) ) ( not ( = ?auto_2456 ?auto_2457 ) ) ( OBJ-AT ?auto_2456 ?auto_2458 ) ( TRUCK-AT ?auto_2459 ?auto_2454 ) ( IN-TRUCK ?auto_2455 ?auto_2459 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2455 ?auto_2454 )
      ( DELIVER-4PKG ?auto_2453 ?auto_2455 ?auto_2456 ?auto_2457 ?auto_2454 )
      ( DELIVER-4PKG-VERIFY ?auto_2453 ?auto_2455 ?auto_2456 ?auto_2457 ?auto_2454 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2466 - OBJ
      ?auto_2468 - OBJ
      ?auto_2469 - OBJ
      ?auto_2470 - OBJ
      ?auto_2467 - LOCATION
    )
    :vars
    (
      ?auto_2473 - LOCATION
      ?auto_2472 - CITY
      ?auto_2471 - TRUCK
      ?auto_2474 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2468 ?auto_2466 ) ( GREATER-THAN ?auto_2469 ?auto_2466 ) ( GREATER-THAN ?auto_2469 ?auto_2468 ) ( GREATER-THAN ?auto_2470 ?auto_2466 ) ( GREATER-THAN ?auto_2470 ?auto_2468 ) ( GREATER-THAN ?auto_2470 ?auto_2469 ) ( IN-CITY ?auto_2473 ?auto_2472 ) ( IN-CITY ?auto_2467 ?auto_2472 ) ( not ( = ?auto_2467 ?auto_2473 ) ) ( OBJ-AT ?auto_2470 ?auto_2473 ) ( OBJ-AT ?auto_2466 ?auto_2467 ) ( not ( = ?auto_2466 ?auto_2468 ) ) ( not ( = ?auto_2466 ?auto_2469 ) ) ( not ( = ?auto_2466 ?auto_2470 ) ) ( not ( = ?auto_2468 ?auto_2469 ) ) ( not ( = ?auto_2468 ?auto_2470 ) ) ( not ( = ?auto_2469 ?auto_2470 ) ) ( OBJ-AT ?auto_2469 ?auto_2473 ) ( IN-TRUCK ?auto_2468 ?auto_2471 ) ( TRUCK-AT ?auto_2471 ?auto_2474 ) ( IN-CITY ?auto_2474 ?auto_2472 ) ( not ( = ?auto_2467 ?auto_2474 ) ) ( not ( = ?auto_2473 ?auto_2474 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2471 ?auto_2474 ?auto_2467 ?auto_2472 )
      ( DELIVER-4PKG ?auto_2466 ?auto_2468 ?auto_2469 ?auto_2470 ?auto_2467 )
      ( DELIVER-4PKG-VERIFY ?auto_2466 ?auto_2468 ?auto_2469 ?auto_2470 ?auto_2467 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2480 - OBJ
      ?auto_2482 - OBJ
      ?auto_2483 - OBJ
      ?auto_2484 - OBJ
      ?auto_2481 - LOCATION
    )
    :vars
    (
      ?auto_2486 - LOCATION
      ?auto_2485 - CITY
      ?auto_2487 - TRUCK
      ?auto_2488 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2482 ?auto_2480 ) ( GREATER-THAN ?auto_2483 ?auto_2480 ) ( GREATER-THAN ?auto_2483 ?auto_2482 ) ( GREATER-THAN ?auto_2484 ?auto_2480 ) ( GREATER-THAN ?auto_2484 ?auto_2482 ) ( GREATER-THAN ?auto_2484 ?auto_2483 ) ( IN-CITY ?auto_2486 ?auto_2485 ) ( IN-CITY ?auto_2481 ?auto_2485 ) ( not ( = ?auto_2481 ?auto_2486 ) ) ( OBJ-AT ?auto_2484 ?auto_2486 ) ( OBJ-AT ?auto_2480 ?auto_2481 ) ( not ( = ?auto_2480 ?auto_2482 ) ) ( not ( = ?auto_2480 ?auto_2483 ) ) ( not ( = ?auto_2480 ?auto_2484 ) ) ( not ( = ?auto_2482 ?auto_2483 ) ) ( not ( = ?auto_2482 ?auto_2484 ) ) ( not ( = ?auto_2483 ?auto_2484 ) ) ( OBJ-AT ?auto_2483 ?auto_2486 ) ( TRUCK-AT ?auto_2487 ?auto_2488 ) ( IN-CITY ?auto_2488 ?auto_2485 ) ( not ( = ?auto_2481 ?auto_2488 ) ) ( not ( = ?auto_2486 ?auto_2488 ) ) ( OBJ-AT ?auto_2482 ?auto_2488 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2482 ?auto_2487 ?auto_2488 )
      ( DELIVER-4PKG ?auto_2480 ?auto_2482 ?auto_2483 ?auto_2484 ?auto_2481 )
      ( DELIVER-4PKG-VERIFY ?auto_2480 ?auto_2482 ?auto_2483 ?auto_2484 ?auto_2481 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2494 - OBJ
      ?auto_2496 - OBJ
      ?auto_2497 - OBJ
      ?auto_2498 - OBJ
      ?auto_2495 - LOCATION
    )
    :vars
    (
      ?auto_2501 - LOCATION
      ?auto_2500 - CITY
      ?auto_2502 - LOCATION
      ?auto_2499 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2496 ?auto_2494 ) ( GREATER-THAN ?auto_2497 ?auto_2494 ) ( GREATER-THAN ?auto_2497 ?auto_2496 ) ( GREATER-THAN ?auto_2498 ?auto_2494 ) ( GREATER-THAN ?auto_2498 ?auto_2496 ) ( GREATER-THAN ?auto_2498 ?auto_2497 ) ( IN-CITY ?auto_2501 ?auto_2500 ) ( IN-CITY ?auto_2495 ?auto_2500 ) ( not ( = ?auto_2495 ?auto_2501 ) ) ( OBJ-AT ?auto_2498 ?auto_2501 ) ( OBJ-AT ?auto_2494 ?auto_2495 ) ( not ( = ?auto_2494 ?auto_2496 ) ) ( not ( = ?auto_2494 ?auto_2497 ) ) ( not ( = ?auto_2494 ?auto_2498 ) ) ( not ( = ?auto_2496 ?auto_2497 ) ) ( not ( = ?auto_2496 ?auto_2498 ) ) ( not ( = ?auto_2497 ?auto_2498 ) ) ( OBJ-AT ?auto_2497 ?auto_2501 ) ( IN-CITY ?auto_2502 ?auto_2500 ) ( not ( = ?auto_2495 ?auto_2502 ) ) ( not ( = ?auto_2501 ?auto_2502 ) ) ( OBJ-AT ?auto_2496 ?auto_2502 ) ( TRUCK-AT ?auto_2499 ?auto_2495 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2499 ?auto_2495 ?auto_2502 ?auto_2500 )
      ( DELIVER-4PKG ?auto_2494 ?auto_2496 ?auto_2497 ?auto_2498 ?auto_2495 )
      ( DELIVER-4PKG-VERIFY ?auto_2494 ?auto_2496 ?auto_2497 ?auto_2498 ?auto_2495 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2508 - OBJ
      ?auto_2510 - OBJ
      ?auto_2511 - OBJ
      ?auto_2512 - OBJ
      ?auto_2509 - LOCATION
    )
    :vars
    (
      ?auto_2513 - LOCATION
      ?auto_2515 - CITY
      ?auto_2516 - LOCATION
      ?auto_2514 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2510 ?auto_2508 ) ( GREATER-THAN ?auto_2511 ?auto_2508 ) ( GREATER-THAN ?auto_2511 ?auto_2510 ) ( GREATER-THAN ?auto_2512 ?auto_2508 ) ( GREATER-THAN ?auto_2512 ?auto_2510 ) ( GREATER-THAN ?auto_2512 ?auto_2511 ) ( IN-CITY ?auto_2513 ?auto_2515 ) ( IN-CITY ?auto_2509 ?auto_2515 ) ( not ( = ?auto_2509 ?auto_2513 ) ) ( OBJ-AT ?auto_2512 ?auto_2513 ) ( not ( = ?auto_2508 ?auto_2510 ) ) ( not ( = ?auto_2508 ?auto_2511 ) ) ( not ( = ?auto_2508 ?auto_2512 ) ) ( not ( = ?auto_2510 ?auto_2511 ) ) ( not ( = ?auto_2510 ?auto_2512 ) ) ( not ( = ?auto_2511 ?auto_2512 ) ) ( OBJ-AT ?auto_2511 ?auto_2513 ) ( IN-CITY ?auto_2516 ?auto_2515 ) ( not ( = ?auto_2509 ?auto_2516 ) ) ( not ( = ?auto_2513 ?auto_2516 ) ) ( OBJ-AT ?auto_2510 ?auto_2516 ) ( TRUCK-AT ?auto_2514 ?auto_2509 ) ( IN-TRUCK ?auto_2508 ?auto_2514 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2508 ?auto_2509 )
      ( DELIVER-4PKG ?auto_2508 ?auto_2510 ?auto_2511 ?auto_2512 ?auto_2509 )
      ( DELIVER-4PKG-VERIFY ?auto_2508 ?auto_2510 ?auto_2511 ?auto_2512 ?auto_2509 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2522 - OBJ
      ?auto_2524 - OBJ
      ?auto_2525 - OBJ
      ?auto_2526 - OBJ
      ?auto_2523 - LOCATION
    )
    :vars
    (
      ?auto_2530 - LOCATION
      ?auto_2529 - CITY
      ?auto_2528 - LOCATION
      ?auto_2527 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2524 ?auto_2522 ) ( GREATER-THAN ?auto_2525 ?auto_2522 ) ( GREATER-THAN ?auto_2525 ?auto_2524 ) ( GREATER-THAN ?auto_2526 ?auto_2522 ) ( GREATER-THAN ?auto_2526 ?auto_2524 ) ( GREATER-THAN ?auto_2526 ?auto_2525 ) ( IN-CITY ?auto_2530 ?auto_2529 ) ( IN-CITY ?auto_2523 ?auto_2529 ) ( not ( = ?auto_2523 ?auto_2530 ) ) ( OBJ-AT ?auto_2526 ?auto_2530 ) ( not ( = ?auto_2522 ?auto_2524 ) ) ( not ( = ?auto_2522 ?auto_2525 ) ) ( not ( = ?auto_2522 ?auto_2526 ) ) ( not ( = ?auto_2524 ?auto_2525 ) ) ( not ( = ?auto_2524 ?auto_2526 ) ) ( not ( = ?auto_2525 ?auto_2526 ) ) ( OBJ-AT ?auto_2525 ?auto_2530 ) ( IN-CITY ?auto_2528 ?auto_2529 ) ( not ( = ?auto_2523 ?auto_2528 ) ) ( not ( = ?auto_2530 ?auto_2528 ) ) ( OBJ-AT ?auto_2524 ?auto_2528 ) ( IN-TRUCK ?auto_2522 ?auto_2527 ) ( TRUCK-AT ?auto_2527 ?auto_2528 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2527 ?auto_2528 ?auto_2523 ?auto_2529 )
      ( DELIVER-4PKG ?auto_2522 ?auto_2524 ?auto_2525 ?auto_2526 ?auto_2523 )
      ( DELIVER-4PKG-VERIFY ?auto_2522 ?auto_2524 ?auto_2525 ?auto_2526 ?auto_2523 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2536 - OBJ
      ?auto_2538 - OBJ
      ?auto_2539 - OBJ
      ?auto_2540 - OBJ
      ?auto_2537 - LOCATION
    )
    :vars
    (
      ?auto_2543 - LOCATION
      ?auto_2544 - CITY
      ?auto_2542 - LOCATION
      ?auto_2541 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2538 ?auto_2536 ) ( GREATER-THAN ?auto_2539 ?auto_2536 ) ( GREATER-THAN ?auto_2539 ?auto_2538 ) ( GREATER-THAN ?auto_2540 ?auto_2536 ) ( GREATER-THAN ?auto_2540 ?auto_2538 ) ( GREATER-THAN ?auto_2540 ?auto_2539 ) ( IN-CITY ?auto_2543 ?auto_2544 ) ( IN-CITY ?auto_2537 ?auto_2544 ) ( not ( = ?auto_2537 ?auto_2543 ) ) ( OBJ-AT ?auto_2540 ?auto_2543 ) ( not ( = ?auto_2536 ?auto_2538 ) ) ( not ( = ?auto_2536 ?auto_2539 ) ) ( not ( = ?auto_2536 ?auto_2540 ) ) ( not ( = ?auto_2538 ?auto_2539 ) ) ( not ( = ?auto_2538 ?auto_2540 ) ) ( not ( = ?auto_2539 ?auto_2540 ) ) ( OBJ-AT ?auto_2539 ?auto_2543 ) ( IN-CITY ?auto_2542 ?auto_2544 ) ( not ( = ?auto_2537 ?auto_2542 ) ) ( not ( = ?auto_2543 ?auto_2542 ) ) ( OBJ-AT ?auto_2538 ?auto_2542 ) ( TRUCK-AT ?auto_2541 ?auto_2542 ) ( OBJ-AT ?auto_2536 ?auto_2542 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2536 ?auto_2541 ?auto_2542 )
      ( DELIVER-4PKG ?auto_2536 ?auto_2538 ?auto_2539 ?auto_2540 ?auto_2537 )
      ( DELIVER-4PKG-VERIFY ?auto_2536 ?auto_2538 ?auto_2539 ?auto_2540 ?auto_2537 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2550 - OBJ
      ?auto_2552 - OBJ
      ?auto_2553 - OBJ
      ?auto_2554 - OBJ
      ?auto_2551 - LOCATION
    )
    :vars
    (
      ?auto_2556 - LOCATION
      ?auto_2558 - CITY
      ?auto_2555 - LOCATION
      ?auto_2557 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2552 ?auto_2550 ) ( GREATER-THAN ?auto_2553 ?auto_2550 ) ( GREATER-THAN ?auto_2553 ?auto_2552 ) ( GREATER-THAN ?auto_2554 ?auto_2550 ) ( GREATER-THAN ?auto_2554 ?auto_2552 ) ( GREATER-THAN ?auto_2554 ?auto_2553 ) ( IN-CITY ?auto_2556 ?auto_2558 ) ( IN-CITY ?auto_2551 ?auto_2558 ) ( not ( = ?auto_2551 ?auto_2556 ) ) ( OBJ-AT ?auto_2554 ?auto_2556 ) ( not ( = ?auto_2550 ?auto_2552 ) ) ( not ( = ?auto_2550 ?auto_2553 ) ) ( not ( = ?auto_2550 ?auto_2554 ) ) ( not ( = ?auto_2552 ?auto_2553 ) ) ( not ( = ?auto_2552 ?auto_2554 ) ) ( not ( = ?auto_2553 ?auto_2554 ) ) ( OBJ-AT ?auto_2553 ?auto_2556 ) ( IN-CITY ?auto_2555 ?auto_2558 ) ( not ( = ?auto_2551 ?auto_2555 ) ) ( not ( = ?auto_2556 ?auto_2555 ) ) ( OBJ-AT ?auto_2552 ?auto_2555 ) ( OBJ-AT ?auto_2550 ?auto_2555 ) ( TRUCK-AT ?auto_2557 ?auto_2551 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2557 ?auto_2551 ?auto_2555 ?auto_2558 )
      ( DELIVER-4PKG ?auto_2550 ?auto_2552 ?auto_2553 ?auto_2554 ?auto_2551 )
      ( DELIVER-4PKG-VERIFY ?auto_2550 ?auto_2552 ?auto_2553 ?auto_2554 ?auto_2551 ) )
  )

)

