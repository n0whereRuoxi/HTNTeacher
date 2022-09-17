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
      ?auto_11647 - DIRECTION
      ?auto_11648 - MODE
    )
    :vars
    (
      ?auto_11649 - INSTRUMENT
      ?auto_11650 - SATELLITE
      ?auto_11651 - DIRECTION
      ?auto_11652 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_11649 ?auto_11650 ) ( SUPPORTS ?auto_11649 ?auto_11648 ) ( not ( = ?auto_11647 ?auto_11651 ) ) ( CALIBRATION_TARGET ?auto_11649 ?auto_11651 ) ( POWER_AVAIL ?auto_11650 ) ( POINTING ?auto_11650 ?auto_11652 ) ( not ( = ?auto_11651 ?auto_11652 ) ) ( not ( = ?auto_11647 ?auto_11652 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_11650 ?auto_11651 ?auto_11652 )
      ( !SWITCH_ON ?auto_11649 ?auto_11650 )
      ( !CALIBRATE ?auto_11650 ?auto_11649 ?auto_11651 )
      ( !TURN_TO ?auto_11650 ?auto_11647 ?auto_11651 )
      ( !TAKE_IMAGE ?auto_11650 ?auto_11647 ?auto_11649 ?auto_11648 )
      ( GET-1IMAGE-VERIFY ?auto_11647 ?auto_11648 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_11655 - DIRECTION
      ?auto_11656 - MODE
    )
    :vars
    (
      ?auto_11657 - INSTRUMENT
      ?auto_11658 - SATELLITE
      ?auto_11659 - DIRECTION
      ?auto_11660 - DIRECTION
      ?auto_11661 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11657 ?auto_11658 ) ( SUPPORTS ?auto_11657 ?auto_11656 ) ( not ( = ?auto_11655 ?auto_11659 ) ) ( CALIBRATION_TARGET ?auto_11657 ?auto_11659 ) ( POINTING ?auto_11658 ?auto_11660 ) ( not ( = ?auto_11659 ?auto_11660 ) ) ( ON_BOARD ?auto_11661 ?auto_11658 ) ( POWER_ON ?auto_11661 ) ( not ( = ?auto_11655 ?auto_11660 ) ) ( not ( = ?auto_11657 ?auto_11661 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_11661 ?auto_11658 )
      ( !TURN_TO ?auto_11658 ?auto_11659 ?auto_11660 )
      ( !SWITCH_ON ?auto_11657 ?auto_11658 )
      ( !CALIBRATE ?auto_11658 ?auto_11657 ?auto_11659 )
      ( !TURN_TO ?auto_11658 ?auto_11655 ?auto_11659 )
      ( !TAKE_IMAGE ?auto_11658 ?auto_11655 ?auto_11657 ?auto_11656 )
      ( GET-1IMAGE-VERIFY ?auto_11655 ?auto_11656 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_11674 - DIRECTION
      ?auto_11675 - MODE
      ?auto_11677 - DIRECTION
      ?auto_11676 - MODE
    )
    :vars
    (
      ?auto_11679 - INSTRUMENT
      ?auto_11678 - SATELLITE
      ?auto_11680 - DIRECTION
      ?auto_11681 - INSTRUMENT
      ?auto_11682 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_11679 ?auto_11678 ) ( SUPPORTS ?auto_11679 ?auto_11676 ) ( not ( = ?auto_11677 ?auto_11680 ) ) ( CALIBRATION_TARGET ?auto_11679 ?auto_11680 ) ( not ( = ?auto_11680 ?auto_11674 ) ) ( ON_BOARD ?auto_11681 ?auto_11678 ) ( not ( = ?auto_11677 ?auto_11674 ) ) ( not ( = ?auto_11679 ?auto_11681 ) ) ( SUPPORTS ?auto_11681 ?auto_11675 ) ( CALIBRATION_TARGET ?auto_11681 ?auto_11680 ) ( POWER_AVAIL ?auto_11678 ) ( POINTING ?auto_11678 ?auto_11682 ) ( not ( = ?auto_11680 ?auto_11682 ) ) ( not ( = ?auto_11674 ?auto_11682 ) ) ( not ( = ?auto_11675 ?auto_11676 ) ) ( not ( = ?auto_11677 ?auto_11682 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_11674 ?auto_11675 )
      ( GET-1IMAGE ?auto_11677 ?auto_11676 )
      ( GET-2IMAGE-VERIFY ?auto_11674 ?auto_11675 ?auto_11677 ?auto_11676 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11835 - DIRECTION
      ?auto_11836 - MODE
      ?auto_11838 - DIRECTION
      ?auto_11837 - MODE
      ?auto_11839 - DIRECTION
      ?auto_11840 - MODE
    )
    :vars
    (
      ?auto_11842 - INSTRUMENT
      ?auto_11844 - SATELLITE
      ?auto_11841 - DIRECTION
      ?auto_11843 - INSTRUMENT
      ?auto_11846 - INSTRUMENT
      ?auto_11845 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_11842 ?auto_11844 ) ( SUPPORTS ?auto_11842 ?auto_11840 ) ( not ( = ?auto_11839 ?auto_11841 ) ) ( CALIBRATION_TARGET ?auto_11842 ?auto_11841 ) ( not ( = ?auto_11841 ?auto_11838 ) ) ( ON_BOARD ?auto_11843 ?auto_11844 ) ( not ( = ?auto_11839 ?auto_11838 ) ) ( not ( = ?auto_11842 ?auto_11843 ) ) ( SUPPORTS ?auto_11843 ?auto_11837 ) ( CALIBRATION_TARGET ?auto_11843 ?auto_11841 ) ( not ( = ?auto_11841 ?auto_11835 ) ) ( ON_BOARD ?auto_11846 ?auto_11844 ) ( not ( = ?auto_11838 ?auto_11835 ) ) ( not ( = ?auto_11843 ?auto_11846 ) ) ( SUPPORTS ?auto_11846 ?auto_11836 ) ( CALIBRATION_TARGET ?auto_11846 ?auto_11841 ) ( POWER_AVAIL ?auto_11844 ) ( POINTING ?auto_11844 ?auto_11845 ) ( not ( = ?auto_11841 ?auto_11845 ) ) ( not ( = ?auto_11835 ?auto_11845 ) ) ( not ( = ?auto_11836 ?auto_11837 ) ) ( not ( = ?auto_11838 ?auto_11845 ) ) ( not ( = ?auto_11835 ?auto_11839 ) ) ( not ( = ?auto_11836 ?auto_11840 ) ) ( not ( = ?auto_11837 ?auto_11840 ) ) ( not ( = ?auto_11839 ?auto_11845 ) ) ( not ( = ?auto_11842 ?auto_11846 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11835 ?auto_11836 ?auto_11838 ?auto_11837 )
      ( GET-1IMAGE ?auto_11839 ?auto_11840 )
      ( GET-3IMAGE-VERIFY ?auto_11835 ?auto_11836 ?auto_11838 ?auto_11837 ?auto_11839 ?auto_11840 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_13615 - DIRECTION
      ?auto_13616 - MODE
      ?auto_13618 - DIRECTION
      ?auto_13617 - MODE
      ?auto_13619 - DIRECTION
      ?auto_13620 - MODE
      ?auto_13621 - DIRECTION
      ?auto_13622 - MODE
    )
    :vars
    (
      ?auto_13624 - INSTRUMENT
      ?auto_13626 - SATELLITE
      ?auto_13623 - DIRECTION
      ?auto_13625 - INSTRUMENT
      ?auto_13629 - INSTRUMENT
      ?auto_13628 - INSTRUMENT
      ?auto_13627 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_13624 ?auto_13626 ) ( SUPPORTS ?auto_13624 ?auto_13622 ) ( not ( = ?auto_13621 ?auto_13623 ) ) ( CALIBRATION_TARGET ?auto_13624 ?auto_13623 ) ( not ( = ?auto_13623 ?auto_13619 ) ) ( ON_BOARD ?auto_13625 ?auto_13626 ) ( not ( = ?auto_13621 ?auto_13619 ) ) ( not ( = ?auto_13624 ?auto_13625 ) ) ( SUPPORTS ?auto_13625 ?auto_13620 ) ( CALIBRATION_TARGET ?auto_13625 ?auto_13623 ) ( not ( = ?auto_13623 ?auto_13618 ) ) ( ON_BOARD ?auto_13629 ?auto_13626 ) ( not ( = ?auto_13619 ?auto_13618 ) ) ( not ( = ?auto_13625 ?auto_13629 ) ) ( SUPPORTS ?auto_13629 ?auto_13617 ) ( CALIBRATION_TARGET ?auto_13629 ?auto_13623 ) ( not ( = ?auto_13623 ?auto_13615 ) ) ( ON_BOARD ?auto_13628 ?auto_13626 ) ( not ( = ?auto_13618 ?auto_13615 ) ) ( not ( = ?auto_13629 ?auto_13628 ) ) ( SUPPORTS ?auto_13628 ?auto_13616 ) ( CALIBRATION_TARGET ?auto_13628 ?auto_13623 ) ( POWER_AVAIL ?auto_13626 ) ( POINTING ?auto_13626 ?auto_13627 ) ( not ( = ?auto_13623 ?auto_13627 ) ) ( not ( = ?auto_13615 ?auto_13627 ) ) ( not ( = ?auto_13616 ?auto_13617 ) ) ( not ( = ?auto_13618 ?auto_13627 ) ) ( not ( = ?auto_13615 ?auto_13619 ) ) ( not ( = ?auto_13616 ?auto_13620 ) ) ( not ( = ?auto_13617 ?auto_13620 ) ) ( not ( = ?auto_13619 ?auto_13627 ) ) ( not ( = ?auto_13625 ?auto_13628 ) ) ( not ( = ?auto_13615 ?auto_13621 ) ) ( not ( = ?auto_13616 ?auto_13622 ) ) ( not ( = ?auto_13618 ?auto_13621 ) ) ( not ( = ?auto_13617 ?auto_13622 ) ) ( not ( = ?auto_13620 ?auto_13622 ) ) ( not ( = ?auto_13621 ?auto_13627 ) ) ( not ( = ?auto_13624 ?auto_13629 ) ) ( not ( = ?auto_13624 ?auto_13628 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_13615 ?auto_13616 ?auto_13618 ?auto_13617 ?auto_13619 ?auto_13620 )
      ( GET-1IMAGE ?auto_13621 ?auto_13622 )
      ( GET-4IMAGE-VERIFY ?auto_13615 ?auto_13616 ?auto_13618 ?auto_13617 ?auto_13619 ?auto_13620 ?auto_13621 ?auto_13622 ) )
  )

)

