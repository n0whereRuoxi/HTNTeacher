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

  ( :method GET-6IMAGE-VERIFY
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
      ?goal_dir6 - DIRECTION
      ?goal_mode6 - MODE
    )
    :precondition
    ( and ( HAVE_IMAGE ?goal_dir1 ?goal_mode1 ) ( HAVE_IMAGE ?goal_dir2 ?goal_mode2 ) ( HAVE_IMAGE ?goal_dir3 ?goal_mode3 ) ( HAVE_IMAGE ?goal_dir4 ?goal_mode4 ) ( HAVE_IMAGE ?goal_dir5 ?goal_mode5 ) ( HAVE_IMAGE ?goal_dir6 ?goal_mode6 ) )
    :subtasks
    (  )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3974579 - DIRECTION
      ?auto_3974580 - MODE
    )
    :vars
    (
      ?auto_3974581 - INSTRUMENT
      ?auto_3974582 - SATELLITE
      ?auto_3974583 - DIRECTION
      ?auto_3974584 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_3974581 ?auto_3974582 ) ( SUPPORTS ?auto_3974581 ?auto_3974580 ) ( not ( = ?auto_3974579 ?auto_3974583 ) ) ( CALIBRATION_TARGET ?auto_3974581 ?auto_3974583 ) ( POWER_AVAIL ?auto_3974582 ) ( POINTING ?auto_3974582 ?auto_3974584 ) ( not ( = ?auto_3974583 ?auto_3974584 ) ) ( not ( = ?auto_3974579 ?auto_3974584 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_3974582 ?auto_3974583 ?auto_3974584 )
      ( !SWITCH_ON ?auto_3974581 ?auto_3974582 )
      ( !CALIBRATE ?auto_3974582 ?auto_3974581 ?auto_3974583 )
      ( !TURN_TO ?auto_3974582 ?auto_3974579 ?auto_3974583 )
      ( !TAKE_IMAGE ?auto_3974582 ?auto_3974579 ?auto_3974581 ?auto_3974580 )
      ( GET-1IMAGE-VERIFY ?auto_3974579 ?auto_3974580 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_3974587 - DIRECTION
      ?auto_3974588 - MODE
    )
    :vars
    (
      ?auto_3974589 - INSTRUMENT
      ?auto_3974590 - SATELLITE
      ?auto_3974591 - DIRECTION
      ?auto_3974592 - DIRECTION
      ?auto_3974593 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_3974589 ?auto_3974590 ) ( SUPPORTS ?auto_3974589 ?auto_3974588 ) ( not ( = ?auto_3974587 ?auto_3974591 ) ) ( CALIBRATION_TARGET ?auto_3974589 ?auto_3974591 ) ( POINTING ?auto_3974590 ?auto_3974592 ) ( not ( = ?auto_3974591 ?auto_3974592 ) ) ( ON_BOARD ?auto_3974593 ?auto_3974590 ) ( POWER_ON ?auto_3974593 ) ( not ( = ?auto_3974587 ?auto_3974592 ) ) ( not ( = ?auto_3974589 ?auto_3974593 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_3974593 ?auto_3974590 )
      ( !TURN_TO ?auto_3974590 ?auto_3974591 ?auto_3974592 )
      ( !SWITCH_ON ?auto_3974589 ?auto_3974590 )
      ( !CALIBRATE ?auto_3974590 ?auto_3974589 ?auto_3974591 )
      ( !TURN_TO ?auto_3974590 ?auto_3974587 ?auto_3974591 )
      ( !TAKE_IMAGE ?auto_3974590 ?auto_3974587 ?auto_3974589 ?auto_3974588 )
      ( GET-1IMAGE-VERIFY ?auto_3974587 ?auto_3974588 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_3974606 - DIRECTION
      ?auto_3974607 - MODE
      ?auto_3974609 - DIRECTION
      ?auto_3974608 - MODE
    )
    :vars
    (
      ?auto_3974610 - INSTRUMENT
      ?auto_3974611 - SATELLITE
      ?auto_3974613 - DIRECTION
      ?auto_3974612 - INSTRUMENT
      ?auto_3974614 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3974609 ?auto_3974606 ) ) ( ON_BOARD ?auto_3974610 ?auto_3974611 ) ( SUPPORTS ?auto_3974610 ?auto_3974608 ) ( not ( = ?auto_3974609 ?auto_3974613 ) ) ( CALIBRATION_TARGET ?auto_3974610 ?auto_3974613 ) ( not ( = ?auto_3974613 ?auto_3974606 ) ) ( ON_BOARD ?auto_3974612 ?auto_3974611 ) ( not ( = ?auto_3974610 ?auto_3974612 ) ) ( SUPPORTS ?auto_3974612 ?auto_3974607 ) ( CALIBRATION_TARGET ?auto_3974612 ?auto_3974613 ) ( POWER_AVAIL ?auto_3974611 ) ( POINTING ?auto_3974611 ?auto_3974614 ) ( not ( = ?auto_3974613 ?auto_3974614 ) ) ( not ( = ?auto_3974606 ?auto_3974614 ) ) ( not ( = ?auto_3974607 ?auto_3974608 ) ) ( not ( = ?auto_3974609 ?auto_3974614 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_3974606 ?auto_3974607 )
      ( GET-1IMAGE ?auto_3974609 ?auto_3974608 )
      ( GET-2IMAGE-VERIFY ?auto_3974606 ?auto_3974607 ?auto_3974609 ?auto_3974608 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_3974767 - DIRECTION
      ?auto_3974768 - MODE
      ?auto_3974770 - DIRECTION
      ?auto_3974769 - MODE
      ?auto_3974771 - DIRECTION
      ?auto_3974772 - MODE
    )
    :vars
    (
      ?auto_3974774 - INSTRUMENT
      ?auto_3974776 - SATELLITE
      ?auto_3974773 - DIRECTION
      ?auto_3974775 - INSTRUMENT
      ?auto_3974778 - INSTRUMENT
      ?auto_3974777 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3974770 ?auto_3974767 ) ) ( not ( = ?auto_3974771 ?auto_3974767 ) ) ( not ( = ?auto_3974771 ?auto_3974770 ) ) ( ON_BOARD ?auto_3974774 ?auto_3974776 ) ( SUPPORTS ?auto_3974774 ?auto_3974772 ) ( not ( = ?auto_3974771 ?auto_3974773 ) ) ( CALIBRATION_TARGET ?auto_3974774 ?auto_3974773 ) ( not ( = ?auto_3974773 ?auto_3974770 ) ) ( ON_BOARD ?auto_3974775 ?auto_3974776 ) ( not ( = ?auto_3974774 ?auto_3974775 ) ) ( SUPPORTS ?auto_3974775 ?auto_3974769 ) ( CALIBRATION_TARGET ?auto_3974775 ?auto_3974773 ) ( not ( = ?auto_3974773 ?auto_3974767 ) ) ( ON_BOARD ?auto_3974778 ?auto_3974776 ) ( not ( = ?auto_3974775 ?auto_3974778 ) ) ( SUPPORTS ?auto_3974778 ?auto_3974768 ) ( CALIBRATION_TARGET ?auto_3974778 ?auto_3974773 ) ( POWER_AVAIL ?auto_3974776 ) ( POINTING ?auto_3974776 ?auto_3974777 ) ( not ( = ?auto_3974773 ?auto_3974777 ) ) ( not ( = ?auto_3974767 ?auto_3974777 ) ) ( not ( = ?auto_3974768 ?auto_3974769 ) ) ( not ( = ?auto_3974770 ?auto_3974777 ) ) ( not ( = ?auto_3974768 ?auto_3974772 ) ) ( not ( = ?auto_3974769 ?auto_3974772 ) ) ( not ( = ?auto_3974771 ?auto_3974777 ) ) ( not ( = ?auto_3974774 ?auto_3974778 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_3974767 ?auto_3974768 ?auto_3974770 ?auto_3974769 )
      ( GET-1IMAGE ?auto_3974771 ?auto_3974772 )
      ( GET-3IMAGE-VERIFY ?auto_3974767 ?auto_3974768 ?auto_3974770 ?auto_3974769 ?auto_3974771 ?auto_3974772 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_3976547 - DIRECTION
      ?auto_3976548 - MODE
      ?auto_3976550 - DIRECTION
      ?auto_3976549 - MODE
      ?auto_3976551 - DIRECTION
      ?auto_3976552 - MODE
      ?auto_3976553 - DIRECTION
      ?auto_3976554 - MODE
    )
    :vars
    (
      ?auto_3976558 - INSTRUMENT
      ?auto_3976557 - SATELLITE
      ?auto_3976555 - DIRECTION
      ?auto_3976556 - INSTRUMENT
      ?auto_3976559 - INSTRUMENT
      ?auto_3976560 - INSTRUMENT
      ?auto_3976561 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_3976550 ?auto_3976547 ) ) ( not ( = ?auto_3976551 ?auto_3976547 ) ) ( not ( = ?auto_3976551 ?auto_3976550 ) ) ( not ( = ?auto_3976553 ?auto_3976547 ) ) ( not ( = ?auto_3976553 ?auto_3976550 ) ) ( not ( = ?auto_3976553 ?auto_3976551 ) ) ( ON_BOARD ?auto_3976558 ?auto_3976557 ) ( SUPPORTS ?auto_3976558 ?auto_3976554 ) ( not ( = ?auto_3976553 ?auto_3976555 ) ) ( CALIBRATION_TARGET ?auto_3976558 ?auto_3976555 ) ( not ( = ?auto_3976555 ?auto_3976551 ) ) ( ON_BOARD ?auto_3976556 ?auto_3976557 ) ( not ( = ?auto_3976558 ?auto_3976556 ) ) ( SUPPORTS ?auto_3976556 ?auto_3976552 ) ( CALIBRATION_TARGET ?auto_3976556 ?auto_3976555 ) ( not ( = ?auto_3976555 ?auto_3976550 ) ) ( ON_BOARD ?auto_3976559 ?auto_3976557 ) ( not ( = ?auto_3976556 ?auto_3976559 ) ) ( SUPPORTS ?auto_3976559 ?auto_3976549 ) ( CALIBRATION_TARGET ?auto_3976559 ?auto_3976555 ) ( not ( = ?auto_3976555 ?auto_3976547 ) ) ( ON_BOARD ?auto_3976560 ?auto_3976557 ) ( not ( = ?auto_3976559 ?auto_3976560 ) ) ( SUPPORTS ?auto_3976560 ?auto_3976548 ) ( CALIBRATION_TARGET ?auto_3976560 ?auto_3976555 ) ( POWER_AVAIL ?auto_3976557 ) ( POINTING ?auto_3976557 ?auto_3976561 ) ( not ( = ?auto_3976555 ?auto_3976561 ) ) ( not ( = ?auto_3976547 ?auto_3976561 ) ) ( not ( = ?auto_3976548 ?auto_3976549 ) ) ( not ( = ?auto_3976550 ?auto_3976561 ) ) ( not ( = ?auto_3976548 ?auto_3976552 ) ) ( not ( = ?auto_3976549 ?auto_3976552 ) ) ( not ( = ?auto_3976551 ?auto_3976561 ) ) ( not ( = ?auto_3976556 ?auto_3976560 ) ) ( not ( = ?auto_3976548 ?auto_3976554 ) ) ( not ( = ?auto_3976549 ?auto_3976554 ) ) ( not ( = ?auto_3976552 ?auto_3976554 ) ) ( not ( = ?auto_3976553 ?auto_3976561 ) ) ( not ( = ?auto_3976558 ?auto_3976559 ) ) ( not ( = ?auto_3976558 ?auto_3976560 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_3976547 ?auto_3976548 ?auto_3976550 ?auto_3976549 ?auto_3976551 ?auto_3976552 )
      ( GET-1IMAGE ?auto_3976553 ?auto_3976554 )
      ( GET-4IMAGE-VERIFY ?auto_3976547 ?auto_3976548 ?auto_3976550 ?auto_3976549 ?auto_3976551 ?auto_3976552 ?auto_3976553 ?auto_3976554 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_4002021 - DIRECTION
      ?auto_4002022 - MODE
      ?auto_4002024 - DIRECTION
      ?auto_4002023 - MODE
      ?auto_4002025 - DIRECTION
      ?auto_4002026 - MODE
      ?auto_4002027 - DIRECTION
      ?auto_4002028 - MODE
      ?auto_4002030 - DIRECTION
      ?auto_4002029 - MODE
    )
    :vars
    (
      ?auto_4002033 - INSTRUMENT
      ?auto_4002032 - SATELLITE
      ?auto_4002034 - DIRECTION
      ?auto_4002031 - INSTRUMENT
      ?auto_4002036 - INSTRUMENT
      ?auto_4002035 - INSTRUMENT
      ?auto_4002037 - INSTRUMENT
      ?auto_4002038 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4002024 ?auto_4002021 ) ) ( not ( = ?auto_4002025 ?auto_4002021 ) ) ( not ( = ?auto_4002025 ?auto_4002024 ) ) ( not ( = ?auto_4002027 ?auto_4002021 ) ) ( not ( = ?auto_4002027 ?auto_4002024 ) ) ( not ( = ?auto_4002027 ?auto_4002025 ) ) ( not ( = ?auto_4002030 ?auto_4002021 ) ) ( not ( = ?auto_4002030 ?auto_4002024 ) ) ( not ( = ?auto_4002030 ?auto_4002025 ) ) ( not ( = ?auto_4002030 ?auto_4002027 ) ) ( ON_BOARD ?auto_4002033 ?auto_4002032 ) ( SUPPORTS ?auto_4002033 ?auto_4002029 ) ( not ( = ?auto_4002030 ?auto_4002034 ) ) ( CALIBRATION_TARGET ?auto_4002033 ?auto_4002034 ) ( not ( = ?auto_4002034 ?auto_4002027 ) ) ( ON_BOARD ?auto_4002031 ?auto_4002032 ) ( not ( = ?auto_4002033 ?auto_4002031 ) ) ( SUPPORTS ?auto_4002031 ?auto_4002028 ) ( CALIBRATION_TARGET ?auto_4002031 ?auto_4002034 ) ( not ( = ?auto_4002034 ?auto_4002025 ) ) ( ON_BOARD ?auto_4002036 ?auto_4002032 ) ( not ( = ?auto_4002031 ?auto_4002036 ) ) ( SUPPORTS ?auto_4002036 ?auto_4002026 ) ( CALIBRATION_TARGET ?auto_4002036 ?auto_4002034 ) ( not ( = ?auto_4002034 ?auto_4002024 ) ) ( ON_BOARD ?auto_4002035 ?auto_4002032 ) ( not ( = ?auto_4002036 ?auto_4002035 ) ) ( SUPPORTS ?auto_4002035 ?auto_4002023 ) ( CALIBRATION_TARGET ?auto_4002035 ?auto_4002034 ) ( not ( = ?auto_4002034 ?auto_4002021 ) ) ( ON_BOARD ?auto_4002037 ?auto_4002032 ) ( not ( = ?auto_4002035 ?auto_4002037 ) ) ( SUPPORTS ?auto_4002037 ?auto_4002022 ) ( CALIBRATION_TARGET ?auto_4002037 ?auto_4002034 ) ( POWER_AVAIL ?auto_4002032 ) ( POINTING ?auto_4002032 ?auto_4002038 ) ( not ( = ?auto_4002034 ?auto_4002038 ) ) ( not ( = ?auto_4002021 ?auto_4002038 ) ) ( not ( = ?auto_4002022 ?auto_4002023 ) ) ( not ( = ?auto_4002024 ?auto_4002038 ) ) ( not ( = ?auto_4002022 ?auto_4002026 ) ) ( not ( = ?auto_4002023 ?auto_4002026 ) ) ( not ( = ?auto_4002025 ?auto_4002038 ) ) ( not ( = ?auto_4002036 ?auto_4002037 ) ) ( not ( = ?auto_4002022 ?auto_4002028 ) ) ( not ( = ?auto_4002023 ?auto_4002028 ) ) ( not ( = ?auto_4002026 ?auto_4002028 ) ) ( not ( = ?auto_4002027 ?auto_4002038 ) ) ( not ( = ?auto_4002031 ?auto_4002035 ) ) ( not ( = ?auto_4002031 ?auto_4002037 ) ) ( not ( = ?auto_4002022 ?auto_4002029 ) ) ( not ( = ?auto_4002023 ?auto_4002029 ) ) ( not ( = ?auto_4002026 ?auto_4002029 ) ) ( not ( = ?auto_4002028 ?auto_4002029 ) ) ( not ( = ?auto_4002030 ?auto_4002038 ) ) ( not ( = ?auto_4002033 ?auto_4002036 ) ) ( not ( = ?auto_4002033 ?auto_4002035 ) ) ( not ( = ?auto_4002033 ?auto_4002037 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_4002021 ?auto_4002022 ?auto_4002024 ?auto_4002023 ?auto_4002025 ?auto_4002026 ?auto_4002027 ?auto_4002028 )
      ( GET-1IMAGE ?auto_4002030 ?auto_4002029 )
      ( GET-5IMAGE-VERIFY ?auto_4002021 ?auto_4002022 ?auto_4002024 ?auto_4002023 ?auto_4002025 ?auto_4002026 ?auto_4002027 ?auto_4002028 ?auto_4002030 ?auto_4002029 ) )
  )

  ( :method GET-6IMAGE
    :parameters
    (
      ?auto_4438246 - DIRECTION
      ?auto_4438247 - MODE
      ?auto_4438249 - DIRECTION
      ?auto_4438248 - MODE
      ?auto_4438250 - DIRECTION
      ?auto_4438251 - MODE
      ?auto_4438252 - DIRECTION
      ?auto_4438253 - MODE
      ?auto_4438255 - DIRECTION
      ?auto_4438254 - MODE
      ?auto_4438256 - DIRECTION
      ?auto_4438257 - MODE
    )
    :vars
    (
      ?auto_4438259 - INSTRUMENT
      ?auto_4438258 - SATELLITE
      ?auto_4438260 - DIRECTION
      ?auto_4438261 - INSTRUMENT
      ?auto_4438264 - INSTRUMENT
      ?auto_4438263 - INSTRUMENT
      ?auto_4438266 - INSTRUMENT
      ?auto_4438262 - INSTRUMENT
      ?auto_4438265 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_4438249 ?auto_4438246 ) ) ( not ( = ?auto_4438250 ?auto_4438246 ) ) ( not ( = ?auto_4438250 ?auto_4438249 ) ) ( not ( = ?auto_4438252 ?auto_4438246 ) ) ( not ( = ?auto_4438252 ?auto_4438249 ) ) ( not ( = ?auto_4438252 ?auto_4438250 ) ) ( not ( = ?auto_4438255 ?auto_4438246 ) ) ( not ( = ?auto_4438255 ?auto_4438249 ) ) ( not ( = ?auto_4438255 ?auto_4438250 ) ) ( not ( = ?auto_4438255 ?auto_4438252 ) ) ( not ( = ?auto_4438256 ?auto_4438246 ) ) ( not ( = ?auto_4438256 ?auto_4438249 ) ) ( not ( = ?auto_4438256 ?auto_4438250 ) ) ( not ( = ?auto_4438256 ?auto_4438252 ) ) ( not ( = ?auto_4438256 ?auto_4438255 ) ) ( ON_BOARD ?auto_4438259 ?auto_4438258 ) ( SUPPORTS ?auto_4438259 ?auto_4438257 ) ( not ( = ?auto_4438256 ?auto_4438260 ) ) ( CALIBRATION_TARGET ?auto_4438259 ?auto_4438260 ) ( not ( = ?auto_4438260 ?auto_4438255 ) ) ( ON_BOARD ?auto_4438261 ?auto_4438258 ) ( not ( = ?auto_4438259 ?auto_4438261 ) ) ( SUPPORTS ?auto_4438261 ?auto_4438254 ) ( CALIBRATION_TARGET ?auto_4438261 ?auto_4438260 ) ( not ( = ?auto_4438260 ?auto_4438252 ) ) ( ON_BOARD ?auto_4438264 ?auto_4438258 ) ( not ( = ?auto_4438261 ?auto_4438264 ) ) ( SUPPORTS ?auto_4438264 ?auto_4438253 ) ( CALIBRATION_TARGET ?auto_4438264 ?auto_4438260 ) ( not ( = ?auto_4438260 ?auto_4438250 ) ) ( ON_BOARD ?auto_4438263 ?auto_4438258 ) ( not ( = ?auto_4438264 ?auto_4438263 ) ) ( SUPPORTS ?auto_4438263 ?auto_4438251 ) ( CALIBRATION_TARGET ?auto_4438263 ?auto_4438260 ) ( not ( = ?auto_4438260 ?auto_4438249 ) ) ( ON_BOARD ?auto_4438266 ?auto_4438258 ) ( not ( = ?auto_4438263 ?auto_4438266 ) ) ( SUPPORTS ?auto_4438266 ?auto_4438248 ) ( CALIBRATION_TARGET ?auto_4438266 ?auto_4438260 ) ( not ( = ?auto_4438260 ?auto_4438246 ) ) ( ON_BOARD ?auto_4438262 ?auto_4438258 ) ( not ( = ?auto_4438266 ?auto_4438262 ) ) ( SUPPORTS ?auto_4438262 ?auto_4438247 ) ( CALIBRATION_TARGET ?auto_4438262 ?auto_4438260 ) ( POWER_AVAIL ?auto_4438258 ) ( POINTING ?auto_4438258 ?auto_4438265 ) ( not ( = ?auto_4438260 ?auto_4438265 ) ) ( not ( = ?auto_4438246 ?auto_4438265 ) ) ( not ( = ?auto_4438247 ?auto_4438248 ) ) ( not ( = ?auto_4438249 ?auto_4438265 ) ) ( not ( = ?auto_4438247 ?auto_4438251 ) ) ( not ( = ?auto_4438248 ?auto_4438251 ) ) ( not ( = ?auto_4438250 ?auto_4438265 ) ) ( not ( = ?auto_4438263 ?auto_4438262 ) ) ( not ( = ?auto_4438247 ?auto_4438253 ) ) ( not ( = ?auto_4438248 ?auto_4438253 ) ) ( not ( = ?auto_4438251 ?auto_4438253 ) ) ( not ( = ?auto_4438252 ?auto_4438265 ) ) ( not ( = ?auto_4438264 ?auto_4438266 ) ) ( not ( = ?auto_4438264 ?auto_4438262 ) ) ( not ( = ?auto_4438247 ?auto_4438254 ) ) ( not ( = ?auto_4438248 ?auto_4438254 ) ) ( not ( = ?auto_4438251 ?auto_4438254 ) ) ( not ( = ?auto_4438253 ?auto_4438254 ) ) ( not ( = ?auto_4438255 ?auto_4438265 ) ) ( not ( = ?auto_4438261 ?auto_4438263 ) ) ( not ( = ?auto_4438261 ?auto_4438266 ) ) ( not ( = ?auto_4438261 ?auto_4438262 ) ) ( not ( = ?auto_4438247 ?auto_4438257 ) ) ( not ( = ?auto_4438248 ?auto_4438257 ) ) ( not ( = ?auto_4438251 ?auto_4438257 ) ) ( not ( = ?auto_4438253 ?auto_4438257 ) ) ( not ( = ?auto_4438254 ?auto_4438257 ) ) ( not ( = ?auto_4438256 ?auto_4438265 ) ) ( not ( = ?auto_4438259 ?auto_4438264 ) ) ( not ( = ?auto_4438259 ?auto_4438263 ) ) ( not ( = ?auto_4438259 ?auto_4438266 ) ) ( not ( = ?auto_4438259 ?auto_4438262 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_4438246 ?auto_4438247 ?auto_4438249 ?auto_4438248 ?auto_4438250 ?auto_4438251 ?auto_4438252 ?auto_4438253 ?auto_4438255 ?auto_4438254 )
      ( GET-1IMAGE ?auto_4438256 ?auto_4438257 )
      ( GET-6IMAGE-VERIFY ?auto_4438246 ?auto_4438247 ?auto_4438249 ?auto_4438248 ?auto_4438250 ?auto_4438251 ?auto_4438252 ?auto_4438253 ?auto_4438255 ?auto_4438254 ?auto_4438256 ?auto_4438257 ) )
  )

)

