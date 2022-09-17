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
      ?auto_28990 - DIRECTION
      ?auto_28991 - MODE
    )
    :vars
    (
      ?auto_28992 - INSTRUMENT
      ?auto_28993 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_28992 ) ( ON_BOARD ?auto_28992 ?auto_28993 ) ( SUPPORTS ?auto_28992 ?auto_28991 ) ( POWER_ON ?auto_28992 ) ( POINTING ?auto_28993 ?auto_28990 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_28993 ?auto_28990 ?auto_28992 ?auto_28991 )
      ( GET-1IMAGE-VERIFY ?auto_28990 ?auto_28991 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_29018 - DIRECTION
      ?auto_29019 - MODE
    )
    :vars
    (
      ?auto_29021 - INSTRUMENT
      ?auto_29020 - SATELLITE
      ?auto_29022 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_29021 ) ( ON_BOARD ?auto_29021 ?auto_29020 ) ( SUPPORTS ?auto_29021 ?auto_29019 ) ( POWER_ON ?auto_29021 ) ( POINTING ?auto_29020 ?auto_29022 ) ( not ( = ?auto_29018 ?auto_29022 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_29020 ?auto_29018 ?auto_29022 )
      ( GET-1IMAGE ?auto_29018 ?auto_29019 )
      ( GET-1IMAGE-VERIFY ?auto_29018 ?auto_29019 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_29050 - DIRECTION
      ?auto_29051 - MODE
    )
    :vars
    (
      ?auto_29053 - INSTRUMENT
      ?auto_29054 - SATELLITE
      ?auto_29052 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_29053 ?auto_29054 ) ( SUPPORTS ?auto_29053 ?auto_29051 ) ( POWER_ON ?auto_29053 ) ( POINTING ?auto_29054 ?auto_29052 ) ( not ( = ?auto_29050 ?auto_29052 ) ) ( CALIBRATION_TARGET ?auto_29053 ?auto_29052 ) ( NOT_CALIBRATED ?auto_29053 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_29054 ?auto_29053 ?auto_29052 )
      ( GET-1IMAGE ?auto_29050 ?auto_29051 )
      ( GET-1IMAGE-VERIFY ?auto_29050 ?auto_29051 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_29082 - DIRECTION
      ?auto_29083 - MODE
    )
    :vars
    (
      ?auto_29084 - INSTRUMENT
      ?auto_29085 - SATELLITE
      ?auto_29086 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_29084 ?auto_29085 ) ( SUPPORTS ?auto_29084 ?auto_29083 ) ( POINTING ?auto_29085 ?auto_29086 ) ( not ( = ?auto_29082 ?auto_29086 ) ) ( CALIBRATION_TARGET ?auto_29084 ?auto_29086 ) ( POWER_AVAIL ?auto_29085 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_29084 ?auto_29085 )
      ( GET-1IMAGE ?auto_29082 ?auto_29083 )
      ( GET-1IMAGE-VERIFY ?auto_29082 ?auto_29083 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_29114 - DIRECTION
      ?auto_29115 - MODE
    )
    :vars
    (
      ?auto_29118 - INSTRUMENT
      ?auto_29117 - SATELLITE
      ?auto_29116 - DIRECTION
      ?auto_29119 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_29118 ?auto_29117 ) ( SUPPORTS ?auto_29118 ?auto_29115 ) ( not ( = ?auto_29114 ?auto_29116 ) ) ( CALIBRATION_TARGET ?auto_29118 ?auto_29116 ) ( POWER_AVAIL ?auto_29117 ) ( POINTING ?auto_29117 ?auto_29119 ) ( not ( = ?auto_29116 ?auto_29119 ) ) ( not ( = ?auto_29114 ?auto_29119 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_29117 ?auto_29116 ?auto_29119 )
      ( GET-1IMAGE ?auto_29114 ?auto_29115 )
      ( GET-1IMAGE-VERIFY ?auto_29114 ?auto_29115 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29331 - DIRECTION
      ?auto_29332 - MODE
      ?auto_29333 - DIRECTION
      ?auto_29330 - MODE
    )
    :vars
    (
      ?auto_29335 - INSTRUMENT
      ?auto_29334 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_29333 ?auto_29331 ) ) ( CALIBRATED ?auto_29335 ) ( ON_BOARD ?auto_29335 ?auto_29334 ) ( SUPPORTS ?auto_29335 ?auto_29330 ) ( POWER_ON ?auto_29335 ) ( POINTING ?auto_29334 ?auto_29333 ) ( HAVE_IMAGE ?auto_29331 ?auto_29332 ) ( not ( = ?auto_29332 ?auto_29330 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_29333 ?auto_29330 )
      ( GET-2IMAGE-VERIFY ?auto_29331 ?auto_29332 ?auto_29333 ?auto_29330 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29337 - DIRECTION
      ?auto_29338 - MODE
      ?auto_29339 - DIRECTION
      ?auto_29336 - MODE
    )
    :vars
    (
      ?auto_29341 - INSTRUMENT
      ?auto_29340 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_29339 ?auto_29337 ) ) ( CALIBRATED ?auto_29341 ) ( ON_BOARD ?auto_29341 ?auto_29340 ) ( SUPPORTS ?auto_29341 ?auto_29338 ) ( POWER_ON ?auto_29341 ) ( POINTING ?auto_29340 ?auto_29337 ) ( HAVE_IMAGE ?auto_29339 ?auto_29336 ) ( not ( = ?auto_29338 ?auto_29336 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_29337 ?auto_29338 )
      ( GET-2IMAGE-VERIFY ?auto_29337 ?auto_29338 ?auto_29339 ?auto_29336 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29560 - DIRECTION
      ?auto_29561 - MODE
      ?auto_29562 - DIRECTION
      ?auto_29559 - MODE
    )
    :vars
    (
      ?auto_29563 - INSTRUMENT
      ?auto_29565 - SATELLITE
      ?auto_29564 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_29562 ?auto_29560 ) ) ( CALIBRATED ?auto_29563 ) ( ON_BOARD ?auto_29563 ?auto_29565 ) ( SUPPORTS ?auto_29563 ?auto_29559 ) ( POWER_ON ?auto_29563 ) ( POINTING ?auto_29565 ?auto_29564 ) ( not ( = ?auto_29562 ?auto_29564 ) ) ( HAVE_IMAGE ?auto_29560 ?auto_29561 ) ( not ( = ?auto_29560 ?auto_29564 ) ) ( not ( = ?auto_29561 ?auto_29559 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_29562 ?auto_29559 )
      ( GET-2IMAGE-VERIFY ?auto_29560 ?auto_29561 ?auto_29562 ?auto_29559 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29567 - DIRECTION
      ?auto_29568 - MODE
      ?auto_29569 - DIRECTION
      ?auto_29566 - MODE
    )
    :vars
    (
      ?auto_29571 - INSTRUMENT
      ?auto_29570 - SATELLITE
      ?auto_29572 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_29569 ?auto_29567 ) ) ( CALIBRATED ?auto_29571 ) ( ON_BOARD ?auto_29571 ?auto_29570 ) ( SUPPORTS ?auto_29571 ?auto_29568 ) ( POWER_ON ?auto_29571 ) ( POINTING ?auto_29570 ?auto_29572 ) ( not ( = ?auto_29567 ?auto_29572 ) ) ( HAVE_IMAGE ?auto_29569 ?auto_29566 ) ( not ( = ?auto_29569 ?auto_29572 ) ) ( not ( = ?auto_29566 ?auto_29568 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29569 ?auto_29566 ?auto_29567 ?auto_29568 )
      ( GET-2IMAGE-VERIFY ?auto_29567 ?auto_29568 ?auto_29569 ?auto_29566 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_29814 - DIRECTION
      ?auto_29815 - MODE
    )
    :vars
    (
      ?auto_29816 - DIRECTION
      ?auto_29818 - INSTRUMENT
      ?auto_29817 - SATELLITE
      ?auto_29819 - DIRECTION
      ?auto_29820 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_29814 ?auto_29816 ) ) ( ON_BOARD ?auto_29818 ?auto_29817 ) ( SUPPORTS ?auto_29818 ?auto_29815 ) ( POWER_ON ?auto_29818 ) ( POINTING ?auto_29817 ?auto_29819 ) ( not ( = ?auto_29814 ?auto_29819 ) ) ( HAVE_IMAGE ?auto_29816 ?auto_29820 ) ( not ( = ?auto_29816 ?auto_29819 ) ) ( not ( = ?auto_29820 ?auto_29815 ) ) ( CALIBRATION_TARGET ?auto_29818 ?auto_29819 ) ( NOT_CALIBRATED ?auto_29818 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_29817 ?auto_29818 ?auto_29819 )
      ( GET-2IMAGE ?auto_29816 ?auto_29820 ?auto_29814 ?auto_29815 )
      ( GET-1IMAGE-VERIFY ?auto_29814 ?auto_29815 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29822 - DIRECTION
      ?auto_29823 - MODE
      ?auto_29824 - DIRECTION
      ?auto_29821 - MODE
    )
    :vars
    (
      ?auto_29827 - INSTRUMENT
      ?auto_29825 - SATELLITE
      ?auto_29826 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_29824 ?auto_29822 ) ) ( ON_BOARD ?auto_29827 ?auto_29825 ) ( SUPPORTS ?auto_29827 ?auto_29821 ) ( POWER_ON ?auto_29827 ) ( POINTING ?auto_29825 ?auto_29826 ) ( not ( = ?auto_29824 ?auto_29826 ) ) ( HAVE_IMAGE ?auto_29822 ?auto_29823 ) ( not ( = ?auto_29822 ?auto_29826 ) ) ( not ( = ?auto_29823 ?auto_29821 ) ) ( CALIBRATION_TARGET ?auto_29827 ?auto_29826 ) ( NOT_CALIBRATED ?auto_29827 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_29824 ?auto_29821 )
      ( GET-2IMAGE-VERIFY ?auto_29822 ?auto_29823 ?auto_29824 ?auto_29821 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_29829 - DIRECTION
      ?auto_29830 - MODE
      ?auto_29831 - DIRECTION
      ?auto_29828 - MODE
    )
    :vars
    (
      ?auto_29834 - INSTRUMENT
      ?auto_29832 - SATELLITE
      ?auto_29833 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_29831 ?auto_29829 ) ) ( ON_BOARD ?auto_29834 ?auto_29832 ) ( SUPPORTS ?auto_29834 ?auto_29830 ) ( POWER_ON ?auto_29834 ) ( POINTING ?auto_29832 ?auto_29833 ) ( not ( = ?auto_29829 ?auto_29833 ) ) ( HAVE_IMAGE ?auto_29831 ?auto_29828 ) ( not ( = ?auto_29831 ?auto_29833 ) ) ( not ( = ?auto_29828 ?auto_29830 ) ) ( CALIBRATION_TARGET ?auto_29834 ?auto_29833 ) ( NOT_CALIBRATED ?auto_29834 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_29831 ?auto_29828 ?auto_29829 ?auto_29830 )
      ( GET-2IMAGE-VERIFY ?auto_29829 ?auto_29830 ?auto_29831 ?auto_29828 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_30076 - DIRECTION
      ?auto_30077 - MODE
    )
    :vars
    (
      ?auto_30078 - DIRECTION
      ?auto_30082 - INSTRUMENT
      ?auto_30079 - SATELLITE
      ?auto_30081 - DIRECTION
      ?auto_30080 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_30076 ?auto_30078 ) ) ( ON_BOARD ?auto_30082 ?auto_30079 ) ( SUPPORTS ?auto_30082 ?auto_30077 ) ( POINTING ?auto_30079 ?auto_30081 ) ( not ( = ?auto_30076 ?auto_30081 ) ) ( HAVE_IMAGE ?auto_30078 ?auto_30080 ) ( not ( = ?auto_30078 ?auto_30081 ) ) ( not ( = ?auto_30080 ?auto_30077 ) ) ( CALIBRATION_TARGET ?auto_30082 ?auto_30081 ) ( POWER_AVAIL ?auto_30079 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_30082 ?auto_30079 )
      ( GET-2IMAGE ?auto_30078 ?auto_30080 ?auto_30076 ?auto_30077 )
      ( GET-1IMAGE-VERIFY ?auto_30076 ?auto_30077 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30084 - DIRECTION
      ?auto_30085 - MODE
      ?auto_30086 - DIRECTION
      ?auto_30083 - MODE
    )
    :vars
    (
      ?auto_30089 - INSTRUMENT
      ?auto_30087 - SATELLITE
      ?auto_30088 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_30086 ?auto_30084 ) ) ( ON_BOARD ?auto_30089 ?auto_30087 ) ( SUPPORTS ?auto_30089 ?auto_30083 ) ( POINTING ?auto_30087 ?auto_30088 ) ( not ( = ?auto_30086 ?auto_30088 ) ) ( HAVE_IMAGE ?auto_30084 ?auto_30085 ) ( not ( = ?auto_30084 ?auto_30088 ) ) ( not ( = ?auto_30085 ?auto_30083 ) ) ( CALIBRATION_TARGET ?auto_30089 ?auto_30088 ) ( POWER_AVAIL ?auto_30087 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_30086 ?auto_30083 )
      ( GET-2IMAGE-VERIFY ?auto_30084 ?auto_30085 ?auto_30086 ?auto_30083 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30091 - DIRECTION
      ?auto_30092 - MODE
      ?auto_30093 - DIRECTION
      ?auto_30090 - MODE
    )
    :vars
    (
      ?auto_30094 - INSTRUMENT
      ?auto_30096 - SATELLITE
      ?auto_30095 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_30093 ?auto_30091 ) ) ( ON_BOARD ?auto_30094 ?auto_30096 ) ( SUPPORTS ?auto_30094 ?auto_30092 ) ( POINTING ?auto_30096 ?auto_30095 ) ( not ( = ?auto_30091 ?auto_30095 ) ) ( HAVE_IMAGE ?auto_30093 ?auto_30090 ) ( not ( = ?auto_30093 ?auto_30095 ) ) ( not ( = ?auto_30090 ?auto_30092 ) ) ( CALIBRATION_TARGET ?auto_30094 ?auto_30095 ) ( POWER_AVAIL ?auto_30096 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30093 ?auto_30090 ?auto_30091 ?auto_30092 )
      ( GET-2IMAGE-VERIFY ?auto_30091 ?auto_30092 ?auto_30093 ?auto_30090 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_30338 - DIRECTION
      ?auto_30339 - MODE
    )
    :vars
    (
      ?auto_30344 - DIRECTION
      ?auto_30340 - INSTRUMENT
      ?auto_30343 - SATELLITE
      ?auto_30341 - DIRECTION
      ?auto_30342 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_30338 ?auto_30344 ) ) ( ON_BOARD ?auto_30340 ?auto_30343 ) ( SUPPORTS ?auto_30340 ?auto_30339 ) ( not ( = ?auto_30338 ?auto_30341 ) ) ( HAVE_IMAGE ?auto_30344 ?auto_30342 ) ( not ( = ?auto_30344 ?auto_30341 ) ) ( not ( = ?auto_30342 ?auto_30339 ) ) ( CALIBRATION_TARGET ?auto_30340 ?auto_30341 ) ( POWER_AVAIL ?auto_30343 ) ( POINTING ?auto_30343 ?auto_30344 ) )
    :subtasks
    ( ( !TURN_TO ?auto_30343 ?auto_30341 ?auto_30344 )
      ( GET-2IMAGE ?auto_30344 ?auto_30342 ?auto_30338 ?auto_30339 )
      ( GET-1IMAGE-VERIFY ?auto_30338 ?auto_30339 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30346 - DIRECTION
      ?auto_30347 - MODE
      ?auto_30348 - DIRECTION
      ?auto_30345 - MODE
    )
    :vars
    (
      ?auto_30349 - INSTRUMENT
      ?auto_30351 - SATELLITE
      ?auto_30350 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_30348 ?auto_30346 ) ) ( ON_BOARD ?auto_30349 ?auto_30351 ) ( SUPPORTS ?auto_30349 ?auto_30345 ) ( not ( = ?auto_30348 ?auto_30350 ) ) ( HAVE_IMAGE ?auto_30346 ?auto_30347 ) ( not ( = ?auto_30346 ?auto_30350 ) ) ( not ( = ?auto_30347 ?auto_30345 ) ) ( CALIBRATION_TARGET ?auto_30349 ?auto_30350 ) ( POWER_AVAIL ?auto_30351 ) ( POINTING ?auto_30351 ?auto_30346 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_30348 ?auto_30345 )
      ( GET-2IMAGE-VERIFY ?auto_30346 ?auto_30347 ?auto_30348 ?auto_30345 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30353 - DIRECTION
      ?auto_30354 - MODE
      ?auto_30355 - DIRECTION
      ?auto_30352 - MODE
    )
    :vars
    (
      ?auto_30357 - INSTRUMENT
      ?auto_30358 - SATELLITE
      ?auto_30356 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_30355 ?auto_30353 ) ) ( ON_BOARD ?auto_30357 ?auto_30358 ) ( SUPPORTS ?auto_30357 ?auto_30354 ) ( not ( = ?auto_30353 ?auto_30356 ) ) ( HAVE_IMAGE ?auto_30355 ?auto_30352 ) ( not ( = ?auto_30355 ?auto_30356 ) ) ( not ( = ?auto_30352 ?auto_30354 ) ) ( CALIBRATION_TARGET ?auto_30357 ?auto_30356 ) ( POWER_AVAIL ?auto_30358 ) ( POINTING ?auto_30358 ?auto_30355 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30355 ?auto_30352 ?auto_30353 ?auto_30354 )
      ( GET-2IMAGE-VERIFY ?auto_30353 ?auto_30354 ?auto_30355 ?auto_30352 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_30600 - DIRECTION
      ?auto_30601 - MODE
    )
    :vars
    (
      ?auto_30602 - DIRECTION
      ?auto_30605 - INSTRUMENT
      ?auto_30606 - SATELLITE
      ?auto_30603 - DIRECTION
      ?auto_30604 - MODE
      ?auto_30607 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30600 ?auto_30602 ) ) ( ON_BOARD ?auto_30605 ?auto_30606 ) ( SUPPORTS ?auto_30605 ?auto_30601 ) ( not ( = ?auto_30600 ?auto_30603 ) ) ( HAVE_IMAGE ?auto_30602 ?auto_30604 ) ( not ( = ?auto_30602 ?auto_30603 ) ) ( not ( = ?auto_30604 ?auto_30601 ) ) ( CALIBRATION_TARGET ?auto_30605 ?auto_30603 ) ( POINTING ?auto_30606 ?auto_30602 ) ( ON_BOARD ?auto_30607 ?auto_30606 ) ( POWER_ON ?auto_30607 ) ( not ( = ?auto_30605 ?auto_30607 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_30607 ?auto_30606 )
      ( GET-2IMAGE ?auto_30602 ?auto_30604 ?auto_30600 ?auto_30601 )
      ( GET-1IMAGE-VERIFY ?auto_30600 ?auto_30601 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30609 - DIRECTION
      ?auto_30610 - MODE
      ?auto_30611 - DIRECTION
      ?auto_30608 - MODE
    )
    :vars
    (
      ?auto_30612 - INSTRUMENT
      ?auto_30615 - SATELLITE
      ?auto_30614 - DIRECTION
      ?auto_30613 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30611 ?auto_30609 ) ) ( ON_BOARD ?auto_30612 ?auto_30615 ) ( SUPPORTS ?auto_30612 ?auto_30608 ) ( not ( = ?auto_30611 ?auto_30614 ) ) ( HAVE_IMAGE ?auto_30609 ?auto_30610 ) ( not ( = ?auto_30609 ?auto_30614 ) ) ( not ( = ?auto_30610 ?auto_30608 ) ) ( CALIBRATION_TARGET ?auto_30612 ?auto_30614 ) ( POINTING ?auto_30615 ?auto_30609 ) ( ON_BOARD ?auto_30613 ?auto_30615 ) ( POWER_ON ?auto_30613 ) ( not ( = ?auto_30612 ?auto_30613 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_30611 ?auto_30608 )
      ( GET-2IMAGE-VERIFY ?auto_30609 ?auto_30610 ?auto_30611 ?auto_30608 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30617 - DIRECTION
      ?auto_30618 - MODE
      ?auto_30619 - DIRECTION
      ?auto_30616 - MODE
    )
    :vars
    (
      ?auto_30622 - INSTRUMENT
      ?auto_30620 - SATELLITE
      ?auto_30623 - DIRECTION
      ?auto_30621 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30619 ?auto_30617 ) ) ( ON_BOARD ?auto_30622 ?auto_30620 ) ( SUPPORTS ?auto_30622 ?auto_30618 ) ( not ( = ?auto_30617 ?auto_30623 ) ) ( HAVE_IMAGE ?auto_30619 ?auto_30616 ) ( not ( = ?auto_30619 ?auto_30623 ) ) ( not ( = ?auto_30616 ?auto_30618 ) ) ( CALIBRATION_TARGET ?auto_30622 ?auto_30623 ) ( POINTING ?auto_30620 ?auto_30619 ) ( ON_BOARD ?auto_30621 ?auto_30620 ) ( POWER_ON ?auto_30621 ) ( not ( = ?auto_30622 ?auto_30621 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30619 ?auto_30616 ?auto_30617 ?auto_30618 )
      ( GET-2IMAGE-VERIFY ?auto_30617 ?auto_30618 ?auto_30619 ?auto_30616 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_30888 - DIRECTION
      ?auto_30889 - MODE
    )
    :vars
    (
      ?auto_30890 - DIRECTION
      ?auto_30894 - INSTRUMENT
      ?auto_30892 - SATELLITE
      ?auto_30895 - DIRECTION
      ?auto_30891 - MODE
      ?auto_30893 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30888 ?auto_30890 ) ) ( ON_BOARD ?auto_30894 ?auto_30892 ) ( SUPPORTS ?auto_30894 ?auto_30889 ) ( not ( = ?auto_30888 ?auto_30895 ) ) ( not ( = ?auto_30890 ?auto_30895 ) ) ( not ( = ?auto_30891 ?auto_30889 ) ) ( CALIBRATION_TARGET ?auto_30894 ?auto_30895 ) ( POINTING ?auto_30892 ?auto_30890 ) ( ON_BOARD ?auto_30893 ?auto_30892 ) ( POWER_ON ?auto_30893 ) ( not ( = ?auto_30894 ?auto_30893 ) ) ( CALIBRATED ?auto_30893 ) ( SUPPORTS ?auto_30893 ?auto_30891 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_30890 ?auto_30891 )
      ( GET-2IMAGE ?auto_30890 ?auto_30891 ?auto_30888 ?auto_30889 )
      ( GET-1IMAGE-VERIFY ?auto_30888 ?auto_30889 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30897 - DIRECTION
      ?auto_30898 - MODE
      ?auto_30899 - DIRECTION
      ?auto_30896 - MODE
    )
    :vars
    (
      ?auto_30902 - INSTRUMENT
      ?auto_30901 - SATELLITE
      ?auto_30900 - DIRECTION
      ?auto_30903 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30899 ?auto_30897 ) ) ( ON_BOARD ?auto_30902 ?auto_30901 ) ( SUPPORTS ?auto_30902 ?auto_30896 ) ( not ( = ?auto_30899 ?auto_30900 ) ) ( not ( = ?auto_30897 ?auto_30900 ) ) ( not ( = ?auto_30898 ?auto_30896 ) ) ( CALIBRATION_TARGET ?auto_30902 ?auto_30900 ) ( POINTING ?auto_30901 ?auto_30897 ) ( ON_BOARD ?auto_30903 ?auto_30901 ) ( POWER_ON ?auto_30903 ) ( not ( = ?auto_30902 ?auto_30903 ) ) ( CALIBRATED ?auto_30903 ) ( SUPPORTS ?auto_30903 ?auto_30898 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_30899 ?auto_30896 )
      ( GET-2IMAGE-VERIFY ?auto_30897 ?auto_30898 ?auto_30899 ?auto_30896 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_30905 - DIRECTION
      ?auto_30906 - MODE
      ?auto_30907 - DIRECTION
      ?auto_30904 - MODE
    )
    :vars
    (
      ?auto_30911 - INSTRUMENT
      ?auto_30910 - SATELLITE
      ?auto_30908 - DIRECTION
      ?auto_30909 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_30907 ?auto_30905 ) ) ( ON_BOARD ?auto_30911 ?auto_30910 ) ( SUPPORTS ?auto_30911 ?auto_30906 ) ( not ( = ?auto_30905 ?auto_30908 ) ) ( not ( = ?auto_30907 ?auto_30908 ) ) ( not ( = ?auto_30904 ?auto_30906 ) ) ( CALIBRATION_TARGET ?auto_30911 ?auto_30908 ) ( POINTING ?auto_30910 ?auto_30907 ) ( ON_BOARD ?auto_30909 ?auto_30910 ) ( POWER_ON ?auto_30909 ) ( not ( = ?auto_30911 ?auto_30909 ) ) ( CALIBRATED ?auto_30909 ) ( SUPPORTS ?auto_30909 ?auto_30904 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_30907 ?auto_30904 ?auto_30905 ?auto_30906 )
      ( GET-2IMAGE-VERIFY ?auto_30905 ?auto_30906 ?auto_30907 ?auto_30904 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_31176 - DIRECTION
      ?auto_31177 - MODE
    )
    :vars
    (
      ?auto_31178 - DIRECTION
      ?auto_31183 - INSTRUMENT
      ?auto_31182 - SATELLITE
      ?auto_31180 - DIRECTION
      ?auto_31179 - MODE
      ?auto_31181 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31176 ?auto_31178 ) ) ( ON_BOARD ?auto_31183 ?auto_31182 ) ( SUPPORTS ?auto_31183 ?auto_31177 ) ( not ( = ?auto_31176 ?auto_31180 ) ) ( not ( = ?auto_31178 ?auto_31180 ) ) ( not ( = ?auto_31179 ?auto_31177 ) ) ( CALIBRATION_TARGET ?auto_31183 ?auto_31180 ) ( ON_BOARD ?auto_31181 ?auto_31182 ) ( POWER_ON ?auto_31181 ) ( not ( = ?auto_31183 ?auto_31181 ) ) ( CALIBRATED ?auto_31181 ) ( SUPPORTS ?auto_31181 ?auto_31179 ) ( POINTING ?auto_31182 ?auto_31180 ) )
    :subtasks
    ( ( !TURN_TO ?auto_31182 ?auto_31178 ?auto_31180 )
      ( GET-2IMAGE ?auto_31178 ?auto_31179 ?auto_31176 ?auto_31177 )
      ( GET-1IMAGE-VERIFY ?auto_31176 ?auto_31177 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31185 - DIRECTION
      ?auto_31186 - MODE
      ?auto_31187 - DIRECTION
      ?auto_31184 - MODE
    )
    :vars
    (
      ?auto_31189 - INSTRUMENT
      ?auto_31190 - SATELLITE
      ?auto_31191 - DIRECTION
      ?auto_31188 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31187 ?auto_31185 ) ) ( ON_BOARD ?auto_31189 ?auto_31190 ) ( SUPPORTS ?auto_31189 ?auto_31184 ) ( not ( = ?auto_31187 ?auto_31191 ) ) ( not ( = ?auto_31185 ?auto_31191 ) ) ( not ( = ?auto_31186 ?auto_31184 ) ) ( CALIBRATION_TARGET ?auto_31189 ?auto_31191 ) ( ON_BOARD ?auto_31188 ?auto_31190 ) ( POWER_ON ?auto_31188 ) ( not ( = ?auto_31189 ?auto_31188 ) ) ( CALIBRATED ?auto_31188 ) ( SUPPORTS ?auto_31188 ?auto_31186 ) ( POINTING ?auto_31190 ?auto_31191 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_31187 ?auto_31184 )
      ( GET-2IMAGE-VERIFY ?auto_31185 ?auto_31186 ?auto_31187 ?auto_31184 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31193 - DIRECTION
      ?auto_31194 - MODE
      ?auto_31195 - DIRECTION
      ?auto_31192 - MODE
    )
    :vars
    (
      ?auto_31198 - INSTRUMENT
      ?auto_31197 - SATELLITE
      ?auto_31196 - DIRECTION
      ?auto_31199 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31195 ?auto_31193 ) ) ( ON_BOARD ?auto_31198 ?auto_31197 ) ( SUPPORTS ?auto_31198 ?auto_31194 ) ( not ( = ?auto_31193 ?auto_31196 ) ) ( not ( = ?auto_31195 ?auto_31196 ) ) ( not ( = ?auto_31192 ?auto_31194 ) ) ( CALIBRATION_TARGET ?auto_31198 ?auto_31196 ) ( ON_BOARD ?auto_31199 ?auto_31197 ) ( POWER_ON ?auto_31199 ) ( not ( = ?auto_31198 ?auto_31199 ) ) ( CALIBRATED ?auto_31199 ) ( SUPPORTS ?auto_31199 ?auto_31192 ) ( POINTING ?auto_31197 ?auto_31196 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31195 ?auto_31192 ?auto_31193 ?auto_31194 )
      ( GET-2IMAGE-VERIFY ?auto_31193 ?auto_31194 ?auto_31195 ?auto_31192 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_31464 - DIRECTION
      ?auto_31465 - MODE
    )
    :vars
    (
      ?auto_31469 - DIRECTION
      ?auto_31468 - INSTRUMENT
      ?auto_31467 - SATELLITE
      ?auto_31466 - DIRECTION
      ?auto_31470 - MODE
      ?auto_31471 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31464 ?auto_31469 ) ) ( ON_BOARD ?auto_31468 ?auto_31467 ) ( SUPPORTS ?auto_31468 ?auto_31465 ) ( not ( = ?auto_31464 ?auto_31466 ) ) ( not ( = ?auto_31469 ?auto_31466 ) ) ( not ( = ?auto_31470 ?auto_31465 ) ) ( CALIBRATION_TARGET ?auto_31468 ?auto_31466 ) ( ON_BOARD ?auto_31471 ?auto_31467 ) ( POWER_ON ?auto_31471 ) ( not ( = ?auto_31468 ?auto_31471 ) ) ( SUPPORTS ?auto_31471 ?auto_31470 ) ( POINTING ?auto_31467 ?auto_31466 ) ( CALIBRATION_TARGET ?auto_31471 ?auto_31466 ) ( NOT_CALIBRATED ?auto_31471 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_31467 ?auto_31471 ?auto_31466 )
      ( GET-2IMAGE ?auto_31469 ?auto_31470 ?auto_31464 ?auto_31465 )
      ( GET-1IMAGE-VERIFY ?auto_31464 ?auto_31465 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31473 - DIRECTION
      ?auto_31474 - MODE
      ?auto_31475 - DIRECTION
      ?auto_31472 - MODE
    )
    :vars
    (
      ?auto_31479 - INSTRUMENT
      ?auto_31478 - SATELLITE
      ?auto_31476 - DIRECTION
      ?auto_31477 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31475 ?auto_31473 ) ) ( ON_BOARD ?auto_31479 ?auto_31478 ) ( SUPPORTS ?auto_31479 ?auto_31472 ) ( not ( = ?auto_31475 ?auto_31476 ) ) ( not ( = ?auto_31473 ?auto_31476 ) ) ( not ( = ?auto_31474 ?auto_31472 ) ) ( CALIBRATION_TARGET ?auto_31479 ?auto_31476 ) ( ON_BOARD ?auto_31477 ?auto_31478 ) ( POWER_ON ?auto_31477 ) ( not ( = ?auto_31479 ?auto_31477 ) ) ( SUPPORTS ?auto_31477 ?auto_31474 ) ( POINTING ?auto_31478 ?auto_31476 ) ( CALIBRATION_TARGET ?auto_31477 ?auto_31476 ) ( NOT_CALIBRATED ?auto_31477 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_31475 ?auto_31472 )
      ( GET-2IMAGE-VERIFY ?auto_31473 ?auto_31474 ?auto_31475 ?auto_31472 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_31481 - DIRECTION
      ?auto_31482 - MODE
      ?auto_31483 - DIRECTION
      ?auto_31480 - MODE
    )
    :vars
    (
      ?auto_31487 - INSTRUMENT
      ?auto_31485 - SATELLITE
      ?auto_31484 - DIRECTION
      ?auto_31486 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_31483 ?auto_31481 ) ) ( ON_BOARD ?auto_31487 ?auto_31485 ) ( SUPPORTS ?auto_31487 ?auto_31482 ) ( not ( = ?auto_31481 ?auto_31484 ) ) ( not ( = ?auto_31483 ?auto_31484 ) ) ( not ( = ?auto_31480 ?auto_31482 ) ) ( CALIBRATION_TARGET ?auto_31487 ?auto_31484 ) ( ON_BOARD ?auto_31486 ?auto_31485 ) ( POWER_ON ?auto_31486 ) ( not ( = ?auto_31487 ?auto_31486 ) ) ( SUPPORTS ?auto_31486 ?auto_31480 ) ( POINTING ?auto_31485 ?auto_31484 ) ( CALIBRATION_TARGET ?auto_31486 ?auto_31484 ) ( NOT_CALIBRATED ?auto_31486 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_31483 ?auto_31480 ?auto_31481 ?auto_31482 )
      ( GET-2IMAGE-VERIFY ?auto_31481 ?auto_31482 ?auto_31483 ?auto_31480 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_32974 - DIRECTION
      ?auto_32975 - MODE
      ?auto_32976 - DIRECTION
      ?auto_32973 - MODE
      ?auto_32978 - DIRECTION
      ?auto_32977 - MODE
    )
    :vars
    (
      ?auto_32980 - INSTRUMENT
      ?auto_32979 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_32976 ?auto_32974 ) ) ( not ( = ?auto_32978 ?auto_32974 ) ) ( not ( = ?auto_32978 ?auto_32976 ) ) ( CALIBRATED ?auto_32980 ) ( ON_BOARD ?auto_32980 ?auto_32979 ) ( SUPPORTS ?auto_32980 ?auto_32977 ) ( POWER_ON ?auto_32980 ) ( POINTING ?auto_32979 ?auto_32978 ) ( HAVE_IMAGE ?auto_32974 ?auto_32975 ) ( HAVE_IMAGE ?auto_32976 ?auto_32973 ) ( not ( = ?auto_32975 ?auto_32973 ) ) ( not ( = ?auto_32975 ?auto_32977 ) ) ( not ( = ?auto_32973 ?auto_32977 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_32978 ?auto_32977 )
      ( GET-3IMAGE-VERIFY ?auto_32974 ?auto_32975 ?auto_32976 ?auto_32973 ?auto_32978 ?auto_32977 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_32990 - DIRECTION
      ?auto_32991 - MODE
      ?auto_32992 - DIRECTION
      ?auto_32989 - MODE
      ?auto_32994 - DIRECTION
      ?auto_32993 - MODE
    )
    :vars
    (
      ?auto_32996 - INSTRUMENT
      ?auto_32995 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_32992 ?auto_32990 ) ) ( not ( = ?auto_32994 ?auto_32990 ) ) ( not ( = ?auto_32994 ?auto_32992 ) ) ( CALIBRATED ?auto_32996 ) ( ON_BOARD ?auto_32996 ?auto_32995 ) ( SUPPORTS ?auto_32996 ?auto_32989 ) ( POWER_ON ?auto_32996 ) ( POINTING ?auto_32995 ?auto_32992 ) ( HAVE_IMAGE ?auto_32990 ?auto_32991 ) ( HAVE_IMAGE ?auto_32994 ?auto_32993 ) ( not ( = ?auto_32991 ?auto_32989 ) ) ( not ( = ?auto_32991 ?auto_32993 ) ) ( not ( = ?auto_32989 ?auto_32993 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_32992 ?auto_32989 )
      ( GET-3IMAGE-VERIFY ?auto_32990 ?auto_32991 ?auto_32992 ?auto_32989 ?auto_32994 ?auto_32993 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_33050 - DIRECTION
      ?auto_33051 - MODE
      ?auto_33052 - DIRECTION
      ?auto_33049 - MODE
      ?auto_33054 - DIRECTION
      ?auto_33053 - MODE
    )
    :vars
    (
      ?auto_33056 - INSTRUMENT
      ?auto_33055 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_33052 ?auto_33050 ) ) ( not ( = ?auto_33054 ?auto_33050 ) ) ( not ( = ?auto_33054 ?auto_33052 ) ) ( CALIBRATED ?auto_33056 ) ( ON_BOARD ?auto_33056 ?auto_33055 ) ( SUPPORTS ?auto_33056 ?auto_33051 ) ( POWER_ON ?auto_33056 ) ( POINTING ?auto_33055 ?auto_33050 ) ( HAVE_IMAGE ?auto_33052 ?auto_33049 ) ( HAVE_IMAGE ?auto_33054 ?auto_33053 ) ( not ( = ?auto_33051 ?auto_33049 ) ) ( not ( = ?auto_33051 ?auto_33053 ) ) ( not ( = ?auto_33049 ?auto_33053 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_33050 ?auto_33051 )
      ( GET-3IMAGE-VERIFY ?auto_33050 ?auto_33051 ?auto_33052 ?auto_33049 ?auto_33054 ?auto_33053 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_33807 - DIRECTION
      ?auto_33808 - MODE
      ?auto_33809 - DIRECTION
      ?auto_33806 - MODE
      ?auto_33811 - DIRECTION
      ?auto_33810 - MODE
    )
    :vars
    (
      ?auto_33812 - INSTRUMENT
      ?auto_33813 - SATELLITE
      ?auto_33814 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_33809 ?auto_33807 ) ) ( not ( = ?auto_33811 ?auto_33807 ) ) ( not ( = ?auto_33811 ?auto_33809 ) ) ( CALIBRATED ?auto_33812 ) ( ON_BOARD ?auto_33812 ?auto_33813 ) ( SUPPORTS ?auto_33812 ?auto_33810 ) ( POWER_ON ?auto_33812 ) ( POINTING ?auto_33813 ?auto_33814 ) ( not ( = ?auto_33811 ?auto_33814 ) ) ( HAVE_IMAGE ?auto_33807 ?auto_33808 ) ( not ( = ?auto_33807 ?auto_33814 ) ) ( not ( = ?auto_33808 ?auto_33810 ) ) ( HAVE_IMAGE ?auto_33809 ?auto_33806 ) ( not ( = ?auto_33808 ?auto_33806 ) ) ( not ( = ?auto_33809 ?auto_33814 ) ) ( not ( = ?auto_33806 ?auto_33810 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_33807 ?auto_33808 ?auto_33811 ?auto_33810 )
      ( GET-3IMAGE-VERIFY ?auto_33807 ?auto_33808 ?auto_33809 ?auto_33806 ?auto_33811 ?auto_33810 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_33825 - DIRECTION
      ?auto_33826 - MODE
      ?auto_33827 - DIRECTION
      ?auto_33824 - MODE
      ?auto_33829 - DIRECTION
      ?auto_33828 - MODE
    )
    :vars
    (
      ?auto_33830 - INSTRUMENT
      ?auto_33831 - SATELLITE
      ?auto_33832 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_33827 ?auto_33825 ) ) ( not ( = ?auto_33829 ?auto_33825 ) ) ( not ( = ?auto_33829 ?auto_33827 ) ) ( CALIBRATED ?auto_33830 ) ( ON_BOARD ?auto_33830 ?auto_33831 ) ( SUPPORTS ?auto_33830 ?auto_33824 ) ( POWER_ON ?auto_33830 ) ( POINTING ?auto_33831 ?auto_33832 ) ( not ( = ?auto_33827 ?auto_33832 ) ) ( HAVE_IMAGE ?auto_33825 ?auto_33826 ) ( not ( = ?auto_33825 ?auto_33832 ) ) ( not ( = ?auto_33826 ?auto_33824 ) ) ( HAVE_IMAGE ?auto_33829 ?auto_33828 ) ( not ( = ?auto_33826 ?auto_33828 ) ) ( not ( = ?auto_33824 ?auto_33828 ) ) ( not ( = ?auto_33829 ?auto_33832 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_33825 ?auto_33826 ?auto_33827 ?auto_33824 )
      ( GET-3IMAGE-VERIFY ?auto_33825 ?auto_33826 ?auto_33827 ?auto_33824 ?auto_33829 ?auto_33828 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_33897 - DIRECTION
      ?auto_33898 - MODE
      ?auto_33899 - DIRECTION
      ?auto_33896 - MODE
      ?auto_33901 - DIRECTION
      ?auto_33900 - MODE
    )
    :vars
    (
      ?auto_33902 - INSTRUMENT
      ?auto_33903 - SATELLITE
      ?auto_33904 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_33899 ?auto_33897 ) ) ( not ( = ?auto_33901 ?auto_33897 ) ) ( not ( = ?auto_33901 ?auto_33899 ) ) ( CALIBRATED ?auto_33902 ) ( ON_BOARD ?auto_33902 ?auto_33903 ) ( SUPPORTS ?auto_33902 ?auto_33898 ) ( POWER_ON ?auto_33902 ) ( POINTING ?auto_33903 ?auto_33904 ) ( not ( = ?auto_33897 ?auto_33904 ) ) ( HAVE_IMAGE ?auto_33899 ?auto_33896 ) ( not ( = ?auto_33899 ?auto_33904 ) ) ( not ( = ?auto_33896 ?auto_33898 ) ) ( HAVE_IMAGE ?auto_33901 ?auto_33900 ) ( not ( = ?auto_33898 ?auto_33900 ) ) ( not ( = ?auto_33896 ?auto_33900 ) ) ( not ( = ?auto_33901 ?auto_33904 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_33899 ?auto_33896 ?auto_33897 ?auto_33898 )
      ( GET-3IMAGE-VERIFY ?auto_33897 ?auto_33898 ?auto_33899 ?auto_33896 ?auto_33901 ?auto_33900 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_34766 - DIRECTION
      ?auto_34767 - MODE
      ?auto_34768 - DIRECTION
      ?auto_34765 - MODE
      ?auto_34770 - DIRECTION
      ?auto_34769 - MODE
    )
    :vars
    (
      ?auto_34773 - INSTRUMENT
      ?auto_34771 - SATELLITE
      ?auto_34772 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_34768 ?auto_34766 ) ) ( not ( = ?auto_34770 ?auto_34766 ) ) ( not ( = ?auto_34770 ?auto_34768 ) ) ( ON_BOARD ?auto_34773 ?auto_34771 ) ( SUPPORTS ?auto_34773 ?auto_34769 ) ( POWER_ON ?auto_34773 ) ( POINTING ?auto_34771 ?auto_34772 ) ( not ( = ?auto_34770 ?auto_34772 ) ) ( HAVE_IMAGE ?auto_34766 ?auto_34767 ) ( not ( = ?auto_34766 ?auto_34772 ) ) ( not ( = ?auto_34767 ?auto_34769 ) ) ( CALIBRATION_TARGET ?auto_34773 ?auto_34772 ) ( NOT_CALIBRATED ?auto_34773 ) ( HAVE_IMAGE ?auto_34768 ?auto_34765 ) ( not ( = ?auto_34767 ?auto_34765 ) ) ( not ( = ?auto_34768 ?auto_34772 ) ) ( not ( = ?auto_34765 ?auto_34769 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34766 ?auto_34767 ?auto_34770 ?auto_34769 )
      ( GET-3IMAGE-VERIFY ?auto_34766 ?auto_34767 ?auto_34768 ?auto_34765 ?auto_34770 ?auto_34769 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_34784 - DIRECTION
      ?auto_34785 - MODE
      ?auto_34786 - DIRECTION
      ?auto_34783 - MODE
      ?auto_34788 - DIRECTION
      ?auto_34787 - MODE
    )
    :vars
    (
      ?auto_34791 - INSTRUMENT
      ?auto_34789 - SATELLITE
      ?auto_34790 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_34786 ?auto_34784 ) ) ( not ( = ?auto_34788 ?auto_34784 ) ) ( not ( = ?auto_34788 ?auto_34786 ) ) ( ON_BOARD ?auto_34791 ?auto_34789 ) ( SUPPORTS ?auto_34791 ?auto_34783 ) ( POWER_ON ?auto_34791 ) ( POINTING ?auto_34789 ?auto_34790 ) ( not ( = ?auto_34786 ?auto_34790 ) ) ( HAVE_IMAGE ?auto_34784 ?auto_34785 ) ( not ( = ?auto_34784 ?auto_34790 ) ) ( not ( = ?auto_34785 ?auto_34783 ) ) ( CALIBRATION_TARGET ?auto_34791 ?auto_34790 ) ( NOT_CALIBRATED ?auto_34791 ) ( HAVE_IMAGE ?auto_34788 ?auto_34787 ) ( not ( = ?auto_34785 ?auto_34787 ) ) ( not ( = ?auto_34783 ?auto_34787 ) ) ( not ( = ?auto_34788 ?auto_34790 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34784 ?auto_34785 ?auto_34786 ?auto_34783 )
      ( GET-3IMAGE-VERIFY ?auto_34784 ?auto_34785 ?auto_34786 ?auto_34783 ?auto_34788 ?auto_34787 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_34856 - DIRECTION
      ?auto_34857 - MODE
      ?auto_34858 - DIRECTION
      ?auto_34855 - MODE
      ?auto_34860 - DIRECTION
      ?auto_34859 - MODE
    )
    :vars
    (
      ?auto_34863 - INSTRUMENT
      ?auto_34861 - SATELLITE
      ?auto_34862 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_34858 ?auto_34856 ) ) ( not ( = ?auto_34860 ?auto_34856 ) ) ( not ( = ?auto_34860 ?auto_34858 ) ) ( ON_BOARD ?auto_34863 ?auto_34861 ) ( SUPPORTS ?auto_34863 ?auto_34857 ) ( POWER_ON ?auto_34863 ) ( POINTING ?auto_34861 ?auto_34862 ) ( not ( = ?auto_34856 ?auto_34862 ) ) ( HAVE_IMAGE ?auto_34858 ?auto_34855 ) ( not ( = ?auto_34858 ?auto_34862 ) ) ( not ( = ?auto_34855 ?auto_34857 ) ) ( CALIBRATION_TARGET ?auto_34863 ?auto_34862 ) ( NOT_CALIBRATED ?auto_34863 ) ( HAVE_IMAGE ?auto_34860 ?auto_34859 ) ( not ( = ?auto_34857 ?auto_34859 ) ) ( not ( = ?auto_34855 ?auto_34859 ) ) ( not ( = ?auto_34860 ?auto_34862 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_34858 ?auto_34855 ?auto_34856 ?auto_34857 )
      ( GET-3IMAGE-VERIFY ?auto_34856 ?auto_34857 ?auto_34858 ?auto_34855 ?auto_34860 ?auto_34859 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_35725 - DIRECTION
      ?auto_35726 - MODE
      ?auto_35727 - DIRECTION
      ?auto_35724 - MODE
      ?auto_35729 - DIRECTION
      ?auto_35728 - MODE
    )
    :vars
    (
      ?auto_35732 - INSTRUMENT
      ?auto_35730 - SATELLITE
      ?auto_35731 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_35727 ?auto_35725 ) ) ( not ( = ?auto_35729 ?auto_35725 ) ) ( not ( = ?auto_35729 ?auto_35727 ) ) ( ON_BOARD ?auto_35732 ?auto_35730 ) ( SUPPORTS ?auto_35732 ?auto_35728 ) ( POINTING ?auto_35730 ?auto_35731 ) ( not ( = ?auto_35729 ?auto_35731 ) ) ( HAVE_IMAGE ?auto_35725 ?auto_35726 ) ( not ( = ?auto_35725 ?auto_35731 ) ) ( not ( = ?auto_35726 ?auto_35728 ) ) ( CALIBRATION_TARGET ?auto_35732 ?auto_35731 ) ( POWER_AVAIL ?auto_35730 ) ( HAVE_IMAGE ?auto_35727 ?auto_35724 ) ( not ( = ?auto_35726 ?auto_35724 ) ) ( not ( = ?auto_35727 ?auto_35731 ) ) ( not ( = ?auto_35724 ?auto_35728 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35725 ?auto_35726 ?auto_35729 ?auto_35728 )
      ( GET-3IMAGE-VERIFY ?auto_35725 ?auto_35726 ?auto_35727 ?auto_35724 ?auto_35729 ?auto_35728 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_35743 - DIRECTION
      ?auto_35744 - MODE
      ?auto_35745 - DIRECTION
      ?auto_35742 - MODE
      ?auto_35747 - DIRECTION
      ?auto_35746 - MODE
    )
    :vars
    (
      ?auto_35750 - INSTRUMENT
      ?auto_35748 - SATELLITE
      ?auto_35749 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_35745 ?auto_35743 ) ) ( not ( = ?auto_35747 ?auto_35743 ) ) ( not ( = ?auto_35747 ?auto_35745 ) ) ( ON_BOARD ?auto_35750 ?auto_35748 ) ( SUPPORTS ?auto_35750 ?auto_35742 ) ( POINTING ?auto_35748 ?auto_35749 ) ( not ( = ?auto_35745 ?auto_35749 ) ) ( HAVE_IMAGE ?auto_35743 ?auto_35744 ) ( not ( = ?auto_35743 ?auto_35749 ) ) ( not ( = ?auto_35744 ?auto_35742 ) ) ( CALIBRATION_TARGET ?auto_35750 ?auto_35749 ) ( POWER_AVAIL ?auto_35748 ) ( HAVE_IMAGE ?auto_35747 ?auto_35746 ) ( not ( = ?auto_35744 ?auto_35746 ) ) ( not ( = ?auto_35742 ?auto_35746 ) ) ( not ( = ?auto_35747 ?auto_35749 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35743 ?auto_35744 ?auto_35745 ?auto_35742 )
      ( GET-3IMAGE-VERIFY ?auto_35743 ?auto_35744 ?auto_35745 ?auto_35742 ?auto_35747 ?auto_35746 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_35815 - DIRECTION
      ?auto_35816 - MODE
      ?auto_35817 - DIRECTION
      ?auto_35814 - MODE
      ?auto_35819 - DIRECTION
      ?auto_35818 - MODE
    )
    :vars
    (
      ?auto_35822 - INSTRUMENT
      ?auto_35820 - SATELLITE
      ?auto_35821 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_35817 ?auto_35815 ) ) ( not ( = ?auto_35819 ?auto_35815 ) ) ( not ( = ?auto_35819 ?auto_35817 ) ) ( ON_BOARD ?auto_35822 ?auto_35820 ) ( SUPPORTS ?auto_35822 ?auto_35816 ) ( POINTING ?auto_35820 ?auto_35821 ) ( not ( = ?auto_35815 ?auto_35821 ) ) ( HAVE_IMAGE ?auto_35817 ?auto_35814 ) ( not ( = ?auto_35817 ?auto_35821 ) ) ( not ( = ?auto_35814 ?auto_35816 ) ) ( CALIBRATION_TARGET ?auto_35822 ?auto_35821 ) ( POWER_AVAIL ?auto_35820 ) ( HAVE_IMAGE ?auto_35819 ?auto_35818 ) ( not ( = ?auto_35816 ?auto_35818 ) ) ( not ( = ?auto_35814 ?auto_35818 ) ) ( not ( = ?auto_35819 ?auto_35821 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_35817 ?auto_35814 ?auto_35815 ?auto_35816 )
      ( GET-3IMAGE-VERIFY ?auto_35815 ?auto_35816 ?auto_35817 ?auto_35814 ?auto_35819 ?auto_35818 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_36636 - DIRECTION
      ?auto_36637 - MODE
    )
    :vars
    (
      ?auto_36640 - DIRECTION
      ?auto_36641 - INSTRUMENT
      ?auto_36638 - SATELLITE
      ?auto_36639 - DIRECTION
      ?auto_36642 - MODE
      ?auto_36643 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_36636 ?auto_36640 ) ) ( ON_BOARD ?auto_36641 ?auto_36638 ) ( SUPPORTS ?auto_36641 ?auto_36637 ) ( not ( = ?auto_36636 ?auto_36639 ) ) ( HAVE_IMAGE ?auto_36640 ?auto_36642 ) ( not ( = ?auto_36640 ?auto_36639 ) ) ( not ( = ?auto_36642 ?auto_36637 ) ) ( CALIBRATION_TARGET ?auto_36641 ?auto_36639 ) ( POWER_AVAIL ?auto_36638 ) ( POINTING ?auto_36638 ?auto_36643 ) ( not ( = ?auto_36639 ?auto_36643 ) ) ( not ( = ?auto_36636 ?auto_36643 ) ) ( not ( = ?auto_36640 ?auto_36643 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_36638 ?auto_36639 ?auto_36643 )
      ( GET-2IMAGE ?auto_36640 ?auto_36642 ?auto_36636 ?auto_36637 )
      ( GET-1IMAGE-VERIFY ?auto_36636 ?auto_36637 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_36645 - DIRECTION
      ?auto_36646 - MODE
      ?auto_36647 - DIRECTION
      ?auto_36644 - MODE
    )
    :vars
    (
      ?auto_36648 - INSTRUMENT
      ?auto_36651 - SATELLITE
      ?auto_36649 - DIRECTION
      ?auto_36650 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_36647 ?auto_36645 ) ) ( ON_BOARD ?auto_36648 ?auto_36651 ) ( SUPPORTS ?auto_36648 ?auto_36644 ) ( not ( = ?auto_36647 ?auto_36649 ) ) ( HAVE_IMAGE ?auto_36645 ?auto_36646 ) ( not ( = ?auto_36645 ?auto_36649 ) ) ( not ( = ?auto_36646 ?auto_36644 ) ) ( CALIBRATION_TARGET ?auto_36648 ?auto_36649 ) ( POWER_AVAIL ?auto_36651 ) ( POINTING ?auto_36651 ?auto_36650 ) ( not ( = ?auto_36649 ?auto_36650 ) ) ( not ( = ?auto_36647 ?auto_36650 ) ) ( not ( = ?auto_36645 ?auto_36650 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_36647 ?auto_36644 )
      ( GET-2IMAGE-VERIFY ?auto_36645 ?auto_36646 ?auto_36647 ?auto_36644 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_36653 - DIRECTION
      ?auto_36654 - MODE
      ?auto_36655 - DIRECTION
      ?auto_36652 - MODE
    )
    :vars
    (
      ?auto_36656 - DIRECTION
      ?auto_36659 - INSTRUMENT
      ?auto_36658 - SATELLITE
      ?auto_36660 - DIRECTION
      ?auto_36657 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_36655 ?auto_36653 ) ) ( not ( = ?auto_36655 ?auto_36656 ) ) ( ON_BOARD ?auto_36659 ?auto_36658 ) ( SUPPORTS ?auto_36659 ?auto_36652 ) ( not ( = ?auto_36655 ?auto_36660 ) ) ( HAVE_IMAGE ?auto_36656 ?auto_36657 ) ( not ( = ?auto_36656 ?auto_36660 ) ) ( not ( = ?auto_36657 ?auto_36652 ) ) ( CALIBRATION_TARGET ?auto_36659 ?auto_36660 ) ( POWER_AVAIL ?auto_36658 ) ( POINTING ?auto_36658 ?auto_36653 ) ( not ( = ?auto_36660 ?auto_36653 ) ) ( not ( = ?auto_36656 ?auto_36653 ) ) ( HAVE_IMAGE ?auto_36653 ?auto_36654 ) ( not ( = ?auto_36654 ?auto_36652 ) ) ( not ( = ?auto_36654 ?auto_36657 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36656 ?auto_36657 ?auto_36655 ?auto_36652 )
      ( GET-2IMAGE-VERIFY ?auto_36653 ?auto_36654 ?auto_36655 ?auto_36652 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_36662 - DIRECTION
      ?auto_36663 - MODE
      ?auto_36664 - DIRECTION
      ?auto_36661 - MODE
    )
    :vars
    (
      ?auto_36667 - INSTRUMENT
      ?auto_36665 - SATELLITE
      ?auto_36668 - DIRECTION
      ?auto_36666 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_36664 ?auto_36662 ) ) ( ON_BOARD ?auto_36667 ?auto_36665 ) ( SUPPORTS ?auto_36667 ?auto_36663 ) ( not ( = ?auto_36662 ?auto_36668 ) ) ( HAVE_IMAGE ?auto_36664 ?auto_36661 ) ( not ( = ?auto_36664 ?auto_36668 ) ) ( not ( = ?auto_36661 ?auto_36663 ) ) ( CALIBRATION_TARGET ?auto_36667 ?auto_36668 ) ( POWER_AVAIL ?auto_36665 ) ( POINTING ?auto_36665 ?auto_36666 ) ( not ( = ?auto_36668 ?auto_36666 ) ) ( not ( = ?auto_36662 ?auto_36666 ) ) ( not ( = ?auto_36664 ?auto_36666 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36664 ?auto_36661 ?auto_36662 ?auto_36663 )
      ( GET-2IMAGE-VERIFY ?auto_36662 ?auto_36663 ?auto_36664 ?auto_36661 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_36670 - DIRECTION
      ?auto_36671 - MODE
      ?auto_36672 - DIRECTION
      ?auto_36669 - MODE
    )
    :vars
    (
      ?auto_36673 - DIRECTION
      ?auto_36676 - INSTRUMENT
      ?auto_36675 - SATELLITE
      ?auto_36677 - DIRECTION
      ?auto_36674 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_36672 ?auto_36670 ) ) ( not ( = ?auto_36670 ?auto_36673 ) ) ( ON_BOARD ?auto_36676 ?auto_36675 ) ( SUPPORTS ?auto_36676 ?auto_36671 ) ( not ( = ?auto_36670 ?auto_36677 ) ) ( HAVE_IMAGE ?auto_36673 ?auto_36674 ) ( not ( = ?auto_36673 ?auto_36677 ) ) ( not ( = ?auto_36674 ?auto_36671 ) ) ( CALIBRATION_TARGET ?auto_36676 ?auto_36677 ) ( POWER_AVAIL ?auto_36675 ) ( POINTING ?auto_36675 ?auto_36672 ) ( not ( = ?auto_36677 ?auto_36672 ) ) ( not ( = ?auto_36673 ?auto_36672 ) ) ( HAVE_IMAGE ?auto_36672 ?auto_36669 ) ( not ( = ?auto_36671 ?auto_36669 ) ) ( not ( = ?auto_36669 ?auto_36674 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36673 ?auto_36674 ?auto_36670 ?auto_36671 )
      ( GET-2IMAGE-VERIFY ?auto_36670 ?auto_36671 ?auto_36672 ?auto_36669 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_36699 - DIRECTION
      ?auto_36700 - MODE
      ?auto_36701 - DIRECTION
      ?auto_36698 - MODE
      ?auto_36703 - DIRECTION
      ?auto_36702 - MODE
    )
    :vars
    (
      ?auto_36705 - INSTRUMENT
      ?auto_36704 - SATELLITE
      ?auto_36706 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_36701 ?auto_36699 ) ) ( not ( = ?auto_36703 ?auto_36699 ) ) ( not ( = ?auto_36703 ?auto_36701 ) ) ( ON_BOARD ?auto_36705 ?auto_36704 ) ( SUPPORTS ?auto_36705 ?auto_36702 ) ( not ( = ?auto_36703 ?auto_36706 ) ) ( HAVE_IMAGE ?auto_36699 ?auto_36700 ) ( not ( = ?auto_36699 ?auto_36706 ) ) ( not ( = ?auto_36700 ?auto_36702 ) ) ( CALIBRATION_TARGET ?auto_36705 ?auto_36706 ) ( POWER_AVAIL ?auto_36704 ) ( POINTING ?auto_36704 ?auto_36701 ) ( not ( = ?auto_36706 ?auto_36701 ) ) ( HAVE_IMAGE ?auto_36701 ?auto_36698 ) ( not ( = ?auto_36700 ?auto_36698 ) ) ( not ( = ?auto_36698 ?auto_36702 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36699 ?auto_36700 ?auto_36703 ?auto_36702 )
      ( GET-3IMAGE-VERIFY ?auto_36699 ?auto_36700 ?auto_36701 ?auto_36698 ?auto_36703 ?auto_36702 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_36718 - DIRECTION
      ?auto_36719 - MODE
      ?auto_36720 - DIRECTION
      ?auto_36717 - MODE
      ?auto_36722 - DIRECTION
      ?auto_36721 - MODE
    )
    :vars
    (
      ?auto_36724 - INSTRUMENT
      ?auto_36723 - SATELLITE
      ?auto_36725 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_36720 ?auto_36718 ) ) ( not ( = ?auto_36722 ?auto_36718 ) ) ( not ( = ?auto_36722 ?auto_36720 ) ) ( ON_BOARD ?auto_36724 ?auto_36723 ) ( SUPPORTS ?auto_36724 ?auto_36717 ) ( not ( = ?auto_36720 ?auto_36725 ) ) ( HAVE_IMAGE ?auto_36718 ?auto_36719 ) ( not ( = ?auto_36718 ?auto_36725 ) ) ( not ( = ?auto_36719 ?auto_36717 ) ) ( CALIBRATION_TARGET ?auto_36724 ?auto_36725 ) ( POWER_AVAIL ?auto_36723 ) ( POINTING ?auto_36723 ?auto_36722 ) ( not ( = ?auto_36725 ?auto_36722 ) ) ( HAVE_IMAGE ?auto_36722 ?auto_36721 ) ( not ( = ?auto_36719 ?auto_36721 ) ) ( not ( = ?auto_36717 ?auto_36721 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36718 ?auto_36719 ?auto_36720 ?auto_36717 )
      ( GET-3IMAGE-VERIFY ?auto_36718 ?auto_36719 ?auto_36720 ?auto_36717 ?auto_36722 ?auto_36721 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_36737 - DIRECTION
      ?auto_36738 - MODE
      ?auto_36739 - DIRECTION
      ?auto_36736 - MODE
      ?auto_36741 - DIRECTION
      ?auto_36740 - MODE
    )
    :vars
    (
      ?auto_36743 - INSTRUMENT
      ?auto_36742 - SATELLITE
      ?auto_36744 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_36739 ?auto_36737 ) ) ( not ( = ?auto_36741 ?auto_36737 ) ) ( not ( = ?auto_36741 ?auto_36739 ) ) ( ON_BOARD ?auto_36743 ?auto_36742 ) ( SUPPORTS ?auto_36743 ?auto_36740 ) ( not ( = ?auto_36741 ?auto_36744 ) ) ( HAVE_IMAGE ?auto_36739 ?auto_36736 ) ( not ( = ?auto_36739 ?auto_36744 ) ) ( not ( = ?auto_36736 ?auto_36740 ) ) ( CALIBRATION_TARGET ?auto_36743 ?auto_36744 ) ( POWER_AVAIL ?auto_36742 ) ( POINTING ?auto_36742 ?auto_36737 ) ( not ( = ?auto_36744 ?auto_36737 ) ) ( HAVE_IMAGE ?auto_36737 ?auto_36738 ) ( not ( = ?auto_36738 ?auto_36736 ) ) ( not ( = ?auto_36738 ?auto_36740 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36739 ?auto_36736 ?auto_36741 ?auto_36740 )
      ( GET-3IMAGE-VERIFY ?auto_36737 ?auto_36738 ?auto_36739 ?auto_36736 ?auto_36741 ?auto_36740 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_36757 - DIRECTION
      ?auto_36758 - MODE
      ?auto_36759 - DIRECTION
      ?auto_36756 - MODE
      ?auto_36761 - DIRECTION
      ?auto_36760 - MODE
    )
    :vars
    (
      ?auto_36763 - INSTRUMENT
      ?auto_36762 - SATELLITE
      ?auto_36764 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_36759 ?auto_36757 ) ) ( not ( = ?auto_36761 ?auto_36757 ) ) ( not ( = ?auto_36761 ?auto_36759 ) ) ( ON_BOARD ?auto_36763 ?auto_36762 ) ( SUPPORTS ?auto_36763 ?auto_36756 ) ( not ( = ?auto_36759 ?auto_36764 ) ) ( HAVE_IMAGE ?auto_36761 ?auto_36760 ) ( not ( = ?auto_36761 ?auto_36764 ) ) ( not ( = ?auto_36760 ?auto_36756 ) ) ( CALIBRATION_TARGET ?auto_36763 ?auto_36764 ) ( POWER_AVAIL ?auto_36762 ) ( POINTING ?auto_36762 ?auto_36757 ) ( not ( = ?auto_36764 ?auto_36757 ) ) ( HAVE_IMAGE ?auto_36757 ?auto_36758 ) ( not ( = ?auto_36758 ?auto_36756 ) ) ( not ( = ?auto_36758 ?auto_36760 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36761 ?auto_36760 ?auto_36759 ?auto_36756 )
      ( GET-3IMAGE-VERIFY ?auto_36757 ?auto_36758 ?auto_36759 ?auto_36756 ?auto_36761 ?auto_36760 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_36798 - DIRECTION
      ?auto_36799 - MODE
      ?auto_36800 - DIRECTION
      ?auto_36797 - MODE
      ?auto_36802 - DIRECTION
      ?auto_36801 - MODE
    )
    :vars
    (
      ?auto_36804 - INSTRUMENT
      ?auto_36803 - SATELLITE
      ?auto_36805 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_36800 ?auto_36798 ) ) ( not ( = ?auto_36802 ?auto_36798 ) ) ( not ( = ?auto_36802 ?auto_36800 ) ) ( ON_BOARD ?auto_36804 ?auto_36803 ) ( SUPPORTS ?auto_36804 ?auto_36799 ) ( not ( = ?auto_36798 ?auto_36805 ) ) ( HAVE_IMAGE ?auto_36800 ?auto_36797 ) ( not ( = ?auto_36800 ?auto_36805 ) ) ( not ( = ?auto_36797 ?auto_36799 ) ) ( CALIBRATION_TARGET ?auto_36804 ?auto_36805 ) ( POWER_AVAIL ?auto_36803 ) ( POINTING ?auto_36803 ?auto_36802 ) ( not ( = ?auto_36805 ?auto_36802 ) ) ( HAVE_IMAGE ?auto_36802 ?auto_36801 ) ( not ( = ?auto_36799 ?auto_36801 ) ) ( not ( = ?auto_36797 ?auto_36801 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36800 ?auto_36797 ?auto_36798 ?auto_36799 )
      ( GET-3IMAGE-VERIFY ?auto_36798 ?auto_36799 ?auto_36800 ?auto_36797 ?auto_36802 ?auto_36801 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_36817 - DIRECTION
      ?auto_36818 - MODE
      ?auto_36819 - DIRECTION
      ?auto_36816 - MODE
      ?auto_36821 - DIRECTION
      ?auto_36820 - MODE
    )
    :vars
    (
      ?auto_36823 - INSTRUMENT
      ?auto_36822 - SATELLITE
      ?auto_36824 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_36819 ?auto_36817 ) ) ( not ( = ?auto_36821 ?auto_36817 ) ) ( not ( = ?auto_36821 ?auto_36819 ) ) ( ON_BOARD ?auto_36823 ?auto_36822 ) ( SUPPORTS ?auto_36823 ?auto_36818 ) ( not ( = ?auto_36817 ?auto_36824 ) ) ( HAVE_IMAGE ?auto_36821 ?auto_36820 ) ( not ( = ?auto_36821 ?auto_36824 ) ) ( not ( = ?auto_36820 ?auto_36818 ) ) ( CALIBRATION_TARGET ?auto_36823 ?auto_36824 ) ( POWER_AVAIL ?auto_36822 ) ( POINTING ?auto_36822 ?auto_36819 ) ( not ( = ?auto_36824 ?auto_36819 ) ) ( HAVE_IMAGE ?auto_36819 ?auto_36816 ) ( not ( = ?auto_36818 ?auto_36816 ) ) ( not ( = ?auto_36816 ?auto_36820 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_36821 ?auto_36820 ?auto_36817 ?auto_36818 )
      ( GET-3IMAGE-VERIFY ?auto_36817 ?auto_36818 ?auto_36819 ?auto_36816 ?auto_36821 ?auto_36820 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_37640 - DIRECTION
      ?auto_37641 - MODE
    )
    :vars
    (
      ?auto_37642 - DIRECTION
      ?auto_37646 - INSTRUMENT
      ?auto_37644 - SATELLITE
      ?auto_37647 - DIRECTION
      ?auto_37643 - MODE
      ?auto_37645 - DIRECTION
      ?auto_37648 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_37640 ?auto_37642 ) ) ( ON_BOARD ?auto_37646 ?auto_37644 ) ( SUPPORTS ?auto_37646 ?auto_37641 ) ( not ( = ?auto_37640 ?auto_37647 ) ) ( HAVE_IMAGE ?auto_37642 ?auto_37643 ) ( not ( = ?auto_37642 ?auto_37647 ) ) ( not ( = ?auto_37643 ?auto_37641 ) ) ( CALIBRATION_TARGET ?auto_37646 ?auto_37647 ) ( POINTING ?auto_37644 ?auto_37645 ) ( not ( = ?auto_37647 ?auto_37645 ) ) ( not ( = ?auto_37640 ?auto_37645 ) ) ( not ( = ?auto_37642 ?auto_37645 ) ) ( ON_BOARD ?auto_37648 ?auto_37644 ) ( POWER_ON ?auto_37648 ) ( not ( = ?auto_37646 ?auto_37648 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_37648 ?auto_37644 )
      ( GET-2IMAGE ?auto_37642 ?auto_37643 ?auto_37640 ?auto_37641 )
      ( GET-1IMAGE-VERIFY ?auto_37640 ?auto_37641 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_37650 - DIRECTION
      ?auto_37651 - MODE
      ?auto_37652 - DIRECTION
      ?auto_37649 - MODE
    )
    :vars
    (
      ?auto_37654 - INSTRUMENT
      ?auto_37653 - SATELLITE
      ?auto_37656 - DIRECTION
      ?auto_37657 - DIRECTION
      ?auto_37655 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_37652 ?auto_37650 ) ) ( ON_BOARD ?auto_37654 ?auto_37653 ) ( SUPPORTS ?auto_37654 ?auto_37649 ) ( not ( = ?auto_37652 ?auto_37656 ) ) ( HAVE_IMAGE ?auto_37650 ?auto_37651 ) ( not ( = ?auto_37650 ?auto_37656 ) ) ( not ( = ?auto_37651 ?auto_37649 ) ) ( CALIBRATION_TARGET ?auto_37654 ?auto_37656 ) ( POINTING ?auto_37653 ?auto_37657 ) ( not ( = ?auto_37656 ?auto_37657 ) ) ( not ( = ?auto_37652 ?auto_37657 ) ) ( not ( = ?auto_37650 ?auto_37657 ) ) ( ON_BOARD ?auto_37655 ?auto_37653 ) ( POWER_ON ?auto_37655 ) ( not ( = ?auto_37654 ?auto_37655 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_37652 ?auto_37649 )
      ( GET-2IMAGE-VERIFY ?auto_37650 ?auto_37651 ?auto_37652 ?auto_37649 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_37659 - DIRECTION
      ?auto_37660 - MODE
      ?auto_37661 - DIRECTION
      ?auto_37658 - MODE
    )
    :vars
    (
      ?auto_37663 - DIRECTION
      ?auto_37667 - INSTRUMENT
      ?auto_37662 - SATELLITE
      ?auto_37665 - DIRECTION
      ?auto_37664 - MODE
      ?auto_37666 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_37661 ?auto_37659 ) ) ( not ( = ?auto_37661 ?auto_37663 ) ) ( ON_BOARD ?auto_37667 ?auto_37662 ) ( SUPPORTS ?auto_37667 ?auto_37658 ) ( not ( = ?auto_37661 ?auto_37665 ) ) ( HAVE_IMAGE ?auto_37663 ?auto_37664 ) ( not ( = ?auto_37663 ?auto_37665 ) ) ( not ( = ?auto_37664 ?auto_37658 ) ) ( CALIBRATION_TARGET ?auto_37667 ?auto_37665 ) ( POINTING ?auto_37662 ?auto_37659 ) ( not ( = ?auto_37665 ?auto_37659 ) ) ( not ( = ?auto_37663 ?auto_37659 ) ) ( ON_BOARD ?auto_37666 ?auto_37662 ) ( POWER_ON ?auto_37666 ) ( not ( = ?auto_37667 ?auto_37666 ) ) ( HAVE_IMAGE ?auto_37659 ?auto_37660 ) ( not ( = ?auto_37660 ?auto_37658 ) ) ( not ( = ?auto_37660 ?auto_37664 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37663 ?auto_37664 ?auto_37661 ?auto_37658 )
      ( GET-2IMAGE-VERIFY ?auto_37659 ?auto_37660 ?auto_37661 ?auto_37658 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_37669 - DIRECTION
      ?auto_37670 - MODE
      ?auto_37671 - DIRECTION
      ?auto_37668 - MODE
    )
    :vars
    (
      ?auto_37676 - INSTRUMENT
      ?auto_37672 - SATELLITE
      ?auto_37673 - DIRECTION
      ?auto_37675 - DIRECTION
      ?auto_37674 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_37671 ?auto_37669 ) ) ( ON_BOARD ?auto_37676 ?auto_37672 ) ( SUPPORTS ?auto_37676 ?auto_37670 ) ( not ( = ?auto_37669 ?auto_37673 ) ) ( HAVE_IMAGE ?auto_37671 ?auto_37668 ) ( not ( = ?auto_37671 ?auto_37673 ) ) ( not ( = ?auto_37668 ?auto_37670 ) ) ( CALIBRATION_TARGET ?auto_37676 ?auto_37673 ) ( POINTING ?auto_37672 ?auto_37675 ) ( not ( = ?auto_37673 ?auto_37675 ) ) ( not ( = ?auto_37669 ?auto_37675 ) ) ( not ( = ?auto_37671 ?auto_37675 ) ) ( ON_BOARD ?auto_37674 ?auto_37672 ) ( POWER_ON ?auto_37674 ) ( not ( = ?auto_37676 ?auto_37674 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37671 ?auto_37668 ?auto_37669 ?auto_37670 )
      ( GET-2IMAGE-VERIFY ?auto_37669 ?auto_37670 ?auto_37671 ?auto_37668 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_37678 - DIRECTION
      ?auto_37679 - MODE
      ?auto_37680 - DIRECTION
      ?auto_37677 - MODE
    )
    :vars
    (
      ?auto_37682 - DIRECTION
      ?auto_37686 - INSTRUMENT
      ?auto_37681 - SATELLITE
      ?auto_37684 - DIRECTION
      ?auto_37683 - MODE
      ?auto_37685 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_37680 ?auto_37678 ) ) ( not ( = ?auto_37678 ?auto_37682 ) ) ( ON_BOARD ?auto_37686 ?auto_37681 ) ( SUPPORTS ?auto_37686 ?auto_37679 ) ( not ( = ?auto_37678 ?auto_37684 ) ) ( HAVE_IMAGE ?auto_37682 ?auto_37683 ) ( not ( = ?auto_37682 ?auto_37684 ) ) ( not ( = ?auto_37683 ?auto_37679 ) ) ( CALIBRATION_TARGET ?auto_37686 ?auto_37684 ) ( POINTING ?auto_37681 ?auto_37680 ) ( not ( = ?auto_37684 ?auto_37680 ) ) ( not ( = ?auto_37682 ?auto_37680 ) ) ( ON_BOARD ?auto_37685 ?auto_37681 ) ( POWER_ON ?auto_37685 ) ( not ( = ?auto_37686 ?auto_37685 ) ) ( HAVE_IMAGE ?auto_37680 ?auto_37677 ) ( not ( = ?auto_37679 ?auto_37677 ) ) ( not ( = ?auto_37677 ?auto_37683 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37682 ?auto_37683 ?auto_37678 ?auto_37679 )
      ( GET-2IMAGE-VERIFY ?auto_37678 ?auto_37679 ?auto_37680 ?auto_37677 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_37710 - DIRECTION
      ?auto_37711 - MODE
      ?auto_37712 - DIRECTION
      ?auto_37709 - MODE
      ?auto_37714 - DIRECTION
      ?auto_37713 - MODE
    )
    :vars
    (
      ?auto_37718 - INSTRUMENT
      ?auto_37715 - SATELLITE
      ?auto_37716 - DIRECTION
      ?auto_37717 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_37712 ?auto_37710 ) ) ( not ( = ?auto_37714 ?auto_37710 ) ) ( not ( = ?auto_37714 ?auto_37712 ) ) ( ON_BOARD ?auto_37718 ?auto_37715 ) ( SUPPORTS ?auto_37718 ?auto_37713 ) ( not ( = ?auto_37714 ?auto_37716 ) ) ( HAVE_IMAGE ?auto_37710 ?auto_37711 ) ( not ( = ?auto_37710 ?auto_37716 ) ) ( not ( = ?auto_37711 ?auto_37713 ) ) ( CALIBRATION_TARGET ?auto_37718 ?auto_37716 ) ( POINTING ?auto_37715 ?auto_37712 ) ( not ( = ?auto_37716 ?auto_37712 ) ) ( ON_BOARD ?auto_37717 ?auto_37715 ) ( POWER_ON ?auto_37717 ) ( not ( = ?auto_37718 ?auto_37717 ) ) ( HAVE_IMAGE ?auto_37712 ?auto_37709 ) ( not ( = ?auto_37711 ?auto_37709 ) ) ( not ( = ?auto_37709 ?auto_37713 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37710 ?auto_37711 ?auto_37714 ?auto_37713 )
      ( GET-3IMAGE-VERIFY ?auto_37710 ?auto_37711 ?auto_37712 ?auto_37709 ?auto_37714 ?auto_37713 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_37731 - DIRECTION
      ?auto_37732 - MODE
      ?auto_37733 - DIRECTION
      ?auto_37730 - MODE
      ?auto_37735 - DIRECTION
      ?auto_37734 - MODE
    )
    :vars
    (
      ?auto_37739 - INSTRUMENT
      ?auto_37736 - SATELLITE
      ?auto_37737 - DIRECTION
      ?auto_37738 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_37733 ?auto_37731 ) ) ( not ( = ?auto_37735 ?auto_37731 ) ) ( not ( = ?auto_37735 ?auto_37733 ) ) ( ON_BOARD ?auto_37739 ?auto_37736 ) ( SUPPORTS ?auto_37739 ?auto_37730 ) ( not ( = ?auto_37733 ?auto_37737 ) ) ( HAVE_IMAGE ?auto_37731 ?auto_37732 ) ( not ( = ?auto_37731 ?auto_37737 ) ) ( not ( = ?auto_37732 ?auto_37730 ) ) ( CALIBRATION_TARGET ?auto_37739 ?auto_37737 ) ( POINTING ?auto_37736 ?auto_37735 ) ( not ( = ?auto_37737 ?auto_37735 ) ) ( ON_BOARD ?auto_37738 ?auto_37736 ) ( POWER_ON ?auto_37738 ) ( not ( = ?auto_37739 ?auto_37738 ) ) ( HAVE_IMAGE ?auto_37735 ?auto_37734 ) ( not ( = ?auto_37732 ?auto_37734 ) ) ( not ( = ?auto_37730 ?auto_37734 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37731 ?auto_37732 ?auto_37733 ?auto_37730 )
      ( GET-3IMAGE-VERIFY ?auto_37731 ?auto_37732 ?auto_37733 ?auto_37730 ?auto_37735 ?auto_37734 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_37752 - DIRECTION
      ?auto_37753 - MODE
      ?auto_37754 - DIRECTION
      ?auto_37751 - MODE
      ?auto_37756 - DIRECTION
      ?auto_37755 - MODE
    )
    :vars
    (
      ?auto_37760 - INSTRUMENT
      ?auto_37757 - SATELLITE
      ?auto_37758 - DIRECTION
      ?auto_37759 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_37754 ?auto_37752 ) ) ( not ( = ?auto_37756 ?auto_37752 ) ) ( not ( = ?auto_37756 ?auto_37754 ) ) ( ON_BOARD ?auto_37760 ?auto_37757 ) ( SUPPORTS ?auto_37760 ?auto_37755 ) ( not ( = ?auto_37756 ?auto_37758 ) ) ( HAVE_IMAGE ?auto_37754 ?auto_37751 ) ( not ( = ?auto_37754 ?auto_37758 ) ) ( not ( = ?auto_37751 ?auto_37755 ) ) ( CALIBRATION_TARGET ?auto_37760 ?auto_37758 ) ( POINTING ?auto_37757 ?auto_37752 ) ( not ( = ?auto_37758 ?auto_37752 ) ) ( ON_BOARD ?auto_37759 ?auto_37757 ) ( POWER_ON ?auto_37759 ) ( not ( = ?auto_37760 ?auto_37759 ) ) ( HAVE_IMAGE ?auto_37752 ?auto_37753 ) ( not ( = ?auto_37753 ?auto_37751 ) ) ( not ( = ?auto_37753 ?auto_37755 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37754 ?auto_37751 ?auto_37756 ?auto_37755 )
      ( GET-3IMAGE-VERIFY ?auto_37752 ?auto_37753 ?auto_37754 ?auto_37751 ?auto_37756 ?auto_37755 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_37774 - DIRECTION
      ?auto_37775 - MODE
      ?auto_37776 - DIRECTION
      ?auto_37773 - MODE
      ?auto_37778 - DIRECTION
      ?auto_37777 - MODE
    )
    :vars
    (
      ?auto_37782 - INSTRUMENT
      ?auto_37779 - SATELLITE
      ?auto_37780 - DIRECTION
      ?auto_37781 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_37776 ?auto_37774 ) ) ( not ( = ?auto_37778 ?auto_37774 ) ) ( not ( = ?auto_37778 ?auto_37776 ) ) ( ON_BOARD ?auto_37782 ?auto_37779 ) ( SUPPORTS ?auto_37782 ?auto_37773 ) ( not ( = ?auto_37776 ?auto_37780 ) ) ( HAVE_IMAGE ?auto_37778 ?auto_37777 ) ( not ( = ?auto_37778 ?auto_37780 ) ) ( not ( = ?auto_37777 ?auto_37773 ) ) ( CALIBRATION_TARGET ?auto_37782 ?auto_37780 ) ( POINTING ?auto_37779 ?auto_37774 ) ( not ( = ?auto_37780 ?auto_37774 ) ) ( ON_BOARD ?auto_37781 ?auto_37779 ) ( POWER_ON ?auto_37781 ) ( not ( = ?auto_37782 ?auto_37781 ) ) ( HAVE_IMAGE ?auto_37774 ?auto_37775 ) ( not ( = ?auto_37775 ?auto_37773 ) ) ( not ( = ?auto_37775 ?auto_37777 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37778 ?auto_37777 ?auto_37776 ?auto_37773 )
      ( GET-3IMAGE-VERIFY ?auto_37774 ?auto_37775 ?auto_37776 ?auto_37773 ?auto_37778 ?auto_37777 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_37819 - DIRECTION
      ?auto_37820 - MODE
      ?auto_37821 - DIRECTION
      ?auto_37818 - MODE
      ?auto_37823 - DIRECTION
      ?auto_37822 - MODE
    )
    :vars
    (
      ?auto_37827 - INSTRUMENT
      ?auto_37824 - SATELLITE
      ?auto_37825 - DIRECTION
      ?auto_37826 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_37821 ?auto_37819 ) ) ( not ( = ?auto_37823 ?auto_37819 ) ) ( not ( = ?auto_37823 ?auto_37821 ) ) ( ON_BOARD ?auto_37827 ?auto_37824 ) ( SUPPORTS ?auto_37827 ?auto_37820 ) ( not ( = ?auto_37819 ?auto_37825 ) ) ( HAVE_IMAGE ?auto_37821 ?auto_37818 ) ( not ( = ?auto_37821 ?auto_37825 ) ) ( not ( = ?auto_37818 ?auto_37820 ) ) ( CALIBRATION_TARGET ?auto_37827 ?auto_37825 ) ( POINTING ?auto_37824 ?auto_37823 ) ( not ( = ?auto_37825 ?auto_37823 ) ) ( ON_BOARD ?auto_37826 ?auto_37824 ) ( POWER_ON ?auto_37826 ) ( not ( = ?auto_37827 ?auto_37826 ) ) ( HAVE_IMAGE ?auto_37823 ?auto_37822 ) ( not ( = ?auto_37820 ?auto_37822 ) ) ( not ( = ?auto_37818 ?auto_37822 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37821 ?auto_37818 ?auto_37819 ?auto_37820 )
      ( GET-3IMAGE-VERIFY ?auto_37819 ?auto_37820 ?auto_37821 ?auto_37818 ?auto_37823 ?auto_37822 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_37840 - DIRECTION
      ?auto_37841 - MODE
      ?auto_37842 - DIRECTION
      ?auto_37839 - MODE
      ?auto_37844 - DIRECTION
      ?auto_37843 - MODE
    )
    :vars
    (
      ?auto_37848 - INSTRUMENT
      ?auto_37845 - SATELLITE
      ?auto_37846 - DIRECTION
      ?auto_37847 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_37842 ?auto_37840 ) ) ( not ( = ?auto_37844 ?auto_37840 ) ) ( not ( = ?auto_37844 ?auto_37842 ) ) ( ON_BOARD ?auto_37848 ?auto_37845 ) ( SUPPORTS ?auto_37848 ?auto_37841 ) ( not ( = ?auto_37840 ?auto_37846 ) ) ( HAVE_IMAGE ?auto_37844 ?auto_37843 ) ( not ( = ?auto_37844 ?auto_37846 ) ) ( not ( = ?auto_37843 ?auto_37841 ) ) ( CALIBRATION_TARGET ?auto_37848 ?auto_37846 ) ( POINTING ?auto_37845 ?auto_37842 ) ( not ( = ?auto_37846 ?auto_37842 ) ) ( ON_BOARD ?auto_37847 ?auto_37845 ) ( POWER_ON ?auto_37847 ) ( not ( = ?auto_37848 ?auto_37847 ) ) ( HAVE_IMAGE ?auto_37842 ?auto_37839 ) ( not ( = ?auto_37841 ?auto_37839 ) ) ( not ( = ?auto_37839 ?auto_37843 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_37844 ?auto_37843 ?auto_37840 ?auto_37841 )
      ( GET-3IMAGE-VERIFY ?auto_37840 ?auto_37841 ?auto_37842 ?auto_37839 ?auto_37844 ?auto_37843 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_39811 - DIRECTION
      ?auto_39812 - MODE
    )
    :vars
    (
      ?auto_39816 - DIRECTION
      ?auto_39813 - INSTRUMENT
      ?auto_39817 - SATELLITE
      ?auto_39818 - DIRECTION
      ?auto_39815 - MODE
      ?auto_39814 - DIRECTION
      ?auto_39819 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_39811 ?auto_39816 ) ) ( ON_BOARD ?auto_39813 ?auto_39817 ) ( SUPPORTS ?auto_39813 ?auto_39812 ) ( not ( = ?auto_39811 ?auto_39818 ) ) ( HAVE_IMAGE ?auto_39816 ?auto_39815 ) ( not ( = ?auto_39816 ?auto_39818 ) ) ( not ( = ?auto_39815 ?auto_39812 ) ) ( CALIBRATION_TARGET ?auto_39813 ?auto_39818 ) ( not ( = ?auto_39818 ?auto_39814 ) ) ( not ( = ?auto_39811 ?auto_39814 ) ) ( not ( = ?auto_39816 ?auto_39814 ) ) ( ON_BOARD ?auto_39819 ?auto_39817 ) ( POWER_ON ?auto_39819 ) ( not ( = ?auto_39813 ?auto_39819 ) ) ( POINTING ?auto_39817 ?auto_39818 ) )
    :subtasks
    ( ( !TURN_TO ?auto_39817 ?auto_39814 ?auto_39818 )
      ( GET-2IMAGE ?auto_39816 ?auto_39815 ?auto_39811 ?auto_39812 )
      ( GET-1IMAGE-VERIFY ?auto_39811 ?auto_39812 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_39821 - DIRECTION
      ?auto_39822 - MODE
      ?auto_39823 - DIRECTION
      ?auto_39820 - MODE
    )
    :vars
    (
      ?auto_39827 - INSTRUMENT
      ?auto_39828 - SATELLITE
      ?auto_39824 - DIRECTION
      ?auto_39825 - DIRECTION
      ?auto_39826 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_39823 ?auto_39821 ) ) ( ON_BOARD ?auto_39827 ?auto_39828 ) ( SUPPORTS ?auto_39827 ?auto_39820 ) ( not ( = ?auto_39823 ?auto_39824 ) ) ( HAVE_IMAGE ?auto_39821 ?auto_39822 ) ( not ( = ?auto_39821 ?auto_39824 ) ) ( not ( = ?auto_39822 ?auto_39820 ) ) ( CALIBRATION_TARGET ?auto_39827 ?auto_39824 ) ( not ( = ?auto_39824 ?auto_39825 ) ) ( not ( = ?auto_39823 ?auto_39825 ) ) ( not ( = ?auto_39821 ?auto_39825 ) ) ( ON_BOARD ?auto_39826 ?auto_39828 ) ( POWER_ON ?auto_39826 ) ( not ( = ?auto_39827 ?auto_39826 ) ) ( POINTING ?auto_39828 ?auto_39824 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_39823 ?auto_39820 )
      ( GET-2IMAGE-VERIFY ?auto_39821 ?auto_39822 ?auto_39823 ?auto_39820 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_39840 - DIRECTION
      ?auto_39841 - MODE
      ?auto_39842 - DIRECTION
      ?auto_39839 - MODE
    )
    :vars
    (
      ?auto_39845 - INSTRUMENT
      ?auto_39846 - SATELLITE
      ?auto_39843 - DIRECTION
      ?auto_39844 - DIRECTION
      ?auto_39847 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_39842 ?auto_39840 ) ) ( ON_BOARD ?auto_39845 ?auto_39846 ) ( SUPPORTS ?auto_39845 ?auto_39841 ) ( not ( = ?auto_39840 ?auto_39843 ) ) ( HAVE_IMAGE ?auto_39842 ?auto_39839 ) ( not ( = ?auto_39842 ?auto_39843 ) ) ( not ( = ?auto_39839 ?auto_39841 ) ) ( CALIBRATION_TARGET ?auto_39845 ?auto_39843 ) ( not ( = ?auto_39843 ?auto_39844 ) ) ( not ( = ?auto_39840 ?auto_39844 ) ) ( not ( = ?auto_39842 ?auto_39844 ) ) ( ON_BOARD ?auto_39847 ?auto_39846 ) ( POWER_ON ?auto_39847 ) ( not ( = ?auto_39845 ?auto_39847 ) ) ( POINTING ?auto_39846 ?auto_39843 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_39842 ?auto_39839 ?auto_39840 ?auto_39841 )
      ( GET-2IMAGE-VERIFY ?auto_39840 ?auto_39841 ?auto_39842 ?auto_39839 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_52143 - DIRECTION
      ?auto_52144 - MODE
      ?auto_52145 - DIRECTION
      ?auto_52142 - MODE
      ?auto_52147 - DIRECTION
      ?auto_52146 - MODE
      ?auto_52148 - DIRECTION
      ?auto_52149 - MODE
    )
    :vars
    (
      ?auto_52151 - INSTRUMENT
      ?auto_52150 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_52145 ?auto_52143 ) ) ( not ( = ?auto_52147 ?auto_52143 ) ) ( not ( = ?auto_52147 ?auto_52145 ) ) ( not ( = ?auto_52148 ?auto_52143 ) ) ( not ( = ?auto_52148 ?auto_52145 ) ) ( not ( = ?auto_52148 ?auto_52147 ) ) ( CALIBRATED ?auto_52151 ) ( ON_BOARD ?auto_52151 ?auto_52150 ) ( SUPPORTS ?auto_52151 ?auto_52149 ) ( POWER_ON ?auto_52151 ) ( POINTING ?auto_52150 ?auto_52148 ) ( HAVE_IMAGE ?auto_52143 ?auto_52144 ) ( HAVE_IMAGE ?auto_52145 ?auto_52142 ) ( HAVE_IMAGE ?auto_52147 ?auto_52146 ) ( not ( = ?auto_52144 ?auto_52142 ) ) ( not ( = ?auto_52144 ?auto_52146 ) ) ( not ( = ?auto_52144 ?auto_52149 ) ) ( not ( = ?auto_52142 ?auto_52146 ) ) ( not ( = ?auto_52142 ?auto_52149 ) ) ( not ( = ?auto_52146 ?auto_52149 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_52148 ?auto_52149 )
      ( GET-4IMAGE-VERIFY ?auto_52143 ?auto_52144 ?auto_52145 ?auto_52142 ?auto_52147 ?auto_52146 ?auto_52148 ?auto_52149 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_52173 - DIRECTION
      ?auto_52174 - MODE
      ?auto_52175 - DIRECTION
      ?auto_52172 - MODE
      ?auto_52177 - DIRECTION
      ?auto_52176 - MODE
      ?auto_52178 - DIRECTION
      ?auto_52179 - MODE
    )
    :vars
    (
      ?auto_52181 - INSTRUMENT
      ?auto_52180 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_52175 ?auto_52173 ) ) ( not ( = ?auto_52177 ?auto_52173 ) ) ( not ( = ?auto_52177 ?auto_52175 ) ) ( not ( = ?auto_52178 ?auto_52173 ) ) ( not ( = ?auto_52178 ?auto_52175 ) ) ( not ( = ?auto_52178 ?auto_52177 ) ) ( CALIBRATED ?auto_52181 ) ( ON_BOARD ?auto_52181 ?auto_52180 ) ( SUPPORTS ?auto_52181 ?auto_52176 ) ( POWER_ON ?auto_52181 ) ( POINTING ?auto_52180 ?auto_52177 ) ( HAVE_IMAGE ?auto_52173 ?auto_52174 ) ( HAVE_IMAGE ?auto_52175 ?auto_52172 ) ( HAVE_IMAGE ?auto_52178 ?auto_52179 ) ( not ( = ?auto_52174 ?auto_52172 ) ) ( not ( = ?auto_52174 ?auto_52176 ) ) ( not ( = ?auto_52174 ?auto_52179 ) ) ( not ( = ?auto_52172 ?auto_52176 ) ) ( not ( = ?auto_52172 ?auto_52179 ) ) ( not ( = ?auto_52176 ?auto_52179 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_52177 ?auto_52176 )
      ( GET-4IMAGE-VERIFY ?auto_52173 ?auto_52174 ?auto_52175 ?auto_52172 ?auto_52177 ?auto_52176 ?auto_52178 ?auto_52179 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_52319 - DIRECTION
      ?auto_52320 - MODE
      ?auto_52321 - DIRECTION
      ?auto_52318 - MODE
      ?auto_52323 - DIRECTION
      ?auto_52322 - MODE
      ?auto_52324 - DIRECTION
      ?auto_52325 - MODE
    )
    :vars
    (
      ?auto_52327 - INSTRUMENT
      ?auto_52326 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_52321 ?auto_52319 ) ) ( not ( = ?auto_52323 ?auto_52319 ) ) ( not ( = ?auto_52323 ?auto_52321 ) ) ( not ( = ?auto_52324 ?auto_52319 ) ) ( not ( = ?auto_52324 ?auto_52321 ) ) ( not ( = ?auto_52324 ?auto_52323 ) ) ( CALIBRATED ?auto_52327 ) ( ON_BOARD ?auto_52327 ?auto_52326 ) ( SUPPORTS ?auto_52327 ?auto_52318 ) ( POWER_ON ?auto_52327 ) ( POINTING ?auto_52326 ?auto_52321 ) ( HAVE_IMAGE ?auto_52319 ?auto_52320 ) ( HAVE_IMAGE ?auto_52323 ?auto_52322 ) ( HAVE_IMAGE ?auto_52324 ?auto_52325 ) ( not ( = ?auto_52320 ?auto_52318 ) ) ( not ( = ?auto_52320 ?auto_52322 ) ) ( not ( = ?auto_52320 ?auto_52325 ) ) ( not ( = ?auto_52318 ?auto_52322 ) ) ( not ( = ?auto_52318 ?auto_52325 ) ) ( not ( = ?auto_52322 ?auto_52325 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_52321 ?auto_52318 )
      ( GET-4IMAGE-VERIFY ?auto_52319 ?auto_52320 ?auto_52321 ?auto_52318 ?auto_52323 ?auto_52322 ?auto_52324 ?auto_52325 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_53193 - DIRECTION
      ?auto_53194 - MODE
      ?auto_53195 - DIRECTION
      ?auto_53192 - MODE
      ?auto_53197 - DIRECTION
      ?auto_53196 - MODE
      ?auto_53198 - DIRECTION
      ?auto_53199 - MODE
    )
    :vars
    (
      ?auto_53201 - INSTRUMENT
      ?auto_53200 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_53195 ?auto_53193 ) ) ( not ( = ?auto_53197 ?auto_53193 ) ) ( not ( = ?auto_53197 ?auto_53195 ) ) ( not ( = ?auto_53198 ?auto_53193 ) ) ( not ( = ?auto_53198 ?auto_53195 ) ) ( not ( = ?auto_53198 ?auto_53197 ) ) ( CALIBRATED ?auto_53201 ) ( ON_BOARD ?auto_53201 ?auto_53200 ) ( SUPPORTS ?auto_53201 ?auto_53194 ) ( POWER_ON ?auto_53201 ) ( POINTING ?auto_53200 ?auto_53193 ) ( HAVE_IMAGE ?auto_53195 ?auto_53192 ) ( HAVE_IMAGE ?auto_53197 ?auto_53196 ) ( HAVE_IMAGE ?auto_53198 ?auto_53199 ) ( not ( = ?auto_53194 ?auto_53192 ) ) ( not ( = ?auto_53194 ?auto_53196 ) ) ( not ( = ?auto_53194 ?auto_53199 ) ) ( not ( = ?auto_53192 ?auto_53196 ) ) ( not ( = ?auto_53192 ?auto_53199 ) ) ( not ( = ?auto_53196 ?auto_53199 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_53193 ?auto_53194 )
      ( GET-4IMAGE-VERIFY ?auto_53193 ?auto_53194 ?auto_53195 ?auto_53192 ?auto_53197 ?auto_53196 ?auto_53198 ?auto_53199 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_54220 - DIRECTION
      ?auto_54221 - MODE
      ?auto_54222 - DIRECTION
      ?auto_54219 - MODE
      ?auto_54224 - DIRECTION
      ?auto_54223 - MODE
      ?auto_54225 - DIRECTION
      ?auto_54226 - MODE
    )
    :vars
    (
      ?auto_54229 - INSTRUMENT
      ?auto_54228 - SATELLITE
      ?auto_54227 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_54222 ?auto_54220 ) ) ( not ( = ?auto_54224 ?auto_54220 ) ) ( not ( = ?auto_54224 ?auto_54222 ) ) ( not ( = ?auto_54225 ?auto_54220 ) ) ( not ( = ?auto_54225 ?auto_54222 ) ) ( not ( = ?auto_54225 ?auto_54224 ) ) ( CALIBRATED ?auto_54229 ) ( ON_BOARD ?auto_54229 ?auto_54228 ) ( SUPPORTS ?auto_54229 ?auto_54226 ) ( POWER_ON ?auto_54229 ) ( POINTING ?auto_54228 ?auto_54227 ) ( not ( = ?auto_54225 ?auto_54227 ) ) ( HAVE_IMAGE ?auto_54220 ?auto_54221 ) ( not ( = ?auto_54220 ?auto_54227 ) ) ( not ( = ?auto_54221 ?auto_54226 ) ) ( HAVE_IMAGE ?auto_54222 ?auto_54219 ) ( HAVE_IMAGE ?auto_54224 ?auto_54223 ) ( not ( = ?auto_54221 ?auto_54219 ) ) ( not ( = ?auto_54221 ?auto_54223 ) ) ( not ( = ?auto_54222 ?auto_54227 ) ) ( not ( = ?auto_54219 ?auto_54223 ) ) ( not ( = ?auto_54219 ?auto_54226 ) ) ( not ( = ?auto_54224 ?auto_54227 ) ) ( not ( = ?auto_54223 ?auto_54226 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_54220 ?auto_54221 ?auto_54225 ?auto_54226 )
      ( GET-4IMAGE-VERIFY ?auto_54220 ?auto_54221 ?auto_54222 ?auto_54219 ?auto_54224 ?auto_54223 ?auto_54225 ?auto_54226 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_54253 - DIRECTION
      ?auto_54254 - MODE
      ?auto_54255 - DIRECTION
      ?auto_54252 - MODE
      ?auto_54257 - DIRECTION
      ?auto_54256 - MODE
      ?auto_54258 - DIRECTION
      ?auto_54259 - MODE
    )
    :vars
    (
      ?auto_54262 - INSTRUMENT
      ?auto_54261 - SATELLITE
      ?auto_54260 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_54255 ?auto_54253 ) ) ( not ( = ?auto_54257 ?auto_54253 ) ) ( not ( = ?auto_54257 ?auto_54255 ) ) ( not ( = ?auto_54258 ?auto_54253 ) ) ( not ( = ?auto_54258 ?auto_54255 ) ) ( not ( = ?auto_54258 ?auto_54257 ) ) ( CALIBRATED ?auto_54262 ) ( ON_BOARD ?auto_54262 ?auto_54261 ) ( SUPPORTS ?auto_54262 ?auto_54256 ) ( POWER_ON ?auto_54262 ) ( POINTING ?auto_54261 ?auto_54260 ) ( not ( = ?auto_54257 ?auto_54260 ) ) ( HAVE_IMAGE ?auto_54253 ?auto_54254 ) ( not ( = ?auto_54253 ?auto_54260 ) ) ( not ( = ?auto_54254 ?auto_54256 ) ) ( HAVE_IMAGE ?auto_54255 ?auto_54252 ) ( HAVE_IMAGE ?auto_54258 ?auto_54259 ) ( not ( = ?auto_54254 ?auto_54252 ) ) ( not ( = ?auto_54254 ?auto_54259 ) ) ( not ( = ?auto_54255 ?auto_54260 ) ) ( not ( = ?auto_54252 ?auto_54256 ) ) ( not ( = ?auto_54252 ?auto_54259 ) ) ( not ( = ?auto_54256 ?auto_54259 ) ) ( not ( = ?auto_54258 ?auto_54260 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_54253 ?auto_54254 ?auto_54257 ?auto_54256 )
      ( GET-4IMAGE-VERIFY ?auto_54253 ?auto_54254 ?auto_54255 ?auto_54252 ?auto_54257 ?auto_54256 ?auto_54258 ?auto_54259 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_54412 - DIRECTION
      ?auto_54413 - MODE
      ?auto_54414 - DIRECTION
      ?auto_54411 - MODE
      ?auto_54416 - DIRECTION
      ?auto_54415 - MODE
      ?auto_54417 - DIRECTION
      ?auto_54418 - MODE
    )
    :vars
    (
      ?auto_54421 - INSTRUMENT
      ?auto_54420 - SATELLITE
      ?auto_54419 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_54414 ?auto_54412 ) ) ( not ( = ?auto_54416 ?auto_54412 ) ) ( not ( = ?auto_54416 ?auto_54414 ) ) ( not ( = ?auto_54417 ?auto_54412 ) ) ( not ( = ?auto_54417 ?auto_54414 ) ) ( not ( = ?auto_54417 ?auto_54416 ) ) ( CALIBRATED ?auto_54421 ) ( ON_BOARD ?auto_54421 ?auto_54420 ) ( SUPPORTS ?auto_54421 ?auto_54411 ) ( POWER_ON ?auto_54421 ) ( POINTING ?auto_54420 ?auto_54419 ) ( not ( = ?auto_54414 ?auto_54419 ) ) ( HAVE_IMAGE ?auto_54412 ?auto_54413 ) ( not ( = ?auto_54412 ?auto_54419 ) ) ( not ( = ?auto_54413 ?auto_54411 ) ) ( HAVE_IMAGE ?auto_54416 ?auto_54415 ) ( HAVE_IMAGE ?auto_54417 ?auto_54418 ) ( not ( = ?auto_54413 ?auto_54415 ) ) ( not ( = ?auto_54413 ?auto_54418 ) ) ( not ( = ?auto_54411 ?auto_54415 ) ) ( not ( = ?auto_54411 ?auto_54418 ) ) ( not ( = ?auto_54416 ?auto_54419 ) ) ( not ( = ?auto_54415 ?auto_54418 ) ) ( not ( = ?auto_54417 ?auto_54419 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_54412 ?auto_54413 ?auto_54414 ?auto_54411 )
      ( GET-4IMAGE-VERIFY ?auto_54412 ?auto_54413 ?auto_54414 ?auto_54411 ?auto_54416 ?auto_54415 ?auto_54417 ?auto_54418 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_55439 - DIRECTION
      ?auto_55440 - MODE
      ?auto_55441 - DIRECTION
      ?auto_55438 - MODE
      ?auto_55443 - DIRECTION
      ?auto_55442 - MODE
      ?auto_55444 - DIRECTION
      ?auto_55445 - MODE
    )
    :vars
    (
      ?auto_55448 - INSTRUMENT
      ?auto_55447 - SATELLITE
      ?auto_55446 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_55441 ?auto_55439 ) ) ( not ( = ?auto_55443 ?auto_55439 ) ) ( not ( = ?auto_55443 ?auto_55441 ) ) ( not ( = ?auto_55444 ?auto_55439 ) ) ( not ( = ?auto_55444 ?auto_55441 ) ) ( not ( = ?auto_55444 ?auto_55443 ) ) ( CALIBRATED ?auto_55448 ) ( ON_BOARD ?auto_55448 ?auto_55447 ) ( SUPPORTS ?auto_55448 ?auto_55440 ) ( POWER_ON ?auto_55448 ) ( POINTING ?auto_55447 ?auto_55446 ) ( not ( = ?auto_55439 ?auto_55446 ) ) ( HAVE_IMAGE ?auto_55441 ?auto_55438 ) ( not ( = ?auto_55441 ?auto_55446 ) ) ( not ( = ?auto_55438 ?auto_55440 ) ) ( HAVE_IMAGE ?auto_55443 ?auto_55442 ) ( HAVE_IMAGE ?auto_55444 ?auto_55445 ) ( not ( = ?auto_55440 ?auto_55442 ) ) ( not ( = ?auto_55440 ?auto_55445 ) ) ( not ( = ?auto_55438 ?auto_55442 ) ) ( not ( = ?auto_55438 ?auto_55445 ) ) ( not ( = ?auto_55443 ?auto_55446 ) ) ( not ( = ?auto_55442 ?auto_55445 ) ) ( not ( = ?auto_55444 ?auto_55446 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_55441 ?auto_55438 ?auto_55439 ?auto_55440 )
      ( GET-4IMAGE-VERIFY ?auto_55439 ?auto_55440 ?auto_55441 ?auto_55438 ?auto_55443 ?auto_55442 ?auto_55444 ?auto_55445 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_56575 - DIRECTION
      ?auto_56576 - MODE
      ?auto_56577 - DIRECTION
      ?auto_56574 - MODE
      ?auto_56579 - DIRECTION
      ?auto_56578 - MODE
      ?auto_56580 - DIRECTION
      ?auto_56581 - MODE
    )
    :vars
    (
      ?auto_56583 - INSTRUMENT
      ?auto_56584 - SATELLITE
      ?auto_56582 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_56577 ?auto_56575 ) ) ( not ( = ?auto_56579 ?auto_56575 ) ) ( not ( = ?auto_56579 ?auto_56577 ) ) ( not ( = ?auto_56580 ?auto_56575 ) ) ( not ( = ?auto_56580 ?auto_56577 ) ) ( not ( = ?auto_56580 ?auto_56579 ) ) ( ON_BOARD ?auto_56583 ?auto_56584 ) ( SUPPORTS ?auto_56583 ?auto_56581 ) ( POWER_ON ?auto_56583 ) ( POINTING ?auto_56584 ?auto_56582 ) ( not ( = ?auto_56580 ?auto_56582 ) ) ( HAVE_IMAGE ?auto_56575 ?auto_56576 ) ( not ( = ?auto_56575 ?auto_56582 ) ) ( not ( = ?auto_56576 ?auto_56581 ) ) ( CALIBRATION_TARGET ?auto_56583 ?auto_56582 ) ( NOT_CALIBRATED ?auto_56583 ) ( HAVE_IMAGE ?auto_56577 ?auto_56574 ) ( HAVE_IMAGE ?auto_56579 ?auto_56578 ) ( not ( = ?auto_56576 ?auto_56574 ) ) ( not ( = ?auto_56576 ?auto_56578 ) ) ( not ( = ?auto_56577 ?auto_56582 ) ) ( not ( = ?auto_56574 ?auto_56578 ) ) ( not ( = ?auto_56574 ?auto_56581 ) ) ( not ( = ?auto_56579 ?auto_56582 ) ) ( not ( = ?auto_56578 ?auto_56581 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_56575 ?auto_56576 ?auto_56580 ?auto_56581 )
      ( GET-4IMAGE-VERIFY ?auto_56575 ?auto_56576 ?auto_56577 ?auto_56574 ?auto_56579 ?auto_56578 ?auto_56580 ?auto_56581 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_56608 - DIRECTION
      ?auto_56609 - MODE
      ?auto_56610 - DIRECTION
      ?auto_56607 - MODE
      ?auto_56612 - DIRECTION
      ?auto_56611 - MODE
      ?auto_56613 - DIRECTION
      ?auto_56614 - MODE
    )
    :vars
    (
      ?auto_56616 - INSTRUMENT
      ?auto_56617 - SATELLITE
      ?auto_56615 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_56610 ?auto_56608 ) ) ( not ( = ?auto_56612 ?auto_56608 ) ) ( not ( = ?auto_56612 ?auto_56610 ) ) ( not ( = ?auto_56613 ?auto_56608 ) ) ( not ( = ?auto_56613 ?auto_56610 ) ) ( not ( = ?auto_56613 ?auto_56612 ) ) ( ON_BOARD ?auto_56616 ?auto_56617 ) ( SUPPORTS ?auto_56616 ?auto_56611 ) ( POWER_ON ?auto_56616 ) ( POINTING ?auto_56617 ?auto_56615 ) ( not ( = ?auto_56612 ?auto_56615 ) ) ( HAVE_IMAGE ?auto_56608 ?auto_56609 ) ( not ( = ?auto_56608 ?auto_56615 ) ) ( not ( = ?auto_56609 ?auto_56611 ) ) ( CALIBRATION_TARGET ?auto_56616 ?auto_56615 ) ( NOT_CALIBRATED ?auto_56616 ) ( HAVE_IMAGE ?auto_56610 ?auto_56607 ) ( HAVE_IMAGE ?auto_56613 ?auto_56614 ) ( not ( = ?auto_56609 ?auto_56607 ) ) ( not ( = ?auto_56609 ?auto_56614 ) ) ( not ( = ?auto_56610 ?auto_56615 ) ) ( not ( = ?auto_56607 ?auto_56611 ) ) ( not ( = ?auto_56607 ?auto_56614 ) ) ( not ( = ?auto_56611 ?auto_56614 ) ) ( not ( = ?auto_56613 ?auto_56615 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_56608 ?auto_56609 ?auto_56612 ?auto_56611 )
      ( GET-4IMAGE-VERIFY ?auto_56608 ?auto_56609 ?auto_56610 ?auto_56607 ?auto_56612 ?auto_56611 ?auto_56613 ?auto_56614 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_56767 - DIRECTION
      ?auto_56768 - MODE
      ?auto_56769 - DIRECTION
      ?auto_56766 - MODE
      ?auto_56771 - DIRECTION
      ?auto_56770 - MODE
      ?auto_56772 - DIRECTION
      ?auto_56773 - MODE
    )
    :vars
    (
      ?auto_56775 - INSTRUMENT
      ?auto_56776 - SATELLITE
      ?auto_56774 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_56769 ?auto_56767 ) ) ( not ( = ?auto_56771 ?auto_56767 ) ) ( not ( = ?auto_56771 ?auto_56769 ) ) ( not ( = ?auto_56772 ?auto_56767 ) ) ( not ( = ?auto_56772 ?auto_56769 ) ) ( not ( = ?auto_56772 ?auto_56771 ) ) ( ON_BOARD ?auto_56775 ?auto_56776 ) ( SUPPORTS ?auto_56775 ?auto_56766 ) ( POWER_ON ?auto_56775 ) ( POINTING ?auto_56776 ?auto_56774 ) ( not ( = ?auto_56769 ?auto_56774 ) ) ( HAVE_IMAGE ?auto_56767 ?auto_56768 ) ( not ( = ?auto_56767 ?auto_56774 ) ) ( not ( = ?auto_56768 ?auto_56766 ) ) ( CALIBRATION_TARGET ?auto_56775 ?auto_56774 ) ( NOT_CALIBRATED ?auto_56775 ) ( HAVE_IMAGE ?auto_56771 ?auto_56770 ) ( HAVE_IMAGE ?auto_56772 ?auto_56773 ) ( not ( = ?auto_56768 ?auto_56770 ) ) ( not ( = ?auto_56768 ?auto_56773 ) ) ( not ( = ?auto_56766 ?auto_56770 ) ) ( not ( = ?auto_56766 ?auto_56773 ) ) ( not ( = ?auto_56771 ?auto_56774 ) ) ( not ( = ?auto_56770 ?auto_56773 ) ) ( not ( = ?auto_56772 ?auto_56774 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_56767 ?auto_56768 ?auto_56769 ?auto_56766 )
      ( GET-4IMAGE-VERIFY ?auto_56767 ?auto_56768 ?auto_56769 ?auto_56766 ?auto_56771 ?auto_56770 ?auto_56772 ?auto_56773 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_57794 - DIRECTION
      ?auto_57795 - MODE
      ?auto_57796 - DIRECTION
      ?auto_57793 - MODE
      ?auto_57798 - DIRECTION
      ?auto_57797 - MODE
      ?auto_57799 - DIRECTION
      ?auto_57800 - MODE
    )
    :vars
    (
      ?auto_57802 - INSTRUMENT
      ?auto_57803 - SATELLITE
      ?auto_57801 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_57796 ?auto_57794 ) ) ( not ( = ?auto_57798 ?auto_57794 ) ) ( not ( = ?auto_57798 ?auto_57796 ) ) ( not ( = ?auto_57799 ?auto_57794 ) ) ( not ( = ?auto_57799 ?auto_57796 ) ) ( not ( = ?auto_57799 ?auto_57798 ) ) ( ON_BOARD ?auto_57802 ?auto_57803 ) ( SUPPORTS ?auto_57802 ?auto_57795 ) ( POWER_ON ?auto_57802 ) ( POINTING ?auto_57803 ?auto_57801 ) ( not ( = ?auto_57794 ?auto_57801 ) ) ( HAVE_IMAGE ?auto_57796 ?auto_57793 ) ( not ( = ?auto_57796 ?auto_57801 ) ) ( not ( = ?auto_57793 ?auto_57795 ) ) ( CALIBRATION_TARGET ?auto_57802 ?auto_57801 ) ( NOT_CALIBRATED ?auto_57802 ) ( HAVE_IMAGE ?auto_57798 ?auto_57797 ) ( HAVE_IMAGE ?auto_57799 ?auto_57800 ) ( not ( = ?auto_57795 ?auto_57797 ) ) ( not ( = ?auto_57795 ?auto_57800 ) ) ( not ( = ?auto_57793 ?auto_57797 ) ) ( not ( = ?auto_57793 ?auto_57800 ) ) ( not ( = ?auto_57798 ?auto_57801 ) ) ( not ( = ?auto_57797 ?auto_57800 ) ) ( not ( = ?auto_57799 ?auto_57801 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_57796 ?auto_57793 ?auto_57794 ?auto_57795 )
      ( GET-4IMAGE-VERIFY ?auto_57794 ?auto_57795 ?auto_57796 ?auto_57793 ?auto_57798 ?auto_57797 ?auto_57799 ?auto_57800 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_58930 - DIRECTION
      ?auto_58931 - MODE
      ?auto_58932 - DIRECTION
      ?auto_58929 - MODE
      ?auto_58934 - DIRECTION
      ?auto_58933 - MODE
      ?auto_58935 - DIRECTION
      ?auto_58936 - MODE
    )
    :vars
    (
      ?auto_58937 - INSTRUMENT
      ?auto_58939 - SATELLITE
      ?auto_58938 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_58932 ?auto_58930 ) ) ( not ( = ?auto_58934 ?auto_58930 ) ) ( not ( = ?auto_58934 ?auto_58932 ) ) ( not ( = ?auto_58935 ?auto_58930 ) ) ( not ( = ?auto_58935 ?auto_58932 ) ) ( not ( = ?auto_58935 ?auto_58934 ) ) ( ON_BOARD ?auto_58937 ?auto_58939 ) ( SUPPORTS ?auto_58937 ?auto_58936 ) ( POINTING ?auto_58939 ?auto_58938 ) ( not ( = ?auto_58935 ?auto_58938 ) ) ( HAVE_IMAGE ?auto_58930 ?auto_58931 ) ( not ( = ?auto_58930 ?auto_58938 ) ) ( not ( = ?auto_58931 ?auto_58936 ) ) ( CALIBRATION_TARGET ?auto_58937 ?auto_58938 ) ( POWER_AVAIL ?auto_58939 ) ( HAVE_IMAGE ?auto_58932 ?auto_58929 ) ( HAVE_IMAGE ?auto_58934 ?auto_58933 ) ( not ( = ?auto_58931 ?auto_58929 ) ) ( not ( = ?auto_58931 ?auto_58933 ) ) ( not ( = ?auto_58932 ?auto_58938 ) ) ( not ( = ?auto_58929 ?auto_58933 ) ) ( not ( = ?auto_58929 ?auto_58936 ) ) ( not ( = ?auto_58934 ?auto_58938 ) ) ( not ( = ?auto_58933 ?auto_58936 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_58930 ?auto_58931 ?auto_58935 ?auto_58936 )
      ( GET-4IMAGE-VERIFY ?auto_58930 ?auto_58931 ?auto_58932 ?auto_58929 ?auto_58934 ?auto_58933 ?auto_58935 ?auto_58936 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_58963 - DIRECTION
      ?auto_58964 - MODE
      ?auto_58965 - DIRECTION
      ?auto_58962 - MODE
      ?auto_58967 - DIRECTION
      ?auto_58966 - MODE
      ?auto_58968 - DIRECTION
      ?auto_58969 - MODE
    )
    :vars
    (
      ?auto_58970 - INSTRUMENT
      ?auto_58972 - SATELLITE
      ?auto_58971 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_58965 ?auto_58963 ) ) ( not ( = ?auto_58967 ?auto_58963 ) ) ( not ( = ?auto_58967 ?auto_58965 ) ) ( not ( = ?auto_58968 ?auto_58963 ) ) ( not ( = ?auto_58968 ?auto_58965 ) ) ( not ( = ?auto_58968 ?auto_58967 ) ) ( ON_BOARD ?auto_58970 ?auto_58972 ) ( SUPPORTS ?auto_58970 ?auto_58966 ) ( POINTING ?auto_58972 ?auto_58971 ) ( not ( = ?auto_58967 ?auto_58971 ) ) ( HAVE_IMAGE ?auto_58963 ?auto_58964 ) ( not ( = ?auto_58963 ?auto_58971 ) ) ( not ( = ?auto_58964 ?auto_58966 ) ) ( CALIBRATION_TARGET ?auto_58970 ?auto_58971 ) ( POWER_AVAIL ?auto_58972 ) ( HAVE_IMAGE ?auto_58965 ?auto_58962 ) ( HAVE_IMAGE ?auto_58968 ?auto_58969 ) ( not ( = ?auto_58964 ?auto_58962 ) ) ( not ( = ?auto_58964 ?auto_58969 ) ) ( not ( = ?auto_58965 ?auto_58971 ) ) ( not ( = ?auto_58962 ?auto_58966 ) ) ( not ( = ?auto_58962 ?auto_58969 ) ) ( not ( = ?auto_58966 ?auto_58969 ) ) ( not ( = ?auto_58968 ?auto_58971 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_58963 ?auto_58964 ?auto_58967 ?auto_58966 )
      ( GET-4IMAGE-VERIFY ?auto_58963 ?auto_58964 ?auto_58965 ?auto_58962 ?auto_58967 ?auto_58966 ?auto_58968 ?auto_58969 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_59122 - DIRECTION
      ?auto_59123 - MODE
      ?auto_59124 - DIRECTION
      ?auto_59121 - MODE
      ?auto_59126 - DIRECTION
      ?auto_59125 - MODE
      ?auto_59127 - DIRECTION
      ?auto_59128 - MODE
    )
    :vars
    (
      ?auto_59129 - INSTRUMENT
      ?auto_59131 - SATELLITE
      ?auto_59130 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_59124 ?auto_59122 ) ) ( not ( = ?auto_59126 ?auto_59122 ) ) ( not ( = ?auto_59126 ?auto_59124 ) ) ( not ( = ?auto_59127 ?auto_59122 ) ) ( not ( = ?auto_59127 ?auto_59124 ) ) ( not ( = ?auto_59127 ?auto_59126 ) ) ( ON_BOARD ?auto_59129 ?auto_59131 ) ( SUPPORTS ?auto_59129 ?auto_59121 ) ( POINTING ?auto_59131 ?auto_59130 ) ( not ( = ?auto_59124 ?auto_59130 ) ) ( HAVE_IMAGE ?auto_59122 ?auto_59123 ) ( not ( = ?auto_59122 ?auto_59130 ) ) ( not ( = ?auto_59123 ?auto_59121 ) ) ( CALIBRATION_TARGET ?auto_59129 ?auto_59130 ) ( POWER_AVAIL ?auto_59131 ) ( HAVE_IMAGE ?auto_59126 ?auto_59125 ) ( HAVE_IMAGE ?auto_59127 ?auto_59128 ) ( not ( = ?auto_59123 ?auto_59125 ) ) ( not ( = ?auto_59123 ?auto_59128 ) ) ( not ( = ?auto_59121 ?auto_59125 ) ) ( not ( = ?auto_59121 ?auto_59128 ) ) ( not ( = ?auto_59126 ?auto_59130 ) ) ( not ( = ?auto_59125 ?auto_59128 ) ) ( not ( = ?auto_59127 ?auto_59130 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_59122 ?auto_59123 ?auto_59124 ?auto_59121 )
      ( GET-4IMAGE-VERIFY ?auto_59122 ?auto_59123 ?auto_59124 ?auto_59121 ?auto_59126 ?auto_59125 ?auto_59127 ?auto_59128 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_60149 - DIRECTION
      ?auto_60150 - MODE
      ?auto_60151 - DIRECTION
      ?auto_60148 - MODE
      ?auto_60153 - DIRECTION
      ?auto_60152 - MODE
      ?auto_60154 - DIRECTION
      ?auto_60155 - MODE
    )
    :vars
    (
      ?auto_60156 - INSTRUMENT
      ?auto_60158 - SATELLITE
      ?auto_60157 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_60151 ?auto_60149 ) ) ( not ( = ?auto_60153 ?auto_60149 ) ) ( not ( = ?auto_60153 ?auto_60151 ) ) ( not ( = ?auto_60154 ?auto_60149 ) ) ( not ( = ?auto_60154 ?auto_60151 ) ) ( not ( = ?auto_60154 ?auto_60153 ) ) ( ON_BOARD ?auto_60156 ?auto_60158 ) ( SUPPORTS ?auto_60156 ?auto_60150 ) ( POINTING ?auto_60158 ?auto_60157 ) ( not ( = ?auto_60149 ?auto_60157 ) ) ( HAVE_IMAGE ?auto_60151 ?auto_60148 ) ( not ( = ?auto_60151 ?auto_60157 ) ) ( not ( = ?auto_60148 ?auto_60150 ) ) ( CALIBRATION_TARGET ?auto_60156 ?auto_60157 ) ( POWER_AVAIL ?auto_60158 ) ( HAVE_IMAGE ?auto_60153 ?auto_60152 ) ( HAVE_IMAGE ?auto_60154 ?auto_60155 ) ( not ( = ?auto_60150 ?auto_60152 ) ) ( not ( = ?auto_60150 ?auto_60155 ) ) ( not ( = ?auto_60148 ?auto_60152 ) ) ( not ( = ?auto_60148 ?auto_60155 ) ) ( not ( = ?auto_60153 ?auto_60157 ) ) ( not ( = ?auto_60152 ?auto_60155 ) ) ( not ( = ?auto_60154 ?auto_60157 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_60151 ?auto_60148 ?auto_60149 ?auto_60150 )
      ( GET-4IMAGE-VERIFY ?auto_60149 ?auto_60150 ?auto_60151 ?auto_60148 ?auto_60153 ?auto_60152 ?auto_60154 ?auto_60155 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_60896 - DIRECTION
      ?auto_60897 - MODE
      ?auto_60898 - DIRECTION
      ?auto_60895 - MODE
      ?auto_60900 - DIRECTION
      ?auto_60899 - MODE
    )
    :vars
    (
      ?auto_60903 - INSTRUMENT
      ?auto_60902 - SATELLITE
      ?auto_60904 - DIRECTION
      ?auto_60901 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_60898 ?auto_60896 ) ) ( not ( = ?auto_60900 ?auto_60896 ) ) ( not ( = ?auto_60900 ?auto_60898 ) ) ( ON_BOARD ?auto_60903 ?auto_60902 ) ( SUPPORTS ?auto_60903 ?auto_60899 ) ( not ( = ?auto_60900 ?auto_60904 ) ) ( HAVE_IMAGE ?auto_60896 ?auto_60897 ) ( not ( = ?auto_60896 ?auto_60904 ) ) ( not ( = ?auto_60897 ?auto_60899 ) ) ( CALIBRATION_TARGET ?auto_60903 ?auto_60904 ) ( POWER_AVAIL ?auto_60902 ) ( POINTING ?auto_60902 ?auto_60901 ) ( not ( = ?auto_60904 ?auto_60901 ) ) ( not ( = ?auto_60900 ?auto_60901 ) ) ( not ( = ?auto_60896 ?auto_60901 ) ) ( HAVE_IMAGE ?auto_60898 ?auto_60895 ) ( not ( = ?auto_60897 ?auto_60895 ) ) ( not ( = ?auto_60898 ?auto_60904 ) ) ( not ( = ?auto_60898 ?auto_60901 ) ) ( not ( = ?auto_60895 ?auto_60899 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_60896 ?auto_60897 ?auto_60900 ?auto_60899 )
      ( GET-3IMAGE-VERIFY ?auto_60896 ?auto_60897 ?auto_60898 ?auto_60895 ?auto_60900 ?auto_60899 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_60925 - DIRECTION
      ?auto_60926 - MODE
      ?auto_60927 - DIRECTION
      ?auto_60924 - MODE
      ?auto_60929 - DIRECTION
      ?auto_60928 - MODE
    )
    :vars
    (
      ?auto_60932 - INSTRUMENT
      ?auto_60931 - SATELLITE
      ?auto_60933 - DIRECTION
      ?auto_60930 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_60927 ?auto_60925 ) ) ( not ( = ?auto_60929 ?auto_60925 ) ) ( not ( = ?auto_60929 ?auto_60927 ) ) ( ON_BOARD ?auto_60932 ?auto_60931 ) ( SUPPORTS ?auto_60932 ?auto_60924 ) ( not ( = ?auto_60927 ?auto_60933 ) ) ( HAVE_IMAGE ?auto_60925 ?auto_60926 ) ( not ( = ?auto_60925 ?auto_60933 ) ) ( not ( = ?auto_60926 ?auto_60924 ) ) ( CALIBRATION_TARGET ?auto_60932 ?auto_60933 ) ( POWER_AVAIL ?auto_60931 ) ( POINTING ?auto_60931 ?auto_60930 ) ( not ( = ?auto_60933 ?auto_60930 ) ) ( not ( = ?auto_60927 ?auto_60930 ) ) ( not ( = ?auto_60925 ?auto_60930 ) ) ( HAVE_IMAGE ?auto_60929 ?auto_60928 ) ( not ( = ?auto_60926 ?auto_60928 ) ) ( not ( = ?auto_60924 ?auto_60928 ) ) ( not ( = ?auto_60929 ?auto_60933 ) ) ( not ( = ?auto_60929 ?auto_60930 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_60925 ?auto_60926 ?auto_60927 ?auto_60924 )
      ( GET-3IMAGE-VERIFY ?auto_60925 ?auto_60926 ?auto_60927 ?auto_60924 ?auto_60929 ?auto_60928 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_61087 - DIRECTION
      ?auto_61088 - MODE
      ?auto_61089 - DIRECTION
      ?auto_61086 - MODE
      ?auto_61091 - DIRECTION
      ?auto_61090 - MODE
    )
    :vars
    (
      ?auto_61094 - INSTRUMENT
      ?auto_61093 - SATELLITE
      ?auto_61095 - DIRECTION
      ?auto_61092 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_61089 ?auto_61087 ) ) ( not ( = ?auto_61091 ?auto_61087 ) ) ( not ( = ?auto_61091 ?auto_61089 ) ) ( ON_BOARD ?auto_61094 ?auto_61093 ) ( SUPPORTS ?auto_61094 ?auto_61088 ) ( not ( = ?auto_61087 ?auto_61095 ) ) ( HAVE_IMAGE ?auto_61089 ?auto_61086 ) ( not ( = ?auto_61089 ?auto_61095 ) ) ( not ( = ?auto_61086 ?auto_61088 ) ) ( CALIBRATION_TARGET ?auto_61094 ?auto_61095 ) ( POWER_AVAIL ?auto_61093 ) ( POINTING ?auto_61093 ?auto_61092 ) ( not ( = ?auto_61095 ?auto_61092 ) ) ( not ( = ?auto_61087 ?auto_61092 ) ) ( not ( = ?auto_61089 ?auto_61092 ) ) ( HAVE_IMAGE ?auto_61091 ?auto_61090 ) ( not ( = ?auto_61088 ?auto_61090 ) ) ( not ( = ?auto_61086 ?auto_61090 ) ) ( not ( = ?auto_61091 ?auto_61095 ) ) ( not ( = ?auto_61091 ?auto_61092 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61089 ?auto_61086 ?auto_61087 ?auto_61088 )
      ( GET-3IMAGE-VERIFY ?auto_61087 ?auto_61088 ?auto_61089 ?auto_61086 ?auto_61091 ?auto_61090 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61340 - DIRECTION
      ?auto_61341 - MODE
      ?auto_61342 - DIRECTION
      ?auto_61339 - MODE
      ?auto_61344 - DIRECTION
      ?auto_61343 - MODE
      ?auto_61345 - DIRECTION
      ?auto_61346 - MODE
    )
    :vars
    (
      ?auto_61348 - INSTRUMENT
      ?auto_61347 - SATELLITE
      ?auto_61349 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_61342 ?auto_61340 ) ) ( not ( = ?auto_61344 ?auto_61340 ) ) ( not ( = ?auto_61344 ?auto_61342 ) ) ( not ( = ?auto_61345 ?auto_61340 ) ) ( not ( = ?auto_61345 ?auto_61342 ) ) ( not ( = ?auto_61345 ?auto_61344 ) ) ( ON_BOARD ?auto_61348 ?auto_61347 ) ( SUPPORTS ?auto_61348 ?auto_61346 ) ( not ( = ?auto_61345 ?auto_61349 ) ) ( HAVE_IMAGE ?auto_61340 ?auto_61341 ) ( not ( = ?auto_61340 ?auto_61349 ) ) ( not ( = ?auto_61341 ?auto_61346 ) ) ( CALIBRATION_TARGET ?auto_61348 ?auto_61349 ) ( POWER_AVAIL ?auto_61347 ) ( POINTING ?auto_61347 ?auto_61344 ) ( not ( = ?auto_61349 ?auto_61344 ) ) ( HAVE_IMAGE ?auto_61342 ?auto_61339 ) ( HAVE_IMAGE ?auto_61344 ?auto_61343 ) ( not ( = ?auto_61341 ?auto_61339 ) ) ( not ( = ?auto_61341 ?auto_61343 ) ) ( not ( = ?auto_61342 ?auto_61349 ) ) ( not ( = ?auto_61339 ?auto_61343 ) ) ( not ( = ?auto_61339 ?auto_61346 ) ) ( not ( = ?auto_61343 ?auto_61346 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61340 ?auto_61341 ?auto_61345 ?auto_61346 )
      ( GET-4IMAGE-VERIFY ?auto_61340 ?auto_61341 ?auto_61342 ?auto_61339 ?auto_61344 ?auto_61343 ?auto_61345 ?auto_61346 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61375 - DIRECTION
      ?auto_61376 - MODE
      ?auto_61377 - DIRECTION
      ?auto_61374 - MODE
      ?auto_61379 - DIRECTION
      ?auto_61378 - MODE
      ?auto_61380 - DIRECTION
      ?auto_61381 - MODE
    )
    :vars
    (
      ?auto_61383 - INSTRUMENT
      ?auto_61382 - SATELLITE
      ?auto_61384 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_61377 ?auto_61375 ) ) ( not ( = ?auto_61379 ?auto_61375 ) ) ( not ( = ?auto_61379 ?auto_61377 ) ) ( not ( = ?auto_61380 ?auto_61375 ) ) ( not ( = ?auto_61380 ?auto_61377 ) ) ( not ( = ?auto_61380 ?auto_61379 ) ) ( ON_BOARD ?auto_61383 ?auto_61382 ) ( SUPPORTS ?auto_61383 ?auto_61378 ) ( not ( = ?auto_61379 ?auto_61384 ) ) ( HAVE_IMAGE ?auto_61375 ?auto_61376 ) ( not ( = ?auto_61375 ?auto_61384 ) ) ( not ( = ?auto_61376 ?auto_61378 ) ) ( CALIBRATION_TARGET ?auto_61383 ?auto_61384 ) ( POWER_AVAIL ?auto_61382 ) ( POINTING ?auto_61382 ?auto_61380 ) ( not ( = ?auto_61384 ?auto_61380 ) ) ( HAVE_IMAGE ?auto_61377 ?auto_61374 ) ( HAVE_IMAGE ?auto_61380 ?auto_61381 ) ( not ( = ?auto_61376 ?auto_61374 ) ) ( not ( = ?auto_61376 ?auto_61381 ) ) ( not ( = ?auto_61377 ?auto_61384 ) ) ( not ( = ?auto_61374 ?auto_61378 ) ) ( not ( = ?auto_61374 ?auto_61381 ) ) ( not ( = ?auto_61378 ?auto_61381 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61375 ?auto_61376 ?auto_61379 ?auto_61378 )
      ( GET-4IMAGE-VERIFY ?auto_61375 ?auto_61376 ?auto_61377 ?auto_61374 ?auto_61379 ?auto_61378 ?auto_61380 ?auto_61381 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61409 - DIRECTION
      ?auto_61410 - MODE
      ?auto_61411 - DIRECTION
      ?auto_61408 - MODE
      ?auto_61413 - DIRECTION
      ?auto_61412 - MODE
      ?auto_61414 - DIRECTION
      ?auto_61415 - MODE
    )
    :vars
    (
      ?auto_61417 - INSTRUMENT
      ?auto_61416 - SATELLITE
      ?auto_61418 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_61411 ?auto_61409 ) ) ( not ( = ?auto_61413 ?auto_61409 ) ) ( not ( = ?auto_61413 ?auto_61411 ) ) ( not ( = ?auto_61414 ?auto_61409 ) ) ( not ( = ?auto_61414 ?auto_61411 ) ) ( not ( = ?auto_61414 ?auto_61413 ) ) ( ON_BOARD ?auto_61417 ?auto_61416 ) ( SUPPORTS ?auto_61417 ?auto_61415 ) ( not ( = ?auto_61414 ?auto_61418 ) ) ( HAVE_IMAGE ?auto_61409 ?auto_61410 ) ( not ( = ?auto_61409 ?auto_61418 ) ) ( not ( = ?auto_61410 ?auto_61415 ) ) ( CALIBRATION_TARGET ?auto_61417 ?auto_61418 ) ( POWER_AVAIL ?auto_61416 ) ( POINTING ?auto_61416 ?auto_61411 ) ( not ( = ?auto_61418 ?auto_61411 ) ) ( HAVE_IMAGE ?auto_61411 ?auto_61408 ) ( HAVE_IMAGE ?auto_61413 ?auto_61412 ) ( not ( = ?auto_61410 ?auto_61408 ) ) ( not ( = ?auto_61410 ?auto_61412 ) ) ( not ( = ?auto_61408 ?auto_61412 ) ) ( not ( = ?auto_61408 ?auto_61415 ) ) ( not ( = ?auto_61413 ?auto_61418 ) ) ( not ( = ?auto_61412 ?auto_61415 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61409 ?auto_61410 ?auto_61414 ?auto_61415 )
      ( GET-4IMAGE-VERIFY ?auto_61409 ?auto_61410 ?auto_61411 ?auto_61408 ?auto_61413 ?auto_61412 ?auto_61414 ?auto_61415 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61442 - DIRECTION
      ?auto_61443 - MODE
      ?auto_61444 - DIRECTION
      ?auto_61441 - MODE
      ?auto_61446 - DIRECTION
      ?auto_61445 - MODE
      ?auto_61447 - DIRECTION
      ?auto_61448 - MODE
    )
    :vars
    (
      ?auto_61450 - INSTRUMENT
      ?auto_61449 - SATELLITE
      ?auto_61451 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_61444 ?auto_61442 ) ) ( not ( = ?auto_61446 ?auto_61442 ) ) ( not ( = ?auto_61446 ?auto_61444 ) ) ( not ( = ?auto_61447 ?auto_61442 ) ) ( not ( = ?auto_61447 ?auto_61444 ) ) ( not ( = ?auto_61447 ?auto_61446 ) ) ( ON_BOARD ?auto_61450 ?auto_61449 ) ( SUPPORTS ?auto_61450 ?auto_61445 ) ( not ( = ?auto_61446 ?auto_61451 ) ) ( HAVE_IMAGE ?auto_61442 ?auto_61443 ) ( not ( = ?auto_61442 ?auto_61451 ) ) ( not ( = ?auto_61443 ?auto_61445 ) ) ( CALIBRATION_TARGET ?auto_61450 ?auto_61451 ) ( POWER_AVAIL ?auto_61449 ) ( POINTING ?auto_61449 ?auto_61444 ) ( not ( = ?auto_61451 ?auto_61444 ) ) ( HAVE_IMAGE ?auto_61444 ?auto_61441 ) ( HAVE_IMAGE ?auto_61447 ?auto_61448 ) ( not ( = ?auto_61443 ?auto_61441 ) ) ( not ( = ?auto_61443 ?auto_61448 ) ) ( not ( = ?auto_61441 ?auto_61445 ) ) ( not ( = ?auto_61441 ?auto_61448 ) ) ( not ( = ?auto_61445 ?auto_61448 ) ) ( not ( = ?auto_61447 ?auto_61451 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61442 ?auto_61443 ?auto_61446 ?auto_61445 )
      ( GET-4IMAGE-VERIFY ?auto_61442 ?auto_61443 ?auto_61444 ?auto_61441 ?auto_61446 ?auto_61445 ?auto_61447 ?auto_61448 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61546 - DIRECTION
      ?auto_61547 - MODE
      ?auto_61548 - DIRECTION
      ?auto_61545 - MODE
      ?auto_61550 - DIRECTION
      ?auto_61549 - MODE
      ?auto_61551 - DIRECTION
      ?auto_61552 - MODE
    )
    :vars
    (
      ?auto_61554 - INSTRUMENT
      ?auto_61553 - SATELLITE
      ?auto_61555 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_61548 ?auto_61546 ) ) ( not ( = ?auto_61550 ?auto_61546 ) ) ( not ( = ?auto_61550 ?auto_61548 ) ) ( not ( = ?auto_61551 ?auto_61546 ) ) ( not ( = ?auto_61551 ?auto_61548 ) ) ( not ( = ?auto_61551 ?auto_61550 ) ) ( ON_BOARD ?auto_61554 ?auto_61553 ) ( SUPPORTS ?auto_61554 ?auto_61545 ) ( not ( = ?auto_61548 ?auto_61555 ) ) ( HAVE_IMAGE ?auto_61546 ?auto_61547 ) ( not ( = ?auto_61546 ?auto_61555 ) ) ( not ( = ?auto_61547 ?auto_61545 ) ) ( CALIBRATION_TARGET ?auto_61554 ?auto_61555 ) ( POWER_AVAIL ?auto_61553 ) ( POINTING ?auto_61553 ?auto_61551 ) ( not ( = ?auto_61555 ?auto_61551 ) ) ( HAVE_IMAGE ?auto_61550 ?auto_61549 ) ( HAVE_IMAGE ?auto_61551 ?auto_61552 ) ( not ( = ?auto_61547 ?auto_61549 ) ) ( not ( = ?auto_61547 ?auto_61552 ) ) ( not ( = ?auto_61545 ?auto_61549 ) ) ( not ( = ?auto_61545 ?auto_61552 ) ) ( not ( = ?auto_61550 ?auto_61555 ) ) ( not ( = ?auto_61549 ?auto_61552 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61546 ?auto_61547 ?auto_61548 ?auto_61545 )
      ( GET-4IMAGE-VERIFY ?auto_61546 ?auto_61547 ?auto_61548 ?auto_61545 ?auto_61550 ?auto_61549 ?auto_61551 ?auto_61552 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_61580 - DIRECTION
      ?auto_61581 - MODE
      ?auto_61582 - DIRECTION
      ?auto_61579 - MODE
      ?auto_61584 - DIRECTION
      ?auto_61583 - MODE
      ?auto_61585 - DIRECTION
      ?auto_61586 - MODE
    )
    :vars
    (
      ?auto_61588 - INSTRUMENT
      ?auto_61587 - SATELLITE
      ?auto_61589 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_61582 ?auto_61580 ) ) ( not ( = ?auto_61584 ?auto_61580 ) ) ( not ( = ?auto_61584 ?auto_61582 ) ) ( not ( = ?auto_61585 ?auto_61580 ) ) ( not ( = ?auto_61585 ?auto_61582 ) ) ( not ( = ?auto_61585 ?auto_61584 ) ) ( ON_BOARD ?auto_61588 ?auto_61587 ) ( SUPPORTS ?auto_61588 ?auto_61579 ) ( not ( = ?auto_61582 ?auto_61589 ) ) ( HAVE_IMAGE ?auto_61580 ?auto_61581 ) ( not ( = ?auto_61580 ?auto_61589 ) ) ( not ( = ?auto_61581 ?auto_61579 ) ) ( CALIBRATION_TARGET ?auto_61588 ?auto_61589 ) ( POWER_AVAIL ?auto_61587 ) ( POINTING ?auto_61587 ?auto_61584 ) ( not ( = ?auto_61589 ?auto_61584 ) ) ( HAVE_IMAGE ?auto_61584 ?auto_61583 ) ( HAVE_IMAGE ?auto_61585 ?auto_61586 ) ( not ( = ?auto_61581 ?auto_61583 ) ) ( not ( = ?auto_61581 ?auto_61586 ) ) ( not ( = ?auto_61579 ?auto_61583 ) ) ( not ( = ?auto_61579 ?auto_61586 ) ) ( not ( = ?auto_61583 ?auto_61586 ) ) ( not ( = ?auto_61585 ?auto_61589 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_61580 ?auto_61581 ?auto_61582 ?auto_61579 )
      ( GET-4IMAGE-VERIFY ?auto_61580 ?auto_61581 ?auto_61582 ?auto_61579 ?auto_61584 ?auto_61583 ?auto_61585 ?auto_61586 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_62117 - DIRECTION
      ?auto_62118 - MODE
      ?auto_62119 - DIRECTION
      ?auto_62116 - MODE
      ?auto_62121 - DIRECTION
      ?auto_62120 - MODE
      ?auto_62122 - DIRECTION
      ?auto_62123 - MODE
    )
    :vars
    (
      ?auto_62125 - INSTRUMENT
      ?auto_62124 - SATELLITE
      ?auto_62126 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_62119 ?auto_62117 ) ) ( not ( = ?auto_62121 ?auto_62117 ) ) ( not ( = ?auto_62121 ?auto_62119 ) ) ( not ( = ?auto_62122 ?auto_62117 ) ) ( not ( = ?auto_62122 ?auto_62119 ) ) ( not ( = ?auto_62122 ?auto_62121 ) ) ( ON_BOARD ?auto_62125 ?auto_62124 ) ( SUPPORTS ?auto_62125 ?auto_62123 ) ( not ( = ?auto_62122 ?auto_62126 ) ) ( HAVE_IMAGE ?auto_62119 ?auto_62116 ) ( not ( = ?auto_62119 ?auto_62126 ) ) ( not ( = ?auto_62116 ?auto_62123 ) ) ( CALIBRATION_TARGET ?auto_62125 ?auto_62126 ) ( POWER_AVAIL ?auto_62124 ) ( POINTING ?auto_62124 ?auto_62117 ) ( not ( = ?auto_62126 ?auto_62117 ) ) ( HAVE_IMAGE ?auto_62117 ?auto_62118 ) ( HAVE_IMAGE ?auto_62121 ?auto_62120 ) ( not ( = ?auto_62118 ?auto_62116 ) ) ( not ( = ?auto_62118 ?auto_62120 ) ) ( not ( = ?auto_62118 ?auto_62123 ) ) ( not ( = ?auto_62116 ?auto_62120 ) ) ( not ( = ?auto_62121 ?auto_62126 ) ) ( not ( = ?auto_62120 ?auto_62123 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_62119 ?auto_62116 ?auto_62122 ?auto_62123 )
      ( GET-4IMAGE-VERIFY ?auto_62117 ?auto_62118 ?auto_62119 ?auto_62116 ?auto_62121 ?auto_62120 ?auto_62122 ?auto_62123 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_62150 - DIRECTION
      ?auto_62151 - MODE
      ?auto_62152 - DIRECTION
      ?auto_62149 - MODE
      ?auto_62154 - DIRECTION
      ?auto_62153 - MODE
      ?auto_62155 - DIRECTION
      ?auto_62156 - MODE
    )
    :vars
    (
      ?auto_62158 - INSTRUMENT
      ?auto_62157 - SATELLITE
      ?auto_62159 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_62152 ?auto_62150 ) ) ( not ( = ?auto_62154 ?auto_62150 ) ) ( not ( = ?auto_62154 ?auto_62152 ) ) ( not ( = ?auto_62155 ?auto_62150 ) ) ( not ( = ?auto_62155 ?auto_62152 ) ) ( not ( = ?auto_62155 ?auto_62154 ) ) ( ON_BOARD ?auto_62158 ?auto_62157 ) ( SUPPORTS ?auto_62158 ?auto_62153 ) ( not ( = ?auto_62154 ?auto_62159 ) ) ( HAVE_IMAGE ?auto_62152 ?auto_62149 ) ( not ( = ?auto_62152 ?auto_62159 ) ) ( not ( = ?auto_62149 ?auto_62153 ) ) ( CALIBRATION_TARGET ?auto_62158 ?auto_62159 ) ( POWER_AVAIL ?auto_62157 ) ( POINTING ?auto_62157 ?auto_62150 ) ( not ( = ?auto_62159 ?auto_62150 ) ) ( HAVE_IMAGE ?auto_62150 ?auto_62151 ) ( HAVE_IMAGE ?auto_62155 ?auto_62156 ) ( not ( = ?auto_62151 ?auto_62149 ) ) ( not ( = ?auto_62151 ?auto_62153 ) ) ( not ( = ?auto_62151 ?auto_62156 ) ) ( not ( = ?auto_62149 ?auto_62156 ) ) ( not ( = ?auto_62153 ?auto_62156 ) ) ( not ( = ?auto_62155 ?auto_62159 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_62152 ?auto_62149 ?auto_62154 ?auto_62153 )
      ( GET-4IMAGE-VERIFY ?auto_62150 ?auto_62151 ?auto_62152 ?auto_62149 ?auto_62154 ?auto_62153 ?auto_62155 ?auto_62156 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_62362 - DIRECTION
      ?auto_62363 - MODE
      ?auto_62364 - DIRECTION
      ?auto_62361 - MODE
      ?auto_62366 - DIRECTION
      ?auto_62365 - MODE
      ?auto_62367 - DIRECTION
      ?auto_62368 - MODE
    )
    :vars
    (
      ?auto_62370 - INSTRUMENT
      ?auto_62369 - SATELLITE
      ?auto_62371 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_62364 ?auto_62362 ) ) ( not ( = ?auto_62366 ?auto_62362 ) ) ( not ( = ?auto_62366 ?auto_62364 ) ) ( not ( = ?auto_62367 ?auto_62362 ) ) ( not ( = ?auto_62367 ?auto_62364 ) ) ( not ( = ?auto_62367 ?auto_62366 ) ) ( ON_BOARD ?auto_62370 ?auto_62369 ) ( SUPPORTS ?auto_62370 ?auto_62361 ) ( not ( = ?auto_62364 ?auto_62371 ) ) ( HAVE_IMAGE ?auto_62366 ?auto_62365 ) ( not ( = ?auto_62366 ?auto_62371 ) ) ( not ( = ?auto_62365 ?auto_62361 ) ) ( CALIBRATION_TARGET ?auto_62370 ?auto_62371 ) ( POWER_AVAIL ?auto_62369 ) ( POINTING ?auto_62369 ?auto_62362 ) ( not ( = ?auto_62371 ?auto_62362 ) ) ( HAVE_IMAGE ?auto_62362 ?auto_62363 ) ( HAVE_IMAGE ?auto_62367 ?auto_62368 ) ( not ( = ?auto_62363 ?auto_62361 ) ) ( not ( = ?auto_62363 ?auto_62365 ) ) ( not ( = ?auto_62363 ?auto_62368 ) ) ( not ( = ?auto_62361 ?auto_62368 ) ) ( not ( = ?auto_62365 ?auto_62368 ) ) ( not ( = ?auto_62367 ?auto_62371 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_62366 ?auto_62365 ?auto_62364 ?auto_62361 )
      ( GET-4IMAGE-VERIFY ?auto_62362 ?auto_62363 ?auto_62364 ?auto_62361 ?auto_62366 ?auto_62365 ?auto_62367 ?auto_62368 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_62613 - DIRECTION
      ?auto_62614 - MODE
      ?auto_62615 - DIRECTION
      ?auto_62612 - MODE
      ?auto_62617 - DIRECTION
      ?auto_62616 - MODE
      ?auto_62618 - DIRECTION
      ?auto_62619 - MODE
    )
    :vars
    (
      ?auto_62621 - INSTRUMENT
      ?auto_62620 - SATELLITE
      ?auto_62622 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_62615 ?auto_62613 ) ) ( not ( = ?auto_62617 ?auto_62613 ) ) ( not ( = ?auto_62617 ?auto_62615 ) ) ( not ( = ?auto_62618 ?auto_62613 ) ) ( not ( = ?auto_62618 ?auto_62615 ) ) ( not ( = ?auto_62618 ?auto_62617 ) ) ( ON_BOARD ?auto_62621 ?auto_62620 ) ( SUPPORTS ?auto_62621 ?auto_62614 ) ( not ( = ?auto_62613 ?auto_62622 ) ) ( HAVE_IMAGE ?auto_62615 ?auto_62612 ) ( not ( = ?auto_62615 ?auto_62622 ) ) ( not ( = ?auto_62612 ?auto_62614 ) ) ( CALIBRATION_TARGET ?auto_62621 ?auto_62622 ) ( POWER_AVAIL ?auto_62620 ) ( POINTING ?auto_62620 ?auto_62618 ) ( not ( = ?auto_62622 ?auto_62618 ) ) ( HAVE_IMAGE ?auto_62617 ?auto_62616 ) ( HAVE_IMAGE ?auto_62618 ?auto_62619 ) ( not ( = ?auto_62614 ?auto_62616 ) ) ( not ( = ?auto_62614 ?auto_62619 ) ) ( not ( = ?auto_62612 ?auto_62616 ) ) ( not ( = ?auto_62612 ?auto_62619 ) ) ( not ( = ?auto_62617 ?auto_62622 ) ) ( not ( = ?auto_62616 ?auto_62619 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_62615 ?auto_62612 ?auto_62613 ?auto_62614 )
      ( GET-4IMAGE-VERIFY ?auto_62613 ?auto_62614 ?auto_62615 ?auto_62612 ?auto_62617 ?auto_62616 ?auto_62618 ?auto_62619 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_62647 - DIRECTION
      ?auto_62648 - MODE
      ?auto_62649 - DIRECTION
      ?auto_62646 - MODE
      ?auto_62651 - DIRECTION
      ?auto_62650 - MODE
      ?auto_62652 - DIRECTION
      ?auto_62653 - MODE
    )
    :vars
    (
      ?auto_62655 - INSTRUMENT
      ?auto_62654 - SATELLITE
      ?auto_62656 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_62649 ?auto_62647 ) ) ( not ( = ?auto_62651 ?auto_62647 ) ) ( not ( = ?auto_62651 ?auto_62649 ) ) ( not ( = ?auto_62652 ?auto_62647 ) ) ( not ( = ?auto_62652 ?auto_62649 ) ) ( not ( = ?auto_62652 ?auto_62651 ) ) ( ON_BOARD ?auto_62655 ?auto_62654 ) ( SUPPORTS ?auto_62655 ?auto_62648 ) ( not ( = ?auto_62647 ?auto_62656 ) ) ( HAVE_IMAGE ?auto_62649 ?auto_62646 ) ( not ( = ?auto_62649 ?auto_62656 ) ) ( not ( = ?auto_62646 ?auto_62648 ) ) ( CALIBRATION_TARGET ?auto_62655 ?auto_62656 ) ( POWER_AVAIL ?auto_62654 ) ( POINTING ?auto_62654 ?auto_62651 ) ( not ( = ?auto_62656 ?auto_62651 ) ) ( HAVE_IMAGE ?auto_62651 ?auto_62650 ) ( HAVE_IMAGE ?auto_62652 ?auto_62653 ) ( not ( = ?auto_62648 ?auto_62650 ) ) ( not ( = ?auto_62648 ?auto_62653 ) ) ( not ( = ?auto_62646 ?auto_62650 ) ) ( not ( = ?auto_62646 ?auto_62653 ) ) ( not ( = ?auto_62650 ?auto_62653 ) ) ( not ( = ?auto_62652 ?auto_62656 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_62649 ?auto_62646 ?auto_62647 ?auto_62648 )
      ( GET-4IMAGE-VERIFY ?auto_62647 ?auto_62648 ?auto_62649 ?auto_62646 ?auto_62651 ?auto_62650 ?auto_62652 ?auto_62653 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_62935 - DIRECTION
      ?auto_62936 - MODE
      ?auto_62937 - DIRECTION
      ?auto_62934 - MODE
      ?auto_62939 - DIRECTION
      ?auto_62938 - MODE
      ?auto_62940 - DIRECTION
      ?auto_62941 - MODE
    )
    :vars
    (
      ?auto_62943 - INSTRUMENT
      ?auto_62942 - SATELLITE
      ?auto_62944 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_62937 ?auto_62935 ) ) ( not ( = ?auto_62939 ?auto_62935 ) ) ( not ( = ?auto_62939 ?auto_62937 ) ) ( not ( = ?auto_62940 ?auto_62935 ) ) ( not ( = ?auto_62940 ?auto_62937 ) ) ( not ( = ?auto_62940 ?auto_62939 ) ) ( ON_BOARD ?auto_62943 ?auto_62942 ) ( SUPPORTS ?auto_62943 ?auto_62936 ) ( not ( = ?auto_62935 ?auto_62944 ) ) ( HAVE_IMAGE ?auto_62939 ?auto_62938 ) ( not ( = ?auto_62939 ?auto_62944 ) ) ( not ( = ?auto_62938 ?auto_62936 ) ) ( CALIBRATION_TARGET ?auto_62943 ?auto_62944 ) ( POWER_AVAIL ?auto_62942 ) ( POINTING ?auto_62942 ?auto_62937 ) ( not ( = ?auto_62944 ?auto_62937 ) ) ( HAVE_IMAGE ?auto_62937 ?auto_62934 ) ( HAVE_IMAGE ?auto_62940 ?auto_62941 ) ( not ( = ?auto_62936 ?auto_62934 ) ) ( not ( = ?auto_62936 ?auto_62941 ) ) ( not ( = ?auto_62934 ?auto_62938 ) ) ( not ( = ?auto_62934 ?auto_62941 ) ) ( not ( = ?auto_62938 ?auto_62941 ) ) ( not ( = ?auto_62940 ?auto_62944 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_62939 ?auto_62938 ?auto_62935 ?auto_62936 )
      ( GET-4IMAGE-VERIFY ?auto_62935 ?auto_62936 ?auto_62937 ?auto_62934 ?auto_62939 ?auto_62938 ?auto_62940 ?auto_62941 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_63395 - DIRECTION
      ?auto_63396 - MODE
      ?auto_63397 - DIRECTION
      ?auto_63394 - MODE
      ?auto_63399 - DIRECTION
      ?auto_63398 - MODE
    )
    :vars
    (
      ?auto_63404 - INSTRUMENT
      ?auto_63400 - SATELLITE
      ?auto_63403 - DIRECTION
      ?auto_63402 - DIRECTION
      ?auto_63401 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_63397 ?auto_63395 ) ) ( not ( = ?auto_63399 ?auto_63395 ) ) ( not ( = ?auto_63399 ?auto_63397 ) ) ( ON_BOARD ?auto_63404 ?auto_63400 ) ( SUPPORTS ?auto_63404 ?auto_63398 ) ( not ( = ?auto_63399 ?auto_63403 ) ) ( HAVE_IMAGE ?auto_63395 ?auto_63396 ) ( not ( = ?auto_63395 ?auto_63403 ) ) ( not ( = ?auto_63396 ?auto_63398 ) ) ( CALIBRATION_TARGET ?auto_63404 ?auto_63403 ) ( POINTING ?auto_63400 ?auto_63402 ) ( not ( = ?auto_63403 ?auto_63402 ) ) ( not ( = ?auto_63399 ?auto_63402 ) ) ( not ( = ?auto_63395 ?auto_63402 ) ) ( ON_BOARD ?auto_63401 ?auto_63400 ) ( POWER_ON ?auto_63401 ) ( not ( = ?auto_63404 ?auto_63401 ) ) ( HAVE_IMAGE ?auto_63397 ?auto_63394 ) ( not ( = ?auto_63396 ?auto_63394 ) ) ( not ( = ?auto_63397 ?auto_63403 ) ) ( not ( = ?auto_63397 ?auto_63402 ) ) ( not ( = ?auto_63394 ?auto_63398 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63395 ?auto_63396 ?auto_63399 ?auto_63398 )
      ( GET-3IMAGE-VERIFY ?auto_63395 ?auto_63396 ?auto_63397 ?auto_63394 ?auto_63399 ?auto_63398 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_63427 - DIRECTION
      ?auto_63428 - MODE
      ?auto_63429 - DIRECTION
      ?auto_63426 - MODE
      ?auto_63431 - DIRECTION
      ?auto_63430 - MODE
    )
    :vars
    (
      ?auto_63436 - INSTRUMENT
      ?auto_63432 - SATELLITE
      ?auto_63435 - DIRECTION
      ?auto_63434 - DIRECTION
      ?auto_63433 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_63429 ?auto_63427 ) ) ( not ( = ?auto_63431 ?auto_63427 ) ) ( not ( = ?auto_63431 ?auto_63429 ) ) ( ON_BOARD ?auto_63436 ?auto_63432 ) ( SUPPORTS ?auto_63436 ?auto_63426 ) ( not ( = ?auto_63429 ?auto_63435 ) ) ( HAVE_IMAGE ?auto_63427 ?auto_63428 ) ( not ( = ?auto_63427 ?auto_63435 ) ) ( not ( = ?auto_63428 ?auto_63426 ) ) ( CALIBRATION_TARGET ?auto_63436 ?auto_63435 ) ( POINTING ?auto_63432 ?auto_63434 ) ( not ( = ?auto_63435 ?auto_63434 ) ) ( not ( = ?auto_63429 ?auto_63434 ) ) ( not ( = ?auto_63427 ?auto_63434 ) ) ( ON_BOARD ?auto_63433 ?auto_63432 ) ( POWER_ON ?auto_63433 ) ( not ( = ?auto_63436 ?auto_63433 ) ) ( HAVE_IMAGE ?auto_63431 ?auto_63430 ) ( not ( = ?auto_63428 ?auto_63430 ) ) ( not ( = ?auto_63426 ?auto_63430 ) ) ( not ( = ?auto_63431 ?auto_63435 ) ) ( not ( = ?auto_63431 ?auto_63434 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63427 ?auto_63428 ?auto_63429 ?auto_63426 )
      ( GET-3IMAGE-VERIFY ?auto_63427 ?auto_63428 ?auto_63429 ?auto_63426 ?auto_63431 ?auto_63430 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_63601 - DIRECTION
      ?auto_63602 - MODE
      ?auto_63603 - DIRECTION
      ?auto_63600 - MODE
      ?auto_63605 - DIRECTION
      ?auto_63604 - MODE
    )
    :vars
    (
      ?auto_63610 - INSTRUMENT
      ?auto_63606 - SATELLITE
      ?auto_63609 - DIRECTION
      ?auto_63608 - DIRECTION
      ?auto_63607 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_63603 ?auto_63601 ) ) ( not ( = ?auto_63605 ?auto_63601 ) ) ( not ( = ?auto_63605 ?auto_63603 ) ) ( ON_BOARD ?auto_63610 ?auto_63606 ) ( SUPPORTS ?auto_63610 ?auto_63602 ) ( not ( = ?auto_63601 ?auto_63609 ) ) ( HAVE_IMAGE ?auto_63603 ?auto_63600 ) ( not ( = ?auto_63603 ?auto_63609 ) ) ( not ( = ?auto_63600 ?auto_63602 ) ) ( CALIBRATION_TARGET ?auto_63610 ?auto_63609 ) ( POINTING ?auto_63606 ?auto_63608 ) ( not ( = ?auto_63609 ?auto_63608 ) ) ( not ( = ?auto_63601 ?auto_63608 ) ) ( not ( = ?auto_63603 ?auto_63608 ) ) ( ON_BOARD ?auto_63607 ?auto_63606 ) ( POWER_ON ?auto_63607 ) ( not ( = ?auto_63610 ?auto_63607 ) ) ( HAVE_IMAGE ?auto_63605 ?auto_63604 ) ( not ( = ?auto_63602 ?auto_63604 ) ) ( not ( = ?auto_63600 ?auto_63604 ) ) ( not ( = ?auto_63605 ?auto_63609 ) ) ( not ( = ?auto_63605 ?auto_63608 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63603 ?auto_63600 ?auto_63601 ?auto_63602 )
      ( GET-3IMAGE-VERIFY ?auto_63601 ?auto_63602 ?auto_63603 ?auto_63600 ?auto_63605 ?auto_63604 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_63875 - DIRECTION
      ?auto_63876 - MODE
      ?auto_63877 - DIRECTION
      ?auto_63874 - MODE
      ?auto_63879 - DIRECTION
      ?auto_63878 - MODE
      ?auto_63880 - DIRECTION
      ?auto_63881 - MODE
    )
    :vars
    (
      ?auto_63885 - INSTRUMENT
      ?auto_63882 - SATELLITE
      ?auto_63884 - DIRECTION
      ?auto_63883 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_63877 ?auto_63875 ) ) ( not ( = ?auto_63879 ?auto_63875 ) ) ( not ( = ?auto_63879 ?auto_63877 ) ) ( not ( = ?auto_63880 ?auto_63875 ) ) ( not ( = ?auto_63880 ?auto_63877 ) ) ( not ( = ?auto_63880 ?auto_63879 ) ) ( ON_BOARD ?auto_63885 ?auto_63882 ) ( SUPPORTS ?auto_63885 ?auto_63881 ) ( not ( = ?auto_63880 ?auto_63884 ) ) ( HAVE_IMAGE ?auto_63875 ?auto_63876 ) ( not ( = ?auto_63875 ?auto_63884 ) ) ( not ( = ?auto_63876 ?auto_63881 ) ) ( CALIBRATION_TARGET ?auto_63885 ?auto_63884 ) ( POINTING ?auto_63882 ?auto_63879 ) ( not ( = ?auto_63884 ?auto_63879 ) ) ( ON_BOARD ?auto_63883 ?auto_63882 ) ( POWER_ON ?auto_63883 ) ( not ( = ?auto_63885 ?auto_63883 ) ) ( HAVE_IMAGE ?auto_63877 ?auto_63874 ) ( HAVE_IMAGE ?auto_63879 ?auto_63878 ) ( not ( = ?auto_63876 ?auto_63874 ) ) ( not ( = ?auto_63876 ?auto_63878 ) ) ( not ( = ?auto_63877 ?auto_63884 ) ) ( not ( = ?auto_63874 ?auto_63878 ) ) ( not ( = ?auto_63874 ?auto_63881 ) ) ( not ( = ?auto_63878 ?auto_63881 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63875 ?auto_63876 ?auto_63880 ?auto_63881 )
      ( GET-4IMAGE-VERIFY ?auto_63875 ?auto_63876 ?auto_63877 ?auto_63874 ?auto_63879 ?auto_63878 ?auto_63880 ?auto_63881 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_63913 - DIRECTION
      ?auto_63914 - MODE
      ?auto_63915 - DIRECTION
      ?auto_63912 - MODE
      ?auto_63917 - DIRECTION
      ?auto_63916 - MODE
      ?auto_63918 - DIRECTION
      ?auto_63919 - MODE
    )
    :vars
    (
      ?auto_63923 - INSTRUMENT
      ?auto_63920 - SATELLITE
      ?auto_63922 - DIRECTION
      ?auto_63921 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_63915 ?auto_63913 ) ) ( not ( = ?auto_63917 ?auto_63913 ) ) ( not ( = ?auto_63917 ?auto_63915 ) ) ( not ( = ?auto_63918 ?auto_63913 ) ) ( not ( = ?auto_63918 ?auto_63915 ) ) ( not ( = ?auto_63918 ?auto_63917 ) ) ( ON_BOARD ?auto_63923 ?auto_63920 ) ( SUPPORTS ?auto_63923 ?auto_63916 ) ( not ( = ?auto_63917 ?auto_63922 ) ) ( HAVE_IMAGE ?auto_63913 ?auto_63914 ) ( not ( = ?auto_63913 ?auto_63922 ) ) ( not ( = ?auto_63914 ?auto_63916 ) ) ( CALIBRATION_TARGET ?auto_63923 ?auto_63922 ) ( POINTING ?auto_63920 ?auto_63918 ) ( not ( = ?auto_63922 ?auto_63918 ) ) ( ON_BOARD ?auto_63921 ?auto_63920 ) ( POWER_ON ?auto_63921 ) ( not ( = ?auto_63923 ?auto_63921 ) ) ( HAVE_IMAGE ?auto_63915 ?auto_63912 ) ( HAVE_IMAGE ?auto_63918 ?auto_63919 ) ( not ( = ?auto_63914 ?auto_63912 ) ) ( not ( = ?auto_63914 ?auto_63919 ) ) ( not ( = ?auto_63915 ?auto_63922 ) ) ( not ( = ?auto_63912 ?auto_63916 ) ) ( not ( = ?auto_63912 ?auto_63919 ) ) ( not ( = ?auto_63916 ?auto_63919 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63913 ?auto_63914 ?auto_63917 ?auto_63916 )
      ( GET-4IMAGE-VERIFY ?auto_63913 ?auto_63914 ?auto_63915 ?auto_63912 ?auto_63917 ?auto_63916 ?auto_63918 ?auto_63919 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_63950 - DIRECTION
      ?auto_63951 - MODE
      ?auto_63952 - DIRECTION
      ?auto_63949 - MODE
      ?auto_63954 - DIRECTION
      ?auto_63953 - MODE
      ?auto_63955 - DIRECTION
      ?auto_63956 - MODE
    )
    :vars
    (
      ?auto_63960 - INSTRUMENT
      ?auto_63957 - SATELLITE
      ?auto_63959 - DIRECTION
      ?auto_63958 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_63952 ?auto_63950 ) ) ( not ( = ?auto_63954 ?auto_63950 ) ) ( not ( = ?auto_63954 ?auto_63952 ) ) ( not ( = ?auto_63955 ?auto_63950 ) ) ( not ( = ?auto_63955 ?auto_63952 ) ) ( not ( = ?auto_63955 ?auto_63954 ) ) ( ON_BOARD ?auto_63960 ?auto_63957 ) ( SUPPORTS ?auto_63960 ?auto_63956 ) ( not ( = ?auto_63955 ?auto_63959 ) ) ( HAVE_IMAGE ?auto_63950 ?auto_63951 ) ( not ( = ?auto_63950 ?auto_63959 ) ) ( not ( = ?auto_63951 ?auto_63956 ) ) ( CALIBRATION_TARGET ?auto_63960 ?auto_63959 ) ( POINTING ?auto_63957 ?auto_63952 ) ( not ( = ?auto_63959 ?auto_63952 ) ) ( ON_BOARD ?auto_63958 ?auto_63957 ) ( POWER_ON ?auto_63958 ) ( not ( = ?auto_63960 ?auto_63958 ) ) ( HAVE_IMAGE ?auto_63952 ?auto_63949 ) ( HAVE_IMAGE ?auto_63954 ?auto_63953 ) ( not ( = ?auto_63951 ?auto_63949 ) ) ( not ( = ?auto_63951 ?auto_63953 ) ) ( not ( = ?auto_63949 ?auto_63953 ) ) ( not ( = ?auto_63949 ?auto_63956 ) ) ( not ( = ?auto_63954 ?auto_63959 ) ) ( not ( = ?auto_63953 ?auto_63956 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63950 ?auto_63951 ?auto_63955 ?auto_63956 )
      ( GET-4IMAGE-VERIFY ?auto_63950 ?auto_63951 ?auto_63952 ?auto_63949 ?auto_63954 ?auto_63953 ?auto_63955 ?auto_63956 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_63986 - DIRECTION
      ?auto_63987 - MODE
      ?auto_63988 - DIRECTION
      ?auto_63985 - MODE
      ?auto_63990 - DIRECTION
      ?auto_63989 - MODE
      ?auto_63991 - DIRECTION
      ?auto_63992 - MODE
    )
    :vars
    (
      ?auto_63996 - INSTRUMENT
      ?auto_63993 - SATELLITE
      ?auto_63995 - DIRECTION
      ?auto_63994 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_63988 ?auto_63986 ) ) ( not ( = ?auto_63990 ?auto_63986 ) ) ( not ( = ?auto_63990 ?auto_63988 ) ) ( not ( = ?auto_63991 ?auto_63986 ) ) ( not ( = ?auto_63991 ?auto_63988 ) ) ( not ( = ?auto_63991 ?auto_63990 ) ) ( ON_BOARD ?auto_63996 ?auto_63993 ) ( SUPPORTS ?auto_63996 ?auto_63989 ) ( not ( = ?auto_63990 ?auto_63995 ) ) ( HAVE_IMAGE ?auto_63986 ?auto_63987 ) ( not ( = ?auto_63986 ?auto_63995 ) ) ( not ( = ?auto_63987 ?auto_63989 ) ) ( CALIBRATION_TARGET ?auto_63996 ?auto_63995 ) ( POINTING ?auto_63993 ?auto_63988 ) ( not ( = ?auto_63995 ?auto_63988 ) ) ( ON_BOARD ?auto_63994 ?auto_63993 ) ( POWER_ON ?auto_63994 ) ( not ( = ?auto_63996 ?auto_63994 ) ) ( HAVE_IMAGE ?auto_63988 ?auto_63985 ) ( HAVE_IMAGE ?auto_63991 ?auto_63992 ) ( not ( = ?auto_63987 ?auto_63985 ) ) ( not ( = ?auto_63987 ?auto_63992 ) ) ( not ( = ?auto_63985 ?auto_63989 ) ) ( not ( = ?auto_63985 ?auto_63992 ) ) ( not ( = ?auto_63989 ?auto_63992 ) ) ( not ( = ?auto_63991 ?auto_63995 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_63986 ?auto_63987 ?auto_63990 ?auto_63989 )
      ( GET-4IMAGE-VERIFY ?auto_63986 ?auto_63987 ?auto_63988 ?auto_63985 ?auto_63990 ?auto_63989 ?auto_63991 ?auto_63992 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_64099 - DIRECTION
      ?auto_64100 - MODE
      ?auto_64101 - DIRECTION
      ?auto_64098 - MODE
      ?auto_64103 - DIRECTION
      ?auto_64102 - MODE
      ?auto_64104 - DIRECTION
      ?auto_64105 - MODE
    )
    :vars
    (
      ?auto_64109 - INSTRUMENT
      ?auto_64106 - SATELLITE
      ?auto_64108 - DIRECTION
      ?auto_64107 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_64101 ?auto_64099 ) ) ( not ( = ?auto_64103 ?auto_64099 ) ) ( not ( = ?auto_64103 ?auto_64101 ) ) ( not ( = ?auto_64104 ?auto_64099 ) ) ( not ( = ?auto_64104 ?auto_64101 ) ) ( not ( = ?auto_64104 ?auto_64103 ) ) ( ON_BOARD ?auto_64109 ?auto_64106 ) ( SUPPORTS ?auto_64109 ?auto_64098 ) ( not ( = ?auto_64101 ?auto_64108 ) ) ( HAVE_IMAGE ?auto_64099 ?auto_64100 ) ( not ( = ?auto_64099 ?auto_64108 ) ) ( not ( = ?auto_64100 ?auto_64098 ) ) ( CALIBRATION_TARGET ?auto_64109 ?auto_64108 ) ( POINTING ?auto_64106 ?auto_64104 ) ( not ( = ?auto_64108 ?auto_64104 ) ) ( ON_BOARD ?auto_64107 ?auto_64106 ) ( POWER_ON ?auto_64107 ) ( not ( = ?auto_64109 ?auto_64107 ) ) ( HAVE_IMAGE ?auto_64103 ?auto_64102 ) ( HAVE_IMAGE ?auto_64104 ?auto_64105 ) ( not ( = ?auto_64100 ?auto_64102 ) ) ( not ( = ?auto_64100 ?auto_64105 ) ) ( not ( = ?auto_64098 ?auto_64102 ) ) ( not ( = ?auto_64098 ?auto_64105 ) ) ( not ( = ?auto_64103 ?auto_64108 ) ) ( not ( = ?auto_64102 ?auto_64105 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_64099 ?auto_64100 ?auto_64101 ?auto_64098 )
      ( GET-4IMAGE-VERIFY ?auto_64099 ?auto_64100 ?auto_64101 ?auto_64098 ?auto_64103 ?auto_64102 ?auto_64104 ?auto_64105 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_64136 - DIRECTION
      ?auto_64137 - MODE
      ?auto_64138 - DIRECTION
      ?auto_64135 - MODE
      ?auto_64140 - DIRECTION
      ?auto_64139 - MODE
      ?auto_64141 - DIRECTION
      ?auto_64142 - MODE
    )
    :vars
    (
      ?auto_64146 - INSTRUMENT
      ?auto_64143 - SATELLITE
      ?auto_64145 - DIRECTION
      ?auto_64144 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_64138 ?auto_64136 ) ) ( not ( = ?auto_64140 ?auto_64136 ) ) ( not ( = ?auto_64140 ?auto_64138 ) ) ( not ( = ?auto_64141 ?auto_64136 ) ) ( not ( = ?auto_64141 ?auto_64138 ) ) ( not ( = ?auto_64141 ?auto_64140 ) ) ( ON_BOARD ?auto_64146 ?auto_64143 ) ( SUPPORTS ?auto_64146 ?auto_64135 ) ( not ( = ?auto_64138 ?auto_64145 ) ) ( HAVE_IMAGE ?auto_64136 ?auto_64137 ) ( not ( = ?auto_64136 ?auto_64145 ) ) ( not ( = ?auto_64137 ?auto_64135 ) ) ( CALIBRATION_TARGET ?auto_64146 ?auto_64145 ) ( POINTING ?auto_64143 ?auto_64140 ) ( not ( = ?auto_64145 ?auto_64140 ) ) ( ON_BOARD ?auto_64144 ?auto_64143 ) ( POWER_ON ?auto_64144 ) ( not ( = ?auto_64146 ?auto_64144 ) ) ( HAVE_IMAGE ?auto_64140 ?auto_64139 ) ( HAVE_IMAGE ?auto_64141 ?auto_64142 ) ( not ( = ?auto_64137 ?auto_64139 ) ) ( not ( = ?auto_64137 ?auto_64142 ) ) ( not ( = ?auto_64135 ?auto_64139 ) ) ( not ( = ?auto_64135 ?auto_64142 ) ) ( not ( = ?auto_64139 ?auto_64142 ) ) ( not ( = ?auto_64141 ?auto_64145 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_64136 ?auto_64137 ?auto_64138 ?auto_64135 )
      ( GET-4IMAGE-VERIFY ?auto_64136 ?auto_64137 ?auto_64138 ?auto_64135 ?auto_64140 ?auto_64139 ?auto_64141 ?auto_64142 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_64712 - DIRECTION
      ?auto_64713 - MODE
      ?auto_64714 - DIRECTION
      ?auto_64711 - MODE
      ?auto_64716 - DIRECTION
      ?auto_64715 - MODE
      ?auto_64717 - DIRECTION
      ?auto_64718 - MODE
    )
    :vars
    (
      ?auto_64722 - INSTRUMENT
      ?auto_64719 - SATELLITE
      ?auto_64721 - DIRECTION
      ?auto_64720 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_64714 ?auto_64712 ) ) ( not ( = ?auto_64716 ?auto_64712 ) ) ( not ( = ?auto_64716 ?auto_64714 ) ) ( not ( = ?auto_64717 ?auto_64712 ) ) ( not ( = ?auto_64717 ?auto_64714 ) ) ( not ( = ?auto_64717 ?auto_64716 ) ) ( ON_BOARD ?auto_64722 ?auto_64719 ) ( SUPPORTS ?auto_64722 ?auto_64718 ) ( not ( = ?auto_64717 ?auto_64721 ) ) ( HAVE_IMAGE ?auto_64714 ?auto_64711 ) ( not ( = ?auto_64714 ?auto_64721 ) ) ( not ( = ?auto_64711 ?auto_64718 ) ) ( CALIBRATION_TARGET ?auto_64722 ?auto_64721 ) ( POINTING ?auto_64719 ?auto_64712 ) ( not ( = ?auto_64721 ?auto_64712 ) ) ( ON_BOARD ?auto_64720 ?auto_64719 ) ( POWER_ON ?auto_64720 ) ( not ( = ?auto_64722 ?auto_64720 ) ) ( HAVE_IMAGE ?auto_64712 ?auto_64713 ) ( HAVE_IMAGE ?auto_64716 ?auto_64715 ) ( not ( = ?auto_64713 ?auto_64711 ) ) ( not ( = ?auto_64713 ?auto_64715 ) ) ( not ( = ?auto_64713 ?auto_64718 ) ) ( not ( = ?auto_64711 ?auto_64715 ) ) ( not ( = ?auto_64716 ?auto_64721 ) ) ( not ( = ?auto_64715 ?auto_64718 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_64714 ?auto_64711 ?auto_64717 ?auto_64718 )
      ( GET-4IMAGE-VERIFY ?auto_64712 ?auto_64713 ?auto_64714 ?auto_64711 ?auto_64716 ?auto_64715 ?auto_64717 ?auto_64718 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_64748 - DIRECTION
      ?auto_64749 - MODE
      ?auto_64750 - DIRECTION
      ?auto_64747 - MODE
      ?auto_64752 - DIRECTION
      ?auto_64751 - MODE
      ?auto_64753 - DIRECTION
      ?auto_64754 - MODE
    )
    :vars
    (
      ?auto_64758 - INSTRUMENT
      ?auto_64755 - SATELLITE
      ?auto_64757 - DIRECTION
      ?auto_64756 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_64750 ?auto_64748 ) ) ( not ( = ?auto_64752 ?auto_64748 ) ) ( not ( = ?auto_64752 ?auto_64750 ) ) ( not ( = ?auto_64753 ?auto_64748 ) ) ( not ( = ?auto_64753 ?auto_64750 ) ) ( not ( = ?auto_64753 ?auto_64752 ) ) ( ON_BOARD ?auto_64758 ?auto_64755 ) ( SUPPORTS ?auto_64758 ?auto_64751 ) ( not ( = ?auto_64752 ?auto_64757 ) ) ( HAVE_IMAGE ?auto_64750 ?auto_64747 ) ( not ( = ?auto_64750 ?auto_64757 ) ) ( not ( = ?auto_64747 ?auto_64751 ) ) ( CALIBRATION_TARGET ?auto_64758 ?auto_64757 ) ( POINTING ?auto_64755 ?auto_64748 ) ( not ( = ?auto_64757 ?auto_64748 ) ) ( ON_BOARD ?auto_64756 ?auto_64755 ) ( POWER_ON ?auto_64756 ) ( not ( = ?auto_64758 ?auto_64756 ) ) ( HAVE_IMAGE ?auto_64748 ?auto_64749 ) ( HAVE_IMAGE ?auto_64753 ?auto_64754 ) ( not ( = ?auto_64749 ?auto_64747 ) ) ( not ( = ?auto_64749 ?auto_64751 ) ) ( not ( = ?auto_64749 ?auto_64754 ) ) ( not ( = ?auto_64747 ?auto_64754 ) ) ( not ( = ?auto_64751 ?auto_64754 ) ) ( not ( = ?auto_64753 ?auto_64757 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_64750 ?auto_64747 ?auto_64752 ?auto_64751 )
      ( GET-4IMAGE-VERIFY ?auto_64748 ?auto_64749 ?auto_64750 ?auto_64747 ?auto_64752 ?auto_64751 ?auto_64753 ?auto_64754 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_64976 - DIRECTION
      ?auto_64977 - MODE
      ?auto_64978 - DIRECTION
      ?auto_64975 - MODE
      ?auto_64980 - DIRECTION
      ?auto_64979 - MODE
      ?auto_64981 - DIRECTION
      ?auto_64982 - MODE
    )
    :vars
    (
      ?auto_64986 - INSTRUMENT
      ?auto_64983 - SATELLITE
      ?auto_64985 - DIRECTION
      ?auto_64984 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_64978 ?auto_64976 ) ) ( not ( = ?auto_64980 ?auto_64976 ) ) ( not ( = ?auto_64980 ?auto_64978 ) ) ( not ( = ?auto_64981 ?auto_64976 ) ) ( not ( = ?auto_64981 ?auto_64978 ) ) ( not ( = ?auto_64981 ?auto_64980 ) ) ( ON_BOARD ?auto_64986 ?auto_64983 ) ( SUPPORTS ?auto_64986 ?auto_64975 ) ( not ( = ?auto_64978 ?auto_64985 ) ) ( HAVE_IMAGE ?auto_64980 ?auto_64979 ) ( not ( = ?auto_64980 ?auto_64985 ) ) ( not ( = ?auto_64979 ?auto_64975 ) ) ( CALIBRATION_TARGET ?auto_64986 ?auto_64985 ) ( POINTING ?auto_64983 ?auto_64976 ) ( not ( = ?auto_64985 ?auto_64976 ) ) ( ON_BOARD ?auto_64984 ?auto_64983 ) ( POWER_ON ?auto_64984 ) ( not ( = ?auto_64986 ?auto_64984 ) ) ( HAVE_IMAGE ?auto_64976 ?auto_64977 ) ( HAVE_IMAGE ?auto_64981 ?auto_64982 ) ( not ( = ?auto_64977 ?auto_64975 ) ) ( not ( = ?auto_64977 ?auto_64979 ) ) ( not ( = ?auto_64977 ?auto_64982 ) ) ( not ( = ?auto_64975 ?auto_64982 ) ) ( not ( = ?auto_64979 ?auto_64982 ) ) ( not ( = ?auto_64981 ?auto_64985 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_64980 ?auto_64979 ?auto_64978 ?auto_64975 )
      ( GET-4IMAGE-VERIFY ?auto_64976 ?auto_64977 ?auto_64978 ?auto_64975 ?auto_64980 ?auto_64979 ?auto_64981 ?auto_64982 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_65247 - DIRECTION
      ?auto_65248 - MODE
      ?auto_65249 - DIRECTION
      ?auto_65246 - MODE
      ?auto_65251 - DIRECTION
      ?auto_65250 - MODE
      ?auto_65252 - DIRECTION
      ?auto_65253 - MODE
    )
    :vars
    (
      ?auto_65257 - INSTRUMENT
      ?auto_65254 - SATELLITE
      ?auto_65256 - DIRECTION
      ?auto_65255 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_65249 ?auto_65247 ) ) ( not ( = ?auto_65251 ?auto_65247 ) ) ( not ( = ?auto_65251 ?auto_65249 ) ) ( not ( = ?auto_65252 ?auto_65247 ) ) ( not ( = ?auto_65252 ?auto_65249 ) ) ( not ( = ?auto_65252 ?auto_65251 ) ) ( ON_BOARD ?auto_65257 ?auto_65254 ) ( SUPPORTS ?auto_65257 ?auto_65248 ) ( not ( = ?auto_65247 ?auto_65256 ) ) ( HAVE_IMAGE ?auto_65249 ?auto_65246 ) ( not ( = ?auto_65249 ?auto_65256 ) ) ( not ( = ?auto_65246 ?auto_65248 ) ) ( CALIBRATION_TARGET ?auto_65257 ?auto_65256 ) ( POINTING ?auto_65254 ?auto_65252 ) ( not ( = ?auto_65256 ?auto_65252 ) ) ( ON_BOARD ?auto_65255 ?auto_65254 ) ( POWER_ON ?auto_65255 ) ( not ( = ?auto_65257 ?auto_65255 ) ) ( HAVE_IMAGE ?auto_65251 ?auto_65250 ) ( HAVE_IMAGE ?auto_65252 ?auto_65253 ) ( not ( = ?auto_65248 ?auto_65250 ) ) ( not ( = ?auto_65248 ?auto_65253 ) ) ( not ( = ?auto_65246 ?auto_65250 ) ) ( not ( = ?auto_65246 ?auto_65253 ) ) ( not ( = ?auto_65251 ?auto_65256 ) ) ( not ( = ?auto_65250 ?auto_65253 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_65249 ?auto_65246 ?auto_65247 ?auto_65248 )
      ( GET-4IMAGE-VERIFY ?auto_65247 ?auto_65248 ?auto_65249 ?auto_65246 ?auto_65251 ?auto_65250 ?auto_65252 ?auto_65253 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_65284 - DIRECTION
      ?auto_65285 - MODE
      ?auto_65286 - DIRECTION
      ?auto_65283 - MODE
      ?auto_65288 - DIRECTION
      ?auto_65287 - MODE
      ?auto_65289 - DIRECTION
      ?auto_65290 - MODE
    )
    :vars
    (
      ?auto_65294 - INSTRUMENT
      ?auto_65291 - SATELLITE
      ?auto_65293 - DIRECTION
      ?auto_65292 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_65286 ?auto_65284 ) ) ( not ( = ?auto_65288 ?auto_65284 ) ) ( not ( = ?auto_65288 ?auto_65286 ) ) ( not ( = ?auto_65289 ?auto_65284 ) ) ( not ( = ?auto_65289 ?auto_65286 ) ) ( not ( = ?auto_65289 ?auto_65288 ) ) ( ON_BOARD ?auto_65294 ?auto_65291 ) ( SUPPORTS ?auto_65294 ?auto_65285 ) ( not ( = ?auto_65284 ?auto_65293 ) ) ( HAVE_IMAGE ?auto_65286 ?auto_65283 ) ( not ( = ?auto_65286 ?auto_65293 ) ) ( not ( = ?auto_65283 ?auto_65285 ) ) ( CALIBRATION_TARGET ?auto_65294 ?auto_65293 ) ( POINTING ?auto_65291 ?auto_65288 ) ( not ( = ?auto_65293 ?auto_65288 ) ) ( ON_BOARD ?auto_65292 ?auto_65291 ) ( POWER_ON ?auto_65292 ) ( not ( = ?auto_65294 ?auto_65292 ) ) ( HAVE_IMAGE ?auto_65288 ?auto_65287 ) ( HAVE_IMAGE ?auto_65289 ?auto_65290 ) ( not ( = ?auto_65285 ?auto_65287 ) ) ( not ( = ?auto_65285 ?auto_65290 ) ) ( not ( = ?auto_65283 ?auto_65287 ) ) ( not ( = ?auto_65283 ?auto_65290 ) ) ( not ( = ?auto_65287 ?auto_65290 ) ) ( not ( = ?auto_65289 ?auto_65293 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_65286 ?auto_65283 ?auto_65284 ?auto_65285 )
      ( GET-4IMAGE-VERIFY ?auto_65284 ?auto_65285 ?auto_65286 ?auto_65283 ?auto_65288 ?auto_65287 ?auto_65289 ?auto_65290 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_65594 - DIRECTION
      ?auto_65595 - MODE
      ?auto_65596 - DIRECTION
      ?auto_65593 - MODE
      ?auto_65598 - DIRECTION
      ?auto_65597 - MODE
      ?auto_65599 - DIRECTION
      ?auto_65600 - MODE
    )
    :vars
    (
      ?auto_65604 - INSTRUMENT
      ?auto_65601 - SATELLITE
      ?auto_65603 - DIRECTION
      ?auto_65602 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_65596 ?auto_65594 ) ) ( not ( = ?auto_65598 ?auto_65594 ) ) ( not ( = ?auto_65598 ?auto_65596 ) ) ( not ( = ?auto_65599 ?auto_65594 ) ) ( not ( = ?auto_65599 ?auto_65596 ) ) ( not ( = ?auto_65599 ?auto_65598 ) ) ( ON_BOARD ?auto_65604 ?auto_65601 ) ( SUPPORTS ?auto_65604 ?auto_65595 ) ( not ( = ?auto_65594 ?auto_65603 ) ) ( HAVE_IMAGE ?auto_65598 ?auto_65597 ) ( not ( = ?auto_65598 ?auto_65603 ) ) ( not ( = ?auto_65597 ?auto_65595 ) ) ( CALIBRATION_TARGET ?auto_65604 ?auto_65603 ) ( POINTING ?auto_65601 ?auto_65596 ) ( not ( = ?auto_65603 ?auto_65596 ) ) ( ON_BOARD ?auto_65602 ?auto_65601 ) ( POWER_ON ?auto_65602 ) ( not ( = ?auto_65604 ?auto_65602 ) ) ( HAVE_IMAGE ?auto_65596 ?auto_65593 ) ( HAVE_IMAGE ?auto_65599 ?auto_65600 ) ( not ( = ?auto_65595 ?auto_65593 ) ) ( not ( = ?auto_65595 ?auto_65600 ) ) ( not ( = ?auto_65593 ?auto_65597 ) ) ( not ( = ?auto_65593 ?auto_65600 ) ) ( not ( = ?auto_65597 ?auto_65600 ) ) ( not ( = ?auto_65599 ?auto_65603 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_65598 ?auto_65597 ?auto_65594 ?auto_65595 )
      ( GET-4IMAGE-VERIFY ?auto_65594 ?auto_65595 ?auto_65596 ?auto_65593 ?auto_65598 ?auto_65597 ?auto_65599 ?auto_65600 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_71598 - DIRECTION
      ?auto_71599 - MODE
      ?auto_71600 - DIRECTION
      ?auto_71597 - MODE
      ?auto_71602 - DIRECTION
      ?auto_71601 - MODE
    )
    :vars
    (
      ?auto_71605 - INSTRUMENT
      ?auto_71604 - SATELLITE
      ?auto_71603 - DIRECTION
      ?auto_71606 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_71600 ?auto_71598 ) ) ( not ( = ?auto_71602 ?auto_71598 ) ) ( not ( = ?auto_71602 ?auto_71600 ) ) ( ON_BOARD ?auto_71605 ?auto_71604 ) ( SUPPORTS ?auto_71605 ?auto_71601 ) ( not ( = ?auto_71602 ?auto_71603 ) ) ( HAVE_IMAGE ?auto_71598 ?auto_71599 ) ( not ( = ?auto_71598 ?auto_71603 ) ) ( not ( = ?auto_71599 ?auto_71601 ) ) ( CALIBRATION_TARGET ?auto_71605 ?auto_71603 ) ( not ( = ?auto_71603 ?auto_71600 ) ) ( ON_BOARD ?auto_71606 ?auto_71604 ) ( POWER_ON ?auto_71606 ) ( not ( = ?auto_71605 ?auto_71606 ) ) ( POINTING ?auto_71604 ?auto_71603 ) ( HAVE_IMAGE ?auto_71600 ?auto_71597 ) ( not ( = ?auto_71599 ?auto_71597 ) ) ( not ( = ?auto_71597 ?auto_71601 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_71598 ?auto_71599 ?auto_71602 ?auto_71601 )
      ( GET-3IMAGE-VERIFY ?auto_71598 ?auto_71599 ?auto_71600 ?auto_71597 ?auto_71602 ?auto_71601 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_71630 - DIRECTION
      ?auto_71631 - MODE
      ?auto_71632 - DIRECTION
      ?auto_71629 - MODE
      ?auto_71634 - DIRECTION
      ?auto_71633 - MODE
    )
    :vars
    (
      ?auto_71637 - INSTRUMENT
      ?auto_71636 - SATELLITE
      ?auto_71635 - DIRECTION
      ?auto_71638 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_71632 ?auto_71630 ) ) ( not ( = ?auto_71634 ?auto_71630 ) ) ( not ( = ?auto_71634 ?auto_71632 ) ) ( ON_BOARD ?auto_71637 ?auto_71636 ) ( SUPPORTS ?auto_71637 ?auto_71629 ) ( not ( = ?auto_71632 ?auto_71635 ) ) ( HAVE_IMAGE ?auto_71630 ?auto_71631 ) ( not ( = ?auto_71630 ?auto_71635 ) ) ( not ( = ?auto_71631 ?auto_71629 ) ) ( CALIBRATION_TARGET ?auto_71637 ?auto_71635 ) ( not ( = ?auto_71635 ?auto_71634 ) ) ( ON_BOARD ?auto_71638 ?auto_71636 ) ( POWER_ON ?auto_71638 ) ( not ( = ?auto_71637 ?auto_71638 ) ) ( POINTING ?auto_71636 ?auto_71635 ) ( HAVE_IMAGE ?auto_71634 ?auto_71633 ) ( not ( = ?auto_71631 ?auto_71633 ) ) ( not ( = ?auto_71629 ?auto_71633 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_71630 ?auto_71631 ?auto_71632 ?auto_71629 )
      ( GET-3IMAGE-VERIFY ?auto_71630 ?auto_71631 ?auto_71632 ?auto_71629 ?auto_71634 ?auto_71633 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_68889 - DIRECTION
      ?auto_68890 - MODE
      ?auto_68891 - DIRECTION
      ?auto_68888 - MODE
      ?auto_68893 - DIRECTION
      ?auto_68892 - MODE
    )
    :vars
    (
      ?auto_68894 - INSTRUMENT
      ?auto_68898 - SATELLITE
      ?auto_68895 - DIRECTION
      ?auto_68896 - DIRECTION
      ?auto_68897 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_68891 ?auto_68889 ) ) ( not ( = ?auto_68893 ?auto_68889 ) ) ( not ( = ?auto_68893 ?auto_68891 ) ) ( ON_BOARD ?auto_68894 ?auto_68898 ) ( SUPPORTS ?auto_68894 ?auto_68892 ) ( not ( = ?auto_68893 ?auto_68895 ) ) ( HAVE_IMAGE ?auto_68891 ?auto_68888 ) ( not ( = ?auto_68891 ?auto_68895 ) ) ( not ( = ?auto_68888 ?auto_68892 ) ) ( CALIBRATION_TARGET ?auto_68894 ?auto_68895 ) ( not ( = ?auto_68895 ?auto_68896 ) ) ( not ( = ?auto_68893 ?auto_68896 ) ) ( not ( = ?auto_68891 ?auto_68896 ) ) ( ON_BOARD ?auto_68897 ?auto_68898 ) ( POWER_ON ?auto_68897 ) ( not ( = ?auto_68894 ?auto_68897 ) ) ( POINTING ?auto_68898 ?auto_68895 ) ( HAVE_IMAGE ?auto_68889 ?auto_68890 ) ( not ( = ?auto_68889 ?auto_68895 ) ) ( not ( = ?auto_68889 ?auto_68896 ) ) ( not ( = ?auto_68890 ?auto_68888 ) ) ( not ( = ?auto_68890 ?auto_68892 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_68891 ?auto_68888 ?auto_68893 ?auto_68892 )
      ( GET-3IMAGE-VERIFY ?auto_68889 ?auto_68890 ?auto_68891 ?auto_68888 ?auto_68893 ?auto_68892 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_68925 - DIRECTION
      ?auto_68926 - MODE
      ?auto_68927 - DIRECTION
      ?auto_68924 - MODE
      ?auto_68929 - DIRECTION
      ?auto_68928 - MODE
    )
    :vars
    (
      ?auto_68930 - INSTRUMENT
      ?auto_68934 - SATELLITE
      ?auto_68931 - DIRECTION
      ?auto_68932 - DIRECTION
      ?auto_68933 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_68927 ?auto_68925 ) ) ( not ( = ?auto_68929 ?auto_68925 ) ) ( not ( = ?auto_68929 ?auto_68927 ) ) ( ON_BOARD ?auto_68930 ?auto_68934 ) ( SUPPORTS ?auto_68930 ?auto_68924 ) ( not ( = ?auto_68927 ?auto_68931 ) ) ( HAVE_IMAGE ?auto_68929 ?auto_68928 ) ( not ( = ?auto_68929 ?auto_68931 ) ) ( not ( = ?auto_68928 ?auto_68924 ) ) ( CALIBRATION_TARGET ?auto_68930 ?auto_68931 ) ( not ( = ?auto_68931 ?auto_68932 ) ) ( not ( = ?auto_68927 ?auto_68932 ) ) ( not ( = ?auto_68929 ?auto_68932 ) ) ( ON_BOARD ?auto_68933 ?auto_68934 ) ( POWER_ON ?auto_68933 ) ( not ( = ?auto_68930 ?auto_68933 ) ) ( POINTING ?auto_68934 ?auto_68931 ) ( HAVE_IMAGE ?auto_68925 ?auto_68926 ) ( not ( = ?auto_68925 ?auto_68931 ) ) ( not ( = ?auto_68925 ?auto_68932 ) ) ( not ( = ?auto_68926 ?auto_68924 ) ) ( not ( = ?auto_68926 ?auto_68928 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_68929 ?auto_68928 ?auto_68927 ?auto_68924 )
      ( GET-3IMAGE-VERIFY ?auto_68925 ?auto_68926 ?auto_68927 ?auto_68924 ?auto_68929 ?auto_68928 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_71830 - DIRECTION
      ?auto_71831 - MODE
      ?auto_71832 - DIRECTION
      ?auto_71829 - MODE
      ?auto_71834 - DIRECTION
      ?auto_71833 - MODE
    )
    :vars
    (
      ?auto_71837 - INSTRUMENT
      ?auto_71836 - SATELLITE
      ?auto_71835 - DIRECTION
      ?auto_71838 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_71832 ?auto_71830 ) ) ( not ( = ?auto_71834 ?auto_71830 ) ) ( not ( = ?auto_71834 ?auto_71832 ) ) ( ON_BOARD ?auto_71837 ?auto_71836 ) ( SUPPORTS ?auto_71837 ?auto_71831 ) ( not ( = ?auto_71830 ?auto_71835 ) ) ( HAVE_IMAGE ?auto_71832 ?auto_71829 ) ( not ( = ?auto_71832 ?auto_71835 ) ) ( not ( = ?auto_71829 ?auto_71831 ) ) ( CALIBRATION_TARGET ?auto_71837 ?auto_71835 ) ( not ( = ?auto_71835 ?auto_71834 ) ) ( ON_BOARD ?auto_71838 ?auto_71836 ) ( POWER_ON ?auto_71838 ) ( not ( = ?auto_71837 ?auto_71838 ) ) ( POINTING ?auto_71836 ?auto_71835 ) ( HAVE_IMAGE ?auto_71834 ?auto_71833 ) ( not ( = ?auto_71831 ?auto_71833 ) ) ( not ( = ?auto_71829 ?auto_71833 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_71832 ?auto_71829 ?auto_71830 ?auto_71831 )
      ( GET-3IMAGE-VERIFY ?auto_71830 ?auto_71831 ?auto_71832 ?auto_71829 ?auto_71834 ?auto_71833 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_69097 - DIRECTION
      ?auto_69098 - MODE
      ?auto_69099 - DIRECTION
      ?auto_69096 - MODE
      ?auto_69101 - DIRECTION
      ?auto_69100 - MODE
    )
    :vars
    (
      ?auto_69102 - INSTRUMENT
      ?auto_69106 - SATELLITE
      ?auto_69103 - DIRECTION
      ?auto_69104 - DIRECTION
      ?auto_69105 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_69099 ?auto_69097 ) ) ( not ( = ?auto_69101 ?auto_69097 ) ) ( not ( = ?auto_69101 ?auto_69099 ) ) ( ON_BOARD ?auto_69102 ?auto_69106 ) ( SUPPORTS ?auto_69102 ?auto_69098 ) ( not ( = ?auto_69097 ?auto_69103 ) ) ( HAVE_IMAGE ?auto_69101 ?auto_69100 ) ( not ( = ?auto_69101 ?auto_69103 ) ) ( not ( = ?auto_69100 ?auto_69098 ) ) ( CALIBRATION_TARGET ?auto_69102 ?auto_69103 ) ( not ( = ?auto_69103 ?auto_69104 ) ) ( not ( = ?auto_69097 ?auto_69104 ) ) ( not ( = ?auto_69101 ?auto_69104 ) ) ( ON_BOARD ?auto_69105 ?auto_69106 ) ( POWER_ON ?auto_69105 ) ( not ( = ?auto_69102 ?auto_69105 ) ) ( POINTING ?auto_69106 ?auto_69103 ) ( HAVE_IMAGE ?auto_69099 ?auto_69096 ) ( not ( = ?auto_69098 ?auto_69096 ) ) ( not ( = ?auto_69099 ?auto_69103 ) ) ( not ( = ?auto_69099 ?auto_69104 ) ) ( not ( = ?auto_69096 ?auto_69100 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_69101 ?auto_69100 ?auto_69097 ?auto_69098 )
      ( GET-3IMAGE-VERIFY ?auto_69097 ?auto_69098 ?auto_69099 ?auto_69096 ?auto_69101 ?auto_69100 ) )
  )

)

