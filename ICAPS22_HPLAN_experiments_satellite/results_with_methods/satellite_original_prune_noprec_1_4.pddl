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

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_110 - DIRECTION
      ?auto_111 - MODE
    )
    :vars
    (
      ?auto_112 - INSTRUMENT
      ?auto_113 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_112 ) ( ON_BOARD ?auto_112 ?auto_113 ) ( SUPPORTS ?auto_112 ?auto_111 ) ( POWER_ON ?auto_112 ) ( POINTING ?auto_113 ?auto_110 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_113 ?auto_110 ?auto_112 ?auto_111 )
      ( GET-1IMAGE-VERIFY ?auto_110 ?auto_111 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_114 - DIRECTION
      ?auto_115 - MODE
    )
    :vars
    (
      ?auto_117 - INSTRUMENT
      ?auto_116 - SATELLITE
      ?auto_118 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_117 ) ( ON_BOARD ?auto_117 ?auto_116 ) ( SUPPORTS ?auto_117 ?auto_115 ) ( POWER_ON ?auto_117 ) ( POINTING ?auto_116 ?auto_118 ) ( not ( = ?auto_114 ?auto_118 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_116 ?auto_114 ?auto_118 )
      ( GET-1IMAGE ?auto_114 ?auto_115 )
      ( GET-1IMAGE-VERIFY ?auto_114 ?auto_115 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_119 - DIRECTION
      ?auto_120 - MODE
    )
    :vars
    (
      ?auto_123 - INSTRUMENT
      ?auto_121 - SATELLITE
      ?auto_122 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_123 ?auto_121 ) ( SUPPORTS ?auto_123 ?auto_120 ) ( POWER_ON ?auto_123 ) ( POINTING ?auto_121 ?auto_122 ) ( not ( = ?auto_119 ?auto_122 ) ) ( CALIBRATION_TARGET ?auto_123 ?auto_122 ) ( NOT_CALIBRATED ?auto_123 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_121 ?auto_123 ?auto_122 )
      ( GET-1IMAGE ?auto_119 ?auto_120 )
      ( GET-1IMAGE-VERIFY ?auto_119 ?auto_120 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_124 - DIRECTION
      ?auto_125 - MODE
    )
    :vars
    (
      ?auto_126 - INSTRUMENT
      ?auto_128 - SATELLITE
      ?auto_127 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_126 ?auto_128 ) ( SUPPORTS ?auto_126 ?auto_125 ) ( POINTING ?auto_128 ?auto_127 ) ( not ( = ?auto_124 ?auto_127 ) ) ( CALIBRATION_TARGET ?auto_126 ?auto_127 ) ( POWER_AVAIL ?auto_128 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_126 ?auto_128 )
      ( GET-1IMAGE ?auto_124 ?auto_125 )
      ( GET-1IMAGE-VERIFY ?auto_124 ?auto_125 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_129 - DIRECTION
      ?auto_130 - MODE
    )
    :vars
    (
      ?auto_131 - INSTRUMENT
      ?auto_133 - SATELLITE
      ?auto_132 - DIRECTION
      ?auto_134 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_131 ?auto_133 ) ( SUPPORTS ?auto_131 ?auto_130 ) ( not ( = ?auto_129 ?auto_132 ) ) ( CALIBRATION_TARGET ?auto_131 ?auto_132 ) ( POWER_AVAIL ?auto_133 ) ( POINTING ?auto_133 ?auto_134 ) ( not ( = ?auto_132 ?auto_134 ) ) ( not ( = ?auto_129 ?auto_134 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_133 ?auto_132 ?auto_134 )
      ( GET-1IMAGE ?auto_129 ?auto_130 )
      ( GET-1IMAGE-VERIFY ?auto_129 ?auto_130 ) )
  )

)

