( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2309 - SURFACE
      ?auto_2310 - SURFACE
    )
    :vars
    (
      ?auto_2311 - HOIST
      ?auto_2312 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2311 ?auto_2312 ) ( SURFACE-AT ?auto_2310 ?auto_2312 ) ( CLEAR ?auto_2310 ) ( LIFTING ?auto_2311 ?auto_2309 ) ( IS-CRATE ?auto_2309 ) ( not ( = ?auto_2309 ?auto_2310 ) ) )
    :subtasks
    ( ( !DROP ?auto_2311 ?auto_2309 ?auto_2310 ?auto_2312 )
      ( MAKE-ON-VERIFY ?auto_2309 ?auto_2310 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2313 - SURFACE
      ?auto_2314 - SURFACE
    )
    :vars
    (
      ?auto_2316 - HOIST
      ?auto_2315 - PLACE
      ?auto_2317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2316 ?auto_2315 ) ( SURFACE-AT ?auto_2314 ?auto_2315 ) ( CLEAR ?auto_2314 ) ( IS-CRATE ?auto_2313 ) ( not ( = ?auto_2313 ?auto_2314 ) ) ( TRUCK-AT ?auto_2317 ?auto_2315 ) ( AVAILABLE ?auto_2316 ) ( IN ?auto_2313 ?auto_2317 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2316 ?auto_2313 ?auto_2317 ?auto_2315 )
      ( MAKE-ON ?auto_2313 ?auto_2314 )
      ( MAKE-ON-VERIFY ?auto_2313 ?auto_2314 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2318 - SURFACE
      ?auto_2319 - SURFACE
    )
    :vars
    (
      ?auto_2321 - HOIST
      ?auto_2320 - PLACE
      ?auto_2322 - TRUCK
      ?auto_2323 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2321 ?auto_2320 ) ( SURFACE-AT ?auto_2319 ?auto_2320 ) ( CLEAR ?auto_2319 ) ( IS-CRATE ?auto_2318 ) ( not ( = ?auto_2318 ?auto_2319 ) ) ( AVAILABLE ?auto_2321 ) ( IN ?auto_2318 ?auto_2322 ) ( TRUCK-AT ?auto_2322 ?auto_2323 ) ( not ( = ?auto_2323 ?auto_2320 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2322 ?auto_2323 ?auto_2320 )
      ( MAKE-ON ?auto_2318 ?auto_2319 )
      ( MAKE-ON-VERIFY ?auto_2318 ?auto_2319 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2324 - SURFACE
      ?auto_2325 - SURFACE
    )
    :vars
    (
      ?auto_2328 - HOIST
      ?auto_2329 - PLACE
      ?auto_2327 - TRUCK
      ?auto_2326 - PLACE
      ?auto_2330 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2328 ?auto_2329 ) ( SURFACE-AT ?auto_2325 ?auto_2329 ) ( CLEAR ?auto_2325 ) ( IS-CRATE ?auto_2324 ) ( not ( = ?auto_2324 ?auto_2325 ) ) ( AVAILABLE ?auto_2328 ) ( TRUCK-AT ?auto_2327 ?auto_2326 ) ( not ( = ?auto_2326 ?auto_2329 ) ) ( HOIST-AT ?auto_2330 ?auto_2326 ) ( LIFTING ?auto_2330 ?auto_2324 ) ( not ( = ?auto_2328 ?auto_2330 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2330 ?auto_2324 ?auto_2327 ?auto_2326 )
      ( MAKE-ON ?auto_2324 ?auto_2325 )
      ( MAKE-ON-VERIFY ?auto_2324 ?auto_2325 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2331 - SURFACE
      ?auto_2332 - SURFACE
    )
    :vars
    (
      ?auto_2334 - HOIST
      ?auto_2333 - PLACE
      ?auto_2335 - TRUCK
      ?auto_2336 - PLACE
      ?auto_2337 - HOIST
      ?auto_2338 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2334 ?auto_2333 ) ( SURFACE-AT ?auto_2332 ?auto_2333 ) ( CLEAR ?auto_2332 ) ( IS-CRATE ?auto_2331 ) ( not ( = ?auto_2331 ?auto_2332 ) ) ( AVAILABLE ?auto_2334 ) ( TRUCK-AT ?auto_2335 ?auto_2336 ) ( not ( = ?auto_2336 ?auto_2333 ) ) ( HOIST-AT ?auto_2337 ?auto_2336 ) ( not ( = ?auto_2334 ?auto_2337 ) ) ( AVAILABLE ?auto_2337 ) ( SURFACE-AT ?auto_2331 ?auto_2336 ) ( ON ?auto_2331 ?auto_2338 ) ( CLEAR ?auto_2331 ) ( not ( = ?auto_2331 ?auto_2338 ) ) ( not ( = ?auto_2332 ?auto_2338 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2337 ?auto_2331 ?auto_2338 ?auto_2336 )
      ( MAKE-ON ?auto_2331 ?auto_2332 )
      ( MAKE-ON-VERIFY ?auto_2331 ?auto_2332 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2339 - SURFACE
      ?auto_2340 - SURFACE
    )
    :vars
    (
      ?auto_2341 - HOIST
      ?auto_2346 - PLACE
      ?auto_2343 - PLACE
      ?auto_2345 - HOIST
      ?auto_2344 - SURFACE
      ?auto_2342 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2341 ?auto_2346 ) ( SURFACE-AT ?auto_2340 ?auto_2346 ) ( CLEAR ?auto_2340 ) ( IS-CRATE ?auto_2339 ) ( not ( = ?auto_2339 ?auto_2340 ) ) ( AVAILABLE ?auto_2341 ) ( not ( = ?auto_2343 ?auto_2346 ) ) ( HOIST-AT ?auto_2345 ?auto_2343 ) ( not ( = ?auto_2341 ?auto_2345 ) ) ( AVAILABLE ?auto_2345 ) ( SURFACE-AT ?auto_2339 ?auto_2343 ) ( ON ?auto_2339 ?auto_2344 ) ( CLEAR ?auto_2339 ) ( not ( = ?auto_2339 ?auto_2344 ) ) ( not ( = ?auto_2340 ?auto_2344 ) ) ( TRUCK-AT ?auto_2342 ?auto_2346 ) )
    :subtasks
    ( ( !DRIVE ?auto_2342 ?auto_2346 ?auto_2343 )
      ( MAKE-ON ?auto_2339 ?auto_2340 )
      ( MAKE-ON-VERIFY ?auto_2339 ?auto_2340 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2349 - SURFACE
      ?auto_2350 - SURFACE
    )
    :vars
    (
      ?auto_2351 - HOIST
      ?auto_2352 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2351 ?auto_2352 ) ( SURFACE-AT ?auto_2350 ?auto_2352 ) ( CLEAR ?auto_2350 ) ( LIFTING ?auto_2351 ?auto_2349 ) ( IS-CRATE ?auto_2349 ) ( not ( = ?auto_2349 ?auto_2350 ) ) )
    :subtasks
    ( ( !DROP ?auto_2351 ?auto_2349 ?auto_2350 ?auto_2352 )
      ( MAKE-ON-VERIFY ?auto_2349 ?auto_2350 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2353 - SURFACE
      ?auto_2354 - SURFACE
    )
    :vars
    (
      ?auto_2355 - HOIST
      ?auto_2356 - PLACE
      ?auto_2357 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2355 ?auto_2356 ) ( SURFACE-AT ?auto_2354 ?auto_2356 ) ( CLEAR ?auto_2354 ) ( IS-CRATE ?auto_2353 ) ( not ( = ?auto_2353 ?auto_2354 ) ) ( TRUCK-AT ?auto_2357 ?auto_2356 ) ( AVAILABLE ?auto_2355 ) ( IN ?auto_2353 ?auto_2357 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2355 ?auto_2353 ?auto_2357 ?auto_2356 )
      ( MAKE-ON ?auto_2353 ?auto_2354 )
      ( MAKE-ON-VERIFY ?auto_2353 ?auto_2354 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2358 - SURFACE
      ?auto_2359 - SURFACE
    )
    :vars
    (
      ?auto_2361 - HOIST
      ?auto_2360 - PLACE
      ?auto_2362 - TRUCK
      ?auto_2363 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2361 ?auto_2360 ) ( SURFACE-AT ?auto_2359 ?auto_2360 ) ( CLEAR ?auto_2359 ) ( IS-CRATE ?auto_2358 ) ( not ( = ?auto_2358 ?auto_2359 ) ) ( AVAILABLE ?auto_2361 ) ( IN ?auto_2358 ?auto_2362 ) ( TRUCK-AT ?auto_2362 ?auto_2363 ) ( not ( = ?auto_2363 ?auto_2360 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2362 ?auto_2363 ?auto_2360 )
      ( MAKE-ON ?auto_2358 ?auto_2359 )
      ( MAKE-ON-VERIFY ?auto_2358 ?auto_2359 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2364 - SURFACE
      ?auto_2365 - SURFACE
    )
    :vars
    (
      ?auto_2367 - HOIST
      ?auto_2368 - PLACE
      ?auto_2366 - TRUCK
      ?auto_2369 - PLACE
      ?auto_2370 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2367 ?auto_2368 ) ( SURFACE-AT ?auto_2365 ?auto_2368 ) ( CLEAR ?auto_2365 ) ( IS-CRATE ?auto_2364 ) ( not ( = ?auto_2364 ?auto_2365 ) ) ( AVAILABLE ?auto_2367 ) ( TRUCK-AT ?auto_2366 ?auto_2369 ) ( not ( = ?auto_2369 ?auto_2368 ) ) ( HOIST-AT ?auto_2370 ?auto_2369 ) ( LIFTING ?auto_2370 ?auto_2364 ) ( not ( = ?auto_2367 ?auto_2370 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2370 ?auto_2364 ?auto_2366 ?auto_2369 )
      ( MAKE-ON ?auto_2364 ?auto_2365 )
      ( MAKE-ON-VERIFY ?auto_2364 ?auto_2365 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2371 - SURFACE
      ?auto_2372 - SURFACE
    )
    :vars
    (
      ?auto_2375 - HOIST
      ?auto_2374 - PLACE
      ?auto_2377 - TRUCK
      ?auto_2376 - PLACE
      ?auto_2373 - HOIST
      ?auto_2378 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2375 ?auto_2374 ) ( SURFACE-AT ?auto_2372 ?auto_2374 ) ( CLEAR ?auto_2372 ) ( IS-CRATE ?auto_2371 ) ( not ( = ?auto_2371 ?auto_2372 ) ) ( AVAILABLE ?auto_2375 ) ( TRUCK-AT ?auto_2377 ?auto_2376 ) ( not ( = ?auto_2376 ?auto_2374 ) ) ( HOIST-AT ?auto_2373 ?auto_2376 ) ( not ( = ?auto_2375 ?auto_2373 ) ) ( AVAILABLE ?auto_2373 ) ( SURFACE-AT ?auto_2371 ?auto_2376 ) ( ON ?auto_2371 ?auto_2378 ) ( CLEAR ?auto_2371 ) ( not ( = ?auto_2371 ?auto_2378 ) ) ( not ( = ?auto_2372 ?auto_2378 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2373 ?auto_2371 ?auto_2378 ?auto_2376 )
      ( MAKE-ON ?auto_2371 ?auto_2372 )
      ( MAKE-ON-VERIFY ?auto_2371 ?auto_2372 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2379 - SURFACE
      ?auto_2380 - SURFACE
    )
    :vars
    (
      ?auto_2381 - HOIST
      ?auto_2384 - PLACE
      ?auto_2382 - PLACE
      ?auto_2386 - HOIST
      ?auto_2385 - SURFACE
      ?auto_2383 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2381 ?auto_2384 ) ( SURFACE-AT ?auto_2380 ?auto_2384 ) ( CLEAR ?auto_2380 ) ( IS-CRATE ?auto_2379 ) ( not ( = ?auto_2379 ?auto_2380 ) ) ( AVAILABLE ?auto_2381 ) ( not ( = ?auto_2382 ?auto_2384 ) ) ( HOIST-AT ?auto_2386 ?auto_2382 ) ( not ( = ?auto_2381 ?auto_2386 ) ) ( AVAILABLE ?auto_2386 ) ( SURFACE-AT ?auto_2379 ?auto_2382 ) ( ON ?auto_2379 ?auto_2385 ) ( CLEAR ?auto_2379 ) ( not ( = ?auto_2379 ?auto_2385 ) ) ( not ( = ?auto_2380 ?auto_2385 ) ) ( TRUCK-AT ?auto_2383 ?auto_2384 ) )
    :subtasks
    ( ( !DRIVE ?auto_2383 ?auto_2384 ?auto_2382 )
      ( MAKE-ON ?auto_2379 ?auto_2380 )
      ( MAKE-ON-VERIFY ?auto_2379 ?auto_2380 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2387 - SURFACE
      ?auto_2388 - SURFACE
    )
    :vars
    (
      ?auto_2391 - HOIST
      ?auto_2392 - PLACE
      ?auto_2389 - PLACE
      ?auto_2394 - HOIST
      ?auto_2390 - SURFACE
      ?auto_2393 - TRUCK
      ?auto_2395 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2391 ?auto_2392 ) ( IS-CRATE ?auto_2387 ) ( not ( = ?auto_2387 ?auto_2388 ) ) ( not ( = ?auto_2389 ?auto_2392 ) ) ( HOIST-AT ?auto_2394 ?auto_2389 ) ( not ( = ?auto_2391 ?auto_2394 ) ) ( AVAILABLE ?auto_2394 ) ( SURFACE-AT ?auto_2387 ?auto_2389 ) ( ON ?auto_2387 ?auto_2390 ) ( CLEAR ?auto_2387 ) ( not ( = ?auto_2387 ?auto_2390 ) ) ( not ( = ?auto_2388 ?auto_2390 ) ) ( TRUCK-AT ?auto_2393 ?auto_2392 ) ( SURFACE-AT ?auto_2395 ?auto_2392 ) ( CLEAR ?auto_2395 ) ( LIFTING ?auto_2391 ?auto_2388 ) ( IS-CRATE ?auto_2388 ) ( not ( = ?auto_2387 ?auto_2395 ) ) ( not ( = ?auto_2388 ?auto_2395 ) ) ( not ( = ?auto_2390 ?auto_2395 ) ) )
    :subtasks
    ( ( !DROP ?auto_2391 ?auto_2388 ?auto_2395 ?auto_2392 )
      ( MAKE-ON ?auto_2387 ?auto_2388 )
      ( MAKE-ON-VERIFY ?auto_2387 ?auto_2388 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2396 - SURFACE
      ?auto_2397 - SURFACE
    )
    :vars
    (
      ?auto_2403 - HOIST
      ?auto_2398 - PLACE
      ?auto_2401 - PLACE
      ?auto_2400 - HOIST
      ?auto_2402 - SURFACE
      ?auto_2399 - TRUCK
      ?auto_2404 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2403 ?auto_2398 ) ( IS-CRATE ?auto_2396 ) ( not ( = ?auto_2396 ?auto_2397 ) ) ( not ( = ?auto_2401 ?auto_2398 ) ) ( HOIST-AT ?auto_2400 ?auto_2401 ) ( not ( = ?auto_2403 ?auto_2400 ) ) ( AVAILABLE ?auto_2400 ) ( SURFACE-AT ?auto_2396 ?auto_2401 ) ( ON ?auto_2396 ?auto_2402 ) ( CLEAR ?auto_2396 ) ( not ( = ?auto_2396 ?auto_2402 ) ) ( not ( = ?auto_2397 ?auto_2402 ) ) ( TRUCK-AT ?auto_2399 ?auto_2398 ) ( SURFACE-AT ?auto_2404 ?auto_2398 ) ( CLEAR ?auto_2404 ) ( IS-CRATE ?auto_2397 ) ( not ( = ?auto_2396 ?auto_2404 ) ) ( not ( = ?auto_2397 ?auto_2404 ) ) ( not ( = ?auto_2402 ?auto_2404 ) ) ( AVAILABLE ?auto_2403 ) ( IN ?auto_2397 ?auto_2399 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2403 ?auto_2397 ?auto_2399 ?auto_2398 )
      ( MAKE-ON ?auto_2396 ?auto_2397 )
      ( MAKE-ON-VERIFY ?auto_2396 ?auto_2397 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2405 - SURFACE
      ?auto_2406 - SURFACE
    )
    :vars
    (
      ?auto_2413 - HOIST
      ?auto_2411 - PLACE
      ?auto_2409 - PLACE
      ?auto_2410 - HOIST
      ?auto_2412 - SURFACE
      ?auto_2407 - SURFACE
      ?auto_2408 - TRUCK
      ?auto_2414 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2413 ?auto_2411 ) ( IS-CRATE ?auto_2405 ) ( not ( = ?auto_2405 ?auto_2406 ) ) ( not ( = ?auto_2409 ?auto_2411 ) ) ( HOIST-AT ?auto_2410 ?auto_2409 ) ( not ( = ?auto_2413 ?auto_2410 ) ) ( AVAILABLE ?auto_2410 ) ( SURFACE-AT ?auto_2405 ?auto_2409 ) ( ON ?auto_2405 ?auto_2412 ) ( CLEAR ?auto_2405 ) ( not ( = ?auto_2405 ?auto_2412 ) ) ( not ( = ?auto_2406 ?auto_2412 ) ) ( SURFACE-AT ?auto_2407 ?auto_2411 ) ( CLEAR ?auto_2407 ) ( IS-CRATE ?auto_2406 ) ( not ( = ?auto_2405 ?auto_2407 ) ) ( not ( = ?auto_2406 ?auto_2407 ) ) ( not ( = ?auto_2412 ?auto_2407 ) ) ( AVAILABLE ?auto_2413 ) ( IN ?auto_2406 ?auto_2408 ) ( TRUCK-AT ?auto_2408 ?auto_2414 ) ( not ( = ?auto_2414 ?auto_2411 ) ) ( not ( = ?auto_2409 ?auto_2414 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2408 ?auto_2414 ?auto_2411 )
      ( MAKE-ON ?auto_2405 ?auto_2406 )
      ( MAKE-ON-VERIFY ?auto_2405 ?auto_2406 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2415 - SURFACE
      ?auto_2416 - SURFACE
    )
    :vars
    (
      ?auto_2424 - HOIST
      ?auto_2422 - PLACE
      ?auto_2418 - PLACE
      ?auto_2423 - HOIST
      ?auto_2420 - SURFACE
      ?auto_2419 - SURFACE
      ?auto_2421 - TRUCK
      ?auto_2417 - PLACE
      ?auto_2425 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2424 ?auto_2422 ) ( IS-CRATE ?auto_2415 ) ( not ( = ?auto_2415 ?auto_2416 ) ) ( not ( = ?auto_2418 ?auto_2422 ) ) ( HOIST-AT ?auto_2423 ?auto_2418 ) ( not ( = ?auto_2424 ?auto_2423 ) ) ( AVAILABLE ?auto_2423 ) ( SURFACE-AT ?auto_2415 ?auto_2418 ) ( ON ?auto_2415 ?auto_2420 ) ( CLEAR ?auto_2415 ) ( not ( = ?auto_2415 ?auto_2420 ) ) ( not ( = ?auto_2416 ?auto_2420 ) ) ( SURFACE-AT ?auto_2419 ?auto_2422 ) ( CLEAR ?auto_2419 ) ( IS-CRATE ?auto_2416 ) ( not ( = ?auto_2415 ?auto_2419 ) ) ( not ( = ?auto_2416 ?auto_2419 ) ) ( not ( = ?auto_2420 ?auto_2419 ) ) ( AVAILABLE ?auto_2424 ) ( TRUCK-AT ?auto_2421 ?auto_2417 ) ( not ( = ?auto_2417 ?auto_2422 ) ) ( not ( = ?auto_2418 ?auto_2417 ) ) ( HOIST-AT ?auto_2425 ?auto_2417 ) ( LIFTING ?auto_2425 ?auto_2416 ) ( not ( = ?auto_2424 ?auto_2425 ) ) ( not ( = ?auto_2423 ?auto_2425 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2425 ?auto_2416 ?auto_2421 ?auto_2417 )
      ( MAKE-ON ?auto_2415 ?auto_2416 )
      ( MAKE-ON-VERIFY ?auto_2415 ?auto_2416 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2426 - SURFACE
      ?auto_2427 - SURFACE
    )
    :vars
    (
      ?auto_2431 - HOIST
      ?auto_2436 - PLACE
      ?auto_2435 - PLACE
      ?auto_2432 - HOIST
      ?auto_2430 - SURFACE
      ?auto_2433 - SURFACE
      ?auto_2434 - TRUCK
      ?auto_2429 - PLACE
      ?auto_2428 - HOIST
      ?auto_2437 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2431 ?auto_2436 ) ( IS-CRATE ?auto_2426 ) ( not ( = ?auto_2426 ?auto_2427 ) ) ( not ( = ?auto_2435 ?auto_2436 ) ) ( HOIST-AT ?auto_2432 ?auto_2435 ) ( not ( = ?auto_2431 ?auto_2432 ) ) ( AVAILABLE ?auto_2432 ) ( SURFACE-AT ?auto_2426 ?auto_2435 ) ( ON ?auto_2426 ?auto_2430 ) ( CLEAR ?auto_2426 ) ( not ( = ?auto_2426 ?auto_2430 ) ) ( not ( = ?auto_2427 ?auto_2430 ) ) ( SURFACE-AT ?auto_2433 ?auto_2436 ) ( CLEAR ?auto_2433 ) ( IS-CRATE ?auto_2427 ) ( not ( = ?auto_2426 ?auto_2433 ) ) ( not ( = ?auto_2427 ?auto_2433 ) ) ( not ( = ?auto_2430 ?auto_2433 ) ) ( AVAILABLE ?auto_2431 ) ( TRUCK-AT ?auto_2434 ?auto_2429 ) ( not ( = ?auto_2429 ?auto_2436 ) ) ( not ( = ?auto_2435 ?auto_2429 ) ) ( HOIST-AT ?auto_2428 ?auto_2429 ) ( not ( = ?auto_2431 ?auto_2428 ) ) ( not ( = ?auto_2432 ?auto_2428 ) ) ( AVAILABLE ?auto_2428 ) ( SURFACE-AT ?auto_2427 ?auto_2429 ) ( ON ?auto_2427 ?auto_2437 ) ( CLEAR ?auto_2427 ) ( not ( = ?auto_2426 ?auto_2437 ) ) ( not ( = ?auto_2427 ?auto_2437 ) ) ( not ( = ?auto_2430 ?auto_2437 ) ) ( not ( = ?auto_2433 ?auto_2437 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2428 ?auto_2427 ?auto_2437 ?auto_2429 )
      ( MAKE-ON ?auto_2426 ?auto_2427 )
      ( MAKE-ON-VERIFY ?auto_2426 ?auto_2427 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2438 - SURFACE
      ?auto_2439 - SURFACE
    )
    :vars
    (
      ?auto_2446 - HOIST
      ?auto_2447 - PLACE
      ?auto_2448 - PLACE
      ?auto_2443 - HOIST
      ?auto_2440 - SURFACE
      ?auto_2442 - SURFACE
      ?auto_2449 - PLACE
      ?auto_2441 - HOIST
      ?auto_2445 - SURFACE
      ?auto_2444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2446 ?auto_2447 ) ( IS-CRATE ?auto_2438 ) ( not ( = ?auto_2438 ?auto_2439 ) ) ( not ( = ?auto_2448 ?auto_2447 ) ) ( HOIST-AT ?auto_2443 ?auto_2448 ) ( not ( = ?auto_2446 ?auto_2443 ) ) ( AVAILABLE ?auto_2443 ) ( SURFACE-AT ?auto_2438 ?auto_2448 ) ( ON ?auto_2438 ?auto_2440 ) ( CLEAR ?auto_2438 ) ( not ( = ?auto_2438 ?auto_2440 ) ) ( not ( = ?auto_2439 ?auto_2440 ) ) ( SURFACE-AT ?auto_2442 ?auto_2447 ) ( CLEAR ?auto_2442 ) ( IS-CRATE ?auto_2439 ) ( not ( = ?auto_2438 ?auto_2442 ) ) ( not ( = ?auto_2439 ?auto_2442 ) ) ( not ( = ?auto_2440 ?auto_2442 ) ) ( AVAILABLE ?auto_2446 ) ( not ( = ?auto_2449 ?auto_2447 ) ) ( not ( = ?auto_2448 ?auto_2449 ) ) ( HOIST-AT ?auto_2441 ?auto_2449 ) ( not ( = ?auto_2446 ?auto_2441 ) ) ( not ( = ?auto_2443 ?auto_2441 ) ) ( AVAILABLE ?auto_2441 ) ( SURFACE-AT ?auto_2439 ?auto_2449 ) ( ON ?auto_2439 ?auto_2445 ) ( CLEAR ?auto_2439 ) ( not ( = ?auto_2438 ?auto_2445 ) ) ( not ( = ?auto_2439 ?auto_2445 ) ) ( not ( = ?auto_2440 ?auto_2445 ) ) ( not ( = ?auto_2442 ?auto_2445 ) ) ( TRUCK-AT ?auto_2444 ?auto_2447 ) )
    :subtasks
    ( ( !DRIVE ?auto_2444 ?auto_2447 ?auto_2449 )
      ( MAKE-ON ?auto_2438 ?auto_2439 )
      ( MAKE-ON-VERIFY ?auto_2438 ?auto_2439 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2452 - SURFACE
      ?auto_2453 - SURFACE
    )
    :vars
    (
      ?auto_2454 - HOIST
      ?auto_2455 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2454 ?auto_2455 ) ( SURFACE-AT ?auto_2453 ?auto_2455 ) ( CLEAR ?auto_2453 ) ( LIFTING ?auto_2454 ?auto_2452 ) ( IS-CRATE ?auto_2452 ) ( not ( = ?auto_2452 ?auto_2453 ) ) )
    :subtasks
    ( ( !DROP ?auto_2454 ?auto_2452 ?auto_2453 ?auto_2455 )
      ( MAKE-ON-VERIFY ?auto_2452 ?auto_2453 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2456 - SURFACE
      ?auto_2457 - SURFACE
    )
    :vars
    (
      ?auto_2458 - HOIST
      ?auto_2459 - PLACE
      ?auto_2460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2458 ?auto_2459 ) ( SURFACE-AT ?auto_2457 ?auto_2459 ) ( CLEAR ?auto_2457 ) ( IS-CRATE ?auto_2456 ) ( not ( = ?auto_2456 ?auto_2457 ) ) ( TRUCK-AT ?auto_2460 ?auto_2459 ) ( AVAILABLE ?auto_2458 ) ( IN ?auto_2456 ?auto_2460 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2458 ?auto_2456 ?auto_2460 ?auto_2459 )
      ( MAKE-ON ?auto_2456 ?auto_2457 )
      ( MAKE-ON-VERIFY ?auto_2456 ?auto_2457 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2461 - SURFACE
      ?auto_2462 - SURFACE
    )
    :vars
    (
      ?auto_2463 - HOIST
      ?auto_2464 - PLACE
      ?auto_2465 - TRUCK
      ?auto_2466 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2463 ?auto_2464 ) ( SURFACE-AT ?auto_2462 ?auto_2464 ) ( CLEAR ?auto_2462 ) ( IS-CRATE ?auto_2461 ) ( not ( = ?auto_2461 ?auto_2462 ) ) ( AVAILABLE ?auto_2463 ) ( IN ?auto_2461 ?auto_2465 ) ( TRUCK-AT ?auto_2465 ?auto_2466 ) ( not ( = ?auto_2466 ?auto_2464 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2465 ?auto_2466 ?auto_2464 )
      ( MAKE-ON ?auto_2461 ?auto_2462 )
      ( MAKE-ON-VERIFY ?auto_2461 ?auto_2462 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2467 - SURFACE
      ?auto_2468 - SURFACE
    )
    :vars
    (
      ?auto_2472 - HOIST
      ?auto_2471 - PLACE
      ?auto_2470 - TRUCK
      ?auto_2469 - PLACE
      ?auto_2473 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2472 ?auto_2471 ) ( SURFACE-AT ?auto_2468 ?auto_2471 ) ( CLEAR ?auto_2468 ) ( IS-CRATE ?auto_2467 ) ( not ( = ?auto_2467 ?auto_2468 ) ) ( AVAILABLE ?auto_2472 ) ( TRUCK-AT ?auto_2470 ?auto_2469 ) ( not ( = ?auto_2469 ?auto_2471 ) ) ( HOIST-AT ?auto_2473 ?auto_2469 ) ( LIFTING ?auto_2473 ?auto_2467 ) ( not ( = ?auto_2472 ?auto_2473 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2473 ?auto_2467 ?auto_2470 ?auto_2469 )
      ( MAKE-ON ?auto_2467 ?auto_2468 )
      ( MAKE-ON-VERIFY ?auto_2467 ?auto_2468 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2474 - SURFACE
      ?auto_2475 - SURFACE
    )
    :vars
    (
      ?auto_2480 - HOIST
      ?auto_2476 - PLACE
      ?auto_2479 - TRUCK
      ?auto_2478 - PLACE
      ?auto_2477 - HOIST
      ?auto_2481 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2480 ?auto_2476 ) ( SURFACE-AT ?auto_2475 ?auto_2476 ) ( CLEAR ?auto_2475 ) ( IS-CRATE ?auto_2474 ) ( not ( = ?auto_2474 ?auto_2475 ) ) ( AVAILABLE ?auto_2480 ) ( TRUCK-AT ?auto_2479 ?auto_2478 ) ( not ( = ?auto_2478 ?auto_2476 ) ) ( HOIST-AT ?auto_2477 ?auto_2478 ) ( not ( = ?auto_2480 ?auto_2477 ) ) ( AVAILABLE ?auto_2477 ) ( SURFACE-AT ?auto_2474 ?auto_2478 ) ( ON ?auto_2474 ?auto_2481 ) ( CLEAR ?auto_2474 ) ( not ( = ?auto_2474 ?auto_2481 ) ) ( not ( = ?auto_2475 ?auto_2481 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2477 ?auto_2474 ?auto_2481 ?auto_2478 )
      ( MAKE-ON ?auto_2474 ?auto_2475 )
      ( MAKE-ON-VERIFY ?auto_2474 ?auto_2475 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2482 - SURFACE
      ?auto_2483 - SURFACE
    )
    :vars
    (
      ?auto_2489 - HOIST
      ?auto_2488 - PLACE
      ?auto_2485 - PLACE
      ?auto_2487 - HOIST
      ?auto_2486 - SURFACE
      ?auto_2484 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2489 ?auto_2488 ) ( SURFACE-AT ?auto_2483 ?auto_2488 ) ( CLEAR ?auto_2483 ) ( IS-CRATE ?auto_2482 ) ( not ( = ?auto_2482 ?auto_2483 ) ) ( AVAILABLE ?auto_2489 ) ( not ( = ?auto_2485 ?auto_2488 ) ) ( HOIST-AT ?auto_2487 ?auto_2485 ) ( not ( = ?auto_2489 ?auto_2487 ) ) ( AVAILABLE ?auto_2487 ) ( SURFACE-AT ?auto_2482 ?auto_2485 ) ( ON ?auto_2482 ?auto_2486 ) ( CLEAR ?auto_2482 ) ( not ( = ?auto_2482 ?auto_2486 ) ) ( not ( = ?auto_2483 ?auto_2486 ) ) ( TRUCK-AT ?auto_2484 ?auto_2488 ) )
    :subtasks
    ( ( !DRIVE ?auto_2484 ?auto_2488 ?auto_2485 )
      ( MAKE-ON ?auto_2482 ?auto_2483 )
      ( MAKE-ON-VERIFY ?auto_2482 ?auto_2483 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2490 - SURFACE
      ?auto_2491 - SURFACE
    )
    :vars
    (
      ?auto_2495 - HOIST
      ?auto_2497 - PLACE
      ?auto_2493 - PLACE
      ?auto_2496 - HOIST
      ?auto_2492 - SURFACE
      ?auto_2494 - TRUCK
      ?auto_2498 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2495 ?auto_2497 ) ( IS-CRATE ?auto_2490 ) ( not ( = ?auto_2490 ?auto_2491 ) ) ( not ( = ?auto_2493 ?auto_2497 ) ) ( HOIST-AT ?auto_2496 ?auto_2493 ) ( not ( = ?auto_2495 ?auto_2496 ) ) ( AVAILABLE ?auto_2496 ) ( SURFACE-AT ?auto_2490 ?auto_2493 ) ( ON ?auto_2490 ?auto_2492 ) ( CLEAR ?auto_2490 ) ( not ( = ?auto_2490 ?auto_2492 ) ) ( not ( = ?auto_2491 ?auto_2492 ) ) ( TRUCK-AT ?auto_2494 ?auto_2497 ) ( SURFACE-AT ?auto_2498 ?auto_2497 ) ( CLEAR ?auto_2498 ) ( LIFTING ?auto_2495 ?auto_2491 ) ( IS-CRATE ?auto_2491 ) ( not ( = ?auto_2490 ?auto_2498 ) ) ( not ( = ?auto_2491 ?auto_2498 ) ) ( not ( = ?auto_2492 ?auto_2498 ) ) )
    :subtasks
    ( ( !DROP ?auto_2495 ?auto_2491 ?auto_2498 ?auto_2497 )
      ( MAKE-ON ?auto_2490 ?auto_2491 )
      ( MAKE-ON-VERIFY ?auto_2490 ?auto_2491 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2499 - SURFACE
      ?auto_2500 - SURFACE
    )
    :vars
    (
      ?auto_2502 - HOIST
      ?auto_2507 - PLACE
      ?auto_2506 - PLACE
      ?auto_2501 - HOIST
      ?auto_2503 - SURFACE
      ?auto_2505 - TRUCK
      ?auto_2504 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2502 ?auto_2507 ) ( IS-CRATE ?auto_2499 ) ( not ( = ?auto_2499 ?auto_2500 ) ) ( not ( = ?auto_2506 ?auto_2507 ) ) ( HOIST-AT ?auto_2501 ?auto_2506 ) ( not ( = ?auto_2502 ?auto_2501 ) ) ( AVAILABLE ?auto_2501 ) ( SURFACE-AT ?auto_2499 ?auto_2506 ) ( ON ?auto_2499 ?auto_2503 ) ( CLEAR ?auto_2499 ) ( not ( = ?auto_2499 ?auto_2503 ) ) ( not ( = ?auto_2500 ?auto_2503 ) ) ( TRUCK-AT ?auto_2505 ?auto_2507 ) ( SURFACE-AT ?auto_2504 ?auto_2507 ) ( CLEAR ?auto_2504 ) ( IS-CRATE ?auto_2500 ) ( not ( = ?auto_2499 ?auto_2504 ) ) ( not ( = ?auto_2500 ?auto_2504 ) ) ( not ( = ?auto_2503 ?auto_2504 ) ) ( AVAILABLE ?auto_2502 ) ( IN ?auto_2500 ?auto_2505 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2502 ?auto_2500 ?auto_2505 ?auto_2507 )
      ( MAKE-ON ?auto_2499 ?auto_2500 )
      ( MAKE-ON-VERIFY ?auto_2499 ?auto_2500 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2508 - SURFACE
      ?auto_2509 - SURFACE
    )
    :vars
    (
      ?auto_2515 - HOIST
      ?auto_2510 - PLACE
      ?auto_2514 - PLACE
      ?auto_2516 - HOIST
      ?auto_2513 - SURFACE
      ?auto_2511 - SURFACE
      ?auto_2512 - TRUCK
      ?auto_2517 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2515 ?auto_2510 ) ( IS-CRATE ?auto_2508 ) ( not ( = ?auto_2508 ?auto_2509 ) ) ( not ( = ?auto_2514 ?auto_2510 ) ) ( HOIST-AT ?auto_2516 ?auto_2514 ) ( not ( = ?auto_2515 ?auto_2516 ) ) ( AVAILABLE ?auto_2516 ) ( SURFACE-AT ?auto_2508 ?auto_2514 ) ( ON ?auto_2508 ?auto_2513 ) ( CLEAR ?auto_2508 ) ( not ( = ?auto_2508 ?auto_2513 ) ) ( not ( = ?auto_2509 ?auto_2513 ) ) ( SURFACE-AT ?auto_2511 ?auto_2510 ) ( CLEAR ?auto_2511 ) ( IS-CRATE ?auto_2509 ) ( not ( = ?auto_2508 ?auto_2511 ) ) ( not ( = ?auto_2509 ?auto_2511 ) ) ( not ( = ?auto_2513 ?auto_2511 ) ) ( AVAILABLE ?auto_2515 ) ( IN ?auto_2509 ?auto_2512 ) ( TRUCK-AT ?auto_2512 ?auto_2517 ) ( not ( = ?auto_2517 ?auto_2510 ) ) ( not ( = ?auto_2514 ?auto_2517 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2512 ?auto_2517 ?auto_2510 )
      ( MAKE-ON ?auto_2508 ?auto_2509 )
      ( MAKE-ON-VERIFY ?auto_2508 ?auto_2509 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2518 - SURFACE
      ?auto_2519 - SURFACE
    )
    :vars
    (
      ?auto_2524 - HOIST
      ?auto_2522 - PLACE
      ?auto_2527 - PLACE
      ?auto_2521 - HOIST
      ?auto_2525 - SURFACE
      ?auto_2526 - SURFACE
      ?auto_2523 - TRUCK
      ?auto_2520 - PLACE
      ?auto_2528 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2524 ?auto_2522 ) ( IS-CRATE ?auto_2518 ) ( not ( = ?auto_2518 ?auto_2519 ) ) ( not ( = ?auto_2527 ?auto_2522 ) ) ( HOIST-AT ?auto_2521 ?auto_2527 ) ( not ( = ?auto_2524 ?auto_2521 ) ) ( AVAILABLE ?auto_2521 ) ( SURFACE-AT ?auto_2518 ?auto_2527 ) ( ON ?auto_2518 ?auto_2525 ) ( CLEAR ?auto_2518 ) ( not ( = ?auto_2518 ?auto_2525 ) ) ( not ( = ?auto_2519 ?auto_2525 ) ) ( SURFACE-AT ?auto_2526 ?auto_2522 ) ( CLEAR ?auto_2526 ) ( IS-CRATE ?auto_2519 ) ( not ( = ?auto_2518 ?auto_2526 ) ) ( not ( = ?auto_2519 ?auto_2526 ) ) ( not ( = ?auto_2525 ?auto_2526 ) ) ( AVAILABLE ?auto_2524 ) ( TRUCK-AT ?auto_2523 ?auto_2520 ) ( not ( = ?auto_2520 ?auto_2522 ) ) ( not ( = ?auto_2527 ?auto_2520 ) ) ( HOIST-AT ?auto_2528 ?auto_2520 ) ( LIFTING ?auto_2528 ?auto_2519 ) ( not ( = ?auto_2524 ?auto_2528 ) ) ( not ( = ?auto_2521 ?auto_2528 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2528 ?auto_2519 ?auto_2523 ?auto_2520 )
      ( MAKE-ON ?auto_2518 ?auto_2519 )
      ( MAKE-ON-VERIFY ?auto_2518 ?auto_2519 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2529 - SURFACE
      ?auto_2530 - SURFACE
    )
    :vars
    (
      ?auto_2531 - HOIST
      ?auto_2537 - PLACE
      ?auto_2534 - PLACE
      ?auto_2532 - HOIST
      ?auto_2535 - SURFACE
      ?auto_2536 - SURFACE
      ?auto_2533 - TRUCK
      ?auto_2539 - PLACE
      ?auto_2538 - HOIST
      ?auto_2540 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2531 ?auto_2537 ) ( IS-CRATE ?auto_2529 ) ( not ( = ?auto_2529 ?auto_2530 ) ) ( not ( = ?auto_2534 ?auto_2537 ) ) ( HOIST-AT ?auto_2532 ?auto_2534 ) ( not ( = ?auto_2531 ?auto_2532 ) ) ( AVAILABLE ?auto_2532 ) ( SURFACE-AT ?auto_2529 ?auto_2534 ) ( ON ?auto_2529 ?auto_2535 ) ( CLEAR ?auto_2529 ) ( not ( = ?auto_2529 ?auto_2535 ) ) ( not ( = ?auto_2530 ?auto_2535 ) ) ( SURFACE-AT ?auto_2536 ?auto_2537 ) ( CLEAR ?auto_2536 ) ( IS-CRATE ?auto_2530 ) ( not ( = ?auto_2529 ?auto_2536 ) ) ( not ( = ?auto_2530 ?auto_2536 ) ) ( not ( = ?auto_2535 ?auto_2536 ) ) ( AVAILABLE ?auto_2531 ) ( TRUCK-AT ?auto_2533 ?auto_2539 ) ( not ( = ?auto_2539 ?auto_2537 ) ) ( not ( = ?auto_2534 ?auto_2539 ) ) ( HOIST-AT ?auto_2538 ?auto_2539 ) ( not ( = ?auto_2531 ?auto_2538 ) ) ( not ( = ?auto_2532 ?auto_2538 ) ) ( AVAILABLE ?auto_2538 ) ( SURFACE-AT ?auto_2530 ?auto_2539 ) ( ON ?auto_2530 ?auto_2540 ) ( CLEAR ?auto_2530 ) ( not ( = ?auto_2529 ?auto_2540 ) ) ( not ( = ?auto_2530 ?auto_2540 ) ) ( not ( = ?auto_2535 ?auto_2540 ) ) ( not ( = ?auto_2536 ?auto_2540 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2538 ?auto_2530 ?auto_2540 ?auto_2539 )
      ( MAKE-ON ?auto_2529 ?auto_2530 )
      ( MAKE-ON-VERIFY ?auto_2529 ?auto_2530 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2541 - SURFACE
      ?auto_2542 - SURFACE
    )
    :vars
    (
      ?auto_2545 - HOIST
      ?auto_2548 - PLACE
      ?auto_2543 - PLACE
      ?auto_2550 - HOIST
      ?auto_2546 - SURFACE
      ?auto_2544 - SURFACE
      ?auto_2547 - PLACE
      ?auto_2551 - HOIST
      ?auto_2549 - SURFACE
      ?auto_2552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2545 ?auto_2548 ) ( IS-CRATE ?auto_2541 ) ( not ( = ?auto_2541 ?auto_2542 ) ) ( not ( = ?auto_2543 ?auto_2548 ) ) ( HOIST-AT ?auto_2550 ?auto_2543 ) ( not ( = ?auto_2545 ?auto_2550 ) ) ( AVAILABLE ?auto_2550 ) ( SURFACE-AT ?auto_2541 ?auto_2543 ) ( ON ?auto_2541 ?auto_2546 ) ( CLEAR ?auto_2541 ) ( not ( = ?auto_2541 ?auto_2546 ) ) ( not ( = ?auto_2542 ?auto_2546 ) ) ( SURFACE-AT ?auto_2544 ?auto_2548 ) ( CLEAR ?auto_2544 ) ( IS-CRATE ?auto_2542 ) ( not ( = ?auto_2541 ?auto_2544 ) ) ( not ( = ?auto_2542 ?auto_2544 ) ) ( not ( = ?auto_2546 ?auto_2544 ) ) ( AVAILABLE ?auto_2545 ) ( not ( = ?auto_2547 ?auto_2548 ) ) ( not ( = ?auto_2543 ?auto_2547 ) ) ( HOIST-AT ?auto_2551 ?auto_2547 ) ( not ( = ?auto_2545 ?auto_2551 ) ) ( not ( = ?auto_2550 ?auto_2551 ) ) ( AVAILABLE ?auto_2551 ) ( SURFACE-AT ?auto_2542 ?auto_2547 ) ( ON ?auto_2542 ?auto_2549 ) ( CLEAR ?auto_2542 ) ( not ( = ?auto_2541 ?auto_2549 ) ) ( not ( = ?auto_2542 ?auto_2549 ) ) ( not ( = ?auto_2546 ?auto_2549 ) ) ( not ( = ?auto_2544 ?auto_2549 ) ) ( TRUCK-AT ?auto_2552 ?auto_2548 ) )
    :subtasks
    ( ( !DRIVE ?auto_2552 ?auto_2548 ?auto_2547 )
      ( MAKE-ON ?auto_2541 ?auto_2542 )
      ( MAKE-ON-VERIFY ?auto_2541 ?auto_2542 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2553 - SURFACE
      ?auto_2554 - SURFACE
    )
    :vars
    (
      ?auto_2559 - HOIST
      ?auto_2558 - PLACE
      ?auto_2561 - PLACE
      ?auto_2557 - HOIST
      ?auto_2564 - SURFACE
      ?auto_2555 - SURFACE
      ?auto_2556 - PLACE
      ?auto_2563 - HOIST
      ?auto_2562 - SURFACE
      ?auto_2560 - TRUCK
      ?auto_2565 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2559 ?auto_2558 ) ( IS-CRATE ?auto_2553 ) ( not ( = ?auto_2553 ?auto_2554 ) ) ( not ( = ?auto_2561 ?auto_2558 ) ) ( HOIST-AT ?auto_2557 ?auto_2561 ) ( not ( = ?auto_2559 ?auto_2557 ) ) ( AVAILABLE ?auto_2557 ) ( SURFACE-AT ?auto_2553 ?auto_2561 ) ( ON ?auto_2553 ?auto_2564 ) ( CLEAR ?auto_2553 ) ( not ( = ?auto_2553 ?auto_2564 ) ) ( not ( = ?auto_2554 ?auto_2564 ) ) ( IS-CRATE ?auto_2554 ) ( not ( = ?auto_2553 ?auto_2555 ) ) ( not ( = ?auto_2554 ?auto_2555 ) ) ( not ( = ?auto_2564 ?auto_2555 ) ) ( not ( = ?auto_2556 ?auto_2558 ) ) ( not ( = ?auto_2561 ?auto_2556 ) ) ( HOIST-AT ?auto_2563 ?auto_2556 ) ( not ( = ?auto_2559 ?auto_2563 ) ) ( not ( = ?auto_2557 ?auto_2563 ) ) ( AVAILABLE ?auto_2563 ) ( SURFACE-AT ?auto_2554 ?auto_2556 ) ( ON ?auto_2554 ?auto_2562 ) ( CLEAR ?auto_2554 ) ( not ( = ?auto_2553 ?auto_2562 ) ) ( not ( = ?auto_2554 ?auto_2562 ) ) ( not ( = ?auto_2564 ?auto_2562 ) ) ( not ( = ?auto_2555 ?auto_2562 ) ) ( TRUCK-AT ?auto_2560 ?auto_2558 ) ( SURFACE-AT ?auto_2565 ?auto_2558 ) ( CLEAR ?auto_2565 ) ( LIFTING ?auto_2559 ?auto_2555 ) ( IS-CRATE ?auto_2555 ) ( not ( = ?auto_2553 ?auto_2565 ) ) ( not ( = ?auto_2554 ?auto_2565 ) ) ( not ( = ?auto_2564 ?auto_2565 ) ) ( not ( = ?auto_2555 ?auto_2565 ) ) ( not ( = ?auto_2562 ?auto_2565 ) ) )
    :subtasks
    ( ( !DROP ?auto_2559 ?auto_2555 ?auto_2565 ?auto_2558 )
      ( MAKE-ON ?auto_2553 ?auto_2554 )
      ( MAKE-ON-VERIFY ?auto_2553 ?auto_2554 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2566 - SURFACE
      ?auto_2567 - SURFACE
    )
    :vars
    (
      ?auto_2574 - HOIST
      ?auto_2573 - PLACE
      ?auto_2569 - PLACE
      ?auto_2572 - HOIST
      ?auto_2568 - SURFACE
      ?auto_2577 - SURFACE
      ?auto_2571 - PLACE
      ?auto_2576 - HOIST
      ?auto_2578 - SURFACE
      ?auto_2570 - TRUCK
      ?auto_2575 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2574 ?auto_2573 ) ( IS-CRATE ?auto_2566 ) ( not ( = ?auto_2566 ?auto_2567 ) ) ( not ( = ?auto_2569 ?auto_2573 ) ) ( HOIST-AT ?auto_2572 ?auto_2569 ) ( not ( = ?auto_2574 ?auto_2572 ) ) ( AVAILABLE ?auto_2572 ) ( SURFACE-AT ?auto_2566 ?auto_2569 ) ( ON ?auto_2566 ?auto_2568 ) ( CLEAR ?auto_2566 ) ( not ( = ?auto_2566 ?auto_2568 ) ) ( not ( = ?auto_2567 ?auto_2568 ) ) ( IS-CRATE ?auto_2567 ) ( not ( = ?auto_2566 ?auto_2577 ) ) ( not ( = ?auto_2567 ?auto_2577 ) ) ( not ( = ?auto_2568 ?auto_2577 ) ) ( not ( = ?auto_2571 ?auto_2573 ) ) ( not ( = ?auto_2569 ?auto_2571 ) ) ( HOIST-AT ?auto_2576 ?auto_2571 ) ( not ( = ?auto_2574 ?auto_2576 ) ) ( not ( = ?auto_2572 ?auto_2576 ) ) ( AVAILABLE ?auto_2576 ) ( SURFACE-AT ?auto_2567 ?auto_2571 ) ( ON ?auto_2567 ?auto_2578 ) ( CLEAR ?auto_2567 ) ( not ( = ?auto_2566 ?auto_2578 ) ) ( not ( = ?auto_2567 ?auto_2578 ) ) ( not ( = ?auto_2568 ?auto_2578 ) ) ( not ( = ?auto_2577 ?auto_2578 ) ) ( TRUCK-AT ?auto_2570 ?auto_2573 ) ( SURFACE-AT ?auto_2575 ?auto_2573 ) ( CLEAR ?auto_2575 ) ( IS-CRATE ?auto_2577 ) ( not ( = ?auto_2566 ?auto_2575 ) ) ( not ( = ?auto_2567 ?auto_2575 ) ) ( not ( = ?auto_2568 ?auto_2575 ) ) ( not ( = ?auto_2577 ?auto_2575 ) ) ( not ( = ?auto_2578 ?auto_2575 ) ) ( AVAILABLE ?auto_2574 ) ( IN ?auto_2577 ?auto_2570 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2574 ?auto_2577 ?auto_2570 ?auto_2573 )
      ( MAKE-ON ?auto_2566 ?auto_2567 )
      ( MAKE-ON-VERIFY ?auto_2566 ?auto_2567 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2579 - SURFACE
      ?auto_2580 - SURFACE
    )
    :vars
    (
      ?auto_2581 - HOIST
      ?auto_2583 - PLACE
      ?auto_2588 - PLACE
      ?auto_2582 - HOIST
      ?auto_2591 - SURFACE
      ?auto_2584 - SURFACE
      ?auto_2586 - PLACE
      ?auto_2589 - HOIST
      ?auto_2585 - SURFACE
      ?auto_2587 - SURFACE
      ?auto_2590 - TRUCK
      ?auto_2592 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2581 ?auto_2583 ) ( IS-CRATE ?auto_2579 ) ( not ( = ?auto_2579 ?auto_2580 ) ) ( not ( = ?auto_2588 ?auto_2583 ) ) ( HOIST-AT ?auto_2582 ?auto_2588 ) ( not ( = ?auto_2581 ?auto_2582 ) ) ( AVAILABLE ?auto_2582 ) ( SURFACE-AT ?auto_2579 ?auto_2588 ) ( ON ?auto_2579 ?auto_2591 ) ( CLEAR ?auto_2579 ) ( not ( = ?auto_2579 ?auto_2591 ) ) ( not ( = ?auto_2580 ?auto_2591 ) ) ( IS-CRATE ?auto_2580 ) ( not ( = ?auto_2579 ?auto_2584 ) ) ( not ( = ?auto_2580 ?auto_2584 ) ) ( not ( = ?auto_2591 ?auto_2584 ) ) ( not ( = ?auto_2586 ?auto_2583 ) ) ( not ( = ?auto_2588 ?auto_2586 ) ) ( HOIST-AT ?auto_2589 ?auto_2586 ) ( not ( = ?auto_2581 ?auto_2589 ) ) ( not ( = ?auto_2582 ?auto_2589 ) ) ( AVAILABLE ?auto_2589 ) ( SURFACE-AT ?auto_2580 ?auto_2586 ) ( ON ?auto_2580 ?auto_2585 ) ( CLEAR ?auto_2580 ) ( not ( = ?auto_2579 ?auto_2585 ) ) ( not ( = ?auto_2580 ?auto_2585 ) ) ( not ( = ?auto_2591 ?auto_2585 ) ) ( not ( = ?auto_2584 ?auto_2585 ) ) ( SURFACE-AT ?auto_2587 ?auto_2583 ) ( CLEAR ?auto_2587 ) ( IS-CRATE ?auto_2584 ) ( not ( = ?auto_2579 ?auto_2587 ) ) ( not ( = ?auto_2580 ?auto_2587 ) ) ( not ( = ?auto_2591 ?auto_2587 ) ) ( not ( = ?auto_2584 ?auto_2587 ) ) ( not ( = ?auto_2585 ?auto_2587 ) ) ( AVAILABLE ?auto_2581 ) ( IN ?auto_2584 ?auto_2590 ) ( TRUCK-AT ?auto_2590 ?auto_2592 ) ( not ( = ?auto_2592 ?auto_2583 ) ) ( not ( = ?auto_2588 ?auto_2592 ) ) ( not ( = ?auto_2586 ?auto_2592 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2590 ?auto_2592 ?auto_2583 )
      ( MAKE-ON ?auto_2579 ?auto_2580 )
      ( MAKE-ON-VERIFY ?auto_2579 ?auto_2580 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2593 - SURFACE
      ?auto_2594 - SURFACE
    )
    :vars
    (
      ?auto_2605 - HOIST
      ?auto_2604 - PLACE
      ?auto_2602 - PLACE
      ?auto_2595 - HOIST
      ?auto_2597 - SURFACE
      ?auto_2596 - SURFACE
      ?auto_2601 - PLACE
      ?auto_2599 - HOIST
      ?auto_2600 - SURFACE
      ?auto_2598 - SURFACE
      ?auto_2603 - TRUCK
      ?auto_2606 - PLACE
      ?auto_2607 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2605 ?auto_2604 ) ( IS-CRATE ?auto_2593 ) ( not ( = ?auto_2593 ?auto_2594 ) ) ( not ( = ?auto_2602 ?auto_2604 ) ) ( HOIST-AT ?auto_2595 ?auto_2602 ) ( not ( = ?auto_2605 ?auto_2595 ) ) ( AVAILABLE ?auto_2595 ) ( SURFACE-AT ?auto_2593 ?auto_2602 ) ( ON ?auto_2593 ?auto_2597 ) ( CLEAR ?auto_2593 ) ( not ( = ?auto_2593 ?auto_2597 ) ) ( not ( = ?auto_2594 ?auto_2597 ) ) ( IS-CRATE ?auto_2594 ) ( not ( = ?auto_2593 ?auto_2596 ) ) ( not ( = ?auto_2594 ?auto_2596 ) ) ( not ( = ?auto_2597 ?auto_2596 ) ) ( not ( = ?auto_2601 ?auto_2604 ) ) ( not ( = ?auto_2602 ?auto_2601 ) ) ( HOIST-AT ?auto_2599 ?auto_2601 ) ( not ( = ?auto_2605 ?auto_2599 ) ) ( not ( = ?auto_2595 ?auto_2599 ) ) ( AVAILABLE ?auto_2599 ) ( SURFACE-AT ?auto_2594 ?auto_2601 ) ( ON ?auto_2594 ?auto_2600 ) ( CLEAR ?auto_2594 ) ( not ( = ?auto_2593 ?auto_2600 ) ) ( not ( = ?auto_2594 ?auto_2600 ) ) ( not ( = ?auto_2597 ?auto_2600 ) ) ( not ( = ?auto_2596 ?auto_2600 ) ) ( SURFACE-AT ?auto_2598 ?auto_2604 ) ( CLEAR ?auto_2598 ) ( IS-CRATE ?auto_2596 ) ( not ( = ?auto_2593 ?auto_2598 ) ) ( not ( = ?auto_2594 ?auto_2598 ) ) ( not ( = ?auto_2597 ?auto_2598 ) ) ( not ( = ?auto_2596 ?auto_2598 ) ) ( not ( = ?auto_2600 ?auto_2598 ) ) ( AVAILABLE ?auto_2605 ) ( TRUCK-AT ?auto_2603 ?auto_2606 ) ( not ( = ?auto_2606 ?auto_2604 ) ) ( not ( = ?auto_2602 ?auto_2606 ) ) ( not ( = ?auto_2601 ?auto_2606 ) ) ( HOIST-AT ?auto_2607 ?auto_2606 ) ( LIFTING ?auto_2607 ?auto_2596 ) ( not ( = ?auto_2605 ?auto_2607 ) ) ( not ( = ?auto_2595 ?auto_2607 ) ) ( not ( = ?auto_2599 ?auto_2607 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2607 ?auto_2596 ?auto_2603 ?auto_2606 )
      ( MAKE-ON ?auto_2593 ?auto_2594 )
      ( MAKE-ON-VERIFY ?auto_2593 ?auto_2594 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2608 - SURFACE
      ?auto_2609 - SURFACE
    )
    :vars
    (
      ?auto_2616 - HOIST
      ?auto_2613 - PLACE
      ?auto_2611 - PLACE
      ?auto_2612 - HOIST
      ?auto_2614 - SURFACE
      ?auto_2618 - SURFACE
      ?auto_2620 - PLACE
      ?auto_2615 - HOIST
      ?auto_2622 - SURFACE
      ?auto_2617 - SURFACE
      ?auto_2621 - TRUCK
      ?auto_2610 - PLACE
      ?auto_2619 - HOIST
      ?auto_2623 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2616 ?auto_2613 ) ( IS-CRATE ?auto_2608 ) ( not ( = ?auto_2608 ?auto_2609 ) ) ( not ( = ?auto_2611 ?auto_2613 ) ) ( HOIST-AT ?auto_2612 ?auto_2611 ) ( not ( = ?auto_2616 ?auto_2612 ) ) ( AVAILABLE ?auto_2612 ) ( SURFACE-AT ?auto_2608 ?auto_2611 ) ( ON ?auto_2608 ?auto_2614 ) ( CLEAR ?auto_2608 ) ( not ( = ?auto_2608 ?auto_2614 ) ) ( not ( = ?auto_2609 ?auto_2614 ) ) ( IS-CRATE ?auto_2609 ) ( not ( = ?auto_2608 ?auto_2618 ) ) ( not ( = ?auto_2609 ?auto_2618 ) ) ( not ( = ?auto_2614 ?auto_2618 ) ) ( not ( = ?auto_2620 ?auto_2613 ) ) ( not ( = ?auto_2611 ?auto_2620 ) ) ( HOIST-AT ?auto_2615 ?auto_2620 ) ( not ( = ?auto_2616 ?auto_2615 ) ) ( not ( = ?auto_2612 ?auto_2615 ) ) ( AVAILABLE ?auto_2615 ) ( SURFACE-AT ?auto_2609 ?auto_2620 ) ( ON ?auto_2609 ?auto_2622 ) ( CLEAR ?auto_2609 ) ( not ( = ?auto_2608 ?auto_2622 ) ) ( not ( = ?auto_2609 ?auto_2622 ) ) ( not ( = ?auto_2614 ?auto_2622 ) ) ( not ( = ?auto_2618 ?auto_2622 ) ) ( SURFACE-AT ?auto_2617 ?auto_2613 ) ( CLEAR ?auto_2617 ) ( IS-CRATE ?auto_2618 ) ( not ( = ?auto_2608 ?auto_2617 ) ) ( not ( = ?auto_2609 ?auto_2617 ) ) ( not ( = ?auto_2614 ?auto_2617 ) ) ( not ( = ?auto_2618 ?auto_2617 ) ) ( not ( = ?auto_2622 ?auto_2617 ) ) ( AVAILABLE ?auto_2616 ) ( TRUCK-AT ?auto_2621 ?auto_2610 ) ( not ( = ?auto_2610 ?auto_2613 ) ) ( not ( = ?auto_2611 ?auto_2610 ) ) ( not ( = ?auto_2620 ?auto_2610 ) ) ( HOIST-AT ?auto_2619 ?auto_2610 ) ( not ( = ?auto_2616 ?auto_2619 ) ) ( not ( = ?auto_2612 ?auto_2619 ) ) ( not ( = ?auto_2615 ?auto_2619 ) ) ( AVAILABLE ?auto_2619 ) ( SURFACE-AT ?auto_2618 ?auto_2610 ) ( ON ?auto_2618 ?auto_2623 ) ( CLEAR ?auto_2618 ) ( not ( = ?auto_2608 ?auto_2623 ) ) ( not ( = ?auto_2609 ?auto_2623 ) ) ( not ( = ?auto_2614 ?auto_2623 ) ) ( not ( = ?auto_2618 ?auto_2623 ) ) ( not ( = ?auto_2622 ?auto_2623 ) ) ( not ( = ?auto_2617 ?auto_2623 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2619 ?auto_2618 ?auto_2623 ?auto_2610 )
      ( MAKE-ON ?auto_2608 ?auto_2609 )
      ( MAKE-ON-VERIFY ?auto_2608 ?auto_2609 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2624 - SURFACE
      ?auto_2625 - SURFACE
    )
    :vars
    (
      ?auto_2626 - HOIST
      ?auto_2636 - PLACE
      ?auto_2628 - PLACE
      ?auto_2631 - HOIST
      ?auto_2634 - SURFACE
      ?auto_2637 - SURFACE
      ?auto_2632 - PLACE
      ?auto_2627 - HOIST
      ?auto_2633 - SURFACE
      ?auto_2635 - SURFACE
      ?auto_2638 - PLACE
      ?auto_2630 - HOIST
      ?auto_2639 - SURFACE
      ?auto_2629 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2626 ?auto_2636 ) ( IS-CRATE ?auto_2624 ) ( not ( = ?auto_2624 ?auto_2625 ) ) ( not ( = ?auto_2628 ?auto_2636 ) ) ( HOIST-AT ?auto_2631 ?auto_2628 ) ( not ( = ?auto_2626 ?auto_2631 ) ) ( AVAILABLE ?auto_2631 ) ( SURFACE-AT ?auto_2624 ?auto_2628 ) ( ON ?auto_2624 ?auto_2634 ) ( CLEAR ?auto_2624 ) ( not ( = ?auto_2624 ?auto_2634 ) ) ( not ( = ?auto_2625 ?auto_2634 ) ) ( IS-CRATE ?auto_2625 ) ( not ( = ?auto_2624 ?auto_2637 ) ) ( not ( = ?auto_2625 ?auto_2637 ) ) ( not ( = ?auto_2634 ?auto_2637 ) ) ( not ( = ?auto_2632 ?auto_2636 ) ) ( not ( = ?auto_2628 ?auto_2632 ) ) ( HOIST-AT ?auto_2627 ?auto_2632 ) ( not ( = ?auto_2626 ?auto_2627 ) ) ( not ( = ?auto_2631 ?auto_2627 ) ) ( AVAILABLE ?auto_2627 ) ( SURFACE-AT ?auto_2625 ?auto_2632 ) ( ON ?auto_2625 ?auto_2633 ) ( CLEAR ?auto_2625 ) ( not ( = ?auto_2624 ?auto_2633 ) ) ( not ( = ?auto_2625 ?auto_2633 ) ) ( not ( = ?auto_2634 ?auto_2633 ) ) ( not ( = ?auto_2637 ?auto_2633 ) ) ( SURFACE-AT ?auto_2635 ?auto_2636 ) ( CLEAR ?auto_2635 ) ( IS-CRATE ?auto_2637 ) ( not ( = ?auto_2624 ?auto_2635 ) ) ( not ( = ?auto_2625 ?auto_2635 ) ) ( not ( = ?auto_2634 ?auto_2635 ) ) ( not ( = ?auto_2637 ?auto_2635 ) ) ( not ( = ?auto_2633 ?auto_2635 ) ) ( AVAILABLE ?auto_2626 ) ( not ( = ?auto_2638 ?auto_2636 ) ) ( not ( = ?auto_2628 ?auto_2638 ) ) ( not ( = ?auto_2632 ?auto_2638 ) ) ( HOIST-AT ?auto_2630 ?auto_2638 ) ( not ( = ?auto_2626 ?auto_2630 ) ) ( not ( = ?auto_2631 ?auto_2630 ) ) ( not ( = ?auto_2627 ?auto_2630 ) ) ( AVAILABLE ?auto_2630 ) ( SURFACE-AT ?auto_2637 ?auto_2638 ) ( ON ?auto_2637 ?auto_2639 ) ( CLEAR ?auto_2637 ) ( not ( = ?auto_2624 ?auto_2639 ) ) ( not ( = ?auto_2625 ?auto_2639 ) ) ( not ( = ?auto_2634 ?auto_2639 ) ) ( not ( = ?auto_2637 ?auto_2639 ) ) ( not ( = ?auto_2633 ?auto_2639 ) ) ( not ( = ?auto_2635 ?auto_2639 ) ) ( TRUCK-AT ?auto_2629 ?auto_2636 ) )
    :subtasks
    ( ( !DRIVE ?auto_2629 ?auto_2636 ?auto_2638 )
      ( MAKE-ON ?auto_2624 ?auto_2625 )
      ( MAKE-ON-VERIFY ?auto_2624 ?auto_2625 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2642 - SURFACE
      ?auto_2643 - SURFACE
    )
    :vars
    (
      ?auto_2644 - HOIST
      ?auto_2645 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2644 ?auto_2645 ) ( SURFACE-AT ?auto_2643 ?auto_2645 ) ( CLEAR ?auto_2643 ) ( LIFTING ?auto_2644 ?auto_2642 ) ( IS-CRATE ?auto_2642 ) ( not ( = ?auto_2642 ?auto_2643 ) ) )
    :subtasks
    ( ( !DROP ?auto_2644 ?auto_2642 ?auto_2643 ?auto_2645 )
      ( MAKE-ON-VERIFY ?auto_2642 ?auto_2643 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2646 - SURFACE
      ?auto_2647 - SURFACE
    )
    :vars
    (
      ?auto_2649 - HOIST
      ?auto_2648 - PLACE
      ?auto_2650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2649 ?auto_2648 ) ( SURFACE-AT ?auto_2647 ?auto_2648 ) ( CLEAR ?auto_2647 ) ( IS-CRATE ?auto_2646 ) ( not ( = ?auto_2646 ?auto_2647 ) ) ( TRUCK-AT ?auto_2650 ?auto_2648 ) ( AVAILABLE ?auto_2649 ) ( IN ?auto_2646 ?auto_2650 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2649 ?auto_2646 ?auto_2650 ?auto_2648 )
      ( MAKE-ON ?auto_2646 ?auto_2647 )
      ( MAKE-ON-VERIFY ?auto_2646 ?auto_2647 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2651 - SURFACE
      ?auto_2652 - SURFACE
    )
    :vars
    (
      ?auto_2653 - HOIST
      ?auto_2654 - PLACE
      ?auto_2655 - TRUCK
      ?auto_2656 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2653 ?auto_2654 ) ( SURFACE-AT ?auto_2652 ?auto_2654 ) ( CLEAR ?auto_2652 ) ( IS-CRATE ?auto_2651 ) ( not ( = ?auto_2651 ?auto_2652 ) ) ( AVAILABLE ?auto_2653 ) ( IN ?auto_2651 ?auto_2655 ) ( TRUCK-AT ?auto_2655 ?auto_2656 ) ( not ( = ?auto_2656 ?auto_2654 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2655 ?auto_2656 ?auto_2654 )
      ( MAKE-ON ?auto_2651 ?auto_2652 )
      ( MAKE-ON-VERIFY ?auto_2651 ?auto_2652 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2657 - SURFACE
      ?auto_2658 - SURFACE
    )
    :vars
    (
      ?auto_2662 - HOIST
      ?auto_2660 - PLACE
      ?auto_2659 - TRUCK
      ?auto_2661 - PLACE
      ?auto_2663 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2662 ?auto_2660 ) ( SURFACE-AT ?auto_2658 ?auto_2660 ) ( CLEAR ?auto_2658 ) ( IS-CRATE ?auto_2657 ) ( not ( = ?auto_2657 ?auto_2658 ) ) ( AVAILABLE ?auto_2662 ) ( TRUCK-AT ?auto_2659 ?auto_2661 ) ( not ( = ?auto_2661 ?auto_2660 ) ) ( HOIST-AT ?auto_2663 ?auto_2661 ) ( LIFTING ?auto_2663 ?auto_2657 ) ( not ( = ?auto_2662 ?auto_2663 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2663 ?auto_2657 ?auto_2659 ?auto_2661 )
      ( MAKE-ON ?auto_2657 ?auto_2658 )
      ( MAKE-ON-VERIFY ?auto_2657 ?auto_2658 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2664 - SURFACE
      ?auto_2665 - SURFACE
    )
    :vars
    (
      ?auto_2669 - HOIST
      ?auto_2666 - PLACE
      ?auto_2667 - TRUCK
      ?auto_2668 - PLACE
      ?auto_2670 - HOIST
      ?auto_2671 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2669 ?auto_2666 ) ( SURFACE-AT ?auto_2665 ?auto_2666 ) ( CLEAR ?auto_2665 ) ( IS-CRATE ?auto_2664 ) ( not ( = ?auto_2664 ?auto_2665 ) ) ( AVAILABLE ?auto_2669 ) ( TRUCK-AT ?auto_2667 ?auto_2668 ) ( not ( = ?auto_2668 ?auto_2666 ) ) ( HOIST-AT ?auto_2670 ?auto_2668 ) ( not ( = ?auto_2669 ?auto_2670 ) ) ( AVAILABLE ?auto_2670 ) ( SURFACE-AT ?auto_2664 ?auto_2668 ) ( ON ?auto_2664 ?auto_2671 ) ( CLEAR ?auto_2664 ) ( not ( = ?auto_2664 ?auto_2671 ) ) ( not ( = ?auto_2665 ?auto_2671 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2670 ?auto_2664 ?auto_2671 ?auto_2668 )
      ( MAKE-ON ?auto_2664 ?auto_2665 )
      ( MAKE-ON-VERIFY ?auto_2664 ?auto_2665 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2672 - SURFACE
      ?auto_2673 - SURFACE
    )
    :vars
    (
      ?auto_2676 - HOIST
      ?auto_2679 - PLACE
      ?auto_2675 - PLACE
      ?auto_2677 - HOIST
      ?auto_2674 - SURFACE
      ?auto_2678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2676 ?auto_2679 ) ( SURFACE-AT ?auto_2673 ?auto_2679 ) ( CLEAR ?auto_2673 ) ( IS-CRATE ?auto_2672 ) ( not ( = ?auto_2672 ?auto_2673 ) ) ( AVAILABLE ?auto_2676 ) ( not ( = ?auto_2675 ?auto_2679 ) ) ( HOIST-AT ?auto_2677 ?auto_2675 ) ( not ( = ?auto_2676 ?auto_2677 ) ) ( AVAILABLE ?auto_2677 ) ( SURFACE-AT ?auto_2672 ?auto_2675 ) ( ON ?auto_2672 ?auto_2674 ) ( CLEAR ?auto_2672 ) ( not ( = ?auto_2672 ?auto_2674 ) ) ( not ( = ?auto_2673 ?auto_2674 ) ) ( TRUCK-AT ?auto_2678 ?auto_2679 ) )
    :subtasks
    ( ( !DRIVE ?auto_2678 ?auto_2679 ?auto_2675 )
      ( MAKE-ON ?auto_2672 ?auto_2673 )
      ( MAKE-ON-VERIFY ?auto_2672 ?auto_2673 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2680 - SURFACE
      ?auto_2681 - SURFACE
    )
    :vars
    (
      ?auto_2683 - HOIST
      ?auto_2685 - PLACE
      ?auto_2686 - PLACE
      ?auto_2682 - HOIST
      ?auto_2687 - SURFACE
      ?auto_2684 - TRUCK
      ?auto_2688 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2683 ?auto_2685 ) ( IS-CRATE ?auto_2680 ) ( not ( = ?auto_2680 ?auto_2681 ) ) ( not ( = ?auto_2686 ?auto_2685 ) ) ( HOIST-AT ?auto_2682 ?auto_2686 ) ( not ( = ?auto_2683 ?auto_2682 ) ) ( AVAILABLE ?auto_2682 ) ( SURFACE-AT ?auto_2680 ?auto_2686 ) ( ON ?auto_2680 ?auto_2687 ) ( CLEAR ?auto_2680 ) ( not ( = ?auto_2680 ?auto_2687 ) ) ( not ( = ?auto_2681 ?auto_2687 ) ) ( TRUCK-AT ?auto_2684 ?auto_2685 ) ( SURFACE-AT ?auto_2688 ?auto_2685 ) ( CLEAR ?auto_2688 ) ( LIFTING ?auto_2683 ?auto_2681 ) ( IS-CRATE ?auto_2681 ) ( not ( = ?auto_2680 ?auto_2688 ) ) ( not ( = ?auto_2681 ?auto_2688 ) ) ( not ( = ?auto_2687 ?auto_2688 ) ) )
    :subtasks
    ( ( !DROP ?auto_2683 ?auto_2681 ?auto_2688 ?auto_2685 )
      ( MAKE-ON ?auto_2680 ?auto_2681 )
      ( MAKE-ON-VERIFY ?auto_2680 ?auto_2681 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2689 - SURFACE
      ?auto_2690 - SURFACE
    )
    :vars
    (
      ?auto_2692 - HOIST
      ?auto_2695 - PLACE
      ?auto_2694 - PLACE
      ?auto_2696 - HOIST
      ?auto_2691 - SURFACE
      ?auto_2693 - TRUCK
      ?auto_2697 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2692 ?auto_2695 ) ( IS-CRATE ?auto_2689 ) ( not ( = ?auto_2689 ?auto_2690 ) ) ( not ( = ?auto_2694 ?auto_2695 ) ) ( HOIST-AT ?auto_2696 ?auto_2694 ) ( not ( = ?auto_2692 ?auto_2696 ) ) ( AVAILABLE ?auto_2696 ) ( SURFACE-AT ?auto_2689 ?auto_2694 ) ( ON ?auto_2689 ?auto_2691 ) ( CLEAR ?auto_2689 ) ( not ( = ?auto_2689 ?auto_2691 ) ) ( not ( = ?auto_2690 ?auto_2691 ) ) ( TRUCK-AT ?auto_2693 ?auto_2695 ) ( SURFACE-AT ?auto_2697 ?auto_2695 ) ( CLEAR ?auto_2697 ) ( IS-CRATE ?auto_2690 ) ( not ( = ?auto_2689 ?auto_2697 ) ) ( not ( = ?auto_2690 ?auto_2697 ) ) ( not ( = ?auto_2691 ?auto_2697 ) ) ( AVAILABLE ?auto_2692 ) ( IN ?auto_2690 ?auto_2693 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2692 ?auto_2690 ?auto_2693 ?auto_2695 )
      ( MAKE-ON ?auto_2689 ?auto_2690 )
      ( MAKE-ON-VERIFY ?auto_2689 ?auto_2690 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2698 - SURFACE
      ?auto_2699 - SURFACE
    )
    :vars
    (
      ?auto_2704 - HOIST
      ?auto_2702 - PLACE
      ?auto_2701 - PLACE
      ?auto_2705 - HOIST
      ?auto_2703 - SURFACE
      ?auto_2706 - SURFACE
      ?auto_2700 - TRUCK
      ?auto_2707 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2704 ?auto_2702 ) ( IS-CRATE ?auto_2698 ) ( not ( = ?auto_2698 ?auto_2699 ) ) ( not ( = ?auto_2701 ?auto_2702 ) ) ( HOIST-AT ?auto_2705 ?auto_2701 ) ( not ( = ?auto_2704 ?auto_2705 ) ) ( AVAILABLE ?auto_2705 ) ( SURFACE-AT ?auto_2698 ?auto_2701 ) ( ON ?auto_2698 ?auto_2703 ) ( CLEAR ?auto_2698 ) ( not ( = ?auto_2698 ?auto_2703 ) ) ( not ( = ?auto_2699 ?auto_2703 ) ) ( SURFACE-AT ?auto_2706 ?auto_2702 ) ( CLEAR ?auto_2706 ) ( IS-CRATE ?auto_2699 ) ( not ( = ?auto_2698 ?auto_2706 ) ) ( not ( = ?auto_2699 ?auto_2706 ) ) ( not ( = ?auto_2703 ?auto_2706 ) ) ( AVAILABLE ?auto_2704 ) ( IN ?auto_2699 ?auto_2700 ) ( TRUCK-AT ?auto_2700 ?auto_2707 ) ( not ( = ?auto_2707 ?auto_2702 ) ) ( not ( = ?auto_2701 ?auto_2707 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2700 ?auto_2707 ?auto_2702 )
      ( MAKE-ON ?auto_2698 ?auto_2699 )
      ( MAKE-ON-VERIFY ?auto_2698 ?auto_2699 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2708 - SURFACE
      ?auto_2709 - SURFACE
    )
    :vars
    (
      ?auto_2714 - HOIST
      ?auto_2712 - PLACE
      ?auto_2711 - PLACE
      ?auto_2715 - HOIST
      ?auto_2713 - SURFACE
      ?auto_2710 - SURFACE
      ?auto_2717 - TRUCK
      ?auto_2716 - PLACE
      ?auto_2718 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2714 ?auto_2712 ) ( IS-CRATE ?auto_2708 ) ( not ( = ?auto_2708 ?auto_2709 ) ) ( not ( = ?auto_2711 ?auto_2712 ) ) ( HOIST-AT ?auto_2715 ?auto_2711 ) ( not ( = ?auto_2714 ?auto_2715 ) ) ( AVAILABLE ?auto_2715 ) ( SURFACE-AT ?auto_2708 ?auto_2711 ) ( ON ?auto_2708 ?auto_2713 ) ( CLEAR ?auto_2708 ) ( not ( = ?auto_2708 ?auto_2713 ) ) ( not ( = ?auto_2709 ?auto_2713 ) ) ( SURFACE-AT ?auto_2710 ?auto_2712 ) ( CLEAR ?auto_2710 ) ( IS-CRATE ?auto_2709 ) ( not ( = ?auto_2708 ?auto_2710 ) ) ( not ( = ?auto_2709 ?auto_2710 ) ) ( not ( = ?auto_2713 ?auto_2710 ) ) ( AVAILABLE ?auto_2714 ) ( TRUCK-AT ?auto_2717 ?auto_2716 ) ( not ( = ?auto_2716 ?auto_2712 ) ) ( not ( = ?auto_2711 ?auto_2716 ) ) ( HOIST-AT ?auto_2718 ?auto_2716 ) ( LIFTING ?auto_2718 ?auto_2709 ) ( not ( = ?auto_2714 ?auto_2718 ) ) ( not ( = ?auto_2715 ?auto_2718 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2718 ?auto_2709 ?auto_2717 ?auto_2716 )
      ( MAKE-ON ?auto_2708 ?auto_2709 )
      ( MAKE-ON-VERIFY ?auto_2708 ?auto_2709 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2719 - SURFACE
      ?auto_2720 - SURFACE
    )
    :vars
    (
      ?auto_2726 - HOIST
      ?auto_2724 - PLACE
      ?auto_2727 - PLACE
      ?auto_2725 - HOIST
      ?auto_2722 - SURFACE
      ?auto_2729 - SURFACE
      ?auto_2721 - TRUCK
      ?auto_2723 - PLACE
      ?auto_2728 - HOIST
      ?auto_2730 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2726 ?auto_2724 ) ( IS-CRATE ?auto_2719 ) ( not ( = ?auto_2719 ?auto_2720 ) ) ( not ( = ?auto_2727 ?auto_2724 ) ) ( HOIST-AT ?auto_2725 ?auto_2727 ) ( not ( = ?auto_2726 ?auto_2725 ) ) ( AVAILABLE ?auto_2725 ) ( SURFACE-AT ?auto_2719 ?auto_2727 ) ( ON ?auto_2719 ?auto_2722 ) ( CLEAR ?auto_2719 ) ( not ( = ?auto_2719 ?auto_2722 ) ) ( not ( = ?auto_2720 ?auto_2722 ) ) ( SURFACE-AT ?auto_2729 ?auto_2724 ) ( CLEAR ?auto_2729 ) ( IS-CRATE ?auto_2720 ) ( not ( = ?auto_2719 ?auto_2729 ) ) ( not ( = ?auto_2720 ?auto_2729 ) ) ( not ( = ?auto_2722 ?auto_2729 ) ) ( AVAILABLE ?auto_2726 ) ( TRUCK-AT ?auto_2721 ?auto_2723 ) ( not ( = ?auto_2723 ?auto_2724 ) ) ( not ( = ?auto_2727 ?auto_2723 ) ) ( HOIST-AT ?auto_2728 ?auto_2723 ) ( not ( = ?auto_2726 ?auto_2728 ) ) ( not ( = ?auto_2725 ?auto_2728 ) ) ( AVAILABLE ?auto_2728 ) ( SURFACE-AT ?auto_2720 ?auto_2723 ) ( ON ?auto_2720 ?auto_2730 ) ( CLEAR ?auto_2720 ) ( not ( = ?auto_2719 ?auto_2730 ) ) ( not ( = ?auto_2720 ?auto_2730 ) ) ( not ( = ?auto_2722 ?auto_2730 ) ) ( not ( = ?auto_2729 ?auto_2730 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2728 ?auto_2720 ?auto_2730 ?auto_2723 )
      ( MAKE-ON ?auto_2719 ?auto_2720 )
      ( MAKE-ON-VERIFY ?auto_2719 ?auto_2720 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2731 - SURFACE
      ?auto_2732 - SURFACE
    )
    :vars
    (
      ?auto_2734 - HOIST
      ?auto_2735 - PLACE
      ?auto_2741 - PLACE
      ?auto_2733 - HOIST
      ?auto_2738 - SURFACE
      ?auto_2737 - SURFACE
      ?auto_2740 - PLACE
      ?auto_2739 - HOIST
      ?auto_2742 - SURFACE
      ?auto_2736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2734 ?auto_2735 ) ( IS-CRATE ?auto_2731 ) ( not ( = ?auto_2731 ?auto_2732 ) ) ( not ( = ?auto_2741 ?auto_2735 ) ) ( HOIST-AT ?auto_2733 ?auto_2741 ) ( not ( = ?auto_2734 ?auto_2733 ) ) ( AVAILABLE ?auto_2733 ) ( SURFACE-AT ?auto_2731 ?auto_2741 ) ( ON ?auto_2731 ?auto_2738 ) ( CLEAR ?auto_2731 ) ( not ( = ?auto_2731 ?auto_2738 ) ) ( not ( = ?auto_2732 ?auto_2738 ) ) ( SURFACE-AT ?auto_2737 ?auto_2735 ) ( CLEAR ?auto_2737 ) ( IS-CRATE ?auto_2732 ) ( not ( = ?auto_2731 ?auto_2737 ) ) ( not ( = ?auto_2732 ?auto_2737 ) ) ( not ( = ?auto_2738 ?auto_2737 ) ) ( AVAILABLE ?auto_2734 ) ( not ( = ?auto_2740 ?auto_2735 ) ) ( not ( = ?auto_2741 ?auto_2740 ) ) ( HOIST-AT ?auto_2739 ?auto_2740 ) ( not ( = ?auto_2734 ?auto_2739 ) ) ( not ( = ?auto_2733 ?auto_2739 ) ) ( AVAILABLE ?auto_2739 ) ( SURFACE-AT ?auto_2732 ?auto_2740 ) ( ON ?auto_2732 ?auto_2742 ) ( CLEAR ?auto_2732 ) ( not ( = ?auto_2731 ?auto_2742 ) ) ( not ( = ?auto_2732 ?auto_2742 ) ) ( not ( = ?auto_2738 ?auto_2742 ) ) ( not ( = ?auto_2737 ?auto_2742 ) ) ( TRUCK-AT ?auto_2736 ?auto_2735 ) )
    :subtasks
    ( ( !DRIVE ?auto_2736 ?auto_2735 ?auto_2740 )
      ( MAKE-ON ?auto_2731 ?auto_2732 )
      ( MAKE-ON-VERIFY ?auto_2731 ?auto_2732 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2743 - SURFACE
      ?auto_2744 - SURFACE
    )
    :vars
    (
      ?auto_2751 - HOIST
      ?auto_2750 - PLACE
      ?auto_2754 - PLACE
      ?auto_2747 - HOIST
      ?auto_2746 - SURFACE
      ?auto_2745 - SURFACE
      ?auto_2749 - PLACE
      ?auto_2753 - HOIST
      ?auto_2752 - SURFACE
      ?auto_2748 - TRUCK
      ?auto_2755 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2751 ?auto_2750 ) ( IS-CRATE ?auto_2743 ) ( not ( = ?auto_2743 ?auto_2744 ) ) ( not ( = ?auto_2754 ?auto_2750 ) ) ( HOIST-AT ?auto_2747 ?auto_2754 ) ( not ( = ?auto_2751 ?auto_2747 ) ) ( AVAILABLE ?auto_2747 ) ( SURFACE-AT ?auto_2743 ?auto_2754 ) ( ON ?auto_2743 ?auto_2746 ) ( CLEAR ?auto_2743 ) ( not ( = ?auto_2743 ?auto_2746 ) ) ( not ( = ?auto_2744 ?auto_2746 ) ) ( IS-CRATE ?auto_2744 ) ( not ( = ?auto_2743 ?auto_2745 ) ) ( not ( = ?auto_2744 ?auto_2745 ) ) ( not ( = ?auto_2746 ?auto_2745 ) ) ( not ( = ?auto_2749 ?auto_2750 ) ) ( not ( = ?auto_2754 ?auto_2749 ) ) ( HOIST-AT ?auto_2753 ?auto_2749 ) ( not ( = ?auto_2751 ?auto_2753 ) ) ( not ( = ?auto_2747 ?auto_2753 ) ) ( AVAILABLE ?auto_2753 ) ( SURFACE-AT ?auto_2744 ?auto_2749 ) ( ON ?auto_2744 ?auto_2752 ) ( CLEAR ?auto_2744 ) ( not ( = ?auto_2743 ?auto_2752 ) ) ( not ( = ?auto_2744 ?auto_2752 ) ) ( not ( = ?auto_2746 ?auto_2752 ) ) ( not ( = ?auto_2745 ?auto_2752 ) ) ( TRUCK-AT ?auto_2748 ?auto_2750 ) ( SURFACE-AT ?auto_2755 ?auto_2750 ) ( CLEAR ?auto_2755 ) ( LIFTING ?auto_2751 ?auto_2745 ) ( IS-CRATE ?auto_2745 ) ( not ( = ?auto_2743 ?auto_2755 ) ) ( not ( = ?auto_2744 ?auto_2755 ) ) ( not ( = ?auto_2746 ?auto_2755 ) ) ( not ( = ?auto_2745 ?auto_2755 ) ) ( not ( = ?auto_2752 ?auto_2755 ) ) )
    :subtasks
    ( ( !DROP ?auto_2751 ?auto_2745 ?auto_2755 ?auto_2750 )
      ( MAKE-ON ?auto_2743 ?auto_2744 )
      ( MAKE-ON-VERIFY ?auto_2743 ?auto_2744 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2756 - SURFACE
      ?auto_2757 - SURFACE
    )
    :vars
    (
      ?auto_2761 - HOIST
      ?auto_2762 - PLACE
      ?auto_2760 - PLACE
      ?auto_2758 - HOIST
      ?auto_2763 - SURFACE
      ?auto_2767 - SURFACE
      ?auto_2765 - PLACE
      ?auto_2766 - HOIST
      ?auto_2759 - SURFACE
      ?auto_2764 - TRUCK
      ?auto_2768 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2761 ?auto_2762 ) ( IS-CRATE ?auto_2756 ) ( not ( = ?auto_2756 ?auto_2757 ) ) ( not ( = ?auto_2760 ?auto_2762 ) ) ( HOIST-AT ?auto_2758 ?auto_2760 ) ( not ( = ?auto_2761 ?auto_2758 ) ) ( AVAILABLE ?auto_2758 ) ( SURFACE-AT ?auto_2756 ?auto_2760 ) ( ON ?auto_2756 ?auto_2763 ) ( CLEAR ?auto_2756 ) ( not ( = ?auto_2756 ?auto_2763 ) ) ( not ( = ?auto_2757 ?auto_2763 ) ) ( IS-CRATE ?auto_2757 ) ( not ( = ?auto_2756 ?auto_2767 ) ) ( not ( = ?auto_2757 ?auto_2767 ) ) ( not ( = ?auto_2763 ?auto_2767 ) ) ( not ( = ?auto_2765 ?auto_2762 ) ) ( not ( = ?auto_2760 ?auto_2765 ) ) ( HOIST-AT ?auto_2766 ?auto_2765 ) ( not ( = ?auto_2761 ?auto_2766 ) ) ( not ( = ?auto_2758 ?auto_2766 ) ) ( AVAILABLE ?auto_2766 ) ( SURFACE-AT ?auto_2757 ?auto_2765 ) ( ON ?auto_2757 ?auto_2759 ) ( CLEAR ?auto_2757 ) ( not ( = ?auto_2756 ?auto_2759 ) ) ( not ( = ?auto_2757 ?auto_2759 ) ) ( not ( = ?auto_2763 ?auto_2759 ) ) ( not ( = ?auto_2767 ?auto_2759 ) ) ( TRUCK-AT ?auto_2764 ?auto_2762 ) ( SURFACE-AT ?auto_2768 ?auto_2762 ) ( CLEAR ?auto_2768 ) ( IS-CRATE ?auto_2767 ) ( not ( = ?auto_2756 ?auto_2768 ) ) ( not ( = ?auto_2757 ?auto_2768 ) ) ( not ( = ?auto_2763 ?auto_2768 ) ) ( not ( = ?auto_2767 ?auto_2768 ) ) ( not ( = ?auto_2759 ?auto_2768 ) ) ( AVAILABLE ?auto_2761 ) ( IN ?auto_2767 ?auto_2764 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2761 ?auto_2767 ?auto_2764 ?auto_2762 )
      ( MAKE-ON ?auto_2756 ?auto_2757 )
      ( MAKE-ON-VERIFY ?auto_2756 ?auto_2757 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2769 - SURFACE
      ?auto_2770 - SURFACE
    )
    :vars
    (
      ?auto_2773 - HOIST
      ?auto_2775 - PLACE
      ?auto_2771 - PLACE
      ?auto_2781 - HOIST
      ?auto_2772 - SURFACE
      ?auto_2779 - SURFACE
      ?auto_2780 - PLACE
      ?auto_2777 - HOIST
      ?auto_2774 - SURFACE
      ?auto_2776 - SURFACE
      ?auto_2778 - TRUCK
      ?auto_2782 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2773 ?auto_2775 ) ( IS-CRATE ?auto_2769 ) ( not ( = ?auto_2769 ?auto_2770 ) ) ( not ( = ?auto_2771 ?auto_2775 ) ) ( HOIST-AT ?auto_2781 ?auto_2771 ) ( not ( = ?auto_2773 ?auto_2781 ) ) ( AVAILABLE ?auto_2781 ) ( SURFACE-AT ?auto_2769 ?auto_2771 ) ( ON ?auto_2769 ?auto_2772 ) ( CLEAR ?auto_2769 ) ( not ( = ?auto_2769 ?auto_2772 ) ) ( not ( = ?auto_2770 ?auto_2772 ) ) ( IS-CRATE ?auto_2770 ) ( not ( = ?auto_2769 ?auto_2779 ) ) ( not ( = ?auto_2770 ?auto_2779 ) ) ( not ( = ?auto_2772 ?auto_2779 ) ) ( not ( = ?auto_2780 ?auto_2775 ) ) ( not ( = ?auto_2771 ?auto_2780 ) ) ( HOIST-AT ?auto_2777 ?auto_2780 ) ( not ( = ?auto_2773 ?auto_2777 ) ) ( not ( = ?auto_2781 ?auto_2777 ) ) ( AVAILABLE ?auto_2777 ) ( SURFACE-AT ?auto_2770 ?auto_2780 ) ( ON ?auto_2770 ?auto_2774 ) ( CLEAR ?auto_2770 ) ( not ( = ?auto_2769 ?auto_2774 ) ) ( not ( = ?auto_2770 ?auto_2774 ) ) ( not ( = ?auto_2772 ?auto_2774 ) ) ( not ( = ?auto_2779 ?auto_2774 ) ) ( SURFACE-AT ?auto_2776 ?auto_2775 ) ( CLEAR ?auto_2776 ) ( IS-CRATE ?auto_2779 ) ( not ( = ?auto_2769 ?auto_2776 ) ) ( not ( = ?auto_2770 ?auto_2776 ) ) ( not ( = ?auto_2772 ?auto_2776 ) ) ( not ( = ?auto_2779 ?auto_2776 ) ) ( not ( = ?auto_2774 ?auto_2776 ) ) ( AVAILABLE ?auto_2773 ) ( IN ?auto_2779 ?auto_2778 ) ( TRUCK-AT ?auto_2778 ?auto_2782 ) ( not ( = ?auto_2782 ?auto_2775 ) ) ( not ( = ?auto_2771 ?auto_2782 ) ) ( not ( = ?auto_2780 ?auto_2782 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2778 ?auto_2782 ?auto_2775 )
      ( MAKE-ON ?auto_2769 ?auto_2770 )
      ( MAKE-ON-VERIFY ?auto_2769 ?auto_2770 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2783 - SURFACE
      ?auto_2784 - SURFACE
    )
    :vars
    (
      ?auto_2794 - HOIST
      ?auto_2790 - PLACE
      ?auto_2786 - PLACE
      ?auto_2788 - HOIST
      ?auto_2785 - SURFACE
      ?auto_2789 - SURFACE
      ?auto_2793 - PLACE
      ?auto_2795 - HOIST
      ?auto_2787 - SURFACE
      ?auto_2791 - SURFACE
      ?auto_2792 - TRUCK
      ?auto_2796 - PLACE
      ?auto_2797 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2794 ?auto_2790 ) ( IS-CRATE ?auto_2783 ) ( not ( = ?auto_2783 ?auto_2784 ) ) ( not ( = ?auto_2786 ?auto_2790 ) ) ( HOIST-AT ?auto_2788 ?auto_2786 ) ( not ( = ?auto_2794 ?auto_2788 ) ) ( AVAILABLE ?auto_2788 ) ( SURFACE-AT ?auto_2783 ?auto_2786 ) ( ON ?auto_2783 ?auto_2785 ) ( CLEAR ?auto_2783 ) ( not ( = ?auto_2783 ?auto_2785 ) ) ( not ( = ?auto_2784 ?auto_2785 ) ) ( IS-CRATE ?auto_2784 ) ( not ( = ?auto_2783 ?auto_2789 ) ) ( not ( = ?auto_2784 ?auto_2789 ) ) ( not ( = ?auto_2785 ?auto_2789 ) ) ( not ( = ?auto_2793 ?auto_2790 ) ) ( not ( = ?auto_2786 ?auto_2793 ) ) ( HOIST-AT ?auto_2795 ?auto_2793 ) ( not ( = ?auto_2794 ?auto_2795 ) ) ( not ( = ?auto_2788 ?auto_2795 ) ) ( AVAILABLE ?auto_2795 ) ( SURFACE-AT ?auto_2784 ?auto_2793 ) ( ON ?auto_2784 ?auto_2787 ) ( CLEAR ?auto_2784 ) ( not ( = ?auto_2783 ?auto_2787 ) ) ( not ( = ?auto_2784 ?auto_2787 ) ) ( not ( = ?auto_2785 ?auto_2787 ) ) ( not ( = ?auto_2789 ?auto_2787 ) ) ( SURFACE-AT ?auto_2791 ?auto_2790 ) ( CLEAR ?auto_2791 ) ( IS-CRATE ?auto_2789 ) ( not ( = ?auto_2783 ?auto_2791 ) ) ( not ( = ?auto_2784 ?auto_2791 ) ) ( not ( = ?auto_2785 ?auto_2791 ) ) ( not ( = ?auto_2789 ?auto_2791 ) ) ( not ( = ?auto_2787 ?auto_2791 ) ) ( AVAILABLE ?auto_2794 ) ( TRUCK-AT ?auto_2792 ?auto_2796 ) ( not ( = ?auto_2796 ?auto_2790 ) ) ( not ( = ?auto_2786 ?auto_2796 ) ) ( not ( = ?auto_2793 ?auto_2796 ) ) ( HOIST-AT ?auto_2797 ?auto_2796 ) ( LIFTING ?auto_2797 ?auto_2789 ) ( not ( = ?auto_2794 ?auto_2797 ) ) ( not ( = ?auto_2788 ?auto_2797 ) ) ( not ( = ?auto_2795 ?auto_2797 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2797 ?auto_2789 ?auto_2792 ?auto_2796 )
      ( MAKE-ON ?auto_2783 ?auto_2784 )
      ( MAKE-ON-VERIFY ?auto_2783 ?auto_2784 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2798 - SURFACE
      ?auto_2799 - SURFACE
    )
    :vars
    (
      ?auto_2807 - HOIST
      ?auto_2812 - PLACE
      ?auto_2806 - PLACE
      ?auto_2805 - HOIST
      ?auto_2801 - SURFACE
      ?auto_2803 - SURFACE
      ?auto_2811 - PLACE
      ?auto_2804 - HOIST
      ?auto_2808 - SURFACE
      ?auto_2810 - SURFACE
      ?auto_2802 - TRUCK
      ?auto_2800 - PLACE
      ?auto_2809 - HOIST
      ?auto_2813 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2807 ?auto_2812 ) ( IS-CRATE ?auto_2798 ) ( not ( = ?auto_2798 ?auto_2799 ) ) ( not ( = ?auto_2806 ?auto_2812 ) ) ( HOIST-AT ?auto_2805 ?auto_2806 ) ( not ( = ?auto_2807 ?auto_2805 ) ) ( AVAILABLE ?auto_2805 ) ( SURFACE-AT ?auto_2798 ?auto_2806 ) ( ON ?auto_2798 ?auto_2801 ) ( CLEAR ?auto_2798 ) ( not ( = ?auto_2798 ?auto_2801 ) ) ( not ( = ?auto_2799 ?auto_2801 ) ) ( IS-CRATE ?auto_2799 ) ( not ( = ?auto_2798 ?auto_2803 ) ) ( not ( = ?auto_2799 ?auto_2803 ) ) ( not ( = ?auto_2801 ?auto_2803 ) ) ( not ( = ?auto_2811 ?auto_2812 ) ) ( not ( = ?auto_2806 ?auto_2811 ) ) ( HOIST-AT ?auto_2804 ?auto_2811 ) ( not ( = ?auto_2807 ?auto_2804 ) ) ( not ( = ?auto_2805 ?auto_2804 ) ) ( AVAILABLE ?auto_2804 ) ( SURFACE-AT ?auto_2799 ?auto_2811 ) ( ON ?auto_2799 ?auto_2808 ) ( CLEAR ?auto_2799 ) ( not ( = ?auto_2798 ?auto_2808 ) ) ( not ( = ?auto_2799 ?auto_2808 ) ) ( not ( = ?auto_2801 ?auto_2808 ) ) ( not ( = ?auto_2803 ?auto_2808 ) ) ( SURFACE-AT ?auto_2810 ?auto_2812 ) ( CLEAR ?auto_2810 ) ( IS-CRATE ?auto_2803 ) ( not ( = ?auto_2798 ?auto_2810 ) ) ( not ( = ?auto_2799 ?auto_2810 ) ) ( not ( = ?auto_2801 ?auto_2810 ) ) ( not ( = ?auto_2803 ?auto_2810 ) ) ( not ( = ?auto_2808 ?auto_2810 ) ) ( AVAILABLE ?auto_2807 ) ( TRUCK-AT ?auto_2802 ?auto_2800 ) ( not ( = ?auto_2800 ?auto_2812 ) ) ( not ( = ?auto_2806 ?auto_2800 ) ) ( not ( = ?auto_2811 ?auto_2800 ) ) ( HOIST-AT ?auto_2809 ?auto_2800 ) ( not ( = ?auto_2807 ?auto_2809 ) ) ( not ( = ?auto_2805 ?auto_2809 ) ) ( not ( = ?auto_2804 ?auto_2809 ) ) ( AVAILABLE ?auto_2809 ) ( SURFACE-AT ?auto_2803 ?auto_2800 ) ( ON ?auto_2803 ?auto_2813 ) ( CLEAR ?auto_2803 ) ( not ( = ?auto_2798 ?auto_2813 ) ) ( not ( = ?auto_2799 ?auto_2813 ) ) ( not ( = ?auto_2801 ?auto_2813 ) ) ( not ( = ?auto_2803 ?auto_2813 ) ) ( not ( = ?auto_2808 ?auto_2813 ) ) ( not ( = ?auto_2810 ?auto_2813 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2809 ?auto_2803 ?auto_2813 ?auto_2800 )
      ( MAKE-ON ?auto_2798 ?auto_2799 )
      ( MAKE-ON-VERIFY ?auto_2798 ?auto_2799 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2814 - SURFACE
      ?auto_2815 - SURFACE
    )
    :vars
    (
      ?auto_2817 - HOIST
      ?auto_2819 - PLACE
      ?auto_2818 - PLACE
      ?auto_2823 - HOIST
      ?auto_2822 - SURFACE
      ?auto_2826 - SURFACE
      ?auto_2824 - PLACE
      ?auto_2816 - HOIST
      ?auto_2827 - SURFACE
      ?auto_2825 - SURFACE
      ?auto_2828 - PLACE
      ?auto_2820 - HOIST
      ?auto_2829 - SURFACE
      ?auto_2821 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2817 ?auto_2819 ) ( IS-CRATE ?auto_2814 ) ( not ( = ?auto_2814 ?auto_2815 ) ) ( not ( = ?auto_2818 ?auto_2819 ) ) ( HOIST-AT ?auto_2823 ?auto_2818 ) ( not ( = ?auto_2817 ?auto_2823 ) ) ( AVAILABLE ?auto_2823 ) ( SURFACE-AT ?auto_2814 ?auto_2818 ) ( ON ?auto_2814 ?auto_2822 ) ( CLEAR ?auto_2814 ) ( not ( = ?auto_2814 ?auto_2822 ) ) ( not ( = ?auto_2815 ?auto_2822 ) ) ( IS-CRATE ?auto_2815 ) ( not ( = ?auto_2814 ?auto_2826 ) ) ( not ( = ?auto_2815 ?auto_2826 ) ) ( not ( = ?auto_2822 ?auto_2826 ) ) ( not ( = ?auto_2824 ?auto_2819 ) ) ( not ( = ?auto_2818 ?auto_2824 ) ) ( HOIST-AT ?auto_2816 ?auto_2824 ) ( not ( = ?auto_2817 ?auto_2816 ) ) ( not ( = ?auto_2823 ?auto_2816 ) ) ( AVAILABLE ?auto_2816 ) ( SURFACE-AT ?auto_2815 ?auto_2824 ) ( ON ?auto_2815 ?auto_2827 ) ( CLEAR ?auto_2815 ) ( not ( = ?auto_2814 ?auto_2827 ) ) ( not ( = ?auto_2815 ?auto_2827 ) ) ( not ( = ?auto_2822 ?auto_2827 ) ) ( not ( = ?auto_2826 ?auto_2827 ) ) ( SURFACE-AT ?auto_2825 ?auto_2819 ) ( CLEAR ?auto_2825 ) ( IS-CRATE ?auto_2826 ) ( not ( = ?auto_2814 ?auto_2825 ) ) ( not ( = ?auto_2815 ?auto_2825 ) ) ( not ( = ?auto_2822 ?auto_2825 ) ) ( not ( = ?auto_2826 ?auto_2825 ) ) ( not ( = ?auto_2827 ?auto_2825 ) ) ( AVAILABLE ?auto_2817 ) ( not ( = ?auto_2828 ?auto_2819 ) ) ( not ( = ?auto_2818 ?auto_2828 ) ) ( not ( = ?auto_2824 ?auto_2828 ) ) ( HOIST-AT ?auto_2820 ?auto_2828 ) ( not ( = ?auto_2817 ?auto_2820 ) ) ( not ( = ?auto_2823 ?auto_2820 ) ) ( not ( = ?auto_2816 ?auto_2820 ) ) ( AVAILABLE ?auto_2820 ) ( SURFACE-AT ?auto_2826 ?auto_2828 ) ( ON ?auto_2826 ?auto_2829 ) ( CLEAR ?auto_2826 ) ( not ( = ?auto_2814 ?auto_2829 ) ) ( not ( = ?auto_2815 ?auto_2829 ) ) ( not ( = ?auto_2822 ?auto_2829 ) ) ( not ( = ?auto_2826 ?auto_2829 ) ) ( not ( = ?auto_2827 ?auto_2829 ) ) ( not ( = ?auto_2825 ?auto_2829 ) ) ( TRUCK-AT ?auto_2821 ?auto_2819 ) )
    :subtasks
    ( ( !DRIVE ?auto_2821 ?auto_2819 ?auto_2828 )
      ( MAKE-ON ?auto_2814 ?auto_2815 )
      ( MAKE-ON-VERIFY ?auto_2814 ?auto_2815 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2830 - SURFACE
      ?auto_2831 - SURFACE
    )
    :vars
    (
      ?auto_2840 - HOIST
      ?auto_2843 - PLACE
      ?auto_2839 - PLACE
      ?auto_2833 - HOIST
      ?auto_2838 - SURFACE
      ?auto_2834 - SURFACE
      ?auto_2844 - PLACE
      ?auto_2845 - HOIST
      ?auto_2841 - SURFACE
      ?auto_2835 - SURFACE
      ?auto_2837 - PLACE
      ?auto_2836 - HOIST
      ?auto_2842 - SURFACE
      ?auto_2832 - TRUCK
      ?auto_2846 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2840 ?auto_2843 ) ( IS-CRATE ?auto_2830 ) ( not ( = ?auto_2830 ?auto_2831 ) ) ( not ( = ?auto_2839 ?auto_2843 ) ) ( HOIST-AT ?auto_2833 ?auto_2839 ) ( not ( = ?auto_2840 ?auto_2833 ) ) ( AVAILABLE ?auto_2833 ) ( SURFACE-AT ?auto_2830 ?auto_2839 ) ( ON ?auto_2830 ?auto_2838 ) ( CLEAR ?auto_2830 ) ( not ( = ?auto_2830 ?auto_2838 ) ) ( not ( = ?auto_2831 ?auto_2838 ) ) ( IS-CRATE ?auto_2831 ) ( not ( = ?auto_2830 ?auto_2834 ) ) ( not ( = ?auto_2831 ?auto_2834 ) ) ( not ( = ?auto_2838 ?auto_2834 ) ) ( not ( = ?auto_2844 ?auto_2843 ) ) ( not ( = ?auto_2839 ?auto_2844 ) ) ( HOIST-AT ?auto_2845 ?auto_2844 ) ( not ( = ?auto_2840 ?auto_2845 ) ) ( not ( = ?auto_2833 ?auto_2845 ) ) ( AVAILABLE ?auto_2845 ) ( SURFACE-AT ?auto_2831 ?auto_2844 ) ( ON ?auto_2831 ?auto_2841 ) ( CLEAR ?auto_2831 ) ( not ( = ?auto_2830 ?auto_2841 ) ) ( not ( = ?auto_2831 ?auto_2841 ) ) ( not ( = ?auto_2838 ?auto_2841 ) ) ( not ( = ?auto_2834 ?auto_2841 ) ) ( IS-CRATE ?auto_2834 ) ( not ( = ?auto_2830 ?auto_2835 ) ) ( not ( = ?auto_2831 ?auto_2835 ) ) ( not ( = ?auto_2838 ?auto_2835 ) ) ( not ( = ?auto_2834 ?auto_2835 ) ) ( not ( = ?auto_2841 ?auto_2835 ) ) ( not ( = ?auto_2837 ?auto_2843 ) ) ( not ( = ?auto_2839 ?auto_2837 ) ) ( not ( = ?auto_2844 ?auto_2837 ) ) ( HOIST-AT ?auto_2836 ?auto_2837 ) ( not ( = ?auto_2840 ?auto_2836 ) ) ( not ( = ?auto_2833 ?auto_2836 ) ) ( not ( = ?auto_2845 ?auto_2836 ) ) ( AVAILABLE ?auto_2836 ) ( SURFACE-AT ?auto_2834 ?auto_2837 ) ( ON ?auto_2834 ?auto_2842 ) ( CLEAR ?auto_2834 ) ( not ( = ?auto_2830 ?auto_2842 ) ) ( not ( = ?auto_2831 ?auto_2842 ) ) ( not ( = ?auto_2838 ?auto_2842 ) ) ( not ( = ?auto_2834 ?auto_2842 ) ) ( not ( = ?auto_2841 ?auto_2842 ) ) ( not ( = ?auto_2835 ?auto_2842 ) ) ( TRUCK-AT ?auto_2832 ?auto_2843 ) ( SURFACE-AT ?auto_2846 ?auto_2843 ) ( CLEAR ?auto_2846 ) ( LIFTING ?auto_2840 ?auto_2835 ) ( IS-CRATE ?auto_2835 ) ( not ( = ?auto_2830 ?auto_2846 ) ) ( not ( = ?auto_2831 ?auto_2846 ) ) ( not ( = ?auto_2838 ?auto_2846 ) ) ( not ( = ?auto_2834 ?auto_2846 ) ) ( not ( = ?auto_2841 ?auto_2846 ) ) ( not ( = ?auto_2835 ?auto_2846 ) ) ( not ( = ?auto_2842 ?auto_2846 ) ) )
    :subtasks
    ( ( !DROP ?auto_2840 ?auto_2835 ?auto_2846 ?auto_2843 )
      ( MAKE-ON ?auto_2830 ?auto_2831 )
      ( MAKE-ON-VERIFY ?auto_2830 ?auto_2831 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2847 - SURFACE
      ?auto_2848 - SURFACE
    )
    :vars
    (
      ?auto_2851 - HOIST
      ?auto_2852 - PLACE
      ?auto_2857 - PLACE
      ?auto_2860 - HOIST
      ?auto_2862 - SURFACE
      ?auto_2853 - SURFACE
      ?auto_2849 - PLACE
      ?auto_2859 - HOIST
      ?auto_2855 - SURFACE
      ?auto_2861 - SURFACE
      ?auto_2858 - PLACE
      ?auto_2856 - HOIST
      ?auto_2850 - SURFACE
      ?auto_2854 - TRUCK
      ?auto_2863 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2851 ?auto_2852 ) ( IS-CRATE ?auto_2847 ) ( not ( = ?auto_2847 ?auto_2848 ) ) ( not ( = ?auto_2857 ?auto_2852 ) ) ( HOIST-AT ?auto_2860 ?auto_2857 ) ( not ( = ?auto_2851 ?auto_2860 ) ) ( AVAILABLE ?auto_2860 ) ( SURFACE-AT ?auto_2847 ?auto_2857 ) ( ON ?auto_2847 ?auto_2862 ) ( CLEAR ?auto_2847 ) ( not ( = ?auto_2847 ?auto_2862 ) ) ( not ( = ?auto_2848 ?auto_2862 ) ) ( IS-CRATE ?auto_2848 ) ( not ( = ?auto_2847 ?auto_2853 ) ) ( not ( = ?auto_2848 ?auto_2853 ) ) ( not ( = ?auto_2862 ?auto_2853 ) ) ( not ( = ?auto_2849 ?auto_2852 ) ) ( not ( = ?auto_2857 ?auto_2849 ) ) ( HOIST-AT ?auto_2859 ?auto_2849 ) ( not ( = ?auto_2851 ?auto_2859 ) ) ( not ( = ?auto_2860 ?auto_2859 ) ) ( AVAILABLE ?auto_2859 ) ( SURFACE-AT ?auto_2848 ?auto_2849 ) ( ON ?auto_2848 ?auto_2855 ) ( CLEAR ?auto_2848 ) ( not ( = ?auto_2847 ?auto_2855 ) ) ( not ( = ?auto_2848 ?auto_2855 ) ) ( not ( = ?auto_2862 ?auto_2855 ) ) ( not ( = ?auto_2853 ?auto_2855 ) ) ( IS-CRATE ?auto_2853 ) ( not ( = ?auto_2847 ?auto_2861 ) ) ( not ( = ?auto_2848 ?auto_2861 ) ) ( not ( = ?auto_2862 ?auto_2861 ) ) ( not ( = ?auto_2853 ?auto_2861 ) ) ( not ( = ?auto_2855 ?auto_2861 ) ) ( not ( = ?auto_2858 ?auto_2852 ) ) ( not ( = ?auto_2857 ?auto_2858 ) ) ( not ( = ?auto_2849 ?auto_2858 ) ) ( HOIST-AT ?auto_2856 ?auto_2858 ) ( not ( = ?auto_2851 ?auto_2856 ) ) ( not ( = ?auto_2860 ?auto_2856 ) ) ( not ( = ?auto_2859 ?auto_2856 ) ) ( AVAILABLE ?auto_2856 ) ( SURFACE-AT ?auto_2853 ?auto_2858 ) ( ON ?auto_2853 ?auto_2850 ) ( CLEAR ?auto_2853 ) ( not ( = ?auto_2847 ?auto_2850 ) ) ( not ( = ?auto_2848 ?auto_2850 ) ) ( not ( = ?auto_2862 ?auto_2850 ) ) ( not ( = ?auto_2853 ?auto_2850 ) ) ( not ( = ?auto_2855 ?auto_2850 ) ) ( not ( = ?auto_2861 ?auto_2850 ) ) ( TRUCK-AT ?auto_2854 ?auto_2852 ) ( SURFACE-AT ?auto_2863 ?auto_2852 ) ( CLEAR ?auto_2863 ) ( IS-CRATE ?auto_2861 ) ( not ( = ?auto_2847 ?auto_2863 ) ) ( not ( = ?auto_2848 ?auto_2863 ) ) ( not ( = ?auto_2862 ?auto_2863 ) ) ( not ( = ?auto_2853 ?auto_2863 ) ) ( not ( = ?auto_2855 ?auto_2863 ) ) ( not ( = ?auto_2861 ?auto_2863 ) ) ( not ( = ?auto_2850 ?auto_2863 ) ) ( AVAILABLE ?auto_2851 ) ( IN ?auto_2861 ?auto_2854 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2851 ?auto_2861 ?auto_2854 ?auto_2852 )
      ( MAKE-ON ?auto_2847 ?auto_2848 )
      ( MAKE-ON-VERIFY ?auto_2847 ?auto_2848 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2864 - SURFACE
      ?auto_2865 - SURFACE
    )
    :vars
    (
      ?auto_2879 - HOIST
      ?auto_2878 - PLACE
      ?auto_2876 - PLACE
      ?auto_2873 - HOIST
      ?auto_2867 - SURFACE
      ?auto_2868 - SURFACE
      ?auto_2877 - PLACE
      ?auto_2870 - HOIST
      ?auto_2875 - SURFACE
      ?auto_2869 - SURFACE
      ?auto_2866 - PLACE
      ?auto_2871 - HOIST
      ?auto_2872 - SURFACE
      ?auto_2874 - SURFACE
      ?auto_2880 - TRUCK
      ?auto_2881 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2879 ?auto_2878 ) ( IS-CRATE ?auto_2864 ) ( not ( = ?auto_2864 ?auto_2865 ) ) ( not ( = ?auto_2876 ?auto_2878 ) ) ( HOIST-AT ?auto_2873 ?auto_2876 ) ( not ( = ?auto_2879 ?auto_2873 ) ) ( AVAILABLE ?auto_2873 ) ( SURFACE-AT ?auto_2864 ?auto_2876 ) ( ON ?auto_2864 ?auto_2867 ) ( CLEAR ?auto_2864 ) ( not ( = ?auto_2864 ?auto_2867 ) ) ( not ( = ?auto_2865 ?auto_2867 ) ) ( IS-CRATE ?auto_2865 ) ( not ( = ?auto_2864 ?auto_2868 ) ) ( not ( = ?auto_2865 ?auto_2868 ) ) ( not ( = ?auto_2867 ?auto_2868 ) ) ( not ( = ?auto_2877 ?auto_2878 ) ) ( not ( = ?auto_2876 ?auto_2877 ) ) ( HOIST-AT ?auto_2870 ?auto_2877 ) ( not ( = ?auto_2879 ?auto_2870 ) ) ( not ( = ?auto_2873 ?auto_2870 ) ) ( AVAILABLE ?auto_2870 ) ( SURFACE-AT ?auto_2865 ?auto_2877 ) ( ON ?auto_2865 ?auto_2875 ) ( CLEAR ?auto_2865 ) ( not ( = ?auto_2864 ?auto_2875 ) ) ( not ( = ?auto_2865 ?auto_2875 ) ) ( not ( = ?auto_2867 ?auto_2875 ) ) ( not ( = ?auto_2868 ?auto_2875 ) ) ( IS-CRATE ?auto_2868 ) ( not ( = ?auto_2864 ?auto_2869 ) ) ( not ( = ?auto_2865 ?auto_2869 ) ) ( not ( = ?auto_2867 ?auto_2869 ) ) ( not ( = ?auto_2868 ?auto_2869 ) ) ( not ( = ?auto_2875 ?auto_2869 ) ) ( not ( = ?auto_2866 ?auto_2878 ) ) ( not ( = ?auto_2876 ?auto_2866 ) ) ( not ( = ?auto_2877 ?auto_2866 ) ) ( HOIST-AT ?auto_2871 ?auto_2866 ) ( not ( = ?auto_2879 ?auto_2871 ) ) ( not ( = ?auto_2873 ?auto_2871 ) ) ( not ( = ?auto_2870 ?auto_2871 ) ) ( AVAILABLE ?auto_2871 ) ( SURFACE-AT ?auto_2868 ?auto_2866 ) ( ON ?auto_2868 ?auto_2872 ) ( CLEAR ?auto_2868 ) ( not ( = ?auto_2864 ?auto_2872 ) ) ( not ( = ?auto_2865 ?auto_2872 ) ) ( not ( = ?auto_2867 ?auto_2872 ) ) ( not ( = ?auto_2868 ?auto_2872 ) ) ( not ( = ?auto_2875 ?auto_2872 ) ) ( not ( = ?auto_2869 ?auto_2872 ) ) ( SURFACE-AT ?auto_2874 ?auto_2878 ) ( CLEAR ?auto_2874 ) ( IS-CRATE ?auto_2869 ) ( not ( = ?auto_2864 ?auto_2874 ) ) ( not ( = ?auto_2865 ?auto_2874 ) ) ( not ( = ?auto_2867 ?auto_2874 ) ) ( not ( = ?auto_2868 ?auto_2874 ) ) ( not ( = ?auto_2875 ?auto_2874 ) ) ( not ( = ?auto_2869 ?auto_2874 ) ) ( not ( = ?auto_2872 ?auto_2874 ) ) ( AVAILABLE ?auto_2879 ) ( IN ?auto_2869 ?auto_2880 ) ( TRUCK-AT ?auto_2880 ?auto_2881 ) ( not ( = ?auto_2881 ?auto_2878 ) ) ( not ( = ?auto_2876 ?auto_2881 ) ) ( not ( = ?auto_2877 ?auto_2881 ) ) ( not ( = ?auto_2866 ?auto_2881 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2880 ?auto_2881 ?auto_2878 )
      ( MAKE-ON ?auto_2864 ?auto_2865 )
      ( MAKE-ON-VERIFY ?auto_2864 ?auto_2865 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2882 - SURFACE
      ?auto_2883 - SURFACE
    )
    :vars
    (
      ?auto_2889 - HOIST
      ?auto_2887 - PLACE
      ?auto_2894 - PLACE
      ?auto_2890 - HOIST
      ?auto_2892 - SURFACE
      ?auto_2893 - SURFACE
      ?auto_2885 - PLACE
      ?auto_2884 - HOIST
      ?auto_2886 - SURFACE
      ?auto_2895 - SURFACE
      ?auto_2898 - PLACE
      ?auto_2891 - HOIST
      ?auto_2896 - SURFACE
      ?auto_2897 - SURFACE
      ?auto_2888 - TRUCK
      ?auto_2899 - PLACE
      ?auto_2900 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2889 ?auto_2887 ) ( IS-CRATE ?auto_2882 ) ( not ( = ?auto_2882 ?auto_2883 ) ) ( not ( = ?auto_2894 ?auto_2887 ) ) ( HOIST-AT ?auto_2890 ?auto_2894 ) ( not ( = ?auto_2889 ?auto_2890 ) ) ( AVAILABLE ?auto_2890 ) ( SURFACE-AT ?auto_2882 ?auto_2894 ) ( ON ?auto_2882 ?auto_2892 ) ( CLEAR ?auto_2882 ) ( not ( = ?auto_2882 ?auto_2892 ) ) ( not ( = ?auto_2883 ?auto_2892 ) ) ( IS-CRATE ?auto_2883 ) ( not ( = ?auto_2882 ?auto_2893 ) ) ( not ( = ?auto_2883 ?auto_2893 ) ) ( not ( = ?auto_2892 ?auto_2893 ) ) ( not ( = ?auto_2885 ?auto_2887 ) ) ( not ( = ?auto_2894 ?auto_2885 ) ) ( HOIST-AT ?auto_2884 ?auto_2885 ) ( not ( = ?auto_2889 ?auto_2884 ) ) ( not ( = ?auto_2890 ?auto_2884 ) ) ( AVAILABLE ?auto_2884 ) ( SURFACE-AT ?auto_2883 ?auto_2885 ) ( ON ?auto_2883 ?auto_2886 ) ( CLEAR ?auto_2883 ) ( not ( = ?auto_2882 ?auto_2886 ) ) ( not ( = ?auto_2883 ?auto_2886 ) ) ( not ( = ?auto_2892 ?auto_2886 ) ) ( not ( = ?auto_2893 ?auto_2886 ) ) ( IS-CRATE ?auto_2893 ) ( not ( = ?auto_2882 ?auto_2895 ) ) ( not ( = ?auto_2883 ?auto_2895 ) ) ( not ( = ?auto_2892 ?auto_2895 ) ) ( not ( = ?auto_2893 ?auto_2895 ) ) ( not ( = ?auto_2886 ?auto_2895 ) ) ( not ( = ?auto_2898 ?auto_2887 ) ) ( not ( = ?auto_2894 ?auto_2898 ) ) ( not ( = ?auto_2885 ?auto_2898 ) ) ( HOIST-AT ?auto_2891 ?auto_2898 ) ( not ( = ?auto_2889 ?auto_2891 ) ) ( not ( = ?auto_2890 ?auto_2891 ) ) ( not ( = ?auto_2884 ?auto_2891 ) ) ( AVAILABLE ?auto_2891 ) ( SURFACE-AT ?auto_2893 ?auto_2898 ) ( ON ?auto_2893 ?auto_2896 ) ( CLEAR ?auto_2893 ) ( not ( = ?auto_2882 ?auto_2896 ) ) ( not ( = ?auto_2883 ?auto_2896 ) ) ( not ( = ?auto_2892 ?auto_2896 ) ) ( not ( = ?auto_2893 ?auto_2896 ) ) ( not ( = ?auto_2886 ?auto_2896 ) ) ( not ( = ?auto_2895 ?auto_2896 ) ) ( SURFACE-AT ?auto_2897 ?auto_2887 ) ( CLEAR ?auto_2897 ) ( IS-CRATE ?auto_2895 ) ( not ( = ?auto_2882 ?auto_2897 ) ) ( not ( = ?auto_2883 ?auto_2897 ) ) ( not ( = ?auto_2892 ?auto_2897 ) ) ( not ( = ?auto_2893 ?auto_2897 ) ) ( not ( = ?auto_2886 ?auto_2897 ) ) ( not ( = ?auto_2895 ?auto_2897 ) ) ( not ( = ?auto_2896 ?auto_2897 ) ) ( AVAILABLE ?auto_2889 ) ( TRUCK-AT ?auto_2888 ?auto_2899 ) ( not ( = ?auto_2899 ?auto_2887 ) ) ( not ( = ?auto_2894 ?auto_2899 ) ) ( not ( = ?auto_2885 ?auto_2899 ) ) ( not ( = ?auto_2898 ?auto_2899 ) ) ( HOIST-AT ?auto_2900 ?auto_2899 ) ( LIFTING ?auto_2900 ?auto_2895 ) ( not ( = ?auto_2889 ?auto_2900 ) ) ( not ( = ?auto_2890 ?auto_2900 ) ) ( not ( = ?auto_2884 ?auto_2900 ) ) ( not ( = ?auto_2891 ?auto_2900 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2900 ?auto_2895 ?auto_2888 ?auto_2899 )
      ( MAKE-ON ?auto_2882 ?auto_2883 )
      ( MAKE-ON-VERIFY ?auto_2882 ?auto_2883 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2901 - SURFACE
      ?auto_2902 - SURFACE
    )
    :vars
    (
      ?auto_2907 - HOIST
      ?auto_2906 - PLACE
      ?auto_2919 - PLACE
      ?auto_2908 - HOIST
      ?auto_2916 - SURFACE
      ?auto_2903 - SURFACE
      ?auto_2911 - PLACE
      ?auto_2913 - HOIST
      ?auto_2909 - SURFACE
      ?auto_2905 - SURFACE
      ?auto_2914 - PLACE
      ?auto_2910 - HOIST
      ?auto_2904 - SURFACE
      ?auto_2917 - SURFACE
      ?auto_2918 - TRUCK
      ?auto_2915 - PLACE
      ?auto_2912 - HOIST
      ?auto_2920 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2907 ?auto_2906 ) ( IS-CRATE ?auto_2901 ) ( not ( = ?auto_2901 ?auto_2902 ) ) ( not ( = ?auto_2919 ?auto_2906 ) ) ( HOIST-AT ?auto_2908 ?auto_2919 ) ( not ( = ?auto_2907 ?auto_2908 ) ) ( AVAILABLE ?auto_2908 ) ( SURFACE-AT ?auto_2901 ?auto_2919 ) ( ON ?auto_2901 ?auto_2916 ) ( CLEAR ?auto_2901 ) ( not ( = ?auto_2901 ?auto_2916 ) ) ( not ( = ?auto_2902 ?auto_2916 ) ) ( IS-CRATE ?auto_2902 ) ( not ( = ?auto_2901 ?auto_2903 ) ) ( not ( = ?auto_2902 ?auto_2903 ) ) ( not ( = ?auto_2916 ?auto_2903 ) ) ( not ( = ?auto_2911 ?auto_2906 ) ) ( not ( = ?auto_2919 ?auto_2911 ) ) ( HOIST-AT ?auto_2913 ?auto_2911 ) ( not ( = ?auto_2907 ?auto_2913 ) ) ( not ( = ?auto_2908 ?auto_2913 ) ) ( AVAILABLE ?auto_2913 ) ( SURFACE-AT ?auto_2902 ?auto_2911 ) ( ON ?auto_2902 ?auto_2909 ) ( CLEAR ?auto_2902 ) ( not ( = ?auto_2901 ?auto_2909 ) ) ( not ( = ?auto_2902 ?auto_2909 ) ) ( not ( = ?auto_2916 ?auto_2909 ) ) ( not ( = ?auto_2903 ?auto_2909 ) ) ( IS-CRATE ?auto_2903 ) ( not ( = ?auto_2901 ?auto_2905 ) ) ( not ( = ?auto_2902 ?auto_2905 ) ) ( not ( = ?auto_2916 ?auto_2905 ) ) ( not ( = ?auto_2903 ?auto_2905 ) ) ( not ( = ?auto_2909 ?auto_2905 ) ) ( not ( = ?auto_2914 ?auto_2906 ) ) ( not ( = ?auto_2919 ?auto_2914 ) ) ( not ( = ?auto_2911 ?auto_2914 ) ) ( HOIST-AT ?auto_2910 ?auto_2914 ) ( not ( = ?auto_2907 ?auto_2910 ) ) ( not ( = ?auto_2908 ?auto_2910 ) ) ( not ( = ?auto_2913 ?auto_2910 ) ) ( AVAILABLE ?auto_2910 ) ( SURFACE-AT ?auto_2903 ?auto_2914 ) ( ON ?auto_2903 ?auto_2904 ) ( CLEAR ?auto_2903 ) ( not ( = ?auto_2901 ?auto_2904 ) ) ( not ( = ?auto_2902 ?auto_2904 ) ) ( not ( = ?auto_2916 ?auto_2904 ) ) ( not ( = ?auto_2903 ?auto_2904 ) ) ( not ( = ?auto_2909 ?auto_2904 ) ) ( not ( = ?auto_2905 ?auto_2904 ) ) ( SURFACE-AT ?auto_2917 ?auto_2906 ) ( CLEAR ?auto_2917 ) ( IS-CRATE ?auto_2905 ) ( not ( = ?auto_2901 ?auto_2917 ) ) ( not ( = ?auto_2902 ?auto_2917 ) ) ( not ( = ?auto_2916 ?auto_2917 ) ) ( not ( = ?auto_2903 ?auto_2917 ) ) ( not ( = ?auto_2909 ?auto_2917 ) ) ( not ( = ?auto_2905 ?auto_2917 ) ) ( not ( = ?auto_2904 ?auto_2917 ) ) ( AVAILABLE ?auto_2907 ) ( TRUCK-AT ?auto_2918 ?auto_2915 ) ( not ( = ?auto_2915 ?auto_2906 ) ) ( not ( = ?auto_2919 ?auto_2915 ) ) ( not ( = ?auto_2911 ?auto_2915 ) ) ( not ( = ?auto_2914 ?auto_2915 ) ) ( HOIST-AT ?auto_2912 ?auto_2915 ) ( not ( = ?auto_2907 ?auto_2912 ) ) ( not ( = ?auto_2908 ?auto_2912 ) ) ( not ( = ?auto_2913 ?auto_2912 ) ) ( not ( = ?auto_2910 ?auto_2912 ) ) ( AVAILABLE ?auto_2912 ) ( SURFACE-AT ?auto_2905 ?auto_2915 ) ( ON ?auto_2905 ?auto_2920 ) ( CLEAR ?auto_2905 ) ( not ( = ?auto_2901 ?auto_2920 ) ) ( not ( = ?auto_2902 ?auto_2920 ) ) ( not ( = ?auto_2916 ?auto_2920 ) ) ( not ( = ?auto_2903 ?auto_2920 ) ) ( not ( = ?auto_2909 ?auto_2920 ) ) ( not ( = ?auto_2905 ?auto_2920 ) ) ( not ( = ?auto_2904 ?auto_2920 ) ) ( not ( = ?auto_2917 ?auto_2920 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2912 ?auto_2905 ?auto_2920 ?auto_2915 )
      ( MAKE-ON ?auto_2901 ?auto_2902 )
      ( MAKE-ON-VERIFY ?auto_2901 ?auto_2902 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2921 - SURFACE
      ?auto_2922 - SURFACE
    )
    :vars
    (
      ?auto_2936 - HOIST
      ?auto_2935 - PLACE
      ?auto_2928 - PLACE
      ?auto_2929 - HOIST
      ?auto_2925 - SURFACE
      ?auto_2931 - SURFACE
      ?auto_2926 - PLACE
      ?auto_2933 - HOIST
      ?auto_2939 - SURFACE
      ?auto_2923 - SURFACE
      ?auto_2937 - PLACE
      ?auto_2930 - HOIST
      ?auto_2934 - SURFACE
      ?auto_2938 - SURFACE
      ?auto_2932 - PLACE
      ?auto_2927 - HOIST
      ?auto_2940 - SURFACE
      ?auto_2924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2936 ?auto_2935 ) ( IS-CRATE ?auto_2921 ) ( not ( = ?auto_2921 ?auto_2922 ) ) ( not ( = ?auto_2928 ?auto_2935 ) ) ( HOIST-AT ?auto_2929 ?auto_2928 ) ( not ( = ?auto_2936 ?auto_2929 ) ) ( AVAILABLE ?auto_2929 ) ( SURFACE-AT ?auto_2921 ?auto_2928 ) ( ON ?auto_2921 ?auto_2925 ) ( CLEAR ?auto_2921 ) ( not ( = ?auto_2921 ?auto_2925 ) ) ( not ( = ?auto_2922 ?auto_2925 ) ) ( IS-CRATE ?auto_2922 ) ( not ( = ?auto_2921 ?auto_2931 ) ) ( not ( = ?auto_2922 ?auto_2931 ) ) ( not ( = ?auto_2925 ?auto_2931 ) ) ( not ( = ?auto_2926 ?auto_2935 ) ) ( not ( = ?auto_2928 ?auto_2926 ) ) ( HOIST-AT ?auto_2933 ?auto_2926 ) ( not ( = ?auto_2936 ?auto_2933 ) ) ( not ( = ?auto_2929 ?auto_2933 ) ) ( AVAILABLE ?auto_2933 ) ( SURFACE-AT ?auto_2922 ?auto_2926 ) ( ON ?auto_2922 ?auto_2939 ) ( CLEAR ?auto_2922 ) ( not ( = ?auto_2921 ?auto_2939 ) ) ( not ( = ?auto_2922 ?auto_2939 ) ) ( not ( = ?auto_2925 ?auto_2939 ) ) ( not ( = ?auto_2931 ?auto_2939 ) ) ( IS-CRATE ?auto_2931 ) ( not ( = ?auto_2921 ?auto_2923 ) ) ( not ( = ?auto_2922 ?auto_2923 ) ) ( not ( = ?auto_2925 ?auto_2923 ) ) ( not ( = ?auto_2931 ?auto_2923 ) ) ( not ( = ?auto_2939 ?auto_2923 ) ) ( not ( = ?auto_2937 ?auto_2935 ) ) ( not ( = ?auto_2928 ?auto_2937 ) ) ( not ( = ?auto_2926 ?auto_2937 ) ) ( HOIST-AT ?auto_2930 ?auto_2937 ) ( not ( = ?auto_2936 ?auto_2930 ) ) ( not ( = ?auto_2929 ?auto_2930 ) ) ( not ( = ?auto_2933 ?auto_2930 ) ) ( AVAILABLE ?auto_2930 ) ( SURFACE-AT ?auto_2931 ?auto_2937 ) ( ON ?auto_2931 ?auto_2934 ) ( CLEAR ?auto_2931 ) ( not ( = ?auto_2921 ?auto_2934 ) ) ( not ( = ?auto_2922 ?auto_2934 ) ) ( not ( = ?auto_2925 ?auto_2934 ) ) ( not ( = ?auto_2931 ?auto_2934 ) ) ( not ( = ?auto_2939 ?auto_2934 ) ) ( not ( = ?auto_2923 ?auto_2934 ) ) ( SURFACE-AT ?auto_2938 ?auto_2935 ) ( CLEAR ?auto_2938 ) ( IS-CRATE ?auto_2923 ) ( not ( = ?auto_2921 ?auto_2938 ) ) ( not ( = ?auto_2922 ?auto_2938 ) ) ( not ( = ?auto_2925 ?auto_2938 ) ) ( not ( = ?auto_2931 ?auto_2938 ) ) ( not ( = ?auto_2939 ?auto_2938 ) ) ( not ( = ?auto_2923 ?auto_2938 ) ) ( not ( = ?auto_2934 ?auto_2938 ) ) ( AVAILABLE ?auto_2936 ) ( not ( = ?auto_2932 ?auto_2935 ) ) ( not ( = ?auto_2928 ?auto_2932 ) ) ( not ( = ?auto_2926 ?auto_2932 ) ) ( not ( = ?auto_2937 ?auto_2932 ) ) ( HOIST-AT ?auto_2927 ?auto_2932 ) ( not ( = ?auto_2936 ?auto_2927 ) ) ( not ( = ?auto_2929 ?auto_2927 ) ) ( not ( = ?auto_2933 ?auto_2927 ) ) ( not ( = ?auto_2930 ?auto_2927 ) ) ( AVAILABLE ?auto_2927 ) ( SURFACE-AT ?auto_2923 ?auto_2932 ) ( ON ?auto_2923 ?auto_2940 ) ( CLEAR ?auto_2923 ) ( not ( = ?auto_2921 ?auto_2940 ) ) ( not ( = ?auto_2922 ?auto_2940 ) ) ( not ( = ?auto_2925 ?auto_2940 ) ) ( not ( = ?auto_2931 ?auto_2940 ) ) ( not ( = ?auto_2939 ?auto_2940 ) ) ( not ( = ?auto_2923 ?auto_2940 ) ) ( not ( = ?auto_2934 ?auto_2940 ) ) ( not ( = ?auto_2938 ?auto_2940 ) ) ( TRUCK-AT ?auto_2924 ?auto_2935 ) )
    :subtasks
    ( ( !DRIVE ?auto_2924 ?auto_2935 ?auto_2932 )
      ( MAKE-ON ?auto_2921 ?auto_2922 )
      ( MAKE-ON-VERIFY ?auto_2921 ?auto_2922 ) )
  )

)

