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
      ?auto_332 - DIRECTION
      ?auto_333 - MODE
    )
    :vars
    (
      ?auto_334 - INSTRUMENT
      ?auto_335 - SATELLITE
      ?auto_336 - DIRECTION
      ?auto_337 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_334 ?auto_335 ) ( SUPPORTS ?auto_334 ?auto_333 ) ( not ( = ?auto_332 ?auto_336 ) ) ( CALIBRATION_TARGET ?auto_334 ?auto_336 ) ( POWER_AVAIL ?auto_335 ) ( POINTING ?auto_335 ?auto_337 ) ( not ( = ?auto_336 ?auto_337 ) ) ( not ( = ?auto_332 ?auto_337 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_335 ?auto_336 ?auto_337 )
      ( !SWITCH_ON ?auto_334 ?auto_335 )
      ( !CALIBRATE ?auto_335 ?auto_334 ?auto_336 )
      ( !TURN_TO ?auto_335 ?auto_332 ?auto_336 )
      ( !TAKE_IMAGE ?auto_335 ?auto_332 ?auto_334 ?auto_333 )
      ( GET-1IMAGE-VERIFY ?auto_332 ?auto_333 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_340 - DIRECTION
      ?auto_341 - MODE
    )
    :vars
    (
      ?auto_342 - INSTRUMENT
      ?auto_343 - SATELLITE
      ?auto_344 - DIRECTION
      ?auto_345 - DIRECTION
      ?auto_346 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_342 ?auto_343 ) ( SUPPORTS ?auto_342 ?auto_341 ) ( not ( = ?auto_340 ?auto_344 ) ) ( CALIBRATION_TARGET ?auto_342 ?auto_344 ) ( POINTING ?auto_343 ?auto_345 ) ( not ( = ?auto_344 ?auto_345 ) ) ( ON_BOARD ?auto_346 ?auto_343 ) ( POWER_ON ?auto_346 ) ( not ( = ?auto_340 ?auto_345 ) ) ( not ( = ?auto_342 ?auto_346 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_346 ?auto_343 )
      ( !TURN_TO ?auto_343 ?auto_344 ?auto_345 )
      ( !SWITCH_ON ?auto_342 ?auto_343 )
      ( !CALIBRATE ?auto_343 ?auto_342 ?auto_344 )
      ( !TURN_TO ?auto_343 ?auto_340 ?auto_344 )
      ( !TAKE_IMAGE ?auto_343 ?auto_340 ?auto_342 ?auto_341 )
      ( GET-1IMAGE-VERIFY ?auto_340 ?auto_341 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_359 - DIRECTION
      ?auto_360 - MODE
      ?auto_362 - DIRECTION
      ?auto_361 - MODE
    )
    :vars
    (
      ?auto_363 - INSTRUMENT
      ?auto_366 - SATELLITE
      ?auto_365 - DIRECTION
      ?auto_364 - INSTRUMENT
      ?auto_367 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_362 ?auto_359 ) ) ( ON_BOARD ?auto_363 ?auto_366 ) ( SUPPORTS ?auto_363 ?auto_361 ) ( not ( = ?auto_362 ?auto_365 ) ) ( CALIBRATION_TARGET ?auto_363 ?auto_365 ) ( not ( = ?auto_365 ?auto_359 ) ) ( ON_BOARD ?auto_364 ?auto_366 ) ( not ( = ?auto_363 ?auto_364 ) ) ( SUPPORTS ?auto_364 ?auto_360 ) ( CALIBRATION_TARGET ?auto_364 ?auto_365 ) ( POWER_AVAIL ?auto_366 ) ( POINTING ?auto_366 ?auto_367 ) ( not ( = ?auto_365 ?auto_367 ) ) ( not ( = ?auto_359 ?auto_367 ) ) ( not ( = ?auto_360 ?auto_361 ) ) ( not ( = ?auto_362 ?auto_367 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_359 ?auto_360 )
      ( GET-1IMAGE ?auto_362 ?auto_361 )
      ( GET-2IMAGE-VERIFY ?auto_359 ?auto_360 ?auto_362 ?auto_361 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_368 - DIRECTION
      ?auto_369 - MODE
      ?auto_371 - DIRECTION
      ?auto_370 - MODE
    )
    :vars
    (
      ?auto_376 - INSTRUMENT
      ?auto_374 - SATELLITE
      ?auto_372 - DIRECTION
      ?auto_373 - INSTRUMENT
      ?auto_375 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_371 ?auto_368 ) ) ( ON_BOARD ?auto_376 ?auto_374 ) ( SUPPORTS ?auto_376 ?auto_369 ) ( not ( = ?auto_368 ?auto_372 ) ) ( CALIBRATION_TARGET ?auto_376 ?auto_372 ) ( not ( = ?auto_372 ?auto_371 ) ) ( ON_BOARD ?auto_373 ?auto_374 ) ( not ( = ?auto_376 ?auto_373 ) ) ( SUPPORTS ?auto_373 ?auto_370 ) ( CALIBRATION_TARGET ?auto_373 ?auto_372 ) ( POWER_AVAIL ?auto_374 ) ( POINTING ?auto_374 ?auto_375 ) ( not ( = ?auto_372 ?auto_375 ) ) ( not ( = ?auto_371 ?auto_375 ) ) ( not ( = ?auto_370 ?auto_369 ) ) ( not ( = ?auto_368 ?auto_375 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_371 ?auto_370 ?auto_368 ?auto_369 )
      ( GET-2IMAGE-VERIFY ?auto_368 ?auto_369 ?auto_371 ?auto_370 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_390 - DIRECTION
      ?auto_391 - MODE
    )
    :vars
    (
      ?auto_392 - INSTRUMENT
      ?auto_393 - SATELLITE
      ?auto_394 - DIRECTION
      ?auto_395 - DIRECTION
      ?auto_396 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_392 ?auto_393 ) ( SUPPORTS ?auto_392 ?auto_391 ) ( not ( = ?auto_390 ?auto_394 ) ) ( CALIBRATION_TARGET ?auto_392 ?auto_394 ) ( POINTING ?auto_393 ?auto_395 ) ( not ( = ?auto_394 ?auto_395 ) ) ( ON_BOARD ?auto_396 ?auto_393 ) ( POWER_ON ?auto_396 ) ( not ( = ?auto_390 ?auto_395 ) ) ( not ( = ?auto_392 ?auto_396 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_396 ?auto_393 )
      ( !TURN_TO ?auto_393 ?auto_394 ?auto_395 )
      ( !SWITCH_ON ?auto_392 ?auto_393 )
      ( !CALIBRATE ?auto_393 ?auto_392 ?auto_394 )
      ( !TURN_TO ?auto_393 ?auto_390 ?auto_394 )
      ( !TAKE_IMAGE ?auto_393 ?auto_390 ?auto_392 ?auto_391 )
      ( GET-1IMAGE-VERIFY ?auto_390 ?auto_391 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_525 - DIRECTION
      ?auto_526 - MODE
      ?auto_528 - DIRECTION
      ?auto_527 - MODE
      ?auto_529 - DIRECTION
      ?auto_530 - MODE
    )
    :vars
    (
      ?auto_532 - INSTRUMENT
      ?auto_534 - SATELLITE
      ?auto_533 - DIRECTION
      ?auto_531 - INSTRUMENT
      ?auto_536 - INSTRUMENT
      ?auto_535 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_528 ?auto_525 ) ) ( not ( = ?auto_529 ?auto_525 ) ) ( not ( = ?auto_529 ?auto_528 ) ) ( ON_BOARD ?auto_532 ?auto_534 ) ( SUPPORTS ?auto_532 ?auto_530 ) ( not ( = ?auto_529 ?auto_533 ) ) ( CALIBRATION_TARGET ?auto_532 ?auto_533 ) ( not ( = ?auto_533 ?auto_528 ) ) ( ON_BOARD ?auto_531 ?auto_534 ) ( not ( = ?auto_532 ?auto_531 ) ) ( SUPPORTS ?auto_531 ?auto_527 ) ( CALIBRATION_TARGET ?auto_531 ?auto_533 ) ( not ( = ?auto_533 ?auto_525 ) ) ( ON_BOARD ?auto_536 ?auto_534 ) ( not ( = ?auto_531 ?auto_536 ) ) ( SUPPORTS ?auto_536 ?auto_526 ) ( CALIBRATION_TARGET ?auto_536 ?auto_533 ) ( POWER_AVAIL ?auto_534 ) ( POINTING ?auto_534 ?auto_535 ) ( not ( = ?auto_533 ?auto_535 ) ) ( not ( = ?auto_525 ?auto_535 ) ) ( not ( = ?auto_526 ?auto_527 ) ) ( not ( = ?auto_528 ?auto_535 ) ) ( not ( = ?auto_526 ?auto_530 ) ) ( not ( = ?auto_527 ?auto_530 ) ) ( not ( = ?auto_529 ?auto_535 ) ) ( not ( = ?auto_532 ?auto_536 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_528 ?auto_527 ?auto_525 ?auto_526 )
      ( GET-1IMAGE ?auto_529 ?auto_530 )
      ( GET-3IMAGE-VERIFY ?auto_525 ?auto_526 ?auto_528 ?auto_527 ?auto_529 ?auto_530 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_551 - DIRECTION
      ?auto_552 - MODE
      ?auto_554 - DIRECTION
      ?auto_553 - MODE
      ?auto_555 - DIRECTION
      ?auto_556 - MODE
    )
    :vars
    (
      ?auto_558 - INSTRUMENT
      ?auto_557 - SATELLITE
      ?auto_559 - DIRECTION
      ?auto_562 - INSTRUMENT
      ?auto_560 - INSTRUMENT
      ?auto_561 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_554 ?auto_551 ) ) ( not ( = ?auto_555 ?auto_551 ) ) ( not ( = ?auto_555 ?auto_554 ) ) ( ON_BOARD ?auto_558 ?auto_557 ) ( SUPPORTS ?auto_558 ?auto_553 ) ( not ( = ?auto_554 ?auto_559 ) ) ( CALIBRATION_TARGET ?auto_558 ?auto_559 ) ( not ( = ?auto_559 ?auto_555 ) ) ( ON_BOARD ?auto_562 ?auto_557 ) ( not ( = ?auto_558 ?auto_562 ) ) ( SUPPORTS ?auto_562 ?auto_556 ) ( CALIBRATION_TARGET ?auto_562 ?auto_559 ) ( not ( = ?auto_559 ?auto_551 ) ) ( ON_BOARD ?auto_560 ?auto_557 ) ( not ( = ?auto_562 ?auto_560 ) ) ( SUPPORTS ?auto_560 ?auto_552 ) ( CALIBRATION_TARGET ?auto_560 ?auto_559 ) ( POWER_AVAIL ?auto_557 ) ( POINTING ?auto_557 ?auto_561 ) ( not ( = ?auto_559 ?auto_561 ) ) ( not ( = ?auto_551 ?auto_561 ) ) ( not ( = ?auto_552 ?auto_556 ) ) ( not ( = ?auto_555 ?auto_561 ) ) ( not ( = ?auto_552 ?auto_553 ) ) ( not ( = ?auto_556 ?auto_553 ) ) ( not ( = ?auto_554 ?auto_561 ) ) ( not ( = ?auto_558 ?auto_560 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_551 ?auto_552 ?auto_555 ?auto_556 ?auto_554 ?auto_553 )
      ( GET-3IMAGE-VERIFY ?auto_551 ?auto_552 ?auto_554 ?auto_553 ?auto_555 ?auto_556 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_577 - DIRECTION
      ?auto_578 - MODE
      ?auto_580 - DIRECTION
      ?auto_579 - MODE
      ?auto_581 - DIRECTION
      ?auto_582 - MODE
    )
    :vars
    (
      ?auto_584 - INSTRUMENT
      ?auto_585 - SATELLITE
      ?auto_583 - DIRECTION
      ?auto_588 - INSTRUMENT
      ?auto_587 - INSTRUMENT
      ?auto_586 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_580 ?auto_577 ) ) ( not ( = ?auto_581 ?auto_577 ) ) ( not ( = ?auto_581 ?auto_580 ) ) ( ON_BOARD ?auto_584 ?auto_585 ) ( SUPPORTS ?auto_584 ?auto_582 ) ( not ( = ?auto_581 ?auto_583 ) ) ( CALIBRATION_TARGET ?auto_584 ?auto_583 ) ( not ( = ?auto_583 ?auto_577 ) ) ( ON_BOARD ?auto_588 ?auto_585 ) ( not ( = ?auto_584 ?auto_588 ) ) ( SUPPORTS ?auto_588 ?auto_578 ) ( CALIBRATION_TARGET ?auto_588 ?auto_583 ) ( not ( = ?auto_583 ?auto_580 ) ) ( ON_BOARD ?auto_587 ?auto_585 ) ( not ( = ?auto_588 ?auto_587 ) ) ( SUPPORTS ?auto_587 ?auto_579 ) ( CALIBRATION_TARGET ?auto_587 ?auto_583 ) ( POWER_AVAIL ?auto_585 ) ( POINTING ?auto_585 ?auto_586 ) ( not ( = ?auto_583 ?auto_586 ) ) ( not ( = ?auto_580 ?auto_586 ) ) ( not ( = ?auto_579 ?auto_578 ) ) ( not ( = ?auto_577 ?auto_586 ) ) ( not ( = ?auto_579 ?auto_582 ) ) ( not ( = ?auto_578 ?auto_582 ) ) ( not ( = ?auto_581 ?auto_586 ) ) ( not ( = ?auto_584 ?auto_587 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_580 ?auto_579 ?auto_581 ?auto_582 ?auto_577 ?auto_578 )
      ( GET-3IMAGE-VERIFY ?auto_577 ?auto_578 ?auto_580 ?auto_579 ?auto_581 ?auto_582 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_603 - DIRECTION
      ?auto_604 - MODE
      ?auto_606 - DIRECTION
      ?auto_605 - MODE
      ?auto_607 - DIRECTION
      ?auto_608 - MODE
    )
    :vars
    (
      ?auto_610 - INSTRUMENT
      ?auto_611 - SATELLITE
      ?auto_609 - DIRECTION
      ?auto_614 - INSTRUMENT
      ?auto_613 - INSTRUMENT
      ?auto_612 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_606 ?auto_603 ) ) ( not ( = ?auto_607 ?auto_603 ) ) ( not ( = ?auto_607 ?auto_606 ) ) ( ON_BOARD ?auto_610 ?auto_611 ) ( SUPPORTS ?auto_610 ?auto_605 ) ( not ( = ?auto_606 ?auto_609 ) ) ( CALIBRATION_TARGET ?auto_610 ?auto_609 ) ( not ( = ?auto_609 ?auto_603 ) ) ( ON_BOARD ?auto_614 ?auto_611 ) ( not ( = ?auto_610 ?auto_614 ) ) ( SUPPORTS ?auto_614 ?auto_604 ) ( CALIBRATION_TARGET ?auto_614 ?auto_609 ) ( not ( = ?auto_609 ?auto_607 ) ) ( ON_BOARD ?auto_613 ?auto_611 ) ( not ( = ?auto_614 ?auto_613 ) ) ( SUPPORTS ?auto_613 ?auto_608 ) ( CALIBRATION_TARGET ?auto_613 ?auto_609 ) ( POWER_AVAIL ?auto_611 ) ( POINTING ?auto_611 ?auto_612 ) ( not ( = ?auto_609 ?auto_612 ) ) ( not ( = ?auto_607 ?auto_612 ) ) ( not ( = ?auto_608 ?auto_604 ) ) ( not ( = ?auto_603 ?auto_612 ) ) ( not ( = ?auto_608 ?auto_605 ) ) ( not ( = ?auto_604 ?auto_605 ) ) ( not ( = ?auto_606 ?auto_612 ) ) ( not ( = ?auto_610 ?auto_613 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_607 ?auto_608 ?auto_606 ?auto_605 ?auto_603 ?auto_604 )
      ( GET-3IMAGE-VERIFY ?auto_603 ?auto_604 ?auto_606 ?auto_605 ?auto_607 ?auto_608 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_657 - DIRECTION
      ?auto_658 - MODE
      ?auto_660 - DIRECTION
      ?auto_659 - MODE
      ?auto_661 - DIRECTION
      ?auto_662 - MODE
    )
    :vars
    (
      ?auto_664 - INSTRUMENT
      ?auto_665 - SATELLITE
      ?auto_663 - DIRECTION
      ?auto_668 - INSTRUMENT
      ?auto_667 - INSTRUMENT
      ?auto_666 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_660 ?auto_657 ) ) ( not ( = ?auto_661 ?auto_657 ) ) ( not ( = ?auto_661 ?auto_660 ) ) ( ON_BOARD ?auto_664 ?auto_665 ) ( SUPPORTS ?auto_664 ?auto_658 ) ( not ( = ?auto_657 ?auto_663 ) ) ( CALIBRATION_TARGET ?auto_664 ?auto_663 ) ( not ( = ?auto_663 ?auto_661 ) ) ( ON_BOARD ?auto_668 ?auto_665 ) ( not ( = ?auto_664 ?auto_668 ) ) ( SUPPORTS ?auto_668 ?auto_662 ) ( CALIBRATION_TARGET ?auto_668 ?auto_663 ) ( not ( = ?auto_663 ?auto_660 ) ) ( ON_BOARD ?auto_667 ?auto_665 ) ( not ( = ?auto_668 ?auto_667 ) ) ( SUPPORTS ?auto_667 ?auto_659 ) ( CALIBRATION_TARGET ?auto_667 ?auto_663 ) ( POWER_AVAIL ?auto_665 ) ( POINTING ?auto_665 ?auto_666 ) ( not ( = ?auto_663 ?auto_666 ) ) ( not ( = ?auto_660 ?auto_666 ) ) ( not ( = ?auto_659 ?auto_662 ) ) ( not ( = ?auto_661 ?auto_666 ) ) ( not ( = ?auto_659 ?auto_658 ) ) ( not ( = ?auto_662 ?auto_658 ) ) ( not ( = ?auto_657 ?auto_666 ) ) ( not ( = ?auto_664 ?auto_667 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_660 ?auto_659 ?auto_657 ?auto_658 ?auto_661 ?auto_662 )
      ( GET-3IMAGE-VERIFY ?auto_657 ?auto_658 ?auto_660 ?auto_659 ?auto_661 ?auto_662 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_683 - DIRECTION
      ?auto_684 - MODE
      ?auto_686 - DIRECTION
      ?auto_685 - MODE
      ?auto_687 - DIRECTION
      ?auto_688 - MODE
    )
    :vars
    (
      ?auto_690 - INSTRUMENT
      ?auto_691 - SATELLITE
      ?auto_689 - DIRECTION
      ?auto_694 - INSTRUMENT
      ?auto_693 - INSTRUMENT
      ?auto_692 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_686 ?auto_683 ) ) ( not ( = ?auto_687 ?auto_683 ) ) ( not ( = ?auto_687 ?auto_686 ) ) ( ON_BOARD ?auto_690 ?auto_691 ) ( SUPPORTS ?auto_690 ?auto_684 ) ( not ( = ?auto_683 ?auto_689 ) ) ( CALIBRATION_TARGET ?auto_690 ?auto_689 ) ( not ( = ?auto_689 ?auto_686 ) ) ( ON_BOARD ?auto_694 ?auto_691 ) ( not ( = ?auto_690 ?auto_694 ) ) ( SUPPORTS ?auto_694 ?auto_685 ) ( CALIBRATION_TARGET ?auto_694 ?auto_689 ) ( not ( = ?auto_689 ?auto_687 ) ) ( ON_BOARD ?auto_693 ?auto_691 ) ( not ( = ?auto_694 ?auto_693 ) ) ( SUPPORTS ?auto_693 ?auto_688 ) ( CALIBRATION_TARGET ?auto_693 ?auto_689 ) ( POWER_AVAIL ?auto_691 ) ( POINTING ?auto_691 ?auto_692 ) ( not ( = ?auto_689 ?auto_692 ) ) ( not ( = ?auto_687 ?auto_692 ) ) ( not ( = ?auto_688 ?auto_685 ) ) ( not ( = ?auto_686 ?auto_692 ) ) ( not ( = ?auto_688 ?auto_684 ) ) ( not ( = ?auto_685 ?auto_684 ) ) ( not ( = ?auto_683 ?auto_692 ) ) ( not ( = ?auto_690 ?auto_693 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_687 ?auto_688 ?auto_683 ?auto_684 ?auto_686 ?auto_685 )
      ( GET-3IMAGE-VERIFY ?auto_683 ?auto_684 ?auto_686 ?auto_685 ?auto_687 ?auto_688 ) )
  )

)

