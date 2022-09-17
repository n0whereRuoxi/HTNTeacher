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
      ?auto_2317 - DIRECTION
      ?auto_2318 - MODE
    )
    :vars
    (
      ?auto_2319 - INSTRUMENT
      ?auto_2320 - SATELLITE
      ?auto_2321 - DIRECTION
      ?auto_2322 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2319 ?auto_2320 ) ( SUPPORTS ?auto_2319 ?auto_2318 ) ( not ( = ?auto_2317 ?auto_2321 ) ) ( CALIBRATION_TARGET ?auto_2319 ?auto_2321 ) ( POWER_AVAIL ?auto_2320 ) ( POINTING ?auto_2320 ?auto_2322 ) ( not ( = ?auto_2321 ?auto_2322 ) ) ( not ( = ?auto_2317 ?auto_2322 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_2320 ?auto_2321 ?auto_2322 )
      ( !SWITCH_ON ?auto_2319 ?auto_2320 )
      ( !CALIBRATE ?auto_2320 ?auto_2319 ?auto_2321 )
      ( !TURN_TO ?auto_2320 ?auto_2317 ?auto_2321 )
      ( !TAKE_IMAGE ?auto_2320 ?auto_2317 ?auto_2319 ?auto_2318 )
      ( GET-1IMAGE-VERIFY ?auto_2317 ?auto_2318 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2325 - DIRECTION
      ?auto_2326 - MODE
    )
    :vars
    (
      ?auto_2327 - INSTRUMENT
      ?auto_2328 - SATELLITE
      ?auto_2329 - DIRECTION
      ?auto_2330 - DIRECTION
      ?auto_2331 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_2327 ?auto_2328 ) ( SUPPORTS ?auto_2327 ?auto_2326 ) ( not ( = ?auto_2325 ?auto_2329 ) ) ( CALIBRATION_TARGET ?auto_2327 ?auto_2329 ) ( POINTING ?auto_2328 ?auto_2330 ) ( not ( = ?auto_2329 ?auto_2330 ) ) ( ON_BOARD ?auto_2331 ?auto_2328 ) ( POWER_ON ?auto_2331 ) ( not ( = ?auto_2325 ?auto_2330 ) ) ( not ( = ?auto_2327 ?auto_2331 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_2331 ?auto_2328 )
      ( !TURN_TO ?auto_2328 ?auto_2329 ?auto_2330 )
      ( !SWITCH_ON ?auto_2327 ?auto_2328 )
      ( !CALIBRATE ?auto_2328 ?auto_2327 ?auto_2329 )
      ( !TURN_TO ?auto_2328 ?auto_2325 ?auto_2329 )
      ( !TAKE_IMAGE ?auto_2328 ?auto_2325 ?auto_2327 ?auto_2326 )
      ( GET-1IMAGE-VERIFY ?auto_2325 ?auto_2326 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_2344 - DIRECTION
      ?auto_2345 - MODE
      ?auto_2347 - DIRECTION
      ?auto_2346 - MODE
    )
    :vars
    (
      ?auto_2351 - INSTRUMENT
      ?auto_2350 - SATELLITE
      ?auto_2349 - DIRECTION
      ?auto_2348 - INSTRUMENT
      ?auto_2352 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2347 ?auto_2344 ) ) ( ON_BOARD ?auto_2351 ?auto_2350 ) ( SUPPORTS ?auto_2351 ?auto_2346 ) ( not ( = ?auto_2347 ?auto_2349 ) ) ( CALIBRATION_TARGET ?auto_2351 ?auto_2349 ) ( not ( = ?auto_2349 ?auto_2344 ) ) ( ON_BOARD ?auto_2348 ?auto_2350 ) ( not ( = ?auto_2351 ?auto_2348 ) ) ( SUPPORTS ?auto_2348 ?auto_2345 ) ( CALIBRATION_TARGET ?auto_2348 ?auto_2349 ) ( POWER_AVAIL ?auto_2350 ) ( POINTING ?auto_2350 ?auto_2352 ) ( not ( = ?auto_2349 ?auto_2352 ) ) ( not ( = ?auto_2344 ?auto_2352 ) ) ( not ( = ?auto_2345 ?auto_2346 ) ) ( not ( = ?auto_2347 ?auto_2352 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2344 ?auto_2345 )
      ( GET-1IMAGE ?auto_2347 ?auto_2346 )
      ( GET-2IMAGE-VERIFY ?auto_2344 ?auto_2345 ?auto_2347 ?auto_2346 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2505 - DIRECTION
      ?auto_2506 - MODE
      ?auto_2508 - DIRECTION
      ?auto_2507 - MODE
      ?auto_2509 - DIRECTION
      ?auto_2510 - MODE
    )
    :vars
    (
      ?auto_2513 - INSTRUMENT
      ?auto_2512 - SATELLITE
      ?auto_2514 - DIRECTION
      ?auto_2511 - INSTRUMENT
      ?auto_2515 - INSTRUMENT
      ?auto_2516 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2508 ?auto_2505 ) ) ( not ( = ?auto_2509 ?auto_2505 ) ) ( not ( = ?auto_2509 ?auto_2508 ) ) ( ON_BOARD ?auto_2513 ?auto_2512 ) ( SUPPORTS ?auto_2513 ?auto_2510 ) ( not ( = ?auto_2509 ?auto_2514 ) ) ( CALIBRATION_TARGET ?auto_2513 ?auto_2514 ) ( not ( = ?auto_2514 ?auto_2508 ) ) ( ON_BOARD ?auto_2511 ?auto_2512 ) ( not ( = ?auto_2513 ?auto_2511 ) ) ( SUPPORTS ?auto_2511 ?auto_2507 ) ( CALIBRATION_TARGET ?auto_2511 ?auto_2514 ) ( not ( = ?auto_2514 ?auto_2505 ) ) ( ON_BOARD ?auto_2515 ?auto_2512 ) ( not ( = ?auto_2511 ?auto_2515 ) ) ( SUPPORTS ?auto_2515 ?auto_2506 ) ( CALIBRATION_TARGET ?auto_2515 ?auto_2514 ) ( POWER_AVAIL ?auto_2512 ) ( POINTING ?auto_2512 ?auto_2516 ) ( not ( = ?auto_2514 ?auto_2516 ) ) ( not ( = ?auto_2505 ?auto_2516 ) ) ( not ( = ?auto_2506 ?auto_2507 ) ) ( not ( = ?auto_2508 ?auto_2516 ) ) ( not ( = ?auto_2506 ?auto_2510 ) ) ( not ( = ?auto_2507 ?auto_2510 ) ) ( not ( = ?auto_2509 ?auto_2516 ) ) ( not ( = ?auto_2513 ?auto_2515 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2505 ?auto_2506 ?auto_2508 ?auto_2507 )
      ( GET-1IMAGE ?auto_2509 ?auto_2510 )
      ( GET-3IMAGE-VERIFY ?auto_2505 ?auto_2506 ?auto_2508 ?auto_2507 ?auto_2509 ?auto_2510 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_4285 - DIRECTION
      ?auto_4286 - MODE
      ?auto_4288 - DIRECTION
      ?auto_4287 - MODE
      ?auto_4289 - DIRECTION
      ?auto_4290 - MODE
      ?auto_4291 - DIRECTION
      ?auto_4292 - MODE
    )
    :vars
    (
      ?auto_4294 - INSTRUMENT
      ?auto_4296 - SATELLITE
      ?auto_4293 - DIRECTION
      ?auto_4295 - INSTRUMENT
      ?auto_4299 - INSTRUMENT
      ?auto_4297 - INSTRUMENT
      ?auto_4298 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4288 ?auto_4285 ) ) ( not ( = ?auto_4289 ?auto_4285 ) ) ( not ( = ?auto_4289 ?auto_4288 ) ) ( not ( = ?auto_4291 ?auto_4285 ) ) ( not ( = ?auto_4291 ?auto_4288 ) ) ( not ( = ?auto_4291 ?auto_4289 ) ) ( ON_BOARD ?auto_4294 ?auto_4296 ) ( SUPPORTS ?auto_4294 ?auto_4292 ) ( not ( = ?auto_4291 ?auto_4293 ) ) ( CALIBRATION_TARGET ?auto_4294 ?auto_4293 ) ( not ( = ?auto_4293 ?auto_4289 ) ) ( ON_BOARD ?auto_4295 ?auto_4296 ) ( not ( = ?auto_4294 ?auto_4295 ) ) ( SUPPORTS ?auto_4295 ?auto_4290 ) ( CALIBRATION_TARGET ?auto_4295 ?auto_4293 ) ( not ( = ?auto_4293 ?auto_4288 ) ) ( ON_BOARD ?auto_4299 ?auto_4296 ) ( not ( = ?auto_4295 ?auto_4299 ) ) ( SUPPORTS ?auto_4299 ?auto_4287 ) ( CALIBRATION_TARGET ?auto_4299 ?auto_4293 ) ( not ( = ?auto_4293 ?auto_4285 ) ) ( ON_BOARD ?auto_4297 ?auto_4296 ) ( not ( = ?auto_4299 ?auto_4297 ) ) ( SUPPORTS ?auto_4297 ?auto_4286 ) ( CALIBRATION_TARGET ?auto_4297 ?auto_4293 ) ( POWER_AVAIL ?auto_4296 ) ( POINTING ?auto_4296 ?auto_4298 ) ( not ( = ?auto_4293 ?auto_4298 ) ) ( not ( = ?auto_4285 ?auto_4298 ) ) ( not ( = ?auto_4286 ?auto_4287 ) ) ( not ( = ?auto_4288 ?auto_4298 ) ) ( not ( = ?auto_4286 ?auto_4290 ) ) ( not ( = ?auto_4287 ?auto_4290 ) ) ( not ( = ?auto_4289 ?auto_4298 ) ) ( not ( = ?auto_4295 ?auto_4297 ) ) ( not ( = ?auto_4286 ?auto_4292 ) ) ( not ( = ?auto_4287 ?auto_4292 ) ) ( not ( = ?auto_4290 ?auto_4292 ) ) ( not ( = ?auto_4291 ?auto_4298 ) ) ( not ( = ?auto_4294 ?auto_4299 ) ) ( not ( = ?auto_4294 ?auto_4297 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_4285 ?auto_4286 ?auto_4288 ?auto_4287 ?auto_4289 ?auto_4290 )
      ( GET-1IMAGE ?auto_4291 ?auto_4292 )
      ( GET-4IMAGE-VERIFY ?auto_4285 ?auto_4286 ?auto_4288 ?auto_4287 ?auto_4289 ?auto_4290 ?auto_4291 ?auto_4292 ) )
  )

)

