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

  ( :method GET-5IMAGE-VERIFY
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
      ?goal_dir5 - DIRECTION
      ?goal_mode5 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) ( HAVE_IMAGE ?goal_dir3 ?goal_mode3 ) ( HAVE_IMAGE ?goal_dir4 ?goal_mode4 ) ( HAVE_IMAGE ?goal_dir5 ?goal_mode5 ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1892504 - DIRECTION
      ?auto_1892505 - MODE
    )
    :vars
    (
      ?auto_1892506 - INSTRUMENT
      ?auto_1892507 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_1892506 ) ( ON_BOARD ?auto_1892506 ?auto_1892507 ) ( SUPPORTS ?auto_1892506 ?auto_1892505 ) ( POWER_ON ?auto_1892506 ) ( POINTING ?auto_1892507 ?auto_1892504 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_1892507 ?auto_1892504 ?auto_1892506 ?auto_1892505 )
      ( GET-1IMAGE-VERIFY ?auto_1892504 ?auto_1892505 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1892544 - DIRECTION
      ?auto_1892545 - MODE
    )
    :vars
    (
      ?auto_1892547 - INSTRUMENT
      ?auto_1892546 - SATELLITE
      ?auto_1892548 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_1892547 ) ( ON_BOARD ?auto_1892547 ?auto_1892546 ) ( SUPPORTS ?auto_1892547 ?auto_1892545 ) ( POWER_ON ?auto_1892547 ) ( POINTING ?auto_1892546 ?auto_1892548 ) ( not ( = ?auto_1892544 ?auto_1892548 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1892546 ?auto_1892544 ?auto_1892548 )
      ( GET-1IMAGE ?auto_1892544 ?auto_1892545 )
      ( GET-1IMAGE-VERIFY ?auto_1892544 ?auto_1892545 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1892589 - DIRECTION
      ?auto_1892590 - MODE
    )
    :vars
    (
      ?auto_1892591 - INSTRUMENT
      ?auto_1892592 - SATELLITE
      ?auto_1892593 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1892591 ?auto_1892592 ) ( SUPPORTS ?auto_1892591 ?auto_1892590 ) ( POWER_ON ?auto_1892591 ) ( POINTING ?auto_1892592 ?auto_1892593 ) ( not ( = ?auto_1892589 ?auto_1892593 ) ) ( CALIBRATION_TARGET ?auto_1892591 ?auto_1892593 ) ( NOT_CALIBRATED ?auto_1892591 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1892592 ?auto_1892591 ?auto_1892593 )
      ( GET-1IMAGE ?auto_1892589 ?auto_1892590 )
      ( GET-1IMAGE-VERIFY ?auto_1892589 ?auto_1892590 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1892634 - DIRECTION
      ?auto_1892635 - MODE
    )
    :vars
    (
      ?auto_1892636 - INSTRUMENT
      ?auto_1892638 - SATELLITE
      ?auto_1892637 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1892636 ?auto_1892638 ) ( SUPPORTS ?auto_1892636 ?auto_1892635 ) ( POINTING ?auto_1892638 ?auto_1892637 ) ( not ( = ?auto_1892634 ?auto_1892637 ) ) ( CALIBRATION_TARGET ?auto_1892636 ?auto_1892637 ) ( POWER_AVAIL ?auto_1892638 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_1892636 ?auto_1892638 )
      ( GET-1IMAGE ?auto_1892634 ?auto_1892635 )
      ( GET-1IMAGE-VERIFY ?auto_1892634 ?auto_1892635 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1892679 - DIRECTION
      ?auto_1892680 - MODE
    )
    :vars
    (
      ?auto_1892683 - INSTRUMENT
      ?auto_1892681 - SATELLITE
      ?auto_1892682 - DIRECTION
      ?auto_1892684 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1892683 ?auto_1892681 ) ( SUPPORTS ?auto_1892683 ?auto_1892680 ) ( not ( = ?auto_1892679 ?auto_1892682 ) ) ( CALIBRATION_TARGET ?auto_1892683 ?auto_1892682 ) ( POWER_AVAIL ?auto_1892681 ) ( POINTING ?auto_1892681 ?auto_1892684 ) ( not ( = ?auto_1892682 ?auto_1892684 ) ) ( not ( = ?auto_1892679 ?auto_1892684 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1892681 ?auto_1892682 ?auto_1892684 )
      ( GET-1IMAGE ?auto_1892679 ?auto_1892680 )
      ( GET-1IMAGE-VERIFY ?auto_1892679 ?auto_1892680 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1893220 - DIRECTION
      ?auto_1893221 - MODE
      ?auto_1893222 - DIRECTION
      ?auto_1893219 - MODE
    )
    :vars
    (
      ?auto_1893223 - INSTRUMENT
      ?auto_1893224 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_1893222 ?auto_1893220 ) ) ( CALIBRATED ?auto_1893223 ) ( ON_BOARD ?auto_1893223 ?auto_1893224 ) ( SUPPORTS ?auto_1893223 ?auto_1893219 ) ( POWER_ON ?auto_1893223 ) ( POINTING ?auto_1893224 ?auto_1893222 ) ( HAVE_IMAGE ?auto_1893220 ?auto_1893221 ) ( not ( = ?auto_1893221 ?auto_1893219 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1893222 ?auto_1893219 )
      ( GET-2IMAGE-VERIFY ?auto_1893220 ?auto_1893221 ?auto_1893222 ?auto_1893219 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1893226 - DIRECTION
      ?auto_1893227 - MODE
      ?auto_1893228 - DIRECTION
      ?auto_1893225 - MODE
    )
    :vars
    (
      ?auto_1893229 - INSTRUMENT
      ?auto_1893230 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_1893228 ?auto_1893226 ) ) ( CALIBRATED ?auto_1893229 ) ( ON_BOARD ?auto_1893229 ?auto_1893230 ) ( SUPPORTS ?auto_1893229 ?auto_1893227 ) ( POWER_ON ?auto_1893229 ) ( POINTING ?auto_1893230 ?auto_1893226 ) ( HAVE_IMAGE ?auto_1893228 ?auto_1893225 ) ( not ( = ?auto_1893227 ?auto_1893225 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1893226 ?auto_1893227 )
      ( GET-2IMAGE-VERIFY ?auto_1893226 ?auto_1893227 ?auto_1893228 ?auto_1893225 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1893821 - DIRECTION
      ?auto_1893822 - MODE
      ?auto_1893823 - DIRECTION
      ?auto_1893820 - MODE
    )
    :vars
    (
      ?auto_1893825 - INSTRUMENT
      ?auto_1893824 - SATELLITE
      ?auto_1893826 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1893823 ?auto_1893821 ) ) ( CALIBRATED ?auto_1893825 ) ( ON_BOARD ?auto_1893825 ?auto_1893824 ) ( SUPPORTS ?auto_1893825 ?auto_1893820 ) ( POWER_ON ?auto_1893825 ) ( POINTING ?auto_1893824 ?auto_1893826 ) ( not ( = ?auto_1893823 ?auto_1893826 ) ) ( HAVE_IMAGE ?auto_1893821 ?auto_1893822 ) ( not ( = ?auto_1893821 ?auto_1893826 ) ) ( not ( = ?auto_1893822 ?auto_1893820 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1893823 ?auto_1893820 )
      ( GET-2IMAGE-VERIFY ?auto_1893821 ?auto_1893822 ?auto_1893823 ?auto_1893820 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1893828 - DIRECTION
      ?auto_1893829 - MODE
      ?auto_1893830 - DIRECTION
      ?auto_1893827 - MODE
    )
    :vars
    (
      ?auto_1893832 - INSTRUMENT
      ?auto_1893833 - SATELLITE
      ?auto_1893831 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1893830 ?auto_1893828 ) ) ( CALIBRATED ?auto_1893832 ) ( ON_BOARD ?auto_1893832 ?auto_1893833 ) ( SUPPORTS ?auto_1893832 ?auto_1893829 ) ( POWER_ON ?auto_1893832 ) ( POINTING ?auto_1893833 ?auto_1893831 ) ( not ( = ?auto_1893828 ?auto_1893831 ) ) ( HAVE_IMAGE ?auto_1893830 ?auto_1893827 ) ( not ( = ?auto_1893830 ?auto_1893831 ) ) ( not ( = ?auto_1893827 ?auto_1893829 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1893830 ?auto_1893827 ?auto_1893828 ?auto_1893829 )
      ( GET-2IMAGE-VERIFY ?auto_1893828 ?auto_1893829 ?auto_1893830 ?auto_1893827 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1894480 - DIRECTION
      ?auto_1894481 - MODE
    )
    :vars
    (
      ?auto_1894486 - DIRECTION
      ?auto_1894483 - INSTRUMENT
      ?auto_1894485 - SATELLITE
      ?auto_1894482 - DIRECTION
      ?auto_1894484 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_1894480 ?auto_1894486 ) ) ( ON_BOARD ?auto_1894483 ?auto_1894485 ) ( SUPPORTS ?auto_1894483 ?auto_1894481 ) ( POWER_ON ?auto_1894483 ) ( POINTING ?auto_1894485 ?auto_1894482 ) ( not ( = ?auto_1894480 ?auto_1894482 ) ) ( HAVE_IMAGE ?auto_1894486 ?auto_1894484 ) ( not ( = ?auto_1894486 ?auto_1894482 ) ) ( not ( = ?auto_1894484 ?auto_1894481 ) ) ( CALIBRATION_TARGET ?auto_1894483 ?auto_1894482 ) ( NOT_CALIBRATED ?auto_1894483 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1894485 ?auto_1894483 ?auto_1894482 )
      ( GET-2IMAGE ?auto_1894486 ?auto_1894484 ?auto_1894480 ?auto_1894481 )
      ( GET-1IMAGE-VERIFY ?auto_1894480 ?auto_1894481 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1894488 - DIRECTION
      ?auto_1894489 - MODE
      ?auto_1894490 - DIRECTION
      ?auto_1894487 - MODE
    )
    :vars
    (
      ?auto_1894493 - INSTRUMENT
      ?auto_1894492 - SATELLITE
      ?auto_1894491 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1894490 ?auto_1894488 ) ) ( ON_BOARD ?auto_1894493 ?auto_1894492 ) ( SUPPORTS ?auto_1894493 ?auto_1894487 ) ( POWER_ON ?auto_1894493 ) ( POINTING ?auto_1894492 ?auto_1894491 ) ( not ( = ?auto_1894490 ?auto_1894491 ) ) ( HAVE_IMAGE ?auto_1894488 ?auto_1894489 ) ( not ( = ?auto_1894488 ?auto_1894491 ) ) ( not ( = ?auto_1894489 ?auto_1894487 ) ) ( CALIBRATION_TARGET ?auto_1894493 ?auto_1894491 ) ( NOT_CALIBRATED ?auto_1894493 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1894490 ?auto_1894487 )
      ( GET-2IMAGE-VERIFY ?auto_1894488 ?auto_1894489 ?auto_1894490 ?auto_1894487 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1894495 - DIRECTION
      ?auto_1894496 - MODE
      ?auto_1894497 - DIRECTION
      ?auto_1894494 - MODE
    )
    :vars
    (
      ?auto_1894500 - INSTRUMENT
      ?auto_1894498 - SATELLITE
      ?auto_1894499 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1894497 ?auto_1894495 ) ) ( ON_BOARD ?auto_1894500 ?auto_1894498 ) ( SUPPORTS ?auto_1894500 ?auto_1894496 ) ( POWER_ON ?auto_1894500 ) ( POINTING ?auto_1894498 ?auto_1894499 ) ( not ( = ?auto_1894495 ?auto_1894499 ) ) ( HAVE_IMAGE ?auto_1894497 ?auto_1894494 ) ( not ( = ?auto_1894497 ?auto_1894499 ) ) ( not ( = ?auto_1894494 ?auto_1894496 ) ) ( CALIBRATION_TARGET ?auto_1894500 ?auto_1894499 ) ( NOT_CALIBRATED ?auto_1894500 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1894497 ?auto_1894494 ?auto_1894495 ?auto_1894496 )
      ( GET-2IMAGE-VERIFY ?auto_1894495 ?auto_1894496 ?auto_1894497 ?auto_1894494 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1895147 - DIRECTION
      ?auto_1895148 - MODE
    )
    :vars
    (
      ?auto_1895150 - DIRECTION
      ?auto_1895153 - INSTRUMENT
      ?auto_1895149 - SATELLITE
      ?auto_1895151 - DIRECTION
      ?auto_1895152 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_1895147 ?auto_1895150 ) ) ( ON_BOARD ?auto_1895153 ?auto_1895149 ) ( SUPPORTS ?auto_1895153 ?auto_1895148 ) ( POINTING ?auto_1895149 ?auto_1895151 ) ( not ( = ?auto_1895147 ?auto_1895151 ) ) ( HAVE_IMAGE ?auto_1895150 ?auto_1895152 ) ( not ( = ?auto_1895150 ?auto_1895151 ) ) ( not ( = ?auto_1895152 ?auto_1895148 ) ) ( CALIBRATION_TARGET ?auto_1895153 ?auto_1895151 ) ( POWER_AVAIL ?auto_1895149 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_1895153 ?auto_1895149 )
      ( GET-2IMAGE ?auto_1895150 ?auto_1895152 ?auto_1895147 ?auto_1895148 )
      ( GET-1IMAGE-VERIFY ?auto_1895147 ?auto_1895148 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1895155 - DIRECTION
      ?auto_1895156 - MODE
      ?auto_1895157 - DIRECTION
      ?auto_1895154 - MODE
    )
    :vars
    (
      ?auto_1895158 - INSTRUMENT
      ?auto_1895160 - SATELLITE
      ?auto_1895159 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1895157 ?auto_1895155 ) ) ( ON_BOARD ?auto_1895158 ?auto_1895160 ) ( SUPPORTS ?auto_1895158 ?auto_1895154 ) ( POINTING ?auto_1895160 ?auto_1895159 ) ( not ( = ?auto_1895157 ?auto_1895159 ) ) ( HAVE_IMAGE ?auto_1895155 ?auto_1895156 ) ( not ( = ?auto_1895155 ?auto_1895159 ) ) ( not ( = ?auto_1895156 ?auto_1895154 ) ) ( CALIBRATION_TARGET ?auto_1895158 ?auto_1895159 ) ( POWER_AVAIL ?auto_1895160 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1895157 ?auto_1895154 )
      ( GET-2IMAGE-VERIFY ?auto_1895155 ?auto_1895156 ?auto_1895157 ?auto_1895154 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1895162 - DIRECTION
      ?auto_1895163 - MODE
      ?auto_1895164 - DIRECTION
      ?auto_1895161 - MODE
    )
    :vars
    (
      ?auto_1895165 - INSTRUMENT
      ?auto_1895167 - SATELLITE
      ?auto_1895166 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1895164 ?auto_1895162 ) ) ( ON_BOARD ?auto_1895165 ?auto_1895167 ) ( SUPPORTS ?auto_1895165 ?auto_1895163 ) ( POINTING ?auto_1895167 ?auto_1895166 ) ( not ( = ?auto_1895162 ?auto_1895166 ) ) ( HAVE_IMAGE ?auto_1895164 ?auto_1895161 ) ( not ( = ?auto_1895164 ?auto_1895166 ) ) ( not ( = ?auto_1895161 ?auto_1895163 ) ) ( CALIBRATION_TARGET ?auto_1895165 ?auto_1895166 ) ( POWER_AVAIL ?auto_1895167 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1895164 ?auto_1895161 ?auto_1895162 ?auto_1895163 )
      ( GET-2IMAGE-VERIFY ?auto_1895162 ?auto_1895163 ?auto_1895164 ?auto_1895161 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1895814 - DIRECTION
      ?auto_1895815 - MODE
    )
    :vars
    (
      ?auto_1895820 - DIRECTION
      ?auto_1895816 - INSTRUMENT
      ?auto_1895819 - SATELLITE
      ?auto_1895817 - DIRECTION
      ?auto_1895818 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_1895814 ?auto_1895820 ) ) ( ON_BOARD ?auto_1895816 ?auto_1895819 ) ( SUPPORTS ?auto_1895816 ?auto_1895815 ) ( not ( = ?auto_1895814 ?auto_1895817 ) ) ( HAVE_IMAGE ?auto_1895820 ?auto_1895818 ) ( not ( = ?auto_1895820 ?auto_1895817 ) ) ( not ( = ?auto_1895818 ?auto_1895815 ) ) ( CALIBRATION_TARGET ?auto_1895816 ?auto_1895817 ) ( POWER_AVAIL ?auto_1895819 ) ( POINTING ?auto_1895819 ?auto_1895820 ) )
    :subtasks
    ( ( !TURN_TO ?auto_1895819 ?auto_1895817 ?auto_1895820 )
      ( GET-2IMAGE ?auto_1895820 ?auto_1895818 ?auto_1895814 ?auto_1895815 )
      ( GET-1IMAGE-VERIFY ?auto_1895814 ?auto_1895815 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1895822 - DIRECTION
      ?auto_1895823 - MODE
      ?auto_1895824 - DIRECTION
      ?auto_1895821 - MODE
    )
    :vars
    (
      ?auto_1895825 - INSTRUMENT
      ?auto_1895827 - SATELLITE
      ?auto_1895826 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1895824 ?auto_1895822 ) ) ( ON_BOARD ?auto_1895825 ?auto_1895827 ) ( SUPPORTS ?auto_1895825 ?auto_1895821 ) ( not ( = ?auto_1895824 ?auto_1895826 ) ) ( HAVE_IMAGE ?auto_1895822 ?auto_1895823 ) ( not ( = ?auto_1895822 ?auto_1895826 ) ) ( not ( = ?auto_1895823 ?auto_1895821 ) ) ( CALIBRATION_TARGET ?auto_1895825 ?auto_1895826 ) ( POWER_AVAIL ?auto_1895827 ) ( POINTING ?auto_1895827 ?auto_1895822 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1895824 ?auto_1895821 )
      ( GET-2IMAGE-VERIFY ?auto_1895822 ?auto_1895823 ?auto_1895824 ?auto_1895821 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1895829 - DIRECTION
      ?auto_1895830 - MODE
      ?auto_1895831 - DIRECTION
      ?auto_1895828 - MODE
    )
    :vars
    (
      ?auto_1895832 - INSTRUMENT
      ?auto_1895833 - SATELLITE
      ?auto_1895834 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1895831 ?auto_1895829 ) ) ( ON_BOARD ?auto_1895832 ?auto_1895833 ) ( SUPPORTS ?auto_1895832 ?auto_1895830 ) ( not ( = ?auto_1895829 ?auto_1895834 ) ) ( HAVE_IMAGE ?auto_1895831 ?auto_1895828 ) ( not ( = ?auto_1895831 ?auto_1895834 ) ) ( not ( = ?auto_1895828 ?auto_1895830 ) ) ( CALIBRATION_TARGET ?auto_1895832 ?auto_1895834 ) ( POWER_AVAIL ?auto_1895833 ) ( POINTING ?auto_1895833 ?auto_1895831 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1895831 ?auto_1895828 ?auto_1895829 ?auto_1895830 )
      ( GET-2IMAGE-VERIFY ?auto_1895829 ?auto_1895830 ?auto_1895831 ?auto_1895828 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1896481 - DIRECTION
      ?auto_1896482 - MODE
    )
    :vars
    (
      ?auto_1896486 - DIRECTION
      ?auto_1896484 - INSTRUMENT
      ?auto_1896485 - SATELLITE
      ?auto_1896487 - DIRECTION
      ?auto_1896483 - MODE
      ?auto_1896488 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1896481 ?auto_1896486 ) ) ( ON_BOARD ?auto_1896484 ?auto_1896485 ) ( SUPPORTS ?auto_1896484 ?auto_1896482 ) ( not ( = ?auto_1896481 ?auto_1896487 ) ) ( HAVE_IMAGE ?auto_1896486 ?auto_1896483 ) ( not ( = ?auto_1896486 ?auto_1896487 ) ) ( not ( = ?auto_1896483 ?auto_1896482 ) ) ( CALIBRATION_TARGET ?auto_1896484 ?auto_1896487 ) ( POINTING ?auto_1896485 ?auto_1896486 ) ( ON_BOARD ?auto_1896488 ?auto_1896485 ) ( POWER_ON ?auto_1896488 ) ( not ( = ?auto_1896484 ?auto_1896488 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_1896488 ?auto_1896485 )
      ( GET-2IMAGE ?auto_1896486 ?auto_1896483 ?auto_1896481 ?auto_1896482 )
      ( GET-1IMAGE-VERIFY ?auto_1896481 ?auto_1896482 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1896490 - DIRECTION
      ?auto_1896491 - MODE
      ?auto_1896492 - DIRECTION
      ?auto_1896489 - MODE
    )
    :vars
    (
      ?auto_1896494 - INSTRUMENT
      ?auto_1896496 - SATELLITE
      ?auto_1896495 - DIRECTION
      ?auto_1896493 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1896492 ?auto_1896490 ) ) ( ON_BOARD ?auto_1896494 ?auto_1896496 ) ( SUPPORTS ?auto_1896494 ?auto_1896489 ) ( not ( = ?auto_1896492 ?auto_1896495 ) ) ( HAVE_IMAGE ?auto_1896490 ?auto_1896491 ) ( not ( = ?auto_1896490 ?auto_1896495 ) ) ( not ( = ?auto_1896491 ?auto_1896489 ) ) ( CALIBRATION_TARGET ?auto_1896494 ?auto_1896495 ) ( POINTING ?auto_1896496 ?auto_1896490 ) ( ON_BOARD ?auto_1896493 ?auto_1896496 ) ( POWER_ON ?auto_1896493 ) ( not ( = ?auto_1896494 ?auto_1896493 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1896492 ?auto_1896489 )
      ( GET-2IMAGE-VERIFY ?auto_1896490 ?auto_1896491 ?auto_1896492 ?auto_1896489 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1896498 - DIRECTION
      ?auto_1896499 - MODE
      ?auto_1896500 - DIRECTION
      ?auto_1896497 - MODE
    )
    :vars
    (
      ?auto_1896504 - INSTRUMENT
      ?auto_1896501 - SATELLITE
      ?auto_1896503 - DIRECTION
      ?auto_1896502 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1896500 ?auto_1896498 ) ) ( ON_BOARD ?auto_1896504 ?auto_1896501 ) ( SUPPORTS ?auto_1896504 ?auto_1896499 ) ( not ( = ?auto_1896498 ?auto_1896503 ) ) ( HAVE_IMAGE ?auto_1896500 ?auto_1896497 ) ( not ( = ?auto_1896500 ?auto_1896503 ) ) ( not ( = ?auto_1896497 ?auto_1896499 ) ) ( CALIBRATION_TARGET ?auto_1896504 ?auto_1896503 ) ( POINTING ?auto_1896501 ?auto_1896500 ) ( ON_BOARD ?auto_1896502 ?auto_1896501 ) ( POWER_ON ?auto_1896502 ) ( not ( = ?auto_1896504 ?auto_1896502 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1896500 ?auto_1896497 ?auto_1896498 ?auto_1896499 )
      ( GET-2IMAGE-VERIFY ?auto_1896498 ?auto_1896499 ?auto_1896500 ?auto_1896497 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1897205 - DIRECTION
      ?auto_1897206 - MODE
    )
    :vars
    (
      ?auto_1897210 - DIRECTION
      ?auto_1897212 - INSTRUMENT
      ?auto_1897208 - SATELLITE
      ?auto_1897211 - DIRECTION
      ?auto_1897207 - MODE
      ?auto_1897209 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1897205 ?auto_1897210 ) ) ( ON_BOARD ?auto_1897212 ?auto_1897208 ) ( SUPPORTS ?auto_1897212 ?auto_1897206 ) ( not ( = ?auto_1897205 ?auto_1897211 ) ) ( not ( = ?auto_1897210 ?auto_1897211 ) ) ( not ( = ?auto_1897207 ?auto_1897206 ) ) ( CALIBRATION_TARGET ?auto_1897212 ?auto_1897211 ) ( POINTING ?auto_1897208 ?auto_1897210 ) ( ON_BOARD ?auto_1897209 ?auto_1897208 ) ( POWER_ON ?auto_1897209 ) ( not ( = ?auto_1897212 ?auto_1897209 ) ) ( CALIBRATED ?auto_1897209 ) ( SUPPORTS ?auto_1897209 ?auto_1897207 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1897210 ?auto_1897207 )
      ( GET-2IMAGE ?auto_1897210 ?auto_1897207 ?auto_1897205 ?auto_1897206 )
      ( GET-1IMAGE-VERIFY ?auto_1897205 ?auto_1897206 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1897214 - DIRECTION
      ?auto_1897215 - MODE
      ?auto_1897216 - DIRECTION
      ?auto_1897213 - MODE
    )
    :vars
    (
      ?auto_1897218 - INSTRUMENT
      ?auto_1897219 - SATELLITE
      ?auto_1897220 - DIRECTION
      ?auto_1897217 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1897216 ?auto_1897214 ) ) ( ON_BOARD ?auto_1897218 ?auto_1897219 ) ( SUPPORTS ?auto_1897218 ?auto_1897213 ) ( not ( = ?auto_1897216 ?auto_1897220 ) ) ( not ( = ?auto_1897214 ?auto_1897220 ) ) ( not ( = ?auto_1897215 ?auto_1897213 ) ) ( CALIBRATION_TARGET ?auto_1897218 ?auto_1897220 ) ( POINTING ?auto_1897219 ?auto_1897214 ) ( ON_BOARD ?auto_1897217 ?auto_1897219 ) ( POWER_ON ?auto_1897217 ) ( not ( = ?auto_1897218 ?auto_1897217 ) ) ( CALIBRATED ?auto_1897217 ) ( SUPPORTS ?auto_1897217 ?auto_1897215 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1897216 ?auto_1897213 )
      ( GET-2IMAGE-VERIFY ?auto_1897214 ?auto_1897215 ?auto_1897216 ?auto_1897213 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1897222 - DIRECTION
      ?auto_1897223 - MODE
      ?auto_1897224 - DIRECTION
      ?auto_1897221 - MODE
    )
    :vars
    (
      ?auto_1897228 - INSTRUMENT
      ?auto_1897225 - SATELLITE
      ?auto_1897227 - DIRECTION
      ?auto_1897226 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1897224 ?auto_1897222 ) ) ( ON_BOARD ?auto_1897228 ?auto_1897225 ) ( SUPPORTS ?auto_1897228 ?auto_1897223 ) ( not ( = ?auto_1897222 ?auto_1897227 ) ) ( not ( = ?auto_1897224 ?auto_1897227 ) ) ( not ( = ?auto_1897221 ?auto_1897223 ) ) ( CALIBRATION_TARGET ?auto_1897228 ?auto_1897227 ) ( POINTING ?auto_1897225 ?auto_1897224 ) ( ON_BOARD ?auto_1897226 ?auto_1897225 ) ( POWER_ON ?auto_1897226 ) ( not ( = ?auto_1897228 ?auto_1897226 ) ) ( CALIBRATED ?auto_1897226 ) ( SUPPORTS ?auto_1897226 ?auto_1897221 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1897224 ?auto_1897221 ?auto_1897222 ?auto_1897223 )
      ( GET-2IMAGE-VERIFY ?auto_1897222 ?auto_1897223 ?auto_1897224 ?auto_1897221 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1897929 - DIRECTION
      ?auto_1897930 - MODE
    )
    :vars
    (
      ?auto_1897935 - DIRECTION
      ?auto_1897934 - INSTRUMENT
      ?auto_1897931 - SATELLITE
      ?auto_1897933 - DIRECTION
      ?auto_1897936 - MODE
      ?auto_1897932 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1897929 ?auto_1897935 ) ) ( ON_BOARD ?auto_1897934 ?auto_1897931 ) ( SUPPORTS ?auto_1897934 ?auto_1897930 ) ( not ( = ?auto_1897929 ?auto_1897933 ) ) ( not ( = ?auto_1897935 ?auto_1897933 ) ) ( not ( = ?auto_1897936 ?auto_1897930 ) ) ( CALIBRATION_TARGET ?auto_1897934 ?auto_1897933 ) ( ON_BOARD ?auto_1897932 ?auto_1897931 ) ( POWER_ON ?auto_1897932 ) ( not ( = ?auto_1897934 ?auto_1897932 ) ) ( CALIBRATED ?auto_1897932 ) ( SUPPORTS ?auto_1897932 ?auto_1897936 ) ( POINTING ?auto_1897931 ?auto_1897933 ) )
    :subtasks
    ( ( !TURN_TO ?auto_1897931 ?auto_1897935 ?auto_1897933 )
      ( GET-2IMAGE ?auto_1897935 ?auto_1897936 ?auto_1897929 ?auto_1897930 )
      ( GET-1IMAGE-VERIFY ?auto_1897929 ?auto_1897930 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1897938 - DIRECTION
      ?auto_1897939 - MODE
      ?auto_1897940 - DIRECTION
      ?auto_1897937 - MODE
    )
    :vars
    (
      ?auto_1897941 - INSTRUMENT
      ?auto_1897942 - SATELLITE
      ?auto_1897944 - DIRECTION
      ?auto_1897943 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1897940 ?auto_1897938 ) ) ( ON_BOARD ?auto_1897941 ?auto_1897942 ) ( SUPPORTS ?auto_1897941 ?auto_1897937 ) ( not ( = ?auto_1897940 ?auto_1897944 ) ) ( not ( = ?auto_1897938 ?auto_1897944 ) ) ( not ( = ?auto_1897939 ?auto_1897937 ) ) ( CALIBRATION_TARGET ?auto_1897941 ?auto_1897944 ) ( ON_BOARD ?auto_1897943 ?auto_1897942 ) ( POWER_ON ?auto_1897943 ) ( not ( = ?auto_1897941 ?auto_1897943 ) ) ( CALIBRATED ?auto_1897943 ) ( SUPPORTS ?auto_1897943 ?auto_1897939 ) ( POINTING ?auto_1897942 ?auto_1897944 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1897940 ?auto_1897937 )
      ( GET-2IMAGE-VERIFY ?auto_1897938 ?auto_1897939 ?auto_1897940 ?auto_1897937 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1897946 - DIRECTION
      ?auto_1897947 - MODE
      ?auto_1897948 - DIRECTION
      ?auto_1897945 - MODE
    )
    :vars
    (
      ?auto_1897949 - INSTRUMENT
      ?auto_1897950 - SATELLITE
      ?auto_1897951 - DIRECTION
      ?auto_1897952 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1897948 ?auto_1897946 ) ) ( ON_BOARD ?auto_1897949 ?auto_1897950 ) ( SUPPORTS ?auto_1897949 ?auto_1897947 ) ( not ( = ?auto_1897946 ?auto_1897951 ) ) ( not ( = ?auto_1897948 ?auto_1897951 ) ) ( not ( = ?auto_1897945 ?auto_1897947 ) ) ( CALIBRATION_TARGET ?auto_1897949 ?auto_1897951 ) ( ON_BOARD ?auto_1897952 ?auto_1897950 ) ( POWER_ON ?auto_1897952 ) ( not ( = ?auto_1897949 ?auto_1897952 ) ) ( CALIBRATED ?auto_1897952 ) ( SUPPORTS ?auto_1897952 ?auto_1897945 ) ( POINTING ?auto_1897950 ?auto_1897951 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1897948 ?auto_1897945 ?auto_1897946 ?auto_1897947 )
      ( GET-2IMAGE-VERIFY ?auto_1897946 ?auto_1897947 ?auto_1897948 ?auto_1897945 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1898653 - DIRECTION
      ?auto_1898654 - MODE
    )
    :vars
    (
      ?auto_1898660 - DIRECTION
      ?auto_1898656 - INSTRUMENT
      ?auto_1898657 - SATELLITE
      ?auto_1898658 - DIRECTION
      ?auto_1898655 - MODE
      ?auto_1898659 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1898653 ?auto_1898660 ) ) ( ON_BOARD ?auto_1898656 ?auto_1898657 ) ( SUPPORTS ?auto_1898656 ?auto_1898654 ) ( not ( = ?auto_1898653 ?auto_1898658 ) ) ( not ( = ?auto_1898660 ?auto_1898658 ) ) ( not ( = ?auto_1898655 ?auto_1898654 ) ) ( CALIBRATION_TARGET ?auto_1898656 ?auto_1898658 ) ( ON_BOARD ?auto_1898659 ?auto_1898657 ) ( POWER_ON ?auto_1898659 ) ( not ( = ?auto_1898656 ?auto_1898659 ) ) ( SUPPORTS ?auto_1898659 ?auto_1898655 ) ( POINTING ?auto_1898657 ?auto_1898658 ) ( CALIBRATION_TARGET ?auto_1898659 ?auto_1898658 ) ( NOT_CALIBRATED ?auto_1898659 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_1898657 ?auto_1898659 ?auto_1898658 )
      ( GET-2IMAGE ?auto_1898660 ?auto_1898655 ?auto_1898653 ?auto_1898654 )
      ( GET-1IMAGE-VERIFY ?auto_1898653 ?auto_1898654 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1898662 - DIRECTION
      ?auto_1898663 - MODE
      ?auto_1898664 - DIRECTION
      ?auto_1898661 - MODE
    )
    :vars
    (
      ?auto_1898667 - INSTRUMENT
      ?auto_1898666 - SATELLITE
      ?auto_1898668 - DIRECTION
      ?auto_1898665 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1898664 ?auto_1898662 ) ) ( ON_BOARD ?auto_1898667 ?auto_1898666 ) ( SUPPORTS ?auto_1898667 ?auto_1898661 ) ( not ( = ?auto_1898664 ?auto_1898668 ) ) ( not ( = ?auto_1898662 ?auto_1898668 ) ) ( not ( = ?auto_1898663 ?auto_1898661 ) ) ( CALIBRATION_TARGET ?auto_1898667 ?auto_1898668 ) ( ON_BOARD ?auto_1898665 ?auto_1898666 ) ( POWER_ON ?auto_1898665 ) ( not ( = ?auto_1898667 ?auto_1898665 ) ) ( SUPPORTS ?auto_1898665 ?auto_1898663 ) ( POINTING ?auto_1898666 ?auto_1898668 ) ( CALIBRATION_TARGET ?auto_1898665 ?auto_1898668 ) ( NOT_CALIBRATED ?auto_1898665 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1898664 ?auto_1898661 )
      ( GET-2IMAGE-VERIFY ?auto_1898662 ?auto_1898663 ?auto_1898664 ?auto_1898661 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1898670 - DIRECTION
      ?auto_1898671 - MODE
      ?auto_1898672 - DIRECTION
      ?auto_1898669 - MODE
    )
    :vars
    (
      ?auto_1898676 - INSTRUMENT
      ?auto_1898675 - SATELLITE
      ?auto_1898674 - DIRECTION
      ?auto_1898673 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1898672 ?auto_1898670 ) ) ( ON_BOARD ?auto_1898676 ?auto_1898675 ) ( SUPPORTS ?auto_1898676 ?auto_1898671 ) ( not ( = ?auto_1898670 ?auto_1898674 ) ) ( not ( = ?auto_1898672 ?auto_1898674 ) ) ( not ( = ?auto_1898669 ?auto_1898671 ) ) ( CALIBRATION_TARGET ?auto_1898676 ?auto_1898674 ) ( ON_BOARD ?auto_1898673 ?auto_1898675 ) ( POWER_ON ?auto_1898673 ) ( not ( = ?auto_1898676 ?auto_1898673 ) ) ( SUPPORTS ?auto_1898673 ?auto_1898669 ) ( POINTING ?auto_1898675 ?auto_1898674 ) ( CALIBRATION_TARGET ?auto_1898673 ?auto_1898674 ) ( NOT_CALIBRATED ?auto_1898673 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1898672 ?auto_1898669 ?auto_1898670 ?auto_1898671 )
      ( GET-2IMAGE-VERIFY ?auto_1898670 ?auto_1898671 ?auto_1898672 ?auto_1898669 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1903546 - DIRECTION
      ?auto_1903547 - MODE
      ?auto_1903548 - DIRECTION
      ?auto_1903545 - MODE
      ?auto_1903550 - DIRECTION
      ?auto_1903549 - MODE
    )
    :vars
    (
      ?auto_1903552 - INSTRUMENT
      ?auto_1903551 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_1903548 ?auto_1903546 ) ) ( not ( = ?auto_1903550 ?auto_1903546 ) ) ( not ( = ?auto_1903550 ?auto_1903548 ) ) ( CALIBRATED ?auto_1903552 ) ( ON_BOARD ?auto_1903552 ?auto_1903551 ) ( SUPPORTS ?auto_1903552 ?auto_1903549 ) ( POWER_ON ?auto_1903552 ) ( POINTING ?auto_1903551 ?auto_1903550 ) ( HAVE_IMAGE ?auto_1903546 ?auto_1903547 ) ( HAVE_IMAGE ?auto_1903548 ?auto_1903545 ) ( not ( = ?auto_1903547 ?auto_1903545 ) ) ( not ( = ?auto_1903547 ?auto_1903549 ) ) ( not ( = ?auto_1903545 ?auto_1903549 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1903550 ?auto_1903549 )
      ( GET-3IMAGE-VERIFY ?auto_1903546 ?auto_1903547 ?auto_1903548 ?auto_1903545 ?auto_1903550 ?auto_1903549 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1903562 - DIRECTION
      ?auto_1903563 - MODE
      ?auto_1903564 - DIRECTION
      ?auto_1903561 - MODE
      ?auto_1903566 - DIRECTION
      ?auto_1903565 - MODE
    )
    :vars
    (
      ?auto_1903568 - INSTRUMENT
      ?auto_1903567 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_1903564 ?auto_1903562 ) ) ( not ( = ?auto_1903566 ?auto_1903562 ) ) ( not ( = ?auto_1903566 ?auto_1903564 ) ) ( CALIBRATED ?auto_1903568 ) ( ON_BOARD ?auto_1903568 ?auto_1903567 ) ( SUPPORTS ?auto_1903568 ?auto_1903561 ) ( POWER_ON ?auto_1903568 ) ( POINTING ?auto_1903567 ?auto_1903564 ) ( HAVE_IMAGE ?auto_1903562 ?auto_1903563 ) ( HAVE_IMAGE ?auto_1903566 ?auto_1903565 ) ( not ( = ?auto_1903563 ?auto_1903561 ) ) ( not ( = ?auto_1903563 ?auto_1903565 ) ) ( not ( = ?auto_1903561 ?auto_1903565 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1903564 ?auto_1903561 )
      ( GET-3IMAGE-VERIFY ?auto_1903562 ?auto_1903563 ?auto_1903564 ?auto_1903561 ?auto_1903566 ?auto_1903565 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1903622 - DIRECTION
      ?auto_1903623 - MODE
      ?auto_1903624 - DIRECTION
      ?auto_1903621 - MODE
      ?auto_1903626 - DIRECTION
      ?auto_1903625 - MODE
    )
    :vars
    (
      ?auto_1903628 - INSTRUMENT
      ?auto_1903627 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_1903624 ?auto_1903622 ) ) ( not ( = ?auto_1903626 ?auto_1903622 ) ) ( not ( = ?auto_1903626 ?auto_1903624 ) ) ( CALIBRATED ?auto_1903628 ) ( ON_BOARD ?auto_1903628 ?auto_1903627 ) ( SUPPORTS ?auto_1903628 ?auto_1903623 ) ( POWER_ON ?auto_1903628 ) ( POINTING ?auto_1903627 ?auto_1903622 ) ( HAVE_IMAGE ?auto_1903624 ?auto_1903621 ) ( HAVE_IMAGE ?auto_1903626 ?auto_1903625 ) ( not ( = ?auto_1903623 ?auto_1903621 ) ) ( not ( = ?auto_1903623 ?auto_1903625 ) ) ( not ( = ?auto_1903621 ?auto_1903625 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1903622 ?auto_1903623 )
      ( GET-3IMAGE-VERIFY ?auto_1903622 ?auto_1903623 ?auto_1903624 ?auto_1903621 ?auto_1903626 ?auto_1903625 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1906911 - DIRECTION
      ?auto_1906912 - MODE
      ?auto_1906913 - DIRECTION
      ?auto_1906910 - MODE
      ?auto_1906915 - DIRECTION
      ?auto_1906914 - MODE
    )
    :vars
    (
      ?auto_1906916 - INSTRUMENT
      ?auto_1906918 - SATELLITE
      ?auto_1906917 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1906913 ?auto_1906911 ) ) ( not ( = ?auto_1906915 ?auto_1906911 ) ) ( not ( = ?auto_1906915 ?auto_1906913 ) ) ( CALIBRATED ?auto_1906916 ) ( ON_BOARD ?auto_1906916 ?auto_1906918 ) ( SUPPORTS ?auto_1906916 ?auto_1906914 ) ( POWER_ON ?auto_1906916 ) ( POINTING ?auto_1906918 ?auto_1906917 ) ( not ( = ?auto_1906915 ?auto_1906917 ) ) ( HAVE_IMAGE ?auto_1906911 ?auto_1906912 ) ( not ( = ?auto_1906911 ?auto_1906917 ) ) ( not ( = ?auto_1906912 ?auto_1906914 ) ) ( HAVE_IMAGE ?auto_1906913 ?auto_1906910 ) ( not ( = ?auto_1906912 ?auto_1906910 ) ) ( not ( = ?auto_1906913 ?auto_1906917 ) ) ( not ( = ?auto_1906910 ?auto_1906914 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1906911 ?auto_1906912 ?auto_1906915 ?auto_1906914 )
      ( GET-3IMAGE-VERIFY ?auto_1906911 ?auto_1906912 ?auto_1906913 ?auto_1906910 ?auto_1906915 ?auto_1906914 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1906929 - DIRECTION
      ?auto_1906930 - MODE
      ?auto_1906931 - DIRECTION
      ?auto_1906928 - MODE
      ?auto_1906933 - DIRECTION
      ?auto_1906932 - MODE
    )
    :vars
    (
      ?auto_1906934 - INSTRUMENT
      ?auto_1906936 - SATELLITE
      ?auto_1906935 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1906931 ?auto_1906929 ) ) ( not ( = ?auto_1906933 ?auto_1906929 ) ) ( not ( = ?auto_1906933 ?auto_1906931 ) ) ( CALIBRATED ?auto_1906934 ) ( ON_BOARD ?auto_1906934 ?auto_1906936 ) ( SUPPORTS ?auto_1906934 ?auto_1906928 ) ( POWER_ON ?auto_1906934 ) ( POINTING ?auto_1906936 ?auto_1906935 ) ( not ( = ?auto_1906931 ?auto_1906935 ) ) ( HAVE_IMAGE ?auto_1906929 ?auto_1906930 ) ( not ( = ?auto_1906929 ?auto_1906935 ) ) ( not ( = ?auto_1906930 ?auto_1906928 ) ) ( HAVE_IMAGE ?auto_1906933 ?auto_1906932 ) ( not ( = ?auto_1906930 ?auto_1906932 ) ) ( not ( = ?auto_1906928 ?auto_1906932 ) ) ( not ( = ?auto_1906933 ?auto_1906935 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1906929 ?auto_1906930 ?auto_1906931 ?auto_1906928 )
      ( GET-3IMAGE-VERIFY ?auto_1906929 ?auto_1906930 ?auto_1906931 ?auto_1906928 ?auto_1906933 ?auto_1906932 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1907001 - DIRECTION
      ?auto_1907002 - MODE
      ?auto_1907003 - DIRECTION
      ?auto_1907000 - MODE
      ?auto_1907005 - DIRECTION
      ?auto_1907004 - MODE
    )
    :vars
    (
      ?auto_1907006 - INSTRUMENT
      ?auto_1907008 - SATELLITE
      ?auto_1907007 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1907003 ?auto_1907001 ) ) ( not ( = ?auto_1907005 ?auto_1907001 ) ) ( not ( = ?auto_1907005 ?auto_1907003 ) ) ( CALIBRATED ?auto_1907006 ) ( ON_BOARD ?auto_1907006 ?auto_1907008 ) ( SUPPORTS ?auto_1907006 ?auto_1907002 ) ( POWER_ON ?auto_1907006 ) ( POINTING ?auto_1907008 ?auto_1907007 ) ( not ( = ?auto_1907001 ?auto_1907007 ) ) ( HAVE_IMAGE ?auto_1907003 ?auto_1907000 ) ( not ( = ?auto_1907003 ?auto_1907007 ) ) ( not ( = ?auto_1907000 ?auto_1907002 ) ) ( HAVE_IMAGE ?auto_1907005 ?auto_1907004 ) ( not ( = ?auto_1907002 ?auto_1907004 ) ) ( not ( = ?auto_1907000 ?auto_1907004 ) ) ( not ( = ?auto_1907005 ?auto_1907007 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1907003 ?auto_1907000 ?auto_1907001 ?auto_1907002 )
      ( GET-3IMAGE-VERIFY ?auto_1907001 ?auto_1907002 ?auto_1907003 ?auto_1907000 ?auto_1907005 ?auto_1907004 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1910675 - DIRECTION
      ?auto_1910676 - MODE
      ?auto_1910677 - DIRECTION
      ?auto_1910674 - MODE
      ?auto_1910679 - DIRECTION
      ?auto_1910678 - MODE
    )
    :vars
    (
      ?auto_1910682 - INSTRUMENT
      ?auto_1910680 - SATELLITE
      ?auto_1910681 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1910677 ?auto_1910675 ) ) ( not ( = ?auto_1910679 ?auto_1910675 ) ) ( not ( = ?auto_1910679 ?auto_1910677 ) ) ( ON_BOARD ?auto_1910682 ?auto_1910680 ) ( SUPPORTS ?auto_1910682 ?auto_1910678 ) ( POWER_ON ?auto_1910682 ) ( POINTING ?auto_1910680 ?auto_1910681 ) ( not ( = ?auto_1910679 ?auto_1910681 ) ) ( HAVE_IMAGE ?auto_1910675 ?auto_1910676 ) ( not ( = ?auto_1910675 ?auto_1910681 ) ) ( not ( = ?auto_1910676 ?auto_1910678 ) ) ( CALIBRATION_TARGET ?auto_1910682 ?auto_1910681 ) ( NOT_CALIBRATED ?auto_1910682 ) ( HAVE_IMAGE ?auto_1910677 ?auto_1910674 ) ( not ( = ?auto_1910676 ?auto_1910674 ) ) ( not ( = ?auto_1910677 ?auto_1910681 ) ) ( not ( = ?auto_1910674 ?auto_1910678 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1910675 ?auto_1910676 ?auto_1910679 ?auto_1910678 )
      ( GET-3IMAGE-VERIFY ?auto_1910675 ?auto_1910676 ?auto_1910677 ?auto_1910674 ?auto_1910679 ?auto_1910678 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1910693 - DIRECTION
      ?auto_1910694 - MODE
      ?auto_1910695 - DIRECTION
      ?auto_1910692 - MODE
      ?auto_1910697 - DIRECTION
      ?auto_1910696 - MODE
    )
    :vars
    (
      ?auto_1910700 - INSTRUMENT
      ?auto_1910698 - SATELLITE
      ?auto_1910699 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1910695 ?auto_1910693 ) ) ( not ( = ?auto_1910697 ?auto_1910693 ) ) ( not ( = ?auto_1910697 ?auto_1910695 ) ) ( ON_BOARD ?auto_1910700 ?auto_1910698 ) ( SUPPORTS ?auto_1910700 ?auto_1910692 ) ( POWER_ON ?auto_1910700 ) ( POINTING ?auto_1910698 ?auto_1910699 ) ( not ( = ?auto_1910695 ?auto_1910699 ) ) ( HAVE_IMAGE ?auto_1910693 ?auto_1910694 ) ( not ( = ?auto_1910693 ?auto_1910699 ) ) ( not ( = ?auto_1910694 ?auto_1910692 ) ) ( CALIBRATION_TARGET ?auto_1910700 ?auto_1910699 ) ( NOT_CALIBRATED ?auto_1910700 ) ( HAVE_IMAGE ?auto_1910697 ?auto_1910696 ) ( not ( = ?auto_1910694 ?auto_1910696 ) ) ( not ( = ?auto_1910692 ?auto_1910696 ) ) ( not ( = ?auto_1910697 ?auto_1910699 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1910693 ?auto_1910694 ?auto_1910695 ?auto_1910692 )
      ( GET-3IMAGE-VERIFY ?auto_1910693 ?auto_1910694 ?auto_1910695 ?auto_1910692 ?auto_1910697 ?auto_1910696 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1910765 - DIRECTION
      ?auto_1910766 - MODE
      ?auto_1910767 - DIRECTION
      ?auto_1910764 - MODE
      ?auto_1910769 - DIRECTION
      ?auto_1910768 - MODE
    )
    :vars
    (
      ?auto_1910772 - INSTRUMENT
      ?auto_1910770 - SATELLITE
      ?auto_1910771 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1910767 ?auto_1910765 ) ) ( not ( = ?auto_1910769 ?auto_1910765 ) ) ( not ( = ?auto_1910769 ?auto_1910767 ) ) ( ON_BOARD ?auto_1910772 ?auto_1910770 ) ( SUPPORTS ?auto_1910772 ?auto_1910766 ) ( POWER_ON ?auto_1910772 ) ( POINTING ?auto_1910770 ?auto_1910771 ) ( not ( = ?auto_1910765 ?auto_1910771 ) ) ( HAVE_IMAGE ?auto_1910767 ?auto_1910764 ) ( not ( = ?auto_1910767 ?auto_1910771 ) ) ( not ( = ?auto_1910764 ?auto_1910766 ) ) ( CALIBRATION_TARGET ?auto_1910772 ?auto_1910771 ) ( NOT_CALIBRATED ?auto_1910772 ) ( HAVE_IMAGE ?auto_1910769 ?auto_1910768 ) ( not ( = ?auto_1910766 ?auto_1910768 ) ) ( not ( = ?auto_1910764 ?auto_1910768 ) ) ( not ( = ?auto_1910769 ?auto_1910771 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1910767 ?auto_1910764 ?auto_1910765 ?auto_1910766 )
      ( GET-3IMAGE-VERIFY ?auto_1910765 ?auto_1910766 ?auto_1910767 ?auto_1910764 ?auto_1910769 ?auto_1910768 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1914439 - DIRECTION
      ?auto_1914440 - MODE
      ?auto_1914441 - DIRECTION
      ?auto_1914438 - MODE
      ?auto_1914443 - DIRECTION
      ?auto_1914442 - MODE
    )
    :vars
    (
      ?auto_1914444 - INSTRUMENT
      ?auto_1914445 - SATELLITE
      ?auto_1914446 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1914441 ?auto_1914439 ) ) ( not ( = ?auto_1914443 ?auto_1914439 ) ) ( not ( = ?auto_1914443 ?auto_1914441 ) ) ( ON_BOARD ?auto_1914444 ?auto_1914445 ) ( SUPPORTS ?auto_1914444 ?auto_1914442 ) ( POINTING ?auto_1914445 ?auto_1914446 ) ( not ( = ?auto_1914443 ?auto_1914446 ) ) ( HAVE_IMAGE ?auto_1914439 ?auto_1914440 ) ( not ( = ?auto_1914439 ?auto_1914446 ) ) ( not ( = ?auto_1914440 ?auto_1914442 ) ) ( CALIBRATION_TARGET ?auto_1914444 ?auto_1914446 ) ( POWER_AVAIL ?auto_1914445 ) ( HAVE_IMAGE ?auto_1914441 ?auto_1914438 ) ( not ( = ?auto_1914440 ?auto_1914438 ) ) ( not ( = ?auto_1914441 ?auto_1914446 ) ) ( not ( = ?auto_1914438 ?auto_1914442 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1914439 ?auto_1914440 ?auto_1914443 ?auto_1914442 )
      ( GET-3IMAGE-VERIFY ?auto_1914439 ?auto_1914440 ?auto_1914441 ?auto_1914438 ?auto_1914443 ?auto_1914442 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1914457 - DIRECTION
      ?auto_1914458 - MODE
      ?auto_1914459 - DIRECTION
      ?auto_1914456 - MODE
      ?auto_1914461 - DIRECTION
      ?auto_1914460 - MODE
    )
    :vars
    (
      ?auto_1914462 - INSTRUMENT
      ?auto_1914463 - SATELLITE
      ?auto_1914464 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1914459 ?auto_1914457 ) ) ( not ( = ?auto_1914461 ?auto_1914457 ) ) ( not ( = ?auto_1914461 ?auto_1914459 ) ) ( ON_BOARD ?auto_1914462 ?auto_1914463 ) ( SUPPORTS ?auto_1914462 ?auto_1914456 ) ( POINTING ?auto_1914463 ?auto_1914464 ) ( not ( = ?auto_1914459 ?auto_1914464 ) ) ( HAVE_IMAGE ?auto_1914457 ?auto_1914458 ) ( not ( = ?auto_1914457 ?auto_1914464 ) ) ( not ( = ?auto_1914458 ?auto_1914456 ) ) ( CALIBRATION_TARGET ?auto_1914462 ?auto_1914464 ) ( POWER_AVAIL ?auto_1914463 ) ( HAVE_IMAGE ?auto_1914461 ?auto_1914460 ) ( not ( = ?auto_1914458 ?auto_1914460 ) ) ( not ( = ?auto_1914456 ?auto_1914460 ) ) ( not ( = ?auto_1914461 ?auto_1914464 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1914457 ?auto_1914458 ?auto_1914459 ?auto_1914456 )
      ( GET-3IMAGE-VERIFY ?auto_1914457 ?auto_1914458 ?auto_1914459 ?auto_1914456 ?auto_1914461 ?auto_1914460 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1914529 - DIRECTION
      ?auto_1914530 - MODE
      ?auto_1914531 - DIRECTION
      ?auto_1914528 - MODE
      ?auto_1914533 - DIRECTION
      ?auto_1914532 - MODE
    )
    :vars
    (
      ?auto_1914534 - INSTRUMENT
      ?auto_1914535 - SATELLITE
      ?auto_1914536 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1914531 ?auto_1914529 ) ) ( not ( = ?auto_1914533 ?auto_1914529 ) ) ( not ( = ?auto_1914533 ?auto_1914531 ) ) ( ON_BOARD ?auto_1914534 ?auto_1914535 ) ( SUPPORTS ?auto_1914534 ?auto_1914530 ) ( POINTING ?auto_1914535 ?auto_1914536 ) ( not ( = ?auto_1914529 ?auto_1914536 ) ) ( HAVE_IMAGE ?auto_1914531 ?auto_1914528 ) ( not ( = ?auto_1914531 ?auto_1914536 ) ) ( not ( = ?auto_1914528 ?auto_1914530 ) ) ( CALIBRATION_TARGET ?auto_1914534 ?auto_1914536 ) ( POWER_AVAIL ?auto_1914535 ) ( HAVE_IMAGE ?auto_1914533 ?auto_1914532 ) ( not ( = ?auto_1914530 ?auto_1914532 ) ) ( not ( = ?auto_1914528 ?auto_1914532 ) ) ( not ( = ?auto_1914533 ?auto_1914536 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1914531 ?auto_1914528 ?auto_1914529 ?auto_1914530 )
      ( GET-3IMAGE-VERIFY ?auto_1914529 ?auto_1914530 ?auto_1914531 ?auto_1914528 ?auto_1914533 ?auto_1914532 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1918155 - DIRECTION
      ?auto_1918156 - MODE
    )
    :vars
    (
      ?auto_1918161 - DIRECTION
      ?auto_1918157 - INSTRUMENT
      ?auto_1918159 - SATELLITE
      ?auto_1918160 - DIRECTION
      ?auto_1918158 - MODE
      ?auto_1918162 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1918155 ?auto_1918161 ) ) ( ON_BOARD ?auto_1918157 ?auto_1918159 ) ( SUPPORTS ?auto_1918157 ?auto_1918156 ) ( not ( = ?auto_1918155 ?auto_1918160 ) ) ( HAVE_IMAGE ?auto_1918161 ?auto_1918158 ) ( not ( = ?auto_1918161 ?auto_1918160 ) ) ( not ( = ?auto_1918158 ?auto_1918156 ) ) ( CALIBRATION_TARGET ?auto_1918157 ?auto_1918160 ) ( POWER_AVAIL ?auto_1918159 ) ( POINTING ?auto_1918159 ?auto_1918162 ) ( not ( = ?auto_1918160 ?auto_1918162 ) ) ( not ( = ?auto_1918155 ?auto_1918162 ) ) ( not ( = ?auto_1918161 ?auto_1918162 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1918159 ?auto_1918160 ?auto_1918162 )
      ( GET-2IMAGE ?auto_1918161 ?auto_1918158 ?auto_1918155 ?auto_1918156 )
      ( GET-1IMAGE-VERIFY ?auto_1918155 ?auto_1918156 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1918164 - DIRECTION
      ?auto_1918165 - MODE
      ?auto_1918166 - DIRECTION
      ?auto_1918163 - MODE
    )
    :vars
    (
      ?auto_1918169 - INSTRUMENT
      ?auto_1918170 - SATELLITE
      ?auto_1918168 - DIRECTION
      ?auto_1918167 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1918166 ?auto_1918164 ) ) ( ON_BOARD ?auto_1918169 ?auto_1918170 ) ( SUPPORTS ?auto_1918169 ?auto_1918163 ) ( not ( = ?auto_1918166 ?auto_1918168 ) ) ( HAVE_IMAGE ?auto_1918164 ?auto_1918165 ) ( not ( = ?auto_1918164 ?auto_1918168 ) ) ( not ( = ?auto_1918165 ?auto_1918163 ) ) ( CALIBRATION_TARGET ?auto_1918169 ?auto_1918168 ) ( POWER_AVAIL ?auto_1918170 ) ( POINTING ?auto_1918170 ?auto_1918167 ) ( not ( = ?auto_1918168 ?auto_1918167 ) ) ( not ( = ?auto_1918166 ?auto_1918167 ) ) ( not ( = ?auto_1918164 ?auto_1918167 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1918166 ?auto_1918163 )
      ( GET-2IMAGE-VERIFY ?auto_1918164 ?auto_1918165 ?auto_1918166 ?auto_1918163 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1918172 - DIRECTION
      ?auto_1918173 - MODE
      ?auto_1918174 - DIRECTION
      ?auto_1918171 - MODE
    )
    :vars
    (
      ?auto_1918179 - DIRECTION
      ?auto_1918178 - INSTRUMENT
      ?auto_1918175 - SATELLITE
      ?auto_1918176 - DIRECTION
      ?auto_1918177 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_1918174 ?auto_1918172 ) ) ( not ( = ?auto_1918174 ?auto_1918179 ) ) ( ON_BOARD ?auto_1918178 ?auto_1918175 ) ( SUPPORTS ?auto_1918178 ?auto_1918171 ) ( not ( = ?auto_1918174 ?auto_1918176 ) ) ( HAVE_IMAGE ?auto_1918179 ?auto_1918177 ) ( not ( = ?auto_1918179 ?auto_1918176 ) ) ( not ( = ?auto_1918177 ?auto_1918171 ) ) ( CALIBRATION_TARGET ?auto_1918178 ?auto_1918176 ) ( POWER_AVAIL ?auto_1918175 ) ( POINTING ?auto_1918175 ?auto_1918172 ) ( not ( = ?auto_1918176 ?auto_1918172 ) ) ( not ( = ?auto_1918179 ?auto_1918172 ) ) ( HAVE_IMAGE ?auto_1918172 ?auto_1918173 ) ( not ( = ?auto_1918173 ?auto_1918171 ) ) ( not ( = ?auto_1918173 ?auto_1918177 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1918179 ?auto_1918177 ?auto_1918174 ?auto_1918171 )
      ( GET-2IMAGE-VERIFY ?auto_1918172 ?auto_1918173 ?auto_1918174 ?auto_1918171 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1918181 - DIRECTION
      ?auto_1918182 - MODE
      ?auto_1918183 - DIRECTION
      ?auto_1918180 - MODE
    )
    :vars
    (
      ?auto_1918187 - INSTRUMENT
      ?auto_1918184 - SATELLITE
      ?auto_1918185 - DIRECTION
      ?auto_1918186 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1918183 ?auto_1918181 ) ) ( ON_BOARD ?auto_1918187 ?auto_1918184 ) ( SUPPORTS ?auto_1918187 ?auto_1918182 ) ( not ( = ?auto_1918181 ?auto_1918185 ) ) ( HAVE_IMAGE ?auto_1918183 ?auto_1918180 ) ( not ( = ?auto_1918183 ?auto_1918185 ) ) ( not ( = ?auto_1918180 ?auto_1918182 ) ) ( CALIBRATION_TARGET ?auto_1918187 ?auto_1918185 ) ( POWER_AVAIL ?auto_1918184 ) ( POINTING ?auto_1918184 ?auto_1918186 ) ( not ( = ?auto_1918185 ?auto_1918186 ) ) ( not ( = ?auto_1918181 ?auto_1918186 ) ) ( not ( = ?auto_1918183 ?auto_1918186 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1918183 ?auto_1918180 ?auto_1918181 ?auto_1918182 )
      ( GET-2IMAGE-VERIFY ?auto_1918181 ?auto_1918182 ?auto_1918183 ?auto_1918180 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1918189 - DIRECTION
      ?auto_1918190 - MODE
      ?auto_1918191 - DIRECTION
      ?auto_1918188 - MODE
    )
    :vars
    (
      ?auto_1918196 - DIRECTION
      ?auto_1918195 - INSTRUMENT
      ?auto_1918192 - SATELLITE
      ?auto_1918193 - DIRECTION
      ?auto_1918194 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_1918191 ?auto_1918189 ) ) ( not ( = ?auto_1918189 ?auto_1918196 ) ) ( ON_BOARD ?auto_1918195 ?auto_1918192 ) ( SUPPORTS ?auto_1918195 ?auto_1918190 ) ( not ( = ?auto_1918189 ?auto_1918193 ) ) ( HAVE_IMAGE ?auto_1918196 ?auto_1918194 ) ( not ( = ?auto_1918196 ?auto_1918193 ) ) ( not ( = ?auto_1918194 ?auto_1918190 ) ) ( CALIBRATION_TARGET ?auto_1918195 ?auto_1918193 ) ( POWER_AVAIL ?auto_1918192 ) ( POINTING ?auto_1918192 ?auto_1918191 ) ( not ( = ?auto_1918193 ?auto_1918191 ) ) ( not ( = ?auto_1918196 ?auto_1918191 ) ) ( HAVE_IMAGE ?auto_1918191 ?auto_1918188 ) ( not ( = ?auto_1918190 ?auto_1918188 ) ) ( not ( = ?auto_1918188 ?auto_1918194 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1918196 ?auto_1918194 ?auto_1918189 ?auto_1918190 )
      ( GET-2IMAGE-VERIFY ?auto_1918189 ?auto_1918190 ?auto_1918191 ?auto_1918188 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1918218 - DIRECTION
      ?auto_1918219 - MODE
      ?auto_1918220 - DIRECTION
      ?auto_1918217 - MODE
      ?auto_1918222 - DIRECTION
      ?auto_1918221 - MODE
    )
    :vars
    (
      ?auto_1918225 - INSTRUMENT
      ?auto_1918223 - SATELLITE
      ?auto_1918224 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1918220 ?auto_1918218 ) ) ( not ( = ?auto_1918222 ?auto_1918218 ) ) ( not ( = ?auto_1918222 ?auto_1918220 ) ) ( ON_BOARD ?auto_1918225 ?auto_1918223 ) ( SUPPORTS ?auto_1918225 ?auto_1918221 ) ( not ( = ?auto_1918222 ?auto_1918224 ) ) ( HAVE_IMAGE ?auto_1918218 ?auto_1918219 ) ( not ( = ?auto_1918218 ?auto_1918224 ) ) ( not ( = ?auto_1918219 ?auto_1918221 ) ) ( CALIBRATION_TARGET ?auto_1918225 ?auto_1918224 ) ( POWER_AVAIL ?auto_1918223 ) ( POINTING ?auto_1918223 ?auto_1918220 ) ( not ( = ?auto_1918224 ?auto_1918220 ) ) ( HAVE_IMAGE ?auto_1918220 ?auto_1918217 ) ( not ( = ?auto_1918219 ?auto_1918217 ) ) ( not ( = ?auto_1918217 ?auto_1918221 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1918218 ?auto_1918219 ?auto_1918222 ?auto_1918221 )
      ( GET-3IMAGE-VERIFY ?auto_1918218 ?auto_1918219 ?auto_1918220 ?auto_1918217 ?auto_1918222 ?auto_1918221 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1918237 - DIRECTION
      ?auto_1918238 - MODE
      ?auto_1918239 - DIRECTION
      ?auto_1918236 - MODE
      ?auto_1918241 - DIRECTION
      ?auto_1918240 - MODE
    )
    :vars
    (
      ?auto_1918244 - INSTRUMENT
      ?auto_1918242 - SATELLITE
      ?auto_1918243 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1918239 ?auto_1918237 ) ) ( not ( = ?auto_1918241 ?auto_1918237 ) ) ( not ( = ?auto_1918241 ?auto_1918239 ) ) ( ON_BOARD ?auto_1918244 ?auto_1918242 ) ( SUPPORTS ?auto_1918244 ?auto_1918236 ) ( not ( = ?auto_1918239 ?auto_1918243 ) ) ( HAVE_IMAGE ?auto_1918237 ?auto_1918238 ) ( not ( = ?auto_1918237 ?auto_1918243 ) ) ( not ( = ?auto_1918238 ?auto_1918236 ) ) ( CALIBRATION_TARGET ?auto_1918244 ?auto_1918243 ) ( POWER_AVAIL ?auto_1918242 ) ( POINTING ?auto_1918242 ?auto_1918241 ) ( not ( = ?auto_1918243 ?auto_1918241 ) ) ( HAVE_IMAGE ?auto_1918241 ?auto_1918240 ) ( not ( = ?auto_1918238 ?auto_1918240 ) ) ( not ( = ?auto_1918236 ?auto_1918240 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1918237 ?auto_1918238 ?auto_1918239 ?auto_1918236 )
      ( GET-3IMAGE-VERIFY ?auto_1918237 ?auto_1918238 ?auto_1918239 ?auto_1918236 ?auto_1918241 ?auto_1918240 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1918256 - DIRECTION
      ?auto_1918257 - MODE
      ?auto_1918258 - DIRECTION
      ?auto_1918255 - MODE
      ?auto_1918260 - DIRECTION
      ?auto_1918259 - MODE
    )
    :vars
    (
      ?auto_1918263 - INSTRUMENT
      ?auto_1918261 - SATELLITE
      ?auto_1918262 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1918258 ?auto_1918256 ) ) ( not ( = ?auto_1918260 ?auto_1918256 ) ) ( not ( = ?auto_1918260 ?auto_1918258 ) ) ( ON_BOARD ?auto_1918263 ?auto_1918261 ) ( SUPPORTS ?auto_1918263 ?auto_1918259 ) ( not ( = ?auto_1918260 ?auto_1918262 ) ) ( HAVE_IMAGE ?auto_1918258 ?auto_1918255 ) ( not ( = ?auto_1918258 ?auto_1918262 ) ) ( not ( = ?auto_1918255 ?auto_1918259 ) ) ( CALIBRATION_TARGET ?auto_1918263 ?auto_1918262 ) ( POWER_AVAIL ?auto_1918261 ) ( POINTING ?auto_1918261 ?auto_1918256 ) ( not ( = ?auto_1918262 ?auto_1918256 ) ) ( HAVE_IMAGE ?auto_1918256 ?auto_1918257 ) ( not ( = ?auto_1918257 ?auto_1918255 ) ) ( not ( = ?auto_1918257 ?auto_1918259 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1918258 ?auto_1918255 ?auto_1918260 ?auto_1918259 )
      ( GET-3IMAGE-VERIFY ?auto_1918256 ?auto_1918257 ?auto_1918258 ?auto_1918255 ?auto_1918260 ?auto_1918259 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1918276 - DIRECTION
      ?auto_1918277 - MODE
      ?auto_1918278 - DIRECTION
      ?auto_1918275 - MODE
      ?auto_1918280 - DIRECTION
      ?auto_1918279 - MODE
    )
    :vars
    (
      ?auto_1918283 - INSTRUMENT
      ?auto_1918281 - SATELLITE
      ?auto_1918282 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1918278 ?auto_1918276 ) ) ( not ( = ?auto_1918280 ?auto_1918276 ) ) ( not ( = ?auto_1918280 ?auto_1918278 ) ) ( ON_BOARD ?auto_1918283 ?auto_1918281 ) ( SUPPORTS ?auto_1918283 ?auto_1918275 ) ( not ( = ?auto_1918278 ?auto_1918282 ) ) ( HAVE_IMAGE ?auto_1918280 ?auto_1918279 ) ( not ( = ?auto_1918280 ?auto_1918282 ) ) ( not ( = ?auto_1918279 ?auto_1918275 ) ) ( CALIBRATION_TARGET ?auto_1918283 ?auto_1918282 ) ( POWER_AVAIL ?auto_1918281 ) ( POINTING ?auto_1918281 ?auto_1918276 ) ( not ( = ?auto_1918282 ?auto_1918276 ) ) ( HAVE_IMAGE ?auto_1918276 ?auto_1918277 ) ( not ( = ?auto_1918277 ?auto_1918275 ) ) ( not ( = ?auto_1918277 ?auto_1918279 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1918280 ?auto_1918279 ?auto_1918278 ?auto_1918275 )
      ( GET-3IMAGE-VERIFY ?auto_1918276 ?auto_1918277 ?auto_1918278 ?auto_1918275 ?auto_1918280 ?auto_1918279 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1918317 - DIRECTION
      ?auto_1918318 - MODE
      ?auto_1918319 - DIRECTION
      ?auto_1918316 - MODE
      ?auto_1918321 - DIRECTION
      ?auto_1918320 - MODE
    )
    :vars
    (
      ?auto_1918324 - INSTRUMENT
      ?auto_1918322 - SATELLITE
      ?auto_1918323 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1918319 ?auto_1918317 ) ) ( not ( = ?auto_1918321 ?auto_1918317 ) ) ( not ( = ?auto_1918321 ?auto_1918319 ) ) ( ON_BOARD ?auto_1918324 ?auto_1918322 ) ( SUPPORTS ?auto_1918324 ?auto_1918318 ) ( not ( = ?auto_1918317 ?auto_1918323 ) ) ( HAVE_IMAGE ?auto_1918319 ?auto_1918316 ) ( not ( = ?auto_1918319 ?auto_1918323 ) ) ( not ( = ?auto_1918316 ?auto_1918318 ) ) ( CALIBRATION_TARGET ?auto_1918324 ?auto_1918323 ) ( POWER_AVAIL ?auto_1918322 ) ( POINTING ?auto_1918322 ?auto_1918321 ) ( not ( = ?auto_1918323 ?auto_1918321 ) ) ( HAVE_IMAGE ?auto_1918321 ?auto_1918320 ) ( not ( = ?auto_1918318 ?auto_1918320 ) ) ( not ( = ?auto_1918316 ?auto_1918320 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1918319 ?auto_1918316 ?auto_1918317 ?auto_1918318 )
      ( GET-3IMAGE-VERIFY ?auto_1918317 ?auto_1918318 ?auto_1918319 ?auto_1918316 ?auto_1918321 ?auto_1918320 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1918336 - DIRECTION
      ?auto_1918337 - MODE
      ?auto_1918338 - DIRECTION
      ?auto_1918335 - MODE
      ?auto_1918340 - DIRECTION
      ?auto_1918339 - MODE
    )
    :vars
    (
      ?auto_1918343 - INSTRUMENT
      ?auto_1918341 - SATELLITE
      ?auto_1918342 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1918338 ?auto_1918336 ) ) ( not ( = ?auto_1918340 ?auto_1918336 ) ) ( not ( = ?auto_1918340 ?auto_1918338 ) ) ( ON_BOARD ?auto_1918343 ?auto_1918341 ) ( SUPPORTS ?auto_1918343 ?auto_1918337 ) ( not ( = ?auto_1918336 ?auto_1918342 ) ) ( HAVE_IMAGE ?auto_1918340 ?auto_1918339 ) ( not ( = ?auto_1918340 ?auto_1918342 ) ) ( not ( = ?auto_1918339 ?auto_1918337 ) ) ( CALIBRATION_TARGET ?auto_1918343 ?auto_1918342 ) ( POWER_AVAIL ?auto_1918341 ) ( POINTING ?auto_1918341 ?auto_1918338 ) ( not ( = ?auto_1918342 ?auto_1918338 ) ) ( HAVE_IMAGE ?auto_1918338 ?auto_1918335 ) ( not ( = ?auto_1918337 ?auto_1918335 ) ) ( not ( = ?auto_1918335 ?auto_1918339 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1918340 ?auto_1918339 ?auto_1918336 ?auto_1918337 )
      ( GET-3IMAGE-VERIFY ?auto_1918336 ?auto_1918337 ?auto_1918338 ?auto_1918335 ?auto_1918340 ?auto_1918339 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1921995 - DIRECTION
      ?auto_1921996 - MODE
    )
    :vars
    (
      ?auto_1922002 - DIRECTION
      ?auto_1922001 - INSTRUMENT
      ?auto_1921997 - SATELLITE
      ?auto_1921998 - DIRECTION
      ?auto_1921999 - MODE
      ?auto_1922000 - DIRECTION
      ?auto_1922003 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1921995 ?auto_1922002 ) ) ( ON_BOARD ?auto_1922001 ?auto_1921997 ) ( SUPPORTS ?auto_1922001 ?auto_1921996 ) ( not ( = ?auto_1921995 ?auto_1921998 ) ) ( HAVE_IMAGE ?auto_1922002 ?auto_1921999 ) ( not ( = ?auto_1922002 ?auto_1921998 ) ) ( not ( = ?auto_1921999 ?auto_1921996 ) ) ( CALIBRATION_TARGET ?auto_1922001 ?auto_1921998 ) ( POINTING ?auto_1921997 ?auto_1922000 ) ( not ( = ?auto_1921998 ?auto_1922000 ) ) ( not ( = ?auto_1921995 ?auto_1922000 ) ) ( not ( = ?auto_1922002 ?auto_1922000 ) ) ( ON_BOARD ?auto_1922003 ?auto_1921997 ) ( POWER_ON ?auto_1922003 ) ( not ( = ?auto_1922001 ?auto_1922003 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_1922003 ?auto_1921997 )
      ( GET-2IMAGE ?auto_1922002 ?auto_1921999 ?auto_1921995 ?auto_1921996 )
      ( GET-1IMAGE-VERIFY ?auto_1921995 ?auto_1921996 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1922005 - DIRECTION
      ?auto_1922006 - MODE
      ?auto_1922007 - DIRECTION
      ?auto_1922004 - MODE
    )
    :vars
    (
      ?auto_1922009 - INSTRUMENT
      ?auto_1922008 - SATELLITE
      ?auto_1922012 - DIRECTION
      ?auto_1922011 - DIRECTION
      ?auto_1922010 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1922007 ?auto_1922005 ) ) ( ON_BOARD ?auto_1922009 ?auto_1922008 ) ( SUPPORTS ?auto_1922009 ?auto_1922004 ) ( not ( = ?auto_1922007 ?auto_1922012 ) ) ( HAVE_IMAGE ?auto_1922005 ?auto_1922006 ) ( not ( = ?auto_1922005 ?auto_1922012 ) ) ( not ( = ?auto_1922006 ?auto_1922004 ) ) ( CALIBRATION_TARGET ?auto_1922009 ?auto_1922012 ) ( POINTING ?auto_1922008 ?auto_1922011 ) ( not ( = ?auto_1922012 ?auto_1922011 ) ) ( not ( = ?auto_1922007 ?auto_1922011 ) ) ( not ( = ?auto_1922005 ?auto_1922011 ) ) ( ON_BOARD ?auto_1922010 ?auto_1922008 ) ( POWER_ON ?auto_1922010 ) ( not ( = ?auto_1922009 ?auto_1922010 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1922007 ?auto_1922004 )
      ( GET-2IMAGE-VERIFY ?auto_1922005 ?auto_1922006 ?auto_1922007 ?auto_1922004 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1922014 - DIRECTION
      ?auto_1922015 - MODE
      ?auto_1922016 - DIRECTION
      ?auto_1922013 - MODE
    )
    :vars
    (
      ?auto_1922018 - DIRECTION
      ?auto_1922021 - INSTRUMENT
      ?auto_1922017 - SATELLITE
      ?auto_1922022 - DIRECTION
      ?auto_1922020 - MODE
      ?auto_1922019 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1922016 ?auto_1922014 ) ) ( not ( = ?auto_1922016 ?auto_1922018 ) ) ( ON_BOARD ?auto_1922021 ?auto_1922017 ) ( SUPPORTS ?auto_1922021 ?auto_1922013 ) ( not ( = ?auto_1922016 ?auto_1922022 ) ) ( HAVE_IMAGE ?auto_1922018 ?auto_1922020 ) ( not ( = ?auto_1922018 ?auto_1922022 ) ) ( not ( = ?auto_1922020 ?auto_1922013 ) ) ( CALIBRATION_TARGET ?auto_1922021 ?auto_1922022 ) ( POINTING ?auto_1922017 ?auto_1922014 ) ( not ( = ?auto_1922022 ?auto_1922014 ) ) ( not ( = ?auto_1922018 ?auto_1922014 ) ) ( ON_BOARD ?auto_1922019 ?auto_1922017 ) ( POWER_ON ?auto_1922019 ) ( not ( = ?auto_1922021 ?auto_1922019 ) ) ( HAVE_IMAGE ?auto_1922014 ?auto_1922015 ) ( not ( = ?auto_1922015 ?auto_1922013 ) ) ( not ( = ?auto_1922015 ?auto_1922020 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1922018 ?auto_1922020 ?auto_1922016 ?auto_1922013 )
      ( GET-2IMAGE-VERIFY ?auto_1922014 ?auto_1922015 ?auto_1922016 ?auto_1922013 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1922024 - DIRECTION
      ?auto_1922025 - MODE
      ?auto_1922026 - DIRECTION
      ?auto_1922023 - MODE
    )
    :vars
    (
      ?auto_1922030 - INSTRUMENT
      ?auto_1922027 - SATELLITE
      ?auto_1922031 - DIRECTION
      ?auto_1922029 - DIRECTION
      ?auto_1922028 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1922026 ?auto_1922024 ) ) ( ON_BOARD ?auto_1922030 ?auto_1922027 ) ( SUPPORTS ?auto_1922030 ?auto_1922025 ) ( not ( = ?auto_1922024 ?auto_1922031 ) ) ( HAVE_IMAGE ?auto_1922026 ?auto_1922023 ) ( not ( = ?auto_1922026 ?auto_1922031 ) ) ( not ( = ?auto_1922023 ?auto_1922025 ) ) ( CALIBRATION_TARGET ?auto_1922030 ?auto_1922031 ) ( POINTING ?auto_1922027 ?auto_1922029 ) ( not ( = ?auto_1922031 ?auto_1922029 ) ) ( not ( = ?auto_1922024 ?auto_1922029 ) ) ( not ( = ?auto_1922026 ?auto_1922029 ) ) ( ON_BOARD ?auto_1922028 ?auto_1922027 ) ( POWER_ON ?auto_1922028 ) ( not ( = ?auto_1922030 ?auto_1922028 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1922026 ?auto_1922023 ?auto_1922024 ?auto_1922025 )
      ( GET-2IMAGE-VERIFY ?auto_1922024 ?auto_1922025 ?auto_1922026 ?auto_1922023 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1922033 - DIRECTION
      ?auto_1922034 - MODE
      ?auto_1922035 - DIRECTION
      ?auto_1922032 - MODE
    )
    :vars
    (
      ?auto_1922037 - DIRECTION
      ?auto_1922040 - INSTRUMENT
      ?auto_1922036 - SATELLITE
      ?auto_1922041 - DIRECTION
      ?auto_1922039 - MODE
      ?auto_1922038 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1922035 ?auto_1922033 ) ) ( not ( = ?auto_1922033 ?auto_1922037 ) ) ( ON_BOARD ?auto_1922040 ?auto_1922036 ) ( SUPPORTS ?auto_1922040 ?auto_1922034 ) ( not ( = ?auto_1922033 ?auto_1922041 ) ) ( HAVE_IMAGE ?auto_1922037 ?auto_1922039 ) ( not ( = ?auto_1922037 ?auto_1922041 ) ) ( not ( = ?auto_1922039 ?auto_1922034 ) ) ( CALIBRATION_TARGET ?auto_1922040 ?auto_1922041 ) ( POINTING ?auto_1922036 ?auto_1922035 ) ( not ( = ?auto_1922041 ?auto_1922035 ) ) ( not ( = ?auto_1922037 ?auto_1922035 ) ) ( ON_BOARD ?auto_1922038 ?auto_1922036 ) ( POWER_ON ?auto_1922038 ) ( not ( = ?auto_1922040 ?auto_1922038 ) ) ( HAVE_IMAGE ?auto_1922035 ?auto_1922032 ) ( not ( = ?auto_1922034 ?auto_1922032 ) ) ( not ( = ?auto_1922032 ?auto_1922039 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1922037 ?auto_1922039 ?auto_1922033 ?auto_1922034 )
      ( GET-2IMAGE-VERIFY ?auto_1922033 ?auto_1922034 ?auto_1922035 ?auto_1922032 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1922065 - DIRECTION
      ?auto_1922066 - MODE
      ?auto_1922067 - DIRECTION
      ?auto_1922064 - MODE
      ?auto_1922069 - DIRECTION
      ?auto_1922068 - MODE
    )
    :vars
    (
      ?auto_1922072 - INSTRUMENT
      ?auto_1922070 - SATELLITE
      ?auto_1922073 - DIRECTION
      ?auto_1922071 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1922067 ?auto_1922065 ) ) ( not ( = ?auto_1922069 ?auto_1922065 ) ) ( not ( = ?auto_1922069 ?auto_1922067 ) ) ( ON_BOARD ?auto_1922072 ?auto_1922070 ) ( SUPPORTS ?auto_1922072 ?auto_1922068 ) ( not ( = ?auto_1922069 ?auto_1922073 ) ) ( HAVE_IMAGE ?auto_1922065 ?auto_1922066 ) ( not ( = ?auto_1922065 ?auto_1922073 ) ) ( not ( = ?auto_1922066 ?auto_1922068 ) ) ( CALIBRATION_TARGET ?auto_1922072 ?auto_1922073 ) ( POINTING ?auto_1922070 ?auto_1922067 ) ( not ( = ?auto_1922073 ?auto_1922067 ) ) ( ON_BOARD ?auto_1922071 ?auto_1922070 ) ( POWER_ON ?auto_1922071 ) ( not ( = ?auto_1922072 ?auto_1922071 ) ) ( HAVE_IMAGE ?auto_1922067 ?auto_1922064 ) ( not ( = ?auto_1922066 ?auto_1922064 ) ) ( not ( = ?auto_1922064 ?auto_1922068 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1922065 ?auto_1922066 ?auto_1922069 ?auto_1922068 )
      ( GET-3IMAGE-VERIFY ?auto_1922065 ?auto_1922066 ?auto_1922067 ?auto_1922064 ?auto_1922069 ?auto_1922068 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1922086 - DIRECTION
      ?auto_1922087 - MODE
      ?auto_1922088 - DIRECTION
      ?auto_1922085 - MODE
      ?auto_1922090 - DIRECTION
      ?auto_1922089 - MODE
    )
    :vars
    (
      ?auto_1922093 - INSTRUMENT
      ?auto_1922091 - SATELLITE
      ?auto_1922094 - DIRECTION
      ?auto_1922092 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1922088 ?auto_1922086 ) ) ( not ( = ?auto_1922090 ?auto_1922086 ) ) ( not ( = ?auto_1922090 ?auto_1922088 ) ) ( ON_BOARD ?auto_1922093 ?auto_1922091 ) ( SUPPORTS ?auto_1922093 ?auto_1922085 ) ( not ( = ?auto_1922088 ?auto_1922094 ) ) ( HAVE_IMAGE ?auto_1922086 ?auto_1922087 ) ( not ( = ?auto_1922086 ?auto_1922094 ) ) ( not ( = ?auto_1922087 ?auto_1922085 ) ) ( CALIBRATION_TARGET ?auto_1922093 ?auto_1922094 ) ( POINTING ?auto_1922091 ?auto_1922090 ) ( not ( = ?auto_1922094 ?auto_1922090 ) ) ( ON_BOARD ?auto_1922092 ?auto_1922091 ) ( POWER_ON ?auto_1922092 ) ( not ( = ?auto_1922093 ?auto_1922092 ) ) ( HAVE_IMAGE ?auto_1922090 ?auto_1922089 ) ( not ( = ?auto_1922087 ?auto_1922089 ) ) ( not ( = ?auto_1922085 ?auto_1922089 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1922086 ?auto_1922087 ?auto_1922088 ?auto_1922085 )
      ( GET-3IMAGE-VERIFY ?auto_1922086 ?auto_1922087 ?auto_1922088 ?auto_1922085 ?auto_1922090 ?auto_1922089 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1922107 - DIRECTION
      ?auto_1922108 - MODE
      ?auto_1922109 - DIRECTION
      ?auto_1922106 - MODE
      ?auto_1922111 - DIRECTION
      ?auto_1922110 - MODE
    )
    :vars
    (
      ?auto_1922114 - INSTRUMENT
      ?auto_1922112 - SATELLITE
      ?auto_1922115 - DIRECTION
      ?auto_1922113 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1922109 ?auto_1922107 ) ) ( not ( = ?auto_1922111 ?auto_1922107 ) ) ( not ( = ?auto_1922111 ?auto_1922109 ) ) ( ON_BOARD ?auto_1922114 ?auto_1922112 ) ( SUPPORTS ?auto_1922114 ?auto_1922110 ) ( not ( = ?auto_1922111 ?auto_1922115 ) ) ( HAVE_IMAGE ?auto_1922109 ?auto_1922106 ) ( not ( = ?auto_1922109 ?auto_1922115 ) ) ( not ( = ?auto_1922106 ?auto_1922110 ) ) ( CALIBRATION_TARGET ?auto_1922114 ?auto_1922115 ) ( POINTING ?auto_1922112 ?auto_1922107 ) ( not ( = ?auto_1922115 ?auto_1922107 ) ) ( ON_BOARD ?auto_1922113 ?auto_1922112 ) ( POWER_ON ?auto_1922113 ) ( not ( = ?auto_1922114 ?auto_1922113 ) ) ( HAVE_IMAGE ?auto_1922107 ?auto_1922108 ) ( not ( = ?auto_1922108 ?auto_1922106 ) ) ( not ( = ?auto_1922108 ?auto_1922110 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1922109 ?auto_1922106 ?auto_1922111 ?auto_1922110 )
      ( GET-3IMAGE-VERIFY ?auto_1922107 ?auto_1922108 ?auto_1922109 ?auto_1922106 ?auto_1922111 ?auto_1922110 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1922129 - DIRECTION
      ?auto_1922130 - MODE
      ?auto_1922131 - DIRECTION
      ?auto_1922128 - MODE
      ?auto_1922133 - DIRECTION
      ?auto_1922132 - MODE
    )
    :vars
    (
      ?auto_1922136 - INSTRUMENT
      ?auto_1922134 - SATELLITE
      ?auto_1922137 - DIRECTION
      ?auto_1922135 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1922131 ?auto_1922129 ) ) ( not ( = ?auto_1922133 ?auto_1922129 ) ) ( not ( = ?auto_1922133 ?auto_1922131 ) ) ( ON_BOARD ?auto_1922136 ?auto_1922134 ) ( SUPPORTS ?auto_1922136 ?auto_1922128 ) ( not ( = ?auto_1922131 ?auto_1922137 ) ) ( HAVE_IMAGE ?auto_1922133 ?auto_1922132 ) ( not ( = ?auto_1922133 ?auto_1922137 ) ) ( not ( = ?auto_1922132 ?auto_1922128 ) ) ( CALIBRATION_TARGET ?auto_1922136 ?auto_1922137 ) ( POINTING ?auto_1922134 ?auto_1922129 ) ( not ( = ?auto_1922137 ?auto_1922129 ) ) ( ON_BOARD ?auto_1922135 ?auto_1922134 ) ( POWER_ON ?auto_1922135 ) ( not ( = ?auto_1922136 ?auto_1922135 ) ) ( HAVE_IMAGE ?auto_1922129 ?auto_1922130 ) ( not ( = ?auto_1922130 ?auto_1922128 ) ) ( not ( = ?auto_1922130 ?auto_1922132 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1922133 ?auto_1922132 ?auto_1922131 ?auto_1922128 )
      ( GET-3IMAGE-VERIFY ?auto_1922129 ?auto_1922130 ?auto_1922131 ?auto_1922128 ?auto_1922133 ?auto_1922132 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1922174 - DIRECTION
      ?auto_1922175 - MODE
      ?auto_1922176 - DIRECTION
      ?auto_1922173 - MODE
      ?auto_1922178 - DIRECTION
      ?auto_1922177 - MODE
    )
    :vars
    (
      ?auto_1922181 - INSTRUMENT
      ?auto_1922179 - SATELLITE
      ?auto_1922182 - DIRECTION
      ?auto_1922180 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1922176 ?auto_1922174 ) ) ( not ( = ?auto_1922178 ?auto_1922174 ) ) ( not ( = ?auto_1922178 ?auto_1922176 ) ) ( ON_BOARD ?auto_1922181 ?auto_1922179 ) ( SUPPORTS ?auto_1922181 ?auto_1922175 ) ( not ( = ?auto_1922174 ?auto_1922182 ) ) ( HAVE_IMAGE ?auto_1922176 ?auto_1922173 ) ( not ( = ?auto_1922176 ?auto_1922182 ) ) ( not ( = ?auto_1922173 ?auto_1922175 ) ) ( CALIBRATION_TARGET ?auto_1922181 ?auto_1922182 ) ( POINTING ?auto_1922179 ?auto_1922178 ) ( not ( = ?auto_1922182 ?auto_1922178 ) ) ( ON_BOARD ?auto_1922180 ?auto_1922179 ) ( POWER_ON ?auto_1922180 ) ( not ( = ?auto_1922181 ?auto_1922180 ) ) ( HAVE_IMAGE ?auto_1922178 ?auto_1922177 ) ( not ( = ?auto_1922175 ?auto_1922177 ) ) ( not ( = ?auto_1922173 ?auto_1922177 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1922176 ?auto_1922173 ?auto_1922174 ?auto_1922175 )
      ( GET-3IMAGE-VERIFY ?auto_1922174 ?auto_1922175 ?auto_1922176 ?auto_1922173 ?auto_1922178 ?auto_1922177 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1922195 - DIRECTION
      ?auto_1922196 - MODE
      ?auto_1922197 - DIRECTION
      ?auto_1922194 - MODE
      ?auto_1922199 - DIRECTION
      ?auto_1922198 - MODE
    )
    :vars
    (
      ?auto_1922202 - INSTRUMENT
      ?auto_1922200 - SATELLITE
      ?auto_1922203 - DIRECTION
      ?auto_1922201 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1922197 ?auto_1922195 ) ) ( not ( = ?auto_1922199 ?auto_1922195 ) ) ( not ( = ?auto_1922199 ?auto_1922197 ) ) ( ON_BOARD ?auto_1922202 ?auto_1922200 ) ( SUPPORTS ?auto_1922202 ?auto_1922196 ) ( not ( = ?auto_1922195 ?auto_1922203 ) ) ( HAVE_IMAGE ?auto_1922199 ?auto_1922198 ) ( not ( = ?auto_1922199 ?auto_1922203 ) ) ( not ( = ?auto_1922198 ?auto_1922196 ) ) ( CALIBRATION_TARGET ?auto_1922202 ?auto_1922203 ) ( POINTING ?auto_1922200 ?auto_1922197 ) ( not ( = ?auto_1922203 ?auto_1922197 ) ) ( ON_BOARD ?auto_1922201 ?auto_1922200 ) ( POWER_ON ?auto_1922201 ) ( not ( = ?auto_1922202 ?auto_1922201 ) ) ( HAVE_IMAGE ?auto_1922197 ?auto_1922194 ) ( not ( = ?auto_1922196 ?auto_1922194 ) ) ( not ( = ?auto_1922194 ?auto_1922198 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1922199 ?auto_1922198 ?auto_1922195 ?auto_1922196 )
      ( GET-3IMAGE-VERIFY ?auto_1922195 ?auto_1922196 ?auto_1922197 ?auto_1922194 ?auto_1922199 ?auto_1922198 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1930260 - DIRECTION
      ?auto_1930261 - MODE
    )
    :vars
    (
      ?auto_1930265 - DIRECTION
      ?auto_1930268 - INSTRUMENT
      ?auto_1930266 - SATELLITE
      ?auto_1930267 - DIRECTION
      ?auto_1930262 - MODE
      ?auto_1930263 - DIRECTION
      ?auto_1930264 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1930260 ?auto_1930265 ) ) ( ON_BOARD ?auto_1930268 ?auto_1930266 ) ( SUPPORTS ?auto_1930268 ?auto_1930261 ) ( not ( = ?auto_1930260 ?auto_1930267 ) ) ( HAVE_IMAGE ?auto_1930265 ?auto_1930262 ) ( not ( = ?auto_1930265 ?auto_1930267 ) ) ( not ( = ?auto_1930262 ?auto_1930261 ) ) ( CALIBRATION_TARGET ?auto_1930268 ?auto_1930267 ) ( not ( = ?auto_1930267 ?auto_1930263 ) ) ( not ( = ?auto_1930260 ?auto_1930263 ) ) ( not ( = ?auto_1930265 ?auto_1930263 ) ) ( ON_BOARD ?auto_1930264 ?auto_1930266 ) ( POWER_ON ?auto_1930264 ) ( not ( = ?auto_1930268 ?auto_1930264 ) ) ( POINTING ?auto_1930266 ?auto_1930267 ) )
    :subtasks
    ( ( !TURN_TO ?auto_1930266 ?auto_1930263 ?auto_1930267 )
      ( GET-2IMAGE ?auto_1930265 ?auto_1930262 ?auto_1930260 ?auto_1930261 )
      ( GET-1IMAGE-VERIFY ?auto_1930260 ?auto_1930261 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1930270 - DIRECTION
      ?auto_1930271 - MODE
      ?auto_1930272 - DIRECTION
      ?auto_1930269 - MODE
    )
    :vars
    (
      ?auto_1930275 - INSTRUMENT
      ?auto_1930273 - SATELLITE
      ?auto_1930274 - DIRECTION
      ?auto_1930277 - DIRECTION
      ?auto_1930276 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1930272 ?auto_1930270 ) ) ( ON_BOARD ?auto_1930275 ?auto_1930273 ) ( SUPPORTS ?auto_1930275 ?auto_1930269 ) ( not ( = ?auto_1930272 ?auto_1930274 ) ) ( HAVE_IMAGE ?auto_1930270 ?auto_1930271 ) ( not ( = ?auto_1930270 ?auto_1930274 ) ) ( not ( = ?auto_1930271 ?auto_1930269 ) ) ( CALIBRATION_TARGET ?auto_1930275 ?auto_1930274 ) ( not ( = ?auto_1930274 ?auto_1930277 ) ) ( not ( = ?auto_1930272 ?auto_1930277 ) ) ( not ( = ?auto_1930270 ?auto_1930277 ) ) ( ON_BOARD ?auto_1930276 ?auto_1930273 ) ( POWER_ON ?auto_1930276 ) ( not ( = ?auto_1930275 ?auto_1930276 ) ) ( POINTING ?auto_1930273 ?auto_1930274 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1930272 ?auto_1930269 )
      ( GET-2IMAGE-VERIFY ?auto_1930270 ?auto_1930271 ?auto_1930272 ?auto_1930269 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1930289 - DIRECTION
      ?auto_1930290 - MODE
      ?auto_1930291 - DIRECTION
      ?auto_1930288 - MODE
    )
    :vars
    (
      ?auto_1930295 - INSTRUMENT
      ?auto_1930294 - SATELLITE
      ?auto_1930292 - DIRECTION
      ?auto_1930293 - DIRECTION
      ?auto_1930296 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1930291 ?auto_1930289 ) ) ( ON_BOARD ?auto_1930295 ?auto_1930294 ) ( SUPPORTS ?auto_1930295 ?auto_1930290 ) ( not ( = ?auto_1930289 ?auto_1930292 ) ) ( HAVE_IMAGE ?auto_1930291 ?auto_1930288 ) ( not ( = ?auto_1930291 ?auto_1930292 ) ) ( not ( = ?auto_1930288 ?auto_1930290 ) ) ( CALIBRATION_TARGET ?auto_1930295 ?auto_1930292 ) ( not ( = ?auto_1930292 ?auto_1930293 ) ) ( not ( = ?auto_1930289 ?auto_1930293 ) ) ( not ( = ?auto_1930291 ?auto_1930293 ) ) ( ON_BOARD ?auto_1930296 ?auto_1930294 ) ( POWER_ON ?auto_1930296 ) ( not ( = ?auto_1930295 ?auto_1930296 ) ) ( POINTING ?auto_1930294 ?auto_1930292 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1930291 ?auto_1930288 ?auto_1930289 ?auto_1930290 )
      ( GET-2IMAGE-VERIFY ?auto_1930289 ?auto_1930290 ?auto_1930291 ?auto_1930288 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1979867 - DIRECTION
      ?auto_1979868 - MODE
      ?auto_1979869 - DIRECTION
      ?auto_1979866 - MODE
      ?auto_1979871 - DIRECTION
      ?auto_1979870 - MODE
      ?auto_1979872 - DIRECTION
      ?auto_1979873 - MODE
    )
    :vars
    (
      ?auto_1979875 - INSTRUMENT
      ?auto_1979874 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_1979869 ?auto_1979867 ) ) ( not ( = ?auto_1979871 ?auto_1979867 ) ) ( not ( = ?auto_1979871 ?auto_1979869 ) ) ( not ( = ?auto_1979872 ?auto_1979867 ) ) ( not ( = ?auto_1979872 ?auto_1979869 ) ) ( not ( = ?auto_1979872 ?auto_1979871 ) ) ( CALIBRATED ?auto_1979875 ) ( ON_BOARD ?auto_1979875 ?auto_1979874 ) ( SUPPORTS ?auto_1979875 ?auto_1979873 ) ( POWER_ON ?auto_1979875 ) ( POINTING ?auto_1979874 ?auto_1979872 ) ( HAVE_IMAGE ?auto_1979867 ?auto_1979868 ) ( HAVE_IMAGE ?auto_1979869 ?auto_1979866 ) ( HAVE_IMAGE ?auto_1979871 ?auto_1979870 ) ( not ( = ?auto_1979868 ?auto_1979866 ) ) ( not ( = ?auto_1979868 ?auto_1979870 ) ) ( not ( = ?auto_1979868 ?auto_1979873 ) ) ( not ( = ?auto_1979866 ?auto_1979870 ) ) ( not ( = ?auto_1979866 ?auto_1979873 ) ) ( not ( = ?auto_1979870 ?auto_1979873 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1979872 ?auto_1979873 )
      ( GET-4IMAGE-VERIFY ?auto_1979867 ?auto_1979868 ?auto_1979869 ?auto_1979866 ?auto_1979871 ?auto_1979870 ?auto_1979872 ?auto_1979873 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1979897 - DIRECTION
      ?auto_1979898 - MODE
      ?auto_1979899 - DIRECTION
      ?auto_1979896 - MODE
      ?auto_1979901 - DIRECTION
      ?auto_1979900 - MODE
      ?auto_1979902 - DIRECTION
      ?auto_1979903 - MODE
    )
    :vars
    (
      ?auto_1979905 - INSTRUMENT
      ?auto_1979904 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_1979899 ?auto_1979897 ) ) ( not ( = ?auto_1979901 ?auto_1979897 ) ) ( not ( = ?auto_1979901 ?auto_1979899 ) ) ( not ( = ?auto_1979902 ?auto_1979897 ) ) ( not ( = ?auto_1979902 ?auto_1979899 ) ) ( not ( = ?auto_1979902 ?auto_1979901 ) ) ( CALIBRATED ?auto_1979905 ) ( ON_BOARD ?auto_1979905 ?auto_1979904 ) ( SUPPORTS ?auto_1979905 ?auto_1979900 ) ( POWER_ON ?auto_1979905 ) ( POINTING ?auto_1979904 ?auto_1979901 ) ( HAVE_IMAGE ?auto_1979897 ?auto_1979898 ) ( HAVE_IMAGE ?auto_1979899 ?auto_1979896 ) ( HAVE_IMAGE ?auto_1979902 ?auto_1979903 ) ( not ( = ?auto_1979898 ?auto_1979896 ) ) ( not ( = ?auto_1979898 ?auto_1979900 ) ) ( not ( = ?auto_1979898 ?auto_1979903 ) ) ( not ( = ?auto_1979896 ?auto_1979900 ) ) ( not ( = ?auto_1979896 ?auto_1979903 ) ) ( not ( = ?auto_1979900 ?auto_1979903 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1979901 ?auto_1979900 )
      ( GET-4IMAGE-VERIFY ?auto_1979897 ?auto_1979898 ?auto_1979899 ?auto_1979896 ?auto_1979901 ?auto_1979900 ?auto_1979902 ?auto_1979903 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1980043 - DIRECTION
      ?auto_1980044 - MODE
      ?auto_1980045 - DIRECTION
      ?auto_1980042 - MODE
      ?auto_1980047 - DIRECTION
      ?auto_1980046 - MODE
      ?auto_1980048 - DIRECTION
      ?auto_1980049 - MODE
    )
    :vars
    (
      ?auto_1980051 - INSTRUMENT
      ?auto_1980050 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_1980045 ?auto_1980043 ) ) ( not ( = ?auto_1980047 ?auto_1980043 ) ) ( not ( = ?auto_1980047 ?auto_1980045 ) ) ( not ( = ?auto_1980048 ?auto_1980043 ) ) ( not ( = ?auto_1980048 ?auto_1980045 ) ) ( not ( = ?auto_1980048 ?auto_1980047 ) ) ( CALIBRATED ?auto_1980051 ) ( ON_BOARD ?auto_1980051 ?auto_1980050 ) ( SUPPORTS ?auto_1980051 ?auto_1980042 ) ( POWER_ON ?auto_1980051 ) ( POINTING ?auto_1980050 ?auto_1980045 ) ( HAVE_IMAGE ?auto_1980043 ?auto_1980044 ) ( HAVE_IMAGE ?auto_1980047 ?auto_1980046 ) ( HAVE_IMAGE ?auto_1980048 ?auto_1980049 ) ( not ( = ?auto_1980044 ?auto_1980042 ) ) ( not ( = ?auto_1980044 ?auto_1980046 ) ) ( not ( = ?auto_1980044 ?auto_1980049 ) ) ( not ( = ?auto_1980042 ?auto_1980046 ) ) ( not ( = ?auto_1980042 ?auto_1980049 ) ) ( not ( = ?auto_1980046 ?auto_1980049 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1980045 ?auto_1980042 )
      ( GET-4IMAGE-VERIFY ?auto_1980043 ?auto_1980044 ?auto_1980045 ?auto_1980042 ?auto_1980047 ?auto_1980046 ?auto_1980048 ?auto_1980049 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1980917 - DIRECTION
      ?auto_1980918 - MODE
      ?auto_1980919 - DIRECTION
      ?auto_1980916 - MODE
      ?auto_1980921 - DIRECTION
      ?auto_1980920 - MODE
      ?auto_1980922 - DIRECTION
      ?auto_1980923 - MODE
    )
    :vars
    (
      ?auto_1980925 - INSTRUMENT
      ?auto_1980924 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_1980919 ?auto_1980917 ) ) ( not ( = ?auto_1980921 ?auto_1980917 ) ) ( not ( = ?auto_1980921 ?auto_1980919 ) ) ( not ( = ?auto_1980922 ?auto_1980917 ) ) ( not ( = ?auto_1980922 ?auto_1980919 ) ) ( not ( = ?auto_1980922 ?auto_1980921 ) ) ( CALIBRATED ?auto_1980925 ) ( ON_BOARD ?auto_1980925 ?auto_1980924 ) ( SUPPORTS ?auto_1980925 ?auto_1980918 ) ( POWER_ON ?auto_1980925 ) ( POINTING ?auto_1980924 ?auto_1980917 ) ( HAVE_IMAGE ?auto_1980919 ?auto_1980916 ) ( HAVE_IMAGE ?auto_1980921 ?auto_1980920 ) ( HAVE_IMAGE ?auto_1980922 ?auto_1980923 ) ( not ( = ?auto_1980918 ?auto_1980916 ) ) ( not ( = ?auto_1980918 ?auto_1980920 ) ) ( not ( = ?auto_1980918 ?auto_1980923 ) ) ( not ( = ?auto_1980916 ?auto_1980920 ) ) ( not ( = ?auto_1980916 ?auto_1980923 ) ) ( not ( = ?auto_1980920 ?auto_1980923 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1980917 ?auto_1980918 )
      ( GET-4IMAGE-VERIFY ?auto_1980917 ?auto_1980918 ?auto_1980919 ?auto_1980916 ?auto_1980921 ?auto_1980920 ?auto_1980922 ?auto_1980923 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1991316 - DIRECTION
      ?auto_1991317 - MODE
      ?auto_1991318 - DIRECTION
      ?auto_1991315 - MODE
      ?auto_1991320 - DIRECTION
      ?auto_1991319 - MODE
      ?auto_1991321 - DIRECTION
      ?auto_1991322 - MODE
    )
    :vars
    (
      ?auto_1991323 - INSTRUMENT
      ?auto_1991324 - SATELLITE
      ?auto_1991325 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1991318 ?auto_1991316 ) ) ( not ( = ?auto_1991320 ?auto_1991316 ) ) ( not ( = ?auto_1991320 ?auto_1991318 ) ) ( not ( = ?auto_1991321 ?auto_1991316 ) ) ( not ( = ?auto_1991321 ?auto_1991318 ) ) ( not ( = ?auto_1991321 ?auto_1991320 ) ) ( CALIBRATED ?auto_1991323 ) ( ON_BOARD ?auto_1991323 ?auto_1991324 ) ( SUPPORTS ?auto_1991323 ?auto_1991322 ) ( POWER_ON ?auto_1991323 ) ( POINTING ?auto_1991324 ?auto_1991325 ) ( not ( = ?auto_1991321 ?auto_1991325 ) ) ( HAVE_IMAGE ?auto_1991316 ?auto_1991317 ) ( not ( = ?auto_1991316 ?auto_1991325 ) ) ( not ( = ?auto_1991317 ?auto_1991322 ) ) ( HAVE_IMAGE ?auto_1991318 ?auto_1991315 ) ( HAVE_IMAGE ?auto_1991320 ?auto_1991319 ) ( not ( = ?auto_1991317 ?auto_1991315 ) ) ( not ( = ?auto_1991317 ?auto_1991319 ) ) ( not ( = ?auto_1991318 ?auto_1991325 ) ) ( not ( = ?auto_1991315 ?auto_1991319 ) ) ( not ( = ?auto_1991315 ?auto_1991322 ) ) ( not ( = ?auto_1991320 ?auto_1991325 ) ) ( not ( = ?auto_1991319 ?auto_1991322 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1991316 ?auto_1991317 ?auto_1991321 ?auto_1991322 )
      ( GET-4IMAGE-VERIFY ?auto_1991316 ?auto_1991317 ?auto_1991318 ?auto_1991315 ?auto_1991320 ?auto_1991319 ?auto_1991321 ?auto_1991322 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1991349 - DIRECTION
      ?auto_1991350 - MODE
      ?auto_1991351 - DIRECTION
      ?auto_1991348 - MODE
      ?auto_1991353 - DIRECTION
      ?auto_1991352 - MODE
      ?auto_1991354 - DIRECTION
      ?auto_1991355 - MODE
    )
    :vars
    (
      ?auto_1991356 - INSTRUMENT
      ?auto_1991357 - SATELLITE
      ?auto_1991358 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1991351 ?auto_1991349 ) ) ( not ( = ?auto_1991353 ?auto_1991349 ) ) ( not ( = ?auto_1991353 ?auto_1991351 ) ) ( not ( = ?auto_1991354 ?auto_1991349 ) ) ( not ( = ?auto_1991354 ?auto_1991351 ) ) ( not ( = ?auto_1991354 ?auto_1991353 ) ) ( CALIBRATED ?auto_1991356 ) ( ON_BOARD ?auto_1991356 ?auto_1991357 ) ( SUPPORTS ?auto_1991356 ?auto_1991352 ) ( POWER_ON ?auto_1991356 ) ( POINTING ?auto_1991357 ?auto_1991358 ) ( not ( = ?auto_1991353 ?auto_1991358 ) ) ( HAVE_IMAGE ?auto_1991349 ?auto_1991350 ) ( not ( = ?auto_1991349 ?auto_1991358 ) ) ( not ( = ?auto_1991350 ?auto_1991352 ) ) ( HAVE_IMAGE ?auto_1991351 ?auto_1991348 ) ( HAVE_IMAGE ?auto_1991354 ?auto_1991355 ) ( not ( = ?auto_1991350 ?auto_1991348 ) ) ( not ( = ?auto_1991350 ?auto_1991355 ) ) ( not ( = ?auto_1991351 ?auto_1991358 ) ) ( not ( = ?auto_1991348 ?auto_1991352 ) ) ( not ( = ?auto_1991348 ?auto_1991355 ) ) ( not ( = ?auto_1991352 ?auto_1991355 ) ) ( not ( = ?auto_1991354 ?auto_1991358 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1991349 ?auto_1991350 ?auto_1991353 ?auto_1991352 )
      ( GET-4IMAGE-VERIFY ?auto_1991349 ?auto_1991350 ?auto_1991351 ?auto_1991348 ?auto_1991353 ?auto_1991352 ?auto_1991354 ?auto_1991355 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1991508 - DIRECTION
      ?auto_1991509 - MODE
      ?auto_1991510 - DIRECTION
      ?auto_1991507 - MODE
      ?auto_1991512 - DIRECTION
      ?auto_1991511 - MODE
      ?auto_1991513 - DIRECTION
      ?auto_1991514 - MODE
    )
    :vars
    (
      ?auto_1991515 - INSTRUMENT
      ?auto_1991516 - SATELLITE
      ?auto_1991517 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1991510 ?auto_1991508 ) ) ( not ( = ?auto_1991512 ?auto_1991508 ) ) ( not ( = ?auto_1991512 ?auto_1991510 ) ) ( not ( = ?auto_1991513 ?auto_1991508 ) ) ( not ( = ?auto_1991513 ?auto_1991510 ) ) ( not ( = ?auto_1991513 ?auto_1991512 ) ) ( CALIBRATED ?auto_1991515 ) ( ON_BOARD ?auto_1991515 ?auto_1991516 ) ( SUPPORTS ?auto_1991515 ?auto_1991507 ) ( POWER_ON ?auto_1991515 ) ( POINTING ?auto_1991516 ?auto_1991517 ) ( not ( = ?auto_1991510 ?auto_1991517 ) ) ( HAVE_IMAGE ?auto_1991508 ?auto_1991509 ) ( not ( = ?auto_1991508 ?auto_1991517 ) ) ( not ( = ?auto_1991509 ?auto_1991507 ) ) ( HAVE_IMAGE ?auto_1991512 ?auto_1991511 ) ( HAVE_IMAGE ?auto_1991513 ?auto_1991514 ) ( not ( = ?auto_1991509 ?auto_1991511 ) ) ( not ( = ?auto_1991509 ?auto_1991514 ) ) ( not ( = ?auto_1991507 ?auto_1991511 ) ) ( not ( = ?auto_1991507 ?auto_1991514 ) ) ( not ( = ?auto_1991512 ?auto_1991517 ) ) ( not ( = ?auto_1991511 ?auto_1991514 ) ) ( not ( = ?auto_1991513 ?auto_1991517 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1991508 ?auto_1991509 ?auto_1991510 ?auto_1991507 )
      ( GET-4IMAGE-VERIFY ?auto_1991508 ?auto_1991509 ?auto_1991510 ?auto_1991507 ?auto_1991512 ?auto_1991511 ?auto_1991513 ?auto_1991514 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1992535 - DIRECTION
      ?auto_1992536 - MODE
      ?auto_1992537 - DIRECTION
      ?auto_1992534 - MODE
      ?auto_1992539 - DIRECTION
      ?auto_1992538 - MODE
      ?auto_1992540 - DIRECTION
      ?auto_1992541 - MODE
    )
    :vars
    (
      ?auto_1992542 - INSTRUMENT
      ?auto_1992543 - SATELLITE
      ?auto_1992544 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1992537 ?auto_1992535 ) ) ( not ( = ?auto_1992539 ?auto_1992535 ) ) ( not ( = ?auto_1992539 ?auto_1992537 ) ) ( not ( = ?auto_1992540 ?auto_1992535 ) ) ( not ( = ?auto_1992540 ?auto_1992537 ) ) ( not ( = ?auto_1992540 ?auto_1992539 ) ) ( CALIBRATED ?auto_1992542 ) ( ON_BOARD ?auto_1992542 ?auto_1992543 ) ( SUPPORTS ?auto_1992542 ?auto_1992536 ) ( POWER_ON ?auto_1992542 ) ( POINTING ?auto_1992543 ?auto_1992544 ) ( not ( = ?auto_1992535 ?auto_1992544 ) ) ( HAVE_IMAGE ?auto_1992537 ?auto_1992534 ) ( not ( = ?auto_1992537 ?auto_1992544 ) ) ( not ( = ?auto_1992534 ?auto_1992536 ) ) ( HAVE_IMAGE ?auto_1992539 ?auto_1992538 ) ( HAVE_IMAGE ?auto_1992540 ?auto_1992541 ) ( not ( = ?auto_1992536 ?auto_1992538 ) ) ( not ( = ?auto_1992536 ?auto_1992541 ) ) ( not ( = ?auto_1992534 ?auto_1992538 ) ) ( not ( = ?auto_1992534 ?auto_1992541 ) ) ( not ( = ?auto_1992539 ?auto_1992544 ) ) ( not ( = ?auto_1992538 ?auto_1992541 ) ) ( not ( = ?auto_1992540 ?auto_1992544 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1992537 ?auto_1992534 ?auto_1992535 ?auto_1992536 )
      ( GET-4IMAGE-VERIFY ?auto_1992535 ?auto_1992536 ?auto_1992537 ?auto_1992534 ?auto_1992539 ?auto_1992538 ?auto_1992540 ?auto_1992541 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2004246 - DIRECTION
      ?auto_2004247 - MODE
      ?auto_2004248 - DIRECTION
      ?auto_2004245 - MODE
      ?auto_2004250 - DIRECTION
      ?auto_2004249 - MODE
      ?auto_2004251 - DIRECTION
      ?auto_2004252 - MODE
    )
    :vars
    (
      ?auto_2004253 - INSTRUMENT
      ?auto_2004254 - SATELLITE
      ?auto_2004255 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2004248 ?auto_2004246 ) ) ( not ( = ?auto_2004250 ?auto_2004246 ) ) ( not ( = ?auto_2004250 ?auto_2004248 ) ) ( not ( = ?auto_2004251 ?auto_2004246 ) ) ( not ( = ?auto_2004251 ?auto_2004248 ) ) ( not ( = ?auto_2004251 ?auto_2004250 ) ) ( ON_BOARD ?auto_2004253 ?auto_2004254 ) ( SUPPORTS ?auto_2004253 ?auto_2004252 ) ( POWER_ON ?auto_2004253 ) ( POINTING ?auto_2004254 ?auto_2004255 ) ( not ( = ?auto_2004251 ?auto_2004255 ) ) ( HAVE_IMAGE ?auto_2004246 ?auto_2004247 ) ( not ( = ?auto_2004246 ?auto_2004255 ) ) ( not ( = ?auto_2004247 ?auto_2004252 ) ) ( CALIBRATION_TARGET ?auto_2004253 ?auto_2004255 ) ( NOT_CALIBRATED ?auto_2004253 ) ( HAVE_IMAGE ?auto_2004248 ?auto_2004245 ) ( HAVE_IMAGE ?auto_2004250 ?auto_2004249 ) ( not ( = ?auto_2004247 ?auto_2004245 ) ) ( not ( = ?auto_2004247 ?auto_2004249 ) ) ( not ( = ?auto_2004248 ?auto_2004255 ) ) ( not ( = ?auto_2004245 ?auto_2004249 ) ) ( not ( = ?auto_2004245 ?auto_2004252 ) ) ( not ( = ?auto_2004250 ?auto_2004255 ) ) ( not ( = ?auto_2004249 ?auto_2004252 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2004246 ?auto_2004247 ?auto_2004251 ?auto_2004252 )
      ( GET-4IMAGE-VERIFY ?auto_2004246 ?auto_2004247 ?auto_2004248 ?auto_2004245 ?auto_2004250 ?auto_2004249 ?auto_2004251 ?auto_2004252 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2004279 - DIRECTION
      ?auto_2004280 - MODE
      ?auto_2004281 - DIRECTION
      ?auto_2004278 - MODE
      ?auto_2004283 - DIRECTION
      ?auto_2004282 - MODE
      ?auto_2004284 - DIRECTION
      ?auto_2004285 - MODE
    )
    :vars
    (
      ?auto_2004286 - INSTRUMENT
      ?auto_2004287 - SATELLITE
      ?auto_2004288 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2004281 ?auto_2004279 ) ) ( not ( = ?auto_2004283 ?auto_2004279 ) ) ( not ( = ?auto_2004283 ?auto_2004281 ) ) ( not ( = ?auto_2004284 ?auto_2004279 ) ) ( not ( = ?auto_2004284 ?auto_2004281 ) ) ( not ( = ?auto_2004284 ?auto_2004283 ) ) ( ON_BOARD ?auto_2004286 ?auto_2004287 ) ( SUPPORTS ?auto_2004286 ?auto_2004282 ) ( POWER_ON ?auto_2004286 ) ( POINTING ?auto_2004287 ?auto_2004288 ) ( not ( = ?auto_2004283 ?auto_2004288 ) ) ( HAVE_IMAGE ?auto_2004279 ?auto_2004280 ) ( not ( = ?auto_2004279 ?auto_2004288 ) ) ( not ( = ?auto_2004280 ?auto_2004282 ) ) ( CALIBRATION_TARGET ?auto_2004286 ?auto_2004288 ) ( NOT_CALIBRATED ?auto_2004286 ) ( HAVE_IMAGE ?auto_2004281 ?auto_2004278 ) ( HAVE_IMAGE ?auto_2004284 ?auto_2004285 ) ( not ( = ?auto_2004280 ?auto_2004278 ) ) ( not ( = ?auto_2004280 ?auto_2004285 ) ) ( not ( = ?auto_2004281 ?auto_2004288 ) ) ( not ( = ?auto_2004278 ?auto_2004282 ) ) ( not ( = ?auto_2004278 ?auto_2004285 ) ) ( not ( = ?auto_2004282 ?auto_2004285 ) ) ( not ( = ?auto_2004284 ?auto_2004288 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2004279 ?auto_2004280 ?auto_2004283 ?auto_2004282 )
      ( GET-4IMAGE-VERIFY ?auto_2004279 ?auto_2004280 ?auto_2004281 ?auto_2004278 ?auto_2004283 ?auto_2004282 ?auto_2004284 ?auto_2004285 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2004438 - DIRECTION
      ?auto_2004439 - MODE
      ?auto_2004440 - DIRECTION
      ?auto_2004437 - MODE
      ?auto_2004442 - DIRECTION
      ?auto_2004441 - MODE
      ?auto_2004443 - DIRECTION
      ?auto_2004444 - MODE
    )
    :vars
    (
      ?auto_2004445 - INSTRUMENT
      ?auto_2004446 - SATELLITE
      ?auto_2004447 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2004440 ?auto_2004438 ) ) ( not ( = ?auto_2004442 ?auto_2004438 ) ) ( not ( = ?auto_2004442 ?auto_2004440 ) ) ( not ( = ?auto_2004443 ?auto_2004438 ) ) ( not ( = ?auto_2004443 ?auto_2004440 ) ) ( not ( = ?auto_2004443 ?auto_2004442 ) ) ( ON_BOARD ?auto_2004445 ?auto_2004446 ) ( SUPPORTS ?auto_2004445 ?auto_2004437 ) ( POWER_ON ?auto_2004445 ) ( POINTING ?auto_2004446 ?auto_2004447 ) ( not ( = ?auto_2004440 ?auto_2004447 ) ) ( HAVE_IMAGE ?auto_2004438 ?auto_2004439 ) ( not ( = ?auto_2004438 ?auto_2004447 ) ) ( not ( = ?auto_2004439 ?auto_2004437 ) ) ( CALIBRATION_TARGET ?auto_2004445 ?auto_2004447 ) ( NOT_CALIBRATED ?auto_2004445 ) ( HAVE_IMAGE ?auto_2004442 ?auto_2004441 ) ( HAVE_IMAGE ?auto_2004443 ?auto_2004444 ) ( not ( = ?auto_2004439 ?auto_2004441 ) ) ( not ( = ?auto_2004439 ?auto_2004444 ) ) ( not ( = ?auto_2004437 ?auto_2004441 ) ) ( not ( = ?auto_2004437 ?auto_2004444 ) ) ( not ( = ?auto_2004442 ?auto_2004447 ) ) ( not ( = ?auto_2004441 ?auto_2004444 ) ) ( not ( = ?auto_2004443 ?auto_2004447 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2004438 ?auto_2004439 ?auto_2004440 ?auto_2004437 )
      ( GET-4IMAGE-VERIFY ?auto_2004438 ?auto_2004439 ?auto_2004440 ?auto_2004437 ?auto_2004442 ?auto_2004441 ?auto_2004443 ?auto_2004444 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2005465 - DIRECTION
      ?auto_2005466 - MODE
      ?auto_2005467 - DIRECTION
      ?auto_2005464 - MODE
      ?auto_2005469 - DIRECTION
      ?auto_2005468 - MODE
      ?auto_2005470 - DIRECTION
      ?auto_2005471 - MODE
    )
    :vars
    (
      ?auto_2005472 - INSTRUMENT
      ?auto_2005473 - SATELLITE
      ?auto_2005474 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2005467 ?auto_2005465 ) ) ( not ( = ?auto_2005469 ?auto_2005465 ) ) ( not ( = ?auto_2005469 ?auto_2005467 ) ) ( not ( = ?auto_2005470 ?auto_2005465 ) ) ( not ( = ?auto_2005470 ?auto_2005467 ) ) ( not ( = ?auto_2005470 ?auto_2005469 ) ) ( ON_BOARD ?auto_2005472 ?auto_2005473 ) ( SUPPORTS ?auto_2005472 ?auto_2005466 ) ( POWER_ON ?auto_2005472 ) ( POINTING ?auto_2005473 ?auto_2005474 ) ( not ( = ?auto_2005465 ?auto_2005474 ) ) ( HAVE_IMAGE ?auto_2005467 ?auto_2005464 ) ( not ( = ?auto_2005467 ?auto_2005474 ) ) ( not ( = ?auto_2005464 ?auto_2005466 ) ) ( CALIBRATION_TARGET ?auto_2005472 ?auto_2005474 ) ( NOT_CALIBRATED ?auto_2005472 ) ( HAVE_IMAGE ?auto_2005469 ?auto_2005468 ) ( HAVE_IMAGE ?auto_2005470 ?auto_2005471 ) ( not ( = ?auto_2005466 ?auto_2005468 ) ) ( not ( = ?auto_2005466 ?auto_2005471 ) ) ( not ( = ?auto_2005464 ?auto_2005468 ) ) ( not ( = ?auto_2005464 ?auto_2005471 ) ) ( not ( = ?auto_2005469 ?auto_2005474 ) ) ( not ( = ?auto_2005468 ?auto_2005471 ) ) ( not ( = ?auto_2005470 ?auto_2005474 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2005467 ?auto_2005464 ?auto_2005465 ?auto_2005466 )
      ( GET-4IMAGE-VERIFY ?auto_2005465 ?auto_2005466 ?auto_2005467 ?auto_2005464 ?auto_2005469 ?auto_2005468 ?auto_2005470 ?auto_2005471 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2017176 - DIRECTION
      ?auto_2017177 - MODE
      ?auto_2017178 - DIRECTION
      ?auto_2017175 - MODE
      ?auto_2017180 - DIRECTION
      ?auto_2017179 - MODE
      ?auto_2017181 - DIRECTION
      ?auto_2017182 - MODE
    )
    :vars
    (
      ?auto_2017183 - INSTRUMENT
      ?auto_2017185 - SATELLITE
      ?auto_2017184 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2017178 ?auto_2017176 ) ) ( not ( = ?auto_2017180 ?auto_2017176 ) ) ( not ( = ?auto_2017180 ?auto_2017178 ) ) ( not ( = ?auto_2017181 ?auto_2017176 ) ) ( not ( = ?auto_2017181 ?auto_2017178 ) ) ( not ( = ?auto_2017181 ?auto_2017180 ) ) ( ON_BOARD ?auto_2017183 ?auto_2017185 ) ( SUPPORTS ?auto_2017183 ?auto_2017182 ) ( POINTING ?auto_2017185 ?auto_2017184 ) ( not ( = ?auto_2017181 ?auto_2017184 ) ) ( HAVE_IMAGE ?auto_2017176 ?auto_2017177 ) ( not ( = ?auto_2017176 ?auto_2017184 ) ) ( not ( = ?auto_2017177 ?auto_2017182 ) ) ( CALIBRATION_TARGET ?auto_2017183 ?auto_2017184 ) ( POWER_AVAIL ?auto_2017185 ) ( HAVE_IMAGE ?auto_2017178 ?auto_2017175 ) ( HAVE_IMAGE ?auto_2017180 ?auto_2017179 ) ( not ( = ?auto_2017177 ?auto_2017175 ) ) ( not ( = ?auto_2017177 ?auto_2017179 ) ) ( not ( = ?auto_2017178 ?auto_2017184 ) ) ( not ( = ?auto_2017175 ?auto_2017179 ) ) ( not ( = ?auto_2017175 ?auto_2017182 ) ) ( not ( = ?auto_2017180 ?auto_2017184 ) ) ( not ( = ?auto_2017179 ?auto_2017182 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2017176 ?auto_2017177 ?auto_2017181 ?auto_2017182 )
      ( GET-4IMAGE-VERIFY ?auto_2017176 ?auto_2017177 ?auto_2017178 ?auto_2017175 ?auto_2017180 ?auto_2017179 ?auto_2017181 ?auto_2017182 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2017209 - DIRECTION
      ?auto_2017210 - MODE
      ?auto_2017211 - DIRECTION
      ?auto_2017208 - MODE
      ?auto_2017213 - DIRECTION
      ?auto_2017212 - MODE
      ?auto_2017214 - DIRECTION
      ?auto_2017215 - MODE
    )
    :vars
    (
      ?auto_2017216 - INSTRUMENT
      ?auto_2017218 - SATELLITE
      ?auto_2017217 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2017211 ?auto_2017209 ) ) ( not ( = ?auto_2017213 ?auto_2017209 ) ) ( not ( = ?auto_2017213 ?auto_2017211 ) ) ( not ( = ?auto_2017214 ?auto_2017209 ) ) ( not ( = ?auto_2017214 ?auto_2017211 ) ) ( not ( = ?auto_2017214 ?auto_2017213 ) ) ( ON_BOARD ?auto_2017216 ?auto_2017218 ) ( SUPPORTS ?auto_2017216 ?auto_2017212 ) ( POINTING ?auto_2017218 ?auto_2017217 ) ( not ( = ?auto_2017213 ?auto_2017217 ) ) ( HAVE_IMAGE ?auto_2017209 ?auto_2017210 ) ( not ( = ?auto_2017209 ?auto_2017217 ) ) ( not ( = ?auto_2017210 ?auto_2017212 ) ) ( CALIBRATION_TARGET ?auto_2017216 ?auto_2017217 ) ( POWER_AVAIL ?auto_2017218 ) ( HAVE_IMAGE ?auto_2017211 ?auto_2017208 ) ( HAVE_IMAGE ?auto_2017214 ?auto_2017215 ) ( not ( = ?auto_2017210 ?auto_2017208 ) ) ( not ( = ?auto_2017210 ?auto_2017215 ) ) ( not ( = ?auto_2017211 ?auto_2017217 ) ) ( not ( = ?auto_2017208 ?auto_2017212 ) ) ( not ( = ?auto_2017208 ?auto_2017215 ) ) ( not ( = ?auto_2017212 ?auto_2017215 ) ) ( not ( = ?auto_2017214 ?auto_2017217 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2017209 ?auto_2017210 ?auto_2017213 ?auto_2017212 )
      ( GET-4IMAGE-VERIFY ?auto_2017209 ?auto_2017210 ?auto_2017211 ?auto_2017208 ?auto_2017213 ?auto_2017212 ?auto_2017214 ?auto_2017215 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2017368 - DIRECTION
      ?auto_2017369 - MODE
      ?auto_2017370 - DIRECTION
      ?auto_2017367 - MODE
      ?auto_2017372 - DIRECTION
      ?auto_2017371 - MODE
      ?auto_2017373 - DIRECTION
      ?auto_2017374 - MODE
    )
    :vars
    (
      ?auto_2017375 - INSTRUMENT
      ?auto_2017377 - SATELLITE
      ?auto_2017376 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2017370 ?auto_2017368 ) ) ( not ( = ?auto_2017372 ?auto_2017368 ) ) ( not ( = ?auto_2017372 ?auto_2017370 ) ) ( not ( = ?auto_2017373 ?auto_2017368 ) ) ( not ( = ?auto_2017373 ?auto_2017370 ) ) ( not ( = ?auto_2017373 ?auto_2017372 ) ) ( ON_BOARD ?auto_2017375 ?auto_2017377 ) ( SUPPORTS ?auto_2017375 ?auto_2017367 ) ( POINTING ?auto_2017377 ?auto_2017376 ) ( not ( = ?auto_2017370 ?auto_2017376 ) ) ( HAVE_IMAGE ?auto_2017368 ?auto_2017369 ) ( not ( = ?auto_2017368 ?auto_2017376 ) ) ( not ( = ?auto_2017369 ?auto_2017367 ) ) ( CALIBRATION_TARGET ?auto_2017375 ?auto_2017376 ) ( POWER_AVAIL ?auto_2017377 ) ( HAVE_IMAGE ?auto_2017372 ?auto_2017371 ) ( HAVE_IMAGE ?auto_2017373 ?auto_2017374 ) ( not ( = ?auto_2017369 ?auto_2017371 ) ) ( not ( = ?auto_2017369 ?auto_2017374 ) ) ( not ( = ?auto_2017367 ?auto_2017371 ) ) ( not ( = ?auto_2017367 ?auto_2017374 ) ) ( not ( = ?auto_2017372 ?auto_2017376 ) ) ( not ( = ?auto_2017371 ?auto_2017374 ) ) ( not ( = ?auto_2017373 ?auto_2017376 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2017368 ?auto_2017369 ?auto_2017370 ?auto_2017367 )
      ( GET-4IMAGE-VERIFY ?auto_2017368 ?auto_2017369 ?auto_2017370 ?auto_2017367 ?auto_2017372 ?auto_2017371 ?auto_2017373 ?auto_2017374 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2018395 - DIRECTION
      ?auto_2018396 - MODE
      ?auto_2018397 - DIRECTION
      ?auto_2018394 - MODE
      ?auto_2018399 - DIRECTION
      ?auto_2018398 - MODE
      ?auto_2018400 - DIRECTION
      ?auto_2018401 - MODE
    )
    :vars
    (
      ?auto_2018402 - INSTRUMENT
      ?auto_2018404 - SATELLITE
      ?auto_2018403 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2018397 ?auto_2018395 ) ) ( not ( = ?auto_2018399 ?auto_2018395 ) ) ( not ( = ?auto_2018399 ?auto_2018397 ) ) ( not ( = ?auto_2018400 ?auto_2018395 ) ) ( not ( = ?auto_2018400 ?auto_2018397 ) ) ( not ( = ?auto_2018400 ?auto_2018399 ) ) ( ON_BOARD ?auto_2018402 ?auto_2018404 ) ( SUPPORTS ?auto_2018402 ?auto_2018396 ) ( POINTING ?auto_2018404 ?auto_2018403 ) ( not ( = ?auto_2018395 ?auto_2018403 ) ) ( HAVE_IMAGE ?auto_2018397 ?auto_2018394 ) ( not ( = ?auto_2018397 ?auto_2018403 ) ) ( not ( = ?auto_2018394 ?auto_2018396 ) ) ( CALIBRATION_TARGET ?auto_2018402 ?auto_2018403 ) ( POWER_AVAIL ?auto_2018404 ) ( HAVE_IMAGE ?auto_2018399 ?auto_2018398 ) ( HAVE_IMAGE ?auto_2018400 ?auto_2018401 ) ( not ( = ?auto_2018396 ?auto_2018398 ) ) ( not ( = ?auto_2018396 ?auto_2018401 ) ) ( not ( = ?auto_2018394 ?auto_2018398 ) ) ( not ( = ?auto_2018394 ?auto_2018401 ) ) ( not ( = ?auto_2018399 ?auto_2018403 ) ) ( not ( = ?auto_2018398 ?auto_2018401 ) ) ( not ( = ?auto_2018400 ?auto_2018403 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2018397 ?auto_2018394 ?auto_2018395 ?auto_2018396 )
      ( GET-4IMAGE-VERIFY ?auto_2018395 ?auto_2018396 ?auto_2018397 ?auto_2018394 ?auto_2018399 ?auto_2018398 ?auto_2018400 ?auto_2018401 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2029717 - DIRECTION
      ?auto_2029718 - MODE
      ?auto_2029719 - DIRECTION
      ?auto_2029716 - MODE
      ?auto_2029721 - DIRECTION
      ?auto_2029720 - MODE
    )
    :vars
    (
      ?auto_2029723 - INSTRUMENT
      ?auto_2029725 - SATELLITE
      ?auto_2029722 - DIRECTION
      ?auto_2029724 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2029719 ?auto_2029717 ) ) ( not ( = ?auto_2029721 ?auto_2029717 ) ) ( not ( = ?auto_2029721 ?auto_2029719 ) ) ( ON_BOARD ?auto_2029723 ?auto_2029725 ) ( SUPPORTS ?auto_2029723 ?auto_2029720 ) ( not ( = ?auto_2029721 ?auto_2029722 ) ) ( HAVE_IMAGE ?auto_2029717 ?auto_2029718 ) ( not ( = ?auto_2029717 ?auto_2029722 ) ) ( not ( = ?auto_2029718 ?auto_2029720 ) ) ( CALIBRATION_TARGET ?auto_2029723 ?auto_2029722 ) ( POWER_AVAIL ?auto_2029725 ) ( POINTING ?auto_2029725 ?auto_2029724 ) ( not ( = ?auto_2029722 ?auto_2029724 ) ) ( not ( = ?auto_2029721 ?auto_2029724 ) ) ( not ( = ?auto_2029717 ?auto_2029724 ) ) ( HAVE_IMAGE ?auto_2029719 ?auto_2029716 ) ( not ( = ?auto_2029718 ?auto_2029716 ) ) ( not ( = ?auto_2029719 ?auto_2029722 ) ) ( not ( = ?auto_2029719 ?auto_2029724 ) ) ( not ( = ?auto_2029716 ?auto_2029720 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2029717 ?auto_2029718 ?auto_2029721 ?auto_2029720 )
      ( GET-3IMAGE-VERIFY ?auto_2029717 ?auto_2029718 ?auto_2029719 ?auto_2029716 ?auto_2029721 ?auto_2029720 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2029746 - DIRECTION
      ?auto_2029747 - MODE
      ?auto_2029748 - DIRECTION
      ?auto_2029745 - MODE
      ?auto_2029750 - DIRECTION
      ?auto_2029749 - MODE
    )
    :vars
    (
      ?auto_2029752 - INSTRUMENT
      ?auto_2029754 - SATELLITE
      ?auto_2029751 - DIRECTION
      ?auto_2029753 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2029748 ?auto_2029746 ) ) ( not ( = ?auto_2029750 ?auto_2029746 ) ) ( not ( = ?auto_2029750 ?auto_2029748 ) ) ( ON_BOARD ?auto_2029752 ?auto_2029754 ) ( SUPPORTS ?auto_2029752 ?auto_2029745 ) ( not ( = ?auto_2029748 ?auto_2029751 ) ) ( HAVE_IMAGE ?auto_2029746 ?auto_2029747 ) ( not ( = ?auto_2029746 ?auto_2029751 ) ) ( not ( = ?auto_2029747 ?auto_2029745 ) ) ( CALIBRATION_TARGET ?auto_2029752 ?auto_2029751 ) ( POWER_AVAIL ?auto_2029754 ) ( POINTING ?auto_2029754 ?auto_2029753 ) ( not ( = ?auto_2029751 ?auto_2029753 ) ) ( not ( = ?auto_2029748 ?auto_2029753 ) ) ( not ( = ?auto_2029746 ?auto_2029753 ) ) ( HAVE_IMAGE ?auto_2029750 ?auto_2029749 ) ( not ( = ?auto_2029747 ?auto_2029749 ) ) ( not ( = ?auto_2029745 ?auto_2029749 ) ) ( not ( = ?auto_2029750 ?auto_2029751 ) ) ( not ( = ?auto_2029750 ?auto_2029753 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2029746 ?auto_2029747 ?auto_2029748 ?auto_2029745 )
      ( GET-3IMAGE-VERIFY ?auto_2029746 ?auto_2029747 ?auto_2029748 ?auto_2029745 ?auto_2029750 ?auto_2029749 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2029908 - DIRECTION
      ?auto_2029909 - MODE
      ?auto_2029910 - DIRECTION
      ?auto_2029907 - MODE
      ?auto_2029912 - DIRECTION
      ?auto_2029911 - MODE
    )
    :vars
    (
      ?auto_2029914 - INSTRUMENT
      ?auto_2029916 - SATELLITE
      ?auto_2029913 - DIRECTION
      ?auto_2029915 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2029910 ?auto_2029908 ) ) ( not ( = ?auto_2029912 ?auto_2029908 ) ) ( not ( = ?auto_2029912 ?auto_2029910 ) ) ( ON_BOARD ?auto_2029914 ?auto_2029916 ) ( SUPPORTS ?auto_2029914 ?auto_2029909 ) ( not ( = ?auto_2029908 ?auto_2029913 ) ) ( HAVE_IMAGE ?auto_2029910 ?auto_2029907 ) ( not ( = ?auto_2029910 ?auto_2029913 ) ) ( not ( = ?auto_2029907 ?auto_2029909 ) ) ( CALIBRATION_TARGET ?auto_2029914 ?auto_2029913 ) ( POWER_AVAIL ?auto_2029916 ) ( POINTING ?auto_2029916 ?auto_2029915 ) ( not ( = ?auto_2029913 ?auto_2029915 ) ) ( not ( = ?auto_2029908 ?auto_2029915 ) ) ( not ( = ?auto_2029910 ?auto_2029915 ) ) ( HAVE_IMAGE ?auto_2029912 ?auto_2029911 ) ( not ( = ?auto_2029909 ?auto_2029911 ) ) ( not ( = ?auto_2029907 ?auto_2029911 ) ) ( not ( = ?auto_2029912 ?auto_2029913 ) ) ( not ( = ?auto_2029912 ?auto_2029915 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2029910 ?auto_2029907 ?auto_2029908 ?auto_2029909 )
      ( GET-3IMAGE-VERIFY ?auto_2029908 ?auto_2029909 ?auto_2029910 ?auto_2029907 ?auto_2029912 ?auto_2029911 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2030161 - DIRECTION
      ?auto_2030162 - MODE
      ?auto_2030163 - DIRECTION
      ?auto_2030160 - MODE
      ?auto_2030165 - DIRECTION
      ?auto_2030164 - MODE
      ?auto_2030166 - DIRECTION
      ?auto_2030167 - MODE
    )
    :vars
    (
      ?auto_2030169 - INSTRUMENT
      ?auto_2030170 - SATELLITE
      ?auto_2030168 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2030163 ?auto_2030161 ) ) ( not ( = ?auto_2030165 ?auto_2030161 ) ) ( not ( = ?auto_2030165 ?auto_2030163 ) ) ( not ( = ?auto_2030166 ?auto_2030161 ) ) ( not ( = ?auto_2030166 ?auto_2030163 ) ) ( not ( = ?auto_2030166 ?auto_2030165 ) ) ( ON_BOARD ?auto_2030169 ?auto_2030170 ) ( SUPPORTS ?auto_2030169 ?auto_2030167 ) ( not ( = ?auto_2030166 ?auto_2030168 ) ) ( HAVE_IMAGE ?auto_2030161 ?auto_2030162 ) ( not ( = ?auto_2030161 ?auto_2030168 ) ) ( not ( = ?auto_2030162 ?auto_2030167 ) ) ( CALIBRATION_TARGET ?auto_2030169 ?auto_2030168 ) ( POWER_AVAIL ?auto_2030170 ) ( POINTING ?auto_2030170 ?auto_2030165 ) ( not ( = ?auto_2030168 ?auto_2030165 ) ) ( HAVE_IMAGE ?auto_2030163 ?auto_2030160 ) ( HAVE_IMAGE ?auto_2030165 ?auto_2030164 ) ( not ( = ?auto_2030162 ?auto_2030160 ) ) ( not ( = ?auto_2030162 ?auto_2030164 ) ) ( not ( = ?auto_2030163 ?auto_2030168 ) ) ( not ( = ?auto_2030160 ?auto_2030164 ) ) ( not ( = ?auto_2030160 ?auto_2030167 ) ) ( not ( = ?auto_2030164 ?auto_2030167 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2030161 ?auto_2030162 ?auto_2030166 ?auto_2030167 )
      ( GET-4IMAGE-VERIFY ?auto_2030161 ?auto_2030162 ?auto_2030163 ?auto_2030160 ?auto_2030165 ?auto_2030164 ?auto_2030166 ?auto_2030167 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2030196 - DIRECTION
      ?auto_2030197 - MODE
      ?auto_2030198 - DIRECTION
      ?auto_2030195 - MODE
      ?auto_2030200 - DIRECTION
      ?auto_2030199 - MODE
      ?auto_2030201 - DIRECTION
      ?auto_2030202 - MODE
    )
    :vars
    (
      ?auto_2030204 - INSTRUMENT
      ?auto_2030205 - SATELLITE
      ?auto_2030203 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2030198 ?auto_2030196 ) ) ( not ( = ?auto_2030200 ?auto_2030196 ) ) ( not ( = ?auto_2030200 ?auto_2030198 ) ) ( not ( = ?auto_2030201 ?auto_2030196 ) ) ( not ( = ?auto_2030201 ?auto_2030198 ) ) ( not ( = ?auto_2030201 ?auto_2030200 ) ) ( ON_BOARD ?auto_2030204 ?auto_2030205 ) ( SUPPORTS ?auto_2030204 ?auto_2030199 ) ( not ( = ?auto_2030200 ?auto_2030203 ) ) ( HAVE_IMAGE ?auto_2030196 ?auto_2030197 ) ( not ( = ?auto_2030196 ?auto_2030203 ) ) ( not ( = ?auto_2030197 ?auto_2030199 ) ) ( CALIBRATION_TARGET ?auto_2030204 ?auto_2030203 ) ( POWER_AVAIL ?auto_2030205 ) ( POINTING ?auto_2030205 ?auto_2030201 ) ( not ( = ?auto_2030203 ?auto_2030201 ) ) ( HAVE_IMAGE ?auto_2030198 ?auto_2030195 ) ( HAVE_IMAGE ?auto_2030201 ?auto_2030202 ) ( not ( = ?auto_2030197 ?auto_2030195 ) ) ( not ( = ?auto_2030197 ?auto_2030202 ) ) ( not ( = ?auto_2030198 ?auto_2030203 ) ) ( not ( = ?auto_2030195 ?auto_2030199 ) ) ( not ( = ?auto_2030195 ?auto_2030202 ) ) ( not ( = ?auto_2030199 ?auto_2030202 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2030196 ?auto_2030197 ?auto_2030200 ?auto_2030199 )
      ( GET-4IMAGE-VERIFY ?auto_2030196 ?auto_2030197 ?auto_2030198 ?auto_2030195 ?auto_2030200 ?auto_2030199 ?auto_2030201 ?auto_2030202 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2030230 - DIRECTION
      ?auto_2030231 - MODE
      ?auto_2030232 - DIRECTION
      ?auto_2030229 - MODE
      ?auto_2030234 - DIRECTION
      ?auto_2030233 - MODE
      ?auto_2030235 - DIRECTION
      ?auto_2030236 - MODE
    )
    :vars
    (
      ?auto_2030238 - INSTRUMENT
      ?auto_2030239 - SATELLITE
      ?auto_2030237 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2030232 ?auto_2030230 ) ) ( not ( = ?auto_2030234 ?auto_2030230 ) ) ( not ( = ?auto_2030234 ?auto_2030232 ) ) ( not ( = ?auto_2030235 ?auto_2030230 ) ) ( not ( = ?auto_2030235 ?auto_2030232 ) ) ( not ( = ?auto_2030235 ?auto_2030234 ) ) ( ON_BOARD ?auto_2030238 ?auto_2030239 ) ( SUPPORTS ?auto_2030238 ?auto_2030236 ) ( not ( = ?auto_2030235 ?auto_2030237 ) ) ( HAVE_IMAGE ?auto_2030230 ?auto_2030231 ) ( not ( = ?auto_2030230 ?auto_2030237 ) ) ( not ( = ?auto_2030231 ?auto_2030236 ) ) ( CALIBRATION_TARGET ?auto_2030238 ?auto_2030237 ) ( POWER_AVAIL ?auto_2030239 ) ( POINTING ?auto_2030239 ?auto_2030232 ) ( not ( = ?auto_2030237 ?auto_2030232 ) ) ( HAVE_IMAGE ?auto_2030232 ?auto_2030229 ) ( HAVE_IMAGE ?auto_2030234 ?auto_2030233 ) ( not ( = ?auto_2030231 ?auto_2030229 ) ) ( not ( = ?auto_2030231 ?auto_2030233 ) ) ( not ( = ?auto_2030229 ?auto_2030233 ) ) ( not ( = ?auto_2030229 ?auto_2030236 ) ) ( not ( = ?auto_2030234 ?auto_2030237 ) ) ( not ( = ?auto_2030233 ?auto_2030236 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2030230 ?auto_2030231 ?auto_2030235 ?auto_2030236 )
      ( GET-4IMAGE-VERIFY ?auto_2030230 ?auto_2030231 ?auto_2030232 ?auto_2030229 ?auto_2030234 ?auto_2030233 ?auto_2030235 ?auto_2030236 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2030263 - DIRECTION
      ?auto_2030264 - MODE
      ?auto_2030265 - DIRECTION
      ?auto_2030262 - MODE
      ?auto_2030267 - DIRECTION
      ?auto_2030266 - MODE
      ?auto_2030268 - DIRECTION
      ?auto_2030269 - MODE
    )
    :vars
    (
      ?auto_2030271 - INSTRUMENT
      ?auto_2030272 - SATELLITE
      ?auto_2030270 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2030265 ?auto_2030263 ) ) ( not ( = ?auto_2030267 ?auto_2030263 ) ) ( not ( = ?auto_2030267 ?auto_2030265 ) ) ( not ( = ?auto_2030268 ?auto_2030263 ) ) ( not ( = ?auto_2030268 ?auto_2030265 ) ) ( not ( = ?auto_2030268 ?auto_2030267 ) ) ( ON_BOARD ?auto_2030271 ?auto_2030272 ) ( SUPPORTS ?auto_2030271 ?auto_2030266 ) ( not ( = ?auto_2030267 ?auto_2030270 ) ) ( HAVE_IMAGE ?auto_2030263 ?auto_2030264 ) ( not ( = ?auto_2030263 ?auto_2030270 ) ) ( not ( = ?auto_2030264 ?auto_2030266 ) ) ( CALIBRATION_TARGET ?auto_2030271 ?auto_2030270 ) ( POWER_AVAIL ?auto_2030272 ) ( POINTING ?auto_2030272 ?auto_2030265 ) ( not ( = ?auto_2030270 ?auto_2030265 ) ) ( HAVE_IMAGE ?auto_2030265 ?auto_2030262 ) ( HAVE_IMAGE ?auto_2030268 ?auto_2030269 ) ( not ( = ?auto_2030264 ?auto_2030262 ) ) ( not ( = ?auto_2030264 ?auto_2030269 ) ) ( not ( = ?auto_2030262 ?auto_2030266 ) ) ( not ( = ?auto_2030262 ?auto_2030269 ) ) ( not ( = ?auto_2030266 ?auto_2030269 ) ) ( not ( = ?auto_2030268 ?auto_2030270 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2030263 ?auto_2030264 ?auto_2030267 ?auto_2030266 )
      ( GET-4IMAGE-VERIFY ?auto_2030263 ?auto_2030264 ?auto_2030265 ?auto_2030262 ?auto_2030267 ?auto_2030266 ?auto_2030268 ?auto_2030269 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2030367 - DIRECTION
      ?auto_2030368 - MODE
      ?auto_2030369 - DIRECTION
      ?auto_2030366 - MODE
      ?auto_2030371 - DIRECTION
      ?auto_2030370 - MODE
      ?auto_2030372 - DIRECTION
      ?auto_2030373 - MODE
    )
    :vars
    (
      ?auto_2030375 - INSTRUMENT
      ?auto_2030376 - SATELLITE
      ?auto_2030374 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2030369 ?auto_2030367 ) ) ( not ( = ?auto_2030371 ?auto_2030367 ) ) ( not ( = ?auto_2030371 ?auto_2030369 ) ) ( not ( = ?auto_2030372 ?auto_2030367 ) ) ( not ( = ?auto_2030372 ?auto_2030369 ) ) ( not ( = ?auto_2030372 ?auto_2030371 ) ) ( ON_BOARD ?auto_2030375 ?auto_2030376 ) ( SUPPORTS ?auto_2030375 ?auto_2030366 ) ( not ( = ?auto_2030369 ?auto_2030374 ) ) ( HAVE_IMAGE ?auto_2030367 ?auto_2030368 ) ( not ( = ?auto_2030367 ?auto_2030374 ) ) ( not ( = ?auto_2030368 ?auto_2030366 ) ) ( CALIBRATION_TARGET ?auto_2030375 ?auto_2030374 ) ( POWER_AVAIL ?auto_2030376 ) ( POINTING ?auto_2030376 ?auto_2030372 ) ( not ( = ?auto_2030374 ?auto_2030372 ) ) ( HAVE_IMAGE ?auto_2030371 ?auto_2030370 ) ( HAVE_IMAGE ?auto_2030372 ?auto_2030373 ) ( not ( = ?auto_2030368 ?auto_2030370 ) ) ( not ( = ?auto_2030368 ?auto_2030373 ) ) ( not ( = ?auto_2030366 ?auto_2030370 ) ) ( not ( = ?auto_2030366 ?auto_2030373 ) ) ( not ( = ?auto_2030371 ?auto_2030374 ) ) ( not ( = ?auto_2030370 ?auto_2030373 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2030367 ?auto_2030368 ?auto_2030369 ?auto_2030366 )
      ( GET-4IMAGE-VERIFY ?auto_2030367 ?auto_2030368 ?auto_2030369 ?auto_2030366 ?auto_2030371 ?auto_2030370 ?auto_2030372 ?auto_2030373 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2030401 - DIRECTION
      ?auto_2030402 - MODE
      ?auto_2030403 - DIRECTION
      ?auto_2030400 - MODE
      ?auto_2030405 - DIRECTION
      ?auto_2030404 - MODE
      ?auto_2030406 - DIRECTION
      ?auto_2030407 - MODE
    )
    :vars
    (
      ?auto_2030409 - INSTRUMENT
      ?auto_2030410 - SATELLITE
      ?auto_2030408 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2030403 ?auto_2030401 ) ) ( not ( = ?auto_2030405 ?auto_2030401 ) ) ( not ( = ?auto_2030405 ?auto_2030403 ) ) ( not ( = ?auto_2030406 ?auto_2030401 ) ) ( not ( = ?auto_2030406 ?auto_2030403 ) ) ( not ( = ?auto_2030406 ?auto_2030405 ) ) ( ON_BOARD ?auto_2030409 ?auto_2030410 ) ( SUPPORTS ?auto_2030409 ?auto_2030400 ) ( not ( = ?auto_2030403 ?auto_2030408 ) ) ( HAVE_IMAGE ?auto_2030401 ?auto_2030402 ) ( not ( = ?auto_2030401 ?auto_2030408 ) ) ( not ( = ?auto_2030402 ?auto_2030400 ) ) ( CALIBRATION_TARGET ?auto_2030409 ?auto_2030408 ) ( POWER_AVAIL ?auto_2030410 ) ( POINTING ?auto_2030410 ?auto_2030405 ) ( not ( = ?auto_2030408 ?auto_2030405 ) ) ( HAVE_IMAGE ?auto_2030405 ?auto_2030404 ) ( HAVE_IMAGE ?auto_2030406 ?auto_2030407 ) ( not ( = ?auto_2030402 ?auto_2030404 ) ) ( not ( = ?auto_2030402 ?auto_2030407 ) ) ( not ( = ?auto_2030400 ?auto_2030404 ) ) ( not ( = ?auto_2030400 ?auto_2030407 ) ) ( not ( = ?auto_2030404 ?auto_2030407 ) ) ( not ( = ?auto_2030406 ?auto_2030408 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2030401 ?auto_2030402 ?auto_2030403 ?auto_2030400 )
      ( GET-4IMAGE-VERIFY ?auto_2030401 ?auto_2030402 ?auto_2030403 ?auto_2030400 ?auto_2030405 ?auto_2030404 ?auto_2030406 ?auto_2030407 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2030938 - DIRECTION
      ?auto_2030939 - MODE
      ?auto_2030940 - DIRECTION
      ?auto_2030937 - MODE
      ?auto_2030942 - DIRECTION
      ?auto_2030941 - MODE
      ?auto_2030943 - DIRECTION
      ?auto_2030944 - MODE
    )
    :vars
    (
      ?auto_2030946 - INSTRUMENT
      ?auto_2030947 - SATELLITE
      ?auto_2030945 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2030940 ?auto_2030938 ) ) ( not ( = ?auto_2030942 ?auto_2030938 ) ) ( not ( = ?auto_2030942 ?auto_2030940 ) ) ( not ( = ?auto_2030943 ?auto_2030938 ) ) ( not ( = ?auto_2030943 ?auto_2030940 ) ) ( not ( = ?auto_2030943 ?auto_2030942 ) ) ( ON_BOARD ?auto_2030946 ?auto_2030947 ) ( SUPPORTS ?auto_2030946 ?auto_2030944 ) ( not ( = ?auto_2030943 ?auto_2030945 ) ) ( HAVE_IMAGE ?auto_2030940 ?auto_2030937 ) ( not ( = ?auto_2030940 ?auto_2030945 ) ) ( not ( = ?auto_2030937 ?auto_2030944 ) ) ( CALIBRATION_TARGET ?auto_2030946 ?auto_2030945 ) ( POWER_AVAIL ?auto_2030947 ) ( POINTING ?auto_2030947 ?auto_2030938 ) ( not ( = ?auto_2030945 ?auto_2030938 ) ) ( HAVE_IMAGE ?auto_2030938 ?auto_2030939 ) ( HAVE_IMAGE ?auto_2030942 ?auto_2030941 ) ( not ( = ?auto_2030939 ?auto_2030937 ) ) ( not ( = ?auto_2030939 ?auto_2030941 ) ) ( not ( = ?auto_2030939 ?auto_2030944 ) ) ( not ( = ?auto_2030937 ?auto_2030941 ) ) ( not ( = ?auto_2030942 ?auto_2030945 ) ) ( not ( = ?auto_2030941 ?auto_2030944 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2030940 ?auto_2030937 ?auto_2030943 ?auto_2030944 )
      ( GET-4IMAGE-VERIFY ?auto_2030938 ?auto_2030939 ?auto_2030940 ?auto_2030937 ?auto_2030942 ?auto_2030941 ?auto_2030943 ?auto_2030944 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2030971 - DIRECTION
      ?auto_2030972 - MODE
      ?auto_2030973 - DIRECTION
      ?auto_2030970 - MODE
      ?auto_2030975 - DIRECTION
      ?auto_2030974 - MODE
      ?auto_2030976 - DIRECTION
      ?auto_2030977 - MODE
    )
    :vars
    (
      ?auto_2030979 - INSTRUMENT
      ?auto_2030980 - SATELLITE
      ?auto_2030978 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2030973 ?auto_2030971 ) ) ( not ( = ?auto_2030975 ?auto_2030971 ) ) ( not ( = ?auto_2030975 ?auto_2030973 ) ) ( not ( = ?auto_2030976 ?auto_2030971 ) ) ( not ( = ?auto_2030976 ?auto_2030973 ) ) ( not ( = ?auto_2030976 ?auto_2030975 ) ) ( ON_BOARD ?auto_2030979 ?auto_2030980 ) ( SUPPORTS ?auto_2030979 ?auto_2030974 ) ( not ( = ?auto_2030975 ?auto_2030978 ) ) ( HAVE_IMAGE ?auto_2030973 ?auto_2030970 ) ( not ( = ?auto_2030973 ?auto_2030978 ) ) ( not ( = ?auto_2030970 ?auto_2030974 ) ) ( CALIBRATION_TARGET ?auto_2030979 ?auto_2030978 ) ( POWER_AVAIL ?auto_2030980 ) ( POINTING ?auto_2030980 ?auto_2030971 ) ( not ( = ?auto_2030978 ?auto_2030971 ) ) ( HAVE_IMAGE ?auto_2030971 ?auto_2030972 ) ( HAVE_IMAGE ?auto_2030976 ?auto_2030977 ) ( not ( = ?auto_2030972 ?auto_2030970 ) ) ( not ( = ?auto_2030972 ?auto_2030974 ) ) ( not ( = ?auto_2030972 ?auto_2030977 ) ) ( not ( = ?auto_2030970 ?auto_2030977 ) ) ( not ( = ?auto_2030974 ?auto_2030977 ) ) ( not ( = ?auto_2030976 ?auto_2030978 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2030973 ?auto_2030970 ?auto_2030975 ?auto_2030974 )
      ( GET-4IMAGE-VERIFY ?auto_2030971 ?auto_2030972 ?auto_2030973 ?auto_2030970 ?auto_2030975 ?auto_2030974 ?auto_2030976 ?auto_2030977 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2031183 - DIRECTION
      ?auto_2031184 - MODE
      ?auto_2031185 - DIRECTION
      ?auto_2031182 - MODE
      ?auto_2031187 - DIRECTION
      ?auto_2031186 - MODE
      ?auto_2031188 - DIRECTION
      ?auto_2031189 - MODE
    )
    :vars
    (
      ?auto_2031191 - INSTRUMENT
      ?auto_2031192 - SATELLITE
      ?auto_2031190 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2031185 ?auto_2031183 ) ) ( not ( = ?auto_2031187 ?auto_2031183 ) ) ( not ( = ?auto_2031187 ?auto_2031185 ) ) ( not ( = ?auto_2031188 ?auto_2031183 ) ) ( not ( = ?auto_2031188 ?auto_2031185 ) ) ( not ( = ?auto_2031188 ?auto_2031187 ) ) ( ON_BOARD ?auto_2031191 ?auto_2031192 ) ( SUPPORTS ?auto_2031191 ?auto_2031182 ) ( not ( = ?auto_2031185 ?auto_2031190 ) ) ( HAVE_IMAGE ?auto_2031187 ?auto_2031186 ) ( not ( = ?auto_2031187 ?auto_2031190 ) ) ( not ( = ?auto_2031186 ?auto_2031182 ) ) ( CALIBRATION_TARGET ?auto_2031191 ?auto_2031190 ) ( POWER_AVAIL ?auto_2031192 ) ( POINTING ?auto_2031192 ?auto_2031183 ) ( not ( = ?auto_2031190 ?auto_2031183 ) ) ( HAVE_IMAGE ?auto_2031183 ?auto_2031184 ) ( HAVE_IMAGE ?auto_2031188 ?auto_2031189 ) ( not ( = ?auto_2031184 ?auto_2031182 ) ) ( not ( = ?auto_2031184 ?auto_2031186 ) ) ( not ( = ?auto_2031184 ?auto_2031189 ) ) ( not ( = ?auto_2031182 ?auto_2031189 ) ) ( not ( = ?auto_2031186 ?auto_2031189 ) ) ( not ( = ?auto_2031188 ?auto_2031190 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2031187 ?auto_2031186 ?auto_2031185 ?auto_2031182 )
      ( GET-4IMAGE-VERIFY ?auto_2031183 ?auto_2031184 ?auto_2031185 ?auto_2031182 ?auto_2031187 ?auto_2031186 ?auto_2031188 ?auto_2031189 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2031434 - DIRECTION
      ?auto_2031435 - MODE
      ?auto_2031436 - DIRECTION
      ?auto_2031433 - MODE
      ?auto_2031438 - DIRECTION
      ?auto_2031437 - MODE
      ?auto_2031439 - DIRECTION
      ?auto_2031440 - MODE
    )
    :vars
    (
      ?auto_2031442 - INSTRUMENT
      ?auto_2031443 - SATELLITE
      ?auto_2031441 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2031436 ?auto_2031434 ) ) ( not ( = ?auto_2031438 ?auto_2031434 ) ) ( not ( = ?auto_2031438 ?auto_2031436 ) ) ( not ( = ?auto_2031439 ?auto_2031434 ) ) ( not ( = ?auto_2031439 ?auto_2031436 ) ) ( not ( = ?auto_2031439 ?auto_2031438 ) ) ( ON_BOARD ?auto_2031442 ?auto_2031443 ) ( SUPPORTS ?auto_2031442 ?auto_2031435 ) ( not ( = ?auto_2031434 ?auto_2031441 ) ) ( HAVE_IMAGE ?auto_2031436 ?auto_2031433 ) ( not ( = ?auto_2031436 ?auto_2031441 ) ) ( not ( = ?auto_2031433 ?auto_2031435 ) ) ( CALIBRATION_TARGET ?auto_2031442 ?auto_2031441 ) ( POWER_AVAIL ?auto_2031443 ) ( POINTING ?auto_2031443 ?auto_2031439 ) ( not ( = ?auto_2031441 ?auto_2031439 ) ) ( HAVE_IMAGE ?auto_2031438 ?auto_2031437 ) ( HAVE_IMAGE ?auto_2031439 ?auto_2031440 ) ( not ( = ?auto_2031435 ?auto_2031437 ) ) ( not ( = ?auto_2031435 ?auto_2031440 ) ) ( not ( = ?auto_2031433 ?auto_2031437 ) ) ( not ( = ?auto_2031433 ?auto_2031440 ) ) ( not ( = ?auto_2031438 ?auto_2031441 ) ) ( not ( = ?auto_2031437 ?auto_2031440 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2031436 ?auto_2031433 ?auto_2031434 ?auto_2031435 )
      ( GET-4IMAGE-VERIFY ?auto_2031434 ?auto_2031435 ?auto_2031436 ?auto_2031433 ?auto_2031438 ?auto_2031437 ?auto_2031439 ?auto_2031440 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2031468 - DIRECTION
      ?auto_2031469 - MODE
      ?auto_2031470 - DIRECTION
      ?auto_2031467 - MODE
      ?auto_2031472 - DIRECTION
      ?auto_2031471 - MODE
      ?auto_2031473 - DIRECTION
      ?auto_2031474 - MODE
    )
    :vars
    (
      ?auto_2031476 - INSTRUMENT
      ?auto_2031477 - SATELLITE
      ?auto_2031475 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2031470 ?auto_2031468 ) ) ( not ( = ?auto_2031472 ?auto_2031468 ) ) ( not ( = ?auto_2031472 ?auto_2031470 ) ) ( not ( = ?auto_2031473 ?auto_2031468 ) ) ( not ( = ?auto_2031473 ?auto_2031470 ) ) ( not ( = ?auto_2031473 ?auto_2031472 ) ) ( ON_BOARD ?auto_2031476 ?auto_2031477 ) ( SUPPORTS ?auto_2031476 ?auto_2031469 ) ( not ( = ?auto_2031468 ?auto_2031475 ) ) ( HAVE_IMAGE ?auto_2031470 ?auto_2031467 ) ( not ( = ?auto_2031470 ?auto_2031475 ) ) ( not ( = ?auto_2031467 ?auto_2031469 ) ) ( CALIBRATION_TARGET ?auto_2031476 ?auto_2031475 ) ( POWER_AVAIL ?auto_2031477 ) ( POINTING ?auto_2031477 ?auto_2031472 ) ( not ( = ?auto_2031475 ?auto_2031472 ) ) ( HAVE_IMAGE ?auto_2031472 ?auto_2031471 ) ( HAVE_IMAGE ?auto_2031473 ?auto_2031474 ) ( not ( = ?auto_2031469 ?auto_2031471 ) ) ( not ( = ?auto_2031469 ?auto_2031474 ) ) ( not ( = ?auto_2031467 ?auto_2031471 ) ) ( not ( = ?auto_2031467 ?auto_2031474 ) ) ( not ( = ?auto_2031471 ?auto_2031474 ) ) ( not ( = ?auto_2031473 ?auto_2031475 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2031470 ?auto_2031467 ?auto_2031468 ?auto_2031469 )
      ( GET-4IMAGE-VERIFY ?auto_2031468 ?auto_2031469 ?auto_2031470 ?auto_2031467 ?auto_2031472 ?auto_2031471 ?auto_2031473 ?auto_2031474 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2031756 - DIRECTION
      ?auto_2031757 - MODE
      ?auto_2031758 - DIRECTION
      ?auto_2031755 - MODE
      ?auto_2031760 - DIRECTION
      ?auto_2031759 - MODE
      ?auto_2031761 - DIRECTION
      ?auto_2031762 - MODE
    )
    :vars
    (
      ?auto_2031764 - INSTRUMENT
      ?auto_2031765 - SATELLITE
      ?auto_2031763 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2031758 ?auto_2031756 ) ) ( not ( = ?auto_2031760 ?auto_2031756 ) ) ( not ( = ?auto_2031760 ?auto_2031758 ) ) ( not ( = ?auto_2031761 ?auto_2031756 ) ) ( not ( = ?auto_2031761 ?auto_2031758 ) ) ( not ( = ?auto_2031761 ?auto_2031760 ) ) ( ON_BOARD ?auto_2031764 ?auto_2031765 ) ( SUPPORTS ?auto_2031764 ?auto_2031757 ) ( not ( = ?auto_2031756 ?auto_2031763 ) ) ( HAVE_IMAGE ?auto_2031760 ?auto_2031759 ) ( not ( = ?auto_2031760 ?auto_2031763 ) ) ( not ( = ?auto_2031759 ?auto_2031757 ) ) ( CALIBRATION_TARGET ?auto_2031764 ?auto_2031763 ) ( POWER_AVAIL ?auto_2031765 ) ( POINTING ?auto_2031765 ?auto_2031758 ) ( not ( = ?auto_2031763 ?auto_2031758 ) ) ( HAVE_IMAGE ?auto_2031758 ?auto_2031755 ) ( HAVE_IMAGE ?auto_2031761 ?auto_2031762 ) ( not ( = ?auto_2031757 ?auto_2031755 ) ) ( not ( = ?auto_2031757 ?auto_2031762 ) ) ( not ( = ?auto_2031755 ?auto_2031759 ) ) ( not ( = ?auto_2031755 ?auto_2031762 ) ) ( not ( = ?auto_2031759 ?auto_2031762 ) ) ( not ( = ?auto_2031761 ?auto_2031763 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2031760 ?auto_2031759 ?auto_2031756 ?auto_2031757 )
      ( GET-4IMAGE-VERIFY ?auto_2031756 ?auto_2031757 ?auto_2031758 ?auto_2031755 ?auto_2031760 ?auto_2031759 ?auto_2031761 ?auto_2031762 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2043002 - DIRECTION
      ?auto_2043003 - MODE
      ?auto_2043004 - DIRECTION
      ?auto_2043001 - MODE
      ?auto_2043006 - DIRECTION
      ?auto_2043005 - MODE
    )
    :vars
    (
      ?auto_2043010 - INSTRUMENT
      ?auto_2043007 - SATELLITE
      ?auto_2043011 - DIRECTION
      ?auto_2043009 - DIRECTION
      ?auto_2043008 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2043004 ?auto_2043002 ) ) ( not ( = ?auto_2043006 ?auto_2043002 ) ) ( not ( = ?auto_2043006 ?auto_2043004 ) ) ( ON_BOARD ?auto_2043010 ?auto_2043007 ) ( SUPPORTS ?auto_2043010 ?auto_2043005 ) ( not ( = ?auto_2043006 ?auto_2043011 ) ) ( HAVE_IMAGE ?auto_2043002 ?auto_2043003 ) ( not ( = ?auto_2043002 ?auto_2043011 ) ) ( not ( = ?auto_2043003 ?auto_2043005 ) ) ( CALIBRATION_TARGET ?auto_2043010 ?auto_2043011 ) ( POINTING ?auto_2043007 ?auto_2043009 ) ( not ( = ?auto_2043011 ?auto_2043009 ) ) ( not ( = ?auto_2043006 ?auto_2043009 ) ) ( not ( = ?auto_2043002 ?auto_2043009 ) ) ( ON_BOARD ?auto_2043008 ?auto_2043007 ) ( POWER_ON ?auto_2043008 ) ( not ( = ?auto_2043010 ?auto_2043008 ) ) ( HAVE_IMAGE ?auto_2043004 ?auto_2043001 ) ( not ( = ?auto_2043003 ?auto_2043001 ) ) ( not ( = ?auto_2043004 ?auto_2043011 ) ) ( not ( = ?auto_2043004 ?auto_2043009 ) ) ( not ( = ?auto_2043001 ?auto_2043005 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2043002 ?auto_2043003 ?auto_2043006 ?auto_2043005 )
      ( GET-3IMAGE-VERIFY ?auto_2043002 ?auto_2043003 ?auto_2043004 ?auto_2043001 ?auto_2043006 ?auto_2043005 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2043034 - DIRECTION
      ?auto_2043035 - MODE
      ?auto_2043036 - DIRECTION
      ?auto_2043033 - MODE
      ?auto_2043038 - DIRECTION
      ?auto_2043037 - MODE
    )
    :vars
    (
      ?auto_2043042 - INSTRUMENT
      ?auto_2043039 - SATELLITE
      ?auto_2043043 - DIRECTION
      ?auto_2043041 - DIRECTION
      ?auto_2043040 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2043036 ?auto_2043034 ) ) ( not ( = ?auto_2043038 ?auto_2043034 ) ) ( not ( = ?auto_2043038 ?auto_2043036 ) ) ( ON_BOARD ?auto_2043042 ?auto_2043039 ) ( SUPPORTS ?auto_2043042 ?auto_2043033 ) ( not ( = ?auto_2043036 ?auto_2043043 ) ) ( HAVE_IMAGE ?auto_2043034 ?auto_2043035 ) ( not ( = ?auto_2043034 ?auto_2043043 ) ) ( not ( = ?auto_2043035 ?auto_2043033 ) ) ( CALIBRATION_TARGET ?auto_2043042 ?auto_2043043 ) ( POINTING ?auto_2043039 ?auto_2043041 ) ( not ( = ?auto_2043043 ?auto_2043041 ) ) ( not ( = ?auto_2043036 ?auto_2043041 ) ) ( not ( = ?auto_2043034 ?auto_2043041 ) ) ( ON_BOARD ?auto_2043040 ?auto_2043039 ) ( POWER_ON ?auto_2043040 ) ( not ( = ?auto_2043042 ?auto_2043040 ) ) ( HAVE_IMAGE ?auto_2043038 ?auto_2043037 ) ( not ( = ?auto_2043035 ?auto_2043037 ) ) ( not ( = ?auto_2043033 ?auto_2043037 ) ) ( not ( = ?auto_2043038 ?auto_2043043 ) ) ( not ( = ?auto_2043038 ?auto_2043041 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2043034 ?auto_2043035 ?auto_2043036 ?auto_2043033 )
      ( GET-3IMAGE-VERIFY ?auto_2043034 ?auto_2043035 ?auto_2043036 ?auto_2043033 ?auto_2043038 ?auto_2043037 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2043208 - DIRECTION
      ?auto_2043209 - MODE
      ?auto_2043210 - DIRECTION
      ?auto_2043207 - MODE
      ?auto_2043212 - DIRECTION
      ?auto_2043211 - MODE
    )
    :vars
    (
      ?auto_2043216 - INSTRUMENT
      ?auto_2043213 - SATELLITE
      ?auto_2043217 - DIRECTION
      ?auto_2043215 - DIRECTION
      ?auto_2043214 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2043210 ?auto_2043208 ) ) ( not ( = ?auto_2043212 ?auto_2043208 ) ) ( not ( = ?auto_2043212 ?auto_2043210 ) ) ( ON_BOARD ?auto_2043216 ?auto_2043213 ) ( SUPPORTS ?auto_2043216 ?auto_2043209 ) ( not ( = ?auto_2043208 ?auto_2043217 ) ) ( HAVE_IMAGE ?auto_2043210 ?auto_2043207 ) ( not ( = ?auto_2043210 ?auto_2043217 ) ) ( not ( = ?auto_2043207 ?auto_2043209 ) ) ( CALIBRATION_TARGET ?auto_2043216 ?auto_2043217 ) ( POINTING ?auto_2043213 ?auto_2043215 ) ( not ( = ?auto_2043217 ?auto_2043215 ) ) ( not ( = ?auto_2043208 ?auto_2043215 ) ) ( not ( = ?auto_2043210 ?auto_2043215 ) ) ( ON_BOARD ?auto_2043214 ?auto_2043213 ) ( POWER_ON ?auto_2043214 ) ( not ( = ?auto_2043216 ?auto_2043214 ) ) ( HAVE_IMAGE ?auto_2043212 ?auto_2043211 ) ( not ( = ?auto_2043209 ?auto_2043211 ) ) ( not ( = ?auto_2043207 ?auto_2043211 ) ) ( not ( = ?auto_2043212 ?auto_2043217 ) ) ( not ( = ?auto_2043212 ?auto_2043215 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2043210 ?auto_2043207 ?auto_2043208 ?auto_2043209 )
      ( GET-3IMAGE-VERIFY ?auto_2043208 ?auto_2043209 ?auto_2043210 ?auto_2043207 ?auto_2043212 ?auto_2043211 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2043482 - DIRECTION
      ?auto_2043483 - MODE
      ?auto_2043484 - DIRECTION
      ?auto_2043481 - MODE
      ?auto_2043486 - DIRECTION
      ?auto_2043485 - MODE
      ?auto_2043487 - DIRECTION
      ?auto_2043488 - MODE
    )
    :vars
    (
      ?auto_2043491 - INSTRUMENT
      ?auto_2043489 - SATELLITE
      ?auto_2043492 - DIRECTION
      ?auto_2043490 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2043484 ?auto_2043482 ) ) ( not ( = ?auto_2043486 ?auto_2043482 ) ) ( not ( = ?auto_2043486 ?auto_2043484 ) ) ( not ( = ?auto_2043487 ?auto_2043482 ) ) ( not ( = ?auto_2043487 ?auto_2043484 ) ) ( not ( = ?auto_2043487 ?auto_2043486 ) ) ( ON_BOARD ?auto_2043491 ?auto_2043489 ) ( SUPPORTS ?auto_2043491 ?auto_2043488 ) ( not ( = ?auto_2043487 ?auto_2043492 ) ) ( HAVE_IMAGE ?auto_2043482 ?auto_2043483 ) ( not ( = ?auto_2043482 ?auto_2043492 ) ) ( not ( = ?auto_2043483 ?auto_2043488 ) ) ( CALIBRATION_TARGET ?auto_2043491 ?auto_2043492 ) ( POINTING ?auto_2043489 ?auto_2043486 ) ( not ( = ?auto_2043492 ?auto_2043486 ) ) ( ON_BOARD ?auto_2043490 ?auto_2043489 ) ( POWER_ON ?auto_2043490 ) ( not ( = ?auto_2043491 ?auto_2043490 ) ) ( HAVE_IMAGE ?auto_2043484 ?auto_2043481 ) ( HAVE_IMAGE ?auto_2043486 ?auto_2043485 ) ( not ( = ?auto_2043483 ?auto_2043481 ) ) ( not ( = ?auto_2043483 ?auto_2043485 ) ) ( not ( = ?auto_2043484 ?auto_2043492 ) ) ( not ( = ?auto_2043481 ?auto_2043485 ) ) ( not ( = ?auto_2043481 ?auto_2043488 ) ) ( not ( = ?auto_2043485 ?auto_2043488 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2043482 ?auto_2043483 ?auto_2043487 ?auto_2043488 )
      ( GET-4IMAGE-VERIFY ?auto_2043482 ?auto_2043483 ?auto_2043484 ?auto_2043481 ?auto_2043486 ?auto_2043485 ?auto_2043487 ?auto_2043488 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2043520 - DIRECTION
      ?auto_2043521 - MODE
      ?auto_2043522 - DIRECTION
      ?auto_2043519 - MODE
      ?auto_2043524 - DIRECTION
      ?auto_2043523 - MODE
      ?auto_2043525 - DIRECTION
      ?auto_2043526 - MODE
    )
    :vars
    (
      ?auto_2043529 - INSTRUMENT
      ?auto_2043527 - SATELLITE
      ?auto_2043530 - DIRECTION
      ?auto_2043528 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2043522 ?auto_2043520 ) ) ( not ( = ?auto_2043524 ?auto_2043520 ) ) ( not ( = ?auto_2043524 ?auto_2043522 ) ) ( not ( = ?auto_2043525 ?auto_2043520 ) ) ( not ( = ?auto_2043525 ?auto_2043522 ) ) ( not ( = ?auto_2043525 ?auto_2043524 ) ) ( ON_BOARD ?auto_2043529 ?auto_2043527 ) ( SUPPORTS ?auto_2043529 ?auto_2043523 ) ( not ( = ?auto_2043524 ?auto_2043530 ) ) ( HAVE_IMAGE ?auto_2043520 ?auto_2043521 ) ( not ( = ?auto_2043520 ?auto_2043530 ) ) ( not ( = ?auto_2043521 ?auto_2043523 ) ) ( CALIBRATION_TARGET ?auto_2043529 ?auto_2043530 ) ( POINTING ?auto_2043527 ?auto_2043525 ) ( not ( = ?auto_2043530 ?auto_2043525 ) ) ( ON_BOARD ?auto_2043528 ?auto_2043527 ) ( POWER_ON ?auto_2043528 ) ( not ( = ?auto_2043529 ?auto_2043528 ) ) ( HAVE_IMAGE ?auto_2043522 ?auto_2043519 ) ( HAVE_IMAGE ?auto_2043525 ?auto_2043526 ) ( not ( = ?auto_2043521 ?auto_2043519 ) ) ( not ( = ?auto_2043521 ?auto_2043526 ) ) ( not ( = ?auto_2043522 ?auto_2043530 ) ) ( not ( = ?auto_2043519 ?auto_2043523 ) ) ( not ( = ?auto_2043519 ?auto_2043526 ) ) ( not ( = ?auto_2043523 ?auto_2043526 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2043520 ?auto_2043521 ?auto_2043524 ?auto_2043523 )
      ( GET-4IMAGE-VERIFY ?auto_2043520 ?auto_2043521 ?auto_2043522 ?auto_2043519 ?auto_2043524 ?auto_2043523 ?auto_2043525 ?auto_2043526 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2043557 - DIRECTION
      ?auto_2043558 - MODE
      ?auto_2043559 - DIRECTION
      ?auto_2043556 - MODE
      ?auto_2043561 - DIRECTION
      ?auto_2043560 - MODE
      ?auto_2043562 - DIRECTION
      ?auto_2043563 - MODE
    )
    :vars
    (
      ?auto_2043566 - INSTRUMENT
      ?auto_2043564 - SATELLITE
      ?auto_2043567 - DIRECTION
      ?auto_2043565 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2043559 ?auto_2043557 ) ) ( not ( = ?auto_2043561 ?auto_2043557 ) ) ( not ( = ?auto_2043561 ?auto_2043559 ) ) ( not ( = ?auto_2043562 ?auto_2043557 ) ) ( not ( = ?auto_2043562 ?auto_2043559 ) ) ( not ( = ?auto_2043562 ?auto_2043561 ) ) ( ON_BOARD ?auto_2043566 ?auto_2043564 ) ( SUPPORTS ?auto_2043566 ?auto_2043563 ) ( not ( = ?auto_2043562 ?auto_2043567 ) ) ( HAVE_IMAGE ?auto_2043557 ?auto_2043558 ) ( not ( = ?auto_2043557 ?auto_2043567 ) ) ( not ( = ?auto_2043558 ?auto_2043563 ) ) ( CALIBRATION_TARGET ?auto_2043566 ?auto_2043567 ) ( POINTING ?auto_2043564 ?auto_2043559 ) ( not ( = ?auto_2043567 ?auto_2043559 ) ) ( ON_BOARD ?auto_2043565 ?auto_2043564 ) ( POWER_ON ?auto_2043565 ) ( not ( = ?auto_2043566 ?auto_2043565 ) ) ( HAVE_IMAGE ?auto_2043559 ?auto_2043556 ) ( HAVE_IMAGE ?auto_2043561 ?auto_2043560 ) ( not ( = ?auto_2043558 ?auto_2043556 ) ) ( not ( = ?auto_2043558 ?auto_2043560 ) ) ( not ( = ?auto_2043556 ?auto_2043560 ) ) ( not ( = ?auto_2043556 ?auto_2043563 ) ) ( not ( = ?auto_2043561 ?auto_2043567 ) ) ( not ( = ?auto_2043560 ?auto_2043563 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2043557 ?auto_2043558 ?auto_2043562 ?auto_2043563 )
      ( GET-4IMAGE-VERIFY ?auto_2043557 ?auto_2043558 ?auto_2043559 ?auto_2043556 ?auto_2043561 ?auto_2043560 ?auto_2043562 ?auto_2043563 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2043593 - DIRECTION
      ?auto_2043594 - MODE
      ?auto_2043595 - DIRECTION
      ?auto_2043592 - MODE
      ?auto_2043597 - DIRECTION
      ?auto_2043596 - MODE
      ?auto_2043598 - DIRECTION
      ?auto_2043599 - MODE
    )
    :vars
    (
      ?auto_2043602 - INSTRUMENT
      ?auto_2043600 - SATELLITE
      ?auto_2043603 - DIRECTION
      ?auto_2043601 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2043595 ?auto_2043593 ) ) ( not ( = ?auto_2043597 ?auto_2043593 ) ) ( not ( = ?auto_2043597 ?auto_2043595 ) ) ( not ( = ?auto_2043598 ?auto_2043593 ) ) ( not ( = ?auto_2043598 ?auto_2043595 ) ) ( not ( = ?auto_2043598 ?auto_2043597 ) ) ( ON_BOARD ?auto_2043602 ?auto_2043600 ) ( SUPPORTS ?auto_2043602 ?auto_2043596 ) ( not ( = ?auto_2043597 ?auto_2043603 ) ) ( HAVE_IMAGE ?auto_2043593 ?auto_2043594 ) ( not ( = ?auto_2043593 ?auto_2043603 ) ) ( not ( = ?auto_2043594 ?auto_2043596 ) ) ( CALIBRATION_TARGET ?auto_2043602 ?auto_2043603 ) ( POINTING ?auto_2043600 ?auto_2043595 ) ( not ( = ?auto_2043603 ?auto_2043595 ) ) ( ON_BOARD ?auto_2043601 ?auto_2043600 ) ( POWER_ON ?auto_2043601 ) ( not ( = ?auto_2043602 ?auto_2043601 ) ) ( HAVE_IMAGE ?auto_2043595 ?auto_2043592 ) ( HAVE_IMAGE ?auto_2043598 ?auto_2043599 ) ( not ( = ?auto_2043594 ?auto_2043592 ) ) ( not ( = ?auto_2043594 ?auto_2043599 ) ) ( not ( = ?auto_2043592 ?auto_2043596 ) ) ( not ( = ?auto_2043592 ?auto_2043599 ) ) ( not ( = ?auto_2043596 ?auto_2043599 ) ) ( not ( = ?auto_2043598 ?auto_2043603 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2043593 ?auto_2043594 ?auto_2043597 ?auto_2043596 )
      ( GET-4IMAGE-VERIFY ?auto_2043593 ?auto_2043594 ?auto_2043595 ?auto_2043592 ?auto_2043597 ?auto_2043596 ?auto_2043598 ?auto_2043599 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2043706 - DIRECTION
      ?auto_2043707 - MODE
      ?auto_2043708 - DIRECTION
      ?auto_2043705 - MODE
      ?auto_2043710 - DIRECTION
      ?auto_2043709 - MODE
      ?auto_2043711 - DIRECTION
      ?auto_2043712 - MODE
    )
    :vars
    (
      ?auto_2043715 - INSTRUMENT
      ?auto_2043713 - SATELLITE
      ?auto_2043716 - DIRECTION
      ?auto_2043714 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2043708 ?auto_2043706 ) ) ( not ( = ?auto_2043710 ?auto_2043706 ) ) ( not ( = ?auto_2043710 ?auto_2043708 ) ) ( not ( = ?auto_2043711 ?auto_2043706 ) ) ( not ( = ?auto_2043711 ?auto_2043708 ) ) ( not ( = ?auto_2043711 ?auto_2043710 ) ) ( ON_BOARD ?auto_2043715 ?auto_2043713 ) ( SUPPORTS ?auto_2043715 ?auto_2043705 ) ( not ( = ?auto_2043708 ?auto_2043716 ) ) ( HAVE_IMAGE ?auto_2043706 ?auto_2043707 ) ( not ( = ?auto_2043706 ?auto_2043716 ) ) ( not ( = ?auto_2043707 ?auto_2043705 ) ) ( CALIBRATION_TARGET ?auto_2043715 ?auto_2043716 ) ( POINTING ?auto_2043713 ?auto_2043711 ) ( not ( = ?auto_2043716 ?auto_2043711 ) ) ( ON_BOARD ?auto_2043714 ?auto_2043713 ) ( POWER_ON ?auto_2043714 ) ( not ( = ?auto_2043715 ?auto_2043714 ) ) ( HAVE_IMAGE ?auto_2043710 ?auto_2043709 ) ( HAVE_IMAGE ?auto_2043711 ?auto_2043712 ) ( not ( = ?auto_2043707 ?auto_2043709 ) ) ( not ( = ?auto_2043707 ?auto_2043712 ) ) ( not ( = ?auto_2043705 ?auto_2043709 ) ) ( not ( = ?auto_2043705 ?auto_2043712 ) ) ( not ( = ?auto_2043710 ?auto_2043716 ) ) ( not ( = ?auto_2043709 ?auto_2043712 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2043706 ?auto_2043707 ?auto_2043708 ?auto_2043705 )
      ( GET-4IMAGE-VERIFY ?auto_2043706 ?auto_2043707 ?auto_2043708 ?auto_2043705 ?auto_2043710 ?auto_2043709 ?auto_2043711 ?auto_2043712 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2043743 - DIRECTION
      ?auto_2043744 - MODE
      ?auto_2043745 - DIRECTION
      ?auto_2043742 - MODE
      ?auto_2043747 - DIRECTION
      ?auto_2043746 - MODE
      ?auto_2043748 - DIRECTION
      ?auto_2043749 - MODE
    )
    :vars
    (
      ?auto_2043752 - INSTRUMENT
      ?auto_2043750 - SATELLITE
      ?auto_2043753 - DIRECTION
      ?auto_2043751 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2043745 ?auto_2043743 ) ) ( not ( = ?auto_2043747 ?auto_2043743 ) ) ( not ( = ?auto_2043747 ?auto_2043745 ) ) ( not ( = ?auto_2043748 ?auto_2043743 ) ) ( not ( = ?auto_2043748 ?auto_2043745 ) ) ( not ( = ?auto_2043748 ?auto_2043747 ) ) ( ON_BOARD ?auto_2043752 ?auto_2043750 ) ( SUPPORTS ?auto_2043752 ?auto_2043742 ) ( not ( = ?auto_2043745 ?auto_2043753 ) ) ( HAVE_IMAGE ?auto_2043743 ?auto_2043744 ) ( not ( = ?auto_2043743 ?auto_2043753 ) ) ( not ( = ?auto_2043744 ?auto_2043742 ) ) ( CALIBRATION_TARGET ?auto_2043752 ?auto_2043753 ) ( POINTING ?auto_2043750 ?auto_2043747 ) ( not ( = ?auto_2043753 ?auto_2043747 ) ) ( ON_BOARD ?auto_2043751 ?auto_2043750 ) ( POWER_ON ?auto_2043751 ) ( not ( = ?auto_2043752 ?auto_2043751 ) ) ( HAVE_IMAGE ?auto_2043747 ?auto_2043746 ) ( HAVE_IMAGE ?auto_2043748 ?auto_2043749 ) ( not ( = ?auto_2043744 ?auto_2043746 ) ) ( not ( = ?auto_2043744 ?auto_2043749 ) ) ( not ( = ?auto_2043742 ?auto_2043746 ) ) ( not ( = ?auto_2043742 ?auto_2043749 ) ) ( not ( = ?auto_2043746 ?auto_2043749 ) ) ( not ( = ?auto_2043748 ?auto_2043753 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2043743 ?auto_2043744 ?auto_2043745 ?auto_2043742 )
      ( GET-4IMAGE-VERIFY ?auto_2043743 ?auto_2043744 ?auto_2043745 ?auto_2043742 ?auto_2043747 ?auto_2043746 ?auto_2043748 ?auto_2043749 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2044319 - DIRECTION
      ?auto_2044320 - MODE
      ?auto_2044321 - DIRECTION
      ?auto_2044318 - MODE
      ?auto_2044323 - DIRECTION
      ?auto_2044322 - MODE
      ?auto_2044324 - DIRECTION
      ?auto_2044325 - MODE
    )
    :vars
    (
      ?auto_2044328 - INSTRUMENT
      ?auto_2044326 - SATELLITE
      ?auto_2044329 - DIRECTION
      ?auto_2044327 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2044321 ?auto_2044319 ) ) ( not ( = ?auto_2044323 ?auto_2044319 ) ) ( not ( = ?auto_2044323 ?auto_2044321 ) ) ( not ( = ?auto_2044324 ?auto_2044319 ) ) ( not ( = ?auto_2044324 ?auto_2044321 ) ) ( not ( = ?auto_2044324 ?auto_2044323 ) ) ( ON_BOARD ?auto_2044328 ?auto_2044326 ) ( SUPPORTS ?auto_2044328 ?auto_2044325 ) ( not ( = ?auto_2044324 ?auto_2044329 ) ) ( HAVE_IMAGE ?auto_2044321 ?auto_2044318 ) ( not ( = ?auto_2044321 ?auto_2044329 ) ) ( not ( = ?auto_2044318 ?auto_2044325 ) ) ( CALIBRATION_TARGET ?auto_2044328 ?auto_2044329 ) ( POINTING ?auto_2044326 ?auto_2044319 ) ( not ( = ?auto_2044329 ?auto_2044319 ) ) ( ON_BOARD ?auto_2044327 ?auto_2044326 ) ( POWER_ON ?auto_2044327 ) ( not ( = ?auto_2044328 ?auto_2044327 ) ) ( HAVE_IMAGE ?auto_2044319 ?auto_2044320 ) ( HAVE_IMAGE ?auto_2044323 ?auto_2044322 ) ( not ( = ?auto_2044320 ?auto_2044318 ) ) ( not ( = ?auto_2044320 ?auto_2044322 ) ) ( not ( = ?auto_2044320 ?auto_2044325 ) ) ( not ( = ?auto_2044318 ?auto_2044322 ) ) ( not ( = ?auto_2044323 ?auto_2044329 ) ) ( not ( = ?auto_2044322 ?auto_2044325 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2044321 ?auto_2044318 ?auto_2044324 ?auto_2044325 )
      ( GET-4IMAGE-VERIFY ?auto_2044319 ?auto_2044320 ?auto_2044321 ?auto_2044318 ?auto_2044323 ?auto_2044322 ?auto_2044324 ?auto_2044325 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2044355 - DIRECTION
      ?auto_2044356 - MODE
      ?auto_2044357 - DIRECTION
      ?auto_2044354 - MODE
      ?auto_2044359 - DIRECTION
      ?auto_2044358 - MODE
      ?auto_2044360 - DIRECTION
      ?auto_2044361 - MODE
    )
    :vars
    (
      ?auto_2044364 - INSTRUMENT
      ?auto_2044362 - SATELLITE
      ?auto_2044365 - DIRECTION
      ?auto_2044363 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2044357 ?auto_2044355 ) ) ( not ( = ?auto_2044359 ?auto_2044355 ) ) ( not ( = ?auto_2044359 ?auto_2044357 ) ) ( not ( = ?auto_2044360 ?auto_2044355 ) ) ( not ( = ?auto_2044360 ?auto_2044357 ) ) ( not ( = ?auto_2044360 ?auto_2044359 ) ) ( ON_BOARD ?auto_2044364 ?auto_2044362 ) ( SUPPORTS ?auto_2044364 ?auto_2044358 ) ( not ( = ?auto_2044359 ?auto_2044365 ) ) ( HAVE_IMAGE ?auto_2044357 ?auto_2044354 ) ( not ( = ?auto_2044357 ?auto_2044365 ) ) ( not ( = ?auto_2044354 ?auto_2044358 ) ) ( CALIBRATION_TARGET ?auto_2044364 ?auto_2044365 ) ( POINTING ?auto_2044362 ?auto_2044355 ) ( not ( = ?auto_2044365 ?auto_2044355 ) ) ( ON_BOARD ?auto_2044363 ?auto_2044362 ) ( POWER_ON ?auto_2044363 ) ( not ( = ?auto_2044364 ?auto_2044363 ) ) ( HAVE_IMAGE ?auto_2044355 ?auto_2044356 ) ( HAVE_IMAGE ?auto_2044360 ?auto_2044361 ) ( not ( = ?auto_2044356 ?auto_2044354 ) ) ( not ( = ?auto_2044356 ?auto_2044358 ) ) ( not ( = ?auto_2044356 ?auto_2044361 ) ) ( not ( = ?auto_2044354 ?auto_2044361 ) ) ( not ( = ?auto_2044358 ?auto_2044361 ) ) ( not ( = ?auto_2044360 ?auto_2044365 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2044357 ?auto_2044354 ?auto_2044359 ?auto_2044358 )
      ( GET-4IMAGE-VERIFY ?auto_2044355 ?auto_2044356 ?auto_2044357 ?auto_2044354 ?auto_2044359 ?auto_2044358 ?auto_2044360 ?auto_2044361 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2044583 - DIRECTION
      ?auto_2044584 - MODE
      ?auto_2044585 - DIRECTION
      ?auto_2044582 - MODE
      ?auto_2044587 - DIRECTION
      ?auto_2044586 - MODE
      ?auto_2044588 - DIRECTION
      ?auto_2044589 - MODE
    )
    :vars
    (
      ?auto_2044592 - INSTRUMENT
      ?auto_2044590 - SATELLITE
      ?auto_2044593 - DIRECTION
      ?auto_2044591 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2044585 ?auto_2044583 ) ) ( not ( = ?auto_2044587 ?auto_2044583 ) ) ( not ( = ?auto_2044587 ?auto_2044585 ) ) ( not ( = ?auto_2044588 ?auto_2044583 ) ) ( not ( = ?auto_2044588 ?auto_2044585 ) ) ( not ( = ?auto_2044588 ?auto_2044587 ) ) ( ON_BOARD ?auto_2044592 ?auto_2044590 ) ( SUPPORTS ?auto_2044592 ?auto_2044582 ) ( not ( = ?auto_2044585 ?auto_2044593 ) ) ( HAVE_IMAGE ?auto_2044587 ?auto_2044586 ) ( not ( = ?auto_2044587 ?auto_2044593 ) ) ( not ( = ?auto_2044586 ?auto_2044582 ) ) ( CALIBRATION_TARGET ?auto_2044592 ?auto_2044593 ) ( POINTING ?auto_2044590 ?auto_2044583 ) ( not ( = ?auto_2044593 ?auto_2044583 ) ) ( ON_BOARD ?auto_2044591 ?auto_2044590 ) ( POWER_ON ?auto_2044591 ) ( not ( = ?auto_2044592 ?auto_2044591 ) ) ( HAVE_IMAGE ?auto_2044583 ?auto_2044584 ) ( HAVE_IMAGE ?auto_2044588 ?auto_2044589 ) ( not ( = ?auto_2044584 ?auto_2044582 ) ) ( not ( = ?auto_2044584 ?auto_2044586 ) ) ( not ( = ?auto_2044584 ?auto_2044589 ) ) ( not ( = ?auto_2044582 ?auto_2044589 ) ) ( not ( = ?auto_2044586 ?auto_2044589 ) ) ( not ( = ?auto_2044588 ?auto_2044593 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2044587 ?auto_2044586 ?auto_2044585 ?auto_2044582 )
      ( GET-4IMAGE-VERIFY ?auto_2044583 ?auto_2044584 ?auto_2044585 ?auto_2044582 ?auto_2044587 ?auto_2044586 ?auto_2044588 ?auto_2044589 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2044854 - DIRECTION
      ?auto_2044855 - MODE
      ?auto_2044856 - DIRECTION
      ?auto_2044853 - MODE
      ?auto_2044858 - DIRECTION
      ?auto_2044857 - MODE
      ?auto_2044859 - DIRECTION
      ?auto_2044860 - MODE
    )
    :vars
    (
      ?auto_2044863 - INSTRUMENT
      ?auto_2044861 - SATELLITE
      ?auto_2044864 - DIRECTION
      ?auto_2044862 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2044856 ?auto_2044854 ) ) ( not ( = ?auto_2044858 ?auto_2044854 ) ) ( not ( = ?auto_2044858 ?auto_2044856 ) ) ( not ( = ?auto_2044859 ?auto_2044854 ) ) ( not ( = ?auto_2044859 ?auto_2044856 ) ) ( not ( = ?auto_2044859 ?auto_2044858 ) ) ( ON_BOARD ?auto_2044863 ?auto_2044861 ) ( SUPPORTS ?auto_2044863 ?auto_2044855 ) ( not ( = ?auto_2044854 ?auto_2044864 ) ) ( HAVE_IMAGE ?auto_2044856 ?auto_2044853 ) ( not ( = ?auto_2044856 ?auto_2044864 ) ) ( not ( = ?auto_2044853 ?auto_2044855 ) ) ( CALIBRATION_TARGET ?auto_2044863 ?auto_2044864 ) ( POINTING ?auto_2044861 ?auto_2044859 ) ( not ( = ?auto_2044864 ?auto_2044859 ) ) ( ON_BOARD ?auto_2044862 ?auto_2044861 ) ( POWER_ON ?auto_2044862 ) ( not ( = ?auto_2044863 ?auto_2044862 ) ) ( HAVE_IMAGE ?auto_2044858 ?auto_2044857 ) ( HAVE_IMAGE ?auto_2044859 ?auto_2044860 ) ( not ( = ?auto_2044855 ?auto_2044857 ) ) ( not ( = ?auto_2044855 ?auto_2044860 ) ) ( not ( = ?auto_2044853 ?auto_2044857 ) ) ( not ( = ?auto_2044853 ?auto_2044860 ) ) ( not ( = ?auto_2044858 ?auto_2044864 ) ) ( not ( = ?auto_2044857 ?auto_2044860 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2044856 ?auto_2044853 ?auto_2044854 ?auto_2044855 )
      ( GET-4IMAGE-VERIFY ?auto_2044854 ?auto_2044855 ?auto_2044856 ?auto_2044853 ?auto_2044858 ?auto_2044857 ?auto_2044859 ?auto_2044860 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2044891 - DIRECTION
      ?auto_2044892 - MODE
      ?auto_2044893 - DIRECTION
      ?auto_2044890 - MODE
      ?auto_2044895 - DIRECTION
      ?auto_2044894 - MODE
      ?auto_2044896 - DIRECTION
      ?auto_2044897 - MODE
    )
    :vars
    (
      ?auto_2044900 - INSTRUMENT
      ?auto_2044898 - SATELLITE
      ?auto_2044901 - DIRECTION
      ?auto_2044899 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2044893 ?auto_2044891 ) ) ( not ( = ?auto_2044895 ?auto_2044891 ) ) ( not ( = ?auto_2044895 ?auto_2044893 ) ) ( not ( = ?auto_2044896 ?auto_2044891 ) ) ( not ( = ?auto_2044896 ?auto_2044893 ) ) ( not ( = ?auto_2044896 ?auto_2044895 ) ) ( ON_BOARD ?auto_2044900 ?auto_2044898 ) ( SUPPORTS ?auto_2044900 ?auto_2044892 ) ( not ( = ?auto_2044891 ?auto_2044901 ) ) ( HAVE_IMAGE ?auto_2044893 ?auto_2044890 ) ( not ( = ?auto_2044893 ?auto_2044901 ) ) ( not ( = ?auto_2044890 ?auto_2044892 ) ) ( CALIBRATION_TARGET ?auto_2044900 ?auto_2044901 ) ( POINTING ?auto_2044898 ?auto_2044895 ) ( not ( = ?auto_2044901 ?auto_2044895 ) ) ( ON_BOARD ?auto_2044899 ?auto_2044898 ) ( POWER_ON ?auto_2044899 ) ( not ( = ?auto_2044900 ?auto_2044899 ) ) ( HAVE_IMAGE ?auto_2044895 ?auto_2044894 ) ( HAVE_IMAGE ?auto_2044896 ?auto_2044897 ) ( not ( = ?auto_2044892 ?auto_2044894 ) ) ( not ( = ?auto_2044892 ?auto_2044897 ) ) ( not ( = ?auto_2044890 ?auto_2044894 ) ) ( not ( = ?auto_2044890 ?auto_2044897 ) ) ( not ( = ?auto_2044894 ?auto_2044897 ) ) ( not ( = ?auto_2044896 ?auto_2044901 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2044893 ?auto_2044890 ?auto_2044891 ?auto_2044892 )
      ( GET-4IMAGE-VERIFY ?auto_2044891 ?auto_2044892 ?auto_2044893 ?auto_2044890 ?auto_2044895 ?auto_2044894 ?auto_2044896 ?auto_2044897 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2045201 - DIRECTION
      ?auto_2045202 - MODE
      ?auto_2045203 - DIRECTION
      ?auto_2045200 - MODE
      ?auto_2045205 - DIRECTION
      ?auto_2045204 - MODE
      ?auto_2045206 - DIRECTION
      ?auto_2045207 - MODE
    )
    :vars
    (
      ?auto_2045210 - INSTRUMENT
      ?auto_2045208 - SATELLITE
      ?auto_2045211 - DIRECTION
      ?auto_2045209 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2045203 ?auto_2045201 ) ) ( not ( = ?auto_2045205 ?auto_2045201 ) ) ( not ( = ?auto_2045205 ?auto_2045203 ) ) ( not ( = ?auto_2045206 ?auto_2045201 ) ) ( not ( = ?auto_2045206 ?auto_2045203 ) ) ( not ( = ?auto_2045206 ?auto_2045205 ) ) ( ON_BOARD ?auto_2045210 ?auto_2045208 ) ( SUPPORTS ?auto_2045210 ?auto_2045202 ) ( not ( = ?auto_2045201 ?auto_2045211 ) ) ( HAVE_IMAGE ?auto_2045205 ?auto_2045204 ) ( not ( = ?auto_2045205 ?auto_2045211 ) ) ( not ( = ?auto_2045204 ?auto_2045202 ) ) ( CALIBRATION_TARGET ?auto_2045210 ?auto_2045211 ) ( POINTING ?auto_2045208 ?auto_2045203 ) ( not ( = ?auto_2045211 ?auto_2045203 ) ) ( ON_BOARD ?auto_2045209 ?auto_2045208 ) ( POWER_ON ?auto_2045209 ) ( not ( = ?auto_2045210 ?auto_2045209 ) ) ( HAVE_IMAGE ?auto_2045203 ?auto_2045200 ) ( HAVE_IMAGE ?auto_2045206 ?auto_2045207 ) ( not ( = ?auto_2045202 ?auto_2045200 ) ) ( not ( = ?auto_2045202 ?auto_2045207 ) ) ( not ( = ?auto_2045200 ?auto_2045204 ) ) ( not ( = ?auto_2045200 ?auto_2045207 ) ) ( not ( = ?auto_2045204 ?auto_2045207 ) ) ( not ( = ?auto_2045206 ?auto_2045211 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2045205 ?auto_2045204 ?auto_2045201 ?auto_2045202 )
      ( GET-4IMAGE-VERIFY ?auto_2045201 ?auto_2045202 ?auto_2045203 ?auto_2045200 ?auto_2045205 ?auto_2045204 ?auto_2045206 ?auto_2045207 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2085906 - DIRECTION
      ?auto_2085907 - MODE
      ?auto_2085908 - DIRECTION
      ?auto_2085905 - MODE
      ?auto_2085910 - DIRECTION
      ?auto_2085909 - MODE
    )
    :vars
    (
      ?auto_2085913 - INSTRUMENT
      ?auto_2085912 - SATELLITE
      ?auto_2085911 - DIRECTION
      ?auto_2085914 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2085908 ?auto_2085906 ) ) ( not ( = ?auto_2085910 ?auto_2085906 ) ) ( not ( = ?auto_2085910 ?auto_2085908 ) ) ( ON_BOARD ?auto_2085913 ?auto_2085912 ) ( SUPPORTS ?auto_2085913 ?auto_2085909 ) ( not ( = ?auto_2085910 ?auto_2085911 ) ) ( HAVE_IMAGE ?auto_2085906 ?auto_2085907 ) ( not ( = ?auto_2085906 ?auto_2085911 ) ) ( not ( = ?auto_2085907 ?auto_2085909 ) ) ( CALIBRATION_TARGET ?auto_2085913 ?auto_2085911 ) ( not ( = ?auto_2085911 ?auto_2085908 ) ) ( ON_BOARD ?auto_2085914 ?auto_2085912 ) ( POWER_ON ?auto_2085914 ) ( not ( = ?auto_2085913 ?auto_2085914 ) ) ( POINTING ?auto_2085912 ?auto_2085911 ) ( HAVE_IMAGE ?auto_2085908 ?auto_2085905 ) ( not ( = ?auto_2085907 ?auto_2085905 ) ) ( not ( = ?auto_2085905 ?auto_2085909 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2085906 ?auto_2085907 ?auto_2085910 ?auto_2085909 )
      ( GET-3IMAGE-VERIFY ?auto_2085906 ?auto_2085907 ?auto_2085908 ?auto_2085905 ?auto_2085910 ?auto_2085909 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2085938 - DIRECTION
      ?auto_2085939 - MODE
      ?auto_2085940 - DIRECTION
      ?auto_2085937 - MODE
      ?auto_2085942 - DIRECTION
      ?auto_2085941 - MODE
    )
    :vars
    (
      ?auto_2085945 - INSTRUMENT
      ?auto_2085944 - SATELLITE
      ?auto_2085943 - DIRECTION
      ?auto_2085946 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2085940 ?auto_2085938 ) ) ( not ( = ?auto_2085942 ?auto_2085938 ) ) ( not ( = ?auto_2085942 ?auto_2085940 ) ) ( ON_BOARD ?auto_2085945 ?auto_2085944 ) ( SUPPORTS ?auto_2085945 ?auto_2085937 ) ( not ( = ?auto_2085940 ?auto_2085943 ) ) ( HAVE_IMAGE ?auto_2085938 ?auto_2085939 ) ( not ( = ?auto_2085938 ?auto_2085943 ) ) ( not ( = ?auto_2085939 ?auto_2085937 ) ) ( CALIBRATION_TARGET ?auto_2085945 ?auto_2085943 ) ( not ( = ?auto_2085943 ?auto_2085942 ) ) ( ON_BOARD ?auto_2085946 ?auto_2085944 ) ( POWER_ON ?auto_2085946 ) ( not ( = ?auto_2085945 ?auto_2085946 ) ) ( POINTING ?auto_2085944 ?auto_2085943 ) ( HAVE_IMAGE ?auto_2085942 ?auto_2085941 ) ( not ( = ?auto_2085939 ?auto_2085941 ) ) ( not ( = ?auto_2085937 ?auto_2085941 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2085938 ?auto_2085939 ?auto_2085940 ?auto_2085937 )
      ( GET-3IMAGE-VERIFY ?auto_2085938 ?auto_2085939 ?auto_2085940 ?auto_2085937 ?auto_2085942 ?auto_2085941 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2071630 - DIRECTION
      ?auto_2071631 - MODE
      ?auto_2071632 - DIRECTION
      ?auto_2071629 - MODE
      ?auto_2071634 - DIRECTION
      ?auto_2071633 - MODE
    )
    :vars
    (
      ?auto_2071636 - INSTRUMENT
      ?auto_2071638 - SATELLITE
      ?auto_2071635 - DIRECTION
      ?auto_2071639 - DIRECTION
      ?auto_2071637 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2071632 ?auto_2071630 ) ) ( not ( = ?auto_2071634 ?auto_2071630 ) ) ( not ( = ?auto_2071634 ?auto_2071632 ) ) ( ON_BOARD ?auto_2071636 ?auto_2071638 ) ( SUPPORTS ?auto_2071636 ?auto_2071633 ) ( not ( = ?auto_2071634 ?auto_2071635 ) ) ( HAVE_IMAGE ?auto_2071632 ?auto_2071629 ) ( not ( = ?auto_2071632 ?auto_2071635 ) ) ( not ( = ?auto_2071629 ?auto_2071633 ) ) ( CALIBRATION_TARGET ?auto_2071636 ?auto_2071635 ) ( not ( = ?auto_2071635 ?auto_2071639 ) ) ( not ( = ?auto_2071634 ?auto_2071639 ) ) ( not ( = ?auto_2071632 ?auto_2071639 ) ) ( ON_BOARD ?auto_2071637 ?auto_2071638 ) ( POWER_ON ?auto_2071637 ) ( not ( = ?auto_2071636 ?auto_2071637 ) ) ( POINTING ?auto_2071638 ?auto_2071635 ) ( HAVE_IMAGE ?auto_2071630 ?auto_2071631 ) ( not ( = ?auto_2071630 ?auto_2071635 ) ) ( not ( = ?auto_2071630 ?auto_2071639 ) ) ( not ( = ?auto_2071631 ?auto_2071629 ) ) ( not ( = ?auto_2071631 ?auto_2071633 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2071632 ?auto_2071629 ?auto_2071634 ?auto_2071633 )
      ( GET-3IMAGE-VERIFY ?auto_2071630 ?auto_2071631 ?auto_2071632 ?auto_2071629 ?auto_2071634 ?auto_2071633 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2071666 - DIRECTION
      ?auto_2071667 - MODE
      ?auto_2071668 - DIRECTION
      ?auto_2071665 - MODE
      ?auto_2071670 - DIRECTION
      ?auto_2071669 - MODE
    )
    :vars
    (
      ?auto_2071672 - INSTRUMENT
      ?auto_2071674 - SATELLITE
      ?auto_2071671 - DIRECTION
      ?auto_2071675 - DIRECTION
      ?auto_2071673 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2071668 ?auto_2071666 ) ) ( not ( = ?auto_2071670 ?auto_2071666 ) ) ( not ( = ?auto_2071670 ?auto_2071668 ) ) ( ON_BOARD ?auto_2071672 ?auto_2071674 ) ( SUPPORTS ?auto_2071672 ?auto_2071665 ) ( not ( = ?auto_2071668 ?auto_2071671 ) ) ( HAVE_IMAGE ?auto_2071670 ?auto_2071669 ) ( not ( = ?auto_2071670 ?auto_2071671 ) ) ( not ( = ?auto_2071669 ?auto_2071665 ) ) ( CALIBRATION_TARGET ?auto_2071672 ?auto_2071671 ) ( not ( = ?auto_2071671 ?auto_2071675 ) ) ( not ( = ?auto_2071668 ?auto_2071675 ) ) ( not ( = ?auto_2071670 ?auto_2071675 ) ) ( ON_BOARD ?auto_2071673 ?auto_2071674 ) ( POWER_ON ?auto_2071673 ) ( not ( = ?auto_2071672 ?auto_2071673 ) ) ( POINTING ?auto_2071674 ?auto_2071671 ) ( HAVE_IMAGE ?auto_2071666 ?auto_2071667 ) ( not ( = ?auto_2071666 ?auto_2071671 ) ) ( not ( = ?auto_2071666 ?auto_2071675 ) ) ( not ( = ?auto_2071667 ?auto_2071665 ) ) ( not ( = ?auto_2071667 ?auto_2071669 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2071670 ?auto_2071669 ?auto_2071668 ?auto_2071665 )
      ( GET-3IMAGE-VERIFY ?auto_2071666 ?auto_2071667 ?auto_2071668 ?auto_2071665 ?auto_2071670 ?auto_2071669 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2086138 - DIRECTION
      ?auto_2086139 - MODE
      ?auto_2086140 - DIRECTION
      ?auto_2086137 - MODE
      ?auto_2086142 - DIRECTION
      ?auto_2086141 - MODE
    )
    :vars
    (
      ?auto_2086145 - INSTRUMENT
      ?auto_2086144 - SATELLITE
      ?auto_2086143 - DIRECTION
      ?auto_2086146 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2086140 ?auto_2086138 ) ) ( not ( = ?auto_2086142 ?auto_2086138 ) ) ( not ( = ?auto_2086142 ?auto_2086140 ) ) ( ON_BOARD ?auto_2086145 ?auto_2086144 ) ( SUPPORTS ?auto_2086145 ?auto_2086139 ) ( not ( = ?auto_2086138 ?auto_2086143 ) ) ( HAVE_IMAGE ?auto_2086140 ?auto_2086137 ) ( not ( = ?auto_2086140 ?auto_2086143 ) ) ( not ( = ?auto_2086137 ?auto_2086139 ) ) ( CALIBRATION_TARGET ?auto_2086145 ?auto_2086143 ) ( not ( = ?auto_2086143 ?auto_2086142 ) ) ( ON_BOARD ?auto_2086146 ?auto_2086144 ) ( POWER_ON ?auto_2086146 ) ( not ( = ?auto_2086145 ?auto_2086146 ) ) ( POINTING ?auto_2086144 ?auto_2086143 ) ( HAVE_IMAGE ?auto_2086142 ?auto_2086141 ) ( not ( = ?auto_2086139 ?auto_2086141 ) ) ( not ( = ?auto_2086137 ?auto_2086141 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2086140 ?auto_2086137 ?auto_2086138 ?auto_2086139 )
      ( GET-3IMAGE-VERIFY ?auto_2086138 ?auto_2086139 ?auto_2086140 ?auto_2086137 ?auto_2086142 ?auto_2086141 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_2071838 - DIRECTION
      ?auto_2071839 - MODE
      ?auto_2071840 - DIRECTION
      ?auto_2071837 - MODE
      ?auto_2071842 - DIRECTION
      ?auto_2071841 - MODE
    )
    :vars
    (
      ?auto_2071844 - INSTRUMENT
      ?auto_2071846 - SATELLITE
      ?auto_2071843 - DIRECTION
      ?auto_2071847 - DIRECTION
      ?auto_2071845 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2071840 ?auto_2071838 ) ) ( not ( = ?auto_2071842 ?auto_2071838 ) ) ( not ( = ?auto_2071842 ?auto_2071840 ) ) ( ON_BOARD ?auto_2071844 ?auto_2071846 ) ( SUPPORTS ?auto_2071844 ?auto_2071839 ) ( not ( = ?auto_2071838 ?auto_2071843 ) ) ( HAVE_IMAGE ?auto_2071842 ?auto_2071841 ) ( not ( = ?auto_2071842 ?auto_2071843 ) ) ( not ( = ?auto_2071841 ?auto_2071839 ) ) ( CALIBRATION_TARGET ?auto_2071844 ?auto_2071843 ) ( not ( = ?auto_2071843 ?auto_2071847 ) ) ( not ( = ?auto_2071838 ?auto_2071847 ) ) ( not ( = ?auto_2071842 ?auto_2071847 ) ) ( ON_BOARD ?auto_2071845 ?auto_2071846 ) ( POWER_ON ?auto_2071845 ) ( not ( = ?auto_2071844 ?auto_2071845 ) ) ( POINTING ?auto_2071846 ?auto_2071843 ) ( HAVE_IMAGE ?auto_2071840 ?auto_2071837 ) ( not ( = ?auto_2071839 ?auto_2071837 ) ) ( not ( = ?auto_2071840 ?auto_2071843 ) ) ( not ( = ?auto_2071840 ?auto_2071847 ) ) ( not ( = ?auto_2071837 ?auto_2071841 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2071842 ?auto_2071841 ?auto_2071838 ?auto_2071839 )
      ( GET-3IMAGE-VERIFY ?auto_2071838 ?auto_2071839 ?auto_2071840 ?auto_2071837 ?auto_2071842 ?auto_2071841 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2321520 - DIRECTION
      ?auto_2321521 - MODE
      ?auto_2321522 - DIRECTION
      ?auto_2321519 - MODE
      ?auto_2321524 - DIRECTION
      ?auto_2321523 - MODE
      ?auto_2321525 - DIRECTION
      ?auto_2321526 - MODE
      ?auto_2321527 - DIRECTION
      ?auto_2321528 - MODE
    )
    :vars
    (
      ?auto_2321530 - INSTRUMENT
      ?auto_2321529 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_2321522 ?auto_2321520 ) ) ( not ( = ?auto_2321524 ?auto_2321520 ) ) ( not ( = ?auto_2321524 ?auto_2321522 ) ) ( not ( = ?auto_2321525 ?auto_2321520 ) ) ( not ( = ?auto_2321525 ?auto_2321522 ) ) ( not ( = ?auto_2321525 ?auto_2321524 ) ) ( not ( = ?auto_2321527 ?auto_2321520 ) ) ( not ( = ?auto_2321527 ?auto_2321522 ) ) ( not ( = ?auto_2321527 ?auto_2321524 ) ) ( not ( = ?auto_2321527 ?auto_2321525 ) ) ( CALIBRATED ?auto_2321530 ) ( ON_BOARD ?auto_2321530 ?auto_2321529 ) ( SUPPORTS ?auto_2321530 ?auto_2321528 ) ( POWER_ON ?auto_2321530 ) ( POINTING ?auto_2321529 ?auto_2321527 ) ( HAVE_IMAGE ?auto_2321520 ?auto_2321521 ) ( HAVE_IMAGE ?auto_2321522 ?auto_2321519 ) ( HAVE_IMAGE ?auto_2321524 ?auto_2321523 ) ( HAVE_IMAGE ?auto_2321525 ?auto_2321526 ) ( not ( = ?auto_2321521 ?auto_2321519 ) ) ( not ( = ?auto_2321521 ?auto_2321523 ) ) ( not ( = ?auto_2321521 ?auto_2321526 ) ) ( not ( = ?auto_2321521 ?auto_2321528 ) ) ( not ( = ?auto_2321519 ?auto_2321523 ) ) ( not ( = ?auto_2321519 ?auto_2321526 ) ) ( not ( = ?auto_2321519 ?auto_2321528 ) ) ( not ( = ?auto_2321523 ?auto_2321526 ) ) ( not ( = ?auto_2321523 ?auto_2321528 ) ) ( not ( = ?auto_2321526 ?auto_2321528 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2321527 ?auto_2321528 )
      ( GET-5IMAGE-VERIFY ?auto_2321520 ?auto_2321521 ?auto_2321522 ?auto_2321519 ?auto_2321524 ?auto_2321523 ?auto_2321525 ?auto_2321526 ?auto_2321527 ?auto_2321528 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2321568 - DIRECTION
      ?auto_2321569 - MODE
      ?auto_2321570 - DIRECTION
      ?auto_2321567 - MODE
      ?auto_2321572 - DIRECTION
      ?auto_2321571 - MODE
      ?auto_2321573 - DIRECTION
      ?auto_2321574 - MODE
      ?auto_2321575 - DIRECTION
      ?auto_2321576 - MODE
    )
    :vars
    (
      ?auto_2321578 - INSTRUMENT
      ?auto_2321577 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_2321570 ?auto_2321568 ) ) ( not ( = ?auto_2321572 ?auto_2321568 ) ) ( not ( = ?auto_2321572 ?auto_2321570 ) ) ( not ( = ?auto_2321573 ?auto_2321568 ) ) ( not ( = ?auto_2321573 ?auto_2321570 ) ) ( not ( = ?auto_2321573 ?auto_2321572 ) ) ( not ( = ?auto_2321575 ?auto_2321568 ) ) ( not ( = ?auto_2321575 ?auto_2321570 ) ) ( not ( = ?auto_2321575 ?auto_2321572 ) ) ( not ( = ?auto_2321575 ?auto_2321573 ) ) ( CALIBRATED ?auto_2321578 ) ( ON_BOARD ?auto_2321578 ?auto_2321577 ) ( SUPPORTS ?auto_2321578 ?auto_2321574 ) ( POWER_ON ?auto_2321578 ) ( POINTING ?auto_2321577 ?auto_2321573 ) ( HAVE_IMAGE ?auto_2321568 ?auto_2321569 ) ( HAVE_IMAGE ?auto_2321570 ?auto_2321567 ) ( HAVE_IMAGE ?auto_2321572 ?auto_2321571 ) ( HAVE_IMAGE ?auto_2321575 ?auto_2321576 ) ( not ( = ?auto_2321569 ?auto_2321567 ) ) ( not ( = ?auto_2321569 ?auto_2321571 ) ) ( not ( = ?auto_2321569 ?auto_2321574 ) ) ( not ( = ?auto_2321569 ?auto_2321576 ) ) ( not ( = ?auto_2321567 ?auto_2321571 ) ) ( not ( = ?auto_2321567 ?auto_2321574 ) ) ( not ( = ?auto_2321567 ?auto_2321576 ) ) ( not ( = ?auto_2321571 ?auto_2321574 ) ) ( not ( = ?auto_2321571 ?auto_2321576 ) ) ( not ( = ?auto_2321574 ?auto_2321576 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2321573 ?auto_2321574 )
      ( GET-5IMAGE-VERIFY ?auto_2321568 ?auto_2321569 ?auto_2321570 ?auto_2321567 ?auto_2321572 ?auto_2321571 ?auto_2321573 ?auto_2321574 ?auto_2321575 ?auto_2321576 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2321852 - DIRECTION
      ?auto_2321853 - MODE
      ?auto_2321854 - DIRECTION
      ?auto_2321851 - MODE
      ?auto_2321856 - DIRECTION
      ?auto_2321855 - MODE
      ?auto_2321857 - DIRECTION
      ?auto_2321858 - MODE
      ?auto_2321859 - DIRECTION
      ?auto_2321860 - MODE
    )
    :vars
    (
      ?auto_2321862 - INSTRUMENT
      ?auto_2321861 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_2321854 ?auto_2321852 ) ) ( not ( = ?auto_2321856 ?auto_2321852 ) ) ( not ( = ?auto_2321856 ?auto_2321854 ) ) ( not ( = ?auto_2321857 ?auto_2321852 ) ) ( not ( = ?auto_2321857 ?auto_2321854 ) ) ( not ( = ?auto_2321857 ?auto_2321856 ) ) ( not ( = ?auto_2321859 ?auto_2321852 ) ) ( not ( = ?auto_2321859 ?auto_2321854 ) ) ( not ( = ?auto_2321859 ?auto_2321856 ) ) ( not ( = ?auto_2321859 ?auto_2321857 ) ) ( CALIBRATED ?auto_2321862 ) ( ON_BOARD ?auto_2321862 ?auto_2321861 ) ( SUPPORTS ?auto_2321862 ?auto_2321855 ) ( POWER_ON ?auto_2321862 ) ( POINTING ?auto_2321861 ?auto_2321856 ) ( HAVE_IMAGE ?auto_2321852 ?auto_2321853 ) ( HAVE_IMAGE ?auto_2321854 ?auto_2321851 ) ( HAVE_IMAGE ?auto_2321857 ?auto_2321858 ) ( HAVE_IMAGE ?auto_2321859 ?auto_2321860 ) ( not ( = ?auto_2321853 ?auto_2321851 ) ) ( not ( = ?auto_2321853 ?auto_2321855 ) ) ( not ( = ?auto_2321853 ?auto_2321858 ) ) ( not ( = ?auto_2321853 ?auto_2321860 ) ) ( not ( = ?auto_2321851 ?auto_2321855 ) ) ( not ( = ?auto_2321851 ?auto_2321858 ) ) ( not ( = ?auto_2321851 ?auto_2321860 ) ) ( not ( = ?auto_2321855 ?auto_2321858 ) ) ( not ( = ?auto_2321855 ?auto_2321860 ) ) ( not ( = ?auto_2321858 ?auto_2321860 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2321856 ?auto_2321855 )
      ( GET-5IMAGE-VERIFY ?auto_2321852 ?auto_2321853 ?auto_2321854 ?auto_2321851 ?auto_2321856 ?auto_2321855 ?auto_2321857 ?auto_2321858 ?auto_2321859 ?auto_2321860 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2323890 - DIRECTION
      ?auto_2323891 - MODE
      ?auto_2323892 - DIRECTION
      ?auto_2323889 - MODE
      ?auto_2323894 - DIRECTION
      ?auto_2323893 - MODE
      ?auto_2323895 - DIRECTION
      ?auto_2323896 - MODE
      ?auto_2323897 - DIRECTION
      ?auto_2323898 - MODE
    )
    :vars
    (
      ?auto_2323900 - INSTRUMENT
      ?auto_2323899 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_2323892 ?auto_2323890 ) ) ( not ( = ?auto_2323894 ?auto_2323890 ) ) ( not ( = ?auto_2323894 ?auto_2323892 ) ) ( not ( = ?auto_2323895 ?auto_2323890 ) ) ( not ( = ?auto_2323895 ?auto_2323892 ) ) ( not ( = ?auto_2323895 ?auto_2323894 ) ) ( not ( = ?auto_2323897 ?auto_2323890 ) ) ( not ( = ?auto_2323897 ?auto_2323892 ) ) ( not ( = ?auto_2323897 ?auto_2323894 ) ) ( not ( = ?auto_2323897 ?auto_2323895 ) ) ( CALIBRATED ?auto_2323900 ) ( ON_BOARD ?auto_2323900 ?auto_2323899 ) ( SUPPORTS ?auto_2323900 ?auto_2323889 ) ( POWER_ON ?auto_2323900 ) ( POINTING ?auto_2323899 ?auto_2323892 ) ( HAVE_IMAGE ?auto_2323890 ?auto_2323891 ) ( HAVE_IMAGE ?auto_2323894 ?auto_2323893 ) ( HAVE_IMAGE ?auto_2323895 ?auto_2323896 ) ( HAVE_IMAGE ?auto_2323897 ?auto_2323898 ) ( not ( = ?auto_2323891 ?auto_2323889 ) ) ( not ( = ?auto_2323891 ?auto_2323893 ) ) ( not ( = ?auto_2323891 ?auto_2323896 ) ) ( not ( = ?auto_2323891 ?auto_2323898 ) ) ( not ( = ?auto_2323889 ?auto_2323893 ) ) ( not ( = ?auto_2323889 ?auto_2323896 ) ) ( not ( = ?auto_2323889 ?auto_2323898 ) ) ( not ( = ?auto_2323893 ?auto_2323896 ) ) ( not ( = ?auto_2323893 ?auto_2323898 ) ) ( not ( = ?auto_2323896 ?auto_2323898 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2323892 ?auto_2323889 )
      ( GET-5IMAGE-VERIFY ?auto_2323890 ?auto_2323891 ?auto_2323892 ?auto_2323889 ?auto_2323894 ?auto_2323893 ?auto_2323895 ?auto_2323896 ?auto_2323897 ?auto_2323898 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2338520 - DIRECTION
      ?auto_2338521 - MODE
      ?auto_2338522 - DIRECTION
      ?auto_2338519 - MODE
      ?auto_2338524 - DIRECTION
      ?auto_2338523 - MODE
      ?auto_2338525 - DIRECTION
      ?auto_2338526 - MODE
      ?auto_2338527 - DIRECTION
      ?auto_2338528 - MODE
    )
    :vars
    (
      ?auto_2338530 - INSTRUMENT
      ?auto_2338529 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_2338522 ?auto_2338520 ) ) ( not ( = ?auto_2338524 ?auto_2338520 ) ) ( not ( = ?auto_2338524 ?auto_2338522 ) ) ( not ( = ?auto_2338525 ?auto_2338520 ) ) ( not ( = ?auto_2338525 ?auto_2338522 ) ) ( not ( = ?auto_2338525 ?auto_2338524 ) ) ( not ( = ?auto_2338527 ?auto_2338520 ) ) ( not ( = ?auto_2338527 ?auto_2338522 ) ) ( not ( = ?auto_2338527 ?auto_2338524 ) ) ( not ( = ?auto_2338527 ?auto_2338525 ) ) ( CALIBRATED ?auto_2338530 ) ( ON_BOARD ?auto_2338530 ?auto_2338529 ) ( SUPPORTS ?auto_2338530 ?auto_2338521 ) ( POWER_ON ?auto_2338530 ) ( POINTING ?auto_2338529 ?auto_2338520 ) ( HAVE_IMAGE ?auto_2338522 ?auto_2338519 ) ( HAVE_IMAGE ?auto_2338524 ?auto_2338523 ) ( HAVE_IMAGE ?auto_2338525 ?auto_2338526 ) ( HAVE_IMAGE ?auto_2338527 ?auto_2338528 ) ( not ( = ?auto_2338521 ?auto_2338519 ) ) ( not ( = ?auto_2338521 ?auto_2338523 ) ) ( not ( = ?auto_2338521 ?auto_2338526 ) ) ( not ( = ?auto_2338521 ?auto_2338528 ) ) ( not ( = ?auto_2338519 ?auto_2338523 ) ) ( not ( = ?auto_2338519 ?auto_2338526 ) ) ( not ( = ?auto_2338519 ?auto_2338528 ) ) ( not ( = ?auto_2338523 ?auto_2338526 ) ) ( not ( = ?auto_2338523 ?auto_2338528 ) ) ( not ( = ?auto_2338526 ?auto_2338528 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_2338520 ?auto_2338521 )
      ( GET-5IMAGE-VERIFY ?auto_2338520 ?auto_2338521 ?auto_2338522 ?auto_2338519 ?auto_2338524 ?auto_2338523 ?auto_2338525 ?auto_2338526 ?auto_2338527 ?auto_2338528 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2351209 - DIRECTION
      ?auto_2351210 - MODE
      ?auto_2351211 - DIRECTION
      ?auto_2351208 - MODE
      ?auto_2351213 - DIRECTION
      ?auto_2351212 - MODE
      ?auto_2351214 - DIRECTION
      ?auto_2351215 - MODE
      ?auto_2351216 - DIRECTION
      ?auto_2351217 - MODE
    )
    :vars
    (
      ?auto_2351219 - INSTRUMENT
      ?auto_2351220 - SATELLITE
      ?auto_2351218 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2351211 ?auto_2351209 ) ) ( not ( = ?auto_2351213 ?auto_2351209 ) ) ( not ( = ?auto_2351213 ?auto_2351211 ) ) ( not ( = ?auto_2351214 ?auto_2351209 ) ) ( not ( = ?auto_2351214 ?auto_2351211 ) ) ( not ( = ?auto_2351214 ?auto_2351213 ) ) ( not ( = ?auto_2351216 ?auto_2351209 ) ) ( not ( = ?auto_2351216 ?auto_2351211 ) ) ( not ( = ?auto_2351216 ?auto_2351213 ) ) ( not ( = ?auto_2351216 ?auto_2351214 ) ) ( CALIBRATED ?auto_2351219 ) ( ON_BOARD ?auto_2351219 ?auto_2351220 ) ( SUPPORTS ?auto_2351219 ?auto_2351217 ) ( POWER_ON ?auto_2351219 ) ( POINTING ?auto_2351220 ?auto_2351218 ) ( not ( = ?auto_2351216 ?auto_2351218 ) ) ( HAVE_IMAGE ?auto_2351209 ?auto_2351210 ) ( not ( = ?auto_2351209 ?auto_2351218 ) ) ( not ( = ?auto_2351210 ?auto_2351217 ) ) ( HAVE_IMAGE ?auto_2351211 ?auto_2351208 ) ( HAVE_IMAGE ?auto_2351213 ?auto_2351212 ) ( HAVE_IMAGE ?auto_2351214 ?auto_2351215 ) ( not ( = ?auto_2351210 ?auto_2351208 ) ) ( not ( = ?auto_2351210 ?auto_2351212 ) ) ( not ( = ?auto_2351210 ?auto_2351215 ) ) ( not ( = ?auto_2351211 ?auto_2351218 ) ) ( not ( = ?auto_2351208 ?auto_2351212 ) ) ( not ( = ?auto_2351208 ?auto_2351215 ) ) ( not ( = ?auto_2351208 ?auto_2351217 ) ) ( not ( = ?auto_2351213 ?auto_2351218 ) ) ( not ( = ?auto_2351212 ?auto_2351215 ) ) ( not ( = ?auto_2351212 ?auto_2351217 ) ) ( not ( = ?auto_2351214 ?auto_2351218 ) ) ( not ( = ?auto_2351215 ?auto_2351217 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2351209 ?auto_2351210 ?auto_2351216 ?auto_2351217 )
      ( GET-5IMAGE-VERIFY ?auto_2351209 ?auto_2351210 ?auto_2351211 ?auto_2351208 ?auto_2351213 ?auto_2351212 ?auto_2351214 ?auto_2351215 ?auto_2351216 ?auto_2351217 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2351261 - DIRECTION
      ?auto_2351262 - MODE
      ?auto_2351263 - DIRECTION
      ?auto_2351260 - MODE
      ?auto_2351265 - DIRECTION
      ?auto_2351264 - MODE
      ?auto_2351266 - DIRECTION
      ?auto_2351267 - MODE
      ?auto_2351268 - DIRECTION
      ?auto_2351269 - MODE
    )
    :vars
    (
      ?auto_2351271 - INSTRUMENT
      ?auto_2351272 - SATELLITE
      ?auto_2351270 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2351263 ?auto_2351261 ) ) ( not ( = ?auto_2351265 ?auto_2351261 ) ) ( not ( = ?auto_2351265 ?auto_2351263 ) ) ( not ( = ?auto_2351266 ?auto_2351261 ) ) ( not ( = ?auto_2351266 ?auto_2351263 ) ) ( not ( = ?auto_2351266 ?auto_2351265 ) ) ( not ( = ?auto_2351268 ?auto_2351261 ) ) ( not ( = ?auto_2351268 ?auto_2351263 ) ) ( not ( = ?auto_2351268 ?auto_2351265 ) ) ( not ( = ?auto_2351268 ?auto_2351266 ) ) ( CALIBRATED ?auto_2351271 ) ( ON_BOARD ?auto_2351271 ?auto_2351272 ) ( SUPPORTS ?auto_2351271 ?auto_2351267 ) ( POWER_ON ?auto_2351271 ) ( POINTING ?auto_2351272 ?auto_2351270 ) ( not ( = ?auto_2351266 ?auto_2351270 ) ) ( HAVE_IMAGE ?auto_2351261 ?auto_2351262 ) ( not ( = ?auto_2351261 ?auto_2351270 ) ) ( not ( = ?auto_2351262 ?auto_2351267 ) ) ( HAVE_IMAGE ?auto_2351263 ?auto_2351260 ) ( HAVE_IMAGE ?auto_2351265 ?auto_2351264 ) ( HAVE_IMAGE ?auto_2351268 ?auto_2351269 ) ( not ( = ?auto_2351262 ?auto_2351260 ) ) ( not ( = ?auto_2351262 ?auto_2351264 ) ) ( not ( = ?auto_2351262 ?auto_2351269 ) ) ( not ( = ?auto_2351263 ?auto_2351270 ) ) ( not ( = ?auto_2351260 ?auto_2351264 ) ) ( not ( = ?auto_2351260 ?auto_2351267 ) ) ( not ( = ?auto_2351260 ?auto_2351269 ) ) ( not ( = ?auto_2351265 ?auto_2351270 ) ) ( not ( = ?auto_2351264 ?auto_2351267 ) ) ( not ( = ?auto_2351264 ?auto_2351269 ) ) ( not ( = ?auto_2351267 ?auto_2351269 ) ) ( not ( = ?auto_2351268 ?auto_2351270 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2351261 ?auto_2351262 ?auto_2351266 ?auto_2351267 )
      ( GET-5IMAGE-VERIFY ?auto_2351261 ?auto_2351262 ?auto_2351263 ?auto_2351260 ?auto_2351265 ?auto_2351264 ?auto_2351266 ?auto_2351267 ?auto_2351268 ?auto_2351269 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2351567 - DIRECTION
      ?auto_2351568 - MODE
      ?auto_2351569 - DIRECTION
      ?auto_2351566 - MODE
      ?auto_2351571 - DIRECTION
      ?auto_2351570 - MODE
      ?auto_2351572 - DIRECTION
      ?auto_2351573 - MODE
      ?auto_2351574 - DIRECTION
      ?auto_2351575 - MODE
    )
    :vars
    (
      ?auto_2351577 - INSTRUMENT
      ?auto_2351578 - SATELLITE
      ?auto_2351576 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2351569 ?auto_2351567 ) ) ( not ( = ?auto_2351571 ?auto_2351567 ) ) ( not ( = ?auto_2351571 ?auto_2351569 ) ) ( not ( = ?auto_2351572 ?auto_2351567 ) ) ( not ( = ?auto_2351572 ?auto_2351569 ) ) ( not ( = ?auto_2351572 ?auto_2351571 ) ) ( not ( = ?auto_2351574 ?auto_2351567 ) ) ( not ( = ?auto_2351574 ?auto_2351569 ) ) ( not ( = ?auto_2351574 ?auto_2351571 ) ) ( not ( = ?auto_2351574 ?auto_2351572 ) ) ( CALIBRATED ?auto_2351577 ) ( ON_BOARD ?auto_2351577 ?auto_2351578 ) ( SUPPORTS ?auto_2351577 ?auto_2351570 ) ( POWER_ON ?auto_2351577 ) ( POINTING ?auto_2351578 ?auto_2351576 ) ( not ( = ?auto_2351571 ?auto_2351576 ) ) ( HAVE_IMAGE ?auto_2351567 ?auto_2351568 ) ( not ( = ?auto_2351567 ?auto_2351576 ) ) ( not ( = ?auto_2351568 ?auto_2351570 ) ) ( HAVE_IMAGE ?auto_2351569 ?auto_2351566 ) ( HAVE_IMAGE ?auto_2351572 ?auto_2351573 ) ( HAVE_IMAGE ?auto_2351574 ?auto_2351575 ) ( not ( = ?auto_2351568 ?auto_2351566 ) ) ( not ( = ?auto_2351568 ?auto_2351573 ) ) ( not ( = ?auto_2351568 ?auto_2351575 ) ) ( not ( = ?auto_2351569 ?auto_2351576 ) ) ( not ( = ?auto_2351566 ?auto_2351570 ) ) ( not ( = ?auto_2351566 ?auto_2351573 ) ) ( not ( = ?auto_2351566 ?auto_2351575 ) ) ( not ( = ?auto_2351570 ?auto_2351573 ) ) ( not ( = ?auto_2351570 ?auto_2351575 ) ) ( not ( = ?auto_2351572 ?auto_2351576 ) ) ( not ( = ?auto_2351573 ?auto_2351575 ) ) ( not ( = ?auto_2351574 ?auto_2351576 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2351567 ?auto_2351568 ?auto_2351571 ?auto_2351570 )
      ( GET-5IMAGE-VERIFY ?auto_2351567 ?auto_2351568 ?auto_2351569 ?auto_2351566 ?auto_2351571 ?auto_2351570 ?auto_2351572 ?auto_2351573 ?auto_2351574 ?auto_2351575 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2353764 - DIRECTION
      ?auto_2353765 - MODE
      ?auto_2353766 - DIRECTION
      ?auto_2353763 - MODE
      ?auto_2353768 - DIRECTION
      ?auto_2353767 - MODE
      ?auto_2353769 - DIRECTION
      ?auto_2353770 - MODE
      ?auto_2353771 - DIRECTION
      ?auto_2353772 - MODE
    )
    :vars
    (
      ?auto_2353774 - INSTRUMENT
      ?auto_2353775 - SATELLITE
      ?auto_2353773 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2353766 ?auto_2353764 ) ) ( not ( = ?auto_2353768 ?auto_2353764 ) ) ( not ( = ?auto_2353768 ?auto_2353766 ) ) ( not ( = ?auto_2353769 ?auto_2353764 ) ) ( not ( = ?auto_2353769 ?auto_2353766 ) ) ( not ( = ?auto_2353769 ?auto_2353768 ) ) ( not ( = ?auto_2353771 ?auto_2353764 ) ) ( not ( = ?auto_2353771 ?auto_2353766 ) ) ( not ( = ?auto_2353771 ?auto_2353768 ) ) ( not ( = ?auto_2353771 ?auto_2353769 ) ) ( CALIBRATED ?auto_2353774 ) ( ON_BOARD ?auto_2353774 ?auto_2353775 ) ( SUPPORTS ?auto_2353774 ?auto_2353763 ) ( POWER_ON ?auto_2353774 ) ( POINTING ?auto_2353775 ?auto_2353773 ) ( not ( = ?auto_2353766 ?auto_2353773 ) ) ( HAVE_IMAGE ?auto_2353764 ?auto_2353765 ) ( not ( = ?auto_2353764 ?auto_2353773 ) ) ( not ( = ?auto_2353765 ?auto_2353763 ) ) ( HAVE_IMAGE ?auto_2353768 ?auto_2353767 ) ( HAVE_IMAGE ?auto_2353769 ?auto_2353770 ) ( HAVE_IMAGE ?auto_2353771 ?auto_2353772 ) ( not ( = ?auto_2353765 ?auto_2353767 ) ) ( not ( = ?auto_2353765 ?auto_2353770 ) ) ( not ( = ?auto_2353765 ?auto_2353772 ) ) ( not ( = ?auto_2353763 ?auto_2353767 ) ) ( not ( = ?auto_2353763 ?auto_2353770 ) ) ( not ( = ?auto_2353763 ?auto_2353772 ) ) ( not ( = ?auto_2353768 ?auto_2353773 ) ) ( not ( = ?auto_2353767 ?auto_2353770 ) ) ( not ( = ?auto_2353767 ?auto_2353772 ) ) ( not ( = ?auto_2353769 ?auto_2353773 ) ) ( not ( = ?auto_2353770 ?auto_2353772 ) ) ( not ( = ?auto_2353771 ?auto_2353773 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2353764 ?auto_2353765 ?auto_2353766 ?auto_2353763 )
      ( GET-5IMAGE-VERIFY ?auto_2353764 ?auto_2353765 ?auto_2353766 ?auto_2353763 ?auto_2353768 ?auto_2353767 ?auto_2353769 ?auto_2353770 ?auto_2353771 ?auto_2353772 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2370599 - DIRECTION
      ?auto_2370600 - MODE
      ?auto_2370601 - DIRECTION
      ?auto_2370598 - MODE
      ?auto_2370603 - DIRECTION
      ?auto_2370602 - MODE
      ?auto_2370604 - DIRECTION
      ?auto_2370605 - MODE
      ?auto_2370606 - DIRECTION
      ?auto_2370607 - MODE
    )
    :vars
    (
      ?auto_2370609 - INSTRUMENT
      ?auto_2370610 - SATELLITE
      ?auto_2370608 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2370601 ?auto_2370599 ) ) ( not ( = ?auto_2370603 ?auto_2370599 ) ) ( not ( = ?auto_2370603 ?auto_2370601 ) ) ( not ( = ?auto_2370604 ?auto_2370599 ) ) ( not ( = ?auto_2370604 ?auto_2370601 ) ) ( not ( = ?auto_2370604 ?auto_2370603 ) ) ( not ( = ?auto_2370606 ?auto_2370599 ) ) ( not ( = ?auto_2370606 ?auto_2370601 ) ) ( not ( = ?auto_2370606 ?auto_2370603 ) ) ( not ( = ?auto_2370606 ?auto_2370604 ) ) ( CALIBRATED ?auto_2370609 ) ( ON_BOARD ?auto_2370609 ?auto_2370610 ) ( SUPPORTS ?auto_2370609 ?auto_2370600 ) ( POWER_ON ?auto_2370609 ) ( POINTING ?auto_2370610 ?auto_2370608 ) ( not ( = ?auto_2370599 ?auto_2370608 ) ) ( HAVE_IMAGE ?auto_2370601 ?auto_2370598 ) ( not ( = ?auto_2370601 ?auto_2370608 ) ) ( not ( = ?auto_2370598 ?auto_2370600 ) ) ( HAVE_IMAGE ?auto_2370603 ?auto_2370602 ) ( HAVE_IMAGE ?auto_2370604 ?auto_2370605 ) ( HAVE_IMAGE ?auto_2370606 ?auto_2370607 ) ( not ( = ?auto_2370600 ?auto_2370602 ) ) ( not ( = ?auto_2370600 ?auto_2370605 ) ) ( not ( = ?auto_2370600 ?auto_2370607 ) ) ( not ( = ?auto_2370598 ?auto_2370602 ) ) ( not ( = ?auto_2370598 ?auto_2370605 ) ) ( not ( = ?auto_2370598 ?auto_2370607 ) ) ( not ( = ?auto_2370603 ?auto_2370608 ) ) ( not ( = ?auto_2370602 ?auto_2370605 ) ) ( not ( = ?auto_2370602 ?auto_2370607 ) ) ( not ( = ?auto_2370604 ?auto_2370608 ) ) ( not ( = ?auto_2370605 ?auto_2370607 ) ) ( not ( = ?auto_2370606 ?auto_2370608 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2370601 ?auto_2370598 ?auto_2370599 ?auto_2370600 )
      ( GET-5IMAGE-VERIFY ?auto_2370599 ?auto_2370600 ?auto_2370601 ?auto_2370598 ?auto_2370603 ?auto_2370602 ?auto_2370604 ?auto_2370605 ?auto_2370606 ?auto_2370607 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2384366 - DIRECTION
      ?auto_2384367 - MODE
      ?auto_2384368 - DIRECTION
      ?auto_2384365 - MODE
      ?auto_2384370 - DIRECTION
      ?auto_2384369 - MODE
      ?auto_2384371 - DIRECTION
      ?auto_2384372 - MODE
      ?auto_2384373 - DIRECTION
      ?auto_2384374 - MODE
    )
    :vars
    (
      ?auto_2384375 - INSTRUMENT
      ?auto_2384376 - SATELLITE
      ?auto_2384377 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2384368 ?auto_2384366 ) ) ( not ( = ?auto_2384370 ?auto_2384366 ) ) ( not ( = ?auto_2384370 ?auto_2384368 ) ) ( not ( = ?auto_2384371 ?auto_2384366 ) ) ( not ( = ?auto_2384371 ?auto_2384368 ) ) ( not ( = ?auto_2384371 ?auto_2384370 ) ) ( not ( = ?auto_2384373 ?auto_2384366 ) ) ( not ( = ?auto_2384373 ?auto_2384368 ) ) ( not ( = ?auto_2384373 ?auto_2384370 ) ) ( not ( = ?auto_2384373 ?auto_2384371 ) ) ( ON_BOARD ?auto_2384375 ?auto_2384376 ) ( SUPPORTS ?auto_2384375 ?auto_2384374 ) ( POWER_ON ?auto_2384375 ) ( POINTING ?auto_2384376 ?auto_2384377 ) ( not ( = ?auto_2384373 ?auto_2384377 ) ) ( HAVE_IMAGE ?auto_2384366 ?auto_2384367 ) ( not ( = ?auto_2384366 ?auto_2384377 ) ) ( not ( = ?auto_2384367 ?auto_2384374 ) ) ( CALIBRATION_TARGET ?auto_2384375 ?auto_2384377 ) ( NOT_CALIBRATED ?auto_2384375 ) ( HAVE_IMAGE ?auto_2384368 ?auto_2384365 ) ( HAVE_IMAGE ?auto_2384370 ?auto_2384369 ) ( HAVE_IMAGE ?auto_2384371 ?auto_2384372 ) ( not ( = ?auto_2384367 ?auto_2384365 ) ) ( not ( = ?auto_2384367 ?auto_2384369 ) ) ( not ( = ?auto_2384367 ?auto_2384372 ) ) ( not ( = ?auto_2384368 ?auto_2384377 ) ) ( not ( = ?auto_2384365 ?auto_2384369 ) ) ( not ( = ?auto_2384365 ?auto_2384372 ) ) ( not ( = ?auto_2384365 ?auto_2384374 ) ) ( not ( = ?auto_2384370 ?auto_2384377 ) ) ( not ( = ?auto_2384369 ?auto_2384372 ) ) ( not ( = ?auto_2384369 ?auto_2384374 ) ) ( not ( = ?auto_2384371 ?auto_2384377 ) ) ( not ( = ?auto_2384372 ?auto_2384374 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2384366 ?auto_2384367 ?auto_2384373 ?auto_2384374 )
      ( GET-5IMAGE-VERIFY ?auto_2384366 ?auto_2384367 ?auto_2384368 ?auto_2384365 ?auto_2384370 ?auto_2384369 ?auto_2384371 ?auto_2384372 ?auto_2384373 ?auto_2384374 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2384418 - DIRECTION
      ?auto_2384419 - MODE
      ?auto_2384420 - DIRECTION
      ?auto_2384417 - MODE
      ?auto_2384422 - DIRECTION
      ?auto_2384421 - MODE
      ?auto_2384423 - DIRECTION
      ?auto_2384424 - MODE
      ?auto_2384425 - DIRECTION
      ?auto_2384426 - MODE
    )
    :vars
    (
      ?auto_2384427 - INSTRUMENT
      ?auto_2384428 - SATELLITE
      ?auto_2384429 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2384420 ?auto_2384418 ) ) ( not ( = ?auto_2384422 ?auto_2384418 ) ) ( not ( = ?auto_2384422 ?auto_2384420 ) ) ( not ( = ?auto_2384423 ?auto_2384418 ) ) ( not ( = ?auto_2384423 ?auto_2384420 ) ) ( not ( = ?auto_2384423 ?auto_2384422 ) ) ( not ( = ?auto_2384425 ?auto_2384418 ) ) ( not ( = ?auto_2384425 ?auto_2384420 ) ) ( not ( = ?auto_2384425 ?auto_2384422 ) ) ( not ( = ?auto_2384425 ?auto_2384423 ) ) ( ON_BOARD ?auto_2384427 ?auto_2384428 ) ( SUPPORTS ?auto_2384427 ?auto_2384424 ) ( POWER_ON ?auto_2384427 ) ( POINTING ?auto_2384428 ?auto_2384429 ) ( not ( = ?auto_2384423 ?auto_2384429 ) ) ( HAVE_IMAGE ?auto_2384418 ?auto_2384419 ) ( not ( = ?auto_2384418 ?auto_2384429 ) ) ( not ( = ?auto_2384419 ?auto_2384424 ) ) ( CALIBRATION_TARGET ?auto_2384427 ?auto_2384429 ) ( NOT_CALIBRATED ?auto_2384427 ) ( HAVE_IMAGE ?auto_2384420 ?auto_2384417 ) ( HAVE_IMAGE ?auto_2384422 ?auto_2384421 ) ( HAVE_IMAGE ?auto_2384425 ?auto_2384426 ) ( not ( = ?auto_2384419 ?auto_2384417 ) ) ( not ( = ?auto_2384419 ?auto_2384421 ) ) ( not ( = ?auto_2384419 ?auto_2384426 ) ) ( not ( = ?auto_2384420 ?auto_2384429 ) ) ( not ( = ?auto_2384417 ?auto_2384421 ) ) ( not ( = ?auto_2384417 ?auto_2384424 ) ) ( not ( = ?auto_2384417 ?auto_2384426 ) ) ( not ( = ?auto_2384422 ?auto_2384429 ) ) ( not ( = ?auto_2384421 ?auto_2384424 ) ) ( not ( = ?auto_2384421 ?auto_2384426 ) ) ( not ( = ?auto_2384424 ?auto_2384426 ) ) ( not ( = ?auto_2384425 ?auto_2384429 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2384418 ?auto_2384419 ?auto_2384423 ?auto_2384424 )
      ( GET-5IMAGE-VERIFY ?auto_2384418 ?auto_2384419 ?auto_2384420 ?auto_2384417 ?auto_2384422 ?auto_2384421 ?auto_2384423 ?auto_2384424 ?auto_2384425 ?auto_2384426 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2384724 - DIRECTION
      ?auto_2384725 - MODE
      ?auto_2384726 - DIRECTION
      ?auto_2384723 - MODE
      ?auto_2384728 - DIRECTION
      ?auto_2384727 - MODE
      ?auto_2384729 - DIRECTION
      ?auto_2384730 - MODE
      ?auto_2384731 - DIRECTION
      ?auto_2384732 - MODE
    )
    :vars
    (
      ?auto_2384733 - INSTRUMENT
      ?auto_2384734 - SATELLITE
      ?auto_2384735 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2384726 ?auto_2384724 ) ) ( not ( = ?auto_2384728 ?auto_2384724 ) ) ( not ( = ?auto_2384728 ?auto_2384726 ) ) ( not ( = ?auto_2384729 ?auto_2384724 ) ) ( not ( = ?auto_2384729 ?auto_2384726 ) ) ( not ( = ?auto_2384729 ?auto_2384728 ) ) ( not ( = ?auto_2384731 ?auto_2384724 ) ) ( not ( = ?auto_2384731 ?auto_2384726 ) ) ( not ( = ?auto_2384731 ?auto_2384728 ) ) ( not ( = ?auto_2384731 ?auto_2384729 ) ) ( ON_BOARD ?auto_2384733 ?auto_2384734 ) ( SUPPORTS ?auto_2384733 ?auto_2384727 ) ( POWER_ON ?auto_2384733 ) ( POINTING ?auto_2384734 ?auto_2384735 ) ( not ( = ?auto_2384728 ?auto_2384735 ) ) ( HAVE_IMAGE ?auto_2384724 ?auto_2384725 ) ( not ( = ?auto_2384724 ?auto_2384735 ) ) ( not ( = ?auto_2384725 ?auto_2384727 ) ) ( CALIBRATION_TARGET ?auto_2384733 ?auto_2384735 ) ( NOT_CALIBRATED ?auto_2384733 ) ( HAVE_IMAGE ?auto_2384726 ?auto_2384723 ) ( HAVE_IMAGE ?auto_2384729 ?auto_2384730 ) ( HAVE_IMAGE ?auto_2384731 ?auto_2384732 ) ( not ( = ?auto_2384725 ?auto_2384723 ) ) ( not ( = ?auto_2384725 ?auto_2384730 ) ) ( not ( = ?auto_2384725 ?auto_2384732 ) ) ( not ( = ?auto_2384726 ?auto_2384735 ) ) ( not ( = ?auto_2384723 ?auto_2384727 ) ) ( not ( = ?auto_2384723 ?auto_2384730 ) ) ( not ( = ?auto_2384723 ?auto_2384732 ) ) ( not ( = ?auto_2384727 ?auto_2384730 ) ) ( not ( = ?auto_2384727 ?auto_2384732 ) ) ( not ( = ?auto_2384729 ?auto_2384735 ) ) ( not ( = ?auto_2384730 ?auto_2384732 ) ) ( not ( = ?auto_2384731 ?auto_2384735 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2384724 ?auto_2384725 ?auto_2384728 ?auto_2384727 )
      ( GET-5IMAGE-VERIFY ?auto_2384724 ?auto_2384725 ?auto_2384726 ?auto_2384723 ?auto_2384728 ?auto_2384727 ?auto_2384729 ?auto_2384730 ?auto_2384731 ?auto_2384732 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2386921 - DIRECTION
      ?auto_2386922 - MODE
      ?auto_2386923 - DIRECTION
      ?auto_2386920 - MODE
      ?auto_2386925 - DIRECTION
      ?auto_2386924 - MODE
      ?auto_2386926 - DIRECTION
      ?auto_2386927 - MODE
      ?auto_2386928 - DIRECTION
      ?auto_2386929 - MODE
    )
    :vars
    (
      ?auto_2386930 - INSTRUMENT
      ?auto_2386931 - SATELLITE
      ?auto_2386932 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2386923 ?auto_2386921 ) ) ( not ( = ?auto_2386925 ?auto_2386921 ) ) ( not ( = ?auto_2386925 ?auto_2386923 ) ) ( not ( = ?auto_2386926 ?auto_2386921 ) ) ( not ( = ?auto_2386926 ?auto_2386923 ) ) ( not ( = ?auto_2386926 ?auto_2386925 ) ) ( not ( = ?auto_2386928 ?auto_2386921 ) ) ( not ( = ?auto_2386928 ?auto_2386923 ) ) ( not ( = ?auto_2386928 ?auto_2386925 ) ) ( not ( = ?auto_2386928 ?auto_2386926 ) ) ( ON_BOARD ?auto_2386930 ?auto_2386931 ) ( SUPPORTS ?auto_2386930 ?auto_2386920 ) ( POWER_ON ?auto_2386930 ) ( POINTING ?auto_2386931 ?auto_2386932 ) ( not ( = ?auto_2386923 ?auto_2386932 ) ) ( HAVE_IMAGE ?auto_2386921 ?auto_2386922 ) ( not ( = ?auto_2386921 ?auto_2386932 ) ) ( not ( = ?auto_2386922 ?auto_2386920 ) ) ( CALIBRATION_TARGET ?auto_2386930 ?auto_2386932 ) ( NOT_CALIBRATED ?auto_2386930 ) ( HAVE_IMAGE ?auto_2386925 ?auto_2386924 ) ( HAVE_IMAGE ?auto_2386926 ?auto_2386927 ) ( HAVE_IMAGE ?auto_2386928 ?auto_2386929 ) ( not ( = ?auto_2386922 ?auto_2386924 ) ) ( not ( = ?auto_2386922 ?auto_2386927 ) ) ( not ( = ?auto_2386922 ?auto_2386929 ) ) ( not ( = ?auto_2386920 ?auto_2386924 ) ) ( not ( = ?auto_2386920 ?auto_2386927 ) ) ( not ( = ?auto_2386920 ?auto_2386929 ) ) ( not ( = ?auto_2386925 ?auto_2386932 ) ) ( not ( = ?auto_2386924 ?auto_2386927 ) ) ( not ( = ?auto_2386924 ?auto_2386929 ) ) ( not ( = ?auto_2386926 ?auto_2386932 ) ) ( not ( = ?auto_2386927 ?auto_2386929 ) ) ( not ( = ?auto_2386928 ?auto_2386932 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2386921 ?auto_2386922 ?auto_2386923 ?auto_2386920 )
      ( GET-5IMAGE-VERIFY ?auto_2386921 ?auto_2386922 ?auto_2386923 ?auto_2386920 ?auto_2386925 ?auto_2386924 ?auto_2386926 ?auto_2386927 ?auto_2386928 ?auto_2386929 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2403756 - DIRECTION
      ?auto_2403757 - MODE
      ?auto_2403758 - DIRECTION
      ?auto_2403755 - MODE
      ?auto_2403760 - DIRECTION
      ?auto_2403759 - MODE
      ?auto_2403761 - DIRECTION
      ?auto_2403762 - MODE
      ?auto_2403763 - DIRECTION
      ?auto_2403764 - MODE
    )
    :vars
    (
      ?auto_2403765 - INSTRUMENT
      ?auto_2403766 - SATELLITE
      ?auto_2403767 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2403758 ?auto_2403756 ) ) ( not ( = ?auto_2403760 ?auto_2403756 ) ) ( not ( = ?auto_2403760 ?auto_2403758 ) ) ( not ( = ?auto_2403761 ?auto_2403756 ) ) ( not ( = ?auto_2403761 ?auto_2403758 ) ) ( not ( = ?auto_2403761 ?auto_2403760 ) ) ( not ( = ?auto_2403763 ?auto_2403756 ) ) ( not ( = ?auto_2403763 ?auto_2403758 ) ) ( not ( = ?auto_2403763 ?auto_2403760 ) ) ( not ( = ?auto_2403763 ?auto_2403761 ) ) ( ON_BOARD ?auto_2403765 ?auto_2403766 ) ( SUPPORTS ?auto_2403765 ?auto_2403757 ) ( POWER_ON ?auto_2403765 ) ( POINTING ?auto_2403766 ?auto_2403767 ) ( not ( = ?auto_2403756 ?auto_2403767 ) ) ( HAVE_IMAGE ?auto_2403758 ?auto_2403755 ) ( not ( = ?auto_2403758 ?auto_2403767 ) ) ( not ( = ?auto_2403755 ?auto_2403757 ) ) ( CALIBRATION_TARGET ?auto_2403765 ?auto_2403767 ) ( NOT_CALIBRATED ?auto_2403765 ) ( HAVE_IMAGE ?auto_2403760 ?auto_2403759 ) ( HAVE_IMAGE ?auto_2403761 ?auto_2403762 ) ( HAVE_IMAGE ?auto_2403763 ?auto_2403764 ) ( not ( = ?auto_2403757 ?auto_2403759 ) ) ( not ( = ?auto_2403757 ?auto_2403762 ) ) ( not ( = ?auto_2403757 ?auto_2403764 ) ) ( not ( = ?auto_2403755 ?auto_2403759 ) ) ( not ( = ?auto_2403755 ?auto_2403762 ) ) ( not ( = ?auto_2403755 ?auto_2403764 ) ) ( not ( = ?auto_2403760 ?auto_2403767 ) ) ( not ( = ?auto_2403759 ?auto_2403762 ) ) ( not ( = ?auto_2403759 ?auto_2403764 ) ) ( not ( = ?auto_2403761 ?auto_2403767 ) ) ( not ( = ?auto_2403762 ?auto_2403764 ) ) ( not ( = ?auto_2403763 ?auto_2403767 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2403758 ?auto_2403755 ?auto_2403756 ?auto_2403757 )
      ( GET-5IMAGE-VERIFY ?auto_2403756 ?auto_2403757 ?auto_2403758 ?auto_2403755 ?auto_2403760 ?auto_2403759 ?auto_2403761 ?auto_2403762 ?auto_2403763 ?auto_2403764 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2417523 - DIRECTION
      ?auto_2417524 - MODE
      ?auto_2417525 - DIRECTION
      ?auto_2417522 - MODE
      ?auto_2417527 - DIRECTION
      ?auto_2417526 - MODE
      ?auto_2417528 - DIRECTION
      ?auto_2417529 - MODE
      ?auto_2417530 - DIRECTION
      ?auto_2417531 - MODE
    )
    :vars
    (
      ?auto_2417534 - INSTRUMENT
      ?auto_2417532 - SATELLITE
      ?auto_2417533 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2417525 ?auto_2417523 ) ) ( not ( = ?auto_2417527 ?auto_2417523 ) ) ( not ( = ?auto_2417527 ?auto_2417525 ) ) ( not ( = ?auto_2417528 ?auto_2417523 ) ) ( not ( = ?auto_2417528 ?auto_2417525 ) ) ( not ( = ?auto_2417528 ?auto_2417527 ) ) ( not ( = ?auto_2417530 ?auto_2417523 ) ) ( not ( = ?auto_2417530 ?auto_2417525 ) ) ( not ( = ?auto_2417530 ?auto_2417527 ) ) ( not ( = ?auto_2417530 ?auto_2417528 ) ) ( ON_BOARD ?auto_2417534 ?auto_2417532 ) ( SUPPORTS ?auto_2417534 ?auto_2417531 ) ( POINTING ?auto_2417532 ?auto_2417533 ) ( not ( = ?auto_2417530 ?auto_2417533 ) ) ( HAVE_IMAGE ?auto_2417523 ?auto_2417524 ) ( not ( = ?auto_2417523 ?auto_2417533 ) ) ( not ( = ?auto_2417524 ?auto_2417531 ) ) ( CALIBRATION_TARGET ?auto_2417534 ?auto_2417533 ) ( POWER_AVAIL ?auto_2417532 ) ( HAVE_IMAGE ?auto_2417525 ?auto_2417522 ) ( HAVE_IMAGE ?auto_2417527 ?auto_2417526 ) ( HAVE_IMAGE ?auto_2417528 ?auto_2417529 ) ( not ( = ?auto_2417524 ?auto_2417522 ) ) ( not ( = ?auto_2417524 ?auto_2417526 ) ) ( not ( = ?auto_2417524 ?auto_2417529 ) ) ( not ( = ?auto_2417525 ?auto_2417533 ) ) ( not ( = ?auto_2417522 ?auto_2417526 ) ) ( not ( = ?auto_2417522 ?auto_2417529 ) ) ( not ( = ?auto_2417522 ?auto_2417531 ) ) ( not ( = ?auto_2417527 ?auto_2417533 ) ) ( not ( = ?auto_2417526 ?auto_2417529 ) ) ( not ( = ?auto_2417526 ?auto_2417531 ) ) ( not ( = ?auto_2417528 ?auto_2417533 ) ) ( not ( = ?auto_2417529 ?auto_2417531 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2417523 ?auto_2417524 ?auto_2417530 ?auto_2417531 )
      ( GET-5IMAGE-VERIFY ?auto_2417523 ?auto_2417524 ?auto_2417525 ?auto_2417522 ?auto_2417527 ?auto_2417526 ?auto_2417528 ?auto_2417529 ?auto_2417530 ?auto_2417531 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2417575 - DIRECTION
      ?auto_2417576 - MODE
      ?auto_2417577 - DIRECTION
      ?auto_2417574 - MODE
      ?auto_2417579 - DIRECTION
      ?auto_2417578 - MODE
      ?auto_2417580 - DIRECTION
      ?auto_2417581 - MODE
      ?auto_2417582 - DIRECTION
      ?auto_2417583 - MODE
    )
    :vars
    (
      ?auto_2417586 - INSTRUMENT
      ?auto_2417584 - SATELLITE
      ?auto_2417585 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2417577 ?auto_2417575 ) ) ( not ( = ?auto_2417579 ?auto_2417575 ) ) ( not ( = ?auto_2417579 ?auto_2417577 ) ) ( not ( = ?auto_2417580 ?auto_2417575 ) ) ( not ( = ?auto_2417580 ?auto_2417577 ) ) ( not ( = ?auto_2417580 ?auto_2417579 ) ) ( not ( = ?auto_2417582 ?auto_2417575 ) ) ( not ( = ?auto_2417582 ?auto_2417577 ) ) ( not ( = ?auto_2417582 ?auto_2417579 ) ) ( not ( = ?auto_2417582 ?auto_2417580 ) ) ( ON_BOARD ?auto_2417586 ?auto_2417584 ) ( SUPPORTS ?auto_2417586 ?auto_2417581 ) ( POINTING ?auto_2417584 ?auto_2417585 ) ( not ( = ?auto_2417580 ?auto_2417585 ) ) ( HAVE_IMAGE ?auto_2417575 ?auto_2417576 ) ( not ( = ?auto_2417575 ?auto_2417585 ) ) ( not ( = ?auto_2417576 ?auto_2417581 ) ) ( CALIBRATION_TARGET ?auto_2417586 ?auto_2417585 ) ( POWER_AVAIL ?auto_2417584 ) ( HAVE_IMAGE ?auto_2417577 ?auto_2417574 ) ( HAVE_IMAGE ?auto_2417579 ?auto_2417578 ) ( HAVE_IMAGE ?auto_2417582 ?auto_2417583 ) ( not ( = ?auto_2417576 ?auto_2417574 ) ) ( not ( = ?auto_2417576 ?auto_2417578 ) ) ( not ( = ?auto_2417576 ?auto_2417583 ) ) ( not ( = ?auto_2417577 ?auto_2417585 ) ) ( not ( = ?auto_2417574 ?auto_2417578 ) ) ( not ( = ?auto_2417574 ?auto_2417581 ) ) ( not ( = ?auto_2417574 ?auto_2417583 ) ) ( not ( = ?auto_2417579 ?auto_2417585 ) ) ( not ( = ?auto_2417578 ?auto_2417581 ) ) ( not ( = ?auto_2417578 ?auto_2417583 ) ) ( not ( = ?auto_2417581 ?auto_2417583 ) ) ( not ( = ?auto_2417582 ?auto_2417585 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2417575 ?auto_2417576 ?auto_2417580 ?auto_2417581 )
      ( GET-5IMAGE-VERIFY ?auto_2417575 ?auto_2417576 ?auto_2417577 ?auto_2417574 ?auto_2417579 ?auto_2417578 ?auto_2417580 ?auto_2417581 ?auto_2417582 ?auto_2417583 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2417881 - DIRECTION
      ?auto_2417882 - MODE
      ?auto_2417883 - DIRECTION
      ?auto_2417880 - MODE
      ?auto_2417885 - DIRECTION
      ?auto_2417884 - MODE
      ?auto_2417886 - DIRECTION
      ?auto_2417887 - MODE
      ?auto_2417888 - DIRECTION
      ?auto_2417889 - MODE
    )
    :vars
    (
      ?auto_2417892 - INSTRUMENT
      ?auto_2417890 - SATELLITE
      ?auto_2417891 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2417883 ?auto_2417881 ) ) ( not ( = ?auto_2417885 ?auto_2417881 ) ) ( not ( = ?auto_2417885 ?auto_2417883 ) ) ( not ( = ?auto_2417886 ?auto_2417881 ) ) ( not ( = ?auto_2417886 ?auto_2417883 ) ) ( not ( = ?auto_2417886 ?auto_2417885 ) ) ( not ( = ?auto_2417888 ?auto_2417881 ) ) ( not ( = ?auto_2417888 ?auto_2417883 ) ) ( not ( = ?auto_2417888 ?auto_2417885 ) ) ( not ( = ?auto_2417888 ?auto_2417886 ) ) ( ON_BOARD ?auto_2417892 ?auto_2417890 ) ( SUPPORTS ?auto_2417892 ?auto_2417884 ) ( POINTING ?auto_2417890 ?auto_2417891 ) ( not ( = ?auto_2417885 ?auto_2417891 ) ) ( HAVE_IMAGE ?auto_2417881 ?auto_2417882 ) ( not ( = ?auto_2417881 ?auto_2417891 ) ) ( not ( = ?auto_2417882 ?auto_2417884 ) ) ( CALIBRATION_TARGET ?auto_2417892 ?auto_2417891 ) ( POWER_AVAIL ?auto_2417890 ) ( HAVE_IMAGE ?auto_2417883 ?auto_2417880 ) ( HAVE_IMAGE ?auto_2417886 ?auto_2417887 ) ( HAVE_IMAGE ?auto_2417888 ?auto_2417889 ) ( not ( = ?auto_2417882 ?auto_2417880 ) ) ( not ( = ?auto_2417882 ?auto_2417887 ) ) ( not ( = ?auto_2417882 ?auto_2417889 ) ) ( not ( = ?auto_2417883 ?auto_2417891 ) ) ( not ( = ?auto_2417880 ?auto_2417884 ) ) ( not ( = ?auto_2417880 ?auto_2417887 ) ) ( not ( = ?auto_2417880 ?auto_2417889 ) ) ( not ( = ?auto_2417884 ?auto_2417887 ) ) ( not ( = ?auto_2417884 ?auto_2417889 ) ) ( not ( = ?auto_2417886 ?auto_2417891 ) ) ( not ( = ?auto_2417887 ?auto_2417889 ) ) ( not ( = ?auto_2417888 ?auto_2417891 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2417881 ?auto_2417882 ?auto_2417885 ?auto_2417884 )
      ( GET-5IMAGE-VERIFY ?auto_2417881 ?auto_2417882 ?auto_2417883 ?auto_2417880 ?auto_2417885 ?auto_2417884 ?auto_2417886 ?auto_2417887 ?auto_2417888 ?auto_2417889 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2420078 - DIRECTION
      ?auto_2420079 - MODE
      ?auto_2420080 - DIRECTION
      ?auto_2420077 - MODE
      ?auto_2420082 - DIRECTION
      ?auto_2420081 - MODE
      ?auto_2420083 - DIRECTION
      ?auto_2420084 - MODE
      ?auto_2420085 - DIRECTION
      ?auto_2420086 - MODE
    )
    :vars
    (
      ?auto_2420089 - INSTRUMENT
      ?auto_2420087 - SATELLITE
      ?auto_2420088 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2420080 ?auto_2420078 ) ) ( not ( = ?auto_2420082 ?auto_2420078 ) ) ( not ( = ?auto_2420082 ?auto_2420080 ) ) ( not ( = ?auto_2420083 ?auto_2420078 ) ) ( not ( = ?auto_2420083 ?auto_2420080 ) ) ( not ( = ?auto_2420083 ?auto_2420082 ) ) ( not ( = ?auto_2420085 ?auto_2420078 ) ) ( not ( = ?auto_2420085 ?auto_2420080 ) ) ( not ( = ?auto_2420085 ?auto_2420082 ) ) ( not ( = ?auto_2420085 ?auto_2420083 ) ) ( ON_BOARD ?auto_2420089 ?auto_2420087 ) ( SUPPORTS ?auto_2420089 ?auto_2420077 ) ( POINTING ?auto_2420087 ?auto_2420088 ) ( not ( = ?auto_2420080 ?auto_2420088 ) ) ( HAVE_IMAGE ?auto_2420078 ?auto_2420079 ) ( not ( = ?auto_2420078 ?auto_2420088 ) ) ( not ( = ?auto_2420079 ?auto_2420077 ) ) ( CALIBRATION_TARGET ?auto_2420089 ?auto_2420088 ) ( POWER_AVAIL ?auto_2420087 ) ( HAVE_IMAGE ?auto_2420082 ?auto_2420081 ) ( HAVE_IMAGE ?auto_2420083 ?auto_2420084 ) ( HAVE_IMAGE ?auto_2420085 ?auto_2420086 ) ( not ( = ?auto_2420079 ?auto_2420081 ) ) ( not ( = ?auto_2420079 ?auto_2420084 ) ) ( not ( = ?auto_2420079 ?auto_2420086 ) ) ( not ( = ?auto_2420077 ?auto_2420081 ) ) ( not ( = ?auto_2420077 ?auto_2420084 ) ) ( not ( = ?auto_2420077 ?auto_2420086 ) ) ( not ( = ?auto_2420082 ?auto_2420088 ) ) ( not ( = ?auto_2420081 ?auto_2420084 ) ) ( not ( = ?auto_2420081 ?auto_2420086 ) ) ( not ( = ?auto_2420083 ?auto_2420088 ) ) ( not ( = ?auto_2420084 ?auto_2420086 ) ) ( not ( = ?auto_2420085 ?auto_2420088 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2420078 ?auto_2420079 ?auto_2420080 ?auto_2420077 )
      ( GET-5IMAGE-VERIFY ?auto_2420078 ?auto_2420079 ?auto_2420080 ?auto_2420077 ?auto_2420082 ?auto_2420081 ?auto_2420083 ?auto_2420084 ?auto_2420085 ?auto_2420086 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2436913 - DIRECTION
      ?auto_2436914 - MODE
      ?auto_2436915 - DIRECTION
      ?auto_2436912 - MODE
      ?auto_2436917 - DIRECTION
      ?auto_2436916 - MODE
      ?auto_2436918 - DIRECTION
      ?auto_2436919 - MODE
      ?auto_2436920 - DIRECTION
      ?auto_2436921 - MODE
    )
    :vars
    (
      ?auto_2436924 - INSTRUMENT
      ?auto_2436922 - SATELLITE
      ?auto_2436923 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2436915 ?auto_2436913 ) ) ( not ( = ?auto_2436917 ?auto_2436913 ) ) ( not ( = ?auto_2436917 ?auto_2436915 ) ) ( not ( = ?auto_2436918 ?auto_2436913 ) ) ( not ( = ?auto_2436918 ?auto_2436915 ) ) ( not ( = ?auto_2436918 ?auto_2436917 ) ) ( not ( = ?auto_2436920 ?auto_2436913 ) ) ( not ( = ?auto_2436920 ?auto_2436915 ) ) ( not ( = ?auto_2436920 ?auto_2436917 ) ) ( not ( = ?auto_2436920 ?auto_2436918 ) ) ( ON_BOARD ?auto_2436924 ?auto_2436922 ) ( SUPPORTS ?auto_2436924 ?auto_2436914 ) ( POINTING ?auto_2436922 ?auto_2436923 ) ( not ( = ?auto_2436913 ?auto_2436923 ) ) ( HAVE_IMAGE ?auto_2436915 ?auto_2436912 ) ( not ( = ?auto_2436915 ?auto_2436923 ) ) ( not ( = ?auto_2436912 ?auto_2436914 ) ) ( CALIBRATION_TARGET ?auto_2436924 ?auto_2436923 ) ( POWER_AVAIL ?auto_2436922 ) ( HAVE_IMAGE ?auto_2436917 ?auto_2436916 ) ( HAVE_IMAGE ?auto_2436918 ?auto_2436919 ) ( HAVE_IMAGE ?auto_2436920 ?auto_2436921 ) ( not ( = ?auto_2436914 ?auto_2436916 ) ) ( not ( = ?auto_2436914 ?auto_2436919 ) ) ( not ( = ?auto_2436914 ?auto_2436921 ) ) ( not ( = ?auto_2436912 ?auto_2436916 ) ) ( not ( = ?auto_2436912 ?auto_2436919 ) ) ( not ( = ?auto_2436912 ?auto_2436921 ) ) ( not ( = ?auto_2436917 ?auto_2436923 ) ) ( not ( = ?auto_2436916 ?auto_2436919 ) ) ( not ( = ?auto_2436916 ?auto_2436921 ) ) ( not ( = ?auto_2436918 ?auto_2436923 ) ) ( not ( = ?auto_2436919 ?auto_2436921 ) ) ( not ( = ?auto_2436920 ?auto_2436923 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2436915 ?auto_2436912 ?auto_2436913 ?auto_2436914 )
      ( GET-5IMAGE-VERIFY ?auto_2436913 ?auto_2436914 ?auto_2436915 ?auto_2436912 ?auto_2436917 ?auto_2436916 ?auto_2436918 ?auto_2436919 ?auto_2436920 ?auto_2436921 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2445713 - DIRECTION
      ?auto_2445714 - MODE
      ?auto_2445715 - DIRECTION
      ?auto_2445712 - MODE
      ?auto_2445717 - DIRECTION
      ?auto_2445716 - MODE
      ?auto_2445718 - DIRECTION
      ?auto_2445719 - MODE
    )
    :vars
    (
      ?auto_2445722 - INSTRUMENT
      ?auto_2445723 - SATELLITE
      ?auto_2445721 - DIRECTION
      ?auto_2445720 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2445715 ?auto_2445713 ) ) ( not ( = ?auto_2445717 ?auto_2445713 ) ) ( not ( = ?auto_2445717 ?auto_2445715 ) ) ( not ( = ?auto_2445718 ?auto_2445713 ) ) ( not ( = ?auto_2445718 ?auto_2445715 ) ) ( not ( = ?auto_2445718 ?auto_2445717 ) ) ( ON_BOARD ?auto_2445722 ?auto_2445723 ) ( SUPPORTS ?auto_2445722 ?auto_2445719 ) ( not ( = ?auto_2445718 ?auto_2445721 ) ) ( HAVE_IMAGE ?auto_2445713 ?auto_2445714 ) ( not ( = ?auto_2445713 ?auto_2445721 ) ) ( not ( = ?auto_2445714 ?auto_2445719 ) ) ( CALIBRATION_TARGET ?auto_2445722 ?auto_2445721 ) ( POWER_AVAIL ?auto_2445723 ) ( POINTING ?auto_2445723 ?auto_2445720 ) ( not ( = ?auto_2445721 ?auto_2445720 ) ) ( not ( = ?auto_2445718 ?auto_2445720 ) ) ( not ( = ?auto_2445713 ?auto_2445720 ) ) ( HAVE_IMAGE ?auto_2445715 ?auto_2445712 ) ( HAVE_IMAGE ?auto_2445717 ?auto_2445716 ) ( not ( = ?auto_2445714 ?auto_2445712 ) ) ( not ( = ?auto_2445714 ?auto_2445716 ) ) ( not ( = ?auto_2445715 ?auto_2445721 ) ) ( not ( = ?auto_2445715 ?auto_2445720 ) ) ( not ( = ?auto_2445712 ?auto_2445716 ) ) ( not ( = ?auto_2445712 ?auto_2445719 ) ) ( not ( = ?auto_2445717 ?auto_2445721 ) ) ( not ( = ?auto_2445717 ?auto_2445720 ) ) ( not ( = ?auto_2445716 ?auto_2445719 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2445713 ?auto_2445714 ?auto_2445718 ?auto_2445719 )
      ( GET-4IMAGE-VERIFY ?auto_2445713 ?auto_2445714 ?auto_2445715 ?auto_2445712 ?auto_2445717 ?auto_2445716 ?auto_2445718 ?auto_2445719 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2445760 - DIRECTION
      ?auto_2445761 - MODE
      ?auto_2445762 - DIRECTION
      ?auto_2445759 - MODE
      ?auto_2445764 - DIRECTION
      ?auto_2445763 - MODE
      ?auto_2445765 - DIRECTION
      ?auto_2445766 - MODE
    )
    :vars
    (
      ?auto_2445769 - INSTRUMENT
      ?auto_2445770 - SATELLITE
      ?auto_2445768 - DIRECTION
      ?auto_2445767 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2445762 ?auto_2445760 ) ) ( not ( = ?auto_2445764 ?auto_2445760 ) ) ( not ( = ?auto_2445764 ?auto_2445762 ) ) ( not ( = ?auto_2445765 ?auto_2445760 ) ) ( not ( = ?auto_2445765 ?auto_2445762 ) ) ( not ( = ?auto_2445765 ?auto_2445764 ) ) ( ON_BOARD ?auto_2445769 ?auto_2445770 ) ( SUPPORTS ?auto_2445769 ?auto_2445763 ) ( not ( = ?auto_2445764 ?auto_2445768 ) ) ( HAVE_IMAGE ?auto_2445760 ?auto_2445761 ) ( not ( = ?auto_2445760 ?auto_2445768 ) ) ( not ( = ?auto_2445761 ?auto_2445763 ) ) ( CALIBRATION_TARGET ?auto_2445769 ?auto_2445768 ) ( POWER_AVAIL ?auto_2445770 ) ( POINTING ?auto_2445770 ?auto_2445767 ) ( not ( = ?auto_2445768 ?auto_2445767 ) ) ( not ( = ?auto_2445764 ?auto_2445767 ) ) ( not ( = ?auto_2445760 ?auto_2445767 ) ) ( HAVE_IMAGE ?auto_2445762 ?auto_2445759 ) ( HAVE_IMAGE ?auto_2445765 ?auto_2445766 ) ( not ( = ?auto_2445761 ?auto_2445759 ) ) ( not ( = ?auto_2445761 ?auto_2445766 ) ) ( not ( = ?auto_2445762 ?auto_2445768 ) ) ( not ( = ?auto_2445762 ?auto_2445767 ) ) ( not ( = ?auto_2445759 ?auto_2445763 ) ) ( not ( = ?auto_2445759 ?auto_2445766 ) ) ( not ( = ?auto_2445763 ?auto_2445766 ) ) ( not ( = ?auto_2445765 ?auto_2445768 ) ) ( not ( = ?auto_2445765 ?auto_2445767 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2445760 ?auto_2445761 ?auto_2445764 ?auto_2445763 )
      ( GET-4IMAGE-VERIFY ?auto_2445760 ?auto_2445761 ?auto_2445762 ?auto_2445759 ?auto_2445764 ?auto_2445763 ?auto_2445765 ?auto_2445766 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2446063 - DIRECTION
      ?auto_2446064 - MODE
      ?auto_2446065 - DIRECTION
      ?auto_2446062 - MODE
      ?auto_2446067 - DIRECTION
      ?auto_2446066 - MODE
      ?auto_2446068 - DIRECTION
      ?auto_2446069 - MODE
    )
    :vars
    (
      ?auto_2446072 - INSTRUMENT
      ?auto_2446073 - SATELLITE
      ?auto_2446071 - DIRECTION
      ?auto_2446070 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2446065 ?auto_2446063 ) ) ( not ( = ?auto_2446067 ?auto_2446063 ) ) ( not ( = ?auto_2446067 ?auto_2446065 ) ) ( not ( = ?auto_2446068 ?auto_2446063 ) ) ( not ( = ?auto_2446068 ?auto_2446065 ) ) ( not ( = ?auto_2446068 ?auto_2446067 ) ) ( ON_BOARD ?auto_2446072 ?auto_2446073 ) ( SUPPORTS ?auto_2446072 ?auto_2446062 ) ( not ( = ?auto_2446065 ?auto_2446071 ) ) ( HAVE_IMAGE ?auto_2446063 ?auto_2446064 ) ( not ( = ?auto_2446063 ?auto_2446071 ) ) ( not ( = ?auto_2446064 ?auto_2446062 ) ) ( CALIBRATION_TARGET ?auto_2446072 ?auto_2446071 ) ( POWER_AVAIL ?auto_2446073 ) ( POINTING ?auto_2446073 ?auto_2446070 ) ( not ( = ?auto_2446071 ?auto_2446070 ) ) ( not ( = ?auto_2446065 ?auto_2446070 ) ) ( not ( = ?auto_2446063 ?auto_2446070 ) ) ( HAVE_IMAGE ?auto_2446067 ?auto_2446066 ) ( HAVE_IMAGE ?auto_2446068 ?auto_2446069 ) ( not ( = ?auto_2446064 ?auto_2446066 ) ) ( not ( = ?auto_2446064 ?auto_2446069 ) ) ( not ( = ?auto_2446062 ?auto_2446066 ) ) ( not ( = ?auto_2446062 ?auto_2446069 ) ) ( not ( = ?auto_2446067 ?auto_2446071 ) ) ( not ( = ?auto_2446067 ?auto_2446070 ) ) ( not ( = ?auto_2446066 ?auto_2446069 ) ) ( not ( = ?auto_2446068 ?auto_2446071 ) ) ( not ( = ?auto_2446068 ?auto_2446070 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2446063 ?auto_2446064 ?auto_2446065 ?auto_2446062 )
      ( GET-4IMAGE-VERIFY ?auto_2446063 ?auto_2446064 ?auto_2446065 ?auto_2446062 ?auto_2446067 ?auto_2446066 ?auto_2446068 ?auto_2446069 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2448452 - DIRECTION
      ?auto_2448453 - MODE
      ?auto_2448454 - DIRECTION
      ?auto_2448451 - MODE
      ?auto_2448456 - DIRECTION
      ?auto_2448455 - MODE
      ?auto_2448457 - DIRECTION
      ?auto_2448458 - MODE
    )
    :vars
    (
      ?auto_2448461 - INSTRUMENT
      ?auto_2448462 - SATELLITE
      ?auto_2448460 - DIRECTION
      ?auto_2448459 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2448454 ?auto_2448452 ) ) ( not ( = ?auto_2448456 ?auto_2448452 ) ) ( not ( = ?auto_2448456 ?auto_2448454 ) ) ( not ( = ?auto_2448457 ?auto_2448452 ) ) ( not ( = ?auto_2448457 ?auto_2448454 ) ) ( not ( = ?auto_2448457 ?auto_2448456 ) ) ( ON_BOARD ?auto_2448461 ?auto_2448462 ) ( SUPPORTS ?auto_2448461 ?auto_2448453 ) ( not ( = ?auto_2448452 ?auto_2448460 ) ) ( HAVE_IMAGE ?auto_2448454 ?auto_2448451 ) ( not ( = ?auto_2448454 ?auto_2448460 ) ) ( not ( = ?auto_2448451 ?auto_2448453 ) ) ( CALIBRATION_TARGET ?auto_2448461 ?auto_2448460 ) ( POWER_AVAIL ?auto_2448462 ) ( POINTING ?auto_2448462 ?auto_2448459 ) ( not ( = ?auto_2448460 ?auto_2448459 ) ) ( not ( = ?auto_2448452 ?auto_2448459 ) ) ( not ( = ?auto_2448454 ?auto_2448459 ) ) ( HAVE_IMAGE ?auto_2448456 ?auto_2448455 ) ( HAVE_IMAGE ?auto_2448457 ?auto_2448458 ) ( not ( = ?auto_2448453 ?auto_2448455 ) ) ( not ( = ?auto_2448453 ?auto_2448458 ) ) ( not ( = ?auto_2448451 ?auto_2448455 ) ) ( not ( = ?auto_2448451 ?auto_2448458 ) ) ( not ( = ?auto_2448456 ?auto_2448460 ) ) ( not ( = ?auto_2448456 ?auto_2448459 ) ) ( not ( = ?auto_2448455 ?auto_2448458 ) ) ( not ( = ?auto_2448457 ?auto_2448460 ) ) ( not ( = ?auto_2448457 ?auto_2448459 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2448454 ?auto_2448451 ?auto_2448452 ?auto_2448453 )
      ( GET-4IMAGE-VERIFY ?auto_2448452 ?auto_2448453 ?auto_2448454 ?auto_2448451 ?auto_2448456 ?auto_2448455 ?auto_2448457 ?auto_2448458 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2450979 - DIRECTION
      ?auto_2450980 - MODE
      ?auto_2450981 - DIRECTION
      ?auto_2450978 - MODE
      ?auto_2450983 - DIRECTION
      ?auto_2450982 - MODE
      ?auto_2450984 - DIRECTION
      ?auto_2450985 - MODE
      ?auto_2450986 - DIRECTION
      ?auto_2450987 - MODE
    )
    :vars
    (
      ?auto_2450989 - INSTRUMENT
      ?auto_2450990 - SATELLITE
      ?auto_2450988 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2450981 ?auto_2450979 ) ) ( not ( = ?auto_2450983 ?auto_2450979 ) ) ( not ( = ?auto_2450983 ?auto_2450981 ) ) ( not ( = ?auto_2450984 ?auto_2450979 ) ) ( not ( = ?auto_2450984 ?auto_2450981 ) ) ( not ( = ?auto_2450984 ?auto_2450983 ) ) ( not ( = ?auto_2450986 ?auto_2450979 ) ) ( not ( = ?auto_2450986 ?auto_2450981 ) ) ( not ( = ?auto_2450986 ?auto_2450983 ) ) ( not ( = ?auto_2450986 ?auto_2450984 ) ) ( ON_BOARD ?auto_2450989 ?auto_2450990 ) ( SUPPORTS ?auto_2450989 ?auto_2450987 ) ( not ( = ?auto_2450986 ?auto_2450988 ) ) ( HAVE_IMAGE ?auto_2450979 ?auto_2450980 ) ( not ( = ?auto_2450979 ?auto_2450988 ) ) ( not ( = ?auto_2450980 ?auto_2450987 ) ) ( CALIBRATION_TARGET ?auto_2450989 ?auto_2450988 ) ( POWER_AVAIL ?auto_2450990 ) ( POINTING ?auto_2450990 ?auto_2450984 ) ( not ( = ?auto_2450988 ?auto_2450984 ) ) ( HAVE_IMAGE ?auto_2450981 ?auto_2450978 ) ( HAVE_IMAGE ?auto_2450983 ?auto_2450982 ) ( HAVE_IMAGE ?auto_2450984 ?auto_2450985 ) ( not ( = ?auto_2450980 ?auto_2450978 ) ) ( not ( = ?auto_2450980 ?auto_2450982 ) ) ( not ( = ?auto_2450980 ?auto_2450985 ) ) ( not ( = ?auto_2450981 ?auto_2450988 ) ) ( not ( = ?auto_2450978 ?auto_2450982 ) ) ( not ( = ?auto_2450978 ?auto_2450985 ) ) ( not ( = ?auto_2450978 ?auto_2450987 ) ) ( not ( = ?auto_2450983 ?auto_2450988 ) ) ( not ( = ?auto_2450982 ?auto_2450985 ) ) ( not ( = ?auto_2450982 ?auto_2450987 ) ) ( not ( = ?auto_2450985 ?auto_2450987 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2450979 ?auto_2450980 ?auto_2450986 ?auto_2450987 )
      ( GET-5IMAGE-VERIFY ?auto_2450979 ?auto_2450980 ?auto_2450981 ?auto_2450978 ?auto_2450983 ?auto_2450982 ?auto_2450984 ?auto_2450985 ?auto_2450986 ?auto_2450987 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2451034 - DIRECTION
      ?auto_2451035 - MODE
      ?auto_2451036 - DIRECTION
      ?auto_2451033 - MODE
      ?auto_2451038 - DIRECTION
      ?auto_2451037 - MODE
      ?auto_2451039 - DIRECTION
      ?auto_2451040 - MODE
      ?auto_2451041 - DIRECTION
      ?auto_2451042 - MODE
    )
    :vars
    (
      ?auto_2451044 - INSTRUMENT
      ?auto_2451045 - SATELLITE
      ?auto_2451043 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2451036 ?auto_2451034 ) ) ( not ( = ?auto_2451038 ?auto_2451034 ) ) ( not ( = ?auto_2451038 ?auto_2451036 ) ) ( not ( = ?auto_2451039 ?auto_2451034 ) ) ( not ( = ?auto_2451039 ?auto_2451036 ) ) ( not ( = ?auto_2451039 ?auto_2451038 ) ) ( not ( = ?auto_2451041 ?auto_2451034 ) ) ( not ( = ?auto_2451041 ?auto_2451036 ) ) ( not ( = ?auto_2451041 ?auto_2451038 ) ) ( not ( = ?auto_2451041 ?auto_2451039 ) ) ( ON_BOARD ?auto_2451044 ?auto_2451045 ) ( SUPPORTS ?auto_2451044 ?auto_2451040 ) ( not ( = ?auto_2451039 ?auto_2451043 ) ) ( HAVE_IMAGE ?auto_2451034 ?auto_2451035 ) ( not ( = ?auto_2451034 ?auto_2451043 ) ) ( not ( = ?auto_2451035 ?auto_2451040 ) ) ( CALIBRATION_TARGET ?auto_2451044 ?auto_2451043 ) ( POWER_AVAIL ?auto_2451045 ) ( POINTING ?auto_2451045 ?auto_2451041 ) ( not ( = ?auto_2451043 ?auto_2451041 ) ) ( HAVE_IMAGE ?auto_2451036 ?auto_2451033 ) ( HAVE_IMAGE ?auto_2451038 ?auto_2451037 ) ( HAVE_IMAGE ?auto_2451041 ?auto_2451042 ) ( not ( = ?auto_2451035 ?auto_2451033 ) ) ( not ( = ?auto_2451035 ?auto_2451037 ) ) ( not ( = ?auto_2451035 ?auto_2451042 ) ) ( not ( = ?auto_2451036 ?auto_2451043 ) ) ( not ( = ?auto_2451033 ?auto_2451037 ) ) ( not ( = ?auto_2451033 ?auto_2451040 ) ) ( not ( = ?auto_2451033 ?auto_2451042 ) ) ( not ( = ?auto_2451038 ?auto_2451043 ) ) ( not ( = ?auto_2451037 ?auto_2451040 ) ) ( not ( = ?auto_2451037 ?auto_2451042 ) ) ( not ( = ?auto_2451040 ?auto_2451042 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2451034 ?auto_2451035 ?auto_2451039 ?auto_2451040 )
      ( GET-5IMAGE-VERIFY ?auto_2451034 ?auto_2451035 ?auto_2451036 ?auto_2451033 ?auto_2451038 ?auto_2451037 ?auto_2451039 ?auto_2451040 ?auto_2451041 ?auto_2451042 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2451087 - DIRECTION
      ?auto_2451088 - MODE
      ?auto_2451089 - DIRECTION
      ?auto_2451086 - MODE
      ?auto_2451091 - DIRECTION
      ?auto_2451090 - MODE
      ?auto_2451092 - DIRECTION
      ?auto_2451093 - MODE
      ?auto_2451094 - DIRECTION
      ?auto_2451095 - MODE
    )
    :vars
    (
      ?auto_2451097 - INSTRUMENT
      ?auto_2451098 - SATELLITE
      ?auto_2451096 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2451089 ?auto_2451087 ) ) ( not ( = ?auto_2451091 ?auto_2451087 ) ) ( not ( = ?auto_2451091 ?auto_2451089 ) ) ( not ( = ?auto_2451092 ?auto_2451087 ) ) ( not ( = ?auto_2451092 ?auto_2451089 ) ) ( not ( = ?auto_2451092 ?auto_2451091 ) ) ( not ( = ?auto_2451094 ?auto_2451087 ) ) ( not ( = ?auto_2451094 ?auto_2451089 ) ) ( not ( = ?auto_2451094 ?auto_2451091 ) ) ( not ( = ?auto_2451094 ?auto_2451092 ) ) ( ON_BOARD ?auto_2451097 ?auto_2451098 ) ( SUPPORTS ?auto_2451097 ?auto_2451095 ) ( not ( = ?auto_2451094 ?auto_2451096 ) ) ( HAVE_IMAGE ?auto_2451087 ?auto_2451088 ) ( not ( = ?auto_2451087 ?auto_2451096 ) ) ( not ( = ?auto_2451088 ?auto_2451095 ) ) ( CALIBRATION_TARGET ?auto_2451097 ?auto_2451096 ) ( POWER_AVAIL ?auto_2451098 ) ( POINTING ?auto_2451098 ?auto_2451091 ) ( not ( = ?auto_2451096 ?auto_2451091 ) ) ( HAVE_IMAGE ?auto_2451089 ?auto_2451086 ) ( HAVE_IMAGE ?auto_2451091 ?auto_2451090 ) ( HAVE_IMAGE ?auto_2451092 ?auto_2451093 ) ( not ( = ?auto_2451088 ?auto_2451086 ) ) ( not ( = ?auto_2451088 ?auto_2451090 ) ) ( not ( = ?auto_2451088 ?auto_2451093 ) ) ( not ( = ?auto_2451089 ?auto_2451096 ) ) ( not ( = ?auto_2451086 ?auto_2451090 ) ) ( not ( = ?auto_2451086 ?auto_2451093 ) ) ( not ( = ?auto_2451086 ?auto_2451095 ) ) ( not ( = ?auto_2451090 ?auto_2451093 ) ) ( not ( = ?auto_2451090 ?auto_2451095 ) ) ( not ( = ?auto_2451092 ?auto_2451096 ) ) ( not ( = ?auto_2451093 ?auto_2451095 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2451087 ?auto_2451088 ?auto_2451094 ?auto_2451095 )
      ( GET-5IMAGE-VERIFY ?auto_2451087 ?auto_2451088 ?auto_2451089 ?auto_2451086 ?auto_2451091 ?auto_2451090 ?auto_2451092 ?auto_2451093 ?auto_2451094 ?auto_2451095 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2451139 - DIRECTION
      ?auto_2451140 - MODE
      ?auto_2451141 - DIRECTION
      ?auto_2451138 - MODE
      ?auto_2451143 - DIRECTION
      ?auto_2451142 - MODE
      ?auto_2451144 - DIRECTION
      ?auto_2451145 - MODE
      ?auto_2451146 - DIRECTION
      ?auto_2451147 - MODE
    )
    :vars
    (
      ?auto_2451149 - INSTRUMENT
      ?auto_2451150 - SATELLITE
      ?auto_2451148 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2451141 ?auto_2451139 ) ) ( not ( = ?auto_2451143 ?auto_2451139 ) ) ( not ( = ?auto_2451143 ?auto_2451141 ) ) ( not ( = ?auto_2451144 ?auto_2451139 ) ) ( not ( = ?auto_2451144 ?auto_2451141 ) ) ( not ( = ?auto_2451144 ?auto_2451143 ) ) ( not ( = ?auto_2451146 ?auto_2451139 ) ) ( not ( = ?auto_2451146 ?auto_2451141 ) ) ( not ( = ?auto_2451146 ?auto_2451143 ) ) ( not ( = ?auto_2451146 ?auto_2451144 ) ) ( ON_BOARD ?auto_2451149 ?auto_2451150 ) ( SUPPORTS ?auto_2451149 ?auto_2451145 ) ( not ( = ?auto_2451144 ?auto_2451148 ) ) ( HAVE_IMAGE ?auto_2451139 ?auto_2451140 ) ( not ( = ?auto_2451139 ?auto_2451148 ) ) ( not ( = ?auto_2451140 ?auto_2451145 ) ) ( CALIBRATION_TARGET ?auto_2451149 ?auto_2451148 ) ( POWER_AVAIL ?auto_2451150 ) ( POINTING ?auto_2451150 ?auto_2451143 ) ( not ( = ?auto_2451148 ?auto_2451143 ) ) ( HAVE_IMAGE ?auto_2451141 ?auto_2451138 ) ( HAVE_IMAGE ?auto_2451143 ?auto_2451142 ) ( HAVE_IMAGE ?auto_2451146 ?auto_2451147 ) ( not ( = ?auto_2451140 ?auto_2451138 ) ) ( not ( = ?auto_2451140 ?auto_2451142 ) ) ( not ( = ?auto_2451140 ?auto_2451147 ) ) ( not ( = ?auto_2451141 ?auto_2451148 ) ) ( not ( = ?auto_2451138 ?auto_2451142 ) ) ( not ( = ?auto_2451138 ?auto_2451145 ) ) ( not ( = ?auto_2451138 ?auto_2451147 ) ) ( not ( = ?auto_2451142 ?auto_2451145 ) ) ( not ( = ?auto_2451142 ?auto_2451147 ) ) ( not ( = ?auto_2451145 ?auto_2451147 ) ) ( not ( = ?auto_2451146 ?auto_2451148 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2451139 ?auto_2451140 ?auto_2451144 ?auto_2451145 )
      ( GET-5IMAGE-VERIFY ?auto_2451139 ?auto_2451140 ?auto_2451141 ?auto_2451138 ?auto_2451143 ?auto_2451142 ?auto_2451144 ?auto_2451145 ?auto_2451146 ?auto_2451147 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2451358 - DIRECTION
      ?auto_2451359 - MODE
      ?auto_2451360 - DIRECTION
      ?auto_2451357 - MODE
      ?auto_2451362 - DIRECTION
      ?auto_2451361 - MODE
      ?auto_2451363 - DIRECTION
      ?auto_2451364 - MODE
      ?auto_2451365 - DIRECTION
      ?auto_2451366 - MODE
    )
    :vars
    (
      ?auto_2451368 - INSTRUMENT
      ?auto_2451369 - SATELLITE
      ?auto_2451367 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2451360 ?auto_2451358 ) ) ( not ( = ?auto_2451362 ?auto_2451358 ) ) ( not ( = ?auto_2451362 ?auto_2451360 ) ) ( not ( = ?auto_2451363 ?auto_2451358 ) ) ( not ( = ?auto_2451363 ?auto_2451360 ) ) ( not ( = ?auto_2451363 ?auto_2451362 ) ) ( not ( = ?auto_2451365 ?auto_2451358 ) ) ( not ( = ?auto_2451365 ?auto_2451360 ) ) ( not ( = ?auto_2451365 ?auto_2451362 ) ) ( not ( = ?auto_2451365 ?auto_2451363 ) ) ( ON_BOARD ?auto_2451368 ?auto_2451369 ) ( SUPPORTS ?auto_2451368 ?auto_2451361 ) ( not ( = ?auto_2451362 ?auto_2451367 ) ) ( HAVE_IMAGE ?auto_2451358 ?auto_2451359 ) ( not ( = ?auto_2451358 ?auto_2451367 ) ) ( not ( = ?auto_2451359 ?auto_2451361 ) ) ( CALIBRATION_TARGET ?auto_2451368 ?auto_2451367 ) ( POWER_AVAIL ?auto_2451369 ) ( POINTING ?auto_2451369 ?auto_2451365 ) ( not ( = ?auto_2451367 ?auto_2451365 ) ) ( HAVE_IMAGE ?auto_2451360 ?auto_2451357 ) ( HAVE_IMAGE ?auto_2451363 ?auto_2451364 ) ( HAVE_IMAGE ?auto_2451365 ?auto_2451366 ) ( not ( = ?auto_2451359 ?auto_2451357 ) ) ( not ( = ?auto_2451359 ?auto_2451364 ) ) ( not ( = ?auto_2451359 ?auto_2451366 ) ) ( not ( = ?auto_2451360 ?auto_2451367 ) ) ( not ( = ?auto_2451357 ?auto_2451361 ) ) ( not ( = ?auto_2451357 ?auto_2451364 ) ) ( not ( = ?auto_2451357 ?auto_2451366 ) ) ( not ( = ?auto_2451361 ?auto_2451364 ) ) ( not ( = ?auto_2451361 ?auto_2451366 ) ) ( not ( = ?auto_2451363 ?auto_2451367 ) ) ( not ( = ?auto_2451364 ?auto_2451366 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2451358 ?auto_2451359 ?auto_2451362 ?auto_2451361 )
      ( GET-5IMAGE-VERIFY ?auto_2451358 ?auto_2451359 ?auto_2451360 ?auto_2451357 ?auto_2451362 ?auto_2451361 ?auto_2451363 ?auto_2451364 ?auto_2451365 ?auto_2451366 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2451411 - DIRECTION
      ?auto_2451412 - MODE
      ?auto_2451413 - DIRECTION
      ?auto_2451410 - MODE
      ?auto_2451415 - DIRECTION
      ?auto_2451414 - MODE
      ?auto_2451416 - DIRECTION
      ?auto_2451417 - MODE
      ?auto_2451418 - DIRECTION
      ?auto_2451419 - MODE
    )
    :vars
    (
      ?auto_2451421 - INSTRUMENT
      ?auto_2451422 - SATELLITE
      ?auto_2451420 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2451413 ?auto_2451411 ) ) ( not ( = ?auto_2451415 ?auto_2451411 ) ) ( not ( = ?auto_2451415 ?auto_2451413 ) ) ( not ( = ?auto_2451416 ?auto_2451411 ) ) ( not ( = ?auto_2451416 ?auto_2451413 ) ) ( not ( = ?auto_2451416 ?auto_2451415 ) ) ( not ( = ?auto_2451418 ?auto_2451411 ) ) ( not ( = ?auto_2451418 ?auto_2451413 ) ) ( not ( = ?auto_2451418 ?auto_2451415 ) ) ( not ( = ?auto_2451418 ?auto_2451416 ) ) ( ON_BOARD ?auto_2451421 ?auto_2451422 ) ( SUPPORTS ?auto_2451421 ?auto_2451414 ) ( not ( = ?auto_2451415 ?auto_2451420 ) ) ( HAVE_IMAGE ?auto_2451411 ?auto_2451412 ) ( not ( = ?auto_2451411 ?auto_2451420 ) ) ( not ( = ?auto_2451412 ?auto_2451414 ) ) ( CALIBRATION_TARGET ?auto_2451421 ?auto_2451420 ) ( POWER_AVAIL ?auto_2451422 ) ( POINTING ?auto_2451422 ?auto_2451416 ) ( not ( = ?auto_2451420 ?auto_2451416 ) ) ( HAVE_IMAGE ?auto_2451413 ?auto_2451410 ) ( HAVE_IMAGE ?auto_2451416 ?auto_2451417 ) ( HAVE_IMAGE ?auto_2451418 ?auto_2451419 ) ( not ( = ?auto_2451412 ?auto_2451410 ) ) ( not ( = ?auto_2451412 ?auto_2451417 ) ) ( not ( = ?auto_2451412 ?auto_2451419 ) ) ( not ( = ?auto_2451413 ?auto_2451420 ) ) ( not ( = ?auto_2451410 ?auto_2451414 ) ) ( not ( = ?auto_2451410 ?auto_2451417 ) ) ( not ( = ?auto_2451410 ?auto_2451419 ) ) ( not ( = ?auto_2451414 ?auto_2451417 ) ) ( not ( = ?auto_2451414 ?auto_2451419 ) ) ( not ( = ?auto_2451417 ?auto_2451419 ) ) ( not ( = ?auto_2451418 ?auto_2451420 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2451411 ?auto_2451412 ?auto_2451415 ?auto_2451414 )
      ( GET-5IMAGE-VERIFY ?auto_2451411 ?auto_2451412 ?auto_2451413 ?auto_2451410 ?auto_2451415 ?auto_2451414 ?auto_2451416 ?auto_2451417 ?auto_2451418 ?auto_2451419 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2452474 - DIRECTION
      ?auto_2452475 - MODE
      ?auto_2452476 - DIRECTION
      ?auto_2452473 - MODE
      ?auto_2452478 - DIRECTION
      ?auto_2452477 - MODE
      ?auto_2452479 - DIRECTION
      ?auto_2452480 - MODE
      ?auto_2452481 - DIRECTION
      ?auto_2452482 - MODE
    )
    :vars
    (
      ?auto_2452484 - INSTRUMENT
      ?auto_2452485 - SATELLITE
      ?auto_2452483 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2452476 ?auto_2452474 ) ) ( not ( = ?auto_2452478 ?auto_2452474 ) ) ( not ( = ?auto_2452478 ?auto_2452476 ) ) ( not ( = ?auto_2452479 ?auto_2452474 ) ) ( not ( = ?auto_2452479 ?auto_2452476 ) ) ( not ( = ?auto_2452479 ?auto_2452478 ) ) ( not ( = ?auto_2452481 ?auto_2452474 ) ) ( not ( = ?auto_2452481 ?auto_2452476 ) ) ( not ( = ?auto_2452481 ?auto_2452478 ) ) ( not ( = ?auto_2452481 ?auto_2452479 ) ) ( ON_BOARD ?auto_2452484 ?auto_2452485 ) ( SUPPORTS ?auto_2452484 ?auto_2452482 ) ( not ( = ?auto_2452481 ?auto_2452483 ) ) ( HAVE_IMAGE ?auto_2452474 ?auto_2452475 ) ( not ( = ?auto_2452474 ?auto_2452483 ) ) ( not ( = ?auto_2452475 ?auto_2452482 ) ) ( CALIBRATION_TARGET ?auto_2452484 ?auto_2452483 ) ( POWER_AVAIL ?auto_2452485 ) ( POINTING ?auto_2452485 ?auto_2452476 ) ( not ( = ?auto_2452483 ?auto_2452476 ) ) ( HAVE_IMAGE ?auto_2452476 ?auto_2452473 ) ( HAVE_IMAGE ?auto_2452478 ?auto_2452477 ) ( HAVE_IMAGE ?auto_2452479 ?auto_2452480 ) ( not ( = ?auto_2452475 ?auto_2452473 ) ) ( not ( = ?auto_2452475 ?auto_2452477 ) ) ( not ( = ?auto_2452475 ?auto_2452480 ) ) ( not ( = ?auto_2452473 ?auto_2452477 ) ) ( not ( = ?auto_2452473 ?auto_2452480 ) ) ( not ( = ?auto_2452473 ?auto_2452482 ) ) ( not ( = ?auto_2452478 ?auto_2452483 ) ) ( not ( = ?auto_2452477 ?auto_2452480 ) ) ( not ( = ?auto_2452477 ?auto_2452482 ) ) ( not ( = ?auto_2452479 ?auto_2452483 ) ) ( not ( = ?auto_2452480 ?auto_2452482 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2452474 ?auto_2452475 ?auto_2452481 ?auto_2452482 )
      ( GET-5IMAGE-VERIFY ?auto_2452474 ?auto_2452475 ?auto_2452476 ?auto_2452473 ?auto_2452478 ?auto_2452477 ?auto_2452479 ?auto_2452480 ?auto_2452481 ?auto_2452482 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2452526 - DIRECTION
      ?auto_2452527 - MODE
      ?auto_2452528 - DIRECTION
      ?auto_2452525 - MODE
      ?auto_2452530 - DIRECTION
      ?auto_2452529 - MODE
      ?auto_2452531 - DIRECTION
      ?auto_2452532 - MODE
      ?auto_2452533 - DIRECTION
      ?auto_2452534 - MODE
    )
    :vars
    (
      ?auto_2452536 - INSTRUMENT
      ?auto_2452537 - SATELLITE
      ?auto_2452535 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2452528 ?auto_2452526 ) ) ( not ( = ?auto_2452530 ?auto_2452526 ) ) ( not ( = ?auto_2452530 ?auto_2452528 ) ) ( not ( = ?auto_2452531 ?auto_2452526 ) ) ( not ( = ?auto_2452531 ?auto_2452528 ) ) ( not ( = ?auto_2452531 ?auto_2452530 ) ) ( not ( = ?auto_2452533 ?auto_2452526 ) ) ( not ( = ?auto_2452533 ?auto_2452528 ) ) ( not ( = ?auto_2452533 ?auto_2452530 ) ) ( not ( = ?auto_2452533 ?auto_2452531 ) ) ( ON_BOARD ?auto_2452536 ?auto_2452537 ) ( SUPPORTS ?auto_2452536 ?auto_2452532 ) ( not ( = ?auto_2452531 ?auto_2452535 ) ) ( HAVE_IMAGE ?auto_2452526 ?auto_2452527 ) ( not ( = ?auto_2452526 ?auto_2452535 ) ) ( not ( = ?auto_2452527 ?auto_2452532 ) ) ( CALIBRATION_TARGET ?auto_2452536 ?auto_2452535 ) ( POWER_AVAIL ?auto_2452537 ) ( POINTING ?auto_2452537 ?auto_2452528 ) ( not ( = ?auto_2452535 ?auto_2452528 ) ) ( HAVE_IMAGE ?auto_2452528 ?auto_2452525 ) ( HAVE_IMAGE ?auto_2452530 ?auto_2452529 ) ( HAVE_IMAGE ?auto_2452533 ?auto_2452534 ) ( not ( = ?auto_2452527 ?auto_2452525 ) ) ( not ( = ?auto_2452527 ?auto_2452529 ) ) ( not ( = ?auto_2452527 ?auto_2452534 ) ) ( not ( = ?auto_2452525 ?auto_2452529 ) ) ( not ( = ?auto_2452525 ?auto_2452532 ) ) ( not ( = ?auto_2452525 ?auto_2452534 ) ) ( not ( = ?auto_2452530 ?auto_2452535 ) ) ( not ( = ?auto_2452529 ?auto_2452532 ) ) ( not ( = ?auto_2452529 ?auto_2452534 ) ) ( not ( = ?auto_2452532 ?auto_2452534 ) ) ( not ( = ?auto_2452533 ?auto_2452535 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2452526 ?auto_2452527 ?auto_2452531 ?auto_2452532 )
      ( GET-5IMAGE-VERIFY ?auto_2452526 ?auto_2452527 ?auto_2452528 ?auto_2452525 ?auto_2452530 ?auto_2452529 ?auto_2452531 ?auto_2452532 ?auto_2452533 ?auto_2452534 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2452884 - DIRECTION
      ?auto_2452885 - MODE
      ?auto_2452886 - DIRECTION
      ?auto_2452883 - MODE
      ?auto_2452888 - DIRECTION
      ?auto_2452887 - MODE
      ?auto_2452889 - DIRECTION
      ?auto_2452890 - MODE
      ?auto_2452891 - DIRECTION
      ?auto_2452892 - MODE
    )
    :vars
    (
      ?auto_2452894 - INSTRUMENT
      ?auto_2452895 - SATELLITE
      ?auto_2452893 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2452886 ?auto_2452884 ) ) ( not ( = ?auto_2452888 ?auto_2452884 ) ) ( not ( = ?auto_2452888 ?auto_2452886 ) ) ( not ( = ?auto_2452889 ?auto_2452884 ) ) ( not ( = ?auto_2452889 ?auto_2452886 ) ) ( not ( = ?auto_2452889 ?auto_2452888 ) ) ( not ( = ?auto_2452891 ?auto_2452884 ) ) ( not ( = ?auto_2452891 ?auto_2452886 ) ) ( not ( = ?auto_2452891 ?auto_2452888 ) ) ( not ( = ?auto_2452891 ?auto_2452889 ) ) ( ON_BOARD ?auto_2452894 ?auto_2452895 ) ( SUPPORTS ?auto_2452894 ?auto_2452887 ) ( not ( = ?auto_2452888 ?auto_2452893 ) ) ( HAVE_IMAGE ?auto_2452884 ?auto_2452885 ) ( not ( = ?auto_2452884 ?auto_2452893 ) ) ( not ( = ?auto_2452885 ?auto_2452887 ) ) ( CALIBRATION_TARGET ?auto_2452894 ?auto_2452893 ) ( POWER_AVAIL ?auto_2452895 ) ( POINTING ?auto_2452895 ?auto_2452886 ) ( not ( = ?auto_2452893 ?auto_2452886 ) ) ( HAVE_IMAGE ?auto_2452886 ?auto_2452883 ) ( HAVE_IMAGE ?auto_2452889 ?auto_2452890 ) ( HAVE_IMAGE ?auto_2452891 ?auto_2452892 ) ( not ( = ?auto_2452885 ?auto_2452883 ) ) ( not ( = ?auto_2452885 ?auto_2452890 ) ) ( not ( = ?auto_2452885 ?auto_2452892 ) ) ( not ( = ?auto_2452883 ?auto_2452887 ) ) ( not ( = ?auto_2452883 ?auto_2452890 ) ) ( not ( = ?auto_2452883 ?auto_2452892 ) ) ( not ( = ?auto_2452887 ?auto_2452890 ) ) ( not ( = ?auto_2452887 ?auto_2452892 ) ) ( not ( = ?auto_2452889 ?auto_2452893 ) ) ( not ( = ?auto_2452890 ?auto_2452892 ) ) ( not ( = ?auto_2452891 ?auto_2452893 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2452884 ?auto_2452885 ?auto_2452888 ?auto_2452887 )
      ( GET-5IMAGE-VERIFY ?auto_2452884 ?auto_2452885 ?auto_2452886 ?auto_2452883 ?auto_2452888 ?auto_2452887 ?auto_2452889 ?auto_2452890 ?auto_2452891 ?auto_2452892 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2453636 - DIRECTION
      ?auto_2453637 - MODE
      ?auto_2453638 - DIRECTION
      ?auto_2453635 - MODE
      ?auto_2453640 - DIRECTION
      ?auto_2453639 - MODE
      ?auto_2453641 - DIRECTION
      ?auto_2453642 - MODE
      ?auto_2453643 - DIRECTION
      ?auto_2453644 - MODE
    )
    :vars
    (
      ?auto_2453646 - INSTRUMENT
      ?auto_2453647 - SATELLITE
      ?auto_2453645 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2453638 ?auto_2453636 ) ) ( not ( = ?auto_2453640 ?auto_2453636 ) ) ( not ( = ?auto_2453640 ?auto_2453638 ) ) ( not ( = ?auto_2453641 ?auto_2453636 ) ) ( not ( = ?auto_2453641 ?auto_2453638 ) ) ( not ( = ?auto_2453641 ?auto_2453640 ) ) ( not ( = ?auto_2453643 ?auto_2453636 ) ) ( not ( = ?auto_2453643 ?auto_2453638 ) ) ( not ( = ?auto_2453643 ?auto_2453640 ) ) ( not ( = ?auto_2453643 ?auto_2453641 ) ) ( ON_BOARD ?auto_2453646 ?auto_2453647 ) ( SUPPORTS ?auto_2453646 ?auto_2453635 ) ( not ( = ?auto_2453638 ?auto_2453645 ) ) ( HAVE_IMAGE ?auto_2453636 ?auto_2453637 ) ( not ( = ?auto_2453636 ?auto_2453645 ) ) ( not ( = ?auto_2453637 ?auto_2453635 ) ) ( CALIBRATION_TARGET ?auto_2453646 ?auto_2453645 ) ( POWER_AVAIL ?auto_2453647 ) ( POINTING ?auto_2453647 ?auto_2453643 ) ( not ( = ?auto_2453645 ?auto_2453643 ) ) ( HAVE_IMAGE ?auto_2453640 ?auto_2453639 ) ( HAVE_IMAGE ?auto_2453641 ?auto_2453642 ) ( HAVE_IMAGE ?auto_2453643 ?auto_2453644 ) ( not ( = ?auto_2453637 ?auto_2453639 ) ) ( not ( = ?auto_2453637 ?auto_2453642 ) ) ( not ( = ?auto_2453637 ?auto_2453644 ) ) ( not ( = ?auto_2453635 ?auto_2453639 ) ) ( not ( = ?auto_2453635 ?auto_2453642 ) ) ( not ( = ?auto_2453635 ?auto_2453644 ) ) ( not ( = ?auto_2453640 ?auto_2453645 ) ) ( not ( = ?auto_2453639 ?auto_2453642 ) ) ( not ( = ?auto_2453639 ?auto_2453644 ) ) ( not ( = ?auto_2453641 ?auto_2453645 ) ) ( not ( = ?auto_2453642 ?auto_2453644 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2453636 ?auto_2453637 ?auto_2453638 ?auto_2453635 )
      ( GET-5IMAGE-VERIFY ?auto_2453636 ?auto_2453637 ?auto_2453638 ?auto_2453635 ?auto_2453640 ?auto_2453639 ?auto_2453641 ?auto_2453642 ?auto_2453643 ?auto_2453644 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2453689 - DIRECTION
      ?auto_2453690 - MODE
      ?auto_2453691 - DIRECTION
      ?auto_2453688 - MODE
      ?auto_2453693 - DIRECTION
      ?auto_2453692 - MODE
      ?auto_2453694 - DIRECTION
      ?auto_2453695 - MODE
      ?auto_2453696 - DIRECTION
      ?auto_2453697 - MODE
    )
    :vars
    (
      ?auto_2453699 - INSTRUMENT
      ?auto_2453700 - SATELLITE
      ?auto_2453698 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2453691 ?auto_2453689 ) ) ( not ( = ?auto_2453693 ?auto_2453689 ) ) ( not ( = ?auto_2453693 ?auto_2453691 ) ) ( not ( = ?auto_2453694 ?auto_2453689 ) ) ( not ( = ?auto_2453694 ?auto_2453691 ) ) ( not ( = ?auto_2453694 ?auto_2453693 ) ) ( not ( = ?auto_2453696 ?auto_2453689 ) ) ( not ( = ?auto_2453696 ?auto_2453691 ) ) ( not ( = ?auto_2453696 ?auto_2453693 ) ) ( not ( = ?auto_2453696 ?auto_2453694 ) ) ( ON_BOARD ?auto_2453699 ?auto_2453700 ) ( SUPPORTS ?auto_2453699 ?auto_2453688 ) ( not ( = ?auto_2453691 ?auto_2453698 ) ) ( HAVE_IMAGE ?auto_2453689 ?auto_2453690 ) ( not ( = ?auto_2453689 ?auto_2453698 ) ) ( not ( = ?auto_2453690 ?auto_2453688 ) ) ( CALIBRATION_TARGET ?auto_2453699 ?auto_2453698 ) ( POWER_AVAIL ?auto_2453700 ) ( POINTING ?auto_2453700 ?auto_2453694 ) ( not ( = ?auto_2453698 ?auto_2453694 ) ) ( HAVE_IMAGE ?auto_2453693 ?auto_2453692 ) ( HAVE_IMAGE ?auto_2453694 ?auto_2453695 ) ( HAVE_IMAGE ?auto_2453696 ?auto_2453697 ) ( not ( = ?auto_2453690 ?auto_2453692 ) ) ( not ( = ?auto_2453690 ?auto_2453695 ) ) ( not ( = ?auto_2453690 ?auto_2453697 ) ) ( not ( = ?auto_2453688 ?auto_2453692 ) ) ( not ( = ?auto_2453688 ?auto_2453695 ) ) ( not ( = ?auto_2453688 ?auto_2453697 ) ) ( not ( = ?auto_2453693 ?auto_2453698 ) ) ( not ( = ?auto_2453692 ?auto_2453695 ) ) ( not ( = ?auto_2453692 ?auto_2453697 ) ) ( not ( = ?auto_2453695 ?auto_2453697 ) ) ( not ( = ?auto_2453696 ?auto_2453698 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2453689 ?auto_2453690 ?auto_2453691 ?auto_2453688 )
      ( GET-5IMAGE-VERIFY ?auto_2453689 ?auto_2453690 ?auto_2453691 ?auto_2453688 ?auto_2453693 ?auto_2453692 ?auto_2453694 ?auto_2453695 ?auto_2453696 ?auto_2453697 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2454223 - DIRECTION
      ?auto_2454224 - MODE
      ?auto_2454225 - DIRECTION
      ?auto_2454222 - MODE
      ?auto_2454227 - DIRECTION
      ?auto_2454226 - MODE
      ?auto_2454228 - DIRECTION
      ?auto_2454229 - MODE
      ?auto_2454230 - DIRECTION
      ?auto_2454231 - MODE
    )
    :vars
    (
      ?auto_2454233 - INSTRUMENT
      ?auto_2454234 - SATELLITE
      ?auto_2454232 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2454225 ?auto_2454223 ) ) ( not ( = ?auto_2454227 ?auto_2454223 ) ) ( not ( = ?auto_2454227 ?auto_2454225 ) ) ( not ( = ?auto_2454228 ?auto_2454223 ) ) ( not ( = ?auto_2454228 ?auto_2454225 ) ) ( not ( = ?auto_2454228 ?auto_2454227 ) ) ( not ( = ?auto_2454230 ?auto_2454223 ) ) ( not ( = ?auto_2454230 ?auto_2454225 ) ) ( not ( = ?auto_2454230 ?auto_2454227 ) ) ( not ( = ?auto_2454230 ?auto_2454228 ) ) ( ON_BOARD ?auto_2454233 ?auto_2454234 ) ( SUPPORTS ?auto_2454233 ?auto_2454222 ) ( not ( = ?auto_2454225 ?auto_2454232 ) ) ( HAVE_IMAGE ?auto_2454223 ?auto_2454224 ) ( not ( = ?auto_2454223 ?auto_2454232 ) ) ( not ( = ?auto_2454224 ?auto_2454222 ) ) ( CALIBRATION_TARGET ?auto_2454233 ?auto_2454232 ) ( POWER_AVAIL ?auto_2454234 ) ( POINTING ?auto_2454234 ?auto_2454227 ) ( not ( = ?auto_2454232 ?auto_2454227 ) ) ( HAVE_IMAGE ?auto_2454227 ?auto_2454226 ) ( HAVE_IMAGE ?auto_2454228 ?auto_2454229 ) ( HAVE_IMAGE ?auto_2454230 ?auto_2454231 ) ( not ( = ?auto_2454224 ?auto_2454226 ) ) ( not ( = ?auto_2454224 ?auto_2454229 ) ) ( not ( = ?auto_2454224 ?auto_2454231 ) ) ( not ( = ?auto_2454222 ?auto_2454226 ) ) ( not ( = ?auto_2454222 ?auto_2454229 ) ) ( not ( = ?auto_2454222 ?auto_2454231 ) ) ( not ( = ?auto_2454226 ?auto_2454229 ) ) ( not ( = ?auto_2454226 ?auto_2454231 ) ) ( not ( = ?auto_2454228 ?auto_2454232 ) ) ( not ( = ?auto_2454229 ?auto_2454231 ) ) ( not ( = ?auto_2454230 ?auto_2454232 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2454223 ?auto_2454224 ?auto_2454225 ?auto_2454222 )
      ( GET-5IMAGE-VERIFY ?auto_2454223 ?auto_2454224 ?auto_2454225 ?auto_2454222 ?auto_2454227 ?auto_2454226 ?auto_2454228 ?auto_2454229 ?auto_2454230 ?auto_2454231 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2465438 - DIRECTION
      ?auto_2465439 - MODE
      ?auto_2465440 - DIRECTION
      ?auto_2465437 - MODE
      ?auto_2465442 - DIRECTION
      ?auto_2465441 - MODE
      ?auto_2465443 - DIRECTION
      ?auto_2465444 - MODE
      ?auto_2465445 - DIRECTION
      ?auto_2465446 - MODE
    )
    :vars
    (
      ?auto_2465448 - INSTRUMENT
      ?auto_2465449 - SATELLITE
      ?auto_2465447 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2465440 ?auto_2465438 ) ) ( not ( = ?auto_2465442 ?auto_2465438 ) ) ( not ( = ?auto_2465442 ?auto_2465440 ) ) ( not ( = ?auto_2465443 ?auto_2465438 ) ) ( not ( = ?auto_2465443 ?auto_2465440 ) ) ( not ( = ?auto_2465443 ?auto_2465442 ) ) ( not ( = ?auto_2465445 ?auto_2465438 ) ) ( not ( = ?auto_2465445 ?auto_2465440 ) ) ( not ( = ?auto_2465445 ?auto_2465442 ) ) ( not ( = ?auto_2465445 ?auto_2465443 ) ) ( ON_BOARD ?auto_2465448 ?auto_2465449 ) ( SUPPORTS ?auto_2465448 ?auto_2465446 ) ( not ( = ?auto_2465445 ?auto_2465447 ) ) ( HAVE_IMAGE ?auto_2465440 ?auto_2465437 ) ( not ( = ?auto_2465440 ?auto_2465447 ) ) ( not ( = ?auto_2465437 ?auto_2465446 ) ) ( CALIBRATION_TARGET ?auto_2465448 ?auto_2465447 ) ( POWER_AVAIL ?auto_2465449 ) ( POINTING ?auto_2465449 ?auto_2465438 ) ( not ( = ?auto_2465447 ?auto_2465438 ) ) ( HAVE_IMAGE ?auto_2465438 ?auto_2465439 ) ( HAVE_IMAGE ?auto_2465442 ?auto_2465441 ) ( HAVE_IMAGE ?auto_2465443 ?auto_2465444 ) ( not ( = ?auto_2465439 ?auto_2465437 ) ) ( not ( = ?auto_2465439 ?auto_2465441 ) ) ( not ( = ?auto_2465439 ?auto_2465444 ) ) ( not ( = ?auto_2465439 ?auto_2465446 ) ) ( not ( = ?auto_2465437 ?auto_2465441 ) ) ( not ( = ?auto_2465437 ?auto_2465444 ) ) ( not ( = ?auto_2465442 ?auto_2465447 ) ) ( not ( = ?auto_2465441 ?auto_2465444 ) ) ( not ( = ?auto_2465441 ?auto_2465446 ) ) ( not ( = ?auto_2465443 ?auto_2465447 ) ) ( not ( = ?auto_2465444 ?auto_2465446 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2465440 ?auto_2465437 ?auto_2465445 ?auto_2465446 )
      ( GET-5IMAGE-VERIFY ?auto_2465438 ?auto_2465439 ?auto_2465440 ?auto_2465437 ?auto_2465442 ?auto_2465441 ?auto_2465443 ?auto_2465444 ?auto_2465445 ?auto_2465446 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2465490 - DIRECTION
      ?auto_2465491 - MODE
      ?auto_2465492 - DIRECTION
      ?auto_2465489 - MODE
      ?auto_2465494 - DIRECTION
      ?auto_2465493 - MODE
      ?auto_2465495 - DIRECTION
      ?auto_2465496 - MODE
      ?auto_2465497 - DIRECTION
      ?auto_2465498 - MODE
    )
    :vars
    (
      ?auto_2465500 - INSTRUMENT
      ?auto_2465501 - SATELLITE
      ?auto_2465499 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2465492 ?auto_2465490 ) ) ( not ( = ?auto_2465494 ?auto_2465490 ) ) ( not ( = ?auto_2465494 ?auto_2465492 ) ) ( not ( = ?auto_2465495 ?auto_2465490 ) ) ( not ( = ?auto_2465495 ?auto_2465492 ) ) ( not ( = ?auto_2465495 ?auto_2465494 ) ) ( not ( = ?auto_2465497 ?auto_2465490 ) ) ( not ( = ?auto_2465497 ?auto_2465492 ) ) ( not ( = ?auto_2465497 ?auto_2465494 ) ) ( not ( = ?auto_2465497 ?auto_2465495 ) ) ( ON_BOARD ?auto_2465500 ?auto_2465501 ) ( SUPPORTS ?auto_2465500 ?auto_2465496 ) ( not ( = ?auto_2465495 ?auto_2465499 ) ) ( HAVE_IMAGE ?auto_2465492 ?auto_2465489 ) ( not ( = ?auto_2465492 ?auto_2465499 ) ) ( not ( = ?auto_2465489 ?auto_2465496 ) ) ( CALIBRATION_TARGET ?auto_2465500 ?auto_2465499 ) ( POWER_AVAIL ?auto_2465501 ) ( POINTING ?auto_2465501 ?auto_2465490 ) ( not ( = ?auto_2465499 ?auto_2465490 ) ) ( HAVE_IMAGE ?auto_2465490 ?auto_2465491 ) ( HAVE_IMAGE ?auto_2465494 ?auto_2465493 ) ( HAVE_IMAGE ?auto_2465497 ?auto_2465498 ) ( not ( = ?auto_2465491 ?auto_2465489 ) ) ( not ( = ?auto_2465491 ?auto_2465493 ) ) ( not ( = ?auto_2465491 ?auto_2465496 ) ) ( not ( = ?auto_2465491 ?auto_2465498 ) ) ( not ( = ?auto_2465489 ?auto_2465493 ) ) ( not ( = ?auto_2465489 ?auto_2465498 ) ) ( not ( = ?auto_2465494 ?auto_2465499 ) ) ( not ( = ?auto_2465493 ?auto_2465496 ) ) ( not ( = ?auto_2465493 ?auto_2465498 ) ) ( not ( = ?auto_2465496 ?auto_2465498 ) ) ( not ( = ?auto_2465497 ?auto_2465499 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2465492 ?auto_2465489 ?auto_2465495 ?auto_2465496 )
      ( GET-5IMAGE-VERIFY ?auto_2465490 ?auto_2465491 ?auto_2465492 ?auto_2465489 ?auto_2465494 ?auto_2465493 ?auto_2465495 ?auto_2465496 ?auto_2465497 ?auto_2465498 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2465848 - DIRECTION
      ?auto_2465849 - MODE
      ?auto_2465850 - DIRECTION
      ?auto_2465847 - MODE
      ?auto_2465852 - DIRECTION
      ?auto_2465851 - MODE
      ?auto_2465853 - DIRECTION
      ?auto_2465854 - MODE
      ?auto_2465855 - DIRECTION
      ?auto_2465856 - MODE
    )
    :vars
    (
      ?auto_2465858 - INSTRUMENT
      ?auto_2465859 - SATELLITE
      ?auto_2465857 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2465850 ?auto_2465848 ) ) ( not ( = ?auto_2465852 ?auto_2465848 ) ) ( not ( = ?auto_2465852 ?auto_2465850 ) ) ( not ( = ?auto_2465853 ?auto_2465848 ) ) ( not ( = ?auto_2465853 ?auto_2465850 ) ) ( not ( = ?auto_2465853 ?auto_2465852 ) ) ( not ( = ?auto_2465855 ?auto_2465848 ) ) ( not ( = ?auto_2465855 ?auto_2465850 ) ) ( not ( = ?auto_2465855 ?auto_2465852 ) ) ( not ( = ?auto_2465855 ?auto_2465853 ) ) ( ON_BOARD ?auto_2465858 ?auto_2465859 ) ( SUPPORTS ?auto_2465858 ?auto_2465851 ) ( not ( = ?auto_2465852 ?auto_2465857 ) ) ( HAVE_IMAGE ?auto_2465850 ?auto_2465847 ) ( not ( = ?auto_2465850 ?auto_2465857 ) ) ( not ( = ?auto_2465847 ?auto_2465851 ) ) ( CALIBRATION_TARGET ?auto_2465858 ?auto_2465857 ) ( POWER_AVAIL ?auto_2465859 ) ( POINTING ?auto_2465859 ?auto_2465848 ) ( not ( = ?auto_2465857 ?auto_2465848 ) ) ( HAVE_IMAGE ?auto_2465848 ?auto_2465849 ) ( HAVE_IMAGE ?auto_2465853 ?auto_2465854 ) ( HAVE_IMAGE ?auto_2465855 ?auto_2465856 ) ( not ( = ?auto_2465849 ?auto_2465847 ) ) ( not ( = ?auto_2465849 ?auto_2465851 ) ) ( not ( = ?auto_2465849 ?auto_2465854 ) ) ( not ( = ?auto_2465849 ?auto_2465856 ) ) ( not ( = ?auto_2465847 ?auto_2465854 ) ) ( not ( = ?auto_2465847 ?auto_2465856 ) ) ( not ( = ?auto_2465851 ?auto_2465854 ) ) ( not ( = ?auto_2465851 ?auto_2465856 ) ) ( not ( = ?auto_2465853 ?auto_2465857 ) ) ( not ( = ?auto_2465854 ?auto_2465856 ) ) ( not ( = ?auto_2465855 ?auto_2465857 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2465850 ?auto_2465847 ?auto_2465852 ?auto_2465851 )
      ( GET-5IMAGE-VERIFY ?auto_2465848 ?auto_2465849 ?auto_2465850 ?auto_2465847 ?auto_2465852 ?auto_2465851 ?auto_2465853 ?auto_2465854 ?auto_2465855 ?auto_2465856 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2468735 - DIRECTION
      ?auto_2468736 - MODE
      ?auto_2468737 - DIRECTION
      ?auto_2468734 - MODE
      ?auto_2468739 - DIRECTION
      ?auto_2468738 - MODE
      ?auto_2468740 - DIRECTION
      ?auto_2468741 - MODE
      ?auto_2468742 - DIRECTION
      ?auto_2468743 - MODE
    )
    :vars
    (
      ?auto_2468745 - INSTRUMENT
      ?auto_2468746 - SATELLITE
      ?auto_2468744 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2468737 ?auto_2468735 ) ) ( not ( = ?auto_2468739 ?auto_2468735 ) ) ( not ( = ?auto_2468739 ?auto_2468737 ) ) ( not ( = ?auto_2468740 ?auto_2468735 ) ) ( not ( = ?auto_2468740 ?auto_2468737 ) ) ( not ( = ?auto_2468740 ?auto_2468739 ) ) ( not ( = ?auto_2468742 ?auto_2468735 ) ) ( not ( = ?auto_2468742 ?auto_2468737 ) ) ( not ( = ?auto_2468742 ?auto_2468739 ) ) ( not ( = ?auto_2468742 ?auto_2468740 ) ) ( ON_BOARD ?auto_2468745 ?auto_2468746 ) ( SUPPORTS ?auto_2468745 ?auto_2468734 ) ( not ( = ?auto_2468737 ?auto_2468744 ) ) ( HAVE_IMAGE ?auto_2468739 ?auto_2468738 ) ( not ( = ?auto_2468739 ?auto_2468744 ) ) ( not ( = ?auto_2468738 ?auto_2468734 ) ) ( CALIBRATION_TARGET ?auto_2468745 ?auto_2468744 ) ( POWER_AVAIL ?auto_2468746 ) ( POINTING ?auto_2468746 ?auto_2468735 ) ( not ( = ?auto_2468744 ?auto_2468735 ) ) ( HAVE_IMAGE ?auto_2468735 ?auto_2468736 ) ( HAVE_IMAGE ?auto_2468740 ?auto_2468741 ) ( HAVE_IMAGE ?auto_2468742 ?auto_2468743 ) ( not ( = ?auto_2468736 ?auto_2468734 ) ) ( not ( = ?auto_2468736 ?auto_2468738 ) ) ( not ( = ?auto_2468736 ?auto_2468741 ) ) ( not ( = ?auto_2468736 ?auto_2468743 ) ) ( not ( = ?auto_2468734 ?auto_2468741 ) ) ( not ( = ?auto_2468734 ?auto_2468743 ) ) ( not ( = ?auto_2468738 ?auto_2468741 ) ) ( not ( = ?auto_2468738 ?auto_2468743 ) ) ( not ( = ?auto_2468740 ?auto_2468744 ) ) ( not ( = ?auto_2468741 ?auto_2468743 ) ) ( not ( = ?auto_2468742 ?auto_2468744 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2468739 ?auto_2468738 ?auto_2468737 ?auto_2468734 )
      ( GET-5IMAGE-VERIFY ?auto_2468735 ?auto_2468736 ?auto_2468737 ?auto_2468734 ?auto_2468739 ?auto_2468738 ?auto_2468740 ?auto_2468741 ?auto_2468742 ?auto_2468743 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2470903 - DIRECTION
      ?auto_2470904 - MODE
      ?auto_2470905 - DIRECTION
      ?auto_2470902 - MODE
      ?auto_2470907 - DIRECTION
      ?auto_2470906 - MODE
      ?auto_2470908 - DIRECTION
      ?auto_2470909 - MODE
      ?auto_2470910 - DIRECTION
      ?auto_2470911 - MODE
    )
    :vars
    (
      ?auto_2470913 - INSTRUMENT
      ?auto_2470914 - SATELLITE
      ?auto_2470912 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2470905 ?auto_2470903 ) ) ( not ( = ?auto_2470907 ?auto_2470903 ) ) ( not ( = ?auto_2470907 ?auto_2470905 ) ) ( not ( = ?auto_2470908 ?auto_2470903 ) ) ( not ( = ?auto_2470908 ?auto_2470905 ) ) ( not ( = ?auto_2470908 ?auto_2470907 ) ) ( not ( = ?auto_2470910 ?auto_2470903 ) ) ( not ( = ?auto_2470910 ?auto_2470905 ) ) ( not ( = ?auto_2470910 ?auto_2470907 ) ) ( not ( = ?auto_2470910 ?auto_2470908 ) ) ( ON_BOARD ?auto_2470913 ?auto_2470914 ) ( SUPPORTS ?auto_2470913 ?auto_2470904 ) ( not ( = ?auto_2470903 ?auto_2470912 ) ) ( HAVE_IMAGE ?auto_2470905 ?auto_2470902 ) ( not ( = ?auto_2470905 ?auto_2470912 ) ) ( not ( = ?auto_2470902 ?auto_2470904 ) ) ( CALIBRATION_TARGET ?auto_2470913 ?auto_2470912 ) ( POWER_AVAIL ?auto_2470914 ) ( POINTING ?auto_2470914 ?auto_2470910 ) ( not ( = ?auto_2470912 ?auto_2470910 ) ) ( HAVE_IMAGE ?auto_2470907 ?auto_2470906 ) ( HAVE_IMAGE ?auto_2470908 ?auto_2470909 ) ( HAVE_IMAGE ?auto_2470910 ?auto_2470911 ) ( not ( = ?auto_2470904 ?auto_2470906 ) ) ( not ( = ?auto_2470904 ?auto_2470909 ) ) ( not ( = ?auto_2470904 ?auto_2470911 ) ) ( not ( = ?auto_2470902 ?auto_2470906 ) ) ( not ( = ?auto_2470902 ?auto_2470909 ) ) ( not ( = ?auto_2470902 ?auto_2470911 ) ) ( not ( = ?auto_2470907 ?auto_2470912 ) ) ( not ( = ?auto_2470906 ?auto_2470909 ) ) ( not ( = ?auto_2470906 ?auto_2470911 ) ) ( not ( = ?auto_2470908 ?auto_2470912 ) ) ( not ( = ?auto_2470909 ?auto_2470911 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2470905 ?auto_2470902 ?auto_2470903 ?auto_2470904 )
      ( GET-5IMAGE-VERIFY ?auto_2470903 ?auto_2470904 ?auto_2470905 ?auto_2470902 ?auto_2470907 ?auto_2470906 ?auto_2470908 ?auto_2470909 ?auto_2470910 ?auto_2470911 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2470956 - DIRECTION
      ?auto_2470957 - MODE
      ?auto_2470958 - DIRECTION
      ?auto_2470955 - MODE
      ?auto_2470960 - DIRECTION
      ?auto_2470959 - MODE
      ?auto_2470961 - DIRECTION
      ?auto_2470962 - MODE
      ?auto_2470963 - DIRECTION
      ?auto_2470964 - MODE
    )
    :vars
    (
      ?auto_2470966 - INSTRUMENT
      ?auto_2470967 - SATELLITE
      ?auto_2470965 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2470958 ?auto_2470956 ) ) ( not ( = ?auto_2470960 ?auto_2470956 ) ) ( not ( = ?auto_2470960 ?auto_2470958 ) ) ( not ( = ?auto_2470961 ?auto_2470956 ) ) ( not ( = ?auto_2470961 ?auto_2470958 ) ) ( not ( = ?auto_2470961 ?auto_2470960 ) ) ( not ( = ?auto_2470963 ?auto_2470956 ) ) ( not ( = ?auto_2470963 ?auto_2470958 ) ) ( not ( = ?auto_2470963 ?auto_2470960 ) ) ( not ( = ?auto_2470963 ?auto_2470961 ) ) ( ON_BOARD ?auto_2470966 ?auto_2470967 ) ( SUPPORTS ?auto_2470966 ?auto_2470957 ) ( not ( = ?auto_2470956 ?auto_2470965 ) ) ( HAVE_IMAGE ?auto_2470958 ?auto_2470955 ) ( not ( = ?auto_2470958 ?auto_2470965 ) ) ( not ( = ?auto_2470955 ?auto_2470957 ) ) ( CALIBRATION_TARGET ?auto_2470966 ?auto_2470965 ) ( POWER_AVAIL ?auto_2470967 ) ( POINTING ?auto_2470967 ?auto_2470961 ) ( not ( = ?auto_2470965 ?auto_2470961 ) ) ( HAVE_IMAGE ?auto_2470960 ?auto_2470959 ) ( HAVE_IMAGE ?auto_2470961 ?auto_2470962 ) ( HAVE_IMAGE ?auto_2470963 ?auto_2470964 ) ( not ( = ?auto_2470957 ?auto_2470959 ) ) ( not ( = ?auto_2470957 ?auto_2470962 ) ) ( not ( = ?auto_2470957 ?auto_2470964 ) ) ( not ( = ?auto_2470955 ?auto_2470959 ) ) ( not ( = ?auto_2470955 ?auto_2470962 ) ) ( not ( = ?auto_2470955 ?auto_2470964 ) ) ( not ( = ?auto_2470960 ?auto_2470965 ) ) ( not ( = ?auto_2470959 ?auto_2470962 ) ) ( not ( = ?auto_2470959 ?auto_2470964 ) ) ( not ( = ?auto_2470962 ?auto_2470964 ) ) ( not ( = ?auto_2470963 ?auto_2470965 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2470958 ?auto_2470955 ?auto_2470956 ?auto_2470957 )
      ( GET-5IMAGE-VERIFY ?auto_2470956 ?auto_2470957 ?auto_2470958 ?auto_2470955 ?auto_2470960 ?auto_2470959 ?auto_2470961 ?auto_2470962 ?auto_2470963 ?auto_2470964 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2471490 - DIRECTION
      ?auto_2471491 - MODE
      ?auto_2471492 - DIRECTION
      ?auto_2471489 - MODE
      ?auto_2471494 - DIRECTION
      ?auto_2471493 - MODE
      ?auto_2471495 - DIRECTION
      ?auto_2471496 - MODE
      ?auto_2471497 - DIRECTION
      ?auto_2471498 - MODE
    )
    :vars
    (
      ?auto_2471500 - INSTRUMENT
      ?auto_2471501 - SATELLITE
      ?auto_2471499 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2471492 ?auto_2471490 ) ) ( not ( = ?auto_2471494 ?auto_2471490 ) ) ( not ( = ?auto_2471494 ?auto_2471492 ) ) ( not ( = ?auto_2471495 ?auto_2471490 ) ) ( not ( = ?auto_2471495 ?auto_2471492 ) ) ( not ( = ?auto_2471495 ?auto_2471494 ) ) ( not ( = ?auto_2471497 ?auto_2471490 ) ) ( not ( = ?auto_2471497 ?auto_2471492 ) ) ( not ( = ?auto_2471497 ?auto_2471494 ) ) ( not ( = ?auto_2471497 ?auto_2471495 ) ) ( ON_BOARD ?auto_2471500 ?auto_2471501 ) ( SUPPORTS ?auto_2471500 ?auto_2471491 ) ( not ( = ?auto_2471490 ?auto_2471499 ) ) ( HAVE_IMAGE ?auto_2471492 ?auto_2471489 ) ( not ( = ?auto_2471492 ?auto_2471499 ) ) ( not ( = ?auto_2471489 ?auto_2471491 ) ) ( CALIBRATION_TARGET ?auto_2471500 ?auto_2471499 ) ( POWER_AVAIL ?auto_2471501 ) ( POINTING ?auto_2471501 ?auto_2471494 ) ( not ( = ?auto_2471499 ?auto_2471494 ) ) ( HAVE_IMAGE ?auto_2471494 ?auto_2471493 ) ( HAVE_IMAGE ?auto_2471495 ?auto_2471496 ) ( HAVE_IMAGE ?auto_2471497 ?auto_2471498 ) ( not ( = ?auto_2471491 ?auto_2471493 ) ) ( not ( = ?auto_2471491 ?auto_2471496 ) ) ( not ( = ?auto_2471491 ?auto_2471498 ) ) ( not ( = ?auto_2471489 ?auto_2471493 ) ) ( not ( = ?auto_2471489 ?auto_2471496 ) ) ( not ( = ?auto_2471489 ?auto_2471498 ) ) ( not ( = ?auto_2471493 ?auto_2471496 ) ) ( not ( = ?auto_2471493 ?auto_2471498 ) ) ( not ( = ?auto_2471495 ?auto_2471499 ) ) ( not ( = ?auto_2471496 ?auto_2471498 ) ) ( not ( = ?auto_2471497 ?auto_2471499 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2471492 ?auto_2471489 ?auto_2471490 ?auto_2471491 )
      ( GET-5IMAGE-VERIFY ?auto_2471490 ?auto_2471491 ?auto_2471492 ?auto_2471489 ?auto_2471494 ?auto_2471493 ?auto_2471495 ?auto_2471496 ?auto_2471497 ?auto_2471498 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2475751 - DIRECTION
      ?auto_2475752 - MODE
      ?auto_2475753 - DIRECTION
      ?auto_2475750 - MODE
      ?auto_2475755 - DIRECTION
      ?auto_2475754 - MODE
      ?auto_2475756 - DIRECTION
      ?auto_2475757 - MODE
      ?auto_2475758 - DIRECTION
      ?auto_2475759 - MODE
    )
    :vars
    (
      ?auto_2475761 - INSTRUMENT
      ?auto_2475762 - SATELLITE
      ?auto_2475760 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_2475753 ?auto_2475751 ) ) ( not ( = ?auto_2475755 ?auto_2475751 ) ) ( not ( = ?auto_2475755 ?auto_2475753 ) ) ( not ( = ?auto_2475756 ?auto_2475751 ) ) ( not ( = ?auto_2475756 ?auto_2475753 ) ) ( not ( = ?auto_2475756 ?auto_2475755 ) ) ( not ( = ?auto_2475758 ?auto_2475751 ) ) ( not ( = ?auto_2475758 ?auto_2475753 ) ) ( not ( = ?auto_2475758 ?auto_2475755 ) ) ( not ( = ?auto_2475758 ?auto_2475756 ) ) ( ON_BOARD ?auto_2475761 ?auto_2475762 ) ( SUPPORTS ?auto_2475761 ?auto_2475752 ) ( not ( = ?auto_2475751 ?auto_2475760 ) ) ( HAVE_IMAGE ?auto_2475755 ?auto_2475754 ) ( not ( = ?auto_2475755 ?auto_2475760 ) ) ( not ( = ?auto_2475754 ?auto_2475752 ) ) ( CALIBRATION_TARGET ?auto_2475761 ?auto_2475760 ) ( POWER_AVAIL ?auto_2475762 ) ( POINTING ?auto_2475762 ?auto_2475753 ) ( not ( = ?auto_2475760 ?auto_2475753 ) ) ( HAVE_IMAGE ?auto_2475753 ?auto_2475750 ) ( HAVE_IMAGE ?auto_2475756 ?auto_2475757 ) ( HAVE_IMAGE ?auto_2475758 ?auto_2475759 ) ( not ( = ?auto_2475752 ?auto_2475750 ) ) ( not ( = ?auto_2475752 ?auto_2475757 ) ) ( not ( = ?auto_2475752 ?auto_2475759 ) ) ( not ( = ?auto_2475750 ?auto_2475754 ) ) ( not ( = ?auto_2475750 ?auto_2475757 ) ) ( not ( = ?auto_2475750 ?auto_2475759 ) ) ( not ( = ?auto_2475754 ?auto_2475757 ) ) ( not ( = ?auto_2475754 ?auto_2475759 ) ) ( not ( = ?auto_2475756 ?auto_2475760 ) ) ( not ( = ?auto_2475757 ?auto_2475759 ) ) ( not ( = ?auto_2475758 ?auto_2475760 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2475755 ?auto_2475754 ?auto_2475751 ?auto_2475752 )
      ( GET-5IMAGE-VERIFY ?auto_2475751 ?auto_2475752 ?auto_2475753 ?auto_2475750 ?auto_2475755 ?auto_2475754 ?auto_2475756 ?auto_2475757 ?auto_2475758 ?auto_2475759 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2479992 - DIRECTION
      ?auto_2479993 - MODE
      ?auto_2479994 - DIRECTION
      ?auto_2479991 - MODE
      ?auto_2479996 - DIRECTION
      ?auto_2479995 - MODE
      ?auto_2479997 - DIRECTION
      ?auto_2479998 - MODE
    )
    :vars
    (
      ?auto_2480002 - INSTRUMENT
      ?auto_2480001 - SATELLITE
      ?auto_2480003 - DIRECTION
      ?auto_2479999 - DIRECTION
      ?auto_2480000 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2479994 ?auto_2479992 ) ) ( not ( = ?auto_2479996 ?auto_2479992 ) ) ( not ( = ?auto_2479996 ?auto_2479994 ) ) ( not ( = ?auto_2479997 ?auto_2479992 ) ) ( not ( = ?auto_2479997 ?auto_2479994 ) ) ( not ( = ?auto_2479997 ?auto_2479996 ) ) ( ON_BOARD ?auto_2480002 ?auto_2480001 ) ( SUPPORTS ?auto_2480002 ?auto_2479998 ) ( not ( = ?auto_2479997 ?auto_2480003 ) ) ( HAVE_IMAGE ?auto_2479992 ?auto_2479993 ) ( not ( = ?auto_2479992 ?auto_2480003 ) ) ( not ( = ?auto_2479993 ?auto_2479998 ) ) ( CALIBRATION_TARGET ?auto_2480002 ?auto_2480003 ) ( POINTING ?auto_2480001 ?auto_2479999 ) ( not ( = ?auto_2480003 ?auto_2479999 ) ) ( not ( = ?auto_2479997 ?auto_2479999 ) ) ( not ( = ?auto_2479992 ?auto_2479999 ) ) ( ON_BOARD ?auto_2480000 ?auto_2480001 ) ( POWER_ON ?auto_2480000 ) ( not ( = ?auto_2480002 ?auto_2480000 ) ) ( HAVE_IMAGE ?auto_2479994 ?auto_2479991 ) ( HAVE_IMAGE ?auto_2479996 ?auto_2479995 ) ( not ( = ?auto_2479993 ?auto_2479991 ) ) ( not ( = ?auto_2479993 ?auto_2479995 ) ) ( not ( = ?auto_2479994 ?auto_2480003 ) ) ( not ( = ?auto_2479994 ?auto_2479999 ) ) ( not ( = ?auto_2479991 ?auto_2479995 ) ) ( not ( = ?auto_2479991 ?auto_2479998 ) ) ( not ( = ?auto_2479996 ?auto_2480003 ) ) ( not ( = ?auto_2479996 ?auto_2479999 ) ) ( not ( = ?auto_2479995 ?auto_2479998 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2479992 ?auto_2479993 ?auto_2479997 ?auto_2479998 )
      ( GET-4IMAGE-VERIFY ?auto_2479992 ?auto_2479993 ?auto_2479994 ?auto_2479991 ?auto_2479996 ?auto_2479995 ?auto_2479997 ?auto_2479998 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2480043 - DIRECTION
      ?auto_2480044 - MODE
      ?auto_2480045 - DIRECTION
      ?auto_2480042 - MODE
      ?auto_2480047 - DIRECTION
      ?auto_2480046 - MODE
      ?auto_2480048 - DIRECTION
      ?auto_2480049 - MODE
    )
    :vars
    (
      ?auto_2480053 - INSTRUMENT
      ?auto_2480052 - SATELLITE
      ?auto_2480054 - DIRECTION
      ?auto_2480050 - DIRECTION
      ?auto_2480051 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2480045 ?auto_2480043 ) ) ( not ( = ?auto_2480047 ?auto_2480043 ) ) ( not ( = ?auto_2480047 ?auto_2480045 ) ) ( not ( = ?auto_2480048 ?auto_2480043 ) ) ( not ( = ?auto_2480048 ?auto_2480045 ) ) ( not ( = ?auto_2480048 ?auto_2480047 ) ) ( ON_BOARD ?auto_2480053 ?auto_2480052 ) ( SUPPORTS ?auto_2480053 ?auto_2480046 ) ( not ( = ?auto_2480047 ?auto_2480054 ) ) ( HAVE_IMAGE ?auto_2480043 ?auto_2480044 ) ( not ( = ?auto_2480043 ?auto_2480054 ) ) ( not ( = ?auto_2480044 ?auto_2480046 ) ) ( CALIBRATION_TARGET ?auto_2480053 ?auto_2480054 ) ( POINTING ?auto_2480052 ?auto_2480050 ) ( not ( = ?auto_2480054 ?auto_2480050 ) ) ( not ( = ?auto_2480047 ?auto_2480050 ) ) ( not ( = ?auto_2480043 ?auto_2480050 ) ) ( ON_BOARD ?auto_2480051 ?auto_2480052 ) ( POWER_ON ?auto_2480051 ) ( not ( = ?auto_2480053 ?auto_2480051 ) ) ( HAVE_IMAGE ?auto_2480045 ?auto_2480042 ) ( HAVE_IMAGE ?auto_2480048 ?auto_2480049 ) ( not ( = ?auto_2480044 ?auto_2480042 ) ) ( not ( = ?auto_2480044 ?auto_2480049 ) ) ( not ( = ?auto_2480045 ?auto_2480054 ) ) ( not ( = ?auto_2480045 ?auto_2480050 ) ) ( not ( = ?auto_2480042 ?auto_2480046 ) ) ( not ( = ?auto_2480042 ?auto_2480049 ) ) ( not ( = ?auto_2480046 ?auto_2480049 ) ) ( not ( = ?auto_2480048 ?auto_2480054 ) ) ( not ( = ?auto_2480048 ?auto_2480050 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2480043 ?auto_2480044 ?auto_2480047 ?auto_2480046 )
      ( GET-4IMAGE-VERIFY ?auto_2480043 ?auto_2480044 ?auto_2480045 ?auto_2480042 ?auto_2480047 ?auto_2480046 ?auto_2480048 ?auto_2480049 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2480368 - DIRECTION
      ?auto_2480369 - MODE
      ?auto_2480370 - DIRECTION
      ?auto_2480367 - MODE
      ?auto_2480372 - DIRECTION
      ?auto_2480371 - MODE
      ?auto_2480373 - DIRECTION
      ?auto_2480374 - MODE
    )
    :vars
    (
      ?auto_2480378 - INSTRUMENT
      ?auto_2480377 - SATELLITE
      ?auto_2480379 - DIRECTION
      ?auto_2480375 - DIRECTION
      ?auto_2480376 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2480370 ?auto_2480368 ) ) ( not ( = ?auto_2480372 ?auto_2480368 ) ) ( not ( = ?auto_2480372 ?auto_2480370 ) ) ( not ( = ?auto_2480373 ?auto_2480368 ) ) ( not ( = ?auto_2480373 ?auto_2480370 ) ) ( not ( = ?auto_2480373 ?auto_2480372 ) ) ( ON_BOARD ?auto_2480378 ?auto_2480377 ) ( SUPPORTS ?auto_2480378 ?auto_2480367 ) ( not ( = ?auto_2480370 ?auto_2480379 ) ) ( HAVE_IMAGE ?auto_2480368 ?auto_2480369 ) ( not ( = ?auto_2480368 ?auto_2480379 ) ) ( not ( = ?auto_2480369 ?auto_2480367 ) ) ( CALIBRATION_TARGET ?auto_2480378 ?auto_2480379 ) ( POINTING ?auto_2480377 ?auto_2480375 ) ( not ( = ?auto_2480379 ?auto_2480375 ) ) ( not ( = ?auto_2480370 ?auto_2480375 ) ) ( not ( = ?auto_2480368 ?auto_2480375 ) ) ( ON_BOARD ?auto_2480376 ?auto_2480377 ) ( POWER_ON ?auto_2480376 ) ( not ( = ?auto_2480378 ?auto_2480376 ) ) ( HAVE_IMAGE ?auto_2480372 ?auto_2480371 ) ( HAVE_IMAGE ?auto_2480373 ?auto_2480374 ) ( not ( = ?auto_2480369 ?auto_2480371 ) ) ( not ( = ?auto_2480369 ?auto_2480374 ) ) ( not ( = ?auto_2480367 ?auto_2480371 ) ) ( not ( = ?auto_2480367 ?auto_2480374 ) ) ( not ( = ?auto_2480372 ?auto_2480379 ) ) ( not ( = ?auto_2480372 ?auto_2480375 ) ) ( not ( = ?auto_2480371 ?auto_2480374 ) ) ( not ( = ?auto_2480373 ?auto_2480379 ) ) ( not ( = ?auto_2480373 ?auto_2480375 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2480368 ?auto_2480369 ?auto_2480370 ?auto_2480367 )
      ( GET-4IMAGE-VERIFY ?auto_2480368 ?auto_2480369 ?auto_2480370 ?auto_2480367 ?auto_2480372 ?auto_2480371 ?auto_2480373 ?auto_2480374 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2482911 - DIRECTION
      ?auto_2482912 - MODE
      ?auto_2482913 - DIRECTION
      ?auto_2482910 - MODE
      ?auto_2482915 - DIRECTION
      ?auto_2482914 - MODE
      ?auto_2482916 - DIRECTION
      ?auto_2482917 - MODE
    )
    :vars
    (
      ?auto_2482921 - INSTRUMENT
      ?auto_2482920 - SATELLITE
      ?auto_2482922 - DIRECTION
      ?auto_2482918 - DIRECTION
      ?auto_2482919 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2482913 ?auto_2482911 ) ) ( not ( = ?auto_2482915 ?auto_2482911 ) ) ( not ( = ?auto_2482915 ?auto_2482913 ) ) ( not ( = ?auto_2482916 ?auto_2482911 ) ) ( not ( = ?auto_2482916 ?auto_2482913 ) ) ( not ( = ?auto_2482916 ?auto_2482915 ) ) ( ON_BOARD ?auto_2482921 ?auto_2482920 ) ( SUPPORTS ?auto_2482921 ?auto_2482912 ) ( not ( = ?auto_2482911 ?auto_2482922 ) ) ( HAVE_IMAGE ?auto_2482913 ?auto_2482910 ) ( not ( = ?auto_2482913 ?auto_2482922 ) ) ( not ( = ?auto_2482910 ?auto_2482912 ) ) ( CALIBRATION_TARGET ?auto_2482921 ?auto_2482922 ) ( POINTING ?auto_2482920 ?auto_2482918 ) ( not ( = ?auto_2482922 ?auto_2482918 ) ) ( not ( = ?auto_2482911 ?auto_2482918 ) ) ( not ( = ?auto_2482913 ?auto_2482918 ) ) ( ON_BOARD ?auto_2482919 ?auto_2482920 ) ( POWER_ON ?auto_2482919 ) ( not ( = ?auto_2482921 ?auto_2482919 ) ) ( HAVE_IMAGE ?auto_2482915 ?auto_2482914 ) ( HAVE_IMAGE ?auto_2482916 ?auto_2482917 ) ( not ( = ?auto_2482912 ?auto_2482914 ) ) ( not ( = ?auto_2482912 ?auto_2482917 ) ) ( not ( = ?auto_2482910 ?auto_2482914 ) ) ( not ( = ?auto_2482910 ?auto_2482917 ) ) ( not ( = ?auto_2482915 ?auto_2482922 ) ) ( not ( = ?auto_2482915 ?auto_2482918 ) ) ( not ( = ?auto_2482914 ?auto_2482917 ) ) ( not ( = ?auto_2482916 ?auto_2482922 ) ) ( not ( = ?auto_2482916 ?auto_2482918 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2482913 ?auto_2482910 ?auto_2482911 ?auto_2482912 )
      ( GET-4IMAGE-VERIFY ?auto_2482911 ?auto_2482912 ?auto_2482913 ?auto_2482910 ?auto_2482915 ?auto_2482914 ?auto_2482916 ?auto_2482917 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2485618 - DIRECTION
      ?auto_2485619 - MODE
      ?auto_2485620 - DIRECTION
      ?auto_2485617 - MODE
      ?auto_2485622 - DIRECTION
      ?auto_2485621 - MODE
      ?auto_2485623 - DIRECTION
      ?auto_2485624 - MODE
      ?auto_2485625 - DIRECTION
      ?auto_2485626 - MODE
    )
    :vars
    (
      ?auto_2485629 - INSTRUMENT
      ?auto_2485628 - SATELLITE
      ?auto_2485630 - DIRECTION
      ?auto_2485627 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2485620 ?auto_2485618 ) ) ( not ( = ?auto_2485622 ?auto_2485618 ) ) ( not ( = ?auto_2485622 ?auto_2485620 ) ) ( not ( = ?auto_2485623 ?auto_2485618 ) ) ( not ( = ?auto_2485623 ?auto_2485620 ) ) ( not ( = ?auto_2485623 ?auto_2485622 ) ) ( not ( = ?auto_2485625 ?auto_2485618 ) ) ( not ( = ?auto_2485625 ?auto_2485620 ) ) ( not ( = ?auto_2485625 ?auto_2485622 ) ) ( not ( = ?auto_2485625 ?auto_2485623 ) ) ( ON_BOARD ?auto_2485629 ?auto_2485628 ) ( SUPPORTS ?auto_2485629 ?auto_2485626 ) ( not ( = ?auto_2485625 ?auto_2485630 ) ) ( HAVE_IMAGE ?auto_2485618 ?auto_2485619 ) ( not ( = ?auto_2485618 ?auto_2485630 ) ) ( not ( = ?auto_2485619 ?auto_2485626 ) ) ( CALIBRATION_TARGET ?auto_2485629 ?auto_2485630 ) ( POINTING ?auto_2485628 ?auto_2485623 ) ( not ( = ?auto_2485630 ?auto_2485623 ) ) ( ON_BOARD ?auto_2485627 ?auto_2485628 ) ( POWER_ON ?auto_2485627 ) ( not ( = ?auto_2485629 ?auto_2485627 ) ) ( HAVE_IMAGE ?auto_2485620 ?auto_2485617 ) ( HAVE_IMAGE ?auto_2485622 ?auto_2485621 ) ( HAVE_IMAGE ?auto_2485623 ?auto_2485624 ) ( not ( = ?auto_2485619 ?auto_2485617 ) ) ( not ( = ?auto_2485619 ?auto_2485621 ) ) ( not ( = ?auto_2485619 ?auto_2485624 ) ) ( not ( = ?auto_2485620 ?auto_2485630 ) ) ( not ( = ?auto_2485617 ?auto_2485621 ) ) ( not ( = ?auto_2485617 ?auto_2485624 ) ) ( not ( = ?auto_2485617 ?auto_2485626 ) ) ( not ( = ?auto_2485622 ?auto_2485630 ) ) ( not ( = ?auto_2485621 ?auto_2485624 ) ) ( not ( = ?auto_2485621 ?auto_2485626 ) ) ( not ( = ?auto_2485624 ?auto_2485626 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2485618 ?auto_2485619 ?auto_2485625 ?auto_2485626 )
      ( GET-5IMAGE-VERIFY ?auto_2485618 ?auto_2485619 ?auto_2485620 ?auto_2485617 ?auto_2485622 ?auto_2485621 ?auto_2485623 ?auto_2485624 ?auto_2485625 ?auto_2485626 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2485677 - DIRECTION
      ?auto_2485678 - MODE
      ?auto_2485679 - DIRECTION
      ?auto_2485676 - MODE
      ?auto_2485681 - DIRECTION
      ?auto_2485680 - MODE
      ?auto_2485682 - DIRECTION
      ?auto_2485683 - MODE
      ?auto_2485684 - DIRECTION
      ?auto_2485685 - MODE
    )
    :vars
    (
      ?auto_2485688 - INSTRUMENT
      ?auto_2485687 - SATELLITE
      ?auto_2485689 - DIRECTION
      ?auto_2485686 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2485679 ?auto_2485677 ) ) ( not ( = ?auto_2485681 ?auto_2485677 ) ) ( not ( = ?auto_2485681 ?auto_2485679 ) ) ( not ( = ?auto_2485682 ?auto_2485677 ) ) ( not ( = ?auto_2485682 ?auto_2485679 ) ) ( not ( = ?auto_2485682 ?auto_2485681 ) ) ( not ( = ?auto_2485684 ?auto_2485677 ) ) ( not ( = ?auto_2485684 ?auto_2485679 ) ) ( not ( = ?auto_2485684 ?auto_2485681 ) ) ( not ( = ?auto_2485684 ?auto_2485682 ) ) ( ON_BOARD ?auto_2485688 ?auto_2485687 ) ( SUPPORTS ?auto_2485688 ?auto_2485683 ) ( not ( = ?auto_2485682 ?auto_2485689 ) ) ( HAVE_IMAGE ?auto_2485677 ?auto_2485678 ) ( not ( = ?auto_2485677 ?auto_2485689 ) ) ( not ( = ?auto_2485678 ?auto_2485683 ) ) ( CALIBRATION_TARGET ?auto_2485688 ?auto_2485689 ) ( POINTING ?auto_2485687 ?auto_2485684 ) ( not ( = ?auto_2485689 ?auto_2485684 ) ) ( ON_BOARD ?auto_2485686 ?auto_2485687 ) ( POWER_ON ?auto_2485686 ) ( not ( = ?auto_2485688 ?auto_2485686 ) ) ( HAVE_IMAGE ?auto_2485679 ?auto_2485676 ) ( HAVE_IMAGE ?auto_2485681 ?auto_2485680 ) ( HAVE_IMAGE ?auto_2485684 ?auto_2485685 ) ( not ( = ?auto_2485678 ?auto_2485676 ) ) ( not ( = ?auto_2485678 ?auto_2485680 ) ) ( not ( = ?auto_2485678 ?auto_2485685 ) ) ( not ( = ?auto_2485679 ?auto_2485689 ) ) ( not ( = ?auto_2485676 ?auto_2485680 ) ) ( not ( = ?auto_2485676 ?auto_2485683 ) ) ( not ( = ?auto_2485676 ?auto_2485685 ) ) ( not ( = ?auto_2485681 ?auto_2485689 ) ) ( not ( = ?auto_2485680 ?auto_2485683 ) ) ( not ( = ?auto_2485680 ?auto_2485685 ) ) ( not ( = ?auto_2485683 ?auto_2485685 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2485677 ?auto_2485678 ?auto_2485682 ?auto_2485683 )
      ( GET-5IMAGE-VERIFY ?auto_2485677 ?auto_2485678 ?auto_2485679 ?auto_2485676 ?auto_2485681 ?auto_2485680 ?auto_2485682 ?auto_2485683 ?auto_2485684 ?auto_2485685 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2485734 - DIRECTION
      ?auto_2485735 - MODE
      ?auto_2485736 - DIRECTION
      ?auto_2485733 - MODE
      ?auto_2485738 - DIRECTION
      ?auto_2485737 - MODE
      ?auto_2485739 - DIRECTION
      ?auto_2485740 - MODE
      ?auto_2485741 - DIRECTION
      ?auto_2485742 - MODE
    )
    :vars
    (
      ?auto_2485745 - INSTRUMENT
      ?auto_2485744 - SATELLITE
      ?auto_2485746 - DIRECTION
      ?auto_2485743 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2485736 ?auto_2485734 ) ) ( not ( = ?auto_2485738 ?auto_2485734 ) ) ( not ( = ?auto_2485738 ?auto_2485736 ) ) ( not ( = ?auto_2485739 ?auto_2485734 ) ) ( not ( = ?auto_2485739 ?auto_2485736 ) ) ( not ( = ?auto_2485739 ?auto_2485738 ) ) ( not ( = ?auto_2485741 ?auto_2485734 ) ) ( not ( = ?auto_2485741 ?auto_2485736 ) ) ( not ( = ?auto_2485741 ?auto_2485738 ) ) ( not ( = ?auto_2485741 ?auto_2485739 ) ) ( ON_BOARD ?auto_2485745 ?auto_2485744 ) ( SUPPORTS ?auto_2485745 ?auto_2485742 ) ( not ( = ?auto_2485741 ?auto_2485746 ) ) ( HAVE_IMAGE ?auto_2485734 ?auto_2485735 ) ( not ( = ?auto_2485734 ?auto_2485746 ) ) ( not ( = ?auto_2485735 ?auto_2485742 ) ) ( CALIBRATION_TARGET ?auto_2485745 ?auto_2485746 ) ( POINTING ?auto_2485744 ?auto_2485738 ) ( not ( = ?auto_2485746 ?auto_2485738 ) ) ( ON_BOARD ?auto_2485743 ?auto_2485744 ) ( POWER_ON ?auto_2485743 ) ( not ( = ?auto_2485745 ?auto_2485743 ) ) ( HAVE_IMAGE ?auto_2485736 ?auto_2485733 ) ( HAVE_IMAGE ?auto_2485738 ?auto_2485737 ) ( HAVE_IMAGE ?auto_2485739 ?auto_2485740 ) ( not ( = ?auto_2485735 ?auto_2485733 ) ) ( not ( = ?auto_2485735 ?auto_2485737 ) ) ( not ( = ?auto_2485735 ?auto_2485740 ) ) ( not ( = ?auto_2485736 ?auto_2485746 ) ) ( not ( = ?auto_2485733 ?auto_2485737 ) ) ( not ( = ?auto_2485733 ?auto_2485740 ) ) ( not ( = ?auto_2485733 ?auto_2485742 ) ) ( not ( = ?auto_2485737 ?auto_2485740 ) ) ( not ( = ?auto_2485737 ?auto_2485742 ) ) ( not ( = ?auto_2485739 ?auto_2485746 ) ) ( not ( = ?auto_2485740 ?auto_2485742 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2485734 ?auto_2485735 ?auto_2485741 ?auto_2485742 )
      ( GET-5IMAGE-VERIFY ?auto_2485734 ?auto_2485735 ?auto_2485736 ?auto_2485733 ?auto_2485738 ?auto_2485737 ?auto_2485739 ?auto_2485740 ?auto_2485741 ?auto_2485742 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2485790 - DIRECTION
      ?auto_2485791 - MODE
      ?auto_2485792 - DIRECTION
      ?auto_2485789 - MODE
      ?auto_2485794 - DIRECTION
      ?auto_2485793 - MODE
      ?auto_2485795 - DIRECTION
      ?auto_2485796 - MODE
      ?auto_2485797 - DIRECTION
      ?auto_2485798 - MODE
    )
    :vars
    (
      ?auto_2485801 - INSTRUMENT
      ?auto_2485800 - SATELLITE
      ?auto_2485802 - DIRECTION
      ?auto_2485799 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2485792 ?auto_2485790 ) ) ( not ( = ?auto_2485794 ?auto_2485790 ) ) ( not ( = ?auto_2485794 ?auto_2485792 ) ) ( not ( = ?auto_2485795 ?auto_2485790 ) ) ( not ( = ?auto_2485795 ?auto_2485792 ) ) ( not ( = ?auto_2485795 ?auto_2485794 ) ) ( not ( = ?auto_2485797 ?auto_2485790 ) ) ( not ( = ?auto_2485797 ?auto_2485792 ) ) ( not ( = ?auto_2485797 ?auto_2485794 ) ) ( not ( = ?auto_2485797 ?auto_2485795 ) ) ( ON_BOARD ?auto_2485801 ?auto_2485800 ) ( SUPPORTS ?auto_2485801 ?auto_2485796 ) ( not ( = ?auto_2485795 ?auto_2485802 ) ) ( HAVE_IMAGE ?auto_2485790 ?auto_2485791 ) ( not ( = ?auto_2485790 ?auto_2485802 ) ) ( not ( = ?auto_2485791 ?auto_2485796 ) ) ( CALIBRATION_TARGET ?auto_2485801 ?auto_2485802 ) ( POINTING ?auto_2485800 ?auto_2485794 ) ( not ( = ?auto_2485802 ?auto_2485794 ) ) ( ON_BOARD ?auto_2485799 ?auto_2485800 ) ( POWER_ON ?auto_2485799 ) ( not ( = ?auto_2485801 ?auto_2485799 ) ) ( HAVE_IMAGE ?auto_2485792 ?auto_2485789 ) ( HAVE_IMAGE ?auto_2485794 ?auto_2485793 ) ( HAVE_IMAGE ?auto_2485797 ?auto_2485798 ) ( not ( = ?auto_2485791 ?auto_2485789 ) ) ( not ( = ?auto_2485791 ?auto_2485793 ) ) ( not ( = ?auto_2485791 ?auto_2485798 ) ) ( not ( = ?auto_2485792 ?auto_2485802 ) ) ( not ( = ?auto_2485789 ?auto_2485793 ) ) ( not ( = ?auto_2485789 ?auto_2485796 ) ) ( not ( = ?auto_2485789 ?auto_2485798 ) ) ( not ( = ?auto_2485793 ?auto_2485796 ) ) ( not ( = ?auto_2485793 ?auto_2485798 ) ) ( not ( = ?auto_2485796 ?auto_2485798 ) ) ( not ( = ?auto_2485797 ?auto_2485802 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2485790 ?auto_2485791 ?auto_2485795 ?auto_2485796 )
      ( GET-5IMAGE-VERIFY ?auto_2485790 ?auto_2485791 ?auto_2485792 ?auto_2485789 ?auto_2485794 ?auto_2485793 ?auto_2485795 ?auto_2485796 ?auto_2485797 ?auto_2485798 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2486025 - DIRECTION
      ?auto_2486026 - MODE
      ?auto_2486027 - DIRECTION
      ?auto_2486024 - MODE
      ?auto_2486029 - DIRECTION
      ?auto_2486028 - MODE
      ?auto_2486030 - DIRECTION
      ?auto_2486031 - MODE
      ?auto_2486032 - DIRECTION
      ?auto_2486033 - MODE
    )
    :vars
    (
      ?auto_2486036 - INSTRUMENT
      ?auto_2486035 - SATELLITE
      ?auto_2486037 - DIRECTION
      ?auto_2486034 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2486027 ?auto_2486025 ) ) ( not ( = ?auto_2486029 ?auto_2486025 ) ) ( not ( = ?auto_2486029 ?auto_2486027 ) ) ( not ( = ?auto_2486030 ?auto_2486025 ) ) ( not ( = ?auto_2486030 ?auto_2486027 ) ) ( not ( = ?auto_2486030 ?auto_2486029 ) ) ( not ( = ?auto_2486032 ?auto_2486025 ) ) ( not ( = ?auto_2486032 ?auto_2486027 ) ) ( not ( = ?auto_2486032 ?auto_2486029 ) ) ( not ( = ?auto_2486032 ?auto_2486030 ) ) ( ON_BOARD ?auto_2486036 ?auto_2486035 ) ( SUPPORTS ?auto_2486036 ?auto_2486028 ) ( not ( = ?auto_2486029 ?auto_2486037 ) ) ( HAVE_IMAGE ?auto_2486025 ?auto_2486026 ) ( not ( = ?auto_2486025 ?auto_2486037 ) ) ( not ( = ?auto_2486026 ?auto_2486028 ) ) ( CALIBRATION_TARGET ?auto_2486036 ?auto_2486037 ) ( POINTING ?auto_2486035 ?auto_2486032 ) ( not ( = ?auto_2486037 ?auto_2486032 ) ) ( ON_BOARD ?auto_2486034 ?auto_2486035 ) ( POWER_ON ?auto_2486034 ) ( not ( = ?auto_2486036 ?auto_2486034 ) ) ( HAVE_IMAGE ?auto_2486027 ?auto_2486024 ) ( HAVE_IMAGE ?auto_2486030 ?auto_2486031 ) ( HAVE_IMAGE ?auto_2486032 ?auto_2486033 ) ( not ( = ?auto_2486026 ?auto_2486024 ) ) ( not ( = ?auto_2486026 ?auto_2486031 ) ) ( not ( = ?auto_2486026 ?auto_2486033 ) ) ( not ( = ?auto_2486027 ?auto_2486037 ) ) ( not ( = ?auto_2486024 ?auto_2486028 ) ) ( not ( = ?auto_2486024 ?auto_2486031 ) ) ( not ( = ?auto_2486024 ?auto_2486033 ) ) ( not ( = ?auto_2486028 ?auto_2486031 ) ) ( not ( = ?auto_2486028 ?auto_2486033 ) ) ( not ( = ?auto_2486030 ?auto_2486037 ) ) ( not ( = ?auto_2486031 ?auto_2486033 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2486025 ?auto_2486026 ?auto_2486029 ?auto_2486028 )
      ( GET-5IMAGE-VERIFY ?auto_2486025 ?auto_2486026 ?auto_2486027 ?auto_2486024 ?auto_2486029 ?auto_2486028 ?auto_2486030 ?auto_2486031 ?auto_2486032 ?auto_2486033 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2486082 - DIRECTION
      ?auto_2486083 - MODE
      ?auto_2486084 - DIRECTION
      ?auto_2486081 - MODE
      ?auto_2486086 - DIRECTION
      ?auto_2486085 - MODE
      ?auto_2486087 - DIRECTION
      ?auto_2486088 - MODE
      ?auto_2486089 - DIRECTION
      ?auto_2486090 - MODE
    )
    :vars
    (
      ?auto_2486093 - INSTRUMENT
      ?auto_2486092 - SATELLITE
      ?auto_2486094 - DIRECTION
      ?auto_2486091 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2486084 ?auto_2486082 ) ) ( not ( = ?auto_2486086 ?auto_2486082 ) ) ( not ( = ?auto_2486086 ?auto_2486084 ) ) ( not ( = ?auto_2486087 ?auto_2486082 ) ) ( not ( = ?auto_2486087 ?auto_2486084 ) ) ( not ( = ?auto_2486087 ?auto_2486086 ) ) ( not ( = ?auto_2486089 ?auto_2486082 ) ) ( not ( = ?auto_2486089 ?auto_2486084 ) ) ( not ( = ?auto_2486089 ?auto_2486086 ) ) ( not ( = ?auto_2486089 ?auto_2486087 ) ) ( ON_BOARD ?auto_2486093 ?auto_2486092 ) ( SUPPORTS ?auto_2486093 ?auto_2486085 ) ( not ( = ?auto_2486086 ?auto_2486094 ) ) ( HAVE_IMAGE ?auto_2486082 ?auto_2486083 ) ( not ( = ?auto_2486082 ?auto_2486094 ) ) ( not ( = ?auto_2486083 ?auto_2486085 ) ) ( CALIBRATION_TARGET ?auto_2486093 ?auto_2486094 ) ( POINTING ?auto_2486092 ?auto_2486087 ) ( not ( = ?auto_2486094 ?auto_2486087 ) ) ( ON_BOARD ?auto_2486091 ?auto_2486092 ) ( POWER_ON ?auto_2486091 ) ( not ( = ?auto_2486093 ?auto_2486091 ) ) ( HAVE_IMAGE ?auto_2486084 ?auto_2486081 ) ( HAVE_IMAGE ?auto_2486087 ?auto_2486088 ) ( HAVE_IMAGE ?auto_2486089 ?auto_2486090 ) ( not ( = ?auto_2486083 ?auto_2486081 ) ) ( not ( = ?auto_2486083 ?auto_2486088 ) ) ( not ( = ?auto_2486083 ?auto_2486090 ) ) ( not ( = ?auto_2486084 ?auto_2486094 ) ) ( not ( = ?auto_2486081 ?auto_2486085 ) ) ( not ( = ?auto_2486081 ?auto_2486088 ) ) ( not ( = ?auto_2486081 ?auto_2486090 ) ) ( not ( = ?auto_2486085 ?auto_2486088 ) ) ( not ( = ?auto_2486085 ?auto_2486090 ) ) ( not ( = ?auto_2486088 ?auto_2486090 ) ) ( not ( = ?auto_2486089 ?auto_2486094 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2486082 ?auto_2486083 ?auto_2486086 ?auto_2486085 )
      ( GET-5IMAGE-VERIFY ?auto_2486082 ?auto_2486083 ?auto_2486084 ?auto_2486081 ?auto_2486086 ?auto_2486085 ?auto_2486087 ?auto_2486088 ?auto_2486089 ?auto_2486090 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2487219 - DIRECTION
      ?auto_2487220 - MODE
      ?auto_2487221 - DIRECTION
      ?auto_2487218 - MODE
      ?auto_2487223 - DIRECTION
      ?auto_2487222 - MODE
      ?auto_2487224 - DIRECTION
      ?auto_2487225 - MODE
      ?auto_2487226 - DIRECTION
      ?auto_2487227 - MODE
    )
    :vars
    (
      ?auto_2487230 - INSTRUMENT
      ?auto_2487229 - SATELLITE
      ?auto_2487231 - DIRECTION
      ?auto_2487228 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2487221 ?auto_2487219 ) ) ( not ( = ?auto_2487223 ?auto_2487219 ) ) ( not ( = ?auto_2487223 ?auto_2487221 ) ) ( not ( = ?auto_2487224 ?auto_2487219 ) ) ( not ( = ?auto_2487224 ?auto_2487221 ) ) ( not ( = ?auto_2487224 ?auto_2487223 ) ) ( not ( = ?auto_2487226 ?auto_2487219 ) ) ( not ( = ?auto_2487226 ?auto_2487221 ) ) ( not ( = ?auto_2487226 ?auto_2487223 ) ) ( not ( = ?auto_2487226 ?auto_2487224 ) ) ( ON_BOARD ?auto_2487230 ?auto_2487229 ) ( SUPPORTS ?auto_2487230 ?auto_2487227 ) ( not ( = ?auto_2487226 ?auto_2487231 ) ) ( HAVE_IMAGE ?auto_2487219 ?auto_2487220 ) ( not ( = ?auto_2487219 ?auto_2487231 ) ) ( not ( = ?auto_2487220 ?auto_2487227 ) ) ( CALIBRATION_TARGET ?auto_2487230 ?auto_2487231 ) ( POINTING ?auto_2487229 ?auto_2487221 ) ( not ( = ?auto_2487231 ?auto_2487221 ) ) ( ON_BOARD ?auto_2487228 ?auto_2487229 ) ( POWER_ON ?auto_2487228 ) ( not ( = ?auto_2487230 ?auto_2487228 ) ) ( HAVE_IMAGE ?auto_2487221 ?auto_2487218 ) ( HAVE_IMAGE ?auto_2487223 ?auto_2487222 ) ( HAVE_IMAGE ?auto_2487224 ?auto_2487225 ) ( not ( = ?auto_2487220 ?auto_2487218 ) ) ( not ( = ?auto_2487220 ?auto_2487222 ) ) ( not ( = ?auto_2487220 ?auto_2487225 ) ) ( not ( = ?auto_2487218 ?auto_2487222 ) ) ( not ( = ?auto_2487218 ?auto_2487225 ) ) ( not ( = ?auto_2487218 ?auto_2487227 ) ) ( not ( = ?auto_2487223 ?auto_2487231 ) ) ( not ( = ?auto_2487222 ?auto_2487225 ) ) ( not ( = ?auto_2487222 ?auto_2487227 ) ) ( not ( = ?auto_2487224 ?auto_2487231 ) ) ( not ( = ?auto_2487225 ?auto_2487227 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2487219 ?auto_2487220 ?auto_2487226 ?auto_2487227 )
      ( GET-5IMAGE-VERIFY ?auto_2487219 ?auto_2487220 ?auto_2487221 ?auto_2487218 ?auto_2487223 ?auto_2487222 ?auto_2487224 ?auto_2487225 ?auto_2487226 ?auto_2487227 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2487275 - DIRECTION
      ?auto_2487276 - MODE
      ?auto_2487277 - DIRECTION
      ?auto_2487274 - MODE
      ?auto_2487279 - DIRECTION
      ?auto_2487278 - MODE
      ?auto_2487280 - DIRECTION
      ?auto_2487281 - MODE
      ?auto_2487282 - DIRECTION
      ?auto_2487283 - MODE
    )
    :vars
    (
      ?auto_2487286 - INSTRUMENT
      ?auto_2487285 - SATELLITE
      ?auto_2487287 - DIRECTION
      ?auto_2487284 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2487277 ?auto_2487275 ) ) ( not ( = ?auto_2487279 ?auto_2487275 ) ) ( not ( = ?auto_2487279 ?auto_2487277 ) ) ( not ( = ?auto_2487280 ?auto_2487275 ) ) ( not ( = ?auto_2487280 ?auto_2487277 ) ) ( not ( = ?auto_2487280 ?auto_2487279 ) ) ( not ( = ?auto_2487282 ?auto_2487275 ) ) ( not ( = ?auto_2487282 ?auto_2487277 ) ) ( not ( = ?auto_2487282 ?auto_2487279 ) ) ( not ( = ?auto_2487282 ?auto_2487280 ) ) ( ON_BOARD ?auto_2487286 ?auto_2487285 ) ( SUPPORTS ?auto_2487286 ?auto_2487281 ) ( not ( = ?auto_2487280 ?auto_2487287 ) ) ( HAVE_IMAGE ?auto_2487275 ?auto_2487276 ) ( not ( = ?auto_2487275 ?auto_2487287 ) ) ( not ( = ?auto_2487276 ?auto_2487281 ) ) ( CALIBRATION_TARGET ?auto_2487286 ?auto_2487287 ) ( POINTING ?auto_2487285 ?auto_2487277 ) ( not ( = ?auto_2487287 ?auto_2487277 ) ) ( ON_BOARD ?auto_2487284 ?auto_2487285 ) ( POWER_ON ?auto_2487284 ) ( not ( = ?auto_2487286 ?auto_2487284 ) ) ( HAVE_IMAGE ?auto_2487277 ?auto_2487274 ) ( HAVE_IMAGE ?auto_2487279 ?auto_2487278 ) ( HAVE_IMAGE ?auto_2487282 ?auto_2487283 ) ( not ( = ?auto_2487276 ?auto_2487274 ) ) ( not ( = ?auto_2487276 ?auto_2487278 ) ) ( not ( = ?auto_2487276 ?auto_2487283 ) ) ( not ( = ?auto_2487274 ?auto_2487278 ) ) ( not ( = ?auto_2487274 ?auto_2487281 ) ) ( not ( = ?auto_2487274 ?auto_2487283 ) ) ( not ( = ?auto_2487279 ?auto_2487287 ) ) ( not ( = ?auto_2487278 ?auto_2487281 ) ) ( not ( = ?auto_2487278 ?auto_2487283 ) ) ( not ( = ?auto_2487281 ?auto_2487283 ) ) ( not ( = ?auto_2487282 ?auto_2487287 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2487275 ?auto_2487276 ?auto_2487280 ?auto_2487281 )
      ( GET-5IMAGE-VERIFY ?auto_2487275 ?auto_2487276 ?auto_2487277 ?auto_2487274 ?auto_2487279 ?auto_2487278 ?auto_2487280 ?auto_2487281 ?auto_2487282 ?auto_2487283 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2487659 - DIRECTION
      ?auto_2487660 - MODE
      ?auto_2487661 - DIRECTION
      ?auto_2487658 - MODE
      ?auto_2487663 - DIRECTION
      ?auto_2487662 - MODE
      ?auto_2487664 - DIRECTION
      ?auto_2487665 - MODE
      ?auto_2487666 - DIRECTION
      ?auto_2487667 - MODE
    )
    :vars
    (
      ?auto_2487670 - INSTRUMENT
      ?auto_2487669 - SATELLITE
      ?auto_2487671 - DIRECTION
      ?auto_2487668 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2487661 ?auto_2487659 ) ) ( not ( = ?auto_2487663 ?auto_2487659 ) ) ( not ( = ?auto_2487663 ?auto_2487661 ) ) ( not ( = ?auto_2487664 ?auto_2487659 ) ) ( not ( = ?auto_2487664 ?auto_2487661 ) ) ( not ( = ?auto_2487664 ?auto_2487663 ) ) ( not ( = ?auto_2487666 ?auto_2487659 ) ) ( not ( = ?auto_2487666 ?auto_2487661 ) ) ( not ( = ?auto_2487666 ?auto_2487663 ) ) ( not ( = ?auto_2487666 ?auto_2487664 ) ) ( ON_BOARD ?auto_2487670 ?auto_2487669 ) ( SUPPORTS ?auto_2487670 ?auto_2487662 ) ( not ( = ?auto_2487663 ?auto_2487671 ) ) ( HAVE_IMAGE ?auto_2487659 ?auto_2487660 ) ( not ( = ?auto_2487659 ?auto_2487671 ) ) ( not ( = ?auto_2487660 ?auto_2487662 ) ) ( CALIBRATION_TARGET ?auto_2487670 ?auto_2487671 ) ( POINTING ?auto_2487669 ?auto_2487661 ) ( not ( = ?auto_2487671 ?auto_2487661 ) ) ( ON_BOARD ?auto_2487668 ?auto_2487669 ) ( POWER_ON ?auto_2487668 ) ( not ( = ?auto_2487670 ?auto_2487668 ) ) ( HAVE_IMAGE ?auto_2487661 ?auto_2487658 ) ( HAVE_IMAGE ?auto_2487664 ?auto_2487665 ) ( HAVE_IMAGE ?auto_2487666 ?auto_2487667 ) ( not ( = ?auto_2487660 ?auto_2487658 ) ) ( not ( = ?auto_2487660 ?auto_2487665 ) ) ( not ( = ?auto_2487660 ?auto_2487667 ) ) ( not ( = ?auto_2487658 ?auto_2487662 ) ) ( not ( = ?auto_2487658 ?auto_2487665 ) ) ( not ( = ?auto_2487658 ?auto_2487667 ) ) ( not ( = ?auto_2487662 ?auto_2487665 ) ) ( not ( = ?auto_2487662 ?auto_2487667 ) ) ( not ( = ?auto_2487664 ?auto_2487671 ) ) ( not ( = ?auto_2487665 ?auto_2487667 ) ) ( not ( = ?auto_2487666 ?auto_2487671 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2487659 ?auto_2487660 ?auto_2487663 ?auto_2487662 )
      ( GET-5IMAGE-VERIFY ?auto_2487659 ?auto_2487660 ?auto_2487661 ?auto_2487658 ?auto_2487663 ?auto_2487662 ?auto_2487664 ?auto_2487665 ?auto_2487666 ?auto_2487667 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2488466 - DIRECTION
      ?auto_2488467 - MODE
      ?auto_2488468 - DIRECTION
      ?auto_2488465 - MODE
      ?auto_2488470 - DIRECTION
      ?auto_2488469 - MODE
      ?auto_2488471 - DIRECTION
      ?auto_2488472 - MODE
      ?auto_2488473 - DIRECTION
      ?auto_2488474 - MODE
    )
    :vars
    (
      ?auto_2488477 - INSTRUMENT
      ?auto_2488476 - SATELLITE
      ?auto_2488478 - DIRECTION
      ?auto_2488475 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2488468 ?auto_2488466 ) ) ( not ( = ?auto_2488470 ?auto_2488466 ) ) ( not ( = ?auto_2488470 ?auto_2488468 ) ) ( not ( = ?auto_2488471 ?auto_2488466 ) ) ( not ( = ?auto_2488471 ?auto_2488468 ) ) ( not ( = ?auto_2488471 ?auto_2488470 ) ) ( not ( = ?auto_2488473 ?auto_2488466 ) ) ( not ( = ?auto_2488473 ?auto_2488468 ) ) ( not ( = ?auto_2488473 ?auto_2488470 ) ) ( not ( = ?auto_2488473 ?auto_2488471 ) ) ( ON_BOARD ?auto_2488477 ?auto_2488476 ) ( SUPPORTS ?auto_2488477 ?auto_2488465 ) ( not ( = ?auto_2488468 ?auto_2488478 ) ) ( HAVE_IMAGE ?auto_2488466 ?auto_2488467 ) ( not ( = ?auto_2488466 ?auto_2488478 ) ) ( not ( = ?auto_2488467 ?auto_2488465 ) ) ( CALIBRATION_TARGET ?auto_2488477 ?auto_2488478 ) ( POINTING ?auto_2488476 ?auto_2488473 ) ( not ( = ?auto_2488478 ?auto_2488473 ) ) ( ON_BOARD ?auto_2488475 ?auto_2488476 ) ( POWER_ON ?auto_2488475 ) ( not ( = ?auto_2488477 ?auto_2488475 ) ) ( HAVE_IMAGE ?auto_2488470 ?auto_2488469 ) ( HAVE_IMAGE ?auto_2488471 ?auto_2488472 ) ( HAVE_IMAGE ?auto_2488473 ?auto_2488474 ) ( not ( = ?auto_2488467 ?auto_2488469 ) ) ( not ( = ?auto_2488467 ?auto_2488472 ) ) ( not ( = ?auto_2488467 ?auto_2488474 ) ) ( not ( = ?auto_2488465 ?auto_2488469 ) ) ( not ( = ?auto_2488465 ?auto_2488472 ) ) ( not ( = ?auto_2488465 ?auto_2488474 ) ) ( not ( = ?auto_2488470 ?auto_2488478 ) ) ( not ( = ?auto_2488469 ?auto_2488472 ) ) ( not ( = ?auto_2488469 ?auto_2488474 ) ) ( not ( = ?auto_2488471 ?auto_2488478 ) ) ( not ( = ?auto_2488472 ?auto_2488474 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2488466 ?auto_2488467 ?auto_2488468 ?auto_2488465 )
      ( GET-5IMAGE-VERIFY ?auto_2488466 ?auto_2488467 ?auto_2488468 ?auto_2488465 ?auto_2488470 ?auto_2488469 ?auto_2488471 ?auto_2488472 ?auto_2488473 ?auto_2488474 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2488523 - DIRECTION
      ?auto_2488524 - MODE
      ?auto_2488525 - DIRECTION
      ?auto_2488522 - MODE
      ?auto_2488527 - DIRECTION
      ?auto_2488526 - MODE
      ?auto_2488528 - DIRECTION
      ?auto_2488529 - MODE
      ?auto_2488530 - DIRECTION
      ?auto_2488531 - MODE
    )
    :vars
    (
      ?auto_2488534 - INSTRUMENT
      ?auto_2488533 - SATELLITE
      ?auto_2488535 - DIRECTION
      ?auto_2488532 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2488525 ?auto_2488523 ) ) ( not ( = ?auto_2488527 ?auto_2488523 ) ) ( not ( = ?auto_2488527 ?auto_2488525 ) ) ( not ( = ?auto_2488528 ?auto_2488523 ) ) ( not ( = ?auto_2488528 ?auto_2488525 ) ) ( not ( = ?auto_2488528 ?auto_2488527 ) ) ( not ( = ?auto_2488530 ?auto_2488523 ) ) ( not ( = ?auto_2488530 ?auto_2488525 ) ) ( not ( = ?auto_2488530 ?auto_2488527 ) ) ( not ( = ?auto_2488530 ?auto_2488528 ) ) ( ON_BOARD ?auto_2488534 ?auto_2488533 ) ( SUPPORTS ?auto_2488534 ?auto_2488522 ) ( not ( = ?auto_2488525 ?auto_2488535 ) ) ( HAVE_IMAGE ?auto_2488523 ?auto_2488524 ) ( not ( = ?auto_2488523 ?auto_2488535 ) ) ( not ( = ?auto_2488524 ?auto_2488522 ) ) ( CALIBRATION_TARGET ?auto_2488534 ?auto_2488535 ) ( POINTING ?auto_2488533 ?auto_2488528 ) ( not ( = ?auto_2488535 ?auto_2488528 ) ) ( ON_BOARD ?auto_2488532 ?auto_2488533 ) ( POWER_ON ?auto_2488532 ) ( not ( = ?auto_2488534 ?auto_2488532 ) ) ( HAVE_IMAGE ?auto_2488527 ?auto_2488526 ) ( HAVE_IMAGE ?auto_2488528 ?auto_2488529 ) ( HAVE_IMAGE ?auto_2488530 ?auto_2488531 ) ( not ( = ?auto_2488524 ?auto_2488526 ) ) ( not ( = ?auto_2488524 ?auto_2488529 ) ) ( not ( = ?auto_2488524 ?auto_2488531 ) ) ( not ( = ?auto_2488522 ?auto_2488526 ) ) ( not ( = ?auto_2488522 ?auto_2488529 ) ) ( not ( = ?auto_2488522 ?auto_2488531 ) ) ( not ( = ?auto_2488527 ?auto_2488535 ) ) ( not ( = ?auto_2488526 ?auto_2488529 ) ) ( not ( = ?auto_2488526 ?auto_2488531 ) ) ( not ( = ?auto_2488529 ?auto_2488531 ) ) ( not ( = ?auto_2488530 ?auto_2488535 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2488523 ?auto_2488524 ?auto_2488525 ?auto_2488522 )
      ( GET-5IMAGE-VERIFY ?auto_2488523 ?auto_2488524 ?auto_2488525 ?auto_2488522 ?auto_2488527 ?auto_2488526 ?auto_2488528 ?auto_2488529 ?auto_2488530 ?auto_2488531 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2489095 - DIRECTION
      ?auto_2489096 - MODE
      ?auto_2489097 - DIRECTION
      ?auto_2489094 - MODE
      ?auto_2489099 - DIRECTION
      ?auto_2489098 - MODE
      ?auto_2489100 - DIRECTION
      ?auto_2489101 - MODE
      ?auto_2489102 - DIRECTION
      ?auto_2489103 - MODE
    )
    :vars
    (
      ?auto_2489106 - INSTRUMENT
      ?auto_2489105 - SATELLITE
      ?auto_2489107 - DIRECTION
      ?auto_2489104 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2489097 ?auto_2489095 ) ) ( not ( = ?auto_2489099 ?auto_2489095 ) ) ( not ( = ?auto_2489099 ?auto_2489097 ) ) ( not ( = ?auto_2489100 ?auto_2489095 ) ) ( not ( = ?auto_2489100 ?auto_2489097 ) ) ( not ( = ?auto_2489100 ?auto_2489099 ) ) ( not ( = ?auto_2489102 ?auto_2489095 ) ) ( not ( = ?auto_2489102 ?auto_2489097 ) ) ( not ( = ?auto_2489102 ?auto_2489099 ) ) ( not ( = ?auto_2489102 ?auto_2489100 ) ) ( ON_BOARD ?auto_2489106 ?auto_2489105 ) ( SUPPORTS ?auto_2489106 ?auto_2489094 ) ( not ( = ?auto_2489097 ?auto_2489107 ) ) ( HAVE_IMAGE ?auto_2489095 ?auto_2489096 ) ( not ( = ?auto_2489095 ?auto_2489107 ) ) ( not ( = ?auto_2489096 ?auto_2489094 ) ) ( CALIBRATION_TARGET ?auto_2489106 ?auto_2489107 ) ( POINTING ?auto_2489105 ?auto_2489099 ) ( not ( = ?auto_2489107 ?auto_2489099 ) ) ( ON_BOARD ?auto_2489104 ?auto_2489105 ) ( POWER_ON ?auto_2489104 ) ( not ( = ?auto_2489106 ?auto_2489104 ) ) ( HAVE_IMAGE ?auto_2489099 ?auto_2489098 ) ( HAVE_IMAGE ?auto_2489100 ?auto_2489101 ) ( HAVE_IMAGE ?auto_2489102 ?auto_2489103 ) ( not ( = ?auto_2489096 ?auto_2489098 ) ) ( not ( = ?auto_2489096 ?auto_2489101 ) ) ( not ( = ?auto_2489096 ?auto_2489103 ) ) ( not ( = ?auto_2489094 ?auto_2489098 ) ) ( not ( = ?auto_2489094 ?auto_2489101 ) ) ( not ( = ?auto_2489094 ?auto_2489103 ) ) ( not ( = ?auto_2489098 ?auto_2489101 ) ) ( not ( = ?auto_2489098 ?auto_2489103 ) ) ( not ( = ?auto_2489100 ?auto_2489107 ) ) ( not ( = ?auto_2489101 ?auto_2489103 ) ) ( not ( = ?auto_2489102 ?auto_2489107 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2489095 ?auto_2489096 ?auto_2489097 ?auto_2489094 )
      ( GET-5IMAGE-VERIFY ?auto_2489095 ?auto_2489096 ?auto_2489097 ?auto_2489094 ?auto_2489099 ?auto_2489098 ?auto_2489100 ?auto_2489101 ?auto_2489102 ?auto_2489103 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2501053 - DIRECTION
      ?auto_2501054 - MODE
      ?auto_2501055 - DIRECTION
      ?auto_2501052 - MODE
      ?auto_2501057 - DIRECTION
      ?auto_2501056 - MODE
      ?auto_2501058 - DIRECTION
      ?auto_2501059 - MODE
      ?auto_2501060 - DIRECTION
      ?auto_2501061 - MODE
    )
    :vars
    (
      ?auto_2501064 - INSTRUMENT
      ?auto_2501063 - SATELLITE
      ?auto_2501065 - DIRECTION
      ?auto_2501062 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2501055 ?auto_2501053 ) ) ( not ( = ?auto_2501057 ?auto_2501053 ) ) ( not ( = ?auto_2501057 ?auto_2501055 ) ) ( not ( = ?auto_2501058 ?auto_2501053 ) ) ( not ( = ?auto_2501058 ?auto_2501055 ) ) ( not ( = ?auto_2501058 ?auto_2501057 ) ) ( not ( = ?auto_2501060 ?auto_2501053 ) ) ( not ( = ?auto_2501060 ?auto_2501055 ) ) ( not ( = ?auto_2501060 ?auto_2501057 ) ) ( not ( = ?auto_2501060 ?auto_2501058 ) ) ( ON_BOARD ?auto_2501064 ?auto_2501063 ) ( SUPPORTS ?auto_2501064 ?auto_2501061 ) ( not ( = ?auto_2501060 ?auto_2501065 ) ) ( HAVE_IMAGE ?auto_2501055 ?auto_2501052 ) ( not ( = ?auto_2501055 ?auto_2501065 ) ) ( not ( = ?auto_2501052 ?auto_2501061 ) ) ( CALIBRATION_TARGET ?auto_2501064 ?auto_2501065 ) ( POINTING ?auto_2501063 ?auto_2501053 ) ( not ( = ?auto_2501065 ?auto_2501053 ) ) ( ON_BOARD ?auto_2501062 ?auto_2501063 ) ( POWER_ON ?auto_2501062 ) ( not ( = ?auto_2501064 ?auto_2501062 ) ) ( HAVE_IMAGE ?auto_2501053 ?auto_2501054 ) ( HAVE_IMAGE ?auto_2501057 ?auto_2501056 ) ( HAVE_IMAGE ?auto_2501058 ?auto_2501059 ) ( not ( = ?auto_2501054 ?auto_2501052 ) ) ( not ( = ?auto_2501054 ?auto_2501056 ) ) ( not ( = ?auto_2501054 ?auto_2501059 ) ) ( not ( = ?auto_2501054 ?auto_2501061 ) ) ( not ( = ?auto_2501052 ?auto_2501056 ) ) ( not ( = ?auto_2501052 ?auto_2501059 ) ) ( not ( = ?auto_2501057 ?auto_2501065 ) ) ( not ( = ?auto_2501056 ?auto_2501059 ) ) ( not ( = ?auto_2501056 ?auto_2501061 ) ) ( not ( = ?auto_2501058 ?auto_2501065 ) ) ( not ( = ?auto_2501059 ?auto_2501061 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2501055 ?auto_2501052 ?auto_2501060 ?auto_2501061 )
      ( GET-5IMAGE-VERIFY ?auto_2501053 ?auto_2501054 ?auto_2501055 ?auto_2501052 ?auto_2501057 ?auto_2501056 ?auto_2501058 ?auto_2501059 ?auto_2501060 ?auto_2501061 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2501109 - DIRECTION
      ?auto_2501110 - MODE
      ?auto_2501111 - DIRECTION
      ?auto_2501108 - MODE
      ?auto_2501113 - DIRECTION
      ?auto_2501112 - MODE
      ?auto_2501114 - DIRECTION
      ?auto_2501115 - MODE
      ?auto_2501116 - DIRECTION
      ?auto_2501117 - MODE
    )
    :vars
    (
      ?auto_2501120 - INSTRUMENT
      ?auto_2501119 - SATELLITE
      ?auto_2501121 - DIRECTION
      ?auto_2501118 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2501111 ?auto_2501109 ) ) ( not ( = ?auto_2501113 ?auto_2501109 ) ) ( not ( = ?auto_2501113 ?auto_2501111 ) ) ( not ( = ?auto_2501114 ?auto_2501109 ) ) ( not ( = ?auto_2501114 ?auto_2501111 ) ) ( not ( = ?auto_2501114 ?auto_2501113 ) ) ( not ( = ?auto_2501116 ?auto_2501109 ) ) ( not ( = ?auto_2501116 ?auto_2501111 ) ) ( not ( = ?auto_2501116 ?auto_2501113 ) ) ( not ( = ?auto_2501116 ?auto_2501114 ) ) ( ON_BOARD ?auto_2501120 ?auto_2501119 ) ( SUPPORTS ?auto_2501120 ?auto_2501115 ) ( not ( = ?auto_2501114 ?auto_2501121 ) ) ( HAVE_IMAGE ?auto_2501111 ?auto_2501108 ) ( not ( = ?auto_2501111 ?auto_2501121 ) ) ( not ( = ?auto_2501108 ?auto_2501115 ) ) ( CALIBRATION_TARGET ?auto_2501120 ?auto_2501121 ) ( POINTING ?auto_2501119 ?auto_2501109 ) ( not ( = ?auto_2501121 ?auto_2501109 ) ) ( ON_BOARD ?auto_2501118 ?auto_2501119 ) ( POWER_ON ?auto_2501118 ) ( not ( = ?auto_2501120 ?auto_2501118 ) ) ( HAVE_IMAGE ?auto_2501109 ?auto_2501110 ) ( HAVE_IMAGE ?auto_2501113 ?auto_2501112 ) ( HAVE_IMAGE ?auto_2501116 ?auto_2501117 ) ( not ( = ?auto_2501110 ?auto_2501108 ) ) ( not ( = ?auto_2501110 ?auto_2501112 ) ) ( not ( = ?auto_2501110 ?auto_2501115 ) ) ( not ( = ?auto_2501110 ?auto_2501117 ) ) ( not ( = ?auto_2501108 ?auto_2501112 ) ) ( not ( = ?auto_2501108 ?auto_2501117 ) ) ( not ( = ?auto_2501113 ?auto_2501121 ) ) ( not ( = ?auto_2501112 ?auto_2501115 ) ) ( not ( = ?auto_2501112 ?auto_2501117 ) ) ( not ( = ?auto_2501115 ?auto_2501117 ) ) ( not ( = ?auto_2501116 ?auto_2501121 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2501111 ?auto_2501108 ?auto_2501114 ?auto_2501115 )
      ( GET-5IMAGE-VERIFY ?auto_2501109 ?auto_2501110 ?auto_2501111 ?auto_2501108 ?auto_2501113 ?auto_2501112 ?auto_2501114 ?auto_2501115 ?auto_2501116 ?auto_2501117 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2501493 - DIRECTION
      ?auto_2501494 - MODE
      ?auto_2501495 - DIRECTION
      ?auto_2501492 - MODE
      ?auto_2501497 - DIRECTION
      ?auto_2501496 - MODE
      ?auto_2501498 - DIRECTION
      ?auto_2501499 - MODE
      ?auto_2501500 - DIRECTION
      ?auto_2501501 - MODE
    )
    :vars
    (
      ?auto_2501504 - INSTRUMENT
      ?auto_2501503 - SATELLITE
      ?auto_2501505 - DIRECTION
      ?auto_2501502 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2501495 ?auto_2501493 ) ) ( not ( = ?auto_2501497 ?auto_2501493 ) ) ( not ( = ?auto_2501497 ?auto_2501495 ) ) ( not ( = ?auto_2501498 ?auto_2501493 ) ) ( not ( = ?auto_2501498 ?auto_2501495 ) ) ( not ( = ?auto_2501498 ?auto_2501497 ) ) ( not ( = ?auto_2501500 ?auto_2501493 ) ) ( not ( = ?auto_2501500 ?auto_2501495 ) ) ( not ( = ?auto_2501500 ?auto_2501497 ) ) ( not ( = ?auto_2501500 ?auto_2501498 ) ) ( ON_BOARD ?auto_2501504 ?auto_2501503 ) ( SUPPORTS ?auto_2501504 ?auto_2501496 ) ( not ( = ?auto_2501497 ?auto_2501505 ) ) ( HAVE_IMAGE ?auto_2501495 ?auto_2501492 ) ( not ( = ?auto_2501495 ?auto_2501505 ) ) ( not ( = ?auto_2501492 ?auto_2501496 ) ) ( CALIBRATION_TARGET ?auto_2501504 ?auto_2501505 ) ( POINTING ?auto_2501503 ?auto_2501493 ) ( not ( = ?auto_2501505 ?auto_2501493 ) ) ( ON_BOARD ?auto_2501502 ?auto_2501503 ) ( POWER_ON ?auto_2501502 ) ( not ( = ?auto_2501504 ?auto_2501502 ) ) ( HAVE_IMAGE ?auto_2501493 ?auto_2501494 ) ( HAVE_IMAGE ?auto_2501498 ?auto_2501499 ) ( HAVE_IMAGE ?auto_2501500 ?auto_2501501 ) ( not ( = ?auto_2501494 ?auto_2501492 ) ) ( not ( = ?auto_2501494 ?auto_2501496 ) ) ( not ( = ?auto_2501494 ?auto_2501499 ) ) ( not ( = ?auto_2501494 ?auto_2501501 ) ) ( not ( = ?auto_2501492 ?auto_2501499 ) ) ( not ( = ?auto_2501492 ?auto_2501501 ) ) ( not ( = ?auto_2501496 ?auto_2501499 ) ) ( not ( = ?auto_2501496 ?auto_2501501 ) ) ( not ( = ?auto_2501498 ?auto_2501505 ) ) ( not ( = ?auto_2501499 ?auto_2501501 ) ) ( not ( = ?auto_2501500 ?auto_2501505 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2501495 ?auto_2501492 ?auto_2501497 ?auto_2501496 )
      ( GET-5IMAGE-VERIFY ?auto_2501493 ?auto_2501494 ?auto_2501495 ?auto_2501492 ?auto_2501497 ?auto_2501496 ?auto_2501498 ?auto_2501499 ?auto_2501500 ?auto_2501501 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2504575 - DIRECTION
      ?auto_2504576 - MODE
      ?auto_2504577 - DIRECTION
      ?auto_2504574 - MODE
      ?auto_2504579 - DIRECTION
      ?auto_2504578 - MODE
      ?auto_2504580 - DIRECTION
      ?auto_2504581 - MODE
      ?auto_2504582 - DIRECTION
      ?auto_2504583 - MODE
    )
    :vars
    (
      ?auto_2504586 - INSTRUMENT
      ?auto_2504585 - SATELLITE
      ?auto_2504587 - DIRECTION
      ?auto_2504584 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2504577 ?auto_2504575 ) ) ( not ( = ?auto_2504579 ?auto_2504575 ) ) ( not ( = ?auto_2504579 ?auto_2504577 ) ) ( not ( = ?auto_2504580 ?auto_2504575 ) ) ( not ( = ?auto_2504580 ?auto_2504577 ) ) ( not ( = ?auto_2504580 ?auto_2504579 ) ) ( not ( = ?auto_2504582 ?auto_2504575 ) ) ( not ( = ?auto_2504582 ?auto_2504577 ) ) ( not ( = ?auto_2504582 ?auto_2504579 ) ) ( not ( = ?auto_2504582 ?auto_2504580 ) ) ( ON_BOARD ?auto_2504586 ?auto_2504585 ) ( SUPPORTS ?auto_2504586 ?auto_2504574 ) ( not ( = ?auto_2504577 ?auto_2504587 ) ) ( HAVE_IMAGE ?auto_2504579 ?auto_2504578 ) ( not ( = ?auto_2504579 ?auto_2504587 ) ) ( not ( = ?auto_2504578 ?auto_2504574 ) ) ( CALIBRATION_TARGET ?auto_2504586 ?auto_2504587 ) ( POINTING ?auto_2504585 ?auto_2504575 ) ( not ( = ?auto_2504587 ?auto_2504575 ) ) ( ON_BOARD ?auto_2504584 ?auto_2504585 ) ( POWER_ON ?auto_2504584 ) ( not ( = ?auto_2504586 ?auto_2504584 ) ) ( HAVE_IMAGE ?auto_2504575 ?auto_2504576 ) ( HAVE_IMAGE ?auto_2504580 ?auto_2504581 ) ( HAVE_IMAGE ?auto_2504582 ?auto_2504583 ) ( not ( = ?auto_2504576 ?auto_2504574 ) ) ( not ( = ?auto_2504576 ?auto_2504578 ) ) ( not ( = ?auto_2504576 ?auto_2504581 ) ) ( not ( = ?auto_2504576 ?auto_2504583 ) ) ( not ( = ?auto_2504574 ?auto_2504581 ) ) ( not ( = ?auto_2504574 ?auto_2504583 ) ) ( not ( = ?auto_2504578 ?auto_2504581 ) ) ( not ( = ?auto_2504578 ?auto_2504583 ) ) ( not ( = ?auto_2504580 ?auto_2504587 ) ) ( not ( = ?auto_2504581 ?auto_2504583 ) ) ( not ( = ?auto_2504582 ?auto_2504587 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2504579 ?auto_2504578 ?auto_2504577 ?auto_2504574 )
      ( GET-5IMAGE-VERIFY ?auto_2504575 ?auto_2504576 ?auto_2504577 ?auto_2504574 ?auto_2504579 ?auto_2504578 ?auto_2504580 ?auto_2504581 ?auto_2504582 ?auto_2504583 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2506894 - DIRECTION
      ?auto_2506895 - MODE
      ?auto_2506896 - DIRECTION
      ?auto_2506893 - MODE
      ?auto_2506898 - DIRECTION
      ?auto_2506897 - MODE
      ?auto_2506899 - DIRECTION
      ?auto_2506900 - MODE
      ?auto_2506901 - DIRECTION
      ?auto_2506902 - MODE
    )
    :vars
    (
      ?auto_2506905 - INSTRUMENT
      ?auto_2506904 - SATELLITE
      ?auto_2506906 - DIRECTION
      ?auto_2506903 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2506896 ?auto_2506894 ) ) ( not ( = ?auto_2506898 ?auto_2506894 ) ) ( not ( = ?auto_2506898 ?auto_2506896 ) ) ( not ( = ?auto_2506899 ?auto_2506894 ) ) ( not ( = ?auto_2506899 ?auto_2506896 ) ) ( not ( = ?auto_2506899 ?auto_2506898 ) ) ( not ( = ?auto_2506901 ?auto_2506894 ) ) ( not ( = ?auto_2506901 ?auto_2506896 ) ) ( not ( = ?auto_2506901 ?auto_2506898 ) ) ( not ( = ?auto_2506901 ?auto_2506899 ) ) ( ON_BOARD ?auto_2506905 ?auto_2506904 ) ( SUPPORTS ?auto_2506905 ?auto_2506895 ) ( not ( = ?auto_2506894 ?auto_2506906 ) ) ( HAVE_IMAGE ?auto_2506896 ?auto_2506893 ) ( not ( = ?auto_2506896 ?auto_2506906 ) ) ( not ( = ?auto_2506893 ?auto_2506895 ) ) ( CALIBRATION_TARGET ?auto_2506905 ?auto_2506906 ) ( POINTING ?auto_2506904 ?auto_2506901 ) ( not ( = ?auto_2506906 ?auto_2506901 ) ) ( ON_BOARD ?auto_2506903 ?auto_2506904 ) ( POWER_ON ?auto_2506903 ) ( not ( = ?auto_2506905 ?auto_2506903 ) ) ( HAVE_IMAGE ?auto_2506898 ?auto_2506897 ) ( HAVE_IMAGE ?auto_2506899 ?auto_2506900 ) ( HAVE_IMAGE ?auto_2506901 ?auto_2506902 ) ( not ( = ?auto_2506895 ?auto_2506897 ) ) ( not ( = ?auto_2506895 ?auto_2506900 ) ) ( not ( = ?auto_2506895 ?auto_2506902 ) ) ( not ( = ?auto_2506893 ?auto_2506897 ) ) ( not ( = ?auto_2506893 ?auto_2506900 ) ) ( not ( = ?auto_2506893 ?auto_2506902 ) ) ( not ( = ?auto_2506898 ?auto_2506906 ) ) ( not ( = ?auto_2506897 ?auto_2506900 ) ) ( not ( = ?auto_2506897 ?auto_2506902 ) ) ( not ( = ?auto_2506899 ?auto_2506906 ) ) ( not ( = ?auto_2506900 ?auto_2506902 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2506896 ?auto_2506893 ?auto_2506894 ?auto_2506895 )
      ( GET-5IMAGE-VERIFY ?auto_2506894 ?auto_2506895 ?auto_2506896 ?auto_2506893 ?auto_2506898 ?auto_2506897 ?auto_2506899 ?auto_2506900 ?auto_2506901 ?auto_2506902 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2506951 - DIRECTION
      ?auto_2506952 - MODE
      ?auto_2506953 - DIRECTION
      ?auto_2506950 - MODE
      ?auto_2506955 - DIRECTION
      ?auto_2506954 - MODE
      ?auto_2506956 - DIRECTION
      ?auto_2506957 - MODE
      ?auto_2506958 - DIRECTION
      ?auto_2506959 - MODE
    )
    :vars
    (
      ?auto_2506962 - INSTRUMENT
      ?auto_2506961 - SATELLITE
      ?auto_2506963 - DIRECTION
      ?auto_2506960 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2506953 ?auto_2506951 ) ) ( not ( = ?auto_2506955 ?auto_2506951 ) ) ( not ( = ?auto_2506955 ?auto_2506953 ) ) ( not ( = ?auto_2506956 ?auto_2506951 ) ) ( not ( = ?auto_2506956 ?auto_2506953 ) ) ( not ( = ?auto_2506956 ?auto_2506955 ) ) ( not ( = ?auto_2506958 ?auto_2506951 ) ) ( not ( = ?auto_2506958 ?auto_2506953 ) ) ( not ( = ?auto_2506958 ?auto_2506955 ) ) ( not ( = ?auto_2506958 ?auto_2506956 ) ) ( ON_BOARD ?auto_2506962 ?auto_2506961 ) ( SUPPORTS ?auto_2506962 ?auto_2506952 ) ( not ( = ?auto_2506951 ?auto_2506963 ) ) ( HAVE_IMAGE ?auto_2506953 ?auto_2506950 ) ( not ( = ?auto_2506953 ?auto_2506963 ) ) ( not ( = ?auto_2506950 ?auto_2506952 ) ) ( CALIBRATION_TARGET ?auto_2506962 ?auto_2506963 ) ( POINTING ?auto_2506961 ?auto_2506956 ) ( not ( = ?auto_2506963 ?auto_2506956 ) ) ( ON_BOARD ?auto_2506960 ?auto_2506961 ) ( POWER_ON ?auto_2506960 ) ( not ( = ?auto_2506962 ?auto_2506960 ) ) ( HAVE_IMAGE ?auto_2506955 ?auto_2506954 ) ( HAVE_IMAGE ?auto_2506956 ?auto_2506957 ) ( HAVE_IMAGE ?auto_2506958 ?auto_2506959 ) ( not ( = ?auto_2506952 ?auto_2506954 ) ) ( not ( = ?auto_2506952 ?auto_2506957 ) ) ( not ( = ?auto_2506952 ?auto_2506959 ) ) ( not ( = ?auto_2506950 ?auto_2506954 ) ) ( not ( = ?auto_2506950 ?auto_2506957 ) ) ( not ( = ?auto_2506950 ?auto_2506959 ) ) ( not ( = ?auto_2506955 ?auto_2506963 ) ) ( not ( = ?auto_2506954 ?auto_2506957 ) ) ( not ( = ?auto_2506954 ?auto_2506959 ) ) ( not ( = ?auto_2506957 ?auto_2506959 ) ) ( not ( = ?auto_2506958 ?auto_2506963 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2506953 ?auto_2506950 ?auto_2506951 ?auto_2506952 )
      ( GET-5IMAGE-VERIFY ?auto_2506951 ?auto_2506952 ?auto_2506953 ?auto_2506950 ?auto_2506955 ?auto_2506954 ?auto_2506956 ?auto_2506957 ?auto_2506958 ?auto_2506959 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2507523 - DIRECTION
      ?auto_2507524 - MODE
      ?auto_2507525 - DIRECTION
      ?auto_2507522 - MODE
      ?auto_2507527 - DIRECTION
      ?auto_2507526 - MODE
      ?auto_2507528 - DIRECTION
      ?auto_2507529 - MODE
      ?auto_2507530 - DIRECTION
      ?auto_2507531 - MODE
    )
    :vars
    (
      ?auto_2507534 - INSTRUMENT
      ?auto_2507533 - SATELLITE
      ?auto_2507535 - DIRECTION
      ?auto_2507532 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2507525 ?auto_2507523 ) ) ( not ( = ?auto_2507527 ?auto_2507523 ) ) ( not ( = ?auto_2507527 ?auto_2507525 ) ) ( not ( = ?auto_2507528 ?auto_2507523 ) ) ( not ( = ?auto_2507528 ?auto_2507525 ) ) ( not ( = ?auto_2507528 ?auto_2507527 ) ) ( not ( = ?auto_2507530 ?auto_2507523 ) ) ( not ( = ?auto_2507530 ?auto_2507525 ) ) ( not ( = ?auto_2507530 ?auto_2507527 ) ) ( not ( = ?auto_2507530 ?auto_2507528 ) ) ( ON_BOARD ?auto_2507534 ?auto_2507533 ) ( SUPPORTS ?auto_2507534 ?auto_2507524 ) ( not ( = ?auto_2507523 ?auto_2507535 ) ) ( HAVE_IMAGE ?auto_2507525 ?auto_2507522 ) ( not ( = ?auto_2507525 ?auto_2507535 ) ) ( not ( = ?auto_2507522 ?auto_2507524 ) ) ( CALIBRATION_TARGET ?auto_2507534 ?auto_2507535 ) ( POINTING ?auto_2507533 ?auto_2507527 ) ( not ( = ?auto_2507535 ?auto_2507527 ) ) ( ON_BOARD ?auto_2507532 ?auto_2507533 ) ( POWER_ON ?auto_2507532 ) ( not ( = ?auto_2507534 ?auto_2507532 ) ) ( HAVE_IMAGE ?auto_2507527 ?auto_2507526 ) ( HAVE_IMAGE ?auto_2507528 ?auto_2507529 ) ( HAVE_IMAGE ?auto_2507530 ?auto_2507531 ) ( not ( = ?auto_2507524 ?auto_2507526 ) ) ( not ( = ?auto_2507524 ?auto_2507529 ) ) ( not ( = ?auto_2507524 ?auto_2507531 ) ) ( not ( = ?auto_2507522 ?auto_2507526 ) ) ( not ( = ?auto_2507522 ?auto_2507529 ) ) ( not ( = ?auto_2507522 ?auto_2507531 ) ) ( not ( = ?auto_2507526 ?auto_2507529 ) ) ( not ( = ?auto_2507526 ?auto_2507531 ) ) ( not ( = ?auto_2507528 ?auto_2507535 ) ) ( not ( = ?auto_2507529 ?auto_2507531 ) ) ( not ( = ?auto_2507530 ?auto_2507535 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2507525 ?auto_2507522 ?auto_2507523 ?auto_2507524 )
      ( GET-5IMAGE-VERIFY ?auto_2507523 ?auto_2507524 ?auto_2507525 ?auto_2507522 ?auto_2507527 ?auto_2507526 ?auto_2507528 ?auto_2507529 ?auto_2507530 ?auto_2507531 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_2512071 - DIRECTION
      ?auto_2512072 - MODE
      ?auto_2512073 - DIRECTION
      ?auto_2512070 - MODE
      ?auto_2512075 - DIRECTION
      ?auto_2512074 - MODE
      ?auto_2512076 - DIRECTION
      ?auto_2512077 - MODE
      ?auto_2512078 - DIRECTION
      ?auto_2512079 - MODE
    )
    :vars
    (
      ?auto_2512082 - INSTRUMENT
      ?auto_2512081 - SATELLITE
      ?auto_2512083 - DIRECTION
      ?auto_2512080 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2512073 ?auto_2512071 ) ) ( not ( = ?auto_2512075 ?auto_2512071 ) ) ( not ( = ?auto_2512075 ?auto_2512073 ) ) ( not ( = ?auto_2512076 ?auto_2512071 ) ) ( not ( = ?auto_2512076 ?auto_2512073 ) ) ( not ( = ?auto_2512076 ?auto_2512075 ) ) ( not ( = ?auto_2512078 ?auto_2512071 ) ) ( not ( = ?auto_2512078 ?auto_2512073 ) ) ( not ( = ?auto_2512078 ?auto_2512075 ) ) ( not ( = ?auto_2512078 ?auto_2512076 ) ) ( ON_BOARD ?auto_2512082 ?auto_2512081 ) ( SUPPORTS ?auto_2512082 ?auto_2512072 ) ( not ( = ?auto_2512071 ?auto_2512083 ) ) ( HAVE_IMAGE ?auto_2512075 ?auto_2512074 ) ( not ( = ?auto_2512075 ?auto_2512083 ) ) ( not ( = ?auto_2512074 ?auto_2512072 ) ) ( CALIBRATION_TARGET ?auto_2512082 ?auto_2512083 ) ( POINTING ?auto_2512081 ?auto_2512073 ) ( not ( = ?auto_2512083 ?auto_2512073 ) ) ( ON_BOARD ?auto_2512080 ?auto_2512081 ) ( POWER_ON ?auto_2512080 ) ( not ( = ?auto_2512082 ?auto_2512080 ) ) ( HAVE_IMAGE ?auto_2512073 ?auto_2512070 ) ( HAVE_IMAGE ?auto_2512076 ?auto_2512077 ) ( HAVE_IMAGE ?auto_2512078 ?auto_2512079 ) ( not ( = ?auto_2512072 ?auto_2512070 ) ) ( not ( = ?auto_2512072 ?auto_2512077 ) ) ( not ( = ?auto_2512072 ?auto_2512079 ) ) ( not ( = ?auto_2512070 ?auto_2512074 ) ) ( not ( = ?auto_2512070 ?auto_2512077 ) ) ( not ( = ?auto_2512070 ?auto_2512079 ) ) ( not ( = ?auto_2512074 ?auto_2512077 ) ) ( not ( = ?auto_2512074 ?auto_2512079 ) ) ( not ( = ?auto_2512076 ?auto_2512083 ) ) ( not ( = ?auto_2512077 ?auto_2512079 ) ) ( not ( = ?auto_2512078 ?auto_2512083 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2512075 ?auto_2512074 ?auto_2512071 ?auto_2512072 )
      ( GET-5IMAGE-VERIFY ?auto_2512071 ?auto_2512072 ?auto_2512073 ?auto_2512070 ?auto_2512075 ?auto_2512074 ?auto_2512076 ?auto_2512077 ?auto_2512078 ?auto_2512079 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2591286 - DIRECTION
      ?auto_2591287 - MODE
      ?auto_2591288 - DIRECTION
      ?auto_2591285 - MODE
      ?auto_2591290 - DIRECTION
      ?auto_2591289 - MODE
      ?auto_2591291 - DIRECTION
      ?auto_2591292 - MODE
    )
    :vars
    (
      ?auto_2591295 - INSTRUMENT
      ?auto_2591296 - SATELLITE
      ?auto_2591294 - DIRECTION
      ?auto_2591293 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2591288 ?auto_2591286 ) ) ( not ( = ?auto_2591290 ?auto_2591286 ) ) ( not ( = ?auto_2591290 ?auto_2591288 ) ) ( not ( = ?auto_2591291 ?auto_2591286 ) ) ( not ( = ?auto_2591291 ?auto_2591288 ) ) ( not ( = ?auto_2591291 ?auto_2591290 ) ) ( ON_BOARD ?auto_2591295 ?auto_2591296 ) ( SUPPORTS ?auto_2591295 ?auto_2591292 ) ( not ( = ?auto_2591291 ?auto_2591294 ) ) ( HAVE_IMAGE ?auto_2591286 ?auto_2591287 ) ( not ( = ?auto_2591286 ?auto_2591294 ) ) ( not ( = ?auto_2591287 ?auto_2591292 ) ) ( CALIBRATION_TARGET ?auto_2591295 ?auto_2591294 ) ( not ( = ?auto_2591294 ?auto_2591288 ) ) ( ON_BOARD ?auto_2591293 ?auto_2591296 ) ( POWER_ON ?auto_2591293 ) ( not ( = ?auto_2591295 ?auto_2591293 ) ) ( POINTING ?auto_2591296 ?auto_2591294 ) ( HAVE_IMAGE ?auto_2591288 ?auto_2591285 ) ( HAVE_IMAGE ?auto_2591290 ?auto_2591289 ) ( not ( = ?auto_2591287 ?auto_2591285 ) ) ( not ( = ?auto_2591287 ?auto_2591289 ) ) ( not ( = ?auto_2591285 ?auto_2591289 ) ) ( not ( = ?auto_2591285 ?auto_2591292 ) ) ( not ( = ?auto_2591290 ?auto_2591294 ) ) ( not ( = ?auto_2591289 ?auto_2591292 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2591286 ?auto_2591287 ?auto_2591291 ?auto_2591292 )
      ( GET-4IMAGE-VERIFY ?auto_2591286 ?auto_2591287 ?auto_2591288 ?auto_2591285 ?auto_2591290 ?auto_2591289 ?auto_2591291 ?auto_2591292 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2591334 - DIRECTION
      ?auto_2591335 - MODE
      ?auto_2591336 - DIRECTION
      ?auto_2591333 - MODE
      ?auto_2591338 - DIRECTION
      ?auto_2591337 - MODE
      ?auto_2591339 - DIRECTION
      ?auto_2591340 - MODE
    )
    :vars
    (
      ?auto_2591343 - INSTRUMENT
      ?auto_2591344 - SATELLITE
      ?auto_2591342 - DIRECTION
      ?auto_2591341 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2591336 ?auto_2591334 ) ) ( not ( = ?auto_2591338 ?auto_2591334 ) ) ( not ( = ?auto_2591338 ?auto_2591336 ) ) ( not ( = ?auto_2591339 ?auto_2591334 ) ) ( not ( = ?auto_2591339 ?auto_2591336 ) ) ( not ( = ?auto_2591339 ?auto_2591338 ) ) ( ON_BOARD ?auto_2591343 ?auto_2591344 ) ( SUPPORTS ?auto_2591343 ?auto_2591337 ) ( not ( = ?auto_2591338 ?auto_2591342 ) ) ( HAVE_IMAGE ?auto_2591334 ?auto_2591335 ) ( not ( = ?auto_2591334 ?auto_2591342 ) ) ( not ( = ?auto_2591335 ?auto_2591337 ) ) ( CALIBRATION_TARGET ?auto_2591343 ?auto_2591342 ) ( not ( = ?auto_2591342 ?auto_2591336 ) ) ( ON_BOARD ?auto_2591341 ?auto_2591344 ) ( POWER_ON ?auto_2591341 ) ( not ( = ?auto_2591343 ?auto_2591341 ) ) ( POINTING ?auto_2591344 ?auto_2591342 ) ( HAVE_IMAGE ?auto_2591336 ?auto_2591333 ) ( HAVE_IMAGE ?auto_2591339 ?auto_2591340 ) ( not ( = ?auto_2591335 ?auto_2591333 ) ) ( not ( = ?auto_2591335 ?auto_2591340 ) ) ( not ( = ?auto_2591333 ?auto_2591337 ) ) ( not ( = ?auto_2591333 ?auto_2591340 ) ) ( not ( = ?auto_2591337 ?auto_2591340 ) ) ( not ( = ?auto_2591339 ?auto_2591342 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2591334 ?auto_2591335 ?auto_2591338 ?auto_2591337 )
      ( GET-4IMAGE-VERIFY ?auto_2591334 ?auto_2591335 ?auto_2591336 ?auto_2591333 ?auto_2591338 ?auto_2591337 ?auto_2591339 ?auto_2591340 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2591680 - DIRECTION
      ?auto_2591681 - MODE
      ?auto_2591682 - DIRECTION
      ?auto_2591679 - MODE
      ?auto_2591684 - DIRECTION
      ?auto_2591683 - MODE
      ?auto_2591685 - DIRECTION
      ?auto_2591686 - MODE
    )
    :vars
    (
      ?auto_2591689 - INSTRUMENT
      ?auto_2591690 - SATELLITE
      ?auto_2591688 - DIRECTION
      ?auto_2591687 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2591682 ?auto_2591680 ) ) ( not ( = ?auto_2591684 ?auto_2591680 ) ) ( not ( = ?auto_2591684 ?auto_2591682 ) ) ( not ( = ?auto_2591685 ?auto_2591680 ) ) ( not ( = ?auto_2591685 ?auto_2591682 ) ) ( not ( = ?auto_2591685 ?auto_2591684 ) ) ( ON_BOARD ?auto_2591689 ?auto_2591690 ) ( SUPPORTS ?auto_2591689 ?auto_2591679 ) ( not ( = ?auto_2591682 ?auto_2591688 ) ) ( HAVE_IMAGE ?auto_2591680 ?auto_2591681 ) ( not ( = ?auto_2591680 ?auto_2591688 ) ) ( not ( = ?auto_2591681 ?auto_2591679 ) ) ( CALIBRATION_TARGET ?auto_2591689 ?auto_2591688 ) ( not ( = ?auto_2591688 ?auto_2591684 ) ) ( ON_BOARD ?auto_2591687 ?auto_2591690 ) ( POWER_ON ?auto_2591687 ) ( not ( = ?auto_2591689 ?auto_2591687 ) ) ( POINTING ?auto_2591690 ?auto_2591688 ) ( HAVE_IMAGE ?auto_2591684 ?auto_2591683 ) ( HAVE_IMAGE ?auto_2591685 ?auto_2591686 ) ( not ( = ?auto_2591681 ?auto_2591683 ) ) ( not ( = ?auto_2591681 ?auto_2591686 ) ) ( not ( = ?auto_2591679 ?auto_2591683 ) ) ( not ( = ?auto_2591679 ?auto_2591686 ) ) ( not ( = ?auto_2591683 ?auto_2591686 ) ) ( not ( = ?auto_2591685 ?auto_2591688 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2591680 ?auto_2591681 ?auto_2591682 ?auto_2591679 )
      ( GET-4IMAGE-VERIFY ?auto_2591680 ?auto_2591681 ?auto_2591682 ?auto_2591679 ?auto_2591684 ?auto_2591683 ?auto_2591685 ?auto_2591686 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2554542 - DIRECTION
      ?auto_2554543 - MODE
      ?auto_2554544 - DIRECTION
      ?auto_2554541 - MODE
      ?auto_2554546 - DIRECTION
      ?auto_2554545 - MODE
      ?auto_2554547 - DIRECTION
      ?auto_2554548 - MODE
    )
    :vars
    (
      ?auto_2554549 - INSTRUMENT
      ?auto_2554551 - SATELLITE
      ?auto_2554553 - DIRECTION
      ?auto_2554550 - DIRECTION
      ?auto_2554552 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2554544 ?auto_2554542 ) ) ( not ( = ?auto_2554546 ?auto_2554542 ) ) ( not ( = ?auto_2554546 ?auto_2554544 ) ) ( not ( = ?auto_2554547 ?auto_2554542 ) ) ( not ( = ?auto_2554547 ?auto_2554544 ) ) ( not ( = ?auto_2554547 ?auto_2554546 ) ) ( ON_BOARD ?auto_2554549 ?auto_2554551 ) ( SUPPORTS ?auto_2554549 ?auto_2554548 ) ( not ( = ?auto_2554547 ?auto_2554553 ) ) ( HAVE_IMAGE ?auto_2554544 ?auto_2554541 ) ( not ( = ?auto_2554544 ?auto_2554553 ) ) ( not ( = ?auto_2554541 ?auto_2554548 ) ) ( CALIBRATION_TARGET ?auto_2554549 ?auto_2554553 ) ( not ( = ?auto_2554553 ?auto_2554550 ) ) ( not ( = ?auto_2554547 ?auto_2554550 ) ) ( not ( = ?auto_2554544 ?auto_2554550 ) ) ( ON_BOARD ?auto_2554552 ?auto_2554551 ) ( POWER_ON ?auto_2554552 ) ( not ( = ?auto_2554549 ?auto_2554552 ) ) ( POINTING ?auto_2554551 ?auto_2554553 ) ( HAVE_IMAGE ?auto_2554542 ?auto_2554543 ) ( HAVE_IMAGE ?auto_2554546 ?auto_2554545 ) ( not ( = ?auto_2554542 ?auto_2554553 ) ) ( not ( = ?auto_2554542 ?auto_2554550 ) ) ( not ( = ?auto_2554543 ?auto_2554541 ) ) ( not ( = ?auto_2554543 ?auto_2554545 ) ) ( not ( = ?auto_2554543 ?auto_2554548 ) ) ( not ( = ?auto_2554541 ?auto_2554545 ) ) ( not ( = ?auto_2554546 ?auto_2554553 ) ) ( not ( = ?auto_2554546 ?auto_2554550 ) ) ( not ( = ?auto_2554545 ?auto_2554548 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2554544 ?auto_2554541 ?auto_2554547 ?auto_2554548 )
      ( GET-4IMAGE-VERIFY ?auto_2554542 ?auto_2554543 ?auto_2554544 ?auto_2554541 ?auto_2554546 ?auto_2554545 ?auto_2554547 ?auto_2554548 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2554593 - DIRECTION
      ?auto_2554594 - MODE
      ?auto_2554595 - DIRECTION
      ?auto_2554592 - MODE
      ?auto_2554597 - DIRECTION
      ?auto_2554596 - MODE
      ?auto_2554598 - DIRECTION
      ?auto_2554599 - MODE
    )
    :vars
    (
      ?auto_2554600 - INSTRUMENT
      ?auto_2554602 - SATELLITE
      ?auto_2554604 - DIRECTION
      ?auto_2554601 - DIRECTION
      ?auto_2554603 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2554595 ?auto_2554593 ) ) ( not ( = ?auto_2554597 ?auto_2554593 ) ) ( not ( = ?auto_2554597 ?auto_2554595 ) ) ( not ( = ?auto_2554598 ?auto_2554593 ) ) ( not ( = ?auto_2554598 ?auto_2554595 ) ) ( not ( = ?auto_2554598 ?auto_2554597 ) ) ( ON_BOARD ?auto_2554600 ?auto_2554602 ) ( SUPPORTS ?auto_2554600 ?auto_2554596 ) ( not ( = ?auto_2554597 ?auto_2554604 ) ) ( HAVE_IMAGE ?auto_2554595 ?auto_2554592 ) ( not ( = ?auto_2554595 ?auto_2554604 ) ) ( not ( = ?auto_2554592 ?auto_2554596 ) ) ( CALIBRATION_TARGET ?auto_2554600 ?auto_2554604 ) ( not ( = ?auto_2554604 ?auto_2554601 ) ) ( not ( = ?auto_2554597 ?auto_2554601 ) ) ( not ( = ?auto_2554595 ?auto_2554601 ) ) ( ON_BOARD ?auto_2554603 ?auto_2554602 ) ( POWER_ON ?auto_2554603 ) ( not ( = ?auto_2554600 ?auto_2554603 ) ) ( POINTING ?auto_2554602 ?auto_2554604 ) ( HAVE_IMAGE ?auto_2554593 ?auto_2554594 ) ( HAVE_IMAGE ?auto_2554598 ?auto_2554599 ) ( not ( = ?auto_2554593 ?auto_2554604 ) ) ( not ( = ?auto_2554593 ?auto_2554601 ) ) ( not ( = ?auto_2554594 ?auto_2554592 ) ) ( not ( = ?auto_2554594 ?auto_2554596 ) ) ( not ( = ?auto_2554594 ?auto_2554599 ) ) ( not ( = ?auto_2554592 ?auto_2554599 ) ) ( not ( = ?auto_2554596 ?auto_2554599 ) ) ( not ( = ?auto_2554598 ?auto_2554604 ) ) ( not ( = ?auto_2554598 ?auto_2554601 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2554595 ?auto_2554592 ?auto_2554597 ?auto_2554596 )
      ( GET-4IMAGE-VERIFY ?auto_2554593 ?auto_2554594 ?auto_2554595 ?auto_2554592 ?auto_2554597 ?auto_2554596 ?auto_2554598 ?auto_2554599 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2554760 - DIRECTION
      ?auto_2554761 - MODE
      ?auto_2554762 - DIRECTION
      ?auto_2554759 - MODE
      ?auto_2554764 - DIRECTION
      ?auto_2554763 - MODE
      ?auto_2554765 - DIRECTION
      ?auto_2554766 - MODE
    )
    :vars
    (
      ?auto_2554767 - INSTRUMENT
      ?auto_2554769 - SATELLITE
      ?auto_2554771 - DIRECTION
      ?auto_2554768 - DIRECTION
      ?auto_2554770 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2554762 ?auto_2554760 ) ) ( not ( = ?auto_2554764 ?auto_2554760 ) ) ( not ( = ?auto_2554764 ?auto_2554762 ) ) ( not ( = ?auto_2554765 ?auto_2554760 ) ) ( not ( = ?auto_2554765 ?auto_2554762 ) ) ( not ( = ?auto_2554765 ?auto_2554764 ) ) ( ON_BOARD ?auto_2554767 ?auto_2554769 ) ( SUPPORTS ?auto_2554767 ?auto_2554766 ) ( not ( = ?auto_2554765 ?auto_2554771 ) ) ( HAVE_IMAGE ?auto_2554764 ?auto_2554763 ) ( not ( = ?auto_2554764 ?auto_2554771 ) ) ( not ( = ?auto_2554763 ?auto_2554766 ) ) ( CALIBRATION_TARGET ?auto_2554767 ?auto_2554771 ) ( not ( = ?auto_2554771 ?auto_2554768 ) ) ( not ( = ?auto_2554765 ?auto_2554768 ) ) ( not ( = ?auto_2554764 ?auto_2554768 ) ) ( ON_BOARD ?auto_2554770 ?auto_2554769 ) ( POWER_ON ?auto_2554770 ) ( not ( = ?auto_2554767 ?auto_2554770 ) ) ( POINTING ?auto_2554769 ?auto_2554771 ) ( HAVE_IMAGE ?auto_2554760 ?auto_2554761 ) ( HAVE_IMAGE ?auto_2554762 ?auto_2554759 ) ( not ( = ?auto_2554760 ?auto_2554771 ) ) ( not ( = ?auto_2554760 ?auto_2554768 ) ) ( not ( = ?auto_2554761 ?auto_2554759 ) ) ( not ( = ?auto_2554761 ?auto_2554763 ) ) ( not ( = ?auto_2554761 ?auto_2554766 ) ) ( not ( = ?auto_2554762 ?auto_2554771 ) ) ( not ( = ?auto_2554762 ?auto_2554768 ) ) ( not ( = ?auto_2554759 ?auto_2554763 ) ) ( not ( = ?auto_2554759 ?auto_2554766 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2554764 ?auto_2554763 ?auto_2554765 ?auto_2554766 )
      ( GET-4IMAGE-VERIFY ?auto_2554760 ?auto_2554761 ?auto_2554762 ?auto_2554759 ?auto_2554764 ?auto_2554763 ?auto_2554765 ?auto_2554766 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2554817 - DIRECTION
      ?auto_2554818 - MODE
      ?auto_2554819 - DIRECTION
      ?auto_2554816 - MODE
      ?auto_2554821 - DIRECTION
      ?auto_2554820 - MODE
      ?auto_2554822 - DIRECTION
      ?auto_2554823 - MODE
    )
    :vars
    (
      ?auto_2554824 - INSTRUMENT
      ?auto_2554826 - SATELLITE
      ?auto_2554828 - DIRECTION
      ?auto_2554825 - DIRECTION
      ?auto_2554827 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2554819 ?auto_2554817 ) ) ( not ( = ?auto_2554821 ?auto_2554817 ) ) ( not ( = ?auto_2554821 ?auto_2554819 ) ) ( not ( = ?auto_2554822 ?auto_2554817 ) ) ( not ( = ?auto_2554822 ?auto_2554819 ) ) ( not ( = ?auto_2554822 ?auto_2554821 ) ) ( ON_BOARD ?auto_2554824 ?auto_2554826 ) ( SUPPORTS ?auto_2554824 ?auto_2554820 ) ( not ( = ?auto_2554821 ?auto_2554828 ) ) ( HAVE_IMAGE ?auto_2554822 ?auto_2554823 ) ( not ( = ?auto_2554822 ?auto_2554828 ) ) ( not ( = ?auto_2554823 ?auto_2554820 ) ) ( CALIBRATION_TARGET ?auto_2554824 ?auto_2554828 ) ( not ( = ?auto_2554828 ?auto_2554825 ) ) ( not ( = ?auto_2554821 ?auto_2554825 ) ) ( not ( = ?auto_2554822 ?auto_2554825 ) ) ( ON_BOARD ?auto_2554827 ?auto_2554826 ) ( POWER_ON ?auto_2554827 ) ( not ( = ?auto_2554824 ?auto_2554827 ) ) ( POINTING ?auto_2554826 ?auto_2554828 ) ( HAVE_IMAGE ?auto_2554817 ?auto_2554818 ) ( HAVE_IMAGE ?auto_2554819 ?auto_2554816 ) ( not ( = ?auto_2554817 ?auto_2554828 ) ) ( not ( = ?auto_2554817 ?auto_2554825 ) ) ( not ( = ?auto_2554818 ?auto_2554816 ) ) ( not ( = ?auto_2554818 ?auto_2554820 ) ) ( not ( = ?auto_2554818 ?auto_2554823 ) ) ( not ( = ?auto_2554819 ?auto_2554828 ) ) ( not ( = ?auto_2554819 ?auto_2554825 ) ) ( not ( = ?auto_2554816 ?auto_2554820 ) ) ( not ( = ?auto_2554816 ?auto_2554823 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2554822 ?auto_2554823 ?auto_2554821 ?auto_2554820 )
      ( GET-4IMAGE-VERIFY ?auto_2554817 ?auto_2554818 ?auto_2554819 ?auto_2554816 ?auto_2554821 ?auto_2554820 ?auto_2554822 ?auto_2554823 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2555037 - DIRECTION
      ?auto_2555038 - MODE
      ?auto_2555039 - DIRECTION
      ?auto_2555036 - MODE
      ?auto_2555041 - DIRECTION
      ?auto_2555040 - MODE
      ?auto_2555042 - DIRECTION
      ?auto_2555043 - MODE
    )
    :vars
    (
      ?auto_2555044 - INSTRUMENT
      ?auto_2555046 - SATELLITE
      ?auto_2555048 - DIRECTION
      ?auto_2555045 - DIRECTION
      ?auto_2555047 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2555039 ?auto_2555037 ) ) ( not ( = ?auto_2555041 ?auto_2555037 ) ) ( not ( = ?auto_2555041 ?auto_2555039 ) ) ( not ( = ?auto_2555042 ?auto_2555037 ) ) ( not ( = ?auto_2555042 ?auto_2555039 ) ) ( not ( = ?auto_2555042 ?auto_2555041 ) ) ( ON_BOARD ?auto_2555044 ?auto_2555046 ) ( SUPPORTS ?auto_2555044 ?auto_2555036 ) ( not ( = ?auto_2555039 ?auto_2555048 ) ) ( HAVE_IMAGE ?auto_2555041 ?auto_2555040 ) ( not ( = ?auto_2555041 ?auto_2555048 ) ) ( not ( = ?auto_2555040 ?auto_2555036 ) ) ( CALIBRATION_TARGET ?auto_2555044 ?auto_2555048 ) ( not ( = ?auto_2555048 ?auto_2555045 ) ) ( not ( = ?auto_2555039 ?auto_2555045 ) ) ( not ( = ?auto_2555041 ?auto_2555045 ) ) ( ON_BOARD ?auto_2555047 ?auto_2555046 ) ( POWER_ON ?auto_2555047 ) ( not ( = ?auto_2555044 ?auto_2555047 ) ) ( POINTING ?auto_2555046 ?auto_2555048 ) ( HAVE_IMAGE ?auto_2555037 ?auto_2555038 ) ( HAVE_IMAGE ?auto_2555042 ?auto_2555043 ) ( not ( = ?auto_2555037 ?auto_2555048 ) ) ( not ( = ?auto_2555037 ?auto_2555045 ) ) ( not ( = ?auto_2555038 ?auto_2555036 ) ) ( not ( = ?auto_2555038 ?auto_2555040 ) ) ( not ( = ?auto_2555038 ?auto_2555043 ) ) ( not ( = ?auto_2555036 ?auto_2555043 ) ) ( not ( = ?auto_2555040 ?auto_2555043 ) ) ( not ( = ?auto_2555042 ?auto_2555048 ) ) ( not ( = ?auto_2555042 ?auto_2555045 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2555041 ?auto_2555040 ?auto_2555039 ?auto_2555036 )
      ( GET-4IMAGE-VERIFY ?auto_2555037 ?auto_2555038 ?auto_2555039 ?auto_2555036 ?auto_2555041 ?auto_2555040 ?auto_2555042 ?auto_2555043 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2555147 - DIRECTION
      ?auto_2555148 - MODE
      ?auto_2555149 - DIRECTION
      ?auto_2555146 - MODE
      ?auto_2555151 - DIRECTION
      ?auto_2555150 - MODE
      ?auto_2555152 - DIRECTION
      ?auto_2555153 - MODE
    )
    :vars
    (
      ?auto_2555154 - INSTRUMENT
      ?auto_2555156 - SATELLITE
      ?auto_2555158 - DIRECTION
      ?auto_2555155 - DIRECTION
      ?auto_2555157 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2555149 ?auto_2555147 ) ) ( not ( = ?auto_2555151 ?auto_2555147 ) ) ( not ( = ?auto_2555151 ?auto_2555149 ) ) ( not ( = ?auto_2555152 ?auto_2555147 ) ) ( not ( = ?auto_2555152 ?auto_2555149 ) ) ( not ( = ?auto_2555152 ?auto_2555151 ) ) ( ON_BOARD ?auto_2555154 ?auto_2555156 ) ( SUPPORTS ?auto_2555154 ?auto_2555146 ) ( not ( = ?auto_2555149 ?auto_2555158 ) ) ( HAVE_IMAGE ?auto_2555152 ?auto_2555153 ) ( not ( = ?auto_2555152 ?auto_2555158 ) ) ( not ( = ?auto_2555153 ?auto_2555146 ) ) ( CALIBRATION_TARGET ?auto_2555154 ?auto_2555158 ) ( not ( = ?auto_2555158 ?auto_2555155 ) ) ( not ( = ?auto_2555149 ?auto_2555155 ) ) ( not ( = ?auto_2555152 ?auto_2555155 ) ) ( ON_BOARD ?auto_2555157 ?auto_2555156 ) ( POWER_ON ?auto_2555157 ) ( not ( = ?auto_2555154 ?auto_2555157 ) ) ( POINTING ?auto_2555156 ?auto_2555158 ) ( HAVE_IMAGE ?auto_2555147 ?auto_2555148 ) ( HAVE_IMAGE ?auto_2555151 ?auto_2555150 ) ( not ( = ?auto_2555147 ?auto_2555158 ) ) ( not ( = ?auto_2555147 ?auto_2555155 ) ) ( not ( = ?auto_2555148 ?auto_2555146 ) ) ( not ( = ?auto_2555148 ?auto_2555150 ) ) ( not ( = ?auto_2555148 ?auto_2555153 ) ) ( not ( = ?auto_2555146 ?auto_2555150 ) ) ( not ( = ?auto_2555151 ?auto_2555158 ) ) ( not ( = ?auto_2555151 ?auto_2555155 ) ) ( not ( = ?auto_2555150 ?auto_2555153 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2555152 ?auto_2555153 ?auto_2555149 ?auto_2555146 )
      ( GET-4IMAGE-VERIFY ?auto_2555147 ?auto_2555148 ?auto_2555149 ?auto_2555146 ?auto_2555151 ?auto_2555150 ?auto_2555152 ?auto_2555153 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2594436 - DIRECTION
      ?auto_2594437 - MODE
      ?auto_2594438 - DIRECTION
      ?auto_2594435 - MODE
      ?auto_2594440 - DIRECTION
      ?auto_2594439 - MODE
      ?auto_2594441 - DIRECTION
      ?auto_2594442 - MODE
    )
    :vars
    (
      ?auto_2594445 - INSTRUMENT
      ?auto_2594446 - SATELLITE
      ?auto_2594444 - DIRECTION
      ?auto_2594443 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2594438 ?auto_2594436 ) ) ( not ( = ?auto_2594440 ?auto_2594436 ) ) ( not ( = ?auto_2594440 ?auto_2594438 ) ) ( not ( = ?auto_2594441 ?auto_2594436 ) ) ( not ( = ?auto_2594441 ?auto_2594438 ) ) ( not ( = ?auto_2594441 ?auto_2594440 ) ) ( ON_BOARD ?auto_2594445 ?auto_2594446 ) ( SUPPORTS ?auto_2594445 ?auto_2594437 ) ( not ( = ?auto_2594436 ?auto_2594444 ) ) ( HAVE_IMAGE ?auto_2594438 ?auto_2594435 ) ( not ( = ?auto_2594438 ?auto_2594444 ) ) ( not ( = ?auto_2594435 ?auto_2594437 ) ) ( CALIBRATION_TARGET ?auto_2594445 ?auto_2594444 ) ( not ( = ?auto_2594444 ?auto_2594440 ) ) ( ON_BOARD ?auto_2594443 ?auto_2594446 ) ( POWER_ON ?auto_2594443 ) ( not ( = ?auto_2594445 ?auto_2594443 ) ) ( POINTING ?auto_2594446 ?auto_2594444 ) ( HAVE_IMAGE ?auto_2594440 ?auto_2594439 ) ( HAVE_IMAGE ?auto_2594441 ?auto_2594442 ) ( not ( = ?auto_2594437 ?auto_2594439 ) ) ( not ( = ?auto_2594437 ?auto_2594442 ) ) ( not ( = ?auto_2594435 ?auto_2594439 ) ) ( not ( = ?auto_2594435 ?auto_2594442 ) ) ( not ( = ?auto_2594439 ?auto_2594442 ) ) ( not ( = ?auto_2594441 ?auto_2594444 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2594438 ?auto_2594435 ?auto_2594436 ?auto_2594437 )
      ( GET-4IMAGE-VERIFY ?auto_2594436 ?auto_2594437 ?auto_2594438 ?auto_2594435 ?auto_2594440 ?auto_2594439 ?auto_2594441 ?auto_2594442 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2557350 - DIRECTION
      ?auto_2557351 - MODE
      ?auto_2557352 - DIRECTION
      ?auto_2557349 - MODE
      ?auto_2557354 - DIRECTION
      ?auto_2557353 - MODE
      ?auto_2557355 - DIRECTION
      ?auto_2557356 - MODE
    )
    :vars
    (
      ?auto_2557357 - INSTRUMENT
      ?auto_2557359 - SATELLITE
      ?auto_2557361 - DIRECTION
      ?auto_2557358 - DIRECTION
      ?auto_2557360 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2557352 ?auto_2557350 ) ) ( not ( = ?auto_2557354 ?auto_2557350 ) ) ( not ( = ?auto_2557354 ?auto_2557352 ) ) ( not ( = ?auto_2557355 ?auto_2557350 ) ) ( not ( = ?auto_2557355 ?auto_2557352 ) ) ( not ( = ?auto_2557355 ?auto_2557354 ) ) ( ON_BOARD ?auto_2557357 ?auto_2557359 ) ( SUPPORTS ?auto_2557357 ?auto_2557351 ) ( not ( = ?auto_2557350 ?auto_2557361 ) ) ( HAVE_IMAGE ?auto_2557354 ?auto_2557353 ) ( not ( = ?auto_2557354 ?auto_2557361 ) ) ( not ( = ?auto_2557353 ?auto_2557351 ) ) ( CALIBRATION_TARGET ?auto_2557357 ?auto_2557361 ) ( not ( = ?auto_2557361 ?auto_2557358 ) ) ( not ( = ?auto_2557350 ?auto_2557358 ) ) ( not ( = ?auto_2557354 ?auto_2557358 ) ) ( ON_BOARD ?auto_2557360 ?auto_2557359 ) ( POWER_ON ?auto_2557360 ) ( not ( = ?auto_2557357 ?auto_2557360 ) ) ( POINTING ?auto_2557359 ?auto_2557361 ) ( HAVE_IMAGE ?auto_2557352 ?auto_2557349 ) ( HAVE_IMAGE ?auto_2557355 ?auto_2557356 ) ( not ( = ?auto_2557351 ?auto_2557349 ) ) ( not ( = ?auto_2557351 ?auto_2557356 ) ) ( not ( = ?auto_2557352 ?auto_2557361 ) ) ( not ( = ?auto_2557352 ?auto_2557358 ) ) ( not ( = ?auto_2557349 ?auto_2557353 ) ) ( not ( = ?auto_2557349 ?auto_2557356 ) ) ( not ( = ?auto_2557353 ?auto_2557356 ) ) ( not ( = ?auto_2557355 ?auto_2557361 ) ) ( not ( = ?auto_2557355 ?auto_2557358 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2557354 ?auto_2557353 ?auto_2557350 ?auto_2557351 )
      ( GET-4IMAGE-VERIFY ?auto_2557350 ?auto_2557351 ?auto_2557352 ?auto_2557349 ?auto_2557354 ?auto_2557353 ?auto_2557355 ?auto_2557356 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_2557460 - DIRECTION
      ?auto_2557461 - MODE
      ?auto_2557462 - DIRECTION
      ?auto_2557459 - MODE
      ?auto_2557464 - DIRECTION
      ?auto_2557463 - MODE
      ?auto_2557465 - DIRECTION
      ?auto_2557466 - MODE
    )
    :vars
    (
      ?auto_2557467 - INSTRUMENT
      ?auto_2557469 - SATELLITE
      ?auto_2557471 - DIRECTION
      ?auto_2557468 - DIRECTION
      ?auto_2557470 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_2557462 ?auto_2557460 ) ) ( not ( = ?auto_2557464 ?auto_2557460 ) ) ( not ( = ?auto_2557464 ?auto_2557462 ) ) ( not ( = ?auto_2557465 ?auto_2557460 ) ) ( not ( = ?auto_2557465 ?auto_2557462 ) ) ( not ( = ?auto_2557465 ?auto_2557464 ) ) ( ON_BOARD ?auto_2557467 ?auto_2557469 ) ( SUPPORTS ?auto_2557467 ?auto_2557461 ) ( not ( = ?auto_2557460 ?auto_2557471 ) ) ( HAVE_IMAGE ?auto_2557465 ?auto_2557466 ) ( not ( = ?auto_2557465 ?auto_2557471 ) ) ( not ( = ?auto_2557466 ?auto_2557461 ) ) ( CALIBRATION_TARGET ?auto_2557467 ?auto_2557471 ) ( not ( = ?auto_2557471 ?auto_2557468 ) ) ( not ( = ?auto_2557460 ?auto_2557468 ) ) ( not ( = ?auto_2557465 ?auto_2557468 ) ) ( ON_BOARD ?auto_2557470 ?auto_2557469 ) ( POWER_ON ?auto_2557470 ) ( not ( = ?auto_2557467 ?auto_2557470 ) ) ( POINTING ?auto_2557469 ?auto_2557471 ) ( HAVE_IMAGE ?auto_2557462 ?auto_2557459 ) ( HAVE_IMAGE ?auto_2557464 ?auto_2557463 ) ( not ( = ?auto_2557461 ?auto_2557459 ) ) ( not ( = ?auto_2557461 ?auto_2557463 ) ) ( not ( = ?auto_2557462 ?auto_2557471 ) ) ( not ( = ?auto_2557462 ?auto_2557468 ) ) ( not ( = ?auto_2557459 ?auto_2557463 ) ) ( not ( = ?auto_2557459 ?auto_2557466 ) ) ( not ( = ?auto_2557464 ?auto_2557471 ) ) ( not ( = ?auto_2557464 ?auto_2557468 ) ) ( not ( = ?auto_2557463 ?auto_2557466 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_2557465 ?auto_2557466 ?auto_2557460 ?auto_2557461 )
      ( GET-4IMAGE-VERIFY ?auto_2557460 ?auto_2557461 ?auto_2557462 ?auto_2557459 ?auto_2557464 ?auto_2557463 ?auto_2557465 ?auto_2557466 ) )
  )

)

