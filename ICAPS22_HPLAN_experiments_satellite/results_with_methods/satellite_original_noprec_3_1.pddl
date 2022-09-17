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
      ?auto_8350 - DIRECTION
      ?auto_8351 - MODE
    )
    :vars
    (
      ?auto_8352 - INSTRUMENT
      ?auto_8353 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_8352 ) ( ON_BOARD ?auto_8352 ?auto_8353 ) ( SUPPORTS ?auto_8352 ?auto_8351 ) ( POWER_ON ?auto_8352 ) ( POINTING ?auto_8353 ?auto_8350 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_8353 ?auto_8350 ?auto_8352 ?auto_8351 )
      ( GET-1IMAGE-VERIFY ?auto_8350 ?auto_8351 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8368 - DIRECTION
      ?auto_8369 - MODE
    )
    :vars
    (
      ?auto_8371 - INSTRUMENT
      ?auto_8370 - SATELLITE
      ?auto_8372 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_8371 ) ( ON_BOARD ?auto_8371 ?auto_8370 ) ( SUPPORTS ?auto_8371 ?auto_8369 ) ( POWER_ON ?auto_8371 ) ( POINTING ?auto_8370 ?auto_8372 ) ( not ( = ?auto_8368 ?auto_8372 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_8370 ?auto_8368 ?auto_8372 )
      ( GET-1IMAGE ?auto_8368 ?auto_8369 )
      ( GET-1IMAGE-VERIFY ?auto_8368 ?auto_8369 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8389 - DIRECTION
      ?auto_8390 - MODE
    )
    :vars
    (
      ?auto_8393 - INSTRUMENT
      ?auto_8392 - SATELLITE
      ?auto_8391 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8393 ?auto_8392 ) ( SUPPORTS ?auto_8393 ?auto_8390 ) ( POWER_ON ?auto_8393 ) ( POINTING ?auto_8392 ?auto_8391 ) ( not ( = ?auto_8389 ?auto_8391 ) ) ( CALIBRATION_TARGET ?auto_8393 ?auto_8391 ) ( NOT_CALIBRATED ?auto_8393 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_8392 ?auto_8393 ?auto_8391 )
      ( GET-1IMAGE ?auto_8389 ?auto_8390 )
      ( GET-1IMAGE-VERIFY ?auto_8389 ?auto_8390 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8410 - DIRECTION
      ?auto_8411 - MODE
    )
    :vars
    (
      ?auto_8414 - INSTRUMENT
      ?auto_8412 - SATELLITE
      ?auto_8413 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8414 ?auto_8412 ) ( SUPPORTS ?auto_8414 ?auto_8411 ) ( POINTING ?auto_8412 ?auto_8413 ) ( not ( = ?auto_8410 ?auto_8413 ) ) ( CALIBRATION_TARGET ?auto_8414 ?auto_8413 ) ( POWER_AVAIL ?auto_8412 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_8414 ?auto_8412 )
      ( GET-1IMAGE ?auto_8410 ?auto_8411 )
      ( GET-1IMAGE-VERIFY ?auto_8410 ?auto_8411 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8431 - DIRECTION
      ?auto_8432 - MODE
    )
    :vars
    (
      ?auto_8435 - INSTRUMENT
      ?auto_8433 - SATELLITE
      ?auto_8434 - DIRECTION
      ?auto_8436 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8435 ?auto_8433 ) ( SUPPORTS ?auto_8435 ?auto_8432 ) ( not ( = ?auto_8431 ?auto_8434 ) ) ( CALIBRATION_TARGET ?auto_8435 ?auto_8434 ) ( POWER_AVAIL ?auto_8433 ) ( POINTING ?auto_8433 ?auto_8436 ) ( not ( = ?auto_8434 ?auto_8436 ) ) ( not ( = ?auto_8431 ?auto_8436 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_8433 ?auto_8434 ?auto_8436 )
      ( GET-1IMAGE ?auto_8431 ?auto_8432 )
      ( GET-1IMAGE-VERIFY ?auto_8431 ?auto_8432 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8511 - DIRECTION
      ?auto_8512 - MODE
    )
    :vars
    (
      ?auto_8513 - INSTRUMENT
      ?auto_8514 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_8513 ) ( ON_BOARD ?auto_8513 ?auto_8514 ) ( SUPPORTS ?auto_8513 ?auto_8512 ) ( POWER_ON ?auto_8513 ) ( POINTING ?auto_8514 ?auto_8511 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_8514 ?auto_8511 ?auto_8513 ?auto_8512 )
      ( GET-1IMAGE-VERIFY ?auto_8511 ?auto_8512 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8515 - DIRECTION
      ?auto_8516 - MODE
      ?auto_8518 - DIRECTION
      ?auto_8517 - MODE
    )
    :vars
    (
      ?auto_8519 - INSTRUMENT
      ?auto_8520 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_8519 ) ( ON_BOARD ?auto_8519 ?auto_8520 ) ( SUPPORTS ?auto_8519 ?auto_8517 ) ( POWER_ON ?auto_8519 ) ( POINTING ?auto_8520 ?auto_8518 ) ( HAVE_IMAGE ?auto_8515 ?auto_8516 ) ( not ( = ?auto_8515 ?auto_8518 ) ) ( not ( = ?auto_8516 ?auto_8517 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8518 ?auto_8517 )
      ( GET-2IMAGE-VERIFY ?auto_8515 ?auto_8516 ?auto_8518 ?auto_8517 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8521 - DIRECTION
      ?auto_8522 - MODE
      ?auto_8524 - DIRECTION
      ?auto_8523 - MODE
    )
    :vars
    (
      ?auto_8525 - INSTRUMENT
      ?auto_8526 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_8525 ) ( ON_BOARD ?auto_8525 ?auto_8526 ) ( SUPPORTS ?auto_8525 ?auto_8522 ) ( POWER_ON ?auto_8525 ) ( POINTING ?auto_8526 ?auto_8521 ) ( HAVE_IMAGE ?auto_8524 ?auto_8523 ) ( not ( = ?auto_8521 ?auto_8524 ) ) ( not ( = ?auto_8522 ?auto_8523 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8521 ?auto_8522 )
      ( GET-2IMAGE-VERIFY ?auto_8521 ?auto_8522 ?auto_8524 ?auto_8523 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8533 - DIRECTION
      ?auto_8534 - MODE
      ?auto_8536 - DIRECTION
      ?auto_8535 - MODE
      ?auto_8538 - DIRECTION
      ?auto_8537 - MODE
    )
    :vars
    (
      ?auto_8539 - INSTRUMENT
      ?auto_8540 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_8539 ) ( ON_BOARD ?auto_8539 ?auto_8540 ) ( SUPPORTS ?auto_8539 ?auto_8537 ) ( POWER_ON ?auto_8539 ) ( POINTING ?auto_8540 ?auto_8538 ) ( HAVE_IMAGE ?auto_8533 ?auto_8534 ) ( HAVE_IMAGE ?auto_8536 ?auto_8535 ) ( not ( = ?auto_8533 ?auto_8536 ) ) ( not ( = ?auto_8533 ?auto_8538 ) ) ( not ( = ?auto_8534 ?auto_8535 ) ) ( not ( = ?auto_8534 ?auto_8537 ) ) ( not ( = ?auto_8536 ?auto_8538 ) ) ( not ( = ?auto_8535 ?auto_8537 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8538 ?auto_8537 )
      ( GET-3IMAGE-VERIFY ?auto_8533 ?auto_8534 ?auto_8536 ?auto_8535 ?auto_8538 ?auto_8537 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8541 - DIRECTION
      ?auto_8542 - MODE
      ?auto_8544 - DIRECTION
      ?auto_8543 - MODE
      ?auto_8546 - DIRECTION
      ?auto_8545 - MODE
    )
    :vars
    (
      ?auto_8547 - INSTRUMENT
      ?auto_8548 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_8547 ) ( ON_BOARD ?auto_8547 ?auto_8548 ) ( SUPPORTS ?auto_8547 ?auto_8543 ) ( POWER_ON ?auto_8547 ) ( POINTING ?auto_8548 ?auto_8544 ) ( HAVE_IMAGE ?auto_8541 ?auto_8542 ) ( HAVE_IMAGE ?auto_8546 ?auto_8545 ) ( not ( = ?auto_8541 ?auto_8544 ) ) ( not ( = ?auto_8541 ?auto_8546 ) ) ( not ( = ?auto_8542 ?auto_8543 ) ) ( not ( = ?auto_8542 ?auto_8545 ) ) ( not ( = ?auto_8544 ?auto_8546 ) ) ( not ( = ?auto_8543 ?auto_8545 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8544 ?auto_8543 )
      ( GET-3IMAGE-VERIFY ?auto_8541 ?auto_8542 ?auto_8544 ?auto_8543 ?auto_8546 ?auto_8545 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8557 - DIRECTION
      ?auto_8558 - MODE
      ?auto_8560 - DIRECTION
      ?auto_8559 - MODE
      ?auto_8562 - DIRECTION
      ?auto_8561 - MODE
    )
    :vars
    (
      ?auto_8563 - INSTRUMENT
      ?auto_8564 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_8563 ) ( ON_BOARD ?auto_8563 ?auto_8564 ) ( SUPPORTS ?auto_8563 ?auto_8558 ) ( POWER_ON ?auto_8563 ) ( POINTING ?auto_8564 ?auto_8557 ) ( HAVE_IMAGE ?auto_8560 ?auto_8559 ) ( HAVE_IMAGE ?auto_8562 ?auto_8561 ) ( not ( = ?auto_8557 ?auto_8560 ) ) ( not ( = ?auto_8557 ?auto_8562 ) ) ( not ( = ?auto_8558 ?auto_8559 ) ) ( not ( = ?auto_8558 ?auto_8561 ) ) ( not ( = ?auto_8560 ?auto_8562 ) ) ( not ( = ?auto_8559 ?auto_8561 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8557 ?auto_8558 )
      ( GET-3IMAGE-VERIFY ?auto_8557 ?auto_8558 ?auto_8560 ?auto_8559 ?auto_8562 ?auto_8561 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8589 - DIRECTION
      ?auto_8590 - MODE
    )
    :vars
    (
      ?auto_8591 - INSTRUMENT
      ?auto_8592 - SATELLITE
      ?auto_8593 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_8591 ) ( ON_BOARD ?auto_8591 ?auto_8592 ) ( SUPPORTS ?auto_8591 ?auto_8590 ) ( POWER_ON ?auto_8591 ) ( POINTING ?auto_8592 ?auto_8593 ) ( not ( = ?auto_8589 ?auto_8593 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_8592 ?auto_8589 ?auto_8593 )
      ( GET-1IMAGE ?auto_8589 ?auto_8590 )
      ( GET-1IMAGE-VERIFY ?auto_8589 ?auto_8590 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8594 - DIRECTION
      ?auto_8595 - MODE
      ?auto_8597 - DIRECTION
      ?auto_8596 - MODE
    )
    :vars
    (
      ?auto_8600 - INSTRUMENT
      ?auto_8598 - SATELLITE
      ?auto_8599 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_8600 ) ( ON_BOARD ?auto_8600 ?auto_8598 ) ( SUPPORTS ?auto_8600 ?auto_8596 ) ( POWER_ON ?auto_8600 ) ( POINTING ?auto_8598 ?auto_8599 ) ( not ( = ?auto_8597 ?auto_8599 ) ) ( HAVE_IMAGE ?auto_8594 ?auto_8595 ) ( not ( = ?auto_8594 ?auto_8597 ) ) ( not ( = ?auto_8594 ?auto_8599 ) ) ( not ( = ?auto_8595 ?auto_8596 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8597 ?auto_8596 )
      ( GET-2IMAGE-VERIFY ?auto_8594 ?auto_8595 ?auto_8597 ?auto_8596 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8601 - DIRECTION
      ?auto_8602 - MODE
      ?auto_8604 - DIRECTION
      ?auto_8603 - MODE
    )
    :vars
    (
      ?auto_8606 - INSTRUMENT
      ?auto_8605 - SATELLITE
      ?auto_8607 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_8606 ) ( ON_BOARD ?auto_8606 ?auto_8605 ) ( SUPPORTS ?auto_8606 ?auto_8602 ) ( POWER_ON ?auto_8606 ) ( POINTING ?auto_8605 ?auto_8607 ) ( not ( = ?auto_8601 ?auto_8607 ) ) ( HAVE_IMAGE ?auto_8604 ?auto_8603 ) ( not ( = ?auto_8604 ?auto_8601 ) ) ( not ( = ?auto_8604 ?auto_8607 ) ) ( not ( = ?auto_8603 ?auto_8602 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8604 ?auto_8603 ?auto_8601 ?auto_8602 )
      ( GET-2IMAGE-VERIFY ?auto_8601 ?auto_8602 ?auto_8604 ?auto_8603 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8617 - DIRECTION
      ?auto_8618 - MODE
      ?auto_8620 - DIRECTION
      ?auto_8619 - MODE
      ?auto_8622 - DIRECTION
      ?auto_8621 - MODE
    )
    :vars
    (
      ?auto_8624 - INSTRUMENT
      ?auto_8623 - SATELLITE
      ?auto_8625 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_8624 ) ( ON_BOARD ?auto_8624 ?auto_8623 ) ( SUPPORTS ?auto_8624 ?auto_8621 ) ( POWER_ON ?auto_8624 ) ( POINTING ?auto_8623 ?auto_8625 ) ( not ( = ?auto_8622 ?auto_8625 ) ) ( HAVE_IMAGE ?auto_8620 ?auto_8619 ) ( not ( = ?auto_8620 ?auto_8622 ) ) ( not ( = ?auto_8620 ?auto_8625 ) ) ( not ( = ?auto_8619 ?auto_8621 ) ) ( HAVE_IMAGE ?auto_8617 ?auto_8618 ) ( not ( = ?auto_8617 ?auto_8620 ) ) ( not ( = ?auto_8617 ?auto_8622 ) ) ( not ( = ?auto_8617 ?auto_8625 ) ) ( not ( = ?auto_8618 ?auto_8619 ) ) ( not ( = ?auto_8618 ?auto_8621 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8620 ?auto_8619 ?auto_8622 ?auto_8621 )
      ( GET-3IMAGE-VERIFY ?auto_8617 ?auto_8618 ?auto_8620 ?auto_8619 ?auto_8622 ?auto_8621 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8626 - DIRECTION
      ?auto_8627 - MODE
      ?auto_8629 - DIRECTION
      ?auto_8628 - MODE
      ?auto_8631 - DIRECTION
      ?auto_8630 - MODE
    )
    :vars
    (
      ?auto_8633 - INSTRUMENT
      ?auto_8632 - SATELLITE
      ?auto_8634 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_8633 ) ( ON_BOARD ?auto_8633 ?auto_8632 ) ( SUPPORTS ?auto_8633 ?auto_8628 ) ( POWER_ON ?auto_8633 ) ( POINTING ?auto_8632 ?auto_8634 ) ( not ( = ?auto_8629 ?auto_8634 ) ) ( HAVE_IMAGE ?auto_8631 ?auto_8630 ) ( not ( = ?auto_8631 ?auto_8629 ) ) ( not ( = ?auto_8631 ?auto_8634 ) ) ( not ( = ?auto_8630 ?auto_8628 ) ) ( HAVE_IMAGE ?auto_8626 ?auto_8627 ) ( not ( = ?auto_8626 ?auto_8629 ) ) ( not ( = ?auto_8626 ?auto_8631 ) ) ( not ( = ?auto_8626 ?auto_8634 ) ) ( not ( = ?auto_8627 ?auto_8628 ) ) ( not ( = ?auto_8627 ?auto_8630 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8631 ?auto_8630 ?auto_8629 ?auto_8628 )
      ( GET-3IMAGE-VERIFY ?auto_8626 ?auto_8627 ?auto_8629 ?auto_8628 ?auto_8631 ?auto_8630 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8644 - DIRECTION
      ?auto_8645 - MODE
      ?auto_8647 - DIRECTION
      ?auto_8646 - MODE
      ?auto_8649 - DIRECTION
      ?auto_8648 - MODE
    )
    :vars
    (
      ?auto_8651 - INSTRUMENT
      ?auto_8650 - SATELLITE
      ?auto_8652 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_8651 ) ( ON_BOARD ?auto_8651 ?auto_8650 ) ( SUPPORTS ?auto_8651 ?auto_8645 ) ( POWER_ON ?auto_8651 ) ( POINTING ?auto_8650 ?auto_8652 ) ( not ( = ?auto_8644 ?auto_8652 ) ) ( HAVE_IMAGE ?auto_8649 ?auto_8648 ) ( not ( = ?auto_8649 ?auto_8644 ) ) ( not ( = ?auto_8649 ?auto_8652 ) ) ( not ( = ?auto_8648 ?auto_8645 ) ) ( HAVE_IMAGE ?auto_8647 ?auto_8646 ) ( not ( = ?auto_8644 ?auto_8647 ) ) ( not ( = ?auto_8645 ?auto_8646 ) ) ( not ( = ?auto_8647 ?auto_8649 ) ) ( not ( = ?auto_8647 ?auto_8652 ) ) ( not ( = ?auto_8646 ?auto_8648 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8649 ?auto_8648 ?auto_8644 ?auto_8645 )
      ( GET-3IMAGE-VERIFY ?auto_8644 ?auto_8645 ?auto_8647 ?auto_8646 ?auto_8649 ?auto_8648 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8682 - DIRECTION
      ?auto_8683 - MODE
    )
    :vars
    (
      ?auto_8685 - INSTRUMENT
      ?auto_8684 - SATELLITE
      ?auto_8686 - DIRECTION
      ?auto_8687 - DIRECTION
      ?auto_8688 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_8685 ?auto_8684 ) ( SUPPORTS ?auto_8685 ?auto_8683 ) ( POWER_ON ?auto_8685 ) ( POINTING ?auto_8684 ?auto_8686 ) ( not ( = ?auto_8682 ?auto_8686 ) ) ( HAVE_IMAGE ?auto_8687 ?auto_8688 ) ( not ( = ?auto_8687 ?auto_8682 ) ) ( not ( = ?auto_8687 ?auto_8686 ) ) ( not ( = ?auto_8688 ?auto_8683 ) ) ( CALIBRATION_TARGET ?auto_8685 ?auto_8686 ) ( NOT_CALIBRATED ?auto_8685 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_8684 ?auto_8685 ?auto_8686 )
      ( GET-2IMAGE ?auto_8687 ?auto_8688 ?auto_8682 ?auto_8683 )
      ( GET-1IMAGE-VERIFY ?auto_8682 ?auto_8683 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8689 - DIRECTION
      ?auto_8690 - MODE
      ?auto_8692 - DIRECTION
      ?auto_8691 - MODE
    )
    :vars
    (
      ?auto_8693 - INSTRUMENT
      ?auto_8695 - SATELLITE
      ?auto_8694 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8693 ?auto_8695 ) ( SUPPORTS ?auto_8693 ?auto_8691 ) ( POWER_ON ?auto_8693 ) ( POINTING ?auto_8695 ?auto_8694 ) ( not ( = ?auto_8692 ?auto_8694 ) ) ( HAVE_IMAGE ?auto_8689 ?auto_8690 ) ( not ( = ?auto_8689 ?auto_8692 ) ) ( not ( = ?auto_8689 ?auto_8694 ) ) ( not ( = ?auto_8690 ?auto_8691 ) ) ( CALIBRATION_TARGET ?auto_8693 ?auto_8694 ) ( NOT_CALIBRATED ?auto_8693 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8692 ?auto_8691 )
      ( GET-2IMAGE-VERIFY ?auto_8689 ?auto_8690 ?auto_8692 ?auto_8691 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8696 - DIRECTION
      ?auto_8697 - MODE
      ?auto_8699 - DIRECTION
      ?auto_8698 - MODE
    )
    :vars
    (
      ?auto_8700 - INSTRUMENT
      ?auto_8702 - SATELLITE
      ?auto_8701 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8700 ?auto_8702 ) ( SUPPORTS ?auto_8700 ?auto_8697 ) ( POWER_ON ?auto_8700 ) ( POINTING ?auto_8702 ?auto_8701 ) ( not ( = ?auto_8696 ?auto_8701 ) ) ( HAVE_IMAGE ?auto_8699 ?auto_8698 ) ( not ( = ?auto_8699 ?auto_8696 ) ) ( not ( = ?auto_8699 ?auto_8701 ) ) ( not ( = ?auto_8698 ?auto_8697 ) ) ( CALIBRATION_TARGET ?auto_8700 ?auto_8701 ) ( NOT_CALIBRATED ?auto_8700 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8699 ?auto_8698 ?auto_8696 ?auto_8697 )
      ( GET-2IMAGE-VERIFY ?auto_8696 ?auto_8697 ?auto_8699 ?auto_8698 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8712 - DIRECTION
      ?auto_8713 - MODE
      ?auto_8715 - DIRECTION
      ?auto_8714 - MODE
      ?auto_8717 - DIRECTION
      ?auto_8716 - MODE
    )
    :vars
    (
      ?auto_8718 - INSTRUMENT
      ?auto_8720 - SATELLITE
      ?auto_8719 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8718 ?auto_8720 ) ( SUPPORTS ?auto_8718 ?auto_8716 ) ( POWER_ON ?auto_8718 ) ( POINTING ?auto_8720 ?auto_8719 ) ( not ( = ?auto_8717 ?auto_8719 ) ) ( HAVE_IMAGE ?auto_8712 ?auto_8713 ) ( not ( = ?auto_8712 ?auto_8717 ) ) ( not ( = ?auto_8712 ?auto_8719 ) ) ( not ( = ?auto_8713 ?auto_8716 ) ) ( CALIBRATION_TARGET ?auto_8718 ?auto_8719 ) ( NOT_CALIBRATED ?auto_8718 ) ( HAVE_IMAGE ?auto_8715 ?auto_8714 ) ( not ( = ?auto_8712 ?auto_8715 ) ) ( not ( = ?auto_8713 ?auto_8714 ) ) ( not ( = ?auto_8715 ?auto_8717 ) ) ( not ( = ?auto_8715 ?auto_8719 ) ) ( not ( = ?auto_8714 ?auto_8716 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8712 ?auto_8713 ?auto_8717 ?auto_8716 )
      ( GET-3IMAGE-VERIFY ?auto_8712 ?auto_8713 ?auto_8715 ?auto_8714 ?auto_8717 ?auto_8716 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8721 - DIRECTION
      ?auto_8722 - MODE
      ?auto_8724 - DIRECTION
      ?auto_8723 - MODE
      ?auto_8726 - DIRECTION
      ?auto_8725 - MODE
    )
    :vars
    (
      ?auto_8727 - INSTRUMENT
      ?auto_8729 - SATELLITE
      ?auto_8728 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8727 ?auto_8729 ) ( SUPPORTS ?auto_8727 ?auto_8723 ) ( POWER_ON ?auto_8727 ) ( POINTING ?auto_8729 ?auto_8728 ) ( not ( = ?auto_8724 ?auto_8728 ) ) ( HAVE_IMAGE ?auto_8726 ?auto_8725 ) ( not ( = ?auto_8726 ?auto_8724 ) ) ( not ( = ?auto_8726 ?auto_8728 ) ) ( not ( = ?auto_8725 ?auto_8723 ) ) ( CALIBRATION_TARGET ?auto_8727 ?auto_8728 ) ( NOT_CALIBRATED ?auto_8727 ) ( HAVE_IMAGE ?auto_8721 ?auto_8722 ) ( not ( = ?auto_8721 ?auto_8724 ) ) ( not ( = ?auto_8721 ?auto_8726 ) ) ( not ( = ?auto_8721 ?auto_8728 ) ) ( not ( = ?auto_8722 ?auto_8723 ) ) ( not ( = ?auto_8722 ?auto_8725 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8726 ?auto_8725 ?auto_8724 ?auto_8723 )
      ( GET-3IMAGE-VERIFY ?auto_8721 ?auto_8722 ?auto_8724 ?auto_8723 ?auto_8726 ?auto_8725 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8739 - DIRECTION
      ?auto_8740 - MODE
      ?auto_8742 - DIRECTION
      ?auto_8741 - MODE
      ?auto_8744 - DIRECTION
      ?auto_8743 - MODE
    )
    :vars
    (
      ?auto_8745 - INSTRUMENT
      ?auto_8747 - SATELLITE
      ?auto_8746 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8745 ?auto_8747 ) ( SUPPORTS ?auto_8745 ?auto_8740 ) ( POWER_ON ?auto_8745 ) ( POINTING ?auto_8747 ?auto_8746 ) ( not ( = ?auto_8739 ?auto_8746 ) ) ( HAVE_IMAGE ?auto_8744 ?auto_8743 ) ( not ( = ?auto_8744 ?auto_8739 ) ) ( not ( = ?auto_8744 ?auto_8746 ) ) ( not ( = ?auto_8743 ?auto_8740 ) ) ( CALIBRATION_TARGET ?auto_8745 ?auto_8746 ) ( NOT_CALIBRATED ?auto_8745 ) ( HAVE_IMAGE ?auto_8742 ?auto_8741 ) ( not ( = ?auto_8739 ?auto_8742 ) ) ( not ( = ?auto_8740 ?auto_8741 ) ) ( not ( = ?auto_8742 ?auto_8744 ) ) ( not ( = ?auto_8742 ?auto_8746 ) ) ( not ( = ?auto_8741 ?auto_8743 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8744 ?auto_8743 ?auto_8739 ?auto_8740 )
      ( GET-3IMAGE-VERIFY ?auto_8739 ?auto_8740 ?auto_8742 ?auto_8741 ?auto_8744 ?auto_8743 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8777 - DIRECTION
      ?auto_8778 - MODE
    )
    :vars
    (
      ?auto_8780 - INSTRUMENT
      ?auto_8783 - SATELLITE
      ?auto_8782 - DIRECTION
      ?auto_8779 - DIRECTION
      ?auto_8781 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_8780 ?auto_8783 ) ( SUPPORTS ?auto_8780 ?auto_8778 ) ( POINTING ?auto_8783 ?auto_8782 ) ( not ( = ?auto_8777 ?auto_8782 ) ) ( HAVE_IMAGE ?auto_8779 ?auto_8781 ) ( not ( = ?auto_8779 ?auto_8777 ) ) ( not ( = ?auto_8779 ?auto_8782 ) ) ( not ( = ?auto_8781 ?auto_8778 ) ) ( CALIBRATION_TARGET ?auto_8780 ?auto_8782 ) ( POWER_AVAIL ?auto_8783 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_8780 ?auto_8783 )
      ( GET-2IMAGE ?auto_8779 ?auto_8781 ?auto_8777 ?auto_8778 )
      ( GET-1IMAGE-VERIFY ?auto_8777 ?auto_8778 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8784 - DIRECTION
      ?auto_8785 - MODE
      ?auto_8787 - DIRECTION
      ?auto_8786 - MODE
    )
    :vars
    (
      ?auto_8790 - INSTRUMENT
      ?auto_8789 - SATELLITE
      ?auto_8788 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8790 ?auto_8789 ) ( SUPPORTS ?auto_8790 ?auto_8786 ) ( POINTING ?auto_8789 ?auto_8788 ) ( not ( = ?auto_8787 ?auto_8788 ) ) ( HAVE_IMAGE ?auto_8784 ?auto_8785 ) ( not ( = ?auto_8784 ?auto_8787 ) ) ( not ( = ?auto_8784 ?auto_8788 ) ) ( not ( = ?auto_8785 ?auto_8786 ) ) ( CALIBRATION_TARGET ?auto_8790 ?auto_8788 ) ( POWER_AVAIL ?auto_8789 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8787 ?auto_8786 )
      ( GET-2IMAGE-VERIFY ?auto_8784 ?auto_8785 ?auto_8787 ?auto_8786 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8791 - DIRECTION
      ?auto_8792 - MODE
      ?auto_8794 - DIRECTION
      ?auto_8793 - MODE
    )
    :vars
    (
      ?auto_8797 - INSTRUMENT
      ?auto_8796 - SATELLITE
      ?auto_8795 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8797 ?auto_8796 ) ( SUPPORTS ?auto_8797 ?auto_8792 ) ( POINTING ?auto_8796 ?auto_8795 ) ( not ( = ?auto_8791 ?auto_8795 ) ) ( HAVE_IMAGE ?auto_8794 ?auto_8793 ) ( not ( = ?auto_8794 ?auto_8791 ) ) ( not ( = ?auto_8794 ?auto_8795 ) ) ( not ( = ?auto_8793 ?auto_8792 ) ) ( CALIBRATION_TARGET ?auto_8797 ?auto_8795 ) ( POWER_AVAIL ?auto_8796 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8794 ?auto_8793 ?auto_8791 ?auto_8792 )
      ( GET-2IMAGE-VERIFY ?auto_8791 ?auto_8792 ?auto_8794 ?auto_8793 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8807 - DIRECTION
      ?auto_8808 - MODE
      ?auto_8810 - DIRECTION
      ?auto_8809 - MODE
      ?auto_8812 - DIRECTION
      ?auto_8811 - MODE
    )
    :vars
    (
      ?auto_8815 - INSTRUMENT
      ?auto_8814 - SATELLITE
      ?auto_8813 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8815 ?auto_8814 ) ( SUPPORTS ?auto_8815 ?auto_8811 ) ( POINTING ?auto_8814 ?auto_8813 ) ( not ( = ?auto_8812 ?auto_8813 ) ) ( HAVE_IMAGE ?auto_8810 ?auto_8808 ) ( not ( = ?auto_8810 ?auto_8812 ) ) ( not ( = ?auto_8810 ?auto_8813 ) ) ( not ( = ?auto_8808 ?auto_8811 ) ) ( CALIBRATION_TARGET ?auto_8815 ?auto_8813 ) ( POWER_AVAIL ?auto_8814 ) ( HAVE_IMAGE ?auto_8807 ?auto_8808 ) ( HAVE_IMAGE ?auto_8810 ?auto_8809 ) ( not ( = ?auto_8807 ?auto_8810 ) ) ( not ( = ?auto_8807 ?auto_8812 ) ) ( not ( = ?auto_8807 ?auto_8813 ) ) ( not ( = ?auto_8808 ?auto_8809 ) ) ( not ( = ?auto_8809 ?auto_8811 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8810 ?auto_8808 ?auto_8812 ?auto_8811 )
      ( GET-3IMAGE-VERIFY ?auto_8807 ?auto_8808 ?auto_8810 ?auto_8809 ?auto_8812 ?auto_8811 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8816 - DIRECTION
      ?auto_8817 - MODE
      ?auto_8819 - DIRECTION
      ?auto_8818 - MODE
      ?auto_8821 - DIRECTION
      ?auto_8820 - MODE
    )
    :vars
    (
      ?auto_8824 - INSTRUMENT
      ?auto_8823 - SATELLITE
      ?auto_8822 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8824 ?auto_8823 ) ( SUPPORTS ?auto_8824 ?auto_8818 ) ( POINTING ?auto_8823 ?auto_8822 ) ( not ( = ?auto_8819 ?auto_8822 ) ) ( HAVE_IMAGE ?auto_8816 ?auto_8820 ) ( not ( = ?auto_8816 ?auto_8819 ) ) ( not ( = ?auto_8816 ?auto_8822 ) ) ( not ( = ?auto_8820 ?auto_8818 ) ) ( CALIBRATION_TARGET ?auto_8824 ?auto_8822 ) ( POWER_AVAIL ?auto_8823 ) ( HAVE_IMAGE ?auto_8816 ?auto_8817 ) ( HAVE_IMAGE ?auto_8821 ?auto_8820 ) ( not ( = ?auto_8816 ?auto_8821 ) ) ( not ( = ?auto_8817 ?auto_8818 ) ) ( not ( = ?auto_8817 ?auto_8820 ) ) ( not ( = ?auto_8819 ?auto_8821 ) ) ( not ( = ?auto_8821 ?auto_8822 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8816 ?auto_8820 ?auto_8819 ?auto_8818 )
      ( GET-3IMAGE-VERIFY ?auto_8816 ?auto_8817 ?auto_8819 ?auto_8818 ?auto_8821 ?auto_8820 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8834 - DIRECTION
      ?auto_8835 - MODE
      ?auto_8837 - DIRECTION
      ?auto_8836 - MODE
      ?auto_8839 - DIRECTION
      ?auto_8838 - MODE
    )
    :vars
    (
      ?auto_8842 - INSTRUMENT
      ?auto_8841 - SATELLITE
      ?auto_8840 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8842 ?auto_8841 ) ( SUPPORTS ?auto_8842 ?auto_8835 ) ( POINTING ?auto_8841 ?auto_8840 ) ( not ( = ?auto_8834 ?auto_8840 ) ) ( HAVE_IMAGE ?auto_8837 ?auto_8836 ) ( not ( = ?auto_8837 ?auto_8834 ) ) ( not ( = ?auto_8837 ?auto_8840 ) ) ( not ( = ?auto_8836 ?auto_8835 ) ) ( CALIBRATION_TARGET ?auto_8842 ?auto_8840 ) ( POWER_AVAIL ?auto_8841 ) ( HAVE_IMAGE ?auto_8839 ?auto_8838 ) ( not ( = ?auto_8834 ?auto_8839 ) ) ( not ( = ?auto_8835 ?auto_8838 ) ) ( not ( = ?auto_8837 ?auto_8839 ) ) ( not ( = ?auto_8836 ?auto_8838 ) ) ( not ( = ?auto_8839 ?auto_8840 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8837 ?auto_8836 ?auto_8834 ?auto_8835 )
      ( GET-3IMAGE-VERIFY ?auto_8834 ?auto_8835 ?auto_8837 ?auto_8836 ?auto_8839 ?auto_8838 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8872 - DIRECTION
      ?auto_8873 - MODE
    )
    :vars
    (
      ?auto_8878 - INSTRUMENT
      ?auto_8875 - SATELLITE
      ?auto_8874 - DIRECTION
      ?auto_8877 - DIRECTION
      ?auto_8876 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_8878 ?auto_8875 ) ( SUPPORTS ?auto_8878 ?auto_8873 ) ( not ( = ?auto_8872 ?auto_8874 ) ) ( HAVE_IMAGE ?auto_8877 ?auto_8876 ) ( not ( = ?auto_8877 ?auto_8872 ) ) ( not ( = ?auto_8877 ?auto_8874 ) ) ( not ( = ?auto_8876 ?auto_8873 ) ) ( CALIBRATION_TARGET ?auto_8878 ?auto_8874 ) ( POWER_AVAIL ?auto_8875 ) ( POINTING ?auto_8875 ?auto_8877 ) )
    :subtasks
    ( ( !TURN_TO ?auto_8875 ?auto_8874 ?auto_8877 )
      ( GET-2IMAGE ?auto_8877 ?auto_8876 ?auto_8872 ?auto_8873 )
      ( GET-1IMAGE-VERIFY ?auto_8872 ?auto_8873 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8879 - DIRECTION
      ?auto_8880 - MODE
      ?auto_8882 - DIRECTION
      ?auto_8881 - MODE
    )
    :vars
    (
      ?auto_8884 - INSTRUMENT
      ?auto_8885 - SATELLITE
      ?auto_8883 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8884 ?auto_8885 ) ( SUPPORTS ?auto_8884 ?auto_8881 ) ( not ( = ?auto_8882 ?auto_8883 ) ) ( HAVE_IMAGE ?auto_8879 ?auto_8880 ) ( not ( = ?auto_8879 ?auto_8882 ) ) ( not ( = ?auto_8879 ?auto_8883 ) ) ( not ( = ?auto_8880 ?auto_8881 ) ) ( CALIBRATION_TARGET ?auto_8884 ?auto_8883 ) ( POWER_AVAIL ?auto_8885 ) ( POINTING ?auto_8885 ?auto_8879 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8882 ?auto_8881 )
      ( GET-2IMAGE-VERIFY ?auto_8879 ?auto_8880 ?auto_8882 ?auto_8881 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8886 - DIRECTION
      ?auto_8887 - MODE
      ?auto_8889 - DIRECTION
      ?auto_8888 - MODE
    )
    :vars
    (
      ?auto_8892 - INSTRUMENT
      ?auto_8890 - SATELLITE
      ?auto_8891 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8892 ?auto_8890 ) ( SUPPORTS ?auto_8892 ?auto_8887 ) ( not ( = ?auto_8886 ?auto_8891 ) ) ( HAVE_IMAGE ?auto_8889 ?auto_8888 ) ( not ( = ?auto_8889 ?auto_8886 ) ) ( not ( = ?auto_8889 ?auto_8891 ) ) ( not ( = ?auto_8888 ?auto_8887 ) ) ( CALIBRATION_TARGET ?auto_8892 ?auto_8891 ) ( POWER_AVAIL ?auto_8890 ) ( POINTING ?auto_8890 ?auto_8889 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8889 ?auto_8888 ?auto_8886 ?auto_8887 )
      ( GET-2IMAGE-VERIFY ?auto_8886 ?auto_8887 ?auto_8889 ?auto_8888 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8902 - DIRECTION
      ?auto_8903 - MODE
      ?auto_8905 - DIRECTION
      ?auto_8904 - MODE
      ?auto_8907 - DIRECTION
      ?auto_8906 - MODE
    )
    :vars
    (
      ?auto_8910 - INSTRUMENT
      ?auto_8908 - SATELLITE
      ?auto_8909 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8910 ?auto_8908 ) ( SUPPORTS ?auto_8910 ?auto_8906 ) ( not ( = ?auto_8907 ?auto_8909 ) ) ( HAVE_IMAGE ?auto_8905 ?auto_8904 ) ( not ( = ?auto_8905 ?auto_8907 ) ) ( not ( = ?auto_8905 ?auto_8909 ) ) ( not ( = ?auto_8904 ?auto_8906 ) ) ( CALIBRATION_TARGET ?auto_8910 ?auto_8909 ) ( POWER_AVAIL ?auto_8908 ) ( POINTING ?auto_8908 ?auto_8905 ) ( HAVE_IMAGE ?auto_8902 ?auto_8903 ) ( not ( = ?auto_8902 ?auto_8905 ) ) ( not ( = ?auto_8902 ?auto_8907 ) ) ( not ( = ?auto_8902 ?auto_8909 ) ) ( not ( = ?auto_8903 ?auto_8904 ) ) ( not ( = ?auto_8903 ?auto_8906 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8905 ?auto_8904 ?auto_8907 ?auto_8906 )
      ( GET-3IMAGE-VERIFY ?auto_8902 ?auto_8903 ?auto_8905 ?auto_8904 ?auto_8907 ?auto_8906 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8911 - DIRECTION
      ?auto_8912 - MODE
      ?auto_8914 - DIRECTION
      ?auto_8913 - MODE
      ?auto_8916 - DIRECTION
      ?auto_8915 - MODE
    )
    :vars
    (
      ?auto_8919 - INSTRUMENT
      ?auto_8917 - SATELLITE
      ?auto_8918 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8919 ?auto_8917 ) ( SUPPORTS ?auto_8919 ?auto_8913 ) ( not ( = ?auto_8914 ?auto_8918 ) ) ( HAVE_IMAGE ?auto_8911 ?auto_8915 ) ( not ( = ?auto_8911 ?auto_8914 ) ) ( not ( = ?auto_8911 ?auto_8918 ) ) ( not ( = ?auto_8915 ?auto_8913 ) ) ( CALIBRATION_TARGET ?auto_8919 ?auto_8918 ) ( POWER_AVAIL ?auto_8917 ) ( POINTING ?auto_8917 ?auto_8911 ) ( HAVE_IMAGE ?auto_8911 ?auto_8912 ) ( HAVE_IMAGE ?auto_8916 ?auto_8915 ) ( not ( = ?auto_8911 ?auto_8916 ) ) ( not ( = ?auto_8912 ?auto_8913 ) ) ( not ( = ?auto_8912 ?auto_8915 ) ) ( not ( = ?auto_8914 ?auto_8916 ) ) ( not ( = ?auto_8916 ?auto_8918 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8911 ?auto_8915 ?auto_8914 ?auto_8913 )
      ( GET-3IMAGE-VERIFY ?auto_8911 ?auto_8912 ?auto_8914 ?auto_8913 ?auto_8916 ?auto_8915 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_8929 - DIRECTION
      ?auto_8930 - MODE
      ?auto_8932 - DIRECTION
      ?auto_8931 - MODE
      ?auto_8934 - DIRECTION
      ?auto_8933 - MODE
    )
    :vars
    (
      ?auto_8937 - INSTRUMENT
      ?auto_8935 - SATELLITE
      ?auto_8936 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8937 ?auto_8935 ) ( SUPPORTS ?auto_8937 ?auto_8930 ) ( not ( = ?auto_8929 ?auto_8936 ) ) ( HAVE_IMAGE ?auto_8932 ?auto_8931 ) ( not ( = ?auto_8932 ?auto_8929 ) ) ( not ( = ?auto_8932 ?auto_8936 ) ) ( not ( = ?auto_8931 ?auto_8930 ) ) ( CALIBRATION_TARGET ?auto_8937 ?auto_8936 ) ( POWER_AVAIL ?auto_8935 ) ( POINTING ?auto_8935 ?auto_8932 ) ( HAVE_IMAGE ?auto_8934 ?auto_8933 ) ( not ( = ?auto_8929 ?auto_8934 ) ) ( not ( = ?auto_8930 ?auto_8933 ) ) ( not ( = ?auto_8932 ?auto_8934 ) ) ( not ( = ?auto_8931 ?auto_8933 ) ) ( not ( = ?auto_8934 ?auto_8936 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8932 ?auto_8931 ?auto_8929 ?auto_8930 )
      ( GET-3IMAGE-VERIFY ?auto_8929 ?auto_8930 ?auto_8932 ?auto_8931 ?auto_8934 ?auto_8933 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8967 - DIRECTION
      ?auto_8968 - MODE
    )
    :vars
    (
      ?auto_8973 - INSTRUMENT
      ?auto_8969 - SATELLITE
      ?auto_8972 - DIRECTION
      ?auto_8970 - DIRECTION
      ?auto_8971 - MODE
      ?auto_8974 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_8973 ?auto_8969 ) ( SUPPORTS ?auto_8973 ?auto_8968 ) ( not ( = ?auto_8967 ?auto_8972 ) ) ( HAVE_IMAGE ?auto_8970 ?auto_8971 ) ( not ( = ?auto_8970 ?auto_8967 ) ) ( not ( = ?auto_8970 ?auto_8972 ) ) ( not ( = ?auto_8971 ?auto_8968 ) ) ( CALIBRATION_TARGET ?auto_8973 ?auto_8972 ) ( POINTING ?auto_8969 ?auto_8970 ) ( ON_BOARD ?auto_8974 ?auto_8969 ) ( POWER_ON ?auto_8974 ) ( not ( = ?auto_8973 ?auto_8974 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_8974 ?auto_8969 )
      ( GET-2IMAGE ?auto_8970 ?auto_8971 ?auto_8967 ?auto_8968 )
      ( GET-1IMAGE-VERIFY ?auto_8967 ?auto_8968 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8975 - DIRECTION
      ?auto_8976 - MODE
      ?auto_8978 - DIRECTION
      ?auto_8977 - MODE
    )
    :vars
    (
      ?auto_8980 - INSTRUMENT
      ?auto_8982 - SATELLITE
      ?auto_8981 - DIRECTION
      ?auto_8979 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_8980 ?auto_8982 ) ( SUPPORTS ?auto_8980 ?auto_8977 ) ( not ( = ?auto_8978 ?auto_8981 ) ) ( HAVE_IMAGE ?auto_8975 ?auto_8976 ) ( not ( = ?auto_8975 ?auto_8978 ) ) ( not ( = ?auto_8975 ?auto_8981 ) ) ( not ( = ?auto_8976 ?auto_8977 ) ) ( CALIBRATION_TARGET ?auto_8980 ?auto_8981 ) ( POINTING ?auto_8982 ?auto_8975 ) ( ON_BOARD ?auto_8979 ?auto_8982 ) ( POWER_ON ?auto_8979 ) ( not ( = ?auto_8980 ?auto_8979 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8978 ?auto_8977 )
      ( GET-2IMAGE-VERIFY ?auto_8975 ?auto_8976 ?auto_8978 ?auto_8977 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_8983 - DIRECTION
      ?auto_8984 - MODE
      ?auto_8986 - DIRECTION
      ?auto_8985 - MODE
    )
    :vars
    (
      ?auto_8987 - INSTRUMENT
      ?auto_8988 - SATELLITE
      ?auto_8990 - DIRECTION
      ?auto_8989 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_8987 ?auto_8988 ) ( SUPPORTS ?auto_8987 ?auto_8984 ) ( not ( = ?auto_8983 ?auto_8990 ) ) ( HAVE_IMAGE ?auto_8986 ?auto_8985 ) ( not ( = ?auto_8986 ?auto_8983 ) ) ( not ( = ?auto_8986 ?auto_8990 ) ) ( not ( = ?auto_8985 ?auto_8984 ) ) ( CALIBRATION_TARGET ?auto_8987 ?auto_8990 ) ( POINTING ?auto_8988 ?auto_8986 ) ( ON_BOARD ?auto_8989 ?auto_8988 ) ( POWER_ON ?auto_8989 ) ( not ( = ?auto_8987 ?auto_8989 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8986 ?auto_8985 ?auto_8983 ?auto_8984 )
      ( GET-2IMAGE-VERIFY ?auto_8983 ?auto_8984 ?auto_8986 ?auto_8985 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9001 - DIRECTION
      ?auto_9002 - MODE
      ?auto_9004 - DIRECTION
      ?auto_9003 - MODE
      ?auto_9006 - DIRECTION
      ?auto_9005 - MODE
    )
    :vars
    (
      ?auto_9007 - INSTRUMENT
      ?auto_9008 - SATELLITE
      ?auto_9010 - DIRECTION
      ?auto_9009 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_9007 ?auto_9008 ) ( SUPPORTS ?auto_9007 ?auto_9005 ) ( not ( = ?auto_9006 ?auto_9010 ) ) ( HAVE_IMAGE ?auto_9004 ?auto_9003 ) ( not ( = ?auto_9004 ?auto_9006 ) ) ( not ( = ?auto_9004 ?auto_9010 ) ) ( not ( = ?auto_9003 ?auto_9005 ) ) ( CALIBRATION_TARGET ?auto_9007 ?auto_9010 ) ( POINTING ?auto_9008 ?auto_9004 ) ( ON_BOARD ?auto_9009 ?auto_9008 ) ( POWER_ON ?auto_9009 ) ( not ( = ?auto_9007 ?auto_9009 ) ) ( HAVE_IMAGE ?auto_9001 ?auto_9002 ) ( not ( = ?auto_9001 ?auto_9004 ) ) ( not ( = ?auto_9001 ?auto_9006 ) ) ( not ( = ?auto_9001 ?auto_9010 ) ) ( not ( = ?auto_9002 ?auto_9003 ) ) ( not ( = ?auto_9002 ?auto_9005 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9004 ?auto_9003 ?auto_9006 ?auto_9005 )
      ( GET-3IMAGE-VERIFY ?auto_9001 ?auto_9002 ?auto_9004 ?auto_9003 ?auto_9006 ?auto_9005 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9011 - DIRECTION
      ?auto_9012 - MODE
      ?auto_9014 - DIRECTION
      ?auto_9013 - MODE
      ?auto_9016 - DIRECTION
      ?auto_9015 - MODE
    )
    :vars
    (
      ?auto_9017 - INSTRUMENT
      ?auto_9018 - SATELLITE
      ?auto_9020 - DIRECTION
      ?auto_9019 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_9017 ?auto_9018 ) ( SUPPORTS ?auto_9017 ?auto_9013 ) ( not ( = ?auto_9014 ?auto_9020 ) ) ( HAVE_IMAGE ?auto_9016 ?auto_9015 ) ( not ( = ?auto_9016 ?auto_9014 ) ) ( not ( = ?auto_9016 ?auto_9020 ) ) ( not ( = ?auto_9015 ?auto_9013 ) ) ( CALIBRATION_TARGET ?auto_9017 ?auto_9020 ) ( POINTING ?auto_9018 ?auto_9016 ) ( ON_BOARD ?auto_9019 ?auto_9018 ) ( POWER_ON ?auto_9019 ) ( not ( = ?auto_9017 ?auto_9019 ) ) ( HAVE_IMAGE ?auto_9011 ?auto_9012 ) ( not ( = ?auto_9011 ?auto_9014 ) ) ( not ( = ?auto_9011 ?auto_9016 ) ) ( not ( = ?auto_9011 ?auto_9020 ) ) ( not ( = ?auto_9012 ?auto_9013 ) ) ( not ( = ?auto_9012 ?auto_9015 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9016 ?auto_9015 ?auto_9014 ?auto_9013 )
      ( GET-3IMAGE-VERIFY ?auto_9011 ?auto_9012 ?auto_9014 ?auto_9013 ?auto_9016 ?auto_9015 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9031 - DIRECTION
      ?auto_9032 - MODE
      ?auto_9034 - DIRECTION
      ?auto_9033 - MODE
      ?auto_9036 - DIRECTION
      ?auto_9035 - MODE
    )
    :vars
    (
      ?auto_9037 - INSTRUMENT
      ?auto_9038 - SATELLITE
      ?auto_9040 - DIRECTION
      ?auto_9039 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_9037 ?auto_9038 ) ( SUPPORTS ?auto_9037 ?auto_9032 ) ( not ( = ?auto_9031 ?auto_9040 ) ) ( HAVE_IMAGE ?auto_9034 ?auto_9033 ) ( not ( = ?auto_9034 ?auto_9031 ) ) ( not ( = ?auto_9034 ?auto_9040 ) ) ( not ( = ?auto_9033 ?auto_9032 ) ) ( CALIBRATION_TARGET ?auto_9037 ?auto_9040 ) ( POINTING ?auto_9038 ?auto_9034 ) ( ON_BOARD ?auto_9039 ?auto_9038 ) ( POWER_ON ?auto_9039 ) ( not ( = ?auto_9037 ?auto_9039 ) ) ( HAVE_IMAGE ?auto_9036 ?auto_9035 ) ( not ( = ?auto_9031 ?auto_9036 ) ) ( not ( = ?auto_9032 ?auto_9035 ) ) ( not ( = ?auto_9034 ?auto_9036 ) ) ( not ( = ?auto_9033 ?auto_9035 ) ) ( not ( = ?auto_9036 ?auto_9040 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9034 ?auto_9033 ?auto_9031 ?auto_9032 )
      ( GET-3IMAGE-VERIFY ?auto_9031 ?auto_9032 ?auto_9034 ?auto_9033 ?auto_9036 ?auto_9035 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_9073 - DIRECTION
      ?auto_9074 - MODE
    )
    :vars
    (
      ?auto_9075 - INSTRUMENT
      ?auto_9076 - SATELLITE
      ?auto_9080 - DIRECTION
      ?auto_9078 - DIRECTION
      ?auto_9079 - MODE
      ?auto_9077 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_9075 ?auto_9076 ) ( SUPPORTS ?auto_9075 ?auto_9074 ) ( not ( = ?auto_9073 ?auto_9080 ) ) ( not ( = ?auto_9078 ?auto_9073 ) ) ( not ( = ?auto_9078 ?auto_9080 ) ) ( not ( = ?auto_9079 ?auto_9074 ) ) ( CALIBRATION_TARGET ?auto_9075 ?auto_9080 ) ( POINTING ?auto_9076 ?auto_9078 ) ( ON_BOARD ?auto_9077 ?auto_9076 ) ( POWER_ON ?auto_9077 ) ( not ( = ?auto_9075 ?auto_9077 ) ) ( CALIBRATED ?auto_9077 ) ( SUPPORTS ?auto_9077 ?auto_9079 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9078 ?auto_9079 )
      ( GET-2IMAGE ?auto_9078 ?auto_9079 ?auto_9073 ?auto_9074 )
      ( GET-1IMAGE-VERIFY ?auto_9073 ?auto_9074 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9081 - DIRECTION
      ?auto_9082 - MODE
      ?auto_9084 - DIRECTION
      ?auto_9083 - MODE
    )
    :vars
    (
      ?auto_9087 - INSTRUMENT
      ?auto_9088 - SATELLITE
      ?auto_9085 - DIRECTION
      ?auto_9086 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_9087 ?auto_9088 ) ( SUPPORTS ?auto_9087 ?auto_9083 ) ( not ( = ?auto_9084 ?auto_9085 ) ) ( not ( = ?auto_9081 ?auto_9084 ) ) ( not ( = ?auto_9081 ?auto_9085 ) ) ( not ( = ?auto_9082 ?auto_9083 ) ) ( CALIBRATION_TARGET ?auto_9087 ?auto_9085 ) ( POINTING ?auto_9088 ?auto_9081 ) ( ON_BOARD ?auto_9086 ?auto_9088 ) ( POWER_ON ?auto_9086 ) ( not ( = ?auto_9087 ?auto_9086 ) ) ( CALIBRATED ?auto_9086 ) ( SUPPORTS ?auto_9086 ?auto_9082 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9084 ?auto_9083 )
      ( GET-2IMAGE-VERIFY ?auto_9081 ?auto_9082 ?auto_9084 ?auto_9083 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9089 - DIRECTION
      ?auto_9090 - MODE
      ?auto_9092 - DIRECTION
      ?auto_9091 - MODE
    )
    :vars
    (
      ?auto_9094 - INSTRUMENT
      ?auto_9093 - SATELLITE
      ?auto_9096 - DIRECTION
      ?auto_9095 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_9094 ?auto_9093 ) ( SUPPORTS ?auto_9094 ?auto_9090 ) ( not ( = ?auto_9089 ?auto_9096 ) ) ( not ( = ?auto_9092 ?auto_9089 ) ) ( not ( = ?auto_9092 ?auto_9096 ) ) ( not ( = ?auto_9091 ?auto_9090 ) ) ( CALIBRATION_TARGET ?auto_9094 ?auto_9096 ) ( POINTING ?auto_9093 ?auto_9092 ) ( ON_BOARD ?auto_9095 ?auto_9093 ) ( POWER_ON ?auto_9095 ) ( not ( = ?auto_9094 ?auto_9095 ) ) ( CALIBRATED ?auto_9095 ) ( SUPPORTS ?auto_9095 ?auto_9091 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9092 ?auto_9091 ?auto_9089 ?auto_9090 )
      ( GET-2IMAGE-VERIFY ?auto_9089 ?auto_9090 ?auto_9092 ?auto_9091 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_9179 - DIRECTION
      ?auto_9180 - MODE
    )
    :vars
    (
      ?auto_9184 - INSTRUMENT
      ?auto_9181 - SATELLITE
      ?auto_9186 - DIRECTION
      ?auto_9183 - DIRECTION
      ?auto_9182 - MODE
      ?auto_9185 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_9184 ?auto_9181 ) ( SUPPORTS ?auto_9184 ?auto_9180 ) ( not ( = ?auto_9179 ?auto_9186 ) ) ( not ( = ?auto_9183 ?auto_9179 ) ) ( not ( = ?auto_9183 ?auto_9186 ) ) ( not ( = ?auto_9182 ?auto_9180 ) ) ( CALIBRATION_TARGET ?auto_9184 ?auto_9186 ) ( ON_BOARD ?auto_9185 ?auto_9181 ) ( POWER_ON ?auto_9185 ) ( not ( = ?auto_9184 ?auto_9185 ) ) ( CALIBRATED ?auto_9185 ) ( SUPPORTS ?auto_9185 ?auto_9182 ) ( POINTING ?auto_9181 ?auto_9186 ) )
    :subtasks
    ( ( !TURN_TO ?auto_9181 ?auto_9183 ?auto_9186 )
      ( GET-2IMAGE ?auto_9183 ?auto_9182 ?auto_9179 ?auto_9180 )
      ( GET-1IMAGE-VERIFY ?auto_9179 ?auto_9180 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9187 - DIRECTION
      ?auto_9188 - MODE
      ?auto_9190 - DIRECTION
      ?auto_9189 - MODE
    )
    :vars
    (
      ?auto_9194 - INSTRUMENT
      ?auto_9193 - SATELLITE
      ?auto_9191 - DIRECTION
      ?auto_9192 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_9194 ?auto_9193 ) ( SUPPORTS ?auto_9194 ?auto_9189 ) ( not ( = ?auto_9190 ?auto_9191 ) ) ( not ( = ?auto_9187 ?auto_9190 ) ) ( not ( = ?auto_9187 ?auto_9191 ) ) ( not ( = ?auto_9188 ?auto_9189 ) ) ( CALIBRATION_TARGET ?auto_9194 ?auto_9191 ) ( ON_BOARD ?auto_9192 ?auto_9193 ) ( POWER_ON ?auto_9192 ) ( not ( = ?auto_9194 ?auto_9192 ) ) ( CALIBRATED ?auto_9192 ) ( SUPPORTS ?auto_9192 ?auto_9188 ) ( POINTING ?auto_9193 ?auto_9191 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9190 ?auto_9189 )
      ( GET-2IMAGE-VERIFY ?auto_9187 ?auto_9188 ?auto_9190 ?auto_9189 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9195 - DIRECTION
      ?auto_9196 - MODE
      ?auto_9198 - DIRECTION
      ?auto_9197 - MODE
    )
    :vars
    (
      ?auto_9201 - INSTRUMENT
      ?auto_9202 - SATELLITE
      ?auto_9199 - DIRECTION
      ?auto_9200 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_9201 ?auto_9202 ) ( SUPPORTS ?auto_9201 ?auto_9196 ) ( not ( = ?auto_9195 ?auto_9199 ) ) ( not ( = ?auto_9198 ?auto_9195 ) ) ( not ( = ?auto_9198 ?auto_9199 ) ) ( not ( = ?auto_9197 ?auto_9196 ) ) ( CALIBRATION_TARGET ?auto_9201 ?auto_9199 ) ( ON_BOARD ?auto_9200 ?auto_9202 ) ( POWER_ON ?auto_9200 ) ( not ( = ?auto_9201 ?auto_9200 ) ) ( CALIBRATED ?auto_9200 ) ( SUPPORTS ?auto_9200 ?auto_9197 ) ( POINTING ?auto_9202 ?auto_9199 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9198 ?auto_9197 ?auto_9195 ?auto_9196 )
      ( GET-2IMAGE-VERIFY ?auto_9195 ?auto_9196 ?auto_9198 ?auto_9197 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_9285 - DIRECTION
      ?auto_9286 - MODE
    )
    :vars
    (
      ?auto_9291 - INSTRUMENT
      ?auto_9292 - SATELLITE
      ?auto_9287 - DIRECTION
      ?auto_9288 - DIRECTION
      ?auto_9289 - MODE
      ?auto_9290 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_9291 ?auto_9292 ) ( SUPPORTS ?auto_9291 ?auto_9286 ) ( not ( = ?auto_9285 ?auto_9287 ) ) ( not ( = ?auto_9288 ?auto_9285 ) ) ( not ( = ?auto_9288 ?auto_9287 ) ) ( not ( = ?auto_9289 ?auto_9286 ) ) ( CALIBRATION_TARGET ?auto_9291 ?auto_9287 ) ( ON_BOARD ?auto_9290 ?auto_9292 ) ( POWER_ON ?auto_9290 ) ( not ( = ?auto_9291 ?auto_9290 ) ) ( SUPPORTS ?auto_9290 ?auto_9289 ) ( POINTING ?auto_9292 ?auto_9287 ) ( CALIBRATION_TARGET ?auto_9290 ?auto_9287 ) ( NOT_CALIBRATED ?auto_9290 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_9292 ?auto_9290 ?auto_9287 )
      ( GET-2IMAGE ?auto_9288 ?auto_9289 ?auto_9285 ?auto_9286 )
      ( GET-1IMAGE-VERIFY ?auto_9285 ?auto_9286 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9293 - DIRECTION
      ?auto_9294 - MODE
      ?auto_9296 - DIRECTION
      ?auto_9295 - MODE
    )
    :vars
    (
      ?auto_9299 - INSTRUMENT
      ?auto_9300 - SATELLITE
      ?auto_9298 - DIRECTION
      ?auto_9297 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_9299 ?auto_9300 ) ( SUPPORTS ?auto_9299 ?auto_9295 ) ( not ( = ?auto_9296 ?auto_9298 ) ) ( not ( = ?auto_9293 ?auto_9296 ) ) ( not ( = ?auto_9293 ?auto_9298 ) ) ( not ( = ?auto_9294 ?auto_9295 ) ) ( CALIBRATION_TARGET ?auto_9299 ?auto_9298 ) ( ON_BOARD ?auto_9297 ?auto_9300 ) ( POWER_ON ?auto_9297 ) ( not ( = ?auto_9299 ?auto_9297 ) ) ( SUPPORTS ?auto_9297 ?auto_9294 ) ( POINTING ?auto_9300 ?auto_9298 ) ( CALIBRATION_TARGET ?auto_9297 ?auto_9298 ) ( NOT_CALIBRATED ?auto_9297 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9296 ?auto_9295 )
      ( GET-2IMAGE-VERIFY ?auto_9293 ?auto_9294 ?auto_9296 ?auto_9295 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9301 - DIRECTION
      ?auto_9302 - MODE
      ?auto_9304 - DIRECTION
      ?auto_9303 - MODE
    )
    :vars
    (
      ?auto_9307 - INSTRUMENT
      ?auto_9305 - SATELLITE
      ?auto_9308 - DIRECTION
      ?auto_9306 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_9307 ?auto_9305 ) ( SUPPORTS ?auto_9307 ?auto_9302 ) ( not ( = ?auto_9301 ?auto_9308 ) ) ( not ( = ?auto_9304 ?auto_9301 ) ) ( not ( = ?auto_9304 ?auto_9308 ) ) ( not ( = ?auto_9303 ?auto_9302 ) ) ( CALIBRATION_TARGET ?auto_9307 ?auto_9308 ) ( ON_BOARD ?auto_9306 ?auto_9305 ) ( POWER_ON ?auto_9306 ) ( not ( = ?auto_9307 ?auto_9306 ) ) ( SUPPORTS ?auto_9306 ?auto_9303 ) ( POINTING ?auto_9305 ?auto_9308 ) ( CALIBRATION_TARGET ?auto_9306 ?auto_9308 ) ( NOT_CALIBRATED ?auto_9306 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9304 ?auto_9303 ?auto_9301 ?auto_9302 )
      ( GET-2IMAGE-VERIFY ?auto_9301 ?auto_9302 ?auto_9304 ?auto_9303 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_9391 - DIRECTION
      ?auto_9392 - MODE
    )
    :vars
    (
      ?auto_9397 - INSTRUMENT
      ?auto_9395 - SATELLITE
      ?auto_9398 - DIRECTION
      ?auto_9394 - DIRECTION
      ?auto_9393 - MODE
      ?auto_9396 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_9397 ?auto_9395 ) ( SUPPORTS ?auto_9397 ?auto_9392 ) ( not ( = ?auto_9391 ?auto_9398 ) ) ( not ( = ?auto_9394 ?auto_9391 ) ) ( not ( = ?auto_9394 ?auto_9398 ) ) ( not ( = ?auto_9393 ?auto_9392 ) ) ( CALIBRATION_TARGET ?auto_9397 ?auto_9398 ) ( ON_BOARD ?auto_9396 ?auto_9395 ) ( not ( = ?auto_9397 ?auto_9396 ) ) ( SUPPORTS ?auto_9396 ?auto_9393 ) ( POINTING ?auto_9395 ?auto_9398 ) ( CALIBRATION_TARGET ?auto_9396 ?auto_9398 ) ( POWER_AVAIL ?auto_9395 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_9396 ?auto_9395 )
      ( GET-2IMAGE ?auto_9394 ?auto_9393 ?auto_9391 ?auto_9392 )
      ( GET-1IMAGE-VERIFY ?auto_9391 ?auto_9392 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9399 - DIRECTION
      ?auto_9400 - MODE
      ?auto_9402 - DIRECTION
      ?auto_9401 - MODE
    )
    :vars
    (
      ?auto_9404 - INSTRUMENT
      ?auto_9405 - SATELLITE
      ?auto_9406 - DIRECTION
      ?auto_9403 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_9404 ?auto_9405 ) ( SUPPORTS ?auto_9404 ?auto_9401 ) ( not ( = ?auto_9402 ?auto_9406 ) ) ( not ( = ?auto_9399 ?auto_9402 ) ) ( not ( = ?auto_9399 ?auto_9406 ) ) ( not ( = ?auto_9400 ?auto_9401 ) ) ( CALIBRATION_TARGET ?auto_9404 ?auto_9406 ) ( ON_BOARD ?auto_9403 ?auto_9405 ) ( not ( = ?auto_9404 ?auto_9403 ) ) ( SUPPORTS ?auto_9403 ?auto_9400 ) ( POINTING ?auto_9405 ?auto_9406 ) ( CALIBRATION_TARGET ?auto_9403 ?auto_9406 ) ( POWER_AVAIL ?auto_9405 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9402 ?auto_9401 )
      ( GET-2IMAGE-VERIFY ?auto_9399 ?auto_9400 ?auto_9402 ?auto_9401 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9407 - DIRECTION
      ?auto_9408 - MODE
      ?auto_9410 - DIRECTION
      ?auto_9409 - MODE
    )
    :vars
    (
      ?auto_9411 - INSTRUMENT
      ?auto_9412 - SATELLITE
      ?auto_9413 - DIRECTION
      ?auto_9414 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_9411 ?auto_9412 ) ( SUPPORTS ?auto_9411 ?auto_9408 ) ( not ( = ?auto_9407 ?auto_9413 ) ) ( not ( = ?auto_9410 ?auto_9407 ) ) ( not ( = ?auto_9410 ?auto_9413 ) ) ( not ( = ?auto_9409 ?auto_9408 ) ) ( CALIBRATION_TARGET ?auto_9411 ?auto_9413 ) ( ON_BOARD ?auto_9414 ?auto_9412 ) ( not ( = ?auto_9411 ?auto_9414 ) ) ( SUPPORTS ?auto_9414 ?auto_9409 ) ( POINTING ?auto_9412 ?auto_9413 ) ( CALIBRATION_TARGET ?auto_9414 ?auto_9413 ) ( POWER_AVAIL ?auto_9412 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9410 ?auto_9409 ?auto_9407 ?auto_9408 )
      ( GET-2IMAGE-VERIFY ?auto_9407 ?auto_9408 ?auto_9410 ?auto_9409 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_9497 - DIRECTION
      ?auto_9498 - MODE
    )
    :vars
    (
      ?auto_9501 - INSTRUMENT
      ?auto_9502 - SATELLITE
      ?auto_9503 - DIRECTION
      ?auto_9500 - DIRECTION
      ?auto_9499 - MODE
      ?auto_9504 - INSTRUMENT
      ?auto_9505 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_9501 ?auto_9502 ) ( SUPPORTS ?auto_9501 ?auto_9498 ) ( not ( = ?auto_9497 ?auto_9503 ) ) ( not ( = ?auto_9500 ?auto_9497 ) ) ( not ( = ?auto_9500 ?auto_9503 ) ) ( not ( = ?auto_9499 ?auto_9498 ) ) ( CALIBRATION_TARGET ?auto_9501 ?auto_9503 ) ( ON_BOARD ?auto_9504 ?auto_9502 ) ( not ( = ?auto_9501 ?auto_9504 ) ) ( SUPPORTS ?auto_9504 ?auto_9499 ) ( CALIBRATION_TARGET ?auto_9504 ?auto_9503 ) ( POWER_AVAIL ?auto_9502 ) ( POINTING ?auto_9502 ?auto_9505 ) ( not ( = ?auto_9503 ?auto_9505 ) ) ( not ( = ?auto_9497 ?auto_9505 ) ) ( not ( = ?auto_9500 ?auto_9505 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_9502 ?auto_9503 ?auto_9505 )
      ( GET-2IMAGE ?auto_9500 ?auto_9499 ?auto_9497 ?auto_9498 )
      ( GET-1IMAGE-VERIFY ?auto_9497 ?auto_9498 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9506 - DIRECTION
      ?auto_9507 - MODE
      ?auto_9509 - DIRECTION
      ?auto_9508 - MODE
    )
    :vars
    (
      ?auto_9511 - INSTRUMENT
      ?auto_9512 - SATELLITE
      ?auto_9514 - DIRECTION
      ?auto_9510 - INSTRUMENT
      ?auto_9513 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_9511 ?auto_9512 ) ( SUPPORTS ?auto_9511 ?auto_9508 ) ( not ( = ?auto_9509 ?auto_9514 ) ) ( not ( = ?auto_9506 ?auto_9509 ) ) ( not ( = ?auto_9506 ?auto_9514 ) ) ( not ( = ?auto_9507 ?auto_9508 ) ) ( CALIBRATION_TARGET ?auto_9511 ?auto_9514 ) ( ON_BOARD ?auto_9510 ?auto_9512 ) ( not ( = ?auto_9511 ?auto_9510 ) ) ( SUPPORTS ?auto_9510 ?auto_9507 ) ( CALIBRATION_TARGET ?auto_9510 ?auto_9514 ) ( POWER_AVAIL ?auto_9512 ) ( POINTING ?auto_9512 ?auto_9513 ) ( not ( = ?auto_9514 ?auto_9513 ) ) ( not ( = ?auto_9509 ?auto_9513 ) ) ( not ( = ?auto_9506 ?auto_9513 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9509 ?auto_9508 )
      ( GET-2IMAGE-VERIFY ?auto_9506 ?auto_9507 ?auto_9509 ?auto_9508 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9515 - DIRECTION
      ?auto_9516 - MODE
      ?auto_9518 - DIRECTION
      ?auto_9517 - MODE
    )
    :vars
    (
      ?auto_9520 - INSTRUMENT
      ?auto_9522 - SATELLITE
      ?auto_9521 - DIRECTION
      ?auto_9519 - INSTRUMENT
      ?auto_9523 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_9520 ?auto_9522 ) ( SUPPORTS ?auto_9520 ?auto_9516 ) ( not ( = ?auto_9515 ?auto_9521 ) ) ( not ( = ?auto_9518 ?auto_9515 ) ) ( not ( = ?auto_9518 ?auto_9521 ) ) ( not ( = ?auto_9517 ?auto_9516 ) ) ( CALIBRATION_TARGET ?auto_9520 ?auto_9521 ) ( ON_BOARD ?auto_9519 ?auto_9522 ) ( not ( = ?auto_9520 ?auto_9519 ) ) ( SUPPORTS ?auto_9519 ?auto_9517 ) ( CALIBRATION_TARGET ?auto_9519 ?auto_9521 ) ( POWER_AVAIL ?auto_9522 ) ( POINTING ?auto_9522 ?auto_9523 ) ( not ( = ?auto_9521 ?auto_9523 ) ) ( not ( = ?auto_9515 ?auto_9523 ) ) ( not ( = ?auto_9518 ?auto_9523 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9518 ?auto_9517 ?auto_9515 ?auto_9516 )
      ( GET-2IMAGE-VERIFY ?auto_9515 ?auto_9516 ?auto_9518 ?auto_9517 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_9750 - DIRECTION
      ?auto_9751 - MODE
    )
    :vars
    (
      ?auto_9752 - INSTRUMENT
      ?auto_9753 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_9752 ) ( ON_BOARD ?auto_9752 ?auto_9753 ) ( SUPPORTS ?auto_9752 ?auto_9751 ) ( POWER_ON ?auto_9752 ) ( POINTING ?auto_9753 ?auto_9750 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_9753 ?auto_9750 ?auto_9752 ?auto_9751 )
      ( GET-1IMAGE-VERIFY ?auto_9750 ?auto_9751 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9754 - DIRECTION
      ?auto_9755 - MODE
      ?auto_9757 - DIRECTION
      ?auto_9756 - MODE
    )
    :vars
    (
      ?auto_9759 - INSTRUMENT
      ?auto_9758 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_9759 ) ( ON_BOARD ?auto_9759 ?auto_9758 ) ( SUPPORTS ?auto_9759 ?auto_9756 ) ( POWER_ON ?auto_9759 ) ( POINTING ?auto_9758 ?auto_9757 ) ( HAVE_IMAGE ?auto_9754 ?auto_9755 ) ( not ( = ?auto_9754 ?auto_9757 ) ) ( not ( = ?auto_9755 ?auto_9756 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9757 ?auto_9756 )
      ( GET-2IMAGE-VERIFY ?auto_9754 ?auto_9755 ?auto_9757 ?auto_9756 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9760 - DIRECTION
      ?auto_9761 - MODE
      ?auto_9763 - DIRECTION
      ?auto_9762 - MODE
    )
    :vars
    (
      ?auto_9765 - INSTRUMENT
      ?auto_9764 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_9765 ) ( ON_BOARD ?auto_9765 ?auto_9764 ) ( SUPPORTS ?auto_9765 ?auto_9762 ) ( POWER_ON ?auto_9765 ) ( POINTING ?auto_9764 ?auto_9763 ) ( HAVE_IMAGE ?auto_9760 ?auto_9761 ) ( not ( = ?auto_9760 ?auto_9763 ) ) ( not ( = ?auto_9761 ?auto_9762 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9763 ?auto_9762 )
      ( GET-2IMAGE-VERIFY ?auto_9760 ?auto_9761 ?auto_9763 ?auto_9762 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9766 - DIRECTION
      ?auto_9767 - MODE
      ?auto_9769 - DIRECTION
      ?auto_9768 - MODE
    )
    :vars
    (
      ?auto_9771 - INSTRUMENT
      ?auto_9770 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_9771 ) ( ON_BOARD ?auto_9771 ?auto_9770 ) ( SUPPORTS ?auto_9771 ?auto_9767 ) ( POWER_ON ?auto_9771 ) ( POINTING ?auto_9770 ?auto_9766 ) ( HAVE_IMAGE ?auto_9769 ?auto_9768 ) ( not ( = ?auto_9766 ?auto_9769 ) ) ( not ( = ?auto_9767 ?auto_9768 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9766 ?auto_9767 )
      ( GET-2IMAGE-VERIFY ?auto_9766 ?auto_9767 ?auto_9769 ?auto_9768 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9772 - DIRECTION
      ?auto_9773 - MODE
      ?auto_9775 - DIRECTION
      ?auto_9774 - MODE
    )
    :vars
    (
      ?auto_9777 - INSTRUMENT
      ?auto_9776 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_9777 ) ( ON_BOARD ?auto_9777 ?auto_9776 ) ( SUPPORTS ?auto_9777 ?auto_9773 ) ( POWER_ON ?auto_9777 ) ( POINTING ?auto_9776 ?auto_9772 ) ( HAVE_IMAGE ?auto_9775 ?auto_9774 ) ( not ( = ?auto_9772 ?auto_9775 ) ) ( not ( = ?auto_9773 ?auto_9774 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9772 ?auto_9773 )
      ( GET-2IMAGE-VERIFY ?auto_9772 ?auto_9773 ?auto_9775 ?auto_9774 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9784 - DIRECTION
      ?auto_9785 - MODE
      ?auto_9787 - DIRECTION
      ?auto_9786 - MODE
      ?auto_9789 - DIRECTION
      ?auto_9788 - MODE
    )
    :vars
    (
      ?auto_9791 - INSTRUMENT
      ?auto_9790 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_9791 ) ( ON_BOARD ?auto_9791 ?auto_9790 ) ( SUPPORTS ?auto_9791 ?auto_9788 ) ( POWER_ON ?auto_9791 ) ( POINTING ?auto_9790 ?auto_9789 ) ( HAVE_IMAGE ?auto_9784 ?auto_9785 ) ( HAVE_IMAGE ?auto_9787 ?auto_9786 ) ( not ( = ?auto_9784 ?auto_9787 ) ) ( not ( = ?auto_9784 ?auto_9789 ) ) ( not ( = ?auto_9785 ?auto_9786 ) ) ( not ( = ?auto_9785 ?auto_9788 ) ) ( not ( = ?auto_9787 ?auto_9789 ) ) ( not ( = ?auto_9786 ?auto_9788 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9789 ?auto_9788 )
      ( GET-3IMAGE-VERIFY ?auto_9784 ?auto_9785 ?auto_9787 ?auto_9786 ?auto_9789 ?auto_9788 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9792 - DIRECTION
      ?auto_9793 - MODE
      ?auto_9795 - DIRECTION
      ?auto_9794 - MODE
      ?auto_9797 - DIRECTION
      ?auto_9796 - MODE
    )
    :vars
    (
      ?auto_9799 - INSTRUMENT
      ?auto_9798 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_9799 ) ( ON_BOARD ?auto_9799 ?auto_9798 ) ( SUPPORTS ?auto_9799 ?auto_9796 ) ( POWER_ON ?auto_9799 ) ( POINTING ?auto_9798 ?auto_9797 ) ( HAVE_IMAGE ?auto_9792 ?auto_9793 ) ( HAVE_IMAGE ?auto_9795 ?auto_9794 ) ( not ( = ?auto_9792 ?auto_9795 ) ) ( not ( = ?auto_9792 ?auto_9797 ) ) ( not ( = ?auto_9793 ?auto_9794 ) ) ( not ( = ?auto_9793 ?auto_9796 ) ) ( not ( = ?auto_9795 ?auto_9797 ) ) ( not ( = ?auto_9794 ?auto_9796 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9797 ?auto_9796 )
      ( GET-3IMAGE-VERIFY ?auto_9792 ?auto_9793 ?auto_9795 ?auto_9794 ?auto_9797 ?auto_9796 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9800 - DIRECTION
      ?auto_9801 - MODE
      ?auto_9803 - DIRECTION
      ?auto_9802 - MODE
      ?auto_9805 - DIRECTION
      ?auto_9804 - MODE
    )
    :vars
    (
      ?auto_9807 - INSTRUMENT
      ?auto_9806 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_9807 ) ( ON_BOARD ?auto_9807 ?auto_9806 ) ( SUPPORTS ?auto_9807 ?auto_9802 ) ( POWER_ON ?auto_9807 ) ( POINTING ?auto_9806 ?auto_9803 ) ( HAVE_IMAGE ?auto_9800 ?auto_9801 ) ( HAVE_IMAGE ?auto_9805 ?auto_9804 ) ( not ( = ?auto_9800 ?auto_9803 ) ) ( not ( = ?auto_9800 ?auto_9805 ) ) ( not ( = ?auto_9801 ?auto_9802 ) ) ( not ( = ?auto_9801 ?auto_9804 ) ) ( not ( = ?auto_9803 ?auto_9805 ) ) ( not ( = ?auto_9802 ?auto_9804 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9803 ?auto_9802 )
      ( GET-3IMAGE-VERIFY ?auto_9800 ?auto_9801 ?auto_9803 ?auto_9802 ?auto_9805 ?auto_9804 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9808 - DIRECTION
      ?auto_9809 - MODE
      ?auto_9811 - DIRECTION
      ?auto_9810 - MODE
      ?auto_9813 - DIRECTION
      ?auto_9812 - MODE
    )
    :vars
    (
      ?auto_9815 - INSTRUMENT
      ?auto_9814 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_9815 ) ( ON_BOARD ?auto_9815 ?auto_9814 ) ( SUPPORTS ?auto_9815 ?auto_9810 ) ( POWER_ON ?auto_9815 ) ( POINTING ?auto_9814 ?auto_9811 ) ( HAVE_IMAGE ?auto_9808 ?auto_9809 ) ( HAVE_IMAGE ?auto_9813 ?auto_9812 ) ( not ( = ?auto_9808 ?auto_9811 ) ) ( not ( = ?auto_9808 ?auto_9813 ) ) ( not ( = ?auto_9809 ?auto_9810 ) ) ( not ( = ?auto_9809 ?auto_9812 ) ) ( not ( = ?auto_9811 ?auto_9813 ) ) ( not ( = ?auto_9810 ?auto_9812 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9811 ?auto_9810 )
      ( GET-3IMAGE-VERIFY ?auto_9808 ?auto_9809 ?auto_9811 ?auto_9810 ?auto_9813 ?auto_9812 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9824 - DIRECTION
      ?auto_9825 - MODE
      ?auto_9827 - DIRECTION
      ?auto_9826 - MODE
      ?auto_9829 - DIRECTION
      ?auto_9828 - MODE
    )
    :vars
    (
      ?auto_9831 - INSTRUMENT
      ?auto_9830 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_9831 ) ( ON_BOARD ?auto_9831 ?auto_9830 ) ( SUPPORTS ?auto_9831 ?auto_9828 ) ( POWER_ON ?auto_9831 ) ( POINTING ?auto_9830 ?auto_9829 ) ( HAVE_IMAGE ?auto_9824 ?auto_9825 ) ( HAVE_IMAGE ?auto_9827 ?auto_9826 ) ( not ( = ?auto_9824 ?auto_9827 ) ) ( not ( = ?auto_9824 ?auto_9829 ) ) ( not ( = ?auto_9825 ?auto_9826 ) ) ( not ( = ?auto_9825 ?auto_9828 ) ) ( not ( = ?auto_9827 ?auto_9829 ) ) ( not ( = ?auto_9826 ?auto_9828 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9829 ?auto_9828 )
      ( GET-3IMAGE-VERIFY ?auto_9824 ?auto_9825 ?auto_9827 ?auto_9826 ?auto_9829 ?auto_9828 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9832 - DIRECTION
      ?auto_9833 - MODE
      ?auto_9835 - DIRECTION
      ?auto_9834 - MODE
      ?auto_9837 - DIRECTION
      ?auto_9836 - MODE
    )
    :vars
    (
      ?auto_9839 - INSTRUMENT
      ?auto_9838 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_9839 ) ( ON_BOARD ?auto_9839 ?auto_9838 ) ( SUPPORTS ?auto_9839 ?auto_9836 ) ( POWER_ON ?auto_9839 ) ( POINTING ?auto_9838 ?auto_9837 ) ( HAVE_IMAGE ?auto_9832 ?auto_9833 ) ( HAVE_IMAGE ?auto_9835 ?auto_9834 ) ( not ( = ?auto_9832 ?auto_9835 ) ) ( not ( = ?auto_9832 ?auto_9837 ) ) ( not ( = ?auto_9833 ?auto_9834 ) ) ( not ( = ?auto_9833 ?auto_9836 ) ) ( not ( = ?auto_9835 ?auto_9837 ) ) ( not ( = ?auto_9834 ?auto_9836 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9837 ?auto_9836 )
      ( GET-3IMAGE-VERIFY ?auto_9832 ?auto_9833 ?auto_9835 ?auto_9834 ?auto_9837 ?auto_9836 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9840 - DIRECTION
      ?auto_9841 - MODE
      ?auto_9843 - DIRECTION
      ?auto_9842 - MODE
      ?auto_9845 - DIRECTION
      ?auto_9844 - MODE
    )
    :vars
    (
      ?auto_9847 - INSTRUMENT
      ?auto_9846 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_9847 ) ( ON_BOARD ?auto_9847 ?auto_9846 ) ( SUPPORTS ?auto_9847 ?auto_9842 ) ( POWER_ON ?auto_9847 ) ( POINTING ?auto_9846 ?auto_9843 ) ( HAVE_IMAGE ?auto_9840 ?auto_9841 ) ( HAVE_IMAGE ?auto_9845 ?auto_9844 ) ( not ( = ?auto_9840 ?auto_9843 ) ) ( not ( = ?auto_9840 ?auto_9845 ) ) ( not ( = ?auto_9841 ?auto_9842 ) ) ( not ( = ?auto_9841 ?auto_9844 ) ) ( not ( = ?auto_9843 ?auto_9845 ) ) ( not ( = ?auto_9842 ?auto_9844 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9843 ?auto_9842 )
      ( GET-3IMAGE-VERIFY ?auto_9840 ?auto_9841 ?auto_9843 ?auto_9842 ?auto_9845 ?auto_9844 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9848 - DIRECTION
      ?auto_9849 - MODE
      ?auto_9851 - DIRECTION
      ?auto_9850 - MODE
      ?auto_9853 - DIRECTION
      ?auto_9852 - MODE
    )
    :vars
    (
      ?auto_9855 - INSTRUMENT
      ?auto_9854 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_9855 ) ( ON_BOARD ?auto_9855 ?auto_9854 ) ( SUPPORTS ?auto_9855 ?auto_9850 ) ( POWER_ON ?auto_9855 ) ( POINTING ?auto_9854 ?auto_9851 ) ( HAVE_IMAGE ?auto_9848 ?auto_9849 ) ( HAVE_IMAGE ?auto_9853 ?auto_9852 ) ( not ( = ?auto_9848 ?auto_9851 ) ) ( not ( = ?auto_9848 ?auto_9853 ) ) ( not ( = ?auto_9849 ?auto_9850 ) ) ( not ( = ?auto_9849 ?auto_9852 ) ) ( not ( = ?auto_9851 ?auto_9853 ) ) ( not ( = ?auto_9850 ?auto_9852 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9851 ?auto_9850 )
      ( GET-3IMAGE-VERIFY ?auto_9848 ?auto_9849 ?auto_9851 ?auto_9850 ?auto_9853 ?auto_9852 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9864 - DIRECTION
      ?auto_9865 - MODE
      ?auto_9867 - DIRECTION
      ?auto_9866 - MODE
      ?auto_9869 - DIRECTION
      ?auto_9868 - MODE
    )
    :vars
    (
      ?auto_9871 - INSTRUMENT
      ?auto_9870 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_9871 ) ( ON_BOARD ?auto_9871 ?auto_9870 ) ( SUPPORTS ?auto_9871 ?auto_9865 ) ( POWER_ON ?auto_9871 ) ( POINTING ?auto_9870 ?auto_9864 ) ( HAVE_IMAGE ?auto_9867 ?auto_9866 ) ( HAVE_IMAGE ?auto_9869 ?auto_9868 ) ( not ( = ?auto_9864 ?auto_9867 ) ) ( not ( = ?auto_9864 ?auto_9869 ) ) ( not ( = ?auto_9865 ?auto_9866 ) ) ( not ( = ?auto_9865 ?auto_9868 ) ) ( not ( = ?auto_9867 ?auto_9869 ) ) ( not ( = ?auto_9866 ?auto_9868 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9864 ?auto_9865 )
      ( GET-3IMAGE-VERIFY ?auto_9864 ?auto_9865 ?auto_9867 ?auto_9866 ?auto_9869 ?auto_9868 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9872 - DIRECTION
      ?auto_9873 - MODE
      ?auto_9875 - DIRECTION
      ?auto_9874 - MODE
      ?auto_9877 - DIRECTION
      ?auto_9876 - MODE
    )
    :vars
    (
      ?auto_9879 - INSTRUMENT
      ?auto_9878 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_9879 ) ( ON_BOARD ?auto_9879 ?auto_9878 ) ( SUPPORTS ?auto_9879 ?auto_9873 ) ( POWER_ON ?auto_9879 ) ( POINTING ?auto_9878 ?auto_9872 ) ( HAVE_IMAGE ?auto_9875 ?auto_9874 ) ( HAVE_IMAGE ?auto_9877 ?auto_9876 ) ( not ( = ?auto_9872 ?auto_9875 ) ) ( not ( = ?auto_9872 ?auto_9877 ) ) ( not ( = ?auto_9873 ?auto_9874 ) ) ( not ( = ?auto_9873 ?auto_9876 ) ) ( not ( = ?auto_9875 ?auto_9877 ) ) ( not ( = ?auto_9874 ?auto_9876 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9872 ?auto_9873 )
      ( GET-3IMAGE-VERIFY ?auto_9872 ?auto_9873 ?auto_9875 ?auto_9874 ?auto_9877 ?auto_9876 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9888 - DIRECTION
      ?auto_9889 - MODE
      ?auto_9891 - DIRECTION
      ?auto_9890 - MODE
      ?auto_9893 - DIRECTION
      ?auto_9892 - MODE
    )
    :vars
    (
      ?auto_9895 - INSTRUMENT
      ?auto_9894 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_9895 ) ( ON_BOARD ?auto_9895 ?auto_9894 ) ( SUPPORTS ?auto_9895 ?auto_9889 ) ( POWER_ON ?auto_9895 ) ( POINTING ?auto_9894 ?auto_9888 ) ( HAVE_IMAGE ?auto_9891 ?auto_9890 ) ( HAVE_IMAGE ?auto_9893 ?auto_9892 ) ( not ( = ?auto_9888 ?auto_9891 ) ) ( not ( = ?auto_9888 ?auto_9893 ) ) ( not ( = ?auto_9889 ?auto_9890 ) ) ( not ( = ?auto_9889 ?auto_9892 ) ) ( not ( = ?auto_9891 ?auto_9893 ) ) ( not ( = ?auto_9890 ?auto_9892 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9888 ?auto_9889 )
      ( GET-3IMAGE-VERIFY ?auto_9888 ?auto_9889 ?auto_9891 ?auto_9890 ?auto_9893 ?auto_9892 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9896 - DIRECTION
      ?auto_9897 - MODE
      ?auto_9899 - DIRECTION
      ?auto_9898 - MODE
      ?auto_9901 - DIRECTION
      ?auto_9900 - MODE
    )
    :vars
    (
      ?auto_9903 - INSTRUMENT
      ?auto_9902 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_9903 ) ( ON_BOARD ?auto_9903 ?auto_9902 ) ( SUPPORTS ?auto_9903 ?auto_9897 ) ( POWER_ON ?auto_9903 ) ( POINTING ?auto_9902 ?auto_9896 ) ( HAVE_IMAGE ?auto_9899 ?auto_9898 ) ( HAVE_IMAGE ?auto_9901 ?auto_9900 ) ( not ( = ?auto_9896 ?auto_9899 ) ) ( not ( = ?auto_9896 ?auto_9901 ) ) ( not ( = ?auto_9897 ?auto_9898 ) ) ( not ( = ?auto_9897 ?auto_9900 ) ) ( not ( = ?auto_9899 ?auto_9901 ) ) ( not ( = ?auto_9898 ?auto_9900 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9896 ?auto_9897 )
      ( GET-3IMAGE-VERIFY ?auto_9896 ?auto_9897 ?auto_9899 ?auto_9898 ?auto_9901 ?auto_9900 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_9936 - DIRECTION
      ?auto_9937 - MODE
    )
    :vars
    (
      ?auto_9939 - INSTRUMENT
      ?auto_9938 - SATELLITE
      ?auto_9940 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_9939 ) ( ON_BOARD ?auto_9939 ?auto_9938 ) ( SUPPORTS ?auto_9939 ?auto_9937 ) ( POWER_ON ?auto_9939 ) ( POINTING ?auto_9938 ?auto_9940 ) ( not ( = ?auto_9936 ?auto_9940 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_9938 ?auto_9936 ?auto_9940 )
      ( GET-1IMAGE ?auto_9936 ?auto_9937 )
      ( GET-1IMAGE-VERIFY ?auto_9936 ?auto_9937 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9941 - DIRECTION
      ?auto_9942 - MODE
      ?auto_9944 - DIRECTION
      ?auto_9943 - MODE
    )
    :vars
    (
      ?auto_9946 - INSTRUMENT
      ?auto_9945 - SATELLITE
      ?auto_9947 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_9946 ) ( ON_BOARD ?auto_9946 ?auto_9945 ) ( SUPPORTS ?auto_9946 ?auto_9943 ) ( POWER_ON ?auto_9946 ) ( POINTING ?auto_9945 ?auto_9947 ) ( not ( = ?auto_9944 ?auto_9947 ) ) ( HAVE_IMAGE ?auto_9941 ?auto_9942 ) ( not ( = ?auto_9941 ?auto_9944 ) ) ( not ( = ?auto_9941 ?auto_9947 ) ) ( not ( = ?auto_9942 ?auto_9943 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9944 ?auto_9943 )
      ( GET-2IMAGE-VERIFY ?auto_9941 ?auto_9942 ?auto_9944 ?auto_9943 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9948 - DIRECTION
      ?auto_9949 - MODE
      ?auto_9951 - DIRECTION
      ?auto_9950 - MODE
    )
    :vars
    (
      ?auto_9954 - INSTRUMENT
      ?auto_9953 - SATELLITE
      ?auto_9955 - DIRECTION
      ?auto_9952 - DIRECTION
      ?auto_9956 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_9954 ) ( ON_BOARD ?auto_9954 ?auto_9953 ) ( SUPPORTS ?auto_9954 ?auto_9950 ) ( POWER_ON ?auto_9954 ) ( POINTING ?auto_9953 ?auto_9955 ) ( not ( = ?auto_9951 ?auto_9955 ) ) ( HAVE_IMAGE ?auto_9952 ?auto_9956 ) ( not ( = ?auto_9952 ?auto_9951 ) ) ( not ( = ?auto_9952 ?auto_9955 ) ) ( not ( = ?auto_9956 ?auto_9950 ) ) ( HAVE_IMAGE ?auto_9948 ?auto_9949 ) ( not ( = ?auto_9948 ?auto_9951 ) ) ( not ( = ?auto_9948 ?auto_9955 ) ) ( not ( = ?auto_9948 ?auto_9952 ) ) ( not ( = ?auto_9949 ?auto_9950 ) ) ( not ( = ?auto_9949 ?auto_9956 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9952 ?auto_9956 ?auto_9951 ?auto_9950 )
      ( GET-2IMAGE-VERIFY ?auto_9948 ?auto_9949 ?auto_9951 ?auto_9950 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9957 - DIRECTION
      ?auto_9958 - MODE
      ?auto_9960 - DIRECTION
      ?auto_9959 - MODE
    )
    :vars
    (
      ?auto_9962 - INSTRUMENT
      ?auto_9961 - SATELLITE
      ?auto_9963 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_9962 ) ( ON_BOARD ?auto_9962 ?auto_9961 ) ( SUPPORTS ?auto_9962 ?auto_9958 ) ( POWER_ON ?auto_9962 ) ( POINTING ?auto_9961 ?auto_9963 ) ( not ( = ?auto_9957 ?auto_9963 ) ) ( HAVE_IMAGE ?auto_9960 ?auto_9959 ) ( not ( = ?auto_9960 ?auto_9957 ) ) ( not ( = ?auto_9960 ?auto_9963 ) ) ( not ( = ?auto_9959 ?auto_9958 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9960 ?auto_9959 ?auto_9957 ?auto_9958 )
      ( GET-2IMAGE-VERIFY ?auto_9957 ?auto_9958 ?auto_9960 ?auto_9959 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_9964 - DIRECTION
      ?auto_9965 - MODE
      ?auto_9967 - DIRECTION
      ?auto_9966 - MODE
    )
    :vars
    (
      ?auto_9970 - INSTRUMENT
      ?auto_9969 - SATELLITE
      ?auto_9971 - DIRECTION
      ?auto_9968 - DIRECTION
      ?auto_9972 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_9970 ) ( ON_BOARD ?auto_9970 ?auto_9969 ) ( SUPPORTS ?auto_9970 ?auto_9965 ) ( POWER_ON ?auto_9970 ) ( POINTING ?auto_9969 ?auto_9971 ) ( not ( = ?auto_9964 ?auto_9971 ) ) ( HAVE_IMAGE ?auto_9968 ?auto_9972 ) ( not ( = ?auto_9968 ?auto_9964 ) ) ( not ( = ?auto_9968 ?auto_9971 ) ) ( not ( = ?auto_9972 ?auto_9965 ) ) ( HAVE_IMAGE ?auto_9967 ?auto_9966 ) ( not ( = ?auto_9964 ?auto_9967 ) ) ( not ( = ?auto_9965 ?auto_9966 ) ) ( not ( = ?auto_9967 ?auto_9971 ) ) ( not ( = ?auto_9967 ?auto_9968 ) ) ( not ( = ?auto_9966 ?auto_9972 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9968 ?auto_9972 ?auto_9964 ?auto_9965 )
      ( GET-2IMAGE-VERIFY ?auto_9964 ?auto_9965 ?auto_9967 ?auto_9966 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9982 - DIRECTION
      ?auto_9983 - MODE
      ?auto_9985 - DIRECTION
      ?auto_9984 - MODE
      ?auto_9987 - DIRECTION
      ?auto_9986 - MODE
    )
    :vars
    (
      ?auto_9989 - INSTRUMENT
      ?auto_9988 - SATELLITE
      ?auto_9990 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_9989 ) ( ON_BOARD ?auto_9989 ?auto_9988 ) ( SUPPORTS ?auto_9989 ?auto_9986 ) ( POWER_ON ?auto_9989 ) ( POINTING ?auto_9988 ?auto_9990 ) ( not ( = ?auto_9987 ?auto_9990 ) ) ( HAVE_IMAGE ?auto_9985 ?auto_9983 ) ( not ( = ?auto_9985 ?auto_9987 ) ) ( not ( = ?auto_9985 ?auto_9990 ) ) ( not ( = ?auto_9983 ?auto_9986 ) ) ( HAVE_IMAGE ?auto_9982 ?auto_9983 ) ( HAVE_IMAGE ?auto_9985 ?auto_9984 ) ( not ( = ?auto_9982 ?auto_9985 ) ) ( not ( = ?auto_9982 ?auto_9987 ) ) ( not ( = ?auto_9982 ?auto_9990 ) ) ( not ( = ?auto_9983 ?auto_9984 ) ) ( not ( = ?auto_9984 ?auto_9986 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9985 ?auto_9983 ?auto_9987 ?auto_9986 )
      ( GET-3IMAGE-VERIFY ?auto_9982 ?auto_9983 ?auto_9985 ?auto_9984 ?auto_9987 ?auto_9986 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_9991 - DIRECTION
      ?auto_9992 - MODE
      ?auto_9994 - DIRECTION
      ?auto_9993 - MODE
      ?auto_9996 - DIRECTION
      ?auto_9995 - MODE
    )
    :vars
    (
      ?auto_9998 - INSTRUMENT
      ?auto_9997 - SATELLITE
      ?auto_9999 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_9998 ) ( ON_BOARD ?auto_9998 ?auto_9997 ) ( SUPPORTS ?auto_9998 ?auto_9995 ) ( POWER_ON ?auto_9998 ) ( POINTING ?auto_9997 ?auto_9999 ) ( not ( = ?auto_9996 ?auto_9999 ) ) ( HAVE_IMAGE ?auto_9991 ?auto_9992 ) ( not ( = ?auto_9991 ?auto_9996 ) ) ( not ( = ?auto_9991 ?auto_9999 ) ) ( not ( = ?auto_9992 ?auto_9995 ) ) ( HAVE_IMAGE ?auto_9994 ?auto_9993 ) ( not ( = ?auto_9991 ?auto_9994 ) ) ( not ( = ?auto_9992 ?auto_9993 ) ) ( not ( = ?auto_9994 ?auto_9996 ) ) ( not ( = ?auto_9994 ?auto_9999 ) ) ( not ( = ?auto_9993 ?auto_9995 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9991 ?auto_9992 ?auto_9996 ?auto_9995 )
      ( GET-3IMAGE-VERIFY ?auto_9991 ?auto_9992 ?auto_9994 ?auto_9993 ?auto_9996 ?auto_9995 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10000 - DIRECTION
      ?auto_10001 - MODE
      ?auto_10003 - DIRECTION
      ?auto_10002 - MODE
      ?auto_10005 - DIRECTION
      ?auto_10004 - MODE
    )
    :vars
    (
      ?auto_10007 - INSTRUMENT
      ?auto_10006 - SATELLITE
      ?auto_10008 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_10007 ) ( ON_BOARD ?auto_10007 ?auto_10006 ) ( SUPPORTS ?auto_10007 ?auto_10002 ) ( POWER_ON ?auto_10007 ) ( POINTING ?auto_10006 ?auto_10008 ) ( not ( = ?auto_10003 ?auto_10008 ) ) ( HAVE_IMAGE ?auto_10005 ?auto_10004 ) ( not ( = ?auto_10005 ?auto_10003 ) ) ( not ( = ?auto_10005 ?auto_10008 ) ) ( not ( = ?auto_10004 ?auto_10002 ) ) ( HAVE_IMAGE ?auto_10000 ?auto_10001 ) ( not ( = ?auto_10000 ?auto_10003 ) ) ( not ( = ?auto_10000 ?auto_10005 ) ) ( not ( = ?auto_10000 ?auto_10008 ) ) ( not ( = ?auto_10001 ?auto_10002 ) ) ( not ( = ?auto_10001 ?auto_10004 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10005 ?auto_10004 ?auto_10003 ?auto_10002 )
      ( GET-3IMAGE-VERIFY ?auto_10000 ?auto_10001 ?auto_10003 ?auto_10002 ?auto_10005 ?auto_10004 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10009 - DIRECTION
      ?auto_10010 - MODE
      ?auto_10012 - DIRECTION
      ?auto_10011 - MODE
      ?auto_10014 - DIRECTION
      ?auto_10013 - MODE
    )
    :vars
    (
      ?auto_10016 - INSTRUMENT
      ?auto_10015 - SATELLITE
      ?auto_10017 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_10016 ) ( ON_BOARD ?auto_10016 ?auto_10015 ) ( SUPPORTS ?auto_10016 ?auto_10011 ) ( POWER_ON ?auto_10016 ) ( POINTING ?auto_10015 ?auto_10017 ) ( not ( = ?auto_10012 ?auto_10017 ) ) ( HAVE_IMAGE ?auto_10009 ?auto_10010 ) ( not ( = ?auto_10009 ?auto_10012 ) ) ( not ( = ?auto_10009 ?auto_10017 ) ) ( not ( = ?auto_10010 ?auto_10011 ) ) ( HAVE_IMAGE ?auto_10014 ?auto_10013 ) ( not ( = ?auto_10009 ?auto_10014 ) ) ( not ( = ?auto_10010 ?auto_10013 ) ) ( not ( = ?auto_10012 ?auto_10014 ) ) ( not ( = ?auto_10011 ?auto_10013 ) ) ( not ( = ?auto_10014 ?auto_10017 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10009 ?auto_10010 ?auto_10012 ?auto_10011 )
      ( GET-3IMAGE-VERIFY ?auto_10009 ?auto_10010 ?auto_10012 ?auto_10011 ?auto_10014 ?auto_10013 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10027 - DIRECTION
      ?auto_10028 - MODE
      ?auto_10030 - DIRECTION
      ?auto_10029 - MODE
      ?auto_10032 - DIRECTION
      ?auto_10031 - MODE
    )
    :vars
    (
      ?auto_10034 - INSTRUMENT
      ?auto_10033 - SATELLITE
      ?auto_10035 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_10034 ) ( ON_BOARD ?auto_10034 ?auto_10033 ) ( SUPPORTS ?auto_10034 ?auto_10031 ) ( POWER_ON ?auto_10034 ) ( POINTING ?auto_10033 ?auto_10035 ) ( not ( = ?auto_10032 ?auto_10035 ) ) ( HAVE_IMAGE ?auto_10030 ?auto_10029 ) ( not ( = ?auto_10030 ?auto_10032 ) ) ( not ( = ?auto_10030 ?auto_10035 ) ) ( not ( = ?auto_10029 ?auto_10031 ) ) ( HAVE_IMAGE ?auto_10027 ?auto_10028 ) ( not ( = ?auto_10027 ?auto_10030 ) ) ( not ( = ?auto_10027 ?auto_10032 ) ) ( not ( = ?auto_10027 ?auto_10035 ) ) ( not ( = ?auto_10028 ?auto_10029 ) ) ( not ( = ?auto_10028 ?auto_10031 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10030 ?auto_10029 ?auto_10032 ?auto_10031 )
      ( GET-3IMAGE-VERIFY ?auto_10027 ?auto_10028 ?auto_10030 ?auto_10029 ?auto_10032 ?auto_10031 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10036 - DIRECTION
      ?auto_10037 - MODE
      ?auto_10039 - DIRECTION
      ?auto_10038 - MODE
      ?auto_10041 - DIRECTION
      ?auto_10040 - MODE
    )
    :vars
    (
      ?auto_10044 - INSTRUMENT
      ?auto_10043 - SATELLITE
      ?auto_10045 - DIRECTION
      ?auto_10042 - DIRECTION
      ?auto_10046 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_10044 ) ( ON_BOARD ?auto_10044 ?auto_10043 ) ( SUPPORTS ?auto_10044 ?auto_10040 ) ( POWER_ON ?auto_10044 ) ( POINTING ?auto_10043 ?auto_10045 ) ( not ( = ?auto_10041 ?auto_10045 ) ) ( HAVE_IMAGE ?auto_10042 ?auto_10046 ) ( not ( = ?auto_10042 ?auto_10041 ) ) ( not ( = ?auto_10042 ?auto_10045 ) ) ( not ( = ?auto_10046 ?auto_10040 ) ) ( HAVE_IMAGE ?auto_10036 ?auto_10037 ) ( HAVE_IMAGE ?auto_10039 ?auto_10038 ) ( not ( = ?auto_10036 ?auto_10039 ) ) ( not ( = ?auto_10036 ?auto_10041 ) ) ( not ( = ?auto_10036 ?auto_10045 ) ) ( not ( = ?auto_10036 ?auto_10042 ) ) ( not ( = ?auto_10037 ?auto_10038 ) ) ( not ( = ?auto_10037 ?auto_10040 ) ) ( not ( = ?auto_10037 ?auto_10046 ) ) ( not ( = ?auto_10039 ?auto_10041 ) ) ( not ( = ?auto_10039 ?auto_10045 ) ) ( not ( = ?auto_10039 ?auto_10042 ) ) ( not ( = ?auto_10038 ?auto_10040 ) ) ( not ( = ?auto_10038 ?auto_10046 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10042 ?auto_10046 ?auto_10041 ?auto_10040 )
      ( GET-3IMAGE-VERIFY ?auto_10036 ?auto_10037 ?auto_10039 ?auto_10038 ?auto_10041 ?auto_10040 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10047 - DIRECTION
      ?auto_10048 - MODE
      ?auto_10050 - DIRECTION
      ?auto_10049 - MODE
      ?auto_10052 - DIRECTION
      ?auto_10051 - MODE
    )
    :vars
    (
      ?auto_10054 - INSTRUMENT
      ?auto_10053 - SATELLITE
      ?auto_10055 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_10054 ) ( ON_BOARD ?auto_10054 ?auto_10053 ) ( SUPPORTS ?auto_10054 ?auto_10049 ) ( POWER_ON ?auto_10054 ) ( POINTING ?auto_10053 ?auto_10055 ) ( not ( = ?auto_10050 ?auto_10055 ) ) ( HAVE_IMAGE ?auto_10052 ?auto_10051 ) ( not ( = ?auto_10052 ?auto_10050 ) ) ( not ( = ?auto_10052 ?auto_10055 ) ) ( not ( = ?auto_10051 ?auto_10049 ) ) ( HAVE_IMAGE ?auto_10047 ?auto_10048 ) ( not ( = ?auto_10047 ?auto_10050 ) ) ( not ( = ?auto_10047 ?auto_10052 ) ) ( not ( = ?auto_10047 ?auto_10055 ) ) ( not ( = ?auto_10048 ?auto_10049 ) ) ( not ( = ?auto_10048 ?auto_10051 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10052 ?auto_10051 ?auto_10050 ?auto_10049 )
      ( GET-3IMAGE-VERIFY ?auto_10047 ?auto_10048 ?auto_10050 ?auto_10049 ?auto_10052 ?auto_10051 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10056 - DIRECTION
      ?auto_10057 - MODE
      ?auto_10059 - DIRECTION
      ?auto_10058 - MODE
      ?auto_10061 - DIRECTION
      ?auto_10060 - MODE
    )
    :vars
    (
      ?auto_10064 - INSTRUMENT
      ?auto_10063 - SATELLITE
      ?auto_10065 - DIRECTION
      ?auto_10062 - DIRECTION
      ?auto_10066 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_10064 ) ( ON_BOARD ?auto_10064 ?auto_10063 ) ( SUPPORTS ?auto_10064 ?auto_10058 ) ( POWER_ON ?auto_10064 ) ( POINTING ?auto_10063 ?auto_10065 ) ( not ( = ?auto_10059 ?auto_10065 ) ) ( HAVE_IMAGE ?auto_10062 ?auto_10066 ) ( not ( = ?auto_10062 ?auto_10059 ) ) ( not ( = ?auto_10062 ?auto_10065 ) ) ( not ( = ?auto_10066 ?auto_10058 ) ) ( HAVE_IMAGE ?auto_10056 ?auto_10057 ) ( HAVE_IMAGE ?auto_10061 ?auto_10060 ) ( not ( = ?auto_10056 ?auto_10059 ) ) ( not ( = ?auto_10056 ?auto_10061 ) ) ( not ( = ?auto_10056 ?auto_10065 ) ) ( not ( = ?auto_10056 ?auto_10062 ) ) ( not ( = ?auto_10057 ?auto_10058 ) ) ( not ( = ?auto_10057 ?auto_10060 ) ) ( not ( = ?auto_10057 ?auto_10066 ) ) ( not ( = ?auto_10059 ?auto_10061 ) ) ( not ( = ?auto_10058 ?auto_10060 ) ) ( not ( = ?auto_10061 ?auto_10065 ) ) ( not ( = ?auto_10061 ?auto_10062 ) ) ( not ( = ?auto_10060 ?auto_10066 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10062 ?auto_10066 ?auto_10059 ?auto_10058 )
      ( GET-3IMAGE-VERIFY ?auto_10056 ?auto_10057 ?auto_10059 ?auto_10058 ?auto_10061 ?auto_10060 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10078 - DIRECTION
      ?auto_10079 - MODE
      ?auto_10081 - DIRECTION
      ?auto_10080 - MODE
      ?auto_10083 - DIRECTION
      ?auto_10082 - MODE
    )
    :vars
    (
      ?auto_10085 - INSTRUMENT
      ?auto_10084 - SATELLITE
      ?auto_10086 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_10085 ) ( ON_BOARD ?auto_10085 ?auto_10084 ) ( SUPPORTS ?auto_10085 ?auto_10079 ) ( POWER_ON ?auto_10085 ) ( POINTING ?auto_10084 ?auto_10086 ) ( not ( = ?auto_10078 ?auto_10086 ) ) ( HAVE_IMAGE ?auto_10081 ?auto_10080 ) ( not ( = ?auto_10081 ?auto_10078 ) ) ( not ( = ?auto_10081 ?auto_10086 ) ) ( not ( = ?auto_10080 ?auto_10079 ) ) ( HAVE_IMAGE ?auto_10083 ?auto_10082 ) ( not ( = ?auto_10078 ?auto_10083 ) ) ( not ( = ?auto_10079 ?auto_10082 ) ) ( not ( = ?auto_10081 ?auto_10083 ) ) ( not ( = ?auto_10080 ?auto_10082 ) ) ( not ( = ?auto_10083 ?auto_10086 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10081 ?auto_10080 ?auto_10078 ?auto_10079 )
      ( GET-3IMAGE-VERIFY ?auto_10078 ?auto_10079 ?auto_10081 ?auto_10080 ?auto_10083 ?auto_10082 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10087 - DIRECTION
      ?auto_10088 - MODE
      ?auto_10090 - DIRECTION
      ?auto_10089 - MODE
      ?auto_10092 - DIRECTION
      ?auto_10091 - MODE
    )
    :vars
    (
      ?auto_10094 - INSTRUMENT
      ?auto_10093 - SATELLITE
      ?auto_10095 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_10094 ) ( ON_BOARD ?auto_10094 ?auto_10093 ) ( SUPPORTS ?auto_10094 ?auto_10088 ) ( POWER_ON ?auto_10094 ) ( POINTING ?auto_10093 ?auto_10095 ) ( not ( = ?auto_10087 ?auto_10095 ) ) ( HAVE_IMAGE ?auto_10090 ?auto_10089 ) ( not ( = ?auto_10090 ?auto_10087 ) ) ( not ( = ?auto_10090 ?auto_10095 ) ) ( not ( = ?auto_10089 ?auto_10088 ) ) ( HAVE_IMAGE ?auto_10092 ?auto_10091 ) ( not ( = ?auto_10087 ?auto_10092 ) ) ( not ( = ?auto_10088 ?auto_10091 ) ) ( not ( = ?auto_10090 ?auto_10092 ) ) ( not ( = ?auto_10089 ?auto_10091 ) ) ( not ( = ?auto_10092 ?auto_10095 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10090 ?auto_10089 ?auto_10087 ?auto_10088 )
      ( GET-3IMAGE-VERIFY ?auto_10087 ?auto_10088 ?auto_10090 ?auto_10089 ?auto_10092 ?auto_10091 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10105 - DIRECTION
      ?auto_10106 - MODE
      ?auto_10108 - DIRECTION
      ?auto_10107 - MODE
      ?auto_10110 - DIRECTION
      ?auto_10109 - MODE
    )
    :vars
    (
      ?auto_10112 - INSTRUMENT
      ?auto_10111 - SATELLITE
      ?auto_10113 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_10112 ) ( ON_BOARD ?auto_10112 ?auto_10111 ) ( SUPPORTS ?auto_10112 ?auto_10106 ) ( POWER_ON ?auto_10112 ) ( POINTING ?auto_10111 ?auto_10113 ) ( not ( = ?auto_10105 ?auto_10113 ) ) ( HAVE_IMAGE ?auto_10110 ?auto_10109 ) ( not ( = ?auto_10110 ?auto_10105 ) ) ( not ( = ?auto_10110 ?auto_10113 ) ) ( not ( = ?auto_10109 ?auto_10106 ) ) ( HAVE_IMAGE ?auto_10108 ?auto_10107 ) ( not ( = ?auto_10105 ?auto_10108 ) ) ( not ( = ?auto_10106 ?auto_10107 ) ) ( not ( = ?auto_10108 ?auto_10110 ) ) ( not ( = ?auto_10108 ?auto_10113 ) ) ( not ( = ?auto_10107 ?auto_10109 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10110 ?auto_10109 ?auto_10105 ?auto_10106 )
      ( GET-3IMAGE-VERIFY ?auto_10105 ?auto_10106 ?auto_10108 ?auto_10107 ?auto_10110 ?auto_10109 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10114 - DIRECTION
      ?auto_10115 - MODE
      ?auto_10117 - DIRECTION
      ?auto_10116 - MODE
      ?auto_10119 - DIRECTION
      ?auto_10118 - MODE
    )
    :vars
    (
      ?auto_10122 - INSTRUMENT
      ?auto_10121 - SATELLITE
      ?auto_10123 - DIRECTION
      ?auto_10120 - DIRECTION
      ?auto_10124 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_10122 ) ( ON_BOARD ?auto_10122 ?auto_10121 ) ( SUPPORTS ?auto_10122 ?auto_10115 ) ( POWER_ON ?auto_10122 ) ( POINTING ?auto_10121 ?auto_10123 ) ( not ( = ?auto_10114 ?auto_10123 ) ) ( HAVE_IMAGE ?auto_10120 ?auto_10124 ) ( not ( = ?auto_10120 ?auto_10114 ) ) ( not ( = ?auto_10120 ?auto_10123 ) ) ( not ( = ?auto_10124 ?auto_10115 ) ) ( HAVE_IMAGE ?auto_10117 ?auto_10116 ) ( HAVE_IMAGE ?auto_10119 ?auto_10118 ) ( not ( = ?auto_10114 ?auto_10117 ) ) ( not ( = ?auto_10114 ?auto_10119 ) ) ( not ( = ?auto_10115 ?auto_10116 ) ) ( not ( = ?auto_10115 ?auto_10118 ) ) ( not ( = ?auto_10117 ?auto_10119 ) ) ( not ( = ?auto_10117 ?auto_10123 ) ) ( not ( = ?auto_10117 ?auto_10120 ) ) ( not ( = ?auto_10116 ?auto_10118 ) ) ( not ( = ?auto_10116 ?auto_10124 ) ) ( not ( = ?auto_10119 ?auto_10123 ) ) ( not ( = ?auto_10119 ?auto_10120 ) ) ( not ( = ?auto_10118 ?auto_10124 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10120 ?auto_10124 ?auto_10114 ?auto_10115 )
      ( GET-3IMAGE-VERIFY ?auto_10114 ?auto_10115 ?auto_10117 ?auto_10116 ?auto_10119 ?auto_10118 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_10167 - DIRECTION
      ?auto_10168 - MODE
    )
    :vars
    (
      ?auto_10171 - INSTRUMENT
      ?auto_10170 - SATELLITE
      ?auto_10172 - DIRECTION
      ?auto_10169 - DIRECTION
      ?auto_10173 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_10171 ?auto_10170 ) ( SUPPORTS ?auto_10171 ?auto_10168 ) ( POWER_ON ?auto_10171 ) ( POINTING ?auto_10170 ?auto_10172 ) ( not ( = ?auto_10167 ?auto_10172 ) ) ( HAVE_IMAGE ?auto_10169 ?auto_10173 ) ( not ( = ?auto_10169 ?auto_10167 ) ) ( not ( = ?auto_10169 ?auto_10172 ) ) ( not ( = ?auto_10173 ?auto_10168 ) ) ( CALIBRATION_TARGET ?auto_10171 ?auto_10172 ) ( NOT_CALIBRATED ?auto_10171 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_10170 ?auto_10171 ?auto_10172 )
      ( GET-2IMAGE ?auto_10169 ?auto_10173 ?auto_10167 ?auto_10168 )
      ( GET-1IMAGE-VERIFY ?auto_10167 ?auto_10168 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_10174 - DIRECTION
      ?auto_10175 - MODE
      ?auto_10177 - DIRECTION
      ?auto_10176 - MODE
    )
    :vars
    (
      ?auto_10178 - INSTRUMENT
      ?auto_10180 - SATELLITE
      ?auto_10179 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10178 ?auto_10180 ) ( SUPPORTS ?auto_10178 ?auto_10176 ) ( POWER_ON ?auto_10178 ) ( POINTING ?auto_10180 ?auto_10179 ) ( not ( = ?auto_10177 ?auto_10179 ) ) ( HAVE_IMAGE ?auto_10174 ?auto_10175 ) ( not ( = ?auto_10174 ?auto_10177 ) ) ( not ( = ?auto_10174 ?auto_10179 ) ) ( not ( = ?auto_10175 ?auto_10176 ) ) ( CALIBRATION_TARGET ?auto_10178 ?auto_10179 ) ( NOT_CALIBRATED ?auto_10178 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_10177 ?auto_10176 )
      ( GET-2IMAGE-VERIFY ?auto_10174 ?auto_10175 ?auto_10177 ?auto_10176 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_10181 - DIRECTION
      ?auto_10182 - MODE
      ?auto_10184 - DIRECTION
      ?auto_10183 - MODE
    )
    :vars
    (
      ?auto_10188 - INSTRUMENT
      ?auto_10187 - SATELLITE
      ?auto_10189 - DIRECTION
      ?auto_10186 - DIRECTION
      ?auto_10185 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_10188 ?auto_10187 ) ( SUPPORTS ?auto_10188 ?auto_10183 ) ( POWER_ON ?auto_10188 ) ( POINTING ?auto_10187 ?auto_10189 ) ( not ( = ?auto_10184 ?auto_10189 ) ) ( HAVE_IMAGE ?auto_10186 ?auto_10185 ) ( not ( = ?auto_10186 ?auto_10184 ) ) ( not ( = ?auto_10186 ?auto_10189 ) ) ( not ( = ?auto_10185 ?auto_10183 ) ) ( CALIBRATION_TARGET ?auto_10188 ?auto_10189 ) ( NOT_CALIBRATED ?auto_10188 ) ( HAVE_IMAGE ?auto_10181 ?auto_10182 ) ( not ( = ?auto_10181 ?auto_10184 ) ) ( not ( = ?auto_10181 ?auto_10189 ) ) ( not ( = ?auto_10181 ?auto_10186 ) ) ( not ( = ?auto_10182 ?auto_10183 ) ) ( not ( = ?auto_10182 ?auto_10185 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10186 ?auto_10185 ?auto_10184 ?auto_10183 )
      ( GET-2IMAGE-VERIFY ?auto_10181 ?auto_10182 ?auto_10184 ?auto_10183 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_10190 - DIRECTION
      ?auto_10191 - MODE
      ?auto_10193 - DIRECTION
      ?auto_10192 - MODE
    )
    :vars
    (
      ?auto_10195 - INSTRUMENT
      ?auto_10194 - SATELLITE
      ?auto_10196 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10195 ?auto_10194 ) ( SUPPORTS ?auto_10195 ?auto_10191 ) ( POWER_ON ?auto_10195 ) ( POINTING ?auto_10194 ?auto_10196 ) ( not ( = ?auto_10190 ?auto_10196 ) ) ( HAVE_IMAGE ?auto_10193 ?auto_10192 ) ( not ( = ?auto_10193 ?auto_10190 ) ) ( not ( = ?auto_10193 ?auto_10196 ) ) ( not ( = ?auto_10192 ?auto_10191 ) ) ( CALIBRATION_TARGET ?auto_10195 ?auto_10196 ) ( NOT_CALIBRATED ?auto_10195 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10193 ?auto_10192 ?auto_10190 ?auto_10191 )
      ( GET-2IMAGE-VERIFY ?auto_10190 ?auto_10191 ?auto_10193 ?auto_10192 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_10197 - DIRECTION
      ?auto_10198 - MODE
      ?auto_10200 - DIRECTION
      ?auto_10199 - MODE
    )
    :vars
    (
      ?auto_10204 - INSTRUMENT
      ?auto_10203 - SATELLITE
      ?auto_10205 - DIRECTION
      ?auto_10202 - DIRECTION
      ?auto_10201 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_10204 ?auto_10203 ) ( SUPPORTS ?auto_10204 ?auto_10198 ) ( POWER_ON ?auto_10204 ) ( POINTING ?auto_10203 ?auto_10205 ) ( not ( = ?auto_10197 ?auto_10205 ) ) ( HAVE_IMAGE ?auto_10202 ?auto_10201 ) ( not ( = ?auto_10202 ?auto_10197 ) ) ( not ( = ?auto_10202 ?auto_10205 ) ) ( not ( = ?auto_10201 ?auto_10198 ) ) ( CALIBRATION_TARGET ?auto_10204 ?auto_10205 ) ( NOT_CALIBRATED ?auto_10204 ) ( HAVE_IMAGE ?auto_10200 ?auto_10199 ) ( not ( = ?auto_10197 ?auto_10200 ) ) ( not ( = ?auto_10198 ?auto_10199 ) ) ( not ( = ?auto_10200 ?auto_10205 ) ) ( not ( = ?auto_10200 ?auto_10202 ) ) ( not ( = ?auto_10199 ?auto_10201 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10202 ?auto_10201 ?auto_10197 ?auto_10198 )
      ( GET-2IMAGE-VERIFY ?auto_10197 ?auto_10198 ?auto_10200 ?auto_10199 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10215 - DIRECTION
      ?auto_10216 - MODE
      ?auto_10218 - DIRECTION
      ?auto_10217 - MODE
      ?auto_10220 - DIRECTION
      ?auto_10219 - MODE
    )
    :vars
    (
      ?auto_10222 - INSTRUMENT
      ?auto_10221 - SATELLITE
      ?auto_10223 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10222 ?auto_10221 ) ( SUPPORTS ?auto_10222 ?auto_10219 ) ( POWER_ON ?auto_10222 ) ( POINTING ?auto_10221 ?auto_10223 ) ( not ( = ?auto_10220 ?auto_10223 ) ) ( HAVE_IMAGE ?auto_10215 ?auto_10217 ) ( not ( = ?auto_10215 ?auto_10220 ) ) ( not ( = ?auto_10215 ?auto_10223 ) ) ( not ( = ?auto_10217 ?auto_10219 ) ) ( CALIBRATION_TARGET ?auto_10222 ?auto_10223 ) ( NOT_CALIBRATED ?auto_10222 ) ( HAVE_IMAGE ?auto_10215 ?auto_10216 ) ( HAVE_IMAGE ?auto_10218 ?auto_10217 ) ( not ( = ?auto_10215 ?auto_10218 ) ) ( not ( = ?auto_10216 ?auto_10217 ) ) ( not ( = ?auto_10216 ?auto_10219 ) ) ( not ( = ?auto_10218 ?auto_10220 ) ) ( not ( = ?auto_10218 ?auto_10223 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10215 ?auto_10217 ?auto_10220 ?auto_10219 )
      ( GET-3IMAGE-VERIFY ?auto_10215 ?auto_10216 ?auto_10218 ?auto_10217 ?auto_10220 ?auto_10219 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10224 - DIRECTION
      ?auto_10225 - MODE
      ?auto_10227 - DIRECTION
      ?auto_10226 - MODE
      ?auto_10229 - DIRECTION
      ?auto_10228 - MODE
    )
    :vars
    (
      ?auto_10231 - INSTRUMENT
      ?auto_10230 - SATELLITE
      ?auto_10232 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10231 ?auto_10230 ) ( SUPPORTS ?auto_10231 ?auto_10228 ) ( POWER_ON ?auto_10231 ) ( POINTING ?auto_10230 ?auto_10232 ) ( not ( = ?auto_10229 ?auto_10232 ) ) ( HAVE_IMAGE ?auto_10224 ?auto_10225 ) ( not ( = ?auto_10224 ?auto_10229 ) ) ( not ( = ?auto_10224 ?auto_10232 ) ) ( not ( = ?auto_10225 ?auto_10228 ) ) ( CALIBRATION_TARGET ?auto_10231 ?auto_10232 ) ( NOT_CALIBRATED ?auto_10231 ) ( HAVE_IMAGE ?auto_10227 ?auto_10226 ) ( not ( = ?auto_10224 ?auto_10227 ) ) ( not ( = ?auto_10225 ?auto_10226 ) ) ( not ( = ?auto_10227 ?auto_10229 ) ) ( not ( = ?auto_10227 ?auto_10232 ) ) ( not ( = ?auto_10226 ?auto_10228 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10224 ?auto_10225 ?auto_10229 ?auto_10228 )
      ( GET-3IMAGE-VERIFY ?auto_10224 ?auto_10225 ?auto_10227 ?auto_10226 ?auto_10229 ?auto_10228 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10233 - DIRECTION
      ?auto_10234 - MODE
      ?auto_10236 - DIRECTION
      ?auto_10235 - MODE
      ?auto_10238 - DIRECTION
      ?auto_10237 - MODE
    )
    :vars
    (
      ?auto_10240 - INSTRUMENT
      ?auto_10239 - SATELLITE
      ?auto_10241 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10240 ?auto_10239 ) ( SUPPORTS ?auto_10240 ?auto_10235 ) ( POWER_ON ?auto_10240 ) ( POINTING ?auto_10239 ?auto_10241 ) ( not ( = ?auto_10236 ?auto_10241 ) ) ( HAVE_IMAGE ?auto_10238 ?auto_10237 ) ( not ( = ?auto_10238 ?auto_10236 ) ) ( not ( = ?auto_10238 ?auto_10241 ) ) ( not ( = ?auto_10237 ?auto_10235 ) ) ( CALIBRATION_TARGET ?auto_10240 ?auto_10241 ) ( NOT_CALIBRATED ?auto_10240 ) ( HAVE_IMAGE ?auto_10233 ?auto_10234 ) ( not ( = ?auto_10233 ?auto_10236 ) ) ( not ( = ?auto_10233 ?auto_10238 ) ) ( not ( = ?auto_10233 ?auto_10241 ) ) ( not ( = ?auto_10234 ?auto_10235 ) ) ( not ( = ?auto_10234 ?auto_10237 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10238 ?auto_10237 ?auto_10236 ?auto_10235 )
      ( GET-3IMAGE-VERIFY ?auto_10233 ?auto_10234 ?auto_10236 ?auto_10235 ?auto_10238 ?auto_10237 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10242 - DIRECTION
      ?auto_10243 - MODE
      ?auto_10245 - DIRECTION
      ?auto_10244 - MODE
      ?auto_10247 - DIRECTION
      ?auto_10246 - MODE
    )
    :vars
    (
      ?auto_10249 - INSTRUMENT
      ?auto_10248 - SATELLITE
      ?auto_10250 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10249 ?auto_10248 ) ( SUPPORTS ?auto_10249 ?auto_10244 ) ( POWER_ON ?auto_10249 ) ( POINTING ?auto_10248 ?auto_10250 ) ( not ( = ?auto_10245 ?auto_10250 ) ) ( HAVE_IMAGE ?auto_10242 ?auto_10243 ) ( not ( = ?auto_10242 ?auto_10245 ) ) ( not ( = ?auto_10242 ?auto_10250 ) ) ( not ( = ?auto_10243 ?auto_10244 ) ) ( CALIBRATION_TARGET ?auto_10249 ?auto_10250 ) ( NOT_CALIBRATED ?auto_10249 ) ( HAVE_IMAGE ?auto_10247 ?auto_10246 ) ( not ( = ?auto_10242 ?auto_10247 ) ) ( not ( = ?auto_10243 ?auto_10246 ) ) ( not ( = ?auto_10245 ?auto_10247 ) ) ( not ( = ?auto_10244 ?auto_10246 ) ) ( not ( = ?auto_10247 ?auto_10250 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10242 ?auto_10243 ?auto_10245 ?auto_10244 )
      ( GET-3IMAGE-VERIFY ?auto_10242 ?auto_10243 ?auto_10245 ?auto_10244 ?auto_10247 ?auto_10246 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10260 - DIRECTION
      ?auto_10261 - MODE
      ?auto_10263 - DIRECTION
      ?auto_10262 - MODE
      ?auto_10265 - DIRECTION
      ?auto_10264 - MODE
    )
    :vars
    (
      ?auto_10267 - INSTRUMENT
      ?auto_10266 - SATELLITE
      ?auto_10268 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10267 ?auto_10266 ) ( SUPPORTS ?auto_10267 ?auto_10264 ) ( POWER_ON ?auto_10267 ) ( POINTING ?auto_10266 ?auto_10268 ) ( not ( = ?auto_10265 ?auto_10268 ) ) ( HAVE_IMAGE ?auto_10263 ?auto_10262 ) ( not ( = ?auto_10263 ?auto_10265 ) ) ( not ( = ?auto_10263 ?auto_10268 ) ) ( not ( = ?auto_10262 ?auto_10264 ) ) ( CALIBRATION_TARGET ?auto_10267 ?auto_10268 ) ( NOT_CALIBRATED ?auto_10267 ) ( HAVE_IMAGE ?auto_10260 ?auto_10261 ) ( not ( = ?auto_10260 ?auto_10263 ) ) ( not ( = ?auto_10260 ?auto_10265 ) ) ( not ( = ?auto_10260 ?auto_10268 ) ) ( not ( = ?auto_10261 ?auto_10262 ) ) ( not ( = ?auto_10261 ?auto_10264 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10263 ?auto_10262 ?auto_10265 ?auto_10264 )
      ( GET-3IMAGE-VERIFY ?auto_10260 ?auto_10261 ?auto_10263 ?auto_10262 ?auto_10265 ?auto_10264 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10269 - DIRECTION
      ?auto_10270 - MODE
      ?auto_10272 - DIRECTION
      ?auto_10271 - MODE
      ?auto_10274 - DIRECTION
      ?auto_10273 - MODE
    )
    :vars
    (
      ?auto_10278 - INSTRUMENT
      ?auto_10277 - SATELLITE
      ?auto_10279 - DIRECTION
      ?auto_10276 - DIRECTION
      ?auto_10275 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_10278 ?auto_10277 ) ( SUPPORTS ?auto_10278 ?auto_10273 ) ( POWER_ON ?auto_10278 ) ( POINTING ?auto_10277 ?auto_10279 ) ( not ( = ?auto_10274 ?auto_10279 ) ) ( HAVE_IMAGE ?auto_10276 ?auto_10275 ) ( not ( = ?auto_10276 ?auto_10274 ) ) ( not ( = ?auto_10276 ?auto_10279 ) ) ( not ( = ?auto_10275 ?auto_10273 ) ) ( CALIBRATION_TARGET ?auto_10278 ?auto_10279 ) ( NOT_CALIBRATED ?auto_10278 ) ( HAVE_IMAGE ?auto_10269 ?auto_10270 ) ( HAVE_IMAGE ?auto_10272 ?auto_10271 ) ( not ( = ?auto_10269 ?auto_10272 ) ) ( not ( = ?auto_10269 ?auto_10274 ) ) ( not ( = ?auto_10269 ?auto_10279 ) ) ( not ( = ?auto_10269 ?auto_10276 ) ) ( not ( = ?auto_10270 ?auto_10271 ) ) ( not ( = ?auto_10270 ?auto_10273 ) ) ( not ( = ?auto_10270 ?auto_10275 ) ) ( not ( = ?auto_10272 ?auto_10274 ) ) ( not ( = ?auto_10272 ?auto_10279 ) ) ( not ( = ?auto_10272 ?auto_10276 ) ) ( not ( = ?auto_10271 ?auto_10273 ) ) ( not ( = ?auto_10271 ?auto_10275 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10276 ?auto_10275 ?auto_10274 ?auto_10273 )
      ( GET-3IMAGE-VERIFY ?auto_10269 ?auto_10270 ?auto_10272 ?auto_10271 ?auto_10274 ?auto_10273 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10280 - DIRECTION
      ?auto_10281 - MODE
      ?auto_10283 - DIRECTION
      ?auto_10282 - MODE
      ?auto_10285 - DIRECTION
      ?auto_10284 - MODE
    )
    :vars
    (
      ?auto_10287 - INSTRUMENT
      ?auto_10286 - SATELLITE
      ?auto_10288 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10287 ?auto_10286 ) ( SUPPORTS ?auto_10287 ?auto_10282 ) ( POWER_ON ?auto_10287 ) ( POINTING ?auto_10286 ?auto_10288 ) ( not ( = ?auto_10283 ?auto_10288 ) ) ( HAVE_IMAGE ?auto_10285 ?auto_10284 ) ( not ( = ?auto_10285 ?auto_10283 ) ) ( not ( = ?auto_10285 ?auto_10288 ) ) ( not ( = ?auto_10284 ?auto_10282 ) ) ( CALIBRATION_TARGET ?auto_10287 ?auto_10288 ) ( NOT_CALIBRATED ?auto_10287 ) ( HAVE_IMAGE ?auto_10280 ?auto_10281 ) ( not ( = ?auto_10280 ?auto_10283 ) ) ( not ( = ?auto_10280 ?auto_10285 ) ) ( not ( = ?auto_10280 ?auto_10288 ) ) ( not ( = ?auto_10281 ?auto_10282 ) ) ( not ( = ?auto_10281 ?auto_10284 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10285 ?auto_10284 ?auto_10283 ?auto_10282 )
      ( GET-3IMAGE-VERIFY ?auto_10280 ?auto_10281 ?auto_10283 ?auto_10282 ?auto_10285 ?auto_10284 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10289 - DIRECTION
      ?auto_10290 - MODE
      ?auto_10292 - DIRECTION
      ?auto_10291 - MODE
      ?auto_10294 - DIRECTION
      ?auto_10293 - MODE
    )
    :vars
    (
      ?auto_10298 - INSTRUMENT
      ?auto_10297 - SATELLITE
      ?auto_10299 - DIRECTION
      ?auto_10296 - DIRECTION
      ?auto_10295 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_10298 ?auto_10297 ) ( SUPPORTS ?auto_10298 ?auto_10291 ) ( POWER_ON ?auto_10298 ) ( POINTING ?auto_10297 ?auto_10299 ) ( not ( = ?auto_10292 ?auto_10299 ) ) ( HAVE_IMAGE ?auto_10296 ?auto_10295 ) ( not ( = ?auto_10296 ?auto_10292 ) ) ( not ( = ?auto_10296 ?auto_10299 ) ) ( not ( = ?auto_10295 ?auto_10291 ) ) ( CALIBRATION_TARGET ?auto_10298 ?auto_10299 ) ( NOT_CALIBRATED ?auto_10298 ) ( HAVE_IMAGE ?auto_10289 ?auto_10290 ) ( HAVE_IMAGE ?auto_10294 ?auto_10293 ) ( not ( = ?auto_10289 ?auto_10292 ) ) ( not ( = ?auto_10289 ?auto_10294 ) ) ( not ( = ?auto_10289 ?auto_10299 ) ) ( not ( = ?auto_10289 ?auto_10296 ) ) ( not ( = ?auto_10290 ?auto_10291 ) ) ( not ( = ?auto_10290 ?auto_10293 ) ) ( not ( = ?auto_10290 ?auto_10295 ) ) ( not ( = ?auto_10292 ?auto_10294 ) ) ( not ( = ?auto_10291 ?auto_10293 ) ) ( not ( = ?auto_10294 ?auto_10299 ) ) ( not ( = ?auto_10294 ?auto_10296 ) ) ( not ( = ?auto_10293 ?auto_10295 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10296 ?auto_10295 ?auto_10292 ?auto_10291 )
      ( GET-3IMAGE-VERIFY ?auto_10289 ?auto_10290 ?auto_10292 ?auto_10291 ?auto_10294 ?auto_10293 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10311 - DIRECTION
      ?auto_10312 - MODE
      ?auto_10314 - DIRECTION
      ?auto_10313 - MODE
      ?auto_10316 - DIRECTION
      ?auto_10315 - MODE
    )
    :vars
    (
      ?auto_10318 - INSTRUMENT
      ?auto_10317 - SATELLITE
      ?auto_10319 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10318 ?auto_10317 ) ( SUPPORTS ?auto_10318 ?auto_10312 ) ( POWER_ON ?auto_10318 ) ( POINTING ?auto_10317 ?auto_10319 ) ( not ( = ?auto_10311 ?auto_10319 ) ) ( HAVE_IMAGE ?auto_10316 ?auto_10315 ) ( not ( = ?auto_10316 ?auto_10311 ) ) ( not ( = ?auto_10316 ?auto_10319 ) ) ( not ( = ?auto_10315 ?auto_10312 ) ) ( CALIBRATION_TARGET ?auto_10318 ?auto_10319 ) ( NOT_CALIBRATED ?auto_10318 ) ( HAVE_IMAGE ?auto_10314 ?auto_10313 ) ( not ( = ?auto_10311 ?auto_10314 ) ) ( not ( = ?auto_10312 ?auto_10313 ) ) ( not ( = ?auto_10314 ?auto_10316 ) ) ( not ( = ?auto_10314 ?auto_10319 ) ) ( not ( = ?auto_10313 ?auto_10315 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10316 ?auto_10315 ?auto_10311 ?auto_10312 )
      ( GET-3IMAGE-VERIFY ?auto_10311 ?auto_10312 ?auto_10314 ?auto_10313 ?auto_10316 ?auto_10315 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10320 - DIRECTION
      ?auto_10321 - MODE
      ?auto_10323 - DIRECTION
      ?auto_10322 - MODE
      ?auto_10325 - DIRECTION
      ?auto_10324 - MODE
    )
    :vars
    (
      ?auto_10327 - INSTRUMENT
      ?auto_10326 - SATELLITE
      ?auto_10328 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10327 ?auto_10326 ) ( SUPPORTS ?auto_10327 ?auto_10321 ) ( POWER_ON ?auto_10327 ) ( POINTING ?auto_10326 ?auto_10328 ) ( not ( = ?auto_10320 ?auto_10328 ) ) ( HAVE_IMAGE ?auto_10323 ?auto_10322 ) ( not ( = ?auto_10323 ?auto_10320 ) ) ( not ( = ?auto_10323 ?auto_10328 ) ) ( not ( = ?auto_10322 ?auto_10321 ) ) ( CALIBRATION_TARGET ?auto_10327 ?auto_10328 ) ( NOT_CALIBRATED ?auto_10327 ) ( HAVE_IMAGE ?auto_10325 ?auto_10324 ) ( not ( = ?auto_10320 ?auto_10325 ) ) ( not ( = ?auto_10321 ?auto_10324 ) ) ( not ( = ?auto_10323 ?auto_10325 ) ) ( not ( = ?auto_10322 ?auto_10324 ) ) ( not ( = ?auto_10325 ?auto_10328 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10323 ?auto_10322 ?auto_10320 ?auto_10321 )
      ( GET-3IMAGE-VERIFY ?auto_10320 ?auto_10321 ?auto_10323 ?auto_10322 ?auto_10325 ?auto_10324 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10338 - DIRECTION
      ?auto_10339 - MODE
      ?auto_10341 - DIRECTION
      ?auto_10340 - MODE
      ?auto_10343 - DIRECTION
      ?auto_10342 - MODE
    )
    :vars
    (
      ?auto_10345 - INSTRUMENT
      ?auto_10344 - SATELLITE
      ?auto_10346 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10345 ?auto_10344 ) ( SUPPORTS ?auto_10345 ?auto_10339 ) ( POWER_ON ?auto_10345 ) ( POINTING ?auto_10344 ?auto_10346 ) ( not ( = ?auto_10338 ?auto_10346 ) ) ( HAVE_IMAGE ?auto_10343 ?auto_10342 ) ( not ( = ?auto_10343 ?auto_10338 ) ) ( not ( = ?auto_10343 ?auto_10346 ) ) ( not ( = ?auto_10342 ?auto_10339 ) ) ( CALIBRATION_TARGET ?auto_10345 ?auto_10346 ) ( NOT_CALIBRATED ?auto_10345 ) ( HAVE_IMAGE ?auto_10341 ?auto_10340 ) ( not ( = ?auto_10338 ?auto_10341 ) ) ( not ( = ?auto_10339 ?auto_10340 ) ) ( not ( = ?auto_10341 ?auto_10343 ) ) ( not ( = ?auto_10341 ?auto_10346 ) ) ( not ( = ?auto_10340 ?auto_10342 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10343 ?auto_10342 ?auto_10338 ?auto_10339 )
      ( GET-3IMAGE-VERIFY ?auto_10338 ?auto_10339 ?auto_10341 ?auto_10340 ?auto_10343 ?auto_10342 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10347 - DIRECTION
      ?auto_10348 - MODE
      ?auto_10350 - DIRECTION
      ?auto_10349 - MODE
      ?auto_10352 - DIRECTION
      ?auto_10351 - MODE
    )
    :vars
    (
      ?auto_10356 - INSTRUMENT
      ?auto_10355 - SATELLITE
      ?auto_10357 - DIRECTION
      ?auto_10354 - DIRECTION
      ?auto_10353 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_10356 ?auto_10355 ) ( SUPPORTS ?auto_10356 ?auto_10348 ) ( POWER_ON ?auto_10356 ) ( POINTING ?auto_10355 ?auto_10357 ) ( not ( = ?auto_10347 ?auto_10357 ) ) ( HAVE_IMAGE ?auto_10354 ?auto_10353 ) ( not ( = ?auto_10354 ?auto_10347 ) ) ( not ( = ?auto_10354 ?auto_10357 ) ) ( not ( = ?auto_10353 ?auto_10348 ) ) ( CALIBRATION_TARGET ?auto_10356 ?auto_10357 ) ( NOT_CALIBRATED ?auto_10356 ) ( HAVE_IMAGE ?auto_10350 ?auto_10349 ) ( HAVE_IMAGE ?auto_10352 ?auto_10351 ) ( not ( = ?auto_10347 ?auto_10350 ) ) ( not ( = ?auto_10347 ?auto_10352 ) ) ( not ( = ?auto_10348 ?auto_10349 ) ) ( not ( = ?auto_10348 ?auto_10351 ) ) ( not ( = ?auto_10350 ?auto_10352 ) ) ( not ( = ?auto_10350 ?auto_10357 ) ) ( not ( = ?auto_10350 ?auto_10354 ) ) ( not ( = ?auto_10349 ?auto_10351 ) ) ( not ( = ?auto_10349 ?auto_10353 ) ) ( not ( = ?auto_10352 ?auto_10357 ) ) ( not ( = ?auto_10352 ?auto_10354 ) ) ( not ( = ?auto_10351 ?auto_10353 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10354 ?auto_10353 ?auto_10347 ?auto_10348 )
      ( GET-3IMAGE-VERIFY ?auto_10347 ?auto_10348 ?auto_10350 ?auto_10349 ?auto_10352 ?auto_10351 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_10400 - DIRECTION
      ?auto_10401 - MODE
    )
    :vars
    (
      ?auto_10405 - INSTRUMENT
      ?auto_10404 - SATELLITE
      ?auto_10406 - DIRECTION
      ?auto_10403 - DIRECTION
      ?auto_10402 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_10405 ?auto_10404 ) ( SUPPORTS ?auto_10405 ?auto_10401 ) ( POINTING ?auto_10404 ?auto_10406 ) ( not ( = ?auto_10400 ?auto_10406 ) ) ( HAVE_IMAGE ?auto_10403 ?auto_10402 ) ( not ( = ?auto_10403 ?auto_10400 ) ) ( not ( = ?auto_10403 ?auto_10406 ) ) ( not ( = ?auto_10402 ?auto_10401 ) ) ( CALIBRATION_TARGET ?auto_10405 ?auto_10406 ) ( POWER_AVAIL ?auto_10404 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_10405 ?auto_10404 )
      ( GET-2IMAGE ?auto_10403 ?auto_10402 ?auto_10400 ?auto_10401 )
      ( GET-1IMAGE-VERIFY ?auto_10400 ?auto_10401 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_10407 - DIRECTION
      ?auto_10408 - MODE
      ?auto_10410 - DIRECTION
      ?auto_10409 - MODE
    )
    :vars
    (
      ?auto_10411 - INSTRUMENT
      ?auto_10413 - SATELLITE
      ?auto_10412 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10411 ?auto_10413 ) ( SUPPORTS ?auto_10411 ?auto_10409 ) ( POINTING ?auto_10413 ?auto_10412 ) ( not ( = ?auto_10410 ?auto_10412 ) ) ( HAVE_IMAGE ?auto_10407 ?auto_10408 ) ( not ( = ?auto_10407 ?auto_10410 ) ) ( not ( = ?auto_10407 ?auto_10412 ) ) ( not ( = ?auto_10408 ?auto_10409 ) ) ( CALIBRATION_TARGET ?auto_10411 ?auto_10412 ) ( POWER_AVAIL ?auto_10413 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_10410 ?auto_10409 )
      ( GET-2IMAGE-VERIFY ?auto_10407 ?auto_10408 ?auto_10410 ?auto_10409 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_10414 - DIRECTION
      ?auto_10415 - MODE
      ?auto_10417 - DIRECTION
      ?auto_10416 - MODE
    )
    :vars
    (
      ?auto_10420 - INSTRUMENT
      ?auto_10421 - SATELLITE
      ?auto_10419 - DIRECTION
      ?auto_10418 - DIRECTION
      ?auto_10422 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_10420 ?auto_10421 ) ( SUPPORTS ?auto_10420 ?auto_10416 ) ( POINTING ?auto_10421 ?auto_10419 ) ( not ( = ?auto_10417 ?auto_10419 ) ) ( HAVE_IMAGE ?auto_10418 ?auto_10422 ) ( not ( = ?auto_10418 ?auto_10417 ) ) ( not ( = ?auto_10418 ?auto_10419 ) ) ( not ( = ?auto_10422 ?auto_10416 ) ) ( CALIBRATION_TARGET ?auto_10420 ?auto_10419 ) ( POWER_AVAIL ?auto_10421 ) ( HAVE_IMAGE ?auto_10414 ?auto_10415 ) ( not ( = ?auto_10414 ?auto_10417 ) ) ( not ( = ?auto_10414 ?auto_10419 ) ) ( not ( = ?auto_10414 ?auto_10418 ) ) ( not ( = ?auto_10415 ?auto_10416 ) ) ( not ( = ?auto_10415 ?auto_10422 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10418 ?auto_10422 ?auto_10417 ?auto_10416 )
      ( GET-2IMAGE-VERIFY ?auto_10414 ?auto_10415 ?auto_10417 ?auto_10416 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_10423 - DIRECTION
      ?auto_10424 - MODE
      ?auto_10426 - DIRECTION
      ?auto_10425 - MODE
    )
    :vars
    (
      ?auto_10428 - INSTRUMENT
      ?auto_10429 - SATELLITE
      ?auto_10427 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10428 ?auto_10429 ) ( SUPPORTS ?auto_10428 ?auto_10424 ) ( POINTING ?auto_10429 ?auto_10427 ) ( not ( = ?auto_10423 ?auto_10427 ) ) ( HAVE_IMAGE ?auto_10426 ?auto_10425 ) ( not ( = ?auto_10426 ?auto_10423 ) ) ( not ( = ?auto_10426 ?auto_10427 ) ) ( not ( = ?auto_10425 ?auto_10424 ) ) ( CALIBRATION_TARGET ?auto_10428 ?auto_10427 ) ( POWER_AVAIL ?auto_10429 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10426 ?auto_10425 ?auto_10423 ?auto_10424 )
      ( GET-2IMAGE-VERIFY ?auto_10423 ?auto_10424 ?auto_10426 ?auto_10425 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_10430 - DIRECTION
      ?auto_10431 - MODE
      ?auto_10433 - DIRECTION
      ?auto_10432 - MODE
    )
    :vars
    (
      ?auto_10436 - INSTRUMENT
      ?auto_10437 - SATELLITE
      ?auto_10435 - DIRECTION
      ?auto_10434 - DIRECTION
      ?auto_10438 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_10436 ?auto_10437 ) ( SUPPORTS ?auto_10436 ?auto_10431 ) ( POINTING ?auto_10437 ?auto_10435 ) ( not ( = ?auto_10430 ?auto_10435 ) ) ( HAVE_IMAGE ?auto_10434 ?auto_10438 ) ( not ( = ?auto_10434 ?auto_10430 ) ) ( not ( = ?auto_10434 ?auto_10435 ) ) ( not ( = ?auto_10438 ?auto_10431 ) ) ( CALIBRATION_TARGET ?auto_10436 ?auto_10435 ) ( POWER_AVAIL ?auto_10437 ) ( HAVE_IMAGE ?auto_10433 ?auto_10432 ) ( not ( = ?auto_10430 ?auto_10433 ) ) ( not ( = ?auto_10431 ?auto_10432 ) ) ( not ( = ?auto_10433 ?auto_10435 ) ) ( not ( = ?auto_10433 ?auto_10434 ) ) ( not ( = ?auto_10432 ?auto_10438 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10434 ?auto_10438 ?auto_10430 ?auto_10431 )
      ( GET-2IMAGE-VERIFY ?auto_10430 ?auto_10431 ?auto_10433 ?auto_10432 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10448 - DIRECTION
      ?auto_10449 - MODE
      ?auto_10451 - DIRECTION
      ?auto_10450 - MODE
      ?auto_10453 - DIRECTION
      ?auto_10452 - MODE
    )
    :vars
    (
      ?auto_10455 - INSTRUMENT
      ?auto_10456 - SATELLITE
      ?auto_10454 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10455 ?auto_10456 ) ( SUPPORTS ?auto_10455 ?auto_10452 ) ( POINTING ?auto_10456 ?auto_10454 ) ( not ( = ?auto_10453 ?auto_10454 ) ) ( HAVE_IMAGE ?auto_10448 ?auto_10449 ) ( not ( = ?auto_10448 ?auto_10453 ) ) ( not ( = ?auto_10448 ?auto_10454 ) ) ( not ( = ?auto_10449 ?auto_10452 ) ) ( CALIBRATION_TARGET ?auto_10455 ?auto_10454 ) ( POWER_AVAIL ?auto_10456 ) ( HAVE_IMAGE ?auto_10451 ?auto_10450 ) ( not ( = ?auto_10448 ?auto_10451 ) ) ( not ( = ?auto_10449 ?auto_10450 ) ) ( not ( = ?auto_10451 ?auto_10453 ) ) ( not ( = ?auto_10451 ?auto_10454 ) ) ( not ( = ?auto_10450 ?auto_10452 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10448 ?auto_10449 ?auto_10453 ?auto_10452 )
      ( GET-3IMAGE-VERIFY ?auto_10448 ?auto_10449 ?auto_10451 ?auto_10450 ?auto_10453 ?auto_10452 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10457 - DIRECTION
      ?auto_10458 - MODE
      ?auto_10460 - DIRECTION
      ?auto_10459 - MODE
      ?auto_10462 - DIRECTION
      ?auto_10461 - MODE
    )
    :vars
    (
      ?auto_10464 - INSTRUMENT
      ?auto_10465 - SATELLITE
      ?auto_10463 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10464 ?auto_10465 ) ( SUPPORTS ?auto_10464 ?auto_10461 ) ( POINTING ?auto_10465 ?auto_10463 ) ( not ( = ?auto_10462 ?auto_10463 ) ) ( HAVE_IMAGE ?auto_10457 ?auto_10458 ) ( not ( = ?auto_10457 ?auto_10462 ) ) ( not ( = ?auto_10457 ?auto_10463 ) ) ( not ( = ?auto_10458 ?auto_10461 ) ) ( CALIBRATION_TARGET ?auto_10464 ?auto_10463 ) ( POWER_AVAIL ?auto_10465 ) ( HAVE_IMAGE ?auto_10460 ?auto_10459 ) ( not ( = ?auto_10457 ?auto_10460 ) ) ( not ( = ?auto_10458 ?auto_10459 ) ) ( not ( = ?auto_10460 ?auto_10462 ) ) ( not ( = ?auto_10460 ?auto_10463 ) ) ( not ( = ?auto_10459 ?auto_10461 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10457 ?auto_10458 ?auto_10462 ?auto_10461 )
      ( GET-3IMAGE-VERIFY ?auto_10457 ?auto_10458 ?auto_10460 ?auto_10459 ?auto_10462 ?auto_10461 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10466 - DIRECTION
      ?auto_10467 - MODE
      ?auto_10469 - DIRECTION
      ?auto_10468 - MODE
      ?auto_10471 - DIRECTION
      ?auto_10470 - MODE
    )
    :vars
    (
      ?auto_10473 - INSTRUMENT
      ?auto_10474 - SATELLITE
      ?auto_10472 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10473 ?auto_10474 ) ( SUPPORTS ?auto_10473 ?auto_10468 ) ( POINTING ?auto_10474 ?auto_10472 ) ( not ( = ?auto_10469 ?auto_10472 ) ) ( HAVE_IMAGE ?auto_10471 ?auto_10470 ) ( not ( = ?auto_10471 ?auto_10469 ) ) ( not ( = ?auto_10471 ?auto_10472 ) ) ( not ( = ?auto_10470 ?auto_10468 ) ) ( CALIBRATION_TARGET ?auto_10473 ?auto_10472 ) ( POWER_AVAIL ?auto_10474 ) ( HAVE_IMAGE ?auto_10466 ?auto_10467 ) ( not ( = ?auto_10466 ?auto_10469 ) ) ( not ( = ?auto_10466 ?auto_10471 ) ) ( not ( = ?auto_10466 ?auto_10472 ) ) ( not ( = ?auto_10467 ?auto_10468 ) ) ( not ( = ?auto_10467 ?auto_10470 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10471 ?auto_10470 ?auto_10469 ?auto_10468 )
      ( GET-3IMAGE-VERIFY ?auto_10466 ?auto_10467 ?auto_10469 ?auto_10468 ?auto_10471 ?auto_10470 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10475 - DIRECTION
      ?auto_10476 - MODE
      ?auto_10478 - DIRECTION
      ?auto_10477 - MODE
      ?auto_10480 - DIRECTION
      ?auto_10479 - MODE
    )
    :vars
    (
      ?auto_10482 - INSTRUMENT
      ?auto_10483 - SATELLITE
      ?auto_10481 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10482 ?auto_10483 ) ( SUPPORTS ?auto_10482 ?auto_10477 ) ( POINTING ?auto_10483 ?auto_10481 ) ( not ( = ?auto_10478 ?auto_10481 ) ) ( HAVE_IMAGE ?auto_10475 ?auto_10476 ) ( not ( = ?auto_10475 ?auto_10478 ) ) ( not ( = ?auto_10475 ?auto_10481 ) ) ( not ( = ?auto_10476 ?auto_10477 ) ) ( CALIBRATION_TARGET ?auto_10482 ?auto_10481 ) ( POWER_AVAIL ?auto_10483 ) ( HAVE_IMAGE ?auto_10480 ?auto_10479 ) ( not ( = ?auto_10475 ?auto_10480 ) ) ( not ( = ?auto_10476 ?auto_10479 ) ) ( not ( = ?auto_10478 ?auto_10480 ) ) ( not ( = ?auto_10477 ?auto_10479 ) ) ( not ( = ?auto_10480 ?auto_10481 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10475 ?auto_10476 ?auto_10478 ?auto_10477 )
      ( GET-3IMAGE-VERIFY ?auto_10475 ?auto_10476 ?auto_10478 ?auto_10477 ?auto_10480 ?auto_10479 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10493 - DIRECTION
      ?auto_10494 - MODE
      ?auto_10496 - DIRECTION
      ?auto_10495 - MODE
      ?auto_10498 - DIRECTION
      ?auto_10497 - MODE
    )
    :vars
    (
      ?auto_10500 - INSTRUMENT
      ?auto_10501 - SATELLITE
      ?auto_10499 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10500 ?auto_10501 ) ( SUPPORTS ?auto_10500 ?auto_10497 ) ( POINTING ?auto_10501 ?auto_10499 ) ( not ( = ?auto_10498 ?auto_10499 ) ) ( HAVE_IMAGE ?auto_10496 ?auto_10495 ) ( not ( = ?auto_10496 ?auto_10498 ) ) ( not ( = ?auto_10496 ?auto_10499 ) ) ( not ( = ?auto_10495 ?auto_10497 ) ) ( CALIBRATION_TARGET ?auto_10500 ?auto_10499 ) ( POWER_AVAIL ?auto_10501 ) ( HAVE_IMAGE ?auto_10493 ?auto_10494 ) ( not ( = ?auto_10493 ?auto_10496 ) ) ( not ( = ?auto_10493 ?auto_10498 ) ) ( not ( = ?auto_10493 ?auto_10499 ) ) ( not ( = ?auto_10494 ?auto_10495 ) ) ( not ( = ?auto_10494 ?auto_10497 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10496 ?auto_10495 ?auto_10498 ?auto_10497 )
      ( GET-3IMAGE-VERIFY ?auto_10493 ?auto_10494 ?auto_10496 ?auto_10495 ?auto_10498 ?auto_10497 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10502 - DIRECTION
      ?auto_10503 - MODE
      ?auto_10505 - DIRECTION
      ?auto_10504 - MODE
      ?auto_10507 - DIRECTION
      ?auto_10506 - MODE
    )
    :vars
    (
      ?auto_10510 - INSTRUMENT
      ?auto_10511 - SATELLITE
      ?auto_10509 - DIRECTION
      ?auto_10508 - DIRECTION
      ?auto_10512 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_10510 ?auto_10511 ) ( SUPPORTS ?auto_10510 ?auto_10506 ) ( POINTING ?auto_10511 ?auto_10509 ) ( not ( = ?auto_10507 ?auto_10509 ) ) ( HAVE_IMAGE ?auto_10508 ?auto_10512 ) ( not ( = ?auto_10508 ?auto_10507 ) ) ( not ( = ?auto_10508 ?auto_10509 ) ) ( not ( = ?auto_10512 ?auto_10506 ) ) ( CALIBRATION_TARGET ?auto_10510 ?auto_10509 ) ( POWER_AVAIL ?auto_10511 ) ( HAVE_IMAGE ?auto_10502 ?auto_10503 ) ( HAVE_IMAGE ?auto_10505 ?auto_10504 ) ( not ( = ?auto_10502 ?auto_10505 ) ) ( not ( = ?auto_10502 ?auto_10507 ) ) ( not ( = ?auto_10502 ?auto_10509 ) ) ( not ( = ?auto_10502 ?auto_10508 ) ) ( not ( = ?auto_10503 ?auto_10504 ) ) ( not ( = ?auto_10503 ?auto_10506 ) ) ( not ( = ?auto_10503 ?auto_10512 ) ) ( not ( = ?auto_10505 ?auto_10507 ) ) ( not ( = ?auto_10505 ?auto_10509 ) ) ( not ( = ?auto_10505 ?auto_10508 ) ) ( not ( = ?auto_10504 ?auto_10506 ) ) ( not ( = ?auto_10504 ?auto_10512 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10508 ?auto_10512 ?auto_10507 ?auto_10506 )
      ( GET-3IMAGE-VERIFY ?auto_10502 ?auto_10503 ?auto_10505 ?auto_10504 ?auto_10507 ?auto_10506 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10513 - DIRECTION
      ?auto_10514 - MODE
      ?auto_10516 - DIRECTION
      ?auto_10515 - MODE
      ?auto_10518 - DIRECTION
      ?auto_10517 - MODE
    )
    :vars
    (
      ?auto_10520 - INSTRUMENT
      ?auto_10521 - SATELLITE
      ?auto_10519 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10520 ?auto_10521 ) ( SUPPORTS ?auto_10520 ?auto_10515 ) ( POINTING ?auto_10521 ?auto_10519 ) ( not ( = ?auto_10516 ?auto_10519 ) ) ( HAVE_IMAGE ?auto_10518 ?auto_10517 ) ( not ( = ?auto_10518 ?auto_10516 ) ) ( not ( = ?auto_10518 ?auto_10519 ) ) ( not ( = ?auto_10517 ?auto_10515 ) ) ( CALIBRATION_TARGET ?auto_10520 ?auto_10519 ) ( POWER_AVAIL ?auto_10521 ) ( HAVE_IMAGE ?auto_10513 ?auto_10514 ) ( not ( = ?auto_10513 ?auto_10516 ) ) ( not ( = ?auto_10513 ?auto_10518 ) ) ( not ( = ?auto_10513 ?auto_10519 ) ) ( not ( = ?auto_10514 ?auto_10515 ) ) ( not ( = ?auto_10514 ?auto_10517 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10518 ?auto_10517 ?auto_10516 ?auto_10515 )
      ( GET-3IMAGE-VERIFY ?auto_10513 ?auto_10514 ?auto_10516 ?auto_10515 ?auto_10518 ?auto_10517 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10522 - DIRECTION
      ?auto_10523 - MODE
      ?auto_10525 - DIRECTION
      ?auto_10524 - MODE
      ?auto_10527 - DIRECTION
      ?auto_10526 - MODE
    )
    :vars
    (
      ?auto_10530 - INSTRUMENT
      ?auto_10531 - SATELLITE
      ?auto_10529 - DIRECTION
      ?auto_10528 - DIRECTION
      ?auto_10532 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_10530 ?auto_10531 ) ( SUPPORTS ?auto_10530 ?auto_10524 ) ( POINTING ?auto_10531 ?auto_10529 ) ( not ( = ?auto_10525 ?auto_10529 ) ) ( HAVE_IMAGE ?auto_10528 ?auto_10532 ) ( not ( = ?auto_10528 ?auto_10525 ) ) ( not ( = ?auto_10528 ?auto_10529 ) ) ( not ( = ?auto_10532 ?auto_10524 ) ) ( CALIBRATION_TARGET ?auto_10530 ?auto_10529 ) ( POWER_AVAIL ?auto_10531 ) ( HAVE_IMAGE ?auto_10522 ?auto_10523 ) ( HAVE_IMAGE ?auto_10527 ?auto_10526 ) ( not ( = ?auto_10522 ?auto_10525 ) ) ( not ( = ?auto_10522 ?auto_10527 ) ) ( not ( = ?auto_10522 ?auto_10529 ) ) ( not ( = ?auto_10522 ?auto_10528 ) ) ( not ( = ?auto_10523 ?auto_10524 ) ) ( not ( = ?auto_10523 ?auto_10526 ) ) ( not ( = ?auto_10523 ?auto_10532 ) ) ( not ( = ?auto_10525 ?auto_10527 ) ) ( not ( = ?auto_10524 ?auto_10526 ) ) ( not ( = ?auto_10527 ?auto_10529 ) ) ( not ( = ?auto_10527 ?auto_10528 ) ) ( not ( = ?auto_10526 ?auto_10532 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10528 ?auto_10532 ?auto_10525 ?auto_10524 )
      ( GET-3IMAGE-VERIFY ?auto_10522 ?auto_10523 ?auto_10525 ?auto_10524 ?auto_10527 ?auto_10526 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10544 - DIRECTION
      ?auto_10545 - MODE
      ?auto_10547 - DIRECTION
      ?auto_10546 - MODE
      ?auto_10549 - DIRECTION
      ?auto_10548 - MODE
    )
    :vars
    (
      ?auto_10551 - INSTRUMENT
      ?auto_10552 - SATELLITE
      ?auto_10550 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10551 ?auto_10552 ) ( SUPPORTS ?auto_10551 ?auto_10545 ) ( POINTING ?auto_10552 ?auto_10550 ) ( not ( = ?auto_10544 ?auto_10550 ) ) ( HAVE_IMAGE ?auto_10547 ?auto_10546 ) ( not ( = ?auto_10547 ?auto_10544 ) ) ( not ( = ?auto_10547 ?auto_10550 ) ) ( not ( = ?auto_10546 ?auto_10545 ) ) ( CALIBRATION_TARGET ?auto_10551 ?auto_10550 ) ( POWER_AVAIL ?auto_10552 ) ( HAVE_IMAGE ?auto_10549 ?auto_10548 ) ( not ( = ?auto_10544 ?auto_10549 ) ) ( not ( = ?auto_10545 ?auto_10548 ) ) ( not ( = ?auto_10547 ?auto_10549 ) ) ( not ( = ?auto_10546 ?auto_10548 ) ) ( not ( = ?auto_10549 ?auto_10550 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10547 ?auto_10546 ?auto_10544 ?auto_10545 )
      ( GET-3IMAGE-VERIFY ?auto_10544 ?auto_10545 ?auto_10547 ?auto_10546 ?auto_10549 ?auto_10548 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10553 - DIRECTION
      ?auto_10554 - MODE
      ?auto_10556 - DIRECTION
      ?auto_10555 - MODE
      ?auto_10558 - DIRECTION
      ?auto_10557 - MODE
    )
    :vars
    (
      ?auto_10560 - INSTRUMENT
      ?auto_10561 - SATELLITE
      ?auto_10559 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10560 ?auto_10561 ) ( SUPPORTS ?auto_10560 ?auto_10554 ) ( POINTING ?auto_10561 ?auto_10559 ) ( not ( = ?auto_10553 ?auto_10559 ) ) ( HAVE_IMAGE ?auto_10556 ?auto_10555 ) ( not ( = ?auto_10556 ?auto_10553 ) ) ( not ( = ?auto_10556 ?auto_10559 ) ) ( not ( = ?auto_10555 ?auto_10554 ) ) ( CALIBRATION_TARGET ?auto_10560 ?auto_10559 ) ( POWER_AVAIL ?auto_10561 ) ( HAVE_IMAGE ?auto_10558 ?auto_10557 ) ( not ( = ?auto_10553 ?auto_10558 ) ) ( not ( = ?auto_10554 ?auto_10557 ) ) ( not ( = ?auto_10556 ?auto_10558 ) ) ( not ( = ?auto_10555 ?auto_10557 ) ) ( not ( = ?auto_10558 ?auto_10559 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10556 ?auto_10555 ?auto_10553 ?auto_10554 )
      ( GET-3IMAGE-VERIFY ?auto_10553 ?auto_10554 ?auto_10556 ?auto_10555 ?auto_10558 ?auto_10557 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10571 - DIRECTION
      ?auto_10572 - MODE
      ?auto_10574 - DIRECTION
      ?auto_10573 - MODE
      ?auto_10576 - DIRECTION
      ?auto_10575 - MODE
    )
    :vars
    (
      ?auto_10578 - INSTRUMENT
      ?auto_10579 - SATELLITE
      ?auto_10577 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10578 ?auto_10579 ) ( SUPPORTS ?auto_10578 ?auto_10572 ) ( POINTING ?auto_10579 ?auto_10577 ) ( not ( = ?auto_10571 ?auto_10577 ) ) ( HAVE_IMAGE ?auto_10576 ?auto_10575 ) ( not ( = ?auto_10576 ?auto_10571 ) ) ( not ( = ?auto_10576 ?auto_10577 ) ) ( not ( = ?auto_10575 ?auto_10572 ) ) ( CALIBRATION_TARGET ?auto_10578 ?auto_10577 ) ( POWER_AVAIL ?auto_10579 ) ( HAVE_IMAGE ?auto_10574 ?auto_10573 ) ( not ( = ?auto_10571 ?auto_10574 ) ) ( not ( = ?auto_10572 ?auto_10573 ) ) ( not ( = ?auto_10574 ?auto_10576 ) ) ( not ( = ?auto_10574 ?auto_10577 ) ) ( not ( = ?auto_10573 ?auto_10575 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10576 ?auto_10575 ?auto_10571 ?auto_10572 )
      ( GET-3IMAGE-VERIFY ?auto_10571 ?auto_10572 ?auto_10574 ?auto_10573 ?auto_10576 ?auto_10575 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10580 - DIRECTION
      ?auto_10581 - MODE
      ?auto_10583 - DIRECTION
      ?auto_10582 - MODE
      ?auto_10585 - DIRECTION
      ?auto_10584 - MODE
    )
    :vars
    (
      ?auto_10588 - INSTRUMENT
      ?auto_10589 - SATELLITE
      ?auto_10587 - DIRECTION
      ?auto_10586 - DIRECTION
      ?auto_10590 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_10588 ?auto_10589 ) ( SUPPORTS ?auto_10588 ?auto_10581 ) ( POINTING ?auto_10589 ?auto_10587 ) ( not ( = ?auto_10580 ?auto_10587 ) ) ( HAVE_IMAGE ?auto_10586 ?auto_10590 ) ( not ( = ?auto_10586 ?auto_10580 ) ) ( not ( = ?auto_10586 ?auto_10587 ) ) ( not ( = ?auto_10590 ?auto_10581 ) ) ( CALIBRATION_TARGET ?auto_10588 ?auto_10587 ) ( POWER_AVAIL ?auto_10589 ) ( HAVE_IMAGE ?auto_10583 ?auto_10582 ) ( HAVE_IMAGE ?auto_10585 ?auto_10584 ) ( not ( = ?auto_10580 ?auto_10583 ) ) ( not ( = ?auto_10580 ?auto_10585 ) ) ( not ( = ?auto_10581 ?auto_10582 ) ) ( not ( = ?auto_10581 ?auto_10584 ) ) ( not ( = ?auto_10583 ?auto_10585 ) ) ( not ( = ?auto_10583 ?auto_10587 ) ) ( not ( = ?auto_10583 ?auto_10586 ) ) ( not ( = ?auto_10582 ?auto_10584 ) ) ( not ( = ?auto_10582 ?auto_10590 ) ) ( not ( = ?auto_10585 ?auto_10587 ) ) ( not ( = ?auto_10585 ?auto_10586 ) ) ( not ( = ?auto_10584 ?auto_10590 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10586 ?auto_10590 ?auto_10580 ?auto_10581 )
      ( GET-3IMAGE-VERIFY ?auto_10580 ?auto_10581 ?auto_10583 ?auto_10582 ?auto_10585 ?auto_10584 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_10633 - DIRECTION
      ?auto_10634 - MODE
    )
    :vars
    (
      ?auto_10637 - INSTRUMENT
      ?auto_10638 - SATELLITE
      ?auto_10636 - DIRECTION
      ?auto_10635 - DIRECTION
      ?auto_10639 - MODE
      ?auto_10640 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10637 ?auto_10638 ) ( SUPPORTS ?auto_10637 ?auto_10634 ) ( not ( = ?auto_10633 ?auto_10636 ) ) ( HAVE_IMAGE ?auto_10635 ?auto_10639 ) ( not ( = ?auto_10635 ?auto_10633 ) ) ( not ( = ?auto_10635 ?auto_10636 ) ) ( not ( = ?auto_10639 ?auto_10634 ) ) ( CALIBRATION_TARGET ?auto_10637 ?auto_10636 ) ( POWER_AVAIL ?auto_10638 ) ( POINTING ?auto_10638 ?auto_10640 ) ( not ( = ?auto_10636 ?auto_10640 ) ) ( not ( = ?auto_10633 ?auto_10640 ) ) ( not ( = ?auto_10635 ?auto_10640 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_10638 ?auto_10636 ?auto_10640 )
      ( GET-2IMAGE ?auto_10635 ?auto_10639 ?auto_10633 ?auto_10634 )
      ( GET-1IMAGE-VERIFY ?auto_10633 ?auto_10634 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_10641 - DIRECTION
      ?auto_10642 - MODE
      ?auto_10644 - DIRECTION
      ?auto_10643 - MODE
    )
    :vars
    (
      ?auto_10647 - INSTRUMENT
      ?auto_10645 - SATELLITE
      ?auto_10648 - DIRECTION
      ?auto_10646 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10647 ?auto_10645 ) ( SUPPORTS ?auto_10647 ?auto_10643 ) ( not ( = ?auto_10644 ?auto_10648 ) ) ( HAVE_IMAGE ?auto_10641 ?auto_10642 ) ( not ( = ?auto_10641 ?auto_10644 ) ) ( not ( = ?auto_10641 ?auto_10648 ) ) ( not ( = ?auto_10642 ?auto_10643 ) ) ( CALIBRATION_TARGET ?auto_10647 ?auto_10648 ) ( POWER_AVAIL ?auto_10645 ) ( POINTING ?auto_10645 ?auto_10646 ) ( not ( = ?auto_10648 ?auto_10646 ) ) ( not ( = ?auto_10644 ?auto_10646 ) ) ( not ( = ?auto_10641 ?auto_10646 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_10644 ?auto_10643 )
      ( GET-2IMAGE-VERIFY ?auto_10641 ?auto_10642 ?auto_10644 ?auto_10643 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_10649 - DIRECTION
      ?auto_10650 - MODE
      ?auto_10652 - DIRECTION
      ?auto_10651 - MODE
    )
    :vars
    (
      ?auto_10656 - INSTRUMENT
      ?auto_10655 - SATELLITE
      ?auto_10654 - DIRECTION
      ?auto_10653 - DIRECTION
      ?auto_10657 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_10656 ?auto_10655 ) ( SUPPORTS ?auto_10656 ?auto_10651 ) ( not ( = ?auto_10652 ?auto_10654 ) ) ( HAVE_IMAGE ?auto_10653 ?auto_10657 ) ( not ( = ?auto_10653 ?auto_10652 ) ) ( not ( = ?auto_10653 ?auto_10654 ) ) ( not ( = ?auto_10657 ?auto_10651 ) ) ( CALIBRATION_TARGET ?auto_10656 ?auto_10654 ) ( POWER_AVAIL ?auto_10655 ) ( POINTING ?auto_10655 ?auto_10649 ) ( not ( = ?auto_10654 ?auto_10649 ) ) ( not ( = ?auto_10652 ?auto_10649 ) ) ( not ( = ?auto_10653 ?auto_10649 ) ) ( HAVE_IMAGE ?auto_10649 ?auto_10650 ) ( not ( = ?auto_10650 ?auto_10651 ) ) ( not ( = ?auto_10650 ?auto_10657 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10653 ?auto_10657 ?auto_10652 ?auto_10651 )
      ( GET-2IMAGE-VERIFY ?auto_10649 ?auto_10650 ?auto_10652 ?auto_10651 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_10658 - DIRECTION
      ?auto_10659 - MODE
      ?auto_10661 - DIRECTION
      ?auto_10660 - MODE
    )
    :vars
    (
      ?auto_10665 - INSTRUMENT
      ?auto_10664 - SATELLITE
      ?auto_10662 - DIRECTION
      ?auto_10663 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10665 ?auto_10664 ) ( SUPPORTS ?auto_10665 ?auto_10659 ) ( not ( = ?auto_10658 ?auto_10662 ) ) ( HAVE_IMAGE ?auto_10661 ?auto_10660 ) ( not ( = ?auto_10661 ?auto_10658 ) ) ( not ( = ?auto_10661 ?auto_10662 ) ) ( not ( = ?auto_10660 ?auto_10659 ) ) ( CALIBRATION_TARGET ?auto_10665 ?auto_10662 ) ( POWER_AVAIL ?auto_10664 ) ( POINTING ?auto_10664 ?auto_10663 ) ( not ( = ?auto_10662 ?auto_10663 ) ) ( not ( = ?auto_10658 ?auto_10663 ) ) ( not ( = ?auto_10661 ?auto_10663 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10661 ?auto_10660 ?auto_10658 ?auto_10659 )
      ( GET-2IMAGE-VERIFY ?auto_10658 ?auto_10659 ?auto_10661 ?auto_10660 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_10666 - DIRECTION
      ?auto_10667 - MODE
      ?auto_10669 - DIRECTION
      ?auto_10668 - MODE
    )
    :vars
    (
      ?auto_10673 - INSTRUMENT
      ?auto_10672 - SATELLITE
      ?auto_10671 - DIRECTION
      ?auto_10670 - DIRECTION
      ?auto_10674 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_10673 ?auto_10672 ) ( SUPPORTS ?auto_10673 ?auto_10667 ) ( not ( = ?auto_10666 ?auto_10671 ) ) ( HAVE_IMAGE ?auto_10670 ?auto_10674 ) ( not ( = ?auto_10670 ?auto_10666 ) ) ( not ( = ?auto_10670 ?auto_10671 ) ) ( not ( = ?auto_10674 ?auto_10667 ) ) ( CALIBRATION_TARGET ?auto_10673 ?auto_10671 ) ( POWER_AVAIL ?auto_10672 ) ( POINTING ?auto_10672 ?auto_10669 ) ( not ( = ?auto_10671 ?auto_10669 ) ) ( not ( = ?auto_10666 ?auto_10669 ) ) ( not ( = ?auto_10670 ?auto_10669 ) ) ( HAVE_IMAGE ?auto_10669 ?auto_10668 ) ( not ( = ?auto_10667 ?auto_10668 ) ) ( not ( = ?auto_10668 ?auto_10674 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10670 ?auto_10674 ?auto_10666 ?auto_10667 )
      ( GET-2IMAGE-VERIFY ?auto_10666 ?auto_10667 ?auto_10669 ?auto_10668 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10685 - DIRECTION
      ?auto_10686 - MODE
      ?auto_10688 - DIRECTION
      ?auto_10687 - MODE
      ?auto_10690 - DIRECTION
      ?auto_10689 - MODE
    )
    :vars
    (
      ?auto_10694 - INSTRUMENT
      ?auto_10693 - SATELLITE
      ?auto_10691 - DIRECTION
      ?auto_10692 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10694 ?auto_10693 ) ( SUPPORTS ?auto_10694 ?auto_10689 ) ( not ( = ?auto_10690 ?auto_10691 ) ) ( HAVE_IMAGE ?auto_10688 ?auto_10687 ) ( not ( = ?auto_10688 ?auto_10690 ) ) ( not ( = ?auto_10688 ?auto_10691 ) ) ( not ( = ?auto_10687 ?auto_10689 ) ) ( CALIBRATION_TARGET ?auto_10694 ?auto_10691 ) ( POWER_AVAIL ?auto_10693 ) ( POINTING ?auto_10693 ?auto_10692 ) ( not ( = ?auto_10691 ?auto_10692 ) ) ( not ( = ?auto_10690 ?auto_10692 ) ) ( not ( = ?auto_10688 ?auto_10692 ) ) ( HAVE_IMAGE ?auto_10685 ?auto_10686 ) ( not ( = ?auto_10685 ?auto_10688 ) ) ( not ( = ?auto_10685 ?auto_10690 ) ) ( not ( = ?auto_10685 ?auto_10691 ) ) ( not ( = ?auto_10685 ?auto_10692 ) ) ( not ( = ?auto_10686 ?auto_10687 ) ) ( not ( = ?auto_10686 ?auto_10689 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10688 ?auto_10687 ?auto_10690 ?auto_10689 )
      ( GET-3IMAGE-VERIFY ?auto_10685 ?auto_10686 ?auto_10688 ?auto_10687 ?auto_10690 ?auto_10689 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10695 - DIRECTION
      ?auto_10696 - MODE
      ?auto_10698 - DIRECTION
      ?auto_10697 - MODE
      ?auto_10700 - DIRECTION
      ?auto_10699 - MODE
    )
    :vars
    (
      ?auto_10703 - INSTRUMENT
      ?auto_10702 - SATELLITE
      ?auto_10701 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10703 ?auto_10702 ) ( SUPPORTS ?auto_10703 ?auto_10699 ) ( not ( = ?auto_10700 ?auto_10701 ) ) ( HAVE_IMAGE ?auto_10695 ?auto_10696 ) ( not ( = ?auto_10695 ?auto_10700 ) ) ( not ( = ?auto_10695 ?auto_10701 ) ) ( not ( = ?auto_10696 ?auto_10699 ) ) ( CALIBRATION_TARGET ?auto_10703 ?auto_10701 ) ( POWER_AVAIL ?auto_10702 ) ( POINTING ?auto_10702 ?auto_10698 ) ( not ( = ?auto_10701 ?auto_10698 ) ) ( not ( = ?auto_10700 ?auto_10698 ) ) ( not ( = ?auto_10695 ?auto_10698 ) ) ( HAVE_IMAGE ?auto_10698 ?auto_10697 ) ( not ( = ?auto_10696 ?auto_10697 ) ) ( not ( = ?auto_10697 ?auto_10699 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10695 ?auto_10696 ?auto_10700 ?auto_10699 )
      ( GET-3IMAGE-VERIFY ?auto_10695 ?auto_10696 ?auto_10698 ?auto_10697 ?auto_10700 ?auto_10699 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10704 - DIRECTION
      ?auto_10705 - MODE
      ?auto_10707 - DIRECTION
      ?auto_10706 - MODE
      ?auto_10709 - DIRECTION
      ?auto_10708 - MODE
    )
    :vars
    (
      ?auto_10713 - INSTRUMENT
      ?auto_10712 - SATELLITE
      ?auto_10710 - DIRECTION
      ?auto_10711 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10713 ?auto_10712 ) ( SUPPORTS ?auto_10713 ?auto_10706 ) ( not ( = ?auto_10707 ?auto_10710 ) ) ( HAVE_IMAGE ?auto_10709 ?auto_10708 ) ( not ( = ?auto_10709 ?auto_10707 ) ) ( not ( = ?auto_10709 ?auto_10710 ) ) ( not ( = ?auto_10708 ?auto_10706 ) ) ( CALIBRATION_TARGET ?auto_10713 ?auto_10710 ) ( POWER_AVAIL ?auto_10712 ) ( POINTING ?auto_10712 ?auto_10711 ) ( not ( = ?auto_10710 ?auto_10711 ) ) ( not ( = ?auto_10707 ?auto_10711 ) ) ( not ( = ?auto_10709 ?auto_10711 ) ) ( HAVE_IMAGE ?auto_10704 ?auto_10705 ) ( not ( = ?auto_10704 ?auto_10707 ) ) ( not ( = ?auto_10704 ?auto_10709 ) ) ( not ( = ?auto_10704 ?auto_10710 ) ) ( not ( = ?auto_10704 ?auto_10711 ) ) ( not ( = ?auto_10705 ?auto_10706 ) ) ( not ( = ?auto_10705 ?auto_10708 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10709 ?auto_10708 ?auto_10707 ?auto_10706 )
      ( GET-3IMAGE-VERIFY ?auto_10704 ?auto_10705 ?auto_10707 ?auto_10706 ?auto_10709 ?auto_10708 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10714 - DIRECTION
      ?auto_10715 - MODE
      ?auto_10717 - DIRECTION
      ?auto_10716 - MODE
      ?auto_10719 - DIRECTION
      ?auto_10718 - MODE
    )
    :vars
    (
      ?auto_10722 - INSTRUMENT
      ?auto_10721 - SATELLITE
      ?auto_10720 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10722 ?auto_10721 ) ( SUPPORTS ?auto_10722 ?auto_10716 ) ( not ( = ?auto_10717 ?auto_10720 ) ) ( HAVE_IMAGE ?auto_10714 ?auto_10715 ) ( not ( = ?auto_10714 ?auto_10717 ) ) ( not ( = ?auto_10714 ?auto_10720 ) ) ( not ( = ?auto_10715 ?auto_10716 ) ) ( CALIBRATION_TARGET ?auto_10722 ?auto_10720 ) ( POWER_AVAIL ?auto_10721 ) ( POINTING ?auto_10721 ?auto_10719 ) ( not ( = ?auto_10720 ?auto_10719 ) ) ( not ( = ?auto_10717 ?auto_10719 ) ) ( not ( = ?auto_10714 ?auto_10719 ) ) ( HAVE_IMAGE ?auto_10719 ?auto_10718 ) ( not ( = ?auto_10715 ?auto_10718 ) ) ( not ( = ?auto_10716 ?auto_10718 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10714 ?auto_10715 ?auto_10717 ?auto_10716 )
      ( GET-3IMAGE-VERIFY ?auto_10714 ?auto_10715 ?auto_10717 ?auto_10716 ?auto_10719 ?auto_10718 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10733 - DIRECTION
      ?auto_10734 - MODE
      ?auto_10736 - DIRECTION
      ?auto_10735 - MODE
      ?auto_10738 - DIRECTION
      ?auto_10737 - MODE
    )
    :vars
    (
      ?auto_10741 - INSTRUMENT
      ?auto_10740 - SATELLITE
      ?auto_10739 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10741 ?auto_10740 ) ( SUPPORTS ?auto_10741 ?auto_10737 ) ( not ( = ?auto_10738 ?auto_10739 ) ) ( HAVE_IMAGE ?auto_10736 ?auto_10735 ) ( not ( = ?auto_10736 ?auto_10738 ) ) ( not ( = ?auto_10736 ?auto_10739 ) ) ( not ( = ?auto_10735 ?auto_10737 ) ) ( CALIBRATION_TARGET ?auto_10741 ?auto_10739 ) ( POWER_AVAIL ?auto_10740 ) ( POINTING ?auto_10740 ?auto_10733 ) ( not ( = ?auto_10739 ?auto_10733 ) ) ( not ( = ?auto_10738 ?auto_10733 ) ) ( not ( = ?auto_10736 ?auto_10733 ) ) ( HAVE_IMAGE ?auto_10733 ?auto_10734 ) ( not ( = ?auto_10734 ?auto_10735 ) ) ( not ( = ?auto_10734 ?auto_10737 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10736 ?auto_10735 ?auto_10738 ?auto_10737 )
      ( GET-3IMAGE-VERIFY ?auto_10733 ?auto_10734 ?auto_10736 ?auto_10735 ?auto_10738 ?auto_10737 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10742 - DIRECTION
      ?auto_10743 - MODE
      ?auto_10745 - DIRECTION
      ?auto_10744 - MODE
      ?auto_10747 - DIRECTION
      ?auto_10746 - MODE
    )
    :vars
    (
      ?auto_10751 - INSTRUMENT
      ?auto_10750 - SATELLITE
      ?auto_10749 - DIRECTION
      ?auto_10748 - DIRECTION
      ?auto_10752 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_10751 ?auto_10750 ) ( SUPPORTS ?auto_10751 ?auto_10746 ) ( not ( = ?auto_10747 ?auto_10749 ) ) ( HAVE_IMAGE ?auto_10748 ?auto_10752 ) ( not ( = ?auto_10748 ?auto_10747 ) ) ( not ( = ?auto_10748 ?auto_10749 ) ) ( not ( = ?auto_10752 ?auto_10746 ) ) ( CALIBRATION_TARGET ?auto_10751 ?auto_10749 ) ( POWER_AVAIL ?auto_10750 ) ( POINTING ?auto_10750 ?auto_10745 ) ( not ( = ?auto_10749 ?auto_10745 ) ) ( not ( = ?auto_10747 ?auto_10745 ) ) ( not ( = ?auto_10748 ?auto_10745 ) ) ( HAVE_IMAGE ?auto_10742 ?auto_10743 ) ( HAVE_IMAGE ?auto_10745 ?auto_10744 ) ( not ( = ?auto_10742 ?auto_10745 ) ) ( not ( = ?auto_10742 ?auto_10747 ) ) ( not ( = ?auto_10742 ?auto_10749 ) ) ( not ( = ?auto_10742 ?auto_10748 ) ) ( not ( = ?auto_10743 ?auto_10744 ) ) ( not ( = ?auto_10743 ?auto_10746 ) ) ( not ( = ?auto_10743 ?auto_10752 ) ) ( not ( = ?auto_10744 ?auto_10746 ) ) ( not ( = ?auto_10744 ?auto_10752 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10748 ?auto_10752 ?auto_10747 ?auto_10746 )
      ( GET-3IMAGE-VERIFY ?auto_10742 ?auto_10743 ?auto_10745 ?auto_10744 ?auto_10747 ?auto_10746 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10753 - DIRECTION
      ?auto_10754 - MODE
      ?auto_10756 - DIRECTION
      ?auto_10755 - MODE
      ?auto_10758 - DIRECTION
      ?auto_10757 - MODE
    )
    :vars
    (
      ?auto_10761 - INSTRUMENT
      ?auto_10760 - SATELLITE
      ?auto_10759 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10761 ?auto_10760 ) ( SUPPORTS ?auto_10761 ?auto_10755 ) ( not ( = ?auto_10756 ?auto_10759 ) ) ( HAVE_IMAGE ?auto_10758 ?auto_10757 ) ( not ( = ?auto_10758 ?auto_10756 ) ) ( not ( = ?auto_10758 ?auto_10759 ) ) ( not ( = ?auto_10757 ?auto_10755 ) ) ( CALIBRATION_TARGET ?auto_10761 ?auto_10759 ) ( POWER_AVAIL ?auto_10760 ) ( POINTING ?auto_10760 ?auto_10753 ) ( not ( = ?auto_10759 ?auto_10753 ) ) ( not ( = ?auto_10756 ?auto_10753 ) ) ( not ( = ?auto_10758 ?auto_10753 ) ) ( HAVE_IMAGE ?auto_10753 ?auto_10754 ) ( not ( = ?auto_10754 ?auto_10755 ) ) ( not ( = ?auto_10754 ?auto_10757 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10758 ?auto_10757 ?auto_10756 ?auto_10755 )
      ( GET-3IMAGE-VERIFY ?auto_10753 ?auto_10754 ?auto_10756 ?auto_10755 ?auto_10758 ?auto_10757 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10762 - DIRECTION
      ?auto_10763 - MODE
      ?auto_10765 - DIRECTION
      ?auto_10764 - MODE
      ?auto_10767 - DIRECTION
      ?auto_10766 - MODE
    )
    :vars
    (
      ?auto_10771 - INSTRUMENT
      ?auto_10770 - SATELLITE
      ?auto_10769 - DIRECTION
      ?auto_10768 - DIRECTION
      ?auto_10772 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_10771 ?auto_10770 ) ( SUPPORTS ?auto_10771 ?auto_10764 ) ( not ( = ?auto_10765 ?auto_10769 ) ) ( HAVE_IMAGE ?auto_10768 ?auto_10772 ) ( not ( = ?auto_10768 ?auto_10765 ) ) ( not ( = ?auto_10768 ?auto_10769 ) ) ( not ( = ?auto_10772 ?auto_10764 ) ) ( CALIBRATION_TARGET ?auto_10771 ?auto_10769 ) ( POWER_AVAIL ?auto_10770 ) ( POINTING ?auto_10770 ?auto_10767 ) ( not ( = ?auto_10769 ?auto_10767 ) ) ( not ( = ?auto_10765 ?auto_10767 ) ) ( not ( = ?auto_10768 ?auto_10767 ) ) ( HAVE_IMAGE ?auto_10762 ?auto_10763 ) ( HAVE_IMAGE ?auto_10767 ?auto_10766 ) ( not ( = ?auto_10762 ?auto_10765 ) ) ( not ( = ?auto_10762 ?auto_10767 ) ) ( not ( = ?auto_10762 ?auto_10769 ) ) ( not ( = ?auto_10762 ?auto_10768 ) ) ( not ( = ?auto_10763 ?auto_10764 ) ) ( not ( = ?auto_10763 ?auto_10766 ) ) ( not ( = ?auto_10763 ?auto_10772 ) ) ( not ( = ?auto_10764 ?auto_10766 ) ) ( not ( = ?auto_10766 ?auto_10772 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10768 ?auto_10772 ?auto_10765 ?auto_10764 )
      ( GET-3IMAGE-VERIFY ?auto_10762 ?auto_10763 ?auto_10765 ?auto_10764 ?auto_10767 ?auto_10766 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10784 - DIRECTION
      ?auto_10785 - MODE
      ?auto_10787 - DIRECTION
      ?auto_10786 - MODE
      ?auto_10789 - DIRECTION
      ?auto_10788 - MODE
    )
    :vars
    (
      ?auto_10793 - INSTRUMENT
      ?auto_10792 - SATELLITE
      ?auto_10790 - DIRECTION
      ?auto_10791 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10793 ?auto_10792 ) ( SUPPORTS ?auto_10793 ?auto_10785 ) ( not ( = ?auto_10784 ?auto_10790 ) ) ( HAVE_IMAGE ?auto_10787 ?auto_10786 ) ( not ( = ?auto_10787 ?auto_10784 ) ) ( not ( = ?auto_10787 ?auto_10790 ) ) ( not ( = ?auto_10786 ?auto_10785 ) ) ( CALIBRATION_TARGET ?auto_10793 ?auto_10790 ) ( POWER_AVAIL ?auto_10792 ) ( POINTING ?auto_10792 ?auto_10791 ) ( not ( = ?auto_10790 ?auto_10791 ) ) ( not ( = ?auto_10784 ?auto_10791 ) ) ( not ( = ?auto_10787 ?auto_10791 ) ) ( HAVE_IMAGE ?auto_10789 ?auto_10788 ) ( not ( = ?auto_10784 ?auto_10789 ) ) ( not ( = ?auto_10785 ?auto_10788 ) ) ( not ( = ?auto_10787 ?auto_10789 ) ) ( not ( = ?auto_10786 ?auto_10788 ) ) ( not ( = ?auto_10789 ?auto_10790 ) ) ( not ( = ?auto_10789 ?auto_10791 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10787 ?auto_10786 ?auto_10784 ?auto_10785 )
      ( GET-3IMAGE-VERIFY ?auto_10784 ?auto_10785 ?auto_10787 ?auto_10786 ?auto_10789 ?auto_10788 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10794 - DIRECTION
      ?auto_10795 - MODE
      ?auto_10797 - DIRECTION
      ?auto_10796 - MODE
      ?auto_10799 - DIRECTION
      ?auto_10798 - MODE
    )
    :vars
    (
      ?auto_10802 - INSTRUMENT
      ?auto_10801 - SATELLITE
      ?auto_10800 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10802 ?auto_10801 ) ( SUPPORTS ?auto_10802 ?auto_10795 ) ( not ( = ?auto_10794 ?auto_10800 ) ) ( HAVE_IMAGE ?auto_10797 ?auto_10796 ) ( not ( = ?auto_10797 ?auto_10794 ) ) ( not ( = ?auto_10797 ?auto_10800 ) ) ( not ( = ?auto_10796 ?auto_10795 ) ) ( CALIBRATION_TARGET ?auto_10802 ?auto_10800 ) ( POWER_AVAIL ?auto_10801 ) ( POINTING ?auto_10801 ?auto_10799 ) ( not ( = ?auto_10800 ?auto_10799 ) ) ( not ( = ?auto_10794 ?auto_10799 ) ) ( not ( = ?auto_10797 ?auto_10799 ) ) ( HAVE_IMAGE ?auto_10799 ?auto_10798 ) ( not ( = ?auto_10795 ?auto_10798 ) ) ( not ( = ?auto_10796 ?auto_10798 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10797 ?auto_10796 ?auto_10794 ?auto_10795 )
      ( GET-3IMAGE-VERIFY ?auto_10794 ?auto_10795 ?auto_10797 ?auto_10796 ?auto_10799 ?auto_10798 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10813 - DIRECTION
      ?auto_10814 - MODE
      ?auto_10816 - DIRECTION
      ?auto_10815 - MODE
      ?auto_10818 - DIRECTION
      ?auto_10817 - MODE
    )
    :vars
    (
      ?auto_10821 - INSTRUMENT
      ?auto_10820 - SATELLITE
      ?auto_10819 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_10821 ?auto_10820 ) ( SUPPORTS ?auto_10821 ?auto_10814 ) ( not ( = ?auto_10813 ?auto_10819 ) ) ( HAVE_IMAGE ?auto_10818 ?auto_10817 ) ( not ( = ?auto_10818 ?auto_10813 ) ) ( not ( = ?auto_10818 ?auto_10819 ) ) ( not ( = ?auto_10817 ?auto_10814 ) ) ( CALIBRATION_TARGET ?auto_10821 ?auto_10819 ) ( POWER_AVAIL ?auto_10820 ) ( POINTING ?auto_10820 ?auto_10816 ) ( not ( = ?auto_10819 ?auto_10816 ) ) ( not ( = ?auto_10813 ?auto_10816 ) ) ( not ( = ?auto_10818 ?auto_10816 ) ) ( HAVE_IMAGE ?auto_10816 ?auto_10815 ) ( not ( = ?auto_10814 ?auto_10815 ) ) ( not ( = ?auto_10815 ?auto_10817 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10818 ?auto_10817 ?auto_10813 ?auto_10814 )
      ( GET-3IMAGE-VERIFY ?auto_10813 ?auto_10814 ?auto_10816 ?auto_10815 ?auto_10818 ?auto_10817 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10822 - DIRECTION
      ?auto_10823 - MODE
      ?auto_10825 - DIRECTION
      ?auto_10824 - MODE
      ?auto_10827 - DIRECTION
      ?auto_10826 - MODE
    )
    :vars
    (
      ?auto_10831 - INSTRUMENT
      ?auto_10830 - SATELLITE
      ?auto_10829 - DIRECTION
      ?auto_10828 - DIRECTION
      ?auto_10832 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_10831 ?auto_10830 ) ( SUPPORTS ?auto_10831 ?auto_10823 ) ( not ( = ?auto_10822 ?auto_10829 ) ) ( HAVE_IMAGE ?auto_10828 ?auto_10832 ) ( not ( = ?auto_10828 ?auto_10822 ) ) ( not ( = ?auto_10828 ?auto_10829 ) ) ( not ( = ?auto_10832 ?auto_10823 ) ) ( CALIBRATION_TARGET ?auto_10831 ?auto_10829 ) ( POWER_AVAIL ?auto_10830 ) ( POINTING ?auto_10830 ?auto_10827 ) ( not ( = ?auto_10829 ?auto_10827 ) ) ( not ( = ?auto_10822 ?auto_10827 ) ) ( not ( = ?auto_10828 ?auto_10827 ) ) ( HAVE_IMAGE ?auto_10825 ?auto_10824 ) ( HAVE_IMAGE ?auto_10827 ?auto_10826 ) ( not ( = ?auto_10822 ?auto_10825 ) ) ( not ( = ?auto_10823 ?auto_10824 ) ) ( not ( = ?auto_10823 ?auto_10826 ) ) ( not ( = ?auto_10825 ?auto_10827 ) ) ( not ( = ?auto_10825 ?auto_10829 ) ) ( not ( = ?auto_10825 ?auto_10828 ) ) ( not ( = ?auto_10824 ?auto_10826 ) ) ( not ( = ?auto_10824 ?auto_10832 ) ) ( not ( = ?auto_10826 ?auto_10832 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10828 ?auto_10832 ?auto_10822 ?auto_10823 )
      ( GET-3IMAGE-VERIFY ?auto_10822 ?auto_10823 ?auto_10825 ?auto_10824 ?auto_10827 ?auto_10826 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_10877 - DIRECTION
      ?auto_10878 - MODE
    )
    :vars
    (
      ?auto_10883 - INSTRUMENT
      ?auto_10882 - SATELLITE
      ?auto_10880 - DIRECTION
      ?auto_10879 - DIRECTION
      ?auto_10884 - MODE
      ?auto_10881 - DIRECTION
      ?auto_10885 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10883 ?auto_10882 ) ( SUPPORTS ?auto_10883 ?auto_10878 ) ( not ( = ?auto_10877 ?auto_10880 ) ) ( HAVE_IMAGE ?auto_10879 ?auto_10884 ) ( not ( = ?auto_10879 ?auto_10877 ) ) ( not ( = ?auto_10879 ?auto_10880 ) ) ( not ( = ?auto_10884 ?auto_10878 ) ) ( CALIBRATION_TARGET ?auto_10883 ?auto_10880 ) ( POINTING ?auto_10882 ?auto_10881 ) ( not ( = ?auto_10880 ?auto_10881 ) ) ( not ( = ?auto_10877 ?auto_10881 ) ) ( not ( = ?auto_10879 ?auto_10881 ) ) ( ON_BOARD ?auto_10885 ?auto_10882 ) ( POWER_ON ?auto_10885 ) ( not ( = ?auto_10883 ?auto_10885 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_10885 ?auto_10882 )
      ( GET-2IMAGE ?auto_10879 ?auto_10884 ?auto_10877 ?auto_10878 )
      ( GET-1IMAGE-VERIFY ?auto_10877 ?auto_10878 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_10886 - DIRECTION
      ?auto_10887 - MODE
      ?auto_10889 - DIRECTION
      ?auto_10888 - MODE
    )
    :vars
    (
      ?auto_10894 - INSTRUMENT
      ?auto_10891 - SATELLITE
      ?auto_10892 - DIRECTION
      ?auto_10890 - DIRECTION
      ?auto_10893 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10894 ?auto_10891 ) ( SUPPORTS ?auto_10894 ?auto_10888 ) ( not ( = ?auto_10889 ?auto_10892 ) ) ( HAVE_IMAGE ?auto_10886 ?auto_10887 ) ( not ( = ?auto_10886 ?auto_10889 ) ) ( not ( = ?auto_10886 ?auto_10892 ) ) ( not ( = ?auto_10887 ?auto_10888 ) ) ( CALIBRATION_TARGET ?auto_10894 ?auto_10892 ) ( POINTING ?auto_10891 ?auto_10890 ) ( not ( = ?auto_10892 ?auto_10890 ) ) ( not ( = ?auto_10889 ?auto_10890 ) ) ( not ( = ?auto_10886 ?auto_10890 ) ) ( ON_BOARD ?auto_10893 ?auto_10891 ) ( POWER_ON ?auto_10893 ) ( not ( = ?auto_10894 ?auto_10893 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_10889 ?auto_10888 )
      ( GET-2IMAGE-VERIFY ?auto_10886 ?auto_10887 ?auto_10889 ?auto_10888 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_10895 - DIRECTION
      ?auto_10896 - MODE
      ?auto_10898 - DIRECTION
      ?auto_10897 - MODE
    )
    :vars
    (
      ?auto_10900 - INSTRUMENT
      ?auto_10903 - SATELLITE
      ?auto_10899 - DIRECTION
      ?auto_10902 - DIRECTION
      ?auto_10901 - MODE
      ?auto_10904 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10900 ?auto_10903 ) ( SUPPORTS ?auto_10900 ?auto_10897 ) ( not ( = ?auto_10898 ?auto_10899 ) ) ( HAVE_IMAGE ?auto_10902 ?auto_10901 ) ( not ( = ?auto_10902 ?auto_10898 ) ) ( not ( = ?auto_10902 ?auto_10899 ) ) ( not ( = ?auto_10901 ?auto_10897 ) ) ( CALIBRATION_TARGET ?auto_10900 ?auto_10899 ) ( POINTING ?auto_10903 ?auto_10895 ) ( not ( = ?auto_10899 ?auto_10895 ) ) ( not ( = ?auto_10898 ?auto_10895 ) ) ( not ( = ?auto_10902 ?auto_10895 ) ) ( ON_BOARD ?auto_10904 ?auto_10903 ) ( POWER_ON ?auto_10904 ) ( not ( = ?auto_10900 ?auto_10904 ) ) ( HAVE_IMAGE ?auto_10895 ?auto_10896 ) ( not ( = ?auto_10896 ?auto_10897 ) ) ( not ( = ?auto_10896 ?auto_10901 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10902 ?auto_10901 ?auto_10898 ?auto_10897 )
      ( GET-2IMAGE-VERIFY ?auto_10895 ?auto_10896 ?auto_10898 ?auto_10897 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_10905 - DIRECTION
      ?auto_10906 - MODE
      ?auto_10908 - DIRECTION
      ?auto_10907 - MODE
    )
    :vars
    (
      ?auto_10911 - INSTRUMENT
      ?auto_10912 - SATELLITE
      ?auto_10909 - DIRECTION
      ?auto_10910 - DIRECTION
      ?auto_10913 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10911 ?auto_10912 ) ( SUPPORTS ?auto_10911 ?auto_10906 ) ( not ( = ?auto_10905 ?auto_10909 ) ) ( HAVE_IMAGE ?auto_10908 ?auto_10907 ) ( not ( = ?auto_10908 ?auto_10905 ) ) ( not ( = ?auto_10908 ?auto_10909 ) ) ( not ( = ?auto_10907 ?auto_10906 ) ) ( CALIBRATION_TARGET ?auto_10911 ?auto_10909 ) ( POINTING ?auto_10912 ?auto_10910 ) ( not ( = ?auto_10909 ?auto_10910 ) ) ( not ( = ?auto_10905 ?auto_10910 ) ) ( not ( = ?auto_10908 ?auto_10910 ) ) ( ON_BOARD ?auto_10913 ?auto_10912 ) ( POWER_ON ?auto_10913 ) ( not ( = ?auto_10911 ?auto_10913 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10908 ?auto_10907 ?auto_10905 ?auto_10906 )
      ( GET-2IMAGE-VERIFY ?auto_10905 ?auto_10906 ?auto_10908 ?auto_10907 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_10914 - DIRECTION
      ?auto_10915 - MODE
      ?auto_10917 - DIRECTION
      ?auto_10916 - MODE
    )
    :vars
    (
      ?auto_10919 - INSTRUMENT
      ?auto_10922 - SATELLITE
      ?auto_10918 - DIRECTION
      ?auto_10921 - DIRECTION
      ?auto_10920 - MODE
      ?auto_10923 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10919 ?auto_10922 ) ( SUPPORTS ?auto_10919 ?auto_10915 ) ( not ( = ?auto_10914 ?auto_10918 ) ) ( HAVE_IMAGE ?auto_10921 ?auto_10920 ) ( not ( = ?auto_10921 ?auto_10914 ) ) ( not ( = ?auto_10921 ?auto_10918 ) ) ( not ( = ?auto_10920 ?auto_10915 ) ) ( CALIBRATION_TARGET ?auto_10919 ?auto_10918 ) ( POINTING ?auto_10922 ?auto_10917 ) ( not ( = ?auto_10918 ?auto_10917 ) ) ( not ( = ?auto_10914 ?auto_10917 ) ) ( not ( = ?auto_10921 ?auto_10917 ) ) ( ON_BOARD ?auto_10923 ?auto_10922 ) ( POWER_ON ?auto_10923 ) ( not ( = ?auto_10919 ?auto_10923 ) ) ( HAVE_IMAGE ?auto_10917 ?auto_10916 ) ( not ( = ?auto_10915 ?auto_10916 ) ) ( not ( = ?auto_10916 ?auto_10920 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10921 ?auto_10920 ?auto_10914 ?auto_10915 )
      ( GET-2IMAGE-VERIFY ?auto_10914 ?auto_10915 ?auto_10917 ?auto_10916 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10935 - DIRECTION
      ?auto_10936 - MODE
      ?auto_10938 - DIRECTION
      ?auto_10937 - MODE
      ?auto_10940 - DIRECTION
      ?auto_10939 - MODE
    )
    :vars
    (
      ?auto_10943 - INSTRUMENT
      ?auto_10944 - SATELLITE
      ?auto_10941 - DIRECTION
      ?auto_10942 - DIRECTION
      ?auto_10945 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10943 ?auto_10944 ) ( SUPPORTS ?auto_10943 ?auto_10939 ) ( not ( = ?auto_10940 ?auto_10941 ) ) ( HAVE_IMAGE ?auto_10938 ?auto_10936 ) ( not ( = ?auto_10938 ?auto_10940 ) ) ( not ( = ?auto_10938 ?auto_10941 ) ) ( not ( = ?auto_10936 ?auto_10939 ) ) ( CALIBRATION_TARGET ?auto_10943 ?auto_10941 ) ( POINTING ?auto_10944 ?auto_10942 ) ( not ( = ?auto_10941 ?auto_10942 ) ) ( not ( = ?auto_10940 ?auto_10942 ) ) ( not ( = ?auto_10938 ?auto_10942 ) ) ( ON_BOARD ?auto_10945 ?auto_10944 ) ( POWER_ON ?auto_10945 ) ( not ( = ?auto_10943 ?auto_10945 ) ) ( HAVE_IMAGE ?auto_10935 ?auto_10936 ) ( HAVE_IMAGE ?auto_10938 ?auto_10937 ) ( not ( = ?auto_10935 ?auto_10938 ) ) ( not ( = ?auto_10935 ?auto_10940 ) ) ( not ( = ?auto_10935 ?auto_10941 ) ) ( not ( = ?auto_10935 ?auto_10942 ) ) ( not ( = ?auto_10936 ?auto_10937 ) ) ( not ( = ?auto_10937 ?auto_10939 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10938 ?auto_10936 ?auto_10940 ?auto_10939 )
      ( GET-3IMAGE-VERIFY ?auto_10935 ?auto_10936 ?auto_10938 ?auto_10937 ?auto_10940 ?auto_10939 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10946 - DIRECTION
      ?auto_10947 - MODE
      ?auto_10949 - DIRECTION
      ?auto_10948 - MODE
      ?auto_10951 - DIRECTION
      ?auto_10950 - MODE
    )
    :vars
    (
      ?auto_10953 - INSTRUMENT
      ?auto_10954 - SATELLITE
      ?auto_10952 - DIRECTION
      ?auto_10955 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10953 ?auto_10954 ) ( SUPPORTS ?auto_10953 ?auto_10950 ) ( not ( = ?auto_10951 ?auto_10952 ) ) ( HAVE_IMAGE ?auto_10946 ?auto_10947 ) ( not ( = ?auto_10946 ?auto_10951 ) ) ( not ( = ?auto_10946 ?auto_10952 ) ) ( not ( = ?auto_10947 ?auto_10950 ) ) ( CALIBRATION_TARGET ?auto_10953 ?auto_10952 ) ( POINTING ?auto_10954 ?auto_10949 ) ( not ( = ?auto_10952 ?auto_10949 ) ) ( not ( = ?auto_10951 ?auto_10949 ) ) ( not ( = ?auto_10946 ?auto_10949 ) ) ( ON_BOARD ?auto_10955 ?auto_10954 ) ( POWER_ON ?auto_10955 ) ( not ( = ?auto_10953 ?auto_10955 ) ) ( HAVE_IMAGE ?auto_10949 ?auto_10948 ) ( not ( = ?auto_10947 ?auto_10948 ) ) ( not ( = ?auto_10948 ?auto_10950 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10946 ?auto_10947 ?auto_10951 ?auto_10950 )
      ( GET-3IMAGE-VERIFY ?auto_10946 ?auto_10947 ?auto_10949 ?auto_10948 ?auto_10951 ?auto_10950 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10956 - DIRECTION
      ?auto_10957 - MODE
      ?auto_10959 - DIRECTION
      ?auto_10958 - MODE
      ?auto_10961 - DIRECTION
      ?auto_10960 - MODE
    )
    :vars
    (
      ?auto_10964 - INSTRUMENT
      ?auto_10965 - SATELLITE
      ?auto_10962 - DIRECTION
      ?auto_10963 - DIRECTION
      ?auto_10966 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10964 ?auto_10965 ) ( SUPPORTS ?auto_10964 ?auto_10958 ) ( not ( = ?auto_10959 ?auto_10962 ) ) ( HAVE_IMAGE ?auto_10961 ?auto_10960 ) ( not ( = ?auto_10961 ?auto_10959 ) ) ( not ( = ?auto_10961 ?auto_10962 ) ) ( not ( = ?auto_10960 ?auto_10958 ) ) ( CALIBRATION_TARGET ?auto_10964 ?auto_10962 ) ( POINTING ?auto_10965 ?auto_10963 ) ( not ( = ?auto_10962 ?auto_10963 ) ) ( not ( = ?auto_10959 ?auto_10963 ) ) ( not ( = ?auto_10961 ?auto_10963 ) ) ( ON_BOARD ?auto_10966 ?auto_10965 ) ( POWER_ON ?auto_10966 ) ( not ( = ?auto_10964 ?auto_10966 ) ) ( HAVE_IMAGE ?auto_10956 ?auto_10957 ) ( not ( = ?auto_10956 ?auto_10959 ) ) ( not ( = ?auto_10956 ?auto_10961 ) ) ( not ( = ?auto_10956 ?auto_10962 ) ) ( not ( = ?auto_10956 ?auto_10963 ) ) ( not ( = ?auto_10957 ?auto_10958 ) ) ( not ( = ?auto_10957 ?auto_10960 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10961 ?auto_10960 ?auto_10959 ?auto_10958 )
      ( GET-3IMAGE-VERIFY ?auto_10956 ?auto_10957 ?auto_10959 ?auto_10958 ?auto_10961 ?auto_10960 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10967 - DIRECTION
      ?auto_10968 - MODE
      ?auto_10970 - DIRECTION
      ?auto_10969 - MODE
      ?auto_10972 - DIRECTION
      ?auto_10971 - MODE
    )
    :vars
    (
      ?auto_10974 - INSTRUMENT
      ?auto_10975 - SATELLITE
      ?auto_10973 - DIRECTION
      ?auto_10976 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10974 ?auto_10975 ) ( SUPPORTS ?auto_10974 ?auto_10969 ) ( not ( = ?auto_10970 ?auto_10973 ) ) ( HAVE_IMAGE ?auto_10967 ?auto_10968 ) ( not ( = ?auto_10967 ?auto_10970 ) ) ( not ( = ?auto_10967 ?auto_10973 ) ) ( not ( = ?auto_10968 ?auto_10969 ) ) ( CALIBRATION_TARGET ?auto_10974 ?auto_10973 ) ( POINTING ?auto_10975 ?auto_10972 ) ( not ( = ?auto_10973 ?auto_10972 ) ) ( not ( = ?auto_10970 ?auto_10972 ) ) ( not ( = ?auto_10967 ?auto_10972 ) ) ( ON_BOARD ?auto_10976 ?auto_10975 ) ( POWER_ON ?auto_10976 ) ( not ( = ?auto_10974 ?auto_10976 ) ) ( HAVE_IMAGE ?auto_10972 ?auto_10971 ) ( not ( = ?auto_10968 ?auto_10971 ) ) ( not ( = ?auto_10969 ?auto_10971 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10967 ?auto_10968 ?auto_10970 ?auto_10969 )
      ( GET-3IMAGE-VERIFY ?auto_10967 ?auto_10968 ?auto_10970 ?auto_10969 ?auto_10972 ?auto_10971 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10988 - DIRECTION
      ?auto_10989 - MODE
      ?auto_10991 - DIRECTION
      ?auto_10990 - MODE
      ?auto_10993 - DIRECTION
      ?auto_10992 - MODE
    )
    :vars
    (
      ?auto_10995 - INSTRUMENT
      ?auto_10996 - SATELLITE
      ?auto_10994 - DIRECTION
      ?auto_10997 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_10995 ?auto_10996 ) ( SUPPORTS ?auto_10995 ?auto_10992 ) ( not ( = ?auto_10993 ?auto_10994 ) ) ( HAVE_IMAGE ?auto_10991 ?auto_10990 ) ( not ( = ?auto_10991 ?auto_10993 ) ) ( not ( = ?auto_10991 ?auto_10994 ) ) ( not ( = ?auto_10990 ?auto_10992 ) ) ( CALIBRATION_TARGET ?auto_10995 ?auto_10994 ) ( POINTING ?auto_10996 ?auto_10988 ) ( not ( = ?auto_10994 ?auto_10988 ) ) ( not ( = ?auto_10993 ?auto_10988 ) ) ( not ( = ?auto_10991 ?auto_10988 ) ) ( ON_BOARD ?auto_10997 ?auto_10996 ) ( POWER_ON ?auto_10997 ) ( not ( = ?auto_10995 ?auto_10997 ) ) ( HAVE_IMAGE ?auto_10988 ?auto_10989 ) ( not ( = ?auto_10989 ?auto_10990 ) ) ( not ( = ?auto_10989 ?auto_10992 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10991 ?auto_10990 ?auto_10993 ?auto_10992 )
      ( GET-3IMAGE-VERIFY ?auto_10988 ?auto_10989 ?auto_10991 ?auto_10990 ?auto_10993 ?auto_10992 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_10998 - DIRECTION
      ?auto_10999 - MODE
      ?auto_11001 - DIRECTION
      ?auto_11000 - MODE
      ?auto_11003 - DIRECTION
      ?auto_11002 - MODE
    )
    :vars
    (
      ?auto_11005 - INSTRUMENT
      ?auto_11008 - SATELLITE
      ?auto_11004 - DIRECTION
      ?auto_11007 - DIRECTION
      ?auto_11006 - MODE
      ?auto_11009 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11005 ?auto_11008 ) ( SUPPORTS ?auto_11005 ?auto_11002 ) ( not ( = ?auto_11003 ?auto_11004 ) ) ( HAVE_IMAGE ?auto_11007 ?auto_11006 ) ( not ( = ?auto_11007 ?auto_11003 ) ) ( not ( = ?auto_11007 ?auto_11004 ) ) ( not ( = ?auto_11006 ?auto_11002 ) ) ( CALIBRATION_TARGET ?auto_11005 ?auto_11004 ) ( POINTING ?auto_11008 ?auto_11001 ) ( not ( = ?auto_11004 ?auto_11001 ) ) ( not ( = ?auto_11003 ?auto_11001 ) ) ( not ( = ?auto_11007 ?auto_11001 ) ) ( ON_BOARD ?auto_11009 ?auto_11008 ) ( POWER_ON ?auto_11009 ) ( not ( = ?auto_11005 ?auto_11009 ) ) ( HAVE_IMAGE ?auto_10998 ?auto_10999 ) ( HAVE_IMAGE ?auto_11001 ?auto_11000 ) ( not ( = ?auto_10998 ?auto_11001 ) ) ( not ( = ?auto_10998 ?auto_11003 ) ) ( not ( = ?auto_10998 ?auto_11004 ) ) ( not ( = ?auto_10998 ?auto_11007 ) ) ( not ( = ?auto_10999 ?auto_11000 ) ) ( not ( = ?auto_10999 ?auto_11002 ) ) ( not ( = ?auto_10999 ?auto_11006 ) ) ( not ( = ?auto_11000 ?auto_11002 ) ) ( not ( = ?auto_11000 ?auto_11006 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11007 ?auto_11006 ?auto_11003 ?auto_11002 )
      ( GET-3IMAGE-VERIFY ?auto_10998 ?auto_10999 ?auto_11001 ?auto_11000 ?auto_11003 ?auto_11002 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11010 - DIRECTION
      ?auto_11011 - MODE
      ?auto_11013 - DIRECTION
      ?auto_11012 - MODE
      ?auto_11015 - DIRECTION
      ?auto_11014 - MODE
    )
    :vars
    (
      ?auto_11017 - INSTRUMENT
      ?auto_11018 - SATELLITE
      ?auto_11016 - DIRECTION
      ?auto_11019 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11017 ?auto_11018 ) ( SUPPORTS ?auto_11017 ?auto_11012 ) ( not ( = ?auto_11013 ?auto_11016 ) ) ( HAVE_IMAGE ?auto_11015 ?auto_11014 ) ( not ( = ?auto_11015 ?auto_11013 ) ) ( not ( = ?auto_11015 ?auto_11016 ) ) ( not ( = ?auto_11014 ?auto_11012 ) ) ( CALIBRATION_TARGET ?auto_11017 ?auto_11016 ) ( POINTING ?auto_11018 ?auto_11010 ) ( not ( = ?auto_11016 ?auto_11010 ) ) ( not ( = ?auto_11013 ?auto_11010 ) ) ( not ( = ?auto_11015 ?auto_11010 ) ) ( ON_BOARD ?auto_11019 ?auto_11018 ) ( POWER_ON ?auto_11019 ) ( not ( = ?auto_11017 ?auto_11019 ) ) ( HAVE_IMAGE ?auto_11010 ?auto_11011 ) ( not ( = ?auto_11011 ?auto_11012 ) ) ( not ( = ?auto_11011 ?auto_11014 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11015 ?auto_11014 ?auto_11013 ?auto_11012 )
      ( GET-3IMAGE-VERIFY ?auto_11010 ?auto_11011 ?auto_11013 ?auto_11012 ?auto_11015 ?auto_11014 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11020 - DIRECTION
      ?auto_11021 - MODE
      ?auto_11023 - DIRECTION
      ?auto_11022 - MODE
      ?auto_11025 - DIRECTION
      ?auto_11024 - MODE
    )
    :vars
    (
      ?auto_11027 - INSTRUMENT
      ?auto_11030 - SATELLITE
      ?auto_11026 - DIRECTION
      ?auto_11029 - DIRECTION
      ?auto_11028 - MODE
      ?auto_11031 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11027 ?auto_11030 ) ( SUPPORTS ?auto_11027 ?auto_11022 ) ( not ( = ?auto_11023 ?auto_11026 ) ) ( HAVE_IMAGE ?auto_11029 ?auto_11028 ) ( not ( = ?auto_11029 ?auto_11023 ) ) ( not ( = ?auto_11029 ?auto_11026 ) ) ( not ( = ?auto_11028 ?auto_11022 ) ) ( CALIBRATION_TARGET ?auto_11027 ?auto_11026 ) ( POINTING ?auto_11030 ?auto_11025 ) ( not ( = ?auto_11026 ?auto_11025 ) ) ( not ( = ?auto_11023 ?auto_11025 ) ) ( not ( = ?auto_11029 ?auto_11025 ) ) ( ON_BOARD ?auto_11031 ?auto_11030 ) ( POWER_ON ?auto_11031 ) ( not ( = ?auto_11027 ?auto_11031 ) ) ( HAVE_IMAGE ?auto_11020 ?auto_11021 ) ( HAVE_IMAGE ?auto_11025 ?auto_11024 ) ( not ( = ?auto_11020 ?auto_11023 ) ) ( not ( = ?auto_11020 ?auto_11025 ) ) ( not ( = ?auto_11020 ?auto_11026 ) ) ( not ( = ?auto_11020 ?auto_11029 ) ) ( not ( = ?auto_11021 ?auto_11022 ) ) ( not ( = ?auto_11021 ?auto_11024 ) ) ( not ( = ?auto_11021 ?auto_11028 ) ) ( not ( = ?auto_11022 ?auto_11024 ) ) ( not ( = ?auto_11024 ?auto_11028 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11029 ?auto_11028 ?auto_11023 ?auto_11022 )
      ( GET-3IMAGE-VERIFY ?auto_11020 ?auto_11021 ?auto_11023 ?auto_11022 ?auto_11025 ?auto_11024 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11044 - DIRECTION
      ?auto_11045 - MODE
      ?auto_11047 - DIRECTION
      ?auto_11046 - MODE
      ?auto_11049 - DIRECTION
      ?auto_11048 - MODE
    )
    :vars
    (
      ?auto_11052 - INSTRUMENT
      ?auto_11053 - SATELLITE
      ?auto_11050 - DIRECTION
      ?auto_11051 - DIRECTION
      ?auto_11054 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11052 ?auto_11053 ) ( SUPPORTS ?auto_11052 ?auto_11045 ) ( not ( = ?auto_11044 ?auto_11050 ) ) ( HAVE_IMAGE ?auto_11049 ?auto_11048 ) ( not ( = ?auto_11049 ?auto_11044 ) ) ( not ( = ?auto_11049 ?auto_11050 ) ) ( not ( = ?auto_11048 ?auto_11045 ) ) ( CALIBRATION_TARGET ?auto_11052 ?auto_11050 ) ( POINTING ?auto_11053 ?auto_11051 ) ( not ( = ?auto_11050 ?auto_11051 ) ) ( not ( = ?auto_11044 ?auto_11051 ) ) ( not ( = ?auto_11049 ?auto_11051 ) ) ( ON_BOARD ?auto_11054 ?auto_11053 ) ( POWER_ON ?auto_11054 ) ( not ( = ?auto_11052 ?auto_11054 ) ) ( HAVE_IMAGE ?auto_11047 ?auto_11046 ) ( not ( = ?auto_11044 ?auto_11047 ) ) ( not ( = ?auto_11045 ?auto_11046 ) ) ( not ( = ?auto_11047 ?auto_11049 ) ) ( not ( = ?auto_11047 ?auto_11050 ) ) ( not ( = ?auto_11047 ?auto_11051 ) ) ( not ( = ?auto_11046 ?auto_11048 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11049 ?auto_11048 ?auto_11044 ?auto_11045 )
      ( GET-3IMAGE-VERIFY ?auto_11044 ?auto_11045 ?auto_11047 ?auto_11046 ?auto_11049 ?auto_11048 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11055 - DIRECTION
      ?auto_11056 - MODE
      ?auto_11058 - DIRECTION
      ?auto_11057 - MODE
      ?auto_11060 - DIRECTION
      ?auto_11059 - MODE
    )
    :vars
    (
      ?auto_11062 - INSTRUMENT
      ?auto_11063 - SATELLITE
      ?auto_11061 - DIRECTION
      ?auto_11064 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11062 ?auto_11063 ) ( SUPPORTS ?auto_11062 ?auto_11056 ) ( not ( = ?auto_11055 ?auto_11061 ) ) ( HAVE_IMAGE ?auto_11058 ?auto_11057 ) ( not ( = ?auto_11058 ?auto_11055 ) ) ( not ( = ?auto_11058 ?auto_11061 ) ) ( not ( = ?auto_11057 ?auto_11056 ) ) ( CALIBRATION_TARGET ?auto_11062 ?auto_11061 ) ( POINTING ?auto_11063 ?auto_11060 ) ( not ( = ?auto_11061 ?auto_11060 ) ) ( not ( = ?auto_11055 ?auto_11060 ) ) ( not ( = ?auto_11058 ?auto_11060 ) ) ( ON_BOARD ?auto_11064 ?auto_11063 ) ( POWER_ON ?auto_11064 ) ( not ( = ?auto_11062 ?auto_11064 ) ) ( HAVE_IMAGE ?auto_11060 ?auto_11059 ) ( not ( = ?auto_11056 ?auto_11059 ) ) ( not ( = ?auto_11057 ?auto_11059 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11058 ?auto_11057 ?auto_11055 ?auto_11056 )
      ( GET-3IMAGE-VERIFY ?auto_11055 ?auto_11056 ?auto_11058 ?auto_11057 ?auto_11060 ?auto_11059 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11076 - DIRECTION
      ?auto_11077 - MODE
      ?auto_11079 - DIRECTION
      ?auto_11078 - MODE
      ?auto_11081 - DIRECTION
      ?auto_11080 - MODE
    )
    :vars
    (
      ?auto_11083 - INSTRUMENT
      ?auto_11084 - SATELLITE
      ?auto_11082 - DIRECTION
      ?auto_11085 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11083 ?auto_11084 ) ( SUPPORTS ?auto_11083 ?auto_11077 ) ( not ( = ?auto_11076 ?auto_11082 ) ) ( HAVE_IMAGE ?auto_11081 ?auto_11080 ) ( not ( = ?auto_11081 ?auto_11076 ) ) ( not ( = ?auto_11081 ?auto_11082 ) ) ( not ( = ?auto_11080 ?auto_11077 ) ) ( CALIBRATION_TARGET ?auto_11083 ?auto_11082 ) ( POINTING ?auto_11084 ?auto_11079 ) ( not ( = ?auto_11082 ?auto_11079 ) ) ( not ( = ?auto_11076 ?auto_11079 ) ) ( not ( = ?auto_11081 ?auto_11079 ) ) ( ON_BOARD ?auto_11085 ?auto_11084 ) ( POWER_ON ?auto_11085 ) ( not ( = ?auto_11083 ?auto_11085 ) ) ( HAVE_IMAGE ?auto_11079 ?auto_11078 ) ( not ( = ?auto_11077 ?auto_11078 ) ) ( not ( = ?auto_11078 ?auto_11080 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11081 ?auto_11080 ?auto_11076 ?auto_11077 )
      ( GET-3IMAGE-VERIFY ?auto_11076 ?auto_11077 ?auto_11079 ?auto_11078 ?auto_11081 ?auto_11080 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11086 - DIRECTION
      ?auto_11087 - MODE
      ?auto_11089 - DIRECTION
      ?auto_11088 - MODE
      ?auto_11091 - DIRECTION
      ?auto_11090 - MODE
    )
    :vars
    (
      ?auto_11093 - INSTRUMENT
      ?auto_11096 - SATELLITE
      ?auto_11092 - DIRECTION
      ?auto_11095 - DIRECTION
      ?auto_11094 - MODE
      ?auto_11097 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11093 ?auto_11096 ) ( SUPPORTS ?auto_11093 ?auto_11087 ) ( not ( = ?auto_11086 ?auto_11092 ) ) ( HAVE_IMAGE ?auto_11095 ?auto_11094 ) ( not ( = ?auto_11095 ?auto_11086 ) ) ( not ( = ?auto_11095 ?auto_11092 ) ) ( not ( = ?auto_11094 ?auto_11087 ) ) ( CALIBRATION_TARGET ?auto_11093 ?auto_11092 ) ( POINTING ?auto_11096 ?auto_11091 ) ( not ( = ?auto_11092 ?auto_11091 ) ) ( not ( = ?auto_11086 ?auto_11091 ) ) ( not ( = ?auto_11095 ?auto_11091 ) ) ( ON_BOARD ?auto_11097 ?auto_11096 ) ( POWER_ON ?auto_11097 ) ( not ( = ?auto_11093 ?auto_11097 ) ) ( HAVE_IMAGE ?auto_11089 ?auto_11088 ) ( HAVE_IMAGE ?auto_11091 ?auto_11090 ) ( not ( = ?auto_11086 ?auto_11089 ) ) ( not ( = ?auto_11087 ?auto_11088 ) ) ( not ( = ?auto_11087 ?auto_11090 ) ) ( not ( = ?auto_11089 ?auto_11091 ) ) ( not ( = ?auto_11089 ?auto_11092 ) ) ( not ( = ?auto_11089 ?auto_11095 ) ) ( not ( = ?auto_11088 ?auto_11090 ) ) ( not ( = ?auto_11088 ?auto_11094 ) ) ( not ( = ?auto_11090 ?auto_11094 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11095 ?auto_11094 ?auto_11086 ?auto_11087 )
      ( GET-3IMAGE-VERIFY ?auto_11086 ?auto_11087 ?auto_11089 ?auto_11088 ?auto_11091 ?auto_11090 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_11146 - DIRECTION
      ?auto_11147 - MODE
    )
    :vars
    (
      ?auto_11150 - INSTRUMENT
      ?auto_11153 - SATELLITE
      ?auto_11148 - DIRECTION
      ?auto_11152 - DIRECTION
      ?auto_11151 - MODE
      ?auto_11149 - DIRECTION
      ?auto_11154 - INSTRUMENT
      ?auto_11155 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_11150 ?auto_11153 ) ( SUPPORTS ?auto_11150 ?auto_11147 ) ( not ( = ?auto_11146 ?auto_11148 ) ) ( HAVE_IMAGE ?auto_11152 ?auto_11151 ) ( not ( = ?auto_11152 ?auto_11146 ) ) ( not ( = ?auto_11152 ?auto_11148 ) ) ( not ( = ?auto_11151 ?auto_11147 ) ) ( CALIBRATION_TARGET ?auto_11150 ?auto_11148 ) ( POINTING ?auto_11153 ?auto_11149 ) ( not ( = ?auto_11148 ?auto_11149 ) ) ( not ( = ?auto_11146 ?auto_11149 ) ) ( not ( = ?auto_11152 ?auto_11149 ) ) ( ON_BOARD ?auto_11154 ?auto_11153 ) ( POWER_ON ?auto_11154 ) ( not ( = ?auto_11150 ?auto_11154 ) ) ( CALIBRATED ?auto_11154 ) ( SUPPORTS ?auto_11154 ?auto_11155 ) ( not ( = ?auto_11151 ?auto_11155 ) ) ( not ( = ?auto_11147 ?auto_11155 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11152 ?auto_11151 ?auto_11149 ?auto_11155 )
      ( GET-2IMAGE ?auto_11152 ?auto_11151 ?auto_11146 ?auto_11147 )
      ( GET-1IMAGE-VERIFY ?auto_11146 ?auto_11147 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_11156 - DIRECTION
      ?auto_11157 - MODE
      ?auto_11159 - DIRECTION
      ?auto_11158 - MODE
    )
    :vars
    (
      ?auto_11160 - INSTRUMENT
      ?auto_11161 - SATELLITE
      ?auto_11165 - DIRECTION
      ?auto_11164 - DIRECTION
      ?auto_11162 - INSTRUMENT
      ?auto_11163 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_11160 ?auto_11161 ) ( SUPPORTS ?auto_11160 ?auto_11158 ) ( not ( = ?auto_11159 ?auto_11165 ) ) ( HAVE_IMAGE ?auto_11156 ?auto_11157 ) ( not ( = ?auto_11156 ?auto_11159 ) ) ( not ( = ?auto_11156 ?auto_11165 ) ) ( not ( = ?auto_11157 ?auto_11158 ) ) ( CALIBRATION_TARGET ?auto_11160 ?auto_11165 ) ( POINTING ?auto_11161 ?auto_11164 ) ( not ( = ?auto_11165 ?auto_11164 ) ) ( not ( = ?auto_11159 ?auto_11164 ) ) ( not ( = ?auto_11156 ?auto_11164 ) ) ( ON_BOARD ?auto_11162 ?auto_11161 ) ( POWER_ON ?auto_11162 ) ( not ( = ?auto_11160 ?auto_11162 ) ) ( CALIBRATED ?auto_11162 ) ( SUPPORTS ?auto_11162 ?auto_11163 ) ( not ( = ?auto_11157 ?auto_11163 ) ) ( not ( = ?auto_11158 ?auto_11163 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_11159 ?auto_11158 )
      ( GET-2IMAGE-VERIFY ?auto_11156 ?auto_11157 ?auto_11159 ?auto_11158 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_11166 - DIRECTION
      ?auto_11167 - MODE
      ?auto_11169 - DIRECTION
      ?auto_11168 - MODE
    )
    :vars
    (
      ?auto_11175 - INSTRUMENT
      ?auto_11174 - SATELLITE
      ?auto_11173 - DIRECTION
      ?auto_11171 - DIRECTION
      ?auto_11170 - MODE
      ?auto_11172 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11175 ?auto_11174 ) ( SUPPORTS ?auto_11175 ?auto_11168 ) ( not ( = ?auto_11169 ?auto_11173 ) ) ( HAVE_IMAGE ?auto_11171 ?auto_11170 ) ( not ( = ?auto_11171 ?auto_11169 ) ) ( not ( = ?auto_11171 ?auto_11173 ) ) ( not ( = ?auto_11170 ?auto_11168 ) ) ( CALIBRATION_TARGET ?auto_11175 ?auto_11173 ) ( POINTING ?auto_11174 ?auto_11166 ) ( not ( = ?auto_11173 ?auto_11166 ) ) ( not ( = ?auto_11169 ?auto_11166 ) ) ( not ( = ?auto_11171 ?auto_11166 ) ) ( ON_BOARD ?auto_11172 ?auto_11174 ) ( POWER_ON ?auto_11172 ) ( not ( = ?auto_11175 ?auto_11172 ) ) ( CALIBRATED ?auto_11172 ) ( SUPPORTS ?auto_11172 ?auto_11167 ) ( not ( = ?auto_11170 ?auto_11167 ) ) ( not ( = ?auto_11168 ?auto_11167 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11171 ?auto_11170 ?auto_11169 ?auto_11168 )
      ( GET-2IMAGE-VERIFY ?auto_11166 ?auto_11167 ?auto_11169 ?auto_11168 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_11176 - DIRECTION
      ?auto_11177 - MODE
      ?auto_11179 - DIRECTION
      ?auto_11178 - MODE
    )
    :vars
    (
      ?auto_11185 - INSTRUMENT
      ?auto_11184 - SATELLITE
      ?auto_11181 - DIRECTION
      ?auto_11182 - DIRECTION
      ?auto_11180 - INSTRUMENT
      ?auto_11183 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_11185 ?auto_11184 ) ( SUPPORTS ?auto_11185 ?auto_11177 ) ( not ( = ?auto_11176 ?auto_11181 ) ) ( HAVE_IMAGE ?auto_11179 ?auto_11178 ) ( not ( = ?auto_11179 ?auto_11176 ) ) ( not ( = ?auto_11179 ?auto_11181 ) ) ( not ( = ?auto_11178 ?auto_11177 ) ) ( CALIBRATION_TARGET ?auto_11185 ?auto_11181 ) ( POINTING ?auto_11184 ?auto_11182 ) ( not ( = ?auto_11181 ?auto_11182 ) ) ( not ( = ?auto_11176 ?auto_11182 ) ) ( not ( = ?auto_11179 ?auto_11182 ) ) ( ON_BOARD ?auto_11180 ?auto_11184 ) ( POWER_ON ?auto_11180 ) ( not ( = ?auto_11185 ?auto_11180 ) ) ( CALIBRATED ?auto_11180 ) ( SUPPORTS ?auto_11180 ?auto_11183 ) ( not ( = ?auto_11178 ?auto_11183 ) ) ( not ( = ?auto_11177 ?auto_11183 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11179 ?auto_11178 ?auto_11176 ?auto_11177 )
      ( GET-2IMAGE-VERIFY ?auto_11176 ?auto_11177 ?auto_11179 ?auto_11178 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_11186 - DIRECTION
      ?auto_11187 - MODE
      ?auto_11189 - DIRECTION
      ?auto_11188 - MODE
    )
    :vars
    (
      ?auto_11195 - INSTRUMENT
      ?auto_11194 - SATELLITE
      ?auto_11193 - DIRECTION
      ?auto_11191 - DIRECTION
      ?auto_11190 - MODE
      ?auto_11192 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11195 ?auto_11194 ) ( SUPPORTS ?auto_11195 ?auto_11187 ) ( not ( = ?auto_11186 ?auto_11193 ) ) ( HAVE_IMAGE ?auto_11191 ?auto_11190 ) ( not ( = ?auto_11191 ?auto_11186 ) ) ( not ( = ?auto_11191 ?auto_11193 ) ) ( not ( = ?auto_11190 ?auto_11187 ) ) ( CALIBRATION_TARGET ?auto_11195 ?auto_11193 ) ( POINTING ?auto_11194 ?auto_11189 ) ( not ( = ?auto_11193 ?auto_11189 ) ) ( not ( = ?auto_11186 ?auto_11189 ) ) ( not ( = ?auto_11191 ?auto_11189 ) ) ( ON_BOARD ?auto_11192 ?auto_11194 ) ( POWER_ON ?auto_11192 ) ( not ( = ?auto_11195 ?auto_11192 ) ) ( CALIBRATED ?auto_11192 ) ( SUPPORTS ?auto_11192 ?auto_11188 ) ( not ( = ?auto_11190 ?auto_11188 ) ) ( not ( = ?auto_11187 ?auto_11188 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11191 ?auto_11190 ?auto_11186 ?auto_11187 )
      ( GET-2IMAGE-VERIFY ?auto_11186 ?auto_11187 ?auto_11189 ?auto_11188 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11208 - DIRECTION
      ?auto_11209 - MODE
      ?auto_11211 - DIRECTION
      ?auto_11210 - MODE
      ?auto_11213 - DIRECTION
      ?auto_11212 - MODE
    )
    :vars
    (
      ?auto_11219 - INSTRUMENT
      ?auto_11218 - SATELLITE
      ?auto_11215 - DIRECTION
      ?auto_11216 - DIRECTION
      ?auto_11214 - INSTRUMENT
      ?auto_11217 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_11219 ?auto_11218 ) ( SUPPORTS ?auto_11219 ?auto_11212 ) ( not ( = ?auto_11213 ?auto_11215 ) ) ( HAVE_IMAGE ?auto_11211 ?auto_11210 ) ( not ( = ?auto_11211 ?auto_11213 ) ) ( not ( = ?auto_11211 ?auto_11215 ) ) ( not ( = ?auto_11210 ?auto_11212 ) ) ( CALIBRATION_TARGET ?auto_11219 ?auto_11215 ) ( POINTING ?auto_11218 ?auto_11216 ) ( not ( = ?auto_11215 ?auto_11216 ) ) ( not ( = ?auto_11213 ?auto_11216 ) ) ( not ( = ?auto_11211 ?auto_11216 ) ) ( ON_BOARD ?auto_11214 ?auto_11218 ) ( POWER_ON ?auto_11214 ) ( not ( = ?auto_11219 ?auto_11214 ) ) ( CALIBRATED ?auto_11214 ) ( SUPPORTS ?auto_11214 ?auto_11217 ) ( not ( = ?auto_11210 ?auto_11217 ) ) ( not ( = ?auto_11212 ?auto_11217 ) ) ( HAVE_IMAGE ?auto_11208 ?auto_11209 ) ( not ( = ?auto_11208 ?auto_11211 ) ) ( not ( = ?auto_11208 ?auto_11213 ) ) ( not ( = ?auto_11208 ?auto_11215 ) ) ( not ( = ?auto_11208 ?auto_11216 ) ) ( not ( = ?auto_11209 ?auto_11210 ) ) ( not ( = ?auto_11209 ?auto_11212 ) ) ( not ( = ?auto_11209 ?auto_11217 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11211 ?auto_11210 ?auto_11213 ?auto_11212 )
      ( GET-3IMAGE-VERIFY ?auto_11208 ?auto_11209 ?auto_11211 ?auto_11210 ?auto_11213 ?auto_11212 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11220 - DIRECTION
      ?auto_11221 - MODE
      ?auto_11223 - DIRECTION
      ?auto_11222 - MODE
      ?auto_11225 - DIRECTION
      ?auto_11224 - MODE
    )
    :vars
    (
      ?auto_11229 - INSTRUMENT
      ?auto_11228 - SATELLITE
      ?auto_11227 - DIRECTION
      ?auto_11226 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11229 ?auto_11228 ) ( SUPPORTS ?auto_11229 ?auto_11224 ) ( not ( = ?auto_11225 ?auto_11227 ) ) ( HAVE_IMAGE ?auto_11220 ?auto_11221 ) ( not ( = ?auto_11220 ?auto_11225 ) ) ( not ( = ?auto_11220 ?auto_11227 ) ) ( not ( = ?auto_11221 ?auto_11224 ) ) ( CALIBRATION_TARGET ?auto_11229 ?auto_11227 ) ( POINTING ?auto_11228 ?auto_11223 ) ( not ( = ?auto_11227 ?auto_11223 ) ) ( not ( = ?auto_11225 ?auto_11223 ) ) ( not ( = ?auto_11220 ?auto_11223 ) ) ( ON_BOARD ?auto_11226 ?auto_11228 ) ( POWER_ON ?auto_11226 ) ( not ( = ?auto_11229 ?auto_11226 ) ) ( CALIBRATED ?auto_11226 ) ( SUPPORTS ?auto_11226 ?auto_11222 ) ( not ( = ?auto_11221 ?auto_11222 ) ) ( not ( = ?auto_11224 ?auto_11222 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11220 ?auto_11221 ?auto_11225 ?auto_11224 )
      ( GET-3IMAGE-VERIFY ?auto_11220 ?auto_11221 ?auto_11223 ?auto_11222 ?auto_11225 ?auto_11224 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11230 - DIRECTION
      ?auto_11231 - MODE
      ?auto_11233 - DIRECTION
      ?auto_11232 - MODE
      ?auto_11235 - DIRECTION
      ?auto_11234 - MODE
    )
    :vars
    (
      ?auto_11241 - INSTRUMENT
      ?auto_11240 - SATELLITE
      ?auto_11237 - DIRECTION
      ?auto_11238 - DIRECTION
      ?auto_11236 - INSTRUMENT
      ?auto_11239 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_11241 ?auto_11240 ) ( SUPPORTS ?auto_11241 ?auto_11232 ) ( not ( = ?auto_11233 ?auto_11237 ) ) ( HAVE_IMAGE ?auto_11235 ?auto_11234 ) ( not ( = ?auto_11235 ?auto_11233 ) ) ( not ( = ?auto_11235 ?auto_11237 ) ) ( not ( = ?auto_11234 ?auto_11232 ) ) ( CALIBRATION_TARGET ?auto_11241 ?auto_11237 ) ( POINTING ?auto_11240 ?auto_11238 ) ( not ( = ?auto_11237 ?auto_11238 ) ) ( not ( = ?auto_11233 ?auto_11238 ) ) ( not ( = ?auto_11235 ?auto_11238 ) ) ( ON_BOARD ?auto_11236 ?auto_11240 ) ( POWER_ON ?auto_11236 ) ( not ( = ?auto_11241 ?auto_11236 ) ) ( CALIBRATED ?auto_11236 ) ( SUPPORTS ?auto_11236 ?auto_11239 ) ( not ( = ?auto_11234 ?auto_11239 ) ) ( not ( = ?auto_11232 ?auto_11239 ) ) ( HAVE_IMAGE ?auto_11230 ?auto_11231 ) ( not ( = ?auto_11230 ?auto_11233 ) ) ( not ( = ?auto_11230 ?auto_11235 ) ) ( not ( = ?auto_11230 ?auto_11237 ) ) ( not ( = ?auto_11230 ?auto_11238 ) ) ( not ( = ?auto_11231 ?auto_11232 ) ) ( not ( = ?auto_11231 ?auto_11234 ) ) ( not ( = ?auto_11231 ?auto_11239 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11235 ?auto_11234 ?auto_11233 ?auto_11232 )
      ( GET-3IMAGE-VERIFY ?auto_11230 ?auto_11231 ?auto_11233 ?auto_11232 ?auto_11235 ?auto_11234 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11242 - DIRECTION
      ?auto_11243 - MODE
      ?auto_11245 - DIRECTION
      ?auto_11244 - MODE
      ?auto_11247 - DIRECTION
      ?auto_11246 - MODE
    )
    :vars
    (
      ?auto_11251 - INSTRUMENT
      ?auto_11250 - SATELLITE
      ?auto_11249 - DIRECTION
      ?auto_11248 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11251 ?auto_11250 ) ( SUPPORTS ?auto_11251 ?auto_11244 ) ( not ( = ?auto_11245 ?auto_11249 ) ) ( HAVE_IMAGE ?auto_11242 ?auto_11243 ) ( not ( = ?auto_11242 ?auto_11245 ) ) ( not ( = ?auto_11242 ?auto_11249 ) ) ( not ( = ?auto_11243 ?auto_11244 ) ) ( CALIBRATION_TARGET ?auto_11251 ?auto_11249 ) ( POINTING ?auto_11250 ?auto_11247 ) ( not ( = ?auto_11249 ?auto_11247 ) ) ( not ( = ?auto_11245 ?auto_11247 ) ) ( not ( = ?auto_11242 ?auto_11247 ) ) ( ON_BOARD ?auto_11248 ?auto_11250 ) ( POWER_ON ?auto_11248 ) ( not ( = ?auto_11251 ?auto_11248 ) ) ( CALIBRATED ?auto_11248 ) ( SUPPORTS ?auto_11248 ?auto_11246 ) ( not ( = ?auto_11243 ?auto_11246 ) ) ( not ( = ?auto_11244 ?auto_11246 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11242 ?auto_11243 ?auto_11245 ?auto_11244 )
      ( GET-3IMAGE-VERIFY ?auto_11242 ?auto_11243 ?auto_11245 ?auto_11244 ?auto_11247 ?auto_11246 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11264 - DIRECTION
      ?auto_11265 - MODE
      ?auto_11267 - DIRECTION
      ?auto_11266 - MODE
      ?auto_11269 - DIRECTION
      ?auto_11268 - MODE
    )
    :vars
    (
      ?auto_11273 - INSTRUMENT
      ?auto_11272 - SATELLITE
      ?auto_11271 - DIRECTION
      ?auto_11270 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11273 ?auto_11272 ) ( SUPPORTS ?auto_11273 ?auto_11268 ) ( not ( = ?auto_11269 ?auto_11271 ) ) ( HAVE_IMAGE ?auto_11267 ?auto_11266 ) ( not ( = ?auto_11267 ?auto_11269 ) ) ( not ( = ?auto_11267 ?auto_11271 ) ) ( not ( = ?auto_11266 ?auto_11268 ) ) ( CALIBRATION_TARGET ?auto_11273 ?auto_11271 ) ( POINTING ?auto_11272 ?auto_11264 ) ( not ( = ?auto_11271 ?auto_11264 ) ) ( not ( = ?auto_11269 ?auto_11264 ) ) ( not ( = ?auto_11267 ?auto_11264 ) ) ( ON_BOARD ?auto_11270 ?auto_11272 ) ( POWER_ON ?auto_11270 ) ( not ( = ?auto_11273 ?auto_11270 ) ) ( CALIBRATED ?auto_11270 ) ( SUPPORTS ?auto_11270 ?auto_11265 ) ( not ( = ?auto_11266 ?auto_11265 ) ) ( not ( = ?auto_11268 ?auto_11265 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11267 ?auto_11266 ?auto_11269 ?auto_11268 )
      ( GET-3IMAGE-VERIFY ?auto_11264 ?auto_11265 ?auto_11267 ?auto_11266 ?auto_11269 ?auto_11268 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11286 - DIRECTION
      ?auto_11287 - MODE
      ?auto_11289 - DIRECTION
      ?auto_11288 - MODE
      ?auto_11291 - DIRECTION
      ?auto_11290 - MODE
    )
    :vars
    (
      ?auto_11295 - INSTRUMENT
      ?auto_11294 - SATELLITE
      ?auto_11293 - DIRECTION
      ?auto_11292 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11295 ?auto_11294 ) ( SUPPORTS ?auto_11295 ?auto_11288 ) ( not ( = ?auto_11289 ?auto_11293 ) ) ( HAVE_IMAGE ?auto_11291 ?auto_11290 ) ( not ( = ?auto_11291 ?auto_11289 ) ) ( not ( = ?auto_11291 ?auto_11293 ) ) ( not ( = ?auto_11290 ?auto_11288 ) ) ( CALIBRATION_TARGET ?auto_11295 ?auto_11293 ) ( POINTING ?auto_11294 ?auto_11286 ) ( not ( = ?auto_11293 ?auto_11286 ) ) ( not ( = ?auto_11289 ?auto_11286 ) ) ( not ( = ?auto_11291 ?auto_11286 ) ) ( ON_BOARD ?auto_11292 ?auto_11294 ) ( POWER_ON ?auto_11292 ) ( not ( = ?auto_11295 ?auto_11292 ) ) ( CALIBRATED ?auto_11292 ) ( SUPPORTS ?auto_11292 ?auto_11287 ) ( not ( = ?auto_11290 ?auto_11287 ) ) ( not ( = ?auto_11288 ?auto_11287 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11291 ?auto_11290 ?auto_11289 ?auto_11288 )
      ( GET-3IMAGE-VERIFY ?auto_11286 ?auto_11287 ?auto_11289 ?auto_11288 ?auto_11291 ?auto_11290 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11320 - DIRECTION
      ?auto_11321 - MODE
      ?auto_11323 - DIRECTION
      ?auto_11322 - MODE
      ?auto_11325 - DIRECTION
      ?auto_11324 - MODE
    )
    :vars
    (
      ?auto_11331 - INSTRUMENT
      ?auto_11330 - SATELLITE
      ?auto_11327 - DIRECTION
      ?auto_11328 - DIRECTION
      ?auto_11326 - INSTRUMENT
      ?auto_11329 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_11331 ?auto_11330 ) ( SUPPORTS ?auto_11331 ?auto_11321 ) ( not ( = ?auto_11320 ?auto_11327 ) ) ( HAVE_IMAGE ?auto_11325 ?auto_11322 ) ( not ( = ?auto_11325 ?auto_11320 ) ) ( not ( = ?auto_11325 ?auto_11327 ) ) ( not ( = ?auto_11322 ?auto_11321 ) ) ( CALIBRATION_TARGET ?auto_11331 ?auto_11327 ) ( POINTING ?auto_11330 ?auto_11328 ) ( not ( = ?auto_11327 ?auto_11328 ) ) ( not ( = ?auto_11320 ?auto_11328 ) ) ( not ( = ?auto_11325 ?auto_11328 ) ) ( ON_BOARD ?auto_11326 ?auto_11330 ) ( POWER_ON ?auto_11326 ) ( not ( = ?auto_11331 ?auto_11326 ) ) ( CALIBRATED ?auto_11326 ) ( SUPPORTS ?auto_11326 ?auto_11329 ) ( not ( = ?auto_11322 ?auto_11329 ) ) ( not ( = ?auto_11321 ?auto_11329 ) ) ( HAVE_IMAGE ?auto_11323 ?auto_11322 ) ( HAVE_IMAGE ?auto_11325 ?auto_11324 ) ( not ( = ?auto_11320 ?auto_11323 ) ) ( not ( = ?auto_11321 ?auto_11324 ) ) ( not ( = ?auto_11323 ?auto_11325 ) ) ( not ( = ?auto_11323 ?auto_11327 ) ) ( not ( = ?auto_11323 ?auto_11328 ) ) ( not ( = ?auto_11322 ?auto_11324 ) ) ( not ( = ?auto_11324 ?auto_11329 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11325 ?auto_11322 ?auto_11320 ?auto_11321 )
      ( GET-3IMAGE-VERIFY ?auto_11320 ?auto_11321 ?auto_11323 ?auto_11322 ?auto_11325 ?auto_11324 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11332 - DIRECTION
      ?auto_11333 - MODE
      ?auto_11335 - DIRECTION
      ?auto_11334 - MODE
      ?auto_11337 - DIRECTION
      ?auto_11336 - MODE
    )
    :vars
    (
      ?auto_11341 - INSTRUMENT
      ?auto_11340 - SATELLITE
      ?auto_11339 - DIRECTION
      ?auto_11338 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11341 ?auto_11340 ) ( SUPPORTS ?auto_11341 ?auto_11333 ) ( not ( = ?auto_11332 ?auto_11339 ) ) ( HAVE_IMAGE ?auto_11335 ?auto_11334 ) ( not ( = ?auto_11335 ?auto_11332 ) ) ( not ( = ?auto_11335 ?auto_11339 ) ) ( not ( = ?auto_11334 ?auto_11333 ) ) ( CALIBRATION_TARGET ?auto_11341 ?auto_11339 ) ( POINTING ?auto_11340 ?auto_11337 ) ( not ( = ?auto_11339 ?auto_11337 ) ) ( not ( = ?auto_11332 ?auto_11337 ) ) ( not ( = ?auto_11335 ?auto_11337 ) ) ( ON_BOARD ?auto_11338 ?auto_11340 ) ( POWER_ON ?auto_11338 ) ( not ( = ?auto_11341 ?auto_11338 ) ) ( CALIBRATED ?auto_11338 ) ( SUPPORTS ?auto_11338 ?auto_11336 ) ( not ( = ?auto_11334 ?auto_11336 ) ) ( not ( = ?auto_11333 ?auto_11336 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11335 ?auto_11334 ?auto_11332 ?auto_11333 )
      ( GET-3IMAGE-VERIFY ?auto_11332 ?auto_11333 ?auto_11335 ?auto_11334 ?auto_11337 ?auto_11336 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11354 - DIRECTION
      ?auto_11355 - MODE
      ?auto_11357 - DIRECTION
      ?auto_11356 - MODE
      ?auto_11359 - DIRECTION
      ?auto_11358 - MODE
    )
    :vars
    (
      ?auto_11363 - INSTRUMENT
      ?auto_11362 - SATELLITE
      ?auto_11361 - DIRECTION
      ?auto_11360 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11363 ?auto_11362 ) ( SUPPORTS ?auto_11363 ?auto_11355 ) ( not ( = ?auto_11354 ?auto_11361 ) ) ( HAVE_IMAGE ?auto_11359 ?auto_11358 ) ( not ( = ?auto_11359 ?auto_11354 ) ) ( not ( = ?auto_11359 ?auto_11361 ) ) ( not ( = ?auto_11358 ?auto_11355 ) ) ( CALIBRATION_TARGET ?auto_11363 ?auto_11361 ) ( POINTING ?auto_11362 ?auto_11357 ) ( not ( = ?auto_11361 ?auto_11357 ) ) ( not ( = ?auto_11354 ?auto_11357 ) ) ( not ( = ?auto_11359 ?auto_11357 ) ) ( ON_BOARD ?auto_11360 ?auto_11362 ) ( POWER_ON ?auto_11360 ) ( not ( = ?auto_11363 ?auto_11360 ) ) ( CALIBRATED ?auto_11360 ) ( SUPPORTS ?auto_11360 ?auto_11356 ) ( not ( = ?auto_11358 ?auto_11356 ) ) ( not ( = ?auto_11355 ?auto_11356 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11359 ?auto_11358 ?auto_11354 ?auto_11355 )
      ( GET-3IMAGE-VERIFY ?auto_11354 ?auto_11355 ?auto_11357 ?auto_11356 ?auto_11359 ?auto_11358 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_11426 - DIRECTION
      ?auto_11427 - MODE
    )
    :vars
    (
      ?auto_11435 - INSTRUMENT
      ?auto_11434 - SATELLITE
      ?auto_11431 - DIRECTION
      ?auto_11429 - DIRECTION
      ?auto_11428 - MODE
      ?auto_11432 - DIRECTION
      ?auto_11430 - INSTRUMENT
      ?auto_11433 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_11435 ?auto_11434 ) ( SUPPORTS ?auto_11435 ?auto_11427 ) ( not ( = ?auto_11426 ?auto_11431 ) ) ( HAVE_IMAGE ?auto_11429 ?auto_11428 ) ( not ( = ?auto_11429 ?auto_11426 ) ) ( not ( = ?auto_11429 ?auto_11431 ) ) ( not ( = ?auto_11428 ?auto_11427 ) ) ( CALIBRATION_TARGET ?auto_11435 ?auto_11431 ) ( not ( = ?auto_11431 ?auto_11432 ) ) ( not ( = ?auto_11426 ?auto_11432 ) ) ( not ( = ?auto_11429 ?auto_11432 ) ) ( ON_BOARD ?auto_11430 ?auto_11434 ) ( POWER_ON ?auto_11430 ) ( not ( = ?auto_11435 ?auto_11430 ) ) ( CALIBRATED ?auto_11430 ) ( SUPPORTS ?auto_11430 ?auto_11433 ) ( not ( = ?auto_11428 ?auto_11433 ) ) ( not ( = ?auto_11427 ?auto_11433 ) ) ( POINTING ?auto_11434 ?auto_11431 ) )
    :subtasks
    ( ( !TURN_TO ?auto_11434 ?auto_11432 ?auto_11431 )
      ( GET-2IMAGE ?auto_11429 ?auto_11428 ?auto_11426 ?auto_11427 )
      ( GET-1IMAGE-VERIFY ?auto_11426 ?auto_11427 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_11436 - DIRECTION
      ?auto_11437 - MODE
      ?auto_11439 - DIRECTION
      ?auto_11438 - MODE
    )
    :vars
    (
      ?auto_11444 - INSTRUMENT
      ?auto_11442 - SATELLITE
      ?auto_11443 - DIRECTION
      ?auto_11441 - DIRECTION
      ?auto_11440 - INSTRUMENT
      ?auto_11445 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_11444 ?auto_11442 ) ( SUPPORTS ?auto_11444 ?auto_11438 ) ( not ( = ?auto_11439 ?auto_11443 ) ) ( HAVE_IMAGE ?auto_11436 ?auto_11437 ) ( not ( = ?auto_11436 ?auto_11439 ) ) ( not ( = ?auto_11436 ?auto_11443 ) ) ( not ( = ?auto_11437 ?auto_11438 ) ) ( CALIBRATION_TARGET ?auto_11444 ?auto_11443 ) ( not ( = ?auto_11443 ?auto_11441 ) ) ( not ( = ?auto_11439 ?auto_11441 ) ) ( not ( = ?auto_11436 ?auto_11441 ) ) ( ON_BOARD ?auto_11440 ?auto_11442 ) ( POWER_ON ?auto_11440 ) ( not ( = ?auto_11444 ?auto_11440 ) ) ( CALIBRATED ?auto_11440 ) ( SUPPORTS ?auto_11440 ?auto_11445 ) ( not ( = ?auto_11437 ?auto_11445 ) ) ( not ( = ?auto_11438 ?auto_11445 ) ) ( POINTING ?auto_11442 ?auto_11443 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_11439 ?auto_11438 )
      ( GET-2IMAGE-VERIFY ?auto_11436 ?auto_11437 ?auto_11439 ?auto_11438 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_11446 - DIRECTION
      ?auto_11447 - MODE
      ?auto_11449 - DIRECTION
      ?auto_11448 - MODE
    )
    :vars
    (
      ?auto_11450 - INSTRUMENT
      ?auto_11451 - SATELLITE
      ?auto_11455 - DIRECTION
      ?auto_11453 - DIRECTION
      ?auto_11452 - MODE
      ?auto_11454 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11450 ?auto_11451 ) ( SUPPORTS ?auto_11450 ?auto_11448 ) ( not ( = ?auto_11449 ?auto_11455 ) ) ( HAVE_IMAGE ?auto_11453 ?auto_11452 ) ( not ( = ?auto_11453 ?auto_11449 ) ) ( not ( = ?auto_11453 ?auto_11455 ) ) ( not ( = ?auto_11452 ?auto_11448 ) ) ( CALIBRATION_TARGET ?auto_11450 ?auto_11455 ) ( not ( = ?auto_11455 ?auto_11446 ) ) ( not ( = ?auto_11449 ?auto_11446 ) ) ( not ( = ?auto_11453 ?auto_11446 ) ) ( ON_BOARD ?auto_11454 ?auto_11451 ) ( POWER_ON ?auto_11454 ) ( not ( = ?auto_11450 ?auto_11454 ) ) ( CALIBRATED ?auto_11454 ) ( SUPPORTS ?auto_11454 ?auto_11447 ) ( not ( = ?auto_11452 ?auto_11447 ) ) ( not ( = ?auto_11448 ?auto_11447 ) ) ( POINTING ?auto_11451 ?auto_11455 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11453 ?auto_11452 ?auto_11449 ?auto_11448 )
      ( GET-2IMAGE-VERIFY ?auto_11446 ?auto_11447 ?auto_11449 ?auto_11448 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_11456 - DIRECTION
      ?auto_11457 - MODE
      ?auto_11459 - DIRECTION
      ?auto_11458 - MODE
    )
    :vars
    (
      ?auto_11460 - INSTRUMENT
      ?auto_11461 - SATELLITE
      ?auto_11465 - DIRECTION
      ?auto_11463 - DIRECTION
      ?auto_11464 - INSTRUMENT
      ?auto_11462 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_11460 ?auto_11461 ) ( SUPPORTS ?auto_11460 ?auto_11457 ) ( not ( = ?auto_11456 ?auto_11465 ) ) ( HAVE_IMAGE ?auto_11459 ?auto_11458 ) ( not ( = ?auto_11459 ?auto_11456 ) ) ( not ( = ?auto_11459 ?auto_11465 ) ) ( not ( = ?auto_11458 ?auto_11457 ) ) ( CALIBRATION_TARGET ?auto_11460 ?auto_11465 ) ( not ( = ?auto_11465 ?auto_11463 ) ) ( not ( = ?auto_11456 ?auto_11463 ) ) ( not ( = ?auto_11459 ?auto_11463 ) ) ( ON_BOARD ?auto_11464 ?auto_11461 ) ( POWER_ON ?auto_11464 ) ( not ( = ?auto_11460 ?auto_11464 ) ) ( CALIBRATED ?auto_11464 ) ( SUPPORTS ?auto_11464 ?auto_11462 ) ( not ( = ?auto_11458 ?auto_11462 ) ) ( not ( = ?auto_11457 ?auto_11462 ) ) ( POINTING ?auto_11461 ?auto_11465 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11459 ?auto_11458 ?auto_11456 ?auto_11457 )
      ( GET-2IMAGE-VERIFY ?auto_11456 ?auto_11457 ?auto_11459 ?auto_11458 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_11466 - DIRECTION
      ?auto_11467 - MODE
      ?auto_11469 - DIRECTION
      ?auto_11468 - MODE
    )
    :vars
    (
      ?auto_11470 - INSTRUMENT
      ?auto_11471 - SATELLITE
      ?auto_11475 - DIRECTION
      ?auto_11473 - DIRECTION
      ?auto_11472 - MODE
      ?auto_11474 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11470 ?auto_11471 ) ( SUPPORTS ?auto_11470 ?auto_11467 ) ( not ( = ?auto_11466 ?auto_11475 ) ) ( HAVE_IMAGE ?auto_11473 ?auto_11472 ) ( not ( = ?auto_11473 ?auto_11466 ) ) ( not ( = ?auto_11473 ?auto_11475 ) ) ( not ( = ?auto_11472 ?auto_11467 ) ) ( CALIBRATION_TARGET ?auto_11470 ?auto_11475 ) ( not ( = ?auto_11475 ?auto_11469 ) ) ( not ( = ?auto_11466 ?auto_11469 ) ) ( not ( = ?auto_11473 ?auto_11469 ) ) ( ON_BOARD ?auto_11474 ?auto_11471 ) ( POWER_ON ?auto_11474 ) ( not ( = ?auto_11470 ?auto_11474 ) ) ( CALIBRATED ?auto_11474 ) ( SUPPORTS ?auto_11474 ?auto_11468 ) ( not ( = ?auto_11472 ?auto_11468 ) ) ( not ( = ?auto_11467 ?auto_11468 ) ) ( POINTING ?auto_11471 ?auto_11475 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11473 ?auto_11472 ?auto_11466 ?auto_11467 )
      ( GET-2IMAGE-VERIFY ?auto_11466 ?auto_11467 ?auto_11469 ?auto_11468 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11488 - DIRECTION
      ?auto_11489 - MODE
      ?auto_11491 - DIRECTION
      ?auto_11490 - MODE
      ?auto_11493 - DIRECTION
      ?auto_11492 - MODE
    )
    :vars
    (
      ?auto_11494 - INSTRUMENT
      ?auto_11495 - SATELLITE
      ?auto_11499 - DIRECTION
      ?auto_11497 - DIRECTION
      ?auto_11498 - INSTRUMENT
      ?auto_11496 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_11494 ?auto_11495 ) ( SUPPORTS ?auto_11494 ?auto_11492 ) ( not ( = ?auto_11493 ?auto_11499 ) ) ( HAVE_IMAGE ?auto_11491 ?auto_11490 ) ( not ( = ?auto_11491 ?auto_11493 ) ) ( not ( = ?auto_11491 ?auto_11499 ) ) ( not ( = ?auto_11490 ?auto_11492 ) ) ( CALIBRATION_TARGET ?auto_11494 ?auto_11499 ) ( not ( = ?auto_11499 ?auto_11497 ) ) ( not ( = ?auto_11493 ?auto_11497 ) ) ( not ( = ?auto_11491 ?auto_11497 ) ) ( ON_BOARD ?auto_11498 ?auto_11495 ) ( POWER_ON ?auto_11498 ) ( not ( = ?auto_11494 ?auto_11498 ) ) ( CALIBRATED ?auto_11498 ) ( SUPPORTS ?auto_11498 ?auto_11496 ) ( not ( = ?auto_11490 ?auto_11496 ) ) ( not ( = ?auto_11492 ?auto_11496 ) ) ( POINTING ?auto_11495 ?auto_11499 ) ( HAVE_IMAGE ?auto_11488 ?auto_11489 ) ( not ( = ?auto_11488 ?auto_11491 ) ) ( not ( = ?auto_11488 ?auto_11493 ) ) ( not ( = ?auto_11488 ?auto_11499 ) ) ( not ( = ?auto_11488 ?auto_11497 ) ) ( not ( = ?auto_11489 ?auto_11490 ) ) ( not ( = ?auto_11489 ?auto_11492 ) ) ( not ( = ?auto_11489 ?auto_11496 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11491 ?auto_11490 ?auto_11493 ?auto_11492 )
      ( GET-3IMAGE-VERIFY ?auto_11488 ?auto_11489 ?auto_11491 ?auto_11490 ?auto_11493 ?auto_11492 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11500 - DIRECTION
      ?auto_11501 - MODE
      ?auto_11503 - DIRECTION
      ?auto_11502 - MODE
      ?auto_11505 - DIRECTION
      ?auto_11504 - MODE
    )
    :vars
    (
      ?auto_11506 - INSTRUMENT
      ?auto_11507 - SATELLITE
      ?auto_11509 - DIRECTION
      ?auto_11508 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11506 ?auto_11507 ) ( SUPPORTS ?auto_11506 ?auto_11504 ) ( not ( = ?auto_11505 ?auto_11509 ) ) ( HAVE_IMAGE ?auto_11500 ?auto_11501 ) ( not ( = ?auto_11500 ?auto_11505 ) ) ( not ( = ?auto_11500 ?auto_11509 ) ) ( not ( = ?auto_11501 ?auto_11504 ) ) ( CALIBRATION_TARGET ?auto_11506 ?auto_11509 ) ( not ( = ?auto_11509 ?auto_11503 ) ) ( not ( = ?auto_11505 ?auto_11503 ) ) ( not ( = ?auto_11500 ?auto_11503 ) ) ( ON_BOARD ?auto_11508 ?auto_11507 ) ( POWER_ON ?auto_11508 ) ( not ( = ?auto_11506 ?auto_11508 ) ) ( CALIBRATED ?auto_11508 ) ( SUPPORTS ?auto_11508 ?auto_11502 ) ( not ( = ?auto_11501 ?auto_11502 ) ) ( not ( = ?auto_11504 ?auto_11502 ) ) ( POINTING ?auto_11507 ?auto_11509 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11500 ?auto_11501 ?auto_11505 ?auto_11504 )
      ( GET-3IMAGE-VERIFY ?auto_11500 ?auto_11501 ?auto_11503 ?auto_11502 ?auto_11505 ?auto_11504 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11510 - DIRECTION
      ?auto_11511 - MODE
      ?auto_11513 - DIRECTION
      ?auto_11512 - MODE
      ?auto_11515 - DIRECTION
      ?auto_11514 - MODE
    )
    :vars
    (
      ?auto_11516 - INSTRUMENT
      ?auto_11517 - SATELLITE
      ?auto_11521 - DIRECTION
      ?auto_11519 - DIRECTION
      ?auto_11520 - INSTRUMENT
      ?auto_11518 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_11516 ?auto_11517 ) ( SUPPORTS ?auto_11516 ?auto_11512 ) ( not ( = ?auto_11513 ?auto_11521 ) ) ( HAVE_IMAGE ?auto_11515 ?auto_11514 ) ( not ( = ?auto_11515 ?auto_11513 ) ) ( not ( = ?auto_11515 ?auto_11521 ) ) ( not ( = ?auto_11514 ?auto_11512 ) ) ( CALIBRATION_TARGET ?auto_11516 ?auto_11521 ) ( not ( = ?auto_11521 ?auto_11519 ) ) ( not ( = ?auto_11513 ?auto_11519 ) ) ( not ( = ?auto_11515 ?auto_11519 ) ) ( ON_BOARD ?auto_11520 ?auto_11517 ) ( POWER_ON ?auto_11520 ) ( not ( = ?auto_11516 ?auto_11520 ) ) ( CALIBRATED ?auto_11520 ) ( SUPPORTS ?auto_11520 ?auto_11518 ) ( not ( = ?auto_11514 ?auto_11518 ) ) ( not ( = ?auto_11512 ?auto_11518 ) ) ( POINTING ?auto_11517 ?auto_11521 ) ( HAVE_IMAGE ?auto_11510 ?auto_11511 ) ( not ( = ?auto_11510 ?auto_11513 ) ) ( not ( = ?auto_11510 ?auto_11515 ) ) ( not ( = ?auto_11510 ?auto_11521 ) ) ( not ( = ?auto_11510 ?auto_11519 ) ) ( not ( = ?auto_11511 ?auto_11512 ) ) ( not ( = ?auto_11511 ?auto_11514 ) ) ( not ( = ?auto_11511 ?auto_11518 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11515 ?auto_11514 ?auto_11513 ?auto_11512 )
      ( GET-3IMAGE-VERIFY ?auto_11510 ?auto_11511 ?auto_11513 ?auto_11512 ?auto_11515 ?auto_11514 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11522 - DIRECTION
      ?auto_11523 - MODE
      ?auto_11525 - DIRECTION
      ?auto_11524 - MODE
      ?auto_11527 - DIRECTION
      ?auto_11526 - MODE
    )
    :vars
    (
      ?auto_11528 - INSTRUMENT
      ?auto_11529 - SATELLITE
      ?auto_11531 - DIRECTION
      ?auto_11530 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11528 ?auto_11529 ) ( SUPPORTS ?auto_11528 ?auto_11524 ) ( not ( = ?auto_11525 ?auto_11531 ) ) ( HAVE_IMAGE ?auto_11522 ?auto_11523 ) ( not ( = ?auto_11522 ?auto_11525 ) ) ( not ( = ?auto_11522 ?auto_11531 ) ) ( not ( = ?auto_11523 ?auto_11524 ) ) ( CALIBRATION_TARGET ?auto_11528 ?auto_11531 ) ( not ( = ?auto_11531 ?auto_11527 ) ) ( not ( = ?auto_11525 ?auto_11527 ) ) ( not ( = ?auto_11522 ?auto_11527 ) ) ( ON_BOARD ?auto_11530 ?auto_11529 ) ( POWER_ON ?auto_11530 ) ( not ( = ?auto_11528 ?auto_11530 ) ) ( CALIBRATED ?auto_11530 ) ( SUPPORTS ?auto_11530 ?auto_11526 ) ( not ( = ?auto_11523 ?auto_11526 ) ) ( not ( = ?auto_11524 ?auto_11526 ) ) ( POINTING ?auto_11529 ?auto_11531 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11522 ?auto_11523 ?auto_11525 ?auto_11524 )
      ( GET-3IMAGE-VERIFY ?auto_11522 ?auto_11523 ?auto_11525 ?auto_11524 ?auto_11527 ?auto_11526 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11544 - DIRECTION
      ?auto_11545 - MODE
      ?auto_11547 - DIRECTION
      ?auto_11546 - MODE
      ?auto_11549 - DIRECTION
      ?auto_11548 - MODE
    )
    :vars
    (
      ?auto_11550 - INSTRUMENT
      ?auto_11551 - SATELLITE
      ?auto_11553 - DIRECTION
      ?auto_11552 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11550 ?auto_11551 ) ( SUPPORTS ?auto_11550 ?auto_11548 ) ( not ( = ?auto_11549 ?auto_11553 ) ) ( HAVE_IMAGE ?auto_11547 ?auto_11546 ) ( not ( = ?auto_11547 ?auto_11549 ) ) ( not ( = ?auto_11547 ?auto_11553 ) ) ( not ( = ?auto_11546 ?auto_11548 ) ) ( CALIBRATION_TARGET ?auto_11550 ?auto_11553 ) ( not ( = ?auto_11553 ?auto_11544 ) ) ( not ( = ?auto_11549 ?auto_11544 ) ) ( not ( = ?auto_11547 ?auto_11544 ) ) ( ON_BOARD ?auto_11552 ?auto_11551 ) ( POWER_ON ?auto_11552 ) ( not ( = ?auto_11550 ?auto_11552 ) ) ( CALIBRATED ?auto_11552 ) ( SUPPORTS ?auto_11552 ?auto_11545 ) ( not ( = ?auto_11546 ?auto_11545 ) ) ( not ( = ?auto_11548 ?auto_11545 ) ) ( POINTING ?auto_11551 ?auto_11553 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11547 ?auto_11546 ?auto_11549 ?auto_11548 )
      ( GET-3IMAGE-VERIFY ?auto_11544 ?auto_11545 ?auto_11547 ?auto_11546 ?auto_11549 ?auto_11548 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11566 - DIRECTION
      ?auto_11567 - MODE
      ?auto_11569 - DIRECTION
      ?auto_11568 - MODE
      ?auto_11571 - DIRECTION
      ?auto_11570 - MODE
    )
    :vars
    (
      ?auto_11572 - INSTRUMENT
      ?auto_11573 - SATELLITE
      ?auto_11575 - DIRECTION
      ?auto_11574 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11572 ?auto_11573 ) ( SUPPORTS ?auto_11572 ?auto_11568 ) ( not ( = ?auto_11569 ?auto_11575 ) ) ( HAVE_IMAGE ?auto_11571 ?auto_11570 ) ( not ( = ?auto_11571 ?auto_11569 ) ) ( not ( = ?auto_11571 ?auto_11575 ) ) ( not ( = ?auto_11570 ?auto_11568 ) ) ( CALIBRATION_TARGET ?auto_11572 ?auto_11575 ) ( not ( = ?auto_11575 ?auto_11566 ) ) ( not ( = ?auto_11569 ?auto_11566 ) ) ( not ( = ?auto_11571 ?auto_11566 ) ) ( ON_BOARD ?auto_11574 ?auto_11573 ) ( POWER_ON ?auto_11574 ) ( not ( = ?auto_11572 ?auto_11574 ) ) ( CALIBRATED ?auto_11574 ) ( SUPPORTS ?auto_11574 ?auto_11567 ) ( not ( = ?auto_11570 ?auto_11567 ) ) ( not ( = ?auto_11568 ?auto_11567 ) ) ( POINTING ?auto_11573 ?auto_11575 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11571 ?auto_11570 ?auto_11569 ?auto_11568 )
      ( GET-3IMAGE-VERIFY ?auto_11566 ?auto_11567 ?auto_11569 ?auto_11568 ?auto_11571 ?auto_11570 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11600 - DIRECTION
      ?auto_11601 - MODE
      ?auto_11603 - DIRECTION
      ?auto_11602 - MODE
      ?auto_11605 - DIRECTION
      ?auto_11604 - MODE
    )
    :vars
    (
      ?auto_11606 - INSTRUMENT
      ?auto_11607 - SATELLITE
      ?auto_11611 - DIRECTION
      ?auto_11609 - DIRECTION
      ?auto_11610 - INSTRUMENT
      ?auto_11608 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_11606 ?auto_11607 ) ( SUPPORTS ?auto_11606 ?auto_11601 ) ( not ( = ?auto_11600 ?auto_11611 ) ) ( HAVE_IMAGE ?auto_11603 ?auto_11604 ) ( not ( = ?auto_11603 ?auto_11600 ) ) ( not ( = ?auto_11603 ?auto_11611 ) ) ( not ( = ?auto_11604 ?auto_11601 ) ) ( CALIBRATION_TARGET ?auto_11606 ?auto_11611 ) ( not ( = ?auto_11611 ?auto_11609 ) ) ( not ( = ?auto_11600 ?auto_11609 ) ) ( not ( = ?auto_11603 ?auto_11609 ) ) ( ON_BOARD ?auto_11610 ?auto_11607 ) ( POWER_ON ?auto_11610 ) ( not ( = ?auto_11606 ?auto_11610 ) ) ( CALIBRATED ?auto_11610 ) ( SUPPORTS ?auto_11610 ?auto_11608 ) ( not ( = ?auto_11604 ?auto_11608 ) ) ( not ( = ?auto_11601 ?auto_11608 ) ) ( POINTING ?auto_11607 ?auto_11611 ) ( HAVE_IMAGE ?auto_11603 ?auto_11602 ) ( HAVE_IMAGE ?auto_11605 ?auto_11604 ) ( not ( = ?auto_11600 ?auto_11605 ) ) ( not ( = ?auto_11601 ?auto_11602 ) ) ( not ( = ?auto_11603 ?auto_11605 ) ) ( not ( = ?auto_11602 ?auto_11604 ) ) ( not ( = ?auto_11602 ?auto_11608 ) ) ( not ( = ?auto_11605 ?auto_11611 ) ) ( not ( = ?auto_11605 ?auto_11609 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11603 ?auto_11604 ?auto_11600 ?auto_11601 )
      ( GET-3IMAGE-VERIFY ?auto_11600 ?auto_11601 ?auto_11603 ?auto_11602 ?auto_11605 ?auto_11604 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11612 - DIRECTION
      ?auto_11613 - MODE
      ?auto_11615 - DIRECTION
      ?auto_11614 - MODE
      ?auto_11617 - DIRECTION
      ?auto_11616 - MODE
    )
    :vars
    (
      ?auto_11618 - INSTRUMENT
      ?auto_11619 - SATELLITE
      ?auto_11621 - DIRECTION
      ?auto_11620 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11618 ?auto_11619 ) ( SUPPORTS ?auto_11618 ?auto_11613 ) ( not ( = ?auto_11612 ?auto_11621 ) ) ( HAVE_IMAGE ?auto_11615 ?auto_11614 ) ( not ( = ?auto_11615 ?auto_11612 ) ) ( not ( = ?auto_11615 ?auto_11621 ) ) ( not ( = ?auto_11614 ?auto_11613 ) ) ( CALIBRATION_TARGET ?auto_11618 ?auto_11621 ) ( not ( = ?auto_11621 ?auto_11617 ) ) ( not ( = ?auto_11612 ?auto_11617 ) ) ( not ( = ?auto_11615 ?auto_11617 ) ) ( ON_BOARD ?auto_11620 ?auto_11619 ) ( POWER_ON ?auto_11620 ) ( not ( = ?auto_11618 ?auto_11620 ) ) ( CALIBRATED ?auto_11620 ) ( SUPPORTS ?auto_11620 ?auto_11616 ) ( not ( = ?auto_11614 ?auto_11616 ) ) ( not ( = ?auto_11613 ?auto_11616 ) ) ( POINTING ?auto_11619 ?auto_11621 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11615 ?auto_11614 ?auto_11612 ?auto_11613 )
      ( GET-3IMAGE-VERIFY ?auto_11612 ?auto_11613 ?auto_11615 ?auto_11614 ?auto_11617 ?auto_11616 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11634 - DIRECTION
      ?auto_11635 - MODE
      ?auto_11637 - DIRECTION
      ?auto_11636 - MODE
      ?auto_11639 - DIRECTION
      ?auto_11638 - MODE
    )
    :vars
    (
      ?auto_11640 - INSTRUMENT
      ?auto_11641 - SATELLITE
      ?auto_11643 - DIRECTION
      ?auto_11642 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11640 ?auto_11641 ) ( SUPPORTS ?auto_11640 ?auto_11635 ) ( not ( = ?auto_11634 ?auto_11643 ) ) ( HAVE_IMAGE ?auto_11639 ?auto_11638 ) ( not ( = ?auto_11639 ?auto_11634 ) ) ( not ( = ?auto_11639 ?auto_11643 ) ) ( not ( = ?auto_11638 ?auto_11635 ) ) ( CALIBRATION_TARGET ?auto_11640 ?auto_11643 ) ( not ( = ?auto_11643 ?auto_11637 ) ) ( not ( = ?auto_11634 ?auto_11637 ) ) ( not ( = ?auto_11639 ?auto_11637 ) ) ( ON_BOARD ?auto_11642 ?auto_11641 ) ( POWER_ON ?auto_11642 ) ( not ( = ?auto_11640 ?auto_11642 ) ) ( CALIBRATED ?auto_11642 ) ( SUPPORTS ?auto_11642 ?auto_11636 ) ( not ( = ?auto_11638 ?auto_11636 ) ) ( not ( = ?auto_11635 ?auto_11636 ) ) ( POINTING ?auto_11641 ?auto_11643 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11639 ?auto_11638 ?auto_11634 ?auto_11635 )
      ( GET-3IMAGE-VERIFY ?auto_11634 ?auto_11635 ?auto_11637 ?auto_11636 ?auto_11639 ?auto_11638 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_11706 - DIRECTION
      ?auto_11707 - MODE
    )
    :vars
    (
      ?auto_11708 - INSTRUMENT
      ?auto_11709 - SATELLITE
      ?auto_11715 - DIRECTION
      ?auto_11711 - DIRECTION
      ?auto_11710 - MODE
      ?auto_11713 - DIRECTION
      ?auto_11714 - INSTRUMENT
      ?auto_11712 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_11708 ?auto_11709 ) ( SUPPORTS ?auto_11708 ?auto_11707 ) ( not ( = ?auto_11706 ?auto_11715 ) ) ( HAVE_IMAGE ?auto_11711 ?auto_11710 ) ( not ( = ?auto_11711 ?auto_11706 ) ) ( not ( = ?auto_11711 ?auto_11715 ) ) ( not ( = ?auto_11710 ?auto_11707 ) ) ( CALIBRATION_TARGET ?auto_11708 ?auto_11715 ) ( not ( = ?auto_11715 ?auto_11713 ) ) ( not ( = ?auto_11706 ?auto_11713 ) ) ( not ( = ?auto_11711 ?auto_11713 ) ) ( ON_BOARD ?auto_11714 ?auto_11709 ) ( POWER_ON ?auto_11714 ) ( not ( = ?auto_11708 ?auto_11714 ) ) ( SUPPORTS ?auto_11714 ?auto_11712 ) ( not ( = ?auto_11710 ?auto_11712 ) ) ( not ( = ?auto_11707 ?auto_11712 ) ) ( POINTING ?auto_11709 ?auto_11715 ) ( CALIBRATION_TARGET ?auto_11714 ?auto_11715 ) ( NOT_CALIBRATED ?auto_11714 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_11709 ?auto_11714 ?auto_11715 )
      ( GET-2IMAGE ?auto_11711 ?auto_11710 ?auto_11706 ?auto_11707 )
      ( GET-1IMAGE-VERIFY ?auto_11706 ?auto_11707 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_11716 - DIRECTION
      ?auto_11717 - MODE
      ?auto_11719 - DIRECTION
      ?auto_11718 - MODE
    )
    :vars
    (
      ?auto_11720 - INSTRUMENT
      ?auto_11721 - SATELLITE
      ?auto_11722 - DIRECTION
      ?auto_11724 - DIRECTION
      ?auto_11723 - INSTRUMENT
      ?auto_11725 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_11720 ?auto_11721 ) ( SUPPORTS ?auto_11720 ?auto_11718 ) ( not ( = ?auto_11719 ?auto_11722 ) ) ( HAVE_IMAGE ?auto_11716 ?auto_11717 ) ( not ( = ?auto_11716 ?auto_11719 ) ) ( not ( = ?auto_11716 ?auto_11722 ) ) ( not ( = ?auto_11717 ?auto_11718 ) ) ( CALIBRATION_TARGET ?auto_11720 ?auto_11722 ) ( not ( = ?auto_11722 ?auto_11724 ) ) ( not ( = ?auto_11719 ?auto_11724 ) ) ( not ( = ?auto_11716 ?auto_11724 ) ) ( ON_BOARD ?auto_11723 ?auto_11721 ) ( POWER_ON ?auto_11723 ) ( not ( = ?auto_11720 ?auto_11723 ) ) ( SUPPORTS ?auto_11723 ?auto_11725 ) ( not ( = ?auto_11717 ?auto_11725 ) ) ( not ( = ?auto_11718 ?auto_11725 ) ) ( POINTING ?auto_11721 ?auto_11722 ) ( CALIBRATION_TARGET ?auto_11723 ?auto_11722 ) ( NOT_CALIBRATED ?auto_11723 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_11719 ?auto_11718 )
      ( GET-2IMAGE-VERIFY ?auto_11716 ?auto_11717 ?auto_11719 ?auto_11718 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_11726 - DIRECTION
      ?auto_11727 - MODE
      ?auto_11729 - DIRECTION
      ?auto_11728 - MODE
    )
    :vars
    (
      ?auto_11730 - INSTRUMENT
      ?auto_11731 - SATELLITE
      ?auto_11732 - DIRECTION
      ?auto_11734 - DIRECTION
      ?auto_11733 - MODE
      ?auto_11735 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11730 ?auto_11731 ) ( SUPPORTS ?auto_11730 ?auto_11728 ) ( not ( = ?auto_11729 ?auto_11732 ) ) ( HAVE_IMAGE ?auto_11734 ?auto_11733 ) ( not ( = ?auto_11734 ?auto_11729 ) ) ( not ( = ?auto_11734 ?auto_11732 ) ) ( not ( = ?auto_11733 ?auto_11728 ) ) ( CALIBRATION_TARGET ?auto_11730 ?auto_11732 ) ( not ( = ?auto_11732 ?auto_11726 ) ) ( not ( = ?auto_11729 ?auto_11726 ) ) ( not ( = ?auto_11734 ?auto_11726 ) ) ( ON_BOARD ?auto_11735 ?auto_11731 ) ( POWER_ON ?auto_11735 ) ( not ( = ?auto_11730 ?auto_11735 ) ) ( SUPPORTS ?auto_11735 ?auto_11727 ) ( not ( = ?auto_11733 ?auto_11727 ) ) ( not ( = ?auto_11728 ?auto_11727 ) ) ( POINTING ?auto_11731 ?auto_11732 ) ( CALIBRATION_TARGET ?auto_11735 ?auto_11732 ) ( NOT_CALIBRATED ?auto_11735 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11734 ?auto_11733 ?auto_11729 ?auto_11728 )
      ( GET-2IMAGE-VERIFY ?auto_11726 ?auto_11727 ?auto_11729 ?auto_11728 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_11736 - DIRECTION
      ?auto_11737 - MODE
      ?auto_11739 - DIRECTION
      ?auto_11738 - MODE
    )
    :vars
    (
      ?auto_11741 - INSTRUMENT
      ?auto_11742 - SATELLITE
      ?auto_11744 - DIRECTION
      ?auto_11743 - DIRECTION
      ?auto_11745 - INSTRUMENT
      ?auto_11740 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_11741 ?auto_11742 ) ( SUPPORTS ?auto_11741 ?auto_11737 ) ( not ( = ?auto_11736 ?auto_11744 ) ) ( HAVE_IMAGE ?auto_11739 ?auto_11738 ) ( not ( = ?auto_11739 ?auto_11736 ) ) ( not ( = ?auto_11739 ?auto_11744 ) ) ( not ( = ?auto_11738 ?auto_11737 ) ) ( CALIBRATION_TARGET ?auto_11741 ?auto_11744 ) ( not ( = ?auto_11744 ?auto_11743 ) ) ( not ( = ?auto_11736 ?auto_11743 ) ) ( not ( = ?auto_11739 ?auto_11743 ) ) ( ON_BOARD ?auto_11745 ?auto_11742 ) ( POWER_ON ?auto_11745 ) ( not ( = ?auto_11741 ?auto_11745 ) ) ( SUPPORTS ?auto_11745 ?auto_11740 ) ( not ( = ?auto_11738 ?auto_11740 ) ) ( not ( = ?auto_11737 ?auto_11740 ) ) ( POINTING ?auto_11742 ?auto_11744 ) ( CALIBRATION_TARGET ?auto_11745 ?auto_11744 ) ( NOT_CALIBRATED ?auto_11745 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11739 ?auto_11738 ?auto_11736 ?auto_11737 )
      ( GET-2IMAGE-VERIFY ?auto_11736 ?auto_11737 ?auto_11739 ?auto_11738 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_11746 - DIRECTION
      ?auto_11747 - MODE
      ?auto_11749 - DIRECTION
      ?auto_11748 - MODE
    )
    :vars
    (
      ?auto_11750 - INSTRUMENT
      ?auto_11751 - SATELLITE
      ?auto_11752 - DIRECTION
      ?auto_11754 - DIRECTION
      ?auto_11753 - MODE
      ?auto_11755 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11750 ?auto_11751 ) ( SUPPORTS ?auto_11750 ?auto_11747 ) ( not ( = ?auto_11746 ?auto_11752 ) ) ( HAVE_IMAGE ?auto_11754 ?auto_11753 ) ( not ( = ?auto_11754 ?auto_11746 ) ) ( not ( = ?auto_11754 ?auto_11752 ) ) ( not ( = ?auto_11753 ?auto_11747 ) ) ( CALIBRATION_TARGET ?auto_11750 ?auto_11752 ) ( not ( = ?auto_11752 ?auto_11749 ) ) ( not ( = ?auto_11746 ?auto_11749 ) ) ( not ( = ?auto_11754 ?auto_11749 ) ) ( ON_BOARD ?auto_11755 ?auto_11751 ) ( POWER_ON ?auto_11755 ) ( not ( = ?auto_11750 ?auto_11755 ) ) ( SUPPORTS ?auto_11755 ?auto_11748 ) ( not ( = ?auto_11753 ?auto_11748 ) ) ( not ( = ?auto_11747 ?auto_11748 ) ) ( POINTING ?auto_11751 ?auto_11752 ) ( CALIBRATION_TARGET ?auto_11755 ?auto_11752 ) ( NOT_CALIBRATED ?auto_11755 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11754 ?auto_11753 ?auto_11746 ?auto_11747 )
      ( GET-2IMAGE-VERIFY ?auto_11746 ?auto_11747 ?auto_11749 ?auto_11748 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11768 - DIRECTION
      ?auto_11769 - MODE
      ?auto_11771 - DIRECTION
      ?auto_11770 - MODE
      ?auto_11773 - DIRECTION
      ?auto_11772 - MODE
    )
    :vars
    (
      ?auto_11775 - INSTRUMENT
      ?auto_11776 - SATELLITE
      ?auto_11778 - DIRECTION
      ?auto_11777 - DIRECTION
      ?auto_11779 - INSTRUMENT
      ?auto_11774 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_11775 ?auto_11776 ) ( SUPPORTS ?auto_11775 ?auto_11772 ) ( not ( = ?auto_11773 ?auto_11778 ) ) ( HAVE_IMAGE ?auto_11768 ?auto_11770 ) ( not ( = ?auto_11768 ?auto_11773 ) ) ( not ( = ?auto_11768 ?auto_11778 ) ) ( not ( = ?auto_11770 ?auto_11772 ) ) ( CALIBRATION_TARGET ?auto_11775 ?auto_11778 ) ( not ( = ?auto_11778 ?auto_11777 ) ) ( not ( = ?auto_11773 ?auto_11777 ) ) ( not ( = ?auto_11768 ?auto_11777 ) ) ( ON_BOARD ?auto_11779 ?auto_11776 ) ( POWER_ON ?auto_11779 ) ( not ( = ?auto_11775 ?auto_11779 ) ) ( SUPPORTS ?auto_11779 ?auto_11774 ) ( not ( = ?auto_11770 ?auto_11774 ) ) ( not ( = ?auto_11772 ?auto_11774 ) ) ( POINTING ?auto_11776 ?auto_11778 ) ( CALIBRATION_TARGET ?auto_11779 ?auto_11778 ) ( NOT_CALIBRATED ?auto_11779 ) ( HAVE_IMAGE ?auto_11768 ?auto_11769 ) ( HAVE_IMAGE ?auto_11771 ?auto_11770 ) ( not ( = ?auto_11768 ?auto_11771 ) ) ( not ( = ?auto_11769 ?auto_11770 ) ) ( not ( = ?auto_11769 ?auto_11772 ) ) ( not ( = ?auto_11769 ?auto_11774 ) ) ( not ( = ?auto_11771 ?auto_11773 ) ) ( not ( = ?auto_11771 ?auto_11778 ) ) ( not ( = ?auto_11771 ?auto_11777 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11768 ?auto_11770 ?auto_11773 ?auto_11772 )
      ( GET-3IMAGE-VERIFY ?auto_11768 ?auto_11769 ?auto_11771 ?auto_11770 ?auto_11773 ?auto_11772 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11780 - DIRECTION
      ?auto_11781 - MODE
      ?auto_11783 - DIRECTION
      ?auto_11782 - MODE
      ?auto_11785 - DIRECTION
      ?auto_11784 - MODE
    )
    :vars
    (
      ?auto_11786 - INSTRUMENT
      ?auto_11787 - SATELLITE
      ?auto_11788 - DIRECTION
      ?auto_11789 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11786 ?auto_11787 ) ( SUPPORTS ?auto_11786 ?auto_11784 ) ( not ( = ?auto_11785 ?auto_11788 ) ) ( HAVE_IMAGE ?auto_11780 ?auto_11781 ) ( not ( = ?auto_11780 ?auto_11785 ) ) ( not ( = ?auto_11780 ?auto_11788 ) ) ( not ( = ?auto_11781 ?auto_11784 ) ) ( CALIBRATION_TARGET ?auto_11786 ?auto_11788 ) ( not ( = ?auto_11788 ?auto_11783 ) ) ( not ( = ?auto_11785 ?auto_11783 ) ) ( not ( = ?auto_11780 ?auto_11783 ) ) ( ON_BOARD ?auto_11789 ?auto_11787 ) ( POWER_ON ?auto_11789 ) ( not ( = ?auto_11786 ?auto_11789 ) ) ( SUPPORTS ?auto_11789 ?auto_11782 ) ( not ( = ?auto_11781 ?auto_11782 ) ) ( not ( = ?auto_11784 ?auto_11782 ) ) ( POINTING ?auto_11787 ?auto_11788 ) ( CALIBRATION_TARGET ?auto_11789 ?auto_11788 ) ( NOT_CALIBRATED ?auto_11789 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11780 ?auto_11781 ?auto_11785 ?auto_11784 )
      ( GET-3IMAGE-VERIFY ?auto_11780 ?auto_11781 ?auto_11783 ?auto_11782 ?auto_11785 ?auto_11784 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11790 - DIRECTION
      ?auto_11791 - MODE
      ?auto_11793 - DIRECTION
      ?auto_11792 - MODE
      ?auto_11795 - DIRECTION
      ?auto_11794 - MODE
    )
    :vars
    (
      ?auto_11797 - INSTRUMENT
      ?auto_11798 - SATELLITE
      ?auto_11800 - DIRECTION
      ?auto_11799 - DIRECTION
      ?auto_11801 - INSTRUMENT
      ?auto_11796 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_11797 ?auto_11798 ) ( SUPPORTS ?auto_11797 ?auto_11792 ) ( not ( = ?auto_11793 ?auto_11800 ) ) ( HAVE_IMAGE ?auto_11795 ?auto_11794 ) ( not ( = ?auto_11795 ?auto_11793 ) ) ( not ( = ?auto_11795 ?auto_11800 ) ) ( not ( = ?auto_11794 ?auto_11792 ) ) ( CALIBRATION_TARGET ?auto_11797 ?auto_11800 ) ( not ( = ?auto_11800 ?auto_11799 ) ) ( not ( = ?auto_11793 ?auto_11799 ) ) ( not ( = ?auto_11795 ?auto_11799 ) ) ( ON_BOARD ?auto_11801 ?auto_11798 ) ( POWER_ON ?auto_11801 ) ( not ( = ?auto_11797 ?auto_11801 ) ) ( SUPPORTS ?auto_11801 ?auto_11796 ) ( not ( = ?auto_11794 ?auto_11796 ) ) ( not ( = ?auto_11792 ?auto_11796 ) ) ( POINTING ?auto_11798 ?auto_11800 ) ( CALIBRATION_TARGET ?auto_11801 ?auto_11800 ) ( NOT_CALIBRATED ?auto_11801 ) ( HAVE_IMAGE ?auto_11790 ?auto_11791 ) ( not ( = ?auto_11790 ?auto_11793 ) ) ( not ( = ?auto_11790 ?auto_11795 ) ) ( not ( = ?auto_11790 ?auto_11800 ) ) ( not ( = ?auto_11790 ?auto_11799 ) ) ( not ( = ?auto_11791 ?auto_11792 ) ) ( not ( = ?auto_11791 ?auto_11794 ) ) ( not ( = ?auto_11791 ?auto_11796 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11795 ?auto_11794 ?auto_11793 ?auto_11792 )
      ( GET-3IMAGE-VERIFY ?auto_11790 ?auto_11791 ?auto_11793 ?auto_11792 ?auto_11795 ?auto_11794 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11802 - DIRECTION
      ?auto_11803 - MODE
      ?auto_11805 - DIRECTION
      ?auto_11804 - MODE
      ?auto_11807 - DIRECTION
      ?auto_11806 - MODE
    )
    :vars
    (
      ?auto_11808 - INSTRUMENT
      ?auto_11809 - SATELLITE
      ?auto_11810 - DIRECTION
      ?auto_11811 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11808 ?auto_11809 ) ( SUPPORTS ?auto_11808 ?auto_11804 ) ( not ( = ?auto_11805 ?auto_11810 ) ) ( HAVE_IMAGE ?auto_11802 ?auto_11803 ) ( not ( = ?auto_11802 ?auto_11805 ) ) ( not ( = ?auto_11802 ?auto_11810 ) ) ( not ( = ?auto_11803 ?auto_11804 ) ) ( CALIBRATION_TARGET ?auto_11808 ?auto_11810 ) ( not ( = ?auto_11810 ?auto_11807 ) ) ( not ( = ?auto_11805 ?auto_11807 ) ) ( not ( = ?auto_11802 ?auto_11807 ) ) ( ON_BOARD ?auto_11811 ?auto_11809 ) ( POWER_ON ?auto_11811 ) ( not ( = ?auto_11808 ?auto_11811 ) ) ( SUPPORTS ?auto_11811 ?auto_11806 ) ( not ( = ?auto_11803 ?auto_11806 ) ) ( not ( = ?auto_11804 ?auto_11806 ) ) ( POINTING ?auto_11809 ?auto_11810 ) ( CALIBRATION_TARGET ?auto_11811 ?auto_11810 ) ( NOT_CALIBRATED ?auto_11811 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11802 ?auto_11803 ?auto_11805 ?auto_11804 )
      ( GET-3IMAGE-VERIFY ?auto_11802 ?auto_11803 ?auto_11805 ?auto_11804 ?auto_11807 ?auto_11806 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11824 - DIRECTION
      ?auto_11825 - MODE
      ?auto_11827 - DIRECTION
      ?auto_11826 - MODE
      ?auto_11829 - DIRECTION
      ?auto_11828 - MODE
    )
    :vars
    (
      ?auto_11830 - INSTRUMENT
      ?auto_11831 - SATELLITE
      ?auto_11832 - DIRECTION
      ?auto_11833 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11830 ?auto_11831 ) ( SUPPORTS ?auto_11830 ?auto_11828 ) ( not ( = ?auto_11829 ?auto_11832 ) ) ( HAVE_IMAGE ?auto_11827 ?auto_11826 ) ( not ( = ?auto_11827 ?auto_11829 ) ) ( not ( = ?auto_11827 ?auto_11832 ) ) ( not ( = ?auto_11826 ?auto_11828 ) ) ( CALIBRATION_TARGET ?auto_11830 ?auto_11832 ) ( not ( = ?auto_11832 ?auto_11824 ) ) ( not ( = ?auto_11829 ?auto_11824 ) ) ( not ( = ?auto_11827 ?auto_11824 ) ) ( ON_BOARD ?auto_11833 ?auto_11831 ) ( POWER_ON ?auto_11833 ) ( not ( = ?auto_11830 ?auto_11833 ) ) ( SUPPORTS ?auto_11833 ?auto_11825 ) ( not ( = ?auto_11826 ?auto_11825 ) ) ( not ( = ?auto_11828 ?auto_11825 ) ) ( POINTING ?auto_11831 ?auto_11832 ) ( CALIBRATION_TARGET ?auto_11833 ?auto_11832 ) ( NOT_CALIBRATED ?auto_11833 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11827 ?auto_11826 ?auto_11829 ?auto_11828 )
      ( GET-3IMAGE-VERIFY ?auto_11824 ?auto_11825 ?auto_11827 ?auto_11826 ?auto_11829 ?auto_11828 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11846 - DIRECTION
      ?auto_11847 - MODE
      ?auto_11849 - DIRECTION
      ?auto_11848 - MODE
      ?auto_11851 - DIRECTION
      ?auto_11850 - MODE
    )
    :vars
    (
      ?auto_11852 - INSTRUMENT
      ?auto_11853 - SATELLITE
      ?auto_11854 - DIRECTION
      ?auto_11855 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11852 ?auto_11853 ) ( SUPPORTS ?auto_11852 ?auto_11848 ) ( not ( = ?auto_11849 ?auto_11854 ) ) ( HAVE_IMAGE ?auto_11851 ?auto_11850 ) ( not ( = ?auto_11851 ?auto_11849 ) ) ( not ( = ?auto_11851 ?auto_11854 ) ) ( not ( = ?auto_11850 ?auto_11848 ) ) ( CALIBRATION_TARGET ?auto_11852 ?auto_11854 ) ( not ( = ?auto_11854 ?auto_11846 ) ) ( not ( = ?auto_11849 ?auto_11846 ) ) ( not ( = ?auto_11851 ?auto_11846 ) ) ( ON_BOARD ?auto_11855 ?auto_11853 ) ( POWER_ON ?auto_11855 ) ( not ( = ?auto_11852 ?auto_11855 ) ) ( SUPPORTS ?auto_11855 ?auto_11847 ) ( not ( = ?auto_11850 ?auto_11847 ) ) ( not ( = ?auto_11848 ?auto_11847 ) ) ( POINTING ?auto_11853 ?auto_11854 ) ( CALIBRATION_TARGET ?auto_11855 ?auto_11854 ) ( NOT_CALIBRATED ?auto_11855 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11851 ?auto_11850 ?auto_11849 ?auto_11848 )
      ( GET-3IMAGE-VERIFY ?auto_11846 ?auto_11847 ?auto_11849 ?auto_11848 ?auto_11851 ?auto_11850 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11880 - DIRECTION
      ?auto_11881 - MODE
      ?auto_11883 - DIRECTION
      ?auto_11882 - MODE
      ?auto_11885 - DIRECTION
      ?auto_11884 - MODE
    )
    :vars
    (
      ?auto_11887 - INSTRUMENT
      ?auto_11888 - SATELLITE
      ?auto_11890 - DIRECTION
      ?auto_11889 - DIRECTION
      ?auto_11891 - INSTRUMENT
      ?auto_11886 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_11887 ?auto_11888 ) ( SUPPORTS ?auto_11887 ?auto_11881 ) ( not ( = ?auto_11880 ?auto_11890 ) ) ( HAVE_IMAGE ?auto_11883 ?auto_11882 ) ( not ( = ?auto_11883 ?auto_11880 ) ) ( not ( = ?auto_11883 ?auto_11890 ) ) ( not ( = ?auto_11882 ?auto_11881 ) ) ( CALIBRATION_TARGET ?auto_11887 ?auto_11890 ) ( not ( = ?auto_11890 ?auto_11889 ) ) ( not ( = ?auto_11880 ?auto_11889 ) ) ( not ( = ?auto_11883 ?auto_11889 ) ) ( ON_BOARD ?auto_11891 ?auto_11888 ) ( POWER_ON ?auto_11891 ) ( not ( = ?auto_11887 ?auto_11891 ) ) ( SUPPORTS ?auto_11891 ?auto_11886 ) ( not ( = ?auto_11882 ?auto_11886 ) ) ( not ( = ?auto_11881 ?auto_11886 ) ) ( POINTING ?auto_11888 ?auto_11890 ) ( CALIBRATION_TARGET ?auto_11891 ?auto_11890 ) ( NOT_CALIBRATED ?auto_11891 ) ( HAVE_IMAGE ?auto_11885 ?auto_11884 ) ( not ( = ?auto_11880 ?auto_11885 ) ) ( not ( = ?auto_11881 ?auto_11884 ) ) ( not ( = ?auto_11883 ?auto_11885 ) ) ( not ( = ?auto_11882 ?auto_11884 ) ) ( not ( = ?auto_11885 ?auto_11890 ) ) ( not ( = ?auto_11885 ?auto_11889 ) ) ( not ( = ?auto_11884 ?auto_11886 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11883 ?auto_11882 ?auto_11880 ?auto_11881 )
      ( GET-3IMAGE-VERIFY ?auto_11880 ?auto_11881 ?auto_11883 ?auto_11882 ?auto_11885 ?auto_11884 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11892 - DIRECTION
      ?auto_11893 - MODE
      ?auto_11895 - DIRECTION
      ?auto_11894 - MODE
      ?auto_11897 - DIRECTION
      ?auto_11896 - MODE
    )
    :vars
    (
      ?auto_11898 - INSTRUMENT
      ?auto_11899 - SATELLITE
      ?auto_11900 - DIRECTION
      ?auto_11901 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11898 ?auto_11899 ) ( SUPPORTS ?auto_11898 ?auto_11893 ) ( not ( = ?auto_11892 ?auto_11900 ) ) ( HAVE_IMAGE ?auto_11895 ?auto_11894 ) ( not ( = ?auto_11895 ?auto_11892 ) ) ( not ( = ?auto_11895 ?auto_11900 ) ) ( not ( = ?auto_11894 ?auto_11893 ) ) ( CALIBRATION_TARGET ?auto_11898 ?auto_11900 ) ( not ( = ?auto_11900 ?auto_11897 ) ) ( not ( = ?auto_11892 ?auto_11897 ) ) ( not ( = ?auto_11895 ?auto_11897 ) ) ( ON_BOARD ?auto_11901 ?auto_11899 ) ( POWER_ON ?auto_11901 ) ( not ( = ?auto_11898 ?auto_11901 ) ) ( SUPPORTS ?auto_11901 ?auto_11896 ) ( not ( = ?auto_11894 ?auto_11896 ) ) ( not ( = ?auto_11893 ?auto_11896 ) ) ( POINTING ?auto_11899 ?auto_11900 ) ( CALIBRATION_TARGET ?auto_11901 ?auto_11900 ) ( NOT_CALIBRATED ?auto_11901 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11895 ?auto_11894 ?auto_11892 ?auto_11893 )
      ( GET-3IMAGE-VERIFY ?auto_11892 ?auto_11893 ?auto_11895 ?auto_11894 ?auto_11897 ?auto_11896 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_11914 - DIRECTION
      ?auto_11915 - MODE
      ?auto_11917 - DIRECTION
      ?auto_11916 - MODE
      ?auto_11919 - DIRECTION
      ?auto_11918 - MODE
    )
    :vars
    (
      ?auto_11920 - INSTRUMENT
      ?auto_11921 - SATELLITE
      ?auto_11922 - DIRECTION
      ?auto_11923 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_11920 ?auto_11921 ) ( SUPPORTS ?auto_11920 ?auto_11915 ) ( not ( = ?auto_11914 ?auto_11922 ) ) ( HAVE_IMAGE ?auto_11919 ?auto_11918 ) ( not ( = ?auto_11919 ?auto_11914 ) ) ( not ( = ?auto_11919 ?auto_11922 ) ) ( not ( = ?auto_11918 ?auto_11915 ) ) ( CALIBRATION_TARGET ?auto_11920 ?auto_11922 ) ( not ( = ?auto_11922 ?auto_11917 ) ) ( not ( = ?auto_11914 ?auto_11917 ) ) ( not ( = ?auto_11919 ?auto_11917 ) ) ( ON_BOARD ?auto_11923 ?auto_11921 ) ( POWER_ON ?auto_11923 ) ( not ( = ?auto_11920 ?auto_11923 ) ) ( SUPPORTS ?auto_11923 ?auto_11916 ) ( not ( = ?auto_11918 ?auto_11916 ) ) ( not ( = ?auto_11915 ?auto_11916 ) ) ( POINTING ?auto_11921 ?auto_11922 ) ( CALIBRATION_TARGET ?auto_11923 ?auto_11922 ) ( NOT_CALIBRATED ?auto_11923 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11919 ?auto_11918 ?auto_11914 ?auto_11915 )
      ( GET-3IMAGE-VERIFY ?auto_11914 ?auto_11915 ?auto_11917 ?auto_11916 ?auto_11919 ?auto_11918 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_11986 - DIRECTION
      ?auto_11987 - MODE
    )
    :vars
    (
      ?auto_11989 - INSTRUMENT
      ?auto_11990 - SATELLITE
      ?auto_11992 - DIRECTION
      ?auto_11994 - DIRECTION
      ?auto_11993 - MODE
      ?auto_11991 - DIRECTION
      ?auto_11995 - INSTRUMENT
      ?auto_11988 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_11989 ?auto_11990 ) ( SUPPORTS ?auto_11989 ?auto_11987 ) ( not ( = ?auto_11986 ?auto_11992 ) ) ( HAVE_IMAGE ?auto_11994 ?auto_11993 ) ( not ( = ?auto_11994 ?auto_11986 ) ) ( not ( = ?auto_11994 ?auto_11992 ) ) ( not ( = ?auto_11993 ?auto_11987 ) ) ( CALIBRATION_TARGET ?auto_11989 ?auto_11992 ) ( not ( = ?auto_11992 ?auto_11991 ) ) ( not ( = ?auto_11986 ?auto_11991 ) ) ( not ( = ?auto_11994 ?auto_11991 ) ) ( ON_BOARD ?auto_11995 ?auto_11990 ) ( not ( = ?auto_11989 ?auto_11995 ) ) ( SUPPORTS ?auto_11995 ?auto_11988 ) ( not ( = ?auto_11993 ?auto_11988 ) ) ( not ( = ?auto_11987 ?auto_11988 ) ) ( POINTING ?auto_11990 ?auto_11992 ) ( CALIBRATION_TARGET ?auto_11995 ?auto_11992 ) ( POWER_AVAIL ?auto_11990 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_11995 ?auto_11990 )
      ( GET-2IMAGE ?auto_11994 ?auto_11993 ?auto_11986 ?auto_11987 )
      ( GET-1IMAGE-VERIFY ?auto_11986 ?auto_11987 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_11996 - DIRECTION
      ?auto_11997 - MODE
      ?auto_11999 - DIRECTION
      ?auto_11998 - MODE
    )
    :vars
    (
      ?auto_12004 - INSTRUMENT
      ?auto_12005 - SATELLITE
      ?auto_12003 - DIRECTION
      ?auto_12001 - DIRECTION
      ?auto_12002 - INSTRUMENT
      ?auto_12000 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_12004 ?auto_12005 ) ( SUPPORTS ?auto_12004 ?auto_11998 ) ( not ( = ?auto_11999 ?auto_12003 ) ) ( HAVE_IMAGE ?auto_11996 ?auto_11997 ) ( not ( = ?auto_11996 ?auto_11999 ) ) ( not ( = ?auto_11996 ?auto_12003 ) ) ( not ( = ?auto_11997 ?auto_11998 ) ) ( CALIBRATION_TARGET ?auto_12004 ?auto_12003 ) ( not ( = ?auto_12003 ?auto_12001 ) ) ( not ( = ?auto_11999 ?auto_12001 ) ) ( not ( = ?auto_11996 ?auto_12001 ) ) ( ON_BOARD ?auto_12002 ?auto_12005 ) ( not ( = ?auto_12004 ?auto_12002 ) ) ( SUPPORTS ?auto_12002 ?auto_12000 ) ( not ( = ?auto_11997 ?auto_12000 ) ) ( not ( = ?auto_11998 ?auto_12000 ) ) ( POINTING ?auto_12005 ?auto_12003 ) ( CALIBRATION_TARGET ?auto_12002 ?auto_12003 ) ( POWER_AVAIL ?auto_12005 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_11999 ?auto_11998 )
      ( GET-2IMAGE-VERIFY ?auto_11996 ?auto_11997 ?auto_11999 ?auto_11998 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_12006 - DIRECTION
      ?auto_12007 - MODE
      ?auto_12009 - DIRECTION
      ?auto_12008 - MODE
    )
    :vars
    (
      ?auto_12012 - INSTRUMENT
      ?auto_12013 - SATELLITE
      ?auto_12015 - DIRECTION
      ?auto_12011 - DIRECTION
      ?auto_12010 - MODE
      ?auto_12014 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12012 ?auto_12013 ) ( SUPPORTS ?auto_12012 ?auto_12008 ) ( not ( = ?auto_12009 ?auto_12015 ) ) ( HAVE_IMAGE ?auto_12011 ?auto_12010 ) ( not ( = ?auto_12011 ?auto_12009 ) ) ( not ( = ?auto_12011 ?auto_12015 ) ) ( not ( = ?auto_12010 ?auto_12008 ) ) ( CALIBRATION_TARGET ?auto_12012 ?auto_12015 ) ( not ( = ?auto_12015 ?auto_12006 ) ) ( not ( = ?auto_12009 ?auto_12006 ) ) ( not ( = ?auto_12011 ?auto_12006 ) ) ( ON_BOARD ?auto_12014 ?auto_12013 ) ( not ( = ?auto_12012 ?auto_12014 ) ) ( SUPPORTS ?auto_12014 ?auto_12007 ) ( not ( = ?auto_12010 ?auto_12007 ) ) ( not ( = ?auto_12008 ?auto_12007 ) ) ( POINTING ?auto_12013 ?auto_12015 ) ( CALIBRATION_TARGET ?auto_12014 ?auto_12015 ) ( POWER_AVAIL ?auto_12013 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12011 ?auto_12010 ?auto_12009 ?auto_12008 )
      ( GET-2IMAGE-VERIFY ?auto_12006 ?auto_12007 ?auto_12009 ?auto_12008 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_12016 - DIRECTION
      ?auto_12017 - MODE
      ?auto_12019 - DIRECTION
      ?auto_12018 - MODE
    )
    :vars
    (
      ?auto_12020 - INSTRUMENT
      ?auto_12022 - SATELLITE
      ?auto_12024 - DIRECTION
      ?auto_12021 - DIRECTION
      ?auto_12023 - INSTRUMENT
      ?auto_12025 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_12020 ?auto_12022 ) ( SUPPORTS ?auto_12020 ?auto_12017 ) ( not ( = ?auto_12016 ?auto_12024 ) ) ( HAVE_IMAGE ?auto_12019 ?auto_12018 ) ( not ( = ?auto_12019 ?auto_12016 ) ) ( not ( = ?auto_12019 ?auto_12024 ) ) ( not ( = ?auto_12018 ?auto_12017 ) ) ( CALIBRATION_TARGET ?auto_12020 ?auto_12024 ) ( not ( = ?auto_12024 ?auto_12021 ) ) ( not ( = ?auto_12016 ?auto_12021 ) ) ( not ( = ?auto_12019 ?auto_12021 ) ) ( ON_BOARD ?auto_12023 ?auto_12022 ) ( not ( = ?auto_12020 ?auto_12023 ) ) ( SUPPORTS ?auto_12023 ?auto_12025 ) ( not ( = ?auto_12018 ?auto_12025 ) ) ( not ( = ?auto_12017 ?auto_12025 ) ) ( POINTING ?auto_12022 ?auto_12024 ) ( CALIBRATION_TARGET ?auto_12023 ?auto_12024 ) ( POWER_AVAIL ?auto_12022 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12019 ?auto_12018 ?auto_12016 ?auto_12017 )
      ( GET-2IMAGE-VERIFY ?auto_12016 ?auto_12017 ?auto_12019 ?auto_12018 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_12026 - DIRECTION
      ?auto_12027 - MODE
      ?auto_12029 - DIRECTION
      ?auto_12028 - MODE
    )
    :vars
    (
      ?auto_12032 - INSTRUMENT
      ?auto_12033 - SATELLITE
      ?auto_12035 - DIRECTION
      ?auto_12031 - DIRECTION
      ?auto_12030 - MODE
      ?auto_12034 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12032 ?auto_12033 ) ( SUPPORTS ?auto_12032 ?auto_12027 ) ( not ( = ?auto_12026 ?auto_12035 ) ) ( HAVE_IMAGE ?auto_12031 ?auto_12030 ) ( not ( = ?auto_12031 ?auto_12026 ) ) ( not ( = ?auto_12031 ?auto_12035 ) ) ( not ( = ?auto_12030 ?auto_12027 ) ) ( CALIBRATION_TARGET ?auto_12032 ?auto_12035 ) ( not ( = ?auto_12035 ?auto_12029 ) ) ( not ( = ?auto_12026 ?auto_12029 ) ) ( not ( = ?auto_12031 ?auto_12029 ) ) ( ON_BOARD ?auto_12034 ?auto_12033 ) ( not ( = ?auto_12032 ?auto_12034 ) ) ( SUPPORTS ?auto_12034 ?auto_12028 ) ( not ( = ?auto_12030 ?auto_12028 ) ) ( not ( = ?auto_12027 ?auto_12028 ) ) ( POINTING ?auto_12033 ?auto_12035 ) ( CALIBRATION_TARGET ?auto_12034 ?auto_12035 ) ( POWER_AVAIL ?auto_12033 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12031 ?auto_12030 ?auto_12026 ?auto_12027 )
      ( GET-2IMAGE-VERIFY ?auto_12026 ?auto_12027 ?auto_12029 ?auto_12028 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12048 - DIRECTION
      ?auto_12049 - MODE
      ?auto_12051 - DIRECTION
      ?auto_12050 - MODE
      ?auto_12053 - DIRECTION
      ?auto_12052 - MODE
    )
    :vars
    (
      ?auto_12054 - INSTRUMENT
      ?auto_12056 - SATELLITE
      ?auto_12058 - DIRECTION
      ?auto_12055 - DIRECTION
      ?auto_12057 - INSTRUMENT
      ?auto_12059 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_12054 ?auto_12056 ) ( SUPPORTS ?auto_12054 ?auto_12052 ) ( not ( = ?auto_12053 ?auto_12058 ) ) ( HAVE_IMAGE ?auto_12048 ?auto_12049 ) ( not ( = ?auto_12048 ?auto_12053 ) ) ( not ( = ?auto_12048 ?auto_12058 ) ) ( not ( = ?auto_12049 ?auto_12052 ) ) ( CALIBRATION_TARGET ?auto_12054 ?auto_12058 ) ( not ( = ?auto_12058 ?auto_12055 ) ) ( not ( = ?auto_12053 ?auto_12055 ) ) ( not ( = ?auto_12048 ?auto_12055 ) ) ( ON_BOARD ?auto_12057 ?auto_12056 ) ( not ( = ?auto_12054 ?auto_12057 ) ) ( SUPPORTS ?auto_12057 ?auto_12059 ) ( not ( = ?auto_12049 ?auto_12059 ) ) ( not ( = ?auto_12052 ?auto_12059 ) ) ( POINTING ?auto_12056 ?auto_12058 ) ( CALIBRATION_TARGET ?auto_12057 ?auto_12058 ) ( POWER_AVAIL ?auto_12056 ) ( HAVE_IMAGE ?auto_12051 ?auto_12050 ) ( not ( = ?auto_12048 ?auto_12051 ) ) ( not ( = ?auto_12049 ?auto_12050 ) ) ( not ( = ?auto_12051 ?auto_12053 ) ) ( not ( = ?auto_12051 ?auto_12058 ) ) ( not ( = ?auto_12051 ?auto_12055 ) ) ( not ( = ?auto_12050 ?auto_12052 ) ) ( not ( = ?auto_12050 ?auto_12059 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12048 ?auto_12049 ?auto_12053 ?auto_12052 )
      ( GET-3IMAGE-VERIFY ?auto_12048 ?auto_12049 ?auto_12051 ?auto_12050 ?auto_12053 ?auto_12052 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12060 - DIRECTION
      ?auto_12061 - MODE
      ?auto_12063 - DIRECTION
      ?auto_12062 - MODE
      ?auto_12065 - DIRECTION
      ?auto_12064 - MODE
    )
    :vars
    (
      ?auto_12066 - INSTRUMENT
      ?auto_12067 - SATELLITE
      ?auto_12069 - DIRECTION
      ?auto_12068 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12066 ?auto_12067 ) ( SUPPORTS ?auto_12066 ?auto_12064 ) ( not ( = ?auto_12065 ?auto_12069 ) ) ( HAVE_IMAGE ?auto_12060 ?auto_12061 ) ( not ( = ?auto_12060 ?auto_12065 ) ) ( not ( = ?auto_12060 ?auto_12069 ) ) ( not ( = ?auto_12061 ?auto_12064 ) ) ( CALIBRATION_TARGET ?auto_12066 ?auto_12069 ) ( not ( = ?auto_12069 ?auto_12063 ) ) ( not ( = ?auto_12065 ?auto_12063 ) ) ( not ( = ?auto_12060 ?auto_12063 ) ) ( ON_BOARD ?auto_12068 ?auto_12067 ) ( not ( = ?auto_12066 ?auto_12068 ) ) ( SUPPORTS ?auto_12068 ?auto_12062 ) ( not ( = ?auto_12061 ?auto_12062 ) ) ( not ( = ?auto_12064 ?auto_12062 ) ) ( POINTING ?auto_12067 ?auto_12069 ) ( CALIBRATION_TARGET ?auto_12068 ?auto_12069 ) ( POWER_AVAIL ?auto_12067 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12060 ?auto_12061 ?auto_12065 ?auto_12064 )
      ( GET-3IMAGE-VERIFY ?auto_12060 ?auto_12061 ?auto_12063 ?auto_12062 ?auto_12065 ?auto_12064 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12070 - DIRECTION
      ?auto_12071 - MODE
      ?auto_12073 - DIRECTION
      ?auto_12072 - MODE
      ?auto_12075 - DIRECTION
      ?auto_12074 - MODE
    )
    :vars
    (
      ?auto_12076 - INSTRUMENT
      ?auto_12078 - SATELLITE
      ?auto_12080 - DIRECTION
      ?auto_12077 - DIRECTION
      ?auto_12079 - INSTRUMENT
      ?auto_12081 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_12076 ?auto_12078 ) ( SUPPORTS ?auto_12076 ?auto_12072 ) ( not ( = ?auto_12073 ?auto_12080 ) ) ( HAVE_IMAGE ?auto_12075 ?auto_12074 ) ( not ( = ?auto_12075 ?auto_12073 ) ) ( not ( = ?auto_12075 ?auto_12080 ) ) ( not ( = ?auto_12074 ?auto_12072 ) ) ( CALIBRATION_TARGET ?auto_12076 ?auto_12080 ) ( not ( = ?auto_12080 ?auto_12077 ) ) ( not ( = ?auto_12073 ?auto_12077 ) ) ( not ( = ?auto_12075 ?auto_12077 ) ) ( ON_BOARD ?auto_12079 ?auto_12078 ) ( not ( = ?auto_12076 ?auto_12079 ) ) ( SUPPORTS ?auto_12079 ?auto_12081 ) ( not ( = ?auto_12074 ?auto_12081 ) ) ( not ( = ?auto_12072 ?auto_12081 ) ) ( POINTING ?auto_12078 ?auto_12080 ) ( CALIBRATION_TARGET ?auto_12079 ?auto_12080 ) ( POWER_AVAIL ?auto_12078 ) ( HAVE_IMAGE ?auto_12070 ?auto_12071 ) ( not ( = ?auto_12070 ?auto_12073 ) ) ( not ( = ?auto_12070 ?auto_12075 ) ) ( not ( = ?auto_12070 ?auto_12080 ) ) ( not ( = ?auto_12070 ?auto_12077 ) ) ( not ( = ?auto_12071 ?auto_12072 ) ) ( not ( = ?auto_12071 ?auto_12074 ) ) ( not ( = ?auto_12071 ?auto_12081 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12075 ?auto_12074 ?auto_12073 ?auto_12072 )
      ( GET-3IMAGE-VERIFY ?auto_12070 ?auto_12071 ?auto_12073 ?auto_12072 ?auto_12075 ?auto_12074 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12082 - DIRECTION
      ?auto_12083 - MODE
      ?auto_12085 - DIRECTION
      ?auto_12084 - MODE
      ?auto_12087 - DIRECTION
      ?auto_12086 - MODE
    )
    :vars
    (
      ?auto_12088 - INSTRUMENT
      ?auto_12089 - SATELLITE
      ?auto_12091 - DIRECTION
      ?auto_12090 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12088 ?auto_12089 ) ( SUPPORTS ?auto_12088 ?auto_12084 ) ( not ( = ?auto_12085 ?auto_12091 ) ) ( HAVE_IMAGE ?auto_12082 ?auto_12083 ) ( not ( = ?auto_12082 ?auto_12085 ) ) ( not ( = ?auto_12082 ?auto_12091 ) ) ( not ( = ?auto_12083 ?auto_12084 ) ) ( CALIBRATION_TARGET ?auto_12088 ?auto_12091 ) ( not ( = ?auto_12091 ?auto_12087 ) ) ( not ( = ?auto_12085 ?auto_12087 ) ) ( not ( = ?auto_12082 ?auto_12087 ) ) ( ON_BOARD ?auto_12090 ?auto_12089 ) ( not ( = ?auto_12088 ?auto_12090 ) ) ( SUPPORTS ?auto_12090 ?auto_12086 ) ( not ( = ?auto_12083 ?auto_12086 ) ) ( not ( = ?auto_12084 ?auto_12086 ) ) ( POINTING ?auto_12089 ?auto_12091 ) ( CALIBRATION_TARGET ?auto_12090 ?auto_12091 ) ( POWER_AVAIL ?auto_12089 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12082 ?auto_12083 ?auto_12085 ?auto_12084 )
      ( GET-3IMAGE-VERIFY ?auto_12082 ?auto_12083 ?auto_12085 ?auto_12084 ?auto_12087 ?auto_12086 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12104 - DIRECTION
      ?auto_12105 - MODE
      ?auto_12107 - DIRECTION
      ?auto_12106 - MODE
      ?auto_12109 - DIRECTION
      ?auto_12108 - MODE
    )
    :vars
    (
      ?auto_12110 - INSTRUMENT
      ?auto_12111 - SATELLITE
      ?auto_12113 - DIRECTION
      ?auto_12112 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12110 ?auto_12111 ) ( SUPPORTS ?auto_12110 ?auto_12108 ) ( not ( = ?auto_12109 ?auto_12113 ) ) ( HAVE_IMAGE ?auto_12107 ?auto_12106 ) ( not ( = ?auto_12107 ?auto_12109 ) ) ( not ( = ?auto_12107 ?auto_12113 ) ) ( not ( = ?auto_12106 ?auto_12108 ) ) ( CALIBRATION_TARGET ?auto_12110 ?auto_12113 ) ( not ( = ?auto_12113 ?auto_12104 ) ) ( not ( = ?auto_12109 ?auto_12104 ) ) ( not ( = ?auto_12107 ?auto_12104 ) ) ( ON_BOARD ?auto_12112 ?auto_12111 ) ( not ( = ?auto_12110 ?auto_12112 ) ) ( SUPPORTS ?auto_12112 ?auto_12105 ) ( not ( = ?auto_12106 ?auto_12105 ) ) ( not ( = ?auto_12108 ?auto_12105 ) ) ( POINTING ?auto_12111 ?auto_12113 ) ( CALIBRATION_TARGET ?auto_12112 ?auto_12113 ) ( POWER_AVAIL ?auto_12111 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12107 ?auto_12106 ?auto_12109 ?auto_12108 )
      ( GET-3IMAGE-VERIFY ?auto_12104 ?auto_12105 ?auto_12107 ?auto_12106 ?auto_12109 ?auto_12108 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12126 - DIRECTION
      ?auto_12127 - MODE
      ?auto_12129 - DIRECTION
      ?auto_12128 - MODE
      ?auto_12131 - DIRECTION
      ?auto_12130 - MODE
    )
    :vars
    (
      ?auto_12132 - INSTRUMENT
      ?auto_12133 - SATELLITE
      ?auto_12135 - DIRECTION
      ?auto_12134 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12132 ?auto_12133 ) ( SUPPORTS ?auto_12132 ?auto_12128 ) ( not ( = ?auto_12129 ?auto_12135 ) ) ( HAVE_IMAGE ?auto_12131 ?auto_12130 ) ( not ( = ?auto_12131 ?auto_12129 ) ) ( not ( = ?auto_12131 ?auto_12135 ) ) ( not ( = ?auto_12130 ?auto_12128 ) ) ( CALIBRATION_TARGET ?auto_12132 ?auto_12135 ) ( not ( = ?auto_12135 ?auto_12126 ) ) ( not ( = ?auto_12129 ?auto_12126 ) ) ( not ( = ?auto_12131 ?auto_12126 ) ) ( ON_BOARD ?auto_12134 ?auto_12133 ) ( not ( = ?auto_12132 ?auto_12134 ) ) ( SUPPORTS ?auto_12134 ?auto_12127 ) ( not ( = ?auto_12130 ?auto_12127 ) ) ( not ( = ?auto_12128 ?auto_12127 ) ) ( POINTING ?auto_12133 ?auto_12135 ) ( CALIBRATION_TARGET ?auto_12134 ?auto_12135 ) ( POWER_AVAIL ?auto_12133 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12131 ?auto_12130 ?auto_12129 ?auto_12128 )
      ( GET-3IMAGE-VERIFY ?auto_12126 ?auto_12127 ?auto_12129 ?auto_12128 ?auto_12131 ?auto_12130 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12160 - DIRECTION
      ?auto_12161 - MODE
      ?auto_12163 - DIRECTION
      ?auto_12162 - MODE
      ?auto_12165 - DIRECTION
      ?auto_12164 - MODE
    )
    :vars
    (
      ?auto_12166 - INSTRUMENT
      ?auto_12168 - SATELLITE
      ?auto_12170 - DIRECTION
      ?auto_12167 - DIRECTION
      ?auto_12169 - INSTRUMENT
      ?auto_12171 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_12166 ?auto_12168 ) ( SUPPORTS ?auto_12166 ?auto_12161 ) ( not ( = ?auto_12160 ?auto_12170 ) ) ( HAVE_IMAGE ?auto_12163 ?auto_12164 ) ( not ( = ?auto_12163 ?auto_12160 ) ) ( not ( = ?auto_12163 ?auto_12170 ) ) ( not ( = ?auto_12164 ?auto_12161 ) ) ( CALIBRATION_TARGET ?auto_12166 ?auto_12170 ) ( not ( = ?auto_12170 ?auto_12167 ) ) ( not ( = ?auto_12160 ?auto_12167 ) ) ( not ( = ?auto_12163 ?auto_12167 ) ) ( ON_BOARD ?auto_12169 ?auto_12168 ) ( not ( = ?auto_12166 ?auto_12169 ) ) ( SUPPORTS ?auto_12169 ?auto_12171 ) ( not ( = ?auto_12164 ?auto_12171 ) ) ( not ( = ?auto_12161 ?auto_12171 ) ) ( POINTING ?auto_12168 ?auto_12170 ) ( CALIBRATION_TARGET ?auto_12169 ?auto_12170 ) ( POWER_AVAIL ?auto_12168 ) ( HAVE_IMAGE ?auto_12163 ?auto_12162 ) ( HAVE_IMAGE ?auto_12165 ?auto_12164 ) ( not ( = ?auto_12160 ?auto_12165 ) ) ( not ( = ?auto_12161 ?auto_12162 ) ) ( not ( = ?auto_12163 ?auto_12165 ) ) ( not ( = ?auto_12162 ?auto_12164 ) ) ( not ( = ?auto_12162 ?auto_12171 ) ) ( not ( = ?auto_12165 ?auto_12170 ) ) ( not ( = ?auto_12165 ?auto_12167 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12163 ?auto_12164 ?auto_12160 ?auto_12161 )
      ( GET-3IMAGE-VERIFY ?auto_12160 ?auto_12161 ?auto_12163 ?auto_12162 ?auto_12165 ?auto_12164 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12172 - DIRECTION
      ?auto_12173 - MODE
      ?auto_12175 - DIRECTION
      ?auto_12174 - MODE
      ?auto_12177 - DIRECTION
      ?auto_12176 - MODE
    )
    :vars
    (
      ?auto_12178 - INSTRUMENT
      ?auto_12179 - SATELLITE
      ?auto_12181 - DIRECTION
      ?auto_12180 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12178 ?auto_12179 ) ( SUPPORTS ?auto_12178 ?auto_12173 ) ( not ( = ?auto_12172 ?auto_12181 ) ) ( HAVE_IMAGE ?auto_12175 ?auto_12174 ) ( not ( = ?auto_12175 ?auto_12172 ) ) ( not ( = ?auto_12175 ?auto_12181 ) ) ( not ( = ?auto_12174 ?auto_12173 ) ) ( CALIBRATION_TARGET ?auto_12178 ?auto_12181 ) ( not ( = ?auto_12181 ?auto_12177 ) ) ( not ( = ?auto_12172 ?auto_12177 ) ) ( not ( = ?auto_12175 ?auto_12177 ) ) ( ON_BOARD ?auto_12180 ?auto_12179 ) ( not ( = ?auto_12178 ?auto_12180 ) ) ( SUPPORTS ?auto_12180 ?auto_12176 ) ( not ( = ?auto_12174 ?auto_12176 ) ) ( not ( = ?auto_12173 ?auto_12176 ) ) ( POINTING ?auto_12179 ?auto_12181 ) ( CALIBRATION_TARGET ?auto_12180 ?auto_12181 ) ( POWER_AVAIL ?auto_12179 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12175 ?auto_12174 ?auto_12172 ?auto_12173 )
      ( GET-3IMAGE-VERIFY ?auto_12172 ?auto_12173 ?auto_12175 ?auto_12174 ?auto_12177 ?auto_12176 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12194 - DIRECTION
      ?auto_12195 - MODE
      ?auto_12197 - DIRECTION
      ?auto_12196 - MODE
      ?auto_12199 - DIRECTION
      ?auto_12198 - MODE
    )
    :vars
    (
      ?auto_12200 - INSTRUMENT
      ?auto_12201 - SATELLITE
      ?auto_12203 - DIRECTION
      ?auto_12202 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12200 ?auto_12201 ) ( SUPPORTS ?auto_12200 ?auto_12195 ) ( not ( = ?auto_12194 ?auto_12203 ) ) ( HAVE_IMAGE ?auto_12199 ?auto_12198 ) ( not ( = ?auto_12199 ?auto_12194 ) ) ( not ( = ?auto_12199 ?auto_12203 ) ) ( not ( = ?auto_12198 ?auto_12195 ) ) ( CALIBRATION_TARGET ?auto_12200 ?auto_12203 ) ( not ( = ?auto_12203 ?auto_12197 ) ) ( not ( = ?auto_12194 ?auto_12197 ) ) ( not ( = ?auto_12199 ?auto_12197 ) ) ( ON_BOARD ?auto_12202 ?auto_12201 ) ( not ( = ?auto_12200 ?auto_12202 ) ) ( SUPPORTS ?auto_12202 ?auto_12196 ) ( not ( = ?auto_12198 ?auto_12196 ) ) ( not ( = ?auto_12195 ?auto_12196 ) ) ( POINTING ?auto_12201 ?auto_12203 ) ( CALIBRATION_TARGET ?auto_12202 ?auto_12203 ) ( POWER_AVAIL ?auto_12201 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12199 ?auto_12198 ?auto_12194 ?auto_12195 )
      ( GET-3IMAGE-VERIFY ?auto_12194 ?auto_12195 ?auto_12197 ?auto_12196 ?auto_12199 ?auto_12198 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_12266 - DIRECTION
      ?auto_12267 - MODE
    )
    :vars
    (
      ?auto_12270 - INSTRUMENT
      ?auto_12272 - SATELLITE
      ?auto_12274 - DIRECTION
      ?auto_12269 - DIRECTION
      ?auto_12268 - MODE
      ?auto_12271 - DIRECTION
      ?auto_12273 - INSTRUMENT
      ?auto_12275 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_12270 ?auto_12272 ) ( SUPPORTS ?auto_12270 ?auto_12267 ) ( not ( = ?auto_12266 ?auto_12274 ) ) ( HAVE_IMAGE ?auto_12269 ?auto_12268 ) ( not ( = ?auto_12269 ?auto_12266 ) ) ( not ( = ?auto_12269 ?auto_12274 ) ) ( not ( = ?auto_12268 ?auto_12267 ) ) ( CALIBRATION_TARGET ?auto_12270 ?auto_12274 ) ( not ( = ?auto_12274 ?auto_12271 ) ) ( not ( = ?auto_12266 ?auto_12271 ) ) ( not ( = ?auto_12269 ?auto_12271 ) ) ( ON_BOARD ?auto_12273 ?auto_12272 ) ( not ( = ?auto_12270 ?auto_12273 ) ) ( SUPPORTS ?auto_12273 ?auto_12275 ) ( not ( = ?auto_12268 ?auto_12275 ) ) ( not ( = ?auto_12267 ?auto_12275 ) ) ( CALIBRATION_TARGET ?auto_12273 ?auto_12274 ) ( POWER_AVAIL ?auto_12272 ) ( POINTING ?auto_12272 ?auto_12269 ) )
    :subtasks
    ( ( !TURN_TO ?auto_12272 ?auto_12274 ?auto_12269 )
      ( GET-2IMAGE ?auto_12269 ?auto_12268 ?auto_12266 ?auto_12267 )
      ( GET-1IMAGE-VERIFY ?auto_12266 ?auto_12267 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_12276 - DIRECTION
      ?auto_12277 - MODE
      ?auto_12279 - DIRECTION
      ?auto_12278 - MODE
    )
    :vars
    (
      ?auto_12281 - INSTRUMENT
      ?auto_12285 - SATELLITE
      ?auto_12280 - DIRECTION
      ?auto_12283 - DIRECTION
      ?auto_12284 - INSTRUMENT
      ?auto_12282 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_12281 ?auto_12285 ) ( SUPPORTS ?auto_12281 ?auto_12278 ) ( not ( = ?auto_12279 ?auto_12280 ) ) ( HAVE_IMAGE ?auto_12276 ?auto_12277 ) ( not ( = ?auto_12276 ?auto_12279 ) ) ( not ( = ?auto_12276 ?auto_12280 ) ) ( not ( = ?auto_12277 ?auto_12278 ) ) ( CALIBRATION_TARGET ?auto_12281 ?auto_12280 ) ( not ( = ?auto_12280 ?auto_12283 ) ) ( not ( = ?auto_12279 ?auto_12283 ) ) ( not ( = ?auto_12276 ?auto_12283 ) ) ( ON_BOARD ?auto_12284 ?auto_12285 ) ( not ( = ?auto_12281 ?auto_12284 ) ) ( SUPPORTS ?auto_12284 ?auto_12282 ) ( not ( = ?auto_12277 ?auto_12282 ) ) ( not ( = ?auto_12278 ?auto_12282 ) ) ( CALIBRATION_TARGET ?auto_12284 ?auto_12280 ) ( POWER_AVAIL ?auto_12285 ) ( POINTING ?auto_12285 ?auto_12276 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_12279 ?auto_12278 )
      ( GET-2IMAGE-VERIFY ?auto_12276 ?auto_12277 ?auto_12279 ?auto_12278 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_12286 - DIRECTION
      ?auto_12287 - MODE
      ?auto_12289 - DIRECTION
      ?auto_12288 - MODE
    )
    :vars
    (
      ?auto_12292 - INSTRUMENT
      ?auto_12291 - SATELLITE
      ?auto_12290 - DIRECTION
      ?auto_12295 - DIRECTION
      ?auto_12294 - MODE
      ?auto_12293 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12292 ?auto_12291 ) ( SUPPORTS ?auto_12292 ?auto_12288 ) ( not ( = ?auto_12289 ?auto_12290 ) ) ( HAVE_IMAGE ?auto_12295 ?auto_12294 ) ( not ( = ?auto_12295 ?auto_12289 ) ) ( not ( = ?auto_12295 ?auto_12290 ) ) ( not ( = ?auto_12294 ?auto_12288 ) ) ( CALIBRATION_TARGET ?auto_12292 ?auto_12290 ) ( not ( = ?auto_12290 ?auto_12286 ) ) ( not ( = ?auto_12289 ?auto_12286 ) ) ( not ( = ?auto_12295 ?auto_12286 ) ) ( ON_BOARD ?auto_12293 ?auto_12291 ) ( not ( = ?auto_12292 ?auto_12293 ) ) ( SUPPORTS ?auto_12293 ?auto_12287 ) ( not ( = ?auto_12294 ?auto_12287 ) ) ( not ( = ?auto_12288 ?auto_12287 ) ) ( CALIBRATION_TARGET ?auto_12293 ?auto_12290 ) ( POWER_AVAIL ?auto_12291 ) ( POINTING ?auto_12291 ?auto_12295 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12295 ?auto_12294 ?auto_12289 ?auto_12288 )
      ( GET-2IMAGE-VERIFY ?auto_12286 ?auto_12287 ?auto_12289 ?auto_12288 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_12296 - DIRECTION
      ?auto_12297 - MODE
      ?auto_12299 - DIRECTION
      ?auto_12298 - MODE
    )
    :vars
    (
      ?auto_12302 - INSTRUMENT
      ?auto_12301 - SATELLITE
      ?auto_12300 - DIRECTION
      ?auto_12305 - DIRECTION
      ?auto_12304 - INSTRUMENT
      ?auto_12303 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_12302 ?auto_12301 ) ( SUPPORTS ?auto_12302 ?auto_12297 ) ( not ( = ?auto_12296 ?auto_12300 ) ) ( HAVE_IMAGE ?auto_12299 ?auto_12298 ) ( not ( = ?auto_12299 ?auto_12296 ) ) ( not ( = ?auto_12299 ?auto_12300 ) ) ( not ( = ?auto_12298 ?auto_12297 ) ) ( CALIBRATION_TARGET ?auto_12302 ?auto_12300 ) ( not ( = ?auto_12300 ?auto_12305 ) ) ( not ( = ?auto_12296 ?auto_12305 ) ) ( not ( = ?auto_12299 ?auto_12305 ) ) ( ON_BOARD ?auto_12304 ?auto_12301 ) ( not ( = ?auto_12302 ?auto_12304 ) ) ( SUPPORTS ?auto_12304 ?auto_12303 ) ( not ( = ?auto_12298 ?auto_12303 ) ) ( not ( = ?auto_12297 ?auto_12303 ) ) ( CALIBRATION_TARGET ?auto_12304 ?auto_12300 ) ( POWER_AVAIL ?auto_12301 ) ( POINTING ?auto_12301 ?auto_12299 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12299 ?auto_12298 ?auto_12296 ?auto_12297 )
      ( GET-2IMAGE-VERIFY ?auto_12296 ?auto_12297 ?auto_12299 ?auto_12298 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_12306 - DIRECTION
      ?auto_12307 - MODE
      ?auto_12309 - DIRECTION
      ?auto_12308 - MODE
    )
    :vars
    (
      ?auto_12312 - INSTRUMENT
      ?auto_12311 - SATELLITE
      ?auto_12310 - DIRECTION
      ?auto_12315 - DIRECTION
      ?auto_12314 - MODE
      ?auto_12313 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12312 ?auto_12311 ) ( SUPPORTS ?auto_12312 ?auto_12307 ) ( not ( = ?auto_12306 ?auto_12310 ) ) ( HAVE_IMAGE ?auto_12315 ?auto_12314 ) ( not ( = ?auto_12315 ?auto_12306 ) ) ( not ( = ?auto_12315 ?auto_12310 ) ) ( not ( = ?auto_12314 ?auto_12307 ) ) ( CALIBRATION_TARGET ?auto_12312 ?auto_12310 ) ( not ( = ?auto_12310 ?auto_12309 ) ) ( not ( = ?auto_12306 ?auto_12309 ) ) ( not ( = ?auto_12315 ?auto_12309 ) ) ( ON_BOARD ?auto_12313 ?auto_12311 ) ( not ( = ?auto_12312 ?auto_12313 ) ) ( SUPPORTS ?auto_12313 ?auto_12308 ) ( not ( = ?auto_12314 ?auto_12308 ) ) ( not ( = ?auto_12307 ?auto_12308 ) ) ( CALIBRATION_TARGET ?auto_12313 ?auto_12310 ) ( POWER_AVAIL ?auto_12311 ) ( POINTING ?auto_12311 ?auto_12315 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12315 ?auto_12314 ?auto_12306 ?auto_12307 )
      ( GET-2IMAGE-VERIFY ?auto_12306 ?auto_12307 ?auto_12309 ?auto_12308 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12328 - DIRECTION
      ?auto_12329 - MODE
      ?auto_12331 - DIRECTION
      ?auto_12330 - MODE
      ?auto_12333 - DIRECTION
      ?auto_12332 - MODE
    )
    :vars
    (
      ?auto_12336 - INSTRUMENT
      ?auto_12335 - SATELLITE
      ?auto_12334 - DIRECTION
      ?auto_12339 - DIRECTION
      ?auto_12338 - INSTRUMENT
      ?auto_12337 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_12336 ?auto_12335 ) ( SUPPORTS ?auto_12336 ?auto_12332 ) ( not ( = ?auto_12333 ?auto_12334 ) ) ( HAVE_IMAGE ?auto_12328 ?auto_12329 ) ( not ( = ?auto_12328 ?auto_12333 ) ) ( not ( = ?auto_12328 ?auto_12334 ) ) ( not ( = ?auto_12329 ?auto_12332 ) ) ( CALIBRATION_TARGET ?auto_12336 ?auto_12334 ) ( not ( = ?auto_12334 ?auto_12339 ) ) ( not ( = ?auto_12333 ?auto_12339 ) ) ( not ( = ?auto_12328 ?auto_12339 ) ) ( ON_BOARD ?auto_12338 ?auto_12335 ) ( not ( = ?auto_12336 ?auto_12338 ) ) ( SUPPORTS ?auto_12338 ?auto_12337 ) ( not ( = ?auto_12329 ?auto_12337 ) ) ( not ( = ?auto_12332 ?auto_12337 ) ) ( CALIBRATION_TARGET ?auto_12338 ?auto_12334 ) ( POWER_AVAIL ?auto_12335 ) ( POINTING ?auto_12335 ?auto_12328 ) ( HAVE_IMAGE ?auto_12331 ?auto_12330 ) ( not ( = ?auto_12328 ?auto_12331 ) ) ( not ( = ?auto_12329 ?auto_12330 ) ) ( not ( = ?auto_12331 ?auto_12333 ) ) ( not ( = ?auto_12331 ?auto_12334 ) ) ( not ( = ?auto_12331 ?auto_12339 ) ) ( not ( = ?auto_12330 ?auto_12332 ) ) ( not ( = ?auto_12330 ?auto_12337 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12328 ?auto_12329 ?auto_12333 ?auto_12332 )
      ( GET-3IMAGE-VERIFY ?auto_12328 ?auto_12329 ?auto_12331 ?auto_12330 ?auto_12333 ?auto_12332 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12340 - DIRECTION
      ?auto_12341 - MODE
      ?auto_12343 - DIRECTION
      ?auto_12342 - MODE
      ?auto_12345 - DIRECTION
      ?auto_12344 - MODE
    )
    :vars
    (
      ?auto_12348 - INSTRUMENT
      ?auto_12347 - SATELLITE
      ?auto_12346 - DIRECTION
      ?auto_12349 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12348 ?auto_12347 ) ( SUPPORTS ?auto_12348 ?auto_12344 ) ( not ( = ?auto_12345 ?auto_12346 ) ) ( HAVE_IMAGE ?auto_12340 ?auto_12341 ) ( not ( = ?auto_12340 ?auto_12345 ) ) ( not ( = ?auto_12340 ?auto_12346 ) ) ( not ( = ?auto_12341 ?auto_12344 ) ) ( CALIBRATION_TARGET ?auto_12348 ?auto_12346 ) ( not ( = ?auto_12346 ?auto_12343 ) ) ( not ( = ?auto_12345 ?auto_12343 ) ) ( not ( = ?auto_12340 ?auto_12343 ) ) ( ON_BOARD ?auto_12349 ?auto_12347 ) ( not ( = ?auto_12348 ?auto_12349 ) ) ( SUPPORTS ?auto_12349 ?auto_12342 ) ( not ( = ?auto_12341 ?auto_12342 ) ) ( not ( = ?auto_12344 ?auto_12342 ) ) ( CALIBRATION_TARGET ?auto_12349 ?auto_12346 ) ( POWER_AVAIL ?auto_12347 ) ( POINTING ?auto_12347 ?auto_12340 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12340 ?auto_12341 ?auto_12345 ?auto_12344 )
      ( GET-3IMAGE-VERIFY ?auto_12340 ?auto_12341 ?auto_12343 ?auto_12342 ?auto_12345 ?auto_12344 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12350 - DIRECTION
      ?auto_12351 - MODE
      ?auto_12353 - DIRECTION
      ?auto_12352 - MODE
      ?auto_12355 - DIRECTION
      ?auto_12354 - MODE
    )
    :vars
    (
      ?auto_12358 - INSTRUMENT
      ?auto_12357 - SATELLITE
      ?auto_12356 - DIRECTION
      ?auto_12361 - DIRECTION
      ?auto_12360 - INSTRUMENT
      ?auto_12359 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_12358 ?auto_12357 ) ( SUPPORTS ?auto_12358 ?auto_12352 ) ( not ( = ?auto_12353 ?auto_12356 ) ) ( HAVE_IMAGE ?auto_12355 ?auto_12354 ) ( not ( = ?auto_12355 ?auto_12353 ) ) ( not ( = ?auto_12355 ?auto_12356 ) ) ( not ( = ?auto_12354 ?auto_12352 ) ) ( CALIBRATION_TARGET ?auto_12358 ?auto_12356 ) ( not ( = ?auto_12356 ?auto_12361 ) ) ( not ( = ?auto_12353 ?auto_12361 ) ) ( not ( = ?auto_12355 ?auto_12361 ) ) ( ON_BOARD ?auto_12360 ?auto_12357 ) ( not ( = ?auto_12358 ?auto_12360 ) ) ( SUPPORTS ?auto_12360 ?auto_12359 ) ( not ( = ?auto_12354 ?auto_12359 ) ) ( not ( = ?auto_12352 ?auto_12359 ) ) ( CALIBRATION_TARGET ?auto_12360 ?auto_12356 ) ( POWER_AVAIL ?auto_12357 ) ( POINTING ?auto_12357 ?auto_12355 ) ( HAVE_IMAGE ?auto_12350 ?auto_12351 ) ( not ( = ?auto_12350 ?auto_12353 ) ) ( not ( = ?auto_12350 ?auto_12355 ) ) ( not ( = ?auto_12350 ?auto_12356 ) ) ( not ( = ?auto_12350 ?auto_12361 ) ) ( not ( = ?auto_12351 ?auto_12352 ) ) ( not ( = ?auto_12351 ?auto_12354 ) ) ( not ( = ?auto_12351 ?auto_12359 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12355 ?auto_12354 ?auto_12353 ?auto_12352 )
      ( GET-3IMAGE-VERIFY ?auto_12350 ?auto_12351 ?auto_12353 ?auto_12352 ?auto_12355 ?auto_12354 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12362 - DIRECTION
      ?auto_12363 - MODE
      ?auto_12365 - DIRECTION
      ?auto_12364 - MODE
      ?auto_12367 - DIRECTION
      ?auto_12366 - MODE
    )
    :vars
    (
      ?auto_12370 - INSTRUMENT
      ?auto_12369 - SATELLITE
      ?auto_12368 - DIRECTION
      ?auto_12371 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12370 ?auto_12369 ) ( SUPPORTS ?auto_12370 ?auto_12364 ) ( not ( = ?auto_12365 ?auto_12368 ) ) ( HAVE_IMAGE ?auto_12362 ?auto_12363 ) ( not ( = ?auto_12362 ?auto_12365 ) ) ( not ( = ?auto_12362 ?auto_12368 ) ) ( not ( = ?auto_12363 ?auto_12364 ) ) ( CALIBRATION_TARGET ?auto_12370 ?auto_12368 ) ( not ( = ?auto_12368 ?auto_12367 ) ) ( not ( = ?auto_12365 ?auto_12367 ) ) ( not ( = ?auto_12362 ?auto_12367 ) ) ( ON_BOARD ?auto_12371 ?auto_12369 ) ( not ( = ?auto_12370 ?auto_12371 ) ) ( SUPPORTS ?auto_12371 ?auto_12366 ) ( not ( = ?auto_12363 ?auto_12366 ) ) ( not ( = ?auto_12364 ?auto_12366 ) ) ( CALIBRATION_TARGET ?auto_12371 ?auto_12368 ) ( POWER_AVAIL ?auto_12369 ) ( POINTING ?auto_12369 ?auto_12362 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12362 ?auto_12363 ?auto_12365 ?auto_12364 )
      ( GET-3IMAGE-VERIFY ?auto_12362 ?auto_12363 ?auto_12365 ?auto_12364 ?auto_12367 ?auto_12366 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12384 - DIRECTION
      ?auto_12385 - MODE
      ?auto_12387 - DIRECTION
      ?auto_12386 - MODE
      ?auto_12389 - DIRECTION
      ?auto_12388 - MODE
    )
    :vars
    (
      ?auto_12392 - INSTRUMENT
      ?auto_12391 - SATELLITE
      ?auto_12390 - DIRECTION
      ?auto_12393 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12392 ?auto_12391 ) ( SUPPORTS ?auto_12392 ?auto_12388 ) ( not ( = ?auto_12389 ?auto_12390 ) ) ( HAVE_IMAGE ?auto_12387 ?auto_12386 ) ( not ( = ?auto_12387 ?auto_12389 ) ) ( not ( = ?auto_12387 ?auto_12390 ) ) ( not ( = ?auto_12386 ?auto_12388 ) ) ( CALIBRATION_TARGET ?auto_12392 ?auto_12390 ) ( not ( = ?auto_12390 ?auto_12384 ) ) ( not ( = ?auto_12389 ?auto_12384 ) ) ( not ( = ?auto_12387 ?auto_12384 ) ) ( ON_BOARD ?auto_12393 ?auto_12391 ) ( not ( = ?auto_12392 ?auto_12393 ) ) ( SUPPORTS ?auto_12393 ?auto_12385 ) ( not ( = ?auto_12386 ?auto_12385 ) ) ( not ( = ?auto_12388 ?auto_12385 ) ) ( CALIBRATION_TARGET ?auto_12393 ?auto_12390 ) ( POWER_AVAIL ?auto_12391 ) ( POINTING ?auto_12391 ?auto_12387 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12387 ?auto_12386 ?auto_12389 ?auto_12388 )
      ( GET-3IMAGE-VERIFY ?auto_12384 ?auto_12385 ?auto_12387 ?auto_12386 ?auto_12389 ?auto_12388 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12406 - DIRECTION
      ?auto_12407 - MODE
      ?auto_12409 - DIRECTION
      ?auto_12408 - MODE
      ?auto_12411 - DIRECTION
      ?auto_12410 - MODE
    )
    :vars
    (
      ?auto_12414 - INSTRUMENT
      ?auto_12413 - SATELLITE
      ?auto_12412 - DIRECTION
      ?auto_12415 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12414 ?auto_12413 ) ( SUPPORTS ?auto_12414 ?auto_12408 ) ( not ( = ?auto_12409 ?auto_12412 ) ) ( HAVE_IMAGE ?auto_12411 ?auto_12410 ) ( not ( = ?auto_12411 ?auto_12409 ) ) ( not ( = ?auto_12411 ?auto_12412 ) ) ( not ( = ?auto_12410 ?auto_12408 ) ) ( CALIBRATION_TARGET ?auto_12414 ?auto_12412 ) ( not ( = ?auto_12412 ?auto_12406 ) ) ( not ( = ?auto_12409 ?auto_12406 ) ) ( not ( = ?auto_12411 ?auto_12406 ) ) ( ON_BOARD ?auto_12415 ?auto_12413 ) ( not ( = ?auto_12414 ?auto_12415 ) ) ( SUPPORTS ?auto_12415 ?auto_12407 ) ( not ( = ?auto_12410 ?auto_12407 ) ) ( not ( = ?auto_12408 ?auto_12407 ) ) ( CALIBRATION_TARGET ?auto_12415 ?auto_12412 ) ( POWER_AVAIL ?auto_12413 ) ( POINTING ?auto_12413 ?auto_12411 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12411 ?auto_12410 ?auto_12409 ?auto_12408 )
      ( GET-3IMAGE-VERIFY ?auto_12406 ?auto_12407 ?auto_12409 ?auto_12408 ?auto_12411 ?auto_12410 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12440 - DIRECTION
      ?auto_12441 - MODE
      ?auto_12443 - DIRECTION
      ?auto_12442 - MODE
      ?auto_12445 - DIRECTION
      ?auto_12444 - MODE
    )
    :vars
    (
      ?auto_12448 - INSTRUMENT
      ?auto_12447 - SATELLITE
      ?auto_12446 - DIRECTION
      ?auto_12451 - DIRECTION
      ?auto_12450 - INSTRUMENT
      ?auto_12449 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_12448 ?auto_12447 ) ( SUPPORTS ?auto_12448 ?auto_12441 ) ( not ( = ?auto_12440 ?auto_12446 ) ) ( HAVE_IMAGE ?auto_12443 ?auto_12444 ) ( not ( = ?auto_12443 ?auto_12440 ) ) ( not ( = ?auto_12443 ?auto_12446 ) ) ( not ( = ?auto_12444 ?auto_12441 ) ) ( CALIBRATION_TARGET ?auto_12448 ?auto_12446 ) ( not ( = ?auto_12446 ?auto_12451 ) ) ( not ( = ?auto_12440 ?auto_12451 ) ) ( not ( = ?auto_12443 ?auto_12451 ) ) ( ON_BOARD ?auto_12450 ?auto_12447 ) ( not ( = ?auto_12448 ?auto_12450 ) ) ( SUPPORTS ?auto_12450 ?auto_12449 ) ( not ( = ?auto_12444 ?auto_12449 ) ) ( not ( = ?auto_12441 ?auto_12449 ) ) ( CALIBRATION_TARGET ?auto_12450 ?auto_12446 ) ( POWER_AVAIL ?auto_12447 ) ( POINTING ?auto_12447 ?auto_12443 ) ( HAVE_IMAGE ?auto_12443 ?auto_12442 ) ( HAVE_IMAGE ?auto_12445 ?auto_12444 ) ( not ( = ?auto_12440 ?auto_12445 ) ) ( not ( = ?auto_12441 ?auto_12442 ) ) ( not ( = ?auto_12443 ?auto_12445 ) ) ( not ( = ?auto_12442 ?auto_12444 ) ) ( not ( = ?auto_12442 ?auto_12449 ) ) ( not ( = ?auto_12445 ?auto_12446 ) ) ( not ( = ?auto_12445 ?auto_12451 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12443 ?auto_12444 ?auto_12440 ?auto_12441 )
      ( GET-3IMAGE-VERIFY ?auto_12440 ?auto_12441 ?auto_12443 ?auto_12442 ?auto_12445 ?auto_12444 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12452 - DIRECTION
      ?auto_12453 - MODE
      ?auto_12455 - DIRECTION
      ?auto_12454 - MODE
      ?auto_12457 - DIRECTION
      ?auto_12456 - MODE
    )
    :vars
    (
      ?auto_12460 - INSTRUMENT
      ?auto_12459 - SATELLITE
      ?auto_12458 - DIRECTION
      ?auto_12461 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12460 ?auto_12459 ) ( SUPPORTS ?auto_12460 ?auto_12453 ) ( not ( = ?auto_12452 ?auto_12458 ) ) ( HAVE_IMAGE ?auto_12455 ?auto_12454 ) ( not ( = ?auto_12455 ?auto_12452 ) ) ( not ( = ?auto_12455 ?auto_12458 ) ) ( not ( = ?auto_12454 ?auto_12453 ) ) ( CALIBRATION_TARGET ?auto_12460 ?auto_12458 ) ( not ( = ?auto_12458 ?auto_12457 ) ) ( not ( = ?auto_12452 ?auto_12457 ) ) ( not ( = ?auto_12455 ?auto_12457 ) ) ( ON_BOARD ?auto_12461 ?auto_12459 ) ( not ( = ?auto_12460 ?auto_12461 ) ) ( SUPPORTS ?auto_12461 ?auto_12456 ) ( not ( = ?auto_12454 ?auto_12456 ) ) ( not ( = ?auto_12453 ?auto_12456 ) ) ( CALIBRATION_TARGET ?auto_12461 ?auto_12458 ) ( POWER_AVAIL ?auto_12459 ) ( POINTING ?auto_12459 ?auto_12455 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12455 ?auto_12454 ?auto_12452 ?auto_12453 )
      ( GET-3IMAGE-VERIFY ?auto_12452 ?auto_12453 ?auto_12455 ?auto_12454 ?auto_12457 ?auto_12456 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12474 - DIRECTION
      ?auto_12475 - MODE
      ?auto_12477 - DIRECTION
      ?auto_12476 - MODE
      ?auto_12479 - DIRECTION
      ?auto_12478 - MODE
    )
    :vars
    (
      ?auto_12482 - INSTRUMENT
      ?auto_12481 - SATELLITE
      ?auto_12480 - DIRECTION
      ?auto_12483 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12482 ?auto_12481 ) ( SUPPORTS ?auto_12482 ?auto_12475 ) ( not ( = ?auto_12474 ?auto_12480 ) ) ( HAVE_IMAGE ?auto_12479 ?auto_12478 ) ( not ( = ?auto_12479 ?auto_12474 ) ) ( not ( = ?auto_12479 ?auto_12480 ) ) ( not ( = ?auto_12478 ?auto_12475 ) ) ( CALIBRATION_TARGET ?auto_12482 ?auto_12480 ) ( not ( = ?auto_12480 ?auto_12477 ) ) ( not ( = ?auto_12474 ?auto_12477 ) ) ( not ( = ?auto_12479 ?auto_12477 ) ) ( ON_BOARD ?auto_12483 ?auto_12481 ) ( not ( = ?auto_12482 ?auto_12483 ) ) ( SUPPORTS ?auto_12483 ?auto_12476 ) ( not ( = ?auto_12478 ?auto_12476 ) ) ( not ( = ?auto_12475 ?auto_12476 ) ) ( CALIBRATION_TARGET ?auto_12483 ?auto_12480 ) ( POWER_AVAIL ?auto_12481 ) ( POINTING ?auto_12481 ?auto_12479 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12479 ?auto_12478 ?auto_12474 ?auto_12475 )
      ( GET-3IMAGE-VERIFY ?auto_12474 ?auto_12475 ?auto_12477 ?auto_12476 ?auto_12479 ?auto_12478 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_12546 - DIRECTION
      ?auto_12547 - MODE
    )
    :vars
    (
      ?auto_12550 - INSTRUMENT
      ?auto_12549 - SATELLITE
      ?auto_12548 - DIRECTION
      ?auto_12554 - DIRECTION
      ?auto_12553 - MODE
      ?auto_12555 - DIRECTION
      ?auto_12552 - INSTRUMENT
      ?auto_12551 - MODE
      ?auto_12556 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12550 ?auto_12549 ) ( SUPPORTS ?auto_12550 ?auto_12547 ) ( not ( = ?auto_12546 ?auto_12548 ) ) ( HAVE_IMAGE ?auto_12554 ?auto_12553 ) ( not ( = ?auto_12554 ?auto_12546 ) ) ( not ( = ?auto_12554 ?auto_12548 ) ) ( not ( = ?auto_12553 ?auto_12547 ) ) ( CALIBRATION_TARGET ?auto_12550 ?auto_12548 ) ( not ( = ?auto_12548 ?auto_12555 ) ) ( not ( = ?auto_12546 ?auto_12555 ) ) ( not ( = ?auto_12554 ?auto_12555 ) ) ( ON_BOARD ?auto_12552 ?auto_12549 ) ( not ( = ?auto_12550 ?auto_12552 ) ) ( SUPPORTS ?auto_12552 ?auto_12551 ) ( not ( = ?auto_12553 ?auto_12551 ) ) ( not ( = ?auto_12547 ?auto_12551 ) ) ( CALIBRATION_TARGET ?auto_12552 ?auto_12548 ) ( POINTING ?auto_12549 ?auto_12554 ) ( ON_BOARD ?auto_12556 ?auto_12549 ) ( POWER_ON ?auto_12556 ) ( not ( = ?auto_12550 ?auto_12556 ) ) ( not ( = ?auto_12552 ?auto_12556 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_12556 ?auto_12549 )
      ( GET-2IMAGE ?auto_12554 ?auto_12553 ?auto_12546 ?auto_12547 )
      ( GET-1IMAGE-VERIFY ?auto_12546 ?auto_12547 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_12557 - DIRECTION
      ?auto_12558 - MODE
      ?auto_12560 - DIRECTION
      ?auto_12559 - MODE
    )
    :vars
    (
      ?auto_12563 - INSTRUMENT
      ?auto_12564 - SATELLITE
      ?auto_12562 - DIRECTION
      ?auto_12565 - DIRECTION
      ?auto_12561 - INSTRUMENT
      ?auto_12567 - MODE
      ?auto_12566 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12563 ?auto_12564 ) ( SUPPORTS ?auto_12563 ?auto_12559 ) ( not ( = ?auto_12560 ?auto_12562 ) ) ( HAVE_IMAGE ?auto_12557 ?auto_12558 ) ( not ( = ?auto_12557 ?auto_12560 ) ) ( not ( = ?auto_12557 ?auto_12562 ) ) ( not ( = ?auto_12558 ?auto_12559 ) ) ( CALIBRATION_TARGET ?auto_12563 ?auto_12562 ) ( not ( = ?auto_12562 ?auto_12565 ) ) ( not ( = ?auto_12560 ?auto_12565 ) ) ( not ( = ?auto_12557 ?auto_12565 ) ) ( ON_BOARD ?auto_12561 ?auto_12564 ) ( not ( = ?auto_12563 ?auto_12561 ) ) ( SUPPORTS ?auto_12561 ?auto_12567 ) ( not ( = ?auto_12558 ?auto_12567 ) ) ( not ( = ?auto_12559 ?auto_12567 ) ) ( CALIBRATION_TARGET ?auto_12561 ?auto_12562 ) ( POINTING ?auto_12564 ?auto_12557 ) ( ON_BOARD ?auto_12566 ?auto_12564 ) ( POWER_ON ?auto_12566 ) ( not ( = ?auto_12563 ?auto_12566 ) ) ( not ( = ?auto_12561 ?auto_12566 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_12560 ?auto_12559 )
      ( GET-2IMAGE-VERIFY ?auto_12557 ?auto_12558 ?auto_12560 ?auto_12559 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_12568 - DIRECTION
      ?auto_12569 - MODE
      ?auto_12571 - DIRECTION
      ?auto_12570 - MODE
    )
    :vars
    (
      ?auto_12573 - INSTRUMENT
      ?auto_12576 - SATELLITE
      ?auto_12575 - DIRECTION
      ?auto_12578 - DIRECTION
      ?auto_12577 - MODE
      ?auto_12574 - INSTRUMENT
      ?auto_12572 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12573 ?auto_12576 ) ( SUPPORTS ?auto_12573 ?auto_12570 ) ( not ( = ?auto_12571 ?auto_12575 ) ) ( HAVE_IMAGE ?auto_12578 ?auto_12577 ) ( not ( = ?auto_12578 ?auto_12571 ) ) ( not ( = ?auto_12578 ?auto_12575 ) ) ( not ( = ?auto_12577 ?auto_12570 ) ) ( CALIBRATION_TARGET ?auto_12573 ?auto_12575 ) ( not ( = ?auto_12575 ?auto_12568 ) ) ( not ( = ?auto_12571 ?auto_12568 ) ) ( not ( = ?auto_12578 ?auto_12568 ) ) ( ON_BOARD ?auto_12574 ?auto_12576 ) ( not ( = ?auto_12573 ?auto_12574 ) ) ( SUPPORTS ?auto_12574 ?auto_12569 ) ( not ( = ?auto_12577 ?auto_12569 ) ) ( not ( = ?auto_12570 ?auto_12569 ) ) ( CALIBRATION_TARGET ?auto_12574 ?auto_12575 ) ( POINTING ?auto_12576 ?auto_12578 ) ( ON_BOARD ?auto_12572 ?auto_12576 ) ( POWER_ON ?auto_12572 ) ( not ( = ?auto_12573 ?auto_12572 ) ) ( not ( = ?auto_12574 ?auto_12572 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12578 ?auto_12577 ?auto_12571 ?auto_12570 )
      ( GET-2IMAGE-VERIFY ?auto_12568 ?auto_12569 ?auto_12571 ?auto_12570 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_12579 - DIRECTION
      ?auto_12580 - MODE
      ?auto_12582 - DIRECTION
      ?auto_12581 - MODE
    )
    :vars
    (
      ?auto_12584 - INSTRUMENT
      ?auto_12589 - SATELLITE
      ?auto_12586 - DIRECTION
      ?auto_12587 - DIRECTION
      ?auto_12585 - INSTRUMENT
      ?auto_12588 - MODE
      ?auto_12583 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12584 ?auto_12589 ) ( SUPPORTS ?auto_12584 ?auto_12580 ) ( not ( = ?auto_12579 ?auto_12586 ) ) ( HAVE_IMAGE ?auto_12582 ?auto_12581 ) ( not ( = ?auto_12582 ?auto_12579 ) ) ( not ( = ?auto_12582 ?auto_12586 ) ) ( not ( = ?auto_12581 ?auto_12580 ) ) ( CALIBRATION_TARGET ?auto_12584 ?auto_12586 ) ( not ( = ?auto_12586 ?auto_12587 ) ) ( not ( = ?auto_12579 ?auto_12587 ) ) ( not ( = ?auto_12582 ?auto_12587 ) ) ( ON_BOARD ?auto_12585 ?auto_12589 ) ( not ( = ?auto_12584 ?auto_12585 ) ) ( SUPPORTS ?auto_12585 ?auto_12588 ) ( not ( = ?auto_12581 ?auto_12588 ) ) ( not ( = ?auto_12580 ?auto_12588 ) ) ( CALIBRATION_TARGET ?auto_12585 ?auto_12586 ) ( POINTING ?auto_12589 ?auto_12582 ) ( ON_BOARD ?auto_12583 ?auto_12589 ) ( POWER_ON ?auto_12583 ) ( not ( = ?auto_12584 ?auto_12583 ) ) ( not ( = ?auto_12585 ?auto_12583 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12582 ?auto_12581 ?auto_12579 ?auto_12580 )
      ( GET-2IMAGE-VERIFY ?auto_12579 ?auto_12580 ?auto_12582 ?auto_12581 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_12590 - DIRECTION
      ?auto_12591 - MODE
      ?auto_12593 - DIRECTION
      ?auto_12592 - MODE
    )
    :vars
    (
      ?auto_12595 - INSTRUMENT
      ?auto_12598 - SATELLITE
      ?auto_12597 - DIRECTION
      ?auto_12600 - DIRECTION
      ?auto_12599 - MODE
      ?auto_12596 - INSTRUMENT
      ?auto_12594 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12595 ?auto_12598 ) ( SUPPORTS ?auto_12595 ?auto_12591 ) ( not ( = ?auto_12590 ?auto_12597 ) ) ( HAVE_IMAGE ?auto_12600 ?auto_12599 ) ( not ( = ?auto_12600 ?auto_12590 ) ) ( not ( = ?auto_12600 ?auto_12597 ) ) ( not ( = ?auto_12599 ?auto_12591 ) ) ( CALIBRATION_TARGET ?auto_12595 ?auto_12597 ) ( not ( = ?auto_12597 ?auto_12593 ) ) ( not ( = ?auto_12590 ?auto_12593 ) ) ( not ( = ?auto_12600 ?auto_12593 ) ) ( ON_BOARD ?auto_12596 ?auto_12598 ) ( not ( = ?auto_12595 ?auto_12596 ) ) ( SUPPORTS ?auto_12596 ?auto_12592 ) ( not ( = ?auto_12599 ?auto_12592 ) ) ( not ( = ?auto_12591 ?auto_12592 ) ) ( CALIBRATION_TARGET ?auto_12596 ?auto_12597 ) ( POINTING ?auto_12598 ?auto_12600 ) ( ON_BOARD ?auto_12594 ?auto_12598 ) ( POWER_ON ?auto_12594 ) ( not ( = ?auto_12595 ?auto_12594 ) ) ( not ( = ?auto_12596 ?auto_12594 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12600 ?auto_12599 ?auto_12590 ?auto_12591 )
      ( GET-2IMAGE-VERIFY ?auto_12590 ?auto_12591 ?auto_12593 ?auto_12592 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12614 - DIRECTION
      ?auto_12615 - MODE
      ?auto_12617 - DIRECTION
      ?auto_12616 - MODE
      ?auto_12619 - DIRECTION
      ?auto_12618 - MODE
    )
    :vars
    (
      ?auto_12621 - INSTRUMENT
      ?auto_12626 - SATELLITE
      ?auto_12623 - DIRECTION
      ?auto_12624 - DIRECTION
      ?auto_12622 - INSTRUMENT
      ?auto_12625 - MODE
      ?auto_12620 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12621 ?auto_12626 ) ( SUPPORTS ?auto_12621 ?auto_12618 ) ( not ( = ?auto_12619 ?auto_12623 ) ) ( HAVE_IMAGE ?auto_12614 ?auto_12615 ) ( not ( = ?auto_12614 ?auto_12619 ) ) ( not ( = ?auto_12614 ?auto_12623 ) ) ( not ( = ?auto_12615 ?auto_12618 ) ) ( CALIBRATION_TARGET ?auto_12621 ?auto_12623 ) ( not ( = ?auto_12623 ?auto_12624 ) ) ( not ( = ?auto_12619 ?auto_12624 ) ) ( not ( = ?auto_12614 ?auto_12624 ) ) ( ON_BOARD ?auto_12622 ?auto_12626 ) ( not ( = ?auto_12621 ?auto_12622 ) ) ( SUPPORTS ?auto_12622 ?auto_12625 ) ( not ( = ?auto_12615 ?auto_12625 ) ) ( not ( = ?auto_12618 ?auto_12625 ) ) ( CALIBRATION_TARGET ?auto_12622 ?auto_12623 ) ( POINTING ?auto_12626 ?auto_12614 ) ( ON_BOARD ?auto_12620 ?auto_12626 ) ( POWER_ON ?auto_12620 ) ( not ( = ?auto_12621 ?auto_12620 ) ) ( not ( = ?auto_12622 ?auto_12620 ) ) ( HAVE_IMAGE ?auto_12617 ?auto_12616 ) ( not ( = ?auto_12614 ?auto_12617 ) ) ( not ( = ?auto_12615 ?auto_12616 ) ) ( not ( = ?auto_12617 ?auto_12619 ) ) ( not ( = ?auto_12617 ?auto_12623 ) ) ( not ( = ?auto_12617 ?auto_12624 ) ) ( not ( = ?auto_12616 ?auto_12618 ) ) ( not ( = ?auto_12616 ?auto_12625 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12614 ?auto_12615 ?auto_12619 ?auto_12618 )
      ( GET-3IMAGE-VERIFY ?auto_12614 ?auto_12615 ?auto_12617 ?auto_12616 ?auto_12619 ?auto_12618 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12627 - DIRECTION
      ?auto_12628 - MODE
      ?auto_12630 - DIRECTION
      ?auto_12629 - MODE
      ?auto_12632 - DIRECTION
      ?auto_12631 - MODE
    )
    :vars
    (
      ?auto_12634 - INSTRUMENT
      ?auto_12637 - SATELLITE
      ?auto_12636 - DIRECTION
      ?auto_12635 - INSTRUMENT
      ?auto_12633 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12634 ?auto_12637 ) ( SUPPORTS ?auto_12634 ?auto_12631 ) ( not ( = ?auto_12632 ?auto_12636 ) ) ( HAVE_IMAGE ?auto_12627 ?auto_12628 ) ( not ( = ?auto_12627 ?auto_12632 ) ) ( not ( = ?auto_12627 ?auto_12636 ) ) ( not ( = ?auto_12628 ?auto_12631 ) ) ( CALIBRATION_TARGET ?auto_12634 ?auto_12636 ) ( not ( = ?auto_12636 ?auto_12630 ) ) ( not ( = ?auto_12632 ?auto_12630 ) ) ( not ( = ?auto_12627 ?auto_12630 ) ) ( ON_BOARD ?auto_12635 ?auto_12637 ) ( not ( = ?auto_12634 ?auto_12635 ) ) ( SUPPORTS ?auto_12635 ?auto_12629 ) ( not ( = ?auto_12628 ?auto_12629 ) ) ( not ( = ?auto_12631 ?auto_12629 ) ) ( CALIBRATION_TARGET ?auto_12635 ?auto_12636 ) ( POINTING ?auto_12637 ?auto_12627 ) ( ON_BOARD ?auto_12633 ?auto_12637 ) ( POWER_ON ?auto_12633 ) ( not ( = ?auto_12634 ?auto_12633 ) ) ( not ( = ?auto_12635 ?auto_12633 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12627 ?auto_12628 ?auto_12632 ?auto_12631 )
      ( GET-3IMAGE-VERIFY ?auto_12627 ?auto_12628 ?auto_12630 ?auto_12629 ?auto_12632 ?auto_12631 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12638 - DIRECTION
      ?auto_12639 - MODE
      ?auto_12641 - DIRECTION
      ?auto_12640 - MODE
      ?auto_12643 - DIRECTION
      ?auto_12642 - MODE
    )
    :vars
    (
      ?auto_12645 - INSTRUMENT
      ?auto_12650 - SATELLITE
      ?auto_12647 - DIRECTION
      ?auto_12648 - DIRECTION
      ?auto_12646 - INSTRUMENT
      ?auto_12649 - MODE
      ?auto_12644 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12645 ?auto_12650 ) ( SUPPORTS ?auto_12645 ?auto_12640 ) ( not ( = ?auto_12641 ?auto_12647 ) ) ( HAVE_IMAGE ?auto_12643 ?auto_12642 ) ( not ( = ?auto_12643 ?auto_12641 ) ) ( not ( = ?auto_12643 ?auto_12647 ) ) ( not ( = ?auto_12642 ?auto_12640 ) ) ( CALIBRATION_TARGET ?auto_12645 ?auto_12647 ) ( not ( = ?auto_12647 ?auto_12648 ) ) ( not ( = ?auto_12641 ?auto_12648 ) ) ( not ( = ?auto_12643 ?auto_12648 ) ) ( ON_BOARD ?auto_12646 ?auto_12650 ) ( not ( = ?auto_12645 ?auto_12646 ) ) ( SUPPORTS ?auto_12646 ?auto_12649 ) ( not ( = ?auto_12642 ?auto_12649 ) ) ( not ( = ?auto_12640 ?auto_12649 ) ) ( CALIBRATION_TARGET ?auto_12646 ?auto_12647 ) ( POINTING ?auto_12650 ?auto_12643 ) ( ON_BOARD ?auto_12644 ?auto_12650 ) ( POWER_ON ?auto_12644 ) ( not ( = ?auto_12645 ?auto_12644 ) ) ( not ( = ?auto_12646 ?auto_12644 ) ) ( HAVE_IMAGE ?auto_12638 ?auto_12639 ) ( not ( = ?auto_12638 ?auto_12641 ) ) ( not ( = ?auto_12638 ?auto_12643 ) ) ( not ( = ?auto_12638 ?auto_12647 ) ) ( not ( = ?auto_12638 ?auto_12648 ) ) ( not ( = ?auto_12639 ?auto_12640 ) ) ( not ( = ?auto_12639 ?auto_12642 ) ) ( not ( = ?auto_12639 ?auto_12649 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12643 ?auto_12642 ?auto_12641 ?auto_12640 )
      ( GET-3IMAGE-VERIFY ?auto_12638 ?auto_12639 ?auto_12641 ?auto_12640 ?auto_12643 ?auto_12642 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12651 - DIRECTION
      ?auto_12652 - MODE
      ?auto_12654 - DIRECTION
      ?auto_12653 - MODE
      ?auto_12656 - DIRECTION
      ?auto_12655 - MODE
    )
    :vars
    (
      ?auto_12658 - INSTRUMENT
      ?auto_12661 - SATELLITE
      ?auto_12660 - DIRECTION
      ?auto_12659 - INSTRUMENT
      ?auto_12657 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12658 ?auto_12661 ) ( SUPPORTS ?auto_12658 ?auto_12653 ) ( not ( = ?auto_12654 ?auto_12660 ) ) ( HAVE_IMAGE ?auto_12651 ?auto_12652 ) ( not ( = ?auto_12651 ?auto_12654 ) ) ( not ( = ?auto_12651 ?auto_12660 ) ) ( not ( = ?auto_12652 ?auto_12653 ) ) ( CALIBRATION_TARGET ?auto_12658 ?auto_12660 ) ( not ( = ?auto_12660 ?auto_12656 ) ) ( not ( = ?auto_12654 ?auto_12656 ) ) ( not ( = ?auto_12651 ?auto_12656 ) ) ( ON_BOARD ?auto_12659 ?auto_12661 ) ( not ( = ?auto_12658 ?auto_12659 ) ) ( SUPPORTS ?auto_12659 ?auto_12655 ) ( not ( = ?auto_12652 ?auto_12655 ) ) ( not ( = ?auto_12653 ?auto_12655 ) ) ( CALIBRATION_TARGET ?auto_12659 ?auto_12660 ) ( POINTING ?auto_12661 ?auto_12651 ) ( ON_BOARD ?auto_12657 ?auto_12661 ) ( POWER_ON ?auto_12657 ) ( not ( = ?auto_12658 ?auto_12657 ) ) ( not ( = ?auto_12659 ?auto_12657 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12651 ?auto_12652 ?auto_12654 ?auto_12653 )
      ( GET-3IMAGE-VERIFY ?auto_12651 ?auto_12652 ?auto_12654 ?auto_12653 ?auto_12656 ?auto_12655 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12675 - DIRECTION
      ?auto_12676 - MODE
      ?auto_12678 - DIRECTION
      ?auto_12677 - MODE
      ?auto_12680 - DIRECTION
      ?auto_12679 - MODE
    )
    :vars
    (
      ?auto_12682 - INSTRUMENT
      ?auto_12685 - SATELLITE
      ?auto_12684 - DIRECTION
      ?auto_12683 - INSTRUMENT
      ?auto_12681 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12682 ?auto_12685 ) ( SUPPORTS ?auto_12682 ?auto_12679 ) ( not ( = ?auto_12680 ?auto_12684 ) ) ( HAVE_IMAGE ?auto_12678 ?auto_12677 ) ( not ( = ?auto_12678 ?auto_12680 ) ) ( not ( = ?auto_12678 ?auto_12684 ) ) ( not ( = ?auto_12677 ?auto_12679 ) ) ( CALIBRATION_TARGET ?auto_12682 ?auto_12684 ) ( not ( = ?auto_12684 ?auto_12675 ) ) ( not ( = ?auto_12680 ?auto_12675 ) ) ( not ( = ?auto_12678 ?auto_12675 ) ) ( ON_BOARD ?auto_12683 ?auto_12685 ) ( not ( = ?auto_12682 ?auto_12683 ) ) ( SUPPORTS ?auto_12683 ?auto_12676 ) ( not ( = ?auto_12677 ?auto_12676 ) ) ( not ( = ?auto_12679 ?auto_12676 ) ) ( CALIBRATION_TARGET ?auto_12683 ?auto_12684 ) ( POINTING ?auto_12685 ?auto_12678 ) ( ON_BOARD ?auto_12681 ?auto_12685 ) ( POWER_ON ?auto_12681 ) ( not ( = ?auto_12682 ?auto_12681 ) ) ( not ( = ?auto_12683 ?auto_12681 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12678 ?auto_12677 ?auto_12680 ?auto_12679 )
      ( GET-3IMAGE-VERIFY ?auto_12675 ?auto_12676 ?auto_12678 ?auto_12677 ?auto_12680 ?auto_12679 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12699 - DIRECTION
      ?auto_12700 - MODE
      ?auto_12702 - DIRECTION
      ?auto_12701 - MODE
      ?auto_12704 - DIRECTION
      ?auto_12703 - MODE
    )
    :vars
    (
      ?auto_12706 - INSTRUMENT
      ?auto_12709 - SATELLITE
      ?auto_12708 - DIRECTION
      ?auto_12707 - INSTRUMENT
      ?auto_12705 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12706 ?auto_12709 ) ( SUPPORTS ?auto_12706 ?auto_12701 ) ( not ( = ?auto_12702 ?auto_12708 ) ) ( HAVE_IMAGE ?auto_12704 ?auto_12703 ) ( not ( = ?auto_12704 ?auto_12702 ) ) ( not ( = ?auto_12704 ?auto_12708 ) ) ( not ( = ?auto_12703 ?auto_12701 ) ) ( CALIBRATION_TARGET ?auto_12706 ?auto_12708 ) ( not ( = ?auto_12708 ?auto_12699 ) ) ( not ( = ?auto_12702 ?auto_12699 ) ) ( not ( = ?auto_12704 ?auto_12699 ) ) ( ON_BOARD ?auto_12707 ?auto_12709 ) ( not ( = ?auto_12706 ?auto_12707 ) ) ( SUPPORTS ?auto_12707 ?auto_12700 ) ( not ( = ?auto_12703 ?auto_12700 ) ) ( not ( = ?auto_12701 ?auto_12700 ) ) ( CALIBRATION_TARGET ?auto_12707 ?auto_12708 ) ( POINTING ?auto_12709 ?auto_12704 ) ( ON_BOARD ?auto_12705 ?auto_12709 ) ( POWER_ON ?auto_12705 ) ( not ( = ?auto_12706 ?auto_12705 ) ) ( not ( = ?auto_12707 ?auto_12705 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12704 ?auto_12703 ?auto_12702 ?auto_12701 )
      ( GET-3IMAGE-VERIFY ?auto_12699 ?auto_12700 ?auto_12702 ?auto_12701 ?auto_12704 ?auto_12703 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12736 - DIRECTION
      ?auto_12737 - MODE
      ?auto_12739 - DIRECTION
      ?auto_12738 - MODE
      ?auto_12741 - DIRECTION
      ?auto_12740 - MODE
    )
    :vars
    (
      ?auto_12743 - INSTRUMENT
      ?auto_12748 - SATELLITE
      ?auto_12745 - DIRECTION
      ?auto_12746 - DIRECTION
      ?auto_12744 - INSTRUMENT
      ?auto_12747 - MODE
      ?auto_12742 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12743 ?auto_12748 ) ( SUPPORTS ?auto_12743 ?auto_12737 ) ( not ( = ?auto_12736 ?auto_12745 ) ) ( HAVE_IMAGE ?auto_12741 ?auto_12740 ) ( not ( = ?auto_12741 ?auto_12736 ) ) ( not ( = ?auto_12741 ?auto_12745 ) ) ( not ( = ?auto_12740 ?auto_12737 ) ) ( CALIBRATION_TARGET ?auto_12743 ?auto_12745 ) ( not ( = ?auto_12745 ?auto_12746 ) ) ( not ( = ?auto_12736 ?auto_12746 ) ) ( not ( = ?auto_12741 ?auto_12746 ) ) ( ON_BOARD ?auto_12744 ?auto_12748 ) ( not ( = ?auto_12743 ?auto_12744 ) ) ( SUPPORTS ?auto_12744 ?auto_12747 ) ( not ( = ?auto_12740 ?auto_12747 ) ) ( not ( = ?auto_12737 ?auto_12747 ) ) ( CALIBRATION_TARGET ?auto_12744 ?auto_12745 ) ( POINTING ?auto_12748 ?auto_12741 ) ( ON_BOARD ?auto_12742 ?auto_12748 ) ( POWER_ON ?auto_12742 ) ( not ( = ?auto_12743 ?auto_12742 ) ) ( not ( = ?auto_12744 ?auto_12742 ) ) ( HAVE_IMAGE ?auto_12739 ?auto_12738 ) ( not ( = ?auto_12736 ?auto_12739 ) ) ( not ( = ?auto_12737 ?auto_12738 ) ) ( not ( = ?auto_12739 ?auto_12741 ) ) ( not ( = ?auto_12739 ?auto_12745 ) ) ( not ( = ?auto_12739 ?auto_12746 ) ) ( not ( = ?auto_12738 ?auto_12740 ) ) ( not ( = ?auto_12738 ?auto_12747 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12741 ?auto_12740 ?auto_12736 ?auto_12737 )
      ( GET-3IMAGE-VERIFY ?auto_12736 ?auto_12737 ?auto_12739 ?auto_12738 ?auto_12741 ?auto_12740 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12749 - DIRECTION
      ?auto_12750 - MODE
      ?auto_12752 - DIRECTION
      ?auto_12751 - MODE
      ?auto_12754 - DIRECTION
      ?auto_12753 - MODE
    )
    :vars
    (
      ?auto_12756 - INSTRUMENT
      ?auto_12759 - SATELLITE
      ?auto_12758 - DIRECTION
      ?auto_12757 - INSTRUMENT
      ?auto_12755 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12756 ?auto_12759 ) ( SUPPORTS ?auto_12756 ?auto_12750 ) ( not ( = ?auto_12749 ?auto_12758 ) ) ( HAVE_IMAGE ?auto_12752 ?auto_12751 ) ( not ( = ?auto_12752 ?auto_12749 ) ) ( not ( = ?auto_12752 ?auto_12758 ) ) ( not ( = ?auto_12751 ?auto_12750 ) ) ( CALIBRATION_TARGET ?auto_12756 ?auto_12758 ) ( not ( = ?auto_12758 ?auto_12754 ) ) ( not ( = ?auto_12749 ?auto_12754 ) ) ( not ( = ?auto_12752 ?auto_12754 ) ) ( ON_BOARD ?auto_12757 ?auto_12759 ) ( not ( = ?auto_12756 ?auto_12757 ) ) ( SUPPORTS ?auto_12757 ?auto_12753 ) ( not ( = ?auto_12751 ?auto_12753 ) ) ( not ( = ?auto_12750 ?auto_12753 ) ) ( CALIBRATION_TARGET ?auto_12757 ?auto_12758 ) ( POINTING ?auto_12759 ?auto_12752 ) ( ON_BOARD ?auto_12755 ?auto_12759 ) ( POWER_ON ?auto_12755 ) ( not ( = ?auto_12756 ?auto_12755 ) ) ( not ( = ?auto_12757 ?auto_12755 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12752 ?auto_12751 ?auto_12749 ?auto_12750 )
      ( GET-3IMAGE-VERIFY ?auto_12749 ?auto_12750 ?auto_12752 ?auto_12751 ?auto_12754 ?auto_12753 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12773 - DIRECTION
      ?auto_12774 - MODE
      ?auto_12776 - DIRECTION
      ?auto_12775 - MODE
      ?auto_12778 - DIRECTION
      ?auto_12777 - MODE
    )
    :vars
    (
      ?auto_12780 - INSTRUMENT
      ?auto_12783 - SATELLITE
      ?auto_12782 - DIRECTION
      ?auto_12781 - INSTRUMENT
      ?auto_12779 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12780 ?auto_12783 ) ( SUPPORTS ?auto_12780 ?auto_12774 ) ( not ( = ?auto_12773 ?auto_12782 ) ) ( HAVE_IMAGE ?auto_12778 ?auto_12777 ) ( not ( = ?auto_12778 ?auto_12773 ) ) ( not ( = ?auto_12778 ?auto_12782 ) ) ( not ( = ?auto_12777 ?auto_12774 ) ) ( CALIBRATION_TARGET ?auto_12780 ?auto_12782 ) ( not ( = ?auto_12782 ?auto_12776 ) ) ( not ( = ?auto_12773 ?auto_12776 ) ) ( not ( = ?auto_12778 ?auto_12776 ) ) ( ON_BOARD ?auto_12781 ?auto_12783 ) ( not ( = ?auto_12780 ?auto_12781 ) ) ( SUPPORTS ?auto_12781 ?auto_12775 ) ( not ( = ?auto_12777 ?auto_12775 ) ) ( not ( = ?auto_12774 ?auto_12775 ) ) ( CALIBRATION_TARGET ?auto_12781 ?auto_12782 ) ( POINTING ?auto_12783 ?auto_12778 ) ( ON_BOARD ?auto_12779 ?auto_12783 ) ( POWER_ON ?auto_12779 ) ( not ( = ?auto_12780 ?auto_12779 ) ) ( not ( = ?auto_12781 ?auto_12779 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12778 ?auto_12777 ?auto_12773 ?auto_12774 )
      ( GET-3IMAGE-VERIFY ?auto_12773 ?auto_12774 ?auto_12776 ?auto_12775 ?auto_12778 ?auto_12777 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_12851 - DIRECTION
      ?auto_12852 - MODE
    )
    :vars
    (
      ?auto_12854 - INSTRUMENT
      ?auto_12859 - SATELLITE
      ?auto_12856 - DIRECTION
      ?auto_12861 - DIRECTION
      ?auto_12860 - MODE
      ?auto_12857 - DIRECTION
      ?auto_12855 - INSTRUMENT
      ?auto_12858 - MODE
      ?auto_12853 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12854 ?auto_12859 ) ( SUPPORTS ?auto_12854 ?auto_12852 ) ( not ( = ?auto_12851 ?auto_12856 ) ) ( not ( = ?auto_12861 ?auto_12851 ) ) ( not ( = ?auto_12861 ?auto_12856 ) ) ( not ( = ?auto_12860 ?auto_12852 ) ) ( CALIBRATION_TARGET ?auto_12854 ?auto_12856 ) ( not ( = ?auto_12856 ?auto_12857 ) ) ( not ( = ?auto_12851 ?auto_12857 ) ) ( not ( = ?auto_12861 ?auto_12857 ) ) ( ON_BOARD ?auto_12855 ?auto_12859 ) ( not ( = ?auto_12854 ?auto_12855 ) ) ( SUPPORTS ?auto_12855 ?auto_12858 ) ( not ( = ?auto_12860 ?auto_12858 ) ) ( not ( = ?auto_12852 ?auto_12858 ) ) ( CALIBRATION_TARGET ?auto_12855 ?auto_12856 ) ( POINTING ?auto_12859 ?auto_12861 ) ( ON_BOARD ?auto_12853 ?auto_12859 ) ( POWER_ON ?auto_12853 ) ( not ( = ?auto_12854 ?auto_12853 ) ) ( not ( = ?auto_12855 ?auto_12853 ) ) ( CALIBRATED ?auto_12853 ) ( SUPPORTS ?auto_12853 ?auto_12860 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_12861 ?auto_12860 )
      ( GET-2IMAGE ?auto_12861 ?auto_12860 ?auto_12851 ?auto_12852 )
      ( GET-1IMAGE-VERIFY ?auto_12851 ?auto_12852 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_12862 - DIRECTION
      ?auto_12863 - MODE
      ?auto_12865 - DIRECTION
      ?auto_12864 - MODE
    )
    :vars
    (
      ?auto_12871 - INSTRUMENT
      ?auto_12866 - SATELLITE
      ?auto_12868 - DIRECTION
      ?auto_12869 - DIRECTION
      ?auto_12867 - INSTRUMENT
      ?auto_12872 - MODE
      ?auto_12870 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12871 ?auto_12866 ) ( SUPPORTS ?auto_12871 ?auto_12864 ) ( not ( = ?auto_12865 ?auto_12868 ) ) ( not ( = ?auto_12862 ?auto_12865 ) ) ( not ( = ?auto_12862 ?auto_12868 ) ) ( not ( = ?auto_12863 ?auto_12864 ) ) ( CALIBRATION_TARGET ?auto_12871 ?auto_12868 ) ( not ( = ?auto_12868 ?auto_12869 ) ) ( not ( = ?auto_12865 ?auto_12869 ) ) ( not ( = ?auto_12862 ?auto_12869 ) ) ( ON_BOARD ?auto_12867 ?auto_12866 ) ( not ( = ?auto_12871 ?auto_12867 ) ) ( SUPPORTS ?auto_12867 ?auto_12872 ) ( not ( = ?auto_12863 ?auto_12872 ) ) ( not ( = ?auto_12864 ?auto_12872 ) ) ( CALIBRATION_TARGET ?auto_12867 ?auto_12868 ) ( POINTING ?auto_12866 ?auto_12862 ) ( ON_BOARD ?auto_12870 ?auto_12866 ) ( POWER_ON ?auto_12870 ) ( not ( = ?auto_12871 ?auto_12870 ) ) ( not ( = ?auto_12867 ?auto_12870 ) ) ( CALIBRATED ?auto_12870 ) ( SUPPORTS ?auto_12870 ?auto_12863 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_12865 ?auto_12864 )
      ( GET-2IMAGE-VERIFY ?auto_12862 ?auto_12863 ?auto_12865 ?auto_12864 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_12873 - DIRECTION
      ?auto_12874 - MODE
      ?auto_12876 - DIRECTION
      ?auto_12875 - MODE
    )
    :vars
    (
      ?auto_12877 - INSTRUMENT
      ?auto_12878 - SATELLITE
      ?auto_12881 - DIRECTION
      ?auto_12883 - DIRECTION
      ?auto_12882 - MODE
      ?auto_12879 - INSTRUMENT
      ?auto_12880 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12877 ?auto_12878 ) ( SUPPORTS ?auto_12877 ?auto_12875 ) ( not ( = ?auto_12876 ?auto_12881 ) ) ( not ( = ?auto_12883 ?auto_12876 ) ) ( not ( = ?auto_12883 ?auto_12881 ) ) ( not ( = ?auto_12882 ?auto_12875 ) ) ( CALIBRATION_TARGET ?auto_12877 ?auto_12881 ) ( not ( = ?auto_12881 ?auto_12873 ) ) ( not ( = ?auto_12876 ?auto_12873 ) ) ( not ( = ?auto_12883 ?auto_12873 ) ) ( ON_BOARD ?auto_12879 ?auto_12878 ) ( not ( = ?auto_12877 ?auto_12879 ) ) ( SUPPORTS ?auto_12879 ?auto_12874 ) ( not ( = ?auto_12882 ?auto_12874 ) ) ( not ( = ?auto_12875 ?auto_12874 ) ) ( CALIBRATION_TARGET ?auto_12879 ?auto_12881 ) ( POINTING ?auto_12878 ?auto_12883 ) ( ON_BOARD ?auto_12880 ?auto_12878 ) ( POWER_ON ?auto_12880 ) ( not ( = ?auto_12877 ?auto_12880 ) ) ( not ( = ?auto_12879 ?auto_12880 ) ) ( CALIBRATED ?auto_12880 ) ( SUPPORTS ?auto_12880 ?auto_12882 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12883 ?auto_12882 ?auto_12876 ?auto_12875 )
      ( GET-2IMAGE-VERIFY ?auto_12873 ?auto_12874 ?auto_12876 ?auto_12875 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_12884 - DIRECTION
      ?auto_12885 - MODE
      ?auto_12887 - DIRECTION
      ?auto_12886 - MODE
    )
    :vars
    (
      ?auto_12888 - INSTRUMENT
      ?auto_12889 - SATELLITE
      ?auto_12893 - DIRECTION
      ?auto_12890 - DIRECTION
      ?auto_12891 - INSTRUMENT
      ?auto_12894 - MODE
      ?auto_12892 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12888 ?auto_12889 ) ( SUPPORTS ?auto_12888 ?auto_12885 ) ( not ( = ?auto_12884 ?auto_12893 ) ) ( not ( = ?auto_12887 ?auto_12884 ) ) ( not ( = ?auto_12887 ?auto_12893 ) ) ( not ( = ?auto_12886 ?auto_12885 ) ) ( CALIBRATION_TARGET ?auto_12888 ?auto_12893 ) ( not ( = ?auto_12893 ?auto_12890 ) ) ( not ( = ?auto_12884 ?auto_12890 ) ) ( not ( = ?auto_12887 ?auto_12890 ) ) ( ON_BOARD ?auto_12891 ?auto_12889 ) ( not ( = ?auto_12888 ?auto_12891 ) ) ( SUPPORTS ?auto_12891 ?auto_12894 ) ( not ( = ?auto_12886 ?auto_12894 ) ) ( not ( = ?auto_12885 ?auto_12894 ) ) ( CALIBRATION_TARGET ?auto_12891 ?auto_12893 ) ( POINTING ?auto_12889 ?auto_12887 ) ( ON_BOARD ?auto_12892 ?auto_12889 ) ( POWER_ON ?auto_12892 ) ( not ( = ?auto_12888 ?auto_12892 ) ) ( not ( = ?auto_12891 ?auto_12892 ) ) ( CALIBRATED ?auto_12892 ) ( SUPPORTS ?auto_12892 ?auto_12886 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12887 ?auto_12886 ?auto_12884 ?auto_12885 )
      ( GET-2IMAGE-VERIFY ?auto_12884 ?auto_12885 ?auto_12887 ?auto_12886 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_12895 - DIRECTION
      ?auto_12896 - MODE
      ?auto_12898 - DIRECTION
      ?auto_12897 - MODE
    )
    :vars
    (
      ?auto_12899 - INSTRUMENT
      ?auto_12900 - SATELLITE
      ?auto_12903 - DIRECTION
      ?auto_12905 - DIRECTION
      ?auto_12904 - MODE
      ?auto_12901 - INSTRUMENT
      ?auto_12902 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12899 ?auto_12900 ) ( SUPPORTS ?auto_12899 ?auto_12896 ) ( not ( = ?auto_12895 ?auto_12903 ) ) ( not ( = ?auto_12905 ?auto_12895 ) ) ( not ( = ?auto_12905 ?auto_12903 ) ) ( not ( = ?auto_12904 ?auto_12896 ) ) ( CALIBRATION_TARGET ?auto_12899 ?auto_12903 ) ( not ( = ?auto_12903 ?auto_12898 ) ) ( not ( = ?auto_12895 ?auto_12898 ) ) ( not ( = ?auto_12905 ?auto_12898 ) ) ( ON_BOARD ?auto_12901 ?auto_12900 ) ( not ( = ?auto_12899 ?auto_12901 ) ) ( SUPPORTS ?auto_12901 ?auto_12897 ) ( not ( = ?auto_12904 ?auto_12897 ) ) ( not ( = ?auto_12896 ?auto_12897 ) ) ( CALIBRATION_TARGET ?auto_12901 ?auto_12903 ) ( POINTING ?auto_12900 ?auto_12905 ) ( ON_BOARD ?auto_12902 ?auto_12900 ) ( POWER_ON ?auto_12902 ) ( not ( = ?auto_12899 ?auto_12902 ) ) ( not ( = ?auto_12901 ?auto_12902 ) ) ( CALIBRATED ?auto_12902 ) ( SUPPORTS ?auto_12902 ?auto_12904 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12905 ?auto_12904 ?auto_12895 ?auto_12896 )
      ( GET-2IMAGE-VERIFY ?auto_12895 ?auto_12896 ?auto_12898 ?auto_12897 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12932 - DIRECTION
      ?auto_12933 - MODE
      ?auto_12935 - DIRECTION
      ?auto_12934 - MODE
      ?auto_12937 - DIRECTION
      ?auto_12936 - MODE
    )
    :vars
    (
      ?auto_12938 - INSTRUMENT
      ?auto_12939 - SATELLITE
      ?auto_12942 - DIRECTION
      ?auto_12940 - INSTRUMENT
      ?auto_12941 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12938 ?auto_12939 ) ( SUPPORTS ?auto_12938 ?auto_12936 ) ( not ( = ?auto_12937 ?auto_12942 ) ) ( not ( = ?auto_12932 ?auto_12937 ) ) ( not ( = ?auto_12932 ?auto_12942 ) ) ( not ( = ?auto_12933 ?auto_12936 ) ) ( CALIBRATION_TARGET ?auto_12938 ?auto_12942 ) ( not ( = ?auto_12942 ?auto_12935 ) ) ( not ( = ?auto_12937 ?auto_12935 ) ) ( not ( = ?auto_12932 ?auto_12935 ) ) ( ON_BOARD ?auto_12940 ?auto_12939 ) ( not ( = ?auto_12938 ?auto_12940 ) ) ( SUPPORTS ?auto_12940 ?auto_12934 ) ( not ( = ?auto_12933 ?auto_12934 ) ) ( not ( = ?auto_12936 ?auto_12934 ) ) ( CALIBRATION_TARGET ?auto_12940 ?auto_12942 ) ( POINTING ?auto_12939 ?auto_12932 ) ( ON_BOARD ?auto_12941 ?auto_12939 ) ( POWER_ON ?auto_12941 ) ( not ( = ?auto_12938 ?auto_12941 ) ) ( not ( = ?auto_12940 ?auto_12941 ) ) ( CALIBRATED ?auto_12941 ) ( SUPPORTS ?auto_12941 ?auto_12933 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12932 ?auto_12933 ?auto_12937 ?auto_12936 )
      ( GET-3IMAGE-VERIFY ?auto_12932 ?auto_12933 ?auto_12935 ?auto_12934 ?auto_12937 ?auto_12936 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12956 - DIRECTION
      ?auto_12957 - MODE
      ?auto_12959 - DIRECTION
      ?auto_12958 - MODE
      ?auto_12961 - DIRECTION
      ?auto_12960 - MODE
    )
    :vars
    (
      ?auto_12962 - INSTRUMENT
      ?auto_12963 - SATELLITE
      ?auto_12966 - DIRECTION
      ?auto_12964 - INSTRUMENT
      ?auto_12965 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12962 ?auto_12963 ) ( SUPPORTS ?auto_12962 ?auto_12958 ) ( not ( = ?auto_12959 ?auto_12966 ) ) ( not ( = ?auto_12956 ?auto_12959 ) ) ( not ( = ?auto_12956 ?auto_12966 ) ) ( not ( = ?auto_12957 ?auto_12958 ) ) ( CALIBRATION_TARGET ?auto_12962 ?auto_12966 ) ( not ( = ?auto_12966 ?auto_12961 ) ) ( not ( = ?auto_12959 ?auto_12961 ) ) ( not ( = ?auto_12956 ?auto_12961 ) ) ( ON_BOARD ?auto_12964 ?auto_12963 ) ( not ( = ?auto_12962 ?auto_12964 ) ) ( SUPPORTS ?auto_12964 ?auto_12960 ) ( not ( = ?auto_12957 ?auto_12960 ) ) ( not ( = ?auto_12958 ?auto_12960 ) ) ( CALIBRATION_TARGET ?auto_12964 ?auto_12966 ) ( POINTING ?auto_12963 ?auto_12956 ) ( ON_BOARD ?auto_12965 ?auto_12963 ) ( POWER_ON ?auto_12965 ) ( not ( = ?auto_12962 ?auto_12965 ) ) ( not ( = ?auto_12964 ?auto_12965 ) ) ( CALIBRATED ?auto_12965 ) ( SUPPORTS ?auto_12965 ?auto_12957 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12956 ?auto_12957 ?auto_12959 ?auto_12958 )
      ( GET-3IMAGE-VERIFY ?auto_12956 ?auto_12957 ?auto_12959 ?auto_12958 ?auto_12961 ?auto_12960 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_12980 - DIRECTION
      ?auto_12981 - MODE
      ?auto_12983 - DIRECTION
      ?auto_12982 - MODE
      ?auto_12985 - DIRECTION
      ?auto_12984 - MODE
    )
    :vars
    (
      ?auto_12986 - INSTRUMENT
      ?auto_12987 - SATELLITE
      ?auto_12990 - DIRECTION
      ?auto_12988 - INSTRUMENT
      ?auto_12989 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_12986 ?auto_12987 ) ( SUPPORTS ?auto_12986 ?auto_12984 ) ( not ( = ?auto_12985 ?auto_12990 ) ) ( not ( = ?auto_12983 ?auto_12985 ) ) ( not ( = ?auto_12983 ?auto_12990 ) ) ( not ( = ?auto_12982 ?auto_12984 ) ) ( CALIBRATION_TARGET ?auto_12986 ?auto_12990 ) ( not ( = ?auto_12990 ?auto_12980 ) ) ( not ( = ?auto_12985 ?auto_12980 ) ) ( not ( = ?auto_12983 ?auto_12980 ) ) ( ON_BOARD ?auto_12988 ?auto_12987 ) ( not ( = ?auto_12986 ?auto_12988 ) ) ( SUPPORTS ?auto_12988 ?auto_12981 ) ( not ( = ?auto_12982 ?auto_12981 ) ) ( not ( = ?auto_12984 ?auto_12981 ) ) ( CALIBRATION_TARGET ?auto_12988 ?auto_12990 ) ( POINTING ?auto_12987 ?auto_12983 ) ( ON_BOARD ?auto_12989 ?auto_12987 ) ( POWER_ON ?auto_12989 ) ( not ( = ?auto_12986 ?auto_12989 ) ) ( not ( = ?auto_12988 ?auto_12989 ) ) ( CALIBRATED ?auto_12989 ) ( SUPPORTS ?auto_12989 ?auto_12982 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12983 ?auto_12982 ?auto_12985 ?auto_12984 )
      ( GET-3IMAGE-VERIFY ?auto_12980 ?auto_12981 ?auto_12983 ?auto_12982 ?auto_12985 ?auto_12984 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13004 - DIRECTION
      ?auto_13005 - MODE
      ?auto_13007 - DIRECTION
      ?auto_13006 - MODE
      ?auto_13009 - DIRECTION
      ?auto_13008 - MODE
    )
    :vars
    (
      ?auto_13010 - INSTRUMENT
      ?auto_13011 - SATELLITE
      ?auto_13014 - DIRECTION
      ?auto_13012 - INSTRUMENT
      ?auto_13013 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13010 ?auto_13011 ) ( SUPPORTS ?auto_13010 ?auto_13006 ) ( not ( = ?auto_13007 ?auto_13014 ) ) ( not ( = ?auto_13009 ?auto_13007 ) ) ( not ( = ?auto_13009 ?auto_13014 ) ) ( not ( = ?auto_13008 ?auto_13006 ) ) ( CALIBRATION_TARGET ?auto_13010 ?auto_13014 ) ( not ( = ?auto_13014 ?auto_13004 ) ) ( not ( = ?auto_13007 ?auto_13004 ) ) ( not ( = ?auto_13009 ?auto_13004 ) ) ( ON_BOARD ?auto_13012 ?auto_13011 ) ( not ( = ?auto_13010 ?auto_13012 ) ) ( SUPPORTS ?auto_13012 ?auto_13005 ) ( not ( = ?auto_13008 ?auto_13005 ) ) ( not ( = ?auto_13006 ?auto_13005 ) ) ( CALIBRATION_TARGET ?auto_13012 ?auto_13014 ) ( POINTING ?auto_13011 ?auto_13009 ) ( ON_BOARD ?auto_13013 ?auto_13011 ) ( POWER_ON ?auto_13013 ) ( not ( = ?auto_13010 ?auto_13013 ) ) ( not ( = ?auto_13012 ?auto_13013 ) ) ( CALIBRATED ?auto_13013 ) ( SUPPORTS ?auto_13013 ?auto_13008 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13009 ?auto_13008 ?auto_13007 ?auto_13006 )
      ( GET-3IMAGE-VERIFY ?auto_13004 ?auto_13005 ?auto_13007 ?auto_13006 ?auto_13009 ?auto_13008 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13054 - DIRECTION
      ?auto_13055 - MODE
      ?auto_13057 - DIRECTION
      ?auto_13056 - MODE
      ?auto_13059 - DIRECTION
      ?auto_13058 - MODE
    )
    :vars
    (
      ?auto_13060 - INSTRUMENT
      ?auto_13061 - SATELLITE
      ?auto_13064 - DIRECTION
      ?auto_13062 - INSTRUMENT
      ?auto_13063 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13060 ?auto_13061 ) ( SUPPORTS ?auto_13060 ?auto_13055 ) ( not ( = ?auto_13054 ?auto_13064 ) ) ( not ( = ?auto_13057 ?auto_13054 ) ) ( not ( = ?auto_13057 ?auto_13064 ) ) ( not ( = ?auto_13056 ?auto_13055 ) ) ( CALIBRATION_TARGET ?auto_13060 ?auto_13064 ) ( not ( = ?auto_13064 ?auto_13059 ) ) ( not ( = ?auto_13054 ?auto_13059 ) ) ( not ( = ?auto_13057 ?auto_13059 ) ) ( ON_BOARD ?auto_13062 ?auto_13061 ) ( not ( = ?auto_13060 ?auto_13062 ) ) ( SUPPORTS ?auto_13062 ?auto_13058 ) ( not ( = ?auto_13056 ?auto_13058 ) ) ( not ( = ?auto_13055 ?auto_13058 ) ) ( CALIBRATION_TARGET ?auto_13062 ?auto_13064 ) ( POINTING ?auto_13061 ?auto_13057 ) ( ON_BOARD ?auto_13063 ?auto_13061 ) ( POWER_ON ?auto_13063 ) ( not ( = ?auto_13060 ?auto_13063 ) ) ( not ( = ?auto_13062 ?auto_13063 ) ) ( CALIBRATED ?auto_13063 ) ( SUPPORTS ?auto_13063 ?auto_13056 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13057 ?auto_13056 ?auto_13054 ?auto_13055 )
      ( GET-3IMAGE-VERIFY ?auto_13054 ?auto_13055 ?auto_13057 ?auto_13056 ?auto_13059 ?auto_13058 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13078 - DIRECTION
      ?auto_13079 - MODE
      ?auto_13081 - DIRECTION
      ?auto_13080 - MODE
      ?auto_13083 - DIRECTION
      ?auto_13082 - MODE
    )
    :vars
    (
      ?auto_13084 - INSTRUMENT
      ?auto_13085 - SATELLITE
      ?auto_13088 - DIRECTION
      ?auto_13086 - INSTRUMENT
      ?auto_13087 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13084 ?auto_13085 ) ( SUPPORTS ?auto_13084 ?auto_13079 ) ( not ( = ?auto_13078 ?auto_13088 ) ) ( not ( = ?auto_13083 ?auto_13078 ) ) ( not ( = ?auto_13083 ?auto_13088 ) ) ( not ( = ?auto_13082 ?auto_13079 ) ) ( CALIBRATION_TARGET ?auto_13084 ?auto_13088 ) ( not ( = ?auto_13088 ?auto_13081 ) ) ( not ( = ?auto_13078 ?auto_13081 ) ) ( not ( = ?auto_13083 ?auto_13081 ) ) ( ON_BOARD ?auto_13086 ?auto_13085 ) ( not ( = ?auto_13084 ?auto_13086 ) ) ( SUPPORTS ?auto_13086 ?auto_13080 ) ( not ( = ?auto_13082 ?auto_13080 ) ) ( not ( = ?auto_13079 ?auto_13080 ) ) ( CALIBRATION_TARGET ?auto_13086 ?auto_13088 ) ( POINTING ?auto_13085 ?auto_13083 ) ( ON_BOARD ?auto_13087 ?auto_13085 ) ( POWER_ON ?auto_13087 ) ( not ( = ?auto_13084 ?auto_13087 ) ) ( not ( = ?auto_13086 ?auto_13087 ) ) ( CALIBRATED ?auto_13087 ) ( SUPPORTS ?auto_13087 ?auto_13082 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13083 ?auto_13082 ?auto_13078 ?auto_13079 )
      ( GET-3IMAGE-VERIFY ?auto_13078 ?auto_13079 ?auto_13081 ?auto_13080 ?auto_13083 ?auto_13082 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_13156 - DIRECTION
      ?auto_13157 - MODE
    )
    :vars
    (
      ?auto_13158 - INSTRUMENT
      ?auto_13159 - SATELLITE
      ?auto_13163 - DIRECTION
      ?auto_13166 - DIRECTION
      ?auto_13165 - MODE
      ?auto_13160 - DIRECTION
      ?auto_13161 - INSTRUMENT
      ?auto_13164 - MODE
      ?auto_13162 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13158 ?auto_13159 ) ( SUPPORTS ?auto_13158 ?auto_13157 ) ( not ( = ?auto_13156 ?auto_13163 ) ) ( not ( = ?auto_13166 ?auto_13156 ) ) ( not ( = ?auto_13166 ?auto_13163 ) ) ( not ( = ?auto_13165 ?auto_13157 ) ) ( CALIBRATION_TARGET ?auto_13158 ?auto_13163 ) ( not ( = ?auto_13163 ?auto_13160 ) ) ( not ( = ?auto_13156 ?auto_13160 ) ) ( not ( = ?auto_13166 ?auto_13160 ) ) ( ON_BOARD ?auto_13161 ?auto_13159 ) ( not ( = ?auto_13158 ?auto_13161 ) ) ( SUPPORTS ?auto_13161 ?auto_13164 ) ( not ( = ?auto_13165 ?auto_13164 ) ) ( not ( = ?auto_13157 ?auto_13164 ) ) ( CALIBRATION_TARGET ?auto_13161 ?auto_13163 ) ( ON_BOARD ?auto_13162 ?auto_13159 ) ( POWER_ON ?auto_13162 ) ( not ( = ?auto_13158 ?auto_13162 ) ) ( not ( = ?auto_13161 ?auto_13162 ) ) ( CALIBRATED ?auto_13162 ) ( SUPPORTS ?auto_13162 ?auto_13165 ) ( POINTING ?auto_13159 ?auto_13163 ) )
    :subtasks
    ( ( !TURN_TO ?auto_13159 ?auto_13166 ?auto_13163 )
      ( GET-2IMAGE ?auto_13166 ?auto_13165 ?auto_13156 ?auto_13157 )
      ( GET-1IMAGE-VERIFY ?auto_13156 ?auto_13157 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13167 - DIRECTION
      ?auto_13168 - MODE
      ?auto_13170 - DIRECTION
      ?auto_13169 - MODE
    )
    :vars
    (
      ?auto_13175 - INSTRUMENT
      ?auto_13173 - SATELLITE
      ?auto_13177 - DIRECTION
      ?auto_13176 - DIRECTION
      ?auto_13172 - INSTRUMENT
      ?auto_13174 - MODE
      ?auto_13171 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13175 ?auto_13173 ) ( SUPPORTS ?auto_13175 ?auto_13169 ) ( not ( = ?auto_13170 ?auto_13177 ) ) ( not ( = ?auto_13167 ?auto_13170 ) ) ( not ( = ?auto_13167 ?auto_13177 ) ) ( not ( = ?auto_13168 ?auto_13169 ) ) ( CALIBRATION_TARGET ?auto_13175 ?auto_13177 ) ( not ( = ?auto_13177 ?auto_13176 ) ) ( not ( = ?auto_13170 ?auto_13176 ) ) ( not ( = ?auto_13167 ?auto_13176 ) ) ( ON_BOARD ?auto_13172 ?auto_13173 ) ( not ( = ?auto_13175 ?auto_13172 ) ) ( SUPPORTS ?auto_13172 ?auto_13174 ) ( not ( = ?auto_13168 ?auto_13174 ) ) ( not ( = ?auto_13169 ?auto_13174 ) ) ( CALIBRATION_TARGET ?auto_13172 ?auto_13177 ) ( ON_BOARD ?auto_13171 ?auto_13173 ) ( POWER_ON ?auto_13171 ) ( not ( = ?auto_13175 ?auto_13171 ) ) ( not ( = ?auto_13172 ?auto_13171 ) ) ( CALIBRATED ?auto_13171 ) ( SUPPORTS ?auto_13171 ?auto_13168 ) ( POINTING ?auto_13173 ?auto_13177 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13170 ?auto_13169 )
      ( GET-2IMAGE-VERIFY ?auto_13167 ?auto_13168 ?auto_13170 ?auto_13169 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13178 - DIRECTION
      ?auto_13179 - MODE
      ?auto_13181 - DIRECTION
      ?auto_13180 - MODE
    )
    :vars
    (
      ?auto_13185 - INSTRUMENT
      ?auto_13182 - SATELLITE
      ?auto_13183 - DIRECTION
      ?auto_13188 - DIRECTION
      ?auto_13187 - MODE
      ?auto_13184 - INSTRUMENT
      ?auto_13186 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13185 ?auto_13182 ) ( SUPPORTS ?auto_13185 ?auto_13180 ) ( not ( = ?auto_13181 ?auto_13183 ) ) ( not ( = ?auto_13188 ?auto_13181 ) ) ( not ( = ?auto_13188 ?auto_13183 ) ) ( not ( = ?auto_13187 ?auto_13180 ) ) ( CALIBRATION_TARGET ?auto_13185 ?auto_13183 ) ( not ( = ?auto_13183 ?auto_13178 ) ) ( not ( = ?auto_13181 ?auto_13178 ) ) ( not ( = ?auto_13188 ?auto_13178 ) ) ( ON_BOARD ?auto_13184 ?auto_13182 ) ( not ( = ?auto_13185 ?auto_13184 ) ) ( SUPPORTS ?auto_13184 ?auto_13179 ) ( not ( = ?auto_13187 ?auto_13179 ) ) ( not ( = ?auto_13180 ?auto_13179 ) ) ( CALIBRATION_TARGET ?auto_13184 ?auto_13183 ) ( ON_BOARD ?auto_13186 ?auto_13182 ) ( POWER_ON ?auto_13186 ) ( not ( = ?auto_13185 ?auto_13186 ) ) ( not ( = ?auto_13184 ?auto_13186 ) ) ( CALIBRATED ?auto_13186 ) ( SUPPORTS ?auto_13186 ?auto_13187 ) ( POINTING ?auto_13182 ?auto_13183 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13188 ?auto_13187 ?auto_13181 ?auto_13180 )
      ( GET-2IMAGE-VERIFY ?auto_13178 ?auto_13179 ?auto_13181 ?auto_13180 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13189 - DIRECTION
      ?auto_13190 - MODE
      ?auto_13192 - DIRECTION
      ?auto_13191 - MODE
    )
    :vars
    (
      ?auto_13198 - INSTRUMENT
      ?auto_13194 - SATELLITE
      ?auto_13196 - DIRECTION
      ?auto_13193 - DIRECTION
      ?auto_13197 - INSTRUMENT
      ?auto_13195 - MODE
      ?auto_13199 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13198 ?auto_13194 ) ( SUPPORTS ?auto_13198 ?auto_13190 ) ( not ( = ?auto_13189 ?auto_13196 ) ) ( not ( = ?auto_13192 ?auto_13189 ) ) ( not ( = ?auto_13192 ?auto_13196 ) ) ( not ( = ?auto_13191 ?auto_13190 ) ) ( CALIBRATION_TARGET ?auto_13198 ?auto_13196 ) ( not ( = ?auto_13196 ?auto_13193 ) ) ( not ( = ?auto_13189 ?auto_13193 ) ) ( not ( = ?auto_13192 ?auto_13193 ) ) ( ON_BOARD ?auto_13197 ?auto_13194 ) ( not ( = ?auto_13198 ?auto_13197 ) ) ( SUPPORTS ?auto_13197 ?auto_13195 ) ( not ( = ?auto_13191 ?auto_13195 ) ) ( not ( = ?auto_13190 ?auto_13195 ) ) ( CALIBRATION_TARGET ?auto_13197 ?auto_13196 ) ( ON_BOARD ?auto_13199 ?auto_13194 ) ( POWER_ON ?auto_13199 ) ( not ( = ?auto_13198 ?auto_13199 ) ) ( not ( = ?auto_13197 ?auto_13199 ) ) ( CALIBRATED ?auto_13199 ) ( SUPPORTS ?auto_13199 ?auto_13191 ) ( POINTING ?auto_13194 ?auto_13196 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13192 ?auto_13191 ?auto_13189 ?auto_13190 )
      ( GET-2IMAGE-VERIFY ?auto_13189 ?auto_13190 ?auto_13192 ?auto_13191 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13200 - DIRECTION
      ?auto_13201 - MODE
      ?auto_13203 - DIRECTION
      ?auto_13202 - MODE
    )
    :vars
    (
      ?auto_13207 - INSTRUMENT
      ?auto_13204 - SATELLITE
      ?auto_13205 - DIRECTION
      ?auto_13210 - DIRECTION
      ?auto_13209 - MODE
      ?auto_13206 - INSTRUMENT
      ?auto_13208 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13207 ?auto_13204 ) ( SUPPORTS ?auto_13207 ?auto_13201 ) ( not ( = ?auto_13200 ?auto_13205 ) ) ( not ( = ?auto_13210 ?auto_13200 ) ) ( not ( = ?auto_13210 ?auto_13205 ) ) ( not ( = ?auto_13209 ?auto_13201 ) ) ( CALIBRATION_TARGET ?auto_13207 ?auto_13205 ) ( not ( = ?auto_13205 ?auto_13203 ) ) ( not ( = ?auto_13200 ?auto_13203 ) ) ( not ( = ?auto_13210 ?auto_13203 ) ) ( ON_BOARD ?auto_13206 ?auto_13204 ) ( not ( = ?auto_13207 ?auto_13206 ) ) ( SUPPORTS ?auto_13206 ?auto_13202 ) ( not ( = ?auto_13209 ?auto_13202 ) ) ( not ( = ?auto_13201 ?auto_13202 ) ) ( CALIBRATION_TARGET ?auto_13206 ?auto_13205 ) ( ON_BOARD ?auto_13208 ?auto_13204 ) ( POWER_ON ?auto_13208 ) ( not ( = ?auto_13207 ?auto_13208 ) ) ( not ( = ?auto_13206 ?auto_13208 ) ) ( CALIBRATED ?auto_13208 ) ( SUPPORTS ?auto_13208 ?auto_13209 ) ( POINTING ?auto_13204 ?auto_13205 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13210 ?auto_13209 ?auto_13200 ?auto_13201 )
      ( GET-2IMAGE-VERIFY ?auto_13200 ?auto_13201 ?auto_13203 ?auto_13202 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13237 - DIRECTION
      ?auto_13238 - MODE
      ?auto_13240 - DIRECTION
      ?auto_13239 - MODE
      ?auto_13242 - DIRECTION
      ?auto_13241 - MODE
    )
    :vars
    (
      ?auto_13246 - INSTRUMENT
      ?auto_13243 - SATELLITE
      ?auto_13244 - DIRECTION
      ?auto_13245 - INSTRUMENT
      ?auto_13247 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13246 ?auto_13243 ) ( SUPPORTS ?auto_13246 ?auto_13241 ) ( not ( = ?auto_13242 ?auto_13244 ) ) ( not ( = ?auto_13237 ?auto_13242 ) ) ( not ( = ?auto_13237 ?auto_13244 ) ) ( not ( = ?auto_13238 ?auto_13241 ) ) ( CALIBRATION_TARGET ?auto_13246 ?auto_13244 ) ( not ( = ?auto_13244 ?auto_13240 ) ) ( not ( = ?auto_13242 ?auto_13240 ) ) ( not ( = ?auto_13237 ?auto_13240 ) ) ( ON_BOARD ?auto_13245 ?auto_13243 ) ( not ( = ?auto_13246 ?auto_13245 ) ) ( SUPPORTS ?auto_13245 ?auto_13239 ) ( not ( = ?auto_13238 ?auto_13239 ) ) ( not ( = ?auto_13241 ?auto_13239 ) ) ( CALIBRATION_TARGET ?auto_13245 ?auto_13244 ) ( ON_BOARD ?auto_13247 ?auto_13243 ) ( POWER_ON ?auto_13247 ) ( not ( = ?auto_13246 ?auto_13247 ) ) ( not ( = ?auto_13245 ?auto_13247 ) ) ( CALIBRATED ?auto_13247 ) ( SUPPORTS ?auto_13247 ?auto_13238 ) ( POINTING ?auto_13243 ?auto_13244 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13237 ?auto_13238 ?auto_13242 ?auto_13241 )
      ( GET-3IMAGE-VERIFY ?auto_13237 ?auto_13238 ?auto_13240 ?auto_13239 ?auto_13242 ?auto_13241 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13261 - DIRECTION
      ?auto_13262 - MODE
      ?auto_13264 - DIRECTION
      ?auto_13263 - MODE
      ?auto_13266 - DIRECTION
      ?auto_13265 - MODE
    )
    :vars
    (
      ?auto_13270 - INSTRUMENT
      ?auto_13267 - SATELLITE
      ?auto_13268 - DIRECTION
      ?auto_13269 - INSTRUMENT
      ?auto_13271 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13270 ?auto_13267 ) ( SUPPORTS ?auto_13270 ?auto_13263 ) ( not ( = ?auto_13264 ?auto_13268 ) ) ( not ( = ?auto_13261 ?auto_13264 ) ) ( not ( = ?auto_13261 ?auto_13268 ) ) ( not ( = ?auto_13262 ?auto_13263 ) ) ( CALIBRATION_TARGET ?auto_13270 ?auto_13268 ) ( not ( = ?auto_13268 ?auto_13266 ) ) ( not ( = ?auto_13264 ?auto_13266 ) ) ( not ( = ?auto_13261 ?auto_13266 ) ) ( ON_BOARD ?auto_13269 ?auto_13267 ) ( not ( = ?auto_13270 ?auto_13269 ) ) ( SUPPORTS ?auto_13269 ?auto_13265 ) ( not ( = ?auto_13262 ?auto_13265 ) ) ( not ( = ?auto_13263 ?auto_13265 ) ) ( CALIBRATION_TARGET ?auto_13269 ?auto_13268 ) ( ON_BOARD ?auto_13271 ?auto_13267 ) ( POWER_ON ?auto_13271 ) ( not ( = ?auto_13270 ?auto_13271 ) ) ( not ( = ?auto_13269 ?auto_13271 ) ) ( CALIBRATED ?auto_13271 ) ( SUPPORTS ?auto_13271 ?auto_13262 ) ( POINTING ?auto_13267 ?auto_13268 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13261 ?auto_13262 ?auto_13264 ?auto_13263 )
      ( GET-3IMAGE-VERIFY ?auto_13261 ?auto_13262 ?auto_13264 ?auto_13263 ?auto_13266 ?auto_13265 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13285 - DIRECTION
      ?auto_13286 - MODE
      ?auto_13288 - DIRECTION
      ?auto_13287 - MODE
      ?auto_13290 - DIRECTION
      ?auto_13289 - MODE
    )
    :vars
    (
      ?auto_13294 - INSTRUMENT
      ?auto_13291 - SATELLITE
      ?auto_13292 - DIRECTION
      ?auto_13293 - INSTRUMENT
      ?auto_13295 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13294 ?auto_13291 ) ( SUPPORTS ?auto_13294 ?auto_13289 ) ( not ( = ?auto_13290 ?auto_13292 ) ) ( not ( = ?auto_13288 ?auto_13290 ) ) ( not ( = ?auto_13288 ?auto_13292 ) ) ( not ( = ?auto_13287 ?auto_13289 ) ) ( CALIBRATION_TARGET ?auto_13294 ?auto_13292 ) ( not ( = ?auto_13292 ?auto_13285 ) ) ( not ( = ?auto_13290 ?auto_13285 ) ) ( not ( = ?auto_13288 ?auto_13285 ) ) ( ON_BOARD ?auto_13293 ?auto_13291 ) ( not ( = ?auto_13294 ?auto_13293 ) ) ( SUPPORTS ?auto_13293 ?auto_13286 ) ( not ( = ?auto_13287 ?auto_13286 ) ) ( not ( = ?auto_13289 ?auto_13286 ) ) ( CALIBRATION_TARGET ?auto_13293 ?auto_13292 ) ( ON_BOARD ?auto_13295 ?auto_13291 ) ( POWER_ON ?auto_13295 ) ( not ( = ?auto_13294 ?auto_13295 ) ) ( not ( = ?auto_13293 ?auto_13295 ) ) ( CALIBRATED ?auto_13295 ) ( SUPPORTS ?auto_13295 ?auto_13287 ) ( POINTING ?auto_13291 ?auto_13292 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13288 ?auto_13287 ?auto_13290 ?auto_13289 )
      ( GET-3IMAGE-VERIFY ?auto_13285 ?auto_13286 ?auto_13288 ?auto_13287 ?auto_13290 ?auto_13289 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13309 - DIRECTION
      ?auto_13310 - MODE
      ?auto_13312 - DIRECTION
      ?auto_13311 - MODE
      ?auto_13314 - DIRECTION
      ?auto_13313 - MODE
    )
    :vars
    (
      ?auto_13318 - INSTRUMENT
      ?auto_13315 - SATELLITE
      ?auto_13316 - DIRECTION
      ?auto_13317 - INSTRUMENT
      ?auto_13319 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13318 ?auto_13315 ) ( SUPPORTS ?auto_13318 ?auto_13311 ) ( not ( = ?auto_13312 ?auto_13316 ) ) ( not ( = ?auto_13314 ?auto_13312 ) ) ( not ( = ?auto_13314 ?auto_13316 ) ) ( not ( = ?auto_13313 ?auto_13311 ) ) ( CALIBRATION_TARGET ?auto_13318 ?auto_13316 ) ( not ( = ?auto_13316 ?auto_13309 ) ) ( not ( = ?auto_13312 ?auto_13309 ) ) ( not ( = ?auto_13314 ?auto_13309 ) ) ( ON_BOARD ?auto_13317 ?auto_13315 ) ( not ( = ?auto_13318 ?auto_13317 ) ) ( SUPPORTS ?auto_13317 ?auto_13310 ) ( not ( = ?auto_13313 ?auto_13310 ) ) ( not ( = ?auto_13311 ?auto_13310 ) ) ( CALIBRATION_TARGET ?auto_13317 ?auto_13316 ) ( ON_BOARD ?auto_13319 ?auto_13315 ) ( POWER_ON ?auto_13319 ) ( not ( = ?auto_13318 ?auto_13319 ) ) ( not ( = ?auto_13317 ?auto_13319 ) ) ( CALIBRATED ?auto_13319 ) ( SUPPORTS ?auto_13319 ?auto_13313 ) ( POINTING ?auto_13315 ?auto_13316 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13314 ?auto_13313 ?auto_13312 ?auto_13311 )
      ( GET-3IMAGE-VERIFY ?auto_13309 ?auto_13310 ?auto_13312 ?auto_13311 ?auto_13314 ?auto_13313 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13359 - DIRECTION
      ?auto_13360 - MODE
      ?auto_13362 - DIRECTION
      ?auto_13361 - MODE
      ?auto_13364 - DIRECTION
      ?auto_13363 - MODE
    )
    :vars
    (
      ?auto_13368 - INSTRUMENT
      ?auto_13365 - SATELLITE
      ?auto_13366 - DIRECTION
      ?auto_13367 - INSTRUMENT
      ?auto_13369 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13368 ?auto_13365 ) ( SUPPORTS ?auto_13368 ?auto_13360 ) ( not ( = ?auto_13359 ?auto_13366 ) ) ( not ( = ?auto_13362 ?auto_13359 ) ) ( not ( = ?auto_13362 ?auto_13366 ) ) ( not ( = ?auto_13361 ?auto_13360 ) ) ( CALIBRATION_TARGET ?auto_13368 ?auto_13366 ) ( not ( = ?auto_13366 ?auto_13364 ) ) ( not ( = ?auto_13359 ?auto_13364 ) ) ( not ( = ?auto_13362 ?auto_13364 ) ) ( ON_BOARD ?auto_13367 ?auto_13365 ) ( not ( = ?auto_13368 ?auto_13367 ) ) ( SUPPORTS ?auto_13367 ?auto_13363 ) ( not ( = ?auto_13361 ?auto_13363 ) ) ( not ( = ?auto_13360 ?auto_13363 ) ) ( CALIBRATION_TARGET ?auto_13367 ?auto_13366 ) ( ON_BOARD ?auto_13369 ?auto_13365 ) ( POWER_ON ?auto_13369 ) ( not ( = ?auto_13368 ?auto_13369 ) ) ( not ( = ?auto_13367 ?auto_13369 ) ) ( CALIBRATED ?auto_13369 ) ( SUPPORTS ?auto_13369 ?auto_13361 ) ( POINTING ?auto_13365 ?auto_13366 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13362 ?auto_13361 ?auto_13359 ?auto_13360 )
      ( GET-3IMAGE-VERIFY ?auto_13359 ?auto_13360 ?auto_13362 ?auto_13361 ?auto_13364 ?auto_13363 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13383 - DIRECTION
      ?auto_13384 - MODE
      ?auto_13386 - DIRECTION
      ?auto_13385 - MODE
      ?auto_13388 - DIRECTION
      ?auto_13387 - MODE
    )
    :vars
    (
      ?auto_13392 - INSTRUMENT
      ?auto_13389 - SATELLITE
      ?auto_13390 - DIRECTION
      ?auto_13391 - INSTRUMENT
      ?auto_13393 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13392 ?auto_13389 ) ( SUPPORTS ?auto_13392 ?auto_13384 ) ( not ( = ?auto_13383 ?auto_13390 ) ) ( not ( = ?auto_13388 ?auto_13383 ) ) ( not ( = ?auto_13388 ?auto_13390 ) ) ( not ( = ?auto_13387 ?auto_13384 ) ) ( CALIBRATION_TARGET ?auto_13392 ?auto_13390 ) ( not ( = ?auto_13390 ?auto_13386 ) ) ( not ( = ?auto_13383 ?auto_13386 ) ) ( not ( = ?auto_13388 ?auto_13386 ) ) ( ON_BOARD ?auto_13391 ?auto_13389 ) ( not ( = ?auto_13392 ?auto_13391 ) ) ( SUPPORTS ?auto_13391 ?auto_13385 ) ( not ( = ?auto_13387 ?auto_13385 ) ) ( not ( = ?auto_13384 ?auto_13385 ) ) ( CALIBRATION_TARGET ?auto_13391 ?auto_13390 ) ( ON_BOARD ?auto_13393 ?auto_13389 ) ( POWER_ON ?auto_13393 ) ( not ( = ?auto_13392 ?auto_13393 ) ) ( not ( = ?auto_13391 ?auto_13393 ) ) ( CALIBRATED ?auto_13393 ) ( SUPPORTS ?auto_13393 ?auto_13387 ) ( POINTING ?auto_13389 ?auto_13390 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13388 ?auto_13387 ?auto_13383 ?auto_13384 )
      ( GET-3IMAGE-VERIFY ?auto_13383 ?auto_13384 ?auto_13386 ?auto_13385 ?auto_13388 ?auto_13387 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_13461 - DIRECTION
      ?auto_13462 - MODE
    )
    :vars
    (
      ?auto_13468 - INSTRUMENT
      ?auto_13464 - SATELLITE
      ?auto_13466 - DIRECTION
      ?auto_13471 - DIRECTION
      ?auto_13470 - MODE
      ?auto_13463 - DIRECTION
      ?auto_13467 - INSTRUMENT
      ?auto_13465 - MODE
      ?auto_13469 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13468 ?auto_13464 ) ( SUPPORTS ?auto_13468 ?auto_13462 ) ( not ( = ?auto_13461 ?auto_13466 ) ) ( not ( = ?auto_13471 ?auto_13461 ) ) ( not ( = ?auto_13471 ?auto_13466 ) ) ( not ( = ?auto_13470 ?auto_13462 ) ) ( CALIBRATION_TARGET ?auto_13468 ?auto_13466 ) ( not ( = ?auto_13466 ?auto_13463 ) ) ( not ( = ?auto_13461 ?auto_13463 ) ) ( not ( = ?auto_13471 ?auto_13463 ) ) ( ON_BOARD ?auto_13467 ?auto_13464 ) ( not ( = ?auto_13468 ?auto_13467 ) ) ( SUPPORTS ?auto_13467 ?auto_13465 ) ( not ( = ?auto_13470 ?auto_13465 ) ) ( not ( = ?auto_13462 ?auto_13465 ) ) ( CALIBRATION_TARGET ?auto_13467 ?auto_13466 ) ( ON_BOARD ?auto_13469 ?auto_13464 ) ( POWER_ON ?auto_13469 ) ( not ( = ?auto_13468 ?auto_13469 ) ) ( not ( = ?auto_13467 ?auto_13469 ) ) ( SUPPORTS ?auto_13469 ?auto_13470 ) ( POINTING ?auto_13464 ?auto_13466 ) ( CALIBRATION_TARGET ?auto_13469 ?auto_13466 ) ( NOT_CALIBRATED ?auto_13469 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_13464 ?auto_13469 ?auto_13466 )
      ( GET-2IMAGE ?auto_13471 ?auto_13470 ?auto_13461 ?auto_13462 )
      ( GET-1IMAGE-VERIFY ?auto_13461 ?auto_13462 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13472 - DIRECTION
      ?auto_13473 - MODE
      ?auto_13475 - DIRECTION
      ?auto_13474 - MODE
    )
    :vars
    (
      ?auto_13481 - INSTRUMENT
      ?auto_13477 - SATELLITE
      ?auto_13476 - DIRECTION
      ?auto_13479 - DIRECTION
      ?auto_13478 - INSTRUMENT
      ?auto_13480 - MODE
      ?auto_13482 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13481 ?auto_13477 ) ( SUPPORTS ?auto_13481 ?auto_13474 ) ( not ( = ?auto_13475 ?auto_13476 ) ) ( not ( = ?auto_13472 ?auto_13475 ) ) ( not ( = ?auto_13472 ?auto_13476 ) ) ( not ( = ?auto_13473 ?auto_13474 ) ) ( CALIBRATION_TARGET ?auto_13481 ?auto_13476 ) ( not ( = ?auto_13476 ?auto_13479 ) ) ( not ( = ?auto_13475 ?auto_13479 ) ) ( not ( = ?auto_13472 ?auto_13479 ) ) ( ON_BOARD ?auto_13478 ?auto_13477 ) ( not ( = ?auto_13481 ?auto_13478 ) ) ( SUPPORTS ?auto_13478 ?auto_13480 ) ( not ( = ?auto_13473 ?auto_13480 ) ) ( not ( = ?auto_13474 ?auto_13480 ) ) ( CALIBRATION_TARGET ?auto_13478 ?auto_13476 ) ( ON_BOARD ?auto_13482 ?auto_13477 ) ( POWER_ON ?auto_13482 ) ( not ( = ?auto_13481 ?auto_13482 ) ) ( not ( = ?auto_13478 ?auto_13482 ) ) ( SUPPORTS ?auto_13482 ?auto_13473 ) ( POINTING ?auto_13477 ?auto_13476 ) ( CALIBRATION_TARGET ?auto_13482 ?auto_13476 ) ( NOT_CALIBRATED ?auto_13482 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13475 ?auto_13474 )
      ( GET-2IMAGE-VERIFY ?auto_13472 ?auto_13473 ?auto_13475 ?auto_13474 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13483 - DIRECTION
      ?auto_13484 - MODE
      ?auto_13486 - DIRECTION
      ?auto_13485 - MODE
    )
    :vars
    (
      ?auto_13491 - INSTRUMENT
      ?auto_13489 - SATELLITE
      ?auto_13487 - DIRECTION
      ?auto_13493 - DIRECTION
      ?auto_13492 - MODE
      ?auto_13490 - INSTRUMENT
      ?auto_13488 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13491 ?auto_13489 ) ( SUPPORTS ?auto_13491 ?auto_13485 ) ( not ( = ?auto_13486 ?auto_13487 ) ) ( not ( = ?auto_13493 ?auto_13486 ) ) ( not ( = ?auto_13493 ?auto_13487 ) ) ( not ( = ?auto_13492 ?auto_13485 ) ) ( CALIBRATION_TARGET ?auto_13491 ?auto_13487 ) ( not ( = ?auto_13487 ?auto_13483 ) ) ( not ( = ?auto_13486 ?auto_13483 ) ) ( not ( = ?auto_13493 ?auto_13483 ) ) ( ON_BOARD ?auto_13490 ?auto_13489 ) ( not ( = ?auto_13491 ?auto_13490 ) ) ( SUPPORTS ?auto_13490 ?auto_13484 ) ( not ( = ?auto_13492 ?auto_13484 ) ) ( not ( = ?auto_13485 ?auto_13484 ) ) ( CALIBRATION_TARGET ?auto_13490 ?auto_13487 ) ( ON_BOARD ?auto_13488 ?auto_13489 ) ( POWER_ON ?auto_13488 ) ( not ( = ?auto_13491 ?auto_13488 ) ) ( not ( = ?auto_13490 ?auto_13488 ) ) ( SUPPORTS ?auto_13488 ?auto_13492 ) ( POINTING ?auto_13489 ?auto_13487 ) ( CALIBRATION_TARGET ?auto_13488 ?auto_13487 ) ( NOT_CALIBRATED ?auto_13488 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13493 ?auto_13492 ?auto_13486 ?auto_13485 )
      ( GET-2IMAGE-VERIFY ?auto_13483 ?auto_13484 ?auto_13486 ?auto_13485 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13494 - DIRECTION
      ?auto_13495 - MODE
      ?auto_13497 - DIRECTION
      ?auto_13496 - MODE
    )
    :vars
    (
      ?auto_13504 - INSTRUMENT
      ?auto_13501 - SATELLITE
      ?auto_13498 - DIRECTION
      ?auto_13502 - DIRECTION
      ?auto_13503 - INSTRUMENT
      ?auto_13499 - MODE
      ?auto_13500 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13504 ?auto_13501 ) ( SUPPORTS ?auto_13504 ?auto_13495 ) ( not ( = ?auto_13494 ?auto_13498 ) ) ( not ( = ?auto_13497 ?auto_13494 ) ) ( not ( = ?auto_13497 ?auto_13498 ) ) ( not ( = ?auto_13496 ?auto_13495 ) ) ( CALIBRATION_TARGET ?auto_13504 ?auto_13498 ) ( not ( = ?auto_13498 ?auto_13502 ) ) ( not ( = ?auto_13494 ?auto_13502 ) ) ( not ( = ?auto_13497 ?auto_13502 ) ) ( ON_BOARD ?auto_13503 ?auto_13501 ) ( not ( = ?auto_13504 ?auto_13503 ) ) ( SUPPORTS ?auto_13503 ?auto_13499 ) ( not ( = ?auto_13496 ?auto_13499 ) ) ( not ( = ?auto_13495 ?auto_13499 ) ) ( CALIBRATION_TARGET ?auto_13503 ?auto_13498 ) ( ON_BOARD ?auto_13500 ?auto_13501 ) ( POWER_ON ?auto_13500 ) ( not ( = ?auto_13504 ?auto_13500 ) ) ( not ( = ?auto_13503 ?auto_13500 ) ) ( SUPPORTS ?auto_13500 ?auto_13496 ) ( POINTING ?auto_13501 ?auto_13498 ) ( CALIBRATION_TARGET ?auto_13500 ?auto_13498 ) ( NOT_CALIBRATED ?auto_13500 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13497 ?auto_13496 ?auto_13494 ?auto_13495 )
      ( GET-2IMAGE-VERIFY ?auto_13494 ?auto_13495 ?auto_13497 ?auto_13496 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13505 - DIRECTION
      ?auto_13506 - MODE
      ?auto_13508 - DIRECTION
      ?auto_13507 - MODE
    )
    :vars
    (
      ?auto_13513 - INSTRUMENT
      ?auto_13511 - SATELLITE
      ?auto_13509 - DIRECTION
      ?auto_13515 - DIRECTION
      ?auto_13514 - MODE
      ?auto_13512 - INSTRUMENT
      ?auto_13510 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13513 ?auto_13511 ) ( SUPPORTS ?auto_13513 ?auto_13506 ) ( not ( = ?auto_13505 ?auto_13509 ) ) ( not ( = ?auto_13515 ?auto_13505 ) ) ( not ( = ?auto_13515 ?auto_13509 ) ) ( not ( = ?auto_13514 ?auto_13506 ) ) ( CALIBRATION_TARGET ?auto_13513 ?auto_13509 ) ( not ( = ?auto_13509 ?auto_13508 ) ) ( not ( = ?auto_13505 ?auto_13508 ) ) ( not ( = ?auto_13515 ?auto_13508 ) ) ( ON_BOARD ?auto_13512 ?auto_13511 ) ( not ( = ?auto_13513 ?auto_13512 ) ) ( SUPPORTS ?auto_13512 ?auto_13507 ) ( not ( = ?auto_13514 ?auto_13507 ) ) ( not ( = ?auto_13506 ?auto_13507 ) ) ( CALIBRATION_TARGET ?auto_13512 ?auto_13509 ) ( ON_BOARD ?auto_13510 ?auto_13511 ) ( POWER_ON ?auto_13510 ) ( not ( = ?auto_13513 ?auto_13510 ) ) ( not ( = ?auto_13512 ?auto_13510 ) ) ( SUPPORTS ?auto_13510 ?auto_13514 ) ( POINTING ?auto_13511 ?auto_13509 ) ( CALIBRATION_TARGET ?auto_13510 ?auto_13509 ) ( NOT_CALIBRATED ?auto_13510 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13515 ?auto_13514 ?auto_13505 ?auto_13506 )
      ( GET-2IMAGE-VERIFY ?auto_13505 ?auto_13506 ?auto_13508 ?auto_13507 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13542 - DIRECTION
      ?auto_13543 - MODE
      ?auto_13545 - DIRECTION
      ?auto_13544 - MODE
      ?auto_13547 - DIRECTION
      ?auto_13546 - MODE
    )
    :vars
    (
      ?auto_13552 - INSTRUMENT
      ?auto_13550 - SATELLITE
      ?auto_13548 - DIRECTION
      ?auto_13551 - INSTRUMENT
      ?auto_13549 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13552 ?auto_13550 ) ( SUPPORTS ?auto_13552 ?auto_13546 ) ( not ( = ?auto_13547 ?auto_13548 ) ) ( not ( = ?auto_13542 ?auto_13547 ) ) ( not ( = ?auto_13542 ?auto_13548 ) ) ( not ( = ?auto_13543 ?auto_13546 ) ) ( CALIBRATION_TARGET ?auto_13552 ?auto_13548 ) ( not ( = ?auto_13548 ?auto_13545 ) ) ( not ( = ?auto_13547 ?auto_13545 ) ) ( not ( = ?auto_13542 ?auto_13545 ) ) ( ON_BOARD ?auto_13551 ?auto_13550 ) ( not ( = ?auto_13552 ?auto_13551 ) ) ( SUPPORTS ?auto_13551 ?auto_13544 ) ( not ( = ?auto_13543 ?auto_13544 ) ) ( not ( = ?auto_13546 ?auto_13544 ) ) ( CALIBRATION_TARGET ?auto_13551 ?auto_13548 ) ( ON_BOARD ?auto_13549 ?auto_13550 ) ( POWER_ON ?auto_13549 ) ( not ( = ?auto_13552 ?auto_13549 ) ) ( not ( = ?auto_13551 ?auto_13549 ) ) ( SUPPORTS ?auto_13549 ?auto_13543 ) ( POINTING ?auto_13550 ?auto_13548 ) ( CALIBRATION_TARGET ?auto_13549 ?auto_13548 ) ( NOT_CALIBRATED ?auto_13549 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13542 ?auto_13543 ?auto_13547 ?auto_13546 )
      ( GET-3IMAGE-VERIFY ?auto_13542 ?auto_13543 ?auto_13545 ?auto_13544 ?auto_13547 ?auto_13546 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13566 - DIRECTION
      ?auto_13567 - MODE
      ?auto_13569 - DIRECTION
      ?auto_13568 - MODE
      ?auto_13571 - DIRECTION
      ?auto_13570 - MODE
    )
    :vars
    (
      ?auto_13576 - INSTRUMENT
      ?auto_13574 - SATELLITE
      ?auto_13572 - DIRECTION
      ?auto_13575 - INSTRUMENT
      ?auto_13573 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13576 ?auto_13574 ) ( SUPPORTS ?auto_13576 ?auto_13568 ) ( not ( = ?auto_13569 ?auto_13572 ) ) ( not ( = ?auto_13566 ?auto_13569 ) ) ( not ( = ?auto_13566 ?auto_13572 ) ) ( not ( = ?auto_13567 ?auto_13568 ) ) ( CALIBRATION_TARGET ?auto_13576 ?auto_13572 ) ( not ( = ?auto_13572 ?auto_13571 ) ) ( not ( = ?auto_13569 ?auto_13571 ) ) ( not ( = ?auto_13566 ?auto_13571 ) ) ( ON_BOARD ?auto_13575 ?auto_13574 ) ( not ( = ?auto_13576 ?auto_13575 ) ) ( SUPPORTS ?auto_13575 ?auto_13570 ) ( not ( = ?auto_13567 ?auto_13570 ) ) ( not ( = ?auto_13568 ?auto_13570 ) ) ( CALIBRATION_TARGET ?auto_13575 ?auto_13572 ) ( ON_BOARD ?auto_13573 ?auto_13574 ) ( POWER_ON ?auto_13573 ) ( not ( = ?auto_13576 ?auto_13573 ) ) ( not ( = ?auto_13575 ?auto_13573 ) ) ( SUPPORTS ?auto_13573 ?auto_13567 ) ( POINTING ?auto_13574 ?auto_13572 ) ( CALIBRATION_TARGET ?auto_13573 ?auto_13572 ) ( NOT_CALIBRATED ?auto_13573 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13566 ?auto_13567 ?auto_13569 ?auto_13568 )
      ( GET-3IMAGE-VERIFY ?auto_13566 ?auto_13567 ?auto_13569 ?auto_13568 ?auto_13571 ?auto_13570 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13590 - DIRECTION
      ?auto_13591 - MODE
      ?auto_13593 - DIRECTION
      ?auto_13592 - MODE
      ?auto_13595 - DIRECTION
      ?auto_13594 - MODE
    )
    :vars
    (
      ?auto_13600 - INSTRUMENT
      ?auto_13598 - SATELLITE
      ?auto_13596 - DIRECTION
      ?auto_13599 - INSTRUMENT
      ?auto_13597 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13600 ?auto_13598 ) ( SUPPORTS ?auto_13600 ?auto_13594 ) ( not ( = ?auto_13595 ?auto_13596 ) ) ( not ( = ?auto_13593 ?auto_13595 ) ) ( not ( = ?auto_13593 ?auto_13596 ) ) ( not ( = ?auto_13592 ?auto_13594 ) ) ( CALIBRATION_TARGET ?auto_13600 ?auto_13596 ) ( not ( = ?auto_13596 ?auto_13590 ) ) ( not ( = ?auto_13595 ?auto_13590 ) ) ( not ( = ?auto_13593 ?auto_13590 ) ) ( ON_BOARD ?auto_13599 ?auto_13598 ) ( not ( = ?auto_13600 ?auto_13599 ) ) ( SUPPORTS ?auto_13599 ?auto_13591 ) ( not ( = ?auto_13592 ?auto_13591 ) ) ( not ( = ?auto_13594 ?auto_13591 ) ) ( CALIBRATION_TARGET ?auto_13599 ?auto_13596 ) ( ON_BOARD ?auto_13597 ?auto_13598 ) ( POWER_ON ?auto_13597 ) ( not ( = ?auto_13600 ?auto_13597 ) ) ( not ( = ?auto_13599 ?auto_13597 ) ) ( SUPPORTS ?auto_13597 ?auto_13592 ) ( POINTING ?auto_13598 ?auto_13596 ) ( CALIBRATION_TARGET ?auto_13597 ?auto_13596 ) ( NOT_CALIBRATED ?auto_13597 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13593 ?auto_13592 ?auto_13595 ?auto_13594 )
      ( GET-3IMAGE-VERIFY ?auto_13590 ?auto_13591 ?auto_13593 ?auto_13592 ?auto_13595 ?auto_13594 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13614 - DIRECTION
      ?auto_13615 - MODE
      ?auto_13617 - DIRECTION
      ?auto_13616 - MODE
      ?auto_13619 - DIRECTION
      ?auto_13618 - MODE
    )
    :vars
    (
      ?auto_13624 - INSTRUMENT
      ?auto_13622 - SATELLITE
      ?auto_13620 - DIRECTION
      ?auto_13623 - INSTRUMENT
      ?auto_13621 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13624 ?auto_13622 ) ( SUPPORTS ?auto_13624 ?auto_13616 ) ( not ( = ?auto_13617 ?auto_13620 ) ) ( not ( = ?auto_13619 ?auto_13617 ) ) ( not ( = ?auto_13619 ?auto_13620 ) ) ( not ( = ?auto_13618 ?auto_13616 ) ) ( CALIBRATION_TARGET ?auto_13624 ?auto_13620 ) ( not ( = ?auto_13620 ?auto_13614 ) ) ( not ( = ?auto_13617 ?auto_13614 ) ) ( not ( = ?auto_13619 ?auto_13614 ) ) ( ON_BOARD ?auto_13623 ?auto_13622 ) ( not ( = ?auto_13624 ?auto_13623 ) ) ( SUPPORTS ?auto_13623 ?auto_13615 ) ( not ( = ?auto_13618 ?auto_13615 ) ) ( not ( = ?auto_13616 ?auto_13615 ) ) ( CALIBRATION_TARGET ?auto_13623 ?auto_13620 ) ( ON_BOARD ?auto_13621 ?auto_13622 ) ( POWER_ON ?auto_13621 ) ( not ( = ?auto_13624 ?auto_13621 ) ) ( not ( = ?auto_13623 ?auto_13621 ) ) ( SUPPORTS ?auto_13621 ?auto_13618 ) ( POINTING ?auto_13622 ?auto_13620 ) ( CALIBRATION_TARGET ?auto_13621 ?auto_13620 ) ( NOT_CALIBRATED ?auto_13621 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13619 ?auto_13618 ?auto_13617 ?auto_13616 )
      ( GET-3IMAGE-VERIFY ?auto_13614 ?auto_13615 ?auto_13617 ?auto_13616 ?auto_13619 ?auto_13618 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13664 - DIRECTION
      ?auto_13665 - MODE
      ?auto_13667 - DIRECTION
      ?auto_13666 - MODE
      ?auto_13669 - DIRECTION
      ?auto_13668 - MODE
    )
    :vars
    (
      ?auto_13674 - INSTRUMENT
      ?auto_13672 - SATELLITE
      ?auto_13670 - DIRECTION
      ?auto_13673 - INSTRUMENT
      ?auto_13671 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13674 ?auto_13672 ) ( SUPPORTS ?auto_13674 ?auto_13665 ) ( not ( = ?auto_13664 ?auto_13670 ) ) ( not ( = ?auto_13667 ?auto_13664 ) ) ( not ( = ?auto_13667 ?auto_13670 ) ) ( not ( = ?auto_13666 ?auto_13665 ) ) ( CALIBRATION_TARGET ?auto_13674 ?auto_13670 ) ( not ( = ?auto_13670 ?auto_13669 ) ) ( not ( = ?auto_13664 ?auto_13669 ) ) ( not ( = ?auto_13667 ?auto_13669 ) ) ( ON_BOARD ?auto_13673 ?auto_13672 ) ( not ( = ?auto_13674 ?auto_13673 ) ) ( SUPPORTS ?auto_13673 ?auto_13668 ) ( not ( = ?auto_13666 ?auto_13668 ) ) ( not ( = ?auto_13665 ?auto_13668 ) ) ( CALIBRATION_TARGET ?auto_13673 ?auto_13670 ) ( ON_BOARD ?auto_13671 ?auto_13672 ) ( POWER_ON ?auto_13671 ) ( not ( = ?auto_13674 ?auto_13671 ) ) ( not ( = ?auto_13673 ?auto_13671 ) ) ( SUPPORTS ?auto_13671 ?auto_13666 ) ( POINTING ?auto_13672 ?auto_13670 ) ( CALIBRATION_TARGET ?auto_13671 ?auto_13670 ) ( NOT_CALIBRATED ?auto_13671 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13667 ?auto_13666 ?auto_13664 ?auto_13665 )
      ( GET-3IMAGE-VERIFY ?auto_13664 ?auto_13665 ?auto_13667 ?auto_13666 ?auto_13669 ?auto_13668 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13688 - DIRECTION
      ?auto_13689 - MODE
      ?auto_13691 - DIRECTION
      ?auto_13690 - MODE
      ?auto_13693 - DIRECTION
      ?auto_13692 - MODE
    )
    :vars
    (
      ?auto_13698 - INSTRUMENT
      ?auto_13696 - SATELLITE
      ?auto_13694 - DIRECTION
      ?auto_13697 - INSTRUMENT
      ?auto_13695 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13698 ?auto_13696 ) ( SUPPORTS ?auto_13698 ?auto_13689 ) ( not ( = ?auto_13688 ?auto_13694 ) ) ( not ( = ?auto_13693 ?auto_13688 ) ) ( not ( = ?auto_13693 ?auto_13694 ) ) ( not ( = ?auto_13692 ?auto_13689 ) ) ( CALIBRATION_TARGET ?auto_13698 ?auto_13694 ) ( not ( = ?auto_13694 ?auto_13691 ) ) ( not ( = ?auto_13688 ?auto_13691 ) ) ( not ( = ?auto_13693 ?auto_13691 ) ) ( ON_BOARD ?auto_13697 ?auto_13696 ) ( not ( = ?auto_13698 ?auto_13697 ) ) ( SUPPORTS ?auto_13697 ?auto_13690 ) ( not ( = ?auto_13692 ?auto_13690 ) ) ( not ( = ?auto_13689 ?auto_13690 ) ) ( CALIBRATION_TARGET ?auto_13697 ?auto_13694 ) ( ON_BOARD ?auto_13695 ?auto_13696 ) ( POWER_ON ?auto_13695 ) ( not ( = ?auto_13698 ?auto_13695 ) ) ( not ( = ?auto_13697 ?auto_13695 ) ) ( SUPPORTS ?auto_13695 ?auto_13692 ) ( POINTING ?auto_13696 ?auto_13694 ) ( CALIBRATION_TARGET ?auto_13695 ?auto_13694 ) ( NOT_CALIBRATED ?auto_13695 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13693 ?auto_13692 ?auto_13688 ?auto_13689 )
      ( GET-3IMAGE-VERIFY ?auto_13688 ?auto_13689 ?auto_13691 ?auto_13690 ?auto_13693 ?auto_13692 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_13766 - DIRECTION
      ?auto_13767 - MODE
    )
    :vars
    (
      ?auto_13774 - INSTRUMENT
      ?auto_13771 - SATELLITE
      ?auto_13768 - DIRECTION
      ?auto_13776 - DIRECTION
      ?auto_13775 - MODE
      ?auto_13772 - DIRECTION
      ?auto_13773 - INSTRUMENT
      ?auto_13769 - MODE
      ?auto_13770 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13774 ?auto_13771 ) ( SUPPORTS ?auto_13774 ?auto_13767 ) ( not ( = ?auto_13766 ?auto_13768 ) ) ( not ( = ?auto_13776 ?auto_13766 ) ) ( not ( = ?auto_13776 ?auto_13768 ) ) ( not ( = ?auto_13775 ?auto_13767 ) ) ( CALIBRATION_TARGET ?auto_13774 ?auto_13768 ) ( not ( = ?auto_13768 ?auto_13772 ) ) ( not ( = ?auto_13766 ?auto_13772 ) ) ( not ( = ?auto_13776 ?auto_13772 ) ) ( ON_BOARD ?auto_13773 ?auto_13771 ) ( not ( = ?auto_13774 ?auto_13773 ) ) ( SUPPORTS ?auto_13773 ?auto_13769 ) ( not ( = ?auto_13775 ?auto_13769 ) ) ( not ( = ?auto_13767 ?auto_13769 ) ) ( CALIBRATION_TARGET ?auto_13773 ?auto_13768 ) ( ON_BOARD ?auto_13770 ?auto_13771 ) ( not ( = ?auto_13774 ?auto_13770 ) ) ( not ( = ?auto_13773 ?auto_13770 ) ) ( SUPPORTS ?auto_13770 ?auto_13775 ) ( POINTING ?auto_13771 ?auto_13768 ) ( CALIBRATION_TARGET ?auto_13770 ?auto_13768 ) ( POWER_AVAIL ?auto_13771 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_13770 ?auto_13771 )
      ( GET-2IMAGE ?auto_13776 ?auto_13775 ?auto_13766 ?auto_13767 )
      ( GET-1IMAGE-VERIFY ?auto_13766 ?auto_13767 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13777 - DIRECTION
      ?auto_13778 - MODE
      ?auto_13780 - DIRECTION
      ?auto_13779 - MODE
    )
    :vars
    (
      ?auto_13783 - INSTRUMENT
      ?auto_13781 - SATELLITE
      ?auto_13782 - DIRECTION
      ?auto_13785 - DIRECTION
      ?auto_13784 - INSTRUMENT
      ?auto_13786 - MODE
      ?auto_13787 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13783 ?auto_13781 ) ( SUPPORTS ?auto_13783 ?auto_13779 ) ( not ( = ?auto_13780 ?auto_13782 ) ) ( not ( = ?auto_13777 ?auto_13780 ) ) ( not ( = ?auto_13777 ?auto_13782 ) ) ( not ( = ?auto_13778 ?auto_13779 ) ) ( CALIBRATION_TARGET ?auto_13783 ?auto_13782 ) ( not ( = ?auto_13782 ?auto_13785 ) ) ( not ( = ?auto_13780 ?auto_13785 ) ) ( not ( = ?auto_13777 ?auto_13785 ) ) ( ON_BOARD ?auto_13784 ?auto_13781 ) ( not ( = ?auto_13783 ?auto_13784 ) ) ( SUPPORTS ?auto_13784 ?auto_13786 ) ( not ( = ?auto_13778 ?auto_13786 ) ) ( not ( = ?auto_13779 ?auto_13786 ) ) ( CALIBRATION_TARGET ?auto_13784 ?auto_13782 ) ( ON_BOARD ?auto_13787 ?auto_13781 ) ( not ( = ?auto_13783 ?auto_13787 ) ) ( not ( = ?auto_13784 ?auto_13787 ) ) ( SUPPORTS ?auto_13787 ?auto_13778 ) ( POINTING ?auto_13781 ?auto_13782 ) ( CALIBRATION_TARGET ?auto_13787 ?auto_13782 ) ( POWER_AVAIL ?auto_13781 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13780 ?auto_13779 )
      ( GET-2IMAGE-VERIFY ?auto_13777 ?auto_13778 ?auto_13780 ?auto_13779 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13788 - DIRECTION
      ?auto_13789 - MODE
      ?auto_13791 - DIRECTION
      ?auto_13790 - MODE
    )
    :vars
    (
      ?auto_13795 - INSTRUMENT
      ?auto_13792 - SATELLITE
      ?auto_13796 - DIRECTION
      ?auto_13798 - DIRECTION
      ?auto_13797 - MODE
      ?auto_13793 - INSTRUMENT
      ?auto_13794 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13795 ?auto_13792 ) ( SUPPORTS ?auto_13795 ?auto_13790 ) ( not ( = ?auto_13791 ?auto_13796 ) ) ( not ( = ?auto_13798 ?auto_13791 ) ) ( not ( = ?auto_13798 ?auto_13796 ) ) ( not ( = ?auto_13797 ?auto_13790 ) ) ( CALIBRATION_TARGET ?auto_13795 ?auto_13796 ) ( not ( = ?auto_13796 ?auto_13788 ) ) ( not ( = ?auto_13791 ?auto_13788 ) ) ( not ( = ?auto_13798 ?auto_13788 ) ) ( ON_BOARD ?auto_13793 ?auto_13792 ) ( not ( = ?auto_13795 ?auto_13793 ) ) ( SUPPORTS ?auto_13793 ?auto_13789 ) ( not ( = ?auto_13797 ?auto_13789 ) ) ( not ( = ?auto_13790 ?auto_13789 ) ) ( CALIBRATION_TARGET ?auto_13793 ?auto_13796 ) ( ON_BOARD ?auto_13794 ?auto_13792 ) ( not ( = ?auto_13795 ?auto_13794 ) ) ( not ( = ?auto_13793 ?auto_13794 ) ) ( SUPPORTS ?auto_13794 ?auto_13797 ) ( POINTING ?auto_13792 ?auto_13796 ) ( CALIBRATION_TARGET ?auto_13794 ?auto_13796 ) ( POWER_AVAIL ?auto_13792 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13798 ?auto_13797 ?auto_13791 ?auto_13790 )
      ( GET-2IMAGE-VERIFY ?auto_13788 ?auto_13789 ?auto_13791 ?auto_13790 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13799 - DIRECTION
      ?auto_13800 - MODE
      ?auto_13802 - DIRECTION
      ?auto_13801 - MODE
    )
    :vars
    (
      ?auto_13807 - INSTRUMENT
      ?auto_13803 - SATELLITE
      ?auto_13808 - DIRECTION
      ?auto_13806 - DIRECTION
      ?auto_13804 - INSTRUMENT
      ?auto_13809 - MODE
      ?auto_13805 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13807 ?auto_13803 ) ( SUPPORTS ?auto_13807 ?auto_13800 ) ( not ( = ?auto_13799 ?auto_13808 ) ) ( not ( = ?auto_13802 ?auto_13799 ) ) ( not ( = ?auto_13802 ?auto_13808 ) ) ( not ( = ?auto_13801 ?auto_13800 ) ) ( CALIBRATION_TARGET ?auto_13807 ?auto_13808 ) ( not ( = ?auto_13808 ?auto_13806 ) ) ( not ( = ?auto_13799 ?auto_13806 ) ) ( not ( = ?auto_13802 ?auto_13806 ) ) ( ON_BOARD ?auto_13804 ?auto_13803 ) ( not ( = ?auto_13807 ?auto_13804 ) ) ( SUPPORTS ?auto_13804 ?auto_13809 ) ( not ( = ?auto_13801 ?auto_13809 ) ) ( not ( = ?auto_13800 ?auto_13809 ) ) ( CALIBRATION_TARGET ?auto_13804 ?auto_13808 ) ( ON_BOARD ?auto_13805 ?auto_13803 ) ( not ( = ?auto_13807 ?auto_13805 ) ) ( not ( = ?auto_13804 ?auto_13805 ) ) ( SUPPORTS ?auto_13805 ?auto_13801 ) ( POINTING ?auto_13803 ?auto_13808 ) ( CALIBRATION_TARGET ?auto_13805 ?auto_13808 ) ( POWER_AVAIL ?auto_13803 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13802 ?auto_13801 ?auto_13799 ?auto_13800 )
      ( GET-2IMAGE-VERIFY ?auto_13799 ?auto_13800 ?auto_13802 ?auto_13801 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13810 - DIRECTION
      ?auto_13811 - MODE
      ?auto_13813 - DIRECTION
      ?auto_13812 - MODE
    )
    :vars
    (
      ?auto_13817 - INSTRUMENT
      ?auto_13814 - SATELLITE
      ?auto_13818 - DIRECTION
      ?auto_13820 - DIRECTION
      ?auto_13819 - MODE
      ?auto_13815 - INSTRUMENT
      ?auto_13816 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13817 ?auto_13814 ) ( SUPPORTS ?auto_13817 ?auto_13811 ) ( not ( = ?auto_13810 ?auto_13818 ) ) ( not ( = ?auto_13820 ?auto_13810 ) ) ( not ( = ?auto_13820 ?auto_13818 ) ) ( not ( = ?auto_13819 ?auto_13811 ) ) ( CALIBRATION_TARGET ?auto_13817 ?auto_13818 ) ( not ( = ?auto_13818 ?auto_13813 ) ) ( not ( = ?auto_13810 ?auto_13813 ) ) ( not ( = ?auto_13820 ?auto_13813 ) ) ( ON_BOARD ?auto_13815 ?auto_13814 ) ( not ( = ?auto_13817 ?auto_13815 ) ) ( SUPPORTS ?auto_13815 ?auto_13812 ) ( not ( = ?auto_13819 ?auto_13812 ) ) ( not ( = ?auto_13811 ?auto_13812 ) ) ( CALIBRATION_TARGET ?auto_13815 ?auto_13818 ) ( ON_BOARD ?auto_13816 ?auto_13814 ) ( not ( = ?auto_13817 ?auto_13816 ) ) ( not ( = ?auto_13815 ?auto_13816 ) ) ( SUPPORTS ?auto_13816 ?auto_13819 ) ( POINTING ?auto_13814 ?auto_13818 ) ( CALIBRATION_TARGET ?auto_13816 ?auto_13818 ) ( POWER_AVAIL ?auto_13814 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13820 ?auto_13819 ?auto_13810 ?auto_13811 )
      ( GET-2IMAGE-VERIFY ?auto_13810 ?auto_13811 ?auto_13813 ?auto_13812 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13847 - DIRECTION
      ?auto_13848 - MODE
      ?auto_13850 - DIRECTION
      ?auto_13849 - MODE
      ?auto_13852 - DIRECTION
      ?auto_13851 - MODE
    )
    :vars
    (
      ?auto_13856 - INSTRUMENT
      ?auto_13853 - SATELLITE
      ?auto_13857 - DIRECTION
      ?auto_13854 - INSTRUMENT
      ?auto_13855 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13856 ?auto_13853 ) ( SUPPORTS ?auto_13856 ?auto_13851 ) ( not ( = ?auto_13852 ?auto_13857 ) ) ( not ( = ?auto_13847 ?auto_13852 ) ) ( not ( = ?auto_13847 ?auto_13857 ) ) ( not ( = ?auto_13848 ?auto_13851 ) ) ( CALIBRATION_TARGET ?auto_13856 ?auto_13857 ) ( not ( = ?auto_13857 ?auto_13850 ) ) ( not ( = ?auto_13852 ?auto_13850 ) ) ( not ( = ?auto_13847 ?auto_13850 ) ) ( ON_BOARD ?auto_13854 ?auto_13853 ) ( not ( = ?auto_13856 ?auto_13854 ) ) ( SUPPORTS ?auto_13854 ?auto_13849 ) ( not ( = ?auto_13848 ?auto_13849 ) ) ( not ( = ?auto_13851 ?auto_13849 ) ) ( CALIBRATION_TARGET ?auto_13854 ?auto_13857 ) ( ON_BOARD ?auto_13855 ?auto_13853 ) ( not ( = ?auto_13856 ?auto_13855 ) ) ( not ( = ?auto_13854 ?auto_13855 ) ) ( SUPPORTS ?auto_13855 ?auto_13848 ) ( POINTING ?auto_13853 ?auto_13857 ) ( CALIBRATION_TARGET ?auto_13855 ?auto_13857 ) ( POWER_AVAIL ?auto_13853 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13847 ?auto_13848 ?auto_13852 ?auto_13851 )
      ( GET-3IMAGE-VERIFY ?auto_13847 ?auto_13848 ?auto_13850 ?auto_13849 ?auto_13852 ?auto_13851 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13871 - DIRECTION
      ?auto_13872 - MODE
      ?auto_13874 - DIRECTION
      ?auto_13873 - MODE
      ?auto_13876 - DIRECTION
      ?auto_13875 - MODE
    )
    :vars
    (
      ?auto_13880 - INSTRUMENT
      ?auto_13877 - SATELLITE
      ?auto_13881 - DIRECTION
      ?auto_13878 - INSTRUMENT
      ?auto_13879 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13880 ?auto_13877 ) ( SUPPORTS ?auto_13880 ?auto_13873 ) ( not ( = ?auto_13874 ?auto_13881 ) ) ( not ( = ?auto_13871 ?auto_13874 ) ) ( not ( = ?auto_13871 ?auto_13881 ) ) ( not ( = ?auto_13872 ?auto_13873 ) ) ( CALIBRATION_TARGET ?auto_13880 ?auto_13881 ) ( not ( = ?auto_13881 ?auto_13876 ) ) ( not ( = ?auto_13874 ?auto_13876 ) ) ( not ( = ?auto_13871 ?auto_13876 ) ) ( ON_BOARD ?auto_13878 ?auto_13877 ) ( not ( = ?auto_13880 ?auto_13878 ) ) ( SUPPORTS ?auto_13878 ?auto_13875 ) ( not ( = ?auto_13872 ?auto_13875 ) ) ( not ( = ?auto_13873 ?auto_13875 ) ) ( CALIBRATION_TARGET ?auto_13878 ?auto_13881 ) ( ON_BOARD ?auto_13879 ?auto_13877 ) ( not ( = ?auto_13880 ?auto_13879 ) ) ( not ( = ?auto_13878 ?auto_13879 ) ) ( SUPPORTS ?auto_13879 ?auto_13872 ) ( POINTING ?auto_13877 ?auto_13881 ) ( CALIBRATION_TARGET ?auto_13879 ?auto_13881 ) ( POWER_AVAIL ?auto_13877 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13871 ?auto_13872 ?auto_13874 ?auto_13873 )
      ( GET-3IMAGE-VERIFY ?auto_13871 ?auto_13872 ?auto_13874 ?auto_13873 ?auto_13876 ?auto_13875 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13895 - DIRECTION
      ?auto_13896 - MODE
      ?auto_13898 - DIRECTION
      ?auto_13897 - MODE
      ?auto_13900 - DIRECTION
      ?auto_13899 - MODE
    )
    :vars
    (
      ?auto_13904 - INSTRUMENT
      ?auto_13901 - SATELLITE
      ?auto_13905 - DIRECTION
      ?auto_13902 - INSTRUMENT
      ?auto_13903 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13904 ?auto_13901 ) ( SUPPORTS ?auto_13904 ?auto_13899 ) ( not ( = ?auto_13900 ?auto_13905 ) ) ( not ( = ?auto_13898 ?auto_13900 ) ) ( not ( = ?auto_13898 ?auto_13905 ) ) ( not ( = ?auto_13897 ?auto_13899 ) ) ( CALIBRATION_TARGET ?auto_13904 ?auto_13905 ) ( not ( = ?auto_13905 ?auto_13895 ) ) ( not ( = ?auto_13900 ?auto_13895 ) ) ( not ( = ?auto_13898 ?auto_13895 ) ) ( ON_BOARD ?auto_13902 ?auto_13901 ) ( not ( = ?auto_13904 ?auto_13902 ) ) ( SUPPORTS ?auto_13902 ?auto_13896 ) ( not ( = ?auto_13897 ?auto_13896 ) ) ( not ( = ?auto_13899 ?auto_13896 ) ) ( CALIBRATION_TARGET ?auto_13902 ?auto_13905 ) ( ON_BOARD ?auto_13903 ?auto_13901 ) ( not ( = ?auto_13904 ?auto_13903 ) ) ( not ( = ?auto_13902 ?auto_13903 ) ) ( SUPPORTS ?auto_13903 ?auto_13897 ) ( POINTING ?auto_13901 ?auto_13905 ) ( CALIBRATION_TARGET ?auto_13903 ?auto_13905 ) ( POWER_AVAIL ?auto_13901 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13898 ?auto_13897 ?auto_13900 ?auto_13899 )
      ( GET-3IMAGE-VERIFY ?auto_13895 ?auto_13896 ?auto_13898 ?auto_13897 ?auto_13900 ?auto_13899 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13919 - DIRECTION
      ?auto_13920 - MODE
      ?auto_13922 - DIRECTION
      ?auto_13921 - MODE
      ?auto_13924 - DIRECTION
      ?auto_13923 - MODE
    )
    :vars
    (
      ?auto_13928 - INSTRUMENT
      ?auto_13925 - SATELLITE
      ?auto_13929 - DIRECTION
      ?auto_13926 - INSTRUMENT
      ?auto_13927 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13928 ?auto_13925 ) ( SUPPORTS ?auto_13928 ?auto_13921 ) ( not ( = ?auto_13922 ?auto_13929 ) ) ( not ( = ?auto_13924 ?auto_13922 ) ) ( not ( = ?auto_13924 ?auto_13929 ) ) ( not ( = ?auto_13923 ?auto_13921 ) ) ( CALIBRATION_TARGET ?auto_13928 ?auto_13929 ) ( not ( = ?auto_13929 ?auto_13919 ) ) ( not ( = ?auto_13922 ?auto_13919 ) ) ( not ( = ?auto_13924 ?auto_13919 ) ) ( ON_BOARD ?auto_13926 ?auto_13925 ) ( not ( = ?auto_13928 ?auto_13926 ) ) ( SUPPORTS ?auto_13926 ?auto_13920 ) ( not ( = ?auto_13923 ?auto_13920 ) ) ( not ( = ?auto_13921 ?auto_13920 ) ) ( CALIBRATION_TARGET ?auto_13926 ?auto_13929 ) ( ON_BOARD ?auto_13927 ?auto_13925 ) ( not ( = ?auto_13928 ?auto_13927 ) ) ( not ( = ?auto_13926 ?auto_13927 ) ) ( SUPPORTS ?auto_13927 ?auto_13923 ) ( POINTING ?auto_13925 ?auto_13929 ) ( CALIBRATION_TARGET ?auto_13927 ?auto_13929 ) ( POWER_AVAIL ?auto_13925 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13924 ?auto_13923 ?auto_13922 ?auto_13921 )
      ( GET-3IMAGE-VERIFY ?auto_13919 ?auto_13920 ?auto_13922 ?auto_13921 ?auto_13924 ?auto_13923 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13969 - DIRECTION
      ?auto_13970 - MODE
      ?auto_13972 - DIRECTION
      ?auto_13971 - MODE
      ?auto_13974 - DIRECTION
      ?auto_13973 - MODE
    )
    :vars
    (
      ?auto_13978 - INSTRUMENT
      ?auto_13975 - SATELLITE
      ?auto_13979 - DIRECTION
      ?auto_13976 - INSTRUMENT
      ?auto_13977 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_13978 ?auto_13975 ) ( SUPPORTS ?auto_13978 ?auto_13970 ) ( not ( = ?auto_13969 ?auto_13979 ) ) ( not ( = ?auto_13972 ?auto_13969 ) ) ( not ( = ?auto_13972 ?auto_13979 ) ) ( not ( = ?auto_13971 ?auto_13970 ) ) ( CALIBRATION_TARGET ?auto_13978 ?auto_13979 ) ( not ( = ?auto_13979 ?auto_13974 ) ) ( not ( = ?auto_13969 ?auto_13974 ) ) ( not ( = ?auto_13972 ?auto_13974 ) ) ( ON_BOARD ?auto_13976 ?auto_13975 ) ( not ( = ?auto_13978 ?auto_13976 ) ) ( SUPPORTS ?auto_13976 ?auto_13973 ) ( not ( = ?auto_13971 ?auto_13973 ) ) ( not ( = ?auto_13970 ?auto_13973 ) ) ( CALIBRATION_TARGET ?auto_13976 ?auto_13979 ) ( ON_BOARD ?auto_13977 ?auto_13975 ) ( not ( = ?auto_13978 ?auto_13977 ) ) ( not ( = ?auto_13976 ?auto_13977 ) ) ( SUPPORTS ?auto_13977 ?auto_13971 ) ( POINTING ?auto_13975 ?auto_13979 ) ( CALIBRATION_TARGET ?auto_13977 ?auto_13979 ) ( POWER_AVAIL ?auto_13975 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13972 ?auto_13971 ?auto_13969 ?auto_13970 )
      ( GET-3IMAGE-VERIFY ?auto_13969 ?auto_13970 ?auto_13972 ?auto_13971 ?auto_13974 ?auto_13973 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_13993 - DIRECTION
      ?auto_13994 - MODE
      ?auto_13996 - DIRECTION
      ?auto_13995 - MODE
      ?auto_13998 - DIRECTION
      ?auto_13997 - MODE
    )
    :vars
    (
      ?auto_14002 - INSTRUMENT
      ?auto_13999 - SATELLITE
      ?auto_14003 - DIRECTION
      ?auto_14000 - INSTRUMENT
      ?auto_14001 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_14002 ?auto_13999 ) ( SUPPORTS ?auto_14002 ?auto_13994 ) ( not ( = ?auto_13993 ?auto_14003 ) ) ( not ( = ?auto_13998 ?auto_13993 ) ) ( not ( = ?auto_13998 ?auto_14003 ) ) ( not ( = ?auto_13997 ?auto_13994 ) ) ( CALIBRATION_TARGET ?auto_14002 ?auto_14003 ) ( not ( = ?auto_14003 ?auto_13996 ) ) ( not ( = ?auto_13993 ?auto_13996 ) ) ( not ( = ?auto_13998 ?auto_13996 ) ) ( ON_BOARD ?auto_14000 ?auto_13999 ) ( not ( = ?auto_14002 ?auto_14000 ) ) ( SUPPORTS ?auto_14000 ?auto_13995 ) ( not ( = ?auto_13997 ?auto_13995 ) ) ( not ( = ?auto_13994 ?auto_13995 ) ) ( CALIBRATION_TARGET ?auto_14000 ?auto_14003 ) ( ON_BOARD ?auto_14001 ?auto_13999 ) ( not ( = ?auto_14002 ?auto_14001 ) ) ( not ( = ?auto_14000 ?auto_14001 ) ) ( SUPPORTS ?auto_14001 ?auto_13997 ) ( POINTING ?auto_13999 ?auto_14003 ) ( CALIBRATION_TARGET ?auto_14001 ?auto_14003 ) ( POWER_AVAIL ?auto_13999 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13998 ?auto_13997 ?auto_13993 ?auto_13994 )
      ( GET-3IMAGE-VERIFY ?auto_13993 ?auto_13994 ?auto_13996 ?auto_13995 ?auto_13998 ?auto_13997 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_14071 - DIRECTION
      ?auto_14072 - MODE
    )
    :vars
    (
      ?auto_14077 - INSTRUMENT
      ?auto_14073 - SATELLITE
      ?auto_14078 - DIRECTION
      ?auto_14081 - DIRECTION
      ?auto_14080 - MODE
      ?auto_14076 - DIRECTION
      ?auto_14074 - INSTRUMENT
      ?auto_14079 - MODE
      ?auto_14075 - INSTRUMENT
      ?auto_14082 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14077 ?auto_14073 ) ( SUPPORTS ?auto_14077 ?auto_14072 ) ( not ( = ?auto_14071 ?auto_14078 ) ) ( not ( = ?auto_14081 ?auto_14071 ) ) ( not ( = ?auto_14081 ?auto_14078 ) ) ( not ( = ?auto_14080 ?auto_14072 ) ) ( CALIBRATION_TARGET ?auto_14077 ?auto_14078 ) ( not ( = ?auto_14078 ?auto_14076 ) ) ( not ( = ?auto_14071 ?auto_14076 ) ) ( not ( = ?auto_14081 ?auto_14076 ) ) ( ON_BOARD ?auto_14074 ?auto_14073 ) ( not ( = ?auto_14077 ?auto_14074 ) ) ( SUPPORTS ?auto_14074 ?auto_14079 ) ( not ( = ?auto_14080 ?auto_14079 ) ) ( not ( = ?auto_14072 ?auto_14079 ) ) ( CALIBRATION_TARGET ?auto_14074 ?auto_14078 ) ( ON_BOARD ?auto_14075 ?auto_14073 ) ( not ( = ?auto_14077 ?auto_14075 ) ) ( not ( = ?auto_14074 ?auto_14075 ) ) ( SUPPORTS ?auto_14075 ?auto_14080 ) ( CALIBRATION_TARGET ?auto_14075 ?auto_14078 ) ( POWER_AVAIL ?auto_14073 ) ( POINTING ?auto_14073 ?auto_14082 ) ( not ( = ?auto_14078 ?auto_14082 ) ) ( not ( = ?auto_14071 ?auto_14082 ) ) ( not ( = ?auto_14081 ?auto_14082 ) ) ( not ( = ?auto_14076 ?auto_14082 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_14073 ?auto_14078 ?auto_14082 )
      ( GET-2IMAGE ?auto_14081 ?auto_14080 ?auto_14071 ?auto_14072 )
      ( GET-1IMAGE-VERIFY ?auto_14071 ?auto_14072 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_14083 - DIRECTION
      ?auto_14084 - MODE
      ?auto_14086 - DIRECTION
      ?auto_14085 - MODE
    )
    :vars
    (
      ?auto_14088 - INSTRUMENT
      ?auto_14093 - SATELLITE
      ?auto_14089 - DIRECTION
      ?auto_14090 - DIRECTION
      ?auto_14091 - INSTRUMENT
      ?auto_14087 - MODE
      ?auto_14092 - INSTRUMENT
      ?auto_14094 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14088 ?auto_14093 ) ( SUPPORTS ?auto_14088 ?auto_14085 ) ( not ( = ?auto_14086 ?auto_14089 ) ) ( not ( = ?auto_14083 ?auto_14086 ) ) ( not ( = ?auto_14083 ?auto_14089 ) ) ( not ( = ?auto_14084 ?auto_14085 ) ) ( CALIBRATION_TARGET ?auto_14088 ?auto_14089 ) ( not ( = ?auto_14089 ?auto_14090 ) ) ( not ( = ?auto_14086 ?auto_14090 ) ) ( not ( = ?auto_14083 ?auto_14090 ) ) ( ON_BOARD ?auto_14091 ?auto_14093 ) ( not ( = ?auto_14088 ?auto_14091 ) ) ( SUPPORTS ?auto_14091 ?auto_14087 ) ( not ( = ?auto_14084 ?auto_14087 ) ) ( not ( = ?auto_14085 ?auto_14087 ) ) ( CALIBRATION_TARGET ?auto_14091 ?auto_14089 ) ( ON_BOARD ?auto_14092 ?auto_14093 ) ( not ( = ?auto_14088 ?auto_14092 ) ) ( not ( = ?auto_14091 ?auto_14092 ) ) ( SUPPORTS ?auto_14092 ?auto_14084 ) ( CALIBRATION_TARGET ?auto_14092 ?auto_14089 ) ( POWER_AVAIL ?auto_14093 ) ( POINTING ?auto_14093 ?auto_14094 ) ( not ( = ?auto_14089 ?auto_14094 ) ) ( not ( = ?auto_14086 ?auto_14094 ) ) ( not ( = ?auto_14083 ?auto_14094 ) ) ( not ( = ?auto_14090 ?auto_14094 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_14086 ?auto_14085 )
      ( GET-2IMAGE-VERIFY ?auto_14083 ?auto_14084 ?auto_14086 ?auto_14085 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_14095 - DIRECTION
      ?auto_14096 - MODE
      ?auto_14098 - DIRECTION
      ?auto_14097 - MODE
    )
    :vars
    (
      ?auto_14100 - INSTRUMENT
      ?auto_14103 - SATELLITE
      ?auto_14102 - DIRECTION
      ?auto_14106 - DIRECTION
      ?auto_14105 - MODE
      ?auto_14099 - INSTRUMENT
      ?auto_14104 - INSTRUMENT
      ?auto_14101 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14100 ?auto_14103 ) ( SUPPORTS ?auto_14100 ?auto_14097 ) ( not ( = ?auto_14098 ?auto_14102 ) ) ( not ( = ?auto_14106 ?auto_14098 ) ) ( not ( = ?auto_14106 ?auto_14102 ) ) ( not ( = ?auto_14105 ?auto_14097 ) ) ( CALIBRATION_TARGET ?auto_14100 ?auto_14102 ) ( not ( = ?auto_14102 ?auto_14095 ) ) ( not ( = ?auto_14098 ?auto_14095 ) ) ( not ( = ?auto_14106 ?auto_14095 ) ) ( ON_BOARD ?auto_14099 ?auto_14103 ) ( not ( = ?auto_14100 ?auto_14099 ) ) ( SUPPORTS ?auto_14099 ?auto_14096 ) ( not ( = ?auto_14105 ?auto_14096 ) ) ( not ( = ?auto_14097 ?auto_14096 ) ) ( CALIBRATION_TARGET ?auto_14099 ?auto_14102 ) ( ON_BOARD ?auto_14104 ?auto_14103 ) ( not ( = ?auto_14100 ?auto_14104 ) ) ( not ( = ?auto_14099 ?auto_14104 ) ) ( SUPPORTS ?auto_14104 ?auto_14105 ) ( CALIBRATION_TARGET ?auto_14104 ?auto_14102 ) ( POWER_AVAIL ?auto_14103 ) ( POINTING ?auto_14103 ?auto_14101 ) ( not ( = ?auto_14102 ?auto_14101 ) ) ( not ( = ?auto_14098 ?auto_14101 ) ) ( not ( = ?auto_14106 ?auto_14101 ) ) ( not ( = ?auto_14095 ?auto_14101 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14106 ?auto_14105 ?auto_14098 ?auto_14097 )
      ( GET-2IMAGE-VERIFY ?auto_14095 ?auto_14096 ?auto_14098 ?auto_14097 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_14107 - DIRECTION
      ?auto_14108 - MODE
      ?auto_14110 - DIRECTION
      ?auto_14109 - MODE
    )
    :vars
    (
      ?auto_14112 - INSTRUMENT
      ?auto_14117 - SATELLITE
      ?auto_14115 - DIRECTION
      ?auto_14116 - DIRECTION
      ?auto_14111 - INSTRUMENT
      ?auto_14114 - MODE
      ?auto_14118 - INSTRUMENT
      ?auto_14113 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14112 ?auto_14117 ) ( SUPPORTS ?auto_14112 ?auto_14108 ) ( not ( = ?auto_14107 ?auto_14115 ) ) ( not ( = ?auto_14110 ?auto_14107 ) ) ( not ( = ?auto_14110 ?auto_14115 ) ) ( not ( = ?auto_14109 ?auto_14108 ) ) ( CALIBRATION_TARGET ?auto_14112 ?auto_14115 ) ( not ( = ?auto_14115 ?auto_14116 ) ) ( not ( = ?auto_14107 ?auto_14116 ) ) ( not ( = ?auto_14110 ?auto_14116 ) ) ( ON_BOARD ?auto_14111 ?auto_14117 ) ( not ( = ?auto_14112 ?auto_14111 ) ) ( SUPPORTS ?auto_14111 ?auto_14114 ) ( not ( = ?auto_14109 ?auto_14114 ) ) ( not ( = ?auto_14108 ?auto_14114 ) ) ( CALIBRATION_TARGET ?auto_14111 ?auto_14115 ) ( ON_BOARD ?auto_14118 ?auto_14117 ) ( not ( = ?auto_14112 ?auto_14118 ) ) ( not ( = ?auto_14111 ?auto_14118 ) ) ( SUPPORTS ?auto_14118 ?auto_14109 ) ( CALIBRATION_TARGET ?auto_14118 ?auto_14115 ) ( POWER_AVAIL ?auto_14117 ) ( POINTING ?auto_14117 ?auto_14113 ) ( not ( = ?auto_14115 ?auto_14113 ) ) ( not ( = ?auto_14107 ?auto_14113 ) ) ( not ( = ?auto_14110 ?auto_14113 ) ) ( not ( = ?auto_14116 ?auto_14113 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14110 ?auto_14109 ?auto_14107 ?auto_14108 )
      ( GET-2IMAGE-VERIFY ?auto_14107 ?auto_14108 ?auto_14110 ?auto_14109 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_14119 - DIRECTION
      ?auto_14120 - MODE
      ?auto_14122 - DIRECTION
      ?auto_14121 - MODE
    )
    :vars
    (
      ?auto_14124 - INSTRUMENT
      ?auto_14127 - SATELLITE
      ?auto_14126 - DIRECTION
      ?auto_14130 - DIRECTION
      ?auto_14129 - MODE
      ?auto_14123 - INSTRUMENT
      ?auto_14128 - INSTRUMENT
      ?auto_14125 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14124 ?auto_14127 ) ( SUPPORTS ?auto_14124 ?auto_14120 ) ( not ( = ?auto_14119 ?auto_14126 ) ) ( not ( = ?auto_14130 ?auto_14119 ) ) ( not ( = ?auto_14130 ?auto_14126 ) ) ( not ( = ?auto_14129 ?auto_14120 ) ) ( CALIBRATION_TARGET ?auto_14124 ?auto_14126 ) ( not ( = ?auto_14126 ?auto_14122 ) ) ( not ( = ?auto_14119 ?auto_14122 ) ) ( not ( = ?auto_14130 ?auto_14122 ) ) ( ON_BOARD ?auto_14123 ?auto_14127 ) ( not ( = ?auto_14124 ?auto_14123 ) ) ( SUPPORTS ?auto_14123 ?auto_14121 ) ( not ( = ?auto_14129 ?auto_14121 ) ) ( not ( = ?auto_14120 ?auto_14121 ) ) ( CALIBRATION_TARGET ?auto_14123 ?auto_14126 ) ( ON_BOARD ?auto_14128 ?auto_14127 ) ( not ( = ?auto_14124 ?auto_14128 ) ) ( not ( = ?auto_14123 ?auto_14128 ) ) ( SUPPORTS ?auto_14128 ?auto_14129 ) ( CALIBRATION_TARGET ?auto_14128 ?auto_14126 ) ( POWER_AVAIL ?auto_14127 ) ( POINTING ?auto_14127 ?auto_14125 ) ( not ( = ?auto_14126 ?auto_14125 ) ) ( not ( = ?auto_14119 ?auto_14125 ) ) ( not ( = ?auto_14130 ?auto_14125 ) ) ( not ( = ?auto_14122 ?auto_14125 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14130 ?auto_14129 ?auto_14119 ?auto_14120 )
      ( GET-2IMAGE-VERIFY ?auto_14119 ?auto_14120 ?auto_14122 ?auto_14121 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14159 - DIRECTION
      ?auto_14160 - MODE
      ?auto_14162 - DIRECTION
      ?auto_14161 - MODE
      ?auto_14164 - DIRECTION
      ?auto_14163 - MODE
    )
    :vars
    (
      ?auto_14166 - INSTRUMENT
      ?auto_14169 - SATELLITE
      ?auto_14168 - DIRECTION
      ?auto_14165 - INSTRUMENT
      ?auto_14170 - INSTRUMENT
      ?auto_14167 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14166 ?auto_14169 ) ( SUPPORTS ?auto_14166 ?auto_14163 ) ( not ( = ?auto_14164 ?auto_14168 ) ) ( not ( = ?auto_14159 ?auto_14164 ) ) ( not ( = ?auto_14159 ?auto_14168 ) ) ( not ( = ?auto_14160 ?auto_14163 ) ) ( CALIBRATION_TARGET ?auto_14166 ?auto_14168 ) ( not ( = ?auto_14168 ?auto_14162 ) ) ( not ( = ?auto_14164 ?auto_14162 ) ) ( not ( = ?auto_14159 ?auto_14162 ) ) ( ON_BOARD ?auto_14165 ?auto_14169 ) ( not ( = ?auto_14166 ?auto_14165 ) ) ( SUPPORTS ?auto_14165 ?auto_14161 ) ( not ( = ?auto_14160 ?auto_14161 ) ) ( not ( = ?auto_14163 ?auto_14161 ) ) ( CALIBRATION_TARGET ?auto_14165 ?auto_14168 ) ( ON_BOARD ?auto_14170 ?auto_14169 ) ( not ( = ?auto_14166 ?auto_14170 ) ) ( not ( = ?auto_14165 ?auto_14170 ) ) ( SUPPORTS ?auto_14170 ?auto_14160 ) ( CALIBRATION_TARGET ?auto_14170 ?auto_14168 ) ( POWER_AVAIL ?auto_14169 ) ( POINTING ?auto_14169 ?auto_14167 ) ( not ( = ?auto_14168 ?auto_14167 ) ) ( not ( = ?auto_14164 ?auto_14167 ) ) ( not ( = ?auto_14159 ?auto_14167 ) ) ( not ( = ?auto_14162 ?auto_14167 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14159 ?auto_14160 ?auto_14164 ?auto_14163 )
      ( GET-3IMAGE-VERIFY ?auto_14159 ?auto_14160 ?auto_14162 ?auto_14161 ?auto_14164 ?auto_14163 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14185 - DIRECTION
      ?auto_14186 - MODE
      ?auto_14188 - DIRECTION
      ?auto_14187 - MODE
      ?auto_14190 - DIRECTION
      ?auto_14189 - MODE
    )
    :vars
    (
      ?auto_14192 - INSTRUMENT
      ?auto_14195 - SATELLITE
      ?auto_14194 - DIRECTION
      ?auto_14191 - INSTRUMENT
      ?auto_14196 - INSTRUMENT
      ?auto_14193 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14192 ?auto_14195 ) ( SUPPORTS ?auto_14192 ?auto_14187 ) ( not ( = ?auto_14188 ?auto_14194 ) ) ( not ( = ?auto_14185 ?auto_14188 ) ) ( not ( = ?auto_14185 ?auto_14194 ) ) ( not ( = ?auto_14186 ?auto_14187 ) ) ( CALIBRATION_TARGET ?auto_14192 ?auto_14194 ) ( not ( = ?auto_14194 ?auto_14190 ) ) ( not ( = ?auto_14188 ?auto_14190 ) ) ( not ( = ?auto_14185 ?auto_14190 ) ) ( ON_BOARD ?auto_14191 ?auto_14195 ) ( not ( = ?auto_14192 ?auto_14191 ) ) ( SUPPORTS ?auto_14191 ?auto_14189 ) ( not ( = ?auto_14186 ?auto_14189 ) ) ( not ( = ?auto_14187 ?auto_14189 ) ) ( CALIBRATION_TARGET ?auto_14191 ?auto_14194 ) ( ON_BOARD ?auto_14196 ?auto_14195 ) ( not ( = ?auto_14192 ?auto_14196 ) ) ( not ( = ?auto_14191 ?auto_14196 ) ) ( SUPPORTS ?auto_14196 ?auto_14186 ) ( CALIBRATION_TARGET ?auto_14196 ?auto_14194 ) ( POWER_AVAIL ?auto_14195 ) ( POINTING ?auto_14195 ?auto_14193 ) ( not ( = ?auto_14194 ?auto_14193 ) ) ( not ( = ?auto_14188 ?auto_14193 ) ) ( not ( = ?auto_14185 ?auto_14193 ) ) ( not ( = ?auto_14190 ?auto_14193 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14185 ?auto_14186 ?auto_14188 ?auto_14187 )
      ( GET-3IMAGE-VERIFY ?auto_14185 ?auto_14186 ?auto_14188 ?auto_14187 ?auto_14190 ?auto_14189 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14211 - DIRECTION
      ?auto_14212 - MODE
      ?auto_14214 - DIRECTION
      ?auto_14213 - MODE
      ?auto_14216 - DIRECTION
      ?auto_14215 - MODE
    )
    :vars
    (
      ?auto_14218 - INSTRUMENT
      ?auto_14221 - SATELLITE
      ?auto_14220 - DIRECTION
      ?auto_14217 - INSTRUMENT
      ?auto_14222 - INSTRUMENT
      ?auto_14219 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14218 ?auto_14221 ) ( SUPPORTS ?auto_14218 ?auto_14215 ) ( not ( = ?auto_14216 ?auto_14220 ) ) ( not ( = ?auto_14214 ?auto_14216 ) ) ( not ( = ?auto_14214 ?auto_14220 ) ) ( not ( = ?auto_14213 ?auto_14215 ) ) ( CALIBRATION_TARGET ?auto_14218 ?auto_14220 ) ( not ( = ?auto_14220 ?auto_14211 ) ) ( not ( = ?auto_14216 ?auto_14211 ) ) ( not ( = ?auto_14214 ?auto_14211 ) ) ( ON_BOARD ?auto_14217 ?auto_14221 ) ( not ( = ?auto_14218 ?auto_14217 ) ) ( SUPPORTS ?auto_14217 ?auto_14212 ) ( not ( = ?auto_14213 ?auto_14212 ) ) ( not ( = ?auto_14215 ?auto_14212 ) ) ( CALIBRATION_TARGET ?auto_14217 ?auto_14220 ) ( ON_BOARD ?auto_14222 ?auto_14221 ) ( not ( = ?auto_14218 ?auto_14222 ) ) ( not ( = ?auto_14217 ?auto_14222 ) ) ( SUPPORTS ?auto_14222 ?auto_14213 ) ( CALIBRATION_TARGET ?auto_14222 ?auto_14220 ) ( POWER_AVAIL ?auto_14221 ) ( POINTING ?auto_14221 ?auto_14219 ) ( not ( = ?auto_14220 ?auto_14219 ) ) ( not ( = ?auto_14216 ?auto_14219 ) ) ( not ( = ?auto_14214 ?auto_14219 ) ) ( not ( = ?auto_14211 ?auto_14219 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14214 ?auto_14213 ?auto_14216 ?auto_14215 )
      ( GET-3IMAGE-VERIFY ?auto_14211 ?auto_14212 ?auto_14214 ?auto_14213 ?auto_14216 ?auto_14215 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14237 - DIRECTION
      ?auto_14238 - MODE
      ?auto_14240 - DIRECTION
      ?auto_14239 - MODE
      ?auto_14242 - DIRECTION
      ?auto_14241 - MODE
    )
    :vars
    (
      ?auto_14244 - INSTRUMENT
      ?auto_14247 - SATELLITE
      ?auto_14246 - DIRECTION
      ?auto_14243 - INSTRUMENT
      ?auto_14248 - INSTRUMENT
      ?auto_14245 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14244 ?auto_14247 ) ( SUPPORTS ?auto_14244 ?auto_14239 ) ( not ( = ?auto_14240 ?auto_14246 ) ) ( not ( = ?auto_14242 ?auto_14240 ) ) ( not ( = ?auto_14242 ?auto_14246 ) ) ( not ( = ?auto_14241 ?auto_14239 ) ) ( CALIBRATION_TARGET ?auto_14244 ?auto_14246 ) ( not ( = ?auto_14246 ?auto_14237 ) ) ( not ( = ?auto_14240 ?auto_14237 ) ) ( not ( = ?auto_14242 ?auto_14237 ) ) ( ON_BOARD ?auto_14243 ?auto_14247 ) ( not ( = ?auto_14244 ?auto_14243 ) ) ( SUPPORTS ?auto_14243 ?auto_14238 ) ( not ( = ?auto_14241 ?auto_14238 ) ) ( not ( = ?auto_14239 ?auto_14238 ) ) ( CALIBRATION_TARGET ?auto_14243 ?auto_14246 ) ( ON_BOARD ?auto_14248 ?auto_14247 ) ( not ( = ?auto_14244 ?auto_14248 ) ) ( not ( = ?auto_14243 ?auto_14248 ) ) ( SUPPORTS ?auto_14248 ?auto_14241 ) ( CALIBRATION_TARGET ?auto_14248 ?auto_14246 ) ( POWER_AVAIL ?auto_14247 ) ( POINTING ?auto_14247 ?auto_14245 ) ( not ( = ?auto_14246 ?auto_14245 ) ) ( not ( = ?auto_14240 ?auto_14245 ) ) ( not ( = ?auto_14242 ?auto_14245 ) ) ( not ( = ?auto_14237 ?auto_14245 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14242 ?auto_14241 ?auto_14240 ?auto_14239 )
      ( GET-3IMAGE-VERIFY ?auto_14237 ?auto_14238 ?auto_14240 ?auto_14239 ?auto_14242 ?auto_14241 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14291 - DIRECTION
      ?auto_14292 - MODE
      ?auto_14294 - DIRECTION
      ?auto_14293 - MODE
      ?auto_14296 - DIRECTION
      ?auto_14295 - MODE
    )
    :vars
    (
      ?auto_14298 - INSTRUMENT
      ?auto_14301 - SATELLITE
      ?auto_14300 - DIRECTION
      ?auto_14297 - INSTRUMENT
      ?auto_14302 - INSTRUMENT
      ?auto_14299 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14298 ?auto_14301 ) ( SUPPORTS ?auto_14298 ?auto_14292 ) ( not ( = ?auto_14291 ?auto_14300 ) ) ( not ( = ?auto_14294 ?auto_14291 ) ) ( not ( = ?auto_14294 ?auto_14300 ) ) ( not ( = ?auto_14293 ?auto_14292 ) ) ( CALIBRATION_TARGET ?auto_14298 ?auto_14300 ) ( not ( = ?auto_14300 ?auto_14296 ) ) ( not ( = ?auto_14291 ?auto_14296 ) ) ( not ( = ?auto_14294 ?auto_14296 ) ) ( ON_BOARD ?auto_14297 ?auto_14301 ) ( not ( = ?auto_14298 ?auto_14297 ) ) ( SUPPORTS ?auto_14297 ?auto_14295 ) ( not ( = ?auto_14293 ?auto_14295 ) ) ( not ( = ?auto_14292 ?auto_14295 ) ) ( CALIBRATION_TARGET ?auto_14297 ?auto_14300 ) ( ON_BOARD ?auto_14302 ?auto_14301 ) ( not ( = ?auto_14298 ?auto_14302 ) ) ( not ( = ?auto_14297 ?auto_14302 ) ) ( SUPPORTS ?auto_14302 ?auto_14293 ) ( CALIBRATION_TARGET ?auto_14302 ?auto_14300 ) ( POWER_AVAIL ?auto_14301 ) ( POINTING ?auto_14301 ?auto_14299 ) ( not ( = ?auto_14300 ?auto_14299 ) ) ( not ( = ?auto_14291 ?auto_14299 ) ) ( not ( = ?auto_14294 ?auto_14299 ) ) ( not ( = ?auto_14296 ?auto_14299 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14294 ?auto_14293 ?auto_14291 ?auto_14292 )
      ( GET-3IMAGE-VERIFY ?auto_14291 ?auto_14292 ?auto_14294 ?auto_14293 ?auto_14296 ?auto_14295 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14317 - DIRECTION
      ?auto_14318 - MODE
      ?auto_14320 - DIRECTION
      ?auto_14319 - MODE
      ?auto_14322 - DIRECTION
      ?auto_14321 - MODE
    )
    :vars
    (
      ?auto_14324 - INSTRUMENT
      ?auto_14327 - SATELLITE
      ?auto_14326 - DIRECTION
      ?auto_14323 - INSTRUMENT
      ?auto_14328 - INSTRUMENT
      ?auto_14325 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14324 ?auto_14327 ) ( SUPPORTS ?auto_14324 ?auto_14318 ) ( not ( = ?auto_14317 ?auto_14326 ) ) ( not ( = ?auto_14322 ?auto_14317 ) ) ( not ( = ?auto_14322 ?auto_14326 ) ) ( not ( = ?auto_14321 ?auto_14318 ) ) ( CALIBRATION_TARGET ?auto_14324 ?auto_14326 ) ( not ( = ?auto_14326 ?auto_14320 ) ) ( not ( = ?auto_14317 ?auto_14320 ) ) ( not ( = ?auto_14322 ?auto_14320 ) ) ( ON_BOARD ?auto_14323 ?auto_14327 ) ( not ( = ?auto_14324 ?auto_14323 ) ) ( SUPPORTS ?auto_14323 ?auto_14319 ) ( not ( = ?auto_14321 ?auto_14319 ) ) ( not ( = ?auto_14318 ?auto_14319 ) ) ( CALIBRATION_TARGET ?auto_14323 ?auto_14326 ) ( ON_BOARD ?auto_14328 ?auto_14327 ) ( not ( = ?auto_14324 ?auto_14328 ) ) ( not ( = ?auto_14323 ?auto_14328 ) ) ( SUPPORTS ?auto_14328 ?auto_14321 ) ( CALIBRATION_TARGET ?auto_14328 ?auto_14326 ) ( POWER_AVAIL ?auto_14327 ) ( POINTING ?auto_14327 ?auto_14325 ) ( not ( = ?auto_14326 ?auto_14325 ) ) ( not ( = ?auto_14317 ?auto_14325 ) ) ( not ( = ?auto_14322 ?auto_14325 ) ) ( not ( = ?auto_14320 ?auto_14325 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14322 ?auto_14321 ?auto_14317 ?auto_14318 )
      ( GET-3IMAGE-VERIFY ?auto_14317 ?auto_14318 ?auto_14320 ?auto_14319 ?auto_14322 ?auto_14321 ) )
  )

)

