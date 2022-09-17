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
      ?auto_2175 - PERSON
      ?auto_2174 - CITY
    )
    :vars
    (
      ?auto_2176 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_2175 ?auto_2176 ) ( AIRCRAFT-AT ?auto_2176 ?auto_2174 ) )
    :subtasks
    ( ( !DEBARK ?auto_2175 ?auto_2176 ?auto_2174 )
      ( FLY-1PPL-VERIFY ?auto_2175 ?auto_2174 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2187 - PERSON
      ?auto_2186 - CITY
    )
    :vars
    (
      ?auto_2188 - AIRCRAFT
      ?auto_2191 - CITY
      ?auto_2189 - FLEVEL
      ?auto_2190 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_2187 ?auto_2188 ) ( AIRCRAFT-AT ?auto_2188 ?auto_2191 ) ( FUEL-LEVEL ?auto_2188 ?auto_2189 ) ( NEXT ?auto_2190 ?auto_2189 ) ( not ( = ?auto_2186 ?auto_2191 ) ) ( not ( = ?auto_2189 ?auto_2190 ) ) )
    :subtasks
    ( ( !FLY ?auto_2188 ?auto_2191 ?auto_2186 ?auto_2189 ?auto_2190 )
      ( FLY-1PPL ?auto_2187 ?auto_2186 )
      ( FLY-1PPL-VERIFY ?auto_2187 ?auto_2186 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2208 - PERSON
      ?auto_2207 - CITY
    )
    :vars
    (
      ?auto_2211 - AIRCRAFT
      ?auto_2209 - CITY
      ?auto_2212 - FLEVEL
      ?auto_2210 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2211 ?auto_2209 ) ( FUEL-LEVEL ?auto_2211 ?auto_2212 ) ( NEXT ?auto_2210 ?auto_2212 ) ( not ( = ?auto_2207 ?auto_2209 ) ) ( not ( = ?auto_2212 ?auto_2210 ) ) ( PERSON-AT ?auto_2208 ?auto_2209 ) )
    :subtasks
    ( ( !BOARD ?auto_2208 ?auto_2211 ?auto_2209 )
      ( FLY-1PPL ?auto_2208 ?auto_2207 )
      ( FLY-1PPL-VERIFY ?auto_2208 ?auto_2207 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2229 - PERSON
      ?auto_2228 - CITY
    )
    :vars
    (
      ?auto_2231 - AIRCRAFT
      ?auto_2230 - CITY
      ?auto_2232 - FLEVEL
      ?auto_2233 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2231 ?auto_2230 ) ( NEXT ?auto_2232 ?auto_2233 ) ( not ( = ?auto_2228 ?auto_2230 ) ) ( not ( = ?auto_2233 ?auto_2232 ) ) ( PERSON-AT ?auto_2229 ?auto_2230 ) ( FUEL-LEVEL ?auto_2231 ?auto_2232 ) )
    :subtasks
    ( ( !REFUEL ?auto_2231 ?auto_2230 ?auto_2232 ?auto_2233 )
      ( FLY-1PPL ?auto_2229 ?auto_2228 )
      ( FLY-1PPL-VERIFY ?auto_2229 ?auto_2228 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2250 - PERSON
      ?auto_2249 - CITY
    )
    :vars
    (
      ?auto_2253 - FLEVEL
      ?auto_2252 - FLEVEL
      ?auto_2254 - CITY
      ?auto_2251 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2253 ?auto_2252 ) ( not ( = ?auto_2249 ?auto_2254 ) ) ( not ( = ?auto_2252 ?auto_2253 ) ) ( PERSON-AT ?auto_2250 ?auto_2254 ) ( AIRCRAFT-AT ?auto_2251 ?auto_2249 ) ( FUEL-LEVEL ?auto_2251 ?auto_2252 ) )
    :subtasks
    ( ( !FLY ?auto_2251 ?auto_2249 ?auto_2254 ?auto_2252 ?auto_2253 )
      ( FLY-1PPL ?auto_2250 ?auto_2249 )
      ( FLY-1PPL-VERIFY ?auto_2250 ?auto_2249 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2271 - PERSON
      ?auto_2270 - CITY
    )
    :vars
    (
      ?auto_2275 - FLEVEL
      ?auto_2273 - FLEVEL
      ?auto_2272 - CITY
      ?auto_2274 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2275 ?auto_2273 ) ( not ( = ?auto_2270 ?auto_2272 ) ) ( not ( = ?auto_2273 ?auto_2275 ) ) ( PERSON-AT ?auto_2271 ?auto_2272 ) ( AIRCRAFT-AT ?auto_2274 ?auto_2270 ) ( FUEL-LEVEL ?auto_2274 ?auto_2275 ) )
    :subtasks
    ( ( !REFUEL ?auto_2274 ?auto_2270 ?auto_2275 ?auto_2273 )
      ( FLY-1PPL ?auto_2271 ?auto_2270 )
      ( FLY-1PPL-VERIFY ?auto_2271 ?auto_2270 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2331 - PERSON
      ?auto_2330 - CITY
    )
    :vars
    (
      ?auto_2332 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_2331 ?auto_2332 ) ( AIRCRAFT-AT ?auto_2332 ?auto_2330 ) )
    :subtasks
    ( ( !DEBARK ?auto_2331 ?auto_2332 ?auto_2330 )
      ( FLY-1PPL-VERIFY ?auto_2331 ?auto_2330 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2334 - PERSON
      ?auto_2335 - PERSON
      ?auto_2333 - CITY
    )
    :vars
    (
      ?auto_2336 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_2335 ?auto_2336 ) ( AIRCRAFT-AT ?auto_2336 ?auto_2333 ) ( PERSON-AT ?auto_2334 ?auto_2333 ) ( not ( = ?auto_2334 ?auto_2335 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2335 ?auto_2333 )
      ( FLY-2PPL-VERIFY ?auto_2334 ?auto_2335 ?auto_2333 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2338 - PERSON
      ?auto_2339 - PERSON
      ?auto_2337 - CITY
    )
    :vars
    (
      ?auto_2340 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_2338 ?auto_2340 ) ( AIRCRAFT-AT ?auto_2340 ?auto_2337 ) ( PERSON-AT ?auto_2339 ?auto_2337 ) ( not ( = ?auto_2338 ?auto_2339 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2338 ?auto_2337 )
      ( FLY-2PPL-VERIFY ?auto_2338 ?auto_2339 ?auto_2337 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2346 - PERSON
      ?auto_2347 - PERSON
      ?auto_2348 - PERSON
      ?auto_2345 - CITY
    )
    :vars
    (
      ?auto_2349 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_2348 ?auto_2349 ) ( AIRCRAFT-AT ?auto_2349 ?auto_2345 ) ( PERSON-AT ?auto_2346 ?auto_2345 ) ( PERSON-AT ?auto_2347 ?auto_2345 ) ( not ( = ?auto_2346 ?auto_2347 ) ) ( not ( = ?auto_2346 ?auto_2348 ) ) ( not ( = ?auto_2347 ?auto_2348 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2348 ?auto_2345 )
      ( FLY-3PPL-VERIFY ?auto_2346 ?auto_2347 ?auto_2348 ?auto_2345 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2351 - PERSON
      ?auto_2352 - PERSON
      ?auto_2353 - PERSON
      ?auto_2350 - CITY
    )
    :vars
    (
      ?auto_2354 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_2352 ?auto_2354 ) ( AIRCRAFT-AT ?auto_2354 ?auto_2350 ) ( PERSON-AT ?auto_2351 ?auto_2350 ) ( PERSON-AT ?auto_2353 ?auto_2350 ) ( not ( = ?auto_2351 ?auto_2352 ) ) ( not ( = ?auto_2351 ?auto_2353 ) ) ( not ( = ?auto_2352 ?auto_2353 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2352 ?auto_2350 )
      ( FLY-3PPL-VERIFY ?auto_2351 ?auto_2352 ?auto_2353 ?auto_2350 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2361 - PERSON
      ?auto_2362 - PERSON
      ?auto_2363 - PERSON
      ?auto_2360 - CITY
    )
    :vars
    (
      ?auto_2364 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_2361 ?auto_2364 ) ( AIRCRAFT-AT ?auto_2364 ?auto_2360 ) ( PERSON-AT ?auto_2362 ?auto_2360 ) ( PERSON-AT ?auto_2363 ?auto_2360 ) ( not ( = ?auto_2361 ?auto_2362 ) ) ( not ( = ?auto_2361 ?auto_2363 ) ) ( not ( = ?auto_2362 ?auto_2363 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2361 ?auto_2360 )
      ( FLY-3PPL-VERIFY ?auto_2361 ?auto_2362 ?auto_2363 ?auto_2360 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2381 - PERSON
      ?auto_2380 - CITY
    )
    :vars
    (
      ?auto_2382 - AIRCRAFT
      ?auto_2385 - CITY
      ?auto_2383 - FLEVEL
      ?auto_2384 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_2381 ?auto_2382 ) ( AIRCRAFT-AT ?auto_2382 ?auto_2385 ) ( FUEL-LEVEL ?auto_2382 ?auto_2383 ) ( NEXT ?auto_2384 ?auto_2383 ) ( not ( = ?auto_2380 ?auto_2385 ) ) ( not ( = ?auto_2383 ?auto_2384 ) ) )
    :subtasks
    ( ( !FLY ?auto_2382 ?auto_2385 ?auto_2380 ?auto_2383 ?auto_2384 )
      ( FLY-1PPL ?auto_2381 ?auto_2380 )
      ( FLY-1PPL-VERIFY ?auto_2381 ?auto_2380 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2387 - PERSON
      ?auto_2388 - PERSON
      ?auto_2386 - CITY
    )
    :vars
    (
      ?auto_2389 - AIRCRAFT
      ?auto_2391 - CITY
      ?auto_2392 - FLEVEL
      ?auto_2390 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_2388 ?auto_2389 ) ( AIRCRAFT-AT ?auto_2389 ?auto_2391 ) ( FUEL-LEVEL ?auto_2389 ?auto_2392 ) ( NEXT ?auto_2390 ?auto_2392 ) ( not ( = ?auto_2386 ?auto_2391 ) ) ( not ( = ?auto_2392 ?auto_2390 ) ) ( PERSON-AT ?auto_2387 ?auto_2386 ) ( not ( = ?auto_2387 ?auto_2388 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2388 ?auto_2386 )
      ( FLY-2PPL-VERIFY ?auto_2387 ?auto_2388 ?auto_2386 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2394 - PERSON
      ?auto_2395 - PERSON
      ?auto_2393 - CITY
    )
    :vars
    (
      ?auto_2398 - AIRCRAFT
      ?auto_2396 - CITY
      ?auto_2397 - FLEVEL
      ?auto_2399 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_2394 ?auto_2398 ) ( AIRCRAFT-AT ?auto_2398 ?auto_2396 ) ( FUEL-LEVEL ?auto_2398 ?auto_2397 ) ( NEXT ?auto_2399 ?auto_2397 ) ( not ( = ?auto_2393 ?auto_2396 ) ) ( not ( = ?auto_2397 ?auto_2399 ) ) ( PERSON-AT ?auto_2395 ?auto_2393 ) ( not ( = ?auto_2395 ?auto_2394 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2395 ?auto_2394 ?auto_2393 )
      ( FLY-2PPL-VERIFY ?auto_2394 ?auto_2395 ?auto_2393 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2409 - PERSON
      ?auto_2410 - PERSON
      ?auto_2411 - PERSON
      ?auto_2408 - CITY
    )
    :vars
    (
      ?auto_2414 - AIRCRAFT
      ?auto_2412 - CITY
      ?auto_2413 - FLEVEL
      ?auto_2415 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_2411 ?auto_2414 ) ( AIRCRAFT-AT ?auto_2414 ?auto_2412 ) ( FUEL-LEVEL ?auto_2414 ?auto_2413 ) ( NEXT ?auto_2415 ?auto_2413 ) ( not ( = ?auto_2408 ?auto_2412 ) ) ( not ( = ?auto_2413 ?auto_2415 ) ) ( PERSON-AT ?auto_2410 ?auto_2408 ) ( not ( = ?auto_2410 ?auto_2411 ) ) ( PERSON-AT ?auto_2409 ?auto_2408 ) ( not ( = ?auto_2409 ?auto_2410 ) ) ( not ( = ?auto_2409 ?auto_2411 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2410 ?auto_2411 ?auto_2408 )
      ( FLY-3PPL-VERIFY ?auto_2409 ?auto_2410 ?auto_2411 ?auto_2408 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2417 - PERSON
      ?auto_2418 - PERSON
      ?auto_2419 - PERSON
      ?auto_2416 - CITY
    )
    :vars
    (
      ?auto_2422 - AIRCRAFT
      ?auto_2420 - CITY
      ?auto_2421 - FLEVEL
      ?auto_2423 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_2418 ?auto_2422 ) ( AIRCRAFT-AT ?auto_2422 ?auto_2420 ) ( FUEL-LEVEL ?auto_2422 ?auto_2421 ) ( NEXT ?auto_2423 ?auto_2421 ) ( not ( = ?auto_2416 ?auto_2420 ) ) ( not ( = ?auto_2421 ?auto_2423 ) ) ( PERSON-AT ?auto_2419 ?auto_2416 ) ( not ( = ?auto_2419 ?auto_2418 ) ) ( PERSON-AT ?auto_2417 ?auto_2416 ) ( not ( = ?auto_2417 ?auto_2418 ) ) ( not ( = ?auto_2417 ?auto_2419 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2419 ?auto_2418 ?auto_2416 )
      ( FLY-3PPL-VERIFY ?auto_2417 ?auto_2418 ?auto_2419 ?auto_2416 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2433 - PERSON
      ?auto_2434 - PERSON
      ?auto_2435 - PERSON
      ?auto_2432 - CITY
    )
    :vars
    (
      ?auto_2438 - AIRCRAFT
      ?auto_2436 - CITY
      ?auto_2437 - FLEVEL
      ?auto_2439 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_2433 ?auto_2438 ) ( AIRCRAFT-AT ?auto_2438 ?auto_2436 ) ( FUEL-LEVEL ?auto_2438 ?auto_2437 ) ( NEXT ?auto_2439 ?auto_2437 ) ( not ( = ?auto_2432 ?auto_2436 ) ) ( not ( = ?auto_2437 ?auto_2439 ) ) ( PERSON-AT ?auto_2434 ?auto_2432 ) ( not ( = ?auto_2434 ?auto_2433 ) ) ( PERSON-AT ?auto_2435 ?auto_2432 ) ( not ( = ?auto_2433 ?auto_2435 ) ) ( not ( = ?auto_2434 ?auto_2435 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2434 ?auto_2433 ?auto_2432 )
      ( FLY-3PPL-VERIFY ?auto_2433 ?auto_2434 ?auto_2435 ?auto_2432 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2466 - PERSON
      ?auto_2465 - CITY
    )
    :vars
    (
      ?auto_2469 - AIRCRAFT
      ?auto_2467 - CITY
      ?auto_2468 - FLEVEL
      ?auto_2470 - FLEVEL
      ?auto_2471 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2469 ?auto_2467 ) ( FUEL-LEVEL ?auto_2469 ?auto_2468 ) ( NEXT ?auto_2470 ?auto_2468 ) ( not ( = ?auto_2465 ?auto_2467 ) ) ( not ( = ?auto_2468 ?auto_2470 ) ) ( PERSON-AT ?auto_2471 ?auto_2465 ) ( not ( = ?auto_2471 ?auto_2466 ) ) ( PERSON-AT ?auto_2466 ?auto_2467 ) )
    :subtasks
    ( ( !BOARD ?auto_2466 ?auto_2469 ?auto_2467 )
      ( FLY-2PPL ?auto_2471 ?auto_2466 ?auto_2465 )
      ( FLY-1PPL-VERIFY ?auto_2466 ?auto_2465 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2473 - PERSON
      ?auto_2474 - PERSON
      ?auto_2472 - CITY
    )
    :vars
    (
      ?auto_2477 - AIRCRAFT
      ?auto_2476 - CITY
      ?auto_2475 - FLEVEL
      ?auto_2478 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2477 ?auto_2476 ) ( FUEL-LEVEL ?auto_2477 ?auto_2475 ) ( NEXT ?auto_2478 ?auto_2475 ) ( not ( = ?auto_2472 ?auto_2476 ) ) ( not ( = ?auto_2475 ?auto_2478 ) ) ( PERSON-AT ?auto_2473 ?auto_2472 ) ( not ( = ?auto_2473 ?auto_2474 ) ) ( PERSON-AT ?auto_2474 ?auto_2476 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2474 ?auto_2472 )
      ( FLY-2PPL-VERIFY ?auto_2473 ?auto_2474 ?auto_2472 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2480 - PERSON
      ?auto_2481 - PERSON
      ?auto_2479 - CITY
    )
    :vars
    (
      ?auto_2484 - AIRCRAFT
      ?auto_2485 - CITY
      ?auto_2483 - FLEVEL
      ?auto_2482 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2484 ?auto_2485 ) ( FUEL-LEVEL ?auto_2484 ?auto_2483 ) ( NEXT ?auto_2482 ?auto_2483 ) ( not ( = ?auto_2479 ?auto_2485 ) ) ( not ( = ?auto_2483 ?auto_2482 ) ) ( PERSON-AT ?auto_2481 ?auto_2479 ) ( not ( = ?auto_2481 ?auto_2480 ) ) ( PERSON-AT ?auto_2480 ?auto_2485 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2481 ?auto_2480 ?auto_2479 )
      ( FLY-2PPL-VERIFY ?auto_2480 ?auto_2481 ?auto_2479 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2495 - PERSON
      ?auto_2496 - PERSON
      ?auto_2497 - PERSON
      ?auto_2494 - CITY
    )
    :vars
    (
      ?auto_2500 - AIRCRAFT
      ?auto_2501 - CITY
      ?auto_2499 - FLEVEL
      ?auto_2498 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2500 ?auto_2501 ) ( FUEL-LEVEL ?auto_2500 ?auto_2499 ) ( NEXT ?auto_2498 ?auto_2499 ) ( not ( = ?auto_2494 ?auto_2501 ) ) ( not ( = ?auto_2499 ?auto_2498 ) ) ( PERSON-AT ?auto_2495 ?auto_2494 ) ( not ( = ?auto_2495 ?auto_2497 ) ) ( PERSON-AT ?auto_2497 ?auto_2501 ) ( PERSON-AT ?auto_2496 ?auto_2494 ) ( not ( = ?auto_2495 ?auto_2496 ) ) ( not ( = ?auto_2496 ?auto_2497 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2495 ?auto_2497 ?auto_2494 )
      ( FLY-3PPL-VERIFY ?auto_2495 ?auto_2496 ?auto_2497 ?auto_2494 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2503 - PERSON
      ?auto_2504 - PERSON
      ?auto_2505 - PERSON
      ?auto_2502 - CITY
    )
    :vars
    (
      ?auto_2508 - AIRCRAFT
      ?auto_2509 - CITY
      ?auto_2507 - FLEVEL
      ?auto_2506 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2508 ?auto_2509 ) ( FUEL-LEVEL ?auto_2508 ?auto_2507 ) ( NEXT ?auto_2506 ?auto_2507 ) ( not ( = ?auto_2502 ?auto_2509 ) ) ( not ( = ?auto_2507 ?auto_2506 ) ) ( PERSON-AT ?auto_2505 ?auto_2502 ) ( not ( = ?auto_2505 ?auto_2504 ) ) ( PERSON-AT ?auto_2504 ?auto_2509 ) ( PERSON-AT ?auto_2503 ?auto_2502 ) ( not ( = ?auto_2503 ?auto_2504 ) ) ( not ( = ?auto_2503 ?auto_2505 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2505 ?auto_2504 ?auto_2502 )
      ( FLY-3PPL-VERIFY ?auto_2503 ?auto_2504 ?auto_2505 ?auto_2502 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2519 - PERSON
      ?auto_2520 - PERSON
      ?auto_2521 - PERSON
      ?auto_2518 - CITY
    )
    :vars
    (
      ?auto_2524 - AIRCRAFT
      ?auto_2525 - CITY
      ?auto_2523 - FLEVEL
      ?auto_2522 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2524 ?auto_2525 ) ( FUEL-LEVEL ?auto_2524 ?auto_2523 ) ( NEXT ?auto_2522 ?auto_2523 ) ( not ( = ?auto_2518 ?auto_2525 ) ) ( not ( = ?auto_2523 ?auto_2522 ) ) ( PERSON-AT ?auto_2520 ?auto_2518 ) ( not ( = ?auto_2520 ?auto_2519 ) ) ( PERSON-AT ?auto_2519 ?auto_2525 ) ( PERSON-AT ?auto_2521 ?auto_2518 ) ( not ( = ?auto_2519 ?auto_2521 ) ) ( not ( = ?auto_2520 ?auto_2521 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2520 ?auto_2519 ?auto_2518 )
      ( FLY-3PPL-VERIFY ?auto_2519 ?auto_2520 ?auto_2521 ?auto_2518 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2552 - PERSON
      ?auto_2551 - CITY
    )
    :vars
    (
      ?auto_2556 - AIRCRAFT
      ?auto_2557 - CITY
      ?auto_2554 - FLEVEL
      ?auto_2555 - FLEVEL
      ?auto_2553 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2556 ?auto_2557 ) ( NEXT ?auto_2554 ?auto_2555 ) ( not ( = ?auto_2551 ?auto_2557 ) ) ( not ( = ?auto_2555 ?auto_2554 ) ) ( PERSON-AT ?auto_2553 ?auto_2551 ) ( not ( = ?auto_2553 ?auto_2552 ) ) ( PERSON-AT ?auto_2552 ?auto_2557 ) ( FUEL-LEVEL ?auto_2556 ?auto_2554 ) )
    :subtasks
    ( ( !REFUEL ?auto_2556 ?auto_2557 ?auto_2554 ?auto_2555 )
      ( FLY-2PPL ?auto_2553 ?auto_2552 ?auto_2551 )
      ( FLY-1PPL-VERIFY ?auto_2552 ?auto_2551 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2559 - PERSON
      ?auto_2560 - PERSON
      ?auto_2558 - CITY
    )
    :vars
    (
      ?auto_2562 - AIRCRAFT
      ?auto_2564 - CITY
      ?auto_2563 - FLEVEL
      ?auto_2561 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2562 ?auto_2564 ) ( NEXT ?auto_2563 ?auto_2561 ) ( not ( = ?auto_2558 ?auto_2564 ) ) ( not ( = ?auto_2561 ?auto_2563 ) ) ( PERSON-AT ?auto_2559 ?auto_2558 ) ( not ( = ?auto_2559 ?auto_2560 ) ) ( PERSON-AT ?auto_2560 ?auto_2564 ) ( FUEL-LEVEL ?auto_2562 ?auto_2563 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2560 ?auto_2558 )
      ( FLY-2PPL-VERIFY ?auto_2559 ?auto_2560 ?auto_2558 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2566 - PERSON
      ?auto_2567 - PERSON
      ?auto_2565 - CITY
    )
    :vars
    (
      ?auto_2568 - AIRCRAFT
      ?auto_2569 - CITY
      ?auto_2570 - FLEVEL
      ?auto_2571 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2568 ?auto_2569 ) ( NEXT ?auto_2570 ?auto_2571 ) ( not ( = ?auto_2565 ?auto_2569 ) ) ( not ( = ?auto_2571 ?auto_2570 ) ) ( PERSON-AT ?auto_2567 ?auto_2565 ) ( not ( = ?auto_2567 ?auto_2566 ) ) ( PERSON-AT ?auto_2566 ?auto_2569 ) ( FUEL-LEVEL ?auto_2568 ?auto_2570 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2567 ?auto_2566 ?auto_2565 )
      ( FLY-2PPL-VERIFY ?auto_2566 ?auto_2567 ?auto_2565 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2581 - PERSON
      ?auto_2582 - PERSON
      ?auto_2583 - PERSON
      ?auto_2580 - CITY
    )
    :vars
    (
      ?auto_2584 - AIRCRAFT
      ?auto_2585 - CITY
      ?auto_2586 - FLEVEL
      ?auto_2587 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2584 ?auto_2585 ) ( NEXT ?auto_2586 ?auto_2587 ) ( not ( = ?auto_2580 ?auto_2585 ) ) ( not ( = ?auto_2587 ?auto_2586 ) ) ( PERSON-AT ?auto_2581 ?auto_2580 ) ( not ( = ?auto_2581 ?auto_2583 ) ) ( PERSON-AT ?auto_2583 ?auto_2585 ) ( FUEL-LEVEL ?auto_2584 ?auto_2586 ) ( PERSON-AT ?auto_2582 ?auto_2580 ) ( not ( = ?auto_2581 ?auto_2582 ) ) ( not ( = ?auto_2582 ?auto_2583 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2581 ?auto_2583 ?auto_2580 )
      ( FLY-3PPL-VERIFY ?auto_2581 ?auto_2582 ?auto_2583 ?auto_2580 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2589 - PERSON
      ?auto_2590 - PERSON
      ?auto_2591 - PERSON
      ?auto_2588 - CITY
    )
    :vars
    (
      ?auto_2592 - AIRCRAFT
      ?auto_2593 - CITY
      ?auto_2594 - FLEVEL
      ?auto_2595 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2592 ?auto_2593 ) ( NEXT ?auto_2594 ?auto_2595 ) ( not ( = ?auto_2588 ?auto_2593 ) ) ( not ( = ?auto_2595 ?auto_2594 ) ) ( PERSON-AT ?auto_2591 ?auto_2588 ) ( not ( = ?auto_2591 ?auto_2590 ) ) ( PERSON-AT ?auto_2590 ?auto_2593 ) ( FUEL-LEVEL ?auto_2592 ?auto_2594 ) ( PERSON-AT ?auto_2589 ?auto_2588 ) ( not ( = ?auto_2589 ?auto_2590 ) ) ( not ( = ?auto_2589 ?auto_2591 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2591 ?auto_2590 ?auto_2588 )
      ( FLY-3PPL-VERIFY ?auto_2589 ?auto_2590 ?auto_2591 ?auto_2588 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2605 - PERSON
      ?auto_2606 - PERSON
      ?auto_2607 - PERSON
      ?auto_2604 - CITY
    )
    :vars
    (
      ?auto_2608 - AIRCRAFT
      ?auto_2609 - CITY
      ?auto_2610 - FLEVEL
      ?auto_2611 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_2608 ?auto_2609 ) ( NEXT ?auto_2610 ?auto_2611 ) ( not ( = ?auto_2604 ?auto_2609 ) ) ( not ( = ?auto_2611 ?auto_2610 ) ) ( PERSON-AT ?auto_2607 ?auto_2604 ) ( not ( = ?auto_2607 ?auto_2605 ) ) ( PERSON-AT ?auto_2605 ?auto_2609 ) ( FUEL-LEVEL ?auto_2608 ?auto_2610 ) ( PERSON-AT ?auto_2606 ?auto_2604 ) ( not ( = ?auto_2605 ?auto_2606 ) ) ( not ( = ?auto_2606 ?auto_2607 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2607 ?auto_2605 ?auto_2604 )
      ( FLY-3PPL-VERIFY ?auto_2605 ?auto_2606 ?auto_2607 ?auto_2604 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2638 - PERSON
      ?auto_2637 - CITY
    )
    :vars
    (
      ?auto_2642 - FLEVEL
      ?auto_2643 - FLEVEL
      ?auto_2640 - CITY
      ?auto_2641 - PERSON
      ?auto_2639 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2642 ?auto_2643 ) ( not ( = ?auto_2637 ?auto_2640 ) ) ( not ( = ?auto_2643 ?auto_2642 ) ) ( PERSON-AT ?auto_2641 ?auto_2637 ) ( not ( = ?auto_2641 ?auto_2638 ) ) ( PERSON-AT ?auto_2638 ?auto_2640 ) ( AIRCRAFT-AT ?auto_2639 ?auto_2637 ) ( FUEL-LEVEL ?auto_2639 ?auto_2643 ) )
    :subtasks
    ( ( !FLY ?auto_2639 ?auto_2637 ?auto_2640 ?auto_2643 ?auto_2642 )
      ( FLY-2PPL ?auto_2641 ?auto_2638 ?auto_2637 )
      ( FLY-1PPL-VERIFY ?auto_2638 ?auto_2637 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2645 - PERSON
      ?auto_2646 - PERSON
      ?auto_2644 - CITY
    )
    :vars
    (
      ?auto_2650 - FLEVEL
      ?auto_2647 - FLEVEL
      ?auto_2648 - CITY
      ?auto_2649 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2650 ?auto_2647 ) ( not ( = ?auto_2644 ?auto_2648 ) ) ( not ( = ?auto_2647 ?auto_2650 ) ) ( PERSON-AT ?auto_2645 ?auto_2644 ) ( not ( = ?auto_2645 ?auto_2646 ) ) ( PERSON-AT ?auto_2646 ?auto_2648 ) ( AIRCRAFT-AT ?auto_2649 ?auto_2644 ) ( FUEL-LEVEL ?auto_2649 ?auto_2647 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2646 ?auto_2644 )
      ( FLY-2PPL-VERIFY ?auto_2645 ?auto_2646 ?auto_2644 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2652 - PERSON
      ?auto_2653 - PERSON
      ?auto_2651 - CITY
    )
    :vars
    (
      ?auto_2657 - FLEVEL
      ?auto_2654 - FLEVEL
      ?auto_2655 - CITY
      ?auto_2656 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2657 ?auto_2654 ) ( not ( = ?auto_2651 ?auto_2655 ) ) ( not ( = ?auto_2654 ?auto_2657 ) ) ( PERSON-AT ?auto_2653 ?auto_2651 ) ( not ( = ?auto_2653 ?auto_2652 ) ) ( PERSON-AT ?auto_2652 ?auto_2655 ) ( AIRCRAFT-AT ?auto_2656 ?auto_2651 ) ( FUEL-LEVEL ?auto_2656 ?auto_2654 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2653 ?auto_2652 ?auto_2651 )
      ( FLY-2PPL-VERIFY ?auto_2652 ?auto_2653 ?auto_2651 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2667 - PERSON
      ?auto_2668 - PERSON
      ?auto_2669 - PERSON
      ?auto_2666 - CITY
    )
    :vars
    (
      ?auto_2673 - FLEVEL
      ?auto_2670 - FLEVEL
      ?auto_2671 - CITY
      ?auto_2672 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2673 ?auto_2670 ) ( not ( = ?auto_2666 ?auto_2671 ) ) ( not ( = ?auto_2670 ?auto_2673 ) ) ( PERSON-AT ?auto_2667 ?auto_2666 ) ( not ( = ?auto_2667 ?auto_2669 ) ) ( PERSON-AT ?auto_2669 ?auto_2671 ) ( AIRCRAFT-AT ?auto_2672 ?auto_2666 ) ( FUEL-LEVEL ?auto_2672 ?auto_2670 ) ( PERSON-AT ?auto_2668 ?auto_2666 ) ( not ( = ?auto_2667 ?auto_2668 ) ) ( not ( = ?auto_2668 ?auto_2669 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2667 ?auto_2669 ?auto_2666 )
      ( FLY-3PPL-VERIFY ?auto_2667 ?auto_2668 ?auto_2669 ?auto_2666 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2675 - PERSON
      ?auto_2676 - PERSON
      ?auto_2677 - PERSON
      ?auto_2674 - CITY
    )
    :vars
    (
      ?auto_2681 - FLEVEL
      ?auto_2678 - FLEVEL
      ?auto_2679 - CITY
      ?auto_2680 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2681 ?auto_2678 ) ( not ( = ?auto_2674 ?auto_2679 ) ) ( not ( = ?auto_2678 ?auto_2681 ) ) ( PERSON-AT ?auto_2677 ?auto_2674 ) ( not ( = ?auto_2677 ?auto_2676 ) ) ( PERSON-AT ?auto_2676 ?auto_2679 ) ( AIRCRAFT-AT ?auto_2680 ?auto_2674 ) ( FUEL-LEVEL ?auto_2680 ?auto_2678 ) ( PERSON-AT ?auto_2675 ?auto_2674 ) ( not ( = ?auto_2675 ?auto_2676 ) ) ( not ( = ?auto_2675 ?auto_2677 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2677 ?auto_2676 ?auto_2674 )
      ( FLY-3PPL-VERIFY ?auto_2675 ?auto_2676 ?auto_2677 ?auto_2674 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2691 - PERSON
      ?auto_2692 - PERSON
      ?auto_2693 - PERSON
      ?auto_2690 - CITY
    )
    :vars
    (
      ?auto_2697 - FLEVEL
      ?auto_2694 - FLEVEL
      ?auto_2695 - CITY
      ?auto_2696 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2697 ?auto_2694 ) ( not ( = ?auto_2690 ?auto_2695 ) ) ( not ( = ?auto_2694 ?auto_2697 ) ) ( PERSON-AT ?auto_2693 ?auto_2690 ) ( not ( = ?auto_2693 ?auto_2691 ) ) ( PERSON-AT ?auto_2691 ?auto_2695 ) ( AIRCRAFT-AT ?auto_2696 ?auto_2690 ) ( FUEL-LEVEL ?auto_2696 ?auto_2694 ) ( PERSON-AT ?auto_2692 ?auto_2690 ) ( not ( = ?auto_2691 ?auto_2692 ) ) ( not ( = ?auto_2692 ?auto_2693 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2693 ?auto_2691 ?auto_2690 )
      ( FLY-3PPL-VERIFY ?auto_2691 ?auto_2692 ?auto_2693 ?auto_2690 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2724 - PERSON
      ?auto_2723 - CITY
    )
    :vars
    (
      ?auto_2729 - FLEVEL
      ?auto_2726 - FLEVEL
      ?auto_2727 - CITY
      ?auto_2725 - PERSON
      ?auto_2728 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2729 ?auto_2726 ) ( not ( = ?auto_2723 ?auto_2727 ) ) ( not ( = ?auto_2726 ?auto_2729 ) ) ( PERSON-AT ?auto_2725 ?auto_2723 ) ( not ( = ?auto_2725 ?auto_2724 ) ) ( PERSON-AT ?auto_2724 ?auto_2727 ) ( AIRCRAFT-AT ?auto_2728 ?auto_2723 ) ( FUEL-LEVEL ?auto_2728 ?auto_2729 ) )
    :subtasks
    ( ( !REFUEL ?auto_2728 ?auto_2723 ?auto_2729 ?auto_2726 )
      ( FLY-2PPL ?auto_2725 ?auto_2724 ?auto_2723 )
      ( FLY-1PPL-VERIFY ?auto_2724 ?auto_2723 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2731 - PERSON
      ?auto_2732 - PERSON
      ?auto_2730 - CITY
    )
    :vars
    (
      ?auto_2736 - FLEVEL
      ?auto_2734 - FLEVEL
      ?auto_2735 - CITY
      ?auto_2733 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2736 ?auto_2734 ) ( not ( = ?auto_2730 ?auto_2735 ) ) ( not ( = ?auto_2734 ?auto_2736 ) ) ( PERSON-AT ?auto_2731 ?auto_2730 ) ( not ( = ?auto_2731 ?auto_2732 ) ) ( PERSON-AT ?auto_2732 ?auto_2735 ) ( AIRCRAFT-AT ?auto_2733 ?auto_2730 ) ( FUEL-LEVEL ?auto_2733 ?auto_2736 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2732 ?auto_2730 )
      ( FLY-2PPL-VERIFY ?auto_2731 ?auto_2732 ?auto_2730 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2738 - PERSON
      ?auto_2739 - PERSON
      ?auto_2737 - CITY
    )
    :vars
    (
      ?auto_2741 - FLEVEL
      ?auto_2743 - FLEVEL
      ?auto_2740 - CITY
      ?auto_2742 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2741 ?auto_2743 ) ( not ( = ?auto_2737 ?auto_2740 ) ) ( not ( = ?auto_2743 ?auto_2741 ) ) ( PERSON-AT ?auto_2739 ?auto_2737 ) ( not ( = ?auto_2739 ?auto_2738 ) ) ( PERSON-AT ?auto_2738 ?auto_2740 ) ( AIRCRAFT-AT ?auto_2742 ?auto_2737 ) ( FUEL-LEVEL ?auto_2742 ?auto_2741 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2739 ?auto_2738 ?auto_2737 )
      ( FLY-2PPL-VERIFY ?auto_2738 ?auto_2739 ?auto_2737 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2753 - PERSON
      ?auto_2754 - PERSON
      ?auto_2755 - PERSON
      ?auto_2752 - CITY
    )
    :vars
    (
      ?auto_2757 - FLEVEL
      ?auto_2759 - FLEVEL
      ?auto_2756 - CITY
      ?auto_2758 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2757 ?auto_2759 ) ( not ( = ?auto_2752 ?auto_2756 ) ) ( not ( = ?auto_2759 ?auto_2757 ) ) ( PERSON-AT ?auto_2753 ?auto_2752 ) ( not ( = ?auto_2753 ?auto_2755 ) ) ( PERSON-AT ?auto_2755 ?auto_2756 ) ( AIRCRAFT-AT ?auto_2758 ?auto_2752 ) ( FUEL-LEVEL ?auto_2758 ?auto_2757 ) ( PERSON-AT ?auto_2754 ?auto_2752 ) ( not ( = ?auto_2753 ?auto_2754 ) ) ( not ( = ?auto_2754 ?auto_2755 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2753 ?auto_2755 ?auto_2752 )
      ( FLY-3PPL-VERIFY ?auto_2753 ?auto_2754 ?auto_2755 ?auto_2752 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2761 - PERSON
      ?auto_2762 - PERSON
      ?auto_2763 - PERSON
      ?auto_2760 - CITY
    )
    :vars
    (
      ?auto_2765 - FLEVEL
      ?auto_2767 - FLEVEL
      ?auto_2764 - CITY
      ?auto_2766 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2765 ?auto_2767 ) ( not ( = ?auto_2760 ?auto_2764 ) ) ( not ( = ?auto_2767 ?auto_2765 ) ) ( PERSON-AT ?auto_2763 ?auto_2760 ) ( not ( = ?auto_2763 ?auto_2762 ) ) ( PERSON-AT ?auto_2762 ?auto_2764 ) ( AIRCRAFT-AT ?auto_2766 ?auto_2760 ) ( FUEL-LEVEL ?auto_2766 ?auto_2765 ) ( PERSON-AT ?auto_2761 ?auto_2760 ) ( not ( = ?auto_2761 ?auto_2762 ) ) ( not ( = ?auto_2761 ?auto_2763 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2763 ?auto_2762 ?auto_2760 )
      ( FLY-3PPL-VERIFY ?auto_2761 ?auto_2762 ?auto_2763 ?auto_2760 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_2777 - PERSON
      ?auto_2778 - PERSON
      ?auto_2779 - PERSON
      ?auto_2776 - CITY
    )
    :vars
    (
      ?auto_2781 - FLEVEL
      ?auto_2783 - FLEVEL
      ?auto_2780 - CITY
      ?auto_2782 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2781 ?auto_2783 ) ( not ( = ?auto_2776 ?auto_2780 ) ) ( not ( = ?auto_2783 ?auto_2781 ) ) ( PERSON-AT ?auto_2779 ?auto_2776 ) ( not ( = ?auto_2779 ?auto_2777 ) ) ( PERSON-AT ?auto_2777 ?auto_2780 ) ( AIRCRAFT-AT ?auto_2782 ?auto_2776 ) ( FUEL-LEVEL ?auto_2782 ?auto_2781 ) ( PERSON-AT ?auto_2778 ?auto_2776 ) ( not ( = ?auto_2777 ?auto_2778 ) ) ( not ( = ?auto_2778 ?auto_2779 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2779 ?auto_2777 ?auto_2776 )
      ( FLY-3PPL-VERIFY ?auto_2777 ?auto_2778 ?auto_2779 ?auto_2776 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2810 - PERSON
      ?auto_2809 - CITY
    )
    :vars
    (
      ?auto_2812 - FLEVEL
      ?auto_2814 - FLEVEL
      ?auto_2811 - CITY
      ?auto_2815 - PERSON
      ?auto_2813 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2812 ?auto_2814 ) ( not ( = ?auto_2809 ?auto_2811 ) ) ( not ( = ?auto_2814 ?auto_2812 ) ) ( not ( = ?auto_2815 ?auto_2810 ) ) ( PERSON-AT ?auto_2810 ?auto_2811 ) ( AIRCRAFT-AT ?auto_2813 ?auto_2809 ) ( FUEL-LEVEL ?auto_2813 ?auto_2812 ) ( IN ?auto_2815 ?auto_2813 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2815 ?auto_2809 )
      ( FLY-2PPL ?auto_2815 ?auto_2810 ?auto_2809 )
      ( FLY-1PPL-VERIFY ?auto_2810 ?auto_2809 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2817 - PERSON
      ?auto_2818 - PERSON
      ?auto_2816 - CITY
    )
    :vars
    (
      ?auto_2819 - FLEVEL
      ?auto_2822 - FLEVEL
      ?auto_2820 - CITY
      ?auto_2821 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2819 ?auto_2822 ) ( not ( = ?auto_2816 ?auto_2820 ) ) ( not ( = ?auto_2822 ?auto_2819 ) ) ( not ( = ?auto_2817 ?auto_2818 ) ) ( PERSON-AT ?auto_2818 ?auto_2820 ) ( AIRCRAFT-AT ?auto_2821 ?auto_2816 ) ( FUEL-LEVEL ?auto_2821 ?auto_2819 ) ( IN ?auto_2817 ?auto_2821 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2818 ?auto_2816 )
      ( FLY-2PPL-VERIFY ?auto_2817 ?auto_2818 ?auto_2816 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2824 - PERSON
      ?auto_2825 - PERSON
      ?auto_2823 - CITY
    )
    :vars
    (
      ?auto_2826 - FLEVEL
      ?auto_2828 - FLEVEL
      ?auto_2829 - CITY
      ?auto_2827 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_2826 ?auto_2828 ) ( not ( = ?auto_2823 ?auto_2829 ) ) ( not ( = ?auto_2828 ?auto_2826 ) ) ( not ( = ?auto_2825 ?auto_2824 ) ) ( PERSON-AT ?auto_2824 ?auto_2829 ) ( AIRCRAFT-AT ?auto_2827 ?auto_2823 ) ( FUEL-LEVEL ?auto_2827 ?auto_2826 ) ( IN ?auto_2825 ?auto_2827 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2825 ?auto_2824 ?auto_2823 )
      ( FLY-2PPL-VERIFY ?auto_2824 ?auto_2825 ?auto_2823 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2896 - PERSON
      ?auto_2895 - CITY
    )
    :vars
    (
      ?auto_2897 - FLEVEL
      ?auto_2899 - FLEVEL
      ?auto_2900 - CITY
      ?auto_2901 - PERSON
      ?auto_2898 - AIRCRAFT
      ?auto_2902 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_2897 ?auto_2899 ) ( not ( = ?auto_2895 ?auto_2900 ) ) ( not ( = ?auto_2899 ?auto_2897 ) ) ( not ( = ?auto_2901 ?auto_2896 ) ) ( PERSON-AT ?auto_2896 ?auto_2900 ) ( IN ?auto_2901 ?auto_2898 ) ( AIRCRAFT-AT ?auto_2898 ?auto_2902 ) ( FUEL-LEVEL ?auto_2898 ?auto_2899 ) ( not ( = ?auto_2895 ?auto_2902 ) ) ( not ( = ?auto_2900 ?auto_2902 ) ) )
    :subtasks
    ( ( !FLY ?auto_2898 ?auto_2902 ?auto_2895 ?auto_2899 ?auto_2897 )
      ( FLY-2PPL ?auto_2901 ?auto_2896 ?auto_2895 )
      ( FLY-1PPL-VERIFY ?auto_2896 ?auto_2895 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2904 - PERSON
      ?auto_2905 - PERSON
      ?auto_2903 - CITY
    )
    :vars
    (
      ?auto_2908 - FLEVEL
      ?auto_2906 - FLEVEL
      ?auto_2910 - CITY
      ?auto_2907 - AIRCRAFT
      ?auto_2909 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_2908 ?auto_2906 ) ( not ( = ?auto_2903 ?auto_2910 ) ) ( not ( = ?auto_2906 ?auto_2908 ) ) ( not ( = ?auto_2904 ?auto_2905 ) ) ( PERSON-AT ?auto_2905 ?auto_2910 ) ( IN ?auto_2904 ?auto_2907 ) ( AIRCRAFT-AT ?auto_2907 ?auto_2909 ) ( FUEL-LEVEL ?auto_2907 ?auto_2906 ) ( not ( = ?auto_2903 ?auto_2909 ) ) ( not ( = ?auto_2910 ?auto_2909 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_2905 ?auto_2903 )
      ( FLY-2PPL-VERIFY ?auto_2904 ?auto_2905 ?auto_2903 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_2912 - PERSON
      ?auto_2913 - PERSON
      ?auto_2911 - CITY
    )
    :vars
    (
      ?auto_2918 - FLEVEL
      ?auto_2916 - FLEVEL
      ?auto_2914 - CITY
      ?auto_2917 - AIRCRAFT
      ?auto_2915 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_2918 ?auto_2916 ) ( not ( = ?auto_2911 ?auto_2914 ) ) ( not ( = ?auto_2916 ?auto_2918 ) ) ( not ( = ?auto_2913 ?auto_2912 ) ) ( PERSON-AT ?auto_2912 ?auto_2914 ) ( IN ?auto_2913 ?auto_2917 ) ( AIRCRAFT-AT ?auto_2917 ?auto_2915 ) ( FUEL-LEVEL ?auto_2917 ?auto_2916 ) ( not ( = ?auto_2911 ?auto_2915 ) ) ( not ( = ?auto_2914 ?auto_2915 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_2913 ?auto_2912 ?auto_2911 )
      ( FLY-2PPL-VERIFY ?auto_2912 ?auto_2913 ?auto_2911 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_2993 - PERSON
      ?auto_2992 - CITY
    )
    :vars
    (
      ?auto_2998 - FLEVEL
      ?auto_2996 - FLEVEL
      ?auto_2994 - CITY
      ?auto_2999 - PERSON
      ?auto_2997 - AIRCRAFT
      ?auto_2995 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_2998 ?auto_2996 ) ( not ( = ?auto_2992 ?auto_2994 ) ) ( not ( = ?auto_2996 ?auto_2998 ) ) ( not ( = ?auto_2999 ?auto_2993 ) ) ( PERSON-AT ?auto_2993 ?auto_2994 ) ( AIRCRAFT-AT ?auto_2997 ?auto_2995 ) ( FUEL-LEVEL ?auto_2997 ?auto_2996 ) ( not ( = ?auto_2992 ?auto_2995 ) ) ( not ( = ?auto_2994 ?auto_2995 ) ) ( PERSON-AT ?auto_2999 ?auto_2995 ) )
    :subtasks
    ( ( !BOARD ?auto_2999 ?auto_2997 ?auto_2995 )
      ( FLY-2PPL ?auto_2999 ?auto_2993 ?auto_2992 )
      ( FLY-1PPL-VERIFY ?auto_2993 ?auto_2992 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_3001 - PERSON
      ?auto_3002 - PERSON
      ?auto_3000 - CITY
    )
    :vars
    (
      ?auto_3005 - FLEVEL
      ?auto_3004 - FLEVEL
      ?auto_3007 - CITY
      ?auto_3006 - AIRCRAFT
      ?auto_3003 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_3005 ?auto_3004 ) ( not ( = ?auto_3000 ?auto_3007 ) ) ( not ( = ?auto_3004 ?auto_3005 ) ) ( not ( = ?auto_3001 ?auto_3002 ) ) ( PERSON-AT ?auto_3002 ?auto_3007 ) ( AIRCRAFT-AT ?auto_3006 ?auto_3003 ) ( FUEL-LEVEL ?auto_3006 ?auto_3004 ) ( not ( = ?auto_3000 ?auto_3003 ) ) ( not ( = ?auto_3007 ?auto_3003 ) ) ( PERSON-AT ?auto_3001 ?auto_3003 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_3002 ?auto_3000 )
      ( FLY-2PPL-VERIFY ?auto_3001 ?auto_3002 ?auto_3000 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_3009 - PERSON
      ?auto_3010 - PERSON
      ?auto_3008 - CITY
    )
    :vars
    (
      ?auto_3015 - FLEVEL
      ?auto_3014 - FLEVEL
      ?auto_3012 - CITY
      ?auto_3013 - AIRCRAFT
      ?auto_3011 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_3015 ?auto_3014 ) ( not ( = ?auto_3008 ?auto_3012 ) ) ( not ( = ?auto_3014 ?auto_3015 ) ) ( not ( = ?auto_3010 ?auto_3009 ) ) ( PERSON-AT ?auto_3009 ?auto_3012 ) ( AIRCRAFT-AT ?auto_3013 ?auto_3011 ) ( FUEL-LEVEL ?auto_3013 ?auto_3014 ) ( not ( = ?auto_3008 ?auto_3011 ) ) ( not ( = ?auto_3012 ?auto_3011 ) ) ( PERSON-AT ?auto_3010 ?auto_3011 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3010 ?auto_3009 ?auto_3008 )
      ( FLY-2PPL-VERIFY ?auto_3009 ?auto_3010 ?auto_3008 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_3090 - PERSON
      ?auto_3089 - CITY
    )
    :vars
    (
      ?auto_3095 - FLEVEL
      ?auto_3094 - FLEVEL
      ?auto_3092 - CITY
      ?auto_3096 - PERSON
      ?auto_3093 - AIRCRAFT
      ?auto_3091 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_3095 ?auto_3094 ) ( not ( = ?auto_3089 ?auto_3092 ) ) ( not ( = ?auto_3094 ?auto_3095 ) ) ( not ( = ?auto_3096 ?auto_3090 ) ) ( PERSON-AT ?auto_3090 ?auto_3092 ) ( AIRCRAFT-AT ?auto_3093 ?auto_3091 ) ( not ( = ?auto_3089 ?auto_3091 ) ) ( not ( = ?auto_3092 ?auto_3091 ) ) ( PERSON-AT ?auto_3096 ?auto_3091 ) ( FUEL-LEVEL ?auto_3093 ?auto_3095 ) )
    :subtasks
    ( ( !REFUEL ?auto_3093 ?auto_3091 ?auto_3095 ?auto_3094 )
      ( FLY-2PPL ?auto_3096 ?auto_3090 ?auto_3089 )
      ( FLY-1PPL-VERIFY ?auto_3090 ?auto_3089 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_3098 - PERSON
      ?auto_3099 - PERSON
      ?auto_3097 - CITY
    )
    :vars
    (
      ?auto_3103 - FLEVEL
      ?auto_3101 - FLEVEL
      ?auto_3100 - CITY
      ?auto_3104 - AIRCRAFT
      ?auto_3102 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_3103 ?auto_3101 ) ( not ( = ?auto_3097 ?auto_3100 ) ) ( not ( = ?auto_3101 ?auto_3103 ) ) ( not ( = ?auto_3098 ?auto_3099 ) ) ( PERSON-AT ?auto_3099 ?auto_3100 ) ( AIRCRAFT-AT ?auto_3104 ?auto_3102 ) ( not ( = ?auto_3097 ?auto_3102 ) ) ( not ( = ?auto_3100 ?auto_3102 ) ) ( PERSON-AT ?auto_3098 ?auto_3102 ) ( FUEL-LEVEL ?auto_3104 ?auto_3103 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_3099 ?auto_3097 )
      ( FLY-2PPL-VERIFY ?auto_3098 ?auto_3099 ?auto_3097 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_3106 - PERSON
      ?auto_3107 - PERSON
      ?auto_3105 - CITY
    )
    :vars
    (
      ?auto_3110 - FLEVEL
      ?auto_3112 - FLEVEL
      ?auto_3111 - CITY
      ?auto_3109 - AIRCRAFT
      ?auto_3108 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_3110 ?auto_3112 ) ( not ( = ?auto_3105 ?auto_3111 ) ) ( not ( = ?auto_3112 ?auto_3110 ) ) ( not ( = ?auto_3107 ?auto_3106 ) ) ( PERSON-AT ?auto_3106 ?auto_3111 ) ( AIRCRAFT-AT ?auto_3109 ?auto_3108 ) ( not ( = ?auto_3105 ?auto_3108 ) ) ( not ( = ?auto_3111 ?auto_3108 ) ) ( PERSON-AT ?auto_3107 ?auto_3108 ) ( FUEL-LEVEL ?auto_3109 ?auto_3110 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3107 ?auto_3106 ?auto_3105 )
      ( FLY-2PPL-VERIFY ?auto_3106 ?auto_3107 ?auto_3105 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_3187 - PERSON
      ?auto_3186 - CITY
    )
    :vars
    (
      ?auto_3190 - FLEVEL
      ?auto_3192 - FLEVEL
      ?auto_3191 - CITY
      ?auto_3193 - PERSON
      ?auto_3188 - CITY
      ?auto_3189 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3190 ?auto_3192 ) ( not ( = ?auto_3186 ?auto_3191 ) ) ( not ( = ?auto_3192 ?auto_3190 ) ) ( not ( = ?auto_3193 ?auto_3187 ) ) ( PERSON-AT ?auto_3187 ?auto_3191 ) ( not ( = ?auto_3186 ?auto_3188 ) ) ( not ( = ?auto_3191 ?auto_3188 ) ) ( PERSON-AT ?auto_3193 ?auto_3188 ) ( AIRCRAFT-AT ?auto_3189 ?auto_3186 ) ( FUEL-LEVEL ?auto_3189 ?auto_3192 ) )
    :subtasks
    ( ( !FLY ?auto_3189 ?auto_3186 ?auto_3188 ?auto_3192 ?auto_3190 )
      ( FLY-2PPL ?auto_3193 ?auto_3187 ?auto_3186 )
      ( FLY-1PPL-VERIFY ?auto_3187 ?auto_3186 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_3195 - PERSON
      ?auto_3196 - PERSON
      ?auto_3194 - CITY
    )
    :vars
    (
      ?auto_3197 - FLEVEL
      ?auto_3199 - FLEVEL
      ?auto_3201 - CITY
      ?auto_3200 - CITY
      ?auto_3198 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3197 ?auto_3199 ) ( not ( = ?auto_3194 ?auto_3201 ) ) ( not ( = ?auto_3199 ?auto_3197 ) ) ( not ( = ?auto_3195 ?auto_3196 ) ) ( PERSON-AT ?auto_3196 ?auto_3201 ) ( not ( = ?auto_3194 ?auto_3200 ) ) ( not ( = ?auto_3201 ?auto_3200 ) ) ( PERSON-AT ?auto_3195 ?auto_3200 ) ( AIRCRAFT-AT ?auto_3198 ?auto_3194 ) ( FUEL-LEVEL ?auto_3198 ?auto_3199 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_3196 ?auto_3194 )
      ( FLY-2PPL-VERIFY ?auto_3195 ?auto_3196 ?auto_3194 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_3203 - PERSON
      ?auto_3204 - PERSON
      ?auto_3202 - CITY
    )
    :vars
    (
      ?auto_3207 - FLEVEL
      ?auto_3209 - FLEVEL
      ?auto_3205 - CITY
      ?auto_3206 - CITY
      ?auto_3208 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3207 ?auto_3209 ) ( not ( = ?auto_3202 ?auto_3205 ) ) ( not ( = ?auto_3209 ?auto_3207 ) ) ( not ( = ?auto_3204 ?auto_3203 ) ) ( PERSON-AT ?auto_3203 ?auto_3205 ) ( not ( = ?auto_3202 ?auto_3206 ) ) ( not ( = ?auto_3205 ?auto_3206 ) ) ( PERSON-AT ?auto_3204 ?auto_3206 ) ( AIRCRAFT-AT ?auto_3208 ?auto_3202 ) ( FUEL-LEVEL ?auto_3208 ?auto_3209 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3204 ?auto_3203 ?auto_3202 )
      ( FLY-2PPL-VERIFY ?auto_3203 ?auto_3204 ?auto_3202 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_3284 - PERSON
      ?auto_3283 - CITY
    )
    :vars
    (
      ?auto_3287 - FLEVEL
      ?auto_3289 - FLEVEL
      ?auto_3285 - CITY
      ?auto_3290 - PERSON
      ?auto_3286 - CITY
      ?auto_3288 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3287 ?auto_3289 ) ( not ( = ?auto_3283 ?auto_3285 ) ) ( not ( = ?auto_3289 ?auto_3287 ) ) ( not ( = ?auto_3290 ?auto_3284 ) ) ( PERSON-AT ?auto_3284 ?auto_3285 ) ( not ( = ?auto_3283 ?auto_3286 ) ) ( not ( = ?auto_3285 ?auto_3286 ) ) ( PERSON-AT ?auto_3290 ?auto_3286 ) ( AIRCRAFT-AT ?auto_3288 ?auto_3283 ) ( FUEL-LEVEL ?auto_3288 ?auto_3287 ) )
    :subtasks
    ( ( !REFUEL ?auto_3288 ?auto_3283 ?auto_3287 ?auto_3289 )
      ( FLY-2PPL ?auto_3290 ?auto_3284 ?auto_3283 )
      ( FLY-1PPL-VERIFY ?auto_3284 ?auto_3283 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_3292 - PERSON
      ?auto_3293 - PERSON
      ?auto_3291 - CITY
    )
    :vars
    (
      ?auto_3295 - FLEVEL
      ?auto_3294 - FLEVEL
      ?auto_3297 - CITY
      ?auto_3296 - CITY
      ?auto_3298 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3295 ?auto_3294 ) ( not ( = ?auto_3291 ?auto_3297 ) ) ( not ( = ?auto_3294 ?auto_3295 ) ) ( not ( = ?auto_3292 ?auto_3293 ) ) ( PERSON-AT ?auto_3293 ?auto_3297 ) ( not ( = ?auto_3291 ?auto_3296 ) ) ( not ( = ?auto_3297 ?auto_3296 ) ) ( PERSON-AT ?auto_3292 ?auto_3296 ) ( AIRCRAFT-AT ?auto_3298 ?auto_3291 ) ( FUEL-LEVEL ?auto_3298 ?auto_3295 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_3293 ?auto_3291 )
      ( FLY-2PPL-VERIFY ?auto_3292 ?auto_3293 ?auto_3291 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_3300 - PERSON
      ?auto_3301 - PERSON
      ?auto_3299 - CITY
    )
    :vars
    (
      ?auto_3304 - FLEVEL
      ?auto_3303 - FLEVEL
      ?auto_3305 - CITY
      ?auto_3306 - CITY
      ?auto_3302 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_3304 ?auto_3303 ) ( not ( = ?auto_3299 ?auto_3305 ) ) ( not ( = ?auto_3303 ?auto_3304 ) ) ( not ( = ?auto_3301 ?auto_3300 ) ) ( PERSON-AT ?auto_3300 ?auto_3305 ) ( not ( = ?auto_3299 ?auto_3306 ) ) ( not ( = ?auto_3305 ?auto_3306 ) ) ( PERSON-AT ?auto_3301 ?auto_3306 ) ( AIRCRAFT-AT ?auto_3302 ?auto_3299 ) ( FUEL-LEVEL ?auto_3302 ?auto_3304 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3301 ?auto_3300 ?auto_3299 )
      ( FLY-2PPL-VERIFY ?auto_3300 ?auto_3301 ?auto_3299 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_3474 - PERSON
      ?auto_3473 - CITY
    )
    :vars
    (
      ?auto_3475 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_3474 ?auto_3475 ) ( AIRCRAFT-AT ?auto_3475 ?auto_3473 ) )
    :subtasks
    ( ( !DEBARK ?auto_3474 ?auto_3475 ?auto_3473 )
      ( FLY-1PPL-VERIFY ?auto_3474 ?auto_3473 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_3477 - PERSON
      ?auto_3478 - PERSON
      ?auto_3476 - CITY
    )
    :vars
    (
      ?auto_3479 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_3478 ?auto_3479 ) ( AIRCRAFT-AT ?auto_3479 ?auto_3476 ) ( PERSON-AT ?auto_3477 ?auto_3476 ) ( not ( = ?auto_3477 ?auto_3478 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_3478 ?auto_3476 )
      ( FLY-2PPL-VERIFY ?auto_3477 ?auto_3478 ?auto_3476 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_3481 - PERSON
      ?auto_3482 - PERSON
      ?auto_3480 - CITY
    )
    :vars
    (
      ?auto_3483 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_3482 ?auto_3483 ) ( AIRCRAFT-AT ?auto_3483 ?auto_3480 ) ( PERSON-AT ?auto_3481 ?auto_3480 ) ( not ( = ?auto_3481 ?auto_3482 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_3482 ?auto_3480 )
      ( FLY-2PPL-VERIFY ?auto_3481 ?auto_3482 ?auto_3480 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_3485 - PERSON
      ?auto_3486 - PERSON
      ?auto_3484 - CITY
    )
    :vars
    (
      ?auto_3487 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_3485 ?auto_3487 ) ( AIRCRAFT-AT ?auto_3487 ?auto_3484 ) ( PERSON-AT ?auto_3486 ?auto_3484 ) ( not ( = ?auto_3485 ?auto_3486 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_3485 ?auto_3484 )
      ( FLY-2PPL-VERIFY ?auto_3485 ?auto_3486 ?auto_3484 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_3489 - PERSON
      ?auto_3490 - PERSON
      ?auto_3488 - CITY
    )
    :vars
    (
      ?auto_3491 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_3489 ?auto_3491 ) ( AIRCRAFT-AT ?auto_3491 ?auto_3488 ) ( PERSON-AT ?auto_3490 ?auto_3488 ) ( not ( = ?auto_3489 ?auto_3490 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_3489 ?auto_3488 )
      ( FLY-2PPL-VERIFY ?auto_3489 ?auto_3490 ?auto_3488 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3497 - PERSON
      ?auto_3498 - PERSON
      ?auto_3499 - PERSON
      ?auto_3496 - CITY
    )
    :vars
    (
      ?auto_3500 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_3499 ?auto_3500 ) ( AIRCRAFT-AT ?auto_3500 ?auto_3496 ) ( PERSON-AT ?auto_3497 ?auto_3496 ) ( PERSON-AT ?auto_3498 ?auto_3496 ) ( not ( = ?auto_3497 ?auto_3498 ) ) ( not ( = ?auto_3497 ?auto_3499 ) ) ( not ( = ?auto_3498 ?auto_3499 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_3499 ?auto_3496 )
      ( FLY-3PPL-VERIFY ?auto_3497 ?auto_3498 ?auto_3499 ?auto_3496 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3502 - PERSON
      ?auto_3503 - PERSON
      ?auto_3504 - PERSON
      ?auto_3501 - CITY
    )
    :vars
    (
      ?auto_3505 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_3504 ?auto_3505 ) ( AIRCRAFT-AT ?auto_3505 ?auto_3501 ) ( PERSON-AT ?auto_3502 ?auto_3501 ) ( PERSON-AT ?auto_3503 ?auto_3501 ) ( not ( = ?auto_3502 ?auto_3503 ) ) ( not ( = ?auto_3502 ?auto_3504 ) ) ( not ( = ?auto_3503 ?auto_3504 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_3504 ?auto_3501 )
      ( FLY-3PPL-VERIFY ?auto_3502 ?auto_3503 ?auto_3504 ?auto_3501 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3507 - PERSON
      ?auto_3508 - PERSON
      ?auto_3509 - PERSON
      ?auto_3506 - CITY
    )
    :vars
    (
      ?auto_3510 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_3508 ?auto_3510 ) ( AIRCRAFT-AT ?auto_3510 ?auto_3506 ) ( PERSON-AT ?auto_3507 ?auto_3506 ) ( PERSON-AT ?auto_3509 ?auto_3506 ) ( not ( = ?auto_3507 ?auto_3508 ) ) ( not ( = ?auto_3507 ?auto_3509 ) ) ( not ( = ?auto_3508 ?auto_3509 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_3508 ?auto_3506 )
      ( FLY-3PPL-VERIFY ?auto_3507 ?auto_3508 ?auto_3509 ?auto_3506 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3512 - PERSON
      ?auto_3513 - PERSON
      ?auto_3514 - PERSON
      ?auto_3511 - CITY
    )
    :vars
    (
      ?auto_3515 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_3513 ?auto_3515 ) ( AIRCRAFT-AT ?auto_3515 ?auto_3511 ) ( PERSON-AT ?auto_3512 ?auto_3511 ) ( PERSON-AT ?auto_3514 ?auto_3511 ) ( not ( = ?auto_3512 ?auto_3513 ) ) ( not ( = ?auto_3512 ?auto_3514 ) ) ( not ( = ?auto_3513 ?auto_3514 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_3513 ?auto_3511 )
      ( FLY-3PPL-VERIFY ?auto_3512 ?auto_3513 ?auto_3514 ?auto_3511 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3522 - PERSON
      ?auto_3523 - PERSON
      ?auto_3524 - PERSON
      ?auto_3521 - CITY
    )
    :vars
    (
      ?auto_3525 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_3524 ?auto_3525 ) ( AIRCRAFT-AT ?auto_3525 ?auto_3521 ) ( PERSON-AT ?auto_3522 ?auto_3521 ) ( PERSON-AT ?auto_3523 ?auto_3521 ) ( not ( = ?auto_3522 ?auto_3523 ) ) ( not ( = ?auto_3522 ?auto_3524 ) ) ( not ( = ?auto_3523 ?auto_3524 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_3524 ?auto_3521 )
      ( FLY-3PPL-VERIFY ?auto_3522 ?auto_3523 ?auto_3524 ?auto_3521 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3527 - PERSON
      ?auto_3528 - PERSON
      ?auto_3529 - PERSON
      ?auto_3526 - CITY
    )
    :vars
    (
      ?auto_3530 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_3529 ?auto_3530 ) ( AIRCRAFT-AT ?auto_3530 ?auto_3526 ) ( PERSON-AT ?auto_3527 ?auto_3526 ) ( PERSON-AT ?auto_3528 ?auto_3526 ) ( not ( = ?auto_3527 ?auto_3528 ) ) ( not ( = ?auto_3527 ?auto_3529 ) ) ( not ( = ?auto_3528 ?auto_3529 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_3529 ?auto_3526 )
      ( FLY-3PPL-VERIFY ?auto_3527 ?auto_3528 ?auto_3529 ?auto_3526 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3532 - PERSON
      ?auto_3533 - PERSON
      ?auto_3534 - PERSON
      ?auto_3531 - CITY
    )
    :vars
    (
      ?auto_3535 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_3533 ?auto_3535 ) ( AIRCRAFT-AT ?auto_3535 ?auto_3531 ) ( PERSON-AT ?auto_3532 ?auto_3531 ) ( PERSON-AT ?auto_3534 ?auto_3531 ) ( not ( = ?auto_3532 ?auto_3533 ) ) ( not ( = ?auto_3532 ?auto_3534 ) ) ( not ( = ?auto_3533 ?auto_3534 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_3533 ?auto_3531 )
      ( FLY-3PPL-VERIFY ?auto_3532 ?auto_3533 ?auto_3534 ?auto_3531 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3537 - PERSON
      ?auto_3538 - PERSON
      ?auto_3539 - PERSON
      ?auto_3536 - CITY
    )
    :vars
    (
      ?auto_3540 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_3538 ?auto_3540 ) ( AIRCRAFT-AT ?auto_3540 ?auto_3536 ) ( PERSON-AT ?auto_3537 ?auto_3536 ) ( PERSON-AT ?auto_3539 ?auto_3536 ) ( not ( = ?auto_3537 ?auto_3538 ) ) ( not ( = ?auto_3537 ?auto_3539 ) ) ( not ( = ?auto_3538 ?auto_3539 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_3538 ?auto_3536 )
      ( FLY-3PPL-VERIFY ?auto_3537 ?auto_3538 ?auto_3539 ?auto_3536 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3547 - PERSON
      ?auto_3548 - PERSON
      ?auto_3549 - PERSON
      ?auto_3546 - CITY
    )
    :vars
    (
      ?auto_3550 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_3547 ?auto_3550 ) ( AIRCRAFT-AT ?auto_3550 ?auto_3546 ) ( PERSON-AT ?auto_3548 ?auto_3546 ) ( PERSON-AT ?auto_3549 ?auto_3546 ) ( not ( = ?auto_3547 ?auto_3548 ) ) ( not ( = ?auto_3547 ?auto_3549 ) ) ( not ( = ?auto_3548 ?auto_3549 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_3547 ?auto_3546 )
      ( FLY-3PPL-VERIFY ?auto_3547 ?auto_3548 ?auto_3549 ?auto_3546 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3552 - PERSON
      ?auto_3553 - PERSON
      ?auto_3554 - PERSON
      ?auto_3551 - CITY
    )
    :vars
    (
      ?auto_3555 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_3552 ?auto_3555 ) ( AIRCRAFT-AT ?auto_3555 ?auto_3551 ) ( PERSON-AT ?auto_3553 ?auto_3551 ) ( PERSON-AT ?auto_3554 ?auto_3551 ) ( not ( = ?auto_3552 ?auto_3553 ) ) ( not ( = ?auto_3552 ?auto_3554 ) ) ( not ( = ?auto_3553 ?auto_3554 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_3552 ?auto_3551 )
      ( FLY-3PPL-VERIFY ?auto_3552 ?auto_3553 ?auto_3554 ?auto_3551 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3562 - PERSON
      ?auto_3563 - PERSON
      ?auto_3564 - PERSON
      ?auto_3561 - CITY
    )
    :vars
    (
      ?auto_3565 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_3562 ?auto_3565 ) ( AIRCRAFT-AT ?auto_3565 ?auto_3561 ) ( PERSON-AT ?auto_3563 ?auto_3561 ) ( PERSON-AT ?auto_3564 ?auto_3561 ) ( not ( = ?auto_3562 ?auto_3563 ) ) ( not ( = ?auto_3562 ?auto_3564 ) ) ( not ( = ?auto_3563 ?auto_3564 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_3562 ?auto_3561 )
      ( FLY-3PPL-VERIFY ?auto_3562 ?auto_3563 ?auto_3564 ?auto_3561 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3567 - PERSON
      ?auto_3568 - PERSON
      ?auto_3569 - PERSON
      ?auto_3566 - CITY
    )
    :vars
    (
      ?auto_3570 - AIRCRAFT
    )
    :precondition
    ( and ( IN ?auto_3567 ?auto_3570 ) ( AIRCRAFT-AT ?auto_3570 ?auto_3566 ) ( PERSON-AT ?auto_3568 ?auto_3566 ) ( PERSON-AT ?auto_3569 ?auto_3566 ) ( not ( = ?auto_3567 ?auto_3568 ) ) ( not ( = ?auto_3567 ?auto_3569 ) ) ( not ( = ?auto_3568 ?auto_3569 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_3567 ?auto_3566 )
      ( FLY-3PPL-VERIFY ?auto_3567 ?auto_3568 ?auto_3569 ?auto_3566 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_3592 - PERSON
      ?auto_3591 - CITY
    )
    :vars
    (
      ?auto_3593 - AIRCRAFT
      ?auto_3596 - CITY
      ?auto_3594 - FLEVEL
      ?auto_3595 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_3592 ?auto_3593 ) ( AIRCRAFT-AT ?auto_3593 ?auto_3596 ) ( FUEL-LEVEL ?auto_3593 ?auto_3594 ) ( NEXT ?auto_3595 ?auto_3594 ) ( not ( = ?auto_3591 ?auto_3596 ) ) ( not ( = ?auto_3594 ?auto_3595 ) ) )
    :subtasks
    ( ( !FLY ?auto_3593 ?auto_3596 ?auto_3591 ?auto_3594 ?auto_3595 )
      ( FLY-1PPL ?auto_3592 ?auto_3591 )
      ( FLY-1PPL-VERIFY ?auto_3592 ?auto_3591 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_3598 - PERSON
      ?auto_3599 - PERSON
      ?auto_3597 - CITY
    )
    :vars
    (
      ?auto_3600 - AIRCRAFT
      ?auto_3602 - CITY
      ?auto_3601 - FLEVEL
      ?auto_3603 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_3599 ?auto_3600 ) ( AIRCRAFT-AT ?auto_3600 ?auto_3602 ) ( FUEL-LEVEL ?auto_3600 ?auto_3601 ) ( NEXT ?auto_3603 ?auto_3601 ) ( not ( = ?auto_3597 ?auto_3602 ) ) ( not ( = ?auto_3601 ?auto_3603 ) ) ( PERSON-AT ?auto_3598 ?auto_3597 ) ( not ( = ?auto_3598 ?auto_3599 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_3599 ?auto_3597 )
      ( FLY-2PPL-VERIFY ?auto_3598 ?auto_3599 ?auto_3597 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_3605 - PERSON
      ?auto_3606 - PERSON
      ?auto_3604 - CITY
    )
    :vars
    (
      ?auto_3608 - AIRCRAFT
      ?auto_3607 - CITY
      ?auto_3609 - FLEVEL
      ?auto_3610 - FLEVEL
      ?auto_3611 - PERSON
    )
    :precondition
    ( and ( IN ?auto_3606 ?auto_3608 ) ( AIRCRAFT-AT ?auto_3608 ?auto_3607 ) ( FUEL-LEVEL ?auto_3608 ?auto_3609 ) ( NEXT ?auto_3610 ?auto_3609 ) ( not ( = ?auto_3604 ?auto_3607 ) ) ( not ( = ?auto_3609 ?auto_3610 ) ) ( PERSON-AT ?auto_3611 ?auto_3604 ) ( not ( = ?auto_3611 ?auto_3606 ) ) ( PERSON-AT ?auto_3605 ?auto_3604 ) ( not ( = ?auto_3605 ?auto_3606 ) ) ( not ( = ?auto_3605 ?auto_3611 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3611 ?auto_3606 ?auto_3604 )
      ( FLY-2PPL-VERIFY ?auto_3605 ?auto_3606 ?auto_3604 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_3613 - PERSON
      ?auto_3614 - PERSON
      ?auto_3612 - CITY
    )
    :vars
    (
      ?auto_3616 - AIRCRAFT
      ?auto_3615 - CITY
      ?auto_3617 - FLEVEL
      ?auto_3618 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_3613 ?auto_3616 ) ( AIRCRAFT-AT ?auto_3616 ?auto_3615 ) ( FUEL-LEVEL ?auto_3616 ?auto_3617 ) ( NEXT ?auto_3618 ?auto_3617 ) ( not ( = ?auto_3612 ?auto_3615 ) ) ( not ( = ?auto_3617 ?auto_3618 ) ) ( PERSON-AT ?auto_3614 ?auto_3612 ) ( not ( = ?auto_3614 ?auto_3613 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3614 ?auto_3613 ?auto_3612 )
      ( FLY-2PPL-VERIFY ?auto_3613 ?auto_3614 ?auto_3612 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_3620 - PERSON
      ?auto_3621 - PERSON
      ?auto_3619 - CITY
    )
    :vars
    (
      ?auto_3623 - AIRCRAFT
      ?auto_3622 - CITY
      ?auto_3624 - FLEVEL
      ?auto_3625 - FLEVEL
      ?auto_3626 - PERSON
    )
    :precondition
    ( and ( IN ?auto_3620 ?auto_3623 ) ( AIRCRAFT-AT ?auto_3623 ?auto_3622 ) ( FUEL-LEVEL ?auto_3623 ?auto_3624 ) ( NEXT ?auto_3625 ?auto_3624 ) ( not ( = ?auto_3619 ?auto_3622 ) ) ( not ( = ?auto_3624 ?auto_3625 ) ) ( PERSON-AT ?auto_3626 ?auto_3619 ) ( not ( = ?auto_3626 ?auto_3620 ) ) ( PERSON-AT ?auto_3621 ?auto_3619 ) ( not ( = ?auto_3620 ?auto_3621 ) ) ( not ( = ?auto_3621 ?auto_3626 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3626 ?auto_3620 ?auto_3619 )
      ( FLY-2PPL-VERIFY ?auto_3620 ?auto_3621 ?auto_3619 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3636 - PERSON
      ?auto_3637 - PERSON
      ?auto_3638 - PERSON
      ?auto_3635 - CITY
    )
    :vars
    (
      ?auto_3640 - AIRCRAFT
      ?auto_3639 - CITY
      ?auto_3641 - FLEVEL
      ?auto_3642 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_3638 ?auto_3640 ) ( AIRCRAFT-AT ?auto_3640 ?auto_3639 ) ( FUEL-LEVEL ?auto_3640 ?auto_3641 ) ( NEXT ?auto_3642 ?auto_3641 ) ( not ( = ?auto_3635 ?auto_3639 ) ) ( not ( = ?auto_3641 ?auto_3642 ) ) ( PERSON-AT ?auto_3637 ?auto_3635 ) ( not ( = ?auto_3637 ?auto_3638 ) ) ( PERSON-AT ?auto_3636 ?auto_3635 ) ( not ( = ?auto_3636 ?auto_3637 ) ) ( not ( = ?auto_3636 ?auto_3638 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3637 ?auto_3638 ?auto_3635 )
      ( FLY-3PPL-VERIFY ?auto_3636 ?auto_3637 ?auto_3638 ?auto_3635 ) )
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
      ?auto_3648 - AIRCRAFT
      ?auto_3647 - CITY
      ?auto_3649 - FLEVEL
      ?auto_3650 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_3646 ?auto_3648 ) ( AIRCRAFT-AT ?auto_3648 ?auto_3647 ) ( FUEL-LEVEL ?auto_3648 ?auto_3649 ) ( NEXT ?auto_3650 ?auto_3649 ) ( not ( = ?auto_3643 ?auto_3647 ) ) ( not ( = ?auto_3649 ?auto_3650 ) ) ( PERSON-AT ?auto_3644 ?auto_3643 ) ( not ( = ?auto_3644 ?auto_3646 ) ) ( PERSON-AT ?auto_3645 ?auto_3643 ) ( not ( = ?auto_3644 ?auto_3645 ) ) ( not ( = ?auto_3645 ?auto_3646 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3644 ?auto_3646 ?auto_3643 )
      ( FLY-3PPL-VERIFY ?auto_3644 ?auto_3645 ?auto_3646 ?auto_3643 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3652 - PERSON
      ?auto_3653 - PERSON
      ?auto_3654 - PERSON
      ?auto_3651 - CITY
    )
    :vars
    (
      ?auto_3656 - AIRCRAFT
      ?auto_3655 - CITY
      ?auto_3657 - FLEVEL
      ?auto_3658 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_3653 ?auto_3656 ) ( AIRCRAFT-AT ?auto_3656 ?auto_3655 ) ( FUEL-LEVEL ?auto_3656 ?auto_3657 ) ( NEXT ?auto_3658 ?auto_3657 ) ( not ( = ?auto_3651 ?auto_3655 ) ) ( not ( = ?auto_3657 ?auto_3658 ) ) ( PERSON-AT ?auto_3654 ?auto_3651 ) ( not ( = ?auto_3654 ?auto_3653 ) ) ( PERSON-AT ?auto_3652 ?auto_3651 ) ( not ( = ?auto_3652 ?auto_3653 ) ) ( not ( = ?auto_3652 ?auto_3654 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3654 ?auto_3653 ?auto_3651 )
      ( FLY-3PPL-VERIFY ?auto_3652 ?auto_3653 ?auto_3654 ?auto_3651 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3660 - PERSON
      ?auto_3661 - PERSON
      ?auto_3662 - PERSON
      ?auto_3659 - CITY
    )
    :vars
    (
      ?auto_3664 - AIRCRAFT
      ?auto_3663 - CITY
      ?auto_3665 - FLEVEL
      ?auto_3666 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_3661 ?auto_3664 ) ( AIRCRAFT-AT ?auto_3664 ?auto_3663 ) ( FUEL-LEVEL ?auto_3664 ?auto_3665 ) ( NEXT ?auto_3666 ?auto_3665 ) ( not ( = ?auto_3659 ?auto_3663 ) ) ( not ( = ?auto_3665 ?auto_3666 ) ) ( PERSON-AT ?auto_3660 ?auto_3659 ) ( not ( = ?auto_3660 ?auto_3661 ) ) ( PERSON-AT ?auto_3662 ?auto_3659 ) ( not ( = ?auto_3660 ?auto_3662 ) ) ( not ( = ?auto_3661 ?auto_3662 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3660 ?auto_3661 ?auto_3659 )
      ( FLY-3PPL-VERIFY ?auto_3660 ?auto_3661 ?auto_3662 ?auto_3659 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3676 - PERSON
      ?auto_3677 - PERSON
      ?auto_3678 - PERSON
      ?auto_3675 - CITY
    )
    :vars
    (
      ?auto_3680 - AIRCRAFT
      ?auto_3679 - CITY
      ?auto_3681 - FLEVEL
      ?auto_3682 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_3678 ?auto_3680 ) ( AIRCRAFT-AT ?auto_3680 ?auto_3679 ) ( FUEL-LEVEL ?auto_3680 ?auto_3681 ) ( NEXT ?auto_3682 ?auto_3681 ) ( not ( = ?auto_3675 ?auto_3679 ) ) ( not ( = ?auto_3681 ?auto_3682 ) ) ( PERSON-AT ?auto_3677 ?auto_3675 ) ( not ( = ?auto_3677 ?auto_3678 ) ) ( PERSON-AT ?auto_3676 ?auto_3675 ) ( not ( = ?auto_3676 ?auto_3677 ) ) ( not ( = ?auto_3676 ?auto_3678 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3677 ?auto_3678 ?auto_3675 )
      ( FLY-3PPL-VERIFY ?auto_3676 ?auto_3677 ?auto_3678 ?auto_3675 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3684 - PERSON
      ?auto_3685 - PERSON
      ?auto_3686 - PERSON
      ?auto_3683 - CITY
    )
    :vars
    (
      ?auto_3688 - AIRCRAFT
      ?auto_3687 - CITY
      ?auto_3689 - FLEVEL
      ?auto_3690 - FLEVEL
      ?auto_3691 - PERSON
    )
    :precondition
    ( and ( IN ?auto_3686 ?auto_3688 ) ( AIRCRAFT-AT ?auto_3688 ?auto_3687 ) ( FUEL-LEVEL ?auto_3688 ?auto_3689 ) ( NEXT ?auto_3690 ?auto_3689 ) ( not ( = ?auto_3683 ?auto_3687 ) ) ( not ( = ?auto_3689 ?auto_3690 ) ) ( PERSON-AT ?auto_3691 ?auto_3683 ) ( not ( = ?auto_3691 ?auto_3686 ) ) ( PERSON-AT ?auto_3684 ?auto_3683 ) ( PERSON-AT ?auto_3685 ?auto_3683 ) ( not ( = ?auto_3684 ?auto_3685 ) ) ( not ( = ?auto_3684 ?auto_3686 ) ) ( not ( = ?auto_3684 ?auto_3691 ) ) ( not ( = ?auto_3685 ?auto_3686 ) ) ( not ( = ?auto_3685 ?auto_3691 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3691 ?auto_3686 ?auto_3683 )
      ( FLY-3PPL-VERIFY ?auto_3684 ?auto_3685 ?auto_3686 ?auto_3683 ) )
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
      ?auto_3696 - CITY
      ?auto_3698 - FLEVEL
      ?auto_3699 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_3694 ?auto_3697 ) ( AIRCRAFT-AT ?auto_3697 ?auto_3696 ) ( FUEL-LEVEL ?auto_3697 ?auto_3698 ) ( NEXT ?auto_3699 ?auto_3698 ) ( not ( = ?auto_3692 ?auto_3696 ) ) ( not ( = ?auto_3698 ?auto_3699 ) ) ( PERSON-AT ?auto_3695 ?auto_3692 ) ( not ( = ?auto_3695 ?auto_3694 ) ) ( PERSON-AT ?auto_3693 ?auto_3692 ) ( not ( = ?auto_3693 ?auto_3694 ) ) ( not ( = ?auto_3693 ?auto_3695 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3695 ?auto_3694 ?auto_3692 )
      ( FLY-3PPL-VERIFY ?auto_3693 ?auto_3694 ?auto_3695 ?auto_3692 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3701 - PERSON
      ?auto_3702 - PERSON
      ?auto_3703 - PERSON
      ?auto_3700 - CITY
    )
    :vars
    (
      ?auto_3705 - AIRCRAFT
      ?auto_3704 - CITY
      ?auto_3706 - FLEVEL
      ?auto_3707 - FLEVEL
      ?auto_3708 - PERSON
    )
    :precondition
    ( and ( IN ?auto_3702 ?auto_3705 ) ( AIRCRAFT-AT ?auto_3705 ?auto_3704 ) ( FUEL-LEVEL ?auto_3705 ?auto_3706 ) ( NEXT ?auto_3707 ?auto_3706 ) ( not ( = ?auto_3700 ?auto_3704 ) ) ( not ( = ?auto_3706 ?auto_3707 ) ) ( PERSON-AT ?auto_3708 ?auto_3700 ) ( not ( = ?auto_3708 ?auto_3702 ) ) ( PERSON-AT ?auto_3701 ?auto_3700 ) ( PERSON-AT ?auto_3703 ?auto_3700 ) ( not ( = ?auto_3701 ?auto_3702 ) ) ( not ( = ?auto_3701 ?auto_3703 ) ) ( not ( = ?auto_3701 ?auto_3708 ) ) ( not ( = ?auto_3702 ?auto_3703 ) ) ( not ( = ?auto_3703 ?auto_3708 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3708 ?auto_3702 ?auto_3700 )
      ( FLY-3PPL-VERIFY ?auto_3701 ?auto_3702 ?auto_3703 ?auto_3700 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3719 - PERSON
      ?auto_3720 - PERSON
      ?auto_3721 - PERSON
      ?auto_3718 - CITY
    )
    :vars
    (
      ?auto_3723 - AIRCRAFT
      ?auto_3722 - CITY
      ?auto_3724 - FLEVEL
      ?auto_3725 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_3719 ?auto_3723 ) ( AIRCRAFT-AT ?auto_3723 ?auto_3722 ) ( FUEL-LEVEL ?auto_3723 ?auto_3724 ) ( NEXT ?auto_3725 ?auto_3724 ) ( not ( = ?auto_3718 ?auto_3722 ) ) ( not ( = ?auto_3724 ?auto_3725 ) ) ( PERSON-AT ?auto_3721 ?auto_3718 ) ( not ( = ?auto_3721 ?auto_3719 ) ) ( PERSON-AT ?auto_3720 ?auto_3718 ) ( not ( = ?auto_3719 ?auto_3720 ) ) ( not ( = ?auto_3720 ?auto_3721 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3721 ?auto_3719 ?auto_3718 )
      ( FLY-3PPL-VERIFY ?auto_3719 ?auto_3720 ?auto_3721 ?auto_3718 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3727 - PERSON
      ?auto_3728 - PERSON
      ?auto_3729 - PERSON
      ?auto_3726 - CITY
    )
    :vars
    (
      ?auto_3731 - AIRCRAFT
      ?auto_3730 - CITY
      ?auto_3732 - FLEVEL
      ?auto_3733 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_3727 ?auto_3731 ) ( AIRCRAFT-AT ?auto_3731 ?auto_3730 ) ( FUEL-LEVEL ?auto_3731 ?auto_3732 ) ( NEXT ?auto_3733 ?auto_3732 ) ( not ( = ?auto_3726 ?auto_3730 ) ) ( not ( = ?auto_3732 ?auto_3733 ) ) ( PERSON-AT ?auto_3728 ?auto_3726 ) ( not ( = ?auto_3728 ?auto_3727 ) ) ( PERSON-AT ?auto_3729 ?auto_3726 ) ( not ( = ?auto_3727 ?auto_3729 ) ) ( not ( = ?auto_3728 ?auto_3729 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3728 ?auto_3727 ?auto_3726 )
      ( FLY-3PPL-VERIFY ?auto_3727 ?auto_3728 ?auto_3729 ?auto_3726 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3743 - PERSON
      ?auto_3744 - PERSON
      ?auto_3745 - PERSON
      ?auto_3742 - CITY
    )
    :vars
    (
      ?auto_3747 - AIRCRAFT
      ?auto_3746 - CITY
      ?auto_3748 - FLEVEL
      ?auto_3749 - FLEVEL
    )
    :precondition
    ( and ( IN ?auto_3743 ?auto_3747 ) ( AIRCRAFT-AT ?auto_3747 ?auto_3746 ) ( FUEL-LEVEL ?auto_3747 ?auto_3748 ) ( NEXT ?auto_3749 ?auto_3748 ) ( not ( = ?auto_3742 ?auto_3746 ) ) ( not ( = ?auto_3748 ?auto_3749 ) ) ( PERSON-AT ?auto_3745 ?auto_3742 ) ( not ( = ?auto_3745 ?auto_3743 ) ) ( PERSON-AT ?auto_3744 ?auto_3742 ) ( not ( = ?auto_3743 ?auto_3744 ) ) ( not ( = ?auto_3744 ?auto_3745 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3745 ?auto_3743 ?auto_3742 )
      ( FLY-3PPL-VERIFY ?auto_3743 ?auto_3744 ?auto_3745 ?auto_3742 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3751 - PERSON
      ?auto_3752 - PERSON
      ?auto_3753 - PERSON
      ?auto_3750 - CITY
    )
    :vars
    (
      ?auto_3755 - AIRCRAFT
      ?auto_3754 - CITY
      ?auto_3756 - FLEVEL
      ?auto_3757 - FLEVEL
      ?auto_3758 - PERSON
    )
    :precondition
    ( and ( IN ?auto_3751 ?auto_3755 ) ( AIRCRAFT-AT ?auto_3755 ?auto_3754 ) ( FUEL-LEVEL ?auto_3755 ?auto_3756 ) ( NEXT ?auto_3757 ?auto_3756 ) ( not ( = ?auto_3750 ?auto_3754 ) ) ( not ( = ?auto_3756 ?auto_3757 ) ) ( PERSON-AT ?auto_3758 ?auto_3750 ) ( not ( = ?auto_3758 ?auto_3751 ) ) ( PERSON-AT ?auto_3752 ?auto_3750 ) ( PERSON-AT ?auto_3753 ?auto_3750 ) ( not ( = ?auto_3751 ?auto_3752 ) ) ( not ( = ?auto_3751 ?auto_3753 ) ) ( not ( = ?auto_3752 ?auto_3753 ) ) ( not ( = ?auto_3752 ?auto_3758 ) ) ( not ( = ?auto_3753 ?auto_3758 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3758 ?auto_3751 ?auto_3750 )
      ( FLY-3PPL-VERIFY ?auto_3751 ?auto_3752 ?auto_3753 ?auto_3750 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_3795 - PERSON
      ?auto_3794 - CITY
    )
    :vars
    (
      ?auto_3797 - AIRCRAFT
      ?auto_3796 - CITY
      ?auto_3798 - FLEVEL
      ?auto_3799 - FLEVEL
      ?auto_3800 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3797 ?auto_3796 ) ( FUEL-LEVEL ?auto_3797 ?auto_3798 ) ( NEXT ?auto_3799 ?auto_3798 ) ( not ( = ?auto_3794 ?auto_3796 ) ) ( not ( = ?auto_3798 ?auto_3799 ) ) ( PERSON-AT ?auto_3800 ?auto_3794 ) ( not ( = ?auto_3800 ?auto_3795 ) ) ( PERSON-AT ?auto_3795 ?auto_3796 ) )
    :subtasks
    ( ( !BOARD ?auto_3795 ?auto_3797 ?auto_3796 )
      ( FLY-2PPL ?auto_3800 ?auto_3795 ?auto_3794 )
      ( FLY-1PPL-VERIFY ?auto_3795 ?auto_3794 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_3802 - PERSON
      ?auto_3803 - PERSON
      ?auto_3801 - CITY
    )
    :vars
    (
      ?auto_3807 - AIRCRAFT
      ?auto_3805 - CITY
      ?auto_3806 - FLEVEL
      ?auto_3804 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3807 ?auto_3805 ) ( FUEL-LEVEL ?auto_3807 ?auto_3806 ) ( NEXT ?auto_3804 ?auto_3806 ) ( not ( = ?auto_3801 ?auto_3805 ) ) ( not ( = ?auto_3806 ?auto_3804 ) ) ( PERSON-AT ?auto_3802 ?auto_3801 ) ( not ( = ?auto_3802 ?auto_3803 ) ) ( PERSON-AT ?auto_3803 ?auto_3805 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_3803 ?auto_3801 )
      ( FLY-2PPL-VERIFY ?auto_3802 ?auto_3803 ?auto_3801 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_3809 - PERSON
      ?auto_3810 - PERSON
      ?auto_3808 - CITY
    )
    :vars
    (
      ?auto_3812 - AIRCRAFT
      ?auto_3811 - CITY
      ?auto_3814 - FLEVEL
      ?auto_3813 - FLEVEL
      ?auto_3815 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3812 ?auto_3811 ) ( FUEL-LEVEL ?auto_3812 ?auto_3814 ) ( NEXT ?auto_3813 ?auto_3814 ) ( not ( = ?auto_3808 ?auto_3811 ) ) ( not ( = ?auto_3814 ?auto_3813 ) ) ( PERSON-AT ?auto_3815 ?auto_3808 ) ( not ( = ?auto_3815 ?auto_3810 ) ) ( PERSON-AT ?auto_3810 ?auto_3811 ) ( PERSON-AT ?auto_3809 ?auto_3808 ) ( not ( = ?auto_3809 ?auto_3810 ) ) ( not ( = ?auto_3809 ?auto_3815 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3815 ?auto_3810 ?auto_3808 )
      ( FLY-2PPL-VERIFY ?auto_3809 ?auto_3810 ?auto_3808 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_3817 - PERSON
      ?auto_3818 - PERSON
      ?auto_3816 - CITY
    )
    :vars
    (
      ?auto_3820 - AIRCRAFT
      ?auto_3819 - CITY
      ?auto_3822 - FLEVEL
      ?auto_3821 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3820 ?auto_3819 ) ( FUEL-LEVEL ?auto_3820 ?auto_3822 ) ( NEXT ?auto_3821 ?auto_3822 ) ( not ( = ?auto_3816 ?auto_3819 ) ) ( not ( = ?auto_3822 ?auto_3821 ) ) ( PERSON-AT ?auto_3818 ?auto_3816 ) ( not ( = ?auto_3818 ?auto_3817 ) ) ( PERSON-AT ?auto_3817 ?auto_3819 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3818 ?auto_3817 ?auto_3816 )
      ( FLY-2PPL-VERIFY ?auto_3817 ?auto_3818 ?auto_3816 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_3824 - PERSON
      ?auto_3825 - PERSON
      ?auto_3823 - CITY
    )
    :vars
    (
      ?auto_3827 - AIRCRAFT
      ?auto_3826 - CITY
      ?auto_3829 - FLEVEL
      ?auto_3828 - FLEVEL
      ?auto_3830 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3827 ?auto_3826 ) ( FUEL-LEVEL ?auto_3827 ?auto_3829 ) ( NEXT ?auto_3828 ?auto_3829 ) ( not ( = ?auto_3823 ?auto_3826 ) ) ( not ( = ?auto_3829 ?auto_3828 ) ) ( PERSON-AT ?auto_3830 ?auto_3823 ) ( not ( = ?auto_3830 ?auto_3824 ) ) ( PERSON-AT ?auto_3824 ?auto_3826 ) ( PERSON-AT ?auto_3825 ?auto_3823 ) ( not ( = ?auto_3824 ?auto_3825 ) ) ( not ( = ?auto_3825 ?auto_3830 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3830 ?auto_3824 ?auto_3823 )
      ( FLY-2PPL-VERIFY ?auto_3824 ?auto_3825 ?auto_3823 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3840 - PERSON
      ?auto_3841 - PERSON
      ?auto_3842 - PERSON
      ?auto_3839 - CITY
    )
    :vars
    (
      ?auto_3844 - AIRCRAFT
      ?auto_3843 - CITY
      ?auto_3846 - FLEVEL
      ?auto_3845 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3844 ?auto_3843 ) ( FUEL-LEVEL ?auto_3844 ?auto_3846 ) ( NEXT ?auto_3845 ?auto_3846 ) ( not ( = ?auto_3839 ?auto_3843 ) ) ( not ( = ?auto_3846 ?auto_3845 ) ) ( PERSON-AT ?auto_3841 ?auto_3839 ) ( not ( = ?auto_3841 ?auto_3842 ) ) ( PERSON-AT ?auto_3842 ?auto_3843 ) ( PERSON-AT ?auto_3840 ?auto_3839 ) ( not ( = ?auto_3840 ?auto_3841 ) ) ( not ( = ?auto_3840 ?auto_3842 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3841 ?auto_3842 ?auto_3839 )
      ( FLY-3PPL-VERIFY ?auto_3840 ?auto_3841 ?auto_3842 ?auto_3839 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3848 - PERSON
      ?auto_3849 - PERSON
      ?auto_3850 - PERSON
      ?auto_3847 - CITY
    )
    :vars
    (
      ?auto_3852 - AIRCRAFT
      ?auto_3851 - CITY
      ?auto_3854 - FLEVEL
      ?auto_3853 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3852 ?auto_3851 ) ( FUEL-LEVEL ?auto_3852 ?auto_3854 ) ( NEXT ?auto_3853 ?auto_3854 ) ( not ( = ?auto_3847 ?auto_3851 ) ) ( not ( = ?auto_3854 ?auto_3853 ) ) ( PERSON-AT ?auto_3848 ?auto_3847 ) ( not ( = ?auto_3848 ?auto_3850 ) ) ( PERSON-AT ?auto_3850 ?auto_3851 ) ( PERSON-AT ?auto_3849 ?auto_3847 ) ( not ( = ?auto_3848 ?auto_3849 ) ) ( not ( = ?auto_3849 ?auto_3850 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3848 ?auto_3850 ?auto_3847 )
      ( FLY-3PPL-VERIFY ?auto_3848 ?auto_3849 ?auto_3850 ?auto_3847 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3856 - PERSON
      ?auto_3857 - PERSON
      ?auto_3858 - PERSON
      ?auto_3855 - CITY
    )
    :vars
    (
      ?auto_3860 - AIRCRAFT
      ?auto_3859 - CITY
      ?auto_3862 - FLEVEL
      ?auto_3861 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3860 ?auto_3859 ) ( FUEL-LEVEL ?auto_3860 ?auto_3862 ) ( NEXT ?auto_3861 ?auto_3862 ) ( not ( = ?auto_3855 ?auto_3859 ) ) ( not ( = ?auto_3862 ?auto_3861 ) ) ( PERSON-AT ?auto_3858 ?auto_3855 ) ( not ( = ?auto_3858 ?auto_3857 ) ) ( PERSON-AT ?auto_3857 ?auto_3859 ) ( PERSON-AT ?auto_3856 ?auto_3855 ) ( not ( = ?auto_3856 ?auto_3857 ) ) ( not ( = ?auto_3856 ?auto_3858 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3858 ?auto_3857 ?auto_3855 )
      ( FLY-3PPL-VERIFY ?auto_3856 ?auto_3857 ?auto_3858 ?auto_3855 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3864 - PERSON
      ?auto_3865 - PERSON
      ?auto_3866 - PERSON
      ?auto_3863 - CITY
    )
    :vars
    (
      ?auto_3868 - AIRCRAFT
      ?auto_3867 - CITY
      ?auto_3870 - FLEVEL
      ?auto_3869 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3868 ?auto_3867 ) ( FUEL-LEVEL ?auto_3868 ?auto_3870 ) ( NEXT ?auto_3869 ?auto_3870 ) ( not ( = ?auto_3863 ?auto_3867 ) ) ( not ( = ?auto_3870 ?auto_3869 ) ) ( PERSON-AT ?auto_3864 ?auto_3863 ) ( not ( = ?auto_3864 ?auto_3865 ) ) ( PERSON-AT ?auto_3865 ?auto_3867 ) ( PERSON-AT ?auto_3866 ?auto_3863 ) ( not ( = ?auto_3864 ?auto_3866 ) ) ( not ( = ?auto_3865 ?auto_3866 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3864 ?auto_3865 ?auto_3863 )
      ( FLY-3PPL-VERIFY ?auto_3864 ?auto_3865 ?auto_3866 ?auto_3863 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3880 - PERSON
      ?auto_3881 - PERSON
      ?auto_3882 - PERSON
      ?auto_3879 - CITY
    )
    :vars
    (
      ?auto_3884 - AIRCRAFT
      ?auto_3883 - CITY
      ?auto_3886 - FLEVEL
      ?auto_3885 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3884 ?auto_3883 ) ( FUEL-LEVEL ?auto_3884 ?auto_3886 ) ( NEXT ?auto_3885 ?auto_3886 ) ( not ( = ?auto_3879 ?auto_3883 ) ) ( not ( = ?auto_3886 ?auto_3885 ) ) ( PERSON-AT ?auto_3881 ?auto_3879 ) ( not ( = ?auto_3881 ?auto_3882 ) ) ( PERSON-AT ?auto_3882 ?auto_3883 ) ( PERSON-AT ?auto_3880 ?auto_3879 ) ( not ( = ?auto_3880 ?auto_3881 ) ) ( not ( = ?auto_3880 ?auto_3882 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3881 ?auto_3882 ?auto_3879 )
      ( FLY-3PPL-VERIFY ?auto_3880 ?auto_3881 ?auto_3882 ?auto_3879 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3888 - PERSON
      ?auto_3889 - PERSON
      ?auto_3890 - PERSON
      ?auto_3887 - CITY
    )
    :vars
    (
      ?auto_3892 - AIRCRAFT
      ?auto_3891 - CITY
      ?auto_3894 - FLEVEL
      ?auto_3893 - FLEVEL
      ?auto_3895 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3892 ?auto_3891 ) ( FUEL-LEVEL ?auto_3892 ?auto_3894 ) ( NEXT ?auto_3893 ?auto_3894 ) ( not ( = ?auto_3887 ?auto_3891 ) ) ( not ( = ?auto_3894 ?auto_3893 ) ) ( PERSON-AT ?auto_3895 ?auto_3887 ) ( not ( = ?auto_3895 ?auto_3890 ) ) ( PERSON-AT ?auto_3890 ?auto_3891 ) ( PERSON-AT ?auto_3888 ?auto_3887 ) ( PERSON-AT ?auto_3889 ?auto_3887 ) ( not ( = ?auto_3888 ?auto_3889 ) ) ( not ( = ?auto_3888 ?auto_3890 ) ) ( not ( = ?auto_3888 ?auto_3895 ) ) ( not ( = ?auto_3889 ?auto_3890 ) ) ( not ( = ?auto_3889 ?auto_3895 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3895 ?auto_3890 ?auto_3887 )
      ( FLY-3PPL-VERIFY ?auto_3888 ?auto_3889 ?auto_3890 ?auto_3887 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3897 - PERSON
      ?auto_3898 - PERSON
      ?auto_3899 - PERSON
      ?auto_3896 - CITY
    )
    :vars
    (
      ?auto_3901 - AIRCRAFT
      ?auto_3900 - CITY
      ?auto_3903 - FLEVEL
      ?auto_3902 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3901 ?auto_3900 ) ( FUEL-LEVEL ?auto_3901 ?auto_3903 ) ( NEXT ?auto_3902 ?auto_3903 ) ( not ( = ?auto_3896 ?auto_3900 ) ) ( not ( = ?auto_3903 ?auto_3902 ) ) ( PERSON-AT ?auto_3899 ?auto_3896 ) ( not ( = ?auto_3899 ?auto_3898 ) ) ( PERSON-AT ?auto_3898 ?auto_3900 ) ( PERSON-AT ?auto_3897 ?auto_3896 ) ( not ( = ?auto_3897 ?auto_3898 ) ) ( not ( = ?auto_3897 ?auto_3899 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3899 ?auto_3898 ?auto_3896 )
      ( FLY-3PPL-VERIFY ?auto_3897 ?auto_3898 ?auto_3899 ?auto_3896 ) )
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
      ?auto_3909 - AIRCRAFT
      ?auto_3908 - CITY
      ?auto_3911 - FLEVEL
      ?auto_3910 - FLEVEL
      ?auto_3912 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3909 ?auto_3908 ) ( FUEL-LEVEL ?auto_3909 ?auto_3911 ) ( NEXT ?auto_3910 ?auto_3911 ) ( not ( = ?auto_3904 ?auto_3908 ) ) ( not ( = ?auto_3911 ?auto_3910 ) ) ( PERSON-AT ?auto_3912 ?auto_3904 ) ( not ( = ?auto_3912 ?auto_3906 ) ) ( PERSON-AT ?auto_3906 ?auto_3908 ) ( PERSON-AT ?auto_3905 ?auto_3904 ) ( PERSON-AT ?auto_3907 ?auto_3904 ) ( not ( = ?auto_3905 ?auto_3906 ) ) ( not ( = ?auto_3905 ?auto_3907 ) ) ( not ( = ?auto_3905 ?auto_3912 ) ) ( not ( = ?auto_3906 ?auto_3907 ) ) ( not ( = ?auto_3907 ?auto_3912 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3912 ?auto_3906 ?auto_3904 )
      ( FLY-3PPL-VERIFY ?auto_3905 ?auto_3906 ?auto_3907 ?auto_3904 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3923 - PERSON
      ?auto_3924 - PERSON
      ?auto_3925 - PERSON
      ?auto_3922 - CITY
    )
    :vars
    (
      ?auto_3927 - AIRCRAFT
      ?auto_3926 - CITY
      ?auto_3929 - FLEVEL
      ?auto_3928 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3927 ?auto_3926 ) ( FUEL-LEVEL ?auto_3927 ?auto_3929 ) ( NEXT ?auto_3928 ?auto_3929 ) ( not ( = ?auto_3922 ?auto_3926 ) ) ( not ( = ?auto_3929 ?auto_3928 ) ) ( PERSON-AT ?auto_3925 ?auto_3922 ) ( not ( = ?auto_3925 ?auto_3923 ) ) ( PERSON-AT ?auto_3923 ?auto_3926 ) ( PERSON-AT ?auto_3924 ?auto_3922 ) ( not ( = ?auto_3923 ?auto_3924 ) ) ( not ( = ?auto_3924 ?auto_3925 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3925 ?auto_3923 ?auto_3922 )
      ( FLY-3PPL-VERIFY ?auto_3923 ?auto_3924 ?auto_3925 ?auto_3922 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3931 - PERSON
      ?auto_3932 - PERSON
      ?auto_3933 - PERSON
      ?auto_3930 - CITY
    )
    :vars
    (
      ?auto_3935 - AIRCRAFT
      ?auto_3934 - CITY
      ?auto_3937 - FLEVEL
      ?auto_3936 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3935 ?auto_3934 ) ( FUEL-LEVEL ?auto_3935 ?auto_3937 ) ( NEXT ?auto_3936 ?auto_3937 ) ( not ( = ?auto_3930 ?auto_3934 ) ) ( not ( = ?auto_3937 ?auto_3936 ) ) ( PERSON-AT ?auto_3932 ?auto_3930 ) ( not ( = ?auto_3932 ?auto_3931 ) ) ( PERSON-AT ?auto_3931 ?auto_3934 ) ( PERSON-AT ?auto_3933 ?auto_3930 ) ( not ( = ?auto_3931 ?auto_3933 ) ) ( not ( = ?auto_3932 ?auto_3933 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3932 ?auto_3931 ?auto_3930 )
      ( FLY-3PPL-VERIFY ?auto_3931 ?auto_3932 ?auto_3933 ?auto_3930 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3947 - PERSON
      ?auto_3948 - PERSON
      ?auto_3949 - PERSON
      ?auto_3946 - CITY
    )
    :vars
    (
      ?auto_3951 - AIRCRAFT
      ?auto_3950 - CITY
      ?auto_3953 - FLEVEL
      ?auto_3952 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3951 ?auto_3950 ) ( FUEL-LEVEL ?auto_3951 ?auto_3953 ) ( NEXT ?auto_3952 ?auto_3953 ) ( not ( = ?auto_3946 ?auto_3950 ) ) ( not ( = ?auto_3953 ?auto_3952 ) ) ( PERSON-AT ?auto_3949 ?auto_3946 ) ( not ( = ?auto_3949 ?auto_3947 ) ) ( PERSON-AT ?auto_3947 ?auto_3950 ) ( PERSON-AT ?auto_3948 ?auto_3946 ) ( not ( = ?auto_3947 ?auto_3948 ) ) ( not ( = ?auto_3948 ?auto_3949 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3949 ?auto_3947 ?auto_3946 )
      ( FLY-3PPL-VERIFY ?auto_3947 ?auto_3948 ?auto_3949 ?auto_3946 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_3955 - PERSON
      ?auto_3956 - PERSON
      ?auto_3957 - PERSON
      ?auto_3954 - CITY
    )
    :vars
    (
      ?auto_3959 - AIRCRAFT
      ?auto_3958 - CITY
      ?auto_3961 - FLEVEL
      ?auto_3960 - FLEVEL
      ?auto_3962 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_3959 ?auto_3958 ) ( FUEL-LEVEL ?auto_3959 ?auto_3961 ) ( NEXT ?auto_3960 ?auto_3961 ) ( not ( = ?auto_3954 ?auto_3958 ) ) ( not ( = ?auto_3961 ?auto_3960 ) ) ( PERSON-AT ?auto_3962 ?auto_3954 ) ( not ( = ?auto_3962 ?auto_3955 ) ) ( PERSON-AT ?auto_3955 ?auto_3958 ) ( PERSON-AT ?auto_3956 ?auto_3954 ) ( PERSON-AT ?auto_3957 ?auto_3954 ) ( not ( = ?auto_3955 ?auto_3956 ) ) ( not ( = ?auto_3955 ?auto_3957 ) ) ( not ( = ?auto_3956 ?auto_3957 ) ) ( not ( = ?auto_3956 ?auto_3962 ) ) ( not ( = ?auto_3957 ?auto_3962 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_3962 ?auto_3955 ?auto_3954 )
      ( FLY-3PPL-VERIFY ?auto_3955 ?auto_3956 ?auto_3957 ?auto_3954 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_3999 - PERSON
      ?auto_3998 - CITY
    )
    :vars
    (
      ?auto_4001 - AIRCRAFT
      ?auto_4000 - CITY
      ?auto_4002 - FLEVEL
      ?auto_4003 - FLEVEL
      ?auto_4004 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_4001 ?auto_4000 ) ( NEXT ?auto_4002 ?auto_4003 ) ( not ( = ?auto_3998 ?auto_4000 ) ) ( not ( = ?auto_4003 ?auto_4002 ) ) ( PERSON-AT ?auto_4004 ?auto_3998 ) ( not ( = ?auto_4004 ?auto_3999 ) ) ( PERSON-AT ?auto_3999 ?auto_4000 ) ( FUEL-LEVEL ?auto_4001 ?auto_4002 ) )
    :subtasks
    ( ( !REFUEL ?auto_4001 ?auto_4000 ?auto_4002 ?auto_4003 )
      ( FLY-2PPL ?auto_4004 ?auto_3999 ?auto_3998 )
      ( FLY-1PPL-VERIFY ?auto_3999 ?auto_3998 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4006 - PERSON
      ?auto_4007 - PERSON
      ?auto_4005 - CITY
    )
    :vars
    (
      ?auto_4009 - AIRCRAFT
      ?auto_4008 - CITY
      ?auto_4010 - FLEVEL
      ?auto_4011 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_4009 ?auto_4008 ) ( NEXT ?auto_4010 ?auto_4011 ) ( not ( = ?auto_4005 ?auto_4008 ) ) ( not ( = ?auto_4011 ?auto_4010 ) ) ( PERSON-AT ?auto_4006 ?auto_4005 ) ( not ( = ?auto_4006 ?auto_4007 ) ) ( PERSON-AT ?auto_4007 ?auto_4008 ) ( FUEL-LEVEL ?auto_4009 ?auto_4010 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_4007 ?auto_4005 )
      ( FLY-2PPL-VERIFY ?auto_4006 ?auto_4007 ?auto_4005 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4013 - PERSON
      ?auto_4014 - PERSON
      ?auto_4012 - CITY
    )
    :vars
    (
      ?auto_4015 - AIRCRAFT
      ?auto_4018 - CITY
      ?auto_4017 - FLEVEL
      ?auto_4016 - FLEVEL
      ?auto_4019 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_4015 ?auto_4018 ) ( NEXT ?auto_4017 ?auto_4016 ) ( not ( = ?auto_4012 ?auto_4018 ) ) ( not ( = ?auto_4016 ?auto_4017 ) ) ( PERSON-AT ?auto_4019 ?auto_4012 ) ( not ( = ?auto_4019 ?auto_4014 ) ) ( PERSON-AT ?auto_4014 ?auto_4018 ) ( FUEL-LEVEL ?auto_4015 ?auto_4017 ) ( PERSON-AT ?auto_4013 ?auto_4012 ) ( not ( = ?auto_4013 ?auto_4014 ) ) ( not ( = ?auto_4013 ?auto_4019 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4019 ?auto_4014 ?auto_4012 )
      ( FLY-2PPL-VERIFY ?auto_4013 ?auto_4014 ?auto_4012 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4021 - PERSON
      ?auto_4022 - PERSON
      ?auto_4020 - CITY
    )
    :vars
    (
      ?auto_4023 - AIRCRAFT
      ?auto_4026 - CITY
      ?auto_4025 - FLEVEL
      ?auto_4024 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_4023 ?auto_4026 ) ( NEXT ?auto_4025 ?auto_4024 ) ( not ( = ?auto_4020 ?auto_4026 ) ) ( not ( = ?auto_4024 ?auto_4025 ) ) ( PERSON-AT ?auto_4022 ?auto_4020 ) ( not ( = ?auto_4022 ?auto_4021 ) ) ( PERSON-AT ?auto_4021 ?auto_4026 ) ( FUEL-LEVEL ?auto_4023 ?auto_4025 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4022 ?auto_4021 ?auto_4020 )
      ( FLY-2PPL-VERIFY ?auto_4021 ?auto_4022 ?auto_4020 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4028 - PERSON
      ?auto_4029 - PERSON
      ?auto_4027 - CITY
    )
    :vars
    (
      ?auto_4030 - AIRCRAFT
      ?auto_4033 - CITY
      ?auto_4032 - FLEVEL
      ?auto_4031 - FLEVEL
      ?auto_4034 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_4030 ?auto_4033 ) ( NEXT ?auto_4032 ?auto_4031 ) ( not ( = ?auto_4027 ?auto_4033 ) ) ( not ( = ?auto_4031 ?auto_4032 ) ) ( PERSON-AT ?auto_4034 ?auto_4027 ) ( not ( = ?auto_4034 ?auto_4028 ) ) ( PERSON-AT ?auto_4028 ?auto_4033 ) ( FUEL-LEVEL ?auto_4030 ?auto_4032 ) ( PERSON-AT ?auto_4029 ?auto_4027 ) ( not ( = ?auto_4028 ?auto_4029 ) ) ( not ( = ?auto_4029 ?auto_4034 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4034 ?auto_4028 ?auto_4027 )
      ( FLY-2PPL-VERIFY ?auto_4028 ?auto_4029 ?auto_4027 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4044 - PERSON
      ?auto_4045 - PERSON
      ?auto_4046 - PERSON
      ?auto_4043 - CITY
    )
    :vars
    (
      ?auto_4047 - AIRCRAFT
      ?auto_4050 - CITY
      ?auto_4049 - FLEVEL
      ?auto_4048 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_4047 ?auto_4050 ) ( NEXT ?auto_4049 ?auto_4048 ) ( not ( = ?auto_4043 ?auto_4050 ) ) ( not ( = ?auto_4048 ?auto_4049 ) ) ( PERSON-AT ?auto_4045 ?auto_4043 ) ( not ( = ?auto_4045 ?auto_4046 ) ) ( PERSON-AT ?auto_4046 ?auto_4050 ) ( FUEL-LEVEL ?auto_4047 ?auto_4049 ) ( PERSON-AT ?auto_4044 ?auto_4043 ) ( not ( = ?auto_4044 ?auto_4045 ) ) ( not ( = ?auto_4044 ?auto_4046 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4045 ?auto_4046 ?auto_4043 )
      ( FLY-3PPL-VERIFY ?auto_4044 ?auto_4045 ?auto_4046 ?auto_4043 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4052 - PERSON
      ?auto_4053 - PERSON
      ?auto_4054 - PERSON
      ?auto_4051 - CITY
    )
    :vars
    (
      ?auto_4055 - AIRCRAFT
      ?auto_4058 - CITY
      ?auto_4057 - FLEVEL
      ?auto_4056 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_4055 ?auto_4058 ) ( NEXT ?auto_4057 ?auto_4056 ) ( not ( = ?auto_4051 ?auto_4058 ) ) ( not ( = ?auto_4056 ?auto_4057 ) ) ( PERSON-AT ?auto_4052 ?auto_4051 ) ( not ( = ?auto_4052 ?auto_4054 ) ) ( PERSON-AT ?auto_4054 ?auto_4058 ) ( FUEL-LEVEL ?auto_4055 ?auto_4057 ) ( PERSON-AT ?auto_4053 ?auto_4051 ) ( not ( = ?auto_4052 ?auto_4053 ) ) ( not ( = ?auto_4053 ?auto_4054 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4052 ?auto_4054 ?auto_4051 )
      ( FLY-3PPL-VERIFY ?auto_4052 ?auto_4053 ?auto_4054 ?auto_4051 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4060 - PERSON
      ?auto_4061 - PERSON
      ?auto_4062 - PERSON
      ?auto_4059 - CITY
    )
    :vars
    (
      ?auto_4063 - AIRCRAFT
      ?auto_4066 - CITY
      ?auto_4065 - FLEVEL
      ?auto_4064 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_4063 ?auto_4066 ) ( NEXT ?auto_4065 ?auto_4064 ) ( not ( = ?auto_4059 ?auto_4066 ) ) ( not ( = ?auto_4064 ?auto_4065 ) ) ( PERSON-AT ?auto_4062 ?auto_4059 ) ( not ( = ?auto_4062 ?auto_4061 ) ) ( PERSON-AT ?auto_4061 ?auto_4066 ) ( FUEL-LEVEL ?auto_4063 ?auto_4065 ) ( PERSON-AT ?auto_4060 ?auto_4059 ) ( not ( = ?auto_4060 ?auto_4061 ) ) ( not ( = ?auto_4060 ?auto_4062 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4062 ?auto_4061 ?auto_4059 )
      ( FLY-3PPL-VERIFY ?auto_4060 ?auto_4061 ?auto_4062 ?auto_4059 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4068 - PERSON
      ?auto_4069 - PERSON
      ?auto_4070 - PERSON
      ?auto_4067 - CITY
    )
    :vars
    (
      ?auto_4071 - AIRCRAFT
      ?auto_4074 - CITY
      ?auto_4073 - FLEVEL
      ?auto_4072 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_4071 ?auto_4074 ) ( NEXT ?auto_4073 ?auto_4072 ) ( not ( = ?auto_4067 ?auto_4074 ) ) ( not ( = ?auto_4072 ?auto_4073 ) ) ( PERSON-AT ?auto_4068 ?auto_4067 ) ( not ( = ?auto_4068 ?auto_4069 ) ) ( PERSON-AT ?auto_4069 ?auto_4074 ) ( FUEL-LEVEL ?auto_4071 ?auto_4073 ) ( PERSON-AT ?auto_4070 ?auto_4067 ) ( not ( = ?auto_4068 ?auto_4070 ) ) ( not ( = ?auto_4069 ?auto_4070 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4068 ?auto_4069 ?auto_4067 )
      ( FLY-3PPL-VERIFY ?auto_4068 ?auto_4069 ?auto_4070 ?auto_4067 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4084 - PERSON
      ?auto_4085 - PERSON
      ?auto_4086 - PERSON
      ?auto_4083 - CITY
    )
    :vars
    (
      ?auto_4087 - AIRCRAFT
      ?auto_4090 - CITY
      ?auto_4089 - FLEVEL
      ?auto_4088 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_4087 ?auto_4090 ) ( NEXT ?auto_4089 ?auto_4088 ) ( not ( = ?auto_4083 ?auto_4090 ) ) ( not ( = ?auto_4088 ?auto_4089 ) ) ( PERSON-AT ?auto_4085 ?auto_4083 ) ( not ( = ?auto_4085 ?auto_4086 ) ) ( PERSON-AT ?auto_4086 ?auto_4090 ) ( FUEL-LEVEL ?auto_4087 ?auto_4089 ) ( PERSON-AT ?auto_4084 ?auto_4083 ) ( not ( = ?auto_4084 ?auto_4085 ) ) ( not ( = ?auto_4084 ?auto_4086 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4085 ?auto_4086 ?auto_4083 )
      ( FLY-3PPL-VERIFY ?auto_4084 ?auto_4085 ?auto_4086 ?auto_4083 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4092 - PERSON
      ?auto_4093 - PERSON
      ?auto_4094 - PERSON
      ?auto_4091 - CITY
    )
    :vars
    (
      ?auto_4095 - AIRCRAFT
      ?auto_4098 - CITY
      ?auto_4097 - FLEVEL
      ?auto_4096 - FLEVEL
      ?auto_4099 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_4095 ?auto_4098 ) ( NEXT ?auto_4097 ?auto_4096 ) ( not ( = ?auto_4091 ?auto_4098 ) ) ( not ( = ?auto_4096 ?auto_4097 ) ) ( PERSON-AT ?auto_4099 ?auto_4091 ) ( not ( = ?auto_4099 ?auto_4094 ) ) ( PERSON-AT ?auto_4094 ?auto_4098 ) ( FUEL-LEVEL ?auto_4095 ?auto_4097 ) ( PERSON-AT ?auto_4092 ?auto_4091 ) ( PERSON-AT ?auto_4093 ?auto_4091 ) ( not ( = ?auto_4092 ?auto_4093 ) ) ( not ( = ?auto_4092 ?auto_4094 ) ) ( not ( = ?auto_4092 ?auto_4099 ) ) ( not ( = ?auto_4093 ?auto_4094 ) ) ( not ( = ?auto_4093 ?auto_4099 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4099 ?auto_4094 ?auto_4091 )
      ( FLY-3PPL-VERIFY ?auto_4092 ?auto_4093 ?auto_4094 ?auto_4091 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4101 - PERSON
      ?auto_4102 - PERSON
      ?auto_4103 - PERSON
      ?auto_4100 - CITY
    )
    :vars
    (
      ?auto_4104 - AIRCRAFT
      ?auto_4107 - CITY
      ?auto_4106 - FLEVEL
      ?auto_4105 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_4104 ?auto_4107 ) ( NEXT ?auto_4106 ?auto_4105 ) ( not ( = ?auto_4100 ?auto_4107 ) ) ( not ( = ?auto_4105 ?auto_4106 ) ) ( PERSON-AT ?auto_4103 ?auto_4100 ) ( not ( = ?auto_4103 ?auto_4102 ) ) ( PERSON-AT ?auto_4102 ?auto_4107 ) ( FUEL-LEVEL ?auto_4104 ?auto_4106 ) ( PERSON-AT ?auto_4101 ?auto_4100 ) ( not ( = ?auto_4101 ?auto_4102 ) ) ( not ( = ?auto_4101 ?auto_4103 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4103 ?auto_4102 ?auto_4100 )
      ( FLY-3PPL-VERIFY ?auto_4101 ?auto_4102 ?auto_4103 ?auto_4100 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4109 - PERSON
      ?auto_4110 - PERSON
      ?auto_4111 - PERSON
      ?auto_4108 - CITY
    )
    :vars
    (
      ?auto_4112 - AIRCRAFT
      ?auto_4115 - CITY
      ?auto_4114 - FLEVEL
      ?auto_4113 - FLEVEL
      ?auto_4116 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_4112 ?auto_4115 ) ( NEXT ?auto_4114 ?auto_4113 ) ( not ( = ?auto_4108 ?auto_4115 ) ) ( not ( = ?auto_4113 ?auto_4114 ) ) ( PERSON-AT ?auto_4116 ?auto_4108 ) ( not ( = ?auto_4116 ?auto_4110 ) ) ( PERSON-AT ?auto_4110 ?auto_4115 ) ( FUEL-LEVEL ?auto_4112 ?auto_4114 ) ( PERSON-AT ?auto_4109 ?auto_4108 ) ( PERSON-AT ?auto_4111 ?auto_4108 ) ( not ( = ?auto_4109 ?auto_4110 ) ) ( not ( = ?auto_4109 ?auto_4111 ) ) ( not ( = ?auto_4109 ?auto_4116 ) ) ( not ( = ?auto_4110 ?auto_4111 ) ) ( not ( = ?auto_4111 ?auto_4116 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4116 ?auto_4110 ?auto_4108 )
      ( FLY-3PPL-VERIFY ?auto_4109 ?auto_4110 ?auto_4111 ?auto_4108 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4127 - PERSON
      ?auto_4128 - PERSON
      ?auto_4129 - PERSON
      ?auto_4126 - CITY
    )
    :vars
    (
      ?auto_4130 - AIRCRAFT
      ?auto_4133 - CITY
      ?auto_4132 - FLEVEL
      ?auto_4131 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_4130 ?auto_4133 ) ( NEXT ?auto_4132 ?auto_4131 ) ( not ( = ?auto_4126 ?auto_4133 ) ) ( not ( = ?auto_4131 ?auto_4132 ) ) ( PERSON-AT ?auto_4129 ?auto_4126 ) ( not ( = ?auto_4129 ?auto_4127 ) ) ( PERSON-AT ?auto_4127 ?auto_4133 ) ( FUEL-LEVEL ?auto_4130 ?auto_4132 ) ( PERSON-AT ?auto_4128 ?auto_4126 ) ( not ( = ?auto_4127 ?auto_4128 ) ) ( not ( = ?auto_4128 ?auto_4129 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4129 ?auto_4127 ?auto_4126 )
      ( FLY-3PPL-VERIFY ?auto_4127 ?auto_4128 ?auto_4129 ?auto_4126 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4135 - PERSON
      ?auto_4136 - PERSON
      ?auto_4137 - PERSON
      ?auto_4134 - CITY
    )
    :vars
    (
      ?auto_4138 - AIRCRAFT
      ?auto_4141 - CITY
      ?auto_4140 - FLEVEL
      ?auto_4139 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_4138 ?auto_4141 ) ( NEXT ?auto_4140 ?auto_4139 ) ( not ( = ?auto_4134 ?auto_4141 ) ) ( not ( = ?auto_4139 ?auto_4140 ) ) ( PERSON-AT ?auto_4136 ?auto_4134 ) ( not ( = ?auto_4136 ?auto_4135 ) ) ( PERSON-AT ?auto_4135 ?auto_4141 ) ( FUEL-LEVEL ?auto_4138 ?auto_4140 ) ( PERSON-AT ?auto_4137 ?auto_4134 ) ( not ( = ?auto_4135 ?auto_4137 ) ) ( not ( = ?auto_4136 ?auto_4137 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4136 ?auto_4135 ?auto_4134 )
      ( FLY-3PPL-VERIFY ?auto_4135 ?auto_4136 ?auto_4137 ?auto_4134 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4151 - PERSON
      ?auto_4152 - PERSON
      ?auto_4153 - PERSON
      ?auto_4150 - CITY
    )
    :vars
    (
      ?auto_4154 - AIRCRAFT
      ?auto_4157 - CITY
      ?auto_4156 - FLEVEL
      ?auto_4155 - FLEVEL
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_4154 ?auto_4157 ) ( NEXT ?auto_4156 ?auto_4155 ) ( not ( = ?auto_4150 ?auto_4157 ) ) ( not ( = ?auto_4155 ?auto_4156 ) ) ( PERSON-AT ?auto_4153 ?auto_4150 ) ( not ( = ?auto_4153 ?auto_4151 ) ) ( PERSON-AT ?auto_4151 ?auto_4157 ) ( FUEL-LEVEL ?auto_4154 ?auto_4156 ) ( PERSON-AT ?auto_4152 ?auto_4150 ) ( not ( = ?auto_4151 ?auto_4152 ) ) ( not ( = ?auto_4152 ?auto_4153 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4153 ?auto_4151 ?auto_4150 )
      ( FLY-3PPL-VERIFY ?auto_4151 ?auto_4152 ?auto_4153 ?auto_4150 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4159 - PERSON
      ?auto_4160 - PERSON
      ?auto_4161 - PERSON
      ?auto_4158 - CITY
    )
    :vars
    (
      ?auto_4162 - AIRCRAFT
      ?auto_4165 - CITY
      ?auto_4164 - FLEVEL
      ?auto_4163 - FLEVEL
      ?auto_4166 - PERSON
    )
    :precondition
    ( and ( AIRCRAFT-AT ?auto_4162 ?auto_4165 ) ( NEXT ?auto_4164 ?auto_4163 ) ( not ( = ?auto_4158 ?auto_4165 ) ) ( not ( = ?auto_4163 ?auto_4164 ) ) ( PERSON-AT ?auto_4166 ?auto_4158 ) ( not ( = ?auto_4166 ?auto_4159 ) ) ( PERSON-AT ?auto_4159 ?auto_4165 ) ( FUEL-LEVEL ?auto_4162 ?auto_4164 ) ( PERSON-AT ?auto_4160 ?auto_4158 ) ( PERSON-AT ?auto_4161 ?auto_4158 ) ( not ( = ?auto_4159 ?auto_4160 ) ) ( not ( = ?auto_4159 ?auto_4161 ) ) ( not ( = ?auto_4160 ?auto_4161 ) ) ( not ( = ?auto_4160 ?auto_4166 ) ) ( not ( = ?auto_4161 ?auto_4166 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4166 ?auto_4159 ?auto_4158 )
      ( FLY-3PPL-VERIFY ?auto_4159 ?auto_4160 ?auto_4161 ?auto_4158 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_4203 - PERSON
      ?auto_4202 - CITY
    )
    :vars
    (
      ?auto_4206 - FLEVEL
      ?auto_4205 - FLEVEL
      ?auto_4207 - CITY
      ?auto_4208 - PERSON
      ?auto_4204 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4206 ?auto_4205 ) ( not ( = ?auto_4202 ?auto_4207 ) ) ( not ( = ?auto_4205 ?auto_4206 ) ) ( PERSON-AT ?auto_4208 ?auto_4202 ) ( not ( = ?auto_4208 ?auto_4203 ) ) ( PERSON-AT ?auto_4203 ?auto_4207 ) ( AIRCRAFT-AT ?auto_4204 ?auto_4202 ) ( FUEL-LEVEL ?auto_4204 ?auto_4205 ) )
    :subtasks
    ( ( !FLY ?auto_4204 ?auto_4202 ?auto_4207 ?auto_4205 ?auto_4206 )
      ( FLY-2PPL ?auto_4208 ?auto_4203 ?auto_4202 )
      ( FLY-1PPL-VERIFY ?auto_4203 ?auto_4202 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4210 - PERSON
      ?auto_4211 - PERSON
      ?auto_4209 - CITY
    )
    :vars
    (
      ?auto_4213 - FLEVEL
      ?auto_4215 - FLEVEL
      ?auto_4212 - CITY
      ?auto_4214 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4213 ?auto_4215 ) ( not ( = ?auto_4209 ?auto_4212 ) ) ( not ( = ?auto_4215 ?auto_4213 ) ) ( PERSON-AT ?auto_4210 ?auto_4209 ) ( not ( = ?auto_4210 ?auto_4211 ) ) ( PERSON-AT ?auto_4211 ?auto_4212 ) ( AIRCRAFT-AT ?auto_4214 ?auto_4209 ) ( FUEL-LEVEL ?auto_4214 ?auto_4215 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_4211 ?auto_4209 )
      ( FLY-2PPL-VERIFY ?auto_4210 ?auto_4211 ?auto_4209 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4217 - PERSON
      ?auto_4218 - PERSON
      ?auto_4216 - CITY
    )
    :vars
    (
      ?auto_4221 - FLEVEL
      ?auto_4220 - FLEVEL
      ?auto_4219 - CITY
      ?auto_4223 - PERSON
      ?auto_4222 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4221 ?auto_4220 ) ( not ( = ?auto_4216 ?auto_4219 ) ) ( not ( = ?auto_4220 ?auto_4221 ) ) ( PERSON-AT ?auto_4223 ?auto_4216 ) ( not ( = ?auto_4223 ?auto_4218 ) ) ( PERSON-AT ?auto_4218 ?auto_4219 ) ( AIRCRAFT-AT ?auto_4222 ?auto_4216 ) ( FUEL-LEVEL ?auto_4222 ?auto_4220 ) ( PERSON-AT ?auto_4217 ?auto_4216 ) ( not ( = ?auto_4217 ?auto_4218 ) ) ( not ( = ?auto_4217 ?auto_4223 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4223 ?auto_4218 ?auto_4216 )
      ( FLY-2PPL-VERIFY ?auto_4217 ?auto_4218 ?auto_4216 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4225 - PERSON
      ?auto_4226 - PERSON
      ?auto_4224 - CITY
    )
    :vars
    (
      ?auto_4229 - FLEVEL
      ?auto_4228 - FLEVEL
      ?auto_4227 - CITY
      ?auto_4230 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4229 ?auto_4228 ) ( not ( = ?auto_4224 ?auto_4227 ) ) ( not ( = ?auto_4228 ?auto_4229 ) ) ( PERSON-AT ?auto_4226 ?auto_4224 ) ( not ( = ?auto_4226 ?auto_4225 ) ) ( PERSON-AT ?auto_4225 ?auto_4227 ) ( AIRCRAFT-AT ?auto_4230 ?auto_4224 ) ( FUEL-LEVEL ?auto_4230 ?auto_4228 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4226 ?auto_4225 ?auto_4224 )
      ( FLY-2PPL-VERIFY ?auto_4225 ?auto_4226 ?auto_4224 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4232 - PERSON
      ?auto_4233 - PERSON
      ?auto_4231 - CITY
    )
    :vars
    (
      ?auto_4236 - FLEVEL
      ?auto_4235 - FLEVEL
      ?auto_4234 - CITY
      ?auto_4238 - PERSON
      ?auto_4237 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4236 ?auto_4235 ) ( not ( = ?auto_4231 ?auto_4234 ) ) ( not ( = ?auto_4235 ?auto_4236 ) ) ( PERSON-AT ?auto_4238 ?auto_4231 ) ( not ( = ?auto_4238 ?auto_4232 ) ) ( PERSON-AT ?auto_4232 ?auto_4234 ) ( AIRCRAFT-AT ?auto_4237 ?auto_4231 ) ( FUEL-LEVEL ?auto_4237 ?auto_4235 ) ( PERSON-AT ?auto_4233 ?auto_4231 ) ( not ( = ?auto_4232 ?auto_4233 ) ) ( not ( = ?auto_4233 ?auto_4238 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4238 ?auto_4232 ?auto_4231 )
      ( FLY-2PPL-VERIFY ?auto_4232 ?auto_4233 ?auto_4231 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4248 - PERSON
      ?auto_4249 - PERSON
      ?auto_4250 - PERSON
      ?auto_4247 - CITY
    )
    :vars
    (
      ?auto_4253 - FLEVEL
      ?auto_4252 - FLEVEL
      ?auto_4251 - CITY
      ?auto_4254 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4253 ?auto_4252 ) ( not ( = ?auto_4247 ?auto_4251 ) ) ( not ( = ?auto_4252 ?auto_4253 ) ) ( PERSON-AT ?auto_4249 ?auto_4247 ) ( not ( = ?auto_4249 ?auto_4250 ) ) ( PERSON-AT ?auto_4250 ?auto_4251 ) ( AIRCRAFT-AT ?auto_4254 ?auto_4247 ) ( FUEL-LEVEL ?auto_4254 ?auto_4252 ) ( PERSON-AT ?auto_4248 ?auto_4247 ) ( not ( = ?auto_4248 ?auto_4249 ) ) ( not ( = ?auto_4248 ?auto_4250 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4249 ?auto_4250 ?auto_4247 )
      ( FLY-3PPL-VERIFY ?auto_4248 ?auto_4249 ?auto_4250 ?auto_4247 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4256 - PERSON
      ?auto_4257 - PERSON
      ?auto_4258 - PERSON
      ?auto_4255 - CITY
    )
    :vars
    (
      ?auto_4261 - FLEVEL
      ?auto_4260 - FLEVEL
      ?auto_4259 - CITY
      ?auto_4262 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4261 ?auto_4260 ) ( not ( = ?auto_4255 ?auto_4259 ) ) ( not ( = ?auto_4260 ?auto_4261 ) ) ( PERSON-AT ?auto_4256 ?auto_4255 ) ( not ( = ?auto_4256 ?auto_4258 ) ) ( PERSON-AT ?auto_4258 ?auto_4259 ) ( AIRCRAFT-AT ?auto_4262 ?auto_4255 ) ( FUEL-LEVEL ?auto_4262 ?auto_4260 ) ( PERSON-AT ?auto_4257 ?auto_4255 ) ( not ( = ?auto_4256 ?auto_4257 ) ) ( not ( = ?auto_4257 ?auto_4258 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4256 ?auto_4258 ?auto_4255 )
      ( FLY-3PPL-VERIFY ?auto_4256 ?auto_4257 ?auto_4258 ?auto_4255 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4264 - PERSON
      ?auto_4265 - PERSON
      ?auto_4266 - PERSON
      ?auto_4263 - CITY
    )
    :vars
    (
      ?auto_4269 - FLEVEL
      ?auto_4268 - FLEVEL
      ?auto_4267 - CITY
      ?auto_4270 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4269 ?auto_4268 ) ( not ( = ?auto_4263 ?auto_4267 ) ) ( not ( = ?auto_4268 ?auto_4269 ) ) ( PERSON-AT ?auto_4266 ?auto_4263 ) ( not ( = ?auto_4266 ?auto_4265 ) ) ( PERSON-AT ?auto_4265 ?auto_4267 ) ( AIRCRAFT-AT ?auto_4270 ?auto_4263 ) ( FUEL-LEVEL ?auto_4270 ?auto_4268 ) ( PERSON-AT ?auto_4264 ?auto_4263 ) ( not ( = ?auto_4264 ?auto_4265 ) ) ( not ( = ?auto_4264 ?auto_4266 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4266 ?auto_4265 ?auto_4263 )
      ( FLY-3PPL-VERIFY ?auto_4264 ?auto_4265 ?auto_4266 ?auto_4263 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4272 - PERSON
      ?auto_4273 - PERSON
      ?auto_4274 - PERSON
      ?auto_4271 - CITY
    )
    :vars
    (
      ?auto_4277 - FLEVEL
      ?auto_4276 - FLEVEL
      ?auto_4275 - CITY
      ?auto_4278 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4277 ?auto_4276 ) ( not ( = ?auto_4271 ?auto_4275 ) ) ( not ( = ?auto_4276 ?auto_4277 ) ) ( PERSON-AT ?auto_4272 ?auto_4271 ) ( not ( = ?auto_4272 ?auto_4273 ) ) ( PERSON-AT ?auto_4273 ?auto_4275 ) ( AIRCRAFT-AT ?auto_4278 ?auto_4271 ) ( FUEL-LEVEL ?auto_4278 ?auto_4276 ) ( PERSON-AT ?auto_4274 ?auto_4271 ) ( not ( = ?auto_4272 ?auto_4274 ) ) ( not ( = ?auto_4273 ?auto_4274 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4272 ?auto_4273 ?auto_4271 )
      ( FLY-3PPL-VERIFY ?auto_4272 ?auto_4273 ?auto_4274 ?auto_4271 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4288 - PERSON
      ?auto_4289 - PERSON
      ?auto_4290 - PERSON
      ?auto_4287 - CITY
    )
    :vars
    (
      ?auto_4293 - FLEVEL
      ?auto_4292 - FLEVEL
      ?auto_4291 - CITY
      ?auto_4294 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4293 ?auto_4292 ) ( not ( = ?auto_4287 ?auto_4291 ) ) ( not ( = ?auto_4292 ?auto_4293 ) ) ( PERSON-AT ?auto_4289 ?auto_4287 ) ( not ( = ?auto_4289 ?auto_4290 ) ) ( PERSON-AT ?auto_4290 ?auto_4291 ) ( AIRCRAFT-AT ?auto_4294 ?auto_4287 ) ( FUEL-LEVEL ?auto_4294 ?auto_4292 ) ( PERSON-AT ?auto_4288 ?auto_4287 ) ( not ( = ?auto_4288 ?auto_4289 ) ) ( not ( = ?auto_4288 ?auto_4290 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4289 ?auto_4290 ?auto_4287 )
      ( FLY-3PPL-VERIFY ?auto_4288 ?auto_4289 ?auto_4290 ?auto_4287 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4296 - PERSON
      ?auto_4297 - PERSON
      ?auto_4298 - PERSON
      ?auto_4295 - CITY
    )
    :vars
    (
      ?auto_4301 - FLEVEL
      ?auto_4300 - FLEVEL
      ?auto_4299 - CITY
      ?auto_4303 - PERSON
      ?auto_4302 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4301 ?auto_4300 ) ( not ( = ?auto_4295 ?auto_4299 ) ) ( not ( = ?auto_4300 ?auto_4301 ) ) ( PERSON-AT ?auto_4303 ?auto_4295 ) ( not ( = ?auto_4303 ?auto_4298 ) ) ( PERSON-AT ?auto_4298 ?auto_4299 ) ( AIRCRAFT-AT ?auto_4302 ?auto_4295 ) ( FUEL-LEVEL ?auto_4302 ?auto_4300 ) ( PERSON-AT ?auto_4296 ?auto_4295 ) ( PERSON-AT ?auto_4297 ?auto_4295 ) ( not ( = ?auto_4296 ?auto_4297 ) ) ( not ( = ?auto_4296 ?auto_4298 ) ) ( not ( = ?auto_4296 ?auto_4303 ) ) ( not ( = ?auto_4297 ?auto_4298 ) ) ( not ( = ?auto_4297 ?auto_4303 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4303 ?auto_4298 ?auto_4295 )
      ( FLY-3PPL-VERIFY ?auto_4296 ?auto_4297 ?auto_4298 ?auto_4295 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4305 - PERSON
      ?auto_4306 - PERSON
      ?auto_4307 - PERSON
      ?auto_4304 - CITY
    )
    :vars
    (
      ?auto_4310 - FLEVEL
      ?auto_4309 - FLEVEL
      ?auto_4308 - CITY
      ?auto_4311 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4310 ?auto_4309 ) ( not ( = ?auto_4304 ?auto_4308 ) ) ( not ( = ?auto_4309 ?auto_4310 ) ) ( PERSON-AT ?auto_4307 ?auto_4304 ) ( not ( = ?auto_4307 ?auto_4306 ) ) ( PERSON-AT ?auto_4306 ?auto_4308 ) ( AIRCRAFT-AT ?auto_4311 ?auto_4304 ) ( FUEL-LEVEL ?auto_4311 ?auto_4309 ) ( PERSON-AT ?auto_4305 ?auto_4304 ) ( not ( = ?auto_4305 ?auto_4306 ) ) ( not ( = ?auto_4305 ?auto_4307 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4307 ?auto_4306 ?auto_4304 )
      ( FLY-3PPL-VERIFY ?auto_4305 ?auto_4306 ?auto_4307 ?auto_4304 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4313 - PERSON
      ?auto_4314 - PERSON
      ?auto_4315 - PERSON
      ?auto_4312 - CITY
    )
    :vars
    (
      ?auto_4318 - FLEVEL
      ?auto_4317 - FLEVEL
      ?auto_4316 - CITY
      ?auto_4320 - PERSON
      ?auto_4319 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4318 ?auto_4317 ) ( not ( = ?auto_4312 ?auto_4316 ) ) ( not ( = ?auto_4317 ?auto_4318 ) ) ( PERSON-AT ?auto_4320 ?auto_4312 ) ( not ( = ?auto_4320 ?auto_4314 ) ) ( PERSON-AT ?auto_4314 ?auto_4316 ) ( AIRCRAFT-AT ?auto_4319 ?auto_4312 ) ( FUEL-LEVEL ?auto_4319 ?auto_4317 ) ( PERSON-AT ?auto_4313 ?auto_4312 ) ( PERSON-AT ?auto_4315 ?auto_4312 ) ( not ( = ?auto_4313 ?auto_4314 ) ) ( not ( = ?auto_4313 ?auto_4315 ) ) ( not ( = ?auto_4313 ?auto_4320 ) ) ( not ( = ?auto_4314 ?auto_4315 ) ) ( not ( = ?auto_4315 ?auto_4320 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4320 ?auto_4314 ?auto_4312 )
      ( FLY-3PPL-VERIFY ?auto_4313 ?auto_4314 ?auto_4315 ?auto_4312 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4331 - PERSON
      ?auto_4332 - PERSON
      ?auto_4333 - PERSON
      ?auto_4330 - CITY
    )
    :vars
    (
      ?auto_4336 - FLEVEL
      ?auto_4335 - FLEVEL
      ?auto_4334 - CITY
      ?auto_4337 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4336 ?auto_4335 ) ( not ( = ?auto_4330 ?auto_4334 ) ) ( not ( = ?auto_4335 ?auto_4336 ) ) ( PERSON-AT ?auto_4333 ?auto_4330 ) ( not ( = ?auto_4333 ?auto_4331 ) ) ( PERSON-AT ?auto_4331 ?auto_4334 ) ( AIRCRAFT-AT ?auto_4337 ?auto_4330 ) ( FUEL-LEVEL ?auto_4337 ?auto_4335 ) ( PERSON-AT ?auto_4332 ?auto_4330 ) ( not ( = ?auto_4331 ?auto_4332 ) ) ( not ( = ?auto_4332 ?auto_4333 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4333 ?auto_4331 ?auto_4330 )
      ( FLY-3PPL-VERIFY ?auto_4331 ?auto_4332 ?auto_4333 ?auto_4330 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4339 - PERSON
      ?auto_4340 - PERSON
      ?auto_4341 - PERSON
      ?auto_4338 - CITY
    )
    :vars
    (
      ?auto_4344 - FLEVEL
      ?auto_4343 - FLEVEL
      ?auto_4342 - CITY
      ?auto_4345 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4344 ?auto_4343 ) ( not ( = ?auto_4338 ?auto_4342 ) ) ( not ( = ?auto_4343 ?auto_4344 ) ) ( PERSON-AT ?auto_4340 ?auto_4338 ) ( not ( = ?auto_4340 ?auto_4339 ) ) ( PERSON-AT ?auto_4339 ?auto_4342 ) ( AIRCRAFT-AT ?auto_4345 ?auto_4338 ) ( FUEL-LEVEL ?auto_4345 ?auto_4343 ) ( PERSON-AT ?auto_4341 ?auto_4338 ) ( not ( = ?auto_4339 ?auto_4341 ) ) ( not ( = ?auto_4340 ?auto_4341 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4340 ?auto_4339 ?auto_4338 )
      ( FLY-3PPL-VERIFY ?auto_4339 ?auto_4340 ?auto_4341 ?auto_4338 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4355 - PERSON
      ?auto_4356 - PERSON
      ?auto_4357 - PERSON
      ?auto_4354 - CITY
    )
    :vars
    (
      ?auto_4360 - FLEVEL
      ?auto_4359 - FLEVEL
      ?auto_4358 - CITY
      ?auto_4361 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4360 ?auto_4359 ) ( not ( = ?auto_4354 ?auto_4358 ) ) ( not ( = ?auto_4359 ?auto_4360 ) ) ( PERSON-AT ?auto_4357 ?auto_4354 ) ( not ( = ?auto_4357 ?auto_4355 ) ) ( PERSON-AT ?auto_4355 ?auto_4358 ) ( AIRCRAFT-AT ?auto_4361 ?auto_4354 ) ( FUEL-LEVEL ?auto_4361 ?auto_4359 ) ( PERSON-AT ?auto_4356 ?auto_4354 ) ( not ( = ?auto_4355 ?auto_4356 ) ) ( not ( = ?auto_4356 ?auto_4357 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4357 ?auto_4355 ?auto_4354 )
      ( FLY-3PPL-VERIFY ?auto_4355 ?auto_4356 ?auto_4357 ?auto_4354 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4363 - PERSON
      ?auto_4364 - PERSON
      ?auto_4365 - PERSON
      ?auto_4362 - CITY
    )
    :vars
    (
      ?auto_4368 - FLEVEL
      ?auto_4367 - FLEVEL
      ?auto_4366 - CITY
      ?auto_4370 - PERSON
      ?auto_4369 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4368 ?auto_4367 ) ( not ( = ?auto_4362 ?auto_4366 ) ) ( not ( = ?auto_4367 ?auto_4368 ) ) ( PERSON-AT ?auto_4370 ?auto_4362 ) ( not ( = ?auto_4370 ?auto_4363 ) ) ( PERSON-AT ?auto_4363 ?auto_4366 ) ( AIRCRAFT-AT ?auto_4369 ?auto_4362 ) ( FUEL-LEVEL ?auto_4369 ?auto_4367 ) ( PERSON-AT ?auto_4364 ?auto_4362 ) ( PERSON-AT ?auto_4365 ?auto_4362 ) ( not ( = ?auto_4363 ?auto_4364 ) ) ( not ( = ?auto_4363 ?auto_4365 ) ) ( not ( = ?auto_4364 ?auto_4365 ) ) ( not ( = ?auto_4364 ?auto_4370 ) ) ( not ( = ?auto_4365 ?auto_4370 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4370 ?auto_4363 ?auto_4362 )
      ( FLY-3PPL-VERIFY ?auto_4363 ?auto_4364 ?auto_4365 ?auto_4362 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_4407 - PERSON
      ?auto_4406 - CITY
    )
    :vars
    (
      ?auto_4410 - FLEVEL
      ?auto_4409 - FLEVEL
      ?auto_4408 - CITY
      ?auto_4412 - PERSON
      ?auto_4411 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4410 ?auto_4409 ) ( not ( = ?auto_4406 ?auto_4408 ) ) ( not ( = ?auto_4409 ?auto_4410 ) ) ( PERSON-AT ?auto_4412 ?auto_4406 ) ( not ( = ?auto_4412 ?auto_4407 ) ) ( PERSON-AT ?auto_4407 ?auto_4408 ) ( AIRCRAFT-AT ?auto_4411 ?auto_4406 ) ( FUEL-LEVEL ?auto_4411 ?auto_4410 ) )
    :subtasks
    ( ( !REFUEL ?auto_4411 ?auto_4406 ?auto_4410 ?auto_4409 )
      ( FLY-2PPL ?auto_4412 ?auto_4407 ?auto_4406 )
      ( FLY-1PPL-VERIFY ?auto_4407 ?auto_4406 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4414 - PERSON
      ?auto_4415 - PERSON
      ?auto_4413 - CITY
    )
    :vars
    (
      ?auto_4419 - FLEVEL
      ?auto_4417 - FLEVEL
      ?auto_4418 - CITY
      ?auto_4416 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4419 ?auto_4417 ) ( not ( = ?auto_4413 ?auto_4418 ) ) ( not ( = ?auto_4417 ?auto_4419 ) ) ( PERSON-AT ?auto_4414 ?auto_4413 ) ( not ( = ?auto_4414 ?auto_4415 ) ) ( PERSON-AT ?auto_4415 ?auto_4418 ) ( AIRCRAFT-AT ?auto_4416 ?auto_4413 ) ( FUEL-LEVEL ?auto_4416 ?auto_4419 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_4415 ?auto_4413 )
      ( FLY-2PPL-VERIFY ?auto_4414 ?auto_4415 ?auto_4413 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4421 - PERSON
      ?auto_4422 - PERSON
      ?auto_4420 - CITY
    )
    :vars
    (
      ?auto_4423 - FLEVEL
      ?auto_4424 - FLEVEL
      ?auto_4426 - CITY
      ?auto_4427 - PERSON
      ?auto_4425 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4423 ?auto_4424 ) ( not ( = ?auto_4420 ?auto_4426 ) ) ( not ( = ?auto_4424 ?auto_4423 ) ) ( PERSON-AT ?auto_4427 ?auto_4420 ) ( not ( = ?auto_4427 ?auto_4422 ) ) ( PERSON-AT ?auto_4422 ?auto_4426 ) ( AIRCRAFT-AT ?auto_4425 ?auto_4420 ) ( FUEL-LEVEL ?auto_4425 ?auto_4423 ) ( PERSON-AT ?auto_4421 ?auto_4420 ) ( not ( = ?auto_4421 ?auto_4422 ) ) ( not ( = ?auto_4421 ?auto_4427 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4427 ?auto_4422 ?auto_4420 )
      ( FLY-2PPL-VERIFY ?auto_4421 ?auto_4422 ?auto_4420 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4429 - PERSON
      ?auto_4430 - PERSON
      ?auto_4428 - CITY
    )
    :vars
    (
      ?auto_4431 - FLEVEL
      ?auto_4432 - FLEVEL
      ?auto_4434 - CITY
      ?auto_4433 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4431 ?auto_4432 ) ( not ( = ?auto_4428 ?auto_4434 ) ) ( not ( = ?auto_4432 ?auto_4431 ) ) ( PERSON-AT ?auto_4430 ?auto_4428 ) ( not ( = ?auto_4430 ?auto_4429 ) ) ( PERSON-AT ?auto_4429 ?auto_4434 ) ( AIRCRAFT-AT ?auto_4433 ?auto_4428 ) ( FUEL-LEVEL ?auto_4433 ?auto_4431 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4430 ?auto_4429 ?auto_4428 )
      ( FLY-2PPL-VERIFY ?auto_4429 ?auto_4430 ?auto_4428 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4436 - PERSON
      ?auto_4437 - PERSON
      ?auto_4435 - CITY
    )
    :vars
    (
      ?auto_4438 - FLEVEL
      ?auto_4439 - FLEVEL
      ?auto_4441 - CITY
      ?auto_4442 - PERSON
      ?auto_4440 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4438 ?auto_4439 ) ( not ( = ?auto_4435 ?auto_4441 ) ) ( not ( = ?auto_4439 ?auto_4438 ) ) ( PERSON-AT ?auto_4442 ?auto_4435 ) ( not ( = ?auto_4442 ?auto_4436 ) ) ( PERSON-AT ?auto_4436 ?auto_4441 ) ( AIRCRAFT-AT ?auto_4440 ?auto_4435 ) ( FUEL-LEVEL ?auto_4440 ?auto_4438 ) ( PERSON-AT ?auto_4437 ?auto_4435 ) ( not ( = ?auto_4436 ?auto_4437 ) ) ( not ( = ?auto_4437 ?auto_4442 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4442 ?auto_4436 ?auto_4435 )
      ( FLY-2PPL-VERIFY ?auto_4436 ?auto_4437 ?auto_4435 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4452 - PERSON
      ?auto_4453 - PERSON
      ?auto_4454 - PERSON
      ?auto_4451 - CITY
    )
    :vars
    (
      ?auto_4455 - FLEVEL
      ?auto_4456 - FLEVEL
      ?auto_4458 - CITY
      ?auto_4457 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4455 ?auto_4456 ) ( not ( = ?auto_4451 ?auto_4458 ) ) ( not ( = ?auto_4456 ?auto_4455 ) ) ( PERSON-AT ?auto_4453 ?auto_4451 ) ( not ( = ?auto_4453 ?auto_4454 ) ) ( PERSON-AT ?auto_4454 ?auto_4458 ) ( AIRCRAFT-AT ?auto_4457 ?auto_4451 ) ( FUEL-LEVEL ?auto_4457 ?auto_4455 ) ( PERSON-AT ?auto_4452 ?auto_4451 ) ( not ( = ?auto_4452 ?auto_4453 ) ) ( not ( = ?auto_4452 ?auto_4454 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4453 ?auto_4454 ?auto_4451 )
      ( FLY-3PPL-VERIFY ?auto_4452 ?auto_4453 ?auto_4454 ?auto_4451 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4460 - PERSON
      ?auto_4461 - PERSON
      ?auto_4462 - PERSON
      ?auto_4459 - CITY
    )
    :vars
    (
      ?auto_4463 - FLEVEL
      ?auto_4464 - FLEVEL
      ?auto_4466 - CITY
      ?auto_4465 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4463 ?auto_4464 ) ( not ( = ?auto_4459 ?auto_4466 ) ) ( not ( = ?auto_4464 ?auto_4463 ) ) ( PERSON-AT ?auto_4460 ?auto_4459 ) ( not ( = ?auto_4460 ?auto_4462 ) ) ( PERSON-AT ?auto_4462 ?auto_4466 ) ( AIRCRAFT-AT ?auto_4465 ?auto_4459 ) ( FUEL-LEVEL ?auto_4465 ?auto_4463 ) ( PERSON-AT ?auto_4461 ?auto_4459 ) ( not ( = ?auto_4460 ?auto_4461 ) ) ( not ( = ?auto_4461 ?auto_4462 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4460 ?auto_4462 ?auto_4459 )
      ( FLY-3PPL-VERIFY ?auto_4460 ?auto_4461 ?auto_4462 ?auto_4459 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4468 - PERSON
      ?auto_4469 - PERSON
      ?auto_4470 - PERSON
      ?auto_4467 - CITY
    )
    :vars
    (
      ?auto_4471 - FLEVEL
      ?auto_4472 - FLEVEL
      ?auto_4474 - CITY
      ?auto_4473 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4471 ?auto_4472 ) ( not ( = ?auto_4467 ?auto_4474 ) ) ( not ( = ?auto_4472 ?auto_4471 ) ) ( PERSON-AT ?auto_4470 ?auto_4467 ) ( not ( = ?auto_4470 ?auto_4469 ) ) ( PERSON-AT ?auto_4469 ?auto_4474 ) ( AIRCRAFT-AT ?auto_4473 ?auto_4467 ) ( FUEL-LEVEL ?auto_4473 ?auto_4471 ) ( PERSON-AT ?auto_4468 ?auto_4467 ) ( not ( = ?auto_4468 ?auto_4469 ) ) ( not ( = ?auto_4468 ?auto_4470 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4470 ?auto_4469 ?auto_4467 )
      ( FLY-3PPL-VERIFY ?auto_4468 ?auto_4469 ?auto_4470 ?auto_4467 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4476 - PERSON
      ?auto_4477 - PERSON
      ?auto_4478 - PERSON
      ?auto_4475 - CITY
    )
    :vars
    (
      ?auto_4479 - FLEVEL
      ?auto_4480 - FLEVEL
      ?auto_4482 - CITY
      ?auto_4481 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4479 ?auto_4480 ) ( not ( = ?auto_4475 ?auto_4482 ) ) ( not ( = ?auto_4480 ?auto_4479 ) ) ( PERSON-AT ?auto_4476 ?auto_4475 ) ( not ( = ?auto_4476 ?auto_4477 ) ) ( PERSON-AT ?auto_4477 ?auto_4482 ) ( AIRCRAFT-AT ?auto_4481 ?auto_4475 ) ( FUEL-LEVEL ?auto_4481 ?auto_4479 ) ( PERSON-AT ?auto_4478 ?auto_4475 ) ( not ( = ?auto_4476 ?auto_4478 ) ) ( not ( = ?auto_4477 ?auto_4478 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4476 ?auto_4477 ?auto_4475 )
      ( FLY-3PPL-VERIFY ?auto_4476 ?auto_4477 ?auto_4478 ?auto_4475 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4492 - PERSON
      ?auto_4493 - PERSON
      ?auto_4494 - PERSON
      ?auto_4491 - CITY
    )
    :vars
    (
      ?auto_4495 - FLEVEL
      ?auto_4496 - FLEVEL
      ?auto_4498 - CITY
      ?auto_4497 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4495 ?auto_4496 ) ( not ( = ?auto_4491 ?auto_4498 ) ) ( not ( = ?auto_4496 ?auto_4495 ) ) ( PERSON-AT ?auto_4493 ?auto_4491 ) ( not ( = ?auto_4493 ?auto_4494 ) ) ( PERSON-AT ?auto_4494 ?auto_4498 ) ( AIRCRAFT-AT ?auto_4497 ?auto_4491 ) ( FUEL-LEVEL ?auto_4497 ?auto_4495 ) ( PERSON-AT ?auto_4492 ?auto_4491 ) ( not ( = ?auto_4492 ?auto_4493 ) ) ( not ( = ?auto_4492 ?auto_4494 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4493 ?auto_4494 ?auto_4491 )
      ( FLY-3PPL-VERIFY ?auto_4492 ?auto_4493 ?auto_4494 ?auto_4491 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4500 - PERSON
      ?auto_4501 - PERSON
      ?auto_4502 - PERSON
      ?auto_4499 - CITY
    )
    :vars
    (
      ?auto_4503 - FLEVEL
      ?auto_4504 - FLEVEL
      ?auto_4506 - CITY
      ?auto_4507 - PERSON
      ?auto_4505 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4503 ?auto_4504 ) ( not ( = ?auto_4499 ?auto_4506 ) ) ( not ( = ?auto_4504 ?auto_4503 ) ) ( PERSON-AT ?auto_4507 ?auto_4499 ) ( not ( = ?auto_4507 ?auto_4502 ) ) ( PERSON-AT ?auto_4502 ?auto_4506 ) ( AIRCRAFT-AT ?auto_4505 ?auto_4499 ) ( FUEL-LEVEL ?auto_4505 ?auto_4503 ) ( PERSON-AT ?auto_4500 ?auto_4499 ) ( PERSON-AT ?auto_4501 ?auto_4499 ) ( not ( = ?auto_4500 ?auto_4501 ) ) ( not ( = ?auto_4500 ?auto_4502 ) ) ( not ( = ?auto_4500 ?auto_4507 ) ) ( not ( = ?auto_4501 ?auto_4502 ) ) ( not ( = ?auto_4501 ?auto_4507 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4507 ?auto_4502 ?auto_4499 )
      ( FLY-3PPL-VERIFY ?auto_4500 ?auto_4501 ?auto_4502 ?auto_4499 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4509 - PERSON
      ?auto_4510 - PERSON
      ?auto_4511 - PERSON
      ?auto_4508 - CITY
    )
    :vars
    (
      ?auto_4512 - FLEVEL
      ?auto_4513 - FLEVEL
      ?auto_4515 - CITY
      ?auto_4514 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4512 ?auto_4513 ) ( not ( = ?auto_4508 ?auto_4515 ) ) ( not ( = ?auto_4513 ?auto_4512 ) ) ( PERSON-AT ?auto_4511 ?auto_4508 ) ( not ( = ?auto_4511 ?auto_4510 ) ) ( PERSON-AT ?auto_4510 ?auto_4515 ) ( AIRCRAFT-AT ?auto_4514 ?auto_4508 ) ( FUEL-LEVEL ?auto_4514 ?auto_4512 ) ( PERSON-AT ?auto_4509 ?auto_4508 ) ( not ( = ?auto_4509 ?auto_4510 ) ) ( not ( = ?auto_4509 ?auto_4511 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4511 ?auto_4510 ?auto_4508 )
      ( FLY-3PPL-VERIFY ?auto_4509 ?auto_4510 ?auto_4511 ?auto_4508 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4517 - PERSON
      ?auto_4518 - PERSON
      ?auto_4519 - PERSON
      ?auto_4516 - CITY
    )
    :vars
    (
      ?auto_4520 - FLEVEL
      ?auto_4521 - FLEVEL
      ?auto_4523 - CITY
      ?auto_4524 - PERSON
      ?auto_4522 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4520 ?auto_4521 ) ( not ( = ?auto_4516 ?auto_4523 ) ) ( not ( = ?auto_4521 ?auto_4520 ) ) ( PERSON-AT ?auto_4524 ?auto_4516 ) ( not ( = ?auto_4524 ?auto_4518 ) ) ( PERSON-AT ?auto_4518 ?auto_4523 ) ( AIRCRAFT-AT ?auto_4522 ?auto_4516 ) ( FUEL-LEVEL ?auto_4522 ?auto_4520 ) ( PERSON-AT ?auto_4517 ?auto_4516 ) ( PERSON-AT ?auto_4519 ?auto_4516 ) ( not ( = ?auto_4517 ?auto_4518 ) ) ( not ( = ?auto_4517 ?auto_4519 ) ) ( not ( = ?auto_4517 ?auto_4524 ) ) ( not ( = ?auto_4518 ?auto_4519 ) ) ( not ( = ?auto_4519 ?auto_4524 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4524 ?auto_4518 ?auto_4516 )
      ( FLY-3PPL-VERIFY ?auto_4517 ?auto_4518 ?auto_4519 ?auto_4516 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4535 - PERSON
      ?auto_4536 - PERSON
      ?auto_4537 - PERSON
      ?auto_4534 - CITY
    )
    :vars
    (
      ?auto_4538 - FLEVEL
      ?auto_4539 - FLEVEL
      ?auto_4541 - CITY
      ?auto_4540 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4538 ?auto_4539 ) ( not ( = ?auto_4534 ?auto_4541 ) ) ( not ( = ?auto_4539 ?auto_4538 ) ) ( PERSON-AT ?auto_4537 ?auto_4534 ) ( not ( = ?auto_4537 ?auto_4535 ) ) ( PERSON-AT ?auto_4535 ?auto_4541 ) ( AIRCRAFT-AT ?auto_4540 ?auto_4534 ) ( FUEL-LEVEL ?auto_4540 ?auto_4538 ) ( PERSON-AT ?auto_4536 ?auto_4534 ) ( not ( = ?auto_4535 ?auto_4536 ) ) ( not ( = ?auto_4536 ?auto_4537 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4537 ?auto_4535 ?auto_4534 )
      ( FLY-3PPL-VERIFY ?auto_4535 ?auto_4536 ?auto_4537 ?auto_4534 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4543 - PERSON
      ?auto_4544 - PERSON
      ?auto_4545 - PERSON
      ?auto_4542 - CITY
    )
    :vars
    (
      ?auto_4546 - FLEVEL
      ?auto_4547 - FLEVEL
      ?auto_4549 - CITY
      ?auto_4548 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4546 ?auto_4547 ) ( not ( = ?auto_4542 ?auto_4549 ) ) ( not ( = ?auto_4547 ?auto_4546 ) ) ( PERSON-AT ?auto_4544 ?auto_4542 ) ( not ( = ?auto_4544 ?auto_4543 ) ) ( PERSON-AT ?auto_4543 ?auto_4549 ) ( AIRCRAFT-AT ?auto_4548 ?auto_4542 ) ( FUEL-LEVEL ?auto_4548 ?auto_4546 ) ( PERSON-AT ?auto_4545 ?auto_4542 ) ( not ( = ?auto_4543 ?auto_4545 ) ) ( not ( = ?auto_4544 ?auto_4545 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4544 ?auto_4543 ?auto_4542 )
      ( FLY-3PPL-VERIFY ?auto_4543 ?auto_4544 ?auto_4545 ?auto_4542 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4559 - PERSON
      ?auto_4560 - PERSON
      ?auto_4561 - PERSON
      ?auto_4558 - CITY
    )
    :vars
    (
      ?auto_4562 - FLEVEL
      ?auto_4563 - FLEVEL
      ?auto_4565 - CITY
      ?auto_4564 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4562 ?auto_4563 ) ( not ( = ?auto_4558 ?auto_4565 ) ) ( not ( = ?auto_4563 ?auto_4562 ) ) ( PERSON-AT ?auto_4561 ?auto_4558 ) ( not ( = ?auto_4561 ?auto_4559 ) ) ( PERSON-AT ?auto_4559 ?auto_4565 ) ( AIRCRAFT-AT ?auto_4564 ?auto_4558 ) ( FUEL-LEVEL ?auto_4564 ?auto_4562 ) ( PERSON-AT ?auto_4560 ?auto_4558 ) ( not ( = ?auto_4559 ?auto_4560 ) ) ( not ( = ?auto_4560 ?auto_4561 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4561 ?auto_4559 ?auto_4558 )
      ( FLY-3PPL-VERIFY ?auto_4559 ?auto_4560 ?auto_4561 ?auto_4558 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4567 - PERSON
      ?auto_4568 - PERSON
      ?auto_4569 - PERSON
      ?auto_4566 - CITY
    )
    :vars
    (
      ?auto_4570 - FLEVEL
      ?auto_4571 - FLEVEL
      ?auto_4573 - CITY
      ?auto_4574 - PERSON
      ?auto_4572 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4570 ?auto_4571 ) ( not ( = ?auto_4566 ?auto_4573 ) ) ( not ( = ?auto_4571 ?auto_4570 ) ) ( PERSON-AT ?auto_4574 ?auto_4566 ) ( not ( = ?auto_4574 ?auto_4567 ) ) ( PERSON-AT ?auto_4567 ?auto_4573 ) ( AIRCRAFT-AT ?auto_4572 ?auto_4566 ) ( FUEL-LEVEL ?auto_4572 ?auto_4570 ) ( PERSON-AT ?auto_4568 ?auto_4566 ) ( PERSON-AT ?auto_4569 ?auto_4566 ) ( not ( = ?auto_4567 ?auto_4568 ) ) ( not ( = ?auto_4567 ?auto_4569 ) ) ( not ( = ?auto_4568 ?auto_4569 ) ) ( not ( = ?auto_4568 ?auto_4574 ) ) ( not ( = ?auto_4569 ?auto_4574 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4574 ?auto_4567 ?auto_4566 )
      ( FLY-3PPL-VERIFY ?auto_4567 ?auto_4568 ?auto_4569 ?auto_4566 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_4611 - PERSON
      ?auto_4610 - CITY
    )
    :vars
    (
      ?auto_4612 - FLEVEL
      ?auto_4613 - FLEVEL
      ?auto_4615 - CITY
      ?auto_4616 - PERSON
      ?auto_4614 - AIRCRAFT
      ?auto_4617 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_4612 ?auto_4613 ) ( not ( = ?auto_4610 ?auto_4615 ) ) ( not ( = ?auto_4613 ?auto_4612 ) ) ( PERSON-AT ?auto_4616 ?auto_4610 ) ( not ( = ?auto_4616 ?auto_4611 ) ) ( PERSON-AT ?auto_4611 ?auto_4615 ) ( AIRCRAFT-AT ?auto_4614 ?auto_4610 ) ( FUEL-LEVEL ?auto_4614 ?auto_4612 ) ( IN ?auto_4617 ?auto_4614 ) ( not ( = ?auto_4616 ?auto_4617 ) ) ( not ( = ?auto_4611 ?auto_4617 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4616 ?auto_4617 ?auto_4610 )
      ( FLY-2PPL ?auto_4616 ?auto_4611 ?auto_4610 )
      ( FLY-1PPL-VERIFY ?auto_4611 ?auto_4610 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4619 - PERSON
      ?auto_4620 - PERSON
      ?auto_4618 - CITY
    )
    :vars
    (
      ?auto_4622 - FLEVEL
      ?auto_4623 - FLEVEL
      ?auto_4625 - CITY
      ?auto_4621 - AIRCRAFT
      ?auto_4624 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_4622 ?auto_4623 ) ( not ( = ?auto_4618 ?auto_4625 ) ) ( not ( = ?auto_4623 ?auto_4622 ) ) ( PERSON-AT ?auto_4619 ?auto_4618 ) ( not ( = ?auto_4619 ?auto_4620 ) ) ( PERSON-AT ?auto_4620 ?auto_4625 ) ( AIRCRAFT-AT ?auto_4621 ?auto_4618 ) ( FUEL-LEVEL ?auto_4621 ?auto_4622 ) ( IN ?auto_4624 ?auto_4621 ) ( not ( = ?auto_4619 ?auto_4624 ) ) ( not ( = ?auto_4620 ?auto_4624 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_4620 ?auto_4618 )
      ( FLY-2PPL-VERIFY ?auto_4619 ?auto_4620 ?auto_4618 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4627 - PERSON
      ?auto_4628 - PERSON
      ?auto_4626 - CITY
    )
    :vars
    (
      ?auto_4632 - FLEVEL
      ?auto_4630 - FLEVEL
      ?auto_4629 - CITY
      ?auto_4633 - PERSON
      ?auto_4631 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4632 ?auto_4630 ) ( not ( = ?auto_4626 ?auto_4629 ) ) ( not ( = ?auto_4630 ?auto_4632 ) ) ( PERSON-AT ?auto_4633 ?auto_4626 ) ( not ( = ?auto_4633 ?auto_4628 ) ) ( PERSON-AT ?auto_4628 ?auto_4629 ) ( AIRCRAFT-AT ?auto_4631 ?auto_4626 ) ( FUEL-LEVEL ?auto_4631 ?auto_4632 ) ( IN ?auto_4627 ?auto_4631 ) ( not ( = ?auto_4633 ?auto_4627 ) ) ( not ( = ?auto_4628 ?auto_4627 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4633 ?auto_4628 ?auto_4626 )
      ( FLY-2PPL-VERIFY ?auto_4627 ?auto_4628 ?auto_4626 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4635 - PERSON
      ?auto_4636 - PERSON
      ?auto_4634 - CITY
    )
    :vars
    (
      ?auto_4641 - FLEVEL
      ?auto_4639 - FLEVEL
      ?auto_4638 - CITY
      ?auto_4640 - AIRCRAFT
      ?auto_4637 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_4641 ?auto_4639 ) ( not ( = ?auto_4634 ?auto_4638 ) ) ( not ( = ?auto_4639 ?auto_4641 ) ) ( PERSON-AT ?auto_4636 ?auto_4634 ) ( not ( = ?auto_4636 ?auto_4635 ) ) ( PERSON-AT ?auto_4635 ?auto_4638 ) ( AIRCRAFT-AT ?auto_4640 ?auto_4634 ) ( FUEL-LEVEL ?auto_4640 ?auto_4641 ) ( IN ?auto_4637 ?auto_4640 ) ( not ( = ?auto_4636 ?auto_4637 ) ) ( not ( = ?auto_4635 ?auto_4637 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4636 ?auto_4635 ?auto_4634 )
      ( FLY-2PPL-VERIFY ?auto_4635 ?auto_4636 ?auto_4634 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4643 - PERSON
      ?auto_4644 - PERSON
      ?auto_4642 - CITY
    )
    :vars
    (
      ?auto_4648 - FLEVEL
      ?auto_4646 - FLEVEL
      ?auto_4645 - CITY
      ?auto_4649 - PERSON
      ?auto_4647 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4648 ?auto_4646 ) ( not ( = ?auto_4642 ?auto_4645 ) ) ( not ( = ?auto_4646 ?auto_4648 ) ) ( PERSON-AT ?auto_4649 ?auto_4642 ) ( not ( = ?auto_4649 ?auto_4643 ) ) ( PERSON-AT ?auto_4643 ?auto_4645 ) ( AIRCRAFT-AT ?auto_4647 ?auto_4642 ) ( FUEL-LEVEL ?auto_4647 ?auto_4648 ) ( IN ?auto_4644 ?auto_4647 ) ( not ( = ?auto_4649 ?auto_4644 ) ) ( not ( = ?auto_4643 ?auto_4644 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4649 ?auto_4643 ?auto_4642 )
      ( FLY-2PPL-VERIFY ?auto_4643 ?auto_4644 ?auto_4642 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4660 - PERSON
      ?auto_4661 - PERSON
      ?auto_4662 - PERSON
      ?auto_4659 - CITY
    )
    :vars
    (
      ?auto_4667 - FLEVEL
      ?auto_4665 - FLEVEL
      ?auto_4664 - CITY
      ?auto_4666 - AIRCRAFT
      ?auto_4663 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_4667 ?auto_4665 ) ( not ( = ?auto_4659 ?auto_4664 ) ) ( not ( = ?auto_4665 ?auto_4667 ) ) ( PERSON-AT ?auto_4660 ?auto_4659 ) ( not ( = ?auto_4660 ?auto_4662 ) ) ( PERSON-AT ?auto_4662 ?auto_4664 ) ( AIRCRAFT-AT ?auto_4666 ?auto_4659 ) ( FUEL-LEVEL ?auto_4666 ?auto_4667 ) ( IN ?auto_4663 ?auto_4666 ) ( not ( = ?auto_4660 ?auto_4663 ) ) ( not ( = ?auto_4662 ?auto_4663 ) ) ( PERSON-AT ?auto_4661 ?auto_4659 ) ( not ( = ?auto_4660 ?auto_4661 ) ) ( not ( = ?auto_4661 ?auto_4662 ) ) ( not ( = ?auto_4661 ?auto_4663 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4660 ?auto_4662 ?auto_4659 )
      ( FLY-3PPL-VERIFY ?auto_4660 ?auto_4661 ?auto_4662 ?auto_4659 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4669 - PERSON
      ?auto_4670 - PERSON
      ?auto_4671 - PERSON
      ?auto_4668 - CITY
    )
    :vars
    (
      ?auto_4675 - FLEVEL
      ?auto_4673 - FLEVEL
      ?auto_4672 - CITY
      ?auto_4674 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4675 ?auto_4673 ) ( not ( = ?auto_4668 ?auto_4672 ) ) ( not ( = ?auto_4673 ?auto_4675 ) ) ( PERSON-AT ?auto_4669 ?auto_4668 ) ( not ( = ?auto_4669 ?auto_4671 ) ) ( PERSON-AT ?auto_4671 ?auto_4672 ) ( AIRCRAFT-AT ?auto_4674 ?auto_4668 ) ( FUEL-LEVEL ?auto_4674 ?auto_4675 ) ( IN ?auto_4670 ?auto_4674 ) ( not ( = ?auto_4669 ?auto_4670 ) ) ( not ( = ?auto_4671 ?auto_4670 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4669 ?auto_4671 ?auto_4668 )
      ( FLY-3PPL-VERIFY ?auto_4669 ?auto_4670 ?auto_4671 ?auto_4668 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4677 - PERSON
      ?auto_4678 - PERSON
      ?auto_4679 - PERSON
      ?auto_4676 - CITY
    )
    :vars
    (
      ?auto_4684 - FLEVEL
      ?auto_4682 - FLEVEL
      ?auto_4681 - CITY
      ?auto_4683 - AIRCRAFT
      ?auto_4680 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_4684 ?auto_4682 ) ( not ( = ?auto_4676 ?auto_4681 ) ) ( not ( = ?auto_4682 ?auto_4684 ) ) ( PERSON-AT ?auto_4679 ?auto_4676 ) ( not ( = ?auto_4679 ?auto_4678 ) ) ( PERSON-AT ?auto_4678 ?auto_4681 ) ( AIRCRAFT-AT ?auto_4683 ?auto_4676 ) ( FUEL-LEVEL ?auto_4683 ?auto_4684 ) ( IN ?auto_4680 ?auto_4683 ) ( not ( = ?auto_4679 ?auto_4680 ) ) ( not ( = ?auto_4678 ?auto_4680 ) ) ( PERSON-AT ?auto_4677 ?auto_4676 ) ( not ( = ?auto_4677 ?auto_4678 ) ) ( not ( = ?auto_4677 ?auto_4679 ) ) ( not ( = ?auto_4677 ?auto_4680 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4679 ?auto_4678 ?auto_4676 )
      ( FLY-3PPL-VERIFY ?auto_4677 ?auto_4678 ?auto_4679 ?auto_4676 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4686 - PERSON
      ?auto_4687 - PERSON
      ?auto_4688 - PERSON
      ?auto_4685 - CITY
    )
    :vars
    (
      ?auto_4692 - FLEVEL
      ?auto_4690 - FLEVEL
      ?auto_4689 - CITY
      ?auto_4691 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4692 ?auto_4690 ) ( not ( = ?auto_4685 ?auto_4689 ) ) ( not ( = ?auto_4690 ?auto_4692 ) ) ( PERSON-AT ?auto_4686 ?auto_4685 ) ( not ( = ?auto_4686 ?auto_4687 ) ) ( PERSON-AT ?auto_4687 ?auto_4689 ) ( AIRCRAFT-AT ?auto_4691 ?auto_4685 ) ( FUEL-LEVEL ?auto_4691 ?auto_4692 ) ( IN ?auto_4688 ?auto_4691 ) ( not ( = ?auto_4686 ?auto_4688 ) ) ( not ( = ?auto_4687 ?auto_4688 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4686 ?auto_4687 ?auto_4685 )
      ( FLY-3PPL-VERIFY ?auto_4686 ?auto_4687 ?auto_4688 ?auto_4685 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4703 - PERSON
      ?auto_4704 - PERSON
      ?auto_4705 - PERSON
      ?auto_4702 - CITY
    )
    :vars
    (
      ?auto_4709 - FLEVEL
      ?auto_4707 - FLEVEL
      ?auto_4706 - CITY
      ?auto_4708 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4709 ?auto_4707 ) ( not ( = ?auto_4702 ?auto_4706 ) ) ( not ( = ?auto_4707 ?auto_4709 ) ) ( PERSON-AT ?auto_4704 ?auto_4702 ) ( not ( = ?auto_4704 ?auto_4705 ) ) ( PERSON-AT ?auto_4705 ?auto_4706 ) ( AIRCRAFT-AT ?auto_4708 ?auto_4702 ) ( FUEL-LEVEL ?auto_4708 ?auto_4709 ) ( IN ?auto_4703 ?auto_4708 ) ( not ( = ?auto_4704 ?auto_4703 ) ) ( not ( = ?auto_4705 ?auto_4703 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4704 ?auto_4705 ?auto_4702 )
      ( FLY-3PPL-VERIFY ?auto_4703 ?auto_4704 ?auto_4705 ?auto_4702 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4720 - PERSON
      ?auto_4721 - PERSON
      ?auto_4722 - PERSON
      ?auto_4719 - CITY
    )
    :vars
    (
      ?auto_4726 - FLEVEL
      ?auto_4724 - FLEVEL
      ?auto_4723 - CITY
      ?auto_4725 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4726 ?auto_4724 ) ( not ( = ?auto_4719 ?auto_4723 ) ) ( not ( = ?auto_4724 ?auto_4726 ) ) ( PERSON-AT ?auto_4722 ?auto_4719 ) ( not ( = ?auto_4722 ?auto_4721 ) ) ( PERSON-AT ?auto_4721 ?auto_4723 ) ( AIRCRAFT-AT ?auto_4725 ?auto_4719 ) ( FUEL-LEVEL ?auto_4725 ?auto_4726 ) ( IN ?auto_4720 ?auto_4725 ) ( not ( = ?auto_4722 ?auto_4720 ) ) ( not ( = ?auto_4721 ?auto_4720 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4722 ?auto_4721 ?auto_4719 )
      ( FLY-3PPL-VERIFY ?auto_4720 ?auto_4721 ?auto_4722 ?auto_4719 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4746 - PERSON
      ?auto_4747 - PERSON
      ?auto_4748 - PERSON
      ?auto_4745 - CITY
    )
    :vars
    (
      ?auto_4753 - FLEVEL
      ?auto_4751 - FLEVEL
      ?auto_4750 - CITY
      ?auto_4752 - AIRCRAFT
      ?auto_4749 - PERSON
    )
    :precondition
    ( and ( NEXT ?auto_4753 ?auto_4751 ) ( not ( = ?auto_4745 ?auto_4750 ) ) ( not ( = ?auto_4751 ?auto_4753 ) ) ( PERSON-AT ?auto_4747 ?auto_4745 ) ( not ( = ?auto_4747 ?auto_4746 ) ) ( PERSON-AT ?auto_4746 ?auto_4750 ) ( AIRCRAFT-AT ?auto_4752 ?auto_4745 ) ( FUEL-LEVEL ?auto_4752 ?auto_4753 ) ( IN ?auto_4749 ?auto_4752 ) ( not ( = ?auto_4747 ?auto_4749 ) ) ( not ( = ?auto_4746 ?auto_4749 ) ) ( PERSON-AT ?auto_4748 ?auto_4745 ) ( not ( = ?auto_4746 ?auto_4748 ) ) ( not ( = ?auto_4747 ?auto_4748 ) ) ( not ( = ?auto_4748 ?auto_4749 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4747 ?auto_4746 ?auto_4745 )
      ( FLY-3PPL-VERIFY ?auto_4746 ?auto_4747 ?auto_4748 ?auto_4745 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4755 - PERSON
      ?auto_4756 - PERSON
      ?auto_4757 - PERSON
      ?auto_4754 - CITY
    )
    :vars
    (
      ?auto_4761 - FLEVEL
      ?auto_4759 - FLEVEL
      ?auto_4758 - CITY
      ?auto_4760 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4761 ?auto_4759 ) ( not ( = ?auto_4754 ?auto_4758 ) ) ( not ( = ?auto_4759 ?auto_4761 ) ) ( PERSON-AT ?auto_4756 ?auto_4754 ) ( not ( = ?auto_4756 ?auto_4755 ) ) ( PERSON-AT ?auto_4755 ?auto_4758 ) ( AIRCRAFT-AT ?auto_4760 ?auto_4754 ) ( FUEL-LEVEL ?auto_4760 ?auto_4761 ) ( IN ?auto_4757 ?auto_4760 ) ( not ( = ?auto_4756 ?auto_4757 ) ) ( not ( = ?auto_4755 ?auto_4757 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4756 ?auto_4755 ?auto_4754 )
      ( FLY-3PPL-VERIFY ?auto_4755 ?auto_4756 ?auto_4757 ?auto_4754 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4772 - PERSON
      ?auto_4773 - PERSON
      ?auto_4774 - PERSON
      ?auto_4771 - CITY
    )
    :vars
    (
      ?auto_4778 - FLEVEL
      ?auto_4776 - FLEVEL
      ?auto_4775 - CITY
      ?auto_4777 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_4778 ?auto_4776 ) ( not ( = ?auto_4771 ?auto_4775 ) ) ( not ( = ?auto_4776 ?auto_4778 ) ) ( PERSON-AT ?auto_4774 ?auto_4771 ) ( not ( = ?auto_4774 ?auto_4772 ) ) ( PERSON-AT ?auto_4772 ?auto_4775 ) ( AIRCRAFT-AT ?auto_4777 ?auto_4771 ) ( FUEL-LEVEL ?auto_4777 ?auto_4778 ) ( IN ?auto_4773 ?auto_4777 ) ( not ( = ?auto_4774 ?auto_4773 ) ) ( not ( = ?auto_4772 ?auto_4773 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4774 ?auto_4772 ?auto_4771 )
      ( FLY-3PPL-VERIFY ?auto_4772 ?auto_4773 ?auto_4774 ?auto_4771 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_4826 - PERSON
      ?auto_4825 - CITY
    )
    :vars
    (
      ?auto_4831 - FLEVEL
      ?auto_4829 - FLEVEL
      ?auto_4828 - CITY
      ?auto_4832 - PERSON
      ?auto_4827 - PERSON
      ?auto_4830 - AIRCRAFT
      ?auto_4833 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4831 ?auto_4829 ) ( not ( = ?auto_4825 ?auto_4828 ) ) ( not ( = ?auto_4829 ?auto_4831 ) ) ( PERSON-AT ?auto_4832 ?auto_4825 ) ( not ( = ?auto_4832 ?auto_4826 ) ) ( PERSON-AT ?auto_4826 ?auto_4828 ) ( IN ?auto_4827 ?auto_4830 ) ( not ( = ?auto_4832 ?auto_4827 ) ) ( not ( = ?auto_4826 ?auto_4827 ) ) ( AIRCRAFT-AT ?auto_4830 ?auto_4833 ) ( FUEL-LEVEL ?auto_4830 ?auto_4829 ) ( not ( = ?auto_4825 ?auto_4833 ) ) ( not ( = ?auto_4828 ?auto_4833 ) ) )
    :subtasks
    ( ( !FLY ?auto_4830 ?auto_4833 ?auto_4825 ?auto_4829 ?auto_4831 )
      ( FLY-2PPL ?auto_4832 ?auto_4826 ?auto_4825 )
      ( FLY-1PPL-VERIFY ?auto_4826 ?auto_4825 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4835 - PERSON
      ?auto_4836 - PERSON
      ?auto_4834 - CITY
    )
    :vars
    (
      ?auto_4842 - FLEVEL
      ?auto_4837 - FLEVEL
      ?auto_4838 - CITY
      ?auto_4840 - PERSON
      ?auto_4841 - AIRCRAFT
      ?auto_4839 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4842 ?auto_4837 ) ( not ( = ?auto_4834 ?auto_4838 ) ) ( not ( = ?auto_4837 ?auto_4842 ) ) ( PERSON-AT ?auto_4835 ?auto_4834 ) ( not ( = ?auto_4835 ?auto_4836 ) ) ( PERSON-AT ?auto_4836 ?auto_4838 ) ( IN ?auto_4840 ?auto_4841 ) ( not ( = ?auto_4835 ?auto_4840 ) ) ( not ( = ?auto_4836 ?auto_4840 ) ) ( AIRCRAFT-AT ?auto_4841 ?auto_4839 ) ( FUEL-LEVEL ?auto_4841 ?auto_4837 ) ( not ( = ?auto_4834 ?auto_4839 ) ) ( not ( = ?auto_4838 ?auto_4839 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_4836 ?auto_4834 )
      ( FLY-2PPL-VERIFY ?auto_4835 ?auto_4836 ?auto_4834 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4844 - PERSON
      ?auto_4845 - PERSON
      ?auto_4843 - CITY
    )
    :vars
    (
      ?auto_4851 - FLEVEL
      ?auto_4850 - FLEVEL
      ?auto_4849 - CITY
      ?auto_4848 - PERSON
      ?auto_4847 - AIRCRAFT
      ?auto_4846 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4851 ?auto_4850 ) ( not ( = ?auto_4843 ?auto_4849 ) ) ( not ( = ?auto_4850 ?auto_4851 ) ) ( PERSON-AT ?auto_4848 ?auto_4843 ) ( not ( = ?auto_4848 ?auto_4845 ) ) ( PERSON-AT ?auto_4845 ?auto_4849 ) ( IN ?auto_4844 ?auto_4847 ) ( not ( = ?auto_4848 ?auto_4844 ) ) ( not ( = ?auto_4845 ?auto_4844 ) ) ( AIRCRAFT-AT ?auto_4847 ?auto_4846 ) ( FUEL-LEVEL ?auto_4847 ?auto_4850 ) ( not ( = ?auto_4843 ?auto_4846 ) ) ( not ( = ?auto_4849 ?auto_4846 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4848 ?auto_4845 ?auto_4843 )
      ( FLY-2PPL-VERIFY ?auto_4844 ?auto_4845 ?auto_4843 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4853 - PERSON
      ?auto_4854 - PERSON
      ?auto_4852 - CITY
    )
    :vars
    (
      ?auto_4860 - FLEVEL
      ?auto_4859 - FLEVEL
      ?auto_4858 - CITY
      ?auto_4855 - PERSON
      ?auto_4857 - AIRCRAFT
      ?auto_4856 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4860 ?auto_4859 ) ( not ( = ?auto_4852 ?auto_4858 ) ) ( not ( = ?auto_4859 ?auto_4860 ) ) ( PERSON-AT ?auto_4854 ?auto_4852 ) ( not ( = ?auto_4854 ?auto_4853 ) ) ( PERSON-AT ?auto_4853 ?auto_4858 ) ( IN ?auto_4855 ?auto_4857 ) ( not ( = ?auto_4854 ?auto_4855 ) ) ( not ( = ?auto_4853 ?auto_4855 ) ) ( AIRCRAFT-AT ?auto_4857 ?auto_4856 ) ( FUEL-LEVEL ?auto_4857 ?auto_4859 ) ( not ( = ?auto_4852 ?auto_4856 ) ) ( not ( = ?auto_4858 ?auto_4856 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4854 ?auto_4853 ?auto_4852 )
      ( FLY-2PPL-VERIFY ?auto_4853 ?auto_4854 ?auto_4852 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_4862 - PERSON
      ?auto_4863 - PERSON
      ?auto_4861 - CITY
    )
    :vars
    (
      ?auto_4869 - FLEVEL
      ?auto_4868 - FLEVEL
      ?auto_4867 - CITY
      ?auto_4866 - PERSON
      ?auto_4865 - AIRCRAFT
      ?auto_4864 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4869 ?auto_4868 ) ( not ( = ?auto_4861 ?auto_4867 ) ) ( not ( = ?auto_4868 ?auto_4869 ) ) ( PERSON-AT ?auto_4866 ?auto_4861 ) ( not ( = ?auto_4866 ?auto_4862 ) ) ( PERSON-AT ?auto_4862 ?auto_4867 ) ( IN ?auto_4863 ?auto_4865 ) ( not ( = ?auto_4866 ?auto_4863 ) ) ( not ( = ?auto_4862 ?auto_4863 ) ) ( AIRCRAFT-AT ?auto_4865 ?auto_4864 ) ( FUEL-LEVEL ?auto_4865 ?auto_4868 ) ( not ( = ?auto_4861 ?auto_4864 ) ) ( not ( = ?auto_4867 ?auto_4864 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4866 ?auto_4862 ?auto_4861 )
      ( FLY-2PPL-VERIFY ?auto_4862 ?auto_4863 ?auto_4861 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4881 - PERSON
      ?auto_4882 - PERSON
      ?auto_4883 - PERSON
      ?auto_4880 - CITY
    )
    :vars
    (
      ?auto_4889 - FLEVEL
      ?auto_4888 - FLEVEL
      ?auto_4887 - CITY
      ?auto_4884 - PERSON
      ?auto_4886 - AIRCRAFT
      ?auto_4885 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4889 ?auto_4888 ) ( not ( = ?auto_4880 ?auto_4887 ) ) ( not ( = ?auto_4888 ?auto_4889 ) ) ( PERSON-AT ?auto_4882 ?auto_4880 ) ( not ( = ?auto_4882 ?auto_4883 ) ) ( PERSON-AT ?auto_4883 ?auto_4887 ) ( IN ?auto_4884 ?auto_4886 ) ( not ( = ?auto_4882 ?auto_4884 ) ) ( not ( = ?auto_4883 ?auto_4884 ) ) ( AIRCRAFT-AT ?auto_4886 ?auto_4885 ) ( FUEL-LEVEL ?auto_4886 ?auto_4888 ) ( not ( = ?auto_4880 ?auto_4885 ) ) ( not ( = ?auto_4887 ?auto_4885 ) ) ( PERSON-AT ?auto_4881 ?auto_4880 ) ( not ( = ?auto_4881 ?auto_4882 ) ) ( not ( = ?auto_4881 ?auto_4883 ) ) ( not ( = ?auto_4881 ?auto_4884 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4882 ?auto_4883 ?auto_4880 )
      ( FLY-3PPL-VERIFY ?auto_4881 ?auto_4882 ?auto_4883 ?auto_4880 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4891 - PERSON
      ?auto_4892 - PERSON
      ?auto_4893 - PERSON
      ?auto_4890 - CITY
    )
    :vars
    (
      ?auto_4898 - FLEVEL
      ?auto_4897 - FLEVEL
      ?auto_4896 - CITY
      ?auto_4895 - AIRCRAFT
      ?auto_4894 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4898 ?auto_4897 ) ( not ( = ?auto_4890 ?auto_4896 ) ) ( not ( = ?auto_4897 ?auto_4898 ) ) ( PERSON-AT ?auto_4891 ?auto_4890 ) ( not ( = ?auto_4891 ?auto_4893 ) ) ( PERSON-AT ?auto_4893 ?auto_4896 ) ( IN ?auto_4892 ?auto_4895 ) ( not ( = ?auto_4891 ?auto_4892 ) ) ( not ( = ?auto_4893 ?auto_4892 ) ) ( AIRCRAFT-AT ?auto_4895 ?auto_4894 ) ( FUEL-LEVEL ?auto_4895 ?auto_4897 ) ( not ( = ?auto_4890 ?auto_4894 ) ) ( not ( = ?auto_4896 ?auto_4894 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4891 ?auto_4893 ?auto_4890 )
      ( FLY-3PPL-VERIFY ?auto_4891 ?auto_4892 ?auto_4893 ?auto_4890 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4900 - PERSON
      ?auto_4901 - PERSON
      ?auto_4902 - PERSON
      ?auto_4899 - CITY
    )
    :vars
    (
      ?auto_4908 - FLEVEL
      ?auto_4907 - FLEVEL
      ?auto_4906 - CITY
      ?auto_4903 - PERSON
      ?auto_4905 - AIRCRAFT
      ?auto_4904 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4908 ?auto_4907 ) ( not ( = ?auto_4899 ?auto_4906 ) ) ( not ( = ?auto_4907 ?auto_4908 ) ) ( PERSON-AT ?auto_4902 ?auto_4899 ) ( not ( = ?auto_4902 ?auto_4901 ) ) ( PERSON-AT ?auto_4901 ?auto_4906 ) ( IN ?auto_4903 ?auto_4905 ) ( not ( = ?auto_4902 ?auto_4903 ) ) ( not ( = ?auto_4901 ?auto_4903 ) ) ( AIRCRAFT-AT ?auto_4905 ?auto_4904 ) ( FUEL-LEVEL ?auto_4905 ?auto_4907 ) ( not ( = ?auto_4899 ?auto_4904 ) ) ( not ( = ?auto_4906 ?auto_4904 ) ) ( PERSON-AT ?auto_4900 ?auto_4899 ) ( not ( = ?auto_4900 ?auto_4901 ) ) ( not ( = ?auto_4900 ?auto_4902 ) ) ( not ( = ?auto_4900 ?auto_4903 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4902 ?auto_4901 ?auto_4899 )
      ( FLY-3PPL-VERIFY ?auto_4900 ?auto_4901 ?auto_4902 ?auto_4899 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4910 - PERSON
      ?auto_4911 - PERSON
      ?auto_4912 - PERSON
      ?auto_4909 - CITY
    )
    :vars
    (
      ?auto_4917 - FLEVEL
      ?auto_4916 - FLEVEL
      ?auto_4915 - CITY
      ?auto_4914 - AIRCRAFT
      ?auto_4913 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4917 ?auto_4916 ) ( not ( = ?auto_4909 ?auto_4915 ) ) ( not ( = ?auto_4916 ?auto_4917 ) ) ( PERSON-AT ?auto_4910 ?auto_4909 ) ( not ( = ?auto_4910 ?auto_4911 ) ) ( PERSON-AT ?auto_4911 ?auto_4915 ) ( IN ?auto_4912 ?auto_4914 ) ( not ( = ?auto_4910 ?auto_4912 ) ) ( not ( = ?auto_4911 ?auto_4912 ) ) ( AIRCRAFT-AT ?auto_4914 ?auto_4913 ) ( FUEL-LEVEL ?auto_4914 ?auto_4916 ) ( not ( = ?auto_4909 ?auto_4913 ) ) ( not ( = ?auto_4915 ?auto_4913 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4910 ?auto_4911 ?auto_4909 )
      ( FLY-3PPL-VERIFY ?auto_4910 ?auto_4911 ?auto_4912 ?auto_4909 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4929 - PERSON
      ?auto_4930 - PERSON
      ?auto_4931 - PERSON
      ?auto_4928 - CITY
    )
    :vars
    (
      ?auto_4936 - FLEVEL
      ?auto_4935 - FLEVEL
      ?auto_4934 - CITY
      ?auto_4933 - AIRCRAFT
      ?auto_4932 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4936 ?auto_4935 ) ( not ( = ?auto_4928 ?auto_4934 ) ) ( not ( = ?auto_4935 ?auto_4936 ) ) ( PERSON-AT ?auto_4930 ?auto_4928 ) ( not ( = ?auto_4930 ?auto_4931 ) ) ( PERSON-AT ?auto_4931 ?auto_4934 ) ( IN ?auto_4929 ?auto_4933 ) ( not ( = ?auto_4930 ?auto_4929 ) ) ( not ( = ?auto_4931 ?auto_4929 ) ) ( AIRCRAFT-AT ?auto_4933 ?auto_4932 ) ( FUEL-LEVEL ?auto_4933 ?auto_4935 ) ( not ( = ?auto_4928 ?auto_4932 ) ) ( not ( = ?auto_4934 ?auto_4932 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4930 ?auto_4931 ?auto_4928 )
      ( FLY-3PPL-VERIFY ?auto_4929 ?auto_4930 ?auto_4931 ?auto_4928 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4948 - PERSON
      ?auto_4949 - PERSON
      ?auto_4950 - PERSON
      ?auto_4947 - CITY
    )
    :vars
    (
      ?auto_4955 - FLEVEL
      ?auto_4954 - FLEVEL
      ?auto_4953 - CITY
      ?auto_4952 - AIRCRAFT
      ?auto_4951 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4955 ?auto_4954 ) ( not ( = ?auto_4947 ?auto_4953 ) ) ( not ( = ?auto_4954 ?auto_4955 ) ) ( PERSON-AT ?auto_4950 ?auto_4947 ) ( not ( = ?auto_4950 ?auto_4949 ) ) ( PERSON-AT ?auto_4949 ?auto_4953 ) ( IN ?auto_4948 ?auto_4952 ) ( not ( = ?auto_4950 ?auto_4948 ) ) ( not ( = ?auto_4949 ?auto_4948 ) ) ( AIRCRAFT-AT ?auto_4952 ?auto_4951 ) ( FUEL-LEVEL ?auto_4952 ?auto_4954 ) ( not ( = ?auto_4947 ?auto_4951 ) ) ( not ( = ?auto_4953 ?auto_4951 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4950 ?auto_4949 ?auto_4947 )
      ( FLY-3PPL-VERIFY ?auto_4948 ?auto_4949 ?auto_4950 ?auto_4947 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4977 - PERSON
      ?auto_4978 - PERSON
      ?auto_4979 - PERSON
      ?auto_4976 - CITY
    )
    :vars
    (
      ?auto_4985 - FLEVEL
      ?auto_4984 - FLEVEL
      ?auto_4983 - CITY
      ?auto_4980 - PERSON
      ?auto_4982 - AIRCRAFT
      ?auto_4981 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4985 ?auto_4984 ) ( not ( = ?auto_4976 ?auto_4983 ) ) ( not ( = ?auto_4984 ?auto_4985 ) ) ( PERSON-AT ?auto_4979 ?auto_4976 ) ( not ( = ?auto_4979 ?auto_4977 ) ) ( PERSON-AT ?auto_4977 ?auto_4983 ) ( IN ?auto_4980 ?auto_4982 ) ( not ( = ?auto_4979 ?auto_4980 ) ) ( not ( = ?auto_4977 ?auto_4980 ) ) ( AIRCRAFT-AT ?auto_4982 ?auto_4981 ) ( FUEL-LEVEL ?auto_4982 ?auto_4984 ) ( not ( = ?auto_4976 ?auto_4981 ) ) ( not ( = ?auto_4983 ?auto_4981 ) ) ( PERSON-AT ?auto_4978 ?auto_4976 ) ( not ( = ?auto_4977 ?auto_4978 ) ) ( not ( = ?auto_4978 ?auto_4979 ) ) ( not ( = ?auto_4978 ?auto_4980 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4979 ?auto_4977 ?auto_4976 )
      ( FLY-3PPL-VERIFY ?auto_4977 ?auto_4978 ?auto_4979 ?auto_4976 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_4987 - PERSON
      ?auto_4988 - PERSON
      ?auto_4989 - PERSON
      ?auto_4986 - CITY
    )
    :vars
    (
      ?auto_4994 - FLEVEL
      ?auto_4993 - FLEVEL
      ?auto_4992 - CITY
      ?auto_4991 - AIRCRAFT
      ?auto_4990 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_4994 ?auto_4993 ) ( not ( = ?auto_4986 ?auto_4992 ) ) ( not ( = ?auto_4993 ?auto_4994 ) ) ( PERSON-AT ?auto_4988 ?auto_4986 ) ( not ( = ?auto_4988 ?auto_4987 ) ) ( PERSON-AT ?auto_4987 ?auto_4992 ) ( IN ?auto_4989 ?auto_4991 ) ( not ( = ?auto_4988 ?auto_4989 ) ) ( not ( = ?auto_4987 ?auto_4989 ) ) ( AIRCRAFT-AT ?auto_4991 ?auto_4990 ) ( FUEL-LEVEL ?auto_4991 ?auto_4993 ) ( not ( = ?auto_4986 ?auto_4990 ) ) ( not ( = ?auto_4992 ?auto_4990 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_4988 ?auto_4987 ?auto_4986 )
      ( FLY-3PPL-VERIFY ?auto_4987 ?auto_4988 ?auto_4989 ?auto_4986 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5006 - PERSON
      ?auto_5007 - PERSON
      ?auto_5008 - PERSON
      ?auto_5005 - CITY
    )
    :vars
    (
      ?auto_5013 - FLEVEL
      ?auto_5012 - FLEVEL
      ?auto_5011 - CITY
      ?auto_5010 - AIRCRAFT
      ?auto_5009 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5013 ?auto_5012 ) ( not ( = ?auto_5005 ?auto_5011 ) ) ( not ( = ?auto_5012 ?auto_5013 ) ) ( PERSON-AT ?auto_5008 ?auto_5005 ) ( not ( = ?auto_5008 ?auto_5006 ) ) ( PERSON-AT ?auto_5006 ?auto_5011 ) ( IN ?auto_5007 ?auto_5010 ) ( not ( = ?auto_5008 ?auto_5007 ) ) ( not ( = ?auto_5006 ?auto_5007 ) ) ( AIRCRAFT-AT ?auto_5010 ?auto_5009 ) ( FUEL-LEVEL ?auto_5010 ?auto_5012 ) ( not ( = ?auto_5005 ?auto_5009 ) ) ( not ( = ?auto_5011 ?auto_5009 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5008 ?auto_5006 ?auto_5005 )
      ( FLY-3PPL-VERIFY ?auto_5006 ?auto_5007 ?auto_5008 ?auto_5005 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_5066 - PERSON
      ?auto_5065 - CITY
    )
    :vars
    (
      ?auto_5073 - FLEVEL
      ?auto_5072 - FLEVEL
      ?auto_5071 - CITY
      ?auto_5070 - PERSON
      ?auto_5067 - PERSON
      ?auto_5069 - AIRCRAFT
      ?auto_5068 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5073 ?auto_5072 ) ( not ( = ?auto_5065 ?auto_5071 ) ) ( not ( = ?auto_5072 ?auto_5073 ) ) ( PERSON-AT ?auto_5070 ?auto_5065 ) ( not ( = ?auto_5070 ?auto_5066 ) ) ( PERSON-AT ?auto_5066 ?auto_5071 ) ( not ( = ?auto_5070 ?auto_5067 ) ) ( not ( = ?auto_5066 ?auto_5067 ) ) ( AIRCRAFT-AT ?auto_5069 ?auto_5068 ) ( FUEL-LEVEL ?auto_5069 ?auto_5072 ) ( not ( = ?auto_5065 ?auto_5068 ) ) ( not ( = ?auto_5071 ?auto_5068 ) ) ( PERSON-AT ?auto_5067 ?auto_5068 ) )
    :subtasks
    ( ( !BOARD ?auto_5067 ?auto_5069 ?auto_5068 )
      ( FLY-2PPL ?auto_5070 ?auto_5066 ?auto_5065 )
      ( FLY-1PPL-VERIFY ?auto_5066 ?auto_5065 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_5075 - PERSON
      ?auto_5076 - PERSON
      ?auto_5074 - CITY
    )
    :vars
    (
      ?auto_5078 - FLEVEL
      ?auto_5079 - FLEVEL
      ?auto_5077 - CITY
      ?auto_5081 - PERSON
      ?auto_5080 - AIRCRAFT
      ?auto_5082 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5078 ?auto_5079 ) ( not ( = ?auto_5074 ?auto_5077 ) ) ( not ( = ?auto_5079 ?auto_5078 ) ) ( PERSON-AT ?auto_5075 ?auto_5074 ) ( not ( = ?auto_5075 ?auto_5076 ) ) ( PERSON-AT ?auto_5076 ?auto_5077 ) ( not ( = ?auto_5075 ?auto_5081 ) ) ( not ( = ?auto_5076 ?auto_5081 ) ) ( AIRCRAFT-AT ?auto_5080 ?auto_5082 ) ( FUEL-LEVEL ?auto_5080 ?auto_5079 ) ( not ( = ?auto_5074 ?auto_5082 ) ) ( not ( = ?auto_5077 ?auto_5082 ) ) ( PERSON-AT ?auto_5081 ?auto_5082 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_5076 ?auto_5074 )
      ( FLY-2PPL-VERIFY ?auto_5075 ?auto_5076 ?auto_5074 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_5084 - PERSON
      ?auto_5085 - PERSON
      ?auto_5083 - CITY
    )
    :vars
    (
      ?auto_5090 - FLEVEL
      ?auto_5089 - FLEVEL
      ?auto_5086 - CITY
      ?auto_5091 - PERSON
      ?auto_5087 - AIRCRAFT
      ?auto_5088 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5090 ?auto_5089 ) ( not ( = ?auto_5083 ?auto_5086 ) ) ( not ( = ?auto_5089 ?auto_5090 ) ) ( PERSON-AT ?auto_5091 ?auto_5083 ) ( not ( = ?auto_5091 ?auto_5085 ) ) ( PERSON-AT ?auto_5085 ?auto_5086 ) ( not ( = ?auto_5091 ?auto_5084 ) ) ( not ( = ?auto_5085 ?auto_5084 ) ) ( AIRCRAFT-AT ?auto_5087 ?auto_5088 ) ( FUEL-LEVEL ?auto_5087 ?auto_5089 ) ( not ( = ?auto_5083 ?auto_5088 ) ) ( not ( = ?auto_5086 ?auto_5088 ) ) ( PERSON-AT ?auto_5084 ?auto_5088 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5091 ?auto_5085 ?auto_5083 )
      ( FLY-2PPL-VERIFY ?auto_5084 ?auto_5085 ?auto_5083 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_5093 - PERSON
      ?auto_5094 - PERSON
      ?auto_5092 - CITY
    )
    :vars
    (
      ?auto_5100 - FLEVEL
      ?auto_5099 - FLEVEL
      ?auto_5095 - CITY
      ?auto_5097 - PERSON
      ?auto_5096 - AIRCRAFT
      ?auto_5098 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5100 ?auto_5099 ) ( not ( = ?auto_5092 ?auto_5095 ) ) ( not ( = ?auto_5099 ?auto_5100 ) ) ( PERSON-AT ?auto_5094 ?auto_5092 ) ( not ( = ?auto_5094 ?auto_5093 ) ) ( PERSON-AT ?auto_5093 ?auto_5095 ) ( not ( = ?auto_5094 ?auto_5097 ) ) ( not ( = ?auto_5093 ?auto_5097 ) ) ( AIRCRAFT-AT ?auto_5096 ?auto_5098 ) ( FUEL-LEVEL ?auto_5096 ?auto_5099 ) ( not ( = ?auto_5092 ?auto_5098 ) ) ( not ( = ?auto_5095 ?auto_5098 ) ) ( PERSON-AT ?auto_5097 ?auto_5098 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5094 ?auto_5093 ?auto_5092 )
      ( FLY-2PPL-VERIFY ?auto_5093 ?auto_5094 ?auto_5092 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_5102 - PERSON
      ?auto_5103 - PERSON
      ?auto_5101 - CITY
    )
    :vars
    (
      ?auto_5108 - FLEVEL
      ?auto_5107 - FLEVEL
      ?auto_5104 - CITY
      ?auto_5109 - PERSON
      ?auto_5105 - AIRCRAFT
      ?auto_5106 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5108 ?auto_5107 ) ( not ( = ?auto_5101 ?auto_5104 ) ) ( not ( = ?auto_5107 ?auto_5108 ) ) ( PERSON-AT ?auto_5109 ?auto_5101 ) ( not ( = ?auto_5109 ?auto_5102 ) ) ( PERSON-AT ?auto_5102 ?auto_5104 ) ( not ( = ?auto_5109 ?auto_5103 ) ) ( not ( = ?auto_5102 ?auto_5103 ) ) ( AIRCRAFT-AT ?auto_5105 ?auto_5106 ) ( FUEL-LEVEL ?auto_5105 ?auto_5107 ) ( not ( = ?auto_5101 ?auto_5106 ) ) ( not ( = ?auto_5104 ?auto_5106 ) ) ( PERSON-AT ?auto_5103 ?auto_5106 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5109 ?auto_5102 ?auto_5101 )
      ( FLY-2PPL-VERIFY ?auto_5102 ?auto_5103 ?auto_5101 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5121 - PERSON
      ?auto_5122 - PERSON
      ?auto_5123 - PERSON
      ?auto_5120 - CITY
    )
    :vars
    (
      ?auto_5129 - FLEVEL
      ?auto_5128 - FLEVEL
      ?auto_5124 - CITY
      ?auto_5126 - PERSON
      ?auto_5125 - AIRCRAFT
      ?auto_5127 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5129 ?auto_5128 ) ( not ( = ?auto_5120 ?auto_5124 ) ) ( not ( = ?auto_5128 ?auto_5129 ) ) ( PERSON-AT ?auto_5122 ?auto_5120 ) ( not ( = ?auto_5122 ?auto_5123 ) ) ( PERSON-AT ?auto_5123 ?auto_5124 ) ( not ( = ?auto_5122 ?auto_5126 ) ) ( not ( = ?auto_5123 ?auto_5126 ) ) ( AIRCRAFT-AT ?auto_5125 ?auto_5127 ) ( FUEL-LEVEL ?auto_5125 ?auto_5128 ) ( not ( = ?auto_5120 ?auto_5127 ) ) ( not ( = ?auto_5124 ?auto_5127 ) ) ( PERSON-AT ?auto_5126 ?auto_5127 ) ( PERSON-AT ?auto_5121 ?auto_5120 ) ( not ( = ?auto_5121 ?auto_5122 ) ) ( not ( = ?auto_5121 ?auto_5123 ) ) ( not ( = ?auto_5121 ?auto_5126 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5122 ?auto_5123 ?auto_5120 )
      ( FLY-3PPL-VERIFY ?auto_5121 ?auto_5122 ?auto_5123 ?auto_5120 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5131 - PERSON
      ?auto_5132 - PERSON
      ?auto_5133 - PERSON
      ?auto_5130 - CITY
    )
    :vars
    (
      ?auto_5138 - FLEVEL
      ?auto_5137 - FLEVEL
      ?auto_5134 - CITY
      ?auto_5135 - AIRCRAFT
      ?auto_5136 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5138 ?auto_5137 ) ( not ( = ?auto_5130 ?auto_5134 ) ) ( not ( = ?auto_5137 ?auto_5138 ) ) ( PERSON-AT ?auto_5131 ?auto_5130 ) ( not ( = ?auto_5131 ?auto_5133 ) ) ( PERSON-AT ?auto_5133 ?auto_5134 ) ( not ( = ?auto_5131 ?auto_5132 ) ) ( not ( = ?auto_5133 ?auto_5132 ) ) ( AIRCRAFT-AT ?auto_5135 ?auto_5136 ) ( FUEL-LEVEL ?auto_5135 ?auto_5137 ) ( not ( = ?auto_5130 ?auto_5136 ) ) ( not ( = ?auto_5134 ?auto_5136 ) ) ( PERSON-AT ?auto_5132 ?auto_5136 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5131 ?auto_5133 ?auto_5130 )
      ( FLY-3PPL-VERIFY ?auto_5131 ?auto_5132 ?auto_5133 ?auto_5130 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5140 - PERSON
      ?auto_5141 - PERSON
      ?auto_5142 - PERSON
      ?auto_5139 - CITY
    )
    :vars
    (
      ?auto_5148 - FLEVEL
      ?auto_5147 - FLEVEL
      ?auto_5143 - CITY
      ?auto_5145 - PERSON
      ?auto_5144 - AIRCRAFT
      ?auto_5146 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5148 ?auto_5147 ) ( not ( = ?auto_5139 ?auto_5143 ) ) ( not ( = ?auto_5147 ?auto_5148 ) ) ( PERSON-AT ?auto_5142 ?auto_5139 ) ( not ( = ?auto_5142 ?auto_5141 ) ) ( PERSON-AT ?auto_5141 ?auto_5143 ) ( not ( = ?auto_5142 ?auto_5145 ) ) ( not ( = ?auto_5141 ?auto_5145 ) ) ( AIRCRAFT-AT ?auto_5144 ?auto_5146 ) ( FUEL-LEVEL ?auto_5144 ?auto_5147 ) ( not ( = ?auto_5139 ?auto_5146 ) ) ( not ( = ?auto_5143 ?auto_5146 ) ) ( PERSON-AT ?auto_5145 ?auto_5146 ) ( PERSON-AT ?auto_5140 ?auto_5139 ) ( not ( = ?auto_5140 ?auto_5141 ) ) ( not ( = ?auto_5140 ?auto_5142 ) ) ( not ( = ?auto_5140 ?auto_5145 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5142 ?auto_5141 ?auto_5139 )
      ( FLY-3PPL-VERIFY ?auto_5140 ?auto_5141 ?auto_5142 ?auto_5139 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5150 - PERSON
      ?auto_5151 - PERSON
      ?auto_5152 - PERSON
      ?auto_5149 - CITY
    )
    :vars
    (
      ?auto_5157 - FLEVEL
      ?auto_5156 - FLEVEL
      ?auto_5153 - CITY
      ?auto_5154 - AIRCRAFT
      ?auto_5155 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5157 ?auto_5156 ) ( not ( = ?auto_5149 ?auto_5153 ) ) ( not ( = ?auto_5156 ?auto_5157 ) ) ( PERSON-AT ?auto_5150 ?auto_5149 ) ( not ( = ?auto_5150 ?auto_5151 ) ) ( PERSON-AT ?auto_5151 ?auto_5153 ) ( not ( = ?auto_5150 ?auto_5152 ) ) ( not ( = ?auto_5151 ?auto_5152 ) ) ( AIRCRAFT-AT ?auto_5154 ?auto_5155 ) ( FUEL-LEVEL ?auto_5154 ?auto_5156 ) ( not ( = ?auto_5149 ?auto_5155 ) ) ( not ( = ?auto_5153 ?auto_5155 ) ) ( PERSON-AT ?auto_5152 ?auto_5155 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5150 ?auto_5151 ?auto_5149 )
      ( FLY-3PPL-VERIFY ?auto_5150 ?auto_5151 ?auto_5152 ?auto_5149 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5169 - PERSON
      ?auto_5170 - PERSON
      ?auto_5171 - PERSON
      ?auto_5168 - CITY
    )
    :vars
    (
      ?auto_5176 - FLEVEL
      ?auto_5175 - FLEVEL
      ?auto_5172 - CITY
      ?auto_5173 - AIRCRAFT
      ?auto_5174 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5176 ?auto_5175 ) ( not ( = ?auto_5168 ?auto_5172 ) ) ( not ( = ?auto_5175 ?auto_5176 ) ) ( PERSON-AT ?auto_5170 ?auto_5168 ) ( not ( = ?auto_5170 ?auto_5171 ) ) ( PERSON-AT ?auto_5171 ?auto_5172 ) ( not ( = ?auto_5170 ?auto_5169 ) ) ( not ( = ?auto_5171 ?auto_5169 ) ) ( AIRCRAFT-AT ?auto_5173 ?auto_5174 ) ( FUEL-LEVEL ?auto_5173 ?auto_5175 ) ( not ( = ?auto_5168 ?auto_5174 ) ) ( not ( = ?auto_5172 ?auto_5174 ) ) ( PERSON-AT ?auto_5169 ?auto_5174 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5170 ?auto_5171 ?auto_5168 )
      ( FLY-3PPL-VERIFY ?auto_5169 ?auto_5170 ?auto_5171 ?auto_5168 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5188 - PERSON
      ?auto_5189 - PERSON
      ?auto_5190 - PERSON
      ?auto_5187 - CITY
    )
    :vars
    (
      ?auto_5195 - FLEVEL
      ?auto_5194 - FLEVEL
      ?auto_5191 - CITY
      ?auto_5192 - AIRCRAFT
      ?auto_5193 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5195 ?auto_5194 ) ( not ( = ?auto_5187 ?auto_5191 ) ) ( not ( = ?auto_5194 ?auto_5195 ) ) ( PERSON-AT ?auto_5190 ?auto_5187 ) ( not ( = ?auto_5190 ?auto_5189 ) ) ( PERSON-AT ?auto_5189 ?auto_5191 ) ( not ( = ?auto_5190 ?auto_5188 ) ) ( not ( = ?auto_5189 ?auto_5188 ) ) ( AIRCRAFT-AT ?auto_5192 ?auto_5193 ) ( FUEL-LEVEL ?auto_5192 ?auto_5194 ) ( not ( = ?auto_5187 ?auto_5193 ) ) ( not ( = ?auto_5191 ?auto_5193 ) ) ( PERSON-AT ?auto_5188 ?auto_5193 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5190 ?auto_5189 ?auto_5187 )
      ( FLY-3PPL-VERIFY ?auto_5188 ?auto_5189 ?auto_5190 ?auto_5187 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5217 - PERSON
      ?auto_5218 - PERSON
      ?auto_5219 - PERSON
      ?auto_5216 - CITY
    )
    :vars
    (
      ?auto_5225 - FLEVEL
      ?auto_5224 - FLEVEL
      ?auto_5220 - CITY
      ?auto_5222 - PERSON
      ?auto_5221 - AIRCRAFT
      ?auto_5223 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5225 ?auto_5224 ) ( not ( = ?auto_5216 ?auto_5220 ) ) ( not ( = ?auto_5224 ?auto_5225 ) ) ( PERSON-AT ?auto_5219 ?auto_5216 ) ( not ( = ?auto_5219 ?auto_5217 ) ) ( PERSON-AT ?auto_5217 ?auto_5220 ) ( not ( = ?auto_5219 ?auto_5222 ) ) ( not ( = ?auto_5217 ?auto_5222 ) ) ( AIRCRAFT-AT ?auto_5221 ?auto_5223 ) ( FUEL-LEVEL ?auto_5221 ?auto_5224 ) ( not ( = ?auto_5216 ?auto_5223 ) ) ( not ( = ?auto_5220 ?auto_5223 ) ) ( PERSON-AT ?auto_5222 ?auto_5223 ) ( PERSON-AT ?auto_5218 ?auto_5216 ) ( not ( = ?auto_5217 ?auto_5218 ) ) ( not ( = ?auto_5218 ?auto_5219 ) ) ( not ( = ?auto_5218 ?auto_5222 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5219 ?auto_5217 ?auto_5216 )
      ( FLY-3PPL-VERIFY ?auto_5217 ?auto_5218 ?auto_5219 ?auto_5216 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5227 - PERSON
      ?auto_5228 - PERSON
      ?auto_5229 - PERSON
      ?auto_5226 - CITY
    )
    :vars
    (
      ?auto_5234 - FLEVEL
      ?auto_5233 - FLEVEL
      ?auto_5230 - CITY
      ?auto_5231 - AIRCRAFT
      ?auto_5232 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5234 ?auto_5233 ) ( not ( = ?auto_5226 ?auto_5230 ) ) ( not ( = ?auto_5233 ?auto_5234 ) ) ( PERSON-AT ?auto_5228 ?auto_5226 ) ( not ( = ?auto_5228 ?auto_5227 ) ) ( PERSON-AT ?auto_5227 ?auto_5230 ) ( not ( = ?auto_5228 ?auto_5229 ) ) ( not ( = ?auto_5227 ?auto_5229 ) ) ( AIRCRAFT-AT ?auto_5231 ?auto_5232 ) ( FUEL-LEVEL ?auto_5231 ?auto_5233 ) ( not ( = ?auto_5226 ?auto_5232 ) ) ( not ( = ?auto_5230 ?auto_5232 ) ) ( PERSON-AT ?auto_5229 ?auto_5232 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5228 ?auto_5227 ?auto_5226 )
      ( FLY-3PPL-VERIFY ?auto_5227 ?auto_5228 ?auto_5229 ?auto_5226 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5246 - PERSON
      ?auto_5247 - PERSON
      ?auto_5248 - PERSON
      ?auto_5245 - CITY
    )
    :vars
    (
      ?auto_5253 - FLEVEL
      ?auto_5252 - FLEVEL
      ?auto_5249 - CITY
      ?auto_5250 - AIRCRAFT
      ?auto_5251 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5253 ?auto_5252 ) ( not ( = ?auto_5245 ?auto_5249 ) ) ( not ( = ?auto_5252 ?auto_5253 ) ) ( PERSON-AT ?auto_5248 ?auto_5245 ) ( not ( = ?auto_5248 ?auto_5246 ) ) ( PERSON-AT ?auto_5246 ?auto_5249 ) ( not ( = ?auto_5248 ?auto_5247 ) ) ( not ( = ?auto_5246 ?auto_5247 ) ) ( AIRCRAFT-AT ?auto_5250 ?auto_5251 ) ( FUEL-LEVEL ?auto_5250 ?auto_5252 ) ( not ( = ?auto_5245 ?auto_5251 ) ) ( not ( = ?auto_5249 ?auto_5251 ) ) ( PERSON-AT ?auto_5247 ?auto_5251 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5248 ?auto_5246 ?auto_5245 )
      ( FLY-3PPL-VERIFY ?auto_5246 ?auto_5247 ?auto_5248 ?auto_5245 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_5306 - PERSON
      ?auto_5305 - CITY
    )
    :vars
    (
      ?auto_5312 - FLEVEL
      ?auto_5311 - FLEVEL
      ?auto_5307 - CITY
      ?auto_5313 - PERSON
      ?auto_5309 - PERSON
      ?auto_5308 - AIRCRAFT
      ?auto_5310 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5312 ?auto_5311 ) ( not ( = ?auto_5305 ?auto_5307 ) ) ( not ( = ?auto_5311 ?auto_5312 ) ) ( PERSON-AT ?auto_5313 ?auto_5305 ) ( not ( = ?auto_5313 ?auto_5306 ) ) ( PERSON-AT ?auto_5306 ?auto_5307 ) ( not ( = ?auto_5313 ?auto_5309 ) ) ( not ( = ?auto_5306 ?auto_5309 ) ) ( AIRCRAFT-AT ?auto_5308 ?auto_5310 ) ( not ( = ?auto_5305 ?auto_5310 ) ) ( not ( = ?auto_5307 ?auto_5310 ) ) ( PERSON-AT ?auto_5309 ?auto_5310 ) ( FUEL-LEVEL ?auto_5308 ?auto_5312 ) )
    :subtasks
    ( ( !REFUEL ?auto_5308 ?auto_5310 ?auto_5312 ?auto_5311 )
      ( FLY-2PPL ?auto_5313 ?auto_5306 ?auto_5305 )
      ( FLY-1PPL-VERIFY ?auto_5306 ?auto_5305 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_5315 - PERSON
      ?auto_5316 - PERSON
      ?auto_5314 - CITY
    )
    :vars
    (
      ?auto_5319 - FLEVEL
      ?auto_5322 - FLEVEL
      ?auto_5318 - CITY
      ?auto_5317 - PERSON
      ?auto_5320 - AIRCRAFT
      ?auto_5321 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5319 ?auto_5322 ) ( not ( = ?auto_5314 ?auto_5318 ) ) ( not ( = ?auto_5322 ?auto_5319 ) ) ( PERSON-AT ?auto_5315 ?auto_5314 ) ( not ( = ?auto_5315 ?auto_5316 ) ) ( PERSON-AT ?auto_5316 ?auto_5318 ) ( not ( = ?auto_5315 ?auto_5317 ) ) ( not ( = ?auto_5316 ?auto_5317 ) ) ( AIRCRAFT-AT ?auto_5320 ?auto_5321 ) ( not ( = ?auto_5314 ?auto_5321 ) ) ( not ( = ?auto_5318 ?auto_5321 ) ) ( PERSON-AT ?auto_5317 ?auto_5321 ) ( FUEL-LEVEL ?auto_5320 ?auto_5319 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_5316 ?auto_5314 )
      ( FLY-2PPL-VERIFY ?auto_5315 ?auto_5316 ?auto_5314 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_5324 - PERSON
      ?auto_5325 - PERSON
      ?auto_5323 - CITY
    )
    :vars
    (
      ?auto_5329 - FLEVEL
      ?auto_5330 - FLEVEL
      ?auto_5326 - CITY
      ?auto_5331 - PERSON
      ?auto_5328 - AIRCRAFT
      ?auto_5327 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5329 ?auto_5330 ) ( not ( = ?auto_5323 ?auto_5326 ) ) ( not ( = ?auto_5330 ?auto_5329 ) ) ( PERSON-AT ?auto_5331 ?auto_5323 ) ( not ( = ?auto_5331 ?auto_5325 ) ) ( PERSON-AT ?auto_5325 ?auto_5326 ) ( not ( = ?auto_5331 ?auto_5324 ) ) ( not ( = ?auto_5325 ?auto_5324 ) ) ( AIRCRAFT-AT ?auto_5328 ?auto_5327 ) ( not ( = ?auto_5323 ?auto_5327 ) ) ( not ( = ?auto_5326 ?auto_5327 ) ) ( PERSON-AT ?auto_5324 ?auto_5327 ) ( FUEL-LEVEL ?auto_5328 ?auto_5329 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5331 ?auto_5325 ?auto_5323 )
      ( FLY-2PPL-VERIFY ?auto_5324 ?auto_5325 ?auto_5323 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_5333 - PERSON
      ?auto_5334 - PERSON
      ?auto_5332 - CITY
    )
    :vars
    (
      ?auto_5339 - FLEVEL
      ?auto_5340 - FLEVEL
      ?auto_5336 - CITY
      ?auto_5335 - PERSON
      ?auto_5338 - AIRCRAFT
      ?auto_5337 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5339 ?auto_5340 ) ( not ( = ?auto_5332 ?auto_5336 ) ) ( not ( = ?auto_5340 ?auto_5339 ) ) ( PERSON-AT ?auto_5334 ?auto_5332 ) ( not ( = ?auto_5334 ?auto_5333 ) ) ( PERSON-AT ?auto_5333 ?auto_5336 ) ( not ( = ?auto_5334 ?auto_5335 ) ) ( not ( = ?auto_5333 ?auto_5335 ) ) ( AIRCRAFT-AT ?auto_5338 ?auto_5337 ) ( not ( = ?auto_5332 ?auto_5337 ) ) ( not ( = ?auto_5336 ?auto_5337 ) ) ( PERSON-AT ?auto_5335 ?auto_5337 ) ( FUEL-LEVEL ?auto_5338 ?auto_5339 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5334 ?auto_5333 ?auto_5332 )
      ( FLY-2PPL-VERIFY ?auto_5333 ?auto_5334 ?auto_5332 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_5342 - PERSON
      ?auto_5343 - PERSON
      ?auto_5341 - CITY
    )
    :vars
    (
      ?auto_5347 - FLEVEL
      ?auto_5348 - FLEVEL
      ?auto_5344 - CITY
      ?auto_5349 - PERSON
      ?auto_5346 - AIRCRAFT
      ?auto_5345 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5347 ?auto_5348 ) ( not ( = ?auto_5341 ?auto_5344 ) ) ( not ( = ?auto_5348 ?auto_5347 ) ) ( PERSON-AT ?auto_5349 ?auto_5341 ) ( not ( = ?auto_5349 ?auto_5342 ) ) ( PERSON-AT ?auto_5342 ?auto_5344 ) ( not ( = ?auto_5349 ?auto_5343 ) ) ( not ( = ?auto_5342 ?auto_5343 ) ) ( AIRCRAFT-AT ?auto_5346 ?auto_5345 ) ( not ( = ?auto_5341 ?auto_5345 ) ) ( not ( = ?auto_5344 ?auto_5345 ) ) ( PERSON-AT ?auto_5343 ?auto_5345 ) ( FUEL-LEVEL ?auto_5346 ?auto_5347 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5349 ?auto_5342 ?auto_5341 )
      ( FLY-2PPL-VERIFY ?auto_5342 ?auto_5343 ?auto_5341 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5361 - PERSON
      ?auto_5362 - PERSON
      ?auto_5363 - PERSON
      ?auto_5360 - CITY
    )
    :vars
    (
      ?auto_5368 - FLEVEL
      ?auto_5369 - FLEVEL
      ?auto_5365 - CITY
      ?auto_5364 - PERSON
      ?auto_5367 - AIRCRAFT
      ?auto_5366 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5368 ?auto_5369 ) ( not ( = ?auto_5360 ?auto_5365 ) ) ( not ( = ?auto_5369 ?auto_5368 ) ) ( PERSON-AT ?auto_5362 ?auto_5360 ) ( not ( = ?auto_5362 ?auto_5363 ) ) ( PERSON-AT ?auto_5363 ?auto_5365 ) ( not ( = ?auto_5362 ?auto_5364 ) ) ( not ( = ?auto_5363 ?auto_5364 ) ) ( AIRCRAFT-AT ?auto_5367 ?auto_5366 ) ( not ( = ?auto_5360 ?auto_5366 ) ) ( not ( = ?auto_5365 ?auto_5366 ) ) ( PERSON-AT ?auto_5364 ?auto_5366 ) ( FUEL-LEVEL ?auto_5367 ?auto_5368 ) ( PERSON-AT ?auto_5361 ?auto_5360 ) ( not ( = ?auto_5361 ?auto_5362 ) ) ( not ( = ?auto_5361 ?auto_5363 ) ) ( not ( = ?auto_5361 ?auto_5364 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5362 ?auto_5363 ?auto_5360 )
      ( FLY-3PPL-VERIFY ?auto_5361 ?auto_5362 ?auto_5363 ?auto_5360 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5371 - PERSON
      ?auto_5372 - PERSON
      ?auto_5373 - PERSON
      ?auto_5370 - CITY
    )
    :vars
    (
      ?auto_5377 - FLEVEL
      ?auto_5378 - FLEVEL
      ?auto_5374 - CITY
      ?auto_5376 - AIRCRAFT
      ?auto_5375 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5377 ?auto_5378 ) ( not ( = ?auto_5370 ?auto_5374 ) ) ( not ( = ?auto_5378 ?auto_5377 ) ) ( PERSON-AT ?auto_5371 ?auto_5370 ) ( not ( = ?auto_5371 ?auto_5373 ) ) ( PERSON-AT ?auto_5373 ?auto_5374 ) ( not ( = ?auto_5371 ?auto_5372 ) ) ( not ( = ?auto_5373 ?auto_5372 ) ) ( AIRCRAFT-AT ?auto_5376 ?auto_5375 ) ( not ( = ?auto_5370 ?auto_5375 ) ) ( not ( = ?auto_5374 ?auto_5375 ) ) ( PERSON-AT ?auto_5372 ?auto_5375 ) ( FUEL-LEVEL ?auto_5376 ?auto_5377 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5371 ?auto_5373 ?auto_5370 )
      ( FLY-3PPL-VERIFY ?auto_5371 ?auto_5372 ?auto_5373 ?auto_5370 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5380 - PERSON
      ?auto_5381 - PERSON
      ?auto_5382 - PERSON
      ?auto_5379 - CITY
    )
    :vars
    (
      ?auto_5387 - FLEVEL
      ?auto_5388 - FLEVEL
      ?auto_5384 - CITY
      ?auto_5383 - PERSON
      ?auto_5386 - AIRCRAFT
      ?auto_5385 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5387 ?auto_5388 ) ( not ( = ?auto_5379 ?auto_5384 ) ) ( not ( = ?auto_5388 ?auto_5387 ) ) ( PERSON-AT ?auto_5382 ?auto_5379 ) ( not ( = ?auto_5382 ?auto_5381 ) ) ( PERSON-AT ?auto_5381 ?auto_5384 ) ( not ( = ?auto_5382 ?auto_5383 ) ) ( not ( = ?auto_5381 ?auto_5383 ) ) ( AIRCRAFT-AT ?auto_5386 ?auto_5385 ) ( not ( = ?auto_5379 ?auto_5385 ) ) ( not ( = ?auto_5384 ?auto_5385 ) ) ( PERSON-AT ?auto_5383 ?auto_5385 ) ( FUEL-LEVEL ?auto_5386 ?auto_5387 ) ( PERSON-AT ?auto_5380 ?auto_5379 ) ( not ( = ?auto_5380 ?auto_5381 ) ) ( not ( = ?auto_5380 ?auto_5382 ) ) ( not ( = ?auto_5380 ?auto_5383 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5382 ?auto_5381 ?auto_5379 )
      ( FLY-3PPL-VERIFY ?auto_5380 ?auto_5381 ?auto_5382 ?auto_5379 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5390 - PERSON
      ?auto_5391 - PERSON
      ?auto_5392 - PERSON
      ?auto_5389 - CITY
    )
    :vars
    (
      ?auto_5396 - FLEVEL
      ?auto_5397 - FLEVEL
      ?auto_5393 - CITY
      ?auto_5395 - AIRCRAFT
      ?auto_5394 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5396 ?auto_5397 ) ( not ( = ?auto_5389 ?auto_5393 ) ) ( not ( = ?auto_5397 ?auto_5396 ) ) ( PERSON-AT ?auto_5390 ?auto_5389 ) ( not ( = ?auto_5390 ?auto_5391 ) ) ( PERSON-AT ?auto_5391 ?auto_5393 ) ( not ( = ?auto_5390 ?auto_5392 ) ) ( not ( = ?auto_5391 ?auto_5392 ) ) ( AIRCRAFT-AT ?auto_5395 ?auto_5394 ) ( not ( = ?auto_5389 ?auto_5394 ) ) ( not ( = ?auto_5393 ?auto_5394 ) ) ( PERSON-AT ?auto_5392 ?auto_5394 ) ( FUEL-LEVEL ?auto_5395 ?auto_5396 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5390 ?auto_5391 ?auto_5389 )
      ( FLY-3PPL-VERIFY ?auto_5390 ?auto_5391 ?auto_5392 ?auto_5389 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5409 - PERSON
      ?auto_5410 - PERSON
      ?auto_5411 - PERSON
      ?auto_5408 - CITY
    )
    :vars
    (
      ?auto_5415 - FLEVEL
      ?auto_5416 - FLEVEL
      ?auto_5412 - CITY
      ?auto_5414 - AIRCRAFT
      ?auto_5413 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5415 ?auto_5416 ) ( not ( = ?auto_5408 ?auto_5412 ) ) ( not ( = ?auto_5416 ?auto_5415 ) ) ( PERSON-AT ?auto_5410 ?auto_5408 ) ( not ( = ?auto_5410 ?auto_5411 ) ) ( PERSON-AT ?auto_5411 ?auto_5412 ) ( not ( = ?auto_5410 ?auto_5409 ) ) ( not ( = ?auto_5411 ?auto_5409 ) ) ( AIRCRAFT-AT ?auto_5414 ?auto_5413 ) ( not ( = ?auto_5408 ?auto_5413 ) ) ( not ( = ?auto_5412 ?auto_5413 ) ) ( PERSON-AT ?auto_5409 ?auto_5413 ) ( FUEL-LEVEL ?auto_5414 ?auto_5415 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5410 ?auto_5411 ?auto_5408 )
      ( FLY-3PPL-VERIFY ?auto_5409 ?auto_5410 ?auto_5411 ?auto_5408 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5428 - PERSON
      ?auto_5429 - PERSON
      ?auto_5430 - PERSON
      ?auto_5427 - CITY
    )
    :vars
    (
      ?auto_5434 - FLEVEL
      ?auto_5435 - FLEVEL
      ?auto_5431 - CITY
      ?auto_5433 - AIRCRAFT
      ?auto_5432 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5434 ?auto_5435 ) ( not ( = ?auto_5427 ?auto_5431 ) ) ( not ( = ?auto_5435 ?auto_5434 ) ) ( PERSON-AT ?auto_5430 ?auto_5427 ) ( not ( = ?auto_5430 ?auto_5429 ) ) ( PERSON-AT ?auto_5429 ?auto_5431 ) ( not ( = ?auto_5430 ?auto_5428 ) ) ( not ( = ?auto_5429 ?auto_5428 ) ) ( AIRCRAFT-AT ?auto_5433 ?auto_5432 ) ( not ( = ?auto_5427 ?auto_5432 ) ) ( not ( = ?auto_5431 ?auto_5432 ) ) ( PERSON-AT ?auto_5428 ?auto_5432 ) ( FUEL-LEVEL ?auto_5433 ?auto_5434 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5430 ?auto_5429 ?auto_5427 )
      ( FLY-3PPL-VERIFY ?auto_5428 ?auto_5429 ?auto_5430 ?auto_5427 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5457 - PERSON
      ?auto_5458 - PERSON
      ?auto_5459 - PERSON
      ?auto_5456 - CITY
    )
    :vars
    (
      ?auto_5464 - FLEVEL
      ?auto_5465 - FLEVEL
      ?auto_5461 - CITY
      ?auto_5460 - PERSON
      ?auto_5463 - AIRCRAFT
      ?auto_5462 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5464 ?auto_5465 ) ( not ( = ?auto_5456 ?auto_5461 ) ) ( not ( = ?auto_5465 ?auto_5464 ) ) ( PERSON-AT ?auto_5459 ?auto_5456 ) ( not ( = ?auto_5459 ?auto_5457 ) ) ( PERSON-AT ?auto_5457 ?auto_5461 ) ( not ( = ?auto_5459 ?auto_5460 ) ) ( not ( = ?auto_5457 ?auto_5460 ) ) ( AIRCRAFT-AT ?auto_5463 ?auto_5462 ) ( not ( = ?auto_5456 ?auto_5462 ) ) ( not ( = ?auto_5461 ?auto_5462 ) ) ( PERSON-AT ?auto_5460 ?auto_5462 ) ( FUEL-LEVEL ?auto_5463 ?auto_5464 ) ( PERSON-AT ?auto_5458 ?auto_5456 ) ( not ( = ?auto_5457 ?auto_5458 ) ) ( not ( = ?auto_5458 ?auto_5459 ) ) ( not ( = ?auto_5458 ?auto_5460 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5459 ?auto_5457 ?auto_5456 )
      ( FLY-3PPL-VERIFY ?auto_5457 ?auto_5458 ?auto_5459 ?auto_5456 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5467 - PERSON
      ?auto_5468 - PERSON
      ?auto_5469 - PERSON
      ?auto_5466 - CITY
    )
    :vars
    (
      ?auto_5473 - FLEVEL
      ?auto_5474 - FLEVEL
      ?auto_5470 - CITY
      ?auto_5472 - AIRCRAFT
      ?auto_5471 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5473 ?auto_5474 ) ( not ( = ?auto_5466 ?auto_5470 ) ) ( not ( = ?auto_5474 ?auto_5473 ) ) ( PERSON-AT ?auto_5468 ?auto_5466 ) ( not ( = ?auto_5468 ?auto_5467 ) ) ( PERSON-AT ?auto_5467 ?auto_5470 ) ( not ( = ?auto_5468 ?auto_5469 ) ) ( not ( = ?auto_5467 ?auto_5469 ) ) ( AIRCRAFT-AT ?auto_5472 ?auto_5471 ) ( not ( = ?auto_5466 ?auto_5471 ) ) ( not ( = ?auto_5470 ?auto_5471 ) ) ( PERSON-AT ?auto_5469 ?auto_5471 ) ( FUEL-LEVEL ?auto_5472 ?auto_5473 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5468 ?auto_5467 ?auto_5466 )
      ( FLY-3PPL-VERIFY ?auto_5467 ?auto_5468 ?auto_5469 ?auto_5466 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5486 - PERSON
      ?auto_5487 - PERSON
      ?auto_5488 - PERSON
      ?auto_5485 - CITY
    )
    :vars
    (
      ?auto_5492 - FLEVEL
      ?auto_5493 - FLEVEL
      ?auto_5489 - CITY
      ?auto_5491 - AIRCRAFT
      ?auto_5490 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_5492 ?auto_5493 ) ( not ( = ?auto_5485 ?auto_5489 ) ) ( not ( = ?auto_5493 ?auto_5492 ) ) ( PERSON-AT ?auto_5488 ?auto_5485 ) ( not ( = ?auto_5488 ?auto_5486 ) ) ( PERSON-AT ?auto_5486 ?auto_5489 ) ( not ( = ?auto_5488 ?auto_5487 ) ) ( not ( = ?auto_5486 ?auto_5487 ) ) ( AIRCRAFT-AT ?auto_5491 ?auto_5490 ) ( not ( = ?auto_5485 ?auto_5490 ) ) ( not ( = ?auto_5489 ?auto_5490 ) ) ( PERSON-AT ?auto_5487 ?auto_5490 ) ( FUEL-LEVEL ?auto_5491 ?auto_5492 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5488 ?auto_5486 ?auto_5485 )
      ( FLY-3PPL-VERIFY ?auto_5486 ?auto_5487 ?auto_5488 ?auto_5485 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_5546 - PERSON
      ?auto_5545 - CITY
    )
    :vars
    (
      ?auto_5551 - FLEVEL
      ?auto_5552 - FLEVEL
      ?auto_5548 - CITY
      ?auto_5553 - PERSON
      ?auto_5547 - PERSON
      ?auto_5549 - CITY
      ?auto_5550 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5551 ?auto_5552 ) ( not ( = ?auto_5545 ?auto_5548 ) ) ( not ( = ?auto_5552 ?auto_5551 ) ) ( PERSON-AT ?auto_5553 ?auto_5545 ) ( not ( = ?auto_5553 ?auto_5546 ) ) ( PERSON-AT ?auto_5546 ?auto_5548 ) ( not ( = ?auto_5553 ?auto_5547 ) ) ( not ( = ?auto_5546 ?auto_5547 ) ) ( not ( = ?auto_5545 ?auto_5549 ) ) ( not ( = ?auto_5548 ?auto_5549 ) ) ( PERSON-AT ?auto_5547 ?auto_5549 ) ( AIRCRAFT-AT ?auto_5550 ?auto_5545 ) ( FUEL-LEVEL ?auto_5550 ?auto_5552 ) )
    :subtasks
    ( ( !FLY ?auto_5550 ?auto_5545 ?auto_5549 ?auto_5552 ?auto_5551 )
      ( FLY-2PPL ?auto_5553 ?auto_5546 ?auto_5545 )
      ( FLY-1PPL-VERIFY ?auto_5546 ?auto_5545 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_5555 - PERSON
      ?auto_5556 - PERSON
      ?auto_5554 - CITY
    )
    :vars
    (
      ?auto_5561 - FLEVEL
      ?auto_5557 - FLEVEL
      ?auto_5560 - CITY
      ?auto_5559 - PERSON
      ?auto_5562 - CITY
      ?auto_5558 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5561 ?auto_5557 ) ( not ( = ?auto_5554 ?auto_5560 ) ) ( not ( = ?auto_5557 ?auto_5561 ) ) ( PERSON-AT ?auto_5555 ?auto_5554 ) ( not ( = ?auto_5555 ?auto_5556 ) ) ( PERSON-AT ?auto_5556 ?auto_5560 ) ( not ( = ?auto_5555 ?auto_5559 ) ) ( not ( = ?auto_5556 ?auto_5559 ) ) ( not ( = ?auto_5554 ?auto_5562 ) ) ( not ( = ?auto_5560 ?auto_5562 ) ) ( PERSON-AT ?auto_5559 ?auto_5562 ) ( AIRCRAFT-AT ?auto_5558 ?auto_5554 ) ( FUEL-LEVEL ?auto_5558 ?auto_5557 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_5556 ?auto_5554 )
      ( FLY-2PPL-VERIFY ?auto_5555 ?auto_5556 ?auto_5554 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_5564 - PERSON
      ?auto_5565 - PERSON
      ?auto_5563 - CITY
    )
    :vars
    (
      ?auto_5570 - FLEVEL
      ?auto_5568 - FLEVEL
      ?auto_5566 - CITY
      ?auto_5571 - PERSON
      ?auto_5569 - CITY
      ?auto_5567 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5570 ?auto_5568 ) ( not ( = ?auto_5563 ?auto_5566 ) ) ( not ( = ?auto_5568 ?auto_5570 ) ) ( PERSON-AT ?auto_5571 ?auto_5563 ) ( not ( = ?auto_5571 ?auto_5565 ) ) ( PERSON-AT ?auto_5565 ?auto_5566 ) ( not ( = ?auto_5571 ?auto_5564 ) ) ( not ( = ?auto_5565 ?auto_5564 ) ) ( not ( = ?auto_5563 ?auto_5569 ) ) ( not ( = ?auto_5566 ?auto_5569 ) ) ( PERSON-AT ?auto_5564 ?auto_5569 ) ( AIRCRAFT-AT ?auto_5567 ?auto_5563 ) ( FUEL-LEVEL ?auto_5567 ?auto_5568 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5571 ?auto_5565 ?auto_5563 )
      ( FLY-2PPL-VERIFY ?auto_5564 ?auto_5565 ?auto_5563 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_5573 - PERSON
      ?auto_5574 - PERSON
      ?auto_5572 - CITY
    )
    :vars
    (
      ?auto_5579 - FLEVEL
      ?auto_5577 - FLEVEL
      ?auto_5575 - CITY
      ?auto_5580 - PERSON
      ?auto_5578 - CITY
      ?auto_5576 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5579 ?auto_5577 ) ( not ( = ?auto_5572 ?auto_5575 ) ) ( not ( = ?auto_5577 ?auto_5579 ) ) ( PERSON-AT ?auto_5574 ?auto_5572 ) ( not ( = ?auto_5574 ?auto_5573 ) ) ( PERSON-AT ?auto_5573 ?auto_5575 ) ( not ( = ?auto_5574 ?auto_5580 ) ) ( not ( = ?auto_5573 ?auto_5580 ) ) ( not ( = ?auto_5572 ?auto_5578 ) ) ( not ( = ?auto_5575 ?auto_5578 ) ) ( PERSON-AT ?auto_5580 ?auto_5578 ) ( AIRCRAFT-AT ?auto_5576 ?auto_5572 ) ( FUEL-LEVEL ?auto_5576 ?auto_5577 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5574 ?auto_5573 ?auto_5572 )
      ( FLY-2PPL-VERIFY ?auto_5573 ?auto_5574 ?auto_5572 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_5582 - PERSON
      ?auto_5583 - PERSON
      ?auto_5581 - CITY
    )
    :vars
    (
      ?auto_5588 - FLEVEL
      ?auto_5586 - FLEVEL
      ?auto_5584 - CITY
      ?auto_5589 - PERSON
      ?auto_5587 - CITY
      ?auto_5585 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5588 ?auto_5586 ) ( not ( = ?auto_5581 ?auto_5584 ) ) ( not ( = ?auto_5586 ?auto_5588 ) ) ( PERSON-AT ?auto_5589 ?auto_5581 ) ( not ( = ?auto_5589 ?auto_5582 ) ) ( PERSON-AT ?auto_5582 ?auto_5584 ) ( not ( = ?auto_5589 ?auto_5583 ) ) ( not ( = ?auto_5582 ?auto_5583 ) ) ( not ( = ?auto_5581 ?auto_5587 ) ) ( not ( = ?auto_5584 ?auto_5587 ) ) ( PERSON-AT ?auto_5583 ?auto_5587 ) ( AIRCRAFT-AT ?auto_5585 ?auto_5581 ) ( FUEL-LEVEL ?auto_5585 ?auto_5586 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5589 ?auto_5582 ?auto_5581 )
      ( FLY-2PPL-VERIFY ?auto_5582 ?auto_5583 ?auto_5581 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5601 - PERSON
      ?auto_5602 - PERSON
      ?auto_5603 - PERSON
      ?auto_5600 - CITY
    )
    :vars
    (
      ?auto_5608 - FLEVEL
      ?auto_5606 - FLEVEL
      ?auto_5604 - CITY
      ?auto_5609 - PERSON
      ?auto_5607 - CITY
      ?auto_5605 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5608 ?auto_5606 ) ( not ( = ?auto_5600 ?auto_5604 ) ) ( not ( = ?auto_5606 ?auto_5608 ) ) ( PERSON-AT ?auto_5602 ?auto_5600 ) ( not ( = ?auto_5602 ?auto_5603 ) ) ( PERSON-AT ?auto_5603 ?auto_5604 ) ( not ( = ?auto_5602 ?auto_5609 ) ) ( not ( = ?auto_5603 ?auto_5609 ) ) ( not ( = ?auto_5600 ?auto_5607 ) ) ( not ( = ?auto_5604 ?auto_5607 ) ) ( PERSON-AT ?auto_5609 ?auto_5607 ) ( AIRCRAFT-AT ?auto_5605 ?auto_5600 ) ( FUEL-LEVEL ?auto_5605 ?auto_5606 ) ( PERSON-AT ?auto_5601 ?auto_5600 ) ( not ( = ?auto_5601 ?auto_5602 ) ) ( not ( = ?auto_5601 ?auto_5603 ) ) ( not ( = ?auto_5601 ?auto_5609 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5602 ?auto_5603 ?auto_5600 )
      ( FLY-3PPL-VERIFY ?auto_5601 ?auto_5602 ?auto_5603 ?auto_5600 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5611 - PERSON
      ?auto_5612 - PERSON
      ?auto_5613 - PERSON
      ?auto_5610 - CITY
    )
    :vars
    (
      ?auto_5618 - FLEVEL
      ?auto_5616 - FLEVEL
      ?auto_5614 - CITY
      ?auto_5617 - CITY
      ?auto_5615 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5618 ?auto_5616 ) ( not ( = ?auto_5610 ?auto_5614 ) ) ( not ( = ?auto_5616 ?auto_5618 ) ) ( PERSON-AT ?auto_5611 ?auto_5610 ) ( not ( = ?auto_5611 ?auto_5613 ) ) ( PERSON-AT ?auto_5613 ?auto_5614 ) ( not ( = ?auto_5611 ?auto_5612 ) ) ( not ( = ?auto_5613 ?auto_5612 ) ) ( not ( = ?auto_5610 ?auto_5617 ) ) ( not ( = ?auto_5614 ?auto_5617 ) ) ( PERSON-AT ?auto_5612 ?auto_5617 ) ( AIRCRAFT-AT ?auto_5615 ?auto_5610 ) ( FUEL-LEVEL ?auto_5615 ?auto_5616 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5611 ?auto_5613 ?auto_5610 )
      ( FLY-3PPL-VERIFY ?auto_5611 ?auto_5612 ?auto_5613 ?auto_5610 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5620 - PERSON
      ?auto_5621 - PERSON
      ?auto_5622 - PERSON
      ?auto_5619 - CITY
    )
    :vars
    (
      ?auto_5627 - FLEVEL
      ?auto_5625 - FLEVEL
      ?auto_5623 - CITY
      ?auto_5628 - PERSON
      ?auto_5626 - CITY
      ?auto_5624 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5627 ?auto_5625 ) ( not ( = ?auto_5619 ?auto_5623 ) ) ( not ( = ?auto_5625 ?auto_5627 ) ) ( PERSON-AT ?auto_5622 ?auto_5619 ) ( not ( = ?auto_5622 ?auto_5621 ) ) ( PERSON-AT ?auto_5621 ?auto_5623 ) ( not ( = ?auto_5622 ?auto_5628 ) ) ( not ( = ?auto_5621 ?auto_5628 ) ) ( not ( = ?auto_5619 ?auto_5626 ) ) ( not ( = ?auto_5623 ?auto_5626 ) ) ( PERSON-AT ?auto_5628 ?auto_5626 ) ( AIRCRAFT-AT ?auto_5624 ?auto_5619 ) ( FUEL-LEVEL ?auto_5624 ?auto_5625 ) ( PERSON-AT ?auto_5620 ?auto_5619 ) ( not ( = ?auto_5620 ?auto_5621 ) ) ( not ( = ?auto_5620 ?auto_5622 ) ) ( not ( = ?auto_5620 ?auto_5628 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5622 ?auto_5621 ?auto_5619 )
      ( FLY-3PPL-VERIFY ?auto_5620 ?auto_5621 ?auto_5622 ?auto_5619 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5630 - PERSON
      ?auto_5631 - PERSON
      ?auto_5632 - PERSON
      ?auto_5629 - CITY
    )
    :vars
    (
      ?auto_5637 - FLEVEL
      ?auto_5635 - FLEVEL
      ?auto_5633 - CITY
      ?auto_5636 - CITY
      ?auto_5634 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5637 ?auto_5635 ) ( not ( = ?auto_5629 ?auto_5633 ) ) ( not ( = ?auto_5635 ?auto_5637 ) ) ( PERSON-AT ?auto_5630 ?auto_5629 ) ( not ( = ?auto_5630 ?auto_5631 ) ) ( PERSON-AT ?auto_5631 ?auto_5633 ) ( not ( = ?auto_5630 ?auto_5632 ) ) ( not ( = ?auto_5631 ?auto_5632 ) ) ( not ( = ?auto_5629 ?auto_5636 ) ) ( not ( = ?auto_5633 ?auto_5636 ) ) ( PERSON-AT ?auto_5632 ?auto_5636 ) ( AIRCRAFT-AT ?auto_5634 ?auto_5629 ) ( FUEL-LEVEL ?auto_5634 ?auto_5635 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5630 ?auto_5631 ?auto_5629 )
      ( FLY-3PPL-VERIFY ?auto_5630 ?auto_5631 ?auto_5632 ?auto_5629 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5649 - PERSON
      ?auto_5650 - PERSON
      ?auto_5651 - PERSON
      ?auto_5648 - CITY
    )
    :vars
    (
      ?auto_5656 - FLEVEL
      ?auto_5654 - FLEVEL
      ?auto_5652 - CITY
      ?auto_5655 - CITY
      ?auto_5653 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5656 ?auto_5654 ) ( not ( = ?auto_5648 ?auto_5652 ) ) ( not ( = ?auto_5654 ?auto_5656 ) ) ( PERSON-AT ?auto_5650 ?auto_5648 ) ( not ( = ?auto_5650 ?auto_5651 ) ) ( PERSON-AT ?auto_5651 ?auto_5652 ) ( not ( = ?auto_5650 ?auto_5649 ) ) ( not ( = ?auto_5651 ?auto_5649 ) ) ( not ( = ?auto_5648 ?auto_5655 ) ) ( not ( = ?auto_5652 ?auto_5655 ) ) ( PERSON-AT ?auto_5649 ?auto_5655 ) ( AIRCRAFT-AT ?auto_5653 ?auto_5648 ) ( FUEL-LEVEL ?auto_5653 ?auto_5654 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5650 ?auto_5651 ?auto_5648 )
      ( FLY-3PPL-VERIFY ?auto_5649 ?auto_5650 ?auto_5651 ?auto_5648 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5668 - PERSON
      ?auto_5669 - PERSON
      ?auto_5670 - PERSON
      ?auto_5667 - CITY
    )
    :vars
    (
      ?auto_5675 - FLEVEL
      ?auto_5673 - FLEVEL
      ?auto_5671 - CITY
      ?auto_5674 - CITY
      ?auto_5672 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5675 ?auto_5673 ) ( not ( = ?auto_5667 ?auto_5671 ) ) ( not ( = ?auto_5673 ?auto_5675 ) ) ( PERSON-AT ?auto_5670 ?auto_5667 ) ( not ( = ?auto_5670 ?auto_5669 ) ) ( PERSON-AT ?auto_5669 ?auto_5671 ) ( not ( = ?auto_5670 ?auto_5668 ) ) ( not ( = ?auto_5669 ?auto_5668 ) ) ( not ( = ?auto_5667 ?auto_5674 ) ) ( not ( = ?auto_5671 ?auto_5674 ) ) ( PERSON-AT ?auto_5668 ?auto_5674 ) ( AIRCRAFT-AT ?auto_5672 ?auto_5667 ) ( FUEL-LEVEL ?auto_5672 ?auto_5673 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5670 ?auto_5669 ?auto_5667 )
      ( FLY-3PPL-VERIFY ?auto_5668 ?auto_5669 ?auto_5670 ?auto_5667 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5697 - PERSON
      ?auto_5698 - PERSON
      ?auto_5699 - PERSON
      ?auto_5696 - CITY
    )
    :vars
    (
      ?auto_5704 - FLEVEL
      ?auto_5702 - FLEVEL
      ?auto_5700 - CITY
      ?auto_5705 - PERSON
      ?auto_5703 - CITY
      ?auto_5701 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5704 ?auto_5702 ) ( not ( = ?auto_5696 ?auto_5700 ) ) ( not ( = ?auto_5702 ?auto_5704 ) ) ( PERSON-AT ?auto_5699 ?auto_5696 ) ( not ( = ?auto_5699 ?auto_5697 ) ) ( PERSON-AT ?auto_5697 ?auto_5700 ) ( not ( = ?auto_5699 ?auto_5705 ) ) ( not ( = ?auto_5697 ?auto_5705 ) ) ( not ( = ?auto_5696 ?auto_5703 ) ) ( not ( = ?auto_5700 ?auto_5703 ) ) ( PERSON-AT ?auto_5705 ?auto_5703 ) ( AIRCRAFT-AT ?auto_5701 ?auto_5696 ) ( FUEL-LEVEL ?auto_5701 ?auto_5702 ) ( PERSON-AT ?auto_5698 ?auto_5696 ) ( not ( = ?auto_5697 ?auto_5698 ) ) ( not ( = ?auto_5698 ?auto_5699 ) ) ( not ( = ?auto_5698 ?auto_5705 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5699 ?auto_5697 ?auto_5696 )
      ( FLY-3PPL-VERIFY ?auto_5697 ?auto_5698 ?auto_5699 ?auto_5696 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5707 - PERSON
      ?auto_5708 - PERSON
      ?auto_5709 - PERSON
      ?auto_5706 - CITY
    )
    :vars
    (
      ?auto_5714 - FLEVEL
      ?auto_5712 - FLEVEL
      ?auto_5710 - CITY
      ?auto_5713 - CITY
      ?auto_5711 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5714 ?auto_5712 ) ( not ( = ?auto_5706 ?auto_5710 ) ) ( not ( = ?auto_5712 ?auto_5714 ) ) ( PERSON-AT ?auto_5708 ?auto_5706 ) ( not ( = ?auto_5708 ?auto_5707 ) ) ( PERSON-AT ?auto_5707 ?auto_5710 ) ( not ( = ?auto_5708 ?auto_5709 ) ) ( not ( = ?auto_5707 ?auto_5709 ) ) ( not ( = ?auto_5706 ?auto_5713 ) ) ( not ( = ?auto_5710 ?auto_5713 ) ) ( PERSON-AT ?auto_5709 ?auto_5713 ) ( AIRCRAFT-AT ?auto_5711 ?auto_5706 ) ( FUEL-LEVEL ?auto_5711 ?auto_5712 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5708 ?auto_5707 ?auto_5706 )
      ( FLY-3PPL-VERIFY ?auto_5707 ?auto_5708 ?auto_5709 ?auto_5706 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5726 - PERSON
      ?auto_5727 - PERSON
      ?auto_5728 - PERSON
      ?auto_5725 - CITY
    )
    :vars
    (
      ?auto_5733 - FLEVEL
      ?auto_5731 - FLEVEL
      ?auto_5729 - CITY
      ?auto_5732 - CITY
      ?auto_5730 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5733 ?auto_5731 ) ( not ( = ?auto_5725 ?auto_5729 ) ) ( not ( = ?auto_5731 ?auto_5733 ) ) ( PERSON-AT ?auto_5728 ?auto_5725 ) ( not ( = ?auto_5728 ?auto_5726 ) ) ( PERSON-AT ?auto_5726 ?auto_5729 ) ( not ( = ?auto_5728 ?auto_5727 ) ) ( not ( = ?auto_5726 ?auto_5727 ) ) ( not ( = ?auto_5725 ?auto_5732 ) ) ( not ( = ?auto_5729 ?auto_5732 ) ) ( PERSON-AT ?auto_5727 ?auto_5732 ) ( AIRCRAFT-AT ?auto_5730 ?auto_5725 ) ( FUEL-LEVEL ?auto_5730 ?auto_5731 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5728 ?auto_5726 ?auto_5725 )
      ( FLY-3PPL-VERIFY ?auto_5726 ?auto_5727 ?auto_5728 ?auto_5725 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_5786 - PERSON
      ?auto_5785 - CITY
    )
    :vars
    (
      ?auto_5791 - FLEVEL
      ?auto_5789 - FLEVEL
      ?auto_5787 - CITY
      ?auto_5793 - PERSON
      ?auto_5792 - PERSON
      ?auto_5790 - CITY
      ?auto_5788 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5791 ?auto_5789 ) ( not ( = ?auto_5785 ?auto_5787 ) ) ( not ( = ?auto_5789 ?auto_5791 ) ) ( PERSON-AT ?auto_5793 ?auto_5785 ) ( not ( = ?auto_5793 ?auto_5786 ) ) ( PERSON-AT ?auto_5786 ?auto_5787 ) ( not ( = ?auto_5793 ?auto_5792 ) ) ( not ( = ?auto_5786 ?auto_5792 ) ) ( not ( = ?auto_5785 ?auto_5790 ) ) ( not ( = ?auto_5787 ?auto_5790 ) ) ( PERSON-AT ?auto_5792 ?auto_5790 ) ( AIRCRAFT-AT ?auto_5788 ?auto_5785 ) ( FUEL-LEVEL ?auto_5788 ?auto_5791 ) )
    :subtasks
    ( ( !REFUEL ?auto_5788 ?auto_5785 ?auto_5791 ?auto_5789 )
      ( FLY-2PPL ?auto_5793 ?auto_5786 ?auto_5785 )
      ( FLY-1PPL-VERIFY ?auto_5786 ?auto_5785 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_5795 - PERSON
      ?auto_5796 - PERSON
      ?auto_5794 - CITY
    )
    :vars
    (
      ?auto_5799 - FLEVEL
      ?auto_5797 - FLEVEL
      ?auto_5802 - CITY
      ?auto_5798 - PERSON
      ?auto_5801 - CITY
      ?auto_5800 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5799 ?auto_5797 ) ( not ( = ?auto_5794 ?auto_5802 ) ) ( not ( = ?auto_5797 ?auto_5799 ) ) ( PERSON-AT ?auto_5795 ?auto_5794 ) ( not ( = ?auto_5795 ?auto_5796 ) ) ( PERSON-AT ?auto_5796 ?auto_5802 ) ( not ( = ?auto_5795 ?auto_5798 ) ) ( not ( = ?auto_5796 ?auto_5798 ) ) ( not ( = ?auto_5794 ?auto_5801 ) ) ( not ( = ?auto_5802 ?auto_5801 ) ) ( PERSON-AT ?auto_5798 ?auto_5801 ) ( AIRCRAFT-AT ?auto_5800 ?auto_5794 ) ( FUEL-LEVEL ?auto_5800 ?auto_5799 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_5796 ?auto_5794 )
      ( FLY-2PPL-VERIFY ?auto_5795 ?auto_5796 ?auto_5794 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_5804 - PERSON
      ?auto_5805 - PERSON
      ?auto_5803 - CITY
    )
    :vars
    (
      ?auto_5808 - FLEVEL
      ?auto_5806 - FLEVEL
      ?auto_5809 - CITY
      ?auto_5811 - PERSON
      ?auto_5810 - CITY
      ?auto_5807 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5808 ?auto_5806 ) ( not ( = ?auto_5803 ?auto_5809 ) ) ( not ( = ?auto_5806 ?auto_5808 ) ) ( PERSON-AT ?auto_5811 ?auto_5803 ) ( not ( = ?auto_5811 ?auto_5805 ) ) ( PERSON-AT ?auto_5805 ?auto_5809 ) ( not ( = ?auto_5811 ?auto_5804 ) ) ( not ( = ?auto_5805 ?auto_5804 ) ) ( not ( = ?auto_5803 ?auto_5810 ) ) ( not ( = ?auto_5809 ?auto_5810 ) ) ( PERSON-AT ?auto_5804 ?auto_5810 ) ( AIRCRAFT-AT ?auto_5807 ?auto_5803 ) ( FUEL-LEVEL ?auto_5807 ?auto_5808 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5811 ?auto_5805 ?auto_5803 )
      ( FLY-2PPL-VERIFY ?auto_5804 ?auto_5805 ?auto_5803 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_5813 - PERSON
      ?auto_5814 - PERSON
      ?auto_5812 - CITY
    )
    :vars
    (
      ?auto_5817 - FLEVEL
      ?auto_5815 - FLEVEL
      ?auto_5819 - CITY
      ?auto_5818 - PERSON
      ?auto_5820 - CITY
      ?auto_5816 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5817 ?auto_5815 ) ( not ( = ?auto_5812 ?auto_5819 ) ) ( not ( = ?auto_5815 ?auto_5817 ) ) ( PERSON-AT ?auto_5814 ?auto_5812 ) ( not ( = ?auto_5814 ?auto_5813 ) ) ( PERSON-AT ?auto_5813 ?auto_5819 ) ( not ( = ?auto_5814 ?auto_5818 ) ) ( not ( = ?auto_5813 ?auto_5818 ) ) ( not ( = ?auto_5812 ?auto_5820 ) ) ( not ( = ?auto_5819 ?auto_5820 ) ) ( PERSON-AT ?auto_5818 ?auto_5820 ) ( AIRCRAFT-AT ?auto_5816 ?auto_5812 ) ( FUEL-LEVEL ?auto_5816 ?auto_5817 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5814 ?auto_5813 ?auto_5812 )
      ( FLY-2PPL-VERIFY ?auto_5813 ?auto_5814 ?auto_5812 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_5822 - PERSON
      ?auto_5823 - PERSON
      ?auto_5821 - CITY
    )
    :vars
    (
      ?auto_5826 - FLEVEL
      ?auto_5824 - FLEVEL
      ?auto_5827 - CITY
      ?auto_5829 - PERSON
      ?auto_5828 - CITY
      ?auto_5825 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5826 ?auto_5824 ) ( not ( = ?auto_5821 ?auto_5827 ) ) ( not ( = ?auto_5824 ?auto_5826 ) ) ( PERSON-AT ?auto_5829 ?auto_5821 ) ( not ( = ?auto_5829 ?auto_5822 ) ) ( PERSON-AT ?auto_5822 ?auto_5827 ) ( not ( = ?auto_5829 ?auto_5823 ) ) ( not ( = ?auto_5822 ?auto_5823 ) ) ( not ( = ?auto_5821 ?auto_5828 ) ) ( not ( = ?auto_5827 ?auto_5828 ) ) ( PERSON-AT ?auto_5823 ?auto_5828 ) ( AIRCRAFT-AT ?auto_5825 ?auto_5821 ) ( FUEL-LEVEL ?auto_5825 ?auto_5826 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5829 ?auto_5822 ?auto_5821 )
      ( FLY-2PPL-VERIFY ?auto_5822 ?auto_5823 ?auto_5821 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5841 - PERSON
      ?auto_5842 - PERSON
      ?auto_5843 - PERSON
      ?auto_5840 - CITY
    )
    :vars
    (
      ?auto_5846 - FLEVEL
      ?auto_5844 - FLEVEL
      ?auto_5848 - CITY
      ?auto_5847 - PERSON
      ?auto_5849 - CITY
      ?auto_5845 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5846 ?auto_5844 ) ( not ( = ?auto_5840 ?auto_5848 ) ) ( not ( = ?auto_5844 ?auto_5846 ) ) ( PERSON-AT ?auto_5842 ?auto_5840 ) ( not ( = ?auto_5842 ?auto_5843 ) ) ( PERSON-AT ?auto_5843 ?auto_5848 ) ( not ( = ?auto_5842 ?auto_5847 ) ) ( not ( = ?auto_5843 ?auto_5847 ) ) ( not ( = ?auto_5840 ?auto_5849 ) ) ( not ( = ?auto_5848 ?auto_5849 ) ) ( PERSON-AT ?auto_5847 ?auto_5849 ) ( AIRCRAFT-AT ?auto_5845 ?auto_5840 ) ( FUEL-LEVEL ?auto_5845 ?auto_5846 ) ( PERSON-AT ?auto_5841 ?auto_5840 ) ( not ( = ?auto_5841 ?auto_5842 ) ) ( not ( = ?auto_5841 ?auto_5843 ) ) ( not ( = ?auto_5841 ?auto_5847 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5842 ?auto_5843 ?auto_5840 )
      ( FLY-3PPL-VERIFY ?auto_5841 ?auto_5842 ?auto_5843 ?auto_5840 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5851 - PERSON
      ?auto_5852 - PERSON
      ?auto_5853 - PERSON
      ?auto_5850 - CITY
    )
    :vars
    (
      ?auto_5856 - FLEVEL
      ?auto_5854 - FLEVEL
      ?auto_5857 - CITY
      ?auto_5858 - CITY
      ?auto_5855 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5856 ?auto_5854 ) ( not ( = ?auto_5850 ?auto_5857 ) ) ( not ( = ?auto_5854 ?auto_5856 ) ) ( PERSON-AT ?auto_5851 ?auto_5850 ) ( not ( = ?auto_5851 ?auto_5853 ) ) ( PERSON-AT ?auto_5853 ?auto_5857 ) ( not ( = ?auto_5851 ?auto_5852 ) ) ( not ( = ?auto_5853 ?auto_5852 ) ) ( not ( = ?auto_5850 ?auto_5858 ) ) ( not ( = ?auto_5857 ?auto_5858 ) ) ( PERSON-AT ?auto_5852 ?auto_5858 ) ( AIRCRAFT-AT ?auto_5855 ?auto_5850 ) ( FUEL-LEVEL ?auto_5855 ?auto_5856 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5851 ?auto_5853 ?auto_5850 )
      ( FLY-3PPL-VERIFY ?auto_5851 ?auto_5852 ?auto_5853 ?auto_5850 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5860 - PERSON
      ?auto_5861 - PERSON
      ?auto_5862 - PERSON
      ?auto_5859 - CITY
    )
    :vars
    (
      ?auto_5865 - FLEVEL
      ?auto_5863 - FLEVEL
      ?auto_5867 - CITY
      ?auto_5866 - PERSON
      ?auto_5868 - CITY
      ?auto_5864 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5865 ?auto_5863 ) ( not ( = ?auto_5859 ?auto_5867 ) ) ( not ( = ?auto_5863 ?auto_5865 ) ) ( PERSON-AT ?auto_5862 ?auto_5859 ) ( not ( = ?auto_5862 ?auto_5861 ) ) ( PERSON-AT ?auto_5861 ?auto_5867 ) ( not ( = ?auto_5862 ?auto_5866 ) ) ( not ( = ?auto_5861 ?auto_5866 ) ) ( not ( = ?auto_5859 ?auto_5868 ) ) ( not ( = ?auto_5867 ?auto_5868 ) ) ( PERSON-AT ?auto_5866 ?auto_5868 ) ( AIRCRAFT-AT ?auto_5864 ?auto_5859 ) ( FUEL-LEVEL ?auto_5864 ?auto_5865 ) ( PERSON-AT ?auto_5860 ?auto_5859 ) ( not ( = ?auto_5860 ?auto_5861 ) ) ( not ( = ?auto_5860 ?auto_5862 ) ) ( not ( = ?auto_5860 ?auto_5866 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5862 ?auto_5861 ?auto_5859 )
      ( FLY-3PPL-VERIFY ?auto_5860 ?auto_5861 ?auto_5862 ?auto_5859 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5870 - PERSON
      ?auto_5871 - PERSON
      ?auto_5872 - PERSON
      ?auto_5869 - CITY
    )
    :vars
    (
      ?auto_5875 - FLEVEL
      ?auto_5873 - FLEVEL
      ?auto_5876 - CITY
      ?auto_5877 - CITY
      ?auto_5874 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5875 ?auto_5873 ) ( not ( = ?auto_5869 ?auto_5876 ) ) ( not ( = ?auto_5873 ?auto_5875 ) ) ( PERSON-AT ?auto_5870 ?auto_5869 ) ( not ( = ?auto_5870 ?auto_5871 ) ) ( PERSON-AT ?auto_5871 ?auto_5876 ) ( not ( = ?auto_5870 ?auto_5872 ) ) ( not ( = ?auto_5871 ?auto_5872 ) ) ( not ( = ?auto_5869 ?auto_5877 ) ) ( not ( = ?auto_5876 ?auto_5877 ) ) ( PERSON-AT ?auto_5872 ?auto_5877 ) ( AIRCRAFT-AT ?auto_5874 ?auto_5869 ) ( FUEL-LEVEL ?auto_5874 ?auto_5875 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5870 ?auto_5871 ?auto_5869 )
      ( FLY-3PPL-VERIFY ?auto_5870 ?auto_5871 ?auto_5872 ?auto_5869 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5889 - PERSON
      ?auto_5890 - PERSON
      ?auto_5891 - PERSON
      ?auto_5888 - CITY
    )
    :vars
    (
      ?auto_5894 - FLEVEL
      ?auto_5892 - FLEVEL
      ?auto_5895 - CITY
      ?auto_5896 - CITY
      ?auto_5893 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5894 ?auto_5892 ) ( not ( = ?auto_5888 ?auto_5895 ) ) ( not ( = ?auto_5892 ?auto_5894 ) ) ( PERSON-AT ?auto_5890 ?auto_5888 ) ( not ( = ?auto_5890 ?auto_5891 ) ) ( PERSON-AT ?auto_5891 ?auto_5895 ) ( not ( = ?auto_5890 ?auto_5889 ) ) ( not ( = ?auto_5891 ?auto_5889 ) ) ( not ( = ?auto_5888 ?auto_5896 ) ) ( not ( = ?auto_5895 ?auto_5896 ) ) ( PERSON-AT ?auto_5889 ?auto_5896 ) ( AIRCRAFT-AT ?auto_5893 ?auto_5888 ) ( FUEL-LEVEL ?auto_5893 ?auto_5894 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5890 ?auto_5891 ?auto_5888 )
      ( FLY-3PPL-VERIFY ?auto_5889 ?auto_5890 ?auto_5891 ?auto_5888 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5908 - PERSON
      ?auto_5909 - PERSON
      ?auto_5910 - PERSON
      ?auto_5907 - CITY
    )
    :vars
    (
      ?auto_5913 - FLEVEL
      ?auto_5911 - FLEVEL
      ?auto_5914 - CITY
      ?auto_5915 - CITY
      ?auto_5912 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5913 ?auto_5911 ) ( not ( = ?auto_5907 ?auto_5914 ) ) ( not ( = ?auto_5911 ?auto_5913 ) ) ( PERSON-AT ?auto_5910 ?auto_5907 ) ( not ( = ?auto_5910 ?auto_5909 ) ) ( PERSON-AT ?auto_5909 ?auto_5914 ) ( not ( = ?auto_5910 ?auto_5908 ) ) ( not ( = ?auto_5909 ?auto_5908 ) ) ( not ( = ?auto_5907 ?auto_5915 ) ) ( not ( = ?auto_5914 ?auto_5915 ) ) ( PERSON-AT ?auto_5908 ?auto_5915 ) ( AIRCRAFT-AT ?auto_5912 ?auto_5907 ) ( FUEL-LEVEL ?auto_5912 ?auto_5913 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5910 ?auto_5909 ?auto_5907 )
      ( FLY-3PPL-VERIFY ?auto_5908 ?auto_5909 ?auto_5910 ?auto_5907 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5937 - PERSON
      ?auto_5938 - PERSON
      ?auto_5939 - PERSON
      ?auto_5936 - CITY
    )
    :vars
    (
      ?auto_5942 - FLEVEL
      ?auto_5940 - FLEVEL
      ?auto_5944 - CITY
      ?auto_5943 - PERSON
      ?auto_5945 - CITY
      ?auto_5941 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5942 ?auto_5940 ) ( not ( = ?auto_5936 ?auto_5944 ) ) ( not ( = ?auto_5940 ?auto_5942 ) ) ( PERSON-AT ?auto_5939 ?auto_5936 ) ( not ( = ?auto_5939 ?auto_5937 ) ) ( PERSON-AT ?auto_5937 ?auto_5944 ) ( not ( = ?auto_5939 ?auto_5943 ) ) ( not ( = ?auto_5937 ?auto_5943 ) ) ( not ( = ?auto_5936 ?auto_5945 ) ) ( not ( = ?auto_5944 ?auto_5945 ) ) ( PERSON-AT ?auto_5943 ?auto_5945 ) ( AIRCRAFT-AT ?auto_5941 ?auto_5936 ) ( FUEL-LEVEL ?auto_5941 ?auto_5942 ) ( PERSON-AT ?auto_5938 ?auto_5936 ) ( not ( = ?auto_5937 ?auto_5938 ) ) ( not ( = ?auto_5938 ?auto_5939 ) ) ( not ( = ?auto_5938 ?auto_5943 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5939 ?auto_5937 ?auto_5936 )
      ( FLY-3PPL-VERIFY ?auto_5937 ?auto_5938 ?auto_5939 ?auto_5936 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5947 - PERSON
      ?auto_5948 - PERSON
      ?auto_5949 - PERSON
      ?auto_5946 - CITY
    )
    :vars
    (
      ?auto_5952 - FLEVEL
      ?auto_5950 - FLEVEL
      ?auto_5953 - CITY
      ?auto_5954 - CITY
      ?auto_5951 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5952 ?auto_5950 ) ( not ( = ?auto_5946 ?auto_5953 ) ) ( not ( = ?auto_5950 ?auto_5952 ) ) ( PERSON-AT ?auto_5948 ?auto_5946 ) ( not ( = ?auto_5948 ?auto_5947 ) ) ( PERSON-AT ?auto_5947 ?auto_5953 ) ( not ( = ?auto_5948 ?auto_5949 ) ) ( not ( = ?auto_5947 ?auto_5949 ) ) ( not ( = ?auto_5946 ?auto_5954 ) ) ( not ( = ?auto_5953 ?auto_5954 ) ) ( PERSON-AT ?auto_5949 ?auto_5954 ) ( AIRCRAFT-AT ?auto_5951 ?auto_5946 ) ( FUEL-LEVEL ?auto_5951 ?auto_5952 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5948 ?auto_5947 ?auto_5946 )
      ( FLY-3PPL-VERIFY ?auto_5947 ?auto_5948 ?auto_5949 ?auto_5946 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_5966 - PERSON
      ?auto_5967 - PERSON
      ?auto_5968 - PERSON
      ?auto_5965 - CITY
    )
    :vars
    (
      ?auto_5971 - FLEVEL
      ?auto_5969 - FLEVEL
      ?auto_5972 - CITY
      ?auto_5973 - CITY
      ?auto_5970 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_5971 ?auto_5969 ) ( not ( = ?auto_5965 ?auto_5972 ) ) ( not ( = ?auto_5969 ?auto_5971 ) ) ( PERSON-AT ?auto_5968 ?auto_5965 ) ( not ( = ?auto_5968 ?auto_5966 ) ) ( PERSON-AT ?auto_5966 ?auto_5972 ) ( not ( = ?auto_5968 ?auto_5967 ) ) ( not ( = ?auto_5966 ?auto_5967 ) ) ( not ( = ?auto_5965 ?auto_5973 ) ) ( not ( = ?auto_5972 ?auto_5973 ) ) ( PERSON-AT ?auto_5967 ?auto_5973 ) ( AIRCRAFT-AT ?auto_5970 ?auto_5965 ) ( FUEL-LEVEL ?auto_5970 ?auto_5971 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_5968 ?auto_5966 ?auto_5965 )
      ( FLY-3PPL-VERIFY ?auto_5966 ?auto_5967 ?auto_5968 ?auto_5965 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_6026 - PERSON
      ?auto_6025 - CITY
    )
    :vars
    (
      ?auto_6029 - FLEVEL
      ?auto_6027 - FLEVEL
      ?auto_6031 - CITY
      ?auto_6033 - PERSON
      ?auto_6030 - PERSON
      ?auto_6032 - CITY
      ?auto_6028 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6029 ?auto_6027 ) ( not ( = ?auto_6025 ?auto_6031 ) ) ( not ( = ?auto_6027 ?auto_6029 ) ) ( not ( = ?auto_6033 ?auto_6026 ) ) ( PERSON-AT ?auto_6026 ?auto_6031 ) ( not ( = ?auto_6033 ?auto_6030 ) ) ( not ( = ?auto_6026 ?auto_6030 ) ) ( not ( = ?auto_6025 ?auto_6032 ) ) ( not ( = ?auto_6031 ?auto_6032 ) ) ( PERSON-AT ?auto_6030 ?auto_6032 ) ( AIRCRAFT-AT ?auto_6028 ?auto_6025 ) ( FUEL-LEVEL ?auto_6028 ?auto_6029 ) ( IN ?auto_6033 ?auto_6028 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_6033 ?auto_6025 )
      ( FLY-2PPL ?auto_6033 ?auto_6026 ?auto_6025 )
      ( FLY-1PPL-VERIFY ?auto_6026 ?auto_6025 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_6035 - PERSON
      ?auto_6036 - PERSON
      ?auto_6034 - CITY
    )
    :vars
    (
      ?auto_6038 - FLEVEL
      ?auto_6041 - FLEVEL
      ?auto_6040 - CITY
      ?auto_6039 - PERSON
      ?auto_6037 - CITY
      ?auto_6042 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6038 ?auto_6041 ) ( not ( = ?auto_6034 ?auto_6040 ) ) ( not ( = ?auto_6041 ?auto_6038 ) ) ( not ( = ?auto_6035 ?auto_6036 ) ) ( PERSON-AT ?auto_6036 ?auto_6040 ) ( not ( = ?auto_6035 ?auto_6039 ) ) ( not ( = ?auto_6036 ?auto_6039 ) ) ( not ( = ?auto_6034 ?auto_6037 ) ) ( not ( = ?auto_6040 ?auto_6037 ) ) ( PERSON-AT ?auto_6039 ?auto_6037 ) ( AIRCRAFT-AT ?auto_6042 ?auto_6034 ) ( FUEL-LEVEL ?auto_6042 ?auto_6038 ) ( IN ?auto_6035 ?auto_6042 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_6036 ?auto_6034 )
      ( FLY-2PPL-VERIFY ?auto_6035 ?auto_6036 ?auto_6034 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_6044 - PERSON
      ?auto_6045 - PERSON
      ?auto_6043 - CITY
    )
    :vars
    (
      ?auto_6050 - FLEVEL
      ?auto_6049 - FLEVEL
      ?auto_6047 - CITY
      ?auto_6051 - PERSON
      ?auto_6046 - CITY
      ?auto_6048 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6050 ?auto_6049 ) ( not ( = ?auto_6043 ?auto_6047 ) ) ( not ( = ?auto_6049 ?auto_6050 ) ) ( not ( = ?auto_6051 ?auto_6045 ) ) ( PERSON-AT ?auto_6045 ?auto_6047 ) ( not ( = ?auto_6051 ?auto_6044 ) ) ( not ( = ?auto_6045 ?auto_6044 ) ) ( not ( = ?auto_6043 ?auto_6046 ) ) ( not ( = ?auto_6047 ?auto_6046 ) ) ( PERSON-AT ?auto_6044 ?auto_6046 ) ( AIRCRAFT-AT ?auto_6048 ?auto_6043 ) ( FUEL-LEVEL ?auto_6048 ?auto_6050 ) ( IN ?auto_6051 ?auto_6048 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6051 ?auto_6045 ?auto_6043 )
      ( FLY-2PPL-VERIFY ?auto_6044 ?auto_6045 ?auto_6043 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_6053 - PERSON
      ?auto_6054 - PERSON
      ?auto_6052 - CITY
    )
    :vars
    (
      ?auto_6060 - FLEVEL
      ?auto_6059 - FLEVEL
      ?auto_6057 - CITY
      ?auto_6055 - PERSON
      ?auto_6056 - CITY
      ?auto_6058 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6060 ?auto_6059 ) ( not ( = ?auto_6052 ?auto_6057 ) ) ( not ( = ?auto_6059 ?auto_6060 ) ) ( not ( = ?auto_6054 ?auto_6053 ) ) ( PERSON-AT ?auto_6053 ?auto_6057 ) ( not ( = ?auto_6054 ?auto_6055 ) ) ( not ( = ?auto_6053 ?auto_6055 ) ) ( not ( = ?auto_6052 ?auto_6056 ) ) ( not ( = ?auto_6057 ?auto_6056 ) ) ( PERSON-AT ?auto_6055 ?auto_6056 ) ( AIRCRAFT-AT ?auto_6058 ?auto_6052 ) ( FUEL-LEVEL ?auto_6058 ?auto_6060 ) ( IN ?auto_6054 ?auto_6058 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6054 ?auto_6053 ?auto_6052 )
      ( FLY-2PPL-VERIFY ?auto_6053 ?auto_6054 ?auto_6052 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_6062 - PERSON
      ?auto_6063 - PERSON
      ?auto_6061 - CITY
    )
    :vars
    (
      ?auto_6068 - FLEVEL
      ?auto_6067 - FLEVEL
      ?auto_6065 - CITY
      ?auto_6069 - PERSON
      ?auto_6064 - CITY
      ?auto_6066 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6068 ?auto_6067 ) ( not ( = ?auto_6061 ?auto_6065 ) ) ( not ( = ?auto_6067 ?auto_6068 ) ) ( not ( = ?auto_6069 ?auto_6062 ) ) ( PERSON-AT ?auto_6062 ?auto_6065 ) ( not ( = ?auto_6069 ?auto_6063 ) ) ( not ( = ?auto_6062 ?auto_6063 ) ) ( not ( = ?auto_6061 ?auto_6064 ) ) ( not ( = ?auto_6065 ?auto_6064 ) ) ( PERSON-AT ?auto_6063 ?auto_6064 ) ( AIRCRAFT-AT ?auto_6066 ?auto_6061 ) ( FUEL-LEVEL ?auto_6066 ?auto_6068 ) ( IN ?auto_6069 ?auto_6066 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6069 ?auto_6062 ?auto_6061 )
      ( FLY-2PPL-VERIFY ?auto_6062 ?auto_6063 ?auto_6061 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6091 - PERSON
      ?auto_6092 - PERSON
      ?auto_6093 - PERSON
      ?auto_6090 - CITY
    )
    :vars
    (
      ?auto_6098 - FLEVEL
      ?auto_6097 - FLEVEL
      ?auto_6095 - CITY
      ?auto_6094 - CITY
      ?auto_6096 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6098 ?auto_6097 ) ( not ( = ?auto_6090 ?auto_6095 ) ) ( not ( = ?auto_6097 ?auto_6098 ) ) ( not ( = ?auto_6091 ?auto_6093 ) ) ( PERSON-AT ?auto_6093 ?auto_6095 ) ( not ( = ?auto_6091 ?auto_6092 ) ) ( not ( = ?auto_6093 ?auto_6092 ) ) ( not ( = ?auto_6090 ?auto_6094 ) ) ( not ( = ?auto_6095 ?auto_6094 ) ) ( PERSON-AT ?auto_6092 ?auto_6094 ) ( AIRCRAFT-AT ?auto_6096 ?auto_6090 ) ( FUEL-LEVEL ?auto_6096 ?auto_6098 ) ( IN ?auto_6091 ?auto_6096 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6091 ?auto_6093 ?auto_6090 )
      ( FLY-3PPL-VERIFY ?auto_6091 ?auto_6092 ?auto_6093 ?auto_6090 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6110 - PERSON
      ?auto_6111 - PERSON
      ?auto_6112 - PERSON
      ?auto_6109 - CITY
    )
    :vars
    (
      ?auto_6117 - FLEVEL
      ?auto_6116 - FLEVEL
      ?auto_6114 - CITY
      ?auto_6113 - CITY
      ?auto_6115 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6117 ?auto_6116 ) ( not ( = ?auto_6109 ?auto_6114 ) ) ( not ( = ?auto_6116 ?auto_6117 ) ) ( not ( = ?auto_6110 ?auto_6111 ) ) ( PERSON-AT ?auto_6111 ?auto_6114 ) ( not ( = ?auto_6110 ?auto_6112 ) ) ( not ( = ?auto_6111 ?auto_6112 ) ) ( not ( = ?auto_6109 ?auto_6113 ) ) ( not ( = ?auto_6114 ?auto_6113 ) ) ( PERSON-AT ?auto_6112 ?auto_6113 ) ( AIRCRAFT-AT ?auto_6115 ?auto_6109 ) ( FUEL-LEVEL ?auto_6115 ?auto_6117 ) ( IN ?auto_6110 ?auto_6115 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6110 ?auto_6111 ?auto_6109 )
      ( FLY-3PPL-VERIFY ?auto_6110 ?auto_6111 ?auto_6112 ?auto_6109 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6129 - PERSON
      ?auto_6130 - PERSON
      ?auto_6131 - PERSON
      ?auto_6128 - CITY
    )
    :vars
    (
      ?auto_6136 - FLEVEL
      ?auto_6135 - FLEVEL
      ?auto_6133 - CITY
      ?auto_6132 - CITY
      ?auto_6134 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6136 ?auto_6135 ) ( not ( = ?auto_6128 ?auto_6133 ) ) ( not ( = ?auto_6135 ?auto_6136 ) ) ( not ( = ?auto_6130 ?auto_6131 ) ) ( PERSON-AT ?auto_6131 ?auto_6133 ) ( not ( = ?auto_6130 ?auto_6129 ) ) ( not ( = ?auto_6131 ?auto_6129 ) ) ( not ( = ?auto_6128 ?auto_6132 ) ) ( not ( = ?auto_6133 ?auto_6132 ) ) ( PERSON-AT ?auto_6129 ?auto_6132 ) ( AIRCRAFT-AT ?auto_6134 ?auto_6128 ) ( FUEL-LEVEL ?auto_6134 ?auto_6136 ) ( IN ?auto_6130 ?auto_6134 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6130 ?auto_6131 ?auto_6128 )
      ( FLY-3PPL-VERIFY ?auto_6129 ?auto_6130 ?auto_6131 ?auto_6128 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6148 - PERSON
      ?auto_6149 - PERSON
      ?auto_6150 - PERSON
      ?auto_6147 - CITY
    )
    :vars
    (
      ?auto_6155 - FLEVEL
      ?auto_6154 - FLEVEL
      ?auto_6152 - CITY
      ?auto_6151 - CITY
      ?auto_6153 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6155 ?auto_6154 ) ( not ( = ?auto_6147 ?auto_6152 ) ) ( not ( = ?auto_6154 ?auto_6155 ) ) ( not ( = ?auto_6150 ?auto_6149 ) ) ( PERSON-AT ?auto_6149 ?auto_6152 ) ( not ( = ?auto_6150 ?auto_6148 ) ) ( not ( = ?auto_6149 ?auto_6148 ) ) ( not ( = ?auto_6147 ?auto_6151 ) ) ( not ( = ?auto_6152 ?auto_6151 ) ) ( PERSON-AT ?auto_6148 ?auto_6151 ) ( AIRCRAFT-AT ?auto_6153 ?auto_6147 ) ( FUEL-LEVEL ?auto_6153 ?auto_6155 ) ( IN ?auto_6150 ?auto_6153 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6150 ?auto_6149 ?auto_6147 )
      ( FLY-3PPL-VERIFY ?auto_6148 ?auto_6149 ?auto_6150 ?auto_6147 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6187 - PERSON
      ?auto_6188 - PERSON
      ?auto_6189 - PERSON
      ?auto_6186 - CITY
    )
    :vars
    (
      ?auto_6194 - FLEVEL
      ?auto_6193 - FLEVEL
      ?auto_6191 - CITY
      ?auto_6190 - CITY
      ?auto_6192 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6194 ?auto_6193 ) ( not ( = ?auto_6186 ?auto_6191 ) ) ( not ( = ?auto_6193 ?auto_6194 ) ) ( not ( = ?auto_6188 ?auto_6187 ) ) ( PERSON-AT ?auto_6187 ?auto_6191 ) ( not ( = ?auto_6188 ?auto_6189 ) ) ( not ( = ?auto_6187 ?auto_6189 ) ) ( not ( = ?auto_6186 ?auto_6190 ) ) ( not ( = ?auto_6191 ?auto_6190 ) ) ( PERSON-AT ?auto_6189 ?auto_6190 ) ( AIRCRAFT-AT ?auto_6192 ?auto_6186 ) ( FUEL-LEVEL ?auto_6192 ?auto_6194 ) ( IN ?auto_6188 ?auto_6192 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6188 ?auto_6187 ?auto_6186 )
      ( FLY-3PPL-VERIFY ?auto_6187 ?auto_6188 ?auto_6189 ?auto_6186 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6206 - PERSON
      ?auto_6207 - PERSON
      ?auto_6208 - PERSON
      ?auto_6205 - CITY
    )
    :vars
    (
      ?auto_6213 - FLEVEL
      ?auto_6212 - FLEVEL
      ?auto_6210 - CITY
      ?auto_6209 - CITY
      ?auto_6211 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_6213 ?auto_6212 ) ( not ( = ?auto_6205 ?auto_6210 ) ) ( not ( = ?auto_6212 ?auto_6213 ) ) ( not ( = ?auto_6208 ?auto_6206 ) ) ( PERSON-AT ?auto_6206 ?auto_6210 ) ( not ( = ?auto_6208 ?auto_6207 ) ) ( not ( = ?auto_6206 ?auto_6207 ) ) ( not ( = ?auto_6205 ?auto_6209 ) ) ( not ( = ?auto_6210 ?auto_6209 ) ) ( PERSON-AT ?auto_6207 ?auto_6209 ) ( AIRCRAFT-AT ?auto_6211 ?auto_6205 ) ( FUEL-LEVEL ?auto_6211 ?auto_6213 ) ( IN ?auto_6208 ?auto_6211 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6208 ?auto_6206 ?auto_6205 )
      ( FLY-3PPL-VERIFY ?auto_6206 ?auto_6207 ?auto_6208 ?auto_6205 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_6266 - PERSON
      ?auto_6265 - CITY
    )
    :vars
    (
      ?auto_6272 - FLEVEL
      ?auto_6271 - FLEVEL
      ?auto_6269 - CITY
      ?auto_6273 - PERSON
      ?auto_6267 - PERSON
      ?auto_6268 - CITY
      ?auto_6270 - AIRCRAFT
      ?auto_6274 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6272 ?auto_6271 ) ( not ( = ?auto_6265 ?auto_6269 ) ) ( not ( = ?auto_6271 ?auto_6272 ) ) ( not ( = ?auto_6273 ?auto_6266 ) ) ( PERSON-AT ?auto_6266 ?auto_6269 ) ( not ( = ?auto_6273 ?auto_6267 ) ) ( not ( = ?auto_6266 ?auto_6267 ) ) ( not ( = ?auto_6265 ?auto_6268 ) ) ( not ( = ?auto_6269 ?auto_6268 ) ) ( PERSON-AT ?auto_6267 ?auto_6268 ) ( IN ?auto_6273 ?auto_6270 ) ( AIRCRAFT-AT ?auto_6270 ?auto_6274 ) ( FUEL-LEVEL ?auto_6270 ?auto_6271 ) ( not ( = ?auto_6265 ?auto_6274 ) ) ( not ( = ?auto_6269 ?auto_6274 ) ) ( not ( = ?auto_6268 ?auto_6274 ) ) )
    :subtasks
    ( ( !FLY ?auto_6270 ?auto_6274 ?auto_6265 ?auto_6271 ?auto_6272 )
      ( FLY-2PPL ?auto_6273 ?auto_6266 ?auto_6265 )
      ( FLY-1PPL-VERIFY ?auto_6266 ?auto_6265 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_6276 - PERSON
      ?auto_6277 - PERSON
      ?auto_6275 - CITY
    )
    :vars
    (
      ?auto_6283 - FLEVEL
      ?auto_6279 - FLEVEL
      ?auto_6281 - CITY
      ?auto_6280 - PERSON
      ?auto_6284 - CITY
      ?auto_6282 - AIRCRAFT
      ?auto_6278 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6283 ?auto_6279 ) ( not ( = ?auto_6275 ?auto_6281 ) ) ( not ( = ?auto_6279 ?auto_6283 ) ) ( not ( = ?auto_6276 ?auto_6277 ) ) ( PERSON-AT ?auto_6277 ?auto_6281 ) ( not ( = ?auto_6276 ?auto_6280 ) ) ( not ( = ?auto_6277 ?auto_6280 ) ) ( not ( = ?auto_6275 ?auto_6284 ) ) ( not ( = ?auto_6281 ?auto_6284 ) ) ( PERSON-AT ?auto_6280 ?auto_6284 ) ( IN ?auto_6276 ?auto_6282 ) ( AIRCRAFT-AT ?auto_6282 ?auto_6278 ) ( FUEL-LEVEL ?auto_6282 ?auto_6279 ) ( not ( = ?auto_6275 ?auto_6278 ) ) ( not ( = ?auto_6281 ?auto_6278 ) ) ( not ( = ?auto_6284 ?auto_6278 ) ) )
    :subtasks
    ( ( FLY-1PPL ?auto_6277 ?auto_6275 )
      ( FLY-2PPL-VERIFY ?auto_6276 ?auto_6277 ?auto_6275 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_6286 - PERSON
      ?auto_6287 - PERSON
      ?auto_6285 - CITY
    )
    :vars
    (
      ?auto_6290 - FLEVEL
      ?auto_6292 - FLEVEL
      ?auto_6291 - CITY
      ?auto_6294 - PERSON
      ?auto_6289 - CITY
      ?auto_6293 - AIRCRAFT
      ?auto_6288 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6290 ?auto_6292 ) ( not ( = ?auto_6285 ?auto_6291 ) ) ( not ( = ?auto_6292 ?auto_6290 ) ) ( not ( = ?auto_6294 ?auto_6287 ) ) ( PERSON-AT ?auto_6287 ?auto_6291 ) ( not ( = ?auto_6294 ?auto_6286 ) ) ( not ( = ?auto_6287 ?auto_6286 ) ) ( not ( = ?auto_6285 ?auto_6289 ) ) ( not ( = ?auto_6291 ?auto_6289 ) ) ( PERSON-AT ?auto_6286 ?auto_6289 ) ( IN ?auto_6294 ?auto_6293 ) ( AIRCRAFT-AT ?auto_6293 ?auto_6288 ) ( FUEL-LEVEL ?auto_6293 ?auto_6292 ) ( not ( = ?auto_6285 ?auto_6288 ) ) ( not ( = ?auto_6291 ?auto_6288 ) ) ( not ( = ?auto_6289 ?auto_6288 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6294 ?auto_6287 ?auto_6285 )
      ( FLY-2PPL-VERIFY ?auto_6286 ?auto_6287 ?auto_6285 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_6296 - PERSON
      ?auto_6297 - PERSON
      ?auto_6295 - CITY
    )
    :vars
    (
      ?auto_6301 - FLEVEL
      ?auto_6303 - FLEVEL
      ?auto_6302 - CITY
      ?auto_6298 - PERSON
      ?auto_6300 - CITY
      ?auto_6304 - AIRCRAFT
      ?auto_6299 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6301 ?auto_6303 ) ( not ( = ?auto_6295 ?auto_6302 ) ) ( not ( = ?auto_6303 ?auto_6301 ) ) ( not ( = ?auto_6297 ?auto_6296 ) ) ( PERSON-AT ?auto_6296 ?auto_6302 ) ( not ( = ?auto_6297 ?auto_6298 ) ) ( not ( = ?auto_6296 ?auto_6298 ) ) ( not ( = ?auto_6295 ?auto_6300 ) ) ( not ( = ?auto_6302 ?auto_6300 ) ) ( PERSON-AT ?auto_6298 ?auto_6300 ) ( IN ?auto_6297 ?auto_6304 ) ( AIRCRAFT-AT ?auto_6304 ?auto_6299 ) ( FUEL-LEVEL ?auto_6304 ?auto_6303 ) ( not ( = ?auto_6295 ?auto_6299 ) ) ( not ( = ?auto_6302 ?auto_6299 ) ) ( not ( = ?auto_6300 ?auto_6299 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6297 ?auto_6296 ?auto_6295 )
      ( FLY-2PPL-VERIFY ?auto_6296 ?auto_6297 ?auto_6295 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_6306 - PERSON
      ?auto_6307 - PERSON
      ?auto_6305 - CITY
    )
    :vars
    (
      ?auto_6310 - FLEVEL
      ?auto_6312 - FLEVEL
      ?auto_6311 - CITY
      ?auto_6314 - PERSON
      ?auto_6309 - CITY
      ?auto_6313 - AIRCRAFT
      ?auto_6308 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6310 ?auto_6312 ) ( not ( = ?auto_6305 ?auto_6311 ) ) ( not ( = ?auto_6312 ?auto_6310 ) ) ( not ( = ?auto_6314 ?auto_6306 ) ) ( PERSON-AT ?auto_6306 ?auto_6311 ) ( not ( = ?auto_6314 ?auto_6307 ) ) ( not ( = ?auto_6306 ?auto_6307 ) ) ( not ( = ?auto_6305 ?auto_6309 ) ) ( not ( = ?auto_6311 ?auto_6309 ) ) ( PERSON-AT ?auto_6307 ?auto_6309 ) ( IN ?auto_6314 ?auto_6313 ) ( AIRCRAFT-AT ?auto_6313 ?auto_6308 ) ( FUEL-LEVEL ?auto_6313 ?auto_6312 ) ( not ( = ?auto_6305 ?auto_6308 ) ) ( not ( = ?auto_6311 ?auto_6308 ) ) ( not ( = ?auto_6309 ?auto_6308 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6314 ?auto_6306 ?auto_6305 )
      ( FLY-2PPL-VERIFY ?auto_6306 ?auto_6307 ?auto_6305 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6338 - PERSON
      ?auto_6339 - PERSON
      ?auto_6340 - PERSON
      ?auto_6337 - CITY
    )
    :vars
    (
      ?auto_6343 - FLEVEL
      ?auto_6345 - FLEVEL
      ?auto_6344 - CITY
      ?auto_6342 - CITY
      ?auto_6346 - AIRCRAFT
      ?auto_6341 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6343 ?auto_6345 ) ( not ( = ?auto_6337 ?auto_6344 ) ) ( not ( = ?auto_6345 ?auto_6343 ) ) ( not ( = ?auto_6338 ?auto_6340 ) ) ( PERSON-AT ?auto_6340 ?auto_6344 ) ( not ( = ?auto_6338 ?auto_6339 ) ) ( not ( = ?auto_6340 ?auto_6339 ) ) ( not ( = ?auto_6337 ?auto_6342 ) ) ( not ( = ?auto_6344 ?auto_6342 ) ) ( PERSON-AT ?auto_6339 ?auto_6342 ) ( IN ?auto_6338 ?auto_6346 ) ( AIRCRAFT-AT ?auto_6346 ?auto_6341 ) ( FUEL-LEVEL ?auto_6346 ?auto_6345 ) ( not ( = ?auto_6337 ?auto_6341 ) ) ( not ( = ?auto_6344 ?auto_6341 ) ) ( not ( = ?auto_6342 ?auto_6341 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6338 ?auto_6340 ?auto_6337 )
      ( FLY-3PPL-VERIFY ?auto_6338 ?auto_6339 ?auto_6340 ?auto_6337 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6359 - PERSON
      ?auto_6360 - PERSON
      ?auto_6361 - PERSON
      ?auto_6358 - CITY
    )
    :vars
    (
      ?auto_6364 - FLEVEL
      ?auto_6366 - FLEVEL
      ?auto_6365 - CITY
      ?auto_6363 - CITY
      ?auto_6367 - AIRCRAFT
      ?auto_6362 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6364 ?auto_6366 ) ( not ( = ?auto_6358 ?auto_6365 ) ) ( not ( = ?auto_6366 ?auto_6364 ) ) ( not ( = ?auto_6359 ?auto_6360 ) ) ( PERSON-AT ?auto_6360 ?auto_6365 ) ( not ( = ?auto_6359 ?auto_6361 ) ) ( not ( = ?auto_6360 ?auto_6361 ) ) ( not ( = ?auto_6358 ?auto_6363 ) ) ( not ( = ?auto_6365 ?auto_6363 ) ) ( PERSON-AT ?auto_6361 ?auto_6363 ) ( IN ?auto_6359 ?auto_6367 ) ( AIRCRAFT-AT ?auto_6367 ?auto_6362 ) ( FUEL-LEVEL ?auto_6367 ?auto_6366 ) ( not ( = ?auto_6358 ?auto_6362 ) ) ( not ( = ?auto_6365 ?auto_6362 ) ) ( not ( = ?auto_6363 ?auto_6362 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6359 ?auto_6360 ?auto_6358 )
      ( FLY-3PPL-VERIFY ?auto_6359 ?auto_6360 ?auto_6361 ?auto_6358 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6380 - PERSON
      ?auto_6381 - PERSON
      ?auto_6382 - PERSON
      ?auto_6379 - CITY
    )
    :vars
    (
      ?auto_6385 - FLEVEL
      ?auto_6387 - FLEVEL
      ?auto_6386 - CITY
      ?auto_6384 - CITY
      ?auto_6388 - AIRCRAFT
      ?auto_6383 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6385 ?auto_6387 ) ( not ( = ?auto_6379 ?auto_6386 ) ) ( not ( = ?auto_6387 ?auto_6385 ) ) ( not ( = ?auto_6381 ?auto_6382 ) ) ( PERSON-AT ?auto_6382 ?auto_6386 ) ( not ( = ?auto_6381 ?auto_6380 ) ) ( not ( = ?auto_6382 ?auto_6380 ) ) ( not ( = ?auto_6379 ?auto_6384 ) ) ( not ( = ?auto_6386 ?auto_6384 ) ) ( PERSON-AT ?auto_6380 ?auto_6384 ) ( IN ?auto_6381 ?auto_6388 ) ( AIRCRAFT-AT ?auto_6388 ?auto_6383 ) ( FUEL-LEVEL ?auto_6388 ?auto_6387 ) ( not ( = ?auto_6379 ?auto_6383 ) ) ( not ( = ?auto_6386 ?auto_6383 ) ) ( not ( = ?auto_6384 ?auto_6383 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6381 ?auto_6382 ?auto_6379 )
      ( FLY-3PPL-VERIFY ?auto_6380 ?auto_6381 ?auto_6382 ?auto_6379 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6401 - PERSON
      ?auto_6402 - PERSON
      ?auto_6403 - PERSON
      ?auto_6400 - CITY
    )
    :vars
    (
      ?auto_6406 - FLEVEL
      ?auto_6408 - FLEVEL
      ?auto_6407 - CITY
      ?auto_6405 - CITY
      ?auto_6409 - AIRCRAFT
      ?auto_6404 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6406 ?auto_6408 ) ( not ( = ?auto_6400 ?auto_6407 ) ) ( not ( = ?auto_6408 ?auto_6406 ) ) ( not ( = ?auto_6403 ?auto_6402 ) ) ( PERSON-AT ?auto_6402 ?auto_6407 ) ( not ( = ?auto_6403 ?auto_6401 ) ) ( not ( = ?auto_6402 ?auto_6401 ) ) ( not ( = ?auto_6400 ?auto_6405 ) ) ( not ( = ?auto_6407 ?auto_6405 ) ) ( PERSON-AT ?auto_6401 ?auto_6405 ) ( IN ?auto_6403 ?auto_6409 ) ( AIRCRAFT-AT ?auto_6409 ?auto_6404 ) ( FUEL-LEVEL ?auto_6409 ?auto_6408 ) ( not ( = ?auto_6400 ?auto_6404 ) ) ( not ( = ?auto_6407 ?auto_6404 ) ) ( not ( = ?auto_6405 ?auto_6404 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6403 ?auto_6402 ?auto_6400 )
      ( FLY-3PPL-VERIFY ?auto_6401 ?auto_6402 ?auto_6403 ?auto_6400 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6444 - PERSON
      ?auto_6445 - PERSON
      ?auto_6446 - PERSON
      ?auto_6443 - CITY
    )
    :vars
    (
      ?auto_6449 - FLEVEL
      ?auto_6451 - FLEVEL
      ?auto_6450 - CITY
      ?auto_6448 - CITY
      ?auto_6452 - AIRCRAFT
      ?auto_6447 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6449 ?auto_6451 ) ( not ( = ?auto_6443 ?auto_6450 ) ) ( not ( = ?auto_6451 ?auto_6449 ) ) ( not ( = ?auto_6445 ?auto_6444 ) ) ( PERSON-AT ?auto_6444 ?auto_6450 ) ( not ( = ?auto_6445 ?auto_6446 ) ) ( not ( = ?auto_6444 ?auto_6446 ) ) ( not ( = ?auto_6443 ?auto_6448 ) ) ( not ( = ?auto_6450 ?auto_6448 ) ) ( PERSON-AT ?auto_6446 ?auto_6448 ) ( IN ?auto_6445 ?auto_6452 ) ( AIRCRAFT-AT ?auto_6452 ?auto_6447 ) ( FUEL-LEVEL ?auto_6452 ?auto_6451 ) ( not ( = ?auto_6443 ?auto_6447 ) ) ( not ( = ?auto_6450 ?auto_6447 ) ) ( not ( = ?auto_6448 ?auto_6447 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6445 ?auto_6444 ?auto_6443 )
      ( FLY-3PPL-VERIFY ?auto_6444 ?auto_6445 ?auto_6446 ?auto_6443 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6465 - PERSON
      ?auto_6466 - PERSON
      ?auto_6467 - PERSON
      ?auto_6464 - CITY
    )
    :vars
    (
      ?auto_6470 - FLEVEL
      ?auto_6472 - FLEVEL
      ?auto_6471 - CITY
      ?auto_6469 - CITY
      ?auto_6473 - AIRCRAFT
      ?auto_6468 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6470 ?auto_6472 ) ( not ( = ?auto_6464 ?auto_6471 ) ) ( not ( = ?auto_6472 ?auto_6470 ) ) ( not ( = ?auto_6467 ?auto_6465 ) ) ( PERSON-AT ?auto_6465 ?auto_6471 ) ( not ( = ?auto_6467 ?auto_6466 ) ) ( not ( = ?auto_6465 ?auto_6466 ) ) ( not ( = ?auto_6464 ?auto_6469 ) ) ( not ( = ?auto_6471 ?auto_6469 ) ) ( PERSON-AT ?auto_6466 ?auto_6469 ) ( IN ?auto_6467 ?auto_6473 ) ( AIRCRAFT-AT ?auto_6473 ?auto_6468 ) ( FUEL-LEVEL ?auto_6473 ?auto_6472 ) ( not ( = ?auto_6464 ?auto_6468 ) ) ( not ( = ?auto_6471 ?auto_6468 ) ) ( not ( = ?auto_6469 ?auto_6468 ) ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6467 ?auto_6465 ?auto_6464 )
      ( FLY-3PPL-VERIFY ?auto_6465 ?auto_6466 ?auto_6467 ?auto_6464 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_6531 - PERSON
      ?auto_6530 - CITY
    )
    :vars
    (
      ?auto_6535 - FLEVEL
      ?auto_6537 - FLEVEL
      ?auto_6536 - CITY
      ?auto_6539 - PERSON
      ?auto_6532 - PERSON
      ?auto_6534 - CITY
      ?auto_6538 - AIRCRAFT
      ?auto_6533 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6535 ?auto_6537 ) ( not ( = ?auto_6530 ?auto_6536 ) ) ( not ( = ?auto_6537 ?auto_6535 ) ) ( not ( = ?auto_6539 ?auto_6531 ) ) ( PERSON-AT ?auto_6531 ?auto_6536 ) ( not ( = ?auto_6539 ?auto_6532 ) ) ( not ( = ?auto_6531 ?auto_6532 ) ) ( not ( = ?auto_6530 ?auto_6534 ) ) ( not ( = ?auto_6536 ?auto_6534 ) ) ( PERSON-AT ?auto_6532 ?auto_6534 ) ( AIRCRAFT-AT ?auto_6538 ?auto_6533 ) ( FUEL-LEVEL ?auto_6538 ?auto_6537 ) ( not ( = ?auto_6530 ?auto_6533 ) ) ( not ( = ?auto_6536 ?auto_6533 ) ) ( not ( = ?auto_6534 ?auto_6533 ) ) ( PERSON-AT ?auto_6539 ?auto_6533 ) )
    :subtasks
    ( ( !BOARD ?auto_6539 ?auto_6538 ?auto_6533 )
      ( FLY-2PPL ?auto_6539 ?auto_6531 ?auto_6530 )
      ( FLY-1PPL-VERIFY ?auto_6531 ?auto_6530 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_6541 - PERSON
      ?auto_6542 - PERSON
      ?auto_6540 - CITY
    )
    :vars
    (
      ?auto_6549 - FLEVEL
      ?auto_6543 - FLEVEL
      ?auto_6546 - CITY
      ?auto_6544 - PERSON
      ?auto_6548 - CITY
      ?auto_6547 - AIRCRAFT
      ?auto_6545 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6549 ?auto_6543 ) ( not ( = ?auto_6540 ?auto_6546 ) ) ( not ( = ?auto_6543 ?auto_6549 ) ) ( not ( = ?auto_6541 ?auto_6542 ) ) ( PERSON-AT ?auto_6542 ?auto_6546 ) ( not ( = ?auto_6541 ?auto_6544 ) ) ( not ( = ?auto_6542 ?auto_6544 ) ) ( not ( = ?auto_6540 ?auto_6548 ) ) ( not ( = ?auto_6546 ?auto_6548 ) ) ( PERSON-AT ?auto_6544 ?auto_6548 ) ( AIRCRAFT-AT ?auto_6547 ?auto_6545 ) ( FUEL-LEVEL ?auto_6547 ?auto_6543 ) ( not ( = ?auto_6540 ?auto_6545 ) ) ( not ( = ?auto_6546 ?auto_6545 ) ) ( not ( = ?auto_6548 ?auto_6545 ) ) ( PERSON-AT ?auto_6541 ?auto_6545 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_6542 ?auto_6540 )
      ( FLY-2PPL-VERIFY ?auto_6541 ?auto_6542 ?auto_6540 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_6551 - PERSON
      ?auto_6552 - PERSON
      ?auto_6550 - CITY
    )
    :vars
    (
      ?auto_6554 - FLEVEL
      ?auto_6555 - FLEVEL
      ?auto_6557 - CITY
      ?auto_6559 - PERSON
      ?auto_6558 - CITY
      ?auto_6553 - AIRCRAFT
      ?auto_6556 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6554 ?auto_6555 ) ( not ( = ?auto_6550 ?auto_6557 ) ) ( not ( = ?auto_6555 ?auto_6554 ) ) ( not ( = ?auto_6559 ?auto_6552 ) ) ( PERSON-AT ?auto_6552 ?auto_6557 ) ( not ( = ?auto_6559 ?auto_6551 ) ) ( not ( = ?auto_6552 ?auto_6551 ) ) ( not ( = ?auto_6550 ?auto_6558 ) ) ( not ( = ?auto_6557 ?auto_6558 ) ) ( PERSON-AT ?auto_6551 ?auto_6558 ) ( AIRCRAFT-AT ?auto_6553 ?auto_6556 ) ( FUEL-LEVEL ?auto_6553 ?auto_6555 ) ( not ( = ?auto_6550 ?auto_6556 ) ) ( not ( = ?auto_6557 ?auto_6556 ) ) ( not ( = ?auto_6558 ?auto_6556 ) ) ( PERSON-AT ?auto_6559 ?auto_6556 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6559 ?auto_6552 ?auto_6550 )
      ( FLY-2PPL-VERIFY ?auto_6551 ?auto_6552 ?auto_6550 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_6561 - PERSON
      ?auto_6562 - PERSON
      ?auto_6560 - CITY
    )
    :vars
    (
      ?auto_6564 - FLEVEL
      ?auto_6566 - FLEVEL
      ?auto_6568 - CITY
      ?auto_6565 - PERSON
      ?auto_6569 - CITY
      ?auto_6563 - AIRCRAFT
      ?auto_6567 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6564 ?auto_6566 ) ( not ( = ?auto_6560 ?auto_6568 ) ) ( not ( = ?auto_6566 ?auto_6564 ) ) ( not ( = ?auto_6562 ?auto_6561 ) ) ( PERSON-AT ?auto_6561 ?auto_6568 ) ( not ( = ?auto_6562 ?auto_6565 ) ) ( not ( = ?auto_6561 ?auto_6565 ) ) ( not ( = ?auto_6560 ?auto_6569 ) ) ( not ( = ?auto_6568 ?auto_6569 ) ) ( PERSON-AT ?auto_6565 ?auto_6569 ) ( AIRCRAFT-AT ?auto_6563 ?auto_6567 ) ( FUEL-LEVEL ?auto_6563 ?auto_6566 ) ( not ( = ?auto_6560 ?auto_6567 ) ) ( not ( = ?auto_6568 ?auto_6567 ) ) ( not ( = ?auto_6569 ?auto_6567 ) ) ( PERSON-AT ?auto_6562 ?auto_6567 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6562 ?auto_6561 ?auto_6560 )
      ( FLY-2PPL-VERIFY ?auto_6561 ?auto_6562 ?auto_6560 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_6571 - PERSON
      ?auto_6572 - PERSON
      ?auto_6570 - CITY
    )
    :vars
    (
      ?auto_6574 - FLEVEL
      ?auto_6575 - FLEVEL
      ?auto_6577 - CITY
      ?auto_6579 - PERSON
      ?auto_6578 - CITY
      ?auto_6573 - AIRCRAFT
      ?auto_6576 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6574 ?auto_6575 ) ( not ( = ?auto_6570 ?auto_6577 ) ) ( not ( = ?auto_6575 ?auto_6574 ) ) ( not ( = ?auto_6579 ?auto_6571 ) ) ( PERSON-AT ?auto_6571 ?auto_6577 ) ( not ( = ?auto_6579 ?auto_6572 ) ) ( not ( = ?auto_6571 ?auto_6572 ) ) ( not ( = ?auto_6570 ?auto_6578 ) ) ( not ( = ?auto_6577 ?auto_6578 ) ) ( PERSON-AT ?auto_6572 ?auto_6578 ) ( AIRCRAFT-AT ?auto_6573 ?auto_6576 ) ( FUEL-LEVEL ?auto_6573 ?auto_6575 ) ( not ( = ?auto_6570 ?auto_6576 ) ) ( not ( = ?auto_6577 ?auto_6576 ) ) ( not ( = ?auto_6578 ?auto_6576 ) ) ( PERSON-AT ?auto_6579 ?auto_6576 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6579 ?auto_6571 ?auto_6570 )
      ( FLY-2PPL-VERIFY ?auto_6571 ?auto_6572 ?auto_6570 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6603 - PERSON
      ?auto_6604 - PERSON
      ?auto_6605 - PERSON
      ?auto_6602 - CITY
    )
    :vars
    (
      ?auto_6607 - FLEVEL
      ?auto_6608 - FLEVEL
      ?auto_6610 - CITY
      ?auto_6611 - CITY
      ?auto_6606 - AIRCRAFT
      ?auto_6609 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6607 ?auto_6608 ) ( not ( = ?auto_6602 ?auto_6610 ) ) ( not ( = ?auto_6608 ?auto_6607 ) ) ( not ( = ?auto_6603 ?auto_6605 ) ) ( PERSON-AT ?auto_6605 ?auto_6610 ) ( not ( = ?auto_6603 ?auto_6604 ) ) ( not ( = ?auto_6605 ?auto_6604 ) ) ( not ( = ?auto_6602 ?auto_6611 ) ) ( not ( = ?auto_6610 ?auto_6611 ) ) ( PERSON-AT ?auto_6604 ?auto_6611 ) ( AIRCRAFT-AT ?auto_6606 ?auto_6609 ) ( FUEL-LEVEL ?auto_6606 ?auto_6608 ) ( not ( = ?auto_6602 ?auto_6609 ) ) ( not ( = ?auto_6610 ?auto_6609 ) ) ( not ( = ?auto_6611 ?auto_6609 ) ) ( PERSON-AT ?auto_6603 ?auto_6609 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6603 ?auto_6605 ?auto_6602 )
      ( FLY-3PPL-VERIFY ?auto_6603 ?auto_6604 ?auto_6605 ?auto_6602 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6624 - PERSON
      ?auto_6625 - PERSON
      ?auto_6626 - PERSON
      ?auto_6623 - CITY
    )
    :vars
    (
      ?auto_6628 - FLEVEL
      ?auto_6629 - FLEVEL
      ?auto_6631 - CITY
      ?auto_6632 - CITY
      ?auto_6627 - AIRCRAFT
      ?auto_6630 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6628 ?auto_6629 ) ( not ( = ?auto_6623 ?auto_6631 ) ) ( not ( = ?auto_6629 ?auto_6628 ) ) ( not ( = ?auto_6624 ?auto_6625 ) ) ( PERSON-AT ?auto_6625 ?auto_6631 ) ( not ( = ?auto_6624 ?auto_6626 ) ) ( not ( = ?auto_6625 ?auto_6626 ) ) ( not ( = ?auto_6623 ?auto_6632 ) ) ( not ( = ?auto_6631 ?auto_6632 ) ) ( PERSON-AT ?auto_6626 ?auto_6632 ) ( AIRCRAFT-AT ?auto_6627 ?auto_6630 ) ( FUEL-LEVEL ?auto_6627 ?auto_6629 ) ( not ( = ?auto_6623 ?auto_6630 ) ) ( not ( = ?auto_6631 ?auto_6630 ) ) ( not ( = ?auto_6632 ?auto_6630 ) ) ( PERSON-AT ?auto_6624 ?auto_6630 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6624 ?auto_6625 ?auto_6623 )
      ( FLY-3PPL-VERIFY ?auto_6624 ?auto_6625 ?auto_6626 ?auto_6623 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6645 - PERSON
      ?auto_6646 - PERSON
      ?auto_6647 - PERSON
      ?auto_6644 - CITY
    )
    :vars
    (
      ?auto_6649 - FLEVEL
      ?auto_6650 - FLEVEL
      ?auto_6652 - CITY
      ?auto_6653 - CITY
      ?auto_6648 - AIRCRAFT
      ?auto_6651 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6649 ?auto_6650 ) ( not ( = ?auto_6644 ?auto_6652 ) ) ( not ( = ?auto_6650 ?auto_6649 ) ) ( not ( = ?auto_6646 ?auto_6647 ) ) ( PERSON-AT ?auto_6647 ?auto_6652 ) ( not ( = ?auto_6646 ?auto_6645 ) ) ( not ( = ?auto_6647 ?auto_6645 ) ) ( not ( = ?auto_6644 ?auto_6653 ) ) ( not ( = ?auto_6652 ?auto_6653 ) ) ( PERSON-AT ?auto_6645 ?auto_6653 ) ( AIRCRAFT-AT ?auto_6648 ?auto_6651 ) ( FUEL-LEVEL ?auto_6648 ?auto_6650 ) ( not ( = ?auto_6644 ?auto_6651 ) ) ( not ( = ?auto_6652 ?auto_6651 ) ) ( not ( = ?auto_6653 ?auto_6651 ) ) ( PERSON-AT ?auto_6646 ?auto_6651 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6646 ?auto_6647 ?auto_6644 )
      ( FLY-3PPL-VERIFY ?auto_6645 ?auto_6646 ?auto_6647 ?auto_6644 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6666 - PERSON
      ?auto_6667 - PERSON
      ?auto_6668 - PERSON
      ?auto_6665 - CITY
    )
    :vars
    (
      ?auto_6670 - FLEVEL
      ?auto_6671 - FLEVEL
      ?auto_6673 - CITY
      ?auto_6674 - CITY
      ?auto_6669 - AIRCRAFT
      ?auto_6672 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6670 ?auto_6671 ) ( not ( = ?auto_6665 ?auto_6673 ) ) ( not ( = ?auto_6671 ?auto_6670 ) ) ( not ( = ?auto_6668 ?auto_6667 ) ) ( PERSON-AT ?auto_6667 ?auto_6673 ) ( not ( = ?auto_6668 ?auto_6666 ) ) ( not ( = ?auto_6667 ?auto_6666 ) ) ( not ( = ?auto_6665 ?auto_6674 ) ) ( not ( = ?auto_6673 ?auto_6674 ) ) ( PERSON-AT ?auto_6666 ?auto_6674 ) ( AIRCRAFT-AT ?auto_6669 ?auto_6672 ) ( FUEL-LEVEL ?auto_6669 ?auto_6671 ) ( not ( = ?auto_6665 ?auto_6672 ) ) ( not ( = ?auto_6673 ?auto_6672 ) ) ( not ( = ?auto_6674 ?auto_6672 ) ) ( PERSON-AT ?auto_6668 ?auto_6672 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6668 ?auto_6667 ?auto_6665 )
      ( FLY-3PPL-VERIFY ?auto_6666 ?auto_6667 ?auto_6668 ?auto_6665 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6709 - PERSON
      ?auto_6710 - PERSON
      ?auto_6711 - PERSON
      ?auto_6708 - CITY
    )
    :vars
    (
      ?auto_6713 - FLEVEL
      ?auto_6714 - FLEVEL
      ?auto_6716 - CITY
      ?auto_6717 - CITY
      ?auto_6712 - AIRCRAFT
      ?auto_6715 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6713 ?auto_6714 ) ( not ( = ?auto_6708 ?auto_6716 ) ) ( not ( = ?auto_6714 ?auto_6713 ) ) ( not ( = ?auto_6710 ?auto_6709 ) ) ( PERSON-AT ?auto_6709 ?auto_6716 ) ( not ( = ?auto_6710 ?auto_6711 ) ) ( not ( = ?auto_6709 ?auto_6711 ) ) ( not ( = ?auto_6708 ?auto_6717 ) ) ( not ( = ?auto_6716 ?auto_6717 ) ) ( PERSON-AT ?auto_6711 ?auto_6717 ) ( AIRCRAFT-AT ?auto_6712 ?auto_6715 ) ( FUEL-LEVEL ?auto_6712 ?auto_6714 ) ( not ( = ?auto_6708 ?auto_6715 ) ) ( not ( = ?auto_6716 ?auto_6715 ) ) ( not ( = ?auto_6717 ?auto_6715 ) ) ( PERSON-AT ?auto_6710 ?auto_6715 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6710 ?auto_6709 ?auto_6708 )
      ( FLY-3PPL-VERIFY ?auto_6709 ?auto_6710 ?auto_6711 ?auto_6708 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6730 - PERSON
      ?auto_6731 - PERSON
      ?auto_6732 - PERSON
      ?auto_6729 - CITY
    )
    :vars
    (
      ?auto_6734 - FLEVEL
      ?auto_6735 - FLEVEL
      ?auto_6737 - CITY
      ?auto_6738 - CITY
      ?auto_6733 - AIRCRAFT
      ?auto_6736 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6734 ?auto_6735 ) ( not ( = ?auto_6729 ?auto_6737 ) ) ( not ( = ?auto_6735 ?auto_6734 ) ) ( not ( = ?auto_6732 ?auto_6730 ) ) ( PERSON-AT ?auto_6730 ?auto_6737 ) ( not ( = ?auto_6732 ?auto_6731 ) ) ( not ( = ?auto_6730 ?auto_6731 ) ) ( not ( = ?auto_6729 ?auto_6738 ) ) ( not ( = ?auto_6737 ?auto_6738 ) ) ( PERSON-AT ?auto_6731 ?auto_6738 ) ( AIRCRAFT-AT ?auto_6733 ?auto_6736 ) ( FUEL-LEVEL ?auto_6733 ?auto_6735 ) ( not ( = ?auto_6729 ?auto_6736 ) ) ( not ( = ?auto_6737 ?auto_6736 ) ) ( not ( = ?auto_6738 ?auto_6736 ) ) ( PERSON-AT ?auto_6732 ?auto_6736 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6732 ?auto_6730 ?auto_6729 )
      ( FLY-3PPL-VERIFY ?auto_6730 ?auto_6731 ?auto_6732 ?auto_6729 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_6796 - PERSON
      ?auto_6795 - CITY
    )
    :vars
    (
      ?auto_6798 - FLEVEL
      ?auto_6800 - FLEVEL
      ?auto_6802 - CITY
      ?auto_6804 - PERSON
      ?auto_6799 - PERSON
      ?auto_6803 - CITY
      ?auto_6797 - AIRCRAFT
      ?auto_6801 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6798 ?auto_6800 ) ( not ( = ?auto_6795 ?auto_6802 ) ) ( not ( = ?auto_6800 ?auto_6798 ) ) ( not ( = ?auto_6804 ?auto_6796 ) ) ( PERSON-AT ?auto_6796 ?auto_6802 ) ( not ( = ?auto_6804 ?auto_6799 ) ) ( not ( = ?auto_6796 ?auto_6799 ) ) ( not ( = ?auto_6795 ?auto_6803 ) ) ( not ( = ?auto_6802 ?auto_6803 ) ) ( PERSON-AT ?auto_6799 ?auto_6803 ) ( AIRCRAFT-AT ?auto_6797 ?auto_6801 ) ( not ( = ?auto_6795 ?auto_6801 ) ) ( not ( = ?auto_6802 ?auto_6801 ) ) ( not ( = ?auto_6803 ?auto_6801 ) ) ( PERSON-AT ?auto_6804 ?auto_6801 ) ( FUEL-LEVEL ?auto_6797 ?auto_6798 ) )
    :subtasks
    ( ( !REFUEL ?auto_6797 ?auto_6801 ?auto_6798 ?auto_6800 )
      ( FLY-2PPL ?auto_6804 ?auto_6796 ?auto_6795 )
      ( FLY-1PPL-VERIFY ?auto_6796 ?auto_6795 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_6806 - PERSON
      ?auto_6807 - PERSON
      ?auto_6805 - CITY
    )
    :vars
    (
      ?auto_6808 - FLEVEL
      ?auto_6813 - FLEVEL
      ?auto_6811 - CITY
      ?auto_6814 - PERSON
      ?auto_6810 - CITY
      ?auto_6809 - AIRCRAFT
      ?auto_6812 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6808 ?auto_6813 ) ( not ( = ?auto_6805 ?auto_6811 ) ) ( not ( = ?auto_6813 ?auto_6808 ) ) ( not ( = ?auto_6806 ?auto_6807 ) ) ( PERSON-AT ?auto_6807 ?auto_6811 ) ( not ( = ?auto_6806 ?auto_6814 ) ) ( not ( = ?auto_6807 ?auto_6814 ) ) ( not ( = ?auto_6805 ?auto_6810 ) ) ( not ( = ?auto_6811 ?auto_6810 ) ) ( PERSON-AT ?auto_6814 ?auto_6810 ) ( AIRCRAFT-AT ?auto_6809 ?auto_6812 ) ( not ( = ?auto_6805 ?auto_6812 ) ) ( not ( = ?auto_6811 ?auto_6812 ) ) ( not ( = ?auto_6810 ?auto_6812 ) ) ( PERSON-AT ?auto_6806 ?auto_6812 ) ( FUEL-LEVEL ?auto_6809 ?auto_6808 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_6807 ?auto_6805 )
      ( FLY-2PPL-VERIFY ?auto_6806 ?auto_6807 ?auto_6805 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_6816 - PERSON
      ?auto_6817 - PERSON
      ?auto_6815 - CITY
    )
    :vars
    (
      ?auto_6819 - FLEVEL
      ?auto_6818 - FLEVEL
      ?auto_6822 - CITY
      ?auto_6824 - PERSON
      ?auto_6823 - CITY
      ?auto_6821 - AIRCRAFT
      ?auto_6820 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6819 ?auto_6818 ) ( not ( = ?auto_6815 ?auto_6822 ) ) ( not ( = ?auto_6818 ?auto_6819 ) ) ( not ( = ?auto_6824 ?auto_6817 ) ) ( PERSON-AT ?auto_6817 ?auto_6822 ) ( not ( = ?auto_6824 ?auto_6816 ) ) ( not ( = ?auto_6817 ?auto_6816 ) ) ( not ( = ?auto_6815 ?auto_6823 ) ) ( not ( = ?auto_6822 ?auto_6823 ) ) ( PERSON-AT ?auto_6816 ?auto_6823 ) ( AIRCRAFT-AT ?auto_6821 ?auto_6820 ) ( not ( = ?auto_6815 ?auto_6820 ) ) ( not ( = ?auto_6822 ?auto_6820 ) ) ( not ( = ?auto_6823 ?auto_6820 ) ) ( PERSON-AT ?auto_6824 ?auto_6820 ) ( FUEL-LEVEL ?auto_6821 ?auto_6819 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6824 ?auto_6817 ?auto_6815 )
      ( FLY-2PPL-VERIFY ?auto_6816 ?auto_6817 ?auto_6815 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_6826 - PERSON
      ?auto_6827 - PERSON
      ?auto_6825 - CITY
    )
    :vars
    (
      ?auto_6829 - FLEVEL
      ?auto_6828 - FLEVEL
      ?auto_6833 - CITY
      ?auto_6831 - PERSON
      ?auto_6834 - CITY
      ?auto_6832 - AIRCRAFT
      ?auto_6830 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6829 ?auto_6828 ) ( not ( = ?auto_6825 ?auto_6833 ) ) ( not ( = ?auto_6828 ?auto_6829 ) ) ( not ( = ?auto_6827 ?auto_6826 ) ) ( PERSON-AT ?auto_6826 ?auto_6833 ) ( not ( = ?auto_6827 ?auto_6831 ) ) ( not ( = ?auto_6826 ?auto_6831 ) ) ( not ( = ?auto_6825 ?auto_6834 ) ) ( not ( = ?auto_6833 ?auto_6834 ) ) ( PERSON-AT ?auto_6831 ?auto_6834 ) ( AIRCRAFT-AT ?auto_6832 ?auto_6830 ) ( not ( = ?auto_6825 ?auto_6830 ) ) ( not ( = ?auto_6833 ?auto_6830 ) ) ( not ( = ?auto_6834 ?auto_6830 ) ) ( PERSON-AT ?auto_6827 ?auto_6830 ) ( FUEL-LEVEL ?auto_6832 ?auto_6829 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6827 ?auto_6826 ?auto_6825 )
      ( FLY-2PPL-VERIFY ?auto_6826 ?auto_6827 ?auto_6825 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_6836 - PERSON
      ?auto_6837 - PERSON
      ?auto_6835 - CITY
    )
    :vars
    (
      ?auto_6839 - FLEVEL
      ?auto_6838 - FLEVEL
      ?auto_6842 - CITY
      ?auto_6844 - PERSON
      ?auto_6843 - CITY
      ?auto_6841 - AIRCRAFT
      ?auto_6840 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6839 ?auto_6838 ) ( not ( = ?auto_6835 ?auto_6842 ) ) ( not ( = ?auto_6838 ?auto_6839 ) ) ( not ( = ?auto_6844 ?auto_6836 ) ) ( PERSON-AT ?auto_6836 ?auto_6842 ) ( not ( = ?auto_6844 ?auto_6837 ) ) ( not ( = ?auto_6836 ?auto_6837 ) ) ( not ( = ?auto_6835 ?auto_6843 ) ) ( not ( = ?auto_6842 ?auto_6843 ) ) ( PERSON-AT ?auto_6837 ?auto_6843 ) ( AIRCRAFT-AT ?auto_6841 ?auto_6840 ) ( not ( = ?auto_6835 ?auto_6840 ) ) ( not ( = ?auto_6842 ?auto_6840 ) ) ( not ( = ?auto_6843 ?auto_6840 ) ) ( PERSON-AT ?auto_6844 ?auto_6840 ) ( FUEL-LEVEL ?auto_6841 ?auto_6839 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6844 ?auto_6836 ?auto_6835 )
      ( FLY-2PPL-VERIFY ?auto_6836 ?auto_6837 ?auto_6835 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6868 - PERSON
      ?auto_6869 - PERSON
      ?auto_6870 - PERSON
      ?auto_6867 - CITY
    )
    :vars
    (
      ?auto_6872 - FLEVEL
      ?auto_6871 - FLEVEL
      ?auto_6875 - CITY
      ?auto_6876 - CITY
      ?auto_6874 - AIRCRAFT
      ?auto_6873 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6872 ?auto_6871 ) ( not ( = ?auto_6867 ?auto_6875 ) ) ( not ( = ?auto_6871 ?auto_6872 ) ) ( not ( = ?auto_6868 ?auto_6870 ) ) ( PERSON-AT ?auto_6870 ?auto_6875 ) ( not ( = ?auto_6868 ?auto_6869 ) ) ( not ( = ?auto_6870 ?auto_6869 ) ) ( not ( = ?auto_6867 ?auto_6876 ) ) ( not ( = ?auto_6875 ?auto_6876 ) ) ( PERSON-AT ?auto_6869 ?auto_6876 ) ( AIRCRAFT-AT ?auto_6874 ?auto_6873 ) ( not ( = ?auto_6867 ?auto_6873 ) ) ( not ( = ?auto_6875 ?auto_6873 ) ) ( not ( = ?auto_6876 ?auto_6873 ) ) ( PERSON-AT ?auto_6868 ?auto_6873 ) ( FUEL-LEVEL ?auto_6874 ?auto_6872 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6868 ?auto_6870 ?auto_6867 )
      ( FLY-3PPL-VERIFY ?auto_6868 ?auto_6869 ?auto_6870 ?auto_6867 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6889 - PERSON
      ?auto_6890 - PERSON
      ?auto_6891 - PERSON
      ?auto_6888 - CITY
    )
    :vars
    (
      ?auto_6893 - FLEVEL
      ?auto_6892 - FLEVEL
      ?auto_6896 - CITY
      ?auto_6897 - CITY
      ?auto_6895 - AIRCRAFT
      ?auto_6894 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6893 ?auto_6892 ) ( not ( = ?auto_6888 ?auto_6896 ) ) ( not ( = ?auto_6892 ?auto_6893 ) ) ( not ( = ?auto_6889 ?auto_6890 ) ) ( PERSON-AT ?auto_6890 ?auto_6896 ) ( not ( = ?auto_6889 ?auto_6891 ) ) ( not ( = ?auto_6890 ?auto_6891 ) ) ( not ( = ?auto_6888 ?auto_6897 ) ) ( not ( = ?auto_6896 ?auto_6897 ) ) ( PERSON-AT ?auto_6891 ?auto_6897 ) ( AIRCRAFT-AT ?auto_6895 ?auto_6894 ) ( not ( = ?auto_6888 ?auto_6894 ) ) ( not ( = ?auto_6896 ?auto_6894 ) ) ( not ( = ?auto_6897 ?auto_6894 ) ) ( PERSON-AT ?auto_6889 ?auto_6894 ) ( FUEL-LEVEL ?auto_6895 ?auto_6893 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6889 ?auto_6890 ?auto_6888 )
      ( FLY-3PPL-VERIFY ?auto_6889 ?auto_6890 ?auto_6891 ?auto_6888 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6910 - PERSON
      ?auto_6911 - PERSON
      ?auto_6912 - PERSON
      ?auto_6909 - CITY
    )
    :vars
    (
      ?auto_6914 - FLEVEL
      ?auto_6913 - FLEVEL
      ?auto_6917 - CITY
      ?auto_6918 - CITY
      ?auto_6916 - AIRCRAFT
      ?auto_6915 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6914 ?auto_6913 ) ( not ( = ?auto_6909 ?auto_6917 ) ) ( not ( = ?auto_6913 ?auto_6914 ) ) ( not ( = ?auto_6911 ?auto_6912 ) ) ( PERSON-AT ?auto_6912 ?auto_6917 ) ( not ( = ?auto_6911 ?auto_6910 ) ) ( not ( = ?auto_6912 ?auto_6910 ) ) ( not ( = ?auto_6909 ?auto_6918 ) ) ( not ( = ?auto_6917 ?auto_6918 ) ) ( PERSON-AT ?auto_6910 ?auto_6918 ) ( AIRCRAFT-AT ?auto_6916 ?auto_6915 ) ( not ( = ?auto_6909 ?auto_6915 ) ) ( not ( = ?auto_6917 ?auto_6915 ) ) ( not ( = ?auto_6918 ?auto_6915 ) ) ( PERSON-AT ?auto_6911 ?auto_6915 ) ( FUEL-LEVEL ?auto_6916 ?auto_6914 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6911 ?auto_6912 ?auto_6909 )
      ( FLY-3PPL-VERIFY ?auto_6910 ?auto_6911 ?auto_6912 ?auto_6909 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6931 - PERSON
      ?auto_6932 - PERSON
      ?auto_6933 - PERSON
      ?auto_6930 - CITY
    )
    :vars
    (
      ?auto_6935 - FLEVEL
      ?auto_6934 - FLEVEL
      ?auto_6938 - CITY
      ?auto_6939 - CITY
      ?auto_6937 - AIRCRAFT
      ?auto_6936 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6935 ?auto_6934 ) ( not ( = ?auto_6930 ?auto_6938 ) ) ( not ( = ?auto_6934 ?auto_6935 ) ) ( not ( = ?auto_6933 ?auto_6932 ) ) ( PERSON-AT ?auto_6932 ?auto_6938 ) ( not ( = ?auto_6933 ?auto_6931 ) ) ( not ( = ?auto_6932 ?auto_6931 ) ) ( not ( = ?auto_6930 ?auto_6939 ) ) ( not ( = ?auto_6938 ?auto_6939 ) ) ( PERSON-AT ?auto_6931 ?auto_6939 ) ( AIRCRAFT-AT ?auto_6937 ?auto_6936 ) ( not ( = ?auto_6930 ?auto_6936 ) ) ( not ( = ?auto_6938 ?auto_6936 ) ) ( not ( = ?auto_6939 ?auto_6936 ) ) ( PERSON-AT ?auto_6933 ?auto_6936 ) ( FUEL-LEVEL ?auto_6937 ?auto_6935 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6933 ?auto_6932 ?auto_6930 )
      ( FLY-3PPL-VERIFY ?auto_6931 ?auto_6932 ?auto_6933 ?auto_6930 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6974 - PERSON
      ?auto_6975 - PERSON
      ?auto_6976 - PERSON
      ?auto_6973 - CITY
    )
    :vars
    (
      ?auto_6978 - FLEVEL
      ?auto_6977 - FLEVEL
      ?auto_6981 - CITY
      ?auto_6982 - CITY
      ?auto_6980 - AIRCRAFT
      ?auto_6979 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6978 ?auto_6977 ) ( not ( = ?auto_6973 ?auto_6981 ) ) ( not ( = ?auto_6977 ?auto_6978 ) ) ( not ( = ?auto_6975 ?auto_6974 ) ) ( PERSON-AT ?auto_6974 ?auto_6981 ) ( not ( = ?auto_6975 ?auto_6976 ) ) ( not ( = ?auto_6974 ?auto_6976 ) ) ( not ( = ?auto_6973 ?auto_6982 ) ) ( not ( = ?auto_6981 ?auto_6982 ) ) ( PERSON-AT ?auto_6976 ?auto_6982 ) ( AIRCRAFT-AT ?auto_6980 ?auto_6979 ) ( not ( = ?auto_6973 ?auto_6979 ) ) ( not ( = ?auto_6981 ?auto_6979 ) ) ( not ( = ?auto_6982 ?auto_6979 ) ) ( PERSON-AT ?auto_6975 ?auto_6979 ) ( FUEL-LEVEL ?auto_6980 ?auto_6978 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6975 ?auto_6974 ?auto_6973 )
      ( FLY-3PPL-VERIFY ?auto_6974 ?auto_6975 ?auto_6976 ?auto_6973 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_6995 - PERSON
      ?auto_6996 - PERSON
      ?auto_6997 - PERSON
      ?auto_6994 - CITY
    )
    :vars
    (
      ?auto_6999 - FLEVEL
      ?auto_6998 - FLEVEL
      ?auto_7002 - CITY
      ?auto_7003 - CITY
      ?auto_7001 - AIRCRAFT
      ?auto_7000 - CITY
    )
    :precondition
    ( and ( NEXT ?auto_6999 ?auto_6998 ) ( not ( = ?auto_6994 ?auto_7002 ) ) ( not ( = ?auto_6998 ?auto_6999 ) ) ( not ( = ?auto_6997 ?auto_6995 ) ) ( PERSON-AT ?auto_6995 ?auto_7002 ) ( not ( = ?auto_6997 ?auto_6996 ) ) ( not ( = ?auto_6995 ?auto_6996 ) ) ( not ( = ?auto_6994 ?auto_7003 ) ) ( not ( = ?auto_7002 ?auto_7003 ) ) ( PERSON-AT ?auto_6996 ?auto_7003 ) ( AIRCRAFT-AT ?auto_7001 ?auto_7000 ) ( not ( = ?auto_6994 ?auto_7000 ) ) ( not ( = ?auto_7002 ?auto_7000 ) ) ( not ( = ?auto_7003 ?auto_7000 ) ) ( PERSON-AT ?auto_6997 ?auto_7000 ) ( FUEL-LEVEL ?auto_7001 ?auto_6999 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_6997 ?auto_6995 ?auto_6994 )
      ( FLY-3PPL-VERIFY ?auto_6995 ?auto_6996 ?auto_6997 ?auto_6994 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_7061 - PERSON
      ?auto_7060 - CITY
    )
    :vars
    (
      ?auto_7063 - FLEVEL
      ?auto_7062 - FLEVEL
      ?auto_7067 - CITY
      ?auto_7069 - PERSON
      ?auto_7065 - PERSON
      ?auto_7068 - CITY
      ?auto_7064 - CITY
      ?auto_7066 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7063 ?auto_7062 ) ( not ( = ?auto_7060 ?auto_7067 ) ) ( not ( = ?auto_7062 ?auto_7063 ) ) ( not ( = ?auto_7069 ?auto_7061 ) ) ( PERSON-AT ?auto_7061 ?auto_7067 ) ( not ( = ?auto_7069 ?auto_7065 ) ) ( not ( = ?auto_7061 ?auto_7065 ) ) ( not ( = ?auto_7060 ?auto_7068 ) ) ( not ( = ?auto_7067 ?auto_7068 ) ) ( PERSON-AT ?auto_7065 ?auto_7068 ) ( not ( = ?auto_7060 ?auto_7064 ) ) ( not ( = ?auto_7067 ?auto_7064 ) ) ( not ( = ?auto_7068 ?auto_7064 ) ) ( PERSON-AT ?auto_7069 ?auto_7064 ) ( AIRCRAFT-AT ?auto_7066 ?auto_7060 ) ( FUEL-LEVEL ?auto_7066 ?auto_7062 ) )
    :subtasks
    ( ( !FLY ?auto_7066 ?auto_7060 ?auto_7064 ?auto_7062 ?auto_7063 )
      ( FLY-2PPL ?auto_7069 ?auto_7061 ?auto_7060 )
      ( FLY-1PPL-VERIFY ?auto_7061 ?auto_7060 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7071 - PERSON
      ?auto_7072 - PERSON
      ?auto_7070 - CITY
    )
    :vars
    (
      ?auto_7076 - FLEVEL
      ?auto_7074 - FLEVEL
      ?auto_7078 - CITY
      ?auto_7075 - PERSON
      ?auto_7079 - CITY
      ?auto_7077 - CITY
      ?auto_7073 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7076 ?auto_7074 ) ( not ( = ?auto_7070 ?auto_7078 ) ) ( not ( = ?auto_7074 ?auto_7076 ) ) ( not ( = ?auto_7071 ?auto_7072 ) ) ( PERSON-AT ?auto_7072 ?auto_7078 ) ( not ( = ?auto_7071 ?auto_7075 ) ) ( not ( = ?auto_7072 ?auto_7075 ) ) ( not ( = ?auto_7070 ?auto_7079 ) ) ( not ( = ?auto_7078 ?auto_7079 ) ) ( PERSON-AT ?auto_7075 ?auto_7079 ) ( not ( = ?auto_7070 ?auto_7077 ) ) ( not ( = ?auto_7078 ?auto_7077 ) ) ( not ( = ?auto_7079 ?auto_7077 ) ) ( PERSON-AT ?auto_7071 ?auto_7077 ) ( AIRCRAFT-AT ?auto_7073 ?auto_7070 ) ( FUEL-LEVEL ?auto_7073 ?auto_7074 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_7072 ?auto_7070 )
      ( FLY-2PPL-VERIFY ?auto_7071 ?auto_7072 ?auto_7070 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7081 - PERSON
      ?auto_7082 - PERSON
      ?auto_7080 - CITY
    )
    :vars
    (
      ?auto_7083 - FLEVEL
      ?auto_7084 - FLEVEL
      ?auto_7088 - CITY
      ?auto_7089 - PERSON
      ?auto_7086 - CITY
      ?auto_7085 - CITY
      ?auto_7087 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7083 ?auto_7084 ) ( not ( = ?auto_7080 ?auto_7088 ) ) ( not ( = ?auto_7084 ?auto_7083 ) ) ( not ( = ?auto_7089 ?auto_7082 ) ) ( PERSON-AT ?auto_7082 ?auto_7088 ) ( not ( = ?auto_7089 ?auto_7081 ) ) ( not ( = ?auto_7082 ?auto_7081 ) ) ( not ( = ?auto_7080 ?auto_7086 ) ) ( not ( = ?auto_7088 ?auto_7086 ) ) ( PERSON-AT ?auto_7081 ?auto_7086 ) ( not ( = ?auto_7080 ?auto_7085 ) ) ( not ( = ?auto_7088 ?auto_7085 ) ) ( not ( = ?auto_7086 ?auto_7085 ) ) ( PERSON-AT ?auto_7089 ?auto_7085 ) ( AIRCRAFT-AT ?auto_7087 ?auto_7080 ) ( FUEL-LEVEL ?auto_7087 ?auto_7084 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7089 ?auto_7082 ?auto_7080 )
      ( FLY-2PPL-VERIFY ?auto_7081 ?auto_7082 ?auto_7080 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7091 - PERSON
      ?auto_7092 - PERSON
      ?auto_7090 - CITY
    )
    :vars
    (
      ?auto_7093 - FLEVEL
      ?auto_7094 - FLEVEL
      ?auto_7099 - CITY
      ?auto_7097 - PERSON
      ?auto_7096 - CITY
      ?auto_7095 - CITY
      ?auto_7098 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7093 ?auto_7094 ) ( not ( = ?auto_7090 ?auto_7099 ) ) ( not ( = ?auto_7094 ?auto_7093 ) ) ( not ( = ?auto_7092 ?auto_7091 ) ) ( PERSON-AT ?auto_7091 ?auto_7099 ) ( not ( = ?auto_7092 ?auto_7097 ) ) ( not ( = ?auto_7091 ?auto_7097 ) ) ( not ( = ?auto_7090 ?auto_7096 ) ) ( not ( = ?auto_7099 ?auto_7096 ) ) ( PERSON-AT ?auto_7097 ?auto_7096 ) ( not ( = ?auto_7090 ?auto_7095 ) ) ( not ( = ?auto_7099 ?auto_7095 ) ) ( not ( = ?auto_7096 ?auto_7095 ) ) ( PERSON-AT ?auto_7092 ?auto_7095 ) ( AIRCRAFT-AT ?auto_7098 ?auto_7090 ) ( FUEL-LEVEL ?auto_7098 ?auto_7094 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7092 ?auto_7091 ?auto_7090 )
      ( FLY-2PPL-VERIFY ?auto_7091 ?auto_7092 ?auto_7090 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7101 - PERSON
      ?auto_7102 - PERSON
      ?auto_7100 - CITY
    )
    :vars
    (
      ?auto_7103 - FLEVEL
      ?auto_7104 - FLEVEL
      ?auto_7108 - CITY
      ?auto_7109 - PERSON
      ?auto_7106 - CITY
      ?auto_7105 - CITY
      ?auto_7107 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7103 ?auto_7104 ) ( not ( = ?auto_7100 ?auto_7108 ) ) ( not ( = ?auto_7104 ?auto_7103 ) ) ( not ( = ?auto_7109 ?auto_7101 ) ) ( PERSON-AT ?auto_7101 ?auto_7108 ) ( not ( = ?auto_7109 ?auto_7102 ) ) ( not ( = ?auto_7101 ?auto_7102 ) ) ( not ( = ?auto_7100 ?auto_7106 ) ) ( not ( = ?auto_7108 ?auto_7106 ) ) ( PERSON-AT ?auto_7102 ?auto_7106 ) ( not ( = ?auto_7100 ?auto_7105 ) ) ( not ( = ?auto_7108 ?auto_7105 ) ) ( not ( = ?auto_7106 ?auto_7105 ) ) ( PERSON-AT ?auto_7109 ?auto_7105 ) ( AIRCRAFT-AT ?auto_7107 ?auto_7100 ) ( FUEL-LEVEL ?auto_7107 ?auto_7104 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7109 ?auto_7101 ?auto_7100 )
      ( FLY-2PPL-VERIFY ?auto_7101 ?auto_7102 ?auto_7100 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7133 - PERSON
      ?auto_7134 - PERSON
      ?auto_7135 - PERSON
      ?auto_7132 - CITY
    )
    :vars
    (
      ?auto_7136 - FLEVEL
      ?auto_7137 - FLEVEL
      ?auto_7141 - CITY
      ?auto_7139 - CITY
      ?auto_7138 - CITY
      ?auto_7140 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7136 ?auto_7137 ) ( not ( = ?auto_7132 ?auto_7141 ) ) ( not ( = ?auto_7137 ?auto_7136 ) ) ( not ( = ?auto_7133 ?auto_7135 ) ) ( PERSON-AT ?auto_7135 ?auto_7141 ) ( not ( = ?auto_7133 ?auto_7134 ) ) ( not ( = ?auto_7135 ?auto_7134 ) ) ( not ( = ?auto_7132 ?auto_7139 ) ) ( not ( = ?auto_7141 ?auto_7139 ) ) ( PERSON-AT ?auto_7134 ?auto_7139 ) ( not ( = ?auto_7132 ?auto_7138 ) ) ( not ( = ?auto_7141 ?auto_7138 ) ) ( not ( = ?auto_7139 ?auto_7138 ) ) ( PERSON-AT ?auto_7133 ?auto_7138 ) ( AIRCRAFT-AT ?auto_7140 ?auto_7132 ) ( FUEL-LEVEL ?auto_7140 ?auto_7137 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7133 ?auto_7135 ?auto_7132 )
      ( FLY-3PPL-VERIFY ?auto_7133 ?auto_7134 ?auto_7135 ?auto_7132 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7154 - PERSON
      ?auto_7155 - PERSON
      ?auto_7156 - PERSON
      ?auto_7153 - CITY
    )
    :vars
    (
      ?auto_7157 - FLEVEL
      ?auto_7158 - FLEVEL
      ?auto_7162 - CITY
      ?auto_7160 - CITY
      ?auto_7159 - CITY
      ?auto_7161 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7157 ?auto_7158 ) ( not ( = ?auto_7153 ?auto_7162 ) ) ( not ( = ?auto_7158 ?auto_7157 ) ) ( not ( = ?auto_7154 ?auto_7155 ) ) ( PERSON-AT ?auto_7155 ?auto_7162 ) ( not ( = ?auto_7154 ?auto_7156 ) ) ( not ( = ?auto_7155 ?auto_7156 ) ) ( not ( = ?auto_7153 ?auto_7160 ) ) ( not ( = ?auto_7162 ?auto_7160 ) ) ( PERSON-AT ?auto_7156 ?auto_7160 ) ( not ( = ?auto_7153 ?auto_7159 ) ) ( not ( = ?auto_7162 ?auto_7159 ) ) ( not ( = ?auto_7160 ?auto_7159 ) ) ( PERSON-AT ?auto_7154 ?auto_7159 ) ( AIRCRAFT-AT ?auto_7161 ?auto_7153 ) ( FUEL-LEVEL ?auto_7161 ?auto_7158 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7154 ?auto_7155 ?auto_7153 )
      ( FLY-3PPL-VERIFY ?auto_7154 ?auto_7155 ?auto_7156 ?auto_7153 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7175 - PERSON
      ?auto_7176 - PERSON
      ?auto_7177 - PERSON
      ?auto_7174 - CITY
    )
    :vars
    (
      ?auto_7178 - FLEVEL
      ?auto_7179 - FLEVEL
      ?auto_7183 - CITY
      ?auto_7181 - CITY
      ?auto_7180 - CITY
      ?auto_7182 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7178 ?auto_7179 ) ( not ( = ?auto_7174 ?auto_7183 ) ) ( not ( = ?auto_7179 ?auto_7178 ) ) ( not ( = ?auto_7176 ?auto_7177 ) ) ( PERSON-AT ?auto_7177 ?auto_7183 ) ( not ( = ?auto_7176 ?auto_7175 ) ) ( not ( = ?auto_7177 ?auto_7175 ) ) ( not ( = ?auto_7174 ?auto_7181 ) ) ( not ( = ?auto_7183 ?auto_7181 ) ) ( PERSON-AT ?auto_7175 ?auto_7181 ) ( not ( = ?auto_7174 ?auto_7180 ) ) ( not ( = ?auto_7183 ?auto_7180 ) ) ( not ( = ?auto_7181 ?auto_7180 ) ) ( PERSON-AT ?auto_7176 ?auto_7180 ) ( AIRCRAFT-AT ?auto_7182 ?auto_7174 ) ( FUEL-LEVEL ?auto_7182 ?auto_7179 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7176 ?auto_7177 ?auto_7174 )
      ( FLY-3PPL-VERIFY ?auto_7175 ?auto_7176 ?auto_7177 ?auto_7174 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7196 - PERSON
      ?auto_7197 - PERSON
      ?auto_7198 - PERSON
      ?auto_7195 - CITY
    )
    :vars
    (
      ?auto_7199 - FLEVEL
      ?auto_7200 - FLEVEL
      ?auto_7204 - CITY
      ?auto_7202 - CITY
      ?auto_7201 - CITY
      ?auto_7203 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7199 ?auto_7200 ) ( not ( = ?auto_7195 ?auto_7204 ) ) ( not ( = ?auto_7200 ?auto_7199 ) ) ( not ( = ?auto_7198 ?auto_7197 ) ) ( PERSON-AT ?auto_7197 ?auto_7204 ) ( not ( = ?auto_7198 ?auto_7196 ) ) ( not ( = ?auto_7197 ?auto_7196 ) ) ( not ( = ?auto_7195 ?auto_7202 ) ) ( not ( = ?auto_7204 ?auto_7202 ) ) ( PERSON-AT ?auto_7196 ?auto_7202 ) ( not ( = ?auto_7195 ?auto_7201 ) ) ( not ( = ?auto_7204 ?auto_7201 ) ) ( not ( = ?auto_7202 ?auto_7201 ) ) ( PERSON-AT ?auto_7198 ?auto_7201 ) ( AIRCRAFT-AT ?auto_7203 ?auto_7195 ) ( FUEL-LEVEL ?auto_7203 ?auto_7200 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7198 ?auto_7197 ?auto_7195 )
      ( FLY-3PPL-VERIFY ?auto_7196 ?auto_7197 ?auto_7198 ?auto_7195 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7239 - PERSON
      ?auto_7240 - PERSON
      ?auto_7241 - PERSON
      ?auto_7238 - CITY
    )
    :vars
    (
      ?auto_7242 - FLEVEL
      ?auto_7243 - FLEVEL
      ?auto_7247 - CITY
      ?auto_7245 - CITY
      ?auto_7244 - CITY
      ?auto_7246 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7242 ?auto_7243 ) ( not ( = ?auto_7238 ?auto_7247 ) ) ( not ( = ?auto_7243 ?auto_7242 ) ) ( not ( = ?auto_7240 ?auto_7239 ) ) ( PERSON-AT ?auto_7239 ?auto_7247 ) ( not ( = ?auto_7240 ?auto_7241 ) ) ( not ( = ?auto_7239 ?auto_7241 ) ) ( not ( = ?auto_7238 ?auto_7245 ) ) ( not ( = ?auto_7247 ?auto_7245 ) ) ( PERSON-AT ?auto_7241 ?auto_7245 ) ( not ( = ?auto_7238 ?auto_7244 ) ) ( not ( = ?auto_7247 ?auto_7244 ) ) ( not ( = ?auto_7245 ?auto_7244 ) ) ( PERSON-AT ?auto_7240 ?auto_7244 ) ( AIRCRAFT-AT ?auto_7246 ?auto_7238 ) ( FUEL-LEVEL ?auto_7246 ?auto_7243 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7240 ?auto_7239 ?auto_7238 )
      ( FLY-3PPL-VERIFY ?auto_7239 ?auto_7240 ?auto_7241 ?auto_7238 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7260 - PERSON
      ?auto_7261 - PERSON
      ?auto_7262 - PERSON
      ?auto_7259 - CITY
    )
    :vars
    (
      ?auto_7263 - FLEVEL
      ?auto_7264 - FLEVEL
      ?auto_7268 - CITY
      ?auto_7266 - CITY
      ?auto_7265 - CITY
      ?auto_7267 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7263 ?auto_7264 ) ( not ( = ?auto_7259 ?auto_7268 ) ) ( not ( = ?auto_7264 ?auto_7263 ) ) ( not ( = ?auto_7262 ?auto_7260 ) ) ( PERSON-AT ?auto_7260 ?auto_7268 ) ( not ( = ?auto_7262 ?auto_7261 ) ) ( not ( = ?auto_7260 ?auto_7261 ) ) ( not ( = ?auto_7259 ?auto_7266 ) ) ( not ( = ?auto_7268 ?auto_7266 ) ) ( PERSON-AT ?auto_7261 ?auto_7266 ) ( not ( = ?auto_7259 ?auto_7265 ) ) ( not ( = ?auto_7268 ?auto_7265 ) ) ( not ( = ?auto_7266 ?auto_7265 ) ) ( PERSON-AT ?auto_7262 ?auto_7265 ) ( AIRCRAFT-AT ?auto_7267 ?auto_7259 ) ( FUEL-LEVEL ?auto_7267 ?auto_7264 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7262 ?auto_7260 ?auto_7259 )
      ( FLY-3PPL-VERIFY ?auto_7260 ?auto_7261 ?auto_7262 ?auto_7259 ) )
  )

  ( :method FLY-1PPL
    :parameters
    (
      ?auto_7326 - PERSON
      ?auto_7325 - CITY
    )
    :vars
    (
      ?auto_7327 - FLEVEL
      ?auto_7328 - FLEVEL
      ?auto_7333 - CITY
      ?auto_7334 - PERSON
      ?auto_7331 - PERSON
      ?auto_7330 - CITY
      ?auto_7329 - CITY
      ?auto_7332 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7327 ?auto_7328 ) ( not ( = ?auto_7325 ?auto_7333 ) ) ( not ( = ?auto_7328 ?auto_7327 ) ) ( not ( = ?auto_7334 ?auto_7326 ) ) ( PERSON-AT ?auto_7326 ?auto_7333 ) ( not ( = ?auto_7334 ?auto_7331 ) ) ( not ( = ?auto_7326 ?auto_7331 ) ) ( not ( = ?auto_7325 ?auto_7330 ) ) ( not ( = ?auto_7333 ?auto_7330 ) ) ( PERSON-AT ?auto_7331 ?auto_7330 ) ( not ( = ?auto_7325 ?auto_7329 ) ) ( not ( = ?auto_7333 ?auto_7329 ) ) ( not ( = ?auto_7330 ?auto_7329 ) ) ( PERSON-AT ?auto_7334 ?auto_7329 ) ( AIRCRAFT-AT ?auto_7332 ?auto_7325 ) ( FUEL-LEVEL ?auto_7332 ?auto_7327 ) )
    :subtasks
    ( ( !REFUEL ?auto_7332 ?auto_7325 ?auto_7327 ?auto_7328 )
      ( FLY-2PPL ?auto_7334 ?auto_7326 ?auto_7325 )
      ( FLY-1PPL-VERIFY ?auto_7326 ?auto_7325 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7336 - PERSON
      ?auto_7337 - PERSON
      ?auto_7335 - CITY
    )
    :vars
    (
      ?auto_7340 - FLEVEL
      ?auto_7338 - FLEVEL
      ?auto_7344 - CITY
      ?auto_7342 - PERSON
      ?auto_7339 - CITY
      ?auto_7343 - CITY
      ?auto_7341 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7340 ?auto_7338 ) ( not ( = ?auto_7335 ?auto_7344 ) ) ( not ( = ?auto_7338 ?auto_7340 ) ) ( not ( = ?auto_7336 ?auto_7337 ) ) ( PERSON-AT ?auto_7337 ?auto_7344 ) ( not ( = ?auto_7336 ?auto_7342 ) ) ( not ( = ?auto_7337 ?auto_7342 ) ) ( not ( = ?auto_7335 ?auto_7339 ) ) ( not ( = ?auto_7344 ?auto_7339 ) ) ( PERSON-AT ?auto_7342 ?auto_7339 ) ( not ( = ?auto_7335 ?auto_7343 ) ) ( not ( = ?auto_7344 ?auto_7343 ) ) ( not ( = ?auto_7339 ?auto_7343 ) ) ( PERSON-AT ?auto_7336 ?auto_7343 ) ( AIRCRAFT-AT ?auto_7341 ?auto_7335 ) ( FUEL-LEVEL ?auto_7341 ?auto_7340 ) )
    :subtasks
    ( ( FLY-1PPL ?auto_7337 ?auto_7335 )
      ( FLY-2PPL-VERIFY ?auto_7336 ?auto_7337 ?auto_7335 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7346 - PERSON
      ?auto_7347 - PERSON
      ?auto_7345 - CITY
    )
    :vars
    (
      ?auto_7352 - FLEVEL
      ?auto_7351 - FLEVEL
      ?auto_7348 - CITY
      ?auto_7354 - PERSON
      ?auto_7350 - CITY
      ?auto_7349 - CITY
      ?auto_7353 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7352 ?auto_7351 ) ( not ( = ?auto_7345 ?auto_7348 ) ) ( not ( = ?auto_7351 ?auto_7352 ) ) ( not ( = ?auto_7354 ?auto_7347 ) ) ( PERSON-AT ?auto_7347 ?auto_7348 ) ( not ( = ?auto_7354 ?auto_7346 ) ) ( not ( = ?auto_7347 ?auto_7346 ) ) ( not ( = ?auto_7345 ?auto_7350 ) ) ( not ( = ?auto_7348 ?auto_7350 ) ) ( PERSON-AT ?auto_7346 ?auto_7350 ) ( not ( = ?auto_7345 ?auto_7349 ) ) ( not ( = ?auto_7348 ?auto_7349 ) ) ( not ( = ?auto_7350 ?auto_7349 ) ) ( PERSON-AT ?auto_7354 ?auto_7349 ) ( AIRCRAFT-AT ?auto_7353 ?auto_7345 ) ( FUEL-LEVEL ?auto_7353 ?auto_7352 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7354 ?auto_7347 ?auto_7345 )
      ( FLY-2PPL-VERIFY ?auto_7346 ?auto_7347 ?auto_7345 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7356 - PERSON
      ?auto_7357 - PERSON
      ?auto_7355 - CITY
    )
    :vars
    (
      ?auto_7362 - FLEVEL
      ?auto_7361 - FLEVEL
      ?auto_7358 - CITY
      ?auto_7363 - PERSON
      ?auto_7360 - CITY
      ?auto_7359 - CITY
      ?auto_7364 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7362 ?auto_7361 ) ( not ( = ?auto_7355 ?auto_7358 ) ) ( not ( = ?auto_7361 ?auto_7362 ) ) ( not ( = ?auto_7357 ?auto_7356 ) ) ( PERSON-AT ?auto_7356 ?auto_7358 ) ( not ( = ?auto_7357 ?auto_7363 ) ) ( not ( = ?auto_7356 ?auto_7363 ) ) ( not ( = ?auto_7355 ?auto_7360 ) ) ( not ( = ?auto_7358 ?auto_7360 ) ) ( PERSON-AT ?auto_7363 ?auto_7360 ) ( not ( = ?auto_7355 ?auto_7359 ) ) ( not ( = ?auto_7358 ?auto_7359 ) ) ( not ( = ?auto_7360 ?auto_7359 ) ) ( PERSON-AT ?auto_7357 ?auto_7359 ) ( AIRCRAFT-AT ?auto_7364 ?auto_7355 ) ( FUEL-LEVEL ?auto_7364 ?auto_7362 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7357 ?auto_7356 ?auto_7355 )
      ( FLY-2PPL-VERIFY ?auto_7356 ?auto_7357 ?auto_7355 ) )
  )

  ( :method FLY-2PPL
    :parameters
    (
      ?auto_7366 - PERSON
      ?auto_7367 - PERSON
      ?auto_7365 - CITY
    )
    :vars
    (
      ?auto_7372 - FLEVEL
      ?auto_7371 - FLEVEL
      ?auto_7368 - CITY
      ?auto_7374 - PERSON
      ?auto_7370 - CITY
      ?auto_7369 - CITY
      ?auto_7373 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7372 ?auto_7371 ) ( not ( = ?auto_7365 ?auto_7368 ) ) ( not ( = ?auto_7371 ?auto_7372 ) ) ( not ( = ?auto_7374 ?auto_7366 ) ) ( PERSON-AT ?auto_7366 ?auto_7368 ) ( not ( = ?auto_7374 ?auto_7367 ) ) ( not ( = ?auto_7366 ?auto_7367 ) ) ( not ( = ?auto_7365 ?auto_7370 ) ) ( not ( = ?auto_7368 ?auto_7370 ) ) ( PERSON-AT ?auto_7367 ?auto_7370 ) ( not ( = ?auto_7365 ?auto_7369 ) ) ( not ( = ?auto_7368 ?auto_7369 ) ) ( not ( = ?auto_7370 ?auto_7369 ) ) ( PERSON-AT ?auto_7374 ?auto_7369 ) ( AIRCRAFT-AT ?auto_7373 ?auto_7365 ) ( FUEL-LEVEL ?auto_7373 ?auto_7372 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7374 ?auto_7366 ?auto_7365 )
      ( FLY-2PPL-VERIFY ?auto_7366 ?auto_7367 ?auto_7365 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7398 - PERSON
      ?auto_7399 - PERSON
      ?auto_7400 - PERSON
      ?auto_7397 - CITY
    )
    :vars
    (
      ?auto_7405 - FLEVEL
      ?auto_7404 - FLEVEL
      ?auto_7401 - CITY
      ?auto_7403 - CITY
      ?auto_7402 - CITY
      ?auto_7406 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7405 ?auto_7404 ) ( not ( = ?auto_7397 ?auto_7401 ) ) ( not ( = ?auto_7404 ?auto_7405 ) ) ( not ( = ?auto_7398 ?auto_7400 ) ) ( PERSON-AT ?auto_7400 ?auto_7401 ) ( not ( = ?auto_7398 ?auto_7399 ) ) ( not ( = ?auto_7400 ?auto_7399 ) ) ( not ( = ?auto_7397 ?auto_7403 ) ) ( not ( = ?auto_7401 ?auto_7403 ) ) ( PERSON-AT ?auto_7399 ?auto_7403 ) ( not ( = ?auto_7397 ?auto_7402 ) ) ( not ( = ?auto_7401 ?auto_7402 ) ) ( not ( = ?auto_7403 ?auto_7402 ) ) ( PERSON-AT ?auto_7398 ?auto_7402 ) ( AIRCRAFT-AT ?auto_7406 ?auto_7397 ) ( FUEL-LEVEL ?auto_7406 ?auto_7405 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7398 ?auto_7400 ?auto_7397 )
      ( FLY-3PPL-VERIFY ?auto_7398 ?auto_7399 ?auto_7400 ?auto_7397 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7419 - PERSON
      ?auto_7420 - PERSON
      ?auto_7421 - PERSON
      ?auto_7418 - CITY
    )
    :vars
    (
      ?auto_7426 - FLEVEL
      ?auto_7425 - FLEVEL
      ?auto_7422 - CITY
      ?auto_7424 - CITY
      ?auto_7423 - CITY
      ?auto_7427 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7426 ?auto_7425 ) ( not ( = ?auto_7418 ?auto_7422 ) ) ( not ( = ?auto_7425 ?auto_7426 ) ) ( not ( = ?auto_7419 ?auto_7420 ) ) ( PERSON-AT ?auto_7420 ?auto_7422 ) ( not ( = ?auto_7419 ?auto_7421 ) ) ( not ( = ?auto_7420 ?auto_7421 ) ) ( not ( = ?auto_7418 ?auto_7424 ) ) ( not ( = ?auto_7422 ?auto_7424 ) ) ( PERSON-AT ?auto_7421 ?auto_7424 ) ( not ( = ?auto_7418 ?auto_7423 ) ) ( not ( = ?auto_7422 ?auto_7423 ) ) ( not ( = ?auto_7424 ?auto_7423 ) ) ( PERSON-AT ?auto_7419 ?auto_7423 ) ( AIRCRAFT-AT ?auto_7427 ?auto_7418 ) ( FUEL-LEVEL ?auto_7427 ?auto_7426 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7419 ?auto_7420 ?auto_7418 )
      ( FLY-3PPL-VERIFY ?auto_7419 ?auto_7420 ?auto_7421 ?auto_7418 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7440 - PERSON
      ?auto_7441 - PERSON
      ?auto_7442 - PERSON
      ?auto_7439 - CITY
    )
    :vars
    (
      ?auto_7447 - FLEVEL
      ?auto_7446 - FLEVEL
      ?auto_7443 - CITY
      ?auto_7445 - CITY
      ?auto_7444 - CITY
      ?auto_7448 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7447 ?auto_7446 ) ( not ( = ?auto_7439 ?auto_7443 ) ) ( not ( = ?auto_7446 ?auto_7447 ) ) ( not ( = ?auto_7441 ?auto_7442 ) ) ( PERSON-AT ?auto_7442 ?auto_7443 ) ( not ( = ?auto_7441 ?auto_7440 ) ) ( not ( = ?auto_7442 ?auto_7440 ) ) ( not ( = ?auto_7439 ?auto_7445 ) ) ( not ( = ?auto_7443 ?auto_7445 ) ) ( PERSON-AT ?auto_7440 ?auto_7445 ) ( not ( = ?auto_7439 ?auto_7444 ) ) ( not ( = ?auto_7443 ?auto_7444 ) ) ( not ( = ?auto_7445 ?auto_7444 ) ) ( PERSON-AT ?auto_7441 ?auto_7444 ) ( AIRCRAFT-AT ?auto_7448 ?auto_7439 ) ( FUEL-LEVEL ?auto_7448 ?auto_7447 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7441 ?auto_7442 ?auto_7439 )
      ( FLY-3PPL-VERIFY ?auto_7440 ?auto_7441 ?auto_7442 ?auto_7439 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7461 - PERSON
      ?auto_7462 - PERSON
      ?auto_7463 - PERSON
      ?auto_7460 - CITY
    )
    :vars
    (
      ?auto_7468 - FLEVEL
      ?auto_7467 - FLEVEL
      ?auto_7464 - CITY
      ?auto_7466 - CITY
      ?auto_7465 - CITY
      ?auto_7469 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7468 ?auto_7467 ) ( not ( = ?auto_7460 ?auto_7464 ) ) ( not ( = ?auto_7467 ?auto_7468 ) ) ( not ( = ?auto_7463 ?auto_7462 ) ) ( PERSON-AT ?auto_7462 ?auto_7464 ) ( not ( = ?auto_7463 ?auto_7461 ) ) ( not ( = ?auto_7462 ?auto_7461 ) ) ( not ( = ?auto_7460 ?auto_7466 ) ) ( not ( = ?auto_7464 ?auto_7466 ) ) ( PERSON-AT ?auto_7461 ?auto_7466 ) ( not ( = ?auto_7460 ?auto_7465 ) ) ( not ( = ?auto_7464 ?auto_7465 ) ) ( not ( = ?auto_7466 ?auto_7465 ) ) ( PERSON-AT ?auto_7463 ?auto_7465 ) ( AIRCRAFT-AT ?auto_7469 ?auto_7460 ) ( FUEL-LEVEL ?auto_7469 ?auto_7468 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7463 ?auto_7462 ?auto_7460 )
      ( FLY-3PPL-VERIFY ?auto_7461 ?auto_7462 ?auto_7463 ?auto_7460 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7504 - PERSON
      ?auto_7505 - PERSON
      ?auto_7506 - PERSON
      ?auto_7503 - CITY
    )
    :vars
    (
      ?auto_7511 - FLEVEL
      ?auto_7510 - FLEVEL
      ?auto_7507 - CITY
      ?auto_7509 - CITY
      ?auto_7508 - CITY
      ?auto_7512 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7511 ?auto_7510 ) ( not ( = ?auto_7503 ?auto_7507 ) ) ( not ( = ?auto_7510 ?auto_7511 ) ) ( not ( = ?auto_7505 ?auto_7504 ) ) ( PERSON-AT ?auto_7504 ?auto_7507 ) ( not ( = ?auto_7505 ?auto_7506 ) ) ( not ( = ?auto_7504 ?auto_7506 ) ) ( not ( = ?auto_7503 ?auto_7509 ) ) ( not ( = ?auto_7507 ?auto_7509 ) ) ( PERSON-AT ?auto_7506 ?auto_7509 ) ( not ( = ?auto_7503 ?auto_7508 ) ) ( not ( = ?auto_7507 ?auto_7508 ) ) ( not ( = ?auto_7509 ?auto_7508 ) ) ( PERSON-AT ?auto_7505 ?auto_7508 ) ( AIRCRAFT-AT ?auto_7512 ?auto_7503 ) ( FUEL-LEVEL ?auto_7512 ?auto_7511 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7505 ?auto_7504 ?auto_7503 )
      ( FLY-3PPL-VERIFY ?auto_7504 ?auto_7505 ?auto_7506 ?auto_7503 ) )
  )

  ( :method FLY-3PPL
    :parameters
    (
      ?auto_7525 - PERSON
      ?auto_7526 - PERSON
      ?auto_7527 - PERSON
      ?auto_7524 - CITY
    )
    :vars
    (
      ?auto_7532 - FLEVEL
      ?auto_7531 - FLEVEL
      ?auto_7528 - CITY
      ?auto_7530 - CITY
      ?auto_7529 - CITY
      ?auto_7533 - AIRCRAFT
    )
    :precondition
    ( and ( NEXT ?auto_7532 ?auto_7531 ) ( not ( = ?auto_7524 ?auto_7528 ) ) ( not ( = ?auto_7531 ?auto_7532 ) ) ( not ( = ?auto_7527 ?auto_7525 ) ) ( PERSON-AT ?auto_7525 ?auto_7528 ) ( not ( = ?auto_7527 ?auto_7526 ) ) ( not ( = ?auto_7525 ?auto_7526 ) ) ( not ( = ?auto_7524 ?auto_7530 ) ) ( not ( = ?auto_7528 ?auto_7530 ) ) ( PERSON-AT ?auto_7526 ?auto_7530 ) ( not ( = ?auto_7524 ?auto_7529 ) ) ( not ( = ?auto_7528 ?auto_7529 ) ) ( not ( = ?auto_7530 ?auto_7529 ) ) ( PERSON-AT ?auto_7527 ?auto_7529 ) ( AIRCRAFT-AT ?auto_7533 ?auto_7524 ) ( FUEL-LEVEL ?auto_7533 ?auto_7532 ) )
    :subtasks
    ( ( FLY-2PPL ?auto_7527 ?auto_7525 ?auto_7524 )
      ( FLY-3PPL-VERIFY ?auto_7525 ?auto_7526 ?auto_7527 ?auto_7524 ) )
  )

)

