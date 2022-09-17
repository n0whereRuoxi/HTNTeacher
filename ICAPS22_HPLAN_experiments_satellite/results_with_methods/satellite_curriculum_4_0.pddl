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

  ( :method GET-4IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
      ?goal_dir2 - DIRECTION
      ?goal_mode2 - MODE
      ?goal_dir3 - DIRECTION
      ?goal_mode3 - MODE
      ?goal_dir4 - DIRECTION
      ?goal_mode4 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) ( HAVE_IMAGE ?goal_dir3 ?goal_mode3 ) ( HAVE_IMAGE ?goal_dir4 ?goal_mode4 ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2517 - DIRECTION
      ?auto_2518 - MODE
    )
    :vars
    (
      ?auto_2519 - INSTRUMENT
      ?auto_2520 - SATELLITE
      ?auto_2521 - DIRECTION
      ?auto_2522 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2519 ?auto_2520 ) ( SUPPORTS ?auto_2519 ?auto_2518 ) ( not ( = ?auto_2517 ?auto_2521 ) ) ( CALIBRATION_TARGET ?auto_2519 ?auto_2521 ) ( POWER_AVAIL ?auto_2520 ) ( POINTING ?auto_2520 ?auto_2522 ) ( not ( = ?auto_2521 ?auto_2522 ) ) ( not ( = ?auto_2517 ?auto_2522 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_2520 ?auto_2521 ?auto_2522 )
      ( !SWITCH_ON ?auto_2519 ?auto_2520 )
      ( !CALIBRATE ?auto_2520 ?auto_2519 ?auto_2521 )
      ( !TURN_TO ?auto_2520 ?auto_2517 ?auto_2521 )
      ( !TAKE_IMAGE ?auto_2520 ?auto_2517 ?auto_2519 ?auto_2518 )
      ( GET-1IMAGE-VERIFY ?auto_2517 ?auto_2518 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2525 - DIRECTION
      ?auto_2526 - MODE
    )
    :vars
    (
      ?auto_2527 - INSTRUMENT
      ?auto_2528 - SATELLITE
      ?auto_2529 - DIRECTION
      ?auto_2530 - DIRECTION
      ?auto_2531 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2527 ?auto_2528 ) ( SUPPORTS ?auto_2527 ?auto_2526 ) ( not ( = ?auto_2525 ?auto_2529 ) ) ( CALIBRATION_TARGET ?auto_2527 ?auto_2529 ) ( POINTING ?auto_2528 ?auto_2530 ) ( not ( = ?auto_2529 ?auto_2530 ) ) ( ON_BOARD ?auto_2531 ?auto_2528 ) ( POWER_ON ?auto_2531 ) ( not ( = ?auto_2525 ?auto_2530 ) ) ( not ( = ?auto_2527 ?auto_2531 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_2531 ?auto_2528 )
      ( !TURN_TO ?auto_2528 ?auto_2529 ?auto_2530 )
      ( !SWITCH_ON ?auto_2527 ?auto_2528 )
      ( !CALIBRATE ?auto_2528 ?auto_2527 ?auto_2529 )
      ( !TURN_TO ?auto_2528 ?auto_2525 ?auto_2529 )
      ( !TAKE_IMAGE ?auto_2528 ?auto_2525 ?auto_2527 ?auto_2526 )
      ( GET-1IMAGE-VERIFY ?auto_2525 ?auto_2526 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2544 - DIRECTION
      ?auto_2545 - MODE
      ?auto_2547 - DIRECTION
      ?auto_2546 - MODE
    )
    :vars
    (
      ?auto_2551 - INSTRUMENT
      ?auto_2548 - SATELLITE
      ?auto_2550 - DIRECTION
      ?auto_2549 - INSTRUMENT
      ?auto_2552 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2547 ?auto_2544 ) ) ( ON_BOARD ?auto_2551 ?auto_2548 ) ( SUPPORTS ?auto_2551 ?auto_2546 ) ( not ( = ?auto_2547 ?auto_2550 ) ) ( CALIBRATION_TARGET ?auto_2551 ?auto_2550 ) ( not ( = ?auto_2550 ?auto_2544 ) ) ( ON_BOARD ?auto_2549 ?auto_2548 ) ( not ( = ?auto_2551 ?auto_2549 ) ) ( SUPPORTS ?auto_2549 ?auto_2545 ) ( CALIBRATION_TARGET ?auto_2549 ?auto_2550 ) ( POWER_AVAIL ?auto_2548 ) ( POINTING ?auto_2548 ?auto_2552 ) ( not ( = ?auto_2550 ?auto_2552 ) ) ( not ( = ?auto_2544 ?auto_2552 ) ) ( not ( = ?auto_2545 ?auto_2546 ) ) ( not ( = ?auto_2547 ?auto_2552 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2544 ?auto_2545 )
      ( GET-1IMAGE ?auto_2547 ?auto_2546 )
      ( GET-2IMAGE-VERIFY ?auto_2544 ?auto_2545 ?auto_2547 ?auto_2546 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2553 - DIRECTION
      ?auto_2554 - MODE
      ?auto_2556 - DIRECTION
      ?auto_2555 - MODE
    )
    :vars
    (
      ?auto_2560 - INSTRUMENT
      ?auto_2559 - SATELLITE
      ?auto_2561 - DIRECTION
      ?auto_2558 - INSTRUMENT
      ?auto_2557 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2556 ?auto_2553 ) ) ( ON_BOARD ?auto_2560 ?auto_2559 ) ( SUPPORTS ?auto_2560 ?auto_2554 ) ( not ( = ?auto_2553 ?auto_2561 ) ) ( CALIBRATION_TARGET ?auto_2560 ?auto_2561 ) ( not ( = ?auto_2561 ?auto_2556 ) ) ( ON_BOARD ?auto_2558 ?auto_2559 ) ( not ( = ?auto_2560 ?auto_2558 ) ) ( SUPPORTS ?auto_2558 ?auto_2555 ) ( CALIBRATION_TARGET ?auto_2558 ?auto_2561 ) ( POWER_AVAIL ?auto_2559 ) ( POINTING ?auto_2559 ?auto_2557 ) ( not ( = ?auto_2561 ?auto_2557 ) ) ( not ( = ?auto_2556 ?auto_2557 ) ) ( not ( = ?auto_2555 ?auto_2554 ) ) ( not ( = ?auto_2553 ?auto_2557 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2556 ?auto_2555 ?auto_2553 ?auto_2554 )
      ( GET-2IMAGE-VERIFY ?auto_2553 ?auto_2554 ?auto_2556 ?auto_2555 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2575 - DIRECTION
      ?auto_2576 - MODE
    )
    :vars
    (
      ?auto_2577 - INSTRUMENT
      ?auto_2578 - SATELLITE
      ?auto_2579 - DIRECTION
      ?auto_2580 - DIRECTION
      ?auto_2581 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2577 ?auto_2578 ) ( SUPPORTS ?auto_2577 ?auto_2576 ) ( not ( = ?auto_2575 ?auto_2579 ) ) ( CALIBRATION_TARGET ?auto_2577 ?auto_2579 ) ( POINTING ?auto_2578 ?auto_2580 ) ( not ( = ?auto_2579 ?auto_2580 ) ) ( ON_BOARD ?auto_2581 ?auto_2578 ) ( POWER_ON ?auto_2581 ) ( not ( = ?auto_2575 ?auto_2580 ) ) ( not ( = ?auto_2577 ?auto_2581 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_2581 ?auto_2578 )
      ( !TURN_TO ?auto_2578 ?auto_2579 ?auto_2580 )
      ( !SWITCH_ON ?auto_2577 ?auto_2578 )
      ( !CALIBRATE ?auto_2578 ?auto_2577 ?auto_2579 )
      ( !TURN_TO ?auto_2578 ?auto_2575 ?auto_2579 )
      ( !TAKE_IMAGE ?auto_2578 ?auto_2575 ?auto_2577 ?auto_2576 )
      ( GET-1IMAGE-VERIFY ?auto_2575 ?auto_2576 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2710 - DIRECTION
      ?auto_2711 - MODE
      ?auto_2713 - DIRECTION
      ?auto_2712 - MODE
      ?auto_2714 - DIRECTION
      ?auto_2715 - MODE
    )
    :vars
    (
      ?auto_2717 - INSTRUMENT
      ?auto_2719 - SATELLITE
      ?auto_2718 - DIRECTION
      ?auto_2716 - INSTRUMENT
      ?auto_2721 - INSTRUMENT
      ?auto_2720 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2713 ?auto_2710 ) ) ( not ( = ?auto_2714 ?auto_2710 ) ) ( not ( = ?auto_2714 ?auto_2713 ) ) ( ON_BOARD ?auto_2717 ?auto_2719 ) ( SUPPORTS ?auto_2717 ?auto_2715 ) ( not ( = ?auto_2714 ?auto_2718 ) ) ( CALIBRATION_TARGET ?auto_2717 ?auto_2718 ) ( not ( = ?auto_2718 ?auto_2713 ) ) ( ON_BOARD ?auto_2716 ?auto_2719 ) ( not ( = ?auto_2717 ?auto_2716 ) ) ( SUPPORTS ?auto_2716 ?auto_2712 ) ( CALIBRATION_TARGET ?auto_2716 ?auto_2718 ) ( not ( = ?auto_2718 ?auto_2710 ) ) ( ON_BOARD ?auto_2721 ?auto_2719 ) ( not ( = ?auto_2716 ?auto_2721 ) ) ( SUPPORTS ?auto_2721 ?auto_2711 ) ( CALIBRATION_TARGET ?auto_2721 ?auto_2718 ) ( POWER_AVAIL ?auto_2719 ) ( POINTING ?auto_2719 ?auto_2720 ) ( not ( = ?auto_2718 ?auto_2720 ) ) ( not ( = ?auto_2710 ?auto_2720 ) ) ( not ( = ?auto_2711 ?auto_2712 ) ) ( not ( = ?auto_2713 ?auto_2720 ) ) ( not ( = ?auto_2711 ?auto_2715 ) ) ( not ( = ?auto_2712 ?auto_2715 ) ) ( not ( = ?auto_2714 ?auto_2720 ) ) ( not ( = ?auto_2717 ?auto_2721 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2713 ?auto_2712 ?auto_2710 ?auto_2711 )
      ( GET-1IMAGE ?auto_2714 ?auto_2715 )
      ( GET-3IMAGE-VERIFY ?auto_2710 ?auto_2711 ?auto_2713 ?auto_2712 ?auto_2714 ?auto_2715 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2736 - DIRECTION
      ?auto_2737 - MODE
      ?auto_2739 - DIRECTION
      ?auto_2738 - MODE
      ?auto_2740 - DIRECTION
      ?auto_2741 - MODE
    )
    :vars
    (
      ?auto_2743 - INSTRUMENT
      ?auto_2745 - SATELLITE
      ?auto_2746 - DIRECTION
      ?auto_2744 - INSTRUMENT
      ?auto_2742 - INSTRUMENT
      ?auto_2747 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2739 ?auto_2736 ) ) ( not ( = ?auto_2740 ?auto_2736 ) ) ( not ( = ?auto_2740 ?auto_2739 ) ) ( ON_BOARD ?auto_2743 ?auto_2745 ) ( SUPPORTS ?auto_2743 ?auto_2738 ) ( not ( = ?auto_2739 ?auto_2746 ) ) ( CALIBRATION_TARGET ?auto_2743 ?auto_2746 ) ( not ( = ?auto_2746 ?auto_2740 ) ) ( ON_BOARD ?auto_2744 ?auto_2745 ) ( not ( = ?auto_2743 ?auto_2744 ) ) ( SUPPORTS ?auto_2744 ?auto_2741 ) ( CALIBRATION_TARGET ?auto_2744 ?auto_2746 ) ( not ( = ?auto_2746 ?auto_2736 ) ) ( ON_BOARD ?auto_2742 ?auto_2745 ) ( not ( = ?auto_2744 ?auto_2742 ) ) ( SUPPORTS ?auto_2742 ?auto_2737 ) ( CALIBRATION_TARGET ?auto_2742 ?auto_2746 ) ( POWER_AVAIL ?auto_2745 ) ( POINTING ?auto_2745 ?auto_2747 ) ( not ( = ?auto_2746 ?auto_2747 ) ) ( not ( = ?auto_2736 ?auto_2747 ) ) ( not ( = ?auto_2737 ?auto_2741 ) ) ( not ( = ?auto_2740 ?auto_2747 ) ) ( not ( = ?auto_2737 ?auto_2738 ) ) ( not ( = ?auto_2741 ?auto_2738 ) ) ( not ( = ?auto_2739 ?auto_2747 ) ) ( not ( = ?auto_2743 ?auto_2742 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_2736 ?auto_2737 ?auto_2740 ?auto_2741 ?auto_2739 ?auto_2738 )
      ( GET-3IMAGE-VERIFY ?auto_2736 ?auto_2737 ?auto_2739 ?auto_2738 ?auto_2740 ?auto_2741 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2762 - DIRECTION
      ?auto_2763 - MODE
      ?auto_2765 - DIRECTION
      ?auto_2764 - MODE
      ?auto_2766 - DIRECTION
      ?auto_2767 - MODE
    )
    :vars
    (
      ?auto_2769 - INSTRUMENT
      ?auto_2772 - SATELLITE
      ?auto_2770 - DIRECTION
      ?auto_2771 - INSTRUMENT
      ?auto_2768 - INSTRUMENT
      ?auto_2773 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2765 ?auto_2762 ) ) ( not ( = ?auto_2766 ?auto_2762 ) ) ( not ( = ?auto_2766 ?auto_2765 ) ) ( ON_BOARD ?auto_2769 ?auto_2772 ) ( SUPPORTS ?auto_2769 ?auto_2767 ) ( not ( = ?auto_2766 ?auto_2770 ) ) ( CALIBRATION_TARGET ?auto_2769 ?auto_2770 ) ( not ( = ?auto_2770 ?auto_2762 ) ) ( ON_BOARD ?auto_2771 ?auto_2772 ) ( not ( = ?auto_2769 ?auto_2771 ) ) ( SUPPORTS ?auto_2771 ?auto_2763 ) ( CALIBRATION_TARGET ?auto_2771 ?auto_2770 ) ( not ( = ?auto_2770 ?auto_2765 ) ) ( ON_BOARD ?auto_2768 ?auto_2772 ) ( not ( = ?auto_2771 ?auto_2768 ) ) ( SUPPORTS ?auto_2768 ?auto_2764 ) ( CALIBRATION_TARGET ?auto_2768 ?auto_2770 ) ( POWER_AVAIL ?auto_2772 ) ( POINTING ?auto_2772 ?auto_2773 ) ( not ( = ?auto_2770 ?auto_2773 ) ) ( not ( = ?auto_2765 ?auto_2773 ) ) ( not ( = ?auto_2764 ?auto_2763 ) ) ( not ( = ?auto_2762 ?auto_2773 ) ) ( not ( = ?auto_2764 ?auto_2767 ) ) ( not ( = ?auto_2763 ?auto_2767 ) ) ( not ( = ?auto_2766 ?auto_2773 ) ) ( not ( = ?auto_2769 ?auto_2768 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_2765 ?auto_2764 ?auto_2766 ?auto_2767 ?auto_2762 ?auto_2763 )
      ( GET-3IMAGE-VERIFY ?auto_2762 ?auto_2763 ?auto_2765 ?auto_2764 ?auto_2766 ?auto_2767 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2788 - DIRECTION
      ?auto_2789 - MODE
      ?auto_2791 - DIRECTION
      ?auto_2790 - MODE
      ?auto_2792 - DIRECTION
      ?auto_2793 - MODE
    )
    :vars
    (
      ?auto_2795 - INSTRUMENT
      ?auto_2798 - SATELLITE
      ?auto_2796 - DIRECTION
      ?auto_2797 - INSTRUMENT
      ?auto_2794 - INSTRUMENT
      ?auto_2799 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2791 ?auto_2788 ) ) ( not ( = ?auto_2792 ?auto_2788 ) ) ( not ( = ?auto_2792 ?auto_2791 ) ) ( ON_BOARD ?auto_2795 ?auto_2798 ) ( SUPPORTS ?auto_2795 ?auto_2790 ) ( not ( = ?auto_2791 ?auto_2796 ) ) ( CALIBRATION_TARGET ?auto_2795 ?auto_2796 ) ( not ( = ?auto_2796 ?auto_2788 ) ) ( ON_BOARD ?auto_2797 ?auto_2798 ) ( not ( = ?auto_2795 ?auto_2797 ) ) ( SUPPORTS ?auto_2797 ?auto_2789 ) ( CALIBRATION_TARGET ?auto_2797 ?auto_2796 ) ( not ( = ?auto_2796 ?auto_2792 ) ) ( ON_BOARD ?auto_2794 ?auto_2798 ) ( not ( = ?auto_2797 ?auto_2794 ) ) ( SUPPORTS ?auto_2794 ?auto_2793 ) ( CALIBRATION_TARGET ?auto_2794 ?auto_2796 ) ( POWER_AVAIL ?auto_2798 ) ( POINTING ?auto_2798 ?auto_2799 ) ( not ( = ?auto_2796 ?auto_2799 ) ) ( not ( = ?auto_2792 ?auto_2799 ) ) ( not ( = ?auto_2793 ?auto_2789 ) ) ( not ( = ?auto_2788 ?auto_2799 ) ) ( not ( = ?auto_2793 ?auto_2790 ) ) ( not ( = ?auto_2789 ?auto_2790 ) ) ( not ( = ?auto_2791 ?auto_2799 ) ) ( not ( = ?auto_2795 ?auto_2794 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_2792 ?auto_2793 ?auto_2791 ?auto_2790 ?auto_2788 ?auto_2789 )
      ( GET-3IMAGE-VERIFY ?auto_2788 ?auto_2789 ?auto_2791 ?auto_2790 ?auto_2792 ?auto_2793 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2842 - DIRECTION
      ?auto_2843 - MODE
      ?auto_2845 - DIRECTION
      ?auto_2844 - MODE
      ?auto_2846 - DIRECTION
      ?auto_2847 - MODE
    )
    :vars
    (
      ?auto_2849 - INSTRUMENT
      ?auto_2852 - SATELLITE
      ?auto_2850 - DIRECTION
      ?auto_2851 - INSTRUMENT
      ?auto_2848 - INSTRUMENT
      ?auto_2853 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2845 ?auto_2842 ) ) ( not ( = ?auto_2846 ?auto_2842 ) ) ( not ( = ?auto_2846 ?auto_2845 ) ) ( ON_BOARD ?auto_2849 ?auto_2852 ) ( SUPPORTS ?auto_2849 ?auto_2843 ) ( not ( = ?auto_2842 ?auto_2850 ) ) ( CALIBRATION_TARGET ?auto_2849 ?auto_2850 ) ( not ( = ?auto_2850 ?auto_2846 ) ) ( ON_BOARD ?auto_2851 ?auto_2852 ) ( not ( = ?auto_2849 ?auto_2851 ) ) ( SUPPORTS ?auto_2851 ?auto_2847 ) ( CALIBRATION_TARGET ?auto_2851 ?auto_2850 ) ( not ( = ?auto_2850 ?auto_2845 ) ) ( ON_BOARD ?auto_2848 ?auto_2852 ) ( not ( = ?auto_2851 ?auto_2848 ) ) ( SUPPORTS ?auto_2848 ?auto_2844 ) ( CALIBRATION_TARGET ?auto_2848 ?auto_2850 ) ( POWER_AVAIL ?auto_2852 ) ( POINTING ?auto_2852 ?auto_2853 ) ( not ( = ?auto_2850 ?auto_2853 ) ) ( not ( = ?auto_2845 ?auto_2853 ) ) ( not ( = ?auto_2844 ?auto_2847 ) ) ( not ( = ?auto_2846 ?auto_2853 ) ) ( not ( = ?auto_2844 ?auto_2843 ) ) ( not ( = ?auto_2847 ?auto_2843 ) ) ( not ( = ?auto_2842 ?auto_2853 ) ) ( not ( = ?auto_2849 ?auto_2848 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_2845 ?auto_2844 ?auto_2842 ?auto_2843 ?auto_2846 ?auto_2847 )
      ( GET-3IMAGE-VERIFY ?auto_2842 ?auto_2843 ?auto_2845 ?auto_2844 ?auto_2846 ?auto_2847 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2868 - DIRECTION
      ?auto_2869 - MODE
      ?auto_2871 - DIRECTION
      ?auto_2870 - MODE
      ?auto_2872 - DIRECTION
      ?auto_2873 - MODE
    )
    :vars
    (
      ?auto_2875 - INSTRUMENT
      ?auto_2878 - SATELLITE
      ?auto_2876 - DIRECTION
      ?auto_2877 - INSTRUMENT
      ?auto_2874 - INSTRUMENT
      ?auto_2879 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2871 ?auto_2868 ) ) ( not ( = ?auto_2872 ?auto_2868 ) ) ( not ( = ?auto_2872 ?auto_2871 ) ) ( ON_BOARD ?auto_2875 ?auto_2878 ) ( SUPPORTS ?auto_2875 ?auto_2869 ) ( not ( = ?auto_2868 ?auto_2876 ) ) ( CALIBRATION_TARGET ?auto_2875 ?auto_2876 ) ( not ( = ?auto_2876 ?auto_2871 ) ) ( ON_BOARD ?auto_2877 ?auto_2878 ) ( not ( = ?auto_2875 ?auto_2877 ) ) ( SUPPORTS ?auto_2877 ?auto_2870 ) ( CALIBRATION_TARGET ?auto_2877 ?auto_2876 ) ( not ( = ?auto_2876 ?auto_2872 ) ) ( ON_BOARD ?auto_2874 ?auto_2878 ) ( not ( = ?auto_2877 ?auto_2874 ) ) ( SUPPORTS ?auto_2874 ?auto_2873 ) ( CALIBRATION_TARGET ?auto_2874 ?auto_2876 ) ( POWER_AVAIL ?auto_2878 ) ( POINTING ?auto_2878 ?auto_2879 ) ( not ( = ?auto_2876 ?auto_2879 ) ) ( not ( = ?auto_2872 ?auto_2879 ) ) ( not ( = ?auto_2873 ?auto_2870 ) ) ( not ( = ?auto_2871 ?auto_2879 ) ) ( not ( = ?auto_2873 ?auto_2869 ) ) ( not ( = ?auto_2870 ?auto_2869 ) ) ( not ( = ?auto_2868 ?auto_2879 ) ) ( not ( = ?auto_2875 ?auto_2874 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_2872 ?auto_2873 ?auto_2868 ?auto_2869 ?auto_2871 ?auto_2870 )
      ( GET-3IMAGE-VERIFY ?auto_2868 ?auto_2869 ?auto_2871 ?auto_2870 ?auto_2872 ?auto_2873 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2954 - DIRECTION
      ?auto_2955 - MODE
    )
    :vars
    (
      ?auto_2956 - INSTRUMENT
      ?auto_2957 - SATELLITE
      ?auto_2958 - DIRECTION
      ?auto_2959 - DIRECTION
      ?auto_2960 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2956 ?auto_2957 ) ( SUPPORTS ?auto_2956 ?auto_2955 ) ( not ( = ?auto_2954 ?auto_2958 ) ) ( CALIBRATION_TARGET ?auto_2956 ?auto_2958 ) ( POINTING ?auto_2957 ?auto_2959 ) ( not ( = ?auto_2958 ?auto_2959 ) ) ( ON_BOARD ?auto_2960 ?auto_2957 ) ( POWER_ON ?auto_2960 ) ( not ( = ?auto_2954 ?auto_2959 ) ) ( not ( = ?auto_2956 ?auto_2960 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_2960 ?auto_2957 )
      ( !TURN_TO ?auto_2957 ?auto_2958 ?auto_2959 )
      ( !SWITCH_ON ?auto_2956 ?auto_2957 )
      ( !CALIBRATE ?auto_2957 ?auto_2956 ?auto_2958 )
      ( !TURN_TO ?auto_2957 ?auto_2954 ?auto_2958 )
      ( !TAKE_IMAGE ?auto_2957 ?auto_2954 ?auto_2956 ?auto_2955 )
      ( GET-1IMAGE-VERIFY ?auto_2954 ?auto_2955 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4520 - DIRECTION
      ?auto_4521 - MODE
      ?auto_4523 - DIRECTION
      ?auto_4522 - MODE
      ?auto_4524 - DIRECTION
      ?auto_4525 - MODE
      ?auto_4526 - DIRECTION
      ?auto_4527 - MODE
    )
    :vars
    (
      ?auto_4528 - INSTRUMENT
      ?auto_4530 - SATELLITE
      ?auto_4529 - DIRECTION
      ?auto_4531 - INSTRUMENT
      ?auto_4533 - INSTRUMENT
      ?auto_4532 - INSTRUMENT
      ?auto_4534 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4523 ?auto_4520 ) ) ( not ( = ?auto_4524 ?auto_4520 ) ) ( not ( = ?auto_4524 ?auto_4523 ) ) ( not ( = ?auto_4526 ?auto_4520 ) ) ( not ( = ?auto_4526 ?auto_4523 ) ) ( not ( = ?auto_4526 ?auto_4524 ) ) ( ON_BOARD ?auto_4528 ?auto_4530 ) ( SUPPORTS ?auto_4528 ?auto_4527 ) ( not ( = ?auto_4526 ?auto_4529 ) ) ( CALIBRATION_TARGET ?auto_4528 ?auto_4529 ) ( not ( = ?auto_4529 ?auto_4524 ) ) ( ON_BOARD ?auto_4531 ?auto_4530 ) ( not ( = ?auto_4528 ?auto_4531 ) ) ( SUPPORTS ?auto_4531 ?auto_4525 ) ( CALIBRATION_TARGET ?auto_4531 ?auto_4529 ) ( not ( = ?auto_4529 ?auto_4523 ) ) ( ON_BOARD ?auto_4533 ?auto_4530 ) ( not ( = ?auto_4531 ?auto_4533 ) ) ( SUPPORTS ?auto_4533 ?auto_4522 ) ( CALIBRATION_TARGET ?auto_4533 ?auto_4529 ) ( not ( = ?auto_4529 ?auto_4520 ) ) ( ON_BOARD ?auto_4532 ?auto_4530 ) ( not ( = ?auto_4533 ?auto_4532 ) ) ( SUPPORTS ?auto_4532 ?auto_4521 ) ( CALIBRATION_TARGET ?auto_4532 ?auto_4529 ) ( POWER_AVAIL ?auto_4530 ) ( POINTING ?auto_4530 ?auto_4534 ) ( not ( = ?auto_4529 ?auto_4534 ) ) ( not ( = ?auto_4520 ?auto_4534 ) ) ( not ( = ?auto_4521 ?auto_4522 ) ) ( not ( = ?auto_4523 ?auto_4534 ) ) ( not ( = ?auto_4521 ?auto_4525 ) ) ( not ( = ?auto_4522 ?auto_4525 ) ) ( not ( = ?auto_4524 ?auto_4534 ) ) ( not ( = ?auto_4531 ?auto_4532 ) ) ( not ( = ?auto_4521 ?auto_4527 ) ) ( not ( = ?auto_4522 ?auto_4527 ) ) ( not ( = ?auto_4525 ?auto_4527 ) ) ( not ( = ?auto_4526 ?auto_4534 ) ) ( not ( = ?auto_4528 ?auto_4533 ) ) ( not ( = ?auto_4528 ?auto_4532 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_4520 ?auto_4521 ?auto_4524 ?auto_4525 ?auto_4523 ?auto_4522 )
      ( GET-1IMAGE ?auto_4526 ?auto_4527 )
      ( GET-4IMAGE-VERIFY ?auto_4520 ?auto_4521 ?auto_4523 ?auto_4522 ?auto_4524 ?auto_4525 ?auto_4526 ?auto_4527 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4569 - DIRECTION
      ?auto_4570 - MODE
      ?auto_4572 - DIRECTION
      ?auto_4571 - MODE
      ?auto_4573 - DIRECTION
      ?auto_4574 - MODE
      ?auto_4575 - DIRECTION
      ?auto_4576 - MODE
    )
    :vars
    (
      ?auto_4582 - INSTRUMENT
      ?auto_4581 - SATELLITE
      ?auto_4577 - DIRECTION
      ?auto_4580 - INSTRUMENT
      ?auto_4583 - INSTRUMENT
      ?auto_4579 - INSTRUMENT
      ?auto_4578 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4572 ?auto_4569 ) ) ( not ( = ?auto_4573 ?auto_4569 ) ) ( not ( = ?auto_4573 ?auto_4572 ) ) ( not ( = ?auto_4575 ?auto_4569 ) ) ( not ( = ?auto_4575 ?auto_4572 ) ) ( not ( = ?auto_4575 ?auto_4573 ) ) ( ON_BOARD ?auto_4582 ?auto_4581 ) ( SUPPORTS ?auto_4582 ?auto_4574 ) ( not ( = ?auto_4573 ?auto_4577 ) ) ( CALIBRATION_TARGET ?auto_4582 ?auto_4577 ) ( not ( = ?auto_4577 ?auto_4575 ) ) ( ON_BOARD ?auto_4580 ?auto_4581 ) ( not ( = ?auto_4582 ?auto_4580 ) ) ( SUPPORTS ?auto_4580 ?auto_4576 ) ( CALIBRATION_TARGET ?auto_4580 ?auto_4577 ) ( not ( = ?auto_4577 ?auto_4572 ) ) ( ON_BOARD ?auto_4583 ?auto_4581 ) ( not ( = ?auto_4580 ?auto_4583 ) ) ( SUPPORTS ?auto_4583 ?auto_4571 ) ( CALIBRATION_TARGET ?auto_4583 ?auto_4577 ) ( not ( = ?auto_4577 ?auto_4569 ) ) ( ON_BOARD ?auto_4579 ?auto_4581 ) ( not ( = ?auto_4583 ?auto_4579 ) ) ( SUPPORTS ?auto_4579 ?auto_4570 ) ( CALIBRATION_TARGET ?auto_4579 ?auto_4577 ) ( POWER_AVAIL ?auto_4581 ) ( POINTING ?auto_4581 ?auto_4578 ) ( not ( = ?auto_4577 ?auto_4578 ) ) ( not ( = ?auto_4569 ?auto_4578 ) ) ( not ( = ?auto_4570 ?auto_4571 ) ) ( not ( = ?auto_4572 ?auto_4578 ) ) ( not ( = ?auto_4570 ?auto_4576 ) ) ( not ( = ?auto_4571 ?auto_4576 ) ) ( not ( = ?auto_4575 ?auto_4578 ) ) ( not ( = ?auto_4580 ?auto_4579 ) ) ( not ( = ?auto_4570 ?auto_4574 ) ) ( not ( = ?auto_4571 ?auto_4574 ) ) ( not ( = ?auto_4576 ?auto_4574 ) ) ( not ( = ?auto_4573 ?auto_4578 ) ) ( not ( = ?auto_4582 ?auto_4583 ) ) ( not ( = ?auto_4582 ?auto_4579 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_4569 ?auto_4570 ?auto_4572 ?auto_4571 ?auto_4575 ?auto_4576 ?auto_4573 ?auto_4574 )
      ( GET-4IMAGE-VERIFY ?auto_4569 ?auto_4570 ?auto_4572 ?auto_4571 ?auto_4573 ?auto_4574 ?auto_4575 ?auto_4576 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4618 - DIRECTION
      ?auto_4619 - MODE
      ?auto_4621 - DIRECTION
      ?auto_4620 - MODE
      ?auto_4622 - DIRECTION
      ?auto_4623 - MODE
      ?auto_4624 - DIRECTION
      ?auto_4625 - MODE
    )
    :vars
    (
      ?auto_4629 - INSTRUMENT
      ?auto_4626 - SATELLITE
      ?auto_4631 - DIRECTION
      ?auto_4632 - INSTRUMENT
      ?auto_4628 - INSTRUMENT
      ?auto_4627 - INSTRUMENT
      ?auto_4630 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4621 ?auto_4618 ) ) ( not ( = ?auto_4622 ?auto_4618 ) ) ( not ( = ?auto_4622 ?auto_4621 ) ) ( not ( = ?auto_4624 ?auto_4618 ) ) ( not ( = ?auto_4624 ?auto_4621 ) ) ( not ( = ?auto_4624 ?auto_4622 ) ) ( ON_BOARD ?auto_4629 ?auto_4626 ) ( SUPPORTS ?auto_4629 ?auto_4625 ) ( not ( = ?auto_4624 ?auto_4631 ) ) ( CALIBRATION_TARGET ?auto_4629 ?auto_4631 ) ( not ( = ?auto_4631 ?auto_4621 ) ) ( ON_BOARD ?auto_4632 ?auto_4626 ) ( not ( = ?auto_4629 ?auto_4632 ) ) ( SUPPORTS ?auto_4632 ?auto_4620 ) ( CALIBRATION_TARGET ?auto_4632 ?auto_4631 ) ( not ( = ?auto_4631 ?auto_4622 ) ) ( ON_BOARD ?auto_4628 ?auto_4626 ) ( not ( = ?auto_4632 ?auto_4628 ) ) ( SUPPORTS ?auto_4628 ?auto_4623 ) ( CALIBRATION_TARGET ?auto_4628 ?auto_4631 ) ( not ( = ?auto_4631 ?auto_4618 ) ) ( ON_BOARD ?auto_4627 ?auto_4626 ) ( not ( = ?auto_4628 ?auto_4627 ) ) ( SUPPORTS ?auto_4627 ?auto_4619 ) ( CALIBRATION_TARGET ?auto_4627 ?auto_4631 ) ( POWER_AVAIL ?auto_4626 ) ( POINTING ?auto_4626 ?auto_4630 ) ( not ( = ?auto_4631 ?auto_4630 ) ) ( not ( = ?auto_4618 ?auto_4630 ) ) ( not ( = ?auto_4619 ?auto_4623 ) ) ( not ( = ?auto_4622 ?auto_4630 ) ) ( not ( = ?auto_4619 ?auto_4620 ) ) ( not ( = ?auto_4623 ?auto_4620 ) ) ( not ( = ?auto_4621 ?auto_4630 ) ) ( not ( = ?auto_4632 ?auto_4627 ) ) ( not ( = ?auto_4619 ?auto_4625 ) ) ( not ( = ?auto_4623 ?auto_4625 ) ) ( not ( = ?auto_4620 ?auto_4625 ) ) ( not ( = ?auto_4624 ?auto_4630 ) ) ( not ( = ?auto_4629 ?auto_4628 ) ) ( not ( = ?auto_4629 ?auto_4627 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_4618 ?auto_4619 ?auto_4622 ?auto_4623 ?auto_4624 ?auto_4625 ?auto_4621 ?auto_4620 )
      ( GET-4IMAGE-VERIFY ?auto_4618 ?auto_4619 ?auto_4621 ?auto_4620 ?auto_4622 ?auto_4623 ?auto_4624 ?auto_4625 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4667 - DIRECTION
      ?auto_4668 - MODE
      ?auto_4670 - DIRECTION
      ?auto_4669 - MODE
      ?auto_4671 - DIRECTION
      ?auto_4672 - MODE
      ?auto_4673 - DIRECTION
      ?auto_4674 - MODE
    )
    :vars
    (
      ?auto_4678 - INSTRUMENT
      ?auto_4675 - SATELLITE
      ?auto_4680 - DIRECTION
      ?auto_4681 - INSTRUMENT
      ?auto_4677 - INSTRUMENT
      ?auto_4676 - INSTRUMENT
      ?auto_4679 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4670 ?auto_4667 ) ) ( not ( = ?auto_4671 ?auto_4667 ) ) ( not ( = ?auto_4671 ?auto_4670 ) ) ( not ( = ?auto_4673 ?auto_4667 ) ) ( not ( = ?auto_4673 ?auto_4670 ) ) ( not ( = ?auto_4673 ?auto_4671 ) ) ( ON_BOARD ?auto_4678 ?auto_4675 ) ( SUPPORTS ?auto_4678 ?auto_4672 ) ( not ( = ?auto_4671 ?auto_4680 ) ) ( CALIBRATION_TARGET ?auto_4678 ?auto_4680 ) ( not ( = ?auto_4680 ?auto_4670 ) ) ( ON_BOARD ?auto_4681 ?auto_4675 ) ( not ( = ?auto_4678 ?auto_4681 ) ) ( SUPPORTS ?auto_4681 ?auto_4669 ) ( CALIBRATION_TARGET ?auto_4681 ?auto_4680 ) ( not ( = ?auto_4680 ?auto_4673 ) ) ( ON_BOARD ?auto_4677 ?auto_4675 ) ( not ( = ?auto_4681 ?auto_4677 ) ) ( SUPPORTS ?auto_4677 ?auto_4674 ) ( CALIBRATION_TARGET ?auto_4677 ?auto_4680 ) ( not ( = ?auto_4680 ?auto_4667 ) ) ( ON_BOARD ?auto_4676 ?auto_4675 ) ( not ( = ?auto_4677 ?auto_4676 ) ) ( SUPPORTS ?auto_4676 ?auto_4668 ) ( CALIBRATION_TARGET ?auto_4676 ?auto_4680 ) ( POWER_AVAIL ?auto_4675 ) ( POINTING ?auto_4675 ?auto_4679 ) ( not ( = ?auto_4680 ?auto_4679 ) ) ( not ( = ?auto_4667 ?auto_4679 ) ) ( not ( = ?auto_4668 ?auto_4674 ) ) ( not ( = ?auto_4673 ?auto_4679 ) ) ( not ( = ?auto_4668 ?auto_4669 ) ) ( not ( = ?auto_4674 ?auto_4669 ) ) ( not ( = ?auto_4670 ?auto_4679 ) ) ( not ( = ?auto_4681 ?auto_4676 ) ) ( not ( = ?auto_4668 ?auto_4672 ) ) ( not ( = ?auto_4674 ?auto_4672 ) ) ( not ( = ?auto_4669 ?auto_4672 ) ) ( not ( = ?auto_4671 ?auto_4679 ) ) ( not ( = ?auto_4678 ?auto_4677 ) ) ( not ( = ?auto_4678 ?auto_4676 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_4667 ?auto_4668 ?auto_4673 ?auto_4674 ?auto_4671 ?auto_4672 ?auto_4670 ?auto_4669 )
      ( GET-4IMAGE-VERIFY ?auto_4667 ?auto_4668 ?auto_4670 ?auto_4669 ?auto_4671 ?auto_4672 ?auto_4673 ?auto_4674 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4822 - DIRECTION
      ?auto_4823 - MODE
      ?auto_4825 - DIRECTION
      ?auto_4824 - MODE
      ?auto_4826 - DIRECTION
      ?auto_4827 - MODE
      ?auto_4828 - DIRECTION
      ?auto_4829 - MODE
    )
    :vars
    (
      ?auto_4833 - INSTRUMENT
      ?auto_4830 - SATELLITE
      ?auto_4835 - DIRECTION
      ?auto_4836 - INSTRUMENT
      ?auto_4832 - INSTRUMENT
      ?auto_4831 - INSTRUMENT
      ?auto_4834 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4825 ?auto_4822 ) ) ( not ( = ?auto_4826 ?auto_4822 ) ) ( not ( = ?auto_4826 ?auto_4825 ) ) ( not ( = ?auto_4828 ?auto_4822 ) ) ( not ( = ?auto_4828 ?auto_4825 ) ) ( not ( = ?auto_4828 ?auto_4826 ) ) ( ON_BOARD ?auto_4833 ?auto_4830 ) ( SUPPORTS ?auto_4833 ?auto_4824 ) ( not ( = ?auto_4825 ?auto_4835 ) ) ( CALIBRATION_TARGET ?auto_4833 ?auto_4835 ) ( not ( = ?auto_4835 ?auto_4828 ) ) ( ON_BOARD ?auto_4836 ?auto_4830 ) ( not ( = ?auto_4833 ?auto_4836 ) ) ( SUPPORTS ?auto_4836 ?auto_4829 ) ( CALIBRATION_TARGET ?auto_4836 ?auto_4835 ) ( not ( = ?auto_4835 ?auto_4826 ) ) ( ON_BOARD ?auto_4832 ?auto_4830 ) ( not ( = ?auto_4836 ?auto_4832 ) ) ( SUPPORTS ?auto_4832 ?auto_4827 ) ( CALIBRATION_TARGET ?auto_4832 ?auto_4835 ) ( not ( = ?auto_4835 ?auto_4822 ) ) ( ON_BOARD ?auto_4831 ?auto_4830 ) ( not ( = ?auto_4832 ?auto_4831 ) ) ( SUPPORTS ?auto_4831 ?auto_4823 ) ( CALIBRATION_TARGET ?auto_4831 ?auto_4835 ) ( POWER_AVAIL ?auto_4830 ) ( POINTING ?auto_4830 ?auto_4834 ) ( not ( = ?auto_4835 ?auto_4834 ) ) ( not ( = ?auto_4822 ?auto_4834 ) ) ( not ( = ?auto_4823 ?auto_4827 ) ) ( not ( = ?auto_4826 ?auto_4834 ) ) ( not ( = ?auto_4823 ?auto_4829 ) ) ( not ( = ?auto_4827 ?auto_4829 ) ) ( not ( = ?auto_4828 ?auto_4834 ) ) ( not ( = ?auto_4836 ?auto_4831 ) ) ( not ( = ?auto_4823 ?auto_4824 ) ) ( not ( = ?auto_4827 ?auto_4824 ) ) ( not ( = ?auto_4829 ?auto_4824 ) ) ( not ( = ?auto_4825 ?auto_4834 ) ) ( not ( = ?auto_4833 ?auto_4832 ) ) ( not ( = ?auto_4833 ?auto_4831 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_4822 ?auto_4823 ?auto_4826 ?auto_4827 ?auto_4825 ?auto_4824 ?auto_4828 ?auto_4829 )
      ( GET-4IMAGE-VERIFY ?auto_4822 ?auto_4823 ?auto_4825 ?auto_4824 ?auto_4826 ?auto_4827 ?auto_4828 ?auto_4829 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4871 - DIRECTION
      ?auto_4872 - MODE
      ?auto_4874 - DIRECTION
      ?auto_4873 - MODE
      ?auto_4875 - DIRECTION
      ?auto_4876 - MODE
      ?auto_4877 - DIRECTION
      ?auto_4878 - MODE
    )
    :vars
    (
      ?auto_4882 - INSTRUMENT
      ?auto_4879 - SATELLITE
      ?auto_4884 - DIRECTION
      ?auto_4885 - INSTRUMENT
      ?auto_4881 - INSTRUMENT
      ?auto_4880 - INSTRUMENT
      ?auto_4883 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4874 ?auto_4871 ) ) ( not ( = ?auto_4875 ?auto_4871 ) ) ( not ( = ?auto_4875 ?auto_4874 ) ) ( not ( = ?auto_4877 ?auto_4871 ) ) ( not ( = ?auto_4877 ?auto_4874 ) ) ( not ( = ?auto_4877 ?auto_4875 ) ) ( ON_BOARD ?auto_4882 ?auto_4879 ) ( SUPPORTS ?auto_4882 ?auto_4873 ) ( not ( = ?auto_4874 ?auto_4884 ) ) ( CALIBRATION_TARGET ?auto_4882 ?auto_4884 ) ( not ( = ?auto_4884 ?auto_4875 ) ) ( ON_BOARD ?auto_4885 ?auto_4879 ) ( not ( = ?auto_4882 ?auto_4885 ) ) ( SUPPORTS ?auto_4885 ?auto_4876 ) ( CALIBRATION_TARGET ?auto_4885 ?auto_4884 ) ( not ( = ?auto_4884 ?auto_4877 ) ) ( ON_BOARD ?auto_4881 ?auto_4879 ) ( not ( = ?auto_4885 ?auto_4881 ) ) ( SUPPORTS ?auto_4881 ?auto_4878 ) ( CALIBRATION_TARGET ?auto_4881 ?auto_4884 ) ( not ( = ?auto_4884 ?auto_4871 ) ) ( ON_BOARD ?auto_4880 ?auto_4879 ) ( not ( = ?auto_4881 ?auto_4880 ) ) ( SUPPORTS ?auto_4880 ?auto_4872 ) ( CALIBRATION_TARGET ?auto_4880 ?auto_4884 ) ( POWER_AVAIL ?auto_4879 ) ( POINTING ?auto_4879 ?auto_4883 ) ( not ( = ?auto_4884 ?auto_4883 ) ) ( not ( = ?auto_4871 ?auto_4883 ) ) ( not ( = ?auto_4872 ?auto_4878 ) ) ( not ( = ?auto_4877 ?auto_4883 ) ) ( not ( = ?auto_4872 ?auto_4876 ) ) ( not ( = ?auto_4878 ?auto_4876 ) ) ( not ( = ?auto_4875 ?auto_4883 ) ) ( not ( = ?auto_4885 ?auto_4880 ) ) ( not ( = ?auto_4872 ?auto_4873 ) ) ( not ( = ?auto_4878 ?auto_4873 ) ) ( not ( = ?auto_4876 ?auto_4873 ) ) ( not ( = ?auto_4874 ?auto_4883 ) ) ( not ( = ?auto_4882 ?auto_4881 ) ) ( not ( = ?auto_4882 ?auto_4880 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_4871 ?auto_4872 ?auto_4877 ?auto_4878 ?auto_4874 ?auto_4873 ?auto_4875 ?auto_4876 )
      ( GET-4IMAGE-VERIFY ?auto_4871 ?auto_4872 ?auto_4874 ?auto_4873 ?auto_4875 ?auto_4876 ?auto_4877 ?auto_4878 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5026 - DIRECTION
      ?auto_5027 - MODE
      ?auto_5029 - DIRECTION
      ?auto_5028 - MODE
      ?auto_5030 - DIRECTION
      ?auto_5031 - MODE
      ?auto_5032 - DIRECTION
      ?auto_5033 - MODE
    )
    :vars
    (
      ?auto_5037 - INSTRUMENT
      ?auto_5034 - SATELLITE
      ?auto_5039 - DIRECTION
      ?auto_5040 - INSTRUMENT
      ?auto_5036 - INSTRUMENT
      ?auto_5035 - INSTRUMENT
      ?auto_5038 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5029 ?auto_5026 ) ) ( not ( = ?auto_5030 ?auto_5026 ) ) ( not ( = ?auto_5030 ?auto_5029 ) ) ( not ( = ?auto_5032 ?auto_5026 ) ) ( not ( = ?auto_5032 ?auto_5029 ) ) ( not ( = ?auto_5032 ?auto_5030 ) ) ( ON_BOARD ?auto_5037 ?auto_5034 ) ( SUPPORTS ?auto_5037 ?auto_5033 ) ( not ( = ?auto_5032 ?auto_5039 ) ) ( CALIBRATION_TARGET ?auto_5037 ?auto_5039 ) ( not ( = ?auto_5039 ?auto_5030 ) ) ( ON_BOARD ?auto_5040 ?auto_5034 ) ( not ( = ?auto_5037 ?auto_5040 ) ) ( SUPPORTS ?auto_5040 ?auto_5031 ) ( CALIBRATION_TARGET ?auto_5040 ?auto_5039 ) ( not ( = ?auto_5039 ?auto_5026 ) ) ( ON_BOARD ?auto_5036 ?auto_5034 ) ( not ( = ?auto_5040 ?auto_5036 ) ) ( SUPPORTS ?auto_5036 ?auto_5027 ) ( CALIBRATION_TARGET ?auto_5036 ?auto_5039 ) ( not ( = ?auto_5039 ?auto_5029 ) ) ( ON_BOARD ?auto_5035 ?auto_5034 ) ( not ( = ?auto_5036 ?auto_5035 ) ) ( SUPPORTS ?auto_5035 ?auto_5028 ) ( CALIBRATION_TARGET ?auto_5035 ?auto_5039 ) ( POWER_AVAIL ?auto_5034 ) ( POINTING ?auto_5034 ?auto_5038 ) ( not ( = ?auto_5039 ?auto_5038 ) ) ( not ( = ?auto_5029 ?auto_5038 ) ) ( not ( = ?auto_5028 ?auto_5027 ) ) ( not ( = ?auto_5026 ?auto_5038 ) ) ( not ( = ?auto_5028 ?auto_5031 ) ) ( not ( = ?auto_5027 ?auto_5031 ) ) ( not ( = ?auto_5030 ?auto_5038 ) ) ( not ( = ?auto_5040 ?auto_5035 ) ) ( not ( = ?auto_5028 ?auto_5033 ) ) ( not ( = ?auto_5027 ?auto_5033 ) ) ( not ( = ?auto_5031 ?auto_5033 ) ) ( not ( = ?auto_5032 ?auto_5038 ) ) ( not ( = ?auto_5037 ?auto_5036 ) ) ( not ( = ?auto_5037 ?auto_5035 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_5029 ?auto_5028 ?auto_5026 ?auto_5027 ?auto_5032 ?auto_5033 ?auto_5030 ?auto_5031 )
      ( GET-4IMAGE-VERIFY ?auto_5026 ?auto_5027 ?auto_5029 ?auto_5028 ?auto_5030 ?auto_5031 ?auto_5032 ?auto_5033 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5075 - DIRECTION
      ?auto_5076 - MODE
      ?auto_5078 - DIRECTION
      ?auto_5077 - MODE
      ?auto_5079 - DIRECTION
      ?auto_5080 - MODE
      ?auto_5081 - DIRECTION
      ?auto_5082 - MODE
    )
    :vars
    (
      ?auto_5086 - INSTRUMENT
      ?auto_5083 - SATELLITE
      ?auto_5088 - DIRECTION
      ?auto_5089 - INSTRUMENT
      ?auto_5085 - INSTRUMENT
      ?auto_5084 - INSTRUMENT
      ?auto_5087 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5078 ?auto_5075 ) ) ( not ( = ?auto_5079 ?auto_5075 ) ) ( not ( = ?auto_5079 ?auto_5078 ) ) ( not ( = ?auto_5081 ?auto_5075 ) ) ( not ( = ?auto_5081 ?auto_5078 ) ) ( not ( = ?auto_5081 ?auto_5079 ) ) ( ON_BOARD ?auto_5086 ?auto_5083 ) ( SUPPORTS ?auto_5086 ?auto_5080 ) ( not ( = ?auto_5079 ?auto_5088 ) ) ( CALIBRATION_TARGET ?auto_5086 ?auto_5088 ) ( not ( = ?auto_5088 ?auto_5081 ) ) ( ON_BOARD ?auto_5089 ?auto_5083 ) ( not ( = ?auto_5086 ?auto_5089 ) ) ( SUPPORTS ?auto_5089 ?auto_5082 ) ( CALIBRATION_TARGET ?auto_5089 ?auto_5088 ) ( not ( = ?auto_5088 ?auto_5075 ) ) ( ON_BOARD ?auto_5085 ?auto_5083 ) ( not ( = ?auto_5089 ?auto_5085 ) ) ( SUPPORTS ?auto_5085 ?auto_5076 ) ( CALIBRATION_TARGET ?auto_5085 ?auto_5088 ) ( not ( = ?auto_5088 ?auto_5078 ) ) ( ON_BOARD ?auto_5084 ?auto_5083 ) ( not ( = ?auto_5085 ?auto_5084 ) ) ( SUPPORTS ?auto_5084 ?auto_5077 ) ( CALIBRATION_TARGET ?auto_5084 ?auto_5088 ) ( POWER_AVAIL ?auto_5083 ) ( POINTING ?auto_5083 ?auto_5087 ) ( not ( = ?auto_5088 ?auto_5087 ) ) ( not ( = ?auto_5078 ?auto_5087 ) ) ( not ( = ?auto_5077 ?auto_5076 ) ) ( not ( = ?auto_5075 ?auto_5087 ) ) ( not ( = ?auto_5077 ?auto_5082 ) ) ( not ( = ?auto_5076 ?auto_5082 ) ) ( not ( = ?auto_5081 ?auto_5087 ) ) ( not ( = ?auto_5089 ?auto_5084 ) ) ( not ( = ?auto_5077 ?auto_5080 ) ) ( not ( = ?auto_5076 ?auto_5080 ) ) ( not ( = ?auto_5082 ?auto_5080 ) ) ( not ( = ?auto_5079 ?auto_5087 ) ) ( not ( = ?auto_5086 ?auto_5085 ) ) ( not ( = ?auto_5086 ?auto_5084 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_5078 ?auto_5077 ?auto_5075 ?auto_5076 ?auto_5079 ?auto_5080 ?auto_5081 ?auto_5082 )
      ( GET-4IMAGE-VERIFY ?auto_5075 ?auto_5076 ?auto_5078 ?auto_5077 ?auto_5079 ?auto_5080 ?auto_5081 ?auto_5082 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5232 - DIRECTION
      ?auto_5233 - MODE
      ?auto_5235 - DIRECTION
      ?auto_5234 - MODE
      ?auto_5236 - DIRECTION
      ?auto_5237 - MODE
      ?auto_5238 - DIRECTION
      ?auto_5239 - MODE
    )
    :vars
    (
      ?auto_5243 - INSTRUMENT
      ?auto_5240 - SATELLITE
      ?auto_5245 - DIRECTION
      ?auto_5246 - INSTRUMENT
      ?auto_5242 - INSTRUMENT
      ?auto_5241 - INSTRUMENT
      ?auto_5244 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5235 ?auto_5232 ) ) ( not ( = ?auto_5236 ?auto_5232 ) ) ( not ( = ?auto_5236 ?auto_5235 ) ) ( not ( = ?auto_5238 ?auto_5232 ) ) ( not ( = ?auto_5238 ?auto_5235 ) ) ( not ( = ?auto_5238 ?auto_5236 ) ) ( ON_BOARD ?auto_5243 ?auto_5240 ) ( SUPPORTS ?auto_5243 ?auto_5239 ) ( not ( = ?auto_5238 ?auto_5245 ) ) ( CALIBRATION_TARGET ?auto_5243 ?auto_5245 ) ( not ( = ?auto_5245 ?auto_5235 ) ) ( ON_BOARD ?auto_5246 ?auto_5240 ) ( not ( = ?auto_5243 ?auto_5246 ) ) ( SUPPORTS ?auto_5246 ?auto_5234 ) ( CALIBRATION_TARGET ?auto_5246 ?auto_5245 ) ( not ( = ?auto_5245 ?auto_5232 ) ) ( ON_BOARD ?auto_5242 ?auto_5240 ) ( not ( = ?auto_5246 ?auto_5242 ) ) ( SUPPORTS ?auto_5242 ?auto_5233 ) ( CALIBRATION_TARGET ?auto_5242 ?auto_5245 ) ( not ( = ?auto_5245 ?auto_5236 ) ) ( ON_BOARD ?auto_5241 ?auto_5240 ) ( not ( = ?auto_5242 ?auto_5241 ) ) ( SUPPORTS ?auto_5241 ?auto_5237 ) ( CALIBRATION_TARGET ?auto_5241 ?auto_5245 ) ( POWER_AVAIL ?auto_5240 ) ( POINTING ?auto_5240 ?auto_5244 ) ( not ( = ?auto_5245 ?auto_5244 ) ) ( not ( = ?auto_5236 ?auto_5244 ) ) ( not ( = ?auto_5237 ?auto_5233 ) ) ( not ( = ?auto_5232 ?auto_5244 ) ) ( not ( = ?auto_5237 ?auto_5234 ) ) ( not ( = ?auto_5233 ?auto_5234 ) ) ( not ( = ?auto_5235 ?auto_5244 ) ) ( not ( = ?auto_5246 ?auto_5241 ) ) ( not ( = ?auto_5237 ?auto_5239 ) ) ( not ( = ?auto_5233 ?auto_5239 ) ) ( not ( = ?auto_5234 ?auto_5239 ) ) ( not ( = ?auto_5238 ?auto_5244 ) ) ( not ( = ?auto_5243 ?auto_5242 ) ) ( not ( = ?auto_5243 ?auto_5241 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_5236 ?auto_5237 ?auto_5232 ?auto_5233 ?auto_5238 ?auto_5239 ?auto_5235 ?auto_5234 )
      ( GET-4IMAGE-VERIFY ?auto_5232 ?auto_5233 ?auto_5235 ?auto_5234 ?auto_5236 ?auto_5237 ?auto_5238 ?auto_5239 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5281 - DIRECTION
      ?auto_5282 - MODE
      ?auto_5284 - DIRECTION
      ?auto_5283 - MODE
      ?auto_5285 - DIRECTION
      ?auto_5286 - MODE
      ?auto_5287 - DIRECTION
      ?auto_5288 - MODE
    )
    :vars
    (
      ?auto_5292 - INSTRUMENT
      ?auto_5289 - SATELLITE
      ?auto_5294 - DIRECTION
      ?auto_5295 - INSTRUMENT
      ?auto_5291 - INSTRUMENT
      ?auto_5290 - INSTRUMENT
      ?auto_5293 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5284 ?auto_5281 ) ) ( not ( = ?auto_5285 ?auto_5281 ) ) ( not ( = ?auto_5285 ?auto_5284 ) ) ( not ( = ?auto_5287 ?auto_5281 ) ) ( not ( = ?auto_5287 ?auto_5284 ) ) ( not ( = ?auto_5287 ?auto_5285 ) ) ( ON_BOARD ?auto_5292 ?auto_5289 ) ( SUPPORTS ?auto_5292 ?auto_5286 ) ( not ( = ?auto_5285 ?auto_5294 ) ) ( CALIBRATION_TARGET ?auto_5292 ?auto_5294 ) ( not ( = ?auto_5294 ?auto_5284 ) ) ( ON_BOARD ?auto_5295 ?auto_5289 ) ( not ( = ?auto_5292 ?auto_5295 ) ) ( SUPPORTS ?auto_5295 ?auto_5283 ) ( CALIBRATION_TARGET ?auto_5295 ?auto_5294 ) ( not ( = ?auto_5294 ?auto_5281 ) ) ( ON_BOARD ?auto_5291 ?auto_5289 ) ( not ( = ?auto_5295 ?auto_5291 ) ) ( SUPPORTS ?auto_5291 ?auto_5282 ) ( CALIBRATION_TARGET ?auto_5291 ?auto_5294 ) ( not ( = ?auto_5294 ?auto_5287 ) ) ( ON_BOARD ?auto_5290 ?auto_5289 ) ( not ( = ?auto_5291 ?auto_5290 ) ) ( SUPPORTS ?auto_5290 ?auto_5288 ) ( CALIBRATION_TARGET ?auto_5290 ?auto_5294 ) ( POWER_AVAIL ?auto_5289 ) ( POINTING ?auto_5289 ?auto_5293 ) ( not ( = ?auto_5294 ?auto_5293 ) ) ( not ( = ?auto_5287 ?auto_5293 ) ) ( not ( = ?auto_5288 ?auto_5282 ) ) ( not ( = ?auto_5281 ?auto_5293 ) ) ( not ( = ?auto_5288 ?auto_5283 ) ) ( not ( = ?auto_5282 ?auto_5283 ) ) ( not ( = ?auto_5284 ?auto_5293 ) ) ( not ( = ?auto_5295 ?auto_5290 ) ) ( not ( = ?auto_5288 ?auto_5286 ) ) ( not ( = ?auto_5282 ?auto_5286 ) ) ( not ( = ?auto_5283 ?auto_5286 ) ) ( not ( = ?auto_5285 ?auto_5293 ) ) ( not ( = ?auto_5292 ?auto_5291 ) ) ( not ( = ?auto_5292 ?auto_5290 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_5287 ?auto_5288 ?auto_5281 ?auto_5282 ?auto_5285 ?auto_5286 ?auto_5284 ?auto_5283 )
      ( GET-4IMAGE-VERIFY ?auto_5281 ?auto_5282 ?auto_5284 ?auto_5283 ?auto_5285 ?auto_5286 ?auto_5287 ?auto_5288 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5381 - DIRECTION
      ?auto_5382 - MODE
      ?auto_5384 - DIRECTION
      ?auto_5383 - MODE
      ?auto_5385 - DIRECTION
      ?auto_5386 - MODE
      ?auto_5387 - DIRECTION
      ?auto_5388 - MODE
    )
    :vars
    (
      ?auto_5392 - INSTRUMENT
      ?auto_5389 - SATELLITE
      ?auto_5394 - DIRECTION
      ?auto_5395 - INSTRUMENT
      ?auto_5391 - INSTRUMENT
      ?auto_5390 - INSTRUMENT
      ?auto_5393 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5384 ?auto_5381 ) ) ( not ( = ?auto_5385 ?auto_5381 ) ) ( not ( = ?auto_5385 ?auto_5384 ) ) ( not ( = ?auto_5387 ?auto_5381 ) ) ( not ( = ?auto_5387 ?auto_5384 ) ) ( not ( = ?auto_5387 ?auto_5385 ) ) ( ON_BOARD ?auto_5392 ?auto_5389 ) ( SUPPORTS ?auto_5392 ?auto_5383 ) ( not ( = ?auto_5384 ?auto_5394 ) ) ( CALIBRATION_TARGET ?auto_5392 ?auto_5394 ) ( not ( = ?auto_5394 ?auto_5387 ) ) ( ON_BOARD ?auto_5395 ?auto_5389 ) ( not ( = ?auto_5392 ?auto_5395 ) ) ( SUPPORTS ?auto_5395 ?auto_5388 ) ( CALIBRATION_TARGET ?auto_5395 ?auto_5394 ) ( not ( = ?auto_5394 ?auto_5381 ) ) ( ON_BOARD ?auto_5391 ?auto_5389 ) ( not ( = ?auto_5395 ?auto_5391 ) ) ( SUPPORTS ?auto_5391 ?auto_5382 ) ( CALIBRATION_TARGET ?auto_5391 ?auto_5394 ) ( not ( = ?auto_5394 ?auto_5385 ) ) ( ON_BOARD ?auto_5390 ?auto_5389 ) ( not ( = ?auto_5391 ?auto_5390 ) ) ( SUPPORTS ?auto_5390 ?auto_5386 ) ( CALIBRATION_TARGET ?auto_5390 ?auto_5394 ) ( POWER_AVAIL ?auto_5389 ) ( POINTING ?auto_5389 ?auto_5393 ) ( not ( = ?auto_5394 ?auto_5393 ) ) ( not ( = ?auto_5385 ?auto_5393 ) ) ( not ( = ?auto_5386 ?auto_5382 ) ) ( not ( = ?auto_5381 ?auto_5393 ) ) ( not ( = ?auto_5386 ?auto_5388 ) ) ( not ( = ?auto_5382 ?auto_5388 ) ) ( not ( = ?auto_5387 ?auto_5393 ) ) ( not ( = ?auto_5395 ?auto_5390 ) ) ( not ( = ?auto_5386 ?auto_5383 ) ) ( not ( = ?auto_5382 ?auto_5383 ) ) ( not ( = ?auto_5388 ?auto_5383 ) ) ( not ( = ?auto_5384 ?auto_5393 ) ) ( not ( = ?auto_5392 ?auto_5391 ) ) ( not ( = ?auto_5392 ?auto_5390 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_5385 ?auto_5386 ?auto_5381 ?auto_5382 ?auto_5384 ?auto_5383 ?auto_5387 ?auto_5388 )
      ( GET-4IMAGE-VERIFY ?auto_5381 ?auto_5382 ?auto_5384 ?auto_5383 ?auto_5385 ?auto_5386 ?auto_5387 ?auto_5388 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5485 - DIRECTION
      ?auto_5486 - MODE
      ?auto_5488 - DIRECTION
      ?auto_5487 - MODE
      ?auto_5489 - DIRECTION
      ?auto_5490 - MODE
      ?auto_5491 - DIRECTION
      ?auto_5492 - MODE
    )
    :vars
    (
      ?auto_5496 - INSTRUMENT
      ?auto_5493 - SATELLITE
      ?auto_5498 - DIRECTION
      ?auto_5499 - INSTRUMENT
      ?auto_5495 - INSTRUMENT
      ?auto_5494 - INSTRUMENT
      ?auto_5497 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5488 ?auto_5485 ) ) ( not ( = ?auto_5489 ?auto_5485 ) ) ( not ( = ?auto_5489 ?auto_5488 ) ) ( not ( = ?auto_5491 ?auto_5485 ) ) ( not ( = ?auto_5491 ?auto_5488 ) ) ( not ( = ?auto_5491 ?auto_5489 ) ) ( ON_BOARD ?auto_5496 ?auto_5493 ) ( SUPPORTS ?auto_5496 ?auto_5487 ) ( not ( = ?auto_5488 ?auto_5498 ) ) ( CALIBRATION_TARGET ?auto_5496 ?auto_5498 ) ( not ( = ?auto_5498 ?auto_5489 ) ) ( ON_BOARD ?auto_5499 ?auto_5493 ) ( not ( = ?auto_5496 ?auto_5499 ) ) ( SUPPORTS ?auto_5499 ?auto_5490 ) ( CALIBRATION_TARGET ?auto_5499 ?auto_5498 ) ( not ( = ?auto_5498 ?auto_5485 ) ) ( ON_BOARD ?auto_5495 ?auto_5493 ) ( not ( = ?auto_5499 ?auto_5495 ) ) ( SUPPORTS ?auto_5495 ?auto_5486 ) ( CALIBRATION_TARGET ?auto_5495 ?auto_5498 ) ( not ( = ?auto_5498 ?auto_5491 ) ) ( ON_BOARD ?auto_5494 ?auto_5493 ) ( not ( = ?auto_5495 ?auto_5494 ) ) ( SUPPORTS ?auto_5494 ?auto_5492 ) ( CALIBRATION_TARGET ?auto_5494 ?auto_5498 ) ( POWER_AVAIL ?auto_5493 ) ( POINTING ?auto_5493 ?auto_5497 ) ( not ( = ?auto_5498 ?auto_5497 ) ) ( not ( = ?auto_5491 ?auto_5497 ) ) ( not ( = ?auto_5492 ?auto_5486 ) ) ( not ( = ?auto_5485 ?auto_5497 ) ) ( not ( = ?auto_5492 ?auto_5490 ) ) ( not ( = ?auto_5486 ?auto_5490 ) ) ( not ( = ?auto_5489 ?auto_5497 ) ) ( not ( = ?auto_5499 ?auto_5494 ) ) ( not ( = ?auto_5492 ?auto_5487 ) ) ( not ( = ?auto_5486 ?auto_5487 ) ) ( not ( = ?auto_5490 ?auto_5487 ) ) ( not ( = ?auto_5488 ?auto_5497 ) ) ( not ( = ?auto_5496 ?auto_5495 ) ) ( not ( = ?auto_5496 ?auto_5494 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_5491 ?auto_5492 ?auto_5485 ?auto_5486 ?auto_5488 ?auto_5487 ?auto_5489 ?auto_5490 )
      ( GET-4IMAGE-VERIFY ?auto_5485 ?auto_5486 ?auto_5488 ?auto_5487 ?auto_5489 ?auto_5490 ?auto_5491 ?auto_5492 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5640 - DIRECTION
      ?auto_5641 - MODE
      ?auto_5643 - DIRECTION
      ?auto_5642 - MODE
      ?auto_5644 - DIRECTION
      ?auto_5645 - MODE
      ?auto_5646 - DIRECTION
      ?auto_5647 - MODE
    )
    :vars
    (
      ?auto_5651 - INSTRUMENT
      ?auto_5648 - SATELLITE
      ?auto_5653 - DIRECTION
      ?auto_5654 - INSTRUMENT
      ?auto_5650 - INSTRUMENT
      ?auto_5649 - INSTRUMENT
      ?auto_5652 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5643 ?auto_5640 ) ) ( not ( = ?auto_5644 ?auto_5640 ) ) ( not ( = ?auto_5644 ?auto_5643 ) ) ( not ( = ?auto_5646 ?auto_5640 ) ) ( not ( = ?auto_5646 ?auto_5643 ) ) ( not ( = ?auto_5646 ?auto_5644 ) ) ( ON_BOARD ?auto_5651 ?auto_5648 ) ( SUPPORTS ?auto_5651 ?auto_5647 ) ( not ( = ?auto_5646 ?auto_5653 ) ) ( CALIBRATION_TARGET ?auto_5651 ?auto_5653 ) ( not ( = ?auto_5653 ?auto_5640 ) ) ( ON_BOARD ?auto_5654 ?auto_5648 ) ( not ( = ?auto_5651 ?auto_5654 ) ) ( SUPPORTS ?auto_5654 ?auto_5641 ) ( CALIBRATION_TARGET ?auto_5654 ?auto_5653 ) ( not ( = ?auto_5653 ?auto_5644 ) ) ( ON_BOARD ?auto_5650 ?auto_5648 ) ( not ( = ?auto_5654 ?auto_5650 ) ) ( SUPPORTS ?auto_5650 ?auto_5645 ) ( CALIBRATION_TARGET ?auto_5650 ?auto_5653 ) ( not ( = ?auto_5653 ?auto_5643 ) ) ( ON_BOARD ?auto_5649 ?auto_5648 ) ( not ( = ?auto_5650 ?auto_5649 ) ) ( SUPPORTS ?auto_5649 ?auto_5642 ) ( CALIBRATION_TARGET ?auto_5649 ?auto_5653 ) ( POWER_AVAIL ?auto_5648 ) ( POINTING ?auto_5648 ?auto_5652 ) ( not ( = ?auto_5653 ?auto_5652 ) ) ( not ( = ?auto_5643 ?auto_5652 ) ) ( not ( = ?auto_5642 ?auto_5645 ) ) ( not ( = ?auto_5644 ?auto_5652 ) ) ( not ( = ?auto_5642 ?auto_5641 ) ) ( not ( = ?auto_5645 ?auto_5641 ) ) ( not ( = ?auto_5640 ?auto_5652 ) ) ( not ( = ?auto_5654 ?auto_5649 ) ) ( not ( = ?auto_5642 ?auto_5647 ) ) ( not ( = ?auto_5645 ?auto_5647 ) ) ( not ( = ?auto_5641 ?auto_5647 ) ) ( not ( = ?auto_5646 ?auto_5652 ) ) ( not ( = ?auto_5651 ?auto_5650 ) ) ( not ( = ?auto_5651 ?auto_5649 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_5643 ?auto_5642 ?auto_5644 ?auto_5645 ?auto_5646 ?auto_5647 ?auto_5640 ?auto_5641 )
      ( GET-4IMAGE-VERIFY ?auto_5640 ?auto_5641 ?auto_5643 ?auto_5642 ?auto_5644 ?auto_5645 ?auto_5646 ?auto_5647 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5689 - DIRECTION
      ?auto_5690 - MODE
      ?auto_5692 - DIRECTION
      ?auto_5691 - MODE
      ?auto_5693 - DIRECTION
      ?auto_5694 - MODE
      ?auto_5695 - DIRECTION
      ?auto_5696 - MODE
    )
    :vars
    (
      ?auto_5700 - INSTRUMENT
      ?auto_5697 - SATELLITE
      ?auto_5702 - DIRECTION
      ?auto_5703 - INSTRUMENT
      ?auto_5699 - INSTRUMENT
      ?auto_5698 - INSTRUMENT
      ?auto_5701 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5692 ?auto_5689 ) ) ( not ( = ?auto_5693 ?auto_5689 ) ) ( not ( = ?auto_5693 ?auto_5692 ) ) ( not ( = ?auto_5695 ?auto_5689 ) ) ( not ( = ?auto_5695 ?auto_5692 ) ) ( not ( = ?auto_5695 ?auto_5693 ) ) ( ON_BOARD ?auto_5700 ?auto_5697 ) ( SUPPORTS ?auto_5700 ?auto_5694 ) ( not ( = ?auto_5693 ?auto_5702 ) ) ( CALIBRATION_TARGET ?auto_5700 ?auto_5702 ) ( not ( = ?auto_5702 ?auto_5689 ) ) ( ON_BOARD ?auto_5703 ?auto_5697 ) ( not ( = ?auto_5700 ?auto_5703 ) ) ( SUPPORTS ?auto_5703 ?auto_5690 ) ( CALIBRATION_TARGET ?auto_5703 ?auto_5702 ) ( not ( = ?auto_5702 ?auto_5695 ) ) ( ON_BOARD ?auto_5699 ?auto_5697 ) ( not ( = ?auto_5703 ?auto_5699 ) ) ( SUPPORTS ?auto_5699 ?auto_5696 ) ( CALIBRATION_TARGET ?auto_5699 ?auto_5702 ) ( not ( = ?auto_5702 ?auto_5692 ) ) ( ON_BOARD ?auto_5698 ?auto_5697 ) ( not ( = ?auto_5699 ?auto_5698 ) ) ( SUPPORTS ?auto_5698 ?auto_5691 ) ( CALIBRATION_TARGET ?auto_5698 ?auto_5702 ) ( POWER_AVAIL ?auto_5697 ) ( POINTING ?auto_5697 ?auto_5701 ) ( not ( = ?auto_5702 ?auto_5701 ) ) ( not ( = ?auto_5692 ?auto_5701 ) ) ( not ( = ?auto_5691 ?auto_5696 ) ) ( not ( = ?auto_5695 ?auto_5701 ) ) ( not ( = ?auto_5691 ?auto_5690 ) ) ( not ( = ?auto_5696 ?auto_5690 ) ) ( not ( = ?auto_5689 ?auto_5701 ) ) ( not ( = ?auto_5703 ?auto_5698 ) ) ( not ( = ?auto_5691 ?auto_5694 ) ) ( not ( = ?auto_5696 ?auto_5694 ) ) ( not ( = ?auto_5690 ?auto_5694 ) ) ( not ( = ?auto_5693 ?auto_5701 ) ) ( not ( = ?auto_5700 ?auto_5699 ) ) ( not ( = ?auto_5700 ?auto_5698 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_5692 ?auto_5691 ?auto_5695 ?auto_5696 ?auto_5693 ?auto_5694 ?auto_5689 ?auto_5690 )
      ( GET-4IMAGE-VERIFY ?auto_5689 ?auto_5690 ?auto_5692 ?auto_5691 ?auto_5693 ?auto_5694 ?auto_5695 ?auto_5696 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5738 - DIRECTION
      ?auto_5739 - MODE
      ?auto_5741 - DIRECTION
      ?auto_5740 - MODE
      ?auto_5742 - DIRECTION
      ?auto_5743 - MODE
      ?auto_5744 - DIRECTION
      ?auto_5745 - MODE
    )
    :vars
    (
      ?auto_5749 - INSTRUMENT
      ?auto_5746 - SATELLITE
      ?auto_5751 - DIRECTION
      ?auto_5752 - INSTRUMENT
      ?auto_5748 - INSTRUMENT
      ?auto_5747 - INSTRUMENT
      ?auto_5750 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5741 ?auto_5738 ) ) ( not ( = ?auto_5742 ?auto_5738 ) ) ( not ( = ?auto_5742 ?auto_5741 ) ) ( not ( = ?auto_5744 ?auto_5738 ) ) ( not ( = ?auto_5744 ?auto_5741 ) ) ( not ( = ?auto_5744 ?auto_5742 ) ) ( ON_BOARD ?auto_5749 ?auto_5746 ) ( SUPPORTS ?auto_5749 ?auto_5745 ) ( not ( = ?auto_5744 ?auto_5751 ) ) ( CALIBRATION_TARGET ?auto_5749 ?auto_5751 ) ( not ( = ?auto_5751 ?auto_5738 ) ) ( ON_BOARD ?auto_5752 ?auto_5746 ) ( not ( = ?auto_5749 ?auto_5752 ) ) ( SUPPORTS ?auto_5752 ?auto_5739 ) ( CALIBRATION_TARGET ?auto_5752 ?auto_5751 ) ( not ( = ?auto_5751 ?auto_5741 ) ) ( ON_BOARD ?auto_5748 ?auto_5746 ) ( not ( = ?auto_5752 ?auto_5748 ) ) ( SUPPORTS ?auto_5748 ?auto_5740 ) ( CALIBRATION_TARGET ?auto_5748 ?auto_5751 ) ( not ( = ?auto_5751 ?auto_5742 ) ) ( ON_BOARD ?auto_5747 ?auto_5746 ) ( not ( = ?auto_5748 ?auto_5747 ) ) ( SUPPORTS ?auto_5747 ?auto_5743 ) ( CALIBRATION_TARGET ?auto_5747 ?auto_5751 ) ( POWER_AVAIL ?auto_5746 ) ( POINTING ?auto_5746 ?auto_5750 ) ( not ( = ?auto_5751 ?auto_5750 ) ) ( not ( = ?auto_5742 ?auto_5750 ) ) ( not ( = ?auto_5743 ?auto_5740 ) ) ( not ( = ?auto_5741 ?auto_5750 ) ) ( not ( = ?auto_5743 ?auto_5739 ) ) ( not ( = ?auto_5740 ?auto_5739 ) ) ( not ( = ?auto_5738 ?auto_5750 ) ) ( not ( = ?auto_5752 ?auto_5747 ) ) ( not ( = ?auto_5743 ?auto_5745 ) ) ( not ( = ?auto_5740 ?auto_5745 ) ) ( not ( = ?auto_5739 ?auto_5745 ) ) ( not ( = ?auto_5744 ?auto_5750 ) ) ( not ( = ?auto_5749 ?auto_5748 ) ) ( not ( = ?auto_5749 ?auto_5747 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_5742 ?auto_5743 ?auto_5741 ?auto_5740 ?auto_5744 ?auto_5745 ?auto_5738 ?auto_5739 )
      ( GET-4IMAGE-VERIFY ?auto_5738 ?auto_5739 ?auto_5741 ?auto_5740 ?auto_5742 ?auto_5743 ?auto_5744 ?auto_5745 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5787 - DIRECTION
      ?auto_5788 - MODE
      ?auto_5790 - DIRECTION
      ?auto_5789 - MODE
      ?auto_5791 - DIRECTION
      ?auto_5792 - MODE
      ?auto_5793 - DIRECTION
      ?auto_5794 - MODE
    )
    :vars
    (
      ?auto_5798 - INSTRUMENT
      ?auto_5795 - SATELLITE
      ?auto_5800 - DIRECTION
      ?auto_5801 - INSTRUMENT
      ?auto_5797 - INSTRUMENT
      ?auto_5796 - INSTRUMENT
      ?auto_5799 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5790 ?auto_5787 ) ) ( not ( = ?auto_5791 ?auto_5787 ) ) ( not ( = ?auto_5791 ?auto_5790 ) ) ( not ( = ?auto_5793 ?auto_5787 ) ) ( not ( = ?auto_5793 ?auto_5790 ) ) ( not ( = ?auto_5793 ?auto_5791 ) ) ( ON_BOARD ?auto_5798 ?auto_5795 ) ( SUPPORTS ?auto_5798 ?auto_5792 ) ( not ( = ?auto_5791 ?auto_5800 ) ) ( CALIBRATION_TARGET ?auto_5798 ?auto_5800 ) ( not ( = ?auto_5800 ?auto_5787 ) ) ( ON_BOARD ?auto_5801 ?auto_5795 ) ( not ( = ?auto_5798 ?auto_5801 ) ) ( SUPPORTS ?auto_5801 ?auto_5788 ) ( CALIBRATION_TARGET ?auto_5801 ?auto_5800 ) ( not ( = ?auto_5800 ?auto_5790 ) ) ( ON_BOARD ?auto_5797 ?auto_5795 ) ( not ( = ?auto_5801 ?auto_5797 ) ) ( SUPPORTS ?auto_5797 ?auto_5789 ) ( CALIBRATION_TARGET ?auto_5797 ?auto_5800 ) ( not ( = ?auto_5800 ?auto_5793 ) ) ( ON_BOARD ?auto_5796 ?auto_5795 ) ( not ( = ?auto_5797 ?auto_5796 ) ) ( SUPPORTS ?auto_5796 ?auto_5794 ) ( CALIBRATION_TARGET ?auto_5796 ?auto_5800 ) ( POWER_AVAIL ?auto_5795 ) ( POINTING ?auto_5795 ?auto_5799 ) ( not ( = ?auto_5800 ?auto_5799 ) ) ( not ( = ?auto_5793 ?auto_5799 ) ) ( not ( = ?auto_5794 ?auto_5789 ) ) ( not ( = ?auto_5790 ?auto_5799 ) ) ( not ( = ?auto_5794 ?auto_5788 ) ) ( not ( = ?auto_5789 ?auto_5788 ) ) ( not ( = ?auto_5787 ?auto_5799 ) ) ( not ( = ?auto_5801 ?auto_5796 ) ) ( not ( = ?auto_5794 ?auto_5792 ) ) ( not ( = ?auto_5789 ?auto_5792 ) ) ( not ( = ?auto_5788 ?auto_5792 ) ) ( not ( = ?auto_5791 ?auto_5799 ) ) ( not ( = ?auto_5798 ?auto_5797 ) ) ( not ( = ?auto_5798 ?auto_5796 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_5793 ?auto_5794 ?auto_5790 ?auto_5789 ?auto_5791 ?auto_5792 ?auto_5787 ?auto_5788 )
      ( GET-4IMAGE-VERIFY ?auto_5787 ?auto_5788 ?auto_5790 ?auto_5789 ?auto_5791 ?auto_5792 ?auto_5793 ?auto_5794 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5995 - DIRECTION
      ?auto_5996 - MODE
      ?auto_5998 - DIRECTION
      ?auto_5997 - MODE
      ?auto_5999 - DIRECTION
      ?auto_6000 - MODE
      ?auto_6001 - DIRECTION
      ?auto_6002 - MODE
    )
    :vars
    (
      ?auto_6006 - INSTRUMENT
      ?auto_6003 - SATELLITE
      ?auto_6008 - DIRECTION
      ?auto_6009 - INSTRUMENT
      ?auto_6005 - INSTRUMENT
      ?auto_6004 - INSTRUMENT
      ?auto_6007 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_5998 ?auto_5995 ) ) ( not ( = ?auto_5999 ?auto_5995 ) ) ( not ( = ?auto_5999 ?auto_5998 ) ) ( not ( = ?auto_6001 ?auto_5995 ) ) ( not ( = ?auto_6001 ?auto_5998 ) ) ( not ( = ?auto_6001 ?auto_5999 ) ) ( ON_BOARD ?auto_6006 ?auto_6003 ) ( SUPPORTS ?auto_6006 ?auto_5997 ) ( not ( = ?auto_5998 ?auto_6008 ) ) ( CALIBRATION_TARGET ?auto_6006 ?auto_6008 ) ( not ( = ?auto_6008 ?auto_5995 ) ) ( ON_BOARD ?auto_6009 ?auto_6003 ) ( not ( = ?auto_6006 ?auto_6009 ) ) ( SUPPORTS ?auto_6009 ?auto_5996 ) ( CALIBRATION_TARGET ?auto_6009 ?auto_6008 ) ( not ( = ?auto_6008 ?auto_6001 ) ) ( ON_BOARD ?auto_6005 ?auto_6003 ) ( not ( = ?auto_6009 ?auto_6005 ) ) ( SUPPORTS ?auto_6005 ?auto_6002 ) ( CALIBRATION_TARGET ?auto_6005 ?auto_6008 ) ( not ( = ?auto_6008 ?auto_5999 ) ) ( ON_BOARD ?auto_6004 ?auto_6003 ) ( not ( = ?auto_6005 ?auto_6004 ) ) ( SUPPORTS ?auto_6004 ?auto_6000 ) ( CALIBRATION_TARGET ?auto_6004 ?auto_6008 ) ( POWER_AVAIL ?auto_6003 ) ( POINTING ?auto_6003 ?auto_6007 ) ( not ( = ?auto_6008 ?auto_6007 ) ) ( not ( = ?auto_5999 ?auto_6007 ) ) ( not ( = ?auto_6000 ?auto_6002 ) ) ( not ( = ?auto_6001 ?auto_6007 ) ) ( not ( = ?auto_6000 ?auto_5996 ) ) ( not ( = ?auto_6002 ?auto_5996 ) ) ( not ( = ?auto_5995 ?auto_6007 ) ) ( not ( = ?auto_6009 ?auto_6004 ) ) ( not ( = ?auto_6000 ?auto_5997 ) ) ( not ( = ?auto_6002 ?auto_5997 ) ) ( not ( = ?auto_5996 ?auto_5997 ) ) ( not ( = ?auto_5998 ?auto_6007 ) ) ( not ( = ?auto_6006 ?auto_6005 ) ) ( not ( = ?auto_6006 ?auto_6004 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_5999 ?auto_6000 ?auto_6001 ?auto_6002 ?auto_5998 ?auto_5997 ?auto_5995 ?auto_5996 )
      ( GET-4IMAGE-VERIFY ?auto_5995 ?auto_5996 ?auto_5998 ?auto_5997 ?auto_5999 ?auto_6000 ?auto_6001 ?auto_6002 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6044 - DIRECTION
      ?auto_6045 - MODE
      ?auto_6047 - DIRECTION
      ?auto_6046 - MODE
      ?auto_6048 - DIRECTION
      ?auto_6049 - MODE
      ?auto_6050 - DIRECTION
      ?auto_6051 - MODE
    )
    :vars
    (
      ?auto_6055 - INSTRUMENT
      ?auto_6052 - SATELLITE
      ?auto_6057 - DIRECTION
      ?auto_6058 - INSTRUMENT
      ?auto_6054 - INSTRUMENT
      ?auto_6053 - INSTRUMENT
      ?auto_6056 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6047 ?auto_6044 ) ) ( not ( = ?auto_6048 ?auto_6044 ) ) ( not ( = ?auto_6048 ?auto_6047 ) ) ( not ( = ?auto_6050 ?auto_6044 ) ) ( not ( = ?auto_6050 ?auto_6047 ) ) ( not ( = ?auto_6050 ?auto_6048 ) ) ( ON_BOARD ?auto_6055 ?auto_6052 ) ( SUPPORTS ?auto_6055 ?auto_6046 ) ( not ( = ?auto_6047 ?auto_6057 ) ) ( CALIBRATION_TARGET ?auto_6055 ?auto_6057 ) ( not ( = ?auto_6057 ?auto_6044 ) ) ( ON_BOARD ?auto_6058 ?auto_6052 ) ( not ( = ?auto_6055 ?auto_6058 ) ) ( SUPPORTS ?auto_6058 ?auto_6045 ) ( CALIBRATION_TARGET ?auto_6058 ?auto_6057 ) ( not ( = ?auto_6057 ?auto_6048 ) ) ( ON_BOARD ?auto_6054 ?auto_6052 ) ( not ( = ?auto_6058 ?auto_6054 ) ) ( SUPPORTS ?auto_6054 ?auto_6049 ) ( CALIBRATION_TARGET ?auto_6054 ?auto_6057 ) ( not ( = ?auto_6057 ?auto_6050 ) ) ( ON_BOARD ?auto_6053 ?auto_6052 ) ( not ( = ?auto_6054 ?auto_6053 ) ) ( SUPPORTS ?auto_6053 ?auto_6051 ) ( CALIBRATION_TARGET ?auto_6053 ?auto_6057 ) ( POWER_AVAIL ?auto_6052 ) ( POINTING ?auto_6052 ?auto_6056 ) ( not ( = ?auto_6057 ?auto_6056 ) ) ( not ( = ?auto_6050 ?auto_6056 ) ) ( not ( = ?auto_6051 ?auto_6049 ) ) ( not ( = ?auto_6048 ?auto_6056 ) ) ( not ( = ?auto_6051 ?auto_6045 ) ) ( not ( = ?auto_6049 ?auto_6045 ) ) ( not ( = ?auto_6044 ?auto_6056 ) ) ( not ( = ?auto_6058 ?auto_6053 ) ) ( not ( = ?auto_6051 ?auto_6046 ) ) ( not ( = ?auto_6049 ?auto_6046 ) ) ( not ( = ?auto_6045 ?auto_6046 ) ) ( not ( = ?auto_6047 ?auto_6056 ) ) ( not ( = ?auto_6055 ?auto_6054 ) ) ( not ( = ?auto_6055 ?auto_6053 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_6050 ?auto_6051 ?auto_6048 ?auto_6049 ?auto_6047 ?auto_6046 ?auto_6044 ?auto_6045 )
      ( GET-4IMAGE-VERIFY ?auto_6044 ?auto_6045 ?auto_6047 ?auto_6046 ?auto_6048 ?auto_6049 ?auto_6050 ?auto_6051 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6360 - DIRECTION
      ?auto_6361 - MODE
      ?auto_6363 - DIRECTION
      ?auto_6362 - MODE
      ?auto_6364 - DIRECTION
      ?auto_6365 - MODE
      ?auto_6366 - DIRECTION
      ?auto_6367 - MODE
    )
    :vars
    (
      ?auto_6371 - INSTRUMENT
      ?auto_6368 - SATELLITE
      ?auto_6373 - DIRECTION
      ?auto_6374 - INSTRUMENT
      ?auto_6370 - INSTRUMENT
      ?auto_6369 - INSTRUMENT
      ?auto_6372 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6363 ?auto_6360 ) ) ( not ( = ?auto_6364 ?auto_6360 ) ) ( not ( = ?auto_6364 ?auto_6363 ) ) ( not ( = ?auto_6366 ?auto_6360 ) ) ( not ( = ?auto_6366 ?auto_6363 ) ) ( not ( = ?auto_6366 ?auto_6364 ) ) ( ON_BOARD ?auto_6371 ?auto_6368 ) ( SUPPORTS ?auto_6371 ?auto_6361 ) ( not ( = ?auto_6360 ?auto_6373 ) ) ( CALIBRATION_TARGET ?auto_6371 ?auto_6373 ) ( not ( = ?auto_6373 ?auto_6366 ) ) ( ON_BOARD ?auto_6374 ?auto_6368 ) ( not ( = ?auto_6371 ?auto_6374 ) ) ( SUPPORTS ?auto_6374 ?auto_6367 ) ( CALIBRATION_TARGET ?auto_6374 ?auto_6373 ) ( not ( = ?auto_6373 ?auto_6364 ) ) ( ON_BOARD ?auto_6370 ?auto_6368 ) ( not ( = ?auto_6374 ?auto_6370 ) ) ( SUPPORTS ?auto_6370 ?auto_6365 ) ( CALIBRATION_TARGET ?auto_6370 ?auto_6373 ) ( not ( = ?auto_6373 ?auto_6363 ) ) ( ON_BOARD ?auto_6369 ?auto_6368 ) ( not ( = ?auto_6370 ?auto_6369 ) ) ( SUPPORTS ?auto_6369 ?auto_6362 ) ( CALIBRATION_TARGET ?auto_6369 ?auto_6373 ) ( POWER_AVAIL ?auto_6368 ) ( POINTING ?auto_6368 ?auto_6372 ) ( not ( = ?auto_6373 ?auto_6372 ) ) ( not ( = ?auto_6363 ?auto_6372 ) ) ( not ( = ?auto_6362 ?auto_6365 ) ) ( not ( = ?auto_6364 ?auto_6372 ) ) ( not ( = ?auto_6362 ?auto_6367 ) ) ( not ( = ?auto_6365 ?auto_6367 ) ) ( not ( = ?auto_6366 ?auto_6372 ) ) ( not ( = ?auto_6374 ?auto_6369 ) ) ( not ( = ?auto_6362 ?auto_6361 ) ) ( not ( = ?auto_6365 ?auto_6361 ) ) ( not ( = ?auto_6367 ?auto_6361 ) ) ( not ( = ?auto_6360 ?auto_6372 ) ) ( not ( = ?auto_6371 ?auto_6370 ) ) ( not ( = ?auto_6371 ?auto_6369 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_6363 ?auto_6362 ?auto_6364 ?auto_6365 ?auto_6360 ?auto_6361 ?auto_6366 ?auto_6367 )
      ( GET-4IMAGE-VERIFY ?auto_6360 ?auto_6361 ?auto_6363 ?auto_6362 ?auto_6364 ?auto_6365 ?auto_6366 ?auto_6367 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6409 - DIRECTION
      ?auto_6410 - MODE
      ?auto_6412 - DIRECTION
      ?auto_6411 - MODE
      ?auto_6413 - DIRECTION
      ?auto_6414 - MODE
      ?auto_6415 - DIRECTION
      ?auto_6416 - MODE
    )
    :vars
    (
      ?auto_6420 - INSTRUMENT
      ?auto_6417 - SATELLITE
      ?auto_6422 - DIRECTION
      ?auto_6423 - INSTRUMENT
      ?auto_6419 - INSTRUMENT
      ?auto_6418 - INSTRUMENT
      ?auto_6421 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6412 ?auto_6409 ) ) ( not ( = ?auto_6413 ?auto_6409 ) ) ( not ( = ?auto_6413 ?auto_6412 ) ) ( not ( = ?auto_6415 ?auto_6409 ) ) ( not ( = ?auto_6415 ?auto_6412 ) ) ( not ( = ?auto_6415 ?auto_6413 ) ) ( ON_BOARD ?auto_6420 ?auto_6417 ) ( SUPPORTS ?auto_6420 ?auto_6410 ) ( not ( = ?auto_6409 ?auto_6422 ) ) ( CALIBRATION_TARGET ?auto_6420 ?auto_6422 ) ( not ( = ?auto_6422 ?auto_6413 ) ) ( ON_BOARD ?auto_6423 ?auto_6417 ) ( not ( = ?auto_6420 ?auto_6423 ) ) ( SUPPORTS ?auto_6423 ?auto_6414 ) ( CALIBRATION_TARGET ?auto_6423 ?auto_6422 ) ( not ( = ?auto_6422 ?auto_6415 ) ) ( ON_BOARD ?auto_6419 ?auto_6417 ) ( not ( = ?auto_6423 ?auto_6419 ) ) ( SUPPORTS ?auto_6419 ?auto_6416 ) ( CALIBRATION_TARGET ?auto_6419 ?auto_6422 ) ( not ( = ?auto_6422 ?auto_6412 ) ) ( ON_BOARD ?auto_6418 ?auto_6417 ) ( not ( = ?auto_6419 ?auto_6418 ) ) ( SUPPORTS ?auto_6418 ?auto_6411 ) ( CALIBRATION_TARGET ?auto_6418 ?auto_6422 ) ( POWER_AVAIL ?auto_6417 ) ( POINTING ?auto_6417 ?auto_6421 ) ( not ( = ?auto_6422 ?auto_6421 ) ) ( not ( = ?auto_6412 ?auto_6421 ) ) ( not ( = ?auto_6411 ?auto_6416 ) ) ( not ( = ?auto_6415 ?auto_6421 ) ) ( not ( = ?auto_6411 ?auto_6414 ) ) ( not ( = ?auto_6416 ?auto_6414 ) ) ( not ( = ?auto_6413 ?auto_6421 ) ) ( not ( = ?auto_6423 ?auto_6418 ) ) ( not ( = ?auto_6411 ?auto_6410 ) ) ( not ( = ?auto_6416 ?auto_6410 ) ) ( not ( = ?auto_6414 ?auto_6410 ) ) ( not ( = ?auto_6409 ?auto_6421 ) ) ( not ( = ?auto_6420 ?auto_6419 ) ) ( not ( = ?auto_6420 ?auto_6418 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_6412 ?auto_6411 ?auto_6415 ?auto_6416 ?auto_6409 ?auto_6410 ?auto_6413 ?auto_6414 )
      ( GET-4IMAGE-VERIFY ?auto_6409 ?auto_6410 ?auto_6412 ?auto_6411 ?auto_6413 ?auto_6414 ?auto_6415 ?auto_6416 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6564 - DIRECTION
      ?auto_6565 - MODE
      ?auto_6567 - DIRECTION
      ?auto_6566 - MODE
      ?auto_6568 - DIRECTION
      ?auto_6569 - MODE
      ?auto_6570 - DIRECTION
      ?auto_6571 - MODE
    )
    :vars
    (
      ?auto_6575 - INSTRUMENT
      ?auto_6572 - SATELLITE
      ?auto_6577 - DIRECTION
      ?auto_6578 - INSTRUMENT
      ?auto_6574 - INSTRUMENT
      ?auto_6573 - INSTRUMENT
      ?auto_6576 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6567 ?auto_6564 ) ) ( not ( = ?auto_6568 ?auto_6564 ) ) ( not ( = ?auto_6568 ?auto_6567 ) ) ( not ( = ?auto_6570 ?auto_6564 ) ) ( not ( = ?auto_6570 ?auto_6567 ) ) ( not ( = ?auto_6570 ?auto_6568 ) ) ( ON_BOARD ?auto_6575 ?auto_6572 ) ( SUPPORTS ?auto_6575 ?auto_6565 ) ( not ( = ?auto_6564 ?auto_6577 ) ) ( CALIBRATION_TARGET ?auto_6575 ?auto_6577 ) ( not ( = ?auto_6577 ?auto_6570 ) ) ( ON_BOARD ?auto_6578 ?auto_6572 ) ( not ( = ?auto_6575 ?auto_6578 ) ) ( SUPPORTS ?auto_6578 ?auto_6571 ) ( CALIBRATION_TARGET ?auto_6578 ?auto_6577 ) ( not ( = ?auto_6577 ?auto_6567 ) ) ( ON_BOARD ?auto_6574 ?auto_6572 ) ( not ( = ?auto_6578 ?auto_6574 ) ) ( SUPPORTS ?auto_6574 ?auto_6566 ) ( CALIBRATION_TARGET ?auto_6574 ?auto_6577 ) ( not ( = ?auto_6577 ?auto_6568 ) ) ( ON_BOARD ?auto_6573 ?auto_6572 ) ( not ( = ?auto_6574 ?auto_6573 ) ) ( SUPPORTS ?auto_6573 ?auto_6569 ) ( CALIBRATION_TARGET ?auto_6573 ?auto_6577 ) ( POWER_AVAIL ?auto_6572 ) ( POINTING ?auto_6572 ?auto_6576 ) ( not ( = ?auto_6577 ?auto_6576 ) ) ( not ( = ?auto_6568 ?auto_6576 ) ) ( not ( = ?auto_6569 ?auto_6566 ) ) ( not ( = ?auto_6567 ?auto_6576 ) ) ( not ( = ?auto_6569 ?auto_6571 ) ) ( not ( = ?auto_6566 ?auto_6571 ) ) ( not ( = ?auto_6570 ?auto_6576 ) ) ( not ( = ?auto_6578 ?auto_6573 ) ) ( not ( = ?auto_6569 ?auto_6565 ) ) ( not ( = ?auto_6566 ?auto_6565 ) ) ( not ( = ?auto_6571 ?auto_6565 ) ) ( not ( = ?auto_6564 ?auto_6576 ) ) ( not ( = ?auto_6575 ?auto_6574 ) ) ( not ( = ?auto_6575 ?auto_6573 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_6568 ?auto_6569 ?auto_6567 ?auto_6566 ?auto_6564 ?auto_6565 ?auto_6570 ?auto_6571 )
      ( GET-4IMAGE-VERIFY ?auto_6564 ?auto_6565 ?auto_6567 ?auto_6566 ?auto_6568 ?auto_6569 ?auto_6570 ?auto_6571 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6668 - DIRECTION
      ?auto_6669 - MODE
      ?auto_6671 - DIRECTION
      ?auto_6670 - MODE
      ?auto_6672 - DIRECTION
      ?auto_6673 - MODE
      ?auto_6674 - DIRECTION
      ?auto_6675 - MODE
    )
    :vars
    (
      ?auto_6679 - INSTRUMENT
      ?auto_6676 - SATELLITE
      ?auto_6681 - DIRECTION
      ?auto_6682 - INSTRUMENT
      ?auto_6678 - INSTRUMENT
      ?auto_6677 - INSTRUMENT
      ?auto_6680 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6671 ?auto_6668 ) ) ( not ( = ?auto_6672 ?auto_6668 ) ) ( not ( = ?auto_6672 ?auto_6671 ) ) ( not ( = ?auto_6674 ?auto_6668 ) ) ( not ( = ?auto_6674 ?auto_6671 ) ) ( not ( = ?auto_6674 ?auto_6672 ) ) ( ON_BOARD ?auto_6679 ?auto_6676 ) ( SUPPORTS ?auto_6679 ?auto_6669 ) ( not ( = ?auto_6668 ?auto_6681 ) ) ( CALIBRATION_TARGET ?auto_6679 ?auto_6681 ) ( not ( = ?auto_6681 ?auto_6672 ) ) ( ON_BOARD ?auto_6682 ?auto_6676 ) ( not ( = ?auto_6679 ?auto_6682 ) ) ( SUPPORTS ?auto_6682 ?auto_6673 ) ( CALIBRATION_TARGET ?auto_6682 ?auto_6681 ) ( not ( = ?auto_6681 ?auto_6671 ) ) ( ON_BOARD ?auto_6678 ?auto_6676 ) ( not ( = ?auto_6682 ?auto_6678 ) ) ( SUPPORTS ?auto_6678 ?auto_6670 ) ( CALIBRATION_TARGET ?auto_6678 ?auto_6681 ) ( not ( = ?auto_6681 ?auto_6674 ) ) ( ON_BOARD ?auto_6677 ?auto_6676 ) ( not ( = ?auto_6678 ?auto_6677 ) ) ( SUPPORTS ?auto_6677 ?auto_6675 ) ( CALIBRATION_TARGET ?auto_6677 ?auto_6681 ) ( POWER_AVAIL ?auto_6676 ) ( POINTING ?auto_6676 ?auto_6680 ) ( not ( = ?auto_6681 ?auto_6680 ) ) ( not ( = ?auto_6674 ?auto_6680 ) ) ( not ( = ?auto_6675 ?auto_6670 ) ) ( not ( = ?auto_6671 ?auto_6680 ) ) ( not ( = ?auto_6675 ?auto_6673 ) ) ( not ( = ?auto_6670 ?auto_6673 ) ) ( not ( = ?auto_6672 ?auto_6680 ) ) ( not ( = ?auto_6682 ?auto_6677 ) ) ( not ( = ?auto_6675 ?auto_6669 ) ) ( not ( = ?auto_6670 ?auto_6669 ) ) ( not ( = ?auto_6673 ?auto_6669 ) ) ( not ( = ?auto_6668 ?auto_6680 ) ) ( not ( = ?auto_6679 ?auto_6678 ) ) ( not ( = ?auto_6679 ?auto_6677 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_6674 ?auto_6675 ?auto_6671 ?auto_6670 ?auto_6668 ?auto_6669 ?auto_6672 ?auto_6673 )
      ( GET-4IMAGE-VERIFY ?auto_6668 ?auto_6669 ?auto_6671 ?auto_6670 ?auto_6672 ?auto_6673 ?auto_6674 ?auto_6675 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6823 - DIRECTION
      ?auto_6824 - MODE
      ?auto_6826 - DIRECTION
      ?auto_6825 - MODE
      ?auto_6827 - DIRECTION
      ?auto_6828 - MODE
      ?auto_6829 - DIRECTION
      ?auto_6830 - MODE
    )
    :vars
    (
      ?auto_6834 - INSTRUMENT
      ?auto_6831 - SATELLITE
      ?auto_6836 - DIRECTION
      ?auto_6837 - INSTRUMENT
      ?auto_6833 - INSTRUMENT
      ?auto_6832 - INSTRUMENT
      ?auto_6835 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6826 ?auto_6823 ) ) ( not ( = ?auto_6827 ?auto_6823 ) ) ( not ( = ?auto_6827 ?auto_6826 ) ) ( not ( = ?auto_6829 ?auto_6823 ) ) ( not ( = ?auto_6829 ?auto_6826 ) ) ( not ( = ?auto_6829 ?auto_6827 ) ) ( ON_BOARD ?auto_6834 ?auto_6831 ) ( SUPPORTS ?auto_6834 ?auto_6824 ) ( not ( = ?auto_6823 ?auto_6836 ) ) ( CALIBRATION_TARGET ?auto_6834 ?auto_6836 ) ( not ( = ?auto_6836 ?auto_6826 ) ) ( ON_BOARD ?auto_6837 ?auto_6831 ) ( not ( = ?auto_6834 ?auto_6837 ) ) ( SUPPORTS ?auto_6837 ?auto_6825 ) ( CALIBRATION_TARGET ?auto_6837 ?auto_6836 ) ( not ( = ?auto_6836 ?auto_6829 ) ) ( ON_BOARD ?auto_6833 ?auto_6831 ) ( not ( = ?auto_6837 ?auto_6833 ) ) ( SUPPORTS ?auto_6833 ?auto_6830 ) ( CALIBRATION_TARGET ?auto_6833 ?auto_6836 ) ( not ( = ?auto_6836 ?auto_6827 ) ) ( ON_BOARD ?auto_6832 ?auto_6831 ) ( not ( = ?auto_6833 ?auto_6832 ) ) ( SUPPORTS ?auto_6832 ?auto_6828 ) ( CALIBRATION_TARGET ?auto_6832 ?auto_6836 ) ( POWER_AVAIL ?auto_6831 ) ( POINTING ?auto_6831 ?auto_6835 ) ( not ( = ?auto_6836 ?auto_6835 ) ) ( not ( = ?auto_6827 ?auto_6835 ) ) ( not ( = ?auto_6828 ?auto_6830 ) ) ( not ( = ?auto_6829 ?auto_6835 ) ) ( not ( = ?auto_6828 ?auto_6825 ) ) ( not ( = ?auto_6830 ?auto_6825 ) ) ( not ( = ?auto_6826 ?auto_6835 ) ) ( not ( = ?auto_6837 ?auto_6832 ) ) ( not ( = ?auto_6828 ?auto_6824 ) ) ( not ( = ?auto_6830 ?auto_6824 ) ) ( not ( = ?auto_6825 ?auto_6824 ) ) ( not ( = ?auto_6823 ?auto_6835 ) ) ( not ( = ?auto_6834 ?auto_6833 ) ) ( not ( = ?auto_6834 ?auto_6832 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_6827 ?auto_6828 ?auto_6829 ?auto_6830 ?auto_6823 ?auto_6824 ?auto_6826 ?auto_6825 )
      ( GET-4IMAGE-VERIFY ?auto_6823 ?auto_6824 ?auto_6826 ?auto_6825 ?auto_6827 ?auto_6828 ?auto_6829 ?auto_6830 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6872 - DIRECTION
      ?auto_6873 - MODE
      ?auto_6875 - DIRECTION
      ?auto_6874 - MODE
      ?auto_6876 - DIRECTION
      ?auto_6877 - MODE
      ?auto_6878 - DIRECTION
      ?auto_6879 - MODE
    )
    :vars
    (
      ?auto_6883 - INSTRUMENT
      ?auto_6880 - SATELLITE
      ?auto_6885 - DIRECTION
      ?auto_6886 - INSTRUMENT
      ?auto_6882 - INSTRUMENT
      ?auto_6881 - INSTRUMENT
      ?auto_6884 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6875 ?auto_6872 ) ) ( not ( = ?auto_6876 ?auto_6872 ) ) ( not ( = ?auto_6876 ?auto_6875 ) ) ( not ( = ?auto_6878 ?auto_6872 ) ) ( not ( = ?auto_6878 ?auto_6875 ) ) ( not ( = ?auto_6878 ?auto_6876 ) ) ( ON_BOARD ?auto_6883 ?auto_6880 ) ( SUPPORTS ?auto_6883 ?auto_6873 ) ( not ( = ?auto_6872 ?auto_6885 ) ) ( CALIBRATION_TARGET ?auto_6883 ?auto_6885 ) ( not ( = ?auto_6885 ?auto_6875 ) ) ( ON_BOARD ?auto_6886 ?auto_6880 ) ( not ( = ?auto_6883 ?auto_6886 ) ) ( SUPPORTS ?auto_6886 ?auto_6874 ) ( CALIBRATION_TARGET ?auto_6886 ?auto_6885 ) ( not ( = ?auto_6885 ?auto_6876 ) ) ( ON_BOARD ?auto_6882 ?auto_6880 ) ( not ( = ?auto_6886 ?auto_6882 ) ) ( SUPPORTS ?auto_6882 ?auto_6877 ) ( CALIBRATION_TARGET ?auto_6882 ?auto_6885 ) ( not ( = ?auto_6885 ?auto_6878 ) ) ( ON_BOARD ?auto_6881 ?auto_6880 ) ( not ( = ?auto_6882 ?auto_6881 ) ) ( SUPPORTS ?auto_6881 ?auto_6879 ) ( CALIBRATION_TARGET ?auto_6881 ?auto_6885 ) ( POWER_AVAIL ?auto_6880 ) ( POINTING ?auto_6880 ?auto_6884 ) ( not ( = ?auto_6885 ?auto_6884 ) ) ( not ( = ?auto_6878 ?auto_6884 ) ) ( not ( = ?auto_6879 ?auto_6877 ) ) ( not ( = ?auto_6876 ?auto_6884 ) ) ( not ( = ?auto_6879 ?auto_6874 ) ) ( not ( = ?auto_6877 ?auto_6874 ) ) ( not ( = ?auto_6875 ?auto_6884 ) ) ( not ( = ?auto_6886 ?auto_6881 ) ) ( not ( = ?auto_6879 ?auto_6873 ) ) ( not ( = ?auto_6877 ?auto_6873 ) ) ( not ( = ?auto_6874 ?auto_6873 ) ) ( not ( = ?auto_6872 ?auto_6884 ) ) ( not ( = ?auto_6883 ?auto_6882 ) ) ( not ( = ?auto_6883 ?auto_6881 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_6878 ?auto_6879 ?auto_6876 ?auto_6877 ?auto_6872 ?auto_6873 ?auto_6875 ?auto_6874 )
      ( GET-4IMAGE-VERIFY ?auto_6872 ?auto_6873 ?auto_6875 ?auto_6874 ?auto_6876 ?auto_6877 ?auto_6878 ?auto_6879 ) )
  )

)

