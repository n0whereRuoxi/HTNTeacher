( define ( domain satellite )
  ( :requirements :strips :typing :equality :htn )
  ( :types direction instrument mode satellite )
  ( :predicates
    ( ON_BOARD ?i - INSTRUMENT ?s - SATELLITE )
    ( SUPPORTS ?i - INSTRUMENT ?m - MODE )
    ( POINTING ?s - SATELLITE ?d - DIRECTION )
    ( POWER_AVAIL ?s - SATELLITE )
    ( POWER_ON ?i - INSTRUMENT )
    ( CALIBRATED ?i - INSTRUMENT )
    ( NOT_CALIBRATED ?i - INSTRUMENT )
    ( HAVE_IMAGE ?d - DIRECTION ?m - MODE )
    ( CALIBRATION_TARGET ?i - INSTRUMENT ?d - DIRECTION )
  )
  ( :action !TURN_TO
    :parameters
    (
      ?s - SATELLITE
      ?d_new - DIRECTION
      ?d_prev - DIRECTION
    )
    :precondition
    ( and ( POINTING ?s ?d_prev ) ( not ( = ?d_new ?d_prev ) ) )
    :effect
    ( and ( POINTING ?s ?d_new ) ( not ( POINTING ?s ?d_prev ) ) )
  )
  ( :action !SWITCH_ON
    :parameters
    (
      ?i - INSTRUMENT
      ?s - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( POWER_AVAIL ?s ) )
    :effect
    ( and ( POWER_ON ?i ) ( NOT_CALIBRATED ?i ) ( not ( CALIBRATED ?i ) ) ( not ( POWER_AVAIL ?s ) ) )
  )
  ( :action !SWITCH_OFF
    :parameters
    (
      ?i - INSTRUMENT
      ?s - SATELLITE
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( POWER_ON ?i ) )
    :effect
    ( and ( POWER_AVAIL ?s ) ( not ( POWER_ON ?i ) ) )
  )
  ( :action !CALIBRATE
    :parameters
    (
      ?s - SATELLITE
      ?i - INSTRUMENT
      ?d - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?i ?s ) ( CALIBRATION_TARGET ?i ?d ) ( POINTING ?s ?d ) ( POWER_ON ?i ) ( NOT_CALIBRATED ?i ) )
    :effect
    ( and ( CALIBRATED ?i ) ( not ( NOT_CALIBRATED ?i ) ) )
  )
  ( :action !TAKE_IMAGE
    :parameters
    (
      ?s - SATELLITE
      ?d - DIRECTION
      ?i - INSTRUMENT
      ?m - MODE
    )
    :precondition
    ( and ( CALIBRATED ?i ) ( ON_BOARD ?i ?s ) ( SUPPORTS ?i ?m ) ( POWER_ON ?i ) ( POINTING ?s ?d ) ( POWER_ON ?i ) )
    :effect
    ( and ( HAVE_IMAGE ?d ?m ) )
  )
  ( :method GET_IMAGE
    :parameters
    (
      ?goal_dir - DIRECTION
      ?goal_mode - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir ?goal_mode ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) )
    :subtasks
    (  )
  )

  ( :method GET-2IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
      ?goal_dir2 - DIRECTION
      ?goal_mode2 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) )
    :subtasks
    (  )
  )

  ( :method GET-3IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
      ?goal_dir2 - DIRECTION
      ?goal_mode2 - MODE
      ?goal_dir3 - DIRECTION
      ?goal_mode3 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) ( HAVE_IMAGE ?goal_dir3 ?goal_mode3 ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2172 - DIRECTION
      ?auto_2173 - MODE
    )
    :vars
    (
      ?auto_2174 - INSTRUMENT
      ?auto_2175 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_2174 ) ( ON_BOARD ?auto_2174 ?auto_2175 ) ( SUPPORTS ?auto_2174 ?auto_2173 ) ( POWER_ON ?auto_2174 ) ( POINTING ?auto_2175 ?auto_2172 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_2175 ?auto_2172 ?auto_2174 ?auto_2173 )
      ( GET-1IMAGE-VERIFY ?auto_2172 ?auto_2173 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2190 - DIRECTION
      ?auto_2191 - MODE
    )
    :vars
    (
      ?auto_2193 - INSTRUMENT
      ?auto_2192 - SATELLITE
      ?auto_2194 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_2193 ) ( ON_BOARD ?auto_2193 ?auto_2192 ) ( SUPPORTS ?auto_2193 ?auto_2191 ) ( POWER_ON ?auto_2193 ) ( POINTING ?auto_2192 ?auto_2194 ) ( not ( = ?auto_2190 ?auto_2194 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_2192 ?auto_2190 ?auto_2194 )
      ( GET-1IMAGE ?auto_2190 ?auto_2191 )
      ( GET-1IMAGE-VERIFY ?auto_2190 ?auto_2191 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2211 - DIRECTION
      ?auto_2212 - MODE
    )
    :vars
    (
      ?auto_2214 - INSTRUMENT
      ?auto_2215 - SATELLITE
      ?auto_2213 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2214 ?auto_2215 ) ( SUPPORTS ?auto_2214 ?auto_2212 ) ( POWER_ON ?auto_2214 ) ( POINTING ?auto_2215 ?auto_2213 ) ( not ( = ?auto_2211 ?auto_2213 ) ) ( CALIBRATION_TARGET ?auto_2214 ?auto_2213 ) ( NOT_CALIBRATED ?auto_2214 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_2215 ?auto_2214 ?auto_2213 )
      ( GET-1IMAGE ?auto_2211 ?auto_2212 )
      ( GET-1IMAGE-VERIFY ?auto_2211 ?auto_2212 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2232 - DIRECTION
      ?auto_2233 - MODE
    )
    :vars
    (
      ?auto_2235 - INSTRUMENT
      ?auto_2234 - SATELLITE
      ?auto_2236 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2235 ?auto_2234 ) ( SUPPORTS ?auto_2235 ?auto_2233 ) ( POINTING ?auto_2234 ?auto_2236 ) ( not ( = ?auto_2232 ?auto_2236 ) ) ( CALIBRATION_TARGET ?auto_2235 ?auto_2236 ) ( POWER_AVAIL ?auto_2234 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_2235 ?auto_2234 )
      ( GET-1IMAGE ?auto_2232 ?auto_2233 )
      ( GET-1IMAGE-VERIFY ?auto_2232 ?auto_2233 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2253 - DIRECTION
      ?auto_2254 - MODE
    )
    :vars
    (
      ?auto_2256 - INSTRUMENT
      ?auto_2255 - SATELLITE
      ?auto_2257 - DIRECTION
      ?auto_2258 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2256 ?auto_2255 ) ( SUPPORTS ?auto_2256 ?auto_2254 ) ( not ( = ?auto_2253 ?auto_2257 ) ) ( CALIBRATION_TARGET ?auto_2256 ?auto_2257 ) ( POWER_AVAIL ?auto_2255 ) ( POINTING ?auto_2255 ?auto_2258 ) ( not ( = ?auto_2257 ?auto_2258 ) ) ( not ( = ?auto_2253 ?auto_2258 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_2255 ?auto_2257 ?auto_2258 )
      ( GET-1IMAGE ?auto_2253 ?auto_2254 )
      ( GET-1IMAGE-VERIFY ?auto_2253 ?auto_2254 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2338 - DIRECTION
      ?auto_2339 - MODE
      ?auto_2340 - DIRECTION
      ?auto_2337 - MODE
    )
    :vars
    (
      ?auto_2342 - INSTRUMENT
      ?auto_2341 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_2342 ) ( ON_BOARD ?auto_2342 ?auto_2341 ) ( SUPPORTS ?auto_2342 ?auto_2337 ) ( POWER_ON ?auto_2342 ) ( POINTING ?auto_2341 ?auto_2340 ) ( HAVE_IMAGE ?auto_2338 ?auto_2339 ) ( not ( = ?auto_2338 ?auto_2340 ) ) ( not ( = ?auto_2339 ?auto_2337 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2340 ?auto_2337 )
      ( GET-2IMAGE-VERIFY ?auto_2338 ?auto_2339 ?auto_2340 ?auto_2337 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2344 - DIRECTION
      ?auto_2345 - MODE
      ?auto_2346 - DIRECTION
      ?auto_2343 - MODE
    )
    :vars
    (
      ?auto_2348 - INSTRUMENT
      ?auto_2347 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_2348 ) ( ON_BOARD ?auto_2348 ?auto_2347 ) ( SUPPORTS ?auto_2348 ?auto_2345 ) ( POWER_ON ?auto_2348 ) ( POINTING ?auto_2347 ?auto_2344 ) ( HAVE_IMAGE ?auto_2346 ?auto_2343 ) ( not ( = ?auto_2344 ?auto_2346 ) ) ( not ( = ?auto_2345 ?auto_2343 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2344 ?auto_2345 )
      ( GET-2IMAGE-VERIFY ?auto_2344 ?auto_2345 ?auto_2346 ?auto_2343 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2356 - DIRECTION
      ?auto_2357 - MODE
      ?auto_2358 - DIRECTION
      ?auto_2355 - MODE
      ?auto_2359 - DIRECTION
      ?auto_2360 - MODE
    )
    :vars
    (
      ?auto_2362 - INSTRUMENT
      ?auto_2361 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_2362 ) ( ON_BOARD ?auto_2362 ?auto_2361 ) ( SUPPORTS ?auto_2362 ?auto_2360 ) ( POWER_ON ?auto_2362 ) ( POINTING ?auto_2361 ?auto_2359 ) ( HAVE_IMAGE ?auto_2356 ?auto_2357 ) ( HAVE_IMAGE ?auto_2358 ?auto_2355 ) ( not ( = ?auto_2356 ?auto_2358 ) ) ( not ( = ?auto_2356 ?auto_2359 ) ) ( not ( = ?auto_2357 ?auto_2355 ) ) ( not ( = ?auto_2357 ?auto_2360 ) ) ( not ( = ?auto_2358 ?auto_2359 ) ) ( not ( = ?auto_2355 ?auto_2360 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2359 ?auto_2360 )
      ( GET-3IMAGE-VERIFY ?auto_2356 ?auto_2357 ?auto_2358 ?auto_2355 ?auto_2359 ?auto_2360 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2364 - DIRECTION
      ?auto_2365 - MODE
      ?auto_2366 - DIRECTION
      ?auto_2363 - MODE
      ?auto_2367 - DIRECTION
      ?auto_2368 - MODE
    )
    :vars
    (
      ?auto_2370 - INSTRUMENT
      ?auto_2369 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_2370 ) ( ON_BOARD ?auto_2370 ?auto_2369 ) ( SUPPORTS ?auto_2370 ?auto_2363 ) ( POWER_ON ?auto_2370 ) ( POINTING ?auto_2369 ?auto_2366 ) ( HAVE_IMAGE ?auto_2364 ?auto_2365 ) ( HAVE_IMAGE ?auto_2367 ?auto_2368 ) ( not ( = ?auto_2364 ?auto_2366 ) ) ( not ( = ?auto_2364 ?auto_2367 ) ) ( not ( = ?auto_2365 ?auto_2363 ) ) ( not ( = ?auto_2365 ?auto_2368 ) ) ( not ( = ?auto_2366 ?auto_2367 ) ) ( not ( = ?auto_2363 ?auto_2368 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2366 ?auto_2363 )
      ( GET-3IMAGE-VERIFY ?auto_2364 ?auto_2365 ?auto_2366 ?auto_2363 ?auto_2367 ?auto_2368 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2380 - DIRECTION
      ?auto_2381 - MODE
      ?auto_2382 - DIRECTION
      ?auto_2379 - MODE
      ?auto_2383 - DIRECTION
      ?auto_2384 - MODE
    )
    :vars
    (
      ?auto_2386 - INSTRUMENT
      ?auto_2385 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_2386 ) ( ON_BOARD ?auto_2386 ?auto_2385 ) ( SUPPORTS ?auto_2386 ?auto_2381 ) ( POWER_ON ?auto_2386 ) ( POINTING ?auto_2385 ?auto_2380 ) ( HAVE_IMAGE ?auto_2382 ?auto_2379 ) ( HAVE_IMAGE ?auto_2383 ?auto_2384 ) ( not ( = ?auto_2380 ?auto_2382 ) ) ( not ( = ?auto_2380 ?auto_2383 ) ) ( not ( = ?auto_2381 ?auto_2379 ) ) ( not ( = ?auto_2381 ?auto_2384 ) ) ( not ( = ?auto_2382 ?auto_2383 ) ) ( not ( = ?auto_2379 ?auto_2384 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2380 ?auto_2381 )
      ( GET-3IMAGE-VERIFY ?auto_2380 ?auto_2381 ?auto_2382 ?auto_2379 ?auto_2383 ?auto_2384 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2417 - DIRECTION
      ?auto_2418 - MODE
      ?auto_2419 - DIRECTION
      ?auto_2416 - MODE
    )
    :vars
    (
      ?auto_2421 - INSTRUMENT
      ?auto_2422 - SATELLITE
      ?auto_2420 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_2421 ) ( ON_BOARD ?auto_2421 ?auto_2422 ) ( SUPPORTS ?auto_2421 ?auto_2416 ) ( POWER_ON ?auto_2421 ) ( POINTING ?auto_2422 ?auto_2420 ) ( not ( = ?auto_2419 ?auto_2420 ) ) ( HAVE_IMAGE ?auto_2417 ?auto_2418 ) ( not ( = ?auto_2417 ?auto_2419 ) ) ( not ( = ?auto_2417 ?auto_2420 ) ) ( not ( = ?auto_2418 ?auto_2416 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2419 ?auto_2416 )
      ( GET-2IMAGE-VERIFY ?auto_2417 ?auto_2418 ?auto_2419 ?auto_2416 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2424 - DIRECTION
      ?auto_2425 - MODE
      ?auto_2426 - DIRECTION
      ?auto_2423 - MODE
    )
    :vars
    (
      ?auto_2428 - INSTRUMENT
      ?auto_2427 - SATELLITE
      ?auto_2429 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_2428 ) ( ON_BOARD ?auto_2428 ?auto_2427 ) ( SUPPORTS ?auto_2428 ?auto_2425 ) ( POWER_ON ?auto_2428 ) ( POINTING ?auto_2427 ?auto_2429 ) ( not ( = ?auto_2424 ?auto_2429 ) ) ( HAVE_IMAGE ?auto_2426 ?auto_2423 ) ( not ( = ?auto_2426 ?auto_2424 ) ) ( not ( = ?auto_2426 ?auto_2429 ) ) ( not ( = ?auto_2423 ?auto_2425 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2426 ?auto_2423 ?auto_2424 ?auto_2425 )
      ( GET-2IMAGE-VERIFY ?auto_2424 ?auto_2425 ?auto_2426 ?auto_2423 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2440 - DIRECTION
      ?auto_2441 - MODE
      ?auto_2442 - DIRECTION
      ?auto_2439 - MODE
      ?auto_2443 - DIRECTION
      ?auto_2444 - MODE
    )
    :vars
    (
      ?auto_2446 - INSTRUMENT
      ?auto_2445 - SATELLITE
      ?auto_2447 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_2446 ) ( ON_BOARD ?auto_2446 ?auto_2445 ) ( SUPPORTS ?auto_2446 ?auto_2444 ) ( POWER_ON ?auto_2446 ) ( POINTING ?auto_2445 ?auto_2447 ) ( not ( = ?auto_2443 ?auto_2447 ) ) ( HAVE_IMAGE ?auto_2442 ?auto_2441 ) ( not ( = ?auto_2442 ?auto_2443 ) ) ( not ( = ?auto_2442 ?auto_2447 ) ) ( not ( = ?auto_2441 ?auto_2444 ) ) ( HAVE_IMAGE ?auto_2440 ?auto_2441 ) ( HAVE_IMAGE ?auto_2442 ?auto_2439 ) ( not ( = ?auto_2440 ?auto_2442 ) ) ( not ( = ?auto_2440 ?auto_2443 ) ) ( not ( = ?auto_2440 ?auto_2447 ) ) ( not ( = ?auto_2441 ?auto_2439 ) ) ( not ( = ?auto_2439 ?auto_2444 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2442 ?auto_2441 ?auto_2443 ?auto_2444 )
      ( GET-3IMAGE-VERIFY ?auto_2440 ?auto_2441 ?auto_2442 ?auto_2439 ?auto_2443 ?auto_2444 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2449 - DIRECTION
      ?auto_2450 - MODE
      ?auto_2451 - DIRECTION
      ?auto_2448 - MODE
      ?auto_2452 - DIRECTION
      ?auto_2453 - MODE
    )
    :vars
    (
      ?auto_2455 - INSTRUMENT
      ?auto_2454 - SATELLITE
      ?auto_2456 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_2455 ) ( ON_BOARD ?auto_2455 ?auto_2454 ) ( SUPPORTS ?auto_2455 ?auto_2448 ) ( POWER_ON ?auto_2455 ) ( POINTING ?auto_2454 ?auto_2456 ) ( not ( = ?auto_2451 ?auto_2456 ) ) ( HAVE_IMAGE ?auto_2452 ?auto_2453 ) ( not ( = ?auto_2452 ?auto_2451 ) ) ( not ( = ?auto_2452 ?auto_2456 ) ) ( not ( = ?auto_2453 ?auto_2448 ) ) ( HAVE_IMAGE ?auto_2449 ?auto_2450 ) ( not ( = ?auto_2449 ?auto_2451 ) ) ( not ( = ?auto_2449 ?auto_2452 ) ) ( not ( = ?auto_2449 ?auto_2456 ) ) ( not ( = ?auto_2450 ?auto_2448 ) ) ( not ( = ?auto_2450 ?auto_2453 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2452 ?auto_2453 ?auto_2451 ?auto_2448 )
      ( GET-3IMAGE-VERIFY ?auto_2449 ?auto_2450 ?auto_2451 ?auto_2448 ?auto_2452 ?auto_2453 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2467 - DIRECTION
      ?auto_2468 - MODE
      ?auto_2469 - DIRECTION
      ?auto_2466 - MODE
      ?auto_2470 - DIRECTION
      ?auto_2471 - MODE
    )
    :vars
    (
      ?auto_2473 - INSTRUMENT
      ?auto_2472 - SATELLITE
      ?auto_2474 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_2473 ) ( ON_BOARD ?auto_2473 ?auto_2472 ) ( SUPPORTS ?auto_2473 ?auto_2468 ) ( POWER_ON ?auto_2473 ) ( POINTING ?auto_2472 ?auto_2474 ) ( not ( = ?auto_2467 ?auto_2474 ) ) ( HAVE_IMAGE ?auto_2470 ?auto_2466 ) ( not ( = ?auto_2470 ?auto_2467 ) ) ( not ( = ?auto_2470 ?auto_2474 ) ) ( not ( = ?auto_2466 ?auto_2468 ) ) ( HAVE_IMAGE ?auto_2469 ?auto_2466 ) ( HAVE_IMAGE ?auto_2470 ?auto_2471 ) ( not ( = ?auto_2467 ?auto_2469 ) ) ( not ( = ?auto_2468 ?auto_2471 ) ) ( not ( = ?auto_2469 ?auto_2470 ) ) ( not ( = ?auto_2469 ?auto_2474 ) ) ( not ( = ?auto_2466 ?auto_2471 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2470 ?auto_2466 ?auto_2467 ?auto_2468 )
      ( GET-3IMAGE-VERIFY ?auto_2467 ?auto_2468 ?auto_2469 ?auto_2466 ?auto_2470 ?auto_2471 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2504 - DIRECTION
      ?auto_2505 - MODE
    )
    :vars
    (
      ?auto_2507 - INSTRUMENT
      ?auto_2506 - SATELLITE
      ?auto_2508 - DIRECTION
      ?auto_2509 - DIRECTION
      ?auto_2510 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_2507 ?auto_2506 ) ( SUPPORTS ?auto_2507 ?auto_2505 ) ( POWER_ON ?auto_2507 ) ( POINTING ?auto_2506 ?auto_2508 ) ( not ( = ?auto_2504 ?auto_2508 ) ) ( HAVE_IMAGE ?auto_2509 ?auto_2510 ) ( not ( = ?auto_2509 ?auto_2504 ) ) ( not ( = ?auto_2509 ?auto_2508 ) ) ( not ( = ?auto_2510 ?auto_2505 ) ) ( CALIBRATION_TARGET ?auto_2507 ?auto_2508 ) ( NOT_CALIBRATED ?auto_2507 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_2506 ?auto_2507 ?auto_2508 )
      ( GET-2IMAGE ?auto_2509 ?auto_2510 ?auto_2504 ?auto_2505 )
      ( GET-1IMAGE-VERIFY ?auto_2504 ?auto_2505 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2512 - DIRECTION
      ?auto_2513 - MODE
      ?auto_2514 - DIRECTION
      ?auto_2511 - MODE
    )
    :vars
    (
      ?auto_2516 - INSTRUMENT
      ?auto_2515 - SATELLITE
      ?auto_2517 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2516 ?auto_2515 ) ( SUPPORTS ?auto_2516 ?auto_2511 ) ( POWER_ON ?auto_2516 ) ( POINTING ?auto_2515 ?auto_2517 ) ( not ( = ?auto_2514 ?auto_2517 ) ) ( HAVE_IMAGE ?auto_2512 ?auto_2513 ) ( not ( = ?auto_2512 ?auto_2514 ) ) ( not ( = ?auto_2512 ?auto_2517 ) ) ( not ( = ?auto_2513 ?auto_2511 ) ) ( CALIBRATION_TARGET ?auto_2516 ?auto_2517 ) ( NOT_CALIBRATED ?auto_2516 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2514 ?auto_2511 )
      ( GET-2IMAGE-VERIFY ?auto_2512 ?auto_2513 ?auto_2514 ?auto_2511 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2519 - DIRECTION
      ?auto_2520 - MODE
      ?auto_2521 - DIRECTION
      ?auto_2518 - MODE
    )
    :vars
    (
      ?auto_2523 - INSTRUMENT
      ?auto_2524 - SATELLITE
      ?auto_2522 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2523 ?auto_2524 ) ( SUPPORTS ?auto_2523 ?auto_2520 ) ( POWER_ON ?auto_2523 ) ( POINTING ?auto_2524 ?auto_2522 ) ( not ( = ?auto_2519 ?auto_2522 ) ) ( HAVE_IMAGE ?auto_2521 ?auto_2518 ) ( not ( = ?auto_2521 ?auto_2519 ) ) ( not ( = ?auto_2521 ?auto_2522 ) ) ( not ( = ?auto_2518 ?auto_2520 ) ) ( CALIBRATION_TARGET ?auto_2523 ?auto_2522 ) ( NOT_CALIBRATED ?auto_2523 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2521 ?auto_2518 ?auto_2519 ?auto_2520 )
      ( GET-2IMAGE-VERIFY ?auto_2519 ?auto_2520 ?auto_2521 ?auto_2518 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2535 - DIRECTION
      ?auto_2536 - MODE
      ?auto_2537 - DIRECTION
      ?auto_2534 - MODE
      ?auto_2538 - DIRECTION
      ?auto_2539 - MODE
    )
    :vars
    (
      ?auto_2541 - INSTRUMENT
      ?auto_2542 - SATELLITE
      ?auto_2540 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2541 ?auto_2542 ) ( SUPPORTS ?auto_2541 ?auto_2539 ) ( POWER_ON ?auto_2541 ) ( POINTING ?auto_2542 ?auto_2540 ) ( not ( = ?auto_2538 ?auto_2540 ) ) ( HAVE_IMAGE ?auto_2537 ?auto_2536 ) ( not ( = ?auto_2537 ?auto_2538 ) ) ( not ( = ?auto_2537 ?auto_2540 ) ) ( not ( = ?auto_2536 ?auto_2539 ) ) ( CALIBRATION_TARGET ?auto_2541 ?auto_2540 ) ( NOT_CALIBRATED ?auto_2541 ) ( HAVE_IMAGE ?auto_2535 ?auto_2536 ) ( HAVE_IMAGE ?auto_2537 ?auto_2534 ) ( not ( = ?auto_2535 ?auto_2537 ) ) ( not ( = ?auto_2535 ?auto_2538 ) ) ( not ( = ?auto_2535 ?auto_2540 ) ) ( not ( = ?auto_2536 ?auto_2534 ) ) ( not ( = ?auto_2534 ?auto_2539 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2537 ?auto_2536 ?auto_2538 ?auto_2539 )
      ( GET-3IMAGE-VERIFY ?auto_2535 ?auto_2536 ?auto_2537 ?auto_2534 ?auto_2538 ?auto_2539 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2544 - DIRECTION
      ?auto_2545 - MODE
      ?auto_2546 - DIRECTION
      ?auto_2543 - MODE
      ?auto_2547 - DIRECTION
      ?auto_2548 - MODE
    )
    :vars
    (
      ?auto_2550 - INSTRUMENT
      ?auto_2551 - SATELLITE
      ?auto_2549 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2550 ?auto_2551 ) ( SUPPORTS ?auto_2550 ?auto_2543 ) ( POWER_ON ?auto_2550 ) ( POINTING ?auto_2551 ?auto_2549 ) ( not ( = ?auto_2546 ?auto_2549 ) ) ( HAVE_IMAGE ?auto_2544 ?auto_2545 ) ( not ( = ?auto_2544 ?auto_2546 ) ) ( not ( = ?auto_2544 ?auto_2549 ) ) ( not ( = ?auto_2545 ?auto_2543 ) ) ( CALIBRATION_TARGET ?auto_2550 ?auto_2549 ) ( NOT_CALIBRATED ?auto_2550 ) ( HAVE_IMAGE ?auto_2547 ?auto_2548 ) ( not ( = ?auto_2544 ?auto_2547 ) ) ( not ( = ?auto_2545 ?auto_2548 ) ) ( not ( = ?auto_2546 ?auto_2547 ) ) ( not ( = ?auto_2543 ?auto_2548 ) ) ( not ( = ?auto_2547 ?auto_2549 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2544 ?auto_2545 ?auto_2546 ?auto_2543 )
      ( GET-3IMAGE-VERIFY ?auto_2544 ?auto_2545 ?auto_2546 ?auto_2543 ?auto_2547 ?auto_2548 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2562 - DIRECTION
      ?auto_2563 - MODE
      ?auto_2564 - DIRECTION
      ?auto_2561 - MODE
      ?auto_2565 - DIRECTION
      ?auto_2566 - MODE
    )
    :vars
    (
      ?auto_2568 - INSTRUMENT
      ?auto_2569 - SATELLITE
      ?auto_2567 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2568 ?auto_2569 ) ( SUPPORTS ?auto_2568 ?auto_2563 ) ( POWER_ON ?auto_2568 ) ( POINTING ?auto_2569 ?auto_2567 ) ( not ( = ?auto_2562 ?auto_2567 ) ) ( HAVE_IMAGE ?auto_2565 ?auto_2566 ) ( not ( = ?auto_2565 ?auto_2562 ) ) ( not ( = ?auto_2565 ?auto_2567 ) ) ( not ( = ?auto_2566 ?auto_2563 ) ) ( CALIBRATION_TARGET ?auto_2568 ?auto_2567 ) ( NOT_CALIBRATED ?auto_2568 ) ( HAVE_IMAGE ?auto_2564 ?auto_2561 ) ( not ( = ?auto_2562 ?auto_2564 ) ) ( not ( = ?auto_2563 ?auto_2561 ) ) ( not ( = ?auto_2564 ?auto_2565 ) ) ( not ( = ?auto_2564 ?auto_2567 ) ) ( not ( = ?auto_2561 ?auto_2566 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2565 ?auto_2566 ?auto_2562 ?auto_2563 )
      ( GET-3IMAGE-VERIFY ?auto_2562 ?auto_2563 ?auto_2564 ?auto_2561 ?auto_2565 ?auto_2566 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2599 - DIRECTION
      ?auto_2600 - MODE
    )
    :vars
    (
      ?auto_2602 - INSTRUMENT
      ?auto_2605 - SATELLITE
      ?auto_2601 - DIRECTION
      ?auto_2603 - DIRECTION
      ?auto_2604 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_2602 ?auto_2605 ) ( SUPPORTS ?auto_2602 ?auto_2600 ) ( POINTING ?auto_2605 ?auto_2601 ) ( not ( = ?auto_2599 ?auto_2601 ) ) ( HAVE_IMAGE ?auto_2603 ?auto_2604 ) ( not ( = ?auto_2603 ?auto_2599 ) ) ( not ( = ?auto_2603 ?auto_2601 ) ) ( not ( = ?auto_2604 ?auto_2600 ) ) ( CALIBRATION_TARGET ?auto_2602 ?auto_2601 ) ( POWER_AVAIL ?auto_2605 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_2602 ?auto_2605 )
      ( GET-2IMAGE ?auto_2603 ?auto_2604 ?auto_2599 ?auto_2600 )
      ( GET-1IMAGE-VERIFY ?auto_2599 ?auto_2600 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2607 - DIRECTION
      ?auto_2608 - MODE
      ?auto_2609 - DIRECTION
      ?auto_2606 - MODE
    )
    :vars
    (
      ?auto_2610 - INSTRUMENT
      ?auto_2612 - SATELLITE
      ?auto_2611 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2610 ?auto_2612 ) ( SUPPORTS ?auto_2610 ?auto_2606 ) ( POINTING ?auto_2612 ?auto_2611 ) ( not ( = ?auto_2609 ?auto_2611 ) ) ( HAVE_IMAGE ?auto_2607 ?auto_2608 ) ( not ( = ?auto_2607 ?auto_2609 ) ) ( not ( = ?auto_2607 ?auto_2611 ) ) ( not ( = ?auto_2608 ?auto_2606 ) ) ( CALIBRATION_TARGET ?auto_2610 ?auto_2611 ) ( POWER_AVAIL ?auto_2612 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2609 ?auto_2606 )
      ( GET-2IMAGE-VERIFY ?auto_2607 ?auto_2608 ?auto_2609 ?auto_2606 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2614 - DIRECTION
      ?auto_2615 - MODE
      ?auto_2616 - DIRECTION
      ?auto_2613 - MODE
    )
    :vars
    (
      ?auto_2618 - INSTRUMENT
      ?auto_2619 - SATELLITE
      ?auto_2617 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2618 ?auto_2619 ) ( SUPPORTS ?auto_2618 ?auto_2615 ) ( POINTING ?auto_2619 ?auto_2617 ) ( not ( = ?auto_2614 ?auto_2617 ) ) ( HAVE_IMAGE ?auto_2616 ?auto_2613 ) ( not ( = ?auto_2616 ?auto_2614 ) ) ( not ( = ?auto_2616 ?auto_2617 ) ) ( not ( = ?auto_2613 ?auto_2615 ) ) ( CALIBRATION_TARGET ?auto_2618 ?auto_2617 ) ( POWER_AVAIL ?auto_2619 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2616 ?auto_2613 ?auto_2614 ?auto_2615 )
      ( GET-2IMAGE-VERIFY ?auto_2614 ?auto_2615 ?auto_2616 ?auto_2613 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2630 - DIRECTION
      ?auto_2631 - MODE
      ?auto_2632 - DIRECTION
      ?auto_2629 - MODE
      ?auto_2633 - DIRECTION
      ?auto_2634 - MODE
    )
    :vars
    (
      ?auto_2636 - INSTRUMENT
      ?auto_2637 - SATELLITE
      ?auto_2635 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2636 ?auto_2637 ) ( SUPPORTS ?auto_2636 ?auto_2634 ) ( POINTING ?auto_2637 ?auto_2635 ) ( not ( = ?auto_2633 ?auto_2635 ) ) ( HAVE_IMAGE ?auto_2632 ?auto_2631 ) ( not ( = ?auto_2632 ?auto_2633 ) ) ( not ( = ?auto_2632 ?auto_2635 ) ) ( not ( = ?auto_2631 ?auto_2634 ) ) ( CALIBRATION_TARGET ?auto_2636 ?auto_2635 ) ( POWER_AVAIL ?auto_2637 ) ( HAVE_IMAGE ?auto_2630 ?auto_2631 ) ( HAVE_IMAGE ?auto_2632 ?auto_2629 ) ( not ( = ?auto_2630 ?auto_2632 ) ) ( not ( = ?auto_2630 ?auto_2633 ) ) ( not ( = ?auto_2630 ?auto_2635 ) ) ( not ( = ?auto_2631 ?auto_2629 ) ) ( not ( = ?auto_2629 ?auto_2634 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2632 ?auto_2631 ?auto_2633 ?auto_2634 )
      ( GET-3IMAGE-VERIFY ?auto_2630 ?auto_2631 ?auto_2632 ?auto_2629 ?auto_2633 ?auto_2634 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2639 - DIRECTION
      ?auto_2640 - MODE
      ?auto_2641 - DIRECTION
      ?auto_2638 - MODE
      ?auto_2642 - DIRECTION
      ?auto_2643 - MODE
    )
    :vars
    (
      ?auto_2645 - INSTRUMENT
      ?auto_2646 - SATELLITE
      ?auto_2644 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2645 ?auto_2646 ) ( SUPPORTS ?auto_2645 ?auto_2638 ) ( POINTING ?auto_2646 ?auto_2644 ) ( not ( = ?auto_2641 ?auto_2644 ) ) ( HAVE_IMAGE ?auto_2639 ?auto_2640 ) ( not ( = ?auto_2639 ?auto_2641 ) ) ( not ( = ?auto_2639 ?auto_2644 ) ) ( not ( = ?auto_2640 ?auto_2638 ) ) ( CALIBRATION_TARGET ?auto_2645 ?auto_2644 ) ( POWER_AVAIL ?auto_2646 ) ( HAVE_IMAGE ?auto_2642 ?auto_2643 ) ( not ( = ?auto_2639 ?auto_2642 ) ) ( not ( = ?auto_2640 ?auto_2643 ) ) ( not ( = ?auto_2641 ?auto_2642 ) ) ( not ( = ?auto_2638 ?auto_2643 ) ) ( not ( = ?auto_2642 ?auto_2644 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2639 ?auto_2640 ?auto_2641 ?auto_2638 )
      ( GET-3IMAGE-VERIFY ?auto_2639 ?auto_2640 ?auto_2641 ?auto_2638 ?auto_2642 ?auto_2643 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2657 - DIRECTION
      ?auto_2658 - MODE
      ?auto_2659 - DIRECTION
      ?auto_2656 - MODE
      ?auto_2660 - DIRECTION
      ?auto_2661 - MODE
    )
    :vars
    (
      ?auto_2663 - INSTRUMENT
      ?auto_2664 - SATELLITE
      ?auto_2662 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2663 ?auto_2664 ) ( SUPPORTS ?auto_2663 ?auto_2658 ) ( POINTING ?auto_2664 ?auto_2662 ) ( not ( = ?auto_2657 ?auto_2662 ) ) ( HAVE_IMAGE ?auto_2659 ?auto_2656 ) ( not ( = ?auto_2659 ?auto_2657 ) ) ( not ( = ?auto_2659 ?auto_2662 ) ) ( not ( = ?auto_2656 ?auto_2658 ) ) ( CALIBRATION_TARGET ?auto_2663 ?auto_2662 ) ( POWER_AVAIL ?auto_2664 ) ( HAVE_IMAGE ?auto_2660 ?auto_2661 ) ( not ( = ?auto_2657 ?auto_2660 ) ) ( not ( = ?auto_2658 ?auto_2661 ) ) ( not ( = ?auto_2659 ?auto_2660 ) ) ( not ( = ?auto_2656 ?auto_2661 ) ) ( not ( = ?auto_2660 ?auto_2662 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2659 ?auto_2656 ?auto_2657 ?auto_2658 )
      ( GET-3IMAGE-VERIFY ?auto_2657 ?auto_2658 ?auto_2659 ?auto_2656 ?auto_2660 ?auto_2661 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2694 - DIRECTION
      ?auto_2695 - MODE
    )
    :vars
    (
      ?auto_2697 - INSTRUMENT
      ?auto_2698 - SATELLITE
      ?auto_2696 - DIRECTION
      ?auto_2699 - DIRECTION
      ?auto_2700 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_2697 ?auto_2698 ) ( SUPPORTS ?auto_2697 ?auto_2695 ) ( not ( = ?auto_2694 ?auto_2696 ) ) ( HAVE_IMAGE ?auto_2699 ?auto_2700 ) ( not ( = ?auto_2699 ?auto_2694 ) ) ( not ( = ?auto_2699 ?auto_2696 ) ) ( not ( = ?auto_2700 ?auto_2695 ) ) ( CALIBRATION_TARGET ?auto_2697 ?auto_2696 ) ( POWER_AVAIL ?auto_2698 ) ( POINTING ?auto_2698 ?auto_2699 ) )
    :subtasks
    ( ( !TURN_TO ?auto_2698 ?auto_2696 ?auto_2699 )
      ( GET-2IMAGE ?auto_2699 ?auto_2700 ?auto_2694 ?auto_2695 )
      ( GET-1IMAGE-VERIFY ?auto_2694 ?auto_2695 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2702 - DIRECTION
      ?auto_2703 - MODE
      ?auto_2704 - DIRECTION
      ?auto_2701 - MODE
    )
    :vars
    (
      ?auto_2706 - INSTRUMENT
      ?auto_2707 - SATELLITE
      ?auto_2705 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2706 ?auto_2707 ) ( SUPPORTS ?auto_2706 ?auto_2701 ) ( not ( = ?auto_2704 ?auto_2705 ) ) ( HAVE_IMAGE ?auto_2702 ?auto_2703 ) ( not ( = ?auto_2702 ?auto_2704 ) ) ( not ( = ?auto_2702 ?auto_2705 ) ) ( not ( = ?auto_2703 ?auto_2701 ) ) ( CALIBRATION_TARGET ?auto_2706 ?auto_2705 ) ( POWER_AVAIL ?auto_2707 ) ( POINTING ?auto_2707 ?auto_2702 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2704 ?auto_2701 )
      ( GET-2IMAGE-VERIFY ?auto_2702 ?auto_2703 ?auto_2704 ?auto_2701 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2709 - DIRECTION
      ?auto_2710 - MODE
      ?auto_2711 - DIRECTION
      ?auto_2708 - MODE
    )
    :vars
    (
      ?auto_2713 - INSTRUMENT
      ?auto_2712 - SATELLITE
      ?auto_2714 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2713 ?auto_2712 ) ( SUPPORTS ?auto_2713 ?auto_2710 ) ( not ( = ?auto_2709 ?auto_2714 ) ) ( HAVE_IMAGE ?auto_2711 ?auto_2708 ) ( not ( = ?auto_2711 ?auto_2709 ) ) ( not ( = ?auto_2711 ?auto_2714 ) ) ( not ( = ?auto_2708 ?auto_2710 ) ) ( CALIBRATION_TARGET ?auto_2713 ?auto_2714 ) ( POWER_AVAIL ?auto_2712 ) ( POINTING ?auto_2712 ?auto_2711 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2711 ?auto_2708 ?auto_2709 ?auto_2710 )
      ( GET-2IMAGE-VERIFY ?auto_2709 ?auto_2710 ?auto_2711 ?auto_2708 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2725 - DIRECTION
      ?auto_2726 - MODE
      ?auto_2727 - DIRECTION
      ?auto_2724 - MODE
      ?auto_2728 - DIRECTION
      ?auto_2729 - MODE
    )
    :vars
    (
      ?auto_2731 - INSTRUMENT
      ?auto_2730 - SATELLITE
      ?auto_2732 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2731 ?auto_2730 ) ( SUPPORTS ?auto_2731 ?auto_2729 ) ( not ( = ?auto_2728 ?auto_2732 ) ) ( HAVE_IMAGE ?auto_2727 ?auto_2726 ) ( not ( = ?auto_2727 ?auto_2728 ) ) ( not ( = ?auto_2727 ?auto_2732 ) ) ( not ( = ?auto_2726 ?auto_2729 ) ) ( CALIBRATION_TARGET ?auto_2731 ?auto_2732 ) ( POWER_AVAIL ?auto_2730 ) ( POINTING ?auto_2730 ?auto_2727 ) ( HAVE_IMAGE ?auto_2725 ?auto_2726 ) ( HAVE_IMAGE ?auto_2727 ?auto_2724 ) ( not ( = ?auto_2725 ?auto_2727 ) ) ( not ( = ?auto_2725 ?auto_2728 ) ) ( not ( = ?auto_2725 ?auto_2732 ) ) ( not ( = ?auto_2726 ?auto_2724 ) ) ( not ( = ?auto_2724 ?auto_2729 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2727 ?auto_2726 ?auto_2728 ?auto_2729 )
      ( GET-3IMAGE-VERIFY ?auto_2725 ?auto_2726 ?auto_2727 ?auto_2724 ?auto_2728 ?auto_2729 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2734 - DIRECTION
      ?auto_2735 - MODE
      ?auto_2736 - DIRECTION
      ?auto_2733 - MODE
      ?auto_2737 - DIRECTION
      ?auto_2738 - MODE
    )
    :vars
    (
      ?auto_2740 - INSTRUMENT
      ?auto_2739 - SATELLITE
      ?auto_2741 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2740 ?auto_2739 ) ( SUPPORTS ?auto_2740 ?auto_2733 ) ( not ( = ?auto_2736 ?auto_2741 ) ) ( HAVE_IMAGE ?auto_2734 ?auto_2735 ) ( not ( = ?auto_2734 ?auto_2736 ) ) ( not ( = ?auto_2734 ?auto_2741 ) ) ( not ( = ?auto_2735 ?auto_2733 ) ) ( CALIBRATION_TARGET ?auto_2740 ?auto_2741 ) ( POWER_AVAIL ?auto_2739 ) ( POINTING ?auto_2739 ?auto_2734 ) ( HAVE_IMAGE ?auto_2737 ?auto_2738 ) ( not ( = ?auto_2734 ?auto_2737 ) ) ( not ( = ?auto_2735 ?auto_2738 ) ) ( not ( = ?auto_2736 ?auto_2737 ) ) ( not ( = ?auto_2733 ?auto_2738 ) ) ( not ( = ?auto_2737 ?auto_2741 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2734 ?auto_2735 ?auto_2736 ?auto_2733 )
      ( GET-3IMAGE-VERIFY ?auto_2734 ?auto_2735 ?auto_2736 ?auto_2733 ?auto_2737 ?auto_2738 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2752 - DIRECTION
      ?auto_2753 - MODE
      ?auto_2754 - DIRECTION
      ?auto_2751 - MODE
      ?auto_2755 - DIRECTION
      ?auto_2756 - MODE
    )
    :vars
    (
      ?auto_2758 - INSTRUMENT
      ?auto_2757 - SATELLITE
      ?auto_2759 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2758 ?auto_2757 ) ( SUPPORTS ?auto_2758 ?auto_2753 ) ( not ( = ?auto_2752 ?auto_2759 ) ) ( HAVE_IMAGE ?auto_2754 ?auto_2751 ) ( not ( = ?auto_2754 ?auto_2752 ) ) ( not ( = ?auto_2754 ?auto_2759 ) ) ( not ( = ?auto_2751 ?auto_2753 ) ) ( CALIBRATION_TARGET ?auto_2758 ?auto_2759 ) ( POWER_AVAIL ?auto_2757 ) ( POINTING ?auto_2757 ?auto_2754 ) ( HAVE_IMAGE ?auto_2755 ?auto_2756 ) ( not ( = ?auto_2752 ?auto_2755 ) ) ( not ( = ?auto_2753 ?auto_2756 ) ) ( not ( = ?auto_2754 ?auto_2755 ) ) ( not ( = ?auto_2751 ?auto_2756 ) ) ( not ( = ?auto_2755 ?auto_2759 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2754 ?auto_2751 ?auto_2752 ?auto_2753 )
      ( GET-3IMAGE-VERIFY ?auto_2752 ?auto_2753 ?auto_2754 ?auto_2751 ?auto_2755 ?auto_2756 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2789 - DIRECTION
      ?auto_2790 - MODE
    )
    :vars
    (
      ?auto_2792 - INSTRUMENT
      ?auto_2791 - SATELLITE
      ?auto_2793 - DIRECTION
      ?auto_2794 - DIRECTION
      ?auto_2795 - MODE
      ?auto_2796 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2792 ?auto_2791 ) ( SUPPORTS ?auto_2792 ?auto_2790 ) ( not ( = ?auto_2789 ?auto_2793 ) ) ( HAVE_IMAGE ?auto_2794 ?auto_2795 ) ( not ( = ?auto_2794 ?auto_2789 ) ) ( not ( = ?auto_2794 ?auto_2793 ) ) ( not ( = ?auto_2795 ?auto_2790 ) ) ( CALIBRATION_TARGET ?auto_2792 ?auto_2793 ) ( POINTING ?auto_2791 ?auto_2794 ) ( ON_BOARD ?auto_2796 ?auto_2791 ) ( POWER_ON ?auto_2796 ) ( not ( = ?auto_2792 ?auto_2796 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_2796 ?auto_2791 )
      ( GET-2IMAGE ?auto_2794 ?auto_2795 ?auto_2789 ?auto_2790 )
      ( GET-1IMAGE-VERIFY ?auto_2789 ?auto_2790 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2798 - DIRECTION
      ?auto_2799 - MODE
      ?auto_2800 - DIRECTION
      ?auto_2797 - MODE
    )
    :vars
    (
      ?auto_2801 - INSTRUMENT
      ?auto_2803 - SATELLITE
      ?auto_2804 - DIRECTION
      ?auto_2802 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2801 ?auto_2803 ) ( SUPPORTS ?auto_2801 ?auto_2797 ) ( not ( = ?auto_2800 ?auto_2804 ) ) ( HAVE_IMAGE ?auto_2798 ?auto_2799 ) ( not ( = ?auto_2798 ?auto_2800 ) ) ( not ( = ?auto_2798 ?auto_2804 ) ) ( not ( = ?auto_2799 ?auto_2797 ) ) ( CALIBRATION_TARGET ?auto_2801 ?auto_2804 ) ( POINTING ?auto_2803 ?auto_2798 ) ( ON_BOARD ?auto_2802 ?auto_2803 ) ( POWER_ON ?auto_2802 ) ( not ( = ?auto_2801 ?auto_2802 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2800 ?auto_2797 )
      ( GET-2IMAGE-VERIFY ?auto_2798 ?auto_2799 ?auto_2800 ?auto_2797 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2806 - DIRECTION
      ?auto_2807 - MODE
      ?auto_2808 - DIRECTION
      ?auto_2805 - MODE
    )
    :vars
    (
      ?auto_2811 - INSTRUMENT
      ?auto_2812 - SATELLITE
      ?auto_2809 - DIRECTION
      ?auto_2810 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2811 ?auto_2812 ) ( SUPPORTS ?auto_2811 ?auto_2807 ) ( not ( = ?auto_2806 ?auto_2809 ) ) ( HAVE_IMAGE ?auto_2808 ?auto_2805 ) ( not ( = ?auto_2808 ?auto_2806 ) ) ( not ( = ?auto_2808 ?auto_2809 ) ) ( not ( = ?auto_2805 ?auto_2807 ) ) ( CALIBRATION_TARGET ?auto_2811 ?auto_2809 ) ( POINTING ?auto_2812 ?auto_2808 ) ( ON_BOARD ?auto_2810 ?auto_2812 ) ( POWER_ON ?auto_2810 ) ( not ( = ?auto_2811 ?auto_2810 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2808 ?auto_2805 ?auto_2806 ?auto_2807 )
      ( GET-2IMAGE-VERIFY ?auto_2806 ?auto_2807 ?auto_2808 ?auto_2805 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2824 - DIRECTION
      ?auto_2825 - MODE
      ?auto_2826 - DIRECTION
      ?auto_2823 - MODE
      ?auto_2827 - DIRECTION
      ?auto_2828 - MODE
    )
    :vars
    (
      ?auto_2831 - INSTRUMENT
      ?auto_2832 - SATELLITE
      ?auto_2829 - DIRECTION
      ?auto_2830 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2831 ?auto_2832 ) ( SUPPORTS ?auto_2831 ?auto_2828 ) ( not ( = ?auto_2827 ?auto_2829 ) ) ( HAVE_IMAGE ?auto_2826 ?auto_2825 ) ( not ( = ?auto_2826 ?auto_2827 ) ) ( not ( = ?auto_2826 ?auto_2829 ) ) ( not ( = ?auto_2825 ?auto_2828 ) ) ( CALIBRATION_TARGET ?auto_2831 ?auto_2829 ) ( POINTING ?auto_2832 ?auto_2826 ) ( ON_BOARD ?auto_2830 ?auto_2832 ) ( POWER_ON ?auto_2830 ) ( not ( = ?auto_2831 ?auto_2830 ) ) ( HAVE_IMAGE ?auto_2824 ?auto_2825 ) ( HAVE_IMAGE ?auto_2826 ?auto_2823 ) ( not ( = ?auto_2824 ?auto_2826 ) ) ( not ( = ?auto_2824 ?auto_2827 ) ) ( not ( = ?auto_2824 ?auto_2829 ) ) ( not ( = ?auto_2825 ?auto_2823 ) ) ( not ( = ?auto_2823 ?auto_2828 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2826 ?auto_2825 ?auto_2827 ?auto_2828 )
      ( GET-3IMAGE-VERIFY ?auto_2824 ?auto_2825 ?auto_2826 ?auto_2823 ?auto_2827 ?auto_2828 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2834 - DIRECTION
      ?auto_2835 - MODE
      ?auto_2836 - DIRECTION
      ?auto_2833 - MODE
      ?auto_2837 - DIRECTION
      ?auto_2838 - MODE
    )
    :vars
    (
      ?auto_2841 - INSTRUMENT
      ?auto_2842 - SATELLITE
      ?auto_2839 - DIRECTION
      ?auto_2840 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2841 ?auto_2842 ) ( SUPPORTS ?auto_2841 ?auto_2833 ) ( not ( = ?auto_2836 ?auto_2839 ) ) ( HAVE_IMAGE ?auto_2837 ?auto_2838 ) ( not ( = ?auto_2837 ?auto_2836 ) ) ( not ( = ?auto_2837 ?auto_2839 ) ) ( not ( = ?auto_2838 ?auto_2833 ) ) ( CALIBRATION_TARGET ?auto_2841 ?auto_2839 ) ( POINTING ?auto_2842 ?auto_2837 ) ( ON_BOARD ?auto_2840 ?auto_2842 ) ( POWER_ON ?auto_2840 ) ( not ( = ?auto_2841 ?auto_2840 ) ) ( HAVE_IMAGE ?auto_2834 ?auto_2835 ) ( not ( = ?auto_2834 ?auto_2836 ) ) ( not ( = ?auto_2834 ?auto_2837 ) ) ( not ( = ?auto_2834 ?auto_2839 ) ) ( not ( = ?auto_2835 ?auto_2833 ) ) ( not ( = ?auto_2835 ?auto_2838 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2837 ?auto_2838 ?auto_2836 ?auto_2833 )
      ( GET-3IMAGE-VERIFY ?auto_2834 ?auto_2835 ?auto_2836 ?auto_2833 ?auto_2837 ?auto_2838 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2854 - DIRECTION
      ?auto_2855 - MODE
      ?auto_2856 - DIRECTION
      ?auto_2853 - MODE
      ?auto_2857 - DIRECTION
      ?auto_2858 - MODE
    )
    :vars
    (
      ?auto_2861 - INSTRUMENT
      ?auto_2862 - SATELLITE
      ?auto_2859 - DIRECTION
      ?auto_2860 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2861 ?auto_2862 ) ( SUPPORTS ?auto_2861 ?auto_2855 ) ( not ( = ?auto_2854 ?auto_2859 ) ) ( HAVE_IMAGE ?auto_2857 ?auto_2853 ) ( not ( = ?auto_2857 ?auto_2854 ) ) ( not ( = ?auto_2857 ?auto_2859 ) ) ( not ( = ?auto_2853 ?auto_2855 ) ) ( CALIBRATION_TARGET ?auto_2861 ?auto_2859 ) ( POINTING ?auto_2862 ?auto_2857 ) ( ON_BOARD ?auto_2860 ?auto_2862 ) ( POWER_ON ?auto_2860 ) ( not ( = ?auto_2861 ?auto_2860 ) ) ( HAVE_IMAGE ?auto_2856 ?auto_2853 ) ( HAVE_IMAGE ?auto_2857 ?auto_2858 ) ( not ( = ?auto_2854 ?auto_2856 ) ) ( not ( = ?auto_2855 ?auto_2858 ) ) ( not ( = ?auto_2856 ?auto_2857 ) ) ( not ( = ?auto_2856 ?auto_2859 ) ) ( not ( = ?auto_2853 ?auto_2858 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2857 ?auto_2853 ?auto_2854 ?auto_2855 )
      ( GET-3IMAGE-VERIFY ?auto_2854 ?auto_2855 ?auto_2856 ?auto_2853 ?auto_2857 ?auto_2858 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2895 - DIRECTION
      ?auto_2896 - MODE
    )
    :vars
    (
      ?auto_2899 - INSTRUMENT
      ?auto_2900 - SATELLITE
      ?auto_2897 - DIRECTION
      ?auto_2901 - DIRECTION
      ?auto_2902 - MODE
      ?auto_2898 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2899 ?auto_2900 ) ( SUPPORTS ?auto_2899 ?auto_2896 ) ( not ( = ?auto_2895 ?auto_2897 ) ) ( not ( = ?auto_2901 ?auto_2895 ) ) ( not ( = ?auto_2901 ?auto_2897 ) ) ( not ( = ?auto_2902 ?auto_2896 ) ) ( CALIBRATION_TARGET ?auto_2899 ?auto_2897 ) ( POINTING ?auto_2900 ?auto_2901 ) ( ON_BOARD ?auto_2898 ?auto_2900 ) ( POWER_ON ?auto_2898 ) ( not ( = ?auto_2899 ?auto_2898 ) ) ( CALIBRATED ?auto_2898 ) ( SUPPORTS ?auto_2898 ?auto_2902 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2901 ?auto_2902 )
      ( GET-2IMAGE ?auto_2901 ?auto_2902 ?auto_2895 ?auto_2896 )
      ( GET-1IMAGE-VERIFY ?auto_2895 ?auto_2896 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2904 - DIRECTION
      ?auto_2905 - MODE
      ?auto_2906 - DIRECTION
      ?auto_2903 - MODE
    )
    :vars
    (
      ?auto_2907 - INSTRUMENT
      ?auto_2910 - SATELLITE
      ?auto_2909 - DIRECTION
      ?auto_2908 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2907 ?auto_2910 ) ( SUPPORTS ?auto_2907 ?auto_2903 ) ( not ( = ?auto_2906 ?auto_2909 ) ) ( not ( = ?auto_2904 ?auto_2906 ) ) ( not ( = ?auto_2904 ?auto_2909 ) ) ( not ( = ?auto_2905 ?auto_2903 ) ) ( CALIBRATION_TARGET ?auto_2907 ?auto_2909 ) ( POINTING ?auto_2910 ?auto_2904 ) ( ON_BOARD ?auto_2908 ?auto_2910 ) ( POWER_ON ?auto_2908 ) ( not ( = ?auto_2907 ?auto_2908 ) ) ( CALIBRATED ?auto_2908 ) ( SUPPORTS ?auto_2908 ?auto_2905 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2906 ?auto_2903 )
      ( GET-2IMAGE-VERIFY ?auto_2904 ?auto_2905 ?auto_2906 ?auto_2903 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2912 - DIRECTION
      ?auto_2913 - MODE
      ?auto_2914 - DIRECTION
      ?auto_2911 - MODE
    )
    :vars
    (
      ?auto_2918 - INSTRUMENT
      ?auto_2915 - SATELLITE
      ?auto_2917 - DIRECTION
      ?auto_2916 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2918 ?auto_2915 ) ( SUPPORTS ?auto_2918 ?auto_2913 ) ( not ( = ?auto_2912 ?auto_2917 ) ) ( not ( = ?auto_2914 ?auto_2912 ) ) ( not ( = ?auto_2914 ?auto_2917 ) ) ( not ( = ?auto_2911 ?auto_2913 ) ) ( CALIBRATION_TARGET ?auto_2918 ?auto_2917 ) ( POINTING ?auto_2915 ?auto_2914 ) ( ON_BOARD ?auto_2916 ?auto_2915 ) ( POWER_ON ?auto_2916 ) ( not ( = ?auto_2918 ?auto_2916 ) ) ( CALIBRATED ?auto_2916 ) ( SUPPORTS ?auto_2916 ?auto_2911 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2914 ?auto_2911 ?auto_2912 ?auto_2913 )
      ( GET-2IMAGE-VERIFY ?auto_2912 ?auto_2913 ?auto_2914 ?auto_2911 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3001 - DIRECTION
      ?auto_3002 - MODE
    )
    :vars
    (
      ?auto_3006 - INSTRUMENT
      ?auto_3003 - SATELLITE
      ?auto_3005 - DIRECTION
      ?auto_3007 - DIRECTION
      ?auto_3008 - MODE
      ?auto_3004 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_3006 ?auto_3003 ) ( SUPPORTS ?auto_3006 ?auto_3002 ) ( not ( = ?auto_3001 ?auto_3005 ) ) ( not ( = ?auto_3007 ?auto_3001 ) ) ( not ( = ?auto_3007 ?auto_3005 ) ) ( not ( = ?auto_3008 ?auto_3002 ) ) ( CALIBRATION_TARGET ?auto_3006 ?auto_3005 ) ( ON_BOARD ?auto_3004 ?auto_3003 ) ( POWER_ON ?auto_3004 ) ( not ( = ?auto_3006 ?auto_3004 ) ) ( CALIBRATED ?auto_3004 ) ( SUPPORTS ?auto_3004 ?auto_3008 ) ( POINTING ?auto_3003 ?auto_3005 ) )
    :subtasks
    ( ( !TURN_TO ?auto_3003 ?auto_3007 ?auto_3005 )
      ( GET-2IMAGE ?auto_3007 ?auto_3008 ?auto_3001 ?auto_3002 )
      ( GET-1IMAGE-VERIFY ?auto_3001 ?auto_3002 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3010 - DIRECTION
      ?auto_3011 - MODE
      ?auto_3012 - DIRECTION
      ?auto_3009 - MODE
    )
    :vars
    (
      ?auto_3015 - INSTRUMENT
      ?auto_3014 - SATELLITE
      ?auto_3013 - DIRECTION
      ?auto_3016 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_3015 ?auto_3014 ) ( SUPPORTS ?auto_3015 ?auto_3009 ) ( not ( = ?auto_3012 ?auto_3013 ) ) ( not ( = ?auto_3010 ?auto_3012 ) ) ( not ( = ?auto_3010 ?auto_3013 ) ) ( not ( = ?auto_3011 ?auto_3009 ) ) ( CALIBRATION_TARGET ?auto_3015 ?auto_3013 ) ( ON_BOARD ?auto_3016 ?auto_3014 ) ( POWER_ON ?auto_3016 ) ( not ( = ?auto_3015 ?auto_3016 ) ) ( CALIBRATED ?auto_3016 ) ( SUPPORTS ?auto_3016 ?auto_3011 ) ( POINTING ?auto_3014 ?auto_3013 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3012 ?auto_3009 )
      ( GET-2IMAGE-VERIFY ?auto_3010 ?auto_3011 ?auto_3012 ?auto_3009 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3018 - DIRECTION
      ?auto_3019 - MODE
      ?auto_3020 - DIRECTION
      ?auto_3017 - MODE
    )
    :vars
    (
      ?auto_3024 - INSTRUMENT
      ?auto_3023 - SATELLITE
      ?auto_3022 - DIRECTION
      ?auto_3021 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_3024 ?auto_3023 ) ( SUPPORTS ?auto_3024 ?auto_3019 ) ( not ( = ?auto_3018 ?auto_3022 ) ) ( not ( = ?auto_3020 ?auto_3018 ) ) ( not ( = ?auto_3020 ?auto_3022 ) ) ( not ( = ?auto_3017 ?auto_3019 ) ) ( CALIBRATION_TARGET ?auto_3024 ?auto_3022 ) ( ON_BOARD ?auto_3021 ?auto_3023 ) ( POWER_ON ?auto_3021 ) ( not ( = ?auto_3024 ?auto_3021 ) ) ( CALIBRATED ?auto_3021 ) ( SUPPORTS ?auto_3021 ?auto_3017 ) ( POINTING ?auto_3023 ?auto_3022 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3020 ?auto_3017 ?auto_3018 ?auto_3019 )
      ( GET-2IMAGE-VERIFY ?auto_3018 ?auto_3019 ?auto_3020 ?auto_3017 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3107 - DIRECTION
      ?auto_3108 - MODE
    )
    :vars
    (
      ?auto_3112 - INSTRUMENT
      ?auto_3111 - SATELLITE
      ?auto_3110 - DIRECTION
      ?auto_3114 - DIRECTION
      ?auto_3113 - MODE
      ?auto_3109 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_3112 ?auto_3111 ) ( SUPPORTS ?auto_3112 ?auto_3108 ) ( not ( = ?auto_3107 ?auto_3110 ) ) ( not ( = ?auto_3114 ?auto_3107 ) ) ( not ( = ?auto_3114 ?auto_3110 ) ) ( not ( = ?auto_3113 ?auto_3108 ) ) ( CALIBRATION_TARGET ?auto_3112 ?auto_3110 ) ( ON_BOARD ?auto_3109 ?auto_3111 ) ( POWER_ON ?auto_3109 ) ( not ( = ?auto_3112 ?auto_3109 ) ) ( SUPPORTS ?auto_3109 ?auto_3113 ) ( POINTING ?auto_3111 ?auto_3110 ) ( CALIBRATION_TARGET ?auto_3109 ?auto_3110 ) ( NOT_CALIBRATED ?auto_3109 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_3111 ?auto_3109 ?auto_3110 )
      ( GET-2IMAGE ?auto_3114 ?auto_3113 ?auto_3107 ?auto_3108 )
      ( GET-1IMAGE-VERIFY ?auto_3107 ?auto_3108 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3116 - DIRECTION
      ?auto_3117 - MODE
      ?auto_3118 - DIRECTION
      ?auto_3115 - MODE
    )
    :vars
    (
      ?auto_3121 - INSTRUMENT
      ?auto_3122 - SATELLITE
      ?auto_3120 - DIRECTION
      ?auto_3119 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_3121 ?auto_3122 ) ( SUPPORTS ?auto_3121 ?auto_3115 ) ( not ( = ?auto_3118 ?auto_3120 ) ) ( not ( = ?auto_3116 ?auto_3118 ) ) ( not ( = ?auto_3116 ?auto_3120 ) ) ( not ( = ?auto_3117 ?auto_3115 ) ) ( CALIBRATION_TARGET ?auto_3121 ?auto_3120 ) ( ON_BOARD ?auto_3119 ?auto_3122 ) ( POWER_ON ?auto_3119 ) ( not ( = ?auto_3121 ?auto_3119 ) ) ( SUPPORTS ?auto_3119 ?auto_3117 ) ( POINTING ?auto_3122 ?auto_3120 ) ( CALIBRATION_TARGET ?auto_3119 ?auto_3120 ) ( NOT_CALIBRATED ?auto_3119 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3118 ?auto_3115 )
      ( GET-2IMAGE-VERIFY ?auto_3116 ?auto_3117 ?auto_3118 ?auto_3115 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3124 - DIRECTION
      ?auto_3125 - MODE
      ?auto_3126 - DIRECTION
      ?auto_3123 - MODE
    )
    :vars
    (
      ?auto_3127 - INSTRUMENT
      ?auto_3130 - SATELLITE
      ?auto_3129 - DIRECTION
      ?auto_3128 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_3127 ?auto_3130 ) ( SUPPORTS ?auto_3127 ?auto_3125 ) ( not ( = ?auto_3124 ?auto_3129 ) ) ( not ( = ?auto_3126 ?auto_3124 ) ) ( not ( = ?auto_3126 ?auto_3129 ) ) ( not ( = ?auto_3123 ?auto_3125 ) ) ( CALIBRATION_TARGET ?auto_3127 ?auto_3129 ) ( ON_BOARD ?auto_3128 ?auto_3130 ) ( POWER_ON ?auto_3128 ) ( not ( = ?auto_3127 ?auto_3128 ) ) ( SUPPORTS ?auto_3128 ?auto_3123 ) ( POINTING ?auto_3130 ?auto_3129 ) ( CALIBRATION_TARGET ?auto_3128 ?auto_3129 ) ( NOT_CALIBRATED ?auto_3128 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3126 ?auto_3123 ?auto_3124 ?auto_3125 )
      ( GET-2IMAGE-VERIFY ?auto_3124 ?auto_3125 ?auto_3126 ?auto_3123 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3738 - DIRECTION
      ?auto_3739 - MODE
      ?auto_3740 - DIRECTION
      ?auto_3737 - MODE
      ?auto_3741 - DIRECTION
      ?auto_3742 - MODE
    )
    :vars
    (
      ?auto_3744 - INSTRUMENT
      ?auto_3745 - SATELLITE
      ?auto_3743 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_3744 ) ( ON_BOARD ?auto_3744 ?auto_3745 ) ( SUPPORTS ?auto_3744 ?auto_3742 ) ( POWER_ON ?auto_3744 ) ( POINTING ?auto_3745 ?auto_3743 ) ( not ( = ?auto_3741 ?auto_3743 ) ) ( HAVE_IMAGE ?auto_3738 ?auto_3739 ) ( not ( = ?auto_3738 ?auto_3741 ) ) ( not ( = ?auto_3738 ?auto_3743 ) ) ( not ( = ?auto_3739 ?auto_3742 ) ) ( HAVE_IMAGE ?auto_3740 ?auto_3737 ) ( not ( = ?auto_3738 ?auto_3740 ) ) ( not ( = ?auto_3739 ?auto_3737 ) ) ( not ( = ?auto_3740 ?auto_3741 ) ) ( not ( = ?auto_3740 ?auto_3743 ) ) ( not ( = ?auto_3737 ?auto_3742 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3738 ?auto_3739 ?auto_3741 ?auto_3742 )
      ( GET-3IMAGE-VERIFY ?auto_3738 ?auto_3739 ?auto_3740 ?auto_3737 ?auto_3741 ?auto_3742 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3753 - DIRECTION
      ?auto_3754 - MODE
      ?auto_3755 - DIRECTION
      ?auto_3752 - MODE
      ?auto_3756 - DIRECTION
      ?auto_3757 - MODE
    )
    :vars
    (
      ?auto_3759 - INSTRUMENT
      ?auto_3760 - SATELLITE
      ?auto_3758 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_3759 ) ( ON_BOARD ?auto_3759 ?auto_3760 ) ( SUPPORTS ?auto_3759 ?auto_3752 ) ( POWER_ON ?auto_3759 ) ( POINTING ?auto_3760 ?auto_3758 ) ( not ( = ?auto_3755 ?auto_3758 ) ) ( HAVE_IMAGE ?auto_3756 ?auto_3754 ) ( not ( = ?auto_3756 ?auto_3755 ) ) ( not ( = ?auto_3756 ?auto_3758 ) ) ( not ( = ?auto_3754 ?auto_3752 ) ) ( HAVE_IMAGE ?auto_3753 ?auto_3754 ) ( HAVE_IMAGE ?auto_3756 ?auto_3757 ) ( not ( = ?auto_3753 ?auto_3755 ) ) ( not ( = ?auto_3753 ?auto_3756 ) ) ( not ( = ?auto_3753 ?auto_3758 ) ) ( not ( = ?auto_3754 ?auto_3757 ) ) ( not ( = ?auto_3752 ?auto_3757 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3756 ?auto_3754 ?auto_3755 ?auto_3752 )
      ( GET-3IMAGE-VERIFY ?auto_3753 ?auto_3754 ?auto_3755 ?auto_3752 ?auto_3756 ?auto_3757 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3762 - DIRECTION
      ?auto_3763 - MODE
      ?auto_3764 - DIRECTION
      ?auto_3761 - MODE
      ?auto_3765 - DIRECTION
      ?auto_3766 - MODE
    )
    :vars
    (
      ?auto_3768 - INSTRUMENT
      ?auto_3769 - SATELLITE
      ?auto_3767 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_3768 ) ( ON_BOARD ?auto_3768 ?auto_3769 ) ( SUPPORTS ?auto_3768 ?auto_3761 ) ( POWER_ON ?auto_3768 ) ( POINTING ?auto_3769 ?auto_3767 ) ( not ( = ?auto_3764 ?auto_3767 ) ) ( HAVE_IMAGE ?auto_3762 ?auto_3763 ) ( not ( = ?auto_3762 ?auto_3764 ) ) ( not ( = ?auto_3762 ?auto_3767 ) ) ( not ( = ?auto_3763 ?auto_3761 ) ) ( HAVE_IMAGE ?auto_3765 ?auto_3766 ) ( not ( = ?auto_3762 ?auto_3765 ) ) ( not ( = ?auto_3763 ?auto_3766 ) ) ( not ( = ?auto_3764 ?auto_3765 ) ) ( not ( = ?auto_3761 ?auto_3766 ) ) ( not ( = ?auto_3765 ?auto_3767 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3762 ?auto_3763 ?auto_3764 ?auto_3761 )
      ( GET-3IMAGE-VERIFY ?auto_3762 ?auto_3763 ?auto_3764 ?auto_3761 ?auto_3765 ?auto_3766 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3786 - DIRECTION
      ?auto_3787 - MODE
      ?auto_3788 - DIRECTION
      ?auto_3785 - MODE
      ?auto_3789 - DIRECTION
      ?auto_3790 - MODE
    )
    :vars
    (
      ?auto_3792 - INSTRUMENT
      ?auto_3794 - SATELLITE
      ?auto_3791 - DIRECTION
      ?auto_3795 - DIRECTION
      ?auto_3793 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3792 ) ( ON_BOARD ?auto_3792 ?auto_3794 ) ( SUPPORTS ?auto_3792 ?auto_3790 ) ( POWER_ON ?auto_3792 ) ( POINTING ?auto_3794 ?auto_3791 ) ( not ( = ?auto_3789 ?auto_3791 ) ) ( HAVE_IMAGE ?auto_3795 ?auto_3793 ) ( not ( = ?auto_3795 ?auto_3789 ) ) ( not ( = ?auto_3795 ?auto_3791 ) ) ( not ( = ?auto_3793 ?auto_3790 ) ) ( HAVE_IMAGE ?auto_3786 ?auto_3787 ) ( HAVE_IMAGE ?auto_3788 ?auto_3785 ) ( not ( = ?auto_3786 ?auto_3788 ) ) ( not ( = ?auto_3786 ?auto_3789 ) ) ( not ( = ?auto_3786 ?auto_3791 ) ) ( not ( = ?auto_3786 ?auto_3795 ) ) ( not ( = ?auto_3787 ?auto_3785 ) ) ( not ( = ?auto_3787 ?auto_3790 ) ) ( not ( = ?auto_3787 ?auto_3793 ) ) ( not ( = ?auto_3788 ?auto_3789 ) ) ( not ( = ?auto_3788 ?auto_3791 ) ) ( not ( = ?auto_3788 ?auto_3795 ) ) ( not ( = ?auto_3785 ?auto_3790 ) ) ( not ( = ?auto_3785 ?auto_3793 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3795 ?auto_3793 ?auto_3789 ?auto_3790 )
      ( GET-3IMAGE-VERIFY ?auto_3786 ?auto_3787 ?auto_3788 ?auto_3785 ?auto_3789 ?auto_3790 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3803 - DIRECTION
      ?auto_3804 - MODE
      ?auto_3805 - DIRECTION
      ?auto_3802 - MODE
      ?auto_3806 - DIRECTION
      ?auto_3807 - MODE
    )
    :vars
    (
      ?auto_3809 - INSTRUMENT
      ?auto_3811 - SATELLITE
      ?auto_3808 - DIRECTION
      ?auto_3812 - DIRECTION
      ?auto_3810 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3809 ) ( ON_BOARD ?auto_3809 ?auto_3811 ) ( SUPPORTS ?auto_3809 ?auto_3802 ) ( POWER_ON ?auto_3809 ) ( POINTING ?auto_3811 ?auto_3808 ) ( not ( = ?auto_3805 ?auto_3808 ) ) ( HAVE_IMAGE ?auto_3812 ?auto_3810 ) ( not ( = ?auto_3812 ?auto_3805 ) ) ( not ( = ?auto_3812 ?auto_3808 ) ) ( not ( = ?auto_3810 ?auto_3802 ) ) ( HAVE_IMAGE ?auto_3803 ?auto_3804 ) ( HAVE_IMAGE ?auto_3806 ?auto_3807 ) ( not ( = ?auto_3803 ?auto_3805 ) ) ( not ( = ?auto_3803 ?auto_3806 ) ) ( not ( = ?auto_3803 ?auto_3808 ) ) ( not ( = ?auto_3803 ?auto_3812 ) ) ( not ( = ?auto_3804 ?auto_3802 ) ) ( not ( = ?auto_3804 ?auto_3807 ) ) ( not ( = ?auto_3804 ?auto_3810 ) ) ( not ( = ?auto_3805 ?auto_3806 ) ) ( not ( = ?auto_3802 ?auto_3807 ) ) ( not ( = ?auto_3806 ?auto_3808 ) ) ( not ( = ?auto_3806 ?auto_3812 ) ) ( not ( = ?auto_3807 ?auto_3810 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3812 ?auto_3810 ?auto_3805 ?auto_3802 )
      ( GET-3IMAGE-VERIFY ?auto_3803 ?auto_3804 ?auto_3805 ?auto_3802 ?auto_3806 ?auto_3807 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3825 - DIRECTION
      ?auto_3826 - MODE
      ?auto_3827 - DIRECTION
      ?auto_3824 - MODE
      ?auto_3828 - DIRECTION
      ?auto_3829 - MODE
    )
    :vars
    (
      ?auto_3831 - INSTRUMENT
      ?auto_3832 - SATELLITE
      ?auto_3830 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_3831 ) ( ON_BOARD ?auto_3831 ?auto_3832 ) ( SUPPORTS ?auto_3831 ?auto_3826 ) ( POWER_ON ?auto_3831 ) ( POINTING ?auto_3832 ?auto_3830 ) ( not ( = ?auto_3825 ?auto_3830 ) ) ( HAVE_IMAGE ?auto_3827 ?auto_3824 ) ( not ( = ?auto_3827 ?auto_3825 ) ) ( not ( = ?auto_3827 ?auto_3830 ) ) ( not ( = ?auto_3824 ?auto_3826 ) ) ( HAVE_IMAGE ?auto_3828 ?auto_3829 ) ( not ( = ?auto_3825 ?auto_3828 ) ) ( not ( = ?auto_3826 ?auto_3829 ) ) ( not ( = ?auto_3827 ?auto_3828 ) ) ( not ( = ?auto_3824 ?auto_3829 ) ) ( not ( = ?auto_3828 ?auto_3830 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3827 ?auto_3824 ?auto_3825 ?auto_3826 )
      ( GET-3IMAGE-VERIFY ?auto_3825 ?auto_3826 ?auto_3827 ?auto_3824 ?auto_3828 ?auto_3829 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3855 - DIRECTION
      ?auto_3856 - MODE
      ?auto_3857 - DIRECTION
      ?auto_3854 - MODE
      ?auto_3858 - DIRECTION
      ?auto_3859 - MODE
    )
    :vars
    (
      ?auto_3861 - INSTRUMENT
      ?auto_3863 - SATELLITE
      ?auto_3860 - DIRECTION
      ?auto_3864 - DIRECTION
      ?auto_3862 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3861 ) ( ON_BOARD ?auto_3861 ?auto_3863 ) ( SUPPORTS ?auto_3861 ?auto_3856 ) ( POWER_ON ?auto_3861 ) ( POINTING ?auto_3863 ?auto_3860 ) ( not ( = ?auto_3855 ?auto_3860 ) ) ( HAVE_IMAGE ?auto_3864 ?auto_3862 ) ( not ( = ?auto_3864 ?auto_3855 ) ) ( not ( = ?auto_3864 ?auto_3860 ) ) ( not ( = ?auto_3862 ?auto_3856 ) ) ( HAVE_IMAGE ?auto_3857 ?auto_3854 ) ( HAVE_IMAGE ?auto_3858 ?auto_3859 ) ( not ( = ?auto_3855 ?auto_3857 ) ) ( not ( = ?auto_3855 ?auto_3858 ) ) ( not ( = ?auto_3856 ?auto_3854 ) ) ( not ( = ?auto_3856 ?auto_3859 ) ) ( not ( = ?auto_3857 ?auto_3858 ) ) ( not ( = ?auto_3857 ?auto_3860 ) ) ( not ( = ?auto_3857 ?auto_3864 ) ) ( not ( = ?auto_3854 ?auto_3859 ) ) ( not ( = ?auto_3854 ?auto_3862 ) ) ( not ( = ?auto_3858 ?auto_3860 ) ) ( not ( = ?auto_3858 ?auto_3864 ) ) ( not ( = ?auto_3859 ?auto_3862 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3864 ?auto_3862 ?auto_3855 ?auto_3856 )
      ( GET-3IMAGE-VERIFY ?auto_3855 ?auto_3856 ?auto_3857 ?auto_3854 ?auto_3858 ?auto_3859 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3946 - DIRECTION
      ?auto_3947 - MODE
      ?auto_3948 - DIRECTION
      ?auto_3945 - MODE
      ?auto_3949 - DIRECTION
      ?auto_3950 - MODE
    )
    :vars
    (
      ?auto_3951 - INSTRUMENT
      ?auto_3952 - SATELLITE
      ?auto_3953 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_3951 ?auto_3952 ) ( SUPPORTS ?auto_3951 ?auto_3950 ) ( POWER_ON ?auto_3951 ) ( POINTING ?auto_3952 ?auto_3953 ) ( not ( = ?auto_3949 ?auto_3953 ) ) ( HAVE_IMAGE ?auto_3946 ?auto_3945 ) ( not ( = ?auto_3946 ?auto_3949 ) ) ( not ( = ?auto_3946 ?auto_3953 ) ) ( not ( = ?auto_3945 ?auto_3950 ) ) ( CALIBRATION_TARGET ?auto_3951 ?auto_3953 ) ( NOT_CALIBRATED ?auto_3951 ) ( HAVE_IMAGE ?auto_3946 ?auto_3947 ) ( HAVE_IMAGE ?auto_3948 ?auto_3945 ) ( not ( = ?auto_3946 ?auto_3948 ) ) ( not ( = ?auto_3947 ?auto_3945 ) ) ( not ( = ?auto_3947 ?auto_3950 ) ) ( not ( = ?auto_3948 ?auto_3949 ) ) ( not ( = ?auto_3948 ?auto_3953 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3946 ?auto_3945 ?auto_3949 ?auto_3950 )
      ( GET-3IMAGE-VERIFY ?auto_3946 ?auto_3947 ?auto_3948 ?auto_3945 ?auto_3949 ?auto_3950 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3955 - DIRECTION
      ?auto_3956 - MODE
      ?auto_3957 - DIRECTION
      ?auto_3954 - MODE
      ?auto_3958 - DIRECTION
      ?auto_3959 - MODE
    )
    :vars
    (
      ?auto_3960 - INSTRUMENT
      ?auto_3961 - SATELLITE
      ?auto_3962 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_3960 ?auto_3961 ) ( SUPPORTS ?auto_3960 ?auto_3959 ) ( POWER_ON ?auto_3960 ) ( POINTING ?auto_3961 ?auto_3962 ) ( not ( = ?auto_3958 ?auto_3962 ) ) ( HAVE_IMAGE ?auto_3955 ?auto_3956 ) ( not ( = ?auto_3955 ?auto_3958 ) ) ( not ( = ?auto_3955 ?auto_3962 ) ) ( not ( = ?auto_3956 ?auto_3959 ) ) ( CALIBRATION_TARGET ?auto_3960 ?auto_3962 ) ( NOT_CALIBRATED ?auto_3960 ) ( HAVE_IMAGE ?auto_3957 ?auto_3954 ) ( not ( = ?auto_3955 ?auto_3957 ) ) ( not ( = ?auto_3956 ?auto_3954 ) ) ( not ( = ?auto_3957 ?auto_3958 ) ) ( not ( = ?auto_3957 ?auto_3962 ) ) ( not ( = ?auto_3954 ?auto_3959 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3955 ?auto_3956 ?auto_3958 ?auto_3959 )
      ( GET-3IMAGE-VERIFY ?auto_3955 ?auto_3956 ?auto_3957 ?auto_3954 ?auto_3958 ?auto_3959 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3964 - DIRECTION
      ?auto_3965 - MODE
      ?auto_3966 - DIRECTION
      ?auto_3963 - MODE
      ?auto_3967 - DIRECTION
      ?auto_3968 - MODE
    )
    :vars
    (
      ?auto_3969 - INSTRUMENT
      ?auto_3970 - SATELLITE
      ?auto_3971 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_3969 ?auto_3970 ) ( SUPPORTS ?auto_3969 ?auto_3963 ) ( POWER_ON ?auto_3969 ) ( POINTING ?auto_3970 ?auto_3971 ) ( not ( = ?auto_3966 ?auto_3971 ) ) ( HAVE_IMAGE ?auto_3967 ?auto_3968 ) ( not ( = ?auto_3967 ?auto_3966 ) ) ( not ( = ?auto_3967 ?auto_3971 ) ) ( not ( = ?auto_3968 ?auto_3963 ) ) ( CALIBRATION_TARGET ?auto_3969 ?auto_3971 ) ( NOT_CALIBRATED ?auto_3969 ) ( HAVE_IMAGE ?auto_3964 ?auto_3965 ) ( not ( = ?auto_3964 ?auto_3966 ) ) ( not ( = ?auto_3964 ?auto_3967 ) ) ( not ( = ?auto_3964 ?auto_3971 ) ) ( not ( = ?auto_3965 ?auto_3963 ) ) ( not ( = ?auto_3965 ?auto_3968 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3967 ?auto_3968 ?auto_3966 ?auto_3963 )
      ( GET-3IMAGE-VERIFY ?auto_3964 ?auto_3965 ?auto_3966 ?auto_3963 ?auto_3967 ?auto_3968 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3994 - DIRECTION
      ?auto_3995 - MODE
      ?auto_3996 - DIRECTION
      ?auto_3993 - MODE
      ?auto_3997 - DIRECTION
      ?auto_3998 - MODE
    )
    :vars
    (
      ?auto_3999 - INSTRUMENT
      ?auto_4000 - SATELLITE
      ?auto_4001 - DIRECTION
      ?auto_4002 - DIRECTION
      ?auto_4003 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_3999 ?auto_4000 ) ( SUPPORTS ?auto_3999 ?auto_3998 ) ( POWER_ON ?auto_3999 ) ( POINTING ?auto_4000 ?auto_4001 ) ( not ( = ?auto_3997 ?auto_4001 ) ) ( HAVE_IMAGE ?auto_4002 ?auto_4003 ) ( not ( = ?auto_4002 ?auto_3997 ) ) ( not ( = ?auto_4002 ?auto_4001 ) ) ( not ( = ?auto_4003 ?auto_3998 ) ) ( CALIBRATION_TARGET ?auto_3999 ?auto_4001 ) ( NOT_CALIBRATED ?auto_3999 ) ( HAVE_IMAGE ?auto_3994 ?auto_3995 ) ( HAVE_IMAGE ?auto_3996 ?auto_3993 ) ( not ( = ?auto_3994 ?auto_3996 ) ) ( not ( = ?auto_3994 ?auto_3997 ) ) ( not ( = ?auto_3994 ?auto_4001 ) ) ( not ( = ?auto_3994 ?auto_4002 ) ) ( not ( = ?auto_3995 ?auto_3993 ) ) ( not ( = ?auto_3995 ?auto_3998 ) ) ( not ( = ?auto_3995 ?auto_4003 ) ) ( not ( = ?auto_3996 ?auto_3997 ) ) ( not ( = ?auto_3996 ?auto_4001 ) ) ( not ( = ?auto_3996 ?auto_4002 ) ) ( not ( = ?auto_3993 ?auto_3998 ) ) ( not ( = ?auto_3993 ?auto_4003 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4002 ?auto_4003 ?auto_3997 ?auto_3998 )
      ( GET-3IMAGE-VERIFY ?auto_3994 ?auto_3995 ?auto_3996 ?auto_3993 ?auto_3997 ?auto_3998 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4011 - DIRECTION
      ?auto_4012 - MODE
      ?auto_4013 - DIRECTION
      ?auto_4010 - MODE
      ?auto_4014 - DIRECTION
      ?auto_4015 - MODE
    )
    :vars
    (
      ?auto_4016 - INSTRUMENT
      ?auto_4017 - SATELLITE
      ?auto_4018 - DIRECTION
      ?auto_4019 - DIRECTION
      ?auto_4020 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4016 ?auto_4017 ) ( SUPPORTS ?auto_4016 ?auto_4010 ) ( POWER_ON ?auto_4016 ) ( POINTING ?auto_4017 ?auto_4018 ) ( not ( = ?auto_4013 ?auto_4018 ) ) ( HAVE_IMAGE ?auto_4019 ?auto_4020 ) ( not ( = ?auto_4019 ?auto_4013 ) ) ( not ( = ?auto_4019 ?auto_4018 ) ) ( not ( = ?auto_4020 ?auto_4010 ) ) ( CALIBRATION_TARGET ?auto_4016 ?auto_4018 ) ( NOT_CALIBRATED ?auto_4016 ) ( HAVE_IMAGE ?auto_4011 ?auto_4012 ) ( HAVE_IMAGE ?auto_4014 ?auto_4015 ) ( not ( = ?auto_4011 ?auto_4013 ) ) ( not ( = ?auto_4011 ?auto_4014 ) ) ( not ( = ?auto_4011 ?auto_4018 ) ) ( not ( = ?auto_4011 ?auto_4019 ) ) ( not ( = ?auto_4012 ?auto_4010 ) ) ( not ( = ?auto_4012 ?auto_4015 ) ) ( not ( = ?auto_4012 ?auto_4020 ) ) ( not ( = ?auto_4013 ?auto_4014 ) ) ( not ( = ?auto_4010 ?auto_4015 ) ) ( not ( = ?auto_4014 ?auto_4018 ) ) ( not ( = ?auto_4014 ?auto_4019 ) ) ( not ( = ?auto_4015 ?auto_4020 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4019 ?auto_4020 ?auto_4013 ?auto_4010 )
      ( GET-3IMAGE-VERIFY ?auto_4011 ?auto_4012 ?auto_4013 ?auto_4010 ?auto_4014 ?auto_4015 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4033 - DIRECTION
      ?auto_4034 - MODE
      ?auto_4035 - DIRECTION
      ?auto_4032 - MODE
      ?auto_4036 - DIRECTION
      ?auto_4037 - MODE
    )
    :vars
    (
      ?auto_4038 - INSTRUMENT
      ?auto_4039 - SATELLITE
      ?auto_4040 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4038 ?auto_4039 ) ( SUPPORTS ?auto_4038 ?auto_4034 ) ( POWER_ON ?auto_4038 ) ( POINTING ?auto_4039 ?auto_4040 ) ( not ( = ?auto_4033 ?auto_4040 ) ) ( HAVE_IMAGE ?auto_4035 ?auto_4037 ) ( not ( = ?auto_4035 ?auto_4033 ) ) ( not ( = ?auto_4035 ?auto_4040 ) ) ( not ( = ?auto_4037 ?auto_4034 ) ) ( CALIBRATION_TARGET ?auto_4038 ?auto_4040 ) ( NOT_CALIBRATED ?auto_4038 ) ( HAVE_IMAGE ?auto_4035 ?auto_4032 ) ( HAVE_IMAGE ?auto_4036 ?auto_4037 ) ( not ( = ?auto_4033 ?auto_4036 ) ) ( not ( = ?auto_4034 ?auto_4032 ) ) ( not ( = ?auto_4035 ?auto_4036 ) ) ( not ( = ?auto_4032 ?auto_4037 ) ) ( not ( = ?auto_4036 ?auto_4040 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4035 ?auto_4037 ?auto_4033 ?auto_4034 )
      ( GET-3IMAGE-VERIFY ?auto_4033 ?auto_4034 ?auto_4035 ?auto_4032 ?auto_4036 ?auto_4037 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4042 - DIRECTION
      ?auto_4043 - MODE
      ?auto_4044 - DIRECTION
      ?auto_4041 - MODE
      ?auto_4045 - DIRECTION
      ?auto_4046 - MODE
    )
    :vars
    (
      ?auto_4047 - INSTRUMENT
      ?auto_4048 - SATELLITE
      ?auto_4049 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4047 ?auto_4048 ) ( SUPPORTS ?auto_4047 ?auto_4043 ) ( POWER_ON ?auto_4047 ) ( POINTING ?auto_4048 ?auto_4049 ) ( not ( = ?auto_4042 ?auto_4049 ) ) ( HAVE_IMAGE ?auto_4044 ?auto_4041 ) ( not ( = ?auto_4044 ?auto_4042 ) ) ( not ( = ?auto_4044 ?auto_4049 ) ) ( not ( = ?auto_4041 ?auto_4043 ) ) ( CALIBRATION_TARGET ?auto_4047 ?auto_4049 ) ( NOT_CALIBRATED ?auto_4047 ) ( HAVE_IMAGE ?auto_4045 ?auto_4046 ) ( not ( = ?auto_4042 ?auto_4045 ) ) ( not ( = ?auto_4043 ?auto_4046 ) ) ( not ( = ?auto_4044 ?auto_4045 ) ) ( not ( = ?auto_4041 ?auto_4046 ) ) ( not ( = ?auto_4045 ?auto_4049 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4044 ?auto_4041 ?auto_4042 ?auto_4043 )
      ( GET-3IMAGE-VERIFY ?auto_4042 ?auto_4043 ?auto_4044 ?auto_4041 ?auto_4045 ?auto_4046 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4066 - DIRECTION
      ?auto_4067 - MODE
      ?auto_4068 - DIRECTION
      ?auto_4065 - MODE
      ?auto_4069 - DIRECTION
      ?auto_4070 - MODE
    )
    :vars
    (
      ?auto_4071 - INSTRUMENT
      ?auto_4072 - SATELLITE
      ?auto_4073 - DIRECTION
      ?auto_4074 - DIRECTION
      ?auto_4075 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4071 ?auto_4072 ) ( SUPPORTS ?auto_4071 ?auto_4067 ) ( POWER_ON ?auto_4071 ) ( POINTING ?auto_4072 ?auto_4073 ) ( not ( = ?auto_4066 ?auto_4073 ) ) ( HAVE_IMAGE ?auto_4074 ?auto_4075 ) ( not ( = ?auto_4074 ?auto_4066 ) ) ( not ( = ?auto_4074 ?auto_4073 ) ) ( not ( = ?auto_4075 ?auto_4067 ) ) ( CALIBRATION_TARGET ?auto_4071 ?auto_4073 ) ( NOT_CALIBRATED ?auto_4071 ) ( HAVE_IMAGE ?auto_4068 ?auto_4065 ) ( HAVE_IMAGE ?auto_4069 ?auto_4070 ) ( not ( = ?auto_4066 ?auto_4068 ) ) ( not ( = ?auto_4066 ?auto_4069 ) ) ( not ( = ?auto_4067 ?auto_4065 ) ) ( not ( = ?auto_4067 ?auto_4070 ) ) ( not ( = ?auto_4068 ?auto_4069 ) ) ( not ( = ?auto_4068 ?auto_4073 ) ) ( not ( = ?auto_4068 ?auto_4074 ) ) ( not ( = ?auto_4065 ?auto_4070 ) ) ( not ( = ?auto_4065 ?auto_4075 ) ) ( not ( = ?auto_4069 ?auto_4073 ) ) ( not ( = ?auto_4069 ?auto_4074 ) ) ( not ( = ?auto_4070 ?auto_4075 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4074 ?auto_4075 ?auto_4066 ?auto_4067 )
      ( GET-3IMAGE-VERIFY ?auto_4066 ?auto_4067 ?auto_4068 ?auto_4065 ?auto_4069 ?auto_4070 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4166 - DIRECTION
      ?auto_4167 - MODE
      ?auto_4168 - DIRECTION
      ?auto_4165 - MODE
      ?auto_4169 - DIRECTION
      ?auto_4170 - MODE
    )
    :vars
    (
      ?auto_4173 - INSTRUMENT
      ?auto_4171 - SATELLITE
      ?auto_4172 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4173 ?auto_4171 ) ( SUPPORTS ?auto_4173 ?auto_4170 ) ( POINTING ?auto_4171 ?auto_4172 ) ( not ( = ?auto_4169 ?auto_4172 ) ) ( HAVE_IMAGE ?auto_4166 ?auto_4167 ) ( not ( = ?auto_4166 ?auto_4169 ) ) ( not ( = ?auto_4166 ?auto_4172 ) ) ( not ( = ?auto_4167 ?auto_4170 ) ) ( CALIBRATION_TARGET ?auto_4173 ?auto_4172 ) ( POWER_AVAIL ?auto_4171 ) ( HAVE_IMAGE ?auto_4168 ?auto_4165 ) ( not ( = ?auto_4166 ?auto_4168 ) ) ( not ( = ?auto_4167 ?auto_4165 ) ) ( not ( = ?auto_4168 ?auto_4169 ) ) ( not ( = ?auto_4168 ?auto_4172 ) ) ( not ( = ?auto_4165 ?auto_4170 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4166 ?auto_4167 ?auto_4169 ?auto_4170 )
      ( GET-3IMAGE-VERIFY ?auto_4166 ?auto_4167 ?auto_4168 ?auto_4165 ?auto_4169 ?auto_4170 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4175 - DIRECTION
      ?auto_4176 - MODE
      ?auto_4177 - DIRECTION
      ?auto_4174 - MODE
      ?auto_4178 - DIRECTION
      ?auto_4179 - MODE
    )
    :vars
    (
      ?auto_4182 - INSTRUMENT
      ?auto_4180 - SATELLITE
      ?auto_4181 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4182 ?auto_4180 ) ( SUPPORTS ?auto_4182 ?auto_4174 ) ( POINTING ?auto_4180 ?auto_4181 ) ( not ( = ?auto_4177 ?auto_4181 ) ) ( HAVE_IMAGE ?auto_4178 ?auto_4176 ) ( not ( = ?auto_4178 ?auto_4177 ) ) ( not ( = ?auto_4178 ?auto_4181 ) ) ( not ( = ?auto_4176 ?auto_4174 ) ) ( CALIBRATION_TARGET ?auto_4182 ?auto_4181 ) ( POWER_AVAIL ?auto_4180 ) ( HAVE_IMAGE ?auto_4175 ?auto_4176 ) ( HAVE_IMAGE ?auto_4178 ?auto_4179 ) ( not ( = ?auto_4175 ?auto_4177 ) ) ( not ( = ?auto_4175 ?auto_4178 ) ) ( not ( = ?auto_4175 ?auto_4181 ) ) ( not ( = ?auto_4176 ?auto_4179 ) ) ( not ( = ?auto_4174 ?auto_4179 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4178 ?auto_4176 ?auto_4177 ?auto_4174 )
      ( GET-3IMAGE-VERIFY ?auto_4175 ?auto_4176 ?auto_4177 ?auto_4174 ?auto_4178 ?auto_4179 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4208 - DIRECTION
      ?auto_4209 - MODE
      ?auto_4210 - DIRECTION
      ?auto_4207 - MODE
      ?auto_4211 - DIRECTION
      ?auto_4212 - MODE
    )
    :vars
    (
      ?auto_4217 - INSTRUMENT
      ?auto_4213 - SATELLITE
      ?auto_4216 - DIRECTION
      ?auto_4214 - DIRECTION
      ?auto_4215 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4217 ?auto_4213 ) ( SUPPORTS ?auto_4217 ?auto_4212 ) ( POINTING ?auto_4213 ?auto_4216 ) ( not ( = ?auto_4211 ?auto_4216 ) ) ( HAVE_IMAGE ?auto_4214 ?auto_4215 ) ( not ( = ?auto_4214 ?auto_4211 ) ) ( not ( = ?auto_4214 ?auto_4216 ) ) ( not ( = ?auto_4215 ?auto_4212 ) ) ( CALIBRATION_TARGET ?auto_4217 ?auto_4216 ) ( POWER_AVAIL ?auto_4213 ) ( HAVE_IMAGE ?auto_4208 ?auto_4209 ) ( HAVE_IMAGE ?auto_4210 ?auto_4207 ) ( not ( = ?auto_4208 ?auto_4210 ) ) ( not ( = ?auto_4208 ?auto_4211 ) ) ( not ( = ?auto_4208 ?auto_4216 ) ) ( not ( = ?auto_4208 ?auto_4214 ) ) ( not ( = ?auto_4209 ?auto_4207 ) ) ( not ( = ?auto_4209 ?auto_4212 ) ) ( not ( = ?auto_4209 ?auto_4215 ) ) ( not ( = ?auto_4210 ?auto_4211 ) ) ( not ( = ?auto_4210 ?auto_4216 ) ) ( not ( = ?auto_4210 ?auto_4214 ) ) ( not ( = ?auto_4207 ?auto_4212 ) ) ( not ( = ?auto_4207 ?auto_4215 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4214 ?auto_4215 ?auto_4211 ?auto_4212 )
      ( GET-3IMAGE-VERIFY ?auto_4208 ?auto_4209 ?auto_4210 ?auto_4207 ?auto_4211 ?auto_4212 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4225 - DIRECTION
      ?auto_4226 - MODE
      ?auto_4227 - DIRECTION
      ?auto_4224 - MODE
      ?auto_4228 - DIRECTION
      ?auto_4229 - MODE
    )
    :vars
    (
      ?auto_4234 - INSTRUMENT
      ?auto_4230 - SATELLITE
      ?auto_4233 - DIRECTION
      ?auto_4231 - DIRECTION
      ?auto_4232 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4234 ?auto_4230 ) ( SUPPORTS ?auto_4234 ?auto_4224 ) ( POINTING ?auto_4230 ?auto_4233 ) ( not ( = ?auto_4227 ?auto_4233 ) ) ( HAVE_IMAGE ?auto_4231 ?auto_4232 ) ( not ( = ?auto_4231 ?auto_4227 ) ) ( not ( = ?auto_4231 ?auto_4233 ) ) ( not ( = ?auto_4232 ?auto_4224 ) ) ( CALIBRATION_TARGET ?auto_4234 ?auto_4233 ) ( POWER_AVAIL ?auto_4230 ) ( HAVE_IMAGE ?auto_4225 ?auto_4226 ) ( HAVE_IMAGE ?auto_4228 ?auto_4229 ) ( not ( = ?auto_4225 ?auto_4227 ) ) ( not ( = ?auto_4225 ?auto_4228 ) ) ( not ( = ?auto_4225 ?auto_4233 ) ) ( not ( = ?auto_4225 ?auto_4231 ) ) ( not ( = ?auto_4226 ?auto_4224 ) ) ( not ( = ?auto_4226 ?auto_4229 ) ) ( not ( = ?auto_4226 ?auto_4232 ) ) ( not ( = ?auto_4227 ?auto_4228 ) ) ( not ( = ?auto_4224 ?auto_4229 ) ) ( not ( = ?auto_4228 ?auto_4233 ) ) ( not ( = ?auto_4228 ?auto_4231 ) ) ( not ( = ?auto_4229 ?auto_4232 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4231 ?auto_4232 ?auto_4227 ?auto_4224 )
      ( GET-3IMAGE-VERIFY ?auto_4225 ?auto_4226 ?auto_4227 ?auto_4224 ?auto_4228 ?auto_4229 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4247 - DIRECTION
      ?auto_4248 - MODE
      ?auto_4249 - DIRECTION
      ?auto_4246 - MODE
      ?auto_4250 - DIRECTION
      ?auto_4251 - MODE
    )
    :vars
    (
      ?auto_4254 - INSTRUMENT
      ?auto_4252 - SATELLITE
      ?auto_4253 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4254 ?auto_4252 ) ( SUPPORTS ?auto_4254 ?auto_4248 ) ( POINTING ?auto_4252 ?auto_4253 ) ( not ( = ?auto_4247 ?auto_4253 ) ) ( HAVE_IMAGE ?auto_4250 ?auto_4251 ) ( not ( = ?auto_4250 ?auto_4247 ) ) ( not ( = ?auto_4250 ?auto_4253 ) ) ( not ( = ?auto_4251 ?auto_4248 ) ) ( CALIBRATION_TARGET ?auto_4254 ?auto_4253 ) ( POWER_AVAIL ?auto_4252 ) ( HAVE_IMAGE ?auto_4249 ?auto_4246 ) ( not ( = ?auto_4247 ?auto_4249 ) ) ( not ( = ?auto_4248 ?auto_4246 ) ) ( not ( = ?auto_4249 ?auto_4250 ) ) ( not ( = ?auto_4249 ?auto_4253 ) ) ( not ( = ?auto_4246 ?auto_4251 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4250 ?auto_4251 ?auto_4247 ?auto_4248 )
      ( GET-3IMAGE-VERIFY ?auto_4247 ?auto_4248 ?auto_4249 ?auto_4246 ?auto_4250 ?auto_4251 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4277 - DIRECTION
      ?auto_4278 - MODE
      ?auto_4279 - DIRECTION
      ?auto_4276 - MODE
      ?auto_4280 - DIRECTION
      ?auto_4281 - MODE
    )
    :vars
    (
      ?auto_4286 - INSTRUMENT
      ?auto_4282 - SATELLITE
      ?auto_4285 - DIRECTION
      ?auto_4283 - DIRECTION
      ?auto_4284 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4286 ?auto_4282 ) ( SUPPORTS ?auto_4286 ?auto_4278 ) ( POINTING ?auto_4282 ?auto_4285 ) ( not ( = ?auto_4277 ?auto_4285 ) ) ( HAVE_IMAGE ?auto_4283 ?auto_4284 ) ( not ( = ?auto_4283 ?auto_4277 ) ) ( not ( = ?auto_4283 ?auto_4285 ) ) ( not ( = ?auto_4284 ?auto_4278 ) ) ( CALIBRATION_TARGET ?auto_4286 ?auto_4285 ) ( POWER_AVAIL ?auto_4282 ) ( HAVE_IMAGE ?auto_4279 ?auto_4276 ) ( HAVE_IMAGE ?auto_4280 ?auto_4281 ) ( not ( = ?auto_4277 ?auto_4279 ) ) ( not ( = ?auto_4277 ?auto_4280 ) ) ( not ( = ?auto_4278 ?auto_4276 ) ) ( not ( = ?auto_4278 ?auto_4281 ) ) ( not ( = ?auto_4279 ?auto_4280 ) ) ( not ( = ?auto_4279 ?auto_4285 ) ) ( not ( = ?auto_4279 ?auto_4283 ) ) ( not ( = ?auto_4276 ?auto_4281 ) ) ( not ( = ?auto_4276 ?auto_4284 ) ) ( not ( = ?auto_4280 ?auto_4285 ) ) ( not ( = ?auto_4280 ?auto_4283 ) ) ( not ( = ?auto_4281 ?auto_4284 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4283 ?auto_4284 ?auto_4277 ?auto_4278 )
      ( GET-3IMAGE-VERIFY ?auto_4277 ?auto_4278 ?auto_4279 ?auto_4276 ?auto_4280 ?auto_4281 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4329 - DIRECTION
      ?auto_4330 - MODE
    )
    :vars
    (
      ?auto_4335 - INSTRUMENT
      ?auto_4331 - SATELLITE
      ?auto_4334 - DIRECTION
      ?auto_4332 - DIRECTION
      ?auto_4333 - MODE
      ?auto_4336 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4335 ?auto_4331 ) ( SUPPORTS ?auto_4335 ?auto_4330 ) ( not ( = ?auto_4329 ?auto_4334 ) ) ( HAVE_IMAGE ?auto_4332 ?auto_4333 ) ( not ( = ?auto_4332 ?auto_4329 ) ) ( not ( = ?auto_4332 ?auto_4334 ) ) ( not ( = ?auto_4333 ?auto_4330 ) ) ( CALIBRATION_TARGET ?auto_4335 ?auto_4334 ) ( POWER_AVAIL ?auto_4331 ) ( POINTING ?auto_4331 ?auto_4336 ) ( not ( = ?auto_4334 ?auto_4336 ) ) ( not ( = ?auto_4329 ?auto_4336 ) ) ( not ( = ?auto_4332 ?auto_4336 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_4331 ?auto_4334 ?auto_4336 )
      ( GET-2IMAGE ?auto_4332 ?auto_4333 ?auto_4329 ?auto_4330 )
      ( GET-1IMAGE-VERIFY ?auto_4329 ?auto_4330 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4338 - DIRECTION
      ?auto_4339 - MODE
      ?auto_4340 - DIRECTION
      ?auto_4337 - MODE
    )
    :vars
    (
      ?auto_4344 - INSTRUMENT
      ?auto_4343 - SATELLITE
      ?auto_4342 - DIRECTION
      ?auto_4341 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4344 ?auto_4343 ) ( SUPPORTS ?auto_4344 ?auto_4337 ) ( not ( = ?auto_4340 ?auto_4342 ) ) ( HAVE_IMAGE ?auto_4338 ?auto_4339 ) ( not ( = ?auto_4338 ?auto_4340 ) ) ( not ( = ?auto_4338 ?auto_4342 ) ) ( not ( = ?auto_4339 ?auto_4337 ) ) ( CALIBRATION_TARGET ?auto_4344 ?auto_4342 ) ( POWER_AVAIL ?auto_4343 ) ( POINTING ?auto_4343 ?auto_4341 ) ( not ( = ?auto_4342 ?auto_4341 ) ) ( not ( = ?auto_4340 ?auto_4341 ) ) ( not ( = ?auto_4338 ?auto_4341 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4340 ?auto_4337 )
      ( GET-2IMAGE-VERIFY ?auto_4338 ?auto_4339 ?auto_4340 ?auto_4337 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4346 - DIRECTION
      ?auto_4347 - MODE
      ?auto_4348 - DIRECTION
      ?auto_4345 - MODE
    )
    :vars
    (
      ?auto_4350 - INSTRUMENT
      ?auto_4351 - SATELLITE
      ?auto_4352 - DIRECTION
      ?auto_4349 - DIRECTION
      ?auto_4353 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4350 ?auto_4351 ) ( SUPPORTS ?auto_4350 ?auto_4345 ) ( not ( = ?auto_4348 ?auto_4352 ) ) ( HAVE_IMAGE ?auto_4349 ?auto_4353 ) ( not ( = ?auto_4349 ?auto_4348 ) ) ( not ( = ?auto_4349 ?auto_4352 ) ) ( not ( = ?auto_4353 ?auto_4345 ) ) ( CALIBRATION_TARGET ?auto_4350 ?auto_4352 ) ( POWER_AVAIL ?auto_4351 ) ( POINTING ?auto_4351 ?auto_4346 ) ( not ( = ?auto_4352 ?auto_4346 ) ) ( not ( = ?auto_4348 ?auto_4346 ) ) ( not ( = ?auto_4349 ?auto_4346 ) ) ( HAVE_IMAGE ?auto_4346 ?auto_4347 ) ( not ( = ?auto_4347 ?auto_4345 ) ) ( not ( = ?auto_4347 ?auto_4353 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4349 ?auto_4353 ?auto_4348 ?auto_4345 )
      ( GET-2IMAGE-VERIFY ?auto_4346 ?auto_4347 ?auto_4348 ?auto_4345 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4355 - DIRECTION
      ?auto_4356 - MODE
      ?auto_4357 - DIRECTION
      ?auto_4354 - MODE
    )
    :vars
    (
      ?auto_4359 - INSTRUMENT
      ?auto_4360 - SATELLITE
      ?auto_4361 - DIRECTION
      ?auto_4358 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4359 ?auto_4360 ) ( SUPPORTS ?auto_4359 ?auto_4356 ) ( not ( = ?auto_4355 ?auto_4361 ) ) ( HAVE_IMAGE ?auto_4357 ?auto_4354 ) ( not ( = ?auto_4357 ?auto_4355 ) ) ( not ( = ?auto_4357 ?auto_4361 ) ) ( not ( = ?auto_4354 ?auto_4356 ) ) ( CALIBRATION_TARGET ?auto_4359 ?auto_4361 ) ( POWER_AVAIL ?auto_4360 ) ( POINTING ?auto_4360 ?auto_4358 ) ( not ( = ?auto_4361 ?auto_4358 ) ) ( not ( = ?auto_4355 ?auto_4358 ) ) ( not ( = ?auto_4357 ?auto_4358 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4357 ?auto_4354 ?auto_4355 ?auto_4356 )
      ( GET-2IMAGE-VERIFY ?auto_4355 ?auto_4356 ?auto_4357 ?auto_4354 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4363 - DIRECTION
      ?auto_4364 - MODE
      ?auto_4365 - DIRECTION
      ?auto_4362 - MODE
    )
    :vars
    (
      ?auto_4367 - INSTRUMENT
      ?auto_4368 - SATELLITE
      ?auto_4369 - DIRECTION
      ?auto_4366 - DIRECTION
      ?auto_4370 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4367 ?auto_4368 ) ( SUPPORTS ?auto_4367 ?auto_4364 ) ( not ( = ?auto_4363 ?auto_4369 ) ) ( HAVE_IMAGE ?auto_4366 ?auto_4370 ) ( not ( = ?auto_4366 ?auto_4363 ) ) ( not ( = ?auto_4366 ?auto_4369 ) ) ( not ( = ?auto_4370 ?auto_4364 ) ) ( CALIBRATION_TARGET ?auto_4367 ?auto_4369 ) ( POWER_AVAIL ?auto_4368 ) ( POINTING ?auto_4368 ?auto_4365 ) ( not ( = ?auto_4369 ?auto_4365 ) ) ( not ( = ?auto_4363 ?auto_4365 ) ) ( not ( = ?auto_4366 ?auto_4365 ) ) ( HAVE_IMAGE ?auto_4365 ?auto_4362 ) ( not ( = ?auto_4364 ?auto_4362 ) ) ( not ( = ?auto_4362 ?auto_4370 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4366 ?auto_4370 ?auto_4363 ?auto_4364 )
      ( GET-2IMAGE-VERIFY ?auto_4363 ?auto_4364 ?auto_4365 ?auto_4362 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4382 - DIRECTION
      ?auto_4383 - MODE
      ?auto_4384 - DIRECTION
      ?auto_4381 - MODE
      ?auto_4385 - DIRECTION
      ?auto_4386 - MODE
    )
    :vars
    (
      ?auto_4388 - INSTRUMENT
      ?auto_4389 - SATELLITE
      ?auto_4390 - DIRECTION
      ?auto_4387 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4388 ?auto_4389 ) ( SUPPORTS ?auto_4388 ?auto_4386 ) ( not ( = ?auto_4385 ?auto_4390 ) ) ( HAVE_IMAGE ?auto_4382 ?auto_4381 ) ( not ( = ?auto_4382 ?auto_4385 ) ) ( not ( = ?auto_4382 ?auto_4390 ) ) ( not ( = ?auto_4381 ?auto_4386 ) ) ( CALIBRATION_TARGET ?auto_4388 ?auto_4390 ) ( POWER_AVAIL ?auto_4389 ) ( POINTING ?auto_4389 ?auto_4387 ) ( not ( = ?auto_4390 ?auto_4387 ) ) ( not ( = ?auto_4385 ?auto_4387 ) ) ( not ( = ?auto_4382 ?auto_4387 ) ) ( HAVE_IMAGE ?auto_4382 ?auto_4383 ) ( HAVE_IMAGE ?auto_4384 ?auto_4381 ) ( not ( = ?auto_4382 ?auto_4384 ) ) ( not ( = ?auto_4383 ?auto_4381 ) ) ( not ( = ?auto_4383 ?auto_4386 ) ) ( not ( = ?auto_4384 ?auto_4385 ) ) ( not ( = ?auto_4384 ?auto_4390 ) ) ( not ( = ?auto_4384 ?auto_4387 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4382 ?auto_4381 ?auto_4385 ?auto_4386 )
      ( GET-3IMAGE-VERIFY ?auto_4382 ?auto_4383 ?auto_4384 ?auto_4381 ?auto_4385 ?auto_4386 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4392 - DIRECTION
      ?auto_4393 - MODE
      ?auto_4394 - DIRECTION
      ?auto_4391 - MODE
      ?auto_4395 - DIRECTION
      ?auto_4396 - MODE
    )
    :vars
    (
      ?auto_4397 - INSTRUMENT
      ?auto_4398 - SATELLITE
      ?auto_4399 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4397 ?auto_4398 ) ( SUPPORTS ?auto_4397 ?auto_4396 ) ( not ( = ?auto_4395 ?auto_4399 ) ) ( HAVE_IMAGE ?auto_4392 ?auto_4393 ) ( not ( = ?auto_4392 ?auto_4395 ) ) ( not ( = ?auto_4392 ?auto_4399 ) ) ( not ( = ?auto_4393 ?auto_4396 ) ) ( CALIBRATION_TARGET ?auto_4397 ?auto_4399 ) ( POWER_AVAIL ?auto_4398 ) ( POINTING ?auto_4398 ?auto_4394 ) ( not ( = ?auto_4399 ?auto_4394 ) ) ( not ( = ?auto_4395 ?auto_4394 ) ) ( not ( = ?auto_4392 ?auto_4394 ) ) ( HAVE_IMAGE ?auto_4394 ?auto_4391 ) ( not ( = ?auto_4393 ?auto_4391 ) ) ( not ( = ?auto_4391 ?auto_4396 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4392 ?auto_4393 ?auto_4395 ?auto_4396 )
      ( GET-3IMAGE-VERIFY ?auto_4392 ?auto_4393 ?auto_4394 ?auto_4391 ?auto_4395 ?auto_4396 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4401 - DIRECTION
      ?auto_4402 - MODE
      ?auto_4403 - DIRECTION
      ?auto_4400 - MODE
      ?auto_4404 - DIRECTION
      ?auto_4405 - MODE
    )
    :vars
    (
      ?auto_4407 - INSTRUMENT
      ?auto_4408 - SATELLITE
      ?auto_4409 - DIRECTION
      ?auto_4406 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4407 ?auto_4408 ) ( SUPPORTS ?auto_4407 ?auto_4400 ) ( not ( = ?auto_4403 ?auto_4409 ) ) ( HAVE_IMAGE ?auto_4404 ?auto_4405 ) ( not ( = ?auto_4404 ?auto_4403 ) ) ( not ( = ?auto_4404 ?auto_4409 ) ) ( not ( = ?auto_4405 ?auto_4400 ) ) ( CALIBRATION_TARGET ?auto_4407 ?auto_4409 ) ( POWER_AVAIL ?auto_4408 ) ( POINTING ?auto_4408 ?auto_4406 ) ( not ( = ?auto_4409 ?auto_4406 ) ) ( not ( = ?auto_4403 ?auto_4406 ) ) ( not ( = ?auto_4404 ?auto_4406 ) ) ( HAVE_IMAGE ?auto_4401 ?auto_4402 ) ( not ( = ?auto_4401 ?auto_4403 ) ) ( not ( = ?auto_4401 ?auto_4404 ) ) ( not ( = ?auto_4401 ?auto_4409 ) ) ( not ( = ?auto_4401 ?auto_4406 ) ) ( not ( = ?auto_4402 ?auto_4400 ) ) ( not ( = ?auto_4402 ?auto_4405 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4404 ?auto_4405 ?auto_4403 ?auto_4400 )
      ( GET-3IMAGE-VERIFY ?auto_4401 ?auto_4402 ?auto_4403 ?auto_4400 ?auto_4404 ?auto_4405 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4411 - DIRECTION
      ?auto_4412 - MODE
      ?auto_4413 - DIRECTION
      ?auto_4410 - MODE
      ?auto_4414 - DIRECTION
      ?auto_4415 - MODE
    )
    :vars
    (
      ?auto_4416 - INSTRUMENT
      ?auto_4417 - SATELLITE
      ?auto_4418 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4416 ?auto_4417 ) ( SUPPORTS ?auto_4416 ?auto_4410 ) ( not ( = ?auto_4413 ?auto_4418 ) ) ( HAVE_IMAGE ?auto_4411 ?auto_4412 ) ( not ( = ?auto_4411 ?auto_4413 ) ) ( not ( = ?auto_4411 ?auto_4418 ) ) ( not ( = ?auto_4412 ?auto_4410 ) ) ( CALIBRATION_TARGET ?auto_4416 ?auto_4418 ) ( POWER_AVAIL ?auto_4417 ) ( POINTING ?auto_4417 ?auto_4414 ) ( not ( = ?auto_4418 ?auto_4414 ) ) ( not ( = ?auto_4413 ?auto_4414 ) ) ( not ( = ?auto_4411 ?auto_4414 ) ) ( HAVE_IMAGE ?auto_4414 ?auto_4415 ) ( not ( = ?auto_4412 ?auto_4415 ) ) ( not ( = ?auto_4410 ?auto_4415 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4411 ?auto_4412 ?auto_4413 ?auto_4410 )
      ( GET-3IMAGE-VERIFY ?auto_4411 ?auto_4412 ?auto_4413 ?auto_4410 ?auto_4414 ?auto_4415 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4430 - DIRECTION
      ?auto_4431 - MODE
      ?auto_4432 - DIRECTION
      ?auto_4429 - MODE
      ?auto_4433 - DIRECTION
      ?auto_4434 - MODE
    )
    :vars
    (
      ?auto_4435 - INSTRUMENT
      ?auto_4436 - SATELLITE
      ?auto_4437 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4435 ?auto_4436 ) ( SUPPORTS ?auto_4435 ?auto_4434 ) ( not ( = ?auto_4433 ?auto_4437 ) ) ( HAVE_IMAGE ?auto_4432 ?auto_4429 ) ( not ( = ?auto_4432 ?auto_4433 ) ) ( not ( = ?auto_4432 ?auto_4437 ) ) ( not ( = ?auto_4429 ?auto_4434 ) ) ( CALIBRATION_TARGET ?auto_4435 ?auto_4437 ) ( POWER_AVAIL ?auto_4436 ) ( POINTING ?auto_4436 ?auto_4430 ) ( not ( = ?auto_4437 ?auto_4430 ) ) ( not ( = ?auto_4433 ?auto_4430 ) ) ( not ( = ?auto_4432 ?auto_4430 ) ) ( HAVE_IMAGE ?auto_4430 ?auto_4431 ) ( not ( = ?auto_4431 ?auto_4429 ) ) ( not ( = ?auto_4431 ?auto_4434 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4432 ?auto_4429 ?auto_4433 ?auto_4434 )
      ( GET-3IMAGE-VERIFY ?auto_4430 ?auto_4431 ?auto_4432 ?auto_4429 ?auto_4433 ?auto_4434 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4439 - DIRECTION
      ?auto_4440 - MODE
      ?auto_4441 - DIRECTION
      ?auto_4438 - MODE
      ?auto_4442 - DIRECTION
      ?auto_4443 - MODE
    )
    :vars
    (
      ?auto_4445 - INSTRUMENT
      ?auto_4446 - SATELLITE
      ?auto_4447 - DIRECTION
      ?auto_4444 - DIRECTION
      ?auto_4448 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4445 ?auto_4446 ) ( SUPPORTS ?auto_4445 ?auto_4443 ) ( not ( = ?auto_4442 ?auto_4447 ) ) ( HAVE_IMAGE ?auto_4444 ?auto_4448 ) ( not ( = ?auto_4444 ?auto_4442 ) ) ( not ( = ?auto_4444 ?auto_4447 ) ) ( not ( = ?auto_4448 ?auto_4443 ) ) ( CALIBRATION_TARGET ?auto_4445 ?auto_4447 ) ( POWER_AVAIL ?auto_4446 ) ( POINTING ?auto_4446 ?auto_4441 ) ( not ( = ?auto_4447 ?auto_4441 ) ) ( not ( = ?auto_4442 ?auto_4441 ) ) ( not ( = ?auto_4444 ?auto_4441 ) ) ( HAVE_IMAGE ?auto_4439 ?auto_4440 ) ( HAVE_IMAGE ?auto_4441 ?auto_4438 ) ( not ( = ?auto_4439 ?auto_4441 ) ) ( not ( = ?auto_4439 ?auto_4442 ) ) ( not ( = ?auto_4439 ?auto_4447 ) ) ( not ( = ?auto_4439 ?auto_4444 ) ) ( not ( = ?auto_4440 ?auto_4438 ) ) ( not ( = ?auto_4440 ?auto_4443 ) ) ( not ( = ?auto_4440 ?auto_4448 ) ) ( not ( = ?auto_4438 ?auto_4443 ) ) ( not ( = ?auto_4438 ?auto_4448 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4444 ?auto_4448 ?auto_4442 ?auto_4443 )
      ( GET-3IMAGE-VERIFY ?auto_4439 ?auto_4440 ?auto_4441 ?auto_4438 ?auto_4442 ?auto_4443 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4450 - DIRECTION
      ?auto_4451 - MODE
      ?auto_4452 - DIRECTION
      ?auto_4449 - MODE
      ?auto_4453 - DIRECTION
      ?auto_4454 - MODE
    )
    :vars
    (
      ?auto_4455 - INSTRUMENT
      ?auto_4456 - SATELLITE
      ?auto_4457 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4455 ?auto_4456 ) ( SUPPORTS ?auto_4455 ?auto_4449 ) ( not ( = ?auto_4452 ?auto_4457 ) ) ( HAVE_IMAGE ?auto_4453 ?auto_4454 ) ( not ( = ?auto_4453 ?auto_4452 ) ) ( not ( = ?auto_4453 ?auto_4457 ) ) ( not ( = ?auto_4454 ?auto_4449 ) ) ( CALIBRATION_TARGET ?auto_4455 ?auto_4457 ) ( POWER_AVAIL ?auto_4456 ) ( POINTING ?auto_4456 ?auto_4450 ) ( not ( = ?auto_4457 ?auto_4450 ) ) ( not ( = ?auto_4452 ?auto_4450 ) ) ( not ( = ?auto_4453 ?auto_4450 ) ) ( HAVE_IMAGE ?auto_4450 ?auto_4451 ) ( not ( = ?auto_4451 ?auto_4449 ) ) ( not ( = ?auto_4451 ?auto_4454 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4453 ?auto_4454 ?auto_4452 ?auto_4449 )
      ( GET-3IMAGE-VERIFY ?auto_4450 ?auto_4451 ?auto_4452 ?auto_4449 ?auto_4453 ?auto_4454 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4459 - DIRECTION
      ?auto_4460 - MODE
      ?auto_4461 - DIRECTION
      ?auto_4458 - MODE
      ?auto_4462 - DIRECTION
      ?auto_4463 - MODE
    )
    :vars
    (
      ?auto_4465 - INSTRUMENT
      ?auto_4466 - SATELLITE
      ?auto_4467 - DIRECTION
      ?auto_4464 - DIRECTION
      ?auto_4468 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4465 ?auto_4466 ) ( SUPPORTS ?auto_4465 ?auto_4458 ) ( not ( = ?auto_4461 ?auto_4467 ) ) ( HAVE_IMAGE ?auto_4464 ?auto_4468 ) ( not ( = ?auto_4464 ?auto_4461 ) ) ( not ( = ?auto_4464 ?auto_4467 ) ) ( not ( = ?auto_4468 ?auto_4458 ) ) ( CALIBRATION_TARGET ?auto_4465 ?auto_4467 ) ( POWER_AVAIL ?auto_4466 ) ( POINTING ?auto_4466 ?auto_4459 ) ( not ( = ?auto_4467 ?auto_4459 ) ) ( not ( = ?auto_4461 ?auto_4459 ) ) ( not ( = ?auto_4464 ?auto_4459 ) ) ( HAVE_IMAGE ?auto_4459 ?auto_4460 ) ( HAVE_IMAGE ?auto_4462 ?auto_4463 ) ( not ( = ?auto_4459 ?auto_4462 ) ) ( not ( = ?auto_4460 ?auto_4458 ) ) ( not ( = ?auto_4460 ?auto_4463 ) ) ( not ( = ?auto_4460 ?auto_4468 ) ) ( not ( = ?auto_4461 ?auto_4462 ) ) ( not ( = ?auto_4458 ?auto_4463 ) ) ( not ( = ?auto_4462 ?auto_4467 ) ) ( not ( = ?auto_4462 ?auto_4464 ) ) ( not ( = ?auto_4463 ?auto_4468 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4464 ?auto_4468 ?auto_4461 ?auto_4458 )
      ( GET-3IMAGE-VERIFY ?auto_4459 ?auto_4460 ?auto_4461 ?auto_4458 ?auto_4462 ?auto_4463 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4481 - DIRECTION
      ?auto_4482 - MODE
      ?auto_4483 - DIRECTION
      ?auto_4480 - MODE
      ?auto_4484 - DIRECTION
      ?auto_4485 - MODE
    )
    :vars
    (
      ?auto_4487 - INSTRUMENT
      ?auto_4488 - SATELLITE
      ?auto_4489 - DIRECTION
      ?auto_4486 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4487 ?auto_4488 ) ( SUPPORTS ?auto_4487 ?auto_4482 ) ( not ( = ?auto_4481 ?auto_4489 ) ) ( HAVE_IMAGE ?auto_4483 ?auto_4485 ) ( not ( = ?auto_4483 ?auto_4481 ) ) ( not ( = ?auto_4483 ?auto_4489 ) ) ( not ( = ?auto_4485 ?auto_4482 ) ) ( CALIBRATION_TARGET ?auto_4487 ?auto_4489 ) ( POWER_AVAIL ?auto_4488 ) ( POINTING ?auto_4488 ?auto_4486 ) ( not ( = ?auto_4489 ?auto_4486 ) ) ( not ( = ?auto_4481 ?auto_4486 ) ) ( not ( = ?auto_4483 ?auto_4486 ) ) ( HAVE_IMAGE ?auto_4483 ?auto_4480 ) ( HAVE_IMAGE ?auto_4484 ?auto_4485 ) ( not ( = ?auto_4481 ?auto_4484 ) ) ( not ( = ?auto_4482 ?auto_4480 ) ) ( not ( = ?auto_4483 ?auto_4484 ) ) ( not ( = ?auto_4480 ?auto_4485 ) ) ( not ( = ?auto_4484 ?auto_4489 ) ) ( not ( = ?auto_4484 ?auto_4486 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4483 ?auto_4485 ?auto_4481 ?auto_4482 )
      ( GET-3IMAGE-VERIFY ?auto_4481 ?auto_4482 ?auto_4483 ?auto_4480 ?auto_4484 ?auto_4485 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4491 - DIRECTION
      ?auto_4492 - MODE
      ?auto_4493 - DIRECTION
      ?auto_4490 - MODE
      ?auto_4494 - DIRECTION
      ?auto_4495 - MODE
    )
    :vars
    (
      ?auto_4496 - INSTRUMENT
      ?auto_4497 - SATELLITE
      ?auto_4498 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4496 ?auto_4497 ) ( SUPPORTS ?auto_4496 ?auto_4492 ) ( not ( = ?auto_4491 ?auto_4498 ) ) ( HAVE_IMAGE ?auto_4493 ?auto_4490 ) ( not ( = ?auto_4493 ?auto_4491 ) ) ( not ( = ?auto_4493 ?auto_4498 ) ) ( not ( = ?auto_4490 ?auto_4492 ) ) ( CALIBRATION_TARGET ?auto_4496 ?auto_4498 ) ( POWER_AVAIL ?auto_4497 ) ( POINTING ?auto_4497 ?auto_4494 ) ( not ( = ?auto_4498 ?auto_4494 ) ) ( not ( = ?auto_4491 ?auto_4494 ) ) ( not ( = ?auto_4493 ?auto_4494 ) ) ( HAVE_IMAGE ?auto_4494 ?auto_4495 ) ( not ( = ?auto_4492 ?auto_4495 ) ) ( not ( = ?auto_4490 ?auto_4495 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4493 ?auto_4490 ?auto_4491 ?auto_4492 )
      ( GET-3IMAGE-VERIFY ?auto_4491 ?auto_4492 ?auto_4493 ?auto_4490 ?auto_4494 ?auto_4495 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4510 - DIRECTION
      ?auto_4511 - MODE
      ?auto_4512 - DIRECTION
      ?auto_4509 - MODE
      ?auto_4513 - DIRECTION
      ?auto_4514 - MODE
    )
    :vars
    (
      ?auto_4515 - INSTRUMENT
      ?auto_4516 - SATELLITE
      ?auto_4517 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4515 ?auto_4516 ) ( SUPPORTS ?auto_4515 ?auto_4511 ) ( not ( = ?auto_4510 ?auto_4517 ) ) ( HAVE_IMAGE ?auto_4513 ?auto_4514 ) ( not ( = ?auto_4513 ?auto_4510 ) ) ( not ( = ?auto_4513 ?auto_4517 ) ) ( not ( = ?auto_4514 ?auto_4511 ) ) ( CALIBRATION_TARGET ?auto_4515 ?auto_4517 ) ( POWER_AVAIL ?auto_4516 ) ( POINTING ?auto_4516 ?auto_4512 ) ( not ( = ?auto_4517 ?auto_4512 ) ) ( not ( = ?auto_4510 ?auto_4512 ) ) ( not ( = ?auto_4513 ?auto_4512 ) ) ( HAVE_IMAGE ?auto_4512 ?auto_4509 ) ( not ( = ?auto_4511 ?auto_4509 ) ) ( not ( = ?auto_4509 ?auto_4514 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4513 ?auto_4514 ?auto_4510 ?auto_4511 )
      ( GET-3IMAGE-VERIFY ?auto_4510 ?auto_4511 ?auto_4512 ?auto_4509 ?auto_4513 ?auto_4514 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4519 - DIRECTION
      ?auto_4520 - MODE
      ?auto_4521 - DIRECTION
      ?auto_4518 - MODE
      ?auto_4522 - DIRECTION
      ?auto_4523 - MODE
    )
    :vars
    (
      ?auto_4525 - INSTRUMENT
      ?auto_4526 - SATELLITE
      ?auto_4527 - DIRECTION
      ?auto_4524 - DIRECTION
      ?auto_4528 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4525 ?auto_4526 ) ( SUPPORTS ?auto_4525 ?auto_4520 ) ( not ( = ?auto_4519 ?auto_4527 ) ) ( HAVE_IMAGE ?auto_4524 ?auto_4528 ) ( not ( = ?auto_4524 ?auto_4519 ) ) ( not ( = ?auto_4524 ?auto_4527 ) ) ( not ( = ?auto_4528 ?auto_4520 ) ) ( CALIBRATION_TARGET ?auto_4525 ?auto_4527 ) ( POWER_AVAIL ?auto_4526 ) ( POINTING ?auto_4526 ?auto_4522 ) ( not ( = ?auto_4527 ?auto_4522 ) ) ( not ( = ?auto_4519 ?auto_4522 ) ) ( not ( = ?auto_4524 ?auto_4522 ) ) ( HAVE_IMAGE ?auto_4521 ?auto_4518 ) ( HAVE_IMAGE ?auto_4522 ?auto_4523 ) ( not ( = ?auto_4519 ?auto_4521 ) ) ( not ( = ?auto_4520 ?auto_4518 ) ) ( not ( = ?auto_4520 ?auto_4523 ) ) ( not ( = ?auto_4521 ?auto_4522 ) ) ( not ( = ?auto_4521 ?auto_4527 ) ) ( not ( = ?auto_4521 ?auto_4524 ) ) ( not ( = ?auto_4518 ?auto_4523 ) ) ( not ( = ?auto_4518 ?auto_4528 ) ) ( not ( = ?auto_4523 ?auto_4528 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4524 ?auto_4528 ?auto_4519 ?auto_4520 )
      ( GET-3IMAGE-VERIFY ?auto_4519 ?auto_4520 ?auto_4521 ?auto_4518 ?auto_4522 ?auto_4523 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4573 - DIRECTION
      ?auto_4574 - MODE
    )
    :vars
    (
      ?auto_4577 - INSTRUMENT
      ?auto_4578 - SATELLITE
      ?auto_4579 - DIRECTION
      ?auto_4576 - DIRECTION
      ?auto_4580 - MODE
      ?auto_4575 - DIRECTION
      ?auto_4581 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4577 ?auto_4578 ) ( SUPPORTS ?auto_4577 ?auto_4574 ) ( not ( = ?auto_4573 ?auto_4579 ) ) ( HAVE_IMAGE ?auto_4576 ?auto_4580 ) ( not ( = ?auto_4576 ?auto_4573 ) ) ( not ( = ?auto_4576 ?auto_4579 ) ) ( not ( = ?auto_4580 ?auto_4574 ) ) ( CALIBRATION_TARGET ?auto_4577 ?auto_4579 ) ( POINTING ?auto_4578 ?auto_4575 ) ( not ( = ?auto_4579 ?auto_4575 ) ) ( not ( = ?auto_4573 ?auto_4575 ) ) ( not ( = ?auto_4576 ?auto_4575 ) ) ( ON_BOARD ?auto_4581 ?auto_4578 ) ( POWER_ON ?auto_4581 ) ( not ( = ?auto_4577 ?auto_4581 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_4581 ?auto_4578 )
      ( GET-2IMAGE ?auto_4576 ?auto_4580 ?auto_4573 ?auto_4574 )
      ( GET-1IMAGE-VERIFY ?auto_4573 ?auto_4574 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4583 - DIRECTION
      ?auto_4584 - MODE
      ?auto_4585 - DIRECTION
      ?auto_4582 - MODE
    )
    :vars
    (
      ?auto_4589 - INSTRUMENT
      ?auto_4588 - SATELLITE
      ?auto_4587 - DIRECTION
      ?auto_4586 - DIRECTION
      ?auto_4590 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4589 ?auto_4588 ) ( SUPPORTS ?auto_4589 ?auto_4582 ) ( not ( = ?auto_4585 ?auto_4587 ) ) ( HAVE_IMAGE ?auto_4583 ?auto_4584 ) ( not ( = ?auto_4583 ?auto_4585 ) ) ( not ( = ?auto_4583 ?auto_4587 ) ) ( not ( = ?auto_4584 ?auto_4582 ) ) ( CALIBRATION_TARGET ?auto_4589 ?auto_4587 ) ( POINTING ?auto_4588 ?auto_4586 ) ( not ( = ?auto_4587 ?auto_4586 ) ) ( not ( = ?auto_4585 ?auto_4586 ) ) ( not ( = ?auto_4583 ?auto_4586 ) ) ( ON_BOARD ?auto_4590 ?auto_4588 ) ( POWER_ON ?auto_4590 ) ( not ( = ?auto_4589 ?auto_4590 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4585 ?auto_4582 )
      ( GET-2IMAGE-VERIFY ?auto_4583 ?auto_4584 ?auto_4585 ?auto_4582 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4592 - DIRECTION
      ?auto_4593 - MODE
      ?auto_4594 - DIRECTION
      ?auto_4591 - MODE
    )
    :vars
    (
      ?auto_4595 - INSTRUMENT
      ?auto_4597 - SATELLITE
      ?auto_4596 - DIRECTION
      ?auto_4598 - DIRECTION
      ?auto_4599 - MODE
      ?auto_4600 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4595 ?auto_4597 ) ( SUPPORTS ?auto_4595 ?auto_4591 ) ( not ( = ?auto_4594 ?auto_4596 ) ) ( HAVE_IMAGE ?auto_4598 ?auto_4599 ) ( not ( = ?auto_4598 ?auto_4594 ) ) ( not ( = ?auto_4598 ?auto_4596 ) ) ( not ( = ?auto_4599 ?auto_4591 ) ) ( CALIBRATION_TARGET ?auto_4595 ?auto_4596 ) ( POINTING ?auto_4597 ?auto_4592 ) ( not ( = ?auto_4596 ?auto_4592 ) ) ( not ( = ?auto_4594 ?auto_4592 ) ) ( not ( = ?auto_4598 ?auto_4592 ) ) ( ON_BOARD ?auto_4600 ?auto_4597 ) ( POWER_ON ?auto_4600 ) ( not ( = ?auto_4595 ?auto_4600 ) ) ( HAVE_IMAGE ?auto_4592 ?auto_4593 ) ( not ( = ?auto_4593 ?auto_4591 ) ) ( not ( = ?auto_4593 ?auto_4599 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4598 ?auto_4599 ?auto_4594 ?auto_4591 )
      ( GET-2IMAGE-VERIFY ?auto_4592 ?auto_4593 ?auto_4594 ?auto_4591 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4602 - DIRECTION
      ?auto_4603 - MODE
      ?auto_4604 - DIRECTION
      ?auto_4601 - MODE
    )
    :vars
    (
      ?auto_4605 - INSTRUMENT
      ?auto_4607 - SATELLITE
      ?auto_4606 - DIRECTION
      ?auto_4608 - DIRECTION
      ?auto_4609 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4605 ?auto_4607 ) ( SUPPORTS ?auto_4605 ?auto_4603 ) ( not ( = ?auto_4602 ?auto_4606 ) ) ( HAVE_IMAGE ?auto_4604 ?auto_4601 ) ( not ( = ?auto_4604 ?auto_4602 ) ) ( not ( = ?auto_4604 ?auto_4606 ) ) ( not ( = ?auto_4601 ?auto_4603 ) ) ( CALIBRATION_TARGET ?auto_4605 ?auto_4606 ) ( POINTING ?auto_4607 ?auto_4608 ) ( not ( = ?auto_4606 ?auto_4608 ) ) ( not ( = ?auto_4602 ?auto_4608 ) ) ( not ( = ?auto_4604 ?auto_4608 ) ) ( ON_BOARD ?auto_4609 ?auto_4607 ) ( POWER_ON ?auto_4609 ) ( not ( = ?auto_4605 ?auto_4609 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4604 ?auto_4601 ?auto_4602 ?auto_4603 )
      ( GET-2IMAGE-VERIFY ?auto_4602 ?auto_4603 ?auto_4604 ?auto_4601 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4611 - DIRECTION
      ?auto_4612 - MODE
      ?auto_4613 - DIRECTION
      ?auto_4610 - MODE
    )
    :vars
    (
      ?auto_4614 - INSTRUMENT
      ?auto_4616 - SATELLITE
      ?auto_4615 - DIRECTION
      ?auto_4617 - DIRECTION
      ?auto_4618 - MODE
      ?auto_4619 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4614 ?auto_4616 ) ( SUPPORTS ?auto_4614 ?auto_4612 ) ( not ( = ?auto_4611 ?auto_4615 ) ) ( HAVE_IMAGE ?auto_4617 ?auto_4618 ) ( not ( = ?auto_4617 ?auto_4611 ) ) ( not ( = ?auto_4617 ?auto_4615 ) ) ( not ( = ?auto_4618 ?auto_4612 ) ) ( CALIBRATION_TARGET ?auto_4614 ?auto_4615 ) ( POINTING ?auto_4616 ?auto_4613 ) ( not ( = ?auto_4615 ?auto_4613 ) ) ( not ( = ?auto_4611 ?auto_4613 ) ) ( not ( = ?auto_4617 ?auto_4613 ) ) ( ON_BOARD ?auto_4619 ?auto_4616 ) ( POWER_ON ?auto_4619 ) ( not ( = ?auto_4614 ?auto_4619 ) ) ( HAVE_IMAGE ?auto_4613 ?auto_4610 ) ( not ( = ?auto_4612 ?auto_4610 ) ) ( not ( = ?auto_4610 ?auto_4618 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4617 ?auto_4618 ?auto_4611 ?auto_4612 )
      ( GET-2IMAGE-VERIFY ?auto_4611 ?auto_4612 ?auto_4613 ?auto_4610 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4632 - DIRECTION
      ?auto_4633 - MODE
      ?auto_4634 - DIRECTION
      ?auto_4631 - MODE
      ?auto_4635 - DIRECTION
      ?auto_4636 - MODE
    )
    :vars
    (
      ?auto_4637 - INSTRUMENT
      ?auto_4639 - SATELLITE
      ?auto_4638 - DIRECTION
      ?auto_4640 - DIRECTION
      ?auto_4641 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4637 ?auto_4639 ) ( SUPPORTS ?auto_4637 ?auto_4636 ) ( not ( = ?auto_4635 ?auto_4638 ) ) ( HAVE_IMAGE ?auto_4632 ?auto_4631 ) ( not ( = ?auto_4632 ?auto_4635 ) ) ( not ( = ?auto_4632 ?auto_4638 ) ) ( not ( = ?auto_4631 ?auto_4636 ) ) ( CALIBRATION_TARGET ?auto_4637 ?auto_4638 ) ( POINTING ?auto_4639 ?auto_4640 ) ( not ( = ?auto_4638 ?auto_4640 ) ) ( not ( = ?auto_4635 ?auto_4640 ) ) ( not ( = ?auto_4632 ?auto_4640 ) ) ( ON_BOARD ?auto_4641 ?auto_4639 ) ( POWER_ON ?auto_4641 ) ( not ( = ?auto_4637 ?auto_4641 ) ) ( HAVE_IMAGE ?auto_4632 ?auto_4633 ) ( HAVE_IMAGE ?auto_4634 ?auto_4631 ) ( not ( = ?auto_4632 ?auto_4634 ) ) ( not ( = ?auto_4633 ?auto_4631 ) ) ( not ( = ?auto_4633 ?auto_4636 ) ) ( not ( = ?auto_4634 ?auto_4635 ) ) ( not ( = ?auto_4634 ?auto_4638 ) ) ( not ( = ?auto_4634 ?auto_4640 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4632 ?auto_4631 ?auto_4635 ?auto_4636 )
      ( GET-3IMAGE-VERIFY ?auto_4632 ?auto_4633 ?auto_4634 ?auto_4631 ?auto_4635 ?auto_4636 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4643 - DIRECTION
      ?auto_4644 - MODE
      ?auto_4645 - DIRECTION
      ?auto_4642 - MODE
      ?auto_4646 - DIRECTION
      ?auto_4647 - MODE
    )
    :vars
    (
      ?auto_4648 - INSTRUMENT
      ?auto_4650 - SATELLITE
      ?auto_4649 - DIRECTION
      ?auto_4651 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4648 ?auto_4650 ) ( SUPPORTS ?auto_4648 ?auto_4647 ) ( not ( = ?auto_4646 ?auto_4649 ) ) ( HAVE_IMAGE ?auto_4643 ?auto_4644 ) ( not ( = ?auto_4643 ?auto_4646 ) ) ( not ( = ?auto_4643 ?auto_4649 ) ) ( not ( = ?auto_4644 ?auto_4647 ) ) ( CALIBRATION_TARGET ?auto_4648 ?auto_4649 ) ( POINTING ?auto_4650 ?auto_4645 ) ( not ( = ?auto_4649 ?auto_4645 ) ) ( not ( = ?auto_4646 ?auto_4645 ) ) ( not ( = ?auto_4643 ?auto_4645 ) ) ( ON_BOARD ?auto_4651 ?auto_4650 ) ( POWER_ON ?auto_4651 ) ( not ( = ?auto_4648 ?auto_4651 ) ) ( HAVE_IMAGE ?auto_4645 ?auto_4642 ) ( not ( = ?auto_4644 ?auto_4642 ) ) ( not ( = ?auto_4642 ?auto_4647 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4643 ?auto_4644 ?auto_4646 ?auto_4647 )
      ( GET-3IMAGE-VERIFY ?auto_4643 ?auto_4644 ?auto_4645 ?auto_4642 ?auto_4646 ?auto_4647 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4653 - DIRECTION
      ?auto_4654 - MODE
      ?auto_4655 - DIRECTION
      ?auto_4652 - MODE
      ?auto_4656 - DIRECTION
      ?auto_4657 - MODE
    )
    :vars
    (
      ?auto_4658 - INSTRUMENT
      ?auto_4660 - SATELLITE
      ?auto_4659 - DIRECTION
      ?auto_4661 - DIRECTION
      ?auto_4662 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4658 ?auto_4660 ) ( SUPPORTS ?auto_4658 ?auto_4652 ) ( not ( = ?auto_4655 ?auto_4659 ) ) ( HAVE_IMAGE ?auto_4656 ?auto_4657 ) ( not ( = ?auto_4656 ?auto_4655 ) ) ( not ( = ?auto_4656 ?auto_4659 ) ) ( not ( = ?auto_4657 ?auto_4652 ) ) ( CALIBRATION_TARGET ?auto_4658 ?auto_4659 ) ( POINTING ?auto_4660 ?auto_4661 ) ( not ( = ?auto_4659 ?auto_4661 ) ) ( not ( = ?auto_4655 ?auto_4661 ) ) ( not ( = ?auto_4656 ?auto_4661 ) ) ( ON_BOARD ?auto_4662 ?auto_4660 ) ( POWER_ON ?auto_4662 ) ( not ( = ?auto_4658 ?auto_4662 ) ) ( HAVE_IMAGE ?auto_4653 ?auto_4654 ) ( not ( = ?auto_4653 ?auto_4655 ) ) ( not ( = ?auto_4653 ?auto_4656 ) ) ( not ( = ?auto_4653 ?auto_4659 ) ) ( not ( = ?auto_4653 ?auto_4661 ) ) ( not ( = ?auto_4654 ?auto_4652 ) ) ( not ( = ?auto_4654 ?auto_4657 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4656 ?auto_4657 ?auto_4655 ?auto_4652 )
      ( GET-3IMAGE-VERIFY ?auto_4653 ?auto_4654 ?auto_4655 ?auto_4652 ?auto_4656 ?auto_4657 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4664 - DIRECTION
      ?auto_4665 - MODE
      ?auto_4666 - DIRECTION
      ?auto_4663 - MODE
      ?auto_4667 - DIRECTION
      ?auto_4668 - MODE
    )
    :vars
    (
      ?auto_4669 - INSTRUMENT
      ?auto_4671 - SATELLITE
      ?auto_4670 - DIRECTION
      ?auto_4672 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4669 ?auto_4671 ) ( SUPPORTS ?auto_4669 ?auto_4663 ) ( not ( = ?auto_4666 ?auto_4670 ) ) ( HAVE_IMAGE ?auto_4664 ?auto_4665 ) ( not ( = ?auto_4664 ?auto_4666 ) ) ( not ( = ?auto_4664 ?auto_4670 ) ) ( not ( = ?auto_4665 ?auto_4663 ) ) ( CALIBRATION_TARGET ?auto_4669 ?auto_4670 ) ( POINTING ?auto_4671 ?auto_4667 ) ( not ( = ?auto_4670 ?auto_4667 ) ) ( not ( = ?auto_4666 ?auto_4667 ) ) ( not ( = ?auto_4664 ?auto_4667 ) ) ( ON_BOARD ?auto_4672 ?auto_4671 ) ( POWER_ON ?auto_4672 ) ( not ( = ?auto_4669 ?auto_4672 ) ) ( HAVE_IMAGE ?auto_4667 ?auto_4668 ) ( not ( = ?auto_4665 ?auto_4668 ) ) ( not ( = ?auto_4663 ?auto_4668 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4664 ?auto_4665 ?auto_4666 ?auto_4663 )
      ( GET-3IMAGE-VERIFY ?auto_4664 ?auto_4665 ?auto_4666 ?auto_4663 ?auto_4667 ?auto_4668 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4685 - DIRECTION
      ?auto_4686 - MODE
      ?auto_4687 - DIRECTION
      ?auto_4684 - MODE
      ?auto_4688 - DIRECTION
      ?auto_4689 - MODE
    )
    :vars
    (
      ?auto_4690 - INSTRUMENT
      ?auto_4692 - SATELLITE
      ?auto_4691 - DIRECTION
      ?auto_4693 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4690 ?auto_4692 ) ( SUPPORTS ?auto_4690 ?auto_4689 ) ( not ( = ?auto_4688 ?auto_4691 ) ) ( HAVE_IMAGE ?auto_4687 ?auto_4684 ) ( not ( = ?auto_4687 ?auto_4688 ) ) ( not ( = ?auto_4687 ?auto_4691 ) ) ( not ( = ?auto_4684 ?auto_4689 ) ) ( CALIBRATION_TARGET ?auto_4690 ?auto_4691 ) ( POINTING ?auto_4692 ?auto_4685 ) ( not ( = ?auto_4691 ?auto_4685 ) ) ( not ( = ?auto_4688 ?auto_4685 ) ) ( not ( = ?auto_4687 ?auto_4685 ) ) ( ON_BOARD ?auto_4693 ?auto_4692 ) ( POWER_ON ?auto_4693 ) ( not ( = ?auto_4690 ?auto_4693 ) ) ( HAVE_IMAGE ?auto_4685 ?auto_4686 ) ( not ( = ?auto_4686 ?auto_4684 ) ) ( not ( = ?auto_4686 ?auto_4689 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4687 ?auto_4684 ?auto_4688 ?auto_4689 )
      ( GET-3IMAGE-VERIFY ?auto_4685 ?auto_4686 ?auto_4687 ?auto_4684 ?auto_4688 ?auto_4689 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4695 - DIRECTION
      ?auto_4696 - MODE
      ?auto_4697 - DIRECTION
      ?auto_4694 - MODE
      ?auto_4698 - DIRECTION
      ?auto_4699 - MODE
    )
    :vars
    (
      ?auto_4700 - INSTRUMENT
      ?auto_4702 - SATELLITE
      ?auto_4701 - DIRECTION
      ?auto_4703 - DIRECTION
      ?auto_4704 - MODE
      ?auto_4705 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4700 ?auto_4702 ) ( SUPPORTS ?auto_4700 ?auto_4699 ) ( not ( = ?auto_4698 ?auto_4701 ) ) ( HAVE_IMAGE ?auto_4703 ?auto_4704 ) ( not ( = ?auto_4703 ?auto_4698 ) ) ( not ( = ?auto_4703 ?auto_4701 ) ) ( not ( = ?auto_4704 ?auto_4699 ) ) ( CALIBRATION_TARGET ?auto_4700 ?auto_4701 ) ( POINTING ?auto_4702 ?auto_4697 ) ( not ( = ?auto_4701 ?auto_4697 ) ) ( not ( = ?auto_4698 ?auto_4697 ) ) ( not ( = ?auto_4703 ?auto_4697 ) ) ( ON_BOARD ?auto_4705 ?auto_4702 ) ( POWER_ON ?auto_4705 ) ( not ( = ?auto_4700 ?auto_4705 ) ) ( HAVE_IMAGE ?auto_4695 ?auto_4696 ) ( HAVE_IMAGE ?auto_4697 ?auto_4694 ) ( not ( = ?auto_4695 ?auto_4697 ) ) ( not ( = ?auto_4695 ?auto_4698 ) ) ( not ( = ?auto_4695 ?auto_4701 ) ) ( not ( = ?auto_4695 ?auto_4703 ) ) ( not ( = ?auto_4696 ?auto_4694 ) ) ( not ( = ?auto_4696 ?auto_4699 ) ) ( not ( = ?auto_4696 ?auto_4704 ) ) ( not ( = ?auto_4694 ?auto_4699 ) ) ( not ( = ?auto_4694 ?auto_4704 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4703 ?auto_4704 ?auto_4698 ?auto_4699 )
      ( GET-3IMAGE-VERIFY ?auto_4695 ?auto_4696 ?auto_4697 ?auto_4694 ?auto_4698 ?auto_4699 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4707 - DIRECTION
      ?auto_4708 - MODE
      ?auto_4709 - DIRECTION
      ?auto_4706 - MODE
      ?auto_4710 - DIRECTION
      ?auto_4711 - MODE
    )
    :vars
    (
      ?auto_4712 - INSTRUMENT
      ?auto_4714 - SATELLITE
      ?auto_4713 - DIRECTION
      ?auto_4715 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4712 ?auto_4714 ) ( SUPPORTS ?auto_4712 ?auto_4706 ) ( not ( = ?auto_4709 ?auto_4713 ) ) ( HAVE_IMAGE ?auto_4710 ?auto_4711 ) ( not ( = ?auto_4710 ?auto_4709 ) ) ( not ( = ?auto_4710 ?auto_4713 ) ) ( not ( = ?auto_4711 ?auto_4706 ) ) ( CALIBRATION_TARGET ?auto_4712 ?auto_4713 ) ( POINTING ?auto_4714 ?auto_4707 ) ( not ( = ?auto_4713 ?auto_4707 ) ) ( not ( = ?auto_4709 ?auto_4707 ) ) ( not ( = ?auto_4710 ?auto_4707 ) ) ( ON_BOARD ?auto_4715 ?auto_4714 ) ( POWER_ON ?auto_4715 ) ( not ( = ?auto_4712 ?auto_4715 ) ) ( HAVE_IMAGE ?auto_4707 ?auto_4708 ) ( not ( = ?auto_4708 ?auto_4706 ) ) ( not ( = ?auto_4708 ?auto_4711 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4710 ?auto_4711 ?auto_4709 ?auto_4706 )
      ( GET-3IMAGE-VERIFY ?auto_4707 ?auto_4708 ?auto_4709 ?auto_4706 ?auto_4710 ?auto_4711 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4717 - DIRECTION
      ?auto_4718 - MODE
      ?auto_4719 - DIRECTION
      ?auto_4716 - MODE
      ?auto_4720 - DIRECTION
      ?auto_4721 - MODE
    )
    :vars
    (
      ?auto_4722 - INSTRUMENT
      ?auto_4724 - SATELLITE
      ?auto_4723 - DIRECTION
      ?auto_4725 - DIRECTION
      ?auto_4726 - MODE
      ?auto_4727 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4722 ?auto_4724 ) ( SUPPORTS ?auto_4722 ?auto_4716 ) ( not ( = ?auto_4719 ?auto_4723 ) ) ( HAVE_IMAGE ?auto_4725 ?auto_4726 ) ( not ( = ?auto_4725 ?auto_4719 ) ) ( not ( = ?auto_4725 ?auto_4723 ) ) ( not ( = ?auto_4726 ?auto_4716 ) ) ( CALIBRATION_TARGET ?auto_4722 ?auto_4723 ) ( POINTING ?auto_4724 ?auto_4717 ) ( not ( = ?auto_4723 ?auto_4717 ) ) ( not ( = ?auto_4719 ?auto_4717 ) ) ( not ( = ?auto_4725 ?auto_4717 ) ) ( ON_BOARD ?auto_4727 ?auto_4724 ) ( POWER_ON ?auto_4727 ) ( not ( = ?auto_4722 ?auto_4727 ) ) ( HAVE_IMAGE ?auto_4717 ?auto_4718 ) ( HAVE_IMAGE ?auto_4720 ?auto_4721 ) ( not ( = ?auto_4717 ?auto_4720 ) ) ( not ( = ?auto_4718 ?auto_4716 ) ) ( not ( = ?auto_4718 ?auto_4721 ) ) ( not ( = ?auto_4718 ?auto_4726 ) ) ( not ( = ?auto_4719 ?auto_4720 ) ) ( not ( = ?auto_4716 ?auto_4721 ) ) ( not ( = ?auto_4720 ?auto_4723 ) ) ( not ( = ?auto_4720 ?auto_4725 ) ) ( not ( = ?auto_4721 ?auto_4726 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4725 ?auto_4726 ?auto_4719 ?auto_4716 )
      ( GET-3IMAGE-VERIFY ?auto_4717 ?auto_4718 ?auto_4719 ?auto_4716 ?auto_4720 ?auto_4721 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4741 - DIRECTION
      ?auto_4742 - MODE
      ?auto_4743 - DIRECTION
      ?auto_4740 - MODE
      ?auto_4744 - DIRECTION
      ?auto_4745 - MODE
    )
    :vars
    (
      ?auto_4746 - INSTRUMENT
      ?auto_4748 - SATELLITE
      ?auto_4747 - DIRECTION
      ?auto_4749 - DIRECTION
      ?auto_4750 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4746 ?auto_4748 ) ( SUPPORTS ?auto_4746 ?auto_4742 ) ( not ( = ?auto_4741 ?auto_4747 ) ) ( HAVE_IMAGE ?auto_4743 ?auto_4745 ) ( not ( = ?auto_4743 ?auto_4741 ) ) ( not ( = ?auto_4743 ?auto_4747 ) ) ( not ( = ?auto_4745 ?auto_4742 ) ) ( CALIBRATION_TARGET ?auto_4746 ?auto_4747 ) ( POINTING ?auto_4748 ?auto_4749 ) ( not ( = ?auto_4747 ?auto_4749 ) ) ( not ( = ?auto_4741 ?auto_4749 ) ) ( not ( = ?auto_4743 ?auto_4749 ) ) ( ON_BOARD ?auto_4750 ?auto_4748 ) ( POWER_ON ?auto_4750 ) ( not ( = ?auto_4746 ?auto_4750 ) ) ( HAVE_IMAGE ?auto_4743 ?auto_4740 ) ( HAVE_IMAGE ?auto_4744 ?auto_4745 ) ( not ( = ?auto_4741 ?auto_4744 ) ) ( not ( = ?auto_4742 ?auto_4740 ) ) ( not ( = ?auto_4743 ?auto_4744 ) ) ( not ( = ?auto_4740 ?auto_4745 ) ) ( not ( = ?auto_4744 ?auto_4747 ) ) ( not ( = ?auto_4744 ?auto_4749 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4743 ?auto_4745 ?auto_4741 ?auto_4742 )
      ( GET-3IMAGE-VERIFY ?auto_4741 ?auto_4742 ?auto_4743 ?auto_4740 ?auto_4744 ?auto_4745 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4752 - DIRECTION
      ?auto_4753 - MODE
      ?auto_4754 - DIRECTION
      ?auto_4751 - MODE
      ?auto_4755 - DIRECTION
      ?auto_4756 - MODE
    )
    :vars
    (
      ?auto_4757 - INSTRUMENT
      ?auto_4759 - SATELLITE
      ?auto_4758 - DIRECTION
      ?auto_4760 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4757 ?auto_4759 ) ( SUPPORTS ?auto_4757 ?auto_4753 ) ( not ( = ?auto_4752 ?auto_4758 ) ) ( HAVE_IMAGE ?auto_4754 ?auto_4751 ) ( not ( = ?auto_4754 ?auto_4752 ) ) ( not ( = ?auto_4754 ?auto_4758 ) ) ( not ( = ?auto_4751 ?auto_4753 ) ) ( CALIBRATION_TARGET ?auto_4757 ?auto_4758 ) ( POINTING ?auto_4759 ?auto_4755 ) ( not ( = ?auto_4758 ?auto_4755 ) ) ( not ( = ?auto_4752 ?auto_4755 ) ) ( not ( = ?auto_4754 ?auto_4755 ) ) ( ON_BOARD ?auto_4760 ?auto_4759 ) ( POWER_ON ?auto_4760 ) ( not ( = ?auto_4757 ?auto_4760 ) ) ( HAVE_IMAGE ?auto_4755 ?auto_4756 ) ( not ( = ?auto_4753 ?auto_4756 ) ) ( not ( = ?auto_4751 ?auto_4756 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4754 ?auto_4751 ?auto_4752 ?auto_4753 )
      ( GET-3IMAGE-VERIFY ?auto_4752 ?auto_4753 ?auto_4754 ?auto_4751 ?auto_4755 ?auto_4756 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4773 - DIRECTION
      ?auto_4774 - MODE
      ?auto_4775 - DIRECTION
      ?auto_4772 - MODE
      ?auto_4776 - DIRECTION
      ?auto_4777 - MODE
    )
    :vars
    (
      ?auto_4778 - INSTRUMENT
      ?auto_4780 - SATELLITE
      ?auto_4779 - DIRECTION
      ?auto_4781 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4778 ?auto_4780 ) ( SUPPORTS ?auto_4778 ?auto_4774 ) ( not ( = ?auto_4773 ?auto_4779 ) ) ( HAVE_IMAGE ?auto_4776 ?auto_4777 ) ( not ( = ?auto_4776 ?auto_4773 ) ) ( not ( = ?auto_4776 ?auto_4779 ) ) ( not ( = ?auto_4777 ?auto_4774 ) ) ( CALIBRATION_TARGET ?auto_4778 ?auto_4779 ) ( POINTING ?auto_4780 ?auto_4775 ) ( not ( = ?auto_4779 ?auto_4775 ) ) ( not ( = ?auto_4773 ?auto_4775 ) ) ( not ( = ?auto_4776 ?auto_4775 ) ) ( ON_BOARD ?auto_4781 ?auto_4780 ) ( POWER_ON ?auto_4781 ) ( not ( = ?auto_4778 ?auto_4781 ) ) ( HAVE_IMAGE ?auto_4775 ?auto_4772 ) ( not ( = ?auto_4774 ?auto_4772 ) ) ( not ( = ?auto_4772 ?auto_4777 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4776 ?auto_4777 ?auto_4773 ?auto_4774 )
      ( GET-3IMAGE-VERIFY ?auto_4773 ?auto_4774 ?auto_4775 ?auto_4772 ?auto_4776 ?auto_4777 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4783 - DIRECTION
      ?auto_4784 - MODE
      ?auto_4785 - DIRECTION
      ?auto_4782 - MODE
      ?auto_4786 - DIRECTION
      ?auto_4787 - MODE
    )
    :vars
    (
      ?auto_4788 - INSTRUMENT
      ?auto_4790 - SATELLITE
      ?auto_4789 - DIRECTION
      ?auto_4791 - DIRECTION
      ?auto_4792 - MODE
      ?auto_4793 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4788 ?auto_4790 ) ( SUPPORTS ?auto_4788 ?auto_4784 ) ( not ( = ?auto_4783 ?auto_4789 ) ) ( HAVE_IMAGE ?auto_4791 ?auto_4792 ) ( not ( = ?auto_4791 ?auto_4783 ) ) ( not ( = ?auto_4791 ?auto_4789 ) ) ( not ( = ?auto_4792 ?auto_4784 ) ) ( CALIBRATION_TARGET ?auto_4788 ?auto_4789 ) ( POINTING ?auto_4790 ?auto_4786 ) ( not ( = ?auto_4789 ?auto_4786 ) ) ( not ( = ?auto_4783 ?auto_4786 ) ) ( not ( = ?auto_4791 ?auto_4786 ) ) ( ON_BOARD ?auto_4793 ?auto_4790 ) ( POWER_ON ?auto_4793 ) ( not ( = ?auto_4788 ?auto_4793 ) ) ( HAVE_IMAGE ?auto_4785 ?auto_4782 ) ( HAVE_IMAGE ?auto_4786 ?auto_4787 ) ( not ( = ?auto_4783 ?auto_4785 ) ) ( not ( = ?auto_4784 ?auto_4782 ) ) ( not ( = ?auto_4784 ?auto_4787 ) ) ( not ( = ?auto_4785 ?auto_4786 ) ) ( not ( = ?auto_4785 ?auto_4789 ) ) ( not ( = ?auto_4785 ?auto_4791 ) ) ( not ( = ?auto_4782 ?auto_4787 ) ) ( not ( = ?auto_4782 ?auto_4792 ) ) ( not ( = ?auto_4787 ?auto_4792 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4791 ?auto_4792 ?auto_4783 ?auto_4784 )
      ( GET-3IMAGE-VERIFY ?auto_4783 ?auto_4784 ?auto_4785 ?auto_4782 ?auto_4786 ?auto_4787 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4905 - DIRECTION
      ?auto_4906 - MODE
      ?auto_4907 - DIRECTION
      ?auto_4904 - MODE
      ?auto_4908 - DIRECTION
      ?auto_4909 - MODE
    )
    :vars
    (
      ?auto_4914 - INSTRUMENT
      ?auto_4912 - SATELLITE
      ?auto_4913 - DIRECTION
      ?auto_4910 - DIRECTION
      ?auto_4911 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4914 ?auto_4912 ) ( SUPPORTS ?auto_4914 ?auto_4904 ) ( not ( = ?auto_4907 ?auto_4913 ) ) ( HAVE_IMAGE ?auto_4905 ?auto_4906 ) ( not ( = ?auto_4905 ?auto_4907 ) ) ( not ( = ?auto_4905 ?auto_4913 ) ) ( not ( = ?auto_4906 ?auto_4904 ) ) ( CALIBRATION_TARGET ?auto_4914 ?auto_4913 ) ( POINTING ?auto_4912 ?auto_4910 ) ( not ( = ?auto_4913 ?auto_4910 ) ) ( not ( = ?auto_4907 ?auto_4910 ) ) ( not ( = ?auto_4905 ?auto_4910 ) ) ( ON_BOARD ?auto_4911 ?auto_4912 ) ( POWER_ON ?auto_4911 ) ( not ( = ?auto_4914 ?auto_4911 ) ) ( HAVE_IMAGE ?auto_4908 ?auto_4909 ) ( not ( = ?auto_4905 ?auto_4908 ) ) ( not ( = ?auto_4906 ?auto_4909 ) ) ( not ( = ?auto_4907 ?auto_4908 ) ) ( not ( = ?auto_4904 ?auto_4909 ) ) ( not ( = ?auto_4908 ?auto_4913 ) ) ( not ( = ?auto_4908 ?auto_4910 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4905 ?auto_4906 ?auto_4907 ?auto_4904 )
      ( GET-3IMAGE-VERIFY ?auto_4905 ?auto_4906 ?auto_4907 ?auto_4904 ?auto_4908 ?auto_4909 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4993 - DIRECTION
      ?auto_4994 - MODE
      ?auto_4995 - DIRECTION
      ?auto_4992 - MODE
      ?auto_4996 - DIRECTION
      ?auto_4997 - MODE
    )
    :vars
    (
      ?auto_5002 - INSTRUMENT
      ?auto_5000 - SATELLITE
      ?auto_5001 - DIRECTION
      ?auto_4998 - DIRECTION
      ?auto_4999 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5002 ?auto_5000 ) ( SUPPORTS ?auto_5002 ?auto_4994 ) ( not ( = ?auto_4993 ?auto_5001 ) ) ( HAVE_IMAGE ?auto_4996 ?auto_4992 ) ( not ( = ?auto_4996 ?auto_4993 ) ) ( not ( = ?auto_4996 ?auto_5001 ) ) ( not ( = ?auto_4992 ?auto_4994 ) ) ( CALIBRATION_TARGET ?auto_5002 ?auto_5001 ) ( POINTING ?auto_5000 ?auto_4998 ) ( not ( = ?auto_5001 ?auto_4998 ) ) ( not ( = ?auto_4993 ?auto_4998 ) ) ( not ( = ?auto_4996 ?auto_4998 ) ) ( ON_BOARD ?auto_4999 ?auto_5000 ) ( POWER_ON ?auto_4999 ) ( not ( = ?auto_5002 ?auto_4999 ) ) ( HAVE_IMAGE ?auto_4995 ?auto_4992 ) ( HAVE_IMAGE ?auto_4996 ?auto_4997 ) ( not ( = ?auto_4993 ?auto_4995 ) ) ( not ( = ?auto_4994 ?auto_4997 ) ) ( not ( = ?auto_4995 ?auto_4996 ) ) ( not ( = ?auto_4995 ?auto_5001 ) ) ( not ( = ?auto_4995 ?auto_4998 ) ) ( not ( = ?auto_4992 ?auto_4997 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4996 ?auto_4992 ?auto_4993 ?auto_4994 )
      ( GET-3IMAGE-VERIFY ?auto_4993 ?auto_4994 ?auto_4995 ?auto_4992 ?auto_4996 ?auto_4997 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_5094 - DIRECTION
      ?auto_5095 - MODE
    )
    :vars
    (
      ?auto_5101 - INSTRUMENT
      ?auto_5099 - SATELLITE
      ?auto_5100 - DIRECTION
      ?auto_5098 - DIRECTION
      ?auto_5102 - MODE
      ?auto_5096 - DIRECTION
      ?auto_5097 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5101 ?auto_5099 ) ( SUPPORTS ?auto_5101 ?auto_5095 ) ( not ( = ?auto_5094 ?auto_5100 ) ) ( HAVE_IMAGE ?auto_5098 ?auto_5102 ) ( not ( = ?auto_5098 ?auto_5094 ) ) ( not ( = ?auto_5098 ?auto_5100 ) ) ( not ( = ?auto_5102 ?auto_5095 ) ) ( CALIBRATION_TARGET ?auto_5101 ?auto_5100 ) ( not ( = ?auto_5100 ?auto_5096 ) ) ( not ( = ?auto_5094 ?auto_5096 ) ) ( not ( = ?auto_5098 ?auto_5096 ) ) ( ON_BOARD ?auto_5097 ?auto_5099 ) ( POWER_ON ?auto_5097 ) ( not ( = ?auto_5101 ?auto_5097 ) ) ( POINTING ?auto_5099 ?auto_5100 ) )
    :subtasks
    ( ( !TURN_TO ?auto_5099 ?auto_5096 ?auto_5100 )
      ( GET-2IMAGE ?auto_5098 ?auto_5102 ?auto_5094 ?auto_5095 )
      ( GET-1IMAGE-VERIFY ?auto_5094 ?auto_5095 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_5104 - DIRECTION
      ?auto_5105 - MODE
      ?auto_5106 - DIRECTION
      ?auto_5103 - MODE
    )
    :vars
    (
      ?auto_5107 - INSTRUMENT
      ?auto_5108 - SATELLITE
      ?auto_5110 - DIRECTION
      ?auto_5111 - DIRECTION
      ?auto_5109 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5107 ?auto_5108 ) ( SUPPORTS ?auto_5107 ?auto_5103 ) ( not ( = ?auto_5106 ?auto_5110 ) ) ( HAVE_IMAGE ?auto_5104 ?auto_5105 ) ( not ( = ?auto_5104 ?auto_5106 ) ) ( not ( = ?auto_5104 ?auto_5110 ) ) ( not ( = ?auto_5105 ?auto_5103 ) ) ( CALIBRATION_TARGET ?auto_5107 ?auto_5110 ) ( not ( = ?auto_5110 ?auto_5111 ) ) ( not ( = ?auto_5106 ?auto_5111 ) ) ( not ( = ?auto_5104 ?auto_5111 ) ) ( ON_BOARD ?auto_5109 ?auto_5108 ) ( POWER_ON ?auto_5109 ) ( not ( = ?auto_5107 ?auto_5109 ) ) ( POINTING ?auto_5108 ?auto_5110 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_5106 ?auto_5103 )
      ( GET-2IMAGE-VERIFY ?auto_5104 ?auto_5105 ?auto_5106 ?auto_5103 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_5123 - DIRECTION
      ?auto_5124 - MODE
      ?auto_5125 - DIRECTION
      ?auto_5122 - MODE
    )
    :vars
    (
      ?auto_5127 - INSTRUMENT
      ?auto_5126 - SATELLITE
      ?auto_5130 - DIRECTION
      ?auto_5128 - DIRECTION
      ?auto_5129 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5127 ?auto_5126 ) ( SUPPORTS ?auto_5127 ?auto_5124 ) ( not ( = ?auto_5123 ?auto_5130 ) ) ( HAVE_IMAGE ?auto_5125 ?auto_5122 ) ( not ( = ?auto_5125 ?auto_5123 ) ) ( not ( = ?auto_5125 ?auto_5130 ) ) ( not ( = ?auto_5122 ?auto_5124 ) ) ( CALIBRATION_TARGET ?auto_5127 ?auto_5130 ) ( not ( = ?auto_5130 ?auto_5128 ) ) ( not ( = ?auto_5123 ?auto_5128 ) ) ( not ( = ?auto_5125 ?auto_5128 ) ) ( ON_BOARD ?auto_5129 ?auto_5126 ) ( POWER_ON ?auto_5129 ) ( not ( = ?auto_5127 ?auto_5129 ) ) ( POINTING ?auto_5126 ?auto_5130 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5125 ?auto_5122 ?auto_5123 ?auto_5124 )
      ( GET-2IMAGE-VERIFY ?auto_5123 ?auto_5124 ?auto_5125 ?auto_5122 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5153 - DIRECTION
      ?auto_5154 - MODE
      ?auto_5155 - DIRECTION
      ?auto_5152 - MODE
      ?auto_5156 - DIRECTION
      ?auto_5157 - MODE
    )
    :vars
    (
      ?auto_5159 - INSTRUMENT
      ?auto_5158 - SATELLITE
      ?auto_5162 - DIRECTION
      ?auto_5160 - DIRECTION
      ?auto_5161 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5159 ?auto_5158 ) ( SUPPORTS ?auto_5159 ?auto_5157 ) ( not ( = ?auto_5156 ?auto_5162 ) ) ( HAVE_IMAGE ?auto_5153 ?auto_5154 ) ( not ( = ?auto_5153 ?auto_5156 ) ) ( not ( = ?auto_5153 ?auto_5162 ) ) ( not ( = ?auto_5154 ?auto_5157 ) ) ( CALIBRATION_TARGET ?auto_5159 ?auto_5162 ) ( not ( = ?auto_5162 ?auto_5160 ) ) ( not ( = ?auto_5156 ?auto_5160 ) ) ( not ( = ?auto_5153 ?auto_5160 ) ) ( ON_BOARD ?auto_5161 ?auto_5158 ) ( POWER_ON ?auto_5161 ) ( not ( = ?auto_5159 ?auto_5161 ) ) ( POINTING ?auto_5158 ?auto_5162 ) ( HAVE_IMAGE ?auto_5155 ?auto_5152 ) ( not ( = ?auto_5153 ?auto_5155 ) ) ( not ( = ?auto_5154 ?auto_5152 ) ) ( not ( = ?auto_5155 ?auto_5156 ) ) ( not ( = ?auto_5155 ?auto_5162 ) ) ( not ( = ?auto_5155 ?auto_5160 ) ) ( not ( = ?auto_5152 ?auto_5157 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5153 ?auto_5154 ?auto_5156 ?auto_5157 )
      ( GET-3IMAGE-VERIFY ?auto_5153 ?auto_5154 ?auto_5155 ?auto_5152 ?auto_5156 ?auto_5157 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5174 - DIRECTION
      ?auto_5175 - MODE
      ?auto_5176 - DIRECTION
      ?auto_5173 - MODE
      ?auto_5177 - DIRECTION
      ?auto_5178 - MODE
    )
    :vars
    (
      ?auto_5180 - INSTRUMENT
      ?auto_5179 - SATELLITE
      ?auto_5183 - DIRECTION
      ?auto_5181 - DIRECTION
      ?auto_5182 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5180 ?auto_5179 ) ( SUPPORTS ?auto_5180 ?auto_5173 ) ( not ( = ?auto_5176 ?auto_5183 ) ) ( HAVE_IMAGE ?auto_5174 ?auto_5175 ) ( not ( = ?auto_5174 ?auto_5176 ) ) ( not ( = ?auto_5174 ?auto_5183 ) ) ( not ( = ?auto_5175 ?auto_5173 ) ) ( CALIBRATION_TARGET ?auto_5180 ?auto_5183 ) ( not ( = ?auto_5183 ?auto_5181 ) ) ( not ( = ?auto_5176 ?auto_5181 ) ) ( not ( = ?auto_5174 ?auto_5181 ) ) ( ON_BOARD ?auto_5182 ?auto_5179 ) ( POWER_ON ?auto_5182 ) ( not ( = ?auto_5180 ?auto_5182 ) ) ( POINTING ?auto_5179 ?auto_5183 ) ( HAVE_IMAGE ?auto_5177 ?auto_5178 ) ( not ( = ?auto_5174 ?auto_5177 ) ) ( not ( = ?auto_5175 ?auto_5178 ) ) ( not ( = ?auto_5176 ?auto_5177 ) ) ( not ( = ?auto_5173 ?auto_5178 ) ) ( not ( = ?auto_5177 ?auto_5183 ) ) ( not ( = ?auto_5177 ?auto_5181 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5174 ?auto_5175 ?auto_5176 ?auto_5173 )
      ( GET-3IMAGE-VERIFY ?auto_5174 ?auto_5175 ?auto_5176 ?auto_5173 ?auto_5177 ?auto_5178 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5262 - DIRECTION
      ?auto_5263 - MODE
      ?auto_5264 - DIRECTION
      ?auto_5261 - MODE
      ?auto_5265 - DIRECTION
      ?auto_5266 - MODE
    )
    :vars
    (
      ?auto_5268 - INSTRUMENT
      ?auto_5267 - SATELLITE
      ?auto_5271 - DIRECTION
      ?auto_5269 - DIRECTION
      ?auto_5270 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5268 ?auto_5267 ) ( SUPPORTS ?auto_5268 ?auto_5263 ) ( not ( = ?auto_5262 ?auto_5271 ) ) ( HAVE_IMAGE ?auto_5264 ?auto_5261 ) ( not ( = ?auto_5264 ?auto_5262 ) ) ( not ( = ?auto_5264 ?auto_5271 ) ) ( not ( = ?auto_5261 ?auto_5263 ) ) ( CALIBRATION_TARGET ?auto_5268 ?auto_5271 ) ( not ( = ?auto_5271 ?auto_5269 ) ) ( not ( = ?auto_5262 ?auto_5269 ) ) ( not ( = ?auto_5264 ?auto_5269 ) ) ( ON_BOARD ?auto_5270 ?auto_5267 ) ( POWER_ON ?auto_5270 ) ( not ( = ?auto_5268 ?auto_5270 ) ) ( POINTING ?auto_5267 ?auto_5271 ) ( HAVE_IMAGE ?auto_5265 ?auto_5266 ) ( not ( = ?auto_5262 ?auto_5265 ) ) ( not ( = ?auto_5263 ?auto_5266 ) ) ( not ( = ?auto_5264 ?auto_5265 ) ) ( not ( = ?auto_5261 ?auto_5266 ) ) ( not ( = ?auto_5265 ?auto_5271 ) ) ( not ( = ?auto_5265 ?auto_5269 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5264 ?auto_5261 ?auto_5262 ?auto_5263 )
      ( GET-3IMAGE-VERIFY ?auto_5262 ?auto_5263 ?auto_5264 ?auto_5261 ?auto_5265 ?auto_5266 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5670 - DIRECTION
      ?auto_5671 - MODE
      ?auto_5672 - DIRECTION
      ?auto_5669 - MODE
      ?auto_5673 - DIRECTION
      ?auto_5674 - MODE
    )
    :vars
    (
      ?auto_5675 - INSTRUMENT
      ?auto_5677 - SATELLITE
      ?auto_5676 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_5675 ?auto_5677 ) ( SUPPORTS ?auto_5675 ?auto_5674 ) ( POINTING ?auto_5677 ?auto_5676 ) ( not ( = ?auto_5673 ?auto_5676 ) ) ( HAVE_IMAGE ?auto_5670 ?auto_5669 ) ( not ( = ?auto_5670 ?auto_5673 ) ) ( not ( = ?auto_5670 ?auto_5676 ) ) ( not ( = ?auto_5669 ?auto_5674 ) ) ( CALIBRATION_TARGET ?auto_5675 ?auto_5676 ) ( POWER_AVAIL ?auto_5677 ) ( HAVE_IMAGE ?auto_5670 ?auto_5671 ) ( HAVE_IMAGE ?auto_5672 ?auto_5669 ) ( not ( = ?auto_5670 ?auto_5672 ) ) ( not ( = ?auto_5671 ?auto_5669 ) ) ( not ( = ?auto_5671 ?auto_5674 ) ) ( not ( = ?auto_5672 ?auto_5673 ) ) ( not ( = ?auto_5672 ?auto_5676 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5670 ?auto_5669 ?auto_5673 ?auto_5674 )
      ( GET-3IMAGE-VERIFY ?auto_5670 ?auto_5671 ?auto_5672 ?auto_5669 ?auto_5673 ?auto_5674 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5766 - DIRECTION
      ?auto_5767 - MODE
      ?auto_5768 - DIRECTION
      ?auto_5765 - MODE
      ?auto_5769 - DIRECTION
      ?auto_5770 - MODE
    )
    :vars
    (
      ?auto_5771 - INSTRUMENT
      ?auto_5773 - SATELLITE
      ?auto_5772 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_5771 ?auto_5773 ) ( SUPPORTS ?auto_5771 ?auto_5767 ) ( POINTING ?auto_5773 ?auto_5772 ) ( not ( = ?auto_5766 ?auto_5772 ) ) ( HAVE_IMAGE ?auto_5768 ?auto_5770 ) ( not ( = ?auto_5768 ?auto_5766 ) ) ( not ( = ?auto_5768 ?auto_5772 ) ) ( not ( = ?auto_5770 ?auto_5767 ) ) ( CALIBRATION_TARGET ?auto_5771 ?auto_5772 ) ( POWER_AVAIL ?auto_5773 ) ( HAVE_IMAGE ?auto_5768 ?auto_5765 ) ( HAVE_IMAGE ?auto_5769 ?auto_5770 ) ( not ( = ?auto_5766 ?auto_5769 ) ) ( not ( = ?auto_5767 ?auto_5765 ) ) ( not ( = ?auto_5768 ?auto_5769 ) ) ( not ( = ?auto_5765 ?auto_5770 ) ) ( not ( = ?auto_5769 ?auto_5772 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5768 ?auto_5770 ?auto_5766 ?auto_5767 )
      ( GET-3IMAGE-VERIFY ?auto_5766 ?auto_5767 ?auto_5768 ?auto_5765 ?auto_5769 ?auto_5770 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5892 - DIRECTION
      ?auto_5893 - MODE
      ?auto_5894 - DIRECTION
      ?auto_5891 - MODE
      ?auto_5895 - DIRECTION
      ?auto_5896 - MODE
    )
    :vars
    (
      ?auto_5898 - INSTRUMENT
      ?auto_5897 - SATELLITE
      ?auto_5899 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_5898 ?auto_5897 ) ( SUPPORTS ?auto_5898 ?auto_5896 ) ( not ( = ?auto_5895 ?auto_5899 ) ) ( HAVE_IMAGE ?auto_5892 ?auto_5891 ) ( not ( = ?auto_5892 ?auto_5895 ) ) ( not ( = ?auto_5892 ?auto_5899 ) ) ( not ( = ?auto_5891 ?auto_5896 ) ) ( CALIBRATION_TARGET ?auto_5898 ?auto_5899 ) ( POWER_AVAIL ?auto_5897 ) ( POINTING ?auto_5897 ?auto_5892 ) ( HAVE_IMAGE ?auto_5892 ?auto_5893 ) ( HAVE_IMAGE ?auto_5894 ?auto_5891 ) ( not ( = ?auto_5892 ?auto_5894 ) ) ( not ( = ?auto_5893 ?auto_5891 ) ) ( not ( = ?auto_5893 ?auto_5896 ) ) ( not ( = ?auto_5894 ?auto_5895 ) ) ( not ( = ?auto_5894 ?auto_5899 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5892 ?auto_5891 ?auto_5895 ?auto_5896 )
      ( GET-3IMAGE-VERIFY ?auto_5892 ?auto_5893 ?auto_5894 ?auto_5891 ?auto_5895 ?auto_5896 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5910 - DIRECTION
      ?auto_5911 - MODE
      ?auto_5912 - DIRECTION
      ?auto_5909 - MODE
      ?auto_5913 - DIRECTION
      ?auto_5914 - MODE
    )
    :vars
    (
      ?auto_5916 - INSTRUMENT
      ?auto_5915 - SATELLITE
      ?auto_5917 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_5916 ?auto_5915 ) ( SUPPORTS ?auto_5916 ?auto_5909 ) ( not ( = ?auto_5912 ?auto_5917 ) ) ( HAVE_IMAGE ?auto_5913 ?auto_5911 ) ( not ( = ?auto_5913 ?auto_5912 ) ) ( not ( = ?auto_5913 ?auto_5917 ) ) ( not ( = ?auto_5911 ?auto_5909 ) ) ( CALIBRATION_TARGET ?auto_5916 ?auto_5917 ) ( POWER_AVAIL ?auto_5915 ) ( POINTING ?auto_5915 ?auto_5913 ) ( HAVE_IMAGE ?auto_5910 ?auto_5911 ) ( HAVE_IMAGE ?auto_5913 ?auto_5914 ) ( not ( = ?auto_5910 ?auto_5912 ) ) ( not ( = ?auto_5910 ?auto_5913 ) ) ( not ( = ?auto_5910 ?auto_5917 ) ) ( not ( = ?auto_5911 ?auto_5914 ) ) ( not ( = ?auto_5909 ?auto_5914 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5913 ?auto_5911 ?auto_5912 ?auto_5909 )
      ( GET-3IMAGE-VERIFY ?auto_5910 ?auto_5911 ?auto_5912 ?auto_5909 ?auto_5913 ?auto_5914 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5988 - DIRECTION
      ?auto_5989 - MODE
      ?auto_5990 - DIRECTION
      ?auto_5987 - MODE
      ?auto_5991 - DIRECTION
      ?auto_5992 - MODE
    )
    :vars
    (
      ?auto_5994 - INSTRUMENT
      ?auto_5993 - SATELLITE
      ?auto_5995 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_5994 ?auto_5993 ) ( SUPPORTS ?auto_5994 ?auto_5989 ) ( not ( = ?auto_5988 ?auto_5995 ) ) ( HAVE_IMAGE ?auto_5990 ?auto_5992 ) ( not ( = ?auto_5990 ?auto_5988 ) ) ( not ( = ?auto_5990 ?auto_5995 ) ) ( not ( = ?auto_5992 ?auto_5989 ) ) ( CALIBRATION_TARGET ?auto_5994 ?auto_5995 ) ( POWER_AVAIL ?auto_5993 ) ( POINTING ?auto_5993 ?auto_5990 ) ( HAVE_IMAGE ?auto_5990 ?auto_5987 ) ( HAVE_IMAGE ?auto_5991 ?auto_5992 ) ( not ( = ?auto_5988 ?auto_5991 ) ) ( not ( = ?auto_5989 ?auto_5987 ) ) ( not ( = ?auto_5990 ?auto_5991 ) ) ( not ( = ?auto_5987 ?auto_5992 ) ) ( not ( = ?auto_5991 ?auto_5995 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5990 ?auto_5992 ?auto_5988 ?auto_5989 )
      ( GET-3IMAGE-VERIFY ?auto_5988 ?auto_5989 ?auto_5990 ?auto_5987 ?auto_5991 ?auto_5992 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6117 - DIRECTION
      ?auto_6118 - MODE
      ?auto_6119 - DIRECTION
      ?auto_6116 - MODE
      ?auto_6120 - DIRECTION
      ?auto_6121 - MODE
    )
    :vars
    (
      ?auto_6125 - INSTRUMENT
      ?auto_6122 - SATELLITE
      ?auto_6124 - DIRECTION
      ?auto_6123 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6125 ?auto_6122 ) ( SUPPORTS ?auto_6125 ?auto_6121 ) ( not ( = ?auto_6120 ?auto_6124 ) ) ( HAVE_IMAGE ?auto_6117 ?auto_6116 ) ( not ( = ?auto_6117 ?auto_6120 ) ) ( not ( = ?auto_6117 ?auto_6124 ) ) ( not ( = ?auto_6116 ?auto_6121 ) ) ( CALIBRATION_TARGET ?auto_6125 ?auto_6124 ) ( POINTING ?auto_6122 ?auto_6117 ) ( ON_BOARD ?auto_6123 ?auto_6122 ) ( POWER_ON ?auto_6123 ) ( not ( = ?auto_6125 ?auto_6123 ) ) ( HAVE_IMAGE ?auto_6117 ?auto_6118 ) ( HAVE_IMAGE ?auto_6119 ?auto_6116 ) ( not ( = ?auto_6117 ?auto_6119 ) ) ( not ( = ?auto_6118 ?auto_6116 ) ) ( not ( = ?auto_6118 ?auto_6121 ) ) ( not ( = ?auto_6119 ?auto_6120 ) ) ( not ( = ?auto_6119 ?auto_6124 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6117 ?auto_6116 ?auto_6120 ?auto_6121 )
      ( GET-3IMAGE-VERIFY ?auto_6117 ?auto_6118 ?auto_6119 ?auto_6116 ?auto_6120 ?auto_6121 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6223 - DIRECTION
      ?auto_6224 - MODE
      ?auto_6225 - DIRECTION
      ?auto_6222 - MODE
      ?auto_6226 - DIRECTION
      ?auto_6227 - MODE
    )
    :vars
    (
      ?auto_6231 - INSTRUMENT
      ?auto_6228 - SATELLITE
      ?auto_6230 - DIRECTION
      ?auto_6229 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6231 ?auto_6228 ) ( SUPPORTS ?auto_6231 ?auto_6224 ) ( not ( = ?auto_6223 ?auto_6230 ) ) ( HAVE_IMAGE ?auto_6226 ?auto_6227 ) ( not ( = ?auto_6226 ?auto_6223 ) ) ( not ( = ?auto_6226 ?auto_6230 ) ) ( not ( = ?auto_6227 ?auto_6224 ) ) ( CALIBRATION_TARGET ?auto_6231 ?auto_6230 ) ( POINTING ?auto_6228 ?auto_6226 ) ( ON_BOARD ?auto_6229 ?auto_6228 ) ( POWER_ON ?auto_6229 ) ( not ( = ?auto_6231 ?auto_6229 ) ) ( HAVE_IMAGE ?auto_6225 ?auto_6222 ) ( not ( = ?auto_6223 ?auto_6225 ) ) ( not ( = ?auto_6224 ?auto_6222 ) ) ( not ( = ?auto_6225 ?auto_6226 ) ) ( not ( = ?auto_6225 ?auto_6230 ) ) ( not ( = ?auto_6222 ?auto_6227 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6226 ?auto_6227 ?auto_6223 ?auto_6224 )
      ( GET-3IMAGE-VERIFY ?auto_6223 ?auto_6224 ?auto_6225 ?auto_6222 ?auto_6226 ?auto_6227 ) )
  )

)

