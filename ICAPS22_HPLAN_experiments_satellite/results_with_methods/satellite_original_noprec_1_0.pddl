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

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_2 - DIRECTION
      ?auto_3 - MODE
    )
    :vars
    (
      ?auto_4 - INSTRUMENT
      ?auto_5 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_4 ) ( ON_BOARD ?auto_4 ?auto_5 ) ( SUPPORTS ?auto_4 ?auto_3 ) ( POWER_ON ?auto_4 ) ( POINTING ?auto_5 ?auto_2 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_5 ?auto_2 ?auto_4 ?auto_3 )
      ( GET-1IMAGE-VERIFY ?auto_2 ?auto_3 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_6 - DIRECTION
      ?auto_7 - MODE
    )
    :vars
    (
      ?auto_9 - INSTRUMENT
      ?auto_8 - SATELLITE
      ?auto_10 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_9 ) ( ON_BOARD ?auto_9 ?auto_8 ) ( SUPPORTS ?auto_9 ?auto_7 ) ( POWER_ON ?auto_9 ) ( POINTING ?auto_8 ?auto_10 ) ( not ( = ?auto_6 ?auto_10 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_8 ?auto_6 ?auto_10 )
      ( GET-1IMAGE ?auto_6 ?auto_7 )
      ( GET-1IMAGE-VERIFY ?auto_6 ?auto_7 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_11 - DIRECTION
      ?auto_12 - MODE
    )
    :vars
    (
      ?auto_13 - INSTRUMENT
      ?auto_15 - SATELLITE
      ?auto_14 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_13 ?auto_15 ) ( SUPPORTS ?auto_13 ?auto_12 ) ( POWER_ON ?auto_13 ) ( POINTING ?auto_15 ?auto_14 ) ( not ( = ?auto_11 ?auto_14 ) ) ( CALIBRATION_TARGET ?auto_13 ?auto_14 ) ( NOT_CALIBRATED ?auto_13 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_15 ?auto_13 ?auto_14 )
      ( GET-1IMAGE ?auto_11 ?auto_12 )
      ( GET-1IMAGE-VERIFY ?auto_11 ?auto_12 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_16 - DIRECTION
      ?auto_17 - MODE
    )
    :vars
    (
      ?auto_19 - INSTRUMENT
      ?auto_18 - SATELLITE
      ?auto_20 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_19 ?auto_18 ) ( SUPPORTS ?auto_19 ?auto_17 ) ( POINTING ?auto_18 ?auto_20 ) ( not ( = ?auto_16 ?auto_20 ) ) ( CALIBRATION_TARGET ?auto_19 ?auto_20 ) ( POWER_AVAIL ?auto_18 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_19 ?auto_18 )
      ( GET-1IMAGE ?auto_16 ?auto_17 )
      ( GET-1IMAGE-VERIFY ?auto_16 ?auto_17 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_21 - DIRECTION
      ?auto_22 - MODE
    )
    :vars
    (
      ?auto_25 - INSTRUMENT
      ?auto_24 - SATELLITE
      ?auto_23 - DIRECTION
      ?auto_26 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25 ?auto_24 ) ( SUPPORTS ?auto_25 ?auto_22 ) ( not ( = ?auto_21 ?auto_23 ) ) ( CALIBRATION_TARGET ?auto_25 ?auto_23 ) ( POWER_AVAIL ?auto_24 ) ( POINTING ?auto_24 ?auto_26 ) ( not ( = ?auto_23 ?auto_26 ) ) ( not ( = ?auto_21 ?auto_26 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_24 ?auto_23 ?auto_26 )
      ( GET-1IMAGE ?auto_21 ?auto_22 )
      ( GET-1IMAGE-VERIFY ?auto_21 ?auto_22 ) )
  )

)

