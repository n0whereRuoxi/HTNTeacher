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
      ?auto_100 - DIRECTION
      ?auto_101 - MODE
    )
    :vars
    (
      ?auto_102 - INSTRUMENT
      ?auto_103 - SATELLITE
      ?auto_104 - DIRECTION
      ?auto_105 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_102 ?auto_103 ) ( SUPPORTS ?auto_102 ?auto_101 ) ( not ( = ?auto_100 ?auto_104 ) ) ( CALIBRATION_TARGET ?auto_102 ?auto_104 ) ( POWER_AVAIL ?auto_103 ) ( POINTING ?auto_103 ?auto_105 ) ( not ( = ?auto_104 ?auto_105 ) ) ( not ( = ?auto_100 ?auto_105 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_103 ?auto_104 ?auto_105 )
      ( !SWITCH_ON ?auto_102 ?auto_103 )
      ( !CALIBRATE ?auto_103 ?auto_102 ?auto_104 )
      ( !TURN_TO ?auto_103 ?auto_100 ?auto_104 )
      ( !TAKE_IMAGE ?auto_103 ?auto_100 ?auto_102 ?auto_101 )
      ( GET-1IMAGE-VERIFY ?auto_100 ?auto_101 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_108 - DIRECTION
      ?auto_109 - MODE
    )
    :vars
    (
      ?auto_110 - INSTRUMENT
      ?auto_111 - SATELLITE
      ?auto_112 - DIRECTION
      ?auto_113 - DIRECTION
      ?auto_114 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_110 ?auto_111 ) ( SUPPORTS ?auto_110 ?auto_109 ) ( not ( = ?auto_108 ?auto_112 ) ) ( CALIBRATION_TARGET ?auto_110 ?auto_112 ) ( POINTING ?auto_111 ?auto_113 ) ( not ( = ?auto_112 ?auto_113 ) ) ( ON_BOARD ?auto_114 ?auto_111 ) ( POWER_ON ?auto_114 ) ( not ( = ?auto_108 ?auto_113 ) ) ( not ( = ?auto_110 ?auto_114 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_114 ?auto_111 )
      ( !TURN_TO ?auto_111 ?auto_112 ?auto_113 )
      ( !SWITCH_ON ?auto_110 ?auto_111 )
      ( !CALIBRATE ?auto_111 ?auto_110 ?auto_112 )
      ( !TURN_TO ?auto_111 ?auto_108 ?auto_112 )
      ( !TAKE_IMAGE ?auto_111 ?auto_108 ?auto_110 ?auto_109 )
      ( GET-1IMAGE-VERIFY ?auto_108 ?auto_109 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_127 - DIRECTION
      ?auto_128 - MODE
      ?auto_130 - DIRECTION
      ?auto_129 - MODE
    )
    :vars
    (
      ?auto_132 - INSTRUMENT
      ?auto_133 - SATELLITE
      ?auto_131 - DIRECTION
      ?auto_134 - INSTRUMENT
      ?auto_135 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_130 ?auto_127 ) ) ( ON_BOARD ?auto_132 ?auto_133 ) ( SUPPORTS ?auto_132 ?auto_129 ) ( not ( = ?auto_130 ?auto_131 ) ) ( CALIBRATION_TARGET ?auto_132 ?auto_131 ) ( not ( = ?auto_131 ?auto_127 ) ) ( ON_BOARD ?auto_134 ?auto_133 ) ( not ( = ?auto_132 ?auto_134 ) ) ( SUPPORTS ?auto_134 ?auto_128 ) ( CALIBRATION_TARGET ?auto_134 ?auto_131 ) ( POWER_AVAIL ?auto_133 ) ( POINTING ?auto_133 ?auto_135 ) ( not ( = ?auto_131 ?auto_135 ) ) ( not ( = ?auto_127 ?auto_135 ) ) ( not ( = ?auto_128 ?auto_129 ) ) ( not ( = ?auto_130 ?auto_135 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_127 ?auto_128 )
      ( GET-1IMAGE ?auto_130 ?auto_129 )
      ( GET-2IMAGE-VERIFY ?auto_127 ?auto_128 ?auto_130 ?auto_129 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_136 - DIRECTION
      ?auto_137 - MODE
      ?auto_139 - DIRECTION
      ?auto_138 - MODE
    )
    :vars
    (
      ?auto_144 - INSTRUMENT
      ?auto_140 - SATELLITE
      ?auto_141 - DIRECTION
      ?auto_142 - INSTRUMENT
      ?auto_143 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_139 ?auto_136 ) ) ( ON_BOARD ?auto_144 ?auto_140 ) ( SUPPORTS ?auto_144 ?auto_137 ) ( not ( = ?auto_136 ?auto_141 ) ) ( CALIBRATION_TARGET ?auto_144 ?auto_141 ) ( not ( = ?auto_141 ?auto_139 ) ) ( ON_BOARD ?auto_142 ?auto_140 ) ( not ( = ?auto_144 ?auto_142 ) ) ( SUPPORTS ?auto_142 ?auto_138 ) ( CALIBRATION_TARGET ?auto_142 ?auto_141 ) ( POWER_AVAIL ?auto_140 ) ( POINTING ?auto_140 ?auto_143 ) ( not ( = ?auto_141 ?auto_143 ) ) ( not ( = ?auto_139 ?auto_143 ) ) ( not ( = ?auto_138 ?auto_137 ) ) ( not ( = ?auto_136 ?auto_143 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_139 ?auto_138 ?auto_136 ?auto_137 )
      ( GET-2IMAGE-VERIFY ?auto_136 ?auto_137 ?auto_139 ?auto_138 ) )
  )

)

