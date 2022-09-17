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
      ?auto_56 - DIRECTION
      ?auto_57 - MODE
    )
    :vars
    (
      ?auto_58 - INSTRUMENT
      ?auto_59 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_58 ) ( ON_BOARD ?auto_58 ?auto_59 ) ( SUPPORTS ?auto_58 ?auto_57 ) ( POWER_ON ?auto_58 ) ( POINTING ?auto_59 ?auto_56 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_59 ?auto_56 ?auto_58 ?auto_57 )
      ( GET-1IMAGE-VERIFY ?auto_56 ?auto_57 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_60 - DIRECTION
      ?auto_61 - MODE
    )
    :vars
    (
      ?auto_62 - INSTRUMENT
      ?auto_63 - SATELLITE
      ?auto_64 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_62 ) ( ON_BOARD ?auto_62 ?auto_63 ) ( SUPPORTS ?auto_62 ?auto_61 ) ( POWER_ON ?auto_62 ) ( POINTING ?auto_63 ?auto_64 ) ( not ( = ?auto_60 ?auto_64 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_63 ?auto_60 ?auto_64 )
      ( GET-1IMAGE ?auto_60 ?auto_61 )
      ( GET-1IMAGE-VERIFY ?auto_60 ?auto_61 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_65 - DIRECTION
      ?auto_66 - MODE
    )
    :vars
    (
      ?auto_67 - INSTRUMENT
      ?auto_68 - SATELLITE
      ?auto_69 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_67 ?auto_68 ) ( SUPPORTS ?auto_67 ?auto_66 ) ( POWER_ON ?auto_67 ) ( POINTING ?auto_68 ?auto_69 ) ( not ( = ?auto_65 ?auto_69 ) ) ( CALIBRATION_TARGET ?auto_67 ?auto_69 ) ( NOT_CALIBRATED ?auto_67 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_68 ?auto_67 ?auto_69 )
      ( GET-1IMAGE ?auto_65 ?auto_66 )
      ( GET-1IMAGE-VERIFY ?auto_65 ?auto_66 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_70 - DIRECTION
      ?auto_71 - MODE
    )
    :vars
    (
      ?auto_73 - INSTRUMENT
      ?auto_74 - SATELLITE
      ?auto_72 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_73 ?auto_74 ) ( SUPPORTS ?auto_73 ?auto_71 ) ( POINTING ?auto_74 ?auto_72 ) ( not ( = ?auto_70 ?auto_72 ) ) ( CALIBRATION_TARGET ?auto_73 ?auto_72 ) ( POWER_AVAIL ?auto_74 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_73 ?auto_74 )
      ( GET-1IMAGE ?auto_70 ?auto_71 )
      ( GET-1IMAGE-VERIFY ?auto_70 ?auto_71 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_75 - DIRECTION
      ?auto_76 - MODE
    )
    :vars
    (
      ?auto_78 - INSTRUMENT
      ?auto_79 - SATELLITE
      ?auto_77 - DIRECTION
      ?auto_80 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_78 ?auto_79 ) ( SUPPORTS ?auto_78 ?auto_76 ) ( not ( = ?auto_75 ?auto_77 ) ) ( CALIBRATION_TARGET ?auto_78 ?auto_77 ) ( POWER_AVAIL ?auto_79 ) ( POINTING ?auto_79 ?auto_80 ) ( not ( = ?auto_77 ?auto_80 ) ) ( not ( = ?auto_75 ?auto_80 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_79 ?auto_77 ?auto_80 )
      ( GET-1IMAGE ?auto_75 ?auto_76 )
      ( GET-1IMAGE-VERIFY ?auto_75 ?auto_76 ) )
  )

)

