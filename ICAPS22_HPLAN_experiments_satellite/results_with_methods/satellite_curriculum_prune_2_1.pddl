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

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_95 - DIRECTION
      ?auto_96 - MODE
    )
    :vars
    (
      ?auto_97 - INSTRUMENT
      ?auto_98 - SATELLITE
      ?auto_99 - DIRECTION
      ?auto_100 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_97 ?auto_98 ) ( SUPPORTS ?auto_97 ?auto_96 ) ( not ( = ?auto_95 ?auto_99 ) ) ( CALIBRATION_TARGET ?auto_97 ?auto_99 ) ( POWER_AVAIL ?auto_98 ) ( POINTING ?auto_98 ?auto_100 ) ( not ( = ?auto_99 ?auto_100 ) ) ( not ( = ?auto_95 ?auto_100 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_98 ?auto_99 ?auto_100 )
      ( !SWITCH_ON ?auto_97 ?auto_98 )
      ( !CALIBRATE ?auto_98 ?auto_97 ?auto_99 )
      ( !TURN_TO ?auto_98 ?auto_95 ?auto_99 )
      ( !TAKE_IMAGE ?auto_98 ?auto_95 ?auto_97 ?auto_96 )
      ( GET-1IMAGE-VERIFY ?auto_95 ?auto_96 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_103 - DIRECTION
      ?auto_104 - MODE
    )
    :vars
    (
      ?auto_105 - INSTRUMENT
      ?auto_106 - SATELLITE
      ?auto_107 - DIRECTION
      ?auto_108 - DIRECTION
      ?auto_109 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_105 ?auto_106 ) ( SUPPORTS ?auto_105 ?auto_104 ) ( not ( = ?auto_103 ?auto_107 ) ) ( CALIBRATION_TARGET ?auto_105 ?auto_107 ) ( POINTING ?auto_106 ?auto_108 ) ( not ( = ?auto_107 ?auto_108 ) ) ( ON_BOARD ?auto_109 ?auto_106 ) ( POWER_ON ?auto_109 ) ( not ( = ?auto_103 ?auto_108 ) ) ( not ( = ?auto_105 ?auto_109 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_109 ?auto_106 )
      ( !TURN_TO ?auto_106 ?auto_107 ?auto_108 )
      ( !SWITCH_ON ?auto_105 ?auto_106 )
      ( !CALIBRATE ?auto_106 ?auto_105 ?auto_107 )
      ( !TURN_TO ?auto_106 ?auto_103 ?auto_107 )
      ( !TAKE_IMAGE ?auto_106 ?auto_103 ?auto_105 ?auto_104 )
      ( GET-1IMAGE-VERIFY ?auto_103 ?auto_104 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_122 - DIRECTION
      ?auto_123 - MODE
      ?auto_125 - DIRECTION
      ?auto_124 - MODE
    )
    :vars
    (
      ?auto_127 - INSTRUMENT
      ?auto_126 - SATELLITE
      ?auto_128 - DIRECTION
      ?auto_129 - INSTRUMENT
      ?auto_130 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_125 ?auto_122 ) ) ( ON_BOARD ?auto_127 ?auto_126 ) ( SUPPORTS ?auto_127 ?auto_124 ) ( not ( = ?auto_125 ?auto_128 ) ) ( CALIBRATION_TARGET ?auto_127 ?auto_128 ) ( not ( = ?auto_128 ?auto_122 ) ) ( ON_BOARD ?auto_129 ?auto_126 ) ( not ( = ?auto_127 ?auto_129 ) ) ( SUPPORTS ?auto_129 ?auto_123 ) ( CALIBRATION_TARGET ?auto_129 ?auto_128 ) ( POWER_AVAIL ?auto_126 ) ( POINTING ?auto_126 ?auto_130 ) ( not ( = ?auto_128 ?auto_130 ) ) ( not ( = ?auto_122 ?auto_130 ) ) ( not ( = ?auto_123 ?auto_124 ) ) ( not ( = ?auto_125 ?auto_130 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_122 ?auto_123 )
      ( GET-1IMAGE ?auto_125 ?auto_124 )
      ( GET-2IMAGE-VERIFY ?auto_122 ?auto_123 ?auto_125 ?auto_124 ) )
  )

)

