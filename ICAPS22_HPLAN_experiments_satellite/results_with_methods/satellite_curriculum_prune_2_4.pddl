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
      ?auto_254 - DIRECTION
      ?auto_255 - MODE
    )
    :vars
    (
      ?auto_256 - INSTRUMENT
      ?auto_257 - SATELLITE
      ?auto_258 - DIRECTION
      ?auto_259 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_256 ?auto_257 ) ( SUPPORTS ?auto_256 ?auto_255 ) ( not ( = ?auto_254 ?auto_258 ) ) ( CALIBRATION_TARGET ?auto_256 ?auto_258 ) ( POWER_AVAIL ?auto_257 ) ( POINTING ?auto_257 ?auto_259 ) ( not ( = ?auto_258 ?auto_259 ) ) ( not ( = ?auto_254 ?auto_259 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_257 ?auto_258 ?auto_259 )
      ( !SWITCH_ON ?auto_256 ?auto_257 )
      ( !CALIBRATE ?auto_257 ?auto_256 ?auto_258 )
      ( !TURN_TO ?auto_257 ?auto_254 ?auto_258 )
      ( !TAKE_IMAGE ?auto_257 ?auto_254 ?auto_256 ?auto_255 )
      ( GET-1IMAGE-VERIFY ?auto_254 ?auto_255 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_262 - DIRECTION
      ?auto_263 - MODE
    )
    :vars
    (
      ?auto_264 - INSTRUMENT
      ?auto_265 - SATELLITE
      ?auto_266 - DIRECTION
      ?auto_267 - DIRECTION
      ?auto_268 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_264 ?auto_265 ) ( SUPPORTS ?auto_264 ?auto_263 ) ( not ( = ?auto_262 ?auto_266 ) ) ( CALIBRATION_TARGET ?auto_264 ?auto_266 ) ( POINTING ?auto_265 ?auto_267 ) ( not ( = ?auto_266 ?auto_267 ) ) ( ON_BOARD ?auto_268 ?auto_265 ) ( POWER_ON ?auto_268 ) ( not ( = ?auto_262 ?auto_267 ) ) ( not ( = ?auto_264 ?auto_268 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_268 ?auto_265 )
      ( !TURN_TO ?auto_265 ?auto_266 ?auto_267 )
      ( !SWITCH_ON ?auto_264 ?auto_265 )
      ( !CALIBRATE ?auto_265 ?auto_264 ?auto_266 )
      ( !TURN_TO ?auto_265 ?auto_262 ?auto_266 )
      ( !TAKE_IMAGE ?auto_265 ?auto_262 ?auto_264 ?auto_263 )
      ( GET-1IMAGE-VERIFY ?auto_262 ?auto_263 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_281 - DIRECTION
      ?auto_282 - MODE
      ?auto_284 - DIRECTION
      ?auto_283 - MODE
    )
    :vars
    (
      ?auto_286 - INSTRUMENT
      ?auto_288 - SATELLITE
      ?auto_287 - DIRECTION
      ?auto_285 - INSTRUMENT
      ?auto_289 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_284 ?auto_281 ) ) ( ON_BOARD ?auto_286 ?auto_288 ) ( SUPPORTS ?auto_286 ?auto_283 ) ( not ( = ?auto_284 ?auto_287 ) ) ( CALIBRATION_TARGET ?auto_286 ?auto_287 ) ( not ( = ?auto_287 ?auto_281 ) ) ( ON_BOARD ?auto_285 ?auto_288 ) ( not ( = ?auto_286 ?auto_285 ) ) ( SUPPORTS ?auto_285 ?auto_282 ) ( CALIBRATION_TARGET ?auto_285 ?auto_287 ) ( POWER_AVAIL ?auto_288 ) ( POINTING ?auto_288 ?auto_289 ) ( not ( = ?auto_287 ?auto_289 ) ) ( not ( = ?auto_281 ?auto_289 ) ) ( not ( = ?auto_282 ?auto_283 ) ) ( not ( = ?auto_284 ?auto_289 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_281 ?auto_282 )
      ( GET-1IMAGE ?auto_284 ?auto_283 )
      ( GET-2IMAGE-VERIFY ?auto_281 ?auto_282 ?auto_284 ?auto_283 ) )
  )

)

