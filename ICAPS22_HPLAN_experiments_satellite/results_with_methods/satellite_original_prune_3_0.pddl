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
      ?auto_2192 - INSTRUMENT
      ?auto_2193 - SATELLITE
      ?auto_2194 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_2192 ) ( ON_BOARD ?auto_2192 ?auto_2193 ) ( SUPPORTS ?auto_2192 ?auto_2191 ) ( POWER_ON ?auto_2192 ) ( POINTING ?auto_2193 ?auto_2194 ) ( not ( = ?auto_2190 ?auto_2194 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_2193 ?auto_2190 ?auto_2194 )
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
      ?auto_2215 - INSTRUMENT
      ?auto_2213 - SATELLITE
      ?auto_2214 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2215 ?auto_2213 ) ( SUPPORTS ?auto_2215 ?auto_2212 ) ( POWER_ON ?auto_2215 ) ( POINTING ?auto_2213 ?auto_2214 ) ( not ( = ?auto_2211 ?auto_2214 ) ) ( CALIBRATION_TARGET ?auto_2215 ?auto_2214 ) ( NOT_CALIBRATED ?auto_2215 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_2213 ?auto_2215 ?auto_2214 )
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
      ?auto_2234 - INSTRUMENT
      ?auto_2236 - SATELLITE
      ?auto_2235 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2234 ?auto_2236 ) ( SUPPORTS ?auto_2234 ?auto_2233 ) ( POINTING ?auto_2236 ?auto_2235 ) ( not ( = ?auto_2232 ?auto_2235 ) ) ( CALIBRATION_TARGET ?auto_2234 ?auto_2235 ) ( POWER_AVAIL ?auto_2236 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_2234 ?auto_2236 )
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
      ?auto_2255 - INSTRUMENT
      ?auto_2256 - SATELLITE
      ?auto_2257 - DIRECTION
      ?auto_2258 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2255 ?auto_2256 ) ( SUPPORTS ?auto_2255 ?auto_2254 ) ( not ( = ?auto_2253 ?auto_2257 ) ) ( CALIBRATION_TARGET ?auto_2255 ?auto_2257 ) ( POWER_AVAIL ?auto_2256 ) ( POINTING ?auto_2256 ?auto_2258 ) ( not ( = ?auto_2257 ?auto_2258 ) ) ( not ( = ?auto_2253 ?auto_2258 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_2256 ?auto_2257 ?auto_2258 )
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
    ( and ( not ( = ?auto_2340 ?auto_2338 ) ) ( CALIBRATED ?auto_2342 ) ( ON_BOARD ?auto_2342 ?auto_2341 ) ( SUPPORTS ?auto_2342 ?auto_2337 ) ( POWER_ON ?auto_2342 ) ( POINTING ?auto_2341 ?auto_2340 ) ( HAVE_IMAGE ?auto_2338 ?auto_2339 ) ( not ( = ?auto_2339 ?auto_2337 ) ) )
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
    ( and ( not ( = ?auto_2346 ?auto_2344 ) ) ( CALIBRATED ?auto_2348 ) ( ON_BOARD ?auto_2348 ?auto_2347 ) ( SUPPORTS ?auto_2348 ?auto_2345 ) ( POWER_ON ?auto_2348 ) ( POINTING ?auto_2347 ?auto_2344 ) ( HAVE_IMAGE ?auto_2346 ?auto_2343 ) ( not ( = ?auto_2345 ?auto_2343 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2344 ?auto_2345 )
      ( GET-2IMAGE-VERIFY ?auto_2344 ?auto_2345 ?auto_2346 ?auto_2343 ) )
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
      ?auto_2420 - INSTRUMENT
      ?auto_2422 - SATELLITE
      ?auto_2421 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2419 ?auto_2417 ) ) ( CALIBRATED ?auto_2420 ) ( ON_BOARD ?auto_2420 ?auto_2422 ) ( SUPPORTS ?auto_2420 ?auto_2416 ) ( POWER_ON ?auto_2420 ) ( POINTING ?auto_2422 ?auto_2421 ) ( not ( = ?auto_2419 ?auto_2421 ) ) ( HAVE_IMAGE ?auto_2417 ?auto_2418 ) ( not ( = ?auto_2417 ?auto_2421 ) ) ( not ( = ?auto_2418 ?auto_2416 ) ) )
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
      ?auto_2429 - INSTRUMENT
      ?auto_2427 - SATELLITE
      ?auto_2428 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2426 ?auto_2424 ) ) ( CALIBRATED ?auto_2429 ) ( ON_BOARD ?auto_2429 ?auto_2427 ) ( SUPPORTS ?auto_2429 ?auto_2425 ) ( POWER_ON ?auto_2429 ) ( POINTING ?auto_2427 ?auto_2428 ) ( not ( = ?auto_2424 ?auto_2428 ) ) ( HAVE_IMAGE ?auto_2426 ?auto_2423 ) ( not ( = ?auto_2426 ?auto_2428 ) ) ( not ( = ?auto_2423 ?auto_2425 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2426 ?auto_2423 ?auto_2424 ?auto_2425 )
      ( GET-2IMAGE-VERIFY ?auto_2424 ?auto_2425 ?auto_2426 ?auto_2423 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2504 - DIRECTION
      ?auto_2505 - MODE
    )
    :vars
    (
      ?auto_2509 - DIRECTION
      ?auto_2510 - INSTRUMENT
      ?auto_2507 - SATELLITE
      ?auto_2508 - DIRECTION
      ?auto_2506 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_2504 ?auto_2509 ) ) ( ON_BOARD ?auto_2510 ?auto_2507 ) ( SUPPORTS ?auto_2510 ?auto_2505 ) ( POWER_ON ?auto_2510 ) ( POINTING ?auto_2507 ?auto_2508 ) ( not ( = ?auto_2504 ?auto_2508 ) ) ( HAVE_IMAGE ?auto_2509 ?auto_2506 ) ( not ( = ?auto_2509 ?auto_2508 ) ) ( not ( = ?auto_2506 ?auto_2505 ) ) ( CALIBRATION_TARGET ?auto_2510 ?auto_2508 ) ( NOT_CALIBRATED ?auto_2510 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_2507 ?auto_2510 ?auto_2508 )
      ( GET-2IMAGE ?auto_2509 ?auto_2506 ?auto_2504 ?auto_2505 )
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
      ?auto_2515 - INSTRUMENT
      ?auto_2516 - SATELLITE
      ?auto_2517 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2514 ?auto_2512 ) ) ( ON_BOARD ?auto_2515 ?auto_2516 ) ( SUPPORTS ?auto_2515 ?auto_2511 ) ( POWER_ON ?auto_2515 ) ( POINTING ?auto_2516 ?auto_2517 ) ( not ( = ?auto_2514 ?auto_2517 ) ) ( HAVE_IMAGE ?auto_2512 ?auto_2513 ) ( not ( = ?auto_2512 ?auto_2517 ) ) ( not ( = ?auto_2513 ?auto_2511 ) ) ( CALIBRATION_TARGET ?auto_2515 ?auto_2517 ) ( NOT_CALIBRATED ?auto_2515 ) )
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
      ?auto_2522 - INSTRUMENT
      ?auto_2523 - SATELLITE
      ?auto_2524 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2521 ?auto_2519 ) ) ( ON_BOARD ?auto_2522 ?auto_2523 ) ( SUPPORTS ?auto_2522 ?auto_2520 ) ( POWER_ON ?auto_2522 ) ( POINTING ?auto_2523 ?auto_2524 ) ( not ( = ?auto_2519 ?auto_2524 ) ) ( HAVE_IMAGE ?auto_2521 ?auto_2518 ) ( not ( = ?auto_2521 ?auto_2524 ) ) ( not ( = ?auto_2518 ?auto_2520 ) ) ( CALIBRATION_TARGET ?auto_2522 ?auto_2524 ) ( NOT_CALIBRATED ?auto_2522 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2521 ?auto_2518 ?auto_2519 ?auto_2520 )
      ( GET-2IMAGE-VERIFY ?auto_2519 ?auto_2520 ?auto_2521 ?auto_2518 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2599 - DIRECTION
      ?auto_2600 - MODE
    )
    :vars
    (
      ?auto_2604 - DIRECTION
      ?auto_2601 - INSTRUMENT
      ?auto_2602 - SATELLITE
      ?auto_2603 - DIRECTION
      ?auto_2605 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_2599 ?auto_2604 ) ) ( ON_BOARD ?auto_2601 ?auto_2602 ) ( SUPPORTS ?auto_2601 ?auto_2600 ) ( POINTING ?auto_2602 ?auto_2603 ) ( not ( = ?auto_2599 ?auto_2603 ) ) ( HAVE_IMAGE ?auto_2604 ?auto_2605 ) ( not ( = ?auto_2604 ?auto_2603 ) ) ( not ( = ?auto_2605 ?auto_2600 ) ) ( CALIBRATION_TARGET ?auto_2601 ?auto_2603 ) ( POWER_AVAIL ?auto_2602 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_2601 ?auto_2602 )
      ( GET-2IMAGE ?auto_2604 ?auto_2605 ?auto_2599 ?auto_2600 )
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
    ( and ( not ( = ?auto_2609 ?auto_2607 ) ) ( ON_BOARD ?auto_2610 ?auto_2612 ) ( SUPPORTS ?auto_2610 ?auto_2606 ) ( POINTING ?auto_2612 ?auto_2611 ) ( not ( = ?auto_2609 ?auto_2611 ) ) ( HAVE_IMAGE ?auto_2607 ?auto_2608 ) ( not ( = ?auto_2607 ?auto_2611 ) ) ( not ( = ?auto_2608 ?auto_2606 ) ) ( CALIBRATION_TARGET ?auto_2610 ?auto_2611 ) ( POWER_AVAIL ?auto_2612 ) )
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
    ( and ( not ( = ?auto_2616 ?auto_2614 ) ) ( ON_BOARD ?auto_2618 ?auto_2619 ) ( SUPPORTS ?auto_2618 ?auto_2615 ) ( POINTING ?auto_2619 ?auto_2617 ) ( not ( = ?auto_2614 ?auto_2617 ) ) ( HAVE_IMAGE ?auto_2616 ?auto_2613 ) ( not ( = ?auto_2616 ?auto_2617 ) ) ( not ( = ?auto_2613 ?auto_2615 ) ) ( CALIBRATION_TARGET ?auto_2618 ?auto_2617 ) ( POWER_AVAIL ?auto_2619 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2616 ?auto_2613 ?auto_2614 ?auto_2615 )
      ( GET-2IMAGE-VERIFY ?auto_2614 ?auto_2615 ?auto_2616 ?auto_2613 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2694 - DIRECTION
      ?auto_2695 - MODE
    )
    :vars
    (
      ?auto_2699 - DIRECTION
      ?auto_2697 - INSTRUMENT
      ?auto_2700 - SATELLITE
      ?auto_2696 - DIRECTION
      ?auto_2698 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_2694 ?auto_2699 ) ) ( ON_BOARD ?auto_2697 ?auto_2700 ) ( SUPPORTS ?auto_2697 ?auto_2695 ) ( not ( = ?auto_2694 ?auto_2696 ) ) ( HAVE_IMAGE ?auto_2699 ?auto_2698 ) ( not ( = ?auto_2699 ?auto_2696 ) ) ( not ( = ?auto_2698 ?auto_2695 ) ) ( CALIBRATION_TARGET ?auto_2697 ?auto_2696 ) ( POWER_AVAIL ?auto_2700 ) ( POINTING ?auto_2700 ?auto_2699 ) )
    :subtasks
    ( ( !TURN_TO ?auto_2700 ?auto_2696 ?auto_2699 )
      ( GET-2IMAGE ?auto_2699 ?auto_2698 ?auto_2694 ?auto_2695 )
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
      ?auto_2707 - INSTRUMENT
      ?auto_2706 - SATELLITE
      ?auto_2705 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2704 ?auto_2702 ) ) ( ON_BOARD ?auto_2707 ?auto_2706 ) ( SUPPORTS ?auto_2707 ?auto_2701 ) ( not ( = ?auto_2704 ?auto_2705 ) ) ( HAVE_IMAGE ?auto_2702 ?auto_2703 ) ( not ( = ?auto_2702 ?auto_2705 ) ) ( not ( = ?auto_2703 ?auto_2701 ) ) ( CALIBRATION_TARGET ?auto_2707 ?auto_2705 ) ( POWER_AVAIL ?auto_2706 ) ( POINTING ?auto_2706 ?auto_2702 ) )
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
      ?auto_2712 - INSTRUMENT
      ?auto_2713 - SATELLITE
      ?auto_2714 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2711 ?auto_2709 ) ) ( ON_BOARD ?auto_2712 ?auto_2713 ) ( SUPPORTS ?auto_2712 ?auto_2710 ) ( not ( = ?auto_2709 ?auto_2714 ) ) ( HAVE_IMAGE ?auto_2711 ?auto_2708 ) ( not ( = ?auto_2711 ?auto_2714 ) ) ( not ( = ?auto_2708 ?auto_2710 ) ) ( CALIBRATION_TARGET ?auto_2712 ?auto_2714 ) ( POWER_AVAIL ?auto_2713 ) ( POINTING ?auto_2713 ?auto_2711 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2711 ?auto_2708 ?auto_2709 ?auto_2710 )
      ( GET-2IMAGE-VERIFY ?auto_2709 ?auto_2710 ?auto_2711 ?auto_2708 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2789 - DIRECTION
      ?auto_2790 - MODE
    )
    :vars
    (
      ?auto_2792 - DIRECTION
      ?auto_2791 - INSTRUMENT
      ?auto_2794 - SATELLITE
      ?auto_2795 - DIRECTION
      ?auto_2793 - MODE
      ?auto_2796 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2789 ?auto_2792 ) ) ( ON_BOARD ?auto_2791 ?auto_2794 ) ( SUPPORTS ?auto_2791 ?auto_2790 ) ( not ( = ?auto_2789 ?auto_2795 ) ) ( HAVE_IMAGE ?auto_2792 ?auto_2793 ) ( not ( = ?auto_2792 ?auto_2795 ) ) ( not ( = ?auto_2793 ?auto_2790 ) ) ( CALIBRATION_TARGET ?auto_2791 ?auto_2795 ) ( POINTING ?auto_2794 ?auto_2792 ) ( ON_BOARD ?auto_2796 ?auto_2794 ) ( POWER_ON ?auto_2796 ) ( not ( = ?auto_2791 ?auto_2796 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_2796 ?auto_2794 )
      ( GET-2IMAGE ?auto_2792 ?auto_2793 ?auto_2789 ?auto_2790 )
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
      ?auto_2804 - INSTRUMENT
      ?auto_2803 - SATELLITE
      ?auto_2801 - DIRECTION
      ?auto_2802 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2800 ?auto_2798 ) ) ( ON_BOARD ?auto_2804 ?auto_2803 ) ( SUPPORTS ?auto_2804 ?auto_2797 ) ( not ( = ?auto_2800 ?auto_2801 ) ) ( HAVE_IMAGE ?auto_2798 ?auto_2799 ) ( not ( = ?auto_2798 ?auto_2801 ) ) ( not ( = ?auto_2799 ?auto_2797 ) ) ( CALIBRATION_TARGET ?auto_2804 ?auto_2801 ) ( POINTING ?auto_2803 ?auto_2798 ) ( ON_BOARD ?auto_2802 ?auto_2803 ) ( POWER_ON ?auto_2802 ) ( not ( = ?auto_2804 ?auto_2802 ) ) )
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
      ?auto_2810 - SATELLITE
      ?auto_2809 - DIRECTION
      ?auto_2812 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2808 ?auto_2806 ) ) ( ON_BOARD ?auto_2811 ?auto_2810 ) ( SUPPORTS ?auto_2811 ?auto_2807 ) ( not ( = ?auto_2806 ?auto_2809 ) ) ( HAVE_IMAGE ?auto_2808 ?auto_2805 ) ( not ( = ?auto_2808 ?auto_2809 ) ) ( not ( = ?auto_2805 ?auto_2807 ) ) ( CALIBRATION_TARGET ?auto_2811 ?auto_2809 ) ( POINTING ?auto_2810 ?auto_2808 ) ( ON_BOARD ?auto_2812 ?auto_2810 ) ( POWER_ON ?auto_2812 ) ( not ( = ?auto_2811 ?auto_2812 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2808 ?auto_2805 ?auto_2806 ?auto_2807 )
      ( GET-2IMAGE-VERIFY ?auto_2806 ?auto_2807 ?auto_2808 ?auto_2805 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2895 - DIRECTION
      ?auto_2896 - MODE
    )
    :vars
    (
      ?auto_2900 - DIRECTION
      ?auto_2901 - INSTRUMENT
      ?auto_2899 - SATELLITE
      ?auto_2898 - DIRECTION
      ?auto_2897 - MODE
      ?auto_2902 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2895 ?auto_2900 ) ) ( ON_BOARD ?auto_2901 ?auto_2899 ) ( SUPPORTS ?auto_2901 ?auto_2896 ) ( not ( = ?auto_2895 ?auto_2898 ) ) ( not ( = ?auto_2900 ?auto_2898 ) ) ( not ( = ?auto_2897 ?auto_2896 ) ) ( CALIBRATION_TARGET ?auto_2901 ?auto_2898 ) ( POINTING ?auto_2899 ?auto_2900 ) ( ON_BOARD ?auto_2902 ?auto_2899 ) ( POWER_ON ?auto_2902 ) ( not ( = ?auto_2901 ?auto_2902 ) ) ( CALIBRATED ?auto_2902 ) ( SUPPORTS ?auto_2902 ?auto_2897 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2900 ?auto_2897 )
      ( GET-2IMAGE ?auto_2900 ?auto_2897 ?auto_2895 ?auto_2896 )
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
      ?auto_2909 - INSTRUMENT
      ?auto_2910 - SATELLITE
      ?auto_2908 - DIRECTION
      ?auto_2907 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2906 ?auto_2904 ) ) ( ON_BOARD ?auto_2909 ?auto_2910 ) ( SUPPORTS ?auto_2909 ?auto_2903 ) ( not ( = ?auto_2906 ?auto_2908 ) ) ( not ( = ?auto_2904 ?auto_2908 ) ) ( not ( = ?auto_2905 ?auto_2903 ) ) ( CALIBRATION_TARGET ?auto_2909 ?auto_2908 ) ( POINTING ?auto_2910 ?auto_2904 ) ( ON_BOARD ?auto_2907 ?auto_2910 ) ( POWER_ON ?auto_2907 ) ( not ( = ?auto_2909 ?auto_2907 ) ) ( CALIBRATED ?auto_2907 ) ( SUPPORTS ?auto_2907 ?auto_2905 ) )
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
    ( and ( not ( = ?auto_2914 ?auto_2912 ) ) ( ON_BOARD ?auto_2918 ?auto_2915 ) ( SUPPORTS ?auto_2918 ?auto_2913 ) ( not ( = ?auto_2912 ?auto_2917 ) ) ( not ( = ?auto_2914 ?auto_2917 ) ) ( not ( = ?auto_2911 ?auto_2913 ) ) ( CALIBRATION_TARGET ?auto_2918 ?auto_2917 ) ( POINTING ?auto_2915 ?auto_2914 ) ( ON_BOARD ?auto_2916 ?auto_2915 ) ( POWER_ON ?auto_2916 ) ( not ( = ?auto_2918 ?auto_2916 ) ) ( CALIBRATED ?auto_2916 ) ( SUPPORTS ?auto_2916 ?auto_2911 ) )
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
      ?auto_3007 - DIRECTION
      ?auto_3006 - INSTRUMENT
      ?auto_3003 - SATELLITE
      ?auto_3005 - DIRECTION
      ?auto_3008 - MODE
      ?auto_3004 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3001 ?auto_3007 ) ) ( ON_BOARD ?auto_3006 ?auto_3003 ) ( SUPPORTS ?auto_3006 ?auto_3002 ) ( not ( = ?auto_3001 ?auto_3005 ) ) ( not ( = ?auto_3007 ?auto_3005 ) ) ( not ( = ?auto_3008 ?auto_3002 ) ) ( CALIBRATION_TARGET ?auto_3006 ?auto_3005 ) ( ON_BOARD ?auto_3004 ?auto_3003 ) ( POWER_ON ?auto_3004 ) ( not ( = ?auto_3006 ?auto_3004 ) ) ( CALIBRATED ?auto_3004 ) ( SUPPORTS ?auto_3004 ?auto_3008 ) ( POINTING ?auto_3003 ?auto_3005 ) )
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
      ?auto_3013 - INSTRUMENT
      ?auto_3016 - SATELLITE
      ?auto_3015 - DIRECTION
      ?auto_3014 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3012 ?auto_3010 ) ) ( ON_BOARD ?auto_3013 ?auto_3016 ) ( SUPPORTS ?auto_3013 ?auto_3009 ) ( not ( = ?auto_3012 ?auto_3015 ) ) ( not ( = ?auto_3010 ?auto_3015 ) ) ( not ( = ?auto_3011 ?auto_3009 ) ) ( CALIBRATION_TARGET ?auto_3013 ?auto_3015 ) ( ON_BOARD ?auto_3014 ?auto_3016 ) ( POWER_ON ?auto_3014 ) ( not ( = ?auto_3013 ?auto_3014 ) ) ( CALIBRATED ?auto_3014 ) ( SUPPORTS ?auto_3014 ?auto_3011 ) ( POINTING ?auto_3016 ?auto_3015 ) )
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
      ?auto_3022 - INSTRUMENT
      ?auto_3023 - SATELLITE
      ?auto_3021 - DIRECTION
      ?auto_3024 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3020 ?auto_3018 ) ) ( ON_BOARD ?auto_3022 ?auto_3023 ) ( SUPPORTS ?auto_3022 ?auto_3019 ) ( not ( = ?auto_3018 ?auto_3021 ) ) ( not ( = ?auto_3020 ?auto_3021 ) ) ( not ( = ?auto_3017 ?auto_3019 ) ) ( CALIBRATION_TARGET ?auto_3022 ?auto_3021 ) ( ON_BOARD ?auto_3024 ?auto_3023 ) ( POWER_ON ?auto_3024 ) ( not ( = ?auto_3022 ?auto_3024 ) ) ( CALIBRATED ?auto_3024 ) ( SUPPORTS ?auto_3024 ?auto_3017 ) ( POINTING ?auto_3023 ?auto_3021 ) )
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
      ?auto_3114 - DIRECTION
      ?auto_3110 - INSTRUMENT
      ?auto_3111 - SATELLITE
      ?auto_3109 - DIRECTION
      ?auto_3113 - MODE
      ?auto_3112 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3107 ?auto_3114 ) ) ( ON_BOARD ?auto_3110 ?auto_3111 ) ( SUPPORTS ?auto_3110 ?auto_3108 ) ( not ( = ?auto_3107 ?auto_3109 ) ) ( not ( = ?auto_3114 ?auto_3109 ) ) ( not ( = ?auto_3113 ?auto_3108 ) ) ( CALIBRATION_TARGET ?auto_3110 ?auto_3109 ) ( ON_BOARD ?auto_3112 ?auto_3111 ) ( POWER_ON ?auto_3112 ) ( not ( = ?auto_3110 ?auto_3112 ) ) ( SUPPORTS ?auto_3112 ?auto_3113 ) ( POINTING ?auto_3111 ?auto_3109 ) ( CALIBRATION_TARGET ?auto_3112 ?auto_3109 ) ( NOT_CALIBRATED ?auto_3112 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_3111 ?auto_3112 ?auto_3109 )
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
      ?auto_3120 - INSTRUMENT
      ?auto_3121 - SATELLITE
      ?auto_3122 - DIRECTION
      ?auto_3119 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3118 ?auto_3116 ) ) ( ON_BOARD ?auto_3120 ?auto_3121 ) ( SUPPORTS ?auto_3120 ?auto_3115 ) ( not ( = ?auto_3118 ?auto_3122 ) ) ( not ( = ?auto_3116 ?auto_3122 ) ) ( not ( = ?auto_3117 ?auto_3115 ) ) ( CALIBRATION_TARGET ?auto_3120 ?auto_3122 ) ( ON_BOARD ?auto_3119 ?auto_3121 ) ( POWER_ON ?auto_3119 ) ( not ( = ?auto_3120 ?auto_3119 ) ) ( SUPPORTS ?auto_3119 ?auto_3117 ) ( POINTING ?auto_3121 ?auto_3122 ) ( CALIBRATION_TARGET ?auto_3119 ?auto_3122 ) ( NOT_CALIBRATED ?auto_3119 ) )
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
      ?auto_3129 - INSTRUMENT
      ?auto_3128 - SATELLITE
      ?auto_3130 - DIRECTION
      ?auto_3127 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3126 ?auto_3124 ) ) ( ON_BOARD ?auto_3129 ?auto_3128 ) ( SUPPORTS ?auto_3129 ?auto_3125 ) ( not ( = ?auto_3124 ?auto_3130 ) ) ( not ( = ?auto_3126 ?auto_3130 ) ) ( not ( = ?auto_3123 ?auto_3125 ) ) ( CALIBRATION_TARGET ?auto_3129 ?auto_3130 ) ( ON_BOARD ?auto_3127 ?auto_3128 ) ( POWER_ON ?auto_3127 ) ( not ( = ?auto_3129 ?auto_3127 ) ) ( SUPPORTS ?auto_3127 ?auto_3123 ) ( POINTING ?auto_3128 ?auto_3130 ) ( CALIBRATION_TARGET ?auto_3127 ?auto_3130 ) ( NOT_CALIBRATED ?auto_3127 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3126 ?auto_3123 ?auto_3124 ?auto_3125 )
      ( GET-2IMAGE-VERIFY ?auto_3124 ?auto_3125 ?auto_3126 ?auto_3123 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3570 - DIRECTION
      ?auto_3571 - MODE
      ?auto_3572 - DIRECTION
      ?auto_3569 - MODE
      ?auto_3574 - DIRECTION
      ?auto_3573 - MODE
    )
    :vars
    (
      ?auto_3575 - INSTRUMENT
      ?auto_3576 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_3572 ?auto_3570 ) ) ( not ( = ?auto_3574 ?auto_3570 ) ) ( not ( = ?auto_3574 ?auto_3572 ) ) ( CALIBRATED ?auto_3575 ) ( ON_BOARD ?auto_3575 ?auto_3576 ) ( SUPPORTS ?auto_3575 ?auto_3573 ) ( POWER_ON ?auto_3575 ) ( POINTING ?auto_3576 ?auto_3574 ) ( HAVE_IMAGE ?auto_3570 ?auto_3571 ) ( HAVE_IMAGE ?auto_3572 ?auto_3569 ) ( not ( = ?auto_3571 ?auto_3569 ) ) ( not ( = ?auto_3571 ?auto_3573 ) ) ( not ( = ?auto_3569 ?auto_3573 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3574 ?auto_3573 )
      ( GET-3IMAGE-VERIFY ?auto_3570 ?auto_3571 ?auto_3572 ?auto_3569 ?auto_3574 ?auto_3573 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3586 - DIRECTION
      ?auto_3587 - MODE
      ?auto_3588 - DIRECTION
      ?auto_3585 - MODE
      ?auto_3590 - DIRECTION
      ?auto_3589 - MODE
    )
    :vars
    (
      ?auto_3591 - INSTRUMENT
      ?auto_3592 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_3588 ?auto_3586 ) ) ( not ( = ?auto_3590 ?auto_3586 ) ) ( not ( = ?auto_3590 ?auto_3588 ) ) ( CALIBRATED ?auto_3591 ) ( ON_BOARD ?auto_3591 ?auto_3592 ) ( SUPPORTS ?auto_3591 ?auto_3585 ) ( POWER_ON ?auto_3591 ) ( POINTING ?auto_3592 ?auto_3588 ) ( HAVE_IMAGE ?auto_3586 ?auto_3587 ) ( HAVE_IMAGE ?auto_3590 ?auto_3589 ) ( not ( = ?auto_3587 ?auto_3585 ) ) ( not ( = ?auto_3587 ?auto_3589 ) ) ( not ( = ?auto_3585 ?auto_3589 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3588 ?auto_3585 )
      ( GET-3IMAGE-VERIFY ?auto_3586 ?auto_3587 ?auto_3588 ?auto_3585 ?auto_3590 ?auto_3589 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3646 - DIRECTION
      ?auto_3647 - MODE
      ?auto_3648 - DIRECTION
      ?auto_3645 - MODE
      ?auto_3650 - DIRECTION
      ?auto_3649 - MODE
    )
    :vars
    (
      ?auto_3651 - INSTRUMENT
      ?auto_3652 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_3648 ?auto_3646 ) ) ( not ( = ?auto_3650 ?auto_3646 ) ) ( not ( = ?auto_3650 ?auto_3648 ) ) ( CALIBRATED ?auto_3651 ) ( ON_BOARD ?auto_3651 ?auto_3652 ) ( SUPPORTS ?auto_3651 ?auto_3647 ) ( POWER_ON ?auto_3651 ) ( POINTING ?auto_3652 ?auto_3646 ) ( HAVE_IMAGE ?auto_3648 ?auto_3645 ) ( HAVE_IMAGE ?auto_3650 ?auto_3649 ) ( not ( = ?auto_3647 ?auto_3645 ) ) ( not ( = ?auto_3647 ?auto_3649 ) ) ( not ( = ?auto_3645 ?auto_3649 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3646 ?auto_3647 )
      ( GET-3IMAGE-VERIFY ?auto_3646 ?auto_3647 ?auto_3648 ?auto_3645 ?auto_3650 ?auto_3649 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3753 - DIRECTION
      ?auto_3754 - MODE
      ?auto_3755 - DIRECTION
      ?auto_3752 - MODE
      ?auto_3757 - DIRECTION
      ?auto_3756 - MODE
    )
    :vars
    (
      ?auto_3759 - INSTRUMENT
      ?auto_3760 - SATELLITE
      ?auto_3758 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3755 ?auto_3753 ) ) ( not ( = ?auto_3757 ?auto_3753 ) ) ( not ( = ?auto_3757 ?auto_3755 ) ) ( CALIBRATED ?auto_3759 ) ( ON_BOARD ?auto_3759 ?auto_3760 ) ( SUPPORTS ?auto_3759 ?auto_3756 ) ( POWER_ON ?auto_3759 ) ( POINTING ?auto_3760 ?auto_3758 ) ( not ( = ?auto_3757 ?auto_3758 ) ) ( HAVE_IMAGE ?auto_3753 ?auto_3754 ) ( not ( = ?auto_3753 ?auto_3758 ) ) ( not ( = ?auto_3754 ?auto_3756 ) ) ( HAVE_IMAGE ?auto_3755 ?auto_3752 ) ( not ( = ?auto_3754 ?auto_3752 ) ) ( not ( = ?auto_3755 ?auto_3758 ) ) ( not ( = ?auto_3752 ?auto_3756 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3753 ?auto_3754 ?auto_3757 ?auto_3756 )
      ( GET-3IMAGE-VERIFY ?auto_3753 ?auto_3754 ?auto_3755 ?auto_3752 ?auto_3757 ?auto_3756 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3771 - DIRECTION
      ?auto_3772 - MODE
      ?auto_3773 - DIRECTION
      ?auto_3770 - MODE
      ?auto_3775 - DIRECTION
      ?auto_3774 - MODE
    )
    :vars
    (
      ?auto_3777 - INSTRUMENT
      ?auto_3778 - SATELLITE
      ?auto_3776 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3773 ?auto_3771 ) ) ( not ( = ?auto_3775 ?auto_3771 ) ) ( not ( = ?auto_3775 ?auto_3773 ) ) ( CALIBRATED ?auto_3777 ) ( ON_BOARD ?auto_3777 ?auto_3778 ) ( SUPPORTS ?auto_3777 ?auto_3770 ) ( POWER_ON ?auto_3777 ) ( POINTING ?auto_3778 ?auto_3776 ) ( not ( = ?auto_3773 ?auto_3776 ) ) ( HAVE_IMAGE ?auto_3771 ?auto_3772 ) ( not ( = ?auto_3771 ?auto_3776 ) ) ( not ( = ?auto_3772 ?auto_3770 ) ) ( HAVE_IMAGE ?auto_3775 ?auto_3774 ) ( not ( = ?auto_3772 ?auto_3774 ) ) ( not ( = ?auto_3770 ?auto_3774 ) ) ( not ( = ?auto_3775 ?auto_3776 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3771 ?auto_3772 ?auto_3773 ?auto_3770 )
      ( GET-3IMAGE-VERIFY ?auto_3771 ?auto_3772 ?auto_3773 ?auto_3770 ?auto_3775 ?auto_3774 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3843 - DIRECTION
      ?auto_3844 - MODE
      ?auto_3845 - DIRECTION
      ?auto_3842 - MODE
      ?auto_3847 - DIRECTION
      ?auto_3846 - MODE
    )
    :vars
    (
      ?auto_3849 - INSTRUMENT
      ?auto_3850 - SATELLITE
      ?auto_3848 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3845 ?auto_3843 ) ) ( not ( = ?auto_3847 ?auto_3843 ) ) ( not ( = ?auto_3847 ?auto_3845 ) ) ( CALIBRATED ?auto_3849 ) ( ON_BOARD ?auto_3849 ?auto_3850 ) ( SUPPORTS ?auto_3849 ?auto_3844 ) ( POWER_ON ?auto_3849 ) ( POINTING ?auto_3850 ?auto_3848 ) ( not ( = ?auto_3843 ?auto_3848 ) ) ( HAVE_IMAGE ?auto_3845 ?auto_3842 ) ( not ( = ?auto_3845 ?auto_3848 ) ) ( not ( = ?auto_3842 ?auto_3844 ) ) ( HAVE_IMAGE ?auto_3847 ?auto_3846 ) ( not ( = ?auto_3844 ?auto_3846 ) ) ( not ( = ?auto_3842 ?auto_3846 ) ) ( not ( = ?auto_3847 ?auto_3848 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3845 ?auto_3842 ?auto_3843 ?auto_3844 )
      ( GET-3IMAGE-VERIFY ?auto_3843 ?auto_3844 ?auto_3845 ?auto_3842 ?auto_3847 ?auto_3846 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3967 - DIRECTION
      ?auto_3968 - MODE
      ?auto_3969 - DIRECTION
      ?auto_3966 - MODE
      ?auto_3971 - DIRECTION
      ?auto_3970 - MODE
    )
    :vars
    (
      ?auto_3974 - INSTRUMENT
      ?auto_3973 - SATELLITE
      ?auto_3972 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3969 ?auto_3967 ) ) ( not ( = ?auto_3971 ?auto_3967 ) ) ( not ( = ?auto_3971 ?auto_3969 ) ) ( ON_BOARD ?auto_3974 ?auto_3973 ) ( SUPPORTS ?auto_3974 ?auto_3970 ) ( POWER_ON ?auto_3974 ) ( POINTING ?auto_3973 ?auto_3972 ) ( not ( = ?auto_3971 ?auto_3972 ) ) ( HAVE_IMAGE ?auto_3967 ?auto_3968 ) ( not ( = ?auto_3967 ?auto_3972 ) ) ( not ( = ?auto_3968 ?auto_3970 ) ) ( CALIBRATION_TARGET ?auto_3974 ?auto_3972 ) ( NOT_CALIBRATED ?auto_3974 ) ( HAVE_IMAGE ?auto_3969 ?auto_3966 ) ( not ( = ?auto_3968 ?auto_3966 ) ) ( not ( = ?auto_3969 ?auto_3972 ) ) ( not ( = ?auto_3966 ?auto_3970 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3967 ?auto_3968 ?auto_3971 ?auto_3970 )
      ( GET-3IMAGE-VERIFY ?auto_3967 ?auto_3968 ?auto_3969 ?auto_3966 ?auto_3971 ?auto_3970 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3985 - DIRECTION
      ?auto_3986 - MODE
      ?auto_3987 - DIRECTION
      ?auto_3984 - MODE
      ?auto_3989 - DIRECTION
      ?auto_3988 - MODE
    )
    :vars
    (
      ?auto_3992 - INSTRUMENT
      ?auto_3991 - SATELLITE
      ?auto_3990 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3987 ?auto_3985 ) ) ( not ( = ?auto_3989 ?auto_3985 ) ) ( not ( = ?auto_3989 ?auto_3987 ) ) ( ON_BOARD ?auto_3992 ?auto_3991 ) ( SUPPORTS ?auto_3992 ?auto_3984 ) ( POWER_ON ?auto_3992 ) ( POINTING ?auto_3991 ?auto_3990 ) ( not ( = ?auto_3987 ?auto_3990 ) ) ( HAVE_IMAGE ?auto_3985 ?auto_3986 ) ( not ( = ?auto_3985 ?auto_3990 ) ) ( not ( = ?auto_3986 ?auto_3984 ) ) ( CALIBRATION_TARGET ?auto_3992 ?auto_3990 ) ( NOT_CALIBRATED ?auto_3992 ) ( HAVE_IMAGE ?auto_3989 ?auto_3988 ) ( not ( = ?auto_3986 ?auto_3988 ) ) ( not ( = ?auto_3984 ?auto_3988 ) ) ( not ( = ?auto_3989 ?auto_3990 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3985 ?auto_3986 ?auto_3987 ?auto_3984 )
      ( GET-3IMAGE-VERIFY ?auto_3985 ?auto_3986 ?auto_3987 ?auto_3984 ?auto_3989 ?auto_3988 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4057 - DIRECTION
      ?auto_4058 - MODE
      ?auto_4059 - DIRECTION
      ?auto_4056 - MODE
      ?auto_4061 - DIRECTION
      ?auto_4060 - MODE
    )
    :vars
    (
      ?auto_4064 - INSTRUMENT
      ?auto_4063 - SATELLITE
      ?auto_4062 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4059 ?auto_4057 ) ) ( not ( = ?auto_4061 ?auto_4057 ) ) ( not ( = ?auto_4061 ?auto_4059 ) ) ( ON_BOARD ?auto_4064 ?auto_4063 ) ( SUPPORTS ?auto_4064 ?auto_4058 ) ( POWER_ON ?auto_4064 ) ( POINTING ?auto_4063 ?auto_4062 ) ( not ( = ?auto_4057 ?auto_4062 ) ) ( HAVE_IMAGE ?auto_4059 ?auto_4056 ) ( not ( = ?auto_4059 ?auto_4062 ) ) ( not ( = ?auto_4056 ?auto_4058 ) ) ( CALIBRATION_TARGET ?auto_4064 ?auto_4062 ) ( NOT_CALIBRATED ?auto_4064 ) ( HAVE_IMAGE ?auto_4061 ?auto_4060 ) ( not ( = ?auto_4058 ?auto_4060 ) ) ( not ( = ?auto_4056 ?auto_4060 ) ) ( not ( = ?auto_4061 ?auto_4062 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4059 ?auto_4056 ?auto_4057 ?auto_4058 )
      ( GET-3IMAGE-VERIFY ?auto_4057 ?auto_4058 ?auto_4059 ?auto_4056 ?auto_4061 ?auto_4060 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4181 - DIRECTION
      ?auto_4182 - MODE
      ?auto_4183 - DIRECTION
      ?auto_4180 - MODE
      ?auto_4185 - DIRECTION
      ?auto_4184 - MODE
    )
    :vars
    (
      ?auto_4188 - INSTRUMENT
      ?auto_4187 - SATELLITE
      ?auto_4186 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4183 ?auto_4181 ) ) ( not ( = ?auto_4185 ?auto_4181 ) ) ( not ( = ?auto_4185 ?auto_4183 ) ) ( ON_BOARD ?auto_4188 ?auto_4187 ) ( SUPPORTS ?auto_4188 ?auto_4184 ) ( POINTING ?auto_4187 ?auto_4186 ) ( not ( = ?auto_4185 ?auto_4186 ) ) ( HAVE_IMAGE ?auto_4181 ?auto_4182 ) ( not ( = ?auto_4181 ?auto_4186 ) ) ( not ( = ?auto_4182 ?auto_4184 ) ) ( CALIBRATION_TARGET ?auto_4188 ?auto_4186 ) ( POWER_AVAIL ?auto_4187 ) ( HAVE_IMAGE ?auto_4183 ?auto_4180 ) ( not ( = ?auto_4182 ?auto_4180 ) ) ( not ( = ?auto_4183 ?auto_4186 ) ) ( not ( = ?auto_4180 ?auto_4184 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4181 ?auto_4182 ?auto_4185 ?auto_4184 )
      ( GET-3IMAGE-VERIFY ?auto_4181 ?auto_4182 ?auto_4183 ?auto_4180 ?auto_4185 ?auto_4184 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4199 - DIRECTION
      ?auto_4200 - MODE
      ?auto_4201 - DIRECTION
      ?auto_4198 - MODE
      ?auto_4203 - DIRECTION
      ?auto_4202 - MODE
    )
    :vars
    (
      ?auto_4206 - INSTRUMENT
      ?auto_4205 - SATELLITE
      ?auto_4204 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4201 ?auto_4199 ) ) ( not ( = ?auto_4203 ?auto_4199 ) ) ( not ( = ?auto_4203 ?auto_4201 ) ) ( ON_BOARD ?auto_4206 ?auto_4205 ) ( SUPPORTS ?auto_4206 ?auto_4198 ) ( POINTING ?auto_4205 ?auto_4204 ) ( not ( = ?auto_4201 ?auto_4204 ) ) ( HAVE_IMAGE ?auto_4199 ?auto_4200 ) ( not ( = ?auto_4199 ?auto_4204 ) ) ( not ( = ?auto_4200 ?auto_4198 ) ) ( CALIBRATION_TARGET ?auto_4206 ?auto_4204 ) ( POWER_AVAIL ?auto_4205 ) ( HAVE_IMAGE ?auto_4203 ?auto_4202 ) ( not ( = ?auto_4200 ?auto_4202 ) ) ( not ( = ?auto_4198 ?auto_4202 ) ) ( not ( = ?auto_4203 ?auto_4204 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4199 ?auto_4200 ?auto_4201 ?auto_4198 )
      ( GET-3IMAGE-VERIFY ?auto_4199 ?auto_4200 ?auto_4201 ?auto_4198 ?auto_4203 ?auto_4202 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4271 - DIRECTION
      ?auto_4272 - MODE
      ?auto_4273 - DIRECTION
      ?auto_4270 - MODE
      ?auto_4275 - DIRECTION
      ?auto_4274 - MODE
    )
    :vars
    (
      ?auto_4278 - INSTRUMENT
      ?auto_4277 - SATELLITE
      ?auto_4276 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4273 ?auto_4271 ) ) ( not ( = ?auto_4275 ?auto_4271 ) ) ( not ( = ?auto_4275 ?auto_4273 ) ) ( ON_BOARD ?auto_4278 ?auto_4277 ) ( SUPPORTS ?auto_4278 ?auto_4272 ) ( POINTING ?auto_4277 ?auto_4276 ) ( not ( = ?auto_4271 ?auto_4276 ) ) ( HAVE_IMAGE ?auto_4273 ?auto_4270 ) ( not ( = ?auto_4273 ?auto_4276 ) ) ( not ( = ?auto_4270 ?auto_4272 ) ) ( CALIBRATION_TARGET ?auto_4278 ?auto_4276 ) ( POWER_AVAIL ?auto_4277 ) ( HAVE_IMAGE ?auto_4275 ?auto_4274 ) ( not ( = ?auto_4272 ?auto_4274 ) ) ( not ( = ?auto_4270 ?auto_4274 ) ) ( not ( = ?auto_4275 ?auto_4276 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4273 ?auto_4270 ?auto_4271 ?auto_4272 )
      ( GET-3IMAGE-VERIFY ?auto_4271 ?auto_4272 ?auto_4273 ?auto_4270 ?auto_4275 ?auto_4274 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4347 - DIRECTION
      ?auto_4348 - MODE
    )
    :vars
    (
      ?auto_4351 - DIRECTION
      ?auto_4352 - INSTRUMENT
      ?auto_4350 - SATELLITE
      ?auto_4349 - DIRECTION
      ?auto_4353 - MODE
      ?auto_4354 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4347 ?auto_4351 ) ) ( ON_BOARD ?auto_4352 ?auto_4350 ) ( SUPPORTS ?auto_4352 ?auto_4348 ) ( not ( = ?auto_4347 ?auto_4349 ) ) ( HAVE_IMAGE ?auto_4351 ?auto_4353 ) ( not ( = ?auto_4351 ?auto_4349 ) ) ( not ( = ?auto_4353 ?auto_4348 ) ) ( CALIBRATION_TARGET ?auto_4352 ?auto_4349 ) ( POWER_AVAIL ?auto_4350 ) ( POINTING ?auto_4350 ?auto_4354 ) ( not ( = ?auto_4349 ?auto_4354 ) ) ( not ( = ?auto_4347 ?auto_4354 ) ) ( not ( = ?auto_4351 ?auto_4354 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_4350 ?auto_4349 ?auto_4354 )
      ( GET-2IMAGE ?auto_4351 ?auto_4353 ?auto_4347 ?auto_4348 )
      ( GET-1IMAGE-VERIFY ?auto_4347 ?auto_4348 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4356 - DIRECTION
      ?auto_4357 - MODE
      ?auto_4358 - DIRECTION
      ?auto_4355 - MODE
    )
    :vars
    (
      ?auto_4361 - INSTRUMENT
      ?auto_4359 - SATELLITE
      ?auto_4360 - DIRECTION
      ?auto_4362 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4358 ?auto_4356 ) ) ( ON_BOARD ?auto_4361 ?auto_4359 ) ( SUPPORTS ?auto_4361 ?auto_4355 ) ( not ( = ?auto_4358 ?auto_4360 ) ) ( HAVE_IMAGE ?auto_4356 ?auto_4357 ) ( not ( = ?auto_4356 ?auto_4360 ) ) ( not ( = ?auto_4357 ?auto_4355 ) ) ( CALIBRATION_TARGET ?auto_4361 ?auto_4360 ) ( POWER_AVAIL ?auto_4359 ) ( POINTING ?auto_4359 ?auto_4362 ) ( not ( = ?auto_4360 ?auto_4362 ) ) ( not ( = ?auto_4358 ?auto_4362 ) ) ( not ( = ?auto_4356 ?auto_4362 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4358 ?auto_4355 )
      ( GET-2IMAGE-VERIFY ?auto_4356 ?auto_4357 ?auto_4358 ?auto_4355 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4364 - DIRECTION
      ?auto_4365 - MODE
      ?auto_4366 - DIRECTION
      ?auto_4363 - MODE
    )
    :vars
    (
      ?auto_4367 - DIRECTION
      ?auto_4369 - INSTRUMENT
      ?auto_4370 - SATELLITE
      ?auto_4371 - DIRECTION
      ?auto_4368 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_4366 ?auto_4364 ) ) ( not ( = ?auto_4366 ?auto_4367 ) ) ( ON_BOARD ?auto_4369 ?auto_4370 ) ( SUPPORTS ?auto_4369 ?auto_4363 ) ( not ( = ?auto_4366 ?auto_4371 ) ) ( HAVE_IMAGE ?auto_4367 ?auto_4368 ) ( not ( = ?auto_4367 ?auto_4371 ) ) ( not ( = ?auto_4368 ?auto_4363 ) ) ( CALIBRATION_TARGET ?auto_4369 ?auto_4371 ) ( POWER_AVAIL ?auto_4370 ) ( POINTING ?auto_4370 ?auto_4364 ) ( not ( = ?auto_4371 ?auto_4364 ) ) ( not ( = ?auto_4367 ?auto_4364 ) ) ( HAVE_IMAGE ?auto_4364 ?auto_4365 ) ( not ( = ?auto_4365 ?auto_4363 ) ) ( not ( = ?auto_4365 ?auto_4368 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4367 ?auto_4368 ?auto_4366 ?auto_4363 )
      ( GET-2IMAGE-VERIFY ?auto_4364 ?auto_4365 ?auto_4366 ?auto_4363 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4373 - DIRECTION
      ?auto_4374 - MODE
      ?auto_4375 - DIRECTION
      ?auto_4372 - MODE
    )
    :vars
    (
      ?auto_4377 - INSTRUMENT
      ?auto_4378 - SATELLITE
      ?auto_4379 - DIRECTION
      ?auto_4376 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4375 ?auto_4373 ) ) ( ON_BOARD ?auto_4377 ?auto_4378 ) ( SUPPORTS ?auto_4377 ?auto_4374 ) ( not ( = ?auto_4373 ?auto_4379 ) ) ( HAVE_IMAGE ?auto_4375 ?auto_4372 ) ( not ( = ?auto_4375 ?auto_4379 ) ) ( not ( = ?auto_4372 ?auto_4374 ) ) ( CALIBRATION_TARGET ?auto_4377 ?auto_4379 ) ( POWER_AVAIL ?auto_4378 ) ( POINTING ?auto_4378 ?auto_4376 ) ( not ( = ?auto_4379 ?auto_4376 ) ) ( not ( = ?auto_4373 ?auto_4376 ) ) ( not ( = ?auto_4375 ?auto_4376 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4375 ?auto_4372 ?auto_4373 ?auto_4374 )
      ( GET-2IMAGE-VERIFY ?auto_4373 ?auto_4374 ?auto_4375 ?auto_4372 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4381 - DIRECTION
      ?auto_4382 - MODE
      ?auto_4383 - DIRECTION
      ?auto_4380 - MODE
    )
    :vars
    (
      ?auto_4384 - DIRECTION
      ?auto_4386 - INSTRUMENT
      ?auto_4387 - SATELLITE
      ?auto_4388 - DIRECTION
      ?auto_4385 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_4383 ?auto_4381 ) ) ( not ( = ?auto_4381 ?auto_4384 ) ) ( ON_BOARD ?auto_4386 ?auto_4387 ) ( SUPPORTS ?auto_4386 ?auto_4382 ) ( not ( = ?auto_4381 ?auto_4388 ) ) ( HAVE_IMAGE ?auto_4384 ?auto_4385 ) ( not ( = ?auto_4384 ?auto_4388 ) ) ( not ( = ?auto_4385 ?auto_4382 ) ) ( CALIBRATION_TARGET ?auto_4386 ?auto_4388 ) ( POWER_AVAIL ?auto_4387 ) ( POINTING ?auto_4387 ?auto_4383 ) ( not ( = ?auto_4388 ?auto_4383 ) ) ( not ( = ?auto_4384 ?auto_4383 ) ) ( HAVE_IMAGE ?auto_4383 ?auto_4380 ) ( not ( = ?auto_4382 ?auto_4380 ) ) ( not ( = ?auto_4380 ?auto_4385 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4384 ?auto_4385 ?auto_4381 ?auto_4382 )
      ( GET-2IMAGE-VERIFY ?auto_4381 ?auto_4382 ?auto_4383 ?auto_4380 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4410 - DIRECTION
      ?auto_4411 - MODE
      ?auto_4412 - DIRECTION
      ?auto_4409 - MODE
      ?auto_4414 - DIRECTION
      ?auto_4413 - MODE
    )
    :vars
    (
      ?auto_4415 - INSTRUMENT
      ?auto_4416 - SATELLITE
      ?auto_4417 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4412 ?auto_4410 ) ) ( not ( = ?auto_4414 ?auto_4410 ) ) ( not ( = ?auto_4414 ?auto_4412 ) ) ( ON_BOARD ?auto_4415 ?auto_4416 ) ( SUPPORTS ?auto_4415 ?auto_4413 ) ( not ( = ?auto_4414 ?auto_4417 ) ) ( HAVE_IMAGE ?auto_4410 ?auto_4411 ) ( not ( = ?auto_4410 ?auto_4417 ) ) ( not ( = ?auto_4411 ?auto_4413 ) ) ( CALIBRATION_TARGET ?auto_4415 ?auto_4417 ) ( POWER_AVAIL ?auto_4416 ) ( POINTING ?auto_4416 ?auto_4412 ) ( not ( = ?auto_4417 ?auto_4412 ) ) ( HAVE_IMAGE ?auto_4412 ?auto_4409 ) ( not ( = ?auto_4411 ?auto_4409 ) ) ( not ( = ?auto_4409 ?auto_4413 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4410 ?auto_4411 ?auto_4414 ?auto_4413 )
      ( GET-3IMAGE-VERIFY ?auto_4410 ?auto_4411 ?auto_4412 ?auto_4409 ?auto_4414 ?auto_4413 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4429 - DIRECTION
      ?auto_4430 - MODE
      ?auto_4431 - DIRECTION
      ?auto_4428 - MODE
      ?auto_4433 - DIRECTION
      ?auto_4432 - MODE
    )
    :vars
    (
      ?auto_4434 - INSTRUMENT
      ?auto_4435 - SATELLITE
      ?auto_4436 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4431 ?auto_4429 ) ) ( not ( = ?auto_4433 ?auto_4429 ) ) ( not ( = ?auto_4433 ?auto_4431 ) ) ( ON_BOARD ?auto_4434 ?auto_4435 ) ( SUPPORTS ?auto_4434 ?auto_4428 ) ( not ( = ?auto_4431 ?auto_4436 ) ) ( HAVE_IMAGE ?auto_4429 ?auto_4430 ) ( not ( = ?auto_4429 ?auto_4436 ) ) ( not ( = ?auto_4430 ?auto_4428 ) ) ( CALIBRATION_TARGET ?auto_4434 ?auto_4436 ) ( POWER_AVAIL ?auto_4435 ) ( POINTING ?auto_4435 ?auto_4433 ) ( not ( = ?auto_4436 ?auto_4433 ) ) ( HAVE_IMAGE ?auto_4433 ?auto_4432 ) ( not ( = ?auto_4430 ?auto_4432 ) ) ( not ( = ?auto_4428 ?auto_4432 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4429 ?auto_4430 ?auto_4431 ?auto_4428 )
      ( GET-3IMAGE-VERIFY ?auto_4429 ?auto_4430 ?auto_4431 ?auto_4428 ?auto_4433 ?auto_4432 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4448 - DIRECTION
      ?auto_4449 - MODE
      ?auto_4450 - DIRECTION
      ?auto_4447 - MODE
      ?auto_4452 - DIRECTION
      ?auto_4451 - MODE
    )
    :vars
    (
      ?auto_4453 - INSTRUMENT
      ?auto_4454 - SATELLITE
      ?auto_4455 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4450 ?auto_4448 ) ) ( not ( = ?auto_4452 ?auto_4448 ) ) ( not ( = ?auto_4452 ?auto_4450 ) ) ( ON_BOARD ?auto_4453 ?auto_4454 ) ( SUPPORTS ?auto_4453 ?auto_4451 ) ( not ( = ?auto_4452 ?auto_4455 ) ) ( HAVE_IMAGE ?auto_4450 ?auto_4447 ) ( not ( = ?auto_4450 ?auto_4455 ) ) ( not ( = ?auto_4447 ?auto_4451 ) ) ( CALIBRATION_TARGET ?auto_4453 ?auto_4455 ) ( POWER_AVAIL ?auto_4454 ) ( POINTING ?auto_4454 ?auto_4448 ) ( not ( = ?auto_4455 ?auto_4448 ) ) ( HAVE_IMAGE ?auto_4448 ?auto_4449 ) ( not ( = ?auto_4449 ?auto_4447 ) ) ( not ( = ?auto_4449 ?auto_4451 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4450 ?auto_4447 ?auto_4452 ?auto_4451 )
      ( GET-3IMAGE-VERIFY ?auto_4448 ?auto_4449 ?auto_4450 ?auto_4447 ?auto_4452 ?auto_4451 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4468 - DIRECTION
      ?auto_4469 - MODE
      ?auto_4470 - DIRECTION
      ?auto_4467 - MODE
      ?auto_4472 - DIRECTION
      ?auto_4471 - MODE
    )
    :vars
    (
      ?auto_4473 - INSTRUMENT
      ?auto_4474 - SATELLITE
      ?auto_4475 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4470 ?auto_4468 ) ) ( not ( = ?auto_4472 ?auto_4468 ) ) ( not ( = ?auto_4472 ?auto_4470 ) ) ( ON_BOARD ?auto_4473 ?auto_4474 ) ( SUPPORTS ?auto_4473 ?auto_4467 ) ( not ( = ?auto_4470 ?auto_4475 ) ) ( HAVE_IMAGE ?auto_4472 ?auto_4471 ) ( not ( = ?auto_4472 ?auto_4475 ) ) ( not ( = ?auto_4471 ?auto_4467 ) ) ( CALIBRATION_TARGET ?auto_4473 ?auto_4475 ) ( POWER_AVAIL ?auto_4474 ) ( POINTING ?auto_4474 ?auto_4468 ) ( not ( = ?auto_4475 ?auto_4468 ) ) ( HAVE_IMAGE ?auto_4468 ?auto_4469 ) ( not ( = ?auto_4469 ?auto_4467 ) ) ( not ( = ?auto_4469 ?auto_4471 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4472 ?auto_4471 ?auto_4470 ?auto_4467 )
      ( GET-3IMAGE-VERIFY ?auto_4468 ?auto_4469 ?auto_4470 ?auto_4467 ?auto_4472 ?auto_4471 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4509 - DIRECTION
      ?auto_4510 - MODE
      ?auto_4511 - DIRECTION
      ?auto_4508 - MODE
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
    ( and ( not ( = ?auto_4511 ?auto_4509 ) ) ( not ( = ?auto_4513 ?auto_4509 ) ) ( not ( = ?auto_4513 ?auto_4511 ) ) ( ON_BOARD ?auto_4514 ?auto_4515 ) ( SUPPORTS ?auto_4514 ?auto_4510 ) ( not ( = ?auto_4509 ?auto_4516 ) ) ( HAVE_IMAGE ?auto_4511 ?auto_4508 ) ( not ( = ?auto_4511 ?auto_4516 ) ) ( not ( = ?auto_4508 ?auto_4510 ) ) ( CALIBRATION_TARGET ?auto_4514 ?auto_4516 ) ( POWER_AVAIL ?auto_4515 ) ( POINTING ?auto_4515 ?auto_4513 ) ( not ( = ?auto_4516 ?auto_4513 ) ) ( HAVE_IMAGE ?auto_4513 ?auto_4512 ) ( not ( = ?auto_4510 ?auto_4512 ) ) ( not ( = ?auto_4508 ?auto_4512 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4511 ?auto_4508 ?auto_4509 ?auto_4510 )
      ( GET-3IMAGE-VERIFY ?auto_4509 ?auto_4510 ?auto_4511 ?auto_4508 ?auto_4513 ?auto_4512 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4528 - DIRECTION
      ?auto_4529 - MODE
      ?auto_4530 - DIRECTION
      ?auto_4527 - MODE
      ?auto_4532 - DIRECTION
      ?auto_4531 - MODE
    )
    :vars
    (
      ?auto_4533 - INSTRUMENT
      ?auto_4534 - SATELLITE
      ?auto_4535 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4530 ?auto_4528 ) ) ( not ( = ?auto_4532 ?auto_4528 ) ) ( not ( = ?auto_4532 ?auto_4530 ) ) ( ON_BOARD ?auto_4533 ?auto_4534 ) ( SUPPORTS ?auto_4533 ?auto_4529 ) ( not ( = ?auto_4528 ?auto_4535 ) ) ( HAVE_IMAGE ?auto_4532 ?auto_4531 ) ( not ( = ?auto_4532 ?auto_4535 ) ) ( not ( = ?auto_4531 ?auto_4529 ) ) ( CALIBRATION_TARGET ?auto_4533 ?auto_4535 ) ( POWER_AVAIL ?auto_4534 ) ( POINTING ?auto_4534 ?auto_4530 ) ( not ( = ?auto_4535 ?auto_4530 ) ) ( HAVE_IMAGE ?auto_4530 ?auto_4527 ) ( not ( = ?auto_4529 ?auto_4527 ) ) ( not ( = ?auto_4527 ?auto_4531 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4532 ?auto_4531 ?auto_4528 ?auto_4529 )
      ( GET-3IMAGE-VERIFY ?auto_4528 ?auto_4529 ?auto_4530 ?auto_4527 ?auto_4532 ?auto_4531 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_4591 - DIRECTION
      ?auto_4592 - MODE
    )
    :vars
    (
      ?auto_4593 - DIRECTION
      ?auto_4596 - INSTRUMENT
      ?auto_4597 - SATELLITE
      ?auto_4598 - DIRECTION
      ?auto_4594 - MODE
      ?auto_4595 - DIRECTION
      ?auto_4599 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4591 ?auto_4593 ) ) ( ON_BOARD ?auto_4596 ?auto_4597 ) ( SUPPORTS ?auto_4596 ?auto_4592 ) ( not ( = ?auto_4591 ?auto_4598 ) ) ( HAVE_IMAGE ?auto_4593 ?auto_4594 ) ( not ( = ?auto_4593 ?auto_4598 ) ) ( not ( = ?auto_4594 ?auto_4592 ) ) ( CALIBRATION_TARGET ?auto_4596 ?auto_4598 ) ( POINTING ?auto_4597 ?auto_4595 ) ( not ( = ?auto_4598 ?auto_4595 ) ) ( not ( = ?auto_4591 ?auto_4595 ) ) ( not ( = ?auto_4593 ?auto_4595 ) ) ( ON_BOARD ?auto_4599 ?auto_4597 ) ( POWER_ON ?auto_4599 ) ( not ( = ?auto_4596 ?auto_4599 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_4599 ?auto_4597 )
      ( GET-2IMAGE ?auto_4593 ?auto_4594 ?auto_4591 ?auto_4592 )
      ( GET-1IMAGE-VERIFY ?auto_4591 ?auto_4592 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4601 - DIRECTION
      ?auto_4602 - MODE
      ?auto_4603 - DIRECTION
      ?auto_4600 - MODE
    )
    :vars
    (
      ?auto_4606 - INSTRUMENT
      ?auto_4607 - SATELLITE
      ?auto_4604 - DIRECTION
      ?auto_4605 - DIRECTION
      ?auto_4608 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4603 ?auto_4601 ) ) ( ON_BOARD ?auto_4606 ?auto_4607 ) ( SUPPORTS ?auto_4606 ?auto_4600 ) ( not ( = ?auto_4603 ?auto_4604 ) ) ( HAVE_IMAGE ?auto_4601 ?auto_4602 ) ( not ( = ?auto_4601 ?auto_4604 ) ) ( not ( = ?auto_4602 ?auto_4600 ) ) ( CALIBRATION_TARGET ?auto_4606 ?auto_4604 ) ( POINTING ?auto_4607 ?auto_4605 ) ( not ( = ?auto_4604 ?auto_4605 ) ) ( not ( = ?auto_4603 ?auto_4605 ) ) ( not ( = ?auto_4601 ?auto_4605 ) ) ( ON_BOARD ?auto_4608 ?auto_4607 ) ( POWER_ON ?auto_4608 ) ( not ( = ?auto_4606 ?auto_4608 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_4603 ?auto_4600 )
      ( GET-2IMAGE-VERIFY ?auto_4601 ?auto_4602 ?auto_4603 ?auto_4600 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4610 - DIRECTION
      ?auto_4611 - MODE
      ?auto_4612 - DIRECTION
      ?auto_4609 - MODE
    )
    :vars
    (
      ?auto_4616 - DIRECTION
      ?auto_4613 - INSTRUMENT
      ?auto_4617 - SATELLITE
      ?auto_4615 - DIRECTION
      ?auto_4614 - MODE
      ?auto_4618 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4612 ?auto_4610 ) ) ( not ( = ?auto_4612 ?auto_4616 ) ) ( ON_BOARD ?auto_4613 ?auto_4617 ) ( SUPPORTS ?auto_4613 ?auto_4609 ) ( not ( = ?auto_4612 ?auto_4615 ) ) ( HAVE_IMAGE ?auto_4616 ?auto_4614 ) ( not ( = ?auto_4616 ?auto_4615 ) ) ( not ( = ?auto_4614 ?auto_4609 ) ) ( CALIBRATION_TARGET ?auto_4613 ?auto_4615 ) ( POINTING ?auto_4617 ?auto_4610 ) ( not ( = ?auto_4615 ?auto_4610 ) ) ( not ( = ?auto_4616 ?auto_4610 ) ) ( ON_BOARD ?auto_4618 ?auto_4617 ) ( POWER_ON ?auto_4618 ) ( not ( = ?auto_4613 ?auto_4618 ) ) ( HAVE_IMAGE ?auto_4610 ?auto_4611 ) ( not ( = ?auto_4611 ?auto_4609 ) ) ( not ( = ?auto_4611 ?auto_4614 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4616 ?auto_4614 ?auto_4612 ?auto_4609 )
      ( GET-2IMAGE-VERIFY ?auto_4610 ?auto_4611 ?auto_4612 ?auto_4609 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4620 - DIRECTION
      ?auto_4621 - MODE
      ?auto_4622 - DIRECTION
      ?auto_4619 - MODE
    )
    :vars
    (
      ?auto_4623 - INSTRUMENT
      ?auto_4626 - SATELLITE
      ?auto_4625 - DIRECTION
      ?auto_4624 - DIRECTION
      ?auto_4627 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4622 ?auto_4620 ) ) ( ON_BOARD ?auto_4623 ?auto_4626 ) ( SUPPORTS ?auto_4623 ?auto_4621 ) ( not ( = ?auto_4620 ?auto_4625 ) ) ( HAVE_IMAGE ?auto_4622 ?auto_4619 ) ( not ( = ?auto_4622 ?auto_4625 ) ) ( not ( = ?auto_4619 ?auto_4621 ) ) ( CALIBRATION_TARGET ?auto_4623 ?auto_4625 ) ( POINTING ?auto_4626 ?auto_4624 ) ( not ( = ?auto_4625 ?auto_4624 ) ) ( not ( = ?auto_4620 ?auto_4624 ) ) ( not ( = ?auto_4622 ?auto_4624 ) ) ( ON_BOARD ?auto_4627 ?auto_4626 ) ( POWER_ON ?auto_4627 ) ( not ( = ?auto_4623 ?auto_4627 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4622 ?auto_4619 ?auto_4620 ?auto_4621 )
      ( GET-2IMAGE-VERIFY ?auto_4620 ?auto_4621 ?auto_4622 ?auto_4619 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_4629 - DIRECTION
      ?auto_4630 - MODE
      ?auto_4631 - DIRECTION
      ?auto_4628 - MODE
    )
    :vars
    (
      ?auto_4635 - DIRECTION
      ?auto_4632 - INSTRUMENT
      ?auto_4636 - SATELLITE
      ?auto_4634 - DIRECTION
      ?auto_4633 - MODE
      ?auto_4637 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4631 ?auto_4629 ) ) ( not ( = ?auto_4629 ?auto_4635 ) ) ( ON_BOARD ?auto_4632 ?auto_4636 ) ( SUPPORTS ?auto_4632 ?auto_4630 ) ( not ( = ?auto_4629 ?auto_4634 ) ) ( HAVE_IMAGE ?auto_4635 ?auto_4633 ) ( not ( = ?auto_4635 ?auto_4634 ) ) ( not ( = ?auto_4633 ?auto_4630 ) ) ( CALIBRATION_TARGET ?auto_4632 ?auto_4634 ) ( POINTING ?auto_4636 ?auto_4631 ) ( not ( = ?auto_4634 ?auto_4631 ) ) ( not ( = ?auto_4635 ?auto_4631 ) ) ( ON_BOARD ?auto_4637 ?auto_4636 ) ( POWER_ON ?auto_4637 ) ( not ( = ?auto_4632 ?auto_4637 ) ) ( HAVE_IMAGE ?auto_4631 ?auto_4628 ) ( not ( = ?auto_4630 ?auto_4628 ) ) ( not ( = ?auto_4628 ?auto_4633 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4635 ?auto_4633 ?auto_4629 ?auto_4630 )
      ( GET-2IMAGE-VERIFY ?auto_4629 ?auto_4630 ?auto_4631 ?auto_4628 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4661 - DIRECTION
      ?auto_4662 - MODE
      ?auto_4663 - DIRECTION
      ?auto_4660 - MODE
      ?auto_4665 - DIRECTION
      ?auto_4664 - MODE
    )
    :vars
    (
      ?auto_4666 - INSTRUMENT
      ?auto_4668 - SATELLITE
      ?auto_4667 - DIRECTION
      ?auto_4669 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4663 ?auto_4661 ) ) ( not ( = ?auto_4665 ?auto_4661 ) ) ( not ( = ?auto_4665 ?auto_4663 ) ) ( ON_BOARD ?auto_4666 ?auto_4668 ) ( SUPPORTS ?auto_4666 ?auto_4664 ) ( not ( = ?auto_4665 ?auto_4667 ) ) ( HAVE_IMAGE ?auto_4661 ?auto_4662 ) ( not ( = ?auto_4661 ?auto_4667 ) ) ( not ( = ?auto_4662 ?auto_4664 ) ) ( CALIBRATION_TARGET ?auto_4666 ?auto_4667 ) ( POINTING ?auto_4668 ?auto_4663 ) ( not ( = ?auto_4667 ?auto_4663 ) ) ( ON_BOARD ?auto_4669 ?auto_4668 ) ( POWER_ON ?auto_4669 ) ( not ( = ?auto_4666 ?auto_4669 ) ) ( HAVE_IMAGE ?auto_4663 ?auto_4660 ) ( not ( = ?auto_4662 ?auto_4660 ) ) ( not ( = ?auto_4660 ?auto_4664 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4661 ?auto_4662 ?auto_4665 ?auto_4664 )
      ( GET-3IMAGE-VERIFY ?auto_4661 ?auto_4662 ?auto_4663 ?auto_4660 ?auto_4665 ?auto_4664 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4682 - DIRECTION
      ?auto_4683 - MODE
      ?auto_4684 - DIRECTION
      ?auto_4681 - MODE
      ?auto_4686 - DIRECTION
      ?auto_4685 - MODE
    )
    :vars
    (
      ?auto_4687 - INSTRUMENT
      ?auto_4689 - SATELLITE
      ?auto_4688 - DIRECTION
      ?auto_4690 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4684 ?auto_4682 ) ) ( not ( = ?auto_4686 ?auto_4682 ) ) ( not ( = ?auto_4686 ?auto_4684 ) ) ( ON_BOARD ?auto_4687 ?auto_4689 ) ( SUPPORTS ?auto_4687 ?auto_4681 ) ( not ( = ?auto_4684 ?auto_4688 ) ) ( HAVE_IMAGE ?auto_4682 ?auto_4683 ) ( not ( = ?auto_4682 ?auto_4688 ) ) ( not ( = ?auto_4683 ?auto_4681 ) ) ( CALIBRATION_TARGET ?auto_4687 ?auto_4688 ) ( POINTING ?auto_4689 ?auto_4686 ) ( not ( = ?auto_4688 ?auto_4686 ) ) ( ON_BOARD ?auto_4690 ?auto_4689 ) ( POWER_ON ?auto_4690 ) ( not ( = ?auto_4687 ?auto_4690 ) ) ( HAVE_IMAGE ?auto_4686 ?auto_4685 ) ( not ( = ?auto_4683 ?auto_4685 ) ) ( not ( = ?auto_4681 ?auto_4685 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4682 ?auto_4683 ?auto_4684 ?auto_4681 )
      ( GET-3IMAGE-VERIFY ?auto_4682 ?auto_4683 ?auto_4684 ?auto_4681 ?auto_4686 ?auto_4685 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4703 - DIRECTION
      ?auto_4704 - MODE
      ?auto_4705 - DIRECTION
      ?auto_4702 - MODE
      ?auto_4707 - DIRECTION
      ?auto_4706 - MODE
    )
    :vars
    (
      ?auto_4708 - INSTRUMENT
      ?auto_4710 - SATELLITE
      ?auto_4709 - DIRECTION
      ?auto_4711 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4705 ?auto_4703 ) ) ( not ( = ?auto_4707 ?auto_4703 ) ) ( not ( = ?auto_4707 ?auto_4705 ) ) ( ON_BOARD ?auto_4708 ?auto_4710 ) ( SUPPORTS ?auto_4708 ?auto_4706 ) ( not ( = ?auto_4707 ?auto_4709 ) ) ( HAVE_IMAGE ?auto_4705 ?auto_4702 ) ( not ( = ?auto_4705 ?auto_4709 ) ) ( not ( = ?auto_4702 ?auto_4706 ) ) ( CALIBRATION_TARGET ?auto_4708 ?auto_4709 ) ( POINTING ?auto_4710 ?auto_4703 ) ( not ( = ?auto_4709 ?auto_4703 ) ) ( ON_BOARD ?auto_4711 ?auto_4710 ) ( POWER_ON ?auto_4711 ) ( not ( = ?auto_4708 ?auto_4711 ) ) ( HAVE_IMAGE ?auto_4703 ?auto_4704 ) ( not ( = ?auto_4704 ?auto_4702 ) ) ( not ( = ?auto_4704 ?auto_4706 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4705 ?auto_4702 ?auto_4707 ?auto_4706 )
      ( GET-3IMAGE-VERIFY ?auto_4703 ?auto_4704 ?auto_4705 ?auto_4702 ?auto_4707 ?auto_4706 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4725 - DIRECTION
      ?auto_4726 - MODE
      ?auto_4727 - DIRECTION
      ?auto_4724 - MODE
      ?auto_4729 - DIRECTION
      ?auto_4728 - MODE
    )
    :vars
    (
      ?auto_4730 - INSTRUMENT
      ?auto_4732 - SATELLITE
      ?auto_4731 - DIRECTION
      ?auto_4733 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4727 ?auto_4725 ) ) ( not ( = ?auto_4729 ?auto_4725 ) ) ( not ( = ?auto_4729 ?auto_4727 ) ) ( ON_BOARD ?auto_4730 ?auto_4732 ) ( SUPPORTS ?auto_4730 ?auto_4724 ) ( not ( = ?auto_4727 ?auto_4731 ) ) ( HAVE_IMAGE ?auto_4729 ?auto_4728 ) ( not ( = ?auto_4729 ?auto_4731 ) ) ( not ( = ?auto_4728 ?auto_4724 ) ) ( CALIBRATION_TARGET ?auto_4730 ?auto_4731 ) ( POINTING ?auto_4732 ?auto_4725 ) ( not ( = ?auto_4731 ?auto_4725 ) ) ( ON_BOARD ?auto_4733 ?auto_4732 ) ( POWER_ON ?auto_4733 ) ( not ( = ?auto_4730 ?auto_4733 ) ) ( HAVE_IMAGE ?auto_4725 ?auto_4726 ) ( not ( = ?auto_4726 ?auto_4724 ) ) ( not ( = ?auto_4726 ?auto_4728 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4729 ?auto_4728 ?auto_4727 ?auto_4724 )
      ( GET-3IMAGE-VERIFY ?auto_4725 ?auto_4726 ?auto_4727 ?auto_4724 ?auto_4729 ?auto_4728 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4770 - DIRECTION
      ?auto_4771 - MODE
      ?auto_4772 - DIRECTION
      ?auto_4769 - MODE
      ?auto_4774 - DIRECTION
      ?auto_4773 - MODE
    )
    :vars
    (
      ?auto_4775 - INSTRUMENT
      ?auto_4777 - SATELLITE
      ?auto_4776 - DIRECTION
      ?auto_4778 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4772 ?auto_4770 ) ) ( not ( = ?auto_4774 ?auto_4770 ) ) ( not ( = ?auto_4774 ?auto_4772 ) ) ( ON_BOARD ?auto_4775 ?auto_4777 ) ( SUPPORTS ?auto_4775 ?auto_4771 ) ( not ( = ?auto_4770 ?auto_4776 ) ) ( HAVE_IMAGE ?auto_4772 ?auto_4769 ) ( not ( = ?auto_4772 ?auto_4776 ) ) ( not ( = ?auto_4769 ?auto_4771 ) ) ( CALIBRATION_TARGET ?auto_4775 ?auto_4776 ) ( POINTING ?auto_4777 ?auto_4774 ) ( not ( = ?auto_4776 ?auto_4774 ) ) ( ON_BOARD ?auto_4778 ?auto_4777 ) ( POWER_ON ?auto_4778 ) ( not ( = ?auto_4775 ?auto_4778 ) ) ( HAVE_IMAGE ?auto_4774 ?auto_4773 ) ( not ( = ?auto_4771 ?auto_4773 ) ) ( not ( = ?auto_4769 ?auto_4773 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4772 ?auto_4769 ?auto_4770 ?auto_4771 )
      ( GET-3IMAGE-VERIFY ?auto_4770 ?auto_4771 ?auto_4772 ?auto_4769 ?auto_4774 ?auto_4773 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_4791 - DIRECTION
      ?auto_4792 - MODE
      ?auto_4793 - DIRECTION
      ?auto_4790 - MODE
      ?auto_4795 - DIRECTION
      ?auto_4794 - MODE
    )
    :vars
    (
      ?auto_4796 - INSTRUMENT
      ?auto_4798 - SATELLITE
      ?auto_4797 - DIRECTION
      ?auto_4799 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4793 ?auto_4791 ) ) ( not ( = ?auto_4795 ?auto_4791 ) ) ( not ( = ?auto_4795 ?auto_4793 ) ) ( ON_BOARD ?auto_4796 ?auto_4798 ) ( SUPPORTS ?auto_4796 ?auto_4792 ) ( not ( = ?auto_4791 ?auto_4797 ) ) ( HAVE_IMAGE ?auto_4795 ?auto_4794 ) ( not ( = ?auto_4795 ?auto_4797 ) ) ( not ( = ?auto_4794 ?auto_4792 ) ) ( CALIBRATION_TARGET ?auto_4796 ?auto_4797 ) ( POINTING ?auto_4798 ?auto_4793 ) ( not ( = ?auto_4797 ?auto_4793 ) ) ( ON_BOARD ?auto_4799 ?auto_4798 ) ( POWER_ON ?auto_4799 ) ( not ( = ?auto_4796 ?auto_4799 ) ) ( HAVE_IMAGE ?auto_4793 ?auto_4790 ) ( not ( = ?auto_4792 ?auto_4790 ) ) ( not ( = ?auto_4790 ?auto_4794 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4795 ?auto_4794 ?auto_4791 ?auto_4792 )
      ( GET-3IMAGE-VERIFY ?auto_4791 ?auto_4792 ?auto_4793 ?auto_4790 ?auto_4795 ?auto_4794 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_5112 - DIRECTION
      ?auto_5113 - MODE
    )
    :vars
    (
      ?auto_5119 - DIRECTION
      ?auto_5118 - INSTRUMENT
      ?auto_5115 - SATELLITE
      ?auto_5120 - DIRECTION
      ?auto_5116 - MODE
      ?auto_5117 - DIRECTION
      ?auto_5114 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5112 ?auto_5119 ) ) ( ON_BOARD ?auto_5118 ?auto_5115 ) ( SUPPORTS ?auto_5118 ?auto_5113 ) ( not ( = ?auto_5112 ?auto_5120 ) ) ( HAVE_IMAGE ?auto_5119 ?auto_5116 ) ( not ( = ?auto_5119 ?auto_5120 ) ) ( not ( = ?auto_5116 ?auto_5113 ) ) ( CALIBRATION_TARGET ?auto_5118 ?auto_5120 ) ( not ( = ?auto_5120 ?auto_5117 ) ) ( not ( = ?auto_5112 ?auto_5117 ) ) ( not ( = ?auto_5119 ?auto_5117 ) ) ( ON_BOARD ?auto_5114 ?auto_5115 ) ( POWER_ON ?auto_5114 ) ( not ( = ?auto_5118 ?auto_5114 ) ) ( POINTING ?auto_5115 ?auto_5120 ) )
    :subtasks
    ( ( !TURN_TO ?auto_5115 ?auto_5117 ?auto_5120 )
      ( GET-2IMAGE ?auto_5119 ?auto_5116 ?auto_5112 ?auto_5113 )
      ( GET-1IMAGE-VERIFY ?auto_5112 ?auto_5113 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_5122 - DIRECTION
      ?auto_5123 - MODE
      ?auto_5124 - DIRECTION
      ?auto_5121 - MODE
    )
    :vars
    (
      ?auto_5125 - INSTRUMENT
      ?auto_5126 - SATELLITE
      ?auto_5127 - DIRECTION
      ?auto_5129 - DIRECTION
      ?auto_5128 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5124 ?auto_5122 ) ) ( ON_BOARD ?auto_5125 ?auto_5126 ) ( SUPPORTS ?auto_5125 ?auto_5121 ) ( not ( = ?auto_5124 ?auto_5127 ) ) ( HAVE_IMAGE ?auto_5122 ?auto_5123 ) ( not ( = ?auto_5122 ?auto_5127 ) ) ( not ( = ?auto_5123 ?auto_5121 ) ) ( CALIBRATION_TARGET ?auto_5125 ?auto_5127 ) ( not ( = ?auto_5127 ?auto_5129 ) ) ( not ( = ?auto_5124 ?auto_5129 ) ) ( not ( = ?auto_5122 ?auto_5129 ) ) ( ON_BOARD ?auto_5128 ?auto_5126 ) ( POWER_ON ?auto_5128 ) ( not ( = ?auto_5125 ?auto_5128 ) ) ( POINTING ?auto_5126 ?auto_5127 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_5124 ?auto_5121 )
      ( GET-2IMAGE-VERIFY ?auto_5122 ?auto_5123 ?auto_5124 ?auto_5121 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_5141 - DIRECTION
      ?auto_5142 - MODE
      ?auto_5143 - DIRECTION
      ?auto_5140 - MODE
    )
    :vars
    (
      ?auto_5148 - INSTRUMENT
      ?auto_5144 - SATELLITE
      ?auto_5147 - DIRECTION
      ?auto_5146 - DIRECTION
      ?auto_5145 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_5143 ?auto_5141 ) ) ( ON_BOARD ?auto_5148 ?auto_5144 ) ( SUPPORTS ?auto_5148 ?auto_5142 ) ( not ( = ?auto_5141 ?auto_5147 ) ) ( HAVE_IMAGE ?auto_5143 ?auto_5140 ) ( not ( = ?auto_5143 ?auto_5147 ) ) ( not ( = ?auto_5140 ?auto_5142 ) ) ( CALIBRATION_TARGET ?auto_5148 ?auto_5147 ) ( not ( = ?auto_5147 ?auto_5146 ) ) ( not ( = ?auto_5141 ?auto_5146 ) ) ( not ( = ?auto_5143 ?auto_5146 ) ) ( ON_BOARD ?auto_5145 ?auto_5144 ) ( POWER_ON ?auto_5145 ) ( not ( = ?auto_5148 ?auto_5145 ) ) ( POINTING ?auto_5144 ?auto_5147 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5143 ?auto_5140 ?auto_5141 ?auto_5142 )
      ( GET-2IMAGE-VERIFY ?auto_5141 ?auto_5142 ?auto_5143 ?auto_5140 ) )
  )

)

