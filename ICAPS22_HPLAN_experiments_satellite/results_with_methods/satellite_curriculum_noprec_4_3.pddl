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
      ?auto_17100 - DIRECTION
      ?auto_17101 - MODE
    )
    :vars
    (
      ?auto_17102 - INSTRUMENT
      ?auto_17103 - SATELLITE
      ?auto_17104 - DIRECTION
      ?auto_17105 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_17102 ?auto_17103 ) ( SUPPORTS ?auto_17102 ?auto_17101 ) ( not ( = ?auto_17100 ?auto_17104 ) ) ( CALIBRATION_TARGET ?auto_17102 ?auto_17104 ) ( POWER_AVAIL ?auto_17103 ) ( POINTING ?auto_17103 ?auto_17105 ) ( not ( = ?auto_17104 ?auto_17105 ) ) ( not ( = ?auto_17100 ?auto_17105 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_17103 ?auto_17104 ?auto_17105 )
      ( !SWITCH_ON ?auto_17102 ?auto_17103 )
      ( !CALIBRATE ?auto_17103 ?auto_17102 ?auto_17104 )
      ( !TURN_TO ?auto_17103 ?auto_17100 ?auto_17104 )
      ( !TAKE_IMAGE ?auto_17103 ?auto_17100 ?auto_17102 ?auto_17101 )
      ( GET-1IMAGE-VERIFY ?auto_17100 ?auto_17101 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_17108 - DIRECTION
      ?auto_17109 - MODE
    )
    :vars
    (
      ?auto_17110 - INSTRUMENT
      ?auto_17111 - SATELLITE
      ?auto_17112 - DIRECTION
      ?auto_17113 - DIRECTION
      ?auto_17114 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17110 ?auto_17111 ) ( SUPPORTS ?auto_17110 ?auto_17109 ) ( not ( = ?auto_17108 ?auto_17112 ) ) ( CALIBRATION_TARGET ?auto_17110 ?auto_17112 ) ( POINTING ?auto_17111 ?auto_17113 ) ( not ( = ?auto_17112 ?auto_17113 ) ) ( ON_BOARD ?auto_17114 ?auto_17111 ) ( POWER_ON ?auto_17114 ) ( not ( = ?auto_17108 ?auto_17113 ) ) ( not ( = ?auto_17110 ?auto_17114 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_17114 ?auto_17111 )
      ( !TURN_TO ?auto_17111 ?auto_17112 ?auto_17113 )
      ( !SWITCH_ON ?auto_17110 ?auto_17111 )
      ( !CALIBRATE ?auto_17111 ?auto_17110 ?auto_17112 )
      ( !TURN_TO ?auto_17111 ?auto_17108 ?auto_17112 )
      ( !TAKE_IMAGE ?auto_17111 ?auto_17108 ?auto_17110 ?auto_17109 )
      ( GET-1IMAGE-VERIFY ?auto_17108 ?auto_17109 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_17127 - DIRECTION
      ?auto_17128 - MODE
      ?auto_17130 - DIRECTION
      ?auto_17129 - MODE
    )
    :vars
    (
      ?auto_17131 - INSTRUMENT
      ?auto_17132 - SATELLITE
      ?auto_17133 - DIRECTION
      ?auto_17134 - INSTRUMENT
      ?auto_17135 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_17131 ?auto_17132 ) ( SUPPORTS ?auto_17131 ?auto_17129 ) ( not ( = ?auto_17130 ?auto_17133 ) ) ( CALIBRATION_TARGET ?auto_17131 ?auto_17133 ) ( not ( = ?auto_17133 ?auto_17127 ) ) ( ON_BOARD ?auto_17134 ?auto_17132 ) ( not ( = ?auto_17130 ?auto_17127 ) ) ( not ( = ?auto_17131 ?auto_17134 ) ) ( SUPPORTS ?auto_17134 ?auto_17128 ) ( CALIBRATION_TARGET ?auto_17134 ?auto_17133 ) ( POWER_AVAIL ?auto_17132 ) ( POINTING ?auto_17132 ?auto_17135 ) ( not ( = ?auto_17133 ?auto_17135 ) ) ( not ( = ?auto_17127 ?auto_17135 ) ) ( not ( = ?auto_17128 ?auto_17129 ) ) ( not ( = ?auto_17130 ?auto_17135 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_17127 ?auto_17128 )
      ( GET-1IMAGE ?auto_17130 ?auto_17129 )
      ( GET-2IMAGE-VERIFY ?auto_17127 ?auto_17128 ?auto_17130 ?auto_17129 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_17136 - DIRECTION
      ?auto_17137 - MODE
      ?auto_17139 - DIRECTION
      ?auto_17138 - MODE
    )
    :vars
    (
      ?auto_17140 - INSTRUMENT
      ?auto_17141 - SATELLITE
      ?auto_17142 - DIRECTION
      ?auto_17143 - INSTRUMENT
      ?auto_17144 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_17140 ?auto_17141 ) ( SUPPORTS ?auto_17140 ?auto_17137 ) ( not ( = ?auto_17136 ?auto_17142 ) ) ( CALIBRATION_TARGET ?auto_17140 ?auto_17142 ) ( not ( = ?auto_17142 ?auto_17139 ) ) ( ON_BOARD ?auto_17143 ?auto_17141 ) ( not ( = ?auto_17136 ?auto_17139 ) ) ( not ( = ?auto_17140 ?auto_17143 ) ) ( SUPPORTS ?auto_17143 ?auto_17138 ) ( CALIBRATION_TARGET ?auto_17143 ?auto_17142 ) ( POWER_AVAIL ?auto_17141 ) ( POINTING ?auto_17141 ?auto_17144 ) ( not ( = ?auto_17142 ?auto_17144 ) ) ( not ( = ?auto_17139 ?auto_17144 ) ) ( not ( = ?auto_17138 ?auto_17137 ) ) ( not ( = ?auto_17136 ?auto_17144 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17139 ?auto_17138 ?auto_17136 ?auto_17137 )
      ( GET-2IMAGE-VERIFY ?auto_17136 ?auto_17137 ?auto_17139 ?auto_17138 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_17158 - DIRECTION
      ?auto_17159 - MODE
    )
    :vars
    (
      ?auto_17160 - INSTRUMENT
      ?auto_17161 - SATELLITE
      ?auto_17162 - DIRECTION
      ?auto_17163 - DIRECTION
      ?auto_17164 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17160 ?auto_17161 ) ( SUPPORTS ?auto_17160 ?auto_17159 ) ( not ( = ?auto_17158 ?auto_17162 ) ) ( CALIBRATION_TARGET ?auto_17160 ?auto_17162 ) ( POINTING ?auto_17161 ?auto_17163 ) ( not ( = ?auto_17162 ?auto_17163 ) ) ( ON_BOARD ?auto_17164 ?auto_17161 ) ( POWER_ON ?auto_17164 ) ( not ( = ?auto_17158 ?auto_17163 ) ) ( not ( = ?auto_17160 ?auto_17164 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_17164 ?auto_17161 )
      ( !TURN_TO ?auto_17161 ?auto_17162 ?auto_17163 )
      ( !SWITCH_ON ?auto_17160 ?auto_17161 )
      ( !CALIBRATE ?auto_17161 ?auto_17160 ?auto_17162 )
      ( !TURN_TO ?auto_17161 ?auto_17158 ?auto_17162 )
      ( !TAKE_IMAGE ?auto_17161 ?auto_17158 ?auto_17160 ?auto_17159 )
      ( GET-1IMAGE-VERIFY ?auto_17158 ?auto_17159 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17293 - DIRECTION
      ?auto_17294 - MODE
      ?auto_17296 - DIRECTION
      ?auto_17295 - MODE
      ?auto_17297 - DIRECTION
      ?auto_17298 - MODE
    )
    :vars
    (
      ?auto_17299 - INSTRUMENT
      ?auto_17300 - SATELLITE
      ?auto_17302 - DIRECTION
      ?auto_17301 - INSTRUMENT
      ?auto_17304 - INSTRUMENT
      ?auto_17303 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_17299 ?auto_17300 ) ( SUPPORTS ?auto_17299 ?auto_17298 ) ( not ( = ?auto_17297 ?auto_17302 ) ) ( CALIBRATION_TARGET ?auto_17299 ?auto_17302 ) ( not ( = ?auto_17302 ?auto_17296 ) ) ( ON_BOARD ?auto_17301 ?auto_17300 ) ( not ( = ?auto_17297 ?auto_17296 ) ) ( not ( = ?auto_17299 ?auto_17301 ) ) ( SUPPORTS ?auto_17301 ?auto_17295 ) ( CALIBRATION_TARGET ?auto_17301 ?auto_17302 ) ( not ( = ?auto_17302 ?auto_17293 ) ) ( ON_BOARD ?auto_17304 ?auto_17300 ) ( not ( = ?auto_17296 ?auto_17293 ) ) ( not ( = ?auto_17301 ?auto_17304 ) ) ( SUPPORTS ?auto_17304 ?auto_17294 ) ( CALIBRATION_TARGET ?auto_17304 ?auto_17302 ) ( POWER_AVAIL ?auto_17300 ) ( POINTING ?auto_17300 ?auto_17303 ) ( not ( = ?auto_17302 ?auto_17303 ) ) ( not ( = ?auto_17293 ?auto_17303 ) ) ( not ( = ?auto_17294 ?auto_17295 ) ) ( not ( = ?auto_17296 ?auto_17303 ) ) ( not ( = ?auto_17293 ?auto_17297 ) ) ( not ( = ?auto_17294 ?auto_17298 ) ) ( not ( = ?auto_17295 ?auto_17298 ) ) ( not ( = ?auto_17297 ?auto_17303 ) ) ( not ( = ?auto_17299 ?auto_17304 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17296 ?auto_17295 ?auto_17293 ?auto_17294 )
      ( GET-1IMAGE ?auto_17297 ?auto_17298 )
      ( GET-3IMAGE-VERIFY ?auto_17293 ?auto_17294 ?auto_17296 ?auto_17295 ?auto_17297 ?auto_17298 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17319 - DIRECTION
      ?auto_17320 - MODE
      ?auto_17322 - DIRECTION
      ?auto_17321 - MODE
      ?auto_17323 - DIRECTION
      ?auto_17324 - MODE
    )
    :vars
    (
      ?auto_17329 - INSTRUMENT
      ?auto_17327 - SATELLITE
      ?auto_17330 - DIRECTION
      ?auto_17328 - INSTRUMENT
      ?auto_17326 - INSTRUMENT
      ?auto_17325 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_17329 ?auto_17327 ) ( SUPPORTS ?auto_17329 ?auto_17321 ) ( not ( = ?auto_17322 ?auto_17330 ) ) ( CALIBRATION_TARGET ?auto_17329 ?auto_17330 ) ( not ( = ?auto_17330 ?auto_17323 ) ) ( ON_BOARD ?auto_17328 ?auto_17327 ) ( not ( = ?auto_17322 ?auto_17323 ) ) ( not ( = ?auto_17329 ?auto_17328 ) ) ( SUPPORTS ?auto_17328 ?auto_17324 ) ( CALIBRATION_TARGET ?auto_17328 ?auto_17330 ) ( not ( = ?auto_17330 ?auto_17319 ) ) ( ON_BOARD ?auto_17326 ?auto_17327 ) ( not ( = ?auto_17323 ?auto_17319 ) ) ( not ( = ?auto_17328 ?auto_17326 ) ) ( SUPPORTS ?auto_17326 ?auto_17320 ) ( CALIBRATION_TARGET ?auto_17326 ?auto_17330 ) ( POWER_AVAIL ?auto_17327 ) ( POINTING ?auto_17327 ?auto_17325 ) ( not ( = ?auto_17330 ?auto_17325 ) ) ( not ( = ?auto_17319 ?auto_17325 ) ) ( not ( = ?auto_17320 ?auto_17324 ) ) ( not ( = ?auto_17323 ?auto_17325 ) ) ( not ( = ?auto_17319 ?auto_17322 ) ) ( not ( = ?auto_17320 ?auto_17321 ) ) ( not ( = ?auto_17324 ?auto_17321 ) ) ( not ( = ?auto_17322 ?auto_17325 ) ) ( not ( = ?auto_17329 ?auto_17326 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_17319 ?auto_17320 ?auto_17323 ?auto_17324 ?auto_17322 ?auto_17321 )
      ( GET-3IMAGE-VERIFY ?auto_17319 ?auto_17320 ?auto_17322 ?auto_17321 ?auto_17323 ?auto_17324 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17345 - DIRECTION
      ?auto_17346 - MODE
      ?auto_17348 - DIRECTION
      ?auto_17347 - MODE
      ?auto_17349 - DIRECTION
      ?auto_17350 - MODE
    )
    :vars
    (
      ?auto_17355 - INSTRUMENT
      ?auto_17356 - SATELLITE
      ?auto_17351 - DIRECTION
      ?auto_17354 - INSTRUMENT
      ?auto_17353 - INSTRUMENT
      ?auto_17352 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_17355 ?auto_17356 ) ( SUPPORTS ?auto_17355 ?auto_17350 ) ( not ( = ?auto_17349 ?auto_17351 ) ) ( CALIBRATION_TARGET ?auto_17355 ?auto_17351 ) ( not ( = ?auto_17351 ?auto_17345 ) ) ( ON_BOARD ?auto_17354 ?auto_17356 ) ( not ( = ?auto_17349 ?auto_17345 ) ) ( not ( = ?auto_17355 ?auto_17354 ) ) ( SUPPORTS ?auto_17354 ?auto_17346 ) ( CALIBRATION_TARGET ?auto_17354 ?auto_17351 ) ( not ( = ?auto_17351 ?auto_17348 ) ) ( ON_BOARD ?auto_17353 ?auto_17356 ) ( not ( = ?auto_17345 ?auto_17348 ) ) ( not ( = ?auto_17354 ?auto_17353 ) ) ( SUPPORTS ?auto_17353 ?auto_17347 ) ( CALIBRATION_TARGET ?auto_17353 ?auto_17351 ) ( POWER_AVAIL ?auto_17356 ) ( POINTING ?auto_17356 ?auto_17352 ) ( not ( = ?auto_17351 ?auto_17352 ) ) ( not ( = ?auto_17348 ?auto_17352 ) ) ( not ( = ?auto_17347 ?auto_17346 ) ) ( not ( = ?auto_17345 ?auto_17352 ) ) ( not ( = ?auto_17348 ?auto_17349 ) ) ( not ( = ?auto_17347 ?auto_17350 ) ) ( not ( = ?auto_17346 ?auto_17350 ) ) ( not ( = ?auto_17349 ?auto_17352 ) ) ( not ( = ?auto_17355 ?auto_17353 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_17348 ?auto_17347 ?auto_17349 ?auto_17350 ?auto_17345 ?auto_17346 )
      ( GET-3IMAGE-VERIFY ?auto_17345 ?auto_17346 ?auto_17348 ?auto_17347 ?auto_17349 ?auto_17350 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17371 - DIRECTION
      ?auto_17372 - MODE
      ?auto_17374 - DIRECTION
      ?auto_17373 - MODE
      ?auto_17375 - DIRECTION
      ?auto_17376 - MODE
    )
    :vars
    (
      ?auto_17381 - INSTRUMENT
      ?auto_17382 - SATELLITE
      ?auto_17377 - DIRECTION
      ?auto_17380 - INSTRUMENT
      ?auto_17379 - INSTRUMENT
      ?auto_17378 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_17381 ?auto_17382 ) ( SUPPORTS ?auto_17381 ?auto_17373 ) ( not ( = ?auto_17374 ?auto_17377 ) ) ( CALIBRATION_TARGET ?auto_17381 ?auto_17377 ) ( not ( = ?auto_17377 ?auto_17371 ) ) ( ON_BOARD ?auto_17380 ?auto_17382 ) ( not ( = ?auto_17374 ?auto_17371 ) ) ( not ( = ?auto_17381 ?auto_17380 ) ) ( SUPPORTS ?auto_17380 ?auto_17372 ) ( CALIBRATION_TARGET ?auto_17380 ?auto_17377 ) ( not ( = ?auto_17377 ?auto_17375 ) ) ( ON_BOARD ?auto_17379 ?auto_17382 ) ( not ( = ?auto_17371 ?auto_17375 ) ) ( not ( = ?auto_17380 ?auto_17379 ) ) ( SUPPORTS ?auto_17379 ?auto_17376 ) ( CALIBRATION_TARGET ?auto_17379 ?auto_17377 ) ( POWER_AVAIL ?auto_17382 ) ( POINTING ?auto_17382 ?auto_17378 ) ( not ( = ?auto_17377 ?auto_17378 ) ) ( not ( = ?auto_17375 ?auto_17378 ) ) ( not ( = ?auto_17376 ?auto_17372 ) ) ( not ( = ?auto_17371 ?auto_17378 ) ) ( not ( = ?auto_17375 ?auto_17374 ) ) ( not ( = ?auto_17376 ?auto_17373 ) ) ( not ( = ?auto_17372 ?auto_17373 ) ) ( not ( = ?auto_17374 ?auto_17378 ) ) ( not ( = ?auto_17381 ?auto_17379 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_17375 ?auto_17376 ?auto_17374 ?auto_17373 ?auto_17371 ?auto_17372 )
      ( GET-3IMAGE-VERIFY ?auto_17371 ?auto_17372 ?auto_17374 ?auto_17373 ?auto_17375 ?auto_17376 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17425 - DIRECTION
      ?auto_17426 - MODE
      ?auto_17428 - DIRECTION
      ?auto_17427 - MODE
      ?auto_17429 - DIRECTION
      ?auto_17430 - MODE
    )
    :vars
    (
      ?auto_17435 - INSTRUMENT
      ?auto_17436 - SATELLITE
      ?auto_17431 - DIRECTION
      ?auto_17434 - INSTRUMENT
      ?auto_17433 - INSTRUMENT
      ?auto_17432 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_17435 ?auto_17436 ) ( SUPPORTS ?auto_17435 ?auto_17426 ) ( not ( = ?auto_17425 ?auto_17431 ) ) ( CALIBRATION_TARGET ?auto_17435 ?auto_17431 ) ( not ( = ?auto_17431 ?auto_17429 ) ) ( ON_BOARD ?auto_17434 ?auto_17436 ) ( not ( = ?auto_17425 ?auto_17429 ) ) ( not ( = ?auto_17435 ?auto_17434 ) ) ( SUPPORTS ?auto_17434 ?auto_17430 ) ( CALIBRATION_TARGET ?auto_17434 ?auto_17431 ) ( not ( = ?auto_17431 ?auto_17428 ) ) ( ON_BOARD ?auto_17433 ?auto_17436 ) ( not ( = ?auto_17429 ?auto_17428 ) ) ( not ( = ?auto_17434 ?auto_17433 ) ) ( SUPPORTS ?auto_17433 ?auto_17427 ) ( CALIBRATION_TARGET ?auto_17433 ?auto_17431 ) ( POWER_AVAIL ?auto_17436 ) ( POINTING ?auto_17436 ?auto_17432 ) ( not ( = ?auto_17431 ?auto_17432 ) ) ( not ( = ?auto_17428 ?auto_17432 ) ) ( not ( = ?auto_17427 ?auto_17430 ) ) ( not ( = ?auto_17429 ?auto_17432 ) ) ( not ( = ?auto_17428 ?auto_17425 ) ) ( not ( = ?auto_17427 ?auto_17426 ) ) ( not ( = ?auto_17430 ?auto_17426 ) ) ( not ( = ?auto_17425 ?auto_17432 ) ) ( not ( = ?auto_17435 ?auto_17433 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_17428 ?auto_17427 ?auto_17425 ?auto_17426 ?auto_17429 ?auto_17430 )
      ( GET-3IMAGE-VERIFY ?auto_17425 ?auto_17426 ?auto_17428 ?auto_17427 ?auto_17429 ?auto_17430 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17451 - DIRECTION
      ?auto_17452 - MODE
      ?auto_17454 - DIRECTION
      ?auto_17453 - MODE
      ?auto_17455 - DIRECTION
      ?auto_17456 - MODE
    )
    :vars
    (
      ?auto_17461 - INSTRUMENT
      ?auto_17462 - SATELLITE
      ?auto_17457 - DIRECTION
      ?auto_17460 - INSTRUMENT
      ?auto_17459 - INSTRUMENT
      ?auto_17458 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_17461 ?auto_17462 ) ( SUPPORTS ?auto_17461 ?auto_17452 ) ( not ( = ?auto_17451 ?auto_17457 ) ) ( CALIBRATION_TARGET ?auto_17461 ?auto_17457 ) ( not ( = ?auto_17457 ?auto_17454 ) ) ( ON_BOARD ?auto_17460 ?auto_17462 ) ( not ( = ?auto_17451 ?auto_17454 ) ) ( not ( = ?auto_17461 ?auto_17460 ) ) ( SUPPORTS ?auto_17460 ?auto_17453 ) ( CALIBRATION_TARGET ?auto_17460 ?auto_17457 ) ( not ( = ?auto_17457 ?auto_17455 ) ) ( ON_BOARD ?auto_17459 ?auto_17462 ) ( not ( = ?auto_17454 ?auto_17455 ) ) ( not ( = ?auto_17460 ?auto_17459 ) ) ( SUPPORTS ?auto_17459 ?auto_17456 ) ( CALIBRATION_TARGET ?auto_17459 ?auto_17457 ) ( POWER_AVAIL ?auto_17462 ) ( POINTING ?auto_17462 ?auto_17458 ) ( not ( = ?auto_17457 ?auto_17458 ) ) ( not ( = ?auto_17455 ?auto_17458 ) ) ( not ( = ?auto_17456 ?auto_17453 ) ) ( not ( = ?auto_17454 ?auto_17458 ) ) ( not ( = ?auto_17455 ?auto_17451 ) ) ( not ( = ?auto_17456 ?auto_17452 ) ) ( not ( = ?auto_17453 ?auto_17452 ) ) ( not ( = ?auto_17451 ?auto_17458 ) ) ( not ( = ?auto_17461 ?auto_17459 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_17455 ?auto_17456 ?auto_17451 ?auto_17452 ?auto_17454 ?auto_17453 )
      ( GET-3IMAGE-VERIFY ?auto_17451 ?auto_17452 ?auto_17454 ?auto_17453 ?auto_17455 ?auto_17456 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_17537 - DIRECTION
      ?auto_17538 - MODE
    )
    :vars
    (
      ?auto_17539 - INSTRUMENT
      ?auto_17540 - SATELLITE
      ?auto_17541 - DIRECTION
      ?auto_17542 - DIRECTION
      ?auto_17543 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17539 ?auto_17540 ) ( SUPPORTS ?auto_17539 ?auto_17538 ) ( not ( = ?auto_17537 ?auto_17541 ) ) ( CALIBRATION_TARGET ?auto_17539 ?auto_17541 ) ( POINTING ?auto_17540 ?auto_17542 ) ( not ( = ?auto_17541 ?auto_17542 ) ) ( ON_BOARD ?auto_17543 ?auto_17540 ) ( POWER_ON ?auto_17543 ) ( not ( = ?auto_17537 ?auto_17542 ) ) ( not ( = ?auto_17539 ?auto_17543 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_17543 ?auto_17540 )
      ( !TURN_TO ?auto_17540 ?auto_17541 ?auto_17542 )
      ( !SWITCH_ON ?auto_17539 ?auto_17540 )
      ( !CALIBRATE ?auto_17540 ?auto_17539 ?auto_17541 )
      ( !TURN_TO ?auto_17540 ?auto_17537 ?auto_17541 )
      ( !TAKE_IMAGE ?auto_17540 ?auto_17537 ?auto_17539 ?auto_17538 )
      ( GET-1IMAGE-VERIFY ?auto_17537 ?auto_17538 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_19103 - DIRECTION
      ?auto_19104 - MODE
      ?auto_19106 - DIRECTION
      ?auto_19105 - MODE
      ?auto_19107 - DIRECTION
      ?auto_19108 - MODE
      ?auto_19109 - DIRECTION
      ?auto_19110 - MODE
    )
    :vars
    (
      ?auto_19114 - INSTRUMENT
      ?auto_19111 - SATELLITE
      ?auto_19112 - DIRECTION
      ?auto_19113 - INSTRUMENT
      ?auto_19117 - INSTRUMENT
      ?auto_19116 - INSTRUMENT
      ?auto_19115 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_19114 ?auto_19111 ) ( SUPPORTS ?auto_19114 ?auto_19110 ) ( not ( = ?auto_19109 ?auto_19112 ) ) ( CALIBRATION_TARGET ?auto_19114 ?auto_19112 ) ( not ( = ?auto_19112 ?auto_19107 ) ) ( ON_BOARD ?auto_19113 ?auto_19111 ) ( not ( = ?auto_19109 ?auto_19107 ) ) ( not ( = ?auto_19114 ?auto_19113 ) ) ( SUPPORTS ?auto_19113 ?auto_19108 ) ( CALIBRATION_TARGET ?auto_19113 ?auto_19112 ) ( not ( = ?auto_19112 ?auto_19106 ) ) ( ON_BOARD ?auto_19117 ?auto_19111 ) ( not ( = ?auto_19107 ?auto_19106 ) ) ( not ( = ?auto_19113 ?auto_19117 ) ) ( SUPPORTS ?auto_19117 ?auto_19105 ) ( CALIBRATION_TARGET ?auto_19117 ?auto_19112 ) ( not ( = ?auto_19112 ?auto_19103 ) ) ( ON_BOARD ?auto_19116 ?auto_19111 ) ( not ( = ?auto_19106 ?auto_19103 ) ) ( not ( = ?auto_19117 ?auto_19116 ) ) ( SUPPORTS ?auto_19116 ?auto_19104 ) ( CALIBRATION_TARGET ?auto_19116 ?auto_19112 ) ( POWER_AVAIL ?auto_19111 ) ( POINTING ?auto_19111 ?auto_19115 ) ( not ( = ?auto_19112 ?auto_19115 ) ) ( not ( = ?auto_19103 ?auto_19115 ) ) ( not ( = ?auto_19104 ?auto_19105 ) ) ( not ( = ?auto_19106 ?auto_19115 ) ) ( not ( = ?auto_19103 ?auto_19107 ) ) ( not ( = ?auto_19104 ?auto_19108 ) ) ( not ( = ?auto_19105 ?auto_19108 ) ) ( not ( = ?auto_19107 ?auto_19115 ) ) ( not ( = ?auto_19113 ?auto_19116 ) ) ( not ( = ?auto_19103 ?auto_19109 ) ) ( not ( = ?auto_19104 ?auto_19110 ) ) ( not ( = ?auto_19106 ?auto_19109 ) ) ( not ( = ?auto_19105 ?auto_19110 ) ) ( not ( = ?auto_19108 ?auto_19110 ) ) ( not ( = ?auto_19109 ?auto_19115 ) ) ( not ( = ?auto_19114 ?auto_19117 ) ) ( not ( = ?auto_19114 ?auto_19116 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_19103 ?auto_19104 ?auto_19107 ?auto_19108 ?auto_19106 ?auto_19105 )
      ( GET-1IMAGE ?auto_19109 ?auto_19110 )
      ( GET-4IMAGE-VERIFY ?auto_19103 ?auto_19104 ?auto_19106 ?auto_19105 ?auto_19107 ?auto_19108 ?auto_19109 ?auto_19110 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_19152 - DIRECTION
      ?auto_19153 - MODE
      ?auto_19155 - DIRECTION
      ?auto_19154 - MODE
      ?auto_19156 - DIRECTION
      ?auto_19157 - MODE
      ?auto_19158 - DIRECTION
      ?auto_19159 - MODE
    )
    :vars
    (
      ?auto_19164 - INSTRUMENT
      ?auto_19165 - SATELLITE
      ?auto_19163 - DIRECTION
      ?auto_19160 - INSTRUMENT
      ?auto_19166 - INSTRUMENT
      ?auto_19162 - INSTRUMENT
      ?auto_19161 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_19164 ?auto_19165 ) ( SUPPORTS ?auto_19164 ?auto_19157 ) ( not ( = ?auto_19156 ?auto_19163 ) ) ( CALIBRATION_TARGET ?auto_19164 ?auto_19163 ) ( not ( = ?auto_19163 ?auto_19158 ) ) ( ON_BOARD ?auto_19160 ?auto_19165 ) ( not ( = ?auto_19156 ?auto_19158 ) ) ( not ( = ?auto_19164 ?auto_19160 ) ) ( SUPPORTS ?auto_19160 ?auto_19159 ) ( CALIBRATION_TARGET ?auto_19160 ?auto_19163 ) ( not ( = ?auto_19163 ?auto_19155 ) ) ( ON_BOARD ?auto_19166 ?auto_19165 ) ( not ( = ?auto_19158 ?auto_19155 ) ) ( not ( = ?auto_19160 ?auto_19166 ) ) ( SUPPORTS ?auto_19166 ?auto_19154 ) ( CALIBRATION_TARGET ?auto_19166 ?auto_19163 ) ( not ( = ?auto_19163 ?auto_19152 ) ) ( ON_BOARD ?auto_19162 ?auto_19165 ) ( not ( = ?auto_19155 ?auto_19152 ) ) ( not ( = ?auto_19166 ?auto_19162 ) ) ( SUPPORTS ?auto_19162 ?auto_19153 ) ( CALIBRATION_TARGET ?auto_19162 ?auto_19163 ) ( POWER_AVAIL ?auto_19165 ) ( POINTING ?auto_19165 ?auto_19161 ) ( not ( = ?auto_19163 ?auto_19161 ) ) ( not ( = ?auto_19152 ?auto_19161 ) ) ( not ( = ?auto_19153 ?auto_19154 ) ) ( not ( = ?auto_19155 ?auto_19161 ) ) ( not ( = ?auto_19152 ?auto_19158 ) ) ( not ( = ?auto_19153 ?auto_19159 ) ) ( not ( = ?auto_19154 ?auto_19159 ) ) ( not ( = ?auto_19158 ?auto_19161 ) ) ( not ( = ?auto_19160 ?auto_19162 ) ) ( not ( = ?auto_19152 ?auto_19156 ) ) ( not ( = ?auto_19153 ?auto_19157 ) ) ( not ( = ?auto_19155 ?auto_19156 ) ) ( not ( = ?auto_19154 ?auto_19157 ) ) ( not ( = ?auto_19159 ?auto_19157 ) ) ( not ( = ?auto_19156 ?auto_19161 ) ) ( not ( = ?auto_19164 ?auto_19166 ) ) ( not ( = ?auto_19164 ?auto_19162 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_19152 ?auto_19153 ?auto_19155 ?auto_19154 ?auto_19158 ?auto_19159 ?auto_19156 ?auto_19157 )
      ( GET-4IMAGE-VERIFY ?auto_19152 ?auto_19153 ?auto_19155 ?auto_19154 ?auto_19156 ?auto_19157 ?auto_19158 ?auto_19159 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_19201 - DIRECTION
      ?auto_19202 - MODE
      ?auto_19204 - DIRECTION
      ?auto_19203 - MODE
      ?auto_19205 - DIRECTION
      ?auto_19206 - MODE
      ?auto_19207 - DIRECTION
      ?auto_19208 - MODE
    )
    :vars
    (
      ?auto_19210 - INSTRUMENT
      ?auto_19213 - SATELLITE
      ?auto_19212 - DIRECTION
      ?auto_19214 - INSTRUMENT
      ?auto_19211 - INSTRUMENT
      ?auto_19209 - INSTRUMENT
      ?auto_19215 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_19210 ?auto_19213 ) ( SUPPORTS ?auto_19210 ?auto_19208 ) ( not ( = ?auto_19207 ?auto_19212 ) ) ( CALIBRATION_TARGET ?auto_19210 ?auto_19212 ) ( not ( = ?auto_19212 ?auto_19204 ) ) ( ON_BOARD ?auto_19214 ?auto_19213 ) ( not ( = ?auto_19207 ?auto_19204 ) ) ( not ( = ?auto_19210 ?auto_19214 ) ) ( SUPPORTS ?auto_19214 ?auto_19203 ) ( CALIBRATION_TARGET ?auto_19214 ?auto_19212 ) ( not ( = ?auto_19212 ?auto_19205 ) ) ( ON_BOARD ?auto_19211 ?auto_19213 ) ( not ( = ?auto_19204 ?auto_19205 ) ) ( not ( = ?auto_19214 ?auto_19211 ) ) ( SUPPORTS ?auto_19211 ?auto_19206 ) ( CALIBRATION_TARGET ?auto_19211 ?auto_19212 ) ( not ( = ?auto_19212 ?auto_19201 ) ) ( ON_BOARD ?auto_19209 ?auto_19213 ) ( not ( = ?auto_19205 ?auto_19201 ) ) ( not ( = ?auto_19211 ?auto_19209 ) ) ( SUPPORTS ?auto_19209 ?auto_19202 ) ( CALIBRATION_TARGET ?auto_19209 ?auto_19212 ) ( POWER_AVAIL ?auto_19213 ) ( POINTING ?auto_19213 ?auto_19215 ) ( not ( = ?auto_19212 ?auto_19215 ) ) ( not ( = ?auto_19201 ?auto_19215 ) ) ( not ( = ?auto_19202 ?auto_19206 ) ) ( not ( = ?auto_19205 ?auto_19215 ) ) ( not ( = ?auto_19201 ?auto_19204 ) ) ( not ( = ?auto_19202 ?auto_19203 ) ) ( not ( = ?auto_19206 ?auto_19203 ) ) ( not ( = ?auto_19204 ?auto_19215 ) ) ( not ( = ?auto_19214 ?auto_19209 ) ) ( not ( = ?auto_19201 ?auto_19207 ) ) ( not ( = ?auto_19202 ?auto_19208 ) ) ( not ( = ?auto_19205 ?auto_19207 ) ) ( not ( = ?auto_19206 ?auto_19208 ) ) ( not ( = ?auto_19203 ?auto_19208 ) ) ( not ( = ?auto_19207 ?auto_19215 ) ) ( not ( = ?auto_19210 ?auto_19211 ) ) ( not ( = ?auto_19210 ?auto_19209 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_19201 ?auto_19202 ?auto_19205 ?auto_19206 ?auto_19207 ?auto_19208 ?auto_19204 ?auto_19203 )
      ( GET-4IMAGE-VERIFY ?auto_19201 ?auto_19202 ?auto_19204 ?auto_19203 ?auto_19205 ?auto_19206 ?auto_19207 ?auto_19208 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_19250 - DIRECTION
      ?auto_19251 - MODE
      ?auto_19253 - DIRECTION
      ?auto_19252 - MODE
      ?auto_19254 - DIRECTION
      ?auto_19255 - MODE
      ?auto_19256 - DIRECTION
      ?auto_19257 - MODE
    )
    :vars
    (
      ?auto_19259 - INSTRUMENT
      ?auto_19262 - SATELLITE
      ?auto_19261 - DIRECTION
      ?auto_19263 - INSTRUMENT
      ?auto_19260 - INSTRUMENT
      ?auto_19258 - INSTRUMENT
      ?auto_19264 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_19259 ?auto_19262 ) ( SUPPORTS ?auto_19259 ?auto_19255 ) ( not ( = ?auto_19254 ?auto_19261 ) ) ( CALIBRATION_TARGET ?auto_19259 ?auto_19261 ) ( not ( = ?auto_19261 ?auto_19253 ) ) ( ON_BOARD ?auto_19263 ?auto_19262 ) ( not ( = ?auto_19254 ?auto_19253 ) ) ( not ( = ?auto_19259 ?auto_19263 ) ) ( SUPPORTS ?auto_19263 ?auto_19252 ) ( CALIBRATION_TARGET ?auto_19263 ?auto_19261 ) ( not ( = ?auto_19261 ?auto_19256 ) ) ( ON_BOARD ?auto_19260 ?auto_19262 ) ( not ( = ?auto_19253 ?auto_19256 ) ) ( not ( = ?auto_19263 ?auto_19260 ) ) ( SUPPORTS ?auto_19260 ?auto_19257 ) ( CALIBRATION_TARGET ?auto_19260 ?auto_19261 ) ( not ( = ?auto_19261 ?auto_19250 ) ) ( ON_BOARD ?auto_19258 ?auto_19262 ) ( not ( = ?auto_19256 ?auto_19250 ) ) ( not ( = ?auto_19260 ?auto_19258 ) ) ( SUPPORTS ?auto_19258 ?auto_19251 ) ( CALIBRATION_TARGET ?auto_19258 ?auto_19261 ) ( POWER_AVAIL ?auto_19262 ) ( POINTING ?auto_19262 ?auto_19264 ) ( not ( = ?auto_19261 ?auto_19264 ) ) ( not ( = ?auto_19250 ?auto_19264 ) ) ( not ( = ?auto_19251 ?auto_19257 ) ) ( not ( = ?auto_19256 ?auto_19264 ) ) ( not ( = ?auto_19250 ?auto_19253 ) ) ( not ( = ?auto_19251 ?auto_19252 ) ) ( not ( = ?auto_19257 ?auto_19252 ) ) ( not ( = ?auto_19253 ?auto_19264 ) ) ( not ( = ?auto_19263 ?auto_19258 ) ) ( not ( = ?auto_19250 ?auto_19254 ) ) ( not ( = ?auto_19251 ?auto_19255 ) ) ( not ( = ?auto_19256 ?auto_19254 ) ) ( not ( = ?auto_19257 ?auto_19255 ) ) ( not ( = ?auto_19252 ?auto_19255 ) ) ( not ( = ?auto_19254 ?auto_19264 ) ) ( not ( = ?auto_19259 ?auto_19260 ) ) ( not ( = ?auto_19259 ?auto_19258 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_19250 ?auto_19251 ?auto_19256 ?auto_19257 ?auto_19254 ?auto_19255 ?auto_19253 ?auto_19252 )
      ( GET-4IMAGE-VERIFY ?auto_19250 ?auto_19251 ?auto_19253 ?auto_19252 ?auto_19254 ?auto_19255 ?auto_19256 ?auto_19257 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_19405 - DIRECTION
      ?auto_19406 - MODE
      ?auto_19408 - DIRECTION
      ?auto_19407 - MODE
      ?auto_19409 - DIRECTION
      ?auto_19410 - MODE
      ?auto_19411 - DIRECTION
      ?auto_19412 - MODE
    )
    :vars
    (
      ?auto_19414 - INSTRUMENT
      ?auto_19417 - SATELLITE
      ?auto_19416 - DIRECTION
      ?auto_19418 - INSTRUMENT
      ?auto_19415 - INSTRUMENT
      ?auto_19413 - INSTRUMENT
      ?auto_19419 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_19414 ?auto_19417 ) ( SUPPORTS ?auto_19414 ?auto_19407 ) ( not ( = ?auto_19408 ?auto_19416 ) ) ( CALIBRATION_TARGET ?auto_19414 ?auto_19416 ) ( not ( = ?auto_19416 ?auto_19411 ) ) ( ON_BOARD ?auto_19418 ?auto_19417 ) ( not ( = ?auto_19408 ?auto_19411 ) ) ( not ( = ?auto_19414 ?auto_19418 ) ) ( SUPPORTS ?auto_19418 ?auto_19412 ) ( CALIBRATION_TARGET ?auto_19418 ?auto_19416 ) ( not ( = ?auto_19416 ?auto_19409 ) ) ( ON_BOARD ?auto_19415 ?auto_19417 ) ( not ( = ?auto_19411 ?auto_19409 ) ) ( not ( = ?auto_19418 ?auto_19415 ) ) ( SUPPORTS ?auto_19415 ?auto_19410 ) ( CALIBRATION_TARGET ?auto_19415 ?auto_19416 ) ( not ( = ?auto_19416 ?auto_19405 ) ) ( ON_BOARD ?auto_19413 ?auto_19417 ) ( not ( = ?auto_19409 ?auto_19405 ) ) ( not ( = ?auto_19415 ?auto_19413 ) ) ( SUPPORTS ?auto_19413 ?auto_19406 ) ( CALIBRATION_TARGET ?auto_19413 ?auto_19416 ) ( POWER_AVAIL ?auto_19417 ) ( POINTING ?auto_19417 ?auto_19419 ) ( not ( = ?auto_19416 ?auto_19419 ) ) ( not ( = ?auto_19405 ?auto_19419 ) ) ( not ( = ?auto_19406 ?auto_19410 ) ) ( not ( = ?auto_19409 ?auto_19419 ) ) ( not ( = ?auto_19405 ?auto_19411 ) ) ( not ( = ?auto_19406 ?auto_19412 ) ) ( not ( = ?auto_19410 ?auto_19412 ) ) ( not ( = ?auto_19411 ?auto_19419 ) ) ( not ( = ?auto_19418 ?auto_19413 ) ) ( not ( = ?auto_19405 ?auto_19408 ) ) ( not ( = ?auto_19406 ?auto_19407 ) ) ( not ( = ?auto_19409 ?auto_19408 ) ) ( not ( = ?auto_19410 ?auto_19407 ) ) ( not ( = ?auto_19412 ?auto_19407 ) ) ( not ( = ?auto_19408 ?auto_19419 ) ) ( not ( = ?auto_19414 ?auto_19415 ) ) ( not ( = ?auto_19414 ?auto_19413 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_19405 ?auto_19406 ?auto_19409 ?auto_19410 ?auto_19408 ?auto_19407 ?auto_19411 ?auto_19412 )
      ( GET-4IMAGE-VERIFY ?auto_19405 ?auto_19406 ?auto_19408 ?auto_19407 ?auto_19409 ?auto_19410 ?auto_19411 ?auto_19412 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_19454 - DIRECTION
      ?auto_19455 - MODE
      ?auto_19457 - DIRECTION
      ?auto_19456 - MODE
      ?auto_19458 - DIRECTION
      ?auto_19459 - MODE
      ?auto_19460 - DIRECTION
      ?auto_19461 - MODE
    )
    :vars
    (
      ?auto_19463 - INSTRUMENT
      ?auto_19466 - SATELLITE
      ?auto_19465 - DIRECTION
      ?auto_19467 - INSTRUMENT
      ?auto_19464 - INSTRUMENT
      ?auto_19462 - INSTRUMENT
      ?auto_19468 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_19463 ?auto_19466 ) ( SUPPORTS ?auto_19463 ?auto_19456 ) ( not ( = ?auto_19457 ?auto_19465 ) ) ( CALIBRATION_TARGET ?auto_19463 ?auto_19465 ) ( not ( = ?auto_19465 ?auto_19458 ) ) ( ON_BOARD ?auto_19467 ?auto_19466 ) ( not ( = ?auto_19457 ?auto_19458 ) ) ( not ( = ?auto_19463 ?auto_19467 ) ) ( SUPPORTS ?auto_19467 ?auto_19459 ) ( CALIBRATION_TARGET ?auto_19467 ?auto_19465 ) ( not ( = ?auto_19465 ?auto_19460 ) ) ( ON_BOARD ?auto_19464 ?auto_19466 ) ( not ( = ?auto_19458 ?auto_19460 ) ) ( not ( = ?auto_19467 ?auto_19464 ) ) ( SUPPORTS ?auto_19464 ?auto_19461 ) ( CALIBRATION_TARGET ?auto_19464 ?auto_19465 ) ( not ( = ?auto_19465 ?auto_19454 ) ) ( ON_BOARD ?auto_19462 ?auto_19466 ) ( not ( = ?auto_19460 ?auto_19454 ) ) ( not ( = ?auto_19464 ?auto_19462 ) ) ( SUPPORTS ?auto_19462 ?auto_19455 ) ( CALIBRATION_TARGET ?auto_19462 ?auto_19465 ) ( POWER_AVAIL ?auto_19466 ) ( POINTING ?auto_19466 ?auto_19468 ) ( not ( = ?auto_19465 ?auto_19468 ) ) ( not ( = ?auto_19454 ?auto_19468 ) ) ( not ( = ?auto_19455 ?auto_19461 ) ) ( not ( = ?auto_19460 ?auto_19468 ) ) ( not ( = ?auto_19454 ?auto_19458 ) ) ( not ( = ?auto_19455 ?auto_19459 ) ) ( not ( = ?auto_19461 ?auto_19459 ) ) ( not ( = ?auto_19458 ?auto_19468 ) ) ( not ( = ?auto_19467 ?auto_19462 ) ) ( not ( = ?auto_19454 ?auto_19457 ) ) ( not ( = ?auto_19455 ?auto_19456 ) ) ( not ( = ?auto_19460 ?auto_19457 ) ) ( not ( = ?auto_19461 ?auto_19456 ) ) ( not ( = ?auto_19459 ?auto_19456 ) ) ( not ( = ?auto_19457 ?auto_19468 ) ) ( not ( = ?auto_19463 ?auto_19464 ) ) ( not ( = ?auto_19463 ?auto_19462 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_19454 ?auto_19455 ?auto_19460 ?auto_19461 ?auto_19457 ?auto_19456 ?auto_19458 ?auto_19459 )
      ( GET-4IMAGE-VERIFY ?auto_19454 ?auto_19455 ?auto_19457 ?auto_19456 ?auto_19458 ?auto_19459 ?auto_19460 ?auto_19461 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_19609 - DIRECTION
      ?auto_19610 - MODE
      ?auto_19612 - DIRECTION
      ?auto_19611 - MODE
      ?auto_19613 - DIRECTION
      ?auto_19614 - MODE
      ?auto_19615 - DIRECTION
      ?auto_19616 - MODE
    )
    :vars
    (
      ?auto_19618 - INSTRUMENT
      ?auto_19621 - SATELLITE
      ?auto_19620 - DIRECTION
      ?auto_19622 - INSTRUMENT
      ?auto_19619 - INSTRUMENT
      ?auto_19617 - INSTRUMENT
      ?auto_19623 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_19618 ?auto_19621 ) ( SUPPORTS ?auto_19618 ?auto_19616 ) ( not ( = ?auto_19615 ?auto_19620 ) ) ( CALIBRATION_TARGET ?auto_19618 ?auto_19620 ) ( not ( = ?auto_19620 ?auto_19613 ) ) ( ON_BOARD ?auto_19622 ?auto_19621 ) ( not ( = ?auto_19615 ?auto_19613 ) ) ( not ( = ?auto_19618 ?auto_19622 ) ) ( SUPPORTS ?auto_19622 ?auto_19614 ) ( CALIBRATION_TARGET ?auto_19622 ?auto_19620 ) ( not ( = ?auto_19620 ?auto_19609 ) ) ( ON_BOARD ?auto_19619 ?auto_19621 ) ( not ( = ?auto_19613 ?auto_19609 ) ) ( not ( = ?auto_19622 ?auto_19619 ) ) ( SUPPORTS ?auto_19619 ?auto_19610 ) ( CALIBRATION_TARGET ?auto_19619 ?auto_19620 ) ( not ( = ?auto_19620 ?auto_19612 ) ) ( ON_BOARD ?auto_19617 ?auto_19621 ) ( not ( = ?auto_19609 ?auto_19612 ) ) ( not ( = ?auto_19619 ?auto_19617 ) ) ( SUPPORTS ?auto_19617 ?auto_19611 ) ( CALIBRATION_TARGET ?auto_19617 ?auto_19620 ) ( POWER_AVAIL ?auto_19621 ) ( POINTING ?auto_19621 ?auto_19623 ) ( not ( = ?auto_19620 ?auto_19623 ) ) ( not ( = ?auto_19612 ?auto_19623 ) ) ( not ( = ?auto_19611 ?auto_19610 ) ) ( not ( = ?auto_19609 ?auto_19623 ) ) ( not ( = ?auto_19612 ?auto_19613 ) ) ( not ( = ?auto_19611 ?auto_19614 ) ) ( not ( = ?auto_19610 ?auto_19614 ) ) ( not ( = ?auto_19613 ?auto_19623 ) ) ( not ( = ?auto_19622 ?auto_19617 ) ) ( not ( = ?auto_19612 ?auto_19615 ) ) ( not ( = ?auto_19611 ?auto_19616 ) ) ( not ( = ?auto_19609 ?auto_19615 ) ) ( not ( = ?auto_19610 ?auto_19616 ) ) ( not ( = ?auto_19614 ?auto_19616 ) ) ( not ( = ?auto_19615 ?auto_19623 ) ) ( not ( = ?auto_19618 ?auto_19619 ) ) ( not ( = ?auto_19618 ?auto_19617 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_19612 ?auto_19611 ?auto_19609 ?auto_19610 ?auto_19615 ?auto_19616 ?auto_19613 ?auto_19614 )
      ( GET-4IMAGE-VERIFY ?auto_19609 ?auto_19610 ?auto_19612 ?auto_19611 ?auto_19613 ?auto_19614 ?auto_19615 ?auto_19616 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_19658 - DIRECTION
      ?auto_19659 - MODE
      ?auto_19661 - DIRECTION
      ?auto_19660 - MODE
      ?auto_19662 - DIRECTION
      ?auto_19663 - MODE
      ?auto_19664 - DIRECTION
      ?auto_19665 - MODE
    )
    :vars
    (
      ?auto_19667 - INSTRUMENT
      ?auto_19670 - SATELLITE
      ?auto_19669 - DIRECTION
      ?auto_19671 - INSTRUMENT
      ?auto_19668 - INSTRUMENT
      ?auto_19666 - INSTRUMENT
      ?auto_19672 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_19667 ?auto_19670 ) ( SUPPORTS ?auto_19667 ?auto_19663 ) ( not ( = ?auto_19662 ?auto_19669 ) ) ( CALIBRATION_TARGET ?auto_19667 ?auto_19669 ) ( not ( = ?auto_19669 ?auto_19664 ) ) ( ON_BOARD ?auto_19671 ?auto_19670 ) ( not ( = ?auto_19662 ?auto_19664 ) ) ( not ( = ?auto_19667 ?auto_19671 ) ) ( SUPPORTS ?auto_19671 ?auto_19665 ) ( CALIBRATION_TARGET ?auto_19671 ?auto_19669 ) ( not ( = ?auto_19669 ?auto_19658 ) ) ( ON_BOARD ?auto_19668 ?auto_19670 ) ( not ( = ?auto_19664 ?auto_19658 ) ) ( not ( = ?auto_19671 ?auto_19668 ) ) ( SUPPORTS ?auto_19668 ?auto_19659 ) ( CALIBRATION_TARGET ?auto_19668 ?auto_19669 ) ( not ( = ?auto_19669 ?auto_19661 ) ) ( ON_BOARD ?auto_19666 ?auto_19670 ) ( not ( = ?auto_19658 ?auto_19661 ) ) ( not ( = ?auto_19668 ?auto_19666 ) ) ( SUPPORTS ?auto_19666 ?auto_19660 ) ( CALIBRATION_TARGET ?auto_19666 ?auto_19669 ) ( POWER_AVAIL ?auto_19670 ) ( POINTING ?auto_19670 ?auto_19672 ) ( not ( = ?auto_19669 ?auto_19672 ) ) ( not ( = ?auto_19661 ?auto_19672 ) ) ( not ( = ?auto_19660 ?auto_19659 ) ) ( not ( = ?auto_19658 ?auto_19672 ) ) ( not ( = ?auto_19661 ?auto_19664 ) ) ( not ( = ?auto_19660 ?auto_19665 ) ) ( not ( = ?auto_19659 ?auto_19665 ) ) ( not ( = ?auto_19664 ?auto_19672 ) ) ( not ( = ?auto_19671 ?auto_19666 ) ) ( not ( = ?auto_19661 ?auto_19662 ) ) ( not ( = ?auto_19660 ?auto_19663 ) ) ( not ( = ?auto_19658 ?auto_19662 ) ) ( not ( = ?auto_19659 ?auto_19663 ) ) ( not ( = ?auto_19665 ?auto_19663 ) ) ( not ( = ?auto_19662 ?auto_19672 ) ) ( not ( = ?auto_19667 ?auto_19668 ) ) ( not ( = ?auto_19667 ?auto_19666 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_19661 ?auto_19660 ?auto_19658 ?auto_19659 ?auto_19662 ?auto_19663 ?auto_19664 ?auto_19665 )
      ( GET-4IMAGE-VERIFY ?auto_19658 ?auto_19659 ?auto_19661 ?auto_19660 ?auto_19662 ?auto_19663 ?auto_19664 ?auto_19665 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_19815 - DIRECTION
      ?auto_19816 - MODE
      ?auto_19818 - DIRECTION
      ?auto_19817 - MODE
      ?auto_19819 - DIRECTION
      ?auto_19820 - MODE
      ?auto_19821 - DIRECTION
      ?auto_19822 - MODE
    )
    :vars
    (
      ?auto_19824 - INSTRUMENT
      ?auto_19827 - SATELLITE
      ?auto_19826 - DIRECTION
      ?auto_19828 - INSTRUMENT
      ?auto_19825 - INSTRUMENT
      ?auto_19823 - INSTRUMENT
      ?auto_19829 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_19824 ?auto_19827 ) ( SUPPORTS ?auto_19824 ?auto_19822 ) ( not ( = ?auto_19821 ?auto_19826 ) ) ( CALIBRATION_TARGET ?auto_19824 ?auto_19826 ) ( not ( = ?auto_19826 ?auto_19818 ) ) ( ON_BOARD ?auto_19828 ?auto_19827 ) ( not ( = ?auto_19821 ?auto_19818 ) ) ( not ( = ?auto_19824 ?auto_19828 ) ) ( SUPPORTS ?auto_19828 ?auto_19817 ) ( CALIBRATION_TARGET ?auto_19828 ?auto_19826 ) ( not ( = ?auto_19826 ?auto_19815 ) ) ( ON_BOARD ?auto_19825 ?auto_19827 ) ( not ( = ?auto_19818 ?auto_19815 ) ) ( not ( = ?auto_19828 ?auto_19825 ) ) ( SUPPORTS ?auto_19825 ?auto_19816 ) ( CALIBRATION_TARGET ?auto_19825 ?auto_19826 ) ( not ( = ?auto_19826 ?auto_19819 ) ) ( ON_BOARD ?auto_19823 ?auto_19827 ) ( not ( = ?auto_19815 ?auto_19819 ) ) ( not ( = ?auto_19825 ?auto_19823 ) ) ( SUPPORTS ?auto_19823 ?auto_19820 ) ( CALIBRATION_TARGET ?auto_19823 ?auto_19826 ) ( POWER_AVAIL ?auto_19827 ) ( POINTING ?auto_19827 ?auto_19829 ) ( not ( = ?auto_19826 ?auto_19829 ) ) ( not ( = ?auto_19819 ?auto_19829 ) ) ( not ( = ?auto_19820 ?auto_19816 ) ) ( not ( = ?auto_19815 ?auto_19829 ) ) ( not ( = ?auto_19819 ?auto_19818 ) ) ( not ( = ?auto_19820 ?auto_19817 ) ) ( not ( = ?auto_19816 ?auto_19817 ) ) ( not ( = ?auto_19818 ?auto_19829 ) ) ( not ( = ?auto_19828 ?auto_19823 ) ) ( not ( = ?auto_19819 ?auto_19821 ) ) ( not ( = ?auto_19820 ?auto_19822 ) ) ( not ( = ?auto_19815 ?auto_19821 ) ) ( not ( = ?auto_19816 ?auto_19822 ) ) ( not ( = ?auto_19817 ?auto_19822 ) ) ( not ( = ?auto_19821 ?auto_19829 ) ) ( not ( = ?auto_19824 ?auto_19825 ) ) ( not ( = ?auto_19824 ?auto_19823 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_19819 ?auto_19820 ?auto_19815 ?auto_19816 ?auto_19821 ?auto_19822 ?auto_19818 ?auto_19817 )
      ( GET-4IMAGE-VERIFY ?auto_19815 ?auto_19816 ?auto_19818 ?auto_19817 ?auto_19819 ?auto_19820 ?auto_19821 ?auto_19822 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_19864 - DIRECTION
      ?auto_19865 - MODE
      ?auto_19867 - DIRECTION
      ?auto_19866 - MODE
      ?auto_19868 - DIRECTION
      ?auto_19869 - MODE
      ?auto_19870 - DIRECTION
      ?auto_19871 - MODE
    )
    :vars
    (
      ?auto_19873 - INSTRUMENT
      ?auto_19876 - SATELLITE
      ?auto_19875 - DIRECTION
      ?auto_19877 - INSTRUMENT
      ?auto_19874 - INSTRUMENT
      ?auto_19872 - INSTRUMENT
      ?auto_19878 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_19873 ?auto_19876 ) ( SUPPORTS ?auto_19873 ?auto_19869 ) ( not ( = ?auto_19868 ?auto_19875 ) ) ( CALIBRATION_TARGET ?auto_19873 ?auto_19875 ) ( not ( = ?auto_19875 ?auto_19867 ) ) ( ON_BOARD ?auto_19877 ?auto_19876 ) ( not ( = ?auto_19868 ?auto_19867 ) ) ( not ( = ?auto_19873 ?auto_19877 ) ) ( SUPPORTS ?auto_19877 ?auto_19866 ) ( CALIBRATION_TARGET ?auto_19877 ?auto_19875 ) ( not ( = ?auto_19875 ?auto_19864 ) ) ( ON_BOARD ?auto_19874 ?auto_19876 ) ( not ( = ?auto_19867 ?auto_19864 ) ) ( not ( = ?auto_19877 ?auto_19874 ) ) ( SUPPORTS ?auto_19874 ?auto_19865 ) ( CALIBRATION_TARGET ?auto_19874 ?auto_19875 ) ( not ( = ?auto_19875 ?auto_19870 ) ) ( ON_BOARD ?auto_19872 ?auto_19876 ) ( not ( = ?auto_19864 ?auto_19870 ) ) ( not ( = ?auto_19874 ?auto_19872 ) ) ( SUPPORTS ?auto_19872 ?auto_19871 ) ( CALIBRATION_TARGET ?auto_19872 ?auto_19875 ) ( POWER_AVAIL ?auto_19876 ) ( POINTING ?auto_19876 ?auto_19878 ) ( not ( = ?auto_19875 ?auto_19878 ) ) ( not ( = ?auto_19870 ?auto_19878 ) ) ( not ( = ?auto_19871 ?auto_19865 ) ) ( not ( = ?auto_19864 ?auto_19878 ) ) ( not ( = ?auto_19870 ?auto_19867 ) ) ( not ( = ?auto_19871 ?auto_19866 ) ) ( not ( = ?auto_19865 ?auto_19866 ) ) ( not ( = ?auto_19867 ?auto_19878 ) ) ( not ( = ?auto_19877 ?auto_19872 ) ) ( not ( = ?auto_19870 ?auto_19868 ) ) ( not ( = ?auto_19871 ?auto_19869 ) ) ( not ( = ?auto_19864 ?auto_19868 ) ) ( not ( = ?auto_19865 ?auto_19869 ) ) ( not ( = ?auto_19866 ?auto_19869 ) ) ( not ( = ?auto_19868 ?auto_19878 ) ) ( not ( = ?auto_19873 ?auto_19874 ) ) ( not ( = ?auto_19873 ?auto_19872 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_19870 ?auto_19871 ?auto_19864 ?auto_19865 ?auto_19868 ?auto_19869 ?auto_19867 ?auto_19866 )
      ( GET-4IMAGE-VERIFY ?auto_19864 ?auto_19865 ?auto_19867 ?auto_19866 ?auto_19868 ?auto_19869 ?auto_19870 ?auto_19871 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_19964 - DIRECTION
      ?auto_19965 - MODE
      ?auto_19967 - DIRECTION
      ?auto_19966 - MODE
      ?auto_19968 - DIRECTION
      ?auto_19969 - MODE
      ?auto_19970 - DIRECTION
      ?auto_19971 - MODE
    )
    :vars
    (
      ?auto_19973 - INSTRUMENT
      ?auto_19976 - SATELLITE
      ?auto_19975 - DIRECTION
      ?auto_19977 - INSTRUMENT
      ?auto_19974 - INSTRUMENT
      ?auto_19972 - INSTRUMENT
      ?auto_19978 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_19973 ?auto_19976 ) ( SUPPORTS ?auto_19973 ?auto_19966 ) ( not ( = ?auto_19967 ?auto_19975 ) ) ( CALIBRATION_TARGET ?auto_19973 ?auto_19975 ) ( not ( = ?auto_19975 ?auto_19970 ) ) ( ON_BOARD ?auto_19977 ?auto_19976 ) ( not ( = ?auto_19967 ?auto_19970 ) ) ( not ( = ?auto_19973 ?auto_19977 ) ) ( SUPPORTS ?auto_19977 ?auto_19971 ) ( CALIBRATION_TARGET ?auto_19977 ?auto_19975 ) ( not ( = ?auto_19975 ?auto_19964 ) ) ( ON_BOARD ?auto_19974 ?auto_19976 ) ( not ( = ?auto_19970 ?auto_19964 ) ) ( not ( = ?auto_19977 ?auto_19974 ) ) ( SUPPORTS ?auto_19974 ?auto_19965 ) ( CALIBRATION_TARGET ?auto_19974 ?auto_19975 ) ( not ( = ?auto_19975 ?auto_19968 ) ) ( ON_BOARD ?auto_19972 ?auto_19976 ) ( not ( = ?auto_19964 ?auto_19968 ) ) ( not ( = ?auto_19974 ?auto_19972 ) ) ( SUPPORTS ?auto_19972 ?auto_19969 ) ( CALIBRATION_TARGET ?auto_19972 ?auto_19975 ) ( POWER_AVAIL ?auto_19976 ) ( POINTING ?auto_19976 ?auto_19978 ) ( not ( = ?auto_19975 ?auto_19978 ) ) ( not ( = ?auto_19968 ?auto_19978 ) ) ( not ( = ?auto_19969 ?auto_19965 ) ) ( not ( = ?auto_19964 ?auto_19978 ) ) ( not ( = ?auto_19968 ?auto_19970 ) ) ( not ( = ?auto_19969 ?auto_19971 ) ) ( not ( = ?auto_19965 ?auto_19971 ) ) ( not ( = ?auto_19970 ?auto_19978 ) ) ( not ( = ?auto_19977 ?auto_19972 ) ) ( not ( = ?auto_19968 ?auto_19967 ) ) ( not ( = ?auto_19969 ?auto_19966 ) ) ( not ( = ?auto_19964 ?auto_19967 ) ) ( not ( = ?auto_19965 ?auto_19966 ) ) ( not ( = ?auto_19971 ?auto_19966 ) ) ( not ( = ?auto_19967 ?auto_19978 ) ) ( not ( = ?auto_19973 ?auto_19974 ) ) ( not ( = ?auto_19973 ?auto_19972 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_19968 ?auto_19969 ?auto_19964 ?auto_19965 ?auto_19967 ?auto_19966 ?auto_19970 ?auto_19971 )
      ( GET-4IMAGE-VERIFY ?auto_19964 ?auto_19965 ?auto_19967 ?auto_19966 ?auto_19968 ?auto_19969 ?auto_19970 ?auto_19971 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_20068 - DIRECTION
      ?auto_20069 - MODE
      ?auto_20071 - DIRECTION
      ?auto_20070 - MODE
      ?auto_20072 - DIRECTION
      ?auto_20073 - MODE
      ?auto_20074 - DIRECTION
      ?auto_20075 - MODE
    )
    :vars
    (
      ?auto_20077 - INSTRUMENT
      ?auto_20080 - SATELLITE
      ?auto_20079 - DIRECTION
      ?auto_20081 - INSTRUMENT
      ?auto_20078 - INSTRUMENT
      ?auto_20076 - INSTRUMENT
      ?auto_20082 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20077 ?auto_20080 ) ( SUPPORTS ?auto_20077 ?auto_20070 ) ( not ( = ?auto_20071 ?auto_20079 ) ) ( CALIBRATION_TARGET ?auto_20077 ?auto_20079 ) ( not ( = ?auto_20079 ?auto_20072 ) ) ( ON_BOARD ?auto_20081 ?auto_20080 ) ( not ( = ?auto_20071 ?auto_20072 ) ) ( not ( = ?auto_20077 ?auto_20081 ) ) ( SUPPORTS ?auto_20081 ?auto_20073 ) ( CALIBRATION_TARGET ?auto_20081 ?auto_20079 ) ( not ( = ?auto_20079 ?auto_20068 ) ) ( ON_BOARD ?auto_20078 ?auto_20080 ) ( not ( = ?auto_20072 ?auto_20068 ) ) ( not ( = ?auto_20081 ?auto_20078 ) ) ( SUPPORTS ?auto_20078 ?auto_20069 ) ( CALIBRATION_TARGET ?auto_20078 ?auto_20079 ) ( not ( = ?auto_20079 ?auto_20074 ) ) ( ON_BOARD ?auto_20076 ?auto_20080 ) ( not ( = ?auto_20068 ?auto_20074 ) ) ( not ( = ?auto_20078 ?auto_20076 ) ) ( SUPPORTS ?auto_20076 ?auto_20075 ) ( CALIBRATION_TARGET ?auto_20076 ?auto_20079 ) ( POWER_AVAIL ?auto_20080 ) ( POINTING ?auto_20080 ?auto_20082 ) ( not ( = ?auto_20079 ?auto_20082 ) ) ( not ( = ?auto_20074 ?auto_20082 ) ) ( not ( = ?auto_20075 ?auto_20069 ) ) ( not ( = ?auto_20068 ?auto_20082 ) ) ( not ( = ?auto_20074 ?auto_20072 ) ) ( not ( = ?auto_20075 ?auto_20073 ) ) ( not ( = ?auto_20069 ?auto_20073 ) ) ( not ( = ?auto_20072 ?auto_20082 ) ) ( not ( = ?auto_20081 ?auto_20076 ) ) ( not ( = ?auto_20074 ?auto_20071 ) ) ( not ( = ?auto_20075 ?auto_20070 ) ) ( not ( = ?auto_20068 ?auto_20071 ) ) ( not ( = ?auto_20069 ?auto_20070 ) ) ( not ( = ?auto_20073 ?auto_20070 ) ) ( not ( = ?auto_20071 ?auto_20082 ) ) ( not ( = ?auto_20077 ?auto_20078 ) ) ( not ( = ?auto_20077 ?auto_20076 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_20074 ?auto_20075 ?auto_20068 ?auto_20069 ?auto_20071 ?auto_20070 ?auto_20072 ?auto_20073 )
      ( GET-4IMAGE-VERIFY ?auto_20068 ?auto_20069 ?auto_20071 ?auto_20070 ?auto_20072 ?auto_20073 ?auto_20074 ?auto_20075 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_20223 - DIRECTION
      ?auto_20224 - MODE
      ?auto_20226 - DIRECTION
      ?auto_20225 - MODE
      ?auto_20227 - DIRECTION
      ?auto_20228 - MODE
      ?auto_20229 - DIRECTION
      ?auto_20230 - MODE
    )
    :vars
    (
      ?auto_20232 - INSTRUMENT
      ?auto_20235 - SATELLITE
      ?auto_20234 - DIRECTION
      ?auto_20236 - INSTRUMENT
      ?auto_20233 - INSTRUMENT
      ?auto_20231 - INSTRUMENT
      ?auto_20237 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20232 ?auto_20235 ) ( SUPPORTS ?auto_20232 ?auto_20230 ) ( not ( = ?auto_20229 ?auto_20234 ) ) ( CALIBRATION_TARGET ?auto_20232 ?auto_20234 ) ( not ( = ?auto_20234 ?auto_20223 ) ) ( ON_BOARD ?auto_20236 ?auto_20235 ) ( not ( = ?auto_20229 ?auto_20223 ) ) ( not ( = ?auto_20232 ?auto_20236 ) ) ( SUPPORTS ?auto_20236 ?auto_20224 ) ( CALIBRATION_TARGET ?auto_20236 ?auto_20234 ) ( not ( = ?auto_20234 ?auto_20227 ) ) ( ON_BOARD ?auto_20233 ?auto_20235 ) ( not ( = ?auto_20223 ?auto_20227 ) ) ( not ( = ?auto_20236 ?auto_20233 ) ) ( SUPPORTS ?auto_20233 ?auto_20228 ) ( CALIBRATION_TARGET ?auto_20233 ?auto_20234 ) ( not ( = ?auto_20234 ?auto_20226 ) ) ( ON_BOARD ?auto_20231 ?auto_20235 ) ( not ( = ?auto_20227 ?auto_20226 ) ) ( not ( = ?auto_20233 ?auto_20231 ) ) ( SUPPORTS ?auto_20231 ?auto_20225 ) ( CALIBRATION_TARGET ?auto_20231 ?auto_20234 ) ( POWER_AVAIL ?auto_20235 ) ( POINTING ?auto_20235 ?auto_20237 ) ( not ( = ?auto_20234 ?auto_20237 ) ) ( not ( = ?auto_20226 ?auto_20237 ) ) ( not ( = ?auto_20225 ?auto_20228 ) ) ( not ( = ?auto_20227 ?auto_20237 ) ) ( not ( = ?auto_20226 ?auto_20223 ) ) ( not ( = ?auto_20225 ?auto_20224 ) ) ( not ( = ?auto_20228 ?auto_20224 ) ) ( not ( = ?auto_20223 ?auto_20237 ) ) ( not ( = ?auto_20236 ?auto_20231 ) ) ( not ( = ?auto_20226 ?auto_20229 ) ) ( not ( = ?auto_20225 ?auto_20230 ) ) ( not ( = ?auto_20227 ?auto_20229 ) ) ( not ( = ?auto_20228 ?auto_20230 ) ) ( not ( = ?auto_20224 ?auto_20230 ) ) ( not ( = ?auto_20229 ?auto_20237 ) ) ( not ( = ?auto_20232 ?auto_20233 ) ) ( not ( = ?auto_20232 ?auto_20231 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_20226 ?auto_20225 ?auto_20227 ?auto_20228 ?auto_20229 ?auto_20230 ?auto_20223 ?auto_20224 )
      ( GET-4IMAGE-VERIFY ?auto_20223 ?auto_20224 ?auto_20226 ?auto_20225 ?auto_20227 ?auto_20228 ?auto_20229 ?auto_20230 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_20272 - DIRECTION
      ?auto_20273 - MODE
      ?auto_20275 - DIRECTION
      ?auto_20274 - MODE
      ?auto_20276 - DIRECTION
      ?auto_20277 - MODE
      ?auto_20278 - DIRECTION
      ?auto_20279 - MODE
    )
    :vars
    (
      ?auto_20281 - INSTRUMENT
      ?auto_20284 - SATELLITE
      ?auto_20283 - DIRECTION
      ?auto_20285 - INSTRUMENT
      ?auto_20282 - INSTRUMENT
      ?auto_20280 - INSTRUMENT
      ?auto_20286 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20281 ?auto_20284 ) ( SUPPORTS ?auto_20281 ?auto_20277 ) ( not ( = ?auto_20276 ?auto_20283 ) ) ( CALIBRATION_TARGET ?auto_20281 ?auto_20283 ) ( not ( = ?auto_20283 ?auto_20272 ) ) ( ON_BOARD ?auto_20285 ?auto_20284 ) ( not ( = ?auto_20276 ?auto_20272 ) ) ( not ( = ?auto_20281 ?auto_20285 ) ) ( SUPPORTS ?auto_20285 ?auto_20273 ) ( CALIBRATION_TARGET ?auto_20285 ?auto_20283 ) ( not ( = ?auto_20283 ?auto_20278 ) ) ( ON_BOARD ?auto_20282 ?auto_20284 ) ( not ( = ?auto_20272 ?auto_20278 ) ) ( not ( = ?auto_20285 ?auto_20282 ) ) ( SUPPORTS ?auto_20282 ?auto_20279 ) ( CALIBRATION_TARGET ?auto_20282 ?auto_20283 ) ( not ( = ?auto_20283 ?auto_20275 ) ) ( ON_BOARD ?auto_20280 ?auto_20284 ) ( not ( = ?auto_20278 ?auto_20275 ) ) ( not ( = ?auto_20282 ?auto_20280 ) ) ( SUPPORTS ?auto_20280 ?auto_20274 ) ( CALIBRATION_TARGET ?auto_20280 ?auto_20283 ) ( POWER_AVAIL ?auto_20284 ) ( POINTING ?auto_20284 ?auto_20286 ) ( not ( = ?auto_20283 ?auto_20286 ) ) ( not ( = ?auto_20275 ?auto_20286 ) ) ( not ( = ?auto_20274 ?auto_20279 ) ) ( not ( = ?auto_20278 ?auto_20286 ) ) ( not ( = ?auto_20275 ?auto_20272 ) ) ( not ( = ?auto_20274 ?auto_20273 ) ) ( not ( = ?auto_20279 ?auto_20273 ) ) ( not ( = ?auto_20272 ?auto_20286 ) ) ( not ( = ?auto_20285 ?auto_20280 ) ) ( not ( = ?auto_20275 ?auto_20276 ) ) ( not ( = ?auto_20274 ?auto_20277 ) ) ( not ( = ?auto_20278 ?auto_20276 ) ) ( not ( = ?auto_20279 ?auto_20277 ) ) ( not ( = ?auto_20273 ?auto_20277 ) ) ( not ( = ?auto_20276 ?auto_20286 ) ) ( not ( = ?auto_20281 ?auto_20282 ) ) ( not ( = ?auto_20281 ?auto_20280 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_20275 ?auto_20274 ?auto_20278 ?auto_20279 ?auto_20276 ?auto_20277 ?auto_20272 ?auto_20273 )
      ( GET-4IMAGE-VERIFY ?auto_20272 ?auto_20273 ?auto_20275 ?auto_20274 ?auto_20276 ?auto_20277 ?auto_20278 ?auto_20279 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_20321 - DIRECTION
      ?auto_20322 - MODE
      ?auto_20324 - DIRECTION
      ?auto_20323 - MODE
      ?auto_20325 - DIRECTION
      ?auto_20326 - MODE
      ?auto_20327 - DIRECTION
      ?auto_20328 - MODE
    )
    :vars
    (
      ?auto_20330 - INSTRUMENT
      ?auto_20333 - SATELLITE
      ?auto_20332 - DIRECTION
      ?auto_20334 - INSTRUMENT
      ?auto_20331 - INSTRUMENT
      ?auto_20329 - INSTRUMENT
      ?auto_20335 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20330 ?auto_20333 ) ( SUPPORTS ?auto_20330 ?auto_20328 ) ( not ( = ?auto_20327 ?auto_20332 ) ) ( CALIBRATION_TARGET ?auto_20330 ?auto_20332 ) ( not ( = ?auto_20332 ?auto_20321 ) ) ( ON_BOARD ?auto_20334 ?auto_20333 ) ( not ( = ?auto_20327 ?auto_20321 ) ) ( not ( = ?auto_20330 ?auto_20334 ) ) ( SUPPORTS ?auto_20334 ?auto_20322 ) ( CALIBRATION_TARGET ?auto_20334 ?auto_20332 ) ( not ( = ?auto_20332 ?auto_20324 ) ) ( ON_BOARD ?auto_20331 ?auto_20333 ) ( not ( = ?auto_20321 ?auto_20324 ) ) ( not ( = ?auto_20334 ?auto_20331 ) ) ( SUPPORTS ?auto_20331 ?auto_20323 ) ( CALIBRATION_TARGET ?auto_20331 ?auto_20332 ) ( not ( = ?auto_20332 ?auto_20325 ) ) ( ON_BOARD ?auto_20329 ?auto_20333 ) ( not ( = ?auto_20324 ?auto_20325 ) ) ( not ( = ?auto_20331 ?auto_20329 ) ) ( SUPPORTS ?auto_20329 ?auto_20326 ) ( CALIBRATION_TARGET ?auto_20329 ?auto_20332 ) ( POWER_AVAIL ?auto_20333 ) ( POINTING ?auto_20333 ?auto_20335 ) ( not ( = ?auto_20332 ?auto_20335 ) ) ( not ( = ?auto_20325 ?auto_20335 ) ) ( not ( = ?auto_20326 ?auto_20323 ) ) ( not ( = ?auto_20324 ?auto_20335 ) ) ( not ( = ?auto_20325 ?auto_20321 ) ) ( not ( = ?auto_20326 ?auto_20322 ) ) ( not ( = ?auto_20323 ?auto_20322 ) ) ( not ( = ?auto_20321 ?auto_20335 ) ) ( not ( = ?auto_20334 ?auto_20329 ) ) ( not ( = ?auto_20325 ?auto_20327 ) ) ( not ( = ?auto_20326 ?auto_20328 ) ) ( not ( = ?auto_20324 ?auto_20327 ) ) ( not ( = ?auto_20323 ?auto_20328 ) ) ( not ( = ?auto_20322 ?auto_20328 ) ) ( not ( = ?auto_20327 ?auto_20335 ) ) ( not ( = ?auto_20330 ?auto_20331 ) ) ( not ( = ?auto_20330 ?auto_20329 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_20325 ?auto_20326 ?auto_20324 ?auto_20323 ?auto_20327 ?auto_20328 ?auto_20321 ?auto_20322 )
      ( GET-4IMAGE-VERIFY ?auto_20321 ?auto_20322 ?auto_20324 ?auto_20323 ?auto_20325 ?auto_20326 ?auto_20327 ?auto_20328 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_20370 - DIRECTION
      ?auto_20371 - MODE
      ?auto_20373 - DIRECTION
      ?auto_20372 - MODE
      ?auto_20374 - DIRECTION
      ?auto_20375 - MODE
      ?auto_20376 - DIRECTION
      ?auto_20377 - MODE
    )
    :vars
    (
      ?auto_20379 - INSTRUMENT
      ?auto_20382 - SATELLITE
      ?auto_20381 - DIRECTION
      ?auto_20383 - INSTRUMENT
      ?auto_20380 - INSTRUMENT
      ?auto_20378 - INSTRUMENT
      ?auto_20384 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20379 ?auto_20382 ) ( SUPPORTS ?auto_20379 ?auto_20375 ) ( not ( = ?auto_20374 ?auto_20381 ) ) ( CALIBRATION_TARGET ?auto_20379 ?auto_20381 ) ( not ( = ?auto_20381 ?auto_20370 ) ) ( ON_BOARD ?auto_20383 ?auto_20382 ) ( not ( = ?auto_20374 ?auto_20370 ) ) ( not ( = ?auto_20379 ?auto_20383 ) ) ( SUPPORTS ?auto_20383 ?auto_20371 ) ( CALIBRATION_TARGET ?auto_20383 ?auto_20381 ) ( not ( = ?auto_20381 ?auto_20373 ) ) ( ON_BOARD ?auto_20380 ?auto_20382 ) ( not ( = ?auto_20370 ?auto_20373 ) ) ( not ( = ?auto_20383 ?auto_20380 ) ) ( SUPPORTS ?auto_20380 ?auto_20372 ) ( CALIBRATION_TARGET ?auto_20380 ?auto_20381 ) ( not ( = ?auto_20381 ?auto_20376 ) ) ( ON_BOARD ?auto_20378 ?auto_20382 ) ( not ( = ?auto_20373 ?auto_20376 ) ) ( not ( = ?auto_20380 ?auto_20378 ) ) ( SUPPORTS ?auto_20378 ?auto_20377 ) ( CALIBRATION_TARGET ?auto_20378 ?auto_20381 ) ( POWER_AVAIL ?auto_20382 ) ( POINTING ?auto_20382 ?auto_20384 ) ( not ( = ?auto_20381 ?auto_20384 ) ) ( not ( = ?auto_20376 ?auto_20384 ) ) ( not ( = ?auto_20377 ?auto_20372 ) ) ( not ( = ?auto_20373 ?auto_20384 ) ) ( not ( = ?auto_20376 ?auto_20370 ) ) ( not ( = ?auto_20377 ?auto_20371 ) ) ( not ( = ?auto_20372 ?auto_20371 ) ) ( not ( = ?auto_20370 ?auto_20384 ) ) ( not ( = ?auto_20383 ?auto_20378 ) ) ( not ( = ?auto_20376 ?auto_20374 ) ) ( not ( = ?auto_20377 ?auto_20375 ) ) ( not ( = ?auto_20373 ?auto_20374 ) ) ( not ( = ?auto_20372 ?auto_20375 ) ) ( not ( = ?auto_20371 ?auto_20375 ) ) ( not ( = ?auto_20374 ?auto_20384 ) ) ( not ( = ?auto_20379 ?auto_20380 ) ) ( not ( = ?auto_20379 ?auto_20378 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_20376 ?auto_20377 ?auto_20373 ?auto_20372 ?auto_20374 ?auto_20375 ?auto_20370 ?auto_20371 )
      ( GET-4IMAGE-VERIFY ?auto_20370 ?auto_20371 ?auto_20373 ?auto_20372 ?auto_20374 ?auto_20375 ?auto_20376 ?auto_20377 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_20578 - DIRECTION
      ?auto_20579 - MODE
      ?auto_20581 - DIRECTION
      ?auto_20580 - MODE
      ?auto_20582 - DIRECTION
      ?auto_20583 - MODE
      ?auto_20584 - DIRECTION
      ?auto_20585 - MODE
    )
    :vars
    (
      ?auto_20587 - INSTRUMENT
      ?auto_20590 - SATELLITE
      ?auto_20589 - DIRECTION
      ?auto_20591 - INSTRUMENT
      ?auto_20588 - INSTRUMENT
      ?auto_20586 - INSTRUMENT
      ?auto_20592 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20587 ?auto_20590 ) ( SUPPORTS ?auto_20587 ?auto_20580 ) ( not ( = ?auto_20581 ?auto_20589 ) ) ( CALIBRATION_TARGET ?auto_20587 ?auto_20589 ) ( not ( = ?auto_20589 ?auto_20578 ) ) ( ON_BOARD ?auto_20591 ?auto_20590 ) ( not ( = ?auto_20581 ?auto_20578 ) ) ( not ( = ?auto_20587 ?auto_20591 ) ) ( SUPPORTS ?auto_20591 ?auto_20579 ) ( CALIBRATION_TARGET ?auto_20591 ?auto_20589 ) ( not ( = ?auto_20589 ?auto_20584 ) ) ( ON_BOARD ?auto_20588 ?auto_20590 ) ( not ( = ?auto_20578 ?auto_20584 ) ) ( not ( = ?auto_20591 ?auto_20588 ) ) ( SUPPORTS ?auto_20588 ?auto_20585 ) ( CALIBRATION_TARGET ?auto_20588 ?auto_20589 ) ( not ( = ?auto_20589 ?auto_20582 ) ) ( ON_BOARD ?auto_20586 ?auto_20590 ) ( not ( = ?auto_20584 ?auto_20582 ) ) ( not ( = ?auto_20588 ?auto_20586 ) ) ( SUPPORTS ?auto_20586 ?auto_20583 ) ( CALIBRATION_TARGET ?auto_20586 ?auto_20589 ) ( POWER_AVAIL ?auto_20590 ) ( POINTING ?auto_20590 ?auto_20592 ) ( not ( = ?auto_20589 ?auto_20592 ) ) ( not ( = ?auto_20582 ?auto_20592 ) ) ( not ( = ?auto_20583 ?auto_20585 ) ) ( not ( = ?auto_20584 ?auto_20592 ) ) ( not ( = ?auto_20582 ?auto_20578 ) ) ( not ( = ?auto_20583 ?auto_20579 ) ) ( not ( = ?auto_20585 ?auto_20579 ) ) ( not ( = ?auto_20578 ?auto_20592 ) ) ( not ( = ?auto_20591 ?auto_20586 ) ) ( not ( = ?auto_20582 ?auto_20581 ) ) ( not ( = ?auto_20583 ?auto_20580 ) ) ( not ( = ?auto_20584 ?auto_20581 ) ) ( not ( = ?auto_20585 ?auto_20580 ) ) ( not ( = ?auto_20579 ?auto_20580 ) ) ( not ( = ?auto_20581 ?auto_20592 ) ) ( not ( = ?auto_20587 ?auto_20588 ) ) ( not ( = ?auto_20587 ?auto_20586 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_20582 ?auto_20583 ?auto_20584 ?auto_20585 ?auto_20581 ?auto_20580 ?auto_20578 ?auto_20579 )
      ( GET-4IMAGE-VERIFY ?auto_20578 ?auto_20579 ?auto_20581 ?auto_20580 ?auto_20582 ?auto_20583 ?auto_20584 ?auto_20585 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_20627 - DIRECTION
      ?auto_20628 - MODE
      ?auto_20630 - DIRECTION
      ?auto_20629 - MODE
      ?auto_20631 - DIRECTION
      ?auto_20632 - MODE
      ?auto_20633 - DIRECTION
      ?auto_20634 - MODE
    )
    :vars
    (
      ?auto_20636 - INSTRUMENT
      ?auto_20639 - SATELLITE
      ?auto_20638 - DIRECTION
      ?auto_20640 - INSTRUMENT
      ?auto_20637 - INSTRUMENT
      ?auto_20635 - INSTRUMENT
      ?auto_20641 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20636 ?auto_20639 ) ( SUPPORTS ?auto_20636 ?auto_20629 ) ( not ( = ?auto_20630 ?auto_20638 ) ) ( CALIBRATION_TARGET ?auto_20636 ?auto_20638 ) ( not ( = ?auto_20638 ?auto_20627 ) ) ( ON_BOARD ?auto_20640 ?auto_20639 ) ( not ( = ?auto_20630 ?auto_20627 ) ) ( not ( = ?auto_20636 ?auto_20640 ) ) ( SUPPORTS ?auto_20640 ?auto_20628 ) ( CALIBRATION_TARGET ?auto_20640 ?auto_20638 ) ( not ( = ?auto_20638 ?auto_20631 ) ) ( ON_BOARD ?auto_20637 ?auto_20639 ) ( not ( = ?auto_20627 ?auto_20631 ) ) ( not ( = ?auto_20640 ?auto_20637 ) ) ( SUPPORTS ?auto_20637 ?auto_20632 ) ( CALIBRATION_TARGET ?auto_20637 ?auto_20638 ) ( not ( = ?auto_20638 ?auto_20633 ) ) ( ON_BOARD ?auto_20635 ?auto_20639 ) ( not ( = ?auto_20631 ?auto_20633 ) ) ( not ( = ?auto_20637 ?auto_20635 ) ) ( SUPPORTS ?auto_20635 ?auto_20634 ) ( CALIBRATION_TARGET ?auto_20635 ?auto_20638 ) ( POWER_AVAIL ?auto_20639 ) ( POINTING ?auto_20639 ?auto_20641 ) ( not ( = ?auto_20638 ?auto_20641 ) ) ( not ( = ?auto_20633 ?auto_20641 ) ) ( not ( = ?auto_20634 ?auto_20632 ) ) ( not ( = ?auto_20631 ?auto_20641 ) ) ( not ( = ?auto_20633 ?auto_20627 ) ) ( not ( = ?auto_20634 ?auto_20628 ) ) ( not ( = ?auto_20632 ?auto_20628 ) ) ( not ( = ?auto_20627 ?auto_20641 ) ) ( not ( = ?auto_20640 ?auto_20635 ) ) ( not ( = ?auto_20633 ?auto_20630 ) ) ( not ( = ?auto_20634 ?auto_20629 ) ) ( not ( = ?auto_20631 ?auto_20630 ) ) ( not ( = ?auto_20632 ?auto_20629 ) ) ( not ( = ?auto_20628 ?auto_20629 ) ) ( not ( = ?auto_20630 ?auto_20641 ) ) ( not ( = ?auto_20636 ?auto_20637 ) ) ( not ( = ?auto_20636 ?auto_20635 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_20633 ?auto_20634 ?auto_20631 ?auto_20632 ?auto_20630 ?auto_20629 ?auto_20627 ?auto_20628 )
      ( GET-4IMAGE-VERIFY ?auto_20627 ?auto_20628 ?auto_20630 ?auto_20629 ?auto_20631 ?auto_20632 ?auto_20633 ?auto_20634 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_20943 - DIRECTION
      ?auto_20944 - MODE
      ?auto_20946 - DIRECTION
      ?auto_20945 - MODE
      ?auto_20947 - DIRECTION
      ?auto_20948 - MODE
      ?auto_20949 - DIRECTION
      ?auto_20950 - MODE
    )
    :vars
    (
      ?auto_20952 - INSTRUMENT
      ?auto_20955 - SATELLITE
      ?auto_20954 - DIRECTION
      ?auto_20956 - INSTRUMENT
      ?auto_20953 - INSTRUMENT
      ?auto_20951 - INSTRUMENT
      ?auto_20957 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20952 ?auto_20955 ) ( SUPPORTS ?auto_20952 ?auto_20944 ) ( not ( = ?auto_20943 ?auto_20954 ) ) ( CALIBRATION_TARGET ?auto_20952 ?auto_20954 ) ( not ( = ?auto_20954 ?auto_20949 ) ) ( ON_BOARD ?auto_20956 ?auto_20955 ) ( not ( = ?auto_20943 ?auto_20949 ) ) ( not ( = ?auto_20952 ?auto_20956 ) ) ( SUPPORTS ?auto_20956 ?auto_20950 ) ( CALIBRATION_TARGET ?auto_20956 ?auto_20954 ) ( not ( = ?auto_20954 ?auto_20947 ) ) ( ON_BOARD ?auto_20953 ?auto_20955 ) ( not ( = ?auto_20949 ?auto_20947 ) ) ( not ( = ?auto_20956 ?auto_20953 ) ) ( SUPPORTS ?auto_20953 ?auto_20948 ) ( CALIBRATION_TARGET ?auto_20953 ?auto_20954 ) ( not ( = ?auto_20954 ?auto_20946 ) ) ( ON_BOARD ?auto_20951 ?auto_20955 ) ( not ( = ?auto_20947 ?auto_20946 ) ) ( not ( = ?auto_20953 ?auto_20951 ) ) ( SUPPORTS ?auto_20951 ?auto_20945 ) ( CALIBRATION_TARGET ?auto_20951 ?auto_20954 ) ( POWER_AVAIL ?auto_20955 ) ( POINTING ?auto_20955 ?auto_20957 ) ( not ( = ?auto_20954 ?auto_20957 ) ) ( not ( = ?auto_20946 ?auto_20957 ) ) ( not ( = ?auto_20945 ?auto_20948 ) ) ( not ( = ?auto_20947 ?auto_20957 ) ) ( not ( = ?auto_20946 ?auto_20949 ) ) ( not ( = ?auto_20945 ?auto_20950 ) ) ( not ( = ?auto_20948 ?auto_20950 ) ) ( not ( = ?auto_20949 ?auto_20957 ) ) ( not ( = ?auto_20956 ?auto_20951 ) ) ( not ( = ?auto_20946 ?auto_20943 ) ) ( not ( = ?auto_20945 ?auto_20944 ) ) ( not ( = ?auto_20947 ?auto_20943 ) ) ( not ( = ?auto_20948 ?auto_20944 ) ) ( not ( = ?auto_20950 ?auto_20944 ) ) ( not ( = ?auto_20943 ?auto_20957 ) ) ( not ( = ?auto_20952 ?auto_20953 ) ) ( not ( = ?auto_20952 ?auto_20951 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_20946 ?auto_20945 ?auto_20947 ?auto_20948 ?auto_20943 ?auto_20944 ?auto_20949 ?auto_20950 )
      ( GET-4IMAGE-VERIFY ?auto_20943 ?auto_20944 ?auto_20946 ?auto_20945 ?auto_20947 ?auto_20948 ?auto_20949 ?auto_20950 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_20992 - DIRECTION
      ?auto_20993 - MODE
      ?auto_20995 - DIRECTION
      ?auto_20994 - MODE
      ?auto_20996 - DIRECTION
      ?auto_20997 - MODE
      ?auto_20998 - DIRECTION
      ?auto_20999 - MODE
    )
    :vars
    (
      ?auto_21001 - INSTRUMENT
      ?auto_21004 - SATELLITE
      ?auto_21003 - DIRECTION
      ?auto_21005 - INSTRUMENT
      ?auto_21002 - INSTRUMENT
      ?auto_21000 - INSTRUMENT
      ?auto_21006 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_21001 ?auto_21004 ) ( SUPPORTS ?auto_21001 ?auto_20993 ) ( not ( = ?auto_20992 ?auto_21003 ) ) ( CALIBRATION_TARGET ?auto_21001 ?auto_21003 ) ( not ( = ?auto_21003 ?auto_20996 ) ) ( ON_BOARD ?auto_21005 ?auto_21004 ) ( not ( = ?auto_20992 ?auto_20996 ) ) ( not ( = ?auto_21001 ?auto_21005 ) ) ( SUPPORTS ?auto_21005 ?auto_20997 ) ( CALIBRATION_TARGET ?auto_21005 ?auto_21003 ) ( not ( = ?auto_21003 ?auto_20998 ) ) ( ON_BOARD ?auto_21002 ?auto_21004 ) ( not ( = ?auto_20996 ?auto_20998 ) ) ( not ( = ?auto_21005 ?auto_21002 ) ) ( SUPPORTS ?auto_21002 ?auto_20999 ) ( CALIBRATION_TARGET ?auto_21002 ?auto_21003 ) ( not ( = ?auto_21003 ?auto_20995 ) ) ( ON_BOARD ?auto_21000 ?auto_21004 ) ( not ( = ?auto_20998 ?auto_20995 ) ) ( not ( = ?auto_21002 ?auto_21000 ) ) ( SUPPORTS ?auto_21000 ?auto_20994 ) ( CALIBRATION_TARGET ?auto_21000 ?auto_21003 ) ( POWER_AVAIL ?auto_21004 ) ( POINTING ?auto_21004 ?auto_21006 ) ( not ( = ?auto_21003 ?auto_21006 ) ) ( not ( = ?auto_20995 ?auto_21006 ) ) ( not ( = ?auto_20994 ?auto_20999 ) ) ( not ( = ?auto_20998 ?auto_21006 ) ) ( not ( = ?auto_20995 ?auto_20996 ) ) ( not ( = ?auto_20994 ?auto_20997 ) ) ( not ( = ?auto_20999 ?auto_20997 ) ) ( not ( = ?auto_20996 ?auto_21006 ) ) ( not ( = ?auto_21005 ?auto_21000 ) ) ( not ( = ?auto_20995 ?auto_20992 ) ) ( not ( = ?auto_20994 ?auto_20993 ) ) ( not ( = ?auto_20998 ?auto_20992 ) ) ( not ( = ?auto_20999 ?auto_20993 ) ) ( not ( = ?auto_20997 ?auto_20993 ) ) ( not ( = ?auto_20992 ?auto_21006 ) ) ( not ( = ?auto_21001 ?auto_21002 ) ) ( not ( = ?auto_21001 ?auto_21000 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_20995 ?auto_20994 ?auto_20998 ?auto_20999 ?auto_20992 ?auto_20993 ?auto_20996 ?auto_20997 )
      ( GET-4IMAGE-VERIFY ?auto_20992 ?auto_20993 ?auto_20995 ?auto_20994 ?auto_20996 ?auto_20997 ?auto_20998 ?auto_20999 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_21147 - DIRECTION
      ?auto_21148 - MODE
      ?auto_21150 - DIRECTION
      ?auto_21149 - MODE
      ?auto_21151 - DIRECTION
      ?auto_21152 - MODE
      ?auto_21153 - DIRECTION
      ?auto_21154 - MODE
    )
    :vars
    (
      ?auto_21156 - INSTRUMENT
      ?auto_21159 - SATELLITE
      ?auto_21158 - DIRECTION
      ?auto_21160 - INSTRUMENT
      ?auto_21157 - INSTRUMENT
      ?auto_21155 - INSTRUMENT
      ?auto_21161 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_21156 ?auto_21159 ) ( SUPPORTS ?auto_21156 ?auto_21148 ) ( not ( = ?auto_21147 ?auto_21158 ) ) ( CALIBRATION_TARGET ?auto_21156 ?auto_21158 ) ( not ( = ?auto_21158 ?auto_21153 ) ) ( ON_BOARD ?auto_21160 ?auto_21159 ) ( not ( = ?auto_21147 ?auto_21153 ) ) ( not ( = ?auto_21156 ?auto_21160 ) ) ( SUPPORTS ?auto_21160 ?auto_21154 ) ( CALIBRATION_TARGET ?auto_21160 ?auto_21158 ) ( not ( = ?auto_21158 ?auto_21150 ) ) ( ON_BOARD ?auto_21157 ?auto_21159 ) ( not ( = ?auto_21153 ?auto_21150 ) ) ( not ( = ?auto_21160 ?auto_21157 ) ) ( SUPPORTS ?auto_21157 ?auto_21149 ) ( CALIBRATION_TARGET ?auto_21157 ?auto_21158 ) ( not ( = ?auto_21158 ?auto_21151 ) ) ( ON_BOARD ?auto_21155 ?auto_21159 ) ( not ( = ?auto_21150 ?auto_21151 ) ) ( not ( = ?auto_21157 ?auto_21155 ) ) ( SUPPORTS ?auto_21155 ?auto_21152 ) ( CALIBRATION_TARGET ?auto_21155 ?auto_21158 ) ( POWER_AVAIL ?auto_21159 ) ( POINTING ?auto_21159 ?auto_21161 ) ( not ( = ?auto_21158 ?auto_21161 ) ) ( not ( = ?auto_21151 ?auto_21161 ) ) ( not ( = ?auto_21152 ?auto_21149 ) ) ( not ( = ?auto_21150 ?auto_21161 ) ) ( not ( = ?auto_21151 ?auto_21153 ) ) ( not ( = ?auto_21152 ?auto_21154 ) ) ( not ( = ?auto_21149 ?auto_21154 ) ) ( not ( = ?auto_21153 ?auto_21161 ) ) ( not ( = ?auto_21160 ?auto_21155 ) ) ( not ( = ?auto_21151 ?auto_21147 ) ) ( not ( = ?auto_21152 ?auto_21148 ) ) ( not ( = ?auto_21150 ?auto_21147 ) ) ( not ( = ?auto_21149 ?auto_21148 ) ) ( not ( = ?auto_21154 ?auto_21148 ) ) ( not ( = ?auto_21147 ?auto_21161 ) ) ( not ( = ?auto_21156 ?auto_21157 ) ) ( not ( = ?auto_21156 ?auto_21155 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_21151 ?auto_21152 ?auto_21150 ?auto_21149 ?auto_21147 ?auto_21148 ?auto_21153 ?auto_21154 )
      ( GET-4IMAGE-VERIFY ?auto_21147 ?auto_21148 ?auto_21150 ?auto_21149 ?auto_21151 ?auto_21152 ?auto_21153 ?auto_21154 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_21251 - DIRECTION
      ?auto_21252 - MODE
      ?auto_21254 - DIRECTION
      ?auto_21253 - MODE
      ?auto_21255 - DIRECTION
      ?auto_21256 - MODE
      ?auto_21257 - DIRECTION
      ?auto_21258 - MODE
    )
    :vars
    (
      ?auto_21260 - INSTRUMENT
      ?auto_21263 - SATELLITE
      ?auto_21262 - DIRECTION
      ?auto_21264 - INSTRUMENT
      ?auto_21261 - INSTRUMENT
      ?auto_21259 - INSTRUMENT
      ?auto_21265 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_21260 ?auto_21263 ) ( SUPPORTS ?auto_21260 ?auto_21252 ) ( not ( = ?auto_21251 ?auto_21262 ) ) ( CALIBRATION_TARGET ?auto_21260 ?auto_21262 ) ( not ( = ?auto_21262 ?auto_21255 ) ) ( ON_BOARD ?auto_21264 ?auto_21263 ) ( not ( = ?auto_21251 ?auto_21255 ) ) ( not ( = ?auto_21260 ?auto_21264 ) ) ( SUPPORTS ?auto_21264 ?auto_21256 ) ( CALIBRATION_TARGET ?auto_21264 ?auto_21262 ) ( not ( = ?auto_21262 ?auto_21254 ) ) ( ON_BOARD ?auto_21261 ?auto_21263 ) ( not ( = ?auto_21255 ?auto_21254 ) ) ( not ( = ?auto_21264 ?auto_21261 ) ) ( SUPPORTS ?auto_21261 ?auto_21253 ) ( CALIBRATION_TARGET ?auto_21261 ?auto_21262 ) ( not ( = ?auto_21262 ?auto_21257 ) ) ( ON_BOARD ?auto_21259 ?auto_21263 ) ( not ( = ?auto_21254 ?auto_21257 ) ) ( not ( = ?auto_21261 ?auto_21259 ) ) ( SUPPORTS ?auto_21259 ?auto_21258 ) ( CALIBRATION_TARGET ?auto_21259 ?auto_21262 ) ( POWER_AVAIL ?auto_21263 ) ( POINTING ?auto_21263 ?auto_21265 ) ( not ( = ?auto_21262 ?auto_21265 ) ) ( not ( = ?auto_21257 ?auto_21265 ) ) ( not ( = ?auto_21258 ?auto_21253 ) ) ( not ( = ?auto_21254 ?auto_21265 ) ) ( not ( = ?auto_21257 ?auto_21255 ) ) ( not ( = ?auto_21258 ?auto_21256 ) ) ( not ( = ?auto_21253 ?auto_21256 ) ) ( not ( = ?auto_21255 ?auto_21265 ) ) ( not ( = ?auto_21264 ?auto_21259 ) ) ( not ( = ?auto_21257 ?auto_21251 ) ) ( not ( = ?auto_21258 ?auto_21252 ) ) ( not ( = ?auto_21254 ?auto_21251 ) ) ( not ( = ?auto_21253 ?auto_21252 ) ) ( not ( = ?auto_21256 ?auto_21252 ) ) ( not ( = ?auto_21251 ?auto_21265 ) ) ( not ( = ?auto_21260 ?auto_21261 ) ) ( not ( = ?auto_21260 ?auto_21259 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_21257 ?auto_21258 ?auto_21254 ?auto_21253 ?auto_21251 ?auto_21252 ?auto_21255 ?auto_21256 )
      ( GET-4IMAGE-VERIFY ?auto_21251 ?auto_21252 ?auto_21254 ?auto_21253 ?auto_21255 ?auto_21256 ?auto_21257 ?auto_21258 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_21406 - DIRECTION
      ?auto_21407 - MODE
      ?auto_21409 - DIRECTION
      ?auto_21408 - MODE
      ?auto_21410 - DIRECTION
      ?auto_21411 - MODE
      ?auto_21412 - DIRECTION
      ?auto_21413 - MODE
    )
    :vars
    (
      ?auto_21415 - INSTRUMENT
      ?auto_21418 - SATELLITE
      ?auto_21417 - DIRECTION
      ?auto_21419 - INSTRUMENT
      ?auto_21416 - INSTRUMENT
      ?auto_21414 - INSTRUMENT
      ?auto_21420 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_21415 ?auto_21418 ) ( SUPPORTS ?auto_21415 ?auto_21407 ) ( not ( = ?auto_21406 ?auto_21417 ) ) ( CALIBRATION_TARGET ?auto_21415 ?auto_21417 ) ( not ( = ?auto_21417 ?auto_21409 ) ) ( ON_BOARD ?auto_21419 ?auto_21418 ) ( not ( = ?auto_21406 ?auto_21409 ) ) ( not ( = ?auto_21415 ?auto_21419 ) ) ( SUPPORTS ?auto_21419 ?auto_21408 ) ( CALIBRATION_TARGET ?auto_21419 ?auto_21417 ) ( not ( = ?auto_21417 ?auto_21412 ) ) ( ON_BOARD ?auto_21416 ?auto_21418 ) ( not ( = ?auto_21409 ?auto_21412 ) ) ( not ( = ?auto_21419 ?auto_21416 ) ) ( SUPPORTS ?auto_21416 ?auto_21413 ) ( CALIBRATION_TARGET ?auto_21416 ?auto_21417 ) ( not ( = ?auto_21417 ?auto_21410 ) ) ( ON_BOARD ?auto_21414 ?auto_21418 ) ( not ( = ?auto_21412 ?auto_21410 ) ) ( not ( = ?auto_21416 ?auto_21414 ) ) ( SUPPORTS ?auto_21414 ?auto_21411 ) ( CALIBRATION_TARGET ?auto_21414 ?auto_21417 ) ( POWER_AVAIL ?auto_21418 ) ( POINTING ?auto_21418 ?auto_21420 ) ( not ( = ?auto_21417 ?auto_21420 ) ) ( not ( = ?auto_21410 ?auto_21420 ) ) ( not ( = ?auto_21411 ?auto_21413 ) ) ( not ( = ?auto_21412 ?auto_21420 ) ) ( not ( = ?auto_21410 ?auto_21409 ) ) ( not ( = ?auto_21411 ?auto_21408 ) ) ( not ( = ?auto_21413 ?auto_21408 ) ) ( not ( = ?auto_21409 ?auto_21420 ) ) ( not ( = ?auto_21419 ?auto_21414 ) ) ( not ( = ?auto_21410 ?auto_21406 ) ) ( not ( = ?auto_21411 ?auto_21407 ) ) ( not ( = ?auto_21412 ?auto_21406 ) ) ( not ( = ?auto_21413 ?auto_21407 ) ) ( not ( = ?auto_21408 ?auto_21407 ) ) ( not ( = ?auto_21406 ?auto_21420 ) ) ( not ( = ?auto_21415 ?auto_21416 ) ) ( not ( = ?auto_21415 ?auto_21414 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_21410 ?auto_21411 ?auto_21412 ?auto_21413 ?auto_21406 ?auto_21407 ?auto_21409 ?auto_21408 )
      ( GET-4IMAGE-VERIFY ?auto_21406 ?auto_21407 ?auto_21409 ?auto_21408 ?auto_21410 ?auto_21411 ?auto_21412 ?auto_21413 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_21455 - DIRECTION
      ?auto_21456 - MODE
      ?auto_21458 - DIRECTION
      ?auto_21457 - MODE
      ?auto_21459 - DIRECTION
      ?auto_21460 - MODE
      ?auto_21461 - DIRECTION
      ?auto_21462 - MODE
    )
    :vars
    (
      ?auto_21464 - INSTRUMENT
      ?auto_21467 - SATELLITE
      ?auto_21466 - DIRECTION
      ?auto_21468 - INSTRUMENT
      ?auto_21465 - INSTRUMENT
      ?auto_21463 - INSTRUMENT
      ?auto_21469 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_21464 ?auto_21467 ) ( SUPPORTS ?auto_21464 ?auto_21456 ) ( not ( = ?auto_21455 ?auto_21466 ) ) ( CALIBRATION_TARGET ?auto_21464 ?auto_21466 ) ( not ( = ?auto_21466 ?auto_21458 ) ) ( ON_BOARD ?auto_21468 ?auto_21467 ) ( not ( = ?auto_21455 ?auto_21458 ) ) ( not ( = ?auto_21464 ?auto_21468 ) ) ( SUPPORTS ?auto_21468 ?auto_21457 ) ( CALIBRATION_TARGET ?auto_21468 ?auto_21466 ) ( not ( = ?auto_21466 ?auto_21459 ) ) ( ON_BOARD ?auto_21465 ?auto_21467 ) ( not ( = ?auto_21458 ?auto_21459 ) ) ( not ( = ?auto_21468 ?auto_21465 ) ) ( SUPPORTS ?auto_21465 ?auto_21460 ) ( CALIBRATION_TARGET ?auto_21465 ?auto_21466 ) ( not ( = ?auto_21466 ?auto_21461 ) ) ( ON_BOARD ?auto_21463 ?auto_21467 ) ( not ( = ?auto_21459 ?auto_21461 ) ) ( not ( = ?auto_21465 ?auto_21463 ) ) ( SUPPORTS ?auto_21463 ?auto_21462 ) ( CALIBRATION_TARGET ?auto_21463 ?auto_21466 ) ( POWER_AVAIL ?auto_21467 ) ( POINTING ?auto_21467 ?auto_21469 ) ( not ( = ?auto_21466 ?auto_21469 ) ) ( not ( = ?auto_21461 ?auto_21469 ) ) ( not ( = ?auto_21462 ?auto_21460 ) ) ( not ( = ?auto_21459 ?auto_21469 ) ) ( not ( = ?auto_21461 ?auto_21458 ) ) ( not ( = ?auto_21462 ?auto_21457 ) ) ( not ( = ?auto_21460 ?auto_21457 ) ) ( not ( = ?auto_21458 ?auto_21469 ) ) ( not ( = ?auto_21468 ?auto_21463 ) ) ( not ( = ?auto_21461 ?auto_21455 ) ) ( not ( = ?auto_21462 ?auto_21456 ) ) ( not ( = ?auto_21459 ?auto_21455 ) ) ( not ( = ?auto_21460 ?auto_21456 ) ) ( not ( = ?auto_21457 ?auto_21456 ) ) ( not ( = ?auto_21455 ?auto_21469 ) ) ( not ( = ?auto_21464 ?auto_21465 ) ) ( not ( = ?auto_21464 ?auto_21463 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_21461 ?auto_21462 ?auto_21459 ?auto_21460 ?auto_21455 ?auto_21456 ?auto_21458 ?auto_21457 )
      ( GET-4IMAGE-VERIFY ?auto_21455 ?auto_21456 ?auto_21458 ?auto_21457 ?auto_21459 ?auto_21460 ?auto_21461 ?auto_21462 ) )
  )

)

