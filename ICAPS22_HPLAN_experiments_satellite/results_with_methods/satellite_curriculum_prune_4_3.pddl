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

  ( :method GET-4IMAGE-VERIFY
    :parameters
    (
      ?goal_dir1 - DIRECTION
      ?goal_mode1 - MODE
      ?goal_dir2 - DIRECTION
      ?goal_mode2 - MODE
      ?goal_dir3 - DIRECTION
      ?goal_mode3 - MODE
      ?goal_dir4 - DIRECTION
      ?goal_mode4 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) ( HAVE_IMAGE ?goal_dir3 ?goal_mode3 ) ( HAVE_IMAGE ?goal_dir4 ?goal_mode4 ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_16312 - DIRECTION
      ?auto_16313 - MODE
    )
    :vars
    (
      ?auto_16314 - INSTRUMENT
      ?auto_16315 - SATELLITE
      ?auto_16316 - DIRECTION
      ?auto_16317 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16314 ?auto_16315 ) ( SUPPORTS ?auto_16314 ?auto_16313 ) ( not ( = ?auto_16312 ?auto_16316 ) ) ( CALIBRATION_TARGET ?auto_16314 ?auto_16316 ) ( POWER_AVAIL ?auto_16315 ) ( POINTING ?auto_16315 ?auto_16317 ) ( not ( = ?auto_16316 ?auto_16317 ) ) ( not ( = ?auto_16312 ?auto_16317 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_16315 ?auto_16316 ?auto_16317 )
      ( !SWITCH_ON ?auto_16314 ?auto_16315 )
      ( !CALIBRATE ?auto_16315 ?auto_16314 ?auto_16316 )
      ( !TURN_TO ?auto_16315 ?auto_16312 ?auto_16316 )
      ( !TAKE_IMAGE ?auto_16315 ?auto_16312 ?auto_16314 ?auto_16313 )
      ( GET-1IMAGE-VERIFY ?auto_16312 ?auto_16313 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_16320 - DIRECTION
      ?auto_16321 - MODE
    )
    :vars
    (
      ?auto_16322 - INSTRUMENT
      ?auto_16323 - SATELLITE
      ?auto_16324 - DIRECTION
      ?auto_16325 - DIRECTION
      ?auto_16326 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_16322 ?auto_16323 ) ( SUPPORTS ?auto_16322 ?auto_16321 ) ( not ( = ?auto_16320 ?auto_16324 ) ) ( CALIBRATION_TARGET ?auto_16322 ?auto_16324 ) ( POINTING ?auto_16323 ?auto_16325 ) ( not ( = ?auto_16324 ?auto_16325 ) ) ( ON_BOARD ?auto_16326 ?auto_16323 ) ( POWER_ON ?auto_16326 ) ( not ( = ?auto_16320 ?auto_16325 ) ) ( not ( = ?auto_16322 ?auto_16326 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_16326 ?auto_16323 )
      ( !TURN_TO ?auto_16323 ?auto_16324 ?auto_16325 )
      ( !SWITCH_ON ?auto_16322 ?auto_16323 )
      ( !CALIBRATE ?auto_16323 ?auto_16322 ?auto_16324 )
      ( !TURN_TO ?auto_16323 ?auto_16320 ?auto_16324 )
      ( !TAKE_IMAGE ?auto_16323 ?auto_16320 ?auto_16322 ?auto_16321 )
      ( GET-1IMAGE-VERIFY ?auto_16320 ?auto_16321 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_16339 - DIRECTION
      ?auto_16340 - MODE
      ?auto_16342 - DIRECTION
      ?auto_16341 - MODE
    )
    :vars
    (
      ?auto_16344 - INSTRUMENT
      ?auto_16345 - SATELLITE
      ?auto_16343 - DIRECTION
      ?auto_16346 - INSTRUMENT
      ?auto_16347 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16342 ?auto_16339 ) ) ( ON_BOARD ?auto_16344 ?auto_16345 ) ( SUPPORTS ?auto_16344 ?auto_16341 ) ( not ( = ?auto_16342 ?auto_16343 ) ) ( CALIBRATION_TARGET ?auto_16344 ?auto_16343 ) ( not ( = ?auto_16343 ?auto_16339 ) ) ( ON_BOARD ?auto_16346 ?auto_16345 ) ( not ( = ?auto_16344 ?auto_16346 ) ) ( SUPPORTS ?auto_16346 ?auto_16340 ) ( CALIBRATION_TARGET ?auto_16346 ?auto_16343 ) ( POWER_AVAIL ?auto_16345 ) ( POINTING ?auto_16345 ?auto_16347 ) ( not ( = ?auto_16343 ?auto_16347 ) ) ( not ( = ?auto_16339 ?auto_16347 ) ) ( not ( = ?auto_16340 ?auto_16341 ) ) ( not ( = ?auto_16342 ?auto_16347 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_16339 ?auto_16340 )
      ( GET-1IMAGE ?auto_16342 ?auto_16341 )
      ( GET-2IMAGE-VERIFY ?auto_16339 ?auto_16340 ?auto_16342 ?auto_16341 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16500 - DIRECTION
      ?auto_16501 - MODE
      ?auto_16503 - DIRECTION
      ?auto_16502 - MODE
      ?auto_16504 - DIRECTION
      ?auto_16505 - MODE
    )
    :vars
    (
      ?auto_16509 - INSTRUMENT
      ?auto_16507 - SATELLITE
      ?auto_16506 - DIRECTION
      ?auto_16508 - INSTRUMENT
      ?auto_16510 - INSTRUMENT
      ?auto_16511 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16503 ?auto_16500 ) ) ( not ( = ?auto_16504 ?auto_16500 ) ) ( not ( = ?auto_16504 ?auto_16503 ) ) ( ON_BOARD ?auto_16509 ?auto_16507 ) ( SUPPORTS ?auto_16509 ?auto_16505 ) ( not ( = ?auto_16504 ?auto_16506 ) ) ( CALIBRATION_TARGET ?auto_16509 ?auto_16506 ) ( not ( = ?auto_16506 ?auto_16503 ) ) ( ON_BOARD ?auto_16508 ?auto_16507 ) ( not ( = ?auto_16509 ?auto_16508 ) ) ( SUPPORTS ?auto_16508 ?auto_16502 ) ( CALIBRATION_TARGET ?auto_16508 ?auto_16506 ) ( not ( = ?auto_16506 ?auto_16500 ) ) ( ON_BOARD ?auto_16510 ?auto_16507 ) ( not ( = ?auto_16508 ?auto_16510 ) ) ( SUPPORTS ?auto_16510 ?auto_16501 ) ( CALIBRATION_TARGET ?auto_16510 ?auto_16506 ) ( POWER_AVAIL ?auto_16507 ) ( POINTING ?auto_16507 ?auto_16511 ) ( not ( = ?auto_16506 ?auto_16511 ) ) ( not ( = ?auto_16500 ?auto_16511 ) ) ( not ( = ?auto_16501 ?auto_16502 ) ) ( not ( = ?auto_16503 ?auto_16511 ) ) ( not ( = ?auto_16501 ?auto_16505 ) ) ( not ( = ?auto_16502 ?auto_16505 ) ) ( not ( = ?auto_16504 ?auto_16511 ) ) ( not ( = ?auto_16509 ?auto_16510 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16500 ?auto_16501 ?auto_16503 ?auto_16502 )
      ( GET-1IMAGE ?auto_16504 ?auto_16505 )
      ( GET-3IMAGE-VERIFY ?auto_16500 ?auto_16501 ?auto_16503 ?auto_16502 ?auto_16504 ?auto_16505 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_18280 - DIRECTION
      ?auto_18281 - MODE
      ?auto_18283 - DIRECTION
      ?auto_18282 - MODE
      ?auto_18284 - DIRECTION
      ?auto_18285 - MODE
      ?auto_18286 - DIRECTION
      ?auto_18287 - MODE
    )
    :vars
    (
      ?auto_18289 - INSTRUMENT
      ?auto_18291 - SATELLITE
      ?auto_18290 - DIRECTION
      ?auto_18288 - INSTRUMENT
      ?auto_18294 - INSTRUMENT
      ?auto_18292 - INSTRUMENT
      ?auto_18293 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_18283 ?auto_18280 ) ) ( not ( = ?auto_18284 ?auto_18280 ) ) ( not ( = ?auto_18284 ?auto_18283 ) ) ( not ( = ?auto_18286 ?auto_18280 ) ) ( not ( = ?auto_18286 ?auto_18283 ) ) ( not ( = ?auto_18286 ?auto_18284 ) ) ( ON_BOARD ?auto_18289 ?auto_18291 ) ( SUPPORTS ?auto_18289 ?auto_18287 ) ( not ( = ?auto_18286 ?auto_18290 ) ) ( CALIBRATION_TARGET ?auto_18289 ?auto_18290 ) ( not ( = ?auto_18290 ?auto_18284 ) ) ( ON_BOARD ?auto_18288 ?auto_18291 ) ( not ( = ?auto_18289 ?auto_18288 ) ) ( SUPPORTS ?auto_18288 ?auto_18285 ) ( CALIBRATION_TARGET ?auto_18288 ?auto_18290 ) ( not ( = ?auto_18290 ?auto_18283 ) ) ( ON_BOARD ?auto_18294 ?auto_18291 ) ( not ( = ?auto_18288 ?auto_18294 ) ) ( SUPPORTS ?auto_18294 ?auto_18282 ) ( CALIBRATION_TARGET ?auto_18294 ?auto_18290 ) ( not ( = ?auto_18290 ?auto_18280 ) ) ( ON_BOARD ?auto_18292 ?auto_18291 ) ( not ( = ?auto_18294 ?auto_18292 ) ) ( SUPPORTS ?auto_18292 ?auto_18281 ) ( CALIBRATION_TARGET ?auto_18292 ?auto_18290 ) ( POWER_AVAIL ?auto_18291 ) ( POINTING ?auto_18291 ?auto_18293 ) ( not ( = ?auto_18290 ?auto_18293 ) ) ( not ( = ?auto_18280 ?auto_18293 ) ) ( not ( = ?auto_18281 ?auto_18282 ) ) ( not ( = ?auto_18283 ?auto_18293 ) ) ( not ( = ?auto_18281 ?auto_18285 ) ) ( not ( = ?auto_18282 ?auto_18285 ) ) ( not ( = ?auto_18284 ?auto_18293 ) ) ( not ( = ?auto_18288 ?auto_18292 ) ) ( not ( = ?auto_18281 ?auto_18287 ) ) ( not ( = ?auto_18282 ?auto_18287 ) ) ( not ( = ?auto_18285 ?auto_18287 ) ) ( not ( = ?auto_18286 ?auto_18293 ) ) ( not ( = ?auto_18289 ?auto_18294 ) ) ( not ( = ?auto_18289 ?auto_18292 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_18280 ?auto_18281 ?auto_18283 ?auto_18282 ?auto_18284 ?auto_18285 )
      ( GET-1IMAGE ?auto_18286 ?auto_18287 )
      ( GET-4IMAGE-VERIFY ?auto_18280 ?auto_18281 ?auto_18283 ?auto_18282 ?auto_18284 ?auto_18285 ?auto_18286 ?auto_18287 ) )
  )

)

