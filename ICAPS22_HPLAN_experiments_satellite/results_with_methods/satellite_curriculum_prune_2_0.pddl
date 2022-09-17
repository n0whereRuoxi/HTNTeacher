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

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_42 - DIRECTION
      ?auto_43 - MODE
    )
    :vars
    (
      ?auto_44 - INSTRUMENT
      ?auto_45 - SATELLITE
      ?auto_46 - DIRECTION
      ?auto_47 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_44 ?auto_45 ) ( SUPPORTS ?auto_44 ?auto_43 ) ( not ( = ?auto_42 ?auto_46 ) ) ( CALIBRATION_TARGET ?auto_44 ?auto_46 ) ( POWER_AVAIL ?auto_45 ) ( POINTING ?auto_45 ?auto_47 ) ( not ( = ?auto_46 ?auto_47 ) ) ( not ( = ?auto_42 ?auto_47 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_45 ?auto_46 ?auto_47 )
      ( !SWITCH_ON ?auto_44 ?auto_45 )
      ( !CALIBRATE ?auto_45 ?auto_44 ?auto_46 )
      ( !TURN_TO ?auto_45 ?auto_42 ?auto_46 )
      ( !TAKE_IMAGE ?auto_45 ?auto_42 ?auto_44 ?auto_43 )
      ( GET-1IMAGE-VERIFY ?auto_42 ?auto_43 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_50 - DIRECTION
      ?auto_51 - MODE
    )
    :vars
    (
      ?auto_52 - INSTRUMENT
      ?auto_53 - SATELLITE
      ?auto_54 - DIRECTION
      ?auto_55 - DIRECTION
      ?auto_56 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_52 ?auto_53 ) ( SUPPORTS ?auto_52 ?auto_51 ) ( not ( = ?auto_50 ?auto_54 ) ) ( CALIBRATION_TARGET ?auto_52 ?auto_54 ) ( POINTING ?auto_53 ?auto_55 ) ( not ( = ?auto_54 ?auto_55 ) ) ( ON_BOARD ?auto_56 ?auto_53 ) ( POWER_ON ?auto_56 ) ( not ( = ?auto_50 ?auto_55 ) ) ( not ( = ?auto_52 ?auto_56 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_56 ?auto_53 )
      ( !TURN_TO ?auto_53 ?auto_54 ?auto_55 )
      ( !SWITCH_ON ?auto_52 ?auto_53 )
      ( !CALIBRATE ?auto_53 ?auto_52 ?auto_54 )
      ( !TURN_TO ?auto_53 ?auto_50 ?auto_54 )
      ( !TAKE_IMAGE ?auto_53 ?auto_50 ?auto_52 ?auto_51 )
      ( GET-1IMAGE-VERIFY ?auto_50 ?auto_51 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_69 - DIRECTION
      ?auto_70 - MODE
      ?auto_72 - DIRECTION
      ?auto_71 - MODE
    )
    :vars
    (
      ?auto_75 - INSTRUMENT
      ?auto_74 - SATELLITE
      ?auto_76 - DIRECTION
      ?auto_73 - INSTRUMENT
      ?auto_77 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_72 ?auto_69 ) ) ( ON_BOARD ?auto_75 ?auto_74 ) ( SUPPORTS ?auto_75 ?auto_71 ) ( not ( = ?auto_72 ?auto_76 ) ) ( CALIBRATION_TARGET ?auto_75 ?auto_76 ) ( not ( = ?auto_76 ?auto_69 ) ) ( ON_BOARD ?auto_73 ?auto_74 ) ( not ( = ?auto_75 ?auto_73 ) ) ( SUPPORTS ?auto_73 ?auto_70 ) ( CALIBRATION_TARGET ?auto_73 ?auto_76 ) ( POWER_AVAIL ?auto_74 ) ( POINTING ?auto_74 ?auto_77 ) ( not ( = ?auto_76 ?auto_77 ) ) ( not ( = ?auto_69 ?auto_77 ) ) ( not ( = ?auto_70 ?auto_71 ) ) ( not ( = ?auto_72 ?auto_77 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_69 ?auto_70 )
      ( GET-1IMAGE ?auto_72 ?auto_71 )
      ( GET-2IMAGE-VERIFY ?auto_69 ?auto_70 ?auto_72 ?auto_71 ) )
  )

)

