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

  ( :method GET-5IMAGE-VERIFY
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
      ?goal_dir5 - DIRECTION
      ?goal_mode5 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) ( HAVE_IMAGE ?goal_dir3 ?goal_mode3 ) ( HAVE_IMAGE ?goal_dir4 ?goal_mode4 ) ( HAVE_IMAGE ?goal_dir5 ?goal_mode5 ) )
    :subtasks
    (  )
  )

  ( :method GET-6IMAGE-VERIFY
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
      ?goal_dir5 - DIRECTION
      ?goal_mode5 - MODE
      ?goal_dir6 - DIRECTION
      ?goal_mode6 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) ( HAVE_IMAGE ?goal_dir3 ?goal_mode3 ) ( HAVE_IMAGE ?goal_dir4 ?goal_mode4 ) ( HAVE_IMAGE ?goal_dir5 ?goal_mode5 ) ( HAVE_IMAGE ?goal_dir6 ?goal_mode6 ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2772930 - DIRECTION
      ?auto_2772931 - MODE
    )
    :vars
    (
      ?auto_2772932 - INSTRUMENT
      ?auto_2772933 - SATELLITE
      ?auto_2772934 - DIRECTION
      ?auto_2772935 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2772932 ?auto_2772933 ) ( SUPPORTS ?auto_2772932 ?auto_2772931 ) ( not ( = ?auto_2772930 ?auto_2772934 ) ) ( CALIBRATION_TARGET ?auto_2772932 ?auto_2772934 ) ( POWER_AVAIL ?auto_2772933 ) ( POINTING ?auto_2772933 ?auto_2772935 ) ( not ( = ?auto_2772934 ?auto_2772935 ) ) ( not ( = ?auto_2772930 ?auto_2772935 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_2772933 ?auto_2772934 ?auto_2772935 )
      ( !SWITCH_ON ?auto_2772932 ?auto_2772933 )
      ( !CALIBRATE ?auto_2772933 ?auto_2772932 ?auto_2772934 )
      ( !TURN_TO ?auto_2772933 ?auto_2772930 ?auto_2772934 )
      ( !TAKE_IMAGE ?auto_2772933 ?auto_2772930 ?auto_2772932 ?auto_2772931 )
      ( GET-1IMAGE-VERIFY ?auto_2772930 ?auto_2772931 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2772938 - DIRECTION
      ?auto_2772939 - MODE
    )
    :vars
    (
      ?auto_2772940 - INSTRUMENT
      ?auto_2772941 - SATELLITE
      ?auto_2772942 - DIRECTION
      ?auto_2772943 - DIRECTION
      ?auto_2772944 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2772940 ?auto_2772941 ) ( SUPPORTS ?auto_2772940 ?auto_2772939 ) ( not ( = ?auto_2772938 ?auto_2772942 ) ) ( CALIBRATION_TARGET ?auto_2772940 ?auto_2772942 ) ( POINTING ?auto_2772941 ?auto_2772943 ) ( not ( = ?auto_2772942 ?auto_2772943 ) ) ( ON_BOARD ?auto_2772944 ?auto_2772941 ) ( POWER_ON ?auto_2772944 ) ( not ( = ?auto_2772938 ?auto_2772943 ) ) ( not ( = ?auto_2772940 ?auto_2772944 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_2772944 ?auto_2772941 )
      ( !TURN_TO ?auto_2772941 ?auto_2772942 ?auto_2772943 )
      ( !SWITCH_ON ?auto_2772940 ?auto_2772941 )
      ( !CALIBRATE ?auto_2772941 ?auto_2772940 ?auto_2772942 )
      ( !TURN_TO ?auto_2772941 ?auto_2772938 ?auto_2772942 )
      ( !TAKE_IMAGE ?auto_2772941 ?auto_2772938 ?auto_2772940 ?auto_2772939 )
      ( GET-1IMAGE-VERIFY ?auto_2772938 ?auto_2772939 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2772957 - DIRECTION
      ?auto_2772958 - MODE
      ?auto_2772960 - DIRECTION
      ?auto_2772959 - MODE
    )
    :vars
    (
      ?auto_2772964 - INSTRUMENT
      ?auto_2772962 - SATELLITE
      ?auto_2772963 - DIRECTION
      ?auto_2772961 - INSTRUMENT
      ?auto_2772965 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2772960 ?auto_2772957 ) ) ( ON_BOARD ?auto_2772964 ?auto_2772962 ) ( SUPPORTS ?auto_2772964 ?auto_2772959 ) ( not ( = ?auto_2772960 ?auto_2772963 ) ) ( CALIBRATION_TARGET ?auto_2772964 ?auto_2772963 ) ( not ( = ?auto_2772963 ?auto_2772957 ) ) ( ON_BOARD ?auto_2772961 ?auto_2772962 ) ( not ( = ?auto_2772964 ?auto_2772961 ) ) ( SUPPORTS ?auto_2772961 ?auto_2772958 ) ( CALIBRATION_TARGET ?auto_2772961 ?auto_2772963 ) ( POWER_AVAIL ?auto_2772962 ) ( POINTING ?auto_2772962 ?auto_2772965 ) ( not ( = ?auto_2772963 ?auto_2772965 ) ) ( not ( = ?auto_2772957 ?auto_2772965 ) ) ( not ( = ?auto_2772958 ?auto_2772959 ) ) ( not ( = ?auto_2772960 ?auto_2772965 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2772957 ?auto_2772958 )
      ( GET-1IMAGE ?auto_2772960 ?auto_2772959 )
      ( GET-2IMAGE-VERIFY ?auto_2772957 ?auto_2772958 ?auto_2772960 ?auto_2772959 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2773118 - DIRECTION
      ?auto_2773119 - MODE
      ?auto_2773121 - DIRECTION
      ?auto_2773120 - MODE
      ?auto_2773122 - DIRECTION
      ?auto_2773123 - MODE
    )
    :vars
    (
      ?auto_2773127 - INSTRUMENT
      ?auto_2773126 - SATELLITE
      ?auto_2773125 - DIRECTION
      ?auto_2773124 - INSTRUMENT
      ?auto_2773129 - INSTRUMENT
      ?auto_2773128 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2773121 ?auto_2773118 ) ) ( not ( = ?auto_2773122 ?auto_2773118 ) ) ( not ( = ?auto_2773122 ?auto_2773121 ) ) ( ON_BOARD ?auto_2773127 ?auto_2773126 ) ( SUPPORTS ?auto_2773127 ?auto_2773123 ) ( not ( = ?auto_2773122 ?auto_2773125 ) ) ( CALIBRATION_TARGET ?auto_2773127 ?auto_2773125 ) ( not ( = ?auto_2773125 ?auto_2773121 ) ) ( ON_BOARD ?auto_2773124 ?auto_2773126 ) ( not ( = ?auto_2773127 ?auto_2773124 ) ) ( SUPPORTS ?auto_2773124 ?auto_2773120 ) ( CALIBRATION_TARGET ?auto_2773124 ?auto_2773125 ) ( not ( = ?auto_2773125 ?auto_2773118 ) ) ( ON_BOARD ?auto_2773129 ?auto_2773126 ) ( not ( = ?auto_2773124 ?auto_2773129 ) ) ( SUPPORTS ?auto_2773129 ?auto_2773119 ) ( CALIBRATION_TARGET ?auto_2773129 ?auto_2773125 ) ( POWER_AVAIL ?auto_2773126 ) ( POINTING ?auto_2773126 ?auto_2773128 ) ( not ( = ?auto_2773125 ?auto_2773128 ) ) ( not ( = ?auto_2773118 ?auto_2773128 ) ) ( not ( = ?auto_2773119 ?auto_2773120 ) ) ( not ( = ?auto_2773121 ?auto_2773128 ) ) ( not ( = ?auto_2773119 ?auto_2773123 ) ) ( not ( = ?auto_2773120 ?auto_2773123 ) ) ( not ( = ?auto_2773122 ?auto_2773128 ) ) ( not ( = ?auto_2773127 ?auto_2773129 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2773118 ?auto_2773119 ?auto_2773121 ?auto_2773120 )
      ( GET-1IMAGE ?auto_2773122 ?auto_2773123 )
      ( GET-3IMAGE-VERIFY ?auto_2773118 ?auto_2773119 ?auto_2773121 ?auto_2773120 ?auto_2773122 ?auto_2773123 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2774898 - DIRECTION
      ?auto_2774899 - MODE
      ?auto_2774901 - DIRECTION
      ?auto_2774900 - MODE
      ?auto_2774902 - DIRECTION
      ?auto_2774903 - MODE
      ?auto_2774904 - DIRECTION
      ?auto_2774905 - MODE
    )
    :vars
    (
      ?auto_2774906 - INSTRUMENT
      ?auto_2774909 - SATELLITE
      ?auto_2774908 - DIRECTION
      ?auto_2774907 - INSTRUMENT
      ?auto_2774910 - INSTRUMENT
      ?auto_2774912 - INSTRUMENT
      ?auto_2774911 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2774901 ?auto_2774898 ) ) ( not ( = ?auto_2774902 ?auto_2774898 ) ) ( not ( = ?auto_2774902 ?auto_2774901 ) ) ( not ( = ?auto_2774904 ?auto_2774898 ) ) ( not ( = ?auto_2774904 ?auto_2774901 ) ) ( not ( = ?auto_2774904 ?auto_2774902 ) ) ( ON_BOARD ?auto_2774906 ?auto_2774909 ) ( SUPPORTS ?auto_2774906 ?auto_2774905 ) ( not ( = ?auto_2774904 ?auto_2774908 ) ) ( CALIBRATION_TARGET ?auto_2774906 ?auto_2774908 ) ( not ( = ?auto_2774908 ?auto_2774902 ) ) ( ON_BOARD ?auto_2774907 ?auto_2774909 ) ( not ( = ?auto_2774906 ?auto_2774907 ) ) ( SUPPORTS ?auto_2774907 ?auto_2774903 ) ( CALIBRATION_TARGET ?auto_2774907 ?auto_2774908 ) ( not ( = ?auto_2774908 ?auto_2774901 ) ) ( ON_BOARD ?auto_2774910 ?auto_2774909 ) ( not ( = ?auto_2774907 ?auto_2774910 ) ) ( SUPPORTS ?auto_2774910 ?auto_2774900 ) ( CALIBRATION_TARGET ?auto_2774910 ?auto_2774908 ) ( not ( = ?auto_2774908 ?auto_2774898 ) ) ( ON_BOARD ?auto_2774912 ?auto_2774909 ) ( not ( = ?auto_2774910 ?auto_2774912 ) ) ( SUPPORTS ?auto_2774912 ?auto_2774899 ) ( CALIBRATION_TARGET ?auto_2774912 ?auto_2774908 ) ( POWER_AVAIL ?auto_2774909 ) ( POINTING ?auto_2774909 ?auto_2774911 ) ( not ( = ?auto_2774908 ?auto_2774911 ) ) ( not ( = ?auto_2774898 ?auto_2774911 ) ) ( not ( = ?auto_2774899 ?auto_2774900 ) ) ( not ( = ?auto_2774901 ?auto_2774911 ) ) ( not ( = ?auto_2774899 ?auto_2774903 ) ) ( not ( = ?auto_2774900 ?auto_2774903 ) ) ( not ( = ?auto_2774902 ?auto_2774911 ) ) ( not ( = ?auto_2774907 ?auto_2774912 ) ) ( not ( = ?auto_2774899 ?auto_2774905 ) ) ( not ( = ?auto_2774900 ?auto_2774905 ) ) ( not ( = ?auto_2774903 ?auto_2774905 ) ) ( not ( = ?auto_2774904 ?auto_2774911 ) ) ( not ( = ?auto_2774906 ?auto_2774910 ) ) ( not ( = ?auto_2774906 ?auto_2774912 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_2774898 ?auto_2774899 ?auto_2774901 ?auto_2774900 ?auto_2774902 ?auto_2774903 )
      ( GET-1IMAGE ?auto_2774904 ?auto_2774905 )
      ( GET-4IMAGE-VERIFY ?auto_2774898 ?auto_2774899 ?auto_2774901 ?auto_2774900 ?auto_2774902 ?auto_2774903 ?auto_2774904 ?auto_2774905 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2800372 - DIRECTION
      ?auto_2800373 - MODE
      ?auto_2800375 - DIRECTION
      ?auto_2800374 - MODE
      ?auto_2800376 - DIRECTION
      ?auto_2800377 - MODE
      ?auto_2800378 - DIRECTION
      ?auto_2800379 - MODE
      ?auto_2800381 - DIRECTION
      ?auto_2800380 - MODE
    )
    :vars
    (
      ?auto_2800382 - INSTRUMENT
      ?auto_2800384 - SATELLITE
      ?auto_2800385 - DIRECTION
      ?auto_2800383 - INSTRUMENT
      ?auto_2800389 - INSTRUMENT
      ?auto_2800387 - INSTRUMENT
      ?auto_2800388 - INSTRUMENT
      ?auto_2800386 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2800375 ?auto_2800372 ) ) ( not ( = ?auto_2800376 ?auto_2800372 ) ) ( not ( = ?auto_2800376 ?auto_2800375 ) ) ( not ( = ?auto_2800378 ?auto_2800372 ) ) ( not ( = ?auto_2800378 ?auto_2800375 ) ) ( not ( = ?auto_2800378 ?auto_2800376 ) ) ( not ( = ?auto_2800381 ?auto_2800372 ) ) ( not ( = ?auto_2800381 ?auto_2800375 ) ) ( not ( = ?auto_2800381 ?auto_2800376 ) ) ( not ( = ?auto_2800381 ?auto_2800378 ) ) ( ON_BOARD ?auto_2800382 ?auto_2800384 ) ( SUPPORTS ?auto_2800382 ?auto_2800380 ) ( not ( = ?auto_2800381 ?auto_2800385 ) ) ( CALIBRATION_TARGET ?auto_2800382 ?auto_2800385 ) ( not ( = ?auto_2800385 ?auto_2800378 ) ) ( ON_BOARD ?auto_2800383 ?auto_2800384 ) ( not ( = ?auto_2800382 ?auto_2800383 ) ) ( SUPPORTS ?auto_2800383 ?auto_2800379 ) ( CALIBRATION_TARGET ?auto_2800383 ?auto_2800385 ) ( not ( = ?auto_2800385 ?auto_2800376 ) ) ( ON_BOARD ?auto_2800389 ?auto_2800384 ) ( not ( = ?auto_2800383 ?auto_2800389 ) ) ( SUPPORTS ?auto_2800389 ?auto_2800377 ) ( CALIBRATION_TARGET ?auto_2800389 ?auto_2800385 ) ( not ( = ?auto_2800385 ?auto_2800375 ) ) ( ON_BOARD ?auto_2800387 ?auto_2800384 ) ( not ( = ?auto_2800389 ?auto_2800387 ) ) ( SUPPORTS ?auto_2800387 ?auto_2800374 ) ( CALIBRATION_TARGET ?auto_2800387 ?auto_2800385 ) ( not ( = ?auto_2800385 ?auto_2800372 ) ) ( ON_BOARD ?auto_2800388 ?auto_2800384 ) ( not ( = ?auto_2800387 ?auto_2800388 ) ) ( SUPPORTS ?auto_2800388 ?auto_2800373 ) ( CALIBRATION_TARGET ?auto_2800388 ?auto_2800385 ) ( POWER_AVAIL ?auto_2800384 ) ( POINTING ?auto_2800384 ?auto_2800386 ) ( not ( = ?auto_2800385 ?auto_2800386 ) ) ( not ( = ?auto_2800372 ?auto_2800386 ) ) ( not ( = ?auto_2800373 ?auto_2800374 ) ) ( not ( = ?auto_2800375 ?auto_2800386 ) ) ( not ( = ?auto_2800373 ?auto_2800377 ) ) ( not ( = ?auto_2800374 ?auto_2800377 ) ) ( not ( = ?auto_2800376 ?auto_2800386 ) ) ( not ( = ?auto_2800389 ?auto_2800388 ) ) ( not ( = ?auto_2800373 ?auto_2800379 ) ) ( not ( = ?auto_2800374 ?auto_2800379 ) ) ( not ( = ?auto_2800377 ?auto_2800379 ) ) ( not ( = ?auto_2800378 ?auto_2800386 ) ) ( not ( = ?auto_2800383 ?auto_2800387 ) ) ( not ( = ?auto_2800383 ?auto_2800388 ) ) ( not ( = ?auto_2800373 ?auto_2800380 ) ) ( not ( = ?auto_2800374 ?auto_2800380 ) ) ( not ( = ?auto_2800377 ?auto_2800380 ) ) ( not ( = ?auto_2800379 ?auto_2800380 ) ) ( not ( = ?auto_2800381 ?auto_2800386 ) ) ( not ( = ?auto_2800382 ?auto_2800389 ) ) ( not ( = ?auto_2800382 ?auto_2800387 ) ) ( not ( = ?auto_2800382 ?auto_2800388 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_2800372 ?auto_2800373 ?auto_2800375 ?auto_2800374 ?auto_2800376 ?auto_2800377 ?auto_2800378 ?auto_2800379 )
      ( GET-1IMAGE ?auto_2800381 ?auto_2800380 )
      ( GET-5IMAGE-VERIFY ?auto_2800372 ?auto_2800373 ?auto_2800375 ?auto_2800374 ?auto_2800376 ?auto_2800377 ?auto_2800378 ?auto_2800379 ?auto_2800381 ?auto_2800380 ) )
  )

  ( :method GET-6IMAGE
    :parameters
    (
      ?auto_3236597 - DIRECTION
      ?auto_3236598 - MODE
      ?auto_3236600 - DIRECTION
      ?auto_3236599 - MODE
      ?auto_3236601 - DIRECTION
      ?auto_3236602 - MODE
      ?auto_3236603 - DIRECTION
      ?auto_3236604 - MODE
      ?auto_3236606 - DIRECTION
      ?auto_3236605 - MODE
      ?auto_3236607 - DIRECTION
      ?auto_3236608 - MODE
    )
    :vars
    (
      ?auto_3236611 - INSTRUMENT
      ?auto_3236610 - SATELLITE
      ?auto_3236609 - DIRECTION
      ?auto_3236612 - INSTRUMENT
      ?auto_3236615 - INSTRUMENT
      ?auto_3236616 - INSTRUMENT
      ?auto_3236614 - INSTRUMENT
      ?auto_3236617 - INSTRUMENT
      ?auto_3236613 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3236600 ?auto_3236597 ) ) ( not ( = ?auto_3236601 ?auto_3236597 ) ) ( not ( = ?auto_3236601 ?auto_3236600 ) ) ( not ( = ?auto_3236603 ?auto_3236597 ) ) ( not ( = ?auto_3236603 ?auto_3236600 ) ) ( not ( = ?auto_3236603 ?auto_3236601 ) ) ( not ( = ?auto_3236606 ?auto_3236597 ) ) ( not ( = ?auto_3236606 ?auto_3236600 ) ) ( not ( = ?auto_3236606 ?auto_3236601 ) ) ( not ( = ?auto_3236606 ?auto_3236603 ) ) ( not ( = ?auto_3236607 ?auto_3236597 ) ) ( not ( = ?auto_3236607 ?auto_3236600 ) ) ( not ( = ?auto_3236607 ?auto_3236601 ) ) ( not ( = ?auto_3236607 ?auto_3236603 ) ) ( not ( = ?auto_3236607 ?auto_3236606 ) ) ( ON_BOARD ?auto_3236611 ?auto_3236610 ) ( SUPPORTS ?auto_3236611 ?auto_3236608 ) ( not ( = ?auto_3236607 ?auto_3236609 ) ) ( CALIBRATION_TARGET ?auto_3236611 ?auto_3236609 ) ( not ( = ?auto_3236609 ?auto_3236606 ) ) ( ON_BOARD ?auto_3236612 ?auto_3236610 ) ( not ( = ?auto_3236611 ?auto_3236612 ) ) ( SUPPORTS ?auto_3236612 ?auto_3236605 ) ( CALIBRATION_TARGET ?auto_3236612 ?auto_3236609 ) ( not ( = ?auto_3236609 ?auto_3236603 ) ) ( ON_BOARD ?auto_3236615 ?auto_3236610 ) ( not ( = ?auto_3236612 ?auto_3236615 ) ) ( SUPPORTS ?auto_3236615 ?auto_3236604 ) ( CALIBRATION_TARGET ?auto_3236615 ?auto_3236609 ) ( not ( = ?auto_3236609 ?auto_3236601 ) ) ( ON_BOARD ?auto_3236616 ?auto_3236610 ) ( not ( = ?auto_3236615 ?auto_3236616 ) ) ( SUPPORTS ?auto_3236616 ?auto_3236602 ) ( CALIBRATION_TARGET ?auto_3236616 ?auto_3236609 ) ( not ( = ?auto_3236609 ?auto_3236600 ) ) ( ON_BOARD ?auto_3236614 ?auto_3236610 ) ( not ( = ?auto_3236616 ?auto_3236614 ) ) ( SUPPORTS ?auto_3236614 ?auto_3236599 ) ( CALIBRATION_TARGET ?auto_3236614 ?auto_3236609 ) ( not ( = ?auto_3236609 ?auto_3236597 ) ) ( ON_BOARD ?auto_3236617 ?auto_3236610 ) ( not ( = ?auto_3236614 ?auto_3236617 ) ) ( SUPPORTS ?auto_3236617 ?auto_3236598 ) ( CALIBRATION_TARGET ?auto_3236617 ?auto_3236609 ) ( POWER_AVAIL ?auto_3236610 ) ( POINTING ?auto_3236610 ?auto_3236613 ) ( not ( = ?auto_3236609 ?auto_3236613 ) ) ( not ( = ?auto_3236597 ?auto_3236613 ) ) ( not ( = ?auto_3236598 ?auto_3236599 ) ) ( not ( = ?auto_3236600 ?auto_3236613 ) ) ( not ( = ?auto_3236598 ?auto_3236602 ) ) ( not ( = ?auto_3236599 ?auto_3236602 ) ) ( not ( = ?auto_3236601 ?auto_3236613 ) ) ( not ( = ?auto_3236616 ?auto_3236617 ) ) ( not ( = ?auto_3236598 ?auto_3236604 ) ) ( not ( = ?auto_3236599 ?auto_3236604 ) ) ( not ( = ?auto_3236602 ?auto_3236604 ) ) ( not ( = ?auto_3236603 ?auto_3236613 ) ) ( not ( = ?auto_3236615 ?auto_3236614 ) ) ( not ( = ?auto_3236615 ?auto_3236617 ) ) ( not ( = ?auto_3236598 ?auto_3236605 ) ) ( not ( = ?auto_3236599 ?auto_3236605 ) ) ( not ( = ?auto_3236602 ?auto_3236605 ) ) ( not ( = ?auto_3236604 ?auto_3236605 ) ) ( not ( = ?auto_3236606 ?auto_3236613 ) ) ( not ( = ?auto_3236612 ?auto_3236616 ) ) ( not ( = ?auto_3236612 ?auto_3236614 ) ) ( not ( = ?auto_3236612 ?auto_3236617 ) ) ( not ( = ?auto_3236598 ?auto_3236608 ) ) ( not ( = ?auto_3236599 ?auto_3236608 ) ) ( not ( = ?auto_3236602 ?auto_3236608 ) ) ( not ( = ?auto_3236604 ?auto_3236608 ) ) ( not ( = ?auto_3236605 ?auto_3236608 ) ) ( not ( = ?auto_3236607 ?auto_3236613 ) ) ( not ( = ?auto_3236611 ?auto_3236615 ) ) ( not ( = ?auto_3236611 ?auto_3236616 ) ) ( not ( = ?auto_3236611 ?auto_3236614 ) ) ( not ( = ?auto_3236611 ?auto_3236617 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_3236597 ?auto_3236598 ?auto_3236600 ?auto_3236599 ?auto_3236601 ?auto_3236602 ?auto_3236603 ?auto_3236604 ?auto_3236606 ?auto_3236605 )
      ( GET-1IMAGE ?auto_3236607 ?auto_3236608 )
      ( GET-6IMAGE-VERIFY ?auto_3236597 ?auto_3236598 ?auto_3236600 ?auto_3236599 ?auto_3236601 ?auto_3236602 ?auto_3236603 ?auto_3236604 ?auto_3236606 ?auto_3236605 ?auto_3236607 ?auto_3236608 ) )
  )

)

