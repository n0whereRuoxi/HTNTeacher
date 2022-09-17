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
      ?auto_8391 - INSTRUMENT
      ?auto_8393 - SATELLITE
      ?auto_8392 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8391 ?auto_8393 ) ( SUPPORTS ?auto_8391 ?auto_8390 ) ( POWER_ON ?auto_8391 ) ( POINTING ?auto_8393 ?auto_8392 ) ( not ( = ?auto_8389 ?auto_8392 ) ) ( CALIBRATION_TARGET ?auto_8391 ?auto_8392 ) ( NOT_CALIBRATED ?auto_8391 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_8393 ?auto_8391 ?auto_8392 )
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
      ?auto_8413 - SATELLITE
      ?auto_8412 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8414 ?auto_8413 ) ( SUPPORTS ?auto_8414 ?auto_8411 ) ( POINTING ?auto_8413 ?auto_8412 ) ( not ( = ?auto_8410 ?auto_8412 ) ) ( CALIBRATION_TARGET ?auto_8414 ?auto_8412 ) ( POWER_AVAIL ?auto_8413 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_8414 ?auto_8413 )
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
      ?auto_8434 - INSTRUMENT
      ?auto_8433 - SATELLITE
      ?auto_8435 - DIRECTION
      ?auto_8436 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_8434 ?auto_8433 ) ( SUPPORTS ?auto_8434 ?auto_8432 ) ( not ( = ?auto_8431 ?auto_8435 ) ) ( CALIBRATION_TARGET ?auto_8434 ?auto_8435 ) ( POWER_AVAIL ?auto_8433 ) ( POINTING ?auto_8433 ?auto_8436 ) ( not ( = ?auto_8435 ?auto_8436 ) ) ( not ( = ?auto_8431 ?auto_8436 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_8433 ?auto_8435 ?auto_8436 )
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
      ?auto_8520 - INSTRUMENT
      ?auto_8519 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_8518 ?auto_8515 ) ) ( CALIBRATED ?auto_8520 ) ( ON_BOARD ?auto_8520 ?auto_8519 ) ( SUPPORTS ?auto_8520 ?auto_8517 ) ( POWER_ON ?auto_8520 ) ( POINTING ?auto_8519 ?auto_8518 ) ( HAVE_IMAGE ?auto_8515 ?auto_8516 ) ( not ( = ?auto_8516 ?auto_8517 ) ) )
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
      ?auto_8526 - INSTRUMENT
      ?auto_8525 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_8524 ?auto_8521 ) ) ( CALIBRATED ?auto_8526 ) ( ON_BOARD ?auto_8526 ?auto_8525 ) ( SUPPORTS ?auto_8526 ?auto_8522 ) ( POWER_ON ?auto_8526 ) ( POINTING ?auto_8525 ?auto_8521 ) ( HAVE_IMAGE ?auto_8524 ?auto_8523 ) ( not ( = ?auto_8522 ?auto_8523 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_8521 ?auto_8522 )
      ( GET-2IMAGE-VERIFY ?auto_8521 ?auto_8522 ?auto_8524 ?auto_8523 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8589 - DIRECTION
      ?auto_8590 - MODE
    )
    :vars
    (
      ?auto_8592 - INSTRUMENT
      ?auto_8591 - SATELLITE
      ?auto_8593 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_8592 ) ( ON_BOARD ?auto_8592 ?auto_8591 ) ( SUPPORTS ?auto_8592 ?auto_8590 ) ( POWER_ON ?auto_8592 ) ( POINTING ?auto_8591 ?auto_8593 ) ( not ( = ?auto_8589 ?auto_8593 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_8591 ?auto_8589 ?auto_8593 )
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
      ?auto_8599 - INSTRUMENT
      ?auto_8598 - SATELLITE
      ?auto_8600 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_8597 ?auto_8594 ) ) ( CALIBRATED ?auto_8599 ) ( ON_BOARD ?auto_8599 ?auto_8598 ) ( SUPPORTS ?auto_8599 ?auto_8596 ) ( POWER_ON ?auto_8599 ) ( POINTING ?auto_8598 ?auto_8600 ) ( not ( = ?auto_8597 ?auto_8600 ) ) ( HAVE_IMAGE ?auto_8594 ?auto_8595 ) ( not ( = ?auto_8594 ?auto_8600 ) ) ( not ( = ?auto_8595 ?auto_8596 ) ) )
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
      ?auto_8607 - INSTRUMENT
      ?auto_8606 - SATELLITE
      ?auto_8605 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_8604 ?auto_8601 ) ) ( CALIBRATED ?auto_8607 ) ( ON_BOARD ?auto_8607 ?auto_8606 ) ( SUPPORTS ?auto_8607 ?auto_8602 ) ( POWER_ON ?auto_8607 ) ( POINTING ?auto_8606 ?auto_8605 ) ( not ( = ?auto_8601 ?auto_8605 ) ) ( HAVE_IMAGE ?auto_8604 ?auto_8603 ) ( not ( = ?auto_8604 ?auto_8605 ) ) ( not ( = ?auto_8603 ?auto_8602 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8604 ?auto_8603 ?auto_8601 ?auto_8602 )
      ( GET-2IMAGE-VERIFY ?auto_8601 ?auto_8602 ?auto_8604 ?auto_8603 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8682 - DIRECTION
      ?auto_8683 - MODE
    )
    :vars
    (
      ?auto_8687 - DIRECTION
      ?auto_8688 - INSTRUMENT
      ?auto_8686 - SATELLITE
      ?auto_8685 - DIRECTION
      ?auto_8684 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_8682 ?auto_8687 ) ) ( ON_BOARD ?auto_8688 ?auto_8686 ) ( SUPPORTS ?auto_8688 ?auto_8683 ) ( POWER_ON ?auto_8688 ) ( POINTING ?auto_8686 ?auto_8685 ) ( not ( = ?auto_8682 ?auto_8685 ) ) ( HAVE_IMAGE ?auto_8687 ?auto_8684 ) ( not ( = ?auto_8687 ?auto_8685 ) ) ( not ( = ?auto_8684 ?auto_8683 ) ) ( CALIBRATION_TARGET ?auto_8688 ?auto_8685 ) ( NOT_CALIBRATED ?auto_8688 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_8686 ?auto_8688 ?auto_8685 )
      ( GET-2IMAGE ?auto_8687 ?auto_8684 ?auto_8682 ?auto_8683 )
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
      ?auto_8694 - INSTRUMENT
      ?auto_8693 - SATELLITE
      ?auto_8695 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_8692 ?auto_8689 ) ) ( ON_BOARD ?auto_8694 ?auto_8693 ) ( SUPPORTS ?auto_8694 ?auto_8691 ) ( POWER_ON ?auto_8694 ) ( POINTING ?auto_8693 ?auto_8695 ) ( not ( = ?auto_8692 ?auto_8695 ) ) ( HAVE_IMAGE ?auto_8689 ?auto_8690 ) ( not ( = ?auto_8689 ?auto_8695 ) ) ( not ( = ?auto_8690 ?auto_8691 ) ) ( CALIBRATION_TARGET ?auto_8694 ?auto_8695 ) ( NOT_CALIBRATED ?auto_8694 ) )
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
      ?auto_8701 - INSTRUMENT
      ?auto_8700 - SATELLITE
      ?auto_8702 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_8699 ?auto_8696 ) ) ( ON_BOARD ?auto_8701 ?auto_8700 ) ( SUPPORTS ?auto_8701 ?auto_8697 ) ( POWER_ON ?auto_8701 ) ( POINTING ?auto_8700 ?auto_8702 ) ( not ( = ?auto_8696 ?auto_8702 ) ) ( HAVE_IMAGE ?auto_8699 ?auto_8698 ) ( not ( = ?auto_8699 ?auto_8702 ) ) ( not ( = ?auto_8698 ?auto_8697 ) ) ( CALIBRATION_TARGET ?auto_8701 ?auto_8702 ) ( NOT_CALIBRATED ?auto_8701 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8699 ?auto_8698 ?auto_8696 ?auto_8697 )
      ( GET-2IMAGE-VERIFY ?auto_8696 ?auto_8697 ?auto_8699 ?auto_8698 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8777 - DIRECTION
      ?auto_8778 - MODE
    )
    :vars
    (
      ?auto_8780 - DIRECTION
      ?auto_8782 - INSTRUMENT
      ?auto_8781 - SATELLITE
      ?auto_8783 - DIRECTION
      ?auto_8779 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_8777 ?auto_8780 ) ) ( ON_BOARD ?auto_8782 ?auto_8781 ) ( SUPPORTS ?auto_8782 ?auto_8778 ) ( POINTING ?auto_8781 ?auto_8783 ) ( not ( = ?auto_8777 ?auto_8783 ) ) ( HAVE_IMAGE ?auto_8780 ?auto_8779 ) ( not ( = ?auto_8780 ?auto_8783 ) ) ( not ( = ?auto_8779 ?auto_8778 ) ) ( CALIBRATION_TARGET ?auto_8782 ?auto_8783 ) ( POWER_AVAIL ?auto_8781 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_8782 ?auto_8781 )
      ( GET-2IMAGE ?auto_8780 ?auto_8779 ?auto_8777 ?auto_8778 )
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
      ?auto_8788 - INSTRUMENT
      ?auto_8790 - SATELLITE
      ?auto_8789 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_8787 ?auto_8784 ) ) ( ON_BOARD ?auto_8788 ?auto_8790 ) ( SUPPORTS ?auto_8788 ?auto_8786 ) ( POINTING ?auto_8790 ?auto_8789 ) ( not ( = ?auto_8787 ?auto_8789 ) ) ( HAVE_IMAGE ?auto_8784 ?auto_8785 ) ( not ( = ?auto_8784 ?auto_8789 ) ) ( not ( = ?auto_8785 ?auto_8786 ) ) ( CALIBRATION_TARGET ?auto_8788 ?auto_8789 ) ( POWER_AVAIL ?auto_8790 ) )
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
      ?auto_8796 - INSTRUMENT
      ?auto_8795 - SATELLITE
      ?auto_8797 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_8794 ?auto_8791 ) ) ( ON_BOARD ?auto_8796 ?auto_8795 ) ( SUPPORTS ?auto_8796 ?auto_8792 ) ( POINTING ?auto_8795 ?auto_8797 ) ( not ( = ?auto_8791 ?auto_8797 ) ) ( HAVE_IMAGE ?auto_8794 ?auto_8793 ) ( not ( = ?auto_8794 ?auto_8797 ) ) ( not ( = ?auto_8793 ?auto_8792 ) ) ( CALIBRATION_TARGET ?auto_8796 ?auto_8797 ) ( POWER_AVAIL ?auto_8795 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8794 ?auto_8793 ?auto_8791 ?auto_8792 )
      ( GET-2IMAGE-VERIFY ?auto_8791 ?auto_8792 ?auto_8794 ?auto_8793 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8872 - DIRECTION
      ?auto_8873 - MODE
    )
    :vars
    (
      ?auto_8878 - DIRECTION
      ?auto_8875 - INSTRUMENT
      ?auto_8874 - SATELLITE
      ?auto_8877 - DIRECTION
      ?auto_8876 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_8872 ?auto_8878 ) ) ( ON_BOARD ?auto_8875 ?auto_8874 ) ( SUPPORTS ?auto_8875 ?auto_8873 ) ( not ( = ?auto_8872 ?auto_8877 ) ) ( HAVE_IMAGE ?auto_8878 ?auto_8876 ) ( not ( = ?auto_8878 ?auto_8877 ) ) ( not ( = ?auto_8876 ?auto_8873 ) ) ( CALIBRATION_TARGET ?auto_8875 ?auto_8877 ) ( POWER_AVAIL ?auto_8874 ) ( POINTING ?auto_8874 ?auto_8878 ) )
    :subtasks
    ( ( !TURN_TO ?auto_8874 ?auto_8877 ?auto_8878 )
      ( GET-2IMAGE ?auto_8878 ?auto_8876 ?auto_8872 ?auto_8873 )
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
      ?auto_8885 - INSTRUMENT
      ?auto_8883 - SATELLITE
      ?auto_8884 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_8882 ?auto_8879 ) ) ( ON_BOARD ?auto_8885 ?auto_8883 ) ( SUPPORTS ?auto_8885 ?auto_8881 ) ( not ( = ?auto_8882 ?auto_8884 ) ) ( HAVE_IMAGE ?auto_8879 ?auto_8880 ) ( not ( = ?auto_8879 ?auto_8884 ) ) ( not ( = ?auto_8880 ?auto_8881 ) ) ( CALIBRATION_TARGET ?auto_8885 ?auto_8884 ) ( POWER_AVAIL ?auto_8883 ) ( POINTING ?auto_8883 ?auto_8879 ) )
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
      ?auto_8891 - INSTRUMENT
      ?auto_8890 - SATELLITE
      ?auto_8892 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_8889 ?auto_8886 ) ) ( ON_BOARD ?auto_8891 ?auto_8890 ) ( SUPPORTS ?auto_8891 ?auto_8887 ) ( not ( = ?auto_8886 ?auto_8892 ) ) ( HAVE_IMAGE ?auto_8889 ?auto_8888 ) ( not ( = ?auto_8889 ?auto_8892 ) ) ( not ( = ?auto_8888 ?auto_8887 ) ) ( CALIBRATION_TARGET ?auto_8891 ?auto_8892 ) ( POWER_AVAIL ?auto_8890 ) ( POINTING ?auto_8890 ?auto_8889 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8889 ?auto_8888 ?auto_8886 ?auto_8887 )
      ( GET-2IMAGE-VERIFY ?auto_8886 ?auto_8887 ?auto_8889 ?auto_8888 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_8967 - DIRECTION
      ?auto_8968 - MODE
    )
    :vars
    (
      ?auto_8969 - DIRECTION
      ?auto_8972 - INSTRUMENT
      ?auto_8971 - SATELLITE
      ?auto_8973 - DIRECTION
      ?auto_8970 - MODE
      ?auto_8974 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_8967 ?auto_8969 ) ) ( ON_BOARD ?auto_8972 ?auto_8971 ) ( SUPPORTS ?auto_8972 ?auto_8968 ) ( not ( = ?auto_8967 ?auto_8973 ) ) ( HAVE_IMAGE ?auto_8969 ?auto_8970 ) ( not ( = ?auto_8969 ?auto_8973 ) ) ( not ( = ?auto_8970 ?auto_8968 ) ) ( CALIBRATION_TARGET ?auto_8972 ?auto_8973 ) ( POINTING ?auto_8971 ?auto_8969 ) ( ON_BOARD ?auto_8974 ?auto_8971 ) ( POWER_ON ?auto_8974 ) ( not ( = ?auto_8972 ?auto_8974 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_8974 ?auto_8971 )
      ( GET-2IMAGE ?auto_8969 ?auto_8970 ?auto_8967 ?auto_8968 )
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
      ?auto_8981 - INSTRUMENT
      ?auto_8980 - SATELLITE
      ?auto_8979 - DIRECTION
      ?auto_8982 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_8978 ?auto_8975 ) ) ( ON_BOARD ?auto_8981 ?auto_8980 ) ( SUPPORTS ?auto_8981 ?auto_8977 ) ( not ( = ?auto_8978 ?auto_8979 ) ) ( HAVE_IMAGE ?auto_8975 ?auto_8976 ) ( not ( = ?auto_8975 ?auto_8979 ) ) ( not ( = ?auto_8976 ?auto_8977 ) ) ( CALIBRATION_TARGET ?auto_8981 ?auto_8979 ) ( POINTING ?auto_8980 ?auto_8975 ) ( ON_BOARD ?auto_8982 ?auto_8980 ) ( POWER_ON ?auto_8982 ) ( not ( = ?auto_8981 ?auto_8982 ) ) )
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
      ?auto_8988 - INSTRUMENT
      ?auto_8989 - SATELLITE
      ?auto_8990 - DIRECTION
      ?auto_8987 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_8986 ?auto_8983 ) ) ( ON_BOARD ?auto_8988 ?auto_8989 ) ( SUPPORTS ?auto_8988 ?auto_8984 ) ( not ( = ?auto_8983 ?auto_8990 ) ) ( HAVE_IMAGE ?auto_8986 ?auto_8985 ) ( not ( = ?auto_8986 ?auto_8990 ) ) ( not ( = ?auto_8985 ?auto_8984 ) ) ( CALIBRATION_TARGET ?auto_8988 ?auto_8990 ) ( POINTING ?auto_8989 ?auto_8986 ) ( ON_BOARD ?auto_8987 ?auto_8989 ) ( POWER_ON ?auto_8987 ) ( not ( = ?auto_8988 ?auto_8987 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_8986 ?auto_8985 ?auto_8983 ?auto_8984 )
      ( GET-2IMAGE-VERIFY ?auto_8983 ?auto_8984 ?auto_8986 ?auto_8985 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_9073 - DIRECTION
      ?auto_9074 - MODE
    )
    :vars
    (
      ?auto_9076 - DIRECTION
      ?auto_9078 - INSTRUMENT
      ?auto_9079 - SATELLITE
      ?auto_9080 - DIRECTION
      ?auto_9077 - MODE
      ?auto_9075 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_9073 ?auto_9076 ) ) ( ON_BOARD ?auto_9078 ?auto_9079 ) ( SUPPORTS ?auto_9078 ?auto_9074 ) ( not ( = ?auto_9073 ?auto_9080 ) ) ( not ( = ?auto_9076 ?auto_9080 ) ) ( not ( = ?auto_9077 ?auto_9074 ) ) ( CALIBRATION_TARGET ?auto_9078 ?auto_9080 ) ( POINTING ?auto_9079 ?auto_9076 ) ( ON_BOARD ?auto_9075 ?auto_9079 ) ( POWER_ON ?auto_9075 ) ( not ( = ?auto_9078 ?auto_9075 ) ) ( CALIBRATED ?auto_9075 ) ( SUPPORTS ?auto_9075 ?auto_9077 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9076 ?auto_9077 )
      ( GET-2IMAGE ?auto_9076 ?auto_9077 ?auto_9073 ?auto_9074 )
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
      ?auto_9085 - INSTRUMENT
      ?auto_9088 - SATELLITE
      ?auto_9086 - DIRECTION
      ?auto_9087 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_9084 ?auto_9081 ) ) ( ON_BOARD ?auto_9085 ?auto_9088 ) ( SUPPORTS ?auto_9085 ?auto_9083 ) ( not ( = ?auto_9084 ?auto_9086 ) ) ( not ( = ?auto_9081 ?auto_9086 ) ) ( not ( = ?auto_9082 ?auto_9083 ) ) ( CALIBRATION_TARGET ?auto_9085 ?auto_9086 ) ( POINTING ?auto_9088 ?auto_9081 ) ( ON_BOARD ?auto_9087 ?auto_9088 ) ( POWER_ON ?auto_9087 ) ( not ( = ?auto_9085 ?auto_9087 ) ) ( CALIBRATED ?auto_9087 ) ( SUPPORTS ?auto_9087 ?auto_9082 ) )
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
      ?auto_9096 - INSTRUMENT
      ?auto_9095 - SATELLITE
      ?auto_9094 - DIRECTION
      ?auto_9093 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_9092 ?auto_9089 ) ) ( ON_BOARD ?auto_9096 ?auto_9095 ) ( SUPPORTS ?auto_9096 ?auto_9090 ) ( not ( = ?auto_9089 ?auto_9094 ) ) ( not ( = ?auto_9092 ?auto_9094 ) ) ( not ( = ?auto_9091 ?auto_9090 ) ) ( CALIBRATION_TARGET ?auto_9096 ?auto_9094 ) ( POINTING ?auto_9095 ?auto_9092 ) ( ON_BOARD ?auto_9093 ?auto_9095 ) ( POWER_ON ?auto_9093 ) ( not ( = ?auto_9096 ?auto_9093 ) ) ( CALIBRATED ?auto_9093 ) ( SUPPORTS ?auto_9093 ?auto_9091 ) )
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
      ?auto_9186 - DIRECTION
      ?auto_9184 - INSTRUMENT
      ?auto_9183 - SATELLITE
      ?auto_9182 - DIRECTION
      ?auto_9185 - MODE
      ?auto_9181 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_9179 ?auto_9186 ) ) ( ON_BOARD ?auto_9184 ?auto_9183 ) ( SUPPORTS ?auto_9184 ?auto_9180 ) ( not ( = ?auto_9179 ?auto_9182 ) ) ( not ( = ?auto_9186 ?auto_9182 ) ) ( not ( = ?auto_9185 ?auto_9180 ) ) ( CALIBRATION_TARGET ?auto_9184 ?auto_9182 ) ( ON_BOARD ?auto_9181 ?auto_9183 ) ( POWER_ON ?auto_9181 ) ( not ( = ?auto_9184 ?auto_9181 ) ) ( CALIBRATED ?auto_9181 ) ( SUPPORTS ?auto_9181 ?auto_9185 ) ( POINTING ?auto_9183 ?auto_9182 ) )
    :subtasks
    ( ( !TURN_TO ?auto_9183 ?auto_9186 ?auto_9182 )
      ( GET-2IMAGE ?auto_9186 ?auto_9185 ?auto_9179 ?auto_9180 )
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
      ?auto_9191 - INSTRUMENT
      ?auto_9194 - SATELLITE
      ?auto_9192 - DIRECTION
      ?auto_9193 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_9190 ?auto_9187 ) ) ( ON_BOARD ?auto_9191 ?auto_9194 ) ( SUPPORTS ?auto_9191 ?auto_9189 ) ( not ( = ?auto_9190 ?auto_9192 ) ) ( not ( = ?auto_9187 ?auto_9192 ) ) ( not ( = ?auto_9188 ?auto_9189 ) ) ( CALIBRATION_TARGET ?auto_9191 ?auto_9192 ) ( ON_BOARD ?auto_9193 ?auto_9194 ) ( POWER_ON ?auto_9193 ) ( not ( = ?auto_9191 ?auto_9193 ) ) ( CALIBRATED ?auto_9193 ) ( SUPPORTS ?auto_9193 ?auto_9188 ) ( POINTING ?auto_9194 ?auto_9192 ) )
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
      ?auto_9202 - INSTRUMENT
      ?auto_9199 - SATELLITE
      ?auto_9201 - DIRECTION
      ?auto_9200 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_9198 ?auto_9195 ) ) ( ON_BOARD ?auto_9202 ?auto_9199 ) ( SUPPORTS ?auto_9202 ?auto_9196 ) ( not ( = ?auto_9195 ?auto_9201 ) ) ( not ( = ?auto_9198 ?auto_9201 ) ) ( not ( = ?auto_9197 ?auto_9196 ) ) ( CALIBRATION_TARGET ?auto_9202 ?auto_9201 ) ( ON_BOARD ?auto_9200 ?auto_9199 ) ( POWER_ON ?auto_9200 ) ( not ( = ?auto_9202 ?auto_9200 ) ) ( CALIBRATED ?auto_9200 ) ( SUPPORTS ?auto_9200 ?auto_9197 ) ( POINTING ?auto_9199 ?auto_9201 ) )
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
      ?auto_9288 - DIRECTION
      ?auto_9292 - INSTRUMENT
      ?auto_9287 - SATELLITE
      ?auto_9291 - DIRECTION
      ?auto_9289 - MODE
      ?auto_9290 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_9285 ?auto_9288 ) ) ( ON_BOARD ?auto_9292 ?auto_9287 ) ( SUPPORTS ?auto_9292 ?auto_9286 ) ( not ( = ?auto_9285 ?auto_9291 ) ) ( not ( = ?auto_9288 ?auto_9291 ) ) ( not ( = ?auto_9289 ?auto_9286 ) ) ( CALIBRATION_TARGET ?auto_9292 ?auto_9291 ) ( ON_BOARD ?auto_9290 ?auto_9287 ) ( POWER_ON ?auto_9290 ) ( not ( = ?auto_9292 ?auto_9290 ) ) ( SUPPORTS ?auto_9290 ?auto_9289 ) ( POINTING ?auto_9287 ?auto_9291 ) ( CALIBRATION_TARGET ?auto_9290 ?auto_9291 ) ( NOT_CALIBRATED ?auto_9290 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_9287 ?auto_9290 ?auto_9291 )
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
      ?auto_9298 - INSTRUMENT
      ?auto_9299 - SATELLITE
      ?auto_9297 - DIRECTION
      ?auto_9300 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_9296 ?auto_9293 ) ) ( ON_BOARD ?auto_9298 ?auto_9299 ) ( SUPPORTS ?auto_9298 ?auto_9295 ) ( not ( = ?auto_9296 ?auto_9297 ) ) ( not ( = ?auto_9293 ?auto_9297 ) ) ( not ( = ?auto_9294 ?auto_9295 ) ) ( CALIBRATION_TARGET ?auto_9298 ?auto_9297 ) ( ON_BOARD ?auto_9300 ?auto_9299 ) ( POWER_ON ?auto_9300 ) ( not ( = ?auto_9298 ?auto_9300 ) ) ( SUPPORTS ?auto_9300 ?auto_9294 ) ( POINTING ?auto_9299 ?auto_9297 ) ( CALIBRATION_TARGET ?auto_9300 ?auto_9297 ) ( NOT_CALIBRATED ?auto_9300 ) )
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
      ?auto_9308 - INSTRUMENT
      ?auto_9306 - SATELLITE
      ?auto_9307 - DIRECTION
      ?auto_9305 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_9304 ?auto_9301 ) ) ( ON_BOARD ?auto_9308 ?auto_9306 ) ( SUPPORTS ?auto_9308 ?auto_9302 ) ( not ( = ?auto_9301 ?auto_9307 ) ) ( not ( = ?auto_9304 ?auto_9307 ) ) ( not ( = ?auto_9303 ?auto_9302 ) ) ( CALIBRATION_TARGET ?auto_9308 ?auto_9307 ) ( ON_BOARD ?auto_9305 ?auto_9306 ) ( POWER_ON ?auto_9305 ) ( not ( = ?auto_9308 ?auto_9305 ) ) ( SUPPORTS ?auto_9305 ?auto_9303 ) ( POINTING ?auto_9306 ?auto_9307 ) ( CALIBRATION_TARGET ?auto_9305 ?auto_9307 ) ( NOT_CALIBRATED ?auto_9305 ) )
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
      ?auto_9393 - DIRECTION
      ?auto_9398 - INSTRUMENT
      ?auto_9396 - SATELLITE
      ?auto_9397 - DIRECTION
      ?auto_9394 - MODE
      ?auto_9395 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_9391 ?auto_9393 ) ) ( ON_BOARD ?auto_9398 ?auto_9396 ) ( SUPPORTS ?auto_9398 ?auto_9392 ) ( not ( = ?auto_9391 ?auto_9397 ) ) ( not ( = ?auto_9393 ?auto_9397 ) ) ( not ( = ?auto_9394 ?auto_9392 ) ) ( CALIBRATION_TARGET ?auto_9398 ?auto_9397 ) ( ON_BOARD ?auto_9395 ?auto_9396 ) ( not ( = ?auto_9398 ?auto_9395 ) ) ( SUPPORTS ?auto_9395 ?auto_9394 ) ( POINTING ?auto_9396 ?auto_9397 ) ( CALIBRATION_TARGET ?auto_9395 ?auto_9397 ) ( POWER_AVAIL ?auto_9396 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_9395 ?auto_9396 )
      ( GET-2IMAGE ?auto_9393 ?auto_9394 ?auto_9391 ?auto_9392 )
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
      ?auto_9403 - INSTRUMENT
      ?auto_9405 - SATELLITE
      ?auto_9404 - DIRECTION
      ?auto_9406 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_9402 ?auto_9399 ) ) ( ON_BOARD ?auto_9403 ?auto_9405 ) ( SUPPORTS ?auto_9403 ?auto_9401 ) ( not ( = ?auto_9402 ?auto_9404 ) ) ( not ( = ?auto_9399 ?auto_9404 ) ) ( not ( = ?auto_9400 ?auto_9401 ) ) ( CALIBRATION_TARGET ?auto_9403 ?auto_9404 ) ( ON_BOARD ?auto_9406 ?auto_9405 ) ( not ( = ?auto_9403 ?auto_9406 ) ) ( SUPPORTS ?auto_9406 ?auto_9400 ) ( POINTING ?auto_9405 ?auto_9404 ) ( CALIBRATION_TARGET ?auto_9406 ?auto_9404 ) ( POWER_AVAIL ?auto_9405 ) )
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
      ?auto_9414 - DIRECTION
      ?auto_9413 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_9410 ?auto_9407 ) ) ( ON_BOARD ?auto_9411 ?auto_9412 ) ( SUPPORTS ?auto_9411 ?auto_9408 ) ( not ( = ?auto_9407 ?auto_9414 ) ) ( not ( = ?auto_9410 ?auto_9414 ) ) ( not ( = ?auto_9409 ?auto_9408 ) ) ( CALIBRATION_TARGET ?auto_9411 ?auto_9414 ) ( ON_BOARD ?auto_9413 ?auto_9412 ) ( not ( = ?auto_9411 ?auto_9413 ) ) ( SUPPORTS ?auto_9413 ?auto_9409 ) ( POINTING ?auto_9412 ?auto_9414 ) ( CALIBRATION_TARGET ?auto_9413 ?auto_9414 ) ( POWER_AVAIL ?auto_9412 ) )
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
      ?auto_9501 - DIRECTION
      ?auto_9499 - INSTRUMENT
      ?auto_9500 - SATELLITE
      ?auto_9504 - DIRECTION
      ?auto_9502 - MODE
      ?auto_9503 - INSTRUMENT
      ?auto_9505 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9497 ?auto_9501 ) ) ( ON_BOARD ?auto_9499 ?auto_9500 ) ( SUPPORTS ?auto_9499 ?auto_9498 ) ( not ( = ?auto_9497 ?auto_9504 ) ) ( not ( = ?auto_9501 ?auto_9504 ) ) ( not ( = ?auto_9502 ?auto_9498 ) ) ( CALIBRATION_TARGET ?auto_9499 ?auto_9504 ) ( ON_BOARD ?auto_9503 ?auto_9500 ) ( not ( = ?auto_9499 ?auto_9503 ) ) ( SUPPORTS ?auto_9503 ?auto_9502 ) ( CALIBRATION_TARGET ?auto_9503 ?auto_9504 ) ( POWER_AVAIL ?auto_9500 ) ( POINTING ?auto_9500 ?auto_9505 ) ( not ( = ?auto_9504 ?auto_9505 ) ) ( not ( = ?auto_9497 ?auto_9505 ) ) ( not ( = ?auto_9501 ?auto_9505 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_9500 ?auto_9504 ?auto_9505 )
      ( GET-2IMAGE ?auto_9501 ?auto_9502 ?auto_9497 ?auto_9498 )
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
      ?auto_9514 - INSTRUMENT
      ?auto_9511 - SATELLITE
      ?auto_9510 - DIRECTION
      ?auto_9512 - INSTRUMENT
      ?auto_9513 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9509 ?auto_9506 ) ) ( ON_BOARD ?auto_9514 ?auto_9511 ) ( SUPPORTS ?auto_9514 ?auto_9508 ) ( not ( = ?auto_9509 ?auto_9510 ) ) ( not ( = ?auto_9506 ?auto_9510 ) ) ( not ( = ?auto_9507 ?auto_9508 ) ) ( CALIBRATION_TARGET ?auto_9514 ?auto_9510 ) ( ON_BOARD ?auto_9512 ?auto_9511 ) ( not ( = ?auto_9514 ?auto_9512 ) ) ( SUPPORTS ?auto_9512 ?auto_9507 ) ( CALIBRATION_TARGET ?auto_9512 ?auto_9510 ) ( POWER_AVAIL ?auto_9511 ) ( POINTING ?auto_9511 ?auto_9513 ) ( not ( = ?auto_9510 ?auto_9513 ) ) ( not ( = ?auto_9509 ?auto_9513 ) ) ( not ( = ?auto_9506 ?auto_9513 ) ) )
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
      ?auto_9523 - INSTRUMENT
      ?auto_9521 - SATELLITE
      ?auto_9522 - DIRECTION
      ?auto_9519 - INSTRUMENT
      ?auto_9520 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9518 ?auto_9515 ) ) ( ON_BOARD ?auto_9523 ?auto_9521 ) ( SUPPORTS ?auto_9523 ?auto_9516 ) ( not ( = ?auto_9515 ?auto_9522 ) ) ( not ( = ?auto_9518 ?auto_9522 ) ) ( not ( = ?auto_9517 ?auto_9516 ) ) ( CALIBRATION_TARGET ?auto_9523 ?auto_9522 ) ( ON_BOARD ?auto_9519 ?auto_9521 ) ( not ( = ?auto_9523 ?auto_9519 ) ) ( SUPPORTS ?auto_9519 ?auto_9517 ) ( CALIBRATION_TARGET ?auto_9519 ?auto_9522 ) ( POWER_AVAIL ?auto_9521 ) ( POINTING ?auto_9521 ?auto_9520 ) ( not ( = ?auto_9522 ?auto_9520 ) ) ( not ( = ?auto_9515 ?auto_9520 ) ) ( not ( = ?auto_9518 ?auto_9520 ) ) )
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
      ?auto_9758 - INSTRUMENT
      ?auto_9759 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_9757 ?auto_9754 ) ) ( CALIBRATED ?auto_9758 ) ( ON_BOARD ?auto_9758 ?auto_9759 ) ( SUPPORTS ?auto_9758 ?auto_9756 ) ( POWER_ON ?auto_9758 ) ( POINTING ?auto_9759 ?auto_9757 ) ( HAVE_IMAGE ?auto_9754 ?auto_9755 ) ( not ( = ?auto_9755 ?auto_9756 ) ) )
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
      ?auto_9764 - INSTRUMENT
      ?auto_9765 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_9763 ?auto_9760 ) ) ( CALIBRATED ?auto_9764 ) ( ON_BOARD ?auto_9764 ?auto_9765 ) ( SUPPORTS ?auto_9764 ?auto_9762 ) ( POWER_ON ?auto_9764 ) ( POINTING ?auto_9765 ?auto_9763 ) ( HAVE_IMAGE ?auto_9760 ?auto_9761 ) ( not ( = ?auto_9761 ?auto_9762 ) ) )
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
      ?auto_9770 - INSTRUMENT
      ?auto_9771 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_9769 ?auto_9766 ) ) ( CALIBRATED ?auto_9770 ) ( ON_BOARD ?auto_9770 ?auto_9771 ) ( SUPPORTS ?auto_9770 ?auto_9767 ) ( POWER_ON ?auto_9770 ) ( POINTING ?auto_9771 ?auto_9766 ) ( HAVE_IMAGE ?auto_9769 ?auto_9768 ) ( not ( = ?auto_9767 ?auto_9768 ) ) )
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
      ?auto_9776 - INSTRUMENT
      ?auto_9777 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_9775 ?auto_9772 ) ) ( CALIBRATED ?auto_9776 ) ( ON_BOARD ?auto_9776 ?auto_9777 ) ( SUPPORTS ?auto_9776 ?auto_9773 ) ( POWER_ON ?auto_9776 ) ( POINTING ?auto_9777 ?auto_9772 ) ( HAVE_IMAGE ?auto_9775 ?auto_9774 ) ( not ( = ?auto_9773 ?auto_9774 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9772 ?auto_9773 )
      ( GET-2IMAGE-VERIFY ?auto_9772 ?auto_9773 ?auto_9775 ?auto_9774 ) )
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
      ?auto_9798 - INSTRUMENT
      ?auto_9799 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_9795 ?auto_9792 ) ) ( not ( = ?auto_9797 ?auto_9792 ) ) ( not ( = ?auto_9797 ?auto_9795 ) ) ( CALIBRATED ?auto_9798 ) ( ON_BOARD ?auto_9798 ?auto_9799 ) ( SUPPORTS ?auto_9798 ?auto_9796 ) ( POWER_ON ?auto_9798 ) ( POINTING ?auto_9799 ?auto_9797 ) ( HAVE_IMAGE ?auto_9792 ?auto_9793 ) ( HAVE_IMAGE ?auto_9795 ?auto_9794 ) ( not ( = ?auto_9793 ?auto_9794 ) ) ( not ( = ?auto_9793 ?auto_9796 ) ) ( not ( = ?auto_9794 ?auto_9796 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9797 ?auto_9796 )
      ( GET-3IMAGE-VERIFY ?auto_9792 ?auto_9793 ?auto_9795 ?auto_9794 ?auto_9797 ?auto_9796 ) )
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
      ?auto_9814 - INSTRUMENT
      ?auto_9815 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_9811 ?auto_9808 ) ) ( not ( = ?auto_9813 ?auto_9808 ) ) ( not ( = ?auto_9813 ?auto_9811 ) ) ( CALIBRATED ?auto_9814 ) ( ON_BOARD ?auto_9814 ?auto_9815 ) ( SUPPORTS ?auto_9814 ?auto_9810 ) ( POWER_ON ?auto_9814 ) ( POINTING ?auto_9815 ?auto_9811 ) ( HAVE_IMAGE ?auto_9808 ?auto_9809 ) ( HAVE_IMAGE ?auto_9813 ?auto_9812 ) ( not ( = ?auto_9809 ?auto_9810 ) ) ( not ( = ?auto_9809 ?auto_9812 ) ) ( not ( = ?auto_9810 ?auto_9812 ) ) )
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
      ?auto_9830 - INSTRUMENT
      ?auto_9831 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_9827 ?auto_9824 ) ) ( not ( = ?auto_9829 ?auto_9824 ) ) ( not ( = ?auto_9829 ?auto_9827 ) ) ( CALIBRATED ?auto_9830 ) ( ON_BOARD ?auto_9830 ?auto_9831 ) ( SUPPORTS ?auto_9830 ?auto_9828 ) ( POWER_ON ?auto_9830 ) ( POINTING ?auto_9831 ?auto_9829 ) ( HAVE_IMAGE ?auto_9824 ?auto_9825 ) ( HAVE_IMAGE ?auto_9827 ?auto_9826 ) ( not ( = ?auto_9825 ?auto_9826 ) ) ( not ( = ?auto_9825 ?auto_9828 ) ) ( not ( = ?auto_9826 ?auto_9828 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9829 ?auto_9828 )
      ( GET-3IMAGE-VERIFY ?auto_9824 ?auto_9825 ?auto_9827 ?auto_9826 ?auto_9829 ?auto_9828 ) )
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
      ?auto_9846 - INSTRUMENT
      ?auto_9847 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_9843 ?auto_9840 ) ) ( not ( = ?auto_9845 ?auto_9840 ) ) ( not ( = ?auto_9845 ?auto_9843 ) ) ( CALIBRATED ?auto_9846 ) ( ON_BOARD ?auto_9846 ?auto_9847 ) ( SUPPORTS ?auto_9846 ?auto_9842 ) ( POWER_ON ?auto_9846 ) ( POINTING ?auto_9847 ?auto_9843 ) ( HAVE_IMAGE ?auto_9840 ?auto_9841 ) ( HAVE_IMAGE ?auto_9845 ?auto_9844 ) ( not ( = ?auto_9841 ?auto_9842 ) ) ( not ( = ?auto_9841 ?auto_9844 ) ) ( not ( = ?auto_9842 ?auto_9844 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9843 ?auto_9842 )
      ( GET-3IMAGE-VERIFY ?auto_9840 ?auto_9841 ?auto_9843 ?auto_9842 ?auto_9845 ?auto_9844 ) )
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
      ?auto_9878 - INSTRUMENT
      ?auto_9879 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_9875 ?auto_9872 ) ) ( not ( = ?auto_9877 ?auto_9872 ) ) ( not ( = ?auto_9877 ?auto_9875 ) ) ( CALIBRATED ?auto_9878 ) ( ON_BOARD ?auto_9878 ?auto_9879 ) ( SUPPORTS ?auto_9878 ?auto_9873 ) ( POWER_ON ?auto_9878 ) ( POINTING ?auto_9879 ?auto_9872 ) ( HAVE_IMAGE ?auto_9875 ?auto_9874 ) ( HAVE_IMAGE ?auto_9877 ?auto_9876 ) ( not ( = ?auto_9873 ?auto_9874 ) ) ( not ( = ?auto_9873 ?auto_9876 ) ) ( not ( = ?auto_9874 ?auto_9876 ) ) )
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
      ?auto_9894 - INSTRUMENT
      ?auto_9895 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_9891 ?auto_9888 ) ) ( not ( = ?auto_9893 ?auto_9888 ) ) ( not ( = ?auto_9893 ?auto_9891 ) ) ( CALIBRATED ?auto_9894 ) ( ON_BOARD ?auto_9894 ?auto_9895 ) ( SUPPORTS ?auto_9894 ?auto_9889 ) ( POWER_ON ?auto_9894 ) ( POINTING ?auto_9895 ?auto_9888 ) ( HAVE_IMAGE ?auto_9891 ?auto_9890 ) ( HAVE_IMAGE ?auto_9893 ?auto_9892 ) ( not ( = ?auto_9889 ?auto_9890 ) ) ( not ( = ?auto_9889 ?auto_9892 ) ) ( not ( = ?auto_9890 ?auto_9892 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_9888 ?auto_9889 )
      ( GET-3IMAGE-VERIFY ?auto_9888 ?auto_9889 ?auto_9891 ?auto_9890 ?auto_9893 ?auto_9892 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_9936 - DIRECTION
      ?auto_9937 - MODE
    )
    :vars
    (
      ?auto_9938 - INSTRUMENT
      ?auto_9939 - SATELLITE
      ?auto_9940 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_9938 ) ( ON_BOARD ?auto_9938 ?auto_9939 ) ( SUPPORTS ?auto_9938 ?auto_9937 ) ( POWER_ON ?auto_9938 ) ( POINTING ?auto_9939 ?auto_9940 ) ( not ( = ?auto_9936 ?auto_9940 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_9939 ?auto_9936 ?auto_9940 )
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
      ?auto_9947 - INSTRUMENT
      ?auto_9946 - SATELLITE
      ?auto_9945 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9944 ?auto_9941 ) ) ( CALIBRATED ?auto_9947 ) ( ON_BOARD ?auto_9947 ?auto_9946 ) ( SUPPORTS ?auto_9947 ?auto_9943 ) ( POWER_ON ?auto_9947 ) ( POINTING ?auto_9946 ?auto_9945 ) ( not ( = ?auto_9944 ?auto_9945 ) ) ( HAVE_IMAGE ?auto_9941 ?auto_9942 ) ( not ( = ?auto_9941 ?auto_9945 ) ) ( not ( = ?auto_9942 ?auto_9943 ) ) )
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
      ?auto_9956 - DIRECTION
      ?auto_9953 - INSTRUMENT
      ?auto_9952 - SATELLITE
      ?auto_9954 - DIRECTION
      ?auto_9955 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_9951 ?auto_9948 ) ) ( not ( = ?auto_9951 ?auto_9956 ) ) ( CALIBRATED ?auto_9953 ) ( ON_BOARD ?auto_9953 ?auto_9952 ) ( SUPPORTS ?auto_9953 ?auto_9950 ) ( POWER_ON ?auto_9953 ) ( POINTING ?auto_9952 ?auto_9954 ) ( not ( = ?auto_9951 ?auto_9954 ) ) ( HAVE_IMAGE ?auto_9956 ?auto_9955 ) ( not ( = ?auto_9956 ?auto_9954 ) ) ( not ( = ?auto_9955 ?auto_9950 ) ) ( HAVE_IMAGE ?auto_9948 ?auto_9949 ) ( not ( = ?auto_9948 ?auto_9956 ) ) ( not ( = ?auto_9948 ?auto_9954 ) ) ( not ( = ?auto_9949 ?auto_9950 ) ) ( not ( = ?auto_9949 ?auto_9955 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9956 ?auto_9955 ?auto_9951 ?auto_9950 )
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
    ( and ( not ( = ?auto_9960 ?auto_9957 ) ) ( CALIBRATED ?auto_9962 ) ( ON_BOARD ?auto_9962 ?auto_9961 ) ( SUPPORTS ?auto_9962 ?auto_9958 ) ( POWER_ON ?auto_9962 ) ( POINTING ?auto_9961 ?auto_9963 ) ( not ( = ?auto_9957 ?auto_9963 ) ) ( HAVE_IMAGE ?auto_9960 ?auto_9959 ) ( not ( = ?auto_9960 ?auto_9963 ) ) ( not ( = ?auto_9959 ?auto_9958 ) ) )
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
      ?auto_9972 - DIRECTION
      ?auto_9969 - INSTRUMENT
      ?auto_9968 - SATELLITE
      ?auto_9970 - DIRECTION
      ?auto_9971 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_9967 ?auto_9964 ) ) ( not ( = ?auto_9964 ?auto_9972 ) ) ( CALIBRATED ?auto_9969 ) ( ON_BOARD ?auto_9969 ?auto_9968 ) ( SUPPORTS ?auto_9969 ?auto_9965 ) ( POWER_ON ?auto_9969 ) ( POINTING ?auto_9968 ?auto_9970 ) ( not ( = ?auto_9964 ?auto_9970 ) ) ( HAVE_IMAGE ?auto_9972 ?auto_9971 ) ( not ( = ?auto_9972 ?auto_9970 ) ) ( not ( = ?auto_9971 ?auto_9965 ) ) ( HAVE_IMAGE ?auto_9967 ?auto_9966 ) ( not ( = ?auto_9965 ?auto_9966 ) ) ( not ( = ?auto_9967 ?auto_9972 ) ) ( not ( = ?auto_9967 ?auto_9970 ) ) ( not ( = ?auto_9966 ?auto_9971 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9972 ?auto_9971 ?auto_9964 ?auto_9965 )
      ( GET-2IMAGE-VERIFY ?auto_9964 ?auto_9965 ?auto_9967 ?auto_9966 ) )
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
    ( and ( not ( = ?auto_9994 ?auto_9991 ) ) ( not ( = ?auto_9996 ?auto_9991 ) ) ( not ( = ?auto_9996 ?auto_9994 ) ) ( CALIBRATED ?auto_9998 ) ( ON_BOARD ?auto_9998 ?auto_9997 ) ( SUPPORTS ?auto_9998 ?auto_9995 ) ( POWER_ON ?auto_9998 ) ( POINTING ?auto_9997 ?auto_9999 ) ( not ( = ?auto_9996 ?auto_9999 ) ) ( HAVE_IMAGE ?auto_9991 ?auto_9992 ) ( not ( = ?auto_9991 ?auto_9999 ) ) ( not ( = ?auto_9992 ?auto_9995 ) ) ( HAVE_IMAGE ?auto_9994 ?auto_9993 ) ( not ( = ?auto_9992 ?auto_9993 ) ) ( not ( = ?auto_9994 ?auto_9999 ) ) ( not ( = ?auto_9993 ?auto_9995 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_9991 ?auto_9992 ?auto_9996 ?auto_9995 )
      ( GET-3IMAGE-VERIFY ?auto_9991 ?auto_9992 ?auto_9994 ?auto_9993 ?auto_9996 ?auto_9995 ) )
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
    ( and ( not ( = ?auto_10012 ?auto_10009 ) ) ( not ( = ?auto_10014 ?auto_10009 ) ) ( not ( = ?auto_10014 ?auto_10012 ) ) ( CALIBRATED ?auto_10016 ) ( ON_BOARD ?auto_10016 ?auto_10015 ) ( SUPPORTS ?auto_10016 ?auto_10011 ) ( POWER_ON ?auto_10016 ) ( POINTING ?auto_10015 ?auto_10017 ) ( not ( = ?auto_10012 ?auto_10017 ) ) ( HAVE_IMAGE ?auto_10009 ?auto_10010 ) ( not ( = ?auto_10009 ?auto_10017 ) ) ( not ( = ?auto_10010 ?auto_10011 ) ) ( HAVE_IMAGE ?auto_10014 ?auto_10013 ) ( not ( = ?auto_10010 ?auto_10013 ) ) ( not ( = ?auto_10011 ?auto_10013 ) ) ( not ( = ?auto_10014 ?auto_10017 ) ) )
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
    ( and ( not ( = ?auto_10030 ?auto_10027 ) ) ( not ( = ?auto_10032 ?auto_10027 ) ) ( not ( = ?auto_10032 ?auto_10030 ) ) ( CALIBRATED ?auto_10034 ) ( ON_BOARD ?auto_10034 ?auto_10033 ) ( SUPPORTS ?auto_10034 ?auto_10031 ) ( POWER_ON ?auto_10034 ) ( POINTING ?auto_10033 ?auto_10035 ) ( not ( = ?auto_10032 ?auto_10035 ) ) ( HAVE_IMAGE ?auto_10030 ?auto_10029 ) ( not ( = ?auto_10030 ?auto_10035 ) ) ( not ( = ?auto_10029 ?auto_10031 ) ) ( HAVE_IMAGE ?auto_10027 ?auto_10028 ) ( not ( = ?auto_10027 ?auto_10035 ) ) ( not ( = ?auto_10028 ?auto_10029 ) ) ( not ( = ?auto_10028 ?auto_10031 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10030 ?auto_10029 ?auto_10032 ?auto_10031 )
      ( GET-3IMAGE-VERIFY ?auto_10027 ?auto_10028 ?auto_10030 ?auto_10029 ?auto_10032 ?auto_10031 ) )
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
    ( and ( not ( = ?auto_10050 ?auto_10047 ) ) ( not ( = ?auto_10052 ?auto_10047 ) ) ( not ( = ?auto_10052 ?auto_10050 ) ) ( CALIBRATED ?auto_10054 ) ( ON_BOARD ?auto_10054 ?auto_10053 ) ( SUPPORTS ?auto_10054 ?auto_10049 ) ( POWER_ON ?auto_10054 ) ( POINTING ?auto_10053 ?auto_10055 ) ( not ( = ?auto_10050 ?auto_10055 ) ) ( HAVE_IMAGE ?auto_10052 ?auto_10051 ) ( not ( = ?auto_10052 ?auto_10055 ) ) ( not ( = ?auto_10051 ?auto_10049 ) ) ( HAVE_IMAGE ?auto_10047 ?auto_10048 ) ( not ( = ?auto_10047 ?auto_10055 ) ) ( not ( = ?auto_10048 ?auto_10049 ) ) ( not ( = ?auto_10048 ?auto_10051 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10052 ?auto_10051 ?auto_10050 ?auto_10049 )
      ( GET-3IMAGE-VERIFY ?auto_10047 ?auto_10048 ?auto_10050 ?auto_10049 ?auto_10052 ?auto_10051 ) )
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
    ( and ( not ( = ?auto_10090 ?auto_10087 ) ) ( not ( = ?auto_10092 ?auto_10087 ) ) ( not ( = ?auto_10092 ?auto_10090 ) ) ( CALIBRATED ?auto_10094 ) ( ON_BOARD ?auto_10094 ?auto_10093 ) ( SUPPORTS ?auto_10094 ?auto_10088 ) ( POWER_ON ?auto_10094 ) ( POINTING ?auto_10093 ?auto_10095 ) ( not ( = ?auto_10087 ?auto_10095 ) ) ( HAVE_IMAGE ?auto_10090 ?auto_10089 ) ( not ( = ?auto_10090 ?auto_10095 ) ) ( not ( = ?auto_10089 ?auto_10088 ) ) ( HAVE_IMAGE ?auto_10092 ?auto_10091 ) ( not ( = ?auto_10088 ?auto_10091 ) ) ( not ( = ?auto_10089 ?auto_10091 ) ) ( not ( = ?auto_10092 ?auto_10095 ) ) )
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
    ( and ( not ( = ?auto_10108 ?auto_10105 ) ) ( not ( = ?auto_10110 ?auto_10105 ) ) ( not ( = ?auto_10110 ?auto_10108 ) ) ( CALIBRATED ?auto_10112 ) ( ON_BOARD ?auto_10112 ?auto_10111 ) ( SUPPORTS ?auto_10112 ?auto_10106 ) ( POWER_ON ?auto_10112 ) ( POINTING ?auto_10111 ?auto_10113 ) ( not ( = ?auto_10105 ?auto_10113 ) ) ( HAVE_IMAGE ?auto_10110 ?auto_10109 ) ( not ( = ?auto_10110 ?auto_10113 ) ) ( not ( = ?auto_10109 ?auto_10106 ) ) ( HAVE_IMAGE ?auto_10108 ?auto_10107 ) ( not ( = ?auto_10106 ?auto_10107 ) ) ( not ( = ?auto_10108 ?auto_10113 ) ) ( not ( = ?auto_10107 ?auto_10109 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10110 ?auto_10109 ?auto_10105 ?auto_10106 )
      ( GET-3IMAGE-VERIFY ?auto_10105 ?auto_10106 ?auto_10108 ?auto_10107 ?auto_10110 ?auto_10109 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_10167 - DIRECTION
      ?auto_10168 - MODE
    )
    :vars
    (
      ?auto_10173 - DIRECTION
      ?auto_10170 - INSTRUMENT
      ?auto_10169 - SATELLITE
      ?auto_10171 - DIRECTION
      ?auto_10172 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_10167 ?auto_10173 ) ) ( ON_BOARD ?auto_10170 ?auto_10169 ) ( SUPPORTS ?auto_10170 ?auto_10168 ) ( POWER_ON ?auto_10170 ) ( POINTING ?auto_10169 ?auto_10171 ) ( not ( = ?auto_10167 ?auto_10171 ) ) ( HAVE_IMAGE ?auto_10173 ?auto_10172 ) ( not ( = ?auto_10173 ?auto_10171 ) ) ( not ( = ?auto_10172 ?auto_10168 ) ) ( CALIBRATION_TARGET ?auto_10170 ?auto_10171 ) ( NOT_CALIBRATED ?auto_10170 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_10169 ?auto_10170 ?auto_10171 )
      ( GET-2IMAGE ?auto_10173 ?auto_10172 ?auto_10167 ?auto_10168 )
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
      ?auto_10180 - INSTRUMENT
      ?auto_10178 - SATELLITE
      ?auto_10179 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10177 ?auto_10174 ) ) ( ON_BOARD ?auto_10180 ?auto_10178 ) ( SUPPORTS ?auto_10180 ?auto_10176 ) ( POWER_ON ?auto_10180 ) ( POINTING ?auto_10178 ?auto_10179 ) ( not ( = ?auto_10177 ?auto_10179 ) ) ( HAVE_IMAGE ?auto_10174 ?auto_10175 ) ( not ( = ?auto_10174 ?auto_10179 ) ) ( not ( = ?auto_10175 ?auto_10176 ) ) ( CALIBRATION_TARGET ?auto_10180 ?auto_10179 ) ( NOT_CALIBRATED ?auto_10180 ) )
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
      ?auto_10186 - DIRECTION
      ?auto_10187 - INSTRUMENT
      ?auto_10189 - SATELLITE
      ?auto_10188 - DIRECTION
      ?auto_10185 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_10184 ?auto_10181 ) ) ( not ( = ?auto_10184 ?auto_10186 ) ) ( ON_BOARD ?auto_10187 ?auto_10189 ) ( SUPPORTS ?auto_10187 ?auto_10183 ) ( POWER_ON ?auto_10187 ) ( POINTING ?auto_10189 ?auto_10188 ) ( not ( = ?auto_10184 ?auto_10188 ) ) ( HAVE_IMAGE ?auto_10186 ?auto_10185 ) ( not ( = ?auto_10186 ?auto_10188 ) ) ( not ( = ?auto_10185 ?auto_10183 ) ) ( CALIBRATION_TARGET ?auto_10187 ?auto_10188 ) ( NOT_CALIBRATED ?auto_10187 ) ( HAVE_IMAGE ?auto_10181 ?auto_10182 ) ( not ( = ?auto_10181 ?auto_10186 ) ) ( not ( = ?auto_10181 ?auto_10188 ) ) ( not ( = ?auto_10182 ?auto_10183 ) ) ( not ( = ?auto_10182 ?auto_10185 ) ) )
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
      ?auto_10194 - INSTRUMENT
      ?auto_10196 - SATELLITE
      ?auto_10195 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10193 ?auto_10190 ) ) ( ON_BOARD ?auto_10194 ?auto_10196 ) ( SUPPORTS ?auto_10194 ?auto_10191 ) ( POWER_ON ?auto_10194 ) ( POINTING ?auto_10196 ?auto_10195 ) ( not ( = ?auto_10190 ?auto_10195 ) ) ( HAVE_IMAGE ?auto_10193 ?auto_10192 ) ( not ( = ?auto_10193 ?auto_10195 ) ) ( not ( = ?auto_10192 ?auto_10191 ) ) ( CALIBRATION_TARGET ?auto_10194 ?auto_10195 ) ( NOT_CALIBRATED ?auto_10194 ) )
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
      ?auto_10202 - DIRECTION
      ?auto_10203 - INSTRUMENT
      ?auto_10205 - SATELLITE
      ?auto_10204 - DIRECTION
      ?auto_10201 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_10200 ?auto_10197 ) ) ( not ( = ?auto_10197 ?auto_10202 ) ) ( ON_BOARD ?auto_10203 ?auto_10205 ) ( SUPPORTS ?auto_10203 ?auto_10198 ) ( POWER_ON ?auto_10203 ) ( POINTING ?auto_10205 ?auto_10204 ) ( not ( = ?auto_10197 ?auto_10204 ) ) ( HAVE_IMAGE ?auto_10202 ?auto_10201 ) ( not ( = ?auto_10202 ?auto_10204 ) ) ( not ( = ?auto_10201 ?auto_10198 ) ) ( CALIBRATION_TARGET ?auto_10203 ?auto_10204 ) ( NOT_CALIBRATED ?auto_10203 ) ( HAVE_IMAGE ?auto_10200 ?auto_10199 ) ( not ( = ?auto_10198 ?auto_10199 ) ) ( not ( = ?auto_10200 ?auto_10202 ) ) ( not ( = ?auto_10200 ?auto_10204 ) ) ( not ( = ?auto_10199 ?auto_10201 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10202 ?auto_10201 ?auto_10197 ?auto_10198 )
      ( GET-2IMAGE-VERIFY ?auto_10197 ?auto_10198 ?auto_10200 ?auto_10199 ) )
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
      ?auto_10230 - INSTRUMENT
      ?auto_10232 - SATELLITE
      ?auto_10231 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10227 ?auto_10224 ) ) ( not ( = ?auto_10229 ?auto_10224 ) ) ( not ( = ?auto_10229 ?auto_10227 ) ) ( ON_BOARD ?auto_10230 ?auto_10232 ) ( SUPPORTS ?auto_10230 ?auto_10228 ) ( POWER_ON ?auto_10230 ) ( POINTING ?auto_10232 ?auto_10231 ) ( not ( = ?auto_10229 ?auto_10231 ) ) ( HAVE_IMAGE ?auto_10224 ?auto_10225 ) ( not ( = ?auto_10224 ?auto_10231 ) ) ( not ( = ?auto_10225 ?auto_10228 ) ) ( CALIBRATION_TARGET ?auto_10230 ?auto_10231 ) ( NOT_CALIBRATED ?auto_10230 ) ( HAVE_IMAGE ?auto_10227 ?auto_10226 ) ( not ( = ?auto_10225 ?auto_10226 ) ) ( not ( = ?auto_10227 ?auto_10231 ) ) ( not ( = ?auto_10226 ?auto_10228 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10224 ?auto_10225 ?auto_10229 ?auto_10228 )
      ( GET-3IMAGE-VERIFY ?auto_10224 ?auto_10225 ?auto_10227 ?auto_10226 ?auto_10229 ?auto_10228 ) )
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
      ?auto_10248 - INSTRUMENT
      ?auto_10250 - SATELLITE
      ?auto_10249 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10245 ?auto_10242 ) ) ( not ( = ?auto_10247 ?auto_10242 ) ) ( not ( = ?auto_10247 ?auto_10245 ) ) ( ON_BOARD ?auto_10248 ?auto_10250 ) ( SUPPORTS ?auto_10248 ?auto_10244 ) ( POWER_ON ?auto_10248 ) ( POINTING ?auto_10250 ?auto_10249 ) ( not ( = ?auto_10245 ?auto_10249 ) ) ( HAVE_IMAGE ?auto_10242 ?auto_10243 ) ( not ( = ?auto_10242 ?auto_10249 ) ) ( not ( = ?auto_10243 ?auto_10244 ) ) ( CALIBRATION_TARGET ?auto_10248 ?auto_10249 ) ( NOT_CALIBRATED ?auto_10248 ) ( HAVE_IMAGE ?auto_10247 ?auto_10246 ) ( not ( = ?auto_10243 ?auto_10246 ) ) ( not ( = ?auto_10244 ?auto_10246 ) ) ( not ( = ?auto_10247 ?auto_10249 ) ) )
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
      ?auto_10266 - INSTRUMENT
      ?auto_10268 - SATELLITE
      ?auto_10267 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10263 ?auto_10260 ) ) ( not ( = ?auto_10265 ?auto_10260 ) ) ( not ( = ?auto_10265 ?auto_10263 ) ) ( ON_BOARD ?auto_10266 ?auto_10268 ) ( SUPPORTS ?auto_10266 ?auto_10264 ) ( POWER_ON ?auto_10266 ) ( POINTING ?auto_10268 ?auto_10267 ) ( not ( = ?auto_10265 ?auto_10267 ) ) ( HAVE_IMAGE ?auto_10263 ?auto_10262 ) ( not ( = ?auto_10263 ?auto_10267 ) ) ( not ( = ?auto_10262 ?auto_10264 ) ) ( CALIBRATION_TARGET ?auto_10266 ?auto_10267 ) ( NOT_CALIBRATED ?auto_10266 ) ( HAVE_IMAGE ?auto_10260 ?auto_10261 ) ( not ( = ?auto_10260 ?auto_10267 ) ) ( not ( = ?auto_10261 ?auto_10262 ) ) ( not ( = ?auto_10261 ?auto_10264 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10263 ?auto_10262 ?auto_10265 ?auto_10264 )
      ( GET-3IMAGE-VERIFY ?auto_10260 ?auto_10261 ?auto_10263 ?auto_10262 ?auto_10265 ?auto_10264 ) )
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
      ?auto_10286 - INSTRUMENT
      ?auto_10288 - SATELLITE
      ?auto_10287 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10283 ?auto_10280 ) ) ( not ( = ?auto_10285 ?auto_10280 ) ) ( not ( = ?auto_10285 ?auto_10283 ) ) ( ON_BOARD ?auto_10286 ?auto_10288 ) ( SUPPORTS ?auto_10286 ?auto_10282 ) ( POWER_ON ?auto_10286 ) ( POINTING ?auto_10288 ?auto_10287 ) ( not ( = ?auto_10283 ?auto_10287 ) ) ( HAVE_IMAGE ?auto_10285 ?auto_10284 ) ( not ( = ?auto_10285 ?auto_10287 ) ) ( not ( = ?auto_10284 ?auto_10282 ) ) ( CALIBRATION_TARGET ?auto_10286 ?auto_10287 ) ( NOT_CALIBRATED ?auto_10286 ) ( HAVE_IMAGE ?auto_10280 ?auto_10281 ) ( not ( = ?auto_10280 ?auto_10287 ) ) ( not ( = ?auto_10281 ?auto_10282 ) ) ( not ( = ?auto_10281 ?auto_10284 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10285 ?auto_10284 ?auto_10283 ?auto_10282 )
      ( GET-3IMAGE-VERIFY ?auto_10280 ?auto_10281 ?auto_10283 ?auto_10282 ?auto_10285 ?auto_10284 ) )
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
      ?auto_10326 - INSTRUMENT
      ?auto_10328 - SATELLITE
      ?auto_10327 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10323 ?auto_10320 ) ) ( not ( = ?auto_10325 ?auto_10320 ) ) ( not ( = ?auto_10325 ?auto_10323 ) ) ( ON_BOARD ?auto_10326 ?auto_10328 ) ( SUPPORTS ?auto_10326 ?auto_10321 ) ( POWER_ON ?auto_10326 ) ( POINTING ?auto_10328 ?auto_10327 ) ( not ( = ?auto_10320 ?auto_10327 ) ) ( HAVE_IMAGE ?auto_10323 ?auto_10322 ) ( not ( = ?auto_10323 ?auto_10327 ) ) ( not ( = ?auto_10322 ?auto_10321 ) ) ( CALIBRATION_TARGET ?auto_10326 ?auto_10327 ) ( NOT_CALIBRATED ?auto_10326 ) ( HAVE_IMAGE ?auto_10325 ?auto_10324 ) ( not ( = ?auto_10321 ?auto_10324 ) ) ( not ( = ?auto_10322 ?auto_10324 ) ) ( not ( = ?auto_10325 ?auto_10327 ) ) )
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
      ?auto_10344 - INSTRUMENT
      ?auto_10346 - SATELLITE
      ?auto_10345 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10341 ?auto_10338 ) ) ( not ( = ?auto_10343 ?auto_10338 ) ) ( not ( = ?auto_10343 ?auto_10341 ) ) ( ON_BOARD ?auto_10344 ?auto_10346 ) ( SUPPORTS ?auto_10344 ?auto_10339 ) ( POWER_ON ?auto_10344 ) ( POINTING ?auto_10346 ?auto_10345 ) ( not ( = ?auto_10338 ?auto_10345 ) ) ( HAVE_IMAGE ?auto_10343 ?auto_10342 ) ( not ( = ?auto_10343 ?auto_10345 ) ) ( not ( = ?auto_10342 ?auto_10339 ) ) ( CALIBRATION_TARGET ?auto_10344 ?auto_10345 ) ( NOT_CALIBRATED ?auto_10344 ) ( HAVE_IMAGE ?auto_10341 ?auto_10340 ) ( not ( = ?auto_10339 ?auto_10340 ) ) ( not ( = ?auto_10341 ?auto_10345 ) ) ( not ( = ?auto_10340 ?auto_10342 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10343 ?auto_10342 ?auto_10338 ?auto_10339 )
      ( GET-3IMAGE-VERIFY ?auto_10338 ?auto_10339 ?auto_10341 ?auto_10340 ?auto_10343 ?auto_10342 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_10400 - DIRECTION
      ?auto_10401 - MODE
    )
    :vars
    (
      ?auto_10403 - DIRECTION
      ?auto_10404 - INSTRUMENT
      ?auto_10406 - SATELLITE
      ?auto_10405 - DIRECTION
      ?auto_10402 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_10400 ?auto_10403 ) ) ( ON_BOARD ?auto_10404 ?auto_10406 ) ( SUPPORTS ?auto_10404 ?auto_10401 ) ( POINTING ?auto_10406 ?auto_10405 ) ( not ( = ?auto_10400 ?auto_10405 ) ) ( HAVE_IMAGE ?auto_10403 ?auto_10402 ) ( not ( = ?auto_10403 ?auto_10405 ) ) ( not ( = ?auto_10402 ?auto_10401 ) ) ( CALIBRATION_TARGET ?auto_10404 ?auto_10405 ) ( POWER_AVAIL ?auto_10406 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_10404 ?auto_10406 )
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
    ( and ( not ( = ?auto_10410 ?auto_10407 ) ) ( ON_BOARD ?auto_10411 ?auto_10413 ) ( SUPPORTS ?auto_10411 ?auto_10409 ) ( POINTING ?auto_10413 ?auto_10412 ) ( not ( = ?auto_10410 ?auto_10412 ) ) ( HAVE_IMAGE ?auto_10407 ?auto_10408 ) ( not ( = ?auto_10407 ?auto_10412 ) ) ( not ( = ?auto_10408 ?auto_10409 ) ) ( CALIBRATION_TARGET ?auto_10411 ?auto_10412 ) ( POWER_AVAIL ?auto_10413 ) )
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
      ?auto_10422 - DIRECTION
      ?auto_10419 - INSTRUMENT
      ?auto_10420 - SATELLITE
      ?auto_10418 - DIRECTION
      ?auto_10421 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_10417 ?auto_10414 ) ) ( not ( = ?auto_10417 ?auto_10422 ) ) ( ON_BOARD ?auto_10419 ?auto_10420 ) ( SUPPORTS ?auto_10419 ?auto_10416 ) ( POINTING ?auto_10420 ?auto_10418 ) ( not ( = ?auto_10417 ?auto_10418 ) ) ( HAVE_IMAGE ?auto_10422 ?auto_10421 ) ( not ( = ?auto_10422 ?auto_10418 ) ) ( not ( = ?auto_10421 ?auto_10416 ) ) ( CALIBRATION_TARGET ?auto_10419 ?auto_10418 ) ( POWER_AVAIL ?auto_10420 ) ( HAVE_IMAGE ?auto_10414 ?auto_10415 ) ( not ( = ?auto_10414 ?auto_10422 ) ) ( not ( = ?auto_10414 ?auto_10418 ) ) ( not ( = ?auto_10415 ?auto_10416 ) ) ( not ( = ?auto_10415 ?auto_10421 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10422 ?auto_10421 ?auto_10417 ?auto_10416 )
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
    ( and ( not ( = ?auto_10426 ?auto_10423 ) ) ( ON_BOARD ?auto_10428 ?auto_10429 ) ( SUPPORTS ?auto_10428 ?auto_10424 ) ( POINTING ?auto_10429 ?auto_10427 ) ( not ( = ?auto_10423 ?auto_10427 ) ) ( HAVE_IMAGE ?auto_10426 ?auto_10425 ) ( not ( = ?auto_10426 ?auto_10427 ) ) ( not ( = ?auto_10425 ?auto_10424 ) ) ( CALIBRATION_TARGET ?auto_10428 ?auto_10427 ) ( POWER_AVAIL ?auto_10429 ) )
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
      ?auto_10438 - DIRECTION
      ?auto_10435 - INSTRUMENT
      ?auto_10436 - SATELLITE
      ?auto_10434 - DIRECTION
      ?auto_10437 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_10433 ?auto_10430 ) ) ( not ( = ?auto_10430 ?auto_10438 ) ) ( ON_BOARD ?auto_10435 ?auto_10436 ) ( SUPPORTS ?auto_10435 ?auto_10431 ) ( POINTING ?auto_10436 ?auto_10434 ) ( not ( = ?auto_10430 ?auto_10434 ) ) ( HAVE_IMAGE ?auto_10438 ?auto_10437 ) ( not ( = ?auto_10438 ?auto_10434 ) ) ( not ( = ?auto_10437 ?auto_10431 ) ) ( CALIBRATION_TARGET ?auto_10435 ?auto_10434 ) ( POWER_AVAIL ?auto_10436 ) ( HAVE_IMAGE ?auto_10433 ?auto_10432 ) ( not ( = ?auto_10431 ?auto_10432 ) ) ( not ( = ?auto_10433 ?auto_10438 ) ) ( not ( = ?auto_10433 ?auto_10434 ) ) ( not ( = ?auto_10432 ?auto_10437 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10438 ?auto_10437 ?auto_10430 ?auto_10431 )
      ( GET-2IMAGE-VERIFY ?auto_10430 ?auto_10431 ?auto_10433 ?auto_10432 ) )
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
    ( and ( not ( = ?auto_10460 ?auto_10457 ) ) ( not ( = ?auto_10462 ?auto_10457 ) ) ( not ( = ?auto_10462 ?auto_10460 ) ) ( ON_BOARD ?auto_10464 ?auto_10465 ) ( SUPPORTS ?auto_10464 ?auto_10461 ) ( POINTING ?auto_10465 ?auto_10463 ) ( not ( = ?auto_10462 ?auto_10463 ) ) ( HAVE_IMAGE ?auto_10457 ?auto_10458 ) ( not ( = ?auto_10457 ?auto_10463 ) ) ( not ( = ?auto_10458 ?auto_10461 ) ) ( CALIBRATION_TARGET ?auto_10464 ?auto_10463 ) ( POWER_AVAIL ?auto_10465 ) ( HAVE_IMAGE ?auto_10460 ?auto_10459 ) ( not ( = ?auto_10458 ?auto_10459 ) ) ( not ( = ?auto_10460 ?auto_10463 ) ) ( not ( = ?auto_10459 ?auto_10461 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10457 ?auto_10458 ?auto_10462 ?auto_10461 )
      ( GET-3IMAGE-VERIFY ?auto_10457 ?auto_10458 ?auto_10460 ?auto_10459 ?auto_10462 ?auto_10461 ) )
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
    ( and ( not ( = ?auto_10478 ?auto_10475 ) ) ( not ( = ?auto_10480 ?auto_10475 ) ) ( not ( = ?auto_10480 ?auto_10478 ) ) ( ON_BOARD ?auto_10482 ?auto_10483 ) ( SUPPORTS ?auto_10482 ?auto_10477 ) ( POINTING ?auto_10483 ?auto_10481 ) ( not ( = ?auto_10478 ?auto_10481 ) ) ( HAVE_IMAGE ?auto_10475 ?auto_10476 ) ( not ( = ?auto_10475 ?auto_10481 ) ) ( not ( = ?auto_10476 ?auto_10477 ) ) ( CALIBRATION_TARGET ?auto_10482 ?auto_10481 ) ( POWER_AVAIL ?auto_10483 ) ( HAVE_IMAGE ?auto_10480 ?auto_10479 ) ( not ( = ?auto_10476 ?auto_10479 ) ) ( not ( = ?auto_10477 ?auto_10479 ) ) ( not ( = ?auto_10480 ?auto_10481 ) ) )
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
    ( and ( not ( = ?auto_10496 ?auto_10493 ) ) ( not ( = ?auto_10498 ?auto_10493 ) ) ( not ( = ?auto_10498 ?auto_10496 ) ) ( ON_BOARD ?auto_10500 ?auto_10501 ) ( SUPPORTS ?auto_10500 ?auto_10497 ) ( POINTING ?auto_10501 ?auto_10499 ) ( not ( = ?auto_10498 ?auto_10499 ) ) ( HAVE_IMAGE ?auto_10496 ?auto_10495 ) ( not ( = ?auto_10496 ?auto_10499 ) ) ( not ( = ?auto_10495 ?auto_10497 ) ) ( CALIBRATION_TARGET ?auto_10500 ?auto_10499 ) ( POWER_AVAIL ?auto_10501 ) ( HAVE_IMAGE ?auto_10493 ?auto_10494 ) ( not ( = ?auto_10493 ?auto_10499 ) ) ( not ( = ?auto_10494 ?auto_10495 ) ) ( not ( = ?auto_10494 ?auto_10497 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10496 ?auto_10495 ?auto_10498 ?auto_10497 )
      ( GET-3IMAGE-VERIFY ?auto_10493 ?auto_10494 ?auto_10496 ?auto_10495 ?auto_10498 ?auto_10497 ) )
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
    ( and ( not ( = ?auto_10516 ?auto_10513 ) ) ( not ( = ?auto_10518 ?auto_10513 ) ) ( not ( = ?auto_10518 ?auto_10516 ) ) ( ON_BOARD ?auto_10520 ?auto_10521 ) ( SUPPORTS ?auto_10520 ?auto_10515 ) ( POINTING ?auto_10521 ?auto_10519 ) ( not ( = ?auto_10516 ?auto_10519 ) ) ( HAVE_IMAGE ?auto_10518 ?auto_10517 ) ( not ( = ?auto_10518 ?auto_10519 ) ) ( not ( = ?auto_10517 ?auto_10515 ) ) ( CALIBRATION_TARGET ?auto_10520 ?auto_10519 ) ( POWER_AVAIL ?auto_10521 ) ( HAVE_IMAGE ?auto_10513 ?auto_10514 ) ( not ( = ?auto_10513 ?auto_10519 ) ) ( not ( = ?auto_10514 ?auto_10515 ) ) ( not ( = ?auto_10514 ?auto_10517 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10518 ?auto_10517 ?auto_10516 ?auto_10515 )
      ( GET-3IMAGE-VERIFY ?auto_10513 ?auto_10514 ?auto_10516 ?auto_10515 ?auto_10518 ?auto_10517 ) )
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
    ( and ( not ( = ?auto_10556 ?auto_10553 ) ) ( not ( = ?auto_10558 ?auto_10553 ) ) ( not ( = ?auto_10558 ?auto_10556 ) ) ( ON_BOARD ?auto_10560 ?auto_10561 ) ( SUPPORTS ?auto_10560 ?auto_10554 ) ( POINTING ?auto_10561 ?auto_10559 ) ( not ( = ?auto_10553 ?auto_10559 ) ) ( HAVE_IMAGE ?auto_10556 ?auto_10555 ) ( not ( = ?auto_10556 ?auto_10559 ) ) ( not ( = ?auto_10555 ?auto_10554 ) ) ( CALIBRATION_TARGET ?auto_10560 ?auto_10559 ) ( POWER_AVAIL ?auto_10561 ) ( HAVE_IMAGE ?auto_10558 ?auto_10557 ) ( not ( = ?auto_10554 ?auto_10557 ) ) ( not ( = ?auto_10555 ?auto_10557 ) ) ( not ( = ?auto_10558 ?auto_10559 ) ) )
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
    ( and ( not ( = ?auto_10574 ?auto_10571 ) ) ( not ( = ?auto_10576 ?auto_10571 ) ) ( not ( = ?auto_10576 ?auto_10574 ) ) ( ON_BOARD ?auto_10578 ?auto_10579 ) ( SUPPORTS ?auto_10578 ?auto_10572 ) ( POINTING ?auto_10579 ?auto_10577 ) ( not ( = ?auto_10571 ?auto_10577 ) ) ( HAVE_IMAGE ?auto_10576 ?auto_10575 ) ( not ( = ?auto_10576 ?auto_10577 ) ) ( not ( = ?auto_10575 ?auto_10572 ) ) ( CALIBRATION_TARGET ?auto_10578 ?auto_10577 ) ( POWER_AVAIL ?auto_10579 ) ( HAVE_IMAGE ?auto_10574 ?auto_10573 ) ( not ( = ?auto_10572 ?auto_10573 ) ) ( not ( = ?auto_10574 ?auto_10577 ) ) ( not ( = ?auto_10573 ?auto_10575 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10576 ?auto_10575 ?auto_10571 ?auto_10572 )
      ( GET-3IMAGE-VERIFY ?auto_10571 ?auto_10572 ?auto_10574 ?auto_10573 ?auto_10576 ?auto_10575 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_10633 - DIRECTION
      ?auto_10634 - MODE
    )
    :vars
    (
      ?auto_10639 - DIRECTION
      ?auto_10636 - INSTRUMENT
      ?auto_10637 - SATELLITE
      ?auto_10635 - DIRECTION
      ?auto_10638 - MODE
      ?auto_10640 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10633 ?auto_10639 ) ) ( ON_BOARD ?auto_10636 ?auto_10637 ) ( SUPPORTS ?auto_10636 ?auto_10634 ) ( not ( = ?auto_10633 ?auto_10635 ) ) ( HAVE_IMAGE ?auto_10639 ?auto_10638 ) ( not ( = ?auto_10639 ?auto_10635 ) ) ( not ( = ?auto_10638 ?auto_10634 ) ) ( CALIBRATION_TARGET ?auto_10636 ?auto_10635 ) ( POWER_AVAIL ?auto_10637 ) ( POINTING ?auto_10637 ?auto_10640 ) ( not ( = ?auto_10635 ?auto_10640 ) ) ( not ( = ?auto_10633 ?auto_10640 ) ) ( not ( = ?auto_10639 ?auto_10640 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_10637 ?auto_10635 ?auto_10640 )
      ( GET-2IMAGE ?auto_10639 ?auto_10638 ?auto_10633 ?auto_10634 )
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
      ?auto_10648 - INSTRUMENT
      ?auto_10645 - SATELLITE
      ?auto_10647 - DIRECTION
      ?auto_10646 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10644 ?auto_10641 ) ) ( ON_BOARD ?auto_10648 ?auto_10645 ) ( SUPPORTS ?auto_10648 ?auto_10643 ) ( not ( = ?auto_10644 ?auto_10647 ) ) ( HAVE_IMAGE ?auto_10641 ?auto_10642 ) ( not ( = ?auto_10641 ?auto_10647 ) ) ( not ( = ?auto_10642 ?auto_10643 ) ) ( CALIBRATION_TARGET ?auto_10648 ?auto_10647 ) ( POWER_AVAIL ?auto_10645 ) ( POINTING ?auto_10645 ?auto_10646 ) ( not ( = ?auto_10647 ?auto_10646 ) ) ( not ( = ?auto_10644 ?auto_10646 ) ) ( not ( = ?auto_10641 ?auto_10646 ) ) )
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
      ?auto_10656 - DIRECTION
      ?auto_10653 - INSTRUMENT
      ?auto_10654 - SATELLITE
      ?auto_10657 - DIRECTION
      ?auto_10655 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_10652 ?auto_10649 ) ) ( not ( = ?auto_10652 ?auto_10656 ) ) ( ON_BOARD ?auto_10653 ?auto_10654 ) ( SUPPORTS ?auto_10653 ?auto_10651 ) ( not ( = ?auto_10652 ?auto_10657 ) ) ( HAVE_IMAGE ?auto_10656 ?auto_10655 ) ( not ( = ?auto_10656 ?auto_10657 ) ) ( not ( = ?auto_10655 ?auto_10651 ) ) ( CALIBRATION_TARGET ?auto_10653 ?auto_10657 ) ( POWER_AVAIL ?auto_10654 ) ( POINTING ?auto_10654 ?auto_10649 ) ( not ( = ?auto_10657 ?auto_10649 ) ) ( not ( = ?auto_10656 ?auto_10649 ) ) ( HAVE_IMAGE ?auto_10649 ?auto_10650 ) ( not ( = ?auto_10650 ?auto_10651 ) ) ( not ( = ?auto_10650 ?auto_10655 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10656 ?auto_10655 ?auto_10652 ?auto_10651 )
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
      ?auto_10662 - INSTRUMENT
      ?auto_10663 - SATELLITE
      ?auto_10665 - DIRECTION
      ?auto_10664 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10661 ?auto_10658 ) ) ( ON_BOARD ?auto_10662 ?auto_10663 ) ( SUPPORTS ?auto_10662 ?auto_10659 ) ( not ( = ?auto_10658 ?auto_10665 ) ) ( HAVE_IMAGE ?auto_10661 ?auto_10660 ) ( not ( = ?auto_10661 ?auto_10665 ) ) ( not ( = ?auto_10660 ?auto_10659 ) ) ( CALIBRATION_TARGET ?auto_10662 ?auto_10665 ) ( POWER_AVAIL ?auto_10663 ) ( POINTING ?auto_10663 ?auto_10664 ) ( not ( = ?auto_10665 ?auto_10664 ) ) ( not ( = ?auto_10658 ?auto_10664 ) ) ( not ( = ?auto_10661 ?auto_10664 ) ) )
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
      ?auto_10673 - DIRECTION
      ?auto_10670 - INSTRUMENT
      ?auto_10671 - SATELLITE
      ?auto_10674 - DIRECTION
      ?auto_10672 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_10669 ?auto_10666 ) ) ( not ( = ?auto_10666 ?auto_10673 ) ) ( ON_BOARD ?auto_10670 ?auto_10671 ) ( SUPPORTS ?auto_10670 ?auto_10667 ) ( not ( = ?auto_10666 ?auto_10674 ) ) ( HAVE_IMAGE ?auto_10673 ?auto_10672 ) ( not ( = ?auto_10673 ?auto_10674 ) ) ( not ( = ?auto_10672 ?auto_10667 ) ) ( CALIBRATION_TARGET ?auto_10670 ?auto_10674 ) ( POWER_AVAIL ?auto_10671 ) ( POINTING ?auto_10671 ?auto_10669 ) ( not ( = ?auto_10674 ?auto_10669 ) ) ( not ( = ?auto_10673 ?auto_10669 ) ) ( HAVE_IMAGE ?auto_10669 ?auto_10668 ) ( not ( = ?auto_10667 ?auto_10668 ) ) ( not ( = ?auto_10668 ?auto_10672 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10673 ?auto_10672 ?auto_10666 ?auto_10667 )
      ( GET-2IMAGE-VERIFY ?auto_10666 ?auto_10667 ?auto_10669 ?auto_10668 ) )
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
      ?auto_10701 - INSTRUMENT
      ?auto_10702 - SATELLITE
      ?auto_10703 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10698 ?auto_10695 ) ) ( not ( = ?auto_10700 ?auto_10695 ) ) ( not ( = ?auto_10700 ?auto_10698 ) ) ( ON_BOARD ?auto_10701 ?auto_10702 ) ( SUPPORTS ?auto_10701 ?auto_10699 ) ( not ( = ?auto_10700 ?auto_10703 ) ) ( HAVE_IMAGE ?auto_10695 ?auto_10696 ) ( not ( = ?auto_10695 ?auto_10703 ) ) ( not ( = ?auto_10696 ?auto_10699 ) ) ( CALIBRATION_TARGET ?auto_10701 ?auto_10703 ) ( POWER_AVAIL ?auto_10702 ) ( POINTING ?auto_10702 ?auto_10698 ) ( not ( = ?auto_10703 ?auto_10698 ) ) ( HAVE_IMAGE ?auto_10698 ?auto_10697 ) ( not ( = ?auto_10696 ?auto_10697 ) ) ( not ( = ?auto_10697 ?auto_10699 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10695 ?auto_10696 ?auto_10700 ?auto_10699 )
      ( GET-3IMAGE-VERIFY ?auto_10695 ?auto_10696 ?auto_10698 ?auto_10697 ?auto_10700 ?auto_10699 ) )
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
      ?auto_10720 - INSTRUMENT
      ?auto_10721 - SATELLITE
      ?auto_10722 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10717 ?auto_10714 ) ) ( not ( = ?auto_10719 ?auto_10714 ) ) ( not ( = ?auto_10719 ?auto_10717 ) ) ( ON_BOARD ?auto_10720 ?auto_10721 ) ( SUPPORTS ?auto_10720 ?auto_10716 ) ( not ( = ?auto_10717 ?auto_10722 ) ) ( HAVE_IMAGE ?auto_10714 ?auto_10715 ) ( not ( = ?auto_10714 ?auto_10722 ) ) ( not ( = ?auto_10715 ?auto_10716 ) ) ( CALIBRATION_TARGET ?auto_10720 ?auto_10722 ) ( POWER_AVAIL ?auto_10721 ) ( POINTING ?auto_10721 ?auto_10719 ) ( not ( = ?auto_10722 ?auto_10719 ) ) ( HAVE_IMAGE ?auto_10719 ?auto_10718 ) ( not ( = ?auto_10715 ?auto_10718 ) ) ( not ( = ?auto_10716 ?auto_10718 ) ) )
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
      ?auto_10739 - INSTRUMENT
      ?auto_10740 - SATELLITE
      ?auto_10741 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10736 ?auto_10733 ) ) ( not ( = ?auto_10738 ?auto_10733 ) ) ( not ( = ?auto_10738 ?auto_10736 ) ) ( ON_BOARD ?auto_10739 ?auto_10740 ) ( SUPPORTS ?auto_10739 ?auto_10737 ) ( not ( = ?auto_10738 ?auto_10741 ) ) ( HAVE_IMAGE ?auto_10736 ?auto_10735 ) ( not ( = ?auto_10736 ?auto_10741 ) ) ( not ( = ?auto_10735 ?auto_10737 ) ) ( CALIBRATION_TARGET ?auto_10739 ?auto_10741 ) ( POWER_AVAIL ?auto_10740 ) ( POINTING ?auto_10740 ?auto_10733 ) ( not ( = ?auto_10741 ?auto_10733 ) ) ( HAVE_IMAGE ?auto_10733 ?auto_10734 ) ( not ( = ?auto_10734 ?auto_10735 ) ) ( not ( = ?auto_10734 ?auto_10737 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10736 ?auto_10735 ?auto_10738 ?auto_10737 )
      ( GET-3IMAGE-VERIFY ?auto_10733 ?auto_10734 ?auto_10736 ?auto_10735 ?auto_10738 ?auto_10737 ) )
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
      ?auto_10759 - INSTRUMENT
      ?auto_10760 - SATELLITE
      ?auto_10761 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10756 ?auto_10753 ) ) ( not ( = ?auto_10758 ?auto_10753 ) ) ( not ( = ?auto_10758 ?auto_10756 ) ) ( ON_BOARD ?auto_10759 ?auto_10760 ) ( SUPPORTS ?auto_10759 ?auto_10755 ) ( not ( = ?auto_10756 ?auto_10761 ) ) ( HAVE_IMAGE ?auto_10758 ?auto_10757 ) ( not ( = ?auto_10758 ?auto_10761 ) ) ( not ( = ?auto_10757 ?auto_10755 ) ) ( CALIBRATION_TARGET ?auto_10759 ?auto_10761 ) ( POWER_AVAIL ?auto_10760 ) ( POINTING ?auto_10760 ?auto_10753 ) ( not ( = ?auto_10761 ?auto_10753 ) ) ( HAVE_IMAGE ?auto_10753 ?auto_10754 ) ( not ( = ?auto_10754 ?auto_10755 ) ) ( not ( = ?auto_10754 ?auto_10757 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10758 ?auto_10757 ?auto_10756 ?auto_10755 )
      ( GET-3IMAGE-VERIFY ?auto_10753 ?auto_10754 ?auto_10756 ?auto_10755 ?auto_10758 ?auto_10757 ) )
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
      ?auto_10800 - INSTRUMENT
      ?auto_10801 - SATELLITE
      ?auto_10802 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10797 ?auto_10794 ) ) ( not ( = ?auto_10799 ?auto_10794 ) ) ( not ( = ?auto_10799 ?auto_10797 ) ) ( ON_BOARD ?auto_10800 ?auto_10801 ) ( SUPPORTS ?auto_10800 ?auto_10795 ) ( not ( = ?auto_10794 ?auto_10802 ) ) ( HAVE_IMAGE ?auto_10797 ?auto_10796 ) ( not ( = ?auto_10797 ?auto_10802 ) ) ( not ( = ?auto_10796 ?auto_10795 ) ) ( CALIBRATION_TARGET ?auto_10800 ?auto_10802 ) ( POWER_AVAIL ?auto_10801 ) ( POINTING ?auto_10801 ?auto_10799 ) ( not ( = ?auto_10802 ?auto_10799 ) ) ( HAVE_IMAGE ?auto_10799 ?auto_10798 ) ( not ( = ?auto_10795 ?auto_10798 ) ) ( not ( = ?auto_10796 ?auto_10798 ) ) )
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
      ?auto_10819 - INSTRUMENT
      ?auto_10820 - SATELLITE
      ?auto_10821 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10816 ?auto_10813 ) ) ( not ( = ?auto_10818 ?auto_10813 ) ) ( not ( = ?auto_10818 ?auto_10816 ) ) ( ON_BOARD ?auto_10819 ?auto_10820 ) ( SUPPORTS ?auto_10819 ?auto_10814 ) ( not ( = ?auto_10813 ?auto_10821 ) ) ( HAVE_IMAGE ?auto_10818 ?auto_10817 ) ( not ( = ?auto_10818 ?auto_10821 ) ) ( not ( = ?auto_10817 ?auto_10814 ) ) ( CALIBRATION_TARGET ?auto_10819 ?auto_10821 ) ( POWER_AVAIL ?auto_10820 ) ( POINTING ?auto_10820 ?auto_10816 ) ( not ( = ?auto_10821 ?auto_10816 ) ) ( HAVE_IMAGE ?auto_10816 ?auto_10815 ) ( not ( = ?auto_10814 ?auto_10815 ) ) ( not ( = ?auto_10815 ?auto_10817 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10818 ?auto_10817 ?auto_10813 ?auto_10814 )
      ( GET-3IMAGE-VERIFY ?auto_10813 ?auto_10814 ?auto_10816 ?auto_10815 ?auto_10818 ?auto_10817 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_10877 - DIRECTION
      ?auto_10878 - MODE
    )
    :vars
    (
      ?auto_10882 - DIRECTION
      ?auto_10879 - INSTRUMENT
      ?auto_10880 - SATELLITE
      ?auto_10884 - DIRECTION
      ?auto_10881 - MODE
      ?auto_10883 - DIRECTION
      ?auto_10885 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_10877 ?auto_10882 ) ) ( ON_BOARD ?auto_10879 ?auto_10880 ) ( SUPPORTS ?auto_10879 ?auto_10878 ) ( not ( = ?auto_10877 ?auto_10884 ) ) ( HAVE_IMAGE ?auto_10882 ?auto_10881 ) ( not ( = ?auto_10882 ?auto_10884 ) ) ( not ( = ?auto_10881 ?auto_10878 ) ) ( CALIBRATION_TARGET ?auto_10879 ?auto_10884 ) ( POINTING ?auto_10880 ?auto_10883 ) ( not ( = ?auto_10884 ?auto_10883 ) ) ( not ( = ?auto_10877 ?auto_10883 ) ) ( not ( = ?auto_10882 ?auto_10883 ) ) ( ON_BOARD ?auto_10885 ?auto_10880 ) ( POWER_ON ?auto_10885 ) ( not ( = ?auto_10879 ?auto_10885 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_10885 ?auto_10880 )
      ( GET-2IMAGE ?auto_10882 ?auto_10881 ?auto_10877 ?auto_10878 )
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
      ?auto_10893 - INSTRUMENT
      ?auto_10891 - SATELLITE
      ?auto_10890 - DIRECTION
      ?auto_10892 - DIRECTION
      ?auto_10894 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_10889 ?auto_10886 ) ) ( ON_BOARD ?auto_10893 ?auto_10891 ) ( SUPPORTS ?auto_10893 ?auto_10888 ) ( not ( = ?auto_10889 ?auto_10890 ) ) ( HAVE_IMAGE ?auto_10886 ?auto_10887 ) ( not ( = ?auto_10886 ?auto_10890 ) ) ( not ( = ?auto_10887 ?auto_10888 ) ) ( CALIBRATION_TARGET ?auto_10893 ?auto_10890 ) ( POINTING ?auto_10891 ?auto_10892 ) ( not ( = ?auto_10890 ?auto_10892 ) ) ( not ( = ?auto_10889 ?auto_10892 ) ) ( not ( = ?auto_10886 ?auto_10892 ) ) ( ON_BOARD ?auto_10894 ?auto_10891 ) ( POWER_ON ?auto_10894 ) ( not ( = ?auto_10893 ?auto_10894 ) ) )
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
      ?auto_10904 - DIRECTION
      ?auto_10900 - INSTRUMENT
      ?auto_10901 - SATELLITE
      ?auto_10899 - DIRECTION
      ?auto_10903 - MODE
      ?auto_10902 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_10898 ?auto_10895 ) ) ( not ( = ?auto_10898 ?auto_10904 ) ) ( ON_BOARD ?auto_10900 ?auto_10901 ) ( SUPPORTS ?auto_10900 ?auto_10897 ) ( not ( = ?auto_10898 ?auto_10899 ) ) ( HAVE_IMAGE ?auto_10904 ?auto_10903 ) ( not ( = ?auto_10904 ?auto_10899 ) ) ( not ( = ?auto_10903 ?auto_10897 ) ) ( CALIBRATION_TARGET ?auto_10900 ?auto_10899 ) ( POINTING ?auto_10901 ?auto_10895 ) ( not ( = ?auto_10899 ?auto_10895 ) ) ( not ( = ?auto_10904 ?auto_10895 ) ) ( ON_BOARD ?auto_10902 ?auto_10901 ) ( POWER_ON ?auto_10902 ) ( not ( = ?auto_10900 ?auto_10902 ) ) ( HAVE_IMAGE ?auto_10895 ?auto_10896 ) ( not ( = ?auto_10896 ?auto_10897 ) ) ( not ( = ?auto_10896 ?auto_10903 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10904 ?auto_10903 ?auto_10898 ?auto_10897 )
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
      ?auto_10910 - INSTRUMENT
      ?auto_10912 - SATELLITE
      ?auto_10909 - DIRECTION
      ?auto_10911 - DIRECTION
      ?auto_10913 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_10908 ?auto_10905 ) ) ( ON_BOARD ?auto_10910 ?auto_10912 ) ( SUPPORTS ?auto_10910 ?auto_10906 ) ( not ( = ?auto_10905 ?auto_10909 ) ) ( HAVE_IMAGE ?auto_10908 ?auto_10907 ) ( not ( = ?auto_10908 ?auto_10909 ) ) ( not ( = ?auto_10907 ?auto_10906 ) ) ( CALIBRATION_TARGET ?auto_10910 ?auto_10909 ) ( POINTING ?auto_10912 ?auto_10911 ) ( not ( = ?auto_10909 ?auto_10911 ) ) ( not ( = ?auto_10905 ?auto_10911 ) ) ( not ( = ?auto_10908 ?auto_10911 ) ) ( ON_BOARD ?auto_10913 ?auto_10912 ) ( POWER_ON ?auto_10913 ) ( not ( = ?auto_10910 ?auto_10913 ) ) )
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
      ?auto_10923 - DIRECTION
      ?auto_10919 - INSTRUMENT
      ?auto_10920 - SATELLITE
      ?auto_10918 - DIRECTION
      ?auto_10922 - MODE
      ?auto_10921 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_10917 ?auto_10914 ) ) ( not ( = ?auto_10914 ?auto_10923 ) ) ( ON_BOARD ?auto_10919 ?auto_10920 ) ( SUPPORTS ?auto_10919 ?auto_10915 ) ( not ( = ?auto_10914 ?auto_10918 ) ) ( HAVE_IMAGE ?auto_10923 ?auto_10922 ) ( not ( = ?auto_10923 ?auto_10918 ) ) ( not ( = ?auto_10922 ?auto_10915 ) ) ( CALIBRATION_TARGET ?auto_10919 ?auto_10918 ) ( POINTING ?auto_10920 ?auto_10917 ) ( not ( = ?auto_10918 ?auto_10917 ) ) ( not ( = ?auto_10923 ?auto_10917 ) ) ( ON_BOARD ?auto_10921 ?auto_10920 ) ( POWER_ON ?auto_10921 ) ( not ( = ?auto_10919 ?auto_10921 ) ) ( HAVE_IMAGE ?auto_10917 ?auto_10916 ) ( not ( = ?auto_10915 ?auto_10916 ) ) ( not ( = ?auto_10916 ?auto_10922 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10923 ?auto_10922 ?auto_10914 ?auto_10915 )
      ( GET-2IMAGE-VERIFY ?auto_10914 ?auto_10915 ?auto_10917 ?auto_10916 ) )
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
    ( and ( not ( = ?auto_10949 ?auto_10946 ) ) ( not ( = ?auto_10951 ?auto_10946 ) ) ( not ( = ?auto_10951 ?auto_10949 ) ) ( ON_BOARD ?auto_10953 ?auto_10954 ) ( SUPPORTS ?auto_10953 ?auto_10950 ) ( not ( = ?auto_10951 ?auto_10952 ) ) ( HAVE_IMAGE ?auto_10946 ?auto_10947 ) ( not ( = ?auto_10946 ?auto_10952 ) ) ( not ( = ?auto_10947 ?auto_10950 ) ) ( CALIBRATION_TARGET ?auto_10953 ?auto_10952 ) ( POINTING ?auto_10954 ?auto_10949 ) ( not ( = ?auto_10952 ?auto_10949 ) ) ( ON_BOARD ?auto_10955 ?auto_10954 ) ( POWER_ON ?auto_10955 ) ( not ( = ?auto_10953 ?auto_10955 ) ) ( HAVE_IMAGE ?auto_10949 ?auto_10948 ) ( not ( = ?auto_10947 ?auto_10948 ) ) ( not ( = ?auto_10948 ?auto_10950 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10946 ?auto_10947 ?auto_10951 ?auto_10950 )
      ( GET-3IMAGE-VERIFY ?auto_10946 ?auto_10947 ?auto_10949 ?auto_10948 ?auto_10951 ?auto_10950 ) )
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
    ( and ( not ( = ?auto_10970 ?auto_10967 ) ) ( not ( = ?auto_10972 ?auto_10967 ) ) ( not ( = ?auto_10972 ?auto_10970 ) ) ( ON_BOARD ?auto_10974 ?auto_10975 ) ( SUPPORTS ?auto_10974 ?auto_10969 ) ( not ( = ?auto_10970 ?auto_10973 ) ) ( HAVE_IMAGE ?auto_10967 ?auto_10968 ) ( not ( = ?auto_10967 ?auto_10973 ) ) ( not ( = ?auto_10968 ?auto_10969 ) ) ( CALIBRATION_TARGET ?auto_10974 ?auto_10973 ) ( POINTING ?auto_10975 ?auto_10972 ) ( not ( = ?auto_10973 ?auto_10972 ) ) ( ON_BOARD ?auto_10976 ?auto_10975 ) ( POWER_ON ?auto_10976 ) ( not ( = ?auto_10974 ?auto_10976 ) ) ( HAVE_IMAGE ?auto_10972 ?auto_10971 ) ( not ( = ?auto_10968 ?auto_10971 ) ) ( not ( = ?auto_10969 ?auto_10971 ) ) )
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
    ( and ( not ( = ?auto_10991 ?auto_10988 ) ) ( not ( = ?auto_10993 ?auto_10988 ) ) ( not ( = ?auto_10993 ?auto_10991 ) ) ( ON_BOARD ?auto_10995 ?auto_10996 ) ( SUPPORTS ?auto_10995 ?auto_10992 ) ( not ( = ?auto_10993 ?auto_10994 ) ) ( HAVE_IMAGE ?auto_10991 ?auto_10990 ) ( not ( = ?auto_10991 ?auto_10994 ) ) ( not ( = ?auto_10990 ?auto_10992 ) ) ( CALIBRATION_TARGET ?auto_10995 ?auto_10994 ) ( POINTING ?auto_10996 ?auto_10988 ) ( not ( = ?auto_10994 ?auto_10988 ) ) ( ON_BOARD ?auto_10997 ?auto_10996 ) ( POWER_ON ?auto_10997 ) ( not ( = ?auto_10995 ?auto_10997 ) ) ( HAVE_IMAGE ?auto_10988 ?auto_10989 ) ( not ( = ?auto_10989 ?auto_10990 ) ) ( not ( = ?auto_10989 ?auto_10992 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_10991 ?auto_10990 ?auto_10993 ?auto_10992 )
      ( GET-3IMAGE-VERIFY ?auto_10988 ?auto_10989 ?auto_10991 ?auto_10990 ?auto_10993 ?auto_10992 ) )
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
    ( and ( not ( = ?auto_11013 ?auto_11010 ) ) ( not ( = ?auto_11015 ?auto_11010 ) ) ( not ( = ?auto_11015 ?auto_11013 ) ) ( ON_BOARD ?auto_11017 ?auto_11018 ) ( SUPPORTS ?auto_11017 ?auto_11012 ) ( not ( = ?auto_11013 ?auto_11016 ) ) ( HAVE_IMAGE ?auto_11015 ?auto_11014 ) ( not ( = ?auto_11015 ?auto_11016 ) ) ( not ( = ?auto_11014 ?auto_11012 ) ) ( CALIBRATION_TARGET ?auto_11017 ?auto_11016 ) ( POINTING ?auto_11018 ?auto_11010 ) ( not ( = ?auto_11016 ?auto_11010 ) ) ( ON_BOARD ?auto_11019 ?auto_11018 ) ( POWER_ON ?auto_11019 ) ( not ( = ?auto_11017 ?auto_11019 ) ) ( HAVE_IMAGE ?auto_11010 ?auto_11011 ) ( not ( = ?auto_11011 ?auto_11012 ) ) ( not ( = ?auto_11011 ?auto_11014 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11015 ?auto_11014 ?auto_11013 ?auto_11012 )
      ( GET-3IMAGE-VERIFY ?auto_11010 ?auto_11011 ?auto_11013 ?auto_11012 ?auto_11015 ?auto_11014 ) )
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
    ( and ( not ( = ?auto_11058 ?auto_11055 ) ) ( not ( = ?auto_11060 ?auto_11055 ) ) ( not ( = ?auto_11060 ?auto_11058 ) ) ( ON_BOARD ?auto_11062 ?auto_11063 ) ( SUPPORTS ?auto_11062 ?auto_11056 ) ( not ( = ?auto_11055 ?auto_11061 ) ) ( HAVE_IMAGE ?auto_11058 ?auto_11057 ) ( not ( = ?auto_11058 ?auto_11061 ) ) ( not ( = ?auto_11057 ?auto_11056 ) ) ( CALIBRATION_TARGET ?auto_11062 ?auto_11061 ) ( POINTING ?auto_11063 ?auto_11060 ) ( not ( = ?auto_11061 ?auto_11060 ) ) ( ON_BOARD ?auto_11064 ?auto_11063 ) ( POWER_ON ?auto_11064 ) ( not ( = ?auto_11062 ?auto_11064 ) ) ( HAVE_IMAGE ?auto_11060 ?auto_11059 ) ( not ( = ?auto_11056 ?auto_11059 ) ) ( not ( = ?auto_11057 ?auto_11059 ) ) )
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
    ( and ( not ( = ?auto_11079 ?auto_11076 ) ) ( not ( = ?auto_11081 ?auto_11076 ) ) ( not ( = ?auto_11081 ?auto_11079 ) ) ( ON_BOARD ?auto_11083 ?auto_11084 ) ( SUPPORTS ?auto_11083 ?auto_11077 ) ( not ( = ?auto_11076 ?auto_11082 ) ) ( HAVE_IMAGE ?auto_11081 ?auto_11080 ) ( not ( = ?auto_11081 ?auto_11082 ) ) ( not ( = ?auto_11080 ?auto_11077 ) ) ( CALIBRATION_TARGET ?auto_11083 ?auto_11082 ) ( POINTING ?auto_11084 ?auto_11079 ) ( not ( = ?auto_11082 ?auto_11079 ) ) ( ON_BOARD ?auto_11085 ?auto_11084 ) ( POWER_ON ?auto_11085 ) ( not ( = ?auto_11083 ?auto_11085 ) ) ( HAVE_IMAGE ?auto_11079 ?auto_11078 ) ( not ( = ?auto_11077 ?auto_11078 ) ) ( not ( = ?auto_11078 ?auto_11080 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11081 ?auto_11080 ?auto_11076 ?auto_11077 )
      ( GET-3IMAGE-VERIFY ?auto_11076 ?auto_11077 ?auto_11079 ?auto_11078 ?auto_11081 ?auto_11080 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_11146 - DIRECTION
      ?auto_11147 - MODE
    )
    :vars
    (
      ?auto_11154 - DIRECTION
      ?auto_11149 - INSTRUMENT
      ?auto_11151 - SATELLITE
      ?auto_11148 - DIRECTION
      ?auto_11153 - MODE
      ?auto_11150 - DIRECTION
      ?auto_11152 - INSTRUMENT
      ?auto_11155 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_11146 ?auto_11154 ) ) ( ON_BOARD ?auto_11149 ?auto_11151 ) ( SUPPORTS ?auto_11149 ?auto_11147 ) ( not ( = ?auto_11146 ?auto_11148 ) ) ( HAVE_IMAGE ?auto_11154 ?auto_11153 ) ( not ( = ?auto_11154 ?auto_11148 ) ) ( not ( = ?auto_11153 ?auto_11147 ) ) ( CALIBRATION_TARGET ?auto_11149 ?auto_11148 ) ( POINTING ?auto_11151 ?auto_11150 ) ( not ( = ?auto_11148 ?auto_11150 ) ) ( not ( = ?auto_11146 ?auto_11150 ) ) ( not ( = ?auto_11154 ?auto_11150 ) ) ( ON_BOARD ?auto_11152 ?auto_11151 ) ( POWER_ON ?auto_11152 ) ( not ( = ?auto_11149 ?auto_11152 ) ) ( CALIBRATED ?auto_11152 ) ( SUPPORTS ?auto_11152 ?auto_11155 ) ( not ( = ?auto_11153 ?auto_11155 ) ) ( not ( = ?auto_11147 ?auto_11155 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11154 ?auto_11153 ?auto_11150 ?auto_11155 )
      ( GET-2IMAGE ?auto_11154 ?auto_11153 ?auto_11146 ?auto_11147 )
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
      ?auto_11162 - INSTRUMENT
      ?auto_11165 - SATELLITE
      ?auto_11163 - DIRECTION
      ?auto_11164 - DIRECTION
      ?auto_11161 - INSTRUMENT
      ?auto_11160 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_11159 ?auto_11156 ) ) ( ON_BOARD ?auto_11162 ?auto_11165 ) ( SUPPORTS ?auto_11162 ?auto_11158 ) ( not ( = ?auto_11159 ?auto_11163 ) ) ( HAVE_IMAGE ?auto_11156 ?auto_11157 ) ( not ( = ?auto_11156 ?auto_11163 ) ) ( not ( = ?auto_11157 ?auto_11158 ) ) ( CALIBRATION_TARGET ?auto_11162 ?auto_11163 ) ( POINTING ?auto_11165 ?auto_11164 ) ( not ( = ?auto_11163 ?auto_11164 ) ) ( not ( = ?auto_11159 ?auto_11164 ) ) ( not ( = ?auto_11156 ?auto_11164 ) ) ( ON_BOARD ?auto_11161 ?auto_11165 ) ( POWER_ON ?auto_11161 ) ( not ( = ?auto_11162 ?auto_11161 ) ) ( CALIBRATED ?auto_11161 ) ( SUPPORTS ?auto_11161 ?auto_11160 ) ( not ( = ?auto_11157 ?auto_11160 ) ) ( not ( = ?auto_11158 ?auto_11160 ) ) )
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
      ?auto_11171 - DIRECTION
      ?auto_11172 - INSTRUMENT
      ?auto_11174 - SATELLITE
      ?auto_11175 - DIRECTION
      ?auto_11170 - MODE
      ?auto_11173 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11169 ?auto_11166 ) ) ( not ( = ?auto_11169 ?auto_11171 ) ) ( ON_BOARD ?auto_11172 ?auto_11174 ) ( SUPPORTS ?auto_11172 ?auto_11168 ) ( not ( = ?auto_11169 ?auto_11175 ) ) ( HAVE_IMAGE ?auto_11171 ?auto_11170 ) ( not ( = ?auto_11171 ?auto_11175 ) ) ( not ( = ?auto_11170 ?auto_11168 ) ) ( CALIBRATION_TARGET ?auto_11172 ?auto_11175 ) ( POINTING ?auto_11174 ?auto_11166 ) ( not ( = ?auto_11175 ?auto_11166 ) ) ( not ( = ?auto_11171 ?auto_11166 ) ) ( ON_BOARD ?auto_11173 ?auto_11174 ) ( POWER_ON ?auto_11173 ) ( not ( = ?auto_11172 ?auto_11173 ) ) ( CALIBRATED ?auto_11173 ) ( SUPPORTS ?auto_11173 ?auto_11167 ) ( not ( = ?auto_11170 ?auto_11167 ) ) ( not ( = ?auto_11168 ?auto_11167 ) ) )
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
      ?auto_11181 - INSTRUMENT
      ?auto_11183 - SATELLITE
      ?auto_11185 - DIRECTION
      ?auto_11180 - DIRECTION
      ?auto_11182 - INSTRUMENT
      ?auto_11184 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_11179 ?auto_11176 ) ) ( ON_BOARD ?auto_11181 ?auto_11183 ) ( SUPPORTS ?auto_11181 ?auto_11177 ) ( not ( = ?auto_11176 ?auto_11185 ) ) ( HAVE_IMAGE ?auto_11179 ?auto_11178 ) ( not ( = ?auto_11179 ?auto_11185 ) ) ( not ( = ?auto_11178 ?auto_11177 ) ) ( CALIBRATION_TARGET ?auto_11181 ?auto_11185 ) ( POINTING ?auto_11183 ?auto_11180 ) ( not ( = ?auto_11185 ?auto_11180 ) ) ( not ( = ?auto_11176 ?auto_11180 ) ) ( not ( = ?auto_11179 ?auto_11180 ) ) ( ON_BOARD ?auto_11182 ?auto_11183 ) ( POWER_ON ?auto_11182 ) ( not ( = ?auto_11181 ?auto_11182 ) ) ( CALIBRATED ?auto_11182 ) ( SUPPORTS ?auto_11182 ?auto_11184 ) ( not ( = ?auto_11178 ?auto_11184 ) ) ( not ( = ?auto_11177 ?auto_11184 ) ) )
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
      ?auto_11191 - DIRECTION
      ?auto_11192 - INSTRUMENT
      ?auto_11194 - SATELLITE
      ?auto_11195 - DIRECTION
      ?auto_11190 - MODE
      ?auto_11193 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11189 ?auto_11186 ) ) ( not ( = ?auto_11186 ?auto_11191 ) ) ( ON_BOARD ?auto_11192 ?auto_11194 ) ( SUPPORTS ?auto_11192 ?auto_11187 ) ( not ( = ?auto_11186 ?auto_11195 ) ) ( HAVE_IMAGE ?auto_11191 ?auto_11190 ) ( not ( = ?auto_11191 ?auto_11195 ) ) ( not ( = ?auto_11190 ?auto_11187 ) ) ( CALIBRATION_TARGET ?auto_11192 ?auto_11195 ) ( POINTING ?auto_11194 ?auto_11189 ) ( not ( = ?auto_11195 ?auto_11189 ) ) ( not ( = ?auto_11191 ?auto_11189 ) ) ( ON_BOARD ?auto_11193 ?auto_11194 ) ( POWER_ON ?auto_11193 ) ( not ( = ?auto_11192 ?auto_11193 ) ) ( CALIBRATED ?auto_11193 ) ( SUPPORTS ?auto_11193 ?auto_11188 ) ( not ( = ?auto_11190 ?auto_11188 ) ) ( not ( = ?auto_11187 ?auto_11188 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11191 ?auto_11190 ?auto_11186 ?auto_11187 )
      ( GET-2IMAGE-VERIFY ?auto_11186 ?auto_11187 ?auto_11189 ?auto_11188 ) )
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
      ?auto_11226 - INSTRUMENT
      ?auto_11228 - SATELLITE
      ?auto_11229 - DIRECTION
      ?auto_11227 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11223 ?auto_11220 ) ) ( not ( = ?auto_11225 ?auto_11220 ) ) ( not ( = ?auto_11225 ?auto_11223 ) ) ( ON_BOARD ?auto_11226 ?auto_11228 ) ( SUPPORTS ?auto_11226 ?auto_11224 ) ( not ( = ?auto_11225 ?auto_11229 ) ) ( HAVE_IMAGE ?auto_11220 ?auto_11221 ) ( not ( = ?auto_11220 ?auto_11229 ) ) ( not ( = ?auto_11221 ?auto_11224 ) ) ( CALIBRATION_TARGET ?auto_11226 ?auto_11229 ) ( POINTING ?auto_11228 ?auto_11223 ) ( not ( = ?auto_11229 ?auto_11223 ) ) ( ON_BOARD ?auto_11227 ?auto_11228 ) ( POWER_ON ?auto_11227 ) ( not ( = ?auto_11226 ?auto_11227 ) ) ( CALIBRATED ?auto_11227 ) ( SUPPORTS ?auto_11227 ?auto_11222 ) ( not ( = ?auto_11221 ?auto_11222 ) ) ( not ( = ?auto_11224 ?auto_11222 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11220 ?auto_11221 ?auto_11225 ?auto_11224 )
      ( GET-3IMAGE-VERIFY ?auto_11220 ?auto_11221 ?auto_11223 ?auto_11222 ?auto_11225 ?auto_11224 ) )
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
      ?auto_11248 - INSTRUMENT
      ?auto_11250 - SATELLITE
      ?auto_11251 - DIRECTION
      ?auto_11249 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11245 ?auto_11242 ) ) ( not ( = ?auto_11247 ?auto_11242 ) ) ( not ( = ?auto_11247 ?auto_11245 ) ) ( ON_BOARD ?auto_11248 ?auto_11250 ) ( SUPPORTS ?auto_11248 ?auto_11244 ) ( not ( = ?auto_11245 ?auto_11251 ) ) ( HAVE_IMAGE ?auto_11242 ?auto_11243 ) ( not ( = ?auto_11242 ?auto_11251 ) ) ( not ( = ?auto_11243 ?auto_11244 ) ) ( CALIBRATION_TARGET ?auto_11248 ?auto_11251 ) ( POINTING ?auto_11250 ?auto_11247 ) ( not ( = ?auto_11251 ?auto_11247 ) ) ( ON_BOARD ?auto_11249 ?auto_11250 ) ( POWER_ON ?auto_11249 ) ( not ( = ?auto_11248 ?auto_11249 ) ) ( CALIBRATED ?auto_11249 ) ( SUPPORTS ?auto_11249 ?auto_11246 ) ( not ( = ?auto_11243 ?auto_11246 ) ) ( not ( = ?auto_11244 ?auto_11246 ) ) )
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
      ?auto_11270 - INSTRUMENT
      ?auto_11272 - SATELLITE
      ?auto_11273 - DIRECTION
      ?auto_11271 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11267 ?auto_11264 ) ) ( not ( = ?auto_11269 ?auto_11264 ) ) ( not ( = ?auto_11269 ?auto_11267 ) ) ( ON_BOARD ?auto_11270 ?auto_11272 ) ( SUPPORTS ?auto_11270 ?auto_11268 ) ( not ( = ?auto_11269 ?auto_11273 ) ) ( HAVE_IMAGE ?auto_11267 ?auto_11266 ) ( not ( = ?auto_11267 ?auto_11273 ) ) ( not ( = ?auto_11266 ?auto_11268 ) ) ( CALIBRATION_TARGET ?auto_11270 ?auto_11273 ) ( POINTING ?auto_11272 ?auto_11264 ) ( not ( = ?auto_11273 ?auto_11264 ) ) ( ON_BOARD ?auto_11271 ?auto_11272 ) ( POWER_ON ?auto_11271 ) ( not ( = ?auto_11270 ?auto_11271 ) ) ( CALIBRATED ?auto_11271 ) ( SUPPORTS ?auto_11271 ?auto_11265 ) ( not ( = ?auto_11266 ?auto_11265 ) ) ( not ( = ?auto_11268 ?auto_11265 ) ) )
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
      ?auto_11292 - INSTRUMENT
      ?auto_11294 - SATELLITE
      ?auto_11295 - DIRECTION
      ?auto_11293 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11289 ?auto_11286 ) ) ( not ( = ?auto_11291 ?auto_11286 ) ) ( not ( = ?auto_11291 ?auto_11289 ) ) ( ON_BOARD ?auto_11292 ?auto_11294 ) ( SUPPORTS ?auto_11292 ?auto_11288 ) ( not ( = ?auto_11289 ?auto_11295 ) ) ( HAVE_IMAGE ?auto_11291 ?auto_11290 ) ( not ( = ?auto_11291 ?auto_11295 ) ) ( not ( = ?auto_11290 ?auto_11288 ) ) ( CALIBRATION_TARGET ?auto_11292 ?auto_11295 ) ( POINTING ?auto_11294 ?auto_11286 ) ( not ( = ?auto_11295 ?auto_11286 ) ) ( ON_BOARD ?auto_11293 ?auto_11294 ) ( POWER_ON ?auto_11293 ) ( not ( = ?auto_11292 ?auto_11293 ) ) ( CALIBRATED ?auto_11293 ) ( SUPPORTS ?auto_11293 ?auto_11287 ) ( not ( = ?auto_11290 ?auto_11287 ) ) ( not ( = ?auto_11288 ?auto_11287 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11291 ?auto_11290 ?auto_11289 ?auto_11288 )
      ( GET-3IMAGE-VERIFY ?auto_11286 ?auto_11287 ?auto_11289 ?auto_11288 ?auto_11291 ?auto_11290 ) )
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
      ?auto_11338 - INSTRUMENT
      ?auto_11340 - SATELLITE
      ?auto_11341 - DIRECTION
      ?auto_11339 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11335 ?auto_11332 ) ) ( not ( = ?auto_11337 ?auto_11332 ) ) ( not ( = ?auto_11337 ?auto_11335 ) ) ( ON_BOARD ?auto_11338 ?auto_11340 ) ( SUPPORTS ?auto_11338 ?auto_11333 ) ( not ( = ?auto_11332 ?auto_11341 ) ) ( HAVE_IMAGE ?auto_11335 ?auto_11334 ) ( not ( = ?auto_11335 ?auto_11341 ) ) ( not ( = ?auto_11334 ?auto_11333 ) ) ( CALIBRATION_TARGET ?auto_11338 ?auto_11341 ) ( POINTING ?auto_11340 ?auto_11337 ) ( not ( = ?auto_11341 ?auto_11337 ) ) ( ON_BOARD ?auto_11339 ?auto_11340 ) ( POWER_ON ?auto_11339 ) ( not ( = ?auto_11338 ?auto_11339 ) ) ( CALIBRATED ?auto_11339 ) ( SUPPORTS ?auto_11339 ?auto_11336 ) ( not ( = ?auto_11334 ?auto_11336 ) ) ( not ( = ?auto_11333 ?auto_11336 ) ) )
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
      ?auto_11360 - INSTRUMENT
      ?auto_11362 - SATELLITE
      ?auto_11363 - DIRECTION
      ?auto_11361 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11357 ?auto_11354 ) ) ( not ( = ?auto_11359 ?auto_11354 ) ) ( not ( = ?auto_11359 ?auto_11357 ) ) ( ON_BOARD ?auto_11360 ?auto_11362 ) ( SUPPORTS ?auto_11360 ?auto_11355 ) ( not ( = ?auto_11354 ?auto_11363 ) ) ( HAVE_IMAGE ?auto_11359 ?auto_11358 ) ( not ( = ?auto_11359 ?auto_11363 ) ) ( not ( = ?auto_11358 ?auto_11355 ) ) ( CALIBRATION_TARGET ?auto_11360 ?auto_11363 ) ( POINTING ?auto_11362 ?auto_11357 ) ( not ( = ?auto_11363 ?auto_11357 ) ) ( ON_BOARD ?auto_11361 ?auto_11362 ) ( POWER_ON ?auto_11361 ) ( not ( = ?auto_11360 ?auto_11361 ) ) ( CALIBRATED ?auto_11361 ) ( SUPPORTS ?auto_11361 ?auto_11356 ) ( not ( = ?auto_11358 ?auto_11356 ) ) ( not ( = ?auto_11355 ?auto_11356 ) ) )
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
      ?auto_11429 - DIRECTION
      ?auto_11431 - INSTRUMENT
      ?auto_11433 - SATELLITE
      ?auto_11435 - DIRECTION
      ?auto_11428 - MODE
      ?auto_11430 - DIRECTION
      ?auto_11432 - INSTRUMENT
      ?auto_11434 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_11426 ?auto_11429 ) ) ( ON_BOARD ?auto_11431 ?auto_11433 ) ( SUPPORTS ?auto_11431 ?auto_11427 ) ( not ( = ?auto_11426 ?auto_11435 ) ) ( HAVE_IMAGE ?auto_11429 ?auto_11428 ) ( not ( = ?auto_11429 ?auto_11435 ) ) ( not ( = ?auto_11428 ?auto_11427 ) ) ( CALIBRATION_TARGET ?auto_11431 ?auto_11435 ) ( not ( = ?auto_11435 ?auto_11430 ) ) ( not ( = ?auto_11426 ?auto_11430 ) ) ( not ( = ?auto_11429 ?auto_11430 ) ) ( ON_BOARD ?auto_11432 ?auto_11433 ) ( POWER_ON ?auto_11432 ) ( not ( = ?auto_11431 ?auto_11432 ) ) ( CALIBRATED ?auto_11432 ) ( SUPPORTS ?auto_11432 ?auto_11434 ) ( not ( = ?auto_11428 ?auto_11434 ) ) ( not ( = ?auto_11427 ?auto_11434 ) ) ( POINTING ?auto_11433 ?auto_11435 ) )
    :subtasks
    ( ( !TURN_TO ?auto_11433 ?auto_11430 ?auto_11435 )
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
      ?auto_11440 - INSTRUMENT
      ?auto_11442 - SATELLITE
      ?auto_11444 - DIRECTION
      ?auto_11445 - DIRECTION
      ?auto_11441 - INSTRUMENT
      ?auto_11443 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_11439 ?auto_11436 ) ) ( ON_BOARD ?auto_11440 ?auto_11442 ) ( SUPPORTS ?auto_11440 ?auto_11438 ) ( not ( = ?auto_11439 ?auto_11444 ) ) ( HAVE_IMAGE ?auto_11436 ?auto_11437 ) ( not ( = ?auto_11436 ?auto_11444 ) ) ( not ( = ?auto_11437 ?auto_11438 ) ) ( CALIBRATION_TARGET ?auto_11440 ?auto_11444 ) ( not ( = ?auto_11444 ?auto_11445 ) ) ( not ( = ?auto_11439 ?auto_11445 ) ) ( not ( = ?auto_11436 ?auto_11445 ) ) ( ON_BOARD ?auto_11441 ?auto_11442 ) ( POWER_ON ?auto_11441 ) ( not ( = ?auto_11440 ?auto_11441 ) ) ( CALIBRATED ?auto_11441 ) ( SUPPORTS ?auto_11441 ?auto_11443 ) ( not ( = ?auto_11437 ?auto_11443 ) ) ( not ( = ?auto_11438 ?auto_11443 ) ) ( POINTING ?auto_11442 ?auto_11444 ) )
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
      ?auto_11451 - DIRECTION
      ?auto_11453 - INSTRUMENT
      ?auto_11455 - SATELLITE
      ?auto_11452 - DIRECTION
      ?auto_11450 - MODE
      ?auto_11454 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11449 ?auto_11446 ) ) ( not ( = ?auto_11449 ?auto_11451 ) ) ( ON_BOARD ?auto_11453 ?auto_11455 ) ( SUPPORTS ?auto_11453 ?auto_11448 ) ( not ( = ?auto_11449 ?auto_11452 ) ) ( HAVE_IMAGE ?auto_11451 ?auto_11450 ) ( not ( = ?auto_11451 ?auto_11452 ) ) ( not ( = ?auto_11450 ?auto_11448 ) ) ( CALIBRATION_TARGET ?auto_11453 ?auto_11452 ) ( not ( = ?auto_11452 ?auto_11446 ) ) ( not ( = ?auto_11451 ?auto_11446 ) ) ( ON_BOARD ?auto_11454 ?auto_11455 ) ( POWER_ON ?auto_11454 ) ( not ( = ?auto_11453 ?auto_11454 ) ) ( CALIBRATED ?auto_11454 ) ( SUPPORTS ?auto_11454 ?auto_11447 ) ( not ( = ?auto_11450 ?auto_11447 ) ) ( not ( = ?auto_11448 ?auto_11447 ) ) ( POINTING ?auto_11455 ?auto_11452 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11451 ?auto_11450 ?auto_11449 ?auto_11448 )
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
      ?auto_11463 - INSTRUMENT
      ?auto_11465 - SATELLITE
      ?auto_11462 - DIRECTION
      ?auto_11461 - DIRECTION
      ?auto_11464 - INSTRUMENT
      ?auto_11460 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_11459 ?auto_11456 ) ) ( ON_BOARD ?auto_11463 ?auto_11465 ) ( SUPPORTS ?auto_11463 ?auto_11457 ) ( not ( = ?auto_11456 ?auto_11462 ) ) ( HAVE_IMAGE ?auto_11459 ?auto_11458 ) ( not ( = ?auto_11459 ?auto_11462 ) ) ( not ( = ?auto_11458 ?auto_11457 ) ) ( CALIBRATION_TARGET ?auto_11463 ?auto_11462 ) ( not ( = ?auto_11462 ?auto_11461 ) ) ( not ( = ?auto_11456 ?auto_11461 ) ) ( not ( = ?auto_11459 ?auto_11461 ) ) ( ON_BOARD ?auto_11464 ?auto_11465 ) ( POWER_ON ?auto_11464 ) ( not ( = ?auto_11463 ?auto_11464 ) ) ( CALIBRATED ?auto_11464 ) ( SUPPORTS ?auto_11464 ?auto_11460 ) ( not ( = ?auto_11458 ?auto_11460 ) ) ( not ( = ?auto_11457 ?auto_11460 ) ) ( POINTING ?auto_11465 ?auto_11462 ) )
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
      ?auto_11471 - DIRECTION
      ?auto_11473 - INSTRUMENT
      ?auto_11475 - SATELLITE
      ?auto_11472 - DIRECTION
      ?auto_11470 - MODE
      ?auto_11474 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11469 ?auto_11466 ) ) ( not ( = ?auto_11466 ?auto_11471 ) ) ( ON_BOARD ?auto_11473 ?auto_11475 ) ( SUPPORTS ?auto_11473 ?auto_11467 ) ( not ( = ?auto_11466 ?auto_11472 ) ) ( HAVE_IMAGE ?auto_11471 ?auto_11470 ) ( not ( = ?auto_11471 ?auto_11472 ) ) ( not ( = ?auto_11470 ?auto_11467 ) ) ( CALIBRATION_TARGET ?auto_11473 ?auto_11472 ) ( not ( = ?auto_11472 ?auto_11469 ) ) ( not ( = ?auto_11471 ?auto_11469 ) ) ( ON_BOARD ?auto_11474 ?auto_11475 ) ( POWER_ON ?auto_11474 ) ( not ( = ?auto_11473 ?auto_11474 ) ) ( CALIBRATED ?auto_11474 ) ( SUPPORTS ?auto_11474 ?auto_11468 ) ( not ( = ?auto_11470 ?auto_11468 ) ) ( not ( = ?auto_11467 ?auto_11468 ) ) ( POINTING ?auto_11475 ?auto_11472 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11471 ?auto_11470 ?auto_11466 ?auto_11467 )
      ( GET-2IMAGE-VERIFY ?auto_11466 ?auto_11467 ?auto_11469 ?auto_11468 ) )
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
      ?auto_11507 - INSTRUMENT
      ?auto_11509 - SATELLITE
      ?auto_11506 - DIRECTION
      ?auto_11508 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11503 ?auto_11500 ) ) ( not ( = ?auto_11505 ?auto_11500 ) ) ( not ( = ?auto_11505 ?auto_11503 ) ) ( ON_BOARD ?auto_11507 ?auto_11509 ) ( SUPPORTS ?auto_11507 ?auto_11504 ) ( not ( = ?auto_11505 ?auto_11506 ) ) ( HAVE_IMAGE ?auto_11500 ?auto_11501 ) ( not ( = ?auto_11500 ?auto_11506 ) ) ( not ( = ?auto_11501 ?auto_11504 ) ) ( CALIBRATION_TARGET ?auto_11507 ?auto_11506 ) ( not ( = ?auto_11506 ?auto_11503 ) ) ( ON_BOARD ?auto_11508 ?auto_11509 ) ( POWER_ON ?auto_11508 ) ( not ( = ?auto_11507 ?auto_11508 ) ) ( CALIBRATED ?auto_11508 ) ( SUPPORTS ?auto_11508 ?auto_11502 ) ( not ( = ?auto_11501 ?auto_11502 ) ) ( not ( = ?auto_11504 ?auto_11502 ) ) ( POINTING ?auto_11509 ?auto_11506 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11500 ?auto_11501 ?auto_11505 ?auto_11504 )
      ( GET-3IMAGE-VERIFY ?auto_11500 ?auto_11501 ?auto_11503 ?auto_11502 ?auto_11505 ?auto_11504 ) )
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
      ?auto_11529 - INSTRUMENT
      ?auto_11531 - SATELLITE
      ?auto_11528 - DIRECTION
      ?auto_11530 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11525 ?auto_11522 ) ) ( not ( = ?auto_11527 ?auto_11522 ) ) ( not ( = ?auto_11527 ?auto_11525 ) ) ( ON_BOARD ?auto_11529 ?auto_11531 ) ( SUPPORTS ?auto_11529 ?auto_11524 ) ( not ( = ?auto_11525 ?auto_11528 ) ) ( HAVE_IMAGE ?auto_11522 ?auto_11523 ) ( not ( = ?auto_11522 ?auto_11528 ) ) ( not ( = ?auto_11523 ?auto_11524 ) ) ( CALIBRATION_TARGET ?auto_11529 ?auto_11528 ) ( not ( = ?auto_11528 ?auto_11527 ) ) ( ON_BOARD ?auto_11530 ?auto_11531 ) ( POWER_ON ?auto_11530 ) ( not ( = ?auto_11529 ?auto_11530 ) ) ( CALIBRATED ?auto_11530 ) ( SUPPORTS ?auto_11530 ?auto_11526 ) ( not ( = ?auto_11523 ?auto_11526 ) ) ( not ( = ?auto_11524 ?auto_11526 ) ) ( POINTING ?auto_11531 ?auto_11528 ) )
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
      ?auto_11551 - INSTRUMENT
      ?auto_11553 - SATELLITE
      ?auto_11550 - DIRECTION
      ?auto_11552 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11547 ?auto_11544 ) ) ( not ( = ?auto_11549 ?auto_11544 ) ) ( not ( = ?auto_11549 ?auto_11547 ) ) ( ON_BOARD ?auto_11551 ?auto_11553 ) ( SUPPORTS ?auto_11551 ?auto_11548 ) ( not ( = ?auto_11549 ?auto_11550 ) ) ( HAVE_IMAGE ?auto_11547 ?auto_11546 ) ( not ( = ?auto_11547 ?auto_11550 ) ) ( not ( = ?auto_11546 ?auto_11548 ) ) ( CALIBRATION_TARGET ?auto_11551 ?auto_11550 ) ( not ( = ?auto_11550 ?auto_11544 ) ) ( ON_BOARD ?auto_11552 ?auto_11553 ) ( POWER_ON ?auto_11552 ) ( not ( = ?auto_11551 ?auto_11552 ) ) ( CALIBRATED ?auto_11552 ) ( SUPPORTS ?auto_11552 ?auto_11545 ) ( not ( = ?auto_11546 ?auto_11545 ) ) ( not ( = ?auto_11548 ?auto_11545 ) ) ( POINTING ?auto_11553 ?auto_11550 ) )
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
      ?auto_11573 - INSTRUMENT
      ?auto_11575 - SATELLITE
      ?auto_11572 - DIRECTION
      ?auto_11574 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11569 ?auto_11566 ) ) ( not ( = ?auto_11571 ?auto_11566 ) ) ( not ( = ?auto_11571 ?auto_11569 ) ) ( ON_BOARD ?auto_11573 ?auto_11575 ) ( SUPPORTS ?auto_11573 ?auto_11568 ) ( not ( = ?auto_11569 ?auto_11572 ) ) ( HAVE_IMAGE ?auto_11571 ?auto_11570 ) ( not ( = ?auto_11571 ?auto_11572 ) ) ( not ( = ?auto_11570 ?auto_11568 ) ) ( CALIBRATION_TARGET ?auto_11573 ?auto_11572 ) ( not ( = ?auto_11572 ?auto_11566 ) ) ( ON_BOARD ?auto_11574 ?auto_11575 ) ( POWER_ON ?auto_11574 ) ( not ( = ?auto_11573 ?auto_11574 ) ) ( CALIBRATED ?auto_11574 ) ( SUPPORTS ?auto_11574 ?auto_11567 ) ( not ( = ?auto_11570 ?auto_11567 ) ) ( not ( = ?auto_11568 ?auto_11567 ) ) ( POINTING ?auto_11575 ?auto_11572 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11571 ?auto_11570 ?auto_11569 ?auto_11568 )
      ( GET-3IMAGE-VERIFY ?auto_11566 ?auto_11567 ?auto_11569 ?auto_11568 ?auto_11571 ?auto_11570 ) )
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
      ?auto_11619 - INSTRUMENT
      ?auto_11621 - SATELLITE
      ?auto_11618 - DIRECTION
      ?auto_11620 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11615 ?auto_11612 ) ) ( not ( = ?auto_11617 ?auto_11612 ) ) ( not ( = ?auto_11617 ?auto_11615 ) ) ( ON_BOARD ?auto_11619 ?auto_11621 ) ( SUPPORTS ?auto_11619 ?auto_11613 ) ( not ( = ?auto_11612 ?auto_11618 ) ) ( HAVE_IMAGE ?auto_11615 ?auto_11614 ) ( not ( = ?auto_11615 ?auto_11618 ) ) ( not ( = ?auto_11614 ?auto_11613 ) ) ( CALIBRATION_TARGET ?auto_11619 ?auto_11618 ) ( not ( = ?auto_11618 ?auto_11617 ) ) ( ON_BOARD ?auto_11620 ?auto_11621 ) ( POWER_ON ?auto_11620 ) ( not ( = ?auto_11619 ?auto_11620 ) ) ( CALIBRATED ?auto_11620 ) ( SUPPORTS ?auto_11620 ?auto_11616 ) ( not ( = ?auto_11614 ?auto_11616 ) ) ( not ( = ?auto_11613 ?auto_11616 ) ) ( POINTING ?auto_11621 ?auto_11618 ) )
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
      ?auto_11641 - INSTRUMENT
      ?auto_11643 - SATELLITE
      ?auto_11640 - DIRECTION
      ?auto_11642 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11637 ?auto_11634 ) ) ( not ( = ?auto_11639 ?auto_11634 ) ) ( not ( = ?auto_11639 ?auto_11637 ) ) ( ON_BOARD ?auto_11641 ?auto_11643 ) ( SUPPORTS ?auto_11641 ?auto_11635 ) ( not ( = ?auto_11634 ?auto_11640 ) ) ( HAVE_IMAGE ?auto_11639 ?auto_11638 ) ( not ( = ?auto_11639 ?auto_11640 ) ) ( not ( = ?auto_11638 ?auto_11635 ) ) ( CALIBRATION_TARGET ?auto_11641 ?auto_11640 ) ( not ( = ?auto_11640 ?auto_11637 ) ) ( ON_BOARD ?auto_11642 ?auto_11643 ) ( POWER_ON ?auto_11642 ) ( not ( = ?auto_11641 ?auto_11642 ) ) ( CALIBRATED ?auto_11642 ) ( SUPPORTS ?auto_11642 ?auto_11636 ) ( not ( = ?auto_11638 ?auto_11636 ) ) ( not ( = ?auto_11635 ?auto_11636 ) ) ( POINTING ?auto_11643 ?auto_11640 ) )
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
      ?auto_11711 - DIRECTION
      ?auto_11713 - INSTRUMENT
      ?auto_11715 - SATELLITE
      ?auto_11712 - DIRECTION
      ?auto_11710 - MODE
      ?auto_11709 - DIRECTION
      ?auto_11714 - INSTRUMENT
      ?auto_11708 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_11706 ?auto_11711 ) ) ( ON_BOARD ?auto_11713 ?auto_11715 ) ( SUPPORTS ?auto_11713 ?auto_11707 ) ( not ( = ?auto_11706 ?auto_11712 ) ) ( HAVE_IMAGE ?auto_11711 ?auto_11710 ) ( not ( = ?auto_11711 ?auto_11712 ) ) ( not ( = ?auto_11710 ?auto_11707 ) ) ( CALIBRATION_TARGET ?auto_11713 ?auto_11712 ) ( not ( = ?auto_11712 ?auto_11709 ) ) ( not ( = ?auto_11706 ?auto_11709 ) ) ( not ( = ?auto_11711 ?auto_11709 ) ) ( ON_BOARD ?auto_11714 ?auto_11715 ) ( POWER_ON ?auto_11714 ) ( not ( = ?auto_11713 ?auto_11714 ) ) ( SUPPORTS ?auto_11714 ?auto_11708 ) ( not ( = ?auto_11710 ?auto_11708 ) ) ( not ( = ?auto_11707 ?auto_11708 ) ) ( POINTING ?auto_11715 ?auto_11712 ) ( CALIBRATION_TARGET ?auto_11714 ?auto_11712 ) ( NOT_CALIBRATED ?auto_11714 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_11715 ?auto_11714 ?auto_11712 )
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
      ?auto_11722 - SATELLITE
      ?auto_11725 - DIRECTION
      ?auto_11721 - DIRECTION
      ?auto_11723 - INSTRUMENT
      ?auto_11724 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_11719 ?auto_11716 ) ) ( ON_BOARD ?auto_11720 ?auto_11722 ) ( SUPPORTS ?auto_11720 ?auto_11718 ) ( not ( = ?auto_11719 ?auto_11725 ) ) ( HAVE_IMAGE ?auto_11716 ?auto_11717 ) ( not ( = ?auto_11716 ?auto_11725 ) ) ( not ( = ?auto_11717 ?auto_11718 ) ) ( CALIBRATION_TARGET ?auto_11720 ?auto_11725 ) ( not ( = ?auto_11725 ?auto_11721 ) ) ( not ( = ?auto_11719 ?auto_11721 ) ) ( not ( = ?auto_11716 ?auto_11721 ) ) ( ON_BOARD ?auto_11723 ?auto_11722 ) ( POWER_ON ?auto_11723 ) ( not ( = ?auto_11720 ?auto_11723 ) ) ( SUPPORTS ?auto_11723 ?auto_11724 ) ( not ( = ?auto_11717 ?auto_11724 ) ) ( not ( = ?auto_11718 ?auto_11724 ) ) ( POINTING ?auto_11722 ?auto_11725 ) ( CALIBRATION_TARGET ?auto_11723 ?auto_11725 ) ( NOT_CALIBRATED ?auto_11723 ) )
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
      ?auto_11734 - DIRECTION
      ?auto_11735 - INSTRUMENT
      ?auto_11731 - SATELLITE
      ?auto_11730 - DIRECTION
      ?auto_11733 - MODE
      ?auto_11732 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11729 ?auto_11726 ) ) ( not ( = ?auto_11729 ?auto_11734 ) ) ( ON_BOARD ?auto_11735 ?auto_11731 ) ( SUPPORTS ?auto_11735 ?auto_11728 ) ( not ( = ?auto_11729 ?auto_11730 ) ) ( HAVE_IMAGE ?auto_11734 ?auto_11733 ) ( not ( = ?auto_11734 ?auto_11730 ) ) ( not ( = ?auto_11733 ?auto_11728 ) ) ( CALIBRATION_TARGET ?auto_11735 ?auto_11730 ) ( not ( = ?auto_11730 ?auto_11726 ) ) ( not ( = ?auto_11734 ?auto_11726 ) ) ( ON_BOARD ?auto_11732 ?auto_11731 ) ( POWER_ON ?auto_11732 ) ( not ( = ?auto_11735 ?auto_11732 ) ) ( SUPPORTS ?auto_11732 ?auto_11727 ) ( not ( = ?auto_11733 ?auto_11727 ) ) ( not ( = ?auto_11728 ?auto_11727 ) ) ( POINTING ?auto_11731 ?auto_11730 ) ( CALIBRATION_TARGET ?auto_11732 ?auto_11730 ) ( NOT_CALIBRATED ?auto_11732 ) )
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
      ?auto_11745 - INSTRUMENT
      ?auto_11743 - SATELLITE
      ?auto_11742 - DIRECTION
      ?auto_11740 - DIRECTION
      ?auto_11744 - INSTRUMENT
      ?auto_11741 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_11739 ?auto_11736 ) ) ( ON_BOARD ?auto_11745 ?auto_11743 ) ( SUPPORTS ?auto_11745 ?auto_11737 ) ( not ( = ?auto_11736 ?auto_11742 ) ) ( HAVE_IMAGE ?auto_11739 ?auto_11738 ) ( not ( = ?auto_11739 ?auto_11742 ) ) ( not ( = ?auto_11738 ?auto_11737 ) ) ( CALIBRATION_TARGET ?auto_11745 ?auto_11742 ) ( not ( = ?auto_11742 ?auto_11740 ) ) ( not ( = ?auto_11736 ?auto_11740 ) ) ( not ( = ?auto_11739 ?auto_11740 ) ) ( ON_BOARD ?auto_11744 ?auto_11743 ) ( POWER_ON ?auto_11744 ) ( not ( = ?auto_11745 ?auto_11744 ) ) ( SUPPORTS ?auto_11744 ?auto_11741 ) ( not ( = ?auto_11738 ?auto_11741 ) ) ( not ( = ?auto_11737 ?auto_11741 ) ) ( POINTING ?auto_11743 ?auto_11742 ) ( CALIBRATION_TARGET ?auto_11744 ?auto_11742 ) ( NOT_CALIBRATED ?auto_11744 ) )
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
      ?auto_11754 - DIRECTION
      ?auto_11755 - INSTRUMENT
      ?auto_11751 - SATELLITE
      ?auto_11750 - DIRECTION
      ?auto_11753 - MODE
      ?auto_11752 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11749 ?auto_11746 ) ) ( not ( = ?auto_11746 ?auto_11754 ) ) ( ON_BOARD ?auto_11755 ?auto_11751 ) ( SUPPORTS ?auto_11755 ?auto_11747 ) ( not ( = ?auto_11746 ?auto_11750 ) ) ( HAVE_IMAGE ?auto_11754 ?auto_11753 ) ( not ( = ?auto_11754 ?auto_11750 ) ) ( not ( = ?auto_11753 ?auto_11747 ) ) ( CALIBRATION_TARGET ?auto_11755 ?auto_11750 ) ( not ( = ?auto_11750 ?auto_11749 ) ) ( not ( = ?auto_11754 ?auto_11749 ) ) ( ON_BOARD ?auto_11752 ?auto_11751 ) ( POWER_ON ?auto_11752 ) ( not ( = ?auto_11755 ?auto_11752 ) ) ( SUPPORTS ?auto_11752 ?auto_11748 ) ( not ( = ?auto_11753 ?auto_11748 ) ) ( not ( = ?auto_11747 ?auto_11748 ) ) ( POINTING ?auto_11751 ?auto_11750 ) ( CALIBRATION_TARGET ?auto_11752 ?auto_11750 ) ( NOT_CALIBRATED ?auto_11752 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11754 ?auto_11753 ?auto_11746 ?auto_11747 )
      ( GET-2IMAGE-VERIFY ?auto_11746 ?auto_11747 ?auto_11749 ?auto_11748 ) )
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
      ?auto_11789 - INSTRUMENT
      ?auto_11787 - SATELLITE
      ?auto_11786 - DIRECTION
      ?auto_11788 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11783 ?auto_11780 ) ) ( not ( = ?auto_11785 ?auto_11780 ) ) ( not ( = ?auto_11785 ?auto_11783 ) ) ( ON_BOARD ?auto_11789 ?auto_11787 ) ( SUPPORTS ?auto_11789 ?auto_11784 ) ( not ( = ?auto_11785 ?auto_11786 ) ) ( HAVE_IMAGE ?auto_11780 ?auto_11781 ) ( not ( = ?auto_11780 ?auto_11786 ) ) ( not ( = ?auto_11781 ?auto_11784 ) ) ( CALIBRATION_TARGET ?auto_11789 ?auto_11786 ) ( not ( = ?auto_11786 ?auto_11783 ) ) ( ON_BOARD ?auto_11788 ?auto_11787 ) ( POWER_ON ?auto_11788 ) ( not ( = ?auto_11789 ?auto_11788 ) ) ( SUPPORTS ?auto_11788 ?auto_11782 ) ( not ( = ?auto_11781 ?auto_11782 ) ) ( not ( = ?auto_11784 ?auto_11782 ) ) ( POINTING ?auto_11787 ?auto_11786 ) ( CALIBRATION_TARGET ?auto_11788 ?auto_11786 ) ( NOT_CALIBRATED ?auto_11788 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11780 ?auto_11781 ?auto_11785 ?auto_11784 )
      ( GET-3IMAGE-VERIFY ?auto_11780 ?auto_11781 ?auto_11783 ?auto_11782 ?auto_11785 ?auto_11784 ) )
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
      ?auto_11811 - INSTRUMENT
      ?auto_11809 - SATELLITE
      ?auto_11808 - DIRECTION
      ?auto_11810 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11805 ?auto_11802 ) ) ( not ( = ?auto_11807 ?auto_11802 ) ) ( not ( = ?auto_11807 ?auto_11805 ) ) ( ON_BOARD ?auto_11811 ?auto_11809 ) ( SUPPORTS ?auto_11811 ?auto_11804 ) ( not ( = ?auto_11805 ?auto_11808 ) ) ( HAVE_IMAGE ?auto_11802 ?auto_11803 ) ( not ( = ?auto_11802 ?auto_11808 ) ) ( not ( = ?auto_11803 ?auto_11804 ) ) ( CALIBRATION_TARGET ?auto_11811 ?auto_11808 ) ( not ( = ?auto_11808 ?auto_11807 ) ) ( ON_BOARD ?auto_11810 ?auto_11809 ) ( POWER_ON ?auto_11810 ) ( not ( = ?auto_11811 ?auto_11810 ) ) ( SUPPORTS ?auto_11810 ?auto_11806 ) ( not ( = ?auto_11803 ?auto_11806 ) ) ( not ( = ?auto_11804 ?auto_11806 ) ) ( POINTING ?auto_11809 ?auto_11808 ) ( CALIBRATION_TARGET ?auto_11810 ?auto_11808 ) ( NOT_CALIBRATED ?auto_11810 ) )
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
      ?auto_11833 - INSTRUMENT
      ?auto_11831 - SATELLITE
      ?auto_11830 - DIRECTION
      ?auto_11832 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11827 ?auto_11824 ) ) ( not ( = ?auto_11829 ?auto_11824 ) ) ( not ( = ?auto_11829 ?auto_11827 ) ) ( ON_BOARD ?auto_11833 ?auto_11831 ) ( SUPPORTS ?auto_11833 ?auto_11828 ) ( not ( = ?auto_11829 ?auto_11830 ) ) ( HAVE_IMAGE ?auto_11827 ?auto_11826 ) ( not ( = ?auto_11827 ?auto_11830 ) ) ( not ( = ?auto_11826 ?auto_11828 ) ) ( CALIBRATION_TARGET ?auto_11833 ?auto_11830 ) ( not ( = ?auto_11830 ?auto_11824 ) ) ( ON_BOARD ?auto_11832 ?auto_11831 ) ( POWER_ON ?auto_11832 ) ( not ( = ?auto_11833 ?auto_11832 ) ) ( SUPPORTS ?auto_11832 ?auto_11825 ) ( not ( = ?auto_11826 ?auto_11825 ) ) ( not ( = ?auto_11828 ?auto_11825 ) ) ( POINTING ?auto_11831 ?auto_11830 ) ( CALIBRATION_TARGET ?auto_11832 ?auto_11830 ) ( NOT_CALIBRATED ?auto_11832 ) )
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
      ?auto_11855 - INSTRUMENT
      ?auto_11853 - SATELLITE
      ?auto_11852 - DIRECTION
      ?auto_11854 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11849 ?auto_11846 ) ) ( not ( = ?auto_11851 ?auto_11846 ) ) ( not ( = ?auto_11851 ?auto_11849 ) ) ( ON_BOARD ?auto_11855 ?auto_11853 ) ( SUPPORTS ?auto_11855 ?auto_11848 ) ( not ( = ?auto_11849 ?auto_11852 ) ) ( HAVE_IMAGE ?auto_11851 ?auto_11850 ) ( not ( = ?auto_11851 ?auto_11852 ) ) ( not ( = ?auto_11850 ?auto_11848 ) ) ( CALIBRATION_TARGET ?auto_11855 ?auto_11852 ) ( not ( = ?auto_11852 ?auto_11846 ) ) ( ON_BOARD ?auto_11854 ?auto_11853 ) ( POWER_ON ?auto_11854 ) ( not ( = ?auto_11855 ?auto_11854 ) ) ( SUPPORTS ?auto_11854 ?auto_11847 ) ( not ( = ?auto_11850 ?auto_11847 ) ) ( not ( = ?auto_11848 ?auto_11847 ) ) ( POINTING ?auto_11853 ?auto_11852 ) ( CALIBRATION_TARGET ?auto_11854 ?auto_11852 ) ( NOT_CALIBRATED ?auto_11854 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_11851 ?auto_11850 ?auto_11849 ?auto_11848 )
      ( GET-3IMAGE-VERIFY ?auto_11846 ?auto_11847 ?auto_11849 ?auto_11848 ?auto_11851 ?auto_11850 ) )
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
      ?auto_11901 - INSTRUMENT
      ?auto_11899 - SATELLITE
      ?auto_11898 - DIRECTION
      ?auto_11900 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11895 ?auto_11892 ) ) ( not ( = ?auto_11897 ?auto_11892 ) ) ( not ( = ?auto_11897 ?auto_11895 ) ) ( ON_BOARD ?auto_11901 ?auto_11899 ) ( SUPPORTS ?auto_11901 ?auto_11893 ) ( not ( = ?auto_11892 ?auto_11898 ) ) ( HAVE_IMAGE ?auto_11895 ?auto_11894 ) ( not ( = ?auto_11895 ?auto_11898 ) ) ( not ( = ?auto_11894 ?auto_11893 ) ) ( CALIBRATION_TARGET ?auto_11901 ?auto_11898 ) ( not ( = ?auto_11898 ?auto_11897 ) ) ( ON_BOARD ?auto_11900 ?auto_11899 ) ( POWER_ON ?auto_11900 ) ( not ( = ?auto_11901 ?auto_11900 ) ) ( SUPPORTS ?auto_11900 ?auto_11896 ) ( not ( = ?auto_11894 ?auto_11896 ) ) ( not ( = ?auto_11893 ?auto_11896 ) ) ( POINTING ?auto_11899 ?auto_11898 ) ( CALIBRATION_TARGET ?auto_11900 ?auto_11898 ) ( NOT_CALIBRATED ?auto_11900 ) )
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
      ?auto_11923 - INSTRUMENT
      ?auto_11921 - SATELLITE
      ?auto_11920 - DIRECTION
      ?auto_11922 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_11917 ?auto_11914 ) ) ( not ( = ?auto_11919 ?auto_11914 ) ) ( not ( = ?auto_11919 ?auto_11917 ) ) ( ON_BOARD ?auto_11923 ?auto_11921 ) ( SUPPORTS ?auto_11923 ?auto_11915 ) ( not ( = ?auto_11914 ?auto_11920 ) ) ( HAVE_IMAGE ?auto_11919 ?auto_11918 ) ( not ( = ?auto_11919 ?auto_11920 ) ) ( not ( = ?auto_11918 ?auto_11915 ) ) ( CALIBRATION_TARGET ?auto_11923 ?auto_11920 ) ( not ( = ?auto_11920 ?auto_11917 ) ) ( ON_BOARD ?auto_11922 ?auto_11921 ) ( POWER_ON ?auto_11922 ) ( not ( = ?auto_11923 ?auto_11922 ) ) ( SUPPORTS ?auto_11922 ?auto_11916 ) ( not ( = ?auto_11918 ?auto_11916 ) ) ( not ( = ?auto_11915 ?auto_11916 ) ) ( POINTING ?auto_11921 ?auto_11920 ) ( CALIBRATION_TARGET ?auto_11922 ?auto_11920 ) ( NOT_CALIBRATED ?auto_11922 ) )
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
      ?auto_11994 - DIRECTION
      ?auto_11995 - INSTRUMENT
      ?auto_11991 - SATELLITE
      ?auto_11990 - DIRECTION
      ?auto_11993 - MODE
      ?auto_11988 - DIRECTION
      ?auto_11992 - INSTRUMENT
      ?auto_11989 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_11986 ?auto_11994 ) ) ( ON_BOARD ?auto_11995 ?auto_11991 ) ( SUPPORTS ?auto_11995 ?auto_11987 ) ( not ( = ?auto_11986 ?auto_11990 ) ) ( HAVE_IMAGE ?auto_11994 ?auto_11993 ) ( not ( = ?auto_11994 ?auto_11990 ) ) ( not ( = ?auto_11993 ?auto_11987 ) ) ( CALIBRATION_TARGET ?auto_11995 ?auto_11990 ) ( not ( = ?auto_11990 ?auto_11988 ) ) ( not ( = ?auto_11986 ?auto_11988 ) ) ( not ( = ?auto_11994 ?auto_11988 ) ) ( ON_BOARD ?auto_11992 ?auto_11991 ) ( not ( = ?auto_11995 ?auto_11992 ) ) ( SUPPORTS ?auto_11992 ?auto_11989 ) ( not ( = ?auto_11993 ?auto_11989 ) ) ( not ( = ?auto_11987 ?auto_11989 ) ) ( POINTING ?auto_11991 ?auto_11990 ) ( CALIBRATION_TARGET ?auto_11992 ?auto_11990 ) ( POWER_AVAIL ?auto_11991 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_11992 ?auto_11991 )
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
      ?auto_12000 - INSTRUMENT
      ?auto_12001 - SATELLITE
      ?auto_12005 - DIRECTION
      ?auto_12004 - DIRECTION
      ?auto_12002 - INSTRUMENT
      ?auto_12003 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_11999 ?auto_11996 ) ) ( ON_BOARD ?auto_12000 ?auto_12001 ) ( SUPPORTS ?auto_12000 ?auto_11998 ) ( not ( = ?auto_11999 ?auto_12005 ) ) ( HAVE_IMAGE ?auto_11996 ?auto_11997 ) ( not ( = ?auto_11996 ?auto_12005 ) ) ( not ( = ?auto_11997 ?auto_11998 ) ) ( CALIBRATION_TARGET ?auto_12000 ?auto_12005 ) ( not ( = ?auto_12005 ?auto_12004 ) ) ( not ( = ?auto_11999 ?auto_12004 ) ) ( not ( = ?auto_11996 ?auto_12004 ) ) ( ON_BOARD ?auto_12002 ?auto_12001 ) ( not ( = ?auto_12000 ?auto_12002 ) ) ( SUPPORTS ?auto_12002 ?auto_12003 ) ( not ( = ?auto_11997 ?auto_12003 ) ) ( not ( = ?auto_11998 ?auto_12003 ) ) ( POINTING ?auto_12001 ?auto_12005 ) ( CALIBRATION_TARGET ?auto_12002 ?auto_12005 ) ( POWER_AVAIL ?auto_12001 ) )
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
      ?auto_12013 - DIRECTION
      ?auto_12014 - INSTRUMENT
      ?auto_12015 - SATELLITE
      ?auto_12011 - DIRECTION
      ?auto_12012 - MODE
      ?auto_12010 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12009 ?auto_12006 ) ) ( not ( = ?auto_12009 ?auto_12013 ) ) ( ON_BOARD ?auto_12014 ?auto_12015 ) ( SUPPORTS ?auto_12014 ?auto_12008 ) ( not ( = ?auto_12009 ?auto_12011 ) ) ( HAVE_IMAGE ?auto_12013 ?auto_12012 ) ( not ( = ?auto_12013 ?auto_12011 ) ) ( not ( = ?auto_12012 ?auto_12008 ) ) ( CALIBRATION_TARGET ?auto_12014 ?auto_12011 ) ( not ( = ?auto_12011 ?auto_12006 ) ) ( not ( = ?auto_12013 ?auto_12006 ) ) ( ON_BOARD ?auto_12010 ?auto_12015 ) ( not ( = ?auto_12014 ?auto_12010 ) ) ( SUPPORTS ?auto_12010 ?auto_12007 ) ( not ( = ?auto_12012 ?auto_12007 ) ) ( not ( = ?auto_12008 ?auto_12007 ) ) ( POINTING ?auto_12015 ?auto_12011 ) ( CALIBRATION_TARGET ?auto_12010 ?auto_12011 ) ( POWER_AVAIL ?auto_12015 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12013 ?auto_12012 ?auto_12009 ?auto_12008 )
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
      ?auto_12024 - INSTRUMENT
      ?auto_12025 - SATELLITE
      ?auto_12022 - DIRECTION
      ?auto_12023 - DIRECTION
      ?auto_12021 - INSTRUMENT
      ?auto_12020 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_12019 ?auto_12016 ) ) ( ON_BOARD ?auto_12024 ?auto_12025 ) ( SUPPORTS ?auto_12024 ?auto_12017 ) ( not ( = ?auto_12016 ?auto_12022 ) ) ( HAVE_IMAGE ?auto_12019 ?auto_12018 ) ( not ( = ?auto_12019 ?auto_12022 ) ) ( not ( = ?auto_12018 ?auto_12017 ) ) ( CALIBRATION_TARGET ?auto_12024 ?auto_12022 ) ( not ( = ?auto_12022 ?auto_12023 ) ) ( not ( = ?auto_12016 ?auto_12023 ) ) ( not ( = ?auto_12019 ?auto_12023 ) ) ( ON_BOARD ?auto_12021 ?auto_12025 ) ( not ( = ?auto_12024 ?auto_12021 ) ) ( SUPPORTS ?auto_12021 ?auto_12020 ) ( not ( = ?auto_12018 ?auto_12020 ) ) ( not ( = ?auto_12017 ?auto_12020 ) ) ( POINTING ?auto_12025 ?auto_12022 ) ( CALIBRATION_TARGET ?auto_12021 ?auto_12022 ) ( POWER_AVAIL ?auto_12025 ) )
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
      ?auto_12033 - DIRECTION
      ?auto_12034 - INSTRUMENT
      ?auto_12035 - SATELLITE
      ?auto_12031 - DIRECTION
      ?auto_12032 - MODE
      ?auto_12030 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12029 ?auto_12026 ) ) ( not ( = ?auto_12026 ?auto_12033 ) ) ( ON_BOARD ?auto_12034 ?auto_12035 ) ( SUPPORTS ?auto_12034 ?auto_12027 ) ( not ( = ?auto_12026 ?auto_12031 ) ) ( HAVE_IMAGE ?auto_12033 ?auto_12032 ) ( not ( = ?auto_12033 ?auto_12031 ) ) ( not ( = ?auto_12032 ?auto_12027 ) ) ( CALIBRATION_TARGET ?auto_12034 ?auto_12031 ) ( not ( = ?auto_12031 ?auto_12029 ) ) ( not ( = ?auto_12033 ?auto_12029 ) ) ( ON_BOARD ?auto_12030 ?auto_12035 ) ( not ( = ?auto_12034 ?auto_12030 ) ) ( SUPPORTS ?auto_12030 ?auto_12028 ) ( not ( = ?auto_12032 ?auto_12028 ) ) ( not ( = ?auto_12027 ?auto_12028 ) ) ( POINTING ?auto_12035 ?auto_12031 ) ( CALIBRATION_TARGET ?auto_12030 ?auto_12031 ) ( POWER_AVAIL ?auto_12035 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12033 ?auto_12032 ?auto_12026 ?auto_12027 )
      ( GET-2IMAGE-VERIFY ?auto_12026 ?auto_12027 ?auto_12029 ?auto_12028 ) )
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
      ?auto_12068 - INSTRUMENT
      ?auto_12069 - SATELLITE
      ?auto_12067 - DIRECTION
      ?auto_12066 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12063 ?auto_12060 ) ) ( not ( = ?auto_12065 ?auto_12060 ) ) ( not ( = ?auto_12065 ?auto_12063 ) ) ( ON_BOARD ?auto_12068 ?auto_12069 ) ( SUPPORTS ?auto_12068 ?auto_12064 ) ( not ( = ?auto_12065 ?auto_12067 ) ) ( HAVE_IMAGE ?auto_12060 ?auto_12061 ) ( not ( = ?auto_12060 ?auto_12067 ) ) ( not ( = ?auto_12061 ?auto_12064 ) ) ( CALIBRATION_TARGET ?auto_12068 ?auto_12067 ) ( not ( = ?auto_12067 ?auto_12063 ) ) ( ON_BOARD ?auto_12066 ?auto_12069 ) ( not ( = ?auto_12068 ?auto_12066 ) ) ( SUPPORTS ?auto_12066 ?auto_12062 ) ( not ( = ?auto_12061 ?auto_12062 ) ) ( not ( = ?auto_12064 ?auto_12062 ) ) ( POINTING ?auto_12069 ?auto_12067 ) ( CALIBRATION_TARGET ?auto_12066 ?auto_12067 ) ( POWER_AVAIL ?auto_12069 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12060 ?auto_12061 ?auto_12065 ?auto_12064 )
      ( GET-3IMAGE-VERIFY ?auto_12060 ?auto_12061 ?auto_12063 ?auto_12062 ?auto_12065 ?auto_12064 ) )
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
      ?auto_12090 - INSTRUMENT
      ?auto_12091 - SATELLITE
      ?auto_12089 - DIRECTION
      ?auto_12088 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12085 ?auto_12082 ) ) ( not ( = ?auto_12087 ?auto_12082 ) ) ( not ( = ?auto_12087 ?auto_12085 ) ) ( ON_BOARD ?auto_12090 ?auto_12091 ) ( SUPPORTS ?auto_12090 ?auto_12084 ) ( not ( = ?auto_12085 ?auto_12089 ) ) ( HAVE_IMAGE ?auto_12082 ?auto_12083 ) ( not ( = ?auto_12082 ?auto_12089 ) ) ( not ( = ?auto_12083 ?auto_12084 ) ) ( CALIBRATION_TARGET ?auto_12090 ?auto_12089 ) ( not ( = ?auto_12089 ?auto_12087 ) ) ( ON_BOARD ?auto_12088 ?auto_12091 ) ( not ( = ?auto_12090 ?auto_12088 ) ) ( SUPPORTS ?auto_12088 ?auto_12086 ) ( not ( = ?auto_12083 ?auto_12086 ) ) ( not ( = ?auto_12084 ?auto_12086 ) ) ( POINTING ?auto_12091 ?auto_12089 ) ( CALIBRATION_TARGET ?auto_12088 ?auto_12089 ) ( POWER_AVAIL ?auto_12091 ) )
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
      ?auto_12112 - INSTRUMENT
      ?auto_12113 - SATELLITE
      ?auto_12111 - DIRECTION
      ?auto_12110 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12107 ?auto_12104 ) ) ( not ( = ?auto_12109 ?auto_12104 ) ) ( not ( = ?auto_12109 ?auto_12107 ) ) ( ON_BOARD ?auto_12112 ?auto_12113 ) ( SUPPORTS ?auto_12112 ?auto_12108 ) ( not ( = ?auto_12109 ?auto_12111 ) ) ( HAVE_IMAGE ?auto_12107 ?auto_12106 ) ( not ( = ?auto_12107 ?auto_12111 ) ) ( not ( = ?auto_12106 ?auto_12108 ) ) ( CALIBRATION_TARGET ?auto_12112 ?auto_12111 ) ( not ( = ?auto_12111 ?auto_12104 ) ) ( ON_BOARD ?auto_12110 ?auto_12113 ) ( not ( = ?auto_12112 ?auto_12110 ) ) ( SUPPORTS ?auto_12110 ?auto_12105 ) ( not ( = ?auto_12106 ?auto_12105 ) ) ( not ( = ?auto_12108 ?auto_12105 ) ) ( POINTING ?auto_12113 ?auto_12111 ) ( CALIBRATION_TARGET ?auto_12110 ?auto_12111 ) ( POWER_AVAIL ?auto_12113 ) )
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
      ?auto_12134 - INSTRUMENT
      ?auto_12135 - SATELLITE
      ?auto_12133 - DIRECTION
      ?auto_12132 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12129 ?auto_12126 ) ) ( not ( = ?auto_12131 ?auto_12126 ) ) ( not ( = ?auto_12131 ?auto_12129 ) ) ( ON_BOARD ?auto_12134 ?auto_12135 ) ( SUPPORTS ?auto_12134 ?auto_12128 ) ( not ( = ?auto_12129 ?auto_12133 ) ) ( HAVE_IMAGE ?auto_12131 ?auto_12130 ) ( not ( = ?auto_12131 ?auto_12133 ) ) ( not ( = ?auto_12130 ?auto_12128 ) ) ( CALIBRATION_TARGET ?auto_12134 ?auto_12133 ) ( not ( = ?auto_12133 ?auto_12126 ) ) ( ON_BOARD ?auto_12132 ?auto_12135 ) ( not ( = ?auto_12134 ?auto_12132 ) ) ( SUPPORTS ?auto_12132 ?auto_12127 ) ( not ( = ?auto_12130 ?auto_12127 ) ) ( not ( = ?auto_12128 ?auto_12127 ) ) ( POINTING ?auto_12135 ?auto_12133 ) ( CALIBRATION_TARGET ?auto_12132 ?auto_12133 ) ( POWER_AVAIL ?auto_12135 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12131 ?auto_12130 ?auto_12129 ?auto_12128 )
      ( GET-3IMAGE-VERIFY ?auto_12126 ?auto_12127 ?auto_12129 ?auto_12128 ?auto_12131 ?auto_12130 ) )
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
      ?auto_12180 - INSTRUMENT
      ?auto_12181 - SATELLITE
      ?auto_12179 - DIRECTION
      ?auto_12178 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12175 ?auto_12172 ) ) ( not ( = ?auto_12177 ?auto_12172 ) ) ( not ( = ?auto_12177 ?auto_12175 ) ) ( ON_BOARD ?auto_12180 ?auto_12181 ) ( SUPPORTS ?auto_12180 ?auto_12173 ) ( not ( = ?auto_12172 ?auto_12179 ) ) ( HAVE_IMAGE ?auto_12175 ?auto_12174 ) ( not ( = ?auto_12175 ?auto_12179 ) ) ( not ( = ?auto_12174 ?auto_12173 ) ) ( CALIBRATION_TARGET ?auto_12180 ?auto_12179 ) ( not ( = ?auto_12179 ?auto_12177 ) ) ( ON_BOARD ?auto_12178 ?auto_12181 ) ( not ( = ?auto_12180 ?auto_12178 ) ) ( SUPPORTS ?auto_12178 ?auto_12176 ) ( not ( = ?auto_12174 ?auto_12176 ) ) ( not ( = ?auto_12173 ?auto_12176 ) ) ( POINTING ?auto_12181 ?auto_12179 ) ( CALIBRATION_TARGET ?auto_12178 ?auto_12179 ) ( POWER_AVAIL ?auto_12181 ) )
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
      ?auto_12202 - INSTRUMENT
      ?auto_12203 - SATELLITE
      ?auto_12201 - DIRECTION
      ?auto_12200 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12197 ?auto_12194 ) ) ( not ( = ?auto_12199 ?auto_12194 ) ) ( not ( = ?auto_12199 ?auto_12197 ) ) ( ON_BOARD ?auto_12202 ?auto_12203 ) ( SUPPORTS ?auto_12202 ?auto_12195 ) ( not ( = ?auto_12194 ?auto_12201 ) ) ( HAVE_IMAGE ?auto_12199 ?auto_12198 ) ( not ( = ?auto_12199 ?auto_12201 ) ) ( not ( = ?auto_12198 ?auto_12195 ) ) ( CALIBRATION_TARGET ?auto_12202 ?auto_12201 ) ( not ( = ?auto_12201 ?auto_12197 ) ) ( ON_BOARD ?auto_12200 ?auto_12203 ) ( not ( = ?auto_12202 ?auto_12200 ) ) ( SUPPORTS ?auto_12200 ?auto_12196 ) ( not ( = ?auto_12198 ?auto_12196 ) ) ( not ( = ?auto_12195 ?auto_12196 ) ) ( POINTING ?auto_12203 ?auto_12201 ) ( CALIBRATION_TARGET ?auto_12200 ?auto_12201 ) ( POWER_AVAIL ?auto_12203 ) )
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
      ?auto_12273 - DIRECTION
      ?auto_12274 - INSTRUMENT
      ?auto_12275 - SATELLITE
      ?auto_12270 - DIRECTION
      ?auto_12272 - MODE
      ?auto_12271 - DIRECTION
      ?auto_12269 - INSTRUMENT
      ?auto_12268 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_12266 ?auto_12273 ) ) ( ON_BOARD ?auto_12274 ?auto_12275 ) ( SUPPORTS ?auto_12274 ?auto_12267 ) ( not ( = ?auto_12266 ?auto_12270 ) ) ( HAVE_IMAGE ?auto_12273 ?auto_12272 ) ( not ( = ?auto_12273 ?auto_12270 ) ) ( not ( = ?auto_12272 ?auto_12267 ) ) ( CALIBRATION_TARGET ?auto_12274 ?auto_12270 ) ( not ( = ?auto_12270 ?auto_12271 ) ) ( not ( = ?auto_12266 ?auto_12271 ) ) ( not ( = ?auto_12273 ?auto_12271 ) ) ( ON_BOARD ?auto_12269 ?auto_12275 ) ( not ( = ?auto_12274 ?auto_12269 ) ) ( SUPPORTS ?auto_12269 ?auto_12268 ) ( not ( = ?auto_12272 ?auto_12268 ) ) ( not ( = ?auto_12267 ?auto_12268 ) ) ( CALIBRATION_TARGET ?auto_12269 ?auto_12270 ) ( POWER_AVAIL ?auto_12275 ) ( POINTING ?auto_12275 ?auto_12273 ) )
    :subtasks
    ( ( !TURN_TO ?auto_12275 ?auto_12270 ?auto_12273 )
      ( GET-2IMAGE ?auto_12273 ?auto_12272 ?auto_12266 ?auto_12267 )
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
      ?auto_12283 - INSTRUMENT
      ?auto_12285 - SATELLITE
      ?auto_12282 - DIRECTION
      ?auto_12281 - DIRECTION
      ?auto_12280 - INSTRUMENT
      ?auto_12284 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_12279 ?auto_12276 ) ) ( ON_BOARD ?auto_12283 ?auto_12285 ) ( SUPPORTS ?auto_12283 ?auto_12278 ) ( not ( = ?auto_12279 ?auto_12282 ) ) ( HAVE_IMAGE ?auto_12276 ?auto_12277 ) ( not ( = ?auto_12276 ?auto_12282 ) ) ( not ( = ?auto_12277 ?auto_12278 ) ) ( CALIBRATION_TARGET ?auto_12283 ?auto_12282 ) ( not ( = ?auto_12282 ?auto_12281 ) ) ( not ( = ?auto_12279 ?auto_12281 ) ) ( not ( = ?auto_12276 ?auto_12281 ) ) ( ON_BOARD ?auto_12280 ?auto_12285 ) ( not ( = ?auto_12283 ?auto_12280 ) ) ( SUPPORTS ?auto_12280 ?auto_12284 ) ( not ( = ?auto_12277 ?auto_12284 ) ) ( not ( = ?auto_12278 ?auto_12284 ) ) ( CALIBRATION_TARGET ?auto_12280 ?auto_12282 ) ( POWER_AVAIL ?auto_12285 ) ( POINTING ?auto_12285 ?auto_12276 ) )
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
      ?auto_12292 - DIRECTION
      ?auto_12290 - INSTRUMENT
      ?auto_12293 - SATELLITE
      ?auto_12294 - DIRECTION
      ?auto_12291 - MODE
      ?auto_12295 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12289 ?auto_12286 ) ) ( not ( = ?auto_12289 ?auto_12292 ) ) ( ON_BOARD ?auto_12290 ?auto_12293 ) ( SUPPORTS ?auto_12290 ?auto_12288 ) ( not ( = ?auto_12289 ?auto_12294 ) ) ( HAVE_IMAGE ?auto_12292 ?auto_12291 ) ( not ( = ?auto_12292 ?auto_12294 ) ) ( not ( = ?auto_12291 ?auto_12288 ) ) ( CALIBRATION_TARGET ?auto_12290 ?auto_12294 ) ( not ( = ?auto_12294 ?auto_12286 ) ) ( not ( = ?auto_12292 ?auto_12286 ) ) ( ON_BOARD ?auto_12295 ?auto_12293 ) ( not ( = ?auto_12290 ?auto_12295 ) ) ( SUPPORTS ?auto_12295 ?auto_12287 ) ( not ( = ?auto_12291 ?auto_12287 ) ) ( not ( = ?auto_12288 ?auto_12287 ) ) ( CALIBRATION_TARGET ?auto_12295 ?auto_12294 ) ( POWER_AVAIL ?auto_12293 ) ( POINTING ?auto_12293 ?auto_12292 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12292 ?auto_12291 ?auto_12289 ?auto_12288 )
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
      ?auto_12301 - INSTRUMENT
      ?auto_12302 - SATELLITE
      ?auto_12303 - DIRECTION
      ?auto_12300 - DIRECTION
      ?auto_12304 - INSTRUMENT
      ?auto_12305 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_12299 ?auto_12296 ) ) ( ON_BOARD ?auto_12301 ?auto_12302 ) ( SUPPORTS ?auto_12301 ?auto_12297 ) ( not ( = ?auto_12296 ?auto_12303 ) ) ( HAVE_IMAGE ?auto_12299 ?auto_12298 ) ( not ( = ?auto_12299 ?auto_12303 ) ) ( not ( = ?auto_12298 ?auto_12297 ) ) ( CALIBRATION_TARGET ?auto_12301 ?auto_12303 ) ( not ( = ?auto_12303 ?auto_12300 ) ) ( not ( = ?auto_12296 ?auto_12300 ) ) ( not ( = ?auto_12299 ?auto_12300 ) ) ( ON_BOARD ?auto_12304 ?auto_12302 ) ( not ( = ?auto_12301 ?auto_12304 ) ) ( SUPPORTS ?auto_12304 ?auto_12305 ) ( not ( = ?auto_12298 ?auto_12305 ) ) ( not ( = ?auto_12297 ?auto_12305 ) ) ( CALIBRATION_TARGET ?auto_12304 ?auto_12303 ) ( POWER_AVAIL ?auto_12302 ) ( POINTING ?auto_12302 ?auto_12299 ) )
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
      ?auto_12312 - DIRECTION
      ?auto_12310 - INSTRUMENT
      ?auto_12313 - SATELLITE
      ?auto_12314 - DIRECTION
      ?auto_12311 - MODE
      ?auto_12315 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12309 ?auto_12306 ) ) ( not ( = ?auto_12306 ?auto_12312 ) ) ( ON_BOARD ?auto_12310 ?auto_12313 ) ( SUPPORTS ?auto_12310 ?auto_12307 ) ( not ( = ?auto_12306 ?auto_12314 ) ) ( HAVE_IMAGE ?auto_12312 ?auto_12311 ) ( not ( = ?auto_12312 ?auto_12314 ) ) ( not ( = ?auto_12311 ?auto_12307 ) ) ( CALIBRATION_TARGET ?auto_12310 ?auto_12314 ) ( not ( = ?auto_12314 ?auto_12309 ) ) ( not ( = ?auto_12312 ?auto_12309 ) ) ( ON_BOARD ?auto_12315 ?auto_12313 ) ( not ( = ?auto_12310 ?auto_12315 ) ) ( SUPPORTS ?auto_12315 ?auto_12308 ) ( not ( = ?auto_12311 ?auto_12308 ) ) ( not ( = ?auto_12307 ?auto_12308 ) ) ( CALIBRATION_TARGET ?auto_12315 ?auto_12314 ) ( POWER_AVAIL ?auto_12313 ) ( POINTING ?auto_12313 ?auto_12312 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12312 ?auto_12311 ?auto_12306 ?auto_12307 )
      ( GET-2IMAGE-VERIFY ?auto_12306 ?auto_12307 ?auto_12309 ?auto_12308 ) )
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
      ?auto_12346 - INSTRUMENT
      ?auto_12347 - SATELLITE
      ?auto_12348 - DIRECTION
      ?auto_12349 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12343 ?auto_12340 ) ) ( not ( = ?auto_12345 ?auto_12340 ) ) ( not ( = ?auto_12345 ?auto_12343 ) ) ( ON_BOARD ?auto_12346 ?auto_12347 ) ( SUPPORTS ?auto_12346 ?auto_12344 ) ( not ( = ?auto_12345 ?auto_12348 ) ) ( HAVE_IMAGE ?auto_12340 ?auto_12341 ) ( not ( = ?auto_12340 ?auto_12348 ) ) ( not ( = ?auto_12341 ?auto_12344 ) ) ( CALIBRATION_TARGET ?auto_12346 ?auto_12348 ) ( not ( = ?auto_12348 ?auto_12343 ) ) ( ON_BOARD ?auto_12349 ?auto_12347 ) ( not ( = ?auto_12346 ?auto_12349 ) ) ( SUPPORTS ?auto_12349 ?auto_12342 ) ( not ( = ?auto_12341 ?auto_12342 ) ) ( not ( = ?auto_12344 ?auto_12342 ) ) ( CALIBRATION_TARGET ?auto_12349 ?auto_12348 ) ( POWER_AVAIL ?auto_12347 ) ( POINTING ?auto_12347 ?auto_12340 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12340 ?auto_12341 ?auto_12345 ?auto_12344 )
      ( GET-3IMAGE-VERIFY ?auto_12340 ?auto_12341 ?auto_12343 ?auto_12342 ?auto_12345 ?auto_12344 ) )
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
      ?auto_12368 - INSTRUMENT
      ?auto_12369 - SATELLITE
      ?auto_12370 - DIRECTION
      ?auto_12371 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12365 ?auto_12362 ) ) ( not ( = ?auto_12367 ?auto_12362 ) ) ( not ( = ?auto_12367 ?auto_12365 ) ) ( ON_BOARD ?auto_12368 ?auto_12369 ) ( SUPPORTS ?auto_12368 ?auto_12364 ) ( not ( = ?auto_12365 ?auto_12370 ) ) ( HAVE_IMAGE ?auto_12362 ?auto_12363 ) ( not ( = ?auto_12362 ?auto_12370 ) ) ( not ( = ?auto_12363 ?auto_12364 ) ) ( CALIBRATION_TARGET ?auto_12368 ?auto_12370 ) ( not ( = ?auto_12370 ?auto_12367 ) ) ( ON_BOARD ?auto_12371 ?auto_12369 ) ( not ( = ?auto_12368 ?auto_12371 ) ) ( SUPPORTS ?auto_12371 ?auto_12366 ) ( not ( = ?auto_12363 ?auto_12366 ) ) ( not ( = ?auto_12364 ?auto_12366 ) ) ( CALIBRATION_TARGET ?auto_12371 ?auto_12370 ) ( POWER_AVAIL ?auto_12369 ) ( POINTING ?auto_12369 ?auto_12362 ) )
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
      ?auto_12390 - INSTRUMENT
      ?auto_12391 - SATELLITE
      ?auto_12392 - DIRECTION
      ?auto_12393 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12387 ?auto_12384 ) ) ( not ( = ?auto_12389 ?auto_12384 ) ) ( not ( = ?auto_12389 ?auto_12387 ) ) ( ON_BOARD ?auto_12390 ?auto_12391 ) ( SUPPORTS ?auto_12390 ?auto_12388 ) ( not ( = ?auto_12389 ?auto_12392 ) ) ( HAVE_IMAGE ?auto_12387 ?auto_12386 ) ( not ( = ?auto_12387 ?auto_12392 ) ) ( not ( = ?auto_12386 ?auto_12388 ) ) ( CALIBRATION_TARGET ?auto_12390 ?auto_12392 ) ( not ( = ?auto_12392 ?auto_12384 ) ) ( ON_BOARD ?auto_12393 ?auto_12391 ) ( not ( = ?auto_12390 ?auto_12393 ) ) ( SUPPORTS ?auto_12393 ?auto_12385 ) ( not ( = ?auto_12386 ?auto_12385 ) ) ( not ( = ?auto_12388 ?auto_12385 ) ) ( CALIBRATION_TARGET ?auto_12393 ?auto_12392 ) ( POWER_AVAIL ?auto_12391 ) ( POINTING ?auto_12391 ?auto_12387 ) )
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
      ?auto_12412 - INSTRUMENT
      ?auto_12413 - SATELLITE
      ?auto_12414 - DIRECTION
      ?auto_12415 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12409 ?auto_12406 ) ) ( not ( = ?auto_12411 ?auto_12406 ) ) ( not ( = ?auto_12411 ?auto_12409 ) ) ( ON_BOARD ?auto_12412 ?auto_12413 ) ( SUPPORTS ?auto_12412 ?auto_12408 ) ( not ( = ?auto_12409 ?auto_12414 ) ) ( HAVE_IMAGE ?auto_12411 ?auto_12410 ) ( not ( = ?auto_12411 ?auto_12414 ) ) ( not ( = ?auto_12410 ?auto_12408 ) ) ( CALIBRATION_TARGET ?auto_12412 ?auto_12414 ) ( not ( = ?auto_12414 ?auto_12406 ) ) ( ON_BOARD ?auto_12415 ?auto_12413 ) ( not ( = ?auto_12412 ?auto_12415 ) ) ( SUPPORTS ?auto_12415 ?auto_12407 ) ( not ( = ?auto_12410 ?auto_12407 ) ) ( not ( = ?auto_12408 ?auto_12407 ) ) ( CALIBRATION_TARGET ?auto_12415 ?auto_12414 ) ( POWER_AVAIL ?auto_12413 ) ( POINTING ?auto_12413 ?auto_12411 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12411 ?auto_12410 ?auto_12409 ?auto_12408 )
      ( GET-3IMAGE-VERIFY ?auto_12406 ?auto_12407 ?auto_12409 ?auto_12408 ?auto_12411 ?auto_12410 ) )
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
      ?auto_12458 - INSTRUMENT
      ?auto_12459 - SATELLITE
      ?auto_12460 - DIRECTION
      ?auto_12461 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12455 ?auto_12452 ) ) ( not ( = ?auto_12457 ?auto_12452 ) ) ( not ( = ?auto_12457 ?auto_12455 ) ) ( ON_BOARD ?auto_12458 ?auto_12459 ) ( SUPPORTS ?auto_12458 ?auto_12453 ) ( not ( = ?auto_12452 ?auto_12460 ) ) ( HAVE_IMAGE ?auto_12455 ?auto_12454 ) ( not ( = ?auto_12455 ?auto_12460 ) ) ( not ( = ?auto_12454 ?auto_12453 ) ) ( CALIBRATION_TARGET ?auto_12458 ?auto_12460 ) ( not ( = ?auto_12460 ?auto_12457 ) ) ( ON_BOARD ?auto_12461 ?auto_12459 ) ( not ( = ?auto_12458 ?auto_12461 ) ) ( SUPPORTS ?auto_12461 ?auto_12456 ) ( not ( = ?auto_12454 ?auto_12456 ) ) ( not ( = ?auto_12453 ?auto_12456 ) ) ( CALIBRATION_TARGET ?auto_12461 ?auto_12460 ) ( POWER_AVAIL ?auto_12459 ) ( POINTING ?auto_12459 ?auto_12455 ) )
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
      ?auto_12480 - INSTRUMENT
      ?auto_12481 - SATELLITE
      ?auto_12482 - DIRECTION
      ?auto_12483 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12477 ?auto_12474 ) ) ( not ( = ?auto_12479 ?auto_12474 ) ) ( not ( = ?auto_12479 ?auto_12477 ) ) ( ON_BOARD ?auto_12480 ?auto_12481 ) ( SUPPORTS ?auto_12480 ?auto_12475 ) ( not ( = ?auto_12474 ?auto_12482 ) ) ( HAVE_IMAGE ?auto_12479 ?auto_12478 ) ( not ( = ?auto_12479 ?auto_12482 ) ) ( not ( = ?auto_12478 ?auto_12475 ) ) ( CALIBRATION_TARGET ?auto_12480 ?auto_12482 ) ( not ( = ?auto_12482 ?auto_12477 ) ) ( ON_BOARD ?auto_12483 ?auto_12481 ) ( not ( = ?auto_12480 ?auto_12483 ) ) ( SUPPORTS ?auto_12483 ?auto_12476 ) ( not ( = ?auto_12478 ?auto_12476 ) ) ( not ( = ?auto_12475 ?auto_12476 ) ) ( CALIBRATION_TARGET ?auto_12483 ?auto_12482 ) ( POWER_AVAIL ?auto_12481 ) ( POINTING ?auto_12481 ?auto_12479 ) )
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
      ?auto_12551 - DIRECTION
      ?auto_12549 - INSTRUMENT
      ?auto_12552 - SATELLITE
      ?auto_12553 - DIRECTION
      ?auto_12550 - MODE
      ?auto_12548 - DIRECTION
      ?auto_12554 - INSTRUMENT
      ?auto_12555 - MODE
      ?auto_12556 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12546 ?auto_12551 ) ) ( ON_BOARD ?auto_12549 ?auto_12552 ) ( SUPPORTS ?auto_12549 ?auto_12547 ) ( not ( = ?auto_12546 ?auto_12553 ) ) ( HAVE_IMAGE ?auto_12551 ?auto_12550 ) ( not ( = ?auto_12551 ?auto_12553 ) ) ( not ( = ?auto_12550 ?auto_12547 ) ) ( CALIBRATION_TARGET ?auto_12549 ?auto_12553 ) ( not ( = ?auto_12553 ?auto_12548 ) ) ( not ( = ?auto_12546 ?auto_12548 ) ) ( not ( = ?auto_12551 ?auto_12548 ) ) ( ON_BOARD ?auto_12554 ?auto_12552 ) ( not ( = ?auto_12549 ?auto_12554 ) ) ( SUPPORTS ?auto_12554 ?auto_12555 ) ( not ( = ?auto_12550 ?auto_12555 ) ) ( not ( = ?auto_12547 ?auto_12555 ) ) ( CALIBRATION_TARGET ?auto_12554 ?auto_12553 ) ( POINTING ?auto_12552 ?auto_12551 ) ( ON_BOARD ?auto_12556 ?auto_12552 ) ( POWER_ON ?auto_12556 ) ( not ( = ?auto_12549 ?auto_12556 ) ) ( not ( = ?auto_12554 ?auto_12556 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_12556 ?auto_12552 )
      ( GET-2IMAGE ?auto_12551 ?auto_12550 ?auto_12546 ?auto_12547 )
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
      ?auto_12564 - INSTRUMENT
      ?auto_12567 - SATELLITE
      ?auto_12561 - DIRECTION
      ?auto_12562 - DIRECTION
      ?auto_12565 - INSTRUMENT
      ?auto_12566 - MODE
      ?auto_12563 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12560 ?auto_12557 ) ) ( ON_BOARD ?auto_12564 ?auto_12567 ) ( SUPPORTS ?auto_12564 ?auto_12559 ) ( not ( = ?auto_12560 ?auto_12561 ) ) ( HAVE_IMAGE ?auto_12557 ?auto_12558 ) ( not ( = ?auto_12557 ?auto_12561 ) ) ( not ( = ?auto_12558 ?auto_12559 ) ) ( CALIBRATION_TARGET ?auto_12564 ?auto_12561 ) ( not ( = ?auto_12561 ?auto_12562 ) ) ( not ( = ?auto_12560 ?auto_12562 ) ) ( not ( = ?auto_12557 ?auto_12562 ) ) ( ON_BOARD ?auto_12565 ?auto_12567 ) ( not ( = ?auto_12564 ?auto_12565 ) ) ( SUPPORTS ?auto_12565 ?auto_12566 ) ( not ( = ?auto_12558 ?auto_12566 ) ) ( not ( = ?auto_12559 ?auto_12566 ) ) ( CALIBRATION_TARGET ?auto_12565 ?auto_12561 ) ( POINTING ?auto_12567 ?auto_12557 ) ( ON_BOARD ?auto_12563 ?auto_12567 ) ( POWER_ON ?auto_12563 ) ( not ( = ?auto_12564 ?auto_12563 ) ) ( not ( = ?auto_12565 ?auto_12563 ) ) )
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
      ?auto_12577 - DIRECTION
      ?auto_12572 - INSTRUMENT
      ?auto_12573 - SATELLITE
      ?auto_12575 - DIRECTION
      ?auto_12576 - MODE
      ?auto_12574 - INSTRUMENT
      ?auto_12578 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12571 ?auto_12568 ) ) ( not ( = ?auto_12571 ?auto_12577 ) ) ( ON_BOARD ?auto_12572 ?auto_12573 ) ( SUPPORTS ?auto_12572 ?auto_12570 ) ( not ( = ?auto_12571 ?auto_12575 ) ) ( HAVE_IMAGE ?auto_12577 ?auto_12576 ) ( not ( = ?auto_12577 ?auto_12575 ) ) ( not ( = ?auto_12576 ?auto_12570 ) ) ( CALIBRATION_TARGET ?auto_12572 ?auto_12575 ) ( not ( = ?auto_12575 ?auto_12568 ) ) ( not ( = ?auto_12577 ?auto_12568 ) ) ( ON_BOARD ?auto_12574 ?auto_12573 ) ( not ( = ?auto_12572 ?auto_12574 ) ) ( SUPPORTS ?auto_12574 ?auto_12569 ) ( not ( = ?auto_12576 ?auto_12569 ) ) ( not ( = ?auto_12570 ?auto_12569 ) ) ( CALIBRATION_TARGET ?auto_12574 ?auto_12575 ) ( POINTING ?auto_12573 ?auto_12577 ) ( ON_BOARD ?auto_12578 ?auto_12573 ) ( POWER_ON ?auto_12578 ) ( not ( = ?auto_12572 ?auto_12578 ) ) ( not ( = ?auto_12574 ?auto_12578 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12577 ?auto_12576 ?auto_12571 ?auto_12570 )
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
      ?auto_12583 - INSTRUMENT
      ?auto_12584 - SATELLITE
      ?auto_12586 - DIRECTION
      ?auto_12587 - DIRECTION
      ?auto_12585 - INSTRUMENT
      ?auto_12588 - MODE
      ?auto_12589 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12582 ?auto_12579 ) ) ( ON_BOARD ?auto_12583 ?auto_12584 ) ( SUPPORTS ?auto_12583 ?auto_12580 ) ( not ( = ?auto_12579 ?auto_12586 ) ) ( HAVE_IMAGE ?auto_12582 ?auto_12581 ) ( not ( = ?auto_12582 ?auto_12586 ) ) ( not ( = ?auto_12581 ?auto_12580 ) ) ( CALIBRATION_TARGET ?auto_12583 ?auto_12586 ) ( not ( = ?auto_12586 ?auto_12587 ) ) ( not ( = ?auto_12579 ?auto_12587 ) ) ( not ( = ?auto_12582 ?auto_12587 ) ) ( ON_BOARD ?auto_12585 ?auto_12584 ) ( not ( = ?auto_12583 ?auto_12585 ) ) ( SUPPORTS ?auto_12585 ?auto_12588 ) ( not ( = ?auto_12581 ?auto_12588 ) ) ( not ( = ?auto_12580 ?auto_12588 ) ) ( CALIBRATION_TARGET ?auto_12585 ?auto_12586 ) ( POINTING ?auto_12584 ?auto_12582 ) ( ON_BOARD ?auto_12589 ?auto_12584 ) ( POWER_ON ?auto_12589 ) ( not ( = ?auto_12583 ?auto_12589 ) ) ( not ( = ?auto_12585 ?auto_12589 ) ) )
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
      ?auto_12599 - DIRECTION
      ?auto_12594 - INSTRUMENT
      ?auto_12595 - SATELLITE
      ?auto_12597 - DIRECTION
      ?auto_12598 - MODE
      ?auto_12596 - INSTRUMENT
      ?auto_12600 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12593 ?auto_12590 ) ) ( not ( = ?auto_12590 ?auto_12599 ) ) ( ON_BOARD ?auto_12594 ?auto_12595 ) ( SUPPORTS ?auto_12594 ?auto_12591 ) ( not ( = ?auto_12590 ?auto_12597 ) ) ( HAVE_IMAGE ?auto_12599 ?auto_12598 ) ( not ( = ?auto_12599 ?auto_12597 ) ) ( not ( = ?auto_12598 ?auto_12591 ) ) ( CALIBRATION_TARGET ?auto_12594 ?auto_12597 ) ( not ( = ?auto_12597 ?auto_12593 ) ) ( not ( = ?auto_12599 ?auto_12593 ) ) ( ON_BOARD ?auto_12596 ?auto_12595 ) ( not ( = ?auto_12594 ?auto_12596 ) ) ( SUPPORTS ?auto_12596 ?auto_12592 ) ( not ( = ?auto_12598 ?auto_12592 ) ) ( not ( = ?auto_12591 ?auto_12592 ) ) ( CALIBRATION_TARGET ?auto_12596 ?auto_12597 ) ( POINTING ?auto_12595 ?auto_12599 ) ( ON_BOARD ?auto_12600 ?auto_12595 ) ( POWER_ON ?auto_12600 ) ( not ( = ?auto_12594 ?auto_12600 ) ) ( not ( = ?auto_12596 ?auto_12600 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12599 ?auto_12598 ?auto_12590 ?auto_12591 )
      ( GET-2IMAGE-VERIFY ?auto_12590 ?auto_12591 ?auto_12593 ?auto_12592 ) )
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
      ?auto_12633 - INSTRUMENT
      ?auto_12634 - SATELLITE
      ?auto_12636 - DIRECTION
      ?auto_12635 - INSTRUMENT
      ?auto_12637 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12630 ?auto_12627 ) ) ( not ( = ?auto_12632 ?auto_12627 ) ) ( not ( = ?auto_12632 ?auto_12630 ) ) ( ON_BOARD ?auto_12633 ?auto_12634 ) ( SUPPORTS ?auto_12633 ?auto_12631 ) ( not ( = ?auto_12632 ?auto_12636 ) ) ( HAVE_IMAGE ?auto_12627 ?auto_12628 ) ( not ( = ?auto_12627 ?auto_12636 ) ) ( not ( = ?auto_12628 ?auto_12631 ) ) ( CALIBRATION_TARGET ?auto_12633 ?auto_12636 ) ( not ( = ?auto_12636 ?auto_12630 ) ) ( ON_BOARD ?auto_12635 ?auto_12634 ) ( not ( = ?auto_12633 ?auto_12635 ) ) ( SUPPORTS ?auto_12635 ?auto_12629 ) ( not ( = ?auto_12628 ?auto_12629 ) ) ( not ( = ?auto_12631 ?auto_12629 ) ) ( CALIBRATION_TARGET ?auto_12635 ?auto_12636 ) ( POINTING ?auto_12634 ?auto_12627 ) ( ON_BOARD ?auto_12637 ?auto_12634 ) ( POWER_ON ?auto_12637 ) ( not ( = ?auto_12633 ?auto_12637 ) ) ( not ( = ?auto_12635 ?auto_12637 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12627 ?auto_12628 ?auto_12632 ?auto_12631 )
      ( GET-3IMAGE-VERIFY ?auto_12627 ?auto_12628 ?auto_12630 ?auto_12629 ?auto_12632 ?auto_12631 ) )
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
      ?auto_12657 - INSTRUMENT
      ?auto_12658 - SATELLITE
      ?auto_12660 - DIRECTION
      ?auto_12659 - INSTRUMENT
      ?auto_12661 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12654 ?auto_12651 ) ) ( not ( = ?auto_12656 ?auto_12651 ) ) ( not ( = ?auto_12656 ?auto_12654 ) ) ( ON_BOARD ?auto_12657 ?auto_12658 ) ( SUPPORTS ?auto_12657 ?auto_12653 ) ( not ( = ?auto_12654 ?auto_12660 ) ) ( HAVE_IMAGE ?auto_12651 ?auto_12652 ) ( not ( = ?auto_12651 ?auto_12660 ) ) ( not ( = ?auto_12652 ?auto_12653 ) ) ( CALIBRATION_TARGET ?auto_12657 ?auto_12660 ) ( not ( = ?auto_12660 ?auto_12656 ) ) ( ON_BOARD ?auto_12659 ?auto_12658 ) ( not ( = ?auto_12657 ?auto_12659 ) ) ( SUPPORTS ?auto_12659 ?auto_12655 ) ( not ( = ?auto_12652 ?auto_12655 ) ) ( not ( = ?auto_12653 ?auto_12655 ) ) ( CALIBRATION_TARGET ?auto_12659 ?auto_12660 ) ( POINTING ?auto_12658 ?auto_12651 ) ( ON_BOARD ?auto_12661 ?auto_12658 ) ( POWER_ON ?auto_12661 ) ( not ( = ?auto_12657 ?auto_12661 ) ) ( not ( = ?auto_12659 ?auto_12661 ) ) )
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
      ?auto_12681 - INSTRUMENT
      ?auto_12682 - SATELLITE
      ?auto_12684 - DIRECTION
      ?auto_12683 - INSTRUMENT
      ?auto_12685 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12678 ?auto_12675 ) ) ( not ( = ?auto_12680 ?auto_12675 ) ) ( not ( = ?auto_12680 ?auto_12678 ) ) ( ON_BOARD ?auto_12681 ?auto_12682 ) ( SUPPORTS ?auto_12681 ?auto_12679 ) ( not ( = ?auto_12680 ?auto_12684 ) ) ( HAVE_IMAGE ?auto_12678 ?auto_12677 ) ( not ( = ?auto_12678 ?auto_12684 ) ) ( not ( = ?auto_12677 ?auto_12679 ) ) ( CALIBRATION_TARGET ?auto_12681 ?auto_12684 ) ( not ( = ?auto_12684 ?auto_12675 ) ) ( ON_BOARD ?auto_12683 ?auto_12682 ) ( not ( = ?auto_12681 ?auto_12683 ) ) ( SUPPORTS ?auto_12683 ?auto_12676 ) ( not ( = ?auto_12677 ?auto_12676 ) ) ( not ( = ?auto_12679 ?auto_12676 ) ) ( CALIBRATION_TARGET ?auto_12683 ?auto_12684 ) ( POINTING ?auto_12682 ?auto_12678 ) ( ON_BOARD ?auto_12685 ?auto_12682 ) ( POWER_ON ?auto_12685 ) ( not ( = ?auto_12681 ?auto_12685 ) ) ( not ( = ?auto_12683 ?auto_12685 ) ) )
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
      ?auto_12705 - INSTRUMENT
      ?auto_12706 - SATELLITE
      ?auto_12708 - DIRECTION
      ?auto_12707 - INSTRUMENT
      ?auto_12709 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12702 ?auto_12699 ) ) ( not ( = ?auto_12704 ?auto_12699 ) ) ( not ( = ?auto_12704 ?auto_12702 ) ) ( ON_BOARD ?auto_12705 ?auto_12706 ) ( SUPPORTS ?auto_12705 ?auto_12701 ) ( not ( = ?auto_12702 ?auto_12708 ) ) ( HAVE_IMAGE ?auto_12704 ?auto_12703 ) ( not ( = ?auto_12704 ?auto_12708 ) ) ( not ( = ?auto_12703 ?auto_12701 ) ) ( CALIBRATION_TARGET ?auto_12705 ?auto_12708 ) ( not ( = ?auto_12708 ?auto_12699 ) ) ( ON_BOARD ?auto_12707 ?auto_12706 ) ( not ( = ?auto_12705 ?auto_12707 ) ) ( SUPPORTS ?auto_12707 ?auto_12700 ) ( not ( = ?auto_12703 ?auto_12700 ) ) ( not ( = ?auto_12701 ?auto_12700 ) ) ( CALIBRATION_TARGET ?auto_12707 ?auto_12708 ) ( POINTING ?auto_12706 ?auto_12704 ) ( ON_BOARD ?auto_12709 ?auto_12706 ) ( POWER_ON ?auto_12709 ) ( not ( = ?auto_12705 ?auto_12709 ) ) ( not ( = ?auto_12707 ?auto_12709 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_12704 ?auto_12703 ?auto_12702 ?auto_12701 )
      ( GET-3IMAGE-VERIFY ?auto_12699 ?auto_12700 ?auto_12702 ?auto_12701 ?auto_12704 ?auto_12703 ) )
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
      ?auto_12755 - INSTRUMENT
      ?auto_12756 - SATELLITE
      ?auto_12758 - DIRECTION
      ?auto_12757 - INSTRUMENT
      ?auto_12759 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12752 ?auto_12749 ) ) ( not ( = ?auto_12754 ?auto_12749 ) ) ( not ( = ?auto_12754 ?auto_12752 ) ) ( ON_BOARD ?auto_12755 ?auto_12756 ) ( SUPPORTS ?auto_12755 ?auto_12750 ) ( not ( = ?auto_12749 ?auto_12758 ) ) ( HAVE_IMAGE ?auto_12752 ?auto_12751 ) ( not ( = ?auto_12752 ?auto_12758 ) ) ( not ( = ?auto_12751 ?auto_12750 ) ) ( CALIBRATION_TARGET ?auto_12755 ?auto_12758 ) ( not ( = ?auto_12758 ?auto_12754 ) ) ( ON_BOARD ?auto_12757 ?auto_12756 ) ( not ( = ?auto_12755 ?auto_12757 ) ) ( SUPPORTS ?auto_12757 ?auto_12753 ) ( not ( = ?auto_12751 ?auto_12753 ) ) ( not ( = ?auto_12750 ?auto_12753 ) ) ( CALIBRATION_TARGET ?auto_12757 ?auto_12758 ) ( POINTING ?auto_12756 ?auto_12752 ) ( ON_BOARD ?auto_12759 ?auto_12756 ) ( POWER_ON ?auto_12759 ) ( not ( = ?auto_12755 ?auto_12759 ) ) ( not ( = ?auto_12757 ?auto_12759 ) ) )
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
      ?auto_12779 - INSTRUMENT
      ?auto_12780 - SATELLITE
      ?auto_12782 - DIRECTION
      ?auto_12781 - INSTRUMENT
      ?auto_12783 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12776 ?auto_12773 ) ) ( not ( = ?auto_12778 ?auto_12773 ) ) ( not ( = ?auto_12778 ?auto_12776 ) ) ( ON_BOARD ?auto_12779 ?auto_12780 ) ( SUPPORTS ?auto_12779 ?auto_12774 ) ( not ( = ?auto_12773 ?auto_12782 ) ) ( HAVE_IMAGE ?auto_12778 ?auto_12777 ) ( not ( = ?auto_12778 ?auto_12782 ) ) ( not ( = ?auto_12777 ?auto_12774 ) ) ( CALIBRATION_TARGET ?auto_12779 ?auto_12782 ) ( not ( = ?auto_12782 ?auto_12776 ) ) ( ON_BOARD ?auto_12781 ?auto_12780 ) ( not ( = ?auto_12779 ?auto_12781 ) ) ( SUPPORTS ?auto_12781 ?auto_12775 ) ( not ( = ?auto_12777 ?auto_12775 ) ) ( not ( = ?auto_12774 ?auto_12775 ) ) ( CALIBRATION_TARGET ?auto_12781 ?auto_12782 ) ( POINTING ?auto_12780 ?auto_12778 ) ( ON_BOARD ?auto_12783 ?auto_12780 ) ( POWER_ON ?auto_12783 ) ( not ( = ?auto_12779 ?auto_12783 ) ) ( not ( = ?auto_12781 ?auto_12783 ) ) )
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
      ?auto_12860 - DIRECTION
      ?auto_12853 - INSTRUMENT
      ?auto_12854 - SATELLITE
      ?auto_12856 - DIRECTION
      ?auto_12859 - MODE
      ?auto_12857 - DIRECTION
      ?auto_12855 - INSTRUMENT
      ?auto_12858 - MODE
      ?auto_12861 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12851 ?auto_12860 ) ) ( ON_BOARD ?auto_12853 ?auto_12854 ) ( SUPPORTS ?auto_12853 ?auto_12852 ) ( not ( = ?auto_12851 ?auto_12856 ) ) ( not ( = ?auto_12860 ?auto_12856 ) ) ( not ( = ?auto_12859 ?auto_12852 ) ) ( CALIBRATION_TARGET ?auto_12853 ?auto_12856 ) ( not ( = ?auto_12856 ?auto_12857 ) ) ( not ( = ?auto_12851 ?auto_12857 ) ) ( not ( = ?auto_12860 ?auto_12857 ) ) ( ON_BOARD ?auto_12855 ?auto_12854 ) ( not ( = ?auto_12853 ?auto_12855 ) ) ( SUPPORTS ?auto_12855 ?auto_12858 ) ( not ( = ?auto_12859 ?auto_12858 ) ) ( not ( = ?auto_12852 ?auto_12858 ) ) ( CALIBRATION_TARGET ?auto_12855 ?auto_12856 ) ( POINTING ?auto_12854 ?auto_12860 ) ( ON_BOARD ?auto_12861 ?auto_12854 ) ( POWER_ON ?auto_12861 ) ( not ( = ?auto_12853 ?auto_12861 ) ) ( not ( = ?auto_12855 ?auto_12861 ) ) ( CALIBRATED ?auto_12861 ) ( SUPPORTS ?auto_12861 ?auto_12859 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_12860 ?auto_12859 )
      ( GET-2IMAGE ?auto_12860 ?auto_12859 ?auto_12851 ?auto_12852 )
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
      ?auto_12867 - INSTRUMENT
      ?auto_12869 - SATELLITE
      ?auto_12866 - DIRECTION
      ?auto_12868 - DIRECTION
      ?auto_12872 - INSTRUMENT
      ?auto_12871 - MODE
      ?auto_12870 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12865 ?auto_12862 ) ) ( ON_BOARD ?auto_12867 ?auto_12869 ) ( SUPPORTS ?auto_12867 ?auto_12864 ) ( not ( = ?auto_12865 ?auto_12866 ) ) ( not ( = ?auto_12862 ?auto_12866 ) ) ( not ( = ?auto_12863 ?auto_12864 ) ) ( CALIBRATION_TARGET ?auto_12867 ?auto_12866 ) ( not ( = ?auto_12866 ?auto_12868 ) ) ( not ( = ?auto_12865 ?auto_12868 ) ) ( not ( = ?auto_12862 ?auto_12868 ) ) ( ON_BOARD ?auto_12872 ?auto_12869 ) ( not ( = ?auto_12867 ?auto_12872 ) ) ( SUPPORTS ?auto_12872 ?auto_12871 ) ( not ( = ?auto_12863 ?auto_12871 ) ) ( not ( = ?auto_12864 ?auto_12871 ) ) ( CALIBRATION_TARGET ?auto_12872 ?auto_12866 ) ( POINTING ?auto_12869 ?auto_12862 ) ( ON_BOARD ?auto_12870 ?auto_12869 ) ( POWER_ON ?auto_12870 ) ( not ( = ?auto_12867 ?auto_12870 ) ) ( not ( = ?auto_12872 ?auto_12870 ) ) ( CALIBRATED ?auto_12870 ) ( SUPPORTS ?auto_12870 ?auto_12863 ) )
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
      ?auto_12883 - DIRECTION
      ?auto_12880 - INSTRUMENT
      ?auto_12879 - SATELLITE
      ?auto_12877 - DIRECTION
      ?auto_12882 - MODE
      ?auto_12881 - INSTRUMENT
      ?auto_12878 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12876 ?auto_12873 ) ) ( not ( = ?auto_12876 ?auto_12883 ) ) ( ON_BOARD ?auto_12880 ?auto_12879 ) ( SUPPORTS ?auto_12880 ?auto_12875 ) ( not ( = ?auto_12876 ?auto_12877 ) ) ( not ( = ?auto_12883 ?auto_12877 ) ) ( not ( = ?auto_12882 ?auto_12875 ) ) ( CALIBRATION_TARGET ?auto_12880 ?auto_12877 ) ( not ( = ?auto_12877 ?auto_12873 ) ) ( not ( = ?auto_12883 ?auto_12873 ) ) ( ON_BOARD ?auto_12881 ?auto_12879 ) ( not ( = ?auto_12880 ?auto_12881 ) ) ( SUPPORTS ?auto_12881 ?auto_12874 ) ( not ( = ?auto_12882 ?auto_12874 ) ) ( not ( = ?auto_12875 ?auto_12874 ) ) ( CALIBRATION_TARGET ?auto_12881 ?auto_12877 ) ( POINTING ?auto_12879 ?auto_12883 ) ( ON_BOARD ?auto_12878 ?auto_12879 ) ( POWER_ON ?auto_12878 ) ( not ( = ?auto_12880 ?auto_12878 ) ) ( not ( = ?auto_12881 ?auto_12878 ) ) ( CALIBRATED ?auto_12878 ) ( SUPPORTS ?auto_12878 ?auto_12882 ) )
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
      ?auto_12891 - INSTRUMENT
      ?auto_12890 - SATELLITE
      ?auto_12888 - DIRECTION
      ?auto_12894 - DIRECTION
      ?auto_12893 - INSTRUMENT
      ?auto_12892 - MODE
      ?auto_12889 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12887 ?auto_12884 ) ) ( ON_BOARD ?auto_12891 ?auto_12890 ) ( SUPPORTS ?auto_12891 ?auto_12885 ) ( not ( = ?auto_12884 ?auto_12888 ) ) ( not ( = ?auto_12887 ?auto_12888 ) ) ( not ( = ?auto_12886 ?auto_12885 ) ) ( CALIBRATION_TARGET ?auto_12891 ?auto_12888 ) ( not ( = ?auto_12888 ?auto_12894 ) ) ( not ( = ?auto_12884 ?auto_12894 ) ) ( not ( = ?auto_12887 ?auto_12894 ) ) ( ON_BOARD ?auto_12893 ?auto_12890 ) ( not ( = ?auto_12891 ?auto_12893 ) ) ( SUPPORTS ?auto_12893 ?auto_12892 ) ( not ( = ?auto_12886 ?auto_12892 ) ) ( not ( = ?auto_12885 ?auto_12892 ) ) ( CALIBRATION_TARGET ?auto_12893 ?auto_12888 ) ( POINTING ?auto_12890 ?auto_12887 ) ( ON_BOARD ?auto_12889 ?auto_12890 ) ( POWER_ON ?auto_12889 ) ( not ( = ?auto_12891 ?auto_12889 ) ) ( not ( = ?auto_12893 ?auto_12889 ) ) ( CALIBRATED ?auto_12889 ) ( SUPPORTS ?auto_12889 ?auto_12886 ) )
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
      ?auto_12905 - DIRECTION
      ?auto_12902 - INSTRUMENT
      ?auto_12901 - SATELLITE
      ?auto_12899 - DIRECTION
      ?auto_12904 - MODE
      ?auto_12903 - INSTRUMENT
      ?auto_12900 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12898 ?auto_12895 ) ) ( not ( = ?auto_12895 ?auto_12905 ) ) ( ON_BOARD ?auto_12902 ?auto_12901 ) ( SUPPORTS ?auto_12902 ?auto_12896 ) ( not ( = ?auto_12895 ?auto_12899 ) ) ( not ( = ?auto_12905 ?auto_12899 ) ) ( not ( = ?auto_12904 ?auto_12896 ) ) ( CALIBRATION_TARGET ?auto_12902 ?auto_12899 ) ( not ( = ?auto_12899 ?auto_12898 ) ) ( not ( = ?auto_12905 ?auto_12898 ) ) ( ON_BOARD ?auto_12903 ?auto_12901 ) ( not ( = ?auto_12902 ?auto_12903 ) ) ( SUPPORTS ?auto_12903 ?auto_12897 ) ( not ( = ?auto_12904 ?auto_12897 ) ) ( not ( = ?auto_12896 ?auto_12897 ) ) ( CALIBRATION_TARGET ?auto_12903 ?auto_12899 ) ( POINTING ?auto_12901 ?auto_12905 ) ( ON_BOARD ?auto_12900 ?auto_12901 ) ( POWER_ON ?auto_12900 ) ( not ( = ?auto_12902 ?auto_12900 ) ) ( not ( = ?auto_12903 ?auto_12900 ) ) ( CALIBRATED ?auto_12900 ) ( SUPPORTS ?auto_12900 ?auto_12904 ) )
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
      ?auto_12941 - INSTRUMENT
      ?auto_12940 - SATELLITE
      ?auto_12938 - DIRECTION
      ?auto_12942 - INSTRUMENT
      ?auto_12939 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12935 ?auto_12932 ) ) ( not ( = ?auto_12937 ?auto_12932 ) ) ( not ( = ?auto_12937 ?auto_12935 ) ) ( ON_BOARD ?auto_12941 ?auto_12940 ) ( SUPPORTS ?auto_12941 ?auto_12936 ) ( not ( = ?auto_12937 ?auto_12938 ) ) ( not ( = ?auto_12932 ?auto_12938 ) ) ( not ( = ?auto_12933 ?auto_12936 ) ) ( CALIBRATION_TARGET ?auto_12941 ?auto_12938 ) ( not ( = ?auto_12938 ?auto_12935 ) ) ( ON_BOARD ?auto_12942 ?auto_12940 ) ( not ( = ?auto_12941 ?auto_12942 ) ) ( SUPPORTS ?auto_12942 ?auto_12934 ) ( not ( = ?auto_12933 ?auto_12934 ) ) ( not ( = ?auto_12936 ?auto_12934 ) ) ( CALIBRATION_TARGET ?auto_12942 ?auto_12938 ) ( POINTING ?auto_12940 ?auto_12932 ) ( ON_BOARD ?auto_12939 ?auto_12940 ) ( POWER_ON ?auto_12939 ) ( not ( = ?auto_12941 ?auto_12939 ) ) ( not ( = ?auto_12942 ?auto_12939 ) ) ( CALIBRATED ?auto_12939 ) ( SUPPORTS ?auto_12939 ?auto_12933 ) )
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
      ?auto_12965 - INSTRUMENT
      ?auto_12964 - SATELLITE
      ?auto_12962 - DIRECTION
      ?auto_12966 - INSTRUMENT
      ?auto_12963 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12959 ?auto_12956 ) ) ( not ( = ?auto_12961 ?auto_12956 ) ) ( not ( = ?auto_12961 ?auto_12959 ) ) ( ON_BOARD ?auto_12965 ?auto_12964 ) ( SUPPORTS ?auto_12965 ?auto_12958 ) ( not ( = ?auto_12959 ?auto_12962 ) ) ( not ( = ?auto_12956 ?auto_12962 ) ) ( not ( = ?auto_12957 ?auto_12958 ) ) ( CALIBRATION_TARGET ?auto_12965 ?auto_12962 ) ( not ( = ?auto_12962 ?auto_12961 ) ) ( ON_BOARD ?auto_12966 ?auto_12964 ) ( not ( = ?auto_12965 ?auto_12966 ) ) ( SUPPORTS ?auto_12966 ?auto_12960 ) ( not ( = ?auto_12957 ?auto_12960 ) ) ( not ( = ?auto_12958 ?auto_12960 ) ) ( CALIBRATION_TARGET ?auto_12966 ?auto_12962 ) ( POINTING ?auto_12964 ?auto_12956 ) ( ON_BOARD ?auto_12963 ?auto_12964 ) ( POWER_ON ?auto_12963 ) ( not ( = ?auto_12965 ?auto_12963 ) ) ( not ( = ?auto_12966 ?auto_12963 ) ) ( CALIBRATED ?auto_12963 ) ( SUPPORTS ?auto_12963 ?auto_12957 ) )
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
      ?auto_12989 - INSTRUMENT
      ?auto_12988 - SATELLITE
      ?auto_12986 - DIRECTION
      ?auto_12990 - INSTRUMENT
      ?auto_12987 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_12983 ?auto_12980 ) ) ( not ( = ?auto_12985 ?auto_12980 ) ) ( not ( = ?auto_12985 ?auto_12983 ) ) ( ON_BOARD ?auto_12989 ?auto_12988 ) ( SUPPORTS ?auto_12989 ?auto_12984 ) ( not ( = ?auto_12985 ?auto_12986 ) ) ( not ( = ?auto_12983 ?auto_12986 ) ) ( not ( = ?auto_12982 ?auto_12984 ) ) ( CALIBRATION_TARGET ?auto_12989 ?auto_12986 ) ( not ( = ?auto_12986 ?auto_12980 ) ) ( ON_BOARD ?auto_12990 ?auto_12988 ) ( not ( = ?auto_12989 ?auto_12990 ) ) ( SUPPORTS ?auto_12990 ?auto_12981 ) ( not ( = ?auto_12982 ?auto_12981 ) ) ( not ( = ?auto_12984 ?auto_12981 ) ) ( CALIBRATION_TARGET ?auto_12990 ?auto_12986 ) ( POINTING ?auto_12988 ?auto_12983 ) ( ON_BOARD ?auto_12987 ?auto_12988 ) ( POWER_ON ?auto_12987 ) ( not ( = ?auto_12989 ?auto_12987 ) ) ( not ( = ?auto_12990 ?auto_12987 ) ) ( CALIBRATED ?auto_12987 ) ( SUPPORTS ?auto_12987 ?auto_12982 ) )
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
      ?auto_13013 - INSTRUMENT
      ?auto_13012 - SATELLITE
      ?auto_13010 - DIRECTION
      ?auto_13014 - INSTRUMENT
      ?auto_13011 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13007 ?auto_13004 ) ) ( not ( = ?auto_13009 ?auto_13004 ) ) ( not ( = ?auto_13009 ?auto_13007 ) ) ( ON_BOARD ?auto_13013 ?auto_13012 ) ( SUPPORTS ?auto_13013 ?auto_13006 ) ( not ( = ?auto_13007 ?auto_13010 ) ) ( not ( = ?auto_13009 ?auto_13010 ) ) ( not ( = ?auto_13008 ?auto_13006 ) ) ( CALIBRATION_TARGET ?auto_13013 ?auto_13010 ) ( not ( = ?auto_13010 ?auto_13004 ) ) ( ON_BOARD ?auto_13014 ?auto_13012 ) ( not ( = ?auto_13013 ?auto_13014 ) ) ( SUPPORTS ?auto_13014 ?auto_13005 ) ( not ( = ?auto_13008 ?auto_13005 ) ) ( not ( = ?auto_13006 ?auto_13005 ) ) ( CALIBRATION_TARGET ?auto_13014 ?auto_13010 ) ( POINTING ?auto_13012 ?auto_13009 ) ( ON_BOARD ?auto_13011 ?auto_13012 ) ( POWER_ON ?auto_13011 ) ( not ( = ?auto_13013 ?auto_13011 ) ) ( not ( = ?auto_13014 ?auto_13011 ) ) ( CALIBRATED ?auto_13011 ) ( SUPPORTS ?auto_13011 ?auto_13008 ) )
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
      ?auto_13063 - INSTRUMENT
      ?auto_13062 - SATELLITE
      ?auto_13060 - DIRECTION
      ?auto_13064 - INSTRUMENT
      ?auto_13061 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13057 ?auto_13054 ) ) ( not ( = ?auto_13059 ?auto_13054 ) ) ( not ( = ?auto_13059 ?auto_13057 ) ) ( ON_BOARD ?auto_13063 ?auto_13062 ) ( SUPPORTS ?auto_13063 ?auto_13055 ) ( not ( = ?auto_13054 ?auto_13060 ) ) ( not ( = ?auto_13057 ?auto_13060 ) ) ( not ( = ?auto_13056 ?auto_13055 ) ) ( CALIBRATION_TARGET ?auto_13063 ?auto_13060 ) ( not ( = ?auto_13060 ?auto_13059 ) ) ( ON_BOARD ?auto_13064 ?auto_13062 ) ( not ( = ?auto_13063 ?auto_13064 ) ) ( SUPPORTS ?auto_13064 ?auto_13058 ) ( not ( = ?auto_13056 ?auto_13058 ) ) ( not ( = ?auto_13055 ?auto_13058 ) ) ( CALIBRATION_TARGET ?auto_13064 ?auto_13060 ) ( POINTING ?auto_13062 ?auto_13057 ) ( ON_BOARD ?auto_13061 ?auto_13062 ) ( POWER_ON ?auto_13061 ) ( not ( = ?auto_13063 ?auto_13061 ) ) ( not ( = ?auto_13064 ?auto_13061 ) ) ( CALIBRATED ?auto_13061 ) ( SUPPORTS ?auto_13061 ?auto_13056 ) )
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
      ?auto_13087 - INSTRUMENT
      ?auto_13086 - SATELLITE
      ?auto_13084 - DIRECTION
      ?auto_13088 - INSTRUMENT
      ?auto_13085 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13081 ?auto_13078 ) ) ( not ( = ?auto_13083 ?auto_13078 ) ) ( not ( = ?auto_13083 ?auto_13081 ) ) ( ON_BOARD ?auto_13087 ?auto_13086 ) ( SUPPORTS ?auto_13087 ?auto_13079 ) ( not ( = ?auto_13078 ?auto_13084 ) ) ( not ( = ?auto_13083 ?auto_13084 ) ) ( not ( = ?auto_13082 ?auto_13079 ) ) ( CALIBRATION_TARGET ?auto_13087 ?auto_13084 ) ( not ( = ?auto_13084 ?auto_13081 ) ) ( ON_BOARD ?auto_13088 ?auto_13086 ) ( not ( = ?auto_13087 ?auto_13088 ) ) ( SUPPORTS ?auto_13088 ?auto_13080 ) ( not ( = ?auto_13082 ?auto_13080 ) ) ( not ( = ?auto_13079 ?auto_13080 ) ) ( CALIBRATION_TARGET ?auto_13088 ?auto_13084 ) ( POINTING ?auto_13086 ?auto_13083 ) ( ON_BOARD ?auto_13085 ?auto_13086 ) ( POWER_ON ?auto_13085 ) ( not ( = ?auto_13087 ?auto_13085 ) ) ( not ( = ?auto_13088 ?auto_13085 ) ) ( CALIBRATED ?auto_13085 ) ( SUPPORTS ?auto_13085 ?auto_13082 ) )
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
      ?auto_13166 - DIRECTION
      ?auto_13161 - INSTRUMENT
      ?auto_13160 - SATELLITE
      ?auto_13158 - DIRECTION
      ?auto_13165 - MODE
      ?auto_13164 - DIRECTION
      ?auto_13163 - INSTRUMENT
      ?auto_13162 - MODE
      ?auto_13159 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13156 ?auto_13166 ) ) ( ON_BOARD ?auto_13161 ?auto_13160 ) ( SUPPORTS ?auto_13161 ?auto_13157 ) ( not ( = ?auto_13156 ?auto_13158 ) ) ( not ( = ?auto_13166 ?auto_13158 ) ) ( not ( = ?auto_13165 ?auto_13157 ) ) ( CALIBRATION_TARGET ?auto_13161 ?auto_13158 ) ( not ( = ?auto_13158 ?auto_13164 ) ) ( not ( = ?auto_13156 ?auto_13164 ) ) ( not ( = ?auto_13166 ?auto_13164 ) ) ( ON_BOARD ?auto_13163 ?auto_13160 ) ( not ( = ?auto_13161 ?auto_13163 ) ) ( SUPPORTS ?auto_13163 ?auto_13162 ) ( not ( = ?auto_13165 ?auto_13162 ) ) ( not ( = ?auto_13157 ?auto_13162 ) ) ( CALIBRATION_TARGET ?auto_13163 ?auto_13158 ) ( ON_BOARD ?auto_13159 ?auto_13160 ) ( POWER_ON ?auto_13159 ) ( not ( = ?auto_13161 ?auto_13159 ) ) ( not ( = ?auto_13163 ?auto_13159 ) ) ( CALIBRATED ?auto_13159 ) ( SUPPORTS ?auto_13159 ?auto_13165 ) ( POINTING ?auto_13160 ?auto_13158 ) )
    :subtasks
    ( ( !TURN_TO ?auto_13160 ?auto_13166 ?auto_13158 )
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
      ?auto_13176 - INSTRUMENT
      ?auto_13174 - SATELLITE
      ?auto_13177 - DIRECTION
      ?auto_13172 - DIRECTION
      ?auto_13173 - INSTRUMENT
      ?auto_13171 - MODE
      ?auto_13175 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13170 ?auto_13167 ) ) ( ON_BOARD ?auto_13176 ?auto_13174 ) ( SUPPORTS ?auto_13176 ?auto_13169 ) ( not ( = ?auto_13170 ?auto_13177 ) ) ( not ( = ?auto_13167 ?auto_13177 ) ) ( not ( = ?auto_13168 ?auto_13169 ) ) ( CALIBRATION_TARGET ?auto_13176 ?auto_13177 ) ( not ( = ?auto_13177 ?auto_13172 ) ) ( not ( = ?auto_13170 ?auto_13172 ) ) ( not ( = ?auto_13167 ?auto_13172 ) ) ( ON_BOARD ?auto_13173 ?auto_13174 ) ( not ( = ?auto_13176 ?auto_13173 ) ) ( SUPPORTS ?auto_13173 ?auto_13171 ) ( not ( = ?auto_13168 ?auto_13171 ) ) ( not ( = ?auto_13169 ?auto_13171 ) ) ( CALIBRATION_TARGET ?auto_13173 ?auto_13177 ) ( ON_BOARD ?auto_13175 ?auto_13174 ) ( POWER_ON ?auto_13175 ) ( not ( = ?auto_13176 ?auto_13175 ) ) ( not ( = ?auto_13173 ?auto_13175 ) ) ( CALIBRATED ?auto_13175 ) ( SUPPORTS ?auto_13175 ?auto_13168 ) ( POINTING ?auto_13174 ?auto_13177 ) )
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
      ?auto_13188 - DIRECTION
      ?auto_13185 - INSTRUMENT
      ?auto_13182 - SATELLITE
      ?auto_13184 - DIRECTION
      ?auto_13187 - MODE
      ?auto_13183 - INSTRUMENT
      ?auto_13186 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13181 ?auto_13178 ) ) ( not ( = ?auto_13181 ?auto_13188 ) ) ( ON_BOARD ?auto_13185 ?auto_13182 ) ( SUPPORTS ?auto_13185 ?auto_13180 ) ( not ( = ?auto_13181 ?auto_13184 ) ) ( not ( = ?auto_13188 ?auto_13184 ) ) ( not ( = ?auto_13187 ?auto_13180 ) ) ( CALIBRATION_TARGET ?auto_13185 ?auto_13184 ) ( not ( = ?auto_13184 ?auto_13178 ) ) ( not ( = ?auto_13188 ?auto_13178 ) ) ( ON_BOARD ?auto_13183 ?auto_13182 ) ( not ( = ?auto_13185 ?auto_13183 ) ) ( SUPPORTS ?auto_13183 ?auto_13179 ) ( not ( = ?auto_13187 ?auto_13179 ) ) ( not ( = ?auto_13180 ?auto_13179 ) ) ( CALIBRATION_TARGET ?auto_13183 ?auto_13184 ) ( ON_BOARD ?auto_13186 ?auto_13182 ) ( POWER_ON ?auto_13186 ) ( not ( = ?auto_13185 ?auto_13186 ) ) ( not ( = ?auto_13183 ?auto_13186 ) ) ( CALIBRATED ?auto_13186 ) ( SUPPORTS ?auto_13186 ?auto_13187 ) ( POINTING ?auto_13182 ?auto_13184 ) )
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
      ?auto_13197 - DIRECTION
      ?auto_13195 - INSTRUMENT
      ?auto_13193 - MODE
      ?auto_13199 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13192 ?auto_13189 ) ) ( ON_BOARD ?auto_13198 ?auto_13194 ) ( SUPPORTS ?auto_13198 ?auto_13190 ) ( not ( = ?auto_13189 ?auto_13196 ) ) ( not ( = ?auto_13192 ?auto_13196 ) ) ( not ( = ?auto_13191 ?auto_13190 ) ) ( CALIBRATION_TARGET ?auto_13198 ?auto_13196 ) ( not ( = ?auto_13196 ?auto_13197 ) ) ( not ( = ?auto_13189 ?auto_13197 ) ) ( not ( = ?auto_13192 ?auto_13197 ) ) ( ON_BOARD ?auto_13195 ?auto_13194 ) ( not ( = ?auto_13198 ?auto_13195 ) ) ( SUPPORTS ?auto_13195 ?auto_13193 ) ( not ( = ?auto_13191 ?auto_13193 ) ) ( not ( = ?auto_13190 ?auto_13193 ) ) ( CALIBRATION_TARGET ?auto_13195 ?auto_13196 ) ( ON_BOARD ?auto_13199 ?auto_13194 ) ( POWER_ON ?auto_13199 ) ( not ( = ?auto_13198 ?auto_13199 ) ) ( not ( = ?auto_13195 ?auto_13199 ) ) ( CALIBRATED ?auto_13199 ) ( SUPPORTS ?auto_13199 ?auto_13191 ) ( POINTING ?auto_13194 ?auto_13196 ) )
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
      ?auto_13210 - DIRECTION
      ?auto_13207 - INSTRUMENT
      ?auto_13204 - SATELLITE
      ?auto_13206 - DIRECTION
      ?auto_13209 - MODE
      ?auto_13205 - INSTRUMENT
      ?auto_13208 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13203 ?auto_13200 ) ) ( not ( = ?auto_13200 ?auto_13210 ) ) ( ON_BOARD ?auto_13207 ?auto_13204 ) ( SUPPORTS ?auto_13207 ?auto_13201 ) ( not ( = ?auto_13200 ?auto_13206 ) ) ( not ( = ?auto_13210 ?auto_13206 ) ) ( not ( = ?auto_13209 ?auto_13201 ) ) ( CALIBRATION_TARGET ?auto_13207 ?auto_13206 ) ( not ( = ?auto_13206 ?auto_13203 ) ) ( not ( = ?auto_13210 ?auto_13203 ) ) ( ON_BOARD ?auto_13205 ?auto_13204 ) ( not ( = ?auto_13207 ?auto_13205 ) ) ( SUPPORTS ?auto_13205 ?auto_13202 ) ( not ( = ?auto_13209 ?auto_13202 ) ) ( not ( = ?auto_13201 ?auto_13202 ) ) ( CALIBRATION_TARGET ?auto_13205 ?auto_13206 ) ( ON_BOARD ?auto_13208 ?auto_13204 ) ( POWER_ON ?auto_13208 ) ( not ( = ?auto_13207 ?auto_13208 ) ) ( not ( = ?auto_13205 ?auto_13208 ) ) ( CALIBRATED ?auto_13208 ) ( SUPPORTS ?auto_13208 ?auto_13209 ) ( POINTING ?auto_13204 ?auto_13206 ) )
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
      ?auto_13245 - DIRECTION
      ?auto_13244 - INSTRUMENT
      ?auto_13247 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13240 ?auto_13237 ) ) ( not ( = ?auto_13242 ?auto_13237 ) ) ( not ( = ?auto_13242 ?auto_13240 ) ) ( ON_BOARD ?auto_13246 ?auto_13243 ) ( SUPPORTS ?auto_13246 ?auto_13241 ) ( not ( = ?auto_13242 ?auto_13245 ) ) ( not ( = ?auto_13237 ?auto_13245 ) ) ( not ( = ?auto_13238 ?auto_13241 ) ) ( CALIBRATION_TARGET ?auto_13246 ?auto_13245 ) ( not ( = ?auto_13245 ?auto_13240 ) ) ( ON_BOARD ?auto_13244 ?auto_13243 ) ( not ( = ?auto_13246 ?auto_13244 ) ) ( SUPPORTS ?auto_13244 ?auto_13239 ) ( not ( = ?auto_13238 ?auto_13239 ) ) ( not ( = ?auto_13241 ?auto_13239 ) ) ( CALIBRATION_TARGET ?auto_13244 ?auto_13245 ) ( ON_BOARD ?auto_13247 ?auto_13243 ) ( POWER_ON ?auto_13247 ) ( not ( = ?auto_13246 ?auto_13247 ) ) ( not ( = ?auto_13244 ?auto_13247 ) ) ( CALIBRATED ?auto_13247 ) ( SUPPORTS ?auto_13247 ?auto_13238 ) ( POINTING ?auto_13243 ?auto_13245 ) )
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
      ?auto_13269 - DIRECTION
      ?auto_13268 - INSTRUMENT
      ?auto_13271 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13264 ?auto_13261 ) ) ( not ( = ?auto_13266 ?auto_13261 ) ) ( not ( = ?auto_13266 ?auto_13264 ) ) ( ON_BOARD ?auto_13270 ?auto_13267 ) ( SUPPORTS ?auto_13270 ?auto_13263 ) ( not ( = ?auto_13264 ?auto_13269 ) ) ( not ( = ?auto_13261 ?auto_13269 ) ) ( not ( = ?auto_13262 ?auto_13263 ) ) ( CALIBRATION_TARGET ?auto_13270 ?auto_13269 ) ( not ( = ?auto_13269 ?auto_13266 ) ) ( ON_BOARD ?auto_13268 ?auto_13267 ) ( not ( = ?auto_13270 ?auto_13268 ) ) ( SUPPORTS ?auto_13268 ?auto_13265 ) ( not ( = ?auto_13262 ?auto_13265 ) ) ( not ( = ?auto_13263 ?auto_13265 ) ) ( CALIBRATION_TARGET ?auto_13268 ?auto_13269 ) ( ON_BOARD ?auto_13271 ?auto_13267 ) ( POWER_ON ?auto_13271 ) ( not ( = ?auto_13270 ?auto_13271 ) ) ( not ( = ?auto_13268 ?auto_13271 ) ) ( CALIBRATED ?auto_13271 ) ( SUPPORTS ?auto_13271 ?auto_13262 ) ( POINTING ?auto_13267 ?auto_13269 ) )
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
      ?auto_13293 - DIRECTION
      ?auto_13292 - INSTRUMENT
      ?auto_13295 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13288 ?auto_13285 ) ) ( not ( = ?auto_13290 ?auto_13285 ) ) ( not ( = ?auto_13290 ?auto_13288 ) ) ( ON_BOARD ?auto_13294 ?auto_13291 ) ( SUPPORTS ?auto_13294 ?auto_13289 ) ( not ( = ?auto_13290 ?auto_13293 ) ) ( not ( = ?auto_13288 ?auto_13293 ) ) ( not ( = ?auto_13287 ?auto_13289 ) ) ( CALIBRATION_TARGET ?auto_13294 ?auto_13293 ) ( not ( = ?auto_13293 ?auto_13285 ) ) ( ON_BOARD ?auto_13292 ?auto_13291 ) ( not ( = ?auto_13294 ?auto_13292 ) ) ( SUPPORTS ?auto_13292 ?auto_13286 ) ( not ( = ?auto_13287 ?auto_13286 ) ) ( not ( = ?auto_13289 ?auto_13286 ) ) ( CALIBRATION_TARGET ?auto_13292 ?auto_13293 ) ( ON_BOARD ?auto_13295 ?auto_13291 ) ( POWER_ON ?auto_13295 ) ( not ( = ?auto_13294 ?auto_13295 ) ) ( not ( = ?auto_13292 ?auto_13295 ) ) ( CALIBRATED ?auto_13295 ) ( SUPPORTS ?auto_13295 ?auto_13287 ) ( POINTING ?auto_13291 ?auto_13293 ) )
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
      ?auto_13317 - DIRECTION
      ?auto_13316 - INSTRUMENT
      ?auto_13319 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13312 ?auto_13309 ) ) ( not ( = ?auto_13314 ?auto_13309 ) ) ( not ( = ?auto_13314 ?auto_13312 ) ) ( ON_BOARD ?auto_13318 ?auto_13315 ) ( SUPPORTS ?auto_13318 ?auto_13311 ) ( not ( = ?auto_13312 ?auto_13317 ) ) ( not ( = ?auto_13314 ?auto_13317 ) ) ( not ( = ?auto_13313 ?auto_13311 ) ) ( CALIBRATION_TARGET ?auto_13318 ?auto_13317 ) ( not ( = ?auto_13317 ?auto_13309 ) ) ( ON_BOARD ?auto_13316 ?auto_13315 ) ( not ( = ?auto_13318 ?auto_13316 ) ) ( SUPPORTS ?auto_13316 ?auto_13310 ) ( not ( = ?auto_13313 ?auto_13310 ) ) ( not ( = ?auto_13311 ?auto_13310 ) ) ( CALIBRATION_TARGET ?auto_13316 ?auto_13317 ) ( ON_BOARD ?auto_13319 ?auto_13315 ) ( POWER_ON ?auto_13319 ) ( not ( = ?auto_13318 ?auto_13319 ) ) ( not ( = ?auto_13316 ?auto_13319 ) ) ( CALIBRATED ?auto_13319 ) ( SUPPORTS ?auto_13319 ?auto_13313 ) ( POINTING ?auto_13315 ?auto_13317 ) )
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
      ?auto_13367 - DIRECTION
      ?auto_13366 - INSTRUMENT
      ?auto_13369 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13362 ?auto_13359 ) ) ( not ( = ?auto_13364 ?auto_13359 ) ) ( not ( = ?auto_13364 ?auto_13362 ) ) ( ON_BOARD ?auto_13368 ?auto_13365 ) ( SUPPORTS ?auto_13368 ?auto_13360 ) ( not ( = ?auto_13359 ?auto_13367 ) ) ( not ( = ?auto_13362 ?auto_13367 ) ) ( not ( = ?auto_13361 ?auto_13360 ) ) ( CALIBRATION_TARGET ?auto_13368 ?auto_13367 ) ( not ( = ?auto_13367 ?auto_13364 ) ) ( ON_BOARD ?auto_13366 ?auto_13365 ) ( not ( = ?auto_13368 ?auto_13366 ) ) ( SUPPORTS ?auto_13366 ?auto_13363 ) ( not ( = ?auto_13361 ?auto_13363 ) ) ( not ( = ?auto_13360 ?auto_13363 ) ) ( CALIBRATION_TARGET ?auto_13366 ?auto_13367 ) ( ON_BOARD ?auto_13369 ?auto_13365 ) ( POWER_ON ?auto_13369 ) ( not ( = ?auto_13368 ?auto_13369 ) ) ( not ( = ?auto_13366 ?auto_13369 ) ) ( CALIBRATED ?auto_13369 ) ( SUPPORTS ?auto_13369 ?auto_13361 ) ( POINTING ?auto_13365 ?auto_13367 ) )
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
      ?auto_13391 - DIRECTION
      ?auto_13390 - INSTRUMENT
      ?auto_13393 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13386 ?auto_13383 ) ) ( not ( = ?auto_13388 ?auto_13383 ) ) ( not ( = ?auto_13388 ?auto_13386 ) ) ( ON_BOARD ?auto_13392 ?auto_13389 ) ( SUPPORTS ?auto_13392 ?auto_13384 ) ( not ( = ?auto_13383 ?auto_13391 ) ) ( not ( = ?auto_13388 ?auto_13391 ) ) ( not ( = ?auto_13387 ?auto_13384 ) ) ( CALIBRATION_TARGET ?auto_13392 ?auto_13391 ) ( not ( = ?auto_13391 ?auto_13386 ) ) ( ON_BOARD ?auto_13390 ?auto_13389 ) ( not ( = ?auto_13392 ?auto_13390 ) ) ( SUPPORTS ?auto_13390 ?auto_13385 ) ( not ( = ?auto_13387 ?auto_13385 ) ) ( not ( = ?auto_13384 ?auto_13385 ) ) ( CALIBRATION_TARGET ?auto_13390 ?auto_13391 ) ( ON_BOARD ?auto_13393 ?auto_13389 ) ( POWER_ON ?auto_13393 ) ( not ( = ?auto_13392 ?auto_13393 ) ) ( not ( = ?auto_13390 ?auto_13393 ) ) ( CALIBRATED ?auto_13393 ) ( SUPPORTS ?auto_13393 ?auto_13387 ) ( POINTING ?auto_13389 ?auto_13391 ) )
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
      ?auto_13471 - DIRECTION
      ?auto_13468 - INSTRUMENT
      ?auto_13464 - SATELLITE
      ?auto_13466 - DIRECTION
      ?auto_13470 - MODE
      ?auto_13467 - DIRECTION
      ?auto_13465 - INSTRUMENT
      ?auto_13463 - MODE
      ?auto_13469 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13461 ?auto_13471 ) ) ( ON_BOARD ?auto_13468 ?auto_13464 ) ( SUPPORTS ?auto_13468 ?auto_13462 ) ( not ( = ?auto_13461 ?auto_13466 ) ) ( not ( = ?auto_13471 ?auto_13466 ) ) ( not ( = ?auto_13470 ?auto_13462 ) ) ( CALIBRATION_TARGET ?auto_13468 ?auto_13466 ) ( not ( = ?auto_13466 ?auto_13467 ) ) ( not ( = ?auto_13461 ?auto_13467 ) ) ( not ( = ?auto_13471 ?auto_13467 ) ) ( ON_BOARD ?auto_13465 ?auto_13464 ) ( not ( = ?auto_13468 ?auto_13465 ) ) ( SUPPORTS ?auto_13465 ?auto_13463 ) ( not ( = ?auto_13470 ?auto_13463 ) ) ( not ( = ?auto_13462 ?auto_13463 ) ) ( CALIBRATION_TARGET ?auto_13465 ?auto_13466 ) ( ON_BOARD ?auto_13469 ?auto_13464 ) ( POWER_ON ?auto_13469 ) ( not ( = ?auto_13468 ?auto_13469 ) ) ( not ( = ?auto_13465 ?auto_13469 ) ) ( SUPPORTS ?auto_13469 ?auto_13470 ) ( POINTING ?auto_13464 ?auto_13466 ) ( CALIBRATION_TARGET ?auto_13469 ?auto_13466 ) ( NOT_CALIBRATED ?auto_13469 ) )
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
      ?auto_13476 - INSTRUMENT
      ?auto_13477 - SATELLITE
      ?auto_13480 - DIRECTION
      ?auto_13481 - DIRECTION
      ?auto_13478 - INSTRUMENT
      ?auto_13482 - MODE
      ?auto_13479 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13475 ?auto_13472 ) ) ( ON_BOARD ?auto_13476 ?auto_13477 ) ( SUPPORTS ?auto_13476 ?auto_13474 ) ( not ( = ?auto_13475 ?auto_13480 ) ) ( not ( = ?auto_13472 ?auto_13480 ) ) ( not ( = ?auto_13473 ?auto_13474 ) ) ( CALIBRATION_TARGET ?auto_13476 ?auto_13480 ) ( not ( = ?auto_13480 ?auto_13481 ) ) ( not ( = ?auto_13475 ?auto_13481 ) ) ( not ( = ?auto_13472 ?auto_13481 ) ) ( ON_BOARD ?auto_13478 ?auto_13477 ) ( not ( = ?auto_13476 ?auto_13478 ) ) ( SUPPORTS ?auto_13478 ?auto_13482 ) ( not ( = ?auto_13473 ?auto_13482 ) ) ( not ( = ?auto_13474 ?auto_13482 ) ) ( CALIBRATION_TARGET ?auto_13478 ?auto_13480 ) ( ON_BOARD ?auto_13479 ?auto_13477 ) ( POWER_ON ?auto_13479 ) ( not ( = ?auto_13476 ?auto_13479 ) ) ( not ( = ?auto_13478 ?auto_13479 ) ) ( SUPPORTS ?auto_13479 ?auto_13473 ) ( POINTING ?auto_13477 ?auto_13480 ) ( CALIBRATION_TARGET ?auto_13479 ?auto_13480 ) ( NOT_CALIBRATED ?auto_13479 ) )
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
      ?auto_13493 - DIRECTION
      ?auto_13491 - INSTRUMENT
      ?auto_13490 - SATELLITE
      ?auto_13489 - DIRECTION
      ?auto_13492 - MODE
      ?auto_13488 - INSTRUMENT
      ?auto_13487 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13486 ?auto_13483 ) ) ( not ( = ?auto_13486 ?auto_13493 ) ) ( ON_BOARD ?auto_13491 ?auto_13490 ) ( SUPPORTS ?auto_13491 ?auto_13485 ) ( not ( = ?auto_13486 ?auto_13489 ) ) ( not ( = ?auto_13493 ?auto_13489 ) ) ( not ( = ?auto_13492 ?auto_13485 ) ) ( CALIBRATION_TARGET ?auto_13491 ?auto_13489 ) ( not ( = ?auto_13489 ?auto_13483 ) ) ( not ( = ?auto_13493 ?auto_13483 ) ) ( ON_BOARD ?auto_13488 ?auto_13490 ) ( not ( = ?auto_13491 ?auto_13488 ) ) ( SUPPORTS ?auto_13488 ?auto_13484 ) ( not ( = ?auto_13492 ?auto_13484 ) ) ( not ( = ?auto_13485 ?auto_13484 ) ) ( CALIBRATION_TARGET ?auto_13488 ?auto_13489 ) ( ON_BOARD ?auto_13487 ?auto_13490 ) ( POWER_ON ?auto_13487 ) ( not ( = ?auto_13491 ?auto_13487 ) ) ( not ( = ?auto_13488 ?auto_13487 ) ) ( SUPPORTS ?auto_13487 ?auto_13492 ) ( POINTING ?auto_13490 ?auto_13489 ) ( CALIBRATION_TARGET ?auto_13487 ?auto_13489 ) ( NOT_CALIBRATED ?auto_13487 ) )
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
      ?auto_13503 - INSTRUMENT
      ?auto_13502 - SATELLITE
      ?auto_13501 - DIRECTION
      ?auto_13500 - DIRECTION
      ?auto_13499 - INSTRUMENT
      ?auto_13504 - MODE
      ?auto_13498 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13497 ?auto_13494 ) ) ( ON_BOARD ?auto_13503 ?auto_13502 ) ( SUPPORTS ?auto_13503 ?auto_13495 ) ( not ( = ?auto_13494 ?auto_13501 ) ) ( not ( = ?auto_13497 ?auto_13501 ) ) ( not ( = ?auto_13496 ?auto_13495 ) ) ( CALIBRATION_TARGET ?auto_13503 ?auto_13501 ) ( not ( = ?auto_13501 ?auto_13500 ) ) ( not ( = ?auto_13494 ?auto_13500 ) ) ( not ( = ?auto_13497 ?auto_13500 ) ) ( ON_BOARD ?auto_13499 ?auto_13502 ) ( not ( = ?auto_13503 ?auto_13499 ) ) ( SUPPORTS ?auto_13499 ?auto_13504 ) ( not ( = ?auto_13496 ?auto_13504 ) ) ( not ( = ?auto_13495 ?auto_13504 ) ) ( CALIBRATION_TARGET ?auto_13499 ?auto_13501 ) ( ON_BOARD ?auto_13498 ?auto_13502 ) ( POWER_ON ?auto_13498 ) ( not ( = ?auto_13503 ?auto_13498 ) ) ( not ( = ?auto_13499 ?auto_13498 ) ) ( SUPPORTS ?auto_13498 ?auto_13496 ) ( POINTING ?auto_13502 ?auto_13501 ) ( CALIBRATION_TARGET ?auto_13498 ?auto_13501 ) ( NOT_CALIBRATED ?auto_13498 ) )
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
      ?auto_13515 - DIRECTION
      ?auto_13513 - INSTRUMENT
      ?auto_13512 - SATELLITE
      ?auto_13511 - DIRECTION
      ?auto_13514 - MODE
      ?auto_13510 - INSTRUMENT
      ?auto_13509 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13508 ?auto_13505 ) ) ( not ( = ?auto_13505 ?auto_13515 ) ) ( ON_BOARD ?auto_13513 ?auto_13512 ) ( SUPPORTS ?auto_13513 ?auto_13506 ) ( not ( = ?auto_13505 ?auto_13511 ) ) ( not ( = ?auto_13515 ?auto_13511 ) ) ( not ( = ?auto_13514 ?auto_13506 ) ) ( CALIBRATION_TARGET ?auto_13513 ?auto_13511 ) ( not ( = ?auto_13511 ?auto_13508 ) ) ( not ( = ?auto_13515 ?auto_13508 ) ) ( ON_BOARD ?auto_13510 ?auto_13512 ) ( not ( = ?auto_13513 ?auto_13510 ) ) ( SUPPORTS ?auto_13510 ?auto_13507 ) ( not ( = ?auto_13514 ?auto_13507 ) ) ( not ( = ?auto_13506 ?auto_13507 ) ) ( CALIBRATION_TARGET ?auto_13510 ?auto_13511 ) ( ON_BOARD ?auto_13509 ?auto_13512 ) ( POWER_ON ?auto_13509 ) ( not ( = ?auto_13513 ?auto_13509 ) ) ( not ( = ?auto_13510 ?auto_13509 ) ) ( SUPPORTS ?auto_13509 ?auto_13514 ) ( POINTING ?auto_13512 ?auto_13511 ) ( CALIBRATION_TARGET ?auto_13509 ?auto_13511 ) ( NOT_CALIBRATED ?auto_13509 ) )
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
      ?auto_13551 - SATELLITE
      ?auto_13550 - DIRECTION
      ?auto_13549 - INSTRUMENT
      ?auto_13548 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13545 ?auto_13542 ) ) ( not ( = ?auto_13547 ?auto_13542 ) ) ( not ( = ?auto_13547 ?auto_13545 ) ) ( ON_BOARD ?auto_13552 ?auto_13551 ) ( SUPPORTS ?auto_13552 ?auto_13546 ) ( not ( = ?auto_13547 ?auto_13550 ) ) ( not ( = ?auto_13542 ?auto_13550 ) ) ( not ( = ?auto_13543 ?auto_13546 ) ) ( CALIBRATION_TARGET ?auto_13552 ?auto_13550 ) ( not ( = ?auto_13550 ?auto_13545 ) ) ( ON_BOARD ?auto_13549 ?auto_13551 ) ( not ( = ?auto_13552 ?auto_13549 ) ) ( SUPPORTS ?auto_13549 ?auto_13544 ) ( not ( = ?auto_13543 ?auto_13544 ) ) ( not ( = ?auto_13546 ?auto_13544 ) ) ( CALIBRATION_TARGET ?auto_13549 ?auto_13550 ) ( ON_BOARD ?auto_13548 ?auto_13551 ) ( POWER_ON ?auto_13548 ) ( not ( = ?auto_13552 ?auto_13548 ) ) ( not ( = ?auto_13549 ?auto_13548 ) ) ( SUPPORTS ?auto_13548 ?auto_13543 ) ( POINTING ?auto_13551 ?auto_13550 ) ( CALIBRATION_TARGET ?auto_13548 ?auto_13550 ) ( NOT_CALIBRATED ?auto_13548 ) )
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
      ?auto_13575 - SATELLITE
      ?auto_13574 - DIRECTION
      ?auto_13573 - INSTRUMENT
      ?auto_13572 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13569 ?auto_13566 ) ) ( not ( = ?auto_13571 ?auto_13566 ) ) ( not ( = ?auto_13571 ?auto_13569 ) ) ( ON_BOARD ?auto_13576 ?auto_13575 ) ( SUPPORTS ?auto_13576 ?auto_13568 ) ( not ( = ?auto_13569 ?auto_13574 ) ) ( not ( = ?auto_13566 ?auto_13574 ) ) ( not ( = ?auto_13567 ?auto_13568 ) ) ( CALIBRATION_TARGET ?auto_13576 ?auto_13574 ) ( not ( = ?auto_13574 ?auto_13571 ) ) ( ON_BOARD ?auto_13573 ?auto_13575 ) ( not ( = ?auto_13576 ?auto_13573 ) ) ( SUPPORTS ?auto_13573 ?auto_13570 ) ( not ( = ?auto_13567 ?auto_13570 ) ) ( not ( = ?auto_13568 ?auto_13570 ) ) ( CALIBRATION_TARGET ?auto_13573 ?auto_13574 ) ( ON_BOARD ?auto_13572 ?auto_13575 ) ( POWER_ON ?auto_13572 ) ( not ( = ?auto_13576 ?auto_13572 ) ) ( not ( = ?auto_13573 ?auto_13572 ) ) ( SUPPORTS ?auto_13572 ?auto_13567 ) ( POINTING ?auto_13575 ?auto_13574 ) ( CALIBRATION_TARGET ?auto_13572 ?auto_13574 ) ( NOT_CALIBRATED ?auto_13572 ) )
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
      ?auto_13599 - SATELLITE
      ?auto_13598 - DIRECTION
      ?auto_13597 - INSTRUMENT
      ?auto_13596 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13593 ?auto_13590 ) ) ( not ( = ?auto_13595 ?auto_13590 ) ) ( not ( = ?auto_13595 ?auto_13593 ) ) ( ON_BOARD ?auto_13600 ?auto_13599 ) ( SUPPORTS ?auto_13600 ?auto_13594 ) ( not ( = ?auto_13595 ?auto_13598 ) ) ( not ( = ?auto_13593 ?auto_13598 ) ) ( not ( = ?auto_13592 ?auto_13594 ) ) ( CALIBRATION_TARGET ?auto_13600 ?auto_13598 ) ( not ( = ?auto_13598 ?auto_13590 ) ) ( ON_BOARD ?auto_13597 ?auto_13599 ) ( not ( = ?auto_13600 ?auto_13597 ) ) ( SUPPORTS ?auto_13597 ?auto_13591 ) ( not ( = ?auto_13592 ?auto_13591 ) ) ( not ( = ?auto_13594 ?auto_13591 ) ) ( CALIBRATION_TARGET ?auto_13597 ?auto_13598 ) ( ON_BOARD ?auto_13596 ?auto_13599 ) ( POWER_ON ?auto_13596 ) ( not ( = ?auto_13600 ?auto_13596 ) ) ( not ( = ?auto_13597 ?auto_13596 ) ) ( SUPPORTS ?auto_13596 ?auto_13592 ) ( POINTING ?auto_13599 ?auto_13598 ) ( CALIBRATION_TARGET ?auto_13596 ?auto_13598 ) ( NOT_CALIBRATED ?auto_13596 ) )
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
      ?auto_13623 - SATELLITE
      ?auto_13622 - DIRECTION
      ?auto_13621 - INSTRUMENT
      ?auto_13620 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13617 ?auto_13614 ) ) ( not ( = ?auto_13619 ?auto_13614 ) ) ( not ( = ?auto_13619 ?auto_13617 ) ) ( ON_BOARD ?auto_13624 ?auto_13623 ) ( SUPPORTS ?auto_13624 ?auto_13616 ) ( not ( = ?auto_13617 ?auto_13622 ) ) ( not ( = ?auto_13619 ?auto_13622 ) ) ( not ( = ?auto_13618 ?auto_13616 ) ) ( CALIBRATION_TARGET ?auto_13624 ?auto_13622 ) ( not ( = ?auto_13622 ?auto_13614 ) ) ( ON_BOARD ?auto_13621 ?auto_13623 ) ( not ( = ?auto_13624 ?auto_13621 ) ) ( SUPPORTS ?auto_13621 ?auto_13615 ) ( not ( = ?auto_13618 ?auto_13615 ) ) ( not ( = ?auto_13616 ?auto_13615 ) ) ( CALIBRATION_TARGET ?auto_13621 ?auto_13622 ) ( ON_BOARD ?auto_13620 ?auto_13623 ) ( POWER_ON ?auto_13620 ) ( not ( = ?auto_13624 ?auto_13620 ) ) ( not ( = ?auto_13621 ?auto_13620 ) ) ( SUPPORTS ?auto_13620 ?auto_13618 ) ( POINTING ?auto_13623 ?auto_13622 ) ( CALIBRATION_TARGET ?auto_13620 ?auto_13622 ) ( NOT_CALIBRATED ?auto_13620 ) )
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
      ?auto_13673 - SATELLITE
      ?auto_13672 - DIRECTION
      ?auto_13671 - INSTRUMENT
      ?auto_13670 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13667 ?auto_13664 ) ) ( not ( = ?auto_13669 ?auto_13664 ) ) ( not ( = ?auto_13669 ?auto_13667 ) ) ( ON_BOARD ?auto_13674 ?auto_13673 ) ( SUPPORTS ?auto_13674 ?auto_13665 ) ( not ( = ?auto_13664 ?auto_13672 ) ) ( not ( = ?auto_13667 ?auto_13672 ) ) ( not ( = ?auto_13666 ?auto_13665 ) ) ( CALIBRATION_TARGET ?auto_13674 ?auto_13672 ) ( not ( = ?auto_13672 ?auto_13669 ) ) ( ON_BOARD ?auto_13671 ?auto_13673 ) ( not ( = ?auto_13674 ?auto_13671 ) ) ( SUPPORTS ?auto_13671 ?auto_13668 ) ( not ( = ?auto_13666 ?auto_13668 ) ) ( not ( = ?auto_13665 ?auto_13668 ) ) ( CALIBRATION_TARGET ?auto_13671 ?auto_13672 ) ( ON_BOARD ?auto_13670 ?auto_13673 ) ( POWER_ON ?auto_13670 ) ( not ( = ?auto_13674 ?auto_13670 ) ) ( not ( = ?auto_13671 ?auto_13670 ) ) ( SUPPORTS ?auto_13670 ?auto_13666 ) ( POINTING ?auto_13673 ?auto_13672 ) ( CALIBRATION_TARGET ?auto_13670 ?auto_13672 ) ( NOT_CALIBRATED ?auto_13670 ) )
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
      ?auto_13697 - SATELLITE
      ?auto_13696 - DIRECTION
      ?auto_13695 - INSTRUMENT
      ?auto_13694 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13691 ?auto_13688 ) ) ( not ( = ?auto_13693 ?auto_13688 ) ) ( not ( = ?auto_13693 ?auto_13691 ) ) ( ON_BOARD ?auto_13698 ?auto_13697 ) ( SUPPORTS ?auto_13698 ?auto_13689 ) ( not ( = ?auto_13688 ?auto_13696 ) ) ( not ( = ?auto_13693 ?auto_13696 ) ) ( not ( = ?auto_13692 ?auto_13689 ) ) ( CALIBRATION_TARGET ?auto_13698 ?auto_13696 ) ( not ( = ?auto_13696 ?auto_13691 ) ) ( ON_BOARD ?auto_13695 ?auto_13697 ) ( not ( = ?auto_13698 ?auto_13695 ) ) ( SUPPORTS ?auto_13695 ?auto_13690 ) ( not ( = ?auto_13692 ?auto_13690 ) ) ( not ( = ?auto_13689 ?auto_13690 ) ) ( CALIBRATION_TARGET ?auto_13695 ?auto_13696 ) ( ON_BOARD ?auto_13694 ?auto_13697 ) ( POWER_ON ?auto_13694 ) ( not ( = ?auto_13698 ?auto_13694 ) ) ( not ( = ?auto_13695 ?auto_13694 ) ) ( SUPPORTS ?auto_13694 ?auto_13692 ) ( POINTING ?auto_13697 ?auto_13696 ) ( CALIBRATION_TARGET ?auto_13694 ?auto_13696 ) ( NOT_CALIBRATED ?auto_13694 ) )
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
      ?auto_13776 - DIRECTION
      ?auto_13773 - INSTRUMENT
      ?auto_13772 - SATELLITE
      ?auto_13771 - DIRECTION
      ?auto_13775 - MODE
      ?auto_13770 - DIRECTION
      ?auto_13769 - INSTRUMENT
      ?auto_13774 - MODE
      ?auto_13768 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13766 ?auto_13776 ) ) ( ON_BOARD ?auto_13773 ?auto_13772 ) ( SUPPORTS ?auto_13773 ?auto_13767 ) ( not ( = ?auto_13766 ?auto_13771 ) ) ( not ( = ?auto_13776 ?auto_13771 ) ) ( not ( = ?auto_13775 ?auto_13767 ) ) ( CALIBRATION_TARGET ?auto_13773 ?auto_13771 ) ( not ( = ?auto_13771 ?auto_13770 ) ) ( not ( = ?auto_13766 ?auto_13770 ) ) ( not ( = ?auto_13776 ?auto_13770 ) ) ( ON_BOARD ?auto_13769 ?auto_13772 ) ( not ( = ?auto_13773 ?auto_13769 ) ) ( SUPPORTS ?auto_13769 ?auto_13774 ) ( not ( = ?auto_13775 ?auto_13774 ) ) ( not ( = ?auto_13767 ?auto_13774 ) ) ( CALIBRATION_TARGET ?auto_13769 ?auto_13771 ) ( ON_BOARD ?auto_13768 ?auto_13772 ) ( not ( = ?auto_13773 ?auto_13768 ) ) ( not ( = ?auto_13769 ?auto_13768 ) ) ( SUPPORTS ?auto_13768 ?auto_13775 ) ( POINTING ?auto_13772 ?auto_13771 ) ( CALIBRATION_TARGET ?auto_13768 ?auto_13771 ) ( POWER_AVAIL ?auto_13772 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_13768 ?auto_13772 )
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
      ?auto_13782 - INSTRUMENT
      ?auto_13784 - SATELLITE
      ?auto_13786 - DIRECTION
      ?auto_13783 - DIRECTION
      ?auto_13785 - INSTRUMENT
      ?auto_13781 - MODE
      ?auto_13787 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13780 ?auto_13777 ) ) ( ON_BOARD ?auto_13782 ?auto_13784 ) ( SUPPORTS ?auto_13782 ?auto_13779 ) ( not ( = ?auto_13780 ?auto_13786 ) ) ( not ( = ?auto_13777 ?auto_13786 ) ) ( not ( = ?auto_13778 ?auto_13779 ) ) ( CALIBRATION_TARGET ?auto_13782 ?auto_13786 ) ( not ( = ?auto_13786 ?auto_13783 ) ) ( not ( = ?auto_13780 ?auto_13783 ) ) ( not ( = ?auto_13777 ?auto_13783 ) ) ( ON_BOARD ?auto_13785 ?auto_13784 ) ( not ( = ?auto_13782 ?auto_13785 ) ) ( SUPPORTS ?auto_13785 ?auto_13781 ) ( not ( = ?auto_13778 ?auto_13781 ) ) ( not ( = ?auto_13779 ?auto_13781 ) ) ( CALIBRATION_TARGET ?auto_13785 ?auto_13786 ) ( ON_BOARD ?auto_13787 ?auto_13784 ) ( not ( = ?auto_13782 ?auto_13787 ) ) ( not ( = ?auto_13785 ?auto_13787 ) ) ( SUPPORTS ?auto_13787 ?auto_13778 ) ( POINTING ?auto_13784 ?auto_13786 ) ( CALIBRATION_TARGET ?auto_13787 ?auto_13786 ) ( POWER_AVAIL ?auto_13784 ) )
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
      ?auto_13798 - DIRECTION
      ?auto_13794 - INSTRUMENT
      ?auto_13796 - SATELLITE
      ?auto_13795 - DIRECTION
      ?auto_13797 - MODE
      ?auto_13793 - INSTRUMENT
      ?auto_13792 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13791 ?auto_13788 ) ) ( not ( = ?auto_13791 ?auto_13798 ) ) ( ON_BOARD ?auto_13794 ?auto_13796 ) ( SUPPORTS ?auto_13794 ?auto_13790 ) ( not ( = ?auto_13791 ?auto_13795 ) ) ( not ( = ?auto_13798 ?auto_13795 ) ) ( not ( = ?auto_13797 ?auto_13790 ) ) ( CALIBRATION_TARGET ?auto_13794 ?auto_13795 ) ( not ( = ?auto_13795 ?auto_13788 ) ) ( not ( = ?auto_13798 ?auto_13788 ) ) ( ON_BOARD ?auto_13793 ?auto_13796 ) ( not ( = ?auto_13794 ?auto_13793 ) ) ( SUPPORTS ?auto_13793 ?auto_13789 ) ( not ( = ?auto_13797 ?auto_13789 ) ) ( not ( = ?auto_13790 ?auto_13789 ) ) ( CALIBRATION_TARGET ?auto_13793 ?auto_13795 ) ( ON_BOARD ?auto_13792 ?auto_13796 ) ( not ( = ?auto_13794 ?auto_13792 ) ) ( not ( = ?auto_13793 ?auto_13792 ) ) ( SUPPORTS ?auto_13792 ?auto_13797 ) ( POINTING ?auto_13796 ?auto_13795 ) ( CALIBRATION_TARGET ?auto_13792 ?auto_13795 ) ( POWER_AVAIL ?auto_13796 ) )
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
      ?auto_13806 - INSTRUMENT
      ?auto_13809 - SATELLITE
      ?auto_13807 - DIRECTION
      ?auto_13804 - DIRECTION
      ?auto_13805 - INSTRUMENT
      ?auto_13808 - MODE
      ?auto_13803 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13802 ?auto_13799 ) ) ( ON_BOARD ?auto_13806 ?auto_13809 ) ( SUPPORTS ?auto_13806 ?auto_13800 ) ( not ( = ?auto_13799 ?auto_13807 ) ) ( not ( = ?auto_13802 ?auto_13807 ) ) ( not ( = ?auto_13801 ?auto_13800 ) ) ( CALIBRATION_TARGET ?auto_13806 ?auto_13807 ) ( not ( = ?auto_13807 ?auto_13804 ) ) ( not ( = ?auto_13799 ?auto_13804 ) ) ( not ( = ?auto_13802 ?auto_13804 ) ) ( ON_BOARD ?auto_13805 ?auto_13809 ) ( not ( = ?auto_13806 ?auto_13805 ) ) ( SUPPORTS ?auto_13805 ?auto_13808 ) ( not ( = ?auto_13801 ?auto_13808 ) ) ( not ( = ?auto_13800 ?auto_13808 ) ) ( CALIBRATION_TARGET ?auto_13805 ?auto_13807 ) ( ON_BOARD ?auto_13803 ?auto_13809 ) ( not ( = ?auto_13806 ?auto_13803 ) ) ( not ( = ?auto_13805 ?auto_13803 ) ) ( SUPPORTS ?auto_13803 ?auto_13801 ) ( POINTING ?auto_13809 ?auto_13807 ) ( CALIBRATION_TARGET ?auto_13803 ?auto_13807 ) ( POWER_AVAIL ?auto_13809 ) )
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
      ?auto_13820 - DIRECTION
      ?auto_13816 - INSTRUMENT
      ?auto_13818 - SATELLITE
      ?auto_13817 - DIRECTION
      ?auto_13819 - MODE
      ?auto_13815 - INSTRUMENT
      ?auto_13814 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13813 ?auto_13810 ) ) ( not ( = ?auto_13810 ?auto_13820 ) ) ( ON_BOARD ?auto_13816 ?auto_13818 ) ( SUPPORTS ?auto_13816 ?auto_13811 ) ( not ( = ?auto_13810 ?auto_13817 ) ) ( not ( = ?auto_13820 ?auto_13817 ) ) ( not ( = ?auto_13819 ?auto_13811 ) ) ( CALIBRATION_TARGET ?auto_13816 ?auto_13817 ) ( not ( = ?auto_13817 ?auto_13813 ) ) ( not ( = ?auto_13820 ?auto_13813 ) ) ( ON_BOARD ?auto_13815 ?auto_13818 ) ( not ( = ?auto_13816 ?auto_13815 ) ) ( SUPPORTS ?auto_13815 ?auto_13812 ) ( not ( = ?auto_13819 ?auto_13812 ) ) ( not ( = ?auto_13811 ?auto_13812 ) ) ( CALIBRATION_TARGET ?auto_13815 ?auto_13817 ) ( ON_BOARD ?auto_13814 ?auto_13818 ) ( not ( = ?auto_13816 ?auto_13814 ) ) ( not ( = ?auto_13815 ?auto_13814 ) ) ( SUPPORTS ?auto_13814 ?auto_13819 ) ( POINTING ?auto_13818 ?auto_13817 ) ( CALIBRATION_TARGET ?auto_13814 ?auto_13817 ) ( POWER_AVAIL ?auto_13818 ) )
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
      ?auto_13855 - INSTRUMENT
      ?auto_13857 - SATELLITE
      ?auto_13856 - DIRECTION
      ?auto_13854 - INSTRUMENT
      ?auto_13853 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13850 ?auto_13847 ) ) ( not ( = ?auto_13852 ?auto_13847 ) ) ( not ( = ?auto_13852 ?auto_13850 ) ) ( ON_BOARD ?auto_13855 ?auto_13857 ) ( SUPPORTS ?auto_13855 ?auto_13851 ) ( not ( = ?auto_13852 ?auto_13856 ) ) ( not ( = ?auto_13847 ?auto_13856 ) ) ( not ( = ?auto_13848 ?auto_13851 ) ) ( CALIBRATION_TARGET ?auto_13855 ?auto_13856 ) ( not ( = ?auto_13856 ?auto_13850 ) ) ( ON_BOARD ?auto_13854 ?auto_13857 ) ( not ( = ?auto_13855 ?auto_13854 ) ) ( SUPPORTS ?auto_13854 ?auto_13849 ) ( not ( = ?auto_13848 ?auto_13849 ) ) ( not ( = ?auto_13851 ?auto_13849 ) ) ( CALIBRATION_TARGET ?auto_13854 ?auto_13856 ) ( ON_BOARD ?auto_13853 ?auto_13857 ) ( not ( = ?auto_13855 ?auto_13853 ) ) ( not ( = ?auto_13854 ?auto_13853 ) ) ( SUPPORTS ?auto_13853 ?auto_13848 ) ( POINTING ?auto_13857 ?auto_13856 ) ( CALIBRATION_TARGET ?auto_13853 ?auto_13856 ) ( POWER_AVAIL ?auto_13857 ) )
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
      ?auto_13879 - INSTRUMENT
      ?auto_13881 - SATELLITE
      ?auto_13880 - DIRECTION
      ?auto_13878 - INSTRUMENT
      ?auto_13877 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13874 ?auto_13871 ) ) ( not ( = ?auto_13876 ?auto_13871 ) ) ( not ( = ?auto_13876 ?auto_13874 ) ) ( ON_BOARD ?auto_13879 ?auto_13881 ) ( SUPPORTS ?auto_13879 ?auto_13873 ) ( not ( = ?auto_13874 ?auto_13880 ) ) ( not ( = ?auto_13871 ?auto_13880 ) ) ( not ( = ?auto_13872 ?auto_13873 ) ) ( CALIBRATION_TARGET ?auto_13879 ?auto_13880 ) ( not ( = ?auto_13880 ?auto_13876 ) ) ( ON_BOARD ?auto_13878 ?auto_13881 ) ( not ( = ?auto_13879 ?auto_13878 ) ) ( SUPPORTS ?auto_13878 ?auto_13875 ) ( not ( = ?auto_13872 ?auto_13875 ) ) ( not ( = ?auto_13873 ?auto_13875 ) ) ( CALIBRATION_TARGET ?auto_13878 ?auto_13880 ) ( ON_BOARD ?auto_13877 ?auto_13881 ) ( not ( = ?auto_13879 ?auto_13877 ) ) ( not ( = ?auto_13878 ?auto_13877 ) ) ( SUPPORTS ?auto_13877 ?auto_13872 ) ( POINTING ?auto_13881 ?auto_13880 ) ( CALIBRATION_TARGET ?auto_13877 ?auto_13880 ) ( POWER_AVAIL ?auto_13881 ) )
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
      ?auto_13903 - INSTRUMENT
      ?auto_13905 - SATELLITE
      ?auto_13904 - DIRECTION
      ?auto_13902 - INSTRUMENT
      ?auto_13901 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13898 ?auto_13895 ) ) ( not ( = ?auto_13900 ?auto_13895 ) ) ( not ( = ?auto_13900 ?auto_13898 ) ) ( ON_BOARD ?auto_13903 ?auto_13905 ) ( SUPPORTS ?auto_13903 ?auto_13899 ) ( not ( = ?auto_13900 ?auto_13904 ) ) ( not ( = ?auto_13898 ?auto_13904 ) ) ( not ( = ?auto_13897 ?auto_13899 ) ) ( CALIBRATION_TARGET ?auto_13903 ?auto_13904 ) ( not ( = ?auto_13904 ?auto_13895 ) ) ( ON_BOARD ?auto_13902 ?auto_13905 ) ( not ( = ?auto_13903 ?auto_13902 ) ) ( SUPPORTS ?auto_13902 ?auto_13896 ) ( not ( = ?auto_13897 ?auto_13896 ) ) ( not ( = ?auto_13899 ?auto_13896 ) ) ( CALIBRATION_TARGET ?auto_13902 ?auto_13904 ) ( ON_BOARD ?auto_13901 ?auto_13905 ) ( not ( = ?auto_13903 ?auto_13901 ) ) ( not ( = ?auto_13902 ?auto_13901 ) ) ( SUPPORTS ?auto_13901 ?auto_13897 ) ( POINTING ?auto_13905 ?auto_13904 ) ( CALIBRATION_TARGET ?auto_13901 ?auto_13904 ) ( POWER_AVAIL ?auto_13905 ) )
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
      ?auto_13927 - INSTRUMENT
      ?auto_13929 - SATELLITE
      ?auto_13928 - DIRECTION
      ?auto_13926 - INSTRUMENT
      ?auto_13925 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13922 ?auto_13919 ) ) ( not ( = ?auto_13924 ?auto_13919 ) ) ( not ( = ?auto_13924 ?auto_13922 ) ) ( ON_BOARD ?auto_13927 ?auto_13929 ) ( SUPPORTS ?auto_13927 ?auto_13921 ) ( not ( = ?auto_13922 ?auto_13928 ) ) ( not ( = ?auto_13924 ?auto_13928 ) ) ( not ( = ?auto_13923 ?auto_13921 ) ) ( CALIBRATION_TARGET ?auto_13927 ?auto_13928 ) ( not ( = ?auto_13928 ?auto_13919 ) ) ( ON_BOARD ?auto_13926 ?auto_13929 ) ( not ( = ?auto_13927 ?auto_13926 ) ) ( SUPPORTS ?auto_13926 ?auto_13920 ) ( not ( = ?auto_13923 ?auto_13920 ) ) ( not ( = ?auto_13921 ?auto_13920 ) ) ( CALIBRATION_TARGET ?auto_13926 ?auto_13928 ) ( ON_BOARD ?auto_13925 ?auto_13929 ) ( not ( = ?auto_13927 ?auto_13925 ) ) ( not ( = ?auto_13926 ?auto_13925 ) ) ( SUPPORTS ?auto_13925 ?auto_13923 ) ( POINTING ?auto_13929 ?auto_13928 ) ( CALIBRATION_TARGET ?auto_13925 ?auto_13928 ) ( POWER_AVAIL ?auto_13929 ) )
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
      ?auto_13977 - INSTRUMENT
      ?auto_13979 - SATELLITE
      ?auto_13978 - DIRECTION
      ?auto_13976 - INSTRUMENT
      ?auto_13975 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13972 ?auto_13969 ) ) ( not ( = ?auto_13974 ?auto_13969 ) ) ( not ( = ?auto_13974 ?auto_13972 ) ) ( ON_BOARD ?auto_13977 ?auto_13979 ) ( SUPPORTS ?auto_13977 ?auto_13970 ) ( not ( = ?auto_13969 ?auto_13978 ) ) ( not ( = ?auto_13972 ?auto_13978 ) ) ( not ( = ?auto_13971 ?auto_13970 ) ) ( CALIBRATION_TARGET ?auto_13977 ?auto_13978 ) ( not ( = ?auto_13978 ?auto_13974 ) ) ( ON_BOARD ?auto_13976 ?auto_13979 ) ( not ( = ?auto_13977 ?auto_13976 ) ) ( SUPPORTS ?auto_13976 ?auto_13973 ) ( not ( = ?auto_13971 ?auto_13973 ) ) ( not ( = ?auto_13970 ?auto_13973 ) ) ( CALIBRATION_TARGET ?auto_13976 ?auto_13978 ) ( ON_BOARD ?auto_13975 ?auto_13979 ) ( not ( = ?auto_13977 ?auto_13975 ) ) ( not ( = ?auto_13976 ?auto_13975 ) ) ( SUPPORTS ?auto_13975 ?auto_13971 ) ( POINTING ?auto_13979 ?auto_13978 ) ( CALIBRATION_TARGET ?auto_13975 ?auto_13978 ) ( POWER_AVAIL ?auto_13979 ) )
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
      ?auto_14001 - INSTRUMENT
      ?auto_14003 - SATELLITE
      ?auto_14002 - DIRECTION
      ?auto_14000 - INSTRUMENT
      ?auto_13999 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13996 ?auto_13993 ) ) ( not ( = ?auto_13998 ?auto_13993 ) ) ( not ( = ?auto_13998 ?auto_13996 ) ) ( ON_BOARD ?auto_14001 ?auto_14003 ) ( SUPPORTS ?auto_14001 ?auto_13994 ) ( not ( = ?auto_13993 ?auto_14002 ) ) ( not ( = ?auto_13998 ?auto_14002 ) ) ( not ( = ?auto_13997 ?auto_13994 ) ) ( CALIBRATION_TARGET ?auto_14001 ?auto_14002 ) ( not ( = ?auto_14002 ?auto_13996 ) ) ( ON_BOARD ?auto_14000 ?auto_14003 ) ( not ( = ?auto_14001 ?auto_14000 ) ) ( SUPPORTS ?auto_14000 ?auto_13995 ) ( not ( = ?auto_13997 ?auto_13995 ) ) ( not ( = ?auto_13994 ?auto_13995 ) ) ( CALIBRATION_TARGET ?auto_14000 ?auto_14002 ) ( ON_BOARD ?auto_13999 ?auto_14003 ) ( not ( = ?auto_14001 ?auto_13999 ) ) ( not ( = ?auto_14000 ?auto_13999 ) ) ( SUPPORTS ?auto_13999 ?auto_13997 ) ( POINTING ?auto_14003 ?auto_14002 ) ( CALIBRATION_TARGET ?auto_13999 ?auto_14002 ) ( POWER_AVAIL ?auto_14003 ) )
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
      ?auto_14081 - DIRECTION
      ?auto_14076 - INSTRUMENT
      ?auto_14079 - SATELLITE
      ?auto_14077 - DIRECTION
      ?auto_14080 - MODE
      ?auto_14074 - DIRECTION
      ?auto_14075 - INSTRUMENT
      ?auto_14078 - MODE
      ?auto_14073 - INSTRUMENT
      ?auto_14082 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14071 ?auto_14081 ) ) ( ON_BOARD ?auto_14076 ?auto_14079 ) ( SUPPORTS ?auto_14076 ?auto_14072 ) ( not ( = ?auto_14071 ?auto_14077 ) ) ( not ( = ?auto_14081 ?auto_14077 ) ) ( not ( = ?auto_14080 ?auto_14072 ) ) ( CALIBRATION_TARGET ?auto_14076 ?auto_14077 ) ( not ( = ?auto_14077 ?auto_14074 ) ) ( not ( = ?auto_14071 ?auto_14074 ) ) ( not ( = ?auto_14081 ?auto_14074 ) ) ( ON_BOARD ?auto_14075 ?auto_14079 ) ( not ( = ?auto_14076 ?auto_14075 ) ) ( SUPPORTS ?auto_14075 ?auto_14078 ) ( not ( = ?auto_14080 ?auto_14078 ) ) ( not ( = ?auto_14072 ?auto_14078 ) ) ( CALIBRATION_TARGET ?auto_14075 ?auto_14077 ) ( ON_BOARD ?auto_14073 ?auto_14079 ) ( not ( = ?auto_14076 ?auto_14073 ) ) ( not ( = ?auto_14075 ?auto_14073 ) ) ( SUPPORTS ?auto_14073 ?auto_14080 ) ( CALIBRATION_TARGET ?auto_14073 ?auto_14077 ) ( POWER_AVAIL ?auto_14079 ) ( POINTING ?auto_14079 ?auto_14082 ) ( not ( = ?auto_14077 ?auto_14082 ) ) ( not ( = ?auto_14071 ?auto_14082 ) ) ( not ( = ?auto_14081 ?auto_14082 ) ) ( not ( = ?auto_14074 ?auto_14082 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_14079 ?auto_14077 ?auto_14082 )
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
      ?auto_14089 - INSTRUMENT
      ?auto_14092 - SATELLITE
      ?auto_14088 - DIRECTION
      ?auto_14091 - DIRECTION
      ?auto_14093 - INSTRUMENT
      ?auto_14087 - MODE
      ?auto_14094 - INSTRUMENT
      ?auto_14090 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14086 ?auto_14083 ) ) ( ON_BOARD ?auto_14089 ?auto_14092 ) ( SUPPORTS ?auto_14089 ?auto_14085 ) ( not ( = ?auto_14086 ?auto_14088 ) ) ( not ( = ?auto_14083 ?auto_14088 ) ) ( not ( = ?auto_14084 ?auto_14085 ) ) ( CALIBRATION_TARGET ?auto_14089 ?auto_14088 ) ( not ( = ?auto_14088 ?auto_14091 ) ) ( not ( = ?auto_14086 ?auto_14091 ) ) ( not ( = ?auto_14083 ?auto_14091 ) ) ( ON_BOARD ?auto_14093 ?auto_14092 ) ( not ( = ?auto_14089 ?auto_14093 ) ) ( SUPPORTS ?auto_14093 ?auto_14087 ) ( not ( = ?auto_14084 ?auto_14087 ) ) ( not ( = ?auto_14085 ?auto_14087 ) ) ( CALIBRATION_TARGET ?auto_14093 ?auto_14088 ) ( ON_BOARD ?auto_14094 ?auto_14092 ) ( not ( = ?auto_14089 ?auto_14094 ) ) ( not ( = ?auto_14093 ?auto_14094 ) ) ( SUPPORTS ?auto_14094 ?auto_14084 ) ( CALIBRATION_TARGET ?auto_14094 ?auto_14088 ) ( POWER_AVAIL ?auto_14092 ) ( POINTING ?auto_14092 ?auto_14090 ) ( not ( = ?auto_14088 ?auto_14090 ) ) ( not ( = ?auto_14086 ?auto_14090 ) ) ( not ( = ?auto_14083 ?auto_14090 ) ) ( not ( = ?auto_14091 ?auto_14090 ) ) )
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
      ?auto_14106 - DIRECTION
      ?auto_14099 - INSTRUMENT
      ?auto_14104 - SATELLITE
      ?auto_14102 - DIRECTION
      ?auto_14105 - MODE
      ?auto_14103 - INSTRUMENT
      ?auto_14101 - INSTRUMENT
      ?auto_14100 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14098 ?auto_14095 ) ) ( not ( = ?auto_14098 ?auto_14106 ) ) ( ON_BOARD ?auto_14099 ?auto_14104 ) ( SUPPORTS ?auto_14099 ?auto_14097 ) ( not ( = ?auto_14098 ?auto_14102 ) ) ( not ( = ?auto_14106 ?auto_14102 ) ) ( not ( = ?auto_14105 ?auto_14097 ) ) ( CALIBRATION_TARGET ?auto_14099 ?auto_14102 ) ( not ( = ?auto_14102 ?auto_14095 ) ) ( not ( = ?auto_14106 ?auto_14095 ) ) ( ON_BOARD ?auto_14103 ?auto_14104 ) ( not ( = ?auto_14099 ?auto_14103 ) ) ( SUPPORTS ?auto_14103 ?auto_14096 ) ( not ( = ?auto_14105 ?auto_14096 ) ) ( not ( = ?auto_14097 ?auto_14096 ) ) ( CALIBRATION_TARGET ?auto_14103 ?auto_14102 ) ( ON_BOARD ?auto_14101 ?auto_14104 ) ( not ( = ?auto_14099 ?auto_14101 ) ) ( not ( = ?auto_14103 ?auto_14101 ) ) ( SUPPORTS ?auto_14101 ?auto_14105 ) ( CALIBRATION_TARGET ?auto_14101 ?auto_14102 ) ( POWER_AVAIL ?auto_14104 ) ( POINTING ?auto_14104 ?auto_14100 ) ( not ( = ?auto_14102 ?auto_14100 ) ) ( not ( = ?auto_14098 ?auto_14100 ) ) ( not ( = ?auto_14106 ?auto_14100 ) ) ( not ( = ?auto_14095 ?auto_14100 ) ) )
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
      ?auto_14111 - INSTRUMENT
      ?auto_14118 - SATELLITE
      ?auto_14114 - DIRECTION
      ?auto_14116 - DIRECTION
      ?auto_14117 - INSTRUMENT
      ?auto_14115 - MODE
      ?auto_14113 - INSTRUMENT
      ?auto_14112 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14110 ?auto_14107 ) ) ( ON_BOARD ?auto_14111 ?auto_14118 ) ( SUPPORTS ?auto_14111 ?auto_14108 ) ( not ( = ?auto_14107 ?auto_14114 ) ) ( not ( = ?auto_14110 ?auto_14114 ) ) ( not ( = ?auto_14109 ?auto_14108 ) ) ( CALIBRATION_TARGET ?auto_14111 ?auto_14114 ) ( not ( = ?auto_14114 ?auto_14116 ) ) ( not ( = ?auto_14107 ?auto_14116 ) ) ( not ( = ?auto_14110 ?auto_14116 ) ) ( ON_BOARD ?auto_14117 ?auto_14118 ) ( not ( = ?auto_14111 ?auto_14117 ) ) ( SUPPORTS ?auto_14117 ?auto_14115 ) ( not ( = ?auto_14109 ?auto_14115 ) ) ( not ( = ?auto_14108 ?auto_14115 ) ) ( CALIBRATION_TARGET ?auto_14117 ?auto_14114 ) ( ON_BOARD ?auto_14113 ?auto_14118 ) ( not ( = ?auto_14111 ?auto_14113 ) ) ( not ( = ?auto_14117 ?auto_14113 ) ) ( SUPPORTS ?auto_14113 ?auto_14109 ) ( CALIBRATION_TARGET ?auto_14113 ?auto_14114 ) ( POWER_AVAIL ?auto_14118 ) ( POINTING ?auto_14118 ?auto_14112 ) ( not ( = ?auto_14114 ?auto_14112 ) ) ( not ( = ?auto_14107 ?auto_14112 ) ) ( not ( = ?auto_14110 ?auto_14112 ) ) ( not ( = ?auto_14116 ?auto_14112 ) ) )
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
      ?auto_14130 - DIRECTION
      ?auto_14123 - INSTRUMENT
      ?auto_14128 - SATELLITE
      ?auto_14126 - DIRECTION
      ?auto_14129 - MODE
      ?auto_14127 - INSTRUMENT
      ?auto_14125 - INSTRUMENT
      ?auto_14124 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14122 ?auto_14119 ) ) ( not ( = ?auto_14119 ?auto_14130 ) ) ( ON_BOARD ?auto_14123 ?auto_14128 ) ( SUPPORTS ?auto_14123 ?auto_14120 ) ( not ( = ?auto_14119 ?auto_14126 ) ) ( not ( = ?auto_14130 ?auto_14126 ) ) ( not ( = ?auto_14129 ?auto_14120 ) ) ( CALIBRATION_TARGET ?auto_14123 ?auto_14126 ) ( not ( = ?auto_14126 ?auto_14122 ) ) ( not ( = ?auto_14130 ?auto_14122 ) ) ( ON_BOARD ?auto_14127 ?auto_14128 ) ( not ( = ?auto_14123 ?auto_14127 ) ) ( SUPPORTS ?auto_14127 ?auto_14121 ) ( not ( = ?auto_14129 ?auto_14121 ) ) ( not ( = ?auto_14120 ?auto_14121 ) ) ( CALIBRATION_TARGET ?auto_14127 ?auto_14126 ) ( ON_BOARD ?auto_14125 ?auto_14128 ) ( not ( = ?auto_14123 ?auto_14125 ) ) ( not ( = ?auto_14127 ?auto_14125 ) ) ( SUPPORTS ?auto_14125 ?auto_14129 ) ( CALIBRATION_TARGET ?auto_14125 ?auto_14126 ) ( POWER_AVAIL ?auto_14128 ) ( POINTING ?auto_14128 ?auto_14124 ) ( not ( = ?auto_14126 ?auto_14124 ) ) ( not ( = ?auto_14119 ?auto_14124 ) ) ( not ( = ?auto_14130 ?auto_14124 ) ) ( not ( = ?auto_14122 ?auto_14124 ) ) )
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
      ?auto_14165 - INSTRUMENT
      ?auto_14170 - SATELLITE
      ?auto_14168 - DIRECTION
      ?auto_14169 - INSTRUMENT
      ?auto_14167 - INSTRUMENT
      ?auto_14166 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14162 ?auto_14159 ) ) ( not ( = ?auto_14164 ?auto_14159 ) ) ( not ( = ?auto_14164 ?auto_14162 ) ) ( ON_BOARD ?auto_14165 ?auto_14170 ) ( SUPPORTS ?auto_14165 ?auto_14163 ) ( not ( = ?auto_14164 ?auto_14168 ) ) ( not ( = ?auto_14159 ?auto_14168 ) ) ( not ( = ?auto_14160 ?auto_14163 ) ) ( CALIBRATION_TARGET ?auto_14165 ?auto_14168 ) ( not ( = ?auto_14168 ?auto_14162 ) ) ( ON_BOARD ?auto_14169 ?auto_14170 ) ( not ( = ?auto_14165 ?auto_14169 ) ) ( SUPPORTS ?auto_14169 ?auto_14161 ) ( not ( = ?auto_14160 ?auto_14161 ) ) ( not ( = ?auto_14163 ?auto_14161 ) ) ( CALIBRATION_TARGET ?auto_14169 ?auto_14168 ) ( ON_BOARD ?auto_14167 ?auto_14170 ) ( not ( = ?auto_14165 ?auto_14167 ) ) ( not ( = ?auto_14169 ?auto_14167 ) ) ( SUPPORTS ?auto_14167 ?auto_14160 ) ( CALIBRATION_TARGET ?auto_14167 ?auto_14168 ) ( POWER_AVAIL ?auto_14170 ) ( POINTING ?auto_14170 ?auto_14166 ) ( not ( = ?auto_14168 ?auto_14166 ) ) ( not ( = ?auto_14164 ?auto_14166 ) ) ( not ( = ?auto_14159 ?auto_14166 ) ) ( not ( = ?auto_14162 ?auto_14166 ) ) )
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
      ?auto_14191 - INSTRUMENT
      ?auto_14196 - SATELLITE
      ?auto_14194 - DIRECTION
      ?auto_14195 - INSTRUMENT
      ?auto_14193 - INSTRUMENT
      ?auto_14192 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14188 ?auto_14185 ) ) ( not ( = ?auto_14190 ?auto_14185 ) ) ( not ( = ?auto_14190 ?auto_14188 ) ) ( ON_BOARD ?auto_14191 ?auto_14196 ) ( SUPPORTS ?auto_14191 ?auto_14187 ) ( not ( = ?auto_14188 ?auto_14194 ) ) ( not ( = ?auto_14185 ?auto_14194 ) ) ( not ( = ?auto_14186 ?auto_14187 ) ) ( CALIBRATION_TARGET ?auto_14191 ?auto_14194 ) ( not ( = ?auto_14194 ?auto_14190 ) ) ( ON_BOARD ?auto_14195 ?auto_14196 ) ( not ( = ?auto_14191 ?auto_14195 ) ) ( SUPPORTS ?auto_14195 ?auto_14189 ) ( not ( = ?auto_14186 ?auto_14189 ) ) ( not ( = ?auto_14187 ?auto_14189 ) ) ( CALIBRATION_TARGET ?auto_14195 ?auto_14194 ) ( ON_BOARD ?auto_14193 ?auto_14196 ) ( not ( = ?auto_14191 ?auto_14193 ) ) ( not ( = ?auto_14195 ?auto_14193 ) ) ( SUPPORTS ?auto_14193 ?auto_14186 ) ( CALIBRATION_TARGET ?auto_14193 ?auto_14194 ) ( POWER_AVAIL ?auto_14196 ) ( POINTING ?auto_14196 ?auto_14192 ) ( not ( = ?auto_14194 ?auto_14192 ) ) ( not ( = ?auto_14188 ?auto_14192 ) ) ( not ( = ?auto_14185 ?auto_14192 ) ) ( not ( = ?auto_14190 ?auto_14192 ) ) )
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
      ?auto_14217 - INSTRUMENT
      ?auto_14222 - SATELLITE
      ?auto_14220 - DIRECTION
      ?auto_14221 - INSTRUMENT
      ?auto_14219 - INSTRUMENT
      ?auto_14218 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14214 ?auto_14211 ) ) ( not ( = ?auto_14216 ?auto_14211 ) ) ( not ( = ?auto_14216 ?auto_14214 ) ) ( ON_BOARD ?auto_14217 ?auto_14222 ) ( SUPPORTS ?auto_14217 ?auto_14215 ) ( not ( = ?auto_14216 ?auto_14220 ) ) ( not ( = ?auto_14214 ?auto_14220 ) ) ( not ( = ?auto_14213 ?auto_14215 ) ) ( CALIBRATION_TARGET ?auto_14217 ?auto_14220 ) ( not ( = ?auto_14220 ?auto_14211 ) ) ( ON_BOARD ?auto_14221 ?auto_14222 ) ( not ( = ?auto_14217 ?auto_14221 ) ) ( SUPPORTS ?auto_14221 ?auto_14212 ) ( not ( = ?auto_14213 ?auto_14212 ) ) ( not ( = ?auto_14215 ?auto_14212 ) ) ( CALIBRATION_TARGET ?auto_14221 ?auto_14220 ) ( ON_BOARD ?auto_14219 ?auto_14222 ) ( not ( = ?auto_14217 ?auto_14219 ) ) ( not ( = ?auto_14221 ?auto_14219 ) ) ( SUPPORTS ?auto_14219 ?auto_14213 ) ( CALIBRATION_TARGET ?auto_14219 ?auto_14220 ) ( POWER_AVAIL ?auto_14222 ) ( POINTING ?auto_14222 ?auto_14218 ) ( not ( = ?auto_14220 ?auto_14218 ) ) ( not ( = ?auto_14216 ?auto_14218 ) ) ( not ( = ?auto_14214 ?auto_14218 ) ) ( not ( = ?auto_14211 ?auto_14218 ) ) )
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
      ?auto_14243 - INSTRUMENT
      ?auto_14248 - SATELLITE
      ?auto_14246 - DIRECTION
      ?auto_14247 - INSTRUMENT
      ?auto_14245 - INSTRUMENT
      ?auto_14244 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14240 ?auto_14237 ) ) ( not ( = ?auto_14242 ?auto_14237 ) ) ( not ( = ?auto_14242 ?auto_14240 ) ) ( ON_BOARD ?auto_14243 ?auto_14248 ) ( SUPPORTS ?auto_14243 ?auto_14239 ) ( not ( = ?auto_14240 ?auto_14246 ) ) ( not ( = ?auto_14242 ?auto_14246 ) ) ( not ( = ?auto_14241 ?auto_14239 ) ) ( CALIBRATION_TARGET ?auto_14243 ?auto_14246 ) ( not ( = ?auto_14246 ?auto_14237 ) ) ( ON_BOARD ?auto_14247 ?auto_14248 ) ( not ( = ?auto_14243 ?auto_14247 ) ) ( SUPPORTS ?auto_14247 ?auto_14238 ) ( not ( = ?auto_14241 ?auto_14238 ) ) ( not ( = ?auto_14239 ?auto_14238 ) ) ( CALIBRATION_TARGET ?auto_14247 ?auto_14246 ) ( ON_BOARD ?auto_14245 ?auto_14248 ) ( not ( = ?auto_14243 ?auto_14245 ) ) ( not ( = ?auto_14247 ?auto_14245 ) ) ( SUPPORTS ?auto_14245 ?auto_14241 ) ( CALIBRATION_TARGET ?auto_14245 ?auto_14246 ) ( POWER_AVAIL ?auto_14248 ) ( POINTING ?auto_14248 ?auto_14244 ) ( not ( = ?auto_14246 ?auto_14244 ) ) ( not ( = ?auto_14240 ?auto_14244 ) ) ( not ( = ?auto_14242 ?auto_14244 ) ) ( not ( = ?auto_14237 ?auto_14244 ) ) )
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
      ?auto_14297 - INSTRUMENT
      ?auto_14302 - SATELLITE
      ?auto_14300 - DIRECTION
      ?auto_14301 - INSTRUMENT
      ?auto_14299 - INSTRUMENT
      ?auto_14298 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14294 ?auto_14291 ) ) ( not ( = ?auto_14296 ?auto_14291 ) ) ( not ( = ?auto_14296 ?auto_14294 ) ) ( ON_BOARD ?auto_14297 ?auto_14302 ) ( SUPPORTS ?auto_14297 ?auto_14292 ) ( not ( = ?auto_14291 ?auto_14300 ) ) ( not ( = ?auto_14294 ?auto_14300 ) ) ( not ( = ?auto_14293 ?auto_14292 ) ) ( CALIBRATION_TARGET ?auto_14297 ?auto_14300 ) ( not ( = ?auto_14300 ?auto_14296 ) ) ( ON_BOARD ?auto_14301 ?auto_14302 ) ( not ( = ?auto_14297 ?auto_14301 ) ) ( SUPPORTS ?auto_14301 ?auto_14295 ) ( not ( = ?auto_14293 ?auto_14295 ) ) ( not ( = ?auto_14292 ?auto_14295 ) ) ( CALIBRATION_TARGET ?auto_14301 ?auto_14300 ) ( ON_BOARD ?auto_14299 ?auto_14302 ) ( not ( = ?auto_14297 ?auto_14299 ) ) ( not ( = ?auto_14301 ?auto_14299 ) ) ( SUPPORTS ?auto_14299 ?auto_14293 ) ( CALIBRATION_TARGET ?auto_14299 ?auto_14300 ) ( POWER_AVAIL ?auto_14302 ) ( POINTING ?auto_14302 ?auto_14298 ) ( not ( = ?auto_14300 ?auto_14298 ) ) ( not ( = ?auto_14291 ?auto_14298 ) ) ( not ( = ?auto_14294 ?auto_14298 ) ) ( not ( = ?auto_14296 ?auto_14298 ) ) )
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
      ?auto_14323 - INSTRUMENT
      ?auto_14328 - SATELLITE
      ?auto_14326 - DIRECTION
      ?auto_14327 - INSTRUMENT
      ?auto_14325 - INSTRUMENT
      ?auto_14324 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14320 ?auto_14317 ) ) ( not ( = ?auto_14322 ?auto_14317 ) ) ( not ( = ?auto_14322 ?auto_14320 ) ) ( ON_BOARD ?auto_14323 ?auto_14328 ) ( SUPPORTS ?auto_14323 ?auto_14318 ) ( not ( = ?auto_14317 ?auto_14326 ) ) ( not ( = ?auto_14322 ?auto_14326 ) ) ( not ( = ?auto_14321 ?auto_14318 ) ) ( CALIBRATION_TARGET ?auto_14323 ?auto_14326 ) ( not ( = ?auto_14326 ?auto_14320 ) ) ( ON_BOARD ?auto_14327 ?auto_14328 ) ( not ( = ?auto_14323 ?auto_14327 ) ) ( SUPPORTS ?auto_14327 ?auto_14319 ) ( not ( = ?auto_14321 ?auto_14319 ) ) ( not ( = ?auto_14318 ?auto_14319 ) ) ( CALIBRATION_TARGET ?auto_14327 ?auto_14326 ) ( ON_BOARD ?auto_14325 ?auto_14328 ) ( not ( = ?auto_14323 ?auto_14325 ) ) ( not ( = ?auto_14327 ?auto_14325 ) ) ( SUPPORTS ?auto_14325 ?auto_14321 ) ( CALIBRATION_TARGET ?auto_14325 ?auto_14326 ) ( POWER_AVAIL ?auto_14328 ) ( POINTING ?auto_14328 ?auto_14324 ) ( not ( = ?auto_14326 ?auto_14324 ) ) ( not ( = ?auto_14317 ?auto_14324 ) ) ( not ( = ?auto_14322 ?auto_14324 ) ) ( not ( = ?auto_14320 ?auto_14324 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14322 ?auto_14321 ?auto_14317 ?auto_14318 )
      ( GET-3IMAGE-VERIFY ?auto_14317 ?auto_14318 ?auto_14320 ?auto_14319 ?auto_14322 ?auto_14321 ) )
  )

)

