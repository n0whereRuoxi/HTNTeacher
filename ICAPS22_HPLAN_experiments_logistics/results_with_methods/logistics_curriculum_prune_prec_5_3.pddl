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
      ?auto_2150 - OBJ
      ?auto_2151 - LOCATION
    )
    :vars
    (
      ?auto_2160 - LOCATION
      ?auto_2157 - CITY
      ?auto_2152 - TRUCK
      ?auto_2163 - LOCATION
      ?auto_2164 - CITY
    )
    :precondition
    ( and ( IN-CITY ?auto_2160 ?auto_2157 ) ( IN-CITY ?auto_2151 ?auto_2157 ) ( not ( = ?auto_2151 ?auto_2160 ) ) ( OBJ-AT ?auto_2150 ?auto_2160 ) ( TRUCK-AT ?auto_2152 ?auto_2163 ) ( IN-CITY ?auto_2163 ?auto_2164 ) ( IN-CITY ?auto_2160 ?auto_2164 ) ( not ( = ?auto_2160 ?auto_2163 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2152 ?auto_2163 ?auto_2160 ?auto_2164 )
      ( !LOAD-TRUCK ?auto_2150 ?auto_2152 ?auto_2160 )
      ( !DRIVE-TRUCK ?auto_2152 ?auto_2160 ?auto_2151 ?auto_2157 )
      ( !UNLOAD-TRUCK ?auto_2150 ?auto_2152 ?auto_2151 )
      ( DELIVER-1PKG-VERIFY ?auto_2150 ?auto_2151 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2187 - OBJ
      ?auto_2189 - OBJ
      ?auto_2195 - LOCATION
    )
    :vars
    (
      ?auto_2190 - LOCATION
      ?auto_2192 - CITY
      ?auto_2191 - CITY
      ?auto_2202 - LOCATION
      ?auto_2198 - CITY
      ?auto_2194 - TRUCK
      ?auto_2201 - LOCATION
      ?auto_2203 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2189 ?auto_2187 ) ( IN-CITY ?auto_2190 ?auto_2192 ) ( IN-CITY ?auto_2195 ?auto_2192 ) ( not ( = ?auto_2195 ?auto_2190 ) ) ( OBJ-AT ?auto_2189 ?auto_2190 ) ( IN-CITY ?auto_2195 ?auto_2191 ) ( IN-CITY ?auto_2190 ?auto_2191 ) ( IN-CITY ?auto_2202 ?auto_2198 ) ( IN-CITY ?auto_2195 ?auto_2198 ) ( not ( = ?auto_2195 ?auto_2202 ) ) ( OBJ-AT ?auto_2187 ?auto_2202 ) ( TRUCK-AT ?auto_2194 ?auto_2201 ) ( IN-CITY ?auto_2201 ?auto_2203 ) ( IN-CITY ?auto_2202 ?auto_2203 ) ( not ( = ?auto_2202 ?auto_2201 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2187 ?auto_2195 )
      ( DELIVER-1PKG ?auto_2189 ?auto_2195 )
      ( DELIVER-2PKG-VERIFY ?auto_2187 ?auto_2189 ?auto_2195 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2226 - OBJ
      ?auto_2228 - OBJ
      ?auto_2229 - OBJ
      ?auto_2236 - LOCATION
    )
    :vars
    (
      ?auto_2234 - LOCATION
      ?auto_2233 - CITY
      ?auto_2231 - CITY
      ?auto_2237 - LOCATION
      ?auto_2238 - CITY
      ?auto_2247 - CITY
      ?auto_2243 - LOCATION
      ?auto_2239 - CITY
      ?auto_2235 - TRUCK
      ?auto_2240 - LOCATION
      ?auto_2242 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2228 ?auto_2226 ) ( GREATER-THAN ?auto_2229 ?auto_2226 ) ( GREATER-THAN ?auto_2229 ?auto_2228 ) ( IN-CITY ?auto_2234 ?auto_2233 ) ( IN-CITY ?auto_2236 ?auto_2233 ) ( not ( = ?auto_2236 ?auto_2234 ) ) ( OBJ-AT ?auto_2229 ?auto_2234 ) ( IN-CITY ?auto_2236 ?auto_2231 ) ( IN-CITY ?auto_2234 ?auto_2231 ) ( IN-CITY ?auto_2237 ?auto_2238 ) ( IN-CITY ?auto_2236 ?auto_2238 ) ( not ( = ?auto_2236 ?auto_2237 ) ) ( OBJ-AT ?auto_2228 ?auto_2237 ) ( IN-CITY ?auto_2236 ?auto_2247 ) ( IN-CITY ?auto_2237 ?auto_2247 ) ( IN-CITY ?auto_2243 ?auto_2239 ) ( IN-CITY ?auto_2236 ?auto_2239 ) ( not ( = ?auto_2236 ?auto_2243 ) ) ( OBJ-AT ?auto_2226 ?auto_2243 ) ( TRUCK-AT ?auto_2235 ?auto_2240 ) ( IN-CITY ?auto_2240 ?auto_2242 ) ( IN-CITY ?auto_2243 ?auto_2242 ) ( not ( = ?auto_2243 ?auto_2240 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2226 ?auto_2228 ?auto_2236 )
      ( DELIVER-1PKG ?auto_2229 ?auto_2236 )
      ( DELIVER-3PKG-VERIFY ?auto_2226 ?auto_2228 ?auto_2229 ?auto_2236 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2271 - OBJ
      ?auto_2273 - OBJ
      ?auto_2274 - OBJ
      ?auto_2275 - OBJ
      ?auto_2282 - LOCATION
    )
    :vars
    (
      ?auto_2279 - LOCATION
      ?auto_2277 - CITY
      ?auto_2276 - CITY
      ?auto_2287 - LOCATION
      ?auto_2295 - CITY
      ?auto_2296 - CITY
      ?auto_2297 - LOCATION
      ?auto_2294 - CITY
      ?auto_2292 - CITY
      ?auto_2286 - LOCATION
      ?auto_2293 - CITY
      ?auto_2281 - TRUCK
      ?auto_2284 - LOCATION
      ?auto_2283 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2273 ?auto_2271 ) ( GREATER-THAN ?auto_2274 ?auto_2271 ) ( GREATER-THAN ?auto_2274 ?auto_2273 ) ( GREATER-THAN ?auto_2275 ?auto_2271 ) ( GREATER-THAN ?auto_2275 ?auto_2273 ) ( GREATER-THAN ?auto_2275 ?auto_2274 ) ( IN-CITY ?auto_2279 ?auto_2277 ) ( IN-CITY ?auto_2282 ?auto_2277 ) ( not ( = ?auto_2282 ?auto_2279 ) ) ( OBJ-AT ?auto_2275 ?auto_2279 ) ( IN-CITY ?auto_2282 ?auto_2276 ) ( IN-CITY ?auto_2279 ?auto_2276 ) ( IN-CITY ?auto_2287 ?auto_2295 ) ( IN-CITY ?auto_2282 ?auto_2295 ) ( not ( = ?auto_2282 ?auto_2287 ) ) ( OBJ-AT ?auto_2274 ?auto_2287 ) ( IN-CITY ?auto_2282 ?auto_2296 ) ( IN-CITY ?auto_2287 ?auto_2296 ) ( IN-CITY ?auto_2297 ?auto_2294 ) ( IN-CITY ?auto_2282 ?auto_2294 ) ( not ( = ?auto_2282 ?auto_2297 ) ) ( OBJ-AT ?auto_2273 ?auto_2297 ) ( IN-CITY ?auto_2282 ?auto_2292 ) ( IN-CITY ?auto_2297 ?auto_2292 ) ( IN-CITY ?auto_2286 ?auto_2293 ) ( IN-CITY ?auto_2282 ?auto_2293 ) ( not ( = ?auto_2282 ?auto_2286 ) ) ( OBJ-AT ?auto_2271 ?auto_2286 ) ( TRUCK-AT ?auto_2281 ?auto_2284 ) ( IN-CITY ?auto_2284 ?auto_2283 ) ( IN-CITY ?auto_2286 ?auto_2283 ) ( not ( = ?auto_2286 ?auto_2284 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2271 ?auto_2273 ?auto_2274 ?auto_2282 )
      ( DELIVER-1PKG ?auto_2275 ?auto_2282 )
      ( DELIVER-4PKG-VERIFY ?auto_2271 ?auto_2273 ?auto_2274 ?auto_2275 ?auto_2282 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2322 - OBJ
      ?auto_2324 - OBJ
      ?auto_2325 - OBJ
      ?auto_2326 - OBJ
      ?auto_2327 - OBJ
      ?auto_2330 - LOCATION
    )
    :vars
    (
      ?auto_2329 - LOCATION
      ?auto_2332 - CITY
      ?auto_2334 - CITY
      ?auto_2351 - LOCATION
      ?auto_2344 - CITY
      ?auto_2340 - CITY
      ?auto_2347 - LOCATION
      ?auto_2346 - CITY
      ?auto_2350 - CITY
      ?auto_2348 - LOCATION
      ?auto_2339 - CITY
      ?auto_2338 - CITY
      ?auto_2335 - LOCATION
      ?auto_2345 - CITY
      ?auto_2331 - TRUCK
      ?auto_2336 - LOCATION
      ?auto_2337 - CITY
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2324 ?auto_2322 ) ( GREATER-THAN ?auto_2325 ?auto_2322 ) ( GREATER-THAN ?auto_2325 ?auto_2324 ) ( GREATER-THAN ?auto_2326 ?auto_2322 ) ( GREATER-THAN ?auto_2326 ?auto_2324 ) ( GREATER-THAN ?auto_2326 ?auto_2325 ) ( GREATER-THAN ?auto_2327 ?auto_2322 ) ( GREATER-THAN ?auto_2327 ?auto_2324 ) ( GREATER-THAN ?auto_2327 ?auto_2325 ) ( GREATER-THAN ?auto_2327 ?auto_2326 ) ( IN-CITY ?auto_2329 ?auto_2332 ) ( IN-CITY ?auto_2330 ?auto_2332 ) ( not ( = ?auto_2330 ?auto_2329 ) ) ( OBJ-AT ?auto_2327 ?auto_2329 ) ( IN-CITY ?auto_2330 ?auto_2334 ) ( IN-CITY ?auto_2329 ?auto_2334 ) ( IN-CITY ?auto_2351 ?auto_2344 ) ( IN-CITY ?auto_2330 ?auto_2344 ) ( not ( = ?auto_2330 ?auto_2351 ) ) ( OBJ-AT ?auto_2326 ?auto_2351 ) ( IN-CITY ?auto_2330 ?auto_2340 ) ( IN-CITY ?auto_2351 ?auto_2340 ) ( IN-CITY ?auto_2347 ?auto_2346 ) ( IN-CITY ?auto_2330 ?auto_2346 ) ( not ( = ?auto_2330 ?auto_2347 ) ) ( OBJ-AT ?auto_2325 ?auto_2347 ) ( IN-CITY ?auto_2330 ?auto_2350 ) ( IN-CITY ?auto_2347 ?auto_2350 ) ( IN-CITY ?auto_2348 ?auto_2339 ) ( IN-CITY ?auto_2330 ?auto_2339 ) ( not ( = ?auto_2330 ?auto_2348 ) ) ( OBJ-AT ?auto_2324 ?auto_2348 ) ( IN-CITY ?auto_2330 ?auto_2338 ) ( IN-CITY ?auto_2348 ?auto_2338 ) ( IN-CITY ?auto_2335 ?auto_2345 ) ( IN-CITY ?auto_2330 ?auto_2345 ) ( not ( = ?auto_2330 ?auto_2335 ) ) ( OBJ-AT ?auto_2322 ?auto_2335 ) ( TRUCK-AT ?auto_2331 ?auto_2336 ) ( IN-CITY ?auto_2336 ?auto_2337 ) ( IN-CITY ?auto_2335 ?auto_2337 ) ( not ( = ?auto_2335 ?auto_2336 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2322 ?auto_2324 ?auto_2325 ?auto_2326 ?auto_2330 )
      ( DELIVER-1PKG ?auto_2327 ?auto_2330 )
      ( DELIVER-5PKG-VERIFY ?auto_2322 ?auto_2324 ?auto_2325 ?auto_2326 ?auto_2327 ?auto_2330 ) )
  )

)

