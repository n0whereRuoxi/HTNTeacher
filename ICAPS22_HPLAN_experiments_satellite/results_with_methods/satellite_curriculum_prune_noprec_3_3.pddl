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
      ?auto_1513 - DIRECTION
      ?auto_1514 - MODE
    )
    :vars
    (
      ?auto_1515 - INSTRUMENT
      ?auto_1516 - SATELLITE
      ?auto_1517 - DIRECTION
      ?auto_1518 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1515 ?auto_1516 ) ( SUPPORTS ?auto_1515 ?auto_1514 ) ( not ( = ?auto_1513 ?auto_1517 ) ) ( CALIBRATION_TARGET ?auto_1515 ?auto_1517 ) ( POWER_AVAIL ?auto_1516 ) ( POINTING ?auto_1516 ?auto_1518 ) ( not ( = ?auto_1517 ?auto_1518 ) ) ( not ( = ?auto_1513 ?auto_1518 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1516 ?auto_1517 ?auto_1518 )
      ( !SWITCH_ON ?auto_1515 ?auto_1516 )
      ( !CALIBRATE ?auto_1516 ?auto_1515 ?auto_1517 )
      ( !TURN_TO ?auto_1516 ?auto_1513 ?auto_1517 )
      ( !TAKE_IMAGE ?auto_1516 ?auto_1513 ?auto_1515 ?auto_1514 )
      ( GET-1IMAGE-VERIFY ?auto_1513 ?auto_1514 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1521 - DIRECTION
      ?auto_1522 - MODE
    )
    :vars
    (
      ?auto_1523 - INSTRUMENT
      ?auto_1524 - SATELLITE
      ?auto_1525 - DIRECTION
      ?auto_1526 - DIRECTION
      ?auto_1527 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1523 ?auto_1524 ) ( SUPPORTS ?auto_1523 ?auto_1522 ) ( not ( = ?auto_1521 ?auto_1525 ) ) ( CALIBRATION_TARGET ?auto_1523 ?auto_1525 ) ( POINTING ?auto_1524 ?auto_1526 ) ( not ( = ?auto_1525 ?auto_1526 ) ) ( ON_BOARD ?auto_1527 ?auto_1524 ) ( POWER_ON ?auto_1527 ) ( not ( = ?auto_1521 ?auto_1526 ) ) ( not ( = ?auto_1523 ?auto_1527 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_1527 ?auto_1524 )
      ( !TURN_TO ?auto_1524 ?auto_1525 ?auto_1526 )
      ( !SWITCH_ON ?auto_1523 ?auto_1524 )
      ( !CALIBRATE ?auto_1524 ?auto_1523 ?auto_1525 )
      ( !TURN_TO ?auto_1524 ?auto_1521 ?auto_1525 )
      ( !TAKE_IMAGE ?auto_1524 ?auto_1521 ?auto_1523 ?auto_1522 )
      ( GET-1IMAGE-VERIFY ?auto_1521 ?auto_1522 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1540 - DIRECTION
      ?auto_1541 - MODE
      ?auto_1543 - DIRECTION
      ?auto_1542 - MODE
    )
    :vars
    (
      ?auto_1544 - INSTRUMENT
      ?auto_1546 - SATELLITE
      ?auto_1545 - DIRECTION
      ?auto_1547 - INSTRUMENT
      ?auto_1548 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1544 ?auto_1546 ) ( SUPPORTS ?auto_1544 ?auto_1542 ) ( not ( = ?auto_1543 ?auto_1545 ) ) ( CALIBRATION_TARGET ?auto_1544 ?auto_1545 ) ( not ( = ?auto_1545 ?auto_1540 ) ) ( ON_BOARD ?auto_1547 ?auto_1546 ) ( not ( = ?auto_1543 ?auto_1540 ) ) ( not ( = ?auto_1544 ?auto_1547 ) ) ( SUPPORTS ?auto_1547 ?auto_1541 ) ( CALIBRATION_TARGET ?auto_1547 ?auto_1545 ) ( POWER_AVAIL ?auto_1546 ) ( POINTING ?auto_1546 ?auto_1548 ) ( not ( = ?auto_1545 ?auto_1548 ) ) ( not ( = ?auto_1540 ?auto_1548 ) ) ( not ( = ?auto_1541 ?auto_1542 ) ) ( not ( = ?auto_1543 ?auto_1548 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1540 ?auto_1541 )
      ( GET-1IMAGE ?auto_1543 ?auto_1542 )
      ( GET-2IMAGE-VERIFY ?auto_1540 ?auto_1541 ?auto_1543 ?auto_1542 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1701 - DIRECTION
      ?auto_1702 - MODE
      ?auto_1704 - DIRECTION
      ?auto_1703 - MODE
      ?auto_1705 - DIRECTION
      ?auto_1706 - MODE
    )
    :vars
    (
      ?auto_1707 - INSTRUMENT
      ?auto_1710 - SATELLITE
      ?auto_1709 - DIRECTION
      ?auto_1708 - INSTRUMENT
      ?auto_1712 - INSTRUMENT
      ?auto_1711 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1707 ?auto_1710 ) ( SUPPORTS ?auto_1707 ?auto_1706 ) ( not ( = ?auto_1705 ?auto_1709 ) ) ( CALIBRATION_TARGET ?auto_1707 ?auto_1709 ) ( not ( = ?auto_1709 ?auto_1704 ) ) ( ON_BOARD ?auto_1708 ?auto_1710 ) ( not ( = ?auto_1705 ?auto_1704 ) ) ( not ( = ?auto_1707 ?auto_1708 ) ) ( SUPPORTS ?auto_1708 ?auto_1703 ) ( CALIBRATION_TARGET ?auto_1708 ?auto_1709 ) ( not ( = ?auto_1709 ?auto_1701 ) ) ( ON_BOARD ?auto_1712 ?auto_1710 ) ( not ( = ?auto_1704 ?auto_1701 ) ) ( not ( = ?auto_1708 ?auto_1712 ) ) ( SUPPORTS ?auto_1712 ?auto_1702 ) ( CALIBRATION_TARGET ?auto_1712 ?auto_1709 ) ( POWER_AVAIL ?auto_1710 ) ( POINTING ?auto_1710 ?auto_1711 ) ( not ( = ?auto_1709 ?auto_1711 ) ) ( not ( = ?auto_1701 ?auto_1711 ) ) ( not ( = ?auto_1702 ?auto_1703 ) ) ( not ( = ?auto_1704 ?auto_1711 ) ) ( not ( = ?auto_1701 ?auto_1705 ) ) ( not ( = ?auto_1702 ?auto_1706 ) ) ( not ( = ?auto_1703 ?auto_1706 ) ) ( not ( = ?auto_1705 ?auto_1711 ) ) ( not ( = ?auto_1707 ?auto_1712 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1701 ?auto_1702 ?auto_1704 ?auto_1703 )
      ( GET-1IMAGE ?auto_1705 ?auto_1706 )
      ( GET-3IMAGE-VERIFY ?auto_1701 ?auto_1702 ?auto_1704 ?auto_1703 ?auto_1705 ?auto_1706 ) )
  )

)

