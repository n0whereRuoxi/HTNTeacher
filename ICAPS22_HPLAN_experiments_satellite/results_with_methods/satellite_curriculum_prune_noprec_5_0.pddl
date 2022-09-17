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
      ?auto_25642 - DIRECTION
      ?auto_25643 - MODE
    )
    :vars
    (
      ?auto_25644 - INSTRUMENT
      ?auto_25645 - SATELLITE
      ?auto_25646 - DIRECTION
      ?auto_25647 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25644 ?auto_25645 ) ( SUPPORTS ?auto_25644 ?auto_25643 ) ( not ( = ?auto_25642 ?auto_25646 ) ) ( CALIBRATION_TARGET ?auto_25644 ?auto_25646 ) ( POWER_AVAIL ?auto_25645 ) ( POINTING ?auto_25645 ?auto_25647 ) ( not ( = ?auto_25646 ?auto_25647 ) ) ( not ( = ?auto_25642 ?auto_25647 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_25645 ?auto_25646 ?auto_25647 )
      ( !SWITCH_ON ?auto_25644 ?auto_25645 )
      ( !CALIBRATE ?auto_25645 ?auto_25644 ?auto_25646 )
      ( !TURN_TO ?auto_25645 ?auto_25642 ?auto_25646 )
      ( !TAKE_IMAGE ?auto_25645 ?auto_25642 ?auto_25644 ?auto_25643 )
      ( GET-1IMAGE-VERIFY ?auto_25642 ?auto_25643 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_25650 - DIRECTION
      ?auto_25651 - MODE
    )
    :vars
    (
      ?auto_25652 - INSTRUMENT
      ?auto_25653 - SATELLITE
      ?auto_25654 - DIRECTION
      ?auto_25655 - DIRECTION
      ?auto_25656 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25652 ?auto_25653 ) ( SUPPORTS ?auto_25652 ?auto_25651 ) ( not ( = ?auto_25650 ?auto_25654 ) ) ( CALIBRATION_TARGET ?auto_25652 ?auto_25654 ) ( POINTING ?auto_25653 ?auto_25655 ) ( not ( = ?auto_25654 ?auto_25655 ) ) ( ON_BOARD ?auto_25656 ?auto_25653 ) ( POWER_ON ?auto_25656 ) ( not ( = ?auto_25650 ?auto_25655 ) ) ( not ( = ?auto_25652 ?auto_25656 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_25656 ?auto_25653 )
      ( !TURN_TO ?auto_25653 ?auto_25654 ?auto_25655 )
      ( !SWITCH_ON ?auto_25652 ?auto_25653 )
      ( !CALIBRATE ?auto_25653 ?auto_25652 ?auto_25654 )
      ( !TURN_TO ?auto_25653 ?auto_25650 ?auto_25654 )
      ( !TAKE_IMAGE ?auto_25653 ?auto_25650 ?auto_25652 ?auto_25651 )
      ( GET-1IMAGE-VERIFY ?auto_25650 ?auto_25651 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25669 - DIRECTION
      ?auto_25670 - MODE
      ?auto_25672 - DIRECTION
      ?auto_25671 - MODE
    )
    :vars
    (
      ?auto_25676 - INSTRUMENT
      ?auto_25675 - SATELLITE
      ?auto_25674 - DIRECTION
      ?auto_25673 - INSTRUMENT
      ?auto_25677 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25676 ?auto_25675 ) ( SUPPORTS ?auto_25676 ?auto_25671 ) ( not ( = ?auto_25672 ?auto_25674 ) ) ( CALIBRATION_TARGET ?auto_25676 ?auto_25674 ) ( not ( = ?auto_25674 ?auto_25669 ) ) ( ON_BOARD ?auto_25673 ?auto_25675 ) ( not ( = ?auto_25672 ?auto_25669 ) ) ( not ( = ?auto_25676 ?auto_25673 ) ) ( SUPPORTS ?auto_25673 ?auto_25670 ) ( CALIBRATION_TARGET ?auto_25673 ?auto_25674 ) ( POWER_AVAIL ?auto_25675 ) ( POINTING ?auto_25675 ?auto_25677 ) ( not ( = ?auto_25674 ?auto_25677 ) ) ( not ( = ?auto_25669 ?auto_25677 ) ) ( not ( = ?auto_25670 ?auto_25671 ) ) ( not ( = ?auto_25672 ?auto_25677 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_25669 ?auto_25670 )
      ( GET-1IMAGE ?auto_25672 ?auto_25671 )
      ( GET-2IMAGE-VERIFY ?auto_25669 ?auto_25670 ?auto_25672 ?auto_25671 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25830 - DIRECTION
      ?auto_25831 - MODE
      ?auto_25833 - DIRECTION
      ?auto_25832 - MODE
      ?auto_25834 - DIRECTION
      ?auto_25835 - MODE
    )
    :vars
    (
      ?auto_25838 - INSTRUMENT
      ?auto_25836 - SATELLITE
      ?auto_25837 - DIRECTION
      ?auto_25839 - INSTRUMENT
      ?auto_25841 - INSTRUMENT
      ?auto_25840 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25838 ?auto_25836 ) ( SUPPORTS ?auto_25838 ?auto_25835 ) ( not ( = ?auto_25834 ?auto_25837 ) ) ( CALIBRATION_TARGET ?auto_25838 ?auto_25837 ) ( not ( = ?auto_25837 ?auto_25833 ) ) ( ON_BOARD ?auto_25839 ?auto_25836 ) ( not ( = ?auto_25834 ?auto_25833 ) ) ( not ( = ?auto_25838 ?auto_25839 ) ) ( SUPPORTS ?auto_25839 ?auto_25832 ) ( CALIBRATION_TARGET ?auto_25839 ?auto_25837 ) ( not ( = ?auto_25837 ?auto_25830 ) ) ( ON_BOARD ?auto_25841 ?auto_25836 ) ( not ( = ?auto_25833 ?auto_25830 ) ) ( not ( = ?auto_25839 ?auto_25841 ) ) ( SUPPORTS ?auto_25841 ?auto_25831 ) ( CALIBRATION_TARGET ?auto_25841 ?auto_25837 ) ( POWER_AVAIL ?auto_25836 ) ( POINTING ?auto_25836 ?auto_25840 ) ( not ( = ?auto_25837 ?auto_25840 ) ) ( not ( = ?auto_25830 ?auto_25840 ) ) ( not ( = ?auto_25831 ?auto_25832 ) ) ( not ( = ?auto_25833 ?auto_25840 ) ) ( not ( = ?auto_25830 ?auto_25834 ) ) ( not ( = ?auto_25831 ?auto_25835 ) ) ( not ( = ?auto_25832 ?auto_25835 ) ) ( not ( = ?auto_25834 ?auto_25840 ) ) ( not ( = ?auto_25838 ?auto_25841 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25830 ?auto_25831 ?auto_25833 ?auto_25832 )
      ( GET-1IMAGE ?auto_25834 ?auto_25835 )
      ( GET-3IMAGE-VERIFY ?auto_25830 ?auto_25831 ?auto_25833 ?auto_25832 ?auto_25834 ?auto_25835 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_27610 - DIRECTION
      ?auto_27611 - MODE
      ?auto_27613 - DIRECTION
      ?auto_27612 - MODE
      ?auto_27614 - DIRECTION
      ?auto_27615 - MODE
      ?auto_27616 - DIRECTION
      ?auto_27617 - MODE
    )
    :vars
    (
      ?auto_27621 - INSTRUMENT
      ?auto_27620 - SATELLITE
      ?auto_27618 - DIRECTION
      ?auto_27619 - INSTRUMENT
      ?auto_27623 - INSTRUMENT
      ?auto_27622 - INSTRUMENT
      ?auto_27624 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_27621 ?auto_27620 ) ( SUPPORTS ?auto_27621 ?auto_27617 ) ( not ( = ?auto_27616 ?auto_27618 ) ) ( CALIBRATION_TARGET ?auto_27621 ?auto_27618 ) ( not ( = ?auto_27618 ?auto_27614 ) ) ( ON_BOARD ?auto_27619 ?auto_27620 ) ( not ( = ?auto_27616 ?auto_27614 ) ) ( not ( = ?auto_27621 ?auto_27619 ) ) ( SUPPORTS ?auto_27619 ?auto_27615 ) ( CALIBRATION_TARGET ?auto_27619 ?auto_27618 ) ( not ( = ?auto_27618 ?auto_27613 ) ) ( ON_BOARD ?auto_27623 ?auto_27620 ) ( not ( = ?auto_27614 ?auto_27613 ) ) ( not ( = ?auto_27619 ?auto_27623 ) ) ( SUPPORTS ?auto_27623 ?auto_27612 ) ( CALIBRATION_TARGET ?auto_27623 ?auto_27618 ) ( not ( = ?auto_27618 ?auto_27610 ) ) ( ON_BOARD ?auto_27622 ?auto_27620 ) ( not ( = ?auto_27613 ?auto_27610 ) ) ( not ( = ?auto_27623 ?auto_27622 ) ) ( SUPPORTS ?auto_27622 ?auto_27611 ) ( CALIBRATION_TARGET ?auto_27622 ?auto_27618 ) ( POWER_AVAIL ?auto_27620 ) ( POINTING ?auto_27620 ?auto_27624 ) ( not ( = ?auto_27618 ?auto_27624 ) ) ( not ( = ?auto_27610 ?auto_27624 ) ) ( not ( = ?auto_27611 ?auto_27612 ) ) ( not ( = ?auto_27613 ?auto_27624 ) ) ( not ( = ?auto_27610 ?auto_27614 ) ) ( not ( = ?auto_27611 ?auto_27615 ) ) ( not ( = ?auto_27612 ?auto_27615 ) ) ( not ( = ?auto_27614 ?auto_27624 ) ) ( not ( = ?auto_27619 ?auto_27622 ) ) ( not ( = ?auto_27610 ?auto_27616 ) ) ( not ( = ?auto_27611 ?auto_27617 ) ) ( not ( = ?auto_27613 ?auto_27616 ) ) ( not ( = ?auto_27612 ?auto_27617 ) ) ( not ( = ?auto_27615 ?auto_27617 ) ) ( not ( = ?auto_27616 ?auto_27624 ) ) ( not ( = ?auto_27621 ?auto_27623 ) ) ( not ( = ?auto_27621 ?auto_27622 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_27610 ?auto_27611 ?auto_27613 ?auto_27612 ?auto_27614 ?auto_27615 )
      ( GET-1IMAGE ?auto_27616 ?auto_27617 )
      ( GET-4IMAGE-VERIFY ?auto_27610 ?auto_27611 ?auto_27613 ?auto_27612 ?auto_27614 ?auto_27615 ?auto_27616 ?auto_27617 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_53084 - DIRECTION
      ?auto_53085 - MODE
      ?auto_53087 - DIRECTION
      ?auto_53086 - MODE
      ?auto_53088 - DIRECTION
      ?auto_53089 - MODE
      ?auto_53090 - DIRECTION
      ?auto_53091 - MODE
      ?auto_53092 - DIRECTION
      ?auto_53093 - MODE
    )
    :vars
    (
      ?auto_53096 - INSTRUMENT
      ?auto_53097 - SATELLITE
      ?auto_53095 - DIRECTION
      ?auto_53094 - INSTRUMENT
      ?auto_53099 - INSTRUMENT
      ?auto_53100 - INSTRUMENT
      ?auto_53101 - INSTRUMENT
      ?auto_53098 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_53096 ?auto_53097 ) ( SUPPORTS ?auto_53096 ?auto_53093 ) ( not ( = ?auto_53092 ?auto_53095 ) ) ( CALIBRATION_TARGET ?auto_53096 ?auto_53095 ) ( not ( = ?auto_53095 ?auto_53090 ) ) ( ON_BOARD ?auto_53094 ?auto_53097 ) ( not ( = ?auto_53092 ?auto_53090 ) ) ( not ( = ?auto_53096 ?auto_53094 ) ) ( SUPPORTS ?auto_53094 ?auto_53091 ) ( CALIBRATION_TARGET ?auto_53094 ?auto_53095 ) ( not ( = ?auto_53095 ?auto_53088 ) ) ( ON_BOARD ?auto_53099 ?auto_53097 ) ( not ( = ?auto_53090 ?auto_53088 ) ) ( not ( = ?auto_53094 ?auto_53099 ) ) ( SUPPORTS ?auto_53099 ?auto_53089 ) ( CALIBRATION_TARGET ?auto_53099 ?auto_53095 ) ( not ( = ?auto_53095 ?auto_53087 ) ) ( ON_BOARD ?auto_53100 ?auto_53097 ) ( not ( = ?auto_53088 ?auto_53087 ) ) ( not ( = ?auto_53099 ?auto_53100 ) ) ( SUPPORTS ?auto_53100 ?auto_53086 ) ( CALIBRATION_TARGET ?auto_53100 ?auto_53095 ) ( not ( = ?auto_53095 ?auto_53084 ) ) ( ON_BOARD ?auto_53101 ?auto_53097 ) ( not ( = ?auto_53087 ?auto_53084 ) ) ( not ( = ?auto_53100 ?auto_53101 ) ) ( SUPPORTS ?auto_53101 ?auto_53085 ) ( CALIBRATION_TARGET ?auto_53101 ?auto_53095 ) ( POWER_AVAIL ?auto_53097 ) ( POINTING ?auto_53097 ?auto_53098 ) ( not ( = ?auto_53095 ?auto_53098 ) ) ( not ( = ?auto_53084 ?auto_53098 ) ) ( not ( = ?auto_53085 ?auto_53086 ) ) ( not ( = ?auto_53087 ?auto_53098 ) ) ( not ( = ?auto_53084 ?auto_53088 ) ) ( not ( = ?auto_53085 ?auto_53089 ) ) ( not ( = ?auto_53086 ?auto_53089 ) ) ( not ( = ?auto_53088 ?auto_53098 ) ) ( not ( = ?auto_53099 ?auto_53101 ) ) ( not ( = ?auto_53084 ?auto_53090 ) ) ( not ( = ?auto_53085 ?auto_53091 ) ) ( not ( = ?auto_53087 ?auto_53090 ) ) ( not ( = ?auto_53086 ?auto_53091 ) ) ( not ( = ?auto_53089 ?auto_53091 ) ) ( not ( = ?auto_53090 ?auto_53098 ) ) ( not ( = ?auto_53094 ?auto_53100 ) ) ( not ( = ?auto_53094 ?auto_53101 ) ) ( not ( = ?auto_53084 ?auto_53092 ) ) ( not ( = ?auto_53085 ?auto_53093 ) ) ( not ( = ?auto_53087 ?auto_53092 ) ) ( not ( = ?auto_53086 ?auto_53093 ) ) ( not ( = ?auto_53088 ?auto_53092 ) ) ( not ( = ?auto_53089 ?auto_53093 ) ) ( not ( = ?auto_53091 ?auto_53093 ) ) ( not ( = ?auto_53092 ?auto_53098 ) ) ( not ( = ?auto_53096 ?auto_53099 ) ) ( not ( = ?auto_53096 ?auto_53100 ) ) ( not ( = ?auto_53096 ?auto_53101 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_53084 ?auto_53085 ?auto_53087 ?auto_53086 ?auto_53088 ?auto_53089 ?auto_53090 ?auto_53091 )
      ( GET-1IMAGE ?auto_53092 ?auto_53093 )
      ( GET-5IMAGE-VERIFY ?auto_53084 ?auto_53085 ?auto_53087 ?auto_53086 ?auto_53088 ?auto_53089 ?auto_53090 ?auto_53091 ?auto_53092 ?auto_53093 ) )
  )

)

