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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2344 - SURFACE
      ?auto_2345 - SURFACE
    )
    :vars
    (
      ?auto_2346 - HOIST
      ?auto_2347 - PLACE
      ?auto_2349 - PLACE
      ?auto_2350 - HOIST
      ?auto_2351 - SURFACE
      ?auto_2348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2346 ?auto_2347 ) ( SURFACE-AT ?auto_2344 ?auto_2347 ) ( CLEAR ?auto_2344 ) ( IS-CRATE ?auto_2345 ) ( AVAILABLE ?auto_2346 ) ( not ( = ?auto_2349 ?auto_2347 ) ) ( HOIST-AT ?auto_2350 ?auto_2349 ) ( AVAILABLE ?auto_2350 ) ( SURFACE-AT ?auto_2345 ?auto_2349 ) ( ON ?auto_2345 ?auto_2351 ) ( CLEAR ?auto_2345 ) ( TRUCK-AT ?auto_2348 ?auto_2347 ) ( not ( = ?auto_2344 ?auto_2345 ) ) ( not ( = ?auto_2344 ?auto_2351 ) ) ( not ( = ?auto_2345 ?auto_2351 ) ) ( not ( = ?auto_2346 ?auto_2350 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2348 ?auto_2347 ?auto_2349 )
      ( !LIFT ?auto_2350 ?auto_2345 ?auto_2351 ?auto_2349 )
      ( !LOAD ?auto_2350 ?auto_2345 ?auto_2348 ?auto_2349 )
      ( !DRIVE ?auto_2348 ?auto_2349 ?auto_2347 )
      ( !UNLOAD ?auto_2346 ?auto_2345 ?auto_2348 ?auto_2347 )
      ( !DROP ?auto_2346 ?auto_2345 ?auto_2344 ?auto_2347 )
      ( MAKE-1CRATE-VERIFY ?auto_2344 ?auto_2345 ) )
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
      ?auto_2359 - HOIST
      ?auto_2363 - PLACE
      ?auto_2362 - PLACE
      ?auto_2360 - HOIST
      ?auto_2361 - SURFACE
      ?auto_2366 - PLACE
      ?auto_2364 - HOIST
      ?auto_2365 - SURFACE
      ?auto_2358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2359 ?auto_2363 ) ( IS-CRATE ?auto_2357 ) ( not ( = ?auto_2362 ?auto_2363 ) ) ( HOIST-AT ?auto_2360 ?auto_2362 ) ( AVAILABLE ?auto_2360 ) ( SURFACE-AT ?auto_2357 ?auto_2362 ) ( ON ?auto_2357 ?auto_2361 ) ( CLEAR ?auto_2357 ) ( not ( = ?auto_2356 ?auto_2357 ) ) ( not ( = ?auto_2356 ?auto_2361 ) ) ( not ( = ?auto_2357 ?auto_2361 ) ) ( not ( = ?auto_2359 ?auto_2360 ) ) ( SURFACE-AT ?auto_2355 ?auto_2363 ) ( CLEAR ?auto_2355 ) ( IS-CRATE ?auto_2356 ) ( AVAILABLE ?auto_2359 ) ( not ( = ?auto_2366 ?auto_2363 ) ) ( HOIST-AT ?auto_2364 ?auto_2366 ) ( AVAILABLE ?auto_2364 ) ( SURFACE-AT ?auto_2356 ?auto_2366 ) ( ON ?auto_2356 ?auto_2365 ) ( CLEAR ?auto_2356 ) ( TRUCK-AT ?auto_2358 ?auto_2363 ) ( not ( = ?auto_2355 ?auto_2356 ) ) ( not ( = ?auto_2355 ?auto_2365 ) ) ( not ( = ?auto_2356 ?auto_2365 ) ) ( not ( = ?auto_2359 ?auto_2364 ) ) ( not ( = ?auto_2355 ?auto_2357 ) ) ( not ( = ?auto_2355 ?auto_2361 ) ) ( not ( = ?auto_2357 ?auto_2365 ) ) ( not ( = ?auto_2362 ?auto_2366 ) ) ( not ( = ?auto_2360 ?auto_2364 ) ) ( not ( = ?auto_2361 ?auto_2365 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2355 ?auto_2356 )
      ( MAKE-1CRATE ?auto_2356 ?auto_2357 )
      ( MAKE-2CRATE-VERIFY ?auto_2355 ?auto_2356 ?auto_2357 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2369 - SURFACE
      ?auto_2370 - SURFACE
    )
    :vars
    (
      ?auto_2371 - HOIST
      ?auto_2372 - PLACE
      ?auto_2374 - PLACE
      ?auto_2375 - HOIST
      ?auto_2376 - SURFACE
      ?auto_2373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2371 ?auto_2372 ) ( SURFACE-AT ?auto_2369 ?auto_2372 ) ( CLEAR ?auto_2369 ) ( IS-CRATE ?auto_2370 ) ( AVAILABLE ?auto_2371 ) ( not ( = ?auto_2374 ?auto_2372 ) ) ( HOIST-AT ?auto_2375 ?auto_2374 ) ( AVAILABLE ?auto_2375 ) ( SURFACE-AT ?auto_2370 ?auto_2374 ) ( ON ?auto_2370 ?auto_2376 ) ( CLEAR ?auto_2370 ) ( TRUCK-AT ?auto_2373 ?auto_2372 ) ( not ( = ?auto_2369 ?auto_2370 ) ) ( not ( = ?auto_2369 ?auto_2376 ) ) ( not ( = ?auto_2370 ?auto_2376 ) ) ( not ( = ?auto_2371 ?auto_2375 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2373 ?auto_2372 ?auto_2374 )
      ( !LIFT ?auto_2375 ?auto_2370 ?auto_2376 ?auto_2374 )
      ( !LOAD ?auto_2375 ?auto_2370 ?auto_2373 ?auto_2374 )
      ( !DRIVE ?auto_2373 ?auto_2374 ?auto_2372 )
      ( !UNLOAD ?auto_2371 ?auto_2370 ?auto_2373 ?auto_2372 )
      ( !DROP ?auto_2371 ?auto_2370 ?auto_2369 ?auto_2372 )
      ( MAKE-1CRATE-VERIFY ?auto_2369 ?auto_2370 ) )
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
      ?auto_2386 - PLACE
      ?auto_2389 - PLACE
      ?auto_2385 - HOIST
      ?auto_2388 - SURFACE
      ?auto_2394 - PLACE
      ?auto_2392 - HOIST
      ?auto_2391 - SURFACE
      ?auto_2393 - SURFACE
      ?auto_2387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2390 ?auto_2386 ) ( IS-CRATE ?auto_2384 ) ( not ( = ?auto_2389 ?auto_2386 ) ) ( HOIST-AT ?auto_2385 ?auto_2389 ) ( SURFACE-AT ?auto_2384 ?auto_2389 ) ( ON ?auto_2384 ?auto_2388 ) ( CLEAR ?auto_2384 ) ( not ( = ?auto_2383 ?auto_2384 ) ) ( not ( = ?auto_2383 ?auto_2388 ) ) ( not ( = ?auto_2384 ?auto_2388 ) ) ( not ( = ?auto_2390 ?auto_2385 ) ) ( IS-CRATE ?auto_2383 ) ( not ( = ?auto_2394 ?auto_2386 ) ) ( HOIST-AT ?auto_2392 ?auto_2394 ) ( AVAILABLE ?auto_2392 ) ( SURFACE-AT ?auto_2383 ?auto_2394 ) ( ON ?auto_2383 ?auto_2391 ) ( CLEAR ?auto_2383 ) ( not ( = ?auto_2382 ?auto_2383 ) ) ( not ( = ?auto_2382 ?auto_2391 ) ) ( not ( = ?auto_2383 ?auto_2391 ) ) ( not ( = ?auto_2390 ?auto_2392 ) ) ( SURFACE-AT ?auto_2381 ?auto_2386 ) ( CLEAR ?auto_2381 ) ( IS-CRATE ?auto_2382 ) ( AVAILABLE ?auto_2390 ) ( AVAILABLE ?auto_2385 ) ( SURFACE-AT ?auto_2382 ?auto_2389 ) ( ON ?auto_2382 ?auto_2393 ) ( CLEAR ?auto_2382 ) ( TRUCK-AT ?auto_2387 ?auto_2386 ) ( not ( = ?auto_2381 ?auto_2382 ) ) ( not ( = ?auto_2381 ?auto_2393 ) ) ( not ( = ?auto_2382 ?auto_2393 ) ) ( not ( = ?auto_2381 ?auto_2383 ) ) ( not ( = ?auto_2381 ?auto_2391 ) ) ( not ( = ?auto_2383 ?auto_2393 ) ) ( not ( = ?auto_2394 ?auto_2389 ) ) ( not ( = ?auto_2392 ?auto_2385 ) ) ( not ( = ?auto_2391 ?auto_2393 ) ) ( not ( = ?auto_2381 ?auto_2384 ) ) ( not ( = ?auto_2381 ?auto_2388 ) ) ( not ( = ?auto_2382 ?auto_2384 ) ) ( not ( = ?auto_2382 ?auto_2388 ) ) ( not ( = ?auto_2384 ?auto_2391 ) ) ( not ( = ?auto_2384 ?auto_2393 ) ) ( not ( = ?auto_2388 ?auto_2391 ) ) ( not ( = ?auto_2388 ?auto_2393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2381 ?auto_2382 ?auto_2383 )
      ( MAKE-1CRATE ?auto_2383 ?auto_2384 )
      ( MAKE-3CRATE-VERIFY ?auto_2381 ?auto_2382 ?auto_2383 ?auto_2384 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2397 - SURFACE
      ?auto_2398 - SURFACE
    )
    :vars
    (
      ?auto_2399 - HOIST
      ?auto_2400 - PLACE
      ?auto_2402 - PLACE
      ?auto_2403 - HOIST
      ?auto_2404 - SURFACE
      ?auto_2401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2399 ?auto_2400 ) ( SURFACE-AT ?auto_2397 ?auto_2400 ) ( CLEAR ?auto_2397 ) ( IS-CRATE ?auto_2398 ) ( AVAILABLE ?auto_2399 ) ( not ( = ?auto_2402 ?auto_2400 ) ) ( HOIST-AT ?auto_2403 ?auto_2402 ) ( AVAILABLE ?auto_2403 ) ( SURFACE-AT ?auto_2398 ?auto_2402 ) ( ON ?auto_2398 ?auto_2404 ) ( CLEAR ?auto_2398 ) ( TRUCK-AT ?auto_2401 ?auto_2400 ) ( not ( = ?auto_2397 ?auto_2398 ) ) ( not ( = ?auto_2397 ?auto_2404 ) ) ( not ( = ?auto_2398 ?auto_2404 ) ) ( not ( = ?auto_2399 ?auto_2403 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2401 ?auto_2400 ?auto_2402 )
      ( !LIFT ?auto_2403 ?auto_2398 ?auto_2404 ?auto_2402 )
      ( !LOAD ?auto_2403 ?auto_2398 ?auto_2401 ?auto_2402 )
      ( !DRIVE ?auto_2401 ?auto_2402 ?auto_2400 )
      ( !UNLOAD ?auto_2399 ?auto_2398 ?auto_2401 ?auto_2400 )
      ( !DROP ?auto_2399 ?auto_2398 ?auto_2397 ?auto_2400 )
      ( MAKE-1CRATE-VERIFY ?auto_2397 ?auto_2398 ) )
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
      ?auto_2415 - PLACE
      ?auto_2417 - HOIST
      ?auto_2416 - SURFACE
      ?auto_2423 - PLACE
      ?auto_2424 - HOIST
      ?auto_2425 - SURFACE
      ?auto_2427 - PLACE
      ?auto_2421 - HOIST
      ?auto_2422 - SURFACE
      ?auto_2426 - SURFACE
      ?auto_2418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2419 ?auto_2420 ) ( IS-CRATE ?auto_2414 ) ( not ( = ?auto_2415 ?auto_2420 ) ) ( HOIST-AT ?auto_2417 ?auto_2415 ) ( AVAILABLE ?auto_2417 ) ( SURFACE-AT ?auto_2414 ?auto_2415 ) ( ON ?auto_2414 ?auto_2416 ) ( CLEAR ?auto_2414 ) ( not ( = ?auto_2413 ?auto_2414 ) ) ( not ( = ?auto_2413 ?auto_2416 ) ) ( not ( = ?auto_2414 ?auto_2416 ) ) ( not ( = ?auto_2419 ?auto_2417 ) ) ( IS-CRATE ?auto_2413 ) ( not ( = ?auto_2423 ?auto_2420 ) ) ( HOIST-AT ?auto_2424 ?auto_2423 ) ( SURFACE-AT ?auto_2413 ?auto_2423 ) ( ON ?auto_2413 ?auto_2425 ) ( CLEAR ?auto_2413 ) ( not ( = ?auto_2412 ?auto_2413 ) ) ( not ( = ?auto_2412 ?auto_2425 ) ) ( not ( = ?auto_2413 ?auto_2425 ) ) ( not ( = ?auto_2419 ?auto_2424 ) ) ( IS-CRATE ?auto_2412 ) ( not ( = ?auto_2427 ?auto_2420 ) ) ( HOIST-AT ?auto_2421 ?auto_2427 ) ( AVAILABLE ?auto_2421 ) ( SURFACE-AT ?auto_2412 ?auto_2427 ) ( ON ?auto_2412 ?auto_2422 ) ( CLEAR ?auto_2412 ) ( not ( = ?auto_2411 ?auto_2412 ) ) ( not ( = ?auto_2411 ?auto_2422 ) ) ( not ( = ?auto_2412 ?auto_2422 ) ) ( not ( = ?auto_2419 ?auto_2421 ) ) ( SURFACE-AT ?auto_2410 ?auto_2420 ) ( CLEAR ?auto_2410 ) ( IS-CRATE ?auto_2411 ) ( AVAILABLE ?auto_2419 ) ( AVAILABLE ?auto_2424 ) ( SURFACE-AT ?auto_2411 ?auto_2423 ) ( ON ?auto_2411 ?auto_2426 ) ( CLEAR ?auto_2411 ) ( TRUCK-AT ?auto_2418 ?auto_2420 ) ( not ( = ?auto_2410 ?auto_2411 ) ) ( not ( = ?auto_2410 ?auto_2426 ) ) ( not ( = ?auto_2411 ?auto_2426 ) ) ( not ( = ?auto_2410 ?auto_2412 ) ) ( not ( = ?auto_2410 ?auto_2422 ) ) ( not ( = ?auto_2412 ?auto_2426 ) ) ( not ( = ?auto_2427 ?auto_2423 ) ) ( not ( = ?auto_2421 ?auto_2424 ) ) ( not ( = ?auto_2422 ?auto_2426 ) ) ( not ( = ?auto_2410 ?auto_2413 ) ) ( not ( = ?auto_2410 ?auto_2425 ) ) ( not ( = ?auto_2411 ?auto_2413 ) ) ( not ( = ?auto_2411 ?auto_2425 ) ) ( not ( = ?auto_2413 ?auto_2422 ) ) ( not ( = ?auto_2413 ?auto_2426 ) ) ( not ( = ?auto_2425 ?auto_2422 ) ) ( not ( = ?auto_2425 ?auto_2426 ) ) ( not ( = ?auto_2410 ?auto_2414 ) ) ( not ( = ?auto_2410 ?auto_2416 ) ) ( not ( = ?auto_2411 ?auto_2414 ) ) ( not ( = ?auto_2411 ?auto_2416 ) ) ( not ( = ?auto_2412 ?auto_2414 ) ) ( not ( = ?auto_2412 ?auto_2416 ) ) ( not ( = ?auto_2414 ?auto_2425 ) ) ( not ( = ?auto_2414 ?auto_2422 ) ) ( not ( = ?auto_2414 ?auto_2426 ) ) ( not ( = ?auto_2415 ?auto_2423 ) ) ( not ( = ?auto_2415 ?auto_2427 ) ) ( not ( = ?auto_2417 ?auto_2424 ) ) ( not ( = ?auto_2417 ?auto_2421 ) ) ( not ( = ?auto_2416 ?auto_2425 ) ) ( not ( = ?auto_2416 ?auto_2422 ) ) ( not ( = ?auto_2416 ?auto_2426 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_2410 ?auto_2411 ?auto_2412 ?auto_2413 )
      ( MAKE-1CRATE ?auto_2413 ?auto_2414 )
      ( MAKE-4CRATE-VERIFY ?auto_2410 ?auto_2411 ?auto_2412 ?auto_2413 ?auto_2414 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2430 - SURFACE
      ?auto_2431 - SURFACE
    )
    :vars
    (
      ?auto_2432 - HOIST
      ?auto_2433 - PLACE
      ?auto_2435 - PLACE
      ?auto_2436 - HOIST
      ?auto_2437 - SURFACE
      ?auto_2434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2432 ?auto_2433 ) ( SURFACE-AT ?auto_2430 ?auto_2433 ) ( CLEAR ?auto_2430 ) ( IS-CRATE ?auto_2431 ) ( AVAILABLE ?auto_2432 ) ( not ( = ?auto_2435 ?auto_2433 ) ) ( HOIST-AT ?auto_2436 ?auto_2435 ) ( AVAILABLE ?auto_2436 ) ( SURFACE-AT ?auto_2431 ?auto_2435 ) ( ON ?auto_2431 ?auto_2437 ) ( CLEAR ?auto_2431 ) ( TRUCK-AT ?auto_2434 ?auto_2433 ) ( not ( = ?auto_2430 ?auto_2431 ) ) ( not ( = ?auto_2430 ?auto_2437 ) ) ( not ( = ?auto_2431 ?auto_2437 ) ) ( not ( = ?auto_2432 ?auto_2436 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2434 ?auto_2433 ?auto_2435 )
      ( !LIFT ?auto_2436 ?auto_2431 ?auto_2437 ?auto_2435 )
      ( !LOAD ?auto_2436 ?auto_2431 ?auto_2434 ?auto_2435 )
      ( !DRIVE ?auto_2434 ?auto_2435 ?auto_2433 )
      ( !UNLOAD ?auto_2432 ?auto_2431 ?auto_2434 ?auto_2433 )
      ( !DROP ?auto_2432 ?auto_2431 ?auto_2430 ?auto_2433 )
      ( MAKE-1CRATE-VERIFY ?auto_2430 ?auto_2431 ) )
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
      ?auto_2454 - HOIST
      ?auto_2455 - PLACE
      ?auto_2453 - PLACE
      ?auto_2451 - HOIST
      ?auto_2452 - SURFACE
      ?auto_2457 - PLACE
      ?auto_2458 - HOIST
      ?auto_2464 - SURFACE
      ?auto_2463 - PLACE
      ?auto_2459 - HOIST
      ?auto_2460 - SURFACE
      ?auto_2456 - PLACE
      ?auto_2462 - HOIST
      ?auto_2465 - SURFACE
      ?auto_2461 - SURFACE
      ?auto_2450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2454 ?auto_2455 ) ( IS-CRATE ?auto_2449 ) ( not ( = ?auto_2453 ?auto_2455 ) ) ( HOIST-AT ?auto_2451 ?auto_2453 ) ( AVAILABLE ?auto_2451 ) ( SURFACE-AT ?auto_2449 ?auto_2453 ) ( ON ?auto_2449 ?auto_2452 ) ( CLEAR ?auto_2449 ) ( not ( = ?auto_2448 ?auto_2449 ) ) ( not ( = ?auto_2448 ?auto_2452 ) ) ( not ( = ?auto_2449 ?auto_2452 ) ) ( not ( = ?auto_2454 ?auto_2451 ) ) ( IS-CRATE ?auto_2448 ) ( not ( = ?auto_2457 ?auto_2455 ) ) ( HOIST-AT ?auto_2458 ?auto_2457 ) ( AVAILABLE ?auto_2458 ) ( SURFACE-AT ?auto_2448 ?auto_2457 ) ( ON ?auto_2448 ?auto_2464 ) ( CLEAR ?auto_2448 ) ( not ( = ?auto_2447 ?auto_2448 ) ) ( not ( = ?auto_2447 ?auto_2464 ) ) ( not ( = ?auto_2448 ?auto_2464 ) ) ( not ( = ?auto_2454 ?auto_2458 ) ) ( IS-CRATE ?auto_2447 ) ( not ( = ?auto_2463 ?auto_2455 ) ) ( HOIST-AT ?auto_2459 ?auto_2463 ) ( SURFACE-AT ?auto_2447 ?auto_2463 ) ( ON ?auto_2447 ?auto_2460 ) ( CLEAR ?auto_2447 ) ( not ( = ?auto_2446 ?auto_2447 ) ) ( not ( = ?auto_2446 ?auto_2460 ) ) ( not ( = ?auto_2447 ?auto_2460 ) ) ( not ( = ?auto_2454 ?auto_2459 ) ) ( IS-CRATE ?auto_2446 ) ( not ( = ?auto_2456 ?auto_2455 ) ) ( HOIST-AT ?auto_2462 ?auto_2456 ) ( AVAILABLE ?auto_2462 ) ( SURFACE-AT ?auto_2446 ?auto_2456 ) ( ON ?auto_2446 ?auto_2465 ) ( CLEAR ?auto_2446 ) ( not ( = ?auto_2445 ?auto_2446 ) ) ( not ( = ?auto_2445 ?auto_2465 ) ) ( not ( = ?auto_2446 ?auto_2465 ) ) ( not ( = ?auto_2454 ?auto_2462 ) ) ( SURFACE-AT ?auto_2444 ?auto_2455 ) ( CLEAR ?auto_2444 ) ( IS-CRATE ?auto_2445 ) ( AVAILABLE ?auto_2454 ) ( AVAILABLE ?auto_2459 ) ( SURFACE-AT ?auto_2445 ?auto_2463 ) ( ON ?auto_2445 ?auto_2461 ) ( CLEAR ?auto_2445 ) ( TRUCK-AT ?auto_2450 ?auto_2455 ) ( not ( = ?auto_2444 ?auto_2445 ) ) ( not ( = ?auto_2444 ?auto_2461 ) ) ( not ( = ?auto_2445 ?auto_2461 ) ) ( not ( = ?auto_2444 ?auto_2446 ) ) ( not ( = ?auto_2444 ?auto_2465 ) ) ( not ( = ?auto_2446 ?auto_2461 ) ) ( not ( = ?auto_2456 ?auto_2463 ) ) ( not ( = ?auto_2462 ?auto_2459 ) ) ( not ( = ?auto_2465 ?auto_2461 ) ) ( not ( = ?auto_2444 ?auto_2447 ) ) ( not ( = ?auto_2444 ?auto_2460 ) ) ( not ( = ?auto_2445 ?auto_2447 ) ) ( not ( = ?auto_2445 ?auto_2460 ) ) ( not ( = ?auto_2447 ?auto_2465 ) ) ( not ( = ?auto_2447 ?auto_2461 ) ) ( not ( = ?auto_2460 ?auto_2465 ) ) ( not ( = ?auto_2460 ?auto_2461 ) ) ( not ( = ?auto_2444 ?auto_2448 ) ) ( not ( = ?auto_2444 ?auto_2464 ) ) ( not ( = ?auto_2445 ?auto_2448 ) ) ( not ( = ?auto_2445 ?auto_2464 ) ) ( not ( = ?auto_2446 ?auto_2448 ) ) ( not ( = ?auto_2446 ?auto_2464 ) ) ( not ( = ?auto_2448 ?auto_2460 ) ) ( not ( = ?auto_2448 ?auto_2465 ) ) ( not ( = ?auto_2448 ?auto_2461 ) ) ( not ( = ?auto_2457 ?auto_2463 ) ) ( not ( = ?auto_2457 ?auto_2456 ) ) ( not ( = ?auto_2458 ?auto_2459 ) ) ( not ( = ?auto_2458 ?auto_2462 ) ) ( not ( = ?auto_2464 ?auto_2460 ) ) ( not ( = ?auto_2464 ?auto_2465 ) ) ( not ( = ?auto_2464 ?auto_2461 ) ) ( not ( = ?auto_2444 ?auto_2449 ) ) ( not ( = ?auto_2444 ?auto_2452 ) ) ( not ( = ?auto_2445 ?auto_2449 ) ) ( not ( = ?auto_2445 ?auto_2452 ) ) ( not ( = ?auto_2446 ?auto_2449 ) ) ( not ( = ?auto_2446 ?auto_2452 ) ) ( not ( = ?auto_2447 ?auto_2449 ) ) ( not ( = ?auto_2447 ?auto_2452 ) ) ( not ( = ?auto_2449 ?auto_2464 ) ) ( not ( = ?auto_2449 ?auto_2460 ) ) ( not ( = ?auto_2449 ?auto_2465 ) ) ( not ( = ?auto_2449 ?auto_2461 ) ) ( not ( = ?auto_2453 ?auto_2457 ) ) ( not ( = ?auto_2453 ?auto_2463 ) ) ( not ( = ?auto_2453 ?auto_2456 ) ) ( not ( = ?auto_2451 ?auto_2458 ) ) ( not ( = ?auto_2451 ?auto_2459 ) ) ( not ( = ?auto_2451 ?auto_2462 ) ) ( not ( = ?auto_2452 ?auto_2464 ) ) ( not ( = ?auto_2452 ?auto_2460 ) ) ( not ( = ?auto_2452 ?auto_2465 ) ) ( not ( = ?auto_2452 ?auto_2461 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_2444 ?auto_2445 ?auto_2446 ?auto_2447 ?auto_2448 )
      ( MAKE-1CRATE ?auto_2448 ?auto_2449 )
      ( MAKE-5CRATE-VERIFY ?auto_2444 ?auto_2445 ?auto_2446 ?auto_2447 ?auto_2448 ?auto_2449 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2468 - SURFACE
      ?auto_2469 - SURFACE
    )
    :vars
    (
      ?auto_2470 - HOIST
      ?auto_2471 - PLACE
      ?auto_2473 - PLACE
      ?auto_2474 - HOIST
      ?auto_2475 - SURFACE
      ?auto_2472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2470 ?auto_2471 ) ( SURFACE-AT ?auto_2468 ?auto_2471 ) ( CLEAR ?auto_2468 ) ( IS-CRATE ?auto_2469 ) ( AVAILABLE ?auto_2470 ) ( not ( = ?auto_2473 ?auto_2471 ) ) ( HOIST-AT ?auto_2474 ?auto_2473 ) ( AVAILABLE ?auto_2474 ) ( SURFACE-AT ?auto_2469 ?auto_2473 ) ( ON ?auto_2469 ?auto_2475 ) ( CLEAR ?auto_2469 ) ( TRUCK-AT ?auto_2472 ?auto_2471 ) ( not ( = ?auto_2468 ?auto_2469 ) ) ( not ( = ?auto_2468 ?auto_2475 ) ) ( not ( = ?auto_2469 ?auto_2475 ) ) ( not ( = ?auto_2470 ?auto_2474 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2472 ?auto_2471 ?auto_2473 )
      ( !LIFT ?auto_2474 ?auto_2469 ?auto_2475 ?auto_2473 )
      ( !LOAD ?auto_2474 ?auto_2469 ?auto_2472 ?auto_2473 )
      ( !DRIVE ?auto_2472 ?auto_2473 ?auto_2471 )
      ( !UNLOAD ?auto_2470 ?auto_2469 ?auto_2472 ?auto_2471 )
      ( !DROP ?auto_2470 ?auto_2469 ?auto_2468 ?auto_2471 )
      ( MAKE-1CRATE-VERIFY ?auto_2468 ?auto_2469 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2483 - SURFACE
      ?auto_2484 - SURFACE
      ?auto_2485 - SURFACE
      ?auto_2486 - SURFACE
      ?auto_2487 - SURFACE
      ?auto_2489 - SURFACE
      ?auto_2488 - SURFACE
    )
    :vars
    (
      ?auto_2493 - HOIST
      ?auto_2490 - PLACE
      ?auto_2492 - PLACE
      ?auto_2491 - HOIST
      ?auto_2495 - SURFACE
      ?auto_2499 - SURFACE
      ?auto_2500 - PLACE
      ?auto_2497 - HOIST
      ?auto_2498 - SURFACE
      ?auto_2503 - PLACE
      ?auto_2496 - HOIST
      ?auto_2506 - SURFACE
      ?auto_2502 - PLACE
      ?auto_2505 - HOIST
      ?auto_2501 - SURFACE
      ?auto_2504 - SURFACE
      ?auto_2494 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2493 ?auto_2490 ) ( IS-CRATE ?auto_2488 ) ( not ( = ?auto_2492 ?auto_2490 ) ) ( HOIST-AT ?auto_2491 ?auto_2492 ) ( SURFACE-AT ?auto_2488 ?auto_2492 ) ( ON ?auto_2488 ?auto_2495 ) ( CLEAR ?auto_2488 ) ( not ( = ?auto_2489 ?auto_2488 ) ) ( not ( = ?auto_2489 ?auto_2495 ) ) ( not ( = ?auto_2488 ?auto_2495 ) ) ( not ( = ?auto_2493 ?auto_2491 ) ) ( IS-CRATE ?auto_2489 ) ( AVAILABLE ?auto_2491 ) ( SURFACE-AT ?auto_2489 ?auto_2492 ) ( ON ?auto_2489 ?auto_2499 ) ( CLEAR ?auto_2489 ) ( not ( = ?auto_2487 ?auto_2489 ) ) ( not ( = ?auto_2487 ?auto_2499 ) ) ( not ( = ?auto_2489 ?auto_2499 ) ) ( IS-CRATE ?auto_2487 ) ( not ( = ?auto_2500 ?auto_2490 ) ) ( HOIST-AT ?auto_2497 ?auto_2500 ) ( AVAILABLE ?auto_2497 ) ( SURFACE-AT ?auto_2487 ?auto_2500 ) ( ON ?auto_2487 ?auto_2498 ) ( CLEAR ?auto_2487 ) ( not ( = ?auto_2486 ?auto_2487 ) ) ( not ( = ?auto_2486 ?auto_2498 ) ) ( not ( = ?auto_2487 ?auto_2498 ) ) ( not ( = ?auto_2493 ?auto_2497 ) ) ( IS-CRATE ?auto_2486 ) ( not ( = ?auto_2503 ?auto_2490 ) ) ( HOIST-AT ?auto_2496 ?auto_2503 ) ( SURFACE-AT ?auto_2486 ?auto_2503 ) ( ON ?auto_2486 ?auto_2506 ) ( CLEAR ?auto_2486 ) ( not ( = ?auto_2485 ?auto_2486 ) ) ( not ( = ?auto_2485 ?auto_2506 ) ) ( not ( = ?auto_2486 ?auto_2506 ) ) ( not ( = ?auto_2493 ?auto_2496 ) ) ( IS-CRATE ?auto_2485 ) ( not ( = ?auto_2502 ?auto_2490 ) ) ( HOIST-AT ?auto_2505 ?auto_2502 ) ( AVAILABLE ?auto_2505 ) ( SURFACE-AT ?auto_2485 ?auto_2502 ) ( ON ?auto_2485 ?auto_2501 ) ( CLEAR ?auto_2485 ) ( not ( = ?auto_2484 ?auto_2485 ) ) ( not ( = ?auto_2484 ?auto_2501 ) ) ( not ( = ?auto_2485 ?auto_2501 ) ) ( not ( = ?auto_2493 ?auto_2505 ) ) ( SURFACE-AT ?auto_2483 ?auto_2490 ) ( CLEAR ?auto_2483 ) ( IS-CRATE ?auto_2484 ) ( AVAILABLE ?auto_2493 ) ( AVAILABLE ?auto_2496 ) ( SURFACE-AT ?auto_2484 ?auto_2503 ) ( ON ?auto_2484 ?auto_2504 ) ( CLEAR ?auto_2484 ) ( TRUCK-AT ?auto_2494 ?auto_2490 ) ( not ( = ?auto_2483 ?auto_2484 ) ) ( not ( = ?auto_2483 ?auto_2504 ) ) ( not ( = ?auto_2484 ?auto_2504 ) ) ( not ( = ?auto_2483 ?auto_2485 ) ) ( not ( = ?auto_2483 ?auto_2501 ) ) ( not ( = ?auto_2485 ?auto_2504 ) ) ( not ( = ?auto_2502 ?auto_2503 ) ) ( not ( = ?auto_2505 ?auto_2496 ) ) ( not ( = ?auto_2501 ?auto_2504 ) ) ( not ( = ?auto_2483 ?auto_2486 ) ) ( not ( = ?auto_2483 ?auto_2506 ) ) ( not ( = ?auto_2484 ?auto_2486 ) ) ( not ( = ?auto_2484 ?auto_2506 ) ) ( not ( = ?auto_2486 ?auto_2501 ) ) ( not ( = ?auto_2486 ?auto_2504 ) ) ( not ( = ?auto_2506 ?auto_2501 ) ) ( not ( = ?auto_2506 ?auto_2504 ) ) ( not ( = ?auto_2483 ?auto_2487 ) ) ( not ( = ?auto_2483 ?auto_2498 ) ) ( not ( = ?auto_2484 ?auto_2487 ) ) ( not ( = ?auto_2484 ?auto_2498 ) ) ( not ( = ?auto_2485 ?auto_2487 ) ) ( not ( = ?auto_2485 ?auto_2498 ) ) ( not ( = ?auto_2487 ?auto_2506 ) ) ( not ( = ?auto_2487 ?auto_2501 ) ) ( not ( = ?auto_2487 ?auto_2504 ) ) ( not ( = ?auto_2500 ?auto_2503 ) ) ( not ( = ?auto_2500 ?auto_2502 ) ) ( not ( = ?auto_2497 ?auto_2496 ) ) ( not ( = ?auto_2497 ?auto_2505 ) ) ( not ( = ?auto_2498 ?auto_2506 ) ) ( not ( = ?auto_2498 ?auto_2501 ) ) ( not ( = ?auto_2498 ?auto_2504 ) ) ( not ( = ?auto_2483 ?auto_2489 ) ) ( not ( = ?auto_2483 ?auto_2499 ) ) ( not ( = ?auto_2484 ?auto_2489 ) ) ( not ( = ?auto_2484 ?auto_2499 ) ) ( not ( = ?auto_2485 ?auto_2489 ) ) ( not ( = ?auto_2485 ?auto_2499 ) ) ( not ( = ?auto_2486 ?auto_2489 ) ) ( not ( = ?auto_2486 ?auto_2499 ) ) ( not ( = ?auto_2489 ?auto_2498 ) ) ( not ( = ?auto_2489 ?auto_2506 ) ) ( not ( = ?auto_2489 ?auto_2501 ) ) ( not ( = ?auto_2489 ?auto_2504 ) ) ( not ( = ?auto_2492 ?auto_2500 ) ) ( not ( = ?auto_2492 ?auto_2503 ) ) ( not ( = ?auto_2492 ?auto_2502 ) ) ( not ( = ?auto_2491 ?auto_2497 ) ) ( not ( = ?auto_2491 ?auto_2496 ) ) ( not ( = ?auto_2491 ?auto_2505 ) ) ( not ( = ?auto_2499 ?auto_2498 ) ) ( not ( = ?auto_2499 ?auto_2506 ) ) ( not ( = ?auto_2499 ?auto_2501 ) ) ( not ( = ?auto_2499 ?auto_2504 ) ) ( not ( = ?auto_2483 ?auto_2488 ) ) ( not ( = ?auto_2483 ?auto_2495 ) ) ( not ( = ?auto_2484 ?auto_2488 ) ) ( not ( = ?auto_2484 ?auto_2495 ) ) ( not ( = ?auto_2485 ?auto_2488 ) ) ( not ( = ?auto_2485 ?auto_2495 ) ) ( not ( = ?auto_2486 ?auto_2488 ) ) ( not ( = ?auto_2486 ?auto_2495 ) ) ( not ( = ?auto_2487 ?auto_2488 ) ) ( not ( = ?auto_2487 ?auto_2495 ) ) ( not ( = ?auto_2488 ?auto_2499 ) ) ( not ( = ?auto_2488 ?auto_2498 ) ) ( not ( = ?auto_2488 ?auto_2506 ) ) ( not ( = ?auto_2488 ?auto_2501 ) ) ( not ( = ?auto_2488 ?auto_2504 ) ) ( not ( = ?auto_2495 ?auto_2499 ) ) ( not ( = ?auto_2495 ?auto_2498 ) ) ( not ( = ?auto_2495 ?auto_2506 ) ) ( not ( = ?auto_2495 ?auto_2501 ) ) ( not ( = ?auto_2495 ?auto_2504 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_2483 ?auto_2484 ?auto_2485 ?auto_2486 ?auto_2487 ?auto_2489 )
      ( MAKE-1CRATE ?auto_2489 ?auto_2488 )
      ( MAKE-6CRATE-VERIFY ?auto_2483 ?auto_2484 ?auto_2485 ?auto_2486 ?auto_2487 ?auto_2489 ?auto_2488 ) )
  )

)

