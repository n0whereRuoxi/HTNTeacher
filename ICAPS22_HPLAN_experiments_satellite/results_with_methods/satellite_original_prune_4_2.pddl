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
      ?auto_193110 - DIRECTION
      ?auto_193111 - MODE
    )
    :vars
    (
      ?auto_193112 - INSTRUMENT
      ?auto_193113 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_193112 ) ( ON_BOARD ?auto_193112 ?auto_193113 ) ( SUPPORTS ?auto_193112 ?auto_193111 ) ( POWER_ON ?auto_193112 ) ( POINTING ?auto_193113 ?auto_193110 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_193113 ?auto_193110 ?auto_193112 ?auto_193111 )
      ( GET-1IMAGE-VERIFY ?auto_193110 ?auto_193111 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_193138 - DIRECTION
      ?auto_193139 - MODE
    )
    :vars
    (
      ?auto_193140 - INSTRUMENT
      ?auto_193141 - SATELLITE
      ?auto_193142 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_193140 ) ( ON_BOARD ?auto_193140 ?auto_193141 ) ( SUPPORTS ?auto_193140 ?auto_193139 ) ( POWER_ON ?auto_193140 ) ( POINTING ?auto_193141 ?auto_193142 ) ( not ( = ?auto_193138 ?auto_193142 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_193141 ?auto_193138 ?auto_193142 )
      ( GET-1IMAGE ?auto_193138 ?auto_193139 )
      ( GET-1IMAGE-VERIFY ?auto_193138 ?auto_193139 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_193170 - DIRECTION
      ?auto_193171 - MODE
    )
    :vars
    (
      ?auto_193173 - INSTRUMENT
      ?auto_193172 - SATELLITE
      ?auto_193174 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_193173 ?auto_193172 ) ( SUPPORTS ?auto_193173 ?auto_193171 ) ( POWER_ON ?auto_193173 ) ( POINTING ?auto_193172 ?auto_193174 ) ( not ( = ?auto_193170 ?auto_193174 ) ) ( CALIBRATION_TARGET ?auto_193173 ?auto_193174 ) ( NOT_CALIBRATED ?auto_193173 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_193172 ?auto_193173 ?auto_193174 )
      ( GET-1IMAGE ?auto_193170 ?auto_193171 )
      ( GET-1IMAGE-VERIFY ?auto_193170 ?auto_193171 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_193202 - DIRECTION
      ?auto_193203 - MODE
    )
    :vars
    (
      ?auto_193205 - INSTRUMENT
      ?auto_193206 - SATELLITE
      ?auto_193204 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_193205 ?auto_193206 ) ( SUPPORTS ?auto_193205 ?auto_193203 ) ( POINTING ?auto_193206 ?auto_193204 ) ( not ( = ?auto_193202 ?auto_193204 ) ) ( CALIBRATION_TARGET ?auto_193205 ?auto_193204 ) ( POWER_AVAIL ?auto_193206 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_193205 ?auto_193206 )
      ( GET-1IMAGE ?auto_193202 ?auto_193203 )
      ( GET-1IMAGE-VERIFY ?auto_193202 ?auto_193203 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_193234 - DIRECTION
      ?auto_193235 - MODE
    )
    :vars
    (
      ?auto_193236 - INSTRUMENT
      ?auto_193237 - SATELLITE
      ?auto_193238 - DIRECTION
      ?auto_193239 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_193236 ?auto_193237 ) ( SUPPORTS ?auto_193236 ?auto_193235 ) ( not ( = ?auto_193234 ?auto_193238 ) ) ( CALIBRATION_TARGET ?auto_193236 ?auto_193238 ) ( POWER_AVAIL ?auto_193237 ) ( POINTING ?auto_193237 ?auto_193239 ) ( not ( = ?auto_193238 ?auto_193239 ) ) ( not ( = ?auto_193234 ?auto_193239 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_193237 ?auto_193238 ?auto_193239 )
      ( GET-1IMAGE ?auto_193234 ?auto_193235 )
      ( GET-1IMAGE-VERIFY ?auto_193234 ?auto_193235 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_193451 - DIRECTION
      ?auto_193452 - MODE
      ?auto_193453 - DIRECTION
      ?auto_193450 - MODE
    )
    :vars
    (
      ?auto_193455 - INSTRUMENT
      ?auto_193454 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_193453 ?auto_193451 ) ) ( CALIBRATED ?auto_193455 ) ( ON_BOARD ?auto_193455 ?auto_193454 ) ( SUPPORTS ?auto_193455 ?auto_193450 ) ( POWER_ON ?auto_193455 ) ( POINTING ?auto_193454 ?auto_193453 ) ( HAVE_IMAGE ?auto_193451 ?auto_193452 ) ( not ( = ?auto_193452 ?auto_193450 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_193453 ?auto_193450 )
      ( GET-2IMAGE-VERIFY ?auto_193451 ?auto_193452 ?auto_193453 ?auto_193450 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_193457 - DIRECTION
      ?auto_193458 - MODE
      ?auto_193459 - DIRECTION
      ?auto_193456 - MODE
    )
    :vars
    (
      ?auto_193461 - INSTRUMENT
      ?auto_193460 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_193459 ?auto_193457 ) ) ( CALIBRATED ?auto_193461 ) ( ON_BOARD ?auto_193461 ?auto_193460 ) ( SUPPORTS ?auto_193461 ?auto_193458 ) ( POWER_ON ?auto_193461 ) ( POINTING ?auto_193460 ?auto_193457 ) ( HAVE_IMAGE ?auto_193459 ?auto_193456 ) ( not ( = ?auto_193458 ?auto_193456 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_193457 ?auto_193458 )
      ( GET-2IMAGE-VERIFY ?auto_193457 ?auto_193458 ?auto_193459 ?auto_193456 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_193680 - DIRECTION
      ?auto_193681 - MODE
      ?auto_193682 - DIRECTION
      ?auto_193679 - MODE
    )
    :vars
    (
      ?auto_193684 - INSTRUMENT
      ?auto_193683 - SATELLITE
      ?auto_193685 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_193682 ?auto_193680 ) ) ( CALIBRATED ?auto_193684 ) ( ON_BOARD ?auto_193684 ?auto_193683 ) ( SUPPORTS ?auto_193684 ?auto_193679 ) ( POWER_ON ?auto_193684 ) ( POINTING ?auto_193683 ?auto_193685 ) ( not ( = ?auto_193682 ?auto_193685 ) ) ( HAVE_IMAGE ?auto_193680 ?auto_193681 ) ( not ( = ?auto_193680 ?auto_193685 ) ) ( not ( = ?auto_193681 ?auto_193679 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_193682 ?auto_193679 )
      ( GET-2IMAGE-VERIFY ?auto_193680 ?auto_193681 ?auto_193682 ?auto_193679 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_193687 - DIRECTION
      ?auto_193688 - MODE
      ?auto_193689 - DIRECTION
      ?auto_193686 - MODE
    )
    :vars
    (
      ?auto_193692 - INSTRUMENT
      ?auto_193690 - SATELLITE
      ?auto_193691 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_193689 ?auto_193687 ) ) ( CALIBRATED ?auto_193692 ) ( ON_BOARD ?auto_193692 ?auto_193690 ) ( SUPPORTS ?auto_193692 ?auto_193688 ) ( POWER_ON ?auto_193692 ) ( POINTING ?auto_193690 ?auto_193691 ) ( not ( = ?auto_193687 ?auto_193691 ) ) ( HAVE_IMAGE ?auto_193689 ?auto_193686 ) ( not ( = ?auto_193689 ?auto_193691 ) ) ( not ( = ?auto_193686 ?auto_193688 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193689 ?auto_193686 ?auto_193687 ?auto_193688 )
      ( GET-2IMAGE-VERIFY ?auto_193687 ?auto_193688 ?auto_193689 ?auto_193686 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_193934 - DIRECTION
      ?auto_193935 - MODE
    )
    :vars
    (
      ?auto_193939 - DIRECTION
      ?auto_193940 - INSTRUMENT
      ?auto_193936 - SATELLITE
      ?auto_193937 - DIRECTION
      ?auto_193938 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_193934 ?auto_193939 ) ) ( ON_BOARD ?auto_193940 ?auto_193936 ) ( SUPPORTS ?auto_193940 ?auto_193935 ) ( POWER_ON ?auto_193940 ) ( POINTING ?auto_193936 ?auto_193937 ) ( not ( = ?auto_193934 ?auto_193937 ) ) ( HAVE_IMAGE ?auto_193939 ?auto_193938 ) ( not ( = ?auto_193939 ?auto_193937 ) ) ( not ( = ?auto_193938 ?auto_193935 ) ) ( CALIBRATION_TARGET ?auto_193940 ?auto_193937 ) ( NOT_CALIBRATED ?auto_193940 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_193936 ?auto_193940 ?auto_193937 )
      ( GET-2IMAGE ?auto_193939 ?auto_193938 ?auto_193934 ?auto_193935 )
      ( GET-1IMAGE-VERIFY ?auto_193934 ?auto_193935 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_193942 - DIRECTION
      ?auto_193943 - MODE
      ?auto_193944 - DIRECTION
      ?auto_193941 - MODE
    )
    :vars
    (
      ?auto_193947 - INSTRUMENT
      ?auto_193945 - SATELLITE
      ?auto_193946 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_193944 ?auto_193942 ) ) ( ON_BOARD ?auto_193947 ?auto_193945 ) ( SUPPORTS ?auto_193947 ?auto_193941 ) ( POWER_ON ?auto_193947 ) ( POINTING ?auto_193945 ?auto_193946 ) ( not ( = ?auto_193944 ?auto_193946 ) ) ( HAVE_IMAGE ?auto_193942 ?auto_193943 ) ( not ( = ?auto_193942 ?auto_193946 ) ) ( not ( = ?auto_193943 ?auto_193941 ) ) ( CALIBRATION_TARGET ?auto_193947 ?auto_193946 ) ( NOT_CALIBRATED ?auto_193947 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_193944 ?auto_193941 )
      ( GET-2IMAGE-VERIFY ?auto_193942 ?auto_193943 ?auto_193944 ?auto_193941 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_193949 - DIRECTION
      ?auto_193950 - MODE
      ?auto_193951 - DIRECTION
      ?auto_193948 - MODE
    )
    :vars
    (
      ?auto_193953 - INSTRUMENT
      ?auto_193952 - SATELLITE
      ?auto_193954 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_193951 ?auto_193949 ) ) ( ON_BOARD ?auto_193953 ?auto_193952 ) ( SUPPORTS ?auto_193953 ?auto_193950 ) ( POWER_ON ?auto_193953 ) ( POINTING ?auto_193952 ?auto_193954 ) ( not ( = ?auto_193949 ?auto_193954 ) ) ( HAVE_IMAGE ?auto_193951 ?auto_193948 ) ( not ( = ?auto_193951 ?auto_193954 ) ) ( not ( = ?auto_193948 ?auto_193950 ) ) ( CALIBRATION_TARGET ?auto_193953 ?auto_193954 ) ( NOT_CALIBRATED ?auto_193953 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_193951 ?auto_193948 ?auto_193949 ?auto_193950 )
      ( GET-2IMAGE-VERIFY ?auto_193949 ?auto_193950 ?auto_193951 ?auto_193948 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_194196 - DIRECTION
      ?auto_194197 - MODE
    )
    :vars
    (
      ?auto_194198 - DIRECTION
      ?auto_194201 - INSTRUMENT
      ?auto_194199 - SATELLITE
      ?auto_194202 - DIRECTION
      ?auto_194200 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_194196 ?auto_194198 ) ) ( ON_BOARD ?auto_194201 ?auto_194199 ) ( SUPPORTS ?auto_194201 ?auto_194197 ) ( POINTING ?auto_194199 ?auto_194202 ) ( not ( = ?auto_194196 ?auto_194202 ) ) ( HAVE_IMAGE ?auto_194198 ?auto_194200 ) ( not ( = ?auto_194198 ?auto_194202 ) ) ( not ( = ?auto_194200 ?auto_194197 ) ) ( CALIBRATION_TARGET ?auto_194201 ?auto_194202 ) ( POWER_AVAIL ?auto_194199 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_194201 ?auto_194199 )
      ( GET-2IMAGE ?auto_194198 ?auto_194200 ?auto_194196 ?auto_194197 )
      ( GET-1IMAGE-VERIFY ?auto_194196 ?auto_194197 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_194204 - DIRECTION
      ?auto_194205 - MODE
      ?auto_194206 - DIRECTION
      ?auto_194203 - MODE
    )
    :vars
    (
      ?auto_194209 - INSTRUMENT
      ?auto_194207 - SATELLITE
      ?auto_194208 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_194206 ?auto_194204 ) ) ( ON_BOARD ?auto_194209 ?auto_194207 ) ( SUPPORTS ?auto_194209 ?auto_194203 ) ( POINTING ?auto_194207 ?auto_194208 ) ( not ( = ?auto_194206 ?auto_194208 ) ) ( HAVE_IMAGE ?auto_194204 ?auto_194205 ) ( not ( = ?auto_194204 ?auto_194208 ) ) ( not ( = ?auto_194205 ?auto_194203 ) ) ( CALIBRATION_TARGET ?auto_194209 ?auto_194208 ) ( POWER_AVAIL ?auto_194207 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_194206 ?auto_194203 )
      ( GET-2IMAGE-VERIFY ?auto_194204 ?auto_194205 ?auto_194206 ?auto_194203 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_194211 - DIRECTION
      ?auto_194212 - MODE
      ?auto_194213 - DIRECTION
      ?auto_194210 - MODE
    )
    :vars
    (
      ?auto_194214 - INSTRUMENT
      ?auto_194215 - SATELLITE
      ?auto_194216 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_194213 ?auto_194211 ) ) ( ON_BOARD ?auto_194214 ?auto_194215 ) ( SUPPORTS ?auto_194214 ?auto_194212 ) ( POINTING ?auto_194215 ?auto_194216 ) ( not ( = ?auto_194211 ?auto_194216 ) ) ( HAVE_IMAGE ?auto_194213 ?auto_194210 ) ( not ( = ?auto_194213 ?auto_194216 ) ) ( not ( = ?auto_194210 ?auto_194212 ) ) ( CALIBRATION_TARGET ?auto_194214 ?auto_194216 ) ( POWER_AVAIL ?auto_194215 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_194213 ?auto_194210 ?auto_194211 ?auto_194212 )
      ( GET-2IMAGE-VERIFY ?auto_194211 ?auto_194212 ?auto_194213 ?auto_194210 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_194458 - DIRECTION
      ?auto_194459 - MODE
    )
    :vars
    (
      ?auto_194464 - DIRECTION
      ?auto_194461 - INSTRUMENT
      ?auto_194462 - SATELLITE
      ?auto_194463 - DIRECTION
      ?auto_194460 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_194458 ?auto_194464 ) ) ( ON_BOARD ?auto_194461 ?auto_194462 ) ( SUPPORTS ?auto_194461 ?auto_194459 ) ( not ( = ?auto_194458 ?auto_194463 ) ) ( HAVE_IMAGE ?auto_194464 ?auto_194460 ) ( not ( = ?auto_194464 ?auto_194463 ) ) ( not ( = ?auto_194460 ?auto_194459 ) ) ( CALIBRATION_TARGET ?auto_194461 ?auto_194463 ) ( POWER_AVAIL ?auto_194462 ) ( POINTING ?auto_194462 ?auto_194464 ) )
    :subtasks
    ( ( !TURN_TO ?auto_194462 ?auto_194463 ?auto_194464 )
      ( GET-2IMAGE ?auto_194464 ?auto_194460 ?auto_194458 ?auto_194459 )
      ( GET-1IMAGE-VERIFY ?auto_194458 ?auto_194459 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_194466 - DIRECTION
      ?auto_194467 - MODE
      ?auto_194468 - DIRECTION
      ?auto_194465 - MODE
    )
    :vars
    (
      ?auto_194471 - INSTRUMENT
      ?auto_194469 - SATELLITE
      ?auto_194470 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_194468 ?auto_194466 ) ) ( ON_BOARD ?auto_194471 ?auto_194469 ) ( SUPPORTS ?auto_194471 ?auto_194465 ) ( not ( = ?auto_194468 ?auto_194470 ) ) ( HAVE_IMAGE ?auto_194466 ?auto_194467 ) ( not ( = ?auto_194466 ?auto_194470 ) ) ( not ( = ?auto_194467 ?auto_194465 ) ) ( CALIBRATION_TARGET ?auto_194471 ?auto_194470 ) ( POWER_AVAIL ?auto_194469 ) ( POINTING ?auto_194469 ?auto_194466 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_194468 ?auto_194465 )
      ( GET-2IMAGE-VERIFY ?auto_194466 ?auto_194467 ?auto_194468 ?auto_194465 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_194473 - DIRECTION
      ?auto_194474 - MODE
      ?auto_194475 - DIRECTION
      ?auto_194472 - MODE
    )
    :vars
    (
      ?auto_194477 - INSTRUMENT
      ?auto_194476 - SATELLITE
      ?auto_194478 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_194475 ?auto_194473 ) ) ( ON_BOARD ?auto_194477 ?auto_194476 ) ( SUPPORTS ?auto_194477 ?auto_194474 ) ( not ( = ?auto_194473 ?auto_194478 ) ) ( HAVE_IMAGE ?auto_194475 ?auto_194472 ) ( not ( = ?auto_194475 ?auto_194478 ) ) ( not ( = ?auto_194472 ?auto_194474 ) ) ( CALIBRATION_TARGET ?auto_194477 ?auto_194478 ) ( POWER_AVAIL ?auto_194476 ) ( POINTING ?auto_194476 ?auto_194475 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_194475 ?auto_194472 ?auto_194473 ?auto_194474 )
      ( GET-2IMAGE-VERIFY ?auto_194473 ?auto_194474 ?auto_194475 ?auto_194472 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_194720 - DIRECTION
      ?auto_194721 - MODE
    )
    :vars
    (
      ?auto_194726 - DIRECTION
      ?auto_194723 - INSTRUMENT
      ?auto_194722 - SATELLITE
      ?auto_194724 - DIRECTION
      ?auto_194725 - MODE
      ?auto_194727 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_194720 ?auto_194726 ) ) ( ON_BOARD ?auto_194723 ?auto_194722 ) ( SUPPORTS ?auto_194723 ?auto_194721 ) ( not ( = ?auto_194720 ?auto_194724 ) ) ( HAVE_IMAGE ?auto_194726 ?auto_194725 ) ( not ( = ?auto_194726 ?auto_194724 ) ) ( not ( = ?auto_194725 ?auto_194721 ) ) ( CALIBRATION_TARGET ?auto_194723 ?auto_194724 ) ( POINTING ?auto_194722 ?auto_194726 ) ( ON_BOARD ?auto_194727 ?auto_194722 ) ( POWER_ON ?auto_194727 ) ( not ( = ?auto_194723 ?auto_194727 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_194727 ?auto_194722 )
      ( GET-2IMAGE ?auto_194726 ?auto_194725 ?auto_194720 ?auto_194721 )
      ( GET-1IMAGE-VERIFY ?auto_194720 ?auto_194721 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_194729 - DIRECTION
      ?auto_194730 - MODE
      ?auto_194731 - DIRECTION
      ?auto_194728 - MODE
    )
    :vars
    (
      ?auto_194735 - INSTRUMENT
      ?auto_194734 - SATELLITE
      ?auto_194732 - DIRECTION
      ?auto_194733 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_194731 ?auto_194729 ) ) ( ON_BOARD ?auto_194735 ?auto_194734 ) ( SUPPORTS ?auto_194735 ?auto_194728 ) ( not ( = ?auto_194731 ?auto_194732 ) ) ( HAVE_IMAGE ?auto_194729 ?auto_194730 ) ( not ( = ?auto_194729 ?auto_194732 ) ) ( not ( = ?auto_194730 ?auto_194728 ) ) ( CALIBRATION_TARGET ?auto_194735 ?auto_194732 ) ( POINTING ?auto_194734 ?auto_194729 ) ( ON_BOARD ?auto_194733 ?auto_194734 ) ( POWER_ON ?auto_194733 ) ( not ( = ?auto_194735 ?auto_194733 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_194731 ?auto_194728 )
      ( GET-2IMAGE-VERIFY ?auto_194729 ?auto_194730 ?auto_194731 ?auto_194728 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_194737 - DIRECTION
      ?auto_194738 - MODE
      ?auto_194739 - DIRECTION
      ?auto_194736 - MODE
    )
    :vars
    (
      ?auto_194740 - INSTRUMENT
      ?auto_194743 - SATELLITE
      ?auto_194742 - DIRECTION
      ?auto_194741 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_194739 ?auto_194737 ) ) ( ON_BOARD ?auto_194740 ?auto_194743 ) ( SUPPORTS ?auto_194740 ?auto_194738 ) ( not ( = ?auto_194737 ?auto_194742 ) ) ( HAVE_IMAGE ?auto_194739 ?auto_194736 ) ( not ( = ?auto_194739 ?auto_194742 ) ) ( not ( = ?auto_194736 ?auto_194738 ) ) ( CALIBRATION_TARGET ?auto_194740 ?auto_194742 ) ( POINTING ?auto_194743 ?auto_194739 ) ( ON_BOARD ?auto_194741 ?auto_194743 ) ( POWER_ON ?auto_194741 ) ( not ( = ?auto_194740 ?auto_194741 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_194739 ?auto_194736 ?auto_194737 ?auto_194738 )
      ( GET-2IMAGE-VERIFY ?auto_194737 ?auto_194738 ?auto_194739 ?auto_194736 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_195008 - DIRECTION
      ?auto_195009 - MODE
    )
    :vars
    (
      ?auto_195010 - DIRECTION
      ?auto_195011 - INSTRUMENT
      ?auto_195015 - SATELLITE
      ?auto_195014 - DIRECTION
      ?auto_195013 - MODE
      ?auto_195012 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_195008 ?auto_195010 ) ) ( ON_BOARD ?auto_195011 ?auto_195015 ) ( SUPPORTS ?auto_195011 ?auto_195009 ) ( not ( = ?auto_195008 ?auto_195014 ) ) ( not ( = ?auto_195010 ?auto_195014 ) ) ( not ( = ?auto_195013 ?auto_195009 ) ) ( CALIBRATION_TARGET ?auto_195011 ?auto_195014 ) ( POINTING ?auto_195015 ?auto_195010 ) ( ON_BOARD ?auto_195012 ?auto_195015 ) ( POWER_ON ?auto_195012 ) ( not ( = ?auto_195011 ?auto_195012 ) ) ( CALIBRATED ?auto_195012 ) ( SUPPORTS ?auto_195012 ?auto_195013 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_195010 ?auto_195013 )
      ( GET-2IMAGE ?auto_195010 ?auto_195013 ?auto_195008 ?auto_195009 )
      ( GET-1IMAGE-VERIFY ?auto_195008 ?auto_195009 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_195017 - DIRECTION
      ?auto_195018 - MODE
      ?auto_195019 - DIRECTION
      ?auto_195016 - MODE
    )
    :vars
    (
      ?auto_195021 - INSTRUMENT
      ?auto_195022 - SATELLITE
      ?auto_195020 - DIRECTION
      ?auto_195023 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_195019 ?auto_195017 ) ) ( ON_BOARD ?auto_195021 ?auto_195022 ) ( SUPPORTS ?auto_195021 ?auto_195016 ) ( not ( = ?auto_195019 ?auto_195020 ) ) ( not ( = ?auto_195017 ?auto_195020 ) ) ( not ( = ?auto_195018 ?auto_195016 ) ) ( CALIBRATION_TARGET ?auto_195021 ?auto_195020 ) ( POINTING ?auto_195022 ?auto_195017 ) ( ON_BOARD ?auto_195023 ?auto_195022 ) ( POWER_ON ?auto_195023 ) ( not ( = ?auto_195021 ?auto_195023 ) ) ( CALIBRATED ?auto_195023 ) ( SUPPORTS ?auto_195023 ?auto_195018 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_195019 ?auto_195016 )
      ( GET-2IMAGE-VERIFY ?auto_195017 ?auto_195018 ?auto_195019 ?auto_195016 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_195025 - DIRECTION
      ?auto_195026 - MODE
      ?auto_195027 - DIRECTION
      ?auto_195024 - MODE
    )
    :vars
    (
      ?auto_195028 - INSTRUMENT
      ?auto_195029 - SATELLITE
      ?auto_195031 - DIRECTION
      ?auto_195030 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_195027 ?auto_195025 ) ) ( ON_BOARD ?auto_195028 ?auto_195029 ) ( SUPPORTS ?auto_195028 ?auto_195026 ) ( not ( = ?auto_195025 ?auto_195031 ) ) ( not ( = ?auto_195027 ?auto_195031 ) ) ( not ( = ?auto_195024 ?auto_195026 ) ) ( CALIBRATION_TARGET ?auto_195028 ?auto_195031 ) ( POINTING ?auto_195029 ?auto_195027 ) ( ON_BOARD ?auto_195030 ?auto_195029 ) ( POWER_ON ?auto_195030 ) ( not ( = ?auto_195028 ?auto_195030 ) ) ( CALIBRATED ?auto_195030 ) ( SUPPORTS ?auto_195030 ?auto_195024 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_195027 ?auto_195024 ?auto_195025 ?auto_195026 )
      ( GET-2IMAGE-VERIFY ?auto_195025 ?auto_195026 ?auto_195027 ?auto_195024 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_195296 - DIRECTION
      ?auto_195297 - MODE
    )
    :vars
    (
      ?auto_195298 - DIRECTION
      ?auto_195300 - INSTRUMENT
      ?auto_195301 - SATELLITE
      ?auto_195303 - DIRECTION
      ?auto_195299 - MODE
      ?auto_195302 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_195296 ?auto_195298 ) ) ( ON_BOARD ?auto_195300 ?auto_195301 ) ( SUPPORTS ?auto_195300 ?auto_195297 ) ( not ( = ?auto_195296 ?auto_195303 ) ) ( not ( = ?auto_195298 ?auto_195303 ) ) ( not ( = ?auto_195299 ?auto_195297 ) ) ( CALIBRATION_TARGET ?auto_195300 ?auto_195303 ) ( ON_BOARD ?auto_195302 ?auto_195301 ) ( POWER_ON ?auto_195302 ) ( not ( = ?auto_195300 ?auto_195302 ) ) ( CALIBRATED ?auto_195302 ) ( SUPPORTS ?auto_195302 ?auto_195299 ) ( POINTING ?auto_195301 ?auto_195303 ) )
    :subtasks
    ( ( !TURN_TO ?auto_195301 ?auto_195298 ?auto_195303 )
      ( GET-2IMAGE ?auto_195298 ?auto_195299 ?auto_195296 ?auto_195297 )
      ( GET-1IMAGE-VERIFY ?auto_195296 ?auto_195297 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_195305 - DIRECTION
      ?auto_195306 - MODE
      ?auto_195307 - DIRECTION
      ?auto_195304 - MODE
    )
    :vars
    (
      ?auto_195311 - INSTRUMENT
      ?auto_195308 - SATELLITE
      ?auto_195310 - DIRECTION
      ?auto_195309 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_195307 ?auto_195305 ) ) ( ON_BOARD ?auto_195311 ?auto_195308 ) ( SUPPORTS ?auto_195311 ?auto_195304 ) ( not ( = ?auto_195307 ?auto_195310 ) ) ( not ( = ?auto_195305 ?auto_195310 ) ) ( not ( = ?auto_195306 ?auto_195304 ) ) ( CALIBRATION_TARGET ?auto_195311 ?auto_195310 ) ( ON_BOARD ?auto_195309 ?auto_195308 ) ( POWER_ON ?auto_195309 ) ( not ( = ?auto_195311 ?auto_195309 ) ) ( CALIBRATED ?auto_195309 ) ( SUPPORTS ?auto_195309 ?auto_195306 ) ( POINTING ?auto_195308 ?auto_195310 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_195307 ?auto_195304 )
      ( GET-2IMAGE-VERIFY ?auto_195305 ?auto_195306 ?auto_195307 ?auto_195304 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_195313 - DIRECTION
      ?auto_195314 - MODE
      ?auto_195315 - DIRECTION
      ?auto_195312 - MODE
    )
    :vars
    (
      ?auto_195319 - INSTRUMENT
      ?auto_195318 - SATELLITE
      ?auto_195317 - DIRECTION
      ?auto_195316 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_195315 ?auto_195313 ) ) ( ON_BOARD ?auto_195319 ?auto_195318 ) ( SUPPORTS ?auto_195319 ?auto_195314 ) ( not ( = ?auto_195313 ?auto_195317 ) ) ( not ( = ?auto_195315 ?auto_195317 ) ) ( not ( = ?auto_195312 ?auto_195314 ) ) ( CALIBRATION_TARGET ?auto_195319 ?auto_195317 ) ( ON_BOARD ?auto_195316 ?auto_195318 ) ( POWER_ON ?auto_195316 ) ( not ( = ?auto_195319 ?auto_195316 ) ) ( CALIBRATED ?auto_195316 ) ( SUPPORTS ?auto_195316 ?auto_195312 ) ( POINTING ?auto_195318 ?auto_195317 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_195315 ?auto_195312 ?auto_195313 ?auto_195314 )
      ( GET-2IMAGE-VERIFY ?auto_195313 ?auto_195314 ?auto_195315 ?auto_195312 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_195584 - DIRECTION
      ?auto_195585 - MODE
    )
    :vars
    (
      ?auto_195587 - DIRECTION
      ?auto_195590 - INSTRUMENT
      ?auto_195589 - SATELLITE
      ?auto_195588 - DIRECTION
      ?auto_195591 - MODE
      ?auto_195586 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_195584 ?auto_195587 ) ) ( ON_BOARD ?auto_195590 ?auto_195589 ) ( SUPPORTS ?auto_195590 ?auto_195585 ) ( not ( = ?auto_195584 ?auto_195588 ) ) ( not ( = ?auto_195587 ?auto_195588 ) ) ( not ( = ?auto_195591 ?auto_195585 ) ) ( CALIBRATION_TARGET ?auto_195590 ?auto_195588 ) ( ON_BOARD ?auto_195586 ?auto_195589 ) ( POWER_ON ?auto_195586 ) ( not ( = ?auto_195590 ?auto_195586 ) ) ( SUPPORTS ?auto_195586 ?auto_195591 ) ( POINTING ?auto_195589 ?auto_195588 ) ( CALIBRATION_TARGET ?auto_195586 ?auto_195588 ) ( NOT_CALIBRATED ?auto_195586 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_195589 ?auto_195586 ?auto_195588 )
      ( GET-2IMAGE ?auto_195587 ?auto_195591 ?auto_195584 ?auto_195585 )
      ( GET-1IMAGE-VERIFY ?auto_195584 ?auto_195585 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_195593 - DIRECTION
      ?auto_195594 - MODE
      ?auto_195595 - DIRECTION
      ?auto_195592 - MODE
    )
    :vars
    (
      ?auto_195596 - INSTRUMENT
      ?auto_195598 - SATELLITE
      ?auto_195597 - DIRECTION
      ?auto_195599 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_195595 ?auto_195593 ) ) ( ON_BOARD ?auto_195596 ?auto_195598 ) ( SUPPORTS ?auto_195596 ?auto_195592 ) ( not ( = ?auto_195595 ?auto_195597 ) ) ( not ( = ?auto_195593 ?auto_195597 ) ) ( not ( = ?auto_195594 ?auto_195592 ) ) ( CALIBRATION_TARGET ?auto_195596 ?auto_195597 ) ( ON_BOARD ?auto_195599 ?auto_195598 ) ( POWER_ON ?auto_195599 ) ( not ( = ?auto_195596 ?auto_195599 ) ) ( SUPPORTS ?auto_195599 ?auto_195594 ) ( POINTING ?auto_195598 ?auto_195597 ) ( CALIBRATION_TARGET ?auto_195599 ?auto_195597 ) ( NOT_CALIBRATED ?auto_195599 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_195595 ?auto_195592 )
      ( GET-2IMAGE-VERIFY ?auto_195593 ?auto_195594 ?auto_195595 ?auto_195592 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_195601 - DIRECTION
      ?auto_195602 - MODE
      ?auto_195603 - DIRECTION
      ?auto_195600 - MODE
    )
    :vars
    (
      ?auto_195606 - INSTRUMENT
      ?auto_195604 - SATELLITE
      ?auto_195605 - DIRECTION
      ?auto_195607 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_195603 ?auto_195601 ) ) ( ON_BOARD ?auto_195606 ?auto_195604 ) ( SUPPORTS ?auto_195606 ?auto_195602 ) ( not ( = ?auto_195601 ?auto_195605 ) ) ( not ( = ?auto_195603 ?auto_195605 ) ) ( not ( = ?auto_195600 ?auto_195602 ) ) ( CALIBRATION_TARGET ?auto_195606 ?auto_195605 ) ( ON_BOARD ?auto_195607 ?auto_195604 ) ( POWER_ON ?auto_195607 ) ( not ( = ?auto_195606 ?auto_195607 ) ) ( SUPPORTS ?auto_195607 ?auto_195600 ) ( POINTING ?auto_195604 ?auto_195605 ) ( CALIBRATION_TARGET ?auto_195607 ?auto_195605 ) ( NOT_CALIBRATED ?auto_195607 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_195603 ?auto_195600 ?auto_195601 ?auto_195602 )
      ( GET-2IMAGE-VERIFY ?auto_195601 ?auto_195602 ?auto_195603 ?auto_195600 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_197094 - DIRECTION
      ?auto_197095 - MODE
      ?auto_197096 - DIRECTION
      ?auto_197093 - MODE
      ?auto_197098 - DIRECTION
      ?auto_197097 - MODE
    )
    :vars
    (
      ?auto_197099 - INSTRUMENT
      ?auto_197100 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_197096 ?auto_197094 ) ) ( not ( = ?auto_197098 ?auto_197094 ) ) ( not ( = ?auto_197098 ?auto_197096 ) ) ( CALIBRATED ?auto_197099 ) ( ON_BOARD ?auto_197099 ?auto_197100 ) ( SUPPORTS ?auto_197099 ?auto_197097 ) ( POWER_ON ?auto_197099 ) ( POINTING ?auto_197100 ?auto_197098 ) ( HAVE_IMAGE ?auto_197094 ?auto_197095 ) ( HAVE_IMAGE ?auto_197096 ?auto_197093 ) ( not ( = ?auto_197095 ?auto_197093 ) ) ( not ( = ?auto_197095 ?auto_197097 ) ) ( not ( = ?auto_197093 ?auto_197097 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_197098 ?auto_197097 )
      ( GET-3IMAGE-VERIFY ?auto_197094 ?auto_197095 ?auto_197096 ?auto_197093 ?auto_197098 ?auto_197097 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_197110 - DIRECTION
      ?auto_197111 - MODE
      ?auto_197112 - DIRECTION
      ?auto_197109 - MODE
      ?auto_197114 - DIRECTION
      ?auto_197113 - MODE
    )
    :vars
    (
      ?auto_197115 - INSTRUMENT
      ?auto_197116 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_197112 ?auto_197110 ) ) ( not ( = ?auto_197114 ?auto_197110 ) ) ( not ( = ?auto_197114 ?auto_197112 ) ) ( CALIBRATED ?auto_197115 ) ( ON_BOARD ?auto_197115 ?auto_197116 ) ( SUPPORTS ?auto_197115 ?auto_197109 ) ( POWER_ON ?auto_197115 ) ( POINTING ?auto_197116 ?auto_197112 ) ( HAVE_IMAGE ?auto_197110 ?auto_197111 ) ( HAVE_IMAGE ?auto_197114 ?auto_197113 ) ( not ( = ?auto_197111 ?auto_197109 ) ) ( not ( = ?auto_197111 ?auto_197113 ) ) ( not ( = ?auto_197109 ?auto_197113 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_197112 ?auto_197109 )
      ( GET-3IMAGE-VERIFY ?auto_197110 ?auto_197111 ?auto_197112 ?auto_197109 ?auto_197114 ?auto_197113 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_197170 - DIRECTION
      ?auto_197171 - MODE
      ?auto_197172 - DIRECTION
      ?auto_197169 - MODE
      ?auto_197174 - DIRECTION
      ?auto_197173 - MODE
    )
    :vars
    (
      ?auto_197175 - INSTRUMENT
      ?auto_197176 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_197172 ?auto_197170 ) ) ( not ( = ?auto_197174 ?auto_197170 ) ) ( not ( = ?auto_197174 ?auto_197172 ) ) ( CALIBRATED ?auto_197175 ) ( ON_BOARD ?auto_197175 ?auto_197176 ) ( SUPPORTS ?auto_197175 ?auto_197171 ) ( POWER_ON ?auto_197175 ) ( POINTING ?auto_197176 ?auto_197170 ) ( HAVE_IMAGE ?auto_197172 ?auto_197169 ) ( HAVE_IMAGE ?auto_197174 ?auto_197173 ) ( not ( = ?auto_197171 ?auto_197169 ) ) ( not ( = ?auto_197171 ?auto_197173 ) ) ( not ( = ?auto_197169 ?auto_197173 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_197170 ?auto_197171 )
      ( GET-3IMAGE-VERIFY ?auto_197170 ?auto_197171 ?auto_197172 ?auto_197169 ?auto_197174 ?auto_197173 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_197927 - DIRECTION
      ?auto_197928 - MODE
      ?auto_197929 - DIRECTION
      ?auto_197926 - MODE
      ?auto_197931 - DIRECTION
      ?auto_197930 - MODE
    )
    :vars
    (
      ?auto_197934 - INSTRUMENT
      ?auto_197932 - SATELLITE
      ?auto_197933 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_197929 ?auto_197927 ) ) ( not ( = ?auto_197931 ?auto_197927 ) ) ( not ( = ?auto_197931 ?auto_197929 ) ) ( CALIBRATED ?auto_197934 ) ( ON_BOARD ?auto_197934 ?auto_197932 ) ( SUPPORTS ?auto_197934 ?auto_197930 ) ( POWER_ON ?auto_197934 ) ( POINTING ?auto_197932 ?auto_197933 ) ( not ( = ?auto_197931 ?auto_197933 ) ) ( HAVE_IMAGE ?auto_197927 ?auto_197928 ) ( not ( = ?auto_197927 ?auto_197933 ) ) ( not ( = ?auto_197928 ?auto_197930 ) ) ( HAVE_IMAGE ?auto_197929 ?auto_197926 ) ( not ( = ?auto_197928 ?auto_197926 ) ) ( not ( = ?auto_197929 ?auto_197933 ) ) ( not ( = ?auto_197926 ?auto_197930 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_197927 ?auto_197928 ?auto_197931 ?auto_197930 )
      ( GET-3IMAGE-VERIFY ?auto_197927 ?auto_197928 ?auto_197929 ?auto_197926 ?auto_197931 ?auto_197930 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_197945 - DIRECTION
      ?auto_197946 - MODE
      ?auto_197947 - DIRECTION
      ?auto_197944 - MODE
      ?auto_197949 - DIRECTION
      ?auto_197948 - MODE
    )
    :vars
    (
      ?auto_197952 - INSTRUMENT
      ?auto_197950 - SATELLITE
      ?auto_197951 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_197947 ?auto_197945 ) ) ( not ( = ?auto_197949 ?auto_197945 ) ) ( not ( = ?auto_197949 ?auto_197947 ) ) ( CALIBRATED ?auto_197952 ) ( ON_BOARD ?auto_197952 ?auto_197950 ) ( SUPPORTS ?auto_197952 ?auto_197944 ) ( POWER_ON ?auto_197952 ) ( POINTING ?auto_197950 ?auto_197951 ) ( not ( = ?auto_197947 ?auto_197951 ) ) ( HAVE_IMAGE ?auto_197945 ?auto_197946 ) ( not ( = ?auto_197945 ?auto_197951 ) ) ( not ( = ?auto_197946 ?auto_197944 ) ) ( HAVE_IMAGE ?auto_197949 ?auto_197948 ) ( not ( = ?auto_197946 ?auto_197948 ) ) ( not ( = ?auto_197944 ?auto_197948 ) ) ( not ( = ?auto_197949 ?auto_197951 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_197945 ?auto_197946 ?auto_197947 ?auto_197944 )
      ( GET-3IMAGE-VERIFY ?auto_197945 ?auto_197946 ?auto_197947 ?auto_197944 ?auto_197949 ?auto_197948 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_198017 - DIRECTION
      ?auto_198018 - MODE
      ?auto_198019 - DIRECTION
      ?auto_198016 - MODE
      ?auto_198021 - DIRECTION
      ?auto_198020 - MODE
    )
    :vars
    (
      ?auto_198024 - INSTRUMENT
      ?auto_198022 - SATELLITE
      ?auto_198023 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_198019 ?auto_198017 ) ) ( not ( = ?auto_198021 ?auto_198017 ) ) ( not ( = ?auto_198021 ?auto_198019 ) ) ( CALIBRATED ?auto_198024 ) ( ON_BOARD ?auto_198024 ?auto_198022 ) ( SUPPORTS ?auto_198024 ?auto_198018 ) ( POWER_ON ?auto_198024 ) ( POINTING ?auto_198022 ?auto_198023 ) ( not ( = ?auto_198017 ?auto_198023 ) ) ( HAVE_IMAGE ?auto_198019 ?auto_198016 ) ( not ( = ?auto_198019 ?auto_198023 ) ) ( not ( = ?auto_198016 ?auto_198018 ) ) ( HAVE_IMAGE ?auto_198021 ?auto_198020 ) ( not ( = ?auto_198018 ?auto_198020 ) ) ( not ( = ?auto_198016 ?auto_198020 ) ) ( not ( = ?auto_198021 ?auto_198023 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198019 ?auto_198016 ?auto_198017 ?auto_198018 )
      ( GET-3IMAGE-VERIFY ?auto_198017 ?auto_198018 ?auto_198019 ?auto_198016 ?auto_198021 ?auto_198020 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_198886 - DIRECTION
      ?auto_198887 - MODE
      ?auto_198888 - DIRECTION
      ?auto_198885 - MODE
      ?auto_198890 - DIRECTION
      ?auto_198889 - MODE
    )
    :vars
    (
      ?auto_198893 - INSTRUMENT
      ?auto_198891 - SATELLITE
      ?auto_198892 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_198888 ?auto_198886 ) ) ( not ( = ?auto_198890 ?auto_198886 ) ) ( not ( = ?auto_198890 ?auto_198888 ) ) ( ON_BOARD ?auto_198893 ?auto_198891 ) ( SUPPORTS ?auto_198893 ?auto_198889 ) ( POWER_ON ?auto_198893 ) ( POINTING ?auto_198891 ?auto_198892 ) ( not ( = ?auto_198890 ?auto_198892 ) ) ( HAVE_IMAGE ?auto_198886 ?auto_198887 ) ( not ( = ?auto_198886 ?auto_198892 ) ) ( not ( = ?auto_198887 ?auto_198889 ) ) ( CALIBRATION_TARGET ?auto_198893 ?auto_198892 ) ( NOT_CALIBRATED ?auto_198893 ) ( HAVE_IMAGE ?auto_198888 ?auto_198885 ) ( not ( = ?auto_198887 ?auto_198885 ) ) ( not ( = ?auto_198888 ?auto_198892 ) ) ( not ( = ?auto_198885 ?auto_198889 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198886 ?auto_198887 ?auto_198890 ?auto_198889 )
      ( GET-3IMAGE-VERIFY ?auto_198886 ?auto_198887 ?auto_198888 ?auto_198885 ?auto_198890 ?auto_198889 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_198904 - DIRECTION
      ?auto_198905 - MODE
      ?auto_198906 - DIRECTION
      ?auto_198903 - MODE
      ?auto_198908 - DIRECTION
      ?auto_198907 - MODE
    )
    :vars
    (
      ?auto_198911 - INSTRUMENT
      ?auto_198909 - SATELLITE
      ?auto_198910 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_198906 ?auto_198904 ) ) ( not ( = ?auto_198908 ?auto_198904 ) ) ( not ( = ?auto_198908 ?auto_198906 ) ) ( ON_BOARD ?auto_198911 ?auto_198909 ) ( SUPPORTS ?auto_198911 ?auto_198903 ) ( POWER_ON ?auto_198911 ) ( POINTING ?auto_198909 ?auto_198910 ) ( not ( = ?auto_198906 ?auto_198910 ) ) ( HAVE_IMAGE ?auto_198904 ?auto_198905 ) ( not ( = ?auto_198904 ?auto_198910 ) ) ( not ( = ?auto_198905 ?auto_198903 ) ) ( CALIBRATION_TARGET ?auto_198911 ?auto_198910 ) ( NOT_CALIBRATED ?auto_198911 ) ( HAVE_IMAGE ?auto_198908 ?auto_198907 ) ( not ( = ?auto_198905 ?auto_198907 ) ) ( not ( = ?auto_198903 ?auto_198907 ) ) ( not ( = ?auto_198908 ?auto_198910 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198904 ?auto_198905 ?auto_198906 ?auto_198903 )
      ( GET-3IMAGE-VERIFY ?auto_198904 ?auto_198905 ?auto_198906 ?auto_198903 ?auto_198908 ?auto_198907 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_198976 - DIRECTION
      ?auto_198977 - MODE
      ?auto_198978 - DIRECTION
      ?auto_198975 - MODE
      ?auto_198980 - DIRECTION
      ?auto_198979 - MODE
    )
    :vars
    (
      ?auto_198983 - INSTRUMENT
      ?auto_198981 - SATELLITE
      ?auto_198982 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_198978 ?auto_198976 ) ) ( not ( = ?auto_198980 ?auto_198976 ) ) ( not ( = ?auto_198980 ?auto_198978 ) ) ( ON_BOARD ?auto_198983 ?auto_198981 ) ( SUPPORTS ?auto_198983 ?auto_198977 ) ( POWER_ON ?auto_198983 ) ( POINTING ?auto_198981 ?auto_198982 ) ( not ( = ?auto_198976 ?auto_198982 ) ) ( HAVE_IMAGE ?auto_198978 ?auto_198975 ) ( not ( = ?auto_198978 ?auto_198982 ) ) ( not ( = ?auto_198975 ?auto_198977 ) ) ( CALIBRATION_TARGET ?auto_198983 ?auto_198982 ) ( NOT_CALIBRATED ?auto_198983 ) ( HAVE_IMAGE ?auto_198980 ?auto_198979 ) ( not ( = ?auto_198977 ?auto_198979 ) ) ( not ( = ?auto_198975 ?auto_198979 ) ) ( not ( = ?auto_198980 ?auto_198982 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_198978 ?auto_198975 ?auto_198976 ?auto_198977 )
      ( GET-3IMAGE-VERIFY ?auto_198976 ?auto_198977 ?auto_198978 ?auto_198975 ?auto_198980 ?auto_198979 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_199845 - DIRECTION
      ?auto_199846 - MODE
      ?auto_199847 - DIRECTION
      ?auto_199844 - MODE
      ?auto_199849 - DIRECTION
      ?auto_199848 - MODE
    )
    :vars
    (
      ?auto_199851 - INSTRUMENT
      ?auto_199852 - SATELLITE
      ?auto_199850 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_199847 ?auto_199845 ) ) ( not ( = ?auto_199849 ?auto_199845 ) ) ( not ( = ?auto_199849 ?auto_199847 ) ) ( ON_BOARD ?auto_199851 ?auto_199852 ) ( SUPPORTS ?auto_199851 ?auto_199848 ) ( POINTING ?auto_199852 ?auto_199850 ) ( not ( = ?auto_199849 ?auto_199850 ) ) ( HAVE_IMAGE ?auto_199845 ?auto_199846 ) ( not ( = ?auto_199845 ?auto_199850 ) ) ( not ( = ?auto_199846 ?auto_199848 ) ) ( CALIBRATION_TARGET ?auto_199851 ?auto_199850 ) ( POWER_AVAIL ?auto_199852 ) ( HAVE_IMAGE ?auto_199847 ?auto_199844 ) ( not ( = ?auto_199846 ?auto_199844 ) ) ( not ( = ?auto_199847 ?auto_199850 ) ) ( not ( = ?auto_199844 ?auto_199848 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199845 ?auto_199846 ?auto_199849 ?auto_199848 )
      ( GET-3IMAGE-VERIFY ?auto_199845 ?auto_199846 ?auto_199847 ?auto_199844 ?auto_199849 ?auto_199848 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_199863 - DIRECTION
      ?auto_199864 - MODE
      ?auto_199865 - DIRECTION
      ?auto_199862 - MODE
      ?auto_199867 - DIRECTION
      ?auto_199866 - MODE
    )
    :vars
    (
      ?auto_199869 - INSTRUMENT
      ?auto_199870 - SATELLITE
      ?auto_199868 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_199865 ?auto_199863 ) ) ( not ( = ?auto_199867 ?auto_199863 ) ) ( not ( = ?auto_199867 ?auto_199865 ) ) ( ON_BOARD ?auto_199869 ?auto_199870 ) ( SUPPORTS ?auto_199869 ?auto_199862 ) ( POINTING ?auto_199870 ?auto_199868 ) ( not ( = ?auto_199865 ?auto_199868 ) ) ( HAVE_IMAGE ?auto_199863 ?auto_199864 ) ( not ( = ?auto_199863 ?auto_199868 ) ) ( not ( = ?auto_199864 ?auto_199862 ) ) ( CALIBRATION_TARGET ?auto_199869 ?auto_199868 ) ( POWER_AVAIL ?auto_199870 ) ( HAVE_IMAGE ?auto_199867 ?auto_199866 ) ( not ( = ?auto_199864 ?auto_199866 ) ) ( not ( = ?auto_199862 ?auto_199866 ) ) ( not ( = ?auto_199867 ?auto_199868 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199863 ?auto_199864 ?auto_199865 ?auto_199862 )
      ( GET-3IMAGE-VERIFY ?auto_199863 ?auto_199864 ?auto_199865 ?auto_199862 ?auto_199867 ?auto_199866 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_199935 - DIRECTION
      ?auto_199936 - MODE
      ?auto_199937 - DIRECTION
      ?auto_199934 - MODE
      ?auto_199939 - DIRECTION
      ?auto_199938 - MODE
    )
    :vars
    (
      ?auto_199941 - INSTRUMENT
      ?auto_199942 - SATELLITE
      ?auto_199940 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_199937 ?auto_199935 ) ) ( not ( = ?auto_199939 ?auto_199935 ) ) ( not ( = ?auto_199939 ?auto_199937 ) ) ( ON_BOARD ?auto_199941 ?auto_199942 ) ( SUPPORTS ?auto_199941 ?auto_199936 ) ( POINTING ?auto_199942 ?auto_199940 ) ( not ( = ?auto_199935 ?auto_199940 ) ) ( HAVE_IMAGE ?auto_199937 ?auto_199934 ) ( not ( = ?auto_199937 ?auto_199940 ) ) ( not ( = ?auto_199934 ?auto_199936 ) ) ( CALIBRATION_TARGET ?auto_199941 ?auto_199940 ) ( POWER_AVAIL ?auto_199942 ) ( HAVE_IMAGE ?auto_199939 ?auto_199938 ) ( not ( = ?auto_199936 ?auto_199938 ) ) ( not ( = ?auto_199934 ?auto_199938 ) ) ( not ( = ?auto_199939 ?auto_199940 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_199937 ?auto_199934 ?auto_199935 ?auto_199936 )
      ( GET-3IMAGE-VERIFY ?auto_199935 ?auto_199936 ?auto_199937 ?auto_199934 ?auto_199939 ?auto_199938 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_200756 - DIRECTION
      ?auto_200757 - MODE
    )
    :vars
    (
      ?auto_200761 - DIRECTION
      ?auto_200760 - INSTRUMENT
      ?auto_200762 - SATELLITE
      ?auto_200759 - DIRECTION
      ?auto_200758 - MODE
      ?auto_200763 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_200756 ?auto_200761 ) ) ( ON_BOARD ?auto_200760 ?auto_200762 ) ( SUPPORTS ?auto_200760 ?auto_200757 ) ( not ( = ?auto_200756 ?auto_200759 ) ) ( HAVE_IMAGE ?auto_200761 ?auto_200758 ) ( not ( = ?auto_200761 ?auto_200759 ) ) ( not ( = ?auto_200758 ?auto_200757 ) ) ( CALIBRATION_TARGET ?auto_200760 ?auto_200759 ) ( POWER_AVAIL ?auto_200762 ) ( POINTING ?auto_200762 ?auto_200763 ) ( not ( = ?auto_200759 ?auto_200763 ) ) ( not ( = ?auto_200756 ?auto_200763 ) ) ( not ( = ?auto_200761 ?auto_200763 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_200762 ?auto_200759 ?auto_200763 )
      ( GET-2IMAGE ?auto_200761 ?auto_200758 ?auto_200756 ?auto_200757 )
      ( GET-1IMAGE-VERIFY ?auto_200756 ?auto_200757 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_200765 - DIRECTION
      ?auto_200766 - MODE
      ?auto_200767 - DIRECTION
      ?auto_200764 - MODE
    )
    :vars
    (
      ?auto_200770 - INSTRUMENT
      ?auto_200768 - SATELLITE
      ?auto_200771 - DIRECTION
      ?auto_200769 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_200767 ?auto_200765 ) ) ( ON_BOARD ?auto_200770 ?auto_200768 ) ( SUPPORTS ?auto_200770 ?auto_200764 ) ( not ( = ?auto_200767 ?auto_200771 ) ) ( HAVE_IMAGE ?auto_200765 ?auto_200766 ) ( not ( = ?auto_200765 ?auto_200771 ) ) ( not ( = ?auto_200766 ?auto_200764 ) ) ( CALIBRATION_TARGET ?auto_200770 ?auto_200771 ) ( POWER_AVAIL ?auto_200768 ) ( POINTING ?auto_200768 ?auto_200769 ) ( not ( = ?auto_200771 ?auto_200769 ) ) ( not ( = ?auto_200767 ?auto_200769 ) ) ( not ( = ?auto_200765 ?auto_200769 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_200767 ?auto_200764 )
      ( GET-2IMAGE-VERIFY ?auto_200765 ?auto_200766 ?auto_200767 ?auto_200764 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_200773 - DIRECTION
      ?auto_200774 - MODE
      ?auto_200775 - DIRECTION
      ?auto_200772 - MODE
    )
    :vars
    (
      ?auto_200778 - DIRECTION
      ?auto_200777 - INSTRUMENT
      ?auto_200776 - SATELLITE
      ?auto_200780 - DIRECTION
      ?auto_200779 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_200775 ?auto_200773 ) ) ( not ( = ?auto_200775 ?auto_200778 ) ) ( ON_BOARD ?auto_200777 ?auto_200776 ) ( SUPPORTS ?auto_200777 ?auto_200772 ) ( not ( = ?auto_200775 ?auto_200780 ) ) ( HAVE_IMAGE ?auto_200778 ?auto_200779 ) ( not ( = ?auto_200778 ?auto_200780 ) ) ( not ( = ?auto_200779 ?auto_200772 ) ) ( CALIBRATION_TARGET ?auto_200777 ?auto_200780 ) ( POWER_AVAIL ?auto_200776 ) ( POINTING ?auto_200776 ?auto_200773 ) ( not ( = ?auto_200780 ?auto_200773 ) ) ( not ( = ?auto_200778 ?auto_200773 ) ) ( HAVE_IMAGE ?auto_200773 ?auto_200774 ) ( not ( = ?auto_200774 ?auto_200772 ) ) ( not ( = ?auto_200774 ?auto_200779 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200778 ?auto_200779 ?auto_200775 ?auto_200772 )
      ( GET-2IMAGE-VERIFY ?auto_200773 ?auto_200774 ?auto_200775 ?auto_200772 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_200782 - DIRECTION
      ?auto_200783 - MODE
      ?auto_200784 - DIRECTION
      ?auto_200781 - MODE
    )
    :vars
    (
      ?auto_200786 - INSTRUMENT
      ?auto_200785 - SATELLITE
      ?auto_200787 - DIRECTION
      ?auto_200788 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_200784 ?auto_200782 ) ) ( ON_BOARD ?auto_200786 ?auto_200785 ) ( SUPPORTS ?auto_200786 ?auto_200783 ) ( not ( = ?auto_200782 ?auto_200787 ) ) ( HAVE_IMAGE ?auto_200784 ?auto_200781 ) ( not ( = ?auto_200784 ?auto_200787 ) ) ( not ( = ?auto_200781 ?auto_200783 ) ) ( CALIBRATION_TARGET ?auto_200786 ?auto_200787 ) ( POWER_AVAIL ?auto_200785 ) ( POINTING ?auto_200785 ?auto_200788 ) ( not ( = ?auto_200787 ?auto_200788 ) ) ( not ( = ?auto_200782 ?auto_200788 ) ) ( not ( = ?auto_200784 ?auto_200788 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200784 ?auto_200781 ?auto_200782 ?auto_200783 )
      ( GET-2IMAGE-VERIFY ?auto_200782 ?auto_200783 ?auto_200784 ?auto_200781 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_200790 - DIRECTION
      ?auto_200791 - MODE
      ?auto_200792 - DIRECTION
      ?auto_200789 - MODE
    )
    :vars
    (
      ?auto_200795 - DIRECTION
      ?auto_200794 - INSTRUMENT
      ?auto_200793 - SATELLITE
      ?auto_200797 - DIRECTION
      ?auto_200796 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_200792 ?auto_200790 ) ) ( not ( = ?auto_200790 ?auto_200795 ) ) ( ON_BOARD ?auto_200794 ?auto_200793 ) ( SUPPORTS ?auto_200794 ?auto_200791 ) ( not ( = ?auto_200790 ?auto_200797 ) ) ( HAVE_IMAGE ?auto_200795 ?auto_200796 ) ( not ( = ?auto_200795 ?auto_200797 ) ) ( not ( = ?auto_200796 ?auto_200791 ) ) ( CALIBRATION_TARGET ?auto_200794 ?auto_200797 ) ( POWER_AVAIL ?auto_200793 ) ( POINTING ?auto_200793 ?auto_200792 ) ( not ( = ?auto_200797 ?auto_200792 ) ) ( not ( = ?auto_200795 ?auto_200792 ) ) ( HAVE_IMAGE ?auto_200792 ?auto_200789 ) ( not ( = ?auto_200791 ?auto_200789 ) ) ( not ( = ?auto_200789 ?auto_200796 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200795 ?auto_200796 ?auto_200790 ?auto_200791 )
      ( GET-2IMAGE-VERIFY ?auto_200790 ?auto_200791 ?auto_200792 ?auto_200789 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_200819 - DIRECTION
      ?auto_200820 - MODE
      ?auto_200821 - DIRECTION
      ?auto_200818 - MODE
      ?auto_200823 - DIRECTION
      ?auto_200822 - MODE
    )
    :vars
    (
      ?auto_200825 - INSTRUMENT
      ?auto_200824 - SATELLITE
      ?auto_200826 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_200821 ?auto_200819 ) ) ( not ( = ?auto_200823 ?auto_200819 ) ) ( not ( = ?auto_200823 ?auto_200821 ) ) ( ON_BOARD ?auto_200825 ?auto_200824 ) ( SUPPORTS ?auto_200825 ?auto_200822 ) ( not ( = ?auto_200823 ?auto_200826 ) ) ( HAVE_IMAGE ?auto_200819 ?auto_200820 ) ( not ( = ?auto_200819 ?auto_200826 ) ) ( not ( = ?auto_200820 ?auto_200822 ) ) ( CALIBRATION_TARGET ?auto_200825 ?auto_200826 ) ( POWER_AVAIL ?auto_200824 ) ( POINTING ?auto_200824 ?auto_200821 ) ( not ( = ?auto_200826 ?auto_200821 ) ) ( HAVE_IMAGE ?auto_200821 ?auto_200818 ) ( not ( = ?auto_200820 ?auto_200818 ) ) ( not ( = ?auto_200818 ?auto_200822 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200819 ?auto_200820 ?auto_200823 ?auto_200822 )
      ( GET-3IMAGE-VERIFY ?auto_200819 ?auto_200820 ?auto_200821 ?auto_200818 ?auto_200823 ?auto_200822 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_200838 - DIRECTION
      ?auto_200839 - MODE
      ?auto_200840 - DIRECTION
      ?auto_200837 - MODE
      ?auto_200842 - DIRECTION
      ?auto_200841 - MODE
    )
    :vars
    (
      ?auto_200844 - INSTRUMENT
      ?auto_200843 - SATELLITE
      ?auto_200845 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_200840 ?auto_200838 ) ) ( not ( = ?auto_200842 ?auto_200838 ) ) ( not ( = ?auto_200842 ?auto_200840 ) ) ( ON_BOARD ?auto_200844 ?auto_200843 ) ( SUPPORTS ?auto_200844 ?auto_200837 ) ( not ( = ?auto_200840 ?auto_200845 ) ) ( HAVE_IMAGE ?auto_200838 ?auto_200839 ) ( not ( = ?auto_200838 ?auto_200845 ) ) ( not ( = ?auto_200839 ?auto_200837 ) ) ( CALIBRATION_TARGET ?auto_200844 ?auto_200845 ) ( POWER_AVAIL ?auto_200843 ) ( POINTING ?auto_200843 ?auto_200842 ) ( not ( = ?auto_200845 ?auto_200842 ) ) ( HAVE_IMAGE ?auto_200842 ?auto_200841 ) ( not ( = ?auto_200839 ?auto_200841 ) ) ( not ( = ?auto_200837 ?auto_200841 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200838 ?auto_200839 ?auto_200840 ?auto_200837 )
      ( GET-3IMAGE-VERIFY ?auto_200838 ?auto_200839 ?auto_200840 ?auto_200837 ?auto_200842 ?auto_200841 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_200857 - DIRECTION
      ?auto_200858 - MODE
      ?auto_200859 - DIRECTION
      ?auto_200856 - MODE
      ?auto_200861 - DIRECTION
      ?auto_200860 - MODE
    )
    :vars
    (
      ?auto_200863 - INSTRUMENT
      ?auto_200862 - SATELLITE
      ?auto_200864 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_200859 ?auto_200857 ) ) ( not ( = ?auto_200861 ?auto_200857 ) ) ( not ( = ?auto_200861 ?auto_200859 ) ) ( ON_BOARD ?auto_200863 ?auto_200862 ) ( SUPPORTS ?auto_200863 ?auto_200860 ) ( not ( = ?auto_200861 ?auto_200864 ) ) ( HAVE_IMAGE ?auto_200859 ?auto_200856 ) ( not ( = ?auto_200859 ?auto_200864 ) ) ( not ( = ?auto_200856 ?auto_200860 ) ) ( CALIBRATION_TARGET ?auto_200863 ?auto_200864 ) ( POWER_AVAIL ?auto_200862 ) ( POINTING ?auto_200862 ?auto_200857 ) ( not ( = ?auto_200864 ?auto_200857 ) ) ( HAVE_IMAGE ?auto_200857 ?auto_200858 ) ( not ( = ?auto_200858 ?auto_200856 ) ) ( not ( = ?auto_200858 ?auto_200860 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200859 ?auto_200856 ?auto_200861 ?auto_200860 )
      ( GET-3IMAGE-VERIFY ?auto_200857 ?auto_200858 ?auto_200859 ?auto_200856 ?auto_200861 ?auto_200860 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_200877 - DIRECTION
      ?auto_200878 - MODE
      ?auto_200879 - DIRECTION
      ?auto_200876 - MODE
      ?auto_200881 - DIRECTION
      ?auto_200880 - MODE
    )
    :vars
    (
      ?auto_200883 - INSTRUMENT
      ?auto_200882 - SATELLITE
      ?auto_200884 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_200879 ?auto_200877 ) ) ( not ( = ?auto_200881 ?auto_200877 ) ) ( not ( = ?auto_200881 ?auto_200879 ) ) ( ON_BOARD ?auto_200883 ?auto_200882 ) ( SUPPORTS ?auto_200883 ?auto_200876 ) ( not ( = ?auto_200879 ?auto_200884 ) ) ( HAVE_IMAGE ?auto_200881 ?auto_200880 ) ( not ( = ?auto_200881 ?auto_200884 ) ) ( not ( = ?auto_200880 ?auto_200876 ) ) ( CALIBRATION_TARGET ?auto_200883 ?auto_200884 ) ( POWER_AVAIL ?auto_200882 ) ( POINTING ?auto_200882 ?auto_200877 ) ( not ( = ?auto_200884 ?auto_200877 ) ) ( HAVE_IMAGE ?auto_200877 ?auto_200878 ) ( not ( = ?auto_200878 ?auto_200876 ) ) ( not ( = ?auto_200878 ?auto_200880 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200881 ?auto_200880 ?auto_200879 ?auto_200876 )
      ( GET-3IMAGE-VERIFY ?auto_200877 ?auto_200878 ?auto_200879 ?auto_200876 ?auto_200881 ?auto_200880 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_200918 - DIRECTION
      ?auto_200919 - MODE
      ?auto_200920 - DIRECTION
      ?auto_200917 - MODE
      ?auto_200922 - DIRECTION
      ?auto_200921 - MODE
    )
    :vars
    (
      ?auto_200924 - INSTRUMENT
      ?auto_200923 - SATELLITE
      ?auto_200925 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_200920 ?auto_200918 ) ) ( not ( = ?auto_200922 ?auto_200918 ) ) ( not ( = ?auto_200922 ?auto_200920 ) ) ( ON_BOARD ?auto_200924 ?auto_200923 ) ( SUPPORTS ?auto_200924 ?auto_200919 ) ( not ( = ?auto_200918 ?auto_200925 ) ) ( HAVE_IMAGE ?auto_200920 ?auto_200917 ) ( not ( = ?auto_200920 ?auto_200925 ) ) ( not ( = ?auto_200917 ?auto_200919 ) ) ( CALIBRATION_TARGET ?auto_200924 ?auto_200925 ) ( POWER_AVAIL ?auto_200923 ) ( POINTING ?auto_200923 ?auto_200922 ) ( not ( = ?auto_200925 ?auto_200922 ) ) ( HAVE_IMAGE ?auto_200922 ?auto_200921 ) ( not ( = ?auto_200919 ?auto_200921 ) ) ( not ( = ?auto_200917 ?auto_200921 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200920 ?auto_200917 ?auto_200918 ?auto_200919 )
      ( GET-3IMAGE-VERIFY ?auto_200918 ?auto_200919 ?auto_200920 ?auto_200917 ?auto_200922 ?auto_200921 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_200937 - DIRECTION
      ?auto_200938 - MODE
      ?auto_200939 - DIRECTION
      ?auto_200936 - MODE
      ?auto_200941 - DIRECTION
      ?auto_200940 - MODE
    )
    :vars
    (
      ?auto_200943 - INSTRUMENT
      ?auto_200942 - SATELLITE
      ?auto_200944 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_200939 ?auto_200937 ) ) ( not ( = ?auto_200941 ?auto_200937 ) ) ( not ( = ?auto_200941 ?auto_200939 ) ) ( ON_BOARD ?auto_200943 ?auto_200942 ) ( SUPPORTS ?auto_200943 ?auto_200938 ) ( not ( = ?auto_200937 ?auto_200944 ) ) ( HAVE_IMAGE ?auto_200941 ?auto_200940 ) ( not ( = ?auto_200941 ?auto_200944 ) ) ( not ( = ?auto_200940 ?auto_200938 ) ) ( CALIBRATION_TARGET ?auto_200943 ?auto_200944 ) ( POWER_AVAIL ?auto_200942 ) ( POINTING ?auto_200942 ?auto_200939 ) ( not ( = ?auto_200944 ?auto_200939 ) ) ( HAVE_IMAGE ?auto_200939 ?auto_200936 ) ( not ( = ?auto_200938 ?auto_200936 ) ) ( not ( = ?auto_200936 ?auto_200940 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_200941 ?auto_200940 ?auto_200937 ?auto_200938 )
      ( GET-3IMAGE-VERIFY ?auto_200937 ?auto_200938 ?auto_200939 ?auto_200936 ?auto_200941 ?auto_200940 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_201760 - DIRECTION
      ?auto_201761 - MODE
    )
    :vars
    (
      ?auto_201764 - DIRECTION
      ?auto_201763 - INSTRUMENT
      ?auto_201762 - SATELLITE
      ?auto_201766 - DIRECTION
      ?auto_201765 - MODE
      ?auto_201767 - DIRECTION
      ?auto_201768 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_201760 ?auto_201764 ) ) ( ON_BOARD ?auto_201763 ?auto_201762 ) ( SUPPORTS ?auto_201763 ?auto_201761 ) ( not ( = ?auto_201760 ?auto_201766 ) ) ( HAVE_IMAGE ?auto_201764 ?auto_201765 ) ( not ( = ?auto_201764 ?auto_201766 ) ) ( not ( = ?auto_201765 ?auto_201761 ) ) ( CALIBRATION_TARGET ?auto_201763 ?auto_201766 ) ( POINTING ?auto_201762 ?auto_201767 ) ( not ( = ?auto_201766 ?auto_201767 ) ) ( not ( = ?auto_201760 ?auto_201767 ) ) ( not ( = ?auto_201764 ?auto_201767 ) ) ( ON_BOARD ?auto_201768 ?auto_201762 ) ( POWER_ON ?auto_201768 ) ( not ( = ?auto_201763 ?auto_201768 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_201768 ?auto_201762 )
      ( GET-2IMAGE ?auto_201764 ?auto_201765 ?auto_201760 ?auto_201761 )
      ( GET-1IMAGE-VERIFY ?auto_201760 ?auto_201761 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_201770 - DIRECTION
      ?auto_201771 - MODE
      ?auto_201772 - DIRECTION
      ?auto_201769 - MODE
    )
    :vars
    (
      ?auto_201774 - INSTRUMENT
      ?auto_201773 - SATELLITE
      ?auto_201775 - DIRECTION
      ?auto_201776 - DIRECTION
      ?auto_201777 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_201772 ?auto_201770 ) ) ( ON_BOARD ?auto_201774 ?auto_201773 ) ( SUPPORTS ?auto_201774 ?auto_201769 ) ( not ( = ?auto_201772 ?auto_201775 ) ) ( HAVE_IMAGE ?auto_201770 ?auto_201771 ) ( not ( = ?auto_201770 ?auto_201775 ) ) ( not ( = ?auto_201771 ?auto_201769 ) ) ( CALIBRATION_TARGET ?auto_201774 ?auto_201775 ) ( POINTING ?auto_201773 ?auto_201776 ) ( not ( = ?auto_201775 ?auto_201776 ) ) ( not ( = ?auto_201772 ?auto_201776 ) ) ( not ( = ?auto_201770 ?auto_201776 ) ) ( ON_BOARD ?auto_201777 ?auto_201773 ) ( POWER_ON ?auto_201777 ) ( not ( = ?auto_201774 ?auto_201777 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_201772 ?auto_201769 )
      ( GET-2IMAGE-VERIFY ?auto_201770 ?auto_201771 ?auto_201772 ?auto_201769 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_201779 - DIRECTION
      ?auto_201780 - MODE
      ?auto_201781 - DIRECTION
      ?auto_201778 - MODE
    )
    :vars
    (
      ?auto_201782 - DIRECTION
      ?auto_201783 - INSTRUMENT
      ?auto_201787 - SATELLITE
      ?auto_201785 - DIRECTION
      ?auto_201784 - MODE
      ?auto_201786 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_201781 ?auto_201779 ) ) ( not ( = ?auto_201781 ?auto_201782 ) ) ( ON_BOARD ?auto_201783 ?auto_201787 ) ( SUPPORTS ?auto_201783 ?auto_201778 ) ( not ( = ?auto_201781 ?auto_201785 ) ) ( HAVE_IMAGE ?auto_201782 ?auto_201784 ) ( not ( = ?auto_201782 ?auto_201785 ) ) ( not ( = ?auto_201784 ?auto_201778 ) ) ( CALIBRATION_TARGET ?auto_201783 ?auto_201785 ) ( POINTING ?auto_201787 ?auto_201779 ) ( not ( = ?auto_201785 ?auto_201779 ) ) ( not ( = ?auto_201782 ?auto_201779 ) ) ( ON_BOARD ?auto_201786 ?auto_201787 ) ( POWER_ON ?auto_201786 ) ( not ( = ?auto_201783 ?auto_201786 ) ) ( HAVE_IMAGE ?auto_201779 ?auto_201780 ) ( not ( = ?auto_201780 ?auto_201778 ) ) ( not ( = ?auto_201780 ?auto_201784 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201782 ?auto_201784 ?auto_201781 ?auto_201778 )
      ( GET-2IMAGE-VERIFY ?auto_201779 ?auto_201780 ?auto_201781 ?auto_201778 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_201789 - DIRECTION
      ?auto_201790 - MODE
      ?auto_201791 - DIRECTION
      ?auto_201788 - MODE
    )
    :vars
    (
      ?auto_201793 - INSTRUMENT
      ?auto_201796 - SATELLITE
      ?auto_201794 - DIRECTION
      ?auto_201792 - DIRECTION
      ?auto_201795 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_201791 ?auto_201789 ) ) ( ON_BOARD ?auto_201793 ?auto_201796 ) ( SUPPORTS ?auto_201793 ?auto_201790 ) ( not ( = ?auto_201789 ?auto_201794 ) ) ( HAVE_IMAGE ?auto_201791 ?auto_201788 ) ( not ( = ?auto_201791 ?auto_201794 ) ) ( not ( = ?auto_201788 ?auto_201790 ) ) ( CALIBRATION_TARGET ?auto_201793 ?auto_201794 ) ( POINTING ?auto_201796 ?auto_201792 ) ( not ( = ?auto_201794 ?auto_201792 ) ) ( not ( = ?auto_201789 ?auto_201792 ) ) ( not ( = ?auto_201791 ?auto_201792 ) ) ( ON_BOARD ?auto_201795 ?auto_201796 ) ( POWER_ON ?auto_201795 ) ( not ( = ?auto_201793 ?auto_201795 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201791 ?auto_201788 ?auto_201789 ?auto_201790 )
      ( GET-2IMAGE-VERIFY ?auto_201789 ?auto_201790 ?auto_201791 ?auto_201788 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_201798 - DIRECTION
      ?auto_201799 - MODE
      ?auto_201800 - DIRECTION
      ?auto_201797 - MODE
    )
    :vars
    (
      ?auto_201801 - DIRECTION
      ?auto_201802 - INSTRUMENT
      ?auto_201806 - SATELLITE
      ?auto_201804 - DIRECTION
      ?auto_201803 - MODE
      ?auto_201805 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_201800 ?auto_201798 ) ) ( not ( = ?auto_201798 ?auto_201801 ) ) ( ON_BOARD ?auto_201802 ?auto_201806 ) ( SUPPORTS ?auto_201802 ?auto_201799 ) ( not ( = ?auto_201798 ?auto_201804 ) ) ( HAVE_IMAGE ?auto_201801 ?auto_201803 ) ( not ( = ?auto_201801 ?auto_201804 ) ) ( not ( = ?auto_201803 ?auto_201799 ) ) ( CALIBRATION_TARGET ?auto_201802 ?auto_201804 ) ( POINTING ?auto_201806 ?auto_201800 ) ( not ( = ?auto_201804 ?auto_201800 ) ) ( not ( = ?auto_201801 ?auto_201800 ) ) ( ON_BOARD ?auto_201805 ?auto_201806 ) ( POWER_ON ?auto_201805 ) ( not ( = ?auto_201802 ?auto_201805 ) ) ( HAVE_IMAGE ?auto_201800 ?auto_201797 ) ( not ( = ?auto_201799 ?auto_201797 ) ) ( not ( = ?auto_201797 ?auto_201803 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201801 ?auto_201803 ?auto_201798 ?auto_201799 )
      ( GET-2IMAGE-VERIFY ?auto_201798 ?auto_201799 ?auto_201800 ?auto_201797 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_201830 - DIRECTION
      ?auto_201831 - MODE
      ?auto_201832 - DIRECTION
      ?auto_201829 - MODE
      ?auto_201834 - DIRECTION
      ?auto_201833 - MODE
    )
    :vars
    (
      ?auto_201835 - INSTRUMENT
      ?auto_201838 - SATELLITE
      ?auto_201836 - DIRECTION
      ?auto_201837 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_201832 ?auto_201830 ) ) ( not ( = ?auto_201834 ?auto_201830 ) ) ( not ( = ?auto_201834 ?auto_201832 ) ) ( ON_BOARD ?auto_201835 ?auto_201838 ) ( SUPPORTS ?auto_201835 ?auto_201833 ) ( not ( = ?auto_201834 ?auto_201836 ) ) ( HAVE_IMAGE ?auto_201830 ?auto_201831 ) ( not ( = ?auto_201830 ?auto_201836 ) ) ( not ( = ?auto_201831 ?auto_201833 ) ) ( CALIBRATION_TARGET ?auto_201835 ?auto_201836 ) ( POINTING ?auto_201838 ?auto_201832 ) ( not ( = ?auto_201836 ?auto_201832 ) ) ( ON_BOARD ?auto_201837 ?auto_201838 ) ( POWER_ON ?auto_201837 ) ( not ( = ?auto_201835 ?auto_201837 ) ) ( HAVE_IMAGE ?auto_201832 ?auto_201829 ) ( not ( = ?auto_201831 ?auto_201829 ) ) ( not ( = ?auto_201829 ?auto_201833 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201830 ?auto_201831 ?auto_201834 ?auto_201833 )
      ( GET-3IMAGE-VERIFY ?auto_201830 ?auto_201831 ?auto_201832 ?auto_201829 ?auto_201834 ?auto_201833 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_201851 - DIRECTION
      ?auto_201852 - MODE
      ?auto_201853 - DIRECTION
      ?auto_201850 - MODE
      ?auto_201855 - DIRECTION
      ?auto_201854 - MODE
    )
    :vars
    (
      ?auto_201856 - INSTRUMENT
      ?auto_201859 - SATELLITE
      ?auto_201857 - DIRECTION
      ?auto_201858 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_201853 ?auto_201851 ) ) ( not ( = ?auto_201855 ?auto_201851 ) ) ( not ( = ?auto_201855 ?auto_201853 ) ) ( ON_BOARD ?auto_201856 ?auto_201859 ) ( SUPPORTS ?auto_201856 ?auto_201850 ) ( not ( = ?auto_201853 ?auto_201857 ) ) ( HAVE_IMAGE ?auto_201851 ?auto_201852 ) ( not ( = ?auto_201851 ?auto_201857 ) ) ( not ( = ?auto_201852 ?auto_201850 ) ) ( CALIBRATION_TARGET ?auto_201856 ?auto_201857 ) ( POINTING ?auto_201859 ?auto_201855 ) ( not ( = ?auto_201857 ?auto_201855 ) ) ( ON_BOARD ?auto_201858 ?auto_201859 ) ( POWER_ON ?auto_201858 ) ( not ( = ?auto_201856 ?auto_201858 ) ) ( HAVE_IMAGE ?auto_201855 ?auto_201854 ) ( not ( = ?auto_201852 ?auto_201854 ) ) ( not ( = ?auto_201850 ?auto_201854 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201851 ?auto_201852 ?auto_201853 ?auto_201850 )
      ( GET-3IMAGE-VERIFY ?auto_201851 ?auto_201852 ?auto_201853 ?auto_201850 ?auto_201855 ?auto_201854 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_201872 - DIRECTION
      ?auto_201873 - MODE
      ?auto_201874 - DIRECTION
      ?auto_201871 - MODE
      ?auto_201876 - DIRECTION
      ?auto_201875 - MODE
    )
    :vars
    (
      ?auto_201877 - INSTRUMENT
      ?auto_201880 - SATELLITE
      ?auto_201878 - DIRECTION
      ?auto_201879 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_201874 ?auto_201872 ) ) ( not ( = ?auto_201876 ?auto_201872 ) ) ( not ( = ?auto_201876 ?auto_201874 ) ) ( ON_BOARD ?auto_201877 ?auto_201880 ) ( SUPPORTS ?auto_201877 ?auto_201875 ) ( not ( = ?auto_201876 ?auto_201878 ) ) ( HAVE_IMAGE ?auto_201874 ?auto_201871 ) ( not ( = ?auto_201874 ?auto_201878 ) ) ( not ( = ?auto_201871 ?auto_201875 ) ) ( CALIBRATION_TARGET ?auto_201877 ?auto_201878 ) ( POINTING ?auto_201880 ?auto_201872 ) ( not ( = ?auto_201878 ?auto_201872 ) ) ( ON_BOARD ?auto_201879 ?auto_201880 ) ( POWER_ON ?auto_201879 ) ( not ( = ?auto_201877 ?auto_201879 ) ) ( HAVE_IMAGE ?auto_201872 ?auto_201873 ) ( not ( = ?auto_201873 ?auto_201871 ) ) ( not ( = ?auto_201873 ?auto_201875 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201874 ?auto_201871 ?auto_201876 ?auto_201875 )
      ( GET-3IMAGE-VERIFY ?auto_201872 ?auto_201873 ?auto_201874 ?auto_201871 ?auto_201876 ?auto_201875 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_201894 - DIRECTION
      ?auto_201895 - MODE
      ?auto_201896 - DIRECTION
      ?auto_201893 - MODE
      ?auto_201898 - DIRECTION
      ?auto_201897 - MODE
    )
    :vars
    (
      ?auto_201899 - INSTRUMENT
      ?auto_201902 - SATELLITE
      ?auto_201900 - DIRECTION
      ?auto_201901 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_201896 ?auto_201894 ) ) ( not ( = ?auto_201898 ?auto_201894 ) ) ( not ( = ?auto_201898 ?auto_201896 ) ) ( ON_BOARD ?auto_201899 ?auto_201902 ) ( SUPPORTS ?auto_201899 ?auto_201893 ) ( not ( = ?auto_201896 ?auto_201900 ) ) ( HAVE_IMAGE ?auto_201898 ?auto_201897 ) ( not ( = ?auto_201898 ?auto_201900 ) ) ( not ( = ?auto_201897 ?auto_201893 ) ) ( CALIBRATION_TARGET ?auto_201899 ?auto_201900 ) ( POINTING ?auto_201902 ?auto_201894 ) ( not ( = ?auto_201900 ?auto_201894 ) ) ( ON_BOARD ?auto_201901 ?auto_201902 ) ( POWER_ON ?auto_201901 ) ( not ( = ?auto_201899 ?auto_201901 ) ) ( HAVE_IMAGE ?auto_201894 ?auto_201895 ) ( not ( = ?auto_201895 ?auto_201893 ) ) ( not ( = ?auto_201895 ?auto_201897 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201898 ?auto_201897 ?auto_201896 ?auto_201893 )
      ( GET-3IMAGE-VERIFY ?auto_201894 ?auto_201895 ?auto_201896 ?auto_201893 ?auto_201898 ?auto_201897 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_201939 - DIRECTION
      ?auto_201940 - MODE
      ?auto_201941 - DIRECTION
      ?auto_201938 - MODE
      ?auto_201943 - DIRECTION
      ?auto_201942 - MODE
    )
    :vars
    (
      ?auto_201944 - INSTRUMENT
      ?auto_201947 - SATELLITE
      ?auto_201945 - DIRECTION
      ?auto_201946 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_201941 ?auto_201939 ) ) ( not ( = ?auto_201943 ?auto_201939 ) ) ( not ( = ?auto_201943 ?auto_201941 ) ) ( ON_BOARD ?auto_201944 ?auto_201947 ) ( SUPPORTS ?auto_201944 ?auto_201940 ) ( not ( = ?auto_201939 ?auto_201945 ) ) ( HAVE_IMAGE ?auto_201941 ?auto_201938 ) ( not ( = ?auto_201941 ?auto_201945 ) ) ( not ( = ?auto_201938 ?auto_201940 ) ) ( CALIBRATION_TARGET ?auto_201944 ?auto_201945 ) ( POINTING ?auto_201947 ?auto_201943 ) ( not ( = ?auto_201945 ?auto_201943 ) ) ( ON_BOARD ?auto_201946 ?auto_201947 ) ( POWER_ON ?auto_201946 ) ( not ( = ?auto_201944 ?auto_201946 ) ) ( HAVE_IMAGE ?auto_201943 ?auto_201942 ) ( not ( = ?auto_201940 ?auto_201942 ) ) ( not ( = ?auto_201938 ?auto_201942 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201941 ?auto_201938 ?auto_201939 ?auto_201940 )
      ( GET-3IMAGE-VERIFY ?auto_201939 ?auto_201940 ?auto_201941 ?auto_201938 ?auto_201943 ?auto_201942 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_201960 - DIRECTION
      ?auto_201961 - MODE
      ?auto_201962 - DIRECTION
      ?auto_201959 - MODE
      ?auto_201964 - DIRECTION
      ?auto_201963 - MODE
    )
    :vars
    (
      ?auto_201965 - INSTRUMENT
      ?auto_201968 - SATELLITE
      ?auto_201966 - DIRECTION
      ?auto_201967 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_201962 ?auto_201960 ) ) ( not ( = ?auto_201964 ?auto_201960 ) ) ( not ( = ?auto_201964 ?auto_201962 ) ) ( ON_BOARD ?auto_201965 ?auto_201968 ) ( SUPPORTS ?auto_201965 ?auto_201961 ) ( not ( = ?auto_201960 ?auto_201966 ) ) ( HAVE_IMAGE ?auto_201964 ?auto_201963 ) ( not ( = ?auto_201964 ?auto_201966 ) ) ( not ( = ?auto_201963 ?auto_201961 ) ) ( CALIBRATION_TARGET ?auto_201965 ?auto_201966 ) ( POINTING ?auto_201968 ?auto_201962 ) ( not ( = ?auto_201966 ?auto_201962 ) ) ( ON_BOARD ?auto_201967 ?auto_201968 ) ( POWER_ON ?auto_201967 ) ( not ( = ?auto_201965 ?auto_201967 ) ) ( HAVE_IMAGE ?auto_201962 ?auto_201959 ) ( not ( = ?auto_201961 ?auto_201959 ) ) ( not ( = ?auto_201959 ?auto_201963 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_201964 ?auto_201963 ?auto_201960 ?auto_201961 )
      ( GET-3IMAGE-VERIFY ?auto_201960 ?auto_201961 ?auto_201962 ?auto_201959 ?auto_201964 ?auto_201963 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_203931 - DIRECTION
      ?auto_203932 - MODE
    )
    :vars
    (
      ?auto_203937 - DIRECTION
      ?auto_203935 - INSTRUMENT
      ?auto_203933 - SATELLITE
      ?auto_203939 - DIRECTION
      ?auto_203938 - MODE
      ?auto_203936 - DIRECTION
      ?auto_203934 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_203931 ?auto_203937 ) ) ( ON_BOARD ?auto_203935 ?auto_203933 ) ( SUPPORTS ?auto_203935 ?auto_203932 ) ( not ( = ?auto_203931 ?auto_203939 ) ) ( HAVE_IMAGE ?auto_203937 ?auto_203938 ) ( not ( = ?auto_203937 ?auto_203939 ) ) ( not ( = ?auto_203938 ?auto_203932 ) ) ( CALIBRATION_TARGET ?auto_203935 ?auto_203939 ) ( not ( = ?auto_203939 ?auto_203936 ) ) ( not ( = ?auto_203931 ?auto_203936 ) ) ( not ( = ?auto_203937 ?auto_203936 ) ) ( ON_BOARD ?auto_203934 ?auto_203933 ) ( POWER_ON ?auto_203934 ) ( not ( = ?auto_203935 ?auto_203934 ) ) ( POINTING ?auto_203933 ?auto_203939 ) )
    :subtasks
    ( ( !TURN_TO ?auto_203933 ?auto_203936 ?auto_203939 )
      ( GET-2IMAGE ?auto_203937 ?auto_203938 ?auto_203931 ?auto_203932 )
      ( GET-1IMAGE-VERIFY ?auto_203931 ?auto_203932 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_203941 - DIRECTION
      ?auto_203942 - MODE
      ?auto_203943 - DIRECTION
      ?auto_203940 - MODE
    )
    :vars
    (
      ?auto_203946 - INSTRUMENT
      ?auto_203945 - SATELLITE
      ?auto_203944 - DIRECTION
      ?auto_203947 - DIRECTION
      ?auto_203948 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_203943 ?auto_203941 ) ) ( ON_BOARD ?auto_203946 ?auto_203945 ) ( SUPPORTS ?auto_203946 ?auto_203940 ) ( not ( = ?auto_203943 ?auto_203944 ) ) ( HAVE_IMAGE ?auto_203941 ?auto_203942 ) ( not ( = ?auto_203941 ?auto_203944 ) ) ( not ( = ?auto_203942 ?auto_203940 ) ) ( CALIBRATION_TARGET ?auto_203946 ?auto_203944 ) ( not ( = ?auto_203944 ?auto_203947 ) ) ( not ( = ?auto_203943 ?auto_203947 ) ) ( not ( = ?auto_203941 ?auto_203947 ) ) ( ON_BOARD ?auto_203948 ?auto_203945 ) ( POWER_ON ?auto_203948 ) ( not ( = ?auto_203946 ?auto_203948 ) ) ( POINTING ?auto_203945 ?auto_203944 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_203943 ?auto_203940 )
      ( GET-2IMAGE-VERIFY ?auto_203941 ?auto_203942 ?auto_203943 ?auto_203940 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_203960 - DIRECTION
      ?auto_203961 - MODE
      ?auto_203962 - DIRECTION
      ?auto_203959 - MODE
    )
    :vars
    (
      ?auto_203963 - INSTRUMENT
      ?auto_203964 - SATELLITE
      ?auto_203965 - DIRECTION
      ?auto_203967 - DIRECTION
      ?auto_203966 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_203962 ?auto_203960 ) ) ( ON_BOARD ?auto_203963 ?auto_203964 ) ( SUPPORTS ?auto_203963 ?auto_203961 ) ( not ( = ?auto_203960 ?auto_203965 ) ) ( HAVE_IMAGE ?auto_203962 ?auto_203959 ) ( not ( = ?auto_203962 ?auto_203965 ) ) ( not ( = ?auto_203959 ?auto_203961 ) ) ( CALIBRATION_TARGET ?auto_203963 ?auto_203965 ) ( not ( = ?auto_203965 ?auto_203967 ) ) ( not ( = ?auto_203960 ?auto_203967 ) ) ( not ( = ?auto_203962 ?auto_203967 ) ) ( ON_BOARD ?auto_203966 ?auto_203964 ) ( POWER_ON ?auto_203966 ) ( not ( = ?auto_203963 ?auto_203966 ) ) ( POINTING ?auto_203964 ?auto_203965 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_203962 ?auto_203959 ?auto_203960 ?auto_203961 )
      ( GET-2IMAGE-VERIFY ?auto_203960 ?auto_203961 ?auto_203962 ?auto_203959 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_216263 - DIRECTION
      ?auto_216264 - MODE
      ?auto_216265 - DIRECTION
      ?auto_216262 - MODE
      ?auto_216267 - DIRECTION
      ?auto_216266 - MODE
      ?auto_216268 - DIRECTION
      ?auto_216269 - MODE
    )
    :vars
    (
      ?auto_216270 - INSTRUMENT
      ?auto_216271 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_216265 ?auto_216263 ) ) ( not ( = ?auto_216267 ?auto_216263 ) ) ( not ( = ?auto_216267 ?auto_216265 ) ) ( not ( = ?auto_216268 ?auto_216263 ) ) ( not ( = ?auto_216268 ?auto_216265 ) ) ( not ( = ?auto_216268 ?auto_216267 ) ) ( CALIBRATED ?auto_216270 ) ( ON_BOARD ?auto_216270 ?auto_216271 ) ( SUPPORTS ?auto_216270 ?auto_216269 ) ( POWER_ON ?auto_216270 ) ( POINTING ?auto_216271 ?auto_216268 ) ( HAVE_IMAGE ?auto_216263 ?auto_216264 ) ( HAVE_IMAGE ?auto_216265 ?auto_216262 ) ( HAVE_IMAGE ?auto_216267 ?auto_216266 ) ( not ( = ?auto_216264 ?auto_216262 ) ) ( not ( = ?auto_216264 ?auto_216266 ) ) ( not ( = ?auto_216264 ?auto_216269 ) ) ( not ( = ?auto_216262 ?auto_216266 ) ) ( not ( = ?auto_216262 ?auto_216269 ) ) ( not ( = ?auto_216266 ?auto_216269 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_216268 ?auto_216269 )
      ( GET-4IMAGE-VERIFY ?auto_216263 ?auto_216264 ?auto_216265 ?auto_216262 ?auto_216267 ?auto_216266 ?auto_216268 ?auto_216269 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_216293 - DIRECTION
      ?auto_216294 - MODE
      ?auto_216295 - DIRECTION
      ?auto_216292 - MODE
      ?auto_216297 - DIRECTION
      ?auto_216296 - MODE
      ?auto_216298 - DIRECTION
      ?auto_216299 - MODE
    )
    :vars
    (
      ?auto_216300 - INSTRUMENT
      ?auto_216301 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_216295 ?auto_216293 ) ) ( not ( = ?auto_216297 ?auto_216293 ) ) ( not ( = ?auto_216297 ?auto_216295 ) ) ( not ( = ?auto_216298 ?auto_216293 ) ) ( not ( = ?auto_216298 ?auto_216295 ) ) ( not ( = ?auto_216298 ?auto_216297 ) ) ( CALIBRATED ?auto_216300 ) ( ON_BOARD ?auto_216300 ?auto_216301 ) ( SUPPORTS ?auto_216300 ?auto_216296 ) ( POWER_ON ?auto_216300 ) ( POINTING ?auto_216301 ?auto_216297 ) ( HAVE_IMAGE ?auto_216293 ?auto_216294 ) ( HAVE_IMAGE ?auto_216295 ?auto_216292 ) ( HAVE_IMAGE ?auto_216298 ?auto_216299 ) ( not ( = ?auto_216294 ?auto_216292 ) ) ( not ( = ?auto_216294 ?auto_216296 ) ) ( not ( = ?auto_216294 ?auto_216299 ) ) ( not ( = ?auto_216292 ?auto_216296 ) ) ( not ( = ?auto_216292 ?auto_216299 ) ) ( not ( = ?auto_216296 ?auto_216299 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_216297 ?auto_216296 )
      ( GET-4IMAGE-VERIFY ?auto_216293 ?auto_216294 ?auto_216295 ?auto_216292 ?auto_216297 ?auto_216296 ?auto_216298 ?auto_216299 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_216439 - DIRECTION
      ?auto_216440 - MODE
      ?auto_216441 - DIRECTION
      ?auto_216438 - MODE
      ?auto_216443 - DIRECTION
      ?auto_216442 - MODE
      ?auto_216444 - DIRECTION
      ?auto_216445 - MODE
    )
    :vars
    (
      ?auto_216446 - INSTRUMENT
      ?auto_216447 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_216441 ?auto_216439 ) ) ( not ( = ?auto_216443 ?auto_216439 ) ) ( not ( = ?auto_216443 ?auto_216441 ) ) ( not ( = ?auto_216444 ?auto_216439 ) ) ( not ( = ?auto_216444 ?auto_216441 ) ) ( not ( = ?auto_216444 ?auto_216443 ) ) ( CALIBRATED ?auto_216446 ) ( ON_BOARD ?auto_216446 ?auto_216447 ) ( SUPPORTS ?auto_216446 ?auto_216438 ) ( POWER_ON ?auto_216446 ) ( POINTING ?auto_216447 ?auto_216441 ) ( HAVE_IMAGE ?auto_216439 ?auto_216440 ) ( HAVE_IMAGE ?auto_216443 ?auto_216442 ) ( HAVE_IMAGE ?auto_216444 ?auto_216445 ) ( not ( = ?auto_216440 ?auto_216438 ) ) ( not ( = ?auto_216440 ?auto_216442 ) ) ( not ( = ?auto_216440 ?auto_216445 ) ) ( not ( = ?auto_216438 ?auto_216442 ) ) ( not ( = ?auto_216438 ?auto_216445 ) ) ( not ( = ?auto_216442 ?auto_216445 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_216441 ?auto_216438 )
      ( GET-4IMAGE-VERIFY ?auto_216439 ?auto_216440 ?auto_216441 ?auto_216438 ?auto_216443 ?auto_216442 ?auto_216444 ?auto_216445 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_217313 - DIRECTION
      ?auto_217314 - MODE
      ?auto_217315 - DIRECTION
      ?auto_217312 - MODE
      ?auto_217317 - DIRECTION
      ?auto_217316 - MODE
      ?auto_217318 - DIRECTION
      ?auto_217319 - MODE
    )
    :vars
    (
      ?auto_217320 - INSTRUMENT
      ?auto_217321 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_217315 ?auto_217313 ) ) ( not ( = ?auto_217317 ?auto_217313 ) ) ( not ( = ?auto_217317 ?auto_217315 ) ) ( not ( = ?auto_217318 ?auto_217313 ) ) ( not ( = ?auto_217318 ?auto_217315 ) ) ( not ( = ?auto_217318 ?auto_217317 ) ) ( CALIBRATED ?auto_217320 ) ( ON_BOARD ?auto_217320 ?auto_217321 ) ( SUPPORTS ?auto_217320 ?auto_217314 ) ( POWER_ON ?auto_217320 ) ( POINTING ?auto_217321 ?auto_217313 ) ( HAVE_IMAGE ?auto_217315 ?auto_217312 ) ( HAVE_IMAGE ?auto_217317 ?auto_217316 ) ( HAVE_IMAGE ?auto_217318 ?auto_217319 ) ( not ( = ?auto_217314 ?auto_217312 ) ) ( not ( = ?auto_217314 ?auto_217316 ) ) ( not ( = ?auto_217314 ?auto_217319 ) ) ( not ( = ?auto_217312 ?auto_217316 ) ) ( not ( = ?auto_217312 ?auto_217319 ) ) ( not ( = ?auto_217316 ?auto_217319 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_217313 ?auto_217314 )
      ( GET-4IMAGE-VERIFY ?auto_217313 ?auto_217314 ?auto_217315 ?auto_217312 ?auto_217317 ?auto_217316 ?auto_217318 ?auto_217319 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_218340 - DIRECTION
      ?auto_218341 - MODE
      ?auto_218342 - DIRECTION
      ?auto_218339 - MODE
      ?auto_218344 - DIRECTION
      ?auto_218343 - MODE
      ?auto_218345 - DIRECTION
      ?auto_218346 - MODE
    )
    :vars
    (
      ?auto_218347 - INSTRUMENT
      ?auto_218348 - SATELLITE
      ?auto_218349 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_218342 ?auto_218340 ) ) ( not ( = ?auto_218344 ?auto_218340 ) ) ( not ( = ?auto_218344 ?auto_218342 ) ) ( not ( = ?auto_218345 ?auto_218340 ) ) ( not ( = ?auto_218345 ?auto_218342 ) ) ( not ( = ?auto_218345 ?auto_218344 ) ) ( CALIBRATED ?auto_218347 ) ( ON_BOARD ?auto_218347 ?auto_218348 ) ( SUPPORTS ?auto_218347 ?auto_218346 ) ( POWER_ON ?auto_218347 ) ( POINTING ?auto_218348 ?auto_218349 ) ( not ( = ?auto_218345 ?auto_218349 ) ) ( HAVE_IMAGE ?auto_218340 ?auto_218341 ) ( not ( = ?auto_218340 ?auto_218349 ) ) ( not ( = ?auto_218341 ?auto_218346 ) ) ( HAVE_IMAGE ?auto_218342 ?auto_218339 ) ( HAVE_IMAGE ?auto_218344 ?auto_218343 ) ( not ( = ?auto_218341 ?auto_218339 ) ) ( not ( = ?auto_218341 ?auto_218343 ) ) ( not ( = ?auto_218342 ?auto_218349 ) ) ( not ( = ?auto_218339 ?auto_218343 ) ) ( not ( = ?auto_218339 ?auto_218346 ) ) ( not ( = ?auto_218344 ?auto_218349 ) ) ( not ( = ?auto_218343 ?auto_218346 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_218340 ?auto_218341 ?auto_218345 ?auto_218346 )
      ( GET-4IMAGE-VERIFY ?auto_218340 ?auto_218341 ?auto_218342 ?auto_218339 ?auto_218344 ?auto_218343 ?auto_218345 ?auto_218346 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_218373 - DIRECTION
      ?auto_218374 - MODE
      ?auto_218375 - DIRECTION
      ?auto_218372 - MODE
      ?auto_218377 - DIRECTION
      ?auto_218376 - MODE
      ?auto_218378 - DIRECTION
      ?auto_218379 - MODE
    )
    :vars
    (
      ?auto_218380 - INSTRUMENT
      ?auto_218381 - SATELLITE
      ?auto_218382 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_218375 ?auto_218373 ) ) ( not ( = ?auto_218377 ?auto_218373 ) ) ( not ( = ?auto_218377 ?auto_218375 ) ) ( not ( = ?auto_218378 ?auto_218373 ) ) ( not ( = ?auto_218378 ?auto_218375 ) ) ( not ( = ?auto_218378 ?auto_218377 ) ) ( CALIBRATED ?auto_218380 ) ( ON_BOARD ?auto_218380 ?auto_218381 ) ( SUPPORTS ?auto_218380 ?auto_218376 ) ( POWER_ON ?auto_218380 ) ( POINTING ?auto_218381 ?auto_218382 ) ( not ( = ?auto_218377 ?auto_218382 ) ) ( HAVE_IMAGE ?auto_218373 ?auto_218374 ) ( not ( = ?auto_218373 ?auto_218382 ) ) ( not ( = ?auto_218374 ?auto_218376 ) ) ( HAVE_IMAGE ?auto_218375 ?auto_218372 ) ( HAVE_IMAGE ?auto_218378 ?auto_218379 ) ( not ( = ?auto_218374 ?auto_218372 ) ) ( not ( = ?auto_218374 ?auto_218379 ) ) ( not ( = ?auto_218375 ?auto_218382 ) ) ( not ( = ?auto_218372 ?auto_218376 ) ) ( not ( = ?auto_218372 ?auto_218379 ) ) ( not ( = ?auto_218376 ?auto_218379 ) ) ( not ( = ?auto_218378 ?auto_218382 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_218373 ?auto_218374 ?auto_218377 ?auto_218376 )
      ( GET-4IMAGE-VERIFY ?auto_218373 ?auto_218374 ?auto_218375 ?auto_218372 ?auto_218377 ?auto_218376 ?auto_218378 ?auto_218379 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_218532 - DIRECTION
      ?auto_218533 - MODE
      ?auto_218534 - DIRECTION
      ?auto_218531 - MODE
      ?auto_218536 - DIRECTION
      ?auto_218535 - MODE
      ?auto_218537 - DIRECTION
      ?auto_218538 - MODE
    )
    :vars
    (
      ?auto_218539 - INSTRUMENT
      ?auto_218540 - SATELLITE
      ?auto_218541 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_218534 ?auto_218532 ) ) ( not ( = ?auto_218536 ?auto_218532 ) ) ( not ( = ?auto_218536 ?auto_218534 ) ) ( not ( = ?auto_218537 ?auto_218532 ) ) ( not ( = ?auto_218537 ?auto_218534 ) ) ( not ( = ?auto_218537 ?auto_218536 ) ) ( CALIBRATED ?auto_218539 ) ( ON_BOARD ?auto_218539 ?auto_218540 ) ( SUPPORTS ?auto_218539 ?auto_218531 ) ( POWER_ON ?auto_218539 ) ( POINTING ?auto_218540 ?auto_218541 ) ( not ( = ?auto_218534 ?auto_218541 ) ) ( HAVE_IMAGE ?auto_218532 ?auto_218533 ) ( not ( = ?auto_218532 ?auto_218541 ) ) ( not ( = ?auto_218533 ?auto_218531 ) ) ( HAVE_IMAGE ?auto_218536 ?auto_218535 ) ( HAVE_IMAGE ?auto_218537 ?auto_218538 ) ( not ( = ?auto_218533 ?auto_218535 ) ) ( not ( = ?auto_218533 ?auto_218538 ) ) ( not ( = ?auto_218531 ?auto_218535 ) ) ( not ( = ?auto_218531 ?auto_218538 ) ) ( not ( = ?auto_218536 ?auto_218541 ) ) ( not ( = ?auto_218535 ?auto_218538 ) ) ( not ( = ?auto_218537 ?auto_218541 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_218532 ?auto_218533 ?auto_218534 ?auto_218531 )
      ( GET-4IMAGE-VERIFY ?auto_218532 ?auto_218533 ?auto_218534 ?auto_218531 ?auto_218536 ?auto_218535 ?auto_218537 ?auto_218538 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_219559 - DIRECTION
      ?auto_219560 - MODE
      ?auto_219561 - DIRECTION
      ?auto_219558 - MODE
      ?auto_219563 - DIRECTION
      ?auto_219562 - MODE
      ?auto_219564 - DIRECTION
      ?auto_219565 - MODE
    )
    :vars
    (
      ?auto_219566 - INSTRUMENT
      ?auto_219567 - SATELLITE
      ?auto_219568 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_219561 ?auto_219559 ) ) ( not ( = ?auto_219563 ?auto_219559 ) ) ( not ( = ?auto_219563 ?auto_219561 ) ) ( not ( = ?auto_219564 ?auto_219559 ) ) ( not ( = ?auto_219564 ?auto_219561 ) ) ( not ( = ?auto_219564 ?auto_219563 ) ) ( CALIBRATED ?auto_219566 ) ( ON_BOARD ?auto_219566 ?auto_219567 ) ( SUPPORTS ?auto_219566 ?auto_219560 ) ( POWER_ON ?auto_219566 ) ( POINTING ?auto_219567 ?auto_219568 ) ( not ( = ?auto_219559 ?auto_219568 ) ) ( HAVE_IMAGE ?auto_219561 ?auto_219558 ) ( not ( = ?auto_219561 ?auto_219568 ) ) ( not ( = ?auto_219558 ?auto_219560 ) ) ( HAVE_IMAGE ?auto_219563 ?auto_219562 ) ( HAVE_IMAGE ?auto_219564 ?auto_219565 ) ( not ( = ?auto_219560 ?auto_219562 ) ) ( not ( = ?auto_219560 ?auto_219565 ) ) ( not ( = ?auto_219558 ?auto_219562 ) ) ( not ( = ?auto_219558 ?auto_219565 ) ) ( not ( = ?auto_219563 ?auto_219568 ) ) ( not ( = ?auto_219562 ?auto_219565 ) ) ( not ( = ?auto_219564 ?auto_219568 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_219561 ?auto_219558 ?auto_219559 ?auto_219560 )
      ( GET-4IMAGE-VERIFY ?auto_219559 ?auto_219560 ?auto_219561 ?auto_219558 ?auto_219563 ?auto_219562 ?auto_219564 ?auto_219565 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_220695 - DIRECTION
      ?auto_220696 - MODE
      ?auto_220697 - DIRECTION
      ?auto_220694 - MODE
      ?auto_220699 - DIRECTION
      ?auto_220698 - MODE
      ?auto_220700 - DIRECTION
      ?auto_220701 - MODE
    )
    :vars
    (
      ?auto_220703 - INSTRUMENT
      ?auto_220704 - SATELLITE
      ?auto_220702 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_220697 ?auto_220695 ) ) ( not ( = ?auto_220699 ?auto_220695 ) ) ( not ( = ?auto_220699 ?auto_220697 ) ) ( not ( = ?auto_220700 ?auto_220695 ) ) ( not ( = ?auto_220700 ?auto_220697 ) ) ( not ( = ?auto_220700 ?auto_220699 ) ) ( ON_BOARD ?auto_220703 ?auto_220704 ) ( SUPPORTS ?auto_220703 ?auto_220701 ) ( POWER_ON ?auto_220703 ) ( POINTING ?auto_220704 ?auto_220702 ) ( not ( = ?auto_220700 ?auto_220702 ) ) ( HAVE_IMAGE ?auto_220695 ?auto_220696 ) ( not ( = ?auto_220695 ?auto_220702 ) ) ( not ( = ?auto_220696 ?auto_220701 ) ) ( CALIBRATION_TARGET ?auto_220703 ?auto_220702 ) ( NOT_CALIBRATED ?auto_220703 ) ( HAVE_IMAGE ?auto_220697 ?auto_220694 ) ( HAVE_IMAGE ?auto_220699 ?auto_220698 ) ( not ( = ?auto_220696 ?auto_220694 ) ) ( not ( = ?auto_220696 ?auto_220698 ) ) ( not ( = ?auto_220697 ?auto_220702 ) ) ( not ( = ?auto_220694 ?auto_220698 ) ) ( not ( = ?auto_220694 ?auto_220701 ) ) ( not ( = ?auto_220699 ?auto_220702 ) ) ( not ( = ?auto_220698 ?auto_220701 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_220695 ?auto_220696 ?auto_220700 ?auto_220701 )
      ( GET-4IMAGE-VERIFY ?auto_220695 ?auto_220696 ?auto_220697 ?auto_220694 ?auto_220699 ?auto_220698 ?auto_220700 ?auto_220701 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_220728 - DIRECTION
      ?auto_220729 - MODE
      ?auto_220730 - DIRECTION
      ?auto_220727 - MODE
      ?auto_220732 - DIRECTION
      ?auto_220731 - MODE
      ?auto_220733 - DIRECTION
      ?auto_220734 - MODE
    )
    :vars
    (
      ?auto_220736 - INSTRUMENT
      ?auto_220737 - SATELLITE
      ?auto_220735 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_220730 ?auto_220728 ) ) ( not ( = ?auto_220732 ?auto_220728 ) ) ( not ( = ?auto_220732 ?auto_220730 ) ) ( not ( = ?auto_220733 ?auto_220728 ) ) ( not ( = ?auto_220733 ?auto_220730 ) ) ( not ( = ?auto_220733 ?auto_220732 ) ) ( ON_BOARD ?auto_220736 ?auto_220737 ) ( SUPPORTS ?auto_220736 ?auto_220731 ) ( POWER_ON ?auto_220736 ) ( POINTING ?auto_220737 ?auto_220735 ) ( not ( = ?auto_220732 ?auto_220735 ) ) ( HAVE_IMAGE ?auto_220728 ?auto_220729 ) ( not ( = ?auto_220728 ?auto_220735 ) ) ( not ( = ?auto_220729 ?auto_220731 ) ) ( CALIBRATION_TARGET ?auto_220736 ?auto_220735 ) ( NOT_CALIBRATED ?auto_220736 ) ( HAVE_IMAGE ?auto_220730 ?auto_220727 ) ( HAVE_IMAGE ?auto_220733 ?auto_220734 ) ( not ( = ?auto_220729 ?auto_220727 ) ) ( not ( = ?auto_220729 ?auto_220734 ) ) ( not ( = ?auto_220730 ?auto_220735 ) ) ( not ( = ?auto_220727 ?auto_220731 ) ) ( not ( = ?auto_220727 ?auto_220734 ) ) ( not ( = ?auto_220731 ?auto_220734 ) ) ( not ( = ?auto_220733 ?auto_220735 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_220728 ?auto_220729 ?auto_220732 ?auto_220731 )
      ( GET-4IMAGE-VERIFY ?auto_220728 ?auto_220729 ?auto_220730 ?auto_220727 ?auto_220732 ?auto_220731 ?auto_220733 ?auto_220734 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_220887 - DIRECTION
      ?auto_220888 - MODE
      ?auto_220889 - DIRECTION
      ?auto_220886 - MODE
      ?auto_220891 - DIRECTION
      ?auto_220890 - MODE
      ?auto_220892 - DIRECTION
      ?auto_220893 - MODE
    )
    :vars
    (
      ?auto_220895 - INSTRUMENT
      ?auto_220896 - SATELLITE
      ?auto_220894 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_220889 ?auto_220887 ) ) ( not ( = ?auto_220891 ?auto_220887 ) ) ( not ( = ?auto_220891 ?auto_220889 ) ) ( not ( = ?auto_220892 ?auto_220887 ) ) ( not ( = ?auto_220892 ?auto_220889 ) ) ( not ( = ?auto_220892 ?auto_220891 ) ) ( ON_BOARD ?auto_220895 ?auto_220896 ) ( SUPPORTS ?auto_220895 ?auto_220886 ) ( POWER_ON ?auto_220895 ) ( POINTING ?auto_220896 ?auto_220894 ) ( not ( = ?auto_220889 ?auto_220894 ) ) ( HAVE_IMAGE ?auto_220887 ?auto_220888 ) ( not ( = ?auto_220887 ?auto_220894 ) ) ( not ( = ?auto_220888 ?auto_220886 ) ) ( CALIBRATION_TARGET ?auto_220895 ?auto_220894 ) ( NOT_CALIBRATED ?auto_220895 ) ( HAVE_IMAGE ?auto_220891 ?auto_220890 ) ( HAVE_IMAGE ?auto_220892 ?auto_220893 ) ( not ( = ?auto_220888 ?auto_220890 ) ) ( not ( = ?auto_220888 ?auto_220893 ) ) ( not ( = ?auto_220886 ?auto_220890 ) ) ( not ( = ?auto_220886 ?auto_220893 ) ) ( not ( = ?auto_220891 ?auto_220894 ) ) ( not ( = ?auto_220890 ?auto_220893 ) ) ( not ( = ?auto_220892 ?auto_220894 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_220887 ?auto_220888 ?auto_220889 ?auto_220886 )
      ( GET-4IMAGE-VERIFY ?auto_220887 ?auto_220888 ?auto_220889 ?auto_220886 ?auto_220891 ?auto_220890 ?auto_220892 ?auto_220893 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_221914 - DIRECTION
      ?auto_221915 - MODE
      ?auto_221916 - DIRECTION
      ?auto_221913 - MODE
      ?auto_221918 - DIRECTION
      ?auto_221917 - MODE
      ?auto_221919 - DIRECTION
      ?auto_221920 - MODE
    )
    :vars
    (
      ?auto_221922 - INSTRUMENT
      ?auto_221923 - SATELLITE
      ?auto_221921 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_221916 ?auto_221914 ) ) ( not ( = ?auto_221918 ?auto_221914 ) ) ( not ( = ?auto_221918 ?auto_221916 ) ) ( not ( = ?auto_221919 ?auto_221914 ) ) ( not ( = ?auto_221919 ?auto_221916 ) ) ( not ( = ?auto_221919 ?auto_221918 ) ) ( ON_BOARD ?auto_221922 ?auto_221923 ) ( SUPPORTS ?auto_221922 ?auto_221915 ) ( POWER_ON ?auto_221922 ) ( POINTING ?auto_221923 ?auto_221921 ) ( not ( = ?auto_221914 ?auto_221921 ) ) ( HAVE_IMAGE ?auto_221916 ?auto_221913 ) ( not ( = ?auto_221916 ?auto_221921 ) ) ( not ( = ?auto_221913 ?auto_221915 ) ) ( CALIBRATION_TARGET ?auto_221922 ?auto_221921 ) ( NOT_CALIBRATED ?auto_221922 ) ( HAVE_IMAGE ?auto_221918 ?auto_221917 ) ( HAVE_IMAGE ?auto_221919 ?auto_221920 ) ( not ( = ?auto_221915 ?auto_221917 ) ) ( not ( = ?auto_221915 ?auto_221920 ) ) ( not ( = ?auto_221913 ?auto_221917 ) ) ( not ( = ?auto_221913 ?auto_221920 ) ) ( not ( = ?auto_221918 ?auto_221921 ) ) ( not ( = ?auto_221917 ?auto_221920 ) ) ( not ( = ?auto_221919 ?auto_221921 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_221916 ?auto_221913 ?auto_221914 ?auto_221915 )
      ( GET-4IMAGE-VERIFY ?auto_221914 ?auto_221915 ?auto_221916 ?auto_221913 ?auto_221918 ?auto_221917 ?auto_221919 ?auto_221920 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_223050 - DIRECTION
      ?auto_223051 - MODE
      ?auto_223052 - DIRECTION
      ?auto_223049 - MODE
      ?auto_223054 - DIRECTION
      ?auto_223053 - MODE
      ?auto_223055 - DIRECTION
      ?auto_223056 - MODE
    )
    :vars
    (
      ?auto_223058 - INSTRUMENT
      ?auto_223059 - SATELLITE
      ?auto_223057 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_223052 ?auto_223050 ) ) ( not ( = ?auto_223054 ?auto_223050 ) ) ( not ( = ?auto_223054 ?auto_223052 ) ) ( not ( = ?auto_223055 ?auto_223050 ) ) ( not ( = ?auto_223055 ?auto_223052 ) ) ( not ( = ?auto_223055 ?auto_223054 ) ) ( ON_BOARD ?auto_223058 ?auto_223059 ) ( SUPPORTS ?auto_223058 ?auto_223056 ) ( POINTING ?auto_223059 ?auto_223057 ) ( not ( = ?auto_223055 ?auto_223057 ) ) ( HAVE_IMAGE ?auto_223050 ?auto_223051 ) ( not ( = ?auto_223050 ?auto_223057 ) ) ( not ( = ?auto_223051 ?auto_223056 ) ) ( CALIBRATION_TARGET ?auto_223058 ?auto_223057 ) ( POWER_AVAIL ?auto_223059 ) ( HAVE_IMAGE ?auto_223052 ?auto_223049 ) ( HAVE_IMAGE ?auto_223054 ?auto_223053 ) ( not ( = ?auto_223051 ?auto_223049 ) ) ( not ( = ?auto_223051 ?auto_223053 ) ) ( not ( = ?auto_223052 ?auto_223057 ) ) ( not ( = ?auto_223049 ?auto_223053 ) ) ( not ( = ?auto_223049 ?auto_223056 ) ) ( not ( = ?auto_223054 ?auto_223057 ) ) ( not ( = ?auto_223053 ?auto_223056 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_223050 ?auto_223051 ?auto_223055 ?auto_223056 )
      ( GET-4IMAGE-VERIFY ?auto_223050 ?auto_223051 ?auto_223052 ?auto_223049 ?auto_223054 ?auto_223053 ?auto_223055 ?auto_223056 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_223083 - DIRECTION
      ?auto_223084 - MODE
      ?auto_223085 - DIRECTION
      ?auto_223082 - MODE
      ?auto_223087 - DIRECTION
      ?auto_223086 - MODE
      ?auto_223088 - DIRECTION
      ?auto_223089 - MODE
    )
    :vars
    (
      ?auto_223091 - INSTRUMENT
      ?auto_223092 - SATELLITE
      ?auto_223090 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_223085 ?auto_223083 ) ) ( not ( = ?auto_223087 ?auto_223083 ) ) ( not ( = ?auto_223087 ?auto_223085 ) ) ( not ( = ?auto_223088 ?auto_223083 ) ) ( not ( = ?auto_223088 ?auto_223085 ) ) ( not ( = ?auto_223088 ?auto_223087 ) ) ( ON_BOARD ?auto_223091 ?auto_223092 ) ( SUPPORTS ?auto_223091 ?auto_223086 ) ( POINTING ?auto_223092 ?auto_223090 ) ( not ( = ?auto_223087 ?auto_223090 ) ) ( HAVE_IMAGE ?auto_223083 ?auto_223084 ) ( not ( = ?auto_223083 ?auto_223090 ) ) ( not ( = ?auto_223084 ?auto_223086 ) ) ( CALIBRATION_TARGET ?auto_223091 ?auto_223090 ) ( POWER_AVAIL ?auto_223092 ) ( HAVE_IMAGE ?auto_223085 ?auto_223082 ) ( HAVE_IMAGE ?auto_223088 ?auto_223089 ) ( not ( = ?auto_223084 ?auto_223082 ) ) ( not ( = ?auto_223084 ?auto_223089 ) ) ( not ( = ?auto_223085 ?auto_223090 ) ) ( not ( = ?auto_223082 ?auto_223086 ) ) ( not ( = ?auto_223082 ?auto_223089 ) ) ( not ( = ?auto_223086 ?auto_223089 ) ) ( not ( = ?auto_223088 ?auto_223090 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_223083 ?auto_223084 ?auto_223087 ?auto_223086 )
      ( GET-4IMAGE-VERIFY ?auto_223083 ?auto_223084 ?auto_223085 ?auto_223082 ?auto_223087 ?auto_223086 ?auto_223088 ?auto_223089 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_223242 - DIRECTION
      ?auto_223243 - MODE
      ?auto_223244 - DIRECTION
      ?auto_223241 - MODE
      ?auto_223246 - DIRECTION
      ?auto_223245 - MODE
      ?auto_223247 - DIRECTION
      ?auto_223248 - MODE
    )
    :vars
    (
      ?auto_223250 - INSTRUMENT
      ?auto_223251 - SATELLITE
      ?auto_223249 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_223244 ?auto_223242 ) ) ( not ( = ?auto_223246 ?auto_223242 ) ) ( not ( = ?auto_223246 ?auto_223244 ) ) ( not ( = ?auto_223247 ?auto_223242 ) ) ( not ( = ?auto_223247 ?auto_223244 ) ) ( not ( = ?auto_223247 ?auto_223246 ) ) ( ON_BOARD ?auto_223250 ?auto_223251 ) ( SUPPORTS ?auto_223250 ?auto_223241 ) ( POINTING ?auto_223251 ?auto_223249 ) ( not ( = ?auto_223244 ?auto_223249 ) ) ( HAVE_IMAGE ?auto_223242 ?auto_223243 ) ( not ( = ?auto_223242 ?auto_223249 ) ) ( not ( = ?auto_223243 ?auto_223241 ) ) ( CALIBRATION_TARGET ?auto_223250 ?auto_223249 ) ( POWER_AVAIL ?auto_223251 ) ( HAVE_IMAGE ?auto_223246 ?auto_223245 ) ( HAVE_IMAGE ?auto_223247 ?auto_223248 ) ( not ( = ?auto_223243 ?auto_223245 ) ) ( not ( = ?auto_223243 ?auto_223248 ) ) ( not ( = ?auto_223241 ?auto_223245 ) ) ( not ( = ?auto_223241 ?auto_223248 ) ) ( not ( = ?auto_223246 ?auto_223249 ) ) ( not ( = ?auto_223245 ?auto_223248 ) ) ( not ( = ?auto_223247 ?auto_223249 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_223242 ?auto_223243 ?auto_223244 ?auto_223241 )
      ( GET-4IMAGE-VERIFY ?auto_223242 ?auto_223243 ?auto_223244 ?auto_223241 ?auto_223246 ?auto_223245 ?auto_223247 ?auto_223248 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_224269 - DIRECTION
      ?auto_224270 - MODE
      ?auto_224271 - DIRECTION
      ?auto_224268 - MODE
      ?auto_224273 - DIRECTION
      ?auto_224272 - MODE
      ?auto_224274 - DIRECTION
      ?auto_224275 - MODE
    )
    :vars
    (
      ?auto_224277 - INSTRUMENT
      ?auto_224278 - SATELLITE
      ?auto_224276 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_224271 ?auto_224269 ) ) ( not ( = ?auto_224273 ?auto_224269 ) ) ( not ( = ?auto_224273 ?auto_224271 ) ) ( not ( = ?auto_224274 ?auto_224269 ) ) ( not ( = ?auto_224274 ?auto_224271 ) ) ( not ( = ?auto_224274 ?auto_224273 ) ) ( ON_BOARD ?auto_224277 ?auto_224278 ) ( SUPPORTS ?auto_224277 ?auto_224270 ) ( POINTING ?auto_224278 ?auto_224276 ) ( not ( = ?auto_224269 ?auto_224276 ) ) ( HAVE_IMAGE ?auto_224271 ?auto_224268 ) ( not ( = ?auto_224271 ?auto_224276 ) ) ( not ( = ?auto_224268 ?auto_224270 ) ) ( CALIBRATION_TARGET ?auto_224277 ?auto_224276 ) ( POWER_AVAIL ?auto_224278 ) ( HAVE_IMAGE ?auto_224273 ?auto_224272 ) ( HAVE_IMAGE ?auto_224274 ?auto_224275 ) ( not ( = ?auto_224270 ?auto_224272 ) ) ( not ( = ?auto_224270 ?auto_224275 ) ) ( not ( = ?auto_224268 ?auto_224272 ) ) ( not ( = ?auto_224268 ?auto_224275 ) ) ( not ( = ?auto_224273 ?auto_224276 ) ) ( not ( = ?auto_224272 ?auto_224275 ) ) ( not ( = ?auto_224274 ?auto_224276 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_224271 ?auto_224268 ?auto_224269 ?auto_224270 )
      ( GET-4IMAGE-VERIFY ?auto_224269 ?auto_224270 ?auto_224271 ?auto_224268 ?auto_224273 ?auto_224272 ?auto_224274 ?auto_224275 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_225016 - DIRECTION
      ?auto_225017 - MODE
      ?auto_225018 - DIRECTION
      ?auto_225015 - MODE
      ?auto_225020 - DIRECTION
      ?auto_225019 - MODE
    )
    :vars
    (
      ?auto_225022 - INSTRUMENT
      ?auto_225021 - SATELLITE
      ?auto_225024 - DIRECTION
      ?auto_225023 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_225018 ?auto_225016 ) ) ( not ( = ?auto_225020 ?auto_225016 ) ) ( not ( = ?auto_225020 ?auto_225018 ) ) ( ON_BOARD ?auto_225022 ?auto_225021 ) ( SUPPORTS ?auto_225022 ?auto_225019 ) ( not ( = ?auto_225020 ?auto_225024 ) ) ( HAVE_IMAGE ?auto_225016 ?auto_225017 ) ( not ( = ?auto_225016 ?auto_225024 ) ) ( not ( = ?auto_225017 ?auto_225019 ) ) ( CALIBRATION_TARGET ?auto_225022 ?auto_225024 ) ( POWER_AVAIL ?auto_225021 ) ( POINTING ?auto_225021 ?auto_225023 ) ( not ( = ?auto_225024 ?auto_225023 ) ) ( not ( = ?auto_225020 ?auto_225023 ) ) ( not ( = ?auto_225016 ?auto_225023 ) ) ( HAVE_IMAGE ?auto_225018 ?auto_225015 ) ( not ( = ?auto_225017 ?auto_225015 ) ) ( not ( = ?auto_225018 ?auto_225024 ) ) ( not ( = ?auto_225018 ?auto_225023 ) ) ( not ( = ?auto_225015 ?auto_225019 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225016 ?auto_225017 ?auto_225020 ?auto_225019 )
      ( GET-3IMAGE-VERIFY ?auto_225016 ?auto_225017 ?auto_225018 ?auto_225015 ?auto_225020 ?auto_225019 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_225045 - DIRECTION
      ?auto_225046 - MODE
      ?auto_225047 - DIRECTION
      ?auto_225044 - MODE
      ?auto_225049 - DIRECTION
      ?auto_225048 - MODE
    )
    :vars
    (
      ?auto_225051 - INSTRUMENT
      ?auto_225050 - SATELLITE
      ?auto_225053 - DIRECTION
      ?auto_225052 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_225047 ?auto_225045 ) ) ( not ( = ?auto_225049 ?auto_225045 ) ) ( not ( = ?auto_225049 ?auto_225047 ) ) ( ON_BOARD ?auto_225051 ?auto_225050 ) ( SUPPORTS ?auto_225051 ?auto_225044 ) ( not ( = ?auto_225047 ?auto_225053 ) ) ( HAVE_IMAGE ?auto_225045 ?auto_225046 ) ( not ( = ?auto_225045 ?auto_225053 ) ) ( not ( = ?auto_225046 ?auto_225044 ) ) ( CALIBRATION_TARGET ?auto_225051 ?auto_225053 ) ( POWER_AVAIL ?auto_225050 ) ( POINTING ?auto_225050 ?auto_225052 ) ( not ( = ?auto_225053 ?auto_225052 ) ) ( not ( = ?auto_225047 ?auto_225052 ) ) ( not ( = ?auto_225045 ?auto_225052 ) ) ( HAVE_IMAGE ?auto_225049 ?auto_225048 ) ( not ( = ?auto_225046 ?auto_225048 ) ) ( not ( = ?auto_225044 ?auto_225048 ) ) ( not ( = ?auto_225049 ?auto_225053 ) ) ( not ( = ?auto_225049 ?auto_225052 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225045 ?auto_225046 ?auto_225047 ?auto_225044 )
      ( GET-3IMAGE-VERIFY ?auto_225045 ?auto_225046 ?auto_225047 ?auto_225044 ?auto_225049 ?auto_225048 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_225207 - DIRECTION
      ?auto_225208 - MODE
      ?auto_225209 - DIRECTION
      ?auto_225206 - MODE
      ?auto_225211 - DIRECTION
      ?auto_225210 - MODE
    )
    :vars
    (
      ?auto_225213 - INSTRUMENT
      ?auto_225212 - SATELLITE
      ?auto_225215 - DIRECTION
      ?auto_225214 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_225209 ?auto_225207 ) ) ( not ( = ?auto_225211 ?auto_225207 ) ) ( not ( = ?auto_225211 ?auto_225209 ) ) ( ON_BOARD ?auto_225213 ?auto_225212 ) ( SUPPORTS ?auto_225213 ?auto_225208 ) ( not ( = ?auto_225207 ?auto_225215 ) ) ( HAVE_IMAGE ?auto_225209 ?auto_225206 ) ( not ( = ?auto_225209 ?auto_225215 ) ) ( not ( = ?auto_225206 ?auto_225208 ) ) ( CALIBRATION_TARGET ?auto_225213 ?auto_225215 ) ( POWER_AVAIL ?auto_225212 ) ( POINTING ?auto_225212 ?auto_225214 ) ( not ( = ?auto_225215 ?auto_225214 ) ) ( not ( = ?auto_225207 ?auto_225214 ) ) ( not ( = ?auto_225209 ?auto_225214 ) ) ( HAVE_IMAGE ?auto_225211 ?auto_225210 ) ( not ( = ?auto_225208 ?auto_225210 ) ) ( not ( = ?auto_225206 ?auto_225210 ) ) ( not ( = ?auto_225211 ?auto_225215 ) ) ( not ( = ?auto_225211 ?auto_225214 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225209 ?auto_225206 ?auto_225207 ?auto_225208 )
      ( GET-3IMAGE-VERIFY ?auto_225207 ?auto_225208 ?auto_225209 ?auto_225206 ?auto_225211 ?auto_225210 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_225460 - DIRECTION
      ?auto_225461 - MODE
      ?auto_225462 - DIRECTION
      ?auto_225459 - MODE
      ?auto_225464 - DIRECTION
      ?auto_225463 - MODE
      ?auto_225465 - DIRECTION
      ?auto_225466 - MODE
    )
    :vars
    (
      ?auto_225468 - INSTRUMENT
      ?auto_225467 - SATELLITE
      ?auto_225469 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_225462 ?auto_225460 ) ) ( not ( = ?auto_225464 ?auto_225460 ) ) ( not ( = ?auto_225464 ?auto_225462 ) ) ( not ( = ?auto_225465 ?auto_225460 ) ) ( not ( = ?auto_225465 ?auto_225462 ) ) ( not ( = ?auto_225465 ?auto_225464 ) ) ( ON_BOARD ?auto_225468 ?auto_225467 ) ( SUPPORTS ?auto_225468 ?auto_225466 ) ( not ( = ?auto_225465 ?auto_225469 ) ) ( HAVE_IMAGE ?auto_225460 ?auto_225461 ) ( not ( = ?auto_225460 ?auto_225469 ) ) ( not ( = ?auto_225461 ?auto_225466 ) ) ( CALIBRATION_TARGET ?auto_225468 ?auto_225469 ) ( POWER_AVAIL ?auto_225467 ) ( POINTING ?auto_225467 ?auto_225464 ) ( not ( = ?auto_225469 ?auto_225464 ) ) ( HAVE_IMAGE ?auto_225462 ?auto_225459 ) ( HAVE_IMAGE ?auto_225464 ?auto_225463 ) ( not ( = ?auto_225461 ?auto_225459 ) ) ( not ( = ?auto_225461 ?auto_225463 ) ) ( not ( = ?auto_225462 ?auto_225469 ) ) ( not ( = ?auto_225459 ?auto_225463 ) ) ( not ( = ?auto_225459 ?auto_225466 ) ) ( not ( = ?auto_225463 ?auto_225466 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225460 ?auto_225461 ?auto_225465 ?auto_225466 )
      ( GET-4IMAGE-VERIFY ?auto_225460 ?auto_225461 ?auto_225462 ?auto_225459 ?auto_225464 ?auto_225463 ?auto_225465 ?auto_225466 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_225495 - DIRECTION
      ?auto_225496 - MODE
      ?auto_225497 - DIRECTION
      ?auto_225494 - MODE
      ?auto_225499 - DIRECTION
      ?auto_225498 - MODE
      ?auto_225500 - DIRECTION
      ?auto_225501 - MODE
    )
    :vars
    (
      ?auto_225503 - INSTRUMENT
      ?auto_225502 - SATELLITE
      ?auto_225504 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_225497 ?auto_225495 ) ) ( not ( = ?auto_225499 ?auto_225495 ) ) ( not ( = ?auto_225499 ?auto_225497 ) ) ( not ( = ?auto_225500 ?auto_225495 ) ) ( not ( = ?auto_225500 ?auto_225497 ) ) ( not ( = ?auto_225500 ?auto_225499 ) ) ( ON_BOARD ?auto_225503 ?auto_225502 ) ( SUPPORTS ?auto_225503 ?auto_225498 ) ( not ( = ?auto_225499 ?auto_225504 ) ) ( HAVE_IMAGE ?auto_225495 ?auto_225496 ) ( not ( = ?auto_225495 ?auto_225504 ) ) ( not ( = ?auto_225496 ?auto_225498 ) ) ( CALIBRATION_TARGET ?auto_225503 ?auto_225504 ) ( POWER_AVAIL ?auto_225502 ) ( POINTING ?auto_225502 ?auto_225500 ) ( not ( = ?auto_225504 ?auto_225500 ) ) ( HAVE_IMAGE ?auto_225497 ?auto_225494 ) ( HAVE_IMAGE ?auto_225500 ?auto_225501 ) ( not ( = ?auto_225496 ?auto_225494 ) ) ( not ( = ?auto_225496 ?auto_225501 ) ) ( not ( = ?auto_225497 ?auto_225504 ) ) ( not ( = ?auto_225494 ?auto_225498 ) ) ( not ( = ?auto_225494 ?auto_225501 ) ) ( not ( = ?auto_225498 ?auto_225501 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225495 ?auto_225496 ?auto_225499 ?auto_225498 )
      ( GET-4IMAGE-VERIFY ?auto_225495 ?auto_225496 ?auto_225497 ?auto_225494 ?auto_225499 ?auto_225498 ?auto_225500 ?auto_225501 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_225529 - DIRECTION
      ?auto_225530 - MODE
      ?auto_225531 - DIRECTION
      ?auto_225528 - MODE
      ?auto_225533 - DIRECTION
      ?auto_225532 - MODE
      ?auto_225534 - DIRECTION
      ?auto_225535 - MODE
    )
    :vars
    (
      ?auto_225537 - INSTRUMENT
      ?auto_225536 - SATELLITE
      ?auto_225538 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_225531 ?auto_225529 ) ) ( not ( = ?auto_225533 ?auto_225529 ) ) ( not ( = ?auto_225533 ?auto_225531 ) ) ( not ( = ?auto_225534 ?auto_225529 ) ) ( not ( = ?auto_225534 ?auto_225531 ) ) ( not ( = ?auto_225534 ?auto_225533 ) ) ( ON_BOARD ?auto_225537 ?auto_225536 ) ( SUPPORTS ?auto_225537 ?auto_225535 ) ( not ( = ?auto_225534 ?auto_225538 ) ) ( HAVE_IMAGE ?auto_225529 ?auto_225530 ) ( not ( = ?auto_225529 ?auto_225538 ) ) ( not ( = ?auto_225530 ?auto_225535 ) ) ( CALIBRATION_TARGET ?auto_225537 ?auto_225538 ) ( POWER_AVAIL ?auto_225536 ) ( POINTING ?auto_225536 ?auto_225531 ) ( not ( = ?auto_225538 ?auto_225531 ) ) ( HAVE_IMAGE ?auto_225531 ?auto_225528 ) ( HAVE_IMAGE ?auto_225533 ?auto_225532 ) ( not ( = ?auto_225530 ?auto_225528 ) ) ( not ( = ?auto_225530 ?auto_225532 ) ) ( not ( = ?auto_225528 ?auto_225532 ) ) ( not ( = ?auto_225528 ?auto_225535 ) ) ( not ( = ?auto_225533 ?auto_225538 ) ) ( not ( = ?auto_225532 ?auto_225535 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225529 ?auto_225530 ?auto_225534 ?auto_225535 )
      ( GET-4IMAGE-VERIFY ?auto_225529 ?auto_225530 ?auto_225531 ?auto_225528 ?auto_225533 ?auto_225532 ?auto_225534 ?auto_225535 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_225562 - DIRECTION
      ?auto_225563 - MODE
      ?auto_225564 - DIRECTION
      ?auto_225561 - MODE
      ?auto_225566 - DIRECTION
      ?auto_225565 - MODE
      ?auto_225567 - DIRECTION
      ?auto_225568 - MODE
    )
    :vars
    (
      ?auto_225570 - INSTRUMENT
      ?auto_225569 - SATELLITE
      ?auto_225571 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_225564 ?auto_225562 ) ) ( not ( = ?auto_225566 ?auto_225562 ) ) ( not ( = ?auto_225566 ?auto_225564 ) ) ( not ( = ?auto_225567 ?auto_225562 ) ) ( not ( = ?auto_225567 ?auto_225564 ) ) ( not ( = ?auto_225567 ?auto_225566 ) ) ( ON_BOARD ?auto_225570 ?auto_225569 ) ( SUPPORTS ?auto_225570 ?auto_225565 ) ( not ( = ?auto_225566 ?auto_225571 ) ) ( HAVE_IMAGE ?auto_225562 ?auto_225563 ) ( not ( = ?auto_225562 ?auto_225571 ) ) ( not ( = ?auto_225563 ?auto_225565 ) ) ( CALIBRATION_TARGET ?auto_225570 ?auto_225571 ) ( POWER_AVAIL ?auto_225569 ) ( POINTING ?auto_225569 ?auto_225564 ) ( not ( = ?auto_225571 ?auto_225564 ) ) ( HAVE_IMAGE ?auto_225564 ?auto_225561 ) ( HAVE_IMAGE ?auto_225567 ?auto_225568 ) ( not ( = ?auto_225563 ?auto_225561 ) ) ( not ( = ?auto_225563 ?auto_225568 ) ) ( not ( = ?auto_225561 ?auto_225565 ) ) ( not ( = ?auto_225561 ?auto_225568 ) ) ( not ( = ?auto_225565 ?auto_225568 ) ) ( not ( = ?auto_225567 ?auto_225571 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225562 ?auto_225563 ?auto_225566 ?auto_225565 )
      ( GET-4IMAGE-VERIFY ?auto_225562 ?auto_225563 ?auto_225564 ?auto_225561 ?auto_225566 ?auto_225565 ?auto_225567 ?auto_225568 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_225666 - DIRECTION
      ?auto_225667 - MODE
      ?auto_225668 - DIRECTION
      ?auto_225665 - MODE
      ?auto_225670 - DIRECTION
      ?auto_225669 - MODE
      ?auto_225671 - DIRECTION
      ?auto_225672 - MODE
    )
    :vars
    (
      ?auto_225674 - INSTRUMENT
      ?auto_225673 - SATELLITE
      ?auto_225675 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_225668 ?auto_225666 ) ) ( not ( = ?auto_225670 ?auto_225666 ) ) ( not ( = ?auto_225670 ?auto_225668 ) ) ( not ( = ?auto_225671 ?auto_225666 ) ) ( not ( = ?auto_225671 ?auto_225668 ) ) ( not ( = ?auto_225671 ?auto_225670 ) ) ( ON_BOARD ?auto_225674 ?auto_225673 ) ( SUPPORTS ?auto_225674 ?auto_225665 ) ( not ( = ?auto_225668 ?auto_225675 ) ) ( HAVE_IMAGE ?auto_225666 ?auto_225667 ) ( not ( = ?auto_225666 ?auto_225675 ) ) ( not ( = ?auto_225667 ?auto_225665 ) ) ( CALIBRATION_TARGET ?auto_225674 ?auto_225675 ) ( POWER_AVAIL ?auto_225673 ) ( POINTING ?auto_225673 ?auto_225671 ) ( not ( = ?auto_225675 ?auto_225671 ) ) ( HAVE_IMAGE ?auto_225670 ?auto_225669 ) ( HAVE_IMAGE ?auto_225671 ?auto_225672 ) ( not ( = ?auto_225667 ?auto_225669 ) ) ( not ( = ?auto_225667 ?auto_225672 ) ) ( not ( = ?auto_225665 ?auto_225669 ) ) ( not ( = ?auto_225665 ?auto_225672 ) ) ( not ( = ?auto_225670 ?auto_225675 ) ) ( not ( = ?auto_225669 ?auto_225672 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225666 ?auto_225667 ?auto_225668 ?auto_225665 )
      ( GET-4IMAGE-VERIFY ?auto_225666 ?auto_225667 ?auto_225668 ?auto_225665 ?auto_225670 ?auto_225669 ?auto_225671 ?auto_225672 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_225700 - DIRECTION
      ?auto_225701 - MODE
      ?auto_225702 - DIRECTION
      ?auto_225699 - MODE
      ?auto_225704 - DIRECTION
      ?auto_225703 - MODE
      ?auto_225705 - DIRECTION
      ?auto_225706 - MODE
    )
    :vars
    (
      ?auto_225708 - INSTRUMENT
      ?auto_225707 - SATELLITE
      ?auto_225709 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_225702 ?auto_225700 ) ) ( not ( = ?auto_225704 ?auto_225700 ) ) ( not ( = ?auto_225704 ?auto_225702 ) ) ( not ( = ?auto_225705 ?auto_225700 ) ) ( not ( = ?auto_225705 ?auto_225702 ) ) ( not ( = ?auto_225705 ?auto_225704 ) ) ( ON_BOARD ?auto_225708 ?auto_225707 ) ( SUPPORTS ?auto_225708 ?auto_225699 ) ( not ( = ?auto_225702 ?auto_225709 ) ) ( HAVE_IMAGE ?auto_225700 ?auto_225701 ) ( not ( = ?auto_225700 ?auto_225709 ) ) ( not ( = ?auto_225701 ?auto_225699 ) ) ( CALIBRATION_TARGET ?auto_225708 ?auto_225709 ) ( POWER_AVAIL ?auto_225707 ) ( POINTING ?auto_225707 ?auto_225704 ) ( not ( = ?auto_225709 ?auto_225704 ) ) ( HAVE_IMAGE ?auto_225704 ?auto_225703 ) ( HAVE_IMAGE ?auto_225705 ?auto_225706 ) ( not ( = ?auto_225701 ?auto_225703 ) ) ( not ( = ?auto_225701 ?auto_225706 ) ) ( not ( = ?auto_225699 ?auto_225703 ) ) ( not ( = ?auto_225699 ?auto_225706 ) ) ( not ( = ?auto_225703 ?auto_225706 ) ) ( not ( = ?auto_225705 ?auto_225709 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_225700 ?auto_225701 ?auto_225702 ?auto_225699 )
      ( GET-4IMAGE-VERIFY ?auto_225700 ?auto_225701 ?auto_225702 ?auto_225699 ?auto_225704 ?auto_225703 ?auto_225705 ?auto_225706 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_226237 - DIRECTION
      ?auto_226238 - MODE
      ?auto_226239 - DIRECTION
      ?auto_226236 - MODE
      ?auto_226241 - DIRECTION
      ?auto_226240 - MODE
      ?auto_226242 - DIRECTION
      ?auto_226243 - MODE
    )
    :vars
    (
      ?auto_226245 - INSTRUMENT
      ?auto_226244 - SATELLITE
      ?auto_226246 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_226239 ?auto_226237 ) ) ( not ( = ?auto_226241 ?auto_226237 ) ) ( not ( = ?auto_226241 ?auto_226239 ) ) ( not ( = ?auto_226242 ?auto_226237 ) ) ( not ( = ?auto_226242 ?auto_226239 ) ) ( not ( = ?auto_226242 ?auto_226241 ) ) ( ON_BOARD ?auto_226245 ?auto_226244 ) ( SUPPORTS ?auto_226245 ?auto_226243 ) ( not ( = ?auto_226242 ?auto_226246 ) ) ( HAVE_IMAGE ?auto_226239 ?auto_226236 ) ( not ( = ?auto_226239 ?auto_226246 ) ) ( not ( = ?auto_226236 ?auto_226243 ) ) ( CALIBRATION_TARGET ?auto_226245 ?auto_226246 ) ( POWER_AVAIL ?auto_226244 ) ( POINTING ?auto_226244 ?auto_226237 ) ( not ( = ?auto_226246 ?auto_226237 ) ) ( HAVE_IMAGE ?auto_226237 ?auto_226238 ) ( HAVE_IMAGE ?auto_226241 ?auto_226240 ) ( not ( = ?auto_226238 ?auto_226236 ) ) ( not ( = ?auto_226238 ?auto_226240 ) ) ( not ( = ?auto_226238 ?auto_226243 ) ) ( not ( = ?auto_226236 ?auto_226240 ) ) ( not ( = ?auto_226241 ?auto_226246 ) ) ( not ( = ?auto_226240 ?auto_226243 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_226239 ?auto_226236 ?auto_226242 ?auto_226243 )
      ( GET-4IMAGE-VERIFY ?auto_226237 ?auto_226238 ?auto_226239 ?auto_226236 ?auto_226241 ?auto_226240 ?auto_226242 ?auto_226243 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_226270 - DIRECTION
      ?auto_226271 - MODE
      ?auto_226272 - DIRECTION
      ?auto_226269 - MODE
      ?auto_226274 - DIRECTION
      ?auto_226273 - MODE
      ?auto_226275 - DIRECTION
      ?auto_226276 - MODE
    )
    :vars
    (
      ?auto_226278 - INSTRUMENT
      ?auto_226277 - SATELLITE
      ?auto_226279 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_226272 ?auto_226270 ) ) ( not ( = ?auto_226274 ?auto_226270 ) ) ( not ( = ?auto_226274 ?auto_226272 ) ) ( not ( = ?auto_226275 ?auto_226270 ) ) ( not ( = ?auto_226275 ?auto_226272 ) ) ( not ( = ?auto_226275 ?auto_226274 ) ) ( ON_BOARD ?auto_226278 ?auto_226277 ) ( SUPPORTS ?auto_226278 ?auto_226273 ) ( not ( = ?auto_226274 ?auto_226279 ) ) ( HAVE_IMAGE ?auto_226272 ?auto_226269 ) ( not ( = ?auto_226272 ?auto_226279 ) ) ( not ( = ?auto_226269 ?auto_226273 ) ) ( CALIBRATION_TARGET ?auto_226278 ?auto_226279 ) ( POWER_AVAIL ?auto_226277 ) ( POINTING ?auto_226277 ?auto_226270 ) ( not ( = ?auto_226279 ?auto_226270 ) ) ( HAVE_IMAGE ?auto_226270 ?auto_226271 ) ( HAVE_IMAGE ?auto_226275 ?auto_226276 ) ( not ( = ?auto_226271 ?auto_226269 ) ) ( not ( = ?auto_226271 ?auto_226273 ) ) ( not ( = ?auto_226271 ?auto_226276 ) ) ( not ( = ?auto_226269 ?auto_226276 ) ) ( not ( = ?auto_226273 ?auto_226276 ) ) ( not ( = ?auto_226275 ?auto_226279 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_226272 ?auto_226269 ?auto_226274 ?auto_226273 )
      ( GET-4IMAGE-VERIFY ?auto_226270 ?auto_226271 ?auto_226272 ?auto_226269 ?auto_226274 ?auto_226273 ?auto_226275 ?auto_226276 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_226482 - DIRECTION
      ?auto_226483 - MODE
      ?auto_226484 - DIRECTION
      ?auto_226481 - MODE
      ?auto_226486 - DIRECTION
      ?auto_226485 - MODE
      ?auto_226487 - DIRECTION
      ?auto_226488 - MODE
    )
    :vars
    (
      ?auto_226490 - INSTRUMENT
      ?auto_226489 - SATELLITE
      ?auto_226491 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_226484 ?auto_226482 ) ) ( not ( = ?auto_226486 ?auto_226482 ) ) ( not ( = ?auto_226486 ?auto_226484 ) ) ( not ( = ?auto_226487 ?auto_226482 ) ) ( not ( = ?auto_226487 ?auto_226484 ) ) ( not ( = ?auto_226487 ?auto_226486 ) ) ( ON_BOARD ?auto_226490 ?auto_226489 ) ( SUPPORTS ?auto_226490 ?auto_226481 ) ( not ( = ?auto_226484 ?auto_226491 ) ) ( HAVE_IMAGE ?auto_226486 ?auto_226485 ) ( not ( = ?auto_226486 ?auto_226491 ) ) ( not ( = ?auto_226485 ?auto_226481 ) ) ( CALIBRATION_TARGET ?auto_226490 ?auto_226491 ) ( POWER_AVAIL ?auto_226489 ) ( POINTING ?auto_226489 ?auto_226482 ) ( not ( = ?auto_226491 ?auto_226482 ) ) ( HAVE_IMAGE ?auto_226482 ?auto_226483 ) ( HAVE_IMAGE ?auto_226487 ?auto_226488 ) ( not ( = ?auto_226483 ?auto_226481 ) ) ( not ( = ?auto_226483 ?auto_226485 ) ) ( not ( = ?auto_226483 ?auto_226488 ) ) ( not ( = ?auto_226481 ?auto_226488 ) ) ( not ( = ?auto_226485 ?auto_226488 ) ) ( not ( = ?auto_226487 ?auto_226491 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_226486 ?auto_226485 ?auto_226484 ?auto_226481 )
      ( GET-4IMAGE-VERIFY ?auto_226482 ?auto_226483 ?auto_226484 ?auto_226481 ?auto_226486 ?auto_226485 ?auto_226487 ?auto_226488 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_226733 - DIRECTION
      ?auto_226734 - MODE
      ?auto_226735 - DIRECTION
      ?auto_226732 - MODE
      ?auto_226737 - DIRECTION
      ?auto_226736 - MODE
      ?auto_226738 - DIRECTION
      ?auto_226739 - MODE
    )
    :vars
    (
      ?auto_226741 - INSTRUMENT
      ?auto_226740 - SATELLITE
      ?auto_226742 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_226735 ?auto_226733 ) ) ( not ( = ?auto_226737 ?auto_226733 ) ) ( not ( = ?auto_226737 ?auto_226735 ) ) ( not ( = ?auto_226738 ?auto_226733 ) ) ( not ( = ?auto_226738 ?auto_226735 ) ) ( not ( = ?auto_226738 ?auto_226737 ) ) ( ON_BOARD ?auto_226741 ?auto_226740 ) ( SUPPORTS ?auto_226741 ?auto_226734 ) ( not ( = ?auto_226733 ?auto_226742 ) ) ( HAVE_IMAGE ?auto_226735 ?auto_226732 ) ( not ( = ?auto_226735 ?auto_226742 ) ) ( not ( = ?auto_226732 ?auto_226734 ) ) ( CALIBRATION_TARGET ?auto_226741 ?auto_226742 ) ( POWER_AVAIL ?auto_226740 ) ( POINTING ?auto_226740 ?auto_226738 ) ( not ( = ?auto_226742 ?auto_226738 ) ) ( HAVE_IMAGE ?auto_226737 ?auto_226736 ) ( HAVE_IMAGE ?auto_226738 ?auto_226739 ) ( not ( = ?auto_226734 ?auto_226736 ) ) ( not ( = ?auto_226734 ?auto_226739 ) ) ( not ( = ?auto_226732 ?auto_226736 ) ) ( not ( = ?auto_226732 ?auto_226739 ) ) ( not ( = ?auto_226737 ?auto_226742 ) ) ( not ( = ?auto_226736 ?auto_226739 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_226735 ?auto_226732 ?auto_226733 ?auto_226734 )
      ( GET-4IMAGE-VERIFY ?auto_226733 ?auto_226734 ?auto_226735 ?auto_226732 ?auto_226737 ?auto_226736 ?auto_226738 ?auto_226739 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_226767 - DIRECTION
      ?auto_226768 - MODE
      ?auto_226769 - DIRECTION
      ?auto_226766 - MODE
      ?auto_226771 - DIRECTION
      ?auto_226770 - MODE
      ?auto_226772 - DIRECTION
      ?auto_226773 - MODE
    )
    :vars
    (
      ?auto_226775 - INSTRUMENT
      ?auto_226774 - SATELLITE
      ?auto_226776 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_226769 ?auto_226767 ) ) ( not ( = ?auto_226771 ?auto_226767 ) ) ( not ( = ?auto_226771 ?auto_226769 ) ) ( not ( = ?auto_226772 ?auto_226767 ) ) ( not ( = ?auto_226772 ?auto_226769 ) ) ( not ( = ?auto_226772 ?auto_226771 ) ) ( ON_BOARD ?auto_226775 ?auto_226774 ) ( SUPPORTS ?auto_226775 ?auto_226768 ) ( not ( = ?auto_226767 ?auto_226776 ) ) ( HAVE_IMAGE ?auto_226769 ?auto_226766 ) ( not ( = ?auto_226769 ?auto_226776 ) ) ( not ( = ?auto_226766 ?auto_226768 ) ) ( CALIBRATION_TARGET ?auto_226775 ?auto_226776 ) ( POWER_AVAIL ?auto_226774 ) ( POINTING ?auto_226774 ?auto_226771 ) ( not ( = ?auto_226776 ?auto_226771 ) ) ( HAVE_IMAGE ?auto_226771 ?auto_226770 ) ( HAVE_IMAGE ?auto_226772 ?auto_226773 ) ( not ( = ?auto_226768 ?auto_226770 ) ) ( not ( = ?auto_226768 ?auto_226773 ) ) ( not ( = ?auto_226766 ?auto_226770 ) ) ( not ( = ?auto_226766 ?auto_226773 ) ) ( not ( = ?auto_226770 ?auto_226773 ) ) ( not ( = ?auto_226772 ?auto_226776 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_226769 ?auto_226766 ?auto_226767 ?auto_226768 )
      ( GET-4IMAGE-VERIFY ?auto_226767 ?auto_226768 ?auto_226769 ?auto_226766 ?auto_226771 ?auto_226770 ?auto_226772 ?auto_226773 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_227055 - DIRECTION
      ?auto_227056 - MODE
      ?auto_227057 - DIRECTION
      ?auto_227054 - MODE
      ?auto_227059 - DIRECTION
      ?auto_227058 - MODE
      ?auto_227060 - DIRECTION
      ?auto_227061 - MODE
    )
    :vars
    (
      ?auto_227063 - INSTRUMENT
      ?auto_227062 - SATELLITE
      ?auto_227064 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_227057 ?auto_227055 ) ) ( not ( = ?auto_227059 ?auto_227055 ) ) ( not ( = ?auto_227059 ?auto_227057 ) ) ( not ( = ?auto_227060 ?auto_227055 ) ) ( not ( = ?auto_227060 ?auto_227057 ) ) ( not ( = ?auto_227060 ?auto_227059 ) ) ( ON_BOARD ?auto_227063 ?auto_227062 ) ( SUPPORTS ?auto_227063 ?auto_227056 ) ( not ( = ?auto_227055 ?auto_227064 ) ) ( HAVE_IMAGE ?auto_227059 ?auto_227058 ) ( not ( = ?auto_227059 ?auto_227064 ) ) ( not ( = ?auto_227058 ?auto_227056 ) ) ( CALIBRATION_TARGET ?auto_227063 ?auto_227064 ) ( POWER_AVAIL ?auto_227062 ) ( POINTING ?auto_227062 ?auto_227057 ) ( not ( = ?auto_227064 ?auto_227057 ) ) ( HAVE_IMAGE ?auto_227057 ?auto_227054 ) ( HAVE_IMAGE ?auto_227060 ?auto_227061 ) ( not ( = ?auto_227056 ?auto_227054 ) ) ( not ( = ?auto_227056 ?auto_227061 ) ) ( not ( = ?auto_227054 ?auto_227058 ) ) ( not ( = ?auto_227054 ?auto_227061 ) ) ( not ( = ?auto_227058 ?auto_227061 ) ) ( not ( = ?auto_227060 ?auto_227064 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227059 ?auto_227058 ?auto_227055 ?auto_227056 )
      ( GET-4IMAGE-VERIFY ?auto_227055 ?auto_227056 ?auto_227057 ?auto_227054 ?auto_227059 ?auto_227058 ?auto_227060 ?auto_227061 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_227515 - DIRECTION
      ?auto_227516 - MODE
      ?auto_227517 - DIRECTION
      ?auto_227514 - MODE
      ?auto_227519 - DIRECTION
      ?auto_227518 - MODE
    )
    :vars
    (
      ?auto_227520 - INSTRUMENT
      ?auto_227521 - SATELLITE
      ?auto_227523 - DIRECTION
      ?auto_227524 - DIRECTION
      ?auto_227522 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_227517 ?auto_227515 ) ) ( not ( = ?auto_227519 ?auto_227515 ) ) ( not ( = ?auto_227519 ?auto_227517 ) ) ( ON_BOARD ?auto_227520 ?auto_227521 ) ( SUPPORTS ?auto_227520 ?auto_227518 ) ( not ( = ?auto_227519 ?auto_227523 ) ) ( HAVE_IMAGE ?auto_227515 ?auto_227516 ) ( not ( = ?auto_227515 ?auto_227523 ) ) ( not ( = ?auto_227516 ?auto_227518 ) ) ( CALIBRATION_TARGET ?auto_227520 ?auto_227523 ) ( POINTING ?auto_227521 ?auto_227524 ) ( not ( = ?auto_227523 ?auto_227524 ) ) ( not ( = ?auto_227519 ?auto_227524 ) ) ( not ( = ?auto_227515 ?auto_227524 ) ) ( ON_BOARD ?auto_227522 ?auto_227521 ) ( POWER_ON ?auto_227522 ) ( not ( = ?auto_227520 ?auto_227522 ) ) ( HAVE_IMAGE ?auto_227517 ?auto_227514 ) ( not ( = ?auto_227516 ?auto_227514 ) ) ( not ( = ?auto_227517 ?auto_227523 ) ) ( not ( = ?auto_227517 ?auto_227524 ) ) ( not ( = ?auto_227514 ?auto_227518 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227515 ?auto_227516 ?auto_227519 ?auto_227518 )
      ( GET-3IMAGE-VERIFY ?auto_227515 ?auto_227516 ?auto_227517 ?auto_227514 ?auto_227519 ?auto_227518 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_227547 - DIRECTION
      ?auto_227548 - MODE
      ?auto_227549 - DIRECTION
      ?auto_227546 - MODE
      ?auto_227551 - DIRECTION
      ?auto_227550 - MODE
    )
    :vars
    (
      ?auto_227552 - INSTRUMENT
      ?auto_227553 - SATELLITE
      ?auto_227555 - DIRECTION
      ?auto_227556 - DIRECTION
      ?auto_227554 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_227549 ?auto_227547 ) ) ( not ( = ?auto_227551 ?auto_227547 ) ) ( not ( = ?auto_227551 ?auto_227549 ) ) ( ON_BOARD ?auto_227552 ?auto_227553 ) ( SUPPORTS ?auto_227552 ?auto_227546 ) ( not ( = ?auto_227549 ?auto_227555 ) ) ( HAVE_IMAGE ?auto_227547 ?auto_227548 ) ( not ( = ?auto_227547 ?auto_227555 ) ) ( not ( = ?auto_227548 ?auto_227546 ) ) ( CALIBRATION_TARGET ?auto_227552 ?auto_227555 ) ( POINTING ?auto_227553 ?auto_227556 ) ( not ( = ?auto_227555 ?auto_227556 ) ) ( not ( = ?auto_227549 ?auto_227556 ) ) ( not ( = ?auto_227547 ?auto_227556 ) ) ( ON_BOARD ?auto_227554 ?auto_227553 ) ( POWER_ON ?auto_227554 ) ( not ( = ?auto_227552 ?auto_227554 ) ) ( HAVE_IMAGE ?auto_227551 ?auto_227550 ) ( not ( = ?auto_227548 ?auto_227550 ) ) ( not ( = ?auto_227546 ?auto_227550 ) ) ( not ( = ?auto_227551 ?auto_227555 ) ) ( not ( = ?auto_227551 ?auto_227556 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227547 ?auto_227548 ?auto_227549 ?auto_227546 )
      ( GET-3IMAGE-VERIFY ?auto_227547 ?auto_227548 ?auto_227549 ?auto_227546 ?auto_227551 ?auto_227550 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_227721 - DIRECTION
      ?auto_227722 - MODE
      ?auto_227723 - DIRECTION
      ?auto_227720 - MODE
      ?auto_227725 - DIRECTION
      ?auto_227724 - MODE
    )
    :vars
    (
      ?auto_227726 - INSTRUMENT
      ?auto_227727 - SATELLITE
      ?auto_227729 - DIRECTION
      ?auto_227730 - DIRECTION
      ?auto_227728 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_227723 ?auto_227721 ) ) ( not ( = ?auto_227725 ?auto_227721 ) ) ( not ( = ?auto_227725 ?auto_227723 ) ) ( ON_BOARD ?auto_227726 ?auto_227727 ) ( SUPPORTS ?auto_227726 ?auto_227722 ) ( not ( = ?auto_227721 ?auto_227729 ) ) ( HAVE_IMAGE ?auto_227723 ?auto_227720 ) ( not ( = ?auto_227723 ?auto_227729 ) ) ( not ( = ?auto_227720 ?auto_227722 ) ) ( CALIBRATION_TARGET ?auto_227726 ?auto_227729 ) ( POINTING ?auto_227727 ?auto_227730 ) ( not ( = ?auto_227729 ?auto_227730 ) ) ( not ( = ?auto_227721 ?auto_227730 ) ) ( not ( = ?auto_227723 ?auto_227730 ) ) ( ON_BOARD ?auto_227728 ?auto_227727 ) ( POWER_ON ?auto_227728 ) ( not ( = ?auto_227726 ?auto_227728 ) ) ( HAVE_IMAGE ?auto_227725 ?auto_227724 ) ( not ( = ?auto_227722 ?auto_227724 ) ) ( not ( = ?auto_227720 ?auto_227724 ) ) ( not ( = ?auto_227725 ?auto_227729 ) ) ( not ( = ?auto_227725 ?auto_227730 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227723 ?auto_227720 ?auto_227721 ?auto_227722 )
      ( GET-3IMAGE-VERIFY ?auto_227721 ?auto_227722 ?auto_227723 ?auto_227720 ?auto_227725 ?auto_227724 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_227995 - DIRECTION
      ?auto_227996 - MODE
      ?auto_227997 - DIRECTION
      ?auto_227994 - MODE
      ?auto_227999 - DIRECTION
      ?auto_227998 - MODE
      ?auto_228000 - DIRECTION
      ?auto_228001 - MODE
    )
    :vars
    (
      ?auto_228002 - INSTRUMENT
      ?auto_228003 - SATELLITE
      ?auto_228005 - DIRECTION
      ?auto_228004 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_227997 ?auto_227995 ) ) ( not ( = ?auto_227999 ?auto_227995 ) ) ( not ( = ?auto_227999 ?auto_227997 ) ) ( not ( = ?auto_228000 ?auto_227995 ) ) ( not ( = ?auto_228000 ?auto_227997 ) ) ( not ( = ?auto_228000 ?auto_227999 ) ) ( ON_BOARD ?auto_228002 ?auto_228003 ) ( SUPPORTS ?auto_228002 ?auto_228001 ) ( not ( = ?auto_228000 ?auto_228005 ) ) ( HAVE_IMAGE ?auto_227995 ?auto_227996 ) ( not ( = ?auto_227995 ?auto_228005 ) ) ( not ( = ?auto_227996 ?auto_228001 ) ) ( CALIBRATION_TARGET ?auto_228002 ?auto_228005 ) ( POINTING ?auto_228003 ?auto_227999 ) ( not ( = ?auto_228005 ?auto_227999 ) ) ( ON_BOARD ?auto_228004 ?auto_228003 ) ( POWER_ON ?auto_228004 ) ( not ( = ?auto_228002 ?auto_228004 ) ) ( HAVE_IMAGE ?auto_227997 ?auto_227994 ) ( HAVE_IMAGE ?auto_227999 ?auto_227998 ) ( not ( = ?auto_227996 ?auto_227994 ) ) ( not ( = ?auto_227996 ?auto_227998 ) ) ( not ( = ?auto_227997 ?auto_228005 ) ) ( not ( = ?auto_227994 ?auto_227998 ) ) ( not ( = ?auto_227994 ?auto_228001 ) ) ( not ( = ?auto_227998 ?auto_228001 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_227995 ?auto_227996 ?auto_228000 ?auto_228001 )
      ( GET-4IMAGE-VERIFY ?auto_227995 ?auto_227996 ?auto_227997 ?auto_227994 ?auto_227999 ?auto_227998 ?auto_228000 ?auto_228001 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_228033 - DIRECTION
      ?auto_228034 - MODE
      ?auto_228035 - DIRECTION
      ?auto_228032 - MODE
      ?auto_228037 - DIRECTION
      ?auto_228036 - MODE
      ?auto_228038 - DIRECTION
      ?auto_228039 - MODE
    )
    :vars
    (
      ?auto_228040 - INSTRUMENT
      ?auto_228041 - SATELLITE
      ?auto_228043 - DIRECTION
      ?auto_228042 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_228035 ?auto_228033 ) ) ( not ( = ?auto_228037 ?auto_228033 ) ) ( not ( = ?auto_228037 ?auto_228035 ) ) ( not ( = ?auto_228038 ?auto_228033 ) ) ( not ( = ?auto_228038 ?auto_228035 ) ) ( not ( = ?auto_228038 ?auto_228037 ) ) ( ON_BOARD ?auto_228040 ?auto_228041 ) ( SUPPORTS ?auto_228040 ?auto_228036 ) ( not ( = ?auto_228037 ?auto_228043 ) ) ( HAVE_IMAGE ?auto_228033 ?auto_228034 ) ( not ( = ?auto_228033 ?auto_228043 ) ) ( not ( = ?auto_228034 ?auto_228036 ) ) ( CALIBRATION_TARGET ?auto_228040 ?auto_228043 ) ( POINTING ?auto_228041 ?auto_228038 ) ( not ( = ?auto_228043 ?auto_228038 ) ) ( ON_BOARD ?auto_228042 ?auto_228041 ) ( POWER_ON ?auto_228042 ) ( not ( = ?auto_228040 ?auto_228042 ) ) ( HAVE_IMAGE ?auto_228035 ?auto_228032 ) ( HAVE_IMAGE ?auto_228038 ?auto_228039 ) ( not ( = ?auto_228034 ?auto_228032 ) ) ( not ( = ?auto_228034 ?auto_228039 ) ) ( not ( = ?auto_228035 ?auto_228043 ) ) ( not ( = ?auto_228032 ?auto_228036 ) ) ( not ( = ?auto_228032 ?auto_228039 ) ) ( not ( = ?auto_228036 ?auto_228039 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_228033 ?auto_228034 ?auto_228037 ?auto_228036 )
      ( GET-4IMAGE-VERIFY ?auto_228033 ?auto_228034 ?auto_228035 ?auto_228032 ?auto_228037 ?auto_228036 ?auto_228038 ?auto_228039 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_228070 - DIRECTION
      ?auto_228071 - MODE
      ?auto_228072 - DIRECTION
      ?auto_228069 - MODE
      ?auto_228074 - DIRECTION
      ?auto_228073 - MODE
      ?auto_228075 - DIRECTION
      ?auto_228076 - MODE
    )
    :vars
    (
      ?auto_228077 - INSTRUMENT
      ?auto_228078 - SATELLITE
      ?auto_228080 - DIRECTION
      ?auto_228079 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_228072 ?auto_228070 ) ) ( not ( = ?auto_228074 ?auto_228070 ) ) ( not ( = ?auto_228074 ?auto_228072 ) ) ( not ( = ?auto_228075 ?auto_228070 ) ) ( not ( = ?auto_228075 ?auto_228072 ) ) ( not ( = ?auto_228075 ?auto_228074 ) ) ( ON_BOARD ?auto_228077 ?auto_228078 ) ( SUPPORTS ?auto_228077 ?auto_228076 ) ( not ( = ?auto_228075 ?auto_228080 ) ) ( HAVE_IMAGE ?auto_228070 ?auto_228071 ) ( not ( = ?auto_228070 ?auto_228080 ) ) ( not ( = ?auto_228071 ?auto_228076 ) ) ( CALIBRATION_TARGET ?auto_228077 ?auto_228080 ) ( POINTING ?auto_228078 ?auto_228072 ) ( not ( = ?auto_228080 ?auto_228072 ) ) ( ON_BOARD ?auto_228079 ?auto_228078 ) ( POWER_ON ?auto_228079 ) ( not ( = ?auto_228077 ?auto_228079 ) ) ( HAVE_IMAGE ?auto_228072 ?auto_228069 ) ( HAVE_IMAGE ?auto_228074 ?auto_228073 ) ( not ( = ?auto_228071 ?auto_228069 ) ) ( not ( = ?auto_228071 ?auto_228073 ) ) ( not ( = ?auto_228069 ?auto_228073 ) ) ( not ( = ?auto_228069 ?auto_228076 ) ) ( not ( = ?auto_228074 ?auto_228080 ) ) ( not ( = ?auto_228073 ?auto_228076 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_228070 ?auto_228071 ?auto_228075 ?auto_228076 )
      ( GET-4IMAGE-VERIFY ?auto_228070 ?auto_228071 ?auto_228072 ?auto_228069 ?auto_228074 ?auto_228073 ?auto_228075 ?auto_228076 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_228106 - DIRECTION
      ?auto_228107 - MODE
      ?auto_228108 - DIRECTION
      ?auto_228105 - MODE
      ?auto_228110 - DIRECTION
      ?auto_228109 - MODE
      ?auto_228111 - DIRECTION
      ?auto_228112 - MODE
    )
    :vars
    (
      ?auto_228113 - INSTRUMENT
      ?auto_228114 - SATELLITE
      ?auto_228116 - DIRECTION
      ?auto_228115 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_228108 ?auto_228106 ) ) ( not ( = ?auto_228110 ?auto_228106 ) ) ( not ( = ?auto_228110 ?auto_228108 ) ) ( not ( = ?auto_228111 ?auto_228106 ) ) ( not ( = ?auto_228111 ?auto_228108 ) ) ( not ( = ?auto_228111 ?auto_228110 ) ) ( ON_BOARD ?auto_228113 ?auto_228114 ) ( SUPPORTS ?auto_228113 ?auto_228109 ) ( not ( = ?auto_228110 ?auto_228116 ) ) ( HAVE_IMAGE ?auto_228106 ?auto_228107 ) ( not ( = ?auto_228106 ?auto_228116 ) ) ( not ( = ?auto_228107 ?auto_228109 ) ) ( CALIBRATION_TARGET ?auto_228113 ?auto_228116 ) ( POINTING ?auto_228114 ?auto_228108 ) ( not ( = ?auto_228116 ?auto_228108 ) ) ( ON_BOARD ?auto_228115 ?auto_228114 ) ( POWER_ON ?auto_228115 ) ( not ( = ?auto_228113 ?auto_228115 ) ) ( HAVE_IMAGE ?auto_228108 ?auto_228105 ) ( HAVE_IMAGE ?auto_228111 ?auto_228112 ) ( not ( = ?auto_228107 ?auto_228105 ) ) ( not ( = ?auto_228107 ?auto_228112 ) ) ( not ( = ?auto_228105 ?auto_228109 ) ) ( not ( = ?auto_228105 ?auto_228112 ) ) ( not ( = ?auto_228109 ?auto_228112 ) ) ( not ( = ?auto_228111 ?auto_228116 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_228106 ?auto_228107 ?auto_228110 ?auto_228109 )
      ( GET-4IMAGE-VERIFY ?auto_228106 ?auto_228107 ?auto_228108 ?auto_228105 ?auto_228110 ?auto_228109 ?auto_228111 ?auto_228112 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_228219 - DIRECTION
      ?auto_228220 - MODE
      ?auto_228221 - DIRECTION
      ?auto_228218 - MODE
      ?auto_228223 - DIRECTION
      ?auto_228222 - MODE
      ?auto_228224 - DIRECTION
      ?auto_228225 - MODE
    )
    :vars
    (
      ?auto_228226 - INSTRUMENT
      ?auto_228227 - SATELLITE
      ?auto_228229 - DIRECTION
      ?auto_228228 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_228221 ?auto_228219 ) ) ( not ( = ?auto_228223 ?auto_228219 ) ) ( not ( = ?auto_228223 ?auto_228221 ) ) ( not ( = ?auto_228224 ?auto_228219 ) ) ( not ( = ?auto_228224 ?auto_228221 ) ) ( not ( = ?auto_228224 ?auto_228223 ) ) ( ON_BOARD ?auto_228226 ?auto_228227 ) ( SUPPORTS ?auto_228226 ?auto_228218 ) ( not ( = ?auto_228221 ?auto_228229 ) ) ( HAVE_IMAGE ?auto_228219 ?auto_228220 ) ( not ( = ?auto_228219 ?auto_228229 ) ) ( not ( = ?auto_228220 ?auto_228218 ) ) ( CALIBRATION_TARGET ?auto_228226 ?auto_228229 ) ( POINTING ?auto_228227 ?auto_228224 ) ( not ( = ?auto_228229 ?auto_228224 ) ) ( ON_BOARD ?auto_228228 ?auto_228227 ) ( POWER_ON ?auto_228228 ) ( not ( = ?auto_228226 ?auto_228228 ) ) ( HAVE_IMAGE ?auto_228223 ?auto_228222 ) ( HAVE_IMAGE ?auto_228224 ?auto_228225 ) ( not ( = ?auto_228220 ?auto_228222 ) ) ( not ( = ?auto_228220 ?auto_228225 ) ) ( not ( = ?auto_228218 ?auto_228222 ) ) ( not ( = ?auto_228218 ?auto_228225 ) ) ( not ( = ?auto_228223 ?auto_228229 ) ) ( not ( = ?auto_228222 ?auto_228225 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_228219 ?auto_228220 ?auto_228221 ?auto_228218 )
      ( GET-4IMAGE-VERIFY ?auto_228219 ?auto_228220 ?auto_228221 ?auto_228218 ?auto_228223 ?auto_228222 ?auto_228224 ?auto_228225 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_228256 - DIRECTION
      ?auto_228257 - MODE
      ?auto_228258 - DIRECTION
      ?auto_228255 - MODE
      ?auto_228260 - DIRECTION
      ?auto_228259 - MODE
      ?auto_228261 - DIRECTION
      ?auto_228262 - MODE
    )
    :vars
    (
      ?auto_228263 - INSTRUMENT
      ?auto_228264 - SATELLITE
      ?auto_228266 - DIRECTION
      ?auto_228265 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_228258 ?auto_228256 ) ) ( not ( = ?auto_228260 ?auto_228256 ) ) ( not ( = ?auto_228260 ?auto_228258 ) ) ( not ( = ?auto_228261 ?auto_228256 ) ) ( not ( = ?auto_228261 ?auto_228258 ) ) ( not ( = ?auto_228261 ?auto_228260 ) ) ( ON_BOARD ?auto_228263 ?auto_228264 ) ( SUPPORTS ?auto_228263 ?auto_228255 ) ( not ( = ?auto_228258 ?auto_228266 ) ) ( HAVE_IMAGE ?auto_228256 ?auto_228257 ) ( not ( = ?auto_228256 ?auto_228266 ) ) ( not ( = ?auto_228257 ?auto_228255 ) ) ( CALIBRATION_TARGET ?auto_228263 ?auto_228266 ) ( POINTING ?auto_228264 ?auto_228260 ) ( not ( = ?auto_228266 ?auto_228260 ) ) ( ON_BOARD ?auto_228265 ?auto_228264 ) ( POWER_ON ?auto_228265 ) ( not ( = ?auto_228263 ?auto_228265 ) ) ( HAVE_IMAGE ?auto_228260 ?auto_228259 ) ( HAVE_IMAGE ?auto_228261 ?auto_228262 ) ( not ( = ?auto_228257 ?auto_228259 ) ) ( not ( = ?auto_228257 ?auto_228262 ) ) ( not ( = ?auto_228255 ?auto_228259 ) ) ( not ( = ?auto_228255 ?auto_228262 ) ) ( not ( = ?auto_228259 ?auto_228262 ) ) ( not ( = ?auto_228261 ?auto_228266 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_228256 ?auto_228257 ?auto_228258 ?auto_228255 )
      ( GET-4IMAGE-VERIFY ?auto_228256 ?auto_228257 ?auto_228258 ?auto_228255 ?auto_228260 ?auto_228259 ?auto_228261 ?auto_228262 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_228832 - DIRECTION
      ?auto_228833 - MODE
      ?auto_228834 - DIRECTION
      ?auto_228831 - MODE
      ?auto_228836 - DIRECTION
      ?auto_228835 - MODE
      ?auto_228837 - DIRECTION
      ?auto_228838 - MODE
    )
    :vars
    (
      ?auto_228839 - INSTRUMENT
      ?auto_228840 - SATELLITE
      ?auto_228842 - DIRECTION
      ?auto_228841 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_228834 ?auto_228832 ) ) ( not ( = ?auto_228836 ?auto_228832 ) ) ( not ( = ?auto_228836 ?auto_228834 ) ) ( not ( = ?auto_228837 ?auto_228832 ) ) ( not ( = ?auto_228837 ?auto_228834 ) ) ( not ( = ?auto_228837 ?auto_228836 ) ) ( ON_BOARD ?auto_228839 ?auto_228840 ) ( SUPPORTS ?auto_228839 ?auto_228838 ) ( not ( = ?auto_228837 ?auto_228842 ) ) ( HAVE_IMAGE ?auto_228834 ?auto_228831 ) ( not ( = ?auto_228834 ?auto_228842 ) ) ( not ( = ?auto_228831 ?auto_228838 ) ) ( CALIBRATION_TARGET ?auto_228839 ?auto_228842 ) ( POINTING ?auto_228840 ?auto_228832 ) ( not ( = ?auto_228842 ?auto_228832 ) ) ( ON_BOARD ?auto_228841 ?auto_228840 ) ( POWER_ON ?auto_228841 ) ( not ( = ?auto_228839 ?auto_228841 ) ) ( HAVE_IMAGE ?auto_228832 ?auto_228833 ) ( HAVE_IMAGE ?auto_228836 ?auto_228835 ) ( not ( = ?auto_228833 ?auto_228831 ) ) ( not ( = ?auto_228833 ?auto_228835 ) ) ( not ( = ?auto_228833 ?auto_228838 ) ) ( not ( = ?auto_228831 ?auto_228835 ) ) ( not ( = ?auto_228836 ?auto_228842 ) ) ( not ( = ?auto_228835 ?auto_228838 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_228834 ?auto_228831 ?auto_228837 ?auto_228838 )
      ( GET-4IMAGE-VERIFY ?auto_228832 ?auto_228833 ?auto_228834 ?auto_228831 ?auto_228836 ?auto_228835 ?auto_228837 ?auto_228838 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_228868 - DIRECTION
      ?auto_228869 - MODE
      ?auto_228870 - DIRECTION
      ?auto_228867 - MODE
      ?auto_228872 - DIRECTION
      ?auto_228871 - MODE
      ?auto_228873 - DIRECTION
      ?auto_228874 - MODE
    )
    :vars
    (
      ?auto_228875 - INSTRUMENT
      ?auto_228876 - SATELLITE
      ?auto_228878 - DIRECTION
      ?auto_228877 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_228870 ?auto_228868 ) ) ( not ( = ?auto_228872 ?auto_228868 ) ) ( not ( = ?auto_228872 ?auto_228870 ) ) ( not ( = ?auto_228873 ?auto_228868 ) ) ( not ( = ?auto_228873 ?auto_228870 ) ) ( not ( = ?auto_228873 ?auto_228872 ) ) ( ON_BOARD ?auto_228875 ?auto_228876 ) ( SUPPORTS ?auto_228875 ?auto_228871 ) ( not ( = ?auto_228872 ?auto_228878 ) ) ( HAVE_IMAGE ?auto_228870 ?auto_228867 ) ( not ( = ?auto_228870 ?auto_228878 ) ) ( not ( = ?auto_228867 ?auto_228871 ) ) ( CALIBRATION_TARGET ?auto_228875 ?auto_228878 ) ( POINTING ?auto_228876 ?auto_228868 ) ( not ( = ?auto_228878 ?auto_228868 ) ) ( ON_BOARD ?auto_228877 ?auto_228876 ) ( POWER_ON ?auto_228877 ) ( not ( = ?auto_228875 ?auto_228877 ) ) ( HAVE_IMAGE ?auto_228868 ?auto_228869 ) ( HAVE_IMAGE ?auto_228873 ?auto_228874 ) ( not ( = ?auto_228869 ?auto_228867 ) ) ( not ( = ?auto_228869 ?auto_228871 ) ) ( not ( = ?auto_228869 ?auto_228874 ) ) ( not ( = ?auto_228867 ?auto_228874 ) ) ( not ( = ?auto_228871 ?auto_228874 ) ) ( not ( = ?auto_228873 ?auto_228878 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_228870 ?auto_228867 ?auto_228872 ?auto_228871 )
      ( GET-4IMAGE-VERIFY ?auto_228868 ?auto_228869 ?auto_228870 ?auto_228867 ?auto_228872 ?auto_228871 ?auto_228873 ?auto_228874 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_229096 - DIRECTION
      ?auto_229097 - MODE
      ?auto_229098 - DIRECTION
      ?auto_229095 - MODE
      ?auto_229100 - DIRECTION
      ?auto_229099 - MODE
      ?auto_229101 - DIRECTION
      ?auto_229102 - MODE
    )
    :vars
    (
      ?auto_229103 - INSTRUMENT
      ?auto_229104 - SATELLITE
      ?auto_229106 - DIRECTION
      ?auto_229105 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_229098 ?auto_229096 ) ) ( not ( = ?auto_229100 ?auto_229096 ) ) ( not ( = ?auto_229100 ?auto_229098 ) ) ( not ( = ?auto_229101 ?auto_229096 ) ) ( not ( = ?auto_229101 ?auto_229098 ) ) ( not ( = ?auto_229101 ?auto_229100 ) ) ( ON_BOARD ?auto_229103 ?auto_229104 ) ( SUPPORTS ?auto_229103 ?auto_229095 ) ( not ( = ?auto_229098 ?auto_229106 ) ) ( HAVE_IMAGE ?auto_229100 ?auto_229099 ) ( not ( = ?auto_229100 ?auto_229106 ) ) ( not ( = ?auto_229099 ?auto_229095 ) ) ( CALIBRATION_TARGET ?auto_229103 ?auto_229106 ) ( POINTING ?auto_229104 ?auto_229096 ) ( not ( = ?auto_229106 ?auto_229096 ) ) ( ON_BOARD ?auto_229105 ?auto_229104 ) ( POWER_ON ?auto_229105 ) ( not ( = ?auto_229103 ?auto_229105 ) ) ( HAVE_IMAGE ?auto_229096 ?auto_229097 ) ( HAVE_IMAGE ?auto_229101 ?auto_229102 ) ( not ( = ?auto_229097 ?auto_229095 ) ) ( not ( = ?auto_229097 ?auto_229099 ) ) ( not ( = ?auto_229097 ?auto_229102 ) ) ( not ( = ?auto_229095 ?auto_229102 ) ) ( not ( = ?auto_229099 ?auto_229102 ) ) ( not ( = ?auto_229101 ?auto_229106 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_229100 ?auto_229099 ?auto_229098 ?auto_229095 )
      ( GET-4IMAGE-VERIFY ?auto_229096 ?auto_229097 ?auto_229098 ?auto_229095 ?auto_229100 ?auto_229099 ?auto_229101 ?auto_229102 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_229367 - DIRECTION
      ?auto_229368 - MODE
      ?auto_229369 - DIRECTION
      ?auto_229366 - MODE
      ?auto_229371 - DIRECTION
      ?auto_229370 - MODE
      ?auto_229372 - DIRECTION
      ?auto_229373 - MODE
    )
    :vars
    (
      ?auto_229374 - INSTRUMENT
      ?auto_229375 - SATELLITE
      ?auto_229377 - DIRECTION
      ?auto_229376 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_229369 ?auto_229367 ) ) ( not ( = ?auto_229371 ?auto_229367 ) ) ( not ( = ?auto_229371 ?auto_229369 ) ) ( not ( = ?auto_229372 ?auto_229367 ) ) ( not ( = ?auto_229372 ?auto_229369 ) ) ( not ( = ?auto_229372 ?auto_229371 ) ) ( ON_BOARD ?auto_229374 ?auto_229375 ) ( SUPPORTS ?auto_229374 ?auto_229368 ) ( not ( = ?auto_229367 ?auto_229377 ) ) ( HAVE_IMAGE ?auto_229369 ?auto_229366 ) ( not ( = ?auto_229369 ?auto_229377 ) ) ( not ( = ?auto_229366 ?auto_229368 ) ) ( CALIBRATION_TARGET ?auto_229374 ?auto_229377 ) ( POINTING ?auto_229375 ?auto_229372 ) ( not ( = ?auto_229377 ?auto_229372 ) ) ( ON_BOARD ?auto_229376 ?auto_229375 ) ( POWER_ON ?auto_229376 ) ( not ( = ?auto_229374 ?auto_229376 ) ) ( HAVE_IMAGE ?auto_229371 ?auto_229370 ) ( HAVE_IMAGE ?auto_229372 ?auto_229373 ) ( not ( = ?auto_229368 ?auto_229370 ) ) ( not ( = ?auto_229368 ?auto_229373 ) ) ( not ( = ?auto_229366 ?auto_229370 ) ) ( not ( = ?auto_229366 ?auto_229373 ) ) ( not ( = ?auto_229371 ?auto_229377 ) ) ( not ( = ?auto_229370 ?auto_229373 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_229369 ?auto_229366 ?auto_229367 ?auto_229368 )
      ( GET-4IMAGE-VERIFY ?auto_229367 ?auto_229368 ?auto_229369 ?auto_229366 ?auto_229371 ?auto_229370 ?auto_229372 ?auto_229373 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_229404 - DIRECTION
      ?auto_229405 - MODE
      ?auto_229406 - DIRECTION
      ?auto_229403 - MODE
      ?auto_229408 - DIRECTION
      ?auto_229407 - MODE
      ?auto_229409 - DIRECTION
      ?auto_229410 - MODE
    )
    :vars
    (
      ?auto_229411 - INSTRUMENT
      ?auto_229412 - SATELLITE
      ?auto_229414 - DIRECTION
      ?auto_229413 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_229406 ?auto_229404 ) ) ( not ( = ?auto_229408 ?auto_229404 ) ) ( not ( = ?auto_229408 ?auto_229406 ) ) ( not ( = ?auto_229409 ?auto_229404 ) ) ( not ( = ?auto_229409 ?auto_229406 ) ) ( not ( = ?auto_229409 ?auto_229408 ) ) ( ON_BOARD ?auto_229411 ?auto_229412 ) ( SUPPORTS ?auto_229411 ?auto_229405 ) ( not ( = ?auto_229404 ?auto_229414 ) ) ( HAVE_IMAGE ?auto_229406 ?auto_229403 ) ( not ( = ?auto_229406 ?auto_229414 ) ) ( not ( = ?auto_229403 ?auto_229405 ) ) ( CALIBRATION_TARGET ?auto_229411 ?auto_229414 ) ( POINTING ?auto_229412 ?auto_229408 ) ( not ( = ?auto_229414 ?auto_229408 ) ) ( ON_BOARD ?auto_229413 ?auto_229412 ) ( POWER_ON ?auto_229413 ) ( not ( = ?auto_229411 ?auto_229413 ) ) ( HAVE_IMAGE ?auto_229408 ?auto_229407 ) ( HAVE_IMAGE ?auto_229409 ?auto_229410 ) ( not ( = ?auto_229405 ?auto_229407 ) ) ( not ( = ?auto_229405 ?auto_229410 ) ) ( not ( = ?auto_229403 ?auto_229407 ) ) ( not ( = ?auto_229403 ?auto_229410 ) ) ( not ( = ?auto_229407 ?auto_229410 ) ) ( not ( = ?auto_229409 ?auto_229414 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_229406 ?auto_229403 ?auto_229404 ?auto_229405 )
      ( GET-4IMAGE-VERIFY ?auto_229404 ?auto_229405 ?auto_229406 ?auto_229403 ?auto_229408 ?auto_229407 ?auto_229409 ?auto_229410 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_229714 - DIRECTION
      ?auto_229715 - MODE
      ?auto_229716 - DIRECTION
      ?auto_229713 - MODE
      ?auto_229718 - DIRECTION
      ?auto_229717 - MODE
      ?auto_229719 - DIRECTION
      ?auto_229720 - MODE
    )
    :vars
    (
      ?auto_229721 - INSTRUMENT
      ?auto_229722 - SATELLITE
      ?auto_229724 - DIRECTION
      ?auto_229723 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_229716 ?auto_229714 ) ) ( not ( = ?auto_229718 ?auto_229714 ) ) ( not ( = ?auto_229718 ?auto_229716 ) ) ( not ( = ?auto_229719 ?auto_229714 ) ) ( not ( = ?auto_229719 ?auto_229716 ) ) ( not ( = ?auto_229719 ?auto_229718 ) ) ( ON_BOARD ?auto_229721 ?auto_229722 ) ( SUPPORTS ?auto_229721 ?auto_229715 ) ( not ( = ?auto_229714 ?auto_229724 ) ) ( HAVE_IMAGE ?auto_229718 ?auto_229717 ) ( not ( = ?auto_229718 ?auto_229724 ) ) ( not ( = ?auto_229717 ?auto_229715 ) ) ( CALIBRATION_TARGET ?auto_229721 ?auto_229724 ) ( POINTING ?auto_229722 ?auto_229716 ) ( not ( = ?auto_229724 ?auto_229716 ) ) ( ON_BOARD ?auto_229723 ?auto_229722 ) ( POWER_ON ?auto_229723 ) ( not ( = ?auto_229721 ?auto_229723 ) ) ( HAVE_IMAGE ?auto_229716 ?auto_229713 ) ( HAVE_IMAGE ?auto_229719 ?auto_229720 ) ( not ( = ?auto_229715 ?auto_229713 ) ) ( not ( = ?auto_229715 ?auto_229720 ) ) ( not ( = ?auto_229713 ?auto_229717 ) ) ( not ( = ?auto_229713 ?auto_229720 ) ) ( not ( = ?auto_229717 ?auto_229720 ) ) ( not ( = ?auto_229719 ?auto_229724 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_229718 ?auto_229717 ?auto_229714 ?auto_229715 )
      ( GET-4IMAGE-VERIFY ?auto_229714 ?auto_229715 ?auto_229716 ?auto_229713 ?auto_229718 ?auto_229717 ?auto_229719 ?auto_229720 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_235718 - DIRECTION
      ?auto_235719 - MODE
      ?auto_235720 - DIRECTION
      ?auto_235717 - MODE
      ?auto_235722 - DIRECTION
      ?auto_235721 - MODE
    )
    :vars
    (
      ?auto_235725 - INSTRUMENT
      ?auto_235723 - SATELLITE
      ?auto_235724 - DIRECTION
      ?auto_235726 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_235720 ?auto_235718 ) ) ( not ( = ?auto_235722 ?auto_235718 ) ) ( not ( = ?auto_235722 ?auto_235720 ) ) ( ON_BOARD ?auto_235725 ?auto_235723 ) ( SUPPORTS ?auto_235725 ?auto_235721 ) ( not ( = ?auto_235722 ?auto_235724 ) ) ( HAVE_IMAGE ?auto_235718 ?auto_235719 ) ( not ( = ?auto_235718 ?auto_235724 ) ) ( not ( = ?auto_235719 ?auto_235721 ) ) ( CALIBRATION_TARGET ?auto_235725 ?auto_235724 ) ( not ( = ?auto_235724 ?auto_235720 ) ) ( ON_BOARD ?auto_235726 ?auto_235723 ) ( POWER_ON ?auto_235726 ) ( not ( = ?auto_235725 ?auto_235726 ) ) ( POINTING ?auto_235723 ?auto_235724 ) ( HAVE_IMAGE ?auto_235720 ?auto_235717 ) ( not ( = ?auto_235719 ?auto_235717 ) ) ( not ( = ?auto_235717 ?auto_235721 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_235718 ?auto_235719 ?auto_235722 ?auto_235721 )
      ( GET-3IMAGE-VERIFY ?auto_235718 ?auto_235719 ?auto_235720 ?auto_235717 ?auto_235722 ?auto_235721 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_235750 - DIRECTION
      ?auto_235751 - MODE
      ?auto_235752 - DIRECTION
      ?auto_235749 - MODE
      ?auto_235754 - DIRECTION
      ?auto_235753 - MODE
    )
    :vars
    (
      ?auto_235757 - INSTRUMENT
      ?auto_235755 - SATELLITE
      ?auto_235756 - DIRECTION
      ?auto_235758 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_235752 ?auto_235750 ) ) ( not ( = ?auto_235754 ?auto_235750 ) ) ( not ( = ?auto_235754 ?auto_235752 ) ) ( ON_BOARD ?auto_235757 ?auto_235755 ) ( SUPPORTS ?auto_235757 ?auto_235749 ) ( not ( = ?auto_235752 ?auto_235756 ) ) ( HAVE_IMAGE ?auto_235750 ?auto_235751 ) ( not ( = ?auto_235750 ?auto_235756 ) ) ( not ( = ?auto_235751 ?auto_235749 ) ) ( CALIBRATION_TARGET ?auto_235757 ?auto_235756 ) ( not ( = ?auto_235756 ?auto_235754 ) ) ( ON_BOARD ?auto_235758 ?auto_235755 ) ( POWER_ON ?auto_235758 ) ( not ( = ?auto_235757 ?auto_235758 ) ) ( POINTING ?auto_235755 ?auto_235756 ) ( HAVE_IMAGE ?auto_235754 ?auto_235753 ) ( not ( = ?auto_235751 ?auto_235753 ) ) ( not ( = ?auto_235749 ?auto_235753 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_235750 ?auto_235751 ?auto_235752 ?auto_235749 )
      ( GET-3IMAGE-VERIFY ?auto_235750 ?auto_235751 ?auto_235752 ?auto_235749 ?auto_235754 ?auto_235753 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_233009 - DIRECTION
      ?auto_233010 - MODE
      ?auto_233011 - DIRECTION
      ?auto_233008 - MODE
      ?auto_233013 - DIRECTION
      ?auto_233012 - MODE
    )
    :vars
    (
      ?auto_233017 - INSTRUMENT
      ?auto_233016 - SATELLITE
      ?auto_233018 - DIRECTION
      ?auto_233014 - DIRECTION
      ?auto_233015 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_233011 ?auto_233009 ) ) ( not ( = ?auto_233013 ?auto_233009 ) ) ( not ( = ?auto_233013 ?auto_233011 ) ) ( ON_BOARD ?auto_233017 ?auto_233016 ) ( SUPPORTS ?auto_233017 ?auto_233012 ) ( not ( = ?auto_233013 ?auto_233018 ) ) ( HAVE_IMAGE ?auto_233011 ?auto_233008 ) ( not ( = ?auto_233011 ?auto_233018 ) ) ( not ( = ?auto_233008 ?auto_233012 ) ) ( CALIBRATION_TARGET ?auto_233017 ?auto_233018 ) ( not ( = ?auto_233018 ?auto_233014 ) ) ( not ( = ?auto_233013 ?auto_233014 ) ) ( not ( = ?auto_233011 ?auto_233014 ) ) ( ON_BOARD ?auto_233015 ?auto_233016 ) ( POWER_ON ?auto_233015 ) ( not ( = ?auto_233017 ?auto_233015 ) ) ( POINTING ?auto_233016 ?auto_233018 ) ( HAVE_IMAGE ?auto_233009 ?auto_233010 ) ( not ( = ?auto_233009 ?auto_233018 ) ) ( not ( = ?auto_233009 ?auto_233014 ) ) ( not ( = ?auto_233010 ?auto_233008 ) ) ( not ( = ?auto_233010 ?auto_233012 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_233011 ?auto_233008 ?auto_233013 ?auto_233012 )
      ( GET-3IMAGE-VERIFY ?auto_233009 ?auto_233010 ?auto_233011 ?auto_233008 ?auto_233013 ?auto_233012 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_233045 - DIRECTION
      ?auto_233046 - MODE
      ?auto_233047 - DIRECTION
      ?auto_233044 - MODE
      ?auto_233049 - DIRECTION
      ?auto_233048 - MODE
    )
    :vars
    (
      ?auto_233053 - INSTRUMENT
      ?auto_233052 - SATELLITE
      ?auto_233054 - DIRECTION
      ?auto_233050 - DIRECTION
      ?auto_233051 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_233047 ?auto_233045 ) ) ( not ( = ?auto_233049 ?auto_233045 ) ) ( not ( = ?auto_233049 ?auto_233047 ) ) ( ON_BOARD ?auto_233053 ?auto_233052 ) ( SUPPORTS ?auto_233053 ?auto_233044 ) ( not ( = ?auto_233047 ?auto_233054 ) ) ( HAVE_IMAGE ?auto_233049 ?auto_233048 ) ( not ( = ?auto_233049 ?auto_233054 ) ) ( not ( = ?auto_233048 ?auto_233044 ) ) ( CALIBRATION_TARGET ?auto_233053 ?auto_233054 ) ( not ( = ?auto_233054 ?auto_233050 ) ) ( not ( = ?auto_233047 ?auto_233050 ) ) ( not ( = ?auto_233049 ?auto_233050 ) ) ( ON_BOARD ?auto_233051 ?auto_233052 ) ( POWER_ON ?auto_233051 ) ( not ( = ?auto_233053 ?auto_233051 ) ) ( POINTING ?auto_233052 ?auto_233054 ) ( HAVE_IMAGE ?auto_233045 ?auto_233046 ) ( not ( = ?auto_233045 ?auto_233054 ) ) ( not ( = ?auto_233045 ?auto_233050 ) ) ( not ( = ?auto_233046 ?auto_233044 ) ) ( not ( = ?auto_233046 ?auto_233048 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_233049 ?auto_233048 ?auto_233047 ?auto_233044 )
      ( GET-3IMAGE-VERIFY ?auto_233045 ?auto_233046 ?auto_233047 ?auto_233044 ?auto_233049 ?auto_233048 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_235950 - DIRECTION
      ?auto_235951 - MODE
      ?auto_235952 - DIRECTION
      ?auto_235949 - MODE
      ?auto_235954 - DIRECTION
      ?auto_235953 - MODE
    )
    :vars
    (
      ?auto_235957 - INSTRUMENT
      ?auto_235955 - SATELLITE
      ?auto_235956 - DIRECTION
      ?auto_235958 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_235952 ?auto_235950 ) ) ( not ( = ?auto_235954 ?auto_235950 ) ) ( not ( = ?auto_235954 ?auto_235952 ) ) ( ON_BOARD ?auto_235957 ?auto_235955 ) ( SUPPORTS ?auto_235957 ?auto_235951 ) ( not ( = ?auto_235950 ?auto_235956 ) ) ( HAVE_IMAGE ?auto_235952 ?auto_235949 ) ( not ( = ?auto_235952 ?auto_235956 ) ) ( not ( = ?auto_235949 ?auto_235951 ) ) ( CALIBRATION_TARGET ?auto_235957 ?auto_235956 ) ( not ( = ?auto_235956 ?auto_235954 ) ) ( ON_BOARD ?auto_235958 ?auto_235955 ) ( POWER_ON ?auto_235958 ) ( not ( = ?auto_235957 ?auto_235958 ) ) ( POINTING ?auto_235955 ?auto_235956 ) ( HAVE_IMAGE ?auto_235954 ?auto_235953 ) ( not ( = ?auto_235951 ?auto_235953 ) ) ( not ( = ?auto_235949 ?auto_235953 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_235952 ?auto_235949 ?auto_235950 ?auto_235951 )
      ( GET-3IMAGE-VERIFY ?auto_235950 ?auto_235951 ?auto_235952 ?auto_235949 ?auto_235954 ?auto_235953 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_233217 - DIRECTION
      ?auto_233218 - MODE
      ?auto_233219 - DIRECTION
      ?auto_233216 - MODE
      ?auto_233221 - DIRECTION
      ?auto_233220 - MODE
    )
    :vars
    (
      ?auto_233225 - INSTRUMENT
      ?auto_233224 - SATELLITE
      ?auto_233226 - DIRECTION
      ?auto_233222 - DIRECTION
      ?auto_233223 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_233219 ?auto_233217 ) ) ( not ( = ?auto_233221 ?auto_233217 ) ) ( not ( = ?auto_233221 ?auto_233219 ) ) ( ON_BOARD ?auto_233225 ?auto_233224 ) ( SUPPORTS ?auto_233225 ?auto_233218 ) ( not ( = ?auto_233217 ?auto_233226 ) ) ( HAVE_IMAGE ?auto_233221 ?auto_233220 ) ( not ( = ?auto_233221 ?auto_233226 ) ) ( not ( = ?auto_233220 ?auto_233218 ) ) ( CALIBRATION_TARGET ?auto_233225 ?auto_233226 ) ( not ( = ?auto_233226 ?auto_233222 ) ) ( not ( = ?auto_233217 ?auto_233222 ) ) ( not ( = ?auto_233221 ?auto_233222 ) ) ( ON_BOARD ?auto_233223 ?auto_233224 ) ( POWER_ON ?auto_233223 ) ( not ( = ?auto_233225 ?auto_233223 ) ) ( POINTING ?auto_233224 ?auto_233226 ) ( HAVE_IMAGE ?auto_233219 ?auto_233216 ) ( not ( = ?auto_233218 ?auto_233216 ) ) ( not ( = ?auto_233219 ?auto_233226 ) ) ( not ( = ?auto_233219 ?auto_233222 ) ) ( not ( = ?auto_233216 ?auto_233220 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_233221 ?auto_233220 ?auto_233217 ?auto_233218 )
      ( GET-3IMAGE-VERIFY ?auto_233217 ?auto_233218 ?auto_233219 ?auto_233216 ?auto_233221 ?auto_233220 ) )
  )

)

