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
      ?auto_94440 - DIRECTION
      ?auto_94441 - MODE
    )
    :vars
    (
      ?auto_94442 - INSTRUMENT
      ?auto_94443 - SATELLITE
      ?auto_94444 - DIRECTION
      ?auto_94445 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_94442 ?auto_94443 ) ( SUPPORTS ?auto_94442 ?auto_94441 ) ( not ( = ?auto_94440 ?auto_94444 ) ) ( CALIBRATION_TARGET ?auto_94442 ?auto_94444 ) ( POWER_AVAIL ?auto_94443 ) ( POINTING ?auto_94443 ?auto_94445 ) ( not ( = ?auto_94444 ?auto_94445 ) ) ( not ( = ?auto_94440 ?auto_94445 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_94443 ?auto_94444 ?auto_94445 )
      ( !SWITCH_ON ?auto_94442 ?auto_94443 )
      ( !CALIBRATE ?auto_94443 ?auto_94442 ?auto_94444 )
      ( !TURN_TO ?auto_94443 ?auto_94440 ?auto_94444 )
      ( !TAKE_IMAGE ?auto_94443 ?auto_94440 ?auto_94442 ?auto_94441 )
      ( GET-1IMAGE-VERIFY ?auto_94440 ?auto_94441 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_94448 - DIRECTION
      ?auto_94449 - MODE
    )
    :vars
    (
      ?auto_94450 - INSTRUMENT
      ?auto_94451 - SATELLITE
      ?auto_94452 - DIRECTION
      ?auto_94453 - DIRECTION
      ?auto_94454 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_94450 ?auto_94451 ) ( SUPPORTS ?auto_94450 ?auto_94449 ) ( not ( = ?auto_94448 ?auto_94452 ) ) ( CALIBRATION_TARGET ?auto_94450 ?auto_94452 ) ( POINTING ?auto_94451 ?auto_94453 ) ( not ( = ?auto_94452 ?auto_94453 ) ) ( ON_BOARD ?auto_94454 ?auto_94451 ) ( POWER_ON ?auto_94454 ) ( not ( = ?auto_94448 ?auto_94453 ) ) ( not ( = ?auto_94450 ?auto_94454 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_94454 ?auto_94451 )
      ( !TURN_TO ?auto_94451 ?auto_94452 ?auto_94453 )
      ( !SWITCH_ON ?auto_94450 ?auto_94451 )
      ( !CALIBRATE ?auto_94451 ?auto_94450 ?auto_94452 )
      ( !TURN_TO ?auto_94451 ?auto_94448 ?auto_94452 )
      ( !TAKE_IMAGE ?auto_94451 ?auto_94448 ?auto_94450 ?auto_94449 )
      ( GET-1IMAGE-VERIFY ?auto_94448 ?auto_94449 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_94467 - DIRECTION
      ?auto_94468 - MODE
      ?auto_94470 - DIRECTION
      ?auto_94469 - MODE
    )
    :vars
    (
      ?auto_94471 - INSTRUMENT
      ?auto_94472 - SATELLITE
      ?auto_94474 - DIRECTION
      ?auto_94473 - INSTRUMENT
      ?auto_94475 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_94470 ?auto_94467 ) ) ( ON_BOARD ?auto_94471 ?auto_94472 ) ( SUPPORTS ?auto_94471 ?auto_94469 ) ( not ( = ?auto_94470 ?auto_94474 ) ) ( CALIBRATION_TARGET ?auto_94471 ?auto_94474 ) ( not ( = ?auto_94474 ?auto_94467 ) ) ( ON_BOARD ?auto_94473 ?auto_94472 ) ( not ( = ?auto_94471 ?auto_94473 ) ) ( SUPPORTS ?auto_94473 ?auto_94468 ) ( CALIBRATION_TARGET ?auto_94473 ?auto_94474 ) ( POWER_AVAIL ?auto_94472 ) ( POINTING ?auto_94472 ?auto_94475 ) ( not ( = ?auto_94474 ?auto_94475 ) ) ( not ( = ?auto_94467 ?auto_94475 ) ) ( not ( = ?auto_94468 ?auto_94469 ) ) ( not ( = ?auto_94470 ?auto_94475 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_94467 ?auto_94468 )
      ( GET-1IMAGE ?auto_94470 ?auto_94469 )
      ( GET-2IMAGE-VERIFY ?auto_94467 ?auto_94468 ?auto_94470 ?auto_94469 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_94628 - DIRECTION
      ?auto_94629 - MODE
      ?auto_94631 - DIRECTION
      ?auto_94630 - MODE
      ?auto_94632 - DIRECTION
      ?auto_94633 - MODE
    )
    :vars
    (
      ?auto_94637 - INSTRUMENT
      ?auto_94636 - SATELLITE
      ?auto_94634 - DIRECTION
      ?auto_94635 - INSTRUMENT
      ?auto_94638 - INSTRUMENT
      ?auto_94639 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_94631 ?auto_94628 ) ) ( not ( = ?auto_94632 ?auto_94628 ) ) ( not ( = ?auto_94632 ?auto_94631 ) ) ( ON_BOARD ?auto_94637 ?auto_94636 ) ( SUPPORTS ?auto_94637 ?auto_94633 ) ( not ( = ?auto_94632 ?auto_94634 ) ) ( CALIBRATION_TARGET ?auto_94637 ?auto_94634 ) ( not ( = ?auto_94634 ?auto_94631 ) ) ( ON_BOARD ?auto_94635 ?auto_94636 ) ( not ( = ?auto_94637 ?auto_94635 ) ) ( SUPPORTS ?auto_94635 ?auto_94630 ) ( CALIBRATION_TARGET ?auto_94635 ?auto_94634 ) ( not ( = ?auto_94634 ?auto_94628 ) ) ( ON_BOARD ?auto_94638 ?auto_94636 ) ( not ( = ?auto_94635 ?auto_94638 ) ) ( SUPPORTS ?auto_94638 ?auto_94629 ) ( CALIBRATION_TARGET ?auto_94638 ?auto_94634 ) ( POWER_AVAIL ?auto_94636 ) ( POINTING ?auto_94636 ?auto_94639 ) ( not ( = ?auto_94634 ?auto_94639 ) ) ( not ( = ?auto_94628 ?auto_94639 ) ) ( not ( = ?auto_94629 ?auto_94630 ) ) ( not ( = ?auto_94631 ?auto_94639 ) ) ( not ( = ?auto_94629 ?auto_94633 ) ) ( not ( = ?auto_94630 ?auto_94633 ) ) ( not ( = ?auto_94632 ?auto_94639 ) ) ( not ( = ?auto_94637 ?auto_94638 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_94628 ?auto_94629 ?auto_94631 ?auto_94630 )
      ( GET-1IMAGE ?auto_94632 ?auto_94633 )
      ( GET-3IMAGE-VERIFY ?auto_94628 ?auto_94629 ?auto_94631 ?auto_94630 ?auto_94632 ?auto_94633 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_96408 - DIRECTION
      ?auto_96409 - MODE
      ?auto_96411 - DIRECTION
      ?auto_96410 - MODE
      ?auto_96412 - DIRECTION
      ?auto_96413 - MODE
      ?auto_96414 - DIRECTION
      ?auto_96415 - MODE
    )
    :vars
    (
      ?auto_96417 - INSTRUMENT
      ?auto_96418 - SATELLITE
      ?auto_96419 - DIRECTION
      ?auto_96416 - INSTRUMENT
      ?auto_96422 - INSTRUMENT
      ?auto_96421 - INSTRUMENT
      ?auto_96420 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_96411 ?auto_96408 ) ) ( not ( = ?auto_96412 ?auto_96408 ) ) ( not ( = ?auto_96412 ?auto_96411 ) ) ( not ( = ?auto_96414 ?auto_96408 ) ) ( not ( = ?auto_96414 ?auto_96411 ) ) ( not ( = ?auto_96414 ?auto_96412 ) ) ( ON_BOARD ?auto_96417 ?auto_96418 ) ( SUPPORTS ?auto_96417 ?auto_96415 ) ( not ( = ?auto_96414 ?auto_96419 ) ) ( CALIBRATION_TARGET ?auto_96417 ?auto_96419 ) ( not ( = ?auto_96419 ?auto_96412 ) ) ( ON_BOARD ?auto_96416 ?auto_96418 ) ( not ( = ?auto_96417 ?auto_96416 ) ) ( SUPPORTS ?auto_96416 ?auto_96413 ) ( CALIBRATION_TARGET ?auto_96416 ?auto_96419 ) ( not ( = ?auto_96419 ?auto_96411 ) ) ( ON_BOARD ?auto_96422 ?auto_96418 ) ( not ( = ?auto_96416 ?auto_96422 ) ) ( SUPPORTS ?auto_96422 ?auto_96410 ) ( CALIBRATION_TARGET ?auto_96422 ?auto_96419 ) ( not ( = ?auto_96419 ?auto_96408 ) ) ( ON_BOARD ?auto_96421 ?auto_96418 ) ( not ( = ?auto_96422 ?auto_96421 ) ) ( SUPPORTS ?auto_96421 ?auto_96409 ) ( CALIBRATION_TARGET ?auto_96421 ?auto_96419 ) ( POWER_AVAIL ?auto_96418 ) ( POINTING ?auto_96418 ?auto_96420 ) ( not ( = ?auto_96419 ?auto_96420 ) ) ( not ( = ?auto_96408 ?auto_96420 ) ) ( not ( = ?auto_96409 ?auto_96410 ) ) ( not ( = ?auto_96411 ?auto_96420 ) ) ( not ( = ?auto_96409 ?auto_96413 ) ) ( not ( = ?auto_96410 ?auto_96413 ) ) ( not ( = ?auto_96412 ?auto_96420 ) ) ( not ( = ?auto_96416 ?auto_96421 ) ) ( not ( = ?auto_96409 ?auto_96415 ) ) ( not ( = ?auto_96410 ?auto_96415 ) ) ( not ( = ?auto_96413 ?auto_96415 ) ) ( not ( = ?auto_96414 ?auto_96420 ) ) ( not ( = ?auto_96417 ?auto_96422 ) ) ( not ( = ?auto_96417 ?auto_96421 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_96408 ?auto_96409 ?auto_96411 ?auto_96410 ?auto_96412 ?auto_96413 )
      ( GET-1IMAGE ?auto_96414 ?auto_96415 )
      ( GET-4IMAGE-VERIFY ?auto_96408 ?auto_96409 ?auto_96411 ?auto_96410 ?auto_96412 ?auto_96413 ?auto_96414 ?auto_96415 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_121882 - DIRECTION
      ?auto_121883 - MODE
      ?auto_121885 - DIRECTION
      ?auto_121884 - MODE
      ?auto_121886 - DIRECTION
      ?auto_121887 - MODE
      ?auto_121888 - DIRECTION
      ?auto_121889 - MODE
      ?auto_121891 - DIRECTION
      ?auto_121890 - MODE
    )
    :vars
    (
      ?auto_121892 - INSTRUMENT
      ?auto_121895 - SATELLITE
      ?auto_121893 - DIRECTION
      ?auto_121894 - INSTRUMENT
      ?auto_121899 - INSTRUMENT
      ?auto_121898 - INSTRUMENT
      ?auto_121897 - INSTRUMENT
      ?auto_121896 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_121885 ?auto_121882 ) ) ( not ( = ?auto_121886 ?auto_121882 ) ) ( not ( = ?auto_121886 ?auto_121885 ) ) ( not ( = ?auto_121888 ?auto_121882 ) ) ( not ( = ?auto_121888 ?auto_121885 ) ) ( not ( = ?auto_121888 ?auto_121886 ) ) ( not ( = ?auto_121891 ?auto_121882 ) ) ( not ( = ?auto_121891 ?auto_121885 ) ) ( not ( = ?auto_121891 ?auto_121886 ) ) ( not ( = ?auto_121891 ?auto_121888 ) ) ( ON_BOARD ?auto_121892 ?auto_121895 ) ( SUPPORTS ?auto_121892 ?auto_121890 ) ( not ( = ?auto_121891 ?auto_121893 ) ) ( CALIBRATION_TARGET ?auto_121892 ?auto_121893 ) ( not ( = ?auto_121893 ?auto_121888 ) ) ( ON_BOARD ?auto_121894 ?auto_121895 ) ( not ( = ?auto_121892 ?auto_121894 ) ) ( SUPPORTS ?auto_121894 ?auto_121889 ) ( CALIBRATION_TARGET ?auto_121894 ?auto_121893 ) ( not ( = ?auto_121893 ?auto_121886 ) ) ( ON_BOARD ?auto_121899 ?auto_121895 ) ( not ( = ?auto_121894 ?auto_121899 ) ) ( SUPPORTS ?auto_121899 ?auto_121887 ) ( CALIBRATION_TARGET ?auto_121899 ?auto_121893 ) ( not ( = ?auto_121893 ?auto_121885 ) ) ( ON_BOARD ?auto_121898 ?auto_121895 ) ( not ( = ?auto_121899 ?auto_121898 ) ) ( SUPPORTS ?auto_121898 ?auto_121884 ) ( CALIBRATION_TARGET ?auto_121898 ?auto_121893 ) ( not ( = ?auto_121893 ?auto_121882 ) ) ( ON_BOARD ?auto_121897 ?auto_121895 ) ( not ( = ?auto_121898 ?auto_121897 ) ) ( SUPPORTS ?auto_121897 ?auto_121883 ) ( CALIBRATION_TARGET ?auto_121897 ?auto_121893 ) ( POWER_AVAIL ?auto_121895 ) ( POINTING ?auto_121895 ?auto_121896 ) ( not ( = ?auto_121893 ?auto_121896 ) ) ( not ( = ?auto_121882 ?auto_121896 ) ) ( not ( = ?auto_121883 ?auto_121884 ) ) ( not ( = ?auto_121885 ?auto_121896 ) ) ( not ( = ?auto_121883 ?auto_121887 ) ) ( not ( = ?auto_121884 ?auto_121887 ) ) ( not ( = ?auto_121886 ?auto_121896 ) ) ( not ( = ?auto_121899 ?auto_121897 ) ) ( not ( = ?auto_121883 ?auto_121889 ) ) ( not ( = ?auto_121884 ?auto_121889 ) ) ( not ( = ?auto_121887 ?auto_121889 ) ) ( not ( = ?auto_121888 ?auto_121896 ) ) ( not ( = ?auto_121894 ?auto_121898 ) ) ( not ( = ?auto_121894 ?auto_121897 ) ) ( not ( = ?auto_121883 ?auto_121890 ) ) ( not ( = ?auto_121884 ?auto_121890 ) ) ( not ( = ?auto_121887 ?auto_121890 ) ) ( not ( = ?auto_121889 ?auto_121890 ) ) ( not ( = ?auto_121891 ?auto_121896 ) ) ( not ( = ?auto_121892 ?auto_121899 ) ) ( not ( = ?auto_121892 ?auto_121898 ) ) ( not ( = ?auto_121892 ?auto_121897 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_121882 ?auto_121883 ?auto_121885 ?auto_121884 ?auto_121886 ?auto_121887 ?auto_121888 ?auto_121889 )
      ( GET-1IMAGE ?auto_121891 ?auto_121890 )
      ( GET-5IMAGE-VERIFY ?auto_121882 ?auto_121883 ?auto_121885 ?auto_121884 ?auto_121886 ?auto_121887 ?auto_121888 ?auto_121889 ?auto_121891 ?auto_121890 ) )
  )

)

