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
      ?auto_83 - DIRECTION
      ?auto_84 - MODE
    )
    :vars
    (
      ?auto_85 - INSTRUMENT
      ?auto_86 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_85 ) ( ON_BOARD ?auto_85 ?auto_86 ) ( SUPPORTS ?auto_85 ?auto_84 ) ( POWER_ON ?auto_85 ) ( POINTING ?auto_86 ?auto_83 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_86 ?auto_83 ?auto_85 ?auto_84 )
      ( GET-1IMAGE-VERIFY ?auto_83 ?auto_84 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_87 - DIRECTION
      ?auto_88 - MODE
    )
    :vars
    (
      ?auto_90 - INSTRUMENT
      ?auto_89 - SATELLITE
      ?auto_91 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_90 ) ( ON_BOARD ?auto_90 ?auto_89 ) ( SUPPORTS ?auto_90 ?auto_88 ) ( POWER_ON ?auto_90 ) ( POINTING ?auto_89 ?auto_91 ) ( not ( = ?auto_87 ?auto_91 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_89 ?auto_87 ?auto_91 )
      ( GET-1IMAGE ?auto_87 ?auto_88 )
      ( GET-1IMAGE-VERIFY ?auto_87 ?auto_88 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_92 - DIRECTION
      ?auto_93 - MODE
    )
    :vars
    (
      ?auto_94 - INSTRUMENT
      ?auto_96 - SATELLITE
      ?auto_95 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_94 ?auto_96 ) ( SUPPORTS ?auto_94 ?auto_93 ) ( POWER_ON ?auto_94 ) ( POINTING ?auto_96 ?auto_95 ) ( not ( = ?auto_92 ?auto_95 ) ) ( CALIBRATION_TARGET ?auto_94 ?auto_95 ) ( NOT_CALIBRATED ?auto_94 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_96 ?auto_94 ?auto_95 )
      ( GET-1IMAGE ?auto_92 ?auto_93 )
      ( GET-1IMAGE-VERIFY ?auto_92 ?auto_93 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_97 - DIRECTION
      ?auto_98 - MODE
    )
    :vars
    (
      ?auto_101 - INSTRUMENT
      ?auto_99 - SATELLITE
      ?auto_100 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_101 ?auto_99 ) ( SUPPORTS ?auto_101 ?auto_98 ) ( POINTING ?auto_99 ?auto_100 ) ( not ( = ?auto_97 ?auto_100 ) ) ( CALIBRATION_TARGET ?auto_101 ?auto_100 ) ( POWER_AVAIL ?auto_99 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_101 ?auto_99 )
      ( GET-1IMAGE ?auto_97 ?auto_98 )
      ( GET-1IMAGE-VERIFY ?auto_97 ?auto_98 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_102 - DIRECTION
      ?auto_103 - MODE
    )
    :vars
    (
      ?auto_106 - INSTRUMENT
      ?auto_104 - SATELLITE
      ?auto_105 - DIRECTION
      ?auto_107 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_106 ?auto_104 ) ( SUPPORTS ?auto_106 ?auto_103 ) ( not ( = ?auto_102 ?auto_105 ) ) ( CALIBRATION_TARGET ?auto_106 ?auto_105 ) ( POWER_AVAIL ?auto_104 ) ( POINTING ?auto_104 ?auto_107 ) ( not ( = ?auto_105 ?auto_107 ) ) ( not ( = ?auto_102 ?auto_107 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_104 ?auto_105 ?auto_107 )
      ( GET-1IMAGE ?auto_102 ?auto_103 )
      ( GET-1IMAGE-VERIFY ?auto_102 ?auto_103 ) )
  )

)

