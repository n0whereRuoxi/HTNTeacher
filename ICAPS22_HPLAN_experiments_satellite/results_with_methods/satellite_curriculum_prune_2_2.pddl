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
      ?auto_148 - DIRECTION
      ?auto_149 - MODE
    )
    :vars
    (
      ?auto_150 - INSTRUMENT
      ?auto_151 - SATELLITE
      ?auto_152 - DIRECTION
      ?auto_153 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_150 ?auto_151 ) ( SUPPORTS ?auto_150 ?auto_149 ) ( not ( = ?auto_148 ?auto_152 ) ) ( CALIBRATION_TARGET ?auto_150 ?auto_152 ) ( POWER_AVAIL ?auto_151 ) ( POINTING ?auto_151 ?auto_153 ) ( not ( = ?auto_152 ?auto_153 ) ) ( not ( = ?auto_148 ?auto_153 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_151 ?auto_152 ?auto_153 )
      ( !SWITCH_ON ?auto_150 ?auto_151 )
      ( !CALIBRATE ?auto_151 ?auto_150 ?auto_152 )
      ( !TURN_TO ?auto_151 ?auto_148 ?auto_152 )
      ( !TAKE_IMAGE ?auto_151 ?auto_148 ?auto_150 ?auto_149 )
      ( GET-1IMAGE-VERIFY ?auto_148 ?auto_149 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_156 - DIRECTION
      ?auto_157 - MODE
    )
    :vars
    (
      ?auto_158 - INSTRUMENT
      ?auto_159 - SATELLITE
      ?auto_160 - DIRECTION
      ?auto_161 - DIRECTION
      ?auto_162 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_158 ?auto_159 ) ( SUPPORTS ?auto_158 ?auto_157 ) ( not ( = ?auto_156 ?auto_160 ) ) ( CALIBRATION_TARGET ?auto_158 ?auto_160 ) ( POINTING ?auto_159 ?auto_161 ) ( not ( = ?auto_160 ?auto_161 ) ) ( ON_BOARD ?auto_162 ?auto_159 ) ( POWER_ON ?auto_162 ) ( not ( = ?auto_156 ?auto_161 ) ) ( not ( = ?auto_158 ?auto_162 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_162 ?auto_159 )
      ( !TURN_TO ?auto_159 ?auto_160 ?auto_161 )
      ( !SWITCH_ON ?auto_158 ?auto_159 )
      ( !CALIBRATE ?auto_159 ?auto_158 ?auto_160 )
      ( !TURN_TO ?auto_159 ?auto_156 ?auto_160 )
      ( !TAKE_IMAGE ?auto_159 ?auto_156 ?auto_158 ?auto_157 )
      ( GET-1IMAGE-VERIFY ?auto_156 ?auto_157 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_175 - DIRECTION
      ?auto_176 - MODE
      ?auto_178 - DIRECTION
      ?auto_177 - MODE
    )
    :vars
    (
      ?auto_179 - INSTRUMENT
      ?auto_180 - SATELLITE
      ?auto_181 - DIRECTION
      ?auto_182 - INSTRUMENT
      ?auto_183 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_178 ?auto_175 ) ) ( ON_BOARD ?auto_179 ?auto_180 ) ( SUPPORTS ?auto_179 ?auto_177 ) ( not ( = ?auto_178 ?auto_181 ) ) ( CALIBRATION_TARGET ?auto_179 ?auto_181 ) ( not ( = ?auto_181 ?auto_175 ) ) ( ON_BOARD ?auto_182 ?auto_180 ) ( not ( = ?auto_179 ?auto_182 ) ) ( SUPPORTS ?auto_182 ?auto_176 ) ( CALIBRATION_TARGET ?auto_182 ?auto_181 ) ( POWER_AVAIL ?auto_180 ) ( POINTING ?auto_180 ?auto_183 ) ( not ( = ?auto_181 ?auto_183 ) ) ( not ( = ?auto_175 ?auto_183 ) ) ( not ( = ?auto_176 ?auto_177 ) ) ( not ( = ?auto_178 ?auto_183 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_175 ?auto_176 )
      ( GET-1IMAGE ?auto_178 ?auto_177 )
      ( GET-2IMAGE-VERIFY ?auto_175 ?auto_176 ?auto_178 ?auto_177 ) )
  )

)

