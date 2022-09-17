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
      ?auto_2128 - OBJ
      ?auto_2129 - LOCATION
    )
    :vars
    (
      ?auto_2131 - LOCATION
      ?auto_2132 - CITY
      ?auto_2130 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2131 ?auto_2132 ) ( IN-CITY ?auto_2129 ?auto_2132 ) ( not ( = ?auto_2129 ?auto_2131 ) ) ( OBJ-AT ?auto_2128 ?auto_2131 ) ( TRUCK-AT ?auto_2130 ?auto_2129 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2130 ?auto_2129 ?auto_2131 ?auto_2132 )
      ( !LOAD-TRUCK ?auto_2128 ?auto_2130 ?auto_2131 )
      ( !DRIVE-TRUCK ?auto_2130 ?auto_2131 ?auto_2129 ?auto_2132 )
      ( !UNLOAD-TRUCK ?auto_2128 ?auto_2130 ?auto_2129 )
      ( DELIVER-1PKG-VERIFY ?auto_2128 ?auto_2129 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2143 - OBJ
      ?auto_2145 - OBJ
      ?auto_2144 - LOCATION
    )
    :vars
    (
      ?auto_2147 - LOCATION
      ?auto_2148 - CITY
      ?auto_2149 - LOCATION
      ?auto_2146 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2145 ?auto_2143 ) ( IN-CITY ?auto_2147 ?auto_2148 ) ( IN-CITY ?auto_2144 ?auto_2148 ) ( not ( = ?auto_2144 ?auto_2147 ) ) ( OBJ-AT ?auto_2145 ?auto_2147 ) ( IN-CITY ?auto_2149 ?auto_2148 ) ( not ( = ?auto_2144 ?auto_2149 ) ) ( OBJ-AT ?auto_2143 ?auto_2149 ) ( TRUCK-AT ?auto_2146 ?auto_2144 ) ( not ( = ?auto_2143 ?auto_2145 ) ) ( not ( = ?auto_2147 ?auto_2149 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2143 ?auto_2144 )
      ( DELIVER-1PKG ?auto_2145 ?auto_2144 )
      ( DELIVER-2PKG-VERIFY ?auto_2143 ?auto_2145 ?auto_2144 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2161 - OBJ
      ?auto_2163 - OBJ
      ?auto_2164 - OBJ
      ?auto_2162 - LOCATION
    )
    :vars
    (
      ?auto_2167 - LOCATION
      ?auto_2166 - CITY
      ?auto_2169 - LOCATION
      ?auto_2168 - LOCATION
      ?auto_2165 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2163 ?auto_2161 ) ( GREATER-THAN ?auto_2164 ?auto_2161 ) ( GREATER-THAN ?auto_2164 ?auto_2163 ) ( IN-CITY ?auto_2167 ?auto_2166 ) ( IN-CITY ?auto_2162 ?auto_2166 ) ( not ( = ?auto_2162 ?auto_2167 ) ) ( OBJ-AT ?auto_2164 ?auto_2167 ) ( IN-CITY ?auto_2169 ?auto_2166 ) ( not ( = ?auto_2162 ?auto_2169 ) ) ( OBJ-AT ?auto_2163 ?auto_2169 ) ( IN-CITY ?auto_2168 ?auto_2166 ) ( not ( = ?auto_2162 ?auto_2168 ) ) ( OBJ-AT ?auto_2161 ?auto_2168 ) ( TRUCK-AT ?auto_2165 ?auto_2162 ) ( not ( = ?auto_2161 ?auto_2163 ) ) ( not ( = ?auto_2169 ?auto_2168 ) ) ( not ( = ?auto_2161 ?auto_2164 ) ) ( not ( = ?auto_2163 ?auto_2164 ) ) ( not ( = ?auto_2167 ?auto_2169 ) ) ( not ( = ?auto_2167 ?auto_2168 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2161 ?auto_2163 ?auto_2162 )
      ( DELIVER-1PKG ?auto_2164 ?auto_2162 )
      ( DELIVER-3PKG-VERIFY ?auto_2161 ?auto_2163 ?auto_2164 ?auto_2162 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2182 - OBJ
      ?auto_2184 - OBJ
      ?auto_2185 - OBJ
      ?auto_2186 - OBJ
      ?auto_2183 - LOCATION
    )
    :vars
    (
      ?auto_2189 - LOCATION
      ?auto_2187 - CITY
      ?auto_2191 - LOCATION
      ?auto_2190 - LOCATION
      ?auto_2192 - LOCATION
      ?auto_2188 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2184 ?auto_2182 ) ( GREATER-THAN ?auto_2185 ?auto_2182 ) ( GREATER-THAN ?auto_2185 ?auto_2184 ) ( GREATER-THAN ?auto_2186 ?auto_2182 ) ( GREATER-THAN ?auto_2186 ?auto_2184 ) ( GREATER-THAN ?auto_2186 ?auto_2185 ) ( IN-CITY ?auto_2189 ?auto_2187 ) ( IN-CITY ?auto_2183 ?auto_2187 ) ( not ( = ?auto_2183 ?auto_2189 ) ) ( OBJ-AT ?auto_2186 ?auto_2189 ) ( IN-CITY ?auto_2191 ?auto_2187 ) ( not ( = ?auto_2183 ?auto_2191 ) ) ( OBJ-AT ?auto_2185 ?auto_2191 ) ( IN-CITY ?auto_2190 ?auto_2187 ) ( not ( = ?auto_2183 ?auto_2190 ) ) ( OBJ-AT ?auto_2184 ?auto_2190 ) ( IN-CITY ?auto_2192 ?auto_2187 ) ( not ( = ?auto_2183 ?auto_2192 ) ) ( OBJ-AT ?auto_2182 ?auto_2192 ) ( TRUCK-AT ?auto_2188 ?auto_2183 ) ( not ( = ?auto_2182 ?auto_2184 ) ) ( not ( = ?auto_2190 ?auto_2192 ) ) ( not ( = ?auto_2182 ?auto_2185 ) ) ( not ( = ?auto_2184 ?auto_2185 ) ) ( not ( = ?auto_2191 ?auto_2190 ) ) ( not ( = ?auto_2191 ?auto_2192 ) ) ( not ( = ?auto_2182 ?auto_2186 ) ) ( not ( = ?auto_2184 ?auto_2186 ) ) ( not ( = ?auto_2185 ?auto_2186 ) ) ( not ( = ?auto_2189 ?auto_2191 ) ) ( not ( = ?auto_2189 ?auto_2190 ) ) ( not ( = ?auto_2189 ?auto_2192 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2182 ?auto_2184 ?auto_2185 ?auto_2183 )
      ( DELIVER-1PKG ?auto_2186 ?auto_2183 )
      ( DELIVER-4PKG-VERIFY ?auto_2182 ?auto_2184 ?auto_2185 ?auto_2186 ?auto_2183 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2206 - OBJ
      ?auto_2208 - OBJ
      ?auto_2209 - OBJ
      ?auto_2210 - OBJ
      ?auto_2211 - OBJ
      ?auto_2207 - LOCATION
    )
    :vars
    (
      ?auto_2213 - LOCATION
      ?auto_2212 - CITY
      ?auto_2217 - LOCATION
      ?auto_2218 - LOCATION
      ?auto_2215 - LOCATION
      ?auto_2216 - LOCATION
      ?auto_2214 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2208 ?auto_2206 ) ( GREATER-THAN ?auto_2209 ?auto_2206 ) ( GREATER-THAN ?auto_2209 ?auto_2208 ) ( GREATER-THAN ?auto_2210 ?auto_2206 ) ( GREATER-THAN ?auto_2210 ?auto_2208 ) ( GREATER-THAN ?auto_2210 ?auto_2209 ) ( GREATER-THAN ?auto_2211 ?auto_2206 ) ( GREATER-THAN ?auto_2211 ?auto_2208 ) ( GREATER-THAN ?auto_2211 ?auto_2209 ) ( GREATER-THAN ?auto_2211 ?auto_2210 ) ( IN-CITY ?auto_2213 ?auto_2212 ) ( IN-CITY ?auto_2207 ?auto_2212 ) ( not ( = ?auto_2207 ?auto_2213 ) ) ( OBJ-AT ?auto_2211 ?auto_2213 ) ( IN-CITY ?auto_2217 ?auto_2212 ) ( not ( = ?auto_2207 ?auto_2217 ) ) ( OBJ-AT ?auto_2210 ?auto_2217 ) ( IN-CITY ?auto_2218 ?auto_2212 ) ( not ( = ?auto_2207 ?auto_2218 ) ) ( OBJ-AT ?auto_2209 ?auto_2218 ) ( IN-CITY ?auto_2215 ?auto_2212 ) ( not ( = ?auto_2207 ?auto_2215 ) ) ( OBJ-AT ?auto_2208 ?auto_2215 ) ( IN-CITY ?auto_2216 ?auto_2212 ) ( not ( = ?auto_2207 ?auto_2216 ) ) ( OBJ-AT ?auto_2206 ?auto_2216 ) ( TRUCK-AT ?auto_2214 ?auto_2207 ) ( not ( = ?auto_2206 ?auto_2208 ) ) ( not ( = ?auto_2215 ?auto_2216 ) ) ( not ( = ?auto_2206 ?auto_2209 ) ) ( not ( = ?auto_2208 ?auto_2209 ) ) ( not ( = ?auto_2218 ?auto_2215 ) ) ( not ( = ?auto_2218 ?auto_2216 ) ) ( not ( = ?auto_2206 ?auto_2210 ) ) ( not ( = ?auto_2208 ?auto_2210 ) ) ( not ( = ?auto_2209 ?auto_2210 ) ) ( not ( = ?auto_2217 ?auto_2218 ) ) ( not ( = ?auto_2217 ?auto_2215 ) ) ( not ( = ?auto_2217 ?auto_2216 ) ) ( not ( = ?auto_2206 ?auto_2211 ) ) ( not ( = ?auto_2208 ?auto_2211 ) ) ( not ( = ?auto_2209 ?auto_2211 ) ) ( not ( = ?auto_2210 ?auto_2211 ) ) ( not ( = ?auto_2213 ?auto_2217 ) ) ( not ( = ?auto_2213 ?auto_2218 ) ) ( not ( = ?auto_2213 ?auto_2215 ) ) ( not ( = ?auto_2213 ?auto_2216 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2206 ?auto_2208 ?auto_2209 ?auto_2210 ?auto_2207 )
      ( DELIVER-1PKG ?auto_2211 ?auto_2207 )
      ( DELIVER-5PKG-VERIFY ?auto_2206 ?auto_2208 ?auto_2209 ?auto_2210 ?auto_2211 ?auto_2207 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2233 - OBJ
      ?auto_2235 - OBJ
      ?auto_2236 - OBJ
      ?auto_2237 - OBJ
      ?auto_2238 - OBJ
      ?auto_2239 - OBJ
      ?auto_2234 - LOCATION
    )
    :vars
    (
      ?auto_2240 - LOCATION
      ?auto_2242 - CITY
      ?auto_2245 - LOCATION
      ?auto_2243 - LOCATION
      ?auto_2244 - LOCATION
      ?auto_2246 - LOCATION
      ?auto_2247 - LOCATION
      ?auto_2241 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2235 ?auto_2233 ) ( GREATER-THAN ?auto_2236 ?auto_2233 ) ( GREATER-THAN ?auto_2236 ?auto_2235 ) ( GREATER-THAN ?auto_2237 ?auto_2233 ) ( GREATER-THAN ?auto_2237 ?auto_2235 ) ( GREATER-THAN ?auto_2237 ?auto_2236 ) ( GREATER-THAN ?auto_2238 ?auto_2233 ) ( GREATER-THAN ?auto_2238 ?auto_2235 ) ( GREATER-THAN ?auto_2238 ?auto_2236 ) ( GREATER-THAN ?auto_2238 ?auto_2237 ) ( GREATER-THAN ?auto_2239 ?auto_2233 ) ( GREATER-THAN ?auto_2239 ?auto_2235 ) ( GREATER-THAN ?auto_2239 ?auto_2236 ) ( GREATER-THAN ?auto_2239 ?auto_2237 ) ( GREATER-THAN ?auto_2239 ?auto_2238 ) ( IN-CITY ?auto_2240 ?auto_2242 ) ( IN-CITY ?auto_2234 ?auto_2242 ) ( not ( = ?auto_2234 ?auto_2240 ) ) ( OBJ-AT ?auto_2239 ?auto_2240 ) ( IN-CITY ?auto_2245 ?auto_2242 ) ( not ( = ?auto_2234 ?auto_2245 ) ) ( OBJ-AT ?auto_2238 ?auto_2245 ) ( IN-CITY ?auto_2243 ?auto_2242 ) ( not ( = ?auto_2234 ?auto_2243 ) ) ( OBJ-AT ?auto_2237 ?auto_2243 ) ( IN-CITY ?auto_2244 ?auto_2242 ) ( not ( = ?auto_2234 ?auto_2244 ) ) ( OBJ-AT ?auto_2236 ?auto_2244 ) ( IN-CITY ?auto_2246 ?auto_2242 ) ( not ( = ?auto_2234 ?auto_2246 ) ) ( OBJ-AT ?auto_2235 ?auto_2246 ) ( IN-CITY ?auto_2247 ?auto_2242 ) ( not ( = ?auto_2234 ?auto_2247 ) ) ( OBJ-AT ?auto_2233 ?auto_2247 ) ( TRUCK-AT ?auto_2241 ?auto_2234 ) ( not ( = ?auto_2233 ?auto_2235 ) ) ( not ( = ?auto_2246 ?auto_2247 ) ) ( not ( = ?auto_2233 ?auto_2236 ) ) ( not ( = ?auto_2235 ?auto_2236 ) ) ( not ( = ?auto_2244 ?auto_2246 ) ) ( not ( = ?auto_2244 ?auto_2247 ) ) ( not ( = ?auto_2233 ?auto_2237 ) ) ( not ( = ?auto_2235 ?auto_2237 ) ) ( not ( = ?auto_2236 ?auto_2237 ) ) ( not ( = ?auto_2243 ?auto_2244 ) ) ( not ( = ?auto_2243 ?auto_2246 ) ) ( not ( = ?auto_2243 ?auto_2247 ) ) ( not ( = ?auto_2233 ?auto_2238 ) ) ( not ( = ?auto_2235 ?auto_2238 ) ) ( not ( = ?auto_2236 ?auto_2238 ) ) ( not ( = ?auto_2237 ?auto_2238 ) ) ( not ( = ?auto_2245 ?auto_2243 ) ) ( not ( = ?auto_2245 ?auto_2244 ) ) ( not ( = ?auto_2245 ?auto_2246 ) ) ( not ( = ?auto_2245 ?auto_2247 ) ) ( not ( = ?auto_2233 ?auto_2239 ) ) ( not ( = ?auto_2235 ?auto_2239 ) ) ( not ( = ?auto_2236 ?auto_2239 ) ) ( not ( = ?auto_2237 ?auto_2239 ) ) ( not ( = ?auto_2238 ?auto_2239 ) ) ( not ( = ?auto_2240 ?auto_2245 ) ) ( not ( = ?auto_2240 ?auto_2243 ) ) ( not ( = ?auto_2240 ?auto_2244 ) ) ( not ( = ?auto_2240 ?auto_2246 ) ) ( not ( = ?auto_2240 ?auto_2247 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2233 ?auto_2235 ?auto_2236 ?auto_2237 ?auto_2238 ?auto_2234 )
      ( DELIVER-1PKG ?auto_2239 ?auto_2234 )
      ( DELIVER-6PKG-VERIFY ?auto_2233 ?auto_2235 ?auto_2236 ?auto_2237 ?auto_2238 ?auto_2239 ?auto_2234 ) )
  )

  ( :method DELIVER-7PKG
    :parameters
    (
      ?auto_2263 - OBJ
      ?auto_2265 - OBJ
      ?auto_2266 - OBJ
      ?auto_2267 - OBJ
      ?auto_2268 - OBJ
      ?auto_2269 - OBJ
      ?auto_2270 - OBJ
      ?auto_2264 - LOCATION
    )
    :vars
    (
      ?auto_2272 - LOCATION
      ?auto_2271 - CITY
      ?auto_2279 - LOCATION
      ?auto_2274 - LOCATION
      ?auto_2275 - LOCATION
      ?auto_2277 - LOCATION
      ?auto_2276 - LOCATION
      ?auto_2278 - LOCATION
      ?auto_2273 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2265 ?auto_2263 ) ( GREATER-THAN ?auto_2266 ?auto_2263 ) ( GREATER-THAN ?auto_2266 ?auto_2265 ) ( GREATER-THAN ?auto_2267 ?auto_2263 ) ( GREATER-THAN ?auto_2267 ?auto_2265 ) ( GREATER-THAN ?auto_2267 ?auto_2266 ) ( GREATER-THAN ?auto_2268 ?auto_2263 ) ( GREATER-THAN ?auto_2268 ?auto_2265 ) ( GREATER-THAN ?auto_2268 ?auto_2266 ) ( GREATER-THAN ?auto_2268 ?auto_2267 ) ( GREATER-THAN ?auto_2269 ?auto_2263 ) ( GREATER-THAN ?auto_2269 ?auto_2265 ) ( GREATER-THAN ?auto_2269 ?auto_2266 ) ( GREATER-THAN ?auto_2269 ?auto_2267 ) ( GREATER-THAN ?auto_2269 ?auto_2268 ) ( GREATER-THAN ?auto_2270 ?auto_2263 ) ( GREATER-THAN ?auto_2270 ?auto_2265 ) ( GREATER-THAN ?auto_2270 ?auto_2266 ) ( GREATER-THAN ?auto_2270 ?auto_2267 ) ( GREATER-THAN ?auto_2270 ?auto_2268 ) ( GREATER-THAN ?auto_2270 ?auto_2269 ) ( IN-CITY ?auto_2272 ?auto_2271 ) ( IN-CITY ?auto_2264 ?auto_2271 ) ( not ( = ?auto_2264 ?auto_2272 ) ) ( OBJ-AT ?auto_2270 ?auto_2272 ) ( IN-CITY ?auto_2279 ?auto_2271 ) ( not ( = ?auto_2264 ?auto_2279 ) ) ( OBJ-AT ?auto_2269 ?auto_2279 ) ( IN-CITY ?auto_2274 ?auto_2271 ) ( not ( = ?auto_2264 ?auto_2274 ) ) ( OBJ-AT ?auto_2268 ?auto_2274 ) ( IN-CITY ?auto_2275 ?auto_2271 ) ( not ( = ?auto_2264 ?auto_2275 ) ) ( OBJ-AT ?auto_2267 ?auto_2275 ) ( IN-CITY ?auto_2277 ?auto_2271 ) ( not ( = ?auto_2264 ?auto_2277 ) ) ( OBJ-AT ?auto_2266 ?auto_2277 ) ( IN-CITY ?auto_2276 ?auto_2271 ) ( not ( = ?auto_2264 ?auto_2276 ) ) ( OBJ-AT ?auto_2265 ?auto_2276 ) ( IN-CITY ?auto_2278 ?auto_2271 ) ( not ( = ?auto_2264 ?auto_2278 ) ) ( OBJ-AT ?auto_2263 ?auto_2278 ) ( TRUCK-AT ?auto_2273 ?auto_2264 ) ( not ( = ?auto_2263 ?auto_2265 ) ) ( not ( = ?auto_2276 ?auto_2278 ) ) ( not ( = ?auto_2263 ?auto_2266 ) ) ( not ( = ?auto_2265 ?auto_2266 ) ) ( not ( = ?auto_2277 ?auto_2276 ) ) ( not ( = ?auto_2277 ?auto_2278 ) ) ( not ( = ?auto_2263 ?auto_2267 ) ) ( not ( = ?auto_2265 ?auto_2267 ) ) ( not ( = ?auto_2266 ?auto_2267 ) ) ( not ( = ?auto_2275 ?auto_2277 ) ) ( not ( = ?auto_2275 ?auto_2276 ) ) ( not ( = ?auto_2275 ?auto_2278 ) ) ( not ( = ?auto_2263 ?auto_2268 ) ) ( not ( = ?auto_2265 ?auto_2268 ) ) ( not ( = ?auto_2266 ?auto_2268 ) ) ( not ( = ?auto_2267 ?auto_2268 ) ) ( not ( = ?auto_2274 ?auto_2275 ) ) ( not ( = ?auto_2274 ?auto_2277 ) ) ( not ( = ?auto_2274 ?auto_2276 ) ) ( not ( = ?auto_2274 ?auto_2278 ) ) ( not ( = ?auto_2263 ?auto_2269 ) ) ( not ( = ?auto_2265 ?auto_2269 ) ) ( not ( = ?auto_2266 ?auto_2269 ) ) ( not ( = ?auto_2267 ?auto_2269 ) ) ( not ( = ?auto_2268 ?auto_2269 ) ) ( not ( = ?auto_2279 ?auto_2274 ) ) ( not ( = ?auto_2279 ?auto_2275 ) ) ( not ( = ?auto_2279 ?auto_2277 ) ) ( not ( = ?auto_2279 ?auto_2276 ) ) ( not ( = ?auto_2279 ?auto_2278 ) ) ( not ( = ?auto_2263 ?auto_2270 ) ) ( not ( = ?auto_2265 ?auto_2270 ) ) ( not ( = ?auto_2266 ?auto_2270 ) ) ( not ( = ?auto_2267 ?auto_2270 ) ) ( not ( = ?auto_2268 ?auto_2270 ) ) ( not ( = ?auto_2269 ?auto_2270 ) ) ( not ( = ?auto_2272 ?auto_2279 ) ) ( not ( = ?auto_2272 ?auto_2274 ) ) ( not ( = ?auto_2272 ?auto_2275 ) ) ( not ( = ?auto_2272 ?auto_2277 ) ) ( not ( = ?auto_2272 ?auto_2276 ) ) ( not ( = ?auto_2272 ?auto_2278 ) ) )
    :subtasks
    ( ( DELIVER-6PKG ?auto_2263 ?auto_2265 ?auto_2266 ?auto_2267 ?auto_2268 ?auto_2269 ?auto_2264 )
      ( DELIVER-1PKG ?auto_2270 ?auto_2264 )
      ( DELIVER-7PKG-VERIFY ?auto_2263 ?auto_2265 ?auto_2266 ?auto_2267 ?auto_2268 ?auto_2269 ?auto_2270 ?auto_2264 ) )
  )

)

