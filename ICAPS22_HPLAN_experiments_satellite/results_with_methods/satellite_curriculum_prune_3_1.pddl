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
      ?auto_709 - DIRECTION
      ?auto_710 - MODE
    )
    :vars
    (
      ?auto_711 - INSTRUMENT
      ?auto_712 - SATELLITE
      ?auto_713 - DIRECTION
      ?auto_714 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_711 ?auto_712 ) ( SUPPORTS ?auto_711 ?auto_710 ) ( not ( = ?auto_709 ?auto_713 ) ) ( CALIBRATION_TARGET ?auto_711 ?auto_713 ) ( POWER_AVAIL ?auto_712 ) ( POINTING ?auto_712 ?auto_714 ) ( not ( = ?auto_713 ?auto_714 ) ) ( not ( = ?auto_709 ?auto_714 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_712 ?auto_713 ?auto_714 )
      ( !SWITCH_ON ?auto_711 ?auto_712 )
      ( !CALIBRATE ?auto_712 ?auto_711 ?auto_713 )
      ( !TURN_TO ?auto_712 ?auto_709 ?auto_713 )
      ( !TAKE_IMAGE ?auto_712 ?auto_709 ?auto_711 ?auto_710 )
      ( GET-1IMAGE-VERIFY ?auto_709 ?auto_710 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_717 - DIRECTION
      ?auto_718 - MODE
    )
    :vars
    (
      ?auto_719 - INSTRUMENT
      ?auto_720 - SATELLITE
      ?auto_721 - DIRECTION
      ?auto_722 - DIRECTION
      ?auto_723 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_719 ?auto_720 ) ( SUPPORTS ?auto_719 ?auto_718 ) ( not ( = ?auto_717 ?auto_721 ) ) ( CALIBRATION_TARGET ?auto_719 ?auto_721 ) ( POINTING ?auto_720 ?auto_722 ) ( not ( = ?auto_721 ?auto_722 ) ) ( ON_BOARD ?auto_723 ?auto_720 ) ( POWER_ON ?auto_723 ) ( not ( = ?auto_717 ?auto_722 ) ) ( not ( = ?auto_719 ?auto_723 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_723 ?auto_720 )
      ( !TURN_TO ?auto_720 ?auto_721 ?auto_722 )
      ( !SWITCH_ON ?auto_719 ?auto_720 )
      ( !CALIBRATE ?auto_720 ?auto_719 ?auto_721 )
      ( !TURN_TO ?auto_720 ?auto_717 ?auto_721 )
      ( !TAKE_IMAGE ?auto_720 ?auto_717 ?auto_719 ?auto_718 )
      ( GET-1IMAGE-VERIFY ?auto_717 ?auto_718 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_736 - DIRECTION
      ?auto_737 - MODE
      ?auto_739 - DIRECTION
      ?auto_738 - MODE
    )
    :vars
    (
      ?auto_742 - INSTRUMENT
      ?auto_741 - SATELLITE
      ?auto_743 - DIRECTION
      ?auto_740 - INSTRUMENT
      ?auto_744 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_739 ?auto_736 ) ) ( ON_BOARD ?auto_742 ?auto_741 ) ( SUPPORTS ?auto_742 ?auto_738 ) ( not ( = ?auto_739 ?auto_743 ) ) ( CALIBRATION_TARGET ?auto_742 ?auto_743 ) ( not ( = ?auto_743 ?auto_736 ) ) ( ON_BOARD ?auto_740 ?auto_741 ) ( not ( = ?auto_742 ?auto_740 ) ) ( SUPPORTS ?auto_740 ?auto_737 ) ( CALIBRATION_TARGET ?auto_740 ?auto_743 ) ( POWER_AVAIL ?auto_741 ) ( POINTING ?auto_741 ?auto_744 ) ( not ( = ?auto_743 ?auto_744 ) ) ( not ( = ?auto_736 ?auto_744 ) ) ( not ( = ?auto_737 ?auto_738 ) ) ( not ( = ?auto_739 ?auto_744 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_736 ?auto_737 )
      ( GET-1IMAGE ?auto_739 ?auto_738 )
      ( GET-2IMAGE-VERIFY ?auto_736 ?auto_737 ?auto_739 ?auto_738 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_897 - DIRECTION
      ?auto_898 - MODE
      ?auto_900 - DIRECTION
      ?auto_899 - MODE
      ?auto_901 - DIRECTION
      ?auto_902 - MODE
    )
    :vars
    (
      ?auto_903 - INSTRUMENT
      ?auto_905 - SATELLITE
      ?auto_906 - DIRECTION
      ?auto_904 - INSTRUMENT
      ?auto_907 - INSTRUMENT
      ?auto_908 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_900 ?auto_897 ) ) ( not ( = ?auto_901 ?auto_897 ) ) ( not ( = ?auto_901 ?auto_900 ) ) ( ON_BOARD ?auto_903 ?auto_905 ) ( SUPPORTS ?auto_903 ?auto_902 ) ( not ( = ?auto_901 ?auto_906 ) ) ( CALIBRATION_TARGET ?auto_903 ?auto_906 ) ( not ( = ?auto_906 ?auto_900 ) ) ( ON_BOARD ?auto_904 ?auto_905 ) ( not ( = ?auto_903 ?auto_904 ) ) ( SUPPORTS ?auto_904 ?auto_899 ) ( CALIBRATION_TARGET ?auto_904 ?auto_906 ) ( not ( = ?auto_906 ?auto_897 ) ) ( ON_BOARD ?auto_907 ?auto_905 ) ( not ( = ?auto_904 ?auto_907 ) ) ( SUPPORTS ?auto_907 ?auto_898 ) ( CALIBRATION_TARGET ?auto_907 ?auto_906 ) ( POWER_AVAIL ?auto_905 ) ( POINTING ?auto_905 ?auto_908 ) ( not ( = ?auto_906 ?auto_908 ) ) ( not ( = ?auto_897 ?auto_908 ) ) ( not ( = ?auto_898 ?auto_899 ) ) ( not ( = ?auto_900 ?auto_908 ) ) ( not ( = ?auto_898 ?auto_902 ) ) ( not ( = ?auto_899 ?auto_902 ) ) ( not ( = ?auto_901 ?auto_908 ) ) ( not ( = ?auto_903 ?auto_907 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_897 ?auto_898 ?auto_900 ?auto_899 )
      ( GET-1IMAGE ?auto_901 ?auto_902 )
      ( GET-3IMAGE-VERIFY ?auto_897 ?auto_898 ?auto_900 ?auto_899 ?auto_901 ?auto_902 ) )
  )

)

