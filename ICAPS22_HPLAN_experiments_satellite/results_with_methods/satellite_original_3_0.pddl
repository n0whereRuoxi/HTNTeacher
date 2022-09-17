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
      ?auto_2329 - INSTRUMENT
      ?auto_2328 - SATELLITE
      ?auto_2330 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2329 ?auto_2328 ) ( SUPPORTS ?auto_2329 ?auto_2327 ) ( POWER_ON ?auto_2329 ) ( POINTING ?auto_2328 ?auto_2330 ) ( not ( = ?auto_2326 ?auto_2330 ) ) ( CALIBRATION_TARGET ?auto_2329 ?auto_2330 ) ( NOT_CALIBRATED ?auto_2329 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_2328 ?auto_2329 ?auto_2330 )
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
      ?auto_2349 - SATELLITE
      ?auto_2351 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2350 ?auto_2349 ) ( SUPPORTS ?auto_2350 ?auto_2348 ) ( POINTING ?auto_2349 ?auto_2351 ) ( not ( = ?auto_2347 ?auto_2351 ) ) ( CALIBRATION_TARGET ?auto_2350 ?auto_2351 ) ( POWER_AVAIL ?auto_2349 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_2350 ?auto_2349 )
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
      ?auto_2372 - INSTRUMENT
      ?auto_2370 - SATELLITE
      ?auto_2371 - DIRECTION
      ?auto_2373 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2372 ?auto_2370 ) ( SUPPORTS ?auto_2372 ?auto_2369 ) ( not ( = ?auto_2368 ?auto_2371 ) ) ( CALIBRATION_TARGET ?auto_2372 ?auto_2371 ) ( POWER_AVAIL ?auto_2370 ) ( POINTING ?auto_2370 ?auto_2373 ) ( not ( = ?auto_2371 ?auto_2373 ) ) ( not ( = ?auto_2368 ?auto_2373 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_2370 ?auto_2371 ?auto_2373 )
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
      ?auto_2456 - INSTRUMENT
      ?auto_2457 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_2455 ?auto_2452 ) ) ( CALIBRATED ?auto_2456 ) ( ON_BOARD ?auto_2456 ?auto_2457 ) ( SUPPORTS ?auto_2456 ?auto_2454 ) ( POWER_ON ?auto_2456 ) ( POINTING ?auto_2457 ?auto_2455 ) ( HAVE_IMAGE ?auto_2452 ?auto_2453 ) ( not ( = ?auto_2453 ?auto_2454 ) ) )
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
      ?auto_2462 - INSTRUMENT
      ?auto_2463 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_2461 ?auto_2458 ) ) ( CALIBRATED ?auto_2462 ) ( ON_BOARD ?auto_2462 ?auto_2463 ) ( SUPPORTS ?auto_2462 ?auto_2459 ) ( POWER_ON ?auto_2462 ) ( POINTING ?auto_2463 ?auto_2458 ) ( HAVE_IMAGE ?auto_2461 ?auto_2460 ) ( not ( = ?auto_2459 ?auto_2460 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2458 ?auto_2459 )
      ( GET-2IMAGE-VERIFY ?auto_2458 ?auto_2459 ?auto_2461 ?auto_2460 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2526 - DIRECTION
      ?auto_2527 - MODE
    )
    :vars
    (
      ?auto_2528 - INSTRUMENT
      ?auto_2529 - SATELLITE
      ?auto_2530 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_2528 ) ( ON_BOARD ?auto_2528 ?auto_2529 ) ( SUPPORTS ?auto_2528 ?auto_2527 ) ( POWER_ON ?auto_2528 ) ( POINTING ?auto_2529 ?auto_2530 ) ( not ( = ?auto_2526 ?auto_2530 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_2529 ?auto_2526 ?auto_2530 )
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
      ?auto_2536 - INSTRUMENT
      ?auto_2535 - SATELLITE
      ?auto_2537 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2534 ?auto_2531 ) ) ( CALIBRATED ?auto_2536 ) ( ON_BOARD ?auto_2536 ?auto_2535 ) ( SUPPORTS ?auto_2536 ?auto_2533 ) ( POWER_ON ?auto_2536 ) ( POINTING ?auto_2535 ?auto_2537 ) ( not ( = ?auto_2534 ?auto_2537 ) ) ( HAVE_IMAGE ?auto_2531 ?auto_2532 ) ( not ( = ?auto_2531 ?auto_2537 ) ) ( not ( = ?auto_2532 ?auto_2533 ) ) )
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
      ?auto_2543 - INSTRUMENT
      ?auto_2544 - SATELLITE
      ?auto_2542 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2541 ?auto_2538 ) ) ( CALIBRATED ?auto_2543 ) ( ON_BOARD ?auto_2543 ?auto_2544 ) ( SUPPORTS ?auto_2543 ?auto_2539 ) ( POWER_ON ?auto_2543 ) ( POINTING ?auto_2544 ?auto_2542 ) ( not ( = ?auto_2538 ?auto_2542 ) ) ( HAVE_IMAGE ?auto_2541 ?auto_2540 ) ( not ( = ?auto_2541 ?auto_2542 ) ) ( not ( = ?auto_2540 ?auto_2539 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2541 ?auto_2540 ?auto_2538 ?auto_2539 )
      ( GET-2IMAGE-VERIFY ?auto_2538 ?auto_2539 ?auto_2541 ?auto_2540 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2619 - DIRECTION
      ?auto_2620 - MODE
    )
    :vars
    (
      ?auto_2623 - DIRECTION
      ?auto_2624 - INSTRUMENT
      ?auto_2625 - SATELLITE
      ?auto_2621 - DIRECTION
      ?auto_2622 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_2619 ?auto_2623 ) ) ( ON_BOARD ?auto_2624 ?auto_2625 ) ( SUPPORTS ?auto_2624 ?auto_2620 ) ( POWER_ON ?auto_2624 ) ( POINTING ?auto_2625 ?auto_2621 ) ( not ( = ?auto_2619 ?auto_2621 ) ) ( HAVE_IMAGE ?auto_2623 ?auto_2622 ) ( not ( = ?auto_2623 ?auto_2621 ) ) ( not ( = ?auto_2622 ?auto_2620 ) ) ( CALIBRATION_TARGET ?auto_2624 ?auto_2621 ) ( NOT_CALIBRATED ?auto_2624 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_2625 ?auto_2624 ?auto_2621 )
      ( GET-2IMAGE ?auto_2623 ?auto_2622 ?auto_2619 ?auto_2620 )
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
      ?auto_2630 - INSTRUMENT
      ?auto_2631 - SATELLITE
      ?auto_2632 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2629 ?auto_2626 ) ) ( ON_BOARD ?auto_2630 ?auto_2631 ) ( SUPPORTS ?auto_2630 ?auto_2628 ) ( POWER_ON ?auto_2630 ) ( POINTING ?auto_2631 ?auto_2632 ) ( not ( = ?auto_2629 ?auto_2632 ) ) ( HAVE_IMAGE ?auto_2626 ?auto_2627 ) ( not ( = ?auto_2626 ?auto_2632 ) ) ( not ( = ?auto_2627 ?auto_2628 ) ) ( CALIBRATION_TARGET ?auto_2630 ?auto_2632 ) ( NOT_CALIBRATED ?auto_2630 ) )
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
      ?auto_2637 - INSTRUMENT
      ?auto_2639 - SATELLITE
      ?auto_2638 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2636 ?auto_2633 ) ) ( ON_BOARD ?auto_2637 ?auto_2639 ) ( SUPPORTS ?auto_2637 ?auto_2634 ) ( POWER_ON ?auto_2637 ) ( POINTING ?auto_2639 ?auto_2638 ) ( not ( = ?auto_2633 ?auto_2638 ) ) ( HAVE_IMAGE ?auto_2636 ?auto_2635 ) ( not ( = ?auto_2636 ?auto_2638 ) ) ( not ( = ?auto_2635 ?auto_2634 ) ) ( CALIBRATION_TARGET ?auto_2637 ?auto_2638 ) ( NOT_CALIBRATED ?auto_2637 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2636 ?auto_2635 ?auto_2633 ?auto_2634 )
      ( GET-2IMAGE-VERIFY ?auto_2633 ?auto_2634 ?auto_2636 ?auto_2635 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2714 - DIRECTION
      ?auto_2715 - MODE
    )
    :vars
    (
      ?auto_2718 - DIRECTION
      ?auto_2716 - INSTRUMENT
      ?auto_2720 - SATELLITE
      ?auto_2717 - DIRECTION
      ?auto_2719 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_2714 ?auto_2718 ) ) ( ON_BOARD ?auto_2716 ?auto_2720 ) ( SUPPORTS ?auto_2716 ?auto_2715 ) ( POINTING ?auto_2720 ?auto_2717 ) ( not ( = ?auto_2714 ?auto_2717 ) ) ( HAVE_IMAGE ?auto_2718 ?auto_2719 ) ( not ( = ?auto_2718 ?auto_2717 ) ) ( not ( = ?auto_2719 ?auto_2715 ) ) ( CALIBRATION_TARGET ?auto_2716 ?auto_2717 ) ( POWER_AVAIL ?auto_2720 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_2716 ?auto_2720 )
      ( GET-2IMAGE ?auto_2718 ?auto_2719 ?auto_2714 ?auto_2715 )
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
      ?auto_2727 - SATELLITE
      ?auto_2725 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2724 ?auto_2721 ) ) ( ON_BOARD ?auto_2726 ?auto_2727 ) ( SUPPORTS ?auto_2726 ?auto_2723 ) ( POINTING ?auto_2727 ?auto_2725 ) ( not ( = ?auto_2724 ?auto_2725 ) ) ( HAVE_IMAGE ?auto_2721 ?auto_2722 ) ( not ( = ?auto_2721 ?auto_2725 ) ) ( not ( = ?auto_2722 ?auto_2723 ) ) ( CALIBRATION_TARGET ?auto_2726 ?auto_2725 ) ( POWER_AVAIL ?auto_2727 ) )
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
    ( and ( not ( = ?auto_2731 ?auto_2728 ) ) ( ON_BOARD ?auto_2732 ?auto_2733 ) ( SUPPORTS ?auto_2732 ?auto_2729 ) ( POINTING ?auto_2733 ?auto_2734 ) ( not ( = ?auto_2728 ?auto_2734 ) ) ( HAVE_IMAGE ?auto_2731 ?auto_2730 ) ( not ( = ?auto_2731 ?auto_2734 ) ) ( not ( = ?auto_2730 ?auto_2729 ) ) ( CALIBRATION_TARGET ?auto_2732 ?auto_2734 ) ( POWER_AVAIL ?auto_2733 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2731 ?auto_2730 ?auto_2728 ?auto_2729 )
      ( GET-2IMAGE-VERIFY ?auto_2728 ?auto_2729 ?auto_2731 ?auto_2730 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2809 - DIRECTION
      ?auto_2810 - MODE
    )
    :vars
    (
      ?auto_2813 - DIRECTION
      ?auto_2811 - INSTRUMENT
      ?auto_2814 - SATELLITE
      ?auto_2815 - DIRECTION
      ?auto_2812 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_2809 ?auto_2813 ) ) ( ON_BOARD ?auto_2811 ?auto_2814 ) ( SUPPORTS ?auto_2811 ?auto_2810 ) ( not ( = ?auto_2809 ?auto_2815 ) ) ( HAVE_IMAGE ?auto_2813 ?auto_2812 ) ( not ( = ?auto_2813 ?auto_2815 ) ) ( not ( = ?auto_2812 ?auto_2810 ) ) ( CALIBRATION_TARGET ?auto_2811 ?auto_2815 ) ( POWER_AVAIL ?auto_2814 ) ( POINTING ?auto_2814 ?auto_2813 ) )
    :subtasks
    ( ( !TURN_TO ?auto_2814 ?auto_2815 ?auto_2813 )
      ( GET-2IMAGE ?auto_2813 ?auto_2812 ?auto_2809 ?auto_2810 )
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
      ?auto_2822 - INSTRUMENT
      ?auto_2820 - SATELLITE
      ?auto_2821 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2819 ?auto_2816 ) ) ( ON_BOARD ?auto_2822 ?auto_2820 ) ( SUPPORTS ?auto_2822 ?auto_2818 ) ( not ( = ?auto_2819 ?auto_2821 ) ) ( HAVE_IMAGE ?auto_2816 ?auto_2817 ) ( not ( = ?auto_2816 ?auto_2821 ) ) ( not ( = ?auto_2817 ?auto_2818 ) ) ( CALIBRATION_TARGET ?auto_2822 ?auto_2821 ) ( POWER_AVAIL ?auto_2820 ) ( POINTING ?auto_2820 ?auto_2816 ) )
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
      ?auto_2829 - INSTRUMENT
      ?auto_2827 - SATELLITE
      ?auto_2828 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2826 ?auto_2823 ) ) ( ON_BOARD ?auto_2829 ?auto_2827 ) ( SUPPORTS ?auto_2829 ?auto_2824 ) ( not ( = ?auto_2823 ?auto_2828 ) ) ( HAVE_IMAGE ?auto_2826 ?auto_2825 ) ( not ( = ?auto_2826 ?auto_2828 ) ) ( not ( = ?auto_2825 ?auto_2824 ) ) ( CALIBRATION_TARGET ?auto_2829 ?auto_2828 ) ( POWER_AVAIL ?auto_2827 ) ( POINTING ?auto_2827 ?auto_2826 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2826 ?auto_2825 ?auto_2823 ?auto_2824 )
      ( GET-2IMAGE-VERIFY ?auto_2823 ?auto_2824 ?auto_2826 ?auto_2825 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2904 - DIRECTION
      ?auto_2905 - MODE
    )
    :vars
    (
      ?auto_2910 - DIRECTION
      ?auto_2908 - INSTRUMENT
      ?auto_2906 - SATELLITE
      ?auto_2907 - DIRECTION
      ?auto_2909 - MODE
      ?auto_2911 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2904 ?auto_2910 ) ) ( ON_BOARD ?auto_2908 ?auto_2906 ) ( SUPPORTS ?auto_2908 ?auto_2905 ) ( not ( = ?auto_2904 ?auto_2907 ) ) ( HAVE_IMAGE ?auto_2910 ?auto_2909 ) ( not ( = ?auto_2910 ?auto_2907 ) ) ( not ( = ?auto_2909 ?auto_2905 ) ) ( CALIBRATION_TARGET ?auto_2908 ?auto_2907 ) ( POINTING ?auto_2906 ?auto_2910 ) ( ON_BOARD ?auto_2911 ?auto_2906 ) ( POWER_ON ?auto_2911 ) ( not ( = ?auto_2908 ?auto_2911 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_2911 ?auto_2906 )
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
      ?auto_2917 - INSTRUMENT
      ?auto_2918 - SATELLITE
      ?auto_2916 - DIRECTION
      ?auto_2919 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2915 ?auto_2912 ) ) ( ON_BOARD ?auto_2917 ?auto_2918 ) ( SUPPORTS ?auto_2917 ?auto_2914 ) ( not ( = ?auto_2915 ?auto_2916 ) ) ( HAVE_IMAGE ?auto_2912 ?auto_2913 ) ( not ( = ?auto_2912 ?auto_2916 ) ) ( not ( = ?auto_2913 ?auto_2914 ) ) ( CALIBRATION_TARGET ?auto_2917 ?auto_2916 ) ( POINTING ?auto_2918 ?auto_2912 ) ( ON_BOARD ?auto_2919 ?auto_2918 ) ( POWER_ON ?auto_2919 ) ( not ( = ?auto_2917 ?auto_2919 ) ) )
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
      ?auto_2924 - INSTRUMENT
      ?auto_2927 - SATELLITE
      ?auto_2925 - DIRECTION
      ?auto_2926 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2923 ?auto_2920 ) ) ( ON_BOARD ?auto_2924 ?auto_2927 ) ( SUPPORTS ?auto_2924 ?auto_2921 ) ( not ( = ?auto_2920 ?auto_2925 ) ) ( HAVE_IMAGE ?auto_2923 ?auto_2922 ) ( not ( = ?auto_2923 ?auto_2925 ) ) ( not ( = ?auto_2922 ?auto_2921 ) ) ( CALIBRATION_TARGET ?auto_2924 ?auto_2925 ) ( POINTING ?auto_2927 ?auto_2923 ) ( ON_BOARD ?auto_2926 ?auto_2927 ) ( POWER_ON ?auto_2926 ) ( not ( = ?auto_2924 ?auto_2926 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2923 ?auto_2922 ?auto_2920 ?auto_2921 )
      ( GET-2IMAGE-VERIFY ?auto_2920 ?auto_2921 ?auto_2923 ?auto_2922 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3010 - DIRECTION
      ?auto_3011 - MODE
    )
    :vars
    (
      ?auto_3013 - DIRECTION
      ?auto_3012 - INSTRUMENT
      ?auto_3017 - SATELLITE
      ?auto_3015 - DIRECTION
      ?auto_3014 - MODE
      ?auto_3016 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3010 ?auto_3013 ) ) ( ON_BOARD ?auto_3012 ?auto_3017 ) ( SUPPORTS ?auto_3012 ?auto_3011 ) ( not ( = ?auto_3010 ?auto_3015 ) ) ( not ( = ?auto_3013 ?auto_3015 ) ) ( not ( = ?auto_3014 ?auto_3011 ) ) ( CALIBRATION_TARGET ?auto_3012 ?auto_3015 ) ( POINTING ?auto_3017 ?auto_3013 ) ( ON_BOARD ?auto_3016 ?auto_3017 ) ( POWER_ON ?auto_3016 ) ( not ( = ?auto_3012 ?auto_3016 ) ) ( CALIBRATED ?auto_3016 ) ( SUPPORTS ?auto_3016 ?auto_3014 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3013 ?auto_3014 )
      ( GET-2IMAGE ?auto_3013 ?auto_3014 ?auto_3010 ?auto_3011 )
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
      ?auto_3023 - INSTRUMENT
      ?auto_3022 - SATELLITE
      ?auto_3024 - DIRECTION
      ?auto_3025 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3021 ?auto_3018 ) ) ( ON_BOARD ?auto_3023 ?auto_3022 ) ( SUPPORTS ?auto_3023 ?auto_3020 ) ( not ( = ?auto_3021 ?auto_3024 ) ) ( not ( = ?auto_3018 ?auto_3024 ) ) ( not ( = ?auto_3019 ?auto_3020 ) ) ( CALIBRATION_TARGET ?auto_3023 ?auto_3024 ) ( POINTING ?auto_3022 ?auto_3018 ) ( ON_BOARD ?auto_3025 ?auto_3022 ) ( POWER_ON ?auto_3025 ) ( not ( = ?auto_3023 ?auto_3025 ) ) ( CALIBRATED ?auto_3025 ) ( SUPPORTS ?auto_3025 ?auto_3019 ) )
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
      ?auto_3032 - INSTRUMENT
      ?auto_3033 - SATELLITE
      ?auto_3031 - DIRECTION
      ?auto_3030 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3029 ?auto_3026 ) ) ( ON_BOARD ?auto_3032 ?auto_3033 ) ( SUPPORTS ?auto_3032 ?auto_3027 ) ( not ( = ?auto_3026 ?auto_3031 ) ) ( not ( = ?auto_3029 ?auto_3031 ) ) ( not ( = ?auto_3028 ?auto_3027 ) ) ( CALIBRATION_TARGET ?auto_3032 ?auto_3031 ) ( POINTING ?auto_3033 ?auto_3029 ) ( ON_BOARD ?auto_3030 ?auto_3033 ) ( POWER_ON ?auto_3030 ) ( not ( = ?auto_3032 ?auto_3030 ) ) ( CALIBRATED ?auto_3030 ) ( SUPPORTS ?auto_3030 ?auto_3028 ) )
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
      ?auto_3123 - DIRECTION
      ?auto_3120 - INSTRUMENT
      ?auto_3121 - SATELLITE
      ?auto_3119 - DIRECTION
      ?auto_3122 - MODE
      ?auto_3118 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3116 ?auto_3123 ) ) ( ON_BOARD ?auto_3120 ?auto_3121 ) ( SUPPORTS ?auto_3120 ?auto_3117 ) ( not ( = ?auto_3116 ?auto_3119 ) ) ( not ( = ?auto_3123 ?auto_3119 ) ) ( not ( = ?auto_3122 ?auto_3117 ) ) ( CALIBRATION_TARGET ?auto_3120 ?auto_3119 ) ( ON_BOARD ?auto_3118 ?auto_3121 ) ( POWER_ON ?auto_3118 ) ( not ( = ?auto_3120 ?auto_3118 ) ) ( CALIBRATED ?auto_3118 ) ( SUPPORTS ?auto_3118 ?auto_3122 ) ( POINTING ?auto_3121 ?auto_3119 ) )
    :subtasks
    ( ( !TURN_TO ?auto_3121 ?auto_3123 ?auto_3119 )
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
      ?auto_3130 - INSTRUMENT
      ?auto_3129 - SATELLITE
      ?auto_3128 - DIRECTION
      ?auto_3131 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3127 ?auto_3124 ) ) ( ON_BOARD ?auto_3130 ?auto_3129 ) ( SUPPORTS ?auto_3130 ?auto_3126 ) ( not ( = ?auto_3127 ?auto_3128 ) ) ( not ( = ?auto_3124 ?auto_3128 ) ) ( not ( = ?auto_3125 ?auto_3126 ) ) ( CALIBRATION_TARGET ?auto_3130 ?auto_3128 ) ( ON_BOARD ?auto_3131 ?auto_3129 ) ( POWER_ON ?auto_3131 ) ( not ( = ?auto_3130 ?auto_3131 ) ) ( CALIBRATED ?auto_3131 ) ( SUPPORTS ?auto_3131 ?auto_3125 ) ( POINTING ?auto_3129 ?auto_3128 ) )
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
      ?auto_3139 - INSTRUMENT
      ?auto_3138 - SATELLITE
      ?auto_3137 - DIRECTION
      ?auto_3136 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3135 ?auto_3132 ) ) ( ON_BOARD ?auto_3139 ?auto_3138 ) ( SUPPORTS ?auto_3139 ?auto_3133 ) ( not ( = ?auto_3132 ?auto_3137 ) ) ( not ( = ?auto_3135 ?auto_3137 ) ) ( not ( = ?auto_3134 ?auto_3133 ) ) ( CALIBRATION_TARGET ?auto_3139 ?auto_3137 ) ( ON_BOARD ?auto_3136 ?auto_3138 ) ( POWER_ON ?auto_3136 ) ( not ( = ?auto_3139 ?auto_3136 ) ) ( CALIBRATED ?auto_3136 ) ( SUPPORTS ?auto_3136 ?auto_3134 ) ( POINTING ?auto_3138 ?auto_3137 ) )
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
      ?auto_3229 - DIRECTION
      ?auto_3227 - INSTRUMENT
      ?auto_3226 - SATELLITE
      ?auto_3225 - DIRECTION
      ?auto_3228 - MODE
      ?auto_3224 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3222 ?auto_3229 ) ) ( ON_BOARD ?auto_3227 ?auto_3226 ) ( SUPPORTS ?auto_3227 ?auto_3223 ) ( not ( = ?auto_3222 ?auto_3225 ) ) ( not ( = ?auto_3229 ?auto_3225 ) ) ( not ( = ?auto_3228 ?auto_3223 ) ) ( CALIBRATION_TARGET ?auto_3227 ?auto_3225 ) ( ON_BOARD ?auto_3224 ?auto_3226 ) ( POWER_ON ?auto_3224 ) ( not ( = ?auto_3227 ?auto_3224 ) ) ( SUPPORTS ?auto_3224 ?auto_3228 ) ( POINTING ?auto_3226 ?auto_3225 ) ( CALIBRATION_TARGET ?auto_3224 ?auto_3225 ) ( NOT_CALIBRATED ?auto_3224 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_3226 ?auto_3224 ?auto_3225 )
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
      ?auto_3236 - INSTRUMENT
      ?auto_3235 - SATELLITE
      ?auto_3234 - DIRECTION
      ?auto_3237 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3233 ?auto_3230 ) ) ( ON_BOARD ?auto_3236 ?auto_3235 ) ( SUPPORTS ?auto_3236 ?auto_3232 ) ( not ( = ?auto_3233 ?auto_3234 ) ) ( not ( = ?auto_3230 ?auto_3234 ) ) ( not ( = ?auto_3231 ?auto_3232 ) ) ( CALIBRATION_TARGET ?auto_3236 ?auto_3234 ) ( ON_BOARD ?auto_3237 ?auto_3235 ) ( POWER_ON ?auto_3237 ) ( not ( = ?auto_3236 ?auto_3237 ) ) ( SUPPORTS ?auto_3237 ?auto_3231 ) ( POINTING ?auto_3235 ?auto_3234 ) ( CALIBRATION_TARGET ?auto_3237 ?auto_3234 ) ( NOT_CALIBRATED ?auto_3237 ) )
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
      ?auto_3242 - SATELLITE
      ?auto_3243 - DIRECTION
      ?auto_3244 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3241 ?auto_3238 ) ) ( ON_BOARD ?auto_3245 ?auto_3242 ) ( SUPPORTS ?auto_3245 ?auto_3239 ) ( not ( = ?auto_3238 ?auto_3243 ) ) ( not ( = ?auto_3241 ?auto_3243 ) ) ( not ( = ?auto_3240 ?auto_3239 ) ) ( CALIBRATION_TARGET ?auto_3245 ?auto_3243 ) ( ON_BOARD ?auto_3244 ?auto_3242 ) ( POWER_ON ?auto_3244 ) ( not ( = ?auto_3245 ?auto_3244 ) ) ( SUPPORTS ?auto_3244 ?auto_3240 ) ( POINTING ?auto_3242 ?auto_3243 ) ( CALIBRATION_TARGET ?auto_3244 ?auto_3243 ) ( NOT_CALIBRATED ?auto_3244 ) )
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
      ?auto_3335 - DIRECTION
      ?auto_3333 - INSTRUMENT
      ?auto_3330 - SATELLITE
      ?auto_3331 - DIRECTION
      ?auto_3334 - MODE
      ?auto_3332 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3328 ?auto_3335 ) ) ( ON_BOARD ?auto_3333 ?auto_3330 ) ( SUPPORTS ?auto_3333 ?auto_3329 ) ( not ( = ?auto_3328 ?auto_3331 ) ) ( not ( = ?auto_3335 ?auto_3331 ) ) ( not ( = ?auto_3334 ?auto_3329 ) ) ( CALIBRATION_TARGET ?auto_3333 ?auto_3331 ) ( ON_BOARD ?auto_3332 ?auto_3330 ) ( not ( = ?auto_3333 ?auto_3332 ) ) ( SUPPORTS ?auto_3332 ?auto_3334 ) ( POINTING ?auto_3330 ?auto_3331 ) ( CALIBRATION_TARGET ?auto_3332 ?auto_3331 ) ( POWER_AVAIL ?auto_3330 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_3332 ?auto_3330 )
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
      ?auto_3342 - SATELLITE
      ?auto_3340 - DIRECTION
      ?auto_3341 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3339 ?auto_3336 ) ) ( ON_BOARD ?auto_3343 ?auto_3342 ) ( SUPPORTS ?auto_3343 ?auto_3338 ) ( not ( = ?auto_3339 ?auto_3340 ) ) ( not ( = ?auto_3336 ?auto_3340 ) ) ( not ( = ?auto_3337 ?auto_3338 ) ) ( CALIBRATION_TARGET ?auto_3343 ?auto_3340 ) ( ON_BOARD ?auto_3341 ?auto_3342 ) ( not ( = ?auto_3343 ?auto_3341 ) ) ( SUPPORTS ?auto_3341 ?auto_3337 ) ( POINTING ?auto_3342 ?auto_3340 ) ( CALIBRATION_TARGET ?auto_3341 ?auto_3340 ) ( POWER_AVAIL ?auto_3342 ) )
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
      ?auto_3351 - SATELLITE
      ?auto_3350 - DIRECTION
      ?auto_3349 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3347 ?auto_3344 ) ) ( ON_BOARD ?auto_3348 ?auto_3351 ) ( SUPPORTS ?auto_3348 ?auto_3345 ) ( not ( = ?auto_3344 ?auto_3350 ) ) ( not ( = ?auto_3347 ?auto_3350 ) ) ( not ( = ?auto_3346 ?auto_3345 ) ) ( CALIBRATION_TARGET ?auto_3348 ?auto_3350 ) ( ON_BOARD ?auto_3349 ?auto_3351 ) ( not ( = ?auto_3348 ?auto_3349 ) ) ( SUPPORTS ?auto_3349 ?auto_3346 ) ( POINTING ?auto_3351 ?auto_3350 ) ( CALIBRATION_TARGET ?auto_3349 ?auto_3350 ) ( POWER_AVAIL ?auto_3351 ) )
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
      ?auto_3441 - DIRECTION
      ?auto_3436 - INSTRUMENT
      ?auto_3439 - SATELLITE
      ?auto_3438 - DIRECTION
      ?auto_3440 - MODE
      ?auto_3437 - INSTRUMENT
      ?auto_3442 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3434 ?auto_3441 ) ) ( ON_BOARD ?auto_3436 ?auto_3439 ) ( SUPPORTS ?auto_3436 ?auto_3435 ) ( not ( = ?auto_3434 ?auto_3438 ) ) ( not ( = ?auto_3441 ?auto_3438 ) ) ( not ( = ?auto_3440 ?auto_3435 ) ) ( CALIBRATION_TARGET ?auto_3436 ?auto_3438 ) ( ON_BOARD ?auto_3437 ?auto_3439 ) ( not ( = ?auto_3436 ?auto_3437 ) ) ( SUPPORTS ?auto_3437 ?auto_3440 ) ( CALIBRATION_TARGET ?auto_3437 ?auto_3438 ) ( POWER_AVAIL ?auto_3439 ) ( POINTING ?auto_3439 ?auto_3442 ) ( not ( = ?auto_3438 ?auto_3442 ) ) ( not ( = ?auto_3434 ?auto_3442 ) ) ( not ( = ?auto_3441 ?auto_3442 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_3439 ?auto_3438 ?auto_3442 )
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
      ?auto_3448 - INSTRUMENT
      ?auto_3449 - SATELLITE
      ?auto_3447 - DIRECTION
      ?auto_3451 - INSTRUMENT
      ?auto_3450 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3446 ?auto_3443 ) ) ( ON_BOARD ?auto_3448 ?auto_3449 ) ( SUPPORTS ?auto_3448 ?auto_3445 ) ( not ( = ?auto_3446 ?auto_3447 ) ) ( not ( = ?auto_3443 ?auto_3447 ) ) ( not ( = ?auto_3444 ?auto_3445 ) ) ( CALIBRATION_TARGET ?auto_3448 ?auto_3447 ) ( ON_BOARD ?auto_3451 ?auto_3449 ) ( not ( = ?auto_3448 ?auto_3451 ) ) ( SUPPORTS ?auto_3451 ?auto_3444 ) ( CALIBRATION_TARGET ?auto_3451 ?auto_3447 ) ( POWER_AVAIL ?auto_3449 ) ( POINTING ?auto_3449 ?auto_3450 ) ( not ( = ?auto_3447 ?auto_3450 ) ) ( not ( = ?auto_3446 ?auto_3450 ) ) ( not ( = ?auto_3443 ?auto_3450 ) ) )
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
      ?auto_3459 - INSTRUMENT
      ?auto_3457 - SATELLITE
      ?auto_3456 - DIRECTION
      ?auto_3460 - INSTRUMENT
      ?auto_3458 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3455 ?auto_3452 ) ) ( ON_BOARD ?auto_3459 ?auto_3457 ) ( SUPPORTS ?auto_3459 ?auto_3453 ) ( not ( = ?auto_3452 ?auto_3456 ) ) ( not ( = ?auto_3455 ?auto_3456 ) ) ( not ( = ?auto_3454 ?auto_3453 ) ) ( CALIBRATION_TARGET ?auto_3459 ?auto_3456 ) ( ON_BOARD ?auto_3460 ?auto_3457 ) ( not ( = ?auto_3459 ?auto_3460 ) ) ( SUPPORTS ?auto_3460 ?auto_3454 ) ( CALIBRATION_TARGET ?auto_3460 ?auto_3456 ) ( POWER_AVAIL ?auto_3457 ) ( POINTING ?auto_3457 ?auto_3458 ) ( not ( = ?auto_3456 ?auto_3458 ) ) ( not ( = ?auto_3452 ?auto_3458 ) ) ( not ( = ?auto_3455 ?auto_3458 ) ) )
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
    ( and ( not ( = ?auto_3694 ?auto_3691 ) ) ( CALIBRATED ?auto_3695 ) ( ON_BOARD ?auto_3695 ?auto_3696 ) ( SUPPORTS ?auto_3695 ?auto_3693 ) ( POWER_ON ?auto_3695 ) ( POINTING ?auto_3696 ?auto_3694 ) ( HAVE_IMAGE ?auto_3691 ?auto_3692 ) ( not ( = ?auto_3692 ?auto_3693 ) ) )
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
    ( and ( not ( = ?auto_3700 ?auto_3697 ) ) ( CALIBRATED ?auto_3701 ) ( ON_BOARD ?auto_3701 ?auto_3702 ) ( SUPPORTS ?auto_3701 ?auto_3699 ) ( POWER_ON ?auto_3701 ) ( POINTING ?auto_3702 ?auto_3700 ) ( HAVE_IMAGE ?auto_3697 ?auto_3698 ) ( not ( = ?auto_3698 ?auto_3699 ) ) )
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
    ( and ( not ( = ?auto_3706 ?auto_3703 ) ) ( CALIBRATED ?auto_3707 ) ( ON_BOARD ?auto_3707 ?auto_3708 ) ( SUPPORTS ?auto_3707 ?auto_3704 ) ( POWER_ON ?auto_3707 ) ( POINTING ?auto_3708 ?auto_3703 ) ( HAVE_IMAGE ?auto_3706 ?auto_3705 ) ( not ( = ?auto_3704 ?auto_3705 ) ) )
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
    ( and ( not ( = ?auto_3712 ?auto_3709 ) ) ( CALIBRATED ?auto_3713 ) ( ON_BOARD ?auto_3713 ?auto_3714 ) ( SUPPORTS ?auto_3713 ?auto_3710 ) ( POWER_ON ?auto_3713 ) ( POINTING ?auto_3714 ?auto_3709 ) ( HAVE_IMAGE ?auto_3712 ?auto_3711 ) ( not ( = ?auto_3710 ?auto_3711 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3709 ?auto_3710 )
      ( GET-2IMAGE-VERIFY ?auto_3709 ?auto_3710 ?auto_3712 ?auto_3711 ) )
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
    ( and ( not ( = ?auto_3732 ?auto_3729 ) ) ( not ( = ?auto_3734 ?auto_3729 ) ) ( not ( = ?auto_3734 ?auto_3732 ) ) ( CALIBRATED ?auto_3735 ) ( ON_BOARD ?auto_3735 ?auto_3736 ) ( SUPPORTS ?auto_3735 ?auto_3733 ) ( POWER_ON ?auto_3735 ) ( POINTING ?auto_3736 ?auto_3734 ) ( HAVE_IMAGE ?auto_3729 ?auto_3730 ) ( HAVE_IMAGE ?auto_3732 ?auto_3731 ) ( not ( = ?auto_3730 ?auto_3731 ) ) ( not ( = ?auto_3730 ?auto_3733 ) ) ( not ( = ?auto_3731 ?auto_3733 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3734 ?auto_3733 )
      ( GET-3IMAGE-VERIFY ?auto_3729 ?auto_3730 ?auto_3732 ?auto_3731 ?auto_3734 ?auto_3733 ) )
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
    ( and ( not ( = ?auto_3748 ?auto_3745 ) ) ( not ( = ?auto_3750 ?auto_3745 ) ) ( not ( = ?auto_3750 ?auto_3748 ) ) ( CALIBRATED ?auto_3751 ) ( ON_BOARD ?auto_3751 ?auto_3752 ) ( SUPPORTS ?auto_3751 ?auto_3747 ) ( POWER_ON ?auto_3751 ) ( POINTING ?auto_3752 ?auto_3748 ) ( HAVE_IMAGE ?auto_3745 ?auto_3746 ) ( HAVE_IMAGE ?auto_3750 ?auto_3749 ) ( not ( = ?auto_3746 ?auto_3747 ) ) ( not ( = ?auto_3746 ?auto_3749 ) ) ( not ( = ?auto_3747 ?auto_3749 ) ) )
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
    ( and ( not ( = ?auto_3764 ?auto_3761 ) ) ( not ( = ?auto_3766 ?auto_3761 ) ) ( not ( = ?auto_3766 ?auto_3764 ) ) ( CALIBRATED ?auto_3767 ) ( ON_BOARD ?auto_3767 ?auto_3768 ) ( SUPPORTS ?auto_3767 ?auto_3765 ) ( POWER_ON ?auto_3767 ) ( POINTING ?auto_3768 ?auto_3766 ) ( HAVE_IMAGE ?auto_3761 ?auto_3762 ) ( HAVE_IMAGE ?auto_3764 ?auto_3763 ) ( not ( = ?auto_3762 ?auto_3763 ) ) ( not ( = ?auto_3762 ?auto_3765 ) ) ( not ( = ?auto_3763 ?auto_3765 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3766 ?auto_3765 )
      ( GET-3IMAGE-VERIFY ?auto_3761 ?auto_3762 ?auto_3764 ?auto_3763 ?auto_3766 ?auto_3765 ) )
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
    ( and ( not ( = ?auto_3780 ?auto_3777 ) ) ( not ( = ?auto_3782 ?auto_3777 ) ) ( not ( = ?auto_3782 ?auto_3780 ) ) ( CALIBRATED ?auto_3783 ) ( ON_BOARD ?auto_3783 ?auto_3784 ) ( SUPPORTS ?auto_3783 ?auto_3779 ) ( POWER_ON ?auto_3783 ) ( POINTING ?auto_3784 ?auto_3780 ) ( HAVE_IMAGE ?auto_3777 ?auto_3778 ) ( HAVE_IMAGE ?auto_3782 ?auto_3781 ) ( not ( = ?auto_3778 ?auto_3779 ) ) ( not ( = ?auto_3778 ?auto_3781 ) ) ( not ( = ?auto_3779 ?auto_3781 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3780 ?auto_3779 )
      ( GET-3IMAGE-VERIFY ?auto_3777 ?auto_3778 ?auto_3780 ?auto_3779 ?auto_3782 ?auto_3781 ) )
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
    ( and ( not ( = ?auto_3812 ?auto_3809 ) ) ( not ( = ?auto_3814 ?auto_3809 ) ) ( not ( = ?auto_3814 ?auto_3812 ) ) ( CALIBRATED ?auto_3815 ) ( ON_BOARD ?auto_3815 ?auto_3816 ) ( SUPPORTS ?auto_3815 ?auto_3810 ) ( POWER_ON ?auto_3815 ) ( POINTING ?auto_3816 ?auto_3809 ) ( HAVE_IMAGE ?auto_3812 ?auto_3811 ) ( HAVE_IMAGE ?auto_3814 ?auto_3813 ) ( not ( = ?auto_3810 ?auto_3811 ) ) ( not ( = ?auto_3810 ?auto_3813 ) ) ( not ( = ?auto_3811 ?auto_3813 ) ) )
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
    ( and ( not ( = ?auto_3828 ?auto_3825 ) ) ( not ( = ?auto_3830 ?auto_3825 ) ) ( not ( = ?auto_3830 ?auto_3828 ) ) ( CALIBRATED ?auto_3831 ) ( ON_BOARD ?auto_3831 ?auto_3832 ) ( SUPPORTS ?auto_3831 ?auto_3826 ) ( POWER_ON ?auto_3831 ) ( POINTING ?auto_3832 ?auto_3825 ) ( HAVE_IMAGE ?auto_3828 ?auto_3827 ) ( HAVE_IMAGE ?auto_3830 ?auto_3829 ) ( not ( = ?auto_3826 ?auto_3827 ) ) ( not ( = ?auto_3826 ?auto_3829 ) ) ( not ( = ?auto_3827 ?auto_3829 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3825 ?auto_3826 )
      ( GET-3IMAGE-VERIFY ?auto_3825 ?auto_3826 ?auto_3828 ?auto_3827 ?auto_3830 ?auto_3829 ) )
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
    ( and ( not ( = ?auto_3881 ?auto_3878 ) ) ( CALIBRATED ?auto_3883 ) ( ON_BOARD ?auto_3883 ?auto_3882 ) ( SUPPORTS ?auto_3883 ?auto_3880 ) ( POWER_ON ?auto_3883 ) ( POINTING ?auto_3882 ?auto_3884 ) ( not ( = ?auto_3881 ?auto_3884 ) ) ( HAVE_IMAGE ?auto_3878 ?auto_3879 ) ( not ( = ?auto_3878 ?auto_3884 ) ) ( not ( = ?auto_3879 ?auto_3880 ) ) )
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
      ?auto_3893 - DIRECTION
      ?auto_3890 - INSTRUMENT
      ?auto_3891 - SATELLITE
      ?auto_3889 - DIRECTION
      ?auto_3892 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_3888 ?auto_3885 ) ) ( not ( = ?auto_3888 ?auto_3893 ) ) ( CALIBRATED ?auto_3890 ) ( ON_BOARD ?auto_3890 ?auto_3891 ) ( SUPPORTS ?auto_3890 ?auto_3887 ) ( POWER_ON ?auto_3890 ) ( POINTING ?auto_3891 ?auto_3889 ) ( not ( = ?auto_3888 ?auto_3889 ) ) ( HAVE_IMAGE ?auto_3893 ?auto_3892 ) ( not ( = ?auto_3893 ?auto_3889 ) ) ( not ( = ?auto_3892 ?auto_3887 ) ) ( HAVE_IMAGE ?auto_3885 ?auto_3886 ) ( not ( = ?auto_3885 ?auto_3893 ) ) ( not ( = ?auto_3885 ?auto_3889 ) ) ( not ( = ?auto_3886 ?auto_3887 ) ) ( not ( = ?auto_3886 ?auto_3892 ) ) )
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
      ?auto_3899 - INSTRUMENT
      ?auto_3900 - SATELLITE
      ?auto_3898 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3897 ?auto_3894 ) ) ( CALIBRATED ?auto_3899 ) ( ON_BOARD ?auto_3899 ?auto_3900 ) ( SUPPORTS ?auto_3899 ?auto_3895 ) ( POWER_ON ?auto_3899 ) ( POINTING ?auto_3900 ?auto_3898 ) ( not ( = ?auto_3894 ?auto_3898 ) ) ( HAVE_IMAGE ?auto_3897 ?auto_3896 ) ( not ( = ?auto_3897 ?auto_3898 ) ) ( not ( = ?auto_3896 ?auto_3895 ) ) )
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
      ?auto_3909 - DIRECTION
      ?auto_3906 - INSTRUMENT
      ?auto_3907 - SATELLITE
      ?auto_3905 - DIRECTION
      ?auto_3908 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_3904 ?auto_3901 ) ) ( not ( = ?auto_3901 ?auto_3909 ) ) ( CALIBRATED ?auto_3906 ) ( ON_BOARD ?auto_3906 ?auto_3907 ) ( SUPPORTS ?auto_3906 ?auto_3902 ) ( POWER_ON ?auto_3906 ) ( POINTING ?auto_3907 ?auto_3905 ) ( not ( = ?auto_3901 ?auto_3905 ) ) ( HAVE_IMAGE ?auto_3909 ?auto_3908 ) ( not ( = ?auto_3909 ?auto_3905 ) ) ( not ( = ?auto_3908 ?auto_3902 ) ) ( HAVE_IMAGE ?auto_3904 ?auto_3903 ) ( not ( = ?auto_3902 ?auto_3903 ) ) ( not ( = ?auto_3904 ?auto_3909 ) ) ( not ( = ?auto_3904 ?auto_3905 ) ) ( not ( = ?auto_3903 ?auto_3908 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3909 ?auto_3908 ?auto_3901 ?auto_3902 )
      ( GET-2IMAGE-VERIFY ?auto_3901 ?auto_3902 ?auto_3904 ?auto_3903 ) )
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
      ?auto_3935 - INSTRUMENT
      ?auto_3936 - SATELLITE
      ?auto_3934 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3931 ?auto_3928 ) ) ( not ( = ?auto_3933 ?auto_3928 ) ) ( not ( = ?auto_3933 ?auto_3931 ) ) ( CALIBRATED ?auto_3935 ) ( ON_BOARD ?auto_3935 ?auto_3936 ) ( SUPPORTS ?auto_3935 ?auto_3932 ) ( POWER_ON ?auto_3935 ) ( POINTING ?auto_3936 ?auto_3934 ) ( not ( = ?auto_3933 ?auto_3934 ) ) ( HAVE_IMAGE ?auto_3928 ?auto_3929 ) ( not ( = ?auto_3928 ?auto_3934 ) ) ( not ( = ?auto_3929 ?auto_3932 ) ) ( HAVE_IMAGE ?auto_3931 ?auto_3930 ) ( not ( = ?auto_3929 ?auto_3930 ) ) ( not ( = ?auto_3931 ?auto_3934 ) ) ( not ( = ?auto_3930 ?auto_3932 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3928 ?auto_3929 ?auto_3933 ?auto_3932 )
      ( GET-3IMAGE-VERIFY ?auto_3928 ?auto_3929 ?auto_3931 ?auto_3930 ?auto_3933 ?auto_3932 ) )
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
      ?auto_3953 - INSTRUMENT
      ?auto_3954 - SATELLITE
      ?auto_3952 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3949 ?auto_3946 ) ) ( not ( = ?auto_3951 ?auto_3946 ) ) ( not ( = ?auto_3951 ?auto_3949 ) ) ( CALIBRATED ?auto_3953 ) ( ON_BOARD ?auto_3953 ?auto_3954 ) ( SUPPORTS ?auto_3953 ?auto_3948 ) ( POWER_ON ?auto_3953 ) ( POINTING ?auto_3954 ?auto_3952 ) ( not ( = ?auto_3949 ?auto_3952 ) ) ( HAVE_IMAGE ?auto_3946 ?auto_3947 ) ( not ( = ?auto_3946 ?auto_3952 ) ) ( not ( = ?auto_3947 ?auto_3948 ) ) ( HAVE_IMAGE ?auto_3951 ?auto_3950 ) ( not ( = ?auto_3947 ?auto_3950 ) ) ( not ( = ?auto_3948 ?auto_3950 ) ) ( not ( = ?auto_3951 ?auto_3952 ) ) )
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
      ?auto_3971 - INSTRUMENT
      ?auto_3972 - SATELLITE
      ?auto_3970 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3967 ?auto_3964 ) ) ( not ( = ?auto_3969 ?auto_3964 ) ) ( not ( = ?auto_3969 ?auto_3967 ) ) ( CALIBRATED ?auto_3971 ) ( ON_BOARD ?auto_3971 ?auto_3972 ) ( SUPPORTS ?auto_3971 ?auto_3968 ) ( POWER_ON ?auto_3971 ) ( POINTING ?auto_3972 ?auto_3970 ) ( not ( = ?auto_3969 ?auto_3970 ) ) ( HAVE_IMAGE ?auto_3967 ?auto_3966 ) ( not ( = ?auto_3967 ?auto_3970 ) ) ( not ( = ?auto_3966 ?auto_3968 ) ) ( HAVE_IMAGE ?auto_3964 ?auto_3965 ) ( not ( = ?auto_3964 ?auto_3970 ) ) ( not ( = ?auto_3965 ?auto_3966 ) ) ( not ( = ?auto_3965 ?auto_3968 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3967 ?auto_3966 ?auto_3969 ?auto_3968 )
      ( GET-3IMAGE-VERIFY ?auto_3964 ?auto_3965 ?auto_3967 ?auto_3966 ?auto_3969 ?auto_3968 ) )
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
      ?auto_3991 - INSTRUMENT
      ?auto_3992 - SATELLITE
      ?auto_3990 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3987 ?auto_3984 ) ) ( not ( = ?auto_3989 ?auto_3984 ) ) ( not ( = ?auto_3989 ?auto_3987 ) ) ( CALIBRATED ?auto_3991 ) ( ON_BOARD ?auto_3991 ?auto_3992 ) ( SUPPORTS ?auto_3991 ?auto_3986 ) ( POWER_ON ?auto_3991 ) ( POINTING ?auto_3992 ?auto_3990 ) ( not ( = ?auto_3987 ?auto_3990 ) ) ( HAVE_IMAGE ?auto_3989 ?auto_3988 ) ( not ( = ?auto_3989 ?auto_3990 ) ) ( not ( = ?auto_3988 ?auto_3986 ) ) ( HAVE_IMAGE ?auto_3984 ?auto_3985 ) ( not ( = ?auto_3984 ?auto_3990 ) ) ( not ( = ?auto_3985 ?auto_3986 ) ) ( not ( = ?auto_3985 ?auto_3988 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3989 ?auto_3988 ?auto_3987 ?auto_3986 )
      ( GET-3IMAGE-VERIFY ?auto_3984 ?auto_3985 ?auto_3987 ?auto_3986 ?auto_3989 ?auto_3988 ) )
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
      ?auto_4031 - INSTRUMENT
      ?auto_4032 - SATELLITE
      ?auto_4030 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4027 ?auto_4024 ) ) ( not ( = ?auto_4029 ?auto_4024 ) ) ( not ( = ?auto_4029 ?auto_4027 ) ) ( CALIBRATED ?auto_4031 ) ( ON_BOARD ?auto_4031 ?auto_4032 ) ( SUPPORTS ?auto_4031 ?auto_4025 ) ( POWER_ON ?auto_4031 ) ( POINTING ?auto_4032 ?auto_4030 ) ( not ( = ?auto_4024 ?auto_4030 ) ) ( HAVE_IMAGE ?auto_4027 ?auto_4026 ) ( not ( = ?auto_4027 ?auto_4030 ) ) ( not ( = ?auto_4026 ?auto_4025 ) ) ( HAVE_IMAGE ?auto_4029 ?auto_4028 ) ( not ( = ?auto_4025 ?auto_4028 ) ) ( not ( = ?auto_4026 ?auto_4028 ) ) ( not ( = ?auto_4029 ?auto_4030 ) ) )
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
      ?auto_4049 - INSTRUMENT
      ?auto_4050 - SATELLITE
      ?auto_4048 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4045 ?auto_4042 ) ) ( not ( = ?auto_4047 ?auto_4042 ) ) ( not ( = ?auto_4047 ?auto_4045 ) ) ( CALIBRATED ?auto_4049 ) ( ON_BOARD ?auto_4049 ?auto_4050 ) ( SUPPORTS ?auto_4049 ?auto_4043 ) ( POWER_ON ?auto_4049 ) ( POINTING ?auto_4050 ?auto_4048 ) ( not ( = ?auto_4042 ?auto_4048 ) ) ( HAVE_IMAGE ?auto_4047 ?auto_4046 ) ( not ( = ?auto_4047 ?auto_4048 ) ) ( not ( = ?auto_4046 ?auto_4043 ) ) ( HAVE_IMAGE ?auto_4045 ?auto_4044 ) ( not ( = ?auto_4043 ?auto_4044 ) ) ( not ( = ?auto_4045 ?auto_4048 ) ) ( not ( = ?auto_4044 ?auto_4046 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4047 ?auto_4046 ?auto_4042 ?auto_4043 )
      ( GET-3IMAGE-VERIFY ?auto_4042 ?auto_4043 ?auto_4045 ?auto_4044 ?auto_4047 ?auto_4046 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4104 - DIRECTION
      ?auto_4105 - MODE
    )
    :vars
    (
      ?auto_4110 - DIRECTION
      ?auto_4107 - INSTRUMENT
      ?auto_4108 - SATELLITE
      ?auto_4106 - DIRECTION
      ?auto_4109 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_4104 ?auto_4110 ) ) ( ON_BOARD ?auto_4107 ?auto_4108 ) ( SUPPORTS ?auto_4107 ?auto_4105 ) ( POWER_ON ?auto_4107 ) ( POINTING ?auto_4108 ?auto_4106 ) ( not ( = ?auto_4104 ?auto_4106 ) ) ( HAVE_IMAGE ?auto_4110 ?auto_4109 ) ( not ( = ?auto_4110 ?auto_4106 ) ) ( not ( = ?auto_4109 ?auto_4105 ) ) ( CALIBRATION_TARGET ?auto_4107 ?auto_4106 ) ( NOT_CALIBRATED ?auto_4107 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_4108 ?auto_4107 ?auto_4106 )
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
      ?auto_4115 - INSTRUMENT
      ?auto_4116 - SATELLITE
      ?auto_4117 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4114 ?auto_4111 ) ) ( ON_BOARD ?auto_4115 ?auto_4116 ) ( SUPPORTS ?auto_4115 ?auto_4113 ) ( POWER_ON ?auto_4115 ) ( POINTING ?auto_4116 ?auto_4117 ) ( not ( = ?auto_4114 ?auto_4117 ) ) ( HAVE_IMAGE ?auto_4111 ?auto_4112 ) ( not ( = ?auto_4111 ?auto_4117 ) ) ( not ( = ?auto_4112 ?auto_4113 ) ) ( CALIBRATION_TARGET ?auto_4115 ?auto_4117 ) ( NOT_CALIBRATED ?auto_4115 ) )
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
      ?auto_4126 - DIRECTION
      ?auto_4122 - INSTRUMENT
      ?auto_4123 - SATELLITE
      ?auto_4124 - DIRECTION
      ?auto_4125 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_4121 ?auto_4118 ) ) ( not ( = ?auto_4121 ?auto_4126 ) ) ( ON_BOARD ?auto_4122 ?auto_4123 ) ( SUPPORTS ?auto_4122 ?auto_4120 ) ( POWER_ON ?auto_4122 ) ( POINTING ?auto_4123 ?auto_4124 ) ( not ( = ?auto_4121 ?auto_4124 ) ) ( HAVE_IMAGE ?auto_4126 ?auto_4125 ) ( not ( = ?auto_4126 ?auto_4124 ) ) ( not ( = ?auto_4125 ?auto_4120 ) ) ( CALIBRATION_TARGET ?auto_4122 ?auto_4124 ) ( NOT_CALIBRATED ?auto_4122 ) ( HAVE_IMAGE ?auto_4118 ?auto_4119 ) ( not ( = ?auto_4118 ?auto_4126 ) ) ( not ( = ?auto_4118 ?auto_4124 ) ) ( not ( = ?auto_4119 ?auto_4120 ) ) ( not ( = ?auto_4119 ?auto_4125 ) ) )
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
      ?auto_4131 - INSTRUMENT
      ?auto_4132 - SATELLITE
      ?auto_4133 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4130 ?auto_4127 ) ) ( ON_BOARD ?auto_4131 ?auto_4132 ) ( SUPPORTS ?auto_4131 ?auto_4128 ) ( POWER_ON ?auto_4131 ) ( POINTING ?auto_4132 ?auto_4133 ) ( not ( = ?auto_4127 ?auto_4133 ) ) ( HAVE_IMAGE ?auto_4130 ?auto_4129 ) ( not ( = ?auto_4130 ?auto_4133 ) ) ( not ( = ?auto_4129 ?auto_4128 ) ) ( CALIBRATION_TARGET ?auto_4131 ?auto_4133 ) ( NOT_CALIBRATED ?auto_4131 ) )
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
      ?auto_4142 - DIRECTION
      ?auto_4138 - INSTRUMENT
      ?auto_4139 - SATELLITE
      ?auto_4140 - DIRECTION
      ?auto_4141 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_4137 ?auto_4134 ) ) ( not ( = ?auto_4134 ?auto_4142 ) ) ( ON_BOARD ?auto_4138 ?auto_4139 ) ( SUPPORTS ?auto_4138 ?auto_4135 ) ( POWER_ON ?auto_4138 ) ( POINTING ?auto_4139 ?auto_4140 ) ( not ( = ?auto_4134 ?auto_4140 ) ) ( HAVE_IMAGE ?auto_4142 ?auto_4141 ) ( not ( = ?auto_4142 ?auto_4140 ) ) ( not ( = ?auto_4141 ?auto_4135 ) ) ( CALIBRATION_TARGET ?auto_4138 ?auto_4140 ) ( NOT_CALIBRATED ?auto_4138 ) ( HAVE_IMAGE ?auto_4137 ?auto_4136 ) ( not ( = ?auto_4135 ?auto_4136 ) ) ( not ( = ?auto_4137 ?auto_4142 ) ) ( not ( = ?auto_4137 ?auto_4140 ) ) ( not ( = ?auto_4136 ?auto_4141 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4142 ?auto_4141 ?auto_4134 ?auto_4135 )
      ( GET-2IMAGE-VERIFY ?auto_4134 ?auto_4135 ?auto_4137 ?auto_4136 ) )
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
      ?auto_4167 - INSTRUMENT
      ?auto_4168 - SATELLITE
      ?auto_4169 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4164 ?auto_4161 ) ) ( not ( = ?auto_4166 ?auto_4161 ) ) ( not ( = ?auto_4166 ?auto_4164 ) ) ( ON_BOARD ?auto_4167 ?auto_4168 ) ( SUPPORTS ?auto_4167 ?auto_4165 ) ( POWER_ON ?auto_4167 ) ( POINTING ?auto_4168 ?auto_4169 ) ( not ( = ?auto_4166 ?auto_4169 ) ) ( HAVE_IMAGE ?auto_4161 ?auto_4162 ) ( not ( = ?auto_4161 ?auto_4169 ) ) ( not ( = ?auto_4162 ?auto_4165 ) ) ( CALIBRATION_TARGET ?auto_4167 ?auto_4169 ) ( NOT_CALIBRATED ?auto_4167 ) ( HAVE_IMAGE ?auto_4164 ?auto_4163 ) ( not ( = ?auto_4162 ?auto_4163 ) ) ( not ( = ?auto_4164 ?auto_4169 ) ) ( not ( = ?auto_4163 ?auto_4165 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4161 ?auto_4162 ?auto_4166 ?auto_4165 )
      ( GET-3IMAGE-VERIFY ?auto_4161 ?auto_4162 ?auto_4164 ?auto_4163 ?auto_4166 ?auto_4165 ) )
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
      ?auto_4185 - INSTRUMENT
      ?auto_4186 - SATELLITE
      ?auto_4187 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4182 ?auto_4179 ) ) ( not ( = ?auto_4184 ?auto_4179 ) ) ( not ( = ?auto_4184 ?auto_4182 ) ) ( ON_BOARD ?auto_4185 ?auto_4186 ) ( SUPPORTS ?auto_4185 ?auto_4181 ) ( POWER_ON ?auto_4185 ) ( POINTING ?auto_4186 ?auto_4187 ) ( not ( = ?auto_4182 ?auto_4187 ) ) ( HAVE_IMAGE ?auto_4179 ?auto_4180 ) ( not ( = ?auto_4179 ?auto_4187 ) ) ( not ( = ?auto_4180 ?auto_4181 ) ) ( CALIBRATION_TARGET ?auto_4185 ?auto_4187 ) ( NOT_CALIBRATED ?auto_4185 ) ( HAVE_IMAGE ?auto_4184 ?auto_4183 ) ( not ( = ?auto_4180 ?auto_4183 ) ) ( not ( = ?auto_4181 ?auto_4183 ) ) ( not ( = ?auto_4184 ?auto_4187 ) ) )
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
      ?auto_4203 - INSTRUMENT
      ?auto_4204 - SATELLITE
      ?auto_4205 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4200 ?auto_4197 ) ) ( not ( = ?auto_4202 ?auto_4197 ) ) ( not ( = ?auto_4202 ?auto_4200 ) ) ( ON_BOARD ?auto_4203 ?auto_4204 ) ( SUPPORTS ?auto_4203 ?auto_4201 ) ( POWER_ON ?auto_4203 ) ( POINTING ?auto_4204 ?auto_4205 ) ( not ( = ?auto_4202 ?auto_4205 ) ) ( HAVE_IMAGE ?auto_4200 ?auto_4199 ) ( not ( = ?auto_4200 ?auto_4205 ) ) ( not ( = ?auto_4199 ?auto_4201 ) ) ( CALIBRATION_TARGET ?auto_4203 ?auto_4205 ) ( NOT_CALIBRATED ?auto_4203 ) ( HAVE_IMAGE ?auto_4197 ?auto_4198 ) ( not ( = ?auto_4197 ?auto_4205 ) ) ( not ( = ?auto_4198 ?auto_4199 ) ) ( not ( = ?auto_4198 ?auto_4201 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4200 ?auto_4199 ?auto_4202 ?auto_4201 )
      ( GET-3IMAGE-VERIFY ?auto_4197 ?auto_4198 ?auto_4200 ?auto_4199 ?auto_4202 ?auto_4201 ) )
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
      ?auto_4223 - INSTRUMENT
      ?auto_4224 - SATELLITE
      ?auto_4225 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4220 ?auto_4217 ) ) ( not ( = ?auto_4222 ?auto_4217 ) ) ( not ( = ?auto_4222 ?auto_4220 ) ) ( ON_BOARD ?auto_4223 ?auto_4224 ) ( SUPPORTS ?auto_4223 ?auto_4219 ) ( POWER_ON ?auto_4223 ) ( POINTING ?auto_4224 ?auto_4225 ) ( not ( = ?auto_4220 ?auto_4225 ) ) ( HAVE_IMAGE ?auto_4222 ?auto_4221 ) ( not ( = ?auto_4222 ?auto_4225 ) ) ( not ( = ?auto_4221 ?auto_4219 ) ) ( CALIBRATION_TARGET ?auto_4223 ?auto_4225 ) ( NOT_CALIBRATED ?auto_4223 ) ( HAVE_IMAGE ?auto_4217 ?auto_4218 ) ( not ( = ?auto_4217 ?auto_4225 ) ) ( not ( = ?auto_4218 ?auto_4219 ) ) ( not ( = ?auto_4218 ?auto_4221 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4222 ?auto_4221 ?auto_4220 ?auto_4219 )
      ( GET-3IMAGE-VERIFY ?auto_4217 ?auto_4218 ?auto_4220 ?auto_4219 ?auto_4222 ?auto_4221 ) )
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
      ?auto_4263 - INSTRUMENT
      ?auto_4264 - SATELLITE
      ?auto_4265 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4260 ?auto_4257 ) ) ( not ( = ?auto_4262 ?auto_4257 ) ) ( not ( = ?auto_4262 ?auto_4260 ) ) ( ON_BOARD ?auto_4263 ?auto_4264 ) ( SUPPORTS ?auto_4263 ?auto_4258 ) ( POWER_ON ?auto_4263 ) ( POINTING ?auto_4264 ?auto_4265 ) ( not ( = ?auto_4257 ?auto_4265 ) ) ( HAVE_IMAGE ?auto_4260 ?auto_4259 ) ( not ( = ?auto_4260 ?auto_4265 ) ) ( not ( = ?auto_4259 ?auto_4258 ) ) ( CALIBRATION_TARGET ?auto_4263 ?auto_4265 ) ( NOT_CALIBRATED ?auto_4263 ) ( HAVE_IMAGE ?auto_4262 ?auto_4261 ) ( not ( = ?auto_4258 ?auto_4261 ) ) ( not ( = ?auto_4259 ?auto_4261 ) ) ( not ( = ?auto_4262 ?auto_4265 ) ) )
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
      ?auto_4281 - INSTRUMENT
      ?auto_4282 - SATELLITE
      ?auto_4283 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4278 ?auto_4275 ) ) ( not ( = ?auto_4280 ?auto_4275 ) ) ( not ( = ?auto_4280 ?auto_4278 ) ) ( ON_BOARD ?auto_4281 ?auto_4282 ) ( SUPPORTS ?auto_4281 ?auto_4276 ) ( POWER_ON ?auto_4281 ) ( POINTING ?auto_4282 ?auto_4283 ) ( not ( = ?auto_4275 ?auto_4283 ) ) ( HAVE_IMAGE ?auto_4280 ?auto_4279 ) ( not ( = ?auto_4280 ?auto_4283 ) ) ( not ( = ?auto_4279 ?auto_4276 ) ) ( CALIBRATION_TARGET ?auto_4281 ?auto_4283 ) ( NOT_CALIBRATED ?auto_4281 ) ( HAVE_IMAGE ?auto_4278 ?auto_4277 ) ( not ( = ?auto_4276 ?auto_4277 ) ) ( not ( = ?auto_4278 ?auto_4283 ) ) ( not ( = ?auto_4277 ?auto_4279 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4280 ?auto_4279 ?auto_4275 ?auto_4276 )
      ( GET-3IMAGE-VERIFY ?auto_4275 ?auto_4276 ?auto_4278 ?auto_4277 ?auto_4280 ?auto_4279 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4337 - DIRECTION
      ?auto_4338 - MODE
    )
    :vars
    (
      ?auto_4343 - DIRECTION
      ?auto_4339 - INSTRUMENT
      ?auto_4340 - SATELLITE
      ?auto_4341 - DIRECTION
      ?auto_4342 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_4337 ?auto_4343 ) ) ( ON_BOARD ?auto_4339 ?auto_4340 ) ( SUPPORTS ?auto_4339 ?auto_4338 ) ( POINTING ?auto_4340 ?auto_4341 ) ( not ( = ?auto_4337 ?auto_4341 ) ) ( HAVE_IMAGE ?auto_4343 ?auto_4342 ) ( not ( = ?auto_4343 ?auto_4341 ) ) ( not ( = ?auto_4342 ?auto_4338 ) ) ( CALIBRATION_TARGET ?auto_4339 ?auto_4341 ) ( POWER_AVAIL ?auto_4340 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_4339 ?auto_4340 )
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
      ?auto_4348 - INSTRUMENT
      ?auto_4350 - SATELLITE
      ?auto_4349 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4347 ?auto_4344 ) ) ( ON_BOARD ?auto_4348 ?auto_4350 ) ( SUPPORTS ?auto_4348 ?auto_4346 ) ( POINTING ?auto_4350 ?auto_4349 ) ( not ( = ?auto_4347 ?auto_4349 ) ) ( HAVE_IMAGE ?auto_4344 ?auto_4345 ) ( not ( = ?auto_4344 ?auto_4349 ) ) ( not ( = ?auto_4345 ?auto_4346 ) ) ( CALIBRATION_TARGET ?auto_4348 ?auto_4349 ) ( POWER_AVAIL ?auto_4350 ) )
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
      ?auto_4359 - DIRECTION
      ?auto_4355 - INSTRUMENT
      ?auto_4357 - SATELLITE
      ?auto_4356 - DIRECTION
      ?auto_4358 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_4354 ?auto_4351 ) ) ( not ( = ?auto_4354 ?auto_4359 ) ) ( ON_BOARD ?auto_4355 ?auto_4357 ) ( SUPPORTS ?auto_4355 ?auto_4353 ) ( POINTING ?auto_4357 ?auto_4356 ) ( not ( = ?auto_4354 ?auto_4356 ) ) ( HAVE_IMAGE ?auto_4359 ?auto_4358 ) ( not ( = ?auto_4359 ?auto_4356 ) ) ( not ( = ?auto_4358 ?auto_4353 ) ) ( CALIBRATION_TARGET ?auto_4355 ?auto_4356 ) ( POWER_AVAIL ?auto_4357 ) ( HAVE_IMAGE ?auto_4351 ?auto_4352 ) ( not ( = ?auto_4351 ?auto_4359 ) ) ( not ( = ?auto_4351 ?auto_4356 ) ) ( not ( = ?auto_4352 ?auto_4353 ) ) ( not ( = ?auto_4352 ?auto_4358 ) ) )
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
      ?auto_4366 - SATELLITE
      ?auto_4365 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4363 ?auto_4360 ) ) ( ON_BOARD ?auto_4364 ?auto_4366 ) ( SUPPORTS ?auto_4364 ?auto_4361 ) ( POINTING ?auto_4366 ?auto_4365 ) ( not ( = ?auto_4360 ?auto_4365 ) ) ( HAVE_IMAGE ?auto_4363 ?auto_4362 ) ( not ( = ?auto_4363 ?auto_4365 ) ) ( not ( = ?auto_4362 ?auto_4361 ) ) ( CALIBRATION_TARGET ?auto_4364 ?auto_4365 ) ( POWER_AVAIL ?auto_4366 ) )
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
      ?auto_4375 - DIRECTION
      ?auto_4371 - INSTRUMENT
      ?auto_4373 - SATELLITE
      ?auto_4372 - DIRECTION
      ?auto_4374 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_4370 ?auto_4367 ) ) ( not ( = ?auto_4367 ?auto_4375 ) ) ( ON_BOARD ?auto_4371 ?auto_4373 ) ( SUPPORTS ?auto_4371 ?auto_4368 ) ( POINTING ?auto_4373 ?auto_4372 ) ( not ( = ?auto_4367 ?auto_4372 ) ) ( HAVE_IMAGE ?auto_4375 ?auto_4374 ) ( not ( = ?auto_4375 ?auto_4372 ) ) ( not ( = ?auto_4374 ?auto_4368 ) ) ( CALIBRATION_TARGET ?auto_4371 ?auto_4372 ) ( POWER_AVAIL ?auto_4373 ) ( HAVE_IMAGE ?auto_4370 ?auto_4369 ) ( not ( = ?auto_4368 ?auto_4369 ) ) ( not ( = ?auto_4370 ?auto_4375 ) ) ( not ( = ?auto_4370 ?auto_4372 ) ) ( not ( = ?auto_4369 ?auto_4374 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4375 ?auto_4374 ?auto_4367 ?auto_4368 )
      ( GET-2IMAGE-VERIFY ?auto_4367 ?auto_4368 ?auto_4370 ?auto_4369 ) )
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
      ?auto_4402 - SATELLITE
      ?auto_4401 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4397 ?auto_4394 ) ) ( not ( = ?auto_4399 ?auto_4394 ) ) ( not ( = ?auto_4399 ?auto_4397 ) ) ( ON_BOARD ?auto_4400 ?auto_4402 ) ( SUPPORTS ?auto_4400 ?auto_4398 ) ( POINTING ?auto_4402 ?auto_4401 ) ( not ( = ?auto_4399 ?auto_4401 ) ) ( HAVE_IMAGE ?auto_4394 ?auto_4395 ) ( not ( = ?auto_4394 ?auto_4401 ) ) ( not ( = ?auto_4395 ?auto_4398 ) ) ( CALIBRATION_TARGET ?auto_4400 ?auto_4401 ) ( POWER_AVAIL ?auto_4402 ) ( HAVE_IMAGE ?auto_4397 ?auto_4396 ) ( not ( = ?auto_4395 ?auto_4396 ) ) ( not ( = ?auto_4397 ?auto_4401 ) ) ( not ( = ?auto_4396 ?auto_4398 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4394 ?auto_4395 ?auto_4399 ?auto_4398 )
      ( GET-3IMAGE-VERIFY ?auto_4394 ?auto_4395 ?auto_4397 ?auto_4396 ?auto_4399 ?auto_4398 ) )
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
      ?auto_4420 - SATELLITE
      ?auto_4419 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4415 ?auto_4412 ) ) ( not ( = ?auto_4417 ?auto_4412 ) ) ( not ( = ?auto_4417 ?auto_4415 ) ) ( ON_BOARD ?auto_4418 ?auto_4420 ) ( SUPPORTS ?auto_4418 ?auto_4414 ) ( POINTING ?auto_4420 ?auto_4419 ) ( not ( = ?auto_4415 ?auto_4419 ) ) ( HAVE_IMAGE ?auto_4412 ?auto_4413 ) ( not ( = ?auto_4412 ?auto_4419 ) ) ( not ( = ?auto_4413 ?auto_4414 ) ) ( CALIBRATION_TARGET ?auto_4418 ?auto_4419 ) ( POWER_AVAIL ?auto_4420 ) ( HAVE_IMAGE ?auto_4417 ?auto_4416 ) ( not ( = ?auto_4413 ?auto_4416 ) ) ( not ( = ?auto_4414 ?auto_4416 ) ) ( not ( = ?auto_4417 ?auto_4419 ) ) )
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
      ?auto_4438 - SATELLITE
      ?auto_4437 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4433 ?auto_4430 ) ) ( not ( = ?auto_4435 ?auto_4430 ) ) ( not ( = ?auto_4435 ?auto_4433 ) ) ( ON_BOARD ?auto_4436 ?auto_4438 ) ( SUPPORTS ?auto_4436 ?auto_4434 ) ( POINTING ?auto_4438 ?auto_4437 ) ( not ( = ?auto_4435 ?auto_4437 ) ) ( HAVE_IMAGE ?auto_4433 ?auto_4432 ) ( not ( = ?auto_4433 ?auto_4437 ) ) ( not ( = ?auto_4432 ?auto_4434 ) ) ( CALIBRATION_TARGET ?auto_4436 ?auto_4437 ) ( POWER_AVAIL ?auto_4438 ) ( HAVE_IMAGE ?auto_4430 ?auto_4431 ) ( not ( = ?auto_4430 ?auto_4437 ) ) ( not ( = ?auto_4431 ?auto_4432 ) ) ( not ( = ?auto_4431 ?auto_4434 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4433 ?auto_4432 ?auto_4435 ?auto_4434 )
      ( GET-3IMAGE-VERIFY ?auto_4430 ?auto_4431 ?auto_4433 ?auto_4432 ?auto_4435 ?auto_4434 ) )
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
      ?auto_4458 - SATELLITE
      ?auto_4457 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4453 ?auto_4450 ) ) ( not ( = ?auto_4455 ?auto_4450 ) ) ( not ( = ?auto_4455 ?auto_4453 ) ) ( ON_BOARD ?auto_4456 ?auto_4458 ) ( SUPPORTS ?auto_4456 ?auto_4452 ) ( POINTING ?auto_4458 ?auto_4457 ) ( not ( = ?auto_4453 ?auto_4457 ) ) ( HAVE_IMAGE ?auto_4455 ?auto_4454 ) ( not ( = ?auto_4455 ?auto_4457 ) ) ( not ( = ?auto_4454 ?auto_4452 ) ) ( CALIBRATION_TARGET ?auto_4456 ?auto_4457 ) ( POWER_AVAIL ?auto_4458 ) ( HAVE_IMAGE ?auto_4450 ?auto_4451 ) ( not ( = ?auto_4450 ?auto_4457 ) ) ( not ( = ?auto_4451 ?auto_4452 ) ) ( not ( = ?auto_4451 ?auto_4454 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4455 ?auto_4454 ?auto_4453 ?auto_4452 )
      ( GET-3IMAGE-VERIFY ?auto_4450 ?auto_4451 ?auto_4453 ?auto_4452 ?auto_4455 ?auto_4454 ) )
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
      ?auto_4498 - SATELLITE
      ?auto_4497 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4493 ?auto_4490 ) ) ( not ( = ?auto_4495 ?auto_4490 ) ) ( not ( = ?auto_4495 ?auto_4493 ) ) ( ON_BOARD ?auto_4496 ?auto_4498 ) ( SUPPORTS ?auto_4496 ?auto_4491 ) ( POINTING ?auto_4498 ?auto_4497 ) ( not ( = ?auto_4490 ?auto_4497 ) ) ( HAVE_IMAGE ?auto_4493 ?auto_4492 ) ( not ( = ?auto_4493 ?auto_4497 ) ) ( not ( = ?auto_4492 ?auto_4491 ) ) ( CALIBRATION_TARGET ?auto_4496 ?auto_4497 ) ( POWER_AVAIL ?auto_4498 ) ( HAVE_IMAGE ?auto_4495 ?auto_4494 ) ( not ( = ?auto_4491 ?auto_4494 ) ) ( not ( = ?auto_4492 ?auto_4494 ) ) ( not ( = ?auto_4495 ?auto_4497 ) ) )
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
      ?auto_4516 - SATELLITE
      ?auto_4515 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4511 ?auto_4508 ) ) ( not ( = ?auto_4513 ?auto_4508 ) ) ( not ( = ?auto_4513 ?auto_4511 ) ) ( ON_BOARD ?auto_4514 ?auto_4516 ) ( SUPPORTS ?auto_4514 ?auto_4509 ) ( POINTING ?auto_4516 ?auto_4515 ) ( not ( = ?auto_4508 ?auto_4515 ) ) ( HAVE_IMAGE ?auto_4513 ?auto_4512 ) ( not ( = ?auto_4513 ?auto_4515 ) ) ( not ( = ?auto_4512 ?auto_4509 ) ) ( CALIBRATION_TARGET ?auto_4514 ?auto_4515 ) ( POWER_AVAIL ?auto_4516 ) ( HAVE_IMAGE ?auto_4511 ?auto_4510 ) ( not ( = ?auto_4509 ?auto_4510 ) ) ( not ( = ?auto_4511 ?auto_4515 ) ) ( not ( = ?auto_4510 ?auto_4512 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4513 ?auto_4512 ?auto_4508 ?auto_4509 )
      ( GET-3IMAGE-VERIFY ?auto_4508 ?auto_4509 ?auto_4511 ?auto_4510 ?auto_4513 ?auto_4512 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4570 - DIRECTION
      ?auto_4571 - MODE
    )
    :vars
    (
      ?auto_4576 - DIRECTION
      ?auto_4572 - INSTRUMENT
      ?auto_4574 - SATELLITE
      ?auto_4573 - DIRECTION
      ?auto_4575 - MODE
      ?auto_4577 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4570 ?auto_4576 ) ) ( ON_BOARD ?auto_4572 ?auto_4574 ) ( SUPPORTS ?auto_4572 ?auto_4571 ) ( not ( = ?auto_4570 ?auto_4573 ) ) ( HAVE_IMAGE ?auto_4576 ?auto_4575 ) ( not ( = ?auto_4576 ?auto_4573 ) ) ( not ( = ?auto_4575 ?auto_4571 ) ) ( CALIBRATION_TARGET ?auto_4572 ?auto_4573 ) ( POWER_AVAIL ?auto_4574 ) ( POINTING ?auto_4574 ?auto_4577 ) ( not ( = ?auto_4573 ?auto_4577 ) ) ( not ( = ?auto_4570 ?auto_4577 ) ) ( not ( = ?auto_4576 ?auto_4577 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_4574 ?auto_4573 ?auto_4577 )
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
      ?auto_4585 - INSTRUMENT
      ?auto_4583 - SATELLITE
      ?auto_4582 - DIRECTION
      ?auto_4584 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4581 ?auto_4578 ) ) ( ON_BOARD ?auto_4585 ?auto_4583 ) ( SUPPORTS ?auto_4585 ?auto_4580 ) ( not ( = ?auto_4581 ?auto_4582 ) ) ( HAVE_IMAGE ?auto_4578 ?auto_4579 ) ( not ( = ?auto_4578 ?auto_4582 ) ) ( not ( = ?auto_4579 ?auto_4580 ) ) ( CALIBRATION_TARGET ?auto_4585 ?auto_4582 ) ( POWER_AVAIL ?auto_4583 ) ( POINTING ?auto_4583 ?auto_4584 ) ( not ( = ?auto_4582 ?auto_4584 ) ) ( not ( = ?auto_4581 ?auto_4584 ) ) ( not ( = ?auto_4578 ?auto_4584 ) ) )
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
      ?auto_4594 - DIRECTION
      ?auto_4591 - INSTRUMENT
      ?auto_4590 - SATELLITE
      ?auto_4592 - DIRECTION
      ?auto_4593 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_4589 ?auto_4586 ) ) ( not ( = ?auto_4589 ?auto_4594 ) ) ( ON_BOARD ?auto_4591 ?auto_4590 ) ( SUPPORTS ?auto_4591 ?auto_4588 ) ( not ( = ?auto_4589 ?auto_4592 ) ) ( HAVE_IMAGE ?auto_4594 ?auto_4593 ) ( not ( = ?auto_4594 ?auto_4592 ) ) ( not ( = ?auto_4593 ?auto_4588 ) ) ( CALIBRATION_TARGET ?auto_4591 ?auto_4592 ) ( POWER_AVAIL ?auto_4590 ) ( POINTING ?auto_4590 ?auto_4586 ) ( not ( = ?auto_4592 ?auto_4586 ) ) ( not ( = ?auto_4594 ?auto_4586 ) ) ( HAVE_IMAGE ?auto_4586 ?auto_4587 ) ( not ( = ?auto_4587 ?auto_4588 ) ) ( not ( = ?auto_4587 ?auto_4593 ) ) )
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
      ?auto_4601 - INSTRUMENT
      ?auto_4600 - SATELLITE
      ?auto_4602 - DIRECTION
      ?auto_4599 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4598 ?auto_4595 ) ) ( ON_BOARD ?auto_4601 ?auto_4600 ) ( SUPPORTS ?auto_4601 ?auto_4596 ) ( not ( = ?auto_4595 ?auto_4602 ) ) ( HAVE_IMAGE ?auto_4598 ?auto_4597 ) ( not ( = ?auto_4598 ?auto_4602 ) ) ( not ( = ?auto_4597 ?auto_4596 ) ) ( CALIBRATION_TARGET ?auto_4601 ?auto_4602 ) ( POWER_AVAIL ?auto_4600 ) ( POINTING ?auto_4600 ?auto_4599 ) ( not ( = ?auto_4602 ?auto_4599 ) ) ( not ( = ?auto_4595 ?auto_4599 ) ) ( not ( = ?auto_4598 ?auto_4599 ) ) )
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
      ?auto_4611 - DIRECTION
      ?auto_4608 - INSTRUMENT
      ?auto_4607 - SATELLITE
      ?auto_4609 - DIRECTION
      ?auto_4610 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_4606 ?auto_4603 ) ) ( not ( = ?auto_4603 ?auto_4611 ) ) ( ON_BOARD ?auto_4608 ?auto_4607 ) ( SUPPORTS ?auto_4608 ?auto_4604 ) ( not ( = ?auto_4603 ?auto_4609 ) ) ( HAVE_IMAGE ?auto_4611 ?auto_4610 ) ( not ( = ?auto_4611 ?auto_4609 ) ) ( not ( = ?auto_4610 ?auto_4604 ) ) ( CALIBRATION_TARGET ?auto_4608 ?auto_4609 ) ( POWER_AVAIL ?auto_4607 ) ( POINTING ?auto_4607 ?auto_4606 ) ( not ( = ?auto_4609 ?auto_4606 ) ) ( not ( = ?auto_4611 ?auto_4606 ) ) ( HAVE_IMAGE ?auto_4606 ?auto_4605 ) ( not ( = ?auto_4604 ?auto_4605 ) ) ( not ( = ?auto_4605 ?auto_4610 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4611 ?auto_4610 ?auto_4603 ?auto_4604 )
      ( GET-2IMAGE-VERIFY ?auto_4603 ?auto_4604 ?auto_4606 ?auto_4605 ) )
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
      ?auto_4639 - INSTRUMENT
      ?auto_4638 - SATELLITE
      ?auto_4640 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4635 ?auto_4632 ) ) ( not ( = ?auto_4637 ?auto_4632 ) ) ( not ( = ?auto_4637 ?auto_4635 ) ) ( ON_BOARD ?auto_4639 ?auto_4638 ) ( SUPPORTS ?auto_4639 ?auto_4636 ) ( not ( = ?auto_4637 ?auto_4640 ) ) ( HAVE_IMAGE ?auto_4632 ?auto_4633 ) ( not ( = ?auto_4632 ?auto_4640 ) ) ( not ( = ?auto_4633 ?auto_4636 ) ) ( CALIBRATION_TARGET ?auto_4639 ?auto_4640 ) ( POWER_AVAIL ?auto_4638 ) ( POINTING ?auto_4638 ?auto_4635 ) ( not ( = ?auto_4640 ?auto_4635 ) ) ( HAVE_IMAGE ?auto_4635 ?auto_4634 ) ( not ( = ?auto_4633 ?auto_4634 ) ) ( not ( = ?auto_4634 ?auto_4636 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4632 ?auto_4633 ?auto_4637 ?auto_4636 )
      ( GET-3IMAGE-VERIFY ?auto_4632 ?auto_4633 ?auto_4635 ?auto_4634 ?auto_4637 ?auto_4636 ) )
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
      ?auto_4658 - INSTRUMENT
      ?auto_4657 - SATELLITE
      ?auto_4659 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4654 ?auto_4651 ) ) ( not ( = ?auto_4656 ?auto_4651 ) ) ( not ( = ?auto_4656 ?auto_4654 ) ) ( ON_BOARD ?auto_4658 ?auto_4657 ) ( SUPPORTS ?auto_4658 ?auto_4653 ) ( not ( = ?auto_4654 ?auto_4659 ) ) ( HAVE_IMAGE ?auto_4651 ?auto_4652 ) ( not ( = ?auto_4651 ?auto_4659 ) ) ( not ( = ?auto_4652 ?auto_4653 ) ) ( CALIBRATION_TARGET ?auto_4658 ?auto_4659 ) ( POWER_AVAIL ?auto_4657 ) ( POINTING ?auto_4657 ?auto_4656 ) ( not ( = ?auto_4659 ?auto_4656 ) ) ( HAVE_IMAGE ?auto_4656 ?auto_4655 ) ( not ( = ?auto_4652 ?auto_4655 ) ) ( not ( = ?auto_4653 ?auto_4655 ) ) )
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
      ?auto_4677 - INSTRUMENT
      ?auto_4676 - SATELLITE
      ?auto_4678 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4673 ?auto_4670 ) ) ( not ( = ?auto_4675 ?auto_4670 ) ) ( not ( = ?auto_4675 ?auto_4673 ) ) ( ON_BOARD ?auto_4677 ?auto_4676 ) ( SUPPORTS ?auto_4677 ?auto_4674 ) ( not ( = ?auto_4675 ?auto_4678 ) ) ( HAVE_IMAGE ?auto_4673 ?auto_4672 ) ( not ( = ?auto_4673 ?auto_4678 ) ) ( not ( = ?auto_4672 ?auto_4674 ) ) ( CALIBRATION_TARGET ?auto_4677 ?auto_4678 ) ( POWER_AVAIL ?auto_4676 ) ( POINTING ?auto_4676 ?auto_4670 ) ( not ( = ?auto_4678 ?auto_4670 ) ) ( HAVE_IMAGE ?auto_4670 ?auto_4671 ) ( not ( = ?auto_4671 ?auto_4672 ) ) ( not ( = ?auto_4671 ?auto_4674 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4673 ?auto_4672 ?auto_4675 ?auto_4674 )
      ( GET-3IMAGE-VERIFY ?auto_4670 ?auto_4671 ?auto_4673 ?auto_4672 ?auto_4675 ?auto_4674 ) )
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
      ?auto_4697 - INSTRUMENT
      ?auto_4696 - SATELLITE
      ?auto_4698 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4693 ?auto_4690 ) ) ( not ( = ?auto_4695 ?auto_4690 ) ) ( not ( = ?auto_4695 ?auto_4693 ) ) ( ON_BOARD ?auto_4697 ?auto_4696 ) ( SUPPORTS ?auto_4697 ?auto_4692 ) ( not ( = ?auto_4693 ?auto_4698 ) ) ( HAVE_IMAGE ?auto_4695 ?auto_4694 ) ( not ( = ?auto_4695 ?auto_4698 ) ) ( not ( = ?auto_4694 ?auto_4692 ) ) ( CALIBRATION_TARGET ?auto_4697 ?auto_4698 ) ( POWER_AVAIL ?auto_4696 ) ( POINTING ?auto_4696 ?auto_4690 ) ( not ( = ?auto_4698 ?auto_4690 ) ) ( HAVE_IMAGE ?auto_4690 ?auto_4691 ) ( not ( = ?auto_4691 ?auto_4692 ) ) ( not ( = ?auto_4691 ?auto_4694 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4695 ?auto_4694 ?auto_4693 ?auto_4692 )
      ( GET-3IMAGE-VERIFY ?auto_4690 ?auto_4691 ?auto_4693 ?auto_4692 ?auto_4695 ?auto_4694 ) )
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
      ?auto_4738 - INSTRUMENT
      ?auto_4737 - SATELLITE
      ?auto_4739 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4734 ?auto_4731 ) ) ( not ( = ?auto_4736 ?auto_4731 ) ) ( not ( = ?auto_4736 ?auto_4734 ) ) ( ON_BOARD ?auto_4738 ?auto_4737 ) ( SUPPORTS ?auto_4738 ?auto_4732 ) ( not ( = ?auto_4731 ?auto_4739 ) ) ( HAVE_IMAGE ?auto_4734 ?auto_4733 ) ( not ( = ?auto_4734 ?auto_4739 ) ) ( not ( = ?auto_4733 ?auto_4732 ) ) ( CALIBRATION_TARGET ?auto_4738 ?auto_4739 ) ( POWER_AVAIL ?auto_4737 ) ( POINTING ?auto_4737 ?auto_4736 ) ( not ( = ?auto_4739 ?auto_4736 ) ) ( HAVE_IMAGE ?auto_4736 ?auto_4735 ) ( not ( = ?auto_4732 ?auto_4735 ) ) ( not ( = ?auto_4733 ?auto_4735 ) ) )
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
      ?auto_4757 - INSTRUMENT
      ?auto_4756 - SATELLITE
      ?auto_4758 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4753 ?auto_4750 ) ) ( not ( = ?auto_4755 ?auto_4750 ) ) ( not ( = ?auto_4755 ?auto_4753 ) ) ( ON_BOARD ?auto_4757 ?auto_4756 ) ( SUPPORTS ?auto_4757 ?auto_4751 ) ( not ( = ?auto_4750 ?auto_4758 ) ) ( HAVE_IMAGE ?auto_4755 ?auto_4754 ) ( not ( = ?auto_4755 ?auto_4758 ) ) ( not ( = ?auto_4754 ?auto_4751 ) ) ( CALIBRATION_TARGET ?auto_4757 ?auto_4758 ) ( POWER_AVAIL ?auto_4756 ) ( POINTING ?auto_4756 ?auto_4753 ) ( not ( = ?auto_4758 ?auto_4753 ) ) ( HAVE_IMAGE ?auto_4753 ?auto_4752 ) ( not ( = ?auto_4751 ?auto_4752 ) ) ( not ( = ?auto_4752 ?auto_4754 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4755 ?auto_4754 ?auto_4750 ?auto_4751 )
      ( GET-3IMAGE-VERIFY ?auto_4750 ?auto_4751 ?auto_4753 ?auto_4752 ?auto_4755 ?auto_4754 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4814 - DIRECTION
      ?auto_4815 - MODE
    )
    :vars
    (
      ?auto_4821 - DIRECTION
      ?auto_4818 - INSTRUMENT
      ?auto_4817 - SATELLITE
      ?auto_4819 - DIRECTION
      ?auto_4820 - MODE
      ?auto_4816 - DIRECTION
      ?auto_4822 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4814 ?auto_4821 ) ) ( ON_BOARD ?auto_4818 ?auto_4817 ) ( SUPPORTS ?auto_4818 ?auto_4815 ) ( not ( = ?auto_4814 ?auto_4819 ) ) ( HAVE_IMAGE ?auto_4821 ?auto_4820 ) ( not ( = ?auto_4821 ?auto_4819 ) ) ( not ( = ?auto_4820 ?auto_4815 ) ) ( CALIBRATION_TARGET ?auto_4818 ?auto_4819 ) ( POINTING ?auto_4817 ?auto_4816 ) ( not ( = ?auto_4819 ?auto_4816 ) ) ( not ( = ?auto_4814 ?auto_4816 ) ) ( not ( = ?auto_4821 ?auto_4816 ) ) ( ON_BOARD ?auto_4822 ?auto_4817 ) ( POWER_ON ?auto_4822 ) ( not ( = ?auto_4818 ?auto_4822 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_4822 ?auto_4817 )
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
      ?auto_4828 - INSTRUMENT
      ?auto_4829 - SATELLITE
      ?auto_4827 - DIRECTION
      ?auto_4830 - DIRECTION
      ?auto_4831 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4826 ?auto_4823 ) ) ( ON_BOARD ?auto_4828 ?auto_4829 ) ( SUPPORTS ?auto_4828 ?auto_4825 ) ( not ( = ?auto_4826 ?auto_4827 ) ) ( HAVE_IMAGE ?auto_4823 ?auto_4824 ) ( not ( = ?auto_4823 ?auto_4827 ) ) ( not ( = ?auto_4824 ?auto_4825 ) ) ( CALIBRATION_TARGET ?auto_4828 ?auto_4827 ) ( POINTING ?auto_4829 ?auto_4830 ) ( not ( = ?auto_4827 ?auto_4830 ) ) ( not ( = ?auto_4826 ?auto_4830 ) ) ( not ( = ?auto_4823 ?auto_4830 ) ) ( ON_BOARD ?auto_4831 ?auto_4829 ) ( POWER_ON ?auto_4831 ) ( not ( = ?auto_4828 ?auto_4831 ) ) )
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
      ?auto_4841 - DIRECTION
      ?auto_4838 - INSTRUMENT
      ?auto_4836 - SATELLITE
      ?auto_4837 - DIRECTION
      ?auto_4840 - MODE
      ?auto_4839 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4835 ?auto_4832 ) ) ( not ( = ?auto_4835 ?auto_4841 ) ) ( ON_BOARD ?auto_4838 ?auto_4836 ) ( SUPPORTS ?auto_4838 ?auto_4834 ) ( not ( = ?auto_4835 ?auto_4837 ) ) ( HAVE_IMAGE ?auto_4841 ?auto_4840 ) ( not ( = ?auto_4841 ?auto_4837 ) ) ( not ( = ?auto_4840 ?auto_4834 ) ) ( CALIBRATION_TARGET ?auto_4838 ?auto_4837 ) ( POINTING ?auto_4836 ?auto_4832 ) ( not ( = ?auto_4837 ?auto_4832 ) ) ( not ( = ?auto_4841 ?auto_4832 ) ) ( ON_BOARD ?auto_4839 ?auto_4836 ) ( POWER_ON ?auto_4839 ) ( not ( = ?auto_4838 ?auto_4839 ) ) ( HAVE_IMAGE ?auto_4832 ?auto_4833 ) ( not ( = ?auto_4833 ?auto_4834 ) ) ( not ( = ?auto_4833 ?auto_4840 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4841 ?auto_4840 ?auto_4835 ?auto_4834 )
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
      ?auto_4848 - INSTRUMENT
      ?auto_4846 - SATELLITE
      ?auto_4847 - DIRECTION
      ?auto_4849 - DIRECTION
      ?auto_4850 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4845 ?auto_4842 ) ) ( ON_BOARD ?auto_4848 ?auto_4846 ) ( SUPPORTS ?auto_4848 ?auto_4843 ) ( not ( = ?auto_4842 ?auto_4847 ) ) ( HAVE_IMAGE ?auto_4845 ?auto_4844 ) ( not ( = ?auto_4845 ?auto_4847 ) ) ( not ( = ?auto_4844 ?auto_4843 ) ) ( CALIBRATION_TARGET ?auto_4848 ?auto_4847 ) ( POINTING ?auto_4846 ?auto_4849 ) ( not ( = ?auto_4847 ?auto_4849 ) ) ( not ( = ?auto_4842 ?auto_4849 ) ) ( not ( = ?auto_4845 ?auto_4849 ) ) ( ON_BOARD ?auto_4850 ?auto_4846 ) ( POWER_ON ?auto_4850 ) ( not ( = ?auto_4848 ?auto_4850 ) ) )
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
      ?auto_4860 - DIRECTION
      ?auto_4857 - INSTRUMENT
      ?auto_4855 - SATELLITE
      ?auto_4856 - DIRECTION
      ?auto_4859 - MODE
      ?auto_4858 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4854 ?auto_4851 ) ) ( not ( = ?auto_4851 ?auto_4860 ) ) ( ON_BOARD ?auto_4857 ?auto_4855 ) ( SUPPORTS ?auto_4857 ?auto_4852 ) ( not ( = ?auto_4851 ?auto_4856 ) ) ( HAVE_IMAGE ?auto_4860 ?auto_4859 ) ( not ( = ?auto_4860 ?auto_4856 ) ) ( not ( = ?auto_4859 ?auto_4852 ) ) ( CALIBRATION_TARGET ?auto_4857 ?auto_4856 ) ( POINTING ?auto_4855 ?auto_4854 ) ( not ( = ?auto_4856 ?auto_4854 ) ) ( not ( = ?auto_4860 ?auto_4854 ) ) ( ON_BOARD ?auto_4858 ?auto_4855 ) ( POWER_ON ?auto_4858 ) ( not ( = ?auto_4857 ?auto_4858 ) ) ( HAVE_IMAGE ?auto_4854 ?auto_4853 ) ( not ( = ?auto_4852 ?auto_4853 ) ) ( not ( = ?auto_4853 ?auto_4859 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4860 ?auto_4859 ?auto_4851 ?auto_4852 )
      ( GET-2IMAGE-VERIFY ?auto_4851 ?auto_4852 ?auto_4854 ?auto_4853 ) )
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
      ?auto_4891 - INSTRUMENT
      ?auto_4889 - SATELLITE
      ?auto_4890 - DIRECTION
      ?auto_4892 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4886 ?auto_4883 ) ) ( not ( = ?auto_4888 ?auto_4883 ) ) ( not ( = ?auto_4888 ?auto_4886 ) ) ( ON_BOARD ?auto_4891 ?auto_4889 ) ( SUPPORTS ?auto_4891 ?auto_4887 ) ( not ( = ?auto_4888 ?auto_4890 ) ) ( HAVE_IMAGE ?auto_4883 ?auto_4884 ) ( not ( = ?auto_4883 ?auto_4890 ) ) ( not ( = ?auto_4884 ?auto_4887 ) ) ( CALIBRATION_TARGET ?auto_4891 ?auto_4890 ) ( POINTING ?auto_4889 ?auto_4886 ) ( not ( = ?auto_4890 ?auto_4886 ) ) ( ON_BOARD ?auto_4892 ?auto_4889 ) ( POWER_ON ?auto_4892 ) ( not ( = ?auto_4891 ?auto_4892 ) ) ( HAVE_IMAGE ?auto_4886 ?auto_4885 ) ( not ( = ?auto_4884 ?auto_4885 ) ) ( not ( = ?auto_4885 ?auto_4887 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4883 ?auto_4884 ?auto_4888 ?auto_4887 )
      ( GET-3IMAGE-VERIFY ?auto_4883 ?auto_4884 ?auto_4886 ?auto_4885 ?auto_4888 ?auto_4887 ) )
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
      ?auto_4912 - INSTRUMENT
      ?auto_4910 - SATELLITE
      ?auto_4911 - DIRECTION
      ?auto_4913 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4907 ?auto_4904 ) ) ( not ( = ?auto_4909 ?auto_4904 ) ) ( not ( = ?auto_4909 ?auto_4907 ) ) ( ON_BOARD ?auto_4912 ?auto_4910 ) ( SUPPORTS ?auto_4912 ?auto_4906 ) ( not ( = ?auto_4907 ?auto_4911 ) ) ( HAVE_IMAGE ?auto_4904 ?auto_4905 ) ( not ( = ?auto_4904 ?auto_4911 ) ) ( not ( = ?auto_4905 ?auto_4906 ) ) ( CALIBRATION_TARGET ?auto_4912 ?auto_4911 ) ( POINTING ?auto_4910 ?auto_4909 ) ( not ( = ?auto_4911 ?auto_4909 ) ) ( ON_BOARD ?auto_4913 ?auto_4910 ) ( POWER_ON ?auto_4913 ) ( not ( = ?auto_4912 ?auto_4913 ) ) ( HAVE_IMAGE ?auto_4909 ?auto_4908 ) ( not ( = ?auto_4905 ?auto_4908 ) ) ( not ( = ?auto_4906 ?auto_4908 ) ) )
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
      ?auto_4933 - INSTRUMENT
      ?auto_4931 - SATELLITE
      ?auto_4932 - DIRECTION
      ?auto_4934 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4928 ?auto_4925 ) ) ( not ( = ?auto_4930 ?auto_4925 ) ) ( not ( = ?auto_4930 ?auto_4928 ) ) ( ON_BOARD ?auto_4933 ?auto_4931 ) ( SUPPORTS ?auto_4933 ?auto_4929 ) ( not ( = ?auto_4930 ?auto_4932 ) ) ( HAVE_IMAGE ?auto_4928 ?auto_4927 ) ( not ( = ?auto_4928 ?auto_4932 ) ) ( not ( = ?auto_4927 ?auto_4929 ) ) ( CALIBRATION_TARGET ?auto_4933 ?auto_4932 ) ( POINTING ?auto_4931 ?auto_4925 ) ( not ( = ?auto_4932 ?auto_4925 ) ) ( ON_BOARD ?auto_4934 ?auto_4931 ) ( POWER_ON ?auto_4934 ) ( not ( = ?auto_4933 ?auto_4934 ) ) ( HAVE_IMAGE ?auto_4925 ?auto_4926 ) ( not ( = ?auto_4926 ?auto_4927 ) ) ( not ( = ?auto_4926 ?auto_4929 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4928 ?auto_4927 ?auto_4930 ?auto_4929 )
      ( GET-3IMAGE-VERIFY ?auto_4925 ?auto_4926 ?auto_4928 ?auto_4927 ?auto_4930 ?auto_4929 ) )
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
      ?auto_4955 - INSTRUMENT
      ?auto_4953 - SATELLITE
      ?auto_4954 - DIRECTION
      ?auto_4956 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4950 ?auto_4947 ) ) ( not ( = ?auto_4952 ?auto_4947 ) ) ( not ( = ?auto_4952 ?auto_4950 ) ) ( ON_BOARD ?auto_4955 ?auto_4953 ) ( SUPPORTS ?auto_4955 ?auto_4949 ) ( not ( = ?auto_4950 ?auto_4954 ) ) ( HAVE_IMAGE ?auto_4952 ?auto_4951 ) ( not ( = ?auto_4952 ?auto_4954 ) ) ( not ( = ?auto_4951 ?auto_4949 ) ) ( CALIBRATION_TARGET ?auto_4955 ?auto_4954 ) ( POINTING ?auto_4953 ?auto_4947 ) ( not ( = ?auto_4954 ?auto_4947 ) ) ( ON_BOARD ?auto_4956 ?auto_4953 ) ( POWER_ON ?auto_4956 ) ( not ( = ?auto_4955 ?auto_4956 ) ) ( HAVE_IMAGE ?auto_4947 ?auto_4948 ) ( not ( = ?auto_4948 ?auto_4949 ) ) ( not ( = ?auto_4948 ?auto_4951 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4952 ?auto_4951 ?auto_4950 ?auto_4949 )
      ( GET-3IMAGE-VERIFY ?auto_4947 ?auto_4948 ?auto_4950 ?auto_4949 ?auto_4952 ?auto_4951 ) )
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
      ?auto_5000 - INSTRUMENT
      ?auto_4998 - SATELLITE
      ?auto_4999 - DIRECTION
      ?auto_5001 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4995 ?auto_4992 ) ) ( not ( = ?auto_4997 ?auto_4992 ) ) ( not ( = ?auto_4997 ?auto_4995 ) ) ( ON_BOARD ?auto_5000 ?auto_4998 ) ( SUPPORTS ?auto_5000 ?auto_4993 ) ( not ( = ?auto_4992 ?auto_4999 ) ) ( HAVE_IMAGE ?auto_4995 ?auto_4994 ) ( not ( = ?auto_4995 ?auto_4999 ) ) ( not ( = ?auto_4994 ?auto_4993 ) ) ( CALIBRATION_TARGET ?auto_5000 ?auto_4999 ) ( POINTING ?auto_4998 ?auto_4997 ) ( not ( = ?auto_4999 ?auto_4997 ) ) ( ON_BOARD ?auto_5001 ?auto_4998 ) ( POWER_ON ?auto_5001 ) ( not ( = ?auto_5000 ?auto_5001 ) ) ( HAVE_IMAGE ?auto_4997 ?auto_4996 ) ( not ( = ?auto_4993 ?auto_4996 ) ) ( not ( = ?auto_4994 ?auto_4996 ) ) )
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
      ?auto_5021 - INSTRUMENT
      ?auto_5019 - SATELLITE
      ?auto_5020 - DIRECTION
      ?auto_5022 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5016 ?auto_5013 ) ) ( not ( = ?auto_5018 ?auto_5013 ) ) ( not ( = ?auto_5018 ?auto_5016 ) ) ( ON_BOARD ?auto_5021 ?auto_5019 ) ( SUPPORTS ?auto_5021 ?auto_5014 ) ( not ( = ?auto_5013 ?auto_5020 ) ) ( HAVE_IMAGE ?auto_5018 ?auto_5017 ) ( not ( = ?auto_5018 ?auto_5020 ) ) ( not ( = ?auto_5017 ?auto_5014 ) ) ( CALIBRATION_TARGET ?auto_5021 ?auto_5020 ) ( POINTING ?auto_5019 ?auto_5016 ) ( not ( = ?auto_5020 ?auto_5016 ) ) ( ON_BOARD ?auto_5022 ?auto_5019 ) ( POWER_ON ?auto_5022 ) ( not ( = ?auto_5021 ?auto_5022 ) ) ( HAVE_IMAGE ?auto_5016 ?auto_5015 ) ( not ( = ?auto_5014 ?auto_5015 ) ) ( not ( = ?auto_5015 ?auto_5017 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5018 ?auto_5017 ?auto_5013 ?auto_5014 )
      ( GET-3IMAGE-VERIFY ?auto_5013 ?auto_5014 ?auto_5016 ?auto_5015 ?auto_5018 ?auto_5017 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_5083 - DIRECTION
      ?auto_5084 - MODE
    )
    :vars
    (
      ?auto_5091 - DIRECTION
      ?auto_5087 - INSTRUMENT
      ?auto_5085 - SATELLITE
      ?auto_5086 - DIRECTION
      ?auto_5090 - MODE
      ?auto_5088 - DIRECTION
      ?auto_5089 - INSTRUMENT
      ?auto_5092 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_5083 ?auto_5091 ) ) ( ON_BOARD ?auto_5087 ?auto_5085 ) ( SUPPORTS ?auto_5087 ?auto_5084 ) ( not ( = ?auto_5083 ?auto_5086 ) ) ( HAVE_IMAGE ?auto_5091 ?auto_5090 ) ( not ( = ?auto_5091 ?auto_5086 ) ) ( not ( = ?auto_5090 ?auto_5084 ) ) ( CALIBRATION_TARGET ?auto_5087 ?auto_5086 ) ( POINTING ?auto_5085 ?auto_5088 ) ( not ( = ?auto_5086 ?auto_5088 ) ) ( not ( = ?auto_5083 ?auto_5088 ) ) ( not ( = ?auto_5091 ?auto_5088 ) ) ( ON_BOARD ?auto_5089 ?auto_5085 ) ( POWER_ON ?auto_5089 ) ( not ( = ?auto_5087 ?auto_5089 ) ) ( CALIBRATED ?auto_5089 ) ( SUPPORTS ?auto_5089 ?auto_5092 ) ( not ( = ?auto_5090 ?auto_5092 ) ) ( not ( = ?auto_5084 ?auto_5092 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5091 ?auto_5090 ?auto_5088 ?auto_5092 )
      ( GET-2IMAGE ?auto_5091 ?auto_5090 ?auto_5083 ?auto_5084 )
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
      ?auto_5097 - SATELLITE
      ?auto_5098 - DIRECTION
      ?auto_5102 - DIRECTION
      ?auto_5101 - INSTRUMENT
      ?auto_5100 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_5096 ?auto_5093 ) ) ( ON_BOARD ?auto_5099 ?auto_5097 ) ( SUPPORTS ?auto_5099 ?auto_5095 ) ( not ( = ?auto_5096 ?auto_5098 ) ) ( HAVE_IMAGE ?auto_5093 ?auto_5094 ) ( not ( = ?auto_5093 ?auto_5098 ) ) ( not ( = ?auto_5094 ?auto_5095 ) ) ( CALIBRATION_TARGET ?auto_5099 ?auto_5098 ) ( POINTING ?auto_5097 ?auto_5102 ) ( not ( = ?auto_5098 ?auto_5102 ) ) ( not ( = ?auto_5096 ?auto_5102 ) ) ( not ( = ?auto_5093 ?auto_5102 ) ) ( ON_BOARD ?auto_5101 ?auto_5097 ) ( POWER_ON ?auto_5101 ) ( not ( = ?auto_5099 ?auto_5101 ) ) ( CALIBRATED ?auto_5101 ) ( SUPPORTS ?auto_5101 ?auto_5100 ) ( not ( = ?auto_5094 ?auto_5100 ) ) ( not ( = ?auto_5095 ?auto_5100 ) ) )
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
      ?auto_5112 - DIRECTION
      ?auto_5107 - INSTRUMENT
      ?auto_5110 - SATELLITE
      ?auto_5109 - DIRECTION
      ?auto_5111 - MODE
      ?auto_5108 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5106 ?auto_5103 ) ) ( not ( = ?auto_5106 ?auto_5112 ) ) ( ON_BOARD ?auto_5107 ?auto_5110 ) ( SUPPORTS ?auto_5107 ?auto_5105 ) ( not ( = ?auto_5106 ?auto_5109 ) ) ( HAVE_IMAGE ?auto_5112 ?auto_5111 ) ( not ( = ?auto_5112 ?auto_5109 ) ) ( not ( = ?auto_5111 ?auto_5105 ) ) ( CALIBRATION_TARGET ?auto_5107 ?auto_5109 ) ( POINTING ?auto_5110 ?auto_5103 ) ( not ( = ?auto_5109 ?auto_5103 ) ) ( not ( = ?auto_5112 ?auto_5103 ) ) ( ON_BOARD ?auto_5108 ?auto_5110 ) ( POWER_ON ?auto_5108 ) ( not ( = ?auto_5107 ?auto_5108 ) ) ( CALIBRATED ?auto_5108 ) ( SUPPORTS ?auto_5108 ?auto_5104 ) ( not ( = ?auto_5111 ?auto_5104 ) ) ( not ( = ?auto_5105 ?auto_5104 ) ) )
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
      ?auto_5121 - SATELLITE
      ?auto_5119 - DIRECTION
      ?auto_5120 - DIRECTION
      ?auto_5118 - INSTRUMENT
      ?auto_5122 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_5116 ?auto_5113 ) ) ( ON_BOARD ?auto_5117 ?auto_5121 ) ( SUPPORTS ?auto_5117 ?auto_5114 ) ( not ( = ?auto_5113 ?auto_5119 ) ) ( HAVE_IMAGE ?auto_5116 ?auto_5115 ) ( not ( = ?auto_5116 ?auto_5119 ) ) ( not ( = ?auto_5115 ?auto_5114 ) ) ( CALIBRATION_TARGET ?auto_5117 ?auto_5119 ) ( POINTING ?auto_5121 ?auto_5120 ) ( not ( = ?auto_5119 ?auto_5120 ) ) ( not ( = ?auto_5113 ?auto_5120 ) ) ( not ( = ?auto_5116 ?auto_5120 ) ) ( ON_BOARD ?auto_5118 ?auto_5121 ) ( POWER_ON ?auto_5118 ) ( not ( = ?auto_5117 ?auto_5118 ) ) ( CALIBRATED ?auto_5118 ) ( SUPPORTS ?auto_5118 ?auto_5122 ) ( not ( = ?auto_5115 ?auto_5122 ) ) ( not ( = ?auto_5114 ?auto_5122 ) ) )
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
      ?auto_5132 - DIRECTION
      ?auto_5127 - INSTRUMENT
      ?auto_5130 - SATELLITE
      ?auto_5129 - DIRECTION
      ?auto_5131 - MODE
      ?auto_5128 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5126 ?auto_5123 ) ) ( not ( = ?auto_5123 ?auto_5132 ) ) ( ON_BOARD ?auto_5127 ?auto_5130 ) ( SUPPORTS ?auto_5127 ?auto_5124 ) ( not ( = ?auto_5123 ?auto_5129 ) ) ( HAVE_IMAGE ?auto_5132 ?auto_5131 ) ( not ( = ?auto_5132 ?auto_5129 ) ) ( not ( = ?auto_5131 ?auto_5124 ) ) ( CALIBRATION_TARGET ?auto_5127 ?auto_5129 ) ( POINTING ?auto_5130 ?auto_5126 ) ( not ( = ?auto_5129 ?auto_5126 ) ) ( not ( = ?auto_5132 ?auto_5126 ) ) ( ON_BOARD ?auto_5128 ?auto_5130 ) ( POWER_ON ?auto_5128 ) ( not ( = ?auto_5127 ?auto_5128 ) ) ( CALIBRATED ?auto_5128 ) ( SUPPORTS ?auto_5128 ?auto_5125 ) ( not ( = ?auto_5131 ?auto_5125 ) ) ( not ( = ?auto_5124 ?auto_5125 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5132 ?auto_5131 ?auto_5123 ?auto_5124 )
      ( GET-2IMAGE-VERIFY ?auto_5123 ?auto_5124 ?auto_5126 ?auto_5125 ) )
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
      ?auto_5166 - SATELLITE
      ?auto_5165 - DIRECTION
      ?auto_5164 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5160 ?auto_5157 ) ) ( not ( = ?auto_5162 ?auto_5157 ) ) ( not ( = ?auto_5162 ?auto_5160 ) ) ( ON_BOARD ?auto_5163 ?auto_5166 ) ( SUPPORTS ?auto_5163 ?auto_5161 ) ( not ( = ?auto_5162 ?auto_5165 ) ) ( HAVE_IMAGE ?auto_5157 ?auto_5158 ) ( not ( = ?auto_5157 ?auto_5165 ) ) ( not ( = ?auto_5158 ?auto_5161 ) ) ( CALIBRATION_TARGET ?auto_5163 ?auto_5165 ) ( POINTING ?auto_5166 ?auto_5160 ) ( not ( = ?auto_5165 ?auto_5160 ) ) ( ON_BOARD ?auto_5164 ?auto_5166 ) ( POWER_ON ?auto_5164 ) ( not ( = ?auto_5163 ?auto_5164 ) ) ( CALIBRATED ?auto_5164 ) ( SUPPORTS ?auto_5164 ?auto_5159 ) ( not ( = ?auto_5158 ?auto_5159 ) ) ( not ( = ?auto_5161 ?auto_5159 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5157 ?auto_5158 ?auto_5162 ?auto_5161 )
      ( GET-3IMAGE-VERIFY ?auto_5157 ?auto_5158 ?auto_5160 ?auto_5159 ?auto_5162 ?auto_5161 ) )
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
      ?auto_5188 - SATELLITE
      ?auto_5187 - DIRECTION
      ?auto_5186 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5182 ?auto_5179 ) ) ( not ( = ?auto_5184 ?auto_5179 ) ) ( not ( = ?auto_5184 ?auto_5182 ) ) ( ON_BOARD ?auto_5185 ?auto_5188 ) ( SUPPORTS ?auto_5185 ?auto_5181 ) ( not ( = ?auto_5182 ?auto_5187 ) ) ( HAVE_IMAGE ?auto_5179 ?auto_5180 ) ( not ( = ?auto_5179 ?auto_5187 ) ) ( not ( = ?auto_5180 ?auto_5181 ) ) ( CALIBRATION_TARGET ?auto_5185 ?auto_5187 ) ( POINTING ?auto_5188 ?auto_5184 ) ( not ( = ?auto_5187 ?auto_5184 ) ) ( ON_BOARD ?auto_5186 ?auto_5188 ) ( POWER_ON ?auto_5186 ) ( not ( = ?auto_5185 ?auto_5186 ) ) ( CALIBRATED ?auto_5186 ) ( SUPPORTS ?auto_5186 ?auto_5183 ) ( not ( = ?auto_5180 ?auto_5183 ) ) ( not ( = ?auto_5181 ?auto_5183 ) ) )
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
      ?auto_5210 - SATELLITE
      ?auto_5209 - DIRECTION
      ?auto_5208 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5204 ?auto_5201 ) ) ( not ( = ?auto_5206 ?auto_5201 ) ) ( not ( = ?auto_5206 ?auto_5204 ) ) ( ON_BOARD ?auto_5207 ?auto_5210 ) ( SUPPORTS ?auto_5207 ?auto_5205 ) ( not ( = ?auto_5206 ?auto_5209 ) ) ( HAVE_IMAGE ?auto_5204 ?auto_5203 ) ( not ( = ?auto_5204 ?auto_5209 ) ) ( not ( = ?auto_5203 ?auto_5205 ) ) ( CALIBRATION_TARGET ?auto_5207 ?auto_5209 ) ( POINTING ?auto_5210 ?auto_5201 ) ( not ( = ?auto_5209 ?auto_5201 ) ) ( ON_BOARD ?auto_5208 ?auto_5210 ) ( POWER_ON ?auto_5208 ) ( not ( = ?auto_5207 ?auto_5208 ) ) ( CALIBRATED ?auto_5208 ) ( SUPPORTS ?auto_5208 ?auto_5202 ) ( not ( = ?auto_5203 ?auto_5202 ) ) ( not ( = ?auto_5205 ?auto_5202 ) ) )
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
      ?auto_5232 - SATELLITE
      ?auto_5231 - DIRECTION
      ?auto_5230 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5226 ?auto_5223 ) ) ( not ( = ?auto_5228 ?auto_5223 ) ) ( not ( = ?auto_5228 ?auto_5226 ) ) ( ON_BOARD ?auto_5229 ?auto_5232 ) ( SUPPORTS ?auto_5229 ?auto_5225 ) ( not ( = ?auto_5226 ?auto_5231 ) ) ( HAVE_IMAGE ?auto_5228 ?auto_5227 ) ( not ( = ?auto_5228 ?auto_5231 ) ) ( not ( = ?auto_5227 ?auto_5225 ) ) ( CALIBRATION_TARGET ?auto_5229 ?auto_5231 ) ( POINTING ?auto_5232 ?auto_5223 ) ( not ( = ?auto_5231 ?auto_5223 ) ) ( ON_BOARD ?auto_5230 ?auto_5232 ) ( POWER_ON ?auto_5230 ) ( not ( = ?auto_5229 ?auto_5230 ) ) ( CALIBRATED ?auto_5230 ) ( SUPPORTS ?auto_5230 ?auto_5224 ) ( not ( = ?auto_5227 ?auto_5224 ) ) ( not ( = ?auto_5225 ?auto_5224 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5228 ?auto_5227 ?auto_5226 ?auto_5225 )
      ( GET-3IMAGE-VERIFY ?auto_5223 ?auto_5224 ?auto_5226 ?auto_5225 ?auto_5228 ?auto_5227 ) )
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
      ?auto_5278 - SATELLITE
      ?auto_5277 - DIRECTION
      ?auto_5276 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5272 ?auto_5269 ) ) ( not ( = ?auto_5274 ?auto_5269 ) ) ( not ( = ?auto_5274 ?auto_5272 ) ) ( ON_BOARD ?auto_5275 ?auto_5278 ) ( SUPPORTS ?auto_5275 ?auto_5270 ) ( not ( = ?auto_5269 ?auto_5277 ) ) ( HAVE_IMAGE ?auto_5272 ?auto_5271 ) ( not ( = ?auto_5272 ?auto_5277 ) ) ( not ( = ?auto_5271 ?auto_5270 ) ) ( CALIBRATION_TARGET ?auto_5275 ?auto_5277 ) ( POINTING ?auto_5278 ?auto_5274 ) ( not ( = ?auto_5277 ?auto_5274 ) ) ( ON_BOARD ?auto_5276 ?auto_5278 ) ( POWER_ON ?auto_5276 ) ( not ( = ?auto_5275 ?auto_5276 ) ) ( CALIBRATED ?auto_5276 ) ( SUPPORTS ?auto_5276 ?auto_5273 ) ( not ( = ?auto_5271 ?auto_5273 ) ) ( not ( = ?auto_5270 ?auto_5273 ) ) )
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
      ?auto_5300 - SATELLITE
      ?auto_5299 - DIRECTION
      ?auto_5298 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5294 ?auto_5291 ) ) ( not ( = ?auto_5296 ?auto_5291 ) ) ( not ( = ?auto_5296 ?auto_5294 ) ) ( ON_BOARD ?auto_5297 ?auto_5300 ) ( SUPPORTS ?auto_5297 ?auto_5292 ) ( not ( = ?auto_5291 ?auto_5299 ) ) ( HAVE_IMAGE ?auto_5296 ?auto_5295 ) ( not ( = ?auto_5296 ?auto_5299 ) ) ( not ( = ?auto_5295 ?auto_5292 ) ) ( CALIBRATION_TARGET ?auto_5297 ?auto_5299 ) ( POINTING ?auto_5300 ?auto_5294 ) ( not ( = ?auto_5299 ?auto_5294 ) ) ( ON_BOARD ?auto_5298 ?auto_5300 ) ( POWER_ON ?auto_5298 ) ( not ( = ?auto_5297 ?auto_5298 ) ) ( CALIBRATED ?auto_5298 ) ( SUPPORTS ?auto_5298 ?auto_5293 ) ( not ( = ?auto_5295 ?auto_5293 ) ) ( not ( = ?auto_5292 ?auto_5293 ) ) )
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
      ?auto_5372 - DIRECTION
      ?auto_5365 - INSTRUMENT
      ?auto_5369 - SATELLITE
      ?auto_5367 - DIRECTION
      ?auto_5371 - MODE
      ?auto_5368 - DIRECTION
      ?auto_5366 - INSTRUMENT
      ?auto_5370 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_5363 ?auto_5372 ) ) ( ON_BOARD ?auto_5365 ?auto_5369 ) ( SUPPORTS ?auto_5365 ?auto_5364 ) ( not ( = ?auto_5363 ?auto_5367 ) ) ( HAVE_IMAGE ?auto_5372 ?auto_5371 ) ( not ( = ?auto_5372 ?auto_5367 ) ) ( not ( = ?auto_5371 ?auto_5364 ) ) ( CALIBRATION_TARGET ?auto_5365 ?auto_5367 ) ( not ( = ?auto_5367 ?auto_5368 ) ) ( not ( = ?auto_5363 ?auto_5368 ) ) ( not ( = ?auto_5372 ?auto_5368 ) ) ( ON_BOARD ?auto_5366 ?auto_5369 ) ( POWER_ON ?auto_5366 ) ( not ( = ?auto_5365 ?auto_5366 ) ) ( CALIBRATED ?auto_5366 ) ( SUPPORTS ?auto_5366 ?auto_5370 ) ( not ( = ?auto_5371 ?auto_5370 ) ) ( not ( = ?auto_5364 ?auto_5370 ) ) ( POINTING ?auto_5369 ?auto_5367 ) )
    :subtasks
    ( ( !TURN_TO ?auto_5369 ?auto_5368 ?auto_5367 )
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
      ?auto_5380 - INSTRUMENT
      ?auto_5382 - SATELLITE
      ?auto_5379 - DIRECTION
      ?auto_5381 - DIRECTION
      ?auto_5377 - INSTRUMENT
      ?auto_5378 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_5376 ?auto_5373 ) ) ( ON_BOARD ?auto_5380 ?auto_5382 ) ( SUPPORTS ?auto_5380 ?auto_5375 ) ( not ( = ?auto_5376 ?auto_5379 ) ) ( HAVE_IMAGE ?auto_5373 ?auto_5374 ) ( not ( = ?auto_5373 ?auto_5379 ) ) ( not ( = ?auto_5374 ?auto_5375 ) ) ( CALIBRATION_TARGET ?auto_5380 ?auto_5379 ) ( not ( = ?auto_5379 ?auto_5381 ) ) ( not ( = ?auto_5376 ?auto_5381 ) ) ( not ( = ?auto_5373 ?auto_5381 ) ) ( ON_BOARD ?auto_5377 ?auto_5382 ) ( POWER_ON ?auto_5377 ) ( not ( = ?auto_5380 ?auto_5377 ) ) ( CALIBRATED ?auto_5377 ) ( SUPPORTS ?auto_5377 ?auto_5378 ) ( not ( = ?auto_5374 ?auto_5378 ) ) ( not ( = ?auto_5375 ?auto_5378 ) ) ( POINTING ?auto_5382 ?auto_5379 ) )
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
      ?auto_5392 - DIRECTION
      ?auto_5388 - INSTRUMENT
      ?auto_5390 - SATELLITE
      ?auto_5389 - DIRECTION
      ?auto_5391 - MODE
      ?auto_5387 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5386 ?auto_5383 ) ) ( not ( = ?auto_5386 ?auto_5392 ) ) ( ON_BOARD ?auto_5388 ?auto_5390 ) ( SUPPORTS ?auto_5388 ?auto_5385 ) ( not ( = ?auto_5386 ?auto_5389 ) ) ( HAVE_IMAGE ?auto_5392 ?auto_5391 ) ( not ( = ?auto_5392 ?auto_5389 ) ) ( not ( = ?auto_5391 ?auto_5385 ) ) ( CALIBRATION_TARGET ?auto_5388 ?auto_5389 ) ( not ( = ?auto_5389 ?auto_5383 ) ) ( not ( = ?auto_5392 ?auto_5383 ) ) ( ON_BOARD ?auto_5387 ?auto_5390 ) ( POWER_ON ?auto_5387 ) ( not ( = ?auto_5388 ?auto_5387 ) ) ( CALIBRATED ?auto_5387 ) ( SUPPORTS ?auto_5387 ?auto_5384 ) ( not ( = ?auto_5391 ?auto_5384 ) ) ( not ( = ?auto_5385 ?auto_5384 ) ) ( POINTING ?auto_5390 ?auto_5389 ) )
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
      ?auto_5401 - DIRECTION
      ?auto_5397 - INSTRUMENT
      ?auto_5399 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_5396 ?auto_5393 ) ) ( ON_BOARD ?auto_5398 ?auto_5402 ) ( SUPPORTS ?auto_5398 ?auto_5394 ) ( not ( = ?auto_5393 ?auto_5400 ) ) ( HAVE_IMAGE ?auto_5396 ?auto_5395 ) ( not ( = ?auto_5396 ?auto_5400 ) ) ( not ( = ?auto_5395 ?auto_5394 ) ) ( CALIBRATION_TARGET ?auto_5398 ?auto_5400 ) ( not ( = ?auto_5400 ?auto_5401 ) ) ( not ( = ?auto_5393 ?auto_5401 ) ) ( not ( = ?auto_5396 ?auto_5401 ) ) ( ON_BOARD ?auto_5397 ?auto_5402 ) ( POWER_ON ?auto_5397 ) ( not ( = ?auto_5398 ?auto_5397 ) ) ( CALIBRATED ?auto_5397 ) ( SUPPORTS ?auto_5397 ?auto_5399 ) ( not ( = ?auto_5395 ?auto_5399 ) ) ( not ( = ?auto_5394 ?auto_5399 ) ) ( POINTING ?auto_5402 ?auto_5400 ) )
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
      ?auto_5412 - DIRECTION
      ?auto_5408 - INSTRUMENT
      ?auto_5410 - SATELLITE
      ?auto_5409 - DIRECTION
      ?auto_5411 - MODE
      ?auto_5407 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5406 ?auto_5403 ) ) ( not ( = ?auto_5403 ?auto_5412 ) ) ( ON_BOARD ?auto_5408 ?auto_5410 ) ( SUPPORTS ?auto_5408 ?auto_5404 ) ( not ( = ?auto_5403 ?auto_5409 ) ) ( HAVE_IMAGE ?auto_5412 ?auto_5411 ) ( not ( = ?auto_5412 ?auto_5409 ) ) ( not ( = ?auto_5411 ?auto_5404 ) ) ( CALIBRATION_TARGET ?auto_5408 ?auto_5409 ) ( not ( = ?auto_5409 ?auto_5406 ) ) ( not ( = ?auto_5412 ?auto_5406 ) ) ( ON_BOARD ?auto_5407 ?auto_5410 ) ( POWER_ON ?auto_5407 ) ( not ( = ?auto_5408 ?auto_5407 ) ) ( CALIBRATED ?auto_5407 ) ( SUPPORTS ?auto_5407 ?auto_5405 ) ( not ( = ?auto_5411 ?auto_5405 ) ) ( not ( = ?auto_5404 ?auto_5405 ) ) ( POINTING ?auto_5410 ?auto_5409 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5412 ?auto_5411 ?auto_5403 ?auto_5404 )
      ( GET-2IMAGE-VERIFY ?auto_5403 ?auto_5404 ?auto_5406 ?auto_5405 ) )
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
    ( and ( not ( = ?auto_5440 ?auto_5437 ) ) ( not ( = ?auto_5442 ?auto_5437 ) ) ( not ( = ?auto_5442 ?auto_5440 ) ) ( ON_BOARD ?auto_5444 ?auto_5446 ) ( SUPPORTS ?auto_5444 ?auto_5441 ) ( not ( = ?auto_5442 ?auto_5445 ) ) ( HAVE_IMAGE ?auto_5437 ?auto_5438 ) ( not ( = ?auto_5437 ?auto_5445 ) ) ( not ( = ?auto_5438 ?auto_5441 ) ) ( CALIBRATION_TARGET ?auto_5444 ?auto_5445 ) ( not ( = ?auto_5445 ?auto_5440 ) ) ( ON_BOARD ?auto_5443 ?auto_5446 ) ( POWER_ON ?auto_5443 ) ( not ( = ?auto_5444 ?auto_5443 ) ) ( CALIBRATED ?auto_5443 ) ( SUPPORTS ?auto_5443 ?auto_5439 ) ( not ( = ?auto_5438 ?auto_5439 ) ) ( not ( = ?auto_5441 ?auto_5439 ) ) ( POINTING ?auto_5446 ?auto_5445 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5437 ?auto_5438 ?auto_5442 ?auto_5441 )
      ( GET-3IMAGE-VERIFY ?auto_5437 ?auto_5438 ?auto_5440 ?auto_5439 ?auto_5442 ?auto_5441 ) )
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
    ( and ( not ( = ?auto_5462 ?auto_5459 ) ) ( not ( = ?auto_5464 ?auto_5459 ) ) ( not ( = ?auto_5464 ?auto_5462 ) ) ( ON_BOARD ?auto_5466 ?auto_5468 ) ( SUPPORTS ?auto_5466 ?auto_5461 ) ( not ( = ?auto_5462 ?auto_5467 ) ) ( HAVE_IMAGE ?auto_5459 ?auto_5460 ) ( not ( = ?auto_5459 ?auto_5467 ) ) ( not ( = ?auto_5460 ?auto_5461 ) ) ( CALIBRATION_TARGET ?auto_5466 ?auto_5467 ) ( not ( = ?auto_5467 ?auto_5464 ) ) ( ON_BOARD ?auto_5465 ?auto_5468 ) ( POWER_ON ?auto_5465 ) ( not ( = ?auto_5466 ?auto_5465 ) ) ( CALIBRATED ?auto_5465 ) ( SUPPORTS ?auto_5465 ?auto_5463 ) ( not ( = ?auto_5460 ?auto_5463 ) ) ( not ( = ?auto_5461 ?auto_5463 ) ) ( POINTING ?auto_5468 ?auto_5467 ) )
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
    ( and ( not ( = ?auto_5484 ?auto_5481 ) ) ( not ( = ?auto_5486 ?auto_5481 ) ) ( not ( = ?auto_5486 ?auto_5484 ) ) ( ON_BOARD ?auto_5488 ?auto_5490 ) ( SUPPORTS ?auto_5488 ?auto_5485 ) ( not ( = ?auto_5486 ?auto_5489 ) ) ( HAVE_IMAGE ?auto_5484 ?auto_5483 ) ( not ( = ?auto_5484 ?auto_5489 ) ) ( not ( = ?auto_5483 ?auto_5485 ) ) ( CALIBRATION_TARGET ?auto_5488 ?auto_5489 ) ( not ( = ?auto_5489 ?auto_5481 ) ) ( ON_BOARD ?auto_5487 ?auto_5490 ) ( POWER_ON ?auto_5487 ) ( not ( = ?auto_5488 ?auto_5487 ) ) ( CALIBRATED ?auto_5487 ) ( SUPPORTS ?auto_5487 ?auto_5482 ) ( not ( = ?auto_5483 ?auto_5482 ) ) ( not ( = ?auto_5485 ?auto_5482 ) ) ( POINTING ?auto_5490 ?auto_5489 ) )
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
    ( and ( not ( = ?auto_5506 ?auto_5503 ) ) ( not ( = ?auto_5508 ?auto_5503 ) ) ( not ( = ?auto_5508 ?auto_5506 ) ) ( ON_BOARD ?auto_5510 ?auto_5512 ) ( SUPPORTS ?auto_5510 ?auto_5505 ) ( not ( = ?auto_5506 ?auto_5511 ) ) ( HAVE_IMAGE ?auto_5508 ?auto_5507 ) ( not ( = ?auto_5508 ?auto_5511 ) ) ( not ( = ?auto_5507 ?auto_5505 ) ) ( CALIBRATION_TARGET ?auto_5510 ?auto_5511 ) ( not ( = ?auto_5511 ?auto_5503 ) ) ( ON_BOARD ?auto_5509 ?auto_5512 ) ( POWER_ON ?auto_5509 ) ( not ( = ?auto_5510 ?auto_5509 ) ) ( CALIBRATED ?auto_5509 ) ( SUPPORTS ?auto_5509 ?auto_5504 ) ( not ( = ?auto_5507 ?auto_5504 ) ) ( not ( = ?auto_5505 ?auto_5504 ) ) ( POINTING ?auto_5512 ?auto_5511 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5508 ?auto_5507 ?auto_5506 ?auto_5505 )
      ( GET-3IMAGE-VERIFY ?auto_5503 ?auto_5504 ?auto_5506 ?auto_5505 ?auto_5508 ?auto_5507 ) )
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
    ( and ( not ( = ?auto_5552 ?auto_5549 ) ) ( not ( = ?auto_5554 ?auto_5549 ) ) ( not ( = ?auto_5554 ?auto_5552 ) ) ( ON_BOARD ?auto_5556 ?auto_5558 ) ( SUPPORTS ?auto_5556 ?auto_5550 ) ( not ( = ?auto_5549 ?auto_5557 ) ) ( HAVE_IMAGE ?auto_5552 ?auto_5551 ) ( not ( = ?auto_5552 ?auto_5557 ) ) ( not ( = ?auto_5551 ?auto_5550 ) ) ( CALIBRATION_TARGET ?auto_5556 ?auto_5557 ) ( not ( = ?auto_5557 ?auto_5554 ) ) ( ON_BOARD ?auto_5555 ?auto_5558 ) ( POWER_ON ?auto_5555 ) ( not ( = ?auto_5556 ?auto_5555 ) ) ( CALIBRATED ?auto_5555 ) ( SUPPORTS ?auto_5555 ?auto_5553 ) ( not ( = ?auto_5551 ?auto_5553 ) ) ( not ( = ?auto_5550 ?auto_5553 ) ) ( POINTING ?auto_5558 ?auto_5557 ) )
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
    ( and ( not ( = ?auto_5574 ?auto_5571 ) ) ( not ( = ?auto_5576 ?auto_5571 ) ) ( not ( = ?auto_5576 ?auto_5574 ) ) ( ON_BOARD ?auto_5578 ?auto_5580 ) ( SUPPORTS ?auto_5578 ?auto_5572 ) ( not ( = ?auto_5571 ?auto_5579 ) ) ( HAVE_IMAGE ?auto_5576 ?auto_5575 ) ( not ( = ?auto_5576 ?auto_5579 ) ) ( not ( = ?auto_5575 ?auto_5572 ) ) ( CALIBRATION_TARGET ?auto_5578 ?auto_5579 ) ( not ( = ?auto_5579 ?auto_5574 ) ) ( ON_BOARD ?auto_5577 ?auto_5580 ) ( POWER_ON ?auto_5577 ) ( not ( = ?auto_5578 ?auto_5577 ) ) ( CALIBRATED ?auto_5577 ) ( SUPPORTS ?auto_5577 ?auto_5573 ) ( not ( = ?auto_5575 ?auto_5573 ) ) ( not ( = ?auto_5572 ?auto_5573 ) ) ( POINTING ?auto_5580 ?auto_5579 ) )
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
      ?auto_5652 - DIRECTION
      ?auto_5646 - INSTRUMENT
      ?auto_5650 - SATELLITE
      ?auto_5648 - DIRECTION
      ?auto_5651 - MODE
      ?auto_5649 - DIRECTION
      ?auto_5645 - INSTRUMENT
      ?auto_5647 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_5643 ?auto_5652 ) ) ( ON_BOARD ?auto_5646 ?auto_5650 ) ( SUPPORTS ?auto_5646 ?auto_5644 ) ( not ( = ?auto_5643 ?auto_5648 ) ) ( HAVE_IMAGE ?auto_5652 ?auto_5651 ) ( not ( = ?auto_5652 ?auto_5648 ) ) ( not ( = ?auto_5651 ?auto_5644 ) ) ( CALIBRATION_TARGET ?auto_5646 ?auto_5648 ) ( not ( = ?auto_5648 ?auto_5649 ) ) ( not ( = ?auto_5643 ?auto_5649 ) ) ( not ( = ?auto_5652 ?auto_5649 ) ) ( ON_BOARD ?auto_5645 ?auto_5650 ) ( POWER_ON ?auto_5645 ) ( not ( = ?auto_5646 ?auto_5645 ) ) ( SUPPORTS ?auto_5645 ?auto_5647 ) ( not ( = ?auto_5651 ?auto_5647 ) ) ( not ( = ?auto_5644 ?auto_5647 ) ) ( POINTING ?auto_5650 ?auto_5648 ) ( CALIBRATION_TARGET ?auto_5645 ?auto_5648 ) ( NOT_CALIBRATED ?auto_5645 ) )
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
      ?auto_5660 - SATELLITE
      ?auto_5657 - DIRECTION
      ?auto_5659 - DIRECTION
      ?auto_5658 - INSTRUMENT
      ?auto_5662 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_5656 ?auto_5653 ) ) ( ON_BOARD ?auto_5661 ?auto_5660 ) ( SUPPORTS ?auto_5661 ?auto_5655 ) ( not ( = ?auto_5656 ?auto_5657 ) ) ( HAVE_IMAGE ?auto_5653 ?auto_5654 ) ( not ( = ?auto_5653 ?auto_5657 ) ) ( not ( = ?auto_5654 ?auto_5655 ) ) ( CALIBRATION_TARGET ?auto_5661 ?auto_5657 ) ( not ( = ?auto_5657 ?auto_5659 ) ) ( not ( = ?auto_5656 ?auto_5659 ) ) ( not ( = ?auto_5653 ?auto_5659 ) ) ( ON_BOARD ?auto_5658 ?auto_5660 ) ( POWER_ON ?auto_5658 ) ( not ( = ?auto_5661 ?auto_5658 ) ) ( SUPPORTS ?auto_5658 ?auto_5662 ) ( not ( = ?auto_5654 ?auto_5662 ) ) ( not ( = ?auto_5655 ?auto_5662 ) ) ( POINTING ?auto_5660 ?auto_5657 ) ( CALIBRATION_TARGET ?auto_5658 ?auto_5657 ) ( NOT_CALIBRATED ?auto_5658 ) )
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
      ?auto_5672 - DIRECTION
      ?auto_5667 - INSTRUMENT
      ?auto_5670 - SATELLITE
      ?auto_5668 - DIRECTION
      ?auto_5671 - MODE
      ?auto_5669 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5666 ?auto_5663 ) ) ( not ( = ?auto_5666 ?auto_5672 ) ) ( ON_BOARD ?auto_5667 ?auto_5670 ) ( SUPPORTS ?auto_5667 ?auto_5665 ) ( not ( = ?auto_5666 ?auto_5668 ) ) ( HAVE_IMAGE ?auto_5672 ?auto_5671 ) ( not ( = ?auto_5672 ?auto_5668 ) ) ( not ( = ?auto_5671 ?auto_5665 ) ) ( CALIBRATION_TARGET ?auto_5667 ?auto_5668 ) ( not ( = ?auto_5668 ?auto_5663 ) ) ( not ( = ?auto_5672 ?auto_5663 ) ) ( ON_BOARD ?auto_5669 ?auto_5670 ) ( POWER_ON ?auto_5669 ) ( not ( = ?auto_5667 ?auto_5669 ) ) ( SUPPORTS ?auto_5669 ?auto_5664 ) ( not ( = ?auto_5671 ?auto_5664 ) ) ( not ( = ?auto_5665 ?auto_5664 ) ) ( POINTING ?auto_5670 ?auto_5668 ) ( CALIBRATION_TARGET ?auto_5669 ?auto_5668 ) ( NOT_CALIBRATED ?auto_5669 ) )
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
      ?auto_5677 - INSTRUMENT
      ?auto_5682 - SATELLITE
      ?auto_5680 - DIRECTION
      ?auto_5679 - DIRECTION
      ?auto_5681 - INSTRUMENT
      ?auto_5678 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_5676 ?auto_5673 ) ) ( ON_BOARD ?auto_5677 ?auto_5682 ) ( SUPPORTS ?auto_5677 ?auto_5674 ) ( not ( = ?auto_5673 ?auto_5680 ) ) ( HAVE_IMAGE ?auto_5676 ?auto_5675 ) ( not ( = ?auto_5676 ?auto_5680 ) ) ( not ( = ?auto_5675 ?auto_5674 ) ) ( CALIBRATION_TARGET ?auto_5677 ?auto_5680 ) ( not ( = ?auto_5680 ?auto_5679 ) ) ( not ( = ?auto_5673 ?auto_5679 ) ) ( not ( = ?auto_5676 ?auto_5679 ) ) ( ON_BOARD ?auto_5681 ?auto_5682 ) ( POWER_ON ?auto_5681 ) ( not ( = ?auto_5677 ?auto_5681 ) ) ( SUPPORTS ?auto_5681 ?auto_5678 ) ( not ( = ?auto_5675 ?auto_5678 ) ) ( not ( = ?auto_5674 ?auto_5678 ) ) ( POINTING ?auto_5682 ?auto_5680 ) ( CALIBRATION_TARGET ?auto_5681 ?auto_5680 ) ( NOT_CALIBRATED ?auto_5681 ) )
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
      ?auto_5692 - DIRECTION
      ?auto_5687 - INSTRUMENT
      ?auto_5690 - SATELLITE
      ?auto_5688 - DIRECTION
      ?auto_5691 - MODE
      ?auto_5689 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5686 ?auto_5683 ) ) ( not ( = ?auto_5683 ?auto_5692 ) ) ( ON_BOARD ?auto_5687 ?auto_5690 ) ( SUPPORTS ?auto_5687 ?auto_5684 ) ( not ( = ?auto_5683 ?auto_5688 ) ) ( HAVE_IMAGE ?auto_5692 ?auto_5691 ) ( not ( = ?auto_5692 ?auto_5688 ) ) ( not ( = ?auto_5691 ?auto_5684 ) ) ( CALIBRATION_TARGET ?auto_5687 ?auto_5688 ) ( not ( = ?auto_5688 ?auto_5686 ) ) ( not ( = ?auto_5692 ?auto_5686 ) ) ( ON_BOARD ?auto_5689 ?auto_5690 ) ( POWER_ON ?auto_5689 ) ( not ( = ?auto_5687 ?auto_5689 ) ) ( SUPPORTS ?auto_5689 ?auto_5685 ) ( not ( = ?auto_5691 ?auto_5685 ) ) ( not ( = ?auto_5684 ?auto_5685 ) ) ( POINTING ?auto_5690 ?auto_5688 ) ( CALIBRATION_TARGET ?auto_5689 ?auto_5688 ) ( NOT_CALIBRATED ?auto_5689 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5692 ?auto_5691 ?auto_5683 ?auto_5684 )
      ( GET-2IMAGE-VERIFY ?auto_5683 ?auto_5684 ?auto_5686 ?auto_5685 ) )
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
      ?auto_5726 - SATELLITE
      ?auto_5724 - DIRECTION
      ?auto_5725 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5720 ?auto_5717 ) ) ( not ( = ?auto_5722 ?auto_5717 ) ) ( not ( = ?auto_5722 ?auto_5720 ) ) ( ON_BOARD ?auto_5723 ?auto_5726 ) ( SUPPORTS ?auto_5723 ?auto_5721 ) ( not ( = ?auto_5722 ?auto_5724 ) ) ( HAVE_IMAGE ?auto_5717 ?auto_5718 ) ( not ( = ?auto_5717 ?auto_5724 ) ) ( not ( = ?auto_5718 ?auto_5721 ) ) ( CALIBRATION_TARGET ?auto_5723 ?auto_5724 ) ( not ( = ?auto_5724 ?auto_5720 ) ) ( ON_BOARD ?auto_5725 ?auto_5726 ) ( POWER_ON ?auto_5725 ) ( not ( = ?auto_5723 ?auto_5725 ) ) ( SUPPORTS ?auto_5725 ?auto_5719 ) ( not ( = ?auto_5718 ?auto_5719 ) ) ( not ( = ?auto_5721 ?auto_5719 ) ) ( POINTING ?auto_5726 ?auto_5724 ) ( CALIBRATION_TARGET ?auto_5725 ?auto_5724 ) ( NOT_CALIBRATED ?auto_5725 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5717 ?auto_5718 ?auto_5722 ?auto_5721 )
      ( GET-3IMAGE-VERIFY ?auto_5717 ?auto_5718 ?auto_5720 ?auto_5719 ?auto_5722 ?auto_5721 ) )
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
      ?auto_5748 - SATELLITE
      ?auto_5746 - DIRECTION
      ?auto_5747 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5742 ?auto_5739 ) ) ( not ( = ?auto_5744 ?auto_5739 ) ) ( not ( = ?auto_5744 ?auto_5742 ) ) ( ON_BOARD ?auto_5745 ?auto_5748 ) ( SUPPORTS ?auto_5745 ?auto_5741 ) ( not ( = ?auto_5742 ?auto_5746 ) ) ( HAVE_IMAGE ?auto_5739 ?auto_5740 ) ( not ( = ?auto_5739 ?auto_5746 ) ) ( not ( = ?auto_5740 ?auto_5741 ) ) ( CALIBRATION_TARGET ?auto_5745 ?auto_5746 ) ( not ( = ?auto_5746 ?auto_5744 ) ) ( ON_BOARD ?auto_5747 ?auto_5748 ) ( POWER_ON ?auto_5747 ) ( not ( = ?auto_5745 ?auto_5747 ) ) ( SUPPORTS ?auto_5747 ?auto_5743 ) ( not ( = ?auto_5740 ?auto_5743 ) ) ( not ( = ?auto_5741 ?auto_5743 ) ) ( POINTING ?auto_5748 ?auto_5746 ) ( CALIBRATION_TARGET ?auto_5747 ?auto_5746 ) ( NOT_CALIBRATED ?auto_5747 ) )
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
      ?auto_5770 - SATELLITE
      ?auto_5768 - DIRECTION
      ?auto_5769 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5764 ?auto_5761 ) ) ( not ( = ?auto_5766 ?auto_5761 ) ) ( not ( = ?auto_5766 ?auto_5764 ) ) ( ON_BOARD ?auto_5767 ?auto_5770 ) ( SUPPORTS ?auto_5767 ?auto_5765 ) ( not ( = ?auto_5766 ?auto_5768 ) ) ( HAVE_IMAGE ?auto_5764 ?auto_5763 ) ( not ( = ?auto_5764 ?auto_5768 ) ) ( not ( = ?auto_5763 ?auto_5765 ) ) ( CALIBRATION_TARGET ?auto_5767 ?auto_5768 ) ( not ( = ?auto_5768 ?auto_5761 ) ) ( ON_BOARD ?auto_5769 ?auto_5770 ) ( POWER_ON ?auto_5769 ) ( not ( = ?auto_5767 ?auto_5769 ) ) ( SUPPORTS ?auto_5769 ?auto_5762 ) ( not ( = ?auto_5763 ?auto_5762 ) ) ( not ( = ?auto_5765 ?auto_5762 ) ) ( POINTING ?auto_5770 ?auto_5768 ) ( CALIBRATION_TARGET ?auto_5769 ?auto_5768 ) ( NOT_CALIBRATED ?auto_5769 ) )
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
      ?auto_5792 - SATELLITE
      ?auto_5790 - DIRECTION
      ?auto_5791 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5786 ?auto_5783 ) ) ( not ( = ?auto_5788 ?auto_5783 ) ) ( not ( = ?auto_5788 ?auto_5786 ) ) ( ON_BOARD ?auto_5789 ?auto_5792 ) ( SUPPORTS ?auto_5789 ?auto_5785 ) ( not ( = ?auto_5786 ?auto_5790 ) ) ( HAVE_IMAGE ?auto_5788 ?auto_5787 ) ( not ( = ?auto_5788 ?auto_5790 ) ) ( not ( = ?auto_5787 ?auto_5785 ) ) ( CALIBRATION_TARGET ?auto_5789 ?auto_5790 ) ( not ( = ?auto_5790 ?auto_5783 ) ) ( ON_BOARD ?auto_5791 ?auto_5792 ) ( POWER_ON ?auto_5791 ) ( not ( = ?auto_5789 ?auto_5791 ) ) ( SUPPORTS ?auto_5791 ?auto_5784 ) ( not ( = ?auto_5787 ?auto_5784 ) ) ( not ( = ?auto_5785 ?auto_5784 ) ) ( POINTING ?auto_5792 ?auto_5790 ) ( CALIBRATION_TARGET ?auto_5791 ?auto_5790 ) ( NOT_CALIBRATED ?auto_5791 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5788 ?auto_5787 ?auto_5786 ?auto_5785 )
      ( GET-3IMAGE-VERIFY ?auto_5783 ?auto_5784 ?auto_5786 ?auto_5785 ?auto_5788 ?auto_5787 ) )
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
      ?auto_5838 - SATELLITE
      ?auto_5836 - DIRECTION
      ?auto_5837 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5832 ?auto_5829 ) ) ( not ( = ?auto_5834 ?auto_5829 ) ) ( not ( = ?auto_5834 ?auto_5832 ) ) ( ON_BOARD ?auto_5835 ?auto_5838 ) ( SUPPORTS ?auto_5835 ?auto_5830 ) ( not ( = ?auto_5829 ?auto_5836 ) ) ( HAVE_IMAGE ?auto_5832 ?auto_5831 ) ( not ( = ?auto_5832 ?auto_5836 ) ) ( not ( = ?auto_5831 ?auto_5830 ) ) ( CALIBRATION_TARGET ?auto_5835 ?auto_5836 ) ( not ( = ?auto_5836 ?auto_5834 ) ) ( ON_BOARD ?auto_5837 ?auto_5838 ) ( POWER_ON ?auto_5837 ) ( not ( = ?auto_5835 ?auto_5837 ) ) ( SUPPORTS ?auto_5837 ?auto_5833 ) ( not ( = ?auto_5831 ?auto_5833 ) ) ( not ( = ?auto_5830 ?auto_5833 ) ) ( POINTING ?auto_5838 ?auto_5836 ) ( CALIBRATION_TARGET ?auto_5837 ?auto_5836 ) ( NOT_CALIBRATED ?auto_5837 ) )
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
      ?auto_5860 - SATELLITE
      ?auto_5858 - DIRECTION
      ?auto_5859 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5854 ?auto_5851 ) ) ( not ( = ?auto_5856 ?auto_5851 ) ) ( not ( = ?auto_5856 ?auto_5854 ) ) ( ON_BOARD ?auto_5857 ?auto_5860 ) ( SUPPORTS ?auto_5857 ?auto_5852 ) ( not ( = ?auto_5851 ?auto_5858 ) ) ( HAVE_IMAGE ?auto_5856 ?auto_5855 ) ( not ( = ?auto_5856 ?auto_5858 ) ) ( not ( = ?auto_5855 ?auto_5852 ) ) ( CALIBRATION_TARGET ?auto_5857 ?auto_5858 ) ( not ( = ?auto_5858 ?auto_5854 ) ) ( ON_BOARD ?auto_5859 ?auto_5860 ) ( POWER_ON ?auto_5859 ) ( not ( = ?auto_5857 ?auto_5859 ) ) ( SUPPORTS ?auto_5859 ?auto_5853 ) ( not ( = ?auto_5855 ?auto_5853 ) ) ( not ( = ?auto_5852 ?auto_5853 ) ) ( POINTING ?auto_5860 ?auto_5858 ) ( CALIBRATION_TARGET ?auto_5859 ?auto_5858 ) ( NOT_CALIBRATED ?auto_5859 ) )
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
      ?auto_5932 - DIRECTION
      ?auto_5925 - INSTRUMENT
      ?auto_5930 - SATELLITE
      ?auto_5928 - DIRECTION
      ?auto_5931 - MODE
      ?auto_5927 - DIRECTION
      ?auto_5929 - INSTRUMENT
      ?auto_5926 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_5923 ?auto_5932 ) ) ( ON_BOARD ?auto_5925 ?auto_5930 ) ( SUPPORTS ?auto_5925 ?auto_5924 ) ( not ( = ?auto_5923 ?auto_5928 ) ) ( HAVE_IMAGE ?auto_5932 ?auto_5931 ) ( not ( = ?auto_5932 ?auto_5928 ) ) ( not ( = ?auto_5931 ?auto_5924 ) ) ( CALIBRATION_TARGET ?auto_5925 ?auto_5928 ) ( not ( = ?auto_5928 ?auto_5927 ) ) ( not ( = ?auto_5923 ?auto_5927 ) ) ( not ( = ?auto_5932 ?auto_5927 ) ) ( ON_BOARD ?auto_5929 ?auto_5930 ) ( not ( = ?auto_5925 ?auto_5929 ) ) ( SUPPORTS ?auto_5929 ?auto_5926 ) ( not ( = ?auto_5931 ?auto_5926 ) ) ( not ( = ?auto_5924 ?auto_5926 ) ) ( POINTING ?auto_5930 ?auto_5928 ) ( CALIBRATION_TARGET ?auto_5929 ?auto_5928 ) ( POWER_AVAIL ?auto_5930 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_5929 ?auto_5930 )
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
      ?auto_5942 - SATELLITE
      ?auto_5941 - DIRECTION
      ?auto_5939 - DIRECTION
      ?auto_5937 - INSTRUMENT
      ?auto_5938 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_5936 ?auto_5933 ) ) ( ON_BOARD ?auto_5940 ?auto_5942 ) ( SUPPORTS ?auto_5940 ?auto_5935 ) ( not ( = ?auto_5936 ?auto_5941 ) ) ( HAVE_IMAGE ?auto_5933 ?auto_5934 ) ( not ( = ?auto_5933 ?auto_5941 ) ) ( not ( = ?auto_5934 ?auto_5935 ) ) ( CALIBRATION_TARGET ?auto_5940 ?auto_5941 ) ( not ( = ?auto_5941 ?auto_5939 ) ) ( not ( = ?auto_5936 ?auto_5939 ) ) ( not ( = ?auto_5933 ?auto_5939 ) ) ( ON_BOARD ?auto_5937 ?auto_5942 ) ( not ( = ?auto_5940 ?auto_5937 ) ) ( SUPPORTS ?auto_5937 ?auto_5938 ) ( not ( = ?auto_5934 ?auto_5938 ) ) ( not ( = ?auto_5935 ?auto_5938 ) ) ( POINTING ?auto_5942 ?auto_5941 ) ( CALIBRATION_TARGET ?auto_5937 ?auto_5941 ) ( POWER_AVAIL ?auto_5942 ) )
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
      ?auto_5952 - DIRECTION
      ?auto_5950 - INSTRUMENT
      ?auto_5949 - SATELLITE
      ?auto_5948 - DIRECTION
      ?auto_5951 - MODE
      ?auto_5947 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5946 ?auto_5943 ) ) ( not ( = ?auto_5946 ?auto_5952 ) ) ( ON_BOARD ?auto_5950 ?auto_5949 ) ( SUPPORTS ?auto_5950 ?auto_5945 ) ( not ( = ?auto_5946 ?auto_5948 ) ) ( HAVE_IMAGE ?auto_5952 ?auto_5951 ) ( not ( = ?auto_5952 ?auto_5948 ) ) ( not ( = ?auto_5951 ?auto_5945 ) ) ( CALIBRATION_TARGET ?auto_5950 ?auto_5948 ) ( not ( = ?auto_5948 ?auto_5943 ) ) ( not ( = ?auto_5952 ?auto_5943 ) ) ( ON_BOARD ?auto_5947 ?auto_5949 ) ( not ( = ?auto_5950 ?auto_5947 ) ) ( SUPPORTS ?auto_5947 ?auto_5944 ) ( not ( = ?auto_5951 ?auto_5944 ) ) ( not ( = ?auto_5945 ?auto_5944 ) ) ( POINTING ?auto_5949 ?auto_5948 ) ( CALIBRATION_TARGET ?auto_5947 ?auto_5948 ) ( POWER_AVAIL ?auto_5949 ) )
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
      ?auto_5962 - INSTRUMENT
      ?auto_5961 - SATELLITE
      ?auto_5960 - DIRECTION
      ?auto_5959 - DIRECTION
      ?auto_5957 - INSTRUMENT
      ?auto_5958 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_5956 ?auto_5953 ) ) ( ON_BOARD ?auto_5962 ?auto_5961 ) ( SUPPORTS ?auto_5962 ?auto_5954 ) ( not ( = ?auto_5953 ?auto_5960 ) ) ( HAVE_IMAGE ?auto_5956 ?auto_5955 ) ( not ( = ?auto_5956 ?auto_5960 ) ) ( not ( = ?auto_5955 ?auto_5954 ) ) ( CALIBRATION_TARGET ?auto_5962 ?auto_5960 ) ( not ( = ?auto_5960 ?auto_5959 ) ) ( not ( = ?auto_5953 ?auto_5959 ) ) ( not ( = ?auto_5956 ?auto_5959 ) ) ( ON_BOARD ?auto_5957 ?auto_5961 ) ( not ( = ?auto_5962 ?auto_5957 ) ) ( SUPPORTS ?auto_5957 ?auto_5958 ) ( not ( = ?auto_5955 ?auto_5958 ) ) ( not ( = ?auto_5954 ?auto_5958 ) ) ( POINTING ?auto_5961 ?auto_5960 ) ( CALIBRATION_TARGET ?auto_5957 ?auto_5960 ) ( POWER_AVAIL ?auto_5961 ) )
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
      ?auto_5972 - DIRECTION
      ?auto_5970 - INSTRUMENT
      ?auto_5969 - SATELLITE
      ?auto_5968 - DIRECTION
      ?auto_5971 - MODE
      ?auto_5967 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5966 ?auto_5963 ) ) ( not ( = ?auto_5963 ?auto_5972 ) ) ( ON_BOARD ?auto_5970 ?auto_5969 ) ( SUPPORTS ?auto_5970 ?auto_5964 ) ( not ( = ?auto_5963 ?auto_5968 ) ) ( HAVE_IMAGE ?auto_5972 ?auto_5971 ) ( not ( = ?auto_5972 ?auto_5968 ) ) ( not ( = ?auto_5971 ?auto_5964 ) ) ( CALIBRATION_TARGET ?auto_5970 ?auto_5968 ) ( not ( = ?auto_5968 ?auto_5966 ) ) ( not ( = ?auto_5972 ?auto_5966 ) ) ( ON_BOARD ?auto_5967 ?auto_5969 ) ( not ( = ?auto_5970 ?auto_5967 ) ) ( SUPPORTS ?auto_5967 ?auto_5965 ) ( not ( = ?auto_5971 ?auto_5965 ) ) ( not ( = ?auto_5964 ?auto_5965 ) ) ( POINTING ?auto_5969 ?auto_5968 ) ( CALIBRATION_TARGET ?auto_5967 ?auto_5968 ) ( POWER_AVAIL ?auto_5969 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5972 ?auto_5971 ?auto_5963 ?auto_5964 )
      ( GET-2IMAGE-VERIFY ?auto_5963 ?auto_5964 ?auto_5966 ?auto_5965 ) )
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
      ?auto_6006 - INSTRUMENT
      ?auto_6005 - SATELLITE
      ?auto_6004 - DIRECTION
      ?auto_6003 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6000 ?auto_5997 ) ) ( not ( = ?auto_6002 ?auto_5997 ) ) ( not ( = ?auto_6002 ?auto_6000 ) ) ( ON_BOARD ?auto_6006 ?auto_6005 ) ( SUPPORTS ?auto_6006 ?auto_6001 ) ( not ( = ?auto_6002 ?auto_6004 ) ) ( HAVE_IMAGE ?auto_5997 ?auto_5998 ) ( not ( = ?auto_5997 ?auto_6004 ) ) ( not ( = ?auto_5998 ?auto_6001 ) ) ( CALIBRATION_TARGET ?auto_6006 ?auto_6004 ) ( not ( = ?auto_6004 ?auto_6000 ) ) ( ON_BOARD ?auto_6003 ?auto_6005 ) ( not ( = ?auto_6006 ?auto_6003 ) ) ( SUPPORTS ?auto_6003 ?auto_5999 ) ( not ( = ?auto_5998 ?auto_5999 ) ) ( not ( = ?auto_6001 ?auto_5999 ) ) ( POINTING ?auto_6005 ?auto_6004 ) ( CALIBRATION_TARGET ?auto_6003 ?auto_6004 ) ( POWER_AVAIL ?auto_6005 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5997 ?auto_5998 ?auto_6002 ?auto_6001 )
      ( GET-3IMAGE-VERIFY ?auto_5997 ?auto_5998 ?auto_6000 ?auto_5999 ?auto_6002 ?auto_6001 ) )
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
      ?auto_6028 - INSTRUMENT
      ?auto_6027 - SATELLITE
      ?auto_6026 - DIRECTION
      ?auto_6025 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6022 ?auto_6019 ) ) ( not ( = ?auto_6024 ?auto_6019 ) ) ( not ( = ?auto_6024 ?auto_6022 ) ) ( ON_BOARD ?auto_6028 ?auto_6027 ) ( SUPPORTS ?auto_6028 ?auto_6021 ) ( not ( = ?auto_6022 ?auto_6026 ) ) ( HAVE_IMAGE ?auto_6019 ?auto_6020 ) ( not ( = ?auto_6019 ?auto_6026 ) ) ( not ( = ?auto_6020 ?auto_6021 ) ) ( CALIBRATION_TARGET ?auto_6028 ?auto_6026 ) ( not ( = ?auto_6026 ?auto_6024 ) ) ( ON_BOARD ?auto_6025 ?auto_6027 ) ( not ( = ?auto_6028 ?auto_6025 ) ) ( SUPPORTS ?auto_6025 ?auto_6023 ) ( not ( = ?auto_6020 ?auto_6023 ) ) ( not ( = ?auto_6021 ?auto_6023 ) ) ( POINTING ?auto_6027 ?auto_6026 ) ( CALIBRATION_TARGET ?auto_6025 ?auto_6026 ) ( POWER_AVAIL ?auto_6027 ) )
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
      ?auto_6050 - INSTRUMENT
      ?auto_6049 - SATELLITE
      ?auto_6048 - DIRECTION
      ?auto_6047 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6044 ?auto_6041 ) ) ( not ( = ?auto_6046 ?auto_6041 ) ) ( not ( = ?auto_6046 ?auto_6044 ) ) ( ON_BOARD ?auto_6050 ?auto_6049 ) ( SUPPORTS ?auto_6050 ?auto_6045 ) ( not ( = ?auto_6046 ?auto_6048 ) ) ( HAVE_IMAGE ?auto_6044 ?auto_6043 ) ( not ( = ?auto_6044 ?auto_6048 ) ) ( not ( = ?auto_6043 ?auto_6045 ) ) ( CALIBRATION_TARGET ?auto_6050 ?auto_6048 ) ( not ( = ?auto_6048 ?auto_6041 ) ) ( ON_BOARD ?auto_6047 ?auto_6049 ) ( not ( = ?auto_6050 ?auto_6047 ) ) ( SUPPORTS ?auto_6047 ?auto_6042 ) ( not ( = ?auto_6043 ?auto_6042 ) ) ( not ( = ?auto_6045 ?auto_6042 ) ) ( POINTING ?auto_6049 ?auto_6048 ) ( CALIBRATION_TARGET ?auto_6047 ?auto_6048 ) ( POWER_AVAIL ?auto_6049 ) )
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
      ?auto_6072 - INSTRUMENT
      ?auto_6071 - SATELLITE
      ?auto_6070 - DIRECTION
      ?auto_6069 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6066 ?auto_6063 ) ) ( not ( = ?auto_6068 ?auto_6063 ) ) ( not ( = ?auto_6068 ?auto_6066 ) ) ( ON_BOARD ?auto_6072 ?auto_6071 ) ( SUPPORTS ?auto_6072 ?auto_6065 ) ( not ( = ?auto_6066 ?auto_6070 ) ) ( HAVE_IMAGE ?auto_6068 ?auto_6067 ) ( not ( = ?auto_6068 ?auto_6070 ) ) ( not ( = ?auto_6067 ?auto_6065 ) ) ( CALIBRATION_TARGET ?auto_6072 ?auto_6070 ) ( not ( = ?auto_6070 ?auto_6063 ) ) ( ON_BOARD ?auto_6069 ?auto_6071 ) ( not ( = ?auto_6072 ?auto_6069 ) ) ( SUPPORTS ?auto_6069 ?auto_6064 ) ( not ( = ?auto_6067 ?auto_6064 ) ) ( not ( = ?auto_6065 ?auto_6064 ) ) ( POINTING ?auto_6071 ?auto_6070 ) ( CALIBRATION_TARGET ?auto_6069 ?auto_6070 ) ( POWER_AVAIL ?auto_6071 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6068 ?auto_6067 ?auto_6066 ?auto_6065 )
      ( GET-3IMAGE-VERIFY ?auto_6063 ?auto_6064 ?auto_6066 ?auto_6065 ?auto_6068 ?auto_6067 ) )
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
      ?auto_6118 - INSTRUMENT
      ?auto_6117 - SATELLITE
      ?auto_6116 - DIRECTION
      ?auto_6115 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6112 ?auto_6109 ) ) ( not ( = ?auto_6114 ?auto_6109 ) ) ( not ( = ?auto_6114 ?auto_6112 ) ) ( ON_BOARD ?auto_6118 ?auto_6117 ) ( SUPPORTS ?auto_6118 ?auto_6110 ) ( not ( = ?auto_6109 ?auto_6116 ) ) ( HAVE_IMAGE ?auto_6112 ?auto_6111 ) ( not ( = ?auto_6112 ?auto_6116 ) ) ( not ( = ?auto_6111 ?auto_6110 ) ) ( CALIBRATION_TARGET ?auto_6118 ?auto_6116 ) ( not ( = ?auto_6116 ?auto_6114 ) ) ( ON_BOARD ?auto_6115 ?auto_6117 ) ( not ( = ?auto_6118 ?auto_6115 ) ) ( SUPPORTS ?auto_6115 ?auto_6113 ) ( not ( = ?auto_6111 ?auto_6113 ) ) ( not ( = ?auto_6110 ?auto_6113 ) ) ( POINTING ?auto_6117 ?auto_6116 ) ( CALIBRATION_TARGET ?auto_6115 ?auto_6116 ) ( POWER_AVAIL ?auto_6117 ) )
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
      ?auto_6140 - INSTRUMENT
      ?auto_6139 - SATELLITE
      ?auto_6138 - DIRECTION
      ?auto_6137 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6134 ?auto_6131 ) ) ( not ( = ?auto_6136 ?auto_6131 ) ) ( not ( = ?auto_6136 ?auto_6134 ) ) ( ON_BOARD ?auto_6140 ?auto_6139 ) ( SUPPORTS ?auto_6140 ?auto_6132 ) ( not ( = ?auto_6131 ?auto_6138 ) ) ( HAVE_IMAGE ?auto_6136 ?auto_6135 ) ( not ( = ?auto_6136 ?auto_6138 ) ) ( not ( = ?auto_6135 ?auto_6132 ) ) ( CALIBRATION_TARGET ?auto_6140 ?auto_6138 ) ( not ( = ?auto_6138 ?auto_6134 ) ) ( ON_BOARD ?auto_6137 ?auto_6139 ) ( not ( = ?auto_6140 ?auto_6137 ) ) ( SUPPORTS ?auto_6137 ?auto_6133 ) ( not ( = ?auto_6135 ?auto_6133 ) ) ( not ( = ?auto_6132 ?auto_6133 ) ) ( POINTING ?auto_6139 ?auto_6138 ) ( CALIBRATION_TARGET ?auto_6137 ?auto_6138 ) ( POWER_AVAIL ?auto_6139 ) )
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
      ?auto_6212 - DIRECTION
      ?auto_6210 - INSTRUMENT
      ?auto_6209 - SATELLITE
      ?auto_6208 - DIRECTION
      ?auto_6211 - MODE
      ?auto_6207 - DIRECTION
      ?auto_6205 - INSTRUMENT
      ?auto_6206 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_6203 ?auto_6212 ) ) ( ON_BOARD ?auto_6210 ?auto_6209 ) ( SUPPORTS ?auto_6210 ?auto_6204 ) ( not ( = ?auto_6203 ?auto_6208 ) ) ( HAVE_IMAGE ?auto_6212 ?auto_6211 ) ( not ( = ?auto_6212 ?auto_6208 ) ) ( not ( = ?auto_6211 ?auto_6204 ) ) ( CALIBRATION_TARGET ?auto_6210 ?auto_6208 ) ( not ( = ?auto_6208 ?auto_6207 ) ) ( not ( = ?auto_6203 ?auto_6207 ) ) ( not ( = ?auto_6212 ?auto_6207 ) ) ( ON_BOARD ?auto_6205 ?auto_6209 ) ( not ( = ?auto_6210 ?auto_6205 ) ) ( SUPPORTS ?auto_6205 ?auto_6206 ) ( not ( = ?auto_6211 ?auto_6206 ) ) ( not ( = ?auto_6204 ?auto_6206 ) ) ( CALIBRATION_TARGET ?auto_6205 ?auto_6208 ) ( POWER_AVAIL ?auto_6209 ) ( POINTING ?auto_6209 ?auto_6212 ) )
    :subtasks
    ( ( !TURN_TO ?auto_6209 ?auto_6208 ?auto_6212 )
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
      ?auto_6222 - INSTRUMENT
      ?auto_6220 - SATELLITE
      ?auto_6219 - DIRECTION
      ?auto_6218 - DIRECTION
      ?auto_6221 - INSTRUMENT
      ?auto_6217 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_6216 ?auto_6213 ) ) ( ON_BOARD ?auto_6222 ?auto_6220 ) ( SUPPORTS ?auto_6222 ?auto_6215 ) ( not ( = ?auto_6216 ?auto_6219 ) ) ( HAVE_IMAGE ?auto_6213 ?auto_6214 ) ( not ( = ?auto_6213 ?auto_6219 ) ) ( not ( = ?auto_6214 ?auto_6215 ) ) ( CALIBRATION_TARGET ?auto_6222 ?auto_6219 ) ( not ( = ?auto_6219 ?auto_6218 ) ) ( not ( = ?auto_6216 ?auto_6218 ) ) ( not ( = ?auto_6213 ?auto_6218 ) ) ( ON_BOARD ?auto_6221 ?auto_6220 ) ( not ( = ?auto_6222 ?auto_6221 ) ) ( SUPPORTS ?auto_6221 ?auto_6217 ) ( not ( = ?auto_6214 ?auto_6217 ) ) ( not ( = ?auto_6215 ?auto_6217 ) ) ( CALIBRATION_TARGET ?auto_6221 ?auto_6219 ) ( POWER_AVAIL ?auto_6220 ) ( POINTING ?auto_6220 ?auto_6213 ) )
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
      ?auto_6232 - DIRECTION
      ?auto_6229 - INSTRUMENT
      ?auto_6230 - SATELLITE
      ?auto_6228 - DIRECTION
      ?auto_6231 - MODE
      ?auto_6227 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6226 ?auto_6223 ) ) ( not ( = ?auto_6226 ?auto_6232 ) ) ( ON_BOARD ?auto_6229 ?auto_6230 ) ( SUPPORTS ?auto_6229 ?auto_6225 ) ( not ( = ?auto_6226 ?auto_6228 ) ) ( HAVE_IMAGE ?auto_6232 ?auto_6231 ) ( not ( = ?auto_6232 ?auto_6228 ) ) ( not ( = ?auto_6231 ?auto_6225 ) ) ( CALIBRATION_TARGET ?auto_6229 ?auto_6228 ) ( not ( = ?auto_6228 ?auto_6223 ) ) ( not ( = ?auto_6232 ?auto_6223 ) ) ( ON_BOARD ?auto_6227 ?auto_6230 ) ( not ( = ?auto_6229 ?auto_6227 ) ) ( SUPPORTS ?auto_6227 ?auto_6224 ) ( not ( = ?auto_6231 ?auto_6224 ) ) ( not ( = ?auto_6225 ?auto_6224 ) ) ( CALIBRATION_TARGET ?auto_6227 ?auto_6228 ) ( POWER_AVAIL ?auto_6230 ) ( POINTING ?auto_6230 ?auto_6232 ) )
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
      ?auto_6241 - INSTRUMENT
      ?auto_6242 - SATELLITE
      ?auto_6240 - DIRECTION
      ?auto_6239 - DIRECTION
      ?auto_6237 - INSTRUMENT
      ?auto_6238 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_6236 ?auto_6233 ) ) ( ON_BOARD ?auto_6241 ?auto_6242 ) ( SUPPORTS ?auto_6241 ?auto_6234 ) ( not ( = ?auto_6233 ?auto_6240 ) ) ( HAVE_IMAGE ?auto_6236 ?auto_6235 ) ( not ( = ?auto_6236 ?auto_6240 ) ) ( not ( = ?auto_6235 ?auto_6234 ) ) ( CALIBRATION_TARGET ?auto_6241 ?auto_6240 ) ( not ( = ?auto_6240 ?auto_6239 ) ) ( not ( = ?auto_6233 ?auto_6239 ) ) ( not ( = ?auto_6236 ?auto_6239 ) ) ( ON_BOARD ?auto_6237 ?auto_6242 ) ( not ( = ?auto_6241 ?auto_6237 ) ) ( SUPPORTS ?auto_6237 ?auto_6238 ) ( not ( = ?auto_6235 ?auto_6238 ) ) ( not ( = ?auto_6234 ?auto_6238 ) ) ( CALIBRATION_TARGET ?auto_6237 ?auto_6240 ) ( POWER_AVAIL ?auto_6242 ) ( POINTING ?auto_6242 ?auto_6236 ) )
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
      ?auto_6252 - DIRECTION
      ?auto_6249 - INSTRUMENT
      ?auto_6250 - SATELLITE
      ?auto_6248 - DIRECTION
      ?auto_6251 - MODE
      ?auto_6247 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6246 ?auto_6243 ) ) ( not ( = ?auto_6243 ?auto_6252 ) ) ( ON_BOARD ?auto_6249 ?auto_6250 ) ( SUPPORTS ?auto_6249 ?auto_6244 ) ( not ( = ?auto_6243 ?auto_6248 ) ) ( HAVE_IMAGE ?auto_6252 ?auto_6251 ) ( not ( = ?auto_6252 ?auto_6248 ) ) ( not ( = ?auto_6251 ?auto_6244 ) ) ( CALIBRATION_TARGET ?auto_6249 ?auto_6248 ) ( not ( = ?auto_6248 ?auto_6246 ) ) ( not ( = ?auto_6252 ?auto_6246 ) ) ( ON_BOARD ?auto_6247 ?auto_6250 ) ( not ( = ?auto_6249 ?auto_6247 ) ) ( SUPPORTS ?auto_6247 ?auto_6245 ) ( not ( = ?auto_6251 ?auto_6245 ) ) ( not ( = ?auto_6244 ?auto_6245 ) ) ( CALIBRATION_TARGET ?auto_6247 ?auto_6248 ) ( POWER_AVAIL ?auto_6250 ) ( POINTING ?auto_6250 ?auto_6252 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6252 ?auto_6251 ?auto_6243 ?auto_6244 )
      ( GET-2IMAGE-VERIFY ?auto_6243 ?auto_6244 ?auto_6246 ?auto_6245 ) )
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
      ?auto_6285 - INSTRUMENT
      ?auto_6286 - SATELLITE
      ?auto_6284 - DIRECTION
      ?auto_6283 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6280 ?auto_6277 ) ) ( not ( = ?auto_6282 ?auto_6277 ) ) ( not ( = ?auto_6282 ?auto_6280 ) ) ( ON_BOARD ?auto_6285 ?auto_6286 ) ( SUPPORTS ?auto_6285 ?auto_6281 ) ( not ( = ?auto_6282 ?auto_6284 ) ) ( HAVE_IMAGE ?auto_6277 ?auto_6278 ) ( not ( = ?auto_6277 ?auto_6284 ) ) ( not ( = ?auto_6278 ?auto_6281 ) ) ( CALIBRATION_TARGET ?auto_6285 ?auto_6284 ) ( not ( = ?auto_6284 ?auto_6280 ) ) ( ON_BOARD ?auto_6283 ?auto_6286 ) ( not ( = ?auto_6285 ?auto_6283 ) ) ( SUPPORTS ?auto_6283 ?auto_6279 ) ( not ( = ?auto_6278 ?auto_6279 ) ) ( not ( = ?auto_6281 ?auto_6279 ) ) ( CALIBRATION_TARGET ?auto_6283 ?auto_6284 ) ( POWER_AVAIL ?auto_6286 ) ( POINTING ?auto_6286 ?auto_6277 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6277 ?auto_6278 ?auto_6282 ?auto_6281 )
      ( GET-3IMAGE-VERIFY ?auto_6277 ?auto_6278 ?auto_6280 ?auto_6279 ?auto_6282 ?auto_6281 ) )
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
      ?auto_6307 - INSTRUMENT
      ?auto_6308 - SATELLITE
      ?auto_6306 - DIRECTION
      ?auto_6305 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6302 ?auto_6299 ) ) ( not ( = ?auto_6304 ?auto_6299 ) ) ( not ( = ?auto_6304 ?auto_6302 ) ) ( ON_BOARD ?auto_6307 ?auto_6308 ) ( SUPPORTS ?auto_6307 ?auto_6301 ) ( not ( = ?auto_6302 ?auto_6306 ) ) ( HAVE_IMAGE ?auto_6299 ?auto_6300 ) ( not ( = ?auto_6299 ?auto_6306 ) ) ( not ( = ?auto_6300 ?auto_6301 ) ) ( CALIBRATION_TARGET ?auto_6307 ?auto_6306 ) ( not ( = ?auto_6306 ?auto_6304 ) ) ( ON_BOARD ?auto_6305 ?auto_6308 ) ( not ( = ?auto_6307 ?auto_6305 ) ) ( SUPPORTS ?auto_6305 ?auto_6303 ) ( not ( = ?auto_6300 ?auto_6303 ) ) ( not ( = ?auto_6301 ?auto_6303 ) ) ( CALIBRATION_TARGET ?auto_6305 ?auto_6306 ) ( POWER_AVAIL ?auto_6308 ) ( POINTING ?auto_6308 ?auto_6299 ) )
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
      ?auto_6329 - INSTRUMENT
      ?auto_6330 - SATELLITE
      ?auto_6328 - DIRECTION
      ?auto_6327 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6324 ?auto_6321 ) ) ( not ( = ?auto_6326 ?auto_6321 ) ) ( not ( = ?auto_6326 ?auto_6324 ) ) ( ON_BOARD ?auto_6329 ?auto_6330 ) ( SUPPORTS ?auto_6329 ?auto_6325 ) ( not ( = ?auto_6326 ?auto_6328 ) ) ( HAVE_IMAGE ?auto_6324 ?auto_6323 ) ( not ( = ?auto_6324 ?auto_6328 ) ) ( not ( = ?auto_6323 ?auto_6325 ) ) ( CALIBRATION_TARGET ?auto_6329 ?auto_6328 ) ( not ( = ?auto_6328 ?auto_6321 ) ) ( ON_BOARD ?auto_6327 ?auto_6330 ) ( not ( = ?auto_6329 ?auto_6327 ) ) ( SUPPORTS ?auto_6327 ?auto_6322 ) ( not ( = ?auto_6323 ?auto_6322 ) ) ( not ( = ?auto_6325 ?auto_6322 ) ) ( CALIBRATION_TARGET ?auto_6327 ?auto_6328 ) ( POWER_AVAIL ?auto_6330 ) ( POINTING ?auto_6330 ?auto_6324 ) )
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
      ?auto_6351 - INSTRUMENT
      ?auto_6352 - SATELLITE
      ?auto_6350 - DIRECTION
      ?auto_6349 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6346 ?auto_6343 ) ) ( not ( = ?auto_6348 ?auto_6343 ) ) ( not ( = ?auto_6348 ?auto_6346 ) ) ( ON_BOARD ?auto_6351 ?auto_6352 ) ( SUPPORTS ?auto_6351 ?auto_6345 ) ( not ( = ?auto_6346 ?auto_6350 ) ) ( HAVE_IMAGE ?auto_6348 ?auto_6347 ) ( not ( = ?auto_6348 ?auto_6350 ) ) ( not ( = ?auto_6347 ?auto_6345 ) ) ( CALIBRATION_TARGET ?auto_6351 ?auto_6350 ) ( not ( = ?auto_6350 ?auto_6343 ) ) ( ON_BOARD ?auto_6349 ?auto_6352 ) ( not ( = ?auto_6351 ?auto_6349 ) ) ( SUPPORTS ?auto_6349 ?auto_6344 ) ( not ( = ?auto_6347 ?auto_6344 ) ) ( not ( = ?auto_6345 ?auto_6344 ) ) ( CALIBRATION_TARGET ?auto_6349 ?auto_6350 ) ( POWER_AVAIL ?auto_6352 ) ( POINTING ?auto_6352 ?auto_6348 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6348 ?auto_6347 ?auto_6346 ?auto_6345 )
      ( GET-3IMAGE-VERIFY ?auto_6343 ?auto_6344 ?auto_6346 ?auto_6345 ?auto_6348 ?auto_6347 ) )
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
      ?auto_6397 - INSTRUMENT
      ?auto_6398 - SATELLITE
      ?auto_6396 - DIRECTION
      ?auto_6395 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6392 ?auto_6389 ) ) ( not ( = ?auto_6394 ?auto_6389 ) ) ( not ( = ?auto_6394 ?auto_6392 ) ) ( ON_BOARD ?auto_6397 ?auto_6398 ) ( SUPPORTS ?auto_6397 ?auto_6390 ) ( not ( = ?auto_6389 ?auto_6396 ) ) ( HAVE_IMAGE ?auto_6392 ?auto_6391 ) ( not ( = ?auto_6392 ?auto_6396 ) ) ( not ( = ?auto_6391 ?auto_6390 ) ) ( CALIBRATION_TARGET ?auto_6397 ?auto_6396 ) ( not ( = ?auto_6396 ?auto_6394 ) ) ( ON_BOARD ?auto_6395 ?auto_6398 ) ( not ( = ?auto_6397 ?auto_6395 ) ) ( SUPPORTS ?auto_6395 ?auto_6393 ) ( not ( = ?auto_6391 ?auto_6393 ) ) ( not ( = ?auto_6390 ?auto_6393 ) ) ( CALIBRATION_TARGET ?auto_6395 ?auto_6396 ) ( POWER_AVAIL ?auto_6398 ) ( POINTING ?auto_6398 ?auto_6392 ) )
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
      ?auto_6419 - INSTRUMENT
      ?auto_6420 - SATELLITE
      ?auto_6418 - DIRECTION
      ?auto_6417 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6414 ?auto_6411 ) ) ( not ( = ?auto_6416 ?auto_6411 ) ) ( not ( = ?auto_6416 ?auto_6414 ) ) ( ON_BOARD ?auto_6419 ?auto_6420 ) ( SUPPORTS ?auto_6419 ?auto_6412 ) ( not ( = ?auto_6411 ?auto_6418 ) ) ( HAVE_IMAGE ?auto_6416 ?auto_6415 ) ( not ( = ?auto_6416 ?auto_6418 ) ) ( not ( = ?auto_6415 ?auto_6412 ) ) ( CALIBRATION_TARGET ?auto_6419 ?auto_6418 ) ( not ( = ?auto_6418 ?auto_6414 ) ) ( ON_BOARD ?auto_6417 ?auto_6420 ) ( not ( = ?auto_6419 ?auto_6417 ) ) ( SUPPORTS ?auto_6417 ?auto_6413 ) ( not ( = ?auto_6415 ?auto_6413 ) ) ( not ( = ?auto_6412 ?auto_6413 ) ) ( CALIBRATION_TARGET ?auto_6417 ?auto_6418 ) ( POWER_AVAIL ?auto_6420 ) ( POINTING ?auto_6420 ?auto_6416 ) )
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
      ?auto_6492 - DIRECTION
      ?auto_6489 - INSTRUMENT
      ?auto_6490 - SATELLITE
      ?auto_6488 - DIRECTION
      ?auto_6491 - MODE
      ?auto_6487 - DIRECTION
      ?auto_6485 - INSTRUMENT
      ?auto_6486 - MODE
      ?auto_6493 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6483 ?auto_6492 ) ) ( ON_BOARD ?auto_6489 ?auto_6490 ) ( SUPPORTS ?auto_6489 ?auto_6484 ) ( not ( = ?auto_6483 ?auto_6488 ) ) ( HAVE_IMAGE ?auto_6492 ?auto_6491 ) ( not ( = ?auto_6492 ?auto_6488 ) ) ( not ( = ?auto_6491 ?auto_6484 ) ) ( CALIBRATION_TARGET ?auto_6489 ?auto_6488 ) ( not ( = ?auto_6488 ?auto_6487 ) ) ( not ( = ?auto_6483 ?auto_6487 ) ) ( not ( = ?auto_6492 ?auto_6487 ) ) ( ON_BOARD ?auto_6485 ?auto_6490 ) ( not ( = ?auto_6489 ?auto_6485 ) ) ( SUPPORTS ?auto_6485 ?auto_6486 ) ( not ( = ?auto_6491 ?auto_6486 ) ) ( not ( = ?auto_6484 ?auto_6486 ) ) ( CALIBRATION_TARGET ?auto_6485 ?auto_6488 ) ( POINTING ?auto_6490 ?auto_6492 ) ( ON_BOARD ?auto_6493 ?auto_6490 ) ( POWER_ON ?auto_6493 ) ( not ( = ?auto_6489 ?auto_6493 ) ) ( not ( = ?auto_6485 ?auto_6493 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_6493 ?auto_6490 )
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
      ?auto_6498 - INSTRUMENT
      ?auto_6501 - SATELLITE
      ?auto_6503 - DIRECTION
      ?auto_6499 - DIRECTION
      ?auto_6500 - INSTRUMENT
      ?auto_6504 - MODE
      ?auto_6502 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6497 ?auto_6494 ) ) ( ON_BOARD ?auto_6498 ?auto_6501 ) ( SUPPORTS ?auto_6498 ?auto_6496 ) ( not ( = ?auto_6497 ?auto_6503 ) ) ( HAVE_IMAGE ?auto_6494 ?auto_6495 ) ( not ( = ?auto_6494 ?auto_6503 ) ) ( not ( = ?auto_6495 ?auto_6496 ) ) ( CALIBRATION_TARGET ?auto_6498 ?auto_6503 ) ( not ( = ?auto_6503 ?auto_6499 ) ) ( not ( = ?auto_6497 ?auto_6499 ) ) ( not ( = ?auto_6494 ?auto_6499 ) ) ( ON_BOARD ?auto_6500 ?auto_6501 ) ( not ( = ?auto_6498 ?auto_6500 ) ) ( SUPPORTS ?auto_6500 ?auto_6504 ) ( not ( = ?auto_6495 ?auto_6504 ) ) ( not ( = ?auto_6496 ?auto_6504 ) ) ( CALIBRATION_TARGET ?auto_6500 ?auto_6503 ) ( POINTING ?auto_6501 ?auto_6494 ) ( ON_BOARD ?auto_6502 ?auto_6501 ) ( POWER_ON ?auto_6502 ) ( not ( = ?auto_6498 ?auto_6502 ) ) ( not ( = ?auto_6500 ?auto_6502 ) ) )
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
      ?auto_6515 - DIRECTION
      ?auto_6513 - INSTRUMENT
      ?auto_6510 - SATELLITE
      ?auto_6512 - DIRECTION
      ?auto_6514 - MODE
      ?auto_6511 - INSTRUMENT
      ?auto_6509 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6508 ?auto_6505 ) ) ( not ( = ?auto_6508 ?auto_6515 ) ) ( ON_BOARD ?auto_6513 ?auto_6510 ) ( SUPPORTS ?auto_6513 ?auto_6507 ) ( not ( = ?auto_6508 ?auto_6512 ) ) ( HAVE_IMAGE ?auto_6515 ?auto_6514 ) ( not ( = ?auto_6515 ?auto_6512 ) ) ( not ( = ?auto_6514 ?auto_6507 ) ) ( CALIBRATION_TARGET ?auto_6513 ?auto_6512 ) ( not ( = ?auto_6512 ?auto_6505 ) ) ( not ( = ?auto_6515 ?auto_6505 ) ) ( ON_BOARD ?auto_6511 ?auto_6510 ) ( not ( = ?auto_6513 ?auto_6511 ) ) ( SUPPORTS ?auto_6511 ?auto_6506 ) ( not ( = ?auto_6514 ?auto_6506 ) ) ( not ( = ?auto_6507 ?auto_6506 ) ) ( CALIBRATION_TARGET ?auto_6511 ?auto_6512 ) ( POINTING ?auto_6510 ?auto_6515 ) ( ON_BOARD ?auto_6509 ?auto_6510 ) ( POWER_ON ?auto_6509 ) ( not ( = ?auto_6513 ?auto_6509 ) ) ( not ( = ?auto_6511 ?auto_6509 ) ) )
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
      ?auto_6526 - INSTRUMENT
      ?auto_6521 - SATELLITE
      ?auto_6524 - DIRECTION
      ?auto_6523 - DIRECTION
      ?auto_6522 - INSTRUMENT
      ?auto_6525 - MODE
      ?auto_6520 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6519 ?auto_6516 ) ) ( ON_BOARD ?auto_6526 ?auto_6521 ) ( SUPPORTS ?auto_6526 ?auto_6517 ) ( not ( = ?auto_6516 ?auto_6524 ) ) ( HAVE_IMAGE ?auto_6519 ?auto_6518 ) ( not ( = ?auto_6519 ?auto_6524 ) ) ( not ( = ?auto_6518 ?auto_6517 ) ) ( CALIBRATION_TARGET ?auto_6526 ?auto_6524 ) ( not ( = ?auto_6524 ?auto_6523 ) ) ( not ( = ?auto_6516 ?auto_6523 ) ) ( not ( = ?auto_6519 ?auto_6523 ) ) ( ON_BOARD ?auto_6522 ?auto_6521 ) ( not ( = ?auto_6526 ?auto_6522 ) ) ( SUPPORTS ?auto_6522 ?auto_6525 ) ( not ( = ?auto_6518 ?auto_6525 ) ) ( not ( = ?auto_6517 ?auto_6525 ) ) ( CALIBRATION_TARGET ?auto_6522 ?auto_6524 ) ( POINTING ?auto_6521 ?auto_6519 ) ( ON_BOARD ?auto_6520 ?auto_6521 ) ( POWER_ON ?auto_6520 ) ( not ( = ?auto_6526 ?auto_6520 ) ) ( not ( = ?auto_6522 ?auto_6520 ) ) )
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
      ?auto_6537 - DIRECTION
      ?auto_6535 - INSTRUMENT
      ?auto_6532 - SATELLITE
      ?auto_6534 - DIRECTION
      ?auto_6536 - MODE
      ?auto_6533 - INSTRUMENT
      ?auto_6531 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6530 ?auto_6527 ) ) ( not ( = ?auto_6527 ?auto_6537 ) ) ( ON_BOARD ?auto_6535 ?auto_6532 ) ( SUPPORTS ?auto_6535 ?auto_6528 ) ( not ( = ?auto_6527 ?auto_6534 ) ) ( HAVE_IMAGE ?auto_6537 ?auto_6536 ) ( not ( = ?auto_6537 ?auto_6534 ) ) ( not ( = ?auto_6536 ?auto_6528 ) ) ( CALIBRATION_TARGET ?auto_6535 ?auto_6534 ) ( not ( = ?auto_6534 ?auto_6530 ) ) ( not ( = ?auto_6537 ?auto_6530 ) ) ( ON_BOARD ?auto_6533 ?auto_6532 ) ( not ( = ?auto_6535 ?auto_6533 ) ) ( SUPPORTS ?auto_6533 ?auto_6529 ) ( not ( = ?auto_6536 ?auto_6529 ) ) ( not ( = ?auto_6528 ?auto_6529 ) ) ( CALIBRATION_TARGET ?auto_6533 ?auto_6534 ) ( POINTING ?auto_6532 ?auto_6537 ) ( ON_BOARD ?auto_6531 ?auto_6532 ) ( POWER_ON ?auto_6531 ) ( not ( = ?auto_6535 ?auto_6531 ) ) ( not ( = ?auto_6533 ?auto_6531 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6537 ?auto_6536 ?auto_6527 ?auto_6528 )
      ( GET-2IMAGE-VERIFY ?auto_6527 ?auto_6528 ?auto_6530 ?auto_6529 ) )
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
      ?auto_6574 - INSTRUMENT
      ?auto_6571 - SATELLITE
      ?auto_6573 - DIRECTION
      ?auto_6572 - INSTRUMENT
      ?auto_6570 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6567 ?auto_6564 ) ) ( not ( = ?auto_6569 ?auto_6564 ) ) ( not ( = ?auto_6569 ?auto_6567 ) ) ( ON_BOARD ?auto_6574 ?auto_6571 ) ( SUPPORTS ?auto_6574 ?auto_6568 ) ( not ( = ?auto_6569 ?auto_6573 ) ) ( HAVE_IMAGE ?auto_6564 ?auto_6565 ) ( not ( = ?auto_6564 ?auto_6573 ) ) ( not ( = ?auto_6565 ?auto_6568 ) ) ( CALIBRATION_TARGET ?auto_6574 ?auto_6573 ) ( not ( = ?auto_6573 ?auto_6567 ) ) ( ON_BOARD ?auto_6572 ?auto_6571 ) ( not ( = ?auto_6574 ?auto_6572 ) ) ( SUPPORTS ?auto_6572 ?auto_6566 ) ( not ( = ?auto_6565 ?auto_6566 ) ) ( not ( = ?auto_6568 ?auto_6566 ) ) ( CALIBRATION_TARGET ?auto_6572 ?auto_6573 ) ( POINTING ?auto_6571 ?auto_6564 ) ( ON_BOARD ?auto_6570 ?auto_6571 ) ( POWER_ON ?auto_6570 ) ( not ( = ?auto_6574 ?auto_6570 ) ) ( not ( = ?auto_6572 ?auto_6570 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6564 ?auto_6565 ?auto_6569 ?auto_6568 )
      ( GET-3IMAGE-VERIFY ?auto_6564 ?auto_6565 ?auto_6567 ?auto_6566 ?auto_6569 ?auto_6568 ) )
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
      ?auto_6598 - INSTRUMENT
      ?auto_6595 - SATELLITE
      ?auto_6597 - DIRECTION
      ?auto_6596 - INSTRUMENT
      ?auto_6594 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6591 ?auto_6588 ) ) ( not ( = ?auto_6593 ?auto_6588 ) ) ( not ( = ?auto_6593 ?auto_6591 ) ) ( ON_BOARD ?auto_6598 ?auto_6595 ) ( SUPPORTS ?auto_6598 ?auto_6590 ) ( not ( = ?auto_6591 ?auto_6597 ) ) ( HAVE_IMAGE ?auto_6588 ?auto_6589 ) ( not ( = ?auto_6588 ?auto_6597 ) ) ( not ( = ?auto_6589 ?auto_6590 ) ) ( CALIBRATION_TARGET ?auto_6598 ?auto_6597 ) ( not ( = ?auto_6597 ?auto_6593 ) ) ( ON_BOARD ?auto_6596 ?auto_6595 ) ( not ( = ?auto_6598 ?auto_6596 ) ) ( SUPPORTS ?auto_6596 ?auto_6592 ) ( not ( = ?auto_6589 ?auto_6592 ) ) ( not ( = ?auto_6590 ?auto_6592 ) ) ( CALIBRATION_TARGET ?auto_6596 ?auto_6597 ) ( POINTING ?auto_6595 ?auto_6588 ) ( ON_BOARD ?auto_6594 ?auto_6595 ) ( POWER_ON ?auto_6594 ) ( not ( = ?auto_6598 ?auto_6594 ) ) ( not ( = ?auto_6596 ?auto_6594 ) ) )
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
      ?auto_6622 - INSTRUMENT
      ?auto_6619 - SATELLITE
      ?auto_6621 - DIRECTION
      ?auto_6620 - INSTRUMENT
      ?auto_6618 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6615 ?auto_6612 ) ) ( not ( = ?auto_6617 ?auto_6612 ) ) ( not ( = ?auto_6617 ?auto_6615 ) ) ( ON_BOARD ?auto_6622 ?auto_6619 ) ( SUPPORTS ?auto_6622 ?auto_6616 ) ( not ( = ?auto_6617 ?auto_6621 ) ) ( HAVE_IMAGE ?auto_6615 ?auto_6614 ) ( not ( = ?auto_6615 ?auto_6621 ) ) ( not ( = ?auto_6614 ?auto_6616 ) ) ( CALIBRATION_TARGET ?auto_6622 ?auto_6621 ) ( not ( = ?auto_6621 ?auto_6612 ) ) ( ON_BOARD ?auto_6620 ?auto_6619 ) ( not ( = ?auto_6622 ?auto_6620 ) ) ( SUPPORTS ?auto_6620 ?auto_6613 ) ( not ( = ?auto_6614 ?auto_6613 ) ) ( not ( = ?auto_6616 ?auto_6613 ) ) ( CALIBRATION_TARGET ?auto_6620 ?auto_6621 ) ( POINTING ?auto_6619 ?auto_6615 ) ( ON_BOARD ?auto_6618 ?auto_6619 ) ( POWER_ON ?auto_6618 ) ( not ( = ?auto_6622 ?auto_6618 ) ) ( not ( = ?auto_6620 ?auto_6618 ) ) )
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
      ?auto_6646 - INSTRUMENT
      ?auto_6643 - SATELLITE
      ?auto_6645 - DIRECTION
      ?auto_6644 - INSTRUMENT
      ?auto_6642 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6639 ?auto_6636 ) ) ( not ( = ?auto_6641 ?auto_6636 ) ) ( not ( = ?auto_6641 ?auto_6639 ) ) ( ON_BOARD ?auto_6646 ?auto_6643 ) ( SUPPORTS ?auto_6646 ?auto_6638 ) ( not ( = ?auto_6639 ?auto_6645 ) ) ( HAVE_IMAGE ?auto_6641 ?auto_6640 ) ( not ( = ?auto_6641 ?auto_6645 ) ) ( not ( = ?auto_6640 ?auto_6638 ) ) ( CALIBRATION_TARGET ?auto_6646 ?auto_6645 ) ( not ( = ?auto_6645 ?auto_6636 ) ) ( ON_BOARD ?auto_6644 ?auto_6643 ) ( not ( = ?auto_6646 ?auto_6644 ) ) ( SUPPORTS ?auto_6644 ?auto_6637 ) ( not ( = ?auto_6640 ?auto_6637 ) ) ( not ( = ?auto_6638 ?auto_6637 ) ) ( CALIBRATION_TARGET ?auto_6644 ?auto_6645 ) ( POINTING ?auto_6643 ?auto_6641 ) ( ON_BOARD ?auto_6642 ?auto_6643 ) ( POWER_ON ?auto_6642 ) ( not ( = ?auto_6646 ?auto_6642 ) ) ( not ( = ?auto_6644 ?auto_6642 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6641 ?auto_6640 ?auto_6639 ?auto_6638 )
      ( GET-3IMAGE-VERIFY ?auto_6636 ?auto_6637 ?auto_6639 ?auto_6638 ?auto_6641 ?auto_6640 ) )
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
      ?auto_6696 - INSTRUMENT
      ?auto_6693 - SATELLITE
      ?auto_6695 - DIRECTION
      ?auto_6694 - INSTRUMENT
      ?auto_6692 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6689 ?auto_6686 ) ) ( not ( = ?auto_6691 ?auto_6686 ) ) ( not ( = ?auto_6691 ?auto_6689 ) ) ( ON_BOARD ?auto_6696 ?auto_6693 ) ( SUPPORTS ?auto_6696 ?auto_6687 ) ( not ( = ?auto_6686 ?auto_6695 ) ) ( HAVE_IMAGE ?auto_6689 ?auto_6688 ) ( not ( = ?auto_6689 ?auto_6695 ) ) ( not ( = ?auto_6688 ?auto_6687 ) ) ( CALIBRATION_TARGET ?auto_6696 ?auto_6695 ) ( not ( = ?auto_6695 ?auto_6691 ) ) ( ON_BOARD ?auto_6694 ?auto_6693 ) ( not ( = ?auto_6696 ?auto_6694 ) ) ( SUPPORTS ?auto_6694 ?auto_6690 ) ( not ( = ?auto_6688 ?auto_6690 ) ) ( not ( = ?auto_6687 ?auto_6690 ) ) ( CALIBRATION_TARGET ?auto_6694 ?auto_6695 ) ( POINTING ?auto_6693 ?auto_6689 ) ( ON_BOARD ?auto_6692 ?auto_6693 ) ( POWER_ON ?auto_6692 ) ( not ( = ?auto_6696 ?auto_6692 ) ) ( not ( = ?auto_6694 ?auto_6692 ) ) )
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
      ?auto_6720 - INSTRUMENT
      ?auto_6717 - SATELLITE
      ?auto_6719 - DIRECTION
      ?auto_6718 - INSTRUMENT
      ?auto_6716 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6713 ?auto_6710 ) ) ( not ( = ?auto_6715 ?auto_6710 ) ) ( not ( = ?auto_6715 ?auto_6713 ) ) ( ON_BOARD ?auto_6720 ?auto_6717 ) ( SUPPORTS ?auto_6720 ?auto_6711 ) ( not ( = ?auto_6710 ?auto_6719 ) ) ( HAVE_IMAGE ?auto_6715 ?auto_6714 ) ( not ( = ?auto_6715 ?auto_6719 ) ) ( not ( = ?auto_6714 ?auto_6711 ) ) ( CALIBRATION_TARGET ?auto_6720 ?auto_6719 ) ( not ( = ?auto_6719 ?auto_6713 ) ) ( ON_BOARD ?auto_6718 ?auto_6717 ) ( not ( = ?auto_6720 ?auto_6718 ) ) ( SUPPORTS ?auto_6718 ?auto_6712 ) ( not ( = ?auto_6714 ?auto_6712 ) ) ( not ( = ?auto_6711 ?auto_6712 ) ) ( CALIBRATION_TARGET ?auto_6718 ?auto_6719 ) ( POINTING ?auto_6717 ?auto_6715 ) ( ON_BOARD ?auto_6716 ?auto_6717 ) ( POWER_ON ?auto_6716 ) ( not ( = ?auto_6720 ?auto_6716 ) ) ( not ( = ?auto_6718 ?auto_6716 ) ) )
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
      ?auto_6798 - DIRECTION
      ?auto_6796 - INSTRUMENT
      ?auto_6791 - SATELLITE
      ?auto_6794 - DIRECTION
      ?auto_6797 - MODE
      ?auto_6793 - DIRECTION
      ?auto_6792 - INSTRUMENT
      ?auto_6795 - MODE
      ?auto_6790 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6788 ?auto_6798 ) ) ( ON_BOARD ?auto_6796 ?auto_6791 ) ( SUPPORTS ?auto_6796 ?auto_6789 ) ( not ( = ?auto_6788 ?auto_6794 ) ) ( not ( = ?auto_6798 ?auto_6794 ) ) ( not ( = ?auto_6797 ?auto_6789 ) ) ( CALIBRATION_TARGET ?auto_6796 ?auto_6794 ) ( not ( = ?auto_6794 ?auto_6793 ) ) ( not ( = ?auto_6788 ?auto_6793 ) ) ( not ( = ?auto_6798 ?auto_6793 ) ) ( ON_BOARD ?auto_6792 ?auto_6791 ) ( not ( = ?auto_6796 ?auto_6792 ) ) ( SUPPORTS ?auto_6792 ?auto_6795 ) ( not ( = ?auto_6797 ?auto_6795 ) ) ( not ( = ?auto_6789 ?auto_6795 ) ) ( CALIBRATION_TARGET ?auto_6792 ?auto_6794 ) ( POINTING ?auto_6791 ?auto_6798 ) ( ON_BOARD ?auto_6790 ?auto_6791 ) ( POWER_ON ?auto_6790 ) ( not ( = ?auto_6796 ?auto_6790 ) ) ( not ( = ?auto_6792 ?auto_6790 ) ) ( CALIBRATED ?auto_6790 ) ( SUPPORTS ?auto_6790 ?auto_6797 ) )
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
      ?auto_6805 - INSTRUMENT
      ?auto_6807 - SATELLITE
      ?auto_6806 - DIRECTION
      ?auto_6803 - DIRECTION
      ?auto_6809 - INSTRUMENT
      ?auto_6808 - MODE
      ?auto_6804 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6802 ?auto_6799 ) ) ( ON_BOARD ?auto_6805 ?auto_6807 ) ( SUPPORTS ?auto_6805 ?auto_6801 ) ( not ( = ?auto_6802 ?auto_6806 ) ) ( not ( = ?auto_6799 ?auto_6806 ) ) ( not ( = ?auto_6800 ?auto_6801 ) ) ( CALIBRATION_TARGET ?auto_6805 ?auto_6806 ) ( not ( = ?auto_6806 ?auto_6803 ) ) ( not ( = ?auto_6802 ?auto_6803 ) ) ( not ( = ?auto_6799 ?auto_6803 ) ) ( ON_BOARD ?auto_6809 ?auto_6807 ) ( not ( = ?auto_6805 ?auto_6809 ) ) ( SUPPORTS ?auto_6809 ?auto_6808 ) ( not ( = ?auto_6800 ?auto_6808 ) ) ( not ( = ?auto_6801 ?auto_6808 ) ) ( CALIBRATION_TARGET ?auto_6809 ?auto_6806 ) ( POINTING ?auto_6807 ?auto_6799 ) ( ON_BOARD ?auto_6804 ?auto_6807 ) ( POWER_ON ?auto_6804 ) ( not ( = ?auto_6805 ?auto_6804 ) ) ( not ( = ?auto_6809 ?auto_6804 ) ) ( CALIBRATED ?auto_6804 ) ( SUPPORTS ?auto_6804 ?auto_6800 ) )
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
      ?auto_6820 - DIRECTION
      ?auto_6818 - INSTRUMENT
      ?auto_6814 - SATELLITE
      ?auto_6815 - DIRECTION
      ?auto_6819 - MODE
      ?auto_6817 - INSTRUMENT
      ?auto_6816 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6813 ?auto_6810 ) ) ( not ( = ?auto_6813 ?auto_6820 ) ) ( ON_BOARD ?auto_6818 ?auto_6814 ) ( SUPPORTS ?auto_6818 ?auto_6812 ) ( not ( = ?auto_6813 ?auto_6815 ) ) ( not ( = ?auto_6820 ?auto_6815 ) ) ( not ( = ?auto_6819 ?auto_6812 ) ) ( CALIBRATION_TARGET ?auto_6818 ?auto_6815 ) ( not ( = ?auto_6815 ?auto_6810 ) ) ( not ( = ?auto_6820 ?auto_6810 ) ) ( ON_BOARD ?auto_6817 ?auto_6814 ) ( not ( = ?auto_6818 ?auto_6817 ) ) ( SUPPORTS ?auto_6817 ?auto_6811 ) ( not ( = ?auto_6819 ?auto_6811 ) ) ( not ( = ?auto_6812 ?auto_6811 ) ) ( CALIBRATION_TARGET ?auto_6817 ?auto_6815 ) ( POINTING ?auto_6814 ?auto_6820 ) ( ON_BOARD ?auto_6816 ?auto_6814 ) ( POWER_ON ?auto_6816 ) ( not ( = ?auto_6818 ?auto_6816 ) ) ( not ( = ?auto_6817 ?auto_6816 ) ) ( CALIBRATED ?auto_6816 ) ( SUPPORTS ?auto_6816 ?auto_6819 ) )
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
      ?auto_6831 - INSTRUMENT
      ?auto_6826 - SATELLITE
      ?auto_6827 - DIRECTION
      ?auto_6825 - DIRECTION
      ?auto_6830 - INSTRUMENT
      ?auto_6829 - MODE
      ?auto_6828 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6824 ?auto_6821 ) ) ( ON_BOARD ?auto_6831 ?auto_6826 ) ( SUPPORTS ?auto_6831 ?auto_6822 ) ( not ( = ?auto_6821 ?auto_6827 ) ) ( not ( = ?auto_6824 ?auto_6827 ) ) ( not ( = ?auto_6823 ?auto_6822 ) ) ( CALIBRATION_TARGET ?auto_6831 ?auto_6827 ) ( not ( = ?auto_6827 ?auto_6825 ) ) ( not ( = ?auto_6821 ?auto_6825 ) ) ( not ( = ?auto_6824 ?auto_6825 ) ) ( ON_BOARD ?auto_6830 ?auto_6826 ) ( not ( = ?auto_6831 ?auto_6830 ) ) ( SUPPORTS ?auto_6830 ?auto_6829 ) ( not ( = ?auto_6823 ?auto_6829 ) ) ( not ( = ?auto_6822 ?auto_6829 ) ) ( CALIBRATION_TARGET ?auto_6830 ?auto_6827 ) ( POINTING ?auto_6826 ?auto_6824 ) ( ON_BOARD ?auto_6828 ?auto_6826 ) ( POWER_ON ?auto_6828 ) ( not ( = ?auto_6831 ?auto_6828 ) ) ( not ( = ?auto_6830 ?auto_6828 ) ) ( CALIBRATED ?auto_6828 ) ( SUPPORTS ?auto_6828 ?auto_6823 ) )
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
      ?auto_6842 - DIRECTION
      ?auto_6840 - INSTRUMENT
      ?auto_6836 - SATELLITE
      ?auto_6837 - DIRECTION
      ?auto_6841 - MODE
      ?auto_6839 - INSTRUMENT
      ?auto_6838 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6835 ?auto_6832 ) ) ( not ( = ?auto_6832 ?auto_6842 ) ) ( ON_BOARD ?auto_6840 ?auto_6836 ) ( SUPPORTS ?auto_6840 ?auto_6833 ) ( not ( = ?auto_6832 ?auto_6837 ) ) ( not ( = ?auto_6842 ?auto_6837 ) ) ( not ( = ?auto_6841 ?auto_6833 ) ) ( CALIBRATION_TARGET ?auto_6840 ?auto_6837 ) ( not ( = ?auto_6837 ?auto_6835 ) ) ( not ( = ?auto_6842 ?auto_6835 ) ) ( ON_BOARD ?auto_6839 ?auto_6836 ) ( not ( = ?auto_6840 ?auto_6839 ) ) ( SUPPORTS ?auto_6839 ?auto_6834 ) ( not ( = ?auto_6841 ?auto_6834 ) ) ( not ( = ?auto_6833 ?auto_6834 ) ) ( CALIBRATION_TARGET ?auto_6839 ?auto_6837 ) ( POINTING ?auto_6836 ?auto_6842 ) ( ON_BOARD ?auto_6838 ?auto_6836 ) ( POWER_ON ?auto_6838 ) ( not ( = ?auto_6840 ?auto_6838 ) ) ( not ( = ?auto_6839 ?auto_6838 ) ) ( CALIBRATED ?auto_6838 ) ( SUPPORTS ?auto_6838 ?auto_6841 ) )
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
      ?auto_6879 - INSTRUMENT
      ?auto_6875 - SATELLITE
      ?auto_6876 - DIRECTION
      ?auto_6878 - INSTRUMENT
      ?auto_6877 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6872 ?auto_6869 ) ) ( not ( = ?auto_6874 ?auto_6869 ) ) ( not ( = ?auto_6874 ?auto_6872 ) ) ( ON_BOARD ?auto_6879 ?auto_6875 ) ( SUPPORTS ?auto_6879 ?auto_6873 ) ( not ( = ?auto_6874 ?auto_6876 ) ) ( not ( = ?auto_6869 ?auto_6876 ) ) ( not ( = ?auto_6870 ?auto_6873 ) ) ( CALIBRATION_TARGET ?auto_6879 ?auto_6876 ) ( not ( = ?auto_6876 ?auto_6872 ) ) ( ON_BOARD ?auto_6878 ?auto_6875 ) ( not ( = ?auto_6879 ?auto_6878 ) ) ( SUPPORTS ?auto_6878 ?auto_6871 ) ( not ( = ?auto_6870 ?auto_6871 ) ) ( not ( = ?auto_6873 ?auto_6871 ) ) ( CALIBRATION_TARGET ?auto_6878 ?auto_6876 ) ( POINTING ?auto_6875 ?auto_6869 ) ( ON_BOARD ?auto_6877 ?auto_6875 ) ( POWER_ON ?auto_6877 ) ( not ( = ?auto_6879 ?auto_6877 ) ) ( not ( = ?auto_6878 ?auto_6877 ) ) ( CALIBRATED ?auto_6877 ) ( SUPPORTS ?auto_6877 ?auto_6870 ) )
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
      ?auto_6903 - INSTRUMENT
      ?auto_6899 - SATELLITE
      ?auto_6900 - DIRECTION
      ?auto_6902 - INSTRUMENT
      ?auto_6901 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6896 ?auto_6893 ) ) ( not ( = ?auto_6898 ?auto_6893 ) ) ( not ( = ?auto_6898 ?auto_6896 ) ) ( ON_BOARD ?auto_6903 ?auto_6899 ) ( SUPPORTS ?auto_6903 ?auto_6895 ) ( not ( = ?auto_6896 ?auto_6900 ) ) ( not ( = ?auto_6893 ?auto_6900 ) ) ( not ( = ?auto_6894 ?auto_6895 ) ) ( CALIBRATION_TARGET ?auto_6903 ?auto_6900 ) ( not ( = ?auto_6900 ?auto_6898 ) ) ( ON_BOARD ?auto_6902 ?auto_6899 ) ( not ( = ?auto_6903 ?auto_6902 ) ) ( SUPPORTS ?auto_6902 ?auto_6897 ) ( not ( = ?auto_6894 ?auto_6897 ) ) ( not ( = ?auto_6895 ?auto_6897 ) ) ( CALIBRATION_TARGET ?auto_6902 ?auto_6900 ) ( POINTING ?auto_6899 ?auto_6893 ) ( ON_BOARD ?auto_6901 ?auto_6899 ) ( POWER_ON ?auto_6901 ) ( not ( = ?auto_6903 ?auto_6901 ) ) ( not ( = ?auto_6902 ?auto_6901 ) ) ( CALIBRATED ?auto_6901 ) ( SUPPORTS ?auto_6901 ?auto_6894 ) )
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
      ?auto_6927 - INSTRUMENT
      ?auto_6923 - SATELLITE
      ?auto_6924 - DIRECTION
      ?auto_6926 - INSTRUMENT
      ?auto_6925 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6920 ?auto_6917 ) ) ( not ( = ?auto_6922 ?auto_6917 ) ) ( not ( = ?auto_6922 ?auto_6920 ) ) ( ON_BOARD ?auto_6927 ?auto_6923 ) ( SUPPORTS ?auto_6927 ?auto_6921 ) ( not ( = ?auto_6922 ?auto_6924 ) ) ( not ( = ?auto_6920 ?auto_6924 ) ) ( not ( = ?auto_6919 ?auto_6921 ) ) ( CALIBRATION_TARGET ?auto_6927 ?auto_6924 ) ( not ( = ?auto_6924 ?auto_6917 ) ) ( ON_BOARD ?auto_6926 ?auto_6923 ) ( not ( = ?auto_6927 ?auto_6926 ) ) ( SUPPORTS ?auto_6926 ?auto_6918 ) ( not ( = ?auto_6919 ?auto_6918 ) ) ( not ( = ?auto_6921 ?auto_6918 ) ) ( CALIBRATION_TARGET ?auto_6926 ?auto_6924 ) ( POINTING ?auto_6923 ?auto_6920 ) ( ON_BOARD ?auto_6925 ?auto_6923 ) ( POWER_ON ?auto_6925 ) ( not ( = ?auto_6927 ?auto_6925 ) ) ( not ( = ?auto_6926 ?auto_6925 ) ) ( CALIBRATED ?auto_6925 ) ( SUPPORTS ?auto_6925 ?auto_6919 ) )
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
      ?auto_6951 - INSTRUMENT
      ?auto_6947 - SATELLITE
      ?auto_6948 - DIRECTION
      ?auto_6950 - INSTRUMENT
      ?auto_6949 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6944 ?auto_6941 ) ) ( not ( = ?auto_6946 ?auto_6941 ) ) ( not ( = ?auto_6946 ?auto_6944 ) ) ( ON_BOARD ?auto_6951 ?auto_6947 ) ( SUPPORTS ?auto_6951 ?auto_6943 ) ( not ( = ?auto_6944 ?auto_6948 ) ) ( not ( = ?auto_6946 ?auto_6948 ) ) ( not ( = ?auto_6945 ?auto_6943 ) ) ( CALIBRATION_TARGET ?auto_6951 ?auto_6948 ) ( not ( = ?auto_6948 ?auto_6941 ) ) ( ON_BOARD ?auto_6950 ?auto_6947 ) ( not ( = ?auto_6951 ?auto_6950 ) ) ( SUPPORTS ?auto_6950 ?auto_6942 ) ( not ( = ?auto_6945 ?auto_6942 ) ) ( not ( = ?auto_6943 ?auto_6942 ) ) ( CALIBRATION_TARGET ?auto_6950 ?auto_6948 ) ( POINTING ?auto_6947 ?auto_6946 ) ( ON_BOARD ?auto_6949 ?auto_6947 ) ( POWER_ON ?auto_6949 ) ( not ( = ?auto_6951 ?auto_6949 ) ) ( not ( = ?auto_6950 ?auto_6949 ) ) ( CALIBRATED ?auto_6949 ) ( SUPPORTS ?auto_6949 ?auto_6945 ) )
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
      ?auto_7001 - INSTRUMENT
      ?auto_6997 - SATELLITE
      ?auto_6998 - DIRECTION
      ?auto_7000 - INSTRUMENT
      ?auto_6999 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6994 ?auto_6991 ) ) ( not ( = ?auto_6996 ?auto_6991 ) ) ( not ( = ?auto_6996 ?auto_6994 ) ) ( ON_BOARD ?auto_7001 ?auto_6997 ) ( SUPPORTS ?auto_7001 ?auto_6992 ) ( not ( = ?auto_6991 ?auto_6998 ) ) ( not ( = ?auto_6994 ?auto_6998 ) ) ( not ( = ?auto_6993 ?auto_6992 ) ) ( CALIBRATION_TARGET ?auto_7001 ?auto_6998 ) ( not ( = ?auto_6998 ?auto_6996 ) ) ( ON_BOARD ?auto_7000 ?auto_6997 ) ( not ( = ?auto_7001 ?auto_7000 ) ) ( SUPPORTS ?auto_7000 ?auto_6995 ) ( not ( = ?auto_6993 ?auto_6995 ) ) ( not ( = ?auto_6992 ?auto_6995 ) ) ( CALIBRATION_TARGET ?auto_7000 ?auto_6998 ) ( POINTING ?auto_6997 ?auto_6994 ) ( ON_BOARD ?auto_6999 ?auto_6997 ) ( POWER_ON ?auto_6999 ) ( not ( = ?auto_7001 ?auto_6999 ) ) ( not ( = ?auto_7000 ?auto_6999 ) ) ( CALIBRATED ?auto_6999 ) ( SUPPORTS ?auto_6999 ?auto_6993 ) )
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
      ?auto_7025 - INSTRUMENT
      ?auto_7021 - SATELLITE
      ?auto_7022 - DIRECTION
      ?auto_7024 - INSTRUMENT
      ?auto_7023 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7018 ?auto_7015 ) ) ( not ( = ?auto_7020 ?auto_7015 ) ) ( not ( = ?auto_7020 ?auto_7018 ) ) ( ON_BOARD ?auto_7025 ?auto_7021 ) ( SUPPORTS ?auto_7025 ?auto_7016 ) ( not ( = ?auto_7015 ?auto_7022 ) ) ( not ( = ?auto_7020 ?auto_7022 ) ) ( not ( = ?auto_7019 ?auto_7016 ) ) ( CALIBRATION_TARGET ?auto_7025 ?auto_7022 ) ( not ( = ?auto_7022 ?auto_7018 ) ) ( ON_BOARD ?auto_7024 ?auto_7021 ) ( not ( = ?auto_7025 ?auto_7024 ) ) ( SUPPORTS ?auto_7024 ?auto_7017 ) ( not ( = ?auto_7019 ?auto_7017 ) ) ( not ( = ?auto_7016 ?auto_7017 ) ) ( CALIBRATION_TARGET ?auto_7024 ?auto_7022 ) ( POINTING ?auto_7021 ?auto_7020 ) ( ON_BOARD ?auto_7023 ?auto_7021 ) ( POWER_ON ?auto_7023 ) ( not ( = ?auto_7025 ?auto_7023 ) ) ( not ( = ?auto_7024 ?auto_7023 ) ) ( CALIBRATED ?auto_7023 ) ( SUPPORTS ?auto_7023 ?auto_7019 ) )
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
      ?auto_7103 - DIRECTION
      ?auto_7101 - INSTRUMENT
      ?auto_7096 - SATELLITE
      ?auto_7097 - DIRECTION
      ?auto_7102 - MODE
      ?auto_7095 - DIRECTION
      ?auto_7100 - INSTRUMENT
      ?auto_7099 - MODE
      ?auto_7098 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7093 ?auto_7103 ) ) ( ON_BOARD ?auto_7101 ?auto_7096 ) ( SUPPORTS ?auto_7101 ?auto_7094 ) ( not ( = ?auto_7093 ?auto_7097 ) ) ( not ( = ?auto_7103 ?auto_7097 ) ) ( not ( = ?auto_7102 ?auto_7094 ) ) ( CALIBRATION_TARGET ?auto_7101 ?auto_7097 ) ( not ( = ?auto_7097 ?auto_7095 ) ) ( not ( = ?auto_7093 ?auto_7095 ) ) ( not ( = ?auto_7103 ?auto_7095 ) ) ( ON_BOARD ?auto_7100 ?auto_7096 ) ( not ( = ?auto_7101 ?auto_7100 ) ) ( SUPPORTS ?auto_7100 ?auto_7099 ) ( not ( = ?auto_7102 ?auto_7099 ) ) ( not ( = ?auto_7094 ?auto_7099 ) ) ( CALIBRATION_TARGET ?auto_7100 ?auto_7097 ) ( ON_BOARD ?auto_7098 ?auto_7096 ) ( POWER_ON ?auto_7098 ) ( not ( = ?auto_7101 ?auto_7098 ) ) ( not ( = ?auto_7100 ?auto_7098 ) ) ( CALIBRATED ?auto_7098 ) ( SUPPORTS ?auto_7098 ?auto_7102 ) ( POINTING ?auto_7096 ?auto_7097 ) )
    :subtasks
    ( ( !TURN_TO ?auto_7096 ?auto_7103 ?auto_7097 )
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
      ?auto_7109 - INSTRUMENT
      ?auto_7113 - SATELLITE
      ?auto_7111 - DIRECTION
      ?auto_7114 - DIRECTION
      ?auto_7110 - INSTRUMENT
      ?auto_7112 - MODE
      ?auto_7108 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7107 ?auto_7104 ) ) ( ON_BOARD ?auto_7109 ?auto_7113 ) ( SUPPORTS ?auto_7109 ?auto_7106 ) ( not ( = ?auto_7107 ?auto_7111 ) ) ( not ( = ?auto_7104 ?auto_7111 ) ) ( not ( = ?auto_7105 ?auto_7106 ) ) ( CALIBRATION_TARGET ?auto_7109 ?auto_7111 ) ( not ( = ?auto_7111 ?auto_7114 ) ) ( not ( = ?auto_7107 ?auto_7114 ) ) ( not ( = ?auto_7104 ?auto_7114 ) ) ( ON_BOARD ?auto_7110 ?auto_7113 ) ( not ( = ?auto_7109 ?auto_7110 ) ) ( SUPPORTS ?auto_7110 ?auto_7112 ) ( not ( = ?auto_7105 ?auto_7112 ) ) ( not ( = ?auto_7106 ?auto_7112 ) ) ( CALIBRATION_TARGET ?auto_7110 ?auto_7111 ) ( ON_BOARD ?auto_7108 ?auto_7113 ) ( POWER_ON ?auto_7108 ) ( not ( = ?auto_7109 ?auto_7108 ) ) ( not ( = ?auto_7110 ?auto_7108 ) ) ( CALIBRATED ?auto_7108 ) ( SUPPORTS ?auto_7108 ?auto_7105 ) ( POINTING ?auto_7113 ?auto_7111 ) )
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
      ?auto_7125 - DIRECTION
      ?auto_7122 - INSTRUMENT
      ?auto_7120 - SATELLITE
      ?auto_7123 - DIRECTION
      ?auto_7124 - MODE
      ?auto_7121 - INSTRUMENT
      ?auto_7119 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7118 ?auto_7115 ) ) ( not ( = ?auto_7118 ?auto_7125 ) ) ( ON_BOARD ?auto_7122 ?auto_7120 ) ( SUPPORTS ?auto_7122 ?auto_7117 ) ( not ( = ?auto_7118 ?auto_7123 ) ) ( not ( = ?auto_7125 ?auto_7123 ) ) ( not ( = ?auto_7124 ?auto_7117 ) ) ( CALIBRATION_TARGET ?auto_7122 ?auto_7123 ) ( not ( = ?auto_7123 ?auto_7115 ) ) ( not ( = ?auto_7125 ?auto_7115 ) ) ( ON_BOARD ?auto_7121 ?auto_7120 ) ( not ( = ?auto_7122 ?auto_7121 ) ) ( SUPPORTS ?auto_7121 ?auto_7116 ) ( not ( = ?auto_7124 ?auto_7116 ) ) ( not ( = ?auto_7117 ?auto_7116 ) ) ( CALIBRATION_TARGET ?auto_7121 ?auto_7123 ) ( ON_BOARD ?auto_7119 ?auto_7120 ) ( POWER_ON ?auto_7119 ) ( not ( = ?auto_7122 ?auto_7119 ) ) ( not ( = ?auto_7121 ?auto_7119 ) ) ( CALIBRATED ?auto_7119 ) ( SUPPORTS ?auto_7119 ?auto_7124 ) ( POINTING ?auto_7120 ?auto_7123 ) )
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
      ?auto_7135 - DIRECTION
      ?auto_7134 - DIRECTION
      ?auto_7132 - INSTRUMENT
      ?auto_7136 - MODE
      ?auto_7130 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7129 ?auto_7126 ) ) ( ON_BOARD ?auto_7133 ?auto_7131 ) ( SUPPORTS ?auto_7133 ?auto_7127 ) ( not ( = ?auto_7126 ?auto_7135 ) ) ( not ( = ?auto_7129 ?auto_7135 ) ) ( not ( = ?auto_7128 ?auto_7127 ) ) ( CALIBRATION_TARGET ?auto_7133 ?auto_7135 ) ( not ( = ?auto_7135 ?auto_7134 ) ) ( not ( = ?auto_7126 ?auto_7134 ) ) ( not ( = ?auto_7129 ?auto_7134 ) ) ( ON_BOARD ?auto_7132 ?auto_7131 ) ( not ( = ?auto_7133 ?auto_7132 ) ) ( SUPPORTS ?auto_7132 ?auto_7136 ) ( not ( = ?auto_7128 ?auto_7136 ) ) ( not ( = ?auto_7127 ?auto_7136 ) ) ( CALIBRATION_TARGET ?auto_7132 ?auto_7135 ) ( ON_BOARD ?auto_7130 ?auto_7131 ) ( POWER_ON ?auto_7130 ) ( not ( = ?auto_7133 ?auto_7130 ) ) ( not ( = ?auto_7132 ?auto_7130 ) ) ( CALIBRATED ?auto_7130 ) ( SUPPORTS ?auto_7130 ?auto_7128 ) ( POINTING ?auto_7131 ?auto_7135 ) )
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
      ?auto_7147 - DIRECTION
      ?auto_7144 - INSTRUMENT
      ?auto_7142 - SATELLITE
      ?auto_7145 - DIRECTION
      ?auto_7146 - MODE
      ?auto_7143 - INSTRUMENT
      ?auto_7141 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7140 ?auto_7137 ) ) ( not ( = ?auto_7137 ?auto_7147 ) ) ( ON_BOARD ?auto_7144 ?auto_7142 ) ( SUPPORTS ?auto_7144 ?auto_7138 ) ( not ( = ?auto_7137 ?auto_7145 ) ) ( not ( = ?auto_7147 ?auto_7145 ) ) ( not ( = ?auto_7146 ?auto_7138 ) ) ( CALIBRATION_TARGET ?auto_7144 ?auto_7145 ) ( not ( = ?auto_7145 ?auto_7140 ) ) ( not ( = ?auto_7147 ?auto_7140 ) ) ( ON_BOARD ?auto_7143 ?auto_7142 ) ( not ( = ?auto_7144 ?auto_7143 ) ) ( SUPPORTS ?auto_7143 ?auto_7139 ) ( not ( = ?auto_7146 ?auto_7139 ) ) ( not ( = ?auto_7138 ?auto_7139 ) ) ( CALIBRATION_TARGET ?auto_7143 ?auto_7145 ) ( ON_BOARD ?auto_7141 ?auto_7142 ) ( POWER_ON ?auto_7141 ) ( not ( = ?auto_7144 ?auto_7141 ) ) ( not ( = ?auto_7143 ?auto_7141 ) ) ( CALIBRATED ?auto_7141 ) ( SUPPORTS ?auto_7141 ?auto_7146 ) ( POINTING ?auto_7142 ?auto_7145 ) )
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
      ?auto_7183 - INSTRUMENT
      ?auto_7181 - SATELLITE
      ?auto_7184 - DIRECTION
      ?auto_7182 - INSTRUMENT
      ?auto_7180 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7177 ?auto_7174 ) ) ( not ( = ?auto_7179 ?auto_7174 ) ) ( not ( = ?auto_7179 ?auto_7177 ) ) ( ON_BOARD ?auto_7183 ?auto_7181 ) ( SUPPORTS ?auto_7183 ?auto_7178 ) ( not ( = ?auto_7179 ?auto_7184 ) ) ( not ( = ?auto_7174 ?auto_7184 ) ) ( not ( = ?auto_7175 ?auto_7178 ) ) ( CALIBRATION_TARGET ?auto_7183 ?auto_7184 ) ( not ( = ?auto_7184 ?auto_7177 ) ) ( ON_BOARD ?auto_7182 ?auto_7181 ) ( not ( = ?auto_7183 ?auto_7182 ) ) ( SUPPORTS ?auto_7182 ?auto_7176 ) ( not ( = ?auto_7175 ?auto_7176 ) ) ( not ( = ?auto_7178 ?auto_7176 ) ) ( CALIBRATION_TARGET ?auto_7182 ?auto_7184 ) ( ON_BOARD ?auto_7180 ?auto_7181 ) ( POWER_ON ?auto_7180 ) ( not ( = ?auto_7183 ?auto_7180 ) ) ( not ( = ?auto_7182 ?auto_7180 ) ) ( CALIBRATED ?auto_7180 ) ( SUPPORTS ?auto_7180 ?auto_7175 ) ( POINTING ?auto_7181 ?auto_7184 ) )
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
      ?auto_7207 - INSTRUMENT
      ?auto_7205 - SATELLITE
      ?auto_7208 - DIRECTION
      ?auto_7206 - INSTRUMENT
      ?auto_7204 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7201 ?auto_7198 ) ) ( not ( = ?auto_7203 ?auto_7198 ) ) ( not ( = ?auto_7203 ?auto_7201 ) ) ( ON_BOARD ?auto_7207 ?auto_7205 ) ( SUPPORTS ?auto_7207 ?auto_7200 ) ( not ( = ?auto_7201 ?auto_7208 ) ) ( not ( = ?auto_7198 ?auto_7208 ) ) ( not ( = ?auto_7199 ?auto_7200 ) ) ( CALIBRATION_TARGET ?auto_7207 ?auto_7208 ) ( not ( = ?auto_7208 ?auto_7203 ) ) ( ON_BOARD ?auto_7206 ?auto_7205 ) ( not ( = ?auto_7207 ?auto_7206 ) ) ( SUPPORTS ?auto_7206 ?auto_7202 ) ( not ( = ?auto_7199 ?auto_7202 ) ) ( not ( = ?auto_7200 ?auto_7202 ) ) ( CALIBRATION_TARGET ?auto_7206 ?auto_7208 ) ( ON_BOARD ?auto_7204 ?auto_7205 ) ( POWER_ON ?auto_7204 ) ( not ( = ?auto_7207 ?auto_7204 ) ) ( not ( = ?auto_7206 ?auto_7204 ) ) ( CALIBRATED ?auto_7204 ) ( SUPPORTS ?auto_7204 ?auto_7199 ) ( POINTING ?auto_7205 ?auto_7208 ) )
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
      ?auto_7231 - INSTRUMENT
      ?auto_7229 - SATELLITE
      ?auto_7232 - DIRECTION
      ?auto_7230 - INSTRUMENT
      ?auto_7228 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7225 ?auto_7222 ) ) ( not ( = ?auto_7227 ?auto_7222 ) ) ( not ( = ?auto_7227 ?auto_7225 ) ) ( ON_BOARD ?auto_7231 ?auto_7229 ) ( SUPPORTS ?auto_7231 ?auto_7226 ) ( not ( = ?auto_7227 ?auto_7232 ) ) ( not ( = ?auto_7225 ?auto_7232 ) ) ( not ( = ?auto_7224 ?auto_7226 ) ) ( CALIBRATION_TARGET ?auto_7231 ?auto_7232 ) ( not ( = ?auto_7232 ?auto_7222 ) ) ( ON_BOARD ?auto_7230 ?auto_7229 ) ( not ( = ?auto_7231 ?auto_7230 ) ) ( SUPPORTS ?auto_7230 ?auto_7223 ) ( not ( = ?auto_7224 ?auto_7223 ) ) ( not ( = ?auto_7226 ?auto_7223 ) ) ( CALIBRATION_TARGET ?auto_7230 ?auto_7232 ) ( ON_BOARD ?auto_7228 ?auto_7229 ) ( POWER_ON ?auto_7228 ) ( not ( = ?auto_7231 ?auto_7228 ) ) ( not ( = ?auto_7230 ?auto_7228 ) ) ( CALIBRATED ?auto_7228 ) ( SUPPORTS ?auto_7228 ?auto_7224 ) ( POINTING ?auto_7229 ?auto_7232 ) )
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
      ?auto_7255 - INSTRUMENT
      ?auto_7253 - SATELLITE
      ?auto_7256 - DIRECTION
      ?auto_7254 - INSTRUMENT
      ?auto_7252 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7249 ?auto_7246 ) ) ( not ( = ?auto_7251 ?auto_7246 ) ) ( not ( = ?auto_7251 ?auto_7249 ) ) ( ON_BOARD ?auto_7255 ?auto_7253 ) ( SUPPORTS ?auto_7255 ?auto_7248 ) ( not ( = ?auto_7249 ?auto_7256 ) ) ( not ( = ?auto_7251 ?auto_7256 ) ) ( not ( = ?auto_7250 ?auto_7248 ) ) ( CALIBRATION_TARGET ?auto_7255 ?auto_7256 ) ( not ( = ?auto_7256 ?auto_7246 ) ) ( ON_BOARD ?auto_7254 ?auto_7253 ) ( not ( = ?auto_7255 ?auto_7254 ) ) ( SUPPORTS ?auto_7254 ?auto_7247 ) ( not ( = ?auto_7250 ?auto_7247 ) ) ( not ( = ?auto_7248 ?auto_7247 ) ) ( CALIBRATION_TARGET ?auto_7254 ?auto_7256 ) ( ON_BOARD ?auto_7252 ?auto_7253 ) ( POWER_ON ?auto_7252 ) ( not ( = ?auto_7255 ?auto_7252 ) ) ( not ( = ?auto_7254 ?auto_7252 ) ) ( CALIBRATED ?auto_7252 ) ( SUPPORTS ?auto_7252 ?auto_7250 ) ( POINTING ?auto_7253 ?auto_7256 ) )
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
      ?auto_7305 - INSTRUMENT
      ?auto_7303 - SATELLITE
      ?auto_7306 - DIRECTION
      ?auto_7304 - INSTRUMENT
      ?auto_7302 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7299 ?auto_7296 ) ) ( not ( = ?auto_7301 ?auto_7296 ) ) ( not ( = ?auto_7301 ?auto_7299 ) ) ( ON_BOARD ?auto_7305 ?auto_7303 ) ( SUPPORTS ?auto_7305 ?auto_7297 ) ( not ( = ?auto_7296 ?auto_7306 ) ) ( not ( = ?auto_7299 ?auto_7306 ) ) ( not ( = ?auto_7298 ?auto_7297 ) ) ( CALIBRATION_TARGET ?auto_7305 ?auto_7306 ) ( not ( = ?auto_7306 ?auto_7301 ) ) ( ON_BOARD ?auto_7304 ?auto_7303 ) ( not ( = ?auto_7305 ?auto_7304 ) ) ( SUPPORTS ?auto_7304 ?auto_7300 ) ( not ( = ?auto_7298 ?auto_7300 ) ) ( not ( = ?auto_7297 ?auto_7300 ) ) ( CALIBRATION_TARGET ?auto_7304 ?auto_7306 ) ( ON_BOARD ?auto_7302 ?auto_7303 ) ( POWER_ON ?auto_7302 ) ( not ( = ?auto_7305 ?auto_7302 ) ) ( not ( = ?auto_7304 ?auto_7302 ) ) ( CALIBRATED ?auto_7302 ) ( SUPPORTS ?auto_7302 ?auto_7298 ) ( POINTING ?auto_7303 ?auto_7306 ) )
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
      ?auto_7329 - INSTRUMENT
      ?auto_7327 - SATELLITE
      ?auto_7330 - DIRECTION
      ?auto_7328 - INSTRUMENT
      ?auto_7326 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7323 ?auto_7320 ) ) ( not ( = ?auto_7325 ?auto_7320 ) ) ( not ( = ?auto_7325 ?auto_7323 ) ) ( ON_BOARD ?auto_7329 ?auto_7327 ) ( SUPPORTS ?auto_7329 ?auto_7321 ) ( not ( = ?auto_7320 ?auto_7330 ) ) ( not ( = ?auto_7325 ?auto_7330 ) ) ( not ( = ?auto_7324 ?auto_7321 ) ) ( CALIBRATION_TARGET ?auto_7329 ?auto_7330 ) ( not ( = ?auto_7330 ?auto_7323 ) ) ( ON_BOARD ?auto_7328 ?auto_7327 ) ( not ( = ?auto_7329 ?auto_7328 ) ) ( SUPPORTS ?auto_7328 ?auto_7322 ) ( not ( = ?auto_7324 ?auto_7322 ) ) ( not ( = ?auto_7321 ?auto_7322 ) ) ( CALIBRATION_TARGET ?auto_7328 ?auto_7330 ) ( ON_BOARD ?auto_7326 ?auto_7327 ) ( POWER_ON ?auto_7326 ) ( not ( = ?auto_7329 ?auto_7326 ) ) ( not ( = ?auto_7328 ?auto_7326 ) ) ( CALIBRATED ?auto_7326 ) ( SUPPORTS ?auto_7326 ?auto_7324 ) ( POINTING ?auto_7327 ?auto_7330 ) )
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
      ?auto_7408 - DIRECTION
      ?auto_7403 - INSTRUMENT
      ?auto_7401 - SATELLITE
      ?auto_7405 - DIRECTION
      ?auto_7407 - MODE
      ?auto_7404 - DIRECTION
      ?auto_7402 - INSTRUMENT
      ?auto_7406 - MODE
      ?auto_7400 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7398 ?auto_7408 ) ) ( ON_BOARD ?auto_7403 ?auto_7401 ) ( SUPPORTS ?auto_7403 ?auto_7399 ) ( not ( = ?auto_7398 ?auto_7405 ) ) ( not ( = ?auto_7408 ?auto_7405 ) ) ( not ( = ?auto_7407 ?auto_7399 ) ) ( CALIBRATION_TARGET ?auto_7403 ?auto_7405 ) ( not ( = ?auto_7405 ?auto_7404 ) ) ( not ( = ?auto_7398 ?auto_7404 ) ) ( not ( = ?auto_7408 ?auto_7404 ) ) ( ON_BOARD ?auto_7402 ?auto_7401 ) ( not ( = ?auto_7403 ?auto_7402 ) ) ( SUPPORTS ?auto_7402 ?auto_7406 ) ( not ( = ?auto_7407 ?auto_7406 ) ) ( not ( = ?auto_7399 ?auto_7406 ) ) ( CALIBRATION_TARGET ?auto_7402 ?auto_7405 ) ( ON_BOARD ?auto_7400 ?auto_7401 ) ( POWER_ON ?auto_7400 ) ( not ( = ?auto_7403 ?auto_7400 ) ) ( not ( = ?auto_7402 ?auto_7400 ) ) ( SUPPORTS ?auto_7400 ?auto_7407 ) ( POINTING ?auto_7401 ?auto_7405 ) ( CALIBRATION_TARGET ?auto_7400 ?auto_7405 ) ( NOT_CALIBRATED ?auto_7400 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_7401 ?auto_7400 ?auto_7405 )
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
      ?auto_7415 - INSTRUMENT
      ?auto_7414 - SATELLITE
      ?auto_7413 - DIRECTION
      ?auto_7419 - DIRECTION
      ?auto_7418 - INSTRUMENT
      ?auto_7417 - MODE
      ?auto_7416 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7412 ?auto_7409 ) ) ( ON_BOARD ?auto_7415 ?auto_7414 ) ( SUPPORTS ?auto_7415 ?auto_7411 ) ( not ( = ?auto_7412 ?auto_7413 ) ) ( not ( = ?auto_7409 ?auto_7413 ) ) ( not ( = ?auto_7410 ?auto_7411 ) ) ( CALIBRATION_TARGET ?auto_7415 ?auto_7413 ) ( not ( = ?auto_7413 ?auto_7419 ) ) ( not ( = ?auto_7412 ?auto_7419 ) ) ( not ( = ?auto_7409 ?auto_7419 ) ) ( ON_BOARD ?auto_7418 ?auto_7414 ) ( not ( = ?auto_7415 ?auto_7418 ) ) ( SUPPORTS ?auto_7418 ?auto_7417 ) ( not ( = ?auto_7410 ?auto_7417 ) ) ( not ( = ?auto_7411 ?auto_7417 ) ) ( CALIBRATION_TARGET ?auto_7418 ?auto_7413 ) ( ON_BOARD ?auto_7416 ?auto_7414 ) ( POWER_ON ?auto_7416 ) ( not ( = ?auto_7415 ?auto_7416 ) ) ( not ( = ?auto_7418 ?auto_7416 ) ) ( SUPPORTS ?auto_7416 ?auto_7410 ) ( POINTING ?auto_7414 ?auto_7413 ) ( CALIBRATION_TARGET ?auto_7416 ?auto_7413 ) ( NOT_CALIBRATED ?auto_7416 ) )
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
      ?auto_7430 - DIRECTION
      ?auto_7425 - INSTRUMENT
      ?auto_7428 - SATELLITE
      ?auto_7424 - DIRECTION
      ?auto_7429 - MODE
      ?auto_7427 - INSTRUMENT
      ?auto_7426 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7423 ?auto_7420 ) ) ( not ( = ?auto_7423 ?auto_7430 ) ) ( ON_BOARD ?auto_7425 ?auto_7428 ) ( SUPPORTS ?auto_7425 ?auto_7422 ) ( not ( = ?auto_7423 ?auto_7424 ) ) ( not ( = ?auto_7430 ?auto_7424 ) ) ( not ( = ?auto_7429 ?auto_7422 ) ) ( CALIBRATION_TARGET ?auto_7425 ?auto_7424 ) ( not ( = ?auto_7424 ?auto_7420 ) ) ( not ( = ?auto_7430 ?auto_7420 ) ) ( ON_BOARD ?auto_7427 ?auto_7428 ) ( not ( = ?auto_7425 ?auto_7427 ) ) ( SUPPORTS ?auto_7427 ?auto_7421 ) ( not ( = ?auto_7429 ?auto_7421 ) ) ( not ( = ?auto_7422 ?auto_7421 ) ) ( CALIBRATION_TARGET ?auto_7427 ?auto_7424 ) ( ON_BOARD ?auto_7426 ?auto_7428 ) ( POWER_ON ?auto_7426 ) ( not ( = ?auto_7425 ?auto_7426 ) ) ( not ( = ?auto_7427 ?auto_7426 ) ) ( SUPPORTS ?auto_7426 ?auto_7429 ) ( POINTING ?auto_7428 ?auto_7424 ) ( CALIBRATION_TARGET ?auto_7426 ?auto_7424 ) ( NOT_CALIBRATED ?auto_7426 ) )
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
      ?auto_7436 - INSTRUMENT
      ?auto_7440 - SATELLITE
      ?auto_7435 - DIRECTION
      ?auto_7441 - DIRECTION
      ?auto_7439 - INSTRUMENT
      ?auto_7437 - MODE
      ?auto_7438 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7434 ?auto_7431 ) ) ( ON_BOARD ?auto_7436 ?auto_7440 ) ( SUPPORTS ?auto_7436 ?auto_7432 ) ( not ( = ?auto_7431 ?auto_7435 ) ) ( not ( = ?auto_7434 ?auto_7435 ) ) ( not ( = ?auto_7433 ?auto_7432 ) ) ( CALIBRATION_TARGET ?auto_7436 ?auto_7435 ) ( not ( = ?auto_7435 ?auto_7441 ) ) ( not ( = ?auto_7431 ?auto_7441 ) ) ( not ( = ?auto_7434 ?auto_7441 ) ) ( ON_BOARD ?auto_7439 ?auto_7440 ) ( not ( = ?auto_7436 ?auto_7439 ) ) ( SUPPORTS ?auto_7439 ?auto_7437 ) ( not ( = ?auto_7433 ?auto_7437 ) ) ( not ( = ?auto_7432 ?auto_7437 ) ) ( CALIBRATION_TARGET ?auto_7439 ?auto_7435 ) ( ON_BOARD ?auto_7438 ?auto_7440 ) ( POWER_ON ?auto_7438 ) ( not ( = ?auto_7436 ?auto_7438 ) ) ( not ( = ?auto_7439 ?auto_7438 ) ) ( SUPPORTS ?auto_7438 ?auto_7433 ) ( POINTING ?auto_7440 ?auto_7435 ) ( CALIBRATION_TARGET ?auto_7438 ?auto_7435 ) ( NOT_CALIBRATED ?auto_7438 ) )
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
      ?auto_7452 - DIRECTION
      ?auto_7447 - INSTRUMENT
      ?auto_7450 - SATELLITE
      ?auto_7446 - DIRECTION
      ?auto_7451 - MODE
      ?auto_7449 - INSTRUMENT
      ?auto_7448 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7445 ?auto_7442 ) ) ( not ( = ?auto_7442 ?auto_7452 ) ) ( ON_BOARD ?auto_7447 ?auto_7450 ) ( SUPPORTS ?auto_7447 ?auto_7443 ) ( not ( = ?auto_7442 ?auto_7446 ) ) ( not ( = ?auto_7452 ?auto_7446 ) ) ( not ( = ?auto_7451 ?auto_7443 ) ) ( CALIBRATION_TARGET ?auto_7447 ?auto_7446 ) ( not ( = ?auto_7446 ?auto_7445 ) ) ( not ( = ?auto_7452 ?auto_7445 ) ) ( ON_BOARD ?auto_7449 ?auto_7450 ) ( not ( = ?auto_7447 ?auto_7449 ) ) ( SUPPORTS ?auto_7449 ?auto_7444 ) ( not ( = ?auto_7451 ?auto_7444 ) ) ( not ( = ?auto_7443 ?auto_7444 ) ) ( CALIBRATION_TARGET ?auto_7449 ?auto_7446 ) ( ON_BOARD ?auto_7448 ?auto_7450 ) ( POWER_ON ?auto_7448 ) ( not ( = ?auto_7447 ?auto_7448 ) ) ( not ( = ?auto_7449 ?auto_7448 ) ) ( SUPPORTS ?auto_7448 ?auto_7451 ) ( POINTING ?auto_7450 ?auto_7446 ) ( CALIBRATION_TARGET ?auto_7448 ?auto_7446 ) ( NOT_CALIBRATED ?auto_7448 ) )
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
      ?auto_7486 - INSTRUMENT
      ?auto_7489 - SATELLITE
      ?auto_7485 - DIRECTION
      ?auto_7488 - INSTRUMENT
      ?auto_7487 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7482 ?auto_7479 ) ) ( not ( = ?auto_7484 ?auto_7479 ) ) ( not ( = ?auto_7484 ?auto_7482 ) ) ( ON_BOARD ?auto_7486 ?auto_7489 ) ( SUPPORTS ?auto_7486 ?auto_7483 ) ( not ( = ?auto_7484 ?auto_7485 ) ) ( not ( = ?auto_7479 ?auto_7485 ) ) ( not ( = ?auto_7480 ?auto_7483 ) ) ( CALIBRATION_TARGET ?auto_7486 ?auto_7485 ) ( not ( = ?auto_7485 ?auto_7482 ) ) ( ON_BOARD ?auto_7488 ?auto_7489 ) ( not ( = ?auto_7486 ?auto_7488 ) ) ( SUPPORTS ?auto_7488 ?auto_7481 ) ( not ( = ?auto_7480 ?auto_7481 ) ) ( not ( = ?auto_7483 ?auto_7481 ) ) ( CALIBRATION_TARGET ?auto_7488 ?auto_7485 ) ( ON_BOARD ?auto_7487 ?auto_7489 ) ( POWER_ON ?auto_7487 ) ( not ( = ?auto_7486 ?auto_7487 ) ) ( not ( = ?auto_7488 ?auto_7487 ) ) ( SUPPORTS ?auto_7487 ?auto_7480 ) ( POINTING ?auto_7489 ?auto_7485 ) ( CALIBRATION_TARGET ?auto_7487 ?auto_7485 ) ( NOT_CALIBRATED ?auto_7487 ) )
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
      ?auto_7510 - INSTRUMENT
      ?auto_7513 - SATELLITE
      ?auto_7509 - DIRECTION
      ?auto_7512 - INSTRUMENT
      ?auto_7511 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7506 ?auto_7503 ) ) ( not ( = ?auto_7508 ?auto_7503 ) ) ( not ( = ?auto_7508 ?auto_7506 ) ) ( ON_BOARD ?auto_7510 ?auto_7513 ) ( SUPPORTS ?auto_7510 ?auto_7505 ) ( not ( = ?auto_7506 ?auto_7509 ) ) ( not ( = ?auto_7503 ?auto_7509 ) ) ( not ( = ?auto_7504 ?auto_7505 ) ) ( CALIBRATION_TARGET ?auto_7510 ?auto_7509 ) ( not ( = ?auto_7509 ?auto_7508 ) ) ( ON_BOARD ?auto_7512 ?auto_7513 ) ( not ( = ?auto_7510 ?auto_7512 ) ) ( SUPPORTS ?auto_7512 ?auto_7507 ) ( not ( = ?auto_7504 ?auto_7507 ) ) ( not ( = ?auto_7505 ?auto_7507 ) ) ( CALIBRATION_TARGET ?auto_7512 ?auto_7509 ) ( ON_BOARD ?auto_7511 ?auto_7513 ) ( POWER_ON ?auto_7511 ) ( not ( = ?auto_7510 ?auto_7511 ) ) ( not ( = ?auto_7512 ?auto_7511 ) ) ( SUPPORTS ?auto_7511 ?auto_7504 ) ( POINTING ?auto_7513 ?auto_7509 ) ( CALIBRATION_TARGET ?auto_7511 ?auto_7509 ) ( NOT_CALIBRATED ?auto_7511 ) )
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
      ?auto_7534 - INSTRUMENT
      ?auto_7537 - SATELLITE
      ?auto_7533 - DIRECTION
      ?auto_7536 - INSTRUMENT
      ?auto_7535 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7530 ?auto_7527 ) ) ( not ( = ?auto_7532 ?auto_7527 ) ) ( not ( = ?auto_7532 ?auto_7530 ) ) ( ON_BOARD ?auto_7534 ?auto_7537 ) ( SUPPORTS ?auto_7534 ?auto_7531 ) ( not ( = ?auto_7532 ?auto_7533 ) ) ( not ( = ?auto_7530 ?auto_7533 ) ) ( not ( = ?auto_7529 ?auto_7531 ) ) ( CALIBRATION_TARGET ?auto_7534 ?auto_7533 ) ( not ( = ?auto_7533 ?auto_7527 ) ) ( ON_BOARD ?auto_7536 ?auto_7537 ) ( not ( = ?auto_7534 ?auto_7536 ) ) ( SUPPORTS ?auto_7536 ?auto_7528 ) ( not ( = ?auto_7529 ?auto_7528 ) ) ( not ( = ?auto_7531 ?auto_7528 ) ) ( CALIBRATION_TARGET ?auto_7536 ?auto_7533 ) ( ON_BOARD ?auto_7535 ?auto_7537 ) ( POWER_ON ?auto_7535 ) ( not ( = ?auto_7534 ?auto_7535 ) ) ( not ( = ?auto_7536 ?auto_7535 ) ) ( SUPPORTS ?auto_7535 ?auto_7529 ) ( POINTING ?auto_7537 ?auto_7533 ) ( CALIBRATION_TARGET ?auto_7535 ?auto_7533 ) ( NOT_CALIBRATED ?auto_7535 ) )
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
      ?auto_7558 - INSTRUMENT
      ?auto_7561 - SATELLITE
      ?auto_7557 - DIRECTION
      ?auto_7560 - INSTRUMENT
      ?auto_7559 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7554 ?auto_7551 ) ) ( not ( = ?auto_7556 ?auto_7551 ) ) ( not ( = ?auto_7556 ?auto_7554 ) ) ( ON_BOARD ?auto_7558 ?auto_7561 ) ( SUPPORTS ?auto_7558 ?auto_7553 ) ( not ( = ?auto_7554 ?auto_7557 ) ) ( not ( = ?auto_7556 ?auto_7557 ) ) ( not ( = ?auto_7555 ?auto_7553 ) ) ( CALIBRATION_TARGET ?auto_7558 ?auto_7557 ) ( not ( = ?auto_7557 ?auto_7551 ) ) ( ON_BOARD ?auto_7560 ?auto_7561 ) ( not ( = ?auto_7558 ?auto_7560 ) ) ( SUPPORTS ?auto_7560 ?auto_7552 ) ( not ( = ?auto_7555 ?auto_7552 ) ) ( not ( = ?auto_7553 ?auto_7552 ) ) ( CALIBRATION_TARGET ?auto_7560 ?auto_7557 ) ( ON_BOARD ?auto_7559 ?auto_7561 ) ( POWER_ON ?auto_7559 ) ( not ( = ?auto_7558 ?auto_7559 ) ) ( not ( = ?auto_7560 ?auto_7559 ) ) ( SUPPORTS ?auto_7559 ?auto_7555 ) ( POINTING ?auto_7561 ?auto_7557 ) ( CALIBRATION_TARGET ?auto_7559 ?auto_7557 ) ( NOT_CALIBRATED ?auto_7559 ) )
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
      ?auto_7608 - INSTRUMENT
      ?auto_7611 - SATELLITE
      ?auto_7607 - DIRECTION
      ?auto_7610 - INSTRUMENT
      ?auto_7609 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7604 ?auto_7601 ) ) ( not ( = ?auto_7606 ?auto_7601 ) ) ( not ( = ?auto_7606 ?auto_7604 ) ) ( ON_BOARD ?auto_7608 ?auto_7611 ) ( SUPPORTS ?auto_7608 ?auto_7602 ) ( not ( = ?auto_7601 ?auto_7607 ) ) ( not ( = ?auto_7604 ?auto_7607 ) ) ( not ( = ?auto_7603 ?auto_7602 ) ) ( CALIBRATION_TARGET ?auto_7608 ?auto_7607 ) ( not ( = ?auto_7607 ?auto_7606 ) ) ( ON_BOARD ?auto_7610 ?auto_7611 ) ( not ( = ?auto_7608 ?auto_7610 ) ) ( SUPPORTS ?auto_7610 ?auto_7605 ) ( not ( = ?auto_7603 ?auto_7605 ) ) ( not ( = ?auto_7602 ?auto_7605 ) ) ( CALIBRATION_TARGET ?auto_7610 ?auto_7607 ) ( ON_BOARD ?auto_7609 ?auto_7611 ) ( POWER_ON ?auto_7609 ) ( not ( = ?auto_7608 ?auto_7609 ) ) ( not ( = ?auto_7610 ?auto_7609 ) ) ( SUPPORTS ?auto_7609 ?auto_7603 ) ( POINTING ?auto_7611 ?auto_7607 ) ( CALIBRATION_TARGET ?auto_7609 ?auto_7607 ) ( NOT_CALIBRATED ?auto_7609 ) )
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
      ?auto_7632 - INSTRUMENT
      ?auto_7635 - SATELLITE
      ?auto_7631 - DIRECTION
      ?auto_7634 - INSTRUMENT
      ?auto_7633 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7628 ?auto_7625 ) ) ( not ( = ?auto_7630 ?auto_7625 ) ) ( not ( = ?auto_7630 ?auto_7628 ) ) ( ON_BOARD ?auto_7632 ?auto_7635 ) ( SUPPORTS ?auto_7632 ?auto_7626 ) ( not ( = ?auto_7625 ?auto_7631 ) ) ( not ( = ?auto_7630 ?auto_7631 ) ) ( not ( = ?auto_7629 ?auto_7626 ) ) ( CALIBRATION_TARGET ?auto_7632 ?auto_7631 ) ( not ( = ?auto_7631 ?auto_7628 ) ) ( ON_BOARD ?auto_7634 ?auto_7635 ) ( not ( = ?auto_7632 ?auto_7634 ) ) ( SUPPORTS ?auto_7634 ?auto_7627 ) ( not ( = ?auto_7629 ?auto_7627 ) ) ( not ( = ?auto_7626 ?auto_7627 ) ) ( CALIBRATION_TARGET ?auto_7634 ?auto_7631 ) ( ON_BOARD ?auto_7633 ?auto_7635 ) ( POWER_ON ?auto_7633 ) ( not ( = ?auto_7632 ?auto_7633 ) ) ( not ( = ?auto_7634 ?auto_7633 ) ) ( SUPPORTS ?auto_7633 ?auto_7629 ) ( POINTING ?auto_7635 ?auto_7631 ) ( CALIBRATION_TARGET ?auto_7633 ?auto_7631 ) ( NOT_CALIBRATED ?auto_7633 ) )
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
      ?auto_7713 - DIRECTION
      ?auto_7706 - INSTRUMENT
      ?auto_7710 - SATELLITE
      ?auto_7705 - DIRECTION
      ?auto_7712 - MODE
      ?auto_7711 - DIRECTION
      ?auto_7709 - INSTRUMENT
      ?auto_7707 - MODE
      ?auto_7708 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7703 ?auto_7713 ) ) ( ON_BOARD ?auto_7706 ?auto_7710 ) ( SUPPORTS ?auto_7706 ?auto_7704 ) ( not ( = ?auto_7703 ?auto_7705 ) ) ( not ( = ?auto_7713 ?auto_7705 ) ) ( not ( = ?auto_7712 ?auto_7704 ) ) ( CALIBRATION_TARGET ?auto_7706 ?auto_7705 ) ( not ( = ?auto_7705 ?auto_7711 ) ) ( not ( = ?auto_7703 ?auto_7711 ) ) ( not ( = ?auto_7713 ?auto_7711 ) ) ( ON_BOARD ?auto_7709 ?auto_7710 ) ( not ( = ?auto_7706 ?auto_7709 ) ) ( SUPPORTS ?auto_7709 ?auto_7707 ) ( not ( = ?auto_7712 ?auto_7707 ) ) ( not ( = ?auto_7704 ?auto_7707 ) ) ( CALIBRATION_TARGET ?auto_7709 ?auto_7705 ) ( ON_BOARD ?auto_7708 ?auto_7710 ) ( not ( = ?auto_7706 ?auto_7708 ) ) ( not ( = ?auto_7709 ?auto_7708 ) ) ( SUPPORTS ?auto_7708 ?auto_7712 ) ( POINTING ?auto_7710 ?auto_7705 ) ( CALIBRATION_TARGET ?auto_7708 ?auto_7705 ) ( POWER_AVAIL ?auto_7710 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_7708 ?auto_7710 )
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
      ?auto_7721 - INSTRUMENT
      ?auto_7722 - SATELLITE
      ?auto_7723 - DIRECTION
      ?auto_7718 - DIRECTION
      ?auto_7720 - INSTRUMENT
      ?auto_7719 - MODE
      ?auto_7724 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7717 ?auto_7714 ) ) ( ON_BOARD ?auto_7721 ?auto_7722 ) ( SUPPORTS ?auto_7721 ?auto_7716 ) ( not ( = ?auto_7717 ?auto_7723 ) ) ( not ( = ?auto_7714 ?auto_7723 ) ) ( not ( = ?auto_7715 ?auto_7716 ) ) ( CALIBRATION_TARGET ?auto_7721 ?auto_7723 ) ( not ( = ?auto_7723 ?auto_7718 ) ) ( not ( = ?auto_7717 ?auto_7718 ) ) ( not ( = ?auto_7714 ?auto_7718 ) ) ( ON_BOARD ?auto_7720 ?auto_7722 ) ( not ( = ?auto_7721 ?auto_7720 ) ) ( SUPPORTS ?auto_7720 ?auto_7719 ) ( not ( = ?auto_7715 ?auto_7719 ) ) ( not ( = ?auto_7716 ?auto_7719 ) ) ( CALIBRATION_TARGET ?auto_7720 ?auto_7723 ) ( ON_BOARD ?auto_7724 ?auto_7722 ) ( not ( = ?auto_7721 ?auto_7724 ) ) ( not ( = ?auto_7720 ?auto_7724 ) ) ( SUPPORTS ?auto_7724 ?auto_7715 ) ( POINTING ?auto_7722 ?auto_7723 ) ( CALIBRATION_TARGET ?auto_7724 ?auto_7723 ) ( POWER_AVAIL ?auto_7722 ) )
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
      ?auto_7735 - DIRECTION
      ?auto_7731 - INSTRUMENT
      ?auto_7732 - SATELLITE
      ?auto_7729 - DIRECTION
      ?auto_7734 - MODE
      ?auto_7733 - INSTRUMENT
      ?auto_7730 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7728 ?auto_7725 ) ) ( not ( = ?auto_7728 ?auto_7735 ) ) ( ON_BOARD ?auto_7731 ?auto_7732 ) ( SUPPORTS ?auto_7731 ?auto_7727 ) ( not ( = ?auto_7728 ?auto_7729 ) ) ( not ( = ?auto_7735 ?auto_7729 ) ) ( not ( = ?auto_7734 ?auto_7727 ) ) ( CALIBRATION_TARGET ?auto_7731 ?auto_7729 ) ( not ( = ?auto_7729 ?auto_7725 ) ) ( not ( = ?auto_7735 ?auto_7725 ) ) ( ON_BOARD ?auto_7733 ?auto_7732 ) ( not ( = ?auto_7731 ?auto_7733 ) ) ( SUPPORTS ?auto_7733 ?auto_7726 ) ( not ( = ?auto_7734 ?auto_7726 ) ) ( not ( = ?auto_7727 ?auto_7726 ) ) ( CALIBRATION_TARGET ?auto_7733 ?auto_7729 ) ( ON_BOARD ?auto_7730 ?auto_7732 ) ( not ( = ?auto_7731 ?auto_7730 ) ) ( not ( = ?auto_7733 ?auto_7730 ) ) ( SUPPORTS ?auto_7730 ?auto_7734 ) ( POINTING ?auto_7732 ?auto_7729 ) ( CALIBRATION_TARGET ?auto_7730 ?auto_7729 ) ( POWER_AVAIL ?auto_7732 ) )
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
      ?auto_7744 - INSTRUMENT
      ?auto_7745 - SATELLITE
      ?auto_7740 - DIRECTION
      ?auto_7743 - DIRECTION
      ?auto_7746 - INSTRUMENT
      ?auto_7741 - MODE
      ?auto_7742 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7739 ?auto_7736 ) ) ( ON_BOARD ?auto_7744 ?auto_7745 ) ( SUPPORTS ?auto_7744 ?auto_7737 ) ( not ( = ?auto_7736 ?auto_7740 ) ) ( not ( = ?auto_7739 ?auto_7740 ) ) ( not ( = ?auto_7738 ?auto_7737 ) ) ( CALIBRATION_TARGET ?auto_7744 ?auto_7740 ) ( not ( = ?auto_7740 ?auto_7743 ) ) ( not ( = ?auto_7736 ?auto_7743 ) ) ( not ( = ?auto_7739 ?auto_7743 ) ) ( ON_BOARD ?auto_7746 ?auto_7745 ) ( not ( = ?auto_7744 ?auto_7746 ) ) ( SUPPORTS ?auto_7746 ?auto_7741 ) ( not ( = ?auto_7738 ?auto_7741 ) ) ( not ( = ?auto_7737 ?auto_7741 ) ) ( CALIBRATION_TARGET ?auto_7746 ?auto_7740 ) ( ON_BOARD ?auto_7742 ?auto_7745 ) ( not ( = ?auto_7744 ?auto_7742 ) ) ( not ( = ?auto_7746 ?auto_7742 ) ) ( SUPPORTS ?auto_7742 ?auto_7738 ) ( POINTING ?auto_7745 ?auto_7740 ) ( CALIBRATION_TARGET ?auto_7742 ?auto_7740 ) ( POWER_AVAIL ?auto_7745 ) )
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
      ?auto_7757 - DIRECTION
      ?auto_7753 - INSTRUMENT
      ?auto_7754 - SATELLITE
      ?auto_7751 - DIRECTION
      ?auto_7756 - MODE
      ?auto_7755 - INSTRUMENT
      ?auto_7752 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7750 ?auto_7747 ) ) ( not ( = ?auto_7747 ?auto_7757 ) ) ( ON_BOARD ?auto_7753 ?auto_7754 ) ( SUPPORTS ?auto_7753 ?auto_7748 ) ( not ( = ?auto_7747 ?auto_7751 ) ) ( not ( = ?auto_7757 ?auto_7751 ) ) ( not ( = ?auto_7756 ?auto_7748 ) ) ( CALIBRATION_TARGET ?auto_7753 ?auto_7751 ) ( not ( = ?auto_7751 ?auto_7750 ) ) ( not ( = ?auto_7757 ?auto_7750 ) ) ( ON_BOARD ?auto_7755 ?auto_7754 ) ( not ( = ?auto_7753 ?auto_7755 ) ) ( SUPPORTS ?auto_7755 ?auto_7749 ) ( not ( = ?auto_7756 ?auto_7749 ) ) ( not ( = ?auto_7748 ?auto_7749 ) ) ( CALIBRATION_TARGET ?auto_7755 ?auto_7751 ) ( ON_BOARD ?auto_7752 ?auto_7754 ) ( not ( = ?auto_7753 ?auto_7752 ) ) ( not ( = ?auto_7755 ?auto_7752 ) ) ( SUPPORTS ?auto_7752 ?auto_7756 ) ( POINTING ?auto_7754 ?auto_7751 ) ( CALIBRATION_TARGET ?auto_7752 ?auto_7751 ) ( POWER_AVAIL ?auto_7754 ) )
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
      ?auto_7793 - SATELLITE
      ?auto_7790 - DIRECTION
      ?auto_7794 - INSTRUMENT
      ?auto_7791 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7787 ?auto_7784 ) ) ( not ( = ?auto_7789 ?auto_7784 ) ) ( not ( = ?auto_7789 ?auto_7787 ) ) ( ON_BOARD ?auto_7792 ?auto_7793 ) ( SUPPORTS ?auto_7792 ?auto_7788 ) ( not ( = ?auto_7789 ?auto_7790 ) ) ( not ( = ?auto_7784 ?auto_7790 ) ) ( not ( = ?auto_7785 ?auto_7788 ) ) ( CALIBRATION_TARGET ?auto_7792 ?auto_7790 ) ( not ( = ?auto_7790 ?auto_7787 ) ) ( ON_BOARD ?auto_7794 ?auto_7793 ) ( not ( = ?auto_7792 ?auto_7794 ) ) ( SUPPORTS ?auto_7794 ?auto_7786 ) ( not ( = ?auto_7785 ?auto_7786 ) ) ( not ( = ?auto_7788 ?auto_7786 ) ) ( CALIBRATION_TARGET ?auto_7794 ?auto_7790 ) ( ON_BOARD ?auto_7791 ?auto_7793 ) ( not ( = ?auto_7792 ?auto_7791 ) ) ( not ( = ?auto_7794 ?auto_7791 ) ) ( SUPPORTS ?auto_7791 ?auto_7785 ) ( POINTING ?auto_7793 ?auto_7790 ) ( CALIBRATION_TARGET ?auto_7791 ?auto_7790 ) ( POWER_AVAIL ?auto_7793 ) )
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
      ?auto_7817 - SATELLITE
      ?auto_7814 - DIRECTION
      ?auto_7818 - INSTRUMENT
      ?auto_7815 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7811 ?auto_7808 ) ) ( not ( = ?auto_7813 ?auto_7808 ) ) ( not ( = ?auto_7813 ?auto_7811 ) ) ( ON_BOARD ?auto_7816 ?auto_7817 ) ( SUPPORTS ?auto_7816 ?auto_7810 ) ( not ( = ?auto_7811 ?auto_7814 ) ) ( not ( = ?auto_7808 ?auto_7814 ) ) ( not ( = ?auto_7809 ?auto_7810 ) ) ( CALIBRATION_TARGET ?auto_7816 ?auto_7814 ) ( not ( = ?auto_7814 ?auto_7813 ) ) ( ON_BOARD ?auto_7818 ?auto_7817 ) ( not ( = ?auto_7816 ?auto_7818 ) ) ( SUPPORTS ?auto_7818 ?auto_7812 ) ( not ( = ?auto_7809 ?auto_7812 ) ) ( not ( = ?auto_7810 ?auto_7812 ) ) ( CALIBRATION_TARGET ?auto_7818 ?auto_7814 ) ( ON_BOARD ?auto_7815 ?auto_7817 ) ( not ( = ?auto_7816 ?auto_7815 ) ) ( not ( = ?auto_7818 ?auto_7815 ) ) ( SUPPORTS ?auto_7815 ?auto_7809 ) ( POINTING ?auto_7817 ?auto_7814 ) ( CALIBRATION_TARGET ?auto_7815 ?auto_7814 ) ( POWER_AVAIL ?auto_7817 ) )
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
      ?auto_7841 - SATELLITE
      ?auto_7838 - DIRECTION
      ?auto_7842 - INSTRUMENT
      ?auto_7839 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7835 ?auto_7832 ) ) ( not ( = ?auto_7837 ?auto_7832 ) ) ( not ( = ?auto_7837 ?auto_7835 ) ) ( ON_BOARD ?auto_7840 ?auto_7841 ) ( SUPPORTS ?auto_7840 ?auto_7836 ) ( not ( = ?auto_7837 ?auto_7838 ) ) ( not ( = ?auto_7835 ?auto_7838 ) ) ( not ( = ?auto_7834 ?auto_7836 ) ) ( CALIBRATION_TARGET ?auto_7840 ?auto_7838 ) ( not ( = ?auto_7838 ?auto_7832 ) ) ( ON_BOARD ?auto_7842 ?auto_7841 ) ( not ( = ?auto_7840 ?auto_7842 ) ) ( SUPPORTS ?auto_7842 ?auto_7833 ) ( not ( = ?auto_7834 ?auto_7833 ) ) ( not ( = ?auto_7836 ?auto_7833 ) ) ( CALIBRATION_TARGET ?auto_7842 ?auto_7838 ) ( ON_BOARD ?auto_7839 ?auto_7841 ) ( not ( = ?auto_7840 ?auto_7839 ) ) ( not ( = ?auto_7842 ?auto_7839 ) ) ( SUPPORTS ?auto_7839 ?auto_7834 ) ( POINTING ?auto_7841 ?auto_7838 ) ( CALIBRATION_TARGET ?auto_7839 ?auto_7838 ) ( POWER_AVAIL ?auto_7841 ) )
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
      ?auto_7865 - SATELLITE
      ?auto_7862 - DIRECTION
      ?auto_7866 - INSTRUMENT
      ?auto_7863 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7859 ?auto_7856 ) ) ( not ( = ?auto_7861 ?auto_7856 ) ) ( not ( = ?auto_7861 ?auto_7859 ) ) ( ON_BOARD ?auto_7864 ?auto_7865 ) ( SUPPORTS ?auto_7864 ?auto_7858 ) ( not ( = ?auto_7859 ?auto_7862 ) ) ( not ( = ?auto_7861 ?auto_7862 ) ) ( not ( = ?auto_7860 ?auto_7858 ) ) ( CALIBRATION_TARGET ?auto_7864 ?auto_7862 ) ( not ( = ?auto_7862 ?auto_7856 ) ) ( ON_BOARD ?auto_7866 ?auto_7865 ) ( not ( = ?auto_7864 ?auto_7866 ) ) ( SUPPORTS ?auto_7866 ?auto_7857 ) ( not ( = ?auto_7860 ?auto_7857 ) ) ( not ( = ?auto_7858 ?auto_7857 ) ) ( CALIBRATION_TARGET ?auto_7866 ?auto_7862 ) ( ON_BOARD ?auto_7863 ?auto_7865 ) ( not ( = ?auto_7864 ?auto_7863 ) ) ( not ( = ?auto_7866 ?auto_7863 ) ) ( SUPPORTS ?auto_7863 ?auto_7860 ) ( POINTING ?auto_7865 ?auto_7862 ) ( CALIBRATION_TARGET ?auto_7863 ?auto_7862 ) ( POWER_AVAIL ?auto_7865 ) )
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
      ?auto_7915 - SATELLITE
      ?auto_7912 - DIRECTION
      ?auto_7916 - INSTRUMENT
      ?auto_7913 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7909 ?auto_7906 ) ) ( not ( = ?auto_7911 ?auto_7906 ) ) ( not ( = ?auto_7911 ?auto_7909 ) ) ( ON_BOARD ?auto_7914 ?auto_7915 ) ( SUPPORTS ?auto_7914 ?auto_7907 ) ( not ( = ?auto_7906 ?auto_7912 ) ) ( not ( = ?auto_7909 ?auto_7912 ) ) ( not ( = ?auto_7908 ?auto_7907 ) ) ( CALIBRATION_TARGET ?auto_7914 ?auto_7912 ) ( not ( = ?auto_7912 ?auto_7911 ) ) ( ON_BOARD ?auto_7916 ?auto_7915 ) ( not ( = ?auto_7914 ?auto_7916 ) ) ( SUPPORTS ?auto_7916 ?auto_7910 ) ( not ( = ?auto_7908 ?auto_7910 ) ) ( not ( = ?auto_7907 ?auto_7910 ) ) ( CALIBRATION_TARGET ?auto_7916 ?auto_7912 ) ( ON_BOARD ?auto_7913 ?auto_7915 ) ( not ( = ?auto_7914 ?auto_7913 ) ) ( not ( = ?auto_7916 ?auto_7913 ) ) ( SUPPORTS ?auto_7913 ?auto_7908 ) ( POINTING ?auto_7915 ?auto_7912 ) ( CALIBRATION_TARGET ?auto_7913 ?auto_7912 ) ( POWER_AVAIL ?auto_7915 ) )
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
      ?auto_7939 - SATELLITE
      ?auto_7936 - DIRECTION
      ?auto_7940 - INSTRUMENT
      ?auto_7937 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_7933 ?auto_7930 ) ) ( not ( = ?auto_7935 ?auto_7930 ) ) ( not ( = ?auto_7935 ?auto_7933 ) ) ( ON_BOARD ?auto_7938 ?auto_7939 ) ( SUPPORTS ?auto_7938 ?auto_7931 ) ( not ( = ?auto_7930 ?auto_7936 ) ) ( not ( = ?auto_7935 ?auto_7936 ) ) ( not ( = ?auto_7934 ?auto_7931 ) ) ( CALIBRATION_TARGET ?auto_7938 ?auto_7936 ) ( not ( = ?auto_7936 ?auto_7933 ) ) ( ON_BOARD ?auto_7940 ?auto_7939 ) ( not ( = ?auto_7938 ?auto_7940 ) ) ( SUPPORTS ?auto_7940 ?auto_7932 ) ( not ( = ?auto_7934 ?auto_7932 ) ) ( not ( = ?auto_7931 ?auto_7932 ) ) ( CALIBRATION_TARGET ?auto_7940 ?auto_7936 ) ( ON_BOARD ?auto_7937 ?auto_7939 ) ( not ( = ?auto_7938 ?auto_7937 ) ) ( not ( = ?auto_7940 ?auto_7937 ) ) ( SUPPORTS ?auto_7937 ?auto_7934 ) ( POINTING ?auto_7939 ?auto_7936 ) ( CALIBRATION_TARGET ?auto_7937 ?auto_7936 ) ( POWER_AVAIL ?auto_7939 ) )
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
      ?auto_8018 - DIRECTION
      ?auto_8014 - INSTRUMENT
      ?auto_8015 - SATELLITE
      ?auto_8010 - DIRECTION
      ?auto_8017 - MODE
      ?auto_8013 - DIRECTION
      ?auto_8016 - INSTRUMENT
      ?auto_8011 - MODE
      ?auto_8012 - INSTRUMENT
      ?auto_8019 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_8008 ?auto_8018 ) ) ( ON_BOARD ?auto_8014 ?auto_8015 ) ( SUPPORTS ?auto_8014 ?auto_8009 ) ( not ( = ?auto_8008 ?auto_8010 ) ) ( not ( = ?auto_8018 ?auto_8010 ) ) ( not ( = ?auto_8017 ?auto_8009 ) ) ( CALIBRATION_TARGET ?auto_8014 ?auto_8010 ) ( not ( = ?auto_8010 ?auto_8013 ) ) ( not ( = ?auto_8008 ?auto_8013 ) ) ( not ( = ?auto_8018 ?auto_8013 ) ) ( ON_BOARD ?auto_8016 ?auto_8015 ) ( not ( = ?auto_8014 ?auto_8016 ) ) ( SUPPORTS ?auto_8016 ?auto_8011 ) ( not ( = ?auto_8017 ?auto_8011 ) ) ( not ( = ?auto_8009 ?auto_8011 ) ) ( CALIBRATION_TARGET ?auto_8016 ?auto_8010 ) ( ON_BOARD ?auto_8012 ?auto_8015 ) ( not ( = ?auto_8014 ?auto_8012 ) ) ( not ( = ?auto_8016 ?auto_8012 ) ) ( SUPPORTS ?auto_8012 ?auto_8017 ) ( CALIBRATION_TARGET ?auto_8012 ?auto_8010 ) ( POWER_AVAIL ?auto_8015 ) ( POINTING ?auto_8015 ?auto_8019 ) ( not ( = ?auto_8010 ?auto_8019 ) ) ( not ( = ?auto_8008 ?auto_8019 ) ) ( not ( = ?auto_8018 ?auto_8019 ) ) ( not ( = ?auto_8013 ?auto_8019 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_8015 ?auto_8010 ?auto_8019 )
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
      ?auto_8024 - INSTRUMENT
      ?auto_8025 - SATELLITE
      ?auto_8031 - DIRECTION
      ?auto_8026 - DIRECTION
      ?auto_8029 - INSTRUMENT
      ?auto_8028 - MODE
      ?auto_8030 - INSTRUMENT
      ?auto_8027 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_8023 ?auto_8020 ) ) ( ON_BOARD ?auto_8024 ?auto_8025 ) ( SUPPORTS ?auto_8024 ?auto_8022 ) ( not ( = ?auto_8023 ?auto_8031 ) ) ( not ( = ?auto_8020 ?auto_8031 ) ) ( not ( = ?auto_8021 ?auto_8022 ) ) ( CALIBRATION_TARGET ?auto_8024 ?auto_8031 ) ( not ( = ?auto_8031 ?auto_8026 ) ) ( not ( = ?auto_8023 ?auto_8026 ) ) ( not ( = ?auto_8020 ?auto_8026 ) ) ( ON_BOARD ?auto_8029 ?auto_8025 ) ( not ( = ?auto_8024 ?auto_8029 ) ) ( SUPPORTS ?auto_8029 ?auto_8028 ) ( not ( = ?auto_8021 ?auto_8028 ) ) ( not ( = ?auto_8022 ?auto_8028 ) ) ( CALIBRATION_TARGET ?auto_8029 ?auto_8031 ) ( ON_BOARD ?auto_8030 ?auto_8025 ) ( not ( = ?auto_8024 ?auto_8030 ) ) ( not ( = ?auto_8029 ?auto_8030 ) ) ( SUPPORTS ?auto_8030 ?auto_8021 ) ( CALIBRATION_TARGET ?auto_8030 ?auto_8031 ) ( POWER_AVAIL ?auto_8025 ) ( POINTING ?auto_8025 ?auto_8027 ) ( not ( = ?auto_8031 ?auto_8027 ) ) ( not ( = ?auto_8023 ?auto_8027 ) ) ( not ( = ?auto_8020 ?auto_8027 ) ) ( not ( = ?auto_8026 ?auto_8027 ) ) )
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
      ?auto_8043 - DIRECTION
      ?auto_8039 - INSTRUMENT
      ?auto_8038 - SATELLITE
      ?auto_8037 - DIRECTION
      ?auto_8042 - MODE
      ?auto_8041 - INSTRUMENT
      ?auto_8040 - INSTRUMENT
      ?auto_8036 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_8035 ?auto_8032 ) ) ( not ( = ?auto_8035 ?auto_8043 ) ) ( ON_BOARD ?auto_8039 ?auto_8038 ) ( SUPPORTS ?auto_8039 ?auto_8034 ) ( not ( = ?auto_8035 ?auto_8037 ) ) ( not ( = ?auto_8043 ?auto_8037 ) ) ( not ( = ?auto_8042 ?auto_8034 ) ) ( CALIBRATION_TARGET ?auto_8039 ?auto_8037 ) ( not ( = ?auto_8037 ?auto_8032 ) ) ( not ( = ?auto_8043 ?auto_8032 ) ) ( ON_BOARD ?auto_8041 ?auto_8038 ) ( not ( = ?auto_8039 ?auto_8041 ) ) ( SUPPORTS ?auto_8041 ?auto_8033 ) ( not ( = ?auto_8042 ?auto_8033 ) ) ( not ( = ?auto_8034 ?auto_8033 ) ) ( CALIBRATION_TARGET ?auto_8041 ?auto_8037 ) ( ON_BOARD ?auto_8040 ?auto_8038 ) ( not ( = ?auto_8039 ?auto_8040 ) ) ( not ( = ?auto_8041 ?auto_8040 ) ) ( SUPPORTS ?auto_8040 ?auto_8042 ) ( CALIBRATION_TARGET ?auto_8040 ?auto_8037 ) ( POWER_AVAIL ?auto_8038 ) ( POINTING ?auto_8038 ?auto_8036 ) ( not ( = ?auto_8037 ?auto_8036 ) ) ( not ( = ?auto_8035 ?auto_8036 ) ) ( not ( = ?auto_8043 ?auto_8036 ) ) ( not ( = ?auto_8032 ?auto_8036 ) ) )
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
      ?auto_8052 - INSTRUMENT
      ?auto_8051 - SATELLITE
      ?auto_8050 - DIRECTION
      ?auto_8048 - DIRECTION
      ?auto_8055 - INSTRUMENT
      ?auto_8053 - MODE
      ?auto_8054 - INSTRUMENT
      ?auto_8049 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_8047 ?auto_8044 ) ) ( ON_BOARD ?auto_8052 ?auto_8051 ) ( SUPPORTS ?auto_8052 ?auto_8045 ) ( not ( = ?auto_8044 ?auto_8050 ) ) ( not ( = ?auto_8047 ?auto_8050 ) ) ( not ( = ?auto_8046 ?auto_8045 ) ) ( CALIBRATION_TARGET ?auto_8052 ?auto_8050 ) ( not ( = ?auto_8050 ?auto_8048 ) ) ( not ( = ?auto_8044 ?auto_8048 ) ) ( not ( = ?auto_8047 ?auto_8048 ) ) ( ON_BOARD ?auto_8055 ?auto_8051 ) ( not ( = ?auto_8052 ?auto_8055 ) ) ( SUPPORTS ?auto_8055 ?auto_8053 ) ( not ( = ?auto_8046 ?auto_8053 ) ) ( not ( = ?auto_8045 ?auto_8053 ) ) ( CALIBRATION_TARGET ?auto_8055 ?auto_8050 ) ( ON_BOARD ?auto_8054 ?auto_8051 ) ( not ( = ?auto_8052 ?auto_8054 ) ) ( not ( = ?auto_8055 ?auto_8054 ) ) ( SUPPORTS ?auto_8054 ?auto_8046 ) ( CALIBRATION_TARGET ?auto_8054 ?auto_8050 ) ( POWER_AVAIL ?auto_8051 ) ( POINTING ?auto_8051 ?auto_8049 ) ( not ( = ?auto_8050 ?auto_8049 ) ) ( not ( = ?auto_8044 ?auto_8049 ) ) ( not ( = ?auto_8047 ?auto_8049 ) ) ( not ( = ?auto_8048 ?auto_8049 ) ) )
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
      ?auto_8067 - DIRECTION
      ?auto_8063 - INSTRUMENT
      ?auto_8062 - SATELLITE
      ?auto_8061 - DIRECTION
      ?auto_8066 - MODE
      ?auto_8065 - INSTRUMENT
      ?auto_8064 - INSTRUMENT
      ?auto_8060 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_8059 ?auto_8056 ) ) ( not ( = ?auto_8056 ?auto_8067 ) ) ( ON_BOARD ?auto_8063 ?auto_8062 ) ( SUPPORTS ?auto_8063 ?auto_8057 ) ( not ( = ?auto_8056 ?auto_8061 ) ) ( not ( = ?auto_8067 ?auto_8061 ) ) ( not ( = ?auto_8066 ?auto_8057 ) ) ( CALIBRATION_TARGET ?auto_8063 ?auto_8061 ) ( not ( = ?auto_8061 ?auto_8059 ) ) ( not ( = ?auto_8067 ?auto_8059 ) ) ( ON_BOARD ?auto_8065 ?auto_8062 ) ( not ( = ?auto_8063 ?auto_8065 ) ) ( SUPPORTS ?auto_8065 ?auto_8058 ) ( not ( = ?auto_8066 ?auto_8058 ) ) ( not ( = ?auto_8057 ?auto_8058 ) ) ( CALIBRATION_TARGET ?auto_8065 ?auto_8061 ) ( ON_BOARD ?auto_8064 ?auto_8062 ) ( not ( = ?auto_8063 ?auto_8064 ) ) ( not ( = ?auto_8065 ?auto_8064 ) ) ( SUPPORTS ?auto_8064 ?auto_8066 ) ( CALIBRATION_TARGET ?auto_8064 ?auto_8061 ) ( POWER_AVAIL ?auto_8062 ) ( POINTING ?auto_8062 ?auto_8060 ) ( not ( = ?auto_8061 ?auto_8060 ) ) ( not ( = ?auto_8056 ?auto_8060 ) ) ( not ( = ?auto_8067 ?auto_8060 ) ) ( not ( = ?auto_8059 ?auto_8060 ) ) )
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
      ?auto_8105 - INSTRUMENT
      ?auto_8104 - SATELLITE
      ?auto_8103 - DIRECTION
      ?auto_8107 - INSTRUMENT
      ?auto_8106 - INSTRUMENT
      ?auto_8102 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_8099 ?auto_8096 ) ) ( not ( = ?auto_8101 ?auto_8096 ) ) ( not ( = ?auto_8101 ?auto_8099 ) ) ( ON_BOARD ?auto_8105 ?auto_8104 ) ( SUPPORTS ?auto_8105 ?auto_8100 ) ( not ( = ?auto_8101 ?auto_8103 ) ) ( not ( = ?auto_8096 ?auto_8103 ) ) ( not ( = ?auto_8097 ?auto_8100 ) ) ( CALIBRATION_TARGET ?auto_8105 ?auto_8103 ) ( not ( = ?auto_8103 ?auto_8099 ) ) ( ON_BOARD ?auto_8107 ?auto_8104 ) ( not ( = ?auto_8105 ?auto_8107 ) ) ( SUPPORTS ?auto_8107 ?auto_8098 ) ( not ( = ?auto_8097 ?auto_8098 ) ) ( not ( = ?auto_8100 ?auto_8098 ) ) ( CALIBRATION_TARGET ?auto_8107 ?auto_8103 ) ( ON_BOARD ?auto_8106 ?auto_8104 ) ( not ( = ?auto_8105 ?auto_8106 ) ) ( not ( = ?auto_8107 ?auto_8106 ) ) ( SUPPORTS ?auto_8106 ?auto_8097 ) ( CALIBRATION_TARGET ?auto_8106 ?auto_8103 ) ( POWER_AVAIL ?auto_8104 ) ( POINTING ?auto_8104 ?auto_8102 ) ( not ( = ?auto_8103 ?auto_8102 ) ) ( not ( = ?auto_8101 ?auto_8102 ) ) ( not ( = ?auto_8096 ?auto_8102 ) ) ( not ( = ?auto_8099 ?auto_8102 ) ) )
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
      ?auto_8131 - INSTRUMENT
      ?auto_8130 - SATELLITE
      ?auto_8129 - DIRECTION
      ?auto_8133 - INSTRUMENT
      ?auto_8132 - INSTRUMENT
      ?auto_8128 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_8125 ?auto_8122 ) ) ( not ( = ?auto_8127 ?auto_8122 ) ) ( not ( = ?auto_8127 ?auto_8125 ) ) ( ON_BOARD ?auto_8131 ?auto_8130 ) ( SUPPORTS ?auto_8131 ?auto_8124 ) ( not ( = ?auto_8125 ?auto_8129 ) ) ( not ( = ?auto_8122 ?auto_8129 ) ) ( not ( = ?auto_8123 ?auto_8124 ) ) ( CALIBRATION_TARGET ?auto_8131 ?auto_8129 ) ( not ( = ?auto_8129 ?auto_8127 ) ) ( ON_BOARD ?auto_8133 ?auto_8130 ) ( not ( = ?auto_8131 ?auto_8133 ) ) ( SUPPORTS ?auto_8133 ?auto_8126 ) ( not ( = ?auto_8123 ?auto_8126 ) ) ( not ( = ?auto_8124 ?auto_8126 ) ) ( CALIBRATION_TARGET ?auto_8133 ?auto_8129 ) ( ON_BOARD ?auto_8132 ?auto_8130 ) ( not ( = ?auto_8131 ?auto_8132 ) ) ( not ( = ?auto_8133 ?auto_8132 ) ) ( SUPPORTS ?auto_8132 ?auto_8123 ) ( CALIBRATION_TARGET ?auto_8132 ?auto_8129 ) ( POWER_AVAIL ?auto_8130 ) ( POINTING ?auto_8130 ?auto_8128 ) ( not ( = ?auto_8129 ?auto_8128 ) ) ( not ( = ?auto_8125 ?auto_8128 ) ) ( not ( = ?auto_8122 ?auto_8128 ) ) ( not ( = ?auto_8127 ?auto_8128 ) ) )
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
      ?auto_8157 - INSTRUMENT
      ?auto_8156 - SATELLITE
      ?auto_8155 - DIRECTION
      ?auto_8159 - INSTRUMENT
      ?auto_8158 - INSTRUMENT
      ?auto_8154 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_8151 ?auto_8148 ) ) ( not ( = ?auto_8153 ?auto_8148 ) ) ( not ( = ?auto_8153 ?auto_8151 ) ) ( ON_BOARD ?auto_8157 ?auto_8156 ) ( SUPPORTS ?auto_8157 ?auto_8152 ) ( not ( = ?auto_8153 ?auto_8155 ) ) ( not ( = ?auto_8151 ?auto_8155 ) ) ( not ( = ?auto_8150 ?auto_8152 ) ) ( CALIBRATION_TARGET ?auto_8157 ?auto_8155 ) ( not ( = ?auto_8155 ?auto_8148 ) ) ( ON_BOARD ?auto_8159 ?auto_8156 ) ( not ( = ?auto_8157 ?auto_8159 ) ) ( SUPPORTS ?auto_8159 ?auto_8149 ) ( not ( = ?auto_8150 ?auto_8149 ) ) ( not ( = ?auto_8152 ?auto_8149 ) ) ( CALIBRATION_TARGET ?auto_8159 ?auto_8155 ) ( ON_BOARD ?auto_8158 ?auto_8156 ) ( not ( = ?auto_8157 ?auto_8158 ) ) ( not ( = ?auto_8159 ?auto_8158 ) ) ( SUPPORTS ?auto_8158 ?auto_8150 ) ( CALIBRATION_TARGET ?auto_8158 ?auto_8155 ) ( POWER_AVAIL ?auto_8156 ) ( POINTING ?auto_8156 ?auto_8154 ) ( not ( = ?auto_8155 ?auto_8154 ) ) ( not ( = ?auto_8153 ?auto_8154 ) ) ( not ( = ?auto_8151 ?auto_8154 ) ) ( not ( = ?auto_8148 ?auto_8154 ) ) )
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
      ?auto_8183 - INSTRUMENT
      ?auto_8182 - SATELLITE
      ?auto_8181 - DIRECTION
      ?auto_8185 - INSTRUMENT
      ?auto_8184 - INSTRUMENT
      ?auto_8180 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_8177 ?auto_8174 ) ) ( not ( = ?auto_8179 ?auto_8174 ) ) ( not ( = ?auto_8179 ?auto_8177 ) ) ( ON_BOARD ?auto_8183 ?auto_8182 ) ( SUPPORTS ?auto_8183 ?auto_8176 ) ( not ( = ?auto_8177 ?auto_8181 ) ) ( not ( = ?auto_8179 ?auto_8181 ) ) ( not ( = ?auto_8178 ?auto_8176 ) ) ( CALIBRATION_TARGET ?auto_8183 ?auto_8181 ) ( not ( = ?auto_8181 ?auto_8174 ) ) ( ON_BOARD ?auto_8185 ?auto_8182 ) ( not ( = ?auto_8183 ?auto_8185 ) ) ( SUPPORTS ?auto_8185 ?auto_8175 ) ( not ( = ?auto_8178 ?auto_8175 ) ) ( not ( = ?auto_8176 ?auto_8175 ) ) ( CALIBRATION_TARGET ?auto_8185 ?auto_8181 ) ( ON_BOARD ?auto_8184 ?auto_8182 ) ( not ( = ?auto_8183 ?auto_8184 ) ) ( not ( = ?auto_8185 ?auto_8184 ) ) ( SUPPORTS ?auto_8184 ?auto_8178 ) ( CALIBRATION_TARGET ?auto_8184 ?auto_8181 ) ( POWER_AVAIL ?auto_8182 ) ( POINTING ?auto_8182 ?auto_8180 ) ( not ( = ?auto_8181 ?auto_8180 ) ) ( not ( = ?auto_8177 ?auto_8180 ) ) ( not ( = ?auto_8179 ?auto_8180 ) ) ( not ( = ?auto_8174 ?auto_8180 ) ) )
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
      ?auto_8237 - INSTRUMENT
      ?auto_8236 - SATELLITE
      ?auto_8235 - DIRECTION
      ?auto_8239 - INSTRUMENT
      ?auto_8238 - INSTRUMENT
      ?auto_8234 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_8231 ?auto_8228 ) ) ( not ( = ?auto_8233 ?auto_8228 ) ) ( not ( = ?auto_8233 ?auto_8231 ) ) ( ON_BOARD ?auto_8237 ?auto_8236 ) ( SUPPORTS ?auto_8237 ?auto_8229 ) ( not ( = ?auto_8228 ?auto_8235 ) ) ( not ( = ?auto_8231 ?auto_8235 ) ) ( not ( = ?auto_8230 ?auto_8229 ) ) ( CALIBRATION_TARGET ?auto_8237 ?auto_8235 ) ( not ( = ?auto_8235 ?auto_8233 ) ) ( ON_BOARD ?auto_8239 ?auto_8236 ) ( not ( = ?auto_8237 ?auto_8239 ) ) ( SUPPORTS ?auto_8239 ?auto_8232 ) ( not ( = ?auto_8230 ?auto_8232 ) ) ( not ( = ?auto_8229 ?auto_8232 ) ) ( CALIBRATION_TARGET ?auto_8239 ?auto_8235 ) ( ON_BOARD ?auto_8238 ?auto_8236 ) ( not ( = ?auto_8237 ?auto_8238 ) ) ( not ( = ?auto_8239 ?auto_8238 ) ) ( SUPPORTS ?auto_8238 ?auto_8230 ) ( CALIBRATION_TARGET ?auto_8238 ?auto_8235 ) ( POWER_AVAIL ?auto_8236 ) ( POINTING ?auto_8236 ?auto_8234 ) ( not ( = ?auto_8235 ?auto_8234 ) ) ( not ( = ?auto_8228 ?auto_8234 ) ) ( not ( = ?auto_8231 ?auto_8234 ) ) ( not ( = ?auto_8233 ?auto_8234 ) ) )
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
      ?auto_8263 - INSTRUMENT
      ?auto_8262 - SATELLITE
      ?auto_8261 - DIRECTION
      ?auto_8265 - INSTRUMENT
      ?auto_8264 - INSTRUMENT
      ?auto_8260 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_8257 ?auto_8254 ) ) ( not ( = ?auto_8259 ?auto_8254 ) ) ( not ( = ?auto_8259 ?auto_8257 ) ) ( ON_BOARD ?auto_8263 ?auto_8262 ) ( SUPPORTS ?auto_8263 ?auto_8255 ) ( not ( = ?auto_8254 ?auto_8261 ) ) ( not ( = ?auto_8259 ?auto_8261 ) ) ( not ( = ?auto_8258 ?auto_8255 ) ) ( CALIBRATION_TARGET ?auto_8263 ?auto_8261 ) ( not ( = ?auto_8261 ?auto_8257 ) ) ( ON_BOARD ?auto_8265 ?auto_8262 ) ( not ( = ?auto_8263 ?auto_8265 ) ) ( SUPPORTS ?auto_8265 ?auto_8256 ) ( not ( = ?auto_8258 ?auto_8256 ) ) ( not ( = ?auto_8255 ?auto_8256 ) ) ( CALIBRATION_TARGET ?auto_8265 ?auto_8261 ) ( ON_BOARD ?auto_8264 ?auto_8262 ) ( not ( = ?auto_8263 ?auto_8264 ) ) ( not ( = ?auto_8265 ?auto_8264 ) ) ( SUPPORTS ?auto_8264 ?auto_8258 ) ( CALIBRATION_TARGET ?auto_8264 ?auto_8261 ) ( POWER_AVAIL ?auto_8262 ) ( POINTING ?auto_8262 ?auto_8260 ) ( not ( = ?auto_8261 ?auto_8260 ) ) ( not ( = ?auto_8254 ?auto_8260 ) ) ( not ( = ?auto_8259 ?auto_8260 ) ) ( not ( = ?auto_8257 ?auto_8260 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8259 ?auto_8258 ?auto_8254 ?auto_8255 )
      ( GET-3IMAGE-VERIFY ?auto_8254 ?auto_8255 ?auto_8257 ?auto_8256 ?auto_8259 ?auto_8258 ) )
  )

)

