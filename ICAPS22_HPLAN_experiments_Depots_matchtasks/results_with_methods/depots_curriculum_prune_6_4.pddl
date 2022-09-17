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

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2334 - SURFACE
      ?auto_2335 - SURFACE
    )
    :vars
    (
      ?auto_2336 - HOIST
      ?auto_2337 - PLACE
      ?auto_2339 - PLACE
      ?auto_2340 - HOIST
      ?auto_2341 - SURFACE
      ?auto_2338 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2336 ?auto_2337 ) ( SURFACE-AT ?auto_2334 ?auto_2337 ) ( CLEAR ?auto_2334 ) ( IS-CRATE ?auto_2335 ) ( AVAILABLE ?auto_2336 ) ( not ( = ?auto_2339 ?auto_2337 ) ) ( HOIST-AT ?auto_2340 ?auto_2339 ) ( AVAILABLE ?auto_2340 ) ( SURFACE-AT ?auto_2335 ?auto_2339 ) ( ON ?auto_2335 ?auto_2341 ) ( CLEAR ?auto_2335 ) ( TRUCK-AT ?auto_2338 ?auto_2337 ) ( not ( = ?auto_2334 ?auto_2335 ) ) ( not ( = ?auto_2334 ?auto_2341 ) ) ( not ( = ?auto_2335 ?auto_2341 ) ) ( not ( = ?auto_2336 ?auto_2340 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2338 ?auto_2337 ?auto_2339 )
      ( !LIFT ?auto_2340 ?auto_2335 ?auto_2341 ?auto_2339 )
      ( !LOAD ?auto_2340 ?auto_2335 ?auto_2338 ?auto_2339 )
      ( !DRIVE ?auto_2338 ?auto_2339 ?auto_2337 )
      ( !UNLOAD ?auto_2336 ?auto_2335 ?auto_2338 ?auto_2337 )
      ( !DROP ?auto_2336 ?auto_2335 ?auto_2334 ?auto_2337 )
      ( MAKE-1CRATE-VERIFY ?auto_2334 ?auto_2335 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2355 - SURFACE
      ?auto_2356 - SURFACE
      ?auto_2357 - SURFACE
    )
    :vars
    (
      ?auto_2360 - HOIST
      ?auto_2359 - PLACE
      ?auto_2362 - PLACE
      ?auto_2361 - HOIST
      ?auto_2358 - SURFACE
      ?auto_2366 - PLACE
      ?auto_2365 - HOIST
      ?auto_2364 - SURFACE
      ?auto_2363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2360 ?auto_2359 ) ( IS-CRATE ?auto_2357 ) ( not ( = ?auto_2362 ?auto_2359 ) ) ( HOIST-AT ?auto_2361 ?auto_2362 ) ( AVAILABLE ?auto_2361 ) ( SURFACE-AT ?auto_2357 ?auto_2362 ) ( ON ?auto_2357 ?auto_2358 ) ( CLEAR ?auto_2357 ) ( not ( = ?auto_2356 ?auto_2357 ) ) ( not ( = ?auto_2356 ?auto_2358 ) ) ( not ( = ?auto_2357 ?auto_2358 ) ) ( not ( = ?auto_2360 ?auto_2361 ) ) ( SURFACE-AT ?auto_2355 ?auto_2359 ) ( CLEAR ?auto_2355 ) ( IS-CRATE ?auto_2356 ) ( AVAILABLE ?auto_2360 ) ( not ( = ?auto_2366 ?auto_2359 ) ) ( HOIST-AT ?auto_2365 ?auto_2366 ) ( AVAILABLE ?auto_2365 ) ( SURFACE-AT ?auto_2356 ?auto_2366 ) ( ON ?auto_2356 ?auto_2364 ) ( CLEAR ?auto_2356 ) ( TRUCK-AT ?auto_2363 ?auto_2359 ) ( not ( = ?auto_2355 ?auto_2356 ) ) ( not ( = ?auto_2355 ?auto_2364 ) ) ( not ( = ?auto_2356 ?auto_2364 ) ) ( not ( = ?auto_2360 ?auto_2365 ) ) ( not ( = ?auto_2355 ?auto_2357 ) ) ( not ( = ?auto_2355 ?auto_2358 ) ) ( not ( = ?auto_2357 ?auto_2364 ) ) ( not ( = ?auto_2362 ?auto_2366 ) ) ( not ( = ?auto_2361 ?auto_2365 ) ) ( not ( = ?auto_2358 ?auto_2364 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2355 ?auto_2356 )
      ( MAKE-1CRATE ?auto_2356 ?auto_2357 )
      ( MAKE-2CRATE-VERIFY ?auto_2355 ?auto_2356 ?auto_2357 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2381 - SURFACE
      ?auto_2382 - SURFACE
      ?auto_2383 - SURFACE
      ?auto_2384 - SURFACE
    )
    :vars
    (
      ?auto_2390 - HOIST
      ?auto_2389 - PLACE
      ?auto_2385 - PLACE
      ?auto_2387 - HOIST
      ?auto_2386 - SURFACE
      ?auto_2391 - PLACE
      ?auto_2393 - HOIST
      ?auto_2392 - SURFACE
      ?auto_2394 - SURFACE
      ?auto_2388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390 ?auto_2389 ) ( IS-CRATE ?auto_2384 ) ( not ( = ?auto_2385 ?auto_2389 ) ) ( HOIST-AT ?auto_2387 ?auto_2385 ) ( SURFACE-AT ?auto_2384 ?auto_2385 ) ( ON ?auto_2384 ?auto_2386 ) ( CLEAR ?auto_2384 ) ( not ( = ?auto_2383 ?auto_2384 ) ) ( not ( = ?auto_2383 ?auto_2386 ) ) ( not ( = ?auto_2384 ?auto_2386 ) ) ( not ( = ?auto_2390 ?auto_2387 ) ) ( IS-CRATE ?auto_2383 ) ( not ( = ?auto_2391 ?auto_2389 ) ) ( HOIST-AT ?auto_2393 ?auto_2391 ) ( AVAILABLE ?auto_2393 ) ( SURFACE-AT ?auto_2383 ?auto_2391 ) ( ON ?auto_2383 ?auto_2392 ) ( CLEAR ?auto_2383 ) ( not ( = ?auto_2382 ?auto_2383 ) ) ( not ( = ?auto_2382 ?auto_2392 ) ) ( not ( = ?auto_2383 ?auto_2392 ) ) ( not ( = ?auto_2390 ?auto_2393 ) ) ( SURFACE-AT ?auto_2381 ?auto_2389 ) ( CLEAR ?auto_2381 ) ( IS-CRATE ?auto_2382 ) ( AVAILABLE ?auto_2390 ) ( AVAILABLE ?auto_2387 ) ( SURFACE-AT ?auto_2382 ?auto_2385 ) ( ON ?auto_2382 ?auto_2394 ) ( CLEAR ?auto_2382 ) ( TRUCK-AT ?auto_2388 ?auto_2389 ) ( not ( = ?auto_2381 ?auto_2382 ) ) ( not ( = ?auto_2381 ?auto_2394 ) ) ( not ( = ?auto_2382 ?auto_2394 ) ) ( not ( = ?auto_2381 ?auto_2383 ) ) ( not ( = ?auto_2381 ?auto_2392 ) ) ( not ( = ?auto_2383 ?auto_2394 ) ) ( not ( = ?auto_2391 ?auto_2385 ) ) ( not ( = ?auto_2393 ?auto_2387 ) ) ( not ( = ?auto_2392 ?auto_2394 ) ) ( not ( = ?auto_2381 ?auto_2384 ) ) ( not ( = ?auto_2381 ?auto_2386 ) ) ( not ( = ?auto_2382 ?auto_2384 ) ) ( not ( = ?auto_2382 ?auto_2386 ) ) ( not ( = ?auto_2384 ?auto_2392 ) ) ( not ( = ?auto_2384 ?auto_2394 ) ) ( not ( = ?auto_2386 ?auto_2392 ) ) ( not ( = ?auto_2386 ?auto_2394 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2381 ?auto_2382 ?auto_2383 )
      ( MAKE-1CRATE ?auto_2383 ?auto_2384 )
      ( MAKE-3CRATE-VERIFY ?auto_2381 ?auto_2382 ?auto_2383 ?auto_2384 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2410 - SURFACE
      ?auto_2411 - SURFACE
      ?auto_2412 - SURFACE
      ?auto_2413 - SURFACE
      ?auto_2414 - SURFACE
    )
    :vars
    (
      ?auto_2419 - HOIST
      ?auto_2420 - PLACE
      ?auto_2416 - PLACE
      ?auto_2415 - HOIST
      ?auto_2417 - SURFACE
      ?auto_2421 - PLACE
      ?auto_2423 - HOIST
      ?auto_2422 - SURFACE
      ?auto_2425 - PLACE
      ?auto_2427 - HOIST
      ?auto_2424 - SURFACE
      ?auto_2426 - SURFACE
      ?auto_2418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2419 ?auto_2420 ) ( IS-CRATE ?auto_2414 ) ( not ( = ?auto_2416 ?auto_2420 ) ) ( HOIST-AT ?auto_2415 ?auto_2416 ) ( AVAILABLE ?auto_2415 ) ( SURFACE-AT ?auto_2414 ?auto_2416 ) ( ON ?auto_2414 ?auto_2417 ) ( CLEAR ?auto_2414 ) ( not ( = ?auto_2413 ?auto_2414 ) ) ( not ( = ?auto_2413 ?auto_2417 ) ) ( not ( = ?auto_2414 ?auto_2417 ) ) ( not ( = ?auto_2419 ?auto_2415 ) ) ( IS-CRATE ?auto_2413 ) ( not ( = ?auto_2421 ?auto_2420 ) ) ( HOIST-AT ?auto_2423 ?auto_2421 ) ( SURFACE-AT ?auto_2413 ?auto_2421 ) ( ON ?auto_2413 ?auto_2422 ) ( CLEAR ?auto_2413 ) ( not ( = ?auto_2412 ?auto_2413 ) ) ( not ( = ?auto_2412 ?auto_2422 ) ) ( not ( = ?auto_2413 ?auto_2422 ) ) ( not ( = ?auto_2419 ?auto_2423 ) ) ( IS-CRATE ?auto_2412 ) ( not ( = ?auto_2425 ?auto_2420 ) ) ( HOIST-AT ?auto_2427 ?auto_2425 ) ( AVAILABLE ?auto_2427 ) ( SURFACE-AT ?auto_2412 ?auto_2425 ) ( ON ?auto_2412 ?auto_2424 ) ( CLEAR ?auto_2412 ) ( not ( = ?auto_2411 ?auto_2412 ) ) ( not ( = ?auto_2411 ?auto_2424 ) ) ( not ( = ?auto_2412 ?auto_2424 ) ) ( not ( = ?auto_2419 ?auto_2427 ) ) ( SURFACE-AT ?auto_2410 ?auto_2420 ) ( CLEAR ?auto_2410 ) ( IS-CRATE ?auto_2411 ) ( AVAILABLE ?auto_2419 ) ( AVAILABLE ?auto_2423 ) ( SURFACE-AT ?auto_2411 ?auto_2421 ) ( ON ?auto_2411 ?auto_2426 ) ( CLEAR ?auto_2411 ) ( TRUCK-AT ?auto_2418 ?auto_2420 ) ( not ( = ?auto_2410 ?auto_2411 ) ) ( not ( = ?auto_2410 ?auto_2426 ) ) ( not ( = ?auto_2411 ?auto_2426 ) ) ( not ( = ?auto_2410 ?auto_2412 ) ) ( not ( = ?auto_2410 ?auto_2424 ) ) ( not ( = ?auto_2412 ?auto_2426 ) ) ( not ( = ?auto_2425 ?auto_2421 ) ) ( not ( = ?auto_2427 ?auto_2423 ) ) ( not ( = ?auto_2424 ?auto_2426 ) ) ( not ( = ?auto_2410 ?auto_2413 ) ) ( not ( = ?auto_2410 ?auto_2422 ) ) ( not ( = ?auto_2411 ?auto_2413 ) ) ( not ( = ?auto_2411 ?auto_2422 ) ) ( not ( = ?auto_2413 ?auto_2424 ) ) ( not ( = ?auto_2413 ?auto_2426 ) ) ( not ( = ?auto_2422 ?auto_2424 ) ) ( not ( = ?auto_2422 ?auto_2426 ) ) ( not ( = ?auto_2410 ?auto_2414 ) ) ( not ( = ?auto_2410 ?auto_2417 ) ) ( not ( = ?auto_2411 ?auto_2414 ) ) ( not ( = ?auto_2411 ?auto_2417 ) ) ( not ( = ?auto_2412 ?auto_2414 ) ) ( not ( = ?auto_2412 ?auto_2417 ) ) ( not ( = ?auto_2414 ?auto_2422 ) ) ( not ( = ?auto_2414 ?auto_2424 ) ) ( not ( = ?auto_2414 ?auto_2426 ) ) ( not ( = ?auto_2416 ?auto_2421 ) ) ( not ( = ?auto_2416 ?auto_2425 ) ) ( not ( = ?auto_2415 ?auto_2423 ) ) ( not ( = ?auto_2415 ?auto_2427 ) ) ( not ( = ?auto_2417 ?auto_2422 ) ) ( not ( = ?auto_2417 ?auto_2424 ) ) ( not ( = ?auto_2417 ?auto_2426 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2410 ?auto_2411 ?auto_2412 ?auto_2413 )
      ( MAKE-1CRATE ?auto_2413 ?auto_2414 )
      ( MAKE-4CRATE-VERIFY ?auto_2410 ?auto_2411 ?auto_2412 ?auto_2413 ?auto_2414 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2444 - SURFACE
      ?auto_2445 - SURFACE
      ?auto_2446 - SURFACE
      ?auto_2447 - SURFACE
      ?auto_2448 - SURFACE
      ?auto_2449 - SURFACE
    )
    :vars
    (
      ?auto_2455 - HOIST
      ?auto_2454 - PLACE
      ?auto_2453 - PLACE
      ?auto_2452 - HOIST
      ?auto_2450 - SURFACE
      ?auto_2460 - PLACE
      ?auto_2459 - HOIST
      ?auto_2462 - SURFACE
      ?auto_2456 - PLACE
      ?auto_2465 - HOIST
      ?auto_2457 - SURFACE
      ?auto_2463 - PLACE
      ?auto_2461 - HOIST
      ?auto_2458 - SURFACE
      ?auto_2464 - SURFACE
      ?auto_2451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2455 ?auto_2454 ) ( IS-CRATE ?auto_2449 ) ( not ( = ?auto_2453 ?auto_2454 ) ) ( HOIST-AT ?auto_2452 ?auto_2453 ) ( AVAILABLE ?auto_2452 ) ( SURFACE-AT ?auto_2449 ?auto_2453 ) ( ON ?auto_2449 ?auto_2450 ) ( CLEAR ?auto_2449 ) ( not ( = ?auto_2448 ?auto_2449 ) ) ( not ( = ?auto_2448 ?auto_2450 ) ) ( not ( = ?auto_2449 ?auto_2450 ) ) ( not ( = ?auto_2455 ?auto_2452 ) ) ( IS-CRATE ?auto_2448 ) ( not ( = ?auto_2460 ?auto_2454 ) ) ( HOIST-AT ?auto_2459 ?auto_2460 ) ( AVAILABLE ?auto_2459 ) ( SURFACE-AT ?auto_2448 ?auto_2460 ) ( ON ?auto_2448 ?auto_2462 ) ( CLEAR ?auto_2448 ) ( not ( = ?auto_2447 ?auto_2448 ) ) ( not ( = ?auto_2447 ?auto_2462 ) ) ( not ( = ?auto_2448 ?auto_2462 ) ) ( not ( = ?auto_2455 ?auto_2459 ) ) ( IS-CRATE ?auto_2447 ) ( not ( = ?auto_2456 ?auto_2454 ) ) ( HOIST-AT ?auto_2465 ?auto_2456 ) ( SURFACE-AT ?auto_2447 ?auto_2456 ) ( ON ?auto_2447 ?auto_2457 ) ( CLEAR ?auto_2447 ) ( not ( = ?auto_2446 ?auto_2447 ) ) ( not ( = ?auto_2446 ?auto_2457 ) ) ( not ( = ?auto_2447 ?auto_2457 ) ) ( not ( = ?auto_2455 ?auto_2465 ) ) ( IS-CRATE ?auto_2446 ) ( not ( = ?auto_2463 ?auto_2454 ) ) ( HOIST-AT ?auto_2461 ?auto_2463 ) ( AVAILABLE ?auto_2461 ) ( SURFACE-AT ?auto_2446 ?auto_2463 ) ( ON ?auto_2446 ?auto_2458 ) ( CLEAR ?auto_2446 ) ( not ( = ?auto_2445 ?auto_2446 ) ) ( not ( = ?auto_2445 ?auto_2458 ) ) ( not ( = ?auto_2446 ?auto_2458 ) ) ( not ( = ?auto_2455 ?auto_2461 ) ) ( SURFACE-AT ?auto_2444 ?auto_2454 ) ( CLEAR ?auto_2444 ) ( IS-CRATE ?auto_2445 ) ( AVAILABLE ?auto_2455 ) ( AVAILABLE ?auto_2465 ) ( SURFACE-AT ?auto_2445 ?auto_2456 ) ( ON ?auto_2445 ?auto_2464 ) ( CLEAR ?auto_2445 ) ( TRUCK-AT ?auto_2451 ?auto_2454 ) ( not ( = ?auto_2444 ?auto_2445 ) ) ( not ( = ?auto_2444 ?auto_2464 ) ) ( not ( = ?auto_2445 ?auto_2464 ) ) ( not ( = ?auto_2444 ?auto_2446 ) ) ( not ( = ?auto_2444 ?auto_2458 ) ) ( not ( = ?auto_2446 ?auto_2464 ) ) ( not ( = ?auto_2463 ?auto_2456 ) ) ( not ( = ?auto_2461 ?auto_2465 ) ) ( not ( = ?auto_2458 ?auto_2464 ) ) ( not ( = ?auto_2444 ?auto_2447 ) ) ( not ( = ?auto_2444 ?auto_2457 ) ) ( not ( = ?auto_2445 ?auto_2447 ) ) ( not ( = ?auto_2445 ?auto_2457 ) ) ( not ( = ?auto_2447 ?auto_2458 ) ) ( not ( = ?auto_2447 ?auto_2464 ) ) ( not ( = ?auto_2457 ?auto_2458 ) ) ( not ( = ?auto_2457 ?auto_2464 ) ) ( not ( = ?auto_2444 ?auto_2448 ) ) ( not ( = ?auto_2444 ?auto_2462 ) ) ( not ( = ?auto_2445 ?auto_2448 ) ) ( not ( = ?auto_2445 ?auto_2462 ) ) ( not ( = ?auto_2446 ?auto_2448 ) ) ( not ( = ?auto_2446 ?auto_2462 ) ) ( not ( = ?auto_2448 ?auto_2457 ) ) ( not ( = ?auto_2448 ?auto_2458 ) ) ( not ( = ?auto_2448 ?auto_2464 ) ) ( not ( = ?auto_2460 ?auto_2456 ) ) ( not ( = ?auto_2460 ?auto_2463 ) ) ( not ( = ?auto_2459 ?auto_2465 ) ) ( not ( = ?auto_2459 ?auto_2461 ) ) ( not ( = ?auto_2462 ?auto_2457 ) ) ( not ( = ?auto_2462 ?auto_2458 ) ) ( not ( = ?auto_2462 ?auto_2464 ) ) ( not ( = ?auto_2444 ?auto_2449 ) ) ( not ( = ?auto_2444 ?auto_2450 ) ) ( not ( = ?auto_2445 ?auto_2449 ) ) ( not ( = ?auto_2445 ?auto_2450 ) ) ( not ( = ?auto_2446 ?auto_2449 ) ) ( not ( = ?auto_2446 ?auto_2450 ) ) ( not ( = ?auto_2447 ?auto_2449 ) ) ( not ( = ?auto_2447 ?auto_2450 ) ) ( not ( = ?auto_2449 ?auto_2462 ) ) ( not ( = ?auto_2449 ?auto_2457 ) ) ( not ( = ?auto_2449 ?auto_2458 ) ) ( not ( = ?auto_2449 ?auto_2464 ) ) ( not ( = ?auto_2453 ?auto_2460 ) ) ( not ( = ?auto_2453 ?auto_2456 ) ) ( not ( = ?auto_2453 ?auto_2463 ) ) ( not ( = ?auto_2452 ?auto_2459 ) ) ( not ( = ?auto_2452 ?auto_2465 ) ) ( not ( = ?auto_2452 ?auto_2461 ) ) ( not ( = ?auto_2450 ?auto_2462 ) ) ( not ( = ?auto_2450 ?auto_2457 ) ) ( not ( = ?auto_2450 ?auto_2458 ) ) ( not ( = ?auto_2450 ?auto_2464 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2444 ?auto_2445 ?auto_2446 ?auto_2447 ?auto_2448 )
      ( MAKE-1CRATE ?auto_2448 ?auto_2449 )
      ( MAKE-5CRATE-VERIFY ?auto_2444 ?auto_2445 ?auto_2446 ?auto_2447 ?auto_2448 ?auto_2449 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2483 - SURFACE
      ?auto_2484 - SURFACE
      ?auto_2485 - SURFACE
      ?auto_2486 - SURFACE
      ?auto_2487 - SURFACE
      ?auto_2488 - SURFACE
      ?auto_2489 - SURFACE
    )
    :vars
    (
      ?auto_2491 - HOIST
      ?auto_2495 - PLACE
      ?auto_2494 - PLACE
      ?auto_2493 - HOIST
      ?auto_2490 - SURFACE
      ?auto_2501 - SURFACE
      ?auto_2506 - PLACE
      ?auto_2504 - HOIST
      ?auto_2502 - SURFACE
      ?auto_2500 - PLACE
      ?auto_2496 - HOIST
      ?auto_2497 - SURFACE
      ?auto_2503 - PLACE
      ?auto_2505 - HOIST
      ?auto_2498 - SURFACE
      ?auto_2499 - SURFACE
      ?auto_2492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2491 ?auto_2495 ) ( IS-CRATE ?auto_2489 ) ( not ( = ?auto_2494 ?auto_2495 ) ) ( HOIST-AT ?auto_2493 ?auto_2494 ) ( SURFACE-AT ?auto_2489 ?auto_2494 ) ( ON ?auto_2489 ?auto_2490 ) ( CLEAR ?auto_2489 ) ( not ( = ?auto_2488 ?auto_2489 ) ) ( not ( = ?auto_2488 ?auto_2490 ) ) ( not ( = ?auto_2489 ?auto_2490 ) ) ( not ( = ?auto_2491 ?auto_2493 ) ) ( IS-CRATE ?auto_2488 ) ( AVAILABLE ?auto_2493 ) ( SURFACE-AT ?auto_2488 ?auto_2494 ) ( ON ?auto_2488 ?auto_2501 ) ( CLEAR ?auto_2488 ) ( not ( = ?auto_2487 ?auto_2488 ) ) ( not ( = ?auto_2487 ?auto_2501 ) ) ( not ( = ?auto_2488 ?auto_2501 ) ) ( IS-CRATE ?auto_2487 ) ( not ( = ?auto_2506 ?auto_2495 ) ) ( HOIST-AT ?auto_2504 ?auto_2506 ) ( AVAILABLE ?auto_2504 ) ( SURFACE-AT ?auto_2487 ?auto_2506 ) ( ON ?auto_2487 ?auto_2502 ) ( CLEAR ?auto_2487 ) ( not ( = ?auto_2486 ?auto_2487 ) ) ( not ( = ?auto_2486 ?auto_2502 ) ) ( not ( = ?auto_2487 ?auto_2502 ) ) ( not ( = ?auto_2491 ?auto_2504 ) ) ( IS-CRATE ?auto_2486 ) ( not ( = ?auto_2500 ?auto_2495 ) ) ( HOIST-AT ?auto_2496 ?auto_2500 ) ( SURFACE-AT ?auto_2486 ?auto_2500 ) ( ON ?auto_2486 ?auto_2497 ) ( CLEAR ?auto_2486 ) ( not ( = ?auto_2485 ?auto_2486 ) ) ( not ( = ?auto_2485 ?auto_2497 ) ) ( not ( = ?auto_2486 ?auto_2497 ) ) ( not ( = ?auto_2491 ?auto_2496 ) ) ( IS-CRATE ?auto_2485 ) ( not ( = ?auto_2503 ?auto_2495 ) ) ( HOIST-AT ?auto_2505 ?auto_2503 ) ( AVAILABLE ?auto_2505 ) ( SURFACE-AT ?auto_2485 ?auto_2503 ) ( ON ?auto_2485 ?auto_2498 ) ( CLEAR ?auto_2485 ) ( not ( = ?auto_2484 ?auto_2485 ) ) ( not ( = ?auto_2484 ?auto_2498 ) ) ( not ( = ?auto_2485 ?auto_2498 ) ) ( not ( = ?auto_2491 ?auto_2505 ) ) ( SURFACE-AT ?auto_2483 ?auto_2495 ) ( CLEAR ?auto_2483 ) ( IS-CRATE ?auto_2484 ) ( AVAILABLE ?auto_2491 ) ( AVAILABLE ?auto_2496 ) ( SURFACE-AT ?auto_2484 ?auto_2500 ) ( ON ?auto_2484 ?auto_2499 ) ( CLEAR ?auto_2484 ) ( TRUCK-AT ?auto_2492 ?auto_2495 ) ( not ( = ?auto_2483 ?auto_2484 ) ) ( not ( = ?auto_2483 ?auto_2499 ) ) ( not ( = ?auto_2484 ?auto_2499 ) ) ( not ( = ?auto_2483 ?auto_2485 ) ) ( not ( = ?auto_2483 ?auto_2498 ) ) ( not ( = ?auto_2485 ?auto_2499 ) ) ( not ( = ?auto_2503 ?auto_2500 ) ) ( not ( = ?auto_2505 ?auto_2496 ) ) ( not ( = ?auto_2498 ?auto_2499 ) ) ( not ( = ?auto_2483 ?auto_2486 ) ) ( not ( = ?auto_2483 ?auto_2497 ) ) ( not ( = ?auto_2484 ?auto_2486 ) ) ( not ( = ?auto_2484 ?auto_2497 ) ) ( not ( = ?auto_2486 ?auto_2498 ) ) ( not ( = ?auto_2486 ?auto_2499 ) ) ( not ( = ?auto_2497 ?auto_2498 ) ) ( not ( = ?auto_2497 ?auto_2499 ) ) ( not ( = ?auto_2483 ?auto_2487 ) ) ( not ( = ?auto_2483 ?auto_2502 ) ) ( not ( = ?auto_2484 ?auto_2487 ) ) ( not ( = ?auto_2484 ?auto_2502 ) ) ( not ( = ?auto_2485 ?auto_2487 ) ) ( not ( = ?auto_2485 ?auto_2502 ) ) ( not ( = ?auto_2487 ?auto_2497 ) ) ( not ( = ?auto_2487 ?auto_2498 ) ) ( not ( = ?auto_2487 ?auto_2499 ) ) ( not ( = ?auto_2506 ?auto_2500 ) ) ( not ( = ?auto_2506 ?auto_2503 ) ) ( not ( = ?auto_2504 ?auto_2496 ) ) ( not ( = ?auto_2504 ?auto_2505 ) ) ( not ( = ?auto_2502 ?auto_2497 ) ) ( not ( = ?auto_2502 ?auto_2498 ) ) ( not ( = ?auto_2502 ?auto_2499 ) ) ( not ( = ?auto_2483 ?auto_2488 ) ) ( not ( = ?auto_2483 ?auto_2501 ) ) ( not ( = ?auto_2484 ?auto_2488 ) ) ( not ( = ?auto_2484 ?auto_2501 ) ) ( not ( = ?auto_2485 ?auto_2488 ) ) ( not ( = ?auto_2485 ?auto_2501 ) ) ( not ( = ?auto_2486 ?auto_2488 ) ) ( not ( = ?auto_2486 ?auto_2501 ) ) ( not ( = ?auto_2488 ?auto_2502 ) ) ( not ( = ?auto_2488 ?auto_2497 ) ) ( not ( = ?auto_2488 ?auto_2498 ) ) ( not ( = ?auto_2488 ?auto_2499 ) ) ( not ( = ?auto_2494 ?auto_2506 ) ) ( not ( = ?auto_2494 ?auto_2500 ) ) ( not ( = ?auto_2494 ?auto_2503 ) ) ( not ( = ?auto_2493 ?auto_2504 ) ) ( not ( = ?auto_2493 ?auto_2496 ) ) ( not ( = ?auto_2493 ?auto_2505 ) ) ( not ( = ?auto_2501 ?auto_2502 ) ) ( not ( = ?auto_2501 ?auto_2497 ) ) ( not ( = ?auto_2501 ?auto_2498 ) ) ( not ( = ?auto_2501 ?auto_2499 ) ) ( not ( = ?auto_2483 ?auto_2489 ) ) ( not ( = ?auto_2483 ?auto_2490 ) ) ( not ( = ?auto_2484 ?auto_2489 ) ) ( not ( = ?auto_2484 ?auto_2490 ) ) ( not ( = ?auto_2485 ?auto_2489 ) ) ( not ( = ?auto_2485 ?auto_2490 ) ) ( not ( = ?auto_2486 ?auto_2489 ) ) ( not ( = ?auto_2486 ?auto_2490 ) ) ( not ( = ?auto_2487 ?auto_2489 ) ) ( not ( = ?auto_2487 ?auto_2490 ) ) ( not ( = ?auto_2489 ?auto_2501 ) ) ( not ( = ?auto_2489 ?auto_2502 ) ) ( not ( = ?auto_2489 ?auto_2497 ) ) ( not ( = ?auto_2489 ?auto_2498 ) ) ( not ( = ?auto_2489 ?auto_2499 ) ) ( not ( = ?auto_2490 ?auto_2501 ) ) ( not ( = ?auto_2490 ?auto_2502 ) ) ( not ( = ?auto_2490 ?auto_2497 ) ) ( not ( = ?auto_2490 ?auto_2498 ) ) ( not ( = ?auto_2490 ?auto_2499 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2483 ?auto_2484 ?auto_2485 ?auto_2486 ?auto_2487 ?auto_2488 )
      ( MAKE-1CRATE ?auto_2488 ?auto_2489 )
      ( MAKE-6CRATE-VERIFY ?auto_2483 ?auto_2484 ?auto_2485 ?auto_2486 ?auto_2487 ?auto_2488 ?auto_2489 ) )
  )

)

