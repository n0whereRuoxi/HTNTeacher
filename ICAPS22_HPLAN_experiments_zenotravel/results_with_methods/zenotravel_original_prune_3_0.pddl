( define ( domain zenotravel )
  ( :requirements :strips :typing :htn )
  ( :types aircraft city flevel person )
  ( :predicates
    ( PERSON-AT ?x - PERSON ?c - CITY )
    ( AIRCRAFT-AT ?y - AIRCRAFT ?c - CITY )
    ( IN ?p - PERSON ?a - AIRCRAFT )
    ( FUEL-LEVEL ?a - AIRCRAFT ?l - FLEVEL )
    ( NEXT ?l1 - FLEVEL ?l2 - FLEVEL )
  )
  ( :action !BOARD
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( PERSON-AT ?p ?c ) ) ( IN ?p ?a ) )
  )
  ( :action !DEBARK
    :parameters
    (
      ?p - PERSON
      ?a - AIRCRAFT
      ?c - CITY
    )
    :precondition
    ( and ( IN ?p ?a ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( not ( IN ?p ?a ) ) ( PERSON-AT ?p ?c ) )
  )
  ( :action !FLY
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l2 ) )
  )
  ( :action !ZOOM
    :parameters
    (
      ?a - AIRCRAFT
      ?c1 - CITY
      ?c2 - CITY
      ?l1 - FLEVEL
      ?l2 - FLEVEL
      ?l3 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?a ?c1 ) ( FUEL-LEVEL ?a ?l1 ) ( NEXT ?l2 ?l1 ) ( NEXT ?l3 ?l2 ) )
    :effect
    ( and ( not ( AIRCRAFT-AT ?a ?c1 ) ) ( AIRCRAFT-AT ?a ?c2 ) ( not ( FUEL-LEVEL ?a ?l1 ) ) ( FUEL-LEVEL ?a ?l3 ) )
  )
  ( :action !REFUEL
    :parameters
    (
      ?a - AIRCRAFT
      ?c - CITY
      ?l - FLEVEL
      ?l1 - FLEVEL
    )
    :precondition
    ( and ( FUEL-LEVEL ?a ?l ) ( NEXT ?l ?l1 ) ( AIRCRAFT-AT ?a ?c ) )
    :effect
    ( and ( FUEL-LEVEL ?a ?l1 ) ( not ( FUEL-LEVEL ?a ?l ) ) )
  )
  ( :method TRAVEL
    :parameters
    (
      ?p - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-2PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-3PPL-VERIFY
    :parameters
    (
      ?p1 - PERSON
      ?p2 - PERSON
      ?p3 - PERSON
      ?c - CITY
    )
    :precondition
    ( and ( PERSON-AT ?p1 ?c ) ( PERSON-AT ?p2 ?c ) ( PERSON-AT ?p3 ?c ) )
    :subtasks
    (  )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2067 - PERSON
      ?auto_2066 - CITY
    )
    :vars
    (
      ?auto_2068 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_2067 ?auto_2068 ) ( AIRCRAFT-AT ?auto_2068 ?auto_2066 ) )
    :subtasks
    ( ( !DEBARK ?auto_2067 ?auto_2068 ?auto_2066 )
      ( FLY-1PPL-VERIFY ?auto_2067 ?auto_2066 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2079 - PERSON
      ?auto_2078 - CITY
    )
    :vars
    (
      ?auto_2080 - AIRCRAFT
      ?auto_2083 - CITY
      ?auto_2081 - FLEVEL
      ?auto_2082 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_2079 ?auto_2080 ) ( AIRCRAFT-AT ?auto_2080 ?auto_2083 ) ( FUEL-LEVEL ?auto_2080 ?auto_2081 ) ( NEXT ?auto_2082 ?auto_2081 ) ( not ( = ?auto_2078 ?auto_2083 ) ) ( not ( = ?auto_2081 ?auto_2082 ) ) )
    :subtasks
    ( ( !FLY ?auto_2080 ?auto_2083 ?auto_2078 ?auto_2081 ?auto_2082 )
      ( FLY-1PPL ?auto_2079 ?auto_2078 )
      ( FLY-1PPL-VERIFY ?auto_2079 ?auto_2078 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2100 - PERSON
      ?auto_2099 - CITY
    )
    :vars
    (
      ?auto_2102 - AIRCRAFT
      ?auto_2101 - CITY
      ?auto_2103 - FLEVEL
      ?auto_2104 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2102 ?auto_2101 ) ( FUEL-LEVEL ?auto_2102 ?auto_2103 ) ( NEXT ?auto_2104 ?auto_2103 ) ( not ( = ?auto_2099 ?auto_2101 ) ) ( not ( = ?auto_2103 ?auto_2104 ) ) ( PERSON-AT ?auto_2100 ?auto_2101 ) )
    :subtasks
    ( ( !BOARD ?auto_2100 ?auto_2102 ?auto_2101 )
      ( FLY-1PPL ?auto_2100 ?auto_2099 )
      ( FLY-1PPL-VERIFY ?auto_2100 ?auto_2099 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2121 - PERSON
      ?auto_2120 - CITY
    )
    :vars
    (
      ?auto_2122 - AIRCRAFT
      ?auto_2123 - CITY
      ?auto_2125 - FLEVEL
      ?auto_2124 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2122 ?auto_2123 ) ( NEXT ?auto_2125 ?auto_2124 ) ( not ( = ?auto_2120 ?auto_2123 ) ) ( not ( = ?auto_2124 ?auto_2125 ) ) ( PERSON-AT ?auto_2121 ?auto_2123 ) ( FUEL-LEVEL ?auto_2122 ?auto_2125 ) )
    :subtasks
    ( ( !REFUEL ?auto_2122 ?auto_2123 ?auto_2125 ?auto_2124 )
      ( FLY-1PPL ?auto_2121 ?auto_2120 )
      ( FLY-1PPL-VERIFY ?auto_2121 ?auto_2120 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2142 - PERSON
      ?auto_2141 - CITY
    )
    :vars
    (
      ?auto_2143 - FLEVEL
      ?auto_2145 - FLEVEL
      ?auto_2144 - CITY
      ?auto_2146 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2143 ?auto_2145 ) ( not ( = ?auto_2141 ?auto_2144 ) ) ( not ( = ?auto_2145 ?auto_2143 ) ) ( PERSON-AT ?auto_2142 ?auto_2144 ) ( AIRCRAFT-AT ?auto_2146 ?auto_2141 ) ( FUEL-LEVEL ?auto_2146 ?auto_2145 ) )
    :subtasks
    ( ( !FLY ?auto_2146 ?auto_2141 ?auto_2144 ?auto_2145 ?auto_2143 )
      ( FLY-1PPL ?auto_2142 ?auto_2141 )
      ( FLY-1PPL-VERIFY ?auto_2142 ?auto_2141 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2163 - PERSON
      ?auto_2162 - CITY
    )
    :vars
    (
      ?auto_2167 - FLEVEL
      ?auto_2164 - FLEVEL
      ?auto_2166 - CITY
      ?auto_2165 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2167 ?auto_2164 ) ( not ( = ?auto_2162 ?auto_2166 ) ) ( not ( = ?auto_2164 ?auto_2167 ) ) ( PERSON-AT ?auto_2163 ?auto_2166 ) ( AIRCRAFT-AT ?auto_2165 ?auto_2162 ) ( FUEL-LEVEL ?auto_2165 ?auto_2167 ) )
    :subtasks
    ( ( !REFUEL ?auto_2165 ?auto_2162 ?auto_2167 ?auto_2164 )
      ( FLY-1PPL ?auto_2163 ?auto_2162 )
      ( FLY-1PPL-VERIFY ?auto_2163 ?auto_2162 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2226 - PERSON
      ?auto_2227 - PERSON
      ?auto_2225 - CITY
    )
    :vars
    (
      ?auto_2228 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_2227 ?auto_2228 ) ( AIRCRAFT-AT ?auto_2228 ?auto_2225 ) ( PERSON-AT ?auto_2226 ?auto_2225 ) ( not ( = ?auto_2226 ?auto_2227 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2227 ?auto_2225 )
      ( FLY-2PPL-VERIFY ?auto_2226 ?auto_2227 ?auto_2225 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2230 - PERSON
      ?auto_2231 - PERSON
      ?auto_2229 - CITY
    )
    :vars
    (
      ?auto_2232 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_2230 ?auto_2232 ) ( AIRCRAFT-AT ?auto_2232 ?auto_2229 ) ( PERSON-AT ?auto_2231 ?auto_2229 ) ( not ( = ?auto_2230 ?auto_2231 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2230 ?auto_2229 )
      ( FLY-2PPL-VERIFY ?auto_2230 ?auto_2231 ?auto_2229 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2238 - PERSON
      ?auto_2239 - PERSON
      ?auto_2240 - PERSON
      ?auto_2237 - CITY
    )
    :vars
    (
      ?auto_2241 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_2240 ?auto_2241 ) ( AIRCRAFT-AT ?auto_2241 ?auto_2237 ) ( PERSON-AT ?auto_2238 ?auto_2237 ) ( PERSON-AT ?auto_2239 ?auto_2237 ) ( not ( = ?auto_2238 ?auto_2239 ) ) ( not ( = ?auto_2238 ?auto_2240 ) ) ( not ( = ?auto_2239 ?auto_2240 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2240 ?auto_2237 )
      ( FLY-3PPL-VERIFY ?auto_2238 ?auto_2239 ?auto_2240 ?auto_2237 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2243 - PERSON
      ?auto_2244 - PERSON
      ?auto_2245 - PERSON
      ?auto_2242 - CITY
    )
    :vars
    (
      ?auto_2246 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_2244 ?auto_2246 ) ( AIRCRAFT-AT ?auto_2246 ?auto_2242 ) ( PERSON-AT ?auto_2243 ?auto_2242 ) ( PERSON-AT ?auto_2245 ?auto_2242 ) ( not ( = ?auto_2243 ?auto_2244 ) ) ( not ( = ?auto_2243 ?auto_2245 ) ) ( not ( = ?auto_2244 ?auto_2245 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2244 ?auto_2242 )
      ( FLY-3PPL-VERIFY ?auto_2243 ?auto_2244 ?auto_2245 ?auto_2242 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2253 - PERSON
      ?auto_2254 - PERSON
      ?auto_2255 - PERSON
      ?auto_2252 - CITY
    )
    :vars
    (
      ?auto_2256 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_2253 ?auto_2256 ) ( AIRCRAFT-AT ?auto_2256 ?auto_2252 ) ( PERSON-AT ?auto_2254 ?auto_2252 ) ( PERSON-AT ?auto_2255 ?auto_2252 ) ( not ( = ?auto_2253 ?auto_2254 ) ) ( not ( = ?auto_2253 ?auto_2255 ) ) ( not ( = ?auto_2254 ?auto_2255 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2253 ?auto_2252 )
      ( FLY-3PPL-VERIFY ?auto_2253 ?auto_2254 ?auto_2255 ?auto_2252 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2279 - PERSON
      ?auto_2280 - PERSON
      ?auto_2278 - CITY
    )
    :vars
    (
      ?auto_2282 - AIRCRAFT
      ?auto_2281 - CITY
      ?auto_2284 - FLEVEL
      ?auto_2283 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_2280 ?auto_2282 ) ( AIRCRAFT-AT ?auto_2282 ?auto_2281 ) ( FUEL-LEVEL ?auto_2282 ?auto_2284 ) ( NEXT ?auto_2283 ?auto_2284 ) ( not ( = ?auto_2278 ?auto_2281 ) ) ( not ( = ?auto_2284 ?auto_2283 ) ) ( PERSON-AT ?auto_2279 ?auto_2278 ) ( not ( = ?auto_2279 ?auto_2280 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2280 ?auto_2278 )
      ( FLY-2PPL-VERIFY ?auto_2279 ?auto_2280 ?auto_2278 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2286 - PERSON
      ?auto_2287 - PERSON
      ?auto_2285 - CITY
    )
    :vars
    (
      ?auto_2288 - AIRCRAFT
      ?auto_2291 - CITY
      ?auto_2290 - FLEVEL
      ?auto_2289 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_2286 ?auto_2288 ) ( AIRCRAFT-AT ?auto_2288 ?auto_2291 ) ( FUEL-LEVEL ?auto_2288 ?auto_2290 ) ( NEXT ?auto_2289 ?auto_2290 ) ( not ( = ?auto_2285 ?auto_2291 ) ) ( not ( = ?auto_2290 ?auto_2289 ) ) ( PERSON-AT ?auto_2287 ?auto_2285 ) ( not ( = ?auto_2287 ?auto_2286 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2287 ?auto_2286 ?auto_2285 )
      ( FLY-2PPL-VERIFY ?auto_2286 ?auto_2287 ?auto_2285 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2301 - PERSON
      ?auto_2302 - PERSON
      ?auto_2303 - PERSON
      ?auto_2300 - CITY
    )
    :vars
    (
      ?auto_2304 - AIRCRAFT
      ?auto_2307 - CITY
      ?auto_2306 - FLEVEL
      ?auto_2305 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_2303 ?auto_2304 ) ( AIRCRAFT-AT ?auto_2304 ?auto_2307 ) ( FUEL-LEVEL ?auto_2304 ?auto_2306 ) ( NEXT ?auto_2305 ?auto_2306 ) ( not ( = ?auto_2300 ?auto_2307 ) ) ( not ( = ?auto_2306 ?auto_2305 ) ) ( PERSON-AT ?auto_2301 ?auto_2300 ) ( not ( = ?auto_2301 ?auto_2303 ) ) ( PERSON-AT ?auto_2302 ?auto_2300 ) ( not ( = ?auto_2301 ?auto_2302 ) ) ( not ( = ?auto_2302 ?auto_2303 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2301 ?auto_2303 ?auto_2300 )
      ( FLY-3PPL-VERIFY ?auto_2301 ?auto_2302 ?auto_2303 ?auto_2300 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2309 - PERSON
      ?auto_2310 - PERSON
      ?auto_2311 - PERSON
      ?auto_2308 - CITY
    )
    :vars
    (
      ?auto_2312 - AIRCRAFT
      ?auto_2315 - CITY
      ?auto_2314 - FLEVEL
      ?auto_2313 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_2310 ?auto_2312 ) ( AIRCRAFT-AT ?auto_2312 ?auto_2315 ) ( FUEL-LEVEL ?auto_2312 ?auto_2314 ) ( NEXT ?auto_2313 ?auto_2314 ) ( not ( = ?auto_2308 ?auto_2315 ) ) ( not ( = ?auto_2314 ?auto_2313 ) ) ( PERSON-AT ?auto_2311 ?auto_2308 ) ( not ( = ?auto_2311 ?auto_2310 ) ) ( PERSON-AT ?auto_2309 ?auto_2308 ) ( not ( = ?auto_2309 ?auto_2310 ) ) ( not ( = ?auto_2309 ?auto_2311 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2311 ?auto_2310 ?auto_2308 )
      ( FLY-3PPL-VERIFY ?auto_2309 ?auto_2310 ?auto_2311 ?auto_2308 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2325 - PERSON
      ?auto_2326 - PERSON
      ?auto_2327 - PERSON
      ?auto_2324 - CITY
    )
    :vars
    (
      ?auto_2328 - AIRCRAFT
      ?auto_2331 - CITY
      ?auto_2330 - FLEVEL
      ?auto_2329 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_2325 ?auto_2328 ) ( AIRCRAFT-AT ?auto_2328 ?auto_2331 ) ( FUEL-LEVEL ?auto_2328 ?auto_2330 ) ( NEXT ?auto_2329 ?auto_2330 ) ( not ( = ?auto_2324 ?auto_2331 ) ) ( not ( = ?auto_2330 ?auto_2329 ) ) ( PERSON-AT ?auto_2327 ?auto_2324 ) ( not ( = ?auto_2327 ?auto_2325 ) ) ( PERSON-AT ?auto_2326 ?auto_2324 ) ( not ( = ?auto_2325 ?auto_2326 ) ) ( not ( = ?auto_2326 ?auto_2327 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2327 ?auto_2325 ?auto_2324 )
      ( FLY-3PPL-VERIFY ?auto_2325 ?auto_2326 ?auto_2327 ?auto_2324 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2358 - PERSON
      ?auto_2357 - CITY
    )
    :vars
    (
      ?auto_2359 - AIRCRAFT
      ?auto_2363 - CITY
      ?auto_2361 - FLEVEL
      ?auto_2360 - FLEVEL
      ?auto_2362 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2359 ?auto_2363 ) ( FUEL-LEVEL ?auto_2359 ?auto_2361 ) ( NEXT ?auto_2360 ?auto_2361 ) ( not ( = ?auto_2357 ?auto_2363 ) ) ( not ( = ?auto_2361 ?auto_2360 ) ) ( PERSON-AT ?auto_2362 ?auto_2357 ) ( not ( = ?auto_2362 ?auto_2358 ) ) ( PERSON-AT ?auto_2358 ?auto_2363 ) )
    :subtasks
    ( ( !BOARD ?auto_2358 ?auto_2359 ?auto_2363 )
      ( FLY-2PPL ?auto_2362 ?auto_2358 ?auto_2357 )
      ( FLY-1PPL-VERIFY ?auto_2358 ?auto_2357 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2365 - PERSON
      ?auto_2366 - PERSON
      ?auto_2364 - CITY
    )
    :vars
    (
      ?auto_2368 - AIRCRAFT
      ?auto_2370 - CITY
      ?auto_2369 - FLEVEL
      ?auto_2367 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2368 ?auto_2370 ) ( FUEL-LEVEL ?auto_2368 ?auto_2369 ) ( NEXT ?auto_2367 ?auto_2369 ) ( not ( = ?auto_2364 ?auto_2370 ) ) ( not ( = ?auto_2369 ?auto_2367 ) ) ( PERSON-AT ?auto_2365 ?auto_2364 ) ( not ( = ?auto_2365 ?auto_2366 ) ) ( PERSON-AT ?auto_2366 ?auto_2370 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2366 ?auto_2364 )
      ( FLY-2PPL-VERIFY ?auto_2365 ?auto_2366 ?auto_2364 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2372 - PERSON
      ?auto_2373 - PERSON
      ?auto_2371 - CITY
    )
    :vars
    (
      ?auto_2376 - AIRCRAFT
      ?auto_2377 - CITY
      ?auto_2374 - FLEVEL
      ?auto_2375 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2376 ?auto_2377 ) ( FUEL-LEVEL ?auto_2376 ?auto_2374 ) ( NEXT ?auto_2375 ?auto_2374 ) ( not ( = ?auto_2371 ?auto_2377 ) ) ( not ( = ?auto_2374 ?auto_2375 ) ) ( PERSON-AT ?auto_2373 ?auto_2371 ) ( not ( = ?auto_2373 ?auto_2372 ) ) ( PERSON-AT ?auto_2372 ?auto_2377 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2373 ?auto_2372 ?auto_2371 )
      ( FLY-2PPL-VERIFY ?auto_2372 ?auto_2373 ?auto_2371 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2387 - PERSON
      ?auto_2388 - PERSON
      ?auto_2389 - PERSON
      ?auto_2386 - CITY
    )
    :vars
    (
      ?auto_2392 - AIRCRAFT
      ?auto_2393 - CITY
      ?auto_2390 - FLEVEL
      ?auto_2391 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2392 ?auto_2393 ) ( FUEL-LEVEL ?auto_2392 ?auto_2390 ) ( NEXT ?auto_2391 ?auto_2390 ) ( not ( = ?auto_2386 ?auto_2393 ) ) ( not ( = ?auto_2390 ?auto_2391 ) ) ( PERSON-AT ?auto_2387 ?auto_2386 ) ( not ( = ?auto_2387 ?auto_2389 ) ) ( PERSON-AT ?auto_2389 ?auto_2393 ) ( PERSON-AT ?auto_2388 ?auto_2386 ) ( not ( = ?auto_2387 ?auto_2388 ) ) ( not ( = ?auto_2388 ?auto_2389 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2387 ?auto_2389 ?auto_2386 )
      ( FLY-3PPL-VERIFY ?auto_2387 ?auto_2388 ?auto_2389 ?auto_2386 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2395 - PERSON
      ?auto_2396 - PERSON
      ?auto_2397 - PERSON
      ?auto_2394 - CITY
    )
    :vars
    (
      ?auto_2400 - AIRCRAFT
      ?auto_2401 - CITY
      ?auto_2398 - FLEVEL
      ?auto_2399 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2400 ?auto_2401 ) ( FUEL-LEVEL ?auto_2400 ?auto_2398 ) ( NEXT ?auto_2399 ?auto_2398 ) ( not ( = ?auto_2394 ?auto_2401 ) ) ( not ( = ?auto_2398 ?auto_2399 ) ) ( PERSON-AT ?auto_2397 ?auto_2394 ) ( not ( = ?auto_2397 ?auto_2396 ) ) ( PERSON-AT ?auto_2396 ?auto_2401 ) ( PERSON-AT ?auto_2395 ?auto_2394 ) ( not ( = ?auto_2395 ?auto_2396 ) ) ( not ( = ?auto_2395 ?auto_2397 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2397 ?auto_2396 ?auto_2394 )
      ( FLY-3PPL-VERIFY ?auto_2395 ?auto_2396 ?auto_2397 ?auto_2394 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2411 - PERSON
      ?auto_2412 - PERSON
      ?auto_2413 - PERSON
      ?auto_2410 - CITY
    )
    :vars
    (
      ?auto_2416 - AIRCRAFT
      ?auto_2417 - CITY
      ?auto_2414 - FLEVEL
      ?auto_2415 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2416 ?auto_2417 ) ( FUEL-LEVEL ?auto_2416 ?auto_2414 ) ( NEXT ?auto_2415 ?auto_2414 ) ( not ( = ?auto_2410 ?auto_2417 ) ) ( not ( = ?auto_2414 ?auto_2415 ) ) ( PERSON-AT ?auto_2413 ?auto_2410 ) ( not ( = ?auto_2413 ?auto_2411 ) ) ( PERSON-AT ?auto_2411 ?auto_2417 ) ( PERSON-AT ?auto_2412 ?auto_2410 ) ( not ( = ?auto_2411 ?auto_2412 ) ) ( not ( = ?auto_2412 ?auto_2413 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2413 ?auto_2411 ?auto_2410 )
      ( FLY-3PPL-VERIFY ?auto_2411 ?auto_2412 ?auto_2413 ?auto_2410 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2444 - PERSON
      ?auto_2443 - CITY
    )
    :vars
    (
      ?auto_2447 - AIRCRAFT
      ?auto_2449 - CITY
      ?auto_2446 - FLEVEL
      ?auto_2445 - FLEVEL
      ?auto_2448 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2447 ?auto_2449 ) ( NEXT ?auto_2446 ?auto_2445 ) ( not ( = ?auto_2443 ?auto_2449 ) ) ( not ( = ?auto_2445 ?auto_2446 ) ) ( PERSON-AT ?auto_2448 ?auto_2443 ) ( not ( = ?auto_2448 ?auto_2444 ) ) ( PERSON-AT ?auto_2444 ?auto_2449 ) ( FUEL-LEVEL ?auto_2447 ?auto_2446 ) )
    :subtasks
    ( ( !REFUEL ?auto_2447 ?auto_2449 ?auto_2446 ?auto_2445 )
      ( FLY-2PPL ?auto_2448 ?auto_2444 ?auto_2443 )
      ( FLY-1PPL-VERIFY ?auto_2444 ?auto_2443 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2451 - PERSON
      ?auto_2452 - PERSON
      ?auto_2450 - CITY
    )
    :vars
    (
      ?auto_2456 - AIRCRAFT
      ?auto_2454 - CITY
      ?auto_2453 - FLEVEL
      ?auto_2455 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2456 ?auto_2454 ) ( NEXT ?auto_2453 ?auto_2455 ) ( not ( = ?auto_2450 ?auto_2454 ) ) ( not ( = ?auto_2455 ?auto_2453 ) ) ( PERSON-AT ?auto_2451 ?auto_2450 ) ( not ( = ?auto_2451 ?auto_2452 ) ) ( PERSON-AT ?auto_2452 ?auto_2454 ) ( FUEL-LEVEL ?auto_2456 ?auto_2453 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2452 ?auto_2450 )
      ( FLY-2PPL-VERIFY ?auto_2451 ?auto_2452 ?auto_2450 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2458 - PERSON
      ?auto_2459 - PERSON
      ?auto_2457 - CITY
    )
    :vars
    (
      ?auto_2461 - AIRCRAFT
      ?auto_2463 - CITY
      ?auto_2462 - FLEVEL
      ?auto_2460 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2461 ?auto_2463 ) ( NEXT ?auto_2462 ?auto_2460 ) ( not ( = ?auto_2457 ?auto_2463 ) ) ( not ( = ?auto_2460 ?auto_2462 ) ) ( PERSON-AT ?auto_2459 ?auto_2457 ) ( not ( = ?auto_2459 ?auto_2458 ) ) ( PERSON-AT ?auto_2458 ?auto_2463 ) ( FUEL-LEVEL ?auto_2461 ?auto_2462 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2459 ?auto_2458 ?auto_2457 )
      ( FLY-2PPL-VERIFY ?auto_2458 ?auto_2459 ?auto_2457 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2473 - PERSON
      ?auto_2474 - PERSON
      ?auto_2475 - PERSON
      ?auto_2472 - CITY
    )
    :vars
    (
      ?auto_2477 - AIRCRAFT
      ?auto_2479 - CITY
      ?auto_2478 - FLEVEL
      ?auto_2476 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2477 ?auto_2479 ) ( NEXT ?auto_2478 ?auto_2476 ) ( not ( = ?auto_2472 ?auto_2479 ) ) ( not ( = ?auto_2476 ?auto_2478 ) ) ( PERSON-AT ?auto_2473 ?auto_2472 ) ( not ( = ?auto_2473 ?auto_2475 ) ) ( PERSON-AT ?auto_2475 ?auto_2479 ) ( FUEL-LEVEL ?auto_2477 ?auto_2478 ) ( PERSON-AT ?auto_2474 ?auto_2472 ) ( not ( = ?auto_2473 ?auto_2474 ) ) ( not ( = ?auto_2474 ?auto_2475 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2473 ?auto_2475 ?auto_2472 )
      ( FLY-3PPL-VERIFY ?auto_2473 ?auto_2474 ?auto_2475 ?auto_2472 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2481 - PERSON
      ?auto_2482 - PERSON
      ?auto_2483 - PERSON
      ?auto_2480 - CITY
    )
    :vars
    (
      ?auto_2485 - AIRCRAFT
      ?auto_2487 - CITY
      ?auto_2486 - FLEVEL
      ?auto_2484 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2485 ?auto_2487 ) ( NEXT ?auto_2486 ?auto_2484 ) ( not ( = ?auto_2480 ?auto_2487 ) ) ( not ( = ?auto_2484 ?auto_2486 ) ) ( PERSON-AT ?auto_2481 ?auto_2480 ) ( not ( = ?auto_2481 ?auto_2482 ) ) ( PERSON-AT ?auto_2482 ?auto_2487 ) ( FUEL-LEVEL ?auto_2485 ?auto_2486 ) ( PERSON-AT ?auto_2483 ?auto_2480 ) ( not ( = ?auto_2481 ?auto_2483 ) ) ( not ( = ?auto_2482 ?auto_2483 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2481 ?auto_2482 ?auto_2480 )
      ( FLY-3PPL-VERIFY ?auto_2481 ?auto_2482 ?auto_2483 ?auto_2480 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2497 - PERSON
      ?auto_2498 - PERSON
      ?auto_2499 - PERSON
      ?auto_2496 - CITY
    )
    :vars
    (
      ?auto_2501 - AIRCRAFT
      ?auto_2503 - CITY
      ?auto_2502 - FLEVEL
      ?auto_2500 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2501 ?auto_2503 ) ( NEXT ?auto_2502 ?auto_2500 ) ( not ( = ?auto_2496 ?auto_2503 ) ) ( not ( = ?auto_2500 ?auto_2502 ) ) ( PERSON-AT ?auto_2499 ?auto_2496 ) ( not ( = ?auto_2499 ?auto_2497 ) ) ( PERSON-AT ?auto_2497 ?auto_2503 ) ( FUEL-LEVEL ?auto_2501 ?auto_2502 ) ( PERSON-AT ?auto_2498 ?auto_2496 ) ( not ( = ?auto_2497 ?auto_2498 ) ) ( not ( = ?auto_2498 ?auto_2499 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2499 ?auto_2497 ?auto_2496 )
      ( FLY-3PPL-VERIFY ?auto_2497 ?auto_2498 ?auto_2499 ?auto_2496 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2530 - PERSON
      ?auto_2529 - CITY
    )
    :vars
    (
      ?auto_2533 - FLEVEL
      ?auto_2531 - FLEVEL
      ?auto_2534 - CITY
      ?auto_2535 - PERSON
      ?auto_2532 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2533 ?auto_2531 ) ( not ( = ?auto_2529 ?auto_2534 ) ) ( not ( = ?auto_2531 ?auto_2533 ) ) ( PERSON-AT ?auto_2535 ?auto_2529 ) ( not ( = ?auto_2535 ?auto_2530 ) ) ( PERSON-AT ?auto_2530 ?auto_2534 ) ( AIRCRAFT-AT ?auto_2532 ?auto_2529 ) ( FUEL-LEVEL ?auto_2532 ?auto_2531 ) )
    :subtasks
    ( ( !FLY ?auto_2532 ?auto_2529 ?auto_2534 ?auto_2531 ?auto_2533 )
      ( FLY-2PPL ?auto_2535 ?auto_2530 ?auto_2529 )
      ( FLY-1PPL-VERIFY ?auto_2530 ?auto_2529 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2537 - PERSON
      ?auto_2538 - PERSON
      ?auto_2536 - CITY
    )
    :vars
    (
      ?auto_2539 - FLEVEL
      ?auto_2542 - FLEVEL
      ?auto_2541 - CITY
      ?auto_2540 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2539 ?auto_2542 ) ( not ( = ?auto_2536 ?auto_2541 ) ) ( not ( = ?auto_2542 ?auto_2539 ) ) ( PERSON-AT ?auto_2537 ?auto_2536 ) ( not ( = ?auto_2537 ?auto_2538 ) ) ( PERSON-AT ?auto_2538 ?auto_2541 ) ( AIRCRAFT-AT ?auto_2540 ?auto_2536 ) ( FUEL-LEVEL ?auto_2540 ?auto_2542 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2538 ?auto_2536 )
      ( FLY-2PPL-VERIFY ?auto_2537 ?auto_2538 ?auto_2536 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2544 - PERSON
      ?auto_2545 - PERSON
      ?auto_2543 - CITY
    )
    :vars
    (
      ?auto_2546 - FLEVEL
      ?auto_2548 - FLEVEL
      ?auto_2547 - CITY
      ?auto_2549 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2546 ?auto_2548 ) ( not ( = ?auto_2543 ?auto_2547 ) ) ( not ( = ?auto_2548 ?auto_2546 ) ) ( PERSON-AT ?auto_2545 ?auto_2543 ) ( not ( = ?auto_2545 ?auto_2544 ) ) ( PERSON-AT ?auto_2544 ?auto_2547 ) ( AIRCRAFT-AT ?auto_2549 ?auto_2543 ) ( FUEL-LEVEL ?auto_2549 ?auto_2548 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2545 ?auto_2544 ?auto_2543 )
      ( FLY-2PPL-VERIFY ?auto_2544 ?auto_2545 ?auto_2543 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2559 - PERSON
      ?auto_2560 - PERSON
      ?auto_2561 - PERSON
      ?auto_2558 - CITY
    )
    :vars
    (
      ?auto_2562 - FLEVEL
      ?auto_2564 - FLEVEL
      ?auto_2563 - CITY
      ?auto_2565 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2562 ?auto_2564 ) ( not ( = ?auto_2558 ?auto_2563 ) ) ( not ( = ?auto_2564 ?auto_2562 ) ) ( PERSON-AT ?auto_2559 ?auto_2558 ) ( not ( = ?auto_2559 ?auto_2561 ) ) ( PERSON-AT ?auto_2561 ?auto_2563 ) ( AIRCRAFT-AT ?auto_2565 ?auto_2558 ) ( FUEL-LEVEL ?auto_2565 ?auto_2564 ) ( PERSON-AT ?auto_2560 ?auto_2558 ) ( not ( = ?auto_2559 ?auto_2560 ) ) ( not ( = ?auto_2560 ?auto_2561 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2559 ?auto_2561 ?auto_2558 )
      ( FLY-3PPL-VERIFY ?auto_2559 ?auto_2560 ?auto_2561 ?auto_2558 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2567 - PERSON
      ?auto_2568 - PERSON
      ?auto_2569 - PERSON
      ?auto_2566 - CITY
    )
    :vars
    (
      ?auto_2570 - FLEVEL
      ?auto_2572 - FLEVEL
      ?auto_2571 - CITY
      ?auto_2573 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2570 ?auto_2572 ) ( not ( = ?auto_2566 ?auto_2571 ) ) ( not ( = ?auto_2572 ?auto_2570 ) ) ( PERSON-AT ?auto_2569 ?auto_2566 ) ( not ( = ?auto_2569 ?auto_2568 ) ) ( PERSON-AT ?auto_2568 ?auto_2571 ) ( AIRCRAFT-AT ?auto_2573 ?auto_2566 ) ( FUEL-LEVEL ?auto_2573 ?auto_2572 ) ( PERSON-AT ?auto_2567 ?auto_2566 ) ( not ( = ?auto_2567 ?auto_2568 ) ) ( not ( = ?auto_2567 ?auto_2569 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2569 ?auto_2568 ?auto_2566 )
      ( FLY-3PPL-VERIFY ?auto_2567 ?auto_2568 ?auto_2569 ?auto_2566 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2583 - PERSON
      ?auto_2584 - PERSON
      ?auto_2585 - PERSON
      ?auto_2582 - CITY
    )
    :vars
    (
      ?auto_2586 - FLEVEL
      ?auto_2588 - FLEVEL
      ?auto_2587 - CITY
      ?auto_2589 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2586 ?auto_2588 ) ( not ( = ?auto_2582 ?auto_2587 ) ) ( not ( = ?auto_2588 ?auto_2586 ) ) ( PERSON-AT ?auto_2585 ?auto_2582 ) ( not ( = ?auto_2585 ?auto_2583 ) ) ( PERSON-AT ?auto_2583 ?auto_2587 ) ( AIRCRAFT-AT ?auto_2589 ?auto_2582 ) ( FUEL-LEVEL ?auto_2589 ?auto_2588 ) ( PERSON-AT ?auto_2584 ?auto_2582 ) ( not ( = ?auto_2583 ?auto_2584 ) ) ( not ( = ?auto_2584 ?auto_2585 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2585 ?auto_2583 ?auto_2582 )
      ( FLY-3PPL-VERIFY ?auto_2583 ?auto_2584 ?auto_2585 ?auto_2582 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2616 - PERSON
      ?auto_2615 - CITY
    )
    :vars
    (
      ?auto_2617 - FLEVEL
      ?auto_2619 - FLEVEL
      ?auto_2618 - CITY
      ?auto_2621 - PERSON
      ?auto_2620 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2617 ?auto_2619 ) ( not ( = ?auto_2615 ?auto_2618 ) ) ( not ( = ?auto_2619 ?auto_2617 ) ) ( PERSON-AT ?auto_2621 ?auto_2615 ) ( not ( = ?auto_2621 ?auto_2616 ) ) ( PERSON-AT ?auto_2616 ?auto_2618 ) ( AIRCRAFT-AT ?auto_2620 ?auto_2615 ) ( FUEL-LEVEL ?auto_2620 ?auto_2617 ) )
    :subtasks
    ( ( !REFUEL ?auto_2620 ?auto_2615 ?auto_2617 ?auto_2619 )
      ( FLY-2PPL ?auto_2621 ?auto_2616 ?auto_2615 )
      ( FLY-1PPL-VERIFY ?auto_2616 ?auto_2615 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2623 - PERSON
      ?auto_2624 - PERSON
      ?auto_2622 - CITY
    )
    :vars
    (
      ?auto_2628 - FLEVEL
      ?auto_2627 - FLEVEL
      ?auto_2626 - CITY
      ?auto_2625 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2628 ?auto_2627 ) ( not ( = ?auto_2622 ?auto_2626 ) ) ( not ( = ?auto_2627 ?auto_2628 ) ) ( PERSON-AT ?auto_2623 ?auto_2622 ) ( not ( = ?auto_2623 ?auto_2624 ) ) ( PERSON-AT ?auto_2624 ?auto_2626 ) ( AIRCRAFT-AT ?auto_2625 ?auto_2622 ) ( FUEL-LEVEL ?auto_2625 ?auto_2628 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2624 ?auto_2622 )
      ( FLY-2PPL-VERIFY ?auto_2623 ?auto_2624 ?auto_2622 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2630 - PERSON
      ?auto_2631 - PERSON
      ?auto_2629 - CITY
    )
    :vars
    (
      ?auto_2634 - FLEVEL
      ?auto_2635 - FLEVEL
      ?auto_2632 - CITY
      ?auto_2633 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2634 ?auto_2635 ) ( not ( = ?auto_2629 ?auto_2632 ) ) ( not ( = ?auto_2635 ?auto_2634 ) ) ( PERSON-AT ?auto_2631 ?auto_2629 ) ( not ( = ?auto_2631 ?auto_2630 ) ) ( PERSON-AT ?auto_2630 ?auto_2632 ) ( AIRCRAFT-AT ?auto_2633 ?auto_2629 ) ( FUEL-LEVEL ?auto_2633 ?auto_2634 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2631 ?auto_2630 ?auto_2629 )
      ( FLY-2PPL-VERIFY ?auto_2630 ?auto_2631 ?auto_2629 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2645 - PERSON
      ?auto_2646 - PERSON
      ?auto_2647 - PERSON
      ?auto_2644 - CITY
    )
    :vars
    (
      ?auto_2650 - FLEVEL
      ?auto_2651 - FLEVEL
      ?auto_2648 - CITY
      ?auto_2649 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2650 ?auto_2651 ) ( not ( = ?auto_2644 ?auto_2648 ) ) ( not ( = ?auto_2651 ?auto_2650 ) ) ( PERSON-AT ?auto_2645 ?auto_2644 ) ( not ( = ?auto_2645 ?auto_2647 ) ) ( PERSON-AT ?auto_2647 ?auto_2648 ) ( AIRCRAFT-AT ?auto_2649 ?auto_2644 ) ( FUEL-LEVEL ?auto_2649 ?auto_2650 ) ( PERSON-AT ?auto_2646 ?auto_2644 ) ( not ( = ?auto_2645 ?auto_2646 ) ) ( not ( = ?auto_2646 ?auto_2647 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2645 ?auto_2647 ?auto_2644 )
      ( FLY-3PPL-VERIFY ?auto_2645 ?auto_2646 ?auto_2647 ?auto_2644 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2653 - PERSON
      ?auto_2654 - PERSON
      ?auto_2655 - PERSON
      ?auto_2652 - CITY
    )
    :vars
    (
      ?auto_2658 - FLEVEL
      ?auto_2659 - FLEVEL
      ?auto_2656 - CITY
      ?auto_2657 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2658 ?auto_2659 ) ( not ( = ?auto_2652 ?auto_2656 ) ) ( not ( = ?auto_2659 ?auto_2658 ) ) ( PERSON-AT ?auto_2655 ?auto_2652 ) ( not ( = ?auto_2655 ?auto_2654 ) ) ( PERSON-AT ?auto_2654 ?auto_2656 ) ( AIRCRAFT-AT ?auto_2657 ?auto_2652 ) ( FUEL-LEVEL ?auto_2657 ?auto_2658 ) ( PERSON-AT ?auto_2653 ?auto_2652 ) ( not ( = ?auto_2653 ?auto_2654 ) ) ( not ( = ?auto_2653 ?auto_2655 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2655 ?auto_2654 ?auto_2652 )
      ( FLY-3PPL-VERIFY ?auto_2653 ?auto_2654 ?auto_2655 ?auto_2652 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2669 - PERSON
      ?auto_2670 - PERSON
      ?auto_2671 - PERSON
      ?auto_2668 - CITY
    )
    :vars
    (
      ?auto_2674 - FLEVEL
      ?auto_2675 - FLEVEL
      ?auto_2672 - CITY
      ?auto_2673 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2674 ?auto_2675 ) ( not ( = ?auto_2668 ?auto_2672 ) ) ( not ( = ?auto_2675 ?auto_2674 ) ) ( PERSON-AT ?auto_2671 ?auto_2668 ) ( not ( = ?auto_2671 ?auto_2669 ) ) ( PERSON-AT ?auto_2669 ?auto_2672 ) ( AIRCRAFT-AT ?auto_2673 ?auto_2668 ) ( FUEL-LEVEL ?auto_2673 ?auto_2674 ) ( PERSON-AT ?auto_2670 ?auto_2668 ) ( not ( = ?auto_2669 ?auto_2670 ) ) ( not ( = ?auto_2670 ?auto_2671 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2671 ?auto_2669 ?auto_2668 )
      ( FLY-3PPL-VERIFY ?auto_2669 ?auto_2670 ?auto_2671 ?auto_2668 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2702 - PERSON
      ?auto_2701 - CITY
    )
    :vars
    (
      ?auto_2705 - FLEVEL
      ?auto_2706 - FLEVEL
      ?auto_2703 - CITY
      ?auto_2707 - PERSON
      ?auto_2704 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2705 ?auto_2706 ) ( not ( = ?auto_2701 ?auto_2703 ) ) ( not ( = ?auto_2706 ?auto_2705 ) ) ( not ( = ?auto_2707 ?auto_2702 ) ) ( PERSON-AT ?auto_2702 ?auto_2703 ) ( AIRCRAFT-AT ?auto_2704 ?auto_2701 ) ( FUEL-LEVEL ?auto_2704 ?auto_2705 ) ( IN ?auto_2707 ?auto_2704 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2707 ?auto_2701 )
      ( FLY-2PPL ?auto_2707 ?auto_2702 ?auto_2701 )
      ( FLY-1PPL-VERIFY ?auto_2702 ?auto_2701 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2709 - PERSON
      ?auto_2710 - PERSON
      ?auto_2708 - CITY
    )
    :vars
    (
      ?auto_2713 - FLEVEL
      ?auto_2712 - FLEVEL
      ?auto_2711 - CITY
      ?auto_2714 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2713 ?auto_2712 ) ( not ( = ?auto_2708 ?auto_2711 ) ) ( not ( = ?auto_2712 ?auto_2713 ) ) ( not ( = ?auto_2709 ?auto_2710 ) ) ( PERSON-AT ?auto_2710 ?auto_2711 ) ( AIRCRAFT-AT ?auto_2714 ?auto_2708 ) ( FUEL-LEVEL ?auto_2714 ?auto_2713 ) ( IN ?auto_2709 ?auto_2714 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2710 ?auto_2708 )
      ( FLY-2PPL-VERIFY ?auto_2709 ?auto_2710 ?auto_2708 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2716 - PERSON
      ?auto_2717 - PERSON
      ?auto_2715 - CITY
    )
    :vars
    (
      ?auto_2719 - FLEVEL
      ?auto_2721 - FLEVEL
      ?auto_2718 - CITY
      ?auto_2720 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2719 ?auto_2721 ) ( not ( = ?auto_2715 ?auto_2718 ) ) ( not ( = ?auto_2721 ?auto_2719 ) ) ( not ( = ?auto_2717 ?auto_2716 ) ) ( PERSON-AT ?auto_2716 ?auto_2718 ) ( AIRCRAFT-AT ?auto_2720 ?auto_2715 ) ( FUEL-LEVEL ?auto_2720 ?auto_2719 ) ( IN ?auto_2717 ?auto_2720 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2717 ?auto_2716 ?auto_2715 )
      ( FLY-2PPL-VERIFY ?auto_2716 ?auto_2717 ?auto_2715 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2788 - PERSON
      ?auto_2787 - CITY
    )
    :vars
    (
      ?auto_2790 - FLEVEL
      ?auto_2792 - FLEVEL
      ?auto_2789 - CITY
      ?auto_2793 - PERSON
      ?auto_2791 - AIRCRAFT
      ?auto_2794 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_2790 ?auto_2792 ) ( not ( = ?auto_2787 ?auto_2789 ) ) ( not ( = ?auto_2792 ?auto_2790 ) ) ( not ( = ?auto_2793 ?auto_2788 ) ) ( PERSON-AT ?auto_2788 ?auto_2789 ) ( IN ?auto_2793 ?auto_2791 ) ( AIRCRAFT-AT ?auto_2791 ?auto_2794 ) ( FUEL-LEVEL ?auto_2791 ?auto_2792 ) ( not ( = ?auto_2787 ?auto_2794 ) ) ( not ( = ?auto_2789 ?auto_2794 ) ) )
    :subtasks
    ( ( !FLY ?auto_2791 ?auto_2794 ?auto_2787 ?auto_2792 ?auto_2790 )
      ( FLY-2PPL ?auto_2793 ?auto_2788 ?auto_2787 )
      ( FLY-1PPL-VERIFY ?auto_2788 ?auto_2787 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2796 - PERSON
      ?auto_2797 - PERSON
      ?auto_2795 - CITY
    )
    :vars
    (
      ?auto_2800 - FLEVEL
      ?auto_2799 - FLEVEL
      ?auto_2798 - CITY
      ?auto_2801 - AIRCRAFT
      ?auto_2802 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_2800 ?auto_2799 ) ( not ( = ?auto_2795 ?auto_2798 ) ) ( not ( = ?auto_2799 ?auto_2800 ) ) ( not ( = ?auto_2796 ?auto_2797 ) ) ( PERSON-AT ?auto_2797 ?auto_2798 ) ( IN ?auto_2796 ?auto_2801 ) ( AIRCRAFT-AT ?auto_2801 ?auto_2802 ) ( FUEL-LEVEL ?auto_2801 ?auto_2799 ) ( not ( = ?auto_2795 ?auto_2802 ) ) ( not ( = ?auto_2798 ?auto_2802 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2797 ?auto_2795 )
      ( FLY-2PPL-VERIFY ?auto_2796 ?auto_2797 ?auto_2795 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2804 - PERSON
      ?auto_2805 - PERSON
      ?auto_2803 - CITY
    )
    :vars
    (
      ?auto_2808 - FLEVEL
      ?auto_2809 - FLEVEL
      ?auto_2806 - CITY
      ?auto_2807 - AIRCRAFT
      ?auto_2810 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_2808 ?auto_2809 ) ( not ( = ?auto_2803 ?auto_2806 ) ) ( not ( = ?auto_2809 ?auto_2808 ) ) ( not ( = ?auto_2805 ?auto_2804 ) ) ( PERSON-AT ?auto_2804 ?auto_2806 ) ( IN ?auto_2805 ?auto_2807 ) ( AIRCRAFT-AT ?auto_2807 ?auto_2810 ) ( FUEL-LEVEL ?auto_2807 ?auto_2809 ) ( not ( = ?auto_2803 ?auto_2810 ) ) ( not ( = ?auto_2806 ?auto_2810 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2805 ?auto_2804 ?auto_2803 )
      ( FLY-2PPL-VERIFY ?auto_2804 ?auto_2805 ?auto_2803 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2885 - PERSON
      ?auto_2884 - CITY
    )
    :vars
    (
      ?auto_2888 - FLEVEL
      ?auto_2889 - FLEVEL
      ?auto_2886 - CITY
      ?auto_2891 - PERSON
      ?auto_2887 - AIRCRAFT
      ?auto_2890 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_2888 ?auto_2889 ) ( not ( = ?auto_2884 ?auto_2886 ) ) ( not ( = ?auto_2889 ?auto_2888 ) ) ( not ( = ?auto_2891 ?auto_2885 ) ) ( PERSON-AT ?auto_2885 ?auto_2886 ) ( AIRCRAFT-AT ?auto_2887 ?auto_2890 ) ( FUEL-LEVEL ?auto_2887 ?auto_2889 ) ( not ( = ?auto_2884 ?auto_2890 ) ) ( not ( = ?auto_2886 ?auto_2890 ) ) ( PERSON-AT ?auto_2891 ?auto_2890 ) )
    :subtasks
    ( ( !BOARD ?auto_2891 ?auto_2887 ?auto_2890 )
      ( FLY-2PPL ?auto_2891 ?auto_2885 ?auto_2884 )
      ( FLY-1PPL-VERIFY ?auto_2885 ?auto_2884 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2893 - PERSON
      ?auto_2894 - PERSON
      ?auto_2892 - CITY
    )
    :vars
    (
      ?auto_2899 - FLEVEL
      ?auto_2895 - FLEVEL
      ?auto_2897 - CITY
      ?auto_2896 - AIRCRAFT
      ?auto_2898 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_2899 ?auto_2895 ) ( not ( = ?auto_2892 ?auto_2897 ) ) ( not ( = ?auto_2895 ?auto_2899 ) ) ( not ( = ?auto_2893 ?auto_2894 ) ) ( PERSON-AT ?auto_2894 ?auto_2897 ) ( AIRCRAFT-AT ?auto_2896 ?auto_2898 ) ( FUEL-LEVEL ?auto_2896 ?auto_2895 ) ( not ( = ?auto_2892 ?auto_2898 ) ) ( not ( = ?auto_2897 ?auto_2898 ) ) ( PERSON-AT ?auto_2893 ?auto_2898 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2894 ?auto_2892 )
      ( FLY-2PPL-VERIFY ?auto_2893 ?auto_2894 ?auto_2892 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2901 - PERSON
      ?auto_2902 - PERSON
      ?auto_2900 - CITY
    )
    :vars
    (
      ?auto_2906 - FLEVEL
      ?auto_2903 - FLEVEL
      ?auto_2907 - CITY
      ?auto_2905 - AIRCRAFT
      ?auto_2904 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_2906 ?auto_2903 ) ( not ( = ?auto_2900 ?auto_2907 ) ) ( not ( = ?auto_2903 ?auto_2906 ) ) ( not ( = ?auto_2902 ?auto_2901 ) ) ( PERSON-AT ?auto_2901 ?auto_2907 ) ( AIRCRAFT-AT ?auto_2905 ?auto_2904 ) ( FUEL-LEVEL ?auto_2905 ?auto_2903 ) ( not ( = ?auto_2900 ?auto_2904 ) ) ( not ( = ?auto_2907 ?auto_2904 ) ) ( PERSON-AT ?auto_2902 ?auto_2904 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2902 ?auto_2901 ?auto_2900 )
      ( FLY-2PPL-VERIFY ?auto_2901 ?auto_2902 ?auto_2900 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2982 - PERSON
      ?auto_2981 - CITY
    )
    :vars
    (
      ?auto_2986 - FLEVEL
      ?auto_2983 - FLEVEL
      ?auto_2987 - CITY
      ?auto_2988 - PERSON
      ?auto_2985 - AIRCRAFT
      ?auto_2984 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_2986 ?auto_2983 ) ( not ( = ?auto_2981 ?auto_2987 ) ) ( not ( = ?auto_2983 ?auto_2986 ) ) ( not ( = ?auto_2988 ?auto_2982 ) ) ( PERSON-AT ?auto_2982 ?auto_2987 ) ( AIRCRAFT-AT ?auto_2985 ?auto_2984 ) ( not ( = ?auto_2981 ?auto_2984 ) ) ( not ( = ?auto_2987 ?auto_2984 ) ) ( PERSON-AT ?auto_2988 ?auto_2984 ) ( FUEL-LEVEL ?auto_2985 ?auto_2986 ) )
    :subtasks
    ( ( !REFUEL ?auto_2985 ?auto_2984 ?auto_2986 ?auto_2983 )
      ( FLY-2PPL ?auto_2988 ?auto_2982 ?auto_2981 )
      ( FLY-1PPL-VERIFY ?auto_2982 ?auto_2981 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2990 - PERSON
      ?auto_2991 - PERSON
      ?auto_2989 - CITY
    )
    :vars
    (
      ?auto_2996 - FLEVEL
      ?auto_2995 - FLEVEL
      ?auto_2993 - CITY
      ?auto_2992 - AIRCRAFT
      ?auto_2994 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_2996 ?auto_2995 ) ( not ( = ?auto_2989 ?auto_2993 ) ) ( not ( = ?auto_2995 ?auto_2996 ) ) ( not ( = ?auto_2990 ?auto_2991 ) ) ( PERSON-AT ?auto_2991 ?auto_2993 ) ( AIRCRAFT-AT ?auto_2992 ?auto_2994 ) ( not ( = ?auto_2989 ?auto_2994 ) ) ( not ( = ?auto_2993 ?auto_2994 ) ) ( PERSON-AT ?auto_2990 ?auto_2994 ) ( FUEL-LEVEL ?auto_2992 ?auto_2996 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2991 ?auto_2989 )
      ( FLY-2PPL-VERIFY ?auto_2990 ?auto_2991 ?auto_2989 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2998 - PERSON
      ?auto_2999 - PERSON
      ?auto_2997 - CITY
    )
    :vars
    (
      ?auto_3004 - FLEVEL
      ?auto_3001 - FLEVEL
      ?auto_3003 - CITY
      ?auto_3000 - AIRCRAFT
      ?auto_3002 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_3004 ?auto_3001 ) ( not ( = ?auto_2997 ?auto_3003 ) ) ( not ( = ?auto_3001 ?auto_3004 ) ) ( not ( = ?auto_2999 ?auto_2998 ) ) ( PERSON-AT ?auto_2998 ?auto_3003 ) ( AIRCRAFT-AT ?auto_3000 ?auto_3002 ) ( not ( = ?auto_2997 ?auto_3002 ) ) ( not ( = ?auto_3003 ?auto_3002 ) ) ( PERSON-AT ?auto_2999 ?auto_3002 ) ( FUEL-LEVEL ?auto_3000 ?auto_3004 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2999 ?auto_2998 ?auto_2997 )
      ( FLY-2PPL-VERIFY ?auto_2998 ?auto_2999 ?auto_2997 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3474 - PERSON
      ?auto_3475 - PERSON
      ?auto_3476 - PERSON
      ?auto_3473 - CITY
    )
    :vars
    (
      ?auto_3477 - AIRCRAFT
      ?auto_3480 - CITY
      ?auto_3479 - FLEVEL
      ?auto_3478 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_3476 ?auto_3477 ) ( AIRCRAFT-AT ?auto_3477 ?auto_3480 ) ( FUEL-LEVEL ?auto_3477 ?auto_3479 ) ( NEXT ?auto_3478 ?auto_3479 ) ( not ( = ?auto_3473 ?auto_3480 ) ) ( not ( = ?auto_3479 ?auto_3478 ) ) ( PERSON-AT ?auto_3475 ?auto_3473 ) ( not ( = ?auto_3475 ?auto_3476 ) ) ( PERSON-AT ?auto_3474 ?auto_3473 ) ( not ( = ?auto_3474 ?auto_3475 ) ) ( not ( = ?auto_3474 ?auto_3476 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3475 ?auto_3476 ?auto_3473 )
      ( FLY-3PPL-VERIFY ?auto_3474 ?auto_3475 ?auto_3476 ?auto_3473 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3486 - PERSON
      ?auto_3487 - PERSON
      ?auto_3488 - PERSON
      ?auto_3485 - CITY
    )
    :vars
    (
      ?auto_3489 - AIRCRAFT
      ?auto_3492 - CITY
      ?auto_3491 - FLEVEL
      ?auto_3490 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_3487 ?auto_3489 ) ( AIRCRAFT-AT ?auto_3489 ?auto_3492 ) ( FUEL-LEVEL ?auto_3489 ?auto_3491 ) ( NEXT ?auto_3490 ?auto_3491 ) ( not ( = ?auto_3485 ?auto_3492 ) ) ( not ( = ?auto_3491 ?auto_3490 ) ) ( PERSON-AT ?auto_3486 ?auto_3485 ) ( not ( = ?auto_3486 ?auto_3487 ) ) ( PERSON-AT ?auto_3488 ?auto_3485 ) ( not ( = ?auto_3486 ?auto_3488 ) ) ( not ( = ?auto_3487 ?auto_3488 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3486 ?auto_3487 ?auto_3485 )
      ( FLY-3PPL-VERIFY ?auto_3486 ?auto_3487 ?auto_3488 ?auto_3485 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3510 - PERSON
      ?auto_3511 - PERSON
      ?auto_3512 - PERSON
      ?auto_3509 - CITY
    )
    :vars
    (
      ?auto_3513 - AIRCRAFT
      ?auto_3517 - CITY
      ?auto_3516 - FLEVEL
      ?auto_3514 - FLEVEL
      ?auto_3515 - PERSON
    )
    :precondition
    ( and ( IN ?auto_3512 ?auto_3513 ) ( AIRCRAFT-AT ?auto_3513 ?auto_3517 ) ( FUEL-LEVEL ?auto_3513 ?auto_3516 ) ( NEXT ?auto_3514 ?auto_3516 ) ( not ( = ?auto_3509 ?auto_3517 ) ) ( not ( = ?auto_3516 ?auto_3514 ) ) ( PERSON-AT ?auto_3515 ?auto_3509 ) ( not ( = ?auto_3515 ?auto_3512 ) ) ( PERSON-AT ?auto_3510 ?auto_3509 ) ( PERSON-AT ?auto_3511 ?auto_3509 ) ( not ( = ?auto_3510 ?auto_3511 ) ) ( not ( = ?auto_3510 ?auto_3512 ) ) ( not ( = ?auto_3510 ?auto_3515 ) ) ( not ( = ?auto_3511 ?auto_3512 ) ) ( not ( = ?auto_3511 ?auto_3515 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3515 ?auto_3512 ?auto_3509 )
      ( FLY-3PPL-VERIFY ?auto_3510 ?auto_3511 ?auto_3512 ?auto_3509 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3523 - PERSON
      ?auto_3524 - PERSON
      ?auto_3525 - PERSON
      ?auto_3522 - CITY
    )
    :vars
    (
      ?auto_3526 - AIRCRAFT
      ?auto_3530 - CITY
      ?auto_3529 - FLEVEL
      ?auto_3527 - FLEVEL
      ?auto_3528 - PERSON
    )
    :precondition
    ( and ( IN ?auto_3524 ?auto_3526 ) ( AIRCRAFT-AT ?auto_3526 ?auto_3530 ) ( FUEL-LEVEL ?auto_3526 ?auto_3529 ) ( NEXT ?auto_3527 ?auto_3529 ) ( not ( = ?auto_3522 ?auto_3530 ) ) ( not ( = ?auto_3529 ?auto_3527 ) ) ( PERSON-AT ?auto_3528 ?auto_3522 ) ( not ( = ?auto_3528 ?auto_3524 ) ) ( PERSON-AT ?auto_3523 ?auto_3522 ) ( PERSON-AT ?auto_3525 ?auto_3522 ) ( not ( = ?auto_3523 ?auto_3524 ) ) ( not ( = ?auto_3523 ?auto_3525 ) ) ( not ( = ?auto_3523 ?auto_3528 ) ) ( not ( = ?auto_3524 ?auto_3525 ) ) ( not ( = ?auto_3525 ?auto_3528 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3528 ?auto_3524 ?auto_3522 )
      ( FLY-3PPL-VERIFY ?auto_3523 ?auto_3524 ?auto_3525 ?auto_3522 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3541 - PERSON
      ?auto_3542 - PERSON
      ?auto_3543 - PERSON
      ?auto_3540 - CITY
    )
    :vars
    (
      ?auto_3544 - AIRCRAFT
      ?auto_3547 - CITY
      ?auto_3546 - FLEVEL
      ?auto_3545 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_3541 ?auto_3544 ) ( AIRCRAFT-AT ?auto_3544 ?auto_3547 ) ( FUEL-LEVEL ?auto_3544 ?auto_3546 ) ( NEXT ?auto_3545 ?auto_3546 ) ( not ( = ?auto_3540 ?auto_3547 ) ) ( not ( = ?auto_3546 ?auto_3545 ) ) ( PERSON-AT ?auto_3542 ?auto_3540 ) ( not ( = ?auto_3542 ?auto_3541 ) ) ( PERSON-AT ?auto_3543 ?auto_3540 ) ( not ( = ?auto_3541 ?auto_3543 ) ) ( not ( = ?auto_3542 ?auto_3543 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3542 ?auto_3541 ?auto_3540 )
      ( FLY-3PPL-VERIFY ?auto_3541 ?auto_3542 ?auto_3543 ?auto_3540 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3565 - PERSON
      ?auto_3566 - PERSON
      ?auto_3567 - PERSON
      ?auto_3564 - CITY
    )
    :vars
    (
      ?auto_3568 - AIRCRAFT
      ?auto_3572 - CITY
      ?auto_3571 - FLEVEL
      ?auto_3569 - FLEVEL
      ?auto_3570 - PERSON
    )
    :precondition
    ( and ( IN ?auto_3565 ?auto_3568 ) ( AIRCRAFT-AT ?auto_3568 ?auto_3572 ) ( FUEL-LEVEL ?auto_3568 ?auto_3571 ) ( NEXT ?auto_3569 ?auto_3571 ) ( not ( = ?auto_3564 ?auto_3572 ) ) ( not ( = ?auto_3571 ?auto_3569 ) ) ( PERSON-AT ?auto_3570 ?auto_3564 ) ( not ( = ?auto_3570 ?auto_3565 ) ) ( PERSON-AT ?auto_3566 ?auto_3564 ) ( PERSON-AT ?auto_3567 ?auto_3564 ) ( not ( = ?auto_3565 ?auto_3566 ) ) ( not ( = ?auto_3565 ?auto_3567 ) ) ( not ( = ?auto_3566 ?auto_3567 ) ) ( not ( = ?auto_3566 ?auto_3570 ) ) ( not ( = ?auto_3567 ?auto_3570 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3570 ?auto_3565 ?auto_3564 )
      ( FLY-3PPL-VERIFY ?auto_3565 ?auto_3566 ?auto_3567 ?auto_3564 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3644 - PERSON
      ?auto_3645 - PERSON
      ?auto_3646 - PERSON
      ?auto_3643 - CITY
    )
    :vars
    (
      ?auto_3647 - AIRCRAFT
      ?auto_3650 - CITY
      ?auto_3649 - FLEVEL
      ?auto_3648 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3647 ?auto_3650 ) ( FUEL-LEVEL ?auto_3647 ?auto_3649 ) ( NEXT ?auto_3648 ?auto_3649 ) ( not ( = ?auto_3643 ?auto_3650 ) ) ( not ( = ?auto_3649 ?auto_3648 ) ) ( PERSON-AT ?auto_3645 ?auto_3643 ) ( not ( = ?auto_3645 ?auto_3646 ) ) ( PERSON-AT ?auto_3646 ?auto_3650 ) ( PERSON-AT ?auto_3644 ?auto_3643 ) ( not ( = ?auto_3644 ?auto_3645 ) ) ( not ( = ?auto_3644 ?auto_3646 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3645 ?auto_3646 ?auto_3643 )
      ( FLY-3PPL-VERIFY ?auto_3644 ?auto_3645 ?auto_3646 ?auto_3643 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3656 - PERSON
      ?auto_3657 - PERSON
      ?auto_3658 - PERSON
      ?auto_3655 - CITY
    )
    :vars
    (
      ?auto_3659 - AIRCRAFT
      ?auto_3662 - CITY
      ?auto_3661 - FLEVEL
      ?auto_3660 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3659 ?auto_3662 ) ( FUEL-LEVEL ?auto_3659 ?auto_3661 ) ( NEXT ?auto_3660 ?auto_3661 ) ( not ( = ?auto_3655 ?auto_3662 ) ) ( not ( = ?auto_3661 ?auto_3660 ) ) ( PERSON-AT ?auto_3656 ?auto_3655 ) ( not ( = ?auto_3656 ?auto_3657 ) ) ( PERSON-AT ?auto_3657 ?auto_3662 ) ( PERSON-AT ?auto_3658 ?auto_3655 ) ( not ( = ?auto_3656 ?auto_3658 ) ) ( not ( = ?auto_3657 ?auto_3658 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3656 ?auto_3657 ?auto_3655 )
      ( FLY-3PPL-VERIFY ?auto_3656 ?auto_3657 ?auto_3658 ?auto_3655 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3680 - PERSON
      ?auto_3681 - PERSON
      ?auto_3682 - PERSON
      ?auto_3679 - CITY
    )
    :vars
    (
      ?auto_3684 - AIRCRAFT
      ?auto_3687 - CITY
      ?auto_3686 - FLEVEL
      ?auto_3685 - FLEVEL
      ?auto_3683 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3684 ?auto_3687 ) ( FUEL-LEVEL ?auto_3684 ?auto_3686 ) ( NEXT ?auto_3685 ?auto_3686 ) ( not ( = ?auto_3679 ?auto_3687 ) ) ( not ( = ?auto_3686 ?auto_3685 ) ) ( PERSON-AT ?auto_3683 ?auto_3679 ) ( not ( = ?auto_3683 ?auto_3682 ) ) ( PERSON-AT ?auto_3682 ?auto_3687 ) ( PERSON-AT ?auto_3680 ?auto_3679 ) ( PERSON-AT ?auto_3681 ?auto_3679 ) ( not ( = ?auto_3680 ?auto_3681 ) ) ( not ( = ?auto_3680 ?auto_3682 ) ) ( not ( = ?auto_3680 ?auto_3683 ) ) ( not ( = ?auto_3681 ?auto_3682 ) ) ( not ( = ?auto_3681 ?auto_3683 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3683 ?auto_3682 ?auto_3679 )
      ( FLY-3PPL-VERIFY ?auto_3680 ?auto_3681 ?auto_3682 ?auto_3679 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3693 - PERSON
      ?auto_3694 - PERSON
      ?auto_3695 - PERSON
      ?auto_3692 - CITY
    )
    :vars
    (
      ?auto_3697 - AIRCRAFT
      ?auto_3700 - CITY
      ?auto_3699 - FLEVEL
      ?auto_3698 - FLEVEL
      ?auto_3696 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3697 ?auto_3700 ) ( FUEL-LEVEL ?auto_3697 ?auto_3699 ) ( NEXT ?auto_3698 ?auto_3699 ) ( not ( = ?auto_3692 ?auto_3700 ) ) ( not ( = ?auto_3699 ?auto_3698 ) ) ( PERSON-AT ?auto_3696 ?auto_3692 ) ( not ( = ?auto_3696 ?auto_3694 ) ) ( PERSON-AT ?auto_3694 ?auto_3700 ) ( PERSON-AT ?auto_3693 ?auto_3692 ) ( PERSON-AT ?auto_3695 ?auto_3692 ) ( not ( = ?auto_3693 ?auto_3694 ) ) ( not ( = ?auto_3693 ?auto_3695 ) ) ( not ( = ?auto_3693 ?auto_3696 ) ) ( not ( = ?auto_3694 ?auto_3695 ) ) ( not ( = ?auto_3695 ?auto_3696 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3696 ?auto_3694 ?auto_3692 )
      ( FLY-3PPL-VERIFY ?auto_3693 ?auto_3694 ?auto_3695 ?auto_3692 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3711 - PERSON
      ?auto_3712 - PERSON
      ?auto_3713 - PERSON
      ?auto_3710 - CITY
    )
    :vars
    (
      ?auto_3714 - AIRCRAFT
      ?auto_3717 - CITY
      ?auto_3716 - FLEVEL
      ?auto_3715 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3714 ?auto_3717 ) ( FUEL-LEVEL ?auto_3714 ?auto_3716 ) ( NEXT ?auto_3715 ?auto_3716 ) ( not ( = ?auto_3710 ?auto_3717 ) ) ( not ( = ?auto_3716 ?auto_3715 ) ) ( PERSON-AT ?auto_3712 ?auto_3710 ) ( not ( = ?auto_3712 ?auto_3711 ) ) ( PERSON-AT ?auto_3711 ?auto_3717 ) ( PERSON-AT ?auto_3713 ?auto_3710 ) ( not ( = ?auto_3711 ?auto_3713 ) ) ( not ( = ?auto_3712 ?auto_3713 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3712 ?auto_3711 ?auto_3710 )
      ( FLY-3PPL-VERIFY ?auto_3711 ?auto_3712 ?auto_3713 ?auto_3710 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3735 - PERSON
      ?auto_3736 - PERSON
      ?auto_3737 - PERSON
      ?auto_3734 - CITY
    )
    :vars
    (
      ?auto_3739 - AIRCRAFT
      ?auto_3742 - CITY
      ?auto_3741 - FLEVEL
      ?auto_3740 - FLEVEL
      ?auto_3738 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3739 ?auto_3742 ) ( FUEL-LEVEL ?auto_3739 ?auto_3741 ) ( NEXT ?auto_3740 ?auto_3741 ) ( not ( = ?auto_3734 ?auto_3742 ) ) ( not ( = ?auto_3741 ?auto_3740 ) ) ( PERSON-AT ?auto_3738 ?auto_3734 ) ( not ( = ?auto_3738 ?auto_3735 ) ) ( PERSON-AT ?auto_3735 ?auto_3742 ) ( PERSON-AT ?auto_3736 ?auto_3734 ) ( PERSON-AT ?auto_3737 ?auto_3734 ) ( not ( = ?auto_3735 ?auto_3736 ) ) ( not ( = ?auto_3735 ?auto_3737 ) ) ( not ( = ?auto_3736 ?auto_3737 ) ) ( not ( = ?auto_3736 ?auto_3738 ) ) ( not ( = ?auto_3737 ?auto_3738 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3738 ?auto_3735 ?auto_3734 )
      ( FLY-3PPL-VERIFY ?auto_3735 ?auto_3736 ?auto_3737 ?auto_3734 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3814 - PERSON
      ?auto_3815 - PERSON
      ?auto_3816 - PERSON
      ?auto_3813 - CITY
    )
    :vars
    (
      ?auto_3817 - AIRCRAFT
      ?auto_3819 - CITY
      ?auto_3818 - FLEVEL
      ?auto_3820 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3817 ?auto_3819 ) ( NEXT ?auto_3818 ?auto_3820 ) ( not ( = ?auto_3813 ?auto_3819 ) ) ( not ( = ?auto_3820 ?auto_3818 ) ) ( PERSON-AT ?auto_3815 ?auto_3813 ) ( not ( = ?auto_3815 ?auto_3816 ) ) ( PERSON-AT ?auto_3816 ?auto_3819 ) ( FUEL-LEVEL ?auto_3817 ?auto_3818 ) ( PERSON-AT ?auto_3814 ?auto_3813 ) ( not ( = ?auto_3814 ?auto_3815 ) ) ( not ( = ?auto_3814 ?auto_3816 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3815 ?auto_3816 ?auto_3813 )
      ( FLY-3PPL-VERIFY ?auto_3814 ?auto_3815 ?auto_3816 ?auto_3813 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3850 - PERSON
      ?auto_3851 - PERSON
      ?auto_3852 - PERSON
      ?auto_3849 - CITY
    )
    :vars
    (
      ?auto_3853 - AIRCRAFT
      ?auto_3855 - CITY
      ?auto_3854 - FLEVEL
      ?auto_3857 - FLEVEL
      ?auto_3856 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3853 ?auto_3855 ) ( NEXT ?auto_3854 ?auto_3857 ) ( not ( = ?auto_3849 ?auto_3855 ) ) ( not ( = ?auto_3857 ?auto_3854 ) ) ( PERSON-AT ?auto_3856 ?auto_3849 ) ( not ( = ?auto_3856 ?auto_3852 ) ) ( PERSON-AT ?auto_3852 ?auto_3855 ) ( FUEL-LEVEL ?auto_3853 ?auto_3854 ) ( PERSON-AT ?auto_3850 ?auto_3849 ) ( PERSON-AT ?auto_3851 ?auto_3849 ) ( not ( = ?auto_3850 ?auto_3851 ) ) ( not ( = ?auto_3850 ?auto_3852 ) ) ( not ( = ?auto_3850 ?auto_3856 ) ) ( not ( = ?auto_3851 ?auto_3852 ) ) ( not ( = ?auto_3851 ?auto_3856 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3856 ?auto_3852 ?auto_3849 )
      ( FLY-3PPL-VERIFY ?auto_3850 ?auto_3851 ?auto_3852 ?auto_3849 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3863 - PERSON
      ?auto_3864 - PERSON
      ?auto_3865 - PERSON
      ?auto_3862 - CITY
    )
    :vars
    (
      ?auto_3866 - AIRCRAFT
      ?auto_3868 - CITY
      ?auto_3867 - FLEVEL
      ?auto_3870 - FLEVEL
      ?auto_3869 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3866 ?auto_3868 ) ( NEXT ?auto_3867 ?auto_3870 ) ( not ( = ?auto_3862 ?auto_3868 ) ) ( not ( = ?auto_3870 ?auto_3867 ) ) ( PERSON-AT ?auto_3869 ?auto_3862 ) ( not ( = ?auto_3869 ?auto_3864 ) ) ( PERSON-AT ?auto_3864 ?auto_3868 ) ( FUEL-LEVEL ?auto_3866 ?auto_3867 ) ( PERSON-AT ?auto_3863 ?auto_3862 ) ( PERSON-AT ?auto_3865 ?auto_3862 ) ( not ( = ?auto_3863 ?auto_3864 ) ) ( not ( = ?auto_3863 ?auto_3865 ) ) ( not ( = ?auto_3863 ?auto_3869 ) ) ( not ( = ?auto_3864 ?auto_3865 ) ) ( not ( = ?auto_3865 ?auto_3869 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3869 ?auto_3864 ?auto_3862 )
      ( FLY-3PPL-VERIFY ?auto_3863 ?auto_3864 ?auto_3865 ?auto_3862 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3905 - PERSON
      ?auto_3906 - PERSON
      ?auto_3907 - PERSON
      ?auto_3904 - CITY
    )
    :vars
    (
      ?auto_3908 - AIRCRAFT
      ?auto_3910 - CITY
      ?auto_3909 - FLEVEL
      ?auto_3912 - FLEVEL
      ?auto_3911 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3908 ?auto_3910 ) ( NEXT ?auto_3909 ?auto_3912 ) ( not ( = ?auto_3904 ?auto_3910 ) ) ( not ( = ?auto_3912 ?auto_3909 ) ) ( PERSON-AT ?auto_3911 ?auto_3904 ) ( not ( = ?auto_3911 ?auto_3905 ) ) ( PERSON-AT ?auto_3905 ?auto_3910 ) ( FUEL-LEVEL ?auto_3908 ?auto_3909 ) ( PERSON-AT ?auto_3906 ?auto_3904 ) ( PERSON-AT ?auto_3907 ?auto_3904 ) ( not ( = ?auto_3905 ?auto_3906 ) ) ( not ( = ?auto_3905 ?auto_3907 ) ) ( not ( = ?auto_3906 ?auto_3907 ) ) ( not ( = ?auto_3906 ?auto_3911 ) ) ( not ( = ?auto_3907 ?auto_3911 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3911 ?auto_3905 ?auto_3904 )
      ( FLY-3PPL-VERIFY ?auto_3905 ?auto_3906 ?auto_3907 ?auto_3904 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3984 - PERSON
      ?auto_3985 - PERSON
      ?auto_3986 - PERSON
      ?auto_3983 - CITY
    )
    :vars
    (
      ?auto_3987 - FLEVEL
      ?auto_3989 - FLEVEL
      ?auto_3990 - CITY
      ?auto_3988 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3987 ?auto_3989 ) ( not ( = ?auto_3983 ?auto_3990 ) ) ( not ( = ?auto_3989 ?auto_3987 ) ) ( PERSON-AT ?auto_3985 ?auto_3983 ) ( not ( = ?auto_3985 ?auto_3986 ) ) ( PERSON-AT ?auto_3986 ?auto_3990 ) ( AIRCRAFT-AT ?auto_3988 ?auto_3983 ) ( FUEL-LEVEL ?auto_3988 ?auto_3989 ) ( PERSON-AT ?auto_3984 ?auto_3983 ) ( not ( = ?auto_3984 ?auto_3985 ) ) ( not ( = ?auto_3984 ?auto_3986 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3985 ?auto_3986 ?auto_3983 )
      ( FLY-3PPL-VERIFY ?auto_3984 ?auto_3985 ?auto_3986 ?auto_3983 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3996 - PERSON
      ?auto_3997 - PERSON
      ?auto_3998 - PERSON
      ?auto_3995 - CITY
    )
    :vars
    (
      ?auto_3999 - FLEVEL
      ?auto_4001 - FLEVEL
      ?auto_4002 - CITY
      ?auto_4000 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3999 ?auto_4001 ) ( not ( = ?auto_3995 ?auto_4002 ) ) ( not ( = ?auto_4001 ?auto_3999 ) ) ( PERSON-AT ?auto_3996 ?auto_3995 ) ( not ( = ?auto_3996 ?auto_3997 ) ) ( PERSON-AT ?auto_3997 ?auto_4002 ) ( AIRCRAFT-AT ?auto_4000 ?auto_3995 ) ( FUEL-LEVEL ?auto_4000 ?auto_4001 ) ( PERSON-AT ?auto_3998 ?auto_3995 ) ( not ( = ?auto_3996 ?auto_3998 ) ) ( not ( = ?auto_3997 ?auto_3998 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3996 ?auto_3997 ?auto_3995 )
      ( FLY-3PPL-VERIFY ?auto_3996 ?auto_3997 ?auto_3998 ?auto_3995 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4020 - PERSON
      ?auto_4021 - PERSON
      ?auto_4022 - PERSON
      ?auto_4019 - CITY
    )
    :vars
    (
      ?auto_4023 - FLEVEL
      ?auto_4025 - FLEVEL
      ?auto_4027 - CITY
      ?auto_4026 - PERSON
      ?auto_4024 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4023 ?auto_4025 ) ( not ( = ?auto_4019 ?auto_4027 ) ) ( not ( = ?auto_4025 ?auto_4023 ) ) ( PERSON-AT ?auto_4026 ?auto_4019 ) ( not ( = ?auto_4026 ?auto_4022 ) ) ( PERSON-AT ?auto_4022 ?auto_4027 ) ( AIRCRAFT-AT ?auto_4024 ?auto_4019 ) ( FUEL-LEVEL ?auto_4024 ?auto_4025 ) ( PERSON-AT ?auto_4020 ?auto_4019 ) ( PERSON-AT ?auto_4021 ?auto_4019 ) ( not ( = ?auto_4020 ?auto_4021 ) ) ( not ( = ?auto_4020 ?auto_4022 ) ) ( not ( = ?auto_4020 ?auto_4026 ) ) ( not ( = ?auto_4021 ?auto_4022 ) ) ( not ( = ?auto_4021 ?auto_4026 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4026 ?auto_4022 ?auto_4019 )
      ( FLY-3PPL-VERIFY ?auto_4020 ?auto_4021 ?auto_4022 ?auto_4019 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4033 - PERSON
      ?auto_4034 - PERSON
      ?auto_4035 - PERSON
      ?auto_4032 - CITY
    )
    :vars
    (
      ?auto_4036 - FLEVEL
      ?auto_4038 - FLEVEL
      ?auto_4040 - CITY
      ?auto_4039 - PERSON
      ?auto_4037 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4036 ?auto_4038 ) ( not ( = ?auto_4032 ?auto_4040 ) ) ( not ( = ?auto_4038 ?auto_4036 ) ) ( PERSON-AT ?auto_4039 ?auto_4032 ) ( not ( = ?auto_4039 ?auto_4034 ) ) ( PERSON-AT ?auto_4034 ?auto_4040 ) ( AIRCRAFT-AT ?auto_4037 ?auto_4032 ) ( FUEL-LEVEL ?auto_4037 ?auto_4038 ) ( PERSON-AT ?auto_4033 ?auto_4032 ) ( PERSON-AT ?auto_4035 ?auto_4032 ) ( not ( = ?auto_4033 ?auto_4034 ) ) ( not ( = ?auto_4033 ?auto_4035 ) ) ( not ( = ?auto_4033 ?auto_4039 ) ) ( not ( = ?auto_4034 ?auto_4035 ) ) ( not ( = ?auto_4035 ?auto_4039 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4039 ?auto_4034 ?auto_4032 )
      ( FLY-3PPL-VERIFY ?auto_4033 ?auto_4034 ?auto_4035 ?auto_4032 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4075 - PERSON
      ?auto_4076 - PERSON
      ?auto_4077 - PERSON
      ?auto_4074 - CITY
    )
    :vars
    (
      ?auto_4078 - FLEVEL
      ?auto_4080 - FLEVEL
      ?auto_4082 - CITY
      ?auto_4081 - PERSON
      ?auto_4079 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4078 ?auto_4080 ) ( not ( = ?auto_4074 ?auto_4082 ) ) ( not ( = ?auto_4080 ?auto_4078 ) ) ( PERSON-AT ?auto_4081 ?auto_4074 ) ( not ( = ?auto_4081 ?auto_4075 ) ) ( PERSON-AT ?auto_4075 ?auto_4082 ) ( AIRCRAFT-AT ?auto_4079 ?auto_4074 ) ( FUEL-LEVEL ?auto_4079 ?auto_4080 ) ( PERSON-AT ?auto_4076 ?auto_4074 ) ( PERSON-AT ?auto_4077 ?auto_4074 ) ( not ( = ?auto_4075 ?auto_4076 ) ) ( not ( = ?auto_4075 ?auto_4077 ) ) ( not ( = ?auto_4076 ?auto_4077 ) ) ( not ( = ?auto_4076 ?auto_4081 ) ) ( not ( = ?auto_4077 ?auto_4081 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4081 ?auto_4075 ?auto_4074 )
      ( FLY-3PPL-VERIFY ?auto_4075 ?auto_4076 ?auto_4077 ?auto_4074 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4166 - PERSON
      ?auto_4167 - PERSON
      ?auto_4168 - PERSON
      ?auto_4165 - CITY
    )
    :vars
    (
      ?auto_4170 - FLEVEL
      ?auto_4169 - FLEVEL
      ?auto_4171 - CITY
      ?auto_4172 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4170 ?auto_4169 ) ( not ( = ?auto_4165 ?auto_4171 ) ) ( not ( = ?auto_4169 ?auto_4170 ) ) ( PERSON-AT ?auto_4166 ?auto_4165 ) ( not ( = ?auto_4166 ?auto_4167 ) ) ( PERSON-AT ?auto_4167 ?auto_4171 ) ( AIRCRAFT-AT ?auto_4172 ?auto_4165 ) ( FUEL-LEVEL ?auto_4172 ?auto_4170 ) ( PERSON-AT ?auto_4168 ?auto_4165 ) ( not ( = ?auto_4166 ?auto_4168 ) ) ( not ( = ?auto_4167 ?auto_4168 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4166 ?auto_4167 ?auto_4165 )
      ( FLY-3PPL-VERIFY ?auto_4166 ?auto_4167 ?auto_4168 ?auto_4165 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4190 - PERSON
      ?auto_4191 - PERSON
      ?auto_4192 - PERSON
      ?auto_4189 - CITY
    )
    :vars
    (
      ?auto_4195 - FLEVEL
      ?auto_4193 - FLEVEL
      ?auto_4196 - CITY
      ?auto_4194 - PERSON
      ?auto_4197 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4195 ?auto_4193 ) ( not ( = ?auto_4189 ?auto_4196 ) ) ( not ( = ?auto_4193 ?auto_4195 ) ) ( PERSON-AT ?auto_4194 ?auto_4189 ) ( not ( = ?auto_4194 ?auto_4192 ) ) ( PERSON-AT ?auto_4192 ?auto_4196 ) ( AIRCRAFT-AT ?auto_4197 ?auto_4189 ) ( FUEL-LEVEL ?auto_4197 ?auto_4195 ) ( PERSON-AT ?auto_4190 ?auto_4189 ) ( PERSON-AT ?auto_4191 ?auto_4189 ) ( not ( = ?auto_4190 ?auto_4191 ) ) ( not ( = ?auto_4190 ?auto_4192 ) ) ( not ( = ?auto_4190 ?auto_4194 ) ) ( not ( = ?auto_4191 ?auto_4192 ) ) ( not ( = ?auto_4191 ?auto_4194 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4194 ?auto_4192 ?auto_4189 )
      ( FLY-3PPL-VERIFY ?auto_4190 ?auto_4191 ?auto_4192 ?auto_4189 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4203 - PERSON
      ?auto_4204 - PERSON
      ?auto_4205 - PERSON
      ?auto_4202 - CITY
    )
    :vars
    (
      ?auto_4208 - FLEVEL
      ?auto_4206 - FLEVEL
      ?auto_4209 - CITY
      ?auto_4207 - PERSON
      ?auto_4210 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4208 ?auto_4206 ) ( not ( = ?auto_4202 ?auto_4209 ) ) ( not ( = ?auto_4206 ?auto_4208 ) ) ( PERSON-AT ?auto_4207 ?auto_4202 ) ( not ( = ?auto_4207 ?auto_4204 ) ) ( PERSON-AT ?auto_4204 ?auto_4209 ) ( AIRCRAFT-AT ?auto_4210 ?auto_4202 ) ( FUEL-LEVEL ?auto_4210 ?auto_4208 ) ( PERSON-AT ?auto_4203 ?auto_4202 ) ( PERSON-AT ?auto_4205 ?auto_4202 ) ( not ( = ?auto_4203 ?auto_4204 ) ) ( not ( = ?auto_4203 ?auto_4205 ) ) ( not ( = ?auto_4203 ?auto_4207 ) ) ( not ( = ?auto_4204 ?auto_4205 ) ) ( not ( = ?auto_4205 ?auto_4207 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4207 ?auto_4204 ?auto_4202 )
      ( FLY-3PPL-VERIFY ?auto_4203 ?auto_4204 ?auto_4205 ?auto_4202 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4245 - PERSON
      ?auto_4246 - PERSON
      ?auto_4247 - PERSON
      ?auto_4244 - CITY
    )
    :vars
    (
      ?auto_4250 - FLEVEL
      ?auto_4248 - FLEVEL
      ?auto_4251 - CITY
      ?auto_4249 - PERSON
      ?auto_4252 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4250 ?auto_4248 ) ( not ( = ?auto_4244 ?auto_4251 ) ) ( not ( = ?auto_4248 ?auto_4250 ) ) ( PERSON-AT ?auto_4249 ?auto_4244 ) ( not ( = ?auto_4249 ?auto_4245 ) ) ( PERSON-AT ?auto_4245 ?auto_4251 ) ( AIRCRAFT-AT ?auto_4252 ?auto_4244 ) ( FUEL-LEVEL ?auto_4252 ?auto_4250 ) ( PERSON-AT ?auto_4246 ?auto_4244 ) ( PERSON-AT ?auto_4247 ?auto_4244 ) ( not ( = ?auto_4245 ?auto_4246 ) ) ( not ( = ?auto_4245 ?auto_4247 ) ) ( not ( = ?auto_4246 ?auto_4247 ) ) ( not ( = ?auto_4246 ?auto_4249 ) ) ( not ( = ?auto_4247 ?auto_4249 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4249 ?auto_4245 ?auto_4244 )
      ( FLY-3PPL-VERIFY ?auto_4245 ?auto_4246 ?auto_4247 ?auto_4244 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4404 - PERSON
      ?auto_4405 - PERSON
      ?auto_4406 - PERSON
      ?auto_4403 - CITY
    )
    :vars
    (
      ?auto_4410 - FLEVEL
      ?auto_4409 - FLEVEL
      ?auto_4407 - CITY
      ?auto_4408 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4410 ?auto_4409 ) ( not ( = ?auto_4403 ?auto_4407 ) ) ( not ( = ?auto_4409 ?auto_4410 ) ) ( PERSON-AT ?auto_4405 ?auto_4403 ) ( not ( = ?auto_4405 ?auto_4404 ) ) ( PERSON-AT ?auto_4404 ?auto_4407 ) ( AIRCRAFT-AT ?auto_4408 ?auto_4403 ) ( FUEL-LEVEL ?auto_4408 ?auto_4410 ) ( PERSON-AT ?auto_4406 ?auto_4403 ) ( not ( = ?auto_4404 ?auto_4406 ) ) ( not ( = ?auto_4405 ?auto_4406 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4405 ?auto_4404 ?auto_4403 )
      ( FLY-3PPL-VERIFY ?auto_4404 ?auto_4405 ?auto_4406 ?auto_4403 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_4480 - PERSON
      ?auto_4479 - CITY
    )
    :vars
    (
      ?auto_4485 - FLEVEL
      ?auto_4484 - FLEVEL
      ?auto_4482 - CITY
      ?auto_4481 - PERSON
      ?auto_4483 - AIRCRAFT
      ?auto_4486 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4485 ?auto_4484 ) ( not ( = ?auto_4479 ?auto_4482 ) ) ( not ( = ?auto_4484 ?auto_4485 ) ) ( PERSON-AT ?auto_4481 ?auto_4479 ) ( not ( = ?auto_4481 ?auto_4480 ) ) ( PERSON-AT ?auto_4480 ?auto_4482 ) ( AIRCRAFT-AT ?auto_4483 ?auto_4486 ) ( FUEL-LEVEL ?auto_4483 ?auto_4484 ) ( not ( = ?auto_4479 ?auto_4486 ) ) ( not ( = ?auto_4482 ?auto_4486 ) ) )
    :subtasks
    ( ( !FLY ?auto_4483 ?auto_4486 ?auto_4479 ?auto_4484 ?auto_4485 )
      ( FLY-2PPL ?auto_4481 ?auto_4480 ?auto_4479 )
      ( FLY-1PPL-VERIFY ?auto_4480 ?auto_4479 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4488 - PERSON
      ?auto_4489 - PERSON
      ?auto_4487 - CITY
    )
    :vars
    (
      ?auto_4490 - FLEVEL
      ?auto_4491 - FLEVEL
      ?auto_4493 - CITY
      ?auto_4494 - AIRCRAFT
      ?auto_4492 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4490 ?auto_4491 ) ( not ( = ?auto_4487 ?auto_4493 ) ) ( not ( = ?auto_4491 ?auto_4490 ) ) ( PERSON-AT ?auto_4488 ?auto_4487 ) ( not ( = ?auto_4488 ?auto_4489 ) ) ( PERSON-AT ?auto_4489 ?auto_4493 ) ( AIRCRAFT-AT ?auto_4494 ?auto_4492 ) ( FUEL-LEVEL ?auto_4494 ?auto_4491 ) ( not ( = ?auto_4487 ?auto_4492 ) ) ( not ( = ?auto_4493 ?auto_4492 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_4489 ?auto_4487 )
      ( FLY-2PPL-VERIFY ?auto_4488 ?auto_4489 ?auto_4487 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4505 - PERSON
      ?auto_4506 - PERSON
      ?auto_4504 - CITY
    )
    :vars
    (
      ?auto_4511 - FLEVEL
      ?auto_4510 - FLEVEL
      ?auto_4507 - CITY
      ?auto_4508 - AIRCRAFT
      ?auto_4509 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4511 ?auto_4510 ) ( not ( = ?auto_4504 ?auto_4507 ) ) ( not ( = ?auto_4510 ?auto_4511 ) ) ( PERSON-AT ?auto_4506 ?auto_4504 ) ( not ( = ?auto_4506 ?auto_4505 ) ) ( PERSON-AT ?auto_4505 ?auto_4507 ) ( AIRCRAFT-AT ?auto_4508 ?auto_4509 ) ( FUEL-LEVEL ?auto_4508 ?auto_4510 ) ( not ( = ?auto_4504 ?auto_4509 ) ) ( not ( = ?auto_4507 ?auto_4509 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4506 ?auto_4505 ?auto_4504 )
      ( FLY-2PPL-VERIFY ?auto_4505 ?auto_4506 ?auto_4504 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4531 - PERSON
      ?auto_4532 - PERSON
      ?auto_4533 - PERSON
      ?auto_4530 - CITY
    )
    :vars
    (
      ?auto_4538 - FLEVEL
      ?auto_4537 - FLEVEL
      ?auto_4534 - CITY
      ?auto_4535 - AIRCRAFT
      ?auto_4536 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4538 ?auto_4537 ) ( not ( = ?auto_4530 ?auto_4534 ) ) ( not ( = ?auto_4537 ?auto_4538 ) ) ( PERSON-AT ?auto_4532 ?auto_4530 ) ( not ( = ?auto_4532 ?auto_4533 ) ) ( PERSON-AT ?auto_4533 ?auto_4534 ) ( AIRCRAFT-AT ?auto_4535 ?auto_4536 ) ( FUEL-LEVEL ?auto_4535 ?auto_4537 ) ( not ( = ?auto_4530 ?auto_4536 ) ) ( not ( = ?auto_4534 ?auto_4536 ) ) ( PERSON-AT ?auto_4531 ?auto_4530 ) ( not ( = ?auto_4531 ?auto_4532 ) ) ( not ( = ?auto_4531 ?auto_4533 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4532 ?auto_4533 ?auto_4530 )
      ( FLY-3PPL-VERIFY ?auto_4531 ?auto_4532 ?auto_4533 ?auto_4530 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4549 - PERSON
      ?auto_4550 - PERSON
      ?auto_4551 - PERSON
      ?auto_4548 - CITY
    )
    :vars
    (
      ?auto_4556 - FLEVEL
      ?auto_4555 - FLEVEL
      ?auto_4552 - CITY
      ?auto_4553 - AIRCRAFT
      ?auto_4554 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4556 ?auto_4555 ) ( not ( = ?auto_4548 ?auto_4552 ) ) ( not ( = ?auto_4555 ?auto_4556 ) ) ( PERSON-AT ?auto_4549 ?auto_4548 ) ( not ( = ?auto_4549 ?auto_4550 ) ) ( PERSON-AT ?auto_4550 ?auto_4552 ) ( AIRCRAFT-AT ?auto_4553 ?auto_4554 ) ( FUEL-LEVEL ?auto_4553 ?auto_4555 ) ( not ( = ?auto_4548 ?auto_4554 ) ) ( not ( = ?auto_4552 ?auto_4554 ) ) ( PERSON-AT ?auto_4551 ?auto_4548 ) ( not ( = ?auto_4549 ?auto_4551 ) ) ( not ( = ?auto_4550 ?auto_4551 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4549 ?auto_4550 ?auto_4548 )
      ( FLY-3PPL-VERIFY ?auto_4549 ?auto_4550 ?auto_4551 ?auto_4548 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4624 - PERSON
      ?auto_4625 - PERSON
      ?auto_4626 - PERSON
      ?auto_4623 - CITY
    )
    :vars
    (
      ?auto_4631 - FLEVEL
      ?auto_4630 - FLEVEL
      ?auto_4627 - CITY
      ?auto_4628 - AIRCRAFT
      ?auto_4629 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4631 ?auto_4630 ) ( not ( = ?auto_4623 ?auto_4627 ) ) ( not ( = ?auto_4630 ?auto_4631 ) ) ( PERSON-AT ?auto_4626 ?auto_4623 ) ( not ( = ?auto_4626 ?auto_4624 ) ) ( PERSON-AT ?auto_4624 ?auto_4627 ) ( AIRCRAFT-AT ?auto_4628 ?auto_4629 ) ( FUEL-LEVEL ?auto_4628 ?auto_4630 ) ( not ( = ?auto_4623 ?auto_4629 ) ) ( not ( = ?auto_4627 ?auto_4629 ) ) ( PERSON-AT ?auto_4625 ?auto_4623 ) ( not ( = ?auto_4624 ?auto_4625 ) ) ( not ( = ?auto_4625 ?auto_4626 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4626 ?auto_4624 ?auto_4623 )
      ( FLY-3PPL-VERIFY ?auto_4624 ?auto_4625 ?auto_4626 ?auto_4623 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4744 - PERSON
      ?auto_4745 - PERSON
      ?auto_4746 - PERSON
      ?auto_4743 - CITY
    )
    :vars
    (
      ?auto_4747 - FLEVEL
      ?auto_4749 - FLEVEL
      ?auto_4748 - CITY
      ?auto_4750 - AIRCRAFT
      ?auto_4751 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4747 ?auto_4749 ) ( not ( = ?auto_4743 ?auto_4748 ) ) ( not ( = ?auto_4749 ?auto_4747 ) ) ( PERSON-AT ?auto_4744 ?auto_4743 ) ( not ( = ?auto_4744 ?auto_4746 ) ) ( PERSON-AT ?auto_4746 ?auto_4748 ) ( AIRCRAFT-AT ?auto_4750 ?auto_4751 ) ( FUEL-LEVEL ?auto_4750 ?auto_4749 ) ( not ( = ?auto_4743 ?auto_4751 ) ) ( not ( = ?auto_4748 ?auto_4751 ) ) ( PERSON-AT ?auto_4745 ?auto_4743 ) ( not ( = ?auto_4744 ?auto_4745 ) ) ( not ( = ?auto_4745 ?auto_4746 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4744 ?auto_4746 ?auto_4743 )
      ( FLY-3PPL-VERIFY ?auto_4744 ?auto_4745 ?auto_4746 ?auto_4743 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4762 - PERSON
      ?auto_4763 - PERSON
      ?auto_4764 - PERSON
      ?auto_4761 - CITY
    )
    :vars
    (
      ?auto_4765 - FLEVEL
      ?auto_4767 - FLEVEL
      ?auto_4766 - CITY
      ?auto_4768 - AIRCRAFT
      ?auto_4769 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4765 ?auto_4767 ) ( not ( = ?auto_4761 ?auto_4766 ) ) ( not ( = ?auto_4767 ?auto_4765 ) ) ( PERSON-AT ?auto_4764 ?auto_4761 ) ( not ( = ?auto_4764 ?auto_4763 ) ) ( PERSON-AT ?auto_4763 ?auto_4766 ) ( AIRCRAFT-AT ?auto_4768 ?auto_4769 ) ( FUEL-LEVEL ?auto_4768 ?auto_4767 ) ( not ( = ?auto_4761 ?auto_4769 ) ) ( not ( = ?auto_4766 ?auto_4769 ) ) ( PERSON-AT ?auto_4762 ?auto_4761 ) ( not ( = ?auto_4762 ?auto_4763 ) ) ( not ( = ?auto_4762 ?auto_4764 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4764 ?auto_4763 ?auto_4761 )
      ( FLY-3PPL-VERIFY ?auto_4762 ?auto_4763 ?auto_4764 ?auto_4761 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_4922 - PERSON
      ?auto_4921 - CITY
    )
    :vars
    (
      ?auto_4923 - FLEVEL
      ?auto_4926 - FLEVEL
      ?auto_4924 - CITY
      ?auto_4925 - PERSON
      ?auto_4927 - AIRCRAFT
      ?auto_4928 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4923 ?auto_4926 ) ( not ( = ?auto_4921 ?auto_4924 ) ) ( not ( = ?auto_4926 ?auto_4923 ) ) ( PERSON-AT ?auto_4925 ?auto_4921 ) ( not ( = ?auto_4925 ?auto_4922 ) ) ( PERSON-AT ?auto_4922 ?auto_4924 ) ( AIRCRAFT-AT ?auto_4927 ?auto_4928 ) ( not ( = ?auto_4921 ?auto_4928 ) ) ( not ( = ?auto_4924 ?auto_4928 ) ) ( FUEL-LEVEL ?auto_4927 ?auto_4923 ) )
    :subtasks
    ( ( !REFUEL ?auto_4927 ?auto_4928 ?auto_4923 ?auto_4926 )
      ( FLY-2PPL ?auto_4925 ?auto_4922 ?auto_4921 )
      ( FLY-1PPL-VERIFY ?auto_4922 ?auto_4921 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4930 - PERSON
      ?auto_4931 - PERSON
      ?auto_4929 - CITY
    )
    :vars
    (
      ?auto_4935 - FLEVEL
      ?auto_4936 - FLEVEL
      ?auto_4932 - CITY
      ?auto_4934 - AIRCRAFT
      ?auto_4933 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4935 ?auto_4936 ) ( not ( = ?auto_4929 ?auto_4932 ) ) ( not ( = ?auto_4936 ?auto_4935 ) ) ( PERSON-AT ?auto_4930 ?auto_4929 ) ( not ( = ?auto_4930 ?auto_4931 ) ) ( PERSON-AT ?auto_4931 ?auto_4932 ) ( AIRCRAFT-AT ?auto_4934 ?auto_4933 ) ( not ( = ?auto_4929 ?auto_4933 ) ) ( not ( = ?auto_4932 ?auto_4933 ) ) ( FUEL-LEVEL ?auto_4934 ?auto_4935 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_4931 ?auto_4929 )
      ( FLY-2PPL-VERIFY ?auto_4930 ?auto_4931 ?auto_4929 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4947 - PERSON
      ?auto_4948 - PERSON
      ?auto_4946 - CITY
    )
    :vars
    (
      ?auto_4951 - FLEVEL
      ?auto_4952 - FLEVEL
      ?auto_4949 - CITY
      ?auto_4950 - AIRCRAFT
      ?auto_4953 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4951 ?auto_4952 ) ( not ( = ?auto_4946 ?auto_4949 ) ) ( not ( = ?auto_4952 ?auto_4951 ) ) ( PERSON-AT ?auto_4948 ?auto_4946 ) ( not ( = ?auto_4948 ?auto_4947 ) ) ( PERSON-AT ?auto_4947 ?auto_4949 ) ( AIRCRAFT-AT ?auto_4950 ?auto_4953 ) ( not ( = ?auto_4946 ?auto_4953 ) ) ( not ( = ?auto_4949 ?auto_4953 ) ) ( FUEL-LEVEL ?auto_4950 ?auto_4951 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4948 ?auto_4947 ?auto_4946 )
      ( FLY-2PPL-VERIFY ?auto_4947 ?auto_4948 ?auto_4946 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4973 - PERSON
      ?auto_4974 - PERSON
      ?auto_4975 - PERSON
      ?auto_4972 - CITY
    )
    :vars
    (
      ?auto_4978 - FLEVEL
      ?auto_4979 - FLEVEL
      ?auto_4976 - CITY
      ?auto_4977 - AIRCRAFT
      ?auto_4980 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4978 ?auto_4979 ) ( not ( = ?auto_4972 ?auto_4976 ) ) ( not ( = ?auto_4979 ?auto_4978 ) ) ( PERSON-AT ?auto_4974 ?auto_4972 ) ( not ( = ?auto_4974 ?auto_4975 ) ) ( PERSON-AT ?auto_4975 ?auto_4976 ) ( AIRCRAFT-AT ?auto_4977 ?auto_4980 ) ( not ( = ?auto_4972 ?auto_4980 ) ) ( not ( = ?auto_4976 ?auto_4980 ) ) ( FUEL-LEVEL ?auto_4977 ?auto_4978 ) ( PERSON-AT ?auto_4973 ?auto_4972 ) ( not ( = ?auto_4973 ?auto_4974 ) ) ( not ( = ?auto_4973 ?auto_4975 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4974 ?auto_4975 ?auto_4972 )
      ( FLY-3PPL-VERIFY ?auto_4973 ?auto_4974 ?auto_4975 ?auto_4972 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4991 - PERSON
      ?auto_4992 - PERSON
      ?auto_4993 - PERSON
      ?auto_4990 - CITY
    )
    :vars
    (
      ?auto_4996 - FLEVEL
      ?auto_4997 - FLEVEL
      ?auto_4994 - CITY
      ?auto_4995 - AIRCRAFT
      ?auto_4998 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4996 ?auto_4997 ) ( not ( = ?auto_4990 ?auto_4994 ) ) ( not ( = ?auto_4997 ?auto_4996 ) ) ( PERSON-AT ?auto_4991 ?auto_4990 ) ( not ( = ?auto_4991 ?auto_4992 ) ) ( PERSON-AT ?auto_4992 ?auto_4994 ) ( AIRCRAFT-AT ?auto_4995 ?auto_4998 ) ( not ( = ?auto_4990 ?auto_4998 ) ) ( not ( = ?auto_4994 ?auto_4998 ) ) ( FUEL-LEVEL ?auto_4995 ?auto_4996 ) ( PERSON-AT ?auto_4993 ?auto_4990 ) ( not ( = ?auto_4991 ?auto_4993 ) ) ( not ( = ?auto_4992 ?auto_4993 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4991 ?auto_4992 ?auto_4990 )
      ( FLY-3PPL-VERIFY ?auto_4991 ?auto_4992 ?auto_4993 ?auto_4990 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5066 - PERSON
      ?auto_5067 - PERSON
      ?auto_5068 - PERSON
      ?auto_5065 - CITY
    )
    :vars
    (
      ?auto_5071 - FLEVEL
      ?auto_5072 - FLEVEL
      ?auto_5069 - CITY
      ?auto_5070 - AIRCRAFT
      ?auto_5073 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5071 ?auto_5072 ) ( not ( = ?auto_5065 ?auto_5069 ) ) ( not ( = ?auto_5072 ?auto_5071 ) ) ( PERSON-AT ?auto_5067 ?auto_5065 ) ( not ( = ?auto_5067 ?auto_5066 ) ) ( PERSON-AT ?auto_5066 ?auto_5069 ) ( AIRCRAFT-AT ?auto_5070 ?auto_5073 ) ( not ( = ?auto_5065 ?auto_5073 ) ) ( not ( = ?auto_5069 ?auto_5073 ) ) ( FUEL-LEVEL ?auto_5070 ?auto_5071 ) ( PERSON-AT ?auto_5068 ?auto_5065 ) ( not ( = ?auto_5066 ?auto_5068 ) ) ( not ( = ?auto_5067 ?auto_5068 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5067 ?auto_5066 ?auto_5065 )
      ( FLY-3PPL-VERIFY ?auto_5066 ?auto_5067 ?auto_5068 ?auto_5065 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5266 - PERSON
      ?auto_5267 - PERSON
      ?auto_5268 - PERSON
      ?auto_5265 - CITY
    )
    :vars
    (
      ?auto_5270 - FLEVEL
      ?auto_5271 - FLEVEL
      ?auto_5269 - CITY
      ?auto_5272 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5270 ?auto_5271 ) ( not ( = ?auto_5265 ?auto_5269 ) ) ( not ( = ?auto_5271 ?auto_5270 ) ) ( PERSON-AT ?auto_5267 ?auto_5265 ) ( not ( = ?auto_5267 ?auto_5266 ) ) ( PERSON-AT ?auto_5266 ?auto_5269 ) ( AIRCRAFT-AT ?auto_5272 ?auto_5265 ) ( FUEL-LEVEL ?auto_5272 ?auto_5271 ) ( PERSON-AT ?auto_5268 ?auto_5265 ) ( not ( = ?auto_5266 ?auto_5268 ) ) ( not ( = ?auto_5267 ?auto_5268 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5267 ?auto_5266 ?auto_5265 )
      ( FLY-3PPL-VERIFY ?auto_5266 ?auto_5267 ?auto_5268 ?auto_5265 ) )
  )

)

