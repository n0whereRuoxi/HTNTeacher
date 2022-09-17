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
      ?auto_2287 - DIRECTION
      ?auto_2288 - MODE
    )
    :vars
    (
      ?auto_2289 - INSTRUMENT
      ?auto_2290 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_2289 ) ( ON_BOARD ?auto_2289 ?auto_2290 ) ( SUPPORTS ?auto_2289 ?auto_2288 ) ( POWER_ON ?auto_2289 ) ( POINTING ?auto_2290 ?auto_2287 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_2290 ?auto_2287 ?auto_2289 ?auto_2288 )
      ( GET-1IMAGE-VERIFY ?auto_2287 ?auto_2288 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2305 - DIRECTION
      ?auto_2306 - MODE
    )
    :vars
    (
      ?auto_2307 - INSTRUMENT
      ?auto_2308 - SATELLITE
      ?auto_2309 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_2307 ) ( ON_BOARD ?auto_2307 ?auto_2308 ) ( SUPPORTS ?auto_2307 ?auto_2306 ) ( POWER_ON ?auto_2307 ) ( POINTING ?auto_2308 ?auto_2309 ) ( not ( = ?auto_2305 ?auto_2309 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_2308 ?auto_2305 ?auto_2309 )
      ( GET-1IMAGE ?auto_2305 ?auto_2306 )
      ( GET-1IMAGE-VERIFY ?auto_2305 ?auto_2306 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2326 - DIRECTION
      ?auto_2327 - MODE
    )
    :vars
    (
      ?auto_2330 - INSTRUMENT
      ?auto_2329 - SATELLITE
      ?auto_2328 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2330 ?auto_2329 ) ( SUPPORTS ?auto_2330 ?auto_2327 ) ( POWER_ON ?auto_2330 ) ( POINTING ?auto_2329 ?auto_2328 ) ( not ( = ?auto_2326 ?auto_2328 ) ) ( CALIBRATION_TARGET ?auto_2330 ?auto_2328 ) ( NOT_CALIBRATED ?auto_2330 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_2329 ?auto_2330 ?auto_2328 )
      ( GET-1IMAGE ?auto_2326 ?auto_2327 )
      ( GET-1IMAGE-VERIFY ?auto_2326 ?auto_2327 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2347 - DIRECTION
      ?auto_2348 - MODE
    )
    :vars
    (
      ?auto_2350 - INSTRUMENT
      ?auto_2351 - SATELLITE
      ?auto_2349 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2350 ?auto_2351 ) ( SUPPORTS ?auto_2350 ?auto_2348 ) ( POINTING ?auto_2351 ?auto_2349 ) ( not ( = ?auto_2347 ?auto_2349 ) ) ( CALIBRATION_TARGET ?auto_2350 ?auto_2349 ) ( POWER_AVAIL ?auto_2351 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_2350 ?auto_2351 )
      ( GET-1IMAGE ?auto_2347 ?auto_2348 )
      ( GET-1IMAGE-VERIFY ?auto_2347 ?auto_2348 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2368 - DIRECTION
      ?auto_2369 - MODE
    )
    :vars
    (
      ?auto_2370 - INSTRUMENT
      ?auto_2372 - SATELLITE
      ?auto_2371 - DIRECTION
      ?auto_2373 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2370 ?auto_2372 ) ( SUPPORTS ?auto_2370 ?auto_2369 ) ( not ( = ?auto_2368 ?auto_2371 ) ) ( CALIBRATION_TARGET ?auto_2370 ?auto_2371 ) ( POWER_AVAIL ?auto_2372 ) ( POINTING ?auto_2372 ?auto_2373 ) ( not ( = ?auto_2371 ?auto_2373 ) ) ( not ( = ?auto_2368 ?auto_2373 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_2372 ?auto_2371 ?auto_2373 )
      ( GET-1IMAGE ?auto_2368 ?auto_2369 )
      ( GET-1IMAGE-VERIFY ?auto_2368 ?auto_2369 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2448 - DIRECTION
      ?auto_2449 - MODE
    )
    :vars
    (
      ?auto_2450 - INSTRUMENT
      ?auto_2451 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_2450 ) ( ON_BOARD ?auto_2450 ?auto_2451 ) ( SUPPORTS ?auto_2450 ?auto_2449 ) ( POWER_ON ?auto_2450 ) ( POINTING ?auto_2451 ?auto_2448 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_2451 ?auto_2448 ?auto_2450 ?auto_2449 )
      ( GET-1IMAGE-VERIFY ?auto_2448 ?auto_2449 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2452 - DIRECTION
      ?auto_2453 - MODE
      ?auto_2455 - DIRECTION
      ?auto_2454 - MODE
    )
    :vars
    (
      ?auto_2457 - INSTRUMENT
      ?auto_2456 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_2457 ) ( ON_BOARD ?auto_2457 ?auto_2456 ) ( SUPPORTS ?auto_2457 ?auto_2454 ) ( POWER_ON ?auto_2457 ) ( POINTING ?auto_2456 ?auto_2455 ) ( HAVE_IMAGE ?auto_2452 ?auto_2453 ) ( not ( = ?auto_2452 ?auto_2455 ) ) ( not ( = ?auto_2453 ?auto_2454 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2455 ?auto_2454 )
      ( GET-2IMAGE-VERIFY ?auto_2452 ?auto_2453 ?auto_2455 ?auto_2454 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2458 - DIRECTION
      ?auto_2459 - MODE
      ?auto_2461 - DIRECTION
      ?auto_2460 - MODE
    )
    :vars
    (
      ?auto_2463 - INSTRUMENT
      ?auto_2462 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_2463 ) ( ON_BOARD ?auto_2463 ?auto_2462 ) ( SUPPORTS ?auto_2463 ?auto_2459 ) ( POWER_ON ?auto_2463 ) ( POINTING ?auto_2462 ?auto_2458 ) ( HAVE_IMAGE ?auto_2461 ?auto_2460 ) ( not ( = ?auto_2458 ?auto_2461 ) ) ( not ( = ?auto_2459 ?auto_2460 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2458 ?auto_2459 )
      ( GET-2IMAGE-VERIFY ?auto_2458 ?auto_2459 ?auto_2461 ?auto_2460 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2470 - DIRECTION
      ?auto_2471 - MODE
      ?auto_2473 - DIRECTION
      ?auto_2472 - MODE
      ?auto_2475 - DIRECTION
      ?auto_2474 - MODE
    )
    :vars
    (
      ?auto_2477 - INSTRUMENT
      ?auto_2476 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_2477 ) ( ON_BOARD ?auto_2477 ?auto_2476 ) ( SUPPORTS ?auto_2477 ?auto_2474 ) ( POWER_ON ?auto_2477 ) ( POINTING ?auto_2476 ?auto_2475 ) ( HAVE_IMAGE ?auto_2470 ?auto_2471 ) ( HAVE_IMAGE ?auto_2473 ?auto_2472 ) ( not ( = ?auto_2470 ?auto_2473 ) ) ( not ( = ?auto_2470 ?auto_2475 ) ) ( not ( = ?auto_2471 ?auto_2472 ) ) ( not ( = ?auto_2471 ?auto_2474 ) ) ( not ( = ?auto_2473 ?auto_2475 ) ) ( not ( = ?auto_2472 ?auto_2474 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2475 ?auto_2474 )
      ( GET-3IMAGE-VERIFY ?auto_2470 ?auto_2471 ?auto_2473 ?auto_2472 ?auto_2475 ?auto_2474 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2478 - DIRECTION
      ?auto_2479 - MODE
      ?auto_2481 - DIRECTION
      ?auto_2480 - MODE
      ?auto_2483 - DIRECTION
      ?auto_2482 - MODE
    )
    :vars
    (
      ?auto_2485 - INSTRUMENT
      ?auto_2484 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_2485 ) ( ON_BOARD ?auto_2485 ?auto_2484 ) ( SUPPORTS ?auto_2485 ?auto_2480 ) ( POWER_ON ?auto_2485 ) ( POINTING ?auto_2484 ?auto_2481 ) ( HAVE_IMAGE ?auto_2478 ?auto_2479 ) ( HAVE_IMAGE ?auto_2483 ?auto_2482 ) ( not ( = ?auto_2478 ?auto_2481 ) ) ( not ( = ?auto_2478 ?auto_2483 ) ) ( not ( = ?auto_2479 ?auto_2480 ) ) ( not ( = ?auto_2479 ?auto_2482 ) ) ( not ( = ?auto_2481 ?auto_2483 ) ) ( not ( = ?auto_2480 ?auto_2482 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2481 ?auto_2480 )
      ( GET-3IMAGE-VERIFY ?auto_2478 ?auto_2479 ?auto_2481 ?auto_2480 ?auto_2483 ?auto_2482 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2494 - DIRECTION
      ?auto_2495 - MODE
      ?auto_2497 - DIRECTION
      ?auto_2496 - MODE
      ?auto_2499 - DIRECTION
      ?auto_2498 - MODE
    )
    :vars
    (
      ?auto_2501 - INSTRUMENT
      ?auto_2500 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_2501 ) ( ON_BOARD ?auto_2501 ?auto_2500 ) ( SUPPORTS ?auto_2501 ?auto_2495 ) ( POWER_ON ?auto_2501 ) ( POINTING ?auto_2500 ?auto_2494 ) ( HAVE_IMAGE ?auto_2497 ?auto_2496 ) ( HAVE_IMAGE ?auto_2499 ?auto_2498 ) ( not ( = ?auto_2494 ?auto_2497 ) ) ( not ( = ?auto_2494 ?auto_2499 ) ) ( not ( = ?auto_2495 ?auto_2496 ) ) ( not ( = ?auto_2495 ?auto_2498 ) ) ( not ( = ?auto_2497 ?auto_2499 ) ) ( not ( = ?auto_2496 ?auto_2498 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2494 ?auto_2495 )
      ( GET-3IMAGE-VERIFY ?auto_2494 ?auto_2495 ?auto_2497 ?auto_2496 ?auto_2499 ?auto_2498 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2526 - DIRECTION
      ?auto_2527 - MODE
    )
    :vars
    (
      ?auto_2529 - INSTRUMENT
      ?auto_2528 - SATELLITE
      ?auto_2530 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_2529 ) ( ON_BOARD ?auto_2529 ?auto_2528 ) ( SUPPORTS ?auto_2529 ?auto_2527 ) ( POWER_ON ?auto_2529 ) ( POINTING ?auto_2528 ?auto_2530 ) ( not ( = ?auto_2526 ?auto_2530 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_2528 ?auto_2526 ?auto_2530 )
      ( GET-1IMAGE ?auto_2526 ?auto_2527 )
      ( GET-1IMAGE-VERIFY ?auto_2526 ?auto_2527 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2531 - DIRECTION
      ?auto_2532 - MODE
      ?auto_2534 - DIRECTION
      ?auto_2533 - MODE
    )
    :vars
    (
      ?auto_2537 - INSTRUMENT
      ?auto_2535 - SATELLITE
      ?auto_2536 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_2537 ) ( ON_BOARD ?auto_2537 ?auto_2535 ) ( SUPPORTS ?auto_2537 ?auto_2533 ) ( POWER_ON ?auto_2537 ) ( POINTING ?auto_2535 ?auto_2536 ) ( not ( = ?auto_2534 ?auto_2536 ) ) ( HAVE_IMAGE ?auto_2531 ?auto_2532 ) ( not ( = ?auto_2531 ?auto_2534 ) ) ( not ( = ?auto_2531 ?auto_2536 ) ) ( not ( = ?auto_2532 ?auto_2533 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2534 ?auto_2533 )
      ( GET-2IMAGE-VERIFY ?auto_2531 ?auto_2532 ?auto_2534 ?auto_2533 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2538 - DIRECTION
      ?auto_2539 - MODE
      ?auto_2541 - DIRECTION
      ?auto_2540 - MODE
    )
    :vars
    (
      ?auto_2544 - INSTRUMENT
      ?auto_2542 - SATELLITE
      ?auto_2543 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_2544 ) ( ON_BOARD ?auto_2544 ?auto_2542 ) ( SUPPORTS ?auto_2544 ?auto_2539 ) ( POWER_ON ?auto_2544 ) ( POINTING ?auto_2542 ?auto_2543 ) ( not ( = ?auto_2538 ?auto_2543 ) ) ( HAVE_IMAGE ?auto_2541 ?auto_2540 ) ( not ( = ?auto_2541 ?auto_2538 ) ) ( not ( = ?auto_2541 ?auto_2543 ) ) ( not ( = ?auto_2540 ?auto_2539 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2541 ?auto_2540 ?auto_2538 ?auto_2539 )
      ( GET-2IMAGE-VERIFY ?auto_2538 ?auto_2539 ?auto_2541 ?auto_2540 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2554 - DIRECTION
      ?auto_2555 - MODE
      ?auto_2557 - DIRECTION
      ?auto_2556 - MODE
      ?auto_2559 - DIRECTION
      ?auto_2558 - MODE
    )
    :vars
    (
      ?auto_2562 - INSTRUMENT
      ?auto_2560 - SATELLITE
      ?auto_2561 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_2562 ) ( ON_BOARD ?auto_2562 ?auto_2560 ) ( SUPPORTS ?auto_2562 ?auto_2558 ) ( POWER_ON ?auto_2562 ) ( POINTING ?auto_2560 ?auto_2561 ) ( not ( = ?auto_2559 ?auto_2561 ) ) ( HAVE_IMAGE ?auto_2554 ?auto_2555 ) ( not ( = ?auto_2554 ?auto_2559 ) ) ( not ( = ?auto_2554 ?auto_2561 ) ) ( not ( = ?auto_2555 ?auto_2558 ) ) ( HAVE_IMAGE ?auto_2557 ?auto_2556 ) ( not ( = ?auto_2554 ?auto_2557 ) ) ( not ( = ?auto_2555 ?auto_2556 ) ) ( not ( = ?auto_2557 ?auto_2559 ) ) ( not ( = ?auto_2557 ?auto_2561 ) ) ( not ( = ?auto_2556 ?auto_2558 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2554 ?auto_2555 ?auto_2559 ?auto_2558 )
      ( GET-3IMAGE-VERIFY ?auto_2554 ?auto_2555 ?auto_2557 ?auto_2556 ?auto_2559 ?auto_2558 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2563 - DIRECTION
      ?auto_2564 - MODE
      ?auto_2566 - DIRECTION
      ?auto_2565 - MODE
      ?auto_2568 - DIRECTION
      ?auto_2567 - MODE
    )
    :vars
    (
      ?auto_2571 - INSTRUMENT
      ?auto_2569 - SATELLITE
      ?auto_2570 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_2571 ) ( ON_BOARD ?auto_2571 ?auto_2569 ) ( SUPPORTS ?auto_2571 ?auto_2565 ) ( POWER_ON ?auto_2571 ) ( POINTING ?auto_2569 ?auto_2570 ) ( not ( = ?auto_2566 ?auto_2570 ) ) ( HAVE_IMAGE ?auto_2568 ?auto_2567 ) ( not ( = ?auto_2568 ?auto_2566 ) ) ( not ( = ?auto_2568 ?auto_2570 ) ) ( not ( = ?auto_2567 ?auto_2565 ) ) ( HAVE_IMAGE ?auto_2563 ?auto_2564 ) ( not ( = ?auto_2563 ?auto_2566 ) ) ( not ( = ?auto_2563 ?auto_2568 ) ) ( not ( = ?auto_2563 ?auto_2570 ) ) ( not ( = ?auto_2564 ?auto_2565 ) ) ( not ( = ?auto_2564 ?auto_2567 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2568 ?auto_2567 ?auto_2566 ?auto_2565 )
      ( GET-3IMAGE-VERIFY ?auto_2563 ?auto_2564 ?auto_2566 ?auto_2565 ?auto_2568 ?auto_2567 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2581 - DIRECTION
      ?auto_2582 - MODE
      ?auto_2584 - DIRECTION
      ?auto_2583 - MODE
      ?auto_2586 - DIRECTION
      ?auto_2585 - MODE
    )
    :vars
    (
      ?auto_2589 - INSTRUMENT
      ?auto_2587 - SATELLITE
      ?auto_2588 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_2589 ) ( ON_BOARD ?auto_2589 ?auto_2587 ) ( SUPPORTS ?auto_2589 ?auto_2582 ) ( POWER_ON ?auto_2589 ) ( POINTING ?auto_2587 ?auto_2588 ) ( not ( = ?auto_2581 ?auto_2588 ) ) ( HAVE_IMAGE ?auto_2584 ?auto_2585 ) ( not ( = ?auto_2584 ?auto_2581 ) ) ( not ( = ?auto_2584 ?auto_2588 ) ) ( not ( = ?auto_2585 ?auto_2582 ) ) ( HAVE_IMAGE ?auto_2584 ?auto_2583 ) ( HAVE_IMAGE ?auto_2586 ?auto_2585 ) ( not ( = ?auto_2581 ?auto_2586 ) ) ( not ( = ?auto_2582 ?auto_2583 ) ) ( not ( = ?auto_2584 ?auto_2586 ) ) ( not ( = ?auto_2583 ?auto_2585 ) ) ( not ( = ?auto_2586 ?auto_2588 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2584 ?auto_2585 ?auto_2581 ?auto_2582 )
      ( GET-3IMAGE-VERIFY ?auto_2581 ?auto_2582 ?auto_2584 ?auto_2583 ?auto_2586 ?auto_2585 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2619 - DIRECTION
      ?auto_2620 - MODE
    )
    :vars
    (
      ?auto_2623 - INSTRUMENT
      ?auto_2621 - SATELLITE
      ?auto_2622 - DIRECTION
      ?auto_2625 - DIRECTION
      ?auto_2624 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_2623 ?auto_2621 ) ( SUPPORTS ?auto_2623 ?auto_2620 ) ( POWER_ON ?auto_2623 ) ( POINTING ?auto_2621 ?auto_2622 ) ( not ( = ?auto_2619 ?auto_2622 ) ) ( HAVE_IMAGE ?auto_2625 ?auto_2624 ) ( not ( = ?auto_2625 ?auto_2619 ) ) ( not ( = ?auto_2625 ?auto_2622 ) ) ( not ( = ?auto_2624 ?auto_2620 ) ) ( CALIBRATION_TARGET ?auto_2623 ?auto_2622 ) ( NOT_CALIBRATED ?auto_2623 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_2621 ?auto_2623 ?auto_2622 )
      ( GET-2IMAGE ?auto_2625 ?auto_2624 ?auto_2619 ?auto_2620 )
      ( GET-1IMAGE-VERIFY ?auto_2619 ?auto_2620 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2626 - DIRECTION
      ?auto_2627 - MODE
      ?auto_2629 - DIRECTION
      ?auto_2628 - MODE
    )
    :vars
    (
      ?auto_2632 - INSTRUMENT
      ?auto_2631 - SATELLITE
      ?auto_2630 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2632 ?auto_2631 ) ( SUPPORTS ?auto_2632 ?auto_2628 ) ( POWER_ON ?auto_2632 ) ( POINTING ?auto_2631 ?auto_2630 ) ( not ( = ?auto_2629 ?auto_2630 ) ) ( HAVE_IMAGE ?auto_2626 ?auto_2627 ) ( not ( = ?auto_2626 ?auto_2629 ) ) ( not ( = ?auto_2626 ?auto_2630 ) ) ( not ( = ?auto_2627 ?auto_2628 ) ) ( CALIBRATION_TARGET ?auto_2632 ?auto_2630 ) ( NOT_CALIBRATED ?auto_2632 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2629 ?auto_2628 )
      ( GET-2IMAGE-VERIFY ?auto_2626 ?auto_2627 ?auto_2629 ?auto_2628 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2633 - DIRECTION
      ?auto_2634 - MODE
      ?auto_2636 - DIRECTION
      ?auto_2635 - MODE
    )
    :vars
    (
      ?auto_2639 - INSTRUMENT
      ?auto_2637 - SATELLITE
      ?auto_2638 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2639 ?auto_2637 ) ( SUPPORTS ?auto_2639 ?auto_2634 ) ( POWER_ON ?auto_2639 ) ( POINTING ?auto_2637 ?auto_2638 ) ( not ( = ?auto_2633 ?auto_2638 ) ) ( HAVE_IMAGE ?auto_2636 ?auto_2635 ) ( not ( = ?auto_2636 ?auto_2633 ) ) ( not ( = ?auto_2636 ?auto_2638 ) ) ( not ( = ?auto_2635 ?auto_2634 ) ) ( CALIBRATION_TARGET ?auto_2639 ?auto_2638 ) ( NOT_CALIBRATED ?auto_2639 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2636 ?auto_2635 ?auto_2633 ?auto_2634 )
      ( GET-2IMAGE-VERIFY ?auto_2633 ?auto_2634 ?auto_2636 ?auto_2635 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2649 - DIRECTION
      ?auto_2650 - MODE
      ?auto_2652 - DIRECTION
      ?auto_2651 - MODE
      ?auto_2654 - DIRECTION
      ?auto_2653 - MODE
    )
    :vars
    (
      ?auto_2657 - INSTRUMENT
      ?auto_2655 - SATELLITE
      ?auto_2656 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2657 ?auto_2655 ) ( SUPPORTS ?auto_2657 ?auto_2653 ) ( POWER_ON ?auto_2657 ) ( POINTING ?auto_2655 ?auto_2656 ) ( not ( = ?auto_2654 ?auto_2656 ) ) ( HAVE_IMAGE ?auto_2652 ?auto_2651 ) ( not ( = ?auto_2652 ?auto_2654 ) ) ( not ( = ?auto_2652 ?auto_2656 ) ) ( not ( = ?auto_2651 ?auto_2653 ) ) ( CALIBRATION_TARGET ?auto_2657 ?auto_2656 ) ( NOT_CALIBRATED ?auto_2657 ) ( HAVE_IMAGE ?auto_2649 ?auto_2650 ) ( not ( = ?auto_2649 ?auto_2652 ) ) ( not ( = ?auto_2649 ?auto_2654 ) ) ( not ( = ?auto_2649 ?auto_2656 ) ) ( not ( = ?auto_2650 ?auto_2651 ) ) ( not ( = ?auto_2650 ?auto_2653 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2652 ?auto_2651 ?auto_2654 ?auto_2653 )
      ( GET-3IMAGE-VERIFY ?auto_2649 ?auto_2650 ?auto_2652 ?auto_2651 ?auto_2654 ?auto_2653 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2658 - DIRECTION
      ?auto_2659 - MODE
      ?auto_2661 - DIRECTION
      ?auto_2660 - MODE
      ?auto_2663 - DIRECTION
      ?auto_2662 - MODE
    )
    :vars
    (
      ?auto_2666 - INSTRUMENT
      ?auto_2664 - SATELLITE
      ?auto_2665 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2666 ?auto_2664 ) ( SUPPORTS ?auto_2666 ?auto_2660 ) ( POWER_ON ?auto_2666 ) ( POINTING ?auto_2664 ?auto_2665 ) ( not ( = ?auto_2661 ?auto_2665 ) ) ( HAVE_IMAGE ?auto_2663 ?auto_2662 ) ( not ( = ?auto_2663 ?auto_2661 ) ) ( not ( = ?auto_2663 ?auto_2665 ) ) ( not ( = ?auto_2662 ?auto_2660 ) ) ( CALIBRATION_TARGET ?auto_2666 ?auto_2665 ) ( NOT_CALIBRATED ?auto_2666 ) ( HAVE_IMAGE ?auto_2658 ?auto_2659 ) ( not ( = ?auto_2658 ?auto_2661 ) ) ( not ( = ?auto_2658 ?auto_2663 ) ) ( not ( = ?auto_2658 ?auto_2665 ) ) ( not ( = ?auto_2659 ?auto_2660 ) ) ( not ( = ?auto_2659 ?auto_2662 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2663 ?auto_2662 ?auto_2661 ?auto_2660 )
      ( GET-3IMAGE-VERIFY ?auto_2658 ?auto_2659 ?auto_2661 ?auto_2660 ?auto_2663 ?auto_2662 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2676 - DIRECTION
      ?auto_2677 - MODE
      ?auto_2679 - DIRECTION
      ?auto_2678 - MODE
      ?auto_2681 - DIRECTION
      ?auto_2680 - MODE
    )
    :vars
    (
      ?auto_2684 - INSTRUMENT
      ?auto_2682 - SATELLITE
      ?auto_2683 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2684 ?auto_2682 ) ( SUPPORTS ?auto_2684 ?auto_2677 ) ( POWER_ON ?auto_2684 ) ( POINTING ?auto_2682 ?auto_2683 ) ( not ( = ?auto_2676 ?auto_2683 ) ) ( HAVE_IMAGE ?auto_2681 ?auto_2678 ) ( not ( = ?auto_2681 ?auto_2676 ) ) ( not ( = ?auto_2681 ?auto_2683 ) ) ( not ( = ?auto_2678 ?auto_2677 ) ) ( CALIBRATION_TARGET ?auto_2684 ?auto_2683 ) ( NOT_CALIBRATED ?auto_2684 ) ( HAVE_IMAGE ?auto_2679 ?auto_2678 ) ( HAVE_IMAGE ?auto_2681 ?auto_2680 ) ( not ( = ?auto_2676 ?auto_2679 ) ) ( not ( = ?auto_2677 ?auto_2680 ) ) ( not ( = ?auto_2679 ?auto_2681 ) ) ( not ( = ?auto_2679 ?auto_2683 ) ) ( not ( = ?auto_2678 ?auto_2680 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2681 ?auto_2678 ?auto_2676 ?auto_2677 )
      ( GET-3IMAGE-VERIFY ?auto_2676 ?auto_2677 ?auto_2679 ?auto_2678 ?auto_2681 ?auto_2680 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2714 - DIRECTION
      ?auto_2715 - MODE
    )
    :vars
    (
      ?auto_2719 - INSTRUMENT
      ?auto_2717 - SATELLITE
      ?auto_2718 - DIRECTION
      ?auto_2716 - DIRECTION
      ?auto_2720 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_2719 ?auto_2717 ) ( SUPPORTS ?auto_2719 ?auto_2715 ) ( POINTING ?auto_2717 ?auto_2718 ) ( not ( = ?auto_2714 ?auto_2718 ) ) ( HAVE_IMAGE ?auto_2716 ?auto_2720 ) ( not ( = ?auto_2716 ?auto_2714 ) ) ( not ( = ?auto_2716 ?auto_2718 ) ) ( not ( = ?auto_2720 ?auto_2715 ) ) ( CALIBRATION_TARGET ?auto_2719 ?auto_2718 ) ( POWER_AVAIL ?auto_2717 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_2719 ?auto_2717 )
      ( GET-2IMAGE ?auto_2716 ?auto_2720 ?auto_2714 ?auto_2715 )
      ( GET-1IMAGE-VERIFY ?auto_2714 ?auto_2715 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2721 - DIRECTION
      ?auto_2722 - MODE
      ?auto_2724 - DIRECTION
      ?auto_2723 - MODE
    )
    :vars
    (
      ?auto_2726 - INSTRUMENT
      ?auto_2725 - SATELLITE
      ?auto_2727 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2726 ?auto_2725 ) ( SUPPORTS ?auto_2726 ?auto_2723 ) ( POINTING ?auto_2725 ?auto_2727 ) ( not ( = ?auto_2724 ?auto_2727 ) ) ( HAVE_IMAGE ?auto_2721 ?auto_2722 ) ( not ( = ?auto_2721 ?auto_2724 ) ) ( not ( = ?auto_2721 ?auto_2727 ) ) ( not ( = ?auto_2722 ?auto_2723 ) ) ( CALIBRATION_TARGET ?auto_2726 ?auto_2727 ) ( POWER_AVAIL ?auto_2725 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2724 ?auto_2723 )
      ( GET-2IMAGE-VERIFY ?auto_2721 ?auto_2722 ?auto_2724 ?auto_2723 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2728 - DIRECTION
      ?auto_2729 - MODE
      ?auto_2731 - DIRECTION
      ?auto_2730 - MODE
    )
    :vars
    (
      ?auto_2732 - INSTRUMENT
      ?auto_2733 - SATELLITE
      ?auto_2734 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2732 ?auto_2733 ) ( SUPPORTS ?auto_2732 ?auto_2729 ) ( POINTING ?auto_2733 ?auto_2734 ) ( not ( = ?auto_2728 ?auto_2734 ) ) ( HAVE_IMAGE ?auto_2731 ?auto_2730 ) ( not ( = ?auto_2731 ?auto_2728 ) ) ( not ( = ?auto_2731 ?auto_2734 ) ) ( not ( = ?auto_2730 ?auto_2729 ) ) ( CALIBRATION_TARGET ?auto_2732 ?auto_2734 ) ( POWER_AVAIL ?auto_2733 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2731 ?auto_2730 ?auto_2728 ?auto_2729 )
      ( GET-2IMAGE-VERIFY ?auto_2728 ?auto_2729 ?auto_2731 ?auto_2730 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2744 - DIRECTION
      ?auto_2745 - MODE
      ?auto_2747 - DIRECTION
      ?auto_2746 - MODE
      ?auto_2749 - DIRECTION
      ?auto_2748 - MODE
    )
    :vars
    (
      ?auto_2750 - INSTRUMENT
      ?auto_2751 - SATELLITE
      ?auto_2752 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2750 ?auto_2751 ) ( SUPPORTS ?auto_2750 ?auto_2748 ) ( POINTING ?auto_2751 ?auto_2752 ) ( not ( = ?auto_2749 ?auto_2752 ) ) ( HAVE_IMAGE ?auto_2747 ?auto_2745 ) ( not ( = ?auto_2747 ?auto_2749 ) ) ( not ( = ?auto_2747 ?auto_2752 ) ) ( not ( = ?auto_2745 ?auto_2748 ) ) ( CALIBRATION_TARGET ?auto_2750 ?auto_2752 ) ( POWER_AVAIL ?auto_2751 ) ( HAVE_IMAGE ?auto_2744 ?auto_2745 ) ( HAVE_IMAGE ?auto_2747 ?auto_2746 ) ( not ( = ?auto_2744 ?auto_2747 ) ) ( not ( = ?auto_2744 ?auto_2749 ) ) ( not ( = ?auto_2744 ?auto_2752 ) ) ( not ( = ?auto_2745 ?auto_2746 ) ) ( not ( = ?auto_2746 ?auto_2748 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2747 ?auto_2745 ?auto_2749 ?auto_2748 )
      ( GET-3IMAGE-VERIFY ?auto_2744 ?auto_2745 ?auto_2747 ?auto_2746 ?auto_2749 ?auto_2748 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2753 - DIRECTION
      ?auto_2754 - MODE
      ?auto_2756 - DIRECTION
      ?auto_2755 - MODE
      ?auto_2758 - DIRECTION
      ?auto_2757 - MODE
    )
    :vars
    (
      ?auto_2759 - INSTRUMENT
      ?auto_2760 - SATELLITE
      ?auto_2761 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2759 ?auto_2760 ) ( SUPPORTS ?auto_2759 ?auto_2755 ) ( POINTING ?auto_2760 ?auto_2761 ) ( not ( = ?auto_2756 ?auto_2761 ) ) ( HAVE_IMAGE ?auto_2758 ?auto_2757 ) ( not ( = ?auto_2758 ?auto_2756 ) ) ( not ( = ?auto_2758 ?auto_2761 ) ) ( not ( = ?auto_2757 ?auto_2755 ) ) ( CALIBRATION_TARGET ?auto_2759 ?auto_2761 ) ( POWER_AVAIL ?auto_2760 ) ( HAVE_IMAGE ?auto_2753 ?auto_2754 ) ( not ( = ?auto_2753 ?auto_2756 ) ) ( not ( = ?auto_2753 ?auto_2758 ) ) ( not ( = ?auto_2753 ?auto_2761 ) ) ( not ( = ?auto_2754 ?auto_2755 ) ) ( not ( = ?auto_2754 ?auto_2757 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2758 ?auto_2757 ?auto_2756 ?auto_2755 )
      ( GET-3IMAGE-VERIFY ?auto_2753 ?auto_2754 ?auto_2756 ?auto_2755 ?auto_2758 ?auto_2757 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2771 - DIRECTION
      ?auto_2772 - MODE
      ?auto_2774 - DIRECTION
      ?auto_2773 - MODE
      ?auto_2776 - DIRECTION
      ?auto_2775 - MODE
    )
    :vars
    (
      ?auto_2777 - INSTRUMENT
      ?auto_2778 - SATELLITE
      ?auto_2779 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2777 ?auto_2778 ) ( SUPPORTS ?auto_2777 ?auto_2772 ) ( POINTING ?auto_2778 ?auto_2779 ) ( not ( = ?auto_2771 ?auto_2779 ) ) ( HAVE_IMAGE ?auto_2774 ?auto_2773 ) ( not ( = ?auto_2774 ?auto_2771 ) ) ( not ( = ?auto_2774 ?auto_2779 ) ) ( not ( = ?auto_2773 ?auto_2772 ) ) ( CALIBRATION_TARGET ?auto_2777 ?auto_2779 ) ( POWER_AVAIL ?auto_2778 ) ( HAVE_IMAGE ?auto_2776 ?auto_2775 ) ( not ( = ?auto_2771 ?auto_2776 ) ) ( not ( = ?auto_2772 ?auto_2775 ) ) ( not ( = ?auto_2774 ?auto_2776 ) ) ( not ( = ?auto_2773 ?auto_2775 ) ) ( not ( = ?auto_2776 ?auto_2779 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2774 ?auto_2773 ?auto_2771 ?auto_2772 )
      ( GET-3IMAGE-VERIFY ?auto_2771 ?auto_2772 ?auto_2774 ?auto_2773 ?auto_2776 ?auto_2775 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2809 - DIRECTION
      ?auto_2810 - MODE
    )
    :vars
    (
      ?auto_2811 - INSTRUMENT
      ?auto_2812 - SATELLITE
      ?auto_2813 - DIRECTION
      ?auto_2815 - DIRECTION
      ?auto_2814 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_2811 ?auto_2812 ) ( SUPPORTS ?auto_2811 ?auto_2810 ) ( not ( = ?auto_2809 ?auto_2813 ) ) ( HAVE_IMAGE ?auto_2815 ?auto_2814 ) ( not ( = ?auto_2815 ?auto_2809 ) ) ( not ( = ?auto_2815 ?auto_2813 ) ) ( not ( = ?auto_2814 ?auto_2810 ) ) ( CALIBRATION_TARGET ?auto_2811 ?auto_2813 ) ( POWER_AVAIL ?auto_2812 ) ( POINTING ?auto_2812 ?auto_2815 ) )
    :subtasks
    ( ( !TURN_TO ?auto_2812 ?auto_2813 ?auto_2815 )
      ( GET-2IMAGE ?auto_2815 ?auto_2814 ?auto_2809 ?auto_2810 )
      ( GET-1IMAGE-VERIFY ?auto_2809 ?auto_2810 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2816 - DIRECTION
      ?auto_2817 - MODE
      ?auto_2819 - DIRECTION
      ?auto_2818 - MODE
    )
    :vars
    (
      ?auto_2821 - INSTRUMENT
      ?auto_2820 - SATELLITE
      ?auto_2822 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2821 ?auto_2820 ) ( SUPPORTS ?auto_2821 ?auto_2818 ) ( not ( = ?auto_2819 ?auto_2822 ) ) ( HAVE_IMAGE ?auto_2816 ?auto_2817 ) ( not ( = ?auto_2816 ?auto_2819 ) ) ( not ( = ?auto_2816 ?auto_2822 ) ) ( not ( = ?auto_2817 ?auto_2818 ) ) ( CALIBRATION_TARGET ?auto_2821 ?auto_2822 ) ( POWER_AVAIL ?auto_2820 ) ( POINTING ?auto_2820 ?auto_2816 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2819 ?auto_2818 )
      ( GET-2IMAGE-VERIFY ?auto_2816 ?auto_2817 ?auto_2819 ?auto_2818 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2823 - DIRECTION
      ?auto_2824 - MODE
      ?auto_2826 - DIRECTION
      ?auto_2825 - MODE
    )
    :vars
    (
      ?auto_2828 - INSTRUMENT
      ?auto_2829 - SATELLITE
      ?auto_2827 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2828 ?auto_2829 ) ( SUPPORTS ?auto_2828 ?auto_2824 ) ( not ( = ?auto_2823 ?auto_2827 ) ) ( HAVE_IMAGE ?auto_2826 ?auto_2825 ) ( not ( = ?auto_2826 ?auto_2823 ) ) ( not ( = ?auto_2826 ?auto_2827 ) ) ( not ( = ?auto_2825 ?auto_2824 ) ) ( CALIBRATION_TARGET ?auto_2828 ?auto_2827 ) ( POWER_AVAIL ?auto_2829 ) ( POINTING ?auto_2829 ?auto_2826 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2826 ?auto_2825 ?auto_2823 ?auto_2824 )
      ( GET-2IMAGE-VERIFY ?auto_2823 ?auto_2824 ?auto_2826 ?auto_2825 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2839 - DIRECTION
      ?auto_2840 - MODE
      ?auto_2842 - DIRECTION
      ?auto_2841 - MODE
      ?auto_2844 - DIRECTION
      ?auto_2843 - MODE
    )
    :vars
    (
      ?auto_2846 - INSTRUMENT
      ?auto_2847 - SATELLITE
      ?auto_2845 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2846 ?auto_2847 ) ( SUPPORTS ?auto_2846 ?auto_2843 ) ( not ( = ?auto_2844 ?auto_2845 ) ) ( HAVE_IMAGE ?auto_2842 ?auto_2840 ) ( not ( = ?auto_2842 ?auto_2844 ) ) ( not ( = ?auto_2842 ?auto_2845 ) ) ( not ( = ?auto_2840 ?auto_2843 ) ) ( CALIBRATION_TARGET ?auto_2846 ?auto_2845 ) ( POWER_AVAIL ?auto_2847 ) ( POINTING ?auto_2847 ?auto_2842 ) ( HAVE_IMAGE ?auto_2839 ?auto_2840 ) ( HAVE_IMAGE ?auto_2842 ?auto_2841 ) ( not ( = ?auto_2839 ?auto_2842 ) ) ( not ( = ?auto_2839 ?auto_2844 ) ) ( not ( = ?auto_2839 ?auto_2845 ) ) ( not ( = ?auto_2840 ?auto_2841 ) ) ( not ( = ?auto_2841 ?auto_2843 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2842 ?auto_2840 ?auto_2844 ?auto_2843 )
      ( GET-3IMAGE-VERIFY ?auto_2839 ?auto_2840 ?auto_2842 ?auto_2841 ?auto_2844 ?auto_2843 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2848 - DIRECTION
      ?auto_2849 - MODE
      ?auto_2851 - DIRECTION
      ?auto_2850 - MODE
      ?auto_2853 - DIRECTION
      ?auto_2852 - MODE
    )
    :vars
    (
      ?auto_2855 - INSTRUMENT
      ?auto_2856 - SATELLITE
      ?auto_2854 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2855 ?auto_2856 ) ( SUPPORTS ?auto_2855 ?auto_2850 ) ( not ( = ?auto_2851 ?auto_2854 ) ) ( HAVE_IMAGE ?auto_2853 ?auto_2852 ) ( not ( = ?auto_2853 ?auto_2851 ) ) ( not ( = ?auto_2853 ?auto_2854 ) ) ( not ( = ?auto_2852 ?auto_2850 ) ) ( CALIBRATION_TARGET ?auto_2855 ?auto_2854 ) ( POWER_AVAIL ?auto_2856 ) ( POINTING ?auto_2856 ?auto_2853 ) ( HAVE_IMAGE ?auto_2848 ?auto_2849 ) ( not ( = ?auto_2848 ?auto_2851 ) ) ( not ( = ?auto_2848 ?auto_2853 ) ) ( not ( = ?auto_2848 ?auto_2854 ) ) ( not ( = ?auto_2849 ?auto_2850 ) ) ( not ( = ?auto_2849 ?auto_2852 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2853 ?auto_2852 ?auto_2851 ?auto_2850 )
      ( GET-3IMAGE-VERIFY ?auto_2848 ?auto_2849 ?auto_2851 ?auto_2850 ?auto_2853 ?auto_2852 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2866 - DIRECTION
      ?auto_2867 - MODE
      ?auto_2869 - DIRECTION
      ?auto_2868 - MODE
      ?auto_2871 - DIRECTION
      ?auto_2870 - MODE
    )
    :vars
    (
      ?auto_2873 - INSTRUMENT
      ?auto_2874 - SATELLITE
      ?auto_2872 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2873 ?auto_2874 ) ( SUPPORTS ?auto_2873 ?auto_2867 ) ( not ( = ?auto_2866 ?auto_2872 ) ) ( HAVE_IMAGE ?auto_2869 ?auto_2868 ) ( not ( = ?auto_2869 ?auto_2866 ) ) ( not ( = ?auto_2869 ?auto_2872 ) ) ( not ( = ?auto_2868 ?auto_2867 ) ) ( CALIBRATION_TARGET ?auto_2873 ?auto_2872 ) ( POWER_AVAIL ?auto_2874 ) ( POINTING ?auto_2874 ?auto_2869 ) ( HAVE_IMAGE ?auto_2871 ?auto_2870 ) ( not ( = ?auto_2866 ?auto_2871 ) ) ( not ( = ?auto_2867 ?auto_2870 ) ) ( not ( = ?auto_2869 ?auto_2871 ) ) ( not ( = ?auto_2868 ?auto_2870 ) ) ( not ( = ?auto_2871 ?auto_2872 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2869 ?auto_2868 ?auto_2866 ?auto_2867 )
      ( GET-3IMAGE-VERIFY ?auto_2866 ?auto_2867 ?auto_2869 ?auto_2868 ?auto_2871 ?auto_2870 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2904 - DIRECTION
      ?auto_2905 - MODE
    )
    :vars
    (
      ?auto_2907 - INSTRUMENT
      ?auto_2908 - SATELLITE
      ?auto_2906 - DIRECTION
      ?auto_2910 - DIRECTION
      ?auto_2909 - MODE
      ?auto_2911 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2907 ?auto_2908 ) ( SUPPORTS ?auto_2907 ?auto_2905 ) ( not ( = ?auto_2904 ?auto_2906 ) ) ( HAVE_IMAGE ?auto_2910 ?auto_2909 ) ( not ( = ?auto_2910 ?auto_2904 ) ) ( not ( = ?auto_2910 ?auto_2906 ) ) ( not ( = ?auto_2909 ?auto_2905 ) ) ( CALIBRATION_TARGET ?auto_2907 ?auto_2906 ) ( POINTING ?auto_2908 ?auto_2910 ) ( ON_BOARD ?auto_2911 ?auto_2908 ) ( POWER_ON ?auto_2911 ) ( not ( = ?auto_2907 ?auto_2911 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_2911 ?auto_2908 )
      ( GET-2IMAGE ?auto_2910 ?auto_2909 ?auto_2904 ?auto_2905 )
      ( GET-1IMAGE-VERIFY ?auto_2904 ?auto_2905 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2912 - DIRECTION
      ?auto_2913 - MODE
      ?auto_2915 - DIRECTION
      ?auto_2914 - MODE
    )
    :vars
    (
      ?auto_2918 - INSTRUMENT
      ?auto_2919 - SATELLITE
      ?auto_2917 - DIRECTION
      ?auto_2916 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2918 ?auto_2919 ) ( SUPPORTS ?auto_2918 ?auto_2914 ) ( not ( = ?auto_2915 ?auto_2917 ) ) ( HAVE_IMAGE ?auto_2912 ?auto_2913 ) ( not ( = ?auto_2912 ?auto_2915 ) ) ( not ( = ?auto_2912 ?auto_2917 ) ) ( not ( = ?auto_2913 ?auto_2914 ) ) ( CALIBRATION_TARGET ?auto_2918 ?auto_2917 ) ( POINTING ?auto_2919 ?auto_2912 ) ( ON_BOARD ?auto_2916 ?auto_2919 ) ( POWER_ON ?auto_2916 ) ( not ( = ?auto_2918 ?auto_2916 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2915 ?auto_2914 )
      ( GET-2IMAGE-VERIFY ?auto_2912 ?auto_2913 ?auto_2915 ?auto_2914 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2920 - DIRECTION
      ?auto_2921 - MODE
      ?auto_2923 - DIRECTION
      ?auto_2922 - MODE
    )
    :vars
    (
      ?auto_2926 - INSTRUMENT
      ?auto_2924 - SATELLITE
      ?auto_2927 - DIRECTION
      ?auto_2925 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2926 ?auto_2924 ) ( SUPPORTS ?auto_2926 ?auto_2921 ) ( not ( = ?auto_2920 ?auto_2927 ) ) ( HAVE_IMAGE ?auto_2923 ?auto_2922 ) ( not ( = ?auto_2923 ?auto_2920 ) ) ( not ( = ?auto_2923 ?auto_2927 ) ) ( not ( = ?auto_2922 ?auto_2921 ) ) ( CALIBRATION_TARGET ?auto_2926 ?auto_2927 ) ( POINTING ?auto_2924 ?auto_2923 ) ( ON_BOARD ?auto_2925 ?auto_2924 ) ( POWER_ON ?auto_2925 ) ( not ( = ?auto_2926 ?auto_2925 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2923 ?auto_2922 ?auto_2920 ?auto_2921 )
      ( GET-2IMAGE-VERIFY ?auto_2920 ?auto_2921 ?auto_2923 ?auto_2922 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2938 - DIRECTION
      ?auto_2939 - MODE
      ?auto_2941 - DIRECTION
      ?auto_2940 - MODE
      ?auto_2943 - DIRECTION
      ?auto_2942 - MODE
    )
    :vars
    (
      ?auto_2946 - INSTRUMENT
      ?auto_2944 - SATELLITE
      ?auto_2947 - DIRECTION
      ?auto_2945 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2946 ?auto_2944 ) ( SUPPORTS ?auto_2946 ?auto_2942 ) ( not ( = ?auto_2943 ?auto_2947 ) ) ( HAVE_IMAGE ?auto_2938 ?auto_2940 ) ( not ( = ?auto_2938 ?auto_2943 ) ) ( not ( = ?auto_2938 ?auto_2947 ) ) ( not ( = ?auto_2940 ?auto_2942 ) ) ( CALIBRATION_TARGET ?auto_2946 ?auto_2947 ) ( POINTING ?auto_2944 ?auto_2938 ) ( ON_BOARD ?auto_2945 ?auto_2944 ) ( POWER_ON ?auto_2945 ) ( not ( = ?auto_2946 ?auto_2945 ) ) ( HAVE_IMAGE ?auto_2938 ?auto_2939 ) ( HAVE_IMAGE ?auto_2941 ?auto_2940 ) ( not ( = ?auto_2938 ?auto_2941 ) ) ( not ( = ?auto_2939 ?auto_2940 ) ) ( not ( = ?auto_2939 ?auto_2942 ) ) ( not ( = ?auto_2941 ?auto_2943 ) ) ( not ( = ?auto_2941 ?auto_2947 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2938 ?auto_2940 ?auto_2943 ?auto_2942 )
      ( GET-3IMAGE-VERIFY ?auto_2938 ?auto_2939 ?auto_2941 ?auto_2940 ?auto_2943 ?auto_2942 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2948 - DIRECTION
      ?auto_2949 - MODE
      ?auto_2951 - DIRECTION
      ?auto_2950 - MODE
      ?auto_2953 - DIRECTION
      ?auto_2952 - MODE
    )
    :vars
    (
      ?auto_2956 - INSTRUMENT
      ?auto_2954 - SATELLITE
      ?auto_2957 - DIRECTION
      ?auto_2955 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2956 ?auto_2954 ) ( SUPPORTS ?auto_2956 ?auto_2950 ) ( not ( = ?auto_2951 ?auto_2957 ) ) ( HAVE_IMAGE ?auto_2953 ?auto_2952 ) ( not ( = ?auto_2953 ?auto_2951 ) ) ( not ( = ?auto_2953 ?auto_2957 ) ) ( not ( = ?auto_2952 ?auto_2950 ) ) ( CALIBRATION_TARGET ?auto_2956 ?auto_2957 ) ( POINTING ?auto_2954 ?auto_2953 ) ( ON_BOARD ?auto_2955 ?auto_2954 ) ( POWER_ON ?auto_2955 ) ( not ( = ?auto_2956 ?auto_2955 ) ) ( HAVE_IMAGE ?auto_2948 ?auto_2949 ) ( not ( = ?auto_2948 ?auto_2951 ) ) ( not ( = ?auto_2948 ?auto_2953 ) ) ( not ( = ?auto_2948 ?auto_2957 ) ) ( not ( = ?auto_2949 ?auto_2950 ) ) ( not ( = ?auto_2949 ?auto_2952 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2953 ?auto_2952 ?auto_2951 ?auto_2950 )
      ( GET-3IMAGE-VERIFY ?auto_2948 ?auto_2949 ?auto_2951 ?auto_2950 ?auto_2953 ?auto_2952 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2968 - DIRECTION
      ?auto_2969 - MODE
      ?auto_2971 - DIRECTION
      ?auto_2970 - MODE
      ?auto_2973 - DIRECTION
      ?auto_2972 - MODE
    )
    :vars
    (
      ?auto_2976 - INSTRUMENT
      ?auto_2974 - SATELLITE
      ?auto_2977 - DIRECTION
      ?auto_2975 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2976 ?auto_2974 ) ( SUPPORTS ?auto_2976 ?auto_2969 ) ( not ( = ?auto_2968 ?auto_2977 ) ) ( HAVE_IMAGE ?auto_2971 ?auto_2970 ) ( not ( = ?auto_2971 ?auto_2968 ) ) ( not ( = ?auto_2971 ?auto_2977 ) ) ( not ( = ?auto_2970 ?auto_2969 ) ) ( CALIBRATION_TARGET ?auto_2976 ?auto_2977 ) ( POINTING ?auto_2974 ?auto_2971 ) ( ON_BOARD ?auto_2975 ?auto_2974 ) ( POWER_ON ?auto_2975 ) ( not ( = ?auto_2976 ?auto_2975 ) ) ( HAVE_IMAGE ?auto_2973 ?auto_2972 ) ( not ( = ?auto_2968 ?auto_2973 ) ) ( not ( = ?auto_2969 ?auto_2972 ) ) ( not ( = ?auto_2971 ?auto_2973 ) ) ( not ( = ?auto_2970 ?auto_2972 ) ) ( not ( = ?auto_2973 ?auto_2977 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2971 ?auto_2970 ?auto_2968 ?auto_2969 )
      ( GET-3IMAGE-VERIFY ?auto_2968 ?auto_2969 ?auto_2971 ?auto_2970 ?auto_2973 ?auto_2972 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3010 - DIRECTION
      ?auto_3011 - MODE
    )
    :vars
    (
      ?auto_3014 - INSTRUMENT
      ?auto_3012 - SATELLITE
      ?auto_3015 - DIRECTION
      ?auto_3017 - DIRECTION
      ?auto_3016 - MODE
      ?auto_3013 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_3014 ?auto_3012 ) ( SUPPORTS ?auto_3014 ?auto_3011 ) ( not ( = ?auto_3010 ?auto_3015 ) ) ( not ( = ?auto_3017 ?auto_3010 ) ) ( not ( = ?auto_3017 ?auto_3015 ) ) ( not ( = ?auto_3016 ?auto_3011 ) ) ( CALIBRATION_TARGET ?auto_3014 ?auto_3015 ) ( POINTING ?auto_3012 ?auto_3017 ) ( ON_BOARD ?auto_3013 ?auto_3012 ) ( POWER_ON ?auto_3013 ) ( not ( = ?auto_3014 ?auto_3013 ) ) ( CALIBRATED ?auto_3013 ) ( SUPPORTS ?auto_3013 ?auto_3016 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3017 ?auto_3016 )
      ( GET-2IMAGE ?auto_3017 ?auto_3016 ?auto_3010 ?auto_3011 )
      ( GET-1IMAGE-VERIFY ?auto_3010 ?auto_3011 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3018 - DIRECTION
      ?auto_3019 - MODE
      ?auto_3021 - DIRECTION
      ?auto_3020 - MODE
    )
    :vars
    (
      ?auto_3025 - INSTRUMENT
      ?auto_3023 - SATELLITE
      ?auto_3024 - DIRECTION
      ?auto_3022 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_3025 ?auto_3023 ) ( SUPPORTS ?auto_3025 ?auto_3020 ) ( not ( = ?auto_3021 ?auto_3024 ) ) ( not ( = ?auto_3018 ?auto_3021 ) ) ( not ( = ?auto_3018 ?auto_3024 ) ) ( not ( = ?auto_3019 ?auto_3020 ) ) ( CALIBRATION_TARGET ?auto_3025 ?auto_3024 ) ( POINTING ?auto_3023 ?auto_3018 ) ( ON_BOARD ?auto_3022 ?auto_3023 ) ( POWER_ON ?auto_3022 ) ( not ( = ?auto_3025 ?auto_3022 ) ) ( CALIBRATED ?auto_3022 ) ( SUPPORTS ?auto_3022 ?auto_3019 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3021 ?auto_3020 )
      ( GET-2IMAGE-VERIFY ?auto_3018 ?auto_3019 ?auto_3021 ?auto_3020 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3026 - DIRECTION
      ?auto_3027 - MODE
      ?auto_3029 - DIRECTION
      ?auto_3028 - MODE
    )
    :vars
    (
      ?auto_3031 - INSTRUMENT
      ?auto_3033 - SATELLITE
      ?auto_3032 - DIRECTION
      ?auto_3030 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_3031 ?auto_3033 ) ( SUPPORTS ?auto_3031 ?auto_3027 ) ( not ( = ?auto_3026 ?auto_3032 ) ) ( not ( = ?auto_3029 ?auto_3026 ) ) ( not ( = ?auto_3029 ?auto_3032 ) ) ( not ( = ?auto_3028 ?auto_3027 ) ) ( CALIBRATION_TARGET ?auto_3031 ?auto_3032 ) ( POINTING ?auto_3033 ?auto_3029 ) ( ON_BOARD ?auto_3030 ?auto_3033 ) ( POWER_ON ?auto_3030 ) ( not ( = ?auto_3031 ?auto_3030 ) ) ( CALIBRATED ?auto_3030 ) ( SUPPORTS ?auto_3030 ?auto_3028 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3029 ?auto_3028 ?auto_3026 ?auto_3027 )
      ( GET-2IMAGE-VERIFY ?auto_3026 ?auto_3027 ?auto_3029 ?auto_3028 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3116 - DIRECTION
      ?auto_3117 - MODE
    )
    :vars
    (
      ?auto_3119 - INSTRUMENT
      ?auto_3121 - SATELLITE
      ?auto_3120 - DIRECTION
      ?auto_3123 - DIRECTION
      ?auto_3122 - MODE
      ?auto_3118 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_3119 ?auto_3121 ) ( SUPPORTS ?auto_3119 ?auto_3117 ) ( not ( = ?auto_3116 ?auto_3120 ) ) ( not ( = ?auto_3123 ?auto_3116 ) ) ( not ( = ?auto_3123 ?auto_3120 ) ) ( not ( = ?auto_3122 ?auto_3117 ) ) ( CALIBRATION_TARGET ?auto_3119 ?auto_3120 ) ( ON_BOARD ?auto_3118 ?auto_3121 ) ( POWER_ON ?auto_3118 ) ( not ( = ?auto_3119 ?auto_3118 ) ) ( CALIBRATED ?auto_3118 ) ( SUPPORTS ?auto_3118 ?auto_3122 ) ( POINTING ?auto_3121 ?auto_3120 ) )
    :subtasks
    ( ( !TURN_TO ?auto_3121 ?auto_3123 ?auto_3120 )
      ( GET-2IMAGE ?auto_3123 ?auto_3122 ?auto_3116 ?auto_3117 )
      ( GET-1IMAGE-VERIFY ?auto_3116 ?auto_3117 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3124 - DIRECTION
      ?auto_3125 - MODE
      ?auto_3127 - DIRECTION
      ?auto_3126 - MODE
    )
    :vars
    (
      ?auto_3129 - INSTRUMENT
      ?auto_3131 - SATELLITE
      ?auto_3128 - DIRECTION
      ?auto_3130 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_3129 ?auto_3131 ) ( SUPPORTS ?auto_3129 ?auto_3126 ) ( not ( = ?auto_3127 ?auto_3128 ) ) ( not ( = ?auto_3124 ?auto_3127 ) ) ( not ( = ?auto_3124 ?auto_3128 ) ) ( not ( = ?auto_3125 ?auto_3126 ) ) ( CALIBRATION_TARGET ?auto_3129 ?auto_3128 ) ( ON_BOARD ?auto_3130 ?auto_3131 ) ( POWER_ON ?auto_3130 ) ( not ( = ?auto_3129 ?auto_3130 ) ) ( CALIBRATED ?auto_3130 ) ( SUPPORTS ?auto_3130 ?auto_3125 ) ( POINTING ?auto_3131 ?auto_3128 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3127 ?auto_3126 )
      ( GET-2IMAGE-VERIFY ?auto_3124 ?auto_3125 ?auto_3127 ?auto_3126 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3132 - DIRECTION
      ?auto_3133 - MODE
      ?auto_3135 - DIRECTION
      ?auto_3134 - MODE
    )
    :vars
    (
      ?auto_3138 - INSTRUMENT
      ?auto_3137 - SATELLITE
      ?auto_3136 - DIRECTION
      ?auto_3139 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_3138 ?auto_3137 ) ( SUPPORTS ?auto_3138 ?auto_3133 ) ( not ( = ?auto_3132 ?auto_3136 ) ) ( not ( = ?auto_3135 ?auto_3132 ) ) ( not ( = ?auto_3135 ?auto_3136 ) ) ( not ( = ?auto_3134 ?auto_3133 ) ) ( CALIBRATION_TARGET ?auto_3138 ?auto_3136 ) ( ON_BOARD ?auto_3139 ?auto_3137 ) ( POWER_ON ?auto_3139 ) ( not ( = ?auto_3138 ?auto_3139 ) ) ( CALIBRATED ?auto_3139 ) ( SUPPORTS ?auto_3139 ?auto_3134 ) ( POINTING ?auto_3137 ?auto_3136 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3135 ?auto_3134 ?auto_3132 ?auto_3133 )
      ( GET-2IMAGE-VERIFY ?auto_3132 ?auto_3133 ?auto_3135 ?auto_3134 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3222 - DIRECTION
      ?auto_3223 - MODE
    )
    :vars
    (
      ?auto_3226 - INSTRUMENT
      ?auto_3225 - SATELLITE
      ?auto_3224 - DIRECTION
      ?auto_3229 - DIRECTION
      ?auto_3228 - MODE
      ?auto_3227 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_3226 ?auto_3225 ) ( SUPPORTS ?auto_3226 ?auto_3223 ) ( not ( = ?auto_3222 ?auto_3224 ) ) ( not ( = ?auto_3229 ?auto_3222 ) ) ( not ( = ?auto_3229 ?auto_3224 ) ) ( not ( = ?auto_3228 ?auto_3223 ) ) ( CALIBRATION_TARGET ?auto_3226 ?auto_3224 ) ( ON_BOARD ?auto_3227 ?auto_3225 ) ( POWER_ON ?auto_3227 ) ( not ( = ?auto_3226 ?auto_3227 ) ) ( SUPPORTS ?auto_3227 ?auto_3228 ) ( POINTING ?auto_3225 ?auto_3224 ) ( CALIBRATION_TARGET ?auto_3227 ?auto_3224 ) ( NOT_CALIBRATED ?auto_3227 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_3225 ?auto_3227 ?auto_3224 )
      ( GET-2IMAGE ?auto_3229 ?auto_3228 ?auto_3222 ?auto_3223 )
      ( GET-1IMAGE-VERIFY ?auto_3222 ?auto_3223 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3230 - DIRECTION
      ?auto_3231 - MODE
      ?auto_3233 - DIRECTION
      ?auto_3232 - MODE
    )
    :vars
    (
      ?auto_3235 - INSTRUMENT
      ?auto_3234 - SATELLITE
      ?auto_3237 - DIRECTION
      ?auto_3236 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_3235 ?auto_3234 ) ( SUPPORTS ?auto_3235 ?auto_3232 ) ( not ( = ?auto_3233 ?auto_3237 ) ) ( not ( = ?auto_3230 ?auto_3233 ) ) ( not ( = ?auto_3230 ?auto_3237 ) ) ( not ( = ?auto_3231 ?auto_3232 ) ) ( CALIBRATION_TARGET ?auto_3235 ?auto_3237 ) ( ON_BOARD ?auto_3236 ?auto_3234 ) ( POWER_ON ?auto_3236 ) ( not ( = ?auto_3235 ?auto_3236 ) ) ( SUPPORTS ?auto_3236 ?auto_3231 ) ( POINTING ?auto_3234 ?auto_3237 ) ( CALIBRATION_TARGET ?auto_3236 ?auto_3237 ) ( NOT_CALIBRATED ?auto_3236 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3233 ?auto_3232 )
      ( GET-2IMAGE-VERIFY ?auto_3230 ?auto_3231 ?auto_3233 ?auto_3232 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3238 - DIRECTION
      ?auto_3239 - MODE
      ?auto_3241 - DIRECTION
      ?auto_3240 - MODE
    )
    :vars
    (
      ?auto_3245 - INSTRUMENT
      ?auto_3243 - SATELLITE
      ?auto_3242 - DIRECTION
      ?auto_3244 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_3245 ?auto_3243 ) ( SUPPORTS ?auto_3245 ?auto_3239 ) ( not ( = ?auto_3238 ?auto_3242 ) ) ( not ( = ?auto_3241 ?auto_3238 ) ) ( not ( = ?auto_3241 ?auto_3242 ) ) ( not ( = ?auto_3240 ?auto_3239 ) ) ( CALIBRATION_TARGET ?auto_3245 ?auto_3242 ) ( ON_BOARD ?auto_3244 ?auto_3243 ) ( POWER_ON ?auto_3244 ) ( not ( = ?auto_3245 ?auto_3244 ) ) ( SUPPORTS ?auto_3244 ?auto_3240 ) ( POINTING ?auto_3243 ?auto_3242 ) ( CALIBRATION_TARGET ?auto_3244 ?auto_3242 ) ( NOT_CALIBRATED ?auto_3244 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3241 ?auto_3240 ?auto_3238 ?auto_3239 )
      ( GET-2IMAGE-VERIFY ?auto_3238 ?auto_3239 ?auto_3241 ?auto_3240 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3328 - DIRECTION
      ?auto_3329 - MODE
    )
    :vars
    (
      ?auto_3333 - INSTRUMENT
      ?auto_3331 - SATELLITE
      ?auto_3330 - DIRECTION
      ?auto_3335 - DIRECTION
      ?auto_3334 - MODE
      ?auto_3332 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_3333 ?auto_3331 ) ( SUPPORTS ?auto_3333 ?auto_3329 ) ( not ( = ?auto_3328 ?auto_3330 ) ) ( not ( = ?auto_3335 ?auto_3328 ) ) ( not ( = ?auto_3335 ?auto_3330 ) ) ( not ( = ?auto_3334 ?auto_3329 ) ) ( CALIBRATION_TARGET ?auto_3333 ?auto_3330 ) ( ON_BOARD ?auto_3332 ?auto_3331 ) ( not ( = ?auto_3333 ?auto_3332 ) ) ( SUPPORTS ?auto_3332 ?auto_3334 ) ( POINTING ?auto_3331 ?auto_3330 ) ( CALIBRATION_TARGET ?auto_3332 ?auto_3330 ) ( POWER_AVAIL ?auto_3331 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_3332 ?auto_3331 )
      ( GET-2IMAGE ?auto_3335 ?auto_3334 ?auto_3328 ?auto_3329 )
      ( GET-1IMAGE-VERIFY ?auto_3328 ?auto_3329 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3336 - DIRECTION
      ?auto_3337 - MODE
      ?auto_3339 - DIRECTION
      ?auto_3338 - MODE
    )
    :vars
    (
      ?auto_3343 - INSTRUMENT
      ?auto_3340 - SATELLITE
      ?auto_3341 - DIRECTION
      ?auto_3342 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_3343 ?auto_3340 ) ( SUPPORTS ?auto_3343 ?auto_3338 ) ( not ( = ?auto_3339 ?auto_3341 ) ) ( not ( = ?auto_3336 ?auto_3339 ) ) ( not ( = ?auto_3336 ?auto_3341 ) ) ( not ( = ?auto_3337 ?auto_3338 ) ) ( CALIBRATION_TARGET ?auto_3343 ?auto_3341 ) ( ON_BOARD ?auto_3342 ?auto_3340 ) ( not ( = ?auto_3343 ?auto_3342 ) ) ( SUPPORTS ?auto_3342 ?auto_3337 ) ( POINTING ?auto_3340 ?auto_3341 ) ( CALIBRATION_TARGET ?auto_3342 ?auto_3341 ) ( POWER_AVAIL ?auto_3340 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3339 ?auto_3338 )
      ( GET-2IMAGE-VERIFY ?auto_3336 ?auto_3337 ?auto_3339 ?auto_3338 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3344 - DIRECTION
      ?auto_3345 - MODE
      ?auto_3347 - DIRECTION
      ?auto_3346 - MODE
    )
    :vars
    (
      ?auto_3348 - INSTRUMENT
      ?auto_3349 - SATELLITE
      ?auto_3351 - DIRECTION
      ?auto_3350 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_3348 ?auto_3349 ) ( SUPPORTS ?auto_3348 ?auto_3345 ) ( not ( = ?auto_3344 ?auto_3351 ) ) ( not ( = ?auto_3347 ?auto_3344 ) ) ( not ( = ?auto_3347 ?auto_3351 ) ) ( not ( = ?auto_3346 ?auto_3345 ) ) ( CALIBRATION_TARGET ?auto_3348 ?auto_3351 ) ( ON_BOARD ?auto_3350 ?auto_3349 ) ( not ( = ?auto_3348 ?auto_3350 ) ) ( SUPPORTS ?auto_3350 ?auto_3346 ) ( POINTING ?auto_3349 ?auto_3351 ) ( CALIBRATION_TARGET ?auto_3350 ?auto_3351 ) ( POWER_AVAIL ?auto_3349 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3347 ?auto_3346 ?auto_3344 ?auto_3345 )
      ( GET-2IMAGE-VERIFY ?auto_3344 ?auto_3345 ?auto_3347 ?auto_3346 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3434 - DIRECTION
      ?auto_3435 - MODE
    )
    :vars
    (
      ?auto_3436 - INSTRUMENT
      ?auto_3437 - SATELLITE
      ?auto_3439 - DIRECTION
      ?auto_3441 - DIRECTION
      ?auto_3440 - MODE
      ?auto_3438 - INSTRUMENT
      ?auto_3442 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_3436 ?auto_3437 ) ( SUPPORTS ?auto_3436 ?auto_3435 ) ( not ( = ?auto_3434 ?auto_3439 ) ) ( not ( = ?auto_3441 ?auto_3434 ) ) ( not ( = ?auto_3441 ?auto_3439 ) ) ( not ( = ?auto_3440 ?auto_3435 ) ) ( CALIBRATION_TARGET ?auto_3436 ?auto_3439 ) ( ON_BOARD ?auto_3438 ?auto_3437 ) ( not ( = ?auto_3436 ?auto_3438 ) ) ( SUPPORTS ?auto_3438 ?auto_3440 ) ( CALIBRATION_TARGET ?auto_3438 ?auto_3439 ) ( POWER_AVAIL ?auto_3437 ) ( POINTING ?auto_3437 ?auto_3442 ) ( not ( = ?auto_3439 ?auto_3442 ) ) ( not ( = ?auto_3434 ?auto_3442 ) ) ( not ( = ?auto_3441 ?auto_3442 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_3437 ?auto_3439 ?auto_3442 )
      ( GET-2IMAGE ?auto_3441 ?auto_3440 ?auto_3434 ?auto_3435 )
      ( GET-1IMAGE-VERIFY ?auto_3434 ?auto_3435 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3443 - DIRECTION
      ?auto_3444 - MODE
      ?auto_3446 - DIRECTION
      ?auto_3445 - MODE
    )
    :vars
    (
      ?auto_3447 - INSTRUMENT
      ?auto_3449 - SATELLITE
      ?auto_3450 - DIRECTION
      ?auto_3448 - INSTRUMENT
      ?auto_3451 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_3447 ?auto_3449 ) ( SUPPORTS ?auto_3447 ?auto_3445 ) ( not ( = ?auto_3446 ?auto_3450 ) ) ( not ( = ?auto_3443 ?auto_3446 ) ) ( not ( = ?auto_3443 ?auto_3450 ) ) ( not ( = ?auto_3444 ?auto_3445 ) ) ( CALIBRATION_TARGET ?auto_3447 ?auto_3450 ) ( ON_BOARD ?auto_3448 ?auto_3449 ) ( not ( = ?auto_3447 ?auto_3448 ) ) ( SUPPORTS ?auto_3448 ?auto_3444 ) ( CALIBRATION_TARGET ?auto_3448 ?auto_3450 ) ( POWER_AVAIL ?auto_3449 ) ( POINTING ?auto_3449 ?auto_3451 ) ( not ( = ?auto_3450 ?auto_3451 ) ) ( not ( = ?auto_3446 ?auto_3451 ) ) ( not ( = ?auto_3443 ?auto_3451 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3446 ?auto_3445 )
      ( GET-2IMAGE-VERIFY ?auto_3443 ?auto_3444 ?auto_3446 ?auto_3445 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3452 - DIRECTION
      ?auto_3453 - MODE
      ?auto_3455 - DIRECTION
      ?auto_3454 - MODE
    )
    :vars
    (
      ?auto_3457 - INSTRUMENT
      ?auto_3456 - SATELLITE
      ?auto_3460 - DIRECTION
      ?auto_3459 - INSTRUMENT
      ?auto_3458 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_3457 ?auto_3456 ) ( SUPPORTS ?auto_3457 ?auto_3453 ) ( not ( = ?auto_3452 ?auto_3460 ) ) ( not ( = ?auto_3455 ?auto_3452 ) ) ( not ( = ?auto_3455 ?auto_3460 ) ) ( not ( = ?auto_3454 ?auto_3453 ) ) ( CALIBRATION_TARGET ?auto_3457 ?auto_3460 ) ( ON_BOARD ?auto_3459 ?auto_3456 ) ( not ( = ?auto_3457 ?auto_3459 ) ) ( SUPPORTS ?auto_3459 ?auto_3454 ) ( CALIBRATION_TARGET ?auto_3459 ?auto_3460 ) ( POWER_AVAIL ?auto_3456 ) ( POINTING ?auto_3456 ?auto_3458 ) ( not ( = ?auto_3460 ?auto_3458 ) ) ( not ( = ?auto_3452 ?auto_3458 ) ) ( not ( = ?auto_3455 ?auto_3458 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3455 ?auto_3454 ?auto_3452 ?auto_3453 )
      ( GET-2IMAGE-VERIFY ?auto_3452 ?auto_3453 ?auto_3455 ?auto_3454 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3687 - DIRECTION
      ?auto_3688 - MODE
    )
    :vars
    (
      ?auto_3689 - INSTRUMENT
      ?auto_3690 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3689 ) ( ON_BOARD ?auto_3689 ?auto_3690 ) ( SUPPORTS ?auto_3689 ?auto_3688 ) ( POWER_ON ?auto_3689 ) ( POINTING ?auto_3690 ?auto_3687 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_3690 ?auto_3687 ?auto_3689 ?auto_3688 )
      ( GET-1IMAGE-VERIFY ?auto_3687 ?auto_3688 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3691 - DIRECTION
      ?auto_3692 - MODE
      ?auto_3694 - DIRECTION
      ?auto_3693 - MODE
    )
    :vars
    (
      ?auto_3695 - INSTRUMENT
      ?auto_3696 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3695 ) ( ON_BOARD ?auto_3695 ?auto_3696 ) ( SUPPORTS ?auto_3695 ?auto_3693 ) ( POWER_ON ?auto_3695 ) ( POINTING ?auto_3696 ?auto_3694 ) ( HAVE_IMAGE ?auto_3691 ?auto_3692 ) ( not ( = ?auto_3691 ?auto_3694 ) ) ( not ( = ?auto_3692 ?auto_3693 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3694 ?auto_3693 )
      ( GET-2IMAGE-VERIFY ?auto_3691 ?auto_3692 ?auto_3694 ?auto_3693 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3697 - DIRECTION
      ?auto_3698 - MODE
      ?auto_3700 - DIRECTION
      ?auto_3699 - MODE
    )
    :vars
    (
      ?auto_3701 - INSTRUMENT
      ?auto_3702 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3701 ) ( ON_BOARD ?auto_3701 ?auto_3702 ) ( SUPPORTS ?auto_3701 ?auto_3699 ) ( POWER_ON ?auto_3701 ) ( POINTING ?auto_3702 ?auto_3700 ) ( HAVE_IMAGE ?auto_3697 ?auto_3698 ) ( not ( = ?auto_3697 ?auto_3700 ) ) ( not ( = ?auto_3698 ?auto_3699 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3700 ?auto_3699 )
      ( GET-2IMAGE-VERIFY ?auto_3697 ?auto_3698 ?auto_3700 ?auto_3699 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3703 - DIRECTION
      ?auto_3704 - MODE
      ?auto_3706 - DIRECTION
      ?auto_3705 - MODE
    )
    :vars
    (
      ?auto_3707 - INSTRUMENT
      ?auto_3708 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3707 ) ( ON_BOARD ?auto_3707 ?auto_3708 ) ( SUPPORTS ?auto_3707 ?auto_3704 ) ( POWER_ON ?auto_3707 ) ( POINTING ?auto_3708 ?auto_3703 ) ( HAVE_IMAGE ?auto_3706 ?auto_3705 ) ( not ( = ?auto_3703 ?auto_3706 ) ) ( not ( = ?auto_3704 ?auto_3705 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3703 ?auto_3704 )
      ( GET-2IMAGE-VERIFY ?auto_3703 ?auto_3704 ?auto_3706 ?auto_3705 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3709 - DIRECTION
      ?auto_3710 - MODE
      ?auto_3712 - DIRECTION
      ?auto_3711 - MODE
    )
    :vars
    (
      ?auto_3713 - INSTRUMENT
      ?auto_3714 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3713 ) ( ON_BOARD ?auto_3713 ?auto_3714 ) ( SUPPORTS ?auto_3713 ?auto_3710 ) ( POWER_ON ?auto_3713 ) ( POINTING ?auto_3714 ?auto_3709 ) ( HAVE_IMAGE ?auto_3712 ?auto_3711 ) ( not ( = ?auto_3709 ?auto_3712 ) ) ( not ( = ?auto_3710 ?auto_3711 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3709 ?auto_3710 )
      ( GET-2IMAGE-VERIFY ?auto_3709 ?auto_3710 ?auto_3712 ?auto_3711 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3721 - DIRECTION
      ?auto_3722 - MODE
      ?auto_3724 - DIRECTION
      ?auto_3723 - MODE
      ?auto_3726 - DIRECTION
      ?auto_3725 - MODE
    )
    :vars
    (
      ?auto_3727 - INSTRUMENT
      ?auto_3728 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3727 ) ( ON_BOARD ?auto_3727 ?auto_3728 ) ( SUPPORTS ?auto_3727 ?auto_3725 ) ( POWER_ON ?auto_3727 ) ( POINTING ?auto_3728 ?auto_3726 ) ( HAVE_IMAGE ?auto_3721 ?auto_3722 ) ( HAVE_IMAGE ?auto_3724 ?auto_3723 ) ( not ( = ?auto_3721 ?auto_3724 ) ) ( not ( = ?auto_3721 ?auto_3726 ) ) ( not ( = ?auto_3722 ?auto_3723 ) ) ( not ( = ?auto_3722 ?auto_3725 ) ) ( not ( = ?auto_3724 ?auto_3726 ) ) ( not ( = ?auto_3723 ?auto_3725 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3726 ?auto_3725 )
      ( GET-3IMAGE-VERIFY ?auto_3721 ?auto_3722 ?auto_3724 ?auto_3723 ?auto_3726 ?auto_3725 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3729 - DIRECTION
      ?auto_3730 - MODE
      ?auto_3732 - DIRECTION
      ?auto_3731 - MODE
      ?auto_3734 - DIRECTION
      ?auto_3733 - MODE
    )
    :vars
    (
      ?auto_3735 - INSTRUMENT
      ?auto_3736 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3735 ) ( ON_BOARD ?auto_3735 ?auto_3736 ) ( SUPPORTS ?auto_3735 ?auto_3733 ) ( POWER_ON ?auto_3735 ) ( POINTING ?auto_3736 ?auto_3734 ) ( HAVE_IMAGE ?auto_3729 ?auto_3730 ) ( HAVE_IMAGE ?auto_3732 ?auto_3731 ) ( not ( = ?auto_3729 ?auto_3732 ) ) ( not ( = ?auto_3729 ?auto_3734 ) ) ( not ( = ?auto_3730 ?auto_3731 ) ) ( not ( = ?auto_3730 ?auto_3733 ) ) ( not ( = ?auto_3732 ?auto_3734 ) ) ( not ( = ?auto_3731 ?auto_3733 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3734 ?auto_3733 )
      ( GET-3IMAGE-VERIFY ?auto_3729 ?auto_3730 ?auto_3732 ?auto_3731 ?auto_3734 ?auto_3733 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3737 - DIRECTION
      ?auto_3738 - MODE
      ?auto_3740 - DIRECTION
      ?auto_3739 - MODE
      ?auto_3742 - DIRECTION
      ?auto_3741 - MODE
    )
    :vars
    (
      ?auto_3743 - INSTRUMENT
      ?auto_3744 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3743 ) ( ON_BOARD ?auto_3743 ?auto_3744 ) ( SUPPORTS ?auto_3743 ?auto_3739 ) ( POWER_ON ?auto_3743 ) ( POINTING ?auto_3744 ?auto_3740 ) ( HAVE_IMAGE ?auto_3737 ?auto_3738 ) ( HAVE_IMAGE ?auto_3742 ?auto_3741 ) ( not ( = ?auto_3737 ?auto_3740 ) ) ( not ( = ?auto_3737 ?auto_3742 ) ) ( not ( = ?auto_3738 ?auto_3739 ) ) ( not ( = ?auto_3738 ?auto_3741 ) ) ( not ( = ?auto_3740 ?auto_3742 ) ) ( not ( = ?auto_3739 ?auto_3741 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3740 ?auto_3739 )
      ( GET-3IMAGE-VERIFY ?auto_3737 ?auto_3738 ?auto_3740 ?auto_3739 ?auto_3742 ?auto_3741 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3745 - DIRECTION
      ?auto_3746 - MODE
      ?auto_3748 - DIRECTION
      ?auto_3747 - MODE
      ?auto_3750 - DIRECTION
      ?auto_3749 - MODE
    )
    :vars
    (
      ?auto_3751 - INSTRUMENT
      ?auto_3752 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3751 ) ( ON_BOARD ?auto_3751 ?auto_3752 ) ( SUPPORTS ?auto_3751 ?auto_3747 ) ( POWER_ON ?auto_3751 ) ( POINTING ?auto_3752 ?auto_3748 ) ( HAVE_IMAGE ?auto_3745 ?auto_3746 ) ( HAVE_IMAGE ?auto_3750 ?auto_3749 ) ( not ( = ?auto_3745 ?auto_3748 ) ) ( not ( = ?auto_3745 ?auto_3750 ) ) ( not ( = ?auto_3746 ?auto_3747 ) ) ( not ( = ?auto_3746 ?auto_3749 ) ) ( not ( = ?auto_3748 ?auto_3750 ) ) ( not ( = ?auto_3747 ?auto_3749 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3748 ?auto_3747 )
      ( GET-3IMAGE-VERIFY ?auto_3745 ?auto_3746 ?auto_3748 ?auto_3747 ?auto_3750 ?auto_3749 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3761 - DIRECTION
      ?auto_3762 - MODE
      ?auto_3764 - DIRECTION
      ?auto_3763 - MODE
      ?auto_3766 - DIRECTION
      ?auto_3765 - MODE
    )
    :vars
    (
      ?auto_3767 - INSTRUMENT
      ?auto_3768 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3767 ) ( ON_BOARD ?auto_3767 ?auto_3768 ) ( SUPPORTS ?auto_3767 ?auto_3765 ) ( POWER_ON ?auto_3767 ) ( POINTING ?auto_3768 ?auto_3766 ) ( HAVE_IMAGE ?auto_3761 ?auto_3762 ) ( HAVE_IMAGE ?auto_3764 ?auto_3763 ) ( not ( = ?auto_3761 ?auto_3764 ) ) ( not ( = ?auto_3761 ?auto_3766 ) ) ( not ( = ?auto_3762 ?auto_3763 ) ) ( not ( = ?auto_3762 ?auto_3765 ) ) ( not ( = ?auto_3764 ?auto_3766 ) ) ( not ( = ?auto_3763 ?auto_3765 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3766 ?auto_3765 )
      ( GET-3IMAGE-VERIFY ?auto_3761 ?auto_3762 ?auto_3764 ?auto_3763 ?auto_3766 ?auto_3765 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3769 - DIRECTION
      ?auto_3770 - MODE
      ?auto_3772 - DIRECTION
      ?auto_3771 - MODE
      ?auto_3774 - DIRECTION
      ?auto_3773 - MODE
    )
    :vars
    (
      ?auto_3775 - INSTRUMENT
      ?auto_3776 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3775 ) ( ON_BOARD ?auto_3775 ?auto_3776 ) ( SUPPORTS ?auto_3775 ?auto_3773 ) ( POWER_ON ?auto_3775 ) ( POINTING ?auto_3776 ?auto_3774 ) ( HAVE_IMAGE ?auto_3769 ?auto_3770 ) ( HAVE_IMAGE ?auto_3772 ?auto_3771 ) ( not ( = ?auto_3769 ?auto_3772 ) ) ( not ( = ?auto_3769 ?auto_3774 ) ) ( not ( = ?auto_3770 ?auto_3771 ) ) ( not ( = ?auto_3770 ?auto_3773 ) ) ( not ( = ?auto_3772 ?auto_3774 ) ) ( not ( = ?auto_3771 ?auto_3773 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3774 ?auto_3773 )
      ( GET-3IMAGE-VERIFY ?auto_3769 ?auto_3770 ?auto_3772 ?auto_3771 ?auto_3774 ?auto_3773 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3777 - DIRECTION
      ?auto_3778 - MODE
      ?auto_3780 - DIRECTION
      ?auto_3779 - MODE
      ?auto_3782 - DIRECTION
      ?auto_3781 - MODE
    )
    :vars
    (
      ?auto_3783 - INSTRUMENT
      ?auto_3784 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3783 ) ( ON_BOARD ?auto_3783 ?auto_3784 ) ( SUPPORTS ?auto_3783 ?auto_3779 ) ( POWER_ON ?auto_3783 ) ( POINTING ?auto_3784 ?auto_3780 ) ( HAVE_IMAGE ?auto_3777 ?auto_3778 ) ( HAVE_IMAGE ?auto_3782 ?auto_3781 ) ( not ( = ?auto_3777 ?auto_3780 ) ) ( not ( = ?auto_3777 ?auto_3782 ) ) ( not ( = ?auto_3778 ?auto_3779 ) ) ( not ( = ?auto_3778 ?auto_3781 ) ) ( not ( = ?auto_3780 ?auto_3782 ) ) ( not ( = ?auto_3779 ?auto_3781 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3780 ?auto_3779 )
      ( GET-3IMAGE-VERIFY ?auto_3777 ?auto_3778 ?auto_3780 ?auto_3779 ?auto_3782 ?auto_3781 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3785 - DIRECTION
      ?auto_3786 - MODE
      ?auto_3788 - DIRECTION
      ?auto_3787 - MODE
      ?auto_3790 - DIRECTION
      ?auto_3789 - MODE
    )
    :vars
    (
      ?auto_3791 - INSTRUMENT
      ?auto_3792 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3791 ) ( ON_BOARD ?auto_3791 ?auto_3792 ) ( SUPPORTS ?auto_3791 ?auto_3787 ) ( POWER_ON ?auto_3791 ) ( POINTING ?auto_3792 ?auto_3788 ) ( HAVE_IMAGE ?auto_3785 ?auto_3786 ) ( HAVE_IMAGE ?auto_3790 ?auto_3789 ) ( not ( = ?auto_3785 ?auto_3788 ) ) ( not ( = ?auto_3785 ?auto_3790 ) ) ( not ( = ?auto_3786 ?auto_3787 ) ) ( not ( = ?auto_3786 ?auto_3789 ) ) ( not ( = ?auto_3788 ?auto_3790 ) ) ( not ( = ?auto_3787 ?auto_3789 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3788 ?auto_3787 )
      ( GET-3IMAGE-VERIFY ?auto_3785 ?auto_3786 ?auto_3788 ?auto_3787 ?auto_3790 ?auto_3789 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3801 - DIRECTION
      ?auto_3802 - MODE
      ?auto_3804 - DIRECTION
      ?auto_3803 - MODE
      ?auto_3806 - DIRECTION
      ?auto_3805 - MODE
    )
    :vars
    (
      ?auto_3807 - INSTRUMENT
      ?auto_3808 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3807 ) ( ON_BOARD ?auto_3807 ?auto_3808 ) ( SUPPORTS ?auto_3807 ?auto_3802 ) ( POWER_ON ?auto_3807 ) ( POINTING ?auto_3808 ?auto_3801 ) ( HAVE_IMAGE ?auto_3804 ?auto_3803 ) ( HAVE_IMAGE ?auto_3806 ?auto_3805 ) ( not ( = ?auto_3801 ?auto_3804 ) ) ( not ( = ?auto_3801 ?auto_3806 ) ) ( not ( = ?auto_3802 ?auto_3803 ) ) ( not ( = ?auto_3802 ?auto_3805 ) ) ( not ( = ?auto_3804 ?auto_3806 ) ) ( not ( = ?auto_3803 ?auto_3805 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3801 ?auto_3802 )
      ( GET-3IMAGE-VERIFY ?auto_3801 ?auto_3802 ?auto_3804 ?auto_3803 ?auto_3806 ?auto_3805 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3809 - DIRECTION
      ?auto_3810 - MODE
      ?auto_3812 - DIRECTION
      ?auto_3811 - MODE
      ?auto_3814 - DIRECTION
      ?auto_3813 - MODE
    )
    :vars
    (
      ?auto_3815 - INSTRUMENT
      ?auto_3816 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3815 ) ( ON_BOARD ?auto_3815 ?auto_3816 ) ( SUPPORTS ?auto_3815 ?auto_3810 ) ( POWER_ON ?auto_3815 ) ( POINTING ?auto_3816 ?auto_3809 ) ( HAVE_IMAGE ?auto_3812 ?auto_3811 ) ( HAVE_IMAGE ?auto_3814 ?auto_3813 ) ( not ( = ?auto_3809 ?auto_3812 ) ) ( not ( = ?auto_3809 ?auto_3814 ) ) ( not ( = ?auto_3810 ?auto_3811 ) ) ( not ( = ?auto_3810 ?auto_3813 ) ) ( not ( = ?auto_3812 ?auto_3814 ) ) ( not ( = ?auto_3811 ?auto_3813 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3809 ?auto_3810 )
      ( GET-3IMAGE-VERIFY ?auto_3809 ?auto_3810 ?auto_3812 ?auto_3811 ?auto_3814 ?auto_3813 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3825 - DIRECTION
      ?auto_3826 - MODE
      ?auto_3828 - DIRECTION
      ?auto_3827 - MODE
      ?auto_3830 - DIRECTION
      ?auto_3829 - MODE
    )
    :vars
    (
      ?auto_3831 - INSTRUMENT
      ?auto_3832 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3831 ) ( ON_BOARD ?auto_3831 ?auto_3832 ) ( SUPPORTS ?auto_3831 ?auto_3826 ) ( POWER_ON ?auto_3831 ) ( POINTING ?auto_3832 ?auto_3825 ) ( HAVE_IMAGE ?auto_3828 ?auto_3827 ) ( HAVE_IMAGE ?auto_3830 ?auto_3829 ) ( not ( = ?auto_3825 ?auto_3828 ) ) ( not ( = ?auto_3825 ?auto_3830 ) ) ( not ( = ?auto_3826 ?auto_3827 ) ) ( not ( = ?auto_3826 ?auto_3829 ) ) ( not ( = ?auto_3828 ?auto_3830 ) ) ( not ( = ?auto_3827 ?auto_3829 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3825 ?auto_3826 )
      ( GET-3IMAGE-VERIFY ?auto_3825 ?auto_3826 ?auto_3828 ?auto_3827 ?auto_3830 ?auto_3829 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3833 - DIRECTION
      ?auto_3834 - MODE
      ?auto_3836 - DIRECTION
      ?auto_3835 - MODE
      ?auto_3838 - DIRECTION
      ?auto_3837 - MODE
    )
    :vars
    (
      ?auto_3839 - INSTRUMENT
      ?auto_3840 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3839 ) ( ON_BOARD ?auto_3839 ?auto_3840 ) ( SUPPORTS ?auto_3839 ?auto_3834 ) ( POWER_ON ?auto_3839 ) ( POINTING ?auto_3840 ?auto_3833 ) ( HAVE_IMAGE ?auto_3836 ?auto_3835 ) ( HAVE_IMAGE ?auto_3838 ?auto_3837 ) ( not ( = ?auto_3833 ?auto_3836 ) ) ( not ( = ?auto_3833 ?auto_3838 ) ) ( not ( = ?auto_3834 ?auto_3835 ) ) ( not ( = ?auto_3834 ?auto_3837 ) ) ( not ( = ?auto_3836 ?auto_3838 ) ) ( not ( = ?auto_3835 ?auto_3837 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3833 ?auto_3834 )
      ( GET-3IMAGE-VERIFY ?auto_3833 ?auto_3834 ?auto_3836 ?auto_3835 ?auto_3838 ?auto_3837 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3873 - DIRECTION
      ?auto_3874 - MODE
    )
    :vars
    (
      ?auto_3875 - INSTRUMENT
      ?auto_3876 - SATELLITE
      ?auto_3877 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_3875 ) ( ON_BOARD ?auto_3875 ?auto_3876 ) ( SUPPORTS ?auto_3875 ?auto_3874 ) ( POWER_ON ?auto_3875 ) ( POINTING ?auto_3876 ?auto_3877 ) ( not ( = ?auto_3873 ?auto_3877 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_3876 ?auto_3873 ?auto_3877 )
      ( GET-1IMAGE ?auto_3873 ?auto_3874 )
      ( GET-1IMAGE-VERIFY ?auto_3873 ?auto_3874 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3878 - DIRECTION
      ?auto_3879 - MODE
      ?auto_3881 - DIRECTION
      ?auto_3880 - MODE
    )
    :vars
    (
      ?auto_3883 - INSTRUMENT
      ?auto_3882 - SATELLITE
      ?auto_3884 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_3883 ) ( ON_BOARD ?auto_3883 ?auto_3882 ) ( SUPPORTS ?auto_3883 ?auto_3880 ) ( POWER_ON ?auto_3883 ) ( POINTING ?auto_3882 ?auto_3884 ) ( not ( = ?auto_3881 ?auto_3884 ) ) ( HAVE_IMAGE ?auto_3878 ?auto_3879 ) ( not ( = ?auto_3878 ?auto_3881 ) ) ( not ( = ?auto_3878 ?auto_3884 ) ) ( not ( = ?auto_3879 ?auto_3880 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3881 ?auto_3880 )
      ( GET-2IMAGE-VERIFY ?auto_3878 ?auto_3879 ?auto_3881 ?auto_3880 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3885 - DIRECTION
      ?auto_3886 - MODE
      ?auto_3888 - DIRECTION
      ?auto_3887 - MODE
    )
    :vars
    (
      ?auto_3889 - INSTRUMENT
      ?auto_3891 - SATELLITE
      ?auto_3890 - DIRECTION
      ?auto_3893 - DIRECTION
      ?auto_3892 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3889 ) ( ON_BOARD ?auto_3889 ?auto_3891 ) ( SUPPORTS ?auto_3889 ?auto_3887 ) ( POWER_ON ?auto_3889 ) ( POINTING ?auto_3891 ?auto_3890 ) ( not ( = ?auto_3888 ?auto_3890 ) ) ( HAVE_IMAGE ?auto_3893 ?auto_3892 ) ( not ( = ?auto_3893 ?auto_3888 ) ) ( not ( = ?auto_3893 ?auto_3890 ) ) ( not ( = ?auto_3892 ?auto_3887 ) ) ( HAVE_IMAGE ?auto_3885 ?auto_3886 ) ( not ( = ?auto_3885 ?auto_3888 ) ) ( not ( = ?auto_3885 ?auto_3890 ) ) ( not ( = ?auto_3885 ?auto_3893 ) ) ( not ( = ?auto_3886 ?auto_3887 ) ) ( not ( = ?auto_3886 ?auto_3892 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3893 ?auto_3892 ?auto_3888 ?auto_3887 )
      ( GET-2IMAGE-VERIFY ?auto_3885 ?auto_3886 ?auto_3888 ?auto_3887 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3894 - DIRECTION
      ?auto_3895 - MODE
      ?auto_3897 - DIRECTION
      ?auto_3896 - MODE
    )
    :vars
    (
      ?auto_3898 - INSTRUMENT
      ?auto_3900 - SATELLITE
      ?auto_3899 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_3898 ) ( ON_BOARD ?auto_3898 ?auto_3900 ) ( SUPPORTS ?auto_3898 ?auto_3895 ) ( POWER_ON ?auto_3898 ) ( POINTING ?auto_3900 ?auto_3899 ) ( not ( = ?auto_3894 ?auto_3899 ) ) ( HAVE_IMAGE ?auto_3897 ?auto_3896 ) ( not ( = ?auto_3897 ?auto_3894 ) ) ( not ( = ?auto_3897 ?auto_3899 ) ) ( not ( = ?auto_3896 ?auto_3895 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3897 ?auto_3896 ?auto_3894 ?auto_3895 )
      ( GET-2IMAGE-VERIFY ?auto_3894 ?auto_3895 ?auto_3897 ?auto_3896 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3901 - DIRECTION
      ?auto_3902 - MODE
      ?auto_3904 - DIRECTION
      ?auto_3903 - MODE
    )
    :vars
    (
      ?auto_3905 - INSTRUMENT
      ?auto_3907 - SATELLITE
      ?auto_3906 - DIRECTION
      ?auto_3909 - DIRECTION
      ?auto_3908 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3905 ) ( ON_BOARD ?auto_3905 ?auto_3907 ) ( SUPPORTS ?auto_3905 ?auto_3902 ) ( POWER_ON ?auto_3905 ) ( POINTING ?auto_3907 ?auto_3906 ) ( not ( = ?auto_3901 ?auto_3906 ) ) ( HAVE_IMAGE ?auto_3909 ?auto_3908 ) ( not ( = ?auto_3909 ?auto_3901 ) ) ( not ( = ?auto_3909 ?auto_3906 ) ) ( not ( = ?auto_3908 ?auto_3902 ) ) ( HAVE_IMAGE ?auto_3904 ?auto_3903 ) ( not ( = ?auto_3901 ?auto_3904 ) ) ( not ( = ?auto_3902 ?auto_3903 ) ) ( not ( = ?auto_3904 ?auto_3906 ) ) ( not ( = ?auto_3904 ?auto_3909 ) ) ( not ( = ?auto_3903 ?auto_3908 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3909 ?auto_3908 ?auto_3901 ?auto_3902 )
      ( GET-2IMAGE-VERIFY ?auto_3901 ?auto_3902 ?auto_3904 ?auto_3903 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3919 - DIRECTION
      ?auto_3920 - MODE
      ?auto_3922 - DIRECTION
      ?auto_3921 - MODE
      ?auto_3924 - DIRECTION
      ?auto_3923 - MODE
    )
    :vars
    (
      ?auto_3925 - INSTRUMENT
      ?auto_3927 - SATELLITE
      ?auto_3926 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_3925 ) ( ON_BOARD ?auto_3925 ?auto_3927 ) ( SUPPORTS ?auto_3925 ?auto_3923 ) ( POWER_ON ?auto_3925 ) ( POINTING ?auto_3927 ?auto_3926 ) ( not ( = ?auto_3924 ?auto_3926 ) ) ( HAVE_IMAGE ?auto_3919 ?auto_3920 ) ( not ( = ?auto_3919 ?auto_3924 ) ) ( not ( = ?auto_3919 ?auto_3926 ) ) ( not ( = ?auto_3920 ?auto_3923 ) ) ( HAVE_IMAGE ?auto_3922 ?auto_3921 ) ( not ( = ?auto_3919 ?auto_3922 ) ) ( not ( = ?auto_3920 ?auto_3921 ) ) ( not ( = ?auto_3922 ?auto_3924 ) ) ( not ( = ?auto_3922 ?auto_3926 ) ) ( not ( = ?auto_3921 ?auto_3923 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3919 ?auto_3920 ?auto_3924 ?auto_3923 )
      ( GET-3IMAGE-VERIFY ?auto_3919 ?auto_3920 ?auto_3922 ?auto_3921 ?auto_3924 ?auto_3923 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3928 - DIRECTION
      ?auto_3929 - MODE
      ?auto_3931 - DIRECTION
      ?auto_3930 - MODE
      ?auto_3933 - DIRECTION
      ?auto_3932 - MODE
    )
    :vars
    (
      ?auto_3934 - INSTRUMENT
      ?auto_3936 - SATELLITE
      ?auto_3935 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_3934 ) ( ON_BOARD ?auto_3934 ?auto_3936 ) ( SUPPORTS ?auto_3934 ?auto_3932 ) ( POWER_ON ?auto_3934 ) ( POINTING ?auto_3936 ?auto_3935 ) ( not ( = ?auto_3933 ?auto_3935 ) ) ( HAVE_IMAGE ?auto_3928 ?auto_3929 ) ( not ( = ?auto_3928 ?auto_3933 ) ) ( not ( = ?auto_3928 ?auto_3935 ) ) ( not ( = ?auto_3929 ?auto_3932 ) ) ( HAVE_IMAGE ?auto_3931 ?auto_3930 ) ( not ( = ?auto_3928 ?auto_3931 ) ) ( not ( = ?auto_3929 ?auto_3930 ) ) ( not ( = ?auto_3931 ?auto_3933 ) ) ( not ( = ?auto_3931 ?auto_3935 ) ) ( not ( = ?auto_3930 ?auto_3932 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3928 ?auto_3929 ?auto_3933 ?auto_3932 )
      ( GET-3IMAGE-VERIFY ?auto_3928 ?auto_3929 ?auto_3931 ?auto_3930 ?auto_3933 ?auto_3932 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3937 - DIRECTION
      ?auto_3938 - MODE
      ?auto_3940 - DIRECTION
      ?auto_3939 - MODE
      ?auto_3942 - DIRECTION
      ?auto_3941 - MODE
    )
    :vars
    (
      ?auto_3943 - INSTRUMENT
      ?auto_3945 - SATELLITE
      ?auto_3944 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_3943 ) ( ON_BOARD ?auto_3943 ?auto_3945 ) ( SUPPORTS ?auto_3943 ?auto_3939 ) ( POWER_ON ?auto_3943 ) ( POINTING ?auto_3945 ?auto_3944 ) ( not ( = ?auto_3940 ?auto_3944 ) ) ( HAVE_IMAGE ?auto_3942 ?auto_3941 ) ( not ( = ?auto_3942 ?auto_3940 ) ) ( not ( = ?auto_3942 ?auto_3944 ) ) ( not ( = ?auto_3941 ?auto_3939 ) ) ( HAVE_IMAGE ?auto_3937 ?auto_3938 ) ( not ( = ?auto_3937 ?auto_3940 ) ) ( not ( = ?auto_3937 ?auto_3942 ) ) ( not ( = ?auto_3937 ?auto_3944 ) ) ( not ( = ?auto_3938 ?auto_3939 ) ) ( not ( = ?auto_3938 ?auto_3941 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3942 ?auto_3941 ?auto_3940 ?auto_3939 )
      ( GET-3IMAGE-VERIFY ?auto_3937 ?auto_3938 ?auto_3940 ?auto_3939 ?auto_3942 ?auto_3941 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3946 - DIRECTION
      ?auto_3947 - MODE
      ?auto_3949 - DIRECTION
      ?auto_3948 - MODE
      ?auto_3951 - DIRECTION
      ?auto_3950 - MODE
    )
    :vars
    (
      ?auto_3952 - INSTRUMENT
      ?auto_3954 - SATELLITE
      ?auto_3953 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_3952 ) ( ON_BOARD ?auto_3952 ?auto_3954 ) ( SUPPORTS ?auto_3952 ?auto_3948 ) ( POWER_ON ?auto_3952 ) ( POINTING ?auto_3954 ?auto_3953 ) ( not ( = ?auto_3949 ?auto_3953 ) ) ( HAVE_IMAGE ?auto_3946 ?auto_3947 ) ( not ( = ?auto_3946 ?auto_3949 ) ) ( not ( = ?auto_3946 ?auto_3953 ) ) ( not ( = ?auto_3947 ?auto_3948 ) ) ( HAVE_IMAGE ?auto_3951 ?auto_3950 ) ( not ( = ?auto_3946 ?auto_3951 ) ) ( not ( = ?auto_3947 ?auto_3950 ) ) ( not ( = ?auto_3949 ?auto_3951 ) ) ( not ( = ?auto_3948 ?auto_3950 ) ) ( not ( = ?auto_3951 ?auto_3953 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3946 ?auto_3947 ?auto_3949 ?auto_3948 )
      ( GET-3IMAGE-VERIFY ?auto_3946 ?auto_3947 ?auto_3949 ?auto_3948 ?auto_3951 ?auto_3950 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3964 - DIRECTION
      ?auto_3965 - MODE
      ?auto_3967 - DIRECTION
      ?auto_3966 - MODE
      ?auto_3969 - DIRECTION
      ?auto_3968 - MODE
    )
    :vars
    (
      ?auto_3970 - INSTRUMENT
      ?auto_3972 - SATELLITE
      ?auto_3971 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_3970 ) ( ON_BOARD ?auto_3970 ?auto_3972 ) ( SUPPORTS ?auto_3970 ?auto_3968 ) ( POWER_ON ?auto_3970 ) ( POINTING ?auto_3972 ?auto_3971 ) ( not ( = ?auto_3969 ?auto_3971 ) ) ( HAVE_IMAGE ?auto_3967 ?auto_3966 ) ( not ( = ?auto_3967 ?auto_3969 ) ) ( not ( = ?auto_3967 ?auto_3971 ) ) ( not ( = ?auto_3966 ?auto_3968 ) ) ( HAVE_IMAGE ?auto_3964 ?auto_3965 ) ( not ( = ?auto_3964 ?auto_3967 ) ) ( not ( = ?auto_3964 ?auto_3969 ) ) ( not ( = ?auto_3964 ?auto_3971 ) ) ( not ( = ?auto_3965 ?auto_3966 ) ) ( not ( = ?auto_3965 ?auto_3968 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3967 ?auto_3966 ?auto_3969 ?auto_3968 )
      ( GET-3IMAGE-VERIFY ?auto_3964 ?auto_3965 ?auto_3967 ?auto_3966 ?auto_3969 ?auto_3968 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3973 - DIRECTION
      ?auto_3974 - MODE
      ?auto_3976 - DIRECTION
      ?auto_3975 - MODE
      ?auto_3978 - DIRECTION
      ?auto_3977 - MODE
    )
    :vars
    (
      ?auto_3979 - INSTRUMENT
      ?auto_3981 - SATELLITE
      ?auto_3980 - DIRECTION
      ?auto_3983 - DIRECTION
      ?auto_3982 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3979 ) ( ON_BOARD ?auto_3979 ?auto_3981 ) ( SUPPORTS ?auto_3979 ?auto_3977 ) ( POWER_ON ?auto_3979 ) ( POINTING ?auto_3981 ?auto_3980 ) ( not ( = ?auto_3978 ?auto_3980 ) ) ( HAVE_IMAGE ?auto_3983 ?auto_3982 ) ( not ( = ?auto_3983 ?auto_3978 ) ) ( not ( = ?auto_3983 ?auto_3980 ) ) ( not ( = ?auto_3982 ?auto_3977 ) ) ( HAVE_IMAGE ?auto_3973 ?auto_3974 ) ( HAVE_IMAGE ?auto_3976 ?auto_3975 ) ( not ( = ?auto_3973 ?auto_3976 ) ) ( not ( = ?auto_3973 ?auto_3978 ) ) ( not ( = ?auto_3973 ?auto_3980 ) ) ( not ( = ?auto_3973 ?auto_3983 ) ) ( not ( = ?auto_3974 ?auto_3975 ) ) ( not ( = ?auto_3974 ?auto_3977 ) ) ( not ( = ?auto_3974 ?auto_3982 ) ) ( not ( = ?auto_3976 ?auto_3978 ) ) ( not ( = ?auto_3976 ?auto_3980 ) ) ( not ( = ?auto_3976 ?auto_3983 ) ) ( not ( = ?auto_3975 ?auto_3977 ) ) ( not ( = ?auto_3975 ?auto_3982 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3983 ?auto_3982 ?auto_3978 ?auto_3977 )
      ( GET-3IMAGE-VERIFY ?auto_3973 ?auto_3974 ?auto_3976 ?auto_3975 ?auto_3978 ?auto_3977 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3984 - DIRECTION
      ?auto_3985 - MODE
      ?auto_3987 - DIRECTION
      ?auto_3986 - MODE
      ?auto_3989 - DIRECTION
      ?auto_3988 - MODE
    )
    :vars
    (
      ?auto_3990 - INSTRUMENT
      ?auto_3992 - SATELLITE
      ?auto_3991 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_3990 ) ( ON_BOARD ?auto_3990 ?auto_3992 ) ( SUPPORTS ?auto_3990 ?auto_3986 ) ( POWER_ON ?auto_3990 ) ( POINTING ?auto_3992 ?auto_3991 ) ( not ( = ?auto_3987 ?auto_3991 ) ) ( HAVE_IMAGE ?auto_3989 ?auto_3988 ) ( not ( = ?auto_3989 ?auto_3987 ) ) ( not ( = ?auto_3989 ?auto_3991 ) ) ( not ( = ?auto_3988 ?auto_3986 ) ) ( HAVE_IMAGE ?auto_3984 ?auto_3985 ) ( not ( = ?auto_3984 ?auto_3987 ) ) ( not ( = ?auto_3984 ?auto_3989 ) ) ( not ( = ?auto_3984 ?auto_3991 ) ) ( not ( = ?auto_3985 ?auto_3986 ) ) ( not ( = ?auto_3985 ?auto_3988 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3989 ?auto_3988 ?auto_3987 ?auto_3986 )
      ( GET-3IMAGE-VERIFY ?auto_3984 ?auto_3985 ?auto_3987 ?auto_3986 ?auto_3989 ?auto_3988 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3993 - DIRECTION
      ?auto_3994 - MODE
      ?auto_3996 - DIRECTION
      ?auto_3995 - MODE
      ?auto_3998 - DIRECTION
      ?auto_3997 - MODE
    )
    :vars
    (
      ?auto_3999 - INSTRUMENT
      ?auto_4001 - SATELLITE
      ?auto_4000 - DIRECTION
      ?auto_4003 - DIRECTION
      ?auto_4002 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3999 ) ( ON_BOARD ?auto_3999 ?auto_4001 ) ( SUPPORTS ?auto_3999 ?auto_3995 ) ( POWER_ON ?auto_3999 ) ( POINTING ?auto_4001 ?auto_4000 ) ( not ( = ?auto_3996 ?auto_4000 ) ) ( HAVE_IMAGE ?auto_4003 ?auto_4002 ) ( not ( = ?auto_4003 ?auto_3996 ) ) ( not ( = ?auto_4003 ?auto_4000 ) ) ( not ( = ?auto_4002 ?auto_3995 ) ) ( HAVE_IMAGE ?auto_3993 ?auto_3994 ) ( HAVE_IMAGE ?auto_3998 ?auto_3997 ) ( not ( = ?auto_3993 ?auto_3996 ) ) ( not ( = ?auto_3993 ?auto_3998 ) ) ( not ( = ?auto_3993 ?auto_4000 ) ) ( not ( = ?auto_3993 ?auto_4003 ) ) ( not ( = ?auto_3994 ?auto_3995 ) ) ( not ( = ?auto_3994 ?auto_3997 ) ) ( not ( = ?auto_3994 ?auto_4002 ) ) ( not ( = ?auto_3996 ?auto_3998 ) ) ( not ( = ?auto_3995 ?auto_3997 ) ) ( not ( = ?auto_3998 ?auto_4000 ) ) ( not ( = ?auto_3998 ?auto_4003 ) ) ( not ( = ?auto_3997 ?auto_4002 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4003 ?auto_4002 ?auto_3996 ?auto_3995 )
      ( GET-3IMAGE-VERIFY ?auto_3993 ?auto_3994 ?auto_3996 ?auto_3995 ?auto_3998 ?auto_3997 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4015 - DIRECTION
      ?auto_4016 - MODE
      ?auto_4018 - DIRECTION
      ?auto_4017 - MODE
      ?auto_4020 - DIRECTION
      ?auto_4019 - MODE
    )
    :vars
    (
      ?auto_4021 - INSTRUMENT
      ?auto_4023 - SATELLITE
      ?auto_4022 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_4021 ) ( ON_BOARD ?auto_4021 ?auto_4023 ) ( SUPPORTS ?auto_4021 ?auto_4016 ) ( POWER_ON ?auto_4021 ) ( POINTING ?auto_4023 ?auto_4022 ) ( not ( = ?auto_4015 ?auto_4022 ) ) ( HAVE_IMAGE ?auto_4018 ?auto_4019 ) ( not ( = ?auto_4018 ?auto_4015 ) ) ( not ( = ?auto_4018 ?auto_4022 ) ) ( not ( = ?auto_4019 ?auto_4016 ) ) ( HAVE_IMAGE ?auto_4018 ?auto_4017 ) ( HAVE_IMAGE ?auto_4020 ?auto_4019 ) ( not ( = ?auto_4015 ?auto_4020 ) ) ( not ( = ?auto_4016 ?auto_4017 ) ) ( not ( = ?auto_4018 ?auto_4020 ) ) ( not ( = ?auto_4017 ?auto_4019 ) ) ( not ( = ?auto_4020 ?auto_4022 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4018 ?auto_4019 ?auto_4015 ?auto_4016 )
      ( GET-3IMAGE-VERIFY ?auto_4015 ?auto_4016 ?auto_4018 ?auto_4017 ?auto_4020 ?auto_4019 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4024 - DIRECTION
      ?auto_4025 - MODE
      ?auto_4027 - DIRECTION
      ?auto_4026 - MODE
      ?auto_4029 - DIRECTION
      ?auto_4028 - MODE
    )
    :vars
    (
      ?auto_4030 - INSTRUMENT
      ?auto_4032 - SATELLITE
      ?auto_4031 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_4030 ) ( ON_BOARD ?auto_4030 ?auto_4032 ) ( SUPPORTS ?auto_4030 ?auto_4025 ) ( POWER_ON ?auto_4030 ) ( POINTING ?auto_4032 ?auto_4031 ) ( not ( = ?auto_4024 ?auto_4031 ) ) ( HAVE_IMAGE ?auto_4027 ?auto_4026 ) ( not ( = ?auto_4027 ?auto_4024 ) ) ( not ( = ?auto_4027 ?auto_4031 ) ) ( not ( = ?auto_4026 ?auto_4025 ) ) ( HAVE_IMAGE ?auto_4029 ?auto_4028 ) ( not ( = ?auto_4024 ?auto_4029 ) ) ( not ( = ?auto_4025 ?auto_4028 ) ) ( not ( = ?auto_4027 ?auto_4029 ) ) ( not ( = ?auto_4026 ?auto_4028 ) ) ( not ( = ?auto_4029 ?auto_4031 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4027 ?auto_4026 ?auto_4024 ?auto_4025 )
      ( GET-3IMAGE-VERIFY ?auto_4024 ?auto_4025 ?auto_4027 ?auto_4026 ?auto_4029 ?auto_4028 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4042 - DIRECTION
      ?auto_4043 - MODE
      ?auto_4045 - DIRECTION
      ?auto_4044 - MODE
      ?auto_4047 - DIRECTION
      ?auto_4046 - MODE
    )
    :vars
    (
      ?auto_4048 - INSTRUMENT
      ?auto_4050 - SATELLITE
      ?auto_4049 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_4048 ) ( ON_BOARD ?auto_4048 ?auto_4050 ) ( SUPPORTS ?auto_4048 ?auto_4043 ) ( POWER_ON ?auto_4048 ) ( POINTING ?auto_4050 ?auto_4049 ) ( not ( = ?auto_4042 ?auto_4049 ) ) ( HAVE_IMAGE ?auto_4047 ?auto_4046 ) ( not ( = ?auto_4047 ?auto_4042 ) ) ( not ( = ?auto_4047 ?auto_4049 ) ) ( not ( = ?auto_4046 ?auto_4043 ) ) ( HAVE_IMAGE ?auto_4045 ?auto_4044 ) ( not ( = ?auto_4042 ?auto_4045 ) ) ( not ( = ?auto_4043 ?auto_4044 ) ) ( not ( = ?auto_4045 ?auto_4047 ) ) ( not ( = ?auto_4045 ?auto_4049 ) ) ( not ( = ?auto_4044 ?auto_4046 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4047 ?auto_4046 ?auto_4042 ?auto_4043 )
      ( GET-3IMAGE-VERIFY ?auto_4042 ?auto_4043 ?auto_4045 ?auto_4044 ?auto_4047 ?auto_4046 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4051 - DIRECTION
      ?auto_4052 - MODE
      ?auto_4054 - DIRECTION
      ?auto_4053 - MODE
      ?auto_4056 - DIRECTION
      ?auto_4055 - MODE
    )
    :vars
    (
      ?auto_4057 - INSTRUMENT
      ?auto_4059 - SATELLITE
      ?auto_4058 - DIRECTION
      ?auto_4061 - DIRECTION
      ?auto_4060 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_4057 ) ( ON_BOARD ?auto_4057 ?auto_4059 ) ( SUPPORTS ?auto_4057 ?auto_4052 ) ( POWER_ON ?auto_4057 ) ( POINTING ?auto_4059 ?auto_4058 ) ( not ( = ?auto_4051 ?auto_4058 ) ) ( HAVE_IMAGE ?auto_4061 ?auto_4060 ) ( not ( = ?auto_4061 ?auto_4051 ) ) ( not ( = ?auto_4061 ?auto_4058 ) ) ( not ( = ?auto_4060 ?auto_4052 ) ) ( HAVE_IMAGE ?auto_4054 ?auto_4053 ) ( HAVE_IMAGE ?auto_4056 ?auto_4055 ) ( not ( = ?auto_4051 ?auto_4054 ) ) ( not ( = ?auto_4051 ?auto_4056 ) ) ( not ( = ?auto_4052 ?auto_4053 ) ) ( not ( = ?auto_4052 ?auto_4055 ) ) ( not ( = ?auto_4054 ?auto_4056 ) ) ( not ( = ?auto_4054 ?auto_4058 ) ) ( not ( = ?auto_4054 ?auto_4061 ) ) ( not ( = ?auto_4053 ?auto_4055 ) ) ( not ( = ?auto_4053 ?auto_4060 ) ) ( not ( = ?auto_4056 ?auto_4058 ) ) ( not ( = ?auto_4056 ?auto_4061 ) ) ( not ( = ?auto_4055 ?auto_4060 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4061 ?auto_4060 ?auto_4051 ?auto_4052 )
      ( GET-3IMAGE-VERIFY ?auto_4051 ?auto_4052 ?auto_4054 ?auto_4053 ?auto_4056 ?auto_4055 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4104 - DIRECTION
      ?auto_4105 - MODE
    )
    :vars
    (
      ?auto_4106 - INSTRUMENT
      ?auto_4108 - SATELLITE
      ?auto_4107 - DIRECTION
      ?auto_4110 - DIRECTION
      ?auto_4109 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4106 ?auto_4108 ) ( SUPPORTS ?auto_4106 ?auto_4105 ) ( POWER_ON ?auto_4106 ) ( POINTING ?auto_4108 ?auto_4107 ) ( not ( = ?auto_4104 ?auto_4107 ) ) ( HAVE_IMAGE ?auto_4110 ?auto_4109 ) ( not ( = ?auto_4110 ?auto_4104 ) ) ( not ( = ?auto_4110 ?auto_4107 ) ) ( not ( = ?auto_4109 ?auto_4105 ) ) ( CALIBRATION_TARGET ?auto_4106 ?auto_4107 ) ( NOT_CALIBRATED ?auto_4106 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_4108 ?auto_4106 ?auto_4107 )
      ( GET-2IMAGE ?auto_4110 ?auto_4109 ?auto_4104 ?auto_4105 )
      ( GET-1IMAGE-VERIFY ?auto_4104 ?auto_4105 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4111 - DIRECTION
      ?auto_4112 - MODE
      ?auto_4114 - DIRECTION
      ?auto_4113 - MODE
    )
    :vars
    (
      ?auto_4116 - INSTRUMENT
      ?auto_4117 - SATELLITE
      ?auto_4115 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4116 ?auto_4117 ) ( SUPPORTS ?auto_4116 ?auto_4113 ) ( POWER_ON ?auto_4116 ) ( POINTING ?auto_4117 ?auto_4115 ) ( not ( = ?auto_4114 ?auto_4115 ) ) ( HAVE_IMAGE ?auto_4111 ?auto_4112 ) ( not ( = ?auto_4111 ?auto_4114 ) ) ( not ( = ?auto_4111 ?auto_4115 ) ) ( not ( = ?auto_4112 ?auto_4113 ) ) ( CALIBRATION_TARGET ?auto_4116 ?auto_4115 ) ( NOT_CALIBRATED ?auto_4116 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4114 ?auto_4113 )
      ( GET-2IMAGE-VERIFY ?auto_4111 ?auto_4112 ?auto_4114 ?auto_4113 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4118 - DIRECTION
      ?auto_4119 - MODE
      ?auto_4121 - DIRECTION
      ?auto_4120 - MODE
    )
    :vars
    (
      ?auto_4124 - INSTRUMENT
      ?auto_4123 - SATELLITE
      ?auto_4122 - DIRECTION
      ?auto_4126 - DIRECTION
      ?auto_4125 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4124 ?auto_4123 ) ( SUPPORTS ?auto_4124 ?auto_4120 ) ( POWER_ON ?auto_4124 ) ( POINTING ?auto_4123 ?auto_4122 ) ( not ( = ?auto_4121 ?auto_4122 ) ) ( HAVE_IMAGE ?auto_4126 ?auto_4125 ) ( not ( = ?auto_4126 ?auto_4121 ) ) ( not ( = ?auto_4126 ?auto_4122 ) ) ( not ( = ?auto_4125 ?auto_4120 ) ) ( CALIBRATION_TARGET ?auto_4124 ?auto_4122 ) ( NOT_CALIBRATED ?auto_4124 ) ( HAVE_IMAGE ?auto_4118 ?auto_4119 ) ( not ( = ?auto_4118 ?auto_4121 ) ) ( not ( = ?auto_4118 ?auto_4122 ) ) ( not ( = ?auto_4118 ?auto_4126 ) ) ( not ( = ?auto_4119 ?auto_4120 ) ) ( not ( = ?auto_4119 ?auto_4125 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4126 ?auto_4125 ?auto_4121 ?auto_4120 )
      ( GET-2IMAGE-VERIFY ?auto_4118 ?auto_4119 ?auto_4121 ?auto_4120 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4127 - DIRECTION
      ?auto_4128 - MODE
      ?auto_4130 - DIRECTION
      ?auto_4129 - MODE
    )
    :vars
    (
      ?auto_4133 - INSTRUMENT
      ?auto_4132 - SATELLITE
      ?auto_4131 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4133 ?auto_4132 ) ( SUPPORTS ?auto_4133 ?auto_4128 ) ( POWER_ON ?auto_4133 ) ( POINTING ?auto_4132 ?auto_4131 ) ( not ( = ?auto_4127 ?auto_4131 ) ) ( HAVE_IMAGE ?auto_4130 ?auto_4129 ) ( not ( = ?auto_4130 ?auto_4127 ) ) ( not ( = ?auto_4130 ?auto_4131 ) ) ( not ( = ?auto_4129 ?auto_4128 ) ) ( CALIBRATION_TARGET ?auto_4133 ?auto_4131 ) ( NOT_CALIBRATED ?auto_4133 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4130 ?auto_4129 ?auto_4127 ?auto_4128 )
      ( GET-2IMAGE-VERIFY ?auto_4127 ?auto_4128 ?auto_4130 ?auto_4129 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4134 - DIRECTION
      ?auto_4135 - MODE
      ?auto_4137 - DIRECTION
      ?auto_4136 - MODE
    )
    :vars
    (
      ?auto_4140 - INSTRUMENT
      ?auto_4139 - SATELLITE
      ?auto_4138 - DIRECTION
      ?auto_4142 - DIRECTION
      ?auto_4141 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4140 ?auto_4139 ) ( SUPPORTS ?auto_4140 ?auto_4135 ) ( POWER_ON ?auto_4140 ) ( POINTING ?auto_4139 ?auto_4138 ) ( not ( = ?auto_4134 ?auto_4138 ) ) ( HAVE_IMAGE ?auto_4142 ?auto_4141 ) ( not ( = ?auto_4142 ?auto_4134 ) ) ( not ( = ?auto_4142 ?auto_4138 ) ) ( not ( = ?auto_4141 ?auto_4135 ) ) ( CALIBRATION_TARGET ?auto_4140 ?auto_4138 ) ( NOT_CALIBRATED ?auto_4140 ) ( HAVE_IMAGE ?auto_4137 ?auto_4136 ) ( not ( = ?auto_4134 ?auto_4137 ) ) ( not ( = ?auto_4135 ?auto_4136 ) ) ( not ( = ?auto_4137 ?auto_4138 ) ) ( not ( = ?auto_4137 ?auto_4142 ) ) ( not ( = ?auto_4136 ?auto_4141 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4142 ?auto_4141 ?auto_4134 ?auto_4135 )
      ( GET-2IMAGE-VERIFY ?auto_4134 ?auto_4135 ?auto_4137 ?auto_4136 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4152 - DIRECTION
      ?auto_4153 - MODE
      ?auto_4155 - DIRECTION
      ?auto_4154 - MODE
      ?auto_4157 - DIRECTION
      ?auto_4156 - MODE
    )
    :vars
    (
      ?auto_4160 - INSTRUMENT
      ?auto_4159 - SATELLITE
      ?auto_4158 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4160 ?auto_4159 ) ( SUPPORTS ?auto_4160 ?auto_4156 ) ( POWER_ON ?auto_4160 ) ( POINTING ?auto_4159 ?auto_4158 ) ( not ( = ?auto_4157 ?auto_4158 ) ) ( HAVE_IMAGE ?auto_4155 ?auto_4154 ) ( not ( = ?auto_4155 ?auto_4157 ) ) ( not ( = ?auto_4155 ?auto_4158 ) ) ( not ( = ?auto_4154 ?auto_4156 ) ) ( CALIBRATION_TARGET ?auto_4160 ?auto_4158 ) ( NOT_CALIBRATED ?auto_4160 ) ( HAVE_IMAGE ?auto_4152 ?auto_4153 ) ( not ( = ?auto_4152 ?auto_4155 ) ) ( not ( = ?auto_4152 ?auto_4157 ) ) ( not ( = ?auto_4152 ?auto_4158 ) ) ( not ( = ?auto_4153 ?auto_4154 ) ) ( not ( = ?auto_4153 ?auto_4156 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4155 ?auto_4154 ?auto_4157 ?auto_4156 )
      ( GET-3IMAGE-VERIFY ?auto_4152 ?auto_4153 ?auto_4155 ?auto_4154 ?auto_4157 ?auto_4156 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4161 - DIRECTION
      ?auto_4162 - MODE
      ?auto_4164 - DIRECTION
      ?auto_4163 - MODE
      ?auto_4166 - DIRECTION
      ?auto_4165 - MODE
    )
    :vars
    (
      ?auto_4169 - INSTRUMENT
      ?auto_4168 - SATELLITE
      ?auto_4167 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4169 ?auto_4168 ) ( SUPPORTS ?auto_4169 ?auto_4165 ) ( POWER_ON ?auto_4169 ) ( POINTING ?auto_4168 ?auto_4167 ) ( not ( = ?auto_4166 ?auto_4167 ) ) ( HAVE_IMAGE ?auto_4161 ?auto_4162 ) ( not ( = ?auto_4161 ?auto_4166 ) ) ( not ( = ?auto_4161 ?auto_4167 ) ) ( not ( = ?auto_4162 ?auto_4165 ) ) ( CALIBRATION_TARGET ?auto_4169 ?auto_4167 ) ( NOT_CALIBRATED ?auto_4169 ) ( HAVE_IMAGE ?auto_4164 ?auto_4163 ) ( not ( = ?auto_4161 ?auto_4164 ) ) ( not ( = ?auto_4162 ?auto_4163 ) ) ( not ( = ?auto_4164 ?auto_4166 ) ) ( not ( = ?auto_4164 ?auto_4167 ) ) ( not ( = ?auto_4163 ?auto_4165 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4161 ?auto_4162 ?auto_4166 ?auto_4165 )
      ( GET-3IMAGE-VERIFY ?auto_4161 ?auto_4162 ?auto_4164 ?auto_4163 ?auto_4166 ?auto_4165 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4170 - DIRECTION
      ?auto_4171 - MODE
      ?auto_4173 - DIRECTION
      ?auto_4172 - MODE
      ?auto_4175 - DIRECTION
      ?auto_4174 - MODE
    )
    :vars
    (
      ?auto_4178 - INSTRUMENT
      ?auto_4177 - SATELLITE
      ?auto_4176 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4178 ?auto_4177 ) ( SUPPORTS ?auto_4178 ?auto_4172 ) ( POWER_ON ?auto_4178 ) ( POINTING ?auto_4177 ?auto_4176 ) ( not ( = ?auto_4173 ?auto_4176 ) ) ( HAVE_IMAGE ?auto_4175 ?auto_4174 ) ( not ( = ?auto_4175 ?auto_4173 ) ) ( not ( = ?auto_4175 ?auto_4176 ) ) ( not ( = ?auto_4174 ?auto_4172 ) ) ( CALIBRATION_TARGET ?auto_4178 ?auto_4176 ) ( NOT_CALIBRATED ?auto_4178 ) ( HAVE_IMAGE ?auto_4170 ?auto_4171 ) ( not ( = ?auto_4170 ?auto_4173 ) ) ( not ( = ?auto_4170 ?auto_4175 ) ) ( not ( = ?auto_4170 ?auto_4176 ) ) ( not ( = ?auto_4171 ?auto_4172 ) ) ( not ( = ?auto_4171 ?auto_4174 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4175 ?auto_4174 ?auto_4173 ?auto_4172 )
      ( GET-3IMAGE-VERIFY ?auto_4170 ?auto_4171 ?auto_4173 ?auto_4172 ?auto_4175 ?auto_4174 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4179 - DIRECTION
      ?auto_4180 - MODE
      ?auto_4182 - DIRECTION
      ?auto_4181 - MODE
      ?auto_4184 - DIRECTION
      ?auto_4183 - MODE
    )
    :vars
    (
      ?auto_4187 - INSTRUMENT
      ?auto_4186 - SATELLITE
      ?auto_4185 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4187 ?auto_4186 ) ( SUPPORTS ?auto_4187 ?auto_4181 ) ( POWER_ON ?auto_4187 ) ( POINTING ?auto_4186 ?auto_4185 ) ( not ( = ?auto_4182 ?auto_4185 ) ) ( HAVE_IMAGE ?auto_4179 ?auto_4180 ) ( not ( = ?auto_4179 ?auto_4182 ) ) ( not ( = ?auto_4179 ?auto_4185 ) ) ( not ( = ?auto_4180 ?auto_4181 ) ) ( CALIBRATION_TARGET ?auto_4187 ?auto_4185 ) ( NOT_CALIBRATED ?auto_4187 ) ( HAVE_IMAGE ?auto_4184 ?auto_4183 ) ( not ( = ?auto_4179 ?auto_4184 ) ) ( not ( = ?auto_4180 ?auto_4183 ) ) ( not ( = ?auto_4182 ?auto_4184 ) ) ( not ( = ?auto_4181 ?auto_4183 ) ) ( not ( = ?auto_4184 ?auto_4185 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4179 ?auto_4180 ?auto_4182 ?auto_4181 )
      ( GET-3IMAGE-VERIFY ?auto_4179 ?auto_4180 ?auto_4182 ?auto_4181 ?auto_4184 ?auto_4183 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4197 - DIRECTION
      ?auto_4198 - MODE
      ?auto_4200 - DIRECTION
      ?auto_4199 - MODE
      ?auto_4202 - DIRECTION
      ?auto_4201 - MODE
    )
    :vars
    (
      ?auto_4205 - INSTRUMENT
      ?auto_4204 - SATELLITE
      ?auto_4203 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4205 ?auto_4204 ) ( SUPPORTS ?auto_4205 ?auto_4201 ) ( POWER_ON ?auto_4205 ) ( POINTING ?auto_4204 ?auto_4203 ) ( not ( = ?auto_4202 ?auto_4203 ) ) ( HAVE_IMAGE ?auto_4200 ?auto_4199 ) ( not ( = ?auto_4200 ?auto_4202 ) ) ( not ( = ?auto_4200 ?auto_4203 ) ) ( not ( = ?auto_4199 ?auto_4201 ) ) ( CALIBRATION_TARGET ?auto_4205 ?auto_4203 ) ( NOT_CALIBRATED ?auto_4205 ) ( HAVE_IMAGE ?auto_4197 ?auto_4198 ) ( not ( = ?auto_4197 ?auto_4200 ) ) ( not ( = ?auto_4197 ?auto_4202 ) ) ( not ( = ?auto_4197 ?auto_4203 ) ) ( not ( = ?auto_4198 ?auto_4199 ) ) ( not ( = ?auto_4198 ?auto_4201 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4200 ?auto_4199 ?auto_4202 ?auto_4201 )
      ( GET-3IMAGE-VERIFY ?auto_4197 ?auto_4198 ?auto_4200 ?auto_4199 ?auto_4202 ?auto_4201 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4206 - DIRECTION
      ?auto_4207 - MODE
      ?auto_4209 - DIRECTION
      ?auto_4208 - MODE
      ?auto_4211 - DIRECTION
      ?auto_4210 - MODE
    )
    :vars
    (
      ?auto_4214 - INSTRUMENT
      ?auto_4213 - SATELLITE
      ?auto_4212 - DIRECTION
      ?auto_4216 - DIRECTION
      ?auto_4215 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4214 ?auto_4213 ) ( SUPPORTS ?auto_4214 ?auto_4210 ) ( POWER_ON ?auto_4214 ) ( POINTING ?auto_4213 ?auto_4212 ) ( not ( = ?auto_4211 ?auto_4212 ) ) ( HAVE_IMAGE ?auto_4216 ?auto_4215 ) ( not ( = ?auto_4216 ?auto_4211 ) ) ( not ( = ?auto_4216 ?auto_4212 ) ) ( not ( = ?auto_4215 ?auto_4210 ) ) ( CALIBRATION_TARGET ?auto_4214 ?auto_4212 ) ( NOT_CALIBRATED ?auto_4214 ) ( HAVE_IMAGE ?auto_4206 ?auto_4207 ) ( HAVE_IMAGE ?auto_4209 ?auto_4208 ) ( not ( = ?auto_4206 ?auto_4209 ) ) ( not ( = ?auto_4206 ?auto_4211 ) ) ( not ( = ?auto_4206 ?auto_4212 ) ) ( not ( = ?auto_4206 ?auto_4216 ) ) ( not ( = ?auto_4207 ?auto_4208 ) ) ( not ( = ?auto_4207 ?auto_4210 ) ) ( not ( = ?auto_4207 ?auto_4215 ) ) ( not ( = ?auto_4209 ?auto_4211 ) ) ( not ( = ?auto_4209 ?auto_4212 ) ) ( not ( = ?auto_4209 ?auto_4216 ) ) ( not ( = ?auto_4208 ?auto_4210 ) ) ( not ( = ?auto_4208 ?auto_4215 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4216 ?auto_4215 ?auto_4211 ?auto_4210 )
      ( GET-3IMAGE-VERIFY ?auto_4206 ?auto_4207 ?auto_4209 ?auto_4208 ?auto_4211 ?auto_4210 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4217 - DIRECTION
      ?auto_4218 - MODE
      ?auto_4220 - DIRECTION
      ?auto_4219 - MODE
      ?auto_4222 - DIRECTION
      ?auto_4221 - MODE
    )
    :vars
    (
      ?auto_4225 - INSTRUMENT
      ?auto_4224 - SATELLITE
      ?auto_4223 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4225 ?auto_4224 ) ( SUPPORTS ?auto_4225 ?auto_4219 ) ( POWER_ON ?auto_4225 ) ( POINTING ?auto_4224 ?auto_4223 ) ( not ( = ?auto_4220 ?auto_4223 ) ) ( HAVE_IMAGE ?auto_4222 ?auto_4221 ) ( not ( = ?auto_4222 ?auto_4220 ) ) ( not ( = ?auto_4222 ?auto_4223 ) ) ( not ( = ?auto_4221 ?auto_4219 ) ) ( CALIBRATION_TARGET ?auto_4225 ?auto_4223 ) ( NOT_CALIBRATED ?auto_4225 ) ( HAVE_IMAGE ?auto_4217 ?auto_4218 ) ( not ( = ?auto_4217 ?auto_4220 ) ) ( not ( = ?auto_4217 ?auto_4222 ) ) ( not ( = ?auto_4217 ?auto_4223 ) ) ( not ( = ?auto_4218 ?auto_4219 ) ) ( not ( = ?auto_4218 ?auto_4221 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4222 ?auto_4221 ?auto_4220 ?auto_4219 )
      ( GET-3IMAGE-VERIFY ?auto_4217 ?auto_4218 ?auto_4220 ?auto_4219 ?auto_4222 ?auto_4221 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4226 - DIRECTION
      ?auto_4227 - MODE
      ?auto_4229 - DIRECTION
      ?auto_4228 - MODE
      ?auto_4231 - DIRECTION
      ?auto_4230 - MODE
    )
    :vars
    (
      ?auto_4234 - INSTRUMENT
      ?auto_4233 - SATELLITE
      ?auto_4232 - DIRECTION
      ?auto_4236 - DIRECTION
      ?auto_4235 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4234 ?auto_4233 ) ( SUPPORTS ?auto_4234 ?auto_4228 ) ( POWER_ON ?auto_4234 ) ( POINTING ?auto_4233 ?auto_4232 ) ( not ( = ?auto_4229 ?auto_4232 ) ) ( HAVE_IMAGE ?auto_4236 ?auto_4235 ) ( not ( = ?auto_4236 ?auto_4229 ) ) ( not ( = ?auto_4236 ?auto_4232 ) ) ( not ( = ?auto_4235 ?auto_4228 ) ) ( CALIBRATION_TARGET ?auto_4234 ?auto_4232 ) ( NOT_CALIBRATED ?auto_4234 ) ( HAVE_IMAGE ?auto_4226 ?auto_4227 ) ( HAVE_IMAGE ?auto_4231 ?auto_4230 ) ( not ( = ?auto_4226 ?auto_4229 ) ) ( not ( = ?auto_4226 ?auto_4231 ) ) ( not ( = ?auto_4226 ?auto_4232 ) ) ( not ( = ?auto_4226 ?auto_4236 ) ) ( not ( = ?auto_4227 ?auto_4228 ) ) ( not ( = ?auto_4227 ?auto_4230 ) ) ( not ( = ?auto_4227 ?auto_4235 ) ) ( not ( = ?auto_4229 ?auto_4231 ) ) ( not ( = ?auto_4228 ?auto_4230 ) ) ( not ( = ?auto_4231 ?auto_4232 ) ) ( not ( = ?auto_4231 ?auto_4236 ) ) ( not ( = ?auto_4230 ?auto_4235 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4236 ?auto_4235 ?auto_4229 ?auto_4228 )
      ( GET-3IMAGE-VERIFY ?auto_4226 ?auto_4227 ?auto_4229 ?auto_4228 ?auto_4231 ?auto_4230 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4248 - DIRECTION
      ?auto_4249 - MODE
      ?auto_4251 - DIRECTION
      ?auto_4250 - MODE
      ?auto_4253 - DIRECTION
      ?auto_4252 - MODE
    )
    :vars
    (
      ?auto_4256 - INSTRUMENT
      ?auto_4255 - SATELLITE
      ?auto_4254 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4256 ?auto_4255 ) ( SUPPORTS ?auto_4256 ?auto_4249 ) ( POWER_ON ?auto_4256 ) ( POINTING ?auto_4255 ?auto_4254 ) ( not ( = ?auto_4248 ?auto_4254 ) ) ( HAVE_IMAGE ?auto_4253 ?auto_4252 ) ( not ( = ?auto_4253 ?auto_4248 ) ) ( not ( = ?auto_4253 ?auto_4254 ) ) ( not ( = ?auto_4252 ?auto_4249 ) ) ( CALIBRATION_TARGET ?auto_4256 ?auto_4254 ) ( NOT_CALIBRATED ?auto_4256 ) ( HAVE_IMAGE ?auto_4251 ?auto_4250 ) ( not ( = ?auto_4248 ?auto_4251 ) ) ( not ( = ?auto_4249 ?auto_4250 ) ) ( not ( = ?auto_4251 ?auto_4253 ) ) ( not ( = ?auto_4251 ?auto_4254 ) ) ( not ( = ?auto_4250 ?auto_4252 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4253 ?auto_4252 ?auto_4248 ?auto_4249 )
      ( GET-3IMAGE-VERIFY ?auto_4248 ?auto_4249 ?auto_4251 ?auto_4250 ?auto_4253 ?auto_4252 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4257 - DIRECTION
      ?auto_4258 - MODE
      ?auto_4260 - DIRECTION
      ?auto_4259 - MODE
      ?auto_4262 - DIRECTION
      ?auto_4261 - MODE
    )
    :vars
    (
      ?auto_4265 - INSTRUMENT
      ?auto_4264 - SATELLITE
      ?auto_4263 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4265 ?auto_4264 ) ( SUPPORTS ?auto_4265 ?auto_4258 ) ( POWER_ON ?auto_4265 ) ( POINTING ?auto_4264 ?auto_4263 ) ( not ( = ?auto_4257 ?auto_4263 ) ) ( HAVE_IMAGE ?auto_4260 ?auto_4259 ) ( not ( = ?auto_4260 ?auto_4257 ) ) ( not ( = ?auto_4260 ?auto_4263 ) ) ( not ( = ?auto_4259 ?auto_4258 ) ) ( CALIBRATION_TARGET ?auto_4265 ?auto_4263 ) ( NOT_CALIBRATED ?auto_4265 ) ( HAVE_IMAGE ?auto_4262 ?auto_4261 ) ( not ( = ?auto_4257 ?auto_4262 ) ) ( not ( = ?auto_4258 ?auto_4261 ) ) ( not ( = ?auto_4260 ?auto_4262 ) ) ( not ( = ?auto_4259 ?auto_4261 ) ) ( not ( = ?auto_4262 ?auto_4263 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4260 ?auto_4259 ?auto_4257 ?auto_4258 )
      ( GET-3IMAGE-VERIFY ?auto_4257 ?auto_4258 ?auto_4260 ?auto_4259 ?auto_4262 ?auto_4261 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4275 - DIRECTION
      ?auto_4276 - MODE
      ?auto_4278 - DIRECTION
      ?auto_4277 - MODE
      ?auto_4280 - DIRECTION
      ?auto_4279 - MODE
    )
    :vars
    (
      ?auto_4283 - INSTRUMENT
      ?auto_4282 - SATELLITE
      ?auto_4281 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4283 ?auto_4282 ) ( SUPPORTS ?auto_4283 ?auto_4276 ) ( POWER_ON ?auto_4283 ) ( POINTING ?auto_4282 ?auto_4281 ) ( not ( = ?auto_4275 ?auto_4281 ) ) ( HAVE_IMAGE ?auto_4280 ?auto_4279 ) ( not ( = ?auto_4280 ?auto_4275 ) ) ( not ( = ?auto_4280 ?auto_4281 ) ) ( not ( = ?auto_4279 ?auto_4276 ) ) ( CALIBRATION_TARGET ?auto_4283 ?auto_4281 ) ( NOT_CALIBRATED ?auto_4283 ) ( HAVE_IMAGE ?auto_4278 ?auto_4277 ) ( not ( = ?auto_4275 ?auto_4278 ) ) ( not ( = ?auto_4276 ?auto_4277 ) ) ( not ( = ?auto_4278 ?auto_4280 ) ) ( not ( = ?auto_4278 ?auto_4281 ) ) ( not ( = ?auto_4277 ?auto_4279 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4280 ?auto_4279 ?auto_4275 ?auto_4276 )
      ( GET-3IMAGE-VERIFY ?auto_4275 ?auto_4276 ?auto_4278 ?auto_4277 ?auto_4280 ?auto_4279 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4284 - DIRECTION
      ?auto_4285 - MODE
      ?auto_4287 - DIRECTION
      ?auto_4286 - MODE
      ?auto_4289 - DIRECTION
      ?auto_4288 - MODE
    )
    :vars
    (
      ?auto_4292 - INSTRUMENT
      ?auto_4291 - SATELLITE
      ?auto_4290 - DIRECTION
      ?auto_4294 - DIRECTION
      ?auto_4293 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4292 ?auto_4291 ) ( SUPPORTS ?auto_4292 ?auto_4285 ) ( POWER_ON ?auto_4292 ) ( POINTING ?auto_4291 ?auto_4290 ) ( not ( = ?auto_4284 ?auto_4290 ) ) ( HAVE_IMAGE ?auto_4294 ?auto_4293 ) ( not ( = ?auto_4294 ?auto_4284 ) ) ( not ( = ?auto_4294 ?auto_4290 ) ) ( not ( = ?auto_4293 ?auto_4285 ) ) ( CALIBRATION_TARGET ?auto_4292 ?auto_4290 ) ( NOT_CALIBRATED ?auto_4292 ) ( HAVE_IMAGE ?auto_4287 ?auto_4286 ) ( HAVE_IMAGE ?auto_4289 ?auto_4288 ) ( not ( = ?auto_4284 ?auto_4287 ) ) ( not ( = ?auto_4284 ?auto_4289 ) ) ( not ( = ?auto_4285 ?auto_4286 ) ) ( not ( = ?auto_4285 ?auto_4288 ) ) ( not ( = ?auto_4287 ?auto_4289 ) ) ( not ( = ?auto_4287 ?auto_4290 ) ) ( not ( = ?auto_4287 ?auto_4294 ) ) ( not ( = ?auto_4286 ?auto_4288 ) ) ( not ( = ?auto_4286 ?auto_4293 ) ) ( not ( = ?auto_4289 ?auto_4290 ) ) ( not ( = ?auto_4289 ?auto_4294 ) ) ( not ( = ?auto_4288 ?auto_4293 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4294 ?auto_4293 ?auto_4284 ?auto_4285 )
      ( GET-3IMAGE-VERIFY ?auto_4284 ?auto_4285 ?auto_4287 ?auto_4286 ?auto_4289 ?auto_4288 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4337 - DIRECTION
      ?auto_4338 - MODE
    )
    :vars
    (
      ?auto_4341 - INSTRUMENT
      ?auto_4340 - SATELLITE
      ?auto_4339 - DIRECTION
      ?auto_4343 - DIRECTION
      ?auto_4342 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4341 ?auto_4340 ) ( SUPPORTS ?auto_4341 ?auto_4338 ) ( POINTING ?auto_4340 ?auto_4339 ) ( not ( = ?auto_4337 ?auto_4339 ) ) ( HAVE_IMAGE ?auto_4343 ?auto_4342 ) ( not ( = ?auto_4343 ?auto_4337 ) ) ( not ( = ?auto_4343 ?auto_4339 ) ) ( not ( = ?auto_4342 ?auto_4338 ) ) ( CALIBRATION_TARGET ?auto_4341 ?auto_4339 ) ( POWER_AVAIL ?auto_4340 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_4341 ?auto_4340 )
      ( GET-2IMAGE ?auto_4343 ?auto_4342 ?auto_4337 ?auto_4338 )
      ( GET-1IMAGE-VERIFY ?auto_4337 ?auto_4338 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4344 - DIRECTION
      ?auto_4345 - MODE
      ?auto_4347 - DIRECTION
      ?auto_4346 - MODE
    )
    :vars
    (
      ?auto_4349 - INSTRUMENT
      ?auto_4348 - SATELLITE
      ?auto_4350 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4349 ?auto_4348 ) ( SUPPORTS ?auto_4349 ?auto_4346 ) ( POINTING ?auto_4348 ?auto_4350 ) ( not ( = ?auto_4347 ?auto_4350 ) ) ( HAVE_IMAGE ?auto_4344 ?auto_4345 ) ( not ( = ?auto_4344 ?auto_4347 ) ) ( not ( = ?auto_4344 ?auto_4350 ) ) ( not ( = ?auto_4345 ?auto_4346 ) ) ( CALIBRATION_TARGET ?auto_4349 ?auto_4350 ) ( POWER_AVAIL ?auto_4348 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4347 ?auto_4346 )
      ( GET-2IMAGE-VERIFY ?auto_4344 ?auto_4345 ?auto_4347 ?auto_4346 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4351 - DIRECTION
      ?auto_4352 - MODE
      ?auto_4354 - DIRECTION
      ?auto_4353 - MODE
    )
    :vars
    (
      ?auto_4355 - INSTRUMENT
      ?auto_4356 - SATELLITE
      ?auto_4357 - DIRECTION
      ?auto_4359 - DIRECTION
      ?auto_4358 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4355 ?auto_4356 ) ( SUPPORTS ?auto_4355 ?auto_4353 ) ( POINTING ?auto_4356 ?auto_4357 ) ( not ( = ?auto_4354 ?auto_4357 ) ) ( HAVE_IMAGE ?auto_4359 ?auto_4358 ) ( not ( = ?auto_4359 ?auto_4354 ) ) ( not ( = ?auto_4359 ?auto_4357 ) ) ( not ( = ?auto_4358 ?auto_4353 ) ) ( CALIBRATION_TARGET ?auto_4355 ?auto_4357 ) ( POWER_AVAIL ?auto_4356 ) ( HAVE_IMAGE ?auto_4351 ?auto_4352 ) ( not ( = ?auto_4351 ?auto_4354 ) ) ( not ( = ?auto_4351 ?auto_4357 ) ) ( not ( = ?auto_4351 ?auto_4359 ) ) ( not ( = ?auto_4352 ?auto_4353 ) ) ( not ( = ?auto_4352 ?auto_4358 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4359 ?auto_4358 ?auto_4354 ?auto_4353 )
      ( GET-2IMAGE-VERIFY ?auto_4351 ?auto_4352 ?auto_4354 ?auto_4353 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4360 - DIRECTION
      ?auto_4361 - MODE
      ?auto_4363 - DIRECTION
      ?auto_4362 - MODE
    )
    :vars
    (
      ?auto_4364 - INSTRUMENT
      ?auto_4365 - SATELLITE
      ?auto_4366 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4364 ?auto_4365 ) ( SUPPORTS ?auto_4364 ?auto_4361 ) ( POINTING ?auto_4365 ?auto_4366 ) ( not ( = ?auto_4360 ?auto_4366 ) ) ( HAVE_IMAGE ?auto_4363 ?auto_4362 ) ( not ( = ?auto_4363 ?auto_4360 ) ) ( not ( = ?auto_4363 ?auto_4366 ) ) ( not ( = ?auto_4362 ?auto_4361 ) ) ( CALIBRATION_TARGET ?auto_4364 ?auto_4366 ) ( POWER_AVAIL ?auto_4365 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4363 ?auto_4362 ?auto_4360 ?auto_4361 )
      ( GET-2IMAGE-VERIFY ?auto_4360 ?auto_4361 ?auto_4363 ?auto_4362 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4367 - DIRECTION
      ?auto_4368 - MODE
      ?auto_4370 - DIRECTION
      ?auto_4369 - MODE
    )
    :vars
    (
      ?auto_4371 - INSTRUMENT
      ?auto_4372 - SATELLITE
      ?auto_4373 - DIRECTION
      ?auto_4375 - DIRECTION
      ?auto_4374 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4371 ?auto_4372 ) ( SUPPORTS ?auto_4371 ?auto_4368 ) ( POINTING ?auto_4372 ?auto_4373 ) ( not ( = ?auto_4367 ?auto_4373 ) ) ( HAVE_IMAGE ?auto_4375 ?auto_4374 ) ( not ( = ?auto_4375 ?auto_4367 ) ) ( not ( = ?auto_4375 ?auto_4373 ) ) ( not ( = ?auto_4374 ?auto_4368 ) ) ( CALIBRATION_TARGET ?auto_4371 ?auto_4373 ) ( POWER_AVAIL ?auto_4372 ) ( HAVE_IMAGE ?auto_4370 ?auto_4369 ) ( not ( = ?auto_4367 ?auto_4370 ) ) ( not ( = ?auto_4368 ?auto_4369 ) ) ( not ( = ?auto_4370 ?auto_4373 ) ) ( not ( = ?auto_4370 ?auto_4375 ) ) ( not ( = ?auto_4369 ?auto_4374 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4375 ?auto_4374 ?auto_4367 ?auto_4368 )
      ( GET-2IMAGE-VERIFY ?auto_4367 ?auto_4368 ?auto_4370 ?auto_4369 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4385 - DIRECTION
      ?auto_4386 - MODE
      ?auto_4388 - DIRECTION
      ?auto_4387 - MODE
      ?auto_4390 - DIRECTION
      ?auto_4389 - MODE
    )
    :vars
    (
      ?auto_4391 - INSTRUMENT
      ?auto_4392 - SATELLITE
      ?auto_4393 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4391 ?auto_4392 ) ( SUPPORTS ?auto_4391 ?auto_4389 ) ( POINTING ?auto_4392 ?auto_4393 ) ( not ( = ?auto_4390 ?auto_4393 ) ) ( HAVE_IMAGE ?auto_4388 ?auto_4386 ) ( not ( = ?auto_4388 ?auto_4390 ) ) ( not ( = ?auto_4388 ?auto_4393 ) ) ( not ( = ?auto_4386 ?auto_4389 ) ) ( CALIBRATION_TARGET ?auto_4391 ?auto_4393 ) ( POWER_AVAIL ?auto_4392 ) ( HAVE_IMAGE ?auto_4385 ?auto_4386 ) ( HAVE_IMAGE ?auto_4388 ?auto_4387 ) ( not ( = ?auto_4385 ?auto_4388 ) ) ( not ( = ?auto_4385 ?auto_4390 ) ) ( not ( = ?auto_4385 ?auto_4393 ) ) ( not ( = ?auto_4386 ?auto_4387 ) ) ( not ( = ?auto_4387 ?auto_4389 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4388 ?auto_4386 ?auto_4390 ?auto_4389 )
      ( GET-3IMAGE-VERIFY ?auto_4385 ?auto_4386 ?auto_4388 ?auto_4387 ?auto_4390 ?auto_4389 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4394 - DIRECTION
      ?auto_4395 - MODE
      ?auto_4397 - DIRECTION
      ?auto_4396 - MODE
      ?auto_4399 - DIRECTION
      ?auto_4398 - MODE
    )
    :vars
    (
      ?auto_4400 - INSTRUMENT
      ?auto_4401 - SATELLITE
      ?auto_4402 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4400 ?auto_4401 ) ( SUPPORTS ?auto_4400 ?auto_4398 ) ( POINTING ?auto_4401 ?auto_4402 ) ( not ( = ?auto_4399 ?auto_4402 ) ) ( HAVE_IMAGE ?auto_4394 ?auto_4395 ) ( not ( = ?auto_4394 ?auto_4399 ) ) ( not ( = ?auto_4394 ?auto_4402 ) ) ( not ( = ?auto_4395 ?auto_4398 ) ) ( CALIBRATION_TARGET ?auto_4400 ?auto_4402 ) ( POWER_AVAIL ?auto_4401 ) ( HAVE_IMAGE ?auto_4397 ?auto_4396 ) ( not ( = ?auto_4394 ?auto_4397 ) ) ( not ( = ?auto_4395 ?auto_4396 ) ) ( not ( = ?auto_4397 ?auto_4399 ) ) ( not ( = ?auto_4397 ?auto_4402 ) ) ( not ( = ?auto_4396 ?auto_4398 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4394 ?auto_4395 ?auto_4399 ?auto_4398 )
      ( GET-3IMAGE-VERIFY ?auto_4394 ?auto_4395 ?auto_4397 ?auto_4396 ?auto_4399 ?auto_4398 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4403 - DIRECTION
      ?auto_4404 - MODE
      ?auto_4406 - DIRECTION
      ?auto_4405 - MODE
      ?auto_4408 - DIRECTION
      ?auto_4407 - MODE
    )
    :vars
    (
      ?auto_4409 - INSTRUMENT
      ?auto_4410 - SATELLITE
      ?auto_4411 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4409 ?auto_4410 ) ( SUPPORTS ?auto_4409 ?auto_4405 ) ( POINTING ?auto_4410 ?auto_4411 ) ( not ( = ?auto_4406 ?auto_4411 ) ) ( HAVE_IMAGE ?auto_4408 ?auto_4407 ) ( not ( = ?auto_4408 ?auto_4406 ) ) ( not ( = ?auto_4408 ?auto_4411 ) ) ( not ( = ?auto_4407 ?auto_4405 ) ) ( CALIBRATION_TARGET ?auto_4409 ?auto_4411 ) ( POWER_AVAIL ?auto_4410 ) ( HAVE_IMAGE ?auto_4403 ?auto_4404 ) ( not ( = ?auto_4403 ?auto_4406 ) ) ( not ( = ?auto_4403 ?auto_4408 ) ) ( not ( = ?auto_4403 ?auto_4411 ) ) ( not ( = ?auto_4404 ?auto_4405 ) ) ( not ( = ?auto_4404 ?auto_4407 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4408 ?auto_4407 ?auto_4406 ?auto_4405 )
      ( GET-3IMAGE-VERIFY ?auto_4403 ?auto_4404 ?auto_4406 ?auto_4405 ?auto_4408 ?auto_4407 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4412 - DIRECTION
      ?auto_4413 - MODE
      ?auto_4415 - DIRECTION
      ?auto_4414 - MODE
      ?auto_4417 - DIRECTION
      ?auto_4416 - MODE
    )
    :vars
    (
      ?auto_4418 - INSTRUMENT
      ?auto_4419 - SATELLITE
      ?auto_4420 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4418 ?auto_4419 ) ( SUPPORTS ?auto_4418 ?auto_4414 ) ( POINTING ?auto_4419 ?auto_4420 ) ( not ( = ?auto_4415 ?auto_4420 ) ) ( HAVE_IMAGE ?auto_4412 ?auto_4413 ) ( not ( = ?auto_4412 ?auto_4415 ) ) ( not ( = ?auto_4412 ?auto_4420 ) ) ( not ( = ?auto_4413 ?auto_4414 ) ) ( CALIBRATION_TARGET ?auto_4418 ?auto_4420 ) ( POWER_AVAIL ?auto_4419 ) ( HAVE_IMAGE ?auto_4417 ?auto_4416 ) ( not ( = ?auto_4412 ?auto_4417 ) ) ( not ( = ?auto_4413 ?auto_4416 ) ) ( not ( = ?auto_4415 ?auto_4417 ) ) ( not ( = ?auto_4414 ?auto_4416 ) ) ( not ( = ?auto_4417 ?auto_4420 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4412 ?auto_4413 ?auto_4415 ?auto_4414 )
      ( GET-3IMAGE-VERIFY ?auto_4412 ?auto_4413 ?auto_4415 ?auto_4414 ?auto_4417 ?auto_4416 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4430 - DIRECTION
      ?auto_4431 - MODE
      ?auto_4433 - DIRECTION
      ?auto_4432 - MODE
      ?auto_4435 - DIRECTION
      ?auto_4434 - MODE
    )
    :vars
    (
      ?auto_4436 - INSTRUMENT
      ?auto_4437 - SATELLITE
      ?auto_4438 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4436 ?auto_4437 ) ( SUPPORTS ?auto_4436 ?auto_4434 ) ( POINTING ?auto_4437 ?auto_4438 ) ( not ( = ?auto_4435 ?auto_4438 ) ) ( HAVE_IMAGE ?auto_4433 ?auto_4432 ) ( not ( = ?auto_4433 ?auto_4435 ) ) ( not ( = ?auto_4433 ?auto_4438 ) ) ( not ( = ?auto_4432 ?auto_4434 ) ) ( CALIBRATION_TARGET ?auto_4436 ?auto_4438 ) ( POWER_AVAIL ?auto_4437 ) ( HAVE_IMAGE ?auto_4430 ?auto_4431 ) ( not ( = ?auto_4430 ?auto_4433 ) ) ( not ( = ?auto_4430 ?auto_4435 ) ) ( not ( = ?auto_4430 ?auto_4438 ) ) ( not ( = ?auto_4431 ?auto_4432 ) ) ( not ( = ?auto_4431 ?auto_4434 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4433 ?auto_4432 ?auto_4435 ?auto_4434 )
      ( GET-3IMAGE-VERIFY ?auto_4430 ?auto_4431 ?auto_4433 ?auto_4432 ?auto_4435 ?auto_4434 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4439 - DIRECTION
      ?auto_4440 - MODE
      ?auto_4442 - DIRECTION
      ?auto_4441 - MODE
      ?auto_4444 - DIRECTION
      ?auto_4443 - MODE
    )
    :vars
    (
      ?auto_4445 - INSTRUMENT
      ?auto_4446 - SATELLITE
      ?auto_4447 - DIRECTION
      ?auto_4449 - DIRECTION
      ?auto_4448 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4445 ?auto_4446 ) ( SUPPORTS ?auto_4445 ?auto_4443 ) ( POINTING ?auto_4446 ?auto_4447 ) ( not ( = ?auto_4444 ?auto_4447 ) ) ( HAVE_IMAGE ?auto_4449 ?auto_4448 ) ( not ( = ?auto_4449 ?auto_4444 ) ) ( not ( = ?auto_4449 ?auto_4447 ) ) ( not ( = ?auto_4448 ?auto_4443 ) ) ( CALIBRATION_TARGET ?auto_4445 ?auto_4447 ) ( POWER_AVAIL ?auto_4446 ) ( HAVE_IMAGE ?auto_4439 ?auto_4440 ) ( HAVE_IMAGE ?auto_4442 ?auto_4441 ) ( not ( = ?auto_4439 ?auto_4442 ) ) ( not ( = ?auto_4439 ?auto_4444 ) ) ( not ( = ?auto_4439 ?auto_4447 ) ) ( not ( = ?auto_4439 ?auto_4449 ) ) ( not ( = ?auto_4440 ?auto_4441 ) ) ( not ( = ?auto_4440 ?auto_4443 ) ) ( not ( = ?auto_4440 ?auto_4448 ) ) ( not ( = ?auto_4442 ?auto_4444 ) ) ( not ( = ?auto_4442 ?auto_4447 ) ) ( not ( = ?auto_4442 ?auto_4449 ) ) ( not ( = ?auto_4441 ?auto_4443 ) ) ( not ( = ?auto_4441 ?auto_4448 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4449 ?auto_4448 ?auto_4444 ?auto_4443 )
      ( GET-3IMAGE-VERIFY ?auto_4439 ?auto_4440 ?auto_4442 ?auto_4441 ?auto_4444 ?auto_4443 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4450 - DIRECTION
      ?auto_4451 - MODE
      ?auto_4453 - DIRECTION
      ?auto_4452 - MODE
      ?auto_4455 - DIRECTION
      ?auto_4454 - MODE
    )
    :vars
    (
      ?auto_4456 - INSTRUMENT
      ?auto_4457 - SATELLITE
      ?auto_4458 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4456 ?auto_4457 ) ( SUPPORTS ?auto_4456 ?auto_4452 ) ( POINTING ?auto_4457 ?auto_4458 ) ( not ( = ?auto_4453 ?auto_4458 ) ) ( HAVE_IMAGE ?auto_4455 ?auto_4454 ) ( not ( = ?auto_4455 ?auto_4453 ) ) ( not ( = ?auto_4455 ?auto_4458 ) ) ( not ( = ?auto_4454 ?auto_4452 ) ) ( CALIBRATION_TARGET ?auto_4456 ?auto_4458 ) ( POWER_AVAIL ?auto_4457 ) ( HAVE_IMAGE ?auto_4450 ?auto_4451 ) ( not ( = ?auto_4450 ?auto_4453 ) ) ( not ( = ?auto_4450 ?auto_4455 ) ) ( not ( = ?auto_4450 ?auto_4458 ) ) ( not ( = ?auto_4451 ?auto_4452 ) ) ( not ( = ?auto_4451 ?auto_4454 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4455 ?auto_4454 ?auto_4453 ?auto_4452 )
      ( GET-3IMAGE-VERIFY ?auto_4450 ?auto_4451 ?auto_4453 ?auto_4452 ?auto_4455 ?auto_4454 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4459 - DIRECTION
      ?auto_4460 - MODE
      ?auto_4462 - DIRECTION
      ?auto_4461 - MODE
      ?auto_4464 - DIRECTION
      ?auto_4463 - MODE
    )
    :vars
    (
      ?auto_4465 - INSTRUMENT
      ?auto_4466 - SATELLITE
      ?auto_4467 - DIRECTION
      ?auto_4469 - DIRECTION
      ?auto_4468 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4465 ?auto_4466 ) ( SUPPORTS ?auto_4465 ?auto_4461 ) ( POINTING ?auto_4466 ?auto_4467 ) ( not ( = ?auto_4462 ?auto_4467 ) ) ( HAVE_IMAGE ?auto_4469 ?auto_4468 ) ( not ( = ?auto_4469 ?auto_4462 ) ) ( not ( = ?auto_4469 ?auto_4467 ) ) ( not ( = ?auto_4468 ?auto_4461 ) ) ( CALIBRATION_TARGET ?auto_4465 ?auto_4467 ) ( POWER_AVAIL ?auto_4466 ) ( HAVE_IMAGE ?auto_4459 ?auto_4460 ) ( HAVE_IMAGE ?auto_4464 ?auto_4463 ) ( not ( = ?auto_4459 ?auto_4462 ) ) ( not ( = ?auto_4459 ?auto_4464 ) ) ( not ( = ?auto_4459 ?auto_4467 ) ) ( not ( = ?auto_4459 ?auto_4469 ) ) ( not ( = ?auto_4460 ?auto_4461 ) ) ( not ( = ?auto_4460 ?auto_4463 ) ) ( not ( = ?auto_4460 ?auto_4468 ) ) ( not ( = ?auto_4462 ?auto_4464 ) ) ( not ( = ?auto_4461 ?auto_4463 ) ) ( not ( = ?auto_4464 ?auto_4467 ) ) ( not ( = ?auto_4464 ?auto_4469 ) ) ( not ( = ?auto_4463 ?auto_4468 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4469 ?auto_4468 ?auto_4462 ?auto_4461 )
      ( GET-3IMAGE-VERIFY ?auto_4459 ?auto_4460 ?auto_4462 ?auto_4461 ?auto_4464 ?auto_4463 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4481 - DIRECTION
      ?auto_4482 - MODE
      ?auto_4484 - DIRECTION
      ?auto_4483 - MODE
      ?auto_4486 - DIRECTION
      ?auto_4485 - MODE
    )
    :vars
    (
      ?auto_4487 - INSTRUMENT
      ?auto_4488 - SATELLITE
      ?auto_4489 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4487 ?auto_4488 ) ( SUPPORTS ?auto_4487 ?auto_4482 ) ( POINTING ?auto_4488 ?auto_4489 ) ( not ( = ?auto_4481 ?auto_4489 ) ) ( HAVE_IMAGE ?auto_4484 ?auto_4483 ) ( not ( = ?auto_4484 ?auto_4481 ) ) ( not ( = ?auto_4484 ?auto_4489 ) ) ( not ( = ?auto_4483 ?auto_4482 ) ) ( CALIBRATION_TARGET ?auto_4487 ?auto_4489 ) ( POWER_AVAIL ?auto_4488 ) ( HAVE_IMAGE ?auto_4486 ?auto_4485 ) ( not ( = ?auto_4481 ?auto_4486 ) ) ( not ( = ?auto_4482 ?auto_4485 ) ) ( not ( = ?auto_4484 ?auto_4486 ) ) ( not ( = ?auto_4483 ?auto_4485 ) ) ( not ( = ?auto_4486 ?auto_4489 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4484 ?auto_4483 ?auto_4481 ?auto_4482 )
      ( GET-3IMAGE-VERIFY ?auto_4481 ?auto_4482 ?auto_4484 ?auto_4483 ?auto_4486 ?auto_4485 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4490 - DIRECTION
      ?auto_4491 - MODE
      ?auto_4493 - DIRECTION
      ?auto_4492 - MODE
      ?auto_4495 - DIRECTION
      ?auto_4494 - MODE
    )
    :vars
    (
      ?auto_4496 - INSTRUMENT
      ?auto_4497 - SATELLITE
      ?auto_4498 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4496 ?auto_4497 ) ( SUPPORTS ?auto_4496 ?auto_4491 ) ( POINTING ?auto_4497 ?auto_4498 ) ( not ( = ?auto_4490 ?auto_4498 ) ) ( HAVE_IMAGE ?auto_4493 ?auto_4492 ) ( not ( = ?auto_4493 ?auto_4490 ) ) ( not ( = ?auto_4493 ?auto_4498 ) ) ( not ( = ?auto_4492 ?auto_4491 ) ) ( CALIBRATION_TARGET ?auto_4496 ?auto_4498 ) ( POWER_AVAIL ?auto_4497 ) ( HAVE_IMAGE ?auto_4495 ?auto_4494 ) ( not ( = ?auto_4490 ?auto_4495 ) ) ( not ( = ?auto_4491 ?auto_4494 ) ) ( not ( = ?auto_4493 ?auto_4495 ) ) ( not ( = ?auto_4492 ?auto_4494 ) ) ( not ( = ?auto_4495 ?auto_4498 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4493 ?auto_4492 ?auto_4490 ?auto_4491 )
      ( GET-3IMAGE-VERIFY ?auto_4490 ?auto_4491 ?auto_4493 ?auto_4492 ?auto_4495 ?auto_4494 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4508 - DIRECTION
      ?auto_4509 - MODE
      ?auto_4511 - DIRECTION
      ?auto_4510 - MODE
      ?auto_4513 - DIRECTION
      ?auto_4512 - MODE
    )
    :vars
    (
      ?auto_4514 - INSTRUMENT
      ?auto_4515 - SATELLITE
      ?auto_4516 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4514 ?auto_4515 ) ( SUPPORTS ?auto_4514 ?auto_4509 ) ( POINTING ?auto_4515 ?auto_4516 ) ( not ( = ?auto_4508 ?auto_4516 ) ) ( HAVE_IMAGE ?auto_4513 ?auto_4512 ) ( not ( = ?auto_4513 ?auto_4508 ) ) ( not ( = ?auto_4513 ?auto_4516 ) ) ( not ( = ?auto_4512 ?auto_4509 ) ) ( CALIBRATION_TARGET ?auto_4514 ?auto_4516 ) ( POWER_AVAIL ?auto_4515 ) ( HAVE_IMAGE ?auto_4511 ?auto_4510 ) ( not ( = ?auto_4508 ?auto_4511 ) ) ( not ( = ?auto_4509 ?auto_4510 ) ) ( not ( = ?auto_4511 ?auto_4513 ) ) ( not ( = ?auto_4511 ?auto_4516 ) ) ( not ( = ?auto_4510 ?auto_4512 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4513 ?auto_4512 ?auto_4508 ?auto_4509 )
      ( GET-3IMAGE-VERIFY ?auto_4508 ?auto_4509 ?auto_4511 ?auto_4510 ?auto_4513 ?auto_4512 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4517 - DIRECTION
      ?auto_4518 - MODE
      ?auto_4520 - DIRECTION
      ?auto_4519 - MODE
      ?auto_4522 - DIRECTION
      ?auto_4521 - MODE
    )
    :vars
    (
      ?auto_4523 - INSTRUMENT
      ?auto_4524 - SATELLITE
      ?auto_4525 - DIRECTION
      ?auto_4527 - DIRECTION
      ?auto_4526 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4523 ?auto_4524 ) ( SUPPORTS ?auto_4523 ?auto_4518 ) ( POINTING ?auto_4524 ?auto_4525 ) ( not ( = ?auto_4517 ?auto_4525 ) ) ( HAVE_IMAGE ?auto_4527 ?auto_4526 ) ( not ( = ?auto_4527 ?auto_4517 ) ) ( not ( = ?auto_4527 ?auto_4525 ) ) ( not ( = ?auto_4526 ?auto_4518 ) ) ( CALIBRATION_TARGET ?auto_4523 ?auto_4525 ) ( POWER_AVAIL ?auto_4524 ) ( HAVE_IMAGE ?auto_4520 ?auto_4519 ) ( HAVE_IMAGE ?auto_4522 ?auto_4521 ) ( not ( = ?auto_4517 ?auto_4520 ) ) ( not ( = ?auto_4517 ?auto_4522 ) ) ( not ( = ?auto_4518 ?auto_4519 ) ) ( not ( = ?auto_4518 ?auto_4521 ) ) ( not ( = ?auto_4520 ?auto_4522 ) ) ( not ( = ?auto_4520 ?auto_4525 ) ) ( not ( = ?auto_4520 ?auto_4527 ) ) ( not ( = ?auto_4519 ?auto_4521 ) ) ( not ( = ?auto_4519 ?auto_4526 ) ) ( not ( = ?auto_4522 ?auto_4525 ) ) ( not ( = ?auto_4522 ?auto_4527 ) ) ( not ( = ?auto_4521 ?auto_4526 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4527 ?auto_4526 ?auto_4517 ?auto_4518 )
      ( GET-3IMAGE-VERIFY ?auto_4517 ?auto_4518 ?auto_4520 ?auto_4519 ?auto_4522 ?auto_4521 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4570 - DIRECTION
      ?auto_4571 - MODE
    )
    :vars
    (
      ?auto_4572 - INSTRUMENT
      ?auto_4573 - SATELLITE
      ?auto_4574 - DIRECTION
      ?auto_4576 - DIRECTION
      ?auto_4575 - MODE
      ?auto_4577 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4572 ?auto_4573 ) ( SUPPORTS ?auto_4572 ?auto_4571 ) ( not ( = ?auto_4570 ?auto_4574 ) ) ( HAVE_IMAGE ?auto_4576 ?auto_4575 ) ( not ( = ?auto_4576 ?auto_4570 ) ) ( not ( = ?auto_4576 ?auto_4574 ) ) ( not ( = ?auto_4575 ?auto_4571 ) ) ( CALIBRATION_TARGET ?auto_4572 ?auto_4574 ) ( POWER_AVAIL ?auto_4573 ) ( POINTING ?auto_4573 ?auto_4577 ) ( not ( = ?auto_4574 ?auto_4577 ) ) ( not ( = ?auto_4570 ?auto_4577 ) ) ( not ( = ?auto_4576 ?auto_4577 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_4573 ?auto_4574 ?auto_4577 )
      ( GET-2IMAGE ?auto_4576 ?auto_4575 ?auto_4570 ?auto_4571 )
      ( GET-1IMAGE-VERIFY ?auto_4570 ?auto_4571 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4578 - DIRECTION
      ?auto_4579 - MODE
      ?auto_4581 - DIRECTION
      ?auto_4580 - MODE
    )
    :vars
    (
      ?auto_4583 - INSTRUMENT
      ?auto_4584 - SATELLITE
      ?auto_4582 - DIRECTION
      ?auto_4585 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4583 ?auto_4584 ) ( SUPPORTS ?auto_4583 ?auto_4580 ) ( not ( = ?auto_4581 ?auto_4582 ) ) ( HAVE_IMAGE ?auto_4578 ?auto_4579 ) ( not ( = ?auto_4578 ?auto_4581 ) ) ( not ( = ?auto_4578 ?auto_4582 ) ) ( not ( = ?auto_4579 ?auto_4580 ) ) ( CALIBRATION_TARGET ?auto_4583 ?auto_4582 ) ( POWER_AVAIL ?auto_4584 ) ( POINTING ?auto_4584 ?auto_4585 ) ( not ( = ?auto_4582 ?auto_4585 ) ) ( not ( = ?auto_4581 ?auto_4585 ) ) ( not ( = ?auto_4578 ?auto_4585 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4581 ?auto_4580 )
      ( GET-2IMAGE-VERIFY ?auto_4578 ?auto_4579 ?auto_4581 ?auto_4580 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4586 - DIRECTION
      ?auto_4587 - MODE
      ?auto_4589 - DIRECTION
      ?auto_4588 - MODE
    )
    :vars
    (
      ?auto_4590 - INSTRUMENT
      ?auto_4592 - SATELLITE
      ?auto_4591 - DIRECTION
      ?auto_4594 - DIRECTION
      ?auto_4593 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4590 ?auto_4592 ) ( SUPPORTS ?auto_4590 ?auto_4588 ) ( not ( = ?auto_4589 ?auto_4591 ) ) ( HAVE_IMAGE ?auto_4594 ?auto_4593 ) ( not ( = ?auto_4594 ?auto_4589 ) ) ( not ( = ?auto_4594 ?auto_4591 ) ) ( not ( = ?auto_4593 ?auto_4588 ) ) ( CALIBRATION_TARGET ?auto_4590 ?auto_4591 ) ( POWER_AVAIL ?auto_4592 ) ( POINTING ?auto_4592 ?auto_4586 ) ( not ( = ?auto_4591 ?auto_4586 ) ) ( not ( = ?auto_4589 ?auto_4586 ) ) ( not ( = ?auto_4594 ?auto_4586 ) ) ( HAVE_IMAGE ?auto_4586 ?auto_4587 ) ( not ( = ?auto_4587 ?auto_4588 ) ) ( not ( = ?auto_4587 ?auto_4593 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4594 ?auto_4593 ?auto_4589 ?auto_4588 )
      ( GET-2IMAGE-VERIFY ?auto_4586 ?auto_4587 ?auto_4589 ?auto_4588 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4595 - DIRECTION
      ?auto_4596 - MODE
      ?auto_4598 - DIRECTION
      ?auto_4597 - MODE
    )
    :vars
    (
      ?auto_4600 - INSTRUMENT
      ?auto_4602 - SATELLITE
      ?auto_4601 - DIRECTION
      ?auto_4599 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4600 ?auto_4602 ) ( SUPPORTS ?auto_4600 ?auto_4596 ) ( not ( = ?auto_4595 ?auto_4601 ) ) ( HAVE_IMAGE ?auto_4598 ?auto_4597 ) ( not ( = ?auto_4598 ?auto_4595 ) ) ( not ( = ?auto_4598 ?auto_4601 ) ) ( not ( = ?auto_4597 ?auto_4596 ) ) ( CALIBRATION_TARGET ?auto_4600 ?auto_4601 ) ( POWER_AVAIL ?auto_4602 ) ( POINTING ?auto_4602 ?auto_4599 ) ( not ( = ?auto_4601 ?auto_4599 ) ) ( not ( = ?auto_4595 ?auto_4599 ) ) ( not ( = ?auto_4598 ?auto_4599 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4598 ?auto_4597 ?auto_4595 ?auto_4596 )
      ( GET-2IMAGE-VERIFY ?auto_4595 ?auto_4596 ?auto_4598 ?auto_4597 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4603 - DIRECTION
      ?auto_4604 - MODE
      ?auto_4606 - DIRECTION
      ?auto_4605 - MODE
    )
    :vars
    (
      ?auto_4607 - INSTRUMENT
      ?auto_4609 - SATELLITE
      ?auto_4608 - DIRECTION
      ?auto_4611 - DIRECTION
      ?auto_4610 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4607 ?auto_4609 ) ( SUPPORTS ?auto_4607 ?auto_4604 ) ( not ( = ?auto_4603 ?auto_4608 ) ) ( HAVE_IMAGE ?auto_4611 ?auto_4610 ) ( not ( = ?auto_4611 ?auto_4603 ) ) ( not ( = ?auto_4611 ?auto_4608 ) ) ( not ( = ?auto_4610 ?auto_4604 ) ) ( CALIBRATION_TARGET ?auto_4607 ?auto_4608 ) ( POWER_AVAIL ?auto_4609 ) ( POINTING ?auto_4609 ?auto_4606 ) ( not ( = ?auto_4608 ?auto_4606 ) ) ( not ( = ?auto_4603 ?auto_4606 ) ) ( not ( = ?auto_4611 ?auto_4606 ) ) ( HAVE_IMAGE ?auto_4606 ?auto_4605 ) ( not ( = ?auto_4604 ?auto_4605 ) ) ( not ( = ?auto_4605 ?auto_4610 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4611 ?auto_4610 ?auto_4603 ?auto_4604 )
      ( GET-2IMAGE-VERIFY ?auto_4603 ?auto_4604 ?auto_4606 ?auto_4605 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4622 - DIRECTION
      ?auto_4623 - MODE
      ?auto_4625 - DIRECTION
      ?auto_4624 - MODE
      ?auto_4627 - DIRECTION
      ?auto_4626 - MODE
    )
    :vars
    (
      ?auto_4629 - INSTRUMENT
      ?auto_4631 - SATELLITE
      ?auto_4630 - DIRECTION
      ?auto_4628 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4629 ?auto_4631 ) ( SUPPORTS ?auto_4629 ?auto_4626 ) ( not ( = ?auto_4627 ?auto_4630 ) ) ( HAVE_IMAGE ?auto_4622 ?auto_4623 ) ( not ( = ?auto_4622 ?auto_4627 ) ) ( not ( = ?auto_4622 ?auto_4630 ) ) ( not ( = ?auto_4623 ?auto_4626 ) ) ( CALIBRATION_TARGET ?auto_4629 ?auto_4630 ) ( POWER_AVAIL ?auto_4631 ) ( POINTING ?auto_4631 ?auto_4628 ) ( not ( = ?auto_4630 ?auto_4628 ) ) ( not ( = ?auto_4627 ?auto_4628 ) ) ( not ( = ?auto_4622 ?auto_4628 ) ) ( HAVE_IMAGE ?auto_4625 ?auto_4624 ) ( not ( = ?auto_4622 ?auto_4625 ) ) ( not ( = ?auto_4623 ?auto_4624 ) ) ( not ( = ?auto_4625 ?auto_4627 ) ) ( not ( = ?auto_4625 ?auto_4630 ) ) ( not ( = ?auto_4625 ?auto_4628 ) ) ( not ( = ?auto_4624 ?auto_4626 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4622 ?auto_4623 ?auto_4627 ?auto_4626 )
      ( GET-3IMAGE-VERIFY ?auto_4622 ?auto_4623 ?auto_4625 ?auto_4624 ?auto_4627 ?auto_4626 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4632 - DIRECTION
      ?auto_4633 - MODE
      ?auto_4635 - DIRECTION
      ?auto_4634 - MODE
      ?auto_4637 - DIRECTION
      ?auto_4636 - MODE
    )
    :vars
    (
      ?auto_4638 - INSTRUMENT
      ?auto_4640 - SATELLITE
      ?auto_4639 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4638 ?auto_4640 ) ( SUPPORTS ?auto_4638 ?auto_4636 ) ( not ( = ?auto_4637 ?auto_4639 ) ) ( HAVE_IMAGE ?auto_4632 ?auto_4633 ) ( not ( = ?auto_4632 ?auto_4637 ) ) ( not ( = ?auto_4632 ?auto_4639 ) ) ( not ( = ?auto_4633 ?auto_4636 ) ) ( CALIBRATION_TARGET ?auto_4638 ?auto_4639 ) ( POWER_AVAIL ?auto_4640 ) ( POINTING ?auto_4640 ?auto_4635 ) ( not ( = ?auto_4639 ?auto_4635 ) ) ( not ( = ?auto_4637 ?auto_4635 ) ) ( not ( = ?auto_4632 ?auto_4635 ) ) ( HAVE_IMAGE ?auto_4635 ?auto_4634 ) ( not ( = ?auto_4633 ?auto_4634 ) ) ( not ( = ?auto_4634 ?auto_4636 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4632 ?auto_4633 ?auto_4637 ?auto_4636 )
      ( GET-3IMAGE-VERIFY ?auto_4632 ?auto_4633 ?auto_4635 ?auto_4634 ?auto_4637 ?auto_4636 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4641 - DIRECTION
      ?auto_4642 - MODE
      ?auto_4644 - DIRECTION
      ?auto_4643 - MODE
      ?auto_4646 - DIRECTION
      ?auto_4645 - MODE
    )
    :vars
    (
      ?auto_4648 - INSTRUMENT
      ?auto_4650 - SATELLITE
      ?auto_4649 - DIRECTION
      ?auto_4647 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4648 ?auto_4650 ) ( SUPPORTS ?auto_4648 ?auto_4643 ) ( not ( = ?auto_4644 ?auto_4649 ) ) ( HAVE_IMAGE ?auto_4646 ?auto_4645 ) ( not ( = ?auto_4646 ?auto_4644 ) ) ( not ( = ?auto_4646 ?auto_4649 ) ) ( not ( = ?auto_4645 ?auto_4643 ) ) ( CALIBRATION_TARGET ?auto_4648 ?auto_4649 ) ( POWER_AVAIL ?auto_4650 ) ( POINTING ?auto_4650 ?auto_4647 ) ( not ( = ?auto_4649 ?auto_4647 ) ) ( not ( = ?auto_4644 ?auto_4647 ) ) ( not ( = ?auto_4646 ?auto_4647 ) ) ( HAVE_IMAGE ?auto_4641 ?auto_4642 ) ( not ( = ?auto_4641 ?auto_4644 ) ) ( not ( = ?auto_4641 ?auto_4646 ) ) ( not ( = ?auto_4641 ?auto_4649 ) ) ( not ( = ?auto_4641 ?auto_4647 ) ) ( not ( = ?auto_4642 ?auto_4643 ) ) ( not ( = ?auto_4642 ?auto_4645 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4646 ?auto_4645 ?auto_4644 ?auto_4643 )
      ( GET-3IMAGE-VERIFY ?auto_4641 ?auto_4642 ?auto_4644 ?auto_4643 ?auto_4646 ?auto_4645 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4651 - DIRECTION
      ?auto_4652 - MODE
      ?auto_4654 - DIRECTION
      ?auto_4653 - MODE
      ?auto_4656 - DIRECTION
      ?auto_4655 - MODE
    )
    :vars
    (
      ?auto_4657 - INSTRUMENT
      ?auto_4659 - SATELLITE
      ?auto_4658 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4657 ?auto_4659 ) ( SUPPORTS ?auto_4657 ?auto_4653 ) ( not ( = ?auto_4654 ?auto_4658 ) ) ( HAVE_IMAGE ?auto_4651 ?auto_4652 ) ( not ( = ?auto_4651 ?auto_4654 ) ) ( not ( = ?auto_4651 ?auto_4658 ) ) ( not ( = ?auto_4652 ?auto_4653 ) ) ( CALIBRATION_TARGET ?auto_4657 ?auto_4658 ) ( POWER_AVAIL ?auto_4659 ) ( POINTING ?auto_4659 ?auto_4656 ) ( not ( = ?auto_4658 ?auto_4656 ) ) ( not ( = ?auto_4654 ?auto_4656 ) ) ( not ( = ?auto_4651 ?auto_4656 ) ) ( HAVE_IMAGE ?auto_4656 ?auto_4655 ) ( not ( = ?auto_4652 ?auto_4655 ) ) ( not ( = ?auto_4653 ?auto_4655 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4651 ?auto_4652 ?auto_4654 ?auto_4653 )
      ( GET-3IMAGE-VERIFY ?auto_4651 ?auto_4652 ?auto_4654 ?auto_4653 ?auto_4656 ?auto_4655 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4670 - DIRECTION
      ?auto_4671 - MODE
      ?auto_4673 - DIRECTION
      ?auto_4672 - MODE
      ?auto_4675 - DIRECTION
      ?auto_4674 - MODE
    )
    :vars
    (
      ?auto_4676 - INSTRUMENT
      ?auto_4678 - SATELLITE
      ?auto_4677 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4676 ?auto_4678 ) ( SUPPORTS ?auto_4676 ?auto_4674 ) ( not ( = ?auto_4675 ?auto_4677 ) ) ( HAVE_IMAGE ?auto_4673 ?auto_4672 ) ( not ( = ?auto_4673 ?auto_4675 ) ) ( not ( = ?auto_4673 ?auto_4677 ) ) ( not ( = ?auto_4672 ?auto_4674 ) ) ( CALIBRATION_TARGET ?auto_4676 ?auto_4677 ) ( POWER_AVAIL ?auto_4678 ) ( POINTING ?auto_4678 ?auto_4670 ) ( not ( = ?auto_4677 ?auto_4670 ) ) ( not ( = ?auto_4675 ?auto_4670 ) ) ( not ( = ?auto_4673 ?auto_4670 ) ) ( HAVE_IMAGE ?auto_4670 ?auto_4671 ) ( not ( = ?auto_4671 ?auto_4672 ) ) ( not ( = ?auto_4671 ?auto_4674 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4673 ?auto_4672 ?auto_4675 ?auto_4674 )
      ( GET-3IMAGE-VERIFY ?auto_4670 ?auto_4671 ?auto_4673 ?auto_4672 ?auto_4675 ?auto_4674 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4679 - DIRECTION
      ?auto_4680 - MODE
      ?auto_4682 - DIRECTION
      ?auto_4681 - MODE
      ?auto_4684 - DIRECTION
      ?auto_4683 - MODE
    )
    :vars
    (
      ?auto_4685 - INSTRUMENT
      ?auto_4687 - SATELLITE
      ?auto_4686 - DIRECTION
      ?auto_4689 - DIRECTION
      ?auto_4688 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4685 ?auto_4687 ) ( SUPPORTS ?auto_4685 ?auto_4683 ) ( not ( = ?auto_4684 ?auto_4686 ) ) ( HAVE_IMAGE ?auto_4689 ?auto_4688 ) ( not ( = ?auto_4689 ?auto_4684 ) ) ( not ( = ?auto_4689 ?auto_4686 ) ) ( not ( = ?auto_4688 ?auto_4683 ) ) ( CALIBRATION_TARGET ?auto_4685 ?auto_4686 ) ( POWER_AVAIL ?auto_4687 ) ( POINTING ?auto_4687 ?auto_4682 ) ( not ( = ?auto_4686 ?auto_4682 ) ) ( not ( = ?auto_4684 ?auto_4682 ) ) ( not ( = ?auto_4689 ?auto_4682 ) ) ( HAVE_IMAGE ?auto_4679 ?auto_4680 ) ( HAVE_IMAGE ?auto_4682 ?auto_4681 ) ( not ( = ?auto_4679 ?auto_4682 ) ) ( not ( = ?auto_4679 ?auto_4684 ) ) ( not ( = ?auto_4679 ?auto_4686 ) ) ( not ( = ?auto_4679 ?auto_4689 ) ) ( not ( = ?auto_4680 ?auto_4681 ) ) ( not ( = ?auto_4680 ?auto_4683 ) ) ( not ( = ?auto_4680 ?auto_4688 ) ) ( not ( = ?auto_4681 ?auto_4683 ) ) ( not ( = ?auto_4681 ?auto_4688 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4689 ?auto_4688 ?auto_4684 ?auto_4683 )
      ( GET-3IMAGE-VERIFY ?auto_4679 ?auto_4680 ?auto_4682 ?auto_4681 ?auto_4684 ?auto_4683 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4690 - DIRECTION
      ?auto_4691 - MODE
      ?auto_4693 - DIRECTION
      ?auto_4692 - MODE
      ?auto_4695 - DIRECTION
      ?auto_4694 - MODE
    )
    :vars
    (
      ?auto_4696 - INSTRUMENT
      ?auto_4698 - SATELLITE
      ?auto_4697 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4696 ?auto_4698 ) ( SUPPORTS ?auto_4696 ?auto_4692 ) ( not ( = ?auto_4693 ?auto_4697 ) ) ( HAVE_IMAGE ?auto_4695 ?auto_4694 ) ( not ( = ?auto_4695 ?auto_4693 ) ) ( not ( = ?auto_4695 ?auto_4697 ) ) ( not ( = ?auto_4694 ?auto_4692 ) ) ( CALIBRATION_TARGET ?auto_4696 ?auto_4697 ) ( POWER_AVAIL ?auto_4698 ) ( POINTING ?auto_4698 ?auto_4690 ) ( not ( = ?auto_4697 ?auto_4690 ) ) ( not ( = ?auto_4693 ?auto_4690 ) ) ( not ( = ?auto_4695 ?auto_4690 ) ) ( HAVE_IMAGE ?auto_4690 ?auto_4691 ) ( not ( = ?auto_4691 ?auto_4692 ) ) ( not ( = ?auto_4691 ?auto_4694 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4695 ?auto_4694 ?auto_4693 ?auto_4692 )
      ( GET-3IMAGE-VERIFY ?auto_4690 ?auto_4691 ?auto_4693 ?auto_4692 ?auto_4695 ?auto_4694 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4699 - DIRECTION
      ?auto_4700 - MODE
      ?auto_4702 - DIRECTION
      ?auto_4701 - MODE
      ?auto_4704 - DIRECTION
      ?auto_4703 - MODE
    )
    :vars
    (
      ?auto_4705 - INSTRUMENT
      ?auto_4707 - SATELLITE
      ?auto_4706 - DIRECTION
      ?auto_4709 - DIRECTION
      ?auto_4708 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4705 ?auto_4707 ) ( SUPPORTS ?auto_4705 ?auto_4701 ) ( not ( = ?auto_4702 ?auto_4706 ) ) ( HAVE_IMAGE ?auto_4709 ?auto_4708 ) ( not ( = ?auto_4709 ?auto_4702 ) ) ( not ( = ?auto_4709 ?auto_4706 ) ) ( not ( = ?auto_4708 ?auto_4701 ) ) ( CALIBRATION_TARGET ?auto_4705 ?auto_4706 ) ( POWER_AVAIL ?auto_4707 ) ( POINTING ?auto_4707 ?auto_4704 ) ( not ( = ?auto_4706 ?auto_4704 ) ) ( not ( = ?auto_4702 ?auto_4704 ) ) ( not ( = ?auto_4709 ?auto_4704 ) ) ( HAVE_IMAGE ?auto_4699 ?auto_4700 ) ( HAVE_IMAGE ?auto_4704 ?auto_4703 ) ( not ( = ?auto_4699 ?auto_4702 ) ) ( not ( = ?auto_4699 ?auto_4704 ) ) ( not ( = ?auto_4699 ?auto_4706 ) ) ( not ( = ?auto_4699 ?auto_4709 ) ) ( not ( = ?auto_4700 ?auto_4701 ) ) ( not ( = ?auto_4700 ?auto_4703 ) ) ( not ( = ?auto_4700 ?auto_4708 ) ) ( not ( = ?auto_4701 ?auto_4703 ) ) ( not ( = ?auto_4703 ?auto_4708 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4709 ?auto_4708 ?auto_4702 ?auto_4701 )
      ( GET-3IMAGE-VERIFY ?auto_4699 ?auto_4700 ?auto_4702 ?auto_4701 ?auto_4704 ?auto_4703 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4721 - DIRECTION
      ?auto_4722 - MODE
      ?auto_4724 - DIRECTION
      ?auto_4723 - MODE
      ?auto_4726 - DIRECTION
      ?auto_4725 - MODE
    )
    :vars
    (
      ?auto_4728 - INSTRUMENT
      ?auto_4730 - SATELLITE
      ?auto_4729 - DIRECTION
      ?auto_4727 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4728 ?auto_4730 ) ( SUPPORTS ?auto_4728 ?auto_4722 ) ( not ( = ?auto_4721 ?auto_4729 ) ) ( HAVE_IMAGE ?auto_4724 ?auto_4723 ) ( not ( = ?auto_4724 ?auto_4721 ) ) ( not ( = ?auto_4724 ?auto_4729 ) ) ( not ( = ?auto_4723 ?auto_4722 ) ) ( CALIBRATION_TARGET ?auto_4728 ?auto_4729 ) ( POWER_AVAIL ?auto_4730 ) ( POINTING ?auto_4730 ?auto_4727 ) ( not ( = ?auto_4729 ?auto_4727 ) ) ( not ( = ?auto_4721 ?auto_4727 ) ) ( not ( = ?auto_4724 ?auto_4727 ) ) ( HAVE_IMAGE ?auto_4726 ?auto_4725 ) ( not ( = ?auto_4721 ?auto_4726 ) ) ( not ( = ?auto_4722 ?auto_4725 ) ) ( not ( = ?auto_4724 ?auto_4726 ) ) ( not ( = ?auto_4723 ?auto_4725 ) ) ( not ( = ?auto_4726 ?auto_4729 ) ) ( not ( = ?auto_4726 ?auto_4727 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4724 ?auto_4723 ?auto_4721 ?auto_4722 )
      ( GET-3IMAGE-VERIFY ?auto_4721 ?auto_4722 ?auto_4724 ?auto_4723 ?auto_4726 ?auto_4725 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4731 - DIRECTION
      ?auto_4732 - MODE
      ?auto_4734 - DIRECTION
      ?auto_4733 - MODE
      ?auto_4736 - DIRECTION
      ?auto_4735 - MODE
    )
    :vars
    (
      ?auto_4737 - INSTRUMENT
      ?auto_4739 - SATELLITE
      ?auto_4738 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4737 ?auto_4739 ) ( SUPPORTS ?auto_4737 ?auto_4732 ) ( not ( = ?auto_4731 ?auto_4738 ) ) ( HAVE_IMAGE ?auto_4734 ?auto_4733 ) ( not ( = ?auto_4734 ?auto_4731 ) ) ( not ( = ?auto_4734 ?auto_4738 ) ) ( not ( = ?auto_4733 ?auto_4732 ) ) ( CALIBRATION_TARGET ?auto_4737 ?auto_4738 ) ( POWER_AVAIL ?auto_4739 ) ( POINTING ?auto_4739 ?auto_4736 ) ( not ( = ?auto_4738 ?auto_4736 ) ) ( not ( = ?auto_4731 ?auto_4736 ) ) ( not ( = ?auto_4734 ?auto_4736 ) ) ( HAVE_IMAGE ?auto_4736 ?auto_4735 ) ( not ( = ?auto_4732 ?auto_4735 ) ) ( not ( = ?auto_4733 ?auto_4735 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4734 ?auto_4733 ?auto_4731 ?auto_4732 )
      ( GET-3IMAGE-VERIFY ?auto_4731 ?auto_4732 ?auto_4734 ?auto_4733 ?auto_4736 ?auto_4735 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4750 - DIRECTION
      ?auto_4751 - MODE
      ?auto_4753 - DIRECTION
      ?auto_4752 - MODE
      ?auto_4755 - DIRECTION
      ?auto_4754 - MODE
    )
    :vars
    (
      ?auto_4756 - INSTRUMENT
      ?auto_4758 - SATELLITE
      ?auto_4757 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_4756 ?auto_4758 ) ( SUPPORTS ?auto_4756 ?auto_4751 ) ( not ( = ?auto_4750 ?auto_4757 ) ) ( HAVE_IMAGE ?auto_4755 ?auto_4754 ) ( not ( = ?auto_4755 ?auto_4750 ) ) ( not ( = ?auto_4755 ?auto_4757 ) ) ( not ( = ?auto_4754 ?auto_4751 ) ) ( CALIBRATION_TARGET ?auto_4756 ?auto_4757 ) ( POWER_AVAIL ?auto_4758 ) ( POINTING ?auto_4758 ?auto_4753 ) ( not ( = ?auto_4757 ?auto_4753 ) ) ( not ( = ?auto_4750 ?auto_4753 ) ) ( not ( = ?auto_4755 ?auto_4753 ) ) ( HAVE_IMAGE ?auto_4753 ?auto_4752 ) ( not ( = ?auto_4751 ?auto_4752 ) ) ( not ( = ?auto_4752 ?auto_4754 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4755 ?auto_4754 ?auto_4750 ?auto_4751 )
      ( GET-3IMAGE-VERIFY ?auto_4750 ?auto_4751 ?auto_4753 ?auto_4752 ?auto_4755 ?auto_4754 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4759 - DIRECTION
      ?auto_4760 - MODE
      ?auto_4762 - DIRECTION
      ?auto_4761 - MODE
      ?auto_4764 - DIRECTION
      ?auto_4763 - MODE
    )
    :vars
    (
      ?auto_4765 - INSTRUMENT
      ?auto_4767 - SATELLITE
      ?auto_4766 - DIRECTION
      ?auto_4769 - DIRECTION
      ?auto_4768 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_4765 ?auto_4767 ) ( SUPPORTS ?auto_4765 ?auto_4760 ) ( not ( = ?auto_4759 ?auto_4766 ) ) ( HAVE_IMAGE ?auto_4769 ?auto_4768 ) ( not ( = ?auto_4769 ?auto_4759 ) ) ( not ( = ?auto_4769 ?auto_4766 ) ) ( not ( = ?auto_4768 ?auto_4760 ) ) ( CALIBRATION_TARGET ?auto_4765 ?auto_4766 ) ( POWER_AVAIL ?auto_4767 ) ( POINTING ?auto_4767 ?auto_4764 ) ( not ( = ?auto_4766 ?auto_4764 ) ) ( not ( = ?auto_4759 ?auto_4764 ) ) ( not ( = ?auto_4769 ?auto_4764 ) ) ( HAVE_IMAGE ?auto_4762 ?auto_4761 ) ( HAVE_IMAGE ?auto_4764 ?auto_4763 ) ( not ( = ?auto_4759 ?auto_4762 ) ) ( not ( = ?auto_4760 ?auto_4761 ) ) ( not ( = ?auto_4760 ?auto_4763 ) ) ( not ( = ?auto_4762 ?auto_4764 ) ) ( not ( = ?auto_4762 ?auto_4766 ) ) ( not ( = ?auto_4762 ?auto_4769 ) ) ( not ( = ?auto_4761 ?auto_4763 ) ) ( not ( = ?auto_4761 ?auto_4768 ) ) ( not ( = ?auto_4763 ?auto_4768 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4769 ?auto_4768 ?auto_4759 ?auto_4760 )
      ( GET-3IMAGE-VERIFY ?auto_4759 ?auto_4760 ?auto_4762 ?auto_4761 ?auto_4764 ?auto_4763 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4814 - DIRECTION
      ?auto_4815 - MODE
    )
    :vars
    (
      ?auto_4817 - INSTRUMENT
      ?auto_4819 - SATELLITE
      ?auto_4818 - DIRECTION
      ?auto_4821 - DIRECTION
      ?auto_4820 - MODE
      ?auto_4816 - DIRECTION
      ?auto_4822 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4817 ?auto_4819 ) ( SUPPORTS ?auto_4817 ?auto_4815 ) ( not ( = ?auto_4814 ?auto_4818 ) ) ( HAVE_IMAGE ?auto_4821 ?auto_4820 ) ( not ( = ?auto_4821 ?auto_4814 ) ) ( not ( = ?auto_4821 ?auto_4818 ) ) ( not ( = ?auto_4820 ?auto_4815 ) ) ( CALIBRATION_TARGET ?auto_4817 ?auto_4818 ) ( POINTING ?auto_4819 ?auto_4816 ) ( not ( = ?auto_4818 ?auto_4816 ) ) ( not ( = ?auto_4814 ?auto_4816 ) ) ( not ( = ?auto_4821 ?auto_4816 ) ) ( ON_BOARD ?auto_4822 ?auto_4819 ) ( POWER_ON ?auto_4822 ) ( not ( = ?auto_4817 ?auto_4822 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_4822 ?auto_4819 )
      ( GET-2IMAGE ?auto_4821 ?auto_4820 ?auto_4814 ?auto_4815 )
      ( GET-1IMAGE-VERIFY ?auto_4814 ?auto_4815 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4823 - DIRECTION
      ?auto_4824 - MODE
      ?auto_4826 - DIRECTION
      ?auto_4825 - MODE
    )
    :vars
    (
      ?auto_4831 - INSTRUMENT
      ?auto_4830 - SATELLITE
      ?auto_4829 - DIRECTION
      ?auto_4827 - DIRECTION
      ?auto_4828 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4831 ?auto_4830 ) ( SUPPORTS ?auto_4831 ?auto_4825 ) ( not ( = ?auto_4826 ?auto_4829 ) ) ( HAVE_IMAGE ?auto_4823 ?auto_4824 ) ( not ( = ?auto_4823 ?auto_4826 ) ) ( not ( = ?auto_4823 ?auto_4829 ) ) ( not ( = ?auto_4824 ?auto_4825 ) ) ( CALIBRATION_TARGET ?auto_4831 ?auto_4829 ) ( POINTING ?auto_4830 ?auto_4827 ) ( not ( = ?auto_4829 ?auto_4827 ) ) ( not ( = ?auto_4826 ?auto_4827 ) ) ( not ( = ?auto_4823 ?auto_4827 ) ) ( ON_BOARD ?auto_4828 ?auto_4830 ) ( POWER_ON ?auto_4828 ) ( not ( = ?auto_4831 ?auto_4828 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4826 ?auto_4825 )
      ( GET-2IMAGE-VERIFY ?auto_4823 ?auto_4824 ?auto_4826 ?auto_4825 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4832 - DIRECTION
      ?auto_4833 - MODE
      ?auto_4835 - DIRECTION
      ?auto_4834 - MODE
    )
    :vars
    (
      ?auto_4836 - INSTRUMENT
      ?auto_4839 - SATELLITE
      ?auto_4840 - DIRECTION
      ?auto_4838 - DIRECTION
      ?auto_4837 - MODE
      ?auto_4841 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4836 ?auto_4839 ) ( SUPPORTS ?auto_4836 ?auto_4834 ) ( not ( = ?auto_4835 ?auto_4840 ) ) ( HAVE_IMAGE ?auto_4838 ?auto_4837 ) ( not ( = ?auto_4838 ?auto_4835 ) ) ( not ( = ?auto_4838 ?auto_4840 ) ) ( not ( = ?auto_4837 ?auto_4834 ) ) ( CALIBRATION_TARGET ?auto_4836 ?auto_4840 ) ( POINTING ?auto_4839 ?auto_4832 ) ( not ( = ?auto_4840 ?auto_4832 ) ) ( not ( = ?auto_4835 ?auto_4832 ) ) ( not ( = ?auto_4838 ?auto_4832 ) ) ( ON_BOARD ?auto_4841 ?auto_4839 ) ( POWER_ON ?auto_4841 ) ( not ( = ?auto_4836 ?auto_4841 ) ) ( HAVE_IMAGE ?auto_4832 ?auto_4833 ) ( not ( = ?auto_4833 ?auto_4834 ) ) ( not ( = ?auto_4833 ?auto_4837 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4838 ?auto_4837 ?auto_4835 ?auto_4834 )
      ( GET-2IMAGE-VERIFY ?auto_4832 ?auto_4833 ?auto_4835 ?auto_4834 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4842 - DIRECTION
      ?auto_4843 - MODE
      ?auto_4845 - DIRECTION
      ?auto_4844 - MODE
    )
    :vars
    (
      ?auto_4846 - INSTRUMENT
      ?auto_4847 - SATELLITE
      ?auto_4848 - DIRECTION
      ?auto_4850 - DIRECTION
      ?auto_4849 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4846 ?auto_4847 ) ( SUPPORTS ?auto_4846 ?auto_4843 ) ( not ( = ?auto_4842 ?auto_4848 ) ) ( HAVE_IMAGE ?auto_4845 ?auto_4844 ) ( not ( = ?auto_4845 ?auto_4842 ) ) ( not ( = ?auto_4845 ?auto_4848 ) ) ( not ( = ?auto_4844 ?auto_4843 ) ) ( CALIBRATION_TARGET ?auto_4846 ?auto_4848 ) ( POINTING ?auto_4847 ?auto_4850 ) ( not ( = ?auto_4848 ?auto_4850 ) ) ( not ( = ?auto_4842 ?auto_4850 ) ) ( not ( = ?auto_4845 ?auto_4850 ) ) ( ON_BOARD ?auto_4849 ?auto_4847 ) ( POWER_ON ?auto_4849 ) ( not ( = ?auto_4846 ?auto_4849 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4845 ?auto_4844 ?auto_4842 ?auto_4843 )
      ( GET-2IMAGE-VERIFY ?auto_4842 ?auto_4843 ?auto_4845 ?auto_4844 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4851 - DIRECTION
      ?auto_4852 - MODE
      ?auto_4854 - DIRECTION
      ?auto_4853 - MODE
    )
    :vars
    (
      ?auto_4855 - INSTRUMENT
      ?auto_4858 - SATELLITE
      ?auto_4859 - DIRECTION
      ?auto_4857 - DIRECTION
      ?auto_4856 - MODE
      ?auto_4860 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4855 ?auto_4858 ) ( SUPPORTS ?auto_4855 ?auto_4852 ) ( not ( = ?auto_4851 ?auto_4859 ) ) ( HAVE_IMAGE ?auto_4857 ?auto_4856 ) ( not ( = ?auto_4857 ?auto_4851 ) ) ( not ( = ?auto_4857 ?auto_4859 ) ) ( not ( = ?auto_4856 ?auto_4852 ) ) ( CALIBRATION_TARGET ?auto_4855 ?auto_4859 ) ( POINTING ?auto_4858 ?auto_4854 ) ( not ( = ?auto_4859 ?auto_4854 ) ) ( not ( = ?auto_4851 ?auto_4854 ) ) ( not ( = ?auto_4857 ?auto_4854 ) ) ( ON_BOARD ?auto_4860 ?auto_4858 ) ( POWER_ON ?auto_4860 ) ( not ( = ?auto_4855 ?auto_4860 ) ) ( HAVE_IMAGE ?auto_4854 ?auto_4853 ) ( not ( = ?auto_4852 ?auto_4853 ) ) ( not ( = ?auto_4853 ?auto_4856 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4857 ?auto_4856 ?auto_4851 ?auto_4852 )
      ( GET-2IMAGE-VERIFY ?auto_4851 ?auto_4852 ?auto_4854 ?auto_4853 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4872 - DIRECTION
      ?auto_4873 - MODE
      ?auto_4875 - DIRECTION
      ?auto_4874 - MODE
      ?auto_4877 - DIRECTION
      ?auto_4876 - MODE
    )
    :vars
    (
      ?auto_4878 - INSTRUMENT
      ?auto_4879 - SATELLITE
      ?auto_4880 - DIRECTION
      ?auto_4882 - DIRECTION
      ?auto_4881 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4878 ?auto_4879 ) ( SUPPORTS ?auto_4878 ?auto_4876 ) ( not ( = ?auto_4877 ?auto_4880 ) ) ( HAVE_IMAGE ?auto_4872 ?auto_4874 ) ( not ( = ?auto_4872 ?auto_4877 ) ) ( not ( = ?auto_4872 ?auto_4880 ) ) ( not ( = ?auto_4874 ?auto_4876 ) ) ( CALIBRATION_TARGET ?auto_4878 ?auto_4880 ) ( POINTING ?auto_4879 ?auto_4882 ) ( not ( = ?auto_4880 ?auto_4882 ) ) ( not ( = ?auto_4877 ?auto_4882 ) ) ( not ( = ?auto_4872 ?auto_4882 ) ) ( ON_BOARD ?auto_4881 ?auto_4879 ) ( POWER_ON ?auto_4881 ) ( not ( = ?auto_4878 ?auto_4881 ) ) ( HAVE_IMAGE ?auto_4872 ?auto_4873 ) ( HAVE_IMAGE ?auto_4875 ?auto_4874 ) ( not ( = ?auto_4872 ?auto_4875 ) ) ( not ( = ?auto_4873 ?auto_4874 ) ) ( not ( = ?auto_4873 ?auto_4876 ) ) ( not ( = ?auto_4875 ?auto_4877 ) ) ( not ( = ?auto_4875 ?auto_4880 ) ) ( not ( = ?auto_4875 ?auto_4882 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4872 ?auto_4874 ?auto_4877 ?auto_4876 )
      ( GET-3IMAGE-VERIFY ?auto_4872 ?auto_4873 ?auto_4875 ?auto_4874 ?auto_4877 ?auto_4876 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4883 - DIRECTION
      ?auto_4884 - MODE
      ?auto_4886 - DIRECTION
      ?auto_4885 - MODE
      ?auto_4888 - DIRECTION
      ?auto_4887 - MODE
    )
    :vars
    (
      ?auto_4889 - INSTRUMENT
      ?auto_4890 - SATELLITE
      ?auto_4891 - DIRECTION
      ?auto_4892 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4889 ?auto_4890 ) ( SUPPORTS ?auto_4889 ?auto_4887 ) ( not ( = ?auto_4888 ?auto_4891 ) ) ( HAVE_IMAGE ?auto_4883 ?auto_4884 ) ( not ( = ?auto_4883 ?auto_4888 ) ) ( not ( = ?auto_4883 ?auto_4891 ) ) ( not ( = ?auto_4884 ?auto_4887 ) ) ( CALIBRATION_TARGET ?auto_4889 ?auto_4891 ) ( POINTING ?auto_4890 ?auto_4886 ) ( not ( = ?auto_4891 ?auto_4886 ) ) ( not ( = ?auto_4888 ?auto_4886 ) ) ( not ( = ?auto_4883 ?auto_4886 ) ) ( ON_BOARD ?auto_4892 ?auto_4890 ) ( POWER_ON ?auto_4892 ) ( not ( = ?auto_4889 ?auto_4892 ) ) ( HAVE_IMAGE ?auto_4886 ?auto_4885 ) ( not ( = ?auto_4884 ?auto_4885 ) ) ( not ( = ?auto_4885 ?auto_4887 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4883 ?auto_4884 ?auto_4888 ?auto_4887 )
      ( GET-3IMAGE-VERIFY ?auto_4883 ?auto_4884 ?auto_4886 ?auto_4885 ?auto_4888 ?auto_4887 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4893 - DIRECTION
      ?auto_4894 - MODE
      ?auto_4896 - DIRECTION
      ?auto_4895 - MODE
      ?auto_4898 - DIRECTION
      ?auto_4897 - MODE
    )
    :vars
    (
      ?auto_4899 - INSTRUMENT
      ?auto_4900 - SATELLITE
      ?auto_4901 - DIRECTION
      ?auto_4903 - DIRECTION
      ?auto_4902 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4899 ?auto_4900 ) ( SUPPORTS ?auto_4899 ?auto_4895 ) ( not ( = ?auto_4896 ?auto_4901 ) ) ( HAVE_IMAGE ?auto_4898 ?auto_4897 ) ( not ( = ?auto_4898 ?auto_4896 ) ) ( not ( = ?auto_4898 ?auto_4901 ) ) ( not ( = ?auto_4897 ?auto_4895 ) ) ( CALIBRATION_TARGET ?auto_4899 ?auto_4901 ) ( POINTING ?auto_4900 ?auto_4903 ) ( not ( = ?auto_4901 ?auto_4903 ) ) ( not ( = ?auto_4896 ?auto_4903 ) ) ( not ( = ?auto_4898 ?auto_4903 ) ) ( ON_BOARD ?auto_4902 ?auto_4900 ) ( POWER_ON ?auto_4902 ) ( not ( = ?auto_4899 ?auto_4902 ) ) ( HAVE_IMAGE ?auto_4893 ?auto_4894 ) ( not ( = ?auto_4893 ?auto_4896 ) ) ( not ( = ?auto_4893 ?auto_4898 ) ) ( not ( = ?auto_4893 ?auto_4901 ) ) ( not ( = ?auto_4893 ?auto_4903 ) ) ( not ( = ?auto_4894 ?auto_4895 ) ) ( not ( = ?auto_4894 ?auto_4897 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4898 ?auto_4897 ?auto_4896 ?auto_4895 )
      ( GET-3IMAGE-VERIFY ?auto_4893 ?auto_4894 ?auto_4896 ?auto_4895 ?auto_4898 ?auto_4897 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4904 - DIRECTION
      ?auto_4905 - MODE
      ?auto_4907 - DIRECTION
      ?auto_4906 - MODE
      ?auto_4909 - DIRECTION
      ?auto_4908 - MODE
    )
    :vars
    (
      ?auto_4910 - INSTRUMENT
      ?auto_4911 - SATELLITE
      ?auto_4912 - DIRECTION
      ?auto_4913 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4910 ?auto_4911 ) ( SUPPORTS ?auto_4910 ?auto_4906 ) ( not ( = ?auto_4907 ?auto_4912 ) ) ( HAVE_IMAGE ?auto_4904 ?auto_4905 ) ( not ( = ?auto_4904 ?auto_4907 ) ) ( not ( = ?auto_4904 ?auto_4912 ) ) ( not ( = ?auto_4905 ?auto_4906 ) ) ( CALIBRATION_TARGET ?auto_4910 ?auto_4912 ) ( POINTING ?auto_4911 ?auto_4909 ) ( not ( = ?auto_4912 ?auto_4909 ) ) ( not ( = ?auto_4907 ?auto_4909 ) ) ( not ( = ?auto_4904 ?auto_4909 ) ) ( ON_BOARD ?auto_4913 ?auto_4911 ) ( POWER_ON ?auto_4913 ) ( not ( = ?auto_4910 ?auto_4913 ) ) ( HAVE_IMAGE ?auto_4909 ?auto_4908 ) ( not ( = ?auto_4905 ?auto_4908 ) ) ( not ( = ?auto_4906 ?auto_4908 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4904 ?auto_4905 ?auto_4907 ?auto_4906 )
      ( GET-3IMAGE-VERIFY ?auto_4904 ?auto_4905 ?auto_4907 ?auto_4906 ?auto_4909 ?auto_4908 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4925 - DIRECTION
      ?auto_4926 - MODE
      ?auto_4928 - DIRECTION
      ?auto_4927 - MODE
      ?auto_4930 - DIRECTION
      ?auto_4929 - MODE
    )
    :vars
    (
      ?auto_4931 - INSTRUMENT
      ?auto_4932 - SATELLITE
      ?auto_4933 - DIRECTION
      ?auto_4934 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4931 ?auto_4932 ) ( SUPPORTS ?auto_4931 ?auto_4929 ) ( not ( = ?auto_4930 ?auto_4933 ) ) ( HAVE_IMAGE ?auto_4928 ?auto_4927 ) ( not ( = ?auto_4928 ?auto_4930 ) ) ( not ( = ?auto_4928 ?auto_4933 ) ) ( not ( = ?auto_4927 ?auto_4929 ) ) ( CALIBRATION_TARGET ?auto_4931 ?auto_4933 ) ( POINTING ?auto_4932 ?auto_4925 ) ( not ( = ?auto_4933 ?auto_4925 ) ) ( not ( = ?auto_4930 ?auto_4925 ) ) ( not ( = ?auto_4928 ?auto_4925 ) ) ( ON_BOARD ?auto_4934 ?auto_4932 ) ( POWER_ON ?auto_4934 ) ( not ( = ?auto_4931 ?auto_4934 ) ) ( HAVE_IMAGE ?auto_4925 ?auto_4926 ) ( not ( = ?auto_4926 ?auto_4927 ) ) ( not ( = ?auto_4926 ?auto_4929 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4928 ?auto_4927 ?auto_4930 ?auto_4929 )
      ( GET-3IMAGE-VERIFY ?auto_4925 ?auto_4926 ?auto_4928 ?auto_4927 ?auto_4930 ?auto_4929 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4935 - DIRECTION
      ?auto_4936 - MODE
      ?auto_4938 - DIRECTION
      ?auto_4937 - MODE
      ?auto_4940 - DIRECTION
      ?auto_4939 - MODE
    )
    :vars
    (
      ?auto_4941 - INSTRUMENT
      ?auto_4944 - SATELLITE
      ?auto_4945 - DIRECTION
      ?auto_4943 - DIRECTION
      ?auto_4942 - MODE
      ?auto_4946 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4941 ?auto_4944 ) ( SUPPORTS ?auto_4941 ?auto_4939 ) ( not ( = ?auto_4940 ?auto_4945 ) ) ( HAVE_IMAGE ?auto_4943 ?auto_4942 ) ( not ( = ?auto_4943 ?auto_4940 ) ) ( not ( = ?auto_4943 ?auto_4945 ) ) ( not ( = ?auto_4942 ?auto_4939 ) ) ( CALIBRATION_TARGET ?auto_4941 ?auto_4945 ) ( POINTING ?auto_4944 ?auto_4938 ) ( not ( = ?auto_4945 ?auto_4938 ) ) ( not ( = ?auto_4940 ?auto_4938 ) ) ( not ( = ?auto_4943 ?auto_4938 ) ) ( ON_BOARD ?auto_4946 ?auto_4944 ) ( POWER_ON ?auto_4946 ) ( not ( = ?auto_4941 ?auto_4946 ) ) ( HAVE_IMAGE ?auto_4935 ?auto_4936 ) ( HAVE_IMAGE ?auto_4938 ?auto_4937 ) ( not ( = ?auto_4935 ?auto_4938 ) ) ( not ( = ?auto_4935 ?auto_4940 ) ) ( not ( = ?auto_4935 ?auto_4945 ) ) ( not ( = ?auto_4935 ?auto_4943 ) ) ( not ( = ?auto_4936 ?auto_4937 ) ) ( not ( = ?auto_4936 ?auto_4939 ) ) ( not ( = ?auto_4936 ?auto_4942 ) ) ( not ( = ?auto_4937 ?auto_4939 ) ) ( not ( = ?auto_4937 ?auto_4942 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4943 ?auto_4942 ?auto_4940 ?auto_4939 )
      ( GET-3IMAGE-VERIFY ?auto_4935 ?auto_4936 ?auto_4938 ?auto_4937 ?auto_4940 ?auto_4939 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4947 - DIRECTION
      ?auto_4948 - MODE
      ?auto_4950 - DIRECTION
      ?auto_4949 - MODE
      ?auto_4952 - DIRECTION
      ?auto_4951 - MODE
    )
    :vars
    (
      ?auto_4953 - INSTRUMENT
      ?auto_4954 - SATELLITE
      ?auto_4955 - DIRECTION
      ?auto_4956 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4953 ?auto_4954 ) ( SUPPORTS ?auto_4953 ?auto_4949 ) ( not ( = ?auto_4950 ?auto_4955 ) ) ( HAVE_IMAGE ?auto_4952 ?auto_4951 ) ( not ( = ?auto_4952 ?auto_4950 ) ) ( not ( = ?auto_4952 ?auto_4955 ) ) ( not ( = ?auto_4951 ?auto_4949 ) ) ( CALIBRATION_TARGET ?auto_4953 ?auto_4955 ) ( POINTING ?auto_4954 ?auto_4947 ) ( not ( = ?auto_4955 ?auto_4947 ) ) ( not ( = ?auto_4950 ?auto_4947 ) ) ( not ( = ?auto_4952 ?auto_4947 ) ) ( ON_BOARD ?auto_4956 ?auto_4954 ) ( POWER_ON ?auto_4956 ) ( not ( = ?auto_4953 ?auto_4956 ) ) ( HAVE_IMAGE ?auto_4947 ?auto_4948 ) ( not ( = ?auto_4948 ?auto_4949 ) ) ( not ( = ?auto_4948 ?auto_4951 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4952 ?auto_4951 ?auto_4950 ?auto_4949 )
      ( GET-3IMAGE-VERIFY ?auto_4947 ?auto_4948 ?auto_4950 ?auto_4949 ?auto_4952 ?auto_4951 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4957 - DIRECTION
      ?auto_4958 - MODE
      ?auto_4960 - DIRECTION
      ?auto_4959 - MODE
      ?auto_4962 - DIRECTION
      ?auto_4961 - MODE
    )
    :vars
    (
      ?auto_4963 - INSTRUMENT
      ?auto_4966 - SATELLITE
      ?auto_4967 - DIRECTION
      ?auto_4965 - DIRECTION
      ?auto_4964 - MODE
      ?auto_4968 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4963 ?auto_4966 ) ( SUPPORTS ?auto_4963 ?auto_4959 ) ( not ( = ?auto_4960 ?auto_4967 ) ) ( HAVE_IMAGE ?auto_4965 ?auto_4964 ) ( not ( = ?auto_4965 ?auto_4960 ) ) ( not ( = ?auto_4965 ?auto_4967 ) ) ( not ( = ?auto_4964 ?auto_4959 ) ) ( CALIBRATION_TARGET ?auto_4963 ?auto_4967 ) ( POINTING ?auto_4966 ?auto_4962 ) ( not ( = ?auto_4967 ?auto_4962 ) ) ( not ( = ?auto_4960 ?auto_4962 ) ) ( not ( = ?auto_4965 ?auto_4962 ) ) ( ON_BOARD ?auto_4968 ?auto_4966 ) ( POWER_ON ?auto_4968 ) ( not ( = ?auto_4963 ?auto_4968 ) ) ( HAVE_IMAGE ?auto_4957 ?auto_4958 ) ( HAVE_IMAGE ?auto_4962 ?auto_4961 ) ( not ( = ?auto_4957 ?auto_4960 ) ) ( not ( = ?auto_4957 ?auto_4962 ) ) ( not ( = ?auto_4957 ?auto_4967 ) ) ( not ( = ?auto_4957 ?auto_4965 ) ) ( not ( = ?auto_4958 ?auto_4959 ) ) ( not ( = ?auto_4958 ?auto_4961 ) ) ( not ( = ?auto_4958 ?auto_4964 ) ) ( not ( = ?auto_4959 ?auto_4961 ) ) ( not ( = ?auto_4961 ?auto_4964 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4965 ?auto_4964 ?auto_4960 ?auto_4959 )
      ( GET-3IMAGE-VERIFY ?auto_4957 ?auto_4958 ?auto_4960 ?auto_4959 ?auto_4962 ?auto_4961 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4981 - DIRECTION
      ?auto_4982 - MODE
      ?auto_4984 - DIRECTION
      ?auto_4983 - MODE
      ?auto_4986 - DIRECTION
      ?auto_4985 - MODE
    )
    :vars
    (
      ?auto_4987 - INSTRUMENT
      ?auto_4988 - SATELLITE
      ?auto_4989 - DIRECTION
      ?auto_4991 - DIRECTION
      ?auto_4990 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4987 ?auto_4988 ) ( SUPPORTS ?auto_4987 ?auto_4982 ) ( not ( = ?auto_4981 ?auto_4989 ) ) ( HAVE_IMAGE ?auto_4984 ?auto_4985 ) ( not ( = ?auto_4984 ?auto_4981 ) ) ( not ( = ?auto_4984 ?auto_4989 ) ) ( not ( = ?auto_4985 ?auto_4982 ) ) ( CALIBRATION_TARGET ?auto_4987 ?auto_4989 ) ( POINTING ?auto_4988 ?auto_4991 ) ( not ( = ?auto_4989 ?auto_4991 ) ) ( not ( = ?auto_4981 ?auto_4991 ) ) ( not ( = ?auto_4984 ?auto_4991 ) ) ( ON_BOARD ?auto_4990 ?auto_4988 ) ( POWER_ON ?auto_4990 ) ( not ( = ?auto_4987 ?auto_4990 ) ) ( HAVE_IMAGE ?auto_4984 ?auto_4983 ) ( HAVE_IMAGE ?auto_4986 ?auto_4985 ) ( not ( = ?auto_4981 ?auto_4986 ) ) ( not ( = ?auto_4982 ?auto_4983 ) ) ( not ( = ?auto_4984 ?auto_4986 ) ) ( not ( = ?auto_4983 ?auto_4985 ) ) ( not ( = ?auto_4986 ?auto_4989 ) ) ( not ( = ?auto_4986 ?auto_4991 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4984 ?auto_4985 ?auto_4981 ?auto_4982 )
      ( GET-3IMAGE-VERIFY ?auto_4981 ?auto_4982 ?auto_4984 ?auto_4983 ?auto_4986 ?auto_4985 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4992 - DIRECTION
      ?auto_4993 - MODE
      ?auto_4995 - DIRECTION
      ?auto_4994 - MODE
      ?auto_4997 - DIRECTION
      ?auto_4996 - MODE
    )
    :vars
    (
      ?auto_4998 - INSTRUMENT
      ?auto_4999 - SATELLITE
      ?auto_5000 - DIRECTION
      ?auto_5001 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_4998 ?auto_4999 ) ( SUPPORTS ?auto_4998 ?auto_4993 ) ( not ( = ?auto_4992 ?auto_5000 ) ) ( HAVE_IMAGE ?auto_4995 ?auto_4994 ) ( not ( = ?auto_4995 ?auto_4992 ) ) ( not ( = ?auto_4995 ?auto_5000 ) ) ( not ( = ?auto_4994 ?auto_4993 ) ) ( CALIBRATION_TARGET ?auto_4998 ?auto_5000 ) ( POINTING ?auto_4999 ?auto_4997 ) ( not ( = ?auto_5000 ?auto_4997 ) ) ( not ( = ?auto_4992 ?auto_4997 ) ) ( not ( = ?auto_4995 ?auto_4997 ) ) ( ON_BOARD ?auto_5001 ?auto_4999 ) ( POWER_ON ?auto_5001 ) ( not ( = ?auto_4998 ?auto_5001 ) ) ( HAVE_IMAGE ?auto_4997 ?auto_4996 ) ( not ( = ?auto_4993 ?auto_4996 ) ) ( not ( = ?auto_4994 ?auto_4996 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4995 ?auto_4994 ?auto_4992 ?auto_4993 )
      ( GET-3IMAGE-VERIFY ?auto_4992 ?auto_4993 ?auto_4995 ?auto_4994 ?auto_4997 ?auto_4996 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5013 - DIRECTION
      ?auto_5014 - MODE
      ?auto_5016 - DIRECTION
      ?auto_5015 - MODE
      ?auto_5018 - DIRECTION
      ?auto_5017 - MODE
    )
    :vars
    (
      ?auto_5019 - INSTRUMENT
      ?auto_5020 - SATELLITE
      ?auto_5021 - DIRECTION
      ?auto_5022 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5019 ?auto_5020 ) ( SUPPORTS ?auto_5019 ?auto_5014 ) ( not ( = ?auto_5013 ?auto_5021 ) ) ( HAVE_IMAGE ?auto_5018 ?auto_5017 ) ( not ( = ?auto_5018 ?auto_5013 ) ) ( not ( = ?auto_5018 ?auto_5021 ) ) ( not ( = ?auto_5017 ?auto_5014 ) ) ( CALIBRATION_TARGET ?auto_5019 ?auto_5021 ) ( POINTING ?auto_5020 ?auto_5016 ) ( not ( = ?auto_5021 ?auto_5016 ) ) ( not ( = ?auto_5013 ?auto_5016 ) ) ( not ( = ?auto_5018 ?auto_5016 ) ) ( ON_BOARD ?auto_5022 ?auto_5020 ) ( POWER_ON ?auto_5022 ) ( not ( = ?auto_5019 ?auto_5022 ) ) ( HAVE_IMAGE ?auto_5016 ?auto_5015 ) ( not ( = ?auto_5014 ?auto_5015 ) ) ( not ( = ?auto_5015 ?auto_5017 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5018 ?auto_5017 ?auto_5013 ?auto_5014 )
      ( GET-3IMAGE-VERIFY ?auto_5013 ?auto_5014 ?auto_5016 ?auto_5015 ?auto_5018 ?auto_5017 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5023 - DIRECTION
      ?auto_5024 - MODE
      ?auto_5026 - DIRECTION
      ?auto_5025 - MODE
      ?auto_5028 - DIRECTION
      ?auto_5027 - MODE
    )
    :vars
    (
      ?auto_5029 - INSTRUMENT
      ?auto_5032 - SATELLITE
      ?auto_5033 - DIRECTION
      ?auto_5031 - DIRECTION
      ?auto_5030 - MODE
      ?auto_5034 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5029 ?auto_5032 ) ( SUPPORTS ?auto_5029 ?auto_5024 ) ( not ( = ?auto_5023 ?auto_5033 ) ) ( HAVE_IMAGE ?auto_5031 ?auto_5030 ) ( not ( = ?auto_5031 ?auto_5023 ) ) ( not ( = ?auto_5031 ?auto_5033 ) ) ( not ( = ?auto_5030 ?auto_5024 ) ) ( CALIBRATION_TARGET ?auto_5029 ?auto_5033 ) ( POINTING ?auto_5032 ?auto_5028 ) ( not ( = ?auto_5033 ?auto_5028 ) ) ( not ( = ?auto_5023 ?auto_5028 ) ) ( not ( = ?auto_5031 ?auto_5028 ) ) ( ON_BOARD ?auto_5034 ?auto_5032 ) ( POWER_ON ?auto_5034 ) ( not ( = ?auto_5029 ?auto_5034 ) ) ( HAVE_IMAGE ?auto_5026 ?auto_5025 ) ( HAVE_IMAGE ?auto_5028 ?auto_5027 ) ( not ( = ?auto_5023 ?auto_5026 ) ) ( not ( = ?auto_5024 ?auto_5025 ) ) ( not ( = ?auto_5024 ?auto_5027 ) ) ( not ( = ?auto_5026 ?auto_5028 ) ) ( not ( = ?auto_5026 ?auto_5033 ) ) ( not ( = ?auto_5026 ?auto_5031 ) ) ( not ( = ?auto_5025 ?auto_5027 ) ) ( not ( = ?auto_5025 ?auto_5030 ) ) ( not ( = ?auto_5027 ?auto_5030 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5031 ?auto_5030 ?auto_5023 ?auto_5024 )
      ( GET-3IMAGE-VERIFY ?auto_5023 ?auto_5024 ?auto_5026 ?auto_5025 ?auto_5028 ?auto_5027 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_5083 - DIRECTION
      ?auto_5084 - MODE
    )
    :vars
    (
      ?auto_5085 - INSTRUMENT
      ?auto_5088 - SATELLITE
      ?auto_5089 - DIRECTION
      ?auto_5087 - DIRECTION
      ?auto_5086 - MODE
      ?auto_5091 - DIRECTION
      ?auto_5090 - INSTRUMENT
      ?auto_5092 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_5085 ?auto_5088 ) ( SUPPORTS ?auto_5085 ?auto_5084 ) ( not ( = ?auto_5083 ?auto_5089 ) ) ( HAVE_IMAGE ?auto_5087 ?auto_5086 ) ( not ( = ?auto_5087 ?auto_5083 ) ) ( not ( = ?auto_5087 ?auto_5089 ) ) ( not ( = ?auto_5086 ?auto_5084 ) ) ( CALIBRATION_TARGET ?auto_5085 ?auto_5089 ) ( POINTING ?auto_5088 ?auto_5091 ) ( not ( = ?auto_5089 ?auto_5091 ) ) ( not ( = ?auto_5083 ?auto_5091 ) ) ( not ( = ?auto_5087 ?auto_5091 ) ) ( ON_BOARD ?auto_5090 ?auto_5088 ) ( POWER_ON ?auto_5090 ) ( not ( = ?auto_5085 ?auto_5090 ) ) ( CALIBRATED ?auto_5090 ) ( SUPPORTS ?auto_5090 ?auto_5092 ) ( not ( = ?auto_5086 ?auto_5092 ) ) ( not ( = ?auto_5084 ?auto_5092 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5087 ?auto_5086 ?auto_5091 ?auto_5092 )
      ( GET-2IMAGE ?auto_5087 ?auto_5086 ?auto_5083 ?auto_5084 )
      ( GET-1IMAGE-VERIFY ?auto_5083 ?auto_5084 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_5093 - DIRECTION
      ?auto_5094 - MODE
      ?auto_5096 - DIRECTION
      ?auto_5095 - MODE
    )
    :vars
    (
      ?auto_5099 - INSTRUMENT
      ?auto_5101 - SATELLITE
      ?auto_5100 - DIRECTION
      ?auto_5097 - DIRECTION
      ?auto_5098 - INSTRUMENT
      ?auto_5102 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_5099 ?auto_5101 ) ( SUPPORTS ?auto_5099 ?auto_5095 ) ( not ( = ?auto_5096 ?auto_5100 ) ) ( HAVE_IMAGE ?auto_5093 ?auto_5094 ) ( not ( = ?auto_5093 ?auto_5096 ) ) ( not ( = ?auto_5093 ?auto_5100 ) ) ( not ( = ?auto_5094 ?auto_5095 ) ) ( CALIBRATION_TARGET ?auto_5099 ?auto_5100 ) ( POINTING ?auto_5101 ?auto_5097 ) ( not ( = ?auto_5100 ?auto_5097 ) ) ( not ( = ?auto_5096 ?auto_5097 ) ) ( not ( = ?auto_5093 ?auto_5097 ) ) ( ON_BOARD ?auto_5098 ?auto_5101 ) ( POWER_ON ?auto_5098 ) ( not ( = ?auto_5099 ?auto_5098 ) ) ( CALIBRATED ?auto_5098 ) ( SUPPORTS ?auto_5098 ?auto_5102 ) ( not ( = ?auto_5094 ?auto_5102 ) ) ( not ( = ?auto_5095 ?auto_5102 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_5096 ?auto_5095 )
      ( GET-2IMAGE-VERIFY ?auto_5093 ?auto_5094 ?auto_5096 ?auto_5095 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_5103 - DIRECTION
      ?auto_5104 - MODE
      ?auto_5106 - DIRECTION
      ?auto_5105 - MODE
    )
    :vars
    (
      ?auto_5107 - INSTRUMENT
      ?auto_5108 - SATELLITE
      ?auto_5109 - DIRECTION
      ?auto_5112 - DIRECTION
      ?auto_5111 - MODE
      ?auto_5110 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5107 ?auto_5108 ) ( SUPPORTS ?auto_5107 ?auto_5105 ) ( not ( = ?auto_5106 ?auto_5109 ) ) ( HAVE_IMAGE ?auto_5112 ?auto_5111 ) ( not ( = ?auto_5112 ?auto_5106 ) ) ( not ( = ?auto_5112 ?auto_5109 ) ) ( not ( = ?auto_5111 ?auto_5105 ) ) ( CALIBRATION_TARGET ?auto_5107 ?auto_5109 ) ( POINTING ?auto_5108 ?auto_5103 ) ( not ( = ?auto_5109 ?auto_5103 ) ) ( not ( = ?auto_5106 ?auto_5103 ) ) ( not ( = ?auto_5112 ?auto_5103 ) ) ( ON_BOARD ?auto_5110 ?auto_5108 ) ( POWER_ON ?auto_5110 ) ( not ( = ?auto_5107 ?auto_5110 ) ) ( CALIBRATED ?auto_5110 ) ( SUPPORTS ?auto_5110 ?auto_5104 ) ( not ( = ?auto_5111 ?auto_5104 ) ) ( not ( = ?auto_5105 ?auto_5104 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5112 ?auto_5111 ?auto_5106 ?auto_5105 )
      ( GET-2IMAGE-VERIFY ?auto_5103 ?auto_5104 ?auto_5106 ?auto_5105 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_5113 - DIRECTION
      ?auto_5114 - MODE
      ?auto_5116 - DIRECTION
      ?auto_5115 - MODE
    )
    :vars
    (
      ?auto_5117 - INSTRUMENT
      ?auto_5118 - SATELLITE
      ?auto_5120 - DIRECTION
      ?auto_5122 - DIRECTION
      ?auto_5121 - INSTRUMENT
      ?auto_5119 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_5117 ?auto_5118 ) ( SUPPORTS ?auto_5117 ?auto_5114 ) ( not ( = ?auto_5113 ?auto_5120 ) ) ( HAVE_IMAGE ?auto_5116 ?auto_5115 ) ( not ( = ?auto_5116 ?auto_5113 ) ) ( not ( = ?auto_5116 ?auto_5120 ) ) ( not ( = ?auto_5115 ?auto_5114 ) ) ( CALIBRATION_TARGET ?auto_5117 ?auto_5120 ) ( POINTING ?auto_5118 ?auto_5122 ) ( not ( = ?auto_5120 ?auto_5122 ) ) ( not ( = ?auto_5113 ?auto_5122 ) ) ( not ( = ?auto_5116 ?auto_5122 ) ) ( ON_BOARD ?auto_5121 ?auto_5118 ) ( POWER_ON ?auto_5121 ) ( not ( = ?auto_5117 ?auto_5121 ) ) ( CALIBRATED ?auto_5121 ) ( SUPPORTS ?auto_5121 ?auto_5119 ) ( not ( = ?auto_5115 ?auto_5119 ) ) ( not ( = ?auto_5114 ?auto_5119 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5116 ?auto_5115 ?auto_5113 ?auto_5114 )
      ( GET-2IMAGE-VERIFY ?auto_5113 ?auto_5114 ?auto_5116 ?auto_5115 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_5123 - DIRECTION
      ?auto_5124 - MODE
      ?auto_5126 - DIRECTION
      ?auto_5125 - MODE
    )
    :vars
    (
      ?auto_5127 - INSTRUMENT
      ?auto_5128 - SATELLITE
      ?auto_5129 - DIRECTION
      ?auto_5132 - DIRECTION
      ?auto_5131 - MODE
      ?auto_5130 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5127 ?auto_5128 ) ( SUPPORTS ?auto_5127 ?auto_5124 ) ( not ( = ?auto_5123 ?auto_5129 ) ) ( HAVE_IMAGE ?auto_5132 ?auto_5131 ) ( not ( = ?auto_5132 ?auto_5123 ) ) ( not ( = ?auto_5132 ?auto_5129 ) ) ( not ( = ?auto_5131 ?auto_5124 ) ) ( CALIBRATION_TARGET ?auto_5127 ?auto_5129 ) ( POINTING ?auto_5128 ?auto_5126 ) ( not ( = ?auto_5129 ?auto_5126 ) ) ( not ( = ?auto_5123 ?auto_5126 ) ) ( not ( = ?auto_5132 ?auto_5126 ) ) ( ON_BOARD ?auto_5130 ?auto_5128 ) ( POWER_ON ?auto_5130 ) ( not ( = ?auto_5127 ?auto_5130 ) ) ( CALIBRATED ?auto_5130 ) ( SUPPORTS ?auto_5130 ?auto_5125 ) ( not ( = ?auto_5131 ?auto_5125 ) ) ( not ( = ?auto_5124 ?auto_5125 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5132 ?auto_5131 ?auto_5123 ?auto_5124 )
      ( GET-2IMAGE-VERIFY ?auto_5123 ?auto_5124 ?auto_5126 ?auto_5125 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5145 - DIRECTION
      ?auto_5146 - MODE
      ?auto_5148 - DIRECTION
      ?auto_5147 - MODE
      ?auto_5150 - DIRECTION
      ?auto_5149 - MODE
    )
    :vars
    (
      ?auto_5151 - INSTRUMENT
      ?auto_5152 - SATELLITE
      ?auto_5154 - DIRECTION
      ?auto_5156 - DIRECTION
      ?auto_5155 - INSTRUMENT
      ?auto_5153 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_5151 ?auto_5152 ) ( SUPPORTS ?auto_5151 ?auto_5149 ) ( not ( = ?auto_5150 ?auto_5154 ) ) ( HAVE_IMAGE ?auto_5148 ?auto_5147 ) ( not ( = ?auto_5148 ?auto_5150 ) ) ( not ( = ?auto_5148 ?auto_5154 ) ) ( not ( = ?auto_5147 ?auto_5149 ) ) ( CALIBRATION_TARGET ?auto_5151 ?auto_5154 ) ( POINTING ?auto_5152 ?auto_5156 ) ( not ( = ?auto_5154 ?auto_5156 ) ) ( not ( = ?auto_5150 ?auto_5156 ) ) ( not ( = ?auto_5148 ?auto_5156 ) ) ( ON_BOARD ?auto_5155 ?auto_5152 ) ( POWER_ON ?auto_5155 ) ( not ( = ?auto_5151 ?auto_5155 ) ) ( CALIBRATED ?auto_5155 ) ( SUPPORTS ?auto_5155 ?auto_5153 ) ( not ( = ?auto_5147 ?auto_5153 ) ) ( not ( = ?auto_5149 ?auto_5153 ) ) ( HAVE_IMAGE ?auto_5145 ?auto_5146 ) ( not ( = ?auto_5145 ?auto_5148 ) ) ( not ( = ?auto_5145 ?auto_5150 ) ) ( not ( = ?auto_5145 ?auto_5154 ) ) ( not ( = ?auto_5145 ?auto_5156 ) ) ( not ( = ?auto_5146 ?auto_5147 ) ) ( not ( = ?auto_5146 ?auto_5149 ) ) ( not ( = ?auto_5146 ?auto_5153 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5148 ?auto_5147 ?auto_5150 ?auto_5149 )
      ( GET-3IMAGE-VERIFY ?auto_5145 ?auto_5146 ?auto_5148 ?auto_5147 ?auto_5150 ?auto_5149 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5157 - DIRECTION
      ?auto_5158 - MODE
      ?auto_5160 - DIRECTION
      ?auto_5159 - MODE
      ?auto_5162 - DIRECTION
      ?auto_5161 - MODE
    )
    :vars
    (
      ?auto_5163 - INSTRUMENT
      ?auto_5164 - SATELLITE
      ?auto_5165 - DIRECTION
      ?auto_5166 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5163 ?auto_5164 ) ( SUPPORTS ?auto_5163 ?auto_5161 ) ( not ( = ?auto_5162 ?auto_5165 ) ) ( HAVE_IMAGE ?auto_5157 ?auto_5158 ) ( not ( = ?auto_5157 ?auto_5162 ) ) ( not ( = ?auto_5157 ?auto_5165 ) ) ( not ( = ?auto_5158 ?auto_5161 ) ) ( CALIBRATION_TARGET ?auto_5163 ?auto_5165 ) ( POINTING ?auto_5164 ?auto_5160 ) ( not ( = ?auto_5165 ?auto_5160 ) ) ( not ( = ?auto_5162 ?auto_5160 ) ) ( not ( = ?auto_5157 ?auto_5160 ) ) ( ON_BOARD ?auto_5166 ?auto_5164 ) ( POWER_ON ?auto_5166 ) ( not ( = ?auto_5163 ?auto_5166 ) ) ( CALIBRATED ?auto_5166 ) ( SUPPORTS ?auto_5166 ?auto_5159 ) ( not ( = ?auto_5158 ?auto_5159 ) ) ( not ( = ?auto_5161 ?auto_5159 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5157 ?auto_5158 ?auto_5162 ?auto_5161 )
      ( GET-3IMAGE-VERIFY ?auto_5157 ?auto_5158 ?auto_5160 ?auto_5159 ?auto_5162 ?auto_5161 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5167 - DIRECTION
      ?auto_5168 - MODE
      ?auto_5170 - DIRECTION
      ?auto_5169 - MODE
      ?auto_5172 - DIRECTION
      ?auto_5171 - MODE
    )
    :vars
    (
      ?auto_5173 - INSTRUMENT
      ?auto_5174 - SATELLITE
      ?auto_5176 - DIRECTION
      ?auto_5178 - DIRECTION
      ?auto_5177 - INSTRUMENT
      ?auto_5175 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_5173 ?auto_5174 ) ( SUPPORTS ?auto_5173 ?auto_5169 ) ( not ( = ?auto_5170 ?auto_5176 ) ) ( HAVE_IMAGE ?auto_5172 ?auto_5171 ) ( not ( = ?auto_5172 ?auto_5170 ) ) ( not ( = ?auto_5172 ?auto_5176 ) ) ( not ( = ?auto_5171 ?auto_5169 ) ) ( CALIBRATION_TARGET ?auto_5173 ?auto_5176 ) ( POINTING ?auto_5174 ?auto_5178 ) ( not ( = ?auto_5176 ?auto_5178 ) ) ( not ( = ?auto_5170 ?auto_5178 ) ) ( not ( = ?auto_5172 ?auto_5178 ) ) ( ON_BOARD ?auto_5177 ?auto_5174 ) ( POWER_ON ?auto_5177 ) ( not ( = ?auto_5173 ?auto_5177 ) ) ( CALIBRATED ?auto_5177 ) ( SUPPORTS ?auto_5177 ?auto_5175 ) ( not ( = ?auto_5171 ?auto_5175 ) ) ( not ( = ?auto_5169 ?auto_5175 ) ) ( HAVE_IMAGE ?auto_5167 ?auto_5168 ) ( not ( = ?auto_5167 ?auto_5170 ) ) ( not ( = ?auto_5167 ?auto_5172 ) ) ( not ( = ?auto_5167 ?auto_5176 ) ) ( not ( = ?auto_5167 ?auto_5178 ) ) ( not ( = ?auto_5168 ?auto_5169 ) ) ( not ( = ?auto_5168 ?auto_5171 ) ) ( not ( = ?auto_5168 ?auto_5175 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5172 ?auto_5171 ?auto_5170 ?auto_5169 )
      ( GET-3IMAGE-VERIFY ?auto_5167 ?auto_5168 ?auto_5170 ?auto_5169 ?auto_5172 ?auto_5171 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5179 - DIRECTION
      ?auto_5180 - MODE
      ?auto_5182 - DIRECTION
      ?auto_5181 - MODE
      ?auto_5184 - DIRECTION
      ?auto_5183 - MODE
    )
    :vars
    (
      ?auto_5185 - INSTRUMENT
      ?auto_5186 - SATELLITE
      ?auto_5187 - DIRECTION
      ?auto_5188 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5185 ?auto_5186 ) ( SUPPORTS ?auto_5185 ?auto_5181 ) ( not ( = ?auto_5182 ?auto_5187 ) ) ( HAVE_IMAGE ?auto_5179 ?auto_5180 ) ( not ( = ?auto_5179 ?auto_5182 ) ) ( not ( = ?auto_5179 ?auto_5187 ) ) ( not ( = ?auto_5180 ?auto_5181 ) ) ( CALIBRATION_TARGET ?auto_5185 ?auto_5187 ) ( POINTING ?auto_5186 ?auto_5184 ) ( not ( = ?auto_5187 ?auto_5184 ) ) ( not ( = ?auto_5182 ?auto_5184 ) ) ( not ( = ?auto_5179 ?auto_5184 ) ) ( ON_BOARD ?auto_5188 ?auto_5186 ) ( POWER_ON ?auto_5188 ) ( not ( = ?auto_5185 ?auto_5188 ) ) ( CALIBRATED ?auto_5188 ) ( SUPPORTS ?auto_5188 ?auto_5183 ) ( not ( = ?auto_5180 ?auto_5183 ) ) ( not ( = ?auto_5181 ?auto_5183 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5179 ?auto_5180 ?auto_5182 ?auto_5181 )
      ( GET-3IMAGE-VERIFY ?auto_5179 ?auto_5180 ?auto_5182 ?auto_5181 ?auto_5184 ?auto_5183 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5201 - DIRECTION
      ?auto_5202 - MODE
      ?auto_5204 - DIRECTION
      ?auto_5203 - MODE
      ?auto_5206 - DIRECTION
      ?auto_5205 - MODE
    )
    :vars
    (
      ?auto_5207 - INSTRUMENT
      ?auto_5208 - SATELLITE
      ?auto_5209 - DIRECTION
      ?auto_5210 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5207 ?auto_5208 ) ( SUPPORTS ?auto_5207 ?auto_5205 ) ( not ( = ?auto_5206 ?auto_5209 ) ) ( HAVE_IMAGE ?auto_5204 ?auto_5203 ) ( not ( = ?auto_5204 ?auto_5206 ) ) ( not ( = ?auto_5204 ?auto_5209 ) ) ( not ( = ?auto_5203 ?auto_5205 ) ) ( CALIBRATION_TARGET ?auto_5207 ?auto_5209 ) ( POINTING ?auto_5208 ?auto_5201 ) ( not ( = ?auto_5209 ?auto_5201 ) ) ( not ( = ?auto_5206 ?auto_5201 ) ) ( not ( = ?auto_5204 ?auto_5201 ) ) ( ON_BOARD ?auto_5210 ?auto_5208 ) ( POWER_ON ?auto_5210 ) ( not ( = ?auto_5207 ?auto_5210 ) ) ( CALIBRATED ?auto_5210 ) ( SUPPORTS ?auto_5210 ?auto_5202 ) ( not ( = ?auto_5203 ?auto_5202 ) ) ( not ( = ?auto_5205 ?auto_5202 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5204 ?auto_5203 ?auto_5206 ?auto_5205 )
      ( GET-3IMAGE-VERIFY ?auto_5201 ?auto_5202 ?auto_5204 ?auto_5203 ?auto_5206 ?auto_5205 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5223 - DIRECTION
      ?auto_5224 - MODE
      ?auto_5226 - DIRECTION
      ?auto_5225 - MODE
      ?auto_5228 - DIRECTION
      ?auto_5227 - MODE
    )
    :vars
    (
      ?auto_5229 - INSTRUMENT
      ?auto_5230 - SATELLITE
      ?auto_5231 - DIRECTION
      ?auto_5232 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5229 ?auto_5230 ) ( SUPPORTS ?auto_5229 ?auto_5225 ) ( not ( = ?auto_5226 ?auto_5231 ) ) ( HAVE_IMAGE ?auto_5228 ?auto_5227 ) ( not ( = ?auto_5228 ?auto_5226 ) ) ( not ( = ?auto_5228 ?auto_5231 ) ) ( not ( = ?auto_5227 ?auto_5225 ) ) ( CALIBRATION_TARGET ?auto_5229 ?auto_5231 ) ( POINTING ?auto_5230 ?auto_5223 ) ( not ( = ?auto_5231 ?auto_5223 ) ) ( not ( = ?auto_5226 ?auto_5223 ) ) ( not ( = ?auto_5228 ?auto_5223 ) ) ( ON_BOARD ?auto_5232 ?auto_5230 ) ( POWER_ON ?auto_5232 ) ( not ( = ?auto_5229 ?auto_5232 ) ) ( CALIBRATED ?auto_5232 ) ( SUPPORTS ?auto_5232 ?auto_5224 ) ( not ( = ?auto_5227 ?auto_5224 ) ) ( not ( = ?auto_5225 ?auto_5224 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5228 ?auto_5227 ?auto_5226 ?auto_5225 )
      ( GET-3IMAGE-VERIFY ?auto_5223 ?auto_5224 ?auto_5226 ?auto_5225 ?auto_5228 ?auto_5227 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5257 - DIRECTION
      ?auto_5258 - MODE
      ?auto_5260 - DIRECTION
      ?auto_5259 - MODE
      ?auto_5262 - DIRECTION
      ?auto_5261 - MODE
    )
    :vars
    (
      ?auto_5263 - INSTRUMENT
      ?auto_5264 - SATELLITE
      ?auto_5266 - DIRECTION
      ?auto_5268 - DIRECTION
      ?auto_5267 - INSTRUMENT
      ?auto_5265 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_5263 ?auto_5264 ) ( SUPPORTS ?auto_5263 ?auto_5258 ) ( not ( = ?auto_5257 ?auto_5266 ) ) ( HAVE_IMAGE ?auto_5260 ?auto_5261 ) ( not ( = ?auto_5260 ?auto_5257 ) ) ( not ( = ?auto_5260 ?auto_5266 ) ) ( not ( = ?auto_5261 ?auto_5258 ) ) ( CALIBRATION_TARGET ?auto_5263 ?auto_5266 ) ( POINTING ?auto_5264 ?auto_5268 ) ( not ( = ?auto_5266 ?auto_5268 ) ) ( not ( = ?auto_5257 ?auto_5268 ) ) ( not ( = ?auto_5260 ?auto_5268 ) ) ( ON_BOARD ?auto_5267 ?auto_5264 ) ( POWER_ON ?auto_5267 ) ( not ( = ?auto_5263 ?auto_5267 ) ) ( CALIBRATED ?auto_5267 ) ( SUPPORTS ?auto_5267 ?auto_5265 ) ( not ( = ?auto_5261 ?auto_5265 ) ) ( not ( = ?auto_5258 ?auto_5265 ) ) ( HAVE_IMAGE ?auto_5260 ?auto_5259 ) ( HAVE_IMAGE ?auto_5262 ?auto_5261 ) ( not ( = ?auto_5257 ?auto_5262 ) ) ( not ( = ?auto_5258 ?auto_5259 ) ) ( not ( = ?auto_5260 ?auto_5262 ) ) ( not ( = ?auto_5259 ?auto_5261 ) ) ( not ( = ?auto_5259 ?auto_5265 ) ) ( not ( = ?auto_5262 ?auto_5266 ) ) ( not ( = ?auto_5262 ?auto_5268 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5260 ?auto_5261 ?auto_5257 ?auto_5258 )
      ( GET-3IMAGE-VERIFY ?auto_5257 ?auto_5258 ?auto_5260 ?auto_5259 ?auto_5262 ?auto_5261 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5269 - DIRECTION
      ?auto_5270 - MODE
      ?auto_5272 - DIRECTION
      ?auto_5271 - MODE
      ?auto_5274 - DIRECTION
      ?auto_5273 - MODE
    )
    :vars
    (
      ?auto_5275 - INSTRUMENT
      ?auto_5276 - SATELLITE
      ?auto_5277 - DIRECTION
      ?auto_5278 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5275 ?auto_5276 ) ( SUPPORTS ?auto_5275 ?auto_5270 ) ( not ( = ?auto_5269 ?auto_5277 ) ) ( HAVE_IMAGE ?auto_5272 ?auto_5271 ) ( not ( = ?auto_5272 ?auto_5269 ) ) ( not ( = ?auto_5272 ?auto_5277 ) ) ( not ( = ?auto_5271 ?auto_5270 ) ) ( CALIBRATION_TARGET ?auto_5275 ?auto_5277 ) ( POINTING ?auto_5276 ?auto_5274 ) ( not ( = ?auto_5277 ?auto_5274 ) ) ( not ( = ?auto_5269 ?auto_5274 ) ) ( not ( = ?auto_5272 ?auto_5274 ) ) ( ON_BOARD ?auto_5278 ?auto_5276 ) ( POWER_ON ?auto_5278 ) ( not ( = ?auto_5275 ?auto_5278 ) ) ( CALIBRATED ?auto_5278 ) ( SUPPORTS ?auto_5278 ?auto_5273 ) ( not ( = ?auto_5271 ?auto_5273 ) ) ( not ( = ?auto_5270 ?auto_5273 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5272 ?auto_5271 ?auto_5269 ?auto_5270 )
      ( GET-3IMAGE-VERIFY ?auto_5269 ?auto_5270 ?auto_5272 ?auto_5271 ?auto_5274 ?auto_5273 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5291 - DIRECTION
      ?auto_5292 - MODE
      ?auto_5294 - DIRECTION
      ?auto_5293 - MODE
      ?auto_5296 - DIRECTION
      ?auto_5295 - MODE
    )
    :vars
    (
      ?auto_5297 - INSTRUMENT
      ?auto_5298 - SATELLITE
      ?auto_5299 - DIRECTION
      ?auto_5300 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5297 ?auto_5298 ) ( SUPPORTS ?auto_5297 ?auto_5292 ) ( not ( = ?auto_5291 ?auto_5299 ) ) ( HAVE_IMAGE ?auto_5296 ?auto_5295 ) ( not ( = ?auto_5296 ?auto_5291 ) ) ( not ( = ?auto_5296 ?auto_5299 ) ) ( not ( = ?auto_5295 ?auto_5292 ) ) ( CALIBRATION_TARGET ?auto_5297 ?auto_5299 ) ( POINTING ?auto_5298 ?auto_5294 ) ( not ( = ?auto_5299 ?auto_5294 ) ) ( not ( = ?auto_5291 ?auto_5294 ) ) ( not ( = ?auto_5296 ?auto_5294 ) ) ( ON_BOARD ?auto_5300 ?auto_5298 ) ( POWER_ON ?auto_5300 ) ( not ( = ?auto_5297 ?auto_5300 ) ) ( CALIBRATED ?auto_5300 ) ( SUPPORTS ?auto_5300 ?auto_5293 ) ( not ( = ?auto_5295 ?auto_5293 ) ) ( not ( = ?auto_5292 ?auto_5293 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5296 ?auto_5295 ?auto_5291 ?auto_5292 )
      ( GET-3IMAGE-VERIFY ?auto_5291 ?auto_5292 ?auto_5294 ?auto_5293 ?auto_5296 ?auto_5295 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_5363 - DIRECTION
      ?auto_5364 - MODE
    )
    :vars
    (
      ?auto_5365 - INSTRUMENT
      ?auto_5366 - SATELLITE
      ?auto_5368 - DIRECTION
      ?auto_5372 - DIRECTION
      ?auto_5371 - MODE
      ?auto_5370 - DIRECTION
      ?auto_5369 - INSTRUMENT
      ?auto_5367 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_5365 ?auto_5366 ) ( SUPPORTS ?auto_5365 ?auto_5364 ) ( not ( = ?auto_5363 ?auto_5368 ) ) ( HAVE_IMAGE ?auto_5372 ?auto_5371 ) ( not ( = ?auto_5372 ?auto_5363 ) ) ( not ( = ?auto_5372 ?auto_5368 ) ) ( not ( = ?auto_5371 ?auto_5364 ) ) ( CALIBRATION_TARGET ?auto_5365 ?auto_5368 ) ( not ( = ?auto_5368 ?auto_5370 ) ) ( not ( = ?auto_5363 ?auto_5370 ) ) ( not ( = ?auto_5372 ?auto_5370 ) ) ( ON_BOARD ?auto_5369 ?auto_5366 ) ( POWER_ON ?auto_5369 ) ( not ( = ?auto_5365 ?auto_5369 ) ) ( CALIBRATED ?auto_5369 ) ( SUPPORTS ?auto_5369 ?auto_5367 ) ( not ( = ?auto_5371 ?auto_5367 ) ) ( not ( = ?auto_5364 ?auto_5367 ) ) ( POINTING ?auto_5366 ?auto_5368 ) )
    :subtasks
    ( ( !TURN_TO ?auto_5366 ?auto_5370 ?auto_5368 )
      ( GET-2IMAGE ?auto_5372 ?auto_5371 ?auto_5363 ?auto_5364 )
      ( GET-1IMAGE-VERIFY ?auto_5363 ?auto_5364 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_5373 - DIRECTION
      ?auto_5374 - MODE
      ?auto_5376 - DIRECTION
      ?auto_5375 - MODE
    )
    :vars
    (
      ?auto_5381 - INSTRUMENT
      ?auto_5377 - SATELLITE
      ?auto_5382 - DIRECTION
      ?auto_5380 - DIRECTION
      ?auto_5379 - INSTRUMENT
      ?auto_5378 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_5381 ?auto_5377 ) ( SUPPORTS ?auto_5381 ?auto_5375 ) ( not ( = ?auto_5376 ?auto_5382 ) ) ( HAVE_IMAGE ?auto_5373 ?auto_5374 ) ( not ( = ?auto_5373 ?auto_5376 ) ) ( not ( = ?auto_5373 ?auto_5382 ) ) ( not ( = ?auto_5374 ?auto_5375 ) ) ( CALIBRATION_TARGET ?auto_5381 ?auto_5382 ) ( not ( = ?auto_5382 ?auto_5380 ) ) ( not ( = ?auto_5376 ?auto_5380 ) ) ( not ( = ?auto_5373 ?auto_5380 ) ) ( ON_BOARD ?auto_5379 ?auto_5377 ) ( POWER_ON ?auto_5379 ) ( not ( = ?auto_5381 ?auto_5379 ) ) ( CALIBRATED ?auto_5379 ) ( SUPPORTS ?auto_5379 ?auto_5378 ) ( not ( = ?auto_5374 ?auto_5378 ) ) ( not ( = ?auto_5375 ?auto_5378 ) ) ( POINTING ?auto_5377 ?auto_5382 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_5376 ?auto_5375 )
      ( GET-2IMAGE-VERIFY ?auto_5373 ?auto_5374 ?auto_5376 ?auto_5375 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_5383 - DIRECTION
      ?auto_5384 - MODE
      ?auto_5386 - DIRECTION
      ?auto_5385 - MODE
    )
    :vars
    (
      ?auto_5388 - INSTRUMENT
      ?auto_5390 - SATELLITE
      ?auto_5389 - DIRECTION
      ?auto_5392 - DIRECTION
      ?auto_5391 - MODE
      ?auto_5387 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5388 ?auto_5390 ) ( SUPPORTS ?auto_5388 ?auto_5385 ) ( not ( = ?auto_5386 ?auto_5389 ) ) ( HAVE_IMAGE ?auto_5392 ?auto_5391 ) ( not ( = ?auto_5392 ?auto_5386 ) ) ( not ( = ?auto_5392 ?auto_5389 ) ) ( not ( = ?auto_5391 ?auto_5385 ) ) ( CALIBRATION_TARGET ?auto_5388 ?auto_5389 ) ( not ( = ?auto_5389 ?auto_5383 ) ) ( not ( = ?auto_5386 ?auto_5383 ) ) ( not ( = ?auto_5392 ?auto_5383 ) ) ( ON_BOARD ?auto_5387 ?auto_5390 ) ( POWER_ON ?auto_5387 ) ( not ( = ?auto_5388 ?auto_5387 ) ) ( CALIBRATED ?auto_5387 ) ( SUPPORTS ?auto_5387 ?auto_5384 ) ( not ( = ?auto_5391 ?auto_5384 ) ) ( not ( = ?auto_5385 ?auto_5384 ) ) ( POINTING ?auto_5390 ?auto_5389 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5392 ?auto_5391 ?auto_5386 ?auto_5385 )
      ( GET-2IMAGE-VERIFY ?auto_5383 ?auto_5384 ?auto_5386 ?auto_5385 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_5393 - DIRECTION
      ?auto_5394 - MODE
      ?auto_5396 - DIRECTION
      ?auto_5395 - MODE
    )
    :vars
    (
      ?auto_5398 - INSTRUMENT
      ?auto_5402 - SATELLITE
      ?auto_5400 - DIRECTION
      ?auto_5399 - DIRECTION
      ?auto_5397 - INSTRUMENT
      ?auto_5401 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_5398 ?auto_5402 ) ( SUPPORTS ?auto_5398 ?auto_5394 ) ( not ( = ?auto_5393 ?auto_5400 ) ) ( HAVE_IMAGE ?auto_5396 ?auto_5395 ) ( not ( = ?auto_5396 ?auto_5393 ) ) ( not ( = ?auto_5396 ?auto_5400 ) ) ( not ( = ?auto_5395 ?auto_5394 ) ) ( CALIBRATION_TARGET ?auto_5398 ?auto_5400 ) ( not ( = ?auto_5400 ?auto_5399 ) ) ( not ( = ?auto_5393 ?auto_5399 ) ) ( not ( = ?auto_5396 ?auto_5399 ) ) ( ON_BOARD ?auto_5397 ?auto_5402 ) ( POWER_ON ?auto_5397 ) ( not ( = ?auto_5398 ?auto_5397 ) ) ( CALIBRATED ?auto_5397 ) ( SUPPORTS ?auto_5397 ?auto_5401 ) ( not ( = ?auto_5395 ?auto_5401 ) ) ( not ( = ?auto_5394 ?auto_5401 ) ) ( POINTING ?auto_5402 ?auto_5400 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5396 ?auto_5395 ?auto_5393 ?auto_5394 )
      ( GET-2IMAGE-VERIFY ?auto_5393 ?auto_5394 ?auto_5396 ?auto_5395 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_5403 - DIRECTION
      ?auto_5404 - MODE
      ?auto_5406 - DIRECTION
      ?auto_5405 - MODE
    )
    :vars
    (
      ?auto_5408 - INSTRUMENT
      ?auto_5410 - SATELLITE
      ?auto_5409 - DIRECTION
      ?auto_5412 - DIRECTION
      ?auto_5411 - MODE
      ?auto_5407 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5408 ?auto_5410 ) ( SUPPORTS ?auto_5408 ?auto_5404 ) ( not ( = ?auto_5403 ?auto_5409 ) ) ( HAVE_IMAGE ?auto_5412 ?auto_5411 ) ( not ( = ?auto_5412 ?auto_5403 ) ) ( not ( = ?auto_5412 ?auto_5409 ) ) ( not ( = ?auto_5411 ?auto_5404 ) ) ( CALIBRATION_TARGET ?auto_5408 ?auto_5409 ) ( not ( = ?auto_5409 ?auto_5406 ) ) ( not ( = ?auto_5403 ?auto_5406 ) ) ( not ( = ?auto_5412 ?auto_5406 ) ) ( ON_BOARD ?auto_5407 ?auto_5410 ) ( POWER_ON ?auto_5407 ) ( not ( = ?auto_5408 ?auto_5407 ) ) ( CALIBRATED ?auto_5407 ) ( SUPPORTS ?auto_5407 ?auto_5405 ) ( not ( = ?auto_5411 ?auto_5405 ) ) ( not ( = ?auto_5404 ?auto_5405 ) ) ( POINTING ?auto_5410 ?auto_5409 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5412 ?auto_5411 ?auto_5403 ?auto_5404 )
      ( GET-2IMAGE-VERIFY ?auto_5403 ?auto_5404 ?auto_5406 ?auto_5405 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5425 - DIRECTION
      ?auto_5426 - MODE
      ?auto_5428 - DIRECTION
      ?auto_5427 - MODE
      ?auto_5430 - DIRECTION
      ?auto_5429 - MODE
    )
    :vars
    (
      ?auto_5432 - INSTRUMENT
      ?auto_5436 - SATELLITE
      ?auto_5434 - DIRECTION
      ?auto_5433 - DIRECTION
      ?auto_5431 - INSTRUMENT
      ?auto_5435 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_5432 ?auto_5436 ) ( SUPPORTS ?auto_5432 ?auto_5429 ) ( not ( = ?auto_5430 ?auto_5434 ) ) ( HAVE_IMAGE ?auto_5428 ?auto_5427 ) ( not ( = ?auto_5428 ?auto_5430 ) ) ( not ( = ?auto_5428 ?auto_5434 ) ) ( not ( = ?auto_5427 ?auto_5429 ) ) ( CALIBRATION_TARGET ?auto_5432 ?auto_5434 ) ( not ( = ?auto_5434 ?auto_5433 ) ) ( not ( = ?auto_5430 ?auto_5433 ) ) ( not ( = ?auto_5428 ?auto_5433 ) ) ( ON_BOARD ?auto_5431 ?auto_5436 ) ( POWER_ON ?auto_5431 ) ( not ( = ?auto_5432 ?auto_5431 ) ) ( CALIBRATED ?auto_5431 ) ( SUPPORTS ?auto_5431 ?auto_5435 ) ( not ( = ?auto_5427 ?auto_5435 ) ) ( not ( = ?auto_5429 ?auto_5435 ) ) ( POINTING ?auto_5436 ?auto_5434 ) ( HAVE_IMAGE ?auto_5425 ?auto_5426 ) ( not ( = ?auto_5425 ?auto_5428 ) ) ( not ( = ?auto_5425 ?auto_5430 ) ) ( not ( = ?auto_5425 ?auto_5434 ) ) ( not ( = ?auto_5425 ?auto_5433 ) ) ( not ( = ?auto_5426 ?auto_5427 ) ) ( not ( = ?auto_5426 ?auto_5429 ) ) ( not ( = ?auto_5426 ?auto_5435 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5428 ?auto_5427 ?auto_5430 ?auto_5429 )
      ( GET-3IMAGE-VERIFY ?auto_5425 ?auto_5426 ?auto_5428 ?auto_5427 ?auto_5430 ?auto_5429 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5437 - DIRECTION
      ?auto_5438 - MODE
      ?auto_5440 - DIRECTION
      ?auto_5439 - MODE
      ?auto_5442 - DIRECTION
      ?auto_5441 - MODE
    )
    :vars
    (
      ?auto_5444 - INSTRUMENT
      ?auto_5446 - SATELLITE
      ?auto_5445 - DIRECTION
      ?auto_5443 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5444 ?auto_5446 ) ( SUPPORTS ?auto_5444 ?auto_5441 ) ( not ( = ?auto_5442 ?auto_5445 ) ) ( HAVE_IMAGE ?auto_5437 ?auto_5438 ) ( not ( = ?auto_5437 ?auto_5442 ) ) ( not ( = ?auto_5437 ?auto_5445 ) ) ( not ( = ?auto_5438 ?auto_5441 ) ) ( CALIBRATION_TARGET ?auto_5444 ?auto_5445 ) ( not ( = ?auto_5445 ?auto_5440 ) ) ( not ( = ?auto_5442 ?auto_5440 ) ) ( not ( = ?auto_5437 ?auto_5440 ) ) ( ON_BOARD ?auto_5443 ?auto_5446 ) ( POWER_ON ?auto_5443 ) ( not ( = ?auto_5444 ?auto_5443 ) ) ( CALIBRATED ?auto_5443 ) ( SUPPORTS ?auto_5443 ?auto_5439 ) ( not ( = ?auto_5438 ?auto_5439 ) ) ( not ( = ?auto_5441 ?auto_5439 ) ) ( POINTING ?auto_5446 ?auto_5445 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5437 ?auto_5438 ?auto_5442 ?auto_5441 )
      ( GET-3IMAGE-VERIFY ?auto_5437 ?auto_5438 ?auto_5440 ?auto_5439 ?auto_5442 ?auto_5441 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5447 - DIRECTION
      ?auto_5448 - MODE
      ?auto_5450 - DIRECTION
      ?auto_5449 - MODE
      ?auto_5452 - DIRECTION
      ?auto_5451 - MODE
    )
    :vars
    (
      ?auto_5454 - INSTRUMENT
      ?auto_5458 - SATELLITE
      ?auto_5456 - DIRECTION
      ?auto_5455 - DIRECTION
      ?auto_5453 - INSTRUMENT
      ?auto_5457 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_5454 ?auto_5458 ) ( SUPPORTS ?auto_5454 ?auto_5449 ) ( not ( = ?auto_5450 ?auto_5456 ) ) ( HAVE_IMAGE ?auto_5452 ?auto_5451 ) ( not ( = ?auto_5452 ?auto_5450 ) ) ( not ( = ?auto_5452 ?auto_5456 ) ) ( not ( = ?auto_5451 ?auto_5449 ) ) ( CALIBRATION_TARGET ?auto_5454 ?auto_5456 ) ( not ( = ?auto_5456 ?auto_5455 ) ) ( not ( = ?auto_5450 ?auto_5455 ) ) ( not ( = ?auto_5452 ?auto_5455 ) ) ( ON_BOARD ?auto_5453 ?auto_5458 ) ( POWER_ON ?auto_5453 ) ( not ( = ?auto_5454 ?auto_5453 ) ) ( CALIBRATED ?auto_5453 ) ( SUPPORTS ?auto_5453 ?auto_5457 ) ( not ( = ?auto_5451 ?auto_5457 ) ) ( not ( = ?auto_5449 ?auto_5457 ) ) ( POINTING ?auto_5458 ?auto_5456 ) ( HAVE_IMAGE ?auto_5447 ?auto_5448 ) ( not ( = ?auto_5447 ?auto_5450 ) ) ( not ( = ?auto_5447 ?auto_5452 ) ) ( not ( = ?auto_5447 ?auto_5456 ) ) ( not ( = ?auto_5447 ?auto_5455 ) ) ( not ( = ?auto_5448 ?auto_5449 ) ) ( not ( = ?auto_5448 ?auto_5451 ) ) ( not ( = ?auto_5448 ?auto_5457 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5452 ?auto_5451 ?auto_5450 ?auto_5449 )
      ( GET-3IMAGE-VERIFY ?auto_5447 ?auto_5448 ?auto_5450 ?auto_5449 ?auto_5452 ?auto_5451 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5459 - DIRECTION
      ?auto_5460 - MODE
      ?auto_5462 - DIRECTION
      ?auto_5461 - MODE
      ?auto_5464 - DIRECTION
      ?auto_5463 - MODE
    )
    :vars
    (
      ?auto_5466 - INSTRUMENT
      ?auto_5468 - SATELLITE
      ?auto_5467 - DIRECTION
      ?auto_5465 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5466 ?auto_5468 ) ( SUPPORTS ?auto_5466 ?auto_5461 ) ( not ( = ?auto_5462 ?auto_5467 ) ) ( HAVE_IMAGE ?auto_5459 ?auto_5460 ) ( not ( = ?auto_5459 ?auto_5462 ) ) ( not ( = ?auto_5459 ?auto_5467 ) ) ( not ( = ?auto_5460 ?auto_5461 ) ) ( CALIBRATION_TARGET ?auto_5466 ?auto_5467 ) ( not ( = ?auto_5467 ?auto_5464 ) ) ( not ( = ?auto_5462 ?auto_5464 ) ) ( not ( = ?auto_5459 ?auto_5464 ) ) ( ON_BOARD ?auto_5465 ?auto_5468 ) ( POWER_ON ?auto_5465 ) ( not ( = ?auto_5466 ?auto_5465 ) ) ( CALIBRATED ?auto_5465 ) ( SUPPORTS ?auto_5465 ?auto_5463 ) ( not ( = ?auto_5460 ?auto_5463 ) ) ( not ( = ?auto_5461 ?auto_5463 ) ) ( POINTING ?auto_5468 ?auto_5467 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5459 ?auto_5460 ?auto_5462 ?auto_5461 )
      ( GET-3IMAGE-VERIFY ?auto_5459 ?auto_5460 ?auto_5462 ?auto_5461 ?auto_5464 ?auto_5463 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5481 - DIRECTION
      ?auto_5482 - MODE
      ?auto_5484 - DIRECTION
      ?auto_5483 - MODE
      ?auto_5486 - DIRECTION
      ?auto_5485 - MODE
    )
    :vars
    (
      ?auto_5488 - INSTRUMENT
      ?auto_5490 - SATELLITE
      ?auto_5489 - DIRECTION
      ?auto_5487 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5488 ?auto_5490 ) ( SUPPORTS ?auto_5488 ?auto_5485 ) ( not ( = ?auto_5486 ?auto_5489 ) ) ( HAVE_IMAGE ?auto_5484 ?auto_5483 ) ( not ( = ?auto_5484 ?auto_5486 ) ) ( not ( = ?auto_5484 ?auto_5489 ) ) ( not ( = ?auto_5483 ?auto_5485 ) ) ( CALIBRATION_TARGET ?auto_5488 ?auto_5489 ) ( not ( = ?auto_5489 ?auto_5481 ) ) ( not ( = ?auto_5486 ?auto_5481 ) ) ( not ( = ?auto_5484 ?auto_5481 ) ) ( ON_BOARD ?auto_5487 ?auto_5490 ) ( POWER_ON ?auto_5487 ) ( not ( = ?auto_5488 ?auto_5487 ) ) ( CALIBRATED ?auto_5487 ) ( SUPPORTS ?auto_5487 ?auto_5482 ) ( not ( = ?auto_5483 ?auto_5482 ) ) ( not ( = ?auto_5485 ?auto_5482 ) ) ( POINTING ?auto_5490 ?auto_5489 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5484 ?auto_5483 ?auto_5486 ?auto_5485 )
      ( GET-3IMAGE-VERIFY ?auto_5481 ?auto_5482 ?auto_5484 ?auto_5483 ?auto_5486 ?auto_5485 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5503 - DIRECTION
      ?auto_5504 - MODE
      ?auto_5506 - DIRECTION
      ?auto_5505 - MODE
      ?auto_5508 - DIRECTION
      ?auto_5507 - MODE
    )
    :vars
    (
      ?auto_5510 - INSTRUMENT
      ?auto_5512 - SATELLITE
      ?auto_5511 - DIRECTION
      ?auto_5509 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5510 ?auto_5512 ) ( SUPPORTS ?auto_5510 ?auto_5505 ) ( not ( = ?auto_5506 ?auto_5511 ) ) ( HAVE_IMAGE ?auto_5508 ?auto_5507 ) ( not ( = ?auto_5508 ?auto_5506 ) ) ( not ( = ?auto_5508 ?auto_5511 ) ) ( not ( = ?auto_5507 ?auto_5505 ) ) ( CALIBRATION_TARGET ?auto_5510 ?auto_5511 ) ( not ( = ?auto_5511 ?auto_5503 ) ) ( not ( = ?auto_5506 ?auto_5503 ) ) ( not ( = ?auto_5508 ?auto_5503 ) ) ( ON_BOARD ?auto_5509 ?auto_5512 ) ( POWER_ON ?auto_5509 ) ( not ( = ?auto_5510 ?auto_5509 ) ) ( CALIBRATED ?auto_5509 ) ( SUPPORTS ?auto_5509 ?auto_5504 ) ( not ( = ?auto_5507 ?auto_5504 ) ) ( not ( = ?auto_5505 ?auto_5504 ) ) ( POINTING ?auto_5512 ?auto_5511 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5508 ?auto_5507 ?auto_5506 ?auto_5505 )
      ( GET-3IMAGE-VERIFY ?auto_5503 ?auto_5504 ?auto_5506 ?auto_5505 ?auto_5508 ?auto_5507 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5537 - DIRECTION
      ?auto_5538 - MODE
      ?auto_5540 - DIRECTION
      ?auto_5539 - MODE
      ?auto_5542 - DIRECTION
      ?auto_5541 - MODE
    )
    :vars
    (
      ?auto_5544 - INSTRUMENT
      ?auto_5548 - SATELLITE
      ?auto_5546 - DIRECTION
      ?auto_5545 - DIRECTION
      ?auto_5543 - INSTRUMENT
      ?auto_5547 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_5544 ?auto_5548 ) ( SUPPORTS ?auto_5544 ?auto_5538 ) ( not ( = ?auto_5537 ?auto_5546 ) ) ( HAVE_IMAGE ?auto_5540 ?auto_5541 ) ( not ( = ?auto_5540 ?auto_5537 ) ) ( not ( = ?auto_5540 ?auto_5546 ) ) ( not ( = ?auto_5541 ?auto_5538 ) ) ( CALIBRATION_TARGET ?auto_5544 ?auto_5546 ) ( not ( = ?auto_5546 ?auto_5545 ) ) ( not ( = ?auto_5537 ?auto_5545 ) ) ( not ( = ?auto_5540 ?auto_5545 ) ) ( ON_BOARD ?auto_5543 ?auto_5548 ) ( POWER_ON ?auto_5543 ) ( not ( = ?auto_5544 ?auto_5543 ) ) ( CALIBRATED ?auto_5543 ) ( SUPPORTS ?auto_5543 ?auto_5547 ) ( not ( = ?auto_5541 ?auto_5547 ) ) ( not ( = ?auto_5538 ?auto_5547 ) ) ( POINTING ?auto_5548 ?auto_5546 ) ( HAVE_IMAGE ?auto_5540 ?auto_5539 ) ( HAVE_IMAGE ?auto_5542 ?auto_5541 ) ( not ( = ?auto_5537 ?auto_5542 ) ) ( not ( = ?auto_5538 ?auto_5539 ) ) ( not ( = ?auto_5540 ?auto_5542 ) ) ( not ( = ?auto_5539 ?auto_5541 ) ) ( not ( = ?auto_5539 ?auto_5547 ) ) ( not ( = ?auto_5542 ?auto_5546 ) ) ( not ( = ?auto_5542 ?auto_5545 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5540 ?auto_5541 ?auto_5537 ?auto_5538 )
      ( GET-3IMAGE-VERIFY ?auto_5537 ?auto_5538 ?auto_5540 ?auto_5539 ?auto_5542 ?auto_5541 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5549 - DIRECTION
      ?auto_5550 - MODE
      ?auto_5552 - DIRECTION
      ?auto_5551 - MODE
      ?auto_5554 - DIRECTION
      ?auto_5553 - MODE
    )
    :vars
    (
      ?auto_5556 - INSTRUMENT
      ?auto_5558 - SATELLITE
      ?auto_5557 - DIRECTION
      ?auto_5555 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5556 ?auto_5558 ) ( SUPPORTS ?auto_5556 ?auto_5550 ) ( not ( = ?auto_5549 ?auto_5557 ) ) ( HAVE_IMAGE ?auto_5552 ?auto_5551 ) ( not ( = ?auto_5552 ?auto_5549 ) ) ( not ( = ?auto_5552 ?auto_5557 ) ) ( not ( = ?auto_5551 ?auto_5550 ) ) ( CALIBRATION_TARGET ?auto_5556 ?auto_5557 ) ( not ( = ?auto_5557 ?auto_5554 ) ) ( not ( = ?auto_5549 ?auto_5554 ) ) ( not ( = ?auto_5552 ?auto_5554 ) ) ( ON_BOARD ?auto_5555 ?auto_5558 ) ( POWER_ON ?auto_5555 ) ( not ( = ?auto_5556 ?auto_5555 ) ) ( CALIBRATED ?auto_5555 ) ( SUPPORTS ?auto_5555 ?auto_5553 ) ( not ( = ?auto_5551 ?auto_5553 ) ) ( not ( = ?auto_5550 ?auto_5553 ) ) ( POINTING ?auto_5558 ?auto_5557 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5552 ?auto_5551 ?auto_5549 ?auto_5550 )
      ( GET-3IMAGE-VERIFY ?auto_5549 ?auto_5550 ?auto_5552 ?auto_5551 ?auto_5554 ?auto_5553 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5571 - DIRECTION
      ?auto_5572 - MODE
      ?auto_5574 - DIRECTION
      ?auto_5573 - MODE
      ?auto_5576 - DIRECTION
      ?auto_5575 - MODE
    )
    :vars
    (
      ?auto_5578 - INSTRUMENT
      ?auto_5580 - SATELLITE
      ?auto_5579 - DIRECTION
      ?auto_5577 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5578 ?auto_5580 ) ( SUPPORTS ?auto_5578 ?auto_5572 ) ( not ( = ?auto_5571 ?auto_5579 ) ) ( HAVE_IMAGE ?auto_5576 ?auto_5575 ) ( not ( = ?auto_5576 ?auto_5571 ) ) ( not ( = ?auto_5576 ?auto_5579 ) ) ( not ( = ?auto_5575 ?auto_5572 ) ) ( CALIBRATION_TARGET ?auto_5578 ?auto_5579 ) ( not ( = ?auto_5579 ?auto_5574 ) ) ( not ( = ?auto_5571 ?auto_5574 ) ) ( not ( = ?auto_5576 ?auto_5574 ) ) ( ON_BOARD ?auto_5577 ?auto_5580 ) ( POWER_ON ?auto_5577 ) ( not ( = ?auto_5578 ?auto_5577 ) ) ( CALIBRATED ?auto_5577 ) ( SUPPORTS ?auto_5577 ?auto_5573 ) ( not ( = ?auto_5575 ?auto_5573 ) ) ( not ( = ?auto_5572 ?auto_5573 ) ) ( POINTING ?auto_5580 ?auto_5579 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5576 ?auto_5575 ?auto_5571 ?auto_5572 )
      ( GET-3IMAGE-VERIFY ?auto_5571 ?auto_5572 ?auto_5574 ?auto_5573 ?auto_5576 ?auto_5575 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_5643 - DIRECTION
      ?auto_5644 - MODE
    )
    :vars
    (
      ?auto_5646 - INSTRUMENT
      ?auto_5650 - SATELLITE
      ?auto_5648 - DIRECTION
      ?auto_5652 - DIRECTION
      ?auto_5651 - MODE
      ?auto_5647 - DIRECTION
      ?auto_5645 - INSTRUMENT
      ?auto_5649 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_5646 ?auto_5650 ) ( SUPPORTS ?auto_5646 ?auto_5644 ) ( not ( = ?auto_5643 ?auto_5648 ) ) ( HAVE_IMAGE ?auto_5652 ?auto_5651 ) ( not ( = ?auto_5652 ?auto_5643 ) ) ( not ( = ?auto_5652 ?auto_5648 ) ) ( not ( = ?auto_5651 ?auto_5644 ) ) ( CALIBRATION_TARGET ?auto_5646 ?auto_5648 ) ( not ( = ?auto_5648 ?auto_5647 ) ) ( not ( = ?auto_5643 ?auto_5647 ) ) ( not ( = ?auto_5652 ?auto_5647 ) ) ( ON_BOARD ?auto_5645 ?auto_5650 ) ( POWER_ON ?auto_5645 ) ( not ( = ?auto_5646 ?auto_5645 ) ) ( SUPPORTS ?auto_5645 ?auto_5649 ) ( not ( = ?auto_5651 ?auto_5649 ) ) ( not ( = ?auto_5644 ?auto_5649 ) ) ( POINTING ?auto_5650 ?auto_5648 ) ( CALIBRATION_TARGET ?auto_5645 ?auto_5648 ) ( NOT_CALIBRATED ?auto_5645 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_5650 ?auto_5645 ?auto_5648 )
      ( GET-2IMAGE ?auto_5652 ?auto_5651 ?auto_5643 ?auto_5644 )
      ( GET-1IMAGE-VERIFY ?auto_5643 ?auto_5644 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_5653 - DIRECTION
      ?auto_5654 - MODE
      ?auto_5656 - DIRECTION
      ?auto_5655 - MODE
    )
    :vars
    (
      ?auto_5661 - INSTRUMENT
      ?auto_5658 - SATELLITE
      ?auto_5657 - DIRECTION
      ?auto_5659 - DIRECTION
      ?auto_5660 - INSTRUMENT
      ?auto_5662 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_5661 ?auto_5658 ) ( SUPPORTS ?auto_5661 ?auto_5655 ) ( not ( = ?auto_5656 ?auto_5657 ) ) ( HAVE_IMAGE ?auto_5653 ?auto_5654 ) ( not ( = ?auto_5653 ?auto_5656 ) ) ( not ( = ?auto_5653 ?auto_5657 ) ) ( not ( = ?auto_5654 ?auto_5655 ) ) ( CALIBRATION_TARGET ?auto_5661 ?auto_5657 ) ( not ( = ?auto_5657 ?auto_5659 ) ) ( not ( = ?auto_5656 ?auto_5659 ) ) ( not ( = ?auto_5653 ?auto_5659 ) ) ( ON_BOARD ?auto_5660 ?auto_5658 ) ( POWER_ON ?auto_5660 ) ( not ( = ?auto_5661 ?auto_5660 ) ) ( SUPPORTS ?auto_5660 ?auto_5662 ) ( not ( = ?auto_5654 ?auto_5662 ) ) ( not ( = ?auto_5655 ?auto_5662 ) ) ( POINTING ?auto_5658 ?auto_5657 ) ( CALIBRATION_TARGET ?auto_5660 ?auto_5657 ) ( NOT_CALIBRATED ?auto_5660 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_5656 ?auto_5655 )
      ( GET-2IMAGE-VERIFY ?auto_5653 ?auto_5654 ?auto_5656 ?auto_5655 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_5663 - DIRECTION
      ?auto_5664 - MODE
      ?auto_5666 - DIRECTION
      ?auto_5665 - MODE
    )
    :vars
    (
      ?auto_5667 - INSTRUMENT
      ?auto_5669 - SATELLITE
      ?auto_5668 - DIRECTION
      ?auto_5672 - DIRECTION
      ?auto_5671 - MODE
      ?auto_5670 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5667 ?auto_5669 ) ( SUPPORTS ?auto_5667 ?auto_5665 ) ( not ( = ?auto_5666 ?auto_5668 ) ) ( HAVE_IMAGE ?auto_5672 ?auto_5671 ) ( not ( = ?auto_5672 ?auto_5666 ) ) ( not ( = ?auto_5672 ?auto_5668 ) ) ( not ( = ?auto_5671 ?auto_5665 ) ) ( CALIBRATION_TARGET ?auto_5667 ?auto_5668 ) ( not ( = ?auto_5668 ?auto_5663 ) ) ( not ( = ?auto_5666 ?auto_5663 ) ) ( not ( = ?auto_5672 ?auto_5663 ) ) ( ON_BOARD ?auto_5670 ?auto_5669 ) ( POWER_ON ?auto_5670 ) ( not ( = ?auto_5667 ?auto_5670 ) ) ( SUPPORTS ?auto_5670 ?auto_5664 ) ( not ( = ?auto_5671 ?auto_5664 ) ) ( not ( = ?auto_5665 ?auto_5664 ) ) ( POINTING ?auto_5669 ?auto_5668 ) ( CALIBRATION_TARGET ?auto_5670 ?auto_5668 ) ( NOT_CALIBRATED ?auto_5670 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5672 ?auto_5671 ?auto_5666 ?auto_5665 )
      ( GET-2IMAGE-VERIFY ?auto_5663 ?auto_5664 ?auto_5666 ?auto_5665 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_5673 - DIRECTION
      ?auto_5674 - MODE
      ?auto_5676 - DIRECTION
      ?auto_5675 - MODE
    )
    :vars
    (
      ?auto_5679 - INSTRUMENT
      ?auto_5681 - SATELLITE
      ?auto_5680 - DIRECTION
      ?auto_5678 - DIRECTION
      ?auto_5682 - INSTRUMENT
      ?auto_5677 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_5679 ?auto_5681 ) ( SUPPORTS ?auto_5679 ?auto_5674 ) ( not ( = ?auto_5673 ?auto_5680 ) ) ( HAVE_IMAGE ?auto_5676 ?auto_5675 ) ( not ( = ?auto_5676 ?auto_5673 ) ) ( not ( = ?auto_5676 ?auto_5680 ) ) ( not ( = ?auto_5675 ?auto_5674 ) ) ( CALIBRATION_TARGET ?auto_5679 ?auto_5680 ) ( not ( = ?auto_5680 ?auto_5678 ) ) ( not ( = ?auto_5673 ?auto_5678 ) ) ( not ( = ?auto_5676 ?auto_5678 ) ) ( ON_BOARD ?auto_5682 ?auto_5681 ) ( POWER_ON ?auto_5682 ) ( not ( = ?auto_5679 ?auto_5682 ) ) ( SUPPORTS ?auto_5682 ?auto_5677 ) ( not ( = ?auto_5675 ?auto_5677 ) ) ( not ( = ?auto_5674 ?auto_5677 ) ) ( POINTING ?auto_5681 ?auto_5680 ) ( CALIBRATION_TARGET ?auto_5682 ?auto_5680 ) ( NOT_CALIBRATED ?auto_5682 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5676 ?auto_5675 ?auto_5673 ?auto_5674 )
      ( GET-2IMAGE-VERIFY ?auto_5673 ?auto_5674 ?auto_5676 ?auto_5675 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_5683 - DIRECTION
      ?auto_5684 - MODE
      ?auto_5686 - DIRECTION
      ?auto_5685 - MODE
    )
    :vars
    (
      ?auto_5687 - INSTRUMENT
      ?auto_5689 - SATELLITE
      ?auto_5688 - DIRECTION
      ?auto_5692 - DIRECTION
      ?auto_5691 - MODE
      ?auto_5690 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5687 ?auto_5689 ) ( SUPPORTS ?auto_5687 ?auto_5684 ) ( not ( = ?auto_5683 ?auto_5688 ) ) ( HAVE_IMAGE ?auto_5692 ?auto_5691 ) ( not ( = ?auto_5692 ?auto_5683 ) ) ( not ( = ?auto_5692 ?auto_5688 ) ) ( not ( = ?auto_5691 ?auto_5684 ) ) ( CALIBRATION_TARGET ?auto_5687 ?auto_5688 ) ( not ( = ?auto_5688 ?auto_5686 ) ) ( not ( = ?auto_5683 ?auto_5686 ) ) ( not ( = ?auto_5692 ?auto_5686 ) ) ( ON_BOARD ?auto_5690 ?auto_5689 ) ( POWER_ON ?auto_5690 ) ( not ( = ?auto_5687 ?auto_5690 ) ) ( SUPPORTS ?auto_5690 ?auto_5685 ) ( not ( = ?auto_5691 ?auto_5685 ) ) ( not ( = ?auto_5684 ?auto_5685 ) ) ( POINTING ?auto_5689 ?auto_5688 ) ( CALIBRATION_TARGET ?auto_5690 ?auto_5688 ) ( NOT_CALIBRATED ?auto_5690 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5692 ?auto_5691 ?auto_5683 ?auto_5684 )
      ( GET-2IMAGE-VERIFY ?auto_5683 ?auto_5684 ?auto_5686 ?auto_5685 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5705 - DIRECTION
      ?auto_5706 - MODE
      ?auto_5708 - DIRECTION
      ?auto_5707 - MODE
      ?auto_5710 - DIRECTION
      ?auto_5709 - MODE
    )
    :vars
    (
      ?auto_5713 - INSTRUMENT
      ?auto_5715 - SATELLITE
      ?auto_5714 - DIRECTION
      ?auto_5712 - DIRECTION
      ?auto_5716 - INSTRUMENT
      ?auto_5711 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_5713 ?auto_5715 ) ( SUPPORTS ?auto_5713 ?auto_5709 ) ( not ( = ?auto_5710 ?auto_5714 ) ) ( HAVE_IMAGE ?auto_5705 ?auto_5707 ) ( not ( = ?auto_5705 ?auto_5710 ) ) ( not ( = ?auto_5705 ?auto_5714 ) ) ( not ( = ?auto_5707 ?auto_5709 ) ) ( CALIBRATION_TARGET ?auto_5713 ?auto_5714 ) ( not ( = ?auto_5714 ?auto_5712 ) ) ( not ( = ?auto_5710 ?auto_5712 ) ) ( not ( = ?auto_5705 ?auto_5712 ) ) ( ON_BOARD ?auto_5716 ?auto_5715 ) ( POWER_ON ?auto_5716 ) ( not ( = ?auto_5713 ?auto_5716 ) ) ( SUPPORTS ?auto_5716 ?auto_5711 ) ( not ( = ?auto_5707 ?auto_5711 ) ) ( not ( = ?auto_5709 ?auto_5711 ) ) ( POINTING ?auto_5715 ?auto_5714 ) ( CALIBRATION_TARGET ?auto_5716 ?auto_5714 ) ( NOT_CALIBRATED ?auto_5716 ) ( HAVE_IMAGE ?auto_5705 ?auto_5706 ) ( HAVE_IMAGE ?auto_5708 ?auto_5707 ) ( not ( = ?auto_5705 ?auto_5708 ) ) ( not ( = ?auto_5706 ?auto_5707 ) ) ( not ( = ?auto_5706 ?auto_5709 ) ) ( not ( = ?auto_5706 ?auto_5711 ) ) ( not ( = ?auto_5708 ?auto_5710 ) ) ( not ( = ?auto_5708 ?auto_5714 ) ) ( not ( = ?auto_5708 ?auto_5712 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5705 ?auto_5707 ?auto_5710 ?auto_5709 )
      ( GET-3IMAGE-VERIFY ?auto_5705 ?auto_5706 ?auto_5708 ?auto_5707 ?auto_5710 ?auto_5709 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5717 - DIRECTION
      ?auto_5718 - MODE
      ?auto_5720 - DIRECTION
      ?auto_5719 - MODE
      ?auto_5722 - DIRECTION
      ?auto_5721 - MODE
    )
    :vars
    (
      ?auto_5723 - INSTRUMENT
      ?auto_5725 - SATELLITE
      ?auto_5724 - DIRECTION
      ?auto_5726 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5723 ?auto_5725 ) ( SUPPORTS ?auto_5723 ?auto_5721 ) ( not ( = ?auto_5722 ?auto_5724 ) ) ( HAVE_IMAGE ?auto_5717 ?auto_5718 ) ( not ( = ?auto_5717 ?auto_5722 ) ) ( not ( = ?auto_5717 ?auto_5724 ) ) ( not ( = ?auto_5718 ?auto_5721 ) ) ( CALIBRATION_TARGET ?auto_5723 ?auto_5724 ) ( not ( = ?auto_5724 ?auto_5720 ) ) ( not ( = ?auto_5722 ?auto_5720 ) ) ( not ( = ?auto_5717 ?auto_5720 ) ) ( ON_BOARD ?auto_5726 ?auto_5725 ) ( POWER_ON ?auto_5726 ) ( not ( = ?auto_5723 ?auto_5726 ) ) ( SUPPORTS ?auto_5726 ?auto_5719 ) ( not ( = ?auto_5718 ?auto_5719 ) ) ( not ( = ?auto_5721 ?auto_5719 ) ) ( POINTING ?auto_5725 ?auto_5724 ) ( CALIBRATION_TARGET ?auto_5726 ?auto_5724 ) ( NOT_CALIBRATED ?auto_5726 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5717 ?auto_5718 ?auto_5722 ?auto_5721 )
      ( GET-3IMAGE-VERIFY ?auto_5717 ?auto_5718 ?auto_5720 ?auto_5719 ?auto_5722 ?auto_5721 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5727 - DIRECTION
      ?auto_5728 - MODE
      ?auto_5730 - DIRECTION
      ?auto_5729 - MODE
      ?auto_5732 - DIRECTION
      ?auto_5731 - MODE
    )
    :vars
    (
      ?auto_5735 - INSTRUMENT
      ?auto_5737 - SATELLITE
      ?auto_5736 - DIRECTION
      ?auto_5734 - DIRECTION
      ?auto_5738 - INSTRUMENT
      ?auto_5733 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_5735 ?auto_5737 ) ( SUPPORTS ?auto_5735 ?auto_5729 ) ( not ( = ?auto_5730 ?auto_5736 ) ) ( HAVE_IMAGE ?auto_5732 ?auto_5731 ) ( not ( = ?auto_5732 ?auto_5730 ) ) ( not ( = ?auto_5732 ?auto_5736 ) ) ( not ( = ?auto_5731 ?auto_5729 ) ) ( CALIBRATION_TARGET ?auto_5735 ?auto_5736 ) ( not ( = ?auto_5736 ?auto_5734 ) ) ( not ( = ?auto_5730 ?auto_5734 ) ) ( not ( = ?auto_5732 ?auto_5734 ) ) ( ON_BOARD ?auto_5738 ?auto_5737 ) ( POWER_ON ?auto_5738 ) ( not ( = ?auto_5735 ?auto_5738 ) ) ( SUPPORTS ?auto_5738 ?auto_5733 ) ( not ( = ?auto_5731 ?auto_5733 ) ) ( not ( = ?auto_5729 ?auto_5733 ) ) ( POINTING ?auto_5737 ?auto_5736 ) ( CALIBRATION_TARGET ?auto_5738 ?auto_5736 ) ( NOT_CALIBRATED ?auto_5738 ) ( HAVE_IMAGE ?auto_5727 ?auto_5728 ) ( not ( = ?auto_5727 ?auto_5730 ) ) ( not ( = ?auto_5727 ?auto_5732 ) ) ( not ( = ?auto_5727 ?auto_5736 ) ) ( not ( = ?auto_5727 ?auto_5734 ) ) ( not ( = ?auto_5728 ?auto_5729 ) ) ( not ( = ?auto_5728 ?auto_5731 ) ) ( not ( = ?auto_5728 ?auto_5733 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5732 ?auto_5731 ?auto_5730 ?auto_5729 )
      ( GET-3IMAGE-VERIFY ?auto_5727 ?auto_5728 ?auto_5730 ?auto_5729 ?auto_5732 ?auto_5731 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5739 - DIRECTION
      ?auto_5740 - MODE
      ?auto_5742 - DIRECTION
      ?auto_5741 - MODE
      ?auto_5744 - DIRECTION
      ?auto_5743 - MODE
    )
    :vars
    (
      ?auto_5745 - INSTRUMENT
      ?auto_5747 - SATELLITE
      ?auto_5746 - DIRECTION
      ?auto_5748 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5745 ?auto_5747 ) ( SUPPORTS ?auto_5745 ?auto_5741 ) ( not ( = ?auto_5742 ?auto_5746 ) ) ( HAVE_IMAGE ?auto_5739 ?auto_5740 ) ( not ( = ?auto_5739 ?auto_5742 ) ) ( not ( = ?auto_5739 ?auto_5746 ) ) ( not ( = ?auto_5740 ?auto_5741 ) ) ( CALIBRATION_TARGET ?auto_5745 ?auto_5746 ) ( not ( = ?auto_5746 ?auto_5744 ) ) ( not ( = ?auto_5742 ?auto_5744 ) ) ( not ( = ?auto_5739 ?auto_5744 ) ) ( ON_BOARD ?auto_5748 ?auto_5747 ) ( POWER_ON ?auto_5748 ) ( not ( = ?auto_5745 ?auto_5748 ) ) ( SUPPORTS ?auto_5748 ?auto_5743 ) ( not ( = ?auto_5740 ?auto_5743 ) ) ( not ( = ?auto_5741 ?auto_5743 ) ) ( POINTING ?auto_5747 ?auto_5746 ) ( CALIBRATION_TARGET ?auto_5748 ?auto_5746 ) ( NOT_CALIBRATED ?auto_5748 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5739 ?auto_5740 ?auto_5742 ?auto_5741 )
      ( GET-3IMAGE-VERIFY ?auto_5739 ?auto_5740 ?auto_5742 ?auto_5741 ?auto_5744 ?auto_5743 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5761 - DIRECTION
      ?auto_5762 - MODE
      ?auto_5764 - DIRECTION
      ?auto_5763 - MODE
      ?auto_5766 - DIRECTION
      ?auto_5765 - MODE
    )
    :vars
    (
      ?auto_5767 - INSTRUMENT
      ?auto_5769 - SATELLITE
      ?auto_5768 - DIRECTION
      ?auto_5770 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5767 ?auto_5769 ) ( SUPPORTS ?auto_5767 ?auto_5765 ) ( not ( = ?auto_5766 ?auto_5768 ) ) ( HAVE_IMAGE ?auto_5764 ?auto_5763 ) ( not ( = ?auto_5764 ?auto_5766 ) ) ( not ( = ?auto_5764 ?auto_5768 ) ) ( not ( = ?auto_5763 ?auto_5765 ) ) ( CALIBRATION_TARGET ?auto_5767 ?auto_5768 ) ( not ( = ?auto_5768 ?auto_5761 ) ) ( not ( = ?auto_5766 ?auto_5761 ) ) ( not ( = ?auto_5764 ?auto_5761 ) ) ( ON_BOARD ?auto_5770 ?auto_5769 ) ( POWER_ON ?auto_5770 ) ( not ( = ?auto_5767 ?auto_5770 ) ) ( SUPPORTS ?auto_5770 ?auto_5762 ) ( not ( = ?auto_5763 ?auto_5762 ) ) ( not ( = ?auto_5765 ?auto_5762 ) ) ( POINTING ?auto_5769 ?auto_5768 ) ( CALIBRATION_TARGET ?auto_5770 ?auto_5768 ) ( NOT_CALIBRATED ?auto_5770 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5764 ?auto_5763 ?auto_5766 ?auto_5765 )
      ( GET-3IMAGE-VERIFY ?auto_5761 ?auto_5762 ?auto_5764 ?auto_5763 ?auto_5766 ?auto_5765 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5783 - DIRECTION
      ?auto_5784 - MODE
      ?auto_5786 - DIRECTION
      ?auto_5785 - MODE
      ?auto_5788 - DIRECTION
      ?auto_5787 - MODE
    )
    :vars
    (
      ?auto_5789 - INSTRUMENT
      ?auto_5791 - SATELLITE
      ?auto_5790 - DIRECTION
      ?auto_5792 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5789 ?auto_5791 ) ( SUPPORTS ?auto_5789 ?auto_5785 ) ( not ( = ?auto_5786 ?auto_5790 ) ) ( HAVE_IMAGE ?auto_5788 ?auto_5787 ) ( not ( = ?auto_5788 ?auto_5786 ) ) ( not ( = ?auto_5788 ?auto_5790 ) ) ( not ( = ?auto_5787 ?auto_5785 ) ) ( CALIBRATION_TARGET ?auto_5789 ?auto_5790 ) ( not ( = ?auto_5790 ?auto_5783 ) ) ( not ( = ?auto_5786 ?auto_5783 ) ) ( not ( = ?auto_5788 ?auto_5783 ) ) ( ON_BOARD ?auto_5792 ?auto_5791 ) ( POWER_ON ?auto_5792 ) ( not ( = ?auto_5789 ?auto_5792 ) ) ( SUPPORTS ?auto_5792 ?auto_5784 ) ( not ( = ?auto_5787 ?auto_5784 ) ) ( not ( = ?auto_5785 ?auto_5784 ) ) ( POINTING ?auto_5791 ?auto_5790 ) ( CALIBRATION_TARGET ?auto_5792 ?auto_5790 ) ( NOT_CALIBRATED ?auto_5792 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5788 ?auto_5787 ?auto_5786 ?auto_5785 )
      ( GET-3IMAGE-VERIFY ?auto_5783 ?auto_5784 ?auto_5786 ?auto_5785 ?auto_5788 ?auto_5787 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5817 - DIRECTION
      ?auto_5818 - MODE
      ?auto_5820 - DIRECTION
      ?auto_5819 - MODE
      ?auto_5822 - DIRECTION
      ?auto_5821 - MODE
    )
    :vars
    (
      ?auto_5825 - INSTRUMENT
      ?auto_5827 - SATELLITE
      ?auto_5826 - DIRECTION
      ?auto_5824 - DIRECTION
      ?auto_5828 - INSTRUMENT
      ?auto_5823 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_5825 ?auto_5827 ) ( SUPPORTS ?auto_5825 ?auto_5818 ) ( not ( = ?auto_5817 ?auto_5826 ) ) ( HAVE_IMAGE ?auto_5820 ?auto_5819 ) ( not ( = ?auto_5820 ?auto_5817 ) ) ( not ( = ?auto_5820 ?auto_5826 ) ) ( not ( = ?auto_5819 ?auto_5818 ) ) ( CALIBRATION_TARGET ?auto_5825 ?auto_5826 ) ( not ( = ?auto_5826 ?auto_5824 ) ) ( not ( = ?auto_5817 ?auto_5824 ) ) ( not ( = ?auto_5820 ?auto_5824 ) ) ( ON_BOARD ?auto_5828 ?auto_5827 ) ( POWER_ON ?auto_5828 ) ( not ( = ?auto_5825 ?auto_5828 ) ) ( SUPPORTS ?auto_5828 ?auto_5823 ) ( not ( = ?auto_5819 ?auto_5823 ) ) ( not ( = ?auto_5818 ?auto_5823 ) ) ( POINTING ?auto_5827 ?auto_5826 ) ( CALIBRATION_TARGET ?auto_5828 ?auto_5826 ) ( NOT_CALIBRATED ?auto_5828 ) ( HAVE_IMAGE ?auto_5822 ?auto_5821 ) ( not ( = ?auto_5817 ?auto_5822 ) ) ( not ( = ?auto_5818 ?auto_5821 ) ) ( not ( = ?auto_5820 ?auto_5822 ) ) ( not ( = ?auto_5819 ?auto_5821 ) ) ( not ( = ?auto_5822 ?auto_5826 ) ) ( not ( = ?auto_5822 ?auto_5824 ) ) ( not ( = ?auto_5821 ?auto_5823 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5820 ?auto_5819 ?auto_5817 ?auto_5818 )
      ( GET-3IMAGE-VERIFY ?auto_5817 ?auto_5818 ?auto_5820 ?auto_5819 ?auto_5822 ?auto_5821 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5829 - DIRECTION
      ?auto_5830 - MODE
      ?auto_5832 - DIRECTION
      ?auto_5831 - MODE
      ?auto_5834 - DIRECTION
      ?auto_5833 - MODE
    )
    :vars
    (
      ?auto_5835 - INSTRUMENT
      ?auto_5837 - SATELLITE
      ?auto_5836 - DIRECTION
      ?auto_5838 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5835 ?auto_5837 ) ( SUPPORTS ?auto_5835 ?auto_5830 ) ( not ( = ?auto_5829 ?auto_5836 ) ) ( HAVE_IMAGE ?auto_5832 ?auto_5831 ) ( not ( = ?auto_5832 ?auto_5829 ) ) ( not ( = ?auto_5832 ?auto_5836 ) ) ( not ( = ?auto_5831 ?auto_5830 ) ) ( CALIBRATION_TARGET ?auto_5835 ?auto_5836 ) ( not ( = ?auto_5836 ?auto_5834 ) ) ( not ( = ?auto_5829 ?auto_5834 ) ) ( not ( = ?auto_5832 ?auto_5834 ) ) ( ON_BOARD ?auto_5838 ?auto_5837 ) ( POWER_ON ?auto_5838 ) ( not ( = ?auto_5835 ?auto_5838 ) ) ( SUPPORTS ?auto_5838 ?auto_5833 ) ( not ( = ?auto_5831 ?auto_5833 ) ) ( not ( = ?auto_5830 ?auto_5833 ) ) ( POINTING ?auto_5837 ?auto_5836 ) ( CALIBRATION_TARGET ?auto_5838 ?auto_5836 ) ( NOT_CALIBRATED ?auto_5838 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5832 ?auto_5831 ?auto_5829 ?auto_5830 )
      ( GET-3IMAGE-VERIFY ?auto_5829 ?auto_5830 ?auto_5832 ?auto_5831 ?auto_5834 ?auto_5833 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5851 - DIRECTION
      ?auto_5852 - MODE
      ?auto_5854 - DIRECTION
      ?auto_5853 - MODE
      ?auto_5856 - DIRECTION
      ?auto_5855 - MODE
    )
    :vars
    (
      ?auto_5857 - INSTRUMENT
      ?auto_5859 - SATELLITE
      ?auto_5858 - DIRECTION
      ?auto_5860 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5857 ?auto_5859 ) ( SUPPORTS ?auto_5857 ?auto_5852 ) ( not ( = ?auto_5851 ?auto_5858 ) ) ( HAVE_IMAGE ?auto_5856 ?auto_5855 ) ( not ( = ?auto_5856 ?auto_5851 ) ) ( not ( = ?auto_5856 ?auto_5858 ) ) ( not ( = ?auto_5855 ?auto_5852 ) ) ( CALIBRATION_TARGET ?auto_5857 ?auto_5858 ) ( not ( = ?auto_5858 ?auto_5854 ) ) ( not ( = ?auto_5851 ?auto_5854 ) ) ( not ( = ?auto_5856 ?auto_5854 ) ) ( ON_BOARD ?auto_5860 ?auto_5859 ) ( POWER_ON ?auto_5860 ) ( not ( = ?auto_5857 ?auto_5860 ) ) ( SUPPORTS ?auto_5860 ?auto_5853 ) ( not ( = ?auto_5855 ?auto_5853 ) ) ( not ( = ?auto_5852 ?auto_5853 ) ) ( POINTING ?auto_5859 ?auto_5858 ) ( CALIBRATION_TARGET ?auto_5860 ?auto_5858 ) ( NOT_CALIBRATED ?auto_5860 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5856 ?auto_5855 ?auto_5851 ?auto_5852 )
      ( GET-3IMAGE-VERIFY ?auto_5851 ?auto_5852 ?auto_5854 ?auto_5853 ?auto_5856 ?auto_5855 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_5923 - DIRECTION
      ?auto_5924 - MODE
    )
    :vars
    (
      ?auto_5927 - INSTRUMENT
      ?auto_5929 - SATELLITE
      ?auto_5928 - DIRECTION
      ?auto_5932 - DIRECTION
      ?auto_5931 - MODE
      ?auto_5926 - DIRECTION
      ?auto_5930 - INSTRUMENT
      ?auto_5925 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_5927 ?auto_5929 ) ( SUPPORTS ?auto_5927 ?auto_5924 ) ( not ( = ?auto_5923 ?auto_5928 ) ) ( HAVE_IMAGE ?auto_5932 ?auto_5931 ) ( not ( = ?auto_5932 ?auto_5923 ) ) ( not ( = ?auto_5932 ?auto_5928 ) ) ( not ( = ?auto_5931 ?auto_5924 ) ) ( CALIBRATION_TARGET ?auto_5927 ?auto_5928 ) ( not ( = ?auto_5928 ?auto_5926 ) ) ( not ( = ?auto_5923 ?auto_5926 ) ) ( not ( = ?auto_5932 ?auto_5926 ) ) ( ON_BOARD ?auto_5930 ?auto_5929 ) ( not ( = ?auto_5927 ?auto_5930 ) ) ( SUPPORTS ?auto_5930 ?auto_5925 ) ( not ( = ?auto_5931 ?auto_5925 ) ) ( not ( = ?auto_5924 ?auto_5925 ) ) ( POINTING ?auto_5929 ?auto_5928 ) ( CALIBRATION_TARGET ?auto_5930 ?auto_5928 ) ( POWER_AVAIL ?auto_5929 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_5930 ?auto_5929 )
      ( GET-2IMAGE ?auto_5932 ?auto_5931 ?auto_5923 ?auto_5924 )
      ( GET-1IMAGE-VERIFY ?auto_5923 ?auto_5924 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_5933 - DIRECTION
      ?auto_5934 - MODE
      ?auto_5936 - DIRECTION
      ?auto_5935 - MODE
    )
    :vars
    (
      ?auto_5940 - INSTRUMENT
      ?auto_5941 - SATELLITE
      ?auto_5942 - DIRECTION
      ?auto_5938 - DIRECTION
      ?auto_5937 - INSTRUMENT
      ?auto_5939 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_5940 ?auto_5941 ) ( SUPPORTS ?auto_5940 ?auto_5935 ) ( not ( = ?auto_5936 ?auto_5942 ) ) ( HAVE_IMAGE ?auto_5933 ?auto_5934 ) ( not ( = ?auto_5933 ?auto_5936 ) ) ( not ( = ?auto_5933 ?auto_5942 ) ) ( not ( = ?auto_5934 ?auto_5935 ) ) ( CALIBRATION_TARGET ?auto_5940 ?auto_5942 ) ( not ( = ?auto_5942 ?auto_5938 ) ) ( not ( = ?auto_5936 ?auto_5938 ) ) ( not ( = ?auto_5933 ?auto_5938 ) ) ( ON_BOARD ?auto_5937 ?auto_5941 ) ( not ( = ?auto_5940 ?auto_5937 ) ) ( SUPPORTS ?auto_5937 ?auto_5939 ) ( not ( = ?auto_5934 ?auto_5939 ) ) ( not ( = ?auto_5935 ?auto_5939 ) ) ( POINTING ?auto_5941 ?auto_5942 ) ( CALIBRATION_TARGET ?auto_5937 ?auto_5942 ) ( POWER_AVAIL ?auto_5941 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_5936 ?auto_5935 )
      ( GET-2IMAGE-VERIFY ?auto_5933 ?auto_5934 ?auto_5936 ?auto_5935 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_5943 - DIRECTION
      ?auto_5944 - MODE
      ?auto_5946 - DIRECTION
      ?auto_5945 - MODE
    )
    :vars
    (
      ?auto_5947 - INSTRUMENT
      ?auto_5950 - SATELLITE
      ?auto_5949 - DIRECTION
      ?auto_5952 - DIRECTION
      ?auto_5951 - MODE
      ?auto_5948 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5947 ?auto_5950 ) ( SUPPORTS ?auto_5947 ?auto_5945 ) ( not ( = ?auto_5946 ?auto_5949 ) ) ( HAVE_IMAGE ?auto_5952 ?auto_5951 ) ( not ( = ?auto_5952 ?auto_5946 ) ) ( not ( = ?auto_5952 ?auto_5949 ) ) ( not ( = ?auto_5951 ?auto_5945 ) ) ( CALIBRATION_TARGET ?auto_5947 ?auto_5949 ) ( not ( = ?auto_5949 ?auto_5943 ) ) ( not ( = ?auto_5946 ?auto_5943 ) ) ( not ( = ?auto_5952 ?auto_5943 ) ) ( ON_BOARD ?auto_5948 ?auto_5950 ) ( not ( = ?auto_5947 ?auto_5948 ) ) ( SUPPORTS ?auto_5948 ?auto_5944 ) ( not ( = ?auto_5951 ?auto_5944 ) ) ( not ( = ?auto_5945 ?auto_5944 ) ) ( POINTING ?auto_5950 ?auto_5949 ) ( CALIBRATION_TARGET ?auto_5948 ?auto_5949 ) ( POWER_AVAIL ?auto_5950 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5952 ?auto_5951 ?auto_5946 ?auto_5945 )
      ( GET-2IMAGE-VERIFY ?auto_5943 ?auto_5944 ?auto_5946 ?auto_5945 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_5953 - DIRECTION
      ?auto_5954 - MODE
      ?auto_5956 - DIRECTION
      ?auto_5955 - MODE
    )
    :vars
    (
      ?auto_5957 - INSTRUMENT
      ?auto_5962 - SATELLITE
      ?auto_5960 - DIRECTION
      ?auto_5959 - DIRECTION
      ?auto_5958 - INSTRUMENT
      ?auto_5961 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_5957 ?auto_5962 ) ( SUPPORTS ?auto_5957 ?auto_5954 ) ( not ( = ?auto_5953 ?auto_5960 ) ) ( HAVE_IMAGE ?auto_5956 ?auto_5955 ) ( not ( = ?auto_5956 ?auto_5953 ) ) ( not ( = ?auto_5956 ?auto_5960 ) ) ( not ( = ?auto_5955 ?auto_5954 ) ) ( CALIBRATION_TARGET ?auto_5957 ?auto_5960 ) ( not ( = ?auto_5960 ?auto_5959 ) ) ( not ( = ?auto_5953 ?auto_5959 ) ) ( not ( = ?auto_5956 ?auto_5959 ) ) ( ON_BOARD ?auto_5958 ?auto_5962 ) ( not ( = ?auto_5957 ?auto_5958 ) ) ( SUPPORTS ?auto_5958 ?auto_5961 ) ( not ( = ?auto_5955 ?auto_5961 ) ) ( not ( = ?auto_5954 ?auto_5961 ) ) ( POINTING ?auto_5962 ?auto_5960 ) ( CALIBRATION_TARGET ?auto_5958 ?auto_5960 ) ( POWER_AVAIL ?auto_5962 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5956 ?auto_5955 ?auto_5953 ?auto_5954 )
      ( GET-2IMAGE-VERIFY ?auto_5953 ?auto_5954 ?auto_5956 ?auto_5955 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_5963 - DIRECTION
      ?auto_5964 - MODE
      ?auto_5966 - DIRECTION
      ?auto_5965 - MODE
    )
    :vars
    (
      ?auto_5967 - INSTRUMENT
      ?auto_5970 - SATELLITE
      ?auto_5969 - DIRECTION
      ?auto_5972 - DIRECTION
      ?auto_5971 - MODE
      ?auto_5968 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5967 ?auto_5970 ) ( SUPPORTS ?auto_5967 ?auto_5964 ) ( not ( = ?auto_5963 ?auto_5969 ) ) ( HAVE_IMAGE ?auto_5972 ?auto_5971 ) ( not ( = ?auto_5972 ?auto_5963 ) ) ( not ( = ?auto_5972 ?auto_5969 ) ) ( not ( = ?auto_5971 ?auto_5964 ) ) ( CALIBRATION_TARGET ?auto_5967 ?auto_5969 ) ( not ( = ?auto_5969 ?auto_5966 ) ) ( not ( = ?auto_5963 ?auto_5966 ) ) ( not ( = ?auto_5972 ?auto_5966 ) ) ( ON_BOARD ?auto_5968 ?auto_5970 ) ( not ( = ?auto_5967 ?auto_5968 ) ) ( SUPPORTS ?auto_5968 ?auto_5965 ) ( not ( = ?auto_5971 ?auto_5965 ) ) ( not ( = ?auto_5964 ?auto_5965 ) ) ( POINTING ?auto_5970 ?auto_5969 ) ( CALIBRATION_TARGET ?auto_5968 ?auto_5969 ) ( POWER_AVAIL ?auto_5970 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5972 ?auto_5971 ?auto_5963 ?auto_5964 )
      ( GET-2IMAGE-VERIFY ?auto_5963 ?auto_5964 ?auto_5966 ?auto_5965 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5985 - DIRECTION
      ?auto_5986 - MODE
      ?auto_5988 - DIRECTION
      ?auto_5987 - MODE
      ?auto_5990 - DIRECTION
      ?auto_5989 - MODE
    )
    :vars
    (
      ?auto_5991 - INSTRUMENT
      ?auto_5996 - SATELLITE
      ?auto_5994 - DIRECTION
      ?auto_5993 - DIRECTION
      ?auto_5992 - INSTRUMENT
      ?auto_5995 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_5991 ?auto_5996 ) ( SUPPORTS ?auto_5991 ?auto_5989 ) ( not ( = ?auto_5990 ?auto_5994 ) ) ( HAVE_IMAGE ?auto_5985 ?auto_5986 ) ( not ( = ?auto_5985 ?auto_5990 ) ) ( not ( = ?auto_5985 ?auto_5994 ) ) ( not ( = ?auto_5986 ?auto_5989 ) ) ( CALIBRATION_TARGET ?auto_5991 ?auto_5994 ) ( not ( = ?auto_5994 ?auto_5993 ) ) ( not ( = ?auto_5990 ?auto_5993 ) ) ( not ( = ?auto_5985 ?auto_5993 ) ) ( ON_BOARD ?auto_5992 ?auto_5996 ) ( not ( = ?auto_5991 ?auto_5992 ) ) ( SUPPORTS ?auto_5992 ?auto_5995 ) ( not ( = ?auto_5986 ?auto_5995 ) ) ( not ( = ?auto_5989 ?auto_5995 ) ) ( POINTING ?auto_5996 ?auto_5994 ) ( CALIBRATION_TARGET ?auto_5992 ?auto_5994 ) ( POWER_AVAIL ?auto_5996 ) ( HAVE_IMAGE ?auto_5988 ?auto_5987 ) ( not ( = ?auto_5985 ?auto_5988 ) ) ( not ( = ?auto_5986 ?auto_5987 ) ) ( not ( = ?auto_5988 ?auto_5990 ) ) ( not ( = ?auto_5988 ?auto_5994 ) ) ( not ( = ?auto_5988 ?auto_5993 ) ) ( not ( = ?auto_5987 ?auto_5989 ) ) ( not ( = ?auto_5987 ?auto_5995 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5985 ?auto_5986 ?auto_5990 ?auto_5989 )
      ( GET-3IMAGE-VERIFY ?auto_5985 ?auto_5986 ?auto_5988 ?auto_5987 ?auto_5990 ?auto_5989 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5997 - DIRECTION
      ?auto_5998 - MODE
      ?auto_6000 - DIRECTION
      ?auto_5999 - MODE
      ?auto_6002 - DIRECTION
      ?auto_6001 - MODE
    )
    :vars
    (
      ?auto_6003 - INSTRUMENT
      ?auto_6006 - SATELLITE
      ?auto_6005 - DIRECTION
      ?auto_6004 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6003 ?auto_6006 ) ( SUPPORTS ?auto_6003 ?auto_6001 ) ( not ( = ?auto_6002 ?auto_6005 ) ) ( HAVE_IMAGE ?auto_5997 ?auto_5998 ) ( not ( = ?auto_5997 ?auto_6002 ) ) ( not ( = ?auto_5997 ?auto_6005 ) ) ( not ( = ?auto_5998 ?auto_6001 ) ) ( CALIBRATION_TARGET ?auto_6003 ?auto_6005 ) ( not ( = ?auto_6005 ?auto_6000 ) ) ( not ( = ?auto_6002 ?auto_6000 ) ) ( not ( = ?auto_5997 ?auto_6000 ) ) ( ON_BOARD ?auto_6004 ?auto_6006 ) ( not ( = ?auto_6003 ?auto_6004 ) ) ( SUPPORTS ?auto_6004 ?auto_5999 ) ( not ( = ?auto_5998 ?auto_5999 ) ) ( not ( = ?auto_6001 ?auto_5999 ) ) ( POINTING ?auto_6006 ?auto_6005 ) ( CALIBRATION_TARGET ?auto_6004 ?auto_6005 ) ( POWER_AVAIL ?auto_6006 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5997 ?auto_5998 ?auto_6002 ?auto_6001 )
      ( GET-3IMAGE-VERIFY ?auto_5997 ?auto_5998 ?auto_6000 ?auto_5999 ?auto_6002 ?auto_6001 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6007 - DIRECTION
      ?auto_6008 - MODE
      ?auto_6010 - DIRECTION
      ?auto_6009 - MODE
      ?auto_6012 - DIRECTION
      ?auto_6011 - MODE
    )
    :vars
    (
      ?auto_6013 - INSTRUMENT
      ?auto_6018 - SATELLITE
      ?auto_6016 - DIRECTION
      ?auto_6015 - DIRECTION
      ?auto_6014 - INSTRUMENT
      ?auto_6017 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_6013 ?auto_6018 ) ( SUPPORTS ?auto_6013 ?auto_6009 ) ( not ( = ?auto_6010 ?auto_6016 ) ) ( HAVE_IMAGE ?auto_6012 ?auto_6011 ) ( not ( = ?auto_6012 ?auto_6010 ) ) ( not ( = ?auto_6012 ?auto_6016 ) ) ( not ( = ?auto_6011 ?auto_6009 ) ) ( CALIBRATION_TARGET ?auto_6013 ?auto_6016 ) ( not ( = ?auto_6016 ?auto_6015 ) ) ( not ( = ?auto_6010 ?auto_6015 ) ) ( not ( = ?auto_6012 ?auto_6015 ) ) ( ON_BOARD ?auto_6014 ?auto_6018 ) ( not ( = ?auto_6013 ?auto_6014 ) ) ( SUPPORTS ?auto_6014 ?auto_6017 ) ( not ( = ?auto_6011 ?auto_6017 ) ) ( not ( = ?auto_6009 ?auto_6017 ) ) ( POINTING ?auto_6018 ?auto_6016 ) ( CALIBRATION_TARGET ?auto_6014 ?auto_6016 ) ( POWER_AVAIL ?auto_6018 ) ( HAVE_IMAGE ?auto_6007 ?auto_6008 ) ( not ( = ?auto_6007 ?auto_6010 ) ) ( not ( = ?auto_6007 ?auto_6012 ) ) ( not ( = ?auto_6007 ?auto_6016 ) ) ( not ( = ?auto_6007 ?auto_6015 ) ) ( not ( = ?auto_6008 ?auto_6009 ) ) ( not ( = ?auto_6008 ?auto_6011 ) ) ( not ( = ?auto_6008 ?auto_6017 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6012 ?auto_6011 ?auto_6010 ?auto_6009 )
      ( GET-3IMAGE-VERIFY ?auto_6007 ?auto_6008 ?auto_6010 ?auto_6009 ?auto_6012 ?auto_6011 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6019 - DIRECTION
      ?auto_6020 - MODE
      ?auto_6022 - DIRECTION
      ?auto_6021 - MODE
      ?auto_6024 - DIRECTION
      ?auto_6023 - MODE
    )
    :vars
    (
      ?auto_6025 - INSTRUMENT
      ?auto_6028 - SATELLITE
      ?auto_6027 - DIRECTION
      ?auto_6026 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6025 ?auto_6028 ) ( SUPPORTS ?auto_6025 ?auto_6021 ) ( not ( = ?auto_6022 ?auto_6027 ) ) ( HAVE_IMAGE ?auto_6019 ?auto_6020 ) ( not ( = ?auto_6019 ?auto_6022 ) ) ( not ( = ?auto_6019 ?auto_6027 ) ) ( not ( = ?auto_6020 ?auto_6021 ) ) ( CALIBRATION_TARGET ?auto_6025 ?auto_6027 ) ( not ( = ?auto_6027 ?auto_6024 ) ) ( not ( = ?auto_6022 ?auto_6024 ) ) ( not ( = ?auto_6019 ?auto_6024 ) ) ( ON_BOARD ?auto_6026 ?auto_6028 ) ( not ( = ?auto_6025 ?auto_6026 ) ) ( SUPPORTS ?auto_6026 ?auto_6023 ) ( not ( = ?auto_6020 ?auto_6023 ) ) ( not ( = ?auto_6021 ?auto_6023 ) ) ( POINTING ?auto_6028 ?auto_6027 ) ( CALIBRATION_TARGET ?auto_6026 ?auto_6027 ) ( POWER_AVAIL ?auto_6028 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6019 ?auto_6020 ?auto_6022 ?auto_6021 )
      ( GET-3IMAGE-VERIFY ?auto_6019 ?auto_6020 ?auto_6022 ?auto_6021 ?auto_6024 ?auto_6023 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6041 - DIRECTION
      ?auto_6042 - MODE
      ?auto_6044 - DIRECTION
      ?auto_6043 - MODE
      ?auto_6046 - DIRECTION
      ?auto_6045 - MODE
    )
    :vars
    (
      ?auto_6047 - INSTRUMENT
      ?auto_6050 - SATELLITE
      ?auto_6049 - DIRECTION
      ?auto_6048 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6047 ?auto_6050 ) ( SUPPORTS ?auto_6047 ?auto_6045 ) ( not ( = ?auto_6046 ?auto_6049 ) ) ( HAVE_IMAGE ?auto_6044 ?auto_6043 ) ( not ( = ?auto_6044 ?auto_6046 ) ) ( not ( = ?auto_6044 ?auto_6049 ) ) ( not ( = ?auto_6043 ?auto_6045 ) ) ( CALIBRATION_TARGET ?auto_6047 ?auto_6049 ) ( not ( = ?auto_6049 ?auto_6041 ) ) ( not ( = ?auto_6046 ?auto_6041 ) ) ( not ( = ?auto_6044 ?auto_6041 ) ) ( ON_BOARD ?auto_6048 ?auto_6050 ) ( not ( = ?auto_6047 ?auto_6048 ) ) ( SUPPORTS ?auto_6048 ?auto_6042 ) ( not ( = ?auto_6043 ?auto_6042 ) ) ( not ( = ?auto_6045 ?auto_6042 ) ) ( POINTING ?auto_6050 ?auto_6049 ) ( CALIBRATION_TARGET ?auto_6048 ?auto_6049 ) ( POWER_AVAIL ?auto_6050 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6044 ?auto_6043 ?auto_6046 ?auto_6045 )
      ( GET-3IMAGE-VERIFY ?auto_6041 ?auto_6042 ?auto_6044 ?auto_6043 ?auto_6046 ?auto_6045 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6063 - DIRECTION
      ?auto_6064 - MODE
      ?auto_6066 - DIRECTION
      ?auto_6065 - MODE
      ?auto_6068 - DIRECTION
      ?auto_6067 - MODE
    )
    :vars
    (
      ?auto_6069 - INSTRUMENT
      ?auto_6072 - SATELLITE
      ?auto_6071 - DIRECTION
      ?auto_6070 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6069 ?auto_6072 ) ( SUPPORTS ?auto_6069 ?auto_6065 ) ( not ( = ?auto_6066 ?auto_6071 ) ) ( HAVE_IMAGE ?auto_6068 ?auto_6067 ) ( not ( = ?auto_6068 ?auto_6066 ) ) ( not ( = ?auto_6068 ?auto_6071 ) ) ( not ( = ?auto_6067 ?auto_6065 ) ) ( CALIBRATION_TARGET ?auto_6069 ?auto_6071 ) ( not ( = ?auto_6071 ?auto_6063 ) ) ( not ( = ?auto_6066 ?auto_6063 ) ) ( not ( = ?auto_6068 ?auto_6063 ) ) ( ON_BOARD ?auto_6070 ?auto_6072 ) ( not ( = ?auto_6069 ?auto_6070 ) ) ( SUPPORTS ?auto_6070 ?auto_6064 ) ( not ( = ?auto_6067 ?auto_6064 ) ) ( not ( = ?auto_6065 ?auto_6064 ) ) ( POINTING ?auto_6072 ?auto_6071 ) ( CALIBRATION_TARGET ?auto_6070 ?auto_6071 ) ( POWER_AVAIL ?auto_6072 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6068 ?auto_6067 ?auto_6066 ?auto_6065 )
      ( GET-3IMAGE-VERIFY ?auto_6063 ?auto_6064 ?auto_6066 ?auto_6065 ?auto_6068 ?auto_6067 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6097 - DIRECTION
      ?auto_6098 - MODE
      ?auto_6100 - DIRECTION
      ?auto_6099 - MODE
      ?auto_6102 - DIRECTION
      ?auto_6101 - MODE
    )
    :vars
    (
      ?auto_6103 - INSTRUMENT
      ?auto_6108 - SATELLITE
      ?auto_6106 - DIRECTION
      ?auto_6105 - DIRECTION
      ?auto_6104 - INSTRUMENT
      ?auto_6107 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_6103 ?auto_6108 ) ( SUPPORTS ?auto_6103 ?auto_6098 ) ( not ( = ?auto_6097 ?auto_6106 ) ) ( HAVE_IMAGE ?auto_6100 ?auto_6101 ) ( not ( = ?auto_6100 ?auto_6097 ) ) ( not ( = ?auto_6100 ?auto_6106 ) ) ( not ( = ?auto_6101 ?auto_6098 ) ) ( CALIBRATION_TARGET ?auto_6103 ?auto_6106 ) ( not ( = ?auto_6106 ?auto_6105 ) ) ( not ( = ?auto_6097 ?auto_6105 ) ) ( not ( = ?auto_6100 ?auto_6105 ) ) ( ON_BOARD ?auto_6104 ?auto_6108 ) ( not ( = ?auto_6103 ?auto_6104 ) ) ( SUPPORTS ?auto_6104 ?auto_6107 ) ( not ( = ?auto_6101 ?auto_6107 ) ) ( not ( = ?auto_6098 ?auto_6107 ) ) ( POINTING ?auto_6108 ?auto_6106 ) ( CALIBRATION_TARGET ?auto_6104 ?auto_6106 ) ( POWER_AVAIL ?auto_6108 ) ( HAVE_IMAGE ?auto_6100 ?auto_6099 ) ( HAVE_IMAGE ?auto_6102 ?auto_6101 ) ( not ( = ?auto_6097 ?auto_6102 ) ) ( not ( = ?auto_6098 ?auto_6099 ) ) ( not ( = ?auto_6100 ?auto_6102 ) ) ( not ( = ?auto_6099 ?auto_6101 ) ) ( not ( = ?auto_6099 ?auto_6107 ) ) ( not ( = ?auto_6102 ?auto_6106 ) ) ( not ( = ?auto_6102 ?auto_6105 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6100 ?auto_6101 ?auto_6097 ?auto_6098 )
      ( GET-3IMAGE-VERIFY ?auto_6097 ?auto_6098 ?auto_6100 ?auto_6099 ?auto_6102 ?auto_6101 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6109 - DIRECTION
      ?auto_6110 - MODE
      ?auto_6112 - DIRECTION
      ?auto_6111 - MODE
      ?auto_6114 - DIRECTION
      ?auto_6113 - MODE
    )
    :vars
    (
      ?auto_6115 - INSTRUMENT
      ?auto_6118 - SATELLITE
      ?auto_6117 - DIRECTION
      ?auto_6116 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6115 ?auto_6118 ) ( SUPPORTS ?auto_6115 ?auto_6110 ) ( not ( = ?auto_6109 ?auto_6117 ) ) ( HAVE_IMAGE ?auto_6112 ?auto_6111 ) ( not ( = ?auto_6112 ?auto_6109 ) ) ( not ( = ?auto_6112 ?auto_6117 ) ) ( not ( = ?auto_6111 ?auto_6110 ) ) ( CALIBRATION_TARGET ?auto_6115 ?auto_6117 ) ( not ( = ?auto_6117 ?auto_6114 ) ) ( not ( = ?auto_6109 ?auto_6114 ) ) ( not ( = ?auto_6112 ?auto_6114 ) ) ( ON_BOARD ?auto_6116 ?auto_6118 ) ( not ( = ?auto_6115 ?auto_6116 ) ) ( SUPPORTS ?auto_6116 ?auto_6113 ) ( not ( = ?auto_6111 ?auto_6113 ) ) ( not ( = ?auto_6110 ?auto_6113 ) ) ( POINTING ?auto_6118 ?auto_6117 ) ( CALIBRATION_TARGET ?auto_6116 ?auto_6117 ) ( POWER_AVAIL ?auto_6118 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6112 ?auto_6111 ?auto_6109 ?auto_6110 )
      ( GET-3IMAGE-VERIFY ?auto_6109 ?auto_6110 ?auto_6112 ?auto_6111 ?auto_6114 ?auto_6113 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6131 - DIRECTION
      ?auto_6132 - MODE
      ?auto_6134 - DIRECTION
      ?auto_6133 - MODE
      ?auto_6136 - DIRECTION
      ?auto_6135 - MODE
    )
    :vars
    (
      ?auto_6137 - INSTRUMENT
      ?auto_6140 - SATELLITE
      ?auto_6139 - DIRECTION
      ?auto_6138 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6137 ?auto_6140 ) ( SUPPORTS ?auto_6137 ?auto_6132 ) ( not ( = ?auto_6131 ?auto_6139 ) ) ( HAVE_IMAGE ?auto_6136 ?auto_6135 ) ( not ( = ?auto_6136 ?auto_6131 ) ) ( not ( = ?auto_6136 ?auto_6139 ) ) ( not ( = ?auto_6135 ?auto_6132 ) ) ( CALIBRATION_TARGET ?auto_6137 ?auto_6139 ) ( not ( = ?auto_6139 ?auto_6134 ) ) ( not ( = ?auto_6131 ?auto_6134 ) ) ( not ( = ?auto_6136 ?auto_6134 ) ) ( ON_BOARD ?auto_6138 ?auto_6140 ) ( not ( = ?auto_6137 ?auto_6138 ) ) ( SUPPORTS ?auto_6138 ?auto_6133 ) ( not ( = ?auto_6135 ?auto_6133 ) ) ( not ( = ?auto_6132 ?auto_6133 ) ) ( POINTING ?auto_6140 ?auto_6139 ) ( CALIBRATION_TARGET ?auto_6138 ?auto_6139 ) ( POWER_AVAIL ?auto_6140 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6136 ?auto_6135 ?auto_6131 ?auto_6132 )
      ( GET-3IMAGE-VERIFY ?auto_6131 ?auto_6132 ?auto_6134 ?auto_6133 ?auto_6136 ?auto_6135 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_6203 - DIRECTION
      ?auto_6204 - MODE
    )
    :vars
    (
      ?auto_6205 - INSTRUMENT
      ?auto_6210 - SATELLITE
      ?auto_6208 - DIRECTION
      ?auto_6212 - DIRECTION
      ?auto_6211 - MODE
      ?auto_6207 - DIRECTION
      ?auto_6206 - INSTRUMENT
      ?auto_6209 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_6205 ?auto_6210 ) ( SUPPORTS ?auto_6205 ?auto_6204 ) ( not ( = ?auto_6203 ?auto_6208 ) ) ( HAVE_IMAGE ?auto_6212 ?auto_6211 ) ( not ( = ?auto_6212 ?auto_6203 ) ) ( not ( = ?auto_6212 ?auto_6208 ) ) ( not ( = ?auto_6211 ?auto_6204 ) ) ( CALIBRATION_TARGET ?auto_6205 ?auto_6208 ) ( not ( = ?auto_6208 ?auto_6207 ) ) ( not ( = ?auto_6203 ?auto_6207 ) ) ( not ( = ?auto_6212 ?auto_6207 ) ) ( ON_BOARD ?auto_6206 ?auto_6210 ) ( not ( = ?auto_6205 ?auto_6206 ) ) ( SUPPORTS ?auto_6206 ?auto_6209 ) ( not ( = ?auto_6211 ?auto_6209 ) ) ( not ( = ?auto_6204 ?auto_6209 ) ) ( CALIBRATION_TARGET ?auto_6206 ?auto_6208 ) ( POWER_AVAIL ?auto_6210 ) ( POINTING ?auto_6210 ?auto_6212 ) )
    :subtasks
    ( ( !TURN_TO ?auto_6210 ?auto_6208 ?auto_6212 )
      ( GET-2IMAGE ?auto_6212 ?auto_6211 ?auto_6203 ?auto_6204 )
      ( GET-1IMAGE-VERIFY ?auto_6203 ?auto_6204 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6213 - DIRECTION
      ?auto_6214 - MODE
      ?auto_6216 - DIRECTION
      ?auto_6215 - MODE
    )
    :vars
    (
      ?auto_6221 - INSTRUMENT
      ?auto_6218 - SATELLITE
      ?auto_6217 - DIRECTION
      ?auto_6219 - DIRECTION
      ?auto_6220 - INSTRUMENT
      ?auto_6222 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_6221 ?auto_6218 ) ( SUPPORTS ?auto_6221 ?auto_6215 ) ( not ( = ?auto_6216 ?auto_6217 ) ) ( HAVE_IMAGE ?auto_6213 ?auto_6214 ) ( not ( = ?auto_6213 ?auto_6216 ) ) ( not ( = ?auto_6213 ?auto_6217 ) ) ( not ( = ?auto_6214 ?auto_6215 ) ) ( CALIBRATION_TARGET ?auto_6221 ?auto_6217 ) ( not ( = ?auto_6217 ?auto_6219 ) ) ( not ( = ?auto_6216 ?auto_6219 ) ) ( not ( = ?auto_6213 ?auto_6219 ) ) ( ON_BOARD ?auto_6220 ?auto_6218 ) ( not ( = ?auto_6221 ?auto_6220 ) ) ( SUPPORTS ?auto_6220 ?auto_6222 ) ( not ( = ?auto_6214 ?auto_6222 ) ) ( not ( = ?auto_6215 ?auto_6222 ) ) ( CALIBRATION_TARGET ?auto_6220 ?auto_6217 ) ( POWER_AVAIL ?auto_6218 ) ( POINTING ?auto_6218 ?auto_6213 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6216 ?auto_6215 )
      ( GET-2IMAGE-VERIFY ?auto_6213 ?auto_6214 ?auto_6216 ?auto_6215 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6223 - DIRECTION
      ?auto_6224 - MODE
      ?auto_6226 - DIRECTION
      ?auto_6225 - MODE
    )
    :vars
    (
      ?auto_6230 - INSTRUMENT
      ?auto_6229 - SATELLITE
      ?auto_6228 - DIRECTION
      ?auto_6232 - DIRECTION
      ?auto_6231 - MODE
      ?auto_6227 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6230 ?auto_6229 ) ( SUPPORTS ?auto_6230 ?auto_6225 ) ( not ( = ?auto_6226 ?auto_6228 ) ) ( HAVE_IMAGE ?auto_6232 ?auto_6231 ) ( not ( = ?auto_6232 ?auto_6226 ) ) ( not ( = ?auto_6232 ?auto_6228 ) ) ( not ( = ?auto_6231 ?auto_6225 ) ) ( CALIBRATION_TARGET ?auto_6230 ?auto_6228 ) ( not ( = ?auto_6228 ?auto_6223 ) ) ( not ( = ?auto_6226 ?auto_6223 ) ) ( not ( = ?auto_6232 ?auto_6223 ) ) ( ON_BOARD ?auto_6227 ?auto_6229 ) ( not ( = ?auto_6230 ?auto_6227 ) ) ( SUPPORTS ?auto_6227 ?auto_6224 ) ( not ( = ?auto_6231 ?auto_6224 ) ) ( not ( = ?auto_6225 ?auto_6224 ) ) ( CALIBRATION_TARGET ?auto_6227 ?auto_6228 ) ( POWER_AVAIL ?auto_6229 ) ( POINTING ?auto_6229 ?auto_6232 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6232 ?auto_6231 ?auto_6226 ?auto_6225 )
      ( GET-2IMAGE-VERIFY ?auto_6223 ?auto_6224 ?auto_6226 ?auto_6225 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6233 - DIRECTION
      ?auto_6234 - MODE
      ?auto_6236 - DIRECTION
      ?auto_6235 - MODE
    )
    :vars
    (
      ?auto_6242 - INSTRUMENT
      ?auto_6240 - SATELLITE
      ?auto_6238 - DIRECTION
      ?auto_6241 - DIRECTION
      ?auto_6237 - INSTRUMENT
      ?auto_6239 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_6242 ?auto_6240 ) ( SUPPORTS ?auto_6242 ?auto_6234 ) ( not ( = ?auto_6233 ?auto_6238 ) ) ( HAVE_IMAGE ?auto_6236 ?auto_6235 ) ( not ( = ?auto_6236 ?auto_6233 ) ) ( not ( = ?auto_6236 ?auto_6238 ) ) ( not ( = ?auto_6235 ?auto_6234 ) ) ( CALIBRATION_TARGET ?auto_6242 ?auto_6238 ) ( not ( = ?auto_6238 ?auto_6241 ) ) ( not ( = ?auto_6233 ?auto_6241 ) ) ( not ( = ?auto_6236 ?auto_6241 ) ) ( ON_BOARD ?auto_6237 ?auto_6240 ) ( not ( = ?auto_6242 ?auto_6237 ) ) ( SUPPORTS ?auto_6237 ?auto_6239 ) ( not ( = ?auto_6235 ?auto_6239 ) ) ( not ( = ?auto_6234 ?auto_6239 ) ) ( CALIBRATION_TARGET ?auto_6237 ?auto_6238 ) ( POWER_AVAIL ?auto_6240 ) ( POINTING ?auto_6240 ?auto_6236 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6236 ?auto_6235 ?auto_6233 ?auto_6234 )
      ( GET-2IMAGE-VERIFY ?auto_6233 ?auto_6234 ?auto_6236 ?auto_6235 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6243 - DIRECTION
      ?auto_6244 - MODE
      ?auto_6246 - DIRECTION
      ?auto_6245 - MODE
    )
    :vars
    (
      ?auto_6250 - INSTRUMENT
      ?auto_6249 - SATELLITE
      ?auto_6248 - DIRECTION
      ?auto_6252 - DIRECTION
      ?auto_6251 - MODE
      ?auto_6247 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6250 ?auto_6249 ) ( SUPPORTS ?auto_6250 ?auto_6244 ) ( not ( = ?auto_6243 ?auto_6248 ) ) ( HAVE_IMAGE ?auto_6252 ?auto_6251 ) ( not ( = ?auto_6252 ?auto_6243 ) ) ( not ( = ?auto_6252 ?auto_6248 ) ) ( not ( = ?auto_6251 ?auto_6244 ) ) ( CALIBRATION_TARGET ?auto_6250 ?auto_6248 ) ( not ( = ?auto_6248 ?auto_6246 ) ) ( not ( = ?auto_6243 ?auto_6246 ) ) ( not ( = ?auto_6252 ?auto_6246 ) ) ( ON_BOARD ?auto_6247 ?auto_6249 ) ( not ( = ?auto_6250 ?auto_6247 ) ) ( SUPPORTS ?auto_6247 ?auto_6245 ) ( not ( = ?auto_6251 ?auto_6245 ) ) ( not ( = ?auto_6244 ?auto_6245 ) ) ( CALIBRATION_TARGET ?auto_6247 ?auto_6248 ) ( POWER_AVAIL ?auto_6249 ) ( POINTING ?auto_6249 ?auto_6252 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6252 ?auto_6251 ?auto_6243 ?auto_6244 )
      ( GET-2IMAGE-VERIFY ?auto_6243 ?auto_6244 ?auto_6246 ?auto_6245 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6265 - DIRECTION
      ?auto_6266 - MODE
      ?auto_6268 - DIRECTION
      ?auto_6267 - MODE
      ?auto_6270 - DIRECTION
      ?auto_6269 - MODE
    )
    :vars
    (
      ?auto_6276 - INSTRUMENT
      ?auto_6274 - SATELLITE
      ?auto_6272 - DIRECTION
      ?auto_6275 - DIRECTION
      ?auto_6271 - INSTRUMENT
      ?auto_6273 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_6276 ?auto_6274 ) ( SUPPORTS ?auto_6276 ?auto_6269 ) ( not ( = ?auto_6270 ?auto_6272 ) ) ( HAVE_IMAGE ?auto_6265 ?auto_6266 ) ( not ( = ?auto_6265 ?auto_6270 ) ) ( not ( = ?auto_6265 ?auto_6272 ) ) ( not ( = ?auto_6266 ?auto_6269 ) ) ( CALIBRATION_TARGET ?auto_6276 ?auto_6272 ) ( not ( = ?auto_6272 ?auto_6275 ) ) ( not ( = ?auto_6270 ?auto_6275 ) ) ( not ( = ?auto_6265 ?auto_6275 ) ) ( ON_BOARD ?auto_6271 ?auto_6274 ) ( not ( = ?auto_6276 ?auto_6271 ) ) ( SUPPORTS ?auto_6271 ?auto_6273 ) ( not ( = ?auto_6266 ?auto_6273 ) ) ( not ( = ?auto_6269 ?auto_6273 ) ) ( CALIBRATION_TARGET ?auto_6271 ?auto_6272 ) ( POWER_AVAIL ?auto_6274 ) ( POINTING ?auto_6274 ?auto_6265 ) ( HAVE_IMAGE ?auto_6268 ?auto_6267 ) ( not ( = ?auto_6265 ?auto_6268 ) ) ( not ( = ?auto_6266 ?auto_6267 ) ) ( not ( = ?auto_6268 ?auto_6270 ) ) ( not ( = ?auto_6268 ?auto_6272 ) ) ( not ( = ?auto_6268 ?auto_6275 ) ) ( not ( = ?auto_6267 ?auto_6269 ) ) ( not ( = ?auto_6267 ?auto_6273 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6265 ?auto_6266 ?auto_6270 ?auto_6269 )
      ( GET-3IMAGE-VERIFY ?auto_6265 ?auto_6266 ?auto_6268 ?auto_6267 ?auto_6270 ?auto_6269 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6277 - DIRECTION
      ?auto_6278 - MODE
      ?auto_6280 - DIRECTION
      ?auto_6279 - MODE
      ?auto_6282 - DIRECTION
      ?auto_6281 - MODE
    )
    :vars
    (
      ?auto_6286 - INSTRUMENT
      ?auto_6285 - SATELLITE
      ?auto_6284 - DIRECTION
      ?auto_6283 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6286 ?auto_6285 ) ( SUPPORTS ?auto_6286 ?auto_6281 ) ( not ( = ?auto_6282 ?auto_6284 ) ) ( HAVE_IMAGE ?auto_6277 ?auto_6278 ) ( not ( = ?auto_6277 ?auto_6282 ) ) ( not ( = ?auto_6277 ?auto_6284 ) ) ( not ( = ?auto_6278 ?auto_6281 ) ) ( CALIBRATION_TARGET ?auto_6286 ?auto_6284 ) ( not ( = ?auto_6284 ?auto_6280 ) ) ( not ( = ?auto_6282 ?auto_6280 ) ) ( not ( = ?auto_6277 ?auto_6280 ) ) ( ON_BOARD ?auto_6283 ?auto_6285 ) ( not ( = ?auto_6286 ?auto_6283 ) ) ( SUPPORTS ?auto_6283 ?auto_6279 ) ( not ( = ?auto_6278 ?auto_6279 ) ) ( not ( = ?auto_6281 ?auto_6279 ) ) ( CALIBRATION_TARGET ?auto_6283 ?auto_6284 ) ( POWER_AVAIL ?auto_6285 ) ( POINTING ?auto_6285 ?auto_6277 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6277 ?auto_6278 ?auto_6282 ?auto_6281 )
      ( GET-3IMAGE-VERIFY ?auto_6277 ?auto_6278 ?auto_6280 ?auto_6279 ?auto_6282 ?auto_6281 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6287 - DIRECTION
      ?auto_6288 - MODE
      ?auto_6290 - DIRECTION
      ?auto_6289 - MODE
      ?auto_6292 - DIRECTION
      ?auto_6291 - MODE
    )
    :vars
    (
      ?auto_6298 - INSTRUMENT
      ?auto_6296 - SATELLITE
      ?auto_6294 - DIRECTION
      ?auto_6297 - DIRECTION
      ?auto_6293 - INSTRUMENT
      ?auto_6295 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_6298 ?auto_6296 ) ( SUPPORTS ?auto_6298 ?auto_6289 ) ( not ( = ?auto_6290 ?auto_6294 ) ) ( HAVE_IMAGE ?auto_6292 ?auto_6291 ) ( not ( = ?auto_6292 ?auto_6290 ) ) ( not ( = ?auto_6292 ?auto_6294 ) ) ( not ( = ?auto_6291 ?auto_6289 ) ) ( CALIBRATION_TARGET ?auto_6298 ?auto_6294 ) ( not ( = ?auto_6294 ?auto_6297 ) ) ( not ( = ?auto_6290 ?auto_6297 ) ) ( not ( = ?auto_6292 ?auto_6297 ) ) ( ON_BOARD ?auto_6293 ?auto_6296 ) ( not ( = ?auto_6298 ?auto_6293 ) ) ( SUPPORTS ?auto_6293 ?auto_6295 ) ( not ( = ?auto_6291 ?auto_6295 ) ) ( not ( = ?auto_6289 ?auto_6295 ) ) ( CALIBRATION_TARGET ?auto_6293 ?auto_6294 ) ( POWER_AVAIL ?auto_6296 ) ( POINTING ?auto_6296 ?auto_6292 ) ( HAVE_IMAGE ?auto_6287 ?auto_6288 ) ( not ( = ?auto_6287 ?auto_6290 ) ) ( not ( = ?auto_6287 ?auto_6292 ) ) ( not ( = ?auto_6287 ?auto_6294 ) ) ( not ( = ?auto_6287 ?auto_6297 ) ) ( not ( = ?auto_6288 ?auto_6289 ) ) ( not ( = ?auto_6288 ?auto_6291 ) ) ( not ( = ?auto_6288 ?auto_6295 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6292 ?auto_6291 ?auto_6290 ?auto_6289 )
      ( GET-3IMAGE-VERIFY ?auto_6287 ?auto_6288 ?auto_6290 ?auto_6289 ?auto_6292 ?auto_6291 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6299 - DIRECTION
      ?auto_6300 - MODE
      ?auto_6302 - DIRECTION
      ?auto_6301 - MODE
      ?auto_6304 - DIRECTION
      ?auto_6303 - MODE
    )
    :vars
    (
      ?auto_6308 - INSTRUMENT
      ?auto_6307 - SATELLITE
      ?auto_6306 - DIRECTION
      ?auto_6305 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6308 ?auto_6307 ) ( SUPPORTS ?auto_6308 ?auto_6301 ) ( not ( = ?auto_6302 ?auto_6306 ) ) ( HAVE_IMAGE ?auto_6299 ?auto_6300 ) ( not ( = ?auto_6299 ?auto_6302 ) ) ( not ( = ?auto_6299 ?auto_6306 ) ) ( not ( = ?auto_6300 ?auto_6301 ) ) ( CALIBRATION_TARGET ?auto_6308 ?auto_6306 ) ( not ( = ?auto_6306 ?auto_6304 ) ) ( not ( = ?auto_6302 ?auto_6304 ) ) ( not ( = ?auto_6299 ?auto_6304 ) ) ( ON_BOARD ?auto_6305 ?auto_6307 ) ( not ( = ?auto_6308 ?auto_6305 ) ) ( SUPPORTS ?auto_6305 ?auto_6303 ) ( not ( = ?auto_6300 ?auto_6303 ) ) ( not ( = ?auto_6301 ?auto_6303 ) ) ( CALIBRATION_TARGET ?auto_6305 ?auto_6306 ) ( POWER_AVAIL ?auto_6307 ) ( POINTING ?auto_6307 ?auto_6299 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6299 ?auto_6300 ?auto_6302 ?auto_6301 )
      ( GET-3IMAGE-VERIFY ?auto_6299 ?auto_6300 ?auto_6302 ?auto_6301 ?auto_6304 ?auto_6303 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6321 - DIRECTION
      ?auto_6322 - MODE
      ?auto_6324 - DIRECTION
      ?auto_6323 - MODE
      ?auto_6326 - DIRECTION
      ?auto_6325 - MODE
    )
    :vars
    (
      ?auto_6330 - INSTRUMENT
      ?auto_6329 - SATELLITE
      ?auto_6328 - DIRECTION
      ?auto_6327 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6330 ?auto_6329 ) ( SUPPORTS ?auto_6330 ?auto_6325 ) ( not ( = ?auto_6326 ?auto_6328 ) ) ( HAVE_IMAGE ?auto_6324 ?auto_6323 ) ( not ( = ?auto_6324 ?auto_6326 ) ) ( not ( = ?auto_6324 ?auto_6328 ) ) ( not ( = ?auto_6323 ?auto_6325 ) ) ( CALIBRATION_TARGET ?auto_6330 ?auto_6328 ) ( not ( = ?auto_6328 ?auto_6321 ) ) ( not ( = ?auto_6326 ?auto_6321 ) ) ( not ( = ?auto_6324 ?auto_6321 ) ) ( ON_BOARD ?auto_6327 ?auto_6329 ) ( not ( = ?auto_6330 ?auto_6327 ) ) ( SUPPORTS ?auto_6327 ?auto_6322 ) ( not ( = ?auto_6323 ?auto_6322 ) ) ( not ( = ?auto_6325 ?auto_6322 ) ) ( CALIBRATION_TARGET ?auto_6327 ?auto_6328 ) ( POWER_AVAIL ?auto_6329 ) ( POINTING ?auto_6329 ?auto_6324 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6324 ?auto_6323 ?auto_6326 ?auto_6325 )
      ( GET-3IMAGE-VERIFY ?auto_6321 ?auto_6322 ?auto_6324 ?auto_6323 ?auto_6326 ?auto_6325 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6343 - DIRECTION
      ?auto_6344 - MODE
      ?auto_6346 - DIRECTION
      ?auto_6345 - MODE
      ?auto_6348 - DIRECTION
      ?auto_6347 - MODE
    )
    :vars
    (
      ?auto_6352 - INSTRUMENT
      ?auto_6351 - SATELLITE
      ?auto_6350 - DIRECTION
      ?auto_6349 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6352 ?auto_6351 ) ( SUPPORTS ?auto_6352 ?auto_6345 ) ( not ( = ?auto_6346 ?auto_6350 ) ) ( HAVE_IMAGE ?auto_6348 ?auto_6347 ) ( not ( = ?auto_6348 ?auto_6346 ) ) ( not ( = ?auto_6348 ?auto_6350 ) ) ( not ( = ?auto_6347 ?auto_6345 ) ) ( CALIBRATION_TARGET ?auto_6352 ?auto_6350 ) ( not ( = ?auto_6350 ?auto_6343 ) ) ( not ( = ?auto_6346 ?auto_6343 ) ) ( not ( = ?auto_6348 ?auto_6343 ) ) ( ON_BOARD ?auto_6349 ?auto_6351 ) ( not ( = ?auto_6352 ?auto_6349 ) ) ( SUPPORTS ?auto_6349 ?auto_6344 ) ( not ( = ?auto_6347 ?auto_6344 ) ) ( not ( = ?auto_6345 ?auto_6344 ) ) ( CALIBRATION_TARGET ?auto_6349 ?auto_6350 ) ( POWER_AVAIL ?auto_6351 ) ( POINTING ?auto_6351 ?auto_6348 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6348 ?auto_6347 ?auto_6346 ?auto_6345 )
      ( GET-3IMAGE-VERIFY ?auto_6343 ?auto_6344 ?auto_6346 ?auto_6345 ?auto_6348 ?auto_6347 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6377 - DIRECTION
      ?auto_6378 - MODE
      ?auto_6380 - DIRECTION
      ?auto_6379 - MODE
      ?auto_6382 - DIRECTION
      ?auto_6381 - MODE
    )
    :vars
    (
      ?auto_6388 - INSTRUMENT
      ?auto_6386 - SATELLITE
      ?auto_6384 - DIRECTION
      ?auto_6387 - DIRECTION
      ?auto_6383 - INSTRUMENT
      ?auto_6385 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_6388 ?auto_6386 ) ( SUPPORTS ?auto_6388 ?auto_6378 ) ( not ( = ?auto_6377 ?auto_6384 ) ) ( HAVE_IMAGE ?auto_6380 ?auto_6381 ) ( not ( = ?auto_6380 ?auto_6377 ) ) ( not ( = ?auto_6380 ?auto_6384 ) ) ( not ( = ?auto_6381 ?auto_6378 ) ) ( CALIBRATION_TARGET ?auto_6388 ?auto_6384 ) ( not ( = ?auto_6384 ?auto_6387 ) ) ( not ( = ?auto_6377 ?auto_6387 ) ) ( not ( = ?auto_6380 ?auto_6387 ) ) ( ON_BOARD ?auto_6383 ?auto_6386 ) ( not ( = ?auto_6388 ?auto_6383 ) ) ( SUPPORTS ?auto_6383 ?auto_6385 ) ( not ( = ?auto_6381 ?auto_6385 ) ) ( not ( = ?auto_6378 ?auto_6385 ) ) ( CALIBRATION_TARGET ?auto_6383 ?auto_6384 ) ( POWER_AVAIL ?auto_6386 ) ( POINTING ?auto_6386 ?auto_6380 ) ( HAVE_IMAGE ?auto_6380 ?auto_6379 ) ( HAVE_IMAGE ?auto_6382 ?auto_6381 ) ( not ( = ?auto_6377 ?auto_6382 ) ) ( not ( = ?auto_6378 ?auto_6379 ) ) ( not ( = ?auto_6380 ?auto_6382 ) ) ( not ( = ?auto_6379 ?auto_6381 ) ) ( not ( = ?auto_6379 ?auto_6385 ) ) ( not ( = ?auto_6382 ?auto_6384 ) ) ( not ( = ?auto_6382 ?auto_6387 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6380 ?auto_6381 ?auto_6377 ?auto_6378 )
      ( GET-3IMAGE-VERIFY ?auto_6377 ?auto_6378 ?auto_6380 ?auto_6379 ?auto_6382 ?auto_6381 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6389 - DIRECTION
      ?auto_6390 - MODE
      ?auto_6392 - DIRECTION
      ?auto_6391 - MODE
      ?auto_6394 - DIRECTION
      ?auto_6393 - MODE
    )
    :vars
    (
      ?auto_6398 - INSTRUMENT
      ?auto_6397 - SATELLITE
      ?auto_6396 - DIRECTION
      ?auto_6395 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6398 ?auto_6397 ) ( SUPPORTS ?auto_6398 ?auto_6390 ) ( not ( = ?auto_6389 ?auto_6396 ) ) ( HAVE_IMAGE ?auto_6392 ?auto_6391 ) ( not ( = ?auto_6392 ?auto_6389 ) ) ( not ( = ?auto_6392 ?auto_6396 ) ) ( not ( = ?auto_6391 ?auto_6390 ) ) ( CALIBRATION_TARGET ?auto_6398 ?auto_6396 ) ( not ( = ?auto_6396 ?auto_6394 ) ) ( not ( = ?auto_6389 ?auto_6394 ) ) ( not ( = ?auto_6392 ?auto_6394 ) ) ( ON_BOARD ?auto_6395 ?auto_6397 ) ( not ( = ?auto_6398 ?auto_6395 ) ) ( SUPPORTS ?auto_6395 ?auto_6393 ) ( not ( = ?auto_6391 ?auto_6393 ) ) ( not ( = ?auto_6390 ?auto_6393 ) ) ( CALIBRATION_TARGET ?auto_6395 ?auto_6396 ) ( POWER_AVAIL ?auto_6397 ) ( POINTING ?auto_6397 ?auto_6392 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6392 ?auto_6391 ?auto_6389 ?auto_6390 )
      ( GET-3IMAGE-VERIFY ?auto_6389 ?auto_6390 ?auto_6392 ?auto_6391 ?auto_6394 ?auto_6393 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6411 - DIRECTION
      ?auto_6412 - MODE
      ?auto_6414 - DIRECTION
      ?auto_6413 - MODE
      ?auto_6416 - DIRECTION
      ?auto_6415 - MODE
    )
    :vars
    (
      ?auto_6420 - INSTRUMENT
      ?auto_6419 - SATELLITE
      ?auto_6418 - DIRECTION
      ?auto_6417 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6420 ?auto_6419 ) ( SUPPORTS ?auto_6420 ?auto_6412 ) ( not ( = ?auto_6411 ?auto_6418 ) ) ( HAVE_IMAGE ?auto_6416 ?auto_6415 ) ( not ( = ?auto_6416 ?auto_6411 ) ) ( not ( = ?auto_6416 ?auto_6418 ) ) ( not ( = ?auto_6415 ?auto_6412 ) ) ( CALIBRATION_TARGET ?auto_6420 ?auto_6418 ) ( not ( = ?auto_6418 ?auto_6414 ) ) ( not ( = ?auto_6411 ?auto_6414 ) ) ( not ( = ?auto_6416 ?auto_6414 ) ) ( ON_BOARD ?auto_6417 ?auto_6419 ) ( not ( = ?auto_6420 ?auto_6417 ) ) ( SUPPORTS ?auto_6417 ?auto_6413 ) ( not ( = ?auto_6415 ?auto_6413 ) ) ( not ( = ?auto_6412 ?auto_6413 ) ) ( CALIBRATION_TARGET ?auto_6417 ?auto_6418 ) ( POWER_AVAIL ?auto_6419 ) ( POINTING ?auto_6419 ?auto_6416 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6416 ?auto_6415 ?auto_6411 ?auto_6412 )
      ( GET-3IMAGE-VERIFY ?auto_6411 ?auto_6412 ?auto_6414 ?auto_6413 ?auto_6416 ?auto_6415 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_6483 - DIRECTION
      ?auto_6484 - MODE
    )
    :vars
    (
      ?auto_6490 - INSTRUMENT
      ?auto_6488 - SATELLITE
      ?auto_6486 - DIRECTION
      ?auto_6492 - DIRECTION
      ?auto_6491 - MODE
      ?auto_6489 - DIRECTION
      ?auto_6485 - INSTRUMENT
      ?auto_6487 - MODE
      ?auto_6493 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6490 ?auto_6488 ) ( SUPPORTS ?auto_6490 ?auto_6484 ) ( not ( = ?auto_6483 ?auto_6486 ) ) ( HAVE_IMAGE ?auto_6492 ?auto_6491 ) ( not ( = ?auto_6492 ?auto_6483 ) ) ( not ( = ?auto_6492 ?auto_6486 ) ) ( not ( = ?auto_6491 ?auto_6484 ) ) ( CALIBRATION_TARGET ?auto_6490 ?auto_6486 ) ( not ( = ?auto_6486 ?auto_6489 ) ) ( not ( = ?auto_6483 ?auto_6489 ) ) ( not ( = ?auto_6492 ?auto_6489 ) ) ( ON_BOARD ?auto_6485 ?auto_6488 ) ( not ( = ?auto_6490 ?auto_6485 ) ) ( SUPPORTS ?auto_6485 ?auto_6487 ) ( not ( = ?auto_6491 ?auto_6487 ) ) ( not ( = ?auto_6484 ?auto_6487 ) ) ( CALIBRATION_TARGET ?auto_6485 ?auto_6486 ) ( POINTING ?auto_6488 ?auto_6492 ) ( ON_BOARD ?auto_6493 ?auto_6488 ) ( POWER_ON ?auto_6493 ) ( not ( = ?auto_6490 ?auto_6493 ) ) ( not ( = ?auto_6485 ?auto_6493 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_6493 ?auto_6488 )
      ( GET-2IMAGE ?auto_6492 ?auto_6491 ?auto_6483 ?auto_6484 )
      ( GET-1IMAGE-VERIFY ?auto_6483 ?auto_6484 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6494 - DIRECTION
      ?auto_6495 - MODE
      ?auto_6497 - DIRECTION
      ?auto_6496 - MODE
    )
    :vars
    (
      ?auto_6499 - INSTRUMENT
      ?auto_6500 - SATELLITE
      ?auto_6503 - DIRECTION
      ?auto_6498 - DIRECTION
      ?auto_6502 - INSTRUMENT
      ?auto_6501 - MODE
      ?auto_6504 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6499 ?auto_6500 ) ( SUPPORTS ?auto_6499 ?auto_6496 ) ( not ( = ?auto_6497 ?auto_6503 ) ) ( HAVE_IMAGE ?auto_6494 ?auto_6495 ) ( not ( = ?auto_6494 ?auto_6497 ) ) ( not ( = ?auto_6494 ?auto_6503 ) ) ( not ( = ?auto_6495 ?auto_6496 ) ) ( CALIBRATION_TARGET ?auto_6499 ?auto_6503 ) ( not ( = ?auto_6503 ?auto_6498 ) ) ( not ( = ?auto_6497 ?auto_6498 ) ) ( not ( = ?auto_6494 ?auto_6498 ) ) ( ON_BOARD ?auto_6502 ?auto_6500 ) ( not ( = ?auto_6499 ?auto_6502 ) ) ( SUPPORTS ?auto_6502 ?auto_6501 ) ( not ( = ?auto_6495 ?auto_6501 ) ) ( not ( = ?auto_6496 ?auto_6501 ) ) ( CALIBRATION_TARGET ?auto_6502 ?auto_6503 ) ( POINTING ?auto_6500 ?auto_6494 ) ( ON_BOARD ?auto_6504 ?auto_6500 ) ( POWER_ON ?auto_6504 ) ( not ( = ?auto_6499 ?auto_6504 ) ) ( not ( = ?auto_6502 ?auto_6504 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6497 ?auto_6496 )
      ( GET-2IMAGE-VERIFY ?auto_6494 ?auto_6495 ?auto_6497 ?auto_6496 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6505 - DIRECTION
      ?auto_6506 - MODE
      ?auto_6508 - DIRECTION
      ?auto_6507 - MODE
    )
    :vars
    (
      ?auto_6512 - INSTRUMENT
      ?auto_6510 - SATELLITE
      ?auto_6509 - DIRECTION
      ?auto_6515 - DIRECTION
      ?auto_6514 - MODE
      ?auto_6513 - INSTRUMENT
      ?auto_6511 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6512 ?auto_6510 ) ( SUPPORTS ?auto_6512 ?auto_6507 ) ( not ( = ?auto_6508 ?auto_6509 ) ) ( HAVE_IMAGE ?auto_6515 ?auto_6514 ) ( not ( = ?auto_6515 ?auto_6508 ) ) ( not ( = ?auto_6515 ?auto_6509 ) ) ( not ( = ?auto_6514 ?auto_6507 ) ) ( CALIBRATION_TARGET ?auto_6512 ?auto_6509 ) ( not ( = ?auto_6509 ?auto_6505 ) ) ( not ( = ?auto_6508 ?auto_6505 ) ) ( not ( = ?auto_6515 ?auto_6505 ) ) ( ON_BOARD ?auto_6513 ?auto_6510 ) ( not ( = ?auto_6512 ?auto_6513 ) ) ( SUPPORTS ?auto_6513 ?auto_6506 ) ( not ( = ?auto_6514 ?auto_6506 ) ) ( not ( = ?auto_6507 ?auto_6506 ) ) ( CALIBRATION_TARGET ?auto_6513 ?auto_6509 ) ( POINTING ?auto_6510 ?auto_6515 ) ( ON_BOARD ?auto_6511 ?auto_6510 ) ( POWER_ON ?auto_6511 ) ( not ( = ?auto_6512 ?auto_6511 ) ) ( not ( = ?auto_6513 ?auto_6511 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6515 ?auto_6514 ?auto_6508 ?auto_6507 )
      ( GET-2IMAGE-VERIFY ?auto_6505 ?auto_6506 ?auto_6508 ?auto_6507 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6516 - DIRECTION
      ?auto_6517 - MODE
      ?auto_6519 - DIRECTION
      ?auto_6518 - MODE
    )
    :vars
    (
      ?auto_6524 - INSTRUMENT
      ?auto_6521 - SATELLITE
      ?auto_6520 - DIRECTION
      ?auto_6523 - DIRECTION
      ?auto_6525 - INSTRUMENT
      ?auto_6526 - MODE
      ?auto_6522 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6524 ?auto_6521 ) ( SUPPORTS ?auto_6524 ?auto_6517 ) ( not ( = ?auto_6516 ?auto_6520 ) ) ( HAVE_IMAGE ?auto_6519 ?auto_6518 ) ( not ( = ?auto_6519 ?auto_6516 ) ) ( not ( = ?auto_6519 ?auto_6520 ) ) ( not ( = ?auto_6518 ?auto_6517 ) ) ( CALIBRATION_TARGET ?auto_6524 ?auto_6520 ) ( not ( = ?auto_6520 ?auto_6523 ) ) ( not ( = ?auto_6516 ?auto_6523 ) ) ( not ( = ?auto_6519 ?auto_6523 ) ) ( ON_BOARD ?auto_6525 ?auto_6521 ) ( not ( = ?auto_6524 ?auto_6525 ) ) ( SUPPORTS ?auto_6525 ?auto_6526 ) ( not ( = ?auto_6518 ?auto_6526 ) ) ( not ( = ?auto_6517 ?auto_6526 ) ) ( CALIBRATION_TARGET ?auto_6525 ?auto_6520 ) ( POINTING ?auto_6521 ?auto_6519 ) ( ON_BOARD ?auto_6522 ?auto_6521 ) ( POWER_ON ?auto_6522 ) ( not ( = ?auto_6524 ?auto_6522 ) ) ( not ( = ?auto_6525 ?auto_6522 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6519 ?auto_6518 ?auto_6516 ?auto_6517 )
      ( GET-2IMAGE-VERIFY ?auto_6516 ?auto_6517 ?auto_6519 ?auto_6518 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6527 - DIRECTION
      ?auto_6528 - MODE
      ?auto_6530 - DIRECTION
      ?auto_6529 - MODE
    )
    :vars
    (
      ?auto_6534 - INSTRUMENT
      ?auto_6532 - SATELLITE
      ?auto_6531 - DIRECTION
      ?auto_6537 - DIRECTION
      ?auto_6536 - MODE
      ?auto_6535 - INSTRUMENT
      ?auto_6533 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6534 ?auto_6532 ) ( SUPPORTS ?auto_6534 ?auto_6528 ) ( not ( = ?auto_6527 ?auto_6531 ) ) ( HAVE_IMAGE ?auto_6537 ?auto_6536 ) ( not ( = ?auto_6537 ?auto_6527 ) ) ( not ( = ?auto_6537 ?auto_6531 ) ) ( not ( = ?auto_6536 ?auto_6528 ) ) ( CALIBRATION_TARGET ?auto_6534 ?auto_6531 ) ( not ( = ?auto_6531 ?auto_6530 ) ) ( not ( = ?auto_6527 ?auto_6530 ) ) ( not ( = ?auto_6537 ?auto_6530 ) ) ( ON_BOARD ?auto_6535 ?auto_6532 ) ( not ( = ?auto_6534 ?auto_6535 ) ) ( SUPPORTS ?auto_6535 ?auto_6529 ) ( not ( = ?auto_6536 ?auto_6529 ) ) ( not ( = ?auto_6528 ?auto_6529 ) ) ( CALIBRATION_TARGET ?auto_6535 ?auto_6531 ) ( POINTING ?auto_6532 ?auto_6537 ) ( ON_BOARD ?auto_6533 ?auto_6532 ) ( POWER_ON ?auto_6533 ) ( not ( = ?auto_6534 ?auto_6533 ) ) ( not ( = ?auto_6535 ?auto_6533 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6537 ?auto_6536 ?auto_6527 ?auto_6528 )
      ( GET-2IMAGE-VERIFY ?auto_6527 ?auto_6528 ?auto_6530 ?auto_6529 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6551 - DIRECTION
      ?auto_6552 - MODE
      ?auto_6554 - DIRECTION
      ?auto_6553 - MODE
      ?auto_6556 - DIRECTION
      ?auto_6555 - MODE
    )
    :vars
    (
      ?auto_6561 - INSTRUMENT
      ?auto_6558 - SATELLITE
      ?auto_6557 - DIRECTION
      ?auto_6560 - DIRECTION
      ?auto_6562 - INSTRUMENT
      ?auto_6563 - MODE
      ?auto_6559 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6561 ?auto_6558 ) ( SUPPORTS ?auto_6561 ?auto_6555 ) ( not ( = ?auto_6556 ?auto_6557 ) ) ( HAVE_IMAGE ?auto_6551 ?auto_6552 ) ( not ( = ?auto_6551 ?auto_6556 ) ) ( not ( = ?auto_6551 ?auto_6557 ) ) ( not ( = ?auto_6552 ?auto_6555 ) ) ( CALIBRATION_TARGET ?auto_6561 ?auto_6557 ) ( not ( = ?auto_6557 ?auto_6560 ) ) ( not ( = ?auto_6556 ?auto_6560 ) ) ( not ( = ?auto_6551 ?auto_6560 ) ) ( ON_BOARD ?auto_6562 ?auto_6558 ) ( not ( = ?auto_6561 ?auto_6562 ) ) ( SUPPORTS ?auto_6562 ?auto_6563 ) ( not ( = ?auto_6552 ?auto_6563 ) ) ( not ( = ?auto_6555 ?auto_6563 ) ) ( CALIBRATION_TARGET ?auto_6562 ?auto_6557 ) ( POINTING ?auto_6558 ?auto_6551 ) ( ON_BOARD ?auto_6559 ?auto_6558 ) ( POWER_ON ?auto_6559 ) ( not ( = ?auto_6561 ?auto_6559 ) ) ( not ( = ?auto_6562 ?auto_6559 ) ) ( HAVE_IMAGE ?auto_6554 ?auto_6553 ) ( not ( = ?auto_6551 ?auto_6554 ) ) ( not ( = ?auto_6552 ?auto_6553 ) ) ( not ( = ?auto_6554 ?auto_6556 ) ) ( not ( = ?auto_6554 ?auto_6557 ) ) ( not ( = ?auto_6554 ?auto_6560 ) ) ( not ( = ?auto_6553 ?auto_6555 ) ) ( not ( = ?auto_6553 ?auto_6563 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6551 ?auto_6552 ?auto_6556 ?auto_6555 )
      ( GET-3IMAGE-VERIFY ?auto_6551 ?auto_6552 ?auto_6554 ?auto_6553 ?auto_6556 ?auto_6555 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6564 - DIRECTION
      ?auto_6565 - MODE
      ?auto_6567 - DIRECTION
      ?auto_6566 - MODE
      ?auto_6569 - DIRECTION
      ?auto_6568 - MODE
    )
    :vars
    (
      ?auto_6573 - INSTRUMENT
      ?auto_6571 - SATELLITE
      ?auto_6570 - DIRECTION
      ?auto_6574 - INSTRUMENT
      ?auto_6572 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6573 ?auto_6571 ) ( SUPPORTS ?auto_6573 ?auto_6568 ) ( not ( = ?auto_6569 ?auto_6570 ) ) ( HAVE_IMAGE ?auto_6564 ?auto_6565 ) ( not ( = ?auto_6564 ?auto_6569 ) ) ( not ( = ?auto_6564 ?auto_6570 ) ) ( not ( = ?auto_6565 ?auto_6568 ) ) ( CALIBRATION_TARGET ?auto_6573 ?auto_6570 ) ( not ( = ?auto_6570 ?auto_6567 ) ) ( not ( = ?auto_6569 ?auto_6567 ) ) ( not ( = ?auto_6564 ?auto_6567 ) ) ( ON_BOARD ?auto_6574 ?auto_6571 ) ( not ( = ?auto_6573 ?auto_6574 ) ) ( SUPPORTS ?auto_6574 ?auto_6566 ) ( not ( = ?auto_6565 ?auto_6566 ) ) ( not ( = ?auto_6568 ?auto_6566 ) ) ( CALIBRATION_TARGET ?auto_6574 ?auto_6570 ) ( POINTING ?auto_6571 ?auto_6564 ) ( ON_BOARD ?auto_6572 ?auto_6571 ) ( POWER_ON ?auto_6572 ) ( not ( = ?auto_6573 ?auto_6572 ) ) ( not ( = ?auto_6574 ?auto_6572 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6564 ?auto_6565 ?auto_6569 ?auto_6568 )
      ( GET-3IMAGE-VERIFY ?auto_6564 ?auto_6565 ?auto_6567 ?auto_6566 ?auto_6569 ?auto_6568 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6575 - DIRECTION
      ?auto_6576 - MODE
      ?auto_6578 - DIRECTION
      ?auto_6577 - MODE
      ?auto_6580 - DIRECTION
      ?auto_6579 - MODE
    )
    :vars
    (
      ?auto_6585 - INSTRUMENT
      ?auto_6582 - SATELLITE
      ?auto_6581 - DIRECTION
      ?auto_6584 - DIRECTION
      ?auto_6586 - INSTRUMENT
      ?auto_6587 - MODE
      ?auto_6583 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6585 ?auto_6582 ) ( SUPPORTS ?auto_6585 ?auto_6577 ) ( not ( = ?auto_6578 ?auto_6581 ) ) ( HAVE_IMAGE ?auto_6580 ?auto_6579 ) ( not ( = ?auto_6580 ?auto_6578 ) ) ( not ( = ?auto_6580 ?auto_6581 ) ) ( not ( = ?auto_6579 ?auto_6577 ) ) ( CALIBRATION_TARGET ?auto_6585 ?auto_6581 ) ( not ( = ?auto_6581 ?auto_6584 ) ) ( not ( = ?auto_6578 ?auto_6584 ) ) ( not ( = ?auto_6580 ?auto_6584 ) ) ( ON_BOARD ?auto_6586 ?auto_6582 ) ( not ( = ?auto_6585 ?auto_6586 ) ) ( SUPPORTS ?auto_6586 ?auto_6587 ) ( not ( = ?auto_6579 ?auto_6587 ) ) ( not ( = ?auto_6577 ?auto_6587 ) ) ( CALIBRATION_TARGET ?auto_6586 ?auto_6581 ) ( POINTING ?auto_6582 ?auto_6580 ) ( ON_BOARD ?auto_6583 ?auto_6582 ) ( POWER_ON ?auto_6583 ) ( not ( = ?auto_6585 ?auto_6583 ) ) ( not ( = ?auto_6586 ?auto_6583 ) ) ( HAVE_IMAGE ?auto_6575 ?auto_6576 ) ( not ( = ?auto_6575 ?auto_6578 ) ) ( not ( = ?auto_6575 ?auto_6580 ) ) ( not ( = ?auto_6575 ?auto_6581 ) ) ( not ( = ?auto_6575 ?auto_6584 ) ) ( not ( = ?auto_6576 ?auto_6577 ) ) ( not ( = ?auto_6576 ?auto_6579 ) ) ( not ( = ?auto_6576 ?auto_6587 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6580 ?auto_6579 ?auto_6578 ?auto_6577 )
      ( GET-3IMAGE-VERIFY ?auto_6575 ?auto_6576 ?auto_6578 ?auto_6577 ?auto_6580 ?auto_6579 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6588 - DIRECTION
      ?auto_6589 - MODE
      ?auto_6591 - DIRECTION
      ?auto_6590 - MODE
      ?auto_6593 - DIRECTION
      ?auto_6592 - MODE
    )
    :vars
    (
      ?auto_6597 - INSTRUMENT
      ?auto_6595 - SATELLITE
      ?auto_6594 - DIRECTION
      ?auto_6598 - INSTRUMENT
      ?auto_6596 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6597 ?auto_6595 ) ( SUPPORTS ?auto_6597 ?auto_6590 ) ( not ( = ?auto_6591 ?auto_6594 ) ) ( HAVE_IMAGE ?auto_6588 ?auto_6589 ) ( not ( = ?auto_6588 ?auto_6591 ) ) ( not ( = ?auto_6588 ?auto_6594 ) ) ( not ( = ?auto_6589 ?auto_6590 ) ) ( CALIBRATION_TARGET ?auto_6597 ?auto_6594 ) ( not ( = ?auto_6594 ?auto_6593 ) ) ( not ( = ?auto_6591 ?auto_6593 ) ) ( not ( = ?auto_6588 ?auto_6593 ) ) ( ON_BOARD ?auto_6598 ?auto_6595 ) ( not ( = ?auto_6597 ?auto_6598 ) ) ( SUPPORTS ?auto_6598 ?auto_6592 ) ( not ( = ?auto_6589 ?auto_6592 ) ) ( not ( = ?auto_6590 ?auto_6592 ) ) ( CALIBRATION_TARGET ?auto_6598 ?auto_6594 ) ( POINTING ?auto_6595 ?auto_6588 ) ( ON_BOARD ?auto_6596 ?auto_6595 ) ( POWER_ON ?auto_6596 ) ( not ( = ?auto_6597 ?auto_6596 ) ) ( not ( = ?auto_6598 ?auto_6596 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6588 ?auto_6589 ?auto_6591 ?auto_6590 )
      ( GET-3IMAGE-VERIFY ?auto_6588 ?auto_6589 ?auto_6591 ?auto_6590 ?auto_6593 ?auto_6592 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6612 - DIRECTION
      ?auto_6613 - MODE
      ?auto_6615 - DIRECTION
      ?auto_6614 - MODE
      ?auto_6617 - DIRECTION
      ?auto_6616 - MODE
    )
    :vars
    (
      ?auto_6621 - INSTRUMENT
      ?auto_6619 - SATELLITE
      ?auto_6618 - DIRECTION
      ?auto_6622 - INSTRUMENT
      ?auto_6620 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6621 ?auto_6619 ) ( SUPPORTS ?auto_6621 ?auto_6616 ) ( not ( = ?auto_6617 ?auto_6618 ) ) ( HAVE_IMAGE ?auto_6615 ?auto_6614 ) ( not ( = ?auto_6615 ?auto_6617 ) ) ( not ( = ?auto_6615 ?auto_6618 ) ) ( not ( = ?auto_6614 ?auto_6616 ) ) ( CALIBRATION_TARGET ?auto_6621 ?auto_6618 ) ( not ( = ?auto_6618 ?auto_6612 ) ) ( not ( = ?auto_6617 ?auto_6612 ) ) ( not ( = ?auto_6615 ?auto_6612 ) ) ( ON_BOARD ?auto_6622 ?auto_6619 ) ( not ( = ?auto_6621 ?auto_6622 ) ) ( SUPPORTS ?auto_6622 ?auto_6613 ) ( not ( = ?auto_6614 ?auto_6613 ) ) ( not ( = ?auto_6616 ?auto_6613 ) ) ( CALIBRATION_TARGET ?auto_6622 ?auto_6618 ) ( POINTING ?auto_6619 ?auto_6615 ) ( ON_BOARD ?auto_6620 ?auto_6619 ) ( POWER_ON ?auto_6620 ) ( not ( = ?auto_6621 ?auto_6620 ) ) ( not ( = ?auto_6622 ?auto_6620 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6615 ?auto_6614 ?auto_6617 ?auto_6616 )
      ( GET-3IMAGE-VERIFY ?auto_6612 ?auto_6613 ?auto_6615 ?auto_6614 ?auto_6617 ?auto_6616 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6636 - DIRECTION
      ?auto_6637 - MODE
      ?auto_6639 - DIRECTION
      ?auto_6638 - MODE
      ?auto_6641 - DIRECTION
      ?auto_6640 - MODE
    )
    :vars
    (
      ?auto_6645 - INSTRUMENT
      ?auto_6643 - SATELLITE
      ?auto_6642 - DIRECTION
      ?auto_6646 - INSTRUMENT
      ?auto_6644 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6645 ?auto_6643 ) ( SUPPORTS ?auto_6645 ?auto_6638 ) ( not ( = ?auto_6639 ?auto_6642 ) ) ( HAVE_IMAGE ?auto_6641 ?auto_6640 ) ( not ( = ?auto_6641 ?auto_6639 ) ) ( not ( = ?auto_6641 ?auto_6642 ) ) ( not ( = ?auto_6640 ?auto_6638 ) ) ( CALIBRATION_TARGET ?auto_6645 ?auto_6642 ) ( not ( = ?auto_6642 ?auto_6636 ) ) ( not ( = ?auto_6639 ?auto_6636 ) ) ( not ( = ?auto_6641 ?auto_6636 ) ) ( ON_BOARD ?auto_6646 ?auto_6643 ) ( not ( = ?auto_6645 ?auto_6646 ) ) ( SUPPORTS ?auto_6646 ?auto_6637 ) ( not ( = ?auto_6640 ?auto_6637 ) ) ( not ( = ?auto_6638 ?auto_6637 ) ) ( CALIBRATION_TARGET ?auto_6646 ?auto_6642 ) ( POINTING ?auto_6643 ?auto_6641 ) ( ON_BOARD ?auto_6644 ?auto_6643 ) ( POWER_ON ?auto_6644 ) ( not ( = ?auto_6645 ?auto_6644 ) ) ( not ( = ?auto_6646 ?auto_6644 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6641 ?auto_6640 ?auto_6639 ?auto_6638 )
      ( GET-3IMAGE-VERIFY ?auto_6636 ?auto_6637 ?auto_6639 ?auto_6638 ?auto_6641 ?auto_6640 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6673 - DIRECTION
      ?auto_6674 - MODE
      ?auto_6676 - DIRECTION
      ?auto_6675 - MODE
      ?auto_6678 - DIRECTION
      ?auto_6677 - MODE
    )
    :vars
    (
      ?auto_6683 - INSTRUMENT
      ?auto_6680 - SATELLITE
      ?auto_6679 - DIRECTION
      ?auto_6682 - DIRECTION
      ?auto_6684 - INSTRUMENT
      ?auto_6685 - MODE
      ?auto_6681 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6683 ?auto_6680 ) ( SUPPORTS ?auto_6683 ?auto_6674 ) ( not ( = ?auto_6673 ?auto_6679 ) ) ( HAVE_IMAGE ?auto_6678 ?auto_6677 ) ( not ( = ?auto_6678 ?auto_6673 ) ) ( not ( = ?auto_6678 ?auto_6679 ) ) ( not ( = ?auto_6677 ?auto_6674 ) ) ( CALIBRATION_TARGET ?auto_6683 ?auto_6679 ) ( not ( = ?auto_6679 ?auto_6682 ) ) ( not ( = ?auto_6673 ?auto_6682 ) ) ( not ( = ?auto_6678 ?auto_6682 ) ) ( ON_BOARD ?auto_6684 ?auto_6680 ) ( not ( = ?auto_6683 ?auto_6684 ) ) ( SUPPORTS ?auto_6684 ?auto_6685 ) ( not ( = ?auto_6677 ?auto_6685 ) ) ( not ( = ?auto_6674 ?auto_6685 ) ) ( CALIBRATION_TARGET ?auto_6684 ?auto_6679 ) ( POINTING ?auto_6680 ?auto_6678 ) ( ON_BOARD ?auto_6681 ?auto_6680 ) ( POWER_ON ?auto_6681 ) ( not ( = ?auto_6683 ?auto_6681 ) ) ( not ( = ?auto_6684 ?auto_6681 ) ) ( HAVE_IMAGE ?auto_6676 ?auto_6675 ) ( not ( = ?auto_6673 ?auto_6676 ) ) ( not ( = ?auto_6674 ?auto_6675 ) ) ( not ( = ?auto_6676 ?auto_6678 ) ) ( not ( = ?auto_6676 ?auto_6679 ) ) ( not ( = ?auto_6676 ?auto_6682 ) ) ( not ( = ?auto_6675 ?auto_6677 ) ) ( not ( = ?auto_6675 ?auto_6685 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6678 ?auto_6677 ?auto_6673 ?auto_6674 )
      ( GET-3IMAGE-VERIFY ?auto_6673 ?auto_6674 ?auto_6676 ?auto_6675 ?auto_6678 ?auto_6677 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6686 - DIRECTION
      ?auto_6687 - MODE
      ?auto_6689 - DIRECTION
      ?auto_6688 - MODE
      ?auto_6691 - DIRECTION
      ?auto_6690 - MODE
    )
    :vars
    (
      ?auto_6695 - INSTRUMENT
      ?auto_6693 - SATELLITE
      ?auto_6692 - DIRECTION
      ?auto_6696 - INSTRUMENT
      ?auto_6694 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6695 ?auto_6693 ) ( SUPPORTS ?auto_6695 ?auto_6687 ) ( not ( = ?auto_6686 ?auto_6692 ) ) ( HAVE_IMAGE ?auto_6689 ?auto_6688 ) ( not ( = ?auto_6689 ?auto_6686 ) ) ( not ( = ?auto_6689 ?auto_6692 ) ) ( not ( = ?auto_6688 ?auto_6687 ) ) ( CALIBRATION_TARGET ?auto_6695 ?auto_6692 ) ( not ( = ?auto_6692 ?auto_6691 ) ) ( not ( = ?auto_6686 ?auto_6691 ) ) ( not ( = ?auto_6689 ?auto_6691 ) ) ( ON_BOARD ?auto_6696 ?auto_6693 ) ( not ( = ?auto_6695 ?auto_6696 ) ) ( SUPPORTS ?auto_6696 ?auto_6690 ) ( not ( = ?auto_6688 ?auto_6690 ) ) ( not ( = ?auto_6687 ?auto_6690 ) ) ( CALIBRATION_TARGET ?auto_6696 ?auto_6692 ) ( POINTING ?auto_6693 ?auto_6689 ) ( ON_BOARD ?auto_6694 ?auto_6693 ) ( POWER_ON ?auto_6694 ) ( not ( = ?auto_6695 ?auto_6694 ) ) ( not ( = ?auto_6696 ?auto_6694 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6689 ?auto_6688 ?auto_6686 ?auto_6687 )
      ( GET-3IMAGE-VERIFY ?auto_6686 ?auto_6687 ?auto_6689 ?auto_6688 ?auto_6691 ?auto_6690 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6710 - DIRECTION
      ?auto_6711 - MODE
      ?auto_6713 - DIRECTION
      ?auto_6712 - MODE
      ?auto_6715 - DIRECTION
      ?auto_6714 - MODE
    )
    :vars
    (
      ?auto_6719 - INSTRUMENT
      ?auto_6717 - SATELLITE
      ?auto_6716 - DIRECTION
      ?auto_6720 - INSTRUMENT
      ?auto_6718 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6719 ?auto_6717 ) ( SUPPORTS ?auto_6719 ?auto_6711 ) ( not ( = ?auto_6710 ?auto_6716 ) ) ( HAVE_IMAGE ?auto_6715 ?auto_6714 ) ( not ( = ?auto_6715 ?auto_6710 ) ) ( not ( = ?auto_6715 ?auto_6716 ) ) ( not ( = ?auto_6714 ?auto_6711 ) ) ( CALIBRATION_TARGET ?auto_6719 ?auto_6716 ) ( not ( = ?auto_6716 ?auto_6713 ) ) ( not ( = ?auto_6710 ?auto_6713 ) ) ( not ( = ?auto_6715 ?auto_6713 ) ) ( ON_BOARD ?auto_6720 ?auto_6717 ) ( not ( = ?auto_6719 ?auto_6720 ) ) ( SUPPORTS ?auto_6720 ?auto_6712 ) ( not ( = ?auto_6714 ?auto_6712 ) ) ( not ( = ?auto_6711 ?auto_6712 ) ) ( CALIBRATION_TARGET ?auto_6720 ?auto_6716 ) ( POINTING ?auto_6717 ?auto_6715 ) ( ON_BOARD ?auto_6718 ?auto_6717 ) ( POWER_ON ?auto_6718 ) ( not ( = ?auto_6719 ?auto_6718 ) ) ( not ( = ?auto_6720 ?auto_6718 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6715 ?auto_6714 ?auto_6710 ?auto_6711 )
      ( GET-3IMAGE-VERIFY ?auto_6710 ?auto_6711 ?auto_6713 ?auto_6712 ?auto_6715 ?auto_6714 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_6788 - DIRECTION
      ?auto_6789 - MODE
    )
    :vars
    (
      ?auto_6794 - INSTRUMENT
      ?auto_6791 - SATELLITE
      ?auto_6790 - DIRECTION
      ?auto_6798 - DIRECTION
      ?auto_6797 - MODE
      ?auto_6793 - DIRECTION
      ?auto_6795 - INSTRUMENT
      ?auto_6796 - MODE
      ?auto_6792 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6794 ?auto_6791 ) ( SUPPORTS ?auto_6794 ?auto_6789 ) ( not ( = ?auto_6788 ?auto_6790 ) ) ( not ( = ?auto_6798 ?auto_6788 ) ) ( not ( = ?auto_6798 ?auto_6790 ) ) ( not ( = ?auto_6797 ?auto_6789 ) ) ( CALIBRATION_TARGET ?auto_6794 ?auto_6790 ) ( not ( = ?auto_6790 ?auto_6793 ) ) ( not ( = ?auto_6788 ?auto_6793 ) ) ( not ( = ?auto_6798 ?auto_6793 ) ) ( ON_BOARD ?auto_6795 ?auto_6791 ) ( not ( = ?auto_6794 ?auto_6795 ) ) ( SUPPORTS ?auto_6795 ?auto_6796 ) ( not ( = ?auto_6797 ?auto_6796 ) ) ( not ( = ?auto_6789 ?auto_6796 ) ) ( CALIBRATION_TARGET ?auto_6795 ?auto_6790 ) ( POINTING ?auto_6791 ?auto_6798 ) ( ON_BOARD ?auto_6792 ?auto_6791 ) ( POWER_ON ?auto_6792 ) ( not ( = ?auto_6794 ?auto_6792 ) ) ( not ( = ?auto_6795 ?auto_6792 ) ) ( CALIBRATED ?auto_6792 ) ( SUPPORTS ?auto_6792 ?auto_6797 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6798 ?auto_6797 )
      ( GET-2IMAGE ?auto_6798 ?auto_6797 ?auto_6788 ?auto_6789 )
      ( GET-1IMAGE-VERIFY ?auto_6788 ?auto_6789 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6799 - DIRECTION
      ?auto_6800 - MODE
      ?auto_6802 - DIRECTION
      ?auto_6801 - MODE
    )
    :vars
    (
      ?auto_6806 - INSTRUMENT
      ?auto_6808 - SATELLITE
      ?auto_6807 - DIRECTION
      ?auto_6805 - DIRECTION
      ?auto_6809 - INSTRUMENT
      ?auto_6803 - MODE
      ?auto_6804 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6806 ?auto_6808 ) ( SUPPORTS ?auto_6806 ?auto_6801 ) ( not ( = ?auto_6802 ?auto_6807 ) ) ( not ( = ?auto_6799 ?auto_6802 ) ) ( not ( = ?auto_6799 ?auto_6807 ) ) ( not ( = ?auto_6800 ?auto_6801 ) ) ( CALIBRATION_TARGET ?auto_6806 ?auto_6807 ) ( not ( = ?auto_6807 ?auto_6805 ) ) ( not ( = ?auto_6802 ?auto_6805 ) ) ( not ( = ?auto_6799 ?auto_6805 ) ) ( ON_BOARD ?auto_6809 ?auto_6808 ) ( not ( = ?auto_6806 ?auto_6809 ) ) ( SUPPORTS ?auto_6809 ?auto_6803 ) ( not ( = ?auto_6800 ?auto_6803 ) ) ( not ( = ?auto_6801 ?auto_6803 ) ) ( CALIBRATION_TARGET ?auto_6809 ?auto_6807 ) ( POINTING ?auto_6808 ?auto_6799 ) ( ON_BOARD ?auto_6804 ?auto_6808 ) ( POWER_ON ?auto_6804 ) ( not ( = ?auto_6806 ?auto_6804 ) ) ( not ( = ?auto_6809 ?auto_6804 ) ) ( CALIBRATED ?auto_6804 ) ( SUPPORTS ?auto_6804 ?auto_6800 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6802 ?auto_6801 )
      ( GET-2IMAGE-VERIFY ?auto_6799 ?auto_6800 ?auto_6802 ?auto_6801 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6810 - DIRECTION
      ?auto_6811 - MODE
      ?auto_6813 - DIRECTION
      ?auto_6812 - MODE
    )
    :vars
    (
      ?auto_6814 - INSTRUMENT
      ?auto_6815 - SATELLITE
      ?auto_6817 - DIRECTION
      ?auto_6820 - DIRECTION
      ?auto_6819 - MODE
      ?auto_6818 - INSTRUMENT
      ?auto_6816 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6814 ?auto_6815 ) ( SUPPORTS ?auto_6814 ?auto_6812 ) ( not ( = ?auto_6813 ?auto_6817 ) ) ( not ( = ?auto_6820 ?auto_6813 ) ) ( not ( = ?auto_6820 ?auto_6817 ) ) ( not ( = ?auto_6819 ?auto_6812 ) ) ( CALIBRATION_TARGET ?auto_6814 ?auto_6817 ) ( not ( = ?auto_6817 ?auto_6810 ) ) ( not ( = ?auto_6813 ?auto_6810 ) ) ( not ( = ?auto_6820 ?auto_6810 ) ) ( ON_BOARD ?auto_6818 ?auto_6815 ) ( not ( = ?auto_6814 ?auto_6818 ) ) ( SUPPORTS ?auto_6818 ?auto_6811 ) ( not ( = ?auto_6819 ?auto_6811 ) ) ( not ( = ?auto_6812 ?auto_6811 ) ) ( CALIBRATION_TARGET ?auto_6818 ?auto_6817 ) ( POINTING ?auto_6815 ?auto_6820 ) ( ON_BOARD ?auto_6816 ?auto_6815 ) ( POWER_ON ?auto_6816 ) ( not ( = ?auto_6814 ?auto_6816 ) ) ( not ( = ?auto_6818 ?auto_6816 ) ) ( CALIBRATED ?auto_6816 ) ( SUPPORTS ?auto_6816 ?auto_6819 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6820 ?auto_6819 ?auto_6813 ?auto_6812 )
      ( GET-2IMAGE-VERIFY ?auto_6810 ?auto_6811 ?auto_6813 ?auto_6812 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6821 - DIRECTION
      ?auto_6822 - MODE
      ?auto_6824 - DIRECTION
      ?auto_6823 - MODE
    )
    :vars
    (
      ?auto_6825 - INSTRUMENT
      ?auto_6826 - SATELLITE
      ?auto_6829 - DIRECTION
      ?auto_6830 - DIRECTION
      ?auto_6831 - INSTRUMENT
      ?auto_6827 - MODE
      ?auto_6828 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6825 ?auto_6826 ) ( SUPPORTS ?auto_6825 ?auto_6822 ) ( not ( = ?auto_6821 ?auto_6829 ) ) ( not ( = ?auto_6824 ?auto_6821 ) ) ( not ( = ?auto_6824 ?auto_6829 ) ) ( not ( = ?auto_6823 ?auto_6822 ) ) ( CALIBRATION_TARGET ?auto_6825 ?auto_6829 ) ( not ( = ?auto_6829 ?auto_6830 ) ) ( not ( = ?auto_6821 ?auto_6830 ) ) ( not ( = ?auto_6824 ?auto_6830 ) ) ( ON_BOARD ?auto_6831 ?auto_6826 ) ( not ( = ?auto_6825 ?auto_6831 ) ) ( SUPPORTS ?auto_6831 ?auto_6827 ) ( not ( = ?auto_6823 ?auto_6827 ) ) ( not ( = ?auto_6822 ?auto_6827 ) ) ( CALIBRATION_TARGET ?auto_6831 ?auto_6829 ) ( POINTING ?auto_6826 ?auto_6824 ) ( ON_BOARD ?auto_6828 ?auto_6826 ) ( POWER_ON ?auto_6828 ) ( not ( = ?auto_6825 ?auto_6828 ) ) ( not ( = ?auto_6831 ?auto_6828 ) ) ( CALIBRATED ?auto_6828 ) ( SUPPORTS ?auto_6828 ?auto_6823 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6824 ?auto_6823 ?auto_6821 ?auto_6822 )
      ( GET-2IMAGE-VERIFY ?auto_6821 ?auto_6822 ?auto_6824 ?auto_6823 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6832 - DIRECTION
      ?auto_6833 - MODE
      ?auto_6835 - DIRECTION
      ?auto_6834 - MODE
    )
    :vars
    (
      ?auto_6836 - INSTRUMENT
      ?auto_6837 - SATELLITE
      ?auto_6839 - DIRECTION
      ?auto_6842 - DIRECTION
      ?auto_6841 - MODE
      ?auto_6840 - INSTRUMENT
      ?auto_6838 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6836 ?auto_6837 ) ( SUPPORTS ?auto_6836 ?auto_6833 ) ( not ( = ?auto_6832 ?auto_6839 ) ) ( not ( = ?auto_6842 ?auto_6832 ) ) ( not ( = ?auto_6842 ?auto_6839 ) ) ( not ( = ?auto_6841 ?auto_6833 ) ) ( CALIBRATION_TARGET ?auto_6836 ?auto_6839 ) ( not ( = ?auto_6839 ?auto_6835 ) ) ( not ( = ?auto_6832 ?auto_6835 ) ) ( not ( = ?auto_6842 ?auto_6835 ) ) ( ON_BOARD ?auto_6840 ?auto_6837 ) ( not ( = ?auto_6836 ?auto_6840 ) ) ( SUPPORTS ?auto_6840 ?auto_6834 ) ( not ( = ?auto_6841 ?auto_6834 ) ) ( not ( = ?auto_6833 ?auto_6834 ) ) ( CALIBRATION_TARGET ?auto_6840 ?auto_6839 ) ( POINTING ?auto_6837 ?auto_6842 ) ( ON_BOARD ?auto_6838 ?auto_6837 ) ( POWER_ON ?auto_6838 ) ( not ( = ?auto_6836 ?auto_6838 ) ) ( not ( = ?auto_6840 ?auto_6838 ) ) ( CALIBRATED ?auto_6838 ) ( SUPPORTS ?auto_6838 ?auto_6841 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6842 ?auto_6841 ?auto_6832 ?auto_6833 )
      ( GET-2IMAGE-VERIFY ?auto_6832 ?auto_6833 ?auto_6835 ?auto_6834 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6869 - DIRECTION
      ?auto_6870 - MODE
      ?auto_6872 - DIRECTION
      ?auto_6871 - MODE
      ?auto_6874 - DIRECTION
      ?auto_6873 - MODE
    )
    :vars
    (
      ?auto_6875 - INSTRUMENT
      ?auto_6876 - SATELLITE
      ?auto_6878 - DIRECTION
      ?auto_6879 - INSTRUMENT
      ?auto_6877 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6875 ?auto_6876 ) ( SUPPORTS ?auto_6875 ?auto_6873 ) ( not ( = ?auto_6874 ?auto_6878 ) ) ( not ( = ?auto_6869 ?auto_6874 ) ) ( not ( = ?auto_6869 ?auto_6878 ) ) ( not ( = ?auto_6870 ?auto_6873 ) ) ( CALIBRATION_TARGET ?auto_6875 ?auto_6878 ) ( not ( = ?auto_6878 ?auto_6872 ) ) ( not ( = ?auto_6874 ?auto_6872 ) ) ( not ( = ?auto_6869 ?auto_6872 ) ) ( ON_BOARD ?auto_6879 ?auto_6876 ) ( not ( = ?auto_6875 ?auto_6879 ) ) ( SUPPORTS ?auto_6879 ?auto_6871 ) ( not ( = ?auto_6870 ?auto_6871 ) ) ( not ( = ?auto_6873 ?auto_6871 ) ) ( CALIBRATION_TARGET ?auto_6879 ?auto_6878 ) ( POINTING ?auto_6876 ?auto_6869 ) ( ON_BOARD ?auto_6877 ?auto_6876 ) ( POWER_ON ?auto_6877 ) ( not ( = ?auto_6875 ?auto_6877 ) ) ( not ( = ?auto_6879 ?auto_6877 ) ) ( CALIBRATED ?auto_6877 ) ( SUPPORTS ?auto_6877 ?auto_6870 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6869 ?auto_6870 ?auto_6874 ?auto_6873 )
      ( GET-3IMAGE-VERIFY ?auto_6869 ?auto_6870 ?auto_6872 ?auto_6871 ?auto_6874 ?auto_6873 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6893 - DIRECTION
      ?auto_6894 - MODE
      ?auto_6896 - DIRECTION
      ?auto_6895 - MODE
      ?auto_6898 - DIRECTION
      ?auto_6897 - MODE
    )
    :vars
    (
      ?auto_6899 - INSTRUMENT
      ?auto_6900 - SATELLITE
      ?auto_6902 - DIRECTION
      ?auto_6903 - INSTRUMENT
      ?auto_6901 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6899 ?auto_6900 ) ( SUPPORTS ?auto_6899 ?auto_6895 ) ( not ( = ?auto_6896 ?auto_6902 ) ) ( not ( = ?auto_6893 ?auto_6896 ) ) ( not ( = ?auto_6893 ?auto_6902 ) ) ( not ( = ?auto_6894 ?auto_6895 ) ) ( CALIBRATION_TARGET ?auto_6899 ?auto_6902 ) ( not ( = ?auto_6902 ?auto_6898 ) ) ( not ( = ?auto_6896 ?auto_6898 ) ) ( not ( = ?auto_6893 ?auto_6898 ) ) ( ON_BOARD ?auto_6903 ?auto_6900 ) ( not ( = ?auto_6899 ?auto_6903 ) ) ( SUPPORTS ?auto_6903 ?auto_6897 ) ( not ( = ?auto_6894 ?auto_6897 ) ) ( not ( = ?auto_6895 ?auto_6897 ) ) ( CALIBRATION_TARGET ?auto_6903 ?auto_6902 ) ( POINTING ?auto_6900 ?auto_6893 ) ( ON_BOARD ?auto_6901 ?auto_6900 ) ( POWER_ON ?auto_6901 ) ( not ( = ?auto_6899 ?auto_6901 ) ) ( not ( = ?auto_6903 ?auto_6901 ) ) ( CALIBRATED ?auto_6901 ) ( SUPPORTS ?auto_6901 ?auto_6894 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6893 ?auto_6894 ?auto_6896 ?auto_6895 )
      ( GET-3IMAGE-VERIFY ?auto_6893 ?auto_6894 ?auto_6896 ?auto_6895 ?auto_6898 ?auto_6897 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6917 - DIRECTION
      ?auto_6918 - MODE
      ?auto_6920 - DIRECTION
      ?auto_6919 - MODE
      ?auto_6922 - DIRECTION
      ?auto_6921 - MODE
    )
    :vars
    (
      ?auto_6923 - INSTRUMENT
      ?auto_6924 - SATELLITE
      ?auto_6926 - DIRECTION
      ?auto_6927 - INSTRUMENT
      ?auto_6925 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6923 ?auto_6924 ) ( SUPPORTS ?auto_6923 ?auto_6921 ) ( not ( = ?auto_6922 ?auto_6926 ) ) ( not ( = ?auto_6920 ?auto_6922 ) ) ( not ( = ?auto_6920 ?auto_6926 ) ) ( not ( = ?auto_6919 ?auto_6921 ) ) ( CALIBRATION_TARGET ?auto_6923 ?auto_6926 ) ( not ( = ?auto_6926 ?auto_6917 ) ) ( not ( = ?auto_6922 ?auto_6917 ) ) ( not ( = ?auto_6920 ?auto_6917 ) ) ( ON_BOARD ?auto_6927 ?auto_6924 ) ( not ( = ?auto_6923 ?auto_6927 ) ) ( SUPPORTS ?auto_6927 ?auto_6918 ) ( not ( = ?auto_6919 ?auto_6918 ) ) ( not ( = ?auto_6921 ?auto_6918 ) ) ( CALIBRATION_TARGET ?auto_6927 ?auto_6926 ) ( POINTING ?auto_6924 ?auto_6920 ) ( ON_BOARD ?auto_6925 ?auto_6924 ) ( POWER_ON ?auto_6925 ) ( not ( = ?auto_6923 ?auto_6925 ) ) ( not ( = ?auto_6927 ?auto_6925 ) ) ( CALIBRATED ?auto_6925 ) ( SUPPORTS ?auto_6925 ?auto_6919 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6920 ?auto_6919 ?auto_6922 ?auto_6921 )
      ( GET-3IMAGE-VERIFY ?auto_6917 ?auto_6918 ?auto_6920 ?auto_6919 ?auto_6922 ?auto_6921 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6941 - DIRECTION
      ?auto_6942 - MODE
      ?auto_6944 - DIRECTION
      ?auto_6943 - MODE
      ?auto_6946 - DIRECTION
      ?auto_6945 - MODE
    )
    :vars
    (
      ?auto_6947 - INSTRUMENT
      ?auto_6948 - SATELLITE
      ?auto_6950 - DIRECTION
      ?auto_6951 - INSTRUMENT
      ?auto_6949 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6947 ?auto_6948 ) ( SUPPORTS ?auto_6947 ?auto_6943 ) ( not ( = ?auto_6944 ?auto_6950 ) ) ( not ( = ?auto_6946 ?auto_6944 ) ) ( not ( = ?auto_6946 ?auto_6950 ) ) ( not ( = ?auto_6945 ?auto_6943 ) ) ( CALIBRATION_TARGET ?auto_6947 ?auto_6950 ) ( not ( = ?auto_6950 ?auto_6941 ) ) ( not ( = ?auto_6944 ?auto_6941 ) ) ( not ( = ?auto_6946 ?auto_6941 ) ) ( ON_BOARD ?auto_6951 ?auto_6948 ) ( not ( = ?auto_6947 ?auto_6951 ) ) ( SUPPORTS ?auto_6951 ?auto_6942 ) ( not ( = ?auto_6945 ?auto_6942 ) ) ( not ( = ?auto_6943 ?auto_6942 ) ) ( CALIBRATION_TARGET ?auto_6951 ?auto_6950 ) ( POINTING ?auto_6948 ?auto_6946 ) ( ON_BOARD ?auto_6949 ?auto_6948 ) ( POWER_ON ?auto_6949 ) ( not ( = ?auto_6947 ?auto_6949 ) ) ( not ( = ?auto_6951 ?auto_6949 ) ) ( CALIBRATED ?auto_6949 ) ( SUPPORTS ?auto_6949 ?auto_6945 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6946 ?auto_6945 ?auto_6944 ?auto_6943 )
      ( GET-3IMAGE-VERIFY ?auto_6941 ?auto_6942 ?auto_6944 ?auto_6943 ?auto_6946 ?auto_6945 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6991 - DIRECTION
      ?auto_6992 - MODE
      ?auto_6994 - DIRECTION
      ?auto_6993 - MODE
      ?auto_6996 - DIRECTION
      ?auto_6995 - MODE
    )
    :vars
    (
      ?auto_6997 - INSTRUMENT
      ?auto_6998 - SATELLITE
      ?auto_7000 - DIRECTION
      ?auto_7001 - INSTRUMENT
      ?auto_6999 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_6997 ?auto_6998 ) ( SUPPORTS ?auto_6997 ?auto_6992 ) ( not ( = ?auto_6991 ?auto_7000 ) ) ( not ( = ?auto_6994 ?auto_6991 ) ) ( not ( = ?auto_6994 ?auto_7000 ) ) ( not ( = ?auto_6993 ?auto_6992 ) ) ( CALIBRATION_TARGET ?auto_6997 ?auto_7000 ) ( not ( = ?auto_7000 ?auto_6996 ) ) ( not ( = ?auto_6991 ?auto_6996 ) ) ( not ( = ?auto_6994 ?auto_6996 ) ) ( ON_BOARD ?auto_7001 ?auto_6998 ) ( not ( = ?auto_6997 ?auto_7001 ) ) ( SUPPORTS ?auto_7001 ?auto_6995 ) ( not ( = ?auto_6993 ?auto_6995 ) ) ( not ( = ?auto_6992 ?auto_6995 ) ) ( CALIBRATION_TARGET ?auto_7001 ?auto_7000 ) ( POINTING ?auto_6998 ?auto_6994 ) ( ON_BOARD ?auto_6999 ?auto_6998 ) ( POWER_ON ?auto_6999 ) ( not ( = ?auto_6997 ?auto_6999 ) ) ( not ( = ?auto_7001 ?auto_6999 ) ) ( CALIBRATED ?auto_6999 ) ( SUPPORTS ?auto_6999 ?auto_6993 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6994 ?auto_6993 ?auto_6991 ?auto_6992 )
      ( GET-3IMAGE-VERIFY ?auto_6991 ?auto_6992 ?auto_6994 ?auto_6993 ?auto_6996 ?auto_6995 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7015 - DIRECTION
      ?auto_7016 - MODE
      ?auto_7018 - DIRECTION
      ?auto_7017 - MODE
      ?auto_7020 - DIRECTION
      ?auto_7019 - MODE
    )
    :vars
    (
      ?auto_7021 - INSTRUMENT
      ?auto_7022 - SATELLITE
      ?auto_7024 - DIRECTION
      ?auto_7025 - INSTRUMENT
      ?auto_7023 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7021 ?auto_7022 ) ( SUPPORTS ?auto_7021 ?auto_7016 ) ( not ( = ?auto_7015 ?auto_7024 ) ) ( not ( = ?auto_7020 ?auto_7015 ) ) ( not ( = ?auto_7020 ?auto_7024 ) ) ( not ( = ?auto_7019 ?auto_7016 ) ) ( CALIBRATION_TARGET ?auto_7021 ?auto_7024 ) ( not ( = ?auto_7024 ?auto_7018 ) ) ( not ( = ?auto_7015 ?auto_7018 ) ) ( not ( = ?auto_7020 ?auto_7018 ) ) ( ON_BOARD ?auto_7025 ?auto_7022 ) ( not ( = ?auto_7021 ?auto_7025 ) ) ( SUPPORTS ?auto_7025 ?auto_7017 ) ( not ( = ?auto_7019 ?auto_7017 ) ) ( not ( = ?auto_7016 ?auto_7017 ) ) ( CALIBRATION_TARGET ?auto_7025 ?auto_7024 ) ( POINTING ?auto_7022 ?auto_7020 ) ( ON_BOARD ?auto_7023 ?auto_7022 ) ( POWER_ON ?auto_7023 ) ( not ( = ?auto_7021 ?auto_7023 ) ) ( not ( = ?auto_7025 ?auto_7023 ) ) ( CALIBRATED ?auto_7023 ) ( SUPPORTS ?auto_7023 ?auto_7019 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7020 ?auto_7019 ?auto_7015 ?auto_7016 )
      ( GET-3IMAGE-VERIFY ?auto_7015 ?auto_7016 ?auto_7018 ?auto_7017 ?auto_7020 ?auto_7019 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_7093 - DIRECTION
      ?auto_7094 - MODE
    )
    :vars
    (
      ?auto_7095 - INSTRUMENT
      ?auto_7096 - SATELLITE
      ?auto_7099 - DIRECTION
      ?auto_7103 - DIRECTION
      ?auto_7102 - MODE
      ?auto_7100 - DIRECTION
      ?auto_7101 - INSTRUMENT
      ?auto_7097 - MODE
      ?auto_7098 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7095 ?auto_7096 ) ( SUPPORTS ?auto_7095 ?auto_7094 ) ( not ( = ?auto_7093 ?auto_7099 ) ) ( not ( = ?auto_7103 ?auto_7093 ) ) ( not ( = ?auto_7103 ?auto_7099 ) ) ( not ( = ?auto_7102 ?auto_7094 ) ) ( CALIBRATION_TARGET ?auto_7095 ?auto_7099 ) ( not ( = ?auto_7099 ?auto_7100 ) ) ( not ( = ?auto_7093 ?auto_7100 ) ) ( not ( = ?auto_7103 ?auto_7100 ) ) ( ON_BOARD ?auto_7101 ?auto_7096 ) ( not ( = ?auto_7095 ?auto_7101 ) ) ( SUPPORTS ?auto_7101 ?auto_7097 ) ( not ( = ?auto_7102 ?auto_7097 ) ) ( not ( = ?auto_7094 ?auto_7097 ) ) ( CALIBRATION_TARGET ?auto_7101 ?auto_7099 ) ( ON_BOARD ?auto_7098 ?auto_7096 ) ( POWER_ON ?auto_7098 ) ( not ( = ?auto_7095 ?auto_7098 ) ) ( not ( = ?auto_7101 ?auto_7098 ) ) ( CALIBRATED ?auto_7098 ) ( SUPPORTS ?auto_7098 ?auto_7102 ) ( POINTING ?auto_7096 ?auto_7099 ) )
    :subtasks
    ( ( !TURN_TO ?auto_7096 ?auto_7103 ?auto_7099 )
      ( GET-2IMAGE ?auto_7103 ?auto_7102 ?auto_7093 ?auto_7094 )
      ( GET-1IMAGE-VERIFY ?auto_7093 ?auto_7094 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7104 - DIRECTION
      ?auto_7105 - MODE
      ?auto_7107 - DIRECTION
      ?auto_7106 - MODE
    )
    :vars
    (
      ?auto_7114 - INSTRUMENT
      ?auto_7111 - SATELLITE
      ?auto_7113 - DIRECTION
      ?auto_7110 - DIRECTION
      ?auto_7112 - INSTRUMENT
      ?auto_7108 - MODE
      ?auto_7109 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7114 ?auto_7111 ) ( SUPPORTS ?auto_7114 ?auto_7106 ) ( not ( = ?auto_7107 ?auto_7113 ) ) ( not ( = ?auto_7104 ?auto_7107 ) ) ( not ( = ?auto_7104 ?auto_7113 ) ) ( not ( = ?auto_7105 ?auto_7106 ) ) ( CALIBRATION_TARGET ?auto_7114 ?auto_7113 ) ( not ( = ?auto_7113 ?auto_7110 ) ) ( not ( = ?auto_7107 ?auto_7110 ) ) ( not ( = ?auto_7104 ?auto_7110 ) ) ( ON_BOARD ?auto_7112 ?auto_7111 ) ( not ( = ?auto_7114 ?auto_7112 ) ) ( SUPPORTS ?auto_7112 ?auto_7108 ) ( not ( = ?auto_7105 ?auto_7108 ) ) ( not ( = ?auto_7106 ?auto_7108 ) ) ( CALIBRATION_TARGET ?auto_7112 ?auto_7113 ) ( ON_BOARD ?auto_7109 ?auto_7111 ) ( POWER_ON ?auto_7109 ) ( not ( = ?auto_7114 ?auto_7109 ) ) ( not ( = ?auto_7112 ?auto_7109 ) ) ( CALIBRATED ?auto_7109 ) ( SUPPORTS ?auto_7109 ?auto_7105 ) ( POINTING ?auto_7111 ?auto_7113 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_7107 ?auto_7106 )
      ( GET-2IMAGE-VERIFY ?auto_7104 ?auto_7105 ?auto_7107 ?auto_7106 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7115 - DIRECTION
      ?auto_7116 - MODE
      ?auto_7118 - DIRECTION
      ?auto_7117 - MODE
    )
    :vars
    (
      ?auto_7121 - INSTRUMENT
      ?auto_7120 - SATELLITE
      ?auto_7122 - DIRECTION
      ?auto_7125 - DIRECTION
      ?auto_7124 - MODE
      ?auto_7123 - INSTRUMENT
      ?auto_7119 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7121 ?auto_7120 ) ( SUPPORTS ?auto_7121 ?auto_7117 ) ( not ( = ?auto_7118 ?auto_7122 ) ) ( not ( = ?auto_7125 ?auto_7118 ) ) ( not ( = ?auto_7125 ?auto_7122 ) ) ( not ( = ?auto_7124 ?auto_7117 ) ) ( CALIBRATION_TARGET ?auto_7121 ?auto_7122 ) ( not ( = ?auto_7122 ?auto_7115 ) ) ( not ( = ?auto_7118 ?auto_7115 ) ) ( not ( = ?auto_7125 ?auto_7115 ) ) ( ON_BOARD ?auto_7123 ?auto_7120 ) ( not ( = ?auto_7121 ?auto_7123 ) ) ( SUPPORTS ?auto_7123 ?auto_7116 ) ( not ( = ?auto_7124 ?auto_7116 ) ) ( not ( = ?auto_7117 ?auto_7116 ) ) ( CALIBRATION_TARGET ?auto_7123 ?auto_7122 ) ( ON_BOARD ?auto_7119 ?auto_7120 ) ( POWER_ON ?auto_7119 ) ( not ( = ?auto_7121 ?auto_7119 ) ) ( not ( = ?auto_7123 ?auto_7119 ) ) ( CALIBRATED ?auto_7119 ) ( SUPPORTS ?auto_7119 ?auto_7124 ) ( POINTING ?auto_7120 ?auto_7122 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7125 ?auto_7124 ?auto_7118 ?auto_7117 )
      ( GET-2IMAGE-VERIFY ?auto_7115 ?auto_7116 ?auto_7118 ?auto_7117 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7126 - DIRECTION
      ?auto_7127 - MODE
      ?auto_7129 - DIRECTION
      ?auto_7128 - MODE
    )
    :vars
    (
      ?auto_7133 - INSTRUMENT
      ?auto_7131 - SATELLITE
      ?auto_7134 - DIRECTION
      ?auto_7132 - DIRECTION
      ?auto_7135 - INSTRUMENT
      ?auto_7136 - MODE
      ?auto_7130 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7133 ?auto_7131 ) ( SUPPORTS ?auto_7133 ?auto_7127 ) ( not ( = ?auto_7126 ?auto_7134 ) ) ( not ( = ?auto_7129 ?auto_7126 ) ) ( not ( = ?auto_7129 ?auto_7134 ) ) ( not ( = ?auto_7128 ?auto_7127 ) ) ( CALIBRATION_TARGET ?auto_7133 ?auto_7134 ) ( not ( = ?auto_7134 ?auto_7132 ) ) ( not ( = ?auto_7126 ?auto_7132 ) ) ( not ( = ?auto_7129 ?auto_7132 ) ) ( ON_BOARD ?auto_7135 ?auto_7131 ) ( not ( = ?auto_7133 ?auto_7135 ) ) ( SUPPORTS ?auto_7135 ?auto_7136 ) ( not ( = ?auto_7128 ?auto_7136 ) ) ( not ( = ?auto_7127 ?auto_7136 ) ) ( CALIBRATION_TARGET ?auto_7135 ?auto_7134 ) ( ON_BOARD ?auto_7130 ?auto_7131 ) ( POWER_ON ?auto_7130 ) ( not ( = ?auto_7133 ?auto_7130 ) ) ( not ( = ?auto_7135 ?auto_7130 ) ) ( CALIBRATED ?auto_7130 ) ( SUPPORTS ?auto_7130 ?auto_7128 ) ( POINTING ?auto_7131 ?auto_7134 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7129 ?auto_7128 ?auto_7126 ?auto_7127 )
      ( GET-2IMAGE-VERIFY ?auto_7126 ?auto_7127 ?auto_7129 ?auto_7128 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7137 - DIRECTION
      ?auto_7138 - MODE
      ?auto_7140 - DIRECTION
      ?auto_7139 - MODE
    )
    :vars
    (
      ?auto_7143 - INSTRUMENT
      ?auto_7142 - SATELLITE
      ?auto_7144 - DIRECTION
      ?auto_7147 - DIRECTION
      ?auto_7146 - MODE
      ?auto_7145 - INSTRUMENT
      ?auto_7141 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7143 ?auto_7142 ) ( SUPPORTS ?auto_7143 ?auto_7138 ) ( not ( = ?auto_7137 ?auto_7144 ) ) ( not ( = ?auto_7147 ?auto_7137 ) ) ( not ( = ?auto_7147 ?auto_7144 ) ) ( not ( = ?auto_7146 ?auto_7138 ) ) ( CALIBRATION_TARGET ?auto_7143 ?auto_7144 ) ( not ( = ?auto_7144 ?auto_7140 ) ) ( not ( = ?auto_7137 ?auto_7140 ) ) ( not ( = ?auto_7147 ?auto_7140 ) ) ( ON_BOARD ?auto_7145 ?auto_7142 ) ( not ( = ?auto_7143 ?auto_7145 ) ) ( SUPPORTS ?auto_7145 ?auto_7139 ) ( not ( = ?auto_7146 ?auto_7139 ) ) ( not ( = ?auto_7138 ?auto_7139 ) ) ( CALIBRATION_TARGET ?auto_7145 ?auto_7144 ) ( ON_BOARD ?auto_7141 ?auto_7142 ) ( POWER_ON ?auto_7141 ) ( not ( = ?auto_7143 ?auto_7141 ) ) ( not ( = ?auto_7145 ?auto_7141 ) ) ( CALIBRATED ?auto_7141 ) ( SUPPORTS ?auto_7141 ?auto_7146 ) ( POINTING ?auto_7142 ?auto_7144 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7147 ?auto_7146 ?auto_7137 ?auto_7138 )
      ( GET-2IMAGE-VERIFY ?auto_7137 ?auto_7138 ?auto_7140 ?auto_7139 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7174 - DIRECTION
      ?auto_7175 - MODE
      ?auto_7177 - DIRECTION
      ?auto_7176 - MODE
      ?auto_7179 - DIRECTION
      ?auto_7178 - MODE
    )
    :vars
    (
      ?auto_7182 - INSTRUMENT
      ?auto_7181 - SATELLITE
      ?auto_7183 - DIRECTION
      ?auto_7184 - INSTRUMENT
      ?auto_7180 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7182 ?auto_7181 ) ( SUPPORTS ?auto_7182 ?auto_7178 ) ( not ( = ?auto_7179 ?auto_7183 ) ) ( not ( = ?auto_7174 ?auto_7179 ) ) ( not ( = ?auto_7174 ?auto_7183 ) ) ( not ( = ?auto_7175 ?auto_7178 ) ) ( CALIBRATION_TARGET ?auto_7182 ?auto_7183 ) ( not ( = ?auto_7183 ?auto_7177 ) ) ( not ( = ?auto_7179 ?auto_7177 ) ) ( not ( = ?auto_7174 ?auto_7177 ) ) ( ON_BOARD ?auto_7184 ?auto_7181 ) ( not ( = ?auto_7182 ?auto_7184 ) ) ( SUPPORTS ?auto_7184 ?auto_7176 ) ( not ( = ?auto_7175 ?auto_7176 ) ) ( not ( = ?auto_7178 ?auto_7176 ) ) ( CALIBRATION_TARGET ?auto_7184 ?auto_7183 ) ( ON_BOARD ?auto_7180 ?auto_7181 ) ( POWER_ON ?auto_7180 ) ( not ( = ?auto_7182 ?auto_7180 ) ) ( not ( = ?auto_7184 ?auto_7180 ) ) ( CALIBRATED ?auto_7180 ) ( SUPPORTS ?auto_7180 ?auto_7175 ) ( POINTING ?auto_7181 ?auto_7183 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7174 ?auto_7175 ?auto_7179 ?auto_7178 )
      ( GET-3IMAGE-VERIFY ?auto_7174 ?auto_7175 ?auto_7177 ?auto_7176 ?auto_7179 ?auto_7178 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7198 - DIRECTION
      ?auto_7199 - MODE
      ?auto_7201 - DIRECTION
      ?auto_7200 - MODE
      ?auto_7203 - DIRECTION
      ?auto_7202 - MODE
    )
    :vars
    (
      ?auto_7206 - INSTRUMENT
      ?auto_7205 - SATELLITE
      ?auto_7207 - DIRECTION
      ?auto_7208 - INSTRUMENT
      ?auto_7204 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7206 ?auto_7205 ) ( SUPPORTS ?auto_7206 ?auto_7200 ) ( not ( = ?auto_7201 ?auto_7207 ) ) ( not ( = ?auto_7198 ?auto_7201 ) ) ( not ( = ?auto_7198 ?auto_7207 ) ) ( not ( = ?auto_7199 ?auto_7200 ) ) ( CALIBRATION_TARGET ?auto_7206 ?auto_7207 ) ( not ( = ?auto_7207 ?auto_7203 ) ) ( not ( = ?auto_7201 ?auto_7203 ) ) ( not ( = ?auto_7198 ?auto_7203 ) ) ( ON_BOARD ?auto_7208 ?auto_7205 ) ( not ( = ?auto_7206 ?auto_7208 ) ) ( SUPPORTS ?auto_7208 ?auto_7202 ) ( not ( = ?auto_7199 ?auto_7202 ) ) ( not ( = ?auto_7200 ?auto_7202 ) ) ( CALIBRATION_TARGET ?auto_7208 ?auto_7207 ) ( ON_BOARD ?auto_7204 ?auto_7205 ) ( POWER_ON ?auto_7204 ) ( not ( = ?auto_7206 ?auto_7204 ) ) ( not ( = ?auto_7208 ?auto_7204 ) ) ( CALIBRATED ?auto_7204 ) ( SUPPORTS ?auto_7204 ?auto_7199 ) ( POINTING ?auto_7205 ?auto_7207 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7198 ?auto_7199 ?auto_7201 ?auto_7200 )
      ( GET-3IMAGE-VERIFY ?auto_7198 ?auto_7199 ?auto_7201 ?auto_7200 ?auto_7203 ?auto_7202 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7222 - DIRECTION
      ?auto_7223 - MODE
      ?auto_7225 - DIRECTION
      ?auto_7224 - MODE
      ?auto_7227 - DIRECTION
      ?auto_7226 - MODE
    )
    :vars
    (
      ?auto_7230 - INSTRUMENT
      ?auto_7229 - SATELLITE
      ?auto_7231 - DIRECTION
      ?auto_7232 - INSTRUMENT
      ?auto_7228 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7230 ?auto_7229 ) ( SUPPORTS ?auto_7230 ?auto_7226 ) ( not ( = ?auto_7227 ?auto_7231 ) ) ( not ( = ?auto_7225 ?auto_7227 ) ) ( not ( = ?auto_7225 ?auto_7231 ) ) ( not ( = ?auto_7224 ?auto_7226 ) ) ( CALIBRATION_TARGET ?auto_7230 ?auto_7231 ) ( not ( = ?auto_7231 ?auto_7222 ) ) ( not ( = ?auto_7227 ?auto_7222 ) ) ( not ( = ?auto_7225 ?auto_7222 ) ) ( ON_BOARD ?auto_7232 ?auto_7229 ) ( not ( = ?auto_7230 ?auto_7232 ) ) ( SUPPORTS ?auto_7232 ?auto_7223 ) ( not ( = ?auto_7224 ?auto_7223 ) ) ( not ( = ?auto_7226 ?auto_7223 ) ) ( CALIBRATION_TARGET ?auto_7232 ?auto_7231 ) ( ON_BOARD ?auto_7228 ?auto_7229 ) ( POWER_ON ?auto_7228 ) ( not ( = ?auto_7230 ?auto_7228 ) ) ( not ( = ?auto_7232 ?auto_7228 ) ) ( CALIBRATED ?auto_7228 ) ( SUPPORTS ?auto_7228 ?auto_7224 ) ( POINTING ?auto_7229 ?auto_7231 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7225 ?auto_7224 ?auto_7227 ?auto_7226 )
      ( GET-3IMAGE-VERIFY ?auto_7222 ?auto_7223 ?auto_7225 ?auto_7224 ?auto_7227 ?auto_7226 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7246 - DIRECTION
      ?auto_7247 - MODE
      ?auto_7249 - DIRECTION
      ?auto_7248 - MODE
      ?auto_7251 - DIRECTION
      ?auto_7250 - MODE
    )
    :vars
    (
      ?auto_7254 - INSTRUMENT
      ?auto_7253 - SATELLITE
      ?auto_7255 - DIRECTION
      ?auto_7256 - INSTRUMENT
      ?auto_7252 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7254 ?auto_7253 ) ( SUPPORTS ?auto_7254 ?auto_7248 ) ( not ( = ?auto_7249 ?auto_7255 ) ) ( not ( = ?auto_7251 ?auto_7249 ) ) ( not ( = ?auto_7251 ?auto_7255 ) ) ( not ( = ?auto_7250 ?auto_7248 ) ) ( CALIBRATION_TARGET ?auto_7254 ?auto_7255 ) ( not ( = ?auto_7255 ?auto_7246 ) ) ( not ( = ?auto_7249 ?auto_7246 ) ) ( not ( = ?auto_7251 ?auto_7246 ) ) ( ON_BOARD ?auto_7256 ?auto_7253 ) ( not ( = ?auto_7254 ?auto_7256 ) ) ( SUPPORTS ?auto_7256 ?auto_7247 ) ( not ( = ?auto_7250 ?auto_7247 ) ) ( not ( = ?auto_7248 ?auto_7247 ) ) ( CALIBRATION_TARGET ?auto_7256 ?auto_7255 ) ( ON_BOARD ?auto_7252 ?auto_7253 ) ( POWER_ON ?auto_7252 ) ( not ( = ?auto_7254 ?auto_7252 ) ) ( not ( = ?auto_7256 ?auto_7252 ) ) ( CALIBRATED ?auto_7252 ) ( SUPPORTS ?auto_7252 ?auto_7250 ) ( POINTING ?auto_7253 ?auto_7255 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7251 ?auto_7250 ?auto_7249 ?auto_7248 )
      ( GET-3IMAGE-VERIFY ?auto_7246 ?auto_7247 ?auto_7249 ?auto_7248 ?auto_7251 ?auto_7250 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7296 - DIRECTION
      ?auto_7297 - MODE
      ?auto_7299 - DIRECTION
      ?auto_7298 - MODE
      ?auto_7301 - DIRECTION
      ?auto_7300 - MODE
    )
    :vars
    (
      ?auto_7304 - INSTRUMENT
      ?auto_7303 - SATELLITE
      ?auto_7305 - DIRECTION
      ?auto_7306 - INSTRUMENT
      ?auto_7302 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7304 ?auto_7303 ) ( SUPPORTS ?auto_7304 ?auto_7297 ) ( not ( = ?auto_7296 ?auto_7305 ) ) ( not ( = ?auto_7299 ?auto_7296 ) ) ( not ( = ?auto_7299 ?auto_7305 ) ) ( not ( = ?auto_7298 ?auto_7297 ) ) ( CALIBRATION_TARGET ?auto_7304 ?auto_7305 ) ( not ( = ?auto_7305 ?auto_7301 ) ) ( not ( = ?auto_7296 ?auto_7301 ) ) ( not ( = ?auto_7299 ?auto_7301 ) ) ( ON_BOARD ?auto_7306 ?auto_7303 ) ( not ( = ?auto_7304 ?auto_7306 ) ) ( SUPPORTS ?auto_7306 ?auto_7300 ) ( not ( = ?auto_7298 ?auto_7300 ) ) ( not ( = ?auto_7297 ?auto_7300 ) ) ( CALIBRATION_TARGET ?auto_7306 ?auto_7305 ) ( ON_BOARD ?auto_7302 ?auto_7303 ) ( POWER_ON ?auto_7302 ) ( not ( = ?auto_7304 ?auto_7302 ) ) ( not ( = ?auto_7306 ?auto_7302 ) ) ( CALIBRATED ?auto_7302 ) ( SUPPORTS ?auto_7302 ?auto_7298 ) ( POINTING ?auto_7303 ?auto_7305 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7299 ?auto_7298 ?auto_7296 ?auto_7297 )
      ( GET-3IMAGE-VERIFY ?auto_7296 ?auto_7297 ?auto_7299 ?auto_7298 ?auto_7301 ?auto_7300 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7320 - DIRECTION
      ?auto_7321 - MODE
      ?auto_7323 - DIRECTION
      ?auto_7322 - MODE
      ?auto_7325 - DIRECTION
      ?auto_7324 - MODE
    )
    :vars
    (
      ?auto_7328 - INSTRUMENT
      ?auto_7327 - SATELLITE
      ?auto_7329 - DIRECTION
      ?auto_7330 - INSTRUMENT
      ?auto_7326 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7328 ?auto_7327 ) ( SUPPORTS ?auto_7328 ?auto_7321 ) ( not ( = ?auto_7320 ?auto_7329 ) ) ( not ( = ?auto_7325 ?auto_7320 ) ) ( not ( = ?auto_7325 ?auto_7329 ) ) ( not ( = ?auto_7324 ?auto_7321 ) ) ( CALIBRATION_TARGET ?auto_7328 ?auto_7329 ) ( not ( = ?auto_7329 ?auto_7323 ) ) ( not ( = ?auto_7320 ?auto_7323 ) ) ( not ( = ?auto_7325 ?auto_7323 ) ) ( ON_BOARD ?auto_7330 ?auto_7327 ) ( not ( = ?auto_7328 ?auto_7330 ) ) ( SUPPORTS ?auto_7330 ?auto_7322 ) ( not ( = ?auto_7324 ?auto_7322 ) ) ( not ( = ?auto_7321 ?auto_7322 ) ) ( CALIBRATION_TARGET ?auto_7330 ?auto_7329 ) ( ON_BOARD ?auto_7326 ?auto_7327 ) ( POWER_ON ?auto_7326 ) ( not ( = ?auto_7328 ?auto_7326 ) ) ( not ( = ?auto_7330 ?auto_7326 ) ) ( CALIBRATED ?auto_7326 ) ( SUPPORTS ?auto_7326 ?auto_7324 ) ( POINTING ?auto_7327 ?auto_7329 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7325 ?auto_7324 ?auto_7320 ?auto_7321 )
      ( GET-3IMAGE-VERIFY ?auto_7320 ?auto_7321 ?auto_7323 ?auto_7322 ?auto_7325 ?auto_7324 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_7398 - DIRECTION
      ?auto_7399 - MODE
    )
    :vars
    (
      ?auto_7403 - INSTRUMENT
      ?auto_7401 - SATELLITE
      ?auto_7404 - DIRECTION
      ?auto_7408 - DIRECTION
      ?auto_7407 - MODE
      ?auto_7402 - DIRECTION
      ?auto_7405 - INSTRUMENT
      ?auto_7406 - MODE
      ?auto_7400 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7403 ?auto_7401 ) ( SUPPORTS ?auto_7403 ?auto_7399 ) ( not ( = ?auto_7398 ?auto_7404 ) ) ( not ( = ?auto_7408 ?auto_7398 ) ) ( not ( = ?auto_7408 ?auto_7404 ) ) ( not ( = ?auto_7407 ?auto_7399 ) ) ( CALIBRATION_TARGET ?auto_7403 ?auto_7404 ) ( not ( = ?auto_7404 ?auto_7402 ) ) ( not ( = ?auto_7398 ?auto_7402 ) ) ( not ( = ?auto_7408 ?auto_7402 ) ) ( ON_BOARD ?auto_7405 ?auto_7401 ) ( not ( = ?auto_7403 ?auto_7405 ) ) ( SUPPORTS ?auto_7405 ?auto_7406 ) ( not ( = ?auto_7407 ?auto_7406 ) ) ( not ( = ?auto_7399 ?auto_7406 ) ) ( CALIBRATION_TARGET ?auto_7405 ?auto_7404 ) ( ON_BOARD ?auto_7400 ?auto_7401 ) ( POWER_ON ?auto_7400 ) ( not ( = ?auto_7403 ?auto_7400 ) ) ( not ( = ?auto_7405 ?auto_7400 ) ) ( SUPPORTS ?auto_7400 ?auto_7407 ) ( POINTING ?auto_7401 ?auto_7404 ) ( CALIBRATION_TARGET ?auto_7400 ?auto_7404 ) ( NOT_CALIBRATED ?auto_7400 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_7401 ?auto_7400 ?auto_7404 )
      ( GET-2IMAGE ?auto_7408 ?auto_7407 ?auto_7398 ?auto_7399 )
      ( GET-1IMAGE-VERIFY ?auto_7398 ?auto_7399 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7409 - DIRECTION
      ?auto_7410 - MODE
      ?auto_7412 - DIRECTION
      ?auto_7411 - MODE
    )
    :vars
    (
      ?auto_7414 - INSTRUMENT
      ?auto_7416 - SATELLITE
      ?auto_7419 - DIRECTION
      ?auto_7418 - DIRECTION
      ?auto_7413 - INSTRUMENT
      ?auto_7415 - MODE
      ?auto_7417 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7414 ?auto_7416 ) ( SUPPORTS ?auto_7414 ?auto_7411 ) ( not ( = ?auto_7412 ?auto_7419 ) ) ( not ( = ?auto_7409 ?auto_7412 ) ) ( not ( = ?auto_7409 ?auto_7419 ) ) ( not ( = ?auto_7410 ?auto_7411 ) ) ( CALIBRATION_TARGET ?auto_7414 ?auto_7419 ) ( not ( = ?auto_7419 ?auto_7418 ) ) ( not ( = ?auto_7412 ?auto_7418 ) ) ( not ( = ?auto_7409 ?auto_7418 ) ) ( ON_BOARD ?auto_7413 ?auto_7416 ) ( not ( = ?auto_7414 ?auto_7413 ) ) ( SUPPORTS ?auto_7413 ?auto_7415 ) ( not ( = ?auto_7410 ?auto_7415 ) ) ( not ( = ?auto_7411 ?auto_7415 ) ) ( CALIBRATION_TARGET ?auto_7413 ?auto_7419 ) ( ON_BOARD ?auto_7417 ?auto_7416 ) ( POWER_ON ?auto_7417 ) ( not ( = ?auto_7414 ?auto_7417 ) ) ( not ( = ?auto_7413 ?auto_7417 ) ) ( SUPPORTS ?auto_7417 ?auto_7410 ) ( POINTING ?auto_7416 ?auto_7419 ) ( CALIBRATION_TARGET ?auto_7417 ?auto_7419 ) ( NOT_CALIBRATED ?auto_7417 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_7412 ?auto_7411 )
      ( GET-2IMAGE-VERIFY ?auto_7409 ?auto_7410 ?auto_7412 ?auto_7411 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7420 - DIRECTION
      ?auto_7421 - MODE
      ?auto_7423 - DIRECTION
      ?auto_7422 - MODE
    )
    :vars
    (
      ?auto_7426 - INSTRUMENT
      ?auto_7425 - SATELLITE
      ?auto_7427 - DIRECTION
      ?auto_7430 - DIRECTION
      ?auto_7429 - MODE
      ?auto_7428 - INSTRUMENT
      ?auto_7424 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7426 ?auto_7425 ) ( SUPPORTS ?auto_7426 ?auto_7422 ) ( not ( = ?auto_7423 ?auto_7427 ) ) ( not ( = ?auto_7430 ?auto_7423 ) ) ( not ( = ?auto_7430 ?auto_7427 ) ) ( not ( = ?auto_7429 ?auto_7422 ) ) ( CALIBRATION_TARGET ?auto_7426 ?auto_7427 ) ( not ( = ?auto_7427 ?auto_7420 ) ) ( not ( = ?auto_7423 ?auto_7420 ) ) ( not ( = ?auto_7430 ?auto_7420 ) ) ( ON_BOARD ?auto_7428 ?auto_7425 ) ( not ( = ?auto_7426 ?auto_7428 ) ) ( SUPPORTS ?auto_7428 ?auto_7421 ) ( not ( = ?auto_7429 ?auto_7421 ) ) ( not ( = ?auto_7422 ?auto_7421 ) ) ( CALIBRATION_TARGET ?auto_7428 ?auto_7427 ) ( ON_BOARD ?auto_7424 ?auto_7425 ) ( POWER_ON ?auto_7424 ) ( not ( = ?auto_7426 ?auto_7424 ) ) ( not ( = ?auto_7428 ?auto_7424 ) ) ( SUPPORTS ?auto_7424 ?auto_7429 ) ( POINTING ?auto_7425 ?auto_7427 ) ( CALIBRATION_TARGET ?auto_7424 ?auto_7427 ) ( NOT_CALIBRATED ?auto_7424 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7430 ?auto_7429 ?auto_7423 ?auto_7422 )
      ( GET-2IMAGE-VERIFY ?auto_7420 ?auto_7421 ?auto_7423 ?auto_7422 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7431 - DIRECTION
      ?auto_7432 - MODE
      ?auto_7434 - DIRECTION
      ?auto_7433 - MODE
    )
    :vars
    (
      ?auto_7437 - INSTRUMENT
      ?auto_7436 - SATELLITE
      ?auto_7439 - DIRECTION
      ?auto_7441 - DIRECTION
      ?auto_7440 - INSTRUMENT
      ?auto_7438 - MODE
      ?auto_7435 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7437 ?auto_7436 ) ( SUPPORTS ?auto_7437 ?auto_7432 ) ( not ( = ?auto_7431 ?auto_7439 ) ) ( not ( = ?auto_7434 ?auto_7431 ) ) ( not ( = ?auto_7434 ?auto_7439 ) ) ( not ( = ?auto_7433 ?auto_7432 ) ) ( CALIBRATION_TARGET ?auto_7437 ?auto_7439 ) ( not ( = ?auto_7439 ?auto_7441 ) ) ( not ( = ?auto_7431 ?auto_7441 ) ) ( not ( = ?auto_7434 ?auto_7441 ) ) ( ON_BOARD ?auto_7440 ?auto_7436 ) ( not ( = ?auto_7437 ?auto_7440 ) ) ( SUPPORTS ?auto_7440 ?auto_7438 ) ( not ( = ?auto_7433 ?auto_7438 ) ) ( not ( = ?auto_7432 ?auto_7438 ) ) ( CALIBRATION_TARGET ?auto_7440 ?auto_7439 ) ( ON_BOARD ?auto_7435 ?auto_7436 ) ( POWER_ON ?auto_7435 ) ( not ( = ?auto_7437 ?auto_7435 ) ) ( not ( = ?auto_7440 ?auto_7435 ) ) ( SUPPORTS ?auto_7435 ?auto_7433 ) ( POINTING ?auto_7436 ?auto_7439 ) ( CALIBRATION_TARGET ?auto_7435 ?auto_7439 ) ( NOT_CALIBRATED ?auto_7435 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7434 ?auto_7433 ?auto_7431 ?auto_7432 )
      ( GET-2IMAGE-VERIFY ?auto_7431 ?auto_7432 ?auto_7434 ?auto_7433 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7442 - DIRECTION
      ?auto_7443 - MODE
      ?auto_7445 - DIRECTION
      ?auto_7444 - MODE
    )
    :vars
    (
      ?auto_7448 - INSTRUMENT
      ?auto_7447 - SATELLITE
      ?auto_7449 - DIRECTION
      ?auto_7452 - DIRECTION
      ?auto_7451 - MODE
      ?auto_7450 - INSTRUMENT
      ?auto_7446 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7448 ?auto_7447 ) ( SUPPORTS ?auto_7448 ?auto_7443 ) ( not ( = ?auto_7442 ?auto_7449 ) ) ( not ( = ?auto_7452 ?auto_7442 ) ) ( not ( = ?auto_7452 ?auto_7449 ) ) ( not ( = ?auto_7451 ?auto_7443 ) ) ( CALIBRATION_TARGET ?auto_7448 ?auto_7449 ) ( not ( = ?auto_7449 ?auto_7445 ) ) ( not ( = ?auto_7442 ?auto_7445 ) ) ( not ( = ?auto_7452 ?auto_7445 ) ) ( ON_BOARD ?auto_7450 ?auto_7447 ) ( not ( = ?auto_7448 ?auto_7450 ) ) ( SUPPORTS ?auto_7450 ?auto_7444 ) ( not ( = ?auto_7451 ?auto_7444 ) ) ( not ( = ?auto_7443 ?auto_7444 ) ) ( CALIBRATION_TARGET ?auto_7450 ?auto_7449 ) ( ON_BOARD ?auto_7446 ?auto_7447 ) ( POWER_ON ?auto_7446 ) ( not ( = ?auto_7448 ?auto_7446 ) ) ( not ( = ?auto_7450 ?auto_7446 ) ) ( SUPPORTS ?auto_7446 ?auto_7451 ) ( POINTING ?auto_7447 ?auto_7449 ) ( CALIBRATION_TARGET ?auto_7446 ?auto_7449 ) ( NOT_CALIBRATED ?auto_7446 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7452 ?auto_7451 ?auto_7442 ?auto_7443 )
      ( GET-2IMAGE-VERIFY ?auto_7442 ?auto_7443 ?auto_7445 ?auto_7444 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7479 - DIRECTION
      ?auto_7480 - MODE
      ?auto_7482 - DIRECTION
      ?auto_7481 - MODE
      ?auto_7484 - DIRECTION
      ?auto_7483 - MODE
    )
    :vars
    (
      ?auto_7487 - INSTRUMENT
      ?auto_7486 - SATELLITE
      ?auto_7488 - DIRECTION
      ?auto_7489 - INSTRUMENT
      ?auto_7485 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7487 ?auto_7486 ) ( SUPPORTS ?auto_7487 ?auto_7483 ) ( not ( = ?auto_7484 ?auto_7488 ) ) ( not ( = ?auto_7479 ?auto_7484 ) ) ( not ( = ?auto_7479 ?auto_7488 ) ) ( not ( = ?auto_7480 ?auto_7483 ) ) ( CALIBRATION_TARGET ?auto_7487 ?auto_7488 ) ( not ( = ?auto_7488 ?auto_7482 ) ) ( not ( = ?auto_7484 ?auto_7482 ) ) ( not ( = ?auto_7479 ?auto_7482 ) ) ( ON_BOARD ?auto_7489 ?auto_7486 ) ( not ( = ?auto_7487 ?auto_7489 ) ) ( SUPPORTS ?auto_7489 ?auto_7481 ) ( not ( = ?auto_7480 ?auto_7481 ) ) ( not ( = ?auto_7483 ?auto_7481 ) ) ( CALIBRATION_TARGET ?auto_7489 ?auto_7488 ) ( ON_BOARD ?auto_7485 ?auto_7486 ) ( POWER_ON ?auto_7485 ) ( not ( = ?auto_7487 ?auto_7485 ) ) ( not ( = ?auto_7489 ?auto_7485 ) ) ( SUPPORTS ?auto_7485 ?auto_7480 ) ( POINTING ?auto_7486 ?auto_7488 ) ( CALIBRATION_TARGET ?auto_7485 ?auto_7488 ) ( NOT_CALIBRATED ?auto_7485 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7479 ?auto_7480 ?auto_7484 ?auto_7483 )
      ( GET-3IMAGE-VERIFY ?auto_7479 ?auto_7480 ?auto_7482 ?auto_7481 ?auto_7484 ?auto_7483 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7503 - DIRECTION
      ?auto_7504 - MODE
      ?auto_7506 - DIRECTION
      ?auto_7505 - MODE
      ?auto_7508 - DIRECTION
      ?auto_7507 - MODE
    )
    :vars
    (
      ?auto_7511 - INSTRUMENT
      ?auto_7510 - SATELLITE
      ?auto_7512 - DIRECTION
      ?auto_7513 - INSTRUMENT
      ?auto_7509 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7511 ?auto_7510 ) ( SUPPORTS ?auto_7511 ?auto_7505 ) ( not ( = ?auto_7506 ?auto_7512 ) ) ( not ( = ?auto_7503 ?auto_7506 ) ) ( not ( = ?auto_7503 ?auto_7512 ) ) ( not ( = ?auto_7504 ?auto_7505 ) ) ( CALIBRATION_TARGET ?auto_7511 ?auto_7512 ) ( not ( = ?auto_7512 ?auto_7508 ) ) ( not ( = ?auto_7506 ?auto_7508 ) ) ( not ( = ?auto_7503 ?auto_7508 ) ) ( ON_BOARD ?auto_7513 ?auto_7510 ) ( not ( = ?auto_7511 ?auto_7513 ) ) ( SUPPORTS ?auto_7513 ?auto_7507 ) ( not ( = ?auto_7504 ?auto_7507 ) ) ( not ( = ?auto_7505 ?auto_7507 ) ) ( CALIBRATION_TARGET ?auto_7513 ?auto_7512 ) ( ON_BOARD ?auto_7509 ?auto_7510 ) ( POWER_ON ?auto_7509 ) ( not ( = ?auto_7511 ?auto_7509 ) ) ( not ( = ?auto_7513 ?auto_7509 ) ) ( SUPPORTS ?auto_7509 ?auto_7504 ) ( POINTING ?auto_7510 ?auto_7512 ) ( CALIBRATION_TARGET ?auto_7509 ?auto_7512 ) ( NOT_CALIBRATED ?auto_7509 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7503 ?auto_7504 ?auto_7506 ?auto_7505 )
      ( GET-3IMAGE-VERIFY ?auto_7503 ?auto_7504 ?auto_7506 ?auto_7505 ?auto_7508 ?auto_7507 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7527 - DIRECTION
      ?auto_7528 - MODE
      ?auto_7530 - DIRECTION
      ?auto_7529 - MODE
      ?auto_7532 - DIRECTION
      ?auto_7531 - MODE
    )
    :vars
    (
      ?auto_7535 - INSTRUMENT
      ?auto_7534 - SATELLITE
      ?auto_7536 - DIRECTION
      ?auto_7537 - INSTRUMENT
      ?auto_7533 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7535 ?auto_7534 ) ( SUPPORTS ?auto_7535 ?auto_7531 ) ( not ( = ?auto_7532 ?auto_7536 ) ) ( not ( = ?auto_7530 ?auto_7532 ) ) ( not ( = ?auto_7530 ?auto_7536 ) ) ( not ( = ?auto_7529 ?auto_7531 ) ) ( CALIBRATION_TARGET ?auto_7535 ?auto_7536 ) ( not ( = ?auto_7536 ?auto_7527 ) ) ( not ( = ?auto_7532 ?auto_7527 ) ) ( not ( = ?auto_7530 ?auto_7527 ) ) ( ON_BOARD ?auto_7537 ?auto_7534 ) ( not ( = ?auto_7535 ?auto_7537 ) ) ( SUPPORTS ?auto_7537 ?auto_7528 ) ( not ( = ?auto_7529 ?auto_7528 ) ) ( not ( = ?auto_7531 ?auto_7528 ) ) ( CALIBRATION_TARGET ?auto_7537 ?auto_7536 ) ( ON_BOARD ?auto_7533 ?auto_7534 ) ( POWER_ON ?auto_7533 ) ( not ( = ?auto_7535 ?auto_7533 ) ) ( not ( = ?auto_7537 ?auto_7533 ) ) ( SUPPORTS ?auto_7533 ?auto_7529 ) ( POINTING ?auto_7534 ?auto_7536 ) ( CALIBRATION_TARGET ?auto_7533 ?auto_7536 ) ( NOT_CALIBRATED ?auto_7533 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7530 ?auto_7529 ?auto_7532 ?auto_7531 )
      ( GET-3IMAGE-VERIFY ?auto_7527 ?auto_7528 ?auto_7530 ?auto_7529 ?auto_7532 ?auto_7531 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7551 - DIRECTION
      ?auto_7552 - MODE
      ?auto_7554 - DIRECTION
      ?auto_7553 - MODE
      ?auto_7556 - DIRECTION
      ?auto_7555 - MODE
    )
    :vars
    (
      ?auto_7559 - INSTRUMENT
      ?auto_7558 - SATELLITE
      ?auto_7560 - DIRECTION
      ?auto_7561 - INSTRUMENT
      ?auto_7557 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7559 ?auto_7558 ) ( SUPPORTS ?auto_7559 ?auto_7553 ) ( not ( = ?auto_7554 ?auto_7560 ) ) ( not ( = ?auto_7556 ?auto_7554 ) ) ( not ( = ?auto_7556 ?auto_7560 ) ) ( not ( = ?auto_7555 ?auto_7553 ) ) ( CALIBRATION_TARGET ?auto_7559 ?auto_7560 ) ( not ( = ?auto_7560 ?auto_7551 ) ) ( not ( = ?auto_7554 ?auto_7551 ) ) ( not ( = ?auto_7556 ?auto_7551 ) ) ( ON_BOARD ?auto_7561 ?auto_7558 ) ( not ( = ?auto_7559 ?auto_7561 ) ) ( SUPPORTS ?auto_7561 ?auto_7552 ) ( not ( = ?auto_7555 ?auto_7552 ) ) ( not ( = ?auto_7553 ?auto_7552 ) ) ( CALIBRATION_TARGET ?auto_7561 ?auto_7560 ) ( ON_BOARD ?auto_7557 ?auto_7558 ) ( POWER_ON ?auto_7557 ) ( not ( = ?auto_7559 ?auto_7557 ) ) ( not ( = ?auto_7561 ?auto_7557 ) ) ( SUPPORTS ?auto_7557 ?auto_7555 ) ( POINTING ?auto_7558 ?auto_7560 ) ( CALIBRATION_TARGET ?auto_7557 ?auto_7560 ) ( NOT_CALIBRATED ?auto_7557 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7556 ?auto_7555 ?auto_7554 ?auto_7553 )
      ( GET-3IMAGE-VERIFY ?auto_7551 ?auto_7552 ?auto_7554 ?auto_7553 ?auto_7556 ?auto_7555 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7601 - DIRECTION
      ?auto_7602 - MODE
      ?auto_7604 - DIRECTION
      ?auto_7603 - MODE
      ?auto_7606 - DIRECTION
      ?auto_7605 - MODE
    )
    :vars
    (
      ?auto_7609 - INSTRUMENT
      ?auto_7608 - SATELLITE
      ?auto_7610 - DIRECTION
      ?auto_7611 - INSTRUMENT
      ?auto_7607 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7609 ?auto_7608 ) ( SUPPORTS ?auto_7609 ?auto_7602 ) ( not ( = ?auto_7601 ?auto_7610 ) ) ( not ( = ?auto_7604 ?auto_7601 ) ) ( not ( = ?auto_7604 ?auto_7610 ) ) ( not ( = ?auto_7603 ?auto_7602 ) ) ( CALIBRATION_TARGET ?auto_7609 ?auto_7610 ) ( not ( = ?auto_7610 ?auto_7606 ) ) ( not ( = ?auto_7601 ?auto_7606 ) ) ( not ( = ?auto_7604 ?auto_7606 ) ) ( ON_BOARD ?auto_7611 ?auto_7608 ) ( not ( = ?auto_7609 ?auto_7611 ) ) ( SUPPORTS ?auto_7611 ?auto_7605 ) ( not ( = ?auto_7603 ?auto_7605 ) ) ( not ( = ?auto_7602 ?auto_7605 ) ) ( CALIBRATION_TARGET ?auto_7611 ?auto_7610 ) ( ON_BOARD ?auto_7607 ?auto_7608 ) ( POWER_ON ?auto_7607 ) ( not ( = ?auto_7609 ?auto_7607 ) ) ( not ( = ?auto_7611 ?auto_7607 ) ) ( SUPPORTS ?auto_7607 ?auto_7603 ) ( POINTING ?auto_7608 ?auto_7610 ) ( CALIBRATION_TARGET ?auto_7607 ?auto_7610 ) ( NOT_CALIBRATED ?auto_7607 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7604 ?auto_7603 ?auto_7601 ?auto_7602 )
      ( GET-3IMAGE-VERIFY ?auto_7601 ?auto_7602 ?auto_7604 ?auto_7603 ?auto_7606 ?auto_7605 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7625 - DIRECTION
      ?auto_7626 - MODE
      ?auto_7628 - DIRECTION
      ?auto_7627 - MODE
      ?auto_7630 - DIRECTION
      ?auto_7629 - MODE
    )
    :vars
    (
      ?auto_7633 - INSTRUMENT
      ?auto_7632 - SATELLITE
      ?auto_7634 - DIRECTION
      ?auto_7635 - INSTRUMENT
      ?auto_7631 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7633 ?auto_7632 ) ( SUPPORTS ?auto_7633 ?auto_7626 ) ( not ( = ?auto_7625 ?auto_7634 ) ) ( not ( = ?auto_7630 ?auto_7625 ) ) ( not ( = ?auto_7630 ?auto_7634 ) ) ( not ( = ?auto_7629 ?auto_7626 ) ) ( CALIBRATION_TARGET ?auto_7633 ?auto_7634 ) ( not ( = ?auto_7634 ?auto_7628 ) ) ( not ( = ?auto_7625 ?auto_7628 ) ) ( not ( = ?auto_7630 ?auto_7628 ) ) ( ON_BOARD ?auto_7635 ?auto_7632 ) ( not ( = ?auto_7633 ?auto_7635 ) ) ( SUPPORTS ?auto_7635 ?auto_7627 ) ( not ( = ?auto_7629 ?auto_7627 ) ) ( not ( = ?auto_7626 ?auto_7627 ) ) ( CALIBRATION_TARGET ?auto_7635 ?auto_7634 ) ( ON_BOARD ?auto_7631 ?auto_7632 ) ( POWER_ON ?auto_7631 ) ( not ( = ?auto_7633 ?auto_7631 ) ) ( not ( = ?auto_7635 ?auto_7631 ) ) ( SUPPORTS ?auto_7631 ?auto_7629 ) ( POINTING ?auto_7632 ?auto_7634 ) ( CALIBRATION_TARGET ?auto_7631 ?auto_7634 ) ( NOT_CALIBRATED ?auto_7631 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7630 ?auto_7629 ?auto_7625 ?auto_7626 )
      ( GET-3IMAGE-VERIFY ?auto_7625 ?auto_7626 ?auto_7628 ?auto_7627 ?auto_7630 ?auto_7629 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_7703 - DIRECTION
      ?auto_7704 - MODE
    )
    :vars
    (
      ?auto_7707 - INSTRUMENT
      ?auto_7706 - SATELLITE
      ?auto_7709 - DIRECTION
      ?auto_7713 - DIRECTION
      ?auto_7712 - MODE
      ?auto_7711 - DIRECTION
      ?auto_7710 - INSTRUMENT
      ?auto_7708 - MODE
      ?auto_7705 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7707 ?auto_7706 ) ( SUPPORTS ?auto_7707 ?auto_7704 ) ( not ( = ?auto_7703 ?auto_7709 ) ) ( not ( = ?auto_7713 ?auto_7703 ) ) ( not ( = ?auto_7713 ?auto_7709 ) ) ( not ( = ?auto_7712 ?auto_7704 ) ) ( CALIBRATION_TARGET ?auto_7707 ?auto_7709 ) ( not ( = ?auto_7709 ?auto_7711 ) ) ( not ( = ?auto_7703 ?auto_7711 ) ) ( not ( = ?auto_7713 ?auto_7711 ) ) ( ON_BOARD ?auto_7710 ?auto_7706 ) ( not ( = ?auto_7707 ?auto_7710 ) ) ( SUPPORTS ?auto_7710 ?auto_7708 ) ( not ( = ?auto_7712 ?auto_7708 ) ) ( not ( = ?auto_7704 ?auto_7708 ) ) ( CALIBRATION_TARGET ?auto_7710 ?auto_7709 ) ( ON_BOARD ?auto_7705 ?auto_7706 ) ( not ( = ?auto_7707 ?auto_7705 ) ) ( not ( = ?auto_7710 ?auto_7705 ) ) ( SUPPORTS ?auto_7705 ?auto_7712 ) ( POINTING ?auto_7706 ?auto_7709 ) ( CALIBRATION_TARGET ?auto_7705 ?auto_7709 ) ( POWER_AVAIL ?auto_7706 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_7705 ?auto_7706 )
      ( GET-2IMAGE ?auto_7713 ?auto_7712 ?auto_7703 ?auto_7704 )
      ( GET-1IMAGE-VERIFY ?auto_7703 ?auto_7704 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7714 - DIRECTION
      ?auto_7715 - MODE
      ?auto_7717 - DIRECTION
      ?auto_7716 - MODE
    )
    :vars
    (
      ?auto_7724 - INSTRUMENT
      ?auto_7720 - SATELLITE
      ?auto_7722 - DIRECTION
      ?auto_7723 - DIRECTION
      ?auto_7721 - INSTRUMENT
      ?auto_7719 - MODE
      ?auto_7718 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7724 ?auto_7720 ) ( SUPPORTS ?auto_7724 ?auto_7716 ) ( not ( = ?auto_7717 ?auto_7722 ) ) ( not ( = ?auto_7714 ?auto_7717 ) ) ( not ( = ?auto_7714 ?auto_7722 ) ) ( not ( = ?auto_7715 ?auto_7716 ) ) ( CALIBRATION_TARGET ?auto_7724 ?auto_7722 ) ( not ( = ?auto_7722 ?auto_7723 ) ) ( not ( = ?auto_7717 ?auto_7723 ) ) ( not ( = ?auto_7714 ?auto_7723 ) ) ( ON_BOARD ?auto_7721 ?auto_7720 ) ( not ( = ?auto_7724 ?auto_7721 ) ) ( SUPPORTS ?auto_7721 ?auto_7719 ) ( not ( = ?auto_7715 ?auto_7719 ) ) ( not ( = ?auto_7716 ?auto_7719 ) ) ( CALIBRATION_TARGET ?auto_7721 ?auto_7722 ) ( ON_BOARD ?auto_7718 ?auto_7720 ) ( not ( = ?auto_7724 ?auto_7718 ) ) ( not ( = ?auto_7721 ?auto_7718 ) ) ( SUPPORTS ?auto_7718 ?auto_7715 ) ( POINTING ?auto_7720 ?auto_7722 ) ( CALIBRATION_TARGET ?auto_7718 ?auto_7722 ) ( POWER_AVAIL ?auto_7720 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_7717 ?auto_7716 )
      ( GET-2IMAGE-VERIFY ?auto_7714 ?auto_7715 ?auto_7717 ?auto_7716 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7725 - DIRECTION
      ?auto_7726 - MODE
      ?auto_7728 - DIRECTION
      ?auto_7727 - MODE
    )
    :vars
    (
      ?auto_7731 - INSTRUMENT
      ?auto_7733 - SATELLITE
      ?auto_7732 - DIRECTION
      ?auto_7735 - DIRECTION
      ?auto_7734 - MODE
      ?auto_7730 - INSTRUMENT
      ?auto_7729 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7731 ?auto_7733 ) ( SUPPORTS ?auto_7731 ?auto_7727 ) ( not ( = ?auto_7728 ?auto_7732 ) ) ( not ( = ?auto_7735 ?auto_7728 ) ) ( not ( = ?auto_7735 ?auto_7732 ) ) ( not ( = ?auto_7734 ?auto_7727 ) ) ( CALIBRATION_TARGET ?auto_7731 ?auto_7732 ) ( not ( = ?auto_7732 ?auto_7725 ) ) ( not ( = ?auto_7728 ?auto_7725 ) ) ( not ( = ?auto_7735 ?auto_7725 ) ) ( ON_BOARD ?auto_7730 ?auto_7733 ) ( not ( = ?auto_7731 ?auto_7730 ) ) ( SUPPORTS ?auto_7730 ?auto_7726 ) ( not ( = ?auto_7734 ?auto_7726 ) ) ( not ( = ?auto_7727 ?auto_7726 ) ) ( CALIBRATION_TARGET ?auto_7730 ?auto_7732 ) ( ON_BOARD ?auto_7729 ?auto_7733 ) ( not ( = ?auto_7731 ?auto_7729 ) ) ( not ( = ?auto_7730 ?auto_7729 ) ) ( SUPPORTS ?auto_7729 ?auto_7734 ) ( POINTING ?auto_7733 ?auto_7732 ) ( CALIBRATION_TARGET ?auto_7729 ?auto_7732 ) ( POWER_AVAIL ?auto_7733 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7735 ?auto_7734 ?auto_7728 ?auto_7727 )
      ( GET-2IMAGE-VERIFY ?auto_7725 ?auto_7726 ?auto_7728 ?auto_7727 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7736 - DIRECTION
      ?auto_7737 - MODE
      ?auto_7739 - DIRECTION
      ?auto_7738 - MODE
    )
    :vars
    (
      ?auto_7742 - INSTRUMENT
      ?auto_7744 - SATELLITE
      ?auto_7743 - DIRECTION
      ?auto_7746 - DIRECTION
      ?auto_7741 - INSTRUMENT
      ?auto_7745 - MODE
      ?auto_7740 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7742 ?auto_7744 ) ( SUPPORTS ?auto_7742 ?auto_7737 ) ( not ( = ?auto_7736 ?auto_7743 ) ) ( not ( = ?auto_7739 ?auto_7736 ) ) ( not ( = ?auto_7739 ?auto_7743 ) ) ( not ( = ?auto_7738 ?auto_7737 ) ) ( CALIBRATION_TARGET ?auto_7742 ?auto_7743 ) ( not ( = ?auto_7743 ?auto_7746 ) ) ( not ( = ?auto_7736 ?auto_7746 ) ) ( not ( = ?auto_7739 ?auto_7746 ) ) ( ON_BOARD ?auto_7741 ?auto_7744 ) ( not ( = ?auto_7742 ?auto_7741 ) ) ( SUPPORTS ?auto_7741 ?auto_7745 ) ( not ( = ?auto_7738 ?auto_7745 ) ) ( not ( = ?auto_7737 ?auto_7745 ) ) ( CALIBRATION_TARGET ?auto_7741 ?auto_7743 ) ( ON_BOARD ?auto_7740 ?auto_7744 ) ( not ( = ?auto_7742 ?auto_7740 ) ) ( not ( = ?auto_7741 ?auto_7740 ) ) ( SUPPORTS ?auto_7740 ?auto_7738 ) ( POINTING ?auto_7744 ?auto_7743 ) ( CALIBRATION_TARGET ?auto_7740 ?auto_7743 ) ( POWER_AVAIL ?auto_7744 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7739 ?auto_7738 ?auto_7736 ?auto_7737 )
      ( GET-2IMAGE-VERIFY ?auto_7736 ?auto_7737 ?auto_7739 ?auto_7738 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7747 - DIRECTION
      ?auto_7748 - MODE
      ?auto_7750 - DIRECTION
      ?auto_7749 - MODE
    )
    :vars
    (
      ?auto_7753 - INSTRUMENT
      ?auto_7755 - SATELLITE
      ?auto_7754 - DIRECTION
      ?auto_7757 - DIRECTION
      ?auto_7756 - MODE
      ?auto_7752 - INSTRUMENT
      ?auto_7751 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7753 ?auto_7755 ) ( SUPPORTS ?auto_7753 ?auto_7748 ) ( not ( = ?auto_7747 ?auto_7754 ) ) ( not ( = ?auto_7757 ?auto_7747 ) ) ( not ( = ?auto_7757 ?auto_7754 ) ) ( not ( = ?auto_7756 ?auto_7748 ) ) ( CALIBRATION_TARGET ?auto_7753 ?auto_7754 ) ( not ( = ?auto_7754 ?auto_7750 ) ) ( not ( = ?auto_7747 ?auto_7750 ) ) ( not ( = ?auto_7757 ?auto_7750 ) ) ( ON_BOARD ?auto_7752 ?auto_7755 ) ( not ( = ?auto_7753 ?auto_7752 ) ) ( SUPPORTS ?auto_7752 ?auto_7749 ) ( not ( = ?auto_7756 ?auto_7749 ) ) ( not ( = ?auto_7748 ?auto_7749 ) ) ( CALIBRATION_TARGET ?auto_7752 ?auto_7754 ) ( ON_BOARD ?auto_7751 ?auto_7755 ) ( not ( = ?auto_7753 ?auto_7751 ) ) ( not ( = ?auto_7752 ?auto_7751 ) ) ( SUPPORTS ?auto_7751 ?auto_7756 ) ( POINTING ?auto_7755 ?auto_7754 ) ( CALIBRATION_TARGET ?auto_7751 ?auto_7754 ) ( POWER_AVAIL ?auto_7755 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7757 ?auto_7756 ?auto_7747 ?auto_7748 )
      ( GET-2IMAGE-VERIFY ?auto_7747 ?auto_7748 ?auto_7750 ?auto_7749 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7784 - DIRECTION
      ?auto_7785 - MODE
      ?auto_7787 - DIRECTION
      ?auto_7786 - MODE
      ?auto_7789 - DIRECTION
      ?auto_7788 - MODE
    )
    :vars
    (
      ?auto_7792 - INSTRUMENT
      ?auto_7794 - SATELLITE
      ?auto_7793 - DIRECTION
      ?auto_7791 - INSTRUMENT
      ?auto_7790 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7792 ?auto_7794 ) ( SUPPORTS ?auto_7792 ?auto_7788 ) ( not ( = ?auto_7789 ?auto_7793 ) ) ( not ( = ?auto_7784 ?auto_7789 ) ) ( not ( = ?auto_7784 ?auto_7793 ) ) ( not ( = ?auto_7785 ?auto_7788 ) ) ( CALIBRATION_TARGET ?auto_7792 ?auto_7793 ) ( not ( = ?auto_7793 ?auto_7787 ) ) ( not ( = ?auto_7789 ?auto_7787 ) ) ( not ( = ?auto_7784 ?auto_7787 ) ) ( ON_BOARD ?auto_7791 ?auto_7794 ) ( not ( = ?auto_7792 ?auto_7791 ) ) ( SUPPORTS ?auto_7791 ?auto_7786 ) ( not ( = ?auto_7785 ?auto_7786 ) ) ( not ( = ?auto_7788 ?auto_7786 ) ) ( CALIBRATION_TARGET ?auto_7791 ?auto_7793 ) ( ON_BOARD ?auto_7790 ?auto_7794 ) ( not ( = ?auto_7792 ?auto_7790 ) ) ( not ( = ?auto_7791 ?auto_7790 ) ) ( SUPPORTS ?auto_7790 ?auto_7785 ) ( POINTING ?auto_7794 ?auto_7793 ) ( CALIBRATION_TARGET ?auto_7790 ?auto_7793 ) ( POWER_AVAIL ?auto_7794 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7784 ?auto_7785 ?auto_7789 ?auto_7788 )
      ( GET-3IMAGE-VERIFY ?auto_7784 ?auto_7785 ?auto_7787 ?auto_7786 ?auto_7789 ?auto_7788 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7808 - DIRECTION
      ?auto_7809 - MODE
      ?auto_7811 - DIRECTION
      ?auto_7810 - MODE
      ?auto_7813 - DIRECTION
      ?auto_7812 - MODE
    )
    :vars
    (
      ?auto_7816 - INSTRUMENT
      ?auto_7818 - SATELLITE
      ?auto_7817 - DIRECTION
      ?auto_7815 - INSTRUMENT
      ?auto_7814 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7816 ?auto_7818 ) ( SUPPORTS ?auto_7816 ?auto_7810 ) ( not ( = ?auto_7811 ?auto_7817 ) ) ( not ( = ?auto_7808 ?auto_7811 ) ) ( not ( = ?auto_7808 ?auto_7817 ) ) ( not ( = ?auto_7809 ?auto_7810 ) ) ( CALIBRATION_TARGET ?auto_7816 ?auto_7817 ) ( not ( = ?auto_7817 ?auto_7813 ) ) ( not ( = ?auto_7811 ?auto_7813 ) ) ( not ( = ?auto_7808 ?auto_7813 ) ) ( ON_BOARD ?auto_7815 ?auto_7818 ) ( not ( = ?auto_7816 ?auto_7815 ) ) ( SUPPORTS ?auto_7815 ?auto_7812 ) ( not ( = ?auto_7809 ?auto_7812 ) ) ( not ( = ?auto_7810 ?auto_7812 ) ) ( CALIBRATION_TARGET ?auto_7815 ?auto_7817 ) ( ON_BOARD ?auto_7814 ?auto_7818 ) ( not ( = ?auto_7816 ?auto_7814 ) ) ( not ( = ?auto_7815 ?auto_7814 ) ) ( SUPPORTS ?auto_7814 ?auto_7809 ) ( POINTING ?auto_7818 ?auto_7817 ) ( CALIBRATION_TARGET ?auto_7814 ?auto_7817 ) ( POWER_AVAIL ?auto_7818 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7808 ?auto_7809 ?auto_7811 ?auto_7810 )
      ( GET-3IMAGE-VERIFY ?auto_7808 ?auto_7809 ?auto_7811 ?auto_7810 ?auto_7813 ?auto_7812 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7832 - DIRECTION
      ?auto_7833 - MODE
      ?auto_7835 - DIRECTION
      ?auto_7834 - MODE
      ?auto_7837 - DIRECTION
      ?auto_7836 - MODE
    )
    :vars
    (
      ?auto_7840 - INSTRUMENT
      ?auto_7842 - SATELLITE
      ?auto_7841 - DIRECTION
      ?auto_7839 - INSTRUMENT
      ?auto_7838 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7840 ?auto_7842 ) ( SUPPORTS ?auto_7840 ?auto_7836 ) ( not ( = ?auto_7837 ?auto_7841 ) ) ( not ( = ?auto_7835 ?auto_7837 ) ) ( not ( = ?auto_7835 ?auto_7841 ) ) ( not ( = ?auto_7834 ?auto_7836 ) ) ( CALIBRATION_TARGET ?auto_7840 ?auto_7841 ) ( not ( = ?auto_7841 ?auto_7832 ) ) ( not ( = ?auto_7837 ?auto_7832 ) ) ( not ( = ?auto_7835 ?auto_7832 ) ) ( ON_BOARD ?auto_7839 ?auto_7842 ) ( not ( = ?auto_7840 ?auto_7839 ) ) ( SUPPORTS ?auto_7839 ?auto_7833 ) ( not ( = ?auto_7834 ?auto_7833 ) ) ( not ( = ?auto_7836 ?auto_7833 ) ) ( CALIBRATION_TARGET ?auto_7839 ?auto_7841 ) ( ON_BOARD ?auto_7838 ?auto_7842 ) ( not ( = ?auto_7840 ?auto_7838 ) ) ( not ( = ?auto_7839 ?auto_7838 ) ) ( SUPPORTS ?auto_7838 ?auto_7834 ) ( POINTING ?auto_7842 ?auto_7841 ) ( CALIBRATION_TARGET ?auto_7838 ?auto_7841 ) ( POWER_AVAIL ?auto_7842 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7835 ?auto_7834 ?auto_7837 ?auto_7836 )
      ( GET-3IMAGE-VERIFY ?auto_7832 ?auto_7833 ?auto_7835 ?auto_7834 ?auto_7837 ?auto_7836 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7856 - DIRECTION
      ?auto_7857 - MODE
      ?auto_7859 - DIRECTION
      ?auto_7858 - MODE
      ?auto_7861 - DIRECTION
      ?auto_7860 - MODE
    )
    :vars
    (
      ?auto_7864 - INSTRUMENT
      ?auto_7866 - SATELLITE
      ?auto_7865 - DIRECTION
      ?auto_7863 - INSTRUMENT
      ?auto_7862 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7864 ?auto_7866 ) ( SUPPORTS ?auto_7864 ?auto_7858 ) ( not ( = ?auto_7859 ?auto_7865 ) ) ( not ( = ?auto_7861 ?auto_7859 ) ) ( not ( = ?auto_7861 ?auto_7865 ) ) ( not ( = ?auto_7860 ?auto_7858 ) ) ( CALIBRATION_TARGET ?auto_7864 ?auto_7865 ) ( not ( = ?auto_7865 ?auto_7856 ) ) ( not ( = ?auto_7859 ?auto_7856 ) ) ( not ( = ?auto_7861 ?auto_7856 ) ) ( ON_BOARD ?auto_7863 ?auto_7866 ) ( not ( = ?auto_7864 ?auto_7863 ) ) ( SUPPORTS ?auto_7863 ?auto_7857 ) ( not ( = ?auto_7860 ?auto_7857 ) ) ( not ( = ?auto_7858 ?auto_7857 ) ) ( CALIBRATION_TARGET ?auto_7863 ?auto_7865 ) ( ON_BOARD ?auto_7862 ?auto_7866 ) ( not ( = ?auto_7864 ?auto_7862 ) ) ( not ( = ?auto_7863 ?auto_7862 ) ) ( SUPPORTS ?auto_7862 ?auto_7860 ) ( POINTING ?auto_7866 ?auto_7865 ) ( CALIBRATION_TARGET ?auto_7862 ?auto_7865 ) ( POWER_AVAIL ?auto_7866 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7861 ?auto_7860 ?auto_7859 ?auto_7858 )
      ( GET-3IMAGE-VERIFY ?auto_7856 ?auto_7857 ?auto_7859 ?auto_7858 ?auto_7861 ?auto_7860 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7906 - DIRECTION
      ?auto_7907 - MODE
      ?auto_7909 - DIRECTION
      ?auto_7908 - MODE
      ?auto_7911 - DIRECTION
      ?auto_7910 - MODE
    )
    :vars
    (
      ?auto_7914 - INSTRUMENT
      ?auto_7916 - SATELLITE
      ?auto_7915 - DIRECTION
      ?auto_7913 - INSTRUMENT
      ?auto_7912 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7914 ?auto_7916 ) ( SUPPORTS ?auto_7914 ?auto_7907 ) ( not ( = ?auto_7906 ?auto_7915 ) ) ( not ( = ?auto_7909 ?auto_7906 ) ) ( not ( = ?auto_7909 ?auto_7915 ) ) ( not ( = ?auto_7908 ?auto_7907 ) ) ( CALIBRATION_TARGET ?auto_7914 ?auto_7915 ) ( not ( = ?auto_7915 ?auto_7911 ) ) ( not ( = ?auto_7906 ?auto_7911 ) ) ( not ( = ?auto_7909 ?auto_7911 ) ) ( ON_BOARD ?auto_7913 ?auto_7916 ) ( not ( = ?auto_7914 ?auto_7913 ) ) ( SUPPORTS ?auto_7913 ?auto_7910 ) ( not ( = ?auto_7908 ?auto_7910 ) ) ( not ( = ?auto_7907 ?auto_7910 ) ) ( CALIBRATION_TARGET ?auto_7913 ?auto_7915 ) ( ON_BOARD ?auto_7912 ?auto_7916 ) ( not ( = ?auto_7914 ?auto_7912 ) ) ( not ( = ?auto_7913 ?auto_7912 ) ) ( SUPPORTS ?auto_7912 ?auto_7908 ) ( POINTING ?auto_7916 ?auto_7915 ) ( CALIBRATION_TARGET ?auto_7912 ?auto_7915 ) ( POWER_AVAIL ?auto_7916 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7909 ?auto_7908 ?auto_7906 ?auto_7907 )
      ( GET-3IMAGE-VERIFY ?auto_7906 ?auto_7907 ?auto_7909 ?auto_7908 ?auto_7911 ?auto_7910 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7930 - DIRECTION
      ?auto_7931 - MODE
      ?auto_7933 - DIRECTION
      ?auto_7932 - MODE
      ?auto_7935 - DIRECTION
      ?auto_7934 - MODE
    )
    :vars
    (
      ?auto_7938 - INSTRUMENT
      ?auto_7940 - SATELLITE
      ?auto_7939 - DIRECTION
      ?auto_7937 - INSTRUMENT
      ?auto_7936 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7938 ?auto_7940 ) ( SUPPORTS ?auto_7938 ?auto_7931 ) ( not ( = ?auto_7930 ?auto_7939 ) ) ( not ( = ?auto_7935 ?auto_7930 ) ) ( not ( = ?auto_7935 ?auto_7939 ) ) ( not ( = ?auto_7934 ?auto_7931 ) ) ( CALIBRATION_TARGET ?auto_7938 ?auto_7939 ) ( not ( = ?auto_7939 ?auto_7933 ) ) ( not ( = ?auto_7930 ?auto_7933 ) ) ( not ( = ?auto_7935 ?auto_7933 ) ) ( ON_BOARD ?auto_7937 ?auto_7940 ) ( not ( = ?auto_7938 ?auto_7937 ) ) ( SUPPORTS ?auto_7937 ?auto_7932 ) ( not ( = ?auto_7934 ?auto_7932 ) ) ( not ( = ?auto_7931 ?auto_7932 ) ) ( CALIBRATION_TARGET ?auto_7937 ?auto_7939 ) ( ON_BOARD ?auto_7936 ?auto_7940 ) ( not ( = ?auto_7938 ?auto_7936 ) ) ( not ( = ?auto_7937 ?auto_7936 ) ) ( SUPPORTS ?auto_7936 ?auto_7934 ) ( POINTING ?auto_7940 ?auto_7939 ) ( CALIBRATION_TARGET ?auto_7936 ?auto_7939 ) ( POWER_AVAIL ?auto_7940 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7935 ?auto_7934 ?auto_7930 ?auto_7931 )
      ( GET-3IMAGE-VERIFY ?auto_7930 ?auto_7931 ?auto_7933 ?auto_7932 ?auto_7935 ?auto_7934 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8008 - DIRECTION
      ?auto_8009 - MODE
    )
    :vars
    (
      ?auto_8012 - INSTRUMENT
      ?auto_8014 - SATELLITE
      ?auto_8013 - DIRECTION
      ?auto_8018 - DIRECTION
      ?auto_8017 - MODE
      ?auto_8016 - DIRECTION
      ?auto_8011 - INSTRUMENT
      ?auto_8015 - MODE
      ?auto_8010 - INSTRUMENT
      ?auto_8019 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8012 ?auto_8014 ) ( SUPPORTS ?auto_8012 ?auto_8009 ) ( not ( = ?auto_8008 ?auto_8013 ) ) ( not ( = ?auto_8018 ?auto_8008 ) ) ( not ( = ?auto_8018 ?auto_8013 ) ) ( not ( = ?auto_8017 ?auto_8009 ) ) ( CALIBRATION_TARGET ?auto_8012 ?auto_8013 ) ( not ( = ?auto_8013 ?auto_8016 ) ) ( not ( = ?auto_8008 ?auto_8016 ) ) ( not ( = ?auto_8018 ?auto_8016 ) ) ( ON_BOARD ?auto_8011 ?auto_8014 ) ( not ( = ?auto_8012 ?auto_8011 ) ) ( SUPPORTS ?auto_8011 ?auto_8015 ) ( not ( = ?auto_8017 ?auto_8015 ) ) ( not ( = ?auto_8009 ?auto_8015 ) ) ( CALIBRATION_TARGET ?auto_8011 ?auto_8013 ) ( ON_BOARD ?auto_8010 ?auto_8014 ) ( not ( = ?auto_8012 ?auto_8010 ) ) ( not ( = ?auto_8011 ?auto_8010 ) ) ( SUPPORTS ?auto_8010 ?auto_8017 ) ( CALIBRATION_TARGET ?auto_8010 ?auto_8013 ) ( POWER_AVAIL ?auto_8014 ) ( POINTING ?auto_8014 ?auto_8019 ) ( not ( = ?auto_8013 ?auto_8019 ) ) ( not ( = ?auto_8008 ?auto_8019 ) ) ( not ( = ?auto_8018 ?auto_8019 ) ) ( not ( = ?auto_8016 ?auto_8019 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_8014 ?auto_8013 ?auto_8019 )
      ( GET-2IMAGE ?auto_8018 ?auto_8017 ?auto_8008 ?auto_8009 )
      ( GET-1IMAGE-VERIFY ?auto_8008 ?auto_8009 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8020 - DIRECTION
      ?auto_8021 - MODE
      ?auto_8023 - DIRECTION
      ?auto_8022 - MODE
    )
    :vars
    (
      ?auto_8029 - INSTRUMENT
      ?auto_8024 - SATELLITE
      ?auto_8027 - DIRECTION
      ?auto_8025 - DIRECTION
      ?auto_8028 - INSTRUMENT
      ?auto_8026 - MODE
      ?auto_8030 - INSTRUMENT
      ?auto_8031 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8029 ?auto_8024 ) ( SUPPORTS ?auto_8029 ?auto_8022 ) ( not ( = ?auto_8023 ?auto_8027 ) ) ( not ( = ?auto_8020 ?auto_8023 ) ) ( not ( = ?auto_8020 ?auto_8027 ) ) ( not ( = ?auto_8021 ?auto_8022 ) ) ( CALIBRATION_TARGET ?auto_8029 ?auto_8027 ) ( not ( = ?auto_8027 ?auto_8025 ) ) ( not ( = ?auto_8023 ?auto_8025 ) ) ( not ( = ?auto_8020 ?auto_8025 ) ) ( ON_BOARD ?auto_8028 ?auto_8024 ) ( not ( = ?auto_8029 ?auto_8028 ) ) ( SUPPORTS ?auto_8028 ?auto_8026 ) ( not ( = ?auto_8021 ?auto_8026 ) ) ( not ( = ?auto_8022 ?auto_8026 ) ) ( CALIBRATION_TARGET ?auto_8028 ?auto_8027 ) ( ON_BOARD ?auto_8030 ?auto_8024 ) ( not ( = ?auto_8029 ?auto_8030 ) ) ( not ( = ?auto_8028 ?auto_8030 ) ) ( SUPPORTS ?auto_8030 ?auto_8021 ) ( CALIBRATION_TARGET ?auto_8030 ?auto_8027 ) ( POWER_AVAIL ?auto_8024 ) ( POINTING ?auto_8024 ?auto_8031 ) ( not ( = ?auto_8027 ?auto_8031 ) ) ( not ( = ?auto_8023 ?auto_8031 ) ) ( not ( = ?auto_8020 ?auto_8031 ) ) ( not ( = ?auto_8025 ?auto_8031 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8023 ?auto_8022 )
      ( GET-2IMAGE-VERIFY ?auto_8020 ?auto_8021 ?auto_8023 ?auto_8022 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8032 - DIRECTION
      ?auto_8033 - MODE
      ?auto_8035 - DIRECTION
      ?auto_8034 - MODE
    )
    :vars
    (
      ?auto_8041 - INSTRUMENT
      ?auto_8038 - SATELLITE
      ?auto_8039 - DIRECTION
      ?auto_8043 - DIRECTION
      ?auto_8042 - MODE
      ?auto_8036 - INSTRUMENT
      ?auto_8040 - INSTRUMENT
      ?auto_8037 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8041 ?auto_8038 ) ( SUPPORTS ?auto_8041 ?auto_8034 ) ( not ( = ?auto_8035 ?auto_8039 ) ) ( not ( = ?auto_8043 ?auto_8035 ) ) ( not ( = ?auto_8043 ?auto_8039 ) ) ( not ( = ?auto_8042 ?auto_8034 ) ) ( CALIBRATION_TARGET ?auto_8041 ?auto_8039 ) ( not ( = ?auto_8039 ?auto_8032 ) ) ( not ( = ?auto_8035 ?auto_8032 ) ) ( not ( = ?auto_8043 ?auto_8032 ) ) ( ON_BOARD ?auto_8036 ?auto_8038 ) ( not ( = ?auto_8041 ?auto_8036 ) ) ( SUPPORTS ?auto_8036 ?auto_8033 ) ( not ( = ?auto_8042 ?auto_8033 ) ) ( not ( = ?auto_8034 ?auto_8033 ) ) ( CALIBRATION_TARGET ?auto_8036 ?auto_8039 ) ( ON_BOARD ?auto_8040 ?auto_8038 ) ( not ( = ?auto_8041 ?auto_8040 ) ) ( not ( = ?auto_8036 ?auto_8040 ) ) ( SUPPORTS ?auto_8040 ?auto_8042 ) ( CALIBRATION_TARGET ?auto_8040 ?auto_8039 ) ( POWER_AVAIL ?auto_8038 ) ( POINTING ?auto_8038 ?auto_8037 ) ( not ( = ?auto_8039 ?auto_8037 ) ) ( not ( = ?auto_8035 ?auto_8037 ) ) ( not ( = ?auto_8043 ?auto_8037 ) ) ( not ( = ?auto_8032 ?auto_8037 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8043 ?auto_8042 ?auto_8035 ?auto_8034 )
      ( GET-2IMAGE-VERIFY ?auto_8032 ?auto_8033 ?auto_8035 ?auto_8034 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8044 - DIRECTION
      ?auto_8045 - MODE
      ?auto_8047 - DIRECTION
      ?auto_8046 - MODE
    )
    :vars
    (
      ?auto_8055 - INSTRUMENT
      ?auto_8051 - SATELLITE
      ?auto_8053 - DIRECTION
      ?auto_8049 - DIRECTION
      ?auto_8048 - INSTRUMENT
      ?auto_8052 - MODE
      ?auto_8054 - INSTRUMENT
      ?auto_8050 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8055 ?auto_8051 ) ( SUPPORTS ?auto_8055 ?auto_8045 ) ( not ( = ?auto_8044 ?auto_8053 ) ) ( not ( = ?auto_8047 ?auto_8044 ) ) ( not ( = ?auto_8047 ?auto_8053 ) ) ( not ( = ?auto_8046 ?auto_8045 ) ) ( CALIBRATION_TARGET ?auto_8055 ?auto_8053 ) ( not ( = ?auto_8053 ?auto_8049 ) ) ( not ( = ?auto_8044 ?auto_8049 ) ) ( not ( = ?auto_8047 ?auto_8049 ) ) ( ON_BOARD ?auto_8048 ?auto_8051 ) ( not ( = ?auto_8055 ?auto_8048 ) ) ( SUPPORTS ?auto_8048 ?auto_8052 ) ( not ( = ?auto_8046 ?auto_8052 ) ) ( not ( = ?auto_8045 ?auto_8052 ) ) ( CALIBRATION_TARGET ?auto_8048 ?auto_8053 ) ( ON_BOARD ?auto_8054 ?auto_8051 ) ( not ( = ?auto_8055 ?auto_8054 ) ) ( not ( = ?auto_8048 ?auto_8054 ) ) ( SUPPORTS ?auto_8054 ?auto_8046 ) ( CALIBRATION_TARGET ?auto_8054 ?auto_8053 ) ( POWER_AVAIL ?auto_8051 ) ( POINTING ?auto_8051 ?auto_8050 ) ( not ( = ?auto_8053 ?auto_8050 ) ) ( not ( = ?auto_8044 ?auto_8050 ) ) ( not ( = ?auto_8047 ?auto_8050 ) ) ( not ( = ?auto_8049 ?auto_8050 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8047 ?auto_8046 ?auto_8044 ?auto_8045 )
      ( GET-2IMAGE-VERIFY ?auto_8044 ?auto_8045 ?auto_8047 ?auto_8046 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8056 - DIRECTION
      ?auto_8057 - MODE
      ?auto_8059 - DIRECTION
      ?auto_8058 - MODE
    )
    :vars
    (
      ?auto_8065 - INSTRUMENT
      ?auto_8062 - SATELLITE
      ?auto_8063 - DIRECTION
      ?auto_8067 - DIRECTION
      ?auto_8066 - MODE
      ?auto_8060 - INSTRUMENT
      ?auto_8064 - INSTRUMENT
      ?auto_8061 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8065 ?auto_8062 ) ( SUPPORTS ?auto_8065 ?auto_8057 ) ( not ( = ?auto_8056 ?auto_8063 ) ) ( not ( = ?auto_8067 ?auto_8056 ) ) ( not ( = ?auto_8067 ?auto_8063 ) ) ( not ( = ?auto_8066 ?auto_8057 ) ) ( CALIBRATION_TARGET ?auto_8065 ?auto_8063 ) ( not ( = ?auto_8063 ?auto_8059 ) ) ( not ( = ?auto_8056 ?auto_8059 ) ) ( not ( = ?auto_8067 ?auto_8059 ) ) ( ON_BOARD ?auto_8060 ?auto_8062 ) ( not ( = ?auto_8065 ?auto_8060 ) ) ( SUPPORTS ?auto_8060 ?auto_8058 ) ( not ( = ?auto_8066 ?auto_8058 ) ) ( not ( = ?auto_8057 ?auto_8058 ) ) ( CALIBRATION_TARGET ?auto_8060 ?auto_8063 ) ( ON_BOARD ?auto_8064 ?auto_8062 ) ( not ( = ?auto_8065 ?auto_8064 ) ) ( not ( = ?auto_8060 ?auto_8064 ) ) ( SUPPORTS ?auto_8064 ?auto_8066 ) ( CALIBRATION_TARGET ?auto_8064 ?auto_8063 ) ( POWER_AVAIL ?auto_8062 ) ( POINTING ?auto_8062 ?auto_8061 ) ( not ( = ?auto_8063 ?auto_8061 ) ) ( not ( = ?auto_8056 ?auto_8061 ) ) ( not ( = ?auto_8067 ?auto_8061 ) ) ( not ( = ?auto_8059 ?auto_8061 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8067 ?auto_8066 ?auto_8056 ?auto_8057 )
      ( GET-2IMAGE-VERIFY ?auto_8056 ?auto_8057 ?auto_8059 ?auto_8058 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8096 - DIRECTION
      ?auto_8097 - MODE
      ?auto_8099 - DIRECTION
      ?auto_8098 - MODE
      ?auto_8101 - DIRECTION
      ?auto_8100 - MODE
    )
    :vars
    (
      ?auto_8107 - INSTRUMENT
      ?auto_8104 - SATELLITE
      ?auto_8105 - DIRECTION
      ?auto_8102 - INSTRUMENT
      ?auto_8106 - INSTRUMENT
      ?auto_8103 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8107 ?auto_8104 ) ( SUPPORTS ?auto_8107 ?auto_8100 ) ( not ( = ?auto_8101 ?auto_8105 ) ) ( not ( = ?auto_8096 ?auto_8101 ) ) ( not ( = ?auto_8096 ?auto_8105 ) ) ( not ( = ?auto_8097 ?auto_8100 ) ) ( CALIBRATION_TARGET ?auto_8107 ?auto_8105 ) ( not ( = ?auto_8105 ?auto_8099 ) ) ( not ( = ?auto_8101 ?auto_8099 ) ) ( not ( = ?auto_8096 ?auto_8099 ) ) ( ON_BOARD ?auto_8102 ?auto_8104 ) ( not ( = ?auto_8107 ?auto_8102 ) ) ( SUPPORTS ?auto_8102 ?auto_8098 ) ( not ( = ?auto_8097 ?auto_8098 ) ) ( not ( = ?auto_8100 ?auto_8098 ) ) ( CALIBRATION_TARGET ?auto_8102 ?auto_8105 ) ( ON_BOARD ?auto_8106 ?auto_8104 ) ( not ( = ?auto_8107 ?auto_8106 ) ) ( not ( = ?auto_8102 ?auto_8106 ) ) ( SUPPORTS ?auto_8106 ?auto_8097 ) ( CALIBRATION_TARGET ?auto_8106 ?auto_8105 ) ( POWER_AVAIL ?auto_8104 ) ( POINTING ?auto_8104 ?auto_8103 ) ( not ( = ?auto_8105 ?auto_8103 ) ) ( not ( = ?auto_8101 ?auto_8103 ) ) ( not ( = ?auto_8096 ?auto_8103 ) ) ( not ( = ?auto_8099 ?auto_8103 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8096 ?auto_8097 ?auto_8101 ?auto_8100 )
      ( GET-3IMAGE-VERIFY ?auto_8096 ?auto_8097 ?auto_8099 ?auto_8098 ?auto_8101 ?auto_8100 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8122 - DIRECTION
      ?auto_8123 - MODE
      ?auto_8125 - DIRECTION
      ?auto_8124 - MODE
      ?auto_8127 - DIRECTION
      ?auto_8126 - MODE
    )
    :vars
    (
      ?auto_8133 - INSTRUMENT
      ?auto_8130 - SATELLITE
      ?auto_8131 - DIRECTION
      ?auto_8128 - INSTRUMENT
      ?auto_8132 - INSTRUMENT
      ?auto_8129 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8133 ?auto_8130 ) ( SUPPORTS ?auto_8133 ?auto_8124 ) ( not ( = ?auto_8125 ?auto_8131 ) ) ( not ( = ?auto_8122 ?auto_8125 ) ) ( not ( = ?auto_8122 ?auto_8131 ) ) ( not ( = ?auto_8123 ?auto_8124 ) ) ( CALIBRATION_TARGET ?auto_8133 ?auto_8131 ) ( not ( = ?auto_8131 ?auto_8127 ) ) ( not ( = ?auto_8125 ?auto_8127 ) ) ( not ( = ?auto_8122 ?auto_8127 ) ) ( ON_BOARD ?auto_8128 ?auto_8130 ) ( not ( = ?auto_8133 ?auto_8128 ) ) ( SUPPORTS ?auto_8128 ?auto_8126 ) ( not ( = ?auto_8123 ?auto_8126 ) ) ( not ( = ?auto_8124 ?auto_8126 ) ) ( CALIBRATION_TARGET ?auto_8128 ?auto_8131 ) ( ON_BOARD ?auto_8132 ?auto_8130 ) ( not ( = ?auto_8133 ?auto_8132 ) ) ( not ( = ?auto_8128 ?auto_8132 ) ) ( SUPPORTS ?auto_8132 ?auto_8123 ) ( CALIBRATION_TARGET ?auto_8132 ?auto_8131 ) ( POWER_AVAIL ?auto_8130 ) ( POINTING ?auto_8130 ?auto_8129 ) ( not ( = ?auto_8131 ?auto_8129 ) ) ( not ( = ?auto_8125 ?auto_8129 ) ) ( not ( = ?auto_8122 ?auto_8129 ) ) ( not ( = ?auto_8127 ?auto_8129 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8122 ?auto_8123 ?auto_8125 ?auto_8124 )
      ( GET-3IMAGE-VERIFY ?auto_8122 ?auto_8123 ?auto_8125 ?auto_8124 ?auto_8127 ?auto_8126 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8148 - DIRECTION
      ?auto_8149 - MODE
      ?auto_8151 - DIRECTION
      ?auto_8150 - MODE
      ?auto_8153 - DIRECTION
      ?auto_8152 - MODE
    )
    :vars
    (
      ?auto_8159 - INSTRUMENT
      ?auto_8156 - SATELLITE
      ?auto_8157 - DIRECTION
      ?auto_8154 - INSTRUMENT
      ?auto_8158 - INSTRUMENT
      ?auto_8155 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8159 ?auto_8156 ) ( SUPPORTS ?auto_8159 ?auto_8152 ) ( not ( = ?auto_8153 ?auto_8157 ) ) ( not ( = ?auto_8151 ?auto_8153 ) ) ( not ( = ?auto_8151 ?auto_8157 ) ) ( not ( = ?auto_8150 ?auto_8152 ) ) ( CALIBRATION_TARGET ?auto_8159 ?auto_8157 ) ( not ( = ?auto_8157 ?auto_8148 ) ) ( not ( = ?auto_8153 ?auto_8148 ) ) ( not ( = ?auto_8151 ?auto_8148 ) ) ( ON_BOARD ?auto_8154 ?auto_8156 ) ( not ( = ?auto_8159 ?auto_8154 ) ) ( SUPPORTS ?auto_8154 ?auto_8149 ) ( not ( = ?auto_8150 ?auto_8149 ) ) ( not ( = ?auto_8152 ?auto_8149 ) ) ( CALIBRATION_TARGET ?auto_8154 ?auto_8157 ) ( ON_BOARD ?auto_8158 ?auto_8156 ) ( not ( = ?auto_8159 ?auto_8158 ) ) ( not ( = ?auto_8154 ?auto_8158 ) ) ( SUPPORTS ?auto_8158 ?auto_8150 ) ( CALIBRATION_TARGET ?auto_8158 ?auto_8157 ) ( POWER_AVAIL ?auto_8156 ) ( POINTING ?auto_8156 ?auto_8155 ) ( not ( = ?auto_8157 ?auto_8155 ) ) ( not ( = ?auto_8153 ?auto_8155 ) ) ( not ( = ?auto_8151 ?auto_8155 ) ) ( not ( = ?auto_8148 ?auto_8155 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8151 ?auto_8150 ?auto_8153 ?auto_8152 )
      ( GET-3IMAGE-VERIFY ?auto_8148 ?auto_8149 ?auto_8151 ?auto_8150 ?auto_8153 ?auto_8152 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8174 - DIRECTION
      ?auto_8175 - MODE
      ?auto_8177 - DIRECTION
      ?auto_8176 - MODE
      ?auto_8179 - DIRECTION
      ?auto_8178 - MODE
    )
    :vars
    (
      ?auto_8185 - INSTRUMENT
      ?auto_8182 - SATELLITE
      ?auto_8183 - DIRECTION
      ?auto_8180 - INSTRUMENT
      ?auto_8184 - INSTRUMENT
      ?auto_8181 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8185 ?auto_8182 ) ( SUPPORTS ?auto_8185 ?auto_8176 ) ( not ( = ?auto_8177 ?auto_8183 ) ) ( not ( = ?auto_8179 ?auto_8177 ) ) ( not ( = ?auto_8179 ?auto_8183 ) ) ( not ( = ?auto_8178 ?auto_8176 ) ) ( CALIBRATION_TARGET ?auto_8185 ?auto_8183 ) ( not ( = ?auto_8183 ?auto_8174 ) ) ( not ( = ?auto_8177 ?auto_8174 ) ) ( not ( = ?auto_8179 ?auto_8174 ) ) ( ON_BOARD ?auto_8180 ?auto_8182 ) ( not ( = ?auto_8185 ?auto_8180 ) ) ( SUPPORTS ?auto_8180 ?auto_8175 ) ( not ( = ?auto_8178 ?auto_8175 ) ) ( not ( = ?auto_8176 ?auto_8175 ) ) ( CALIBRATION_TARGET ?auto_8180 ?auto_8183 ) ( ON_BOARD ?auto_8184 ?auto_8182 ) ( not ( = ?auto_8185 ?auto_8184 ) ) ( not ( = ?auto_8180 ?auto_8184 ) ) ( SUPPORTS ?auto_8184 ?auto_8178 ) ( CALIBRATION_TARGET ?auto_8184 ?auto_8183 ) ( POWER_AVAIL ?auto_8182 ) ( POINTING ?auto_8182 ?auto_8181 ) ( not ( = ?auto_8183 ?auto_8181 ) ) ( not ( = ?auto_8177 ?auto_8181 ) ) ( not ( = ?auto_8179 ?auto_8181 ) ) ( not ( = ?auto_8174 ?auto_8181 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8179 ?auto_8178 ?auto_8177 ?auto_8176 )
      ( GET-3IMAGE-VERIFY ?auto_8174 ?auto_8175 ?auto_8177 ?auto_8176 ?auto_8179 ?auto_8178 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8228 - DIRECTION
      ?auto_8229 - MODE
      ?auto_8231 - DIRECTION
      ?auto_8230 - MODE
      ?auto_8233 - DIRECTION
      ?auto_8232 - MODE
    )
    :vars
    (
      ?auto_8239 - INSTRUMENT
      ?auto_8236 - SATELLITE
      ?auto_8237 - DIRECTION
      ?auto_8234 - INSTRUMENT
      ?auto_8238 - INSTRUMENT
      ?auto_8235 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8239 ?auto_8236 ) ( SUPPORTS ?auto_8239 ?auto_8229 ) ( not ( = ?auto_8228 ?auto_8237 ) ) ( not ( = ?auto_8231 ?auto_8228 ) ) ( not ( = ?auto_8231 ?auto_8237 ) ) ( not ( = ?auto_8230 ?auto_8229 ) ) ( CALIBRATION_TARGET ?auto_8239 ?auto_8237 ) ( not ( = ?auto_8237 ?auto_8233 ) ) ( not ( = ?auto_8228 ?auto_8233 ) ) ( not ( = ?auto_8231 ?auto_8233 ) ) ( ON_BOARD ?auto_8234 ?auto_8236 ) ( not ( = ?auto_8239 ?auto_8234 ) ) ( SUPPORTS ?auto_8234 ?auto_8232 ) ( not ( = ?auto_8230 ?auto_8232 ) ) ( not ( = ?auto_8229 ?auto_8232 ) ) ( CALIBRATION_TARGET ?auto_8234 ?auto_8237 ) ( ON_BOARD ?auto_8238 ?auto_8236 ) ( not ( = ?auto_8239 ?auto_8238 ) ) ( not ( = ?auto_8234 ?auto_8238 ) ) ( SUPPORTS ?auto_8238 ?auto_8230 ) ( CALIBRATION_TARGET ?auto_8238 ?auto_8237 ) ( POWER_AVAIL ?auto_8236 ) ( POINTING ?auto_8236 ?auto_8235 ) ( not ( = ?auto_8237 ?auto_8235 ) ) ( not ( = ?auto_8228 ?auto_8235 ) ) ( not ( = ?auto_8231 ?auto_8235 ) ) ( not ( = ?auto_8233 ?auto_8235 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8231 ?auto_8230 ?auto_8228 ?auto_8229 )
      ( GET-3IMAGE-VERIFY ?auto_8228 ?auto_8229 ?auto_8231 ?auto_8230 ?auto_8233 ?auto_8232 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8254 - DIRECTION
      ?auto_8255 - MODE
      ?auto_8257 - DIRECTION
      ?auto_8256 - MODE
      ?auto_8259 - DIRECTION
      ?auto_8258 - MODE
    )
    :vars
    (
      ?auto_8265 - INSTRUMENT
      ?auto_8262 - SATELLITE
      ?auto_8263 - DIRECTION
      ?auto_8260 - INSTRUMENT
      ?auto_8264 - INSTRUMENT
      ?auto_8261 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8265 ?auto_8262 ) ( SUPPORTS ?auto_8265 ?auto_8255 ) ( not ( = ?auto_8254 ?auto_8263 ) ) ( not ( = ?auto_8259 ?auto_8254 ) ) ( not ( = ?auto_8259 ?auto_8263 ) ) ( not ( = ?auto_8258 ?auto_8255 ) ) ( CALIBRATION_TARGET ?auto_8265 ?auto_8263 ) ( not ( = ?auto_8263 ?auto_8257 ) ) ( not ( = ?auto_8254 ?auto_8257 ) ) ( not ( = ?auto_8259 ?auto_8257 ) ) ( ON_BOARD ?auto_8260 ?auto_8262 ) ( not ( = ?auto_8265 ?auto_8260 ) ) ( SUPPORTS ?auto_8260 ?auto_8256 ) ( not ( = ?auto_8258 ?auto_8256 ) ) ( not ( = ?auto_8255 ?auto_8256 ) ) ( CALIBRATION_TARGET ?auto_8260 ?auto_8263 ) ( ON_BOARD ?auto_8264 ?auto_8262 ) ( not ( = ?auto_8265 ?auto_8264 ) ) ( not ( = ?auto_8260 ?auto_8264 ) ) ( SUPPORTS ?auto_8264 ?auto_8258 ) ( CALIBRATION_TARGET ?auto_8264 ?auto_8263 ) ( POWER_AVAIL ?auto_8262 ) ( POINTING ?auto_8262 ?auto_8261 ) ( not ( = ?auto_8263 ?auto_8261 ) ) ( not ( = ?auto_8254 ?auto_8261 ) ) ( not ( = ?auto_8259 ?auto_8261 ) ) ( not ( = ?auto_8257 ?auto_8261 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8259 ?auto_8258 ?auto_8254 ?auto_8255 )
      ( GET-3IMAGE-VERIFY ?auto_8254 ?auto_8255 ?auto_8257 ?auto_8256 ?auto_8259 ?auto_8258 ) )
  )

)

