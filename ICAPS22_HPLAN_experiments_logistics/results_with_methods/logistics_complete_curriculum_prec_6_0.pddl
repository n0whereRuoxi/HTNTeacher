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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2222 - OBJ
      ?auto_2223 - LOCATION
    )
    :vars
    (
      ?auto_2224 - TRUCK
      ?auto_2225 - LOCATION
      ?auto_2226 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2224 ?auto_2225 ) ( IN-CITY ?auto_2225 ?auto_2226 ) ( IN-CITY ?auto_2223 ?auto_2226 ) ( not ( = ?auto_2223 ?auto_2225 ) ) ( OBJ-AT ?auto_2222 ?auto_2225 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2222 ?auto_2224 ?auto_2225 )
      ( !DRIVE-TRUCK ?auto_2224 ?auto_2225 ?auto_2223 ?auto_2226 )
      ( !UNLOAD-TRUCK ?auto_2222 ?auto_2224 ?auto_2223 )
      ( DELIVER-1PKG-VERIFY ?auto_2222 ?auto_2223 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2229 - OBJ
      ?auto_2230 - LOCATION
    )
    :vars
    (
      ?auto_2232 - LOCATION
      ?auto_2231 - CITY
      ?auto_2233 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2232 ?auto_2231 ) ( IN-CITY ?auto_2230 ?auto_2231 ) ( not ( = ?auto_2230 ?auto_2232 ) ) ( OBJ-AT ?auto_2229 ?auto_2232 ) ( TRUCK-AT ?auto_2233 ?auto_2230 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2233 ?auto_2230 ?auto_2232 ?auto_2231 )
      ( DELIVER-1PKG ?auto_2229 ?auto_2230 )
      ( DELIVER-1PKG-VERIFY ?auto_2229 ?auto_2230 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2236 - OBJ
      ?auto_2237 - LOCATION
    )
    :vars
    (
      ?auto_2238 - TRUCK
      ?auto_2239 - LOCATION
      ?auto_2240 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2238 ?auto_2239 ) ( IN-CITY ?auto_2239 ?auto_2240 ) ( IN-CITY ?auto_2237 ?auto_2240 ) ( not ( = ?auto_2237 ?auto_2239 ) ) ( OBJ-AT ?auto_2236 ?auto_2239 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2236 ?auto_2238 ?auto_2239 )
      ( !DRIVE-TRUCK ?auto_2238 ?auto_2239 ?auto_2237 ?auto_2240 )
      ( !UNLOAD-TRUCK ?auto_2236 ?auto_2238 ?auto_2237 )
      ( DELIVER-1PKG-VERIFY ?auto_2236 ?auto_2237 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2243 - OBJ
      ?auto_2244 - LOCATION
    )
    :vars
    (
      ?auto_2246 - LOCATION
      ?auto_2247 - CITY
      ?auto_2245 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2246 ?auto_2247 ) ( IN-CITY ?auto_2244 ?auto_2247 ) ( not ( = ?auto_2244 ?auto_2246 ) ) ( OBJ-AT ?auto_2243 ?auto_2246 ) ( TRUCK-AT ?auto_2245 ?auto_2244 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2245 ?auto_2244 ?auto_2246 ?auto_2247 )
      ( DELIVER-1PKG ?auto_2243 ?auto_2244 )
      ( DELIVER-1PKG-VERIFY ?auto_2243 ?auto_2244 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2251 - OBJ
      ?auto_2253 - OBJ
      ?auto_2252 - LOCATION
    )
    :vars
    (
      ?auto_2254 - LOCATION
      ?auto_2255 - CITY
      ?auto_2256 - TRUCK
      ?auto_2257 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2253 ?auto_2251 ) ( IN-CITY ?auto_2254 ?auto_2255 ) ( IN-CITY ?auto_2252 ?auto_2255 ) ( not ( = ?auto_2252 ?auto_2254 ) ) ( OBJ-AT ?auto_2253 ?auto_2254 ) ( TRUCK-AT ?auto_2256 ?auto_2257 ) ( IN-CITY ?auto_2257 ?auto_2255 ) ( not ( = ?auto_2252 ?auto_2257 ) ) ( OBJ-AT ?auto_2251 ?auto_2257 ) ( not ( = ?auto_2251 ?auto_2253 ) ) ( not ( = ?auto_2254 ?auto_2257 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2251 ?auto_2252 )
      ( DELIVER-1PKG ?auto_2253 ?auto_2252 )
      ( DELIVER-2PKG-VERIFY ?auto_2251 ?auto_2253 ?auto_2252 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2261 - OBJ
      ?auto_2263 - OBJ
      ?auto_2262 - LOCATION
    )
    :vars
    (
      ?auto_2266 - LOCATION
      ?auto_2264 - CITY
      ?auto_2267 - LOCATION
      ?auto_2265 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2263 ?auto_2261 ) ( IN-CITY ?auto_2266 ?auto_2264 ) ( IN-CITY ?auto_2262 ?auto_2264 ) ( not ( = ?auto_2262 ?auto_2266 ) ) ( OBJ-AT ?auto_2263 ?auto_2266 ) ( IN-CITY ?auto_2267 ?auto_2264 ) ( not ( = ?auto_2262 ?auto_2267 ) ) ( OBJ-AT ?auto_2261 ?auto_2267 ) ( not ( = ?auto_2261 ?auto_2263 ) ) ( not ( = ?auto_2266 ?auto_2267 ) ) ( TRUCK-AT ?auto_2265 ?auto_2262 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2265 ?auto_2262 ?auto_2267 ?auto_2264 )
      ( DELIVER-2PKG ?auto_2261 ?auto_2263 ?auto_2262 )
      ( DELIVER-2PKG-VERIFY ?auto_2261 ?auto_2263 ?auto_2262 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2270 - OBJ
      ?auto_2271 - LOCATION
    )
    :vars
    (
      ?auto_2272 - TRUCK
      ?auto_2273 - LOCATION
      ?auto_2274 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2272 ?auto_2273 ) ( IN-CITY ?auto_2273 ?auto_2274 ) ( IN-CITY ?auto_2271 ?auto_2274 ) ( not ( = ?auto_2271 ?auto_2273 ) ) ( OBJ-AT ?auto_2270 ?auto_2273 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2270 ?auto_2272 ?auto_2273 )
      ( !DRIVE-TRUCK ?auto_2272 ?auto_2273 ?auto_2271 ?auto_2274 )
      ( !UNLOAD-TRUCK ?auto_2270 ?auto_2272 ?auto_2271 )
      ( DELIVER-1PKG-VERIFY ?auto_2270 ?auto_2271 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2277 - OBJ
      ?auto_2278 - LOCATION
    )
    :vars
    (
      ?auto_2281 - LOCATION
      ?auto_2280 - CITY
      ?auto_2279 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2281 ?auto_2280 ) ( IN-CITY ?auto_2278 ?auto_2280 ) ( not ( = ?auto_2278 ?auto_2281 ) ) ( OBJ-AT ?auto_2277 ?auto_2281 ) ( TRUCK-AT ?auto_2279 ?auto_2278 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2279 ?auto_2278 ?auto_2281 ?auto_2280 )
      ( DELIVER-1PKG ?auto_2277 ?auto_2278 )
      ( DELIVER-1PKG-VERIFY ?auto_2277 ?auto_2278 ) )
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
      ?auto_2292 - LOCATION
      ?auto_2290 - CITY
      ?auto_2293 - LOCATION
      ?auto_2291 - TRUCK
      ?auto_2294 - LOCATION
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2288 ?auto_2286 ) ( GREATER-THAN ?auto_2289 ?auto_2286 ) ( GREATER-THAN ?auto_2289 ?auto_2288 ) ( IN-CITY ?auto_2292 ?auto_2290 ) ( IN-CITY ?auto_2287 ?auto_2290 ) ( not ( = ?auto_2287 ?auto_2292 ) ) ( OBJ-AT ?auto_2289 ?auto_2292 ) ( IN-CITY ?auto_2293 ?auto_2290 ) ( not ( = ?auto_2287 ?auto_2293 ) ) ( OBJ-AT ?auto_2288 ?auto_2293 ) ( TRUCK-AT ?auto_2291 ?auto_2294 ) ( IN-CITY ?auto_2294 ?auto_2290 ) ( not ( = ?auto_2287 ?auto_2294 ) ) ( OBJ-AT ?auto_2286 ?auto_2294 ) ( not ( = ?auto_2286 ?auto_2288 ) ) ( not ( = ?auto_2293 ?auto_2294 ) ) ( not ( = ?auto_2286 ?auto_2289 ) ) ( not ( = ?auto_2288 ?auto_2289 ) ) ( not ( = ?auto_2292 ?auto_2293 ) ) ( not ( = ?auto_2292 ?auto_2294 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2286 ?auto_2288 ?auto_2287 )
      ( DELIVER-1PKG ?auto_2289 ?auto_2287 )
      ( DELIVER-3PKG-VERIFY ?auto_2286 ?auto_2288 ?auto_2289 ?auto_2287 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2299 - OBJ
      ?auto_2301 - OBJ
      ?auto_2302 - OBJ
      ?auto_2300 - LOCATION
    )
    :vars
    (
      ?auto_2306 - LOCATION
      ?auto_2303 - CITY
      ?auto_2305 - LOCATION
      ?auto_2307 - LOCATION
      ?auto_2304 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2301 ?auto_2299 ) ( GREATER-THAN ?auto_2302 ?auto_2299 ) ( GREATER-THAN ?auto_2302 ?auto_2301 ) ( IN-CITY ?auto_2306 ?auto_2303 ) ( IN-CITY ?auto_2300 ?auto_2303 ) ( not ( = ?auto_2300 ?auto_2306 ) ) ( OBJ-AT ?auto_2302 ?auto_2306 ) ( IN-CITY ?auto_2305 ?auto_2303 ) ( not ( = ?auto_2300 ?auto_2305 ) ) ( OBJ-AT ?auto_2301 ?auto_2305 ) ( IN-CITY ?auto_2307 ?auto_2303 ) ( not ( = ?auto_2300 ?auto_2307 ) ) ( OBJ-AT ?auto_2299 ?auto_2307 ) ( not ( = ?auto_2299 ?auto_2301 ) ) ( not ( = ?auto_2305 ?auto_2307 ) ) ( not ( = ?auto_2299 ?auto_2302 ) ) ( not ( = ?auto_2301 ?auto_2302 ) ) ( not ( = ?auto_2306 ?auto_2305 ) ) ( not ( = ?auto_2306 ?auto_2307 ) ) ( TRUCK-AT ?auto_2304 ?auto_2300 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2304 ?auto_2300 ?auto_2307 ?auto_2303 )
      ( DELIVER-3PKG ?auto_2299 ?auto_2301 ?auto_2302 ?auto_2300 )
      ( DELIVER-3PKG-VERIFY ?auto_2299 ?auto_2301 ?auto_2302 ?auto_2300 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2310 - OBJ
      ?auto_2311 - LOCATION
    )
    :vars
    (
      ?auto_2312 - TRUCK
      ?auto_2313 - LOCATION
      ?auto_2314 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2312 ?auto_2313 ) ( IN-CITY ?auto_2313 ?auto_2314 ) ( IN-CITY ?auto_2311 ?auto_2314 ) ( not ( = ?auto_2311 ?auto_2313 ) ) ( OBJ-AT ?auto_2310 ?auto_2313 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2310 ?auto_2312 ?auto_2313 )
      ( !DRIVE-TRUCK ?auto_2312 ?auto_2313 ?auto_2311 ?auto_2314 )
      ( !UNLOAD-TRUCK ?auto_2310 ?auto_2312 ?auto_2311 )
      ( DELIVER-1PKG-VERIFY ?auto_2310 ?auto_2311 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2317 - OBJ
      ?auto_2318 - LOCATION
    )
    :vars
    (
      ?auto_2319 - LOCATION
      ?auto_2320 - CITY
      ?auto_2321 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2319 ?auto_2320 ) ( IN-CITY ?auto_2318 ?auto_2320 ) ( not ( = ?auto_2318 ?auto_2319 ) ) ( OBJ-AT ?auto_2317 ?auto_2319 ) ( TRUCK-AT ?auto_2321 ?auto_2318 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2321 ?auto_2318 ?auto_2319 ?auto_2320 )
      ( DELIVER-1PKG ?auto_2317 ?auto_2318 )
      ( DELIVER-1PKG-VERIFY ?auto_2317 ?auto_2318 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2327 - OBJ
      ?auto_2329 - OBJ
      ?auto_2330 - OBJ
      ?auto_2331 - OBJ
      ?auto_2328 - LOCATION
    )
    :vars
    (
      ?auto_2333 - LOCATION
      ?auto_2332 - CITY
      ?auto_2336 - LOCATION
      ?auto_2335 - LOCATION
      ?auto_2334 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2329 ?auto_2327 ) ( GREATER-THAN ?auto_2330 ?auto_2327 ) ( GREATER-THAN ?auto_2330 ?auto_2329 ) ( GREATER-THAN ?auto_2331 ?auto_2327 ) ( GREATER-THAN ?auto_2331 ?auto_2329 ) ( GREATER-THAN ?auto_2331 ?auto_2330 ) ( IN-CITY ?auto_2333 ?auto_2332 ) ( IN-CITY ?auto_2328 ?auto_2332 ) ( not ( = ?auto_2328 ?auto_2333 ) ) ( OBJ-AT ?auto_2331 ?auto_2333 ) ( IN-CITY ?auto_2336 ?auto_2332 ) ( not ( = ?auto_2328 ?auto_2336 ) ) ( OBJ-AT ?auto_2330 ?auto_2336 ) ( IN-CITY ?auto_2335 ?auto_2332 ) ( not ( = ?auto_2328 ?auto_2335 ) ) ( OBJ-AT ?auto_2329 ?auto_2335 ) ( TRUCK-AT ?auto_2334 ?auto_2333 ) ( OBJ-AT ?auto_2327 ?auto_2333 ) ( not ( = ?auto_2327 ?auto_2329 ) ) ( not ( = ?auto_2335 ?auto_2333 ) ) ( not ( = ?auto_2327 ?auto_2330 ) ) ( not ( = ?auto_2329 ?auto_2330 ) ) ( not ( = ?auto_2336 ?auto_2335 ) ) ( not ( = ?auto_2336 ?auto_2333 ) ) ( not ( = ?auto_2327 ?auto_2331 ) ) ( not ( = ?auto_2329 ?auto_2331 ) ) ( not ( = ?auto_2330 ?auto_2331 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_2327 ?auto_2329 ?auto_2330 ?auto_2328 )
      ( DELIVER-1PKG ?auto_2331 ?auto_2328 )
      ( DELIVER-4PKG-VERIFY ?auto_2327 ?auto_2329 ?auto_2330 ?auto_2331 ?auto_2328 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_2342 - OBJ
      ?auto_2344 - OBJ
      ?auto_2345 - OBJ
      ?auto_2346 - OBJ
      ?auto_2343 - LOCATION
    )
    :vars
    (
      ?auto_2347 - LOCATION
      ?auto_2351 - CITY
      ?auto_2348 - LOCATION
      ?auto_2350 - LOCATION
      ?auto_2349 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2344 ?auto_2342 ) ( GREATER-THAN ?auto_2345 ?auto_2342 ) ( GREATER-THAN ?auto_2345 ?auto_2344 ) ( GREATER-THAN ?auto_2346 ?auto_2342 ) ( GREATER-THAN ?auto_2346 ?auto_2344 ) ( GREATER-THAN ?auto_2346 ?auto_2345 ) ( IN-CITY ?auto_2347 ?auto_2351 ) ( IN-CITY ?auto_2343 ?auto_2351 ) ( not ( = ?auto_2343 ?auto_2347 ) ) ( OBJ-AT ?auto_2346 ?auto_2347 ) ( IN-CITY ?auto_2348 ?auto_2351 ) ( not ( = ?auto_2343 ?auto_2348 ) ) ( OBJ-AT ?auto_2345 ?auto_2348 ) ( IN-CITY ?auto_2350 ?auto_2351 ) ( not ( = ?auto_2343 ?auto_2350 ) ) ( OBJ-AT ?auto_2344 ?auto_2350 ) ( OBJ-AT ?auto_2342 ?auto_2347 ) ( not ( = ?auto_2342 ?auto_2344 ) ) ( not ( = ?auto_2350 ?auto_2347 ) ) ( not ( = ?auto_2342 ?auto_2345 ) ) ( not ( = ?auto_2344 ?auto_2345 ) ) ( not ( = ?auto_2348 ?auto_2350 ) ) ( not ( = ?auto_2348 ?auto_2347 ) ) ( not ( = ?auto_2342 ?auto_2346 ) ) ( not ( = ?auto_2344 ?auto_2346 ) ) ( not ( = ?auto_2345 ?auto_2346 ) ) ( TRUCK-AT ?auto_2349 ?auto_2343 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2349 ?auto_2343 ?auto_2347 ?auto_2351 )
      ( DELIVER-4PKG ?auto_2342 ?auto_2344 ?auto_2345 ?auto_2346 ?auto_2343 )
      ( DELIVER-4PKG-VERIFY ?auto_2342 ?auto_2344 ?auto_2345 ?auto_2346 ?auto_2343 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2354 - OBJ
      ?auto_2355 - LOCATION
    )
    :vars
    (
      ?auto_2356 - TRUCK
      ?auto_2357 - LOCATION
      ?auto_2358 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2356 ?auto_2357 ) ( IN-CITY ?auto_2357 ?auto_2358 ) ( IN-CITY ?auto_2355 ?auto_2358 ) ( not ( = ?auto_2355 ?auto_2357 ) ) ( OBJ-AT ?auto_2354 ?auto_2357 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2354 ?auto_2356 ?auto_2357 )
      ( !DRIVE-TRUCK ?auto_2356 ?auto_2357 ?auto_2355 ?auto_2358 )
      ( !UNLOAD-TRUCK ?auto_2354 ?auto_2356 ?auto_2355 )
      ( DELIVER-1PKG-VERIFY ?auto_2354 ?auto_2355 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2361 - OBJ
      ?auto_2362 - LOCATION
    )
    :vars
    (
      ?auto_2363 - LOCATION
      ?auto_2365 - CITY
      ?auto_2364 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2363 ?auto_2365 ) ( IN-CITY ?auto_2362 ?auto_2365 ) ( not ( = ?auto_2362 ?auto_2363 ) ) ( OBJ-AT ?auto_2361 ?auto_2363 ) ( TRUCK-AT ?auto_2364 ?auto_2362 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2364 ?auto_2362 ?auto_2363 ?auto_2365 )
      ( DELIVER-1PKG ?auto_2361 ?auto_2362 )
      ( DELIVER-1PKG-VERIFY ?auto_2361 ?auto_2362 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2372 - OBJ
      ?auto_2374 - OBJ
      ?auto_2375 - OBJ
      ?auto_2377 - OBJ
      ?auto_2376 - OBJ
      ?auto_2373 - LOCATION
    )
    :vars
    (
      ?auto_2379 - LOCATION
      ?auto_2380 - CITY
      ?auto_2381 - LOCATION
      ?auto_2382 - LOCATION
      ?auto_2383 - LOCATION
      ?auto_2378 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2374 ?auto_2372 ) ( GREATER-THAN ?auto_2375 ?auto_2372 ) ( GREATER-THAN ?auto_2375 ?auto_2374 ) ( GREATER-THAN ?auto_2377 ?auto_2372 ) ( GREATER-THAN ?auto_2377 ?auto_2374 ) ( GREATER-THAN ?auto_2377 ?auto_2375 ) ( GREATER-THAN ?auto_2376 ?auto_2372 ) ( GREATER-THAN ?auto_2376 ?auto_2374 ) ( GREATER-THAN ?auto_2376 ?auto_2375 ) ( GREATER-THAN ?auto_2376 ?auto_2377 ) ( IN-CITY ?auto_2379 ?auto_2380 ) ( IN-CITY ?auto_2373 ?auto_2380 ) ( not ( = ?auto_2373 ?auto_2379 ) ) ( OBJ-AT ?auto_2376 ?auto_2379 ) ( IN-CITY ?auto_2381 ?auto_2380 ) ( not ( = ?auto_2373 ?auto_2381 ) ) ( OBJ-AT ?auto_2377 ?auto_2381 ) ( IN-CITY ?auto_2382 ?auto_2380 ) ( not ( = ?auto_2373 ?auto_2382 ) ) ( OBJ-AT ?auto_2375 ?auto_2382 ) ( IN-CITY ?auto_2383 ?auto_2380 ) ( not ( = ?auto_2373 ?auto_2383 ) ) ( OBJ-AT ?auto_2374 ?auto_2383 ) ( TRUCK-AT ?auto_2378 ?auto_2381 ) ( OBJ-AT ?auto_2372 ?auto_2381 ) ( not ( = ?auto_2372 ?auto_2374 ) ) ( not ( = ?auto_2383 ?auto_2381 ) ) ( not ( = ?auto_2372 ?auto_2375 ) ) ( not ( = ?auto_2374 ?auto_2375 ) ) ( not ( = ?auto_2382 ?auto_2383 ) ) ( not ( = ?auto_2382 ?auto_2381 ) ) ( not ( = ?auto_2372 ?auto_2377 ) ) ( not ( = ?auto_2374 ?auto_2377 ) ) ( not ( = ?auto_2375 ?auto_2377 ) ) ( not ( = ?auto_2372 ?auto_2376 ) ) ( not ( = ?auto_2374 ?auto_2376 ) ) ( not ( = ?auto_2375 ?auto_2376 ) ) ( not ( = ?auto_2377 ?auto_2376 ) ) ( not ( = ?auto_2379 ?auto_2381 ) ) ( not ( = ?auto_2379 ?auto_2382 ) ) ( not ( = ?auto_2379 ?auto_2383 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_2372 ?auto_2374 ?auto_2375 ?auto_2377 ?auto_2373 )
      ( DELIVER-1PKG ?auto_2376 ?auto_2373 )
      ( DELIVER-5PKG-VERIFY ?auto_2372 ?auto_2374 ?auto_2375 ?auto_2377 ?auto_2376 ?auto_2373 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_2390 - OBJ
      ?auto_2392 - OBJ
      ?auto_2393 - OBJ
      ?auto_2395 - OBJ
      ?auto_2394 - OBJ
      ?auto_2391 - LOCATION
    )
    :vars
    (
      ?auto_2401 - LOCATION
      ?auto_2399 - CITY
      ?auto_2398 - LOCATION
      ?auto_2397 - LOCATION
      ?auto_2396 - LOCATION
      ?auto_2400 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2392 ?auto_2390 ) ( GREATER-THAN ?auto_2393 ?auto_2390 ) ( GREATER-THAN ?auto_2393 ?auto_2392 ) ( GREATER-THAN ?auto_2395 ?auto_2390 ) ( GREATER-THAN ?auto_2395 ?auto_2392 ) ( GREATER-THAN ?auto_2395 ?auto_2393 ) ( GREATER-THAN ?auto_2394 ?auto_2390 ) ( GREATER-THAN ?auto_2394 ?auto_2392 ) ( GREATER-THAN ?auto_2394 ?auto_2393 ) ( GREATER-THAN ?auto_2394 ?auto_2395 ) ( IN-CITY ?auto_2401 ?auto_2399 ) ( IN-CITY ?auto_2391 ?auto_2399 ) ( not ( = ?auto_2391 ?auto_2401 ) ) ( OBJ-AT ?auto_2394 ?auto_2401 ) ( IN-CITY ?auto_2398 ?auto_2399 ) ( not ( = ?auto_2391 ?auto_2398 ) ) ( OBJ-AT ?auto_2395 ?auto_2398 ) ( IN-CITY ?auto_2397 ?auto_2399 ) ( not ( = ?auto_2391 ?auto_2397 ) ) ( OBJ-AT ?auto_2393 ?auto_2397 ) ( IN-CITY ?auto_2396 ?auto_2399 ) ( not ( = ?auto_2391 ?auto_2396 ) ) ( OBJ-AT ?auto_2392 ?auto_2396 ) ( OBJ-AT ?auto_2390 ?auto_2398 ) ( not ( = ?auto_2390 ?auto_2392 ) ) ( not ( = ?auto_2396 ?auto_2398 ) ) ( not ( = ?auto_2390 ?auto_2393 ) ) ( not ( = ?auto_2392 ?auto_2393 ) ) ( not ( = ?auto_2397 ?auto_2396 ) ) ( not ( = ?auto_2397 ?auto_2398 ) ) ( not ( = ?auto_2390 ?auto_2395 ) ) ( not ( = ?auto_2392 ?auto_2395 ) ) ( not ( = ?auto_2393 ?auto_2395 ) ) ( not ( = ?auto_2390 ?auto_2394 ) ) ( not ( = ?auto_2392 ?auto_2394 ) ) ( not ( = ?auto_2393 ?auto_2394 ) ) ( not ( = ?auto_2395 ?auto_2394 ) ) ( not ( = ?auto_2401 ?auto_2398 ) ) ( not ( = ?auto_2401 ?auto_2397 ) ) ( not ( = ?auto_2401 ?auto_2396 ) ) ( TRUCK-AT ?auto_2400 ?auto_2391 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2400 ?auto_2391 ?auto_2398 ?auto_2399 )
      ( DELIVER-5PKG ?auto_2390 ?auto_2392 ?auto_2393 ?auto_2395 ?auto_2394 ?auto_2391 )
      ( DELIVER-5PKG-VERIFY ?auto_2390 ?auto_2392 ?auto_2393 ?auto_2395 ?auto_2394 ?auto_2391 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2404 - OBJ
      ?auto_2405 - LOCATION
    )
    :vars
    (
      ?auto_2406 - TRUCK
      ?auto_2407 - LOCATION
      ?auto_2408 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2406 ?auto_2407 ) ( IN-CITY ?auto_2407 ?auto_2408 ) ( IN-CITY ?auto_2405 ?auto_2408 ) ( not ( = ?auto_2405 ?auto_2407 ) ) ( OBJ-AT ?auto_2404 ?auto_2407 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2404 ?auto_2406 ?auto_2407 )
      ( !DRIVE-TRUCK ?auto_2406 ?auto_2407 ?auto_2405 ?auto_2408 )
      ( !UNLOAD-TRUCK ?auto_2404 ?auto_2406 ?auto_2405 )
      ( DELIVER-1PKG-VERIFY ?auto_2404 ?auto_2405 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2411 - OBJ
      ?auto_2412 - LOCATION
    )
    :vars
    (
      ?auto_2413 - LOCATION
      ?auto_2415 - CITY
      ?auto_2414 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2413 ?auto_2415 ) ( IN-CITY ?auto_2412 ?auto_2415 ) ( not ( = ?auto_2412 ?auto_2413 ) ) ( OBJ-AT ?auto_2411 ?auto_2413 ) ( TRUCK-AT ?auto_2414 ?auto_2412 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2414 ?auto_2412 ?auto_2413 ?auto_2415 )
      ( DELIVER-1PKG ?auto_2411 ?auto_2412 )
      ( DELIVER-1PKG-VERIFY ?auto_2411 ?auto_2412 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2423 - OBJ
      ?auto_2425 - OBJ
      ?auto_2426 - OBJ
      ?auto_2428 - OBJ
      ?auto_2427 - OBJ
      ?auto_2429 - OBJ
      ?auto_2424 - LOCATION
    )
    :vars
    (
      ?auto_2431 - LOCATION
      ?auto_2430 - CITY
      ?auto_2435 - LOCATION
      ?auto_2434 - LOCATION
      ?auto_2433 - LOCATION
      ?auto_2432 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2425 ?auto_2423 ) ( GREATER-THAN ?auto_2426 ?auto_2423 ) ( GREATER-THAN ?auto_2426 ?auto_2425 ) ( GREATER-THAN ?auto_2428 ?auto_2423 ) ( GREATER-THAN ?auto_2428 ?auto_2425 ) ( GREATER-THAN ?auto_2428 ?auto_2426 ) ( GREATER-THAN ?auto_2427 ?auto_2423 ) ( GREATER-THAN ?auto_2427 ?auto_2425 ) ( GREATER-THAN ?auto_2427 ?auto_2426 ) ( GREATER-THAN ?auto_2427 ?auto_2428 ) ( GREATER-THAN ?auto_2429 ?auto_2423 ) ( GREATER-THAN ?auto_2429 ?auto_2425 ) ( GREATER-THAN ?auto_2429 ?auto_2426 ) ( GREATER-THAN ?auto_2429 ?auto_2428 ) ( GREATER-THAN ?auto_2429 ?auto_2427 ) ( IN-CITY ?auto_2431 ?auto_2430 ) ( IN-CITY ?auto_2424 ?auto_2430 ) ( not ( = ?auto_2424 ?auto_2431 ) ) ( OBJ-AT ?auto_2429 ?auto_2431 ) ( IN-CITY ?auto_2435 ?auto_2430 ) ( not ( = ?auto_2424 ?auto_2435 ) ) ( OBJ-AT ?auto_2427 ?auto_2435 ) ( IN-CITY ?auto_2434 ?auto_2430 ) ( not ( = ?auto_2424 ?auto_2434 ) ) ( OBJ-AT ?auto_2428 ?auto_2434 ) ( IN-CITY ?auto_2433 ?auto_2430 ) ( not ( = ?auto_2424 ?auto_2433 ) ) ( OBJ-AT ?auto_2426 ?auto_2433 ) ( OBJ-AT ?auto_2425 ?auto_2431 ) ( TRUCK-AT ?auto_2432 ?auto_2434 ) ( OBJ-AT ?auto_2423 ?auto_2434 ) ( not ( = ?auto_2423 ?auto_2425 ) ) ( not ( = ?auto_2431 ?auto_2434 ) ) ( not ( = ?auto_2423 ?auto_2426 ) ) ( not ( = ?auto_2425 ?auto_2426 ) ) ( not ( = ?auto_2433 ?auto_2431 ) ) ( not ( = ?auto_2433 ?auto_2434 ) ) ( not ( = ?auto_2423 ?auto_2428 ) ) ( not ( = ?auto_2425 ?auto_2428 ) ) ( not ( = ?auto_2426 ?auto_2428 ) ) ( not ( = ?auto_2423 ?auto_2427 ) ) ( not ( = ?auto_2425 ?auto_2427 ) ) ( not ( = ?auto_2426 ?auto_2427 ) ) ( not ( = ?auto_2428 ?auto_2427 ) ) ( not ( = ?auto_2435 ?auto_2434 ) ) ( not ( = ?auto_2435 ?auto_2433 ) ) ( not ( = ?auto_2435 ?auto_2431 ) ) ( not ( = ?auto_2423 ?auto_2429 ) ) ( not ( = ?auto_2425 ?auto_2429 ) ) ( not ( = ?auto_2426 ?auto_2429 ) ) ( not ( = ?auto_2428 ?auto_2429 ) ) ( not ( = ?auto_2427 ?auto_2429 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_2423 ?auto_2425 ?auto_2426 ?auto_2428 ?auto_2427 ?auto_2424 )
      ( DELIVER-1PKG ?auto_2429 ?auto_2424 )
      ( DELIVER-6PKG-VERIFY ?auto_2423 ?auto_2425 ?auto_2426 ?auto_2428 ?auto_2427 ?auto_2429 ?auto_2424 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_2443 - OBJ
      ?auto_2445 - OBJ
      ?auto_2446 - OBJ
      ?auto_2448 - OBJ
      ?auto_2447 - OBJ
      ?auto_2449 - OBJ
      ?auto_2444 - LOCATION
    )
    :vars
    (
      ?auto_2453 - LOCATION
      ?auto_2454 - CITY
      ?auto_2450 - LOCATION
      ?auto_2455 - LOCATION
      ?auto_2452 - LOCATION
      ?auto_2451 - TRUCK
    )
    :precondition
    ( and ( GREATER-THAN ?auto_2445 ?auto_2443 ) ( GREATER-THAN ?auto_2446 ?auto_2443 ) ( GREATER-THAN ?auto_2446 ?auto_2445 ) ( GREATER-THAN ?auto_2448 ?auto_2443 ) ( GREATER-THAN ?auto_2448 ?auto_2445 ) ( GREATER-THAN ?auto_2448 ?auto_2446 ) ( GREATER-THAN ?auto_2447 ?auto_2443 ) ( GREATER-THAN ?auto_2447 ?auto_2445 ) ( GREATER-THAN ?auto_2447 ?auto_2446 ) ( GREATER-THAN ?auto_2447 ?auto_2448 ) ( GREATER-THAN ?auto_2449 ?auto_2443 ) ( GREATER-THAN ?auto_2449 ?auto_2445 ) ( GREATER-THAN ?auto_2449 ?auto_2446 ) ( GREATER-THAN ?auto_2449 ?auto_2448 ) ( GREATER-THAN ?auto_2449 ?auto_2447 ) ( IN-CITY ?auto_2453 ?auto_2454 ) ( IN-CITY ?auto_2444 ?auto_2454 ) ( not ( = ?auto_2444 ?auto_2453 ) ) ( OBJ-AT ?auto_2449 ?auto_2453 ) ( IN-CITY ?auto_2450 ?auto_2454 ) ( not ( = ?auto_2444 ?auto_2450 ) ) ( OBJ-AT ?auto_2447 ?auto_2450 ) ( IN-CITY ?auto_2455 ?auto_2454 ) ( not ( = ?auto_2444 ?auto_2455 ) ) ( OBJ-AT ?auto_2448 ?auto_2455 ) ( IN-CITY ?auto_2452 ?auto_2454 ) ( not ( = ?auto_2444 ?auto_2452 ) ) ( OBJ-AT ?auto_2446 ?auto_2452 ) ( OBJ-AT ?auto_2445 ?auto_2453 ) ( OBJ-AT ?auto_2443 ?auto_2455 ) ( not ( = ?auto_2443 ?auto_2445 ) ) ( not ( = ?auto_2453 ?auto_2455 ) ) ( not ( = ?auto_2443 ?auto_2446 ) ) ( not ( = ?auto_2445 ?auto_2446 ) ) ( not ( = ?auto_2452 ?auto_2453 ) ) ( not ( = ?auto_2452 ?auto_2455 ) ) ( not ( = ?auto_2443 ?auto_2448 ) ) ( not ( = ?auto_2445 ?auto_2448 ) ) ( not ( = ?auto_2446 ?auto_2448 ) ) ( not ( = ?auto_2443 ?auto_2447 ) ) ( not ( = ?auto_2445 ?auto_2447 ) ) ( not ( = ?auto_2446 ?auto_2447 ) ) ( not ( = ?auto_2448 ?auto_2447 ) ) ( not ( = ?auto_2450 ?auto_2455 ) ) ( not ( = ?auto_2450 ?auto_2452 ) ) ( not ( = ?auto_2450 ?auto_2453 ) ) ( not ( = ?auto_2443 ?auto_2449 ) ) ( not ( = ?auto_2445 ?auto_2449 ) ) ( not ( = ?auto_2446 ?auto_2449 ) ) ( not ( = ?auto_2448 ?auto_2449 ) ) ( not ( = ?auto_2447 ?auto_2449 ) ) ( TRUCK-AT ?auto_2451 ?auto_2444 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2451 ?auto_2444 ?auto_2455 ?auto_2454 )
      ( DELIVER-6PKG ?auto_2443 ?auto_2445 ?auto_2446 ?auto_2448 ?auto_2447 ?auto_2449 ?auto_2444 )
      ( DELIVER-6PKG-VERIFY ?auto_2443 ?auto_2445 ?auto_2446 ?auto_2448 ?auto_2447 ?auto_2449 ?auto_2444 ) )
  )

)

