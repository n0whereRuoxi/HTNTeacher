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
      ?auto_2033 - OBJ
      ?auto_2034 - LOCATION
    )
    :vars
    (
      ?auto_2035 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2035 ?auto_2034 ) ( IN-TRUCK ?auto_2033 ?auto_2035 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_2033 ?auto_2035 ?auto_2034 )
      ( DELIVER-1PKG-VERIFY ?auto_2033 ?auto_2034 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2040 - OBJ
      ?auto_2041 - LOCATION
    )
    :vars
    (
      ?auto_2042 - TRUCK
      ?auto_2046 - LOCATION
      ?auto_2047 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2040 ?auto_2042 ) ( TRUCK-AT ?auto_2042 ?auto_2046 ) ( IN-CITY ?auto_2046 ?auto_2047 ) ( IN-CITY ?auto_2041 ?auto_2047 ) ( not ( = ?auto_2041 ?auto_2046 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2042 ?auto_2046 ?auto_2041 ?auto_2047 )
      ( DELIVER-1PKG ?auto_2040 ?auto_2041 )
      ( DELIVER-1PKG-VERIFY ?auto_2040 ?auto_2041 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2051 - OBJ
      ?auto_2052 - LOCATION
    )
    :vars
    (
      ?auto_2054 - TRUCK
      ?auto_2056 - LOCATION
      ?auto_2055 - CITY
      ?auto_2059 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2054 ?auto_2056 ) ( IN-CITY ?auto_2056 ?auto_2055 ) ( IN-CITY ?auto_2052 ?auto_2055 ) ( not ( = ?auto_2052 ?auto_2056 ) ) ( TRUCK-AT ?auto_2054 ?auto_2059 ) ( OBJ-AT ?auto_2051 ?auto_2059 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2051 ?auto_2054 ?auto_2059 )
      ( DELIVER-1PKG ?auto_2051 ?auto_2052 )
      ( DELIVER-1PKG-VERIFY ?auto_2051 ?auto_2052 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2063 - OBJ
      ?auto_2064 - LOCATION
    )
    :vars
    (
      ?auto_2069 - LOCATION
      ?auto_2070 - CITY
      ?auto_2066 - TRUCK
      ?auto_2072 - LOCATION
      ?auto_2073 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_2069 ?auto_2070 ) ( IN-CITY ?auto_2064 ?auto_2070 ) ( not ( = ?auto_2064 ?auto_2069 ) ) ( OBJ-AT ?auto_2063 ?auto_2069 ) ( TRUCK-AT ?auto_2066 ?auto_2072 ) ( IN-CITY ?auto_2072 ?auto_2073 ) ( IN-CITY ?auto_2069 ?auto_2073 ) ( not ( = ?auto_2069 ?auto_2072 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2066 ?auto_2072 ?auto_2069 ?auto_2073 )
      ( DELIVER-1PKG ?auto_2063 ?auto_2064 )
      ( DELIVER-1PKG-VERIFY ?auto_2063 ?auto_2064 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2122 - OBJ
      ?auto_2124 - OBJ
      ?auto_2123 - LOCATION
    )
    :vars
    (
      ?auto_2126 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2124 ?auto_2122 ) ( TRUCK-AT ?auto_2126 ?auto_2123 ) ( IN-TRUCK ?auto_2124 ?auto_2126 ) ( OBJ-AT ?auto_2122 ?auto_2123 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2124 ?auto_2123 )
      ( DELIVER-2PKG-VERIFY ?auto_2122 ?auto_2124 ?auto_2123 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2131 - OBJ
      ?auto_2133 - OBJ
      ?auto_2132 - LOCATION
    )
    :vars
    (
      ?auto_2135 - TRUCK
      ?auto_2136 - LOCATION
      ?auto_2137 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2133 ?auto_2131 ) ( IN-TRUCK ?auto_2133 ?auto_2135 ) ( TRUCK-AT ?auto_2135 ?auto_2136 ) ( IN-CITY ?auto_2136 ?auto_2137 ) ( IN-CITY ?auto_2132 ?auto_2137 ) ( not ( = ?auto_2132 ?auto_2136 ) ) ( OBJ-AT ?auto_2131 ?auto_2132 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2133 ?auto_2132 )
      ( DELIVER-2PKG-VERIFY ?auto_2131 ?auto_2133 ?auto_2132 ) )
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
      ?auto_2149 - TRUCK
      ?auto_2147 - LOCATION
      ?auto_2146 - CITY
      ?auto_2145 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2144 ?auto_2142 ) ( TRUCK-AT ?auto_2149 ?auto_2147 ) ( IN-CITY ?auto_2147 ?auto_2146 ) ( IN-CITY ?auto_2143 ?auto_2146 ) ( not ( = ?auto_2143 ?auto_2147 ) ) ( TRUCK-AT ?auto_2149 ?auto_2145 ) ( OBJ-AT ?auto_2144 ?auto_2145 ) ( OBJ-AT ?auto_2142 ?auto_2143 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2144 ?auto_2143 )
      ( DELIVER-2PKG-VERIFY ?auto_2142 ?auto_2144 ?auto_2143 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2154 - OBJ
      ?auto_2156 - OBJ
      ?auto_2155 - LOCATION
    )
    :vars
    (
      ?auto_2162 - LOCATION
      ?auto_2157 - CITY
      ?auto_2163 - TRUCK
      ?auto_2161 - LOCATION
      ?auto_2158 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2156 ?auto_2154 ) ( IN-CITY ?auto_2162 ?auto_2157 ) ( IN-CITY ?auto_2155 ?auto_2157 ) ( not ( = ?auto_2155 ?auto_2162 ) ) ( OBJ-AT ?auto_2156 ?auto_2162 ) ( TRUCK-AT ?auto_2163 ?auto_2161 ) ( IN-CITY ?auto_2161 ?auto_2158 ) ( IN-CITY ?auto_2162 ?auto_2158 ) ( not ( = ?auto_2162 ?auto_2161 ) ) ( OBJ-AT ?auto_2154 ?auto_2155 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2156 ?auto_2155 )
      ( DELIVER-2PKG-VERIFY ?auto_2154 ?auto_2156 ?auto_2155 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2171 - OBJ
      ?auto_2169 - OBJ
      ?auto_2168 - LOCATION
    )
    :vars
    (
      ?auto_2170 - LOCATION
      ?auto_2176 - CITY
      ?auto_2173 - TRUCK
      ?auto_2175 - LOCATION
      ?auto_2172 - CITY
      ?auto_2178 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2169 ?auto_2171 ) ( IN-CITY ?auto_2170 ?auto_2176 ) ( IN-CITY ?auto_2168 ?auto_2176 ) ( not ( = ?auto_2168 ?auto_2170 ) ) ( OBJ-AT ?auto_2169 ?auto_2170 ) ( TRUCK-AT ?auto_2173 ?auto_2175 ) ( IN-CITY ?auto_2175 ?auto_2172 ) ( IN-CITY ?auto_2170 ?auto_2172 ) ( not ( = ?auto_2170 ?auto_2175 ) ) ( TRUCK-AT ?auto_2178 ?auto_2168 ) ( IN-TRUCK ?auto_2171 ?auto_2178 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2171 ?auto_2168 )
      ( DELIVER-2PKG ?auto_2171 ?auto_2169 ?auto_2168 )
      ( DELIVER-2PKG-VERIFY ?auto_2171 ?auto_2169 ?auto_2168 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2184 - OBJ
      ?auto_2186 - OBJ
      ?auto_2185 - LOCATION
    )
    :vars
    (
      ?auto_2187 - LOCATION
      ?auto_2195 - CITY
      ?auto_2190 - CITY
      ?auto_2189 - TRUCK
      ?auto_2197 - LOCATION
      ?auto_2198 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2186 ?auto_2184 ) ( IN-CITY ?auto_2187 ?auto_2195 ) ( IN-CITY ?auto_2185 ?auto_2195 ) ( not ( = ?auto_2185 ?auto_2187 ) ) ( OBJ-AT ?auto_2186 ?auto_2187 ) ( IN-CITY ?auto_2185 ?auto_2190 ) ( IN-CITY ?auto_2187 ?auto_2190 ) ( IN-TRUCK ?auto_2184 ?auto_2189 ) ( TRUCK-AT ?auto_2189 ?auto_2197 ) ( IN-CITY ?auto_2197 ?auto_2198 ) ( IN-CITY ?auto_2185 ?auto_2198 ) ( not ( = ?auto_2185 ?auto_2197 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2189 ?auto_2197 ?auto_2185 ?auto_2198 )
      ( DELIVER-2PKG ?auto_2184 ?auto_2186 ?auto_2185 )
      ( DELIVER-2PKG-VERIFY ?auto_2184 ?auto_2186 ?auto_2185 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2203 - OBJ
      ?auto_2205 - OBJ
      ?auto_2204 - LOCATION
    )
    :vars
    (
      ?auto_2209 - LOCATION
      ?auto_2212 - CITY
      ?auto_2207 - CITY
      ?auto_2211 - TRUCK
      ?auto_2206 - LOCATION
      ?auto_2213 - CITY
      ?auto_2216 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2205 ?auto_2203 ) ( IN-CITY ?auto_2209 ?auto_2212 ) ( IN-CITY ?auto_2204 ?auto_2212 ) ( not ( = ?auto_2204 ?auto_2209 ) ) ( OBJ-AT ?auto_2205 ?auto_2209 ) ( IN-CITY ?auto_2204 ?auto_2207 ) ( IN-CITY ?auto_2209 ?auto_2207 ) ( TRUCK-AT ?auto_2211 ?auto_2206 ) ( IN-CITY ?auto_2206 ?auto_2213 ) ( IN-CITY ?auto_2204 ?auto_2213 ) ( not ( = ?auto_2204 ?auto_2206 ) ) ( TRUCK-AT ?auto_2211 ?auto_2216 ) ( OBJ-AT ?auto_2203 ?auto_2216 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2203 ?auto_2211 ?auto_2216 )
      ( DELIVER-2PKG ?auto_2203 ?auto_2205 ?auto_2204 )
      ( DELIVER-2PKG-VERIFY ?auto_2203 ?auto_2205 ?auto_2204 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2221 - OBJ
      ?auto_2223 - OBJ
      ?auto_2222 - LOCATION
    )
    :vars
    (
      ?auto_2232 - LOCATION
      ?auto_2228 - CITY
      ?auto_2226 - CITY
      ?auto_2227 - LOCATION
      ?auto_2233 - CITY
      ?auto_2224 - TRUCK
      ?auto_2235 - LOCATION
      ?auto_2236 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2223 ?auto_2221 ) ( IN-CITY ?auto_2232 ?auto_2228 ) ( IN-CITY ?auto_2222 ?auto_2228 ) ( not ( = ?auto_2222 ?auto_2232 ) ) ( OBJ-AT ?auto_2223 ?auto_2232 ) ( IN-CITY ?auto_2222 ?auto_2226 ) ( IN-CITY ?auto_2232 ?auto_2226 ) ( IN-CITY ?auto_2227 ?auto_2233 ) ( IN-CITY ?auto_2222 ?auto_2233 ) ( not ( = ?auto_2222 ?auto_2227 ) ) ( OBJ-AT ?auto_2221 ?auto_2227 ) ( TRUCK-AT ?auto_2224 ?auto_2235 ) ( IN-CITY ?auto_2235 ?auto_2236 ) ( IN-CITY ?auto_2227 ?auto_2236 ) ( not ( = ?auto_2227 ?auto_2235 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2224 ?auto_2235 ?auto_2227 ?auto_2236 )
      ( DELIVER-2PKG ?auto_2221 ?auto_2223 ?auto_2222 )
      ( DELIVER-2PKG-VERIFY ?auto_2221 ?auto_2223 ?auto_2222 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2286 - OBJ
      ?auto_2288 - OBJ
      ?auto_2289 - OBJ
      ?auto_2287 - LOCATION
    )
    :vars
    (
      ?auto_2291 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2288 ?auto_2286 ) ( GREATER-THAN ?auto_2289 ?auto_2286 ) ( GREATER-THAN ?auto_2289 ?auto_2288 ) ( TRUCK-AT ?auto_2291 ?auto_2287 ) ( IN-TRUCK ?auto_2289 ?auto_2291 ) ( OBJ-AT ?auto_2286 ?auto_2287 ) ( OBJ-AT ?auto_2288 ?auto_2287 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2289 ?auto_2287 )
      ( DELIVER-3PKG-VERIFY ?auto_2286 ?auto_2288 ?auto_2289 ?auto_2287 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2297 - OBJ
      ?auto_2299 - OBJ
      ?auto_2300 - OBJ
      ?auto_2298 - LOCATION
    )
    :vars
    (
      ?auto_2301 - TRUCK
      ?auto_2304 - LOCATION
      ?auto_2302 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2299 ?auto_2297 ) ( GREATER-THAN ?auto_2300 ?auto_2297 ) ( GREATER-THAN ?auto_2300 ?auto_2299 ) ( IN-TRUCK ?auto_2300 ?auto_2301 ) ( TRUCK-AT ?auto_2301 ?auto_2304 ) ( IN-CITY ?auto_2304 ?auto_2302 ) ( IN-CITY ?auto_2298 ?auto_2302 ) ( not ( = ?auto_2298 ?auto_2304 ) ) ( OBJ-AT ?auto_2297 ?auto_2298 ) ( OBJ-AT ?auto_2299 ?auto_2298 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2300 ?auto_2298 )
      ( DELIVER-3PKG-VERIFY ?auto_2297 ?auto_2299 ?auto_2300 ?auto_2298 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2310 - OBJ
      ?auto_2312 - OBJ
      ?auto_2313 - OBJ
      ?auto_2311 - LOCATION
    )
    :vars
    (
      ?auto_2316 - TRUCK
      ?auto_2317 - LOCATION
      ?auto_2315 - CITY
      ?auto_2318 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2312 ?auto_2310 ) ( GREATER-THAN ?auto_2313 ?auto_2310 ) ( GREATER-THAN ?auto_2313 ?auto_2312 ) ( TRUCK-AT ?auto_2316 ?auto_2317 ) ( IN-CITY ?auto_2317 ?auto_2315 ) ( IN-CITY ?auto_2311 ?auto_2315 ) ( not ( = ?auto_2311 ?auto_2317 ) ) ( TRUCK-AT ?auto_2316 ?auto_2318 ) ( OBJ-AT ?auto_2313 ?auto_2318 ) ( OBJ-AT ?auto_2310 ?auto_2311 ) ( OBJ-AT ?auto_2312 ?auto_2311 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2313 ?auto_2311 )
      ( DELIVER-3PKG-VERIFY ?auto_2310 ?auto_2312 ?auto_2313 ?auto_2311 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2324 - OBJ
      ?auto_2326 - OBJ
      ?auto_2327 - OBJ
      ?auto_2325 - LOCATION
    )
    :vars
    (
      ?auto_2330 - LOCATION
      ?auto_2328 - CITY
      ?auto_2333 - TRUCK
      ?auto_2334 - LOCATION
      ?auto_2332 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2326 ?auto_2324 ) ( GREATER-THAN ?auto_2327 ?auto_2324 ) ( GREATER-THAN ?auto_2327 ?auto_2326 ) ( IN-CITY ?auto_2330 ?auto_2328 ) ( IN-CITY ?auto_2325 ?auto_2328 ) ( not ( = ?auto_2325 ?auto_2330 ) ) ( OBJ-AT ?auto_2327 ?auto_2330 ) ( TRUCK-AT ?auto_2333 ?auto_2334 ) ( IN-CITY ?auto_2334 ?auto_2332 ) ( IN-CITY ?auto_2330 ?auto_2332 ) ( not ( = ?auto_2330 ?auto_2334 ) ) ( OBJ-AT ?auto_2324 ?auto_2325 ) ( OBJ-AT ?auto_2326 ?auto_2325 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2327 ?auto_2325 )
      ( DELIVER-3PKG-VERIFY ?auto_2324 ?auto_2326 ?auto_2327 ?auto_2325 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2339 - OBJ
      ?auto_2346 - OBJ
      ?auto_2342 - OBJ
      ?auto_2340 - LOCATION
    )
    :vars
    (
      ?auto_2347 - OBJ
      ?auto_2344 - LOCATION
      ?auto_2349 - CITY
      ?auto_2348 - TRUCK
      ?auto_2350 - LOCATION
      ?auto_2343 - CITY
      ?auto_2353 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2346 ?auto_2339 ) ( GREATER-THAN ?auto_2342 ?auto_2339 ) ( GREATER-THAN ?auto_2342 ?auto_2346 ) ( GREATER-THAN ?auto_2346 ?auto_2347 ) ( GREATER-THAN ?auto_2342 ?auto_2347 ) ( IN-CITY ?auto_2344 ?auto_2349 ) ( IN-CITY ?auto_2340 ?auto_2349 ) ( not ( = ?auto_2340 ?auto_2344 ) ) ( OBJ-AT ?auto_2342 ?auto_2344 ) ( TRUCK-AT ?auto_2348 ?auto_2350 ) ( IN-CITY ?auto_2350 ?auto_2343 ) ( IN-CITY ?auto_2344 ?auto_2343 ) ( not ( = ?auto_2344 ?auto_2350 ) ) ( OBJ-AT ?auto_2347 ?auto_2340 ) ( TRUCK-AT ?auto_2353 ?auto_2340 ) ( IN-TRUCK ?auto_2346 ?auto_2353 ) ( OBJ-AT ?auto_2339 ?auto_2340 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2346 ?auto_2340 )
      ( DELIVER-3PKG ?auto_2347 ?auto_2346 ?auto_2342 ?auto_2340 )
      ( DELIVER-3PKG-VERIFY ?auto_2339 ?auto_2346 ?auto_2342 ?auto_2340 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2359 - OBJ
      ?auto_2361 - OBJ
      ?auto_2362 - OBJ
      ?auto_2360 - LOCATION
    )
    :vars
    (
      ?auto_2373 - OBJ
      ?auto_2369 - OBJ
      ?auto_2370 - LOCATION
      ?auto_2364 - CITY
      ?auto_2365 - CITY
      ?auto_2363 - TRUCK
      ?auto_2375 - LOCATION
      ?auto_2376 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2361 ?auto_2359 ) ( GREATER-THAN ?auto_2362 ?auto_2359 ) ( GREATER-THAN ?auto_2362 ?auto_2361 ) ( GREATER-THAN ?auto_2361 ?auto_2373 ) ( GREATER-THAN ?auto_2362 ?auto_2373 ) ( GREATER-THAN ?auto_2361 ?auto_2369 ) ( GREATER-THAN ?auto_2362 ?auto_2369 ) ( IN-CITY ?auto_2370 ?auto_2364 ) ( IN-CITY ?auto_2360 ?auto_2364 ) ( not ( = ?auto_2360 ?auto_2370 ) ) ( OBJ-AT ?auto_2362 ?auto_2370 ) ( IN-CITY ?auto_2360 ?auto_2365 ) ( IN-CITY ?auto_2370 ?auto_2365 ) ( OBJ-AT ?auto_2369 ?auto_2360 ) ( IN-TRUCK ?auto_2361 ?auto_2363 ) ( OBJ-AT ?auto_2373 ?auto_2360 ) ( TRUCK-AT ?auto_2363 ?auto_2375 ) ( IN-CITY ?auto_2375 ?auto_2376 ) ( IN-CITY ?auto_2360 ?auto_2376 ) ( not ( = ?auto_2360 ?auto_2375 ) ) ( OBJ-AT ?auto_2359 ?auto_2360 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2363 ?auto_2375 ?auto_2360 ?auto_2376 )
      ( DELIVER-3PKG ?auto_2373 ?auto_2361 ?auto_2362 ?auto_2360 )
      ( DELIVER-3PKG-VERIFY ?auto_2359 ?auto_2361 ?auto_2362 ?auto_2360 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2382 - OBJ
      ?auto_2384 - OBJ
      ?auto_2385 - OBJ
      ?auto_2383 - LOCATION
    )
    :vars
    (
      ?auto_2394 - OBJ
      ?auto_2397 - OBJ
      ?auto_2389 - OBJ
      ?auto_2392 - LOCATION
      ?auto_2387 - CITY
      ?auto_2390 - CITY
      ?auto_2395 - TRUCK
      ?auto_2396 - LOCATION
      ?auto_2393 - CITY
      ?auto_2399 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2384 ?auto_2382 ) ( GREATER-THAN ?auto_2385 ?auto_2382 ) ( GREATER-THAN ?auto_2385 ?auto_2384 ) ( GREATER-THAN ?auto_2384 ?auto_2394 ) ( GREATER-THAN ?auto_2385 ?auto_2394 ) ( GREATER-THAN ?auto_2384 ?auto_2397 ) ( GREATER-THAN ?auto_2385 ?auto_2397 ) ( GREATER-THAN ?auto_2384 ?auto_2389 ) ( GREATER-THAN ?auto_2385 ?auto_2389 ) ( IN-CITY ?auto_2392 ?auto_2387 ) ( IN-CITY ?auto_2383 ?auto_2387 ) ( not ( = ?auto_2383 ?auto_2392 ) ) ( OBJ-AT ?auto_2385 ?auto_2392 ) ( IN-CITY ?auto_2383 ?auto_2390 ) ( IN-CITY ?auto_2392 ?auto_2390 ) ( OBJ-AT ?auto_2389 ?auto_2383 ) ( OBJ-AT ?auto_2397 ?auto_2383 ) ( TRUCK-AT ?auto_2395 ?auto_2396 ) ( IN-CITY ?auto_2396 ?auto_2393 ) ( IN-CITY ?auto_2383 ?auto_2393 ) ( not ( = ?auto_2383 ?auto_2396 ) ) ( OBJ-AT ?auto_2394 ?auto_2383 ) ( TRUCK-AT ?auto_2395 ?auto_2399 ) ( OBJ-AT ?auto_2384 ?auto_2399 ) ( OBJ-AT ?auto_2382 ?auto_2383 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2384 ?auto_2395 ?auto_2399 )
      ( DELIVER-3PKG ?auto_2394 ?auto_2384 ?auto_2385 ?auto_2383 )
      ( DELIVER-3PKG-VERIFY ?auto_2382 ?auto_2384 ?auto_2385 ?auto_2383 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2405 - OBJ
      ?auto_2407 - OBJ
      ?auto_2408 - OBJ
      ?auto_2406 - LOCATION
    )
    :vars
    (
      ?auto_2422 - OBJ
      ?auto_2410 - OBJ
      ?auto_2419 - OBJ
      ?auto_2412 - OBJ
      ?auto_2417 - LOCATION
      ?auto_2413 - CITY
      ?auto_2411 - CITY
      ?auto_2421 - LOCATION
      ?auto_2415 - CITY
      ?auto_2409 - TRUCK
      ?auto_2424 - LOCATION
      ?auto_2425 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2407 ?auto_2405 ) ( GREATER-THAN ?auto_2408 ?auto_2405 ) ( GREATER-THAN ?auto_2408 ?auto_2407 ) ( GREATER-THAN ?auto_2407 ?auto_2422 ) ( GREATER-THAN ?auto_2408 ?auto_2422 ) ( GREATER-THAN ?auto_2407 ?auto_2410 ) ( GREATER-THAN ?auto_2408 ?auto_2410 ) ( GREATER-THAN ?auto_2407 ?auto_2419 ) ( GREATER-THAN ?auto_2408 ?auto_2419 ) ( GREATER-THAN ?auto_2407 ?auto_2412 ) ( GREATER-THAN ?auto_2408 ?auto_2412 ) ( IN-CITY ?auto_2417 ?auto_2413 ) ( IN-CITY ?auto_2406 ?auto_2413 ) ( not ( = ?auto_2406 ?auto_2417 ) ) ( OBJ-AT ?auto_2408 ?auto_2417 ) ( IN-CITY ?auto_2406 ?auto_2411 ) ( IN-CITY ?auto_2417 ?auto_2411 ) ( OBJ-AT ?auto_2412 ?auto_2406 ) ( OBJ-AT ?auto_2419 ?auto_2406 ) ( IN-CITY ?auto_2421 ?auto_2415 ) ( IN-CITY ?auto_2406 ?auto_2415 ) ( not ( = ?auto_2406 ?auto_2421 ) ) ( OBJ-AT ?auto_2410 ?auto_2406 ) ( OBJ-AT ?auto_2407 ?auto_2421 ) ( OBJ-AT ?auto_2422 ?auto_2406 ) ( TRUCK-AT ?auto_2409 ?auto_2424 ) ( IN-CITY ?auto_2424 ?auto_2425 ) ( IN-CITY ?auto_2421 ?auto_2425 ) ( not ( = ?auto_2421 ?auto_2424 ) ) ( OBJ-AT ?auto_2405 ?auto_2406 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2409 ?auto_2424 ?auto_2421 ?auto_2425 )
      ( DELIVER-3PKG ?auto_2422 ?auto_2407 ?auto_2408 ?auto_2406 )
      ( DELIVER-3PKG-VERIFY ?auto_2405 ?auto_2407 ?auto_2408 ?auto_2406 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2446 - OBJ
      ?auto_2433 - OBJ
      ?auto_2434 - OBJ
      ?auto_2432 - LOCATION
    )
    :vars
    (
      ?auto_2444 - LOCATION
      ?auto_2449 - CITY
      ?auto_2441 - CITY
      ?auto_2448 - LOCATION
      ?auto_2440 - CITY
      ?auto_2442 - TRUCK
      ?auto_2436 - LOCATION
      ?auto_2445 - CITY
      ?auto_2451 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2433 ?auto_2446 ) ( GREATER-THAN ?auto_2434 ?auto_2446 ) ( GREATER-THAN ?auto_2434 ?auto_2433 ) ( IN-CITY ?auto_2444 ?auto_2449 ) ( IN-CITY ?auto_2432 ?auto_2449 ) ( not ( = ?auto_2432 ?auto_2444 ) ) ( OBJ-AT ?auto_2434 ?auto_2444 ) ( IN-CITY ?auto_2432 ?auto_2441 ) ( IN-CITY ?auto_2444 ?auto_2441 ) ( IN-CITY ?auto_2448 ?auto_2440 ) ( IN-CITY ?auto_2432 ?auto_2440 ) ( not ( = ?auto_2432 ?auto_2448 ) ) ( OBJ-AT ?auto_2433 ?auto_2448 ) ( TRUCK-AT ?auto_2442 ?auto_2436 ) ( IN-CITY ?auto_2436 ?auto_2445 ) ( IN-CITY ?auto_2448 ?auto_2445 ) ( not ( = ?auto_2448 ?auto_2436 ) ) ( TRUCK-AT ?auto_2451 ?auto_2432 ) ( IN-TRUCK ?auto_2446 ?auto_2451 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2446 ?auto_2432 )
      ( DELIVER-3PKG ?auto_2446 ?auto_2433 ?auto_2434 ?auto_2432 )
      ( DELIVER-3PKG-VERIFY ?auto_2446 ?auto_2433 ?auto_2434 ?auto_2432 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2458 - OBJ
      ?auto_2460 - OBJ
      ?auto_2461 - OBJ
      ?auto_2459 - LOCATION
    )
    :vars
    (
      ?auto_2470 - LOCATION
      ?auto_2465 - CITY
      ?auto_2464 - CITY
      ?auto_2462 - LOCATION
      ?auto_2473 - CITY
      ?auto_2463 - CITY
      ?auto_2466 - TRUCK
      ?auto_2476 - LOCATION
      ?auto_2477 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2460 ?auto_2458 ) ( GREATER-THAN ?auto_2461 ?auto_2458 ) ( GREATER-THAN ?auto_2461 ?auto_2460 ) ( IN-CITY ?auto_2470 ?auto_2465 ) ( IN-CITY ?auto_2459 ?auto_2465 ) ( not ( = ?auto_2459 ?auto_2470 ) ) ( OBJ-AT ?auto_2461 ?auto_2470 ) ( IN-CITY ?auto_2459 ?auto_2464 ) ( IN-CITY ?auto_2470 ?auto_2464 ) ( IN-CITY ?auto_2462 ?auto_2473 ) ( IN-CITY ?auto_2459 ?auto_2473 ) ( not ( = ?auto_2459 ?auto_2462 ) ) ( OBJ-AT ?auto_2460 ?auto_2462 ) ( IN-CITY ?auto_2459 ?auto_2463 ) ( IN-CITY ?auto_2462 ?auto_2463 ) ( IN-TRUCK ?auto_2458 ?auto_2466 ) ( TRUCK-AT ?auto_2466 ?auto_2476 ) ( IN-CITY ?auto_2476 ?auto_2477 ) ( IN-CITY ?auto_2459 ?auto_2477 ) ( not ( = ?auto_2459 ?auto_2476 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2466 ?auto_2476 ?auto_2459 ?auto_2477 )
      ( DELIVER-3PKG ?auto_2458 ?auto_2460 ?auto_2461 ?auto_2459 )
      ( DELIVER-3PKG-VERIFY ?auto_2458 ?auto_2460 ?auto_2461 ?auto_2459 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2483 - OBJ
      ?auto_2485 - OBJ
      ?auto_2486 - OBJ
      ?auto_2484 - LOCATION
    )
    :vars
    (
      ?auto_2490 - LOCATION
      ?auto_2499 - CITY
      ?auto_2492 - CITY
      ?auto_2487 - LOCATION
      ?auto_2498 - CITY
      ?auto_2495 - CITY
      ?auto_2494 - TRUCK
      ?auto_2489 - LOCATION
      ?auto_2491 - CITY
      ?auto_2501 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2485 ?auto_2483 ) ( GREATER-THAN ?auto_2486 ?auto_2483 ) ( GREATER-THAN ?auto_2486 ?auto_2485 ) ( IN-CITY ?auto_2490 ?auto_2499 ) ( IN-CITY ?auto_2484 ?auto_2499 ) ( not ( = ?auto_2484 ?auto_2490 ) ) ( OBJ-AT ?auto_2486 ?auto_2490 ) ( IN-CITY ?auto_2484 ?auto_2492 ) ( IN-CITY ?auto_2490 ?auto_2492 ) ( IN-CITY ?auto_2487 ?auto_2498 ) ( IN-CITY ?auto_2484 ?auto_2498 ) ( not ( = ?auto_2484 ?auto_2487 ) ) ( OBJ-AT ?auto_2485 ?auto_2487 ) ( IN-CITY ?auto_2484 ?auto_2495 ) ( IN-CITY ?auto_2487 ?auto_2495 ) ( TRUCK-AT ?auto_2494 ?auto_2489 ) ( IN-CITY ?auto_2489 ?auto_2491 ) ( IN-CITY ?auto_2484 ?auto_2491 ) ( not ( = ?auto_2484 ?auto_2489 ) ) ( TRUCK-AT ?auto_2494 ?auto_2501 ) ( OBJ-AT ?auto_2483 ?auto_2501 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2483 ?auto_2494 ?auto_2501 )
      ( DELIVER-3PKG ?auto_2483 ?auto_2485 ?auto_2486 ?auto_2484 )
      ( DELIVER-3PKG-VERIFY ?auto_2483 ?auto_2485 ?auto_2486 ?auto_2484 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2507 - OBJ
      ?auto_2509 - OBJ
      ?auto_2510 - OBJ
      ?auto_2508 - LOCATION
    )
    :vars
    (
      ?auto_2516 - LOCATION
      ?auto_2520 - CITY
      ?auto_2523 - CITY
      ?auto_2522 - LOCATION
      ?auto_2511 - CITY
      ?auto_2524 - CITY
      ?auto_2513 - LOCATION
      ?auto_2514 - CITY
      ?auto_2519 - TRUCK
      ?auto_2526 - LOCATION
      ?auto_2527 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2509 ?auto_2507 ) ( GREATER-THAN ?auto_2510 ?auto_2507 ) ( GREATER-THAN ?auto_2510 ?auto_2509 ) ( IN-CITY ?auto_2516 ?auto_2520 ) ( IN-CITY ?auto_2508 ?auto_2520 ) ( not ( = ?auto_2508 ?auto_2516 ) ) ( OBJ-AT ?auto_2510 ?auto_2516 ) ( IN-CITY ?auto_2508 ?auto_2523 ) ( IN-CITY ?auto_2516 ?auto_2523 ) ( IN-CITY ?auto_2522 ?auto_2511 ) ( IN-CITY ?auto_2508 ?auto_2511 ) ( not ( = ?auto_2508 ?auto_2522 ) ) ( OBJ-AT ?auto_2509 ?auto_2522 ) ( IN-CITY ?auto_2508 ?auto_2524 ) ( IN-CITY ?auto_2522 ?auto_2524 ) ( IN-CITY ?auto_2513 ?auto_2514 ) ( IN-CITY ?auto_2508 ?auto_2514 ) ( not ( = ?auto_2508 ?auto_2513 ) ) ( OBJ-AT ?auto_2507 ?auto_2513 ) ( TRUCK-AT ?auto_2519 ?auto_2526 ) ( IN-CITY ?auto_2526 ?auto_2527 ) ( IN-CITY ?auto_2513 ?auto_2527 ) ( not ( = ?auto_2513 ?auto_2526 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2519 ?auto_2526 ?auto_2513 ?auto_2527 )
      ( DELIVER-3PKG ?auto_2507 ?auto_2509 ?auto_2510 ?auto_2508 )
      ( DELIVER-3PKG-VERIFY ?auto_2507 ?auto_2509 ?auto_2510 ?auto_2508 ) )
  )

)

