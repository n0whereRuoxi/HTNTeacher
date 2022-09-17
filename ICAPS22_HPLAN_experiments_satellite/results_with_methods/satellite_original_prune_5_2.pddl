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

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3345708 - DIRECTION
      ?auto_3345709 - MODE
    )
    :vars
    (
      ?auto_3345710 - INSTRUMENT
      ?auto_3345711 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_3345710 ) ( ON_BOARD ?auto_3345710 ?auto_3345711 ) ( SUPPORTS ?auto_3345710 ?auto_3345709 ) ( POWER_ON ?auto_3345710 ) ( POINTING ?auto_3345711 ?auto_3345708 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_3345711 ?auto_3345708 ?auto_3345710 ?auto_3345709 )
      ( GET-1IMAGE-VERIFY ?auto_3345708 ?auto_3345709 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3345748 - DIRECTION
      ?auto_3345749 - MODE
    )
    :vars
    (
      ?auto_3345750 - INSTRUMENT
      ?auto_3345751 - SATELLITE
      ?auto_3345752 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_3345750 ) ( ON_BOARD ?auto_3345750 ?auto_3345751 ) ( SUPPORTS ?auto_3345750 ?auto_3345749 ) ( POWER_ON ?auto_3345750 ) ( POINTING ?auto_3345751 ?auto_3345752 ) ( not ( = ?auto_3345748 ?auto_3345752 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_3345751 ?auto_3345748 ?auto_3345752 )
      ( GET-1IMAGE ?auto_3345748 ?auto_3345749 )
      ( GET-1IMAGE-VERIFY ?auto_3345748 ?auto_3345749 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3345793 - DIRECTION
      ?auto_3345794 - MODE
    )
    :vars
    (
      ?auto_3345795 - INSTRUMENT
      ?auto_3345796 - SATELLITE
      ?auto_3345797 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_3345795 ?auto_3345796 ) ( SUPPORTS ?auto_3345795 ?auto_3345794 ) ( POWER_ON ?auto_3345795 ) ( POINTING ?auto_3345796 ?auto_3345797 ) ( not ( = ?auto_3345793 ?auto_3345797 ) ) ( CALIBRATION_TARGET ?auto_3345795 ?auto_3345797 ) ( NOT_CALIBRATED ?auto_3345795 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_3345796 ?auto_3345795 ?auto_3345797 )
      ( GET-1IMAGE ?auto_3345793 ?auto_3345794 )
      ( GET-1IMAGE-VERIFY ?auto_3345793 ?auto_3345794 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3345838 - DIRECTION
      ?auto_3345839 - MODE
    )
    :vars
    (
      ?auto_3345840 - INSTRUMENT
      ?auto_3345842 - SATELLITE
      ?auto_3345841 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_3345840 ?auto_3345842 ) ( SUPPORTS ?auto_3345840 ?auto_3345839 ) ( POINTING ?auto_3345842 ?auto_3345841 ) ( not ( = ?auto_3345838 ?auto_3345841 ) ) ( CALIBRATION_TARGET ?auto_3345840 ?auto_3345841 ) ( POWER_AVAIL ?auto_3345842 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_3345840 ?auto_3345842 )
      ( GET-1IMAGE ?auto_3345838 ?auto_3345839 )
      ( GET-1IMAGE-VERIFY ?auto_3345838 ?auto_3345839 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3345883 - DIRECTION
      ?auto_3345884 - MODE
    )
    :vars
    (
      ?auto_3345887 - INSTRUMENT
      ?auto_3345885 - SATELLITE
      ?auto_3345886 - DIRECTION
      ?auto_3345888 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_3345887 ?auto_3345885 ) ( SUPPORTS ?auto_3345887 ?auto_3345884 ) ( not ( = ?auto_3345883 ?auto_3345886 ) ) ( CALIBRATION_TARGET ?auto_3345887 ?auto_3345886 ) ( POWER_AVAIL ?auto_3345885 ) ( POINTING ?auto_3345885 ?auto_3345888 ) ( not ( = ?auto_3345886 ?auto_3345888 ) ) ( not ( = ?auto_3345883 ?auto_3345888 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_3345885 ?auto_3345886 ?auto_3345888 )
      ( GET-1IMAGE ?auto_3345883 ?auto_3345884 )
      ( GET-1IMAGE-VERIFY ?auto_3345883 ?auto_3345884 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3346424 - DIRECTION
      ?auto_3346425 - MODE
      ?auto_3346426 - DIRECTION
      ?auto_3346423 - MODE
    )
    :vars
    (
      ?auto_3346427 - INSTRUMENT
      ?auto_3346428 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_3346426 ?auto_3346424 ) ) ( CALIBRATED ?auto_3346427 ) ( ON_BOARD ?auto_3346427 ?auto_3346428 ) ( SUPPORTS ?auto_3346427 ?auto_3346423 ) ( POWER_ON ?auto_3346427 ) ( POINTING ?auto_3346428 ?auto_3346426 ) ( HAVE_IMAGE ?auto_3346424 ?auto_3346425 ) ( not ( = ?auto_3346425 ?auto_3346423 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3346426 ?auto_3346423 )
      ( GET-2IMAGE-VERIFY ?auto_3346424 ?auto_3346425 ?auto_3346426 ?auto_3346423 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3346430 - DIRECTION
      ?auto_3346431 - MODE
      ?auto_3346432 - DIRECTION
      ?auto_3346429 - MODE
    )
    :vars
    (
      ?auto_3346433 - INSTRUMENT
      ?auto_3346434 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_3346432 ?auto_3346430 ) ) ( CALIBRATED ?auto_3346433 ) ( ON_BOARD ?auto_3346433 ?auto_3346434 ) ( SUPPORTS ?auto_3346433 ?auto_3346431 ) ( POWER_ON ?auto_3346433 ) ( POINTING ?auto_3346434 ?auto_3346430 ) ( HAVE_IMAGE ?auto_3346432 ?auto_3346429 ) ( not ( = ?auto_3346431 ?auto_3346429 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3346430 ?auto_3346431 )
      ( GET-2IMAGE-VERIFY ?auto_3346430 ?auto_3346431 ?auto_3346432 ?auto_3346429 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3347025 - DIRECTION
      ?auto_3347026 - MODE
      ?auto_3347027 - DIRECTION
      ?auto_3347024 - MODE
    )
    :vars
    (
      ?auto_3347030 - INSTRUMENT
      ?auto_3347028 - SATELLITE
      ?auto_3347029 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3347027 ?auto_3347025 ) ) ( CALIBRATED ?auto_3347030 ) ( ON_BOARD ?auto_3347030 ?auto_3347028 ) ( SUPPORTS ?auto_3347030 ?auto_3347024 ) ( POWER_ON ?auto_3347030 ) ( POINTING ?auto_3347028 ?auto_3347029 ) ( not ( = ?auto_3347027 ?auto_3347029 ) ) ( HAVE_IMAGE ?auto_3347025 ?auto_3347026 ) ( not ( = ?auto_3347025 ?auto_3347029 ) ) ( not ( = ?auto_3347026 ?auto_3347024 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3347027 ?auto_3347024 )
      ( GET-2IMAGE-VERIFY ?auto_3347025 ?auto_3347026 ?auto_3347027 ?auto_3347024 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3347032 - DIRECTION
      ?auto_3347033 - MODE
      ?auto_3347034 - DIRECTION
      ?auto_3347031 - MODE
    )
    :vars
    (
      ?auto_3347037 - INSTRUMENT
      ?auto_3347036 - SATELLITE
      ?auto_3347035 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3347034 ?auto_3347032 ) ) ( CALIBRATED ?auto_3347037 ) ( ON_BOARD ?auto_3347037 ?auto_3347036 ) ( SUPPORTS ?auto_3347037 ?auto_3347033 ) ( POWER_ON ?auto_3347037 ) ( POINTING ?auto_3347036 ?auto_3347035 ) ( not ( = ?auto_3347032 ?auto_3347035 ) ) ( HAVE_IMAGE ?auto_3347034 ?auto_3347031 ) ( not ( = ?auto_3347034 ?auto_3347035 ) ) ( not ( = ?auto_3347031 ?auto_3347033 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3347034 ?auto_3347031 ?auto_3347032 ?auto_3347033 )
      ( GET-2IMAGE-VERIFY ?auto_3347032 ?auto_3347033 ?auto_3347034 ?auto_3347031 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3347684 - DIRECTION
      ?auto_3347685 - MODE
    )
    :vars
    (
      ?auto_3347690 - DIRECTION
      ?auto_3347689 - INSTRUMENT
      ?auto_3347688 - SATELLITE
      ?auto_3347687 - DIRECTION
      ?auto_3347686 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_3347684 ?auto_3347690 ) ) ( ON_BOARD ?auto_3347689 ?auto_3347688 ) ( SUPPORTS ?auto_3347689 ?auto_3347685 ) ( POWER_ON ?auto_3347689 ) ( POINTING ?auto_3347688 ?auto_3347687 ) ( not ( = ?auto_3347684 ?auto_3347687 ) ) ( HAVE_IMAGE ?auto_3347690 ?auto_3347686 ) ( not ( = ?auto_3347690 ?auto_3347687 ) ) ( not ( = ?auto_3347686 ?auto_3347685 ) ) ( CALIBRATION_TARGET ?auto_3347689 ?auto_3347687 ) ( NOT_CALIBRATED ?auto_3347689 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_3347688 ?auto_3347689 ?auto_3347687 )
      ( GET-2IMAGE ?auto_3347690 ?auto_3347686 ?auto_3347684 ?auto_3347685 )
      ( GET-1IMAGE-VERIFY ?auto_3347684 ?auto_3347685 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3347692 - DIRECTION
      ?auto_3347693 - MODE
      ?auto_3347694 - DIRECTION
      ?auto_3347691 - MODE
    )
    :vars
    (
      ?auto_3347695 - INSTRUMENT
      ?auto_3347697 - SATELLITE
      ?auto_3347696 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3347694 ?auto_3347692 ) ) ( ON_BOARD ?auto_3347695 ?auto_3347697 ) ( SUPPORTS ?auto_3347695 ?auto_3347691 ) ( POWER_ON ?auto_3347695 ) ( POINTING ?auto_3347697 ?auto_3347696 ) ( not ( = ?auto_3347694 ?auto_3347696 ) ) ( HAVE_IMAGE ?auto_3347692 ?auto_3347693 ) ( not ( = ?auto_3347692 ?auto_3347696 ) ) ( not ( = ?auto_3347693 ?auto_3347691 ) ) ( CALIBRATION_TARGET ?auto_3347695 ?auto_3347696 ) ( NOT_CALIBRATED ?auto_3347695 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3347694 ?auto_3347691 )
      ( GET-2IMAGE-VERIFY ?auto_3347692 ?auto_3347693 ?auto_3347694 ?auto_3347691 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3347699 - DIRECTION
      ?auto_3347700 - MODE
      ?auto_3347701 - DIRECTION
      ?auto_3347698 - MODE
    )
    :vars
    (
      ?auto_3347702 - INSTRUMENT
      ?auto_3347703 - SATELLITE
      ?auto_3347704 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3347701 ?auto_3347699 ) ) ( ON_BOARD ?auto_3347702 ?auto_3347703 ) ( SUPPORTS ?auto_3347702 ?auto_3347700 ) ( POWER_ON ?auto_3347702 ) ( POINTING ?auto_3347703 ?auto_3347704 ) ( not ( = ?auto_3347699 ?auto_3347704 ) ) ( HAVE_IMAGE ?auto_3347701 ?auto_3347698 ) ( not ( = ?auto_3347701 ?auto_3347704 ) ) ( not ( = ?auto_3347698 ?auto_3347700 ) ) ( CALIBRATION_TARGET ?auto_3347702 ?auto_3347704 ) ( NOT_CALIBRATED ?auto_3347702 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3347701 ?auto_3347698 ?auto_3347699 ?auto_3347700 )
      ( GET-2IMAGE-VERIFY ?auto_3347699 ?auto_3347700 ?auto_3347701 ?auto_3347698 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3348351 - DIRECTION
      ?auto_3348352 - MODE
    )
    :vars
    (
      ?auto_3348355 - DIRECTION
      ?auto_3348354 - INSTRUMENT
      ?auto_3348356 - SATELLITE
      ?auto_3348357 - DIRECTION
      ?auto_3348353 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_3348351 ?auto_3348355 ) ) ( ON_BOARD ?auto_3348354 ?auto_3348356 ) ( SUPPORTS ?auto_3348354 ?auto_3348352 ) ( POINTING ?auto_3348356 ?auto_3348357 ) ( not ( = ?auto_3348351 ?auto_3348357 ) ) ( HAVE_IMAGE ?auto_3348355 ?auto_3348353 ) ( not ( = ?auto_3348355 ?auto_3348357 ) ) ( not ( = ?auto_3348353 ?auto_3348352 ) ) ( CALIBRATION_TARGET ?auto_3348354 ?auto_3348357 ) ( POWER_AVAIL ?auto_3348356 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_3348354 ?auto_3348356 )
      ( GET-2IMAGE ?auto_3348355 ?auto_3348353 ?auto_3348351 ?auto_3348352 )
      ( GET-1IMAGE-VERIFY ?auto_3348351 ?auto_3348352 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3348359 - DIRECTION
      ?auto_3348360 - MODE
      ?auto_3348361 - DIRECTION
      ?auto_3348358 - MODE
    )
    :vars
    (
      ?auto_3348362 - INSTRUMENT
      ?auto_3348364 - SATELLITE
      ?auto_3348363 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3348361 ?auto_3348359 ) ) ( ON_BOARD ?auto_3348362 ?auto_3348364 ) ( SUPPORTS ?auto_3348362 ?auto_3348358 ) ( POINTING ?auto_3348364 ?auto_3348363 ) ( not ( = ?auto_3348361 ?auto_3348363 ) ) ( HAVE_IMAGE ?auto_3348359 ?auto_3348360 ) ( not ( = ?auto_3348359 ?auto_3348363 ) ) ( not ( = ?auto_3348360 ?auto_3348358 ) ) ( CALIBRATION_TARGET ?auto_3348362 ?auto_3348363 ) ( POWER_AVAIL ?auto_3348364 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3348361 ?auto_3348358 )
      ( GET-2IMAGE-VERIFY ?auto_3348359 ?auto_3348360 ?auto_3348361 ?auto_3348358 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3348366 - DIRECTION
      ?auto_3348367 - MODE
      ?auto_3348368 - DIRECTION
      ?auto_3348365 - MODE
    )
    :vars
    (
      ?auto_3348369 - INSTRUMENT
      ?auto_3348370 - SATELLITE
      ?auto_3348371 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3348368 ?auto_3348366 ) ) ( ON_BOARD ?auto_3348369 ?auto_3348370 ) ( SUPPORTS ?auto_3348369 ?auto_3348367 ) ( POINTING ?auto_3348370 ?auto_3348371 ) ( not ( = ?auto_3348366 ?auto_3348371 ) ) ( HAVE_IMAGE ?auto_3348368 ?auto_3348365 ) ( not ( = ?auto_3348368 ?auto_3348371 ) ) ( not ( = ?auto_3348365 ?auto_3348367 ) ) ( CALIBRATION_TARGET ?auto_3348369 ?auto_3348371 ) ( POWER_AVAIL ?auto_3348370 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3348368 ?auto_3348365 ?auto_3348366 ?auto_3348367 )
      ( GET-2IMAGE-VERIFY ?auto_3348366 ?auto_3348367 ?auto_3348368 ?auto_3348365 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3349018 - DIRECTION
      ?auto_3349019 - MODE
    )
    :vars
    (
      ?auto_3349023 - DIRECTION
      ?auto_3349020 - INSTRUMENT
      ?auto_3349022 - SATELLITE
      ?auto_3349024 - DIRECTION
      ?auto_3349021 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_3349018 ?auto_3349023 ) ) ( ON_BOARD ?auto_3349020 ?auto_3349022 ) ( SUPPORTS ?auto_3349020 ?auto_3349019 ) ( not ( = ?auto_3349018 ?auto_3349024 ) ) ( HAVE_IMAGE ?auto_3349023 ?auto_3349021 ) ( not ( = ?auto_3349023 ?auto_3349024 ) ) ( not ( = ?auto_3349021 ?auto_3349019 ) ) ( CALIBRATION_TARGET ?auto_3349020 ?auto_3349024 ) ( POWER_AVAIL ?auto_3349022 ) ( POINTING ?auto_3349022 ?auto_3349023 ) )
    :subtasks
    ( ( !TURN_TO ?auto_3349022 ?auto_3349024 ?auto_3349023 )
      ( GET-2IMAGE ?auto_3349023 ?auto_3349021 ?auto_3349018 ?auto_3349019 )
      ( GET-1IMAGE-VERIFY ?auto_3349018 ?auto_3349019 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3349026 - DIRECTION
      ?auto_3349027 - MODE
      ?auto_3349028 - DIRECTION
      ?auto_3349025 - MODE
    )
    :vars
    (
      ?auto_3349029 - INSTRUMENT
      ?auto_3349031 - SATELLITE
      ?auto_3349030 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3349028 ?auto_3349026 ) ) ( ON_BOARD ?auto_3349029 ?auto_3349031 ) ( SUPPORTS ?auto_3349029 ?auto_3349025 ) ( not ( = ?auto_3349028 ?auto_3349030 ) ) ( HAVE_IMAGE ?auto_3349026 ?auto_3349027 ) ( not ( = ?auto_3349026 ?auto_3349030 ) ) ( not ( = ?auto_3349027 ?auto_3349025 ) ) ( CALIBRATION_TARGET ?auto_3349029 ?auto_3349030 ) ( POWER_AVAIL ?auto_3349031 ) ( POINTING ?auto_3349031 ?auto_3349026 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3349028 ?auto_3349025 )
      ( GET-2IMAGE-VERIFY ?auto_3349026 ?auto_3349027 ?auto_3349028 ?auto_3349025 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3349033 - DIRECTION
      ?auto_3349034 - MODE
      ?auto_3349035 - DIRECTION
      ?auto_3349032 - MODE
    )
    :vars
    (
      ?auto_3349036 - INSTRUMENT
      ?auto_3349037 - SATELLITE
      ?auto_3349038 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3349035 ?auto_3349033 ) ) ( ON_BOARD ?auto_3349036 ?auto_3349037 ) ( SUPPORTS ?auto_3349036 ?auto_3349034 ) ( not ( = ?auto_3349033 ?auto_3349038 ) ) ( HAVE_IMAGE ?auto_3349035 ?auto_3349032 ) ( not ( = ?auto_3349035 ?auto_3349038 ) ) ( not ( = ?auto_3349032 ?auto_3349034 ) ) ( CALIBRATION_TARGET ?auto_3349036 ?auto_3349038 ) ( POWER_AVAIL ?auto_3349037 ) ( POINTING ?auto_3349037 ?auto_3349035 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3349035 ?auto_3349032 ?auto_3349033 ?auto_3349034 )
      ( GET-2IMAGE-VERIFY ?auto_3349033 ?auto_3349034 ?auto_3349035 ?auto_3349032 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3349685 - DIRECTION
      ?auto_3349686 - MODE
    )
    :vars
    (
      ?auto_3349690 - DIRECTION
      ?auto_3349687 - INSTRUMENT
      ?auto_3349688 - SATELLITE
      ?auto_3349691 - DIRECTION
      ?auto_3349689 - MODE
      ?auto_3349692 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3349685 ?auto_3349690 ) ) ( ON_BOARD ?auto_3349687 ?auto_3349688 ) ( SUPPORTS ?auto_3349687 ?auto_3349686 ) ( not ( = ?auto_3349685 ?auto_3349691 ) ) ( HAVE_IMAGE ?auto_3349690 ?auto_3349689 ) ( not ( = ?auto_3349690 ?auto_3349691 ) ) ( not ( = ?auto_3349689 ?auto_3349686 ) ) ( CALIBRATION_TARGET ?auto_3349687 ?auto_3349691 ) ( POINTING ?auto_3349688 ?auto_3349690 ) ( ON_BOARD ?auto_3349692 ?auto_3349688 ) ( POWER_ON ?auto_3349692 ) ( not ( = ?auto_3349687 ?auto_3349692 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_3349692 ?auto_3349688 )
      ( GET-2IMAGE ?auto_3349690 ?auto_3349689 ?auto_3349685 ?auto_3349686 )
      ( GET-1IMAGE-VERIFY ?auto_3349685 ?auto_3349686 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3349694 - DIRECTION
      ?auto_3349695 - MODE
      ?auto_3349696 - DIRECTION
      ?auto_3349693 - MODE
    )
    :vars
    (
      ?auto_3349697 - INSTRUMENT
      ?auto_3349699 - SATELLITE
      ?auto_3349700 - DIRECTION
      ?auto_3349698 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3349696 ?auto_3349694 ) ) ( ON_BOARD ?auto_3349697 ?auto_3349699 ) ( SUPPORTS ?auto_3349697 ?auto_3349693 ) ( not ( = ?auto_3349696 ?auto_3349700 ) ) ( HAVE_IMAGE ?auto_3349694 ?auto_3349695 ) ( not ( = ?auto_3349694 ?auto_3349700 ) ) ( not ( = ?auto_3349695 ?auto_3349693 ) ) ( CALIBRATION_TARGET ?auto_3349697 ?auto_3349700 ) ( POINTING ?auto_3349699 ?auto_3349694 ) ( ON_BOARD ?auto_3349698 ?auto_3349699 ) ( POWER_ON ?auto_3349698 ) ( not ( = ?auto_3349697 ?auto_3349698 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3349696 ?auto_3349693 )
      ( GET-2IMAGE-VERIFY ?auto_3349694 ?auto_3349695 ?auto_3349696 ?auto_3349693 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3349702 - DIRECTION
      ?auto_3349703 - MODE
      ?auto_3349704 - DIRECTION
      ?auto_3349701 - MODE
    )
    :vars
    (
      ?auto_3349707 - INSTRUMENT
      ?auto_3349706 - SATELLITE
      ?auto_3349705 - DIRECTION
      ?auto_3349708 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3349704 ?auto_3349702 ) ) ( ON_BOARD ?auto_3349707 ?auto_3349706 ) ( SUPPORTS ?auto_3349707 ?auto_3349703 ) ( not ( = ?auto_3349702 ?auto_3349705 ) ) ( HAVE_IMAGE ?auto_3349704 ?auto_3349701 ) ( not ( = ?auto_3349704 ?auto_3349705 ) ) ( not ( = ?auto_3349701 ?auto_3349703 ) ) ( CALIBRATION_TARGET ?auto_3349707 ?auto_3349705 ) ( POINTING ?auto_3349706 ?auto_3349704 ) ( ON_BOARD ?auto_3349708 ?auto_3349706 ) ( POWER_ON ?auto_3349708 ) ( not ( = ?auto_3349707 ?auto_3349708 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3349704 ?auto_3349701 ?auto_3349702 ?auto_3349703 )
      ( GET-2IMAGE-VERIFY ?auto_3349702 ?auto_3349703 ?auto_3349704 ?auto_3349701 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3350409 - DIRECTION
      ?auto_3350410 - MODE
    )
    :vars
    (
      ?auto_3350414 - DIRECTION
      ?auto_3350415 - INSTRUMENT
      ?auto_3350412 - SATELLITE
      ?auto_3350411 - DIRECTION
      ?auto_3350413 - MODE
      ?auto_3350416 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3350409 ?auto_3350414 ) ) ( ON_BOARD ?auto_3350415 ?auto_3350412 ) ( SUPPORTS ?auto_3350415 ?auto_3350410 ) ( not ( = ?auto_3350409 ?auto_3350411 ) ) ( not ( = ?auto_3350414 ?auto_3350411 ) ) ( not ( = ?auto_3350413 ?auto_3350410 ) ) ( CALIBRATION_TARGET ?auto_3350415 ?auto_3350411 ) ( POINTING ?auto_3350412 ?auto_3350414 ) ( ON_BOARD ?auto_3350416 ?auto_3350412 ) ( POWER_ON ?auto_3350416 ) ( not ( = ?auto_3350415 ?auto_3350416 ) ) ( CALIBRATED ?auto_3350416 ) ( SUPPORTS ?auto_3350416 ?auto_3350413 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3350414 ?auto_3350413 )
      ( GET-2IMAGE ?auto_3350414 ?auto_3350413 ?auto_3350409 ?auto_3350410 )
      ( GET-1IMAGE-VERIFY ?auto_3350409 ?auto_3350410 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3350418 - DIRECTION
      ?auto_3350419 - MODE
      ?auto_3350420 - DIRECTION
      ?auto_3350417 - MODE
    )
    :vars
    (
      ?auto_3350421 - INSTRUMENT
      ?auto_3350424 - SATELLITE
      ?auto_3350423 - DIRECTION
      ?auto_3350422 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3350420 ?auto_3350418 ) ) ( ON_BOARD ?auto_3350421 ?auto_3350424 ) ( SUPPORTS ?auto_3350421 ?auto_3350417 ) ( not ( = ?auto_3350420 ?auto_3350423 ) ) ( not ( = ?auto_3350418 ?auto_3350423 ) ) ( not ( = ?auto_3350419 ?auto_3350417 ) ) ( CALIBRATION_TARGET ?auto_3350421 ?auto_3350423 ) ( POINTING ?auto_3350424 ?auto_3350418 ) ( ON_BOARD ?auto_3350422 ?auto_3350424 ) ( POWER_ON ?auto_3350422 ) ( not ( = ?auto_3350421 ?auto_3350422 ) ) ( CALIBRATED ?auto_3350422 ) ( SUPPORTS ?auto_3350422 ?auto_3350419 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3350420 ?auto_3350417 )
      ( GET-2IMAGE-VERIFY ?auto_3350418 ?auto_3350419 ?auto_3350420 ?auto_3350417 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3350426 - DIRECTION
      ?auto_3350427 - MODE
      ?auto_3350428 - DIRECTION
      ?auto_3350425 - MODE
    )
    :vars
    (
      ?auto_3350429 - INSTRUMENT
      ?auto_3350430 - SATELLITE
      ?auto_3350431 - DIRECTION
      ?auto_3350432 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3350428 ?auto_3350426 ) ) ( ON_BOARD ?auto_3350429 ?auto_3350430 ) ( SUPPORTS ?auto_3350429 ?auto_3350427 ) ( not ( = ?auto_3350426 ?auto_3350431 ) ) ( not ( = ?auto_3350428 ?auto_3350431 ) ) ( not ( = ?auto_3350425 ?auto_3350427 ) ) ( CALIBRATION_TARGET ?auto_3350429 ?auto_3350431 ) ( POINTING ?auto_3350430 ?auto_3350428 ) ( ON_BOARD ?auto_3350432 ?auto_3350430 ) ( POWER_ON ?auto_3350432 ) ( not ( = ?auto_3350429 ?auto_3350432 ) ) ( CALIBRATED ?auto_3350432 ) ( SUPPORTS ?auto_3350432 ?auto_3350425 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3350428 ?auto_3350425 ?auto_3350426 ?auto_3350427 )
      ( GET-2IMAGE-VERIFY ?auto_3350426 ?auto_3350427 ?auto_3350428 ?auto_3350425 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3351133 - DIRECTION
      ?auto_3351134 - MODE
    )
    :vars
    (
      ?auto_3351140 - DIRECTION
      ?auto_3351135 - INSTRUMENT
      ?auto_3351136 - SATELLITE
      ?auto_3351137 - DIRECTION
      ?auto_3351139 - MODE
      ?auto_3351138 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3351133 ?auto_3351140 ) ) ( ON_BOARD ?auto_3351135 ?auto_3351136 ) ( SUPPORTS ?auto_3351135 ?auto_3351134 ) ( not ( = ?auto_3351133 ?auto_3351137 ) ) ( not ( = ?auto_3351140 ?auto_3351137 ) ) ( not ( = ?auto_3351139 ?auto_3351134 ) ) ( CALIBRATION_TARGET ?auto_3351135 ?auto_3351137 ) ( ON_BOARD ?auto_3351138 ?auto_3351136 ) ( POWER_ON ?auto_3351138 ) ( not ( = ?auto_3351135 ?auto_3351138 ) ) ( CALIBRATED ?auto_3351138 ) ( SUPPORTS ?auto_3351138 ?auto_3351139 ) ( POINTING ?auto_3351136 ?auto_3351137 ) )
    :subtasks
    ( ( !TURN_TO ?auto_3351136 ?auto_3351140 ?auto_3351137 )
      ( GET-2IMAGE ?auto_3351140 ?auto_3351139 ?auto_3351133 ?auto_3351134 )
      ( GET-1IMAGE-VERIFY ?auto_3351133 ?auto_3351134 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3351142 - DIRECTION
      ?auto_3351143 - MODE
      ?auto_3351144 - DIRECTION
      ?auto_3351141 - MODE
    )
    :vars
    (
      ?auto_3351145 - INSTRUMENT
      ?auto_3351146 - SATELLITE
      ?auto_3351148 - DIRECTION
      ?auto_3351147 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3351144 ?auto_3351142 ) ) ( ON_BOARD ?auto_3351145 ?auto_3351146 ) ( SUPPORTS ?auto_3351145 ?auto_3351141 ) ( not ( = ?auto_3351144 ?auto_3351148 ) ) ( not ( = ?auto_3351142 ?auto_3351148 ) ) ( not ( = ?auto_3351143 ?auto_3351141 ) ) ( CALIBRATION_TARGET ?auto_3351145 ?auto_3351148 ) ( ON_BOARD ?auto_3351147 ?auto_3351146 ) ( POWER_ON ?auto_3351147 ) ( not ( = ?auto_3351145 ?auto_3351147 ) ) ( CALIBRATED ?auto_3351147 ) ( SUPPORTS ?auto_3351147 ?auto_3351143 ) ( POINTING ?auto_3351146 ?auto_3351148 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3351144 ?auto_3351141 )
      ( GET-2IMAGE-VERIFY ?auto_3351142 ?auto_3351143 ?auto_3351144 ?auto_3351141 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3351150 - DIRECTION
      ?auto_3351151 - MODE
      ?auto_3351152 - DIRECTION
      ?auto_3351149 - MODE
    )
    :vars
    (
      ?auto_3351153 - INSTRUMENT
      ?auto_3351156 - SATELLITE
      ?auto_3351154 - DIRECTION
      ?auto_3351155 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3351152 ?auto_3351150 ) ) ( ON_BOARD ?auto_3351153 ?auto_3351156 ) ( SUPPORTS ?auto_3351153 ?auto_3351151 ) ( not ( = ?auto_3351150 ?auto_3351154 ) ) ( not ( = ?auto_3351152 ?auto_3351154 ) ) ( not ( = ?auto_3351149 ?auto_3351151 ) ) ( CALIBRATION_TARGET ?auto_3351153 ?auto_3351154 ) ( ON_BOARD ?auto_3351155 ?auto_3351156 ) ( POWER_ON ?auto_3351155 ) ( not ( = ?auto_3351153 ?auto_3351155 ) ) ( CALIBRATED ?auto_3351155 ) ( SUPPORTS ?auto_3351155 ?auto_3351149 ) ( POINTING ?auto_3351156 ?auto_3351154 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3351152 ?auto_3351149 ?auto_3351150 ?auto_3351151 )
      ( GET-2IMAGE-VERIFY ?auto_3351150 ?auto_3351151 ?auto_3351152 ?auto_3351149 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3351857 - DIRECTION
      ?auto_3351858 - MODE
    )
    :vars
    (
      ?auto_3351863 - DIRECTION
      ?auto_3351859 - INSTRUMENT
      ?auto_3351862 - SATELLITE
      ?auto_3351860 - DIRECTION
      ?auto_3351864 - MODE
      ?auto_3351861 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3351857 ?auto_3351863 ) ) ( ON_BOARD ?auto_3351859 ?auto_3351862 ) ( SUPPORTS ?auto_3351859 ?auto_3351858 ) ( not ( = ?auto_3351857 ?auto_3351860 ) ) ( not ( = ?auto_3351863 ?auto_3351860 ) ) ( not ( = ?auto_3351864 ?auto_3351858 ) ) ( CALIBRATION_TARGET ?auto_3351859 ?auto_3351860 ) ( ON_BOARD ?auto_3351861 ?auto_3351862 ) ( POWER_ON ?auto_3351861 ) ( not ( = ?auto_3351859 ?auto_3351861 ) ) ( SUPPORTS ?auto_3351861 ?auto_3351864 ) ( POINTING ?auto_3351862 ?auto_3351860 ) ( CALIBRATION_TARGET ?auto_3351861 ?auto_3351860 ) ( NOT_CALIBRATED ?auto_3351861 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_3351862 ?auto_3351861 ?auto_3351860 )
      ( GET-2IMAGE ?auto_3351863 ?auto_3351864 ?auto_3351857 ?auto_3351858 )
      ( GET-1IMAGE-VERIFY ?auto_3351857 ?auto_3351858 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3351866 - DIRECTION
      ?auto_3351867 - MODE
      ?auto_3351868 - DIRECTION
      ?auto_3351865 - MODE
    )
    :vars
    (
      ?auto_3351869 - INSTRUMENT
      ?auto_3351871 - SATELLITE
      ?auto_3351870 - DIRECTION
      ?auto_3351872 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3351868 ?auto_3351866 ) ) ( ON_BOARD ?auto_3351869 ?auto_3351871 ) ( SUPPORTS ?auto_3351869 ?auto_3351865 ) ( not ( = ?auto_3351868 ?auto_3351870 ) ) ( not ( = ?auto_3351866 ?auto_3351870 ) ) ( not ( = ?auto_3351867 ?auto_3351865 ) ) ( CALIBRATION_TARGET ?auto_3351869 ?auto_3351870 ) ( ON_BOARD ?auto_3351872 ?auto_3351871 ) ( POWER_ON ?auto_3351872 ) ( not ( = ?auto_3351869 ?auto_3351872 ) ) ( SUPPORTS ?auto_3351872 ?auto_3351867 ) ( POINTING ?auto_3351871 ?auto_3351870 ) ( CALIBRATION_TARGET ?auto_3351872 ?auto_3351870 ) ( NOT_CALIBRATED ?auto_3351872 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3351868 ?auto_3351865 )
      ( GET-2IMAGE-VERIFY ?auto_3351866 ?auto_3351867 ?auto_3351868 ?auto_3351865 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3351874 - DIRECTION
      ?auto_3351875 - MODE
      ?auto_3351876 - DIRECTION
      ?auto_3351873 - MODE
    )
    :vars
    (
      ?auto_3351878 - INSTRUMENT
      ?auto_3351880 - SATELLITE
      ?auto_3351879 - DIRECTION
      ?auto_3351877 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3351876 ?auto_3351874 ) ) ( ON_BOARD ?auto_3351878 ?auto_3351880 ) ( SUPPORTS ?auto_3351878 ?auto_3351875 ) ( not ( = ?auto_3351874 ?auto_3351879 ) ) ( not ( = ?auto_3351876 ?auto_3351879 ) ) ( not ( = ?auto_3351873 ?auto_3351875 ) ) ( CALIBRATION_TARGET ?auto_3351878 ?auto_3351879 ) ( ON_BOARD ?auto_3351877 ?auto_3351880 ) ( POWER_ON ?auto_3351877 ) ( not ( = ?auto_3351878 ?auto_3351877 ) ) ( SUPPORTS ?auto_3351877 ?auto_3351873 ) ( POINTING ?auto_3351880 ?auto_3351879 ) ( CALIBRATION_TARGET ?auto_3351877 ?auto_3351879 ) ( NOT_CALIBRATED ?auto_3351877 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3351876 ?auto_3351873 ?auto_3351874 ?auto_3351875 )
      ( GET-2IMAGE-VERIFY ?auto_3351874 ?auto_3351875 ?auto_3351876 ?auto_3351873 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3356750 - DIRECTION
      ?auto_3356751 - MODE
      ?auto_3356752 - DIRECTION
      ?auto_3356749 - MODE
      ?auto_3356754 - DIRECTION
      ?auto_3356753 - MODE
    )
    :vars
    (
      ?auto_3356755 - INSTRUMENT
      ?auto_3356756 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_3356752 ?auto_3356750 ) ) ( not ( = ?auto_3356754 ?auto_3356750 ) ) ( not ( = ?auto_3356754 ?auto_3356752 ) ) ( CALIBRATED ?auto_3356755 ) ( ON_BOARD ?auto_3356755 ?auto_3356756 ) ( SUPPORTS ?auto_3356755 ?auto_3356753 ) ( POWER_ON ?auto_3356755 ) ( POINTING ?auto_3356756 ?auto_3356754 ) ( HAVE_IMAGE ?auto_3356750 ?auto_3356751 ) ( HAVE_IMAGE ?auto_3356752 ?auto_3356749 ) ( not ( = ?auto_3356751 ?auto_3356749 ) ) ( not ( = ?auto_3356751 ?auto_3356753 ) ) ( not ( = ?auto_3356749 ?auto_3356753 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3356754 ?auto_3356753 )
      ( GET-3IMAGE-VERIFY ?auto_3356750 ?auto_3356751 ?auto_3356752 ?auto_3356749 ?auto_3356754 ?auto_3356753 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3356766 - DIRECTION
      ?auto_3356767 - MODE
      ?auto_3356768 - DIRECTION
      ?auto_3356765 - MODE
      ?auto_3356770 - DIRECTION
      ?auto_3356769 - MODE
    )
    :vars
    (
      ?auto_3356771 - INSTRUMENT
      ?auto_3356772 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_3356768 ?auto_3356766 ) ) ( not ( = ?auto_3356770 ?auto_3356766 ) ) ( not ( = ?auto_3356770 ?auto_3356768 ) ) ( CALIBRATED ?auto_3356771 ) ( ON_BOARD ?auto_3356771 ?auto_3356772 ) ( SUPPORTS ?auto_3356771 ?auto_3356765 ) ( POWER_ON ?auto_3356771 ) ( POINTING ?auto_3356772 ?auto_3356768 ) ( HAVE_IMAGE ?auto_3356766 ?auto_3356767 ) ( HAVE_IMAGE ?auto_3356770 ?auto_3356769 ) ( not ( = ?auto_3356767 ?auto_3356765 ) ) ( not ( = ?auto_3356767 ?auto_3356769 ) ) ( not ( = ?auto_3356765 ?auto_3356769 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3356768 ?auto_3356765 )
      ( GET-3IMAGE-VERIFY ?auto_3356766 ?auto_3356767 ?auto_3356768 ?auto_3356765 ?auto_3356770 ?auto_3356769 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3356826 - DIRECTION
      ?auto_3356827 - MODE
      ?auto_3356828 - DIRECTION
      ?auto_3356825 - MODE
      ?auto_3356830 - DIRECTION
      ?auto_3356829 - MODE
    )
    :vars
    (
      ?auto_3356831 - INSTRUMENT
      ?auto_3356832 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_3356828 ?auto_3356826 ) ) ( not ( = ?auto_3356830 ?auto_3356826 ) ) ( not ( = ?auto_3356830 ?auto_3356828 ) ) ( CALIBRATED ?auto_3356831 ) ( ON_BOARD ?auto_3356831 ?auto_3356832 ) ( SUPPORTS ?auto_3356831 ?auto_3356827 ) ( POWER_ON ?auto_3356831 ) ( POINTING ?auto_3356832 ?auto_3356826 ) ( HAVE_IMAGE ?auto_3356828 ?auto_3356825 ) ( HAVE_IMAGE ?auto_3356830 ?auto_3356829 ) ( not ( = ?auto_3356827 ?auto_3356825 ) ) ( not ( = ?auto_3356827 ?auto_3356829 ) ) ( not ( = ?auto_3356825 ?auto_3356829 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3356826 ?auto_3356827 )
      ( GET-3IMAGE-VERIFY ?auto_3356826 ?auto_3356827 ?auto_3356828 ?auto_3356825 ?auto_3356830 ?auto_3356829 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3360115 - DIRECTION
      ?auto_3360116 - MODE
      ?auto_3360117 - DIRECTION
      ?auto_3360114 - MODE
      ?auto_3360119 - DIRECTION
      ?auto_3360118 - MODE
    )
    :vars
    (
      ?auto_3360121 - INSTRUMENT
      ?auto_3360120 - SATELLITE
      ?auto_3360122 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3360117 ?auto_3360115 ) ) ( not ( = ?auto_3360119 ?auto_3360115 ) ) ( not ( = ?auto_3360119 ?auto_3360117 ) ) ( CALIBRATED ?auto_3360121 ) ( ON_BOARD ?auto_3360121 ?auto_3360120 ) ( SUPPORTS ?auto_3360121 ?auto_3360118 ) ( POWER_ON ?auto_3360121 ) ( POINTING ?auto_3360120 ?auto_3360122 ) ( not ( = ?auto_3360119 ?auto_3360122 ) ) ( HAVE_IMAGE ?auto_3360115 ?auto_3360116 ) ( not ( = ?auto_3360115 ?auto_3360122 ) ) ( not ( = ?auto_3360116 ?auto_3360118 ) ) ( HAVE_IMAGE ?auto_3360117 ?auto_3360114 ) ( not ( = ?auto_3360116 ?auto_3360114 ) ) ( not ( = ?auto_3360117 ?auto_3360122 ) ) ( not ( = ?auto_3360114 ?auto_3360118 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3360115 ?auto_3360116 ?auto_3360119 ?auto_3360118 )
      ( GET-3IMAGE-VERIFY ?auto_3360115 ?auto_3360116 ?auto_3360117 ?auto_3360114 ?auto_3360119 ?auto_3360118 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3360133 - DIRECTION
      ?auto_3360134 - MODE
      ?auto_3360135 - DIRECTION
      ?auto_3360132 - MODE
      ?auto_3360137 - DIRECTION
      ?auto_3360136 - MODE
    )
    :vars
    (
      ?auto_3360139 - INSTRUMENT
      ?auto_3360138 - SATELLITE
      ?auto_3360140 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3360135 ?auto_3360133 ) ) ( not ( = ?auto_3360137 ?auto_3360133 ) ) ( not ( = ?auto_3360137 ?auto_3360135 ) ) ( CALIBRATED ?auto_3360139 ) ( ON_BOARD ?auto_3360139 ?auto_3360138 ) ( SUPPORTS ?auto_3360139 ?auto_3360132 ) ( POWER_ON ?auto_3360139 ) ( POINTING ?auto_3360138 ?auto_3360140 ) ( not ( = ?auto_3360135 ?auto_3360140 ) ) ( HAVE_IMAGE ?auto_3360133 ?auto_3360134 ) ( not ( = ?auto_3360133 ?auto_3360140 ) ) ( not ( = ?auto_3360134 ?auto_3360132 ) ) ( HAVE_IMAGE ?auto_3360137 ?auto_3360136 ) ( not ( = ?auto_3360134 ?auto_3360136 ) ) ( not ( = ?auto_3360132 ?auto_3360136 ) ) ( not ( = ?auto_3360137 ?auto_3360140 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3360133 ?auto_3360134 ?auto_3360135 ?auto_3360132 )
      ( GET-3IMAGE-VERIFY ?auto_3360133 ?auto_3360134 ?auto_3360135 ?auto_3360132 ?auto_3360137 ?auto_3360136 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3360205 - DIRECTION
      ?auto_3360206 - MODE
      ?auto_3360207 - DIRECTION
      ?auto_3360204 - MODE
      ?auto_3360209 - DIRECTION
      ?auto_3360208 - MODE
    )
    :vars
    (
      ?auto_3360211 - INSTRUMENT
      ?auto_3360210 - SATELLITE
      ?auto_3360212 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3360207 ?auto_3360205 ) ) ( not ( = ?auto_3360209 ?auto_3360205 ) ) ( not ( = ?auto_3360209 ?auto_3360207 ) ) ( CALIBRATED ?auto_3360211 ) ( ON_BOARD ?auto_3360211 ?auto_3360210 ) ( SUPPORTS ?auto_3360211 ?auto_3360206 ) ( POWER_ON ?auto_3360211 ) ( POINTING ?auto_3360210 ?auto_3360212 ) ( not ( = ?auto_3360205 ?auto_3360212 ) ) ( HAVE_IMAGE ?auto_3360207 ?auto_3360204 ) ( not ( = ?auto_3360207 ?auto_3360212 ) ) ( not ( = ?auto_3360204 ?auto_3360206 ) ) ( HAVE_IMAGE ?auto_3360209 ?auto_3360208 ) ( not ( = ?auto_3360206 ?auto_3360208 ) ) ( not ( = ?auto_3360204 ?auto_3360208 ) ) ( not ( = ?auto_3360209 ?auto_3360212 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3360207 ?auto_3360204 ?auto_3360205 ?auto_3360206 )
      ( GET-3IMAGE-VERIFY ?auto_3360205 ?auto_3360206 ?auto_3360207 ?auto_3360204 ?auto_3360209 ?auto_3360208 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3363879 - DIRECTION
      ?auto_3363880 - MODE
      ?auto_3363881 - DIRECTION
      ?auto_3363878 - MODE
      ?auto_3363883 - DIRECTION
      ?auto_3363882 - MODE
    )
    :vars
    (
      ?auto_3363885 - INSTRUMENT
      ?auto_3363886 - SATELLITE
      ?auto_3363884 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3363881 ?auto_3363879 ) ) ( not ( = ?auto_3363883 ?auto_3363879 ) ) ( not ( = ?auto_3363883 ?auto_3363881 ) ) ( ON_BOARD ?auto_3363885 ?auto_3363886 ) ( SUPPORTS ?auto_3363885 ?auto_3363882 ) ( POWER_ON ?auto_3363885 ) ( POINTING ?auto_3363886 ?auto_3363884 ) ( not ( = ?auto_3363883 ?auto_3363884 ) ) ( HAVE_IMAGE ?auto_3363879 ?auto_3363880 ) ( not ( = ?auto_3363879 ?auto_3363884 ) ) ( not ( = ?auto_3363880 ?auto_3363882 ) ) ( CALIBRATION_TARGET ?auto_3363885 ?auto_3363884 ) ( NOT_CALIBRATED ?auto_3363885 ) ( HAVE_IMAGE ?auto_3363881 ?auto_3363878 ) ( not ( = ?auto_3363880 ?auto_3363878 ) ) ( not ( = ?auto_3363881 ?auto_3363884 ) ) ( not ( = ?auto_3363878 ?auto_3363882 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3363879 ?auto_3363880 ?auto_3363883 ?auto_3363882 )
      ( GET-3IMAGE-VERIFY ?auto_3363879 ?auto_3363880 ?auto_3363881 ?auto_3363878 ?auto_3363883 ?auto_3363882 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3363897 - DIRECTION
      ?auto_3363898 - MODE
      ?auto_3363899 - DIRECTION
      ?auto_3363896 - MODE
      ?auto_3363901 - DIRECTION
      ?auto_3363900 - MODE
    )
    :vars
    (
      ?auto_3363903 - INSTRUMENT
      ?auto_3363904 - SATELLITE
      ?auto_3363902 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3363899 ?auto_3363897 ) ) ( not ( = ?auto_3363901 ?auto_3363897 ) ) ( not ( = ?auto_3363901 ?auto_3363899 ) ) ( ON_BOARD ?auto_3363903 ?auto_3363904 ) ( SUPPORTS ?auto_3363903 ?auto_3363896 ) ( POWER_ON ?auto_3363903 ) ( POINTING ?auto_3363904 ?auto_3363902 ) ( not ( = ?auto_3363899 ?auto_3363902 ) ) ( HAVE_IMAGE ?auto_3363897 ?auto_3363898 ) ( not ( = ?auto_3363897 ?auto_3363902 ) ) ( not ( = ?auto_3363898 ?auto_3363896 ) ) ( CALIBRATION_TARGET ?auto_3363903 ?auto_3363902 ) ( NOT_CALIBRATED ?auto_3363903 ) ( HAVE_IMAGE ?auto_3363901 ?auto_3363900 ) ( not ( = ?auto_3363898 ?auto_3363900 ) ) ( not ( = ?auto_3363896 ?auto_3363900 ) ) ( not ( = ?auto_3363901 ?auto_3363902 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3363897 ?auto_3363898 ?auto_3363899 ?auto_3363896 )
      ( GET-3IMAGE-VERIFY ?auto_3363897 ?auto_3363898 ?auto_3363899 ?auto_3363896 ?auto_3363901 ?auto_3363900 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3363969 - DIRECTION
      ?auto_3363970 - MODE
      ?auto_3363971 - DIRECTION
      ?auto_3363968 - MODE
      ?auto_3363973 - DIRECTION
      ?auto_3363972 - MODE
    )
    :vars
    (
      ?auto_3363975 - INSTRUMENT
      ?auto_3363976 - SATELLITE
      ?auto_3363974 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3363971 ?auto_3363969 ) ) ( not ( = ?auto_3363973 ?auto_3363969 ) ) ( not ( = ?auto_3363973 ?auto_3363971 ) ) ( ON_BOARD ?auto_3363975 ?auto_3363976 ) ( SUPPORTS ?auto_3363975 ?auto_3363970 ) ( POWER_ON ?auto_3363975 ) ( POINTING ?auto_3363976 ?auto_3363974 ) ( not ( = ?auto_3363969 ?auto_3363974 ) ) ( HAVE_IMAGE ?auto_3363971 ?auto_3363968 ) ( not ( = ?auto_3363971 ?auto_3363974 ) ) ( not ( = ?auto_3363968 ?auto_3363970 ) ) ( CALIBRATION_TARGET ?auto_3363975 ?auto_3363974 ) ( NOT_CALIBRATED ?auto_3363975 ) ( HAVE_IMAGE ?auto_3363973 ?auto_3363972 ) ( not ( = ?auto_3363970 ?auto_3363972 ) ) ( not ( = ?auto_3363968 ?auto_3363972 ) ) ( not ( = ?auto_3363973 ?auto_3363974 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3363971 ?auto_3363968 ?auto_3363969 ?auto_3363970 )
      ( GET-3IMAGE-VERIFY ?auto_3363969 ?auto_3363970 ?auto_3363971 ?auto_3363968 ?auto_3363973 ?auto_3363972 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3367643 - DIRECTION
      ?auto_3367644 - MODE
      ?auto_3367645 - DIRECTION
      ?auto_3367642 - MODE
      ?auto_3367647 - DIRECTION
      ?auto_3367646 - MODE
    )
    :vars
    (
      ?auto_3367648 - INSTRUMENT
      ?auto_3367650 - SATELLITE
      ?auto_3367649 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3367645 ?auto_3367643 ) ) ( not ( = ?auto_3367647 ?auto_3367643 ) ) ( not ( = ?auto_3367647 ?auto_3367645 ) ) ( ON_BOARD ?auto_3367648 ?auto_3367650 ) ( SUPPORTS ?auto_3367648 ?auto_3367646 ) ( POINTING ?auto_3367650 ?auto_3367649 ) ( not ( = ?auto_3367647 ?auto_3367649 ) ) ( HAVE_IMAGE ?auto_3367643 ?auto_3367644 ) ( not ( = ?auto_3367643 ?auto_3367649 ) ) ( not ( = ?auto_3367644 ?auto_3367646 ) ) ( CALIBRATION_TARGET ?auto_3367648 ?auto_3367649 ) ( POWER_AVAIL ?auto_3367650 ) ( HAVE_IMAGE ?auto_3367645 ?auto_3367642 ) ( not ( = ?auto_3367644 ?auto_3367642 ) ) ( not ( = ?auto_3367645 ?auto_3367649 ) ) ( not ( = ?auto_3367642 ?auto_3367646 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3367643 ?auto_3367644 ?auto_3367647 ?auto_3367646 )
      ( GET-3IMAGE-VERIFY ?auto_3367643 ?auto_3367644 ?auto_3367645 ?auto_3367642 ?auto_3367647 ?auto_3367646 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3367661 - DIRECTION
      ?auto_3367662 - MODE
      ?auto_3367663 - DIRECTION
      ?auto_3367660 - MODE
      ?auto_3367665 - DIRECTION
      ?auto_3367664 - MODE
    )
    :vars
    (
      ?auto_3367666 - INSTRUMENT
      ?auto_3367668 - SATELLITE
      ?auto_3367667 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3367663 ?auto_3367661 ) ) ( not ( = ?auto_3367665 ?auto_3367661 ) ) ( not ( = ?auto_3367665 ?auto_3367663 ) ) ( ON_BOARD ?auto_3367666 ?auto_3367668 ) ( SUPPORTS ?auto_3367666 ?auto_3367660 ) ( POINTING ?auto_3367668 ?auto_3367667 ) ( not ( = ?auto_3367663 ?auto_3367667 ) ) ( HAVE_IMAGE ?auto_3367661 ?auto_3367662 ) ( not ( = ?auto_3367661 ?auto_3367667 ) ) ( not ( = ?auto_3367662 ?auto_3367660 ) ) ( CALIBRATION_TARGET ?auto_3367666 ?auto_3367667 ) ( POWER_AVAIL ?auto_3367668 ) ( HAVE_IMAGE ?auto_3367665 ?auto_3367664 ) ( not ( = ?auto_3367662 ?auto_3367664 ) ) ( not ( = ?auto_3367660 ?auto_3367664 ) ) ( not ( = ?auto_3367665 ?auto_3367667 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3367661 ?auto_3367662 ?auto_3367663 ?auto_3367660 )
      ( GET-3IMAGE-VERIFY ?auto_3367661 ?auto_3367662 ?auto_3367663 ?auto_3367660 ?auto_3367665 ?auto_3367664 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3367733 - DIRECTION
      ?auto_3367734 - MODE
      ?auto_3367735 - DIRECTION
      ?auto_3367732 - MODE
      ?auto_3367737 - DIRECTION
      ?auto_3367736 - MODE
    )
    :vars
    (
      ?auto_3367738 - INSTRUMENT
      ?auto_3367740 - SATELLITE
      ?auto_3367739 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3367735 ?auto_3367733 ) ) ( not ( = ?auto_3367737 ?auto_3367733 ) ) ( not ( = ?auto_3367737 ?auto_3367735 ) ) ( ON_BOARD ?auto_3367738 ?auto_3367740 ) ( SUPPORTS ?auto_3367738 ?auto_3367734 ) ( POINTING ?auto_3367740 ?auto_3367739 ) ( not ( = ?auto_3367733 ?auto_3367739 ) ) ( HAVE_IMAGE ?auto_3367735 ?auto_3367732 ) ( not ( = ?auto_3367735 ?auto_3367739 ) ) ( not ( = ?auto_3367732 ?auto_3367734 ) ) ( CALIBRATION_TARGET ?auto_3367738 ?auto_3367739 ) ( POWER_AVAIL ?auto_3367740 ) ( HAVE_IMAGE ?auto_3367737 ?auto_3367736 ) ( not ( = ?auto_3367734 ?auto_3367736 ) ) ( not ( = ?auto_3367732 ?auto_3367736 ) ) ( not ( = ?auto_3367737 ?auto_3367739 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3367735 ?auto_3367732 ?auto_3367733 ?auto_3367734 )
      ( GET-3IMAGE-VERIFY ?auto_3367733 ?auto_3367734 ?auto_3367735 ?auto_3367732 ?auto_3367737 ?auto_3367736 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3371359 - DIRECTION
      ?auto_3371360 - MODE
    )
    :vars
    (
      ?auto_3371363 - DIRECTION
      ?auto_3371362 - INSTRUMENT
      ?auto_3371365 - SATELLITE
      ?auto_3371364 - DIRECTION
      ?auto_3371361 - MODE
      ?auto_3371366 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3371359 ?auto_3371363 ) ) ( ON_BOARD ?auto_3371362 ?auto_3371365 ) ( SUPPORTS ?auto_3371362 ?auto_3371360 ) ( not ( = ?auto_3371359 ?auto_3371364 ) ) ( HAVE_IMAGE ?auto_3371363 ?auto_3371361 ) ( not ( = ?auto_3371363 ?auto_3371364 ) ) ( not ( = ?auto_3371361 ?auto_3371360 ) ) ( CALIBRATION_TARGET ?auto_3371362 ?auto_3371364 ) ( POWER_AVAIL ?auto_3371365 ) ( POINTING ?auto_3371365 ?auto_3371366 ) ( not ( = ?auto_3371364 ?auto_3371366 ) ) ( not ( = ?auto_3371359 ?auto_3371366 ) ) ( not ( = ?auto_3371363 ?auto_3371366 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_3371365 ?auto_3371364 ?auto_3371366 )
      ( GET-2IMAGE ?auto_3371363 ?auto_3371361 ?auto_3371359 ?auto_3371360 )
      ( GET-1IMAGE-VERIFY ?auto_3371359 ?auto_3371360 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3371368 - DIRECTION
      ?auto_3371369 - MODE
      ?auto_3371370 - DIRECTION
      ?auto_3371367 - MODE
    )
    :vars
    (
      ?auto_3371372 - INSTRUMENT
      ?auto_3371373 - SATELLITE
      ?auto_3371371 - DIRECTION
      ?auto_3371374 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3371370 ?auto_3371368 ) ) ( ON_BOARD ?auto_3371372 ?auto_3371373 ) ( SUPPORTS ?auto_3371372 ?auto_3371367 ) ( not ( = ?auto_3371370 ?auto_3371371 ) ) ( HAVE_IMAGE ?auto_3371368 ?auto_3371369 ) ( not ( = ?auto_3371368 ?auto_3371371 ) ) ( not ( = ?auto_3371369 ?auto_3371367 ) ) ( CALIBRATION_TARGET ?auto_3371372 ?auto_3371371 ) ( POWER_AVAIL ?auto_3371373 ) ( POINTING ?auto_3371373 ?auto_3371374 ) ( not ( = ?auto_3371371 ?auto_3371374 ) ) ( not ( = ?auto_3371370 ?auto_3371374 ) ) ( not ( = ?auto_3371368 ?auto_3371374 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3371370 ?auto_3371367 )
      ( GET-2IMAGE-VERIFY ?auto_3371368 ?auto_3371369 ?auto_3371370 ?auto_3371367 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3371376 - DIRECTION
      ?auto_3371377 - MODE
      ?auto_3371378 - DIRECTION
      ?auto_3371375 - MODE
    )
    :vars
    (
      ?auto_3371382 - DIRECTION
      ?auto_3371380 - INSTRUMENT
      ?auto_3371381 - SATELLITE
      ?auto_3371379 - DIRECTION
      ?auto_3371383 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_3371378 ?auto_3371376 ) ) ( not ( = ?auto_3371378 ?auto_3371382 ) ) ( ON_BOARD ?auto_3371380 ?auto_3371381 ) ( SUPPORTS ?auto_3371380 ?auto_3371375 ) ( not ( = ?auto_3371378 ?auto_3371379 ) ) ( HAVE_IMAGE ?auto_3371382 ?auto_3371383 ) ( not ( = ?auto_3371382 ?auto_3371379 ) ) ( not ( = ?auto_3371383 ?auto_3371375 ) ) ( CALIBRATION_TARGET ?auto_3371380 ?auto_3371379 ) ( POWER_AVAIL ?auto_3371381 ) ( POINTING ?auto_3371381 ?auto_3371376 ) ( not ( = ?auto_3371379 ?auto_3371376 ) ) ( not ( = ?auto_3371382 ?auto_3371376 ) ) ( HAVE_IMAGE ?auto_3371376 ?auto_3371377 ) ( not ( = ?auto_3371377 ?auto_3371375 ) ) ( not ( = ?auto_3371377 ?auto_3371383 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3371382 ?auto_3371383 ?auto_3371378 ?auto_3371375 )
      ( GET-2IMAGE-VERIFY ?auto_3371376 ?auto_3371377 ?auto_3371378 ?auto_3371375 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3371385 - DIRECTION
      ?auto_3371386 - MODE
      ?auto_3371387 - DIRECTION
      ?auto_3371384 - MODE
    )
    :vars
    (
      ?auto_3371389 - INSTRUMENT
      ?auto_3371391 - SATELLITE
      ?auto_3371388 - DIRECTION
      ?auto_3371390 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3371387 ?auto_3371385 ) ) ( ON_BOARD ?auto_3371389 ?auto_3371391 ) ( SUPPORTS ?auto_3371389 ?auto_3371386 ) ( not ( = ?auto_3371385 ?auto_3371388 ) ) ( HAVE_IMAGE ?auto_3371387 ?auto_3371384 ) ( not ( = ?auto_3371387 ?auto_3371388 ) ) ( not ( = ?auto_3371384 ?auto_3371386 ) ) ( CALIBRATION_TARGET ?auto_3371389 ?auto_3371388 ) ( POWER_AVAIL ?auto_3371391 ) ( POINTING ?auto_3371391 ?auto_3371390 ) ( not ( = ?auto_3371388 ?auto_3371390 ) ) ( not ( = ?auto_3371385 ?auto_3371390 ) ) ( not ( = ?auto_3371387 ?auto_3371390 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3371387 ?auto_3371384 ?auto_3371385 ?auto_3371386 )
      ( GET-2IMAGE-VERIFY ?auto_3371385 ?auto_3371386 ?auto_3371387 ?auto_3371384 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3371393 - DIRECTION
      ?auto_3371394 - MODE
      ?auto_3371395 - DIRECTION
      ?auto_3371392 - MODE
    )
    :vars
    (
      ?auto_3371399 - DIRECTION
      ?auto_3371397 - INSTRUMENT
      ?auto_3371398 - SATELLITE
      ?auto_3371396 - DIRECTION
      ?auto_3371400 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_3371395 ?auto_3371393 ) ) ( not ( = ?auto_3371393 ?auto_3371399 ) ) ( ON_BOARD ?auto_3371397 ?auto_3371398 ) ( SUPPORTS ?auto_3371397 ?auto_3371394 ) ( not ( = ?auto_3371393 ?auto_3371396 ) ) ( HAVE_IMAGE ?auto_3371399 ?auto_3371400 ) ( not ( = ?auto_3371399 ?auto_3371396 ) ) ( not ( = ?auto_3371400 ?auto_3371394 ) ) ( CALIBRATION_TARGET ?auto_3371397 ?auto_3371396 ) ( POWER_AVAIL ?auto_3371398 ) ( POINTING ?auto_3371398 ?auto_3371395 ) ( not ( = ?auto_3371396 ?auto_3371395 ) ) ( not ( = ?auto_3371399 ?auto_3371395 ) ) ( HAVE_IMAGE ?auto_3371395 ?auto_3371392 ) ( not ( = ?auto_3371394 ?auto_3371392 ) ) ( not ( = ?auto_3371392 ?auto_3371400 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3371399 ?auto_3371400 ?auto_3371393 ?auto_3371394 )
      ( GET-2IMAGE-VERIFY ?auto_3371393 ?auto_3371394 ?auto_3371395 ?auto_3371392 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3371422 - DIRECTION
      ?auto_3371423 - MODE
      ?auto_3371424 - DIRECTION
      ?auto_3371421 - MODE
      ?auto_3371426 - DIRECTION
      ?auto_3371425 - MODE
    )
    :vars
    (
      ?auto_3371428 - INSTRUMENT
      ?auto_3371429 - SATELLITE
      ?auto_3371427 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3371424 ?auto_3371422 ) ) ( not ( = ?auto_3371426 ?auto_3371422 ) ) ( not ( = ?auto_3371426 ?auto_3371424 ) ) ( ON_BOARD ?auto_3371428 ?auto_3371429 ) ( SUPPORTS ?auto_3371428 ?auto_3371425 ) ( not ( = ?auto_3371426 ?auto_3371427 ) ) ( HAVE_IMAGE ?auto_3371422 ?auto_3371423 ) ( not ( = ?auto_3371422 ?auto_3371427 ) ) ( not ( = ?auto_3371423 ?auto_3371425 ) ) ( CALIBRATION_TARGET ?auto_3371428 ?auto_3371427 ) ( POWER_AVAIL ?auto_3371429 ) ( POINTING ?auto_3371429 ?auto_3371424 ) ( not ( = ?auto_3371427 ?auto_3371424 ) ) ( HAVE_IMAGE ?auto_3371424 ?auto_3371421 ) ( not ( = ?auto_3371423 ?auto_3371421 ) ) ( not ( = ?auto_3371421 ?auto_3371425 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3371422 ?auto_3371423 ?auto_3371426 ?auto_3371425 )
      ( GET-3IMAGE-VERIFY ?auto_3371422 ?auto_3371423 ?auto_3371424 ?auto_3371421 ?auto_3371426 ?auto_3371425 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3371441 - DIRECTION
      ?auto_3371442 - MODE
      ?auto_3371443 - DIRECTION
      ?auto_3371440 - MODE
      ?auto_3371445 - DIRECTION
      ?auto_3371444 - MODE
    )
    :vars
    (
      ?auto_3371447 - INSTRUMENT
      ?auto_3371448 - SATELLITE
      ?auto_3371446 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3371443 ?auto_3371441 ) ) ( not ( = ?auto_3371445 ?auto_3371441 ) ) ( not ( = ?auto_3371445 ?auto_3371443 ) ) ( ON_BOARD ?auto_3371447 ?auto_3371448 ) ( SUPPORTS ?auto_3371447 ?auto_3371440 ) ( not ( = ?auto_3371443 ?auto_3371446 ) ) ( HAVE_IMAGE ?auto_3371441 ?auto_3371442 ) ( not ( = ?auto_3371441 ?auto_3371446 ) ) ( not ( = ?auto_3371442 ?auto_3371440 ) ) ( CALIBRATION_TARGET ?auto_3371447 ?auto_3371446 ) ( POWER_AVAIL ?auto_3371448 ) ( POINTING ?auto_3371448 ?auto_3371445 ) ( not ( = ?auto_3371446 ?auto_3371445 ) ) ( HAVE_IMAGE ?auto_3371445 ?auto_3371444 ) ( not ( = ?auto_3371442 ?auto_3371444 ) ) ( not ( = ?auto_3371440 ?auto_3371444 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3371441 ?auto_3371442 ?auto_3371443 ?auto_3371440 )
      ( GET-3IMAGE-VERIFY ?auto_3371441 ?auto_3371442 ?auto_3371443 ?auto_3371440 ?auto_3371445 ?auto_3371444 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3371460 - DIRECTION
      ?auto_3371461 - MODE
      ?auto_3371462 - DIRECTION
      ?auto_3371459 - MODE
      ?auto_3371464 - DIRECTION
      ?auto_3371463 - MODE
    )
    :vars
    (
      ?auto_3371466 - INSTRUMENT
      ?auto_3371467 - SATELLITE
      ?auto_3371465 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3371462 ?auto_3371460 ) ) ( not ( = ?auto_3371464 ?auto_3371460 ) ) ( not ( = ?auto_3371464 ?auto_3371462 ) ) ( ON_BOARD ?auto_3371466 ?auto_3371467 ) ( SUPPORTS ?auto_3371466 ?auto_3371463 ) ( not ( = ?auto_3371464 ?auto_3371465 ) ) ( HAVE_IMAGE ?auto_3371462 ?auto_3371459 ) ( not ( = ?auto_3371462 ?auto_3371465 ) ) ( not ( = ?auto_3371459 ?auto_3371463 ) ) ( CALIBRATION_TARGET ?auto_3371466 ?auto_3371465 ) ( POWER_AVAIL ?auto_3371467 ) ( POINTING ?auto_3371467 ?auto_3371460 ) ( not ( = ?auto_3371465 ?auto_3371460 ) ) ( HAVE_IMAGE ?auto_3371460 ?auto_3371461 ) ( not ( = ?auto_3371461 ?auto_3371459 ) ) ( not ( = ?auto_3371461 ?auto_3371463 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3371462 ?auto_3371459 ?auto_3371464 ?auto_3371463 )
      ( GET-3IMAGE-VERIFY ?auto_3371460 ?auto_3371461 ?auto_3371462 ?auto_3371459 ?auto_3371464 ?auto_3371463 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3371480 - DIRECTION
      ?auto_3371481 - MODE
      ?auto_3371482 - DIRECTION
      ?auto_3371479 - MODE
      ?auto_3371484 - DIRECTION
      ?auto_3371483 - MODE
    )
    :vars
    (
      ?auto_3371486 - INSTRUMENT
      ?auto_3371487 - SATELLITE
      ?auto_3371485 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3371482 ?auto_3371480 ) ) ( not ( = ?auto_3371484 ?auto_3371480 ) ) ( not ( = ?auto_3371484 ?auto_3371482 ) ) ( ON_BOARD ?auto_3371486 ?auto_3371487 ) ( SUPPORTS ?auto_3371486 ?auto_3371479 ) ( not ( = ?auto_3371482 ?auto_3371485 ) ) ( HAVE_IMAGE ?auto_3371484 ?auto_3371483 ) ( not ( = ?auto_3371484 ?auto_3371485 ) ) ( not ( = ?auto_3371483 ?auto_3371479 ) ) ( CALIBRATION_TARGET ?auto_3371486 ?auto_3371485 ) ( POWER_AVAIL ?auto_3371487 ) ( POINTING ?auto_3371487 ?auto_3371480 ) ( not ( = ?auto_3371485 ?auto_3371480 ) ) ( HAVE_IMAGE ?auto_3371480 ?auto_3371481 ) ( not ( = ?auto_3371481 ?auto_3371479 ) ) ( not ( = ?auto_3371481 ?auto_3371483 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3371484 ?auto_3371483 ?auto_3371482 ?auto_3371479 )
      ( GET-3IMAGE-VERIFY ?auto_3371480 ?auto_3371481 ?auto_3371482 ?auto_3371479 ?auto_3371484 ?auto_3371483 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3371521 - DIRECTION
      ?auto_3371522 - MODE
      ?auto_3371523 - DIRECTION
      ?auto_3371520 - MODE
      ?auto_3371525 - DIRECTION
      ?auto_3371524 - MODE
    )
    :vars
    (
      ?auto_3371527 - INSTRUMENT
      ?auto_3371528 - SATELLITE
      ?auto_3371526 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3371523 ?auto_3371521 ) ) ( not ( = ?auto_3371525 ?auto_3371521 ) ) ( not ( = ?auto_3371525 ?auto_3371523 ) ) ( ON_BOARD ?auto_3371527 ?auto_3371528 ) ( SUPPORTS ?auto_3371527 ?auto_3371522 ) ( not ( = ?auto_3371521 ?auto_3371526 ) ) ( HAVE_IMAGE ?auto_3371523 ?auto_3371520 ) ( not ( = ?auto_3371523 ?auto_3371526 ) ) ( not ( = ?auto_3371520 ?auto_3371522 ) ) ( CALIBRATION_TARGET ?auto_3371527 ?auto_3371526 ) ( POWER_AVAIL ?auto_3371528 ) ( POINTING ?auto_3371528 ?auto_3371525 ) ( not ( = ?auto_3371526 ?auto_3371525 ) ) ( HAVE_IMAGE ?auto_3371525 ?auto_3371524 ) ( not ( = ?auto_3371522 ?auto_3371524 ) ) ( not ( = ?auto_3371520 ?auto_3371524 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3371523 ?auto_3371520 ?auto_3371521 ?auto_3371522 )
      ( GET-3IMAGE-VERIFY ?auto_3371521 ?auto_3371522 ?auto_3371523 ?auto_3371520 ?auto_3371525 ?auto_3371524 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3371540 - DIRECTION
      ?auto_3371541 - MODE
      ?auto_3371542 - DIRECTION
      ?auto_3371539 - MODE
      ?auto_3371544 - DIRECTION
      ?auto_3371543 - MODE
    )
    :vars
    (
      ?auto_3371546 - INSTRUMENT
      ?auto_3371547 - SATELLITE
      ?auto_3371545 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3371542 ?auto_3371540 ) ) ( not ( = ?auto_3371544 ?auto_3371540 ) ) ( not ( = ?auto_3371544 ?auto_3371542 ) ) ( ON_BOARD ?auto_3371546 ?auto_3371547 ) ( SUPPORTS ?auto_3371546 ?auto_3371541 ) ( not ( = ?auto_3371540 ?auto_3371545 ) ) ( HAVE_IMAGE ?auto_3371544 ?auto_3371543 ) ( not ( = ?auto_3371544 ?auto_3371545 ) ) ( not ( = ?auto_3371543 ?auto_3371541 ) ) ( CALIBRATION_TARGET ?auto_3371546 ?auto_3371545 ) ( POWER_AVAIL ?auto_3371547 ) ( POINTING ?auto_3371547 ?auto_3371542 ) ( not ( = ?auto_3371545 ?auto_3371542 ) ) ( HAVE_IMAGE ?auto_3371542 ?auto_3371539 ) ( not ( = ?auto_3371541 ?auto_3371539 ) ) ( not ( = ?auto_3371539 ?auto_3371543 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3371544 ?auto_3371543 ?auto_3371540 ?auto_3371541 )
      ( GET-3IMAGE-VERIFY ?auto_3371540 ?auto_3371541 ?auto_3371542 ?auto_3371539 ?auto_3371544 ?auto_3371543 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3375199 - DIRECTION
      ?auto_3375200 - MODE
    )
    :vars
    (
      ?auto_3375205 - DIRECTION
      ?auto_3375202 - INSTRUMENT
      ?auto_3375204 - SATELLITE
      ?auto_3375201 - DIRECTION
      ?auto_3375206 - MODE
      ?auto_3375203 - DIRECTION
      ?auto_3375207 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3375199 ?auto_3375205 ) ) ( ON_BOARD ?auto_3375202 ?auto_3375204 ) ( SUPPORTS ?auto_3375202 ?auto_3375200 ) ( not ( = ?auto_3375199 ?auto_3375201 ) ) ( HAVE_IMAGE ?auto_3375205 ?auto_3375206 ) ( not ( = ?auto_3375205 ?auto_3375201 ) ) ( not ( = ?auto_3375206 ?auto_3375200 ) ) ( CALIBRATION_TARGET ?auto_3375202 ?auto_3375201 ) ( POINTING ?auto_3375204 ?auto_3375203 ) ( not ( = ?auto_3375201 ?auto_3375203 ) ) ( not ( = ?auto_3375199 ?auto_3375203 ) ) ( not ( = ?auto_3375205 ?auto_3375203 ) ) ( ON_BOARD ?auto_3375207 ?auto_3375204 ) ( POWER_ON ?auto_3375207 ) ( not ( = ?auto_3375202 ?auto_3375207 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_3375207 ?auto_3375204 )
      ( GET-2IMAGE ?auto_3375205 ?auto_3375206 ?auto_3375199 ?auto_3375200 )
      ( GET-1IMAGE-VERIFY ?auto_3375199 ?auto_3375200 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3375209 - DIRECTION
      ?auto_3375210 - MODE
      ?auto_3375211 - DIRECTION
      ?auto_3375208 - MODE
    )
    :vars
    (
      ?auto_3375216 - INSTRUMENT
      ?auto_3375212 - SATELLITE
      ?auto_3375215 - DIRECTION
      ?auto_3375214 - DIRECTION
      ?auto_3375213 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3375211 ?auto_3375209 ) ) ( ON_BOARD ?auto_3375216 ?auto_3375212 ) ( SUPPORTS ?auto_3375216 ?auto_3375208 ) ( not ( = ?auto_3375211 ?auto_3375215 ) ) ( HAVE_IMAGE ?auto_3375209 ?auto_3375210 ) ( not ( = ?auto_3375209 ?auto_3375215 ) ) ( not ( = ?auto_3375210 ?auto_3375208 ) ) ( CALIBRATION_TARGET ?auto_3375216 ?auto_3375215 ) ( POINTING ?auto_3375212 ?auto_3375214 ) ( not ( = ?auto_3375215 ?auto_3375214 ) ) ( not ( = ?auto_3375211 ?auto_3375214 ) ) ( not ( = ?auto_3375209 ?auto_3375214 ) ) ( ON_BOARD ?auto_3375213 ?auto_3375212 ) ( POWER_ON ?auto_3375213 ) ( not ( = ?auto_3375216 ?auto_3375213 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3375211 ?auto_3375208 )
      ( GET-2IMAGE-VERIFY ?auto_3375209 ?auto_3375210 ?auto_3375211 ?auto_3375208 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3375218 - DIRECTION
      ?auto_3375219 - MODE
      ?auto_3375220 - DIRECTION
      ?auto_3375217 - MODE
    )
    :vars
    (
      ?auto_3375225 - DIRECTION
      ?auto_3375224 - INSTRUMENT
      ?auto_3375222 - SATELLITE
      ?auto_3375223 - DIRECTION
      ?auto_3375221 - MODE
      ?auto_3375226 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3375220 ?auto_3375218 ) ) ( not ( = ?auto_3375220 ?auto_3375225 ) ) ( ON_BOARD ?auto_3375224 ?auto_3375222 ) ( SUPPORTS ?auto_3375224 ?auto_3375217 ) ( not ( = ?auto_3375220 ?auto_3375223 ) ) ( HAVE_IMAGE ?auto_3375225 ?auto_3375221 ) ( not ( = ?auto_3375225 ?auto_3375223 ) ) ( not ( = ?auto_3375221 ?auto_3375217 ) ) ( CALIBRATION_TARGET ?auto_3375224 ?auto_3375223 ) ( POINTING ?auto_3375222 ?auto_3375218 ) ( not ( = ?auto_3375223 ?auto_3375218 ) ) ( not ( = ?auto_3375225 ?auto_3375218 ) ) ( ON_BOARD ?auto_3375226 ?auto_3375222 ) ( POWER_ON ?auto_3375226 ) ( not ( = ?auto_3375224 ?auto_3375226 ) ) ( HAVE_IMAGE ?auto_3375218 ?auto_3375219 ) ( not ( = ?auto_3375219 ?auto_3375217 ) ) ( not ( = ?auto_3375219 ?auto_3375221 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3375225 ?auto_3375221 ?auto_3375220 ?auto_3375217 )
      ( GET-2IMAGE-VERIFY ?auto_3375218 ?auto_3375219 ?auto_3375220 ?auto_3375217 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3375228 - DIRECTION
      ?auto_3375229 - MODE
      ?auto_3375230 - DIRECTION
      ?auto_3375227 - MODE
    )
    :vars
    (
      ?auto_3375234 - INSTRUMENT
      ?auto_3375231 - SATELLITE
      ?auto_3375232 - DIRECTION
      ?auto_3375233 - DIRECTION
      ?auto_3375235 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3375230 ?auto_3375228 ) ) ( ON_BOARD ?auto_3375234 ?auto_3375231 ) ( SUPPORTS ?auto_3375234 ?auto_3375229 ) ( not ( = ?auto_3375228 ?auto_3375232 ) ) ( HAVE_IMAGE ?auto_3375230 ?auto_3375227 ) ( not ( = ?auto_3375230 ?auto_3375232 ) ) ( not ( = ?auto_3375227 ?auto_3375229 ) ) ( CALIBRATION_TARGET ?auto_3375234 ?auto_3375232 ) ( POINTING ?auto_3375231 ?auto_3375233 ) ( not ( = ?auto_3375232 ?auto_3375233 ) ) ( not ( = ?auto_3375228 ?auto_3375233 ) ) ( not ( = ?auto_3375230 ?auto_3375233 ) ) ( ON_BOARD ?auto_3375235 ?auto_3375231 ) ( POWER_ON ?auto_3375235 ) ( not ( = ?auto_3375234 ?auto_3375235 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3375230 ?auto_3375227 ?auto_3375228 ?auto_3375229 )
      ( GET-2IMAGE-VERIFY ?auto_3375228 ?auto_3375229 ?auto_3375230 ?auto_3375227 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3375237 - DIRECTION
      ?auto_3375238 - MODE
      ?auto_3375239 - DIRECTION
      ?auto_3375236 - MODE
    )
    :vars
    (
      ?auto_3375244 - DIRECTION
      ?auto_3375243 - INSTRUMENT
      ?auto_3375241 - SATELLITE
      ?auto_3375242 - DIRECTION
      ?auto_3375240 - MODE
      ?auto_3375245 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3375239 ?auto_3375237 ) ) ( not ( = ?auto_3375237 ?auto_3375244 ) ) ( ON_BOARD ?auto_3375243 ?auto_3375241 ) ( SUPPORTS ?auto_3375243 ?auto_3375238 ) ( not ( = ?auto_3375237 ?auto_3375242 ) ) ( HAVE_IMAGE ?auto_3375244 ?auto_3375240 ) ( not ( = ?auto_3375244 ?auto_3375242 ) ) ( not ( = ?auto_3375240 ?auto_3375238 ) ) ( CALIBRATION_TARGET ?auto_3375243 ?auto_3375242 ) ( POINTING ?auto_3375241 ?auto_3375239 ) ( not ( = ?auto_3375242 ?auto_3375239 ) ) ( not ( = ?auto_3375244 ?auto_3375239 ) ) ( ON_BOARD ?auto_3375245 ?auto_3375241 ) ( POWER_ON ?auto_3375245 ) ( not ( = ?auto_3375243 ?auto_3375245 ) ) ( HAVE_IMAGE ?auto_3375239 ?auto_3375236 ) ( not ( = ?auto_3375238 ?auto_3375236 ) ) ( not ( = ?auto_3375236 ?auto_3375240 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3375244 ?auto_3375240 ?auto_3375237 ?auto_3375238 )
      ( GET-2IMAGE-VERIFY ?auto_3375237 ?auto_3375238 ?auto_3375239 ?auto_3375236 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3375269 - DIRECTION
      ?auto_3375270 - MODE
      ?auto_3375271 - DIRECTION
      ?auto_3375268 - MODE
      ?auto_3375273 - DIRECTION
      ?auto_3375272 - MODE
    )
    :vars
    (
      ?auto_3375276 - INSTRUMENT
      ?auto_3375274 - SATELLITE
      ?auto_3375275 - DIRECTION
      ?auto_3375277 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3375271 ?auto_3375269 ) ) ( not ( = ?auto_3375273 ?auto_3375269 ) ) ( not ( = ?auto_3375273 ?auto_3375271 ) ) ( ON_BOARD ?auto_3375276 ?auto_3375274 ) ( SUPPORTS ?auto_3375276 ?auto_3375272 ) ( not ( = ?auto_3375273 ?auto_3375275 ) ) ( HAVE_IMAGE ?auto_3375269 ?auto_3375270 ) ( not ( = ?auto_3375269 ?auto_3375275 ) ) ( not ( = ?auto_3375270 ?auto_3375272 ) ) ( CALIBRATION_TARGET ?auto_3375276 ?auto_3375275 ) ( POINTING ?auto_3375274 ?auto_3375271 ) ( not ( = ?auto_3375275 ?auto_3375271 ) ) ( ON_BOARD ?auto_3375277 ?auto_3375274 ) ( POWER_ON ?auto_3375277 ) ( not ( = ?auto_3375276 ?auto_3375277 ) ) ( HAVE_IMAGE ?auto_3375271 ?auto_3375268 ) ( not ( = ?auto_3375270 ?auto_3375268 ) ) ( not ( = ?auto_3375268 ?auto_3375272 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3375269 ?auto_3375270 ?auto_3375273 ?auto_3375272 )
      ( GET-3IMAGE-VERIFY ?auto_3375269 ?auto_3375270 ?auto_3375271 ?auto_3375268 ?auto_3375273 ?auto_3375272 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3375290 - DIRECTION
      ?auto_3375291 - MODE
      ?auto_3375292 - DIRECTION
      ?auto_3375289 - MODE
      ?auto_3375294 - DIRECTION
      ?auto_3375293 - MODE
    )
    :vars
    (
      ?auto_3375297 - INSTRUMENT
      ?auto_3375295 - SATELLITE
      ?auto_3375296 - DIRECTION
      ?auto_3375298 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3375292 ?auto_3375290 ) ) ( not ( = ?auto_3375294 ?auto_3375290 ) ) ( not ( = ?auto_3375294 ?auto_3375292 ) ) ( ON_BOARD ?auto_3375297 ?auto_3375295 ) ( SUPPORTS ?auto_3375297 ?auto_3375289 ) ( not ( = ?auto_3375292 ?auto_3375296 ) ) ( HAVE_IMAGE ?auto_3375290 ?auto_3375291 ) ( not ( = ?auto_3375290 ?auto_3375296 ) ) ( not ( = ?auto_3375291 ?auto_3375289 ) ) ( CALIBRATION_TARGET ?auto_3375297 ?auto_3375296 ) ( POINTING ?auto_3375295 ?auto_3375294 ) ( not ( = ?auto_3375296 ?auto_3375294 ) ) ( ON_BOARD ?auto_3375298 ?auto_3375295 ) ( POWER_ON ?auto_3375298 ) ( not ( = ?auto_3375297 ?auto_3375298 ) ) ( HAVE_IMAGE ?auto_3375294 ?auto_3375293 ) ( not ( = ?auto_3375291 ?auto_3375293 ) ) ( not ( = ?auto_3375289 ?auto_3375293 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3375290 ?auto_3375291 ?auto_3375292 ?auto_3375289 )
      ( GET-3IMAGE-VERIFY ?auto_3375290 ?auto_3375291 ?auto_3375292 ?auto_3375289 ?auto_3375294 ?auto_3375293 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3375311 - DIRECTION
      ?auto_3375312 - MODE
      ?auto_3375313 - DIRECTION
      ?auto_3375310 - MODE
      ?auto_3375315 - DIRECTION
      ?auto_3375314 - MODE
    )
    :vars
    (
      ?auto_3375318 - INSTRUMENT
      ?auto_3375316 - SATELLITE
      ?auto_3375317 - DIRECTION
      ?auto_3375319 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3375313 ?auto_3375311 ) ) ( not ( = ?auto_3375315 ?auto_3375311 ) ) ( not ( = ?auto_3375315 ?auto_3375313 ) ) ( ON_BOARD ?auto_3375318 ?auto_3375316 ) ( SUPPORTS ?auto_3375318 ?auto_3375314 ) ( not ( = ?auto_3375315 ?auto_3375317 ) ) ( HAVE_IMAGE ?auto_3375313 ?auto_3375310 ) ( not ( = ?auto_3375313 ?auto_3375317 ) ) ( not ( = ?auto_3375310 ?auto_3375314 ) ) ( CALIBRATION_TARGET ?auto_3375318 ?auto_3375317 ) ( POINTING ?auto_3375316 ?auto_3375311 ) ( not ( = ?auto_3375317 ?auto_3375311 ) ) ( ON_BOARD ?auto_3375319 ?auto_3375316 ) ( POWER_ON ?auto_3375319 ) ( not ( = ?auto_3375318 ?auto_3375319 ) ) ( HAVE_IMAGE ?auto_3375311 ?auto_3375312 ) ( not ( = ?auto_3375312 ?auto_3375310 ) ) ( not ( = ?auto_3375312 ?auto_3375314 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3375313 ?auto_3375310 ?auto_3375315 ?auto_3375314 )
      ( GET-3IMAGE-VERIFY ?auto_3375311 ?auto_3375312 ?auto_3375313 ?auto_3375310 ?auto_3375315 ?auto_3375314 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3375333 - DIRECTION
      ?auto_3375334 - MODE
      ?auto_3375335 - DIRECTION
      ?auto_3375332 - MODE
      ?auto_3375337 - DIRECTION
      ?auto_3375336 - MODE
    )
    :vars
    (
      ?auto_3375340 - INSTRUMENT
      ?auto_3375338 - SATELLITE
      ?auto_3375339 - DIRECTION
      ?auto_3375341 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3375335 ?auto_3375333 ) ) ( not ( = ?auto_3375337 ?auto_3375333 ) ) ( not ( = ?auto_3375337 ?auto_3375335 ) ) ( ON_BOARD ?auto_3375340 ?auto_3375338 ) ( SUPPORTS ?auto_3375340 ?auto_3375332 ) ( not ( = ?auto_3375335 ?auto_3375339 ) ) ( HAVE_IMAGE ?auto_3375337 ?auto_3375336 ) ( not ( = ?auto_3375337 ?auto_3375339 ) ) ( not ( = ?auto_3375336 ?auto_3375332 ) ) ( CALIBRATION_TARGET ?auto_3375340 ?auto_3375339 ) ( POINTING ?auto_3375338 ?auto_3375333 ) ( not ( = ?auto_3375339 ?auto_3375333 ) ) ( ON_BOARD ?auto_3375341 ?auto_3375338 ) ( POWER_ON ?auto_3375341 ) ( not ( = ?auto_3375340 ?auto_3375341 ) ) ( HAVE_IMAGE ?auto_3375333 ?auto_3375334 ) ( not ( = ?auto_3375334 ?auto_3375332 ) ) ( not ( = ?auto_3375334 ?auto_3375336 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3375337 ?auto_3375336 ?auto_3375335 ?auto_3375332 )
      ( GET-3IMAGE-VERIFY ?auto_3375333 ?auto_3375334 ?auto_3375335 ?auto_3375332 ?auto_3375337 ?auto_3375336 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3375378 - DIRECTION
      ?auto_3375379 - MODE
      ?auto_3375380 - DIRECTION
      ?auto_3375377 - MODE
      ?auto_3375382 - DIRECTION
      ?auto_3375381 - MODE
    )
    :vars
    (
      ?auto_3375385 - INSTRUMENT
      ?auto_3375383 - SATELLITE
      ?auto_3375384 - DIRECTION
      ?auto_3375386 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3375380 ?auto_3375378 ) ) ( not ( = ?auto_3375382 ?auto_3375378 ) ) ( not ( = ?auto_3375382 ?auto_3375380 ) ) ( ON_BOARD ?auto_3375385 ?auto_3375383 ) ( SUPPORTS ?auto_3375385 ?auto_3375379 ) ( not ( = ?auto_3375378 ?auto_3375384 ) ) ( HAVE_IMAGE ?auto_3375380 ?auto_3375377 ) ( not ( = ?auto_3375380 ?auto_3375384 ) ) ( not ( = ?auto_3375377 ?auto_3375379 ) ) ( CALIBRATION_TARGET ?auto_3375385 ?auto_3375384 ) ( POINTING ?auto_3375383 ?auto_3375382 ) ( not ( = ?auto_3375384 ?auto_3375382 ) ) ( ON_BOARD ?auto_3375386 ?auto_3375383 ) ( POWER_ON ?auto_3375386 ) ( not ( = ?auto_3375385 ?auto_3375386 ) ) ( HAVE_IMAGE ?auto_3375382 ?auto_3375381 ) ( not ( = ?auto_3375379 ?auto_3375381 ) ) ( not ( = ?auto_3375377 ?auto_3375381 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3375380 ?auto_3375377 ?auto_3375378 ?auto_3375379 )
      ( GET-3IMAGE-VERIFY ?auto_3375378 ?auto_3375379 ?auto_3375380 ?auto_3375377 ?auto_3375382 ?auto_3375381 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3375399 - DIRECTION
      ?auto_3375400 - MODE
      ?auto_3375401 - DIRECTION
      ?auto_3375398 - MODE
      ?auto_3375403 - DIRECTION
      ?auto_3375402 - MODE
    )
    :vars
    (
      ?auto_3375406 - INSTRUMENT
      ?auto_3375404 - SATELLITE
      ?auto_3375405 - DIRECTION
      ?auto_3375407 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3375401 ?auto_3375399 ) ) ( not ( = ?auto_3375403 ?auto_3375399 ) ) ( not ( = ?auto_3375403 ?auto_3375401 ) ) ( ON_BOARD ?auto_3375406 ?auto_3375404 ) ( SUPPORTS ?auto_3375406 ?auto_3375400 ) ( not ( = ?auto_3375399 ?auto_3375405 ) ) ( HAVE_IMAGE ?auto_3375403 ?auto_3375402 ) ( not ( = ?auto_3375403 ?auto_3375405 ) ) ( not ( = ?auto_3375402 ?auto_3375400 ) ) ( CALIBRATION_TARGET ?auto_3375406 ?auto_3375405 ) ( POINTING ?auto_3375404 ?auto_3375401 ) ( not ( = ?auto_3375405 ?auto_3375401 ) ) ( ON_BOARD ?auto_3375407 ?auto_3375404 ) ( POWER_ON ?auto_3375407 ) ( not ( = ?auto_3375406 ?auto_3375407 ) ) ( HAVE_IMAGE ?auto_3375401 ?auto_3375398 ) ( not ( = ?auto_3375400 ?auto_3375398 ) ) ( not ( = ?auto_3375398 ?auto_3375402 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3375403 ?auto_3375402 ?auto_3375399 ?auto_3375400 )
      ( GET-3IMAGE-VERIFY ?auto_3375399 ?auto_3375400 ?auto_3375401 ?auto_3375398 ?auto_3375403 ?auto_3375402 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3383464 - DIRECTION
      ?auto_3383465 - MODE
    )
    :vars
    (
      ?auto_3383466 - DIRECTION
      ?auto_3383472 - INSTRUMENT
      ?auto_3383469 - SATELLITE
      ?auto_3383468 - DIRECTION
      ?auto_3383470 - MODE
      ?auto_3383471 - DIRECTION
      ?auto_3383467 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3383464 ?auto_3383466 ) ) ( ON_BOARD ?auto_3383472 ?auto_3383469 ) ( SUPPORTS ?auto_3383472 ?auto_3383465 ) ( not ( = ?auto_3383464 ?auto_3383468 ) ) ( HAVE_IMAGE ?auto_3383466 ?auto_3383470 ) ( not ( = ?auto_3383466 ?auto_3383468 ) ) ( not ( = ?auto_3383470 ?auto_3383465 ) ) ( CALIBRATION_TARGET ?auto_3383472 ?auto_3383468 ) ( not ( = ?auto_3383468 ?auto_3383471 ) ) ( not ( = ?auto_3383464 ?auto_3383471 ) ) ( not ( = ?auto_3383466 ?auto_3383471 ) ) ( ON_BOARD ?auto_3383467 ?auto_3383469 ) ( POWER_ON ?auto_3383467 ) ( not ( = ?auto_3383472 ?auto_3383467 ) ) ( POINTING ?auto_3383469 ?auto_3383468 ) )
    :subtasks
    ( ( !TURN_TO ?auto_3383469 ?auto_3383471 ?auto_3383468 )
      ( GET-2IMAGE ?auto_3383466 ?auto_3383470 ?auto_3383464 ?auto_3383465 )
      ( GET-1IMAGE-VERIFY ?auto_3383464 ?auto_3383465 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3383474 - DIRECTION
      ?auto_3383475 - MODE
      ?auto_3383476 - DIRECTION
      ?auto_3383473 - MODE
    )
    :vars
    (
      ?auto_3383480 - INSTRUMENT
      ?auto_3383477 - SATELLITE
      ?auto_3383481 - DIRECTION
      ?auto_3383479 - DIRECTION
      ?auto_3383478 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3383476 ?auto_3383474 ) ) ( ON_BOARD ?auto_3383480 ?auto_3383477 ) ( SUPPORTS ?auto_3383480 ?auto_3383473 ) ( not ( = ?auto_3383476 ?auto_3383481 ) ) ( HAVE_IMAGE ?auto_3383474 ?auto_3383475 ) ( not ( = ?auto_3383474 ?auto_3383481 ) ) ( not ( = ?auto_3383475 ?auto_3383473 ) ) ( CALIBRATION_TARGET ?auto_3383480 ?auto_3383481 ) ( not ( = ?auto_3383481 ?auto_3383479 ) ) ( not ( = ?auto_3383476 ?auto_3383479 ) ) ( not ( = ?auto_3383474 ?auto_3383479 ) ) ( ON_BOARD ?auto_3383478 ?auto_3383477 ) ( POWER_ON ?auto_3383478 ) ( not ( = ?auto_3383480 ?auto_3383478 ) ) ( POINTING ?auto_3383477 ?auto_3383481 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3383476 ?auto_3383473 )
      ( GET-2IMAGE-VERIFY ?auto_3383474 ?auto_3383475 ?auto_3383476 ?auto_3383473 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3383493 - DIRECTION
      ?auto_3383494 - MODE
      ?auto_3383495 - DIRECTION
      ?auto_3383492 - MODE
    )
    :vars
    (
      ?auto_3383496 - INSTRUMENT
      ?auto_3383497 - SATELLITE
      ?auto_3383498 - DIRECTION
      ?auto_3383500 - DIRECTION
      ?auto_3383499 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3383495 ?auto_3383493 ) ) ( ON_BOARD ?auto_3383496 ?auto_3383497 ) ( SUPPORTS ?auto_3383496 ?auto_3383494 ) ( not ( = ?auto_3383493 ?auto_3383498 ) ) ( HAVE_IMAGE ?auto_3383495 ?auto_3383492 ) ( not ( = ?auto_3383495 ?auto_3383498 ) ) ( not ( = ?auto_3383492 ?auto_3383494 ) ) ( CALIBRATION_TARGET ?auto_3383496 ?auto_3383498 ) ( not ( = ?auto_3383498 ?auto_3383500 ) ) ( not ( = ?auto_3383493 ?auto_3383500 ) ) ( not ( = ?auto_3383495 ?auto_3383500 ) ) ( ON_BOARD ?auto_3383499 ?auto_3383497 ) ( POWER_ON ?auto_3383499 ) ( not ( = ?auto_3383496 ?auto_3383499 ) ) ( POINTING ?auto_3383497 ?auto_3383498 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3383495 ?auto_3383492 ?auto_3383493 ?auto_3383494 )
      ( GET-2IMAGE-VERIFY ?auto_3383493 ?auto_3383494 ?auto_3383495 ?auto_3383492 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3433071 - DIRECTION
      ?auto_3433072 - MODE
      ?auto_3433073 - DIRECTION
      ?auto_3433070 - MODE
      ?auto_3433075 - DIRECTION
      ?auto_3433074 - MODE
      ?auto_3433076 - DIRECTION
      ?auto_3433077 - MODE
    )
    :vars
    (
      ?auto_3433079 - INSTRUMENT
      ?auto_3433078 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_3433073 ?auto_3433071 ) ) ( not ( = ?auto_3433075 ?auto_3433071 ) ) ( not ( = ?auto_3433075 ?auto_3433073 ) ) ( not ( = ?auto_3433076 ?auto_3433071 ) ) ( not ( = ?auto_3433076 ?auto_3433073 ) ) ( not ( = ?auto_3433076 ?auto_3433075 ) ) ( CALIBRATED ?auto_3433079 ) ( ON_BOARD ?auto_3433079 ?auto_3433078 ) ( SUPPORTS ?auto_3433079 ?auto_3433077 ) ( POWER_ON ?auto_3433079 ) ( POINTING ?auto_3433078 ?auto_3433076 ) ( HAVE_IMAGE ?auto_3433071 ?auto_3433072 ) ( HAVE_IMAGE ?auto_3433073 ?auto_3433070 ) ( HAVE_IMAGE ?auto_3433075 ?auto_3433074 ) ( not ( = ?auto_3433072 ?auto_3433070 ) ) ( not ( = ?auto_3433072 ?auto_3433074 ) ) ( not ( = ?auto_3433072 ?auto_3433077 ) ) ( not ( = ?auto_3433070 ?auto_3433074 ) ) ( not ( = ?auto_3433070 ?auto_3433077 ) ) ( not ( = ?auto_3433074 ?auto_3433077 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3433076 ?auto_3433077 )
      ( GET-4IMAGE-VERIFY ?auto_3433071 ?auto_3433072 ?auto_3433073 ?auto_3433070 ?auto_3433075 ?auto_3433074 ?auto_3433076 ?auto_3433077 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3433101 - DIRECTION
      ?auto_3433102 - MODE
      ?auto_3433103 - DIRECTION
      ?auto_3433100 - MODE
      ?auto_3433105 - DIRECTION
      ?auto_3433104 - MODE
      ?auto_3433106 - DIRECTION
      ?auto_3433107 - MODE
    )
    :vars
    (
      ?auto_3433109 - INSTRUMENT
      ?auto_3433108 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_3433103 ?auto_3433101 ) ) ( not ( = ?auto_3433105 ?auto_3433101 ) ) ( not ( = ?auto_3433105 ?auto_3433103 ) ) ( not ( = ?auto_3433106 ?auto_3433101 ) ) ( not ( = ?auto_3433106 ?auto_3433103 ) ) ( not ( = ?auto_3433106 ?auto_3433105 ) ) ( CALIBRATED ?auto_3433109 ) ( ON_BOARD ?auto_3433109 ?auto_3433108 ) ( SUPPORTS ?auto_3433109 ?auto_3433104 ) ( POWER_ON ?auto_3433109 ) ( POINTING ?auto_3433108 ?auto_3433105 ) ( HAVE_IMAGE ?auto_3433101 ?auto_3433102 ) ( HAVE_IMAGE ?auto_3433103 ?auto_3433100 ) ( HAVE_IMAGE ?auto_3433106 ?auto_3433107 ) ( not ( = ?auto_3433102 ?auto_3433100 ) ) ( not ( = ?auto_3433102 ?auto_3433104 ) ) ( not ( = ?auto_3433102 ?auto_3433107 ) ) ( not ( = ?auto_3433100 ?auto_3433104 ) ) ( not ( = ?auto_3433100 ?auto_3433107 ) ) ( not ( = ?auto_3433104 ?auto_3433107 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3433105 ?auto_3433104 )
      ( GET-4IMAGE-VERIFY ?auto_3433101 ?auto_3433102 ?auto_3433103 ?auto_3433100 ?auto_3433105 ?auto_3433104 ?auto_3433106 ?auto_3433107 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3433247 - DIRECTION
      ?auto_3433248 - MODE
      ?auto_3433249 - DIRECTION
      ?auto_3433246 - MODE
      ?auto_3433251 - DIRECTION
      ?auto_3433250 - MODE
      ?auto_3433252 - DIRECTION
      ?auto_3433253 - MODE
    )
    :vars
    (
      ?auto_3433255 - INSTRUMENT
      ?auto_3433254 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_3433249 ?auto_3433247 ) ) ( not ( = ?auto_3433251 ?auto_3433247 ) ) ( not ( = ?auto_3433251 ?auto_3433249 ) ) ( not ( = ?auto_3433252 ?auto_3433247 ) ) ( not ( = ?auto_3433252 ?auto_3433249 ) ) ( not ( = ?auto_3433252 ?auto_3433251 ) ) ( CALIBRATED ?auto_3433255 ) ( ON_BOARD ?auto_3433255 ?auto_3433254 ) ( SUPPORTS ?auto_3433255 ?auto_3433246 ) ( POWER_ON ?auto_3433255 ) ( POINTING ?auto_3433254 ?auto_3433249 ) ( HAVE_IMAGE ?auto_3433247 ?auto_3433248 ) ( HAVE_IMAGE ?auto_3433251 ?auto_3433250 ) ( HAVE_IMAGE ?auto_3433252 ?auto_3433253 ) ( not ( = ?auto_3433248 ?auto_3433246 ) ) ( not ( = ?auto_3433248 ?auto_3433250 ) ) ( not ( = ?auto_3433248 ?auto_3433253 ) ) ( not ( = ?auto_3433246 ?auto_3433250 ) ) ( not ( = ?auto_3433246 ?auto_3433253 ) ) ( not ( = ?auto_3433250 ?auto_3433253 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3433249 ?auto_3433246 )
      ( GET-4IMAGE-VERIFY ?auto_3433247 ?auto_3433248 ?auto_3433249 ?auto_3433246 ?auto_3433251 ?auto_3433250 ?auto_3433252 ?auto_3433253 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3434121 - DIRECTION
      ?auto_3434122 - MODE
      ?auto_3434123 - DIRECTION
      ?auto_3434120 - MODE
      ?auto_3434125 - DIRECTION
      ?auto_3434124 - MODE
      ?auto_3434126 - DIRECTION
      ?auto_3434127 - MODE
    )
    :vars
    (
      ?auto_3434129 - INSTRUMENT
      ?auto_3434128 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_3434123 ?auto_3434121 ) ) ( not ( = ?auto_3434125 ?auto_3434121 ) ) ( not ( = ?auto_3434125 ?auto_3434123 ) ) ( not ( = ?auto_3434126 ?auto_3434121 ) ) ( not ( = ?auto_3434126 ?auto_3434123 ) ) ( not ( = ?auto_3434126 ?auto_3434125 ) ) ( CALIBRATED ?auto_3434129 ) ( ON_BOARD ?auto_3434129 ?auto_3434128 ) ( SUPPORTS ?auto_3434129 ?auto_3434122 ) ( POWER_ON ?auto_3434129 ) ( POINTING ?auto_3434128 ?auto_3434121 ) ( HAVE_IMAGE ?auto_3434123 ?auto_3434120 ) ( HAVE_IMAGE ?auto_3434125 ?auto_3434124 ) ( HAVE_IMAGE ?auto_3434126 ?auto_3434127 ) ( not ( = ?auto_3434122 ?auto_3434120 ) ) ( not ( = ?auto_3434122 ?auto_3434124 ) ) ( not ( = ?auto_3434122 ?auto_3434127 ) ) ( not ( = ?auto_3434120 ?auto_3434124 ) ) ( not ( = ?auto_3434120 ?auto_3434127 ) ) ( not ( = ?auto_3434124 ?auto_3434127 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3434121 ?auto_3434122 )
      ( GET-4IMAGE-VERIFY ?auto_3434121 ?auto_3434122 ?auto_3434123 ?auto_3434120 ?auto_3434125 ?auto_3434124 ?auto_3434126 ?auto_3434127 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3444520 - DIRECTION
      ?auto_3444521 - MODE
      ?auto_3444522 - DIRECTION
      ?auto_3444519 - MODE
      ?auto_3444524 - DIRECTION
      ?auto_3444523 - MODE
      ?auto_3444525 - DIRECTION
      ?auto_3444526 - MODE
    )
    :vars
    (
      ?auto_3444527 - INSTRUMENT
      ?auto_3444528 - SATELLITE
      ?auto_3444529 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3444522 ?auto_3444520 ) ) ( not ( = ?auto_3444524 ?auto_3444520 ) ) ( not ( = ?auto_3444524 ?auto_3444522 ) ) ( not ( = ?auto_3444525 ?auto_3444520 ) ) ( not ( = ?auto_3444525 ?auto_3444522 ) ) ( not ( = ?auto_3444525 ?auto_3444524 ) ) ( CALIBRATED ?auto_3444527 ) ( ON_BOARD ?auto_3444527 ?auto_3444528 ) ( SUPPORTS ?auto_3444527 ?auto_3444526 ) ( POWER_ON ?auto_3444527 ) ( POINTING ?auto_3444528 ?auto_3444529 ) ( not ( = ?auto_3444525 ?auto_3444529 ) ) ( HAVE_IMAGE ?auto_3444520 ?auto_3444521 ) ( not ( = ?auto_3444520 ?auto_3444529 ) ) ( not ( = ?auto_3444521 ?auto_3444526 ) ) ( HAVE_IMAGE ?auto_3444522 ?auto_3444519 ) ( HAVE_IMAGE ?auto_3444524 ?auto_3444523 ) ( not ( = ?auto_3444521 ?auto_3444519 ) ) ( not ( = ?auto_3444521 ?auto_3444523 ) ) ( not ( = ?auto_3444522 ?auto_3444529 ) ) ( not ( = ?auto_3444519 ?auto_3444523 ) ) ( not ( = ?auto_3444519 ?auto_3444526 ) ) ( not ( = ?auto_3444524 ?auto_3444529 ) ) ( not ( = ?auto_3444523 ?auto_3444526 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3444520 ?auto_3444521 ?auto_3444525 ?auto_3444526 )
      ( GET-4IMAGE-VERIFY ?auto_3444520 ?auto_3444521 ?auto_3444522 ?auto_3444519 ?auto_3444524 ?auto_3444523 ?auto_3444525 ?auto_3444526 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3444553 - DIRECTION
      ?auto_3444554 - MODE
      ?auto_3444555 - DIRECTION
      ?auto_3444552 - MODE
      ?auto_3444557 - DIRECTION
      ?auto_3444556 - MODE
      ?auto_3444558 - DIRECTION
      ?auto_3444559 - MODE
    )
    :vars
    (
      ?auto_3444560 - INSTRUMENT
      ?auto_3444561 - SATELLITE
      ?auto_3444562 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3444555 ?auto_3444553 ) ) ( not ( = ?auto_3444557 ?auto_3444553 ) ) ( not ( = ?auto_3444557 ?auto_3444555 ) ) ( not ( = ?auto_3444558 ?auto_3444553 ) ) ( not ( = ?auto_3444558 ?auto_3444555 ) ) ( not ( = ?auto_3444558 ?auto_3444557 ) ) ( CALIBRATED ?auto_3444560 ) ( ON_BOARD ?auto_3444560 ?auto_3444561 ) ( SUPPORTS ?auto_3444560 ?auto_3444556 ) ( POWER_ON ?auto_3444560 ) ( POINTING ?auto_3444561 ?auto_3444562 ) ( not ( = ?auto_3444557 ?auto_3444562 ) ) ( HAVE_IMAGE ?auto_3444553 ?auto_3444554 ) ( not ( = ?auto_3444553 ?auto_3444562 ) ) ( not ( = ?auto_3444554 ?auto_3444556 ) ) ( HAVE_IMAGE ?auto_3444555 ?auto_3444552 ) ( HAVE_IMAGE ?auto_3444558 ?auto_3444559 ) ( not ( = ?auto_3444554 ?auto_3444552 ) ) ( not ( = ?auto_3444554 ?auto_3444559 ) ) ( not ( = ?auto_3444555 ?auto_3444562 ) ) ( not ( = ?auto_3444552 ?auto_3444556 ) ) ( not ( = ?auto_3444552 ?auto_3444559 ) ) ( not ( = ?auto_3444556 ?auto_3444559 ) ) ( not ( = ?auto_3444558 ?auto_3444562 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3444553 ?auto_3444554 ?auto_3444557 ?auto_3444556 )
      ( GET-4IMAGE-VERIFY ?auto_3444553 ?auto_3444554 ?auto_3444555 ?auto_3444552 ?auto_3444557 ?auto_3444556 ?auto_3444558 ?auto_3444559 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3444712 - DIRECTION
      ?auto_3444713 - MODE
      ?auto_3444714 - DIRECTION
      ?auto_3444711 - MODE
      ?auto_3444716 - DIRECTION
      ?auto_3444715 - MODE
      ?auto_3444717 - DIRECTION
      ?auto_3444718 - MODE
    )
    :vars
    (
      ?auto_3444719 - INSTRUMENT
      ?auto_3444720 - SATELLITE
      ?auto_3444721 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3444714 ?auto_3444712 ) ) ( not ( = ?auto_3444716 ?auto_3444712 ) ) ( not ( = ?auto_3444716 ?auto_3444714 ) ) ( not ( = ?auto_3444717 ?auto_3444712 ) ) ( not ( = ?auto_3444717 ?auto_3444714 ) ) ( not ( = ?auto_3444717 ?auto_3444716 ) ) ( CALIBRATED ?auto_3444719 ) ( ON_BOARD ?auto_3444719 ?auto_3444720 ) ( SUPPORTS ?auto_3444719 ?auto_3444711 ) ( POWER_ON ?auto_3444719 ) ( POINTING ?auto_3444720 ?auto_3444721 ) ( not ( = ?auto_3444714 ?auto_3444721 ) ) ( HAVE_IMAGE ?auto_3444712 ?auto_3444713 ) ( not ( = ?auto_3444712 ?auto_3444721 ) ) ( not ( = ?auto_3444713 ?auto_3444711 ) ) ( HAVE_IMAGE ?auto_3444716 ?auto_3444715 ) ( HAVE_IMAGE ?auto_3444717 ?auto_3444718 ) ( not ( = ?auto_3444713 ?auto_3444715 ) ) ( not ( = ?auto_3444713 ?auto_3444718 ) ) ( not ( = ?auto_3444711 ?auto_3444715 ) ) ( not ( = ?auto_3444711 ?auto_3444718 ) ) ( not ( = ?auto_3444716 ?auto_3444721 ) ) ( not ( = ?auto_3444715 ?auto_3444718 ) ) ( not ( = ?auto_3444717 ?auto_3444721 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3444712 ?auto_3444713 ?auto_3444714 ?auto_3444711 )
      ( GET-4IMAGE-VERIFY ?auto_3444712 ?auto_3444713 ?auto_3444714 ?auto_3444711 ?auto_3444716 ?auto_3444715 ?auto_3444717 ?auto_3444718 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3445739 - DIRECTION
      ?auto_3445740 - MODE
      ?auto_3445741 - DIRECTION
      ?auto_3445738 - MODE
      ?auto_3445743 - DIRECTION
      ?auto_3445742 - MODE
      ?auto_3445744 - DIRECTION
      ?auto_3445745 - MODE
    )
    :vars
    (
      ?auto_3445746 - INSTRUMENT
      ?auto_3445747 - SATELLITE
      ?auto_3445748 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3445741 ?auto_3445739 ) ) ( not ( = ?auto_3445743 ?auto_3445739 ) ) ( not ( = ?auto_3445743 ?auto_3445741 ) ) ( not ( = ?auto_3445744 ?auto_3445739 ) ) ( not ( = ?auto_3445744 ?auto_3445741 ) ) ( not ( = ?auto_3445744 ?auto_3445743 ) ) ( CALIBRATED ?auto_3445746 ) ( ON_BOARD ?auto_3445746 ?auto_3445747 ) ( SUPPORTS ?auto_3445746 ?auto_3445740 ) ( POWER_ON ?auto_3445746 ) ( POINTING ?auto_3445747 ?auto_3445748 ) ( not ( = ?auto_3445739 ?auto_3445748 ) ) ( HAVE_IMAGE ?auto_3445741 ?auto_3445738 ) ( not ( = ?auto_3445741 ?auto_3445748 ) ) ( not ( = ?auto_3445738 ?auto_3445740 ) ) ( HAVE_IMAGE ?auto_3445743 ?auto_3445742 ) ( HAVE_IMAGE ?auto_3445744 ?auto_3445745 ) ( not ( = ?auto_3445740 ?auto_3445742 ) ) ( not ( = ?auto_3445740 ?auto_3445745 ) ) ( not ( = ?auto_3445738 ?auto_3445742 ) ) ( not ( = ?auto_3445738 ?auto_3445745 ) ) ( not ( = ?auto_3445743 ?auto_3445748 ) ) ( not ( = ?auto_3445742 ?auto_3445745 ) ) ( not ( = ?auto_3445744 ?auto_3445748 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3445741 ?auto_3445738 ?auto_3445739 ?auto_3445740 )
      ( GET-4IMAGE-VERIFY ?auto_3445739 ?auto_3445740 ?auto_3445741 ?auto_3445738 ?auto_3445743 ?auto_3445742 ?auto_3445744 ?auto_3445745 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3457450 - DIRECTION
      ?auto_3457451 - MODE
      ?auto_3457452 - DIRECTION
      ?auto_3457449 - MODE
      ?auto_3457454 - DIRECTION
      ?auto_3457453 - MODE
      ?auto_3457455 - DIRECTION
      ?auto_3457456 - MODE
    )
    :vars
    (
      ?auto_3457457 - INSTRUMENT
      ?auto_3457458 - SATELLITE
      ?auto_3457459 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3457452 ?auto_3457450 ) ) ( not ( = ?auto_3457454 ?auto_3457450 ) ) ( not ( = ?auto_3457454 ?auto_3457452 ) ) ( not ( = ?auto_3457455 ?auto_3457450 ) ) ( not ( = ?auto_3457455 ?auto_3457452 ) ) ( not ( = ?auto_3457455 ?auto_3457454 ) ) ( ON_BOARD ?auto_3457457 ?auto_3457458 ) ( SUPPORTS ?auto_3457457 ?auto_3457456 ) ( POWER_ON ?auto_3457457 ) ( POINTING ?auto_3457458 ?auto_3457459 ) ( not ( = ?auto_3457455 ?auto_3457459 ) ) ( HAVE_IMAGE ?auto_3457450 ?auto_3457451 ) ( not ( = ?auto_3457450 ?auto_3457459 ) ) ( not ( = ?auto_3457451 ?auto_3457456 ) ) ( CALIBRATION_TARGET ?auto_3457457 ?auto_3457459 ) ( NOT_CALIBRATED ?auto_3457457 ) ( HAVE_IMAGE ?auto_3457452 ?auto_3457449 ) ( HAVE_IMAGE ?auto_3457454 ?auto_3457453 ) ( not ( = ?auto_3457451 ?auto_3457449 ) ) ( not ( = ?auto_3457451 ?auto_3457453 ) ) ( not ( = ?auto_3457452 ?auto_3457459 ) ) ( not ( = ?auto_3457449 ?auto_3457453 ) ) ( not ( = ?auto_3457449 ?auto_3457456 ) ) ( not ( = ?auto_3457454 ?auto_3457459 ) ) ( not ( = ?auto_3457453 ?auto_3457456 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3457450 ?auto_3457451 ?auto_3457455 ?auto_3457456 )
      ( GET-4IMAGE-VERIFY ?auto_3457450 ?auto_3457451 ?auto_3457452 ?auto_3457449 ?auto_3457454 ?auto_3457453 ?auto_3457455 ?auto_3457456 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3457483 - DIRECTION
      ?auto_3457484 - MODE
      ?auto_3457485 - DIRECTION
      ?auto_3457482 - MODE
      ?auto_3457487 - DIRECTION
      ?auto_3457486 - MODE
      ?auto_3457488 - DIRECTION
      ?auto_3457489 - MODE
    )
    :vars
    (
      ?auto_3457490 - INSTRUMENT
      ?auto_3457491 - SATELLITE
      ?auto_3457492 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3457485 ?auto_3457483 ) ) ( not ( = ?auto_3457487 ?auto_3457483 ) ) ( not ( = ?auto_3457487 ?auto_3457485 ) ) ( not ( = ?auto_3457488 ?auto_3457483 ) ) ( not ( = ?auto_3457488 ?auto_3457485 ) ) ( not ( = ?auto_3457488 ?auto_3457487 ) ) ( ON_BOARD ?auto_3457490 ?auto_3457491 ) ( SUPPORTS ?auto_3457490 ?auto_3457486 ) ( POWER_ON ?auto_3457490 ) ( POINTING ?auto_3457491 ?auto_3457492 ) ( not ( = ?auto_3457487 ?auto_3457492 ) ) ( HAVE_IMAGE ?auto_3457483 ?auto_3457484 ) ( not ( = ?auto_3457483 ?auto_3457492 ) ) ( not ( = ?auto_3457484 ?auto_3457486 ) ) ( CALIBRATION_TARGET ?auto_3457490 ?auto_3457492 ) ( NOT_CALIBRATED ?auto_3457490 ) ( HAVE_IMAGE ?auto_3457485 ?auto_3457482 ) ( HAVE_IMAGE ?auto_3457488 ?auto_3457489 ) ( not ( = ?auto_3457484 ?auto_3457482 ) ) ( not ( = ?auto_3457484 ?auto_3457489 ) ) ( not ( = ?auto_3457485 ?auto_3457492 ) ) ( not ( = ?auto_3457482 ?auto_3457486 ) ) ( not ( = ?auto_3457482 ?auto_3457489 ) ) ( not ( = ?auto_3457486 ?auto_3457489 ) ) ( not ( = ?auto_3457488 ?auto_3457492 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3457483 ?auto_3457484 ?auto_3457487 ?auto_3457486 )
      ( GET-4IMAGE-VERIFY ?auto_3457483 ?auto_3457484 ?auto_3457485 ?auto_3457482 ?auto_3457487 ?auto_3457486 ?auto_3457488 ?auto_3457489 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3457642 - DIRECTION
      ?auto_3457643 - MODE
      ?auto_3457644 - DIRECTION
      ?auto_3457641 - MODE
      ?auto_3457646 - DIRECTION
      ?auto_3457645 - MODE
      ?auto_3457647 - DIRECTION
      ?auto_3457648 - MODE
    )
    :vars
    (
      ?auto_3457649 - INSTRUMENT
      ?auto_3457650 - SATELLITE
      ?auto_3457651 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3457644 ?auto_3457642 ) ) ( not ( = ?auto_3457646 ?auto_3457642 ) ) ( not ( = ?auto_3457646 ?auto_3457644 ) ) ( not ( = ?auto_3457647 ?auto_3457642 ) ) ( not ( = ?auto_3457647 ?auto_3457644 ) ) ( not ( = ?auto_3457647 ?auto_3457646 ) ) ( ON_BOARD ?auto_3457649 ?auto_3457650 ) ( SUPPORTS ?auto_3457649 ?auto_3457641 ) ( POWER_ON ?auto_3457649 ) ( POINTING ?auto_3457650 ?auto_3457651 ) ( not ( = ?auto_3457644 ?auto_3457651 ) ) ( HAVE_IMAGE ?auto_3457642 ?auto_3457643 ) ( not ( = ?auto_3457642 ?auto_3457651 ) ) ( not ( = ?auto_3457643 ?auto_3457641 ) ) ( CALIBRATION_TARGET ?auto_3457649 ?auto_3457651 ) ( NOT_CALIBRATED ?auto_3457649 ) ( HAVE_IMAGE ?auto_3457646 ?auto_3457645 ) ( HAVE_IMAGE ?auto_3457647 ?auto_3457648 ) ( not ( = ?auto_3457643 ?auto_3457645 ) ) ( not ( = ?auto_3457643 ?auto_3457648 ) ) ( not ( = ?auto_3457641 ?auto_3457645 ) ) ( not ( = ?auto_3457641 ?auto_3457648 ) ) ( not ( = ?auto_3457646 ?auto_3457651 ) ) ( not ( = ?auto_3457645 ?auto_3457648 ) ) ( not ( = ?auto_3457647 ?auto_3457651 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3457642 ?auto_3457643 ?auto_3457644 ?auto_3457641 )
      ( GET-4IMAGE-VERIFY ?auto_3457642 ?auto_3457643 ?auto_3457644 ?auto_3457641 ?auto_3457646 ?auto_3457645 ?auto_3457647 ?auto_3457648 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3458669 - DIRECTION
      ?auto_3458670 - MODE
      ?auto_3458671 - DIRECTION
      ?auto_3458668 - MODE
      ?auto_3458673 - DIRECTION
      ?auto_3458672 - MODE
      ?auto_3458674 - DIRECTION
      ?auto_3458675 - MODE
    )
    :vars
    (
      ?auto_3458676 - INSTRUMENT
      ?auto_3458677 - SATELLITE
      ?auto_3458678 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3458671 ?auto_3458669 ) ) ( not ( = ?auto_3458673 ?auto_3458669 ) ) ( not ( = ?auto_3458673 ?auto_3458671 ) ) ( not ( = ?auto_3458674 ?auto_3458669 ) ) ( not ( = ?auto_3458674 ?auto_3458671 ) ) ( not ( = ?auto_3458674 ?auto_3458673 ) ) ( ON_BOARD ?auto_3458676 ?auto_3458677 ) ( SUPPORTS ?auto_3458676 ?auto_3458670 ) ( POWER_ON ?auto_3458676 ) ( POINTING ?auto_3458677 ?auto_3458678 ) ( not ( = ?auto_3458669 ?auto_3458678 ) ) ( HAVE_IMAGE ?auto_3458671 ?auto_3458668 ) ( not ( = ?auto_3458671 ?auto_3458678 ) ) ( not ( = ?auto_3458668 ?auto_3458670 ) ) ( CALIBRATION_TARGET ?auto_3458676 ?auto_3458678 ) ( NOT_CALIBRATED ?auto_3458676 ) ( HAVE_IMAGE ?auto_3458673 ?auto_3458672 ) ( HAVE_IMAGE ?auto_3458674 ?auto_3458675 ) ( not ( = ?auto_3458670 ?auto_3458672 ) ) ( not ( = ?auto_3458670 ?auto_3458675 ) ) ( not ( = ?auto_3458668 ?auto_3458672 ) ) ( not ( = ?auto_3458668 ?auto_3458675 ) ) ( not ( = ?auto_3458673 ?auto_3458678 ) ) ( not ( = ?auto_3458672 ?auto_3458675 ) ) ( not ( = ?auto_3458674 ?auto_3458678 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3458671 ?auto_3458668 ?auto_3458669 ?auto_3458670 )
      ( GET-4IMAGE-VERIFY ?auto_3458669 ?auto_3458670 ?auto_3458671 ?auto_3458668 ?auto_3458673 ?auto_3458672 ?auto_3458674 ?auto_3458675 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3470380 - DIRECTION
      ?auto_3470381 - MODE
      ?auto_3470382 - DIRECTION
      ?auto_3470379 - MODE
      ?auto_3470384 - DIRECTION
      ?auto_3470383 - MODE
      ?auto_3470385 - DIRECTION
      ?auto_3470386 - MODE
    )
    :vars
    (
      ?auto_3470388 - INSTRUMENT
      ?auto_3470389 - SATELLITE
      ?auto_3470387 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3470382 ?auto_3470380 ) ) ( not ( = ?auto_3470384 ?auto_3470380 ) ) ( not ( = ?auto_3470384 ?auto_3470382 ) ) ( not ( = ?auto_3470385 ?auto_3470380 ) ) ( not ( = ?auto_3470385 ?auto_3470382 ) ) ( not ( = ?auto_3470385 ?auto_3470384 ) ) ( ON_BOARD ?auto_3470388 ?auto_3470389 ) ( SUPPORTS ?auto_3470388 ?auto_3470386 ) ( POINTING ?auto_3470389 ?auto_3470387 ) ( not ( = ?auto_3470385 ?auto_3470387 ) ) ( HAVE_IMAGE ?auto_3470380 ?auto_3470381 ) ( not ( = ?auto_3470380 ?auto_3470387 ) ) ( not ( = ?auto_3470381 ?auto_3470386 ) ) ( CALIBRATION_TARGET ?auto_3470388 ?auto_3470387 ) ( POWER_AVAIL ?auto_3470389 ) ( HAVE_IMAGE ?auto_3470382 ?auto_3470379 ) ( HAVE_IMAGE ?auto_3470384 ?auto_3470383 ) ( not ( = ?auto_3470381 ?auto_3470379 ) ) ( not ( = ?auto_3470381 ?auto_3470383 ) ) ( not ( = ?auto_3470382 ?auto_3470387 ) ) ( not ( = ?auto_3470379 ?auto_3470383 ) ) ( not ( = ?auto_3470379 ?auto_3470386 ) ) ( not ( = ?auto_3470384 ?auto_3470387 ) ) ( not ( = ?auto_3470383 ?auto_3470386 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3470380 ?auto_3470381 ?auto_3470385 ?auto_3470386 )
      ( GET-4IMAGE-VERIFY ?auto_3470380 ?auto_3470381 ?auto_3470382 ?auto_3470379 ?auto_3470384 ?auto_3470383 ?auto_3470385 ?auto_3470386 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3470413 - DIRECTION
      ?auto_3470414 - MODE
      ?auto_3470415 - DIRECTION
      ?auto_3470412 - MODE
      ?auto_3470417 - DIRECTION
      ?auto_3470416 - MODE
      ?auto_3470418 - DIRECTION
      ?auto_3470419 - MODE
    )
    :vars
    (
      ?auto_3470421 - INSTRUMENT
      ?auto_3470422 - SATELLITE
      ?auto_3470420 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3470415 ?auto_3470413 ) ) ( not ( = ?auto_3470417 ?auto_3470413 ) ) ( not ( = ?auto_3470417 ?auto_3470415 ) ) ( not ( = ?auto_3470418 ?auto_3470413 ) ) ( not ( = ?auto_3470418 ?auto_3470415 ) ) ( not ( = ?auto_3470418 ?auto_3470417 ) ) ( ON_BOARD ?auto_3470421 ?auto_3470422 ) ( SUPPORTS ?auto_3470421 ?auto_3470416 ) ( POINTING ?auto_3470422 ?auto_3470420 ) ( not ( = ?auto_3470417 ?auto_3470420 ) ) ( HAVE_IMAGE ?auto_3470413 ?auto_3470414 ) ( not ( = ?auto_3470413 ?auto_3470420 ) ) ( not ( = ?auto_3470414 ?auto_3470416 ) ) ( CALIBRATION_TARGET ?auto_3470421 ?auto_3470420 ) ( POWER_AVAIL ?auto_3470422 ) ( HAVE_IMAGE ?auto_3470415 ?auto_3470412 ) ( HAVE_IMAGE ?auto_3470418 ?auto_3470419 ) ( not ( = ?auto_3470414 ?auto_3470412 ) ) ( not ( = ?auto_3470414 ?auto_3470419 ) ) ( not ( = ?auto_3470415 ?auto_3470420 ) ) ( not ( = ?auto_3470412 ?auto_3470416 ) ) ( not ( = ?auto_3470412 ?auto_3470419 ) ) ( not ( = ?auto_3470416 ?auto_3470419 ) ) ( not ( = ?auto_3470418 ?auto_3470420 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3470413 ?auto_3470414 ?auto_3470417 ?auto_3470416 )
      ( GET-4IMAGE-VERIFY ?auto_3470413 ?auto_3470414 ?auto_3470415 ?auto_3470412 ?auto_3470417 ?auto_3470416 ?auto_3470418 ?auto_3470419 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3470572 - DIRECTION
      ?auto_3470573 - MODE
      ?auto_3470574 - DIRECTION
      ?auto_3470571 - MODE
      ?auto_3470576 - DIRECTION
      ?auto_3470575 - MODE
      ?auto_3470577 - DIRECTION
      ?auto_3470578 - MODE
    )
    :vars
    (
      ?auto_3470580 - INSTRUMENT
      ?auto_3470581 - SATELLITE
      ?auto_3470579 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3470574 ?auto_3470572 ) ) ( not ( = ?auto_3470576 ?auto_3470572 ) ) ( not ( = ?auto_3470576 ?auto_3470574 ) ) ( not ( = ?auto_3470577 ?auto_3470572 ) ) ( not ( = ?auto_3470577 ?auto_3470574 ) ) ( not ( = ?auto_3470577 ?auto_3470576 ) ) ( ON_BOARD ?auto_3470580 ?auto_3470581 ) ( SUPPORTS ?auto_3470580 ?auto_3470571 ) ( POINTING ?auto_3470581 ?auto_3470579 ) ( not ( = ?auto_3470574 ?auto_3470579 ) ) ( HAVE_IMAGE ?auto_3470572 ?auto_3470573 ) ( not ( = ?auto_3470572 ?auto_3470579 ) ) ( not ( = ?auto_3470573 ?auto_3470571 ) ) ( CALIBRATION_TARGET ?auto_3470580 ?auto_3470579 ) ( POWER_AVAIL ?auto_3470581 ) ( HAVE_IMAGE ?auto_3470576 ?auto_3470575 ) ( HAVE_IMAGE ?auto_3470577 ?auto_3470578 ) ( not ( = ?auto_3470573 ?auto_3470575 ) ) ( not ( = ?auto_3470573 ?auto_3470578 ) ) ( not ( = ?auto_3470571 ?auto_3470575 ) ) ( not ( = ?auto_3470571 ?auto_3470578 ) ) ( not ( = ?auto_3470576 ?auto_3470579 ) ) ( not ( = ?auto_3470575 ?auto_3470578 ) ) ( not ( = ?auto_3470577 ?auto_3470579 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3470572 ?auto_3470573 ?auto_3470574 ?auto_3470571 )
      ( GET-4IMAGE-VERIFY ?auto_3470572 ?auto_3470573 ?auto_3470574 ?auto_3470571 ?auto_3470576 ?auto_3470575 ?auto_3470577 ?auto_3470578 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3471599 - DIRECTION
      ?auto_3471600 - MODE
      ?auto_3471601 - DIRECTION
      ?auto_3471598 - MODE
      ?auto_3471603 - DIRECTION
      ?auto_3471602 - MODE
      ?auto_3471604 - DIRECTION
      ?auto_3471605 - MODE
    )
    :vars
    (
      ?auto_3471607 - INSTRUMENT
      ?auto_3471608 - SATELLITE
      ?auto_3471606 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3471601 ?auto_3471599 ) ) ( not ( = ?auto_3471603 ?auto_3471599 ) ) ( not ( = ?auto_3471603 ?auto_3471601 ) ) ( not ( = ?auto_3471604 ?auto_3471599 ) ) ( not ( = ?auto_3471604 ?auto_3471601 ) ) ( not ( = ?auto_3471604 ?auto_3471603 ) ) ( ON_BOARD ?auto_3471607 ?auto_3471608 ) ( SUPPORTS ?auto_3471607 ?auto_3471600 ) ( POINTING ?auto_3471608 ?auto_3471606 ) ( not ( = ?auto_3471599 ?auto_3471606 ) ) ( HAVE_IMAGE ?auto_3471601 ?auto_3471598 ) ( not ( = ?auto_3471601 ?auto_3471606 ) ) ( not ( = ?auto_3471598 ?auto_3471600 ) ) ( CALIBRATION_TARGET ?auto_3471607 ?auto_3471606 ) ( POWER_AVAIL ?auto_3471608 ) ( HAVE_IMAGE ?auto_3471603 ?auto_3471602 ) ( HAVE_IMAGE ?auto_3471604 ?auto_3471605 ) ( not ( = ?auto_3471600 ?auto_3471602 ) ) ( not ( = ?auto_3471600 ?auto_3471605 ) ) ( not ( = ?auto_3471598 ?auto_3471602 ) ) ( not ( = ?auto_3471598 ?auto_3471605 ) ) ( not ( = ?auto_3471603 ?auto_3471606 ) ) ( not ( = ?auto_3471602 ?auto_3471605 ) ) ( not ( = ?auto_3471604 ?auto_3471606 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3471601 ?auto_3471598 ?auto_3471599 ?auto_3471600 )
      ( GET-4IMAGE-VERIFY ?auto_3471599 ?auto_3471600 ?auto_3471601 ?auto_3471598 ?auto_3471603 ?auto_3471602 ?auto_3471604 ?auto_3471605 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3482921 - DIRECTION
      ?auto_3482922 - MODE
      ?auto_3482923 - DIRECTION
      ?auto_3482920 - MODE
      ?auto_3482925 - DIRECTION
      ?auto_3482924 - MODE
    )
    :vars
    (
      ?auto_3482927 - INSTRUMENT
      ?auto_3482926 - SATELLITE
      ?auto_3482929 - DIRECTION
      ?auto_3482928 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3482923 ?auto_3482921 ) ) ( not ( = ?auto_3482925 ?auto_3482921 ) ) ( not ( = ?auto_3482925 ?auto_3482923 ) ) ( ON_BOARD ?auto_3482927 ?auto_3482926 ) ( SUPPORTS ?auto_3482927 ?auto_3482924 ) ( not ( = ?auto_3482925 ?auto_3482929 ) ) ( HAVE_IMAGE ?auto_3482921 ?auto_3482922 ) ( not ( = ?auto_3482921 ?auto_3482929 ) ) ( not ( = ?auto_3482922 ?auto_3482924 ) ) ( CALIBRATION_TARGET ?auto_3482927 ?auto_3482929 ) ( POWER_AVAIL ?auto_3482926 ) ( POINTING ?auto_3482926 ?auto_3482928 ) ( not ( = ?auto_3482929 ?auto_3482928 ) ) ( not ( = ?auto_3482925 ?auto_3482928 ) ) ( not ( = ?auto_3482921 ?auto_3482928 ) ) ( HAVE_IMAGE ?auto_3482923 ?auto_3482920 ) ( not ( = ?auto_3482922 ?auto_3482920 ) ) ( not ( = ?auto_3482923 ?auto_3482929 ) ) ( not ( = ?auto_3482923 ?auto_3482928 ) ) ( not ( = ?auto_3482920 ?auto_3482924 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3482921 ?auto_3482922 ?auto_3482925 ?auto_3482924 )
      ( GET-3IMAGE-VERIFY ?auto_3482921 ?auto_3482922 ?auto_3482923 ?auto_3482920 ?auto_3482925 ?auto_3482924 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3482950 - DIRECTION
      ?auto_3482951 - MODE
      ?auto_3482952 - DIRECTION
      ?auto_3482949 - MODE
      ?auto_3482954 - DIRECTION
      ?auto_3482953 - MODE
    )
    :vars
    (
      ?auto_3482956 - INSTRUMENT
      ?auto_3482955 - SATELLITE
      ?auto_3482958 - DIRECTION
      ?auto_3482957 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3482952 ?auto_3482950 ) ) ( not ( = ?auto_3482954 ?auto_3482950 ) ) ( not ( = ?auto_3482954 ?auto_3482952 ) ) ( ON_BOARD ?auto_3482956 ?auto_3482955 ) ( SUPPORTS ?auto_3482956 ?auto_3482949 ) ( not ( = ?auto_3482952 ?auto_3482958 ) ) ( HAVE_IMAGE ?auto_3482950 ?auto_3482951 ) ( not ( = ?auto_3482950 ?auto_3482958 ) ) ( not ( = ?auto_3482951 ?auto_3482949 ) ) ( CALIBRATION_TARGET ?auto_3482956 ?auto_3482958 ) ( POWER_AVAIL ?auto_3482955 ) ( POINTING ?auto_3482955 ?auto_3482957 ) ( not ( = ?auto_3482958 ?auto_3482957 ) ) ( not ( = ?auto_3482952 ?auto_3482957 ) ) ( not ( = ?auto_3482950 ?auto_3482957 ) ) ( HAVE_IMAGE ?auto_3482954 ?auto_3482953 ) ( not ( = ?auto_3482951 ?auto_3482953 ) ) ( not ( = ?auto_3482949 ?auto_3482953 ) ) ( not ( = ?auto_3482954 ?auto_3482958 ) ) ( not ( = ?auto_3482954 ?auto_3482957 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3482950 ?auto_3482951 ?auto_3482952 ?auto_3482949 )
      ( GET-3IMAGE-VERIFY ?auto_3482950 ?auto_3482951 ?auto_3482952 ?auto_3482949 ?auto_3482954 ?auto_3482953 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3483112 - DIRECTION
      ?auto_3483113 - MODE
      ?auto_3483114 - DIRECTION
      ?auto_3483111 - MODE
      ?auto_3483116 - DIRECTION
      ?auto_3483115 - MODE
    )
    :vars
    (
      ?auto_3483118 - INSTRUMENT
      ?auto_3483117 - SATELLITE
      ?auto_3483120 - DIRECTION
      ?auto_3483119 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3483114 ?auto_3483112 ) ) ( not ( = ?auto_3483116 ?auto_3483112 ) ) ( not ( = ?auto_3483116 ?auto_3483114 ) ) ( ON_BOARD ?auto_3483118 ?auto_3483117 ) ( SUPPORTS ?auto_3483118 ?auto_3483113 ) ( not ( = ?auto_3483112 ?auto_3483120 ) ) ( HAVE_IMAGE ?auto_3483114 ?auto_3483111 ) ( not ( = ?auto_3483114 ?auto_3483120 ) ) ( not ( = ?auto_3483111 ?auto_3483113 ) ) ( CALIBRATION_TARGET ?auto_3483118 ?auto_3483120 ) ( POWER_AVAIL ?auto_3483117 ) ( POINTING ?auto_3483117 ?auto_3483119 ) ( not ( = ?auto_3483120 ?auto_3483119 ) ) ( not ( = ?auto_3483112 ?auto_3483119 ) ) ( not ( = ?auto_3483114 ?auto_3483119 ) ) ( HAVE_IMAGE ?auto_3483116 ?auto_3483115 ) ( not ( = ?auto_3483113 ?auto_3483115 ) ) ( not ( = ?auto_3483111 ?auto_3483115 ) ) ( not ( = ?auto_3483116 ?auto_3483120 ) ) ( not ( = ?auto_3483116 ?auto_3483119 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3483114 ?auto_3483111 ?auto_3483112 ?auto_3483113 )
      ( GET-3IMAGE-VERIFY ?auto_3483112 ?auto_3483113 ?auto_3483114 ?auto_3483111 ?auto_3483116 ?auto_3483115 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3483365 - DIRECTION
      ?auto_3483366 - MODE
      ?auto_3483367 - DIRECTION
      ?auto_3483364 - MODE
      ?auto_3483369 - DIRECTION
      ?auto_3483368 - MODE
      ?auto_3483370 - DIRECTION
      ?auto_3483371 - MODE
    )
    :vars
    (
      ?auto_3483373 - INSTRUMENT
      ?auto_3483372 - SATELLITE
      ?auto_3483374 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3483367 ?auto_3483365 ) ) ( not ( = ?auto_3483369 ?auto_3483365 ) ) ( not ( = ?auto_3483369 ?auto_3483367 ) ) ( not ( = ?auto_3483370 ?auto_3483365 ) ) ( not ( = ?auto_3483370 ?auto_3483367 ) ) ( not ( = ?auto_3483370 ?auto_3483369 ) ) ( ON_BOARD ?auto_3483373 ?auto_3483372 ) ( SUPPORTS ?auto_3483373 ?auto_3483371 ) ( not ( = ?auto_3483370 ?auto_3483374 ) ) ( HAVE_IMAGE ?auto_3483365 ?auto_3483366 ) ( not ( = ?auto_3483365 ?auto_3483374 ) ) ( not ( = ?auto_3483366 ?auto_3483371 ) ) ( CALIBRATION_TARGET ?auto_3483373 ?auto_3483374 ) ( POWER_AVAIL ?auto_3483372 ) ( POINTING ?auto_3483372 ?auto_3483369 ) ( not ( = ?auto_3483374 ?auto_3483369 ) ) ( HAVE_IMAGE ?auto_3483367 ?auto_3483364 ) ( HAVE_IMAGE ?auto_3483369 ?auto_3483368 ) ( not ( = ?auto_3483366 ?auto_3483364 ) ) ( not ( = ?auto_3483366 ?auto_3483368 ) ) ( not ( = ?auto_3483367 ?auto_3483374 ) ) ( not ( = ?auto_3483364 ?auto_3483368 ) ) ( not ( = ?auto_3483364 ?auto_3483371 ) ) ( not ( = ?auto_3483368 ?auto_3483371 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3483365 ?auto_3483366 ?auto_3483370 ?auto_3483371 )
      ( GET-4IMAGE-VERIFY ?auto_3483365 ?auto_3483366 ?auto_3483367 ?auto_3483364 ?auto_3483369 ?auto_3483368 ?auto_3483370 ?auto_3483371 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3483400 - DIRECTION
      ?auto_3483401 - MODE
      ?auto_3483402 - DIRECTION
      ?auto_3483399 - MODE
      ?auto_3483404 - DIRECTION
      ?auto_3483403 - MODE
      ?auto_3483405 - DIRECTION
      ?auto_3483406 - MODE
    )
    :vars
    (
      ?auto_3483408 - INSTRUMENT
      ?auto_3483407 - SATELLITE
      ?auto_3483409 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3483402 ?auto_3483400 ) ) ( not ( = ?auto_3483404 ?auto_3483400 ) ) ( not ( = ?auto_3483404 ?auto_3483402 ) ) ( not ( = ?auto_3483405 ?auto_3483400 ) ) ( not ( = ?auto_3483405 ?auto_3483402 ) ) ( not ( = ?auto_3483405 ?auto_3483404 ) ) ( ON_BOARD ?auto_3483408 ?auto_3483407 ) ( SUPPORTS ?auto_3483408 ?auto_3483403 ) ( not ( = ?auto_3483404 ?auto_3483409 ) ) ( HAVE_IMAGE ?auto_3483400 ?auto_3483401 ) ( not ( = ?auto_3483400 ?auto_3483409 ) ) ( not ( = ?auto_3483401 ?auto_3483403 ) ) ( CALIBRATION_TARGET ?auto_3483408 ?auto_3483409 ) ( POWER_AVAIL ?auto_3483407 ) ( POINTING ?auto_3483407 ?auto_3483405 ) ( not ( = ?auto_3483409 ?auto_3483405 ) ) ( HAVE_IMAGE ?auto_3483402 ?auto_3483399 ) ( HAVE_IMAGE ?auto_3483405 ?auto_3483406 ) ( not ( = ?auto_3483401 ?auto_3483399 ) ) ( not ( = ?auto_3483401 ?auto_3483406 ) ) ( not ( = ?auto_3483402 ?auto_3483409 ) ) ( not ( = ?auto_3483399 ?auto_3483403 ) ) ( not ( = ?auto_3483399 ?auto_3483406 ) ) ( not ( = ?auto_3483403 ?auto_3483406 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3483400 ?auto_3483401 ?auto_3483404 ?auto_3483403 )
      ( GET-4IMAGE-VERIFY ?auto_3483400 ?auto_3483401 ?auto_3483402 ?auto_3483399 ?auto_3483404 ?auto_3483403 ?auto_3483405 ?auto_3483406 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3483434 - DIRECTION
      ?auto_3483435 - MODE
      ?auto_3483436 - DIRECTION
      ?auto_3483433 - MODE
      ?auto_3483438 - DIRECTION
      ?auto_3483437 - MODE
      ?auto_3483439 - DIRECTION
      ?auto_3483440 - MODE
    )
    :vars
    (
      ?auto_3483442 - INSTRUMENT
      ?auto_3483441 - SATELLITE
      ?auto_3483443 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3483436 ?auto_3483434 ) ) ( not ( = ?auto_3483438 ?auto_3483434 ) ) ( not ( = ?auto_3483438 ?auto_3483436 ) ) ( not ( = ?auto_3483439 ?auto_3483434 ) ) ( not ( = ?auto_3483439 ?auto_3483436 ) ) ( not ( = ?auto_3483439 ?auto_3483438 ) ) ( ON_BOARD ?auto_3483442 ?auto_3483441 ) ( SUPPORTS ?auto_3483442 ?auto_3483440 ) ( not ( = ?auto_3483439 ?auto_3483443 ) ) ( HAVE_IMAGE ?auto_3483434 ?auto_3483435 ) ( not ( = ?auto_3483434 ?auto_3483443 ) ) ( not ( = ?auto_3483435 ?auto_3483440 ) ) ( CALIBRATION_TARGET ?auto_3483442 ?auto_3483443 ) ( POWER_AVAIL ?auto_3483441 ) ( POINTING ?auto_3483441 ?auto_3483436 ) ( not ( = ?auto_3483443 ?auto_3483436 ) ) ( HAVE_IMAGE ?auto_3483436 ?auto_3483433 ) ( HAVE_IMAGE ?auto_3483438 ?auto_3483437 ) ( not ( = ?auto_3483435 ?auto_3483433 ) ) ( not ( = ?auto_3483435 ?auto_3483437 ) ) ( not ( = ?auto_3483433 ?auto_3483437 ) ) ( not ( = ?auto_3483433 ?auto_3483440 ) ) ( not ( = ?auto_3483438 ?auto_3483443 ) ) ( not ( = ?auto_3483437 ?auto_3483440 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3483434 ?auto_3483435 ?auto_3483439 ?auto_3483440 )
      ( GET-4IMAGE-VERIFY ?auto_3483434 ?auto_3483435 ?auto_3483436 ?auto_3483433 ?auto_3483438 ?auto_3483437 ?auto_3483439 ?auto_3483440 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3483467 - DIRECTION
      ?auto_3483468 - MODE
      ?auto_3483469 - DIRECTION
      ?auto_3483466 - MODE
      ?auto_3483471 - DIRECTION
      ?auto_3483470 - MODE
      ?auto_3483472 - DIRECTION
      ?auto_3483473 - MODE
    )
    :vars
    (
      ?auto_3483475 - INSTRUMENT
      ?auto_3483474 - SATELLITE
      ?auto_3483476 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3483469 ?auto_3483467 ) ) ( not ( = ?auto_3483471 ?auto_3483467 ) ) ( not ( = ?auto_3483471 ?auto_3483469 ) ) ( not ( = ?auto_3483472 ?auto_3483467 ) ) ( not ( = ?auto_3483472 ?auto_3483469 ) ) ( not ( = ?auto_3483472 ?auto_3483471 ) ) ( ON_BOARD ?auto_3483475 ?auto_3483474 ) ( SUPPORTS ?auto_3483475 ?auto_3483470 ) ( not ( = ?auto_3483471 ?auto_3483476 ) ) ( HAVE_IMAGE ?auto_3483467 ?auto_3483468 ) ( not ( = ?auto_3483467 ?auto_3483476 ) ) ( not ( = ?auto_3483468 ?auto_3483470 ) ) ( CALIBRATION_TARGET ?auto_3483475 ?auto_3483476 ) ( POWER_AVAIL ?auto_3483474 ) ( POINTING ?auto_3483474 ?auto_3483469 ) ( not ( = ?auto_3483476 ?auto_3483469 ) ) ( HAVE_IMAGE ?auto_3483469 ?auto_3483466 ) ( HAVE_IMAGE ?auto_3483472 ?auto_3483473 ) ( not ( = ?auto_3483468 ?auto_3483466 ) ) ( not ( = ?auto_3483468 ?auto_3483473 ) ) ( not ( = ?auto_3483466 ?auto_3483470 ) ) ( not ( = ?auto_3483466 ?auto_3483473 ) ) ( not ( = ?auto_3483470 ?auto_3483473 ) ) ( not ( = ?auto_3483472 ?auto_3483476 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3483467 ?auto_3483468 ?auto_3483471 ?auto_3483470 )
      ( GET-4IMAGE-VERIFY ?auto_3483467 ?auto_3483468 ?auto_3483469 ?auto_3483466 ?auto_3483471 ?auto_3483470 ?auto_3483472 ?auto_3483473 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3483571 - DIRECTION
      ?auto_3483572 - MODE
      ?auto_3483573 - DIRECTION
      ?auto_3483570 - MODE
      ?auto_3483575 - DIRECTION
      ?auto_3483574 - MODE
      ?auto_3483576 - DIRECTION
      ?auto_3483577 - MODE
    )
    :vars
    (
      ?auto_3483579 - INSTRUMENT
      ?auto_3483578 - SATELLITE
      ?auto_3483580 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3483573 ?auto_3483571 ) ) ( not ( = ?auto_3483575 ?auto_3483571 ) ) ( not ( = ?auto_3483575 ?auto_3483573 ) ) ( not ( = ?auto_3483576 ?auto_3483571 ) ) ( not ( = ?auto_3483576 ?auto_3483573 ) ) ( not ( = ?auto_3483576 ?auto_3483575 ) ) ( ON_BOARD ?auto_3483579 ?auto_3483578 ) ( SUPPORTS ?auto_3483579 ?auto_3483570 ) ( not ( = ?auto_3483573 ?auto_3483580 ) ) ( HAVE_IMAGE ?auto_3483571 ?auto_3483572 ) ( not ( = ?auto_3483571 ?auto_3483580 ) ) ( not ( = ?auto_3483572 ?auto_3483570 ) ) ( CALIBRATION_TARGET ?auto_3483579 ?auto_3483580 ) ( POWER_AVAIL ?auto_3483578 ) ( POINTING ?auto_3483578 ?auto_3483576 ) ( not ( = ?auto_3483580 ?auto_3483576 ) ) ( HAVE_IMAGE ?auto_3483575 ?auto_3483574 ) ( HAVE_IMAGE ?auto_3483576 ?auto_3483577 ) ( not ( = ?auto_3483572 ?auto_3483574 ) ) ( not ( = ?auto_3483572 ?auto_3483577 ) ) ( not ( = ?auto_3483570 ?auto_3483574 ) ) ( not ( = ?auto_3483570 ?auto_3483577 ) ) ( not ( = ?auto_3483575 ?auto_3483580 ) ) ( not ( = ?auto_3483574 ?auto_3483577 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3483571 ?auto_3483572 ?auto_3483573 ?auto_3483570 )
      ( GET-4IMAGE-VERIFY ?auto_3483571 ?auto_3483572 ?auto_3483573 ?auto_3483570 ?auto_3483575 ?auto_3483574 ?auto_3483576 ?auto_3483577 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3483605 - DIRECTION
      ?auto_3483606 - MODE
      ?auto_3483607 - DIRECTION
      ?auto_3483604 - MODE
      ?auto_3483609 - DIRECTION
      ?auto_3483608 - MODE
      ?auto_3483610 - DIRECTION
      ?auto_3483611 - MODE
    )
    :vars
    (
      ?auto_3483613 - INSTRUMENT
      ?auto_3483612 - SATELLITE
      ?auto_3483614 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3483607 ?auto_3483605 ) ) ( not ( = ?auto_3483609 ?auto_3483605 ) ) ( not ( = ?auto_3483609 ?auto_3483607 ) ) ( not ( = ?auto_3483610 ?auto_3483605 ) ) ( not ( = ?auto_3483610 ?auto_3483607 ) ) ( not ( = ?auto_3483610 ?auto_3483609 ) ) ( ON_BOARD ?auto_3483613 ?auto_3483612 ) ( SUPPORTS ?auto_3483613 ?auto_3483604 ) ( not ( = ?auto_3483607 ?auto_3483614 ) ) ( HAVE_IMAGE ?auto_3483605 ?auto_3483606 ) ( not ( = ?auto_3483605 ?auto_3483614 ) ) ( not ( = ?auto_3483606 ?auto_3483604 ) ) ( CALIBRATION_TARGET ?auto_3483613 ?auto_3483614 ) ( POWER_AVAIL ?auto_3483612 ) ( POINTING ?auto_3483612 ?auto_3483609 ) ( not ( = ?auto_3483614 ?auto_3483609 ) ) ( HAVE_IMAGE ?auto_3483609 ?auto_3483608 ) ( HAVE_IMAGE ?auto_3483610 ?auto_3483611 ) ( not ( = ?auto_3483606 ?auto_3483608 ) ) ( not ( = ?auto_3483606 ?auto_3483611 ) ) ( not ( = ?auto_3483604 ?auto_3483608 ) ) ( not ( = ?auto_3483604 ?auto_3483611 ) ) ( not ( = ?auto_3483608 ?auto_3483611 ) ) ( not ( = ?auto_3483610 ?auto_3483614 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3483605 ?auto_3483606 ?auto_3483607 ?auto_3483604 )
      ( GET-4IMAGE-VERIFY ?auto_3483605 ?auto_3483606 ?auto_3483607 ?auto_3483604 ?auto_3483609 ?auto_3483608 ?auto_3483610 ?auto_3483611 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3484142 - DIRECTION
      ?auto_3484143 - MODE
      ?auto_3484144 - DIRECTION
      ?auto_3484141 - MODE
      ?auto_3484146 - DIRECTION
      ?auto_3484145 - MODE
      ?auto_3484147 - DIRECTION
      ?auto_3484148 - MODE
    )
    :vars
    (
      ?auto_3484150 - INSTRUMENT
      ?auto_3484149 - SATELLITE
      ?auto_3484151 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3484144 ?auto_3484142 ) ) ( not ( = ?auto_3484146 ?auto_3484142 ) ) ( not ( = ?auto_3484146 ?auto_3484144 ) ) ( not ( = ?auto_3484147 ?auto_3484142 ) ) ( not ( = ?auto_3484147 ?auto_3484144 ) ) ( not ( = ?auto_3484147 ?auto_3484146 ) ) ( ON_BOARD ?auto_3484150 ?auto_3484149 ) ( SUPPORTS ?auto_3484150 ?auto_3484148 ) ( not ( = ?auto_3484147 ?auto_3484151 ) ) ( HAVE_IMAGE ?auto_3484144 ?auto_3484141 ) ( not ( = ?auto_3484144 ?auto_3484151 ) ) ( not ( = ?auto_3484141 ?auto_3484148 ) ) ( CALIBRATION_TARGET ?auto_3484150 ?auto_3484151 ) ( POWER_AVAIL ?auto_3484149 ) ( POINTING ?auto_3484149 ?auto_3484142 ) ( not ( = ?auto_3484151 ?auto_3484142 ) ) ( HAVE_IMAGE ?auto_3484142 ?auto_3484143 ) ( HAVE_IMAGE ?auto_3484146 ?auto_3484145 ) ( not ( = ?auto_3484143 ?auto_3484141 ) ) ( not ( = ?auto_3484143 ?auto_3484145 ) ) ( not ( = ?auto_3484143 ?auto_3484148 ) ) ( not ( = ?auto_3484141 ?auto_3484145 ) ) ( not ( = ?auto_3484146 ?auto_3484151 ) ) ( not ( = ?auto_3484145 ?auto_3484148 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3484144 ?auto_3484141 ?auto_3484147 ?auto_3484148 )
      ( GET-4IMAGE-VERIFY ?auto_3484142 ?auto_3484143 ?auto_3484144 ?auto_3484141 ?auto_3484146 ?auto_3484145 ?auto_3484147 ?auto_3484148 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3484175 - DIRECTION
      ?auto_3484176 - MODE
      ?auto_3484177 - DIRECTION
      ?auto_3484174 - MODE
      ?auto_3484179 - DIRECTION
      ?auto_3484178 - MODE
      ?auto_3484180 - DIRECTION
      ?auto_3484181 - MODE
    )
    :vars
    (
      ?auto_3484183 - INSTRUMENT
      ?auto_3484182 - SATELLITE
      ?auto_3484184 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3484177 ?auto_3484175 ) ) ( not ( = ?auto_3484179 ?auto_3484175 ) ) ( not ( = ?auto_3484179 ?auto_3484177 ) ) ( not ( = ?auto_3484180 ?auto_3484175 ) ) ( not ( = ?auto_3484180 ?auto_3484177 ) ) ( not ( = ?auto_3484180 ?auto_3484179 ) ) ( ON_BOARD ?auto_3484183 ?auto_3484182 ) ( SUPPORTS ?auto_3484183 ?auto_3484178 ) ( not ( = ?auto_3484179 ?auto_3484184 ) ) ( HAVE_IMAGE ?auto_3484177 ?auto_3484174 ) ( not ( = ?auto_3484177 ?auto_3484184 ) ) ( not ( = ?auto_3484174 ?auto_3484178 ) ) ( CALIBRATION_TARGET ?auto_3484183 ?auto_3484184 ) ( POWER_AVAIL ?auto_3484182 ) ( POINTING ?auto_3484182 ?auto_3484175 ) ( not ( = ?auto_3484184 ?auto_3484175 ) ) ( HAVE_IMAGE ?auto_3484175 ?auto_3484176 ) ( HAVE_IMAGE ?auto_3484180 ?auto_3484181 ) ( not ( = ?auto_3484176 ?auto_3484174 ) ) ( not ( = ?auto_3484176 ?auto_3484178 ) ) ( not ( = ?auto_3484176 ?auto_3484181 ) ) ( not ( = ?auto_3484174 ?auto_3484181 ) ) ( not ( = ?auto_3484178 ?auto_3484181 ) ) ( not ( = ?auto_3484180 ?auto_3484184 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3484177 ?auto_3484174 ?auto_3484179 ?auto_3484178 )
      ( GET-4IMAGE-VERIFY ?auto_3484175 ?auto_3484176 ?auto_3484177 ?auto_3484174 ?auto_3484179 ?auto_3484178 ?auto_3484180 ?auto_3484181 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3484387 - DIRECTION
      ?auto_3484388 - MODE
      ?auto_3484389 - DIRECTION
      ?auto_3484386 - MODE
      ?auto_3484391 - DIRECTION
      ?auto_3484390 - MODE
      ?auto_3484392 - DIRECTION
      ?auto_3484393 - MODE
    )
    :vars
    (
      ?auto_3484395 - INSTRUMENT
      ?auto_3484394 - SATELLITE
      ?auto_3484396 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3484389 ?auto_3484387 ) ) ( not ( = ?auto_3484391 ?auto_3484387 ) ) ( not ( = ?auto_3484391 ?auto_3484389 ) ) ( not ( = ?auto_3484392 ?auto_3484387 ) ) ( not ( = ?auto_3484392 ?auto_3484389 ) ) ( not ( = ?auto_3484392 ?auto_3484391 ) ) ( ON_BOARD ?auto_3484395 ?auto_3484394 ) ( SUPPORTS ?auto_3484395 ?auto_3484386 ) ( not ( = ?auto_3484389 ?auto_3484396 ) ) ( HAVE_IMAGE ?auto_3484391 ?auto_3484390 ) ( not ( = ?auto_3484391 ?auto_3484396 ) ) ( not ( = ?auto_3484390 ?auto_3484386 ) ) ( CALIBRATION_TARGET ?auto_3484395 ?auto_3484396 ) ( POWER_AVAIL ?auto_3484394 ) ( POINTING ?auto_3484394 ?auto_3484387 ) ( not ( = ?auto_3484396 ?auto_3484387 ) ) ( HAVE_IMAGE ?auto_3484387 ?auto_3484388 ) ( HAVE_IMAGE ?auto_3484392 ?auto_3484393 ) ( not ( = ?auto_3484388 ?auto_3484386 ) ) ( not ( = ?auto_3484388 ?auto_3484390 ) ) ( not ( = ?auto_3484388 ?auto_3484393 ) ) ( not ( = ?auto_3484386 ?auto_3484393 ) ) ( not ( = ?auto_3484390 ?auto_3484393 ) ) ( not ( = ?auto_3484392 ?auto_3484396 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3484391 ?auto_3484390 ?auto_3484389 ?auto_3484386 )
      ( GET-4IMAGE-VERIFY ?auto_3484387 ?auto_3484388 ?auto_3484389 ?auto_3484386 ?auto_3484391 ?auto_3484390 ?auto_3484392 ?auto_3484393 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3484638 - DIRECTION
      ?auto_3484639 - MODE
      ?auto_3484640 - DIRECTION
      ?auto_3484637 - MODE
      ?auto_3484642 - DIRECTION
      ?auto_3484641 - MODE
      ?auto_3484643 - DIRECTION
      ?auto_3484644 - MODE
    )
    :vars
    (
      ?auto_3484646 - INSTRUMENT
      ?auto_3484645 - SATELLITE
      ?auto_3484647 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3484640 ?auto_3484638 ) ) ( not ( = ?auto_3484642 ?auto_3484638 ) ) ( not ( = ?auto_3484642 ?auto_3484640 ) ) ( not ( = ?auto_3484643 ?auto_3484638 ) ) ( not ( = ?auto_3484643 ?auto_3484640 ) ) ( not ( = ?auto_3484643 ?auto_3484642 ) ) ( ON_BOARD ?auto_3484646 ?auto_3484645 ) ( SUPPORTS ?auto_3484646 ?auto_3484639 ) ( not ( = ?auto_3484638 ?auto_3484647 ) ) ( HAVE_IMAGE ?auto_3484640 ?auto_3484637 ) ( not ( = ?auto_3484640 ?auto_3484647 ) ) ( not ( = ?auto_3484637 ?auto_3484639 ) ) ( CALIBRATION_TARGET ?auto_3484646 ?auto_3484647 ) ( POWER_AVAIL ?auto_3484645 ) ( POINTING ?auto_3484645 ?auto_3484643 ) ( not ( = ?auto_3484647 ?auto_3484643 ) ) ( HAVE_IMAGE ?auto_3484642 ?auto_3484641 ) ( HAVE_IMAGE ?auto_3484643 ?auto_3484644 ) ( not ( = ?auto_3484639 ?auto_3484641 ) ) ( not ( = ?auto_3484639 ?auto_3484644 ) ) ( not ( = ?auto_3484637 ?auto_3484641 ) ) ( not ( = ?auto_3484637 ?auto_3484644 ) ) ( not ( = ?auto_3484642 ?auto_3484647 ) ) ( not ( = ?auto_3484641 ?auto_3484644 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3484640 ?auto_3484637 ?auto_3484638 ?auto_3484639 )
      ( GET-4IMAGE-VERIFY ?auto_3484638 ?auto_3484639 ?auto_3484640 ?auto_3484637 ?auto_3484642 ?auto_3484641 ?auto_3484643 ?auto_3484644 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3484672 - DIRECTION
      ?auto_3484673 - MODE
      ?auto_3484674 - DIRECTION
      ?auto_3484671 - MODE
      ?auto_3484676 - DIRECTION
      ?auto_3484675 - MODE
      ?auto_3484677 - DIRECTION
      ?auto_3484678 - MODE
    )
    :vars
    (
      ?auto_3484680 - INSTRUMENT
      ?auto_3484679 - SATELLITE
      ?auto_3484681 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3484674 ?auto_3484672 ) ) ( not ( = ?auto_3484676 ?auto_3484672 ) ) ( not ( = ?auto_3484676 ?auto_3484674 ) ) ( not ( = ?auto_3484677 ?auto_3484672 ) ) ( not ( = ?auto_3484677 ?auto_3484674 ) ) ( not ( = ?auto_3484677 ?auto_3484676 ) ) ( ON_BOARD ?auto_3484680 ?auto_3484679 ) ( SUPPORTS ?auto_3484680 ?auto_3484673 ) ( not ( = ?auto_3484672 ?auto_3484681 ) ) ( HAVE_IMAGE ?auto_3484674 ?auto_3484671 ) ( not ( = ?auto_3484674 ?auto_3484681 ) ) ( not ( = ?auto_3484671 ?auto_3484673 ) ) ( CALIBRATION_TARGET ?auto_3484680 ?auto_3484681 ) ( POWER_AVAIL ?auto_3484679 ) ( POINTING ?auto_3484679 ?auto_3484676 ) ( not ( = ?auto_3484681 ?auto_3484676 ) ) ( HAVE_IMAGE ?auto_3484676 ?auto_3484675 ) ( HAVE_IMAGE ?auto_3484677 ?auto_3484678 ) ( not ( = ?auto_3484673 ?auto_3484675 ) ) ( not ( = ?auto_3484673 ?auto_3484678 ) ) ( not ( = ?auto_3484671 ?auto_3484675 ) ) ( not ( = ?auto_3484671 ?auto_3484678 ) ) ( not ( = ?auto_3484675 ?auto_3484678 ) ) ( not ( = ?auto_3484677 ?auto_3484681 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3484674 ?auto_3484671 ?auto_3484672 ?auto_3484673 )
      ( GET-4IMAGE-VERIFY ?auto_3484672 ?auto_3484673 ?auto_3484674 ?auto_3484671 ?auto_3484676 ?auto_3484675 ?auto_3484677 ?auto_3484678 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3484960 - DIRECTION
      ?auto_3484961 - MODE
      ?auto_3484962 - DIRECTION
      ?auto_3484959 - MODE
      ?auto_3484964 - DIRECTION
      ?auto_3484963 - MODE
      ?auto_3484965 - DIRECTION
      ?auto_3484966 - MODE
    )
    :vars
    (
      ?auto_3484968 - INSTRUMENT
      ?auto_3484967 - SATELLITE
      ?auto_3484969 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3484962 ?auto_3484960 ) ) ( not ( = ?auto_3484964 ?auto_3484960 ) ) ( not ( = ?auto_3484964 ?auto_3484962 ) ) ( not ( = ?auto_3484965 ?auto_3484960 ) ) ( not ( = ?auto_3484965 ?auto_3484962 ) ) ( not ( = ?auto_3484965 ?auto_3484964 ) ) ( ON_BOARD ?auto_3484968 ?auto_3484967 ) ( SUPPORTS ?auto_3484968 ?auto_3484961 ) ( not ( = ?auto_3484960 ?auto_3484969 ) ) ( HAVE_IMAGE ?auto_3484964 ?auto_3484963 ) ( not ( = ?auto_3484964 ?auto_3484969 ) ) ( not ( = ?auto_3484963 ?auto_3484961 ) ) ( CALIBRATION_TARGET ?auto_3484968 ?auto_3484969 ) ( POWER_AVAIL ?auto_3484967 ) ( POINTING ?auto_3484967 ?auto_3484962 ) ( not ( = ?auto_3484969 ?auto_3484962 ) ) ( HAVE_IMAGE ?auto_3484962 ?auto_3484959 ) ( HAVE_IMAGE ?auto_3484965 ?auto_3484966 ) ( not ( = ?auto_3484961 ?auto_3484959 ) ) ( not ( = ?auto_3484961 ?auto_3484966 ) ) ( not ( = ?auto_3484959 ?auto_3484963 ) ) ( not ( = ?auto_3484959 ?auto_3484966 ) ) ( not ( = ?auto_3484963 ?auto_3484966 ) ) ( not ( = ?auto_3484965 ?auto_3484969 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3484964 ?auto_3484963 ?auto_3484960 ?auto_3484961 )
      ( GET-4IMAGE-VERIFY ?auto_3484960 ?auto_3484961 ?auto_3484962 ?auto_3484959 ?auto_3484964 ?auto_3484963 ?auto_3484965 ?auto_3484966 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3496206 - DIRECTION
      ?auto_3496207 - MODE
      ?auto_3496208 - DIRECTION
      ?auto_3496205 - MODE
      ?auto_3496210 - DIRECTION
      ?auto_3496209 - MODE
    )
    :vars
    (
      ?auto_3496215 - INSTRUMENT
      ?auto_3496212 - SATELLITE
      ?auto_3496213 - DIRECTION
      ?auto_3496214 - DIRECTION
      ?auto_3496211 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3496208 ?auto_3496206 ) ) ( not ( = ?auto_3496210 ?auto_3496206 ) ) ( not ( = ?auto_3496210 ?auto_3496208 ) ) ( ON_BOARD ?auto_3496215 ?auto_3496212 ) ( SUPPORTS ?auto_3496215 ?auto_3496209 ) ( not ( = ?auto_3496210 ?auto_3496213 ) ) ( HAVE_IMAGE ?auto_3496206 ?auto_3496207 ) ( not ( = ?auto_3496206 ?auto_3496213 ) ) ( not ( = ?auto_3496207 ?auto_3496209 ) ) ( CALIBRATION_TARGET ?auto_3496215 ?auto_3496213 ) ( POINTING ?auto_3496212 ?auto_3496214 ) ( not ( = ?auto_3496213 ?auto_3496214 ) ) ( not ( = ?auto_3496210 ?auto_3496214 ) ) ( not ( = ?auto_3496206 ?auto_3496214 ) ) ( ON_BOARD ?auto_3496211 ?auto_3496212 ) ( POWER_ON ?auto_3496211 ) ( not ( = ?auto_3496215 ?auto_3496211 ) ) ( HAVE_IMAGE ?auto_3496208 ?auto_3496205 ) ( not ( = ?auto_3496207 ?auto_3496205 ) ) ( not ( = ?auto_3496208 ?auto_3496213 ) ) ( not ( = ?auto_3496208 ?auto_3496214 ) ) ( not ( = ?auto_3496205 ?auto_3496209 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3496206 ?auto_3496207 ?auto_3496210 ?auto_3496209 )
      ( GET-3IMAGE-VERIFY ?auto_3496206 ?auto_3496207 ?auto_3496208 ?auto_3496205 ?auto_3496210 ?auto_3496209 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3496238 - DIRECTION
      ?auto_3496239 - MODE
      ?auto_3496240 - DIRECTION
      ?auto_3496237 - MODE
      ?auto_3496242 - DIRECTION
      ?auto_3496241 - MODE
    )
    :vars
    (
      ?auto_3496247 - INSTRUMENT
      ?auto_3496244 - SATELLITE
      ?auto_3496245 - DIRECTION
      ?auto_3496246 - DIRECTION
      ?auto_3496243 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3496240 ?auto_3496238 ) ) ( not ( = ?auto_3496242 ?auto_3496238 ) ) ( not ( = ?auto_3496242 ?auto_3496240 ) ) ( ON_BOARD ?auto_3496247 ?auto_3496244 ) ( SUPPORTS ?auto_3496247 ?auto_3496237 ) ( not ( = ?auto_3496240 ?auto_3496245 ) ) ( HAVE_IMAGE ?auto_3496238 ?auto_3496239 ) ( not ( = ?auto_3496238 ?auto_3496245 ) ) ( not ( = ?auto_3496239 ?auto_3496237 ) ) ( CALIBRATION_TARGET ?auto_3496247 ?auto_3496245 ) ( POINTING ?auto_3496244 ?auto_3496246 ) ( not ( = ?auto_3496245 ?auto_3496246 ) ) ( not ( = ?auto_3496240 ?auto_3496246 ) ) ( not ( = ?auto_3496238 ?auto_3496246 ) ) ( ON_BOARD ?auto_3496243 ?auto_3496244 ) ( POWER_ON ?auto_3496243 ) ( not ( = ?auto_3496247 ?auto_3496243 ) ) ( HAVE_IMAGE ?auto_3496242 ?auto_3496241 ) ( not ( = ?auto_3496239 ?auto_3496241 ) ) ( not ( = ?auto_3496237 ?auto_3496241 ) ) ( not ( = ?auto_3496242 ?auto_3496245 ) ) ( not ( = ?auto_3496242 ?auto_3496246 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3496238 ?auto_3496239 ?auto_3496240 ?auto_3496237 )
      ( GET-3IMAGE-VERIFY ?auto_3496238 ?auto_3496239 ?auto_3496240 ?auto_3496237 ?auto_3496242 ?auto_3496241 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3496412 - DIRECTION
      ?auto_3496413 - MODE
      ?auto_3496414 - DIRECTION
      ?auto_3496411 - MODE
      ?auto_3496416 - DIRECTION
      ?auto_3496415 - MODE
    )
    :vars
    (
      ?auto_3496421 - INSTRUMENT
      ?auto_3496418 - SATELLITE
      ?auto_3496419 - DIRECTION
      ?auto_3496420 - DIRECTION
      ?auto_3496417 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3496414 ?auto_3496412 ) ) ( not ( = ?auto_3496416 ?auto_3496412 ) ) ( not ( = ?auto_3496416 ?auto_3496414 ) ) ( ON_BOARD ?auto_3496421 ?auto_3496418 ) ( SUPPORTS ?auto_3496421 ?auto_3496413 ) ( not ( = ?auto_3496412 ?auto_3496419 ) ) ( HAVE_IMAGE ?auto_3496414 ?auto_3496411 ) ( not ( = ?auto_3496414 ?auto_3496419 ) ) ( not ( = ?auto_3496411 ?auto_3496413 ) ) ( CALIBRATION_TARGET ?auto_3496421 ?auto_3496419 ) ( POINTING ?auto_3496418 ?auto_3496420 ) ( not ( = ?auto_3496419 ?auto_3496420 ) ) ( not ( = ?auto_3496412 ?auto_3496420 ) ) ( not ( = ?auto_3496414 ?auto_3496420 ) ) ( ON_BOARD ?auto_3496417 ?auto_3496418 ) ( POWER_ON ?auto_3496417 ) ( not ( = ?auto_3496421 ?auto_3496417 ) ) ( HAVE_IMAGE ?auto_3496416 ?auto_3496415 ) ( not ( = ?auto_3496413 ?auto_3496415 ) ) ( not ( = ?auto_3496411 ?auto_3496415 ) ) ( not ( = ?auto_3496416 ?auto_3496419 ) ) ( not ( = ?auto_3496416 ?auto_3496420 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3496414 ?auto_3496411 ?auto_3496412 ?auto_3496413 )
      ( GET-3IMAGE-VERIFY ?auto_3496412 ?auto_3496413 ?auto_3496414 ?auto_3496411 ?auto_3496416 ?auto_3496415 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3496686 - DIRECTION
      ?auto_3496687 - MODE
      ?auto_3496688 - DIRECTION
      ?auto_3496685 - MODE
      ?auto_3496690 - DIRECTION
      ?auto_3496689 - MODE
      ?auto_3496691 - DIRECTION
      ?auto_3496692 - MODE
    )
    :vars
    (
      ?auto_3496696 - INSTRUMENT
      ?auto_3496694 - SATELLITE
      ?auto_3496695 - DIRECTION
      ?auto_3496693 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3496688 ?auto_3496686 ) ) ( not ( = ?auto_3496690 ?auto_3496686 ) ) ( not ( = ?auto_3496690 ?auto_3496688 ) ) ( not ( = ?auto_3496691 ?auto_3496686 ) ) ( not ( = ?auto_3496691 ?auto_3496688 ) ) ( not ( = ?auto_3496691 ?auto_3496690 ) ) ( ON_BOARD ?auto_3496696 ?auto_3496694 ) ( SUPPORTS ?auto_3496696 ?auto_3496692 ) ( not ( = ?auto_3496691 ?auto_3496695 ) ) ( HAVE_IMAGE ?auto_3496686 ?auto_3496687 ) ( not ( = ?auto_3496686 ?auto_3496695 ) ) ( not ( = ?auto_3496687 ?auto_3496692 ) ) ( CALIBRATION_TARGET ?auto_3496696 ?auto_3496695 ) ( POINTING ?auto_3496694 ?auto_3496690 ) ( not ( = ?auto_3496695 ?auto_3496690 ) ) ( ON_BOARD ?auto_3496693 ?auto_3496694 ) ( POWER_ON ?auto_3496693 ) ( not ( = ?auto_3496696 ?auto_3496693 ) ) ( HAVE_IMAGE ?auto_3496688 ?auto_3496685 ) ( HAVE_IMAGE ?auto_3496690 ?auto_3496689 ) ( not ( = ?auto_3496687 ?auto_3496685 ) ) ( not ( = ?auto_3496687 ?auto_3496689 ) ) ( not ( = ?auto_3496688 ?auto_3496695 ) ) ( not ( = ?auto_3496685 ?auto_3496689 ) ) ( not ( = ?auto_3496685 ?auto_3496692 ) ) ( not ( = ?auto_3496689 ?auto_3496692 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3496686 ?auto_3496687 ?auto_3496691 ?auto_3496692 )
      ( GET-4IMAGE-VERIFY ?auto_3496686 ?auto_3496687 ?auto_3496688 ?auto_3496685 ?auto_3496690 ?auto_3496689 ?auto_3496691 ?auto_3496692 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3496724 - DIRECTION
      ?auto_3496725 - MODE
      ?auto_3496726 - DIRECTION
      ?auto_3496723 - MODE
      ?auto_3496728 - DIRECTION
      ?auto_3496727 - MODE
      ?auto_3496729 - DIRECTION
      ?auto_3496730 - MODE
    )
    :vars
    (
      ?auto_3496734 - INSTRUMENT
      ?auto_3496732 - SATELLITE
      ?auto_3496733 - DIRECTION
      ?auto_3496731 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3496726 ?auto_3496724 ) ) ( not ( = ?auto_3496728 ?auto_3496724 ) ) ( not ( = ?auto_3496728 ?auto_3496726 ) ) ( not ( = ?auto_3496729 ?auto_3496724 ) ) ( not ( = ?auto_3496729 ?auto_3496726 ) ) ( not ( = ?auto_3496729 ?auto_3496728 ) ) ( ON_BOARD ?auto_3496734 ?auto_3496732 ) ( SUPPORTS ?auto_3496734 ?auto_3496727 ) ( not ( = ?auto_3496728 ?auto_3496733 ) ) ( HAVE_IMAGE ?auto_3496724 ?auto_3496725 ) ( not ( = ?auto_3496724 ?auto_3496733 ) ) ( not ( = ?auto_3496725 ?auto_3496727 ) ) ( CALIBRATION_TARGET ?auto_3496734 ?auto_3496733 ) ( POINTING ?auto_3496732 ?auto_3496729 ) ( not ( = ?auto_3496733 ?auto_3496729 ) ) ( ON_BOARD ?auto_3496731 ?auto_3496732 ) ( POWER_ON ?auto_3496731 ) ( not ( = ?auto_3496734 ?auto_3496731 ) ) ( HAVE_IMAGE ?auto_3496726 ?auto_3496723 ) ( HAVE_IMAGE ?auto_3496729 ?auto_3496730 ) ( not ( = ?auto_3496725 ?auto_3496723 ) ) ( not ( = ?auto_3496725 ?auto_3496730 ) ) ( not ( = ?auto_3496726 ?auto_3496733 ) ) ( not ( = ?auto_3496723 ?auto_3496727 ) ) ( not ( = ?auto_3496723 ?auto_3496730 ) ) ( not ( = ?auto_3496727 ?auto_3496730 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3496724 ?auto_3496725 ?auto_3496728 ?auto_3496727 )
      ( GET-4IMAGE-VERIFY ?auto_3496724 ?auto_3496725 ?auto_3496726 ?auto_3496723 ?auto_3496728 ?auto_3496727 ?auto_3496729 ?auto_3496730 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3496761 - DIRECTION
      ?auto_3496762 - MODE
      ?auto_3496763 - DIRECTION
      ?auto_3496760 - MODE
      ?auto_3496765 - DIRECTION
      ?auto_3496764 - MODE
      ?auto_3496766 - DIRECTION
      ?auto_3496767 - MODE
    )
    :vars
    (
      ?auto_3496771 - INSTRUMENT
      ?auto_3496769 - SATELLITE
      ?auto_3496770 - DIRECTION
      ?auto_3496768 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3496763 ?auto_3496761 ) ) ( not ( = ?auto_3496765 ?auto_3496761 ) ) ( not ( = ?auto_3496765 ?auto_3496763 ) ) ( not ( = ?auto_3496766 ?auto_3496761 ) ) ( not ( = ?auto_3496766 ?auto_3496763 ) ) ( not ( = ?auto_3496766 ?auto_3496765 ) ) ( ON_BOARD ?auto_3496771 ?auto_3496769 ) ( SUPPORTS ?auto_3496771 ?auto_3496767 ) ( not ( = ?auto_3496766 ?auto_3496770 ) ) ( HAVE_IMAGE ?auto_3496761 ?auto_3496762 ) ( not ( = ?auto_3496761 ?auto_3496770 ) ) ( not ( = ?auto_3496762 ?auto_3496767 ) ) ( CALIBRATION_TARGET ?auto_3496771 ?auto_3496770 ) ( POINTING ?auto_3496769 ?auto_3496763 ) ( not ( = ?auto_3496770 ?auto_3496763 ) ) ( ON_BOARD ?auto_3496768 ?auto_3496769 ) ( POWER_ON ?auto_3496768 ) ( not ( = ?auto_3496771 ?auto_3496768 ) ) ( HAVE_IMAGE ?auto_3496763 ?auto_3496760 ) ( HAVE_IMAGE ?auto_3496765 ?auto_3496764 ) ( not ( = ?auto_3496762 ?auto_3496760 ) ) ( not ( = ?auto_3496762 ?auto_3496764 ) ) ( not ( = ?auto_3496760 ?auto_3496764 ) ) ( not ( = ?auto_3496760 ?auto_3496767 ) ) ( not ( = ?auto_3496765 ?auto_3496770 ) ) ( not ( = ?auto_3496764 ?auto_3496767 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3496761 ?auto_3496762 ?auto_3496766 ?auto_3496767 )
      ( GET-4IMAGE-VERIFY ?auto_3496761 ?auto_3496762 ?auto_3496763 ?auto_3496760 ?auto_3496765 ?auto_3496764 ?auto_3496766 ?auto_3496767 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3496797 - DIRECTION
      ?auto_3496798 - MODE
      ?auto_3496799 - DIRECTION
      ?auto_3496796 - MODE
      ?auto_3496801 - DIRECTION
      ?auto_3496800 - MODE
      ?auto_3496802 - DIRECTION
      ?auto_3496803 - MODE
    )
    :vars
    (
      ?auto_3496807 - INSTRUMENT
      ?auto_3496805 - SATELLITE
      ?auto_3496806 - DIRECTION
      ?auto_3496804 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3496799 ?auto_3496797 ) ) ( not ( = ?auto_3496801 ?auto_3496797 ) ) ( not ( = ?auto_3496801 ?auto_3496799 ) ) ( not ( = ?auto_3496802 ?auto_3496797 ) ) ( not ( = ?auto_3496802 ?auto_3496799 ) ) ( not ( = ?auto_3496802 ?auto_3496801 ) ) ( ON_BOARD ?auto_3496807 ?auto_3496805 ) ( SUPPORTS ?auto_3496807 ?auto_3496800 ) ( not ( = ?auto_3496801 ?auto_3496806 ) ) ( HAVE_IMAGE ?auto_3496797 ?auto_3496798 ) ( not ( = ?auto_3496797 ?auto_3496806 ) ) ( not ( = ?auto_3496798 ?auto_3496800 ) ) ( CALIBRATION_TARGET ?auto_3496807 ?auto_3496806 ) ( POINTING ?auto_3496805 ?auto_3496799 ) ( not ( = ?auto_3496806 ?auto_3496799 ) ) ( ON_BOARD ?auto_3496804 ?auto_3496805 ) ( POWER_ON ?auto_3496804 ) ( not ( = ?auto_3496807 ?auto_3496804 ) ) ( HAVE_IMAGE ?auto_3496799 ?auto_3496796 ) ( HAVE_IMAGE ?auto_3496802 ?auto_3496803 ) ( not ( = ?auto_3496798 ?auto_3496796 ) ) ( not ( = ?auto_3496798 ?auto_3496803 ) ) ( not ( = ?auto_3496796 ?auto_3496800 ) ) ( not ( = ?auto_3496796 ?auto_3496803 ) ) ( not ( = ?auto_3496800 ?auto_3496803 ) ) ( not ( = ?auto_3496802 ?auto_3496806 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3496797 ?auto_3496798 ?auto_3496801 ?auto_3496800 )
      ( GET-4IMAGE-VERIFY ?auto_3496797 ?auto_3496798 ?auto_3496799 ?auto_3496796 ?auto_3496801 ?auto_3496800 ?auto_3496802 ?auto_3496803 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3496910 - DIRECTION
      ?auto_3496911 - MODE
      ?auto_3496912 - DIRECTION
      ?auto_3496909 - MODE
      ?auto_3496914 - DIRECTION
      ?auto_3496913 - MODE
      ?auto_3496915 - DIRECTION
      ?auto_3496916 - MODE
    )
    :vars
    (
      ?auto_3496920 - INSTRUMENT
      ?auto_3496918 - SATELLITE
      ?auto_3496919 - DIRECTION
      ?auto_3496917 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3496912 ?auto_3496910 ) ) ( not ( = ?auto_3496914 ?auto_3496910 ) ) ( not ( = ?auto_3496914 ?auto_3496912 ) ) ( not ( = ?auto_3496915 ?auto_3496910 ) ) ( not ( = ?auto_3496915 ?auto_3496912 ) ) ( not ( = ?auto_3496915 ?auto_3496914 ) ) ( ON_BOARD ?auto_3496920 ?auto_3496918 ) ( SUPPORTS ?auto_3496920 ?auto_3496909 ) ( not ( = ?auto_3496912 ?auto_3496919 ) ) ( HAVE_IMAGE ?auto_3496910 ?auto_3496911 ) ( not ( = ?auto_3496910 ?auto_3496919 ) ) ( not ( = ?auto_3496911 ?auto_3496909 ) ) ( CALIBRATION_TARGET ?auto_3496920 ?auto_3496919 ) ( POINTING ?auto_3496918 ?auto_3496915 ) ( not ( = ?auto_3496919 ?auto_3496915 ) ) ( ON_BOARD ?auto_3496917 ?auto_3496918 ) ( POWER_ON ?auto_3496917 ) ( not ( = ?auto_3496920 ?auto_3496917 ) ) ( HAVE_IMAGE ?auto_3496914 ?auto_3496913 ) ( HAVE_IMAGE ?auto_3496915 ?auto_3496916 ) ( not ( = ?auto_3496911 ?auto_3496913 ) ) ( not ( = ?auto_3496911 ?auto_3496916 ) ) ( not ( = ?auto_3496909 ?auto_3496913 ) ) ( not ( = ?auto_3496909 ?auto_3496916 ) ) ( not ( = ?auto_3496914 ?auto_3496919 ) ) ( not ( = ?auto_3496913 ?auto_3496916 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3496910 ?auto_3496911 ?auto_3496912 ?auto_3496909 )
      ( GET-4IMAGE-VERIFY ?auto_3496910 ?auto_3496911 ?auto_3496912 ?auto_3496909 ?auto_3496914 ?auto_3496913 ?auto_3496915 ?auto_3496916 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3496947 - DIRECTION
      ?auto_3496948 - MODE
      ?auto_3496949 - DIRECTION
      ?auto_3496946 - MODE
      ?auto_3496951 - DIRECTION
      ?auto_3496950 - MODE
      ?auto_3496952 - DIRECTION
      ?auto_3496953 - MODE
    )
    :vars
    (
      ?auto_3496957 - INSTRUMENT
      ?auto_3496955 - SATELLITE
      ?auto_3496956 - DIRECTION
      ?auto_3496954 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3496949 ?auto_3496947 ) ) ( not ( = ?auto_3496951 ?auto_3496947 ) ) ( not ( = ?auto_3496951 ?auto_3496949 ) ) ( not ( = ?auto_3496952 ?auto_3496947 ) ) ( not ( = ?auto_3496952 ?auto_3496949 ) ) ( not ( = ?auto_3496952 ?auto_3496951 ) ) ( ON_BOARD ?auto_3496957 ?auto_3496955 ) ( SUPPORTS ?auto_3496957 ?auto_3496946 ) ( not ( = ?auto_3496949 ?auto_3496956 ) ) ( HAVE_IMAGE ?auto_3496947 ?auto_3496948 ) ( not ( = ?auto_3496947 ?auto_3496956 ) ) ( not ( = ?auto_3496948 ?auto_3496946 ) ) ( CALIBRATION_TARGET ?auto_3496957 ?auto_3496956 ) ( POINTING ?auto_3496955 ?auto_3496951 ) ( not ( = ?auto_3496956 ?auto_3496951 ) ) ( ON_BOARD ?auto_3496954 ?auto_3496955 ) ( POWER_ON ?auto_3496954 ) ( not ( = ?auto_3496957 ?auto_3496954 ) ) ( HAVE_IMAGE ?auto_3496951 ?auto_3496950 ) ( HAVE_IMAGE ?auto_3496952 ?auto_3496953 ) ( not ( = ?auto_3496948 ?auto_3496950 ) ) ( not ( = ?auto_3496948 ?auto_3496953 ) ) ( not ( = ?auto_3496946 ?auto_3496950 ) ) ( not ( = ?auto_3496946 ?auto_3496953 ) ) ( not ( = ?auto_3496950 ?auto_3496953 ) ) ( not ( = ?auto_3496952 ?auto_3496956 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3496947 ?auto_3496948 ?auto_3496949 ?auto_3496946 )
      ( GET-4IMAGE-VERIFY ?auto_3496947 ?auto_3496948 ?auto_3496949 ?auto_3496946 ?auto_3496951 ?auto_3496950 ?auto_3496952 ?auto_3496953 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3497523 - DIRECTION
      ?auto_3497524 - MODE
      ?auto_3497525 - DIRECTION
      ?auto_3497522 - MODE
      ?auto_3497527 - DIRECTION
      ?auto_3497526 - MODE
      ?auto_3497528 - DIRECTION
      ?auto_3497529 - MODE
    )
    :vars
    (
      ?auto_3497533 - INSTRUMENT
      ?auto_3497531 - SATELLITE
      ?auto_3497532 - DIRECTION
      ?auto_3497530 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3497525 ?auto_3497523 ) ) ( not ( = ?auto_3497527 ?auto_3497523 ) ) ( not ( = ?auto_3497527 ?auto_3497525 ) ) ( not ( = ?auto_3497528 ?auto_3497523 ) ) ( not ( = ?auto_3497528 ?auto_3497525 ) ) ( not ( = ?auto_3497528 ?auto_3497527 ) ) ( ON_BOARD ?auto_3497533 ?auto_3497531 ) ( SUPPORTS ?auto_3497533 ?auto_3497529 ) ( not ( = ?auto_3497528 ?auto_3497532 ) ) ( HAVE_IMAGE ?auto_3497525 ?auto_3497522 ) ( not ( = ?auto_3497525 ?auto_3497532 ) ) ( not ( = ?auto_3497522 ?auto_3497529 ) ) ( CALIBRATION_TARGET ?auto_3497533 ?auto_3497532 ) ( POINTING ?auto_3497531 ?auto_3497523 ) ( not ( = ?auto_3497532 ?auto_3497523 ) ) ( ON_BOARD ?auto_3497530 ?auto_3497531 ) ( POWER_ON ?auto_3497530 ) ( not ( = ?auto_3497533 ?auto_3497530 ) ) ( HAVE_IMAGE ?auto_3497523 ?auto_3497524 ) ( HAVE_IMAGE ?auto_3497527 ?auto_3497526 ) ( not ( = ?auto_3497524 ?auto_3497522 ) ) ( not ( = ?auto_3497524 ?auto_3497526 ) ) ( not ( = ?auto_3497524 ?auto_3497529 ) ) ( not ( = ?auto_3497522 ?auto_3497526 ) ) ( not ( = ?auto_3497527 ?auto_3497532 ) ) ( not ( = ?auto_3497526 ?auto_3497529 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3497525 ?auto_3497522 ?auto_3497528 ?auto_3497529 )
      ( GET-4IMAGE-VERIFY ?auto_3497523 ?auto_3497524 ?auto_3497525 ?auto_3497522 ?auto_3497527 ?auto_3497526 ?auto_3497528 ?auto_3497529 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3497559 - DIRECTION
      ?auto_3497560 - MODE
      ?auto_3497561 - DIRECTION
      ?auto_3497558 - MODE
      ?auto_3497563 - DIRECTION
      ?auto_3497562 - MODE
      ?auto_3497564 - DIRECTION
      ?auto_3497565 - MODE
    )
    :vars
    (
      ?auto_3497569 - INSTRUMENT
      ?auto_3497567 - SATELLITE
      ?auto_3497568 - DIRECTION
      ?auto_3497566 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3497561 ?auto_3497559 ) ) ( not ( = ?auto_3497563 ?auto_3497559 ) ) ( not ( = ?auto_3497563 ?auto_3497561 ) ) ( not ( = ?auto_3497564 ?auto_3497559 ) ) ( not ( = ?auto_3497564 ?auto_3497561 ) ) ( not ( = ?auto_3497564 ?auto_3497563 ) ) ( ON_BOARD ?auto_3497569 ?auto_3497567 ) ( SUPPORTS ?auto_3497569 ?auto_3497562 ) ( not ( = ?auto_3497563 ?auto_3497568 ) ) ( HAVE_IMAGE ?auto_3497561 ?auto_3497558 ) ( not ( = ?auto_3497561 ?auto_3497568 ) ) ( not ( = ?auto_3497558 ?auto_3497562 ) ) ( CALIBRATION_TARGET ?auto_3497569 ?auto_3497568 ) ( POINTING ?auto_3497567 ?auto_3497559 ) ( not ( = ?auto_3497568 ?auto_3497559 ) ) ( ON_BOARD ?auto_3497566 ?auto_3497567 ) ( POWER_ON ?auto_3497566 ) ( not ( = ?auto_3497569 ?auto_3497566 ) ) ( HAVE_IMAGE ?auto_3497559 ?auto_3497560 ) ( HAVE_IMAGE ?auto_3497564 ?auto_3497565 ) ( not ( = ?auto_3497560 ?auto_3497558 ) ) ( not ( = ?auto_3497560 ?auto_3497562 ) ) ( not ( = ?auto_3497560 ?auto_3497565 ) ) ( not ( = ?auto_3497558 ?auto_3497565 ) ) ( not ( = ?auto_3497562 ?auto_3497565 ) ) ( not ( = ?auto_3497564 ?auto_3497568 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3497561 ?auto_3497558 ?auto_3497563 ?auto_3497562 )
      ( GET-4IMAGE-VERIFY ?auto_3497559 ?auto_3497560 ?auto_3497561 ?auto_3497558 ?auto_3497563 ?auto_3497562 ?auto_3497564 ?auto_3497565 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3497787 - DIRECTION
      ?auto_3497788 - MODE
      ?auto_3497789 - DIRECTION
      ?auto_3497786 - MODE
      ?auto_3497791 - DIRECTION
      ?auto_3497790 - MODE
      ?auto_3497792 - DIRECTION
      ?auto_3497793 - MODE
    )
    :vars
    (
      ?auto_3497797 - INSTRUMENT
      ?auto_3497795 - SATELLITE
      ?auto_3497796 - DIRECTION
      ?auto_3497794 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3497789 ?auto_3497787 ) ) ( not ( = ?auto_3497791 ?auto_3497787 ) ) ( not ( = ?auto_3497791 ?auto_3497789 ) ) ( not ( = ?auto_3497792 ?auto_3497787 ) ) ( not ( = ?auto_3497792 ?auto_3497789 ) ) ( not ( = ?auto_3497792 ?auto_3497791 ) ) ( ON_BOARD ?auto_3497797 ?auto_3497795 ) ( SUPPORTS ?auto_3497797 ?auto_3497786 ) ( not ( = ?auto_3497789 ?auto_3497796 ) ) ( HAVE_IMAGE ?auto_3497791 ?auto_3497790 ) ( not ( = ?auto_3497791 ?auto_3497796 ) ) ( not ( = ?auto_3497790 ?auto_3497786 ) ) ( CALIBRATION_TARGET ?auto_3497797 ?auto_3497796 ) ( POINTING ?auto_3497795 ?auto_3497787 ) ( not ( = ?auto_3497796 ?auto_3497787 ) ) ( ON_BOARD ?auto_3497794 ?auto_3497795 ) ( POWER_ON ?auto_3497794 ) ( not ( = ?auto_3497797 ?auto_3497794 ) ) ( HAVE_IMAGE ?auto_3497787 ?auto_3497788 ) ( HAVE_IMAGE ?auto_3497792 ?auto_3497793 ) ( not ( = ?auto_3497788 ?auto_3497786 ) ) ( not ( = ?auto_3497788 ?auto_3497790 ) ) ( not ( = ?auto_3497788 ?auto_3497793 ) ) ( not ( = ?auto_3497786 ?auto_3497793 ) ) ( not ( = ?auto_3497790 ?auto_3497793 ) ) ( not ( = ?auto_3497792 ?auto_3497796 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3497791 ?auto_3497790 ?auto_3497789 ?auto_3497786 )
      ( GET-4IMAGE-VERIFY ?auto_3497787 ?auto_3497788 ?auto_3497789 ?auto_3497786 ?auto_3497791 ?auto_3497790 ?auto_3497792 ?auto_3497793 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3498058 - DIRECTION
      ?auto_3498059 - MODE
      ?auto_3498060 - DIRECTION
      ?auto_3498057 - MODE
      ?auto_3498062 - DIRECTION
      ?auto_3498061 - MODE
      ?auto_3498063 - DIRECTION
      ?auto_3498064 - MODE
    )
    :vars
    (
      ?auto_3498068 - INSTRUMENT
      ?auto_3498066 - SATELLITE
      ?auto_3498067 - DIRECTION
      ?auto_3498065 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3498060 ?auto_3498058 ) ) ( not ( = ?auto_3498062 ?auto_3498058 ) ) ( not ( = ?auto_3498062 ?auto_3498060 ) ) ( not ( = ?auto_3498063 ?auto_3498058 ) ) ( not ( = ?auto_3498063 ?auto_3498060 ) ) ( not ( = ?auto_3498063 ?auto_3498062 ) ) ( ON_BOARD ?auto_3498068 ?auto_3498066 ) ( SUPPORTS ?auto_3498068 ?auto_3498059 ) ( not ( = ?auto_3498058 ?auto_3498067 ) ) ( HAVE_IMAGE ?auto_3498060 ?auto_3498057 ) ( not ( = ?auto_3498060 ?auto_3498067 ) ) ( not ( = ?auto_3498057 ?auto_3498059 ) ) ( CALIBRATION_TARGET ?auto_3498068 ?auto_3498067 ) ( POINTING ?auto_3498066 ?auto_3498063 ) ( not ( = ?auto_3498067 ?auto_3498063 ) ) ( ON_BOARD ?auto_3498065 ?auto_3498066 ) ( POWER_ON ?auto_3498065 ) ( not ( = ?auto_3498068 ?auto_3498065 ) ) ( HAVE_IMAGE ?auto_3498062 ?auto_3498061 ) ( HAVE_IMAGE ?auto_3498063 ?auto_3498064 ) ( not ( = ?auto_3498059 ?auto_3498061 ) ) ( not ( = ?auto_3498059 ?auto_3498064 ) ) ( not ( = ?auto_3498057 ?auto_3498061 ) ) ( not ( = ?auto_3498057 ?auto_3498064 ) ) ( not ( = ?auto_3498062 ?auto_3498067 ) ) ( not ( = ?auto_3498061 ?auto_3498064 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3498060 ?auto_3498057 ?auto_3498058 ?auto_3498059 )
      ( GET-4IMAGE-VERIFY ?auto_3498058 ?auto_3498059 ?auto_3498060 ?auto_3498057 ?auto_3498062 ?auto_3498061 ?auto_3498063 ?auto_3498064 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3498095 - DIRECTION
      ?auto_3498096 - MODE
      ?auto_3498097 - DIRECTION
      ?auto_3498094 - MODE
      ?auto_3498099 - DIRECTION
      ?auto_3498098 - MODE
      ?auto_3498100 - DIRECTION
      ?auto_3498101 - MODE
    )
    :vars
    (
      ?auto_3498105 - INSTRUMENT
      ?auto_3498103 - SATELLITE
      ?auto_3498104 - DIRECTION
      ?auto_3498102 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3498097 ?auto_3498095 ) ) ( not ( = ?auto_3498099 ?auto_3498095 ) ) ( not ( = ?auto_3498099 ?auto_3498097 ) ) ( not ( = ?auto_3498100 ?auto_3498095 ) ) ( not ( = ?auto_3498100 ?auto_3498097 ) ) ( not ( = ?auto_3498100 ?auto_3498099 ) ) ( ON_BOARD ?auto_3498105 ?auto_3498103 ) ( SUPPORTS ?auto_3498105 ?auto_3498096 ) ( not ( = ?auto_3498095 ?auto_3498104 ) ) ( HAVE_IMAGE ?auto_3498097 ?auto_3498094 ) ( not ( = ?auto_3498097 ?auto_3498104 ) ) ( not ( = ?auto_3498094 ?auto_3498096 ) ) ( CALIBRATION_TARGET ?auto_3498105 ?auto_3498104 ) ( POINTING ?auto_3498103 ?auto_3498099 ) ( not ( = ?auto_3498104 ?auto_3498099 ) ) ( ON_BOARD ?auto_3498102 ?auto_3498103 ) ( POWER_ON ?auto_3498102 ) ( not ( = ?auto_3498105 ?auto_3498102 ) ) ( HAVE_IMAGE ?auto_3498099 ?auto_3498098 ) ( HAVE_IMAGE ?auto_3498100 ?auto_3498101 ) ( not ( = ?auto_3498096 ?auto_3498098 ) ) ( not ( = ?auto_3498096 ?auto_3498101 ) ) ( not ( = ?auto_3498094 ?auto_3498098 ) ) ( not ( = ?auto_3498094 ?auto_3498101 ) ) ( not ( = ?auto_3498098 ?auto_3498101 ) ) ( not ( = ?auto_3498100 ?auto_3498104 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3498097 ?auto_3498094 ?auto_3498095 ?auto_3498096 )
      ( GET-4IMAGE-VERIFY ?auto_3498095 ?auto_3498096 ?auto_3498097 ?auto_3498094 ?auto_3498099 ?auto_3498098 ?auto_3498100 ?auto_3498101 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3498405 - DIRECTION
      ?auto_3498406 - MODE
      ?auto_3498407 - DIRECTION
      ?auto_3498404 - MODE
      ?auto_3498409 - DIRECTION
      ?auto_3498408 - MODE
      ?auto_3498410 - DIRECTION
      ?auto_3498411 - MODE
    )
    :vars
    (
      ?auto_3498415 - INSTRUMENT
      ?auto_3498413 - SATELLITE
      ?auto_3498414 - DIRECTION
      ?auto_3498412 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3498407 ?auto_3498405 ) ) ( not ( = ?auto_3498409 ?auto_3498405 ) ) ( not ( = ?auto_3498409 ?auto_3498407 ) ) ( not ( = ?auto_3498410 ?auto_3498405 ) ) ( not ( = ?auto_3498410 ?auto_3498407 ) ) ( not ( = ?auto_3498410 ?auto_3498409 ) ) ( ON_BOARD ?auto_3498415 ?auto_3498413 ) ( SUPPORTS ?auto_3498415 ?auto_3498406 ) ( not ( = ?auto_3498405 ?auto_3498414 ) ) ( HAVE_IMAGE ?auto_3498409 ?auto_3498408 ) ( not ( = ?auto_3498409 ?auto_3498414 ) ) ( not ( = ?auto_3498408 ?auto_3498406 ) ) ( CALIBRATION_TARGET ?auto_3498415 ?auto_3498414 ) ( POINTING ?auto_3498413 ?auto_3498407 ) ( not ( = ?auto_3498414 ?auto_3498407 ) ) ( ON_BOARD ?auto_3498412 ?auto_3498413 ) ( POWER_ON ?auto_3498412 ) ( not ( = ?auto_3498415 ?auto_3498412 ) ) ( HAVE_IMAGE ?auto_3498407 ?auto_3498404 ) ( HAVE_IMAGE ?auto_3498410 ?auto_3498411 ) ( not ( = ?auto_3498406 ?auto_3498404 ) ) ( not ( = ?auto_3498406 ?auto_3498411 ) ) ( not ( = ?auto_3498404 ?auto_3498408 ) ) ( not ( = ?auto_3498404 ?auto_3498411 ) ) ( not ( = ?auto_3498408 ?auto_3498411 ) ) ( not ( = ?auto_3498410 ?auto_3498414 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3498409 ?auto_3498408 ?auto_3498405 ?auto_3498406 )
      ( GET-4IMAGE-VERIFY ?auto_3498405 ?auto_3498406 ?auto_3498407 ?auto_3498404 ?auto_3498409 ?auto_3498408 ?auto_3498410 ?auto_3498411 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3539110 - DIRECTION
      ?auto_3539111 - MODE
      ?auto_3539112 - DIRECTION
      ?auto_3539109 - MODE
      ?auto_3539114 - DIRECTION
      ?auto_3539113 - MODE
    )
    :vars
    (
      ?auto_3539117 - INSTRUMENT
      ?auto_3539118 - SATELLITE
      ?auto_3539115 - DIRECTION
      ?auto_3539116 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3539112 ?auto_3539110 ) ) ( not ( = ?auto_3539114 ?auto_3539110 ) ) ( not ( = ?auto_3539114 ?auto_3539112 ) ) ( ON_BOARD ?auto_3539117 ?auto_3539118 ) ( SUPPORTS ?auto_3539117 ?auto_3539113 ) ( not ( = ?auto_3539114 ?auto_3539115 ) ) ( HAVE_IMAGE ?auto_3539110 ?auto_3539111 ) ( not ( = ?auto_3539110 ?auto_3539115 ) ) ( not ( = ?auto_3539111 ?auto_3539113 ) ) ( CALIBRATION_TARGET ?auto_3539117 ?auto_3539115 ) ( not ( = ?auto_3539115 ?auto_3539112 ) ) ( ON_BOARD ?auto_3539116 ?auto_3539118 ) ( POWER_ON ?auto_3539116 ) ( not ( = ?auto_3539117 ?auto_3539116 ) ) ( POINTING ?auto_3539118 ?auto_3539115 ) ( HAVE_IMAGE ?auto_3539112 ?auto_3539109 ) ( not ( = ?auto_3539111 ?auto_3539109 ) ) ( not ( = ?auto_3539109 ?auto_3539113 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3539110 ?auto_3539111 ?auto_3539114 ?auto_3539113 )
      ( GET-3IMAGE-VERIFY ?auto_3539110 ?auto_3539111 ?auto_3539112 ?auto_3539109 ?auto_3539114 ?auto_3539113 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3539142 - DIRECTION
      ?auto_3539143 - MODE
      ?auto_3539144 - DIRECTION
      ?auto_3539141 - MODE
      ?auto_3539146 - DIRECTION
      ?auto_3539145 - MODE
    )
    :vars
    (
      ?auto_3539149 - INSTRUMENT
      ?auto_3539150 - SATELLITE
      ?auto_3539147 - DIRECTION
      ?auto_3539148 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3539144 ?auto_3539142 ) ) ( not ( = ?auto_3539146 ?auto_3539142 ) ) ( not ( = ?auto_3539146 ?auto_3539144 ) ) ( ON_BOARD ?auto_3539149 ?auto_3539150 ) ( SUPPORTS ?auto_3539149 ?auto_3539141 ) ( not ( = ?auto_3539144 ?auto_3539147 ) ) ( HAVE_IMAGE ?auto_3539142 ?auto_3539143 ) ( not ( = ?auto_3539142 ?auto_3539147 ) ) ( not ( = ?auto_3539143 ?auto_3539141 ) ) ( CALIBRATION_TARGET ?auto_3539149 ?auto_3539147 ) ( not ( = ?auto_3539147 ?auto_3539146 ) ) ( ON_BOARD ?auto_3539148 ?auto_3539150 ) ( POWER_ON ?auto_3539148 ) ( not ( = ?auto_3539149 ?auto_3539148 ) ) ( POINTING ?auto_3539150 ?auto_3539147 ) ( HAVE_IMAGE ?auto_3539146 ?auto_3539145 ) ( not ( = ?auto_3539143 ?auto_3539145 ) ) ( not ( = ?auto_3539141 ?auto_3539145 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3539142 ?auto_3539143 ?auto_3539144 ?auto_3539141 )
      ( GET-3IMAGE-VERIFY ?auto_3539142 ?auto_3539143 ?auto_3539144 ?auto_3539141 ?auto_3539146 ?auto_3539145 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3524834 - DIRECTION
      ?auto_3524835 - MODE
      ?auto_3524836 - DIRECTION
      ?auto_3524833 - MODE
      ?auto_3524838 - DIRECTION
      ?auto_3524837 - MODE
    )
    :vars
    (
      ?auto_3524842 - INSTRUMENT
      ?auto_3524840 - SATELLITE
      ?auto_3524839 - DIRECTION
      ?auto_3524841 - DIRECTION
      ?auto_3524843 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3524836 ?auto_3524834 ) ) ( not ( = ?auto_3524838 ?auto_3524834 ) ) ( not ( = ?auto_3524838 ?auto_3524836 ) ) ( ON_BOARD ?auto_3524842 ?auto_3524840 ) ( SUPPORTS ?auto_3524842 ?auto_3524837 ) ( not ( = ?auto_3524838 ?auto_3524839 ) ) ( HAVE_IMAGE ?auto_3524836 ?auto_3524833 ) ( not ( = ?auto_3524836 ?auto_3524839 ) ) ( not ( = ?auto_3524833 ?auto_3524837 ) ) ( CALIBRATION_TARGET ?auto_3524842 ?auto_3524839 ) ( not ( = ?auto_3524839 ?auto_3524841 ) ) ( not ( = ?auto_3524838 ?auto_3524841 ) ) ( not ( = ?auto_3524836 ?auto_3524841 ) ) ( ON_BOARD ?auto_3524843 ?auto_3524840 ) ( POWER_ON ?auto_3524843 ) ( not ( = ?auto_3524842 ?auto_3524843 ) ) ( POINTING ?auto_3524840 ?auto_3524839 ) ( HAVE_IMAGE ?auto_3524834 ?auto_3524835 ) ( not ( = ?auto_3524834 ?auto_3524839 ) ) ( not ( = ?auto_3524834 ?auto_3524841 ) ) ( not ( = ?auto_3524835 ?auto_3524833 ) ) ( not ( = ?auto_3524835 ?auto_3524837 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3524836 ?auto_3524833 ?auto_3524838 ?auto_3524837 )
      ( GET-3IMAGE-VERIFY ?auto_3524834 ?auto_3524835 ?auto_3524836 ?auto_3524833 ?auto_3524838 ?auto_3524837 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3524870 - DIRECTION
      ?auto_3524871 - MODE
      ?auto_3524872 - DIRECTION
      ?auto_3524869 - MODE
      ?auto_3524874 - DIRECTION
      ?auto_3524873 - MODE
    )
    :vars
    (
      ?auto_3524878 - INSTRUMENT
      ?auto_3524876 - SATELLITE
      ?auto_3524875 - DIRECTION
      ?auto_3524877 - DIRECTION
      ?auto_3524879 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3524872 ?auto_3524870 ) ) ( not ( = ?auto_3524874 ?auto_3524870 ) ) ( not ( = ?auto_3524874 ?auto_3524872 ) ) ( ON_BOARD ?auto_3524878 ?auto_3524876 ) ( SUPPORTS ?auto_3524878 ?auto_3524869 ) ( not ( = ?auto_3524872 ?auto_3524875 ) ) ( HAVE_IMAGE ?auto_3524874 ?auto_3524873 ) ( not ( = ?auto_3524874 ?auto_3524875 ) ) ( not ( = ?auto_3524873 ?auto_3524869 ) ) ( CALIBRATION_TARGET ?auto_3524878 ?auto_3524875 ) ( not ( = ?auto_3524875 ?auto_3524877 ) ) ( not ( = ?auto_3524872 ?auto_3524877 ) ) ( not ( = ?auto_3524874 ?auto_3524877 ) ) ( ON_BOARD ?auto_3524879 ?auto_3524876 ) ( POWER_ON ?auto_3524879 ) ( not ( = ?auto_3524878 ?auto_3524879 ) ) ( POINTING ?auto_3524876 ?auto_3524875 ) ( HAVE_IMAGE ?auto_3524870 ?auto_3524871 ) ( not ( = ?auto_3524870 ?auto_3524875 ) ) ( not ( = ?auto_3524870 ?auto_3524877 ) ) ( not ( = ?auto_3524871 ?auto_3524869 ) ) ( not ( = ?auto_3524871 ?auto_3524873 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3524874 ?auto_3524873 ?auto_3524872 ?auto_3524869 )
      ( GET-3IMAGE-VERIFY ?auto_3524870 ?auto_3524871 ?auto_3524872 ?auto_3524869 ?auto_3524874 ?auto_3524873 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3539342 - DIRECTION
      ?auto_3539343 - MODE
      ?auto_3539344 - DIRECTION
      ?auto_3539341 - MODE
      ?auto_3539346 - DIRECTION
      ?auto_3539345 - MODE
    )
    :vars
    (
      ?auto_3539349 - INSTRUMENT
      ?auto_3539350 - SATELLITE
      ?auto_3539347 - DIRECTION
      ?auto_3539348 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3539344 ?auto_3539342 ) ) ( not ( = ?auto_3539346 ?auto_3539342 ) ) ( not ( = ?auto_3539346 ?auto_3539344 ) ) ( ON_BOARD ?auto_3539349 ?auto_3539350 ) ( SUPPORTS ?auto_3539349 ?auto_3539343 ) ( not ( = ?auto_3539342 ?auto_3539347 ) ) ( HAVE_IMAGE ?auto_3539344 ?auto_3539341 ) ( not ( = ?auto_3539344 ?auto_3539347 ) ) ( not ( = ?auto_3539341 ?auto_3539343 ) ) ( CALIBRATION_TARGET ?auto_3539349 ?auto_3539347 ) ( not ( = ?auto_3539347 ?auto_3539346 ) ) ( ON_BOARD ?auto_3539348 ?auto_3539350 ) ( POWER_ON ?auto_3539348 ) ( not ( = ?auto_3539349 ?auto_3539348 ) ) ( POINTING ?auto_3539350 ?auto_3539347 ) ( HAVE_IMAGE ?auto_3539346 ?auto_3539345 ) ( not ( = ?auto_3539343 ?auto_3539345 ) ) ( not ( = ?auto_3539341 ?auto_3539345 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3539344 ?auto_3539341 ?auto_3539342 ?auto_3539343 )
      ( GET-3IMAGE-VERIFY ?auto_3539342 ?auto_3539343 ?auto_3539344 ?auto_3539341 ?auto_3539346 ?auto_3539345 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3525042 - DIRECTION
      ?auto_3525043 - MODE
      ?auto_3525044 - DIRECTION
      ?auto_3525041 - MODE
      ?auto_3525046 - DIRECTION
      ?auto_3525045 - MODE
    )
    :vars
    (
      ?auto_3525050 - INSTRUMENT
      ?auto_3525048 - SATELLITE
      ?auto_3525047 - DIRECTION
      ?auto_3525049 - DIRECTION
      ?auto_3525051 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3525044 ?auto_3525042 ) ) ( not ( = ?auto_3525046 ?auto_3525042 ) ) ( not ( = ?auto_3525046 ?auto_3525044 ) ) ( ON_BOARD ?auto_3525050 ?auto_3525048 ) ( SUPPORTS ?auto_3525050 ?auto_3525043 ) ( not ( = ?auto_3525042 ?auto_3525047 ) ) ( HAVE_IMAGE ?auto_3525046 ?auto_3525045 ) ( not ( = ?auto_3525046 ?auto_3525047 ) ) ( not ( = ?auto_3525045 ?auto_3525043 ) ) ( CALIBRATION_TARGET ?auto_3525050 ?auto_3525047 ) ( not ( = ?auto_3525047 ?auto_3525049 ) ) ( not ( = ?auto_3525042 ?auto_3525049 ) ) ( not ( = ?auto_3525046 ?auto_3525049 ) ) ( ON_BOARD ?auto_3525051 ?auto_3525048 ) ( POWER_ON ?auto_3525051 ) ( not ( = ?auto_3525050 ?auto_3525051 ) ) ( POINTING ?auto_3525048 ?auto_3525047 ) ( HAVE_IMAGE ?auto_3525044 ?auto_3525041 ) ( not ( = ?auto_3525043 ?auto_3525041 ) ) ( not ( = ?auto_3525044 ?auto_3525047 ) ) ( not ( = ?auto_3525044 ?auto_3525049 ) ) ( not ( = ?auto_3525041 ?auto_3525045 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3525046 ?auto_3525045 ?auto_3525042 ?auto_3525043 )
      ( GET-3IMAGE-VERIFY ?auto_3525042 ?auto_3525043 ?auto_3525044 ?auto_3525041 ?auto_3525046 ?auto_3525045 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3774724 - DIRECTION
      ?auto_3774725 - MODE
      ?auto_3774726 - DIRECTION
      ?auto_3774723 - MODE
      ?auto_3774728 - DIRECTION
      ?auto_3774727 - MODE
      ?auto_3774729 - DIRECTION
      ?auto_3774730 - MODE
      ?auto_3774731 - DIRECTION
      ?auto_3774732 - MODE
    )
    :vars
    (
      ?auto_3774734 - INSTRUMENT
      ?auto_3774733 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_3774726 ?auto_3774724 ) ) ( not ( = ?auto_3774728 ?auto_3774724 ) ) ( not ( = ?auto_3774728 ?auto_3774726 ) ) ( not ( = ?auto_3774729 ?auto_3774724 ) ) ( not ( = ?auto_3774729 ?auto_3774726 ) ) ( not ( = ?auto_3774729 ?auto_3774728 ) ) ( not ( = ?auto_3774731 ?auto_3774724 ) ) ( not ( = ?auto_3774731 ?auto_3774726 ) ) ( not ( = ?auto_3774731 ?auto_3774728 ) ) ( not ( = ?auto_3774731 ?auto_3774729 ) ) ( CALIBRATED ?auto_3774734 ) ( ON_BOARD ?auto_3774734 ?auto_3774733 ) ( SUPPORTS ?auto_3774734 ?auto_3774732 ) ( POWER_ON ?auto_3774734 ) ( POINTING ?auto_3774733 ?auto_3774731 ) ( HAVE_IMAGE ?auto_3774724 ?auto_3774725 ) ( HAVE_IMAGE ?auto_3774726 ?auto_3774723 ) ( HAVE_IMAGE ?auto_3774728 ?auto_3774727 ) ( HAVE_IMAGE ?auto_3774729 ?auto_3774730 ) ( not ( = ?auto_3774725 ?auto_3774723 ) ) ( not ( = ?auto_3774725 ?auto_3774727 ) ) ( not ( = ?auto_3774725 ?auto_3774730 ) ) ( not ( = ?auto_3774725 ?auto_3774732 ) ) ( not ( = ?auto_3774723 ?auto_3774727 ) ) ( not ( = ?auto_3774723 ?auto_3774730 ) ) ( not ( = ?auto_3774723 ?auto_3774732 ) ) ( not ( = ?auto_3774727 ?auto_3774730 ) ) ( not ( = ?auto_3774727 ?auto_3774732 ) ) ( not ( = ?auto_3774730 ?auto_3774732 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3774731 ?auto_3774732 )
      ( GET-5IMAGE-VERIFY ?auto_3774724 ?auto_3774725 ?auto_3774726 ?auto_3774723 ?auto_3774728 ?auto_3774727 ?auto_3774729 ?auto_3774730 ?auto_3774731 ?auto_3774732 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3774772 - DIRECTION
      ?auto_3774773 - MODE
      ?auto_3774774 - DIRECTION
      ?auto_3774771 - MODE
      ?auto_3774776 - DIRECTION
      ?auto_3774775 - MODE
      ?auto_3774777 - DIRECTION
      ?auto_3774778 - MODE
      ?auto_3774779 - DIRECTION
      ?auto_3774780 - MODE
    )
    :vars
    (
      ?auto_3774782 - INSTRUMENT
      ?auto_3774781 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_3774774 ?auto_3774772 ) ) ( not ( = ?auto_3774776 ?auto_3774772 ) ) ( not ( = ?auto_3774776 ?auto_3774774 ) ) ( not ( = ?auto_3774777 ?auto_3774772 ) ) ( not ( = ?auto_3774777 ?auto_3774774 ) ) ( not ( = ?auto_3774777 ?auto_3774776 ) ) ( not ( = ?auto_3774779 ?auto_3774772 ) ) ( not ( = ?auto_3774779 ?auto_3774774 ) ) ( not ( = ?auto_3774779 ?auto_3774776 ) ) ( not ( = ?auto_3774779 ?auto_3774777 ) ) ( CALIBRATED ?auto_3774782 ) ( ON_BOARD ?auto_3774782 ?auto_3774781 ) ( SUPPORTS ?auto_3774782 ?auto_3774778 ) ( POWER_ON ?auto_3774782 ) ( POINTING ?auto_3774781 ?auto_3774777 ) ( HAVE_IMAGE ?auto_3774772 ?auto_3774773 ) ( HAVE_IMAGE ?auto_3774774 ?auto_3774771 ) ( HAVE_IMAGE ?auto_3774776 ?auto_3774775 ) ( HAVE_IMAGE ?auto_3774779 ?auto_3774780 ) ( not ( = ?auto_3774773 ?auto_3774771 ) ) ( not ( = ?auto_3774773 ?auto_3774775 ) ) ( not ( = ?auto_3774773 ?auto_3774778 ) ) ( not ( = ?auto_3774773 ?auto_3774780 ) ) ( not ( = ?auto_3774771 ?auto_3774775 ) ) ( not ( = ?auto_3774771 ?auto_3774778 ) ) ( not ( = ?auto_3774771 ?auto_3774780 ) ) ( not ( = ?auto_3774775 ?auto_3774778 ) ) ( not ( = ?auto_3774775 ?auto_3774780 ) ) ( not ( = ?auto_3774778 ?auto_3774780 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3774777 ?auto_3774778 )
      ( GET-5IMAGE-VERIFY ?auto_3774772 ?auto_3774773 ?auto_3774774 ?auto_3774771 ?auto_3774776 ?auto_3774775 ?auto_3774777 ?auto_3774778 ?auto_3774779 ?auto_3774780 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3775056 - DIRECTION
      ?auto_3775057 - MODE
      ?auto_3775058 - DIRECTION
      ?auto_3775055 - MODE
      ?auto_3775060 - DIRECTION
      ?auto_3775059 - MODE
      ?auto_3775061 - DIRECTION
      ?auto_3775062 - MODE
      ?auto_3775063 - DIRECTION
      ?auto_3775064 - MODE
    )
    :vars
    (
      ?auto_3775066 - INSTRUMENT
      ?auto_3775065 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_3775058 ?auto_3775056 ) ) ( not ( = ?auto_3775060 ?auto_3775056 ) ) ( not ( = ?auto_3775060 ?auto_3775058 ) ) ( not ( = ?auto_3775061 ?auto_3775056 ) ) ( not ( = ?auto_3775061 ?auto_3775058 ) ) ( not ( = ?auto_3775061 ?auto_3775060 ) ) ( not ( = ?auto_3775063 ?auto_3775056 ) ) ( not ( = ?auto_3775063 ?auto_3775058 ) ) ( not ( = ?auto_3775063 ?auto_3775060 ) ) ( not ( = ?auto_3775063 ?auto_3775061 ) ) ( CALIBRATED ?auto_3775066 ) ( ON_BOARD ?auto_3775066 ?auto_3775065 ) ( SUPPORTS ?auto_3775066 ?auto_3775059 ) ( POWER_ON ?auto_3775066 ) ( POINTING ?auto_3775065 ?auto_3775060 ) ( HAVE_IMAGE ?auto_3775056 ?auto_3775057 ) ( HAVE_IMAGE ?auto_3775058 ?auto_3775055 ) ( HAVE_IMAGE ?auto_3775061 ?auto_3775062 ) ( HAVE_IMAGE ?auto_3775063 ?auto_3775064 ) ( not ( = ?auto_3775057 ?auto_3775055 ) ) ( not ( = ?auto_3775057 ?auto_3775059 ) ) ( not ( = ?auto_3775057 ?auto_3775062 ) ) ( not ( = ?auto_3775057 ?auto_3775064 ) ) ( not ( = ?auto_3775055 ?auto_3775059 ) ) ( not ( = ?auto_3775055 ?auto_3775062 ) ) ( not ( = ?auto_3775055 ?auto_3775064 ) ) ( not ( = ?auto_3775059 ?auto_3775062 ) ) ( not ( = ?auto_3775059 ?auto_3775064 ) ) ( not ( = ?auto_3775062 ?auto_3775064 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3775060 ?auto_3775059 )
      ( GET-5IMAGE-VERIFY ?auto_3775056 ?auto_3775057 ?auto_3775058 ?auto_3775055 ?auto_3775060 ?auto_3775059 ?auto_3775061 ?auto_3775062 ?auto_3775063 ?auto_3775064 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3777094 - DIRECTION
      ?auto_3777095 - MODE
      ?auto_3777096 - DIRECTION
      ?auto_3777093 - MODE
      ?auto_3777098 - DIRECTION
      ?auto_3777097 - MODE
      ?auto_3777099 - DIRECTION
      ?auto_3777100 - MODE
      ?auto_3777101 - DIRECTION
      ?auto_3777102 - MODE
    )
    :vars
    (
      ?auto_3777104 - INSTRUMENT
      ?auto_3777103 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_3777096 ?auto_3777094 ) ) ( not ( = ?auto_3777098 ?auto_3777094 ) ) ( not ( = ?auto_3777098 ?auto_3777096 ) ) ( not ( = ?auto_3777099 ?auto_3777094 ) ) ( not ( = ?auto_3777099 ?auto_3777096 ) ) ( not ( = ?auto_3777099 ?auto_3777098 ) ) ( not ( = ?auto_3777101 ?auto_3777094 ) ) ( not ( = ?auto_3777101 ?auto_3777096 ) ) ( not ( = ?auto_3777101 ?auto_3777098 ) ) ( not ( = ?auto_3777101 ?auto_3777099 ) ) ( CALIBRATED ?auto_3777104 ) ( ON_BOARD ?auto_3777104 ?auto_3777103 ) ( SUPPORTS ?auto_3777104 ?auto_3777093 ) ( POWER_ON ?auto_3777104 ) ( POINTING ?auto_3777103 ?auto_3777096 ) ( HAVE_IMAGE ?auto_3777094 ?auto_3777095 ) ( HAVE_IMAGE ?auto_3777098 ?auto_3777097 ) ( HAVE_IMAGE ?auto_3777099 ?auto_3777100 ) ( HAVE_IMAGE ?auto_3777101 ?auto_3777102 ) ( not ( = ?auto_3777095 ?auto_3777093 ) ) ( not ( = ?auto_3777095 ?auto_3777097 ) ) ( not ( = ?auto_3777095 ?auto_3777100 ) ) ( not ( = ?auto_3777095 ?auto_3777102 ) ) ( not ( = ?auto_3777093 ?auto_3777097 ) ) ( not ( = ?auto_3777093 ?auto_3777100 ) ) ( not ( = ?auto_3777093 ?auto_3777102 ) ) ( not ( = ?auto_3777097 ?auto_3777100 ) ) ( not ( = ?auto_3777097 ?auto_3777102 ) ) ( not ( = ?auto_3777100 ?auto_3777102 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3777096 ?auto_3777093 )
      ( GET-5IMAGE-VERIFY ?auto_3777094 ?auto_3777095 ?auto_3777096 ?auto_3777093 ?auto_3777098 ?auto_3777097 ?auto_3777099 ?auto_3777100 ?auto_3777101 ?auto_3777102 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3791724 - DIRECTION
      ?auto_3791725 - MODE
      ?auto_3791726 - DIRECTION
      ?auto_3791723 - MODE
      ?auto_3791728 - DIRECTION
      ?auto_3791727 - MODE
      ?auto_3791729 - DIRECTION
      ?auto_3791730 - MODE
      ?auto_3791731 - DIRECTION
      ?auto_3791732 - MODE
    )
    :vars
    (
      ?auto_3791734 - INSTRUMENT
      ?auto_3791733 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_3791726 ?auto_3791724 ) ) ( not ( = ?auto_3791728 ?auto_3791724 ) ) ( not ( = ?auto_3791728 ?auto_3791726 ) ) ( not ( = ?auto_3791729 ?auto_3791724 ) ) ( not ( = ?auto_3791729 ?auto_3791726 ) ) ( not ( = ?auto_3791729 ?auto_3791728 ) ) ( not ( = ?auto_3791731 ?auto_3791724 ) ) ( not ( = ?auto_3791731 ?auto_3791726 ) ) ( not ( = ?auto_3791731 ?auto_3791728 ) ) ( not ( = ?auto_3791731 ?auto_3791729 ) ) ( CALIBRATED ?auto_3791734 ) ( ON_BOARD ?auto_3791734 ?auto_3791733 ) ( SUPPORTS ?auto_3791734 ?auto_3791725 ) ( POWER_ON ?auto_3791734 ) ( POINTING ?auto_3791733 ?auto_3791724 ) ( HAVE_IMAGE ?auto_3791726 ?auto_3791723 ) ( HAVE_IMAGE ?auto_3791728 ?auto_3791727 ) ( HAVE_IMAGE ?auto_3791729 ?auto_3791730 ) ( HAVE_IMAGE ?auto_3791731 ?auto_3791732 ) ( not ( = ?auto_3791725 ?auto_3791723 ) ) ( not ( = ?auto_3791725 ?auto_3791727 ) ) ( not ( = ?auto_3791725 ?auto_3791730 ) ) ( not ( = ?auto_3791725 ?auto_3791732 ) ) ( not ( = ?auto_3791723 ?auto_3791727 ) ) ( not ( = ?auto_3791723 ?auto_3791730 ) ) ( not ( = ?auto_3791723 ?auto_3791732 ) ) ( not ( = ?auto_3791727 ?auto_3791730 ) ) ( not ( = ?auto_3791727 ?auto_3791732 ) ) ( not ( = ?auto_3791730 ?auto_3791732 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3791724 ?auto_3791725 )
      ( GET-5IMAGE-VERIFY ?auto_3791724 ?auto_3791725 ?auto_3791726 ?auto_3791723 ?auto_3791728 ?auto_3791727 ?auto_3791729 ?auto_3791730 ?auto_3791731 ?auto_3791732 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3804413 - DIRECTION
      ?auto_3804414 - MODE
      ?auto_3804415 - DIRECTION
      ?auto_3804412 - MODE
      ?auto_3804417 - DIRECTION
      ?auto_3804416 - MODE
      ?auto_3804418 - DIRECTION
      ?auto_3804419 - MODE
      ?auto_3804420 - DIRECTION
      ?auto_3804421 - MODE
    )
    :vars
    (
      ?auto_3804423 - INSTRUMENT
      ?auto_3804424 - SATELLITE
      ?auto_3804422 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3804415 ?auto_3804413 ) ) ( not ( = ?auto_3804417 ?auto_3804413 ) ) ( not ( = ?auto_3804417 ?auto_3804415 ) ) ( not ( = ?auto_3804418 ?auto_3804413 ) ) ( not ( = ?auto_3804418 ?auto_3804415 ) ) ( not ( = ?auto_3804418 ?auto_3804417 ) ) ( not ( = ?auto_3804420 ?auto_3804413 ) ) ( not ( = ?auto_3804420 ?auto_3804415 ) ) ( not ( = ?auto_3804420 ?auto_3804417 ) ) ( not ( = ?auto_3804420 ?auto_3804418 ) ) ( CALIBRATED ?auto_3804423 ) ( ON_BOARD ?auto_3804423 ?auto_3804424 ) ( SUPPORTS ?auto_3804423 ?auto_3804421 ) ( POWER_ON ?auto_3804423 ) ( POINTING ?auto_3804424 ?auto_3804422 ) ( not ( = ?auto_3804420 ?auto_3804422 ) ) ( HAVE_IMAGE ?auto_3804413 ?auto_3804414 ) ( not ( = ?auto_3804413 ?auto_3804422 ) ) ( not ( = ?auto_3804414 ?auto_3804421 ) ) ( HAVE_IMAGE ?auto_3804415 ?auto_3804412 ) ( HAVE_IMAGE ?auto_3804417 ?auto_3804416 ) ( HAVE_IMAGE ?auto_3804418 ?auto_3804419 ) ( not ( = ?auto_3804414 ?auto_3804412 ) ) ( not ( = ?auto_3804414 ?auto_3804416 ) ) ( not ( = ?auto_3804414 ?auto_3804419 ) ) ( not ( = ?auto_3804415 ?auto_3804422 ) ) ( not ( = ?auto_3804412 ?auto_3804416 ) ) ( not ( = ?auto_3804412 ?auto_3804419 ) ) ( not ( = ?auto_3804412 ?auto_3804421 ) ) ( not ( = ?auto_3804417 ?auto_3804422 ) ) ( not ( = ?auto_3804416 ?auto_3804419 ) ) ( not ( = ?auto_3804416 ?auto_3804421 ) ) ( not ( = ?auto_3804418 ?auto_3804422 ) ) ( not ( = ?auto_3804419 ?auto_3804421 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3804413 ?auto_3804414 ?auto_3804420 ?auto_3804421 )
      ( GET-5IMAGE-VERIFY ?auto_3804413 ?auto_3804414 ?auto_3804415 ?auto_3804412 ?auto_3804417 ?auto_3804416 ?auto_3804418 ?auto_3804419 ?auto_3804420 ?auto_3804421 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3804465 - DIRECTION
      ?auto_3804466 - MODE
      ?auto_3804467 - DIRECTION
      ?auto_3804464 - MODE
      ?auto_3804469 - DIRECTION
      ?auto_3804468 - MODE
      ?auto_3804470 - DIRECTION
      ?auto_3804471 - MODE
      ?auto_3804472 - DIRECTION
      ?auto_3804473 - MODE
    )
    :vars
    (
      ?auto_3804475 - INSTRUMENT
      ?auto_3804476 - SATELLITE
      ?auto_3804474 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3804467 ?auto_3804465 ) ) ( not ( = ?auto_3804469 ?auto_3804465 ) ) ( not ( = ?auto_3804469 ?auto_3804467 ) ) ( not ( = ?auto_3804470 ?auto_3804465 ) ) ( not ( = ?auto_3804470 ?auto_3804467 ) ) ( not ( = ?auto_3804470 ?auto_3804469 ) ) ( not ( = ?auto_3804472 ?auto_3804465 ) ) ( not ( = ?auto_3804472 ?auto_3804467 ) ) ( not ( = ?auto_3804472 ?auto_3804469 ) ) ( not ( = ?auto_3804472 ?auto_3804470 ) ) ( CALIBRATED ?auto_3804475 ) ( ON_BOARD ?auto_3804475 ?auto_3804476 ) ( SUPPORTS ?auto_3804475 ?auto_3804471 ) ( POWER_ON ?auto_3804475 ) ( POINTING ?auto_3804476 ?auto_3804474 ) ( not ( = ?auto_3804470 ?auto_3804474 ) ) ( HAVE_IMAGE ?auto_3804465 ?auto_3804466 ) ( not ( = ?auto_3804465 ?auto_3804474 ) ) ( not ( = ?auto_3804466 ?auto_3804471 ) ) ( HAVE_IMAGE ?auto_3804467 ?auto_3804464 ) ( HAVE_IMAGE ?auto_3804469 ?auto_3804468 ) ( HAVE_IMAGE ?auto_3804472 ?auto_3804473 ) ( not ( = ?auto_3804466 ?auto_3804464 ) ) ( not ( = ?auto_3804466 ?auto_3804468 ) ) ( not ( = ?auto_3804466 ?auto_3804473 ) ) ( not ( = ?auto_3804467 ?auto_3804474 ) ) ( not ( = ?auto_3804464 ?auto_3804468 ) ) ( not ( = ?auto_3804464 ?auto_3804471 ) ) ( not ( = ?auto_3804464 ?auto_3804473 ) ) ( not ( = ?auto_3804469 ?auto_3804474 ) ) ( not ( = ?auto_3804468 ?auto_3804471 ) ) ( not ( = ?auto_3804468 ?auto_3804473 ) ) ( not ( = ?auto_3804471 ?auto_3804473 ) ) ( not ( = ?auto_3804472 ?auto_3804474 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3804465 ?auto_3804466 ?auto_3804470 ?auto_3804471 )
      ( GET-5IMAGE-VERIFY ?auto_3804465 ?auto_3804466 ?auto_3804467 ?auto_3804464 ?auto_3804469 ?auto_3804468 ?auto_3804470 ?auto_3804471 ?auto_3804472 ?auto_3804473 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3804771 - DIRECTION
      ?auto_3804772 - MODE
      ?auto_3804773 - DIRECTION
      ?auto_3804770 - MODE
      ?auto_3804775 - DIRECTION
      ?auto_3804774 - MODE
      ?auto_3804776 - DIRECTION
      ?auto_3804777 - MODE
      ?auto_3804778 - DIRECTION
      ?auto_3804779 - MODE
    )
    :vars
    (
      ?auto_3804781 - INSTRUMENT
      ?auto_3804782 - SATELLITE
      ?auto_3804780 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3804773 ?auto_3804771 ) ) ( not ( = ?auto_3804775 ?auto_3804771 ) ) ( not ( = ?auto_3804775 ?auto_3804773 ) ) ( not ( = ?auto_3804776 ?auto_3804771 ) ) ( not ( = ?auto_3804776 ?auto_3804773 ) ) ( not ( = ?auto_3804776 ?auto_3804775 ) ) ( not ( = ?auto_3804778 ?auto_3804771 ) ) ( not ( = ?auto_3804778 ?auto_3804773 ) ) ( not ( = ?auto_3804778 ?auto_3804775 ) ) ( not ( = ?auto_3804778 ?auto_3804776 ) ) ( CALIBRATED ?auto_3804781 ) ( ON_BOARD ?auto_3804781 ?auto_3804782 ) ( SUPPORTS ?auto_3804781 ?auto_3804774 ) ( POWER_ON ?auto_3804781 ) ( POINTING ?auto_3804782 ?auto_3804780 ) ( not ( = ?auto_3804775 ?auto_3804780 ) ) ( HAVE_IMAGE ?auto_3804771 ?auto_3804772 ) ( not ( = ?auto_3804771 ?auto_3804780 ) ) ( not ( = ?auto_3804772 ?auto_3804774 ) ) ( HAVE_IMAGE ?auto_3804773 ?auto_3804770 ) ( HAVE_IMAGE ?auto_3804776 ?auto_3804777 ) ( HAVE_IMAGE ?auto_3804778 ?auto_3804779 ) ( not ( = ?auto_3804772 ?auto_3804770 ) ) ( not ( = ?auto_3804772 ?auto_3804777 ) ) ( not ( = ?auto_3804772 ?auto_3804779 ) ) ( not ( = ?auto_3804773 ?auto_3804780 ) ) ( not ( = ?auto_3804770 ?auto_3804774 ) ) ( not ( = ?auto_3804770 ?auto_3804777 ) ) ( not ( = ?auto_3804770 ?auto_3804779 ) ) ( not ( = ?auto_3804774 ?auto_3804777 ) ) ( not ( = ?auto_3804774 ?auto_3804779 ) ) ( not ( = ?auto_3804776 ?auto_3804780 ) ) ( not ( = ?auto_3804777 ?auto_3804779 ) ) ( not ( = ?auto_3804778 ?auto_3804780 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3804771 ?auto_3804772 ?auto_3804775 ?auto_3804774 )
      ( GET-5IMAGE-VERIFY ?auto_3804771 ?auto_3804772 ?auto_3804773 ?auto_3804770 ?auto_3804775 ?auto_3804774 ?auto_3804776 ?auto_3804777 ?auto_3804778 ?auto_3804779 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3806968 - DIRECTION
      ?auto_3806969 - MODE
      ?auto_3806970 - DIRECTION
      ?auto_3806967 - MODE
      ?auto_3806972 - DIRECTION
      ?auto_3806971 - MODE
      ?auto_3806973 - DIRECTION
      ?auto_3806974 - MODE
      ?auto_3806975 - DIRECTION
      ?auto_3806976 - MODE
    )
    :vars
    (
      ?auto_3806978 - INSTRUMENT
      ?auto_3806979 - SATELLITE
      ?auto_3806977 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3806970 ?auto_3806968 ) ) ( not ( = ?auto_3806972 ?auto_3806968 ) ) ( not ( = ?auto_3806972 ?auto_3806970 ) ) ( not ( = ?auto_3806973 ?auto_3806968 ) ) ( not ( = ?auto_3806973 ?auto_3806970 ) ) ( not ( = ?auto_3806973 ?auto_3806972 ) ) ( not ( = ?auto_3806975 ?auto_3806968 ) ) ( not ( = ?auto_3806975 ?auto_3806970 ) ) ( not ( = ?auto_3806975 ?auto_3806972 ) ) ( not ( = ?auto_3806975 ?auto_3806973 ) ) ( CALIBRATED ?auto_3806978 ) ( ON_BOARD ?auto_3806978 ?auto_3806979 ) ( SUPPORTS ?auto_3806978 ?auto_3806967 ) ( POWER_ON ?auto_3806978 ) ( POINTING ?auto_3806979 ?auto_3806977 ) ( not ( = ?auto_3806970 ?auto_3806977 ) ) ( HAVE_IMAGE ?auto_3806968 ?auto_3806969 ) ( not ( = ?auto_3806968 ?auto_3806977 ) ) ( not ( = ?auto_3806969 ?auto_3806967 ) ) ( HAVE_IMAGE ?auto_3806972 ?auto_3806971 ) ( HAVE_IMAGE ?auto_3806973 ?auto_3806974 ) ( HAVE_IMAGE ?auto_3806975 ?auto_3806976 ) ( not ( = ?auto_3806969 ?auto_3806971 ) ) ( not ( = ?auto_3806969 ?auto_3806974 ) ) ( not ( = ?auto_3806969 ?auto_3806976 ) ) ( not ( = ?auto_3806967 ?auto_3806971 ) ) ( not ( = ?auto_3806967 ?auto_3806974 ) ) ( not ( = ?auto_3806967 ?auto_3806976 ) ) ( not ( = ?auto_3806972 ?auto_3806977 ) ) ( not ( = ?auto_3806971 ?auto_3806974 ) ) ( not ( = ?auto_3806971 ?auto_3806976 ) ) ( not ( = ?auto_3806973 ?auto_3806977 ) ) ( not ( = ?auto_3806974 ?auto_3806976 ) ) ( not ( = ?auto_3806975 ?auto_3806977 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3806968 ?auto_3806969 ?auto_3806970 ?auto_3806967 )
      ( GET-5IMAGE-VERIFY ?auto_3806968 ?auto_3806969 ?auto_3806970 ?auto_3806967 ?auto_3806972 ?auto_3806971 ?auto_3806973 ?auto_3806974 ?auto_3806975 ?auto_3806976 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3823803 - DIRECTION
      ?auto_3823804 - MODE
      ?auto_3823805 - DIRECTION
      ?auto_3823802 - MODE
      ?auto_3823807 - DIRECTION
      ?auto_3823806 - MODE
      ?auto_3823808 - DIRECTION
      ?auto_3823809 - MODE
      ?auto_3823810 - DIRECTION
      ?auto_3823811 - MODE
    )
    :vars
    (
      ?auto_3823813 - INSTRUMENT
      ?auto_3823814 - SATELLITE
      ?auto_3823812 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3823805 ?auto_3823803 ) ) ( not ( = ?auto_3823807 ?auto_3823803 ) ) ( not ( = ?auto_3823807 ?auto_3823805 ) ) ( not ( = ?auto_3823808 ?auto_3823803 ) ) ( not ( = ?auto_3823808 ?auto_3823805 ) ) ( not ( = ?auto_3823808 ?auto_3823807 ) ) ( not ( = ?auto_3823810 ?auto_3823803 ) ) ( not ( = ?auto_3823810 ?auto_3823805 ) ) ( not ( = ?auto_3823810 ?auto_3823807 ) ) ( not ( = ?auto_3823810 ?auto_3823808 ) ) ( CALIBRATED ?auto_3823813 ) ( ON_BOARD ?auto_3823813 ?auto_3823814 ) ( SUPPORTS ?auto_3823813 ?auto_3823804 ) ( POWER_ON ?auto_3823813 ) ( POINTING ?auto_3823814 ?auto_3823812 ) ( not ( = ?auto_3823803 ?auto_3823812 ) ) ( HAVE_IMAGE ?auto_3823805 ?auto_3823802 ) ( not ( = ?auto_3823805 ?auto_3823812 ) ) ( not ( = ?auto_3823802 ?auto_3823804 ) ) ( HAVE_IMAGE ?auto_3823807 ?auto_3823806 ) ( HAVE_IMAGE ?auto_3823808 ?auto_3823809 ) ( HAVE_IMAGE ?auto_3823810 ?auto_3823811 ) ( not ( = ?auto_3823804 ?auto_3823806 ) ) ( not ( = ?auto_3823804 ?auto_3823809 ) ) ( not ( = ?auto_3823804 ?auto_3823811 ) ) ( not ( = ?auto_3823802 ?auto_3823806 ) ) ( not ( = ?auto_3823802 ?auto_3823809 ) ) ( not ( = ?auto_3823802 ?auto_3823811 ) ) ( not ( = ?auto_3823807 ?auto_3823812 ) ) ( not ( = ?auto_3823806 ?auto_3823809 ) ) ( not ( = ?auto_3823806 ?auto_3823811 ) ) ( not ( = ?auto_3823808 ?auto_3823812 ) ) ( not ( = ?auto_3823809 ?auto_3823811 ) ) ( not ( = ?auto_3823810 ?auto_3823812 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3823805 ?auto_3823802 ?auto_3823803 ?auto_3823804 )
      ( GET-5IMAGE-VERIFY ?auto_3823803 ?auto_3823804 ?auto_3823805 ?auto_3823802 ?auto_3823807 ?auto_3823806 ?auto_3823808 ?auto_3823809 ?auto_3823810 ?auto_3823811 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3837570 - DIRECTION
      ?auto_3837571 - MODE
      ?auto_3837572 - DIRECTION
      ?auto_3837569 - MODE
      ?auto_3837574 - DIRECTION
      ?auto_3837573 - MODE
      ?auto_3837575 - DIRECTION
      ?auto_3837576 - MODE
      ?auto_3837577 - DIRECTION
      ?auto_3837578 - MODE
    )
    :vars
    (
      ?auto_3837579 - INSTRUMENT
      ?auto_3837580 - SATELLITE
      ?auto_3837581 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3837572 ?auto_3837570 ) ) ( not ( = ?auto_3837574 ?auto_3837570 ) ) ( not ( = ?auto_3837574 ?auto_3837572 ) ) ( not ( = ?auto_3837575 ?auto_3837570 ) ) ( not ( = ?auto_3837575 ?auto_3837572 ) ) ( not ( = ?auto_3837575 ?auto_3837574 ) ) ( not ( = ?auto_3837577 ?auto_3837570 ) ) ( not ( = ?auto_3837577 ?auto_3837572 ) ) ( not ( = ?auto_3837577 ?auto_3837574 ) ) ( not ( = ?auto_3837577 ?auto_3837575 ) ) ( ON_BOARD ?auto_3837579 ?auto_3837580 ) ( SUPPORTS ?auto_3837579 ?auto_3837578 ) ( POWER_ON ?auto_3837579 ) ( POINTING ?auto_3837580 ?auto_3837581 ) ( not ( = ?auto_3837577 ?auto_3837581 ) ) ( HAVE_IMAGE ?auto_3837570 ?auto_3837571 ) ( not ( = ?auto_3837570 ?auto_3837581 ) ) ( not ( = ?auto_3837571 ?auto_3837578 ) ) ( CALIBRATION_TARGET ?auto_3837579 ?auto_3837581 ) ( NOT_CALIBRATED ?auto_3837579 ) ( HAVE_IMAGE ?auto_3837572 ?auto_3837569 ) ( HAVE_IMAGE ?auto_3837574 ?auto_3837573 ) ( HAVE_IMAGE ?auto_3837575 ?auto_3837576 ) ( not ( = ?auto_3837571 ?auto_3837569 ) ) ( not ( = ?auto_3837571 ?auto_3837573 ) ) ( not ( = ?auto_3837571 ?auto_3837576 ) ) ( not ( = ?auto_3837572 ?auto_3837581 ) ) ( not ( = ?auto_3837569 ?auto_3837573 ) ) ( not ( = ?auto_3837569 ?auto_3837576 ) ) ( not ( = ?auto_3837569 ?auto_3837578 ) ) ( not ( = ?auto_3837574 ?auto_3837581 ) ) ( not ( = ?auto_3837573 ?auto_3837576 ) ) ( not ( = ?auto_3837573 ?auto_3837578 ) ) ( not ( = ?auto_3837575 ?auto_3837581 ) ) ( not ( = ?auto_3837576 ?auto_3837578 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3837570 ?auto_3837571 ?auto_3837577 ?auto_3837578 )
      ( GET-5IMAGE-VERIFY ?auto_3837570 ?auto_3837571 ?auto_3837572 ?auto_3837569 ?auto_3837574 ?auto_3837573 ?auto_3837575 ?auto_3837576 ?auto_3837577 ?auto_3837578 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3837622 - DIRECTION
      ?auto_3837623 - MODE
      ?auto_3837624 - DIRECTION
      ?auto_3837621 - MODE
      ?auto_3837626 - DIRECTION
      ?auto_3837625 - MODE
      ?auto_3837627 - DIRECTION
      ?auto_3837628 - MODE
      ?auto_3837629 - DIRECTION
      ?auto_3837630 - MODE
    )
    :vars
    (
      ?auto_3837631 - INSTRUMENT
      ?auto_3837632 - SATELLITE
      ?auto_3837633 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3837624 ?auto_3837622 ) ) ( not ( = ?auto_3837626 ?auto_3837622 ) ) ( not ( = ?auto_3837626 ?auto_3837624 ) ) ( not ( = ?auto_3837627 ?auto_3837622 ) ) ( not ( = ?auto_3837627 ?auto_3837624 ) ) ( not ( = ?auto_3837627 ?auto_3837626 ) ) ( not ( = ?auto_3837629 ?auto_3837622 ) ) ( not ( = ?auto_3837629 ?auto_3837624 ) ) ( not ( = ?auto_3837629 ?auto_3837626 ) ) ( not ( = ?auto_3837629 ?auto_3837627 ) ) ( ON_BOARD ?auto_3837631 ?auto_3837632 ) ( SUPPORTS ?auto_3837631 ?auto_3837628 ) ( POWER_ON ?auto_3837631 ) ( POINTING ?auto_3837632 ?auto_3837633 ) ( not ( = ?auto_3837627 ?auto_3837633 ) ) ( HAVE_IMAGE ?auto_3837622 ?auto_3837623 ) ( not ( = ?auto_3837622 ?auto_3837633 ) ) ( not ( = ?auto_3837623 ?auto_3837628 ) ) ( CALIBRATION_TARGET ?auto_3837631 ?auto_3837633 ) ( NOT_CALIBRATED ?auto_3837631 ) ( HAVE_IMAGE ?auto_3837624 ?auto_3837621 ) ( HAVE_IMAGE ?auto_3837626 ?auto_3837625 ) ( HAVE_IMAGE ?auto_3837629 ?auto_3837630 ) ( not ( = ?auto_3837623 ?auto_3837621 ) ) ( not ( = ?auto_3837623 ?auto_3837625 ) ) ( not ( = ?auto_3837623 ?auto_3837630 ) ) ( not ( = ?auto_3837624 ?auto_3837633 ) ) ( not ( = ?auto_3837621 ?auto_3837625 ) ) ( not ( = ?auto_3837621 ?auto_3837628 ) ) ( not ( = ?auto_3837621 ?auto_3837630 ) ) ( not ( = ?auto_3837626 ?auto_3837633 ) ) ( not ( = ?auto_3837625 ?auto_3837628 ) ) ( not ( = ?auto_3837625 ?auto_3837630 ) ) ( not ( = ?auto_3837628 ?auto_3837630 ) ) ( not ( = ?auto_3837629 ?auto_3837633 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3837622 ?auto_3837623 ?auto_3837627 ?auto_3837628 )
      ( GET-5IMAGE-VERIFY ?auto_3837622 ?auto_3837623 ?auto_3837624 ?auto_3837621 ?auto_3837626 ?auto_3837625 ?auto_3837627 ?auto_3837628 ?auto_3837629 ?auto_3837630 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3837928 - DIRECTION
      ?auto_3837929 - MODE
      ?auto_3837930 - DIRECTION
      ?auto_3837927 - MODE
      ?auto_3837932 - DIRECTION
      ?auto_3837931 - MODE
      ?auto_3837933 - DIRECTION
      ?auto_3837934 - MODE
      ?auto_3837935 - DIRECTION
      ?auto_3837936 - MODE
    )
    :vars
    (
      ?auto_3837937 - INSTRUMENT
      ?auto_3837938 - SATELLITE
      ?auto_3837939 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3837930 ?auto_3837928 ) ) ( not ( = ?auto_3837932 ?auto_3837928 ) ) ( not ( = ?auto_3837932 ?auto_3837930 ) ) ( not ( = ?auto_3837933 ?auto_3837928 ) ) ( not ( = ?auto_3837933 ?auto_3837930 ) ) ( not ( = ?auto_3837933 ?auto_3837932 ) ) ( not ( = ?auto_3837935 ?auto_3837928 ) ) ( not ( = ?auto_3837935 ?auto_3837930 ) ) ( not ( = ?auto_3837935 ?auto_3837932 ) ) ( not ( = ?auto_3837935 ?auto_3837933 ) ) ( ON_BOARD ?auto_3837937 ?auto_3837938 ) ( SUPPORTS ?auto_3837937 ?auto_3837931 ) ( POWER_ON ?auto_3837937 ) ( POINTING ?auto_3837938 ?auto_3837939 ) ( not ( = ?auto_3837932 ?auto_3837939 ) ) ( HAVE_IMAGE ?auto_3837928 ?auto_3837929 ) ( not ( = ?auto_3837928 ?auto_3837939 ) ) ( not ( = ?auto_3837929 ?auto_3837931 ) ) ( CALIBRATION_TARGET ?auto_3837937 ?auto_3837939 ) ( NOT_CALIBRATED ?auto_3837937 ) ( HAVE_IMAGE ?auto_3837930 ?auto_3837927 ) ( HAVE_IMAGE ?auto_3837933 ?auto_3837934 ) ( HAVE_IMAGE ?auto_3837935 ?auto_3837936 ) ( not ( = ?auto_3837929 ?auto_3837927 ) ) ( not ( = ?auto_3837929 ?auto_3837934 ) ) ( not ( = ?auto_3837929 ?auto_3837936 ) ) ( not ( = ?auto_3837930 ?auto_3837939 ) ) ( not ( = ?auto_3837927 ?auto_3837931 ) ) ( not ( = ?auto_3837927 ?auto_3837934 ) ) ( not ( = ?auto_3837927 ?auto_3837936 ) ) ( not ( = ?auto_3837931 ?auto_3837934 ) ) ( not ( = ?auto_3837931 ?auto_3837936 ) ) ( not ( = ?auto_3837933 ?auto_3837939 ) ) ( not ( = ?auto_3837934 ?auto_3837936 ) ) ( not ( = ?auto_3837935 ?auto_3837939 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3837928 ?auto_3837929 ?auto_3837932 ?auto_3837931 )
      ( GET-5IMAGE-VERIFY ?auto_3837928 ?auto_3837929 ?auto_3837930 ?auto_3837927 ?auto_3837932 ?auto_3837931 ?auto_3837933 ?auto_3837934 ?auto_3837935 ?auto_3837936 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3840125 - DIRECTION
      ?auto_3840126 - MODE
      ?auto_3840127 - DIRECTION
      ?auto_3840124 - MODE
      ?auto_3840129 - DIRECTION
      ?auto_3840128 - MODE
      ?auto_3840130 - DIRECTION
      ?auto_3840131 - MODE
      ?auto_3840132 - DIRECTION
      ?auto_3840133 - MODE
    )
    :vars
    (
      ?auto_3840134 - INSTRUMENT
      ?auto_3840135 - SATELLITE
      ?auto_3840136 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3840127 ?auto_3840125 ) ) ( not ( = ?auto_3840129 ?auto_3840125 ) ) ( not ( = ?auto_3840129 ?auto_3840127 ) ) ( not ( = ?auto_3840130 ?auto_3840125 ) ) ( not ( = ?auto_3840130 ?auto_3840127 ) ) ( not ( = ?auto_3840130 ?auto_3840129 ) ) ( not ( = ?auto_3840132 ?auto_3840125 ) ) ( not ( = ?auto_3840132 ?auto_3840127 ) ) ( not ( = ?auto_3840132 ?auto_3840129 ) ) ( not ( = ?auto_3840132 ?auto_3840130 ) ) ( ON_BOARD ?auto_3840134 ?auto_3840135 ) ( SUPPORTS ?auto_3840134 ?auto_3840124 ) ( POWER_ON ?auto_3840134 ) ( POINTING ?auto_3840135 ?auto_3840136 ) ( not ( = ?auto_3840127 ?auto_3840136 ) ) ( HAVE_IMAGE ?auto_3840125 ?auto_3840126 ) ( not ( = ?auto_3840125 ?auto_3840136 ) ) ( not ( = ?auto_3840126 ?auto_3840124 ) ) ( CALIBRATION_TARGET ?auto_3840134 ?auto_3840136 ) ( NOT_CALIBRATED ?auto_3840134 ) ( HAVE_IMAGE ?auto_3840129 ?auto_3840128 ) ( HAVE_IMAGE ?auto_3840130 ?auto_3840131 ) ( HAVE_IMAGE ?auto_3840132 ?auto_3840133 ) ( not ( = ?auto_3840126 ?auto_3840128 ) ) ( not ( = ?auto_3840126 ?auto_3840131 ) ) ( not ( = ?auto_3840126 ?auto_3840133 ) ) ( not ( = ?auto_3840124 ?auto_3840128 ) ) ( not ( = ?auto_3840124 ?auto_3840131 ) ) ( not ( = ?auto_3840124 ?auto_3840133 ) ) ( not ( = ?auto_3840129 ?auto_3840136 ) ) ( not ( = ?auto_3840128 ?auto_3840131 ) ) ( not ( = ?auto_3840128 ?auto_3840133 ) ) ( not ( = ?auto_3840130 ?auto_3840136 ) ) ( not ( = ?auto_3840131 ?auto_3840133 ) ) ( not ( = ?auto_3840132 ?auto_3840136 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3840125 ?auto_3840126 ?auto_3840127 ?auto_3840124 )
      ( GET-5IMAGE-VERIFY ?auto_3840125 ?auto_3840126 ?auto_3840127 ?auto_3840124 ?auto_3840129 ?auto_3840128 ?auto_3840130 ?auto_3840131 ?auto_3840132 ?auto_3840133 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3856960 - DIRECTION
      ?auto_3856961 - MODE
      ?auto_3856962 - DIRECTION
      ?auto_3856959 - MODE
      ?auto_3856964 - DIRECTION
      ?auto_3856963 - MODE
      ?auto_3856965 - DIRECTION
      ?auto_3856966 - MODE
      ?auto_3856967 - DIRECTION
      ?auto_3856968 - MODE
    )
    :vars
    (
      ?auto_3856969 - INSTRUMENT
      ?auto_3856970 - SATELLITE
      ?auto_3856971 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3856962 ?auto_3856960 ) ) ( not ( = ?auto_3856964 ?auto_3856960 ) ) ( not ( = ?auto_3856964 ?auto_3856962 ) ) ( not ( = ?auto_3856965 ?auto_3856960 ) ) ( not ( = ?auto_3856965 ?auto_3856962 ) ) ( not ( = ?auto_3856965 ?auto_3856964 ) ) ( not ( = ?auto_3856967 ?auto_3856960 ) ) ( not ( = ?auto_3856967 ?auto_3856962 ) ) ( not ( = ?auto_3856967 ?auto_3856964 ) ) ( not ( = ?auto_3856967 ?auto_3856965 ) ) ( ON_BOARD ?auto_3856969 ?auto_3856970 ) ( SUPPORTS ?auto_3856969 ?auto_3856961 ) ( POWER_ON ?auto_3856969 ) ( POINTING ?auto_3856970 ?auto_3856971 ) ( not ( = ?auto_3856960 ?auto_3856971 ) ) ( HAVE_IMAGE ?auto_3856962 ?auto_3856959 ) ( not ( = ?auto_3856962 ?auto_3856971 ) ) ( not ( = ?auto_3856959 ?auto_3856961 ) ) ( CALIBRATION_TARGET ?auto_3856969 ?auto_3856971 ) ( NOT_CALIBRATED ?auto_3856969 ) ( HAVE_IMAGE ?auto_3856964 ?auto_3856963 ) ( HAVE_IMAGE ?auto_3856965 ?auto_3856966 ) ( HAVE_IMAGE ?auto_3856967 ?auto_3856968 ) ( not ( = ?auto_3856961 ?auto_3856963 ) ) ( not ( = ?auto_3856961 ?auto_3856966 ) ) ( not ( = ?auto_3856961 ?auto_3856968 ) ) ( not ( = ?auto_3856959 ?auto_3856963 ) ) ( not ( = ?auto_3856959 ?auto_3856966 ) ) ( not ( = ?auto_3856959 ?auto_3856968 ) ) ( not ( = ?auto_3856964 ?auto_3856971 ) ) ( not ( = ?auto_3856963 ?auto_3856966 ) ) ( not ( = ?auto_3856963 ?auto_3856968 ) ) ( not ( = ?auto_3856965 ?auto_3856971 ) ) ( not ( = ?auto_3856966 ?auto_3856968 ) ) ( not ( = ?auto_3856967 ?auto_3856971 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3856962 ?auto_3856959 ?auto_3856960 ?auto_3856961 )
      ( GET-5IMAGE-VERIFY ?auto_3856960 ?auto_3856961 ?auto_3856962 ?auto_3856959 ?auto_3856964 ?auto_3856963 ?auto_3856965 ?auto_3856966 ?auto_3856967 ?auto_3856968 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3870727 - DIRECTION
      ?auto_3870728 - MODE
      ?auto_3870729 - DIRECTION
      ?auto_3870726 - MODE
      ?auto_3870731 - DIRECTION
      ?auto_3870730 - MODE
      ?auto_3870732 - DIRECTION
      ?auto_3870733 - MODE
      ?auto_3870734 - DIRECTION
      ?auto_3870735 - MODE
    )
    :vars
    (
      ?auto_3870737 - INSTRUMENT
      ?auto_3870736 - SATELLITE
      ?auto_3870738 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3870729 ?auto_3870727 ) ) ( not ( = ?auto_3870731 ?auto_3870727 ) ) ( not ( = ?auto_3870731 ?auto_3870729 ) ) ( not ( = ?auto_3870732 ?auto_3870727 ) ) ( not ( = ?auto_3870732 ?auto_3870729 ) ) ( not ( = ?auto_3870732 ?auto_3870731 ) ) ( not ( = ?auto_3870734 ?auto_3870727 ) ) ( not ( = ?auto_3870734 ?auto_3870729 ) ) ( not ( = ?auto_3870734 ?auto_3870731 ) ) ( not ( = ?auto_3870734 ?auto_3870732 ) ) ( ON_BOARD ?auto_3870737 ?auto_3870736 ) ( SUPPORTS ?auto_3870737 ?auto_3870735 ) ( POINTING ?auto_3870736 ?auto_3870738 ) ( not ( = ?auto_3870734 ?auto_3870738 ) ) ( HAVE_IMAGE ?auto_3870727 ?auto_3870728 ) ( not ( = ?auto_3870727 ?auto_3870738 ) ) ( not ( = ?auto_3870728 ?auto_3870735 ) ) ( CALIBRATION_TARGET ?auto_3870737 ?auto_3870738 ) ( POWER_AVAIL ?auto_3870736 ) ( HAVE_IMAGE ?auto_3870729 ?auto_3870726 ) ( HAVE_IMAGE ?auto_3870731 ?auto_3870730 ) ( HAVE_IMAGE ?auto_3870732 ?auto_3870733 ) ( not ( = ?auto_3870728 ?auto_3870726 ) ) ( not ( = ?auto_3870728 ?auto_3870730 ) ) ( not ( = ?auto_3870728 ?auto_3870733 ) ) ( not ( = ?auto_3870729 ?auto_3870738 ) ) ( not ( = ?auto_3870726 ?auto_3870730 ) ) ( not ( = ?auto_3870726 ?auto_3870733 ) ) ( not ( = ?auto_3870726 ?auto_3870735 ) ) ( not ( = ?auto_3870731 ?auto_3870738 ) ) ( not ( = ?auto_3870730 ?auto_3870733 ) ) ( not ( = ?auto_3870730 ?auto_3870735 ) ) ( not ( = ?auto_3870732 ?auto_3870738 ) ) ( not ( = ?auto_3870733 ?auto_3870735 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3870727 ?auto_3870728 ?auto_3870734 ?auto_3870735 )
      ( GET-5IMAGE-VERIFY ?auto_3870727 ?auto_3870728 ?auto_3870729 ?auto_3870726 ?auto_3870731 ?auto_3870730 ?auto_3870732 ?auto_3870733 ?auto_3870734 ?auto_3870735 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3870779 - DIRECTION
      ?auto_3870780 - MODE
      ?auto_3870781 - DIRECTION
      ?auto_3870778 - MODE
      ?auto_3870783 - DIRECTION
      ?auto_3870782 - MODE
      ?auto_3870784 - DIRECTION
      ?auto_3870785 - MODE
      ?auto_3870786 - DIRECTION
      ?auto_3870787 - MODE
    )
    :vars
    (
      ?auto_3870789 - INSTRUMENT
      ?auto_3870788 - SATELLITE
      ?auto_3870790 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3870781 ?auto_3870779 ) ) ( not ( = ?auto_3870783 ?auto_3870779 ) ) ( not ( = ?auto_3870783 ?auto_3870781 ) ) ( not ( = ?auto_3870784 ?auto_3870779 ) ) ( not ( = ?auto_3870784 ?auto_3870781 ) ) ( not ( = ?auto_3870784 ?auto_3870783 ) ) ( not ( = ?auto_3870786 ?auto_3870779 ) ) ( not ( = ?auto_3870786 ?auto_3870781 ) ) ( not ( = ?auto_3870786 ?auto_3870783 ) ) ( not ( = ?auto_3870786 ?auto_3870784 ) ) ( ON_BOARD ?auto_3870789 ?auto_3870788 ) ( SUPPORTS ?auto_3870789 ?auto_3870785 ) ( POINTING ?auto_3870788 ?auto_3870790 ) ( not ( = ?auto_3870784 ?auto_3870790 ) ) ( HAVE_IMAGE ?auto_3870779 ?auto_3870780 ) ( not ( = ?auto_3870779 ?auto_3870790 ) ) ( not ( = ?auto_3870780 ?auto_3870785 ) ) ( CALIBRATION_TARGET ?auto_3870789 ?auto_3870790 ) ( POWER_AVAIL ?auto_3870788 ) ( HAVE_IMAGE ?auto_3870781 ?auto_3870778 ) ( HAVE_IMAGE ?auto_3870783 ?auto_3870782 ) ( HAVE_IMAGE ?auto_3870786 ?auto_3870787 ) ( not ( = ?auto_3870780 ?auto_3870778 ) ) ( not ( = ?auto_3870780 ?auto_3870782 ) ) ( not ( = ?auto_3870780 ?auto_3870787 ) ) ( not ( = ?auto_3870781 ?auto_3870790 ) ) ( not ( = ?auto_3870778 ?auto_3870782 ) ) ( not ( = ?auto_3870778 ?auto_3870785 ) ) ( not ( = ?auto_3870778 ?auto_3870787 ) ) ( not ( = ?auto_3870783 ?auto_3870790 ) ) ( not ( = ?auto_3870782 ?auto_3870785 ) ) ( not ( = ?auto_3870782 ?auto_3870787 ) ) ( not ( = ?auto_3870785 ?auto_3870787 ) ) ( not ( = ?auto_3870786 ?auto_3870790 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3870779 ?auto_3870780 ?auto_3870784 ?auto_3870785 )
      ( GET-5IMAGE-VERIFY ?auto_3870779 ?auto_3870780 ?auto_3870781 ?auto_3870778 ?auto_3870783 ?auto_3870782 ?auto_3870784 ?auto_3870785 ?auto_3870786 ?auto_3870787 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3871085 - DIRECTION
      ?auto_3871086 - MODE
      ?auto_3871087 - DIRECTION
      ?auto_3871084 - MODE
      ?auto_3871089 - DIRECTION
      ?auto_3871088 - MODE
      ?auto_3871090 - DIRECTION
      ?auto_3871091 - MODE
      ?auto_3871092 - DIRECTION
      ?auto_3871093 - MODE
    )
    :vars
    (
      ?auto_3871095 - INSTRUMENT
      ?auto_3871094 - SATELLITE
      ?auto_3871096 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3871087 ?auto_3871085 ) ) ( not ( = ?auto_3871089 ?auto_3871085 ) ) ( not ( = ?auto_3871089 ?auto_3871087 ) ) ( not ( = ?auto_3871090 ?auto_3871085 ) ) ( not ( = ?auto_3871090 ?auto_3871087 ) ) ( not ( = ?auto_3871090 ?auto_3871089 ) ) ( not ( = ?auto_3871092 ?auto_3871085 ) ) ( not ( = ?auto_3871092 ?auto_3871087 ) ) ( not ( = ?auto_3871092 ?auto_3871089 ) ) ( not ( = ?auto_3871092 ?auto_3871090 ) ) ( ON_BOARD ?auto_3871095 ?auto_3871094 ) ( SUPPORTS ?auto_3871095 ?auto_3871088 ) ( POINTING ?auto_3871094 ?auto_3871096 ) ( not ( = ?auto_3871089 ?auto_3871096 ) ) ( HAVE_IMAGE ?auto_3871085 ?auto_3871086 ) ( not ( = ?auto_3871085 ?auto_3871096 ) ) ( not ( = ?auto_3871086 ?auto_3871088 ) ) ( CALIBRATION_TARGET ?auto_3871095 ?auto_3871096 ) ( POWER_AVAIL ?auto_3871094 ) ( HAVE_IMAGE ?auto_3871087 ?auto_3871084 ) ( HAVE_IMAGE ?auto_3871090 ?auto_3871091 ) ( HAVE_IMAGE ?auto_3871092 ?auto_3871093 ) ( not ( = ?auto_3871086 ?auto_3871084 ) ) ( not ( = ?auto_3871086 ?auto_3871091 ) ) ( not ( = ?auto_3871086 ?auto_3871093 ) ) ( not ( = ?auto_3871087 ?auto_3871096 ) ) ( not ( = ?auto_3871084 ?auto_3871088 ) ) ( not ( = ?auto_3871084 ?auto_3871091 ) ) ( not ( = ?auto_3871084 ?auto_3871093 ) ) ( not ( = ?auto_3871088 ?auto_3871091 ) ) ( not ( = ?auto_3871088 ?auto_3871093 ) ) ( not ( = ?auto_3871090 ?auto_3871096 ) ) ( not ( = ?auto_3871091 ?auto_3871093 ) ) ( not ( = ?auto_3871092 ?auto_3871096 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3871085 ?auto_3871086 ?auto_3871089 ?auto_3871088 )
      ( GET-5IMAGE-VERIFY ?auto_3871085 ?auto_3871086 ?auto_3871087 ?auto_3871084 ?auto_3871089 ?auto_3871088 ?auto_3871090 ?auto_3871091 ?auto_3871092 ?auto_3871093 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3873282 - DIRECTION
      ?auto_3873283 - MODE
      ?auto_3873284 - DIRECTION
      ?auto_3873281 - MODE
      ?auto_3873286 - DIRECTION
      ?auto_3873285 - MODE
      ?auto_3873287 - DIRECTION
      ?auto_3873288 - MODE
      ?auto_3873289 - DIRECTION
      ?auto_3873290 - MODE
    )
    :vars
    (
      ?auto_3873292 - INSTRUMENT
      ?auto_3873291 - SATELLITE
      ?auto_3873293 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3873284 ?auto_3873282 ) ) ( not ( = ?auto_3873286 ?auto_3873282 ) ) ( not ( = ?auto_3873286 ?auto_3873284 ) ) ( not ( = ?auto_3873287 ?auto_3873282 ) ) ( not ( = ?auto_3873287 ?auto_3873284 ) ) ( not ( = ?auto_3873287 ?auto_3873286 ) ) ( not ( = ?auto_3873289 ?auto_3873282 ) ) ( not ( = ?auto_3873289 ?auto_3873284 ) ) ( not ( = ?auto_3873289 ?auto_3873286 ) ) ( not ( = ?auto_3873289 ?auto_3873287 ) ) ( ON_BOARD ?auto_3873292 ?auto_3873291 ) ( SUPPORTS ?auto_3873292 ?auto_3873281 ) ( POINTING ?auto_3873291 ?auto_3873293 ) ( not ( = ?auto_3873284 ?auto_3873293 ) ) ( HAVE_IMAGE ?auto_3873282 ?auto_3873283 ) ( not ( = ?auto_3873282 ?auto_3873293 ) ) ( not ( = ?auto_3873283 ?auto_3873281 ) ) ( CALIBRATION_TARGET ?auto_3873292 ?auto_3873293 ) ( POWER_AVAIL ?auto_3873291 ) ( HAVE_IMAGE ?auto_3873286 ?auto_3873285 ) ( HAVE_IMAGE ?auto_3873287 ?auto_3873288 ) ( HAVE_IMAGE ?auto_3873289 ?auto_3873290 ) ( not ( = ?auto_3873283 ?auto_3873285 ) ) ( not ( = ?auto_3873283 ?auto_3873288 ) ) ( not ( = ?auto_3873283 ?auto_3873290 ) ) ( not ( = ?auto_3873281 ?auto_3873285 ) ) ( not ( = ?auto_3873281 ?auto_3873288 ) ) ( not ( = ?auto_3873281 ?auto_3873290 ) ) ( not ( = ?auto_3873286 ?auto_3873293 ) ) ( not ( = ?auto_3873285 ?auto_3873288 ) ) ( not ( = ?auto_3873285 ?auto_3873290 ) ) ( not ( = ?auto_3873287 ?auto_3873293 ) ) ( not ( = ?auto_3873288 ?auto_3873290 ) ) ( not ( = ?auto_3873289 ?auto_3873293 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3873282 ?auto_3873283 ?auto_3873284 ?auto_3873281 )
      ( GET-5IMAGE-VERIFY ?auto_3873282 ?auto_3873283 ?auto_3873284 ?auto_3873281 ?auto_3873286 ?auto_3873285 ?auto_3873287 ?auto_3873288 ?auto_3873289 ?auto_3873290 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3890117 - DIRECTION
      ?auto_3890118 - MODE
      ?auto_3890119 - DIRECTION
      ?auto_3890116 - MODE
      ?auto_3890121 - DIRECTION
      ?auto_3890120 - MODE
      ?auto_3890122 - DIRECTION
      ?auto_3890123 - MODE
      ?auto_3890124 - DIRECTION
      ?auto_3890125 - MODE
    )
    :vars
    (
      ?auto_3890127 - INSTRUMENT
      ?auto_3890126 - SATELLITE
      ?auto_3890128 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3890119 ?auto_3890117 ) ) ( not ( = ?auto_3890121 ?auto_3890117 ) ) ( not ( = ?auto_3890121 ?auto_3890119 ) ) ( not ( = ?auto_3890122 ?auto_3890117 ) ) ( not ( = ?auto_3890122 ?auto_3890119 ) ) ( not ( = ?auto_3890122 ?auto_3890121 ) ) ( not ( = ?auto_3890124 ?auto_3890117 ) ) ( not ( = ?auto_3890124 ?auto_3890119 ) ) ( not ( = ?auto_3890124 ?auto_3890121 ) ) ( not ( = ?auto_3890124 ?auto_3890122 ) ) ( ON_BOARD ?auto_3890127 ?auto_3890126 ) ( SUPPORTS ?auto_3890127 ?auto_3890118 ) ( POINTING ?auto_3890126 ?auto_3890128 ) ( not ( = ?auto_3890117 ?auto_3890128 ) ) ( HAVE_IMAGE ?auto_3890119 ?auto_3890116 ) ( not ( = ?auto_3890119 ?auto_3890128 ) ) ( not ( = ?auto_3890116 ?auto_3890118 ) ) ( CALIBRATION_TARGET ?auto_3890127 ?auto_3890128 ) ( POWER_AVAIL ?auto_3890126 ) ( HAVE_IMAGE ?auto_3890121 ?auto_3890120 ) ( HAVE_IMAGE ?auto_3890122 ?auto_3890123 ) ( HAVE_IMAGE ?auto_3890124 ?auto_3890125 ) ( not ( = ?auto_3890118 ?auto_3890120 ) ) ( not ( = ?auto_3890118 ?auto_3890123 ) ) ( not ( = ?auto_3890118 ?auto_3890125 ) ) ( not ( = ?auto_3890116 ?auto_3890120 ) ) ( not ( = ?auto_3890116 ?auto_3890123 ) ) ( not ( = ?auto_3890116 ?auto_3890125 ) ) ( not ( = ?auto_3890121 ?auto_3890128 ) ) ( not ( = ?auto_3890120 ?auto_3890123 ) ) ( not ( = ?auto_3890120 ?auto_3890125 ) ) ( not ( = ?auto_3890122 ?auto_3890128 ) ) ( not ( = ?auto_3890123 ?auto_3890125 ) ) ( not ( = ?auto_3890124 ?auto_3890128 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3890119 ?auto_3890116 ?auto_3890117 ?auto_3890118 )
      ( GET-5IMAGE-VERIFY ?auto_3890117 ?auto_3890118 ?auto_3890119 ?auto_3890116 ?auto_3890121 ?auto_3890120 ?auto_3890122 ?auto_3890123 ?auto_3890124 ?auto_3890125 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3898917 - DIRECTION
      ?auto_3898918 - MODE
      ?auto_3898919 - DIRECTION
      ?auto_3898916 - MODE
      ?auto_3898921 - DIRECTION
      ?auto_3898920 - MODE
      ?auto_3898922 - DIRECTION
      ?auto_3898923 - MODE
    )
    :vars
    (
      ?auto_3898926 - INSTRUMENT
      ?auto_3898925 - SATELLITE
      ?auto_3898927 - DIRECTION
      ?auto_3898924 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3898919 ?auto_3898917 ) ) ( not ( = ?auto_3898921 ?auto_3898917 ) ) ( not ( = ?auto_3898921 ?auto_3898919 ) ) ( not ( = ?auto_3898922 ?auto_3898917 ) ) ( not ( = ?auto_3898922 ?auto_3898919 ) ) ( not ( = ?auto_3898922 ?auto_3898921 ) ) ( ON_BOARD ?auto_3898926 ?auto_3898925 ) ( SUPPORTS ?auto_3898926 ?auto_3898923 ) ( not ( = ?auto_3898922 ?auto_3898927 ) ) ( HAVE_IMAGE ?auto_3898917 ?auto_3898918 ) ( not ( = ?auto_3898917 ?auto_3898927 ) ) ( not ( = ?auto_3898918 ?auto_3898923 ) ) ( CALIBRATION_TARGET ?auto_3898926 ?auto_3898927 ) ( POWER_AVAIL ?auto_3898925 ) ( POINTING ?auto_3898925 ?auto_3898924 ) ( not ( = ?auto_3898927 ?auto_3898924 ) ) ( not ( = ?auto_3898922 ?auto_3898924 ) ) ( not ( = ?auto_3898917 ?auto_3898924 ) ) ( HAVE_IMAGE ?auto_3898919 ?auto_3898916 ) ( HAVE_IMAGE ?auto_3898921 ?auto_3898920 ) ( not ( = ?auto_3898918 ?auto_3898916 ) ) ( not ( = ?auto_3898918 ?auto_3898920 ) ) ( not ( = ?auto_3898919 ?auto_3898927 ) ) ( not ( = ?auto_3898919 ?auto_3898924 ) ) ( not ( = ?auto_3898916 ?auto_3898920 ) ) ( not ( = ?auto_3898916 ?auto_3898923 ) ) ( not ( = ?auto_3898921 ?auto_3898927 ) ) ( not ( = ?auto_3898921 ?auto_3898924 ) ) ( not ( = ?auto_3898920 ?auto_3898923 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3898917 ?auto_3898918 ?auto_3898922 ?auto_3898923 )
      ( GET-4IMAGE-VERIFY ?auto_3898917 ?auto_3898918 ?auto_3898919 ?auto_3898916 ?auto_3898921 ?auto_3898920 ?auto_3898922 ?auto_3898923 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3898964 - DIRECTION
      ?auto_3898965 - MODE
      ?auto_3898966 - DIRECTION
      ?auto_3898963 - MODE
      ?auto_3898968 - DIRECTION
      ?auto_3898967 - MODE
      ?auto_3898969 - DIRECTION
      ?auto_3898970 - MODE
    )
    :vars
    (
      ?auto_3898973 - INSTRUMENT
      ?auto_3898972 - SATELLITE
      ?auto_3898974 - DIRECTION
      ?auto_3898971 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3898966 ?auto_3898964 ) ) ( not ( = ?auto_3898968 ?auto_3898964 ) ) ( not ( = ?auto_3898968 ?auto_3898966 ) ) ( not ( = ?auto_3898969 ?auto_3898964 ) ) ( not ( = ?auto_3898969 ?auto_3898966 ) ) ( not ( = ?auto_3898969 ?auto_3898968 ) ) ( ON_BOARD ?auto_3898973 ?auto_3898972 ) ( SUPPORTS ?auto_3898973 ?auto_3898967 ) ( not ( = ?auto_3898968 ?auto_3898974 ) ) ( HAVE_IMAGE ?auto_3898964 ?auto_3898965 ) ( not ( = ?auto_3898964 ?auto_3898974 ) ) ( not ( = ?auto_3898965 ?auto_3898967 ) ) ( CALIBRATION_TARGET ?auto_3898973 ?auto_3898974 ) ( POWER_AVAIL ?auto_3898972 ) ( POINTING ?auto_3898972 ?auto_3898971 ) ( not ( = ?auto_3898974 ?auto_3898971 ) ) ( not ( = ?auto_3898968 ?auto_3898971 ) ) ( not ( = ?auto_3898964 ?auto_3898971 ) ) ( HAVE_IMAGE ?auto_3898966 ?auto_3898963 ) ( HAVE_IMAGE ?auto_3898969 ?auto_3898970 ) ( not ( = ?auto_3898965 ?auto_3898963 ) ) ( not ( = ?auto_3898965 ?auto_3898970 ) ) ( not ( = ?auto_3898966 ?auto_3898974 ) ) ( not ( = ?auto_3898966 ?auto_3898971 ) ) ( not ( = ?auto_3898963 ?auto_3898967 ) ) ( not ( = ?auto_3898963 ?auto_3898970 ) ) ( not ( = ?auto_3898967 ?auto_3898970 ) ) ( not ( = ?auto_3898969 ?auto_3898974 ) ) ( not ( = ?auto_3898969 ?auto_3898971 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3898964 ?auto_3898965 ?auto_3898968 ?auto_3898967 )
      ( GET-4IMAGE-VERIFY ?auto_3898964 ?auto_3898965 ?auto_3898966 ?auto_3898963 ?auto_3898968 ?auto_3898967 ?auto_3898969 ?auto_3898970 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3899267 - DIRECTION
      ?auto_3899268 - MODE
      ?auto_3899269 - DIRECTION
      ?auto_3899266 - MODE
      ?auto_3899271 - DIRECTION
      ?auto_3899270 - MODE
      ?auto_3899272 - DIRECTION
      ?auto_3899273 - MODE
    )
    :vars
    (
      ?auto_3899276 - INSTRUMENT
      ?auto_3899275 - SATELLITE
      ?auto_3899277 - DIRECTION
      ?auto_3899274 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3899269 ?auto_3899267 ) ) ( not ( = ?auto_3899271 ?auto_3899267 ) ) ( not ( = ?auto_3899271 ?auto_3899269 ) ) ( not ( = ?auto_3899272 ?auto_3899267 ) ) ( not ( = ?auto_3899272 ?auto_3899269 ) ) ( not ( = ?auto_3899272 ?auto_3899271 ) ) ( ON_BOARD ?auto_3899276 ?auto_3899275 ) ( SUPPORTS ?auto_3899276 ?auto_3899266 ) ( not ( = ?auto_3899269 ?auto_3899277 ) ) ( HAVE_IMAGE ?auto_3899267 ?auto_3899268 ) ( not ( = ?auto_3899267 ?auto_3899277 ) ) ( not ( = ?auto_3899268 ?auto_3899266 ) ) ( CALIBRATION_TARGET ?auto_3899276 ?auto_3899277 ) ( POWER_AVAIL ?auto_3899275 ) ( POINTING ?auto_3899275 ?auto_3899274 ) ( not ( = ?auto_3899277 ?auto_3899274 ) ) ( not ( = ?auto_3899269 ?auto_3899274 ) ) ( not ( = ?auto_3899267 ?auto_3899274 ) ) ( HAVE_IMAGE ?auto_3899271 ?auto_3899270 ) ( HAVE_IMAGE ?auto_3899272 ?auto_3899273 ) ( not ( = ?auto_3899268 ?auto_3899270 ) ) ( not ( = ?auto_3899268 ?auto_3899273 ) ) ( not ( = ?auto_3899266 ?auto_3899270 ) ) ( not ( = ?auto_3899266 ?auto_3899273 ) ) ( not ( = ?auto_3899271 ?auto_3899277 ) ) ( not ( = ?auto_3899271 ?auto_3899274 ) ) ( not ( = ?auto_3899270 ?auto_3899273 ) ) ( not ( = ?auto_3899272 ?auto_3899277 ) ) ( not ( = ?auto_3899272 ?auto_3899274 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3899267 ?auto_3899268 ?auto_3899269 ?auto_3899266 )
      ( GET-4IMAGE-VERIFY ?auto_3899267 ?auto_3899268 ?auto_3899269 ?auto_3899266 ?auto_3899271 ?auto_3899270 ?auto_3899272 ?auto_3899273 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3901656 - DIRECTION
      ?auto_3901657 - MODE
      ?auto_3901658 - DIRECTION
      ?auto_3901655 - MODE
      ?auto_3901660 - DIRECTION
      ?auto_3901659 - MODE
      ?auto_3901661 - DIRECTION
      ?auto_3901662 - MODE
    )
    :vars
    (
      ?auto_3901665 - INSTRUMENT
      ?auto_3901664 - SATELLITE
      ?auto_3901666 - DIRECTION
      ?auto_3901663 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3901658 ?auto_3901656 ) ) ( not ( = ?auto_3901660 ?auto_3901656 ) ) ( not ( = ?auto_3901660 ?auto_3901658 ) ) ( not ( = ?auto_3901661 ?auto_3901656 ) ) ( not ( = ?auto_3901661 ?auto_3901658 ) ) ( not ( = ?auto_3901661 ?auto_3901660 ) ) ( ON_BOARD ?auto_3901665 ?auto_3901664 ) ( SUPPORTS ?auto_3901665 ?auto_3901657 ) ( not ( = ?auto_3901656 ?auto_3901666 ) ) ( HAVE_IMAGE ?auto_3901658 ?auto_3901655 ) ( not ( = ?auto_3901658 ?auto_3901666 ) ) ( not ( = ?auto_3901655 ?auto_3901657 ) ) ( CALIBRATION_TARGET ?auto_3901665 ?auto_3901666 ) ( POWER_AVAIL ?auto_3901664 ) ( POINTING ?auto_3901664 ?auto_3901663 ) ( not ( = ?auto_3901666 ?auto_3901663 ) ) ( not ( = ?auto_3901656 ?auto_3901663 ) ) ( not ( = ?auto_3901658 ?auto_3901663 ) ) ( HAVE_IMAGE ?auto_3901660 ?auto_3901659 ) ( HAVE_IMAGE ?auto_3901661 ?auto_3901662 ) ( not ( = ?auto_3901657 ?auto_3901659 ) ) ( not ( = ?auto_3901657 ?auto_3901662 ) ) ( not ( = ?auto_3901655 ?auto_3901659 ) ) ( not ( = ?auto_3901655 ?auto_3901662 ) ) ( not ( = ?auto_3901660 ?auto_3901666 ) ) ( not ( = ?auto_3901660 ?auto_3901663 ) ) ( not ( = ?auto_3901659 ?auto_3901662 ) ) ( not ( = ?auto_3901661 ?auto_3901666 ) ) ( not ( = ?auto_3901661 ?auto_3901663 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3901658 ?auto_3901655 ?auto_3901656 ?auto_3901657 )
      ( GET-4IMAGE-VERIFY ?auto_3901656 ?auto_3901657 ?auto_3901658 ?auto_3901655 ?auto_3901660 ?auto_3901659 ?auto_3901661 ?auto_3901662 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3904183 - DIRECTION
      ?auto_3904184 - MODE
      ?auto_3904185 - DIRECTION
      ?auto_3904182 - MODE
      ?auto_3904187 - DIRECTION
      ?auto_3904186 - MODE
      ?auto_3904188 - DIRECTION
      ?auto_3904189 - MODE
      ?auto_3904190 - DIRECTION
      ?auto_3904191 - MODE
    )
    :vars
    (
      ?auto_3904193 - INSTRUMENT
      ?auto_3904192 - SATELLITE
      ?auto_3904194 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3904185 ?auto_3904183 ) ) ( not ( = ?auto_3904187 ?auto_3904183 ) ) ( not ( = ?auto_3904187 ?auto_3904185 ) ) ( not ( = ?auto_3904188 ?auto_3904183 ) ) ( not ( = ?auto_3904188 ?auto_3904185 ) ) ( not ( = ?auto_3904188 ?auto_3904187 ) ) ( not ( = ?auto_3904190 ?auto_3904183 ) ) ( not ( = ?auto_3904190 ?auto_3904185 ) ) ( not ( = ?auto_3904190 ?auto_3904187 ) ) ( not ( = ?auto_3904190 ?auto_3904188 ) ) ( ON_BOARD ?auto_3904193 ?auto_3904192 ) ( SUPPORTS ?auto_3904193 ?auto_3904191 ) ( not ( = ?auto_3904190 ?auto_3904194 ) ) ( HAVE_IMAGE ?auto_3904183 ?auto_3904184 ) ( not ( = ?auto_3904183 ?auto_3904194 ) ) ( not ( = ?auto_3904184 ?auto_3904191 ) ) ( CALIBRATION_TARGET ?auto_3904193 ?auto_3904194 ) ( POWER_AVAIL ?auto_3904192 ) ( POINTING ?auto_3904192 ?auto_3904188 ) ( not ( = ?auto_3904194 ?auto_3904188 ) ) ( HAVE_IMAGE ?auto_3904185 ?auto_3904182 ) ( HAVE_IMAGE ?auto_3904187 ?auto_3904186 ) ( HAVE_IMAGE ?auto_3904188 ?auto_3904189 ) ( not ( = ?auto_3904184 ?auto_3904182 ) ) ( not ( = ?auto_3904184 ?auto_3904186 ) ) ( not ( = ?auto_3904184 ?auto_3904189 ) ) ( not ( = ?auto_3904185 ?auto_3904194 ) ) ( not ( = ?auto_3904182 ?auto_3904186 ) ) ( not ( = ?auto_3904182 ?auto_3904189 ) ) ( not ( = ?auto_3904182 ?auto_3904191 ) ) ( not ( = ?auto_3904187 ?auto_3904194 ) ) ( not ( = ?auto_3904186 ?auto_3904189 ) ) ( not ( = ?auto_3904186 ?auto_3904191 ) ) ( not ( = ?auto_3904189 ?auto_3904191 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3904183 ?auto_3904184 ?auto_3904190 ?auto_3904191 )
      ( GET-5IMAGE-VERIFY ?auto_3904183 ?auto_3904184 ?auto_3904185 ?auto_3904182 ?auto_3904187 ?auto_3904186 ?auto_3904188 ?auto_3904189 ?auto_3904190 ?auto_3904191 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3904238 - DIRECTION
      ?auto_3904239 - MODE
      ?auto_3904240 - DIRECTION
      ?auto_3904237 - MODE
      ?auto_3904242 - DIRECTION
      ?auto_3904241 - MODE
      ?auto_3904243 - DIRECTION
      ?auto_3904244 - MODE
      ?auto_3904245 - DIRECTION
      ?auto_3904246 - MODE
    )
    :vars
    (
      ?auto_3904248 - INSTRUMENT
      ?auto_3904247 - SATELLITE
      ?auto_3904249 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3904240 ?auto_3904238 ) ) ( not ( = ?auto_3904242 ?auto_3904238 ) ) ( not ( = ?auto_3904242 ?auto_3904240 ) ) ( not ( = ?auto_3904243 ?auto_3904238 ) ) ( not ( = ?auto_3904243 ?auto_3904240 ) ) ( not ( = ?auto_3904243 ?auto_3904242 ) ) ( not ( = ?auto_3904245 ?auto_3904238 ) ) ( not ( = ?auto_3904245 ?auto_3904240 ) ) ( not ( = ?auto_3904245 ?auto_3904242 ) ) ( not ( = ?auto_3904245 ?auto_3904243 ) ) ( ON_BOARD ?auto_3904248 ?auto_3904247 ) ( SUPPORTS ?auto_3904248 ?auto_3904244 ) ( not ( = ?auto_3904243 ?auto_3904249 ) ) ( HAVE_IMAGE ?auto_3904238 ?auto_3904239 ) ( not ( = ?auto_3904238 ?auto_3904249 ) ) ( not ( = ?auto_3904239 ?auto_3904244 ) ) ( CALIBRATION_TARGET ?auto_3904248 ?auto_3904249 ) ( POWER_AVAIL ?auto_3904247 ) ( POINTING ?auto_3904247 ?auto_3904245 ) ( not ( = ?auto_3904249 ?auto_3904245 ) ) ( HAVE_IMAGE ?auto_3904240 ?auto_3904237 ) ( HAVE_IMAGE ?auto_3904242 ?auto_3904241 ) ( HAVE_IMAGE ?auto_3904245 ?auto_3904246 ) ( not ( = ?auto_3904239 ?auto_3904237 ) ) ( not ( = ?auto_3904239 ?auto_3904241 ) ) ( not ( = ?auto_3904239 ?auto_3904246 ) ) ( not ( = ?auto_3904240 ?auto_3904249 ) ) ( not ( = ?auto_3904237 ?auto_3904241 ) ) ( not ( = ?auto_3904237 ?auto_3904244 ) ) ( not ( = ?auto_3904237 ?auto_3904246 ) ) ( not ( = ?auto_3904242 ?auto_3904249 ) ) ( not ( = ?auto_3904241 ?auto_3904244 ) ) ( not ( = ?auto_3904241 ?auto_3904246 ) ) ( not ( = ?auto_3904244 ?auto_3904246 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3904238 ?auto_3904239 ?auto_3904243 ?auto_3904244 )
      ( GET-5IMAGE-VERIFY ?auto_3904238 ?auto_3904239 ?auto_3904240 ?auto_3904237 ?auto_3904242 ?auto_3904241 ?auto_3904243 ?auto_3904244 ?auto_3904245 ?auto_3904246 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3904291 - DIRECTION
      ?auto_3904292 - MODE
      ?auto_3904293 - DIRECTION
      ?auto_3904290 - MODE
      ?auto_3904295 - DIRECTION
      ?auto_3904294 - MODE
      ?auto_3904296 - DIRECTION
      ?auto_3904297 - MODE
      ?auto_3904298 - DIRECTION
      ?auto_3904299 - MODE
    )
    :vars
    (
      ?auto_3904301 - INSTRUMENT
      ?auto_3904300 - SATELLITE
      ?auto_3904302 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3904293 ?auto_3904291 ) ) ( not ( = ?auto_3904295 ?auto_3904291 ) ) ( not ( = ?auto_3904295 ?auto_3904293 ) ) ( not ( = ?auto_3904296 ?auto_3904291 ) ) ( not ( = ?auto_3904296 ?auto_3904293 ) ) ( not ( = ?auto_3904296 ?auto_3904295 ) ) ( not ( = ?auto_3904298 ?auto_3904291 ) ) ( not ( = ?auto_3904298 ?auto_3904293 ) ) ( not ( = ?auto_3904298 ?auto_3904295 ) ) ( not ( = ?auto_3904298 ?auto_3904296 ) ) ( ON_BOARD ?auto_3904301 ?auto_3904300 ) ( SUPPORTS ?auto_3904301 ?auto_3904299 ) ( not ( = ?auto_3904298 ?auto_3904302 ) ) ( HAVE_IMAGE ?auto_3904291 ?auto_3904292 ) ( not ( = ?auto_3904291 ?auto_3904302 ) ) ( not ( = ?auto_3904292 ?auto_3904299 ) ) ( CALIBRATION_TARGET ?auto_3904301 ?auto_3904302 ) ( POWER_AVAIL ?auto_3904300 ) ( POINTING ?auto_3904300 ?auto_3904295 ) ( not ( = ?auto_3904302 ?auto_3904295 ) ) ( HAVE_IMAGE ?auto_3904293 ?auto_3904290 ) ( HAVE_IMAGE ?auto_3904295 ?auto_3904294 ) ( HAVE_IMAGE ?auto_3904296 ?auto_3904297 ) ( not ( = ?auto_3904292 ?auto_3904290 ) ) ( not ( = ?auto_3904292 ?auto_3904294 ) ) ( not ( = ?auto_3904292 ?auto_3904297 ) ) ( not ( = ?auto_3904293 ?auto_3904302 ) ) ( not ( = ?auto_3904290 ?auto_3904294 ) ) ( not ( = ?auto_3904290 ?auto_3904297 ) ) ( not ( = ?auto_3904290 ?auto_3904299 ) ) ( not ( = ?auto_3904294 ?auto_3904297 ) ) ( not ( = ?auto_3904294 ?auto_3904299 ) ) ( not ( = ?auto_3904296 ?auto_3904302 ) ) ( not ( = ?auto_3904297 ?auto_3904299 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3904291 ?auto_3904292 ?auto_3904298 ?auto_3904299 )
      ( GET-5IMAGE-VERIFY ?auto_3904291 ?auto_3904292 ?auto_3904293 ?auto_3904290 ?auto_3904295 ?auto_3904294 ?auto_3904296 ?auto_3904297 ?auto_3904298 ?auto_3904299 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3904343 - DIRECTION
      ?auto_3904344 - MODE
      ?auto_3904345 - DIRECTION
      ?auto_3904342 - MODE
      ?auto_3904347 - DIRECTION
      ?auto_3904346 - MODE
      ?auto_3904348 - DIRECTION
      ?auto_3904349 - MODE
      ?auto_3904350 - DIRECTION
      ?auto_3904351 - MODE
    )
    :vars
    (
      ?auto_3904353 - INSTRUMENT
      ?auto_3904352 - SATELLITE
      ?auto_3904354 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3904345 ?auto_3904343 ) ) ( not ( = ?auto_3904347 ?auto_3904343 ) ) ( not ( = ?auto_3904347 ?auto_3904345 ) ) ( not ( = ?auto_3904348 ?auto_3904343 ) ) ( not ( = ?auto_3904348 ?auto_3904345 ) ) ( not ( = ?auto_3904348 ?auto_3904347 ) ) ( not ( = ?auto_3904350 ?auto_3904343 ) ) ( not ( = ?auto_3904350 ?auto_3904345 ) ) ( not ( = ?auto_3904350 ?auto_3904347 ) ) ( not ( = ?auto_3904350 ?auto_3904348 ) ) ( ON_BOARD ?auto_3904353 ?auto_3904352 ) ( SUPPORTS ?auto_3904353 ?auto_3904349 ) ( not ( = ?auto_3904348 ?auto_3904354 ) ) ( HAVE_IMAGE ?auto_3904343 ?auto_3904344 ) ( not ( = ?auto_3904343 ?auto_3904354 ) ) ( not ( = ?auto_3904344 ?auto_3904349 ) ) ( CALIBRATION_TARGET ?auto_3904353 ?auto_3904354 ) ( POWER_AVAIL ?auto_3904352 ) ( POINTING ?auto_3904352 ?auto_3904347 ) ( not ( = ?auto_3904354 ?auto_3904347 ) ) ( HAVE_IMAGE ?auto_3904345 ?auto_3904342 ) ( HAVE_IMAGE ?auto_3904347 ?auto_3904346 ) ( HAVE_IMAGE ?auto_3904350 ?auto_3904351 ) ( not ( = ?auto_3904344 ?auto_3904342 ) ) ( not ( = ?auto_3904344 ?auto_3904346 ) ) ( not ( = ?auto_3904344 ?auto_3904351 ) ) ( not ( = ?auto_3904345 ?auto_3904354 ) ) ( not ( = ?auto_3904342 ?auto_3904346 ) ) ( not ( = ?auto_3904342 ?auto_3904349 ) ) ( not ( = ?auto_3904342 ?auto_3904351 ) ) ( not ( = ?auto_3904346 ?auto_3904349 ) ) ( not ( = ?auto_3904346 ?auto_3904351 ) ) ( not ( = ?auto_3904349 ?auto_3904351 ) ) ( not ( = ?auto_3904350 ?auto_3904354 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3904343 ?auto_3904344 ?auto_3904348 ?auto_3904349 )
      ( GET-5IMAGE-VERIFY ?auto_3904343 ?auto_3904344 ?auto_3904345 ?auto_3904342 ?auto_3904347 ?auto_3904346 ?auto_3904348 ?auto_3904349 ?auto_3904350 ?auto_3904351 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3904562 - DIRECTION
      ?auto_3904563 - MODE
      ?auto_3904564 - DIRECTION
      ?auto_3904561 - MODE
      ?auto_3904566 - DIRECTION
      ?auto_3904565 - MODE
      ?auto_3904567 - DIRECTION
      ?auto_3904568 - MODE
      ?auto_3904569 - DIRECTION
      ?auto_3904570 - MODE
    )
    :vars
    (
      ?auto_3904572 - INSTRUMENT
      ?auto_3904571 - SATELLITE
      ?auto_3904573 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3904564 ?auto_3904562 ) ) ( not ( = ?auto_3904566 ?auto_3904562 ) ) ( not ( = ?auto_3904566 ?auto_3904564 ) ) ( not ( = ?auto_3904567 ?auto_3904562 ) ) ( not ( = ?auto_3904567 ?auto_3904564 ) ) ( not ( = ?auto_3904567 ?auto_3904566 ) ) ( not ( = ?auto_3904569 ?auto_3904562 ) ) ( not ( = ?auto_3904569 ?auto_3904564 ) ) ( not ( = ?auto_3904569 ?auto_3904566 ) ) ( not ( = ?auto_3904569 ?auto_3904567 ) ) ( ON_BOARD ?auto_3904572 ?auto_3904571 ) ( SUPPORTS ?auto_3904572 ?auto_3904565 ) ( not ( = ?auto_3904566 ?auto_3904573 ) ) ( HAVE_IMAGE ?auto_3904562 ?auto_3904563 ) ( not ( = ?auto_3904562 ?auto_3904573 ) ) ( not ( = ?auto_3904563 ?auto_3904565 ) ) ( CALIBRATION_TARGET ?auto_3904572 ?auto_3904573 ) ( POWER_AVAIL ?auto_3904571 ) ( POINTING ?auto_3904571 ?auto_3904569 ) ( not ( = ?auto_3904573 ?auto_3904569 ) ) ( HAVE_IMAGE ?auto_3904564 ?auto_3904561 ) ( HAVE_IMAGE ?auto_3904567 ?auto_3904568 ) ( HAVE_IMAGE ?auto_3904569 ?auto_3904570 ) ( not ( = ?auto_3904563 ?auto_3904561 ) ) ( not ( = ?auto_3904563 ?auto_3904568 ) ) ( not ( = ?auto_3904563 ?auto_3904570 ) ) ( not ( = ?auto_3904564 ?auto_3904573 ) ) ( not ( = ?auto_3904561 ?auto_3904565 ) ) ( not ( = ?auto_3904561 ?auto_3904568 ) ) ( not ( = ?auto_3904561 ?auto_3904570 ) ) ( not ( = ?auto_3904565 ?auto_3904568 ) ) ( not ( = ?auto_3904565 ?auto_3904570 ) ) ( not ( = ?auto_3904567 ?auto_3904573 ) ) ( not ( = ?auto_3904568 ?auto_3904570 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3904562 ?auto_3904563 ?auto_3904566 ?auto_3904565 )
      ( GET-5IMAGE-VERIFY ?auto_3904562 ?auto_3904563 ?auto_3904564 ?auto_3904561 ?auto_3904566 ?auto_3904565 ?auto_3904567 ?auto_3904568 ?auto_3904569 ?auto_3904570 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3904615 - DIRECTION
      ?auto_3904616 - MODE
      ?auto_3904617 - DIRECTION
      ?auto_3904614 - MODE
      ?auto_3904619 - DIRECTION
      ?auto_3904618 - MODE
      ?auto_3904620 - DIRECTION
      ?auto_3904621 - MODE
      ?auto_3904622 - DIRECTION
      ?auto_3904623 - MODE
    )
    :vars
    (
      ?auto_3904625 - INSTRUMENT
      ?auto_3904624 - SATELLITE
      ?auto_3904626 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3904617 ?auto_3904615 ) ) ( not ( = ?auto_3904619 ?auto_3904615 ) ) ( not ( = ?auto_3904619 ?auto_3904617 ) ) ( not ( = ?auto_3904620 ?auto_3904615 ) ) ( not ( = ?auto_3904620 ?auto_3904617 ) ) ( not ( = ?auto_3904620 ?auto_3904619 ) ) ( not ( = ?auto_3904622 ?auto_3904615 ) ) ( not ( = ?auto_3904622 ?auto_3904617 ) ) ( not ( = ?auto_3904622 ?auto_3904619 ) ) ( not ( = ?auto_3904622 ?auto_3904620 ) ) ( ON_BOARD ?auto_3904625 ?auto_3904624 ) ( SUPPORTS ?auto_3904625 ?auto_3904618 ) ( not ( = ?auto_3904619 ?auto_3904626 ) ) ( HAVE_IMAGE ?auto_3904615 ?auto_3904616 ) ( not ( = ?auto_3904615 ?auto_3904626 ) ) ( not ( = ?auto_3904616 ?auto_3904618 ) ) ( CALIBRATION_TARGET ?auto_3904625 ?auto_3904626 ) ( POWER_AVAIL ?auto_3904624 ) ( POINTING ?auto_3904624 ?auto_3904620 ) ( not ( = ?auto_3904626 ?auto_3904620 ) ) ( HAVE_IMAGE ?auto_3904617 ?auto_3904614 ) ( HAVE_IMAGE ?auto_3904620 ?auto_3904621 ) ( HAVE_IMAGE ?auto_3904622 ?auto_3904623 ) ( not ( = ?auto_3904616 ?auto_3904614 ) ) ( not ( = ?auto_3904616 ?auto_3904621 ) ) ( not ( = ?auto_3904616 ?auto_3904623 ) ) ( not ( = ?auto_3904617 ?auto_3904626 ) ) ( not ( = ?auto_3904614 ?auto_3904618 ) ) ( not ( = ?auto_3904614 ?auto_3904621 ) ) ( not ( = ?auto_3904614 ?auto_3904623 ) ) ( not ( = ?auto_3904618 ?auto_3904621 ) ) ( not ( = ?auto_3904618 ?auto_3904623 ) ) ( not ( = ?auto_3904621 ?auto_3904623 ) ) ( not ( = ?auto_3904622 ?auto_3904626 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3904615 ?auto_3904616 ?auto_3904619 ?auto_3904618 )
      ( GET-5IMAGE-VERIFY ?auto_3904615 ?auto_3904616 ?auto_3904617 ?auto_3904614 ?auto_3904619 ?auto_3904618 ?auto_3904620 ?auto_3904621 ?auto_3904622 ?auto_3904623 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3905678 - DIRECTION
      ?auto_3905679 - MODE
      ?auto_3905680 - DIRECTION
      ?auto_3905677 - MODE
      ?auto_3905682 - DIRECTION
      ?auto_3905681 - MODE
      ?auto_3905683 - DIRECTION
      ?auto_3905684 - MODE
      ?auto_3905685 - DIRECTION
      ?auto_3905686 - MODE
    )
    :vars
    (
      ?auto_3905688 - INSTRUMENT
      ?auto_3905687 - SATELLITE
      ?auto_3905689 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3905680 ?auto_3905678 ) ) ( not ( = ?auto_3905682 ?auto_3905678 ) ) ( not ( = ?auto_3905682 ?auto_3905680 ) ) ( not ( = ?auto_3905683 ?auto_3905678 ) ) ( not ( = ?auto_3905683 ?auto_3905680 ) ) ( not ( = ?auto_3905683 ?auto_3905682 ) ) ( not ( = ?auto_3905685 ?auto_3905678 ) ) ( not ( = ?auto_3905685 ?auto_3905680 ) ) ( not ( = ?auto_3905685 ?auto_3905682 ) ) ( not ( = ?auto_3905685 ?auto_3905683 ) ) ( ON_BOARD ?auto_3905688 ?auto_3905687 ) ( SUPPORTS ?auto_3905688 ?auto_3905686 ) ( not ( = ?auto_3905685 ?auto_3905689 ) ) ( HAVE_IMAGE ?auto_3905678 ?auto_3905679 ) ( not ( = ?auto_3905678 ?auto_3905689 ) ) ( not ( = ?auto_3905679 ?auto_3905686 ) ) ( CALIBRATION_TARGET ?auto_3905688 ?auto_3905689 ) ( POWER_AVAIL ?auto_3905687 ) ( POINTING ?auto_3905687 ?auto_3905680 ) ( not ( = ?auto_3905689 ?auto_3905680 ) ) ( HAVE_IMAGE ?auto_3905680 ?auto_3905677 ) ( HAVE_IMAGE ?auto_3905682 ?auto_3905681 ) ( HAVE_IMAGE ?auto_3905683 ?auto_3905684 ) ( not ( = ?auto_3905679 ?auto_3905677 ) ) ( not ( = ?auto_3905679 ?auto_3905681 ) ) ( not ( = ?auto_3905679 ?auto_3905684 ) ) ( not ( = ?auto_3905677 ?auto_3905681 ) ) ( not ( = ?auto_3905677 ?auto_3905684 ) ) ( not ( = ?auto_3905677 ?auto_3905686 ) ) ( not ( = ?auto_3905682 ?auto_3905689 ) ) ( not ( = ?auto_3905681 ?auto_3905684 ) ) ( not ( = ?auto_3905681 ?auto_3905686 ) ) ( not ( = ?auto_3905683 ?auto_3905689 ) ) ( not ( = ?auto_3905684 ?auto_3905686 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3905678 ?auto_3905679 ?auto_3905685 ?auto_3905686 )
      ( GET-5IMAGE-VERIFY ?auto_3905678 ?auto_3905679 ?auto_3905680 ?auto_3905677 ?auto_3905682 ?auto_3905681 ?auto_3905683 ?auto_3905684 ?auto_3905685 ?auto_3905686 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3905730 - DIRECTION
      ?auto_3905731 - MODE
      ?auto_3905732 - DIRECTION
      ?auto_3905729 - MODE
      ?auto_3905734 - DIRECTION
      ?auto_3905733 - MODE
      ?auto_3905735 - DIRECTION
      ?auto_3905736 - MODE
      ?auto_3905737 - DIRECTION
      ?auto_3905738 - MODE
    )
    :vars
    (
      ?auto_3905740 - INSTRUMENT
      ?auto_3905739 - SATELLITE
      ?auto_3905741 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3905732 ?auto_3905730 ) ) ( not ( = ?auto_3905734 ?auto_3905730 ) ) ( not ( = ?auto_3905734 ?auto_3905732 ) ) ( not ( = ?auto_3905735 ?auto_3905730 ) ) ( not ( = ?auto_3905735 ?auto_3905732 ) ) ( not ( = ?auto_3905735 ?auto_3905734 ) ) ( not ( = ?auto_3905737 ?auto_3905730 ) ) ( not ( = ?auto_3905737 ?auto_3905732 ) ) ( not ( = ?auto_3905737 ?auto_3905734 ) ) ( not ( = ?auto_3905737 ?auto_3905735 ) ) ( ON_BOARD ?auto_3905740 ?auto_3905739 ) ( SUPPORTS ?auto_3905740 ?auto_3905736 ) ( not ( = ?auto_3905735 ?auto_3905741 ) ) ( HAVE_IMAGE ?auto_3905730 ?auto_3905731 ) ( not ( = ?auto_3905730 ?auto_3905741 ) ) ( not ( = ?auto_3905731 ?auto_3905736 ) ) ( CALIBRATION_TARGET ?auto_3905740 ?auto_3905741 ) ( POWER_AVAIL ?auto_3905739 ) ( POINTING ?auto_3905739 ?auto_3905732 ) ( not ( = ?auto_3905741 ?auto_3905732 ) ) ( HAVE_IMAGE ?auto_3905732 ?auto_3905729 ) ( HAVE_IMAGE ?auto_3905734 ?auto_3905733 ) ( HAVE_IMAGE ?auto_3905737 ?auto_3905738 ) ( not ( = ?auto_3905731 ?auto_3905729 ) ) ( not ( = ?auto_3905731 ?auto_3905733 ) ) ( not ( = ?auto_3905731 ?auto_3905738 ) ) ( not ( = ?auto_3905729 ?auto_3905733 ) ) ( not ( = ?auto_3905729 ?auto_3905736 ) ) ( not ( = ?auto_3905729 ?auto_3905738 ) ) ( not ( = ?auto_3905734 ?auto_3905741 ) ) ( not ( = ?auto_3905733 ?auto_3905736 ) ) ( not ( = ?auto_3905733 ?auto_3905738 ) ) ( not ( = ?auto_3905736 ?auto_3905738 ) ) ( not ( = ?auto_3905737 ?auto_3905741 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3905730 ?auto_3905731 ?auto_3905735 ?auto_3905736 )
      ( GET-5IMAGE-VERIFY ?auto_3905730 ?auto_3905731 ?auto_3905732 ?auto_3905729 ?auto_3905734 ?auto_3905733 ?auto_3905735 ?auto_3905736 ?auto_3905737 ?auto_3905738 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3906088 - DIRECTION
      ?auto_3906089 - MODE
      ?auto_3906090 - DIRECTION
      ?auto_3906087 - MODE
      ?auto_3906092 - DIRECTION
      ?auto_3906091 - MODE
      ?auto_3906093 - DIRECTION
      ?auto_3906094 - MODE
      ?auto_3906095 - DIRECTION
      ?auto_3906096 - MODE
    )
    :vars
    (
      ?auto_3906098 - INSTRUMENT
      ?auto_3906097 - SATELLITE
      ?auto_3906099 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3906090 ?auto_3906088 ) ) ( not ( = ?auto_3906092 ?auto_3906088 ) ) ( not ( = ?auto_3906092 ?auto_3906090 ) ) ( not ( = ?auto_3906093 ?auto_3906088 ) ) ( not ( = ?auto_3906093 ?auto_3906090 ) ) ( not ( = ?auto_3906093 ?auto_3906092 ) ) ( not ( = ?auto_3906095 ?auto_3906088 ) ) ( not ( = ?auto_3906095 ?auto_3906090 ) ) ( not ( = ?auto_3906095 ?auto_3906092 ) ) ( not ( = ?auto_3906095 ?auto_3906093 ) ) ( ON_BOARD ?auto_3906098 ?auto_3906097 ) ( SUPPORTS ?auto_3906098 ?auto_3906091 ) ( not ( = ?auto_3906092 ?auto_3906099 ) ) ( HAVE_IMAGE ?auto_3906088 ?auto_3906089 ) ( not ( = ?auto_3906088 ?auto_3906099 ) ) ( not ( = ?auto_3906089 ?auto_3906091 ) ) ( CALIBRATION_TARGET ?auto_3906098 ?auto_3906099 ) ( POWER_AVAIL ?auto_3906097 ) ( POINTING ?auto_3906097 ?auto_3906090 ) ( not ( = ?auto_3906099 ?auto_3906090 ) ) ( HAVE_IMAGE ?auto_3906090 ?auto_3906087 ) ( HAVE_IMAGE ?auto_3906093 ?auto_3906094 ) ( HAVE_IMAGE ?auto_3906095 ?auto_3906096 ) ( not ( = ?auto_3906089 ?auto_3906087 ) ) ( not ( = ?auto_3906089 ?auto_3906094 ) ) ( not ( = ?auto_3906089 ?auto_3906096 ) ) ( not ( = ?auto_3906087 ?auto_3906091 ) ) ( not ( = ?auto_3906087 ?auto_3906094 ) ) ( not ( = ?auto_3906087 ?auto_3906096 ) ) ( not ( = ?auto_3906091 ?auto_3906094 ) ) ( not ( = ?auto_3906091 ?auto_3906096 ) ) ( not ( = ?auto_3906093 ?auto_3906099 ) ) ( not ( = ?auto_3906094 ?auto_3906096 ) ) ( not ( = ?auto_3906095 ?auto_3906099 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3906088 ?auto_3906089 ?auto_3906092 ?auto_3906091 )
      ( GET-5IMAGE-VERIFY ?auto_3906088 ?auto_3906089 ?auto_3906090 ?auto_3906087 ?auto_3906092 ?auto_3906091 ?auto_3906093 ?auto_3906094 ?auto_3906095 ?auto_3906096 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3906840 - DIRECTION
      ?auto_3906841 - MODE
      ?auto_3906842 - DIRECTION
      ?auto_3906839 - MODE
      ?auto_3906844 - DIRECTION
      ?auto_3906843 - MODE
      ?auto_3906845 - DIRECTION
      ?auto_3906846 - MODE
      ?auto_3906847 - DIRECTION
      ?auto_3906848 - MODE
    )
    :vars
    (
      ?auto_3906850 - INSTRUMENT
      ?auto_3906849 - SATELLITE
      ?auto_3906851 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3906842 ?auto_3906840 ) ) ( not ( = ?auto_3906844 ?auto_3906840 ) ) ( not ( = ?auto_3906844 ?auto_3906842 ) ) ( not ( = ?auto_3906845 ?auto_3906840 ) ) ( not ( = ?auto_3906845 ?auto_3906842 ) ) ( not ( = ?auto_3906845 ?auto_3906844 ) ) ( not ( = ?auto_3906847 ?auto_3906840 ) ) ( not ( = ?auto_3906847 ?auto_3906842 ) ) ( not ( = ?auto_3906847 ?auto_3906844 ) ) ( not ( = ?auto_3906847 ?auto_3906845 ) ) ( ON_BOARD ?auto_3906850 ?auto_3906849 ) ( SUPPORTS ?auto_3906850 ?auto_3906839 ) ( not ( = ?auto_3906842 ?auto_3906851 ) ) ( HAVE_IMAGE ?auto_3906840 ?auto_3906841 ) ( not ( = ?auto_3906840 ?auto_3906851 ) ) ( not ( = ?auto_3906841 ?auto_3906839 ) ) ( CALIBRATION_TARGET ?auto_3906850 ?auto_3906851 ) ( POWER_AVAIL ?auto_3906849 ) ( POINTING ?auto_3906849 ?auto_3906847 ) ( not ( = ?auto_3906851 ?auto_3906847 ) ) ( HAVE_IMAGE ?auto_3906844 ?auto_3906843 ) ( HAVE_IMAGE ?auto_3906845 ?auto_3906846 ) ( HAVE_IMAGE ?auto_3906847 ?auto_3906848 ) ( not ( = ?auto_3906841 ?auto_3906843 ) ) ( not ( = ?auto_3906841 ?auto_3906846 ) ) ( not ( = ?auto_3906841 ?auto_3906848 ) ) ( not ( = ?auto_3906839 ?auto_3906843 ) ) ( not ( = ?auto_3906839 ?auto_3906846 ) ) ( not ( = ?auto_3906839 ?auto_3906848 ) ) ( not ( = ?auto_3906844 ?auto_3906851 ) ) ( not ( = ?auto_3906843 ?auto_3906846 ) ) ( not ( = ?auto_3906843 ?auto_3906848 ) ) ( not ( = ?auto_3906845 ?auto_3906851 ) ) ( not ( = ?auto_3906846 ?auto_3906848 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3906840 ?auto_3906841 ?auto_3906842 ?auto_3906839 )
      ( GET-5IMAGE-VERIFY ?auto_3906840 ?auto_3906841 ?auto_3906842 ?auto_3906839 ?auto_3906844 ?auto_3906843 ?auto_3906845 ?auto_3906846 ?auto_3906847 ?auto_3906848 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3906893 - DIRECTION
      ?auto_3906894 - MODE
      ?auto_3906895 - DIRECTION
      ?auto_3906892 - MODE
      ?auto_3906897 - DIRECTION
      ?auto_3906896 - MODE
      ?auto_3906898 - DIRECTION
      ?auto_3906899 - MODE
      ?auto_3906900 - DIRECTION
      ?auto_3906901 - MODE
    )
    :vars
    (
      ?auto_3906903 - INSTRUMENT
      ?auto_3906902 - SATELLITE
      ?auto_3906904 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3906895 ?auto_3906893 ) ) ( not ( = ?auto_3906897 ?auto_3906893 ) ) ( not ( = ?auto_3906897 ?auto_3906895 ) ) ( not ( = ?auto_3906898 ?auto_3906893 ) ) ( not ( = ?auto_3906898 ?auto_3906895 ) ) ( not ( = ?auto_3906898 ?auto_3906897 ) ) ( not ( = ?auto_3906900 ?auto_3906893 ) ) ( not ( = ?auto_3906900 ?auto_3906895 ) ) ( not ( = ?auto_3906900 ?auto_3906897 ) ) ( not ( = ?auto_3906900 ?auto_3906898 ) ) ( ON_BOARD ?auto_3906903 ?auto_3906902 ) ( SUPPORTS ?auto_3906903 ?auto_3906892 ) ( not ( = ?auto_3906895 ?auto_3906904 ) ) ( HAVE_IMAGE ?auto_3906893 ?auto_3906894 ) ( not ( = ?auto_3906893 ?auto_3906904 ) ) ( not ( = ?auto_3906894 ?auto_3906892 ) ) ( CALIBRATION_TARGET ?auto_3906903 ?auto_3906904 ) ( POWER_AVAIL ?auto_3906902 ) ( POINTING ?auto_3906902 ?auto_3906898 ) ( not ( = ?auto_3906904 ?auto_3906898 ) ) ( HAVE_IMAGE ?auto_3906897 ?auto_3906896 ) ( HAVE_IMAGE ?auto_3906898 ?auto_3906899 ) ( HAVE_IMAGE ?auto_3906900 ?auto_3906901 ) ( not ( = ?auto_3906894 ?auto_3906896 ) ) ( not ( = ?auto_3906894 ?auto_3906899 ) ) ( not ( = ?auto_3906894 ?auto_3906901 ) ) ( not ( = ?auto_3906892 ?auto_3906896 ) ) ( not ( = ?auto_3906892 ?auto_3906899 ) ) ( not ( = ?auto_3906892 ?auto_3906901 ) ) ( not ( = ?auto_3906897 ?auto_3906904 ) ) ( not ( = ?auto_3906896 ?auto_3906899 ) ) ( not ( = ?auto_3906896 ?auto_3906901 ) ) ( not ( = ?auto_3906899 ?auto_3906901 ) ) ( not ( = ?auto_3906900 ?auto_3906904 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3906893 ?auto_3906894 ?auto_3906895 ?auto_3906892 )
      ( GET-5IMAGE-VERIFY ?auto_3906893 ?auto_3906894 ?auto_3906895 ?auto_3906892 ?auto_3906897 ?auto_3906896 ?auto_3906898 ?auto_3906899 ?auto_3906900 ?auto_3906901 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3907427 - DIRECTION
      ?auto_3907428 - MODE
      ?auto_3907429 - DIRECTION
      ?auto_3907426 - MODE
      ?auto_3907431 - DIRECTION
      ?auto_3907430 - MODE
      ?auto_3907432 - DIRECTION
      ?auto_3907433 - MODE
      ?auto_3907434 - DIRECTION
      ?auto_3907435 - MODE
    )
    :vars
    (
      ?auto_3907437 - INSTRUMENT
      ?auto_3907436 - SATELLITE
      ?auto_3907438 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3907429 ?auto_3907427 ) ) ( not ( = ?auto_3907431 ?auto_3907427 ) ) ( not ( = ?auto_3907431 ?auto_3907429 ) ) ( not ( = ?auto_3907432 ?auto_3907427 ) ) ( not ( = ?auto_3907432 ?auto_3907429 ) ) ( not ( = ?auto_3907432 ?auto_3907431 ) ) ( not ( = ?auto_3907434 ?auto_3907427 ) ) ( not ( = ?auto_3907434 ?auto_3907429 ) ) ( not ( = ?auto_3907434 ?auto_3907431 ) ) ( not ( = ?auto_3907434 ?auto_3907432 ) ) ( ON_BOARD ?auto_3907437 ?auto_3907436 ) ( SUPPORTS ?auto_3907437 ?auto_3907426 ) ( not ( = ?auto_3907429 ?auto_3907438 ) ) ( HAVE_IMAGE ?auto_3907427 ?auto_3907428 ) ( not ( = ?auto_3907427 ?auto_3907438 ) ) ( not ( = ?auto_3907428 ?auto_3907426 ) ) ( CALIBRATION_TARGET ?auto_3907437 ?auto_3907438 ) ( POWER_AVAIL ?auto_3907436 ) ( POINTING ?auto_3907436 ?auto_3907431 ) ( not ( = ?auto_3907438 ?auto_3907431 ) ) ( HAVE_IMAGE ?auto_3907431 ?auto_3907430 ) ( HAVE_IMAGE ?auto_3907432 ?auto_3907433 ) ( HAVE_IMAGE ?auto_3907434 ?auto_3907435 ) ( not ( = ?auto_3907428 ?auto_3907430 ) ) ( not ( = ?auto_3907428 ?auto_3907433 ) ) ( not ( = ?auto_3907428 ?auto_3907435 ) ) ( not ( = ?auto_3907426 ?auto_3907430 ) ) ( not ( = ?auto_3907426 ?auto_3907433 ) ) ( not ( = ?auto_3907426 ?auto_3907435 ) ) ( not ( = ?auto_3907430 ?auto_3907433 ) ) ( not ( = ?auto_3907430 ?auto_3907435 ) ) ( not ( = ?auto_3907432 ?auto_3907438 ) ) ( not ( = ?auto_3907433 ?auto_3907435 ) ) ( not ( = ?auto_3907434 ?auto_3907438 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3907427 ?auto_3907428 ?auto_3907429 ?auto_3907426 )
      ( GET-5IMAGE-VERIFY ?auto_3907427 ?auto_3907428 ?auto_3907429 ?auto_3907426 ?auto_3907431 ?auto_3907430 ?auto_3907432 ?auto_3907433 ?auto_3907434 ?auto_3907435 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3918642 - DIRECTION
      ?auto_3918643 - MODE
      ?auto_3918644 - DIRECTION
      ?auto_3918641 - MODE
      ?auto_3918646 - DIRECTION
      ?auto_3918645 - MODE
      ?auto_3918647 - DIRECTION
      ?auto_3918648 - MODE
      ?auto_3918649 - DIRECTION
      ?auto_3918650 - MODE
    )
    :vars
    (
      ?auto_3918652 - INSTRUMENT
      ?auto_3918651 - SATELLITE
      ?auto_3918653 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3918644 ?auto_3918642 ) ) ( not ( = ?auto_3918646 ?auto_3918642 ) ) ( not ( = ?auto_3918646 ?auto_3918644 ) ) ( not ( = ?auto_3918647 ?auto_3918642 ) ) ( not ( = ?auto_3918647 ?auto_3918644 ) ) ( not ( = ?auto_3918647 ?auto_3918646 ) ) ( not ( = ?auto_3918649 ?auto_3918642 ) ) ( not ( = ?auto_3918649 ?auto_3918644 ) ) ( not ( = ?auto_3918649 ?auto_3918646 ) ) ( not ( = ?auto_3918649 ?auto_3918647 ) ) ( ON_BOARD ?auto_3918652 ?auto_3918651 ) ( SUPPORTS ?auto_3918652 ?auto_3918650 ) ( not ( = ?auto_3918649 ?auto_3918653 ) ) ( HAVE_IMAGE ?auto_3918644 ?auto_3918641 ) ( not ( = ?auto_3918644 ?auto_3918653 ) ) ( not ( = ?auto_3918641 ?auto_3918650 ) ) ( CALIBRATION_TARGET ?auto_3918652 ?auto_3918653 ) ( POWER_AVAIL ?auto_3918651 ) ( POINTING ?auto_3918651 ?auto_3918642 ) ( not ( = ?auto_3918653 ?auto_3918642 ) ) ( HAVE_IMAGE ?auto_3918642 ?auto_3918643 ) ( HAVE_IMAGE ?auto_3918646 ?auto_3918645 ) ( HAVE_IMAGE ?auto_3918647 ?auto_3918648 ) ( not ( = ?auto_3918643 ?auto_3918641 ) ) ( not ( = ?auto_3918643 ?auto_3918645 ) ) ( not ( = ?auto_3918643 ?auto_3918648 ) ) ( not ( = ?auto_3918643 ?auto_3918650 ) ) ( not ( = ?auto_3918641 ?auto_3918645 ) ) ( not ( = ?auto_3918641 ?auto_3918648 ) ) ( not ( = ?auto_3918646 ?auto_3918653 ) ) ( not ( = ?auto_3918645 ?auto_3918648 ) ) ( not ( = ?auto_3918645 ?auto_3918650 ) ) ( not ( = ?auto_3918647 ?auto_3918653 ) ) ( not ( = ?auto_3918648 ?auto_3918650 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3918644 ?auto_3918641 ?auto_3918649 ?auto_3918650 )
      ( GET-5IMAGE-VERIFY ?auto_3918642 ?auto_3918643 ?auto_3918644 ?auto_3918641 ?auto_3918646 ?auto_3918645 ?auto_3918647 ?auto_3918648 ?auto_3918649 ?auto_3918650 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3918694 - DIRECTION
      ?auto_3918695 - MODE
      ?auto_3918696 - DIRECTION
      ?auto_3918693 - MODE
      ?auto_3918698 - DIRECTION
      ?auto_3918697 - MODE
      ?auto_3918699 - DIRECTION
      ?auto_3918700 - MODE
      ?auto_3918701 - DIRECTION
      ?auto_3918702 - MODE
    )
    :vars
    (
      ?auto_3918704 - INSTRUMENT
      ?auto_3918703 - SATELLITE
      ?auto_3918705 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3918696 ?auto_3918694 ) ) ( not ( = ?auto_3918698 ?auto_3918694 ) ) ( not ( = ?auto_3918698 ?auto_3918696 ) ) ( not ( = ?auto_3918699 ?auto_3918694 ) ) ( not ( = ?auto_3918699 ?auto_3918696 ) ) ( not ( = ?auto_3918699 ?auto_3918698 ) ) ( not ( = ?auto_3918701 ?auto_3918694 ) ) ( not ( = ?auto_3918701 ?auto_3918696 ) ) ( not ( = ?auto_3918701 ?auto_3918698 ) ) ( not ( = ?auto_3918701 ?auto_3918699 ) ) ( ON_BOARD ?auto_3918704 ?auto_3918703 ) ( SUPPORTS ?auto_3918704 ?auto_3918700 ) ( not ( = ?auto_3918699 ?auto_3918705 ) ) ( HAVE_IMAGE ?auto_3918696 ?auto_3918693 ) ( not ( = ?auto_3918696 ?auto_3918705 ) ) ( not ( = ?auto_3918693 ?auto_3918700 ) ) ( CALIBRATION_TARGET ?auto_3918704 ?auto_3918705 ) ( POWER_AVAIL ?auto_3918703 ) ( POINTING ?auto_3918703 ?auto_3918694 ) ( not ( = ?auto_3918705 ?auto_3918694 ) ) ( HAVE_IMAGE ?auto_3918694 ?auto_3918695 ) ( HAVE_IMAGE ?auto_3918698 ?auto_3918697 ) ( HAVE_IMAGE ?auto_3918701 ?auto_3918702 ) ( not ( = ?auto_3918695 ?auto_3918693 ) ) ( not ( = ?auto_3918695 ?auto_3918697 ) ) ( not ( = ?auto_3918695 ?auto_3918700 ) ) ( not ( = ?auto_3918695 ?auto_3918702 ) ) ( not ( = ?auto_3918693 ?auto_3918697 ) ) ( not ( = ?auto_3918693 ?auto_3918702 ) ) ( not ( = ?auto_3918698 ?auto_3918705 ) ) ( not ( = ?auto_3918697 ?auto_3918700 ) ) ( not ( = ?auto_3918697 ?auto_3918702 ) ) ( not ( = ?auto_3918700 ?auto_3918702 ) ) ( not ( = ?auto_3918701 ?auto_3918705 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3918696 ?auto_3918693 ?auto_3918699 ?auto_3918700 )
      ( GET-5IMAGE-VERIFY ?auto_3918694 ?auto_3918695 ?auto_3918696 ?auto_3918693 ?auto_3918698 ?auto_3918697 ?auto_3918699 ?auto_3918700 ?auto_3918701 ?auto_3918702 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3919052 - DIRECTION
      ?auto_3919053 - MODE
      ?auto_3919054 - DIRECTION
      ?auto_3919051 - MODE
      ?auto_3919056 - DIRECTION
      ?auto_3919055 - MODE
      ?auto_3919057 - DIRECTION
      ?auto_3919058 - MODE
      ?auto_3919059 - DIRECTION
      ?auto_3919060 - MODE
    )
    :vars
    (
      ?auto_3919062 - INSTRUMENT
      ?auto_3919061 - SATELLITE
      ?auto_3919063 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3919054 ?auto_3919052 ) ) ( not ( = ?auto_3919056 ?auto_3919052 ) ) ( not ( = ?auto_3919056 ?auto_3919054 ) ) ( not ( = ?auto_3919057 ?auto_3919052 ) ) ( not ( = ?auto_3919057 ?auto_3919054 ) ) ( not ( = ?auto_3919057 ?auto_3919056 ) ) ( not ( = ?auto_3919059 ?auto_3919052 ) ) ( not ( = ?auto_3919059 ?auto_3919054 ) ) ( not ( = ?auto_3919059 ?auto_3919056 ) ) ( not ( = ?auto_3919059 ?auto_3919057 ) ) ( ON_BOARD ?auto_3919062 ?auto_3919061 ) ( SUPPORTS ?auto_3919062 ?auto_3919055 ) ( not ( = ?auto_3919056 ?auto_3919063 ) ) ( HAVE_IMAGE ?auto_3919054 ?auto_3919051 ) ( not ( = ?auto_3919054 ?auto_3919063 ) ) ( not ( = ?auto_3919051 ?auto_3919055 ) ) ( CALIBRATION_TARGET ?auto_3919062 ?auto_3919063 ) ( POWER_AVAIL ?auto_3919061 ) ( POINTING ?auto_3919061 ?auto_3919052 ) ( not ( = ?auto_3919063 ?auto_3919052 ) ) ( HAVE_IMAGE ?auto_3919052 ?auto_3919053 ) ( HAVE_IMAGE ?auto_3919057 ?auto_3919058 ) ( HAVE_IMAGE ?auto_3919059 ?auto_3919060 ) ( not ( = ?auto_3919053 ?auto_3919051 ) ) ( not ( = ?auto_3919053 ?auto_3919055 ) ) ( not ( = ?auto_3919053 ?auto_3919058 ) ) ( not ( = ?auto_3919053 ?auto_3919060 ) ) ( not ( = ?auto_3919051 ?auto_3919058 ) ) ( not ( = ?auto_3919051 ?auto_3919060 ) ) ( not ( = ?auto_3919055 ?auto_3919058 ) ) ( not ( = ?auto_3919055 ?auto_3919060 ) ) ( not ( = ?auto_3919057 ?auto_3919063 ) ) ( not ( = ?auto_3919058 ?auto_3919060 ) ) ( not ( = ?auto_3919059 ?auto_3919063 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3919054 ?auto_3919051 ?auto_3919056 ?auto_3919055 )
      ( GET-5IMAGE-VERIFY ?auto_3919052 ?auto_3919053 ?auto_3919054 ?auto_3919051 ?auto_3919056 ?auto_3919055 ?auto_3919057 ?auto_3919058 ?auto_3919059 ?auto_3919060 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3921939 - DIRECTION
      ?auto_3921940 - MODE
      ?auto_3921941 - DIRECTION
      ?auto_3921938 - MODE
      ?auto_3921943 - DIRECTION
      ?auto_3921942 - MODE
      ?auto_3921944 - DIRECTION
      ?auto_3921945 - MODE
      ?auto_3921946 - DIRECTION
      ?auto_3921947 - MODE
    )
    :vars
    (
      ?auto_3921949 - INSTRUMENT
      ?auto_3921948 - SATELLITE
      ?auto_3921950 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3921941 ?auto_3921939 ) ) ( not ( = ?auto_3921943 ?auto_3921939 ) ) ( not ( = ?auto_3921943 ?auto_3921941 ) ) ( not ( = ?auto_3921944 ?auto_3921939 ) ) ( not ( = ?auto_3921944 ?auto_3921941 ) ) ( not ( = ?auto_3921944 ?auto_3921943 ) ) ( not ( = ?auto_3921946 ?auto_3921939 ) ) ( not ( = ?auto_3921946 ?auto_3921941 ) ) ( not ( = ?auto_3921946 ?auto_3921943 ) ) ( not ( = ?auto_3921946 ?auto_3921944 ) ) ( ON_BOARD ?auto_3921949 ?auto_3921948 ) ( SUPPORTS ?auto_3921949 ?auto_3921938 ) ( not ( = ?auto_3921941 ?auto_3921950 ) ) ( HAVE_IMAGE ?auto_3921943 ?auto_3921942 ) ( not ( = ?auto_3921943 ?auto_3921950 ) ) ( not ( = ?auto_3921942 ?auto_3921938 ) ) ( CALIBRATION_TARGET ?auto_3921949 ?auto_3921950 ) ( POWER_AVAIL ?auto_3921948 ) ( POINTING ?auto_3921948 ?auto_3921939 ) ( not ( = ?auto_3921950 ?auto_3921939 ) ) ( HAVE_IMAGE ?auto_3921939 ?auto_3921940 ) ( HAVE_IMAGE ?auto_3921944 ?auto_3921945 ) ( HAVE_IMAGE ?auto_3921946 ?auto_3921947 ) ( not ( = ?auto_3921940 ?auto_3921938 ) ) ( not ( = ?auto_3921940 ?auto_3921942 ) ) ( not ( = ?auto_3921940 ?auto_3921945 ) ) ( not ( = ?auto_3921940 ?auto_3921947 ) ) ( not ( = ?auto_3921938 ?auto_3921945 ) ) ( not ( = ?auto_3921938 ?auto_3921947 ) ) ( not ( = ?auto_3921942 ?auto_3921945 ) ) ( not ( = ?auto_3921942 ?auto_3921947 ) ) ( not ( = ?auto_3921944 ?auto_3921950 ) ) ( not ( = ?auto_3921945 ?auto_3921947 ) ) ( not ( = ?auto_3921946 ?auto_3921950 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3921943 ?auto_3921942 ?auto_3921941 ?auto_3921938 )
      ( GET-5IMAGE-VERIFY ?auto_3921939 ?auto_3921940 ?auto_3921941 ?auto_3921938 ?auto_3921943 ?auto_3921942 ?auto_3921944 ?auto_3921945 ?auto_3921946 ?auto_3921947 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3924107 - DIRECTION
      ?auto_3924108 - MODE
      ?auto_3924109 - DIRECTION
      ?auto_3924106 - MODE
      ?auto_3924111 - DIRECTION
      ?auto_3924110 - MODE
      ?auto_3924112 - DIRECTION
      ?auto_3924113 - MODE
      ?auto_3924114 - DIRECTION
      ?auto_3924115 - MODE
    )
    :vars
    (
      ?auto_3924117 - INSTRUMENT
      ?auto_3924116 - SATELLITE
      ?auto_3924118 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3924109 ?auto_3924107 ) ) ( not ( = ?auto_3924111 ?auto_3924107 ) ) ( not ( = ?auto_3924111 ?auto_3924109 ) ) ( not ( = ?auto_3924112 ?auto_3924107 ) ) ( not ( = ?auto_3924112 ?auto_3924109 ) ) ( not ( = ?auto_3924112 ?auto_3924111 ) ) ( not ( = ?auto_3924114 ?auto_3924107 ) ) ( not ( = ?auto_3924114 ?auto_3924109 ) ) ( not ( = ?auto_3924114 ?auto_3924111 ) ) ( not ( = ?auto_3924114 ?auto_3924112 ) ) ( ON_BOARD ?auto_3924117 ?auto_3924116 ) ( SUPPORTS ?auto_3924117 ?auto_3924108 ) ( not ( = ?auto_3924107 ?auto_3924118 ) ) ( HAVE_IMAGE ?auto_3924109 ?auto_3924106 ) ( not ( = ?auto_3924109 ?auto_3924118 ) ) ( not ( = ?auto_3924106 ?auto_3924108 ) ) ( CALIBRATION_TARGET ?auto_3924117 ?auto_3924118 ) ( POWER_AVAIL ?auto_3924116 ) ( POINTING ?auto_3924116 ?auto_3924114 ) ( not ( = ?auto_3924118 ?auto_3924114 ) ) ( HAVE_IMAGE ?auto_3924111 ?auto_3924110 ) ( HAVE_IMAGE ?auto_3924112 ?auto_3924113 ) ( HAVE_IMAGE ?auto_3924114 ?auto_3924115 ) ( not ( = ?auto_3924108 ?auto_3924110 ) ) ( not ( = ?auto_3924108 ?auto_3924113 ) ) ( not ( = ?auto_3924108 ?auto_3924115 ) ) ( not ( = ?auto_3924106 ?auto_3924110 ) ) ( not ( = ?auto_3924106 ?auto_3924113 ) ) ( not ( = ?auto_3924106 ?auto_3924115 ) ) ( not ( = ?auto_3924111 ?auto_3924118 ) ) ( not ( = ?auto_3924110 ?auto_3924113 ) ) ( not ( = ?auto_3924110 ?auto_3924115 ) ) ( not ( = ?auto_3924112 ?auto_3924118 ) ) ( not ( = ?auto_3924113 ?auto_3924115 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3924109 ?auto_3924106 ?auto_3924107 ?auto_3924108 )
      ( GET-5IMAGE-VERIFY ?auto_3924107 ?auto_3924108 ?auto_3924109 ?auto_3924106 ?auto_3924111 ?auto_3924110 ?auto_3924112 ?auto_3924113 ?auto_3924114 ?auto_3924115 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3924160 - DIRECTION
      ?auto_3924161 - MODE
      ?auto_3924162 - DIRECTION
      ?auto_3924159 - MODE
      ?auto_3924164 - DIRECTION
      ?auto_3924163 - MODE
      ?auto_3924165 - DIRECTION
      ?auto_3924166 - MODE
      ?auto_3924167 - DIRECTION
      ?auto_3924168 - MODE
    )
    :vars
    (
      ?auto_3924170 - INSTRUMENT
      ?auto_3924169 - SATELLITE
      ?auto_3924171 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3924162 ?auto_3924160 ) ) ( not ( = ?auto_3924164 ?auto_3924160 ) ) ( not ( = ?auto_3924164 ?auto_3924162 ) ) ( not ( = ?auto_3924165 ?auto_3924160 ) ) ( not ( = ?auto_3924165 ?auto_3924162 ) ) ( not ( = ?auto_3924165 ?auto_3924164 ) ) ( not ( = ?auto_3924167 ?auto_3924160 ) ) ( not ( = ?auto_3924167 ?auto_3924162 ) ) ( not ( = ?auto_3924167 ?auto_3924164 ) ) ( not ( = ?auto_3924167 ?auto_3924165 ) ) ( ON_BOARD ?auto_3924170 ?auto_3924169 ) ( SUPPORTS ?auto_3924170 ?auto_3924161 ) ( not ( = ?auto_3924160 ?auto_3924171 ) ) ( HAVE_IMAGE ?auto_3924162 ?auto_3924159 ) ( not ( = ?auto_3924162 ?auto_3924171 ) ) ( not ( = ?auto_3924159 ?auto_3924161 ) ) ( CALIBRATION_TARGET ?auto_3924170 ?auto_3924171 ) ( POWER_AVAIL ?auto_3924169 ) ( POINTING ?auto_3924169 ?auto_3924165 ) ( not ( = ?auto_3924171 ?auto_3924165 ) ) ( HAVE_IMAGE ?auto_3924164 ?auto_3924163 ) ( HAVE_IMAGE ?auto_3924165 ?auto_3924166 ) ( HAVE_IMAGE ?auto_3924167 ?auto_3924168 ) ( not ( = ?auto_3924161 ?auto_3924163 ) ) ( not ( = ?auto_3924161 ?auto_3924166 ) ) ( not ( = ?auto_3924161 ?auto_3924168 ) ) ( not ( = ?auto_3924159 ?auto_3924163 ) ) ( not ( = ?auto_3924159 ?auto_3924166 ) ) ( not ( = ?auto_3924159 ?auto_3924168 ) ) ( not ( = ?auto_3924164 ?auto_3924171 ) ) ( not ( = ?auto_3924163 ?auto_3924166 ) ) ( not ( = ?auto_3924163 ?auto_3924168 ) ) ( not ( = ?auto_3924166 ?auto_3924168 ) ) ( not ( = ?auto_3924167 ?auto_3924171 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3924162 ?auto_3924159 ?auto_3924160 ?auto_3924161 )
      ( GET-5IMAGE-VERIFY ?auto_3924160 ?auto_3924161 ?auto_3924162 ?auto_3924159 ?auto_3924164 ?auto_3924163 ?auto_3924165 ?auto_3924166 ?auto_3924167 ?auto_3924168 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3924694 - DIRECTION
      ?auto_3924695 - MODE
      ?auto_3924696 - DIRECTION
      ?auto_3924693 - MODE
      ?auto_3924698 - DIRECTION
      ?auto_3924697 - MODE
      ?auto_3924699 - DIRECTION
      ?auto_3924700 - MODE
      ?auto_3924701 - DIRECTION
      ?auto_3924702 - MODE
    )
    :vars
    (
      ?auto_3924704 - INSTRUMENT
      ?auto_3924703 - SATELLITE
      ?auto_3924705 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3924696 ?auto_3924694 ) ) ( not ( = ?auto_3924698 ?auto_3924694 ) ) ( not ( = ?auto_3924698 ?auto_3924696 ) ) ( not ( = ?auto_3924699 ?auto_3924694 ) ) ( not ( = ?auto_3924699 ?auto_3924696 ) ) ( not ( = ?auto_3924699 ?auto_3924698 ) ) ( not ( = ?auto_3924701 ?auto_3924694 ) ) ( not ( = ?auto_3924701 ?auto_3924696 ) ) ( not ( = ?auto_3924701 ?auto_3924698 ) ) ( not ( = ?auto_3924701 ?auto_3924699 ) ) ( ON_BOARD ?auto_3924704 ?auto_3924703 ) ( SUPPORTS ?auto_3924704 ?auto_3924695 ) ( not ( = ?auto_3924694 ?auto_3924705 ) ) ( HAVE_IMAGE ?auto_3924696 ?auto_3924693 ) ( not ( = ?auto_3924696 ?auto_3924705 ) ) ( not ( = ?auto_3924693 ?auto_3924695 ) ) ( CALIBRATION_TARGET ?auto_3924704 ?auto_3924705 ) ( POWER_AVAIL ?auto_3924703 ) ( POINTING ?auto_3924703 ?auto_3924698 ) ( not ( = ?auto_3924705 ?auto_3924698 ) ) ( HAVE_IMAGE ?auto_3924698 ?auto_3924697 ) ( HAVE_IMAGE ?auto_3924699 ?auto_3924700 ) ( HAVE_IMAGE ?auto_3924701 ?auto_3924702 ) ( not ( = ?auto_3924695 ?auto_3924697 ) ) ( not ( = ?auto_3924695 ?auto_3924700 ) ) ( not ( = ?auto_3924695 ?auto_3924702 ) ) ( not ( = ?auto_3924693 ?auto_3924697 ) ) ( not ( = ?auto_3924693 ?auto_3924700 ) ) ( not ( = ?auto_3924693 ?auto_3924702 ) ) ( not ( = ?auto_3924697 ?auto_3924700 ) ) ( not ( = ?auto_3924697 ?auto_3924702 ) ) ( not ( = ?auto_3924699 ?auto_3924705 ) ) ( not ( = ?auto_3924700 ?auto_3924702 ) ) ( not ( = ?auto_3924701 ?auto_3924705 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3924696 ?auto_3924693 ?auto_3924694 ?auto_3924695 )
      ( GET-5IMAGE-VERIFY ?auto_3924694 ?auto_3924695 ?auto_3924696 ?auto_3924693 ?auto_3924698 ?auto_3924697 ?auto_3924699 ?auto_3924700 ?auto_3924701 ?auto_3924702 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3928955 - DIRECTION
      ?auto_3928956 - MODE
      ?auto_3928957 - DIRECTION
      ?auto_3928954 - MODE
      ?auto_3928959 - DIRECTION
      ?auto_3928958 - MODE
      ?auto_3928960 - DIRECTION
      ?auto_3928961 - MODE
      ?auto_3928962 - DIRECTION
      ?auto_3928963 - MODE
    )
    :vars
    (
      ?auto_3928965 - INSTRUMENT
      ?auto_3928964 - SATELLITE
      ?auto_3928966 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3928957 ?auto_3928955 ) ) ( not ( = ?auto_3928959 ?auto_3928955 ) ) ( not ( = ?auto_3928959 ?auto_3928957 ) ) ( not ( = ?auto_3928960 ?auto_3928955 ) ) ( not ( = ?auto_3928960 ?auto_3928957 ) ) ( not ( = ?auto_3928960 ?auto_3928959 ) ) ( not ( = ?auto_3928962 ?auto_3928955 ) ) ( not ( = ?auto_3928962 ?auto_3928957 ) ) ( not ( = ?auto_3928962 ?auto_3928959 ) ) ( not ( = ?auto_3928962 ?auto_3928960 ) ) ( ON_BOARD ?auto_3928965 ?auto_3928964 ) ( SUPPORTS ?auto_3928965 ?auto_3928956 ) ( not ( = ?auto_3928955 ?auto_3928966 ) ) ( HAVE_IMAGE ?auto_3928959 ?auto_3928958 ) ( not ( = ?auto_3928959 ?auto_3928966 ) ) ( not ( = ?auto_3928958 ?auto_3928956 ) ) ( CALIBRATION_TARGET ?auto_3928965 ?auto_3928966 ) ( POWER_AVAIL ?auto_3928964 ) ( POINTING ?auto_3928964 ?auto_3928957 ) ( not ( = ?auto_3928966 ?auto_3928957 ) ) ( HAVE_IMAGE ?auto_3928957 ?auto_3928954 ) ( HAVE_IMAGE ?auto_3928960 ?auto_3928961 ) ( HAVE_IMAGE ?auto_3928962 ?auto_3928963 ) ( not ( = ?auto_3928956 ?auto_3928954 ) ) ( not ( = ?auto_3928956 ?auto_3928961 ) ) ( not ( = ?auto_3928956 ?auto_3928963 ) ) ( not ( = ?auto_3928954 ?auto_3928958 ) ) ( not ( = ?auto_3928954 ?auto_3928961 ) ) ( not ( = ?auto_3928954 ?auto_3928963 ) ) ( not ( = ?auto_3928958 ?auto_3928961 ) ) ( not ( = ?auto_3928958 ?auto_3928963 ) ) ( not ( = ?auto_3928960 ?auto_3928966 ) ) ( not ( = ?auto_3928961 ?auto_3928963 ) ) ( not ( = ?auto_3928962 ?auto_3928966 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3928959 ?auto_3928958 ?auto_3928955 ?auto_3928956 )
      ( GET-5IMAGE-VERIFY ?auto_3928955 ?auto_3928956 ?auto_3928957 ?auto_3928954 ?auto_3928959 ?auto_3928958 ?auto_3928960 ?auto_3928961 ?auto_3928962 ?auto_3928963 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3933196 - DIRECTION
      ?auto_3933197 - MODE
      ?auto_3933198 - DIRECTION
      ?auto_3933195 - MODE
      ?auto_3933200 - DIRECTION
      ?auto_3933199 - MODE
      ?auto_3933201 - DIRECTION
      ?auto_3933202 - MODE
    )
    :vars
    (
      ?auto_3933205 - INSTRUMENT
      ?auto_3933204 - SATELLITE
      ?auto_3933203 - DIRECTION
      ?auto_3933207 - DIRECTION
      ?auto_3933206 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3933198 ?auto_3933196 ) ) ( not ( = ?auto_3933200 ?auto_3933196 ) ) ( not ( = ?auto_3933200 ?auto_3933198 ) ) ( not ( = ?auto_3933201 ?auto_3933196 ) ) ( not ( = ?auto_3933201 ?auto_3933198 ) ) ( not ( = ?auto_3933201 ?auto_3933200 ) ) ( ON_BOARD ?auto_3933205 ?auto_3933204 ) ( SUPPORTS ?auto_3933205 ?auto_3933202 ) ( not ( = ?auto_3933201 ?auto_3933203 ) ) ( HAVE_IMAGE ?auto_3933196 ?auto_3933197 ) ( not ( = ?auto_3933196 ?auto_3933203 ) ) ( not ( = ?auto_3933197 ?auto_3933202 ) ) ( CALIBRATION_TARGET ?auto_3933205 ?auto_3933203 ) ( POINTING ?auto_3933204 ?auto_3933207 ) ( not ( = ?auto_3933203 ?auto_3933207 ) ) ( not ( = ?auto_3933201 ?auto_3933207 ) ) ( not ( = ?auto_3933196 ?auto_3933207 ) ) ( ON_BOARD ?auto_3933206 ?auto_3933204 ) ( POWER_ON ?auto_3933206 ) ( not ( = ?auto_3933205 ?auto_3933206 ) ) ( HAVE_IMAGE ?auto_3933198 ?auto_3933195 ) ( HAVE_IMAGE ?auto_3933200 ?auto_3933199 ) ( not ( = ?auto_3933197 ?auto_3933195 ) ) ( not ( = ?auto_3933197 ?auto_3933199 ) ) ( not ( = ?auto_3933198 ?auto_3933203 ) ) ( not ( = ?auto_3933198 ?auto_3933207 ) ) ( not ( = ?auto_3933195 ?auto_3933199 ) ) ( not ( = ?auto_3933195 ?auto_3933202 ) ) ( not ( = ?auto_3933200 ?auto_3933203 ) ) ( not ( = ?auto_3933200 ?auto_3933207 ) ) ( not ( = ?auto_3933199 ?auto_3933202 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3933196 ?auto_3933197 ?auto_3933201 ?auto_3933202 )
      ( GET-4IMAGE-VERIFY ?auto_3933196 ?auto_3933197 ?auto_3933198 ?auto_3933195 ?auto_3933200 ?auto_3933199 ?auto_3933201 ?auto_3933202 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3933247 - DIRECTION
      ?auto_3933248 - MODE
      ?auto_3933249 - DIRECTION
      ?auto_3933246 - MODE
      ?auto_3933251 - DIRECTION
      ?auto_3933250 - MODE
      ?auto_3933252 - DIRECTION
      ?auto_3933253 - MODE
    )
    :vars
    (
      ?auto_3933256 - INSTRUMENT
      ?auto_3933255 - SATELLITE
      ?auto_3933254 - DIRECTION
      ?auto_3933258 - DIRECTION
      ?auto_3933257 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3933249 ?auto_3933247 ) ) ( not ( = ?auto_3933251 ?auto_3933247 ) ) ( not ( = ?auto_3933251 ?auto_3933249 ) ) ( not ( = ?auto_3933252 ?auto_3933247 ) ) ( not ( = ?auto_3933252 ?auto_3933249 ) ) ( not ( = ?auto_3933252 ?auto_3933251 ) ) ( ON_BOARD ?auto_3933256 ?auto_3933255 ) ( SUPPORTS ?auto_3933256 ?auto_3933250 ) ( not ( = ?auto_3933251 ?auto_3933254 ) ) ( HAVE_IMAGE ?auto_3933247 ?auto_3933248 ) ( not ( = ?auto_3933247 ?auto_3933254 ) ) ( not ( = ?auto_3933248 ?auto_3933250 ) ) ( CALIBRATION_TARGET ?auto_3933256 ?auto_3933254 ) ( POINTING ?auto_3933255 ?auto_3933258 ) ( not ( = ?auto_3933254 ?auto_3933258 ) ) ( not ( = ?auto_3933251 ?auto_3933258 ) ) ( not ( = ?auto_3933247 ?auto_3933258 ) ) ( ON_BOARD ?auto_3933257 ?auto_3933255 ) ( POWER_ON ?auto_3933257 ) ( not ( = ?auto_3933256 ?auto_3933257 ) ) ( HAVE_IMAGE ?auto_3933249 ?auto_3933246 ) ( HAVE_IMAGE ?auto_3933252 ?auto_3933253 ) ( not ( = ?auto_3933248 ?auto_3933246 ) ) ( not ( = ?auto_3933248 ?auto_3933253 ) ) ( not ( = ?auto_3933249 ?auto_3933254 ) ) ( not ( = ?auto_3933249 ?auto_3933258 ) ) ( not ( = ?auto_3933246 ?auto_3933250 ) ) ( not ( = ?auto_3933246 ?auto_3933253 ) ) ( not ( = ?auto_3933250 ?auto_3933253 ) ) ( not ( = ?auto_3933252 ?auto_3933254 ) ) ( not ( = ?auto_3933252 ?auto_3933258 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3933247 ?auto_3933248 ?auto_3933251 ?auto_3933250 )
      ( GET-4IMAGE-VERIFY ?auto_3933247 ?auto_3933248 ?auto_3933249 ?auto_3933246 ?auto_3933251 ?auto_3933250 ?auto_3933252 ?auto_3933253 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3933572 - DIRECTION
      ?auto_3933573 - MODE
      ?auto_3933574 - DIRECTION
      ?auto_3933571 - MODE
      ?auto_3933576 - DIRECTION
      ?auto_3933575 - MODE
      ?auto_3933577 - DIRECTION
      ?auto_3933578 - MODE
    )
    :vars
    (
      ?auto_3933581 - INSTRUMENT
      ?auto_3933580 - SATELLITE
      ?auto_3933579 - DIRECTION
      ?auto_3933583 - DIRECTION
      ?auto_3933582 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3933574 ?auto_3933572 ) ) ( not ( = ?auto_3933576 ?auto_3933572 ) ) ( not ( = ?auto_3933576 ?auto_3933574 ) ) ( not ( = ?auto_3933577 ?auto_3933572 ) ) ( not ( = ?auto_3933577 ?auto_3933574 ) ) ( not ( = ?auto_3933577 ?auto_3933576 ) ) ( ON_BOARD ?auto_3933581 ?auto_3933580 ) ( SUPPORTS ?auto_3933581 ?auto_3933571 ) ( not ( = ?auto_3933574 ?auto_3933579 ) ) ( HAVE_IMAGE ?auto_3933572 ?auto_3933573 ) ( not ( = ?auto_3933572 ?auto_3933579 ) ) ( not ( = ?auto_3933573 ?auto_3933571 ) ) ( CALIBRATION_TARGET ?auto_3933581 ?auto_3933579 ) ( POINTING ?auto_3933580 ?auto_3933583 ) ( not ( = ?auto_3933579 ?auto_3933583 ) ) ( not ( = ?auto_3933574 ?auto_3933583 ) ) ( not ( = ?auto_3933572 ?auto_3933583 ) ) ( ON_BOARD ?auto_3933582 ?auto_3933580 ) ( POWER_ON ?auto_3933582 ) ( not ( = ?auto_3933581 ?auto_3933582 ) ) ( HAVE_IMAGE ?auto_3933576 ?auto_3933575 ) ( HAVE_IMAGE ?auto_3933577 ?auto_3933578 ) ( not ( = ?auto_3933573 ?auto_3933575 ) ) ( not ( = ?auto_3933573 ?auto_3933578 ) ) ( not ( = ?auto_3933571 ?auto_3933575 ) ) ( not ( = ?auto_3933571 ?auto_3933578 ) ) ( not ( = ?auto_3933576 ?auto_3933579 ) ) ( not ( = ?auto_3933576 ?auto_3933583 ) ) ( not ( = ?auto_3933575 ?auto_3933578 ) ) ( not ( = ?auto_3933577 ?auto_3933579 ) ) ( not ( = ?auto_3933577 ?auto_3933583 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3933572 ?auto_3933573 ?auto_3933574 ?auto_3933571 )
      ( GET-4IMAGE-VERIFY ?auto_3933572 ?auto_3933573 ?auto_3933574 ?auto_3933571 ?auto_3933576 ?auto_3933575 ?auto_3933577 ?auto_3933578 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3936115 - DIRECTION
      ?auto_3936116 - MODE
      ?auto_3936117 - DIRECTION
      ?auto_3936114 - MODE
      ?auto_3936119 - DIRECTION
      ?auto_3936118 - MODE
      ?auto_3936120 - DIRECTION
      ?auto_3936121 - MODE
    )
    :vars
    (
      ?auto_3936124 - INSTRUMENT
      ?auto_3936123 - SATELLITE
      ?auto_3936122 - DIRECTION
      ?auto_3936126 - DIRECTION
      ?auto_3936125 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3936117 ?auto_3936115 ) ) ( not ( = ?auto_3936119 ?auto_3936115 ) ) ( not ( = ?auto_3936119 ?auto_3936117 ) ) ( not ( = ?auto_3936120 ?auto_3936115 ) ) ( not ( = ?auto_3936120 ?auto_3936117 ) ) ( not ( = ?auto_3936120 ?auto_3936119 ) ) ( ON_BOARD ?auto_3936124 ?auto_3936123 ) ( SUPPORTS ?auto_3936124 ?auto_3936116 ) ( not ( = ?auto_3936115 ?auto_3936122 ) ) ( HAVE_IMAGE ?auto_3936117 ?auto_3936114 ) ( not ( = ?auto_3936117 ?auto_3936122 ) ) ( not ( = ?auto_3936114 ?auto_3936116 ) ) ( CALIBRATION_TARGET ?auto_3936124 ?auto_3936122 ) ( POINTING ?auto_3936123 ?auto_3936126 ) ( not ( = ?auto_3936122 ?auto_3936126 ) ) ( not ( = ?auto_3936115 ?auto_3936126 ) ) ( not ( = ?auto_3936117 ?auto_3936126 ) ) ( ON_BOARD ?auto_3936125 ?auto_3936123 ) ( POWER_ON ?auto_3936125 ) ( not ( = ?auto_3936124 ?auto_3936125 ) ) ( HAVE_IMAGE ?auto_3936119 ?auto_3936118 ) ( HAVE_IMAGE ?auto_3936120 ?auto_3936121 ) ( not ( = ?auto_3936116 ?auto_3936118 ) ) ( not ( = ?auto_3936116 ?auto_3936121 ) ) ( not ( = ?auto_3936114 ?auto_3936118 ) ) ( not ( = ?auto_3936114 ?auto_3936121 ) ) ( not ( = ?auto_3936119 ?auto_3936122 ) ) ( not ( = ?auto_3936119 ?auto_3936126 ) ) ( not ( = ?auto_3936118 ?auto_3936121 ) ) ( not ( = ?auto_3936120 ?auto_3936122 ) ) ( not ( = ?auto_3936120 ?auto_3936126 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3936117 ?auto_3936114 ?auto_3936115 ?auto_3936116 )
      ( GET-4IMAGE-VERIFY ?auto_3936115 ?auto_3936116 ?auto_3936117 ?auto_3936114 ?auto_3936119 ?auto_3936118 ?auto_3936120 ?auto_3936121 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3938822 - DIRECTION
      ?auto_3938823 - MODE
      ?auto_3938824 - DIRECTION
      ?auto_3938821 - MODE
      ?auto_3938826 - DIRECTION
      ?auto_3938825 - MODE
      ?auto_3938827 - DIRECTION
      ?auto_3938828 - MODE
      ?auto_3938829 - DIRECTION
      ?auto_3938830 - MODE
    )
    :vars
    (
      ?auto_3938833 - INSTRUMENT
      ?auto_3938832 - SATELLITE
      ?auto_3938831 - DIRECTION
      ?auto_3938834 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3938824 ?auto_3938822 ) ) ( not ( = ?auto_3938826 ?auto_3938822 ) ) ( not ( = ?auto_3938826 ?auto_3938824 ) ) ( not ( = ?auto_3938827 ?auto_3938822 ) ) ( not ( = ?auto_3938827 ?auto_3938824 ) ) ( not ( = ?auto_3938827 ?auto_3938826 ) ) ( not ( = ?auto_3938829 ?auto_3938822 ) ) ( not ( = ?auto_3938829 ?auto_3938824 ) ) ( not ( = ?auto_3938829 ?auto_3938826 ) ) ( not ( = ?auto_3938829 ?auto_3938827 ) ) ( ON_BOARD ?auto_3938833 ?auto_3938832 ) ( SUPPORTS ?auto_3938833 ?auto_3938830 ) ( not ( = ?auto_3938829 ?auto_3938831 ) ) ( HAVE_IMAGE ?auto_3938822 ?auto_3938823 ) ( not ( = ?auto_3938822 ?auto_3938831 ) ) ( not ( = ?auto_3938823 ?auto_3938830 ) ) ( CALIBRATION_TARGET ?auto_3938833 ?auto_3938831 ) ( POINTING ?auto_3938832 ?auto_3938827 ) ( not ( = ?auto_3938831 ?auto_3938827 ) ) ( ON_BOARD ?auto_3938834 ?auto_3938832 ) ( POWER_ON ?auto_3938834 ) ( not ( = ?auto_3938833 ?auto_3938834 ) ) ( HAVE_IMAGE ?auto_3938824 ?auto_3938821 ) ( HAVE_IMAGE ?auto_3938826 ?auto_3938825 ) ( HAVE_IMAGE ?auto_3938827 ?auto_3938828 ) ( not ( = ?auto_3938823 ?auto_3938821 ) ) ( not ( = ?auto_3938823 ?auto_3938825 ) ) ( not ( = ?auto_3938823 ?auto_3938828 ) ) ( not ( = ?auto_3938824 ?auto_3938831 ) ) ( not ( = ?auto_3938821 ?auto_3938825 ) ) ( not ( = ?auto_3938821 ?auto_3938828 ) ) ( not ( = ?auto_3938821 ?auto_3938830 ) ) ( not ( = ?auto_3938826 ?auto_3938831 ) ) ( not ( = ?auto_3938825 ?auto_3938828 ) ) ( not ( = ?auto_3938825 ?auto_3938830 ) ) ( not ( = ?auto_3938828 ?auto_3938830 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3938822 ?auto_3938823 ?auto_3938829 ?auto_3938830 )
      ( GET-5IMAGE-VERIFY ?auto_3938822 ?auto_3938823 ?auto_3938824 ?auto_3938821 ?auto_3938826 ?auto_3938825 ?auto_3938827 ?auto_3938828 ?auto_3938829 ?auto_3938830 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3938881 - DIRECTION
      ?auto_3938882 - MODE
      ?auto_3938883 - DIRECTION
      ?auto_3938880 - MODE
      ?auto_3938885 - DIRECTION
      ?auto_3938884 - MODE
      ?auto_3938886 - DIRECTION
      ?auto_3938887 - MODE
      ?auto_3938888 - DIRECTION
      ?auto_3938889 - MODE
    )
    :vars
    (
      ?auto_3938892 - INSTRUMENT
      ?auto_3938891 - SATELLITE
      ?auto_3938890 - DIRECTION
      ?auto_3938893 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3938883 ?auto_3938881 ) ) ( not ( = ?auto_3938885 ?auto_3938881 ) ) ( not ( = ?auto_3938885 ?auto_3938883 ) ) ( not ( = ?auto_3938886 ?auto_3938881 ) ) ( not ( = ?auto_3938886 ?auto_3938883 ) ) ( not ( = ?auto_3938886 ?auto_3938885 ) ) ( not ( = ?auto_3938888 ?auto_3938881 ) ) ( not ( = ?auto_3938888 ?auto_3938883 ) ) ( not ( = ?auto_3938888 ?auto_3938885 ) ) ( not ( = ?auto_3938888 ?auto_3938886 ) ) ( ON_BOARD ?auto_3938892 ?auto_3938891 ) ( SUPPORTS ?auto_3938892 ?auto_3938887 ) ( not ( = ?auto_3938886 ?auto_3938890 ) ) ( HAVE_IMAGE ?auto_3938881 ?auto_3938882 ) ( not ( = ?auto_3938881 ?auto_3938890 ) ) ( not ( = ?auto_3938882 ?auto_3938887 ) ) ( CALIBRATION_TARGET ?auto_3938892 ?auto_3938890 ) ( POINTING ?auto_3938891 ?auto_3938888 ) ( not ( = ?auto_3938890 ?auto_3938888 ) ) ( ON_BOARD ?auto_3938893 ?auto_3938891 ) ( POWER_ON ?auto_3938893 ) ( not ( = ?auto_3938892 ?auto_3938893 ) ) ( HAVE_IMAGE ?auto_3938883 ?auto_3938880 ) ( HAVE_IMAGE ?auto_3938885 ?auto_3938884 ) ( HAVE_IMAGE ?auto_3938888 ?auto_3938889 ) ( not ( = ?auto_3938882 ?auto_3938880 ) ) ( not ( = ?auto_3938882 ?auto_3938884 ) ) ( not ( = ?auto_3938882 ?auto_3938889 ) ) ( not ( = ?auto_3938883 ?auto_3938890 ) ) ( not ( = ?auto_3938880 ?auto_3938884 ) ) ( not ( = ?auto_3938880 ?auto_3938887 ) ) ( not ( = ?auto_3938880 ?auto_3938889 ) ) ( not ( = ?auto_3938885 ?auto_3938890 ) ) ( not ( = ?auto_3938884 ?auto_3938887 ) ) ( not ( = ?auto_3938884 ?auto_3938889 ) ) ( not ( = ?auto_3938887 ?auto_3938889 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3938881 ?auto_3938882 ?auto_3938886 ?auto_3938887 )
      ( GET-5IMAGE-VERIFY ?auto_3938881 ?auto_3938882 ?auto_3938883 ?auto_3938880 ?auto_3938885 ?auto_3938884 ?auto_3938886 ?auto_3938887 ?auto_3938888 ?auto_3938889 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3938938 - DIRECTION
      ?auto_3938939 - MODE
      ?auto_3938940 - DIRECTION
      ?auto_3938937 - MODE
      ?auto_3938942 - DIRECTION
      ?auto_3938941 - MODE
      ?auto_3938943 - DIRECTION
      ?auto_3938944 - MODE
      ?auto_3938945 - DIRECTION
      ?auto_3938946 - MODE
    )
    :vars
    (
      ?auto_3938949 - INSTRUMENT
      ?auto_3938948 - SATELLITE
      ?auto_3938947 - DIRECTION
      ?auto_3938950 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3938940 ?auto_3938938 ) ) ( not ( = ?auto_3938942 ?auto_3938938 ) ) ( not ( = ?auto_3938942 ?auto_3938940 ) ) ( not ( = ?auto_3938943 ?auto_3938938 ) ) ( not ( = ?auto_3938943 ?auto_3938940 ) ) ( not ( = ?auto_3938943 ?auto_3938942 ) ) ( not ( = ?auto_3938945 ?auto_3938938 ) ) ( not ( = ?auto_3938945 ?auto_3938940 ) ) ( not ( = ?auto_3938945 ?auto_3938942 ) ) ( not ( = ?auto_3938945 ?auto_3938943 ) ) ( ON_BOARD ?auto_3938949 ?auto_3938948 ) ( SUPPORTS ?auto_3938949 ?auto_3938946 ) ( not ( = ?auto_3938945 ?auto_3938947 ) ) ( HAVE_IMAGE ?auto_3938938 ?auto_3938939 ) ( not ( = ?auto_3938938 ?auto_3938947 ) ) ( not ( = ?auto_3938939 ?auto_3938946 ) ) ( CALIBRATION_TARGET ?auto_3938949 ?auto_3938947 ) ( POINTING ?auto_3938948 ?auto_3938942 ) ( not ( = ?auto_3938947 ?auto_3938942 ) ) ( ON_BOARD ?auto_3938950 ?auto_3938948 ) ( POWER_ON ?auto_3938950 ) ( not ( = ?auto_3938949 ?auto_3938950 ) ) ( HAVE_IMAGE ?auto_3938940 ?auto_3938937 ) ( HAVE_IMAGE ?auto_3938942 ?auto_3938941 ) ( HAVE_IMAGE ?auto_3938943 ?auto_3938944 ) ( not ( = ?auto_3938939 ?auto_3938937 ) ) ( not ( = ?auto_3938939 ?auto_3938941 ) ) ( not ( = ?auto_3938939 ?auto_3938944 ) ) ( not ( = ?auto_3938940 ?auto_3938947 ) ) ( not ( = ?auto_3938937 ?auto_3938941 ) ) ( not ( = ?auto_3938937 ?auto_3938944 ) ) ( not ( = ?auto_3938937 ?auto_3938946 ) ) ( not ( = ?auto_3938941 ?auto_3938944 ) ) ( not ( = ?auto_3938941 ?auto_3938946 ) ) ( not ( = ?auto_3938943 ?auto_3938947 ) ) ( not ( = ?auto_3938944 ?auto_3938946 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3938938 ?auto_3938939 ?auto_3938945 ?auto_3938946 )
      ( GET-5IMAGE-VERIFY ?auto_3938938 ?auto_3938939 ?auto_3938940 ?auto_3938937 ?auto_3938942 ?auto_3938941 ?auto_3938943 ?auto_3938944 ?auto_3938945 ?auto_3938946 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3938994 - DIRECTION
      ?auto_3938995 - MODE
      ?auto_3938996 - DIRECTION
      ?auto_3938993 - MODE
      ?auto_3938998 - DIRECTION
      ?auto_3938997 - MODE
      ?auto_3938999 - DIRECTION
      ?auto_3939000 - MODE
      ?auto_3939001 - DIRECTION
      ?auto_3939002 - MODE
    )
    :vars
    (
      ?auto_3939005 - INSTRUMENT
      ?auto_3939004 - SATELLITE
      ?auto_3939003 - DIRECTION
      ?auto_3939006 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3938996 ?auto_3938994 ) ) ( not ( = ?auto_3938998 ?auto_3938994 ) ) ( not ( = ?auto_3938998 ?auto_3938996 ) ) ( not ( = ?auto_3938999 ?auto_3938994 ) ) ( not ( = ?auto_3938999 ?auto_3938996 ) ) ( not ( = ?auto_3938999 ?auto_3938998 ) ) ( not ( = ?auto_3939001 ?auto_3938994 ) ) ( not ( = ?auto_3939001 ?auto_3938996 ) ) ( not ( = ?auto_3939001 ?auto_3938998 ) ) ( not ( = ?auto_3939001 ?auto_3938999 ) ) ( ON_BOARD ?auto_3939005 ?auto_3939004 ) ( SUPPORTS ?auto_3939005 ?auto_3939000 ) ( not ( = ?auto_3938999 ?auto_3939003 ) ) ( HAVE_IMAGE ?auto_3938994 ?auto_3938995 ) ( not ( = ?auto_3938994 ?auto_3939003 ) ) ( not ( = ?auto_3938995 ?auto_3939000 ) ) ( CALIBRATION_TARGET ?auto_3939005 ?auto_3939003 ) ( POINTING ?auto_3939004 ?auto_3938998 ) ( not ( = ?auto_3939003 ?auto_3938998 ) ) ( ON_BOARD ?auto_3939006 ?auto_3939004 ) ( POWER_ON ?auto_3939006 ) ( not ( = ?auto_3939005 ?auto_3939006 ) ) ( HAVE_IMAGE ?auto_3938996 ?auto_3938993 ) ( HAVE_IMAGE ?auto_3938998 ?auto_3938997 ) ( HAVE_IMAGE ?auto_3939001 ?auto_3939002 ) ( not ( = ?auto_3938995 ?auto_3938993 ) ) ( not ( = ?auto_3938995 ?auto_3938997 ) ) ( not ( = ?auto_3938995 ?auto_3939002 ) ) ( not ( = ?auto_3938996 ?auto_3939003 ) ) ( not ( = ?auto_3938993 ?auto_3938997 ) ) ( not ( = ?auto_3938993 ?auto_3939000 ) ) ( not ( = ?auto_3938993 ?auto_3939002 ) ) ( not ( = ?auto_3938997 ?auto_3939000 ) ) ( not ( = ?auto_3938997 ?auto_3939002 ) ) ( not ( = ?auto_3939000 ?auto_3939002 ) ) ( not ( = ?auto_3939001 ?auto_3939003 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3938994 ?auto_3938995 ?auto_3938999 ?auto_3939000 )
      ( GET-5IMAGE-VERIFY ?auto_3938994 ?auto_3938995 ?auto_3938996 ?auto_3938993 ?auto_3938998 ?auto_3938997 ?auto_3938999 ?auto_3939000 ?auto_3939001 ?auto_3939002 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3939229 - DIRECTION
      ?auto_3939230 - MODE
      ?auto_3939231 - DIRECTION
      ?auto_3939228 - MODE
      ?auto_3939233 - DIRECTION
      ?auto_3939232 - MODE
      ?auto_3939234 - DIRECTION
      ?auto_3939235 - MODE
      ?auto_3939236 - DIRECTION
      ?auto_3939237 - MODE
    )
    :vars
    (
      ?auto_3939240 - INSTRUMENT
      ?auto_3939239 - SATELLITE
      ?auto_3939238 - DIRECTION
      ?auto_3939241 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3939231 ?auto_3939229 ) ) ( not ( = ?auto_3939233 ?auto_3939229 ) ) ( not ( = ?auto_3939233 ?auto_3939231 ) ) ( not ( = ?auto_3939234 ?auto_3939229 ) ) ( not ( = ?auto_3939234 ?auto_3939231 ) ) ( not ( = ?auto_3939234 ?auto_3939233 ) ) ( not ( = ?auto_3939236 ?auto_3939229 ) ) ( not ( = ?auto_3939236 ?auto_3939231 ) ) ( not ( = ?auto_3939236 ?auto_3939233 ) ) ( not ( = ?auto_3939236 ?auto_3939234 ) ) ( ON_BOARD ?auto_3939240 ?auto_3939239 ) ( SUPPORTS ?auto_3939240 ?auto_3939232 ) ( not ( = ?auto_3939233 ?auto_3939238 ) ) ( HAVE_IMAGE ?auto_3939229 ?auto_3939230 ) ( not ( = ?auto_3939229 ?auto_3939238 ) ) ( not ( = ?auto_3939230 ?auto_3939232 ) ) ( CALIBRATION_TARGET ?auto_3939240 ?auto_3939238 ) ( POINTING ?auto_3939239 ?auto_3939236 ) ( not ( = ?auto_3939238 ?auto_3939236 ) ) ( ON_BOARD ?auto_3939241 ?auto_3939239 ) ( POWER_ON ?auto_3939241 ) ( not ( = ?auto_3939240 ?auto_3939241 ) ) ( HAVE_IMAGE ?auto_3939231 ?auto_3939228 ) ( HAVE_IMAGE ?auto_3939234 ?auto_3939235 ) ( HAVE_IMAGE ?auto_3939236 ?auto_3939237 ) ( not ( = ?auto_3939230 ?auto_3939228 ) ) ( not ( = ?auto_3939230 ?auto_3939235 ) ) ( not ( = ?auto_3939230 ?auto_3939237 ) ) ( not ( = ?auto_3939231 ?auto_3939238 ) ) ( not ( = ?auto_3939228 ?auto_3939232 ) ) ( not ( = ?auto_3939228 ?auto_3939235 ) ) ( not ( = ?auto_3939228 ?auto_3939237 ) ) ( not ( = ?auto_3939232 ?auto_3939235 ) ) ( not ( = ?auto_3939232 ?auto_3939237 ) ) ( not ( = ?auto_3939234 ?auto_3939238 ) ) ( not ( = ?auto_3939235 ?auto_3939237 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3939229 ?auto_3939230 ?auto_3939233 ?auto_3939232 )
      ( GET-5IMAGE-VERIFY ?auto_3939229 ?auto_3939230 ?auto_3939231 ?auto_3939228 ?auto_3939233 ?auto_3939232 ?auto_3939234 ?auto_3939235 ?auto_3939236 ?auto_3939237 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3939286 - DIRECTION
      ?auto_3939287 - MODE
      ?auto_3939288 - DIRECTION
      ?auto_3939285 - MODE
      ?auto_3939290 - DIRECTION
      ?auto_3939289 - MODE
      ?auto_3939291 - DIRECTION
      ?auto_3939292 - MODE
      ?auto_3939293 - DIRECTION
      ?auto_3939294 - MODE
    )
    :vars
    (
      ?auto_3939297 - INSTRUMENT
      ?auto_3939296 - SATELLITE
      ?auto_3939295 - DIRECTION
      ?auto_3939298 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3939288 ?auto_3939286 ) ) ( not ( = ?auto_3939290 ?auto_3939286 ) ) ( not ( = ?auto_3939290 ?auto_3939288 ) ) ( not ( = ?auto_3939291 ?auto_3939286 ) ) ( not ( = ?auto_3939291 ?auto_3939288 ) ) ( not ( = ?auto_3939291 ?auto_3939290 ) ) ( not ( = ?auto_3939293 ?auto_3939286 ) ) ( not ( = ?auto_3939293 ?auto_3939288 ) ) ( not ( = ?auto_3939293 ?auto_3939290 ) ) ( not ( = ?auto_3939293 ?auto_3939291 ) ) ( ON_BOARD ?auto_3939297 ?auto_3939296 ) ( SUPPORTS ?auto_3939297 ?auto_3939289 ) ( not ( = ?auto_3939290 ?auto_3939295 ) ) ( HAVE_IMAGE ?auto_3939286 ?auto_3939287 ) ( not ( = ?auto_3939286 ?auto_3939295 ) ) ( not ( = ?auto_3939287 ?auto_3939289 ) ) ( CALIBRATION_TARGET ?auto_3939297 ?auto_3939295 ) ( POINTING ?auto_3939296 ?auto_3939291 ) ( not ( = ?auto_3939295 ?auto_3939291 ) ) ( ON_BOARD ?auto_3939298 ?auto_3939296 ) ( POWER_ON ?auto_3939298 ) ( not ( = ?auto_3939297 ?auto_3939298 ) ) ( HAVE_IMAGE ?auto_3939288 ?auto_3939285 ) ( HAVE_IMAGE ?auto_3939291 ?auto_3939292 ) ( HAVE_IMAGE ?auto_3939293 ?auto_3939294 ) ( not ( = ?auto_3939287 ?auto_3939285 ) ) ( not ( = ?auto_3939287 ?auto_3939292 ) ) ( not ( = ?auto_3939287 ?auto_3939294 ) ) ( not ( = ?auto_3939288 ?auto_3939295 ) ) ( not ( = ?auto_3939285 ?auto_3939289 ) ) ( not ( = ?auto_3939285 ?auto_3939292 ) ) ( not ( = ?auto_3939285 ?auto_3939294 ) ) ( not ( = ?auto_3939289 ?auto_3939292 ) ) ( not ( = ?auto_3939289 ?auto_3939294 ) ) ( not ( = ?auto_3939292 ?auto_3939294 ) ) ( not ( = ?auto_3939293 ?auto_3939295 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3939286 ?auto_3939287 ?auto_3939290 ?auto_3939289 )
      ( GET-5IMAGE-VERIFY ?auto_3939286 ?auto_3939287 ?auto_3939288 ?auto_3939285 ?auto_3939290 ?auto_3939289 ?auto_3939291 ?auto_3939292 ?auto_3939293 ?auto_3939294 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3940423 - DIRECTION
      ?auto_3940424 - MODE
      ?auto_3940425 - DIRECTION
      ?auto_3940422 - MODE
      ?auto_3940427 - DIRECTION
      ?auto_3940426 - MODE
      ?auto_3940428 - DIRECTION
      ?auto_3940429 - MODE
      ?auto_3940430 - DIRECTION
      ?auto_3940431 - MODE
    )
    :vars
    (
      ?auto_3940434 - INSTRUMENT
      ?auto_3940433 - SATELLITE
      ?auto_3940432 - DIRECTION
      ?auto_3940435 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3940425 ?auto_3940423 ) ) ( not ( = ?auto_3940427 ?auto_3940423 ) ) ( not ( = ?auto_3940427 ?auto_3940425 ) ) ( not ( = ?auto_3940428 ?auto_3940423 ) ) ( not ( = ?auto_3940428 ?auto_3940425 ) ) ( not ( = ?auto_3940428 ?auto_3940427 ) ) ( not ( = ?auto_3940430 ?auto_3940423 ) ) ( not ( = ?auto_3940430 ?auto_3940425 ) ) ( not ( = ?auto_3940430 ?auto_3940427 ) ) ( not ( = ?auto_3940430 ?auto_3940428 ) ) ( ON_BOARD ?auto_3940434 ?auto_3940433 ) ( SUPPORTS ?auto_3940434 ?auto_3940431 ) ( not ( = ?auto_3940430 ?auto_3940432 ) ) ( HAVE_IMAGE ?auto_3940423 ?auto_3940424 ) ( not ( = ?auto_3940423 ?auto_3940432 ) ) ( not ( = ?auto_3940424 ?auto_3940431 ) ) ( CALIBRATION_TARGET ?auto_3940434 ?auto_3940432 ) ( POINTING ?auto_3940433 ?auto_3940425 ) ( not ( = ?auto_3940432 ?auto_3940425 ) ) ( ON_BOARD ?auto_3940435 ?auto_3940433 ) ( POWER_ON ?auto_3940435 ) ( not ( = ?auto_3940434 ?auto_3940435 ) ) ( HAVE_IMAGE ?auto_3940425 ?auto_3940422 ) ( HAVE_IMAGE ?auto_3940427 ?auto_3940426 ) ( HAVE_IMAGE ?auto_3940428 ?auto_3940429 ) ( not ( = ?auto_3940424 ?auto_3940422 ) ) ( not ( = ?auto_3940424 ?auto_3940426 ) ) ( not ( = ?auto_3940424 ?auto_3940429 ) ) ( not ( = ?auto_3940422 ?auto_3940426 ) ) ( not ( = ?auto_3940422 ?auto_3940429 ) ) ( not ( = ?auto_3940422 ?auto_3940431 ) ) ( not ( = ?auto_3940427 ?auto_3940432 ) ) ( not ( = ?auto_3940426 ?auto_3940429 ) ) ( not ( = ?auto_3940426 ?auto_3940431 ) ) ( not ( = ?auto_3940428 ?auto_3940432 ) ) ( not ( = ?auto_3940429 ?auto_3940431 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3940423 ?auto_3940424 ?auto_3940430 ?auto_3940431 )
      ( GET-5IMAGE-VERIFY ?auto_3940423 ?auto_3940424 ?auto_3940425 ?auto_3940422 ?auto_3940427 ?auto_3940426 ?auto_3940428 ?auto_3940429 ?auto_3940430 ?auto_3940431 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3940479 - DIRECTION
      ?auto_3940480 - MODE
      ?auto_3940481 - DIRECTION
      ?auto_3940478 - MODE
      ?auto_3940483 - DIRECTION
      ?auto_3940482 - MODE
      ?auto_3940484 - DIRECTION
      ?auto_3940485 - MODE
      ?auto_3940486 - DIRECTION
      ?auto_3940487 - MODE
    )
    :vars
    (
      ?auto_3940490 - INSTRUMENT
      ?auto_3940489 - SATELLITE
      ?auto_3940488 - DIRECTION
      ?auto_3940491 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3940481 ?auto_3940479 ) ) ( not ( = ?auto_3940483 ?auto_3940479 ) ) ( not ( = ?auto_3940483 ?auto_3940481 ) ) ( not ( = ?auto_3940484 ?auto_3940479 ) ) ( not ( = ?auto_3940484 ?auto_3940481 ) ) ( not ( = ?auto_3940484 ?auto_3940483 ) ) ( not ( = ?auto_3940486 ?auto_3940479 ) ) ( not ( = ?auto_3940486 ?auto_3940481 ) ) ( not ( = ?auto_3940486 ?auto_3940483 ) ) ( not ( = ?auto_3940486 ?auto_3940484 ) ) ( ON_BOARD ?auto_3940490 ?auto_3940489 ) ( SUPPORTS ?auto_3940490 ?auto_3940485 ) ( not ( = ?auto_3940484 ?auto_3940488 ) ) ( HAVE_IMAGE ?auto_3940479 ?auto_3940480 ) ( not ( = ?auto_3940479 ?auto_3940488 ) ) ( not ( = ?auto_3940480 ?auto_3940485 ) ) ( CALIBRATION_TARGET ?auto_3940490 ?auto_3940488 ) ( POINTING ?auto_3940489 ?auto_3940481 ) ( not ( = ?auto_3940488 ?auto_3940481 ) ) ( ON_BOARD ?auto_3940491 ?auto_3940489 ) ( POWER_ON ?auto_3940491 ) ( not ( = ?auto_3940490 ?auto_3940491 ) ) ( HAVE_IMAGE ?auto_3940481 ?auto_3940478 ) ( HAVE_IMAGE ?auto_3940483 ?auto_3940482 ) ( HAVE_IMAGE ?auto_3940486 ?auto_3940487 ) ( not ( = ?auto_3940480 ?auto_3940478 ) ) ( not ( = ?auto_3940480 ?auto_3940482 ) ) ( not ( = ?auto_3940480 ?auto_3940487 ) ) ( not ( = ?auto_3940478 ?auto_3940482 ) ) ( not ( = ?auto_3940478 ?auto_3940485 ) ) ( not ( = ?auto_3940478 ?auto_3940487 ) ) ( not ( = ?auto_3940483 ?auto_3940488 ) ) ( not ( = ?auto_3940482 ?auto_3940485 ) ) ( not ( = ?auto_3940482 ?auto_3940487 ) ) ( not ( = ?auto_3940485 ?auto_3940487 ) ) ( not ( = ?auto_3940486 ?auto_3940488 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3940479 ?auto_3940480 ?auto_3940484 ?auto_3940485 )
      ( GET-5IMAGE-VERIFY ?auto_3940479 ?auto_3940480 ?auto_3940481 ?auto_3940478 ?auto_3940483 ?auto_3940482 ?auto_3940484 ?auto_3940485 ?auto_3940486 ?auto_3940487 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3940863 - DIRECTION
      ?auto_3940864 - MODE
      ?auto_3940865 - DIRECTION
      ?auto_3940862 - MODE
      ?auto_3940867 - DIRECTION
      ?auto_3940866 - MODE
      ?auto_3940868 - DIRECTION
      ?auto_3940869 - MODE
      ?auto_3940870 - DIRECTION
      ?auto_3940871 - MODE
    )
    :vars
    (
      ?auto_3940874 - INSTRUMENT
      ?auto_3940873 - SATELLITE
      ?auto_3940872 - DIRECTION
      ?auto_3940875 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3940865 ?auto_3940863 ) ) ( not ( = ?auto_3940867 ?auto_3940863 ) ) ( not ( = ?auto_3940867 ?auto_3940865 ) ) ( not ( = ?auto_3940868 ?auto_3940863 ) ) ( not ( = ?auto_3940868 ?auto_3940865 ) ) ( not ( = ?auto_3940868 ?auto_3940867 ) ) ( not ( = ?auto_3940870 ?auto_3940863 ) ) ( not ( = ?auto_3940870 ?auto_3940865 ) ) ( not ( = ?auto_3940870 ?auto_3940867 ) ) ( not ( = ?auto_3940870 ?auto_3940868 ) ) ( ON_BOARD ?auto_3940874 ?auto_3940873 ) ( SUPPORTS ?auto_3940874 ?auto_3940866 ) ( not ( = ?auto_3940867 ?auto_3940872 ) ) ( HAVE_IMAGE ?auto_3940863 ?auto_3940864 ) ( not ( = ?auto_3940863 ?auto_3940872 ) ) ( not ( = ?auto_3940864 ?auto_3940866 ) ) ( CALIBRATION_TARGET ?auto_3940874 ?auto_3940872 ) ( POINTING ?auto_3940873 ?auto_3940865 ) ( not ( = ?auto_3940872 ?auto_3940865 ) ) ( ON_BOARD ?auto_3940875 ?auto_3940873 ) ( POWER_ON ?auto_3940875 ) ( not ( = ?auto_3940874 ?auto_3940875 ) ) ( HAVE_IMAGE ?auto_3940865 ?auto_3940862 ) ( HAVE_IMAGE ?auto_3940868 ?auto_3940869 ) ( HAVE_IMAGE ?auto_3940870 ?auto_3940871 ) ( not ( = ?auto_3940864 ?auto_3940862 ) ) ( not ( = ?auto_3940864 ?auto_3940869 ) ) ( not ( = ?auto_3940864 ?auto_3940871 ) ) ( not ( = ?auto_3940862 ?auto_3940866 ) ) ( not ( = ?auto_3940862 ?auto_3940869 ) ) ( not ( = ?auto_3940862 ?auto_3940871 ) ) ( not ( = ?auto_3940866 ?auto_3940869 ) ) ( not ( = ?auto_3940866 ?auto_3940871 ) ) ( not ( = ?auto_3940868 ?auto_3940872 ) ) ( not ( = ?auto_3940869 ?auto_3940871 ) ) ( not ( = ?auto_3940870 ?auto_3940872 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3940863 ?auto_3940864 ?auto_3940867 ?auto_3940866 )
      ( GET-5IMAGE-VERIFY ?auto_3940863 ?auto_3940864 ?auto_3940865 ?auto_3940862 ?auto_3940867 ?auto_3940866 ?auto_3940868 ?auto_3940869 ?auto_3940870 ?auto_3940871 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3941670 - DIRECTION
      ?auto_3941671 - MODE
      ?auto_3941672 - DIRECTION
      ?auto_3941669 - MODE
      ?auto_3941674 - DIRECTION
      ?auto_3941673 - MODE
      ?auto_3941675 - DIRECTION
      ?auto_3941676 - MODE
      ?auto_3941677 - DIRECTION
      ?auto_3941678 - MODE
    )
    :vars
    (
      ?auto_3941681 - INSTRUMENT
      ?auto_3941680 - SATELLITE
      ?auto_3941679 - DIRECTION
      ?auto_3941682 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3941672 ?auto_3941670 ) ) ( not ( = ?auto_3941674 ?auto_3941670 ) ) ( not ( = ?auto_3941674 ?auto_3941672 ) ) ( not ( = ?auto_3941675 ?auto_3941670 ) ) ( not ( = ?auto_3941675 ?auto_3941672 ) ) ( not ( = ?auto_3941675 ?auto_3941674 ) ) ( not ( = ?auto_3941677 ?auto_3941670 ) ) ( not ( = ?auto_3941677 ?auto_3941672 ) ) ( not ( = ?auto_3941677 ?auto_3941674 ) ) ( not ( = ?auto_3941677 ?auto_3941675 ) ) ( ON_BOARD ?auto_3941681 ?auto_3941680 ) ( SUPPORTS ?auto_3941681 ?auto_3941669 ) ( not ( = ?auto_3941672 ?auto_3941679 ) ) ( HAVE_IMAGE ?auto_3941670 ?auto_3941671 ) ( not ( = ?auto_3941670 ?auto_3941679 ) ) ( not ( = ?auto_3941671 ?auto_3941669 ) ) ( CALIBRATION_TARGET ?auto_3941681 ?auto_3941679 ) ( POINTING ?auto_3941680 ?auto_3941677 ) ( not ( = ?auto_3941679 ?auto_3941677 ) ) ( ON_BOARD ?auto_3941682 ?auto_3941680 ) ( POWER_ON ?auto_3941682 ) ( not ( = ?auto_3941681 ?auto_3941682 ) ) ( HAVE_IMAGE ?auto_3941674 ?auto_3941673 ) ( HAVE_IMAGE ?auto_3941675 ?auto_3941676 ) ( HAVE_IMAGE ?auto_3941677 ?auto_3941678 ) ( not ( = ?auto_3941671 ?auto_3941673 ) ) ( not ( = ?auto_3941671 ?auto_3941676 ) ) ( not ( = ?auto_3941671 ?auto_3941678 ) ) ( not ( = ?auto_3941669 ?auto_3941673 ) ) ( not ( = ?auto_3941669 ?auto_3941676 ) ) ( not ( = ?auto_3941669 ?auto_3941678 ) ) ( not ( = ?auto_3941674 ?auto_3941679 ) ) ( not ( = ?auto_3941673 ?auto_3941676 ) ) ( not ( = ?auto_3941673 ?auto_3941678 ) ) ( not ( = ?auto_3941675 ?auto_3941679 ) ) ( not ( = ?auto_3941676 ?auto_3941678 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3941670 ?auto_3941671 ?auto_3941672 ?auto_3941669 )
      ( GET-5IMAGE-VERIFY ?auto_3941670 ?auto_3941671 ?auto_3941672 ?auto_3941669 ?auto_3941674 ?auto_3941673 ?auto_3941675 ?auto_3941676 ?auto_3941677 ?auto_3941678 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3941727 - DIRECTION
      ?auto_3941728 - MODE
      ?auto_3941729 - DIRECTION
      ?auto_3941726 - MODE
      ?auto_3941731 - DIRECTION
      ?auto_3941730 - MODE
      ?auto_3941732 - DIRECTION
      ?auto_3941733 - MODE
      ?auto_3941734 - DIRECTION
      ?auto_3941735 - MODE
    )
    :vars
    (
      ?auto_3941738 - INSTRUMENT
      ?auto_3941737 - SATELLITE
      ?auto_3941736 - DIRECTION
      ?auto_3941739 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3941729 ?auto_3941727 ) ) ( not ( = ?auto_3941731 ?auto_3941727 ) ) ( not ( = ?auto_3941731 ?auto_3941729 ) ) ( not ( = ?auto_3941732 ?auto_3941727 ) ) ( not ( = ?auto_3941732 ?auto_3941729 ) ) ( not ( = ?auto_3941732 ?auto_3941731 ) ) ( not ( = ?auto_3941734 ?auto_3941727 ) ) ( not ( = ?auto_3941734 ?auto_3941729 ) ) ( not ( = ?auto_3941734 ?auto_3941731 ) ) ( not ( = ?auto_3941734 ?auto_3941732 ) ) ( ON_BOARD ?auto_3941738 ?auto_3941737 ) ( SUPPORTS ?auto_3941738 ?auto_3941726 ) ( not ( = ?auto_3941729 ?auto_3941736 ) ) ( HAVE_IMAGE ?auto_3941727 ?auto_3941728 ) ( not ( = ?auto_3941727 ?auto_3941736 ) ) ( not ( = ?auto_3941728 ?auto_3941726 ) ) ( CALIBRATION_TARGET ?auto_3941738 ?auto_3941736 ) ( POINTING ?auto_3941737 ?auto_3941732 ) ( not ( = ?auto_3941736 ?auto_3941732 ) ) ( ON_BOARD ?auto_3941739 ?auto_3941737 ) ( POWER_ON ?auto_3941739 ) ( not ( = ?auto_3941738 ?auto_3941739 ) ) ( HAVE_IMAGE ?auto_3941731 ?auto_3941730 ) ( HAVE_IMAGE ?auto_3941732 ?auto_3941733 ) ( HAVE_IMAGE ?auto_3941734 ?auto_3941735 ) ( not ( = ?auto_3941728 ?auto_3941730 ) ) ( not ( = ?auto_3941728 ?auto_3941733 ) ) ( not ( = ?auto_3941728 ?auto_3941735 ) ) ( not ( = ?auto_3941726 ?auto_3941730 ) ) ( not ( = ?auto_3941726 ?auto_3941733 ) ) ( not ( = ?auto_3941726 ?auto_3941735 ) ) ( not ( = ?auto_3941731 ?auto_3941736 ) ) ( not ( = ?auto_3941730 ?auto_3941733 ) ) ( not ( = ?auto_3941730 ?auto_3941735 ) ) ( not ( = ?auto_3941733 ?auto_3941735 ) ) ( not ( = ?auto_3941734 ?auto_3941736 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3941727 ?auto_3941728 ?auto_3941729 ?auto_3941726 )
      ( GET-5IMAGE-VERIFY ?auto_3941727 ?auto_3941728 ?auto_3941729 ?auto_3941726 ?auto_3941731 ?auto_3941730 ?auto_3941732 ?auto_3941733 ?auto_3941734 ?auto_3941735 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3942299 - DIRECTION
      ?auto_3942300 - MODE
      ?auto_3942301 - DIRECTION
      ?auto_3942298 - MODE
      ?auto_3942303 - DIRECTION
      ?auto_3942302 - MODE
      ?auto_3942304 - DIRECTION
      ?auto_3942305 - MODE
      ?auto_3942306 - DIRECTION
      ?auto_3942307 - MODE
    )
    :vars
    (
      ?auto_3942310 - INSTRUMENT
      ?auto_3942309 - SATELLITE
      ?auto_3942308 - DIRECTION
      ?auto_3942311 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3942301 ?auto_3942299 ) ) ( not ( = ?auto_3942303 ?auto_3942299 ) ) ( not ( = ?auto_3942303 ?auto_3942301 ) ) ( not ( = ?auto_3942304 ?auto_3942299 ) ) ( not ( = ?auto_3942304 ?auto_3942301 ) ) ( not ( = ?auto_3942304 ?auto_3942303 ) ) ( not ( = ?auto_3942306 ?auto_3942299 ) ) ( not ( = ?auto_3942306 ?auto_3942301 ) ) ( not ( = ?auto_3942306 ?auto_3942303 ) ) ( not ( = ?auto_3942306 ?auto_3942304 ) ) ( ON_BOARD ?auto_3942310 ?auto_3942309 ) ( SUPPORTS ?auto_3942310 ?auto_3942298 ) ( not ( = ?auto_3942301 ?auto_3942308 ) ) ( HAVE_IMAGE ?auto_3942299 ?auto_3942300 ) ( not ( = ?auto_3942299 ?auto_3942308 ) ) ( not ( = ?auto_3942300 ?auto_3942298 ) ) ( CALIBRATION_TARGET ?auto_3942310 ?auto_3942308 ) ( POINTING ?auto_3942309 ?auto_3942303 ) ( not ( = ?auto_3942308 ?auto_3942303 ) ) ( ON_BOARD ?auto_3942311 ?auto_3942309 ) ( POWER_ON ?auto_3942311 ) ( not ( = ?auto_3942310 ?auto_3942311 ) ) ( HAVE_IMAGE ?auto_3942303 ?auto_3942302 ) ( HAVE_IMAGE ?auto_3942304 ?auto_3942305 ) ( HAVE_IMAGE ?auto_3942306 ?auto_3942307 ) ( not ( = ?auto_3942300 ?auto_3942302 ) ) ( not ( = ?auto_3942300 ?auto_3942305 ) ) ( not ( = ?auto_3942300 ?auto_3942307 ) ) ( not ( = ?auto_3942298 ?auto_3942302 ) ) ( not ( = ?auto_3942298 ?auto_3942305 ) ) ( not ( = ?auto_3942298 ?auto_3942307 ) ) ( not ( = ?auto_3942302 ?auto_3942305 ) ) ( not ( = ?auto_3942302 ?auto_3942307 ) ) ( not ( = ?auto_3942304 ?auto_3942308 ) ) ( not ( = ?auto_3942305 ?auto_3942307 ) ) ( not ( = ?auto_3942306 ?auto_3942308 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3942299 ?auto_3942300 ?auto_3942301 ?auto_3942298 )
      ( GET-5IMAGE-VERIFY ?auto_3942299 ?auto_3942300 ?auto_3942301 ?auto_3942298 ?auto_3942303 ?auto_3942302 ?auto_3942304 ?auto_3942305 ?auto_3942306 ?auto_3942307 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3954257 - DIRECTION
      ?auto_3954258 - MODE
      ?auto_3954259 - DIRECTION
      ?auto_3954256 - MODE
      ?auto_3954261 - DIRECTION
      ?auto_3954260 - MODE
      ?auto_3954262 - DIRECTION
      ?auto_3954263 - MODE
      ?auto_3954264 - DIRECTION
      ?auto_3954265 - MODE
    )
    :vars
    (
      ?auto_3954268 - INSTRUMENT
      ?auto_3954267 - SATELLITE
      ?auto_3954266 - DIRECTION
      ?auto_3954269 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3954259 ?auto_3954257 ) ) ( not ( = ?auto_3954261 ?auto_3954257 ) ) ( not ( = ?auto_3954261 ?auto_3954259 ) ) ( not ( = ?auto_3954262 ?auto_3954257 ) ) ( not ( = ?auto_3954262 ?auto_3954259 ) ) ( not ( = ?auto_3954262 ?auto_3954261 ) ) ( not ( = ?auto_3954264 ?auto_3954257 ) ) ( not ( = ?auto_3954264 ?auto_3954259 ) ) ( not ( = ?auto_3954264 ?auto_3954261 ) ) ( not ( = ?auto_3954264 ?auto_3954262 ) ) ( ON_BOARD ?auto_3954268 ?auto_3954267 ) ( SUPPORTS ?auto_3954268 ?auto_3954265 ) ( not ( = ?auto_3954264 ?auto_3954266 ) ) ( HAVE_IMAGE ?auto_3954259 ?auto_3954256 ) ( not ( = ?auto_3954259 ?auto_3954266 ) ) ( not ( = ?auto_3954256 ?auto_3954265 ) ) ( CALIBRATION_TARGET ?auto_3954268 ?auto_3954266 ) ( POINTING ?auto_3954267 ?auto_3954257 ) ( not ( = ?auto_3954266 ?auto_3954257 ) ) ( ON_BOARD ?auto_3954269 ?auto_3954267 ) ( POWER_ON ?auto_3954269 ) ( not ( = ?auto_3954268 ?auto_3954269 ) ) ( HAVE_IMAGE ?auto_3954257 ?auto_3954258 ) ( HAVE_IMAGE ?auto_3954261 ?auto_3954260 ) ( HAVE_IMAGE ?auto_3954262 ?auto_3954263 ) ( not ( = ?auto_3954258 ?auto_3954256 ) ) ( not ( = ?auto_3954258 ?auto_3954260 ) ) ( not ( = ?auto_3954258 ?auto_3954263 ) ) ( not ( = ?auto_3954258 ?auto_3954265 ) ) ( not ( = ?auto_3954256 ?auto_3954260 ) ) ( not ( = ?auto_3954256 ?auto_3954263 ) ) ( not ( = ?auto_3954261 ?auto_3954266 ) ) ( not ( = ?auto_3954260 ?auto_3954263 ) ) ( not ( = ?auto_3954260 ?auto_3954265 ) ) ( not ( = ?auto_3954262 ?auto_3954266 ) ) ( not ( = ?auto_3954263 ?auto_3954265 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3954259 ?auto_3954256 ?auto_3954264 ?auto_3954265 )
      ( GET-5IMAGE-VERIFY ?auto_3954257 ?auto_3954258 ?auto_3954259 ?auto_3954256 ?auto_3954261 ?auto_3954260 ?auto_3954262 ?auto_3954263 ?auto_3954264 ?auto_3954265 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3954313 - DIRECTION
      ?auto_3954314 - MODE
      ?auto_3954315 - DIRECTION
      ?auto_3954312 - MODE
      ?auto_3954317 - DIRECTION
      ?auto_3954316 - MODE
      ?auto_3954318 - DIRECTION
      ?auto_3954319 - MODE
      ?auto_3954320 - DIRECTION
      ?auto_3954321 - MODE
    )
    :vars
    (
      ?auto_3954324 - INSTRUMENT
      ?auto_3954323 - SATELLITE
      ?auto_3954322 - DIRECTION
      ?auto_3954325 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3954315 ?auto_3954313 ) ) ( not ( = ?auto_3954317 ?auto_3954313 ) ) ( not ( = ?auto_3954317 ?auto_3954315 ) ) ( not ( = ?auto_3954318 ?auto_3954313 ) ) ( not ( = ?auto_3954318 ?auto_3954315 ) ) ( not ( = ?auto_3954318 ?auto_3954317 ) ) ( not ( = ?auto_3954320 ?auto_3954313 ) ) ( not ( = ?auto_3954320 ?auto_3954315 ) ) ( not ( = ?auto_3954320 ?auto_3954317 ) ) ( not ( = ?auto_3954320 ?auto_3954318 ) ) ( ON_BOARD ?auto_3954324 ?auto_3954323 ) ( SUPPORTS ?auto_3954324 ?auto_3954319 ) ( not ( = ?auto_3954318 ?auto_3954322 ) ) ( HAVE_IMAGE ?auto_3954315 ?auto_3954312 ) ( not ( = ?auto_3954315 ?auto_3954322 ) ) ( not ( = ?auto_3954312 ?auto_3954319 ) ) ( CALIBRATION_TARGET ?auto_3954324 ?auto_3954322 ) ( POINTING ?auto_3954323 ?auto_3954313 ) ( not ( = ?auto_3954322 ?auto_3954313 ) ) ( ON_BOARD ?auto_3954325 ?auto_3954323 ) ( POWER_ON ?auto_3954325 ) ( not ( = ?auto_3954324 ?auto_3954325 ) ) ( HAVE_IMAGE ?auto_3954313 ?auto_3954314 ) ( HAVE_IMAGE ?auto_3954317 ?auto_3954316 ) ( HAVE_IMAGE ?auto_3954320 ?auto_3954321 ) ( not ( = ?auto_3954314 ?auto_3954312 ) ) ( not ( = ?auto_3954314 ?auto_3954316 ) ) ( not ( = ?auto_3954314 ?auto_3954319 ) ) ( not ( = ?auto_3954314 ?auto_3954321 ) ) ( not ( = ?auto_3954312 ?auto_3954316 ) ) ( not ( = ?auto_3954312 ?auto_3954321 ) ) ( not ( = ?auto_3954317 ?auto_3954322 ) ) ( not ( = ?auto_3954316 ?auto_3954319 ) ) ( not ( = ?auto_3954316 ?auto_3954321 ) ) ( not ( = ?auto_3954319 ?auto_3954321 ) ) ( not ( = ?auto_3954320 ?auto_3954322 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3954315 ?auto_3954312 ?auto_3954318 ?auto_3954319 )
      ( GET-5IMAGE-VERIFY ?auto_3954313 ?auto_3954314 ?auto_3954315 ?auto_3954312 ?auto_3954317 ?auto_3954316 ?auto_3954318 ?auto_3954319 ?auto_3954320 ?auto_3954321 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3954697 - DIRECTION
      ?auto_3954698 - MODE
      ?auto_3954699 - DIRECTION
      ?auto_3954696 - MODE
      ?auto_3954701 - DIRECTION
      ?auto_3954700 - MODE
      ?auto_3954702 - DIRECTION
      ?auto_3954703 - MODE
      ?auto_3954704 - DIRECTION
      ?auto_3954705 - MODE
    )
    :vars
    (
      ?auto_3954708 - INSTRUMENT
      ?auto_3954707 - SATELLITE
      ?auto_3954706 - DIRECTION
      ?auto_3954709 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3954699 ?auto_3954697 ) ) ( not ( = ?auto_3954701 ?auto_3954697 ) ) ( not ( = ?auto_3954701 ?auto_3954699 ) ) ( not ( = ?auto_3954702 ?auto_3954697 ) ) ( not ( = ?auto_3954702 ?auto_3954699 ) ) ( not ( = ?auto_3954702 ?auto_3954701 ) ) ( not ( = ?auto_3954704 ?auto_3954697 ) ) ( not ( = ?auto_3954704 ?auto_3954699 ) ) ( not ( = ?auto_3954704 ?auto_3954701 ) ) ( not ( = ?auto_3954704 ?auto_3954702 ) ) ( ON_BOARD ?auto_3954708 ?auto_3954707 ) ( SUPPORTS ?auto_3954708 ?auto_3954700 ) ( not ( = ?auto_3954701 ?auto_3954706 ) ) ( HAVE_IMAGE ?auto_3954699 ?auto_3954696 ) ( not ( = ?auto_3954699 ?auto_3954706 ) ) ( not ( = ?auto_3954696 ?auto_3954700 ) ) ( CALIBRATION_TARGET ?auto_3954708 ?auto_3954706 ) ( POINTING ?auto_3954707 ?auto_3954697 ) ( not ( = ?auto_3954706 ?auto_3954697 ) ) ( ON_BOARD ?auto_3954709 ?auto_3954707 ) ( POWER_ON ?auto_3954709 ) ( not ( = ?auto_3954708 ?auto_3954709 ) ) ( HAVE_IMAGE ?auto_3954697 ?auto_3954698 ) ( HAVE_IMAGE ?auto_3954702 ?auto_3954703 ) ( HAVE_IMAGE ?auto_3954704 ?auto_3954705 ) ( not ( = ?auto_3954698 ?auto_3954696 ) ) ( not ( = ?auto_3954698 ?auto_3954700 ) ) ( not ( = ?auto_3954698 ?auto_3954703 ) ) ( not ( = ?auto_3954698 ?auto_3954705 ) ) ( not ( = ?auto_3954696 ?auto_3954703 ) ) ( not ( = ?auto_3954696 ?auto_3954705 ) ) ( not ( = ?auto_3954700 ?auto_3954703 ) ) ( not ( = ?auto_3954700 ?auto_3954705 ) ) ( not ( = ?auto_3954702 ?auto_3954706 ) ) ( not ( = ?auto_3954703 ?auto_3954705 ) ) ( not ( = ?auto_3954704 ?auto_3954706 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3954699 ?auto_3954696 ?auto_3954701 ?auto_3954700 )
      ( GET-5IMAGE-VERIFY ?auto_3954697 ?auto_3954698 ?auto_3954699 ?auto_3954696 ?auto_3954701 ?auto_3954700 ?auto_3954702 ?auto_3954703 ?auto_3954704 ?auto_3954705 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3957779 - DIRECTION
      ?auto_3957780 - MODE
      ?auto_3957781 - DIRECTION
      ?auto_3957778 - MODE
      ?auto_3957783 - DIRECTION
      ?auto_3957782 - MODE
      ?auto_3957784 - DIRECTION
      ?auto_3957785 - MODE
      ?auto_3957786 - DIRECTION
      ?auto_3957787 - MODE
    )
    :vars
    (
      ?auto_3957790 - INSTRUMENT
      ?auto_3957789 - SATELLITE
      ?auto_3957788 - DIRECTION
      ?auto_3957791 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3957781 ?auto_3957779 ) ) ( not ( = ?auto_3957783 ?auto_3957779 ) ) ( not ( = ?auto_3957783 ?auto_3957781 ) ) ( not ( = ?auto_3957784 ?auto_3957779 ) ) ( not ( = ?auto_3957784 ?auto_3957781 ) ) ( not ( = ?auto_3957784 ?auto_3957783 ) ) ( not ( = ?auto_3957786 ?auto_3957779 ) ) ( not ( = ?auto_3957786 ?auto_3957781 ) ) ( not ( = ?auto_3957786 ?auto_3957783 ) ) ( not ( = ?auto_3957786 ?auto_3957784 ) ) ( ON_BOARD ?auto_3957790 ?auto_3957789 ) ( SUPPORTS ?auto_3957790 ?auto_3957778 ) ( not ( = ?auto_3957781 ?auto_3957788 ) ) ( HAVE_IMAGE ?auto_3957783 ?auto_3957782 ) ( not ( = ?auto_3957783 ?auto_3957788 ) ) ( not ( = ?auto_3957782 ?auto_3957778 ) ) ( CALIBRATION_TARGET ?auto_3957790 ?auto_3957788 ) ( POINTING ?auto_3957789 ?auto_3957779 ) ( not ( = ?auto_3957788 ?auto_3957779 ) ) ( ON_BOARD ?auto_3957791 ?auto_3957789 ) ( POWER_ON ?auto_3957791 ) ( not ( = ?auto_3957790 ?auto_3957791 ) ) ( HAVE_IMAGE ?auto_3957779 ?auto_3957780 ) ( HAVE_IMAGE ?auto_3957784 ?auto_3957785 ) ( HAVE_IMAGE ?auto_3957786 ?auto_3957787 ) ( not ( = ?auto_3957780 ?auto_3957778 ) ) ( not ( = ?auto_3957780 ?auto_3957782 ) ) ( not ( = ?auto_3957780 ?auto_3957785 ) ) ( not ( = ?auto_3957780 ?auto_3957787 ) ) ( not ( = ?auto_3957778 ?auto_3957785 ) ) ( not ( = ?auto_3957778 ?auto_3957787 ) ) ( not ( = ?auto_3957782 ?auto_3957785 ) ) ( not ( = ?auto_3957782 ?auto_3957787 ) ) ( not ( = ?auto_3957784 ?auto_3957788 ) ) ( not ( = ?auto_3957785 ?auto_3957787 ) ) ( not ( = ?auto_3957786 ?auto_3957788 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3957783 ?auto_3957782 ?auto_3957781 ?auto_3957778 )
      ( GET-5IMAGE-VERIFY ?auto_3957779 ?auto_3957780 ?auto_3957781 ?auto_3957778 ?auto_3957783 ?auto_3957782 ?auto_3957784 ?auto_3957785 ?auto_3957786 ?auto_3957787 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3960098 - DIRECTION
      ?auto_3960099 - MODE
      ?auto_3960100 - DIRECTION
      ?auto_3960097 - MODE
      ?auto_3960102 - DIRECTION
      ?auto_3960101 - MODE
      ?auto_3960103 - DIRECTION
      ?auto_3960104 - MODE
      ?auto_3960105 - DIRECTION
      ?auto_3960106 - MODE
    )
    :vars
    (
      ?auto_3960109 - INSTRUMENT
      ?auto_3960108 - SATELLITE
      ?auto_3960107 - DIRECTION
      ?auto_3960110 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3960100 ?auto_3960098 ) ) ( not ( = ?auto_3960102 ?auto_3960098 ) ) ( not ( = ?auto_3960102 ?auto_3960100 ) ) ( not ( = ?auto_3960103 ?auto_3960098 ) ) ( not ( = ?auto_3960103 ?auto_3960100 ) ) ( not ( = ?auto_3960103 ?auto_3960102 ) ) ( not ( = ?auto_3960105 ?auto_3960098 ) ) ( not ( = ?auto_3960105 ?auto_3960100 ) ) ( not ( = ?auto_3960105 ?auto_3960102 ) ) ( not ( = ?auto_3960105 ?auto_3960103 ) ) ( ON_BOARD ?auto_3960109 ?auto_3960108 ) ( SUPPORTS ?auto_3960109 ?auto_3960099 ) ( not ( = ?auto_3960098 ?auto_3960107 ) ) ( HAVE_IMAGE ?auto_3960100 ?auto_3960097 ) ( not ( = ?auto_3960100 ?auto_3960107 ) ) ( not ( = ?auto_3960097 ?auto_3960099 ) ) ( CALIBRATION_TARGET ?auto_3960109 ?auto_3960107 ) ( POINTING ?auto_3960108 ?auto_3960105 ) ( not ( = ?auto_3960107 ?auto_3960105 ) ) ( ON_BOARD ?auto_3960110 ?auto_3960108 ) ( POWER_ON ?auto_3960110 ) ( not ( = ?auto_3960109 ?auto_3960110 ) ) ( HAVE_IMAGE ?auto_3960102 ?auto_3960101 ) ( HAVE_IMAGE ?auto_3960103 ?auto_3960104 ) ( HAVE_IMAGE ?auto_3960105 ?auto_3960106 ) ( not ( = ?auto_3960099 ?auto_3960101 ) ) ( not ( = ?auto_3960099 ?auto_3960104 ) ) ( not ( = ?auto_3960099 ?auto_3960106 ) ) ( not ( = ?auto_3960097 ?auto_3960101 ) ) ( not ( = ?auto_3960097 ?auto_3960104 ) ) ( not ( = ?auto_3960097 ?auto_3960106 ) ) ( not ( = ?auto_3960102 ?auto_3960107 ) ) ( not ( = ?auto_3960101 ?auto_3960104 ) ) ( not ( = ?auto_3960101 ?auto_3960106 ) ) ( not ( = ?auto_3960103 ?auto_3960107 ) ) ( not ( = ?auto_3960104 ?auto_3960106 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3960100 ?auto_3960097 ?auto_3960098 ?auto_3960099 )
      ( GET-5IMAGE-VERIFY ?auto_3960098 ?auto_3960099 ?auto_3960100 ?auto_3960097 ?auto_3960102 ?auto_3960101 ?auto_3960103 ?auto_3960104 ?auto_3960105 ?auto_3960106 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3960155 - DIRECTION
      ?auto_3960156 - MODE
      ?auto_3960157 - DIRECTION
      ?auto_3960154 - MODE
      ?auto_3960159 - DIRECTION
      ?auto_3960158 - MODE
      ?auto_3960160 - DIRECTION
      ?auto_3960161 - MODE
      ?auto_3960162 - DIRECTION
      ?auto_3960163 - MODE
    )
    :vars
    (
      ?auto_3960166 - INSTRUMENT
      ?auto_3960165 - SATELLITE
      ?auto_3960164 - DIRECTION
      ?auto_3960167 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3960157 ?auto_3960155 ) ) ( not ( = ?auto_3960159 ?auto_3960155 ) ) ( not ( = ?auto_3960159 ?auto_3960157 ) ) ( not ( = ?auto_3960160 ?auto_3960155 ) ) ( not ( = ?auto_3960160 ?auto_3960157 ) ) ( not ( = ?auto_3960160 ?auto_3960159 ) ) ( not ( = ?auto_3960162 ?auto_3960155 ) ) ( not ( = ?auto_3960162 ?auto_3960157 ) ) ( not ( = ?auto_3960162 ?auto_3960159 ) ) ( not ( = ?auto_3960162 ?auto_3960160 ) ) ( ON_BOARD ?auto_3960166 ?auto_3960165 ) ( SUPPORTS ?auto_3960166 ?auto_3960156 ) ( not ( = ?auto_3960155 ?auto_3960164 ) ) ( HAVE_IMAGE ?auto_3960157 ?auto_3960154 ) ( not ( = ?auto_3960157 ?auto_3960164 ) ) ( not ( = ?auto_3960154 ?auto_3960156 ) ) ( CALIBRATION_TARGET ?auto_3960166 ?auto_3960164 ) ( POINTING ?auto_3960165 ?auto_3960160 ) ( not ( = ?auto_3960164 ?auto_3960160 ) ) ( ON_BOARD ?auto_3960167 ?auto_3960165 ) ( POWER_ON ?auto_3960167 ) ( not ( = ?auto_3960166 ?auto_3960167 ) ) ( HAVE_IMAGE ?auto_3960159 ?auto_3960158 ) ( HAVE_IMAGE ?auto_3960160 ?auto_3960161 ) ( HAVE_IMAGE ?auto_3960162 ?auto_3960163 ) ( not ( = ?auto_3960156 ?auto_3960158 ) ) ( not ( = ?auto_3960156 ?auto_3960161 ) ) ( not ( = ?auto_3960156 ?auto_3960163 ) ) ( not ( = ?auto_3960154 ?auto_3960158 ) ) ( not ( = ?auto_3960154 ?auto_3960161 ) ) ( not ( = ?auto_3960154 ?auto_3960163 ) ) ( not ( = ?auto_3960159 ?auto_3960164 ) ) ( not ( = ?auto_3960158 ?auto_3960161 ) ) ( not ( = ?auto_3960158 ?auto_3960163 ) ) ( not ( = ?auto_3960161 ?auto_3960163 ) ) ( not ( = ?auto_3960162 ?auto_3960164 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3960157 ?auto_3960154 ?auto_3960155 ?auto_3960156 )
      ( GET-5IMAGE-VERIFY ?auto_3960155 ?auto_3960156 ?auto_3960157 ?auto_3960154 ?auto_3960159 ?auto_3960158 ?auto_3960160 ?auto_3960161 ?auto_3960162 ?auto_3960163 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3960727 - DIRECTION
      ?auto_3960728 - MODE
      ?auto_3960729 - DIRECTION
      ?auto_3960726 - MODE
      ?auto_3960731 - DIRECTION
      ?auto_3960730 - MODE
      ?auto_3960732 - DIRECTION
      ?auto_3960733 - MODE
      ?auto_3960734 - DIRECTION
      ?auto_3960735 - MODE
    )
    :vars
    (
      ?auto_3960738 - INSTRUMENT
      ?auto_3960737 - SATELLITE
      ?auto_3960736 - DIRECTION
      ?auto_3960739 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3960729 ?auto_3960727 ) ) ( not ( = ?auto_3960731 ?auto_3960727 ) ) ( not ( = ?auto_3960731 ?auto_3960729 ) ) ( not ( = ?auto_3960732 ?auto_3960727 ) ) ( not ( = ?auto_3960732 ?auto_3960729 ) ) ( not ( = ?auto_3960732 ?auto_3960731 ) ) ( not ( = ?auto_3960734 ?auto_3960727 ) ) ( not ( = ?auto_3960734 ?auto_3960729 ) ) ( not ( = ?auto_3960734 ?auto_3960731 ) ) ( not ( = ?auto_3960734 ?auto_3960732 ) ) ( ON_BOARD ?auto_3960738 ?auto_3960737 ) ( SUPPORTS ?auto_3960738 ?auto_3960728 ) ( not ( = ?auto_3960727 ?auto_3960736 ) ) ( HAVE_IMAGE ?auto_3960729 ?auto_3960726 ) ( not ( = ?auto_3960729 ?auto_3960736 ) ) ( not ( = ?auto_3960726 ?auto_3960728 ) ) ( CALIBRATION_TARGET ?auto_3960738 ?auto_3960736 ) ( POINTING ?auto_3960737 ?auto_3960731 ) ( not ( = ?auto_3960736 ?auto_3960731 ) ) ( ON_BOARD ?auto_3960739 ?auto_3960737 ) ( POWER_ON ?auto_3960739 ) ( not ( = ?auto_3960738 ?auto_3960739 ) ) ( HAVE_IMAGE ?auto_3960731 ?auto_3960730 ) ( HAVE_IMAGE ?auto_3960732 ?auto_3960733 ) ( HAVE_IMAGE ?auto_3960734 ?auto_3960735 ) ( not ( = ?auto_3960728 ?auto_3960730 ) ) ( not ( = ?auto_3960728 ?auto_3960733 ) ) ( not ( = ?auto_3960728 ?auto_3960735 ) ) ( not ( = ?auto_3960726 ?auto_3960730 ) ) ( not ( = ?auto_3960726 ?auto_3960733 ) ) ( not ( = ?auto_3960726 ?auto_3960735 ) ) ( not ( = ?auto_3960730 ?auto_3960733 ) ) ( not ( = ?auto_3960730 ?auto_3960735 ) ) ( not ( = ?auto_3960732 ?auto_3960736 ) ) ( not ( = ?auto_3960733 ?auto_3960735 ) ) ( not ( = ?auto_3960734 ?auto_3960736 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3960729 ?auto_3960726 ?auto_3960727 ?auto_3960728 )
      ( GET-5IMAGE-VERIFY ?auto_3960727 ?auto_3960728 ?auto_3960729 ?auto_3960726 ?auto_3960731 ?auto_3960730 ?auto_3960732 ?auto_3960733 ?auto_3960734 ?auto_3960735 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_3965275 - DIRECTION
      ?auto_3965276 - MODE
      ?auto_3965277 - DIRECTION
      ?auto_3965274 - MODE
      ?auto_3965279 - DIRECTION
      ?auto_3965278 - MODE
      ?auto_3965280 - DIRECTION
      ?auto_3965281 - MODE
      ?auto_3965282 - DIRECTION
      ?auto_3965283 - MODE
    )
    :vars
    (
      ?auto_3965286 - INSTRUMENT
      ?auto_3965285 - SATELLITE
      ?auto_3965284 - DIRECTION
      ?auto_3965287 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_3965277 ?auto_3965275 ) ) ( not ( = ?auto_3965279 ?auto_3965275 ) ) ( not ( = ?auto_3965279 ?auto_3965277 ) ) ( not ( = ?auto_3965280 ?auto_3965275 ) ) ( not ( = ?auto_3965280 ?auto_3965277 ) ) ( not ( = ?auto_3965280 ?auto_3965279 ) ) ( not ( = ?auto_3965282 ?auto_3965275 ) ) ( not ( = ?auto_3965282 ?auto_3965277 ) ) ( not ( = ?auto_3965282 ?auto_3965279 ) ) ( not ( = ?auto_3965282 ?auto_3965280 ) ) ( ON_BOARD ?auto_3965286 ?auto_3965285 ) ( SUPPORTS ?auto_3965286 ?auto_3965276 ) ( not ( = ?auto_3965275 ?auto_3965284 ) ) ( HAVE_IMAGE ?auto_3965279 ?auto_3965278 ) ( not ( = ?auto_3965279 ?auto_3965284 ) ) ( not ( = ?auto_3965278 ?auto_3965276 ) ) ( CALIBRATION_TARGET ?auto_3965286 ?auto_3965284 ) ( POINTING ?auto_3965285 ?auto_3965277 ) ( not ( = ?auto_3965284 ?auto_3965277 ) ) ( ON_BOARD ?auto_3965287 ?auto_3965285 ) ( POWER_ON ?auto_3965287 ) ( not ( = ?auto_3965286 ?auto_3965287 ) ) ( HAVE_IMAGE ?auto_3965277 ?auto_3965274 ) ( HAVE_IMAGE ?auto_3965280 ?auto_3965281 ) ( HAVE_IMAGE ?auto_3965282 ?auto_3965283 ) ( not ( = ?auto_3965276 ?auto_3965274 ) ) ( not ( = ?auto_3965276 ?auto_3965281 ) ) ( not ( = ?auto_3965276 ?auto_3965283 ) ) ( not ( = ?auto_3965274 ?auto_3965278 ) ) ( not ( = ?auto_3965274 ?auto_3965281 ) ) ( not ( = ?auto_3965274 ?auto_3965283 ) ) ( not ( = ?auto_3965278 ?auto_3965281 ) ) ( not ( = ?auto_3965278 ?auto_3965283 ) ) ( not ( = ?auto_3965280 ?auto_3965284 ) ) ( not ( = ?auto_3965281 ?auto_3965283 ) ) ( not ( = ?auto_3965282 ?auto_3965284 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3965279 ?auto_3965278 ?auto_3965275 ?auto_3965276 )
      ( GET-5IMAGE-VERIFY ?auto_3965275 ?auto_3965276 ?auto_3965277 ?auto_3965274 ?auto_3965279 ?auto_3965278 ?auto_3965280 ?auto_3965281 ?auto_3965282 ?auto_3965283 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4044490 - DIRECTION
      ?auto_4044491 - MODE
      ?auto_4044492 - DIRECTION
      ?auto_4044489 - MODE
      ?auto_4044494 - DIRECTION
      ?auto_4044493 - MODE
      ?auto_4044495 - DIRECTION
      ?auto_4044496 - MODE
    )
    :vars
    (
      ?auto_4044499 - INSTRUMENT
      ?auto_4044500 - SATELLITE
      ?auto_4044497 - DIRECTION
      ?auto_4044498 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4044492 ?auto_4044490 ) ) ( not ( = ?auto_4044494 ?auto_4044490 ) ) ( not ( = ?auto_4044494 ?auto_4044492 ) ) ( not ( = ?auto_4044495 ?auto_4044490 ) ) ( not ( = ?auto_4044495 ?auto_4044492 ) ) ( not ( = ?auto_4044495 ?auto_4044494 ) ) ( ON_BOARD ?auto_4044499 ?auto_4044500 ) ( SUPPORTS ?auto_4044499 ?auto_4044496 ) ( not ( = ?auto_4044495 ?auto_4044497 ) ) ( HAVE_IMAGE ?auto_4044490 ?auto_4044491 ) ( not ( = ?auto_4044490 ?auto_4044497 ) ) ( not ( = ?auto_4044491 ?auto_4044496 ) ) ( CALIBRATION_TARGET ?auto_4044499 ?auto_4044497 ) ( not ( = ?auto_4044497 ?auto_4044492 ) ) ( ON_BOARD ?auto_4044498 ?auto_4044500 ) ( POWER_ON ?auto_4044498 ) ( not ( = ?auto_4044499 ?auto_4044498 ) ) ( POINTING ?auto_4044500 ?auto_4044497 ) ( HAVE_IMAGE ?auto_4044492 ?auto_4044489 ) ( HAVE_IMAGE ?auto_4044494 ?auto_4044493 ) ( not ( = ?auto_4044491 ?auto_4044489 ) ) ( not ( = ?auto_4044491 ?auto_4044493 ) ) ( not ( = ?auto_4044489 ?auto_4044493 ) ) ( not ( = ?auto_4044489 ?auto_4044496 ) ) ( not ( = ?auto_4044494 ?auto_4044497 ) ) ( not ( = ?auto_4044493 ?auto_4044496 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4044490 ?auto_4044491 ?auto_4044495 ?auto_4044496 )
      ( GET-4IMAGE-VERIFY ?auto_4044490 ?auto_4044491 ?auto_4044492 ?auto_4044489 ?auto_4044494 ?auto_4044493 ?auto_4044495 ?auto_4044496 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4044538 - DIRECTION
      ?auto_4044539 - MODE
      ?auto_4044540 - DIRECTION
      ?auto_4044537 - MODE
      ?auto_4044542 - DIRECTION
      ?auto_4044541 - MODE
      ?auto_4044543 - DIRECTION
      ?auto_4044544 - MODE
    )
    :vars
    (
      ?auto_4044547 - INSTRUMENT
      ?auto_4044548 - SATELLITE
      ?auto_4044545 - DIRECTION
      ?auto_4044546 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4044540 ?auto_4044538 ) ) ( not ( = ?auto_4044542 ?auto_4044538 ) ) ( not ( = ?auto_4044542 ?auto_4044540 ) ) ( not ( = ?auto_4044543 ?auto_4044538 ) ) ( not ( = ?auto_4044543 ?auto_4044540 ) ) ( not ( = ?auto_4044543 ?auto_4044542 ) ) ( ON_BOARD ?auto_4044547 ?auto_4044548 ) ( SUPPORTS ?auto_4044547 ?auto_4044541 ) ( not ( = ?auto_4044542 ?auto_4044545 ) ) ( HAVE_IMAGE ?auto_4044538 ?auto_4044539 ) ( not ( = ?auto_4044538 ?auto_4044545 ) ) ( not ( = ?auto_4044539 ?auto_4044541 ) ) ( CALIBRATION_TARGET ?auto_4044547 ?auto_4044545 ) ( not ( = ?auto_4044545 ?auto_4044540 ) ) ( ON_BOARD ?auto_4044546 ?auto_4044548 ) ( POWER_ON ?auto_4044546 ) ( not ( = ?auto_4044547 ?auto_4044546 ) ) ( POINTING ?auto_4044548 ?auto_4044545 ) ( HAVE_IMAGE ?auto_4044540 ?auto_4044537 ) ( HAVE_IMAGE ?auto_4044543 ?auto_4044544 ) ( not ( = ?auto_4044539 ?auto_4044537 ) ) ( not ( = ?auto_4044539 ?auto_4044544 ) ) ( not ( = ?auto_4044537 ?auto_4044541 ) ) ( not ( = ?auto_4044537 ?auto_4044544 ) ) ( not ( = ?auto_4044541 ?auto_4044544 ) ) ( not ( = ?auto_4044543 ?auto_4044545 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4044538 ?auto_4044539 ?auto_4044542 ?auto_4044541 )
      ( GET-4IMAGE-VERIFY ?auto_4044538 ?auto_4044539 ?auto_4044540 ?auto_4044537 ?auto_4044542 ?auto_4044541 ?auto_4044543 ?auto_4044544 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4044884 - DIRECTION
      ?auto_4044885 - MODE
      ?auto_4044886 - DIRECTION
      ?auto_4044883 - MODE
      ?auto_4044888 - DIRECTION
      ?auto_4044887 - MODE
      ?auto_4044889 - DIRECTION
      ?auto_4044890 - MODE
    )
    :vars
    (
      ?auto_4044893 - INSTRUMENT
      ?auto_4044894 - SATELLITE
      ?auto_4044891 - DIRECTION
      ?auto_4044892 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4044886 ?auto_4044884 ) ) ( not ( = ?auto_4044888 ?auto_4044884 ) ) ( not ( = ?auto_4044888 ?auto_4044886 ) ) ( not ( = ?auto_4044889 ?auto_4044884 ) ) ( not ( = ?auto_4044889 ?auto_4044886 ) ) ( not ( = ?auto_4044889 ?auto_4044888 ) ) ( ON_BOARD ?auto_4044893 ?auto_4044894 ) ( SUPPORTS ?auto_4044893 ?auto_4044883 ) ( not ( = ?auto_4044886 ?auto_4044891 ) ) ( HAVE_IMAGE ?auto_4044884 ?auto_4044885 ) ( not ( = ?auto_4044884 ?auto_4044891 ) ) ( not ( = ?auto_4044885 ?auto_4044883 ) ) ( CALIBRATION_TARGET ?auto_4044893 ?auto_4044891 ) ( not ( = ?auto_4044891 ?auto_4044888 ) ) ( ON_BOARD ?auto_4044892 ?auto_4044894 ) ( POWER_ON ?auto_4044892 ) ( not ( = ?auto_4044893 ?auto_4044892 ) ) ( POINTING ?auto_4044894 ?auto_4044891 ) ( HAVE_IMAGE ?auto_4044888 ?auto_4044887 ) ( HAVE_IMAGE ?auto_4044889 ?auto_4044890 ) ( not ( = ?auto_4044885 ?auto_4044887 ) ) ( not ( = ?auto_4044885 ?auto_4044890 ) ) ( not ( = ?auto_4044883 ?auto_4044887 ) ) ( not ( = ?auto_4044883 ?auto_4044890 ) ) ( not ( = ?auto_4044887 ?auto_4044890 ) ) ( not ( = ?auto_4044889 ?auto_4044891 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4044884 ?auto_4044885 ?auto_4044886 ?auto_4044883 )
      ( GET-4IMAGE-VERIFY ?auto_4044884 ?auto_4044885 ?auto_4044886 ?auto_4044883 ?auto_4044888 ?auto_4044887 ?auto_4044889 ?auto_4044890 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4007746 - DIRECTION
      ?auto_4007747 - MODE
      ?auto_4007748 - DIRECTION
      ?auto_4007745 - MODE
      ?auto_4007750 - DIRECTION
      ?auto_4007749 - MODE
      ?auto_4007751 - DIRECTION
      ?auto_4007752 - MODE
    )
    :vars
    (
      ?auto_4007753 - INSTRUMENT
      ?auto_4007756 - SATELLITE
      ?auto_4007754 - DIRECTION
      ?auto_4007755 - DIRECTION
      ?auto_4007757 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4007748 ?auto_4007746 ) ) ( not ( = ?auto_4007750 ?auto_4007746 ) ) ( not ( = ?auto_4007750 ?auto_4007748 ) ) ( not ( = ?auto_4007751 ?auto_4007746 ) ) ( not ( = ?auto_4007751 ?auto_4007748 ) ) ( not ( = ?auto_4007751 ?auto_4007750 ) ) ( ON_BOARD ?auto_4007753 ?auto_4007756 ) ( SUPPORTS ?auto_4007753 ?auto_4007752 ) ( not ( = ?auto_4007751 ?auto_4007754 ) ) ( HAVE_IMAGE ?auto_4007748 ?auto_4007745 ) ( not ( = ?auto_4007748 ?auto_4007754 ) ) ( not ( = ?auto_4007745 ?auto_4007752 ) ) ( CALIBRATION_TARGET ?auto_4007753 ?auto_4007754 ) ( not ( = ?auto_4007754 ?auto_4007755 ) ) ( not ( = ?auto_4007751 ?auto_4007755 ) ) ( not ( = ?auto_4007748 ?auto_4007755 ) ) ( ON_BOARD ?auto_4007757 ?auto_4007756 ) ( POWER_ON ?auto_4007757 ) ( not ( = ?auto_4007753 ?auto_4007757 ) ) ( POINTING ?auto_4007756 ?auto_4007754 ) ( HAVE_IMAGE ?auto_4007746 ?auto_4007747 ) ( HAVE_IMAGE ?auto_4007750 ?auto_4007749 ) ( not ( = ?auto_4007746 ?auto_4007754 ) ) ( not ( = ?auto_4007746 ?auto_4007755 ) ) ( not ( = ?auto_4007747 ?auto_4007745 ) ) ( not ( = ?auto_4007747 ?auto_4007749 ) ) ( not ( = ?auto_4007747 ?auto_4007752 ) ) ( not ( = ?auto_4007745 ?auto_4007749 ) ) ( not ( = ?auto_4007750 ?auto_4007754 ) ) ( not ( = ?auto_4007750 ?auto_4007755 ) ) ( not ( = ?auto_4007749 ?auto_4007752 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4007748 ?auto_4007745 ?auto_4007751 ?auto_4007752 )
      ( GET-4IMAGE-VERIFY ?auto_4007746 ?auto_4007747 ?auto_4007748 ?auto_4007745 ?auto_4007750 ?auto_4007749 ?auto_4007751 ?auto_4007752 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4007797 - DIRECTION
      ?auto_4007798 - MODE
      ?auto_4007799 - DIRECTION
      ?auto_4007796 - MODE
      ?auto_4007801 - DIRECTION
      ?auto_4007800 - MODE
      ?auto_4007802 - DIRECTION
      ?auto_4007803 - MODE
    )
    :vars
    (
      ?auto_4007804 - INSTRUMENT
      ?auto_4007807 - SATELLITE
      ?auto_4007805 - DIRECTION
      ?auto_4007806 - DIRECTION
      ?auto_4007808 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4007799 ?auto_4007797 ) ) ( not ( = ?auto_4007801 ?auto_4007797 ) ) ( not ( = ?auto_4007801 ?auto_4007799 ) ) ( not ( = ?auto_4007802 ?auto_4007797 ) ) ( not ( = ?auto_4007802 ?auto_4007799 ) ) ( not ( = ?auto_4007802 ?auto_4007801 ) ) ( ON_BOARD ?auto_4007804 ?auto_4007807 ) ( SUPPORTS ?auto_4007804 ?auto_4007800 ) ( not ( = ?auto_4007801 ?auto_4007805 ) ) ( HAVE_IMAGE ?auto_4007799 ?auto_4007796 ) ( not ( = ?auto_4007799 ?auto_4007805 ) ) ( not ( = ?auto_4007796 ?auto_4007800 ) ) ( CALIBRATION_TARGET ?auto_4007804 ?auto_4007805 ) ( not ( = ?auto_4007805 ?auto_4007806 ) ) ( not ( = ?auto_4007801 ?auto_4007806 ) ) ( not ( = ?auto_4007799 ?auto_4007806 ) ) ( ON_BOARD ?auto_4007808 ?auto_4007807 ) ( POWER_ON ?auto_4007808 ) ( not ( = ?auto_4007804 ?auto_4007808 ) ) ( POINTING ?auto_4007807 ?auto_4007805 ) ( HAVE_IMAGE ?auto_4007797 ?auto_4007798 ) ( HAVE_IMAGE ?auto_4007802 ?auto_4007803 ) ( not ( = ?auto_4007797 ?auto_4007805 ) ) ( not ( = ?auto_4007797 ?auto_4007806 ) ) ( not ( = ?auto_4007798 ?auto_4007796 ) ) ( not ( = ?auto_4007798 ?auto_4007800 ) ) ( not ( = ?auto_4007798 ?auto_4007803 ) ) ( not ( = ?auto_4007796 ?auto_4007803 ) ) ( not ( = ?auto_4007800 ?auto_4007803 ) ) ( not ( = ?auto_4007802 ?auto_4007805 ) ) ( not ( = ?auto_4007802 ?auto_4007806 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4007799 ?auto_4007796 ?auto_4007801 ?auto_4007800 )
      ( GET-4IMAGE-VERIFY ?auto_4007797 ?auto_4007798 ?auto_4007799 ?auto_4007796 ?auto_4007801 ?auto_4007800 ?auto_4007802 ?auto_4007803 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4007964 - DIRECTION
      ?auto_4007965 - MODE
      ?auto_4007966 - DIRECTION
      ?auto_4007963 - MODE
      ?auto_4007968 - DIRECTION
      ?auto_4007967 - MODE
      ?auto_4007969 - DIRECTION
      ?auto_4007970 - MODE
    )
    :vars
    (
      ?auto_4007971 - INSTRUMENT
      ?auto_4007974 - SATELLITE
      ?auto_4007972 - DIRECTION
      ?auto_4007973 - DIRECTION
      ?auto_4007975 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4007966 ?auto_4007964 ) ) ( not ( = ?auto_4007968 ?auto_4007964 ) ) ( not ( = ?auto_4007968 ?auto_4007966 ) ) ( not ( = ?auto_4007969 ?auto_4007964 ) ) ( not ( = ?auto_4007969 ?auto_4007966 ) ) ( not ( = ?auto_4007969 ?auto_4007968 ) ) ( ON_BOARD ?auto_4007971 ?auto_4007974 ) ( SUPPORTS ?auto_4007971 ?auto_4007970 ) ( not ( = ?auto_4007969 ?auto_4007972 ) ) ( HAVE_IMAGE ?auto_4007968 ?auto_4007967 ) ( not ( = ?auto_4007968 ?auto_4007972 ) ) ( not ( = ?auto_4007967 ?auto_4007970 ) ) ( CALIBRATION_TARGET ?auto_4007971 ?auto_4007972 ) ( not ( = ?auto_4007972 ?auto_4007973 ) ) ( not ( = ?auto_4007969 ?auto_4007973 ) ) ( not ( = ?auto_4007968 ?auto_4007973 ) ) ( ON_BOARD ?auto_4007975 ?auto_4007974 ) ( POWER_ON ?auto_4007975 ) ( not ( = ?auto_4007971 ?auto_4007975 ) ) ( POINTING ?auto_4007974 ?auto_4007972 ) ( HAVE_IMAGE ?auto_4007964 ?auto_4007965 ) ( HAVE_IMAGE ?auto_4007966 ?auto_4007963 ) ( not ( = ?auto_4007964 ?auto_4007972 ) ) ( not ( = ?auto_4007964 ?auto_4007973 ) ) ( not ( = ?auto_4007965 ?auto_4007963 ) ) ( not ( = ?auto_4007965 ?auto_4007967 ) ) ( not ( = ?auto_4007965 ?auto_4007970 ) ) ( not ( = ?auto_4007966 ?auto_4007972 ) ) ( not ( = ?auto_4007966 ?auto_4007973 ) ) ( not ( = ?auto_4007963 ?auto_4007967 ) ) ( not ( = ?auto_4007963 ?auto_4007970 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4007968 ?auto_4007967 ?auto_4007969 ?auto_4007970 )
      ( GET-4IMAGE-VERIFY ?auto_4007964 ?auto_4007965 ?auto_4007966 ?auto_4007963 ?auto_4007968 ?auto_4007967 ?auto_4007969 ?auto_4007970 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4008021 - DIRECTION
      ?auto_4008022 - MODE
      ?auto_4008023 - DIRECTION
      ?auto_4008020 - MODE
      ?auto_4008025 - DIRECTION
      ?auto_4008024 - MODE
      ?auto_4008026 - DIRECTION
      ?auto_4008027 - MODE
    )
    :vars
    (
      ?auto_4008028 - INSTRUMENT
      ?auto_4008031 - SATELLITE
      ?auto_4008029 - DIRECTION
      ?auto_4008030 - DIRECTION
      ?auto_4008032 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4008023 ?auto_4008021 ) ) ( not ( = ?auto_4008025 ?auto_4008021 ) ) ( not ( = ?auto_4008025 ?auto_4008023 ) ) ( not ( = ?auto_4008026 ?auto_4008021 ) ) ( not ( = ?auto_4008026 ?auto_4008023 ) ) ( not ( = ?auto_4008026 ?auto_4008025 ) ) ( ON_BOARD ?auto_4008028 ?auto_4008031 ) ( SUPPORTS ?auto_4008028 ?auto_4008024 ) ( not ( = ?auto_4008025 ?auto_4008029 ) ) ( HAVE_IMAGE ?auto_4008026 ?auto_4008027 ) ( not ( = ?auto_4008026 ?auto_4008029 ) ) ( not ( = ?auto_4008027 ?auto_4008024 ) ) ( CALIBRATION_TARGET ?auto_4008028 ?auto_4008029 ) ( not ( = ?auto_4008029 ?auto_4008030 ) ) ( not ( = ?auto_4008025 ?auto_4008030 ) ) ( not ( = ?auto_4008026 ?auto_4008030 ) ) ( ON_BOARD ?auto_4008032 ?auto_4008031 ) ( POWER_ON ?auto_4008032 ) ( not ( = ?auto_4008028 ?auto_4008032 ) ) ( POINTING ?auto_4008031 ?auto_4008029 ) ( HAVE_IMAGE ?auto_4008021 ?auto_4008022 ) ( HAVE_IMAGE ?auto_4008023 ?auto_4008020 ) ( not ( = ?auto_4008021 ?auto_4008029 ) ) ( not ( = ?auto_4008021 ?auto_4008030 ) ) ( not ( = ?auto_4008022 ?auto_4008020 ) ) ( not ( = ?auto_4008022 ?auto_4008024 ) ) ( not ( = ?auto_4008022 ?auto_4008027 ) ) ( not ( = ?auto_4008023 ?auto_4008029 ) ) ( not ( = ?auto_4008023 ?auto_4008030 ) ) ( not ( = ?auto_4008020 ?auto_4008024 ) ) ( not ( = ?auto_4008020 ?auto_4008027 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4008026 ?auto_4008027 ?auto_4008025 ?auto_4008024 )
      ( GET-4IMAGE-VERIFY ?auto_4008021 ?auto_4008022 ?auto_4008023 ?auto_4008020 ?auto_4008025 ?auto_4008024 ?auto_4008026 ?auto_4008027 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4008241 - DIRECTION
      ?auto_4008242 - MODE
      ?auto_4008243 - DIRECTION
      ?auto_4008240 - MODE
      ?auto_4008245 - DIRECTION
      ?auto_4008244 - MODE
      ?auto_4008246 - DIRECTION
      ?auto_4008247 - MODE
    )
    :vars
    (
      ?auto_4008248 - INSTRUMENT
      ?auto_4008251 - SATELLITE
      ?auto_4008249 - DIRECTION
      ?auto_4008250 - DIRECTION
      ?auto_4008252 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4008243 ?auto_4008241 ) ) ( not ( = ?auto_4008245 ?auto_4008241 ) ) ( not ( = ?auto_4008245 ?auto_4008243 ) ) ( not ( = ?auto_4008246 ?auto_4008241 ) ) ( not ( = ?auto_4008246 ?auto_4008243 ) ) ( not ( = ?auto_4008246 ?auto_4008245 ) ) ( ON_BOARD ?auto_4008248 ?auto_4008251 ) ( SUPPORTS ?auto_4008248 ?auto_4008240 ) ( not ( = ?auto_4008243 ?auto_4008249 ) ) ( HAVE_IMAGE ?auto_4008245 ?auto_4008244 ) ( not ( = ?auto_4008245 ?auto_4008249 ) ) ( not ( = ?auto_4008244 ?auto_4008240 ) ) ( CALIBRATION_TARGET ?auto_4008248 ?auto_4008249 ) ( not ( = ?auto_4008249 ?auto_4008250 ) ) ( not ( = ?auto_4008243 ?auto_4008250 ) ) ( not ( = ?auto_4008245 ?auto_4008250 ) ) ( ON_BOARD ?auto_4008252 ?auto_4008251 ) ( POWER_ON ?auto_4008252 ) ( not ( = ?auto_4008248 ?auto_4008252 ) ) ( POINTING ?auto_4008251 ?auto_4008249 ) ( HAVE_IMAGE ?auto_4008241 ?auto_4008242 ) ( HAVE_IMAGE ?auto_4008246 ?auto_4008247 ) ( not ( = ?auto_4008241 ?auto_4008249 ) ) ( not ( = ?auto_4008241 ?auto_4008250 ) ) ( not ( = ?auto_4008242 ?auto_4008240 ) ) ( not ( = ?auto_4008242 ?auto_4008244 ) ) ( not ( = ?auto_4008242 ?auto_4008247 ) ) ( not ( = ?auto_4008240 ?auto_4008247 ) ) ( not ( = ?auto_4008244 ?auto_4008247 ) ) ( not ( = ?auto_4008246 ?auto_4008249 ) ) ( not ( = ?auto_4008246 ?auto_4008250 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4008245 ?auto_4008244 ?auto_4008243 ?auto_4008240 )
      ( GET-4IMAGE-VERIFY ?auto_4008241 ?auto_4008242 ?auto_4008243 ?auto_4008240 ?auto_4008245 ?auto_4008244 ?auto_4008246 ?auto_4008247 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4008351 - DIRECTION
      ?auto_4008352 - MODE
      ?auto_4008353 - DIRECTION
      ?auto_4008350 - MODE
      ?auto_4008355 - DIRECTION
      ?auto_4008354 - MODE
      ?auto_4008356 - DIRECTION
      ?auto_4008357 - MODE
    )
    :vars
    (
      ?auto_4008358 - INSTRUMENT
      ?auto_4008361 - SATELLITE
      ?auto_4008359 - DIRECTION
      ?auto_4008360 - DIRECTION
      ?auto_4008362 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4008353 ?auto_4008351 ) ) ( not ( = ?auto_4008355 ?auto_4008351 ) ) ( not ( = ?auto_4008355 ?auto_4008353 ) ) ( not ( = ?auto_4008356 ?auto_4008351 ) ) ( not ( = ?auto_4008356 ?auto_4008353 ) ) ( not ( = ?auto_4008356 ?auto_4008355 ) ) ( ON_BOARD ?auto_4008358 ?auto_4008361 ) ( SUPPORTS ?auto_4008358 ?auto_4008350 ) ( not ( = ?auto_4008353 ?auto_4008359 ) ) ( HAVE_IMAGE ?auto_4008356 ?auto_4008357 ) ( not ( = ?auto_4008356 ?auto_4008359 ) ) ( not ( = ?auto_4008357 ?auto_4008350 ) ) ( CALIBRATION_TARGET ?auto_4008358 ?auto_4008359 ) ( not ( = ?auto_4008359 ?auto_4008360 ) ) ( not ( = ?auto_4008353 ?auto_4008360 ) ) ( not ( = ?auto_4008356 ?auto_4008360 ) ) ( ON_BOARD ?auto_4008362 ?auto_4008361 ) ( POWER_ON ?auto_4008362 ) ( not ( = ?auto_4008358 ?auto_4008362 ) ) ( POINTING ?auto_4008361 ?auto_4008359 ) ( HAVE_IMAGE ?auto_4008351 ?auto_4008352 ) ( HAVE_IMAGE ?auto_4008355 ?auto_4008354 ) ( not ( = ?auto_4008351 ?auto_4008359 ) ) ( not ( = ?auto_4008351 ?auto_4008360 ) ) ( not ( = ?auto_4008352 ?auto_4008350 ) ) ( not ( = ?auto_4008352 ?auto_4008354 ) ) ( not ( = ?auto_4008352 ?auto_4008357 ) ) ( not ( = ?auto_4008350 ?auto_4008354 ) ) ( not ( = ?auto_4008355 ?auto_4008359 ) ) ( not ( = ?auto_4008355 ?auto_4008360 ) ) ( not ( = ?auto_4008354 ?auto_4008357 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4008356 ?auto_4008357 ?auto_4008353 ?auto_4008350 )
      ( GET-4IMAGE-VERIFY ?auto_4008351 ?auto_4008352 ?auto_4008353 ?auto_4008350 ?auto_4008355 ?auto_4008354 ?auto_4008356 ?auto_4008357 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4047640 - DIRECTION
      ?auto_4047641 - MODE
      ?auto_4047642 - DIRECTION
      ?auto_4047639 - MODE
      ?auto_4047644 - DIRECTION
      ?auto_4047643 - MODE
      ?auto_4047645 - DIRECTION
      ?auto_4047646 - MODE
    )
    :vars
    (
      ?auto_4047649 - INSTRUMENT
      ?auto_4047650 - SATELLITE
      ?auto_4047647 - DIRECTION
      ?auto_4047648 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4047642 ?auto_4047640 ) ) ( not ( = ?auto_4047644 ?auto_4047640 ) ) ( not ( = ?auto_4047644 ?auto_4047642 ) ) ( not ( = ?auto_4047645 ?auto_4047640 ) ) ( not ( = ?auto_4047645 ?auto_4047642 ) ) ( not ( = ?auto_4047645 ?auto_4047644 ) ) ( ON_BOARD ?auto_4047649 ?auto_4047650 ) ( SUPPORTS ?auto_4047649 ?auto_4047641 ) ( not ( = ?auto_4047640 ?auto_4047647 ) ) ( HAVE_IMAGE ?auto_4047642 ?auto_4047639 ) ( not ( = ?auto_4047642 ?auto_4047647 ) ) ( not ( = ?auto_4047639 ?auto_4047641 ) ) ( CALIBRATION_TARGET ?auto_4047649 ?auto_4047647 ) ( not ( = ?auto_4047647 ?auto_4047644 ) ) ( ON_BOARD ?auto_4047648 ?auto_4047650 ) ( POWER_ON ?auto_4047648 ) ( not ( = ?auto_4047649 ?auto_4047648 ) ) ( POINTING ?auto_4047650 ?auto_4047647 ) ( HAVE_IMAGE ?auto_4047644 ?auto_4047643 ) ( HAVE_IMAGE ?auto_4047645 ?auto_4047646 ) ( not ( = ?auto_4047641 ?auto_4047643 ) ) ( not ( = ?auto_4047641 ?auto_4047646 ) ) ( not ( = ?auto_4047639 ?auto_4047643 ) ) ( not ( = ?auto_4047639 ?auto_4047646 ) ) ( not ( = ?auto_4047643 ?auto_4047646 ) ) ( not ( = ?auto_4047645 ?auto_4047647 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4047642 ?auto_4047639 ?auto_4047640 ?auto_4047641 )
      ( GET-4IMAGE-VERIFY ?auto_4047640 ?auto_4047641 ?auto_4047642 ?auto_4047639 ?auto_4047644 ?auto_4047643 ?auto_4047645 ?auto_4047646 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4010554 - DIRECTION
      ?auto_4010555 - MODE
      ?auto_4010556 - DIRECTION
      ?auto_4010553 - MODE
      ?auto_4010558 - DIRECTION
      ?auto_4010557 - MODE
      ?auto_4010559 - DIRECTION
      ?auto_4010560 - MODE
    )
    :vars
    (
      ?auto_4010561 - INSTRUMENT
      ?auto_4010564 - SATELLITE
      ?auto_4010562 - DIRECTION
      ?auto_4010563 - DIRECTION
      ?auto_4010565 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4010556 ?auto_4010554 ) ) ( not ( = ?auto_4010558 ?auto_4010554 ) ) ( not ( = ?auto_4010558 ?auto_4010556 ) ) ( not ( = ?auto_4010559 ?auto_4010554 ) ) ( not ( = ?auto_4010559 ?auto_4010556 ) ) ( not ( = ?auto_4010559 ?auto_4010558 ) ) ( ON_BOARD ?auto_4010561 ?auto_4010564 ) ( SUPPORTS ?auto_4010561 ?auto_4010555 ) ( not ( = ?auto_4010554 ?auto_4010562 ) ) ( HAVE_IMAGE ?auto_4010558 ?auto_4010557 ) ( not ( = ?auto_4010558 ?auto_4010562 ) ) ( not ( = ?auto_4010557 ?auto_4010555 ) ) ( CALIBRATION_TARGET ?auto_4010561 ?auto_4010562 ) ( not ( = ?auto_4010562 ?auto_4010563 ) ) ( not ( = ?auto_4010554 ?auto_4010563 ) ) ( not ( = ?auto_4010558 ?auto_4010563 ) ) ( ON_BOARD ?auto_4010565 ?auto_4010564 ) ( POWER_ON ?auto_4010565 ) ( not ( = ?auto_4010561 ?auto_4010565 ) ) ( POINTING ?auto_4010564 ?auto_4010562 ) ( HAVE_IMAGE ?auto_4010556 ?auto_4010553 ) ( HAVE_IMAGE ?auto_4010559 ?auto_4010560 ) ( not ( = ?auto_4010555 ?auto_4010553 ) ) ( not ( = ?auto_4010555 ?auto_4010560 ) ) ( not ( = ?auto_4010556 ?auto_4010562 ) ) ( not ( = ?auto_4010556 ?auto_4010563 ) ) ( not ( = ?auto_4010553 ?auto_4010557 ) ) ( not ( = ?auto_4010553 ?auto_4010560 ) ) ( not ( = ?auto_4010557 ?auto_4010560 ) ) ( not ( = ?auto_4010559 ?auto_4010562 ) ) ( not ( = ?auto_4010559 ?auto_4010563 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4010558 ?auto_4010557 ?auto_4010554 ?auto_4010555 )
      ( GET-4IMAGE-VERIFY ?auto_4010554 ?auto_4010555 ?auto_4010556 ?auto_4010553 ?auto_4010558 ?auto_4010557 ?auto_4010559 ?auto_4010560 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4010664 - DIRECTION
      ?auto_4010665 - MODE
      ?auto_4010666 - DIRECTION
      ?auto_4010663 - MODE
      ?auto_4010668 - DIRECTION
      ?auto_4010667 - MODE
      ?auto_4010669 - DIRECTION
      ?auto_4010670 - MODE
    )
    :vars
    (
      ?auto_4010671 - INSTRUMENT
      ?auto_4010674 - SATELLITE
      ?auto_4010672 - DIRECTION
      ?auto_4010673 - DIRECTION
      ?auto_4010675 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_4010666 ?auto_4010664 ) ) ( not ( = ?auto_4010668 ?auto_4010664 ) ) ( not ( = ?auto_4010668 ?auto_4010666 ) ) ( not ( = ?auto_4010669 ?auto_4010664 ) ) ( not ( = ?auto_4010669 ?auto_4010666 ) ) ( not ( = ?auto_4010669 ?auto_4010668 ) ) ( ON_BOARD ?auto_4010671 ?auto_4010674 ) ( SUPPORTS ?auto_4010671 ?auto_4010665 ) ( not ( = ?auto_4010664 ?auto_4010672 ) ) ( HAVE_IMAGE ?auto_4010669 ?auto_4010670 ) ( not ( = ?auto_4010669 ?auto_4010672 ) ) ( not ( = ?auto_4010670 ?auto_4010665 ) ) ( CALIBRATION_TARGET ?auto_4010671 ?auto_4010672 ) ( not ( = ?auto_4010672 ?auto_4010673 ) ) ( not ( = ?auto_4010664 ?auto_4010673 ) ) ( not ( = ?auto_4010669 ?auto_4010673 ) ) ( ON_BOARD ?auto_4010675 ?auto_4010674 ) ( POWER_ON ?auto_4010675 ) ( not ( = ?auto_4010671 ?auto_4010675 ) ) ( POINTING ?auto_4010674 ?auto_4010672 ) ( HAVE_IMAGE ?auto_4010666 ?auto_4010663 ) ( HAVE_IMAGE ?auto_4010668 ?auto_4010667 ) ( not ( = ?auto_4010665 ?auto_4010663 ) ) ( not ( = ?auto_4010665 ?auto_4010667 ) ) ( not ( = ?auto_4010666 ?auto_4010672 ) ) ( not ( = ?auto_4010666 ?auto_4010673 ) ) ( not ( = ?auto_4010663 ?auto_4010667 ) ) ( not ( = ?auto_4010663 ?auto_4010670 ) ) ( not ( = ?auto_4010668 ?auto_4010672 ) ) ( not ( = ?auto_4010668 ?auto_4010673 ) ) ( not ( = ?auto_4010667 ?auto_4010670 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_4010669 ?auto_4010670 ?auto_4010664 ?auto_4010665 )
      ( GET-4IMAGE-VERIFY ?auto_4010664 ?auto_4010665 ?auto_4010666 ?auto_4010663 ?auto_4010668 ?auto_4010667 ?auto_4010669 ?auto_4010670 ) )
  )

)

