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
      ?auto_216 - DIRECTION
      ?auto_217 - MODE
    )
    :vars
    (
      ?auto_218 - INSTRUMENT
      ?auto_219 - SATELLITE
      ?auto_220 - DIRECTION
      ?auto_221 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_218 ?auto_219 ) ( SUPPORTS ?auto_218 ?auto_217 ) ( not ( = ?auto_216 ?auto_220 ) ) ( CALIBRATION_TARGET ?auto_218 ?auto_220 ) ( POWER_AVAIL ?auto_219 ) ( POINTING ?auto_219 ?auto_221 ) ( not ( = ?auto_220 ?auto_221 ) ) ( not ( = ?auto_216 ?auto_221 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_219 ?auto_220 ?auto_221 )
      ( !SWITCH_ON ?auto_218 ?auto_219 )
      ( !CALIBRATE ?auto_219 ?auto_218 ?auto_220 )
      ( !TURN_TO ?auto_219 ?auto_216 ?auto_220 )
      ( !TAKE_IMAGE ?auto_219 ?auto_216 ?auto_218 ?auto_217 )
      ( GET-1IMAGE-VERIFY ?auto_216 ?auto_217 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_224 - DIRECTION
      ?auto_225 - MODE
    )
    :vars
    (
      ?auto_226 - INSTRUMENT
      ?auto_227 - SATELLITE
      ?auto_228 - DIRECTION
      ?auto_229 - DIRECTION
      ?auto_230 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_226 ?auto_227 ) ( SUPPORTS ?auto_226 ?auto_225 ) ( not ( = ?auto_224 ?auto_228 ) ) ( CALIBRATION_TARGET ?auto_226 ?auto_228 ) ( POINTING ?auto_227 ?auto_229 ) ( not ( = ?auto_228 ?auto_229 ) ) ( ON_BOARD ?auto_230 ?auto_227 ) ( POWER_ON ?auto_230 ) ( not ( = ?auto_224 ?auto_229 ) ) ( not ( = ?auto_226 ?auto_230 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_230 ?auto_227 )
      ( !TURN_TO ?auto_227 ?auto_228 ?auto_229 )
      ( !SWITCH_ON ?auto_226 ?auto_227 )
      ( !CALIBRATE ?auto_227 ?auto_226 ?auto_228 )
      ( !TURN_TO ?auto_227 ?auto_224 ?auto_228 )
      ( !TAKE_IMAGE ?auto_227 ?auto_224 ?auto_226 ?auto_225 )
      ( GET-1IMAGE-VERIFY ?auto_224 ?auto_225 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_243 - DIRECTION
      ?auto_244 - MODE
      ?auto_246 - DIRECTION
      ?auto_245 - MODE
    )
    :vars
    (
      ?auto_249 - INSTRUMENT
      ?auto_247 - SATELLITE
      ?auto_250 - DIRECTION
      ?auto_248 - INSTRUMENT
      ?auto_251 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_249 ?auto_247 ) ( SUPPORTS ?auto_249 ?auto_245 ) ( not ( = ?auto_246 ?auto_250 ) ) ( CALIBRATION_TARGET ?auto_249 ?auto_250 ) ( not ( = ?auto_250 ?auto_243 ) ) ( ON_BOARD ?auto_248 ?auto_247 ) ( not ( = ?auto_246 ?auto_243 ) ) ( not ( = ?auto_249 ?auto_248 ) ) ( SUPPORTS ?auto_248 ?auto_244 ) ( CALIBRATION_TARGET ?auto_248 ?auto_250 ) ( POWER_AVAIL ?auto_247 ) ( POINTING ?auto_247 ?auto_251 ) ( not ( = ?auto_250 ?auto_251 ) ) ( not ( = ?auto_243 ?auto_251 ) ) ( not ( = ?auto_244 ?auto_245 ) ) ( not ( = ?auto_246 ?auto_251 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_243 ?auto_244 )
      ( GET-1IMAGE ?auto_246 ?auto_245 )
      ( GET-2IMAGE-VERIFY ?auto_243 ?auto_244 ?auto_246 ?auto_245 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_252 - DIRECTION
      ?auto_253 - MODE
      ?auto_255 - DIRECTION
      ?auto_254 - MODE
    )
    :vars
    (
      ?auto_259 - INSTRUMENT
      ?auto_258 - SATELLITE
      ?auto_256 - DIRECTION
      ?auto_257 - INSTRUMENT
      ?auto_260 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_259 ?auto_258 ) ( SUPPORTS ?auto_259 ?auto_253 ) ( not ( = ?auto_252 ?auto_256 ) ) ( CALIBRATION_TARGET ?auto_259 ?auto_256 ) ( not ( = ?auto_256 ?auto_255 ) ) ( ON_BOARD ?auto_257 ?auto_258 ) ( not ( = ?auto_252 ?auto_255 ) ) ( not ( = ?auto_259 ?auto_257 ) ) ( SUPPORTS ?auto_257 ?auto_254 ) ( CALIBRATION_TARGET ?auto_257 ?auto_256 ) ( POWER_AVAIL ?auto_258 ) ( POINTING ?auto_258 ?auto_260 ) ( not ( = ?auto_256 ?auto_260 ) ) ( not ( = ?auto_255 ?auto_260 ) ) ( not ( = ?auto_254 ?auto_253 ) ) ( not ( = ?auto_252 ?auto_260 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_255 ?auto_254 ?auto_252 ?auto_253 )
      ( GET-2IMAGE-VERIFY ?auto_252 ?auto_253 ?auto_255 ?auto_254 ) )
  )

)

