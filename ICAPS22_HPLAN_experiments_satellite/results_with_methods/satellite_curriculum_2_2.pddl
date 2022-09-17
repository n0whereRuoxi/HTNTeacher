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
      ?auto_158 - DIRECTION
      ?auto_159 - MODE
    )
    :vars
    (
      ?auto_160 - INSTRUMENT
      ?auto_161 - SATELLITE
      ?auto_162 - DIRECTION
      ?auto_163 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_160 ?auto_161 ) ( SUPPORTS ?auto_160 ?auto_159 ) ( not ( = ?auto_158 ?auto_162 ) ) ( CALIBRATION_TARGET ?auto_160 ?auto_162 ) ( POWER_AVAIL ?auto_161 ) ( POINTING ?auto_161 ?auto_163 ) ( not ( = ?auto_162 ?auto_163 ) ) ( not ( = ?auto_158 ?auto_163 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_161 ?auto_162 ?auto_163 )
      ( !SWITCH_ON ?auto_160 ?auto_161 )
      ( !CALIBRATE ?auto_161 ?auto_160 ?auto_162 )
      ( !TURN_TO ?auto_161 ?auto_158 ?auto_162 )
      ( !TAKE_IMAGE ?auto_161 ?auto_158 ?auto_160 ?auto_159 )
      ( GET-1IMAGE-VERIFY ?auto_158 ?auto_159 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_166 - DIRECTION
      ?auto_167 - MODE
    )
    :vars
    (
      ?auto_168 - INSTRUMENT
      ?auto_169 - SATELLITE
      ?auto_170 - DIRECTION
      ?auto_171 - DIRECTION
      ?auto_172 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_168 ?auto_169 ) ( SUPPORTS ?auto_168 ?auto_167 ) ( not ( = ?auto_166 ?auto_170 ) ) ( CALIBRATION_TARGET ?auto_168 ?auto_170 ) ( POINTING ?auto_169 ?auto_171 ) ( not ( = ?auto_170 ?auto_171 ) ) ( ON_BOARD ?auto_172 ?auto_169 ) ( POWER_ON ?auto_172 ) ( not ( = ?auto_166 ?auto_171 ) ) ( not ( = ?auto_168 ?auto_172 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_172 ?auto_169 )
      ( !TURN_TO ?auto_169 ?auto_170 ?auto_171 )
      ( !SWITCH_ON ?auto_168 ?auto_169 )
      ( !CALIBRATE ?auto_169 ?auto_168 ?auto_170 )
      ( !TURN_TO ?auto_169 ?auto_166 ?auto_170 )
      ( !TAKE_IMAGE ?auto_169 ?auto_166 ?auto_168 ?auto_167 )
      ( GET-1IMAGE-VERIFY ?auto_166 ?auto_167 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_185 - DIRECTION
      ?auto_186 - MODE
      ?auto_188 - DIRECTION
      ?auto_187 - MODE
    )
    :vars
    (
      ?auto_191 - INSTRUMENT
      ?auto_192 - SATELLITE
      ?auto_190 - DIRECTION
      ?auto_189 - INSTRUMENT
      ?auto_193 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_188 ?auto_185 ) ) ( ON_BOARD ?auto_191 ?auto_192 ) ( SUPPORTS ?auto_191 ?auto_187 ) ( not ( = ?auto_188 ?auto_190 ) ) ( CALIBRATION_TARGET ?auto_191 ?auto_190 ) ( not ( = ?auto_190 ?auto_185 ) ) ( ON_BOARD ?auto_189 ?auto_192 ) ( not ( = ?auto_191 ?auto_189 ) ) ( SUPPORTS ?auto_189 ?auto_186 ) ( CALIBRATION_TARGET ?auto_189 ?auto_190 ) ( POWER_AVAIL ?auto_192 ) ( POINTING ?auto_192 ?auto_193 ) ( not ( = ?auto_190 ?auto_193 ) ) ( not ( = ?auto_185 ?auto_193 ) ) ( not ( = ?auto_186 ?auto_187 ) ) ( not ( = ?auto_188 ?auto_193 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_185 ?auto_186 )
      ( GET-1IMAGE ?auto_188 ?auto_187 )
      ( GET-2IMAGE-VERIFY ?auto_185 ?auto_186 ?auto_188 ?auto_187 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_194 - DIRECTION
      ?auto_195 - MODE
      ?auto_197 - DIRECTION
      ?auto_196 - MODE
    )
    :vars
    (
      ?auto_198 - INSTRUMENT
      ?auto_200 - SATELLITE
      ?auto_199 - DIRECTION
      ?auto_202 - INSTRUMENT
      ?auto_201 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_197 ?auto_194 ) ) ( ON_BOARD ?auto_198 ?auto_200 ) ( SUPPORTS ?auto_198 ?auto_195 ) ( not ( = ?auto_194 ?auto_199 ) ) ( CALIBRATION_TARGET ?auto_198 ?auto_199 ) ( not ( = ?auto_199 ?auto_197 ) ) ( ON_BOARD ?auto_202 ?auto_200 ) ( not ( = ?auto_198 ?auto_202 ) ) ( SUPPORTS ?auto_202 ?auto_196 ) ( CALIBRATION_TARGET ?auto_202 ?auto_199 ) ( POWER_AVAIL ?auto_200 ) ( POINTING ?auto_200 ?auto_201 ) ( not ( = ?auto_199 ?auto_201 ) ) ( not ( = ?auto_197 ?auto_201 ) ) ( not ( = ?auto_196 ?auto_195 ) ) ( not ( = ?auto_194 ?auto_201 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_197 ?auto_196 ?auto_194 ?auto_195 )
      ( GET-2IMAGE-VERIFY ?auto_194 ?auto_195 ?auto_197 ?auto_196 ) )
  )

)

