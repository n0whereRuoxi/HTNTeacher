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
      ?auto_232036 - DIRECTION
      ?auto_232037 - MODE
    )
    :vars
    (
      ?auto_232038 - INSTRUMENT
      ?auto_232039 - SATELLITE
      ?auto_232040 - DIRECTION
      ?auto_232041 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_232038 ?auto_232039 ) ( SUPPORTS ?auto_232038 ?auto_232037 ) ( not ( = ?auto_232036 ?auto_232040 ) ) ( CALIBRATION_TARGET ?auto_232038 ?auto_232040 ) ( POWER_AVAIL ?auto_232039 ) ( POINTING ?auto_232039 ?auto_232041 ) ( not ( = ?auto_232040 ?auto_232041 ) ) ( not ( = ?auto_232036 ?auto_232041 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_232039 ?auto_232040 ?auto_232041 )
      ( !SWITCH_ON ?auto_232038 ?auto_232039 )
      ( !CALIBRATE ?auto_232039 ?auto_232038 ?auto_232040 )
      ( !TURN_TO ?auto_232039 ?auto_232036 ?auto_232040 )
      ( !TAKE_IMAGE ?auto_232039 ?auto_232036 ?auto_232038 ?auto_232037 )
      ( GET-1IMAGE-VERIFY ?auto_232036 ?auto_232037 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_232044 - DIRECTION
      ?auto_232045 - MODE
    )
    :vars
    (
      ?auto_232046 - INSTRUMENT
      ?auto_232047 - SATELLITE
      ?auto_232048 - DIRECTION
      ?auto_232049 - DIRECTION
      ?auto_232050 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_232046 ?auto_232047 ) ( SUPPORTS ?auto_232046 ?auto_232045 ) ( not ( = ?auto_232044 ?auto_232048 ) ) ( CALIBRATION_TARGET ?auto_232046 ?auto_232048 ) ( POINTING ?auto_232047 ?auto_232049 ) ( not ( = ?auto_232048 ?auto_232049 ) ) ( ON_BOARD ?auto_232050 ?auto_232047 ) ( POWER_ON ?auto_232050 ) ( not ( = ?auto_232044 ?auto_232049 ) ) ( not ( = ?auto_232046 ?auto_232050 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_232050 ?auto_232047 )
      ( !TURN_TO ?auto_232047 ?auto_232048 ?auto_232049 )
      ( !SWITCH_ON ?auto_232046 ?auto_232047 )
      ( !CALIBRATE ?auto_232047 ?auto_232046 ?auto_232048 )
      ( !TURN_TO ?auto_232047 ?auto_232044 ?auto_232048 )
      ( !TAKE_IMAGE ?auto_232047 ?auto_232044 ?auto_232046 ?auto_232045 )
      ( GET-1IMAGE-VERIFY ?auto_232044 ?auto_232045 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_232063 - DIRECTION
      ?auto_232064 - MODE
      ?auto_232066 - DIRECTION
      ?auto_232065 - MODE
    )
    :vars
    (
      ?auto_232069 - INSTRUMENT
      ?auto_232070 - SATELLITE
      ?auto_232067 - DIRECTION
      ?auto_232068 - INSTRUMENT
      ?auto_232071 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_232066 ?auto_232063 ) ) ( ON_BOARD ?auto_232069 ?auto_232070 ) ( SUPPORTS ?auto_232069 ?auto_232065 ) ( not ( = ?auto_232066 ?auto_232067 ) ) ( CALIBRATION_TARGET ?auto_232069 ?auto_232067 ) ( not ( = ?auto_232067 ?auto_232063 ) ) ( ON_BOARD ?auto_232068 ?auto_232070 ) ( not ( = ?auto_232069 ?auto_232068 ) ) ( SUPPORTS ?auto_232068 ?auto_232064 ) ( CALIBRATION_TARGET ?auto_232068 ?auto_232067 ) ( POWER_AVAIL ?auto_232070 ) ( POINTING ?auto_232070 ?auto_232071 ) ( not ( = ?auto_232067 ?auto_232071 ) ) ( not ( = ?auto_232063 ?auto_232071 ) ) ( not ( = ?auto_232064 ?auto_232065 ) ) ( not ( = ?auto_232066 ?auto_232071 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_232063 ?auto_232064 )
      ( GET-1IMAGE ?auto_232066 ?auto_232065 )
      ( GET-2IMAGE-VERIFY ?auto_232063 ?auto_232064 ?auto_232066 ?auto_232065 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_232224 - DIRECTION
      ?auto_232225 - MODE
      ?auto_232227 - DIRECTION
      ?auto_232226 - MODE
      ?auto_232228 - DIRECTION
      ?auto_232229 - MODE
    )
    :vars
    (
      ?auto_232233 - INSTRUMENT
      ?auto_232230 - SATELLITE
      ?auto_232232 - DIRECTION
      ?auto_232231 - INSTRUMENT
      ?auto_232234 - INSTRUMENT
      ?auto_232235 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_232227 ?auto_232224 ) ) ( not ( = ?auto_232228 ?auto_232224 ) ) ( not ( = ?auto_232228 ?auto_232227 ) ) ( ON_BOARD ?auto_232233 ?auto_232230 ) ( SUPPORTS ?auto_232233 ?auto_232229 ) ( not ( = ?auto_232228 ?auto_232232 ) ) ( CALIBRATION_TARGET ?auto_232233 ?auto_232232 ) ( not ( = ?auto_232232 ?auto_232227 ) ) ( ON_BOARD ?auto_232231 ?auto_232230 ) ( not ( = ?auto_232233 ?auto_232231 ) ) ( SUPPORTS ?auto_232231 ?auto_232226 ) ( CALIBRATION_TARGET ?auto_232231 ?auto_232232 ) ( not ( = ?auto_232232 ?auto_232224 ) ) ( ON_BOARD ?auto_232234 ?auto_232230 ) ( not ( = ?auto_232231 ?auto_232234 ) ) ( SUPPORTS ?auto_232234 ?auto_232225 ) ( CALIBRATION_TARGET ?auto_232234 ?auto_232232 ) ( POWER_AVAIL ?auto_232230 ) ( POINTING ?auto_232230 ?auto_232235 ) ( not ( = ?auto_232232 ?auto_232235 ) ) ( not ( = ?auto_232224 ?auto_232235 ) ) ( not ( = ?auto_232225 ?auto_232226 ) ) ( not ( = ?auto_232227 ?auto_232235 ) ) ( not ( = ?auto_232225 ?auto_232229 ) ) ( not ( = ?auto_232226 ?auto_232229 ) ) ( not ( = ?auto_232228 ?auto_232235 ) ) ( not ( = ?auto_232233 ?auto_232234 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_232224 ?auto_232225 ?auto_232227 ?auto_232226 )
      ( GET-1IMAGE ?auto_232228 ?auto_232229 )
      ( GET-3IMAGE-VERIFY ?auto_232224 ?auto_232225 ?auto_232227 ?auto_232226 ?auto_232228 ?auto_232229 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_234004 - DIRECTION
      ?auto_234005 - MODE
      ?auto_234007 - DIRECTION
      ?auto_234006 - MODE
      ?auto_234008 - DIRECTION
      ?auto_234009 - MODE
      ?auto_234010 - DIRECTION
      ?auto_234011 - MODE
    )
    :vars
    (
      ?auto_234014 - INSTRUMENT
      ?auto_234013 - SATELLITE
      ?auto_234015 - DIRECTION
      ?auto_234012 - INSTRUMENT
      ?auto_234017 - INSTRUMENT
      ?auto_234018 - INSTRUMENT
      ?auto_234016 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_234007 ?auto_234004 ) ) ( not ( = ?auto_234008 ?auto_234004 ) ) ( not ( = ?auto_234008 ?auto_234007 ) ) ( not ( = ?auto_234010 ?auto_234004 ) ) ( not ( = ?auto_234010 ?auto_234007 ) ) ( not ( = ?auto_234010 ?auto_234008 ) ) ( ON_BOARD ?auto_234014 ?auto_234013 ) ( SUPPORTS ?auto_234014 ?auto_234011 ) ( not ( = ?auto_234010 ?auto_234015 ) ) ( CALIBRATION_TARGET ?auto_234014 ?auto_234015 ) ( not ( = ?auto_234015 ?auto_234008 ) ) ( ON_BOARD ?auto_234012 ?auto_234013 ) ( not ( = ?auto_234014 ?auto_234012 ) ) ( SUPPORTS ?auto_234012 ?auto_234009 ) ( CALIBRATION_TARGET ?auto_234012 ?auto_234015 ) ( not ( = ?auto_234015 ?auto_234007 ) ) ( ON_BOARD ?auto_234017 ?auto_234013 ) ( not ( = ?auto_234012 ?auto_234017 ) ) ( SUPPORTS ?auto_234017 ?auto_234006 ) ( CALIBRATION_TARGET ?auto_234017 ?auto_234015 ) ( not ( = ?auto_234015 ?auto_234004 ) ) ( ON_BOARD ?auto_234018 ?auto_234013 ) ( not ( = ?auto_234017 ?auto_234018 ) ) ( SUPPORTS ?auto_234018 ?auto_234005 ) ( CALIBRATION_TARGET ?auto_234018 ?auto_234015 ) ( POWER_AVAIL ?auto_234013 ) ( POINTING ?auto_234013 ?auto_234016 ) ( not ( = ?auto_234015 ?auto_234016 ) ) ( not ( = ?auto_234004 ?auto_234016 ) ) ( not ( = ?auto_234005 ?auto_234006 ) ) ( not ( = ?auto_234007 ?auto_234016 ) ) ( not ( = ?auto_234005 ?auto_234009 ) ) ( not ( = ?auto_234006 ?auto_234009 ) ) ( not ( = ?auto_234008 ?auto_234016 ) ) ( not ( = ?auto_234012 ?auto_234018 ) ) ( not ( = ?auto_234005 ?auto_234011 ) ) ( not ( = ?auto_234006 ?auto_234011 ) ) ( not ( = ?auto_234009 ?auto_234011 ) ) ( not ( = ?auto_234010 ?auto_234016 ) ) ( not ( = ?auto_234014 ?auto_234017 ) ) ( not ( = ?auto_234014 ?auto_234018 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_234004 ?auto_234005 ?auto_234007 ?auto_234006 ?auto_234008 ?auto_234009 )
      ( GET-1IMAGE ?auto_234010 ?auto_234011 )
      ( GET-4IMAGE-VERIFY ?auto_234004 ?auto_234005 ?auto_234007 ?auto_234006 ?auto_234008 ?auto_234009 ?auto_234010 ?auto_234011 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_259478 - DIRECTION
      ?auto_259479 - MODE
      ?auto_259481 - DIRECTION
      ?auto_259480 - MODE
      ?auto_259482 - DIRECTION
      ?auto_259483 - MODE
      ?auto_259484 - DIRECTION
      ?auto_259485 - MODE
      ?auto_259487 - DIRECTION
      ?auto_259486 - MODE
    )
    :vars
    (
      ?auto_259489 - INSTRUMENT
      ?auto_259491 - SATELLITE
      ?auto_259490 - DIRECTION
      ?auto_259488 - INSTRUMENT
      ?auto_259494 - INSTRUMENT
      ?auto_259495 - INSTRUMENT
      ?auto_259492 - INSTRUMENT
      ?auto_259493 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_259481 ?auto_259478 ) ) ( not ( = ?auto_259482 ?auto_259478 ) ) ( not ( = ?auto_259482 ?auto_259481 ) ) ( not ( = ?auto_259484 ?auto_259478 ) ) ( not ( = ?auto_259484 ?auto_259481 ) ) ( not ( = ?auto_259484 ?auto_259482 ) ) ( not ( = ?auto_259487 ?auto_259478 ) ) ( not ( = ?auto_259487 ?auto_259481 ) ) ( not ( = ?auto_259487 ?auto_259482 ) ) ( not ( = ?auto_259487 ?auto_259484 ) ) ( ON_BOARD ?auto_259489 ?auto_259491 ) ( SUPPORTS ?auto_259489 ?auto_259486 ) ( not ( = ?auto_259487 ?auto_259490 ) ) ( CALIBRATION_TARGET ?auto_259489 ?auto_259490 ) ( not ( = ?auto_259490 ?auto_259484 ) ) ( ON_BOARD ?auto_259488 ?auto_259491 ) ( not ( = ?auto_259489 ?auto_259488 ) ) ( SUPPORTS ?auto_259488 ?auto_259485 ) ( CALIBRATION_TARGET ?auto_259488 ?auto_259490 ) ( not ( = ?auto_259490 ?auto_259482 ) ) ( ON_BOARD ?auto_259494 ?auto_259491 ) ( not ( = ?auto_259488 ?auto_259494 ) ) ( SUPPORTS ?auto_259494 ?auto_259483 ) ( CALIBRATION_TARGET ?auto_259494 ?auto_259490 ) ( not ( = ?auto_259490 ?auto_259481 ) ) ( ON_BOARD ?auto_259495 ?auto_259491 ) ( not ( = ?auto_259494 ?auto_259495 ) ) ( SUPPORTS ?auto_259495 ?auto_259480 ) ( CALIBRATION_TARGET ?auto_259495 ?auto_259490 ) ( not ( = ?auto_259490 ?auto_259478 ) ) ( ON_BOARD ?auto_259492 ?auto_259491 ) ( not ( = ?auto_259495 ?auto_259492 ) ) ( SUPPORTS ?auto_259492 ?auto_259479 ) ( CALIBRATION_TARGET ?auto_259492 ?auto_259490 ) ( POWER_AVAIL ?auto_259491 ) ( POINTING ?auto_259491 ?auto_259493 ) ( not ( = ?auto_259490 ?auto_259493 ) ) ( not ( = ?auto_259478 ?auto_259493 ) ) ( not ( = ?auto_259479 ?auto_259480 ) ) ( not ( = ?auto_259481 ?auto_259493 ) ) ( not ( = ?auto_259479 ?auto_259483 ) ) ( not ( = ?auto_259480 ?auto_259483 ) ) ( not ( = ?auto_259482 ?auto_259493 ) ) ( not ( = ?auto_259494 ?auto_259492 ) ) ( not ( = ?auto_259479 ?auto_259485 ) ) ( not ( = ?auto_259480 ?auto_259485 ) ) ( not ( = ?auto_259483 ?auto_259485 ) ) ( not ( = ?auto_259484 ?auto_259493 ) ) ( not ( = ?auto_259488 ?auto_259495 ) ) ( not ( = ?auto_259488 ?auto_259492 ) ) ( not ( = ?auto_259479 ?auto_259486 ) ) ( not ( = ?auto_259480 ?auto_259486 ) ) ( not ( = ?auto_259483 ?auto_259486 ) ) ( not ( = ?auto_259485 ?auto_259486 ) ) ( not ( = ?auto_259487 ?auto_259493 ) ) ( not ( = ?auto_259489 ?auto_259494 ) ) ( not ( = ?auto_259489 ?auto_259495 ) ) ( not ( = ?auto_259489 ?auto_259492 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_259478 ?auto_259479 ?auto_259481 ?auto_259480 ?auto_259482 ?auto_259483 ?auto_259484 ?auto_259485 )
      ( GET-1IMAGE ?auto_259487 ?auto_259486 )
      ( GET-5IMAGE-VERIFY ?auto_259478 ?auto_259479 ?auto_259481 ?auto_259480 ?auto_259482 ?auto_259483 ?auto_259484 ?auto_259485 ?auto_259487 ?auto_259486 ) )
  )

)

