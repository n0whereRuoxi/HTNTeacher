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
      ?auto_307 - DIRECTION
      ?auto_308 - MODE
    )
    :vars
    (
      ?auto_309 - INSTRUMENT
      ?auto_310 - SATELLITE
      ?auto_311 - DIRECTION
      ?auto_312 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_309 ?auto_310 ) ( SUPPORTS ?auto_309 ?auto_308 ) ( not ( = ?auto_307 ?auto_311 ) ) ( CALIBRATION_TARGET ?auto_309 ?auto_311 ) ( POWER_AVAIL ?auto_310 ) ( POINTING ?auto_310 ?auto_312 ) ( not ( = ?auto_311 ?auto_312 ) ) ( not ( = ?auto_307 ?auto_312 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_310 ?auto_311 ?auto_312 )
      ( !SWITCH_ON ?auto_309 ?auto_310 )
      ( !CALIBRATE ?auto_310 ?auto_309 ?auto_311 )
      ( !TURN_TO ?auto_310 ?auto_307 ?auto_311 )
      ( !TAKE_IMAGE ?auto_310 ?auto_307 ?auto_309 ?auto_308 )
      ( GET-1IMAGE-VERIFY ?auto_307 ?auto_308 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_315 - DIRECTION
      ?auto_316 - MODE
    )
    :vars
    (
      ?auto_317 - INSTRUMENT
      ?auto_318 - SATELLITE
      ?auto_319 - DIRECTION
      ?auto_320 - DIRECTION
      ?auto_321 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_317 ?auto_318 ) ( SUPPORTS ?auto_317 ?auto_316 ) ( not ( = ?auto_315 ?auto_319 ) ) ( CALIBRATION_TARGET ?auto_317 ?auto_319 ) ( POINTING ?auto_318 ?auto_320 ) ( not ( = ?auto_319 ?auto_320 ) ) ( ON_BOARD ?auto_321 ?auto_318 ) ( POWER_ON ?auto_321 ) ( not ( = ?auto_315 ?auto_320 ) ) ( not ( = ?auto_317 ?auto_321 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_321 ?auto_318 )
      ( !TURN_TO ?auto_318 ?auto_319 ?auto_320 )
      ( !SWITCH_ON ?auto_317 ?auto_318 )
      ( !CALIBRATE ?auto_318 ?auto_317 ?auto_319 )
      ( !TURN_TO ?auto_318 ?auto_315 ?auto_319 )
      ( !TAKE_IMAGE ?auto_318 ?auto_315 ?auto_317 ?auto_316 )
      ( GET-1IMAGE-VERIFY ?auto_315 ?auto_316 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_334 - DIRECTION
      ?auto_335 - MODE
      ?auto_337 - DIRECTION
      ?auto_336 - MODE
    )
    :vars
    (
      ?auto_341 - INSTRUMENT
      ?auto_340 - SATELLITE
      ?auto_339 - DIRECTION
      ?auto_338 - INSTRUMENT
      ?auto_342 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_337 ?auto_334 ) ) ( ON_BOARD ?auto_341 ?auto_340 ) ( SUPPORTS ?auto_341 ?auto_336 ) ( not ( = ?auto_337 ?auto_339 ) ) ( CALIBRATION_TARGET ?auto_341 ?auto_339 ) ( not ( = ?auto_339 ?auto_334 ) ) ( ON_BOARD ?auto_338 ?auto_340 ) ( not ( = ?auto_341 ?auto_338 ) ) ( SUPPORTS ?auto_338 ?auto_335 ) ( CALIBRATION_TARGET ?auto_338 ?auto_339 ) ( POWER_AVAIL ?auto_340 ) ( POINTING ?auto_340 ?auto_342 ) ( not ( = ?auto_339 ?auto_342 ) ) ( not ( = ?auto_334 ?auto_342 ) ) ( not ( = ?auto_335 ?auto_336 ) ) ( not ( = ?auto_337 ?auto_342 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_334 ?auto_335 )
      ( GET-1IMAGE ?auto_337 ?auto_336 )
      ( GET-2IMAGE-VERIFY ?auto_334 ?auto_335 ?auto_337 ?auto_336 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_495 - DIRECTION
      ?auto_496 - MODE
      ?auto_498 - DIRECTION
      ?auto_497 - MODE
      ?auto_499 - DIRECTION
      ?auto_500 - MODE
    )
    :vars
    (
      ?auto_501 - INSTRUMENT
      ?auto_502 - SATELLITE
      ?auto_504 - DIRECTION
      ?auto_503 - INSTRUMENT
      ?auto_505 - INSTRUMENT
      ?auto_506 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_498 ?auto_495 ) ) ( not ( = ?auto_499 ?auto_495 ) ) ( not ( = ?auto_499 ?auto_498 ) ) ( ON_BOARD ?auto_501 ?auto_502 ) ( SUPPORTS ?auto_501 ?auto_500 ) ( not ( = ?auto_499 ?auto_504 ) ) ( CALIBRATION_TARGET ?auto_501 ?auto_504 ) ( not ( = ?auto_504 ?auto_498 ) ) ( ON_BOARD ?auto_503 ?auto_502 ) ( not ( = ?auto_501 ?auto_503 ) ) ( SUPPORTS ?auto_503 ?auto_497 ) ( CALIBRATION_TARGET ?auto_503 ?auto_504 ) ( not ( = ?auto_504 ?auto_495 ) ) ( ON_BOARD ?auto_505 ?auto_502 ) ( not ( = ?auto_503 ?auto_505 ) ) ( SUPPORTS ?auto_505 ?auto_496 ) ( CALIBRATION_TARGET ?auto_505 ?auto_504 ) ( POWER_AVAIL ?auto_502 ) ( POINTING ?auto_502 ?auto_506 ) ( not ( = ?auto_504 ?auto_506 ) ) ( not ( = ?auto_495 ?auto_506 ) ) ( not ( = ?auto_496 ?auto_497 ) ) ( not ( = ?auto_498 ?auto_506 ) ) ( not ( = ?auto_496 ?auto_500 ) ) ( not ( = ?auto_497 ?auto_500 ) ) ( not ( = ?auto_499 ?auto_506 ) ) ( not ( = ?auto_501 ?auto_505 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_495 ?auto_496 ?auto_498 ?auto_497 )
      ( GET-1IMAGE ?auto_499 ?auto_500 )
      ( GET-3IMAGE-VERIFY ?auto_495 ?auto_496 ?auto_498 ?auto_497 ?auto_499 ?auto_500 ) )
  )

)

