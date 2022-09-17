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
      ?auto_29 - DIRECTION
      ?auto_30 - MODE
    )
    :vars
    (
      ?auto_31 - INSTRUMENT
      ?auto_32 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_31 ) ( ON_BOARD ?auto_31 ?auto_32 ) ( SUPPORTS ?auto_31 ?auto_30 ) ( POWER_ON ?auto_31 ) ( POINTING ?auto_32 ?auto_29 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_32 ?auto_29 ?auto_31 ?auto_30 )
      ( GET-1IMAGE-VERIFY ?auto_29 ?auto_30 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_33 - DIRECTION
      ?auto_34 - MODE
    )
    :vars
    (
      ?auto_36 - INSTRUMENT
      ?auto_35 - SATELLITE
      ?auto_37 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_36 ) ( ON_BOARD ?auto_36 ?auto_35 ) ( SUPPORTS ?auto_36 ?auto_34 ) ( POWER_ON ?auto_36 ) ( POINTING ?auto_35 ?auto_37 ) ( not ( = ?auto_33 ?auto_37 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_35 ?auto_33 ?auto_37 )
      ( GET-1IMAGE ?auto_33 ?auto_34 )
      ( GET-1IMAGE-VERIFY ?auto_33 ?auto_34 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_38 - DIRECTION
      ?auto_39 - MODE
    )
    :vars
    (
      ?auto_42 - INSTRUMENT
      ?auto_41 - SATELLITE
      ?auto_40 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_42 ?auto_41 ) ( SUPPORTS ?auto_42 ?auto_39 ) ( POWER_ON ?auto_42 ) ( POINTING ?auto_41 ?auto_40 ) ( not ( = ?auto_38 ?auto_40 ) ) ( CALIBRATION_TARGET ?auto_42 ?auto_40 ) ( NOT_CALIBRATED ?auto_42 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_41 ?auto_42 ?auto_40 )
      ( GET-1IMAGE ?auto_38 ?auto_39 )
      ( GET-1IMAGE-VERIFY ?auto_38 ?auto_39 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_43 - DIRECTION
      ?auto_44 - MODE
    )
    :vars
    (
      ?auto_47 - INSTRUMENT
      ?auto_46 - SATELLITE
      ?auto_45 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_47 ?auto_46 ) ( SUPPORTS ?auto_47 ?auto_44 ) ( POINTING ?auto_46 ?auto_45 ) ( not ( = ?auto_43 ?auto_45 ) ) ( CALIBRATION_TARGET ?auto_47 ?auto_45 ) ( POWER_AVAIL ?auto_46 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_47 ?auto_46 )
      ( GET-1IMAGE ?auto_43 ?auto_44 )
      ( GET-1IMAGE-VERIFY ?auto_43 ?auto_44 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_48 - DIRECTION
      ?auto_49 - MODE
    )
    :vars
    (
      ?auto_50 - INSTRUMENT
      ?auto_51 - SATELLITE
      ?auto_52 - DIRECTION
      ?auto_53 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_50 ?auto_51 ) ( SUPPORTS ?auto_50 ?auto_49 ) ( not ( = ?auto_48 ?auto_52 ) ) ( CALIBRATION_TARGET ?auto_50 ?auto_52 ) ( POWER_AVAIL ?auto_51 ) ( POINTING ?auto_51 ?auto_53 ) ( not ( = ?auto_52 ?auto_53 ) ) ( not ( = ?auto_48 ?auto_53 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_51 ?auto_52 ?auto_53 )
      ( GET-1IMAGE ?auto_48 ?auto_49 )
      ( GET-1IMAGE-VERIFY ?auto_48 ?auto_49 ) )
  )

)

