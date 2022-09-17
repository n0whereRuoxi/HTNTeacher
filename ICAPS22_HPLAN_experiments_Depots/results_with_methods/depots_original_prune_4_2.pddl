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
      ?auto_2310 - SURFACE
      ?auto_2311 - SURFACE
    )
    :vars
    (
      ?auto_2312 - HOIST
      ?auto_2313 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2312 ?auto_2313 ) ( SURFACE-AT ?auto_2311 ?auto_2313 ) ( CLEAR ?auto_2311 ) ( LIFTING ?auto_2312 ?auto_2310 ) ( IS-CRATE ?auto_2310 ) ( not ( = ?auto_2310 ?auto_2311 ) ) )
    :subtasks
    ( ( !DROP ?auto_2312 ?auto_2310 ?auto_2311 ?auto_2313 )
      ( MAKE-ON-VERIFY ?auto_2310 ?auto_2311 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2314 - SURFACE
      ?auto_2315 - SURFACE
    )
    :vars
    (
      ?auto_2317 - HOIST
      ?auto_2316 - PLACE
      ?auto_2318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2317 ?auto_2316 ) ( SURFACE-AT ?auto_2315 ?auto_2316 ) ( CLEAR ?auto_2315 ) ( IS-CRATE ?auto_2314 ) ( not ( = ?auto_2314 ?auto_2315 ) ) ( TRUCK-AT ?auto_2318 ?auto_2316 ) ( AVAILABLE ?auto_2317 ) ( IN ?auto_2314 ?auto_2318 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2317 ?auto_2314 ?auto_2318 ?auto_2316 )
      ( MAKE-ON ?auto_2314 ?auto_2315 )
      ( MAKE-ON-VERIFY ?auto_2314 ?auto_2315 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2319 - SURFACE
      ?auto_2320 - SURFACE
    )
    :vars
    (
      ?auto_2321 - HOIST
      ?auto_2322 - PLACE
      ?auto_2323 - TRUCK
      ?auto_2324 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2321 ?auto_2322 ) ( SURFACE-AT ?auto_2320 ?auto_2322 ) ( CLEAR ?auto_2320 ) ( IS-CRATE ?auto_2319 ) ( not ( = ?auto_2319 ?auto_2320 ) ) ( AVAILABLE ?auto_2321 ) ( IN ?auto_2319 ?auto_2323 ) ( TRUCK-AT ?auto_2323 ?auto_2324 ) ( not ( = ?auto_2324 ?auto_2322 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2323 ?auto_2324 ?auto_2322 )
      ( MAKE-ON ?auto_2319 ?auto_2320 )
      ( MAKE-ON-VERIFY ?auto_2319 ?auto_2320 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2325 - SURFACE
      ?auto_2326 - SURFACE
    )
    :vars
    (
      ?auto_2330 - HOIST
      ?auto_2328 - PLACE
      ?auto_2329 - TRUCK
      ?auto_2327 - PLACE
      ?auto_2331 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2330 ?auto_2328 ) ( SURFACE-AT ?auto_2326 ?auto_2328 ) ( CLEAR ?auto_2326 ) ( IS-CRATE ?auto_2325 ) ( not ( = ?auto_2325 ?auto_2326 ) ) ( AVAILABLE ?auto_2330 ) ( TRUCK-AT ?auto_2329 ?auto_2327 ) ( not ( = ?auto_2327 ?auto_2328 ) ) ( HOIST-AT ?auto_2331 ?auto_2327 ) ( LIFTING ?auto_2331 ?auto_2325 ) ( not ( = ?auto_2330 ?auto_2331 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2331 ?auto_2325 ?auto_2329 ?auto_2327 )
      ( MAKE-ON ?auto_2325 ?auto_2326 )
      ( MAKE-ON-VERIFY ?auto_2325 ?auto_2326 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2332 - SURFACE
      ?auto_2333 - SURFACE
    )
    :vars
    (
      ?auto_2338 - HOIST
      ?auto_2335 - PLACE
      ?auto_2334 - TRUCK
      ?auto_2337 - PLACE
      ?auto_2336 - HOIST
      ?auto_2339 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2338 ?auto_2335 ) ( SURFACE-AT ?auto_2333 ?auto_2335 ) ( CLEAR ?auto_2333 ) ( IS-CRATE ?auto_2332 ) ( not ( = ?auto_2332 ?auto_2333 ) ) ( AVAILABLE ?auto_2338 ) ( TRUCK-AT ?auto_2334 ?auto_2337 ) ( not ( = ?auto_2337 ?auto_2335 ) ) ( HOIST-AT ?auto_2336 ?auto_2337 ) ( not ( = ?auto_2338 ?auto_2336 ) ) ( AVAILABLE ?auto_2336 ) ( SURFACE-AT ?auto_2332 ?auto_2337 ) ( ON ?auto_2332 ?auto_2339 ) ( CLEAR ?auto_2332 ) ( not ( = ?auto_2332 ?auto_2339 ) ) ( not ( = ?auto_2333 ?auto_2339 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2336 ?auto_2332 ?auto_2339 ?auto_2337 )
      ( MAKE-ON ?auto_2332 ?auto_2333 )
      ( MAKE-ON-VERIFY ?auto_2332 ?auto_2333 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2340 - SURFACE
      ?auto_2341 - SURFACE
    )
    :vars
    (
      ?auto_2342 - HOIST
      ?auto_2345 - PLACE
      ?auto_2347 - PLACE
      ?auto_2346 - HOIST
      ?auto_2343 - SURFACE
      ?auto_2344 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2342 ?auto_2345 ) ( SURFACE-AT ?auto_2341 ?auto_2345 ) ( CLEAR ?auto_2341 ) ( IS-CRATE ?auto_2340 ) ( not ( = ?auto_2340 ?auto_2341 ) ) ( AVAILABLE ?auto_2342 ) ( not ( = ?auto_2347 ?auto_2345 ) ) ( HOIST-AT ?auto_2346 ?auto_2347 ) ( not ( = ?auto_2342 ?auto_2346 ) ) ( AVAILABLE ?auto_2346 ) ( SURFACE-AT ?auto_2340 ?auto_2347 ) ( ON ?auto_2340 ?auto_2343 ) ( CLEAR ?auto_2340 ) ( not ( = ?auto_2340 ?auto_2343 ) ) ( not ( = ?auto_2341 ?auto_2343 ) ) ( TRUCK-AT ?auto_2344 ?auto_2345 ) )
    :subtasks
    ( ( !DRIVE ?auto_2344 ?auto_2345 ?auto_2347 )
      ( MAKE-ON ?auto_2340 ?auto_2341 )
      ( MAKE-ON-VERIFY ?auto_2340 ?auto_2341 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2388 - SURFACE
      ?auto_2389 - SURFACE
    )
    :vars
    (
      ?auto_2394 - HOIST
      ?auto_2395 - PLACE
      ?auto_2391 - PLACE
      ?auto_2392 - HOIST
      ?auto_2393 - SURFACE
      ?auto_2390 - TRUCK
      ?auto_2396 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2394 ?auto_2395 ) ( IS-CRATE ?auto_2388 ) ( not ( = ?auto_2388 ?auto_2389 ) ) ( not ( = ?auto_2391 ?auto_2395 ) ) ( HOIST-AT ?auto_2392 ?auto_2391 ) ( not ( = ?auto_2394 ?auto_2392 ) ) ( AVAILABLE ?auto_2392 ) ( SURFACE-AT ?auto_2388 ?auto_2391 ) ( ON ?auto_2388 ?auto_2393 ) ( CLEAR ?auto_2388 ) ( not ( = ?auto_2388 ?auto_2393 ) ) ( not ( = ?auto_2389 ?auto_2393 ) ) ( TRUCK-AT ?auto_2390 ?auto_2395 ) ( SURFACE-AT ?auto_2396 ?auto_2395 ) ( CLEAR ?auto_2396 ) ( LIFTING ?auto_2394 ?auto_2389 ) ( IS-CRATE ?auto_2389 ) ( not ( = ?auto_2388 ?auto_2396 ) ) ( not ( = ?auto_2389 ?auto_2396 ) ) ( not ( = ?auto_2393 ?auto_2396 ) ) )
    :subtasks
    ( ( !DROP ?auto_2394 ?auto_2389 ?auto_2396 ?auto_2395 )
      ( MAKE-ON ?auto_2388 ?auto_2389 )
      ( MAKE-ON-VERIFY ?auto_2388 ?auto_2389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2397 - SURFACE
      ?auto_2398 - SURFACE
    )
    :vars
    (
      ?auto_2401 - HOIST
      ?auto_2404 - PLACE
      ?auto_2400 - PLACE
      ?auto_2399 - HOIST
      ?auto_2403 - SURFACE
      ?auto_2405 - TRUCK
      ?auto_2402 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2401 ?auto_2404 ) ( IS-CRATE ?auto_2397 ) ( not ( = ?auto_2397 ?auto_2398 ) ) ( not ( = ?auto_2400 ?auto_2404 ) ) ( HOIST-AT ?auto_2399 ?auto_2400 ) ( not ( = ?auto_2401 ?auto_2399 ) ) ( AVAILABLE ?auto_2399 ) ( SURFACE-AT ?auto_2397 ?auto_2400 ) ( ON ?auto_2397 ?auto_2403 ) ( CLEAR ?auto_2397 ) ( not ( = ?auto_2397 ?auto_2403 ) ) ( not ( = ?auto_2398 ?auto_2403 ) ) ( TRUCK-AT ?auto_2405 ?auto_2404 ) ( SURFACE-AT ?auto_2402 ?auto_2404 ) ( CLEAR ?auto_2402 ) ( IS-CRATE ?auto_2398 ) ( not ( = ?auto_2397 ?auto_2402 ) ) ( not ( = ?auto_2398 ?auto_2402 ) ) ( not ( = ?auto_2403 ?auto_2402 ) ) ( AVAILABLE ?auto_2401 ) ( IN ?auto_2398 ?auto_2405 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2401 ?auto_2398 ?auto_2405 ?auto_2404 )
      ( MAKE-ON ?auto_2397 ?auto_2398 )
      ( MAKE-ON-VERIFY ?auto_2397 ?auto_2398 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2406 - SURFACE
      ?auto_2407 - SURFACE
    )
    :vars
    (
      ?auto_2412 - HOIST
      ?auto_2410 - PLACE
      ?auto_2408 - PLACE
      ?auto_2409 - HOIST
      ?auto_2413 - SURFACE
      ?auto_2411 - SURFACE
      ?auto_2414 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2412 ?auto_2410 ) ( IS-CRATE ?auto_2406 ) ( not ( = ?auto_2406 ?auto_2407 ) ) ( not ( = ?auto_2408 ?auto_2410 ) ) ( HOIST-AT ?auto_2409 ?auto_2408 ) ( not ( = ?auto_2412 ?auto_2409 ) ) ( AVAILABLE ?auto_2409 ) ( SURFACE-AT ?auto_2406 ?auto_2408 ) ( ON ?auto_2406 ?auto_2413 ) ( CLEAR ?auto_2406 ) ( not ( = ?auto_2406 ?auto_2413 ) ) ( not ( = ?auto_2407 ?auto_2413 ) ) ( SURFACE-AT ?auto_2411 ?auto_2410 ) ( CLEAR ?auto_2411 ) ( IS-CRATE ?auto_2407 ) ( not ( = ?auto_2406 ?auto_2411 ) ) ( not ( = ?auto_2407 ?auto_2411 ) ) ( not ( = ?auto_2413 ?auto_2411 ) ) ( AVAILABLE ?auto_2412 ) ( IN ?auto_2407 ?auto_2414 ) ( TRUCK-AT ?auto_2414 ?auto_2408 ) )
    :subtasks
    ( ( !DRIVE ?auto_2414 ?auto_2408 ?auto_2410 )
      ( MAKE-ON ?auto_2406 ?auto_2407 )
      ( MAKE-ON-VERIFY ?auto_2406 ?auto_2407 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2415 - SURFACE
      ?auto_2416 - SURFACE
    )
    :vars
    (
      ?auto_2418 - HOIST
      ?auto_2420 - PLACE
      ?auto_2423 - PLACE
      ?auto_2417 - HOIST
      ?auto_2421 - SURFACE
      ?auto_2419 - SURFACE
      ?auto_2422 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2418 ?auto_2420 ) ( IS-CRATE ?auto_2415 ) ( not ( = ?auto_2415 ?auto_2416 ) ) ( not ( = ?auto_2423 ?auto_2420 ) ) ( HOIST-AT ?auto_2417 ?auto_2423 ) ( not ( = ?auto_2418 ?auto_2417 ) ) ( SURFACE-AT ?auto_2415 ?auto_2423 ) ( ON ?auto_2415 ?auto_2421 ) ( CLEAR ?auto_2415 ) ( not ( = ?auto_2415 ?auto_2421 ) ) ( not ( = ?auto_2416 ?auto_2421 ) ) ( SURFACE-AT ?auto_2419 ?auto_2420 ) ( CLEAR ?auto_2419 ) ( IS-CRATE ?auto_2416 ) ( not ( = ?auto_2415 ?auto_2419 ) ) ( not ( = ?auto_2416 ?auto_2419 ) ) ( not ( = ?auto_2421 ?auto_2419 ) ) ( AVAILABLE ?auto_2418 ) ( TRUCK-AT ?auto_2422 ?auto_2423 ) ( LIFTING ?auto_2417 ?auto_2416 ) )
    :subtasks
    ( ( !LOAD ?auto_2417 ?auto_2416 ?auto_2422 ?auto_2423 )
      ( MAKE-ON ?auto_2415 ?auto_2416 )
      ( MAKE-ON-VERIFY ?auto_2415 ?auto_2416 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2424 - SURFACE
      ?auto_2425 - SURFACE
    )
    :vars
    (
      ?auto_2426 - HOIST
      ?auto_2431 - PLACE
      ?auto_2427 - PLACE
      ?auto_2432 - HOIST
      ?auto_2430 - SURFACE
      ?auto_2429 - SURFACE
      ?auto_2428 - TRUCK
      ?auto_2433 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2426 ?auto_2431 ) ( IS-CRATE ?auto_2424 ) ( not ( = ?auto_2424 ?auto_2425 ) ) ( not ( = ?auto_2427 ?auto_2431 ) ) ( HOIST-AT ?auto_2432 ?auto_2427 ) ( not ( = ?auto_2426 ?auto_2432 ) ) ( SURFACE-AT ?auto_2424 ?auto_2427 ) ( ON ?auto_2424 ?auto_2430 ) ( CLEAR ?auto_2424 ) ( not ( = ?auto_2424 ?auto_2430 ) ) ( not ( = ?auto_2425 ?auto_2430 ) ) ( SURFACE-AT ?auto_2429 ?auto_2431 ) ( CLEAR ?auto_2429 ) ( IS-CRATE ?auto_2425 ) ( not ( = ?auto_2424 ?auto_2429 ) ) ( not ( = ?auto_2425 ?auto_2429 ) ) ( not ( = ?auto_2430 ?auto_2429 ) ) ( AVAILABLE ?auto_2426 ) ( TRUCK-AT ?auto_2428 ?auto_2427 ) ( AVAILABLE ?auto_2432 ) ( SURFACE-AT ?auto_2425 ?auto_2427 ) ( ON ?auto_2425 ?auto_2433 ) ( CLEAR ?auto_2425 ) ( not ( = ?auto_2424 ?auto_2433 ) ) ( not ( = ?auto_2425 ?auto_2433 ) ) ( not ( = ?auto_2430 ?auto_2433 ) ) ( not ( = ?auto_2429 ?auto_2433 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2432 ?auto_2425 ?auto_2433 ?auto_2427 )
      ( MAKE-ON ?auto_2424 ?auto_2425 )
      ( MAKE-ON-VERIFY ?auto_2424 ?auto_2425 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2434 - SURFACE
      ?auto_2435 - SURFACE
    )
    :vars
    (
      ?auto_2442 - HOIST
      ?auto_2438 - PLACE
      ?auto_2443 - PLACE
      ?auto_2439 - HOIST
      ?auto_2436 - SURFACE
      ?auto_2440 - SURFACE
      ?auto_2441 - SURFACE
      ?auto_2437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2442 ?auto_2438 ) ( IS-CRATE ?auto_2434 ) ( not ( = ?auto_2434 ?auto_2435 ) ) ( not ( = ?auto_2443 ?auto_2438 ) ) ( HOIST-AT ?auto_2439 ?auto_2443 ) ( not ( = ?auto_2442 ?auto_2439 ) ) ( SURFACE-AT ?auto_2434 ?auto_2443 ) ( ON ?auto_2434 ?auto_2436 ) ( CLEAR ?auto_2434 ) ( not ( = ?auto_2434 ?auto_2436 ) ) ( not ( = ?auto_2435 ?auto_2436 ) ) ( SURFACE-AT ?auto_2440 ?auto_2438 ) ( CLEAR ?auto_2440 ) ( IS-CRATE ?auto_2435 ) ( not ( = ?auto_2434 ?auto_2440 ) ) ( not ( = ?auto_2435 ?auto_2440 ) ) ( not ( = ?auto_2436 ?auto_2440 ) ) ( AVAILABLE ?auto_2442 ) ( AVAILABLE ?auto_2439 ) ( SURFACE-AT ?auto_2435 ?auto_2443 ) ( ON ?auto_2435 ?auto_2441 ) ( CLEAR ?auto_2435 ) ( not ( = ?auto_2434 ?auto_2441 ) ) ( not ( = ?auto_2435 ?auto_2441 ) ) ( not ( = ?auto_2436 ?auto_2441 ) ) ( not ( = ?auto_2440 ?auto_2441 ) ) ( TRUCK-AT ?auto_2437 ?auto_2438 ) )
    :subtasks
    ( ( !DRIVE ?auto_2437 ?auto_2438 ?auto_2443 )
      ( MAKE-ON ?auto_2434 ?auto_2435 )
      ( MAKE-ON-VERIFY ?auto_2434 ?auto_2435 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2508 - SURFACE
      ?auto_2509 - SURFACE
    )
    :vars
    (
      ?auto_2514 - HOIST
      ?auto_2511 - PLACE
      ?auto_2510 - PLACE
      ?auto_2513 - HOIST
      ?auto_2512 - SURFACE
      ?auto_2515 - TRUCK
      ?auto_2516 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2514 ?auto_2511 ) ( SURFACE-AT ?auto_2509 ?auto_2511 ) ( CLEAR ?auto_2509 ) ( IS-CRATE ?auto_2508 ) ( not ( = ?auto_2508 ?auto_2509 ) ) ( AVAILABLE ?auto_2514 ) ( not ( = ?auto_2510 ?auto_2511 ) ) ( HOIST-AT ?auto_2513 ?auto_2510 ) ( not ( = ?auto_2514 ?auto_2513 ) ) ( AVAILABLE ?auto_2513 ) ( SURFACE-AT ?auto_2508 ?auto_2510 ) ( ON ?auto_2508 ?auto_2512 ) ( CLEAR ?auto_2508 ) ( not ( = ?auto_2508 ?auto_2512 ) ) ( not ( = ?auto_2509 ?auto_2512 ) ) ( TRUCK-AT ?auto_2515 ?auto_2516 ) ( not ( = ?auto_2516 ?auto_2511 ) ) ( not ( = ?auto_2510 ?auto_2516 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2515 ?auto_2516 ?auto_2511 )
      ( MAKE-ON ?auto_2508 ?auto_2509 )
      ( MAKE-ON-VERIFY ?auto_2508 ?auto_2509 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2523 - SURFACE
      ?auto_2524 - SURFACE
    )
    :vars
    (
      ?auto_2529 - HOIST
      ?auto_2526 - PLACE
      ?auto_2527 - PLACE
      ?auto_2530 - HOIST
      ?auto_2528 - SURFACE
      ?auto_2525 - TRUCK
      ?auto_2531 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2529 ?auto_2526 ) ( SURFACE-AT ?auto_2524 ?auto_2526 ) ( CLEAR ?auto_2524 ) ( IS-CRATE ?auto_2523 ) ( not ( = ?auto_2523 ?auto_2524 ) ) ( not ( = ?auto_2527 ?auto_2526 ) ) ( HOIST-AT ?auto_2530 ?auto_2527 ) ( not ( = ?auto_2529 ?auto_2530 ) ) ( AVAILABLE ?auto_2530 ) ( SURFACE-AT ?auto_2523 ?auto_2527 ) ( ON ?auto_2523 ?auto_2528 ) ( CLEAR ?auto_2523 ) ( not ( = ?auto_2523 ?auto_2528 ) ) ( not ( = ?auto_2524 ?auto_2528 ) ) ( TRUCK-AT ?auto_2525 ?auto_2526 ) ( LIFTING ?auto_2529 ?auto_2531 ) ( IS-CRATE ?auto_2531 ) ( not ( = ?auto_2523 ?auto_2531 ) ) ( not ( = ?auto_2524 ?auto_2531 ) ) ( not ( = ?auto_2528 ?auto_2531 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2529 ?auto_2531 ?auto_2525 ?auto_2526 )
      ( MAKE-ON ?auto_2523 ?auto_2524 )
      ( MAKE-ON-VERIFY ?auto_2523 ?auto_2524 ) )
  )

)

