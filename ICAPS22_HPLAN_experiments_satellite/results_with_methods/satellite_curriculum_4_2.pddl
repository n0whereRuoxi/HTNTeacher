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
      ?auto_12239 - DIRECTION
      ?auto_12240 - MODE
    )
    :vars
    (
      ?auto_12241 - INSTRUMENT
      ?auto_12242 - SATELLITE
      ?auto_12243 - DIRECTION
      ?auto_12244 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_12241 ?auto_12242 ) ( SUPPORTS ?auto_12241 ?auto_12240 ) ( not ( = ?auto_12239 ?auto_12243 ) ) ( CALIBRATION_TARGET ?auto_12241 ?auto_12243 ) ( POWER_AVAIL ?auto_12242 ) ( POINTING ?auto_12242 ?auto_12244 ) ( not ( = ?auto_12243 ?auto_12244 ) ) ( not ( = ?auto_12239 ?auto_12244 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_12242 ?auto_12243 ?auto_12244 )
      ( !SWITCH_ON ?auto_12241 ?auto_12242 )
      ( !CALIBRATE ?auto_12242 ?auto_12241 ?auto_12243 )
      ( !TURN_TO ?auto_12242 ?auto_12239 ?auto_12243 )
      ( !TAKE_IMAGE ?auto_12242 ?auto_12239 ?auto_12241 ?auto_12240 )
      ( GET-1IMAGE-VERIFY ?auto_12239 ?auto_12240 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_12247 - DIRECTION
      ?auto_12248 - MODE
    )
    :vars
    (
      ?auto_12249 - INSTRUMENT
      ?auto_12250 - SATELLITE
      ?auto_12251 - DIRECTION
      ?auto_12252 - DIRECTION
      ?auto_12253 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12249 ?auto_12250 ) ( SUPPORTS ?auto_12249 ?auto_12248 ) ( not ( = ?auto_12247 ?auto_12251 ) ) ( CALIBRATION_TARGET ?auto_12249 ?auto_12251 ) ( POINTING ?auto_12250 ?auto_12252 ) ( not ( = ?auto_12251 ?auto_12252 ) ) ( ON_BOARD ?auto_12253 ?auto_12250 ) ( POWER_ON ?auto_12253 ) ( not ( = ?auto_12247 ?auto_12252 ) ) ( not ( = ?auto_12249 ?auto_12253 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_12253 ?auto_12250 )
      ( !TURN_TO ?auto_12250 ?auto_12251 ?auto_12252 )
      ( !SWITCH_ON ?auto_12249 ?auto_12250 )
      ( !CALIBRATE ?auto_12250 ?auto_12249 ?auto_12251 )
      ( !TURN_TO ?auto_12250 ?auto_12247 ?auto_12251 )
      ( !TAKE_IMAGE ?auto_12250 ?auto_12247 ?auto_12249 ?auto_12248 )
      ( GET-1IMAGE-VERIFY ?auto_12247 ?auto_12248 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_12266 - DIRECTION
      ?auto_12267 - MODE
      ?auto_12269 - DIRECTION
      ?auto_12268 - MODE
    )
    :vars
    (
      ?auto_12272 - INSTRUMENT
      ?auto_12271 - SATELLITE
      ?auto_12273 - DIRECTION
      ?auto_12270 - INSTRUMENT
      ?auto_12274 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_12269 ?auto_12266 ) ) ( ON_BOARD ?auto_12272 ?auto_12271 ) ( SUPPORTS ?auto_12272 ?auto_12268 ) ( not ( = ?auto_12269 ?auto_12273 ) ) ( CALIBRATION_TARGET ?auto_12272 ?auto_12273 ) ( not ( = ?auto_12273 ?auto_12266 ) ) ( ON_BOARD ?auto_12270 ?auto_12271 ) ( not ( = ?auto_12272 ?auto_12270 ) ) ( SUPPORTS ?auto_12270 ?auto_12267 ) ( CALIBRATION_TARGET ?auto_12270 ?auto_12273 ) ( POWER_AVAIL ?auto_12271 ) ( POINTING ?auto_12271 ?auto_12274 ) ( not ( = ?auto_12273 ?auto_12274 ) ) ( not ( = ?auto_12266 ?auto_12274 ) ) ( not ( = ?auto_12267 ?auto_12268 ) ) ( not ( = ?auto_12269 ?auto_12274 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_12266 ?auto_12267 )
      ( GET-1IMAGE ?auto_12269 ?auto_12268 )
      ( GET-2IMAGE-VERIFY ?auto_12266 ?auto_12267 ?auto_12269 ?auto_12268 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_12275 - DIRECTION
      ?auto_12276 - MODE
      ?auto_12278 - DIRECTION
      ?auto_12277 - MODE
    )
    :vars
    (
      ?auto_12281 - INSTRUMENT
      ?auto_12282 - SATELLITE
      ?auto_12283 - DIRECTION
      ?auto_12280 - INSTRUMENT
      ?auto_12279 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_12278 ?auto_12275 ) ) ( ON_BOARD ?auto_12281 ?auto_12282 ) ( SUPPORTS ?auto_12281 ?auto_12276 ) ( not ( = ?auto_12275 ?auto_12283 ) ) ( CALIBRATION_TARGET ?auto_12281 ?auto_12283 ) ( not ( = ?auto_12283 ?auto_12278 ) ) ( ON_BOARD ?auto_12280 ?auto_12282 ) ( not ( = ?auto_12281 ?auto_12280 ) ) ( SUPPORTS ?auto_12280 ?auto_12277 ) ( CALIBRATION_TARGET ?auto_12280 ?auto_12283 ) ( POWER_AVAIL ?auto_12282 ) ( POINTING ?auto_12282 ?auto_12279 ) ( not ( = ?auto_12283 ?auto_12279 ) ) ( not ( = ?auto_12278 ?auto_12279 ) ) ( not ( = ?auto_12277 ?auto_12276 ) ) ( not ( = ?auto_12275 ?auto_12279 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12278 ?auto_12277 ?auto_12275 ?auto_12276 )
      ( GET-2IMAGE-VERIFY ?auto_12275 ?auto_12276 ?auto_12278 ?auto_12277 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_12297 - DIRECTION
      ?auto_12298 - MODE
    )
    :vars
    (
      ?auto_12299 - INSTRUMENT
      ?auto_12300 - SATELLITE
      ?auto_12301 - DIRECTION
      ?auto_12302 - DIRECTION
      ?auto_12303 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12299 ?auto_12300 ) ( SUPPORTS ?auto_12299 ?auto_12298 ) ( not ( = ?auto_12297 ?auto_12301 ) ) ( CALIBRATION_TARGET ?auto_12299 ?auto_12301 ) ( POINTING ?auto_12300 ?auto_12302 ) ( not ( = ?auto_12301 ?auto_12302 ) ) ( ON_BOARD ?auto_12303 ?auto_12300 ) ( POWER_ON ?auto_12303 ) ( not ( = ?auto_12297 ?auto_12302 ) ) ( not ( = ?auto_12299 ?auto_12303 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_12303 ?auto_12300 )
      ( !TURN_TO ?auto_12300 ?auto_12301 ?auto_12302 )
      ( !SWITCH_ON ?auto_12299 ?auto_12300 )
      ( !CALIBRATE ?auto_12300 ?auto_12299 ?auto_12301 )
      ( !TURN_TO ?auto_12300 ?auto_12297 ?auto_12301 )
      ( !TAKE_IMAGE ?auto_12300 ?auto_12297 ?auto_12299 ?auto_12298 )
      ( GET-1IMAGE-VERIFY ?auto_12297 ?auto_12298 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12432 - DIRECTION
      ?auto_12433 - MODE
      ?auto_12435 - DIRECTION
      ?auto_12434 - MODE
      ?auto_12436 - DIRECTION
      ?auto_12437 - MODE
    )
    :vars
    (
      ?auto_12439 - INSTRUMENT
      ?auto_12438 - SATELLITE
      ?auto_12440 - DIRECTION
      ?auto_12441 - INSTRUMENT
      ?auto_12443 - INSTRUMENT
      ?auto_12442 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_12435 ?auto_12432 ) ) ( not ( = ?auto_12436 ?auto_12432 ) ) ( not ( = ?auto_12436 ?auto_12435 ) ) ( ON_BOARD ?auto_12439 ?auto_12438 ) ( SUPPORTS ?auto_12439 ?auto_12437 ) ( not ( = ?auto_12436 ?auto_12440 ) ) ( CALIBRATION_TARGET ?auto_12439 ?auto_12440 ) ( not ( = ?auto_12440 ?auto_12435 ) ) ( ON_BOARD ?auto_12441 ?auto_12438 ) ( not ( = ?auto_12439 ?auto_12441 ) ) ( SUPPORTS ?auto_12441 ?auto_12434 ) ( CALIBRATION_TARGET ?auto_12441 ?auto_12440 ) ( not ( = ?auto_12440 ?auto_12432 ) ) ( ON_BOARD ?auto_12443 ?auto_12438 ) ( not ( = ?auto_12441 ?auto_12443 ) ) ( SUPPORTS ?auto_12443 ?auto_12433 ) ( CALIBRATION_TARGET ?auto_12443 ?auto_12440 ) ( POWER_AVAIL ?auto_12438 ) ( POINTING ?auto_12438 ?auto_12442 ) ( not ( = ?auto_12440 ?auto_12442 ) ) ( not ( = ?auto_12432 ?auto_12442 ) ) ( not ( = ?auto_12433 ?auto_12434 ) ) ( not ( = ?auto_12435 ?auto_12442 ) ) ( not ( = ?auto_12433 ?auto_12437 ) ) ( not ( = ?auto_12434 ?auto_12437 ) ) ( not ( = ?auto_12436 ?auto_12442 ) ) ( not ( = ?auto_12439 ?auto_12443 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12435 ?auto_12434 ?auto_12432 ?auto_12433 )
      ( GET-1IMAGE ?auto_12436 ?auto_12437 )
      ( GET-3IMAGE-VERIFY ?auto_12432 ?auto_12433 ?auto_12435 ?auto_12434 ?auto_12436 ?auto_12437 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12458 - DIRECTION
      ?auto_12459 - MODE
      ?auto_12461 - DIRECTION
      ?auto_12460 - MODE
      ?auto_12462 - DIRECTION
      ?auto_12463 - MODE
    )
    :vars
    (
      ?auto_12469 - INSTRUMENT
      ?auto_12468 - SATELLITE
      ?auto_12464 - DIRECTION
      ?auto_12465 - INSTRUMENT
      ?auto_12466 - INSTRUMENT
      ?auto_12467 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_12461 ?auto_12458 ) ) ( not ( = ?auto_12462 ?auto_12458 ) ) ( not ( = ?auto_12462 ?auto_12461 ) ) ( ON_BOARD ?auto_12469 ?auto_12468 ) ( SUPPORTS ?auto_12469 ?auto_12460 ) ( not ( = ?auto_12461 ?auto_12464 ) ) ( CALIBRATION_TARGET ?auto_12469 ?auto_12464 ) ( not ( = ?auto_12464 ?auto_12462 ) ) ( ON_BOARD ?auto_12465 ?auto_12468 ) ( not ( = ?auto_12469 ?auto_12465 ) ) ( SUPPORTS ?auto_12465 ?auto_12463 ) ( CALIBRATION_TARGET ?auto_12465 ?auto_12464 ) ( not ( = ?auto_12464 ?auto_12458 ) ) ( ON_BOARD ?auto_12466 ?auto_12468 ) ( not ( = ?auto_12465 ?auto_12466 ) ) ( SUPPORTS ?auto_12466 ?auto_12459 ) ( CALIBRATION_TARGET ?auto_12466 ?auto_12464 ) ( POWER_AVAIL ?auto_12468 ) ( POINTING ?auto_12468 ?auto_12467 ) ( not ( = ?auto_12464 ?auto_12467 ) ) ( not ( = ?auto_12458 ?auto_12467 ) ) ( not ( = ?auto_12459 ?auto_12463 ) ) ( not ( = ?auto_12462 ?auto_12467 ) ) ( not ( = ?auto_12459 ?auto_12460 ) ) ( not ( = ?auto_12463 ?auto_12460 ) ) ( not ( = ?auto_12461 ?auto_12467 ) ) ( not ( = ?auto_12469 ?auto_12466 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_12458 ?auto_12459 ?auto_12462 ?auto_12463 ?auto_12461 ?auto_12460 )
      ( GET-3IMAGE-VERIFY ?auto_12458 ?auto_12459 ?auto_12461 ?auto_12460 ?auto_12462 ?auto_12463 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12484 - DIRECTION
      ?auto_12485 - MODE
      ?auto_12487 - DIRECTION
      ?auto_12486 - MODE
      ?auto_12488 - DIRECTION
      ?auto_12489 - MODE
    )
    :vars
    (
      ?auto_12493 - INSTRUMENT
      ?auto_12491 - SATELLITE
      ?auto_12490 - DIRECTION
      ?auto_12492 - INSTRUMENT
      ?auto_12495 - INSTRUMENT
      ?auto_12494 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_12487 ?auto_12484 ) ) ( not ( = ?auto_12488 ?auto_12484 ) ) ( not ( = ?auto_12488 ?auto_12487 ) ) ( ON_BOARD ?auto_12493 ?auto_12491 ) ( SUPPORTS ?auto_12493 ?auto_12489 ) ( not ( = ?auto_12488 ?auto_12490 ) ) ( CALIBRATION_TARGET ?auto_12493 ?auto_12490 ) ( not ( = ?auto_12490 ?auto_12484 ) ) ( ON_BOARD ?auto_12492 ?auto_12491 ) ( not ( = ?auto_12493 ?auto_12492 ) ) ( SUPPORTS ?auto_12492 ?auto_12485 ) ( CALIBRATION_TARGET ?auto_12492 ?auto_12490 ) ( not ( = ?auto_12490 ?auto_12487 ) ) ( ON_BOARD ?auto_12495 ?auto_12491 ) ( not ( = ?auto_12492 ?auto_12495 ) ) ( SUPPORTS ?auto_12495 ?auto_12486 ) ( CALIBRATION_TARGET ?auto_12495 ?auto_12490 ) ( POWER_AVAIL ?auto_12491 ) ( POINTING ?auto_12491 ?auto_12494 ) ( not ( = ?auto_12490 ?auto_12494 ) ) ( not ( = ?auto_12487 ?auto_12494 ) ) ( not ( = ?auto_12486 ?auto_12485 ) ) ( not ( = ?auto_12484 ?auto_12494 ) ) ( not ( = ?auto_12486 ?auto_12489 ) ) ( not ( = ?auto_12485 ?auto_12489 ) ) ( not ( = ?auto_12488 ?auto_12494 ) ) ( not ( = ?auto_12493 ?auto_12495 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_12487 ?auto_12486 ?auto_12488 ?auto_12489 ?auto_12484 ?auto_12485 )
      ( GET-3IMAGE-VERIFY ?auto_12484 ?auto_12485 ?auto_12487 ?auto_12486 ?auto_12488 ?auto_12489 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12510 - DIRECTION
      ?auto_12511 - MODE
      ?auto_12513 - DIRECTION
      ?auto_12512 - MODE
      ?auto_12514 - DIRECTION
      ?auto_12515 - MODE
    )
    :vars
    (
      ?auto_12519 - INSTRUMENT
      ?auto_12517 - SATELLITE
      ?auto_12516 - DIRECTION
      ?auto_12518 - INSTRUMENT
      ?auto_12521 - INSTRUMENT
      ?auto_12520 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_12513 ?auto_12510 ) ) ( not ( = ?auto_12514 ?auto_12510 ) ) ( not ( = ?auto_12514 ?auto_12513 ) ) ( ON_BOARD ?auto_12519 ?auto_12517 ) ( SUPPORTS ?auto_12519 ?auto_12512 ) ( not ( = ?auto_12513 ?auto_12516 ) ) ( CALIBRATION_TARGET ?auto_12519 ?auto_12516 ) ( not ( = ?auto_12516 ?auto_12510 ) ) ( ON_BOARD ?auto_12518 ?auto_12517 ) ( not ( = ?auto_12519 ?auto_12518 ) ) ( SUPPORTS ?auto_12518 ?auto_12511 ) ( CALIBRATION_TARGET ?auto_12518 ?auto_12516 ) ( not ( = ?auto_12516 ?auto_12514 ) ) ( ON_BOARD ?auto_12521 ?auto_12517 ) ( not ( = ?auto_12518 ?auto_12521 ) ) ( SUPPORTS ?auto_12521 ?auto_12515 ) ( CALIBRATION_TARGET ?auto_12521 ?auto_12516 ) ( POWER_AVAIL ?auto_12517 ) ( POINTING ?auto_12517 ?auto_12520 ) ( not ( = ?auto_12516 ?auto_12520 ) ) ( not ( = ?auto_12514 ?auto_12520 ) ) ( not ( = ?auto_12515 ?auto_12511 ) ) ( not ( = ?auto_12510 ?auto_12520 ) ) ( not ( = ?auto_12515 ?auto_12512 ) ) ( not ( = ?auto_12511 ?auto_12512 ) ) ( not ( = ?auto_12513 ?auto_12520 ) ) ( not ( = ?auto_12519 ?auto_12521 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_12514 ?auto_12515 ?auto_12513 ?auto_12512 ?auto_12510 ?auto_12511 )
      ( GET-3IMAGE-VERIFY ?auto_12510 ?auto_12511 ?auto_12513 ?auto_12512 ?auto_12514 ?auto_12515 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12564 - DIRECTION
      ?auto_12565 - MODE
      ?auto_12567 - DIRECTION
      ?auto_12566 - MODE
      ?auto_12568 - DIRECTION
      ?auto_12569 - MODE
    )
    :vars
    (
      ?auto_12573 - INSTRUMENT
      ?auto_12571 - SATELLITE
      ?auto_12570 - DIRECTION
      ?auto_12572 - INSTRUMENT
      ?auto_12575 - INSTRUMENT
      ?auto_12574 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_12567 ?auto_12564 ) ) ( not ( = ?auto_12568 ?auto_12564 ) ) ( not ( = ?auto_12568 ?auto_12567 ) ) ( ON_BOARD ?auto_12573 ?auto_12571 ) ( SUPPORTS ?auto_12573 ?auto_12565 ) ( not ( = ?auto_12564 ?auto_12570 ) ) ( CALIBRATION_TARGET ?auto_12573 ?auto_12570 ) ( not ( = ?auto_12570 ?auto_12568 ) ) ( ON_BOARD ?auto_12572 ?auto_12571 ) ( not ( = ?auto_12573 ?auto_12572 ) ) ( SUPPORTS ?auto_12572 ?auto_12569 ) ( CALIBRATION_TARGET ?auto_12572 ?auto_12570 ) ( not ( = ?auto_12570 ?auto_12567 ) ) ( ON_BOARD ?auto_12575 ?auto_12571 ) ( not ( = ?auto_12572 ?auto_12575 ) ) ( SUPPORTS ?auto_12575 ?auto_12566 ) ( CALIBRATION_TARGET ?auto_12575 ?auto_12570 ) ( POWER_AVAIL ?auto_12571 ) ( POINTING ?auto_12571 ?auto_12574 ) ( not ( = ?auto_12570 ?auto_12574 ) ) ( not ( = ?auto_12567 ?auto_12574 ) ) ( not ( = ?auto_12566 ?auto_12569 ) ) ( not ( = ?auto_12568 ?auto_12574 ) ) ( not ( = ?auto_12566 ?auto_12565 ) ) ( not ( = ?auto_12569 ?auto_12565 ) ) ( not ( = ?auto_12564 ?auto_12574 ) ) ( not ( = ?auto_12573 ?auto_12575 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_12567 ?auto_12566 ?auto_12564 ?auto_12565 ?auto_12568 ?auto_12569 )
      ( GET-3IMAGE-VERIFY ?auto_12564 ?auto_12565 ?auto_12567 ?auto_12566 ?auto_12568 ?auto_12569 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12590 - DIRECTION
      ?auto_12591 - MODE
      ?auto_12593 - DIRECTION
      ?auto_12592 - MODE
      ?auto_12594 - DIRECTION
      ?auto_12595 - MODE
    )
    :vars
    (
      ?auto_12599 - INSTRUMENT
      ?auto_12597 - SATELLITE
      ?auto_12596 - DIRECTION
      ?auto_12598 - INSTRUMENT
      ?auto_12601 - INSTRUMENT
      ?auto_12600 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_12593 ?auto_12590 ) ) ( not ( = ?auto_12594 ?auto_12590 ) ) ( not ( = ?auto_12594 ?auto_12593 ) ) ( ON_BOARD ?auto_12599 ?auto_12597 ) ( SUPPORTS ?auto_12599 ?auto_12591 ) ( not ( = ?auto_12590 ?auto_12596 ) ) ( CALIBRATION_TARGET ?auto_12599 ?auto_12596 ) ( not ( = ?auto_12596 ?auto_12593 ) ) ( ON_BOARD ?auto_12598 ?auto_12597 ) ( not ( = ?auto_12599 ?auto_12598 ) ) ( SUPPORTS ?auto_12598 ?auto_12592 ) ( CALIBRATION_TARGET ?auto_12598 ?auto_12596 ) ( not ( = ?auto_12596 ?auto_12594 ) ) ( ON_BOARD ?auto_12601 ?auto_12597 ) ( not ( = ?auto_12598 ?auto_12601 ) ) ( SUPPORTS ?auto_12601 ?auto_12595 ) ( CALIBRATION_TARGET ?auto_12601 ?auto_12596 ) ( POWER_AVAIL ?auto_12597 ) ( POINTING ?auto_12597 ?auto_12600 ) ( not ( = ?auto_12596 ?auto_12600 ) ) ( not ( = ?auto_12594 ?auto_12600 ) ) ( not ( = ?auto_12595 ?auto_12592 ) ) ( not ( = ?auto_12593 ?auto_12600 ) ) ( not ( = ?auto_12595 ?auto_12591 ) ) ( not ( = ?auto_12592 ?auto_12591 ) ) ( not ( = ?auto_12590 ?auto_12600 ) ) ( not ( = ?auto_12599 ?auto_12601 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_12594 ?auto_12595 ?auto_12590 ?auto_12591 ?auto_12593 ?auto_12592 )
      ( GET-3IMAGE-VERIFY ?auto_12590 ?auto_12591 ?auto_12593 ?auto_12592 ?auto_12594 ?auto_12595 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_12676 - DIRECTION
      ?auto_12677 - MODE
    )
    :vars
    (
      ?auto_12678 - INSTRUMENT
      ?auto_12679 - SATELLITE
      ?auto_12680 - DIRECTION
      ?auto_12681 - DIRECTION
      ?auto_12682 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12678 ?auto_12679 ) ( SUPPORTS ?auto_12678 ?auto_12677 ) ( not ( = ?auto_12676 ?auto_12680 ) ) ( CALIBRATION_TARGET ?auto_12678 ?auto_12680 ) ( POINTING ?auto_12679 ?auto_12681 ) ( not ( = ?auto_12680 ?auto_12681 ) ) ( ON_BOARD ?auto_12682 ?auto_12679 ) ( POWER_ON ?auto_12682 ) ( not ( = ?auto_12676 ?auto_12681 ) ) ( not ( = ?auto_12678 ?auto_12682 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_12682 ?auto_12679 )
      ( !TURN_TO ?auto_12679 ?auto_12680 ?auto_12681 )
      ( !SWITCH_ON ?auto_12678 ?auto_12679 )
      ( !CALIBRATE ?auto_12679 ?auto_12678 ?auto_12680 )
      ( !TURN_TO ?auto_12679 ?auto_12676 ?auto_12680 )
      ( !TAKE_IMAGE ?auto_12679 ?auto_12676 ?auto_12678 ?auto_12677 )
      ( GET-1IMAGE-VERIFY ?auto_12676 ?auto_12677 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_14242 - DIRECTION
      ?auto_14243 - MODE
      ?auto_14245 - DIRECTION
      ?auto_14244 - MODE
      ?auto_14246 - DIRECTION
      ?auto_14247 - MODE
      ?auto_14248 - DIRECTION
      ?auto_14249 - MODE
    )
    :vars
    (
      ?auto_14253 - INSTRUMENT
      ?auto_14251 - SATELLITE
      ?auto_14250 - DIRECTION
      ?auto_14252 - INSTRUMENT
      ?auto_14254 - INSTRUMENT
      ?auto_14256 - INSTRUMENT
      ?auto_14255 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14245 ?auto_14242 ) ) ( not ( = ?auto_14246 ?auto_14242 ) ) ( not ( = ?auto_14246 ?auto_14245 ) ) ( not ( = ?auto_14248 ?auto_14242 ) ) ( not ( = ?auto_14248 ?auto_14245 ) ) ( not ( = ?auto_14248 ?auto_14246 ) ) ( ON_BOARD ?auto_14253 ?auto_14251 ) ( SUPPORTS ?auto_14253 ?auto_14249 ) ( not ( = ?auto_14248 ?auto_14250 ) ) ( CALIBRATION_TARGET ?auto_14253 ?auto_14250 ) ( not ( = ?auto_14250 ?auto_14246 ) ) ( ON_BOARD ?auto_14252 ?auto_14251 ) ( not ( = ?auto_14253 ?auto_14252 ) ) ( SUPPORTS ?auto_14252 ?auto_14247 ) ( CALIBRATION_TARGET ?auto_14252 ?auto_14250 ) ( not ( = ?auto_14250 ?auto_14245 ) ) ( ON_BOARD ?auto_14254 ?auto_14251 ) ( not ( = ?auto_14252 ?auto_14254 ) ) ( SUPPORTS ?auto_14254 ?auto_14244 ) ( CALIBRATION_TARGET ?auto_14254 ?auto_14250 ) ( not ( = ?auto_14250 ?auto_14242 ) ) ( ON_BOARD ?auto_14256 ?auto_14251 ) ( not ( = ?auto_14254 ?auto_14256 ) ) ( SUPPORTS ?auto_14256 ?auto_14243 ) ( CALIBRATION_TARGET ?auto_14256 ?auto_14250 ) ( POWER_AVAIL ?auto_14251 ) ( POINTING ?auto_14251 ?auto_14255 ) ( not ( = ?auto_14250 ?auto_14255 ) ) ( not ( = ?auto_14242 ?auto_14255 ) ) ( not ( = ?auto_14243 ?auto_14244 ) ) ( not ( = ?auto_14245 ?auto_14255 ) ) ( not ( = ?auto_14243 ?auto_14247 ) ) ( not ( = ?auto_14244 ?auto_14247 ) ) ( not ( = ?auto_14246 ?auto_14255 ) ) ( not ( = ?auto_14252 ?auto_14256 ) ) ( not ( = ?auto_14243 ?auto_14249 ) ) ( not ( = ?auto_14244 ?auto_14249 ) ) ( not ( = ?auto_14247 ?auto_14249 ) ) ( not ( = ?auto_14248 ?auto_14255 ) ) ( not ( = ?auto_14253 ?auto_14254 ) ) ( not ( = ?auto_14253 ?auto_14256 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_14242 ?auto_14243 ?auto_14246 ?auto_14247 ?auto_14245 ?auto_14244 )
      ( GET-1IMAGE ?auto_14248 ?auto_14249 )
      ( GET-4IMAGE-VERIFY ?auto_14242 ?auto_14243 ?auto_14245 ?auto_14244 ?auto_14246 ?auto_14247 ?auto_14248 ?auto_14249 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_14291 - DIRECTION
      ?auto_14292 - MODE
      ?auto_14294 - DIRECTION
      ?auto_14293 - MODE
      ?auto_14295 - DIRECTION
      ?auto_14296 - MODE
      ?auto_14297 - DIRECTION
      ?auto_14298 - MODE
    )
    :vars
    (
      ?auto_14303 - INSTRUMENT
      ?auto_14299 - SATELLITE
      ?auto_14304 - DIRECTION
      ?auto_14302 - INSTRUMENT
      ?auto_14301 - INSTRUMENT
      ?auto_14300 - INSTRUMENT
      ?auto_14305 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14294 ?auto_14291 ) ) ( not ( = ?auto_14295 ?auto_14291 ) ) ( not ( = ?auto_14295 ?auto_14294 ) ) ( not ( = ?auto_14297 ?auto_14291 ) ) ( not ( = ?auto_14297 ?auto_14294 ) ) ( not ( = ?auto_14297 ?auto_14295 ) ) ( ON_BOARD ?auto_14303 ?auto_14299 ) ( SUPPORTS ?auto_14303 ?auto_14296 ) ( not ( = ?auto_14295 ?auto_14304 ) ) ( CALIBRATION_TARGET ?auto_14303 ?auto_14304 ) ( not ( = ?auto_14304 ?auto_14297 ) ) ( ON_BOARD ?auto_14302 ?auto_14299 ) ( not ( = ?auto_14303 ?auto_14302 ) ) ( SUPPORTS ?auto_14302 ?auto_14298 ) ( CALIBRATION_TARGET ?auto_14302 ?auto_14304 ) ( not ( = ?auto_14304 ?auto_14294 ) ) ( ON_BOARD ?auto_14301 ?auto_14299 ) ( not ( = ?auto_14302 ?auto_14301 ) ) ( SUPPORTS ?auto_14301 ?auto_14293 ) ( CALIBRATION_TARGET ?auto_14301 ?auto_14304 ) ( not ( = ?auto_14304 ?auto_14291 ) ) ( ON_BOARD ?auto_14300 ?auto_14299 ) ( not ( = ?auto_14301 ?auto_14300 ) ) ( SUPPORTS ?auto_14300 ?auto_14292 ) ( CALIBRATION_TARGET ?auto_14300 ?auto_14304 ) ( POWER_AVAIL ?auto_14299 ) ( POINTING ?auto_14299 ?auto_14305 ) ( not ( = ?auto_14304 ?auto_14305 ) ) ( not ( = ?auto_14291 ?auto_14305 ) ) ( not ( = ?auto_14292 ?auto_14293 ) ) ( not ( = ?auto_14294 ?auto_14305 ) ) ( not ( = ?auto_14292 ?auto_14298 ) ) ( not ( = ?auto_14293 ?auto_14298 ) ) ( not ( = ?auto_14297 ?auto_14305 ) ) ( not ( = ?auto_14302 ?auto_14300 ) ) ( not ( = ?auto_14292 ?auto_14296 ) ) ( not ( = ?auto_14293 ?auto_14296 ) ) ( not ( = ?auto_14298 ?auto_14296 ) ) ( not ( = ?auto_14295 ?auto_14305 ) ) ( not ( = ?auto_14303 ?auto_14301 ) ) ( not ( = ?auto_14303 ?auto_14300 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_14291 ?auto_14292 ?auto_14294 ?auto_14293 ?auto_14297 ?auto_14298 ?auto_14295 ?auto_14296 )
      ( GET-4IMAGE-VERIFY ?auto_14291 ?auto_14292 ?auto_14294 ?auto_14293 ?auto_14295 ?auto_14296 ?auto_14297 ?auto_14298 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_14340 - DIRECTION
      ?auto_14341 - MODE
      ?auto_14343 - DIRECTION
      ?auto_14342 - MODE
      ?auto_14344 - DIRECTION
      ?auto_14345 - MODE
      ?auto_14346 - DIRECTION
      ?auto_14347 - MODE
    )
    :vars
    (
      ?auto_14352 - INSTRUMENT
      ?auto_14354 - SATELLITE
      ?auto_14353 - DIRECTION
      ?auto_14351 - INSTRUMENT
      ?auto_14350 - INSTRUMENT
      ?auto_14349 - INSTRUMENT
      ?auto_14348 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14343 ?auto_14340 ) ) ( not ( = ?auto_14344 ?auto_14340 ) ) ( not ( = ?auto_14344 ?auto_14343 ) ) ( not ( = ?auto_14346 ?auto_14340 ) ) ( not ( = ?auto_14346 ?auto_14343 ) ) ( not ( = ?auto_14346 ?auto_14344 ) ) ( ON_BOARD ?auto_14352 ?auto_14354 ) ( SUPPORTS ?auto_14352 ?auto_14347 ) ( not ( = ?auto_14346 ?auto_14353 ) ) ( CALIBRATION_TARGET ?auto_14352 ?auto_14353 ) ( not ( = ?auto_14353 ?auto_14343 ) ) ( ON_BOARD ?auto_14351 ?auto_14354 ) ( not ( = ?auto_14352 ?auto_14351 ) ) ( SUPPORTS ?auto_14351 ?auto_14342 ) ( CALIBRATION_TARGET ?auto_14351 ?auto_14353 ) ( not ( = ?auto_14353 ?auto_14344 ) ) ( ON_BOARD ?auto_14350 ?auto_14354 ) ( not ( = ?auto_14351 ?auto_14350 ) ) ( SUPPORTS ?auto_14350 ?auto_14345 ) ( CALIBRATION_TARGET ?auto_14350 ?auto_14353 ) ( not ( = ?auto_14353 ?auto_14340 ) ) ( ON_BOARD ?auto_14349 ?auto_14354 ) ( not ( = ?auto_14350 ?auto_14349 ) ) ( SUPPORTS ?auto_14349 ?auto_14341 ) ( CALIBRATION_TARGET ?auto_14349 ?auto_14353 ) ( POWER_AVAIL ?auto_14354 ) ( POINTING ?auto_14354 ?auto_14348 ) ( not ( = ?auto_14353 ?auto_14348 ) ) ( not ( = ?auto_14340 ?auto_14348 ) ) ( not ( = ?auto_14341 ?auto_14345 ) ) ( not ( = ?auto_14344 ?auto_14348 ) ) ( not ( = ?auto_14341 ?auto_14342 ) ) ( not ( = ?auto_14345 ?auto_14342 ) ) ( not ( = ?auto_14343 ?auto_14348 ) ) ( not ( = ?auto_14351 ?auto_14349 ) ) ( not ( = ?auto_14341 ?auto_14347 ) ) ( not ( = ?auto_14345 ?auto_14347 ) ) ( not ( = ?auto_14342 ?auto_14347 ) ) ( not ( = ?auto_14346 ?auto_14348 ) ) ( not ( = ?auto_14352 ?auto_14350 ) ) ( not ( = ?auto_14352 ?auto_14349 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_14340 ?auto_14341 ?auto_14344 ?auto_14345 ?auto_14346 ?auto_14347 ?auto_14343 ?auto_14342 )
      ( GET-4IMAGE-VERIFY ?auto_14340 ?auto_14341 ?auto_14343 ?auto_14342 ?auto_14344 ?auto_14345 ?auto_14346 ?auto_14347 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_14389 - DIRECTION
      ?auto_14390 - MODE
      ?auto_14392 - DIRECTION
      ?auto_14391 - MODE
      ?auto_14393 - DIRECTION
      ?auto_14394 - MODE
      ?auto_14395 - DIRECTION
      ?auto_14396 - MODE
    )
    :vars
    (
      ?auto_14401 - INSTRUMENT
      ?auto_14403 - SATELLITE
      ?auto_14402 - DIRECTION
      ?auto_14400 - INSTRUMENT
      ?auto_14399 - INSTRUMENT
      ?auto_14398 - INSTRUMENT
      ?auto_14397 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14392 ?auto_14389 ) ) ( not ( = ?auto_14393 ?auto_14389 ) ) ( not ( = ?auto_14393 ?auto_14392 ) ) ( not ( = ?auto_14395 ?auto_14389 ) ) ( not ( = ?auto_14395 ?auto_14392 ) ) ( not ( = ?auto_14395 ?auto_14393 ) ) ( ON_BOARD ?auto_14401 ?auto_14403 ) ( SUPPORTS ?auto_14401 ?auto_14394 ) ( not ( = ?auto_14393 ?auto_14402 ) ) ( CALIBRATION_TARGET ?auto_14401 ?auto_14402 ) ( not ( = ?auto_14402 ?auto_14392 ) ) ( ON_BOARD ?auto_14400 ?auto_14403 ) ( not ( = ?auto_14401 ?auto_14400 ) ) ( SUPPORTS ?auto_14400 ?auto_14391 ) ( CALIBRATION_TARGET ?auto_14400 ?auto_14402 ) ( not ( = ?auto_14402 ?auto_14395 ) ) ( ON_BOARD ?auto_14399 ?auto_14403 ) ( not ( = ?auto_14400 ?auto_14399 ) ) ( SUPPORTS ?auto_14399 ?auto_14396 ) ( CALIBRATION_TARGET ?auto_14399 ?auto_14402 ) ( not ( = ?auto_14402 ?auto_14389 ) ) ( ON_BOARD ?auto_14398 ?auto_14403 ) ( not ( = ?auto_14399 ?auto_14398 ) ) ( SUPPORTS ?auto_14398 ?auto_14390 ) ( CALIBRATION_TARGET ?auto_14398 ?auto_14402 ) ( POWER_AVAIL ?auto_14403 ) ( POINTING ?auto_14403 ?auto_14397 ) ( not ( = ?auto_14402 ?auto_14397 ) ) ( not ( = ?auto_14389 ?auto_14397 ) ) ( not ( = ?auto_14390 ?auto_14396 ) ) ( not ( = ?auto_14395 ?auto_14397 ) ) ( not ( = ?auto_14390 ?auto_14391 ) ) ( not ( = ?auto_14396 ?auto_14391 ) ) ( not ( = ?auto_14392 ?auto_14397 ) ) ( not ( = ?auto_14400 ?auto_14398 ) ) ( not ( = ?auto_14390 ?auto_14394 ) ) ( not ( = ?auto_14396 ?auto_14394 ) ) ( not ( = ?auto_14391 ?auto_14394 ) ) ( not ( = ?auto_14393 ?auto_14397 ) ) ( not ( = ?auto_14401 ?auto_14399 ) ) ( not ( = ?auto_14401 ?auto_14398 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_14389 ?auto_14390 ?auto_14395 ?auto_14396 ?auto_14393 ?auto_14394 ?auto_14392 ?auto_14391 )
      ( GET-4IMAGE-VERIFY ?auto_14389 ?auto_14390 ?auto_14392 ?auto_14391 ?auto_14393 ?auto_14394 ?auto_14395 ?auto_14396 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_14544 - DIRECTION
      ?auto_14545 - MODE
      ?auto_14547 - DIRECTION
      ?auto_14546 - MODE
      ?auto_14548 - DIRECTION
      ?auto_14549 - MODE
      ?auto_14550 - DIRECTION
      ?auto_14551 - MODE
    )
    :vars
    (
      ?auto_14556 - INSTRUMENT
      ?auto_14558 - SATELLITE
      ?auto_14557 - DIRECTION
      ?auto_14555 - INSTRUMENT
      ?auto_14554 - INSTRUMENT
      ?auto_14553 - INSTRUMENT
      ?auto_14552 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14547 ?auto_14544 ) ) ( not ( = ?auto_14548 ?auto_14544 ) ) ( not ( = ?auto_14548 ?auto_14547 ) ) ( not ( = ?auto_14550 ?auto_14544 ) ) ( not ( = ?auto_14550 ?auto_14547 ) ) ( not ( = ?auto_14550 ?auto_14548 ) ) ( ON_BOARD ?auto_14556 ?auto_14558 ) ( SUPPORTS ?auto_14556 ?auto_14546 ) ( not ( = ?auto_14547 ?auto_14557 ) ) ( CALIBRATION_TARGET ?auto_14556 ?auto_14557 ) ( not ( = ?auto_14557 ?auto_14550 ) ) ( ON_BOARD ?auto_14555 ?auto_14558 ) ( not ( = ?auto_14556 ?auto_14555 ) ) ( SUPPORTS ?auto_14555 ?auto_14551 ) ( CALIBRATION_TARGET ?auto_14555 ?auto_14557 ) ( not ( = ?auto_14557 ?auto_14548 ) ) ( ON_BOARD ?auto_14554 ?auto_14558 ) ( not ( = ?auto_14555 ?auto_14554 ) ) ( SUPPORTS ?auto_14554 ?auto_14549 ) ( CALIBRATION_TARGET ?auto_14554 ?auto_14557 ) ( not ( = ?auto_14557 ?auto_14544 ) ) ( ON_BOARD ?auto_14553 ?auto_14558 ) ( not ( = ?auto_14554 ?auto_14553 ) ) ( SUPPORTS ?auto_14553 ?auto_14545 ) ( CALIBRATION_TARGET ?auto_14553 ?auto_14557 ) ( POWER_AVAIL ?auto_14558 ) ( POINTING ?auto_14558 ?auto_14552 ) ( not ( = ?auto_14557 ?auto_14552 ) ) ( not ( = ?auto_14544 ?auto_14552 ) ) ( not ( = ?auto_14545 ?auto_14549 ) ) ( not ( = ?auto_14548 ?auto_14552 ) ) ( not ( = ?auto_14545 ?auto_14551 ) ) ( not ( = ?auto_14549 ?auto_14551 ) ) ( not ( = ?auto_14550 ?auto_14552 ) ) ( not ( = ?auto_14555 ?auto_14553 ) ) ( not ( = ?auto_14545 ?auto_14546 ) ) ( not ( = ?auto_14549 ?auto_14546 ) ) ( not ( = ?auto_14551 ?auto_14546 ) ) ( not ( = ?auto_14547 ?auto_14552 ) ) ( not ( = ?auto_14556 ?auto_14554 ) ) ( not ( = ?auto_14556 ?auto_14553 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_14544 ?auto_14545 ?auto_14548 ?auto_14549 ?auto_14547 ?auto_14546 ?auto_14550 ?auto_14551 )
      ( GET-4IMAGE-VERIFY ?auto_14544 ?auto_14545 ?auto_14547 ?auto_14546 ?auto_14548 ?auto_14549 ?auto_14550 ?auto_14551 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_14593 - DIRECTION
      ?auto_14594 - MODE
      ?auto_14596 - DIRECTION
      ?auto_14595 - MODE
      ?auto_14597 - DIRECTION
      ?auto_14598 - MODE
      ?auto_14599 - DIRECTION
      ?auto_14600 - MODE
    )
    :vars
    (
      ?auto_14605 - INSTRUMENT
      ?auto_14607 - SATELLITE
      ?auto_14606 - DIRECTION
      ?auto_14604 - INSTRUMENT
      ?auto_14603 - INSTRUMENT
      ?auto_14602 - INSTRUMENT
      ?auto_14601 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14596 ?auto_14593 ) ) ( not ( = ?auto_14597 ?auto_14593 ) ) ( not ( = ?auto_14597 ?auto_14596 ) ) ( not ( = ?auto_14599 ?auto_14593 ) ) ( not ( = ?auto_14599 ?auto_14596 ) ) ( not ( = ?auto_14599 ?auto_14597 ) ) ( ON_BOARD ?auto_14605 ?auto_14607 ) ( SUPPORTS ?auto_14605 ?auto_14595 ) ( not ( = ?auto_14596 ?auto_14606 ) ) ( CALIBRATION_TARGET ?auto_14605 ?auto_14606 ) ( not ( = ?auto_14606 ?auto_14597 ) ) ( ON_BOARD ?auto_14604 ?auto_14607 ) ( not ( = ?auto_14605 ?auto_14604 ) ) ( SUPPORTS ?auto_14604 ?auto_14598 ) ( CALIBRATION_TARGET ?auto_14604 ?auto_14606 ) ( not ( = ?auto_14606 ?auto_14599 ) ) ( ON_BOARD ?auto_14603 ?auto_14607 ) ( not ( = ?auto_14604 ?auto_14603 ) ) ( SUPPORTS ?auto_14603 ?auto_14600 ) ( CALIBRATION_TARGET ?auto_14603 ?auto_14606 ) ( not ( = ?auto_14606 ?auto_14593 ) ) ( ON_BOARD ?auto_14602 ?auto_14607 ) ( not ( = ?auto_14603 ?auto_14602 ) ) ( SUPPORTS ?auto_14602 ?auto_14594 ) ( CALIBRATION_TARGET ?auto_14602 ?auto_14606 ) ( POWER_AVAIL ?auto_14607 ) ( POINTING ?auto_14607 ?auto_14601 ) ( not ( = ?auto_14606 ?auto_14601 ) ) ( not ( = ?auto_14593 ?auto_14601 ) ) ( not ( = ?auto_14594 ?auto_14600 ) ) ( not ( = ?auto_14599 ?auto_14601 ) ) ( not ( = ?auto_14594 ?auto_14598 ) ) ( not ( = ?auto_14600 ?auto_14598 ) ) ( not ( = ?auto_14597 ?auto_14601 ) ) ( not ( = ?auto_14604 ?auto_14602 ) ) ( not ( = ?auto_14594 ?auto_14595 ) ) ( not ( = ?auto_14600 ?auto_14595 ) ) ( not ( = ?auto_14598 ?auto_14595 ) ) ( not ( = ?auto_14596 ?auto_14601 ) ) ( not ( = ?auto_14605 ?auto_14603 ) ) ( not ( = ?auto_14605 ?auto_14602 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_14593 ?auto_14594 ?auto_14599 ?auto_14600 ?auto_14596 ?auto_14595 ?auto_14597 ?auto_14598 )
      ( GET-4IMAGE-VERIFY ?auto_14593 ?auto_14594 ?auto_14596 ?auto_14595 ?auto_14597 ?auto_14598 ?auto_14599 ?auto_14600 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_14748 - DIRECTION
      ?auto_14749 - MODE
      ?auto_14751 - DIRECTION
      ?auto_14750 - MODE
      ?auto_14752 - DIRECTION
      ?auto_14753 - MODE
      ?auto_14754 - DIRECTION
      ?auto_14755 - MODE
    )
    :vars
    (
      ?auto_14760 - INSTRUMENT
      ?auto_14762 - SATELLITE
      ?auto_14761 - DIRECTION
      ?auto_14759 - INSTRUMENT
      ?auto_14758 - INSTRUMENT
      ?auto_14757 - INSTRUMENT
      ?auto_14756 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14751 ?auto_14748 ) ) ( not ( = ?auto_14752 ?auto_14748 ) ) ( not ( = ?auto_14752 ?auto_14751 ) ) ( not ( = ?auto_14754 ?auto_14748 ) ) ( not ( = ?auto_14754 ?auto_14751 ) ) ( not ( = ?auto_14754 ?auto_14752 ) ) ( ON_BOARD ?auto_14760 ?auto_14762 ) ( SUPPORTS ?auto_14760 ?auto_14755 ) ( not ( = ?auto_14754 ?auto_14761 ) ) ( CALIBRATION_TARGET ?auto_14760 ?auto_14761 ) ( not ( = ?auto_14761 ?auto_14752 ) ) ( ON_BOARD ?auto_14759 ?auto_14762 ) ( not ( = ?auto_14760 ?auto_14759 ) ) ( SUPPORTS ?auto_14759 ?auto_14753 ) ( CALIBRATION_TARGET ?auto_14759 ?auto_14761 ) ( not ( = ?auto_14761 ?auto_14748 ) ) ( ON_BOARD ?auto_14758 ?auto_14762 ) ( not ( = ?auto_14759 ?auto_14758 ) ) ( SUPPORTS ?auto_14758 ?auto_14749 ) ( CALIBRATION_TARGET ?auto_14758 ?auto_14761 ) ( not ( = ?auto_14761 ?auto_14751 ) ) ( ON_BOARD ?auto_14757 ?auto_14762 ) ( not ( = ?auto_14758 ?auto_14757 ) ) ( SUPPORTS ?auto_14757 ?auto_14750 ) ( CALIBRATION_TARGET ?auto_14757 ?auto_14761 ) ( POWER_AVAIL ?auto_14762 ) ( POINTING ?auto_14762 ?auto_14756 ) ( not ( = ?auto_14761 ?auto_14756 ) ) ( not ( = ?auto_14751 ?auto_14756 ) ) ( not ( = ?auto_14750 ?auto_14749 ) ) ( not ( = ?auto_14748 ?auto_14756 ) ) ( not ( = ?auto_14750 ?auto_14753 ) ) ( not ( = ?auto_14749 ?auto_14753 ) ) ( not ( = ?auto_14752 ?auto_14756 ) ) ( not ( = ?auto_14759 ?auto_14757 ) ) ( not ( = ?auto_14750 ?auto_14755 ) ) ( not ( = ?auto_14749 ?auto_14755 ) ) ( not ( = ?auto_14753 ?auto_14755 ) ) ( not ( = ?auto_14754 ?auto_14756 ) ) ( not ( = ?auto_14760 ?auto_14758 ) ) ( not ( = ?auto_14760 ?auto_14757 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_14751 ?auto_14750 ?auto_14748 ?auto_14749 ?auto_14754 ?auto_14755 ?auto_14752 ?auto_14753 )
      ( GET-4IMAGE-VERIFY ?auto_14748 ?auto_14749 ?auto_14751 ?auto_14750 ?auto_14752 ?auto_14753 ?auto_14754 ?auto_14755 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_14797 - DIRECTION
      ?auto_14798 - MODE
      ?auto_14800 - DIRECTION
      ?auto_14799 - MODE
      ?auto_14801 - DIRECTION
      ?auto_14802 - MODE
      ?auto_14803 - DIRECTION
      ?auto_14804 - MODE
    )
    :vars
    (
      ?auto_14809 - INSTRUMENT
      ?auto_14811 - SATELLITE
      ?auto_14810 - DIRECTION
      ?auto_14808 - INSTRUMENT
      ?auto_14807 - INSTRUMENT
      ?auto_14806 - INSTRUMENT
      ?auto_14805 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14800 ?auto_14797 ) ) ( not ( = ?auto_14801 ?auto_14797 ) ) ( not ( = ?auto_14801 ?auto_14800 ) ) ( not ( = ?auto_14803 ?auto_14797 ) ) ( not ( = ?auto_14803 ?auto_14800 ) ) ( not ( = ?auto_14803 ?auto_14801 ) ) ( ON_BOARD ?auto_14809 ?auto_14811 ) ( SUPPORTS ?auto_14809 ?auto_14802 ) ( not ( = ?auto_14801 ?auto_14810 ) ) ( CALIBRATION_TARGET ?auto_14809 ?auto_14810 ) ( not ( = ?auto_14810 ?auto_14803 ) ) ( ON_BOARD ?auto_14808 ?auto_14811 ) ( not ( = ?auto_14809 ?auto_14808 ) ) ( SUPPORTS ?auto_14808 ?auto_14804 ) ( CALIBRATION_TARGET ?auto_14808 ?auto_14810 ) ( not ( = ?auto_14810 ?auto_14797 ) ) ( ON_BOARD ?auto_14807 ?auto_14811 ) ( not ( = ?auto_14808 ?auto_14807 ) ) ( SUPPORTS ?auto_14807 ?auto_14798 ) ( CALIBRATION_TARGET ?auto_14807 ?auto_14810 ) ( not ( = ?auto_14810 ?auto_14800 ) ) ( ON_BOARD ?auto_14806 ?auto_14811 ) ( not ( = ?auto_14807 ?auto_14806 ) ) ( SUPPORTS ?auto_14806 ?auto_14799 ) ( CALIBRATION_TARGET ?auto_14806 ?auto_14810 ) ( POWER_AVAIL ?auto_14811 ) ( POINTING ?auto_14811 ?auto_14805 ) ( not ( = ?auto_14810 ?auto_14805 ) ) ( not ( = ?auto_14800 ?auto_14805 ) ) ( not ( = ?auto_14799 ?auto_14798 ) ) ( not ( = ?auto_14797 ?auto_14805 ) ) ( not ( = ?auto_14799 ?auto_14804 ) ) ( not ( = ?auto_14798 ?auto_14804 ) ) ( not ( = ?auto_14803 ?auto_14805 ) ) ( not ( = ?auto_14808 ?auto_14806 ) ) ( not ( = ?auto_14799 ?auto_14802 ) ) ( not ( = ?auto_14798 ?auto_14802 ) ) ( not ( = ?auto_14804 ?auto_14802 ) ) ( not ( = ?auto_14801 ?auto_14805 ) ) ( not ( = ?auto_14809 ?auto_14807 ) ) ( not ( = ?auto_14809 ?auto_14806 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_14800 ?auto_14799 ?auto_14797 ?auto_14798 ?auto_14801 ?auto_14802 ?auto_14803 ?auto_14804 )
      ( GET-4IMAGE-VERIFY ?auto_14797 ?auto_14798 ?auto_14800 ?auto_14799 ?auto_14801 ?auto_14802 ?auto_14803 ?auto_14804 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_14954 - DIRECTION
      ?auto_14955 - MODE
      ?auto_14957 - DIRECTION
      ?auto_14956 - MODE
      ?auto_14958 - DIRECTION
      ?auto_14959 - MODE
      ?auto_14960 - DIRECTION
      ?auto_14961 - MODE
    )
    :vars
    (
      ?auto_14966 - INSTRUMENT
      ?auto_14968 - SATELLITE
      ?auto_14967 - DIRECTION
      ?auto_14965 - INSTRUMENT
      ?auto_14964 - INSTRUMENT
      ?auto_14963 - INSTRUMENT
      ?auto_14962 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14957 ?auto_14954 ) ) ( not ( = ?auto_14958 ?auto_14954 ) ) ( not ( = ?auto_14958 ?auto_14957 ) ) ( not ( = ?auto_14960 ?auto_14954 ) ) ( not ( = ?auto_14960 ?auto_14957 ) ) ( not ( = ?auto_14960 ?auto_14958 ) ) ( ON_BOARD ?auto_14966 ?auto_14968 ) ( SUPPORTS ?auto_14966 ?auto_14961 ) ( not ( = ?auto_14960 ?auto_14967 ) ) ( CALIBRATION_TARGET ?auto_14966 ?auto_14967 ) ( not ( = ?auto_14967 ?auto_14957 ) ) ( ON_BOARD ?auto_14965 ?auto_14968 ) ( not ( = ?auto_14966 ?auto_14965 ) ) ( SUPPORTS ?auto_14965 ?auto_14956 ) ( CALIBRATION_TARGET ?auto_14965 ?auto_14967 ) ( not ( = ?auto_14967 ?auto_14954 ) ) ( ON_BOARD ?auto_14964 ?auto_14968 ) ( not ( = ?auto_14965 ?auto_14964 ) ) ( SUPPORTS ?auto_14964 ?auto_14955 ) ( CALIBRATION_TARGET ?auto_14964 ?auto_14967 ) ( not ( = ?auto_14967 ?auto_14958 ) ) ( ON_BOARD ?auto_14963 ?auto_14968 ) ( not ( = ?auto_14964 ?auto_14963 ) ) ( SUPPORTS ?auto_14963 ?auto_14959 ) ( CALIBRATION_TARGET ?auto_14963 ?auto_14967 ) ( POWER_AVAIL ?auto_14968 ) ( POINTING ?auto_14968 ?auto_14962 ) ( not ( = ?auto_14967 ?auto_14962 ) ) ( not ( = ?auto_14958 ?auto_14962 ) ) ( not ( = ?auto_14959 ?auto_14955 ) ) ( not ( = ?auto_14954 ?auto_14962 ) ) ( not ( = ?auto_14959 ?auto_14956 ) ) ( not ( = ?auto_14955 ?auto_14956 ) ) ( not ( = ?auto_14957 ?auto_14962 ) ) ( not ( = ?auto_14965 ?auto_14963 ) ) ( not ( = ?auto_14959 ?auto_14961 ) ) ( not ( = ?auto_14955 ?auto_14961 ) ) ( not ( = ?auto_14956 ?auto_14961 ) ) ( not ( = ?auto_14960 ?auto_14962 ) ) ( not ( = ?auto_14966 ?auto_14964 ) ) ( not ( = ?auto_14966 ?auto_14963 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_14958 ?auto_14959 ?auto_14954 ?auto_14955 ?auto_14960 ?auto_14961 ?auto_14957 ?auto_14956 )
      ( GET-4IMAGE-VERIFY ?auto_14954 ?auto_14955 ?auto_14957 ?auto_14956 ?auto_14958 ?auto_14959 ?auto_14960 ?auto_14961 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_15003 - DIRECTION
      ?auto_15004 - MODE
      ?auto_15006 - DIRECTION
      ?auto_15005 - MODE
      ?auto_15007 - DIRECTION
      ?auto_15008 - MODE
      ?auto_15009 - DIRECTION
      ?auto_15010 - MODE
    )
    :vars
    (
      ?auto_15015 - INSTRUMENT
      ?auto_15017 - SATELLITE
      ?auto_15016 - DIRECTION
      ?auto_15014 - INSTRUMENT
      ?auto_15013 - INSTRUMENT
      ?auto_15012 - INSTRUMENT
      ?auto_15011 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_15006 ?auto_15003 ) ) ( not ( = ?auto_15007 ?auto_15003 ) ) ( not ( = ?auto_15007 ?auto_15006 ) ) ( not ( = ?auto_15009 ?auto_15003 ) ) ( not ( = ?auto_15009 ?auto_15006 ) ) ( not ( = ?auto_15009 ?auto_15007 ) ) ( ON_BOARD ?auto_15015 ?auto_15017 ) ( SUPPORTS ?auto_15015 ?auto_15008 ) ( not ( = ?auto_15007 ?auto_15016 ) ) ( CALIBRATION_TARGET ?auto_15015 ?auto_15016 ) ( not ( = ?auto_15016 ?auto_15006 ) ) ( ON_BOARD ?auto_15014 ?auto_15017 ) ( not ( = ?auto_15015 ?auto_15014 ) ) ( SUPPORTS ?auto_15014 ?auto_15005 ) ( CALIBRATION_TARGET ?auto_15014 ?auto_15016 ) ( not ( = ?auto_15016 ?auto_15003 ) ) ( ON_BOARD ?auto_15013 ?auto_15017 ) ( not ( = ?auto_15014 ?auto_15013 ) ) ( SUPPORTS ?auto_15013 ?auto_15004 ) ( CALIBRATION_TARGET ?auto_15013 ?auto_15016 ) ( not ( = ?auto_15016 ?auto_15009 ) ) ( ON_BOARD ?auto_15012 ?auto_15017 ) ( not ( = ?auto_15013 ?auto_15012 ) ) ( SUPPORTS ?auto_15012 ?auto_15010 ) ( CALIBRATION_TARGET ?auto_15012 ?auto_15016 ) ( POWER_AVAIL ?auto_15017 ) ( POINTING ?auto_15017 ?auto_15011 ) ( not ( = ?auto_15016 ?auto_15011 ) ) ( not ( = ?auto_15009 ?auto_15011 ) ) ( not ( = ?auto_15010 ?auto_15004 ) ) ( not ( = ?auto_15003 ?auto_15011 ) ) ( not ( = ?auto_15010 ?auto_15005 ) ) ( not ( = ?auto_15004 ?auto_15005 ) ) ( not ( = ?auto_15006 ?auto_15011 ) ) ( not ( = ?auto_15014 ?auto_15012 ) ) ( not ( = ?auto_15010 ?auto_15008 ) ) ( not ( = ?auto_15004 ?auto_15008 ) ) ( not ( = ?auto_15005 ?auto_15008 ) ) ( not ( = ?auto_15007 ?auto_15011 ) ) ( not ( = ?auto_15015 ?auto_15013 ) ) ( not ( = ?auto_15015 ?auto_15012 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_15009 ?auto_15010 ?auto_15003 ?auto_15004 ?auto_15007 ?auto_15008 ?auto_15006 ?auto_15005 )
      ( GET-4IMAGE-VERIFY ?auto_15003 ?auto_15004 ?auto_15006 ?auto_15005 ?auto_15007 ?auto_15008 ?auto_15009 ?auto_15010 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_15103 - DIRECTION
      ?auto_15104 - MODE
      ?auto_15106 - DIRECTION
      ?auto_15105 - MODE
      ?auto_15107 - DIRECTION
      ?auto_15108 - MODE
      ?auto_15109 - DIRECTION
      ?auto_15110 - MODE
    )
    :vars
    (
      ?auto_15115 - INSTRUMENT
      ?auto_15117 - SATELLITE
      ?auto_15116 - DIRECTION
      ?auto_15114 - INSTRUMENT
      ?auto_15113 - INSTRUMENT
      ?auto_15112 - INSTRUMENT
      ?auto_15111 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_15106 ?auto_15103 ) ) ( not ( = ?auto_15107 ?auto_15103 ) ) ( not ( = ?auto_15107 ?auto_15106 ) ) ( not ( = ?auto_15109 ?auto_15103 ) ) ( not ( = ?auto_15109 ?auto_15106 ) ) ( not ( = ?auto_15109 ?auto_15107 ) ) ( ON_BOARD ?auto_15115 ?auto_15117 ) ( SUPPORTS ?auto_15115 ?auto_15105 ) ( not ( = ?auto_15106 ?auto_15116 ) ) ( CALIBRATION_TARGET ?auto_15115 ?auto_15116 ) ( not ( = ?auto_15116 ?auto_15109 ) ) ( ON_BOARD ?auto_15114 ?auto_15117 ) ( not ( = ?auto_15115 ?auto_15114 ) ) ( SUPPORTS ?auto_15114 ?auto_15110 ) ( CALIBRATION_TARGET ?auto_15114 ?auto_15116 ) ( not ( = ?auto_15116 ?auto_15103 ) ) ( ON_BOARD ?auto_15113 ?auto_15117 ) ( not ( = ?auto_15114 ?auto_15113 ) ) ( SUPPORTS ?auto_15113 ?auto_15104 ) ( CALIBRATION_TARGET ?auto_15113 ?auto_15116 ) ( not ( = ?auto_15116 ?auto_15107 ) ) ( ON_BOARD ?auto_15112 ?auto_15117 ) ( not ( = ?auto_15113 ?auto_15112 ) ) ( SUPPORTS ?auto_15112 ?auto_15108 ) ( CALIBRATION_TARGET ?auto_15112 ?auto_15116 ) ( POWER_AVAIL ?auto_15117 ) ( POINTING ?auto_15117 ?auto_15111 ) ( not ( = ?auto_15116 ?auto_15111 ) ) ( not ( = ?auto_15107 ?auto_15111 ) ) ( not ( = ?auto_15108 ?auto_15104 ) ) ( not ( = ?auto_15103 ?auto_15111 ) ) ( not ( = ?auto_15108 ?auto_15110 ) ) ( not ( = ?auto_15104 ?auto_15110 ) ) ( not ( = ?auto_15109 ?auto_15111 ) ) ( not ( = ?auto_15114 ?auto_15112 ) ) ( not ( = ?auto_15108 ?auto_15105 ) ) ( not ( = ?auto_15104 ?auto_15105 ) ) ( not ( = ?auto_15110 ?auto_15105 ) ) ( not ( = ?auto_15106 ?auto_15111 ) ) ( not ( = ?auto_15115 ?auto_15113 ) ) ( not ( = ?auto_15115 ?auto_15112 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_15107 ?auto_15108 ?auto_15103 ?auto_15104 ?auto_15106 ?auto_15105 ?auto_15109 ?auto_15110 )
      ( GET-4IMAGE-VERIFY ?auto_15103 ?auto_15104 ?auto_15106 ?auto_15105 ?auto_15107 ?auto_15108 ?auto_15109 ?auto_15110 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_15207 - DIRECTION
      ?auto_15208 - MODE
      ?auto_15210 - DIRECTION
      ?auto_15209 - MODE
      ?auto_15211 - DIRECTION
      ?auto_15212 - MODE
      ?auto_15213 - DIRECTION
      ?auto_15214 - MODE
    )
    :vars
    (
      ?auto_15219 - INSTRUMENT
      ?auto_15221 - SATELLITE
      ?auto_15220 - DIRECTION
      ?auto_15218 - INSTRUMENT
      ?auto_15217 - INSTRUMENT
      ?auto_15216 - INSTRUMENT
      ?auto_15215 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_15210 ?auto_15207 ) ) ( not ( = ?auto_15211 ?auto_15207 ) ) ( not ( = ?auto_15211 ?auto_15210 ) ) ( not ( = ?auto_15213 ?auto_15207 ) ) ( not ( = ?auto_15213 ?auto_15210 ) ) ( not ( = ?auto_15213 ?auto_15211 ) ) ( ON_BOARD ?auto_15219 ?auto_15221 ) ( SUPPORTS ?auto_15219 ?auto_15209 ) ( not ( = ?auto_15210 ?auto_15220 ) ) ( CALIBRATION_TARGET ?auto_15219 ?auto_15220 ) ( not ( = ?auto_15220 ?auto_15211 ) ) ( ON_BOARD ?auto_15218 ?auto_15221 ) ( not ( = ?auto_15219 ?auto_15218 ) ) ( SUPPORTS ?auto_15218 ?auto_15212 ) ( CALIBRATION_TARGET ?auto_15218 ?auto_15220 ) ( not ( = ?auto_15220 ?auto_15207 ) ) ( ON_BOARD ?auto_15217 ?auto_15221 ) ( not ( = ?auto_15218 ?auto_15217 ) ) ( SUPPORTS ?auto_15217 ?auto_15208 ) ( CALIBRATION_TARGET ?auto_15217 ?auto_15220 ) ( not ( = ?auto_15220 ?auto_15213 ) ) ( ON_BOARD ?auto_15216 ?auto_15221 ) ( not ( = ?auto_15217 ?auto_15216 ) ) ( SUPPORTS ?auto_15216 ?auto_15214 ) ( CALIBRATION_TARGET ?auto_15216 ?auto_15220 ) ( POWER_AVAIL ?auto_15221 ) ( POINTING ?auto_15221 ?auto_15215 ) ( not ( = ?auto_15220 ?auto_15215 ) ) ( not ( = ?auto_15213 ?auto_15215 ) ) ( not ( = ?auto_15214 ?auto_15208 ) ) ( not ( = ?auto_15207 ?auto_15215 ) ) ( not ( = ?auto_15214 ?auto_15212 ) ) ( not ( = ?auto_15208 ?auto_15212 ) ) ( not ( = ?auto_15211 ?auto_15215 ) ) ( not ( = ?auto_15218 ?auto_15216 ) ) ( not ( = ?auto_15214 ?auto_15209 ) ) ( not ( = ?auto_15208 ?auto_15209 ) ) ( not ( = ?auto_15212 ?auto_15209 ) ) ( not ( = ?auto_15210 ?auto_15215 ) ) ( not ( = ?auto_15219 ?auto_15217 ) ) ( not ( = ?auto_15219 ?auto_15216 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_15213 ?auto_15214 ?auto_15207 ?auto_15208 ?auto_15210 ?auto_15209 ?auto_15211 ?auto_15212 )
      ( GET-4IMAGE-VERIFY ?auto_15207 ?auto_15208 ?auto_15210 ?auto_15209 ?auto_15211 ?auto_15212 ?auto_15213 ?auto_15214 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_15362 - DIRECTION
      ?auto_15363 - MODE
      ?auto_15365 - DIRECTION
      ?auto_15364 - MODE
      ?auto_15366 - DIRECTION
      ?auto_15367 - MODE
      ?auto_15368 - DIRECTION
      ?auto_15369 - MODE
    )
    :vars
    (
      ?auto_15374 - INSTRUMENT
      ?auto_15376 - SATELLITE
      ?auto_15375 - DIRECTION
      ?auto_15373 - INSTRUMENT
      ?auto_15372 - INSTRUMENT
      ?auto_15371 - INSTRUMENT
      ?auto_15370 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_15365 ?auto_15362 ) ) ( not ( = ?auto_15366 ?auto_15362 ) ) ( not ( = ?auto_15366 ?auto_15365 ) ) ( not ( = ?auto_15368 ?auto_15362 ) ) ( not ( = ?auto_15368 ?auto_15365 ) ) ( not ( = ?auto_15368 ?auto_15366 ) ) ( ON_BOARD ?auto_15374 ?auto_15376 ) ( SUPPORTS ?auto_15374 ?auto_15369 ) ( not ( = ?auto_15368 ?auto_15375 ) ) ( CALIBRATION_TARGET ?auto_15374 ?auto_15375 ) ( not ( = ?auto_15375 ?auto_15362 ) ) ( ON_BOARD ?auto_15373 ?auto_15376 ) ( not ( = ?auto_15374 ?auto_15373 ) ) ( SUPPORTS ?auto_15373 ?auto_15363 ) ( CALIBRATION_TARGET ?auto_15373 ?auto_15375 ) ( not ( = ?auto_15375 ?auto_15366 ) ) ( ON_BOARD ?auto_15372 ?auto_15376 ) ( not ( = ?auto_15373 ?auto_15372 ) ) ( SUPPORTS ?auto_15372 ?auto_15367 ) ( CALIBRATION_TARGET ?auto_15372 ?auto_15375 ) ( not ( = ?auto_15375 ?auto_15365 ) ) ( ON_BOARD ?auto_15371 ?auto_15376 ) ( not ( = ?auto_15372 ?auto_15371 ) ) ( SUPPORTS ?auto_15371 ?auto_15364 ) ( CALIBRATION_TARGET ?auto_15371 ?auto_15375 ) ( POWER_AVAIL ?auto_15376 ) ( POINTING ?auto_15376 ?auto_15370 ) ( not ( = ?auto_15375 ?auto_15370 ) ) ( not ( = ?auto_15365 ?auto_15370 ) ) ( not ( = ?auto_15364 ?auto_15367 ) ) ( not ( = ?auto_15366 ?auto_15370 ) ) ( not ( = ?auto_15364 ?auto_15363 ) ) ( not ( = ?auto_15367 ?auto_15363 ) ) ( not ( = ?auto_15362 ?auto_15370 ) ) ( not ( = ?auto_15373 ?auto_15371 ) ) ( not ( = ?auto_15364 ?auto_15369 ) ) ( not ( = ?auto_15367 ?auto_15369 ) ) ( not ( = ?auto_15363 ?auto_15369 ) ) ( not ( = ?auto_15368 ?auto_15370 ) ) ( not ( = ?auto_15374 ?auto_15372 ) ) ( not ( = ?auto_15374 ?auto_15371 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_15365 ?auto_15364 ?auto_15366 ?auto_15367 ?auto_15368 ?auto_15369 ?auto_15362 ?auto_15363 )
      ( GET-4IMAGE-VERIFY ?auto_15362 ?auto_15363 ?auto_15365 ?auto_15364 ?auto_15366 ?auto_15367 ?auto_15368 ?auto_15369 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_15411 - DIRECTION
      ?auto_15412 - MODE
      ?auto_15414 - DIRECTION
      ?auto_15413 - MODE
      ?auto_15415 - DIRECTION
      ?auto_15416 - MODE
      ?auto_15417 - DIRECTION
      ?auto_15418 - MODE
    )
    :vars
    (
      ?auto_15423 - INSTRUMENT
      ?auto_15425 - SATELLITE
      ?auto_15424 - DIRECTION
      ?auto_15422 - INSTRUMENT
      ?auto_15421 - INSTRUMENT
      ?auto_15420 - INSTRUMENT
      ?auto_15419 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_15414 ?auto_15411 ) ) ( not ( = ?auto_15415 ?auto_15411 ) ) ( not ( = ?auto_15415 ?auto_15414 ) ) ( not ( = ?auto_15417 ?auto_15411 ) ) ( not ( = ?auto_15417 ?auto_15414 ) ) ( not ( = ?auto_15417 ?auto_15415 ) ) ( ON_BOARD ?auto_15423 ?auto_15425 ) ( SUPPORTS ?auto_15423 ?auto_15416 ) ( not ( = ?auto_15415 ?auto_15424 ) ) ( CALIBRATION_TARGET ?auto_15423 ?auto_15424 ) ( not ( = ?auto_15424 ?auto_15411 ) ) ( ON_BOARD ?auto_15422 ?auto_15425 ) ( not ( = ?auto_15423 ?auto_15422 ) ) ( SUPPORTS ?auto_15422 ?auto_15412 ) ( CALIBRATION_TARGET ?auto_15422 ?auto_15424 ) ( not ( = ?auto_15424 ?auto_15417 ) ) ( ON_BOARD ?auto_15421 ?auto_15425 ) ( not ( = ?auto_15422 ?auto_15421 ) ) ( SUPPORTS ?auto_15421 ?auto_15418 ) ( CALIBRATION_TARGET ?auto_15421 ?auto_15424 ) ( not ( = ?auto_15424 ?auto_15414 ) ) ( ON_BOARD ?auto_15420 ?auto_15425 ) ( not ( = ?auto_15421 ?auto_15420 ) ) ( SUPPORTS ?auto_15420 ?auto_15413 ) ( CALIBRATION_TARGET ?auto_15420 ?auto_15424 ) ( POWER_AVAIL ?auto_15425 ) ( POINTING ?auto_15425 ?auto_15419 ) ( not ( = ?auto_15424 ?auto_15419 ) ) ( not ( = ?auto_15414 ?auto_15419 ) ) ( not ( = ?auto_15413 ?auto_15418 ) ) ( not ( = ?auto_15417 ?auto_15419 ) ) ( not ( = ?auto_15413 ?auto_15412 ) ) ( not ( = ?auto_15418 ?auto_15412 ) ) ( not ( = ?auto_15411 ?auto_15419 ) ) ( not ( = ?auto_15422 ?auto_15420 ) ) ( not ( = ?auto_15413 ?auto_15416 ) ) ( not ( = ?auto_15418 ?auto_15416 ) ) ( not ( = ?auto_15412 ?auto_15416 ) ) ( not ( = ?auto_15415 ?auto_15419 ) ) ( not ( = ?auto_15423 ?auto_15421 ) ) ( not ( = ?auto_15423 ?auto_15420 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_15414 ?auto_15413 ?auto_15417 ?auto_15418 ?auto_15415 ?auto_15416 ?auto_15411 ?auto_15412 )
      ( GET-4IMAGE-VERIFY ?auto_15411 ?auto_15412 ?auto_15414 ?auto_15413 ?auto_15415 ?auto_15416 ?auto_15417 ?auto_15418 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_15460 - DIRECTION
      ?auto_15461 - MODE
      ?auto_15463 - DIRECTION
      ?auto_15462 - MODE
      ?auto_15464 - DIRECTION
      ?auto_15465 - MODE
      ?auto_15466 - DIRECTION
      ?auto_15467 - MODE
    )
    :vars
    (
      ?auto_15472 - INSTRUMENT
      ?auto_15474 - SATELLITE
      ?auto_15473 - DIRECTION
      ?auto_15471 - INSTRUMENT
      ?auto_15470 - INSTRUMENT
      ?auto_15469 - INSTRUMENT
      ?auto_15468 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_15463 ?auto_15460 ) ) ( not ( = ?auto_15464 ?auto_15460 ) ) ( not ( = ?auto_15464 ?auto_15463 ) ) ( not ( = ?auto_15466 ?auto_15460 ) ) ( not ( = ?auto_15466 ?auto_15463 ) ) ( not ( = ?auto_15466 ?auto_15464 ) ) ( ON_BOARD ?auto_15472 ?auto_15474 ) ( SUPPORTS ?auto_15472 ?auto_15467 ) ( not ( = ?auto_15466 ?auto_15473 ) ) ( CALIBRATION_TARGET ?auto_15472 ?auto_15473 ) ( not ( = ?auto_15473 ?auto_15460 ) ) ( ON_BOARD ?auto_15471 ?auto_15474 ) ( not ( = ?auto_15472 ?auto_15471 ) ) ( SUPPORTS ?auto_15471 ?auto_15461 ) ( CALIBRATION_TARGET ?auto_15471 ?auto_15473 ) ( not ( = ?auto_15473 ?auto_15463 ) ) ( ON_BOARD ?auto_15470 ?auto_15474 ) ( not ( = ?auto_15471 ?auto_15470 ) ) ( SUPPORTS ?auto_15470 ?auto_15462 ) ( CALIBRATION_TARGET ?auto_15470 ?auto_15473 ) ( not ( = ?auto_15473 ?auto_15464 ) ) ( ON_BOARD ?auto_15469 ?auto_15474 ) ( not ( = ?auto_15470 ?auto_15469 ) ) ( SUPPORTS ?auto_15469 ?auto_15465 ) ( CALIBRATION_TARGET ?auto_15469 ?auto_15473 ) ( POWER_AVAIL ?auto_15474 ) ( POINTING ?auto_15474 ?auto_15468 ) ( not ( = ?auto_15473 ?auto_15468 ) ) ( not ( = ?auto_15464 ?auto_15468 ) ) ( not ( = ?auto_15465 ?auto_15462 ) ) ( not ( = ?auto_15463 ?auto_15468 ) ) ( not ( = ?auto_15465 ?auto_15461 ) ) ( not ( = ?auto_15462 ?auto_15461 ) ) ( not ( = ?auto_15460 ?auto_15468 ) ) ( not ( = ?auto_15471 ?auto_15469 ) ) ( not ( = ?auto_15465 ?auto_15467 ) ) ( not ( = ?auto_15462 ?auto_15467 ) ) ( not ( = ?auto_15461 ?auto_15467 ) ) ( not ( = ?auto_15466 ?auto_15468 ) ) ( not ( = ?auto_15472 ?auto_15470 ) ) ( not ( = ?auto_15472 ?auto_15469 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_15464 ?auto_15465 ?auto_15463 ?auto_15462 ?auto_15466 ?auto_15467 ?auto_15460 ?auto_15461 )
      ( GET-4IMAGE-VERIFY ?auto_15460 ?auto_15461 ?auto_15463 ?auto_15462 ?auto_15464 ?auto_15465 ?auto_15466 ?auto_15467 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_15509 - DIRECTION
      ?auto_15510 - MODE
      ?auto_15512 - DIRECTION
      ?auto_15511 - MODE
      ?auto_15513 - DIRECTION
      ?auto_15514 - MODE
      ?auto_15515 - DIRECTION
      ?auto_15516 - MODE
    )
    :vars
    (
      ?auto_15521 - INSTRUMENT
      ?auto_15523 - SATELLITE
      ?auto_15522 - DIRECTION
      ?auto_15520 - INSTRUMENT
      ?auto_15519 - INSTRUMENT
      ?auto_15518 - INSTRUMENT
      ?auto_15517 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_15512 ?auto_15509 ) ) ( not ( = ?auto_15513 ?auto_15509 ) ) ( not ( = ?auto_15513 ?auto_15512 ) ) ( not ( = ?auto_15515 ?auto_15509 ) ) ( not ( = ?auto_15515 ?auto_15512 ) ) ( not ( = ?auto_15515 ?auto_15513 ) ) ( ON_BOARD ?auto_15521 ?auto_15523 ) ( SUPPORTS ?auto_15521 ?auto_15514 ) ( not ( = ?auto_15513 ?auto_15522 ) ) ( CALIBRATION_TARGET ?auto_15521 ?auto_15522 ) ( not ( = ?auto_15522 ?auto_15509 ) ) ( ON_BOARD ?auto_15520 ?auto_15523 ) ( not ( = ?auto_15521 ?auto_15520 ) ) ( SUPPORTS ?auto_15520 ?auto_15510 ) ( CALIBRATION_TARGET ?auto_15520 ?auto_15522 ) ( not ( = ?auto_15522 ?auto_15512 ) ) ( ON_BOARD ?auto_15519 ?auto_15523 ) ( not ( = ?auto_15520 ?auto_15519 ) ) ( SUPPORTS ?auto_15519 ?auto_15511 ) ( CALIBRATION_TARGET ?auto_15519 ?auto_15522 ) ( not ( = ?auto_15522 ?auto_15515 ) ) ( ON_BOARD ?auto_15518 ?auto_15523 ) ( not ( = ?auto_15519 ?auto_15518 ) ) ( SUPPORTS ?auto_15518 ?auto_15516 ) ( CALIBRATION_TARGET ?auto_15518 ?auto_15522 ) ( POWER_AVAIL ?auto_15523 ) ( POINTING ?auto_15523 ?auto_15517 ) ( not ( = ?auto_15522 ?auto_15517 ) ) ( not ( = ?auto_15515 ?auto_15517 ) ) ( not ( = ?auto_15516 ?auto_15511 ) ) ( not ( = ?auto_15512 ?auto_15517 ) ) ( not ( = ?auto_15516 ?auto_15510 ) ) ( not ( = ?auto_15511 ?auto_15510 ) ) ( not ( = ?auto_15509 ?auto_15517 ) ) ( not ( = ?auto_15520 ?auto_15518 ) ) ( not ( = ?auto_15516 ?auto_15514 ) ) ( not ( = ?auto_15511 ?auto_15514 ) ) ( not ( = ?auto_15510 ?auto_15514 ) ) ( not ( = ?auto_15513 ?auto_15517 ) ) ( not ( = ?auto_15521 ?auto_15519 ) ) ( not ( = ?auto_15521 ?auto_15518 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_15515 ?auto_15516 ?auto_15512 ?auto_15511 ?auto_15513 ?auto_15514 ?auto_15509 ?auto_15510 )
      ( GET-4IMAGE-VERIFY ?auto_15509 ?auto_15510 ?auto_15512 ?auto_15511 ?auto_15513 ?auto_15514 ?auto_15515 ?auto_15516 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_15717 - DIRECTION
      ?auto_15718 - MODE
      ?auto_15720 - DIRECTION
      ?auto_15719 - MODE
      ?auto_15721 - DIRECTION
      ?auto_15722 - MODE
      ?auto_15723 - DIRECTION
      ?auto_15724 - MODE
    )
    :vars
    (
      ?auto_15729 - INSTRUMENT
      ?auto_15731 - SATELLITE
      ?auto_15730 - DIRECTION
      ?auto_15728 - INSTRUMENT
      ?auto_15727 - INSTRUMENT
      ?auto_15726 - INSTRUMENT
      ?auto_15725 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_15720 ?auto_15717 ) ) ( not ( = ?auto_15721 ?auto_15717 ) ) ( not ( = ?auto_15721 ?auto_15720 ) ) ( not ( = ?auto_15723 ?auto_15717 ) ) ( not ( = ?auto_15723 ?auto_15720 ) ) ( not ( = ?auto_15723 ?auto_15721 ) ) ( ON_BOARD ?auto_15729 ?auto_15731 ) ( SUPPORTS ?auto_15729 ?auto_15719 ) ( not ( = ?auto_15720 ?auto_15730 ) ) ( CALIBRATION_TARGET ?auto_15729 ?auto_15730 ) ( not ( = ?auto_15730 ?auto_15717 ) ) ( ON_BOARD ?auto_15728 ?auto_15731 ) ( not ( = ?auto_15729 ?auto_15728 ) ) ( SUPPORTS ?auto_15728 ?auto_15718 ) ( CALIBRATION_TARGET ?auto_15728 ?auto_15730 ) ( not ( = ?auto_15730 ?auto_15723 ) ) ( ON_BOARD ?auto_15727 ?auto_15731 ) ( not ( = ?auto_15728 ?auto_15727 ) ) ( SUPPORTS ?auto_15727 ?auto_15724 ) ( CALIBRATION_TARGET ?auto_15727 ?auto_15730 ) ( not ( = ?auto_15730 ?auto_15721 ) ) ( ON_BOARD ?auto_15726 ?auto_15731 ) ( not ( = ?auto_15727 ?auto_15726 ) ) ( SUPPORTS ?auto_15726 ?auto_15722 ) ( CALIBRATION_TARGET ?auto_15726 ?auto_15730 ) ( POWER_AVAIL ?auto_15731 ) ( POINTING ?auto_15731 ?auto_15725 ) ( not ( = ?auto_15730 ?auto_15725 ) ) ( not ( = ?auto_15721 ?auto_15725 ) ) ( not ( = ?auto_15722 ?auto_15724 ) ) ( not ( = ?auto_15723 ?auto_15725 ) ) ( not ( = ?auto_15722 ?auto_15718 ) ) ( not ( = ?auto_15724 ?auto_15718 ) ) ( not ( = ?auto_15717 ?auto_15725 ) ) ( not ( = ?auto_15728 ?auto_15726 ) ) ( not ( = ?auto_15722 ?auto_15719 ) ) ( not ( = ?auto_15724 ?auto_15719 ) ) ( not ( = ?auto_15718 ?auto_15719 ) ) ( not ( = ?auto_15720 ?auto_15725 ) ) ( not ( = ?auto_15729 ?auto_15727 ) ) ( not ( = ?auto_15729 ?auto_15726 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_15721 ?auto_15722 ?auto_15723 ?auto_15724 ?auto_15720 ?auto_15719 ?auto_15717 ?auto_15718 )
      ( GET-4IMAGE-VERIFY ?auto_15717 ?auto_15718 ?auto_15720 ?auto_15719 ?auto_15721 ?auto_15722 ?auto_15723 ?auto_15724 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_15766 - DIRECTION
      ?auto_15767 - MODE
      ?auto_15769 - DIRECTION
      ?auto_15768 - MODE
      ?auto_15770 - DIRECTION
      ?auto_15771 - MODE
      ?auto_15772 - DIRECTION
      ?auto_15773 - MODE
    )
    :vars
    (
      ?auto_15778 - INSTRUMENT
      ?auto_15780 - SATELLITE
      ?auto_15779 - DIRECTION
      ?auto_15777 - INSTRUMENT
      ?auto_15776 - INSTRUMENT
      ?auto_15775 - INSTRUMENT
      ?auto_15774 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_15769 ?auto_15766 ) ) ( not ( = ?auto_15770 ?auto_15766 ) ) ( not ( = ?auto_15770 ?auto_15769 ) ) ( not ( = ?auto_15772 ?auto_15766 ) ) ( not ( = ?auto_15772 ?auto_15769 ) ) ( not ( = ?auto_15772 ?auto_15770 ) ) ( ON_BOARD ?auto_15778 ?auto_15780 ) ( SUPPORTS ?auto_15778 ?auto_15768 ) ( not ( = ?auto_15769 ?auto_15779 ) ) ( CALIBRATION_TARGET ?auto_15778 ?auto_15779 ) ( not ( = ?auto_15779 ?auto_15766 ) ) ( ON_BOARD ?auto_15777 ?auto_15780 ) ( not ( = ?auto_15778 ?auto_15777 ) ) ( SUPPORTS ?auto_15777 ?auto_15767 ) ( CALIBRATION_TARGET ?auto_15777 ?auto_15779 ) ( not ( = ?auto_15779 ?auto_15770 ) ) ( ON_BOARD ?auto_15776 ?auto_15780 ) ( not ( = ?auto_15777 ?auto_15776 ) ) ( SUPPORTS ?auto_15776 ?auto_15771 ) ( CALIBRATION_TARGET ?auto_15776 ?auto_15779 ) ( not ( = ?auto_15779 ?auto_15772 ) ) ( ON_BOARD ?auto_15775 ?auto_15780 ) ( not ( = ?auto_15776 ?auto_15775 ) ) ( SUPPORTS ?auto_15775 ?auto_15773 ) ( CALIBRATION_TARGET ?auto_15775 ?auto_15779 ) ( POWER_AVAIL ?auto_15780 ) ( POINTING ?auto_15780 ?auto_15774 ) ( not ( = ?auto_15779 ?auto_15774 ) ) ( not ( = ?auto_15772 ?auto_15774 ) ) ( not ( = ?auto_15773 ?auto_15771 ) ) ( not ( = ?auto_15770 ?auto_15774 ) ) ( not ( = ?auto_15773 ?auto_15767 ) ) ( not ( = ?auto_15771 ?auto_15767 ) ) ( not ( = ?auto_15766 ?auto_15774 ) ) ( not ( = ?auto_15777 ?auto_15775 ) ) ( not ( = ?auto_15773 ?auto_15768 ) ) ( not ( = ?auto_15771 ?auto_15768 ) ) ( not ( = ?auto_15767 ?auto_15768 ) ) ( not ( = ?auto_15769 ?auto_15774 ) ) ( not ( = ?auto_15778 ?auto_15776 ) ) ( not ( = ?auto_15778 ?auto_15775 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_15772 ?auto_15773 ?auto_15770 ?auto_15771 ?auto_15769 ?auto_15768 ?auto_15766 ?auto_15767 )
      ( GET-4IMAGE-VERIFY ?auto_15766 ?auto_15767 ?auto_15769 ?auto_15768 ?auto_15770 ?auto_15771 ?auto_15772 ?auto_15773 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_16082 - DIRECTION
      ?auto_16083 - MODE
      ?auto_16085 - DIRECTION
      ?auto_16084 - MODE
      ?auto_16086 - DIRECTION
      ?auto_16087 - MODE
      ?auto_16088 - DIRECTION
      ?auto_16089 - MODE
    )
    :vars
    (
      ?auto_16094 - INSTRUMENT
      ?auto_16096 - SATELLITE
      ?auto_16095 - DIRECTION
      ?auto_16093 - INSTRUMENT
      ?auto_16092 - INSTRUMENT
      ?auto_16091 - INSTRUMENT
      ?auto_16090 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16085 ?auto_16082 ) ) ( not ( = ?auto_16086 ?auto_16082 ) ) ( not ( = ?auto_16086 ?auto_16085 ) ) ( not ( = ?auto_16088 ?auto_16082 ) ) ( not ( = ?auto_16088 ?auto_16085 ) ) ( not ( = ?auto_16088 ?auto_16086 ) ) ( ON_BOARD ?auto_16094 ?auto_16096 ) ( SUPPORTS ?auto_16094 ?auto_16083 ) ( not ( = ?auto_16082 ?auto_16095 ) ) ( CALIBRATION_TARGET ?auto_16094 ?auto_16095 ) ( not ( = ?auto_16095 ?auto_16088 ) ) ( ON_BOARD ?auto_16093 ?auto_16096 ) ( not ( = ?auto_16094 ?auto_16093 ) ) ( SUPPORTS ?auto_16093 ?auto_16089 ) ( CALIBRATION_TARGET ?auto_16093 ?auto_16095 ) ( not ( = ?auto_16095 ?auto_16086 ) ) ( ON_BOARD ?auto_16092 ?auto_16096 ) ( not ( = ?auto_16093 ?auto_16092 ) ) ( SUPPORTS ?auto_16092 ?auto_16087 ) ( CALIBRATION_TARGET ?auto_16092 ?auto_16095 ) ( not ( = ?auto_16095 ?auto_16085 ) ) ( ON_BOARD ?auto_16091 ?auto_16096 ) ( not ( = ?auto_16092 ?auto_16091 ) ) ( SUPPORTS ?auto_16091 ?auto_16084 ) ( CALIBRATION_TARGET ?auto_16091 ?auto_16095 ) ( POWER_AVAIL ?auto_16096 ) ( POINTING ?auto_16096 ?auto_16090 ) ( not ( = ?auto_16095 ?auto_16090 ) ) ( not ( = ?auto_16085 ?auto_16090 ) ) ( not ( = ?auto_16084 ?auto_16087 ) ) ( not ( = ?auto_16086 ?auto_16090 ) ) ( not ( = ?auto_16084 ?auto_16089 ) ) ( not ( = ?auto_16087 ?auto_16089 ) ) ( not ( = ?auto_16088 ?auto_16090 ) ) ( not ( = ?auto_16093 ?auto_16091 ) ) ( not ( = ?auto_16084 ?auto_16083 ) ) ( not ( = ?auto_16087 ?auto_16083 ) ) ( not ( = ?auto_16089 ?auto_16083 ) ) ( not ( = ?auto_16082 ?auto_16090 ) ) ( not ( = ?auto_16094 ?auto_16092 ) ) ( not ( = ?auto_16094 ?auto_16091 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_16085 ?auto_16084 ?auto_16086 ?auto_16087 ?auto_16082 ?auto_16083 ?auto_16088 ?auto_16089 )
      ( GET-4IMAGE-VERIFY ?auto_16082 ?auto_16083 ?auto_16085 ?auto_16084 ?auto_16086 ?auto_16087 ?auto_16088 ?auto_16089 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_16131 - DIRECTION
      ?auto_16132 - MODE
      ?auto_16134 - DIRECTION
      ?auto_16133 - MODE
      ?auto_16135 - DIRECTION
      ?auto_16136 - MODE
      ?auto_16137 - DIRECTION
      ?auto_16138 - MODE
    )
    :vars
    (
      ?auto_16143 - INSTRUMENT
      ?auto_16145 - SATELLITE
      ?auto_16144 - DIRECTION
      ?auto_16142 - INSTRUMENT
      ?auto_16141 - INSTRUMENT
      ?auto_16140 - INSTRUMENT
      ?auto_16139 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16134 ?auto_16131 ) ) ( not ( = ?auto_16135 ?auto_16131 ) ) ( not ( = ?auto_16135 ?auto_16134 ) ) ( not ( = ?auto_16137 ?auto_16131 ) ) ( not ( = ?auto_16137 ?auto_16134 ) ) ( not ( = ?auto_16137 ?auto_16135 ) ) ( ON_BOARD ?auto_16143 ?auto_16145 ) ( SUPPORTS ?auto_16143 ?auto_16132 ) ( not ( = ?auto_16131 ?auto_16144 ) ) ( CALIBRATION_TARGET ?auto_16143 ?auto_16144 ) ( not ( = ?auto_16144 ?auto_16135 ) ) ( ON_BOARD ?auto_16142 ?auto_16145 ) ( not ( = ?auto_16143 ?auto_16142 ) ) ( SUPPORTS ?auto_16142 ?auto_16136 ) ( CALIBRATION_TARGET ?auto_16142 ?auto_16144 ) ( not ( = ?auto_16144 ?auto_16137 ) ) ( ON_BOARD ?auto_16141 ?auto_16145 ) ( not ( = ?auto_16142 ?auto_16141 ) ) ( SUPPORTS ?auto_16141 ?auto_16138 ) ( CALIBRATION_TARGET ?auto_16141 ?auto_16144 ) ( not ( = ?auto_16144 ?auto_16134 ) ) ( ON_BOARD ?auto_16140 ?auto_16145 ) ( not ( = ?auto_16141 ?auto_16140 ) ) ( SUPPORTS ?auto_16140 ?auto_16133 ) ( CALIBRATION_TARGET ?auto_16140 ?auto_16144 ) ( POWER_AVAIL ?auto_16145 ) ( POINTING ?auto_16145 ?auto_16139 ) ( not ( = ?auto_16144 ?auto_16139 ) ) ( not ( = ?auto_16134 ?auto_16139 ) ) ( not ( = ?auto_16133 ?auto_16138 ) ) ( not ( = ?auto_16137 ?auto_16139 ) ) ( not ( = ?auto_16133 ?auto_16136 ) ) ( not ( = ?auto_16138 ?auto_16136 ) ) ( not ( = ?auto_16135 ?auto_16139 ) ) ( not ( = ?auto_16142 ?auto_16140 ) ) ( not ( = ?auto_16133 ?auto_16132 ) ) ( not ( = ?auto_16138 ?auto_16132 ) ) ( not ( = ?auto_16136 ?auto_16132 ) ) ( not ( = ?auto_16131 ?auto_16139 ) ) ( not ( = ?auto_16143 ?auto_16141 ) ) ( not ( = ?auto_16143 ?auto_16140 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_16134 ?auto_16133 ?auto_16137 ?auto_16138 ?auto_16131 ?auto_16132 ?auto_16135 ?auto_16136 )
      ( GET-4IMAGE-VERIFY ?auto_16131 ?auto_16132 ?auto_16134 ?auto_16133 ?auto_16135 ?auto_16136 ?auto_16137 ?auto_16138 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_16286 - DIRECTION
      ?auto_16287 - MODE
      ?auto_16289 - DIRECTION
      ?auto_16288 - MODE
      ?auto_16290 - DIRECTION
      ?auto_16291 - MODE
      ?auto_16292 - DIRECTION
      ?auto_16293 - MODE
    )
    :vars
    (
      ?auto_16298 - INSTRUMENT
      ?auto_16300 - SATELLITE
      ?auto_16299 - DIRECTION
      ?auto_16297 - INSTRUMENT
      ?auto_16296 - INSTRUMENT
      ?auto_16295 - INSTRUMENT
      ?auto_16294 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16289 ?auto_16286 ) ) ( not ( = ?auto_16290 ?auto_16286 ) ) ( not ( = ?auto_16290 ?auto_16289 ) ) ( not ( = ?auto_16292 ?auto_16286 ) ) ( not ( = ?auto_16292 ?auto_16289 ) ) ( not ( = ?auto_16292 ?auto_16290 ) ) ( ON_BOARD ?auto_16298 ?auto_16300 ) ( SUPPORTS ?auto_16298 ?auto_16287 ) ( not ( = ?auto_16286 ?auto_16299 ) ) ( CALIBRATION_TARGET ?auto_16298 ?auto_16299 ) ( not ( = ?auto_16299 ?auto_16292 ) ) ( ON_BOARD ?auto_16297 ?auto_16300 ) ( not ( = ?auto_16298 ?auto_16297 ) ) ( SUPPORTS ?auto_16297 ?auto_16293 ) ( CALIBRATION_TARGET ?auto_16297 ?auto_16299 ) ( not ( = ?auto_16299 ?auto_16289 ) ) ( ON_BOARD ?auto_16296 ?auto_16300 ) ( not ( = ?auto_16297 ?auto_16296 ) ) ( SUPPORTS ?auto_16296 ?auto_16288 ) ( CALIBRATION_TARGET ?auto_16296 ?auto_16299 ) ( not ( = ?auto_16299 ?auto_16290 ) ) ( ON_BOARD ?auto_16295 ?auto_16300 ) ( not ( = ?auto_16296 ?auto_16295 ) ) ( SUPPORTS ?auto_16295 ?auto_16291 ) ( CALIBRATION_TARGET ?auto_16295 ?auto_16299 ) ( POWER_AVAIL ?auto_16300 ) ( POINTING ?auto_16300 ?auto_16294 ) ( not ( = ?auto_16299 ?auto_16294 ) ) ( not ( = ?auto_16290 ?auto_16294 ) ) ( not ( = ?auto_16291 ?auto_16288 ) ) ( not ( = ?auto_16289 ?auto_16294 ) ) ( not ( = ?auto_16291 ?auto_16293 ) ) ( not ( = ?auto_16288 ?auto_16293 ) ) ( not ( = ?auto_16292 ?auto_16294 ) ) ( not ( = ?auto_16297 ?auto_16295 ) ) ( not ( = ?auto_16291 ?auto_16287 ) ) ( not ( = ?auto_16288 ?auto_16287 ) ) ( not ( = ?auto_16293 ?auto_16287 ) ) ( not ( = ?auto_16286 ?auto_16294 ) ) ( not ( = ?auto_16298 ?auto_16296 ) ) ( not ( = ?auto_16298 ?auto_16295 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_16290 ?auto_16291 ?auto_16289 ?auto_16288 ?auto_16286 ?auto_16287 ?auto_16292 ?auto_16293 )
      ( GET-4IMAGE-VERIFY ?auto_16286 ?auto_16287 ?auto_16289 ?auto_16288 ?auto_16290 ?auto_16291 ?auto_16292 ?auto_16293 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_16390 - DIRECTION
      ?auto_16391 - MODE
      ?auto_16393 - DIRECTION
      ?auto_16392 - MODE
      ?auto_16394 - DIRECTION
      ?auto_16395 - MODE
      ?auto_16396 - DIRECTION
      ?auto_16397 - MODE
    )
    :vars
    (
      ?auto_16402 - INSTRUMENT
      ?auto_16404 - SATELLITE
      ?auto_16403 - DIRECTION
      ?auto_16401 - INSTRUMENT
      ?auto_16400 - INSTRUMENT
      ?auto_16399 - INSTRUMENT
      ?auto_16398 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16393 ?auto_16390 ) ) ( not ( = ?auto_16394 ?auto_16390 ) ) ( not ( = ?auto_16394 ?auto_16393 ) ) ( not ( = ?auto_16396 ?auto_16390 ) ) ( not ( = ?auto_16396 ?auto_16393 ) ) ( not ( = ?auto_16396 ?auto_16394 ) ) ( ON_BOARD ?auto_16402 ?auto_16404 ) ( SUPPORTS ?auto_16402 ?auto_16391 ) ( not ( = ?auto_16390 ?auto_16403 ) ) ( CALIBRATION_TARGET ?auto_16402 ?auto_16403 ) ( not ( = ?auto_16403 ?auto_16394 ) ) ( ON_BOARD ?auto_16401 ?auto_16404 ) ( not ( = ?auto_16402 ?auto_16401 ) ) ( SUPPORTS ?auto_16401 ?auto_16395 ) ( CALIBRATION_TARGET ?auto_16401 ?auto_16403 ) ( not ( = ?auto_16403 ?auto_16393 ) ) ( ON_BOARD ?auto_16400 ?auto_16404 ) ( not ( = ?auto_16401 ?auto_16400 ) ) ( SUPPORTS ?auto_16400 ?auto_16392 ) ( CALIBRATION_TARGET ?auto_16400 ?auto_16403 ) ( not ( = ?auto_16403 ?auto_16396 ) ) ( ON_BOARD ?auto_16399 ?auto_16404 ) ( not ( = ?auto_16400 ?auto_16399 ) ) ( SUPPORTS ?auto_16399 ?auto_16397 ) ( CALIBRATION_TARGET ?auto_16399 ?auto_16403 ) ( POWER_AVAIL ?auto_16404 ) ( POINTING ?auto_16404 ?auto_16398 ) ( not ( = ?auto_16403 ?auto_16398 ) ) ( not ( = ?auto_16396 ?auto_16398 ) ) ( not ( = ?auto_16397 ?auto_16392 ) ) ( not ( = ?auto_16393 ?auto_16398 ) ) ( not ( = ?auto_16397 ?auto_16395 ) ) ( not ( = ?auto_16392 ?auto_16395 ) ) ( not ( = ?auto_16394 ?auto_16398 ) ) ( not ( = ?auto_16401 ?auto_16399 ) ) ( not ( = ?auto_16397 ?auto_16391 ) ) ( not ( = ?auto_16392 ?auto_16391 ) ) ( not ( = ?auto_16395 ?auto_16391 ) ) ( not ( = ?auto_16390 ?auto_16398 ) ) ( not ( = ?auto_16402 ?auto_16400 ) ) ( not ( = ?auto_16402 ?auto_16399 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_16396 ?auto_16397 ?auto_16393 ?auto_16392 ?auto_16390 ?auto_16391 ?auto_16394 ?auto_16395 )
      ( GET-4IMAGE-VERIFY ?auto_16390 ?auto_16391 ?auto_16393 ?auto_16392 ?auto_16394 ?auto_16395 ?auto_16396 ?auto_16397 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_16545 - DIRECTION
      ?auto_16546 - MODE
      ?auto_16548 - DIRECTION
      ?auto_16547 - MODE
      ?auto_16549 - DIRECTION
      ?auto_16550 - MODE
      ?auto_16551 - DIRECTION
      ?auto_16552 - MODE
    )
    :vars
    (
      ?auto_16557 - INSTRUMENT
      ?auto_16559 - SATELLITE
      ?auto_16558 - DIRECTION
      ?auto_16556 - INSTRUMENT
      ?auto_16555 - INSTRUMENT
      ?auto_16554 - INSTRUMENT
      ?auto_16553 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16548 ?auto_16545 ) ) ( not ( = ?auto_16549 ?auto_16545 ) ) ( not ( = ?auto_16549 ?auto_16548 ) ) ( not ( = ?auto_16551 ?auto_16545 ) ) ( not ( = ?auto_16551 ?auto_16548 ) ) ( not ( = ?auto_16551 ?auto_16549 ) ) ( ON_BOARD ?auto_16557 ?auto_16559 ) ( SUPPORTS ?auto_16557 ?auto_16546 ) ( not ( = ?auto_16545 ?auto_16558 ) ) ( CALIBRATION_TARGET ?auto_16557 ?auto_16558 ) ( not ( = ?auto_16558 ?auto_16548 ) ) ( ON_BOARD ?auto_16556 ?auto_16559 ) ( not ( = ?auto_16557 ?auto_16556 ) ) ( SUPPORTS ?auto_16556 ?auto_16547 ) ( CALIBRATION_TARGET ?auto_16556 ?auto_16558 ) ( not ( = ?auto_16558 ?auto_16551 ) ) ( ON_BOARD ?auto_16555 ?auto_16559 ) ( not ( = ?auto_16556 ?auto_16555 ) ) ( SUPPORTS ?auto_16555 ?auto_16552 ) ( CALIBRATION_TARGET ?auto_16555 ?auto_16558 ) ( not ( = ?auto_16558 ?auto_16549 ) ) ( ON_BOARD ?auto_16554 ?auto_16559 ) ( not ( = ?auto_16555 ?auto_16554 ) ) ( SUPPORTS ?auto_16554 ?auto_16550 ) ( CALIBRATION_TARGET ?auto_16554 ?auto_16558 ) ( POWER_AVAIL ?auto_16559 ) ( POINTING ?auto_16559 ?auto_16553 ) ( not ( = ?auto_16558 ?auto_16553 ) ) ( not ( = ?auto_16549 ?auto_16553 ) ) ( not ( = ?auto_16550 ?auto_16552 ) ) ( not ( = ?auto_16551 ?auto_16553 ) ) ( not ( = ?auto_16550 ?auto_16547 ) ) ( not ( = ?auto_16552 ?auto_16547 ) ) ( not ( = ?auto_16548 ?auto_16553 ) ) ( not ( = ?auto_16556 ?auto_16554 ) ) ( not ( = ?auto_16550 ?auto_16546 ) ) ( not ( = ?auto_16552 ?auto_16546 ) ) ( not ( = ?auto_16547 ?auto_16546 ) ) ( not ( = ?auto_16545 ?auto_16553 ) ) ( not ( = ?auto_16557 ?auto_16555 ) ) ( not ( = ?auto_16557 ?auto_16554 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_16549 ?auto_16550 ?auto_16551 ?auto_16552 ?auto_16545 ?auto_16546 ?auto_16548 ?auto_16547 )
      ( GET-4IMAGE-VERIFY ?auto_16545 ?auto_16546 ?auto_16548 ?auto_16547 ?auto_16549 ?auto_16550 ?auto_16551 ?auto_16552 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_16594 - DIRECTION
      ?auto_16595 - MODE
      ?auto_16597 - DIRECTION
      ?auto_16596 - MODE
      ?auto_16598 - DIRECTION
      ?auto_16599 - MODE
      ?auto_16600 - DIRECTION
      ?auto_16601 - MODE
    )
    :vars
    (
      ?auto_16606 - INSTRUMENT
      ?auto_16608 - SATELLITE
      ?auto_16607 - DIRECTION
      ?auto_16605 - INSTRUMENT
      ?auto_16604 - INSTRUMENT
      ?auto_16603 - INSTRUMENT
      ?auto_16602 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16597 ?auto_16594 ) ) ( not ( = ?auto_16598 ?auto_16594 ) ) ( not ( = ?auto_16598 ?auto_16597 ) ) ( not ( = ?auto_16600 ?auto_16594 ) ) ( not ( = ?auto_16600 ?auto_16597 ) ) ( not ( = ?auto_16600 ?auto_16598 ) ) ( ON_BOARD ?auto_16606 ?auto_16608 ) ( SUPPORTS ?auto_16606 ?auto_16595 ) ( not ( = ?auto_16594 ?auto_16607 ) ) ( CALIBRATION_TARGET ?auto_16606 ?auto_16607 ) ( not ( = ?auto_16607 ?auto_16597 ) ) ( ON_BOARD ?auto_16605 ?auto_16608 ) ( not ( = ?auto_16606 ?auto_16605 ) ) ( SUPPORTS ?auto_16605 ?auto_16596 ) ( CALIBRATION_TARGET ?auto_16605 ?auto_16607 ) ( not ( = ?auto_16607 ?auto_16598 ) ) ( ON_BOARD ?auto_16604 ?auto_16608 ) ( not ( = ?auto_16605 ?auto_16604 ) ) ( SUPPORTS ?auto_16604 ?auto_16599 ) ( CALIBRATION_TARGET ?auto_16604 ?auto_16607 ) ( not ( = ?auto_16607 ?auto_16600 ) ) ( ON_BOARD ?auto_16603 ?auto_16608 ) ( not ( = ?auto_16604 ?auto_16603 ) ) ( SUPPORTS ?auto_16603 ?auto_16601 ) ( CALIBRATION_TARGET ?auto_16603 ?auto_16607 ) ( POWER_AVAIL ?auto_16608 ) ( POINTING ?auto_16608 ?auto_16602 ) ( not ( = ?auto_16607 ?auto_16602 ) ) ( not ( = ?auto_16600 ?auto_16602 ) ) ( not ( = ?auto_16601 ?auto_16599 ) ) ( not ( = ?auto_16598 ?auto_16602 ) ) ( not ( = ?auto_16601 ?auto_16596 ) ) ( not ( = ?auto_16599 ?auto_16596 ) ) ( not ( = ?auto_16597 ?auto_16602 ) ) ( not ( = ?auto_16605 ?auto_16603 ) ) ( not ( = ?auto_16601 ?auto_16595 ) ) ( not ( = ?auto_16599 ?auto_16595 ) ) ( not ( = ?auto_16596 ?auto_16595 ) ) ( not ( = ?auto_16594 ?auto_16602 ) ) ( not ( = ?auto_16606 ?auto_16604 ) ) ( not ( = ?auto_16606 ?auto_16603 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_16600 ?auto_16601 ?auto_16598 ?auto_16599 ?auto_16594 ?auto_16595 ?auto_16597 ?auto_16596 )
      ( GET-4IMAGE-VERIFY ?auto_16594 ?auto_16595 ?auto_16597 ?auto_16596 ?auto_16598 ?auto_16599 ?auto_16600 ?auto_16601 ) )
  )

)

