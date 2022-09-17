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
      ?auto_201 - DIRECTION
      ?auto_202 - MODE
    )
    :vars
    (
      ?auto_203 - INSTRUMENT
      ?auto_204 - SATELLITE
      ?auto_205 - DIRECTION
      ?auto_206 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_203 ?auto_204 ) ( SUPPORTS ?auto_203 ?auto_202 ) ( not ( = ?auto_201 ?auto_205 ) ) ( CALIBRATION_TARGET ?auto_203 ?auto_205 ) ( POWER_AVAIL ?auto_204 ) ( POINTING ?auto_204 ?auto_206 ) ( not ( = ?auto_205 ?auto_206 ) ) ( not ( = ?auto_201 ?auto_206 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_204 ?auto_205 ?auto_206 )
      ( !SWITCH_ON ?auto_203 ?auto_204 )
      ( !CALIBRATE ?auto_204 ?auto_203 ?auto_205 )
      ( !TURN_TO ?auto_204 ?auto_201 ?auto_205 )
      ( !TAKE_IMAGE ?auto_204 ?auto_201 ?auto_203 ?auto_202 )
      ( GET-1IMAGE-VERIFY ?auto_201 ?auto_202 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_209 - DIRECTION
      ?auto_210 - MODE
    )
    :vars
    (
      ?auto_211 - INSTRUMENT
      ?auto_212 - SATELLITE
      ?auto_213 - DIRECTION
      ?auto_214 - DIRECTION
      ?auto_215 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_211 ?auto_212 ) ( SUPPORTS ?auto_211 ?auto_210 ) ( not ( = ?auto_209 ?auto_213 ) ) ( CALIBRATION_TARGET ?auto_211 ?auto_213 ) ( POINTING ?auto_212 ?auto_214 ) ( not ( = ?auto_213 ?auto_214 ) ) ( ON_BOARD ?auto_215 ?auto_212 ) ( POWER_ON ?auto_215 ) ( not ( = ?auto_209 ?auto_214 ) ) ( not ( = ?auto_211 ?auto_215 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_215 ?auto_212 )
      ( !TURN_TO ?auto_212 ?auto_213 ?auto_214 )
      ( !SWITCH_ON ?auto_211 ?auto_212 )
      ( !CALIBRATE ?auto_212 ?auto_211 ?auto_213 )
      ( !TURN_TO ?auto_212 ?auto_209 ?auto_213 )
      ( !TAKE_IMAGE ?auto_212 ?auto_209 ?auto_211 ?auto_210 )
      ( GET-1IMAGE-VERIFY ?auto_209 ?auto_210 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_228 - DIRECTION
      ?auto_229 - MODE
      ?auto_231 - DIRECTION
      ?auto_230 - MODE
    )
    :vars
    (
      ?auto_234 - INSTRUMENT
      ?auto_235 - SATELLITE
      ?auto_232 - DIRECTION
      ?auto_233 - INSTRUMENT
      ?auto_236 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_231 ?auto_228 ) ) ( ON_BOARD ?auto_234 ?auto_235 ) ( SUPPORTS ?auto_234 ?auto_230 ) ( not ( = ?auto_231 ?auto_232 ) ) ( CALIBRATION_TARGET ?auto_234 ?auto_232 ) ( not ( = ?auto_232 ?auto_228 ) ) ( ON_BOARD ?auto_233 ?auto_235 ) ( not ( = ?auto_234 ?auto_233 ) ) ( SUPPORTS ?auto_233 ?auto_229 ) ( CALIBRATION_TARGET ?auto_233 ?auto_232 ) ( POWER_AVAIL ?auto_235 ) ( POINTING ?auto_235 ?auto_236 ) ( not ( = ?auto_232 ?auto_236 ) ) ( not ( = ?auto_228 ?auto_236 ) ) ( not ( = ?auto_229 ?auto_230 ) ) ( not ( = ?auto_231 ?auto_236 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_228 ?auto_229 )
      ( GET-1IMAGE ?auto_231 ?auto_230 )
      ( GET-2IMAGE-VERIFY ?auto_228 ?auto_229 ?auto_231 ?auto_230 ) )
  )

)

