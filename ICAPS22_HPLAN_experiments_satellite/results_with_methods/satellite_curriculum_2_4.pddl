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
      ?auto_274 - DIRECTION
      ?auto_275 - MODE
    )
    :vars
    (
      ?auto_276 - INSTRUMENT
      ?auto_277 - SATELLITE
      ?auto_278 - DIRECTION
      ?auto_279 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_276 ?auto_277 ) ( SUPPORTS ?auto_276 ?auto_275 ) ( not ( = ?auto_274 ?auto_278 ) ) ( CALIBRATION_TARGET ?auto_276 ?auto_278 ) ( POWER_AVAIL ?auto_277 ) ( POINTING ?auto_277 ?auto_279 ) ( not ( = ?auto_278 ?auto_279 ) ) ( not ( = ?auto_274 ?auto_279 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_277 ?auto_278 ?auto_279 )
      ( !SWITCH_ON ?auto_276 ?auto_277 )
      ( !CALIBRATE ?auto_277 ?auto_276 ?auto_278 )
      ( !TURN_TO ?auto_277 ?auto_274 ?auto_278 )
      ( !TAKE_IMAGE ?auto_277 ?auto_274 ?auto_276 ?auto_275 )
      ( GET-1IMAGE-VERIFY ?auto_274 ?auto_275 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_282 - DIRECTION
      ?auto_283 - MODE
    )
    :vars
    (
      ?auto_284 - INSTRUMENT
      ?auto_285 - SATELLITE
      ?auto_286 - DIRECTION
      ?auto_287 - DIRECTION
      ?auto_288 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_284 ?auto_285 ) ( SUPPORTS ?auto_284 ?auto_283 ) ( not ( = ?auto_282 ?auto_286 ) ) ( CALIBRATION_TARGET ?auto_284 ?auto_286 ) ( POINTING ?auto_285 ?auto_287 ) ( not ( = ?auto_286 ?auto_287 ) ) ( ON_BOARD ?auto_288 ?auto_285 ) ( POWER_ON ?auto_288 ) ( not ( = ?auto_282 ?auto_287 ) ) ( not ( = ?auto_284 ?auto_288 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_288 ?auto_285 )
      ( !TURN_TO ?auto_285 ?auto_286 ?auto_287 )
      ( !SWITCH_ON ?auto_284 ?auto_285 )
      ( !CALIBRATE ?auto_285 ?auto_284 ?auto_286 )
      ( !TURN_TO ?auto_285 ?auto_282 ?auto_286 )
      ( !TAKE_IMAGE ?auto_285 ?auto_282 ?auto_284 ?auto_283 )
      ( GET-1IMAGE-VERIFY ?auto_282 ?auto_283 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_301 - DIRECTION
      ?auto_302 - MODE
      ?auto_304 - DIRECTION
      ?auto_303 - MODE
    )
    :vars
    (
      ?auto_306 - INSTRUMENT
      ?auto_307 - SATELLITE
      ?auto_308 - DIRECTION
      ?auto_305 - INSTRUMENT
      ?auto_309 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_304 ?auto_301 ) ) ( ON_BOARD ?auto_306 ?auto_307 ) ( SUPPORTS ?auto_306 ?auto_303 ) ( not ( = ?auto_304 ?auto_308 ) ) ( CALIBRATION_TARGET ?auto_306 ?auto_308 ) ( not ( = ?auto_308 ?auto_301 ) ) ( ON_BOARD ?auto_305 ?auto_307 ) ( not ( = ?auto_306 ?auto_305 ) ) ( SUPPORTS ?auto_305 ?auto_302 ) ( CALIBRATION_TARGET ?auto_305 ?auto_308 ) ( POWER_AVAIL ?auto_307 ) ( POINTING ?auto_307 ?auto_309 ) ( not ( = ?auto_308 ?auto_309 ) ) ( not ( = ?auto_301 ?auto_309 ) ) ( not ( = ?auto_302 ?auto_303 ) ) ( not ( = ?auto_304 ?auto_309 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_301 ?auto_302 )
      ( GET-1IMAGE ?auto_304 ?auto_303 )
      ( GET-2IMAGE-VERIFY ?auto_301 ?auto_302 ?auto_304 ?auto_303 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_310 - DIRECTION
      ?auto_311 - MODE
      ?auto_313 - DIRECTION
      ?auto_312 - MODE
    )
    :vars
    (
      ?auto_316 - INSTRUMENT
      ?auto_318 - SATELLITE
      ?auto_315 - DIRECTION
      ?auto_317 - INSTRUMENT
      ?auto_314 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_313 ?auto_310 ) ) ( ON_BOARD ?auto_316 ?auto_318 ) ( SUPPORTS ?auto_316 ?auto_311 ) ( not ( = ?auto_310 ?auto_315 ) ) ( CALIBRATION_TARGET ?auto_316 ?auto_315 ) ( not ( = ?auto_315 ?auto_313 ) ) ( ON_BOARD ?auto_317 ?auto_318 ) ( not ( = ?auto_316 ?auto_317 ) ) ( SUPPORTS ?auto_317 ?auto_312 ) ( CALIBRATION_TARGET ?auto_317 ?auto_315 ) ( POWER_AVAIL ?auto_318 ) ( POINTING ?auto_318 ?auto_314 ) ( not ( = ?auto_315 ?auto_314 ) ) ( not ( = ?auto_313 ?auto_314 ) ) ( not ( = ?auto_312 ?auto_311 ) ) ( not ( = ?auto_310 ?auto_314 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_313 ?auto_312 ?auto_310 ?auto_311 )
      ( GET-2IMAGE-VERIFY ?auto_310 ?auto_311 ?auto_313 ?auto_312 ) )
  )

)

