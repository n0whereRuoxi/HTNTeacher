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
      ?auto_6252116 - DIRECTION
      ?auto_6252117 - MODE
    )
    :vars
    (
      ?auto_6252118 - INSTRUMENT
      ?auto_6252119 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_6252118 ) ( ON_BOARD ?auto_6252118 ?auto_6252119 ) ( SUPPORTS ?auto_6252118 ?auto_6252117 ) ( POWER_ON ?auto_6252118 ) ( POINTING ?auto_6252119 ?auto_6252116 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_6252119 ?auto_6252116 ?auto_6252118 ?auto_6252117 )
      ( GET-1IMAGE-VERIFY ?auto_6252116 ?auto_6252117 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_6252156 - DIRECTION
      ?auto_6252157 - MODE
    )
    :vars
    (
      ?auto_6252159 - INSTRUMENT
      ?auto_6252158 - SATELLITE
      ?auto_6252160 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_6252159 ) ( ON_BOARD ?auto_6252159 ?auto_6252158 ) ( SUPPORTS ?auto_6252159 ?auto_6252157 ) ( POWER_ON ?auto_6252159 ) ( POINTING ?auto_6252158 ?auto_6252160 ) ( not ( = ?auto_6252156 ?auto_6252160 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_6252158 ?auto_6252156 ?auto_6252160 )
      ( GET-1IMAGE ?auto_6252156 ?auto_6252157 )
      ( GET-1IMAGE-VERIFY ?auto_6252156 ?auto_6252157 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_6252201 - DIRECTION
      ?auto_6252202 - MODE
    )
    :vars
    (
      ?auto_6252204 - INSTRUMENT
      ?auto_6252205 - SATELLITE
      ?auto_6252203 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_6252204 ?auto_6252205 ) ( SUPPORTS ?auto_6252204 ?auto_6252202 ) ( POWER_ON ?auto_6252204 ) ( POINTING ?auto_6252205 ?auto_6252203 ) ( not ( = ?auto_6252201 ?auto_6252203 ) ) ( CALIBRATION_TARGET ?auto_6252204 ?auto_6252203 ) ( NOT_CALIBRATED ?auto_6252204 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_6252205 ?auto_6252204 ?auto_6252203 )
      ( GET-1IMAGE ?auto_6252201 ?auto_6252202 )
      ( GET-1IMAGE-VERIFY ?auto_6252201 ?auto_6252202 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_6252246 - DIRECTION
      ?auto_6252247 - MODE
    )
    :vars
    (
      ?auto_6252248 - INSTRUMENT
      ?auto_6252250 - SATELLITE
      ?auto_6252249 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_6252248 ?auto_6252250 ) ( SUPPORTS ?auto_6252248 ?auto_6252247 ) ( POINTING ?auto_6252250 ?auto_6252249 ) ( not ( = ?auto_6252246 ?auto_6252249 ) ) ( CALIBRATION_TARGET ?auto_6252248 ?auto_6252249 ) ( POWER_AVAIL ?auto_6252250 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_6252248 ?auto_6252250 )
      ( GET-1IMAGE ?auto_6252246 ?auto_6252247 )
      ( GET-1IMAGE-VERIFY ?auto_6252246 ?auto_6252247 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_6252291 - DIRECTION
      ?auto_6252292 - MODE
    )
    :vars
    (
      ?auto_6252293 - INSTRUMENT
      ?auto_6252295 - SATELLITE
      ?auto_6252294 - DIRECTION
      ?auto_6252296 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_6252293 ?auto_6252295 ) ( SUPPORTS ?auto_6252293 ?auto_6252292 ) ( not ( = ?auto_6252291 ?auto_6252294 ) ) ( CALIBRATION_TARGET ?auto_6252293 ?auto_6252294 ) ( POWER_AVAIL ?auto_6252295 ) ( POINTING ?auto_6252295 ?auto_6252296 ) ( not ( = ?auto_6252294 ?auto_6252296 ) ) ( not ( = ?auto_6252291 ?auto_6252296 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_6252295 ?auto_6252294 ?auto_6252296 )
      ( GET-1IMAGE ?auto_6252291 ?auto_6252292 )
      ( GET-1IMAGE-VERIFY ?auto_6252291 ?auto_6252292 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6252832 - DIRECTION
      ?auto_6252833 - MODE
      ?auto_6252834 - DIRECTION
      ?auto_6252831 - MODE
    )
    :vars
    (
      ?auto_6252836 - INSTRUMENT
      ?auto_6252835 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_6252834 ?auto_6252832 ) ) ( CALIBRATED ?auto_6252836 ) ( ON_BOARD ?auto_6252836 ?auto_6252835 ) ( SUPPORTS ?auto_6252836 ?auto_6252831 ) ( POWER_ON ?auto_6252836 ) ( POINTING ?auto_6252835 ?auto_6252834 ) ( HAVE_IMAGE ?auto_6252832 ?auto_6252833 ) ( not ( = ?auto_6252833 ?auto_6252831 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6252834 ?auto_6252831 )
      ( GET-2IMAGE-VERIFY ?auto_6252832 ?auto_6252833 ?auto_6252834 ?auto_6252831 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6252838 - DIRECTION
      ?auto_6252839 - MODE
      ?auto_6252840 - DIRECTION
      ?auto_6252837 - MODE
    )
    :vars
    (
      ?auto_6252842 - INSTRUMENT
      ?auto_6252841 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_6252840 ?auto_6252838 ) ) ( CALIBRATED ?auto_6252842 ) ( ON_BOARD ?auto_6252842 ?auto_6252841 ) ( SUPPORTS ?auto_6252842 ?auto_6252839 ) ( POWER_ON ?auto_6252842 ) ( POINTING ?auto_6252841 ?auto_6252838 ) ( HAVE_IMAGE ?auto_6252840 ?auto_6252837 ) ( not ( = ?auto_6252839 ?auto_6252837 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6252838 ?auto_6252839 )
      ( GET-2IMAGE-VERIFY ?auto_6252838 ?auto_6252839 ?auto_6252840 ?auto_6252837 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6253433 - DIRECTION
      ?auto_6253434 - MODE
      ?auto_6253435 - DIRECTION
      ?auto_6253432 - MODE
    )
    :vars
    (
      ?auto_6253437 - INSTRUMENT
      ?auto_6253436 - SATELLITE
      ?auto_6253438 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6253435 ?auto_6253433 ) ) ( CALIBRATED ?auto_6253437 ) ( ON_BOARD ?auto_6253437 ?auto_6253436 ) ( SUPPORTS ?auto_6253437 ?auto_6253432 ) ( POWER_ON ?auto_6253437 ) ( POINTING ?auto_6253436 ?auto_6253438 ) ( not ( = ?auto_6253435 ?auto_6253438 ) ) ( HAVE_IMAGE ?auto_6253433 ?auto_6253434 ) ( not ( = ?auto_6253433 ?auto_6253438 ) ) ( not ( = ?auto_6253434 ?auto_6253432 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6253435 ?auto_6253432 )
      ( GET-2IMAGE-VERIFY ?auto_6253433 ?auto_6253434 ?auto_6253435 ?auto_6253432 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6253440 - DIRECTION
      ?auto_6253441 - MODE
      ?auto_6253442 - DIRECTION
      ?auto_6253439 - MODE
    )
    :vars
    (
      ?auto_6253443 - INSTRUMENT
      ?auto_6253444 - SATELLITE
      ?auto_6253445 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6253442 ?auto_6253440 ) ) ( CALIBRATED ?auto_6253443 ) ( ON_BOARD ?auto_6253443 ?auto_6253444 ) ( SUPPORTS ?auto_6253443 ?auto_6253441 ) ( POWER_ON ?auto_6253443 ) ( POINTING ?auto_6253444 ?auto_6253445 ) ( not ( = ?auto_6253440 ?auto_6253445 ) ) ( HAVE_IMAGE ?auto_6253442 ?auto_6253439 ) ( not ( = ?auto_6253442 ?auto_6253445 ) ) ( not ( = ?auto_6253439 ?auto_6253441 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6253442 ?auto_6253439 ?auto_6253440 ?auto_6253441 )
      ( GET-2IMAGE-VERIFY ?auto_6253440 ?auto_6253441 ?auto_6253442 ?auto_6253439 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_6254092 - DIRECTION
      ?auto_6254093 - MODE
    )
    :vars
    (
      ?auto_6254095 - DIRECTION
      ?auto_6254094 - INSTRUMENT
      ?auto_6254096 - SATELLITE
      ?auto_6254097 - DIRECTION
      ?auto_6254098 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_6254092 ?auto_6254095 ) ) ( ON_BOARD ?auto_6254094 ?auto_6254096 ) ( SUPPORTS ?auto_6254094 ?auto_6254093 ) ( POWER_ON ?auto_6254094 ) ( POINTING ?auto_6254096 ?auto_6254097 ) ( not ( = ?auto_6254092 ?auto_6254097 ) ) ( HAVE_IMAGE ?auto_6254095 ?auto_6254098 ) ( not ( = ?auto_6254095 ?auto_6254097 ) ) ( not ( = ?auto_6254098 ?auto_6254093 ) ) ( CALIBRATION_TARGET ?auto_6254094 ?auto_6254097 ) ( NOT_CALIBRATED ?auto_6254094 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_6254096 ?auto_6254094 ?auto_6254097 )
      ( GET-2IMAGE ?auto_6254095 ?auto_6254098 ?auto_6254092 ?auto_6254093 )
      ( GET-1IMAGE-VERIFY ?auto_6254092 ?auto_6254093 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6254100 - DIRECTION
      ?auto_6254101 - MODE
      ?auto_6254102 - DIRECTION
      ?auto_6254099 - MODE
    )
    :vars
    (
      ?auto_6254103 - INSTRUMENT
      ?auto_6254104 - SATELLITE
      ?auto_6254105 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6254102 ?auto_6254100 ) ) ( ON_BOARD ?auto_6254103 ?auto_6254104 ) ( SUPPORTS ?auto_6254103 ?auto_6254099 ) ( POWER_ON ?auto_6254103 ) ( POINTING ?auto_6254104 ?auto_6254105 ) ( not ( = ?auto_6254102 ?auto_6254105 ) ) ( HAVE_IMAGE ?auto_6254100 ?auto_6254101 ) ( not ( = ?auto_6254100 ?auto_6254105 ) ) ( not ( = ?auto_6254101 ?auto_6254099 ) ) ( CALIBRATION_TARGET ?auto_6254103 ?auto_6254105 ) ( NOT_CALIBRATED ?auto_6254103 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6254102 ?auto_6254099 )
      ( GET-2IMAGE-VERIFY ?auto_6254100 ?auto_6254101 ?auto_6254102 ?auto_6254099 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6254107 - DIRECTION
      ?auto_6254108 - MODE
      ?auto_6254109 - DIRECTION
      ?auto_6254106 - MODE
    )
    :vars
    (
      ?auto_6254111 - INSTRUMENT
      ?auto_6254112 - SATELLITE
      ?auto_6254110 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6254109 ?auto_6254107 ) ) ( ON_BOARD ?auto_6254111 ?auto_6254112 ) ( SUPPORTS ?auto_6254111 ?auto_6254108 ) ( POWER_ON ?auto_6254111 ) ( POINTING ?auto_6254112 ?auto_6254110 ) ( not ( = ?auto_6254107 ?auto_6254110 ) ) ( HAVE_IMAGE ?auto_6254109 ?auto_6254106 ) ( not ( = ?auto_6254109 ?auto_6254110 ) ) ( not ( = ?auto_6254106 ?auto_6254108 ) ) ( CALIBRATION_TARGET ?auto_6254111 ?auto_6254110 ) ( NOT_CALIBRATED ?auto_6254111 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6254109 ?auto_6254106 ?auto_6254107 ?auto_6254108 )
      ( GET-2IMAGE-VERIFY ?auto_6254107 ?auto_6254108 ?auto_6254109 ?auto_6254106 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_6254759 - DIRECTION
      ?auto_6254760 - MODE
    )
    :vars
    (
      ?auto_6254761 - DIRECTION
      ?auto_6254763 - INSTRUMENT
      ?auto_6254765 - SATELLITE
      ?auto_6254762 - DIRECTION
      ?auto_6254764 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_6254759 ?auto_6254761 ) ) ( ON_BOARD ?auto_6254763 ?auto_6254765 ) ( SUPPORTS ?auto_6254763 ?auto_6254760 ) ( POINTING ?auto_6254765 ?auto_6254762 ) ( not ( = ?auto_6254759 ?auto_6254762 ) ) ( HAVE_IMAGE ?auto_6254761 ?auto_6254764 ) ( not ( = ?auto_6254761 ?auto_6254762 ) ) ( not ( = ?auto_6254764 ?auto_6254760 ) ) ( CALIBRATION_TARGET ?auto_6254763 ?auto_6254762 ) ( POWER_AVAIL ?auto_6254765 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_6254763 ?auto_6254765 )
      ( GET-2IMAGE ?auto_6254761 ?auto_6254764 ?auto_6254759 ?auto_6254760 )
      ( GET-1IMAGE-VERIFY ?auto_6254759 ?auto_6254760 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6254767 - DIRECTION
      ?auto_6254768 - MODE
      ?auto_6254769 - DIRECTION
      ?auto_6254766 - MODE
    )
    :vars
    (
      ?auto_6254771 - INSTRUMENT
      ?auto_6254770 - SATELLITE
      ?auto_6254772 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6254769 ?auto_6254767 ) ) ( ON_BOARD ?auto_6254771 ?auto_6254770 ) ( SUPPORTS ?auto_6254771 ?auto_6254766 ) ( POINTING ?auto_6254770 ?auto_6254772 ) ( not ( = ?auto_6254769 ?auto_6254772 ) ) ( HAVE_IMAGE ?auto_6254767 ?auto_6254768 ) ( not ( = ?auto_6254767 ?auto_6254772 ) ) ( not ( = ?auto_6254768 ?auto_6254766 ) ) ( CALIBRATION_TARGET ?auto_6254771 ?auto_6254772 ) ( POWER_AVAIL ?auto_6254770 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6254769 ?auto_6254766 )
      ( GET-2IMAGE-VERIFY ?auto_6254767 ?auto_6254768 ?auto_6254769 ?auto_6254766 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6254774 - DIRECTION
      ?auto_6254775 - MODE
      ?auto_6254776 - DIRECTION
      ?auto_6254773 - MODE
    )
    :vars
    (
      ?auto_6254779 - INSTRUMENT
      ?auto_6254777 - SATELLITE
      ?auto_6254778 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6254776 ?auto_6254774 ) ) ( ON_BOARD ?auto_6254779 ?auto_6254777 ) ( SUPPORTS ?auto_6254779 ?auto_6254775 ) ( POINTING ?auto_6254777 ?auto_6254778 ) ( not ( = ?auto_6254774 ?auto_6254778 ) ) ( HAVE_IMAGE ?auto_6254776 ?auto_6254773 ) ( not ( = ?auto_6254776 ?auto_6254778 ) ) ( not ( = ?auto_6254773 ?auto_6254775 ) ) ( CALIBRATION_TARGET ?auto_6254779 ?auto_6254778 ) ( POWER_AVAIL ?auto_6254777 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6254776 ?auto_6254773 ?auto_6254774 ?auto_6254775 )
      ( GET-2IMAGE-VERIFY ?auto_6254774 ?auto_6254775 ?auto_6254776 ?auto_6254773 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_6255426 - DIRECTION
      ?auto_6255427 - MODE
    )
    :vars
    (
      ?auto_6255432 - DIRECTION
      ?auto_6255431 - INSTRUMENT
      ?auto_6255428 - SATELLITE
      ?auto_6255429 - DIRECTION
      ?auto_6255430 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_6255426 ?auto_6255432 ) ) ( ON_BOARD ?auto_6255431 ?auto_6255428 ) ( SUPPORTS ?auto_6255431 ?auto_6255427 ) ( not ( = ?auto_6255426 ?auto_6255429 ) ) ( HAVE_IMAGE ?auto_6255432 ?auto_6255430 ) ( not ( = ?auto_6255432 ?auto_6255429 ) ) ( not ( = ?auto_6255430 ?auto_6255427 ) ) ( CALIBRATION_TARGET ?auto_6255431 ?auto_6255429 ) ( POWER_AVAIL ?auto_6255428 ) ( POINTING ?auto_6255428 ?auto_6255432 ) )
    :subtasks
    ( ( !TURN_TO ?auto_6255428 ?auto_6255429 ?auto_6255432 )
      ( GET-2IMAGE ?auto_6255432 ?auto_6255430 ?auto_6255426 ?auto_6255427 )
      ( GET-1IMAGE-VERIFY ?auto_6255426 ?auto_6255427 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6255434 - DIRECTION
      ?auto_6255435 - MODE
      ?auto_6255436 - DIRECTION
      ?auto_6255433 - MODE
    )
    :vars
    (
      ?auto_6255438 - INSTRUMENT
      ?auto_6255439 - SATELLITE
      ?auto_6255437 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6255436 ?auto_6255434 ) ) ( ON_BOARD ?auto_6255438 ?auto_6255439 ) ( SUPPORTS ?auto_6255438 ?auto_6255433 ) ( not ( = ?auto_6255436 ?auto_6255437 ) ) ( HAVE_IMAGE ?auto_6255434 ?auto_6255435 ) ( not ( = ?auto_6255434 ?auto_6255437 ) ) ( not ( = ?auto_6255435 ?auto_6255433 ) ) ( CALIBRATION_TARGET ?auto_6255438 ?auto_6255437 ) ( POWER_AVAIL ?auto_6255439 ) ( POINTING ?auto_6255439 ?auto_6255434 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6255436 ?auto_6255433 )
      ( GET-2IMAGE-VERIFY ?auto_6255434 ?auto_6255435 ?auto_6255436 ?auto_6255433 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6255441 - DIRECTION
      ?auto_6255442 - MODE
      ?auto_6255443 - DIRECTION
      ?auto_6255440 - MODE
    )
    :vars
    (
      ?auto_6255444 - INSTRUMENT
      ?auto_6255445 - SATELLITE
      ?auto_6255446 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6255443 ?auto_6255441 ) ) ( ON_BOARD ?auto_6255444 ?auto_6255445 ) ( SUPPORTS ?auto_6255444 ?auto_6255442 ) ( not ( = ?auto_6255441 ?auto_6255446 ) ) ( HAVE_IMAGE ?auto_6255443 ?auto_6255440 ) ( not ( = ?auto_6255443 ?auto_6255446 ) ) ( not ( = ?auto_6255440 ?auto_6255442 ) ) ( CALIBRATION_TARGET ?auto_6255444 ?auto_6255446 ) ( POWER_AVAIL ?auto_6255445 ) ( POINTING ?auto_6255445 ?auto_6255443 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6255443 ?auto_6255440 ?auto_6255441 ?auto_6255442 )
      ( GET-2IMAGE-VERIFY ?auto_6255441 ?auto_6255442 ?auto_6255443 ?auto_6255440 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_6256093 - DIRECTION
      ?auto_6256094 - MODE
    )
    :vars
    (
      ?auto_6256095 - DIRECTION
      ?auto_6256096 - INSTRUMENT
      ?auto_6256097 - SATELLITE
      ?auto_6256098 - DIRECTION
      ?auto_6256099 - MODE
      ?auto_6256100 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6256093 ?auto_6256095 ) ) ( ON_BOARD ?auto_6256096 ?auto_6256097 ) ( SUPPORTS ?auto_6256096 ?auto_6256094 ) ( not ( = ?auto_6256093 ?auto_6256098 ) ) ( HAVE_IMAGE ?auto_6256095 ?auto_6256099 ) ( not ( = ?auto_6256095 ?auto_6256098 ) ) ( not ( = ?auto_6256099 ?auto_6256094 ) ) ( CALIBRATION_TARGET ?auto_6256096 ?auto_6256098 ) ( POINTING ?auto_6256097 ?auto_6256095 ) ( ON_BOARD ?auto_6256100 ?auto_6256097 ) ( POWER_ON ?auto_6256100 ) ( not ( = ?auto_6256096 ?auto_6256100 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_6256100 ?auto_6256097 )
      ( GET-2IMAGE ?auto_6256095 ?auto_6256099 ?auto_6256093 ?auto_6256094 )
      ( GET-1IMAGE-VERIFY ?auto_6256093 ?auto_6256094 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6256102 - DIRECTION
      ?auto_6256103 - MODE
      ?auto_6256104 - DIRECTION
      ?auto_6256101 - MODE
    )
    :vars
    (
      ?auto_6256106 - INSTRUMENT
      ?auto_6256108 - SATELLITE
      ?auto_6256105 - DIRECTION
      ?auto_6256107 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6256104 ?auto_6256102 ) ) ( ON_BOARD ?auto_6256106 ?auto_6256108 ) ( SUPPORTS ?auto_6256106 ?auto_6256101 ) ( not ( = ?auto_6256104 ?auto_6256105 ) ) ( HAVE_IMAGE ?auto_6256102 ?auto_6256103 ) ( not ( = ?auto_6256102 ?auto_6256105 ) ) ( not ( = ?auto_6256103 ?auto_6256101 ) ) ( CALIBRATION_TARGET ?auto_6256106 ?auto_6256105 ) ( POINTING ?auto_6256108 ?auto_6256102 ) ( ON_BOARD ?auto_6256107 ?auto_6256108 ) ( POWER_ON ?auto_6256107 ) ( not ( = ?auto_6256106 ?auto_6256107 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6256104 ?auto_6256101 )
      ( GET-2IMAGE-VERIFY ?auto_6256102 ?auto_6256103 ?auto_6256104 ?auto_6256101 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6256110 - DIRECTION
      ?auto_6256111 - MODE
      ?auto_6256112 - DIRECTION
      ?auto_6256109 - MODE
    )
    :vars
    (
      ?auto_6256115 - INSTRUMENT
      ?auto_6256114 - SATELLITE
      ?auto_6256116 - DIRECTION
      ?auto_6256113 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6256112 ?auto_6256110 ) ) ( ON_BOARD ?auto_6256115 ?auto_6256114 ) ( SUPPORTS ?auto_6256115 ?auto_6256111 ) ( not ( = ?auto_6256110 ?auto_6256116 ) ) ( HAVE_IMAGE ?auto_6256112 ?auto_6256109 ) ( not ( = ?auto_6256112 ?auto_6256116 ) ) ( not ( = ?auto_6256109 ?auto_6256111 ) ) ( CALIBRATION_TARGET ?auto_6256115 ?auto_6256116 ) ( POINTING ?auto_6256114 ?auto_6256112 ) ( ON_BOARD ?auto_6256113 ?auto_6256114 ) ( POWER_ON ?auto_6256113 ) ( not ( = ?auto_6256115 ?auto_6256113 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6256112 ?auto_6256109 ?auto_6256110 ?auto_6256111 )
      ( GET-2IMAGE-VERIFY ?auto_6256110 ?auto_6256111 ?auto_6256112 ?auto_6256109 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_6256817 - DIRECTION
      ?auto_6256818 - MODE
    )
    :vars
    (
      ?auto_6256820 - DIRECTION
      ?auto_6256823 - INSTRUMENT
      ?auto_6256822 - SATELLITE
      ?auto_6256824 - DIRECTION
      ?auto_6256821 - MODE
      ?auto_6256819 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6256817 ?auto_6256820 ) ) ( ON_BOARD ?auto_6256823 ?auto_6256822 ) ( SUPPORTS ?auto_6256823 ?auto_6256818 ) ( not ( = ?auto_6256817 ?auto_6256824 ) ) ( not ( = ?auto_6256820 ?auto_6256824 ) ) ( not ( = ?auto_6256821 ?auto_6256818 ) ) ( CALIBRATION_TARGET ?auto_6256823 ?auto_6256824 ) ( POINTING ?auto_6256822 ?auto_6256820 ) ( ON_BOARD ?auto_6256819 ?auto_6256822 ) ( POWER_ON ?auto_6256819 ) ( not ( = ?auto_6256823 ?auto_6256819 ) ) ( CALIBRATED ?auto_6256819 ) ( SUPPORTS ?auto_6256819 ?auto_6256821 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6256820 ?auto_6256821 )
      ( GET-2IMAGE ?auto_6256820 ?auto_6256821 ?auto_6256817 ?auto_6256818 )
      ( GET-1IMAGE-VERIFY ?auto_6256817 ?auto_6256818 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6256826 - DIRECTION
      ?auto_6256827 - MODE
      ?auto_6256828 - DIRECTION
      ?auto_6256825 - MODE
    )
    :vars
    (
      ?auto_6256829 - INSTRUMENT
      ?auto_6256831 - SATELLITE
      ?auto_6256830 - DIRECTION
      ?auto_6256832 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6256828 ?auto_6256826 ) ) ( ON_BOARD ?auto_6256829 ?auto_6256831 ) ( SUPPORTS ?auto_6256829 ?auto_6256825 ) ( not ( = ?auto_6256828 ?auto_6256830 ) ) ( not ( = ?auto_6256826 ?auto_6256830 ) ) ( not ( = ?auto_6256827 ?auto_6256825 ) ) ( CALIBRATION_TARGET ?auto_6256829 ?auto_6256830 ) ( POINTING ?auto_6256831 ?auto_6256826 ) ( ON_BOARD ?auto_6256832 ?auto_6256831 ) ( POWER_ON ?auto_6256832 ) ( not ( = ?auto_6256829 ?auto_6256832 ) ) ( CALIBRATED ?auto_6256832 ) ( SUPPORTS ?auto_6256832 ?auto_6256827 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6256828 ?auto_6256825 )
      ( GET-2IMAGE-VERIFY ?auto_6256826 ?auto_6256827 ?auto_6256828 ?auto_6256825 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6256834 - DIRECTION
      ?auto_6256835 - MODE
      ?auto_6256836 - DIRECTION
      ?auto_6256833 - MODE
    )
    :vars
    (
      ?auto_6256838 - INSTRUMENT
      ?auto_6256839 - SATELLITE
      ?auto_6256837 - DIRECTION
      ?auto_6256840 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6256836 ?auto_6256834 ) ) ( ON_BOARD ?auto_6256838 ?auto_6256839 ) ( SUPPORTS ?auto_6256838 ?auto_6256835 ) ( not ( = ?auto_6256834 ?auto_6256837 ) ) ( not ( = ?auto_6256836 ?auto_6256837 ) ) ( not ( = ?auto_6256833 ?auto_6256835 ) ) ( CALIBRATION_TARGET ?auto_6256838 ?auto_6256837 ) ( POINTING ?auto_6256839 ?auto_6256836 ) ( ON_BOARD ?auto_6256840 ?auto_6256839 ) ( POWER_ON ?auto_6256840 ) ( not ( = ?auto_6256838 ?auto_6256840 ) ) ( CALIBRATED ?auto_6256840 ) ( SUPPORTS ?auto_6256840 ?auto_6256833 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6256836 ?auto_6256833 ?auto_6256834 ?auto_6256835 )
      ( GET-2IMAGE-VERIFY ?auto_6256834 ?auto_6256835 ?auto_6256836 ?auto_6256833 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_6257541 - DIRECTION
      ?auto_6257542 - MODE
    )
    :vars
    (
      ?auto_6257548 - DIRECTION
      ?auto_6257544 - INSTRUMENT
      ?auto_6257546 - SATELLITE
      ?auto_6257543 - DIRECTION
      ?auto_6257545 - MODE
      ?auto_6257547 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6257541 ?auto_6257548 ) ) ( ON_BOARD ?auto_6257544 ?auto_6257546 ) ( SUPPORTS ?auto_6257544 ?auto_6257542 ) ( not ( = ?auto_6257541 ?auto_6257543 ) ) ( not ( = ?auto_6257548 ?auto_6257543 ) ) ( not ( = ?auto_6257545 ?auto_6257542 ) ) ( CALIBRATION_TARGET ?auto_6257544 ?auto_6257543 ) ( ON_BOARD ?auto_6257547 ?auto_6257546 ) ( POWER_ON ?auto_6257547 ) ( not ( = ?auto_6257544 ?auto_6257547 ) ) ( CALIBRATED ?auto_6257547 ) ( SUPPORTS ?auto_6257547 ?auto_6257545 ) ( POINTING ?auto_6257546 ?auto_6257543 ) )
    :subtasks
    ( ( !TURN_TO ?auto_6257546 ?auto_6257548 ?auto_6257543 )
      ( GET-2IMAGE ?auto_6257548 ?auto_6257545 ?auto_6257541 ?auto_6257542 )
      ( GET-1IMAGE-VERIFY ?auto_6257541 ?auto_6257542 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6257550 - DIRECTION
      ?auto_6257551 - MODE
      ?auto_6257552 - DIRECTION
      ?auto_6257549 - MODE
    )
    :vars
    (
      ?auto_6257556 - INSTRUMENT
      ?auto_6257555 - SATELLITE
      ?auto_6257554 - DIRECTION
      ?auto_6257553 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6257552 ?auto_6257550 ) ) ( ON_BOARD ?auto_6257556 ?auto_6257555 ) ( SUPPORTS ?auto_6257556 ?auto_6257549 ) ( not ( = ?auto_6257552 ?auto_6257554 ) ) ( not ( = ?auto_6257550 ?auto_6257554 ) ) ( not ( = ?auto_6257551 ?auto_6257549 ) ) ( CALIBRATION_TARGET ?auto_6257556 ?auto_6257554 ) ( ON_BOARD ?auto_6257553 ?auto_6257555 ) ( POWER_ON ?auto_6257553 ) ( not ( = ?auto_6257556 ?auto_6257553 ) ) ( CALIBRATED ?auto_6257553 ) ( SUPPORTS ?auto_6257553 ?auto_6257551 ) ( POINTING ?auto_6257555 ?auto_6257554 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6257552 ?auto_6257549 )
      ( GET-2IMAGE-VERIFY ?auto_6257550 ?auto_6257551 ?auto_6257552 ?auto_6257549 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6257558 - DIRECTION
      ?auto_6257559 - MODE
      ?auto_6257560 - DIRECTION
      ?auto_6257557 - MODE
    )
    :vars
    (
      ?auto_6257562 - INSTRUMENT
      ?auto_6257563 - SATELLITE
      ?auto_6257561 - DIRECTION
      ?auto_6257564 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6257560 ?auto_6257558 ) ) ( ON_BOARD ?auto_6257562 ?auto_6257563 ) ( SUPPORTS ?auto_6257562 ?auto_6257559 ) ( not ( = ?auto_6257558 ?auto_6257561 ) ) ( not ( = ?auto_6257560 ?auto_6257561 ) ) ( not ( = ?auto_6257557 ?auto_6257559 ) ) ( CALIBRATION_TARGET ?auto_6257562 ?auto_6257561 ) ( ON_BOARD ?auto_6257564 ?auto_6257563 ) ( POWER_ON ?auto_6257564 ) ( not ( = ?auto_6257562 ?auto_6257564 ) ) ( CALIBRATED ?auto_6257564 ) ( SUPPORTS ?auto_6257564 ?auto_6257557 ) ( POINTING ?auto_6257563 ?auto_6257561 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6257560 ?auto_6257557 ?auto_6257558 ?auto_6257559 )
      ( GET-2IMAGE-VERIFY ?auto_6257558 ?auto_6257559 ?auto_6257560 ?auto_6257557 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_6258265 - DIRECTION
      ?auto_6258266 - MODE
    )
    :vars
    (
      ?auto_6258270 - DIRECTION
      ?auto_6258268 - INSTRUMENT
      ?auto_6258269 - SATELLITE
      ?auto_6258267 - DIRECTION
      ?auto_6258271 - MODE
      ?auto_6258272 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6258265 ?auto_6258270 ) ) ( ON_BOARD ?auto_6258268 ?auto_6258269 ) ( SUPPORTS ?auto_6258268 ?auto_6258266 ) ( not ( = ?auto_6258265 ?auto_6258267 ) ) ( not ( = ?auto_6258270 ?auto_6258267 ) ) ( not ( = ?auto_6258271 ?auto_6258266 ) ) ( CALIBRATION_TARGET ?auto_6258268 ?auto_6258267 ) ( ON_BOARD ?auto_6258272 ?auto_6258269 ) ( POWER_ON ?auto_6258272 ) ( not ( = ?auto_6258268 ?auto_6258272 ) ) ( SUPPORTS ?auto_6258272 ?auto_6258271 ) ( POINTING ?auto_6258269 ?auto_6258267 ) ( CALIBRATION_TARGET ?auto_6258272 ?auto_6258267 ) ( NOT_CALIBRATED ?auto_6258272 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_6258269 ?auto_6258272 ?auto_6258267 )
      ( GET-2IMAGE ?auto_6258270 ?auto_6258271 ?auto_6258265 ?auto_6258266 )
      ( GET-1IMAGE-VERIFY ?auto_6258265 ?auto_6258266 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6258274 - DIRECTION
      ?auto_6258275 - MODE
      ?auto_6258276 - DIRECTION
      ?auto_6258273 - MODE
    )
    :vars
    (
      ?auto_6258279 - INSTRUMENT
      ?auto_6258277 - SATELLITE
      ?auto_6258280 - DIRECTION
      ?auto_6258278 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6258276 ?auto_6258274 ) ) ( ON_BOARD ?auto_6258279 ?auto_6258277 ) ( SUPPORTS ?auto_6258279 ?auto_6258273 ) ( not ( = ?auto_6258276 ?auto_6258280 ) ) ( not ( = ?auto_6258274 ?auto_6258280 ) ) ( not ( = ?auto_6258275 ?auto_6258273 ) ) ( CALIBRATION_TARGET ?auto_6258279 ?auto_6258280 ) ( ON_BOARD ?auto_6258278 ?auto_6258277 ) ( POWER_ON ?auto_6258278 ) ( not ( = ?auto_6258279 ?auto_6258278 ) ) ( SUPPORTS ?auto_6258278 ?auto_6258275 ) ( POINTING ?auto_6258277 ?auto_6258280 ) ( CALIBRATION_TARGET ?auto_6258278 ?auto_6258280 ) ( NOT_CALIBRATED ?auto_6258278 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6258276 ?auto_6258273 )
      ( GET-2IMAGE-VERIFY ?auto_6258274 ?auto_6258275 ?auto_6258276 ?auto_6258273 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6258282 - DIRECTION
      ?auto_6258283 - MODE
      ?auto_6258284 - DIRECTION
      ?auto_6258281 - MODE
    )
    :vars
    (
      ?auto_6258287 - INSTRUMENT
      ?auto_6258286 - SATELLITE
      ?auto_6258285 - DIRECTION
      ?auto_6258288 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6258284 ?auto_6258282 ) ) ( ON_BOARD ?auto_6258287 ?auto_6258286 ) ( SUPPORTS ?auto_6258287 ?auto_6258283 ) ( not ( = ?auto_6258282 ?auto_6258285 ) ) ( not ( = ?auto_6258284 ?auto_6258285 ) ) ( not ( = ?auto_6258281 ?auto_6258283 ) ) ( CALIBRATION_TARGET ?auto_6258287 ?auto_6258285 ) ( ON_BOARD ?auto_6258288 ?auto_6258286 ) ( POWER_ON ?auto_6258288 ) ( not ( = ?auto_6258287 ?auto_6258288 ) ) ( SUPPORTS ?auto_6258288 ?auto_6258281 ) ( POINTING ?auto_6258286 ?auto_6258285 ) ( CALIBRATION_TARGET ?auto_6258288 ?auto_6258285 ) ( NOT_CALIBRATED ?auto_6258288 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6258284 ?auto_6258281 ?auto_6258282 ?auto_6258283 )
      ( GET-2IMAGE-VERIFY ?auto_6258282 ?auto_6258283 ?auto_6258284 ?auto_6258281 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6263158 - DIRECTION
      ?auto_6263159 - MODE
      ?auto_6263160 - DIRECTION
      ?auto_6263157 - MODE
      ?auto_6263162 - DIRECTION
      ?auto_6263161 - MODE
    )
    :vars
    (
      ?auto_6263164 - INSTRUMENT
      ?auto_6263163 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_6263160 ?auto_6263158 ) ) ( not ( = ?auto_6263162 ?auto_6263158 ) ) ( not ( = ?auto_6263162 ?auto_6263160 ) ) ( CALIBRATED ?auto_6263164 ) ( ON_BOARD ?auto_6263164 ?auto_6263163 ) ( SUPPORTS ?auto_6263164 ?auto_6263161 ) ( POWER_ON ?auto_6263164 ) ( POINTING ?auto_6263163 ?auto_6263162 ) ( HAVE_IMAGE ?auto_6263158 ?auto_6263159 ) ( HAVE_IMAGE ?auto_6263160 ?auto_6263157 ) ( not ( = ?auto_6263159 ?auto_6263157 ) ) ( not ( = ?auto_6263159 ?auto_6263161 ) ) ( not ( = ?auto_6263157 ?auto_6263161 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6263162 ?auto_6263161 )
      ( GET-3IMAGE-VERIFY ?auto_6263158 ?auto_6263159 ?auto_6263160 ?auto_6263157 ?auto_6263162 ?auto_6263161 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6263174 - DIRECTION
      ?auto_6263175 - MODE
      ?auto_6263176 - DIRECTION
      ?auto_6263173 - MODE
      ?auto_6263178 - DIRECTION
      ?auto_6263177 - MODE
    )
    :vars
    (
      ?auto_6263180 - INSTRUMENT
      ?auto_6263179 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_6263176 ?auto_6263174 ) ) ( not ( = ?auto_6263178 ?auto_6263174 ) ) ( not ( = ?auto_6263178 ?auto_6263176 ) ) ( CALIBRATED ?auto_6263180 ) ( ON_BOARD ?auto_6263180 ?auto_6263179 ) ( SUPPORTS ?auto_6263180 ?auto_6263173 ) ( POWER_ON ?auto_6263180 ) ( POINTING ?auto_6263179 ?auto_6263176 ) ( HAVE_IMAGE ?auto_6263174 ?auto_6263175 ) ( HAVE_IMAGE ?auto_6263178 ?auto_6263177 ) ( not ( = ?auto_6263175 ?auto_6263173 ) ) ( not ( = ?auto_6263175 ?auto_6263177 ) ) ( not ( = ?auto_6263173 ?auto_6263177 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6263176 ?auto_6263173 )
      ( GET-3IMAGE-VERIFY ?auto_6263174 ?auto_6263175 ?auto_6263176 ?auto_6263173 ?auto_6263178 ?auto_6263177 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6263234 - DIRECTION
      ?auto_6263235 - MODE
      ?auto_6263236 - DIRECTION
      ?auto_6263233 - MODE
      ?auto_6263238 - DIRECTION
      ?auto_6263237 - MODE
    )
    :vars
    (
      ?auto_6263240 - INSTRUMENT
      ?auto_6263239 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_6263236 ?auto_6263234 ) ) ( not ( = ?auto_6263238 ?auto_6263234 ) ) ( not ( = ?auto_6263238 ?auto_6263236 ) ) ( CALIBRATED ?auto_6263240 ) ( ON_BOARD ?auto_6263240 ?auto_6263239 ) ( SUPPORTS ?auto_6263240 ?auto_6263235 ) ( POWER_ON ?auto_6263240 ) ( POINTING ?auto_6263239 ?auto_6263234 ) ( HAVE_IMAGE ?auto_6263236 ?auto_6263233 ) ( HAVE_IMAGE ?auto_6263238 ?auto_6263237 ) ( not ( = ?auto_6263235 ?auto_6263233 ) ) ( not ( = ?auto_6263235 ?auto_6263237 ) ) ( not ( = ?auto_6263233 ?auto_6263237 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6263234 ?auto_6263235 )
      ( GET-3IMAGE-VERIFY ?auto_6263234 ?auto_6263235 ?auto_6263236 ?auto_6263233 ?auto_6263238 ?auto_6263237 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6266523 - DIRECTION
      ?auto_6266524 - MODE
      ?auto_6266525 - DIRECTION
      ?auto_6266522 - MODE
      ?auto_6266527 - DIRECTION
      ?auto_6266526 - MODE
    )
    :vars
    (
      ?auto_6266529 - INSTRUMENT
      ?auto_6266528 - SATELLITE
      ?auto_6266530 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6266525 ?auto_6266523 ) ) ( not ( = ?auto_6266527 ?auto_6266523 ) ) ( not ( = ?auto_6266527 ?auto_6266525 ) ) ( CALIBRATED ?auto_6266529 ) ( ON_BOARD ?auto_6266529 ?auto_6266528 ) ( SUPPORTS ?auto_6266529 ?auto_6266526 ) ( POWER_ON ?auto_6266529 ) ( POINTING ?auto_6266528 ?auto_6266530 ) ( not ( = ?auto_6266527 ?auto_6266530 ) ) ( HAVE_IMAGE ?auto_6266523 ?auto_6266524 ) ( not ( = ?auto_6266523 ?auto_6266530 ) ) ( not ( = ?auto_6266524 ?auto_6266526 ) ) ( HAVE_IMAGE ?auto_6266525 ?auto_6266522 ) ( not ( = ?auto_6266524 ?auto_6266522 ) ) ( not ( = ?auto_6266525 ?auto_6266530 ) ) ( not ( = ?auto_6266522 ?auto_6266526 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6266523 ?auto_6266524 ?auto_6266527 ?auto_6266526 )
      ( GET-3IMAGE-VERIFY ?auto_6266523 ?auto_6266524 ?auto_6266525 ?auto_6266522 ?auto_6266527 ?auto_6266526 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6266541 - DIRECTION
      ?auto_6266542 - MODE
      ?auto_6266543 - DIRECTION
      ?auto_6266540 - MODE
      ?auto_6266545 - DIRECTION
      ?auto_6266544 - MODE
    )
    :vars
    (
      ?auto_6266547 - INSTRUMENT
      ?auto_6266546 - SATELLITE
      ?auto_6266548 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6266543 ?auto_6266541 ) ) ( not ( = ?auto_6266545 ?auto_6266541 ) ) ( not ( = ?auto_6266545 ?auto_6266543 ) ) ( CALIBRATED ?auto_6266547 ) ( ON_BOARD ?auto_6266547 ?auto_6266546 ) ( SUPPORTS ?auto_6266547 ?auto_6266540 ) ( POWER_ON ?auto_6266547 ) ( POINTING ?auto_6266546 ?auto_6266548 ) ( not ( = ?auto_6266543 ?auto_6266548 ) ) ( HAVE_IMAGE ?auto_6266541 ?auto_6266542 ) ( not ( = ?auto_6266541 ?auto_6266548 ) ) ( not ( = ?auto_6266542 ?auto_6266540 ) ) ( HAVE_IMAGE ?auto_6266545 ?auto_6266544 ) ( not ( = ?auto_6266542 ?auto_6266544 ) ) ( not ( = ?auto_6266540 ?auto_6266544 ) ) ( not ( = ?auto_6266545 ?auto_6266548 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6266541 ?auto_6266542 ?auto_6266543 ?auto_6266540 )
      ( GET-3IMAGE-VERIFY ?auto_6266541 ?auto_6266542 ?auto_6266543 ?auto_6266540 ?auto_6266545 ?auto_6266544 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6266613 - DIRECTION
      ?auto_6266614 - MODE
      ?auto_6266615 - DIRECTION
      ?auto_6266612 - MODE
      ?auto_6266617 - DIRECTION
      ?auto_6266616 - MODE
    )
    :vars
    (
      ?auto_6266619 - INSTRUMENT
      ?auto_6266618 - SATELLITE
      ?auto_6266620 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6266615 ?auto_6266613 ) ) ( not ( = ?auto_6266617 ?auto_6266613 ) ) ( not ( = ?auto_6266617 ?auto_6266615 ) ) ( CALIBRATED ?auto_6266619 ) ( ON_BOARD ?auto_6266619 ?auto_6266618 ) ( SUPPORTS ?auto_6266619 ?auto_6266614 ) ( POWER_ON ?auto_6266619 ) ( POINTING ?auto_6266618 ?auto_6266620 ) ( not ( = ?auto_6266613 ?auto_6266620 ) ) ( HAVE_IMAGE ?auto_6266615 ?auto_6266612 ) ( not ( = ?auto_6266615 ?auto_6266620 ) ) ( not ( = ?auto_6266612 ?auto_6266614 ) ) ( HAVE_IMAGE ?auto_6266617 ?auto_6266616 ) ( not ( = ?auto_6266614 ?auto_6266616 ) ) ( not ( = ?auto_6266612 ?auto_6266616 ) ) ( not ( = ?auto_6266617 ?auto_6266620 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6266615 ?auto_6266612 ?auto_6266613 ?auto_6266614 )
      ( GET-3IMAGE-VERIFY ?auto_6266613 ?auto_6266614 ?auto_6266615 ?auto_6266612 ?auto_6266617 ?auto_6266616 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6270287 - DIRECTION
      ?auto_6270288 - MODE
      ?auto_6270289 - DIRECTION
      ?auto_6270286 - MODE
      ?auto_6270291 - DIRECTION
      ?auto_6270290 - MODE
    )
    :vars
    (
      ?auto_6270293 - INSTRUMENT
      ?auto_6270294 - SATELLITE
      ?auto_6270292 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6270289 ?auto_6270287 ) ) ( not ( = ?auto_6270291 ?auto_6270287 ) ) ( not ( = ?auto_6270291 ?auto_6270289 ) ) ( ON_BOARD ?auto_6270293 ?auto_6270294 ) ( SUPPORTS ?auto_6270293 ?auto_6270290 ) ( POWER_ON ?auto_6270293 ) ( POINTING ?auto_6270294 ?auto_6270292 ) ( not ( = ?auto_6270291 ?auto_6270292 ) ) ( HAVE_IMAGE ?auto_6270287 ?auto_6270288 ) ( not ( = ?auto_6270287 ?auto_6270292 ) ) ( not ( = ?auto_6270288 ?auto_6270290 ) ) ( CALIBRATION_TARGET ?auto_6270293 ?auto_6270292 ) ( NOT_CALIBRATED ?auto_6270293 ) ( HAVE_IMAGE ?auto_6270289 ?auto_6270286 ) ( not ( = ?auto_6270288 ?auto_6270286 ) ) ( not ( = ?auto_6270289 ?auto_6270292 ) ) ( not ( = ?auto_6270286 ?auto_6270290 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6270287 ?auto_6270288 ?auto_6270291 ?auto_6270290 )
      ( GET-3IMAGE-VERIFY ?auto_6270287 ?auto_6270288 ?auto_6270289 ?auto_6270286 ?auto_6270291 ?auto_6270290 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6270305 - DIRECTION
      ?auto_6270306 - MODE
      ?auto_6270307 - DIRECTION
      ?auto_6270304 - MODE
      ?auto_6270309 - DIRECTION
      ?auto_6270308 - MODE
    )
    :vars
    (
      ?auto_6270311 - INSTRUMENT
      ?auto_6270312 - SATELLITE
      ?auto_6270310 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6270307 ?auto_6270305 ) ) ( not ( = ?auto_6270309 ?auto_6270305 ) ) ( not ( = ?auto_6270309 ?auto_6270307 ) ) ( ON_BOARD ?auto_6270311 ?auto_6270312 ) ( SUPPORTS ?auto_6270311 ?auto_6270304 ) ( POWER_ON ?auto_6270311 ) ( POINTING ?auto_6270312 ?auto_6270310 ) ( not ( = ?auto_6270307 ?auto_6270310 ) ) ( HAVE_IMAGE ?auto_6270305 ?auto_6270306 ) ( not ( = ?auto_6270305 ?auto_6270310 ) ) ( not ( = ?auto_6270306 ?auto_6270304 ) ) ( CALIBRATION_TARGET ?auto_6270311 ?auto_6270310 ) ( NOT_CALIBRATED ?auto_6270311 ) ( HAVE_IMAGE ?auto_6270309 ?auto_6270308 ) ( not ( = ?auto_6270306 ?auto_6270308 ) ) ( not ( = ?auto_6270304 ?auto_6270308 ) ) ( not ( = ?auto_6270309 ?auto_6270310 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6270305 ?auto_6270306 ?auto_6270307 ?auto_6270304 )
      ( GET-3IMAGE-VERIFY ?auto_6270305 ?auto_6270306 ?auto_6270307 ?auto_6270304 ?auto_6270309 ?auto_6270308 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6270377 - DIRECTION
      ?auto_6270378 - MODE
      ?auto_6270379 - DIRECTION
      ?auto_6270376 - MODE
      ?auto_6270381 - DIRECTION
      ?auto_6270380 - MODE
    )
    :vars
    (
      ?auto_6270383 - INSTRUMENT
      ?auto_6270384 - SATELLITE
      ?auto_6270382 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6270379 ?auto_6270377 ) ) ( not ( = ?auto_6270381 ?auto_6270377 ) ) ( not ( = ?auto_6270381 ?auto_6270379 ) ) ( ON_BOARD ?auto_6270383 ?auto_6270384 ) ( SUPPORTS ?auto_6270383 ?auto_6270378 ) ( POWER_ON ?auto_6270383 ) ( POINTING ?auto_6270384 ?auto_6270382 ) ( not ( = ?auto_6270377 ?auto_6270382 ) ) ( HAVE_IMAGE ?auto_6270379 ?auto_6270376 ) ( not ( = ?auto_6270379 ?auto_6270382 ) ) ( not ( = ?auto_6270376 ?auto_6270378 ) ) ( CALIBRATION_TARGET ?auto_6270383 ?auto_6270382 ) ( NOT_CALIBRATED ?auto_6270383 ) ( HAVE_IMAGE ?auto_6270381 ?auto_6270380 ) ( not ( = ?auto_6270378 ?auto_6270380 ) ) ( not ( = ?auto_6270376 ?auto_6270380 ) ) ( not ( = ?auto_6270381 ?auto_6270382 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6270379 ?auto_6270376 ?auto_6270377 ?auto_6270378 )
      ( GET-3IMAGE-VERIFY ?auto_6270377 ?auto_6270378 ?auto_6270379 ?auto_6270376 ?auto_6270381 ?auto_6270380 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6274051 - DIRECTION
      ?auto_6274052 - MODE
      ?auto_6274053 - DIRECTION
      ?auto_6274050 - MODE
      ?auto_6274055 - DIRECTION
      ?auto_6274054 - MODE
    )
    :vars
    (
      ?auto_6274056 - INSTRUMENT
      ?auto_6274057 - SATELLITE
      ?auto_6274058 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6274053 ?auto_6274051 ) ) ( not ( = ?auto_6274055 ?auto_6274051 ) ) ( not ( = ?auto_6274055 ?auto_6274053 ) ) ( ON_BOARD ?auto_6274056 ?auto_6274057 ) ( SUPPORTS ?auto_6274056 ?auto_6274054 ) ( POINTING ?auto_6274057 ?auto_6274058 ) ( not ( = ?auto_6274055 ?auto_6274058 ) ) ( HAVE_IMAGE ?auto_6274051 ?auto_6274052 ) ( not ( = ?auto_6274051 ?auto_6274058 ) ) ( not ( = ?auto_6274052 ?auto_6274054 ) ) ( CALIBRATION_TARGET ?auto_6274056 ?auto_6274058 ) ( POWER_AVAIL ?auto_6274057 ) ( HAVE_IMAGE ?auto_6274053 ?auto_6274050 ) ( not ( = ?auto_6274052 ?auto_6274050 ) ) ( not ( = ?auto_6274053 ?auto_6274058 ) ) ( not ( = ?auto_6274050 ?auto_6274054 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6274051 ?auto_6274052 ?auto_6274055 ?auto_6274054 )
      ( GET-3IMAGE-VERIFY ?auto_6274051 ?auto_6274052 ?auto_6274053 ?auto_6274050 ?auto_6274055 ?auto_6274054 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6274069 - DIRECTION
      ?auto_6274070 - MODE
      ?auto_6274071 - DIRECTION
      ?auto_6274068 - MODE
      ?auto_6274073 - DIRECTION
      ?auto_6274072 - MODE
    )
    :vars
    (
      ?auto_6274074 - INSTRUMENT
      ?auto_6274075 - SATELLITE
      ?auto_6274076 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6274071 ?auto_6274069 ) ) ( not ( = ?auto_6274073 ?auto_6274069 ) ) ( not ( = ?auto_6274073 ?auto_6274071 ) ) ( ON_BOARD ?auto_6274074 ?auto_6274075 ) ( SUPPORTS ?auto_6274074 ?auto_6274068 ) ( POINTING ?auto_6274075 ?auto_6274076 ) ( not ( = ?auto_6274071 ?auto_6274076 ) ) ( HAVE_IMAGE ?auto_6274069 ?auto_6274070 ) ( not ( = ?auto_6274069 ?auto_6274076 ) ) ( not ( = ?auto_6274070 ?auto_6274068 ) ) ( CALIBRATION_TARGET ?auto_6274074 ?auto_6274076 ) ( POWER_AVAIL ?auto_6274075 ) ( HAVE_IMAGE ?auto_6274073 ?auto_6274072 ) ( not ( = ?auto_6274070 ?auto_6274072 ) ) ( not ( = ?auto_6274068 ?auto_6274072 ) ) ( not ( = ?auto_6274073 ?auto_6274076 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6274069 ?auto_6274070 ?auto_6274071 ?auto_6274068 )
      ( GET-3IMAGE-VERIFY ?auto_6274069 ?auto_6274070 ?auto_6274071 ?auto_6274068 ?auto_6274073 ?auto_6274072 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6274141 - DIRECTION
      ?auto_6274142 - MODE
      ?auto_6274143 - DIRECTION
      ?auto_6274140 - MODE
      ?auto_6274145 - DIRECTION
      ?auto_6274144 - MODE
    )
    :vars
    (
      ?auto_6274146 - INSTRUMENT
      ?auto_6274147 - SATELLITE
      ?auto_6274148 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6274143 ?auto_6274141 ) ) ( not ( = ?auto_6274145 ?auto_6274141 ) ) ( not ( = ?auto_6274145 ?auto_6274143 ) ) ( ON_BOARD ?auto_6274146 ?auto_6274147 ) ( SUPPORTS ?auto_6274146 ?auto_6274142 ) ( POINTING ?auto_6274147 ?auto_6274148 ) ( not ( = ?auto_6274141 ?auto_6274148 ) ) ( HAVE_IMAGE ?auto_6274143 ?auto_6274140 ) ( not ( = ?auto_6274143 ?auto_6274148 ) ) ( not ( = ?auto_6274140 ?auto_6274142 ) ) ( CALIBRATION_TARGET ?auto_6274146 ?auto_6274148 ) ( POWER_AVAIL ?auto_6274147 ) ( HAVE_IMAGE ?auto_6274145 ?auto_6274144 ) ( not ( = ?auto_6274142 ?auto_6274144 ) ) ( not ( = ?auto_6274140 ?auto_6274144 ) ) ( not ( = ?auto_6274145 ?auto_6274148 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6274143 ?auto_6274140 ?auto_6274141 ?auto_6274142 )
      ( GET-3IMAGE-VERIFY ?auto_6274141 ?auto_6274142 ?auto_6274143 ?auto_6274140 ?auto_6274145 ?auto_6274144 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_6277767 - DIRECTION
      ?auto_6277768 - MODE
    )
    :vars
    (
      ?auto_6277771 - DIRECTION
      ?auto_6277770 - INSTRUMENT
      ?auto_6277772 - SATELLITE
      ?auto_6277773 - DIRECTION
      ?auto_6277769 - MODE
      ?auto_6277774 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6277767 ?auto_6277771 ) ) ( ON_BOARD ?auto_6277770 ?auto_6277772 ) ( SUPPORTS ?auto_6277770 ?auto_6277768 ) ( not ( = ?auto_6277767 ?auto_6277773 ) ) ( HAVE_IMAGE ?auto_6277771 ?auto_6277769 ) ( not ( = ?auto_6277771 ?auto_6277773 ) ) ( not ( = ?auto_6277769 ?auto_6277768 ) ) ( CALIBRATION_TARGET ?auto_6277770 ?auto_6277773 ) ( POWER_AVAIL ?auto_6277772 ) ( POINTING ?auto_6277772 ?auto_6277774 ) ( not ( = ?auto_6277773 ?auto_6277774 ) ) ( not ( = ?auto_6277767 ?auto_6277774 ) ) ( not ( = ?auto_6277771 ?auto_6277774 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_6277772 ?auto_6277773 ?auto_6277774 )
      ( GET-2IMAGE ?auto_6277771 ?auto_6277769 ?auto_6277767 ?auto_6277768 )
      ( GET-1IMAGE-VERIFY ?auto_6277767 ?auto_6277768 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6277776 - DIRECTION
      ?auto_6277777 - MODE
      ?auto_6277778 - DIRECTION
      ?auto_6277775 - MODE
    )
    :vars
    (
      ?auto_6277780 - INSTRUMENT
      ?auto_6277779 - SATELLITE
      ?auto_6277782 - DIRECTION
      ?auto_6277781 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6277778 ?auto_6277776 ) ) ( ON_BOARD ?auto_6277780 ?auto_6277779 ) ( SUPPORTS ?auto_6277780 ?auto_6277775 ) ( not ( = ?auto_6277778 ?auto_6277782 ) ) ( HAVE_IMAGE ?auto_6277776 ?auto_6277777 ) ( not ( = ?auto_6277776 ?auto_6277782 ) ) ( not ( = ?auto_6277777 ?auto_6277775 ) ) ( CALIBRATION_TARGET ?auto_6277780 ?auto_6277782 ) ( POWER_AVAIL ?auto_6277779 ) ( POINTING ?auto_6277779 ?auto_6277781 ) ( not ( = ?auto_6277782 ?auto_6277781 ) ) ( not ( = ?auto_6277778 ?auto_6277781 ) ) ( not ( = ?auto_6277776 ?auto_6277781 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6277778 ?auto_6277775 )
      ( GET-2IMAGE-VERIFY ?auto_6277776 ?auto_6277777 ?auto_6277778 ?auto_6277775 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6277784 - DIRECTION
      ?auto_6277785 - MODE
      ?auto_6277786 - DIRECTION
      ?auto_6277783 - MODE
    )
    :vars
    (
      ?auto_6277787 - DIRECTION
      ?auto_6277789 - INSTRUMENT
      ?auto_6277791 - SATELLITE
      ?auto_6277790 - DIRECTION
      ?auto_6277788 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_6277786 ?auto_6277784 ) ) ( not ( = ?auto_6277786 ?auto_6277787 ) ) ( ON_BOARD ?auto_6277789 ?auto_6277791 ) ( SUPPORTS ?auto_6277789 ?auto_6277783 ) ( not ( = ?auto_6277786 ?auto_6277790 ) ) ( HAVE_IMAGE ?auto_6277787 ?auto_6277788 ) ( not ( = ?auto_6277787 ?auto_6277790 ) ) ( not ( = ?auto_6277788 ?auto_6277783 ) ) ( CALIBRATION_TARGET ?auto_6277789 ?auto_6277790 ) ( POWER_AVAIL ?auto_6277791 ) ( POINTING ?auto_6277791 ?auto_6277784 ) ( not ( = ?auto_6277790 ?auto_6277784 ) ) ( not ( = ?auto_6277787 ?auto_6277784 ) ) ( HAVE_IMAGE ?auto_6277784 ?auto_6277785 ) ( not ( = ?auto_6277785 ?auto_6277783 ) ) ( not ( = ?auto_6277785 ?auto_6277788 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6277787 ?auto_6277788 ?auto_6277786 ?auto_6277783 )
      ( GET-2IMAGE-VERIFY ?auto_6277784 ?auto_6277785 ?auto_6277786 ?auto_6277783 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6277793 - DIRECTION
      ?auto_6277794 - MODE
      ?auto_6277795 - DIRECTION
      ?auto_6277792 - MODE
    )
    :vars
    (
      ?auto_6277797 - INSTRUMENT
      ?auto_6277799 - SATELLITE
      ?auto_6277798 - DIRECTION
      ?auto_6277796 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6277795 ?auto_6277793 ) ) ( ON_BOARD ?auto_6277797 ?auto_6277799 ) ( SUPPORTS ?auto_6277797 ?auto_6277794 ) ( not ( = ?auto_6277793 ?auto_6277798 ) ) ( HAVE_IMAGE ?auto_6277795 ?auto_6277792 ) ( not ( = ?auto_6277795 ?auto_6277798 ) ) ( not ( = ?auto_6277792 ?auto_6277794 ) ) ( CALIBRATION_TARGET ?auto_6277797 ?auto_6277798 ) ( POWER_AVAIL ?auto_6277799 ) ( POINTING ?auto_6277799 ?auto_6277796 ) ( not ( = ?auto_6277798 ?auto_6277796 ) ) ( not ( = ?auto_6277793 ?auto_6277796 ) ) ( not ( = ?auto_6277795 ?auto_6277796 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6277795 ?auto_6277792 ?auto_6277793 ?auto_6277794 )
      ( GET-2IMAGE-VERIFY ?auto_6277793 ?auto_6277794 ?auto_6277795 ?auto_6277792 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6277801 - DIRECTION
      ?auto_6277802 - MODE
      ?auto_6277803 - DIRECTION
      ?auto_6277800 - MODE
    )
    :vars
    (
      ?auto_6277804 - DIRECTION
      ?auto_6277806 - INSTRUMENT
      ?auto_6277808 - SATELLITE
      ?auto_6277807 - DIRECTION
      ?auto_6277805 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_6277803 ?auto_6277801 ) ) ( not ( = ?auto_6277801 ?auto_6277804 ) ) ( ON_BOARD ?auto_6277806 ?auto_6277808 ) ( SUPPORTS ?auto_6277806 ?auto_6277802 ) ( not ( = ?auto_6277801 ?auto_6277807 ) ) ( HAVE_IMAGE ?auto_6277804 ?auto_6277805 ) ( not ( = ?auto_6277804 ?auto_6277807 ) ) ( not ( = ?auto_6277805 ?auto_6277802 ) ) ( CALIBRATION_TARGET ?auto_6277806 ?auto_6277807 ) ( POWER_AVAIL ?auto_6277808 ) ( POINTING ?auto_6277808 ?auto_6277803 ) ( not ( = ?auto_6277807 ?auto_6277803 ) ) ( not ( = ?auto_6277804 ?auto_6277803 ) ) ( HAVE_IMAGE ?auto_6277803 ?auto_6277800 ) ( not ( = ?auto_6277802 ?auto_6277800 ) ) ( not ( = ?auto_6277800 ?auto_6277805 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6277804 ?auto_6277805 ?auto_6277801 ?auto_6277802 )
      ( GET-2IMAGE-VERIFY ?auto_6277801 ?auto_6277802 ?auto_6277803 ?auto_6277800 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6277830 - DIRECTION
      ?auto_6277831 - MODE
      ?auto_6277832 - DIRECTION
      ?auto_6277829 - MODE
      ?auto_6277834 - DIRECTION
      ?auto_6277833 - MODE
    )
    :vars
    (
      ?auto_6277835 - INSTRUMENT
      ?auto_6277837 - SATELLITE
      ?auto_6277836 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6277832 ?auto_6277830 ) ) ( not ( = ?auto_6277834 ?auto_6277830 ) ) ( not ( = ?auto_6277834 ?auto_6277832 ) ) ( ON_BOARD ?auto_6277835 ?auto_6277837 ) ( SUPPORTS ?auto_6277835 ?auto_6277833 ) ( not ( = ?auto_6277834 ?auto_6277836 ) ) ( HAVE_IMAGE ?auto_6277830 ?auto_6277831 ) ( not ( = ?auto_6277830 ?auto_6277836 ) ) ( not ( = ?auto_6277831 ?auto_6277833 ) ) ( CALIBRATION_TARGET ?auto_6277835 ?auto_6277836 ) ( POWER_AVAIL ?auto_6277837 ) ( POINTING ?auto_6277837 ?auto_6277832 ) ( not ( = ?auto_6277836 ?auto_6277832 ) ) ( HAVE_IMAGE ?auto_6277832 ?auto_6277829 ) ( not ( = ?auto_6277831 ?auto_6277829 ) ) ( not ( = ?auto_6277829 ?auto_6277833 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6277830 ?auto_6277831 ?auto_6277834 ?auto_6277833 )
      ( GET-3IMAGE-VERIFY ?auto_6277830 ?auto_6277831 ?auto_6277832 ?auto_6277829 ?auto_6277834 ?auto_6277833 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6277849 - DIRECTION
      ?auto_6277850 - MODE
      ?auto_6277851 - DIRECTION
      ?auto_6277848 - MODE
      ?auto_6277853 - DIRECTION
      ?auto_6277852 - MODE
    )
    :vars
    (
      ?auto_6277854 - INSTRUMENT
      ?auto_6277856 - SATELLITE
      ?auto_6277855 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6277851 ?auto_6277849 ) ) ( not ( = ?auto_6277853 ?auto_6277849 ) ) ( not ( = ?auto_6277853 ?auto_6277851 ) ) ( ON_BOARD ?auto_6277854 ?auto_6277856 ) ( SUPPORTS ?auto_6277854 ?auto_6277848 ) ( not ( = ?auto_6277851 ?auto_6277855 ) ) ( HAVE_IMAGE ?auto_6277849 ?auto_6277850 ) ( not ( = ?auto_6277849 ?auto_6277855 ) ) ( not ( = ?auto_6277850 ?auto_6277848 ) ) ( CALIBRATION_TARGET ?auto_6277854 ?auto_6277855 ) ( POWER_AVAIL ?auto_6277856 ) ( POINTING ?auto_6277856 ?auto_6277853 ) ( not ( = ?auto_6277855 ?auto_6277853 ) ) ( HAVE_IMAGE ?auto_6277853 ?auto_6277852 ) ( not ( = ?auto_6277850 ?auto_6277852 ) ) ( not ( = ?auto_6277848 ?auto_6277852 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6277849 ?auto_6277850 ?auto_6277851 ?auto_6277848 )
      ( GET-3IMAGE-VERIFY ?auto_6277849 ?auto_6277850 ?auto_6277851 ?auto_6277848 ?auto_6277853 ?auto_6277852 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6277868 - DIRECTION
      ?auto_6277869 - MODE
      ?auto_6277870 - DIRECTION
      ?auto_6277867 - MODE
      ?auto_6277872 - DIRECTION
      ?auto_6277871 - MODE
    )
    :vars
    (
      ?auto_6277873 - INSTRUMENT
      ?auto_6277875 - SATELLITE
      ?auto_6277874 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6277870 ?auto_6277868 ) ) ( not ( = ?auto_6277872 ?auto_6277868 ) ) ( not ( = ?auto_6277872 ?auto_6277870 ) ) ( ON_BOARD ?auto_6277873 ?auto_6277875 ) ( SUPPORTS ?auto_6277873 ?auto_6277871 ) ( not ( = ?auto_6277872 ?auto_6277874 ) ) ( HAVE_IMAGE ?auto_6277870 ?auto_6277867 ) ( not ( = ?auto_6277870 ?auto_6277874 ) ) ( not ( = ?auto_6277867 ?auto_6277871 ) ) ( CALIBRATION_TARGET ?auto_6277873 ?auto_6277874 ) ( POWER_AVAIL ?auto_6277875 ) ( POINTING ?auto_6277875 ?auto_6277868 ) ( not ( = ?auto_6277874 ?auto_6277868 ) ) ( HAVE_IMAGE ?auto_6277868 ?auto_6277869 ) ( not ( = ?auto_6277869 ?auto_6277867 ) ) ( not ( = ?auto_6277869 ?auto_6277871 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6277870 ?auto_6277867 ?auto_6277872 ?auto_6277871 )
      ( GET-3IMAGE-VERIFY ?auto_6277868 ?auto_6277869 ?auto_6277870 ?auto_6277867 ?auto_6277872 ?auto_6277871 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6277888 - DIRECTION
      ?auto_6277889 - MODE
      ?auto_6277890 - DIRECTION
      ?auto_6277887 - MODE
      ?auto_6277892 - DIRECTION
      ?auto_6277891 - MODE
    )
    :vars
    (
      ?auto_6277893 - INSTRUMENT
      ?auto_6277895 - SATELLITE
      ?auto_6277894 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6277890 ?auto_6277888 ) ) ( not ( = ?auto_6277892 ?auto_6277888 ) ) ( not ( = ?auto_6277892 ?auto_6277890 ) ) ( ON_BOARD ?auto_6277893 ?auto_6277895 ) ( SUPPORTS ?auto_6277893 ?auto_6277887 ) ( not ( = ?auto_6277890 ?auto_6277894 ) ) ( HAVE_IMAGE ?auto_6277892 ?auto_6277891 ) ( not ( = ?auto_6277892 ?auto_6277894 ) ) ( not ( = ?auto_6277891 ?auto_6277887 ) ) ( CALIBRATION_TARGET ?auto_6277893 ?auto_6277894 ) ( POWER_AVAIL ?auto_6277895 ) ( POINTING ?auto_6277895 ?auto_6277888 ) ( not ( = ?auto_6277894 ?auto_6277888 ) ) ( HAVE_IMAGE ?auto_6277888 ?auto_6277889 ) ( not ( = ?auto_6277889 ?auto_6277887 ) ) ( not ( = ?auto_6277889 ?auto_6277891 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6277892 ?auto_6277891 ?auto_6277890 ?auto_6277887 )
      ( GET-3IMAGE-VERIFY ?auto_6277888 ?auto_6277889 ?auto_6277890 ?auto_6277887 ?auto_6277892 ?auto_6277891 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6277929 - DIRECTION
      ?auto_6277930 - MODE
      ?auto_6277931 - DIRECTION
      ?auto_6277928 - MODE
      ?auto_6277933 - DIRECTION
      ?auto_6277932 - MODE
    )
    :vars
    (
      ?auto_6277934 - INSTRUMENT
      ?auto_6277936 - SATELLITE
      ?auto_6277935 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6277931 ?auto_6277929 ) ) ( not ( = ?auto_6277933 ?auto_6277929 ) ) ( not ( = ?auto_6277933 ?auto_6277931 ) ) ( ON_BOARD ?auto_6277934 ?auto_6277936 ) ( SUPPORTS ?auto_6277934 ?auto_6277930 ) ( not ( = ?auto_6277929 ?auto_6277935 ) ) ( HAVE_IMAGE ?auto_6277931 ?auto_6277928 ) ( not ( = ?auto_6277931 ?auto_6277935 ) ) ( not ( = ?auto_6277928 ?auto_6277930 ) ) ( CALIBRATION_TARGET ?auto_6277934 ?auto_6277935 ) ( POWER_AVAIL ?auto_6277936 ) ( POINTING ?auto_6277936 ?auto_6277933 ) ( not ( = ?auto_6277935 ?auto_6277933 ) ) ( HAVE_IMAGE ?auto_6277933 ?auto_6277932 ) ( not ( = ?auto_6277930 ?auto_6277932 ) ) ( not ( = ?auto_6277928 ?auto_6277932 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6277931 ?auto_6277928 ?auto_6277929 ?auto_6277930 )
      ( GET-3IMAGE-VERIFY ?auto_6277929 ?auto_6277930 ?auto_6277931 ?auto_6277928 ?auto_6277933 ?auto_6277932 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6277948 - DIRECTION
      ?auto_6277949 - MODE
      ?auto_6277950 - DIRECTION
      ?auto_6277947 - MODE
      ?auto_6277952 - DIRECTION
      ?auto_6277951 - MODE
    )
    :vars
    (
      ?auto_6277953 - INSTRUMENT
      ?auto_6277955 - SATELLITE
      ?auto_6277954 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6277950 ?auto_6277948 ) ) ( not ( = ?auto_6277952 ?auto_6277948 ) ) ( not ( = ?auto_6277952 ?auto_6277950 ) ) ( ON_BOARD ?auto_6277953 ?auto_6277955 ) ( SUPPORTS ?auto_6277953 ?auto_6277949 ) ( not ( = ?auto_6277948 ?auto_6277954 ) ) ( HAVE_IMAGE ?auto_6277952 ?auto_6277951 ) ( not ( = ?auto_6277952 ?auto_6277954 ) ) ( not ( = ?auto_6277951 ?auto_6277949 ) ) ( CALIBRATION_TARGET ?auto_6277953 ?auto_6277954 ) ( POWER_AVAIL ?auto_6277955 ) ( POINTING ?auto_6277955 ?auto_6277950 ) ( not ( = ?auto_6277954 ?auto_6277950 ) ) ( HAVE_IMAGE ?auto_6277950 ?auto_6277947 ) ( not ( = ?auto_6277949 ?auto_6277947 ) ) ( not ( = ?auto_6277947 ?auto_6277951 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6277952 ?auto_6277951 ?auto_6277948 ?auto_6277949 )
      ( GET-3IMAGE-VERIFY ?auto_6277948 ?auto_6277949 ?auto_6277950 ?auto_6277947 ?auto_6277952 ?auto_6277951 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_6281607 - DIRECTION
      ?auto_6281608 - MODE
    )
    :vars
    (
      ?auto_6281609 - DIRECTION
      ?auto_6281612 - INSTRUMENT
      ?auto_6281614 - SATELLITE
      ?auto_6281613 - DIRECTION
      ?auto_6281610 - MODE
      ?auto_6281611 - DIRECTION
      ?auto_6281615 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6281607 ?auto_6281609 ) ) ( ON_BOARD ?auto_6281612 ?auto_6281614 ) ( SUPPORTS ?auto_6281612 ?auto_6281608 ) ( not ( = ?auto_6281607 ?auto_6281613 ) ) ( HAVE_IMAGE ?auto_6281609 ?auto_6281610 ) ( not ( = ?auto_6281609 ?auto_6281613 ) ) ( not ( = ?auto_6281610 ?auto_6281608 ) ) ( CALIBRATION_TARGET ?auto_6281612 ?auto_6281613 ) ( POINTING ?auto_6281614 ?auto_6281611 ) ( not ( = ?auto_6281613 ?auto_6281611 ) ) ( not ( = ?auto_6281607 ?auto_6281611 ) ) ( not ( = ?auto_6281609 ?auto_6281611 ) ) ( ON_BOARD ?auto_6281615 ?auto_6281614 ) ( POWER_ON ?auto_6281615 ) ( not ( = ?auto_6281612 ?auto_6281615 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_6281615 ?auto_6281614 )
      ( GET-2IMAGE ?auto_6281609 ?auto_6281610 ?auto_6281607 ?auto_6281608 )
      ( GET-1IMAGE-VERIFY ?auto_6281607 ?auto_6281608 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6281617 - DIRECTION
      ?auto_6281618 - MODE
      ?auto_6281619 - DIRECTION
      ?auto_6281616 - MODE
    )
    :vars
    (
      ?auto_6281621 - INSTRUMENT
      ?auto_6281623 - SATELLITE
      ?auto_6281620 - DIRECTION
      ?auto_6281622 - DIRECTION
      ?auto_6281624 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6281619 ?auto_6281617 ) ) ( ON_BOARD ?auto_6281621 ?auto_6281623 ) ( SUPPORTS ?auto_6281621 ?auto_6281616 ) ( not ( = ?auto_6281619 ?auto_6281620 ) ) ( HAVE_IMAGE ?auto_6281617 ?auto_6281618 ) ( not ( = ?auto_6281617 ?auto_6281620 ) ) ( not ( = ?auto_6281618 ?auto_6281616 ) ) ( CALIBRATION_TARGET ?auto_6281621 ?auto_6281620 ) ( POINTING ?auto_6281623 ?auto_6281622 ) ( not ( = ?auto_6281620 ?auto_6281622 ) ) ( not ( = ?auto_6281619 ?auto_6281622 ) ) ( not ( = ?auto_6281617 ?auto_6281622 ) ) ( ON_BOARD ?auto_6281624 ?auto_6281623 ) ( POWER_ON ?auto_6281624 ) ( not ( = ?auto_6281621 ?auto_6281624 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6281619 ?auto_6281616 )
      ( GET-2IMAGE-VERIFY ?auto_6281617 ?auto_6281618 ?auto_6281619 ?auto_6281616 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6281626 - DIRECTION
      ?auto_6281627 - MODE
      ?auto_6281628 - DIRECTION
      ?auto_6281625 - MODE
    )
    :vars
    (
      ?auto_6281632 - DIRECTION
      ?auto_6281631 - INSTRUMENT
      ?auto_6281629 - SATELLITE
      ?auto_6281634 - DIRECTION
      ?auto_6281630 - MODE
      ?auto_6281633 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6281628 ?auto_6281626 ) ) ( not ( = ?auto_6281628 ?auto_6281632 ) ) ( ON_BOARD ?auto_6281631 ?auto_6281629 ) ( SUPPORTS ?auto_6281631 ?auto_6281625 ) ( not ( = ?auto_6281628 ?auto_6281634 ) ) ( HAVE_IMAGE ?auto_6281632 ?auto_6281630 ) ( not ( = ?auto_6281632 ?auto_6281634 ) ) ( not ( = ?auto_6281630 ?auto_6281625 ) ) ( CALIBRATION_TARGET ?auto_6281631 ?auto_6281634 ) ( POINTING ?auto_6281629 ?auto_6281626 ) ( not ( = ?auto_6281634 ?auto_6281626 ) ) ( not ( = ?auto_6281632 ?auto_6281626 ) ) ( ON_BOARD ?auto_6281633 ?auto_6281629 ) ( POWER_ON ?auto_6281633 ) ( not ( = ?auto_6281631 ?auto_6281633 ) ) ( HAVE_IMAGE ?auto_6281626 ?auto_6281627 ) ( not ( = ?auto_6281627 ?auto_6281625 ) ) ( not ( = ?auto_6281627 ?auto_6281630 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6281632 ?auto_6281630 ?auto_6281628 ?auto_6281625 )
      ( GET-2IMAGE-VERIFY ?auto_6281626 ?auto_6281627 ?auto_6281628 ?auto_6281625 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6281636 - DIRECTION
      ?auto_6281637 - MODE
      ?auto_6281638 - DIRECTION
      ?auto_6281635 - MODE
    )
    :vars
    (
      ?auto_6281641 - INSTRUMENT
      ?auto_6281640 - SATELLITE
      ?auto_6281643 - DIRECTION
      ?auto_6281639 - DIRECTION
      ?auto_6281642 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6281638 ?auto_6281636 ) ) ( ON_BOARD ?auto_6281641 ?auto_6281640 ) ( SUPPORTS ?auto_6281641 ?auto_6281637 ) ( not ( = ?auto_6281636 ?auto_6281643 ) ) ( HAVE_IMAGE ?auto_6281638 ?auto_6281635 ) ( not ( = ?auto_6281638 ?auto_6281643 ) ) ( not ( = ?auto_6281635 ?auto_6281637 ) ) ( CALIBRATION_TARGET ?auto_6281641 ?auto_6281643 ) ( POINTING ?auto_6281640 ?auto_6281639 ) ( not ( = ?auto_6281643 ?auto_6281639 ) ) ( not ( = ?auto_6281636 ?auto_6281639 ) ) ( not ( = ?auto_6281638 ?auto_6281639 ) ) ( ON_BOARD ?auto_6281642 ?auto_6281640 ) ( POWER_ON ?auto_6281642 ) ( not ( = ?auto_6281641 ?auto_6281642 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6281638 ?auto_6281635 ?auto_6281636 ?auto_6281637 )
      ( GET-2IMAGE-VERIFY ?auto_6281636 ?auto_6281637 ?auto_6281638 ?auto_6281635 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6281645 - DIRECTION
      ?auto_6281646 - MODE
      ?auto_6281647 - DIRECTION
      ?auto_6281644 - MODE
    )
    :vars
    (
      ?auto_6281651 - DIRECTION
      ?auto_6281650 - INSTRUMENT
      ?auto_6281648 - SATELLITE
      ?auto_6281653 - DIRECTION
      ?auto_6281649 - MODE
      ?auto_6281652 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6281647 ?auto_6281645 ) ) ( not ( = ?auto_6281645 ?auto_6281651 ) ) ( ON_BOARD ?auto_6281650 ?auto_6281648 ) ( SUPPORTS ?auto_6281650 ?auto_6281646 ) ( not ( = ?auto_6281645 ?auto_6281653 ) ) ( HAVE_IMAGE ?auto_6281651 ?auto_6281649 ) ( not ( = ?auto_6281651 ?auto_6281653 ) ) ( not ( = ?auto_6281649 ?auto_6281646 ) ) ( CALIBRATION_TARGET ?auto_6281650 ?auto_6281653 ) ( POINTING ?auto_6281648 ?auto_6281647 ) ( not ( = ?auto_6281653 ?auto_6281647 ) ) ( not ( = ?auto_6281651 ?auto_6281647 ) ) ( ON_BOARD ?auto_6281652 ?auto_6281648 ) ( POWER_ON ?auto_6281652 ) ( not ( = ?auto_6281650 ?auto_6281652 ) ) ( HAVE_IMAGE ?auto_6281647 ?auto_6281644 ) ( not ( = ?auto_6281646 ?auto_6281644 ) ) ( not ( = ?auto_6281644 ?auto_6281649 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6281651 ?auto_6281649 ?auto_6281645 ?auto_6281646 )
      ( GET-2IMAGE-VERIFY ?auto_6281645 ?auto_6281646 ?auto_6281647 ?auto_6281644 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6281677 - DIRECTION
      ?auto_6281678 - MODE
      ?auto_6281679 - DIRECTION
      ?auto_6281676 - MODE
      ?auto_6281681 - DIRECTION
      ?auto_6281680 - MODE
    )
    :vars
    (
      ?auto_6281683 - INSTRUMENT
      ?auto_6281682 - SATELLITE
      ?auto_6281685 - DIRECTION
      ?auto_6281684 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6281679 ?auto_6281677 ) ) ( not ( = ?auto_6281681 ?auto_6281677 ) ) ( not ( = ?auto_6281681 ?auto_6281679 ) ) ( ON_BOARD ?auto_6281683 ?auto_6281682 ) ( SUPPORTS ?auto_6281683 ?auto_6281680 ) ( not ( = ?auto_6281681 ?auto_6281685 ) ) ( HAVE_IMAGE ?auto_6281677 ?auto_6281678 ) ( not ( = ?auto_6281677 ?auto_6281685 ) ) ( not ( = ?auto_6281678 ?auto_6281680 ) ) ( CALIBRATION_TARGET ?auto_6281683 ?auto_6281685 ) ( POINTING ?auto_6281682 ?auto_6281679 ) ( not ( = ?auto_6281685 ?auto_6281679 ) ) ( ON_BOARD ?auto_6281684 ?auto_6281682 ) ( POWER_ON ?auto_6281684 ) ( not ( = ?auto_6281683 ?auto_6281684 ) ) ( HAVE_IMAGE ?auto_6281679 ?auto_6281676 ) ( not ( = ?auto_6281678 ?auto_6281676 ) ) ( not ( = ?auto_6281676 ?auto_6281680 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6281677 ?auto_6281678 ?auto_6281681 ?auto_6281680 )
      ( GET-3IMAGE-VERIFY ?auto_6281677 ?auto_6281678 ?auto_6281679 ?auto_6281676 ?auto_6281681 ?auto_6281680 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6281698 - DIRECTION
      ?auto_6281699 - MODE
      ?auto_6281700 - DIRECTION
      ?auto_6281697 - MODE
      ?auto_6281702 - DIRECTION
      ?auto_6281701 - MODE
    )
    :vars
    (
      ?auto_6281704 - INSTRUMENT
      ?auto_6281703 - SATELLITE
      ?auto_6281706 - DIRECTION
      ?auto_6281705 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6281700 ?auto_6281698 ) ) ( not ( = ?auto_6281702 ?auto_6281698 ) ) ( not ( = ?auto_6281702 ?auto_6281700 ) ) ( ON_BOARD ?auto_6281704 ?auto_6281703 ) ( SUPPORTS ?auto_6281704 ?auto_6281697 ) ( not ( = ?auto_6281700 ?auto_6281706 ) ) ( HAVE_IMAGE ?auto_6281698 ?auto_6281699 ) ( not ( = ?auto_6281698 ?auto_6281706 ) ) ( not ( = ?auto_6281699 ?auto_6281697 ) ) ( CALIBRATION_TARGET ?auto_6281704 ?auto_6281706 ) ( POINTING ?auto_6281703 ?auto_6281702 ) ( not ( = ?auto_6281706 ?auto_6281702 ) ) ( ON_BOARD ?auto_6281705 ?auto_6281703 ) ( POWER_ON ?auto_6281705 ) ( not ( = ?auto_6281704 ?auto_6281705 ) ) ( HAVE_IMAGE ?auto_6281702 ?auto_6281701 ) ( not ( = ?auto_6281699 ?auto_6281701 ) ) ( not ( = ?auto_6281697 ?auto_6281701 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6281698 ?auto_6281699 ?auto_6281700 ?auto_6281697 )
      ( GET-3IMAGE-VERIFY ?auto_6281698 ?auto_6281699 ?auto_6281700 ?auto_6281697 ?auto_6281702 ?auto_6281701 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6281719 - DIRECTION
      ?auto_6281720 - MODE
      ?auto_6281721 - DIRECTION
      ?auto_6281718 - MODE
      ?auto_6281723 - DIRECTION
      ?auto_6281722 - MODE
    )
    :vars
    (
      ?auto_6281725 - INSTRUMENT
      ?auto_6281724 - SATELLITE
      ?auto_6281727 - DIRECTION
      ?auto_6281726 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6281721 ?auto_6281719 ) ) ( not ( = ?auto_6281723 ?auto_6281719 ) ) ( not ( = ?auto_6281723 ?auto_6281721 ) ) ( ON_BOARD ?auto_6281725 ?auto_6281724 ) ( SUPPORTS ?auto_6281725 ?auto_6281722 ) ( not ( = ?auto_6281723 ?auto_6281727 ) ) ( HAVE_IMAGE ?auto_6281721 ?auto_6281718 ) ( not ( = ?auto_6281721 ?auto_6281727 ) ) ( not ( = ?auto_6281718 ?auto_6281722 ) ) ( CALIBRATION_TARGET ?auto_6281725 ?auto_6281727 ) ( POINTING ?auto_6281724 ?auto_6281719 ) ( not ( = ?auto_6281727 ?auto_6281719 ) ) ( ON_BOARD ?auto_6281726 ?auto_6281724 ) ( POWER_ON ?auto_6281726 ) ( not ( = ?auto_6281725 ?auto_6281726 ) ) ( HAVE_IMAGE ?auto_6281719 ?auto_6281720 ) ( not ( = ?auto_6281720 ?auto_6281718 ) ) ( not ( = ?auto_6281720 ?auto_6281722 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6281721 ?auto_6281718 ?auto_6281723 ?auto_6281722 )
      ( GET-3IMAGE-VERIFY ?auto_6281719 ?auto_6281720 ?auto_6281721 ?auto_6281718 ?auto_6281723 ?auto_6281722 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6281741 - DIRECTION
      ?auto_6281742 - MODE
      ?auto_6281743 - DIRECTION
      ?auto_6281740 - MODE
      ?auto_6281745 - DIRECTION
      ?auto_6281744 - MODE
    )
    :vars
    (
      ?auto_6281747 - INSTRUMENT
      ?auto_6281746 - SATELLITE
      ?auto_6281749 - DIRECTION
      ?auto_6281748 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6281743 ?auto_6281741 ) ) ( not ( = ?auto_6281745 ?auto_6281741 ) ) ( not ( = ?auto_6281745 ?auto_6281743 ) ) ( ON_BOARD ?auto_6281747 ?auto_6281746 ) ( SUPPORTS ?auto_6281747 ?auto_6281740 ) ( not ( = ?auto_6281743 ?auto_6281749 ) ) ( HAVE_IMAGE ?auto_6281745 ?auto_6281744 ) ( not ( = ?auto_6281745 ?auto_6281749 ) ) ( not ( = ?auto_6281744 ?auto_6281740 ) ) ( CALIBRATION_TARGET ?auto_6281747 ?auto_6281749 ) ( POINTING ?auto_6281746 ?auto_6281741 ) ( not ( = ?auto_6281749 ?auto_6281741 ) ) ( ON_BOARD ?auto_6281748 ?auto_6281746 ) ( POWER_ON ?auto_6281748 ) ( not ( = ?auto_6281747 ?auto_6281748 ) ) ( HAVE_IMAGE ?auto_6281741 ?auto_6281742 ) ( not ( = ?auto_6281742 ?auto_6281740 ) ) ( not ( = ?auto_6281742 ?auto_6281744 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6281745 ?auto_6281744 ?auto_6281743 ?auto_6281740 )
      ( GET-3IMAGE-VERIFY ?auto_6281741 ?auto_6281742 ?auto_6281743 ?auto_6281740 ?auto_6281745 ?auto_6281744 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6281786 - DIRECTION
      ?auto_6281787 - MODE
      ?auto_6281788 - DIRECTION
      ?auto_6281785 - MODE
      ?auto_6281790 - DIRECTION
      ?auto_6281789 - MODE
    )
    :vars
    (
      ?auto_6281792 - INSTRUMENT
      ?auto_6281791 - SATELLITE
      ?auto_6281794 - DIRECTION
      ?auto_6281793 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6281788 ?auto_6281786 ) ) ( not ( = ?auto_6281790 ?auto_6281786 ) ) ( not ( = ?auto_6281790 ?auto_6281788 ) ) ( ON_BOARD ?auto_6281792 ?auto_6281791 ) ( SUPPORTS ?auto_6281792 ?auto_6281787 ) ( not ( = ?auto_6281786 ?auto_6281794 ) ) ( HAVE_IMAGE ?auto_6281788 ?auto_6281785 ) ( not ( = ?auto_6281788 ?auto_6281794 ) ) ( not ( = ?auto_6281785 ?auto_6281787 ) ) ( CALIBRATION_TARGET ?auto_6281792 ?auto_6281794 ) ( POINTING ?auto_6281791 ?auto_6281790 ) ( not ( = ?auto_6281794 ?auto_6281790 ) ) ( ON_BOARD ?auto_6281793 ?auto_6281791 ) ( POWER_ON ?auto_6281793 ) ( not ( = ?auto_6281792 ?auto_6281793 ) ) ( HAVE_IMAGE ?auto_6281790 ?auto_6281789 ) ( not ( = ?auto_6281787 ?auto_6281789 ) ) ( not ( = ?auto_6281785 ?auto_6281789 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6281788 ?auto_6281785 ?auto_6281786 ?auto_6281787 )
      ( GET-3IMAGE-VERIFY ?auto_6281786 ?auto_6281787 ?auto_6281788 ?auto_6281785 ?auto_6281790 ?auto_6281789 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6281807 - DIRECTION
      ?auto_6281808 - MODE
      ?auto_6281809 - DIRECTION
      ?auto_6281806 - MODE
      ?auto_6281811 - DIRECTION
      ?auto_6281810 - MODE
    )
    :vars
    (
      ?auto_6281813 - INSTRUMENT
      ?auto_6281812 - SATELLITE
      ?auto_6281815 - DIRECTION
      ?auto_6281814 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6281809 ?auto_6281807 ) ) ( not ( = ?auto_6281811 ?auto_6281807 ) ) ( not ( = ?auto_6281811 ?auto_6281809 ) ) ( ON_BOARD ?auto_6281813 ?auto_6281812 ) ( SUPPORTS ?auto_6281813 ?auto_6281808 ) ( not ( = ?auto_6281807 ?auto_6281815 ) ) ( HAVE_IMAGE ?auto_6281811 ?auto_6281810 ) ( not ( = ?auto_6281811 ?auto_6281815 ) ) ( not ( = ?auto_6281810 ?auto_6281808 ) ) ( CALIBRATION_TARGET ?auto_6281813 ?auto_6281815 ) ( POINTING ?auto_6281812 ?auto_6281809 ) ( not ( = ?auto_6281815 ?auto_6281809 ) ) ( ON_BOARD ?auto_6281814 ?auto_6281812 ) ( POWER_ON ?auto_6281814 ) ( not ( = ?auto_6281813 ?auto_6281814 ) ) ( HAVE_IMAGE ?auto_6281809 ?auto_6281806 ) ( not ( = ?auto_6281808 ?auto_6281806 ) ) ( not ( = ?auto_6281806 ?auto_6281810 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6281811 ?auto_6281810 ?auto_6281807 ?auto_6281808 )
      ( GET-3IMAGE-VERIFY ?auto_6281807 ?auto_6281808 ?auto_6281809 ?auto_6281806 ?auto_6281811 ?auto_6281810 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_6289872 - DIRECTION
      ?auto_6289873 - MODE
    )
    :vars
    (
      ?auto_6289875 - DIRECTION
      ?auto_6289874 - INSTRUMENT
      ?auto_6289877 - SATELLITE
      ?auto_6289879 - DIRECTION
      ?auto_6289876 - MODE
      ?auto_6289878 - DIRECTION
      ?auto_6289880 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6289872 ?auto_6289875 ) ) ( ON_BOARD ?auto_6289874 ?auto_6289877 ) ( SUPPORTS ?auto_6289874 ?auto_6289873 ) ( not ( = ?auto_6289872 ?auto_6289879 ) ) ( HAVE_IMAGE ?auto_6289875 ?auto_6289876 ) ( not ( = ?auto_6289875 ?auto_6289879 ) ) ( not ( = ?auto_6289876 ?auto_6289873 ) ) ( CALIBRATION_TARGET ?auto_6289874 ?auto_6289879 ) ( not ( = ?auto_6289879 ?auto_6289878 ) ) ( not ( = ?auto_6289872 ?auto_6289878 ) ) ( not ( = ?auto_6289875 ?auto_6289878 ) ) ( ON_BOARD ?auto_6289880 ?auto_6289877 ) ( POWER_ON ?auto_6289880 ) ( not ( = ?auto_6289874 ?auto_6289880 ) ) ( POINTING ?auto_6289877 ?auto_6289879 ) )
    :subtasks
    ( ( !TURN_TO ?auto_6289877 ?auto_6289878 ?auto_6289879 )
      ( GET-2IMAGE ?auto_6289875 ?auto_6289876 ?auto_6289872 ?auto_6289873 )
      ( GET-1IMAGE-VERIFY ?auto_6289872 ?auto_6289873 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6289882 - DIRECTION
      ?auto_6289883 - MODE
      ?auto_6289884 - DIRECTION
      ?auto_6289881 - MODE
    )
    :vars
    (
      ?auto_6289885 - INSTRUMENT
      ?auto_6289886 - SATELLITE
      ?auto_6289887 - DIRECTION
      ?auto_6289889 - DIRECTION
      ?auto_6289888 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6289884 ?auto_6289882 ) ) ( ON_BOARD ?auto_6289885 ?auto_6289886 ) ( SUPPORTS ?auto_6289885 ?auto_6289881 ) ( not ( = ?auto_6289884 ?auto_6289887 ) ) ( HAVE_IMAGE ?auto_6289882 ?auto_6289883 ) ( not ( = ?auto_6289882 ?auto_6289887 ) ) ( not ( = ?auto_6289883 ?auto_6289881 ) ) ( CALIBRATION_TARGET ?auto_6289885 ?auto_6289887 ) ( not ( = ?auto_6289887 ?auto_6289889 ) ) ( not ( = ?auto_6289884 ?auto_6289889 ) ) ( not ( = ?auto_6289882 ?auto_6289889 ) ) ( ON_BOARD ?auto_6289888 ?auto_6289886 ) ( POWER_ON ?auto_6289888 ) ( not ( = ?auto_6289885 ?auto_6289888 ) ) ( POINTING ?auto_6289886 ?auto_6289887 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6289884 ?auto_6289881 )
      ( GET-2IMAGE-VERIFY ?auto_6289882 ?auto_6289883 ?auto_6289884 ?auto_6289881 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_6289901 - DIRECTION
      ?auto_6289902 - MODE
      ?auto_6289903 - DIRECTION
      ?auto_6289900 - MODE
    )
    :vars
    (
      ?auto_6289905 - INSTRUMENT
      ?auto_6289906 - SATELLITE
      ?auto_6289904 - DIRECTION
      ?auto_6289907 - DIRECTION
      ?auto_6289908 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6289903 ?auto_6289901 ) ) ( ON_BOARD ?auto_6289905 ?auto_6289906 ) ( SUPPORTS ?auto_6289905 ?auto_6289902 ) ( not ( = ?auto_6289901 ?auto_6289904 ) ) ( HAVE_IMAGE ?auto_6289903 ?auto_6289900 ) ( not ( = ?auto_6289903 ?auto_6289904 ) ) ( not ( = ?auto_6289900 ?auto_6289902 ) ) ( CALIBRATION_TARGET ?auto_6289905 ?auto_6289904 ) ( not ( = ?auto_6289904 ?auto_6289907 ) ) ( not ( = ?auto_6289901 ?auto_6289907 ) ) ( not ( = ?auto_6289903 ?auto_6289907 ) ) ( ON_BOARD ?auto_6289908 ?auto_6289906 ) ( POWER_ON ?auto_6289908 ) ( not ( = ?auto_6289905 ?auto_6289908 ) ) ( POINTING ?auto_6289906 ?auto_6289904 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6289903 ?auto_6289900 ?auto_6289901 ?auto_6289902 )
      ( GET-2IMAGE-VERIFY ?auto_6289901 ?auto_6289902 ?auto_6289903 ?auto_6289900 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6339479 - DIRECTION
      ?auto_6339480 - MODE
      ?auto_6339481 - DIRECTION
      ?auto_6339478 - MODE
      ?auto_6339483 - DIRECTION
      ?auto_6339482 - MODE
      ?auto_6339484 - DIRECTION
      ?auto_6339485 - MODE
    )
    :vars
    (
      ?auto_6339487 - INSTRUMENT
      ?auto_6339486 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_6339481 ?auto_6339479 ) ) ( not ( = ?auto_6339483 ?auto_6339479 ) ) ( not ( = ?auto_6339483 ?auto_6339481 ) ) ( not ( = ?auto_6339484 ?auto_6339479 ) ) ( not ( = ?auto_6339484 ?auto_6339481 ) ) ( not ( = ?auto_6339484 ?auto_6339483 ) ) ( CALIBRATED ?auto_6339487 ) ( ON_BOARD ?auto_6339487 ?auto_6339486 ) ( SUPPORTS ?auto_6339487 ?auto_6339485 ) ( POWER_ON ?auto_6339487 ) ( POINTING ?auto_6339486 ?auto_6339484 ) ( HAVE_IMAGE ?auto_6339479 ?auto_6339480 ) ( HAVE_IMAGE ?auto_6339481 ?auto_6339478 ) ( HAVE_IMAGE ?auto_6339483 ?auto_6339482 ) ( not ( = ?auto_6339480 ?auto_6339478 ) ) ( not ( = ?auto_6339480 ?auto_6339482 ) ) ( not ( = ?auto_6339480 ?auto_6339485 ) ) ( not ( = ?auto_6339478 ?auto_6339482 ) ) ( not ( = ?auto_6339478 ?auto_6339485 ) ) ( not ( = ?auto_6339482 ?auto_6339485 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6339484 ?auto_6339485 )
      ( GET-4IMAGE-VERIFY ?auto_6339479 ?auto_6339480 ?auto_6339481 ?auto_6339478 ?auto_6339483 ?auto_6339482 ?auto_6339484 ?auto_6339485 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6339509 - DIRECTION
      ?auto_6339510 - MODE
      ?auto_6339511 - DIRECTION
      ?auto_6339508 - MODE
      ?auto_6339513 - DIRECTION
      ?auto_6339512 - MODE
      ?auto_6339514 - DIRECTION
      ?auto_6339515 - MODE
    )
    :vars
    (
      ?auto_6339517 - INSTRUMENT
      ?auto_6339516 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_6339511 ?auto_6339509 ) ) ( not ( = ?auto_6339513 ?auto_6339509 ) ) ( not ( = ?auto_6339513 ?auto_6339511 ) ) ( not ( = ?auto_6339514 ?auto_6339509 ) ) ( not ( = ?auto_6339514 ?auto_6339511 ) ) ( not ( = ?auto_6339514 ?auto_6339513 ) ) ( CALIBRATED ?auto_6339517 ) ( ON_BOARD ?auto_6339517 ?auto_6339516 ) ( SUPPORTS ?auto_6339517 ?auto_6339512 ) ( POWER_ON ?auto_6339517 ) ( POINTING ?auto_6339516 ?auto_6339513 ) ( HAVE_IMAGE ?auto_6339509 ?auto_6339510 ) ( HAVE_IMAGE ?auto_6339511 ?auto_6339508 ) ( HAVE_IMAGE ?auto_6339514 ?auto_6339515 ) ( not ( = ?auto_6339510 ?auto_6339508 ) ) ( not ( = ?auto_6339510 ?auto_6339512 ) ) ( not ( = ?auto_6339510 ?auto_6339515 ) ) ( not ( = ?auto_6339508 ?auto_6339512 ) ) ( not ( = ?auto_6339508 ?auto_6339515 ) ) ( not ( = ?auto_6339512 ?auto_6339515 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6339513 ?auto_6339512 )
      ( GET-4IMAGE-VERIFY ?auto_6339509 ?auto_6339510 ?auto_6339511 ?auto_6339508 ?auto_6339513 ?auto_6339512 ?auto_6339514 ?auto_6339515 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6339655 - DIRECTION
      ?auto_6339656 - MODE
      ?auto_6339657 - DIRECTION
      ?auto_6339654 - MODE
      ?auto_6339659 - DIRECTION
      ?auto_6339658 - MODE
      ?auto_6339660 - DIRECTION
      ?auto_6339661 - MODE
    )
    :vars
    (
      ?auto_6339663 - INSTRUMENT
      ?auto_6339662 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_6339657 ?auto_6339655 ) ) ( not ( = ?auto_6339659 ?auto_6339655 ) ) ( not ( = ?auto_6339659 ?auto_6339657 ) ) ( not ( = ?auto_6339660 ?auto_6339655 ) ) ( not ( = ?auto_6339660 ?auto_6339657 ) ) ( not ( = ?auto_6339660 ?auto_6339659 ) ) ( CALIBRATED ?auto_6339663 ) ( ON_BOARD ?auto_6339663 ?auto_6339662 ) ( SUPPORTS ?auto_6339663 ?auto_6339654 ) ( POWER_ON ?auto_6339663 ) ( POINTING ?auto_6339662 ?auto_6339657 ) ( HAVE_IMAGE ?auto_6339655 ?auto_6339656 ) ( HAVE_IMAGE ?auto_6339659 ?auto_6339658 ) ( HAVE_IMAGE ?auto_6339660 ?auto_6339661 ) ( not ( = ?auto_6339656 ?auto_6339654 ) ) ( not ( = ?auto_6339656 ?auto_6339658 ) ) ( not ( = ?auto_6339656 ?auto_6339661 ) ) ( not ( = ?auto_6339654 ?auto_6339658 ) ) ( not ( = ?auto_6339654 ?auto_6339661 ) ) ( not ( = ?auto_6339658 ?auto_6339661 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6339657 ?auto_6339654 )
      ( GET-4IMAGE-VERIFY ?auto_6339655 ?auto_6339656 ?auto_6339657 ?auto_6339654 ?auto_6339659 ?auto_6339658 ?auto_6339660 ?auto_6339661 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6340529 - DIRECTION
      ?auto_6340530 - MODE
      ?auto_6340531 - DIRECTION
      ?auto_6340528 - MODE
      ?auto_6340533 - DIRECTION
      ?auto_6340532 - MODE
      ?auto_6340534 - DIRECTION
      ?auto_6340535 - MODE
    )
    :vars
    (
      ?auto_6340537 - INSTRUMENT
      ?auto_6340536 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_6340531 ?auto_6340529 ) ) ( not ( = ?auto_6340533 ?auto_6340529 ) ) ( not ( = ?auto_6340533 ?auto_6340531 ) ) ( not ( = ?auto_6340534 ?auto_6340529 ) ) ( not ( = ?auto_6340534 ?auto_6340531 ) ) ( not ( = ?auto_6340534 ?auto_6340533 ) ) ( CALIBRATED ?auto_6340537 ) ( ON_BOARD ?auto_6340537 ?auto_6340536 ) ( SUPPORTS ?auto_6340537 ?auto_6340530 ) ( POWER_ON ?auto_6340537 ) ( POINTING ?auto_6340536 ?auto_6340529 ) ( HAVE_IMAGE ?auto_6340531 ?auto_6340528 ) ( HAVE_IMAGE ?auto_6340533 ?auto_6340532 ) ( HAVE_IMAGE ?auto_6340534 ?auto_6340535 ) ( not ( = ?auto_6340530 ?auto_6340528 ) ) ( not ( = ?auto_6340530 ?auto_6340532 ) ) ( not ( = ?auto_6340530 ?auto_6340535 ) ) ( not ( = ?auto_6340528 ?auto_6340532 ) ) ( not ( = ?auto_6340528 ?auto_6340535 ) ) ( not ( = ?auto_6340532 ?auto_6340535 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6340529 ?auto_6340530 )
      ( GET-4IMAGE-VERIFY ?auto_6340529 ?auto_6340530 ?auto_6340531 ?auto_6340528 ?auto_6340533 ?auto_6340532 ?auto_6340534 ?auto_6340535 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6350928 - DIRECTION
      ?auto_6350929 - MODE
      ?auto_6350930 - DIRECTION
      ?auto_6350927 - MODE
      ?auto_6350932 - DIRECTION
      ?auto_6350931 - MODE
      ?auto_6350933 - DIRECTION
      ?auto_6350934 - MODE
    )
    :vars
    (
      ?auto_6350936 - INSTRUMENT
      ?auto_6350935 - SATELLITE
      ?auto_6350937 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6350930 ?auto_6350928 ) ) ( not ( = ?auto_6350932 ?auto_6350928 ) ) ( not ( = ?auto_6350932 ?auto_6350930 ) ) ( not ( = ?auto_6350933 ?auto_6350928 ) ) ( not ( = ?auto_6350933 ?auto_6350930 ) ) ( not ( = ?auto_6350933 ?auto_6350932 ) ) ( CALIBRATED ?auto_6350936 ) ( ON_BOARD ?auto_6350936 ?auto_6350935 ) ( SUPPORTS ?auto_6350936 ?auto_6350934 ) ( POWER_ON ?auto_6350936 ) ( POINTING ?auto_6350935 ?auto_6350937 ) ( not ( = ?auto_6350933 ?auto_6350937 ) ) ( HAVE_IMAGE ?auto_6350928 ?auto_6350929 ) ( not ( = ?auto_6350928 ?auto_6350937 ) ) ( not ( = ?auto_6350929 ?auto_6350934 ) ) ( HAVE_IMAGE ?auto_6350930 ?auto_6350927 ) ( HAVE_IMAGE ?auto_6350932 ?auto_6350931 ) ( not ( = ?auto_6350929 ?auto_6350927 ) ) ( not ( = ?auto_6350929 ?auto_6350931 ) ) ( not ( = ?auto_6350930 ?auto_6350937 ) ) ( not ( = ?auto_6350927 ?auto_6350931 ) ) ( not ( = ?auto_6350927 ?auto_6350934 ) ) ( not ( = ?auto_6350932 ?auto_6350937 ) ) ( not ( = ?auto_6350931 ?auto_6350934 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6350928 ?auto_6350929 ?auto_6350933 ?auto_6350934 )
      ( GET-4IMAGE-VERIFY ?auto_6350928 ?auto_6350929 ?auto_6350930 ?auto_6350927 ?auto_6350932 ?auto_6350931 ?auto_6350933 ?auto_6350934 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6350961 - DIRECTION
      ?auto_6350962 - MODE
      ?auto_6350963 - DIRECTION
      ?auto_6350960 - MODE
      ?auto_6350965 - DIRECTION
      ?auto_6350964 - MODE
      ?auto_6350966 - DIRECTION
      ?auto_6350967 - MODE
    )
    :vars
    (
      ?auto_6350969 - INSTRUMENT
      ?auto_6350968 - SATELLITE
      ?auto_6350970 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6350963 ?auto_6350961 ) ) ( not ( = ?auto_6350965 ?auto_6350961 ) ) ( not ( = ?auto_6350965 ?auto_6350963 ) ) ( not ( = ?auto_6350966 ?auto_6350961 ) ) ( not ( = ?auto_6350966 ?auto_6350963 ) ) ( not ( = ?auto_6350966 ?auto_6350965 ) ) ( CALIBRATED ?auto_6350969 ) ( ON_BOARD ?auto_6350969 ?auto_6350968 ) ( SUPPORTS ?auto_6350969 ?auto_6350964 ) ( POWER_ON ?auto_6350969 ) ( POINTING ?auto_6350968 ?auto_6350970 ) ( not ( = ?auto_6350965 ?auto_6350970 ) ) ( HAVE_IMAGE ?auto_6350961 ?auto_6350962 ) ( not ( = ?auto_6350961 ?auto_6350970 ) ) ( not ( = ?auto_6350962 ?auto_6350964 ) ) ( HAVE_IMAGE ?auto_6350963 ?auto_6350960 ) ( HAVE_IMAGE ?auto_6350966 ?auto_6350967 ) ( not ( = ?auto_6350962 ?auto_6350960 ) ) ( not ( = ?auto_6350962 ?auto_6350967 ) ) ( not ( = ?auto_6350963 ?auto_6350970 ) ) ( not ( = ?auto_6350960 ?auto_6350964 ) ) ( not ( = ?auto_6350960 ?auto_6350967 ) ) ( not ( = ?auto_6350964 ?auto_6350967 ) ) ( not ( = ?auto_6350966 ?auto_6350970 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6350961 ?auto_6350962 ?auto_6350965 ?auto_6350964 )
      ( GET-4IMAGE-VERIFY ?auto_6350961 ?auto_6350962 ?auto_6350963 ?auto_6350960 ?auto_6350965 ?auto_6350964 ?auto_6350966 ?auto_6350967 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6351120 - DIRECTION
      ?auto_6351121 - MODE
      ?auto_6351122 - DIRECTION
      ?auto_6351119 - MODE
      ?auto_6351124 - DIRECTION
      ?auto_6351123 - MODE
      ?auto_6351125 - DIRECTION
      ?auto_6351126 - MODE
    )
    :vars
    (
      ?auto_6351128 - INSTRUMENT
      ?auto_6351127 - SATELLITE
      ?auto_6351129 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6351122 ?auto_6351120 ) ) ( not ( = ?auto_6351124 ?auto_6351120 ) ) ( not ( = ?auto_6351124 ?auto_6351122 ) ) ( not ( = ?auto_6351125 ?auto_6351120 ) ) ( not ( = ?auto_6351125 ?auto_6351122 ) ) ( not ( = ?auto_6351125 ?auto_6351124 ) ) ( CALIBRATED ?auto_6351128 ) ( ON_BOARD ?auto_6351128 ?auto_6351127 ) ( SUPPORTS ?auto_6351128 ?auto_6351119 ) ( POWER_ON ?auto_6351128 ) ( POINTING ?auto_6351127 ?auto_6351129 ) ( not ( = ?auto_6351122 ?auto_6351129 ) ) ( HAVE_IMAGE ?auto_6351120 ?auto_6351121 ) ( not ( = ?auto_6351120 ?auto_6351129 ) ) ( not ( = ?auto_6351121 ?auto_6351119 ) ) ( HAVE_IMAGE ?auto_6351124 ?auto_6351123 ) ( HAVE_IMAGE ?auto_6351125 ?auto_6351126 ) ( not ( = ?auto_6351121 ?auto_6351123 ) ) ( not ( = ?auto_6351121 ?auto_6351126 ) ) ( not ( = ?auto_6351119 ?auto_6351123 ) ) ( not ( = ?auto_6351119 ?auto_6351126 ) ) ( not ( = ?auto_6351124 ?auto_6351129 ) ) ( not ( = ?auto_6351123 ?auto_6351126 ) ) ( not ( = ?auto_6351125 ?auto_6351129 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6351120 ?auto_6351121 ?auto_6351122 ?auto_6351119 )
      ( GET-4IMAGE-VERIFY ?auto_6351120 ?auto_6351121 ?auto_6351122 ?auto_6351119 ?auto_6351124 ?auto_6351123 ?auto_6351125 ?auto_6351126 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6352147 - DIRECTION
      ?auto_6352148 - MODE
      ?auto_6352149 - DIRECTION
      ?auto_6352146 - MODE
      ?auto_6352151 - DIRECTION
      ?auto_6352150 - MODE
      ?auto_6352152 - DIRECTION
      ?auto_6352153 - MODE
    )
    :vars
    (
      ?auto_6352155 - INSTRUMENT
      ?auto_6352154 - SATELLITE
      ?auto_6352156 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6352149 ?auto_6352147 ) ) ( not ( = ?auto_6352151 ?auto_6352147 ) ) ( not ( = ?auto_6352151 ?auto_6352149 ) ) ( not ( = ?auto_6352152 ?auto_6352147 ) ) ( not ( = ?auto_6352152 ?auto_6352149 ) ) ( not ( = ?auto_6352152 ?auto_6352151 ) ) ( CALIBRATED ?auto_6352155 ) ( ON_BOARD ?auto_6352155 ?auto_6352154 ) ( SUPPORTS ?auto_6352155 ?auto_6352148 ) ( POWER_ON ?auto_6352155 ) ( POINTING ?auto_6352154 ?auto_6352156 ) ( not ( = ?auto_6352147 ?auto_6352156 ) ) ( HAVE_IMAGE ?auto_6352149 ?auto_6352146 ) ( not ( = ?auto_6352149 ?auto_6352156 ) ) ( not ( = ?auto_6352146 ?auto_6352148 ) ) ( HAVE_IMAGE ?auto_6352151 ?auto_6352150 ) ( HAVE_IMAGE ?auto_6352152 ?auto_6352153 ) ( not ( = ?auto_6352148 ?auto_6352150 ) ) ( not ( = ?auto_6352148 ?auto_6352153 ) ) ( not ( = ?auto_6352146 ?auto_6352150 ) ) ( not ( = ?auto_6352146 ?auto_6352153 ) ) ( not ( = ?auto_6352151 ?auto_6352156 ) ) ( not ( = ?auto_6352150 ?auto_6352153 ) ) ( not ( = ?auto_6352152 ?auto_6352156 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6352149 ?auto_6352146 ?auto_6352147 ?auto_6352148 )
      ( GET-4IMAGE-VERIFY ?auto_6352147 ?auto_6352148 ?auto_6352149 ?auto_6352146 ?auto_6352151 ?auto_6352150 ?auto_6352152 ?auto_6352153 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6363858 - DIRECTION
      ?auto_6363859 - MODE
      ?auto_6363860 - DIRECTION
      ?auto_6363857 - MODE
      ?auto_6363862 - DIRECTION
      ?auto_6363861 - MODE
      ?auto_6363863 - DIRECTION
      ?auto_6363864 - MODE
    )
    :vars
    (
      ?auto_6363865 - INSTRUMENT
      ?auto_6363867 - SATELLITE
      ?auto_6363866 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6363860 ?auto_6363858 ) ) ( not ( = ?auto_6363862 ?auto_6363858 ) ) ( not ( = ?auto_6363862 ?auto_6363860 ) ) ( not ( = ?auto_6363863 ?auto_6363858 ) ) ( not ( = ?auto_6363863 ?auto_6363860 ) ) ( not ( = ?auto_6363863 ?auto_6363862 ) ) ( ON_BOARD ?auto_6363865 ?auto_6363867 ) ( SUPPORTS ?auto_6363865 ?auto_6363864 ) ( POWER_ON ?auto_6363865 ) ( POINTING ?auto_6363867 ?auto_6363866 ) ( not ( = ?auto_6363863 ?auto_6363866 ) ) ( HAVE_IMAGE ?auto_6363858 ?auto_6363859 ) ( not ( = ?auto_6363858 ?auto_6363866 ) ) ( not ( = ?auto_6363859 ?auto_6363864 ) ) ( CALIBRATION_TARGET ?auto_6363865 ?auto_6363866 ) ( NOT_CALIBRATED ?auto_6363865 ) ( HAVE_IMAGE ?auto_6363860 ?auto_6363857 ) ( HAVE_IMAGE ?auto_6363862 ?auto_6363861 ) ( not ( = ?auto_6363859 ?auto_6363857 ) ) ( not ( = ?auto_6363859 ?auto_6363861 ) ) ( not ( = ?auto_6363860 ?auto_6363866 ) ) ( not ( = ?auto_6363857 ?auto_6363861 ) ) ( not ( = ?auto_6363857 ?auto_6363864 ) ) ( not ( = ?auto_6363862 ?auto_6363866 ) ) ( not ( = ?auto_6363861 ?auto_6363864 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6363858 ?auto_6363859 ?auto_6363863 ?auto_6363864 )
      ( GET-4IMAGE-VERIFY ?auto_6363858 ?auto_6363859 ?auto_6363860 ?auto_6363857 ?auto_6363862 ?auto_6363861 ?auto_6363863 ?auto_6363864 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6363891 - DIRECTION
      ?auto_6363892 - MODE
      ?auto_6363893 - DIRECTION
      ?auto_6363890 - MODE
      ?auto_6363895 - DIRECTION
      ?auto_6363894 - MODE
      ?auto_6363896 - DIRECTION
      ?auto_6363897 - MODE
    )
    :vars
    (
      ?auto_6363898 - INSTRUMENT
      ?auto_6363900 - SATELLITE
      ?auto_6363899 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6363893 ?auto_6363891 ) ) ( not ( = ?auto_6363895 ?auto_6363891 ) ) ( not ( = ?auto_6363895 ?auto_6363893 ) ) ( not ( = ?auto_6363896 ?auto_6363891 ) ) ( not ( = ?auto_6363896 ?auto_6363893 ) ) ( not ( = ?auto_6363896 ?auto_6363895 ) ) ( ON_BOARD ?auto_6363898 ?auto_6363900 ) ( SUPPORTS ?auto_6363898 ?auto_6363894 ) ( POWER_ON ?auto_6363898 ) ( POINTING ?auto_6363900 ?auto_6363899 ) ( not ( = ?auto_6363895 ?auto_6363899 ) ) ( HAVE_IMAGE ?auto_6363891 ?auto_6363892 ) ( not ( = ?auto_6363891 ?auto_6363899 ) ) ( not ( = ?auto_6363892 ?auto_6363894 ) ) ( CALIBRATION_TARGET ?auto_6363898 ?auto_6363899 ) ( NOT_CALIBRATED ?auto_6363898 ) ( HAVE_IMAGE ?auto_6363893 ?auto_6363890 ) ( HAVE_IMAGE ?auto_6363896 ?auto_6363897 ) ( not ( = ?auto_6363892 ?auto_6363890 ) ) ( not ( = ?auto_6363892 ?auto_6363897 ) ) ( not ( = ?auto_6363893 ?auto_6363899 ) ) ( not ( = ?auto_6363890 ?auto_6363894 ) ) ( not ( = ?auto_6363890 ?auto_6363897 ) ) ( not ( = ?auto_6363894 ?auto_6363897 ) ) ( not ( = ?auto_6363896 ?auto_6363899 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6363891 ?auto_6363892 ?auto_6363895 ?auto_6363894 )
      ( GET-4IMAGE-VERIFY ?auto_6363891 ?auto_6363892 ?auto_6363893 ?auto_6363890 ?auto_6363895 ?auto_6363894 ?auto_6363896 ?auto_6363897 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6364050 - DIRECTION
      ?auto_6364051 - MODE
      ?auto_6364052 - DIRECTION
      ?auto_6364049 - MODE
      ?auto_6364054 - DIRECTION
      ?auto_6364053 - MODE
      ?auto_6364055 - DIRECTION
      ?auto_6364056 - MODE
    )
    :vars
    (
      ?auto_6364057 - INSTRUMENT
      ?auto_6364059 - SATELLITE
      ?auto_6364058 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6364052 ?auto_6364050 ) ) ( not ( = ?auto_6364054 ?auto_6364050 ) ) ( not ( = ?auto_6364054 ?auto_6364052 ) ) ( not ( = ?auto_6364055 ?auto_6364050 ) ) ( not ( = ?auto_6364055 ?auto_6364052 ) ) ( not ( = ?auto_6364055 ?auto_6364054 ) ) ( ON_BOARD ?auto_6364057 ?auto_6364059 ) ( SUPPORTS ?auto_6364057 ?auto_6364049 ) ( POWER_ON ?auto_6364057 ) ( POINTING ?auto_6364059 ?auto_6364058 ) ( not ( = ?auto_6364052 ?auto_6364058 ) ) ( HAVE_IMAGE ?auto_6364050 ?auto_6364051 ) ( not ( = ?auto_6364050 ?auto_6364058 ) ) ( not ( = ?auto_6364051 ?auto_6364049 ) ) ( CALIBRATION_TARGET ?auto_6364057 ?auto_6364058 ) ( NOT_CALIBRATED ?auto_6364057 ) ( HAVE_IMAGE ?auto_6364054 ?auto_6364053 ) ( HAVE_IMAGE ?auto_6364055 ?auto_6364056 ) ( not ( = ?auto_6364051 ?auto_6364053 ) ) ( not ( = ?auto_6364051 ?auto_6364056 ) ) ( not ( = ?auto_6364049 ?auto_6364053 ) ) ( not ( = ?auto_6364049 ?auto_6364056 ) ) ( not ( = ?auto_6364054 ?auto_6364058 ) ) ( not ( = ?auto_6364053 ?auto_6364056 ) ) ( not ( = ?auto_6364055 ?auto_6364058 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6364050 ?auto_6364051 ?auto_6364052 ?auto_6364049 )
      ( GET-4IMAGE-VERIFY ?auto_6364050 ?auto_6364051 ?auto_6364052 ?auto_6364049 ?auto_6364054 ?auto_6364053 ?auto_6364055 ?auto_6364056 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6365077 - DIRECTION
      ?auto_6365078 - MODE
      ?auto_6365079 - DIRECTION
      ?auto_6365076 - MODE
      ?auto_6365081 - DIRECTION
      ?auto_6365080 - MODE
      ?auto_6365082 - DIRECTION
      ?auto_6365083 - MODE
    )
    :vars
    (
      ?auto_6365084 - INSTRUMENT
      ?auto_6365086 - SATELLITE
      ?auto_6365085 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6365079 ?auto_6365077 ) ) ( not ( = ?auto_6365081 ?auto_6365077 ) ) ( not ( = ?auto_6365081 ?auto_6365079 ) ) ( not ( = ?auto_6365082 ?auto_6365077 ) ) ( not ( = ?auto_6365082 ?auto_6365079 ) ) ( not ( = ?auto_6365082 ?auto_6365081 ) ) ( ON_BOARD ?auto_6365084 ?auto_6365086 ) ( SUPPORTS ?auto_6365084 ?auto_6365078 ) ( POWER_ON ?auto_6365084 ) ( POINTING ?auto_6365086 ?auto_6365085 ) ( not ( = ?auto_6365077 ?auto_6365085 ) ) ( HAVE_IMAGE ?auto_6365079 ?auto_6365076 ) ( not ( = ?auto_6365079 ?auto_6365085 ) ) ( not ( = ?auto_6365076 ?auto_6365078 ) ) ( CALIBRATION_TARGET ?auto_6365084 ?auto_6365085 ) ( NOT_CALIBRATED ?auto_6365084 ) ( HAVE_IMAGE ?auto_6365081 ?auto_6365080 ) ( HAVE_IMAGE ?auto_6365082 ?auto_6365083 ) ( not ( = ?auto_6365078 ?auto_6365080 ) ) ( not ( = ?auto_6365078 ?auto_6365083 ) ) ( not ( = ?auto_6365076 ?auto_6365080 ) ) ( not ( = ?auto_6365076 ?auto_6365083 ) ) ( not ( = ?auto_6365081 ?auto_6365085 ) ) ( not ( = ?auto_6365080 ?auto_6365083 ) ) ( not ( = ?auto_6365082 ?auto_6365085 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6365079 ?auto_6365076 ?auto_6365077 ?auto_6365078 )
      ( GET-4IMAGE-VERIFY ?auto_6365077 ?auto_6365078 ?auto_6365079 ?auto_6365076 ?auto_6365081 ?auto_6365080 ?auto_6365082 ?auto_6365083 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6376788 - DIRECTION
      ?auto_6376789 - MODE
      ?auto_6376790 - DIRECTION
      ?auto_6376787 - MODE
      ?auto_6376792 - DIRECTION
      ?auto_6376791 - MODE
      ?auto_6376793 - DIRECTION
      ?auto_6376794 - MODE
    )
    :vars
    (
      ?auto_6376797 - INSTRUMENT
      ?auto_6376795 - SATELLITE
      ?auto_6376796 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6376790 ?auto_6376788 ) ) ( not ( = ?auto_6376792 ?auto_6376788 ) ) ( not ( = ?auto_6376792 ?auto_6376790 ) ) ( not ( = ?auto_6376793 ?auto_6376788 ) ) ( not ( = ?auto_6376793 ?auto_6376790 ) ) ( not ( = ?auto_6376793 ?auto_6376792 ) ) ( ON_BOARD ?auto_6376797 ?auto_6376795 ) ( SUPPORTS ?auto_6376797 ?auto_6376794 ) ( POINTING ?auto_6376795 ?auto_6376796 ) ( not ( = ?auto_6376793 ?auto_6376796 ) ) ( HAVE_IMAGE ?auto_6376788 ?auto_6376789 ) ( not ( = ?auto_6376788 ?auto_6376796 ) ) ( not ( = ?auto_6376789 ?auto_6376794 ) ) ( CALIBRATION_TARGET ?auto_6376797 ?auto_6376796 ) ( POWER_AVAIL ?auto_6376795 ) ( HAVE_IMAGE ?auto_6376790 ?auto_6376787 ) ( HAVE_IMAGE ?auto_6376792 ?auto_6376791 ) ( not ( = ?auto_6376789 ?auto_6376787 ) ) ( not ( = ?auto_6376789 ?auto_6376791 ) ) ( not ( = ?auto_6376790 ?auto_6376796 ) ) ( not ( = ?auto_6376787 ?auto_6376791 ) ) ( not ( = ?auto_6376787 ?auto_6376794 ) ) ( not ( = ?auto_6376792 ?auto_6376796 ) ) ( not ( = ?auto_6376791 ?auto_6376794 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6376788 ?auto_6376789 ?auto_6376793 ?auto_6376794 )
      ( GET-4IMAGE-VERIFY ?auto_6376788 ?auto_6376789 ?auto_6376790 ?auto_6376787 ?auto_6376792 ?auto_6376791 ?auto_6376793 ?auto_6376794 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6376821 - DIRECTION
      ?auto_6376822 - MODE
      ?auto_6376823 - DIRECTION
      ?auto_6376820 - MODE
      ?auto_6376825 - DIRECTION
      ?auto_6376824 - MODE
      ?auto_6376826 - DIRECTION
      ?auto_6376827 - MODE
    )
    :vars
    (
      ?auto_6376830 - INSTRUMENT
      ?auto_6376828 - SATELLITE
      ?auto_6376829 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6376823 ?auto_6376821 ) ) ( not ( = ?auto_6376825 ?auto_6376821 ) ) ( not ( = ?auto_6376825 ?auto_6376823 ) ) ( not ( = ?auto_6376826 ?auto_6376821 ) ) ( not ( = ?auto_6376826 ?auto_6376823 ) ) ( not ( = ?auto_6376826 ?auto_6376825 ) ) ( ON_BOARD ?auto_6376830 ?auto_6376828 ) ( SUPPORTS ?auto_6376830 ?auto_6376824 ) ( POINTING ?auto_6376828 ?auto_6376829 ) ( not ( = ?auto_6376825 ?auto_6376829 ) ) ( HAVE_IMAGE ?auto_6376821 ?auto_6376822 ) ( not ( = ?auto_6376821 ?auto_6376829 ) ) ( not ( = ?auto_6376822 ?auto_6376824 ) ) ( CALIBRATION_TARGET ?auto_6376830 ?auto_6376829 ) ( POWER_AVAIL ?auto_6376828 ) ( HAVE_IMAGE ?auto_6376823 ?auto_6376820 ) ( HAVE_IMAGE ?auto_6376826 ?auto_6376827 ) ( not ( = ?auto_6376822 ?auto_6376820 ) ) ( not ( = ?auto_6376822 ?auto_6376827 ) ) ( not ( = ?auto_6376823 ?auto_6376829 ) ) ( not ( = ?auto_6376820 ?auto_6376824 ) ) ( not ( = ?auto_6376820 ?auto_6376827 ) ) ( not ( = ?auto_6376824 ?auto_6376827 ) ) ( not ( = ?auto_6376826 ?auto_6376829 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6376821 ?auto_6376822 ?auto_6376825 ?auto_6376824 )
      ( GET-4IMAGE-VERIFY ?auto_6376821 ?auto_6376822 ?auto_6376823 ?auto_6376820 ?auto_6376825 ?auto_6376824 ?auto_6376826 ?auto_6376827 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6376980 - DIRECTION
      ?auto_6376981 - MODE
      ?auto_6376982 - DIRECTION
      ?auto_6376979 - MODE
      ?auto_6376984 - DIRECTION
      ?auto_6376983 - MODE
      ?auto_6376985 - DIRECTION
      ?auto_6376986 - MODE
    )
    :vars
    (
      ?auto_6376989 - INSTRUMENT
      ?auto_6376987 - SATELLITE
      ?auto_6376988 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6376982 ?auto_6376980 ) ) ( not ( = ?auto_6376984 ?auto_6376980 ) ) ( not ( = ?auto_6376984 ?auto_6376982 ) ) ( not ( = ?auto_6376985 ?auto_6376980 ) ) ( not ( = ?auto_6376985 ?auto_6376982 ) ) ( not ( = ?auto_6376985 ?auto_6376984 ) ) ( ON_BOARD ?auto_6376989 ?auto_6376987 ) ( SUPPORTS ?auto_6376989 ?auto_6376979 ) ( POINTING ?auto_6376987 ?auto_6376988 ) ( not ( = ?auto_6376982 ?auto_6376988 ) ) ( HAVE_IMAGE ?auto_6376980 ?auto_6376981 ) ( not ( = ?auto_6376980 ?auto_6376988 ) ) ( not ( = ?auto_6376981 ?auto_6376979 ) ) ( CALIBRATION_TARGET ?auto_6376989 ?auto_6376988 ) ( POWER_AVAIL ?auto_6376987 ) ( HAVE_IMAGE ?auto_6376984 ?auto_6376983 ) ( HAVE_IMAGE ?auto_6376985 ?auto_6376986 ) ( not ( = ?auto_6376981 ?auto_6376983 ) ) ( not ( = ?auto_6376981 ?auto_6376986 ) ) ( not ( = ?auto_6376979 ?auto_6376983 ) ) ( not ( = ?auto_6376979 ?auto_6376986 ) ) ( not ( = ?auto_6376984 ?auto_6376988 ) ) ( not ( = ?auto_6376983 ?auto_6376986 ) ) ( not ( = ?auto_6376985 ?auto_6376988 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6376980 ?auto_6376981 ?auto_6376982 ?auto_6376979 )
      ( GET-4IMAGE-VERIFY ?auto_6376980 ?auto_6376981 ?auto_6376982 ?auto_6376979 ?auto_6376984 ?auto_6376983 ?auto_6376985 ?auto_6376986 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6378007 - DIRECTION
      ?auto_6378008 - MODE
      ?auto_6378009 - DIRECTION
      ?auto_6378006 - MODE
      ?auto_6378011 - DIRECTION
      ?auto_6378010 - MODE
      ?auto_6378012 - DIRECTION
      ?auto_6378013 - MODE
    )
    :vars
    (
      ?auto_6378016 - INSTRUMENT
      ?auto_6378014 - SATELLITE
      ?auto_6378015 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6378009 ?auto_6378007 ) ) ( not ( = ?auto_6378011 ?auto_6378007 ) ) ( not ( = ?auto_6378011 ?auto_6378009 ) ) ( not ( = ?auto_6378012 ?auto_6378007 ) ) ( not ( = ?auto_6378012 ?auto_6378009 ) ) ( not ( = ?auto_6378012 ?auto_6378011 ) ) ( ON_BOARD ?auto_6378016 ?auto_6378014 ) ( SUPPORTS ?auto_6378016 ?auto_6378008 ) ( POINTING ?auto_6378014 ?auto_6378015 ) ( not ( = ?auto_6378007 ?auto_6378015 ) ) ( HAVE_IMAGE ?auto_6378009 ?auto_6378006 ) ( not ( = ?auto_6378009 ?auto_6378015 ) ) ( not ( = ?auto_6378006 ?auto_6378008 ) ) ( CALIBRATION_TARGET ?auto_6378016 ?auto_6378015 ) ( POWER_AVAIL ?auto_6378014 ) ( HAVE_IMAGE ?auto_6378011 ?auto_6378010 ) ( HAVE_IMAGE ?auto_6378012 ?auto_6378013 ) ( not ( = ?auto_6378008 ?auto_6378010 ) ) ( not ( = ?auto_6378008 ?auto_6378013 ) ) ( not ( = ?auto_6378006 ?auto_6378010 ) ) ( not ( = ?auto_6378006 ?auto_6378013 ) ) ( not ( = ?auto_6378011 ?auto_6378015 ) ) ( not ( = ?auto_6378010 ?auto_6378013 ) ) ( not ( = ?auto_6378012 ?auto_6378015 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6378009 ?auto_6378006 ?auto_6378007 ?auto_6378008 )
      ( GET-4IMAGE-VERIFY ?auto_6378007 ?auto_6378008 ?auto_6378009 ?auto_6378006 ?auto_6378011 ?auto_6378010 ?auto_6378012 ?auto_6378013 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6389329 - DIRECTION
      ?auto_6389330 - MODE
      ?auto_6389331 - DIRECTION
      ?auto_6389328 - MODE
      ?auto_6389333 - DIRECTION
      ?auto_6389332 - MODE
    )
    :vars
    (
      ?auto_6389334 - INSTRUMENT
      ?auto_6389337 - SATELLITE
      ?auto_6389335 - DIRECTION
      ?auto_6389336 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6389331 ?auto_6389329 ) ) ( not ( = ?auto_6389333 ?auto_6389329 ) ) ( not ( = ?auto_6389333 ?auto_6389331 ) ) ( ON_BOARD ?auto_6389334 ?auto_6389337 ) ( SUPPORTS ?auto_6389334 ?auto_6389332 ) ( not ( = ?auto_6389333 ?auto_6389335 ) ) ( HAVE_IMAGE ?auto_6389329 ?auto_6389330 ) ( not ( = ?auto_6389329 ?auto_6389335 ) ) ( not ( = ?auto_6389330 ?auto_6389332 ) ) ( CALIBRATION_TARGET ?auto_6389334 ?auto_6389335 ) ( POWER_AVAIL ?auto_6389337 ) ( POINTING ?auto_6389337 ?auto_6389336 ) ( not ( = ?auto_6389335 ?auto_6389336 ) ) ( not ( = ?auto_6389333 ?auto_6389336 ) ) ( not ( = ?auto_6389329 ?auto_6389336 ) ) ( HAVE_IMAGE ?auto_6389331 ?auto_6389328 ) ( not ( = ?auto_6389330 ?auto_6389328 ) ) ( not ( = ?auto_6389331 ?auto_6389335 ) ) ( not ( = ?auto_6389331 ?auto_6389336 ) ) ( not ( = ?auto_6389328 ?auto_6389332 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6389329 ?auto_6389330 ?auto_6389333 ?auto_6389332 )
      ( GET-3IMAGE-VERIFY ?auto_6389329 ?auto_6389330 ?auto_6389331 ?auto_6389328 ?auto_6389333 ?auto_6389332 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6389358 - DIRECTION
      ?auto_6389359 - MODE
      ?auto_6389360 - DIRECTION
      ?auto_6389357 - MODE
      ?auto_6389362 - DIRECTION
      ?auto_6389361 - MODE
    )
    :vars
    (
      ?auto_6389363 - INSTRUMENT
      ?auto_6389366 - SATELLITE
      ?auto_6389364 - DIRECTION
      ?auto_6389365 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6389360 ?auto_6389358 ) ) ( not ( = ?auto_6389362 ?auto_6389358 ) ) ( not ( = ?auto_6389362 ?auto_6389360 ) ) ( ON_BOARD ?auto_6389363 ?auto_6389366 ) ( SUPPORTS ?auto_6389363 ?auto_6389357 ) ( not ( = ?auto_6389360 ?auto_6389364 ) ) ( HAVE_IMAGE ?auto_6389358 ?auto_6389359 ) ( not ( = ?auto_6389358 ?auto_6389364 ) ) ( not ( = ?auto_6389359 ?auto_6389357 ) ) ( CALIBRATION_TARGET ?auto_6389363 ?auto_6389364 ) ( POWER_AVAIL ?auto_6389366 ) ( POINTING ?auto_6389366 ?auto_6389365 ) ( not ( = ?auto_6389364 ?auto_6389365 ) ) ( not ( = ?auto_6389360 ?auto_6389365 ) ) ( not ( = ?auto_6389358 ?auto_6389365 ) ) ( HAVE_IMAGE ?auto_6389362 ?auto_6389361 ) ( not ( = ?auto_6389359 ?auto_6389361 ) ) ( not ( = ?auto_6389357 ?auto_6389361 ) ) ( not ( = ?auto_6389362 ?auto_6389364 ) ) ( not ( = ?auto_6389362 ?auto_6389365 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6389358 ?auto_6389359 ?auto_6389360 ?auto_6389357 )
      ( GET-3IMAGE-VERIFY ?auto_6389358 ?auto_6389359 ?auto_6389360 ?auto_6389357 ?auto_6389362 ?auto_6389361 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6389520 - DIRECTION
      ?auto_6389521 - MODE
      ?auto_6389522 - DIRECTION
      ?auto_6389519 - MODE
      ?auto_6389524 - DIRECTION
      ?auto_6389523 - MODE
    )
    :vars
    (
      ?auto_6389525 - INSTRUMENT
      ?auto_6389528 - SATELLITE
      ?auto_6389526 - DIRECTION
      ?auto_6389527 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6389522 ?auto_6389520 ) ) ( not ( = ?auto_6389524 ?auto_6389520 ) ) ( not ( = ?auto_6389524 ?auto_6389522 ) ) ( ON_BOARD ?auto_6389525 ?auto_6389528 ) ( SUPPORTS ?auto_6389525 ?auto_6389521 ) ( not ( = ?auto_6389520 ?auto_6389526 ) ) ( HAVE_IMAGE ?auto_6389522 ?auto_6389519 ) ( not ( = ?auto_6389522 ?auto_6389526 ) ) ( not ( = ?auto_6389519 ?auto_6389521 ) ) ( CALIBRATION_TARGET ?auto_6389525 ?auto_6389526 ) ( POWER_AVAIL ?auto_6389528 ) ( POINTING ?auto_6389528 ?auto_6389527 ) ( not ( = ?auto_6389526 ?auto_6389527 ) ) ( not ( = ?auto_6389520 ?auto_6389527 ) ) ( not ( = ?auto_6389522 ?auto_6389527 ) ) ( HAVE_IMAGE ?auto_6389524 ?auto_6389523 ) ( not ( = ?auto_6389521 ?auto_6389523 ) ) ( not ( = ?auto_6389519 ?auto_6389523 ) ) ( not ( = ?auto_6389524 ?auto_6389526 ) ) ( not ( = ?auto_6389524 ?auto_6389527 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6389522 ?auto_6389519 ?auto_6389520 ?auto_6389521 )
      ( GET-3IMAGE-VERIFY ?auto_6389520 ?auto_6389521 ?auto_6389522 ?auto_6389519 ?auto_6389524 ?auto_6389523 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6389773 - DIRECTION
      ?auto_6389774 - MODE
      ?auto_6389775 - DIRECTION
      ?auto_6389772 - MODE
      ?auto_6389777 - DIRECTION
      ?auto_6389776 - MODE
      ?auto_6389778 - DIRECTION
      ?auto_6389779 - MODE
    )
    :vars
    (
      ?auto_6389780 - INSTRUMENT
      ?auto_6389782 - SATELLITE
      ?auto_6389781 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6389775 ?auto_6389773 ) ) ( not ( = ?auto_6389777 ?auto_6389773 ) ) ( not ( = ?auto_6389777 ?auto_6389775 ) ) ( not ( = ?auto_6389778 ?auto_6389773 ) ) ( not ( = ?auto_6389778 ?auto_6389775 ) ) ( not ( = ?auto_6389778 ?auto_6389777 ) ) ( ON_BOARD ?auto_6389780 ?auto_6389782 ) ( SUPPORTS ?auto_6389780 ?auto_6389779 ) ( not ( = ?auto_6389778 ?auto_6389781 ) ) ( HAVE_IMAGE ?auto_6389773 ?auto_6389774 ) ( not ( = ?auto_6389773 ?auto_6389781 ) ) ( not ( = ?auto_6389774 ?auto_6389779 ) ) ( CALIBRATION_TARGET ?auto_6389780 ?auto_6389781 ) ( POWER_AVAIL ?auto_6389782 ) ( POINTING ?auto_6389782 ?auto_6389777 ) ( not ( = ?auto_6389781 ?auto_6389777 ) ) ( HAVE_IMAGE ?auto_6389775 ?auto_6389772 ) ( HAVE_IMAGE ?auto_6389777 ?auto_6389776 ) ( not ( = ?auto_6389774 ?auto_6389772 ) ) ( not ( = ?auto_6389774 ?auto_6389776 ) ) ( not ( = ?auto_6389775 ?auto_6389781 ) ) ( not ( = ?auto_6389772 ?auto_6389776 ) ) ( not ( = ?auto_6389772 ?auto_6389779 ) ) ( not ( = ?auto_6389776 ?auto_6389779 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6389773 ?auto_6389774 ?auto_6389778 ?auto_6389779 )
      ( GET-4IMAGE-VERIFY ?auto_6389773 ?auto_6389774 ?auto_6389775 ?auto_6389772 ?auto_6389777 ?auto_6389776 ?auto_6389778 ?auto_6389779 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6389808 - DIRECTION
      ?auto_6389809 - MODE
      ?auto_6389810 - DIRECTION
      ?auto_6389807 - MODE
      ?auto_6389812 - DIRECTION
      ?auto_6389811 - MODE
      ?auto_6389813 - DIRECTION
      ?auto_6389814 - MODE
    )
    :vars
    (
      ?auto_6389815 - INSTRUMENT
      ?auto_6389817 - SATELLITE
      ?auto_6389816 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6389810 ?auto_6389808 ) ) ( not ( = ?auto_6389812 ?auto_6389808 ) ) ( not ( = ?auto_6389812 ?auto_6389810 ) ) ( not ( = ?auto_6389813 ?auto_6389808 ) ) ( not ( = ?auto_6389813 ?auto_6389810 ) ) ( not ( = ?auto_6389813 ?auto_6389812 ) ) ( ON_BOARD ?auto_6389815 ?auto_6389817 ) ( SUPPORTS ?auto_6389815 ?auto_6389811 ) ( not ( = ?auto_6389812 ?auto_6389816 ) ) ( HAVE_IMAGE ?auto_6389808 ?auto_6389809 ) ( not ( = ?auto_6389808 ?auto_6389816 ) ) ( not ( = ?auto_6389809 ?auto_6389811 ) ) ( CALIBRATION_TARGET ?auto_6389815 ?auto_6389816 ) ( POWER_AVAIL ?auto_6389817 ) ( POINTING ?auto_6389817 ?auto_6389813 ) ( not ( = ?auto_6389816 ?auto_6389813 ) ) ( HAVE_IMAGE ?auto_6389810 ?auto_6389807 ) ( HAVE_IMAGE ?auto_6389813 ?auto_6389814 ) ( not ( = ?auto_6389809 ?auto_6389807 ) ) ( not ( = ?auto_6389809 ?auto_6389814 ) ) ( not ( = ?auto_6389810 ?auto_6389816 ) ) ( not ( = ?auto_6389807 ?auto_6389811 ) ) ( not ( = ?auto_6389807 ?auto_6389814 ) ) ( not ( = ?auto_6389811 ?auto_6389814 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6389808 ?auto_6389809 ?auto_6389812 ?auto_6389811 )
      ( GET-4IMAGE-VERIFY ?auto_6389808 ?auto_6389809 ?auto_6389810 ?auto_6389807 ?auto_6389812 ?auto_6389811 ?auto_6389813 ?auto_6389814 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6389842 - DIRECTION
      ?auto_6389843 - MODE
      ?auto_6389844 - DIRECTION
      ?auto_6389841 - MODE
      ?auto_6389846 - DIRECTION
      ?auto_6389845 - MODE
      ?auto_6389847 - DIRECTION
      ?auto_6389848 - MODE
    )
    :vars
    (
      ?auto_6389849 - INSTRUMENT
      ?auto_6389851 - SATELLITE
      ?auto_6389850 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6389844 ?auto_6389842 ) ) ( not ( = ?auto_6389846 ?auto_6389842 ) ) ( not ( = ?auto_6389846 ?auto_6389844 ) ) ( not ( = ?auto_6389847 ?auto_6389842 ) ) ( not ( = ?auto_6389847 ?auto_6389844 ) ) ( not ( = ?auto_6389847 ?auto_6389846 ) ) ( ON_BOARD ?auto_6389849 ?auto_6389851 ) ( SUPPORTS ?auto_6389849 ?auto_6389848 ) ( not ( = ?auto_6389847 ?auto_6389850 ) ) ( HAVE_IMAGE ?auto_6389842 ?auto_6389843 ) ( not ( = ?auto_6389842 ?auto_6389850 ) ) ( not ( = ?auto_6389843 ?auto_6389848 ) ) ( CALIBRATION_TARGET ?auto_6389849 ?auto_6389850 ) ( POWER_AVAIL ?auto_6389851 ) ( POINTING ?auto_6389851 ?auto_6389844 ) ( not ( = ?auto_6389850 ?auto_6389844 ) ) ( HAVE_IMAGE ?auto_6389844 ?auto_6389841 ) ( HAVE_IMAGE ?auto_6389846 ?auto_6389845 ) ( not ( = ?auto_6389843 ?auto_6389841 ) ) ( not ( = ?auto_6389843 ?auto_6389845 ) ) ( not ( = ?auto_6389841 ?auto_6389845 ) ) ( not ( = ?auto_6389841 ?auto_6389848 ) ) ( not ( = ?auto_6389846 ?auto_6389850 ) ) ( not ( = ?auto_6389845 ?auto_6389848 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6389842 ?auto_6389843 ?auto_6389847 ?auto_6389848 )
      ( GET-4IMAGE-VERIFY ?auto_6389842 ?auto_6389843 ?auto_6389844 ?auto_6389841 ?auto_6389846 ?auto_6389845 ?auto_6389847 ?auto_6389848 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6389875 - DIRECTION
      ?auto_6389876 - MODE
      ?auto_6389877 - DIRECTION
      ?auto_6389874 - MODE
      ?auto_6389879 - DIRECTION
      ?auto_6389878 - MODE
      ?auto_6389880 - DIRECTION
      ?auto_6389881 - MODE
    )
    :vars
    (
      ?auto_6389882 - INSTRUMENT
      ?auto_6389884 - SATELLITE
      ?auto_6389883 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6389877 ?auto_6389875 ) ) ( not ( = ?auto_6389879 ?auto_6389875 ) ) ( not ( = ?auto_6389879 ?auto_6389877 ) ) ( not ( = ?auto_6389880 ?auto_6389875 ) ) ( not ( = ?auto_6389880 ?auto_6389877 ) ) ( not ( = ?auto_6389880 ?auto_6389879 ) ) ( ON_BOARD ?auto_6389882 ?auto_6389884 ) ( SUPPORTS ?auto_6389882 ?auto_6389878 ) ( not ( = ?auto_6389879 ?auto_6389883 ) ) ( HAVE_IMAGE ?auto_6389875 ?auto_6389876 ) ( not ( = ?auto_6389875 ?auto_6389883 ) ) ( not ( = ?auto_6389876 ?auto_6389878 ) ) ( CALIBRATION_TARGET ?auto_6389882 ?auto_6389883 ) ( POWER_AVAIL ?auto_6389884 ) ( POINTING ?auto_6389884 ?auto_6389877 ) ( not ( = ?auto_6389883 ?auto_6389877 ) ) ( HAVE_IMAGE ?auto_6389877 ?auto_6389874 ) ( HAVE_IMAGE ?auto_6389880 ?auto_6389881 ) ( not ( = ?auto_6389876 ?auto_6389874 ) ) ( not ( = ?auto_6389876 ?auto_6389881 ) ) ( not ( = ?auto_6389874 ?auto_6389878 ) ) ( not ( = ?auto_6389874 ?auto_6389881 ) ) ( not ( = ?auto_6389878 ?auto_6389881 ) ) ( not ( = ?auto_6389880 ?auto_6389883 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6389875 ?auto_6389876 ?auto_6389879 ?auto_6389878 )
      ( GET-4IMAGE-VERIFY ?auto_6389875 ?auto_6389876 ?auto_6389877 ?auto_6389874 ?auto_6389879 ?auto_6389878 ?auto_6389880 ?auto_6389881 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6389979 - DIRECTION
      ?auto_6389980 - MODE
      ?auto_6389981 - DIRECTION
      ?auto_6389978 - MODE
      ?auto_6389983 - DIRECTION
      ?auto_6389982 - MODE
      ?auto_6389984 - DIRECTION
      ?auto_6389985 - MODE
    )
    :vars
    (
      ?auto_6389986 - INSTRUMENT
      ?auto_6389988 - SATELLITE
      ?auto_6389987 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6389981 ?auto_6389979 ) ) ( not ( = ?auto_6389983 ?auto_6389979 ) ) ( not ( = ?auto_6389983 ?auto_6389981 ) ) ( not ( = ?auto_6389984 ?auto_6389979 ) ) ( not ( = ?auto_6389984 ?auto_6389981 ) ) ( not ( = ?auto_6389984 ?auto_6389983 ) ) ( ON_BOARD ?auto_6389986 ?auto_6389988 ) ( SUPPORTS ?auto_6389986 ?auto_6389978 ) ( not ( = ?auto_6389981 ?auto_6389987 ) ) ( HAVE_IMAGE ?auto_6389979 ?auto_6389980 ) ( not ( = ?auto_6389979 ?auto_6389987 ) ) ( not ( = ?auto_6389980 ?auto_6389978 ) ) ( CALIBRATION_TARGET ?auto_6389986 ?auto_6389987 ) ( POWER_AVAIL ?auto_6389988 ) ( POINTING ?auto_6389988 ?auto_6389984 ) ( not ( = ?auto_6389987 ?auto_6389984 ) ) ( HAVE_IMAGE ?auto_6389983 ?auto_6389982 ) ( HAVE_IMAGE ?auto_6389984 ?auto_6389985 ) ( not ( = ?auto_6389980 ?auto_6389982 ) ) ( not ( = ?auto_6389980 ?auto_6389985 ) ) ( not ( = ?auto_6389978 ?auto_6389982 ) ) ( not ( = ?auto_6389978 ?auto_6389985 ) ) ( not ( = ?auto_6389983 ?auto_6389987 ) ) ( not ( = ?auto_6389982 ?auto_6389985 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6389979 ?auto_6389980 ?auto_6389981 ?auto_6389978 )
      ( GET-4IMAGE-VERIFY ?auto_6389979 ?auto_6389980 ?auto_6389981 ?auto_6389978 ?auto_6389983 ?auto_6389982 ?auto_6389984 ?auto_6389985 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6390013 - DIRECTION
      ?auto_6390014 - MODE
      ?auto_6390015 - DIRECTION
      ?auto_6390012 - MODE
      ?auto_6390017 - DIRECTION
      ?auto_6390016 - MODE
      ?auto_6390018 - DIRECTION
      ?auto_6390019 - MODE
    )
    :vars
    (
      ?auto_6390020 - INSTRUMENT
      ?auto_6390022 - SATELLITE
      ?auto_6390021 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6390015 ?auto_6390013 ) ) ( not ( = ?auto_6390017 ?auto_6390013 ) ) ( not ( = ?auto_6390017 ?auto_6390015 ) ) ( not ( = ?auto_6390018 ?auto_6390013 ) ) ( not ( = ?auto_6390018 ?auto_6390015 ) ) ( not ( = ?auto_6390018 ?auto_6390017 ) ) ( ON_BOARD ?auto_6390020 ?auto_6390022 ) ( SUPPORTS ?auto_6390020 ?auto_6390012 ) ( not ( = ?auto_6390015 ?auto_6390021 ) ) ( HAVE_IMAGE ?auto_6390013 ?auto_6390014 ) ( not ( = ?auto_6390013 ?auto_6390021 ) ) ( not ( = ?auto_6390014 ?auto_6390012 ) ) ( CALIBRATION_TARGET ?auto_6390020 ?auto_6390021 ) ( POWER_AVAIL ?auto_6390022 ) ( POINTING ?auto_6390022 ?auto_6390017 ) ( not ( = ?auto_6390021 ?auto_6390017 ) ) ( HAVE_IMAGE ?auto_6390017 ?auto_6390016 ) ( HAVE_IMAGE ?auto_6390018 ?auto_6390019 ) ( not ( = ?auto_6390014 ?auto_6390016 ) ) ( not ( = ?auto_6390014 ?auto_6390019 ) ) ( not ( = ?auto_6390012 ?auto_6390016 ) ) ( not ( = ?auto_6390012 ?auto_6390019 ) ) ( not ( = ?auto_6390016 ?auto_6390019 ) ) ( not ( = ?auto_6390018 ?auto_6390021 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6390013 ?auto_6390014 ?auto_6390015 ?auto_6390012 )
      ( GET-4IMAGE-VERIFY ?auto_6390013 ?auto_6390014 ?auto_6390015 ?auto_6390012 ?auto_6390017 ?auto_6390016 ?auto_6390018 ?auto_6390019 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6390550 - DIRECTION
      ?auto_6390551 - MODE
      ?auto_6390552 - DIRECTION
      ?auto_6390549 - MODE
      ?auto_6390554 - DIRECTION
      ?auto_6390553 - MODE
      ?auto_6390555 - DIRECTION
      ?auto_6390556 - MODE
    )
    :vars
    (
      ?auto_6390557 - INSTRUMENT
      ?auto_6390559 - SATELLITE
      ?auto_6390558 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6390552 ?auto_6390550 ) ) ( not ( = ?auto_6390554 ?auto_6390550 ) ) ( not ( = ?auto_6390554 ?auto_6390552 ) ) ( not ( = ?auto_6390555 ?auto_6390550 ) ) ( not ( = ?auto_6390555 ?auto_6390552 ) ) ( not ( = ?auto_6390555 ?auto_6390554 ) ) ( ON_BOARD ?auto_6390557 ?auto_6390559 ) ( SUPPORTS ?auto_6390557 ?auto_6390556 ) ( not ( = ?auto_6390555 ?auto_6390558 ) ) ( HAVE_IMAGE ?auto_6390552 ?auto_6390549 ) ( not ( = ?auto_6390552 ?auto_6390558 ) ) ( not ( = ?auto_6390549 ?auto_6390556 ) ) ( CALIBRATION_TARGET ?auto_6390557 ?auto_6390558 ) ( POWER_AVAIL ?auto_6390559 ) ( POINTING ?auto_6390559 ?auto_6390550 ) ( not ( = ?auto_6390558 ?auto_6390550 ) ) ( HAVE_IMAGE ?auto_6390550 ?auto_6390551 ) ( HAVE_IMAGE ?auto_6390554 ?auto_6390553 ) ( not ( = ?auto_6390551 ?auto_6390549 ) ) ( not ( = ?auto_6390551 ?auto_6390553 ) ) ( not ( = ?auto_6390551 ?auto_6390556 ) ) ( not ( = ?auto_6390549 ?auto_6390553 ) ) ( not ( = ?auto_6390554 ?auto_6390558 ) ) ( not ( = ?auto_6390553 ?auto_6390556 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6390552 ?auto_6390549 ?auto_6390555 ?auto_6390556 )
      ( GET-4IMAGE-VERIFY ?auto_6390550 ?auto_6390551 ?auto_6390552 ?auto_6390549 ?auto_6390554 ?auto_6390553 ?auto_6390555 ?auto_6390556 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6390583 - DIRECTION
      ?auto_6390584 - MODE
      ?auto_6390585 - DIRECTION
      ?auto_6390582 - MODE
      ?auto_6390587 - DIRECTION
      ?auto_6390586 - MODE
      ?auto_6390588 - DIRECTION
      ?auto_6390589 - MODE
    )
    :vars
    (
      ?auto_6390590 - INSTRUMENT
      ?auto_6390592 - SATELLITE
      ?auto_6390591 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6390585 ?auto_6390583 ) ) ( not ( = ?auto_6390587 ?auto_6390583 ) ) ( not ( = ?auto_6390587 ?auto_6390585 ) ) ( not ( = ?auto_6390588 ?auto_6390583 ) ) ( not ( = ?auto_6390588 ?auto_6390585 ) ) ( not ( = ?auto_6390588 ?auto_6390587 ) ) ( ON_BOARD ?auto_6390590 ?auto_6390592 ) ( SUPPORTS ?auto_6390590 ?auto_6390586 ) ( not ( = ?auto_6390587 ?auto_6390591 ) ) ( HAVE_IMAGE ?auto_6390585 ?auto_6390582 ) ( not ( = ?auto_6390585 ?auto_6390591 ) ) ( not ( = ?auto_6390582 ?auto_6390586 ) ) ( CALIBRATION_TARGET ?auto_6390590 ?auto_6390591 ) ( POWER_AVAIL ?auto_6390592 ) ( POINTING ?auto_6390592 ?auto_6390583 ) ( not ( = ?auto_6390591 ?auto_6390583 ) ) ( HAVE_IMAGE ?auto_6390583 ?auto_6390584 ) ( HAVE_IMAGE ?auto_6390588 ?auto_6390589 ) ( not ( = ?auto_6390584 ?auto_6390582 ) ) ( not ( = ?auto_6390584 ?auto_6390586 ) ) ( not ( = ?auto_6390584 ?auto_6390589 ) ) ( not ( = ?auto_6390582 ?auto_6390589 ) ) ( not ( = ?auto_6390586 ?auto_6390589 ) ) ( not ( = ?auto_6390588 ?auto_6390591 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6390585 ?auto_6390582 ?auto_6390587 ?auto_6390586 )
      ( GET-4IMAGE-VERIFY ?auto_6390583 ?auto_6390584 ?auto_6390585 ?auto_6390582 ?auto_6390587 ?auto_6390586 ?auto_6390588 ?auto_6390589 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6390795 - DIRECTION
      ?auto_6390796 - MODE
      ?auto_6390797 - DIRECTION
      ?auto_6390794 - MODE
      ?auto_6390799 - DIRECTION
      ?auto_6390798 - MODE
      ?auto_6390800 - DIRECTION
      ?auto_6390801 - MODE
    )
    :vars
    (
      ?auto_6390802 - INSTRUMENT
      ?auto_6390804 - SATELLITE
      ?auto_6390803 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6390797 ?auto_6390795 ) ) ( not ( = ?auto_6390799 ?auto_6390795 ) ) ( not ( = ?auto_6390799 ?auto_6390797 ) ) ( not ( = ?auto_6390800 ?auto_6390795 ) ) ( not ( = ?auto_6390800 ?auto_6390797 ) ) ( not ( = ?auto_6390800 ?auto_6390799 ) ) ( ON_BOARD ?auto_6390802 ?auto_6390804 ) ( SUPPORTS ?auto_6390802 ?auto_6390794 ) ( not ( = ?auto_6390797 ?auto_6390803 ) ) ( HAVE_IMAGE ?auto_6390799 ?auto_6390798 ) ( not ( = ?auto_6390799 ?auto_6390803 ) ) ( not ( = ?auto_6390798 ?auto_6390794 ) ) ( CALIBRATION_TARGET ?auto_6390802 ?auto_6390803 ) ( POWER_AVAIL ?auto_6390804 ) ( POINTING ?auto_6390804 ?auto_6390795 ) ( not ( = ?auto_6390803 ?auto_6390795 ) ) ( HAVE_IMAGE ?auto_6390795 ?auto_6390796 ) ( HAVE_IMAGE ?auto_6390800 ?auto_6390801 ) ( not ( = ?auto_6390796 ?auto_6390794 ) ) ( not ( = ?auto_6390796 ?auto_6390798 ) ) ( not ( = ?auto_6390796 ?auto_6390801 ) ) ( not ( = ?auto_6390794 ?auto_6390801 ) ) ( not ( = ?auto_6390798 ?auto_6390801 ) ) ( not ( = ?auto_6390800 ?auto_6390803 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6390799 ?auto_6390798 ?auto_6390797 ?auto_6390794 )
      ( GET-4IMAGE-VERIFY ?auto_6390795 ?auto_6390796 ?auto_6390797 ?auto_6390794 ?auto_6390799 ?auto_6390798 ?auto_6390800 ?auto_6390801 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6391046 - DIRECTION
      ?auto_6391047 - MODE
      ?auto_6391048 - DIRECTION
      ?auto_6391045 - MODE
      ?auto_6391050 - DIRECTION
      ?auto_6391049 - MODE
      ?auto_6391051 - DIRECTION
      ?auto_6391052 - MODE
    )
    :vars
    (
      ?auto_6391053 - INSTRUMENT
      ?auto_6391055 - SATELLITE
      ?auto_6391054 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6391048 ?auto_6391046 ) ) ( not ( = ?auto_6391050 ?auto_6391046 ) ) ( not ( = ?auto_6391050 ?auto_6391048 ) ) ( not ( = ?auto_6391051 ?auto_6391046 ) ) ( not ( = ?auto_6391051 ?auto_6391048 ) ) ( not ( = ?auto_6391051 ?auto_6391050 ) ) ( ON_BOARD ?auto_6391053 ?auto_6391055 ) ( SUPPORTS ?auto_6391053 ?auto_6391047 ) ( not ( = ?auto_6391046 ?auto_6391054 ) ) ( HAVE_IMAGE ?auto_6391048 ?auto_6391045 ) ( not ( = ?auto_6391048 ?auto_6391054 ) ) ( not ( = ?auto_6391045 ?auto_6391047 ) ) ( CALIBRATION_TARGET ?auto_6391053 ?auto_6391054 ) ( POWER_AVAIL ?auto_6391055 ) ( POINTING ?auto_6391055 ?auto_6391051 ) ( not ( = ?auto_6391054 ?auto_6391051 ) ) ( HAVE_IMAGE ?auto_6391050 ?auto_6391049 ) ( HAVE_IMAGE ?auto_6391051 ?auto_6391052 ) ( not ( = ?auto_6391047 ?auto_6391049 ) ) ( not ( = ?auto_6391047 ?auto_6391052 ) ) ( not ( = ?auto_6391045 ?auto_6391049 ) ) ( not ( = ?auto_6391045 ?auto_6391052 ) ) ( not ( = ?auto_6391050 ?auto_6391054 ) ) ( not ( = ?auto_6391049 ?auto_6391052 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6391048 ?auto_6391045 ?auto_6391046 ?auto_6391047 )
      ( GET-4IMAGE-VERIFY ?auto_6391046 ?auto_6391047 ?auto_6391048 ?auto_6391045 ?auto_6391050 ?auto_6391049 ?auto_6391051 ?auto_6391052 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6391080 - DIRECTION
      ?auto_6391081 - MODE
      ?auto_6391082 - DIRECTION
      ?auto_6391079 - MODE
      ?auto_6391084 - DIRECTION
      ?auto_6391083 - MODE
      ?auto_6391085 - DIRECTION
      ?auto_6391086 - MODE
    )
    :vars
    (
      ?auto_6391087 - INSTRUMENT
      ?auto_6391089 - SATELLITE
      ?auto_6391088 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6391082 ?auto_6391080 ) ) ( not ( = ?auto_6391084 ?auto_6391080 ) ) ( not ( = ?auto_6391084 ?auto_6391082 ) ) ( not ( = ?auto_6391085 ?auto_6391080 ) ) ( not ( = ?auto_6391085 ?auto_6391082 ) ) ( not ( = ?auto_6391085 ?auto_6391084 ) ) ( ON_BOARD ?auto_6391087 ?auto_6391089 ) ( SUPPORTS ?auto_6391087 ?auto_6391081 ) ( not ( = ?auto_6391080 ?auto_6391088 ) ) ( HAVE_IMAGE ?auto_6391082 ?auto_6391079 ) ( not ( = ?auto_6391082 ?auto_6391088 ) ) ( not ( = ?auto_6391079 ?auto_6391081 ) ) ( CALIBRATION_TARGET ?auto_6391087 ?auto_6391088 ) ( POWER_AVAIL ?auto_6391089 ) ( POINTING ?auto_6391089 ?auto_6391084 ) ( not ( = ?auto_6391088 ?auto_6391084 ) ) ( HAVE_IMAGE ?auto_6391084 ?auto_6391083 ) ( HAVE_IMAGE ?auto_6391085 ?auto_6391086 ) ( not ( = ?auto_6391081 ?auto_6391083 ) ) ( not ( = ?auto_6391081 ?auto_6391086 ) ) ( not ( = ?auto_6391079 ?auto_6391083 ) ) ( not ( = ?auto_6391079 ?auto_6391086 ) ) ( not ( = ?auto_6391083 ?auto_6391086 ) ) ( not ( = ?auto_6391085 ?auto_6391088 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6391082 ?auto_6391079 ?auto_6391080 ?auto_6391081 )
      ( GET-4IMAGE-VERIFY ?auto_6391080 ?auto_6391081 ?auto_6391082 ?auto_6391079 ?auto_6391084 ?auto_6391083 ?auto_6391085 ?auto_6391086 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6391368 - DIRECTION
      ?auto_6391369 - MODE
      ?auto_6391370 - DIRECTION
      ?auto_6391367 - MODE
      ?auto_6391372 - DIRECTION
      ?auto_6391371 - MODE
      ?auto_6391373 - DIRECTION
      ?auto_6391374 - MODE
    )
    :vars
    (
      ?auto_6391375 - INSTRUMENT
      ?auto_6391377 - SATELLITE
      ?auto_6391376 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6391370 ?auto_6391368 ) ) ( not ( = ?auto_6391372 ?auto_6391368 ) ) ( not ( = ?auto_6391372 ?auto_6391370 ) ) ( not ( = ?auto_6391373 ?auto_6391368 ) ) ( not ( = ?auto_6391373 ?auto_6391370 ) ) ( not ( = ?auto_6391373 ?auto_6391372 ) ) ( ON_BOARD ?auto_6391375 ?auto_6391377 ) ( SUPPORTS ?auto_6391375 ?auto_6391369 ) ( not ( = ?auto_6391368 ?auto_6391376 ) ) ( HAVE_IMAGE ?auto_6391372 ?auto_6391371 ) ( not ( = ?auto_6391372 ?auto_6391376 ) ) ( not ( = ?auto_6391371 ?auto_6391369 ) ) ( CALIBRATION_TARGET ?auto_6391375 ?auto_6391376 ) ( POWER_AVAIL ?auto_6391377 ) ( POINTING ?auto_6391377 ?auto_6391370 ) ( not ( = ?auto_6391376 ?auto_6391370 ) ) ( HAVE_IMAGE ?auto_6391370 ?auto_6391367 ) ( HAVE_IMAGE ?auto_6391373 ?auto_6391374 ) ( not ( = ?auto_6391369 ?auto_6391367 ) ) ( not ( = ?auto_6391369 ?auto_6391374 ) ) ( not ( = ?auto_6391367 ?auto_6391371 ) ) ( not ( = ?auto_6391367 ?auto_6391374 ) ) ( not ( = ?auto_6391371 ?auto_6391374 ) ) ( not ( = ?auto_6391373 ?auto_6391376 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6391372 ?auto_6391371 ?auto_6391368 ?auto_6391369 )
      ( GET-4IMAGE-VERIFY ?auto_6391368 ?auto_6391369 ?auto_6391370 ?auto_6391367 ?auto_6391372 ?auto_6391371 ?auto_6391373 ?auto_6391374 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6402614 - DIRECTION
      ?auto_6402615 - MODE
      ?auto_6402616 - DIRECTION
      ?auto_6402613 - MODE
      ?auto_6402618 - DIRECTION
      ?auto_6402617 - MODE
    )
    :vars
    (
      ?auto_6402622 - INSTRUMENT
      ?auto_6402621 - SATELLITE
      ?auto_6402619 - DIRECTION
      ?auto_6402620 - DIRECTION
      ?auto_6402623 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6402616 ?auto_6402614 ) ) ( not ( = ?auto_6402618 ?auto_6402614 ) ) ( not ( = ?auto_6402618 ?auto_6402616 ) ) ( ON_BOARD ?auto_6402622 ?auto_6402621 ) ( SUPPORTS ?auto_6402622 ?auto_6402617 ) ( not ( = ?auto_6402618 ?auto_6402619 ) ) ( HAVE_IMAGE ?auto_6402614 ?auto_6402615 ) ( not ( = ?auto_6402614 ?auto_6402619 ) ) ( not ( = ?auto_6402615 ?auto_6402617 ) ) ( CALIBRATION_TARGET ?auto_6402622 ?auto_6402619 ) ( POINTING ?auto_6402621 ?auto_6402620 ) ( not ( = ?auto_6402619 ?auto_6402620 ) ) ( not ( = ?auto_6402618 ?auto_6402620 ) ) ( not ( = ?auto_6402614 ?auto_6402620 ) ) ( ON_BOARD ?auto_6402623 ?auto_6402621 ) ( POWER_ON ?auto_6402623 ) ( not ( = ?auto_6402622 ?auto_6402623 ) ) ( HAVE_IMAGE ?auto_6402616 ?auto_6402613 ) ( not ( = ?auto_6402615 ?auto_6402613 ) ) ( not ( = ?auto_6402616 ?auto_6402619 ) ) ( not ( = ?auto_6402616 ?auto_6402620 ) ) ( not ( = ?auto_6402613 ?auto_6402617 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6402614 ?auto_6402615 ?auto_6402618 ?auto_6402617 )
      ( GET-3IMAGE-VERIFY ?auto_6402614 ?auto_6402615 ?auto_6402616 ?auto_6402613 ?auto_6402618 ?auto_6402617 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6402646 - DIRECTION
      ?auto_6402647 - MODE
      ?auto_6402648 - DIRECTION
      ?auto_6402645 - MODE
      ?auto_6402650 - DIRECTION
      ?auto_6402649 - MODE
    )
    :vars
    (
      ?auto_6402654 - INSTRUMENT
      ?auto_6402653 - SATELLITE
      ?auto_6402651 - DIRECTION
      ?auto_6402652 - DIRECTION
      ?auto_6402655 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6402648 ?auto_6402646 ) ) ( not ( = ?auto_6402650 ?auto_6402646 ) ) ( not ( = ?auto_6402650 ?auto_6402648 ) ) ( ON_BOARD ?auto_6402654 ?auto_6402653 ) ( SUPPORTS ?auto_6402654 ?auto_6402645 ) ( not ( = ?auto_6402648 ?auto_6402651 ) ) ( HAVE_IMAGE ?auto_6402646 ?auto_6402647 ) ( not ( = ?auto_6402646 ?auto_6402651 ) ) ( not ( = ?auto_6402647 ?auto_6402645 ) ) ( CALIBRATION_TARGET ?auto_6402654 ?auto_6402651 ) ( POINTING ?auto_6402653 ?auto_6402652 ) ( not ( = ?auto_6402651 ?auto_6402652 ) ) ( not ( = ?auto_6402648 ?auto_6402652 ) ) ( not ( = ?auto_6402646 ?auto_6402652 ) ) ( ON_BOARD ?auto_6402655 ?auto_6402653 ) ( POWER_ON ?auto_6402655 ) ( not ( = ?auto_6402654 ?auto_6402655 ) ) ( HAVE_IMAGE ?auto_6402650 ?auto_6402649 ) ( not ( = ?auto_6402647 ?auto_6402649 ) ) ( not ( = ?auto_6402645 ?auto_6402649 ) ) ( not ( = ?auto_6402650 ?auto_6402651 ) ) ( not ( = ?auto_6402650 ?auto_6402652 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6402646 ?auto_6402647 ?auto_6402648 ?auto_6402645 )
      ( GET-3IMAGE-VERIFY ?auto_6402646 ?auto_6402647 ?auto_6402648 ?auto_6402645 ?auto_6402650 ?auto_6402649 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6402820 - DIRECTION
      ?auto_6402821 - MODE
      ?auto_6402822 - DIRECTION
      ?auto_6402819 - MODE
      ?auto_6402824 - DIRECTION
      ?auto_6402823 - MODE
    )
    :vars
    (
      ?auto_6402828 - INSTRUMENT
      ?auto_6402827 - SATELLITE
      ?auto_6402825 - DIRECTION
      ?auto_6402826 - DIRECTION
      ?auto_6402829 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6402822 ?auto_6402820 ) ) ( not ( = ?auto_6402824 ?auto_6402820 ) ) ( not ( = ?auto_6402824 ?auto_6402822 ) ) ( ON_BOARD ?auto_6402828 ?auto_6402827 ) ( SUPPORTS ?auto_6402828 ?auto_6402821 ) ( not ( = ?auto_6402820 ?auto_6402825 ) ) ( HAVE_IMAGE ?auto_6402822 ?auto_6402819 ) ( not ( = ?auto_6402822 ?auto_6402825 ) ) ( not ( = ?auto_6402819 ?auto_6402821 ) ) ( CALIBRATION_TARGET ?auto_6402828 ?auto_6402825 ) ( POINTING ?auto_6402827 ?auto_6402826 ) ( not ( = ?auto_6402825 ?auto_6402826 ) ) ( not ( = ?auto_6402820 ?auto_6402826 ) ) ( not ( = ?auto_6402822 ?auto_6402826 ) ) ( ON_BOARD ?auto_6402829 ?auto_6402827 ) ( POWER_ON ?auto_6402829 ) ( not ( = ?auto_6402828 ?auto_6402829 ) ) ( HAVE_IMAGE ?auto_6402824 ?auto_6402823 ) ( not ( = ?auto_6402821 ?auto_6402823 ) ) ( not ( = ?auto_6402819 ?auto_6402823 ) ) ( not ( = ?auto_6402824 ?auto_6402825 ) ) ( not ( = ?auto_6402824 ?auto_6402826 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6402822 ?auto_6402819 ?auto_6402820 ?auto_6402821 )
      ( GET-3IMAGE-VERIFY ?auto_6402820 ?auto_6402821 ?auto_6402822 ?auto_6402819 ?auto_6402824 ?auto_6402823 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6403094 - DIRECTION
      ?auto_6403095 - MODE
      ?auto_6403096 - DIRECTION
      ?auto_6403093 - MODE
      ?auto_6403098 - DIRECTION
      ?auto_6403097 - MODE
      ?auto_6403099 - DIRECTION
      ?auto_6403100 - MODE
    )
    :vars
    (
      ?auto_6403103 - INSTRUMENT
      ?auto_6403102 - SATELLITE
      ?auto_6403101 - DIRECTION
      ?auto_6403104 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6403096 ?auto_6403094 ) ) ( not ( = ?auto_6403098 ?auto_6403094 ) ) ( not ( = ?auto_6403098 ?auto_6403096 ) ) ( not ( = ?auto_6403099 ?auto_6403094 ) ) ( not ( = ?auto_6403099 ?auto_6403096 ) ) ( not ( = ?auto_6403099 ?auto_6403098 ) ) ( ON_BOARD ?auto_6403103 ?auto_6403102 ) ( SUPPORTS ?auto_6403103 ?auto_6403100 ) ( not ( = ?auto_6403099 ?auto_6403101 ) ) ( HAVE_IMAGE ?auto_6403094 ?auto_6403095 ) ( not ( = ?auto_6403094 ?auto_6403101 ) ) ( not ( = ?auto_6403095 ?auto_6403100 ) ) ( CALIBRATION_TARGET ?auto_6403103 ?auto_6403101 ) ( POINTING ?auto_6403102 ?auto_6403098 ) ( not ( = ?auto_6403101 ?auto_6403098 ) ) ( ON_BOARD ?auto_6403104 ?auto_6403102 ) ( POWER_ON ?auto_6403104 ) ( not ( = ?auto_6403103 ?auto_6403104 ) ) ( HAVE_IMAGE ?auto_6403096 ?auto_6403093 ) ( HAVE_IMAGE ?auto_6403098 ?auto_6403097 ) ( not ( = ?auto_6403095 ?auto_6403093 ) ) ( not ( = ?auto_6403095 ?auto_6403097 ) ) ( not ( = ?auto_6403096 ?auto_6403101 ) ) ( not ( = ?auto_6403093 ?auto_6403097 ) ) ( not ( = ?auto_6403093 ?auto_6403100 ) ) ( not ( = ?auto_6403097 ?auto_6403100 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6403094 ?auto_6403095 ?auto_6403099 ?auto_6403100 )
      ( GET-4IMAGE-VERIFY ?auto_6403094 ?auto_6403095 ?auto_6403096 ?auto_6403093 ?auto_6403098 ?auto_6403097 ?auto_6403099 ?auto_6403100 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6403132 - DIRECTION
      ?auto_6403133 - MODE
      ?auto_6403134 - DIRECTION
      ?auto_6403131 - MODE
      ?auto_6403136 - DIRECTION
      ?auto_6403135 - MODE
      ?auto_6403137 - DIRECTION
      ?auto_6403138 - MODE
    )
    :vars
    (
      ?auto_6403141 - INSTRUMENT
      ?auto_6403140 - SATELLITE
      ?auto_6403139 - DIRECTION
      ?auto_6403142 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6403134 ?auto_6403132 ) ) ( not ( = ?auto_6403136 ?auto_6403132 ) ) ( not ( = ?auto_6403136 ?auto_6403134 ) ) ( not ( = ?auto_6403137 ?auto_6403132 ) ) ( not ( = ?auto_6403137 ?auto_6403134 ) ) ( not ( = ?auto_6403137 ?auto_6403136 ) ) ( ON_BOARD ?auto_6403141 ?auto_6403140 ) ( SUPPORTS ?auto_6403141 ?auto_6403135 ) ( not ( = ?auto_6403136 ?auto_6403139 ) ) ( HAVE_IMAGE ?auto_6403132 ?auto_6403133 ) ( not ( = ?auto_6403132 ?auto_6403139 ) ) ( not ( = ?auto_6403133 ?auto_6403135 ) ) ( CALIBRATION_TARGET ?auto_6403141 ?auto_6403139 ) ( POINTING ?auto_6403140 ?auto_6403137 ) ( not ( = ?auto_6403139 ?auto_6403137 ) ) ( ON_BOARD ?auto_6403142 ?auto_6403140 ) ( POWER_ON ?auto_6403142 ) ( not ( = ?auto_6403141 ?auto_6403142 ) ) ( HAVE_IMAGE ?auto_6403134 ?auto_6403131 ) ( HAVE_IMAGE ?auto_6403137 ?auto_6403138 ) ( not ( = ?auto_6403133 ?auto_6403131 ) ) ( not ( = ?auto_6403133 ?auto_6403138 ) ) ( not ( = ?auto_6403134 ?auto_6403139 ) ) ( not ( = ?auto_6403131 ?auto_6403135 ) ) ( not ( = ?auto_6403131 ?auto_6403138 ) ) ( not ( = ?auto_6403135 ?auto_6403138 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6403132 ?auto_6403133 ?auto_6403136 ?auto_6403135 )
      ( GET-4IMAGE-VERIFY ?auto_6403132 ?auto_6403133 ?auto_6403134 ?auto_6403131 ?auto_6403136 ?auto_6403135 ?auto_6403137 ?auto_6403138 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6403169 - DIRECTION
      ?auto_6403170 - MODE
      ?auto_6403171 - DIRECTION
      ?auto_6403168 - MODE
      ?auto_6403173 - DIRECTION
      ?auto_6403172 - MODE
      ?auto_6403174 - DIRECTION
      ?auto_6403175 - MODE
    )
    :vars
    (
      ?auto_6403178 - INSTRUMENT
      ?auto_6403177 - SATELLITE
      ?auto_6403176 - DIRECTION
      ?auto_6403179 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6403171 ?auto_6403169 ) ) ( not ( = ?auto_6403173 ?auto_6403169 ) ) ( not ( = ?auto_6403173 ?auto_6403171 ) ) ( not ( = ?auto_6403174 ?auto_6403169 ) ) ( not ( = ?auto_6403174 ?auto_6403171 ) ) ( not ( = ?auto_6403174 ?auto_6403173 ) ) ( ON_BOARD ?auto_6403178 ?auto_6403177 ) ( SUPPORTS ?auto_6403178 ?auto_6403175 ) ( not ( = ?auto_6403174 ?auto_6403176 ) ) ( HAVE_IMAGE ?auto_6403169 ?auto_6403170 ) ( not ( = ?auto_6403169 ?auto_6403176 ) ) ( not ( = ?auto_6403170 ?auto_6403175 ) ) ( CALIBRATION_TARGET ?auto_6403178 ?auto_6403176 ) ( POINTING ?auto_6403177 ?auto_6403171 ) ( not ( = ?auto_6403176 ?auto_6403171 ) ) ( ON_BOARD ?auto_6403179 ?auto_6403177 ) ( POWER_ON ?auto_6403179 ) ( not ( = ?auto_6403178 ?auto_6403179 ) ) ( HAVE_IMAGE ?auto_6403171 ?auto_6403168 ) ( HAVE_IMAGE ?auto_6403173 ?auto_6403172 ) ( not ( = ?auto_6403170 ?auto_6403168 ) ) ( not ( = ?auto_6403170 ?auto_6403172 ) ) ( not ( = ?auto_6403168 ?auto_6403172 ) ) ( not ( = ?auto_6403168 ?auto_6403175 ) ) ( not ( = ?auto_6403173 ?auto_6403176 ) ) ( not ( = ?auto_6403172 ?auto_6403175 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6403169 ?auto_6403170 ?auto_6403174 ?auto_6403175 )
      ( GET-4IMAGE-VERIFY ?auto_6403169 ?auto_6403170 ?auto_6403171 ?auto_6403168 ?auto_6403173 ?auto_6403172 ?auto_6403174 ?auto_6403175 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6403205 - DIRECTION
      ?auto_6403206 - MODE
      ?auto_6403207 - DIRECTION
      ?auto_6403204 - MODE
      ?auto_6403209 - DIRECTION
      ?auto_6403208 - MODE
      ?auto_6403210 - DIRECTION
      ?auto_6403211 - MODE
    )
    :vars
    (
      ?auto_6403214 - INSTRUMENT
      ?auto_6403213 - SATELLITE
      ?auto_6403212 - DIRECTION
      ?auto_6403215 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6403207 ?auto_6403205 ) ) ( not ( = ?auto_6403209 ?auto_6403205 ) ) ( not ( = ?auto_6403209 ?auto_6403207 ) ) ( not ( = ?auto_6403210 ?auto_6403205 ) ) ( not ( = ?auto_6403210 ?auto_6403207 ) ) ( not ( = ?auto_6403210 ?auto_6403209 ) ) ( ON_BOARD ?auto_6403214 ?auto_6403213 ) ( SUPPORTS ?auto_6403214 ?auto_6403208 ) ( not ( = ?auto_6403209 ?auto_6403212 ) ) ( HAVE_IMAGE ?auto_6403205 ?auto_6403206 ) ( not ( = ?auto_6403205 ?auto_6403212 ) ) ( not ( = ?auto_6403206 ?auto_6403208 ) ) ( CALIBRATION_TARGET ?auto_6403214 ?auto_6403212 ) ( POINTING ?auto_6403213 ?auto_6403207 ) ( not ( = ?auto_6403212 ?auto_6403207 ) ) ( ON_BOARD ?auto_6403215 ?auto_6403213 ) ( POWER_ON ?auto_6403215 ) ( not ( = ?auto_6403214 ?auto_6403215 ) ) ( HAVE_IMAGE ?auto_6403207 ?auto_6403204 ) ( HAVE_IMAGE ?auto_6403210 ?auto_6403211 ) ( not ( = ?auto_6403206 ?auto_6403204 ) ) ( not ( = ?auto_6403206 ?auto_6403211 ) ) ( not ( = ?auto_6403204 ?auto_6403208 ) ) ( not ( = ?auto_6403204 ?auto_6403211 ) ) ( not ( = ?auto_6403208 ?auto_6403211 ) ) ( not ( = ?auto_6403210 ?auto_6403212 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6403205 ?auto_6403206 ?auto_6403209 ?auto_6403208 )
      ( GET-4IMAGE-VERIFY ?auto_6403205 ?auto_6403206 ?auto_6403207 ?auto_6403204 ?auto_6403209 ?auto_6403208 ?auto_6403210 ?auto_6403211 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6403318 - DIRECTION
      ?auto_6403319 - MODE
      ?auto_6403320 - DIRECTION
      ?auto_6403317 - MODE
      ?auto_6403322 - DIRECTION
      ?auto_6403321 - MODE
      ?auto_6403323 - DIRECTION
      ?auto_6403324 - MODE
    )
    :vars
    (
      ?auto_6403327 - INSTRUMENT
      ?auto_6403326 - SATELLITE
      ?auto_6403325 - DIRECTION
      ?auto_6403328 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6403320 ?auto_6403318 ) ) ( not ( = ?auto_6403322 ?auto_6403318 ) ) ( not ( = ?auto_6403322 ?auto_6403320 ) ) ( not ( = ?auto_6403323 ?auto_6403318 ) ) ( not ( = ?auto_6403323 ?auto_6403320 ) ) ( not ( = ?auto_6403323 ?auto_6403322 ) ) ( ON_BOARD ?auto_6403327 ?auto_6403326 ) ( SUPPORTS ?auto_6403327 ?auto_6403317 ) ( not ( = ?auto_6403320 ?auto_6403325 ) ) ( HAVE_IMAGE ?auto_6403318 ?auto_6403319 ) ( not ( = ?auto_6403318 ?auto_6403325 ) ) ( not ( = ?auto_6403319 ?auto_6403317 ) ) ( CALIBRATION_TARGET ?auto_6403327 ?auto_6403325 ) ( POINTING ?auto_6403326 ?auto_6403323 ) ( not ( = ?auto_6403325 ?auto_6403323 ) ) ( ON_BOARD ?auto_6403328 ?auto_6403326 ) ( POWER_ON ?auto_6403328 ) ( not ( = ?auto_6403327 ?auto_6403328 ) ) ( HAVE_IMAGE ?auto_6403322 ?auto_6403321 ) ( HAVE_IMAGE ?auto_6403323 ?auto_6403324 ) ( not ( = ?auto_6403319 ?auto_6403321 ) ) ( not ( = ?auto_6403319 ?auto_6403324 ) ) ( not ( = ?auto_6403317 ?auto_6403321 ) ) ( not ( = ?auto_6403317 ?auto_6403324 ) ) ( not ( = ?auto_6403322 ?auto_6403325 ) ) ( not ( = ?auto_6403321 ?auto_6403324 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6403318 ?auto_6403319 ?auto_6403320 ?auto_6403317 )
      ( GET-4IMAGE-VERIFY ?auto_6403318 ?auto_6403319 ?auto_6403320 ?auto_6403317 ?auto_6403322 ?auto_6403321 ?auto_6403323 ?auto_6403324 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6403355 - DIRECTION
      ?auto_6403356 - MODE
      ?auto_6403357 - DIRECTION
      ?auto_6403354 - MODE
      ?auto_6403359 - DIRECTION
      ?auto_6403358 - MODE
      ?auto_6403360 - DIRECTION
      ?auto_6403361 - MODE
    )
    :vars
    (
      ?auto_6403364 - INSTRUMENT
      ?auto_6403363 - SATELLITE
      ?auto_6403362 - DIRECTION
      ?auto_6403365 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6403357 ?auto_6403355 ) ) ( not ( = ?auto_6403359 ?auto_6403355 ) ) ( not ( = ?auto_6403359 ?auto_6403357 ) ) ( not ( = ?auto_6403360 ?auto_6403355 ) ) ( not ( = ?auto_6403360 ?auto_6403357 ) ) ( not ( = ?auto_6403360 ?auto_6403359 ) ) ( ON_BOARD ?auto_6403364 ?auto_6403363 ) ( SUPPORTS ?auto_6403364 ?auto_6403354 ) ( not ( = ?auto_6403357 ?auto_6403362 ) ) ( HAVE_IMAGE ?auto_6403355 ?auto_6403356 ) ( not ( = ?auto_6403355 ?auto_6403362 ) ) ( not ( = ?auto_6403356 ?auto_6403354 ) ) ( CALIBRATION_TARGET ?auto_6403364 ?auto_6403362 ) ( POINTING ?auto_6403363 ?auto_6403359 ) ( not ( = ?auto_6403362 ?auto_6403359 ) ) ( ON_BOARD ?auto_6403365 ?auto_6403363 ) ( POWER_ON ?auto_6403365 ) ( not ( = ?auto_6403364 ?auto_6403365 ) ) ( HAVE_IMAGE ?auto_6403359 ?auto_6403358 ) ( HAVE_IMAGE ?auto_6403360 ?auto_6403361 ) ( not ( = ?auto_6403356 ?auto_6403358 ) ) ( not ( = ?auto_6403356 ?auto_6403361 ) ) ( not ( = ?auto_6403354 ?auto_6403358 ) ) ( not ( = ?auto_6403354 ?auto_6403361 ) ) ( not ( = ?auto_6403358 ?auto_6403361 ) ) ( not ( = ?auto_6403360 ?auto_6403362 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6403355 ?auto_6403356 ?auto_6403357 ?auto_6403354 )
      ( GET-4IMAGE-VERIFY ?auto_6403355 ?auto_6403356 ?auto_6403357 ?auto_6403354 ?auto_6403359 ?auto_6403358 ?auto_6403360 ?auto_6403361 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6403931 - DIRECTION
      ?auto_6403932 - MODE
      ?auto_6403933 - DIRECTION
      ?auto_6403930 - MODE
      ?auto_6403935 - DIRECTION
      ?auto_6403934 - MODE
      ?auto_6403936 - DIRECTION
      ?auto_6403937 - MODE
    )
    :vars
    (
      ?auto_6403940 - INSTRUMENT
      ?auto_6403939 - SATELLITE
      ?auto_6403938 - DIRECTION
      ?auto_6403941 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6403933 ?auto_6403931 ) ) ( not ( = ?auto_6403935 ?auto_6403931 ) ) ( not ( = ?auto_6403935 ?auto_6403933 ) ) ( not ( = ?auto_6403936 ?auto_6403931 ) ) ( not ( = ?auto_6403936 ?auto_6403933 ) ) ( not ( = ?auto_6403936 ?auto_6403935 ) ) ( ON_BOARD ?auto_6403940 ?auto_6403939 ) ( SUPPORTS ?auto_6403940 ?auto_6403937 ) ( not ( = ?auto_6403936 ?auto_6403938 ) ) ( HAVE_IMAGE ?auto_6403933 ?auto_6403930 ) ( not ( = ?auto_6403933 ?auto_6403938 ) ) ( not ( = ?auto_6403930 ?auto_6403937 ) ) ( CALIBRATION_TARGET ?auto_6403940 ?auto_6403938 ) ( POINTING ?auto_6403939 ?auto_6403931 ) ( not ( = ?auto_6403938 ?auto_6403931 ) ) ( ON_BOARD ?auto_6403941 ?auto_6403939 ) ( POWER_ON ?auto_6403941 ) ( not ( = ?auto_6403940 ?auto_6403941 ) ) ( HAVE_IMAGE ?auto_6403931 ?auto_6403932 ) ( HAVE_IMAGE ?auto_6403935 ?auto_6403934 ) ( not ( = ?auto_6403932 ?auto_6403930 ) ) ( not ( = ?auto_6403932 ?auto_6403934 ) ) ( not ( = ?auto_6403932 ?auto_6403937 ) ) ( not ( = ?auto_6403930 ?auto_6403934 ) ) ( not ( = ?auto_6403935 ?auto_6403938 ) ) ( not ( = ?auto_6403934 ?auto_6403937 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6403933 ?auto_6403930 ?auto_6403936 ?auto_6403937 )
      ( GET-4IMAGE-VERIFY ?auto_6403931 ?auto_6403932 ?auto_6403933 ?auto_6403930 ?auto_6403935 ?auto_6403934 ?auto_6403936 ?auto_6403937 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6403967 - DIRECTION
      ?auto_6403968 - MODE
      ?auto_6403969 - DIRECTION
      ?auto_6403966 - MODE
      ?auto_6403971 - DIRECTION
      ?auto_6403970 - MODE
      ?auto_6403972 - DIRECTION
      ?auto_6403973 - MODE
    )
    :vars
    (
      ?auto_6403976 - INSTRUMENT
      ?auto_6403975 - SATELLITE
      ?auto_6403974 - DIRECTION
      ?auto_6403977 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6403969 ?auto_6403967 ) ) ( not ( = ?auto_6403971 ?auto_6403967 ) ) ( not ( = ?auto_6403971 ?auto_6403969 ) ) ( not ( = ?auto_6403972 ?auto_6403967 ) ) ( not ( = ?auto_6403972 ?auto_6403969 ) ) ( not ( = ?auto_6403972 ?auto_6403971 ) ) ( ON_BOARD ?auto_6403976 ?auto_6403975 ) ( SUPPORTS ?auto_6403976 ?auto_6403970 ) ( not ( = ?auto_6403971 ?auto_6403974 ) ) ( HAVE_IMAGE ?auto_6403969 ?auto_6403966 ) ( not ( = ?auto_6403969 ?auto_6403974 ) ) ( not ( = ?auto_6403966 ?auto_6403970 ) ) ( CALIBRATION_TARGET ?auto_6403976 ?auto_6403974 ) ( POINTING ?auto_6403975 ?auto_6403967 ) ( not ( = ?auto_6403974 ?auto_6403967 ) ) ( ON_BOARD ?auto_6403977 ?auto_6403975 ) ( POWER_ON ?auto_6403977 ) ( not ( = ?auto_6403976 ?auto_6403977 ) ) ( HAVE_IMAGE ?auto_6403967 ?auto_6403968 ) ( HAVE_IMAGE ?auto_6403972 ?auto_6403973 ) ( not ( = ?auto_6403968 ?auto_6403966 ) ) ( not ( = ?auto_6403968 ?auto_6403970 ) ) ( not ( = ?auto_6403968 ?auto_6403973 ) ) ( not ( = ?auto_6403966 ?auto_6403973 ) ) ( not ( = ?auto_6403970 ?auto_6403973 ) ) ( not ( = ?auto_6403972 ?auto_6403974 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6403969 ?auto_6403966 ?auto_6403971 ?auto_6403970 )
      ( GET-4IMAGE-VERIFY ?auto_6403967 ?auto_6403968 ?auto_6403969 ?auto_6403966 ?auto_6403971 ?auto_6403970 ?auto_6403972 ?auto_6403973 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6404195 - DIRECTION
      ?auto_6404196 - MODE
      ?auto_6404197 - DIRECTION
      ?auto_6404194 - MODE
      ?auto_6404199 - DIRECTION
      ?auto_6404198 - MODE
      ?auto_6404200 - DIRECTION
      ?auto_6404201 - MODE
    )
    :vars
    (
      ?auto_6404204 - INSTRUMENT
      ?auto_6404203 - SATELLITE
      ?auto_6404202 - DIRECTION
      ?auto_6404205 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6404197 ?auto_6404195 ) ) ( not ( = ?auto_6404199 ?auto_6404195 ) ) ( not ( = ?auto_6404199 ?auto_6404197 ) ) ( not ( = ?auto_6404200 ?auto_6404195 ) ) ( not ( = ?auto_6404200 ?auto_6404197 ) ) ( not ( = ?auto_6404200 ?auto_6404199 ) ) ( ON_BOARD ?auto_6404204 ?auto_6404203 ) ( SUPPORTS ?auto_6404204 ?auto_6404194 ) ( not ( = ?auto_6404197 ?auto_6404202 ) ) ( HAVE_IMAGE ?auto_6404199 ?auto_6404198 ) ( not ( = ?auto_6404199 ?auto_6404202 ) ) ( not ( = ?auto_6404198 ?auto_6404194 ) ) ( CALIBRATION_TARGET ?auto_6404204 ?auto_6404202 ) ( POINTING ?auto_6404203 ?auto_6404195 ) ( not ( = ?auto_6404202 ?auto_6404195 ) ) ( ON_BOARD ?auto_6404205 ?auto_6404203 ) ( POWER_ON ?auto_6404205 ) ( not ( = ?auto_6404204 ?auto_6404205 ) ) ( HAVE_IMAGE ?auto_6404195 ?auto_6404196 ) ( HAVE_IMAGE ?auto_6404200 ?auto_6404201 ) ( not ( = ?auto_6404196 ?auto_6404194 ) ) ( not ( = ?auto_6404196 ?auto_6404198 ) ) ( not ( = ?auto_6404196 ?auto_6404201 ) ) ( not ( = ?auto_6404194 ?auto_6404201 ) ) ( not ( = ?auto_6404198 ?auto_6404201 ) ) ( not ( = ?auto_6404200 ?auto_6404202 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6404199 ?auto_6404198 ?auto_6404197 ?auto_6404194 )
      ( GET-4IMAGE-VERIFY ?auto_6404195 ?auto_6404196 ?auto_6404197 ?auto_6404194 ?auto_6404199 ?auto_6404198 ?auto_6404200 ?auto_6404201 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6404466 - DIRECTION
      ?auto_6404467 - MODE
      ?auto_6404468 - DIRECTION
      ?auto_6404465 - MODE
      ?auto_6404470 - DIRECTION
      ?auto_6404469 - MODE
      ?auto_6404471 - DIRECTION
      ?auto_6404472 - MODE
    )
    :vars
    (
      ?auto_6404475 - INSTRUMENT
      ?auto_6404474 - SATELLITE
      ?auto_6404473 - DIRECTION
      ?auto_6404476 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6404468 ?auto_6404466 ) ) ( not ( = ?auto_6404470 ?auto_6404466 ) ) ( not ( = ?auto_6404470 ?auto_6404468 ) ) ( not ( = ?auto_6404471 ?auto_6404466 ) ) ( not ( = ?auto_6404471 ?auto_6404468 ) ) ( not ( = ?auto_6404471 ?auto_6404470 ) ) ( ON_BOARD ?auto_6404475 ?auto_6404474 ) ( SUPPORTS ?auto_6404475 ?auto_6404467 ) ( not ( = ?auto_6404466 ?auto_6404473 ) ) ( HAVE_IMAGE ?auto_6404468 ?auto_6404465 ) ( not ( = ?auto_6404468 ?auto_6404473 ) ) ( not ( = ?auto_6404465 ?auto_6404467 ) ) ( CALIBRATION_TARGET ?auto_6404475 ?auto_6404473 ) ( POINTING ?auto_6404474 ?auto_6404471 ) ( not ( = ?auto_6404473 ?auto_6404471 ) ) ( ON_BOARD ?auto_6404476 ?auto_6404474 ) ( POWER_ON ?auto_6404476 ) ( not ( = ?auto_6404475 ?auto_6404476 ) ) ( HAVE_IMAGE ?auto_6404470 ?auto_6404469 ) ( HAVE_IMAGE ?auto_6404471 ?auto_6404472 ) ( not ( = ?auto_6404467 ?auto_6404469 ) ) ( not ( = ?auto_6404467 ?auto_6404472 ) ) ( not ( = ?auto_6404465 ?auto_6404469 ) ) ( not ( = ?auto_6404465 ?auto_6404472 ) ) ( not ( = ?auto_6404470 ?auto_6404473 ) ) ( not ( = ?auto_6404469 ?auto_6404472 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6404468 ?auto_6404465 ?auto_6404466 ?auto_6404467 )
      ( GET-4IMAGE-VERIFY ?auto_6404466 ?auto_6404467 ?auto_6404468 ?auto_6404465 ?auto_6404470 ?auto_6404469 ?auto_6404471 ?auto_6404472 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6404503 - DIRECTION
      ?auto_6404504 - MODE
      ?auto_6404505 - DIRECTION
      ?auto_6404502 - MODE
      ?auto_6404507 - DIRECTION
      ?auto_6404506 - MODE
      ?auto_6404508 - DIRECTION
      ?auto_6404509 - MODE
    )
    :vars
    (
      ?auto_6404512 - INSTRUMENT
      ?auto_6404511 - SATELLITE
      ?auto_6404510 - DIRECTION
      ?auto_6404513 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6404505 ?auto_6404503 ) ) ( not ( = ?auto_6404507 ?auto_6404503 ) ) ( not ( = ?auto_6404507 ?auto_6404505 ) ) ( not ( = ?auto_6404508 ?auto_6404503 ) ) ( not ( = ?auto_6404508 ?auto_6404505 ) ) ( not ( = ?auto_6404508 ?auto_6404507 ) ) ( ON_BOARD ?auto_6404512 ?auto_6404511 ) ( SUPPORTS ?auto_6404512 ?auto_6404504 ) ( not ( = ?auto_6404503 ?auto_6404510 ) ) ( HAVE_IMAGE ?auto_6404505 ?auto_6404502 ) ( not ( = ?auto_6404505 ?auto_6404510 ) ) ( not ( = ?auto_6404502 ?auto_6404504 ) ) ( CALIBRATION_TARGET ?auto_6404512 ?auto_6404510 ) ( POINTING ?auto_6404511 ?auto_6404507 ) ( not ( = ?auto_6404510 ?auto_6404507 ) ) ( ON_BOARD ?auto_6404513 ?auto_6404511 ) ( POWER_ON ?auto_6404513 ) ( not ( = ?auto_6404512 ?auto_6404513 ) ) ( HAVE_IMAGE ?auto_6404507 ?auto_6404506 ) ( HAVE_IMAGE ?auto_6404508 ?auto_6404509 ) ( not ( = ?auto_6404504 ?auto_6404506 ) ) ( not ( = ?auto_6404504 ?auto_6404509 ) ) ( not ( = ?auto_6404502 ?auto_6404506 ) ) ( not ( = ?auto_6404502 ?auto_6404509 ) ) ( not ( = ?auto_6404506 ?auto_6404509 ) ) ( not ( = ?auto_6404508 ?auto_6404510 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6404505 ?auto_6404502 ?auto_6404503 ?auto_6404504 )
      ( GET-4IMAGE-VERIFY ?auto_6404503 ?auto_6404504 ?auto_6404505 ?auto_6404502 ?auto_6404507 ?auto_6404506 ?auto_6404508 ?auto_6404509 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6404813 - DIRECTION
      ?auto_6404814 - MODE
      ?auto_6404815 - DIRECTION
      ?auto_6404812 - MODE
      ?auto_6404817 - DIRECTION
      ?auto_6404816 - MODE
      ?auto_6404818 - DIRECTION
      ?auto_6404819 - MODE
    )
    :vars
    (
      ?auto_6404822 - INSTRUMENT
      ?auto_6404821 - SATELLITE
      ?auto_6404820 - DIRECTION
      ?auto_6404823 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6404815 ?auto_6404813 ) ) ( not ( = ?auto_6404817 ?auto_6404813 ) ) ( not ( = ?auto_6404817 ?auto_6404815 ) ) ( not ( = ?auto_6404818 ?auto_6404813 ) ) ( not ( = ?auto_6404818 ?auto_6404815 ) ) ( not ( = ?auto_6404818 ?auto_6404817 ) ) ( ON_BOARD ?auto_6404822 ?auto_6404821 ) ( SUPPORTS ?auto_6404822 ?auto_6404814 ) ( not ( = ?auto_6404813 ?auto_6404820 ) ) ( HAVE_IMAGE ?auto_6404817 ?auto_6404816 ) ( not ( = ?auto_6404817 ?auto_6404820 ) ) ( not ( = ?auto_6404816 ?auto_6404814 ) ) ( CALIBRATION_TARGET ?auto_6404822 ?auto_6404820 ) ( POINTING ?auto_6404821 ?auto_6404815 ) ( not ( = ?auto_6404820 ?auto_6404815 ) ) ( ON_BOARD ?auto_6404823 ?auto_6404821 ) ( POWER_ON ?auto_6404823 ) ( not ( = ?auto_6404822 ?auto_6404823 ) ) ( HAVE_IMAGE ?auto_6404815 ?auto_6404812 ) ( HAVE_IMAGE ?auto_6404818 ?auto_6404819 ) ( not ( = ?auto_6404814 ?auto_6404812 ) ) ( not ( = ?auto_6404814 ?auto_6404819 ) ) ( not ( = ?auto_6404812 ?auto_6404816 ) ) ( not ( = ?auto_6404812 ?auto_6404819 ) ) ( not ( = ?auto_6404816 ?auto_6404819 ) ) ( not ( = ?auto_6404818 ?auto_6404820 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6404817 ?auto_6404816 ?auto_6404813 ?auto_6404814 )
      ( GET-4IMAGE-VERIFY ?auto_6404813 ?auto_6404814 ?auto_6404815 ?auto_6404812 ?auto_6404817 ?auto_6404816 ?auto_6404818 ?auto_6404819 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6445518 - DIRECTION
      ?auto_6445519 - MODE
      ?auto_6445520 - DIRECTION
      ?auto_6445517 - MODE
      ?auto_6445522 - DIRECTION
      ?auto_6445521 - MODE
    )
    :vars
    (
      ?auto_6445526 - INSTRUMENT
      ?auto_6445525 - SATELLITE
      ?auto_6445523 - DIRECTION
      ?auto_6445524 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6445520 ?auto_6445518 ) ) ( not ( = ?auto_6445522 ?auto_6445518 ) ) ( not ( = ?auto_6445522 ?auto_6445520 ) ) ( ON_BOARD ?auto_6445526 ?auto_6445525 ) ( SUPPORTS ?auto_6445526 ?auto_6445521 ) ( not ( = ?auto_6445522 ?auto_6445523 ) ) ( HAVE_IMAGE ?auto_6445518 ?auto_6445519 ) ( not ( = ?auto_6445518 ?auto_6445523 ) ) ( not ( = ?auto_6445519 ?auto_6445521 ) ) ( CALIBRATION_TARGET ?auto_6445526 ?auto_6445523 ) ( not ( = ?auto_6445523 ?auto_6445520 ) ) ( ON_BOARD ?auto_6445524 ?auto_6445525 ) ( POWER_ON ?auto_6445524 ) ( not ( = ?auto_6445526 ?auto_6445524 ) ) ( POINTING ?auto_6445525 ?auto_6445523 ) ( HAVE_IMAGE ?auto_6445520 ?auto_6445517 ) ( not ( = ?auto_6445519 ?auto_6445517 ) ) ( not ( = ?auto_6445517 ?auto_6445521 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6445518 ?auto_6445519 ?auto_6445522 ?auto_6445521 )
      ( GET-3IMAGE-VERIFY ?auto_6445518 ?auto_6445519 ?auto_6445520 ?auto_6445517 ?auto_6445522 ?auto_6445521 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6445550 - DIRECTION
      ?auto_6445551 - MODE
      ?auto_6445552 - DIRECTION
      ?auto_6445549 - MODE
      ?auto_6445554 - DIRECTION
      ?auto_6445553 - MODE
    )
    :vars
    (
      ?auto_6445558 - INSTRUMENT
      ?auto_6445557 - SATELLITE
      ?auto_6445555 - DIRECTION
      ?auto_6445556 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6445552 ?auto_6445550 ) ) ( not ( = ?auto_6445554 ?auto_6445550 ) ) ( not ( = ?auto_6445554 ?auto_6445552 ) ) ( ON_BOARD ?auto_6445558 ?auto_6445557 ) ( SUPPORTS ?auto_6445558 ?auto_6445549 ) ( not ( = ?auto_6445552 ?auto_6445555 ) ) ( HAVE_IMAGE ?auto_6445550 ?auto_6445551 ) ( not ( = ?auto_6445550 ?auto_6445555 ) ) ( not ( = ?auto_6445551 ?auto_6445549 ) ) ( CALIBRATION_TARGET ?auto_6445558 ?auto_6445555 ) ( not ( = ?auto_6445555 ?auto_6445554 ) ) ( ON_BOARD ?auto_6445556 ?auto_6445557 ) ( POWER_ON ?auto_6445556 ) ( not ( = ?auto_6445558 ?auto_6445556 ) ) ( POINTING ?auto_6445557 ?auto_6445555 ) ( HAVE_IMAGE ?auto_6445554 ?auto_6445553 ) ( not ( = ?auto_6445551 ?auto_6445553 ) ) ( not ( = ?auto_6445549 ?auto_6445553 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6445550 ?auto_6445551 ?auto_6445552 ?auto_6445549 )
      ( GET-3IMAGE-VERIFY ?auto_6445550 ?auto_6445551 ?auto_6445552 ?auto_6445549 ?auto_6445554 ?auto_6445553 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6431242 - DIRECTION
      ?auto_6431243 - MODE
      ?auto_6431244 - DIRECTION
      ?auto_6431241 - MODE
      ?auto_6431246 - DIRECTION
      ?auto_6431245 - MODE
    )
    :vars
    (
      ?auto_6431250 - INSTRUMENT
      ?auto_6431251 - SATELLITE
      ?auto_6431248 - DIRECTION
      ?auto_6431249 - DIRECTION
      ?auto_6431247 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6431244 ?auto_6431242 ) ) ( not ( = ?auto_6431246 ?auto_6431242 ) ) ( not ( = ?auto_6431246 ?auto_6431244 ) ) ( ON_BOARD ?auto_6431250 ?auto_6431251 ) ( SUPPORTS ?auto_6431250 ?auto_6431245 ) ( not ( = ?auto_6431246 ?auto_6431248 ) ) ( HAVE_IMAGE ?auto_6431244 ?auto_6431241 ) ( not ( = ?auto_6431244 ?auto_6431248 ) ) ( not ( = ?auto_6431241 ?auto_6431245 ) ) ( CALIBRATION_TARGET ?auto_6431250 ?auto_6431248 ) ( not ( = ?auto_6431248 ?auto_6431249 ) ) ( not ( = ?auto_6431246 ?auto_6431249 ) ) ( not ( = ?auto_6431244 ?auto_6431249 ) ) ( ON_BOARD ?auto_6431247 ?auto_6431251 ) ( POWER_ON ?auto_6431247 ) ( not ( = ?auto_6431250 ?auto_6431247 ) ) ( POINTING ?auto_6431251 ?auto_6431248 ) ( HAVE_IMAGE ?auto_6431242 ?auto_6431243 ) ( not ( = ?auto_6431242 ?auto_6431248 ) ) ( not ( = ?auto_6431242 ?auto_6431249 ) ) ( not ( = ?auto_6431243 ?auto_6431241 ) ) ( not ( = ?auto_6431243 ?auto_6431245 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6431244 ?auto_6431241 ?auto_6431246 ?auto_6431245 )
      ( GET-3IMAGE-VERIFY ?auto_6431242 ?auto_6431243 ?auto_6431244 ?auto_6431241 ?auto_6431246 ?auto_6431245 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6431278 - DIRECTION
      ?auto_6431279 - MODE
      ?auto_6431280 - DIRECTION
      ?auto_6431277 - MODE
      ?auto_6431282 - DIRECTION
      ?auto_6431281 - MODE
    )
    :vars
    (
      ?auto_6431286 - INSTRUMENT
      ?auto_6431287 - SATELLITE
      ?auto_6431284 - DIRECTION
      ?auto_6431285 - DIRECTION
      ?auto_6431283 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6431280 ?auto_6431278 ) ) ( not ( = ?auto_6431282 ?auto_6431278 ) ) ( not ( = ?auto_6431282 ?auto_6431280 ) ) ( ON_BOARD ?auto_6431286 ?auto_6431287 ) ( SUPPORTS ?auto_6431286 ?auto_6431277 ) ( not ( = ?auto_6431280 ?auto_6431284 ) ) ( HAVE_IMAGE ?auto_6431282 ?auto_6431281 ) ( not ( = ?auto_6431282 ?auto_6431284 ) ) ( not ( = ?auto_6431281 ?auto_6431277 ) ) ( CALIBRATION_TARGET ?auto_6431286 ?auto_6431284 ) ( not ( = ?auto_6431284 ?auto_6431285 ) ) ( not ( = ?auto_6431280 ?auto_6431285 ) ) ( not ( = ?auto_6431282 ?auto_6431285 ) ) ( ON_BOARD ?auto_6431283 ?auto_6431287 ) ( POWER_ON ?auto_6431283 ) ( not ( = ?auto_6431286 ?auto_6431283 ) ) ( POINTING ?auto_6431287 ?auto_6431284 ) ( HAVE_IMAGE ?auto_6431278 ?auto_6431279 ) ( not ( = ?auto_6431278 ?auto_6431284 ) ) ( not ( = ?auto_6431278 ?auto_6431285 ) ) ( not ( = ?auto_6431279 ?auto_6431277 ) ) ( not ( = ?auto_6431279 ?auto_6431281 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6431282 ?auto_6431281 ?auto_6431280 ?auto_6431277 )
      ( GET-3IMAGE-VERIFY ?auto_6431278 ?auto_6431279 ?auto_6431280 ?auto_6431277 ?auto_6431282 ?auto_6431281 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6445750 - DIRECTION
      ?auto_6445751 - MODE
      ?auto_6445752 - DIRECTION
      ?auto_6445749 - MODE
      ?auto_6445754 - DIRECTION
      ?auto_6445753 - MODE
    )
    :vars
    (
      ?auto_6445758 - INSTRUMENT
      ?auto_6445757 - SATELLITE
      ?auto_6445755 - DIRECTION
      ?auto_6445756 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6445752 ?auto_6445750 ) ) ( not ( = ?auto_6445754 ?auto_6445750 ) ) ( not ( = ?auto_6445754 ?auto_6445752 ) ) ( ON_BOARD ?auto_6445758 ?auto_6445757 ) ( SUPPORTS ?auto_6445758 ?auto_6445751 ) ( not ( = ?auto_6445750 ?auto_6445755 ) ) ( HAVE_IMAGE ?auto_6445752 ?auto_6445749 ) ( not ( = ?auto_6445752 ?auto_6445755 ) ) ( not ( = ?auto_6445749 ?auto_6445751 ) ) ( CALIBRATION_TARGET ?auto_6445758 ?auto_6445755 ) ( not ( = ?auto_6445755 ?auto_6445754 ) ) ( ON_BOARD ?auto_6445756 ?auto_6445757 ) ( POWER_ON ?auto_6445756 ) ( not ( = ?auto_6445758 ?auto_6445756 ) ) ( POINTING ?auto_6445757 ?auto_6445755 ) ( HAVE_IMAGE ?auto_6445754 ?auto_6445753 ) ( not ( = ?auto_6445751 ?auto_6445753 ) ) ( not ( = ?auto_6445749 ?auto_6445753 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6445752 ?auto_6445749 ?auto_6445750 ?auto_6445751 )
      ( GET-3IMAGE-VERIFY ?auto_6445750 ?auto_6445751 ?auto_6445752 ?auto_6445749 ?auto_6445754 ?auto_6445753 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_6431450 - DIRECTION
      ?auto_6431451 - MODE
      ?auto_6431452 - DIRECTION
      ?auto_6431449 - MODE
      ?auto_6431454 - DIRECTION
      ?auto_6431453 - MODE
    )
    :vars
    (
      ?auto_6431458 - INSTRUMENT
      ?auto_6431459 - SATELLITE
      ?auto_6431456 - DIRECTION
      ?auto_6431457 - DIRECTION
      ?auto_6431455 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6431452 ?auto_6431450 ) ) ( not ( = ?auto_6431454 ?auto_6431450 ) ) ( not ( = ?auto_6431454 ?auto_6431452 ) ) ( ON_BOARD ?auto_6431458 ?auto_6431459 ) ( SUPPORTS ?auto_6431458 ?auto_6431451 ) ( not ( = ?auto_6431450 ?auto_6431456 ) ) ( HAVE_IMAGE ?auto_6431454 ?auto_6431453 ) ( not ( = ?auto_6431454 ?auto_6431456 ) ) ( not ( = ?auto_6431453 ?auto_6431451 ) ) ( CALIBRATION_TARGET ?auto_6431458 ?auto_6431456 ) ( not ( = ?auto_6431456 ?auto_6431457 ) ) ( not ( = ?auto_6431450 ?auto_6431457 ) ) ( not ( = ?auto_6431454 ?auto_6431457 ) ) ( ON_BOARD ?auto_6431455 ?auto_6431459 ) ( POWER_ON ?auto_6431455 ) ( not ( = ?auto_6431458 ?auto_6431455 ) ) ( POINTING ?auto_6431459 ?auto_6431456 ) ( HAVE_IMAGE ?auto_6431452 ?auto_6431449 ) ( not ( = ?auto_6431451 ?auto_6431449 ) ) ( not ( = ?auto_6431452 ?auto_6431456 ) ) ( not ( = ?auto_6431452 ?auto_6431457 ) ) ( not ( = ?auto_6431449 ?auto_6431453 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6431454 ?auto_6431453 ?auto_6431450 ?auto_6431451 )
      ( GET-3IMAGE-VERIFY ?auto_6431450 ?auto_6431451 ?auto_6431452 ?auto_6431449 ?auto_6431454 ?auto_6431453 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6681132 - DIRECTION
      ?auto_6681133 - MODE
      ?auto_6681134 - DIRECTION
      ?auto_6681131 - MODE
      ?auto_6681136 - DIRECTION
      ?auto_6681135 - MODE
      ?auto_6681137 - DIRECTION
      ?auto_6681138 - MODE
      ?auto_6681139 - DIRECTION
      ?auto_6681140 - MODE
    )
    :vars
    (
      ?auto_6681142 - INSTRUMENT
      ?auto_6681141 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_6681134 ?auto_6681132 ) ) ( not ( = ?auto_6681136 ?auto_6681132 ) ) ( not ( = ?auto_6681136 ?auto_6681134 ) ) ( not ( = ?auto_6681137 ?auto_6681132 ) ) ( not ( = ?auto_6681137 ?auto_6681134 ) ) ( not ( = ?auto_6681137 ?auto_6681136 ) ) ( not ( = ?auto_6681139 ?auto_6681132 ) ) ( not ( = ?auto_6681139 ?auto_6681134 ) ) ( not ( = ?auto_6681139 ?auto_6681136 ) ) ( not ( = ?auto_6681139 ?auto_6681137 ) ) ( CALIBRATED ?auto_6681142 ) ( ON_BOARD ?auto_6681142 ?auto_6681141 ) ( SUPPORTS ?auto_6681142 ?auto_6681140 ) ( POWER_ON ?auto_6681142 ) ( POINTING ?auto_6681141 ?auto_6681139 ) ( HAVE_IMAGE ?auto_6681132 ?auto_6681133 ) ( HAVE_IMAGE ?auto_6681134 ?auto_6681131 ) ( HAVE_IMAGE ?auto_6681136 ?auto_6681135 ) ( HAVE_IMAGE ?auto_6681137 ?auto_6681138 ) ( not ( = ?auto_6681133 ?auto_6681131 ) ) ( not ( = ?auto_6681133 ?auto_6681135 ) ) ( not ( = ?auto_6681133 ?auto_6681138 ) ) ( not ( = ?auto_6681133 ?auto_6681140 ) ) ( not ( = ?auto_6681131 ?auto_6681135 ) ) ( not ( = ?auto_6681131 ?auto_6681138 ) ) ( not ( = ?auto_6681131 ?auto_6681140 ) ) ( not ( = ?auto_6681135 ?auto_6681138 ) ) ( not ( = ?auto_6681135 ?auto_6681140 ) ) ( not ( = ?auto_6681138 ?auto_6681140 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6681139 ?auto_6681140 )
      ( GET-5IMAGE-VERIFY ?auto_6681132 ?auto_6681133 ?auto_6681134 ?auto_6681131 ?auto_6681136 ?auto_6681135 ?auto_6681137 ?auto_6681138 ?auto_6681139 ?auto_6681140 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6681180 - DIRECTION
      ?auto_6681181 - MODE
      ?auto_6681182 - DIRECTION
      ?auto_6681179 - MODE
      ?auto_6681184 - DIRECTION
      ?auto_6681183 - MODE
      ?auto_6681185 - DIRECTION
      ?auto_6681186 - MODE
      ?auto_6681187 - DIRECTION
      ?auto_6681188 - MODE
    )
    :vars
    (
      ?auto_6681190 - INSTRUMENT
      ?auto_6681189 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_6681182 ?auto_6681180 ) ) ( not ( = ?auto_6681184 ?auto_6681180 ) ) ( not ( = ?auto_6681184 ?auto_6681182 ) ) ( not ( = ?auto_6681185 ?auto_6681180 ) ) ( not ( = ?auto_6681185 ?auto_6681182 ) ) ( not ( = ?auto_6681185 ?auto_6681184 ) ) ( not ( = ?auto_6681187 ?auto_6681180 ) ) ( not ( = ?auto_6681187 ?auto_6681182 ) ) ( not ( = ?auto_6681187 ?auto_6681184 ) ) ( not ( = ?auto_6681187 ?auto_6681185 ) ) ( CALIBRATED ?auto_6681190 ) ( ON_BOARD ?auto_6681190 ?auto_6681189 ) ( SUPPORTS ?auto_6681190 ?auto_6681186 ) ( POWER_ON ?auto_6681190 ) ( POINTING ?auto_6681189 ?auto_6681185 ) ( HAVE_IMAGE ?auto_6681180 ?auto_6681181 ) ( HAVE_IMAGE ?auto_6681182 ?auto_6681179 ) ( HAVE_IMAGE ?auto_6681184 ?auto_6681183 ) ( HAVE_IMAGE ?auto_6681187 ?auto_6681188 ) ( not ( = ?auto_6681181 ?auto_6681179 ) ) ( not ( = ?auto_6681181 ?auto_6681183 ) ) ( not ( = ?auto_6681181 ?auto_6681186 ) ) ( not ( = ?auto_6681181 ?auto_6681188 ) ) ( not ( = ?auto_6681179 ?auto_6681183 ) ) ( not ( = ?auto_6681179 ?auto_6681186 ) ) ( not ( = ?auto_6681179 ?auto_6681188 ) ) ( not ( = ?auto_6681183 ?auto_6681186 ) ) ( not ( = ?auto_6681183 ?auto_6681188 ) ) ( not ( = ?auto_6681186 ?auto_6681188 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6681185 ?auto_6681186 )
      ( GET-5IMAGE-VERIFY ?auto_6681180 ?auto_6681181 ?auto_6681182 ?auto_6681179 ?auto_6681184 ?auto_6681183 ?auto_6681185 ?auto_6681186 ?auto_6681187 ?auto_6681188 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6681464 - DIRECTION
      ?auto_6681465 - MODE
      ?auto_6681466 - DIRECTION
      ?auto_6681463 - MODE
      ?auto_6681468 - DIRECTION
      ?auto_6681467 - MODE
      ?auto_6681469 - DIRECTION
      ?auto_6681470 - MODE
      ?auto_6681471 - DIRECTION
      ?auto_6681472 - MODE
    )
    :vars
    (
      ?auto_6681474 - INSTRUMENT
      ?auto_6681473 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_6681466 ?auto_6681464 ) ) ( not ( = ?auto_6681468 ?auto_6681464 ) ) ( not ( = ?auto_6681468 ?auto_6681466 ) ) ( not ( = ?auto_6681469 ?auto_6681464 ) ) ( not ( = ?auto_6681469 ?auto_6681466 ) ) ( not ( = ?auto_6681469 ?auto_6681468 ) ) ( not ( = ?auto_6681471 ?auto_6681464 ) ) ( not ( = ?auto_6681471 ?auto_6681466 ) ) ( not ( = ?auto_6681471 ?auto_6681468 ) ) ( not ( = ?auto_6681471 ?auto_6681469 ) ) ( CALIBRATED ?auto_6681474 ) ( ON_BOARD ?auto_6681474 ?auto_6681473 ) ( SUPPORTS ?auto_6681474 ?auto_6681467 ) ( POWER_ON ?auto_6681474 ) ( POINTING ?auto_6681473 ?auto_6681468 ) ( HAVE_IMAGE ?auto_6681464 ?auto_6681465 ) ( HAVE_IMAGE ?auto_6681466 ?auto_6681463 ) ( HAVE_IMAGE ?auto_6681469 ?auto_6681470 ) ( HAVE_IMAGE ?auto_6681471 ?auto_6681472 ) ( not ( = ?auto_6681465 ?auto_6681463 ) ) ( not ( = ?auto_6681465 ?auto_6681467 ) ) ( not ( = ?auto_6681465 ?auto_6681470 ) ) ( not ( = ?auto_6681465 ?auto_6681472 ) ) ( not ( = ?auto_6681463 ?auto_6681467 ) ) ( not ( = ?auto_6681463 ?auto_6681470 ) ) ( not ( = ?auto_6681463 ?auto_6681472 ) ) ( not ( = ?auto_6681467 ?auto_6681470 ) ) ( not ( = ?auto_6681467 ?auto_6681472 ) ) ( not ( = ?auto_6681470 ?auto_6681472 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6681468 ?auto_6681467 )
      ( GET-5IMAGE-VERIFY ?auto_6681464 ?auto_6681465 ?auto_6681466 ?auto_6681463 ?auto_6681468 ?auto_6681467 ?auto_6681469 ?auto_6681470 ?auto_6681471 ?auto_6681472 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6683502 - DIRECTION
      ?auto_6683503 - MODE
      ?auto_6683504 - DIRECTION
      ?auto_6683501 - MODE
      ?auto_6683506 - DIRECTION
      ?auto_6683505 - MODE
      ?auto_6683507 - DIRECTION
      ?auto_6683508 - MODE
      ?auto_6683509 - DIRECTION
      ?auto_6683510 - MODE
    )
    :vars
    (
      ?auto_6683512 - INSTRUMENT
      ?auto_6683511 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_6683504 ?auto_6683502 ) ) ( not ( = ?auto_6683506 ?auto_6683502 ) ) ( not ( = ?auto_6683506 ?auto_6683504 ) ) ( not ( = ?auto_6683507 ?auto_6683502 ) ) ( not ( = ?auto_6683507 ?auto_6683504 ) ) ( not ( = ?auto_6683507 ?auto_6683506 ) ) ( not ( = ?auto_6683509 ?auto_6683502 ) ) ( not ( = ?auto_6683509 ?auto_6683504 ) ) ( not ( = ?auto_6683509 ?auto_6683506 ) ) ( not ( = ?auto_6683509 ?auto_6683507 ) ) ( CALIBRATED ?auto_6683512 ) ( ON_BOARD ?auto_6683512 ?auto_6683511 ) ( SUPPORTS ?auto_6683512 ?auto_6683501 ) ( POWER_ON ?auto_6683512 ) ( POINTING ?auto_6683511 ?auto_6683504 ) ( HAVE_IMAGE ?auto_6683502 ?auto_6683503 ) ( HAVE_IMAGE ?auto_6683506 ?auto_6683505 ) ( HAVE_IMAGE ?auto_6683507 ?auto_6683508 ) ( HAVE_IMAGE ?auto_6683509 ?auto_6683510 ) ( not ( = ?auto_6683503 ?auto_6683501 ) ) ( not ( = ?auto_6683503 ?auto_6683505 ) ) ( not ( = ?auto_6683503 ?auto_6683508 ) ) ( not ( = ?auto_6683503 ?auto_6683510 ) ) ( not ( = ?auto_6683501 ?auto_6683505 ) ) ( not ( = ?auto_6683501 ?auto_6683508 ) ) ( not ( = ?auto_6683501 ?auto_6683510 ) ) ( not ( = ?auto_6683505 ?auto_6683508 ) ) ( not ( = ?auto_6683505 ?auto_6683510 ) ) ( not ( = ?auto_6683508 ?auto_6683510 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6683504 ?auto_6683501 )
      ( GET-5IMAGE-VERIFY ?auto_6683502 ?auto_6683503 ?auto_6683504 ?auto_6683501 ?auto_6683506 ?auto_6683505 ?auto_6683507 ?auto_6683508 ?auto_6683509 ?auto_6683510 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6698132 - DIRECTION
      ?auto_6698133 - MODE
      ?auto_6698134 - DIRECTION
      ?auto_6698131 - MODE
      ?auto_6698136 - DIRECTION
      ?auto_6698135 - MODE
      ?auto_6698137 - DIRECTION
      ?auto_6698138 - MODE
      ?auto_6698139 - DIRECTION
      ?auto_6698140 - MODE
    )
    :vars
    (
      ?auto_6698142 - INSTRUMENT
      ?auto_6698141 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_6698134 ?auto_6698132 ) ) ( not ( = ?auto_6698136 ?auto_6698132 ) ) ( not ( = ?auto_6698136 ?auto_6698134 ) ) ( not ( = ?auto_6698137 ?auto_6698132 ) ) ( not ( = ?auto_6698137 ?auto_6698134 ) ) ( not ( = ?auto_6698137 ?auto_6698136 ) ) ( not ( = ?auto_6698139 ?auto_6698132 ) ) ( not ( = ?auto_6698139 ?auto_6698134 ) ) ( not ( = ?auto_6698139 ?auto_6698136 ) ) ( not ( = ?auto_6698139 ?auto_6698137 ) ) ( CALIBRATED ?auto_6698142 ) ( ON_BOARD ?auto_6698142 ?auto_6698141 ) ( SUPPORTS ?auto_6698142 ?auto_6698133 ) ( POWER_ON ?auto_6698142 ) ( POINTING ?auto_6698141 ?auto_6698132 ) ( HAVE_IMAGE ?auto_6698134 ?auto_6698131 ) ( HAVE_IMAGE ?auto_6698136 ?auto_6698135 ) ( HAVE_IMAGE ?auto_6698137 ?auto_6698138 ) ( HAVE_IMAGE ?auto_6698139 ?auto_6698140 ) ( not ( = ?auto_6698133 ?auto_6698131 ) ) ( not ( = ?auto_6698133 ?auto_6698135 ) ) ( not ( = ?auto_6698133 ?auto_6698138 ) ) ( not ( = ?auto_6698133 ?auto_6698140 ) ) ( not ( = ?auto_6698131 ?auto_6698135 ) ) ( not ( = ?auto_6698131 ?auto_6698138 ) ) ( not ( = ?auto_6698131 ?auto_6698140 ) ) ( not ( = ?auto_6698135 ?auto_6698138 ) ) ( not ( = ?auto_6698135 ?auto_6698140 ) ) ( not ( = ?auto_6698138 ?auto_6698140 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_6698132 ?auto_6698133 )
      ( GET-5IMAGE-VERIFY ?auto_6698132 ?auto_6698133 ?auto_6698134 ?auto_6698131 ?auto_6698136 ?auto_6698135 ?auto_6698137 ?auto_6698138 ?auto_6698139 ?auto_6698140 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6710821 - DIRECTION
      ?auto_6710822 - MODE
      ?auto_6710823 - DIRECTION
      ?auto_6710820 - MODE
      ?auto_6710825 - DIRECTION
      ?auto_6710824 - MODE
      ?auto_6710826 - DIRECTION
      ?auto_6710827 - MODE
      ?auto_6710828 - DIRECTION
      ?auto_6710829 - MODE
    )
    :vars
    (
      ?auto_6710831 - INSTRUMENT
      ?auto_6710832 - SATELLITE
      ?auto_6710830 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6710823 ?auto_6710821 ) ) ( not ( = ?auto_6710825 ?auto_6710821 ) ) ( not ( = ?auto_6710825 ?auto_6710823 ) ) ( not ( = ?auto_6710826 ?auto_6710821 ) ) ( not ( = ?auto_6710826 ?auto_6710823 ) ) ( not ( = ?auto_6710826 ?auto_6710825 ) ) ( not ( = ?auto_6710828 ?auto_6710821 ) ) ( not ( = ?auto_6710828 ?auto_6710823 ) ) ( not ( = ?auto_6710828 ?auto_6710825 ) ) ( not ( = ?auto_6710828 ?auto_6710826 ) ) ( CALIBRATED ?auto_6710831 ) ( ON_BOARD ?auto_6710831 ?auto_6710832 ) ( SUPPORTS ?auto_6710831 ?auto_6710829 ) ( POWER_ON ?auto_6710831 ) ( POINTING ?auto_6710832 ?auto_6710830 ) ( not ( = ?auto_6710828 ?auto_6710830 ) ) ( HAVE_IMAGE ?auto_6710821 ?auto_6710822 ) ( not ( = ?auto_6710821 ?auto_6710830 ) ) ( not ( = ?auto_6710822 ?auto_6710829 ) ) ( HAVE_IMAGE ?auto_6710823 ?auto_6710820 ) ( HAVE_IMAGE ?auto_6710825 ?auto_6710824 ) ( HAVE_IMAGE ?auto_6710826 ?auto_6710827 ) ( not ( = ?auto_6710822 ?auto_6710820 ) ) ( not ( = ?auto_6710822 ?auto_6710824 ) ) ( not ( = ?auto_6710822 ?auto_6710827 ) ) ( not ( = ?auto_6710823 ?auto_6710830 ) ) ( not ( = ?auto_6710820 ?auto_6710824 ) ) ( not ( = ?auto_6710820 ?auto_6710827 ) ) ( not ( = ?auto_6710820 ?auto_6710829 ) ) ( not ( = ?auto_6710825 ?auto_6710830 ) ) ( not ( = ?auto_6710824 ?auto_6710827 ) ) ( not ( = ?auto_6710824 ?auto_6710829 ) ) ( not ( = ?auto_6710826 ?auto_6710830 ) ) ( not ( = ?auto_6710827 ?auto_6710829 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6710821 ?auto_6710822 ?auto_6710828 ?auto_6710829 )
      ( GET-5IMAGE-VERIFY ?auto_6710821 ?auto_6710822 ?auto_6710823 ?auto_6710820 ?auto_6710825 ?auto_6710824 ?auto_6710826 ?auto_6710827 ?auto_6710828 ?auto_6710829 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6710873 - DIRECTION
      ?auto_6710874 - MODE
      ?auto_6710875 - DIRECTION
      ?auto_6710872 - MODE
      ?auto_6710877 - DIRECTION
      ?auto_6710876 - MODE
      ?auto_6710878 - DIRECTION
      ?auto_6710879 - MODE
      ?auto_6710880 - DIRECTION
      ?auto_6710881 - MODE
    )
    :vars
    (
      ?auto_6710883 - INSTRUMENT
      ?auto_6710884 - SATELLITE
      ?auto_6710882 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6710875 ?auto_6710873 ) ) ( not ( = ?auto_6710877 ?auto_6710873 ) ) ( not ( = ?auto_6710877 ?auto_6710875 ) ) ( not ( = ?auto_6710878 ?auto_6710873 ) ) ( not ( = ?auto_6710878 ?auto_6710875 ) ) ( not ( = ?auto_6710878 ?auto_6710877 ) ) ( not ( = ?auto_6710880 ?auto_6710873 ) ) ( not ( = ?auto_6710880 ?auto_6710875 ) ) ( not ( = ?auto_6710880 ?auto_6710877 ) ) ( not ( = ?auto_6710880 ?auto_6710878 ) ) ( CALIBRATED ?auto_6710883 ) ( ON_BOARD ?auto_6710883 ?auto_6710884 ) ( SUPPORTS ?auto_6710883 ?auto_6710879 ) ( POWER_ON ?auto_6710883 ) ( POINTING ?auto_6710884 ?auto_6710882 ) ( not ( = ?auto_6710878 ?auto_6710882 ) ) ( HAVE_IMAGE ?auto_6710873 ?auto_6710874 ) ( not ( = ?auto_6710873 ?auto_6710882 ) ) ( not ( = ?auto_6710874 ?auto_6710879 ) ) ( HAVE_IMAGE ?auto_6710875 ?auto_6710872 ) ( HAVE_IMAGE ?auto_6710877 ?auto_6710876 ) ( HAVE_IMAGE ?auto_6710880 ?auto_6710881 ) ( not ( = ?auto_6710874 ?auto_6710872 ) ) ( not ( = ?auto_6710874 ?auto_6710876 ) ) ( not ( = ?auto_6710874 ?auto_6710881 ) ) ( not ( = ?auto_6710875 ?auto_6710882 ) ) ( not ( = ?auto_6710872 ?auto_6710876 ) ) ( not ( = ?auto_6710872 ?auto_6710879 ) ) ( not ( = ?auto_6710872 ?auto_6710881 ) ) ( not ( = ?auto_6710877 ?auto_6710882 ) ) ( not ( = ?auto_6710876 ?auto_6710879 ) ) ( not ( = ?auto_6710876 ?auto_6710881 ) ) ( not ( = ?auto_6710879 ?auto_6710881 ) ) ( not ( = ?auto_6710880 ?auto_6710882 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6710873 ?auto_6710874 ?auto_6710878 ?auto_6710879 )
      ( GET-5IMAGE-VERIFY ?auto_6710873 ?auto_6710874 ?auto_6710875 ?auto_6710872 ?auto_6710877 ?auto_6710876 ?auto_6710878 ?auto_6710879 ?auto_6710880 ?auto_6710881 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6711179 - DIRECTION
      ?auto_6711180 - MODE
      ?auto_6711181 - DIRECTION
      ?auto_6711178 - MODE
      ?auto_6711183 - DIRECTION
      ?auto_6711182 - MODE
      ?auto_6711184 - DIRECTION
      ?auto_6711185 - MODE
      ?auto_6711186 - DIRECTION
      ?auto_6711187 - MODE
    )
    :vars
    (
      ?auto_6711189 - INSTRUMENT
      ?auto_6711190 - SATELLITE
      ?auto_6711188 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6711181 ?auto_6711179 ) ) ( not ( = ?auto_6711183 ?auto_6711179 ) ) ( not ( = ?auto_6711183 ?auto_6711181 ) ) ( not ( = ?auto_6711184 ?auto_6711179 ) ) ( not ( = ?auto_6711184 ?auto_6711181 ) ) ( not ( = ?auto_6711184 ?auto_6711183 ) ) ( not ( = ?auto_6711186 ?auto_6711179 ) ) ( not ( = ?auto_6711186 ?auto_6711181 ) ) ( not ( = ?auto_6711186 ?auto_6711183 ) ) ( not ( = ?auto_6711186 ?auto_6711184 ) ) ( CALIBRATED ?auto_6711189 ) ( ON_BOARD ?auto_6711189 ?auto_6711190 ) ( SUPPORTS ?auto_6711189 ?auto_6711182 ) ( POWER_ON ?auto_6711189 ) ( POINTING ?auto_6711190 ?auto_6711188 ) ( not ( = ?auto_6711183 ?auto_6711188 ) ) ( HAVE_IMAGE ?auto_6711179 ?auto_6711180 ) ( not ( = ?auto_6711179 ?auto_6711188 ) ) ( not ( = ?auto_6711180 ?auto_6711182 ) ) ( HAVE_IMAGE ?auto_6711181 ?auto_6711178 ) ( HAVE_IMAGE ?auto_6711184 ?auto_6711185 ) ( HAVE_IMAGE ?auto_6711186 ?auto_6711187 ) ( not ( = ?auto_6711180 ?auto_6711178 ) ) ( not ( = ?auto_6711180 ?auto_6711185 ) ) ( not ( = ?auto_6711180 ?auto_6711187 ) ) ( not ( = ?auto_6711181 ?auto_6711188 ) ) ( not ( = ?auto_6711178 ?auto_6711182 ) ) ( not ( = ?auto_6711178 ?auto_6711185 ) ) ( not ( = ?auto_6711178 ?auto_6711187 ) ) ( not ( = ?auto_6711182 ?auto_6711185 ) ) ( not ( = ?auto_6711182 ?auto_6711187 ) ) ( not ( = ?auto_6711184 ?auto_6711188 ) ) ( not ( = ?auto_6711185 ?auto_6711187 ) ) ( not ( = ?auto_6711186 ?auto_6711188 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6711179 ?auto_6711180 ?auto_6711183 ?auto_6711182 )
      ( GET-5IMAGE-VERIFY ?auto_6711179 ?auto_6711180 ?auto_6711181 ?auto_6711178 ?auto_6711183 ?auto_6711182 ?auto_6711184 ?auto_6711185 ?auto_6711186 ?auto_6711187 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6713376 - DIRECTION
      ?auto_6713377 - MODE
      ?auto_6713378 - DIRECTION
      ?auto_6713375 - MODE
      ?auto_6713380 - DIRECTION
      ?auto_6713379 - MODE
      ?auto_6713381 - DIRECTION
      ?auto_6713382 - MODE
      ?auto_6713383 - DIRECTION
      ?auto_6713384 - MODE
    )
    :vars
    (
      ?auto_6713386 - INSTRUMENT
      ?auto_6713387 - SATELLITE
      ?auto_6713385 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6713378 ?auto_6713376 ) ) ( not ( = ?auto_6713380 ?auto_6713376 ) ) ( not ( = ?auto_6713380 ?auto_6713378 ) ) ( not ( = ?auto_6713381 ?auto_6713376 ) ) ( not ( = ?auto_6713381 ?auto_6713378 ) ) ( not ( = ?auto_6713381 ?auto_6713380 ) ) ( not ( = ?auto_6713383 ?auto_6713376 ) ) ( not ( = ?auto_6713383 ?auto_6713378 ) ) ( not ( = ?auto_6713383 ?auto_6713380 ) ) ( not ( = ?auto_6713383 ?auto_6713381 ) ) ( CALIBRATED ?auto_6713386 ) ( ON_BOARD ?auto_6713386 ?auto_6713387 ) ( SUPPORTS ?auto_6713386 ?auto_6713375 ) ( POWER_ON ?auto_6713386 ) ( POINTING ?auto_6713387 ?auto_6713385 ) ( not ( = ?auto_6713378 ?auto_6713385 ) ) ( HAVE_IMAGE ?auto_6713376 ?auto_6713377 ) ( not ( = ?auto_6713376 ?auto_6713385 ) ) ( not ( = ?auto_6713377 ?auto_6713375 ) ) ( HAVE_IMAGE ?auto_6713380 ?auto_6713379 ) ( HAVE_IMAGE ?auto_6713381 ?auto_6713382 ) ( HAVE_IMAGE ?auto_6713383 ?auto_6713384 ) ( not ( = ?auto_6713377 ?auto_6713379 ) ) ( not ( = ?auto_6713377 ?auto_6713382 ) ) ( not ( = ?auto_6713377 ?auto_6713384 ) ) ( not ( = ?auto_6713375 ?auto_6713379 ) ) ( not ( = ?auto_6713375 ?auto_6713382 ) ) ( not ( = ?auto_6713375 ?auto_6713384 ) ) ( not ( = ?auto_6713380 ?auto_6713385 ) ) ( not ( = ?auto_6713379 ?auto_6713382 ) ) ( not ( = ?auto_6713379 ?auto_6713384 ) ) ( not ( = ?auto_6713381 ?auto_6713385 ) ) ( not ( = ?auto_6713382 ?auto_6713384 ) ) ( not ( = ?auto_6713383 ?auto_6713385 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6713376 ?auto_6713377 ?auto_6713378 ?auto_6713375 )
      ( GET-5IMAGE-VERIFY ?auto_6713376 ?auto_6713377 ?auto_6713378 ?auto_6713375 ?auto_6713380 ?auto_6713379 ?auto_6713381 ?auto_6713382 ?auto_6713383 ?auto_6713384 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6730211 - DIRECTION
      ?auto_6730212 - MODE
      ?auto_6730213 - DIRECTION
      ?auto_6730210 - MODE
      ?auto_6730215 - DIRECTION
      ?auto_6730214 - MODE
      ?auto_6730216 - DIRECTION
      ?auto_6730217 - MODE
      ?auto_6730218 - DIRECTION
      ?auto_6730219 - MODE
    )
    :vars
    (
      ?auto_6730221 - INSTRUMENT
      ?auto_6730222 - SATELLITE
      ?auto_6730220 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6730213 ?auto_6730211 ) ) ( not ( = ?auto_6730215 ?auto_6730211 ) ) ( not ( = ?auto_6730215 ?auto_6730213 ) ) ( not ( = ?auto_6730216 ?auto_6730211 ) ) ( not ( = ?auto_6730216 ?auto_6730213 ) ) ( not ( = ?auto_6730216 ?auto_6730215 ) ) ( not ( = ?auto_6730218 ?auto_6730211 ) ) ( not ( = ?auto_6730218 ?auto_6730213 ) ) ( not ( = ?auto_6730218 ?auto_6730215 ) ) ( not ( = ?auto_6730218 ?auto_6730216 ) ) ( CALIBRATED ?auto_6730221 ) ( ON_BOARD ?auto_6730221 ?auto_6730222 ) ( SUPPORTS ?auto_6730221 ?auto_6730212 ) ( POWER_ON ?auto_6730221 ) ( POINTING ?auto_6730222 ?auto_6730220 ) ( not ( = ?auto_6730211 ?auto_6730220 ) ) ( HAVE_IMAGE ?auto_6730213 ?auto_6730210 ) ( not ( = ?auto_6730213 ?auto_6730220 ) ) ( not ( = ?auto_6730210 ?auto_6730212 ) ) ( HAVE_IMAGE ?auto_6730215 ?auto_6730214 ) ( HAVE_IMAGE ?auto_6730216 ?auto_6730217 ) ( HAVE_IMAGE ?auto_6730218 ?auto_6730219 ) ( not ( = ?auto_6730212 ?auto_6730214 ) ) ( not ( = ?auto_6730212 ?auto_6730217 ) ) ( not ( = ?auto_6730212 ?auto_6730219 ) ) ( not ( = ?auto_6730210 ?auto_6730214 ) ) ( not ( = ?auto_6730210 ?auto_6730217 ) ) ( not ( = ?auto_6730210 ?auto_6730219 ) ) ( not ( = ?auto_6730215 ?auto_6730220 ) ) ( not ( = ?auto_6730214 ?auto_6730217 ) ) ( not ( = ?auto_6730214 ?auto_6730219 ) ) ( not ( = ?auto_6730216 ?auto_6730220 ) ) ( not ( = ?auto_6730217 ?auto_6730219 ) ) ( not ( = ?auto_6730218 ?auto_6730220 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6730213 ?auto_6730210 ?auto_6730211 ?auto_6730212 )
      ( GET-5IMAGE-VERIFY ?auto_6730211 ?auto_6730212 ?auto_6730213 ?auto_6730210 ?auto_6730215 ?auto_6730214 ?auto_6730216 ?auto_6730217 ?auto_6730218 ?auto_6730219 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6743978 - DIRECTION
      ?auto_6743979 - MODE
      ?auto_6743980 - DIRECTION
      ?auto_6743977 - MODE
      ?auto_6743982 - DIRECTION
      ?auto_6743981 - MODE
      ?auto_6743983 - DIRECTION
      ?auto_6743984 - MODE
      ?auto_6743985 - DIRECTION
      ?auto_6743986 - MODE
    )
    :vars
    (
      ?auto_6743987 - INSTRUMENT
      ?auto_6743988 - SATELLITE
      ?auto_6743989 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6743980 ?auto_6743978 ) ) ( not ( = ?auto_6743982 ?auto_6743978 ) ) ( not ( = ?auto_6743982 ?auto_6743980 ) ) ( not ( = ?auto_6743983 ?auto_6743978 ) ) ( not ( = ?auto_6743983 ?auto_6743980 ) ) ( not ( = ?auto_6743983 ?auto_6743982 ) ) ( not ( = ?auto_6743985 ?auto_6743978 ) ) ( not ( = ?auto_6743985 ?auto_6743980 ) ) ( not ( = ?auto_6743985 ?auto_6743982 ) ) ( not ( = ?auto_6743985 ?auto_6743983 ) ) ( ON_BOARD ?auto_6743987 ?auto_6743988 ) ( SUPPORTS ?auto_6743987 ?auto_6743986 ) ( POWER_ON ?auto_6743987 ) ( POINTING ?auto_6743988 ?auto_6743989 ) ( not ( = ?auto_6743985 ?auto_6743989 ) ) ( HAVE_IMAGE ?auto_6743978 ?auto_6743979 ) ( not ( = ?auto_6743978 ?auto_6743989 ) ) ( not ( = ?auto_6743979 ?auto_6743986 ) ) ( CALIBRATION_TARGET ?auto_6743987 ?auto_6743989 ) ( NOT_CALIBRATED ?auto_6743987 ) ( HAVE_IMAGE ?auto_6743980 ?auto_6743977 ) ( HAVE_IMAGE ?auto_6743982 ?auto_6743981 ) ( HAVE_IMAGE ?auto_6743983 ?auto_6743984 ) ( not ( = ?auto_6743979 ?auto_6743977 ) ) ( not ( = ?auto_6743979 ?auto_6743981 ) ) ( not ( = ?auto_6743979 ?auto_6743984 ) ) ( not ( = ?auto_6743980 ?auto_6743989 ) ) ( not ( = ?auto_6743977 ?auto_6743981 ) ) ( not ( = ?auto_6743977 ?auto_6743984 ) ) ( not ( = ?auto_6743977 ?auto_6743986 ) ) ( not ( = ?auto_6743982 ?auto_6743989 ) ) ( not ( = ?auto_6743981 ?auto_6743984 ) ) ( not ( = ?auto_6743981 ?auto_6743986 ) ) ( not ( = ?auto_6743983 ?auto_6743989 ) ) ( not ( = ?auto_6743984 ?auto_6743986 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6743978 ?auto_6743979 ?auto_6743985 ?auto_6743986 )
      ( GET-5IMAGE-VERIFY ?auto_6743978 ?auto_6743979 ?auto_6743980 ?auto_6743977 ?auto_6743982 ?auto_6743981 ?auto_6743983 ?auto_6743984 ?auto_6743985 ?auto_6743986 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6744030 - DIRECTION
      ?auto_6744031 - MODE
      ?auto_6744032 - DIRECTION
      ?auto_6744029 - MODE
      ?auto_6744034 - DIRECTION
      ?auto_6744033 - MODE
      ?auto_6744035 - DIRECTION
      ?auto_6744036 - MODE
      ?auto_6744037 - DIRECTION
      ?auto_6744038 - MODE
    )
    :vars
    (
      ?auto_6744039 - INSTRUMENT
      ?auto_6744040 - SATELLITE
      ?auto_6744041 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6744032 ?auto_6744030 ) ) ( not ( = ?auto_6744034 ?auto_6744030 ) ) ( not ( = ?auto_6744034 ?auto_6744032 ) ) ( not ( = ?auto_6744035 ?auto_6744030 ) ) ( not ( = ?auto_6744035 ?auto_6744032 ) ) ( not ( = ?auto_6744035 ?auto_6744034 ) ) ( not ( = ?auto_6744037 ?auto_6744030 ) ) ( not ( = ?auto_6744037 ?auto_6744032 ) ) ( not ( = ?auto_6744037 ?auto_6744034 ) ) ( not ( = ?auto_6744037 ?auto_6744035 ) ) ( ON_BOARD ?auto_6744039 ?auto_6744040 ) ( SUPPORTS ?auto_6744039 ?auto_6744036 ) ( POWER_ON ?auto_6744039 ) ( POINTING ?auto_6744040 ?auto_6744041 ) ( not ( = ?auto_6744035 ?auto_6744041 ) ) ( HAVE_IMAGE ?auto_6744030 ?auto_6744031 ) ( not ( = ?auto_6744030 ?auto_6744041 ) ) ( not ( = ?auto_6744031 ?auto_6744036 ) ) ( CALIBRATION_TARGET ?auto_6744039 ?auto_6744041 ) ( NOT_CALIBRATED ?auto_6744039 ) ( HAVE_IMAGE ?auto_6744032 ?auto_6744029 ) ( HAVE_IMAGE ?auto_6744034 ?auto_6744033 ) ( HAVE_IMAGE ?auto_6744037 ?auto_6744038 ) ( not ( = ?auto_6744031 ?auto_6744029 ) ) ( not ( = ?auto_6744031 ?auto_6744033 ) ) ( not ( = ?auto_6744031 ?auto_6744038 ) ) ( not ( = ?auto_6744032 ?auto_6744041 ) ) ( not ( = ?auto_6744029 ?auto_6744033 ) ) ( not ( = ?auto_6744029 ?auto_6744036 ) ) ( not ( = ?auto_6744029 ?auto_6744038 ) ) ( not ( = ?auto_6744034 ?auto_6744041 ) ) ( not ( = ?auto_6744033 ?auto_6744036 ) ) ( not ( = ?auto_6744033 ?auto_6744038 ) ) ( not ( = ?auto_6744036 ?auto_6744038 ) ) ( not ( = ?auto_6744037 ?auto_6744041 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6744030 ?auto_6744031 ?auto_6744035 ?auto_6744036 )
      ( GET-5IMAGE-VERIFY ?auto_6744030 ?auto_6744031 ?auto_6744032 ?auto_6744029 ?auto_6744034 ?auto_6744033 ?auto_6744035 ?auto_6744036 ?auto_6744037 ?auto_6744038 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6744336 - DIRECTION
      ?auto_6744337 - MODE
      ?auto_6744338 - DIRECTION
      ?auto_6744335 - MODE
      ?auto_6744340 - DIRECTION
      ?auto_6744339 - MODE
      ?auto_6744341 - DIRECTION
      ?auto_6744342 - MODE
      ?auto_6744343 - DIRECTION
      ?auto_6744344 - MODE
    )
    :vars
    (
      ?auto_6744345 - INSTRUMENT
      ?auto_6744346 - SATELLITE
      ?auto_6744347 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6744338 ?auto_6744336 ) ) ( not ( = ?auto_6744340 ?auto_6744336 ) ) ( not ( = ?auto_6744340 ?auto_6744338 ) ) ( not ( = ?auto_6744341 ?auto_6744336 ) ) ( not ( = ?auto_6744341 ?auto_6744338 ) ) ( not ( = ?auto_6744341 ?auto_6744340 ) ) ( not ( = ?auto_6744343 ?auto_6744336 ) ) ( not ( = ?auto_6744343 ?auto_6744338 ) ) ( not ( = ?auto_6744343 ?auto_6744340 ) ) ( not ( = ?auto_6744343 ?auto_6744341 ) ) ( ON_BOARD ?auto_6744345 ?auto_6744346 ) ( SUPPORTS ?auto_6744345 ?auto_6744339 ) ( POWER_ON ?auto_6744345 ) ( POINTING ?auto_6744346 ?auto_6744347 ) ( not ( = ?auto_6744340 ?auto_6744347 ) ) ( HAVE_IMAGE ?auto_6744336 ?auto_6744337 ) ( not ( = ?auto_6744336 ?auto_6744347 ) ) ( not ( = ?auto_6744337 ?auto_6744339 ) ) ( CALIBRATION_TARGET ?auto_6744345 ?auto_6744347 ) ( NOT_CALIBRATED ?auto_6744345 ) ( HAVE_IMAGE ?auto_6744338 ?auto_6744335 ) ( HAVE_IMAGE ?auto_6744341 ?auto_6744342 ) ( HAVE_IMAGE ?auto_6744343 ?auto_6744344 ) ( not ( = ?auto_6744337 ?auto_6744335 ) ) ( not ( = ?auto_6744337 ?auto_6744342 ) ) ( not ( = ?auto_6744337 ?auto_6744344 ) ) ( not ( = ?auto_6744338 ?auto_6744347 ) ) ( not ( = ?auto_6744335 ?auto_6744339 ) ) ( not ( = ?auto_6744335 ?auto_6744342 ) ) ( not ( = ?auto_6744335 ?auto_6744344 ) ) ( not ( = ?auto_6744339 ?auto_6744342 ) ) ( not ( = ?auto_6744339 ?auto_6744344 ) ) ( not ( = ?auto_6744341 ?auto_6744347 ) ) ( not ( = ?auto_6744342 ?auto_6744344 ) ) ( not ( = ?auto_6744343 ?auto_6744347 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6744336 ?auto_6744337 ?auto_6744340 ?auto_6744339 )
      ( GET-5IMAGE-VERIFY ?auto_6744336 ?auto_6744337 ?auto_6744338 ?auto_6744335 ?auto_6744340 ?auto_6744339 ?auto_6744341 ?auto_6744342 ?auto_6744343 ?auto_6744344 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6746533 - DIRECTION
      ?auto_6746534 - MODE
      ?auto_6746535 - DIRECTION
      ?auto_6746532 - MODE
      ?auto_6746537 - DIRECTION
      ?auto_6746536 - MODE
      ?auto_6746538 - DIRECTION
      ?auto_6746539 - MODE
      ?auto_6746540 - DIRECTION
      ?auto_6746541 - MODE
    )
    :vars
    (
      ?auto_6746542 - INSTRUMENT
      ?auto_6746543 - SATELLITE
      ?auto_6746544 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6746535 ?auto_6746533 ) ) ( not ( = ?auto_6746537 ?auto_6746533 ) ) ( not ( = ?auto_6746537 ?auto_6746535 ) ) ( not ( = ?auto_6746538 ?auto_6746533 ) ) ( not ( = ?auto_6746538 ?auto_6746535 ) ) ( not ( = ?auto_6746538 ?auto_6746537 ) ) ( not ( = ?auto_6746540 ?auto_6746533 ) ) ( not ( = ?auto_6746540 ?auto_6746535 ) ) ( not ( = ?auto_6746540 ?auto_6746537 ) ) ( not ( = ?auto_6746540 ?auto_6746538 ) ) ( ON_BOARD ?auto_6746542 ?auto_6746543 ) ( SUPPORTS ?auto_6746542 ?auto_6746532 ) ( POWER_ON ?auto_6746542 ) ( POINTING ?auto_6746543 ?auto_6746544 ) ( not ( = ?auto_6746535 ?auto_6746544 ) ) ( HAVE_IMAGE ?auto_6746533 ?auto_6746534 ) ( not ( = ?auto_6746533 ?auto_6746544 ) ) ( not ( = ?auto_6746534 ?auto_6746532 ) ) ( CALIBRATION_TARGET ?auto_6746542 ?auto_6746544 ) ( NOT_CALIBRATED ?auto_6746542 ) ( HAVE_IMAGE ?auto_6746537 ?auto_6746536 ) ( HAVE_IMAGE ?auto_6746538 ?auto_6746539 ) ( HAVE_IMAGE ?auto_6746540 ?auto_6746541 ) ( not ( = ?auto_6746534 ?auto_6746536 ) ) ( not ( = ?auto_6746534 ?auto_6746539 ) ) ( not ( = ?auto_6746534 ?auto_6746541 ) ) ( not ( = ?auto_6746532 ?auto_6746536 ) ) ( not ( = ?auto_6746532 ?auto_6746539 ) ) ( not ( = ?auto_6746532 ?auto_6746541 ) ) ( not ( = ?auto_6746537 ?auto_6746544 ) ) ( not ( = ?auto_6746536 ?auto_6746539 ) ) ( not ( = ?auto_6746536 ?auto_6746541 ) ) ( not ( = ?auto_6746538 ?auto_6746544 ) ) ( not ( = ?auto_6746539 ?auto_6746541 ) ) ( not ( = ?auto_6746540 ?auto_6746544 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6746533 ?auto_6746534 ?auto_6746535 ?auto_6746532 )
      ( GET-5IMAGE-VERIFY ?auto_6746533 ?auto_6746534 ?auto_6746535 ?auto_6746532 ?auto_6746537 ?auto_6746536 ?auto_6746538 ?auto_6746539 ?auto_6746540 ?auto_6746541 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6763368 - DIRECTION
      ?auto_6763369 - MODE
      ?auto_6763370 - DIRECTION
      ?auto_6763367 - MODE
      ?auto_6763372 - DIRECTION
      ?auto_6763371 - MODE
      ?auto_6763373 - DIRECTION
      ?auto_6763374 - MODE
      ?auto_6763375 - DIRECTION
      ?auto_6763376 - MODE
    )
    :vars
    (
      ?auto_6763377 - INSTRUMENT
      ?auto_6763378 - SATELLITE
      ?auto_6763379 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6763370 ?auto_6763368 ) ) ( not ( = ?auto_6763372 ?auto_6763368 ) ) ( not ( = ?auto_6763372 ?auto_6763370 ) ) ( not ( = ?auto_6763373 ?auto_6763368 ) ) ( not ( = ?auto_6763373 ?auto_6763370 ) ) ( not ( = ?auto_6763373 ?auto_6763372 ) ) ( not ( = ?auto_6763375 ?auto_6763368 ) ) ( not ( = ?auto_6763375 ?auto_6763370 ) ) ( not ( = ?auto_6763375 ?auto_6763372 ) ) ( not ( = ?auto_6763375 ?auto_6763373 ) ) ( ON_BOARD ?auto_6763377 ?auto_6763378 ) ( SUPPORTS ?auto_6763377 ?auto_6763369 ) ( POWER_ON ?auto_6763377 ) ( POINTING ?auto_6763378 ?auto_6763379 ) ( not ( = ?auto_6763368 ?auto_6763379 ) ) ( HAVE_IMAGE ?auto_6763370 ?auto_6763367 ) ( not ( = ?auto_6763370 ?auto_6763379 ) ) ( not ( = ?auto_6763367 ?auto_6763369 ) ) ( CALIBRATION_TARGET ?auto_6763377 ?auto_6763379 ) ( NOT_CALIBRATED ?auto_6763377 ) ( HAVE_IMAGE ?auto_6763372 ?auto_6763371 ) ( HAVE_IMAGE ?auto_6763373 ?auto_6763374 ) ( HAVE_IMAGE ?auto_6763375 ?auto_6763376 ) ( not ( = ?auto_6763369 ?auto_6763371 ) ) ( not ( = ?auto_6763369 ?auto_6763374 ) ) ( not ( = ?auto_6763369 ?auto_6763376 ) ) ( not ( = ?auto_6763367 ?auto_6763371 ) ) ( not ( = ?auto_6763367 ?auto_6763374 ) ) ( not ( = ?auto_6763367 ?auto_6763376 ) ) ( not ( = ?auto_6763372 ?auto_6763379 ) ) ( not ( = ?auto_6763371 ?auto_6763374 ) ) ( not ( = ?auto_6763371 ?auto_6763376 ) ) ( not ( = ?auto_6763373 ?auto_6763379 ) ) ( not ( = ?auto_6763374 ?auto_6763376 ) ) ( not ( = ?auto_6763375 ?auto_6763379 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6763370 ?auto_6763367 ?auto_6763368 ?auto_6763369 )
      ( GET-5IMAGE-VERIFY ?auto_6763368 ?auto_6763369 ?auto_6763370 ?auto_6763367 ?auto_6763372 ?auto_6763371 ?auto_6763373 ?auto_6763374 ?auto_6763375 ?auto_6763376 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6777135 - DIRECTION
      ?auto_6777136 - MODE
      ?auto_6777137 - DIRECTION
      ?auto_6777134 - MODE
      ?auto_6777139 - DIRECTION
      ?auto_6777138 - MODE
      ?auto_6777140 - DIRECTION
      ?auto_6777141 - MODE
      ?auto_6777142 - DIRECTION
      ?auto_6777143 - MODE
    )
    :vars
    (
      ?auto_6777144 - INSTRUMENT
      ?auto_6777145 - SATELLITE
      ?auto_6777146 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6777137 ?auto_6777135 ) ) ( not ( = ?auto_6777139 ?auto_6777135 ) ) ( not ( = ?auto_6777139 ?auto_6777137 ) ) ( not ( = ?auto_6777140 ?auto_6777135 ) ) ( not ( = ?auto_6777140 ?auto_6777137 ) ) ( not ( = ?auto_6777140 ?auto_6777139 ) ) ( not ( = ?auto_6777142 ?auto_6777135 ) ) ( not ( = ?auto_6777142 ?auto_6777137 ) ) ( not ( = ?auto_6777142 ?auto_6777139 ) ) ( not ( = ?auto_6777142 ?auto_6777140 ) ) ( ON_BOARD ?auto_6777144 ?auto_6777145 ) ( SUPPORTS ?auto_6777144 ?auto_6777143 ) ( POINTING ?auto_6777145 ?auto_6777146 ) ( not ( = ?auto_6777142 ?auto_6777146 ) ) ( HAVE_IMAGE ?auto_6777135 ?auto_6777136 ) ( not ( = ?auto_6777135 ?auto_6777146 ) ) ( not ( = ?auto_6777136 ?auto_6777143 ) ) ( CALIBRATION_TARGET ?auto_6777144 ?auto_6777146 ) ( POWER_AVAIL ?auto_6777145 ) ( HAVE_IMAGE ?auto_6777137 ?auto_6777134 ) ( HAVE_IMAGE ?auto_6777139 ?auto_6777138 ) ( HAVE_IMAGE ?auto_6777140 ?auto_6777141 ) ( not ( = ?auto_6777136 ?auto_6777134 ) ) ( not ( = ?auto_6777136 ?auto_6777138 ) ) ( not ( = ?auto_6777136 ?auto_6777141 ) ) ( not ( = ?auto_6777137 ?auto_6777146 ) ) ( not ( = ?auto_6777134 ?auto_6777138 ) ) ( not ( = ?auto_6777134 ?auto_6777141 ) ) ( not ( = ?auto_6777134 ?auto_6777143 ) ) ( not ( = ?auto_6777139 ?auto_6777146 ) ) ( not ( = ?auto_6777138 ?auto_6777141 ) ) ( not ( = ?auto_6777138 ?auto_6777143 ) ) ( not ( = ?auto_6777140 ?auto_6777146 ) ) ( not ( = ?auto_6777141 ?auto_6777143 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6777135 ?auto_6777136 ?auto_6777142 ?auto_6777143 )
      ( GET-5IMAGE-VERIFY ?auto_6777135 ?auto_6777136 ?auto_6777137 ?auto_6777134 ?auto_6777139 ?auto_6777138 ?auto_6777140 ?auto_6777141 ?auto_6777142 ?auto_6777143 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6777187 - DIRECTION
      ?auto_6777188 - MODE
      ?auto_6777189 - DIRECTION
      ?auto_6777186 - MODE
      ?auto_6777191 - DIRECTION
      ?auto_6777190 - MODE
      ?auto_6777192 - DIRECTION
      ?auto_6777193 - MODE
      ?auto_6777194 - DIRECTION
      ?auto_6777195 - MODE
    )
    :vars
    (
      ?auto_6777196 - INSTRUMENT
      ?auto_6777197 - SATELLITE
      ?auto_6777198 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6777189 ?auto_6777187 ) ) ( not ( = ?auto_6777191 ?auto_6777187 ) ) ( not ( = ?auto_6777191 ?auto_6777189 ) ) ( not ( = ?auto_6777192 ?auto_6777187 ) ) ( not ( = ?auto_6777192 ?auto_6777189 ) ) ( not ( = ?auto_6777192 ?auto_6777191 ) ) ( not ( = ?auto_6777194 ?auto_6777187 ) ) ( not ( = ?auto_6777194 ?auto_6777189 ) ) ( not ( = ?auto_6777194 ?auto_6777191 ) ) ( not ( = ?auto_6777194 ?auto_6777192 ) ) ( ON_BOARD ?auto_6777196 ?auto_6777197 ) ( SUPPORTS ?auto_6777196 ?auto_6777193 ) ( POINTING ?auto_6777197 ?auto_6777198 ) ( not ( = ?auto_6777192 ?auto_6777198 ) ) ( HAVE_IMAGE ?auto_6777187 ?auto_6777188 ) ( not ( = ?auto_6777187 ?auto_6777198 ) ) ( not ( = ?auto_6777188 ?auto_6777193 ) ) ( CALIBRATION_TARGET ?auto_6777196 ?auto_6777198 ) ( POWER_AVAIL ?auto_6777197 ) ( HAVE_IMAGE ?auto_6777189 ?auto_6777186 ) ( HAVE_IMAGE ?auto_6777191 ?auto_6777190 ) ( HAVE_IMAGE ?auto_6777194 ?auto_6777195 ) ( not ( = ?auto_6777188 ?auto_6777186 ) ) ( not ( = ?auto_6777188 ?auto_6777190 ) ) ( not ( = ?auto_6777188 ?auto_6777195 ) ) ( not ( = ?auto_6777189 ?auto_6777198 ) ) ( not ( = ?auto_6777186 ?auto_6777190 ) ) ( not ( = ?auto_6777186 ?auto_6777193 ) ) ( not ( = ?auto_6777186 ?auto_6777195 ) ) ( not ( = ?auto_6777191 ?auto_6777198 ) ) ( not ( = ?auto_6777190 ?auto_6777193 ) ) ( not ( = ?auto_6777190 ?auto_6777195 ) ) ( not ( = ?auto_6777193 ?auto_6777195 ) ) ( not ( = ?auto_6777194 ?auto_6777198 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6777187 ?auto_6777188 ?auto_6777192 ?auto_6777193 )
      ( GET-5IMAGE-VERIFY ?auto_6777187 ?auto_6777188 ?auto_6777189 ?auto_6777186 ?auto_6777191 ?auto_6777190 ?auto_6777192 ?auto_6777193 ?auto_6777194 ?auto_6777195 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6777493 - DIRECTION
      ?auto_6777494 - MODE
      ?auto_6777495 - DIRECTION
      ?auto_6777492 - MODE
      ?auto_6777497 - DIRECTION
      ?auto_6777496 - MODE
      ?auto_6777498 - DIRECTION
      ?auto_6777499 - MODE
      ?auto_6777500 - DIRECTION
      ?auto_6777501 - MODE
    )
    :vars
    (
      ?auto_6777502 - INSTRUMENT
      ?auto_6777503 - SATELLITE
      ?auto_6777504 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6777495 ?auto_6777493 ) ) ( not ( = ?auto_6777497 ?auto_6777493 ) ) ( not ( = ?auto_6777497 ?auto_6777495 ) ) ( not ( = ?auto_6777498 ?auto_6777493 ) ) ( not ( = ?auto_6777498 ?auto_6777495 ) ) ( not ( = ?auto_6777498 ?auto_6777497 ) ) ( not ( = ?auto_6777500 ?auto_6777493 ) ) ( not ( = ?auto_6777500 ?auto_6777495 ) ) ( not ( = ?auto_6777500 ?auto_6777497 ) ) ( not ( = ?auto_6777500 ?auto_6777498 ) ) ( ON_BOARD ?auto_6777502 ?auto_6777503 ) ( SUPPORTS ?auto_6777502 ?auto_6777496 ) ( POINTING ?auto_6777503 ?auto_6777504 ) ( not ( = ?auto_6777497 ?auto_6777504 ) ) ( HAVE_IMAGE ?auto_6777493 ?auto_6777494 ) ( not ( = ?auto_6777493 ?auto_6777504 ) ) ( not ( = ?auto_6777494 ?auto_6777496 ) ) ( CALIBRATION_TARGET ?auto_6777502 ?auto_6777504 ) ( POWER_AVAIL ?auto_6777503 ) ( HAVE_IMAGE ?auto_6777495 ?auto_6777492 ) ( HAVE_IMAGE ?auto_6777498 ?auto_6777499 ) ( HAVE_IMAGE ?auto_6777500 ?auto_6777501 ) ( not ( = ?auto_6777494 ?auto_6777492 ) ) ( not ( = ?auto_6777494 ?auto_6777499 ) ) ( not ( = ?auto_6777494 ?auto_6777501 ) ) ( not ( = ?auto_6777495 ?auto_6777504 ) ) ( not ( = ?auto_6777492 ?auto_6777496 ) ) ( not ( = ?auto_6777492 ?auto_6777499 ) ) ( not ( = ?auto_6777492 ?auto_6777501 ) ) ( not ( = ?auto_6777496 ?auto_6777499 ) ) ( not ( = ?auto_6777496 ?auto_6777501 ) ) ( not ( = ?auto_6777498 ?auto_6777504 ) ) ( not ( = ?auto_6777499 ?auto_6777501 ) ) ( not ( = ?auto_6777500 ?auto_6777504 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6777493 ?auto_6777494 ?auto_6777497 ?auto_6777496 )
      ( GET-5IMAGE-VERIFY ?auto_6777493 ?auto_6777494 ?auto_6777495 ?auto_6777492 ?auto_6777497 ?auto_6777496 ?auto_6777498 ?auto_6777499 ?auto_6777500 ?auto_6777501 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6779690 - DIRECTION
      ?auto_6779691 - MODE
      ?auto_6779692 - DIRECTION
      ?auto_6779689 - MODE
      ?auto_6779694 - DIRECTION
      ?auto_6779693 - MODE
      ?auto_6779695 - DIRECTION
      ?auto_6779696 - MODE
      ?auto_6779697 - DIRECTION
      ?auto_6779698 - MODE
    )
    :vars
    (
      ?auto_6779699 - INSTRUMENT
      ?auto_6779700 - SATELLITE
      ?auto_6779701 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6779692 ?auto_6779690 ) ) ( not ( = ?auto_6779694 ?auto_6779690 ) ) ( not ( = ?auto_6779694 ?auto_6779692 ) ) ( not ( = ?auto_6779695 ?auto_6779690 ) ) ( not ( = ?auto_6779695 ?auto_6779692 ) ) ( not ( = ?auto_6779695 ?auto_6779694 ) ) ( not ( = ?auto_6779697 ?auto_6779690 ) ) ( not ( = ?auto_6779697 ?auto_6779692 ) ) ( not ( = ?auto_6779697 ?auto_6779694 ) ) ( not ( = ?auto_6779697 ?auto_6779695 ) ) ( ON_BOARD ?auto_6779699 ?auto_6779700 ) ( SUPPORTS ?auto_6779699 ?auto_6779689 ) ( POINTING ?auto_6779700 ?auto_6779701 ) ( not ( = ?auto_6779692 ?auto_6779701 ) ) ( HAVE_IMAGE ?auto_6779690 ?auto_6779691 ) ( not ( = ?auto_6779690 ?auto_6779701 ) ) ( not ( = ?auto_6779691 ?auto_6779689 ) ) ( CALIBRATION_TARGET ?auto_6779699 ?auto_6779701 ) ( POWER_AVAIL ?auto_6779700 ) ( HAVE_IMAGE ?auto_6779694 ?auto_6779693 ) ( HAVE_IMAGE ?auto_6779695 ?auto_6779696 ) ( HAVE_IMAGE ?auto_6779697 ?auto_6779698 ) ( not ( = ?auto_6779691 ?auto_6779693 ) ) ( not ( = ?auto_6779691 ?auto_6779696 ) ) ( not ( = ?auto_6779691 ?auto_6779698 ) ) ( not ( = ?auto_6779689 ?auto_6779693 ) ) ( not ( = ?auto_6779689 ?auto_6779696 ) ) ( not ( = ?auto_6779689 ?auto_6779698 ) ) ( not ( = ?auto_6779694 ?auto_6779701 ) ) ( not ( = ?auto_6779693 ?auto_6779696 ) ) ( not ( = ?auto_6779693 ?auto_6779698 ) ) ( not ( = ?auto_6779695 ?auto_6779701 ) ) ( not ( = ?auto_6779696 ?auto_6779698 ) ) ( not ( = ?auto_6779697 ?auto_6779701 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6779690 ?auto_6779691 ?auto_6779692 ?auto_6779689 )
      ( GET-5IMAGE-VERIFY ?auto_6779690 ?auto_6779691 ?auto_6779692 ?auto_6779689 ?auto_6779694 ?auto_6779693 ?auto_6779695 ?auto_6779696 ?auto_6779697 ?auto_6779698 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6796525 - DIRECTION
      ?auto_6796526 - MODE
      ?auto_6796527 - DIRECTION
      ?auto_6796524 - MODE
      ?auto_6796529 - DIRECTION
      ?auto_6796528 - MODE
      ?auto_6796530 - DIRECTION
      ?auto_6796531 - MODE
      ?auto_6796532 - DIRECTION
      ?auto_6796533 - MODE
    )
    :vars
    (
      ?auto_6796534 - INSTRUMENT
      ?auto_6796535 - SATELLITE
      ?auto_6796536 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6796527 ?auto_6796525 ) ) ( not ( = ?auto_6796529 ?auto_6796525 ) ) ( not ( = ?auto_6796529 ?auto_6796527 ) ) ( not ( = ?auto_6796530 ?auto_6796525 ) ) ( not ( = ?auto_6796530 ?auto_6796527 ) ) ( not ( = ?auto_6796530 ?auto_6796529 ) ) ( not ( = ?auto_6796532 ?auto_6796525 ) ) ( not ( = ?auto_6796532 ?auto_6796527 ) ) ( not ( = ?auto_6796532 ?auto_6796529 ) ) ( not ( = ?auto_6796532 ?auto_6796530 ) ) ( ON_BOARD ?auto_6796534 ?auto_6796535 ) ( SUPPORTS ?auto_6796534 ?auto_6796526 ) ( POINTING ?auto_6796535 ?auto_6796536 ) ( not ( = ?auto_6796525 ?auto_6796536 ) ) ( HAVE_IMAGE ?auto_6796527 ?auto_6796524 ) ( not ( = ?auto_6796527 ?auto_6796536 ) ) ( not ( = ?auto_6796524 ?auto_6796526 ) ) ( CALIBRATION_TARGET ?auto_6796534 ?auto_6796536 ) ( POWER_AVAIL ?auto_6796535 ) ( HAVE_IMAGE ?auto_6796529 ?auto_6796528 ) ( HAVE_IMAGE ?auto_6796530 ?auto_6796531 ) ( HAVE_IMAGE ?auto_6796532 ?auto_6796533 ) ( not ( = ?auto_6796526 ?auto_6796528 ) ) ( not ( = ?auto_6796526 ?auto_6796531 ) ) ( not ( = ?auto_6796526 ?auto_6796533 ) ) ( not ( = ?auto_6796524 ?auto_6796528 ) ) ( not ( = ?auto_6796524 ?auto_6796531 ) ) ( not ( = ?auto_6796524 ?auto_6796533 ) ) ( not ( = ?auto_6796529 ?auto_6796536 ) ) ( not ( = ?auto_6796528 ?auto_6796531 ) ) ( not ( = ?auto_6796528 ?auto_6796533 ) ) ( not ( = ?auto_6796530 ?auto_6796536 ) ) ( not ( = ?auto_6796531 ?auto_6796533 ) ) ( not ( = ?auto_6796532 ?auto_6796536 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6796527 ?auto_6796524 ?auto_6796525 ?auto_6796526 )
      ( GET-5IMAGE-VERIFY ?auto_6796525 ?auto_6796526 ?auto_6796527 ?auto_6796524 ?auto_6796529 ?auto_6796528 ?auto_6796530 ?auto_6796531 ?auto_6796532 ?auto_6796533 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6805325 - DIRECTION
      ?auto_6805326 - MODE
      ?auto_6805327 - DIRECTION
      ?auto_6805324 - MODE
      ?auto_6805329 - DIRECTION
      ?auto_6805328 - MODE
      ?auto_6805330 - DIRECTION
      ?auto_6805331 - MODE
    )
    :vars
    (
      ?auto_6805333 - INSTRUMENT
      ?auto_6805332 - SATELLITE
      ?auto_6805335 - DIRECTION
      ?auto_6805334 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6805327 ?auto_6805325 ) ) ( not ( = ?auto_6805329 ?auto_6805325 ) ) ( not ( = ?auto_6805329 ?auto_6805327 ) ) ( not ( = ?auto_6805330 ?auto_6805325 ) ) ( not ( = ?auto_6805330 ?auto_6805327 ) ) ( not ( = ?auto_6805330 ?auto_6805329 ) ) ( ON_BOARD ?auto_6805333 ?auto_6805332 ) ( SUPPORTS ?auto_6805333 ?auto_6805331 ) ( not ( = ?auto_6805330 ?auto_6805335 ) ) ( HAVE_IMAGE ?auto_6805325 ?auto_6805326 ) ( not ( = ?auto_6805325 ?auto_6805335 ) ) ( not ( = ?auto_6805326 ?auto_6805331 ) ) ( CALIBRATION_TARGET ?auto_6805333 ?auto_6805335 ) ( POWER_AVAIL ?auto_6805332 ) ( POINTING ?auto_6805332 ?auto_6805334 ) ( not ( = ?auto_6805335 ?auto_6805334 ) ) ( not ( = ?auto_6805330 ?auto_6805334 ) ) ( not ( = ?auto_6805325 ?auto_6805334 ) ) ( HAVE_IMAGE ?auto_6805327 ?auto_6805324 ) ( HAVE_IMAGE ?auto_6805329 ?auto_6805328 ) ( not ( = ?auto_6805326 ?auto_6805324 ) ) ( not ( = ?auto_6805326 ?auto_6805328 ) ) ( not ( = ?auto_6805327 ?auto_6805335 ) ) ( not ( = ?auto_6805327 ?auto_6805334 ) ) ( not ( = ?auto_6805324 ?auto_6805328 ) ) ( not ( = ?auto_6805324 ?auto_6805331 ) ) ( not ( = ?auto_6805329 ?auto_6805335 ) ) ( not ( = ?auto_6805329 ?auto_6805334 ) ) ( not ( = ?auto_6805328 ?auto_6805331 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6805325 ?auto_6805326 ?auto_6805330 ?auto_6805331 )
      ( GET-4IMAGE-VERIFY ?auto_6805325 ?auto_6805326 ?auto_6805327 ?auto_6805324 ?auto_6805329 ?auto_6805328 ?auto_6805330 ?auto_6805331 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6805372 - DIRECTION
      ?auto_6805373 - MODE
      ?auto_6805374 - DIRECTION
      ?auto_6805371 - MODE
      ?auto_6805376 - DIRECTION
      ?auto_6805375 - MODE
      ?auto_6805377 - DIRECTION
      ?auto_6805378 - MODE
    )
    :vars
    (
      ?auto_6805380 - INSTRUMENT
      ?auto_6805379 - SATELLITE
      ?auto_6805382 - DIRECTION
      ?auto_6805381 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6805374 ?auto_6805372 ) ) ( not ( = ?auto_6805376 ?auto_6805372 ) ) ( not ( = ?auto_6805376 ?auto_6805374 ) ) ( not ( = ?auto_6805377 ?auto_6805372 ) ) ( not ( = ?auto_6805377 ?auto_6805374 ) ) ( not ( = ?auto_6805377 ?auto_6805376 ) ) ( ON_BOARD ?auto_6805380 ?auto_6805379 ) ( SUPPORTS ?auto_6805380 ?auto_6805375 ) ( not ( = ?auto_6805376 ?auto_6805382 ) ) ( HAVE_IMAGE ?auto_6805372 ?auto_6805373 ) ( not ( = ?auto_6805372 ?auto_6805382 ) ) ( not ( = ?auto_6805373 ?auto_6805375 ) ) ( CALIBRATION_TARGET ?auto_6805380 ?auto_6805382 ) ( POWER_AVAIL ?auto_6805379 ) ( POINTING ?auto_6805379 ?auto_6805381 ) ( not ( = ?auto_6805382 ?auto_6805381 ) ) ( not ( = ?auto_6805376 ?auto_6805381 ) ) ( not ( = ?auto_6805372 ?auto_6805381 ) ) ( HAVE_IMAGE ?auto_6805374 ?auto_6805371 ) ( HAVE_IMAGE ?auto_6805377 ?auto_6805378 ) ( not ( = ?auto_6805373 ?auto_6805371 ) ) ( not ( = ?auto_6805373 ?auto_6805378 ) ) ( not ( = ?auto_6805374 ?auto_6805382 ) ) ( not ( = ?auto_6805374 ?auto_6805381 ) ) ( not ( = ?auto_6805371 ?auto_6805375 ) ) ( not ( = ?auto_6805371 ?auto_6805378 ) ) ( not ( = ?auto_6805375 ?auto_6805378 ) ) ( not ( = ?auto_6805377 ?auto_6805382 ) ) ( not ( = ?auto_6805377 ?auto_6805381 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6805372 ?auto_6805373 ?auto_6805376 ?auto_6805375 )
      ( GET-4IMAGE-VERIFY ?auto_6805372 ?auto_6805373 ?auto_6805374 ?auto_6805371 ?auto_6805376 ?auto_6805375 ?auto_6805377 ?auto_6805378 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6805675 - DIRECTION
      ?auto_6805676 - MODE
      ?auto_6805677 - DIRECTION
      ?auto_6805674 - MODE
      ?auto_6805679 - DIRECTION
      ?auto_6805678 - MODE
      ?auto_6805680 - DIRECTION
      ?auto_6805681 - MODE
    )
    :vars
    (
      ?auto_6805683 - INSTRUMENT
      ?auto_6805682 - SATELLITE
      ?auto_6805685 - DIRECTION
      ?auto_6805684 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6805677 ?auto_6805675 ) ) ( not ( = ?auto_6805679 ?auto_6805675 ) ) ( not ( = ?auto_6805679 ?auto_6805677 ) ) ( not ( = ?auto_6805680 ?auto_6805675 ) ) ( not ( = ?auto_6805680 ?auto_6805677 ) ) ( not ( = ?auto_6805680 ?auto_6805679 ) ) ( ON_BOARD ?auto_6805683 ?auto_6805682 ) ( SUPPORTS ?auto_6805683 ?auto_6805674 ) ( not ( = ?auto_6805677 ?auto_6805685 ) ) ( HAVE_IMAGE ?auto_6805675 ?auto_6805676 ) ( not ( = ?auto_6805675 ?auto_6805685 ) ) ( not ( = ?auto_6805676 ?auto_6805674 ) ) ( CALIBRATION_TARGET ?auto_6805683 ?auto_6805685 ) ( POWER_AVAIL ?auto_6805682 ) ( POINTING ?auto_6805682 ?auto_6805684 ) ( not ( = ?auto_6805685 ?auto_6805684 ) ) ( not ( = ?auto_6805677 ?auto_6805684 ) ) ( not ( = ?auto_6805675 ?auto_6805684 ) ) ( HAVE_IMAGE ?auto_6805679 ?auto_6805678 ) ( HAVE_IMAGE ?auto_6805680 ?auto_6805681 ) ( not ( = ?auto_6805676 ?auto_6805678 ) ) ( not ( = ?auto_6805676 ?auto_6805681 ) ) ( not ( = ?auto_6805674 ?auto_6805678 ) ) ( not ( = ?auto_6805674 ?auto_6805681 ) ) ( not ( = ?auto_6805679 ?auto_6805685 ) ) ( not ( = ?auto_6805679 ?auto_6805684 ) ) ( not ( = ?auto_6805678 ?auto_6805681 ) ) ( not ( = ?auto_6805680 ?auto_6805685 ) ) ( not ( = ?auto_6805680 ?auto_6805684 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6805675 ?auto_6805676 ?auto_6805677 ?auto_6805674 )
      ( GET-4IMAGE-VERIFY ?auto_6805675 ?auto_6805676 ?auto_6805677 ?auto_6805674 ?auto_6805679 ?auto_6805678 ?auto_6805680 ?auto_6805681 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6808064 - DIRECTION
      ?auto_6808065 - MODE
      ?auto_6808066 - DIRECTION
      ?auto_6808063 - MODE
      ?auto_6808068 - DIRECTION
      ?auto_6808067 - MODE
      ?auto_6808069 - DIRECTION
      ?auto_6808070 - MODE
    )
    :vars
    (
      ?auto_6808072 - INSTRUMENT
      ?auto_6808071 - SATELLITE
      ?auto_6808074 - DIRECTION
      ?auto_6808073 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6808066 ?auto_6808064 ) ) ( not ( = ?auto_6808068 ?auto_6808064 ) ) ( not ( = ?auto_6808068 ?auto_6808066 ) ) ( not ( = ?auto_6808069 ?auto_6808064 ) ) ( not ( = ?auto_6808069 ?auto_6808066 ) ) ( not ( = ?auto_6808069 ?auto_6808068 ) ) ( ON_BOARD ?auto_6808072 ?auto_6808071 ) ( SUPPORTS ?auto_6808072 ?auto_6808065 ) ( not ( = ?auto_6808064 ?auto_6808074 ) ) ( HAVE_IMAGE ?auto_6808066 ?auto_6808063 ) ( not ( = ?auto_6808066 ?auto_6808074 ) ) ( not ( = ?auto_6808063 ?auto_6808065 ) ) ( CALIBRATION_TARGET ?auto_6808072 ?auto_6808074 ) ( POWER_AVAIL ?auto_6808071 ) ( POINTING ?auto_6808071 ?auto_6808073 ) ( not ( = ?auto_6808074 ?auto_6808073 ) ) ( not ( = ?auto_6808064 ?auto_6808073 ) ) ( not ( = ?auto_6808066 ?auto_6808073 ) ) ( HAVE_IMAGE ?auto_6808068 ?auto_6808067 ) ( HAVE_IMAGE ?auto_6808069 ?auto_6808070 ) ( not ( = ?auto_6808065 ?auto_6808067 ) ) ( not ( = ?auto_6808065 ?auto_6808070 ) ) ( not ( = ?auto_6808063 ?auto_6808067 ) ) ( not ( = ?auto_6808063 ?auto_6808070 ) ) ( not ( = ?auto_6808068 ?auto_6808074 ) ) ( not ( = ?auto_6808068 ?auto_6808073 ) ) ( not ( = ?auto_6808067 ?auto_6808070 ) ) ( not ( = ?auto_6808069 ?auto_6808074 ) ) ( not ( = ?auto_6808069 ?auto_6808073 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6808066 ?auto_6808063 ?auto_6808064 ?auto_6808065 )
      ( GET-4IMAGE-VERIFY ?auto_6808064 ?auto_6808065 ?auto_6808066 ?auto_6808063 ?auto_6808068 ?auto_6808067 ?auto_6808069 ?auto_6808070 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6810591 - DIRECTION
      ?auto_6810592 - MODE
      ?auto_6810593 - DIRECTION
      ?auto_6810590 - MODE
      ?auto_6810595 - DIRECTION
      ?auto_6810594 - MODE
      ?auto_6810596 - DIRECTION
      ?auto_6810597 - MODE
      ?auto_6810598 - DIRECTION
      ?auto_6810599 - MODE
    )
    :vars
    (
      ?auto_6810601 - INSTRUMENT
      ?auto_6810600 - SATELLITE
      ?auto_6810602 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6810593 ?auto_6810591 ) ) ( not ( = ?auto_6810595 ?auto_6810591 ) ) ( not ( = ?auto_6810595 ?auto_6810593 ) ) ( not ( = ?auto_6810596 ?auto_6810591 ) ) ( not ( = ?auto_6810596 ?auto_6810593 ) ) ( not ( = ?auto_6810596 ?auto_6810595 ) ) ( not ( = ?auto_6810598 ?auto_6810591 ) ) ( not ( = ?auto_6810598 ?auto_6810593 ) ) ( not ( = ?auto_6810598 ?auto_6810595 ) ) ( not ( = ?auto_6810598 ?auto_6810596 ) ) ( ON_BOARD ?auto_6810601 ?auto_6810600 ) ( SUPPORTS ?auto_6810601 ?auto_6810599 ) ( not ( = ?auto_6810598 ?auto_6810602 ) ) ( HAVE_IMAGE ?auto_6810591 ?auto_6810592 ) ( not ( = ?auto_6810591 ?auto_6810602 ) ) ( not ( = ?auto_6810592 ?auto_6810599 ) ) ( CALIBRATION_TARGET ?auto_6810601 ?auto_6810602 ) ( POWER_AVAIL ?auto_6810600 ) ( POINTING ?auto_6810600 ?auto_6810596 ) ( not ( = ?auto_6810602 ?auto_6810596 ) ) ( HAVE_IMAGE ?auto_6810593 ?auto_6810590 ) ( HAVE_IMAGE ?auto_6810595 ?auto_6810594 ) ( HAVE_IMAGE ?auto_6810596 ?auto_6810597 ) ( not ( = ?auto_6810592 ?auto_6810590 ) ) ( not ( = ?auto_6810592 ?auto_6810594 ) ) ( not ( = ?auto_6810592 ?auto_6810597 ) ) ( not ( = ?auto_6810593 ?auto_6810602 ) ) ( not ( = ?auto_6810590 ?auto_6810594 ) ) ( not ( = ?auto_6810590 ?auto_6810597 ) ) ( not ( = ?auto_6810590 ?auto_6810599 ) ) ( not ( = ?auto_6810595 ?auto_6810602 ) ) ( not ( = ?auto_6810594 ?auto_6810597 ) ) ( not ( = ?auto_6810594 ?auto_6810599 ) ) ( not ( = ?auto_6810597 ?auto_6810599 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6810591 ?auto_6810592 ?auto_6810598 ?auto_6810599 )
      ( GET-5IMAGE-VERIFY ?auto_6810591 ?auto_6810592 ?auto_6810593 ?auto_6810590 ?auto_6810595 ?auto_6810594 ?auto_6810596 ?auto_6810597 ?auto_6810598 ?auto_6810599 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6810646 - DIRECTION
      ?auto_6810647 - MODE
      ?auto_6810648 - DIRECTION
      ?auto_6810645 - MODE
      ?auto_6810650 - DIRECTION
      ?auto_6810649 - MODE
      ?auto_6810651 - DIRECTION
      ?auto_6810652 - MODE
      ?auto_6810653 - DIRECTION
      ?auto_6810654 - MODE
    )
    :vars
    (
      ?auto_6810656 - INSTRUMENT
      ?auto_6810655 - SATELLITE
      ?auto_6810657 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6810648 ?auto_6810646 ) ) ( not ( = ?auto_6810650 ?auto_6810646 ) ) ( not ( = ?auto_6810650 ?auto_6810648 ) ) ( not ( = ?auto_6810651 ?auto_6810646 ) ) ( not ( = ?auto_6810651 ?auto_6810648 ) ) ( not ( = ?auto_6810651 ?auto_6810650 ) ) ( not ( = ?auto_6810653 ?auto_6810646 ) ) ( not ( = ?auto_6810653 ?auto_6810648 ) ) ( not ( = ?auto_6810653 ?auto_6810650 ) ) ( not ( = ?auto_6810653 ?auto_6810651 ) ) ( ON_BOARD ?auto_6810656 ?auto_6810655 ) ( SUPPORTS ?auto_6810656 ?auto_6810652 ) ( not ( = ?auto_6810651 ?auto_6810657 ) ) ( HAVE_IMAGE ?auto_6810646 ?auto_6810647 ) ( not ( = ?auto_6810646 ?auto_6810657 ) ) ( not ( = ?auto_6810647 ?auto_6810652 ) ) ( CALIBRATION_TARGET ?auto_6810656 ?auto_6810657 ) ( POWER_AVAIL ?auto_6810655 ) ( POINTING ?auto_6810655 ?auto_6810653 ) ( not ( = ?auto_6810657 ?auto_6810653 ) ) ( HAVE_IMAGE ?auto_6810648 ?auto_6810645 ) ( HAVE_IMAGE ?auto_6810650 ?auto_6810649 ) ( HAVE_IMAGE ?auto_6810653 ?auto_6810654 ) ( not ( = ?auto_6810647 ?auto_6810645 ) ) ( not ( = ?auto_6810647 ?auto_6810649 ) ) ( not ( = ?auto_6810647 ?auto_6810654 ) ) ( not ( = ?auto_6810648 ?auto_6810657 ) ) ( not ( = ?auto_6810645 ?auto_6810649 ) ) ( not ( = ?auto_6810645 ?auto_6810652 ) ) ( not ( = ?auto_6810645 ?auto_6810654 ) ) ( not ( = ?auto_6810650 ?auto_6810657 ) ) ( not ( = ?auto_6810649 ?auto_6810652 ) ) ( not ( = ?auto_6810649 ?auto_6810654 ) ) ( not ( = ?auto_6810652 ?auto_6810654 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6810646 ?auto_6810647 ?auto_6810651 ?auto_6810652 )
      ( GET-5IMAGE-VERIFY ?auto_6810646 ?auto_6810647 ?auto_6810648 ?auto_6810645 ?auto_6810650 ?auto_6810649 ?auto_6810651 ?auto_6810652 ?auto_6810653 ?auto_6810654 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6810699 - DIRECTION
      ?auto_6810700 - MODE
      ?auto_6810701 - DIRECTION
      ?auto_6810698 - MODE
      ?auto_6810703 - DIRECTION
      ?auto_6810702 - MODE
      ?auto_6810704 - DIRECTION
      ?auto_6810705 - MODE
      ?auto_6810706 - DIRECTION
      ?auto_6810707 - MODE
    )
    :vars
    (
      ?auto_6810709 - INSTRUMENT
      ?auto_6810708 - SATELLITE
      ?auto_6810710 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6810701 ?auto_6810699 ) ) ( not ( = ?auto_6810703 ?auto_6810699 ) ) ( not ( = ?auto_6810703 ?auto_6810701 ) ) ( not ( = ?auto_6810704 ?auto_6810699 ) ) ( not ( = ?auto_6810704 ?auto_6810701 ) ) ( not ( = ?auto_6810704 ?auto_6810703 ) ) ( not ( = ?auto_6810706 ?auto_6810699 ) ) ( not ( = ?auto_6810706 ?auto_6810701 ) ) ( not ( = ?auto_6810706 ?auto_6810703 ) ) ( not ( = ?auto_6810706 ?auto_6810704 ) ) ( ON_BOARD ?auto_6810709 ?auto_6810708 ) ( SUPPORTS ?auto_6810709 ?auto_6810707 ) ( not ( = ?auto_6810706 ?auto_6810710 ) ) ( HAVE_IMAGE ?auto_6810699 ?auto_6810700 ) ( not ( = ?auto_6810699 ?auto_6810710 ) ) ( not ( = ?auto_6810700 ?auto_6810707 ) ) ( CALIBRATION_TARGET ?auto_6810709 ?auto_6810710 ) ( POWER_AVAIL ?auto_6810708 ) ( POINTING ?auto_6810708 ?auto_6810703 ) ( not ( = ?auto_6810710 ?auto_6810703 ) ) ( HAVE_IMAGE ?auto_6810701 ?auto_6810698 ) ( HAVE_IMAGE ?auto_6810703 ?auto_6810702 ) ( HAVE_IMAGE ?auto_6810704 ?auto_6810705 ) ( not ( = ?auto_6810700 ?auto_6810698 ) ) ( not ( = ?auto_6810700 ?auto_6810702 ) ) ( not ( = ?auto_6810700 ?auto_6810705 ) ) ( not ( = ?auto_6810701 ?auto_6810710 ) ) ( not ( = ?auto_6810698 ?auto_6810702 ) ) ( not ( = ?auto_6810698 ?auto_6810705 ) ) ( not ( = ?auto_6810698 ?auto_6810707 ) ) ( not ( = ?auto_6810702 ?auto_6810705 ) ) ( not ( = ?auto_6810702 ?auto_6810707 ) ) ( not ( = ?auto_6810704 ?auto_6810710 ) ) ( not ( = ?auto_6810705 ?auto_6810707 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6810699 ?auto_6810700 ?auto_6810706 ?auto_6810707 )
      ( GET-5IMAGE-VERIFY ?auto_6810699 ?auto_6810700 ?auto_6810701 ?auto_6810698 ?auto_6810703 ?auto_6810702 ?auto_6810704 ?auto_6810705 ?auto_6810706 ?auto_6810707 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6810751 - DIRECTION
      ?auto_6810752 - MODE
      ?auto_6810753 - DIRECTION
      ?auto_6810750 - MODE
      ?auto_6810755 - DIRECTION
      ?auto_6810754 - MODE
      ?auto_6810756 - DIRECTION
      ?auto_6810757 - MODE
      ?auto_6810758 - DIRECTION
      ?auto_6810759 - MODE
    )
    :vars
    (
      ?auto_6810761 - INSTRUMENT
      ?auto_6810760 - SATELLITE
      ?auto_6810762 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6810753 ?auto_6810751 ) ) ( not ( = ?auto_6810755 ?auto_6810751 ) ) ( not ( = ?auto_6810755 ?auto_6810753 ) ) ( not ( = ?auto_6810756 ?auto_6810751 ) ) ( not ( = ?auto_6810756 ?auto_6810753 ) ) ( not ( = ?auto_6810756 ?auto_6810755 ) ) ( not ( = ?auto_6810758 ?auto_6810751 ) ) ( not ( = ?auto_6810758 ?auto_6810753 ) ) ( not ( = ?auto_6810758 ?auto_6810755 ) ) ( not ( = ?auto_6810758 ?auto_6810756 ) ) ( ON_BOARD ?auto_6810761 ?auto_6810760 ) ( SUPPORTS ?auto_6810761 ?auto_6810757 ) ( not ( = ?auto_6810756 ?auto_6810762 ) ) ( HAVE_IMAGE ?auto_6810751 ?auto_6810752 ) ( not ( = ?auto_6810751 ?auto_6810762 ) ) ( not ( = ?auto_6810752 ?auto_6810757 ) ) ( CALIBRATION_TARGET ?auto_6810761 ?auto_6810762 ) ( POWER_AVAIL ?auto_6810760 ) ( POINTING ?auto_6810760 ?auto_6810755 ) ( not ( = ?auto_6810762 ?auto_6810755 ) ) ( HAVE_IMAGE ?auto_6810753 ?auto_6810750 ) ( HAVE_IMAGE ?auto_6810755 ?auto_6810754 ) ( HAVE_IMAGE ?auto_6810758 ?auto_6810759 ) ( not ( = ?auto_6810752 ?auto_6810750 ) ) ( not ( = ?auto_6810752 ?auto_6810754 ) ) ( not ( = ?auto_6810752 ?auto_6810759 ) ) ( not ( = ?auto_6810753 ?auto_6810762 ) ) ( not ( = ?auto_6810750 ?auto_6810754 ) ) ( not ( = ?auto_6810750 ?auto_6810757 ) ) ( not ( = ?auto_6810750 ?auto_6810759 ) ) ( not ( = ?auto_6810754 ?auto_6810757 ) ) ( not ( = ?auto_6810754 ?auto_6810759 ) ) ( not ( = ?auto_6810757 ?auto_6810759 ) ) ( not ( = ?auto_6810758 ?auto_6810762 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6810751 ?auto_6810752 ?auto_6810756 ?auto_6810757 )
      ( GET-5IMAGE-VERIFY ?auto_6810751 ?auto_6810752 ?auto_6810753 ?auto_6810750 ?auto_6810755 ?auto_6810754 ?auto_6810756 ?auto_6810757 ?auto_6810758 ?auto_6810759 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6810970 - DIRECTION
      ?auto_6810971 - MODE
      ?auto_6810972 - DIRECTION
      ?auto_6810969 - MODE
      ?auto_6810974 - DIRECTION
      ?auto_6810973 - MODE
      ?auto_6810975 - DIRECTION
      ?auto_6810976 - MODE
      ?auto_6810977 - DIRECTION
      ?auto_6810978 - MODE
    )
    :vars
    (
      ?auto_6810980 - INSTRUMENT
      ?auto_6810979 - SATELLITE
      ?auto_6810981 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6810972 ?auto_6810970 ) ) ( not ( = ?auto_6810974 ?auto_6810970 ) ) ( not ( = ?auto_6810974 ?auto_6810972 ) ) ( not ( = ?auto_6810975 ?auto_6810970 ) ) ( not ( = ?auto_6810975 ?auto_6810972 ) ) ( not ( = ?auto_6810975 ?auto_6810974 ) ) ( not ( = ?auto_6810977 ?auto_6810970 ) ) ( not ( = ?auto_6810977 ?auto_6810972 ) ) ( not ( = ?auto_6810977 ?auto_6810974 ) ) ( not ( = ?auto_6810977 ?auto_6810975 ) ) ( ON_BOARD ?auto_6810980 ?auto_6810979 ) ( SUPPORTS ?auto_6810980 ?auto_6810973 ) ( not ( = ?auto_6810974 ?auto_6810981 ) ) ( HAVE_IMAGE ?auto_6810970 ?auto_6810971 ) ( not ( = ?auto_6810970 ?auto_6810981 ) ) ( not ( = ?auto_6810971 ?auto_6810973 ) ) ( CALIBRATION_TARGET ?auto_6810980 ?auto_6810981 ) ( POWER_AVAIL ?auto_6810979 ) ( POINTING ?auto_6810979 ?auto_6810977 ) ( not ( = ?auto_6810981 ?auto_6810977 ) ) ( HAVE_IMAGE ?auto_6810972 ?auto_6810969 ) ( HAVE_IMAGE ?auto_6810975 ?auto_6810976 ) ( HAVE_IMAGE ?auto_6810977 ?auto_6810978 ) ( not ( = ?auto_6810971 ?auto_6810969 ) ) ( not ( = ?auto_6810971 ?auto_6810976 ) ) ( not ( = ?auto_6810971 ?auto_6810978 ) ) ( not ( = ?auto_6810972 ?auto_6810981 ) ) ( not ( = ?auto_6810969 ?auto_6810973 ) ) ( not ( = ?auto_6810969 ?auto_6810976 ) ) ( not ( = ?auto_6810969 ?auto_6810978 ) ) ( not ( = ?auto_6810973 ?auto_6810976 ) ) ( not ( = ?auto_6810973 ?auto_6810978 ) ) ( not ( = ?auto_6810975 ?auto_6810981 ) ) ( not ( = ?auto_6810976 ?auto_6810978 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6810970 ?auto_6810971 ?auto_6810974 ?auto_6810973 )
      ( GET-5IMAGE-VERIFY ?auto_6810970 ?auto_6810971 ?auto_6810972 ?auto_6810969 ?auto_6810974 ?auto_6810973 ?auto_6810975 ?auto_6810976 ?auto_6810977 ?auto_6810978 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6811023 - DIRECTION
      ?auto_6811024 - MODE
      ?auto_6811025 - DIRECTION
      ?auto_6811022 - MODE
      ?auto_6811027 - DIRECTION
      ?auto_6811026 - MODE
      ?auto_6811028 - DIRECTION
      ?auto_6811029 - MODE
      ?auto_6811030 - DIRECTION
      ?auto_6811031 - MODE
    )
    :vars
    (
      ?auto_6811033 - INSTRUMENT
      ?auto_6811032 - SATELLITE
      ?auto_6811034 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6811025 ?auto_6811023 ) ) ( not ( = ?auto_6811027 ?auto_6811023 ) ) ( not ( = ?auto_6811027 ?auto_6811025 ) ) ( not ( = ?auto_6811028 ?auto_6811023 ) ) ( not ( = ?auto_6811028 ?auto_6811025 ) ) ( not ( = ?auto_6811028 ?auto_6811027 ) ) ( not ( = ?auto_6811030 ?auto_6811023 ) ) ( not ( = ?auto_6811030 ?auto_6811025 ) ) ( not ( = ?auto_6811030 ?auto_6811027 ) ) ( not ( = ?auto_6811030 ?auto_6811028 ) ) ( ON_BOARD ?auto_6811033 ?auto_6811032 ) ( SUPPORTS ?auto_6811033 ?auto_6811026 ) ( not ( = ?auto_6811027 ?auto_6811034 ) ) ( HAVE_IMAGE ?auto_6811023 ?auto_6811024 ) ( not ( = ?auto_6811023 ?auto_6811034 ) ) ( not ( = ?auto_6811024 ?auto_6811026 ) ) ( CALIBRATION_TARGET ?auto_6811033 ?auto_6811034 ) ( POWER_AVAIL ?auto_6811032 ) ( POINTING ?auto_6811032 ?auto_6811028 ) ( not ( = ?auto_6811034 ?auto_6811028 ) ) ( HAVE_IMAGE ?auto_6811025 ?auto_6811022 ) ( HAVE_IMAGE ?auto_6811028 ?auto_6811029 ) ( HAVE_IMAGE ?auto_6811030 ?auto_6811031 ) ( not ( = ?auto_6811024 ?auto_6811022 ) ) ( not ( = ?auto_6811024 ?auto_6811029 ) ) ( not ( = ?auto_6811024 ?auto_6811031 ) ) ( not ( = ?auto_6811025 ?auto_6811034 ) ) ( not ( = ?auto_6811022 ?auto_6811026 ) ) ( not ( = ?auto_6811022 ?auto_6811029 ) ) ( not ( = ?auto_6811022 ?auto_6811031 ) ) ( not ( = ?auto_6811026 ?auto_6811029 ) ) ( not ( = ?auto_6811026 ?auto_6811031 ) ) ( not ( = ?auto_6811029 ?auto_6811031 ) ) ( not ( = ?auto_6811030 ?auto_6811034 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6811023 ?auto_6811024 ?auto_6811027 ?auto_6811026 )
      ( GET-5IMAGE-VERIFY ?auto_6811023 ?auto_6811024 ?auto_6811025 ?auto_6811022 ?auto_6811027 ?auto_6811026 ?auto_6811028 ?auto_6811029 ?auto_6811030 ?auto_6811031 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6812086 - DIRECTION
      ?auto_6812087 - MODE
      ?auto_6812088 - DIRECTION
      ?auto_6812085 - MODE
      ?auto_6812090 - DIRECTION
      ?auto_6812089 - MODE
      ?auto_6812091 - DIRECTION
      ?auto_6812092 - MODE
      ?auto_6812093 - DIRECTION
      ?auto_6812094 - MODE
    )
    :vars
    (
      ?auto_6812096 - INSTRUMENT
      ?auto_6812095 - SATELLITE
      ?auto_6812097 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6812088 ?auto_6812086 ) ) ( not ( = ?auto_6812090 ?auto_6812086 ) ) ( not ( = ?auto_6812090 ?auto_6812088 ) ) ( not ( = ?auto_6812091 ?auto_6812086 ) ) ( not ( = ?auto_6812091 ?auto_6812088 ) ) ( not ( = ?auto_6812091 ?auto_6812090 ) ) ( not ( = ?auto_6812093 ?auto_6812086 ) ) ( not ( = ?auto_6812093 ?auto_6812088 ) ) ( not ( = ?auto_6812093 ?auto_6812090 ) ) ( not ( = ?auto_6812093 ?auto_6812091 ) ) ( ON_BOARD ?auto_6812096 ?auto_6812095 ) ( SUPPORTS ?auto_6812096 ?auto_6812094 ) ( not ( = ?auto_6812093 ?auto_6812097 ) ) ( HAVE_IMAGE ?auto_6812086 ?auto_6812087 ) ( not ( = ?auto_6812086 ?auto_6812097 ) ) ( not ( = ?auto_6812087 ?auto_6812094 ) ) ( CALIBRATION_TARGET ?auto_6812096 ?auto_6812097 ) ( POWER_AVAIL ?auto_6812095 ) ( POINTING ?auto_6812095 ?auto_6812088 ) ( not ( = ?auto_6812097 ?auto_6812088 ) ) ( HAVE_IMAGE ?auto_6812088 ?auto_6812085 ) ( HAVE_IMAGE ?auto_6812090 ?auto_6812089 ) ( HAVE_IMAGE ?auto_6812091 ?auto_6812092 ) ( not ( = ?auto_6812087 ?auto_6812085 ) ) ( not ( = ?auto_6812087 ?auto_6812089 ) ) ( not ( = ?auto_6812087 ?auto_6812092 ) ) ( not ( = ?auto_6812085 ?auto_6812089 ) ) ( not ( = ?auto_6812085 ?auto_6812092 ) ) ( not ( = ?auto_6812085 ?auto_6812094 ) ) ( not ( = ?auto_6812090 ?auto_6812097 ) ) ( not ( = ?auto_6812089 ?auto_6812092 ) ) ( not ( = ?auto_6812089 ?auto_6812094 ) ) ( not ( = ?auto_6812091 ?auto_6812097 ) ) ( not ( = ?auto_6812092 ?auto_6812094 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6812086 ?auto_6812087 ?auto_6812093 ?auto_6812094 )
      ( GET-5IMAGE-VERIFY ?auto_6812086 ?auto_6812087 ?auto_6812088 ?auto_6812085 ?auto_6812090 ?auto_6812089 ?auto_6812091 ?auto_6812092 ?auto_6812093 ?auto_6812094 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6812138 - DIRECTION
      ?auto_6812139 - MODE
      ?auto_6812140 - DIRECTION
      ?auto_6812137 - MODE
      ?auto_6812142 - DIRECTION
      ?auto_6812141 - MODE
      ?auto_6812143 - DIRECTION
      ?auto_6812144 - MODE
      ?auto_6812145 - DIRECTION
      ?auto_6812146 - MODE
    )
    :vars
    (
      ?auto_6812148 - INSTRUMENT
      ?auto_6812147 - SATELLITE
      ?auto_6812149 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6812140 ?auto_6812138 ) ) ( not ( = ?auto_6812142 ?auto_6812138 ) ) ( not ( = ?auto_6812142 ?auto_6812140 ) ) ( not ( = ?auto_6812143 ?auto_6812138 ) ) ( not ( = ?auto_6812143 ?auto_6812140 ) ) ( not ( = ?auto_6812143 ?auto_6812142 ) ) ( not ( = ?auto_6812145 ?auto_6812138 ) ) ( not ( = ?auto_6812145 ?auto_6812140 ) ) ( not ( = ?auto_6812145 ?auto_6812142 ) ) ( not ( = ?auto_6812145 ?auto_6812143 ) ) ( ON_BOARD ?auto_6812148 ?auto_6812147 ) ( SUPPORTS ?auto_6812148 ?auto_6812144 ) ( not ( = ?auto_6812143 ?auto_6812149 ) ) ( HAVE_IMAGE ?auto_6812138 ?auto_6812139 ) ( not ( = ?auto_6812138 ?auto_6812149 ) ) ( not ( = ?auto_6812139 ?auto_6812144 ) ) ( CALIBRATION_TARGET ?auto_6812148 ?auto_6812149 ) ( POWER_AVAIL ?auto_6812147 ) ( POINTING ?auto_6812147 ?auto_6812140 ) ( not ( = ?auto_6812149 ?auto_6812140 ) ) ( HAVE_IMAGE ?auto_6812140 ?auto_6812137 ) ( HAVE_IMAGE ?auto_6812142 ?auto_6812141 ) ( HAVE_IMAGE ?auto_6812145 ?auto_6812146 ) ( not ( = ?auto_6812139 ?auto_6812137 ) ) ( not ( = ?auto_6812139 ?auto_6812141 ) ) ( not ( = ?auto_6812139 ?auto_6812146 ) ) ( not ( = ?auto_6812137 ?auto_6812141 ) ) ( not ( = ?auto_6812137 ?auto_6812144 ) ) ( not ( = ?auto_6812137 ?auto_6812146 ) ) ( not ( = ?auto_6812142 ?auto_6812149 ) ) ( not ( = ?auto_6812141 ?auto_6812144 ) ) ( not ( = ?auto_6812141 ?auto_6812146 ) ) ( not ( = ?auto_6812144 ?auto_6812146 ) ) ( not ( = ?auto_6812145 ?auto_6812149 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6812138 ?auto_6812139 ?auto_6812143 ?auto_6812144 )
      ( GET-5IMAGE-VERIFY ?auto_6812138 ?auto_6812139 ?auto_6812140 ?auto_6812137 ?auto_6812142 ?auto_6812141 ?auto_6812143 ?auto_6812144 ?auto_6812145 ?auto_6812146 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6812496 - DIRECTION
      ?auto_6812497 - MODE
      ?auto_6812498 - DIRECTION
      ?auto_6812495 - MODE
      ?auto_6812500 - DIRECTION
      ?auto_6812499 - MODE
      ?auto_6812501 - DIRECTION
      ?auto_6812502 - MODE
      ?auto_6812503 - DIRECTION
      ?auto_6812504 - MODE
    )
    :vars
    (
      ?auto_6812506 - INSTRUMENT
      ?auto_6812505 - SATELLITE
      ?auto_6812507 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6812498 ?auto_6812496 ) ) ( not ( = ?auto_6812500 ?auto_6812496 ) ) ( not ( = ?auto_6812500 ?auto_6812498 ) ) ( not ( = ?auto_6812501 ?auto_6812496 ) ) ( not ( = ?auto_6812501 ?auto_6812498 ) ) ( not ( = ?auto_6812501 ?auto_6812500 ) ) ( not ( = ?auto_6812503 ?auto_6812496 ) ) ( not ( = ?auto_6812503 ?auto_6812498 ) ) ( not ( = ?auto_6812503 ?auto_6812500 ) ) ( not ( = ?auto_6812503 ?auto_6812501 ) ) ( ON_BOARD ?auto_6812506 ?auto_6812505 ) ( SUPPORTS ?auto_6812506 ?auto_6812499 ) ( not ( = ?auto_6812500 ?auto_6812507 ) ) ( HAVE_IMAGE ?auto_6812496 ?auto_6812497 ) ( not ( = ?auto_6812496 ?auto_6812507 ) ) ( not ( = ?auto_6812497 ?auto_6812499 ) ) ( CALIBRATION_TARGET ?auto_6812506 ?auto_6812507 ) ( POWER_AVAIL ?auto_6812505 ) ( POINTING ?auto_6812505 ?auto_6812498 ) ( not ( = ?auto_6812507 ?auto_6812498 ) ) ( HAVE_IMAGE ?auto_6812498 ?auto_6812495 ) ( HAVE_IMAGE ?auto_6812501 ?auto_6812502 ) ( HAVE_IMAGE ?auto_6812503 ?auto_6812504 ) ( not ( = ?auto_6812497 ?auto_6812495 ) ) ( not ( = ?auto_6812497 ?auto_6812502 ) ) ( not ( = ?auto_6812497 ?auto_6812504 ) ) ( not ( = ?auto_6812495 ?auto_6812499 ) ) ( not ( = ?auto_6812495 ?auto_6812502 ) ) ( not ( = ?auto_6812495 ?auto_6812504 ) ) ( not ( = ?auto_6812499 ?auto_6812502 ) ) ( not ( = ?auto_6812499 ?auto_6812504 ) ) ( not ( = ?auto_6812501 ?auto_6812507 ) ) ( not ( = ?auto_6812502 ?auto_6812504 ) ) ( not ( = ?auto_6812503 ?auto_6812507 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6812496 ?auto_6812497 ?auto_6812500 ?auto_6812499 )
      ( GET-5IMAGE-VERIFY ?auto_6812496 ?auto_6812497 ?auto_6812498 ?auto_6812495 ?auto_6812500 ?auto_6812499 ?auto_6812501 ?auto_6812502 ?auto_6812503 ?auto_6812504 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6813248 - DIRECTION
      ?auto_6813249 - MODE
      ?auto_6813250 - DIRECTION
      ?auto_6813247 - MODE
      ?auto_6813252 - DIRECTION
      ?auto_6813251 - MODE
      ?auto_6813253 - DIRECTION
      ?auto_6813254 - MODE
      ?auto_6813255 - DIRECTION
      ?auto_6813256 - MODE
    )
    :vars
    (
      ?auto_6813258 - INSTRUMENT
      ?auto_6813257 - SATELLITE
      ?auto_6813259 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6813250 ?auto_6813248 ) ) ( not ( = ?auto_6813252 ?auto_6813248 ) ) ( not ( = ?auto_6813252 ?auto_6813250 ) ) ( not ( = ?auto_6813253 ?auto_6813248 ) ) ( not ( = ?auto_6813253 ?auto_6813250 ) ) ( not ( = ?auto_6813253 ?auto_6813252 ) ) ( not ( = ?auto_6813255 ?auto_6813248 ) ) ( not ( = ?auto_6813255 ?auto_6813250 ) ) ( not ( = ?auto_6813255 ?auto_6813252 ) ) ( not ( = ?auto_6813255 ?auto_6813253 ) ) ( ON_BOARD ?auto_6813258 ?auto_6813257 ) ( SUPPORTS ?auto_6813258 ?auto_6813247 ) ( not ( = ?auto_6813250 ?auto_6813259 ) ) ( HAVE_IMAGE ?auto_6813248 ?auto_6813249 ) ( not ( = ?auto_6813248 ?auto_6813259 ) ) ( not ( = ?auto_6813249 ?auto_6813247 ) ) ( CALIBRATION_TARGET ?auto_6813258 ?auto_6813259 ) ( POWER_AVAIL ?auto_6813257 ) ( POINTING ?auto_6813257 ?auto_6813255 ) ( not ( = ?auto_6813259 ?auto_6813255 ) ) ( HAVE_IMAGE ?auto_6813252 ?auto_6813251 ) ( HAVE_IMAGE ?auto_6813253 ?auto_6813254 ) ( HAVE_IMAGE ?auto_6813255 ?auto_6813256 ) ( not ( = ?auto_6813249 ?auto_6813251 ) ) ( not ( = ?auto_6813249 ?auto_6813254 ) ) ( not ( = ?auto_6813249 ?auto_6813256 ) ) ( not ( = ?auto_6813247 ?auto_6813251 ) ) ( not ( = ?auto_6813247 ?auto_6813254 ) ) ( not ( = ?auto_6813247 ?auto_6813256 ) ) ( not ( = ?auto_6813252 ?auto_6813259 ) ) ( not ( = ?auto_6813251 ?auto_6813254 ) ) ( not ( = ?auto_6813251 ?auto_6813256 ) ) ( not ( = ?auto_6813253 ?auto_6813259 ) ) ( not ( = ?auto_6813254 ?auto_6813256 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6813248 ?auto_6813249 ?auto_6813250 ?auto_6813247 )
      ( GET-5IMAGE-VERIFY ?auto_6813248 ?auto_6813249 ?auto_6813250 ?auto_6813247 ?auto_6813252 ?auto_6813251 ?auto_6813253 ?auto_6813254 ?auto_6813255 ?auto_6813256 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6813301 - DIRECTION
      ?auto_6813302 - MODE
      ?auto_6813303 - DIRECTION
      ?auto_6813300 - MODE
      ?auto_6813305 - DIRECTION
      ?auto_6813304 - MODE
      ?auto_6813306 - DIRECTION
      ?auto_6813307 - MODE
      ?auto_6813308 - DIRECTION
      ?auto_6813309 - MODE
    )
    :vars
    (
      ?auto_6813311 - INSTRUMENT
      ?auto_6813310 - SATELLITE
      ?auto_6813312 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6813303 ?auto_6813301 ) ) ( not ( = ?auto_6813305 ?auto_6813301 ) ) ( not ( = ?auto_6813305 ?auto_6813303 ) ) ( not ( = ?auto_6813306 ?auto_6813301 ) ) ( not ( = ?auto_6813306 ?auto_6813303 ) ) ( not ( = ?auto_6813306 ?auto_6813305 ) ) ( not ( = ?auto_6813308 ?auto_6813301 ) ) ( not ( = ?auto_6813308 ?auto_6813303 ) ) ( not ( = ?auto_6813308 ?auto_6813305 ) ) ( not ( = ?auto_6813308 ?auto_6813306 ) ) ( ON_BOARD ?auto_6813311 ?auto_6813310 ) ( SUPPORTS ?auto_6813311 ?auto_6813300 ) ( not ( = ?auto_6813303 ?auto_6813312 ) ) ( HAVE_IMAGE ?auto_6813301 ?auto_6813302 ) ( not ( = ?auto_6813301 ?auto_6813312 ) ) ( not ( = ?auto_6813302 ?auto_6813300 ) ) ( CALIBRATION_TARGET ?auto_6813311 ?auto_6813312 ) ( POWER_AVAIL ?auto_6813310 ) ( POINTING ?auto_6813310 ?auto_6813306 ) ( not ( = ?auto_6813312 ?auto_6813306 ) ) ( HAVE_IMAGE ?auto_6813305 ?auto_6813304 ) ( HAVE_IMAGE ?auto_6813306 ?auto_6813307 ) ( HAVE_IMAGE ?auto_6813308 ?auto_6813309 ) ( not ( = ?auto_6813302 ?auto_6813304 ) ) ( not ( = ?auto_6813302 ?auto_6813307 ) ) ( not ( = ?auto_6813302 ?auto_6813309 ) ) ( not ( = ?auto_6813300 ?auto_6813304 ) ) ( not ( = ?auto_6813300 ?auto_6813307 ) ) ( not ( = ?auto_6813300 ?auto_6813309 ) ) ( not ( = ?auto_6813305 ?auto_6813312 ) ) ( not ( = ?auto_6813304 ?auto_6813307 ) ) ( not ( = ?auto_6813304 ?auto_6813309 ) ) ( not ( = ?auto_6813307 ?auto_6813309 ) ) ( not ( = ?auto_6813308 ?auto_6813312 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6813301 ?auto_6813302 ?auto_6813303 ?auto_6813300 )
      ( GET-5IMAGE-VERIFY ?auto_6813301 ?auto_6813302 ?auto_6813303 ?auto_6813300 ?auto_6813305 ?auto_6813304 ?auto_6813306 ?auto_6813307 ?auto_6813308 ?auto_6813309 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6813835 - DIRECTION
      ?auto_6813836 - MODE
      ?auto_6813837 - DIRECTION
      ?auto_6813834 - MODE
      ?auto_6813839 - DIRECTION
      ?auto_6813838 - MODE
      ?auto_6813840 - DIRECTION
      ?auto_6813841 - MODE
      ?auto_6813842 - DIRECTION
      ?auto_6813843 - MODE
    )
    :vars
    (
      ?auto_6813845 - INSTRUMENT
      ?auto_6813844 - SATELLITE
      ?auto_6813846 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6813837 ?auto_6813835 ) ) ( not ( = ?auto_6813839 ?auto_6813835 ) ) ( not ( = ?auto_6813839 ?auto_6813837 ) ) ( not ( = ?auto_6813840 ?auto_6813835 ) ) ( not ( = ?auto_6813840 ?auto_6813837 ) ) ( not ( = ?auto_6813840 ?auto_6813839 ) ) ( not ( = ?auto_6813842 ?auto_6813835 ) ) ( not ( = ?auto_6813842 ?auto_6813837 ) ) ( not ( = ?auto_6813842 ?auto_6813839 ) ) ( not ( = ?auto_6813842 ?auto_6813840 ) ) ( ON_BOARD ?auto_6813845 ?auto_6813844 ) ( SUPPORTS ?auto_6813845 ?auto_6813834 ) ( not ( = ?auto_6813837 ?auto_6813846 ) ) ( HAVE_IMAGE ?auto_6813835 ?auto_6813836 ) ( not ( = ?auto_6813835 ?auto_6813846 ) ) ( not ( = ?auto_6813836 ?auto_6813834 ) ) ( CALIBRATION_TARGET ?auto_6813845 ?auto_6813846 ) ( POWER_AVAIL ?auto_6813844 ) ( POINTING ?auto_6813844 ?auto_6813839 ) ( not ( = ?auto_6813846 ?auto_6813839 ) ) ( HAVE_IMAGE ?auto_6813839 ?auto_6813838 ) ( HAVE_IMAGE ?auto_6813840 ?auto_6813841 ) ( HAVE_IMAGE ?auto_6813842 ?auto_6813843 ) ( not ( = ?auto_6813836 ?auto_6813838 ) ) ( not ( = ?auto_6813836 ?auto_6813841 ) ) ( not ( = ?auto_6813836 ?auto_6813843 ) ) ( not ( = ?auto_6813834 ?auto_6813838 ) ) ( not ( = ?auto_6813834 ?auto_6813841 ) ) ( not ( = ?auto_6813834 ?auto_6813843 ) ) ( not ( = ?auto_6813838 ?auto_6813841 ) ) ( not ( = ?auto_6813838 ?auto_6813843 ) ) ( not ( = ?auto_6813840 ?auto_6813846 ) ) ( not ( = ?auto_6813841 ?auto_6813843 ) ) ( not ( = ?auto_6813842 ?auto_6813846 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6813835 ?auto_6813836 ?auto_6813837 ?auto_6813834 )
      ( GET-5IMAGE-VERIFY ?auto_6813835 ?auto_6813836 ?auto_6813837 ?auto_6813834 ?auto_6813839 ?auto_6813838 ?auto_6813840 ?auto_6813841 ?auto_6813842 ?auto_6813843 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6825050 - DIRECTION
      ?auto_6825051 - MODE
      ?auto_6825052 - DIRECTION
      ?auto_6825049 - MODE
      ?auto_6825054 - DIRECTION
      ?auto_6825053 - MODE
      ?auto_6825055 - DIRECTION
      ?auto_6825056 - MODE
      ?auto_6825057 - DIRECTION
      ?auto_6825058 - MODE
    )
    :vars
    (
      ?auto_6825060 - INSTRUMENT
      ?auto_6825059 - SATELLITE
      ?auto_6825061 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6825052 ?auto_6825050 ) ) ( not ( = ?auto_6825054 ?auto_6825050 ) ) ( not ( = ?auto_6825054 ?auto_6825052 ) ) ( not ( = ?auto_6825055 ?auto_6825050 ) ) ( not ( = ?auto_6825055 ?auto_6825052 ) ) ( not ( = ?auto_6825055 ?auto_6825054 ) ) ( not ( = ?auto_6825057 ?auto_6825050 ) ) ( not ( = ?auto_6825057 ?auto_6825052 ) ) ( not ( = ?auto_6825057 ?auto_6825054 ) ) ( not ( = ?auto_6825057 ?auto_6825055 ) ) ( ON_BOARD ?auto_6825060 ?auto_6825059 ) ( SUPPORTS ?auto_6825060 ?auto_6825058 ) ( not ( = ?auto_6825057 ?auto_6825061 ) ) ( HAVE_IMAGE ?auto_6825052 ?auto_6825049 ) ( not ( = ?auto_6825052 ?auto_6825061 ) ) ( not ( = ?auto_6825049 ?auto_6825058 ) ) ( CALIBRATION_TARGET ?auto_6825060 ?auto_6825061 ) ( POWER_AVAIL ?auto_6825059 ) ( POINTING ?auto_6825059 ?auto_6825050 ) ( not ( = ?auto_6825061 ?auto_6825050 ) ) ( HAVE_IMAGE ?auto_6825050 ?auto_6825051 ) ( HAVE_IMAGE ?auto_6825054 ?auto_6825053 ) ( HAVE_IMAGE ?auto_6825055 ?auto_6825056 ) ( not ( = ?auto_6825051 ?auto_6825049 ) ) ( not ( = ?auto_6825051 ?auto_6825053 ) ) ( not ( = ?auto_6825051 ?auto_6825056 ) ) ( not ( = ?auto_6825051 ?auto_6825058 ) ) ( not ( = ?auto_6825049 ?auto_6825053 ) ) ( not ( = ?auto_6825049 ?auto_6825056 ) ) ( not ( = ?auto_6825054 ?auto_6825061 ) ) ( not ( = ?auto_6825053 ?auto_6825056 ) ) ( not ( = ?auto_6825053 ?auto_6825058 ) ) ( not ( = ?auto_6825055 ?auto_6825061 ) ) ( not ( = ?auto_6825056 ?auto_6825058 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6825052 ?auto_6825049 ?auto_6825057 ?auto_6825058 )
      ( GET-5IMAGE-VERIFY ?auto_6825050 ?auto_6825051 ?auto_6825052 ?auto_6825049 ?auto_6825054 ?auto_6825053 ?auto_6825055 ?auto_6825056 ?auto_6825057 ?auto_6825058 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6825102 - DIRECTION
      ?auto_6825103 - MODE
      ?auto_6825104 - DIRECTION
      ?auto_6825101 - MODE
      ?auto_6825106 - DIRECTION
      ?auto_6825105 - MODE
      ?auto_6825107 - DIRECTION
      ?auto_6825108 - MODE
      ?auto_6825109 - DIRECTION
      ?auto_6825110 - MODE
    )
    :vars
    (
      ?auto_6825112 - INSTRUMENT
      ?auto_6825111 - SATELLITE
      ?auto_6825113 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6825104 ?auto_6825102 ) ) ( not ( = ?auto_6825106 ?auto_6825102 ) ) ( not ( = ?auto_6825106 ?auto_6825104 ) ) ( not ( = ?auto_6825107 ?auto_6825102 ) ) ( not ( = ?auto_6825107 ?auto_6825104 ) ) ( not ( = ?auto_6825107 ?auto_6825106 ) ) ( not ( = ?auto_6825109 ?auto_6825102 ) ) ( not ( = ?auto_6825109 ?auto_6825104 ) ) ( not ( = ?auto_6825109 ?auto_6825106 ) ) ( not ( = ?auto_6825109 ?auto_6825107 ) ) ( ON_BOARD ?auto_6825112 ?auto_6825111 ) ( SUPPORTS ?auto_6825112 ?auto_6825108 ) ( not ( = ?auto_6825107 ?auto_6825113 ) ) ( HAVE_IMAGE ?auto_6825104 ?auto_6825101 ) ( not ( = ?auto_6825104 ?auto_6825113 ) ) ( not ( = ?auto_6825101 ?auto_6825108 ) ) ( CALIBRATION_TARGET ?auto_6825112 ?auto_6825113 ) ( POWER_AVAIL ?auto_6825111 ) ( POINTING ?auto_6825111 ?auto_6825102 ) ( not ( = ?auto_6825113 ?auto_6825102 ) ) ( HAVE_IMAGE ?auto_6825102 ?auto_6825103 ) ( HAVE_IMAGE ?auto_6825106 ?auto_6825105 ) ( HAVE_IMAGE ?auto_6825109 ?auto_6825110 ) ( not ( = ?auto_6825103 ?auto_6825101 ) ) ( not ( = ?auto_6825103 ?auto_6825105 ) ) ( not ( = ?auto_6825103 ?auto_6825108 ) ) ( not ( = ?auto_6825103 ?auto_6825110 ) ) ( not ( = ?auto_6825101 ?auto_6825105 ) ) ( not ( = ?auto_6825101 ?auto_6825110 ) ) ( not ( = ?auto_6825106 ?auto_6825113 ) ) ( not ( = ?auto_6825105 ?auto_6825108 ) ) ( not ( = ?auto_6825105 ?auto_6825110 ) ) ( not ( = ?auto_6825108 ?auto_6825110 ) ) ( not ( = ?auto_6825109 ?auto_6825113 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6825104 ?auto_6825101 ?auto_6825107 ?auto_6825108 )
      ( GET-5IMAGE-VERIFY ?auto_6825102 ?auto_6825103 ?auto_6825104 ?auto_6825101 ?auto_6825106 ?auto_6825105 ?auto_6825107 ?auto_6825108 ?auto_6825109 ?auto_6825110 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6825460 - DIRECTION
      ?auto_6825461 - MODE
      ?auto_6825462 - DIRECTION
      ?auto_6825459 - MODE
      ?auto_6825464 - DIRECTION
      ?auto_6825463 - MODE
      ?auto_6825465 - DIRECTION
      ?auto_6825466 - MODE
      ?auto_6825467 - DIRECTION
      ?auto_6825468 - MODE
    )
    :vars
    (
      ?auto_6825470 - INSTRUMENT
      ?auto_6825469 - SATELLITE
      ?auto_6825471 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6825462 ?auto_6825460 ) ) ( not ( = ?auto_6825464 ?auto_6825460 ) ) ( not ( = ?auto_6825464 ?auto_6825462 ) ) ( not ( = ?auto_6825465 ?auto_6825460 ) ) ( not ( = ?auto_6825465 ?auto_6825462 ) ) ( not ( = ?auto_6825465 ?auto_6825464 ) ) ( not ( = ?auto_6825467 ?auto_6825460 ) ) ( not ( = ?auto_6825467 ?auto_6825462 ) ) ( not ( = ?auto_6825467 ?auto_6825464 ) ) ( not ( = ?auto_6825467 ?auto_6825465 ) ) ( ON_BOARD ?auto_6825470 ?auto_6825469 ) ( SUPPORTS ?auto_6825470 ?auto_6825463 ) ( not ( = ?auto_6825464 ?auto_6825471 ) ) ( HAVE_IMAGE ?auto_6825462 ?auto_6825459 ) ( not ( = ?auto_6825462 ?auto_6825471 ) ) ( not ( = ?auto_6825459 ?auto_6825463 ) ) ( CALIBRATION_TARGET ?auto_6825470 ?auto_6825471 ) ( POWER_AVAIL ?auto_6825469 ) ( POINTING ?auto_6825469 ?auto_6825460 ) ( not ( = ?auto_6825471 ?auto_6825460 ) ) ( HAVE_IMAGE ?auto_6825460 ?auto_6825461 ) ( HAVE_IMAGE ?auto_6825465 ?auto_6825466 ) ( HAVE_IMAGE ?auto_6825467 ?auto_6825468 ) ( not ( = ?auto_6825461 ?auto_6825459 ) ) ( not ( = ?auto_6825461 ?auto_6825463 ) ) ( not ( = ?auto_6825461 ?auto_6825466 ) ) ( not ( = ?auto_6825461 ?auto_6825468 ) ) ( not ( = ?auto_6825459 ?auto_6825466 ) ) ( not ( = ?auto_6825459 ?auto_6825468 ) ) ( not ( = ?auto_6825463 ?auto_6825466 ) ) ( not ( = ?auto_6825463 ?auto_6825468 ) ) ( not ( = ?auto_6825465 ?auto_6825471 ) ) ( not ( = ?auto_6825466 ?auto_6825468 ) ) ( not ( = ?auto_6825467 ?auto_6825471 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6825462 ?auto_6825459 ?auto_6825464 ?auto_6825463 )
      ( GET-5IMAGE-VERIFY ?auto_6825460 ?auto_6825461 ?auto_6825462 ?auto_6825459 ?auto_6825464 ?auto_6825463 ?auto_6825465 ?auto_6825466 ?auto_6825467 ?auto_6825468 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6828347 - DIRECTION
      ?auto_6828348 - MODE
      ?auto_6828349 - DIRECTION
      ?auto_6828346 - MODE
      ?auto_6828351 - DIRECTION
      ?auto_6828350 - MODE
      ?auto_6828352 - DIRECTION
      ?auto_6828353 - MODE
      ?auto_6828354 - DIRECTION
      ?auto_6828355 - MODE
    )
    :vars
    (
      ?auto_6828357 - INSTRUMENT
      ?auto_6828356 - SATELLITE
      ?auto_6828358 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6828349 ?auto_6828347 ) ) ( not ( = ?auto_6828351 ?auto_6828347 ) ) ( not ( = ?auto_6828351 ?auto_6828349 ) ) ( not ( = ?auto_6828352 ?auto_6828347 ) ) ( not ( = ?auto_6828352 ?auto_6828349 ) ) ( not ( = ?auto_6828352 ?auto_6828351 ) ) ( not ( = ?auto_6828354 ?auto_6828347 ) ) ( not ( = ?auto_6828354 ?auto_6828349 ) ) ( not ( = ?auto_6828354 ?auto_6828351 ) ) ( not ( = ?auto_6828354 ?auto_6828352 ) ) ( ON_BOARD ?auto_6828357 ?auto_6828356 ) ( SUPPORTS ?auto_6828357 ?auto_6828346 ) ( not ( = ?auto_6828349 ?auto_6828358 ) ) ( HAVE_IMAGE ?auto_6828351 ?auto_6828350 ) ( not ( = ?auto_6828351 ?auto_6828358 ) ) ( not ( = ?auto_6828350 ?auto_6828346 ) ) ( CALIBRATION_TARGET ?auto_6828357 ?auto_6828358 ) ( POWER_AVAIL ?auto_6828356 ) ( POINTING ?auto_6828356 ?auto_6828347 ) ( not ( = ?auto_6828358 ?auto_6828347 ) ) ( HAVE_IMAGE ?auto_6828347 ?auto_6828348 ) ( HAVE_IMAGE ?auto_6828352 ?auto_6828353 ) ( HAVE_IMAGE ?auto_6828354 ?auto_6828355 ) ( not ( = ?auto_6828348 ?auto_6828346 ) ) ( not ( = ?auto_6828348 ?auto_6828350 ) ) ( not ( = ?auto_6828348 ?auto_6828353 ) ) ( not ( = ?auto_6828348 ?auto_6828355 ) ) ( not ( = ?auto_6828346 ?auto_6828353 ) ) ( not ( = ?auto_6828346 ?auto_6828355 ) ) ( not ( = ?auto_6828350 ?auto_6828353 ) ) ( not ( = ?auto_6828350 ?auto_6828355 ) ) ( not ( = ?auto_6828352 ?auto_6828358 ) ) ( not ( = ?auto_6828353 ?auto_6828355 ) ) ( not ( = ?auto_6828354 ?auto_6828358 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6828351 ?auto_6828350 ?auto_6828349 ?auto_6828346 )
      ( GET-5IMAGE-VERIFY ?auto_6828347 ?auto_6828348 ?auto_6828349 ?auto_6828346 ?auto_6828351 ?auto_6828350 ?auto_6828352 ?auto_6828353 ?auto_6828354 ?auto_6828355 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6830515 - DIRECTION
      ?auto_6830516 - MODE
      ?auto_6830517 - DIRECTION
      ?auto_6830514 - MODE
      ?auto_6830519 - DIRECTION
      ?auto_6830518 - MODE
      ?auto_6830520 - DIRECTION
      ?auto_6830521 - MODE
      ?auto_6830522 - DIRECTION
      ?auto_6830523 - MODE
    )
    :vars
    (
      ?auto_6830525 - INSTRUMENT
      ?auto_6830524 - SATELLITE
      ?auto_6830526 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6830517 ?auto_6830515 ) ) ( not ( = ?auto_6830519 ?auto_6830515 ) ) ( not ( = ?auto_6830519 ?auto_6830517 ) ) ( not ( = ?auto_6830520 ?auto_6830515 ) ) ( not ( = ?auto_6830520 ?auto_6830517 ) ) ( not ( = ?auto_6830520 ?auto_6830519 ) ) ( not ( = ?auto_6830522 ?auto_6830515 ) ) ( not ( = ?auto_6830522 ?auto_6830517 ) ) ( not ( = ?auto_6830522 ?auto_6830519 ) ) ( not ( = ?auto_6830522 ?auto_6830520 ) ) ( ON_BOARD ?auto_6830525 ?auto_6830524 ) ( SUPPORTS ?auto_6830525 ?auto_6830516 ) ( not ( = ?auto_6830515 ?auto_6830526 ) ) ( HAVE_IMAGE ?auto_6830517 ?auto_6830514 ) ( not ( = ?auto_6830517 ?auto_6830526 ) ) ( not ( = ?auto_6830514 ?auto_6830516 ) ) ( CALIBRATION_TARGET ?auto_6830525 ?auto_6830526 ) ( POWER_AVAIL ?auto_6830524 ) ( POINTING ?auto_6830524 ?auto_6830522 ) ( not ( = ?auto_6830526 ?auto_6830522 ) ) ( HAVE_IMAGE ?auto_6830519 ?auto_6830518 ) ( HAVE_IMAGE ?auto_6830520 ?auto_6830521 ) ( HAVE_IMAGE ?auto_6830522 ?auto_6830523 ) ( not ( = ?auto_6830516 ?auto_6830518 ) ) ( not ( = ?auto_6830516 ?auto_6830521 ) ) ( not ( = ?auto_6830516 ?auto_6830523 ) ) ( not ( = ?auto_6830514 ?auto_6830518 ) ) ( not ( = ?auto_6830514 ?auto_6830521 ) ) ( not ( = ?auto_6830514 ?auto_6830523 ) ) ( not ( = ?auto_6830519 ?auto_6830526 ) ) ( not ( = ?auto_6830518 ?auto_6830521 ) ) ( not ( = ?auto_6830518 ?auto_6830523 ) ) ( not ( = ?auto_6830520 ?auto_6830526 ) ) ( not ( = ?auto_6830521 ?auto_6830523 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6830517 ?auto_6830514 ?auto_6830515 ?auto_6830516 )
      ( GET-5IMAGE-VERIFY ?auto_6830515 ?auto_6830516 ?auto_6830517 ?auto_6830514 ?auto_6830519 ?auto_6830518 ?auto_6830520 ?auto_6830521 ?auto_6830522 ?auto_6830523 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6830568 - DIRECTION
      ?auto_6830569 - MODE
      ?auto_6830570 - DIRECTION
      ?auto_6830567 - MODE
      ?auto_6830572 - DIRECTION
      ?auto_6830571 - MODE
      ?auto_6830573 - DIRECTION
      ?auto_6830574 - MODE
      ?auto_6830575 - DIRECTION
      ?auto_6830576 - MODE
    )
    :vars
    (
      ?auto_6830578 - INSTRUMENT
      ?auto_6830577 - SATELLITE
      ?auto_6830579 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6830570 ?auto_6830568 ) ) ( not ( = ?auto_6830572 ?auto_6830568 ) ) ( not ( = ?auto_6830572 ?auto_6830570 ) ) ( not ( = ?auto_6830573 ?auto_6830568 ) ) ( not ( = ?auto_6830573 ?auto_6830570 ) ) ( not ( = ?auto_6830573 ?auto_6830572 ) ) ( not ( = ?auto_6830575 ?auto_6830568 ) ) ( not ( = ?auto_6830575 ?auto_6830570 ) ) ( not ( = ?auto_6830575 ?auto_6830572 ) ) ( not ( = ?auto_6830575 ?auto_6830573 ) ) ( ON_BOARD ?auto_6830578 ?auto_6830577 ) ( SUPPORTS ?auto_6830578 ?auto_6830569 ) ( not ( = ?auto_6830568 ?auto_6830579 ) ) ( HAVE_IMAGE ?auto_6830570 ?auto_6830567 ) ( not ( = ?auto_6830570 ?auto_6830579 ) ) ( not ( = ?auto_6830567 ?auto_6830569 ) ) ( CALIBRATION_TARGET ?auto_6830578 ?auto_6830579 ) ( POWER_AVAIL ?auto_6830577 ) ( POINTING ?auto_6830577 ?auto_6830573 ) ( not ( = ?auto_6830579 ?auto_6830573 ) ) ( HAVE_IMAGE ?auto_6830572 ?auto_6830571 ) ( HAVE_IMAGE ?auto_6830573 ?auto_6830574 ) ( HAVE_IMAGE ?auto_6830575 ?auto_6830576 ) ( not ( = ?auto_6830569 ?auto_6830571 ) ) ( not ( = ?auto_6830569 ?auto_6830574 ) ) ( not ( = ?auto_6830569 ?auto_6830576 ) ) ( not ( = ?auto_6830567 ?auto_6830571 ) ) ( not ( = ?auto_6830567 ?auto_6830574 ) ) ( not ( = ?auto_6830567 ?auto_6830576 ) ) ( not ( = ?auto_6830572 ?auto_6830579 ) ) ( not ( = ?auto_6830571 ?auto_6830574 ) ) ( not ( = ?auto_6830571 ?auto_6830576 ) ) ( not ( = ?auto_6830574 ?auto_6830576 ) ) ( not ( = ?auto_6830575 ?auto_6830579 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6830570 ?auto_6830567 ?auto_6830568 ?auto_6830569 )
      ( GET-5IMAGE-VERIFY ?auto_6830568 ?auto_6830569 ?auto_6830570 ?auto_6830567 ?auto_6830572 ?auto_6830571 ?auto_6830573 ?auto_6830574 ?auto_6830575 ?auto_6830576 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6831102 - DIRECTION
      ?auto_6831103 - MODE
      ?auto_6831104 - DIRECTION
      ?auto_6831101 - MODE
      ?auto_6831106 - DIRECTION
      ?auto_6831105 - MODE
      ?auto_6831107 - DIRECTION
      ?auto_6831108 - MODE
      ?auto_6831109 - DIRECTION
      ?auto_6831110 - MODE
    )
    :vars
    (
      ?auto_6831112 - INSTRUMENT
      ?auto_6831111 - SATELLITE
      ?auto_6831113 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6831104 ?auto_6831102 ) ) ( not ( = ?auto_6831106 ?auto_6831102 ) ) ( not ( = ?auto_6831106 ?auto_6831104 ) ) ( not ( = ?auto_6831107 ?auto_6831102 ) ) ( not ( = ?auto_6831107 ?auto_6831104 ) ) ( not ( = ?auto_6831107 ?auto_6831106 ) ) ( not ( = ?auto_6831109 ?auto_6831102 ) ) ( not ( = ?auto_6831109 ?auto_6831104 ) ) ( not ( = ?auto_6831109 ?auto_6831106 ) ) ( not ( = ?auto_6831109 ?auto_6831107 ) ) ( ON_BOARD ?auto_6831112 ?auto_6831111 ) ( SUPPORTS ?auto_6831112 ?auto_6831103 ) ( not ( = ?auto_6831102 ?auto_6831113 ) ) ( HAVE_IMAGE ?auto_6831104 ?auto_6831101 ) ( not ( = ?auto_6831104 ?auto_6831113 ) ) ( not ( = ?auto_6831101 ?auto_6831103 ) ) ( CALIBRATION_TARGET ?auto_6831112 ?auto_6831113 ) ( POWER_AVAIL ?auto_6831111 ) ( POINTING ?auto_6831111 ?auto_6831106 ) ( not ( = ?auto_6831113 ?auto_6831106 ) ) ( HAVE_IMAGE ?auto_6831106 ?auto_6831105 ) ( HAVE_IMAGE ?auto_6831107 ?auto_6831108 ) ( HAVE_IMAGE ?auto_6831109 ?auto_6831110 ) ( not ( = ?auto_6831103 ?auto_6831105 ) ) ( not ( = ?auto_6831103 ?auto_6831108 ) ) ( not ( = ?auto_6831103 ?auto_6831110 ) ) ( not ( = ?auto_6831101 ?auto_6831105 ) ) ( not ( = ?auto_6831101 ?auto_6831108 ) ) ( not ( = ?auto_6831101 ?auto_6831110 ) ) ( not ( = ?auto_6831105 ?auto_6831108 ) ) ( not ( = ?auto_6831105 ?auto_6831110 ) ) ( not ( = ?auto_6831107 ?auto_6831113 ) ) ( not ( = ?auto_6831108 ?auto_6831110 ) ) ( not ( = ?auto_6831109 ?auto_6831113 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6831104 ?auto_6831101 ?auto_6831102 ?auto_6831103 )
      ( GET-5IMAGE-VERIFY ?auto_6831102 ?auto_6831103 ?auto_6831104 ?auto_6831101 ?auto_6831106 ?auto_6831105 ?auto_6831107 ?auto_6831108 ?auto_6831109 ?auto_6831110 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6835363 - DIRECTION
      ?auto_6835364 - MODE
      ?auto_6835365 - DIRECTION
      ?auto_6835362 - MODE
      ?auto_6835367 - DIRECTION
      ?auto_6835366 - MODE
      ?auto_6835368 - DIRECTION
      ?auto_6835369 - MODE
      ?auto_6835370 - DIRECTION
      ?auto_6835371 - MODE
    )
    :vars
    (
      ?auto_6835373 - INSTRUMENT
      ?auto_6835372 - SATELLITE
      ?auto_6835374 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_6835365 ?auto_6835363 ) ) ( not ( = ?auto_6835367 ?auto_6835363 ) ) ( not ( = ?auto_6835367 ?auto_6835365 ) ) ( not ( = ?auto_6835368 ?auto_6835363 ) ) ( not ( = ?auto_6835368 ?auto_6835365 ) ) ( not ( = ?auto_6835368 ?auto_6835367 ) ) ( not ( = ?auto_6835370 ?auto_6835363 ) ) ( not ( = ?auto_6835370 ?auto_6835365 ) ) ( not ( = ?auto_6835370 ?auto_6835367 ) ) ( not ( = ?auto_6835370 ?auto_6835368 ) ) ( ON_BOARD ?auto_6835373 ?auto_6835372 ) ( SUPPORTS ?auto_6835373 ?auto_6835364 ) ( not ( = ?auto_6835363 ?auto_6835374 ) ) ( HAVE_IMAGE ?auto_6835367 ?auto_6835366 ) ( not ( = ?auto_6835367 ?auto_6835374 ) ) ( not ( = ?auto_6835366 ?auto_6835364 ) ) ( CALIBRATION_TARGET ?auto_6835373 ?auto_6835374 ) ( POWER_AVAIL ?auto_6835372 ) ( POINTING ?auto_6835372 ?auto_6835365 ) ( not ( = ?auto_6835374 ?auto_6835365 ) ) ( HAVE_IMAGE ?auto_6835365 ?auto_6835362 ) ( HAVE_IMAGE ?auto_6835368 ?auto_6835369 ) ( HAVE_IMAGE ?auto_6835370 ?auto_6835371 ) ( not ( = ?auto_6835364 ?auto_6835362 ) ) ( not ( = ?auto_6835364 ?auto_6835369 ) ) ( not ( = ?auto_6835364 ?auto_6835371 ) ) ( not ( = ?auto_6835362 ?auto_6835366 ) ) ( not ( = ?auto_6835362 ?auto_6835369 ) ) ( not ( = ?auto_6835362 ?auto_6835371 ) ) ( not ( = ?auto_6835366 ?auto_6835369 ) ) ( not ( = ?auto_6835366 ?auto_6835371 ) ) ( not ( = ?auto_6835368 ?auto_6835374 ) ) ( not ( = ?auto_6835369 ?auto_6835371 ) ) ( not ( = ?auto_6835370 ?auto_6835374 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6835367 ?auto_6835366 ?auto_6835363 ?auto_6835364 )
      ( GET-5IMAGE-VERIFY ?auto_6835363 ?auto_6835364 ?auto_6835365 ?auto_6835362 ?auto_6835367 ?auto_6835366 ?auto_6835368 ?auto_6835369 ?auto_6835370 ?auto_6835371 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6839604 - DIRECTION
      ?auto_6839605 - MODE
      ?auto_6839606 - DIRECTION
      ?auto_6839603 - MODE
      ?auto_6839608 - DIRECTION
      ?auto_6839607 - MODE
      ?auto_6839609 - DIRECTION
      ?auto_6839610 - MODE
    )
    :vars
    (
      ?auto_6839611 - INSTRUMENT
      ?auto_6839613 - SATELLITE
      ?auto_6839612 - DIRECTION
      ?auto_6839615 - DIRECTION
      ?auto_6839614 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6839606 ?auto_6839604 ) ) ( not ( = ?auto_6839608 ?auto_6839604 ) ) ( not ( = ?auto_6839608 ?auto_6839606 ) ) ( not ( = ?auto_6839609 ?auto_6839604 ) ) ( not ( = ?auto_6839609 ?auto_6839606 ) ) ( not ( = ?auto_6839609 ?auto_6839608 ) ) ( ON_BOARD ?auto_6839611 ?auto_6839613 ) ( SUPPORTS ?auto_6839611 ?auto_6839610 ) ( not ( = ?auto_6839609 ?auto_6839612 ) ) ( HAVE_IMAGE ?auto_6839604 ?auto_6839605 ) ( not ( = ?auto_6839604 ?auto_6839612 ) ) ( not ( = ?auto_6839605 ?auto_6839610 ) ) ( CALIBRATION_TARGET ?auto_6839611 ?auto_6839612 ) ( POINTING ?auto_6839613 ?auto_6839615 ) ( not ( = ?auto_6839612 ?auto_6839615 ) ) ( not ( = ?auto_6839609 ?auto_6839615 ) ) ( not ( = ?auto_6839604 ?auto_6839615 ) ) ( ON_BOARD ?auto_6839614 ?auto_6839613 ) ( POWER_ON ?auto_6839614 ) ( not ( = ?auto_6839611 ?auto_6839614 ) ) ( HAVE_IMAGE ?auto_6839606 ?auto_6839603 ) ( HAVE_IMAGE ?auto_6839608 ?auto_6839607 ) ( not ( = ?auto_6839605 ?auto_6839603 ) ) ( not ( = ?auto_6839605 ?auto_6839607 ) ) ( not ( = ?auto_6839606 ?auto_6839612 ) ) ( not ( = ?auto_6839606 ?auto_6839615 ) ) ( not ( = ?auto_6839603 ?auto_6839607 ) ) ( not ( = ?auto_6839603 ?auto_6839610 ) ) ( not ( = ?auto_6839608 ?auto_6839612 ) ) ( not ( = ?auto_6839608 ?auto_6839615 ) ) ( not ( = ?auto_6839607 ?auto_6839610 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6839604 ?auto_6839605 ?auto_6839609 ?auto_6839610 )
      ( GET-4IMAGE-VERIFY ?auto_6839604 ?auto_6839605 ?auto_6839606 ?auto_6839603 ?auto_6839608 ?auto_6839607 ?auto_6839609 ?auto_6839610 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6839655 - DIRECTION
      ?auto_6839656 - MODE
      ?auto_6839657 - DIRECTION
      ?auto_6839654 - MODE
      ?auto_6839659 - DIRECTION
      ?auto_6839658 - MODE
      ?auto_6839660 - DIRECTION
      ?auto_6839661 - MODE
    )
    :vars
    (
      ?auto_6839662 - INSTRUMENT
      ?auto_6839664 - SATELLITE
      ?auto_6839663 - DIRECTION
      ?auto_6839666 - DIRECTION
      ?auto_6839665 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6839657 ?auto_6839655 ) ) ( not ( = ?auto_6839659 ?auto_6839655 ) ) ( not ( = ?auto_6839659 ?auto_6839657 ) ) ( not ( = ?auto_6839660 ?auto_6839655 ) ) ( not ( = ?auto_6839660 ?auto_6839657 ) ) ( not ( = ?auto_6839660 ?auto_6839659 ) ) ( ON_BOARD ?auto_6839662 ?auto_6839664 ) ( SUPPORTS ?auto_6839662 ?auto_6839658 ) ( not ( = ?auto_6839659 ?auto_6839663 ) ) ( HAVE_IMAGE ?auto_6839655 ?auto_6839656 ) ( not ( = ?auto_6839655 ?auto_6839663 ) ) ( not ( = ?auto_6839656 ?auto_6839658 ) ) ( CALIBRATION_TARGET ?auto_6839662 ?auto_6839663 ) ( POINTING ?auto_6839664 ?auto_6839666 ) ( not ( = ?auto_6839663 ?auto_6839666 ) ) ( not ( = ?auto_6839659 ?auto_6839666 ) ) ( not ( = ?auto_6839655 ?auto_6839666 ) ) ( ON_BOARD ?auto_6839665 ?auto_6839664 ) ( POWER_ON ?auto_6839665 ) ( not ( = ?auto_6839662 ?auto_6839665 ) ) ( HAVE_IMAGE ?auto_6839657 ?auto_6839654 ) ( HAVE_IMAGE ?auto_6839660 ?auto_6839661 ) ( not ( = ?auto_6839656 ?auto_6839654 ) ) ( not ( = ?auto_6839656 ?auto_6839661 ) ) ( not ( = ?auto_6839657 ?auto_6839663 ) ) ( not ( = ?auto_6839657 ?auto_6839666 ) ) ( not ( = ?auto_6839654 ?auto_6839658 ) ) ( not ( = ?auto_6839654 ?auto_6839661 ) ) ( not ( = ?auto_6839658 ?auto_6839661 ) ) ( not ( = ?auto_6839660 ?auto_6839663 ) ) ( not ( = ?auto_6839660 ?auto_6839666 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6839655 ?auto_6839656 ?auto_6839659 ?auto_6839658 )
      ( GET-4IMAGE-VERIFY ?auto_6839655 ?auto_6839656 ?auto_6839657 ?auto_6839654 ?auto_6839659 ?auto_6839658 ?auto_6839660 ?auto_6839661 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6839980 - DIRECTION
      ?auto_6839981 - MODE
      ?auto_6839982 - DIRECTION
      ?auto_6839979 - MODE
      ?auto_6839984 - DIRECTION
      ?auto_6839983 - MODE
      ?auto_6839985 - DIRECTION
      ?auto_6839986 - MODE
    )
    :vars
    (
      ?auto_6839987 - INSTRUMENT
      ?auto_6839989 - SATELLITE
      ?auto_6839988 - DIRECTION
      ?auto_6839991 - DIRECTION
      ?auto_6839990 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6839982 ?auto_6839980 ) ) ( not ( = ?auto_6839984 ?auto_6839980 ) ) ( not ( = ?auto_6839984 ?auto_6839982 ) ) ( not ( = ?auto_6839985 ?auto_6839980 ) ) ( not ( = ?auto_6839985 ?auto_6839982 ) ) ( not ( = ?auto_6839985 ?auto_6839984 ) ) ( ON_BOARD ?auto_6839987 ?auto_6839989 ) ( SUPPORTS ?auto_6839987 ?auto_6839979 ) ( not ( = ?auto_6839982 ?auto_6839988 ) ) ( HAVE_IMAGE ?auto_6839980 ?auto_6839981 ) ( not ( = ?auto_6839980 ?auto_6839988 ) ) ( not ( = ?auto_6839981 ?auto_6839979 ) ) ( CALIBRATION_TARGET ?auto_6839987 ?auto_6839988 ) ( POINTING ?auto_6839989 ?auto_6839991 ) ( not ( = ?auto_6839988 ?auto_6839991 ) ) ( not ( = ?auto_6839982 ?auto_6839991 ) ) ( not ( = ?auto_6839980 ?auto_6839991 ) ) ( ON_BOARD ?auto_6839990 ?auto_6839989 ) ( POWER_ON ?auto_6839990 ) ( not ( = ?auto_6839987 ?auto_6839990 ) ) ( HAVE_IMAGE ?auto_6839984 ?auto_6839983 ) ( HAVE_IMAGE ?auto_6839985 ?auto_6839986 ) ( not ( = ?auto_6839981 ?auto_6839983 ) ) ( not ( = ?auto_6839981 ?auto_6839986 ) ) ( not ( = ?auto_6839979 ?auto_6839983 ) ) ( not ( = ?auto_6839979 ?auto_6839986 ) ) ( not ( = ?auto_6839984 ?auto_6839988 ) ) ( not ( = ?auto_6839984 ?auto_6839991 ) ) ( not ( = ?auto_6839983 ?auto_6839986 ) ) ( not ( = ?auto_6839985 ?auto_6839988 ) ) ( not ( = ?auto_6839985 ?auto_6839991 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6839980 ?auto_6839981 ?auto_6839982 ?auto_6839979 )
      ( GET-4IMAGE-VERIFY ?auto_6839980 ?auto_6839981 ?auto_6839982 ?auto_6839979 ?auto_6839984 ?auto_6839983 ?auto_6839985 ?auto_6839986 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6842523 - DIRECTION
      ?auto_6842524 - MODE
      ?auto_6842525 - DIRECTION
      ?auto_6842522 - MODE
      ?auto_6842527 - DIRECTION
      ?auto_6842526 - MODE
      ?auto_6842528 - DIRECTION
      ?auto_6842529 - MODE
    )
    :vars
    (
      ?auto_6842530 - INSTRUMENT
      ?auto_6842532 - SATELLITE
      ?auto_6842531 - DIRECTION
      ?auto_6842534 - DIRECTION
      ?auto_6842533 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6842525 ?auto_6842523 ) ) ( not ( = ?auto_6842527 ?auto_6842523 ) ) ( not ( = ?auto_6842527 ?auto_6842525 ) ) ( not ( = ?auto_6842528 ?auto_6842523 ) ) ( not ( = ?auto_6842528 ?auto_6842525 ) ) ( not ( = ?auto_6842528 ?auto_6842527 ) ) ( ON_BOARD ?auto_6842530 ?auto_6842532 ) ( SUPPORTS ?auto_6842530 ?auto_6842524 ) ( not ( = ?auto_6842523 ?auto_6842531 ) ) ( HAVE_IMAGE ?auto_6842525 ?auto_6842522 ) ( not ( = ?auto_6842525 ?auto_6842531 ) ) ( not ( = ?auto_6842522 ?auto_6842524 ) ) ( CALIBRATION_TARGET ?auto_6842530 ?auto_6842531 ) ( POINTING ?auto_6842532 ?auto_6842534 ) ( not ( = ?auto_6842531 ?auto_6842534 ) ) ( not ( = ?auto_6842523 ?auto_6842534 ) ) ( not ( = ?auto_6842525 ?auto_6842534 ) ) ( ON_BOARD ?auto_6842533 ?auto_6842532 ) ( POWER_ON ?auto_6842533 ) ( not ( = ?auto_6842530 ?auto_6842533 ) ) ( HAVE_IMAGE ?auto_6842527 ?auto_6842526 ) ( HAVE_IMAGE ?auto_6842528 ?auto_6842529 ) ( not ( = ?auto_6842524 ?auto_6842526 ) ) ( not ( = ?auto_6842524 ?auto_6842529 ) ) ( not ( = ?auto_6842522 ?auto_6842526 ) ) ( not ( = ?auto_6842522 ?auto_6842529 ) ) ( not ( = ?auto_6842527 ?auto_6842531 ) ) ( not ( = ?auto_6842527 ?auto_6842534 ) ) ( not ( = ?auto_6842526 ?auto_6842529 ) ) ( not ( = ?auto_6842528 ?auto_6842531 ) ) ( not ( = ?auto_6842528 ?auto_6842534 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6842525 ?auto_6842522 ?auto_6842523 ?auto_6842524 )
      ( GET-4IMAGE-VERIFY ?auto_6842523 ?auto_6842524 ?auto_6842525 ?auto_6842522 ?auto_6842527 ?auto_6842526 ?auto_6842528 ?auto_6842529 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6845230 - DIRECTION
      ?auto_6845231 - MODE
      ?auto_6845232 - DIRECTION
      ?auto_6845229 - MODE
      ?auto_6845234 - DIRECTION
      ?auto_6845233 - MODE
      ?auto_6845235 - DIRECTION
      ?auto_6845236 - MODE
      ?auto_6845237 - DIRECTION
      ?auto_6845238 - MODE
    )
    :vars
    (
      ?auto_6845239 - INSTRUMENT
      ?auto_6845241 - SATELLITE
      ?auto_6845240 - DIRECTION
      ?auto_6845242 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6845232 ?auto_6845230 ) ) ( not ( = ?auto_6845234 ?auto_6845230 ) ) ( not ( = ?auto_6845234 ?auto_6845232 ) ) ( not ( = ?auto_6845235 ?auto_6845230 ) ) ( not ( = ?auto_6845235 ?auto_6845232 ) ) ( not ( = ?auto_6845235 ?auto_6845234 ) ) ( not ( = ?auto_6845237 ?auto_6845230 ) ) ( not ( = ?auto_6845237 ?auto_6845232 ) ) ( not ( = ?auto_6845237 ?auto_6845234 ) ) ( not ( = ?auto_6845237 ?auto_6845235 ) ) ( ON_BOARD ?auto_6845239 ?auto_6845241 ) ( SUPPORTS ?auto_6845239 ?auto_6845238 ) ( not ( = ?auto_6845237 ?auto_6845240 ) ) ( HAVE_IMAGE ?auto_6845230 ?auto_6845231 ) ( not ( = ?auto_6845230 ?auto_6845240 ) ) ( not ( = ?auto_6845231 ?auto_6845238 ) ) ( CALIBRATION_TARGET ?auto_6845239 ?auto_6845240 ) ( POINTING ?auto_6845241 ?auto_6845235 ) ( not ( = ?auto_6845240 ?auto_6845235 ) ) ( ON_BOARD ?auto_6845242 ?auto_6845241 ) ( POWER_ON ?auto_6845242 ) ( not ( = ?auto_6845239 ?auto_6845242 ) ) ( HAVE_IMAGE ?auto_6845232 ?auto_6845229 ) ( HAVE_IMAGE ?auto_6845234 ?auto_6845233 ) ( HAVE_IMAGE ?auto_6845235 ?auto_6845236 ) ( not ( = ?auto_6845231 ?auto_6845229 ) ) ( not ( = ?auto_6845231 ?auto_6845233 ) ) ( not ( = ?auto_6845231 ?auto_6845236 ) ) ( not ( = ?auto_6845232 ?auto_6845240 ) ) ( not ( = ?auto_6845229 ?auto_6845233 ) ) ( not ( = ?auto_6845229 ?auto_6845236 ) ) ( not ( = ?auto_6845229 ?auto_6845238 ) ) ( not ( = ?auto_6845234 ?auto_6845240 ) ) ( not ( = ?auto_6845233 ?auto_6845236 ) ) ( not ( = ?auto_6845233 ?auto_6845238 ) ) ( not ( = ?auto_6845236 ?auto_6845238 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6845230 ?auto_6845231 ?auto_6845237 ?auto_6845238 )
      ( GET-5IMAGE-VERIFY ?auto_6845230 ?auto_6845231 ?auto_6845232 ?auto_6845229 ?auto_6845234 ?auto_6845233 ?auto_6845235 ?auto_6845236 ?auto_6845237 ?auto_6845238 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6845289 - DIRECTION
      ?auto_6845290 - MODE
      ?auto_6845291 - DIRECTION
      ?auto_6845288 - MODE
      ?auto_6845293 - DIRECTION
      ?auto_6845292 - MODE
      ?auto_6845294 - DIRECTION
      ?auto_6845295 - MODE
      ?auto_6845296 - DIRECTION
      ?auto_6845297 - MODE
    )
    :vars
    (
      ?auto_6845298 - INSTRUMENT
      ?auto_6845300 - SATELLITE
      ?auto_6845299 - DIRECTION
      ?auto_6845301 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6845291 ?auto_6845289 ) ) ( not ( = ?auto_6845293 ?auto_6845289 ) ) ( not ( = ?auto_6845293 ?auto_6845291 ) ) ( not ( = ?auto_6845294 ?auto_6845289 ) ) ( not ( = ?auto_6845294 ?auto_6845291 ) ) ( not ( = ?auto_6845294 ?auto_6845293 ) ) ( not ( = ?auto_6845296 ?auto_6845289 ) ) ( not ( = ?auto_6845296 ?auto_6845291 ) ) ( not ( = ?auto_6845296 ?auto_6845293 ) ) ( not ( = ?auto_6845296 ?auto_6845294 ) ) ( ON_BOARD ?auto_6845298 ?auto_6845300 ) ( SUPPORTS ?auto_6845298 ?auto_6845295 ) ( not ( = ?auto_6845294 ?auto_6845299 ) ) ( HAVE_IMAGE ?auto_6845289 ?auto_6845290 ) ( not ( = ?auto_6845289 ?auto_6845299 ) ) ( not ( = ?auto_6845290 ?auto_6845295 ) ) ( CALIBRATION_TARGET ?auto_6845298 ?auto_6845299 ) ( POINTING ?auto_6845300 ?auto_6845296 ) ( not ( = ?auto_6845299 ?auto_6845296 ) ) ( ON_BOARD ?auto_6845301 ?auto_6845300 ) ( POWER_ON ?auto_6845301 ) ( not ( = ?auto_6845298 ?auto_6845301 ) ) ( HAVE_IMAGE ?auto_6845291 ?auto_6845288 ) ( HAVE_IMAGE ?auto_6845293 ?auto_6845292 ) ( HAVE_IMAGE ?auto_6845296 ?auto_6845297 ) ( not ( = ?auto_6845290 ?auto_6845288 ) ) ( not ( = ?auto_6845290 ?auto_6845292 ) ) ( not ( = ?auto_6845290 ?auto_6845297 ) ) ( not ( = ?auto_6845291 ?auto_6845299 ) ) ( not ( = ?auto_6845288 ?auto_6845292 ) ) ( not ( = ?auto_6845288 ?auto_6845295 ) ) ( not ( = ?auto_6845288 ?auto_6845297 ) ) ( not ( = ?auto_6845293 ?auto_6845299 ) ) ( not ( = ?auto_6845292 ?auto_6845295 ) ) ( not ( = ?auto_6845292 ?auto_6845297 ) ) ( not ( = ?auto_6845295 ?auto_6845297 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6845289 ?auto_6845290 ?auto_6845294 ?auto_6845295 )
      ( GET-5IMAGE-VERIFY ?auto_6845289 ?auto_6845290 ?auto_6845291 ?auto_6845288 ?auto_6845293 ?auto_6845292 ?auto_6845294 ?auto_6845295 ?auto_6845296 ?auto_6845297 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6845346 - DIRECTION
      ?auto_6845347 - MODE
      ?auto_6845348 - DIRECTION
      ?auto_6845345 - MODE
      ?auto_6845350 - DIRECTION
      ?auto_6845349 - MODE
      ?auto_6845351 - DIRECTION
      ?auto_6845352 - MODE
      ?auto_6845353 - DIRECTION
      ?auto_6845354 - MODE
    )
    :vars
    (
      ?auto_6845355 - INSTRUMENT
      ?auto_6845357 - SATELLITE
      ?auto_6845356 - DIRECTION
      ?auto_6845358 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6845348 ?auto_6845346 ) ) ( not ( = ?auto_6845350 ?auto_6845346 ) ) ( not ( = ?auto_6845350 ?auto_6845348 ) ) ( not ( = ?auto_6845351 ?auto_6845346 ) ) ( not ( = ?auto_6845351 ?auto_6845348 ) ) ( not ( = ?auto_6845351 ?auto_6845350 ) ) ( not ( = ?auto_6845353 ?auto_6845346 ) ) ( not ( = ?auto_6845353 ?auto_6845348 ) ) ( not ( = ?auto_6845353 ?auto_6845350 ) ) ( not ( = ?auto_6845353 ?auto_6845351 ) ) ( ON_BOARD ?auto_6845355 ?auto_6845357 ) ( SUPPORTS ?auto_6845355 ?auto_6845354 ) ( not ( = ?auto_6845353 ?auto_6845356 ) ) ( HAVE_IMAGE ?auto_6845346 ?auto_6845347 ) ( not ( = ?auto_6845346 ?auto_6845356 ) ) ( not ( = ?auto_6845347 ?auto_6845354 ) ) ( CALIBRATION_TARGET ?auto_6845355 ?auto_6845356 ) ( POINTING ?auto_6845357 ?auto_6845350 ) ( not ( = ?auto_6845356 ?auto_6845350 ) ) ( ON_BOARD ?auto_6845358 ?auto_6845357 ) ( POWER_ON ?auto_6845358 ) ( not ( = ?auto_6845355 ?auto_6845358 ) ) ( HAVE_IMAGE ?auto_6845348 ?auto_6845345 ) ( HAVE_IMAGE ?auto_6845350 ?auto_6845349 ) ( HAVE_IMAGE ?auto_6845351 ?auto_6845352 ) ( not ( = ?auto_6845347 ?auto_6845345 ) ) ( not ( = ?auto_6845347 ?auto_6845349 ) ) ( not ( = ?auto_6845347 ?auto_6845352 ) ) ( not ( = ?auto_6845348 ?auto_6845356 ) ) ( not ( = ?auto_6845345 ?auto_6845349 ) ) ( not ( = ?auto_6845345 ?auto_6845352 ) ) ( not ( = ?auto_6845345 ?auto_6845354 ) ) ( not ( = ?auto_6845349 ?auto_6845352 ) ) ( not ( = ?auto_6845349 ?auto_6845354 ) ) ( not ( = ?auto_6845351 ?auto_6845356 ) ) ( not ( = ?auto_6845352 ?auto_6845354 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6845346 ?auto_6845347 ?auto_6845353 ?auto_6845354 )
      ( GET-5IMAGE-VERIFY ?auto_6845346 ?auto_6845347 ?auto_6845348 ?auto_6845345 ?auto_6845350 ?auto_6845349 ?auto_6845351 ?auto_6845352 ?auto_6845353 ?auto_6845354 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6845402 - DIRECTION
      ?auto_6845403 - MODE
      ?auto_6845404 - DIRECTION
      ?auto_6845401 - MODE
      ?auto_6845406 - DIRECTION
      ?auto_6845405 - MODE
      ?auto_6845407 - DIRECTION
      ?auto_6845408 - MODE
      ?auto_6845409 - DIRECTION
      ?auto_6845410 - MODE
    )
    :vars
    (
      ?auto_6845411 - INSTRUMENT
      ?auto_6845413 - SATELLITE
      ?auto_6845412 - DIRECTION
      ?auto_6845414 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6845404 ?auto_6845402 ) ) ( not ( = ?auto_6845406 ?auto_6845402 ) ) ( not ( = ?auto_6845406 ?auto_6845404 ) ) ( not ( = ?auto_6845407 ?auto_6845402 ) ) ( not ( = ?auto_6845407 ?auto_6845404 ) ) ( not ( = ?auto_6845407 ?auto_6845406 ) ) ( not ( = ?auto_6845409 ?auto_6845402 ) ) ( not ( = ?auto_6845409 ?auto_6845404 ) ) ( not ( = ?auto_6845409 ?auto_6845406 ) ) ( not ( = ?auto_6845409 ?auto_6845407 ) ) ( ON_BOARD ?auto_6845411 ?auto_6845413 ) ( SUPPORTS ?auto_6845411 ?auto_6845408 ) ( not ( = ?auto_6845407 ?auto_6845412 ) ) ( HAVE_IMAGE ?auto_6845402 ?auto_6845403 ) ( not ( = ?auto_6845402 ?auto_6845412 ) ) ( not ( = ?auto_6845403 ?auto_6845408 ) ) ( CALIBRATION_TARGET ?auto_6845411 ?auto_6845412 ) ( POINTING ?auto_6845413 ?auto_6845406 ) ( not ( = ?auto_6845412 ?auto_6845406 ) ) ( ON_BOARD ?auto_6845414 ?auto_6845413 ) ( POWER_ON ?auto_6845414 ) ( not ( = ?auto_6845411 ?auto_6845414 ) ) ( HAVE_IMAGE ?auto_6845404 ?auto_6845401 ) ( HAVE_IMAGE ?auto_6845406 ?auto_6845405 ) ( HAVE_IMAGE ?auto_6845409 ?auto_6845410 ) ( not ( = ?auto_6845403 ?auto_6845401 ) ) ( not ( = ?auto_6845403 ?auto_6845405 ) ) ( not ( = ?auto_6845403 ?auto_6845410 ) ) ( not ( = ?auto_6845404 ?auto_6845412 ) ) ( not ( = ?auto_6845401 ?auto_6845405 ) ) ( not ( = ?auto_6845401 ?auto_6845408 ) ) ( not ( = ?auto_6845401 ?auto_6845410 ) ) ( not ( = ?auto_6845405 ?auto_6845408 ) ) ( not ( = ?auto_6845405 ?auto_6845410 ) ) ( not ( = ?auto_6845408 ?auto_6845410 ) ) ( not ( = ?auto_6845409 ?auto_6845412 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6845402 ?auto_6845403 ?auto_6845407 ?auto_6845408 )
      ( GET-5IMAGE-VERIFY ?auto_6845402 ?auto_6845403 ?auto_6845404 ?auto_6845401 ?auto_6845406 ?auto_6845405 ?auto_6845407 ?auto_6845408 ?auto_6845409 ?auto_6845410 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6845637 - DIRECTION
      ?auto_6845638 - MODE
      ?auto_6845639 - DIRECTION
      ?auto_6845636 - MODE
      ?auto_6845641 - DIRECTION
      ?auto_6845640 - MODE
      ?auto_6845642 - DIRECTION
      ?auto_6845643 - MODE
      ?auto_6845644 - DIRECTION
      ?auto_6845645 - MODE
    )
    :vars
    (
      ?auto_6845646 - INSTRUMENT
      ?auto_6845648 - SATELLITE
      ?auto_6845647 - DIRECTION
      ?auto_6845649 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6845639 ?auto_6845637 ) ) ( not ( = ?auto_6845641 ?auto_6845637 ) ) ( not ( = ?auto_6845641 ?auto_6845639 ) ) ( not ( = ?auto_6845642 ?auto_6845637 ) ) ( not ( = ?auto_6845642 ?auto_6845639 ) ) ( not ( = ?auto_6845642 ?auto_6845641 ) ) ( not ( = ?auto_6845644 ?auto_6845637 ) ) ( not ( = ?auto_6845644 ?auto_6845639 ) ) ( not ( = ?auto_6845644 ?auto_6845641 ) ) ( not ( = ?auto_6845644 ?auto_6845642 ) ) ( ON_BOARD ?auto_6845646 ?auto_6845648 ) ( SUPPORTS ?auto_6845646 ?auto_6845640 ) ( not ( = ?auto_6845641 ?auto_6845647 ) ) ( HAVE_IMAGE ?auto_6845637 ?auto_6845638 ) ( not ( = ?auto_6845637 ?auto_6845647 ) ) ( not ( = ?auto_6845638 ?auto_6845640 ) ) ( CALIBRATION_TARGET ?auto_6845646 ?auto_6845647 ) ( POINTING ?auto_6845648 ?auto_6845644 ) ( not ( = ?auto_6845647 ?auto_6845644 ) ) ( ON_BOARD ?auto_6845649 ?auto_6845648 ) ( POWER_ON ?auto_6845649 ) ( not ( = ?auto_6845646 ?auto_6845649 ) ) ( HAVE_IMAGE ?auto_6845639 ?auto_6845636 ) ( HAVE_IMAGE ?auto_6845642 ?auto_6845643 ) ( HAVE_IMAGE ?auto_6845644 ?auto_6845645 ) ( not ( = ?auto_6845638 ?auto_6845636 ) ) ( not ( = ?auto_6845638 ?auto_6845643 ) ) ( not ( = ?auto_6845638 ?auto_6845645 ) ) ( not ( = ?auto_6845639 ?auto_6845647 ) ) ( not ( = ?auto_6845636 ?auto_6845640 ) ) ( not ( = ?auto_6845636 ?auto_6845643 ) ) ( not ( = ?auto_6845636 ?auto_6845645 ) ) ( not ( = ?auto_6845640 ?auto_6845643 ) ) ( not ( = ?auto_6845640 ?auto_6845645 ) ) ( not ( = ?auto_6845642 ?auto_6845647 ) ) ( not ( = ?auto_6845643 ?auto_6845645 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6845637 ?auto_6845638 ?auto_6845641 ?auto_6845640 )
      ( GET-5IMAGE-VERIFY ?auto_6845637 ?auto_6845638 ?auto_6845639 ?auto_6845636 ?auto_6845641 ?auto_6845640 ?auto_6845642 ?auto_6845643 ?auto_6845644 ?auto_6845645 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6845694 - DIRECTION
      ?auto_6845695 - MODE
      ?auto_6845696 - DIRECTION
      ?auto_6845693 - MODE
      ?auto_6845698 - DIRECTION
      ?auto_6845697 - MODE
      ?auto_6845699 - DIRECTION
      ?auto_6845700 - MODE
      ?auto_6845701 - DIRECTION
      ?auto_6845702 - MODE
    )
    :vars
    (
      ?auto_6845703 - INSTRUMENT
      ?auto_6845705 - SATELLITE
      ?auto_6845704 - DIRECTION
      ?auto_6845706 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6845696 ?auto_6845694 ) ) ( not ( = ?auto_6845698 ?auto_6845694 ) ) ( not ( = ?auto_6845698 ?auto_6845696 ) ) ( not ( = ?auto_6845699 ?auto_6845694 ) ) ( not ( = ?auto_6845699 ?auto_6845696 ) ) ( not ( = ?auto_6845699 ?auto_6845698 ) ) ( not ( = ?auto_6845701 ?auto_6845694 ) ) ( not ( = ?auto_6845701 ?auto_6845696 ) ) ( not ( = ?auto_6845701 ?auto_6845698 ) ) ( not ( = ?auto_6845701 ?auto_6845699 ) ) ( ON_BOARD ?auto_6845703 ?auto_6845705 ) ( SUPPORTS ?auto_6845703 ?auto_6845697 ) ( not ( = ?auto_6845698 ?auto_6845704 ) ) ( HAVE_IMAGE ?auto_6845694 ?auto_6845695 ) ( not ( = ?auto_6845694 ?auto_6845704 ) ) ( not ( = ?auto_6845695 ?auto_6845697 ) ) ( CALIBRATION_TARGET ?auto_6845703 ?auto_6845704 ) ( POINTING ?auto_6845705 ?auto_6845699 ) ( not ( = ?auto_6845704 ?auto_6845699 ) ) ( ON_BOARD ?auto_6845706 ?auto_6845705 ) ( POWER_ON ?auto_6845706 ) ( not ( = ?auto_6845703 ?auto_6845706 ) ) ( HAVE_IMAGE ?auto_6845696 ?auto_6845693 ) ( HAVE_IMAGE ?auto_6845699 ?auto_6845700 ) ( HAVE_IMAGE ?auto_6845701 ?auto_6845702 ) ( not ( = ?auto_6845695 ?auto_6845693 ) ) ( not ( = ?auto_6845695 ?auto_6845700 ) ) ( not ( = ?auto_6845695 ?auto_6845702 ) ) ( not ( = ?auto_6845696 ?auto_6845704 ) ) ( not ( = ?auto_6845693 ?auto_6845697 ) ) ( not ( = ?auto_6845693 ?auto_6845700 ) ) ( not ( = ?auto_6845693 ?auto_6845702 ) ) ( not ( = ?auto_6845697 ?auto_6845700 ) ) ( not ( = ?auto_6845697 ?auto_6845702 ) ) ( not ( = ?auto_6845700 ?auto_6845702 ) ) ( not ( = ?auto_6845701 ?auto_6845704 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6845694 ?auto_6845695 ?auto_6845698 ?auto_6845697 )
      ( GET-5IMAGE-VERIFY ?auto_6845694 ?auto_6845695 ?auto_6845696 ?auto_6845693 ?auto_6845698 ?auto_6845697 ?auto_6845699 ?auto_6845700 ?auto_6845701 ?auto_6845702 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6846831 - DIRECTION
      ?auto_6846832 - MODE
      ?auto_6846833 - DIRECTION
      ?auto_6846830 - MODE
      ?auto_6846835 - DIRECTION
      ?auto_6846834 - MODE
      ?auto_6846836 - DIRECTION
      ?auto_6846837 - MODE
      ?auto_6846838 - DIRECTION
      ?auto_6846839 - MODE
    )
    :vars
    (
      ?auto_6846840 - INSTRUMENT
      ?auto_6846842 - SATELLITE
      ?auto_6846841 - DIRECTION
      ?auto_6846843 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6846833 ?auto_6846831 ) ) ( not ( = ?auto_6846835 ?auto_6846831 ) ) ( not ( = ?auto_6846835 ?auto_6846833 ) ) ( not ( = ?auto_6846836 ?auto_6846831 ) ) ( not ( = ?auto_6846836 ?auto_6846833 ) ) ( not ( = ?auto_6846836 ?auto_6846835 ) ) ( not ( = ?auto_6846838 ?auto_6846831 ) ) ( not ( = ?auto_6846838 ?auto_6846833 ) ) ( not ( = ?auto_6846838 ?auto_6846835 ) ) ( not ( = ?auto_6846838 ?auto_6846836 ) ) ( ON_BOARD ?auto_6846840 ?auto_6846842 ) ( SUPPORTS ?auto_6846840 ?auto_6846839 ) ( not ( = ?auto_6846838 ?auto_6846841 ) ) ( HAVE_IMAGE ?auto_6846831 ?auto_6846832 ) ( not ( = ?auto_6846831 ?auto_6846841 ) ) ( not ( = ?auto_6846832 ?auto_6846839 ) ) ( CALIBRATION_TARGET ?auto_6846840 ?auto_6846841 ) ( POINTING ?auto_6846842 ?auto_6846833 ) ( not ( = ?auto_6846841 ?auto_6846833 ) ) ( ON_BOARD ?auto_6846843 ?auto_6846842 ) ( POWER_ON ?auto_6846843 ) ( not ( = ?auto_6846840 ?auto_6846843 ) ) ( HAVE_IMAGE ?auto_6846833 ?auto_6846830 ) ( HAVE_IMAGE ?auto_6846835 ?auto_6846834 ) ( HAVE_IMAGE ?auto_6846836 ?auto_6846837 ) ( not ( = ?auto_6846832 ?auto_6846830 ) ) ( not ( = ?auto_6846832 ?auto_6846834 ) ) ( not ( = ?auto_6846832 ?auto_6846837 ) ) ( not ( = ?auto_6846830 ?auto_6846834 ) ) ( not ( = ?auto_6846830 ?auto_6846837 ) ) ( not ( = ?auto_6846830 ?auto_6846839 ) ) ( not ( = ?auto_6846835 ?auto_6846841 ) ) ( not ( = ?auto_6846834 ?auto_6846837 ) ) ( not ( = ?auto_6846834 ?auto_6846839 ) ) ( not ( = ?auto_6846836 ?auto_6846841 ) ) ( not ( = ?auto_6846837 ?auto_6846839 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6846831 ?auto_6846832 ?auto_6846838 ?auto_6846839 )
      ( GET-5IMAGE-VERIFY ?auto_6846831 ?auto_6846832 ?auto_6846833 ?auto_6846830 ?auto_6846835 ?auto_6846834 ?auto_6846836 ?auto_6846837 ?auto_6846838 ?auto_6846839 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6846887 - DIRECTION
      ?auto_6846888 - MODE
      ?auto_6846889 - DIRECTION
      ?auto_6846886 - MODE
      ?auto_6846891 - DIRECTION
      ?auto_6846890 - MODE
      ?auto_6846892 - DIRECTION
      ?auto_6846893 - MODE
      ?auto_6846894 - DIRECTION
      ?auto_6846895 - MODE
    )
    :vars
    (
      ?auto_6846896 - INSTRUMENT
      ?auto_6846898 - SATELLITE
      ?auto_6846897 - DIRECTION
      ?auto_6846899 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6846889 ?auto_6846887 ) ) ( not ( = ?auto_6846891 ?auto_6846887 ) ) ( not ( = ?auto_6846891 ?auto_6846889 ) ) ( not ( = ?auto_6846892 ?auto_6846887 ) ) ( not ( = ?auto_6846892 ?auto_6846889 ) ) ( not ( = ?auto_6846892 ?auto_6846891 ) ) ( not ( = ?auto_6846894 ?auto_6846887 ) ) ( not ( = ?auto_6846894 ?auto_6846889 ) ) ( not ( = ?auto_6846894 ?auto_6846891 ) ) ( not ( = ?auto_6846894 ?auto_6846892 ) ) ( ON_BOARD ?auto_6846896 ?auto_6846898 ) ( SUPPORTS ?auto_6846896 ?auto_6846893 ) ( not ( = ?auto_6846892 ?auto_6846897 ) ) ( HAVE_IMAGE ?auto_6846887 ?auto_6846888 ) ( not ( = ?auto_6846887 ?auto_6846897 ) ) ( not ( = ?auto_6846888 ?auto_6846893 ) ) ( CALIBRATION_TARGET ?auto_6846896 ?auto_6846897 ) ( POINTING ?auto_6846898 ?auto_6846889 ) ( not ( = ?auto_6846897 ?auto_6846889 ) ) ( ON_BOARD ?auto_6846899 ?auto_6846898 ) ( POWER_ON ?auto_6846899 ) ( not ( = ?auto_6846896 ?auto_6846899 ) ) ( HAVE_IMAGE ?auto_6846889 ?auto_6846886 ) ( HAVE_IMAGE ?auto_6846891 ?auto_6846890 ) ( HAVE_IMAGE ?auto_6846894 ?auto_6846895 ) ( not ( = ?auto_6846888 ?auto_6846886 ) ) ( not ( = ?auto_6846888 ?auto_6846890 ) ) ( not ( = ?auto_6846888 ?auto_6846895 ) ) ( not ( = ?auto_6846886 ?auto_6846890 ) ) ( not ( = ?auto_6846886 ?auto_6846893 ) ) ( not ( = ?auto_6846886 ?auto_6846895 ) ) ( not ( = ?auto_6846891 ?auto_6846897 ) ) ( not ( = ?auto_6846890 ?auto_6846893 ) ) ( not ( = ?auto_6846890 ?auto_6846895 ) ) ( not ( = ?auto_6846893 ?auto_6846895 ) ) ( not ( = ?auto_6846894 ?auto_6846897 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6846887 ?auto_6846888 ?auto_6846892 ?auto_6846893 )
      ( GET-5IMAGE-VERIFY ?auto_6846887 ?auto_6846888 ?auto_6846889 ?auto_6846886 ?auto_6846891 ?auto_6846890 ?auto_6846892 ?auto_6846893 ?auto_6846894 ?auto_6846895 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6847271 - DIRECTION
      ?auto_6847272 - MODE
      ?auto_6847273 - DIRECTION
      ?auto_6847270 - MODE
      ?auto_6847275 - DIRECTION
      ?auto_6847274 - MODE
      ?auto_6847276 - DIRECTION
      ?auto_6847277 - MODE
      ?auto_6847278 - DIRECTION
      ?auto_6847279 - MODE
    )
    :vars
    (
      ?auto_6847280 - INSTRUMENT
      ?auto_6847282 - SATELLITE
      ?auto_6847281 - DIRECTION
      ?auto_6847283 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6847273 ?auto_6847271 ) ) ( not ( = ?auto_6847275 ?auto_6847271 ) ) ( not ( = ?auto_6847275 ?auto_6847273 ) ) ( not ( = ?auto_6847276 ?auto_6847271 ) ) ( not ( = ?auto_6847276 ?auto_6847273 ) ) ( not ( = ?auto_6847276 ?auto_6847275 ) ) ( not ( = ?auto_6847278 ?auto_6847271 ) ) ( not ( = ?auto_6847278 ?auto_6847273 ) ) ( not ( = ?auto_6847278 ?auto_6847275 ) ) ( not ( = ?auto_6847278 ?auto_6847276 ) ) ( ON_BOARD ?auto_6847280 ?auto_6847282 ) ( SUPPORTS ?auto_6847280 ?auto_6847274 ) ( not ( = ?auto_6847275 ?auto_6847281 ) ) ( HAVE_IMAGE ?auto_6847271 ?auto_6847272 ) ( not ( = ?auto_6847271 ?auto_6847281 ) ) ( not ( = ?auto_6847272 ?auto_6847274 ) ) ( CALIBRATION_TARGET ?auto_6847280 ?auto_6847281 ) ( POINTING ?auto_6847282 ?auto_6847273 ) ( not ( = ?auto_6847281 ?auto_6847273 ) ) ( ON_BOARD ?auto_6847283 ?auto_6847282 ) ( POWER_ON ?auto_6847283 ) ( not ( = ?auto_6847280 ?auto_6847283 ) ) ( HAVE_IMAGE ?auto_6847273 ?auto_6847270 ) ( HAVE_IMAGE ?auto_6847276 ?auto_6847277 ) ( HAVE_IMAGE ?auto_6847278 ?auto_6847279 ) ( not ( = ?auto_6847272 ?auto_6847270 ) ) ( not ( = ?auto_6847272 ?auto_6847277 ) ) ( not ( = ?auto_6847272 ?auto_6847279 ) ) ( not ( = ?auto_6847270 ?auto_6847274 ) ) ( not ( = ?auto_6847270 ?auto_6847277 ) ) ( not ( = ?auto_6847270 ?auto_6847279 ) ) ( not ( = ?auto_6847274 ?auto_6847277 ) ) ( not ( = ?auto_6847274 ?auto_6847279 ) ) ( not ( = ?auto_6847276 ?auto_6847281 ) ) ( not ( = ?auto_6847277 ?auto_6847279 ) ) ( not ( = ?auto_6847278 ?auto_6847281 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6847271 ?auto_6847272 ?auto_6847275 ?auto_6847274 )
      ( GET-5IMAGE-VERIFY ?auto_6847271 ?auto_6847272 ?auto_6847273 ?auto_6847270 ?auto_6847275 ?auto_6847274 ?auto_6847276 ?auto_6847277 ?auto_6847278 ?auto_6847279 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6848078 - DIRECTION
      ?auto_6848079 - MODE
      ?auto_6848080 - DIRECTION
      ?auto_6848077 - MODE
      ?auto_6848082 - DIRECTION
      ?auto_6848081 - MODE
      ?auto_6848083 - DIRECTION
      ?auto_6848084 - MODE
      ?auto_6848085 - DIRECTION
      ?auto_6848086 - MODE
    )
    :vars
    (
      ?auto_6848087 - INSTRUMENT
      ?auto_6848089 - SATELLITE
      ?auto_6848088 - DIRECTION
      ?auto_6848090 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6848080 ?auto_6848078 ) ) ( not ( = ?auto_6848082 ?auto_6848078 ) ) ( not ( = ?auto_6848082 ?auto_6848080 ) ) ( not ( = ?auto_6848083 ?auto_6848078 ) ) ( not ( = ?auto_6848083 ?auto_6848080 ) ) ( not ( = ?auto_6848083 ?auto_6848082 ) ) ( not ( = ?auto_6848085 ?auto_6848078 ) ) ( not ( = ?auto_6848085 ?auto_6848080 ) ) ( not ( = ?auto_6848085 ?auto_6848082 ) ) ( not ( = ?auto_6848085 ?auto_6848083 ) ) ( ON_BOARD ?auto_6848087 ?auto_6848089 ) ( SUPPORTS ?auto_6848087 ?auto_6848077 ) ( not ( = ?auto_6848080 ?auto_6848088 ) ) ( HAVE_IMAGE ?auto_6848078 ?auto_6848079 ) ( not ( = ?auto_6848078 ?auto_6848088 ) ) ( not ( = ?auto_6848079 ?auto_6848077 ) ) ( CALIBRATION_TARGET ?auto_6848087 ?auto_6848088 ) ( POINTING ?auto_6848089 ?auto_6848085 ) ( not ( = ?auto_6848088 ?auto_6848085 ) ) ( ON_BOARD ?auto_6848090 ?auto_6848089 ) ( POWER_ON ?auto_6848090 ) ( not ( = ?auto_6848087 ?auto_6848090 ) ) ( HAVE_IMAGE ?auto_6848082 ?auto_6848081 ) ( HAVE_IMAGE ?auto_6848083 ?auto_6848084 ) ( HAVE_IMAGE ?auto_6848085 ?auto_6848086 ) ( not ( = ?auto_6848079 ?auto_6848081 ) ) ( not ( = ?auto_6848079 ?auto_6848084 ) ) ( not ( = ?auto_6848079 ?auto_6848086 ) ) ( not ( = ?auto_6848077 ?auto_6848081 ) ) ( not ( = ?auto_6848077 ?auto_6848084 ) ) ( not ( = ?auto_6848077 ?auto_6848086 ) ) ( not ( = ?auto_6848082 ?auto_6848088 ) ) ( not ( = ?auto_6848081 ?auto_6848084 ) ) ( not ( = ?auto_6848081 ?auto_6848086 ) ) ( not ( = ?auto_6848083 ?auto_6848088 ) ) ( not ( = ?auto_6848084 ?auto_6848086 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6848078 ?auto_6848079 ?auto_6848080 ?auto_6848077 )
      ( GET-5IMAGE-VERIFY ?auto_6848078 ?auto_6848079 ?auto_6848080 ?auto_6848077 ?auto_6848082 ?auto_6848081 ?auto_6848083 ?auto_6848084 ?auto_6848085 ?auto_6848086 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6848135 - DIRECTION
      ?auto_6848136 - MODE
      ?auto_6848137 - DIRECTION
      ?auto_6848134 - MODE
      ?auto_6848139 - DIRECTION
      ?auto_6848138 - MODE
      ?auto_6848140 - DIRECTION
      ?auto_6848141 - MODE
      ?auto_6848142 - DIRECTION
      ?auto_6848143 - MODE
    )
    :vars
    (
      ?auto_6848144 - INSTRUMENT
      ?auto_6848146 - SATELLITE
      ?auto_6848145 - DIRECTION
      ?auto_6848147 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6848137 ?auto_6848135 ) ) ( not ( = ?auto_6848139 ?auto_6848135 ) ) ( not ( = ?auto_6848139 ?auto_6848137 ) ) ( not ( = ?auto_6848140 ?auto_6848135 ) ) ( not ( = ?auto_6848140 ?auto_6848137 ) ) ( not ( = ?auto_6848140 ?auto_6848139 ) ) ( not ( = ?auto_6848142 ?auto_6848135 ) ) ( not ( = ?auto_6848142 ?auto_6848137 ) ) ( not ( = ?auto_6848142 ?auto_6848139 ) ) ( not ( = ?auto_6848142 ?auto_6848140 ) ) ( ON_BOARD ?auto_6848144 ?auto_6848146 ) ( SUPPORTS ?auto_6848144 ?auto_6848134 ) ( not ( = ?auto_6848137 ?auto_6848145 ) ) ( HAVE_IMAGE ?auto_6848135 ?auto_6848136 ) ( not ( = ?auto_6848135 ?auto_6848145 ) ) ( not ( = ?auto_6848136 ?auto_6848134 ) ) ( CALIBRATION_TARGET ?auto_6848144 ?auto_6848145 ) ( POINTING ?auto_6848146 ?auto_6848140 ) ( not ( = ?auto_6848145 ?auto_6848140 ) ) ( ON_BOARD ?auto_6848147 ?auto_6848146 ) ( POWER_ON ?auto_6848147 ) ( not ( = ?auto_6848144 ?auto_6848147 ) ) ( HAVE_IMAGE ?auto_6848139 ?auto_6848138 ) ( HAVE_IMAGE ?auto_6848140 ?auto_6848141 ) ( HAVE_IMAGE ?auto_6848142 ?auto_6848143 ) ( not ( = ?auto_6848136 ?auto_6848138 ) ) ( not ( = ?auto_6848136 ?auto_6848141 ) ) ( not ( = ?auto_6848136 ?auto_6848143 ) ) ( not ( = ?auto_6848134 ?auto_6848138 ) ) ( not ( = ?auto_6848134 ?auto_6848141 ) ) ( not ( = ?auto_6848134 ?auto_6848143 ) ) ( not ( = ?auto_6848139 ?auto_6848145 ) ) ( not ( = ?auto_6848138 ?auto_6848141 ) ) ( not ( = ?auto_6848138 ?auto_6848143 ) ) ( not ( = ?auto_6848141 ?auto_6848143 ) ) ( not ( = ?auto_6848142 ?auto_6848145 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6848135 ?auto_6848136 ?auto_6848137 ?auto_6848134 )
      ( GET-5IMAGE-VERIFY ?auto_6848135 ?auto_6848136 ?auto_6848137 ?auto_6848134 ?auto_6848139 ?auto_6848138 ?auto_6848140 ?auto_6848141 ?auto_6848142 ?auto_6848143 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6848707 - DIRECTION
      ?auto_6848708 - MODE
      ?auto_6848709 - DIRECTION
      ?auto_6848706 - MODE
      ?auto_6848711 - DIRECTION
      ?auto_6848710 - MODE
      ?auto_6848712 - DIRECTION
      ?auto_6848713 - MODE
      ?auto_6848714 - DIRECTION
      ?auto_6848715 - MODE
    )
    :vars
    (
      ?auto_6848716 - INSTRUMENT
      ?auto_6848718 - SATELLITE
      ?auto_6848717 - DIRECTION
      ?auto_6848719 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6848709 ?auto_6848707 ) ) ( not ( = ?auto_6848711 ?auto_6848707 ) ) ( not ( = ?auto_6848711 ?auto_6848709 ) ) ( not ( = ?auto_6848712 ?auto_6848707 ) ) ( not ( = ?auto_6848712 ?auto_6848709 ) ) ( not ( = ?auto_6848712 ?auto_6848711 ) ) ( not ( = ?auto_6848714 ?auto_6848707 ) ) ( not ( = ?auto_6848714 ?auto_6848709 ) ) ( not ( = ?auto_6848714 ?auto_6848711 ) ) ( not ( = ?auto_6848714 ?auto_6848712 ) ) ( ON_BOARD ?auto_6848716 ?auto_6848718 ) ( SUPPORTS ?auto_6848716 ?auto_6848706 ) ( not ( = ?auto_6848709 ?auto_6848717 ) ) ( HAVE_IMAGE ?auto_6848707 ?auto_6848708 ) ( not ( = ?auto_6848707 ?auto_6848717 ) ) ( not ( = ?auto_6848708 ?auto_6848706 ) ) ( CALIBRATION_TARGET ?auto_6848716 ?auto_6848717 ) ( POINTING ?auto_6848718 ?auto_6848711 ) ( not ( = ?auto_6848717 ?auto_6848711 ) ) ( ON_BOARD ?auto_6848719 ?auto_6848718 ) ( POWER_ON ?auto_6848719 ) ( not ( = ?auto_6848716 ?auto_6848719 ) ) ( HAVE_IMAGE ?auto_6848711 ?auto_6848710 ) ( HAVE_IMAGE ?auto_6848712 ?auto_6848713 ) ( HAVE_IMAGE ?auto_6848714 ?auto_6848715 ) ( not ( = ?auto_6848708 ?auto_6848710 ) ) ( not ( = ?auto_6848708 ?auto_6848713 ) ) ( not ( = ?auto_6848708 ?auto_6848715 ) ) ( not ( = ?auto_6848706 ?auto_6848710 ) ) ( not ( = ?auto_6848706 ?auto_6848713 ) ) ( not ( = ?auto_6848706 ?auto_6848715 ) ) ( not ( = ?auto_6848710 ?auto_6848713 ) ) ( not ( = ?auto_6848710 ?auto_6848715 ) ) ( not ( = ?auto_6848712 ?auto_6848717 ) ) ( not ( = ?auto_6848713 ?auto_6848715 ) ) ( not ( = ?auto_6848714 ?auto_6848717 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6848707 ?auto_6848708 ?auto_6848709 ?auto_6848706 )
      ( GET-5IMAGE-VERIFY ?auto_6848707 ?auto_6848708 ?auto_6848709 ?auto_6848706 ?auto_6848711 ?auto_6848710 ?auto_6848712 ?auto_6848713 ?auto_6848714 ?auto_6848715 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6860665 - DIRECTION
      ?auto_6860666 - MODE
      ?auto_6860667 - DIRECTION
      ?auto_6860664 - MODE
      ?auto_6860669 - DIRECTION
      ?auto_6860668 - MODE
      ?auto_6860670 - DIRECTION
      ?auto_6860671 - MODE
      ?auto_6860672 - DIRECTION
      ?auto_6860673 - MODE
    )
    :vars
    (
      ?auto_6860674 - INSTRUMENT
      ?auto_6860676 - SATELLITE
      ?auto_6860675 - DIRECTION
      ?auto_6860677 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6860667 ?auto_6860665 ) ) ( not ( = ?auto_6860669 ?auto_6860665 ) ) ( not ( = ?auto_6860669 ?auto_6860667 ) ) ( not ( = ?auto_6860670 ?auto_6860665 ) ) ( not ( = ?auto_6860670 ?auto_6860667 ) ) ( not ( = ?auto_6860670 ?auto_6860669 ) ) ( not ( = ?auto_6860672 ?auto_6860665 ) ) ( not ( = ?auto_6860672 ?auto_6860667 ) ) ( not ( = ?auto_6860672 ?auto_6860669 ) ) ( not ( = ?auto_6860672 ?auto_6860670 ) ) ( ON_BOARD ?auto_6860674 ?auto_6860676 ) ( SUPPORTS ?auto_6860674 ?auto_6860673 ) ( not ( = ?auto_6860672 ?auto_6860675 ) ) ( HAVE_IMAGE ?auto_6860667 ?auto_6860664 ) ( not ( = ?auto_6860667 ?auto_6860675 ) ) ( not ( = ?auto_6860664 ?auto_6860673 ) ) ( CALIBRATION_TARGET ?auto_6860674 ?auto_6860675 ) ( POINTING ?auto_6860676 ?auto_6860665 ) ( not ( = ?auto_6860675 ?auto_6860665 ) ) ( ON_BOARD ?auto_6860677 ?auto_6860676 ) ( POWER_ON ?auto_6860677 ) ( not ( = ?auto_6860674 ?auto_6860677 ) ) ( HAVE_IMAGE ?auto_6860665 ?auto_6860666 ) ( HAVE_IMAGE ?auto_6860669 ?auto_6860668 ) ( HAVE_IMAGE ?auto_6860670 ?auto_6860671 ) ( not ( = ?auto_6860666 ?auto_6860664 ) ) ( not ( = ?auto_6860666 ?auto_6860668 ) ) ( not ( = ?auto_6860666 ?auto_6860671 ) ) ( not ( = ?auto_6860666 ?auto_6860673 ) ) ( not ( = ?auto_6860664 ?auto_6860668 ) ) ( not ( = ?auto_6860664 ?auto_6860671 ) ) ( not ( = ?auto_6860669 ?auto_6860675 ) ) ( not ( = ?auto_6860668 ?auto_6860671 ) ) ( not ( = ?auto_6860668 ?auto_6860673 ) ) ( not ( = ?auto_6860670 ?auto_6860675 ) ) ( not ( = ?auto_6860671 ?auto_6860673 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6860667 ?auto_6860664 ?auto_6860672 ?auto_6860673 )
      ( GET-5IMAGE-VERIFY ?auto_6860665 ?auto_6860666 ?auto_6860667 ?auto_6860664 ?auto_6860669 ?auto_6860668 ?auto_6860670 ?auto_6860671 ?auto_6860672 ?auto_6860673 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6860721 - DIRECTION
      ?auto_6860722 - MODE
      ?auto_6860723 - DIRECTION
      ?auto_6860720 - MODE
      ?auto_6860725 - DIRECTION
      ?auto_6860724 - MODE
      ?auto_6860726 - DIRECTION
      ?auto_6860727 - MODE
      ?auto_6860728 - DIRECTION
      ?auto_6860729 - MODE
    )
    :vars
    (
      ?auto_6860730 - INSTRUMENT
      ?auto_6860732 - SATELLITE
      ?auto_6860731 - DIRECTION
      ?auto_6860733 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6860723 ?auto_6860721 ) ) ( not ( = ?auto_6860725 ?auto_6860721 ) ) ( not ( = ?auto_6860725 ?auto_6860723 ) ) ( not ( = ?auto_6860726 ?auto_6860721 ) ) ( not ( = ?auto_6860726 ?auto_6860723 ) ) ( not ( = ?auto_6860726 ?auto_6860725 ) ) ( not ( = ?auto_6860728 ?auto_6860721 ) ) ( not ( = ?auto_6860728 ?auto_6860723 ) ) ( not ( = ?auto_6860728 ?auto_6860725 ) ) ( not ( = ?auto_6860728 ?auto_6860726 ) ) ( ON_BOARD ?auto_6860730 ?auto_6860732 ) ( SUPPORTS ?auto_6860730 ?auto_6860727 ) ( not ( = ?auto_6860726 ?auto_6860731 ) ) ( HAVE_IMAGE ?auto_6860723 ?auto_6860720 ) ( not ( = ?auto_6860723 ?auto_6860731 ) ) ( not ( = ?auto_6860720 ?auto_6860727 ) ) ( CALIBRATION_TARGET ?auto_6860730 ?auto_6860731 ) ( POINTING ?auto_6860732 ?auto_6860721 ) ( not ( = ?auto_6860731 ?auto_6860721 ) ) ( ON_BOARD ?auto_6860733 ?auto_6860732 ) ( POWER_ON ?auto_6860733 ) ( not ( = ?auto_6860730 ?auto_6860733 ) ) ( HAVE_IMAGE ?auto_6860721 ?auto_6860722 ) ( HAVE_IMAGE ?auto_6860725 ?auto_6860724 ) ( HAVE_IMAGE ?auto_6860728 ?auto_6860729 ) ( not ( = ?auto_6860722 ?auto_6860720 ) ) ( not ( = ?auto_6860722 ?auto_6860724 ) ) ( not ( = ?auto_6860722 ?auto_6860727 ) ) ( not ( = ?auto_6860722 ?auto_6860729 ) ) ( not ( = ?auto_6860720 ?auto_6860724 ) ) ( not ( = ?auto_6860720 ?auto_6860729 ) ) ( not ( = ?auto_6860725 ?auto_6860731 ) ) ( not ( = ?auto_6860724 ?auto_6860727 ) ) ( not ( = ?auto_6860724 ?auto_6860729 ) ) ( not ( = ?auto_6860727 ?auto_6860729 ) ) ( not ( = ?auto_6860728 ?auto_6860731 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6860723 ?auto_6860720 ?auto_6860726 ?auto_6860727 )
      ( GET-5IMAGE-VERIFY ?auto_6860721 ?auto_6860722 ?auto_6860723 ?auto_6860720 ?auto_6860725 ?auto_6860724 ?auto_6860726 ?auto_6860727 ?auto_6860728 ?auto_6860729 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6861105 - DIRECTION
      ?auto_6861106 - MODE
      ?auto_6861107 - DIRECTION
      ?auto_6861104 - MODE
      ?auto_6861109 - DIRECTION
      ?auto_6861108 - MODE
      ?auto_6861110 - DIRECTION
      ?auto_6861111 - MODE
      ?auto_6861112 - DIRECTION
      ?auto_6861113 - MODE
    )
    :vars
    (
      ?auto_6861114 - INSTRUMENT
      ?auto_6861116 - SATELLITE
      ?auto_6861115 - DIRECTION
      ?auto_6861117 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6861107 ?auto_6861105 ) ) ( not ( = ?auto_6861109 ?auto_6861105 ) ) ( not ( = ?auto_6861109 ?auto_6861107 ) ) ( not ( = ?auto_6861110 ?auto_6861105 ) ) ( not ( = ?auto_6861110 ?auto_6861107 ) ) ( not ( = ?auto_6861110 ?auto_6861109 ) ) ( not ( = ?auto_6861112 ?auto_6861105 ) ) ( not ( = ?auto_6861112 ?auto_6861107 ) ) ( not ( = ?auto_6861112 ?auto_6861109 ) ) ( not ( = ?auto_6861112 ?auto_6861110 ) ) ( ON_BOARD ?auto_6861114 ?auto_6861116 ) ( SUPPORTS ?auto_6861114 ?auto_6861108 ) ( not ( = ?auto_6861109 ?auto_6861115 ) ) ( HAVE_IMAGE ?auto_6861107 ?auto_6861104 ) ( not ( = ?auto_6861107 ?auto_6861115 ) ) ( not ( = ?auto_6861104 ?auto_6861108 ) ) ( CALIBRATION_TARGET ?auto_6861114 ?auto_6861115 ) ( POINTING ?auto_6861116 ?auto_6861105 ) ( not ( = ?auto_6861115 ?auto_6861105 ) ) ( ON_BOARD ?auto_6861117 ?auto_6861116 ) ( POWER_ON ?auto_6861117 ) ( not ( = ?auto_6861114 ?auto_6861117 ) ) ( HAVE_IMAGE ?auto_6861105 ?auto_6861106 ) ( HAVE_IMAGE ?auto_6861110 ?auto_6861111 ) ( HAVE_IMAGE ?auto_6861112 ?auto_6861113 ) ( not ( = ?auto_6861106 ?auto_6861104 ) ) ( not ( = ?auto_6861106 ?auto_6861108 ) ) ( not ( = ?auto_6861106 ?auto_6861111 ) ) ( not ( = ?auto_6861106 ?auto_6861113 ) ) ( not ( = ?auto_6861104 ?auto_6861111 ) ) ( not ( = ?auto_6861104 ?auto_6861113 ) ) ( not ( = ?auto_6861108 ?auto_6861111 ) ) ( not ( = ?auto_6861108 ?auto_6861113 ) ) ( not ( = ?auto_6861110 ?auto_6861115 ) ) ( not ( = ?auto_6861111 ?auto_6861113 ) ) ( not ( = ?auto_6861112 ?auto_6861115 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6861107 ?auto_6861104 ?auto_6861109 ?auto_6861108 )
      ( GET-5IMAGE-VERIFY ?auto_6861105 ?auto_6861106 ?auto_6861107 ?auto_6861104 ?auto_6861109 ?auto_6861108 ?auto_6861110 ?auto_6861111 ?auto_6861112 ?auto_6861113 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6864187 - DIRECTION
      ?auto_6864188 - MODE
      ?auto_6864189 - DIRECTION
      ?auto_6864186 - MODE
      ?auto_6864191 - DIRECTION
      ?auto_6864190 - MODE
      ?auto_6864192 - DIRECTION
      ?auto_6864193 - MODE
      ?auto_6864194 - DIRECTION
      ?auto_6864195 - MODE
    )
    :vars
    (
      ?auto_6864196 - INSTRUMENT
      ?auto_6864198 - SATELLITE
      ?auto_6864197 - DIRECTION
      ?auto_6864199 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6864189 ?auto_6864187 ) ) ( not ( = ?auto_6864191 ?auto_6864187 ) ) ( not ( = ?auto_6864191 ?auto_6864189 ) ) ( not ( = ?auto_6864192 ?auto_6864187 ) ) ( not ( = ?auto_6864192 ?auto_6864189 ) ) ( not ( = ?auto_6864192 ?auto_6864191 ) ) ( not ( = ?auto_6864194 ?auto_6864187 ) ) ( not ( = ?auto_6864194 ?auto_6864189 ) ) ( not ( = ?auto_6864194 ?auto_6864191 ) ) ( not ( = ?auto_6864194 ?auto_6864192 ) ) ( ON_BOARD ?auto_6864196 ?auto_6864198 ) ( SUPPORTS ?auto_6864196 ?auto_6864186 ) ( not ( = ?auto_6864189 ?auto_6864197 ) ) ( HAVE_IMAGE ?auto_6864191 ?auto_6864190 ) ( not ( = ?auto_6864191 ?auto_6864197 ) ) ( not ( = ?auto_6864190 ?auto_6864186 ) ) ( CALIBRATION_TARGET ?auto_6864196 ?auto_6864197 ) ( POINTING ?auto_6864198 ?auto_6864187 ) ( not ( = ?auto_6864197 ?auto_6864187 ) ) ( ON_BOARD ?auto_6864199 ?auto_6864198 ) ( POWER_ON ?auto_6864199 ) ( not ( = ?auto_6864196 ?auto_6864199 ) ) ( HAVE_IMAGE ?auto_6864187 ?auto_6864188 ) ( HAVE_IMAGE ?auto_6864192 ?auto_6864193 ) ( HAVE_IMAGE ?auto_6864194 ?auto_6864195 ) ( not ( = ?auto_6864188 ?auto_6864186 ) ) ( not ( = ?auto_6864188 ?auto_6864190 ) ) ( not ( = ?auto_6864188 ?auto_6864193 ) ) ( not ( = ?auto_6864188 ?auto_6864195 ) ) ( not ( = ?auto_6864186 ?auto_6864193 ) ) ( not ( = ?auto_6864186 ?auto_6864195 ) ) ( not ( = ?auto_6864190 ?auto_6864193 ) ) ( not ( = ?auto_6864190 ?auto_6864195 ) ) ( not ( = ?auto_6864192 ?auto_6864197 ) ) ( not ( = ?auto_6864193 ?auto_6864195 ) ) ( not ( = ?auto_6864194 ?auto_6864197 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6864191 ?auto_6864190 ?auto_6864189 ?auto_6864186 )
      ( GET-5IMAGE-VERIFY ?auto_6864187 ?auto_6864188 ?auto_6864189 ?auto_6864186 ?auto_6864191 ?auto_6864190 ?auto_6864192 ?auto_6864193 ?auto_6864194 ?auto_6864195 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6866506 - DIRECTION
      ?auto_6866507 - MODE
      ?auto_6866508 - DIRECTION
      ?auto_6866505 - MODE
      ?auto_6866510 - DIRECTION
      ?auto_6866509 - MODE
      ?auto_6866511 - DIRECTION
      ?auto_6866512 - MODE
      ?auto_6866513 - DIRECTION
      ?auto_6866514 - MODE
    )
    :vars
    (
      ?auto_6866515 - INSTRUMENT
      ?auto_6866517 - SATELLITE
      ?auto_6866516 - DIRECTION
      ?auto_6866518 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6866508 ?auto_6866506 ) ) ( not ( = ?auto_6866510 ?auto_6866506 ) ) ( not ( = ?auto_6866510 ?auto_6866508 ) ) ( not ( = ?auto_6866511 ?auto_6866506 ) ) ( not ( = ?auto_6866511 ?auto_6866508 ) ) ( not ( = ?auto_6866511 ?auto_6866510 ) ) ( not ( = ?auto_6866513 ?auto_6866506 ) ) ( not ( = ?auto_6866513 ?auto_6866508 ) ) ( not ( = ?auto_6866513 ?auto_6866510 ) ) ( not ( = ?auto_6866513 ?auto_6866511 ) ) ( ON_BOARD ?auto_6866515 ?auto_6866517 ) ( SUPPORTS ?auto_6866515 ?auto_6866507 ) ( not ( = ?auto_6866506 ?auto_6866516 ) ) ( HAVE_IMAGE ?auto_6866508 ?auto_6866505 ) ( not ( = ?auto_6866508 ?auto_6866516 ) ) ( not ( = ?auto_6866505 ?auto_6866507 ) ) ( CALIBRATION_TARGET ?auto_6866515 ?auto_6866516 ) ( POINTING ?auto_6866517 ?auto_6866513 ) ( not ( = ?auto_6866516 ?auto_6866513 ) ) ( ON_BOARD ?auto_6866518 ?auto_6866517 ) ( POWER_ON ?auto_6866518 ) ( not ( = ?auto_6866515 ?auto_6866518 ) ) ( HAVE_IMAGE ?auto_6866510 ?auto_6866509 ) ( HAVE_IMAGE ?auto_6866511 ?auto_6866512 ) ( HAVE_IMAGE ?auto_6866513 ?auto_6866514 ) ( not ( = ?auto_6866507 ?auto_6866509 ) ) ( not ( = ?auto_6866507 ?auto_6866512 ) ) ( not ( = ?auto_6866507 ?auto_6866514 ) ) ( not ( = ?auto_6866505 ?auto_6866509 ) ) ( not ( = ?auto_6866505 ?auto_6866512 ) ) ( not ( = ?auto_6866505 ?auto_6866514 ) ) ( not ( = ?auto_6866510 ?auto_6866516 ) ) ( not ( = ?auto_6866509 ?auto_6866512 ) ) ( not ( = ?auto_6866509 ?auto_6866514 ) ) ( not ( = ?auto_6866511 ?auto_6866516 ) ) ( not ( = ?auto_6866512 ?auto_6866514 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6866508 ?auto_6866505 ?auto_6866506 ?auto_6866507 )
      ( GET-5IMAGE-VERIFY ?auto_6866506 ?auto_6866507 ?auto_6866508 ?auto_6866505 ?auto_6866510 ?auto_6866509 ?auto_6866511 ?auto_6866512 ?auto_6866513 ?auto_6866514 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6866563 - DIRECTION
      ?auto_6866564 - MODE
      ?auto_6866565 - DIRECTION
      ?auto_6866562 - MODE
      ?auto_6866567 - DIRECTION
      ?auto_6866566 - MODE
      ?auto_6866568 - DIRECTION
      ?auto_6866569 - MODE
      ?auto_6866570 - DIRECTION
      ?auto_6866571 - MODE
    )
    :vars
    (
      ?auto_6866572 - INSTRUMENT
      ?auto_6866574 - SATELLITE
      ?auto_6866573 - DIRECTION
      ?auto_6866575 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6866565 ?auto_6866563 ) ) ( not ( = ?auto_6866567 ?auto_6866563 ) ) ( not ( = ?auto_6866567 ?auto_6866565 ) ) ( not ( = ?auto_6866568 ?auto_6866563 ) ) ( not ( = ?auto_6866568 ?auto_6866565 ) ) ( not ( = ?auto_6866568 ?auto_6866567 ) ) ( not ( = ?auto_6866570 ?auto_6866563 ) ) ( not ( = ?auto_6866570 ?auto_6866565 ) ) ( not ( = ?auto_6866570 ?auto_6866567 ) ) ( not ( = ?auto_6866570 ?auto_6866568 ) ) ( ON_BOARD ?auto_6866572 ?auto_6866574 ) ( SUPPORTS ?auto_6866572 ?auto_6866564 ) ( not ( = ?auto_6866563 ?auto_6866573 ) ) ( HAVE_IMAGE ?auto_6866565 ?auto_6866562 ) ( not ( = ?auto_6866565 ?auto_6866573 ) ) ( not ( = ?auto_6866562 ?auto_6866564 ) ) ( CALIBRATION_TARGET ?auto_6866572 ?auto_6866573 ) ( POINTING ?auto_6866574 ?auto_6866568 ) ( not ( = ?auto_6866573 ?auto_6866568 ) ) ( ON_BOARD ?auto_6866575 ?auto_6866574 ) ( POWER_ON ?auto_6866575 ) ( not ( = ?auto_6866572 ?auto_6866575 ) ) ( HAVE_IMAGE ?auto_6866567 ?auto_6866566 ) ( HAVE_IMAGE ?auto_6866568 ?auto_6866569 ) ( HAVE_IMAGE ?auto_6866570 ?auto_6866571 ) ( not ( = ?auto_6866564 ?auto_6866566 ) ) ( not ( = ?auto_6866564 ?auto_6866569 ) ) ( not ( = ?auto_6866564 ?auto_6866571 ) ) ( not ( = ?auto_6866562 ?auto_6866566 ) ) ( not ( = ?auto_6866562 ?auto_6866569 ) ) ( not ( = ?auto_6866562 ?auto_6866571 ) ) ( not ( = ?auto_6866567 ?auto_6866573 ) ) ( not ( = ?auto_6866566 ?auto_6866569 ) ) ( not ( = ?auto_6866566 ?auto_6866571 ) ) ( not ( = ?auto_6866569 ?auto_6866571 ) ) ( not ( = ?auto_6866570 ?auto_6866573 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6866565 ?auto_6866562 ?auto_6866563 ?auto_6866564 )
      ( GET-5IMAGE-VERIFY ?auto_6866563 ?auto_6866564 ?auto_6866565 ?auto_6866562 ?auto_6866567 ?auto_6866566 ?auto_6866568 ?auto_6866569 ?auto_6866570 ?auto_6866571 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6867135 - DIRECTION
      ?auto_6867136 - MODE
      ?auto_6867137 - DIRECTION
      ?auto_6867134 - MODE
      ?auto_6867139 - DIRECTION
      ?auto_6867138 - MODE
      ?auto_6867140 - DIRECTION
      ?auto_6867141 - MODE
      ?auto_6867142 - DIRECTION
      ?auto_6867143 - MODE
    )
    :vars
    (
      ?auto_6867144 - INSTRUMENT
      ?auto_6867146 - SATELLITE
      ?auto_6867145 - DIRECTION
      ?auto_6867147 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6867137 ?auto_6867135 ) ) ( not ( = ?auto_6867139 ?auto_6867135 ) ) ( not ( = ?auto_6867139 ?auto_6867137 ) ) ( not ( = ?auto_6867140 ?auto_6867135 ) ) ( not ( = ?auto_6867140 ?auto_6867137 ) ) ( not ( = ?auto_6867140 ?auto_6867139 ) ) ( not ( = ?auto_6867142 ?auto_6867135 ) ) ( not ( = ?auto_6867142 ?auto_6867137 ) ) ( not ( = ?auto_6867142 ?auto_6867139 ) ) ( not ( = ?auto_6867142 ?auto_6867140 ) ) ( ON_BOARD ?auto_6867144 ?auto_6867146 ) ( SUPPORTS ?auto_6867144 ?auto_6867136 ) ( not ( = ?auto_6867135 ?auto_6867145 ) ) ( HAVE_IMAGE ?auto_6867137 ?auto_6867134 ) ( not ( = ?auto_6867137 ?auto_6867145 ) ) ( not ( = ?auto_6867134 ?auto_6867136 ) ) ( CALIBRATION_TARGET ?auto_6867144 ?auto_6867145 ) ( POINTING ?auto_6867146 ?auto_6867139 ) ( not ( = ?auto_6867145 ?auto_6867139 ) ) ( ON_BOARD ?auto_6867147 ?auto_6867146 ) ( POWER_ON ?auto_6867147 ) ( not ( = ?auto_6867144 ?auto_6867147 ) ) ( HAVE_IMAGE ?auto_6867139 ?auto_6867138 ) ( HAVE_IMAGE ?auto_6867140 ?auto_6867141 ) ( HAVE_IMAGE ?auto_6867142 ?auto_6867143 ) ( not ( = ?auto_6867136 ?auto_6867138 ) ) ( not ( = ?auto_6867136 ?auto_6867141 ) ) ( not ( = ?auto_6867136 ?auto_6867143 ) ) ( not ( = ?auto_6867134 ?auto_6867138 ) ) ( not ( = ?auto_6867134 ?auto_6867141 ) ) ( not ( = ?auto_6867134 ?auto_6867143 ) ) ( not ( = ?auto_6867138 ?auto_6867141 ) ) ( not ( = ?auto_6867138 ?auto_6867143 ) ) ( not ( = ?auto_6867140 ?auto_6867145 ) ) ( not ( = ?auto_6867141 ?auto_6867143 ) ) ( not ( = ?auto_6867142 ?auto_6867145 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6867137 ?auto_6867134 ?auto_6867135 ?auto_6867136 )
      ( GET-5IMAGE-VERIFY ?auto_6867135 ?auto_6867136 ?auto_6867137 ?auto_6867134 ?auto_6867139 ?auto_6867138 ?auto_6867140 ?auto_6867141 ?auto_6867142 ?auto_6867143 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_6871683 - DIRECTION
      ?auto_6871684 - MODE
      ?auto_6871685 - DIRECTION
      ?auto_6871682 - MODE
      ?auto_6871687 - DIRECTION
      ?auto_6871686 - MODE
      ?auto_6871688 - DIRECTION
      ?auto_6871689 - MODE
      ?auto_6871690 - DIRECTION
      ?auto_6871691 - MODE
    )
    :vars
    (
      ?auto_6871692 - INSTRUMENT
      ?auto_6871694 - SATELLITE
      ?auto_6871693 - DIRECTION
      ?auto_6871695 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6871685 ?auto_6871683 ) ) ( not ( = ?auto_6871687 ?auto_6871683 ) ) ( not ( = ?auto_6871687 ?auto_6871685 ) ) ( not ( = ?auto_6871688 ?auto_6871683 ) ) ( not ( = ?auto_6871688 ?auto_6871685 ) ) ( not ( = ?auto_6871688 ?auto_6871687 ) ) ( not ( = ?auto_6871690 ?auto_6871683 ) ) ( not ( = ?auto_6871690 ?auto_6871685 ) ) ( not ( = ?auto_6871690 ?auto_6871687 ) ) ( not ( = ?auto_6871690 ?auto_6871688 ) ) ( ON_BOARD ?auto_6871692 ?auto_6871694 ) ( SUPPORTS ?auto_6871692 ?auto_6871684 ) ( not ( = ?auto_6871683 ?auto_6871693 ) ) ( HAVE_IMAGE ?auto_6871687 ?auto_6871686 ) ( not ( = ?auto_6871687 ?auto_6871693 ) ) ( not ( = ?auto_6871686 ?auto_6871684 ) ) ( CALIBRATION_TARGET ?auto_6871692 ?auto_6871693 ) ( POINTING ?auto_6871694 ?auto_6871685 ) ( not ( = ?auto_6871693 ?auto_6871685 ) ) ( ON_BOARD ?auto_6871695 ?auto_6871694 ) ( POWER_ON ?auto_6871695 ) ( not ( = ?auto_6871692 ?auto_6871695 ) ) ( HAVE_IMAGE ?auto_6871685 ?auto_6871682 ) ( HAVE_IMAGE ?auto_6871688 ?auto_6871689 ) ( HAVE_IMAGE ?auto_6871690 ?auto_6871691 ) ( not ( = ?auto_6871684 ?auto_6871682 ) ) ( not ( = ?auto_6871684 ?auto_6871689 ) ) ( not ( = ?auto_6871684 ?auto_6871691 ) ) ( not ( = ?auto_6871682 ?auto_6871686 ) ) ( not ( = ?auto_6871682 ?auto_6871689 ) ) ( not ( = ?auto_6871682 ?auto_6871691 ) ) ( not ( = ?auto_6871686 ?auto_6871689 ) ) ( not ( = ?auto_6871686 ?auto_6871691 ) ) ( not ( = ?auto_6871688 ?auto_6871693 ) ) ( not ( = ?auto_6871689 ?auto_6871691 ) ) ( not ( = ?auto_6871690 ?auto_6871693 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6871687 ?auto_6871686 ?auto_6871683 ?auto_6871684 )
      ( GET-5IMAGE-VERIFY ?auto_6871683 ?auto_6871684 ?auto_6871685 ?auto_6871682 ?auto_6871687 ?auto_6871686 ?auto_6871688 ?auto_6871689 ?auto_6871690 ?auto_6871691 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6950898 - DIRECTION
      ?auto_6950899 - MODE
      ?auto_6950900 - DIRECTION
      ?auto_6950897 - MODE
      ?auto_6950902 - DIRECTION
      ?auto_6950901 - MODE
      ?auto_6950903 - DIRECTION
      ?auto_6950904 - MODE
    )
    :vars
    (
      ?auto_6950907 - INSTRUMENT
      ?auto_6950905 - SATELLITE
      ?auto_6950906 - DIRECTION
      ?auto_6950908 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6950900 ?auto_6950898 ) ) ( not ( = ?auto_6950902 ?auto_6950898 ) ) ( not ( = ?auto_6950902 ?auto_6950900 ) ) ( not ( = ?auto_6950903 ?auto_6950898 ) ) ( not ( = ?auto_6950903 ?auto_6950900 ) ) ( not ( = ?auto_6950903 ?auto_6950902 ) ) ( ON_BOARD ?auto_6950907 ?auto_6950905 ) ( SUPPORTS ?auto_6950907 ?auto_6950904 ) ( not ( = ?auto_6950903 ?auto_6950906 ) ) ( HAVE_IMAGE ?auto_6950898 ?auto_6950899 ) ( not ( = ?auto_6950898 ?auto_6950906 ) ) ( not ( = ?auto_6950899 ?auto_6950904 ) ) ( CALIBRATION_TARGET ?auto_6950907 ?auto_6950906 ) ( not ( = ?auto_6950906 ?auto_6950900 ) ) ( ON_BOARD ?auto_6950908 ?auto_6950905 ) ( POWER_ON ?auto_6950908 ) ( not ( = ?auto_6950907 ?auto_6950908 ) ) ( POINTING ?auto_6950905 ?auto_6950906 ) ( HAVE_IMAGE ?auto_6950900 ?auto_6950897 ) ( HAVE_IMAGE ?auto_6950902 ?auto_6950901 ) ( not ( = ?auto_6950899 ?auto_6950897 ) ) ( not ( = ?auto_6950899 ?auto_6950901 ) ) ( not ( = ?auto_6950897 ?auto_6950901 ) ) ( not ( = ?auto_6950897 ?auto_6950904 ) ) ( not ( = ?auto_6950902 ?auto_6950906 ) ) ( not ( = ?auto_6950901 ?auto_6950904 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6950898 ?auto_6950899 ?auto_6950903 ?auto_6950904 )
      ( GET-4IMAGE-VERIFY ?auto_6950898 ?auto_6950899 ?auto_6950900 ?auto_6950897 ?auto_6950902 ?auto_6950901 ?auto_6950903 ?auto_6950904 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6950946 - DIRECTION
      ?auto_6950947 - MODE
      ?auto_6950948 - DIRECTION
      ?auto_6950945 - MODE
      ?auto_6950950 - DIRECTION
      ?auto_6950949 - MODE
      ?auto_6950951 - DIRECTION
      ?auto_6950952 - MODE
    )
    :vars
    (
      ?auto_6950955 - INSTRUMENT
      ?auto_6950953 - SATELLITE
      ?auto_6950954 - DIRECTION
      ?auto_6950956 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6950948 ?auto_6950946 ) ) ( not ( = ?auto_6950950 ?auto_6950946 ) ) ( not ( = ?auto_6950950 ?auto_6950948 ) ) ( not ( = ?auto_6950951 ?auto_6950946 ) ) ( not ( = ?auto_6950951 ?auto_6950948 ) ) ( not ( = ?auto_6950951 ?auto_6950950 ) ) ( ON_BOARD ?auto_6950955 ?auto_6950953 ) ( SUPPORTS ?auto_6950955 ?auto_6950949 ) ( not ( = ?auto_6950950 ?auto_6950954 ) ) ( HAVE_IMAGE ?auto_6950946 ?auto_6950947 ) ( not ( = ?auto_6950946 ?auto_6950954 ) ) ( not ( = ?auto_6950947 ?auto_6950949 ) ) ( CALIBRATION_TARGET ?auto_6950955 ?auto_6950954 ) ( not ( = ?auto_6950954 ?auto_6950948 ) ) ( ON_BOARD ?auto_6950956 ?auto_6950953 ) ( POWER_ON ?auto_6950956 ) ( not ( = ?auto_6950955 ?auto_6950956 ) ) ( POINTING ?auto_6950953 ?auto_6950954 ) ( HAVE_IMAGE ?auto_6950948 ?auto_6950945 ) ( HAVE_IMAGE ?auto_6950951 ?auto_6950952 ) ( not ( = ?auto_6950947 ?auto_6950945 ) ) ( not ( = ?auto_6950947 ?auto_6950952 ) ) ( not ( = ?auto_6950945 ?auto_6950949 ) ) ( not ( = ?auto_6950945 ?auto_6950952 ) ) ( not ( = ?auto_6950949 ?auto_6950952 ) ) ( not ( = ?auto_6950951 ?auto_6950954 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6950946 ?auto_6950947 ?auto_6950950 ?auto_6950949 )
      ( GET-4IMAGE-VERIFY ?auto_6950946 ?auto_6950947 ?auto_6950948 ?auto_6950945 ?auto_6950950 ?auto_6950949 ?auto_6950951 ?auto_6950952 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6951292 - DIRECTION
      ?auto_6951293 - MODE
      ?auto_6951294 - DIRECTION
      ?auto_6951291 - MODE
      ?auto_6951296 - DIRECTION
      ?auto_6951295 - MODE
      ?auto_6951297 - DIRECTION
      ?auto_6951298 - MODE
    )
    :vars
    (
      ?auto_6951301 - INSTRUMENT
      ?auto_6951299 - SATELLITE
      ?auto_6951300 - DIRECTION
      ?auto_6951302 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6951294 ?auto_6951292 ) ) ( not ( = ?auto_6951296 ?auto_6951292 ) ) ( not ( = ?auto_6951296 ?auto_6951294 ) ) ( not ( = ?auto_6951297 ?auto_6951292 ) ) ( not ( = ?auto_6951297 ?auto_6951294 ) ) ( not ( = ?auto_6951297 ?auto_6951296 ) ) ( ON_BOARD ?auto_6951301 ?auto_6951299 ) ( SUPPORTS ?auto_6951301 ?auto_6951291 ) ( not ( = ?auto_6951294 ?auto_6951300 ) ) ( HAVE_IMAGE ?auto_6951292 ?auto_6951293 ) ( not ( = ?auto_6951292 ?auto_6951300 ) ) ( not ( = ?auto_6951293 ?auto_6951291 ) ) ( CALIBRATION_TARGET ?auto_6951301 ?auto_6951300 ) ( not ( = ?auto_6951300 ?auto_6951296 ) ) ( ON_BOARD ?auto_6951302 ?auto_6951299 ) ( POWER_ON ?auto_6951302 ) ( not ( = ?auto_6951301 ?auto_6951302 ) ) ( POINTING ?auto_6951299 ?auto_6951300 ) ( HAVE_IMAGE ?auto_6951296 ?auto_6951295 ) ( HAVE_IMAGE ?auto_6951297 ?auto_6951298 ) ( not ( = ?auto_6951293 ?auto_6951295 ) ) ( not ( = ?auto_6951293 ?auto_6951298 ) ) ( not ( = ?auto_6951291 ?auto_6951295 ) ) ( not ( = ?auto_6951291 ?auto_6951298 ) ) ( not ( = ?auto_6951295 ?auto_6951298 ) ) ( not ( = ?auto_6951297 ?auto_6951300 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6951292 ?auto_6951293 ?auto_6951294 ?auto_6951291 )
      ( GET-4IMAGE-VERIFY ?auto_6951292 ?auto_6951293 ?auto_6951294 ?auto_6951291 ?auto_6951296 ?auto_6951295 ?auto_6951297 ?auto_6951298 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6914154 - DIRECTION
      ?auto_6914155 - MODE
      ?auto_6914156 - DIRECTION
      ?auto_6914153 - MODE
      ?auto_6914158 - DIRECTION
      ?auto_6914157 - MODE
      ?auto_6914159 - DIRECTION
      ?auto_6914160 - MODE
    )
    :vars
    (
      ?auto_6914165 - INSTRUMENT
      ?auto_6914163 - SATELLITE
      ?auto_6914164 - DIRECTION
      ?auto_6914162 - DIRECTION
      ?auto_6914161 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6914156 ?auto_6914154 ) ) ( not ( = ?auto_6914158 ?auto_6914154 ) ) ( not ( = ?auto_6914158 ?auto_6914156 ) ) ( not ( = ?auto_6914159 ?auto_6914154 ) ) ( not ( = ?auto_6914159 ?auto_6914156 ) ) ( not ( = ?auto_6914159 ?auto_6914158 ) ) ( ON_BOARD ?auto_6914165 ?auto_6914163 ) ( SUPPORTS ?auto_6914165 ?auto_6914160 ) ( not ( = ?auto_6914159 ?auto_6914164 ) ) ( HAVE_IMAGE ?auto_6914156 ?auto_6914153 ) ( not ( = ?auto_6914156 ?auto_6914164 ) ) ( not ( = ?auto_6914153 ?auto_6914160 ) ) ( CALIBRATION_TARGET ?auto_6914165 ?auto_6914164 ) ( not ( = ?auto_6914164 ?auto_6914162 ) ) ( not ( = ?auto_6914159 ?auto_6914162 ) ) ( not ( = ?auto_6914156 ?auto_6914162 ) ) ( ON_BOARD ?auto_6914161 ?auto_6914163 ) ( POWER_ON ?auto_6914161 ) ( not ( = ?auto_6914165 ?auto_6914161 ) ) ( POINTING ?auto_6914163 ?auto_6914164 ) ( HAVE_IMAGE ?auto_6914154 ?auto_6914155 ) ( HAVE_IMAGE ?auto_6914158 ?auto_6914157 ) ( not ( = ?auto_6914154 ?auto_6914164 ) ) ( not ( = ?auto_6914154 ?auto_6914162 ) ) ( not ( = ?auto_6914155 ?auto_6914153 ) ) ( not ( = ?auto_6914155 ?auto_6914157 ) ) ( not ( = ?auto_6914155 ?auto_6914160 ) ) ( not ( = ?auto_6914153 ?auto_6914157 ) ) ( not ( = ?auto_6914158 ?auto_6914164 ) ) ( not ( = ?auto_6914158 ?auto_6914162 ) ) ( not ( = ?auto_6914157 ?auto_6914160 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6914156 ?auto_6914153 ?auto_6914159 ?auto_6914160 )
      ( GET-4IMAGE-VERIFY ?auto_6914154 ?auto_6914155 ?auto_6914156 ?auto_6914153 ?auto_6914158 ?auto_6914157 ?auto_6914159 ?auto_6914160 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6914205 - DIRECTION
      ?auto_6914206 - MODE
      ?auto_6914207 - DIRECTION
      ?auto_6914204 - MODE
      ?auto_6914209 - DIRECTION
      ?auto_6914208 - MODE
      ?auto_6914210 - DIRECTION
      ?auto_6914211 - MODE
    )
    :vars
    (
      ?auto_6914216 - INSTRUMENT
      ?auto_6914214 - SATELLITE
      ?auto_6914215 - DIRECTION
      ?auto_6914213 - DIRECTION
      ?auto_6914212 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6914207 ?auto_6914205 ) ) ( not ( = ?auto_6914209 ?auto_6914205 ) ) ( not ( = ?auto_6914209 ?auto_6914207 ) ) ( not ( = ?auto_6914210 ?auto_6914205 ) ) ( not ( = ?auto_6914210 ?auto_6914207 ) ) ( not ( = ?auto_6914210 ?auto_6914209 ) ) ( ON_BOARD ?auto_6914216 ?auto_6914214 ) ( SUPPORTS ?auto_6914216 ?auto_6914208 ) ( not ( = ?auto_6914209 ?auto_6914215 ) ) ( HAVE_IMAGE ?auto_6914207 ?auto_6914204 ) ( not ( = ?auto_6914207 ?auto_6914215 ) ) ( not ( = ?auto_6914204 ?auto_6914208 ) ) ( CALIBRATION_TARGET ?auto_6914216 ?auto_6914215 ) ( not ( = ?auto_6914215 ?auto_6914213 ) ) ( not ( = ?auto_6914209 ?auto_6914213 ) ) ( not ( = ?auto_6914207 ?auto_6914213 ) ) ( ON_BOARD ?auto_6914212 ?auto_6914214 ) ( POWER_ON ?auto_6914212 ) ( not ( = ?auto_6914216 ?auto_6914212 ) ) ( POINTING ?auto_6914214 ?auto_6914215 ) ( HAVE_IMAGE ?auto_6914205 ?auto_6914206 ) ( HAVE_IMAGE ?auto_6914210 ?auto_6914211 ) ( not ( = ?auto_6914205 ?auto_6914215 ) ) ( not ( = ?auto_6914205 ?auto_6914213 ) ) ( not ( = ?auto_6914206 ?auto_6914204 ) ) ( not ( = ?auto_6914206 ?auto_6914208 ) ) ( not ( = ?auto_6914206 ?auto_6914211 ) ) ( not ( = ?auto_6914204 ?auto_6914211 ) ) ( not ( = ?auto_6914208 ?auto_6914211 ) ) ( not ( = ?auto_6914210 ?auto_6914215 ) ) ( not ( = ?auto_6914210 ?auto_6914213 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6914207 ?auto_6914204 ?auto_6914209 ?auto_6914208 )
      ( GET-4IMAGE-VERIFY ?auto_6914205 ?auto_6914206 ?auto_6914207 ?auto_6914204 ?auto_6914209 ?auto_6914208 ?auto_6914210 ?auto_6914211 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6914372 - DIRECTION
      ?auto_6914373 - MODE
      ?auto_6914374 - DIRECTION
      ?auto_6914371 - MODE
      ?auto_6914376 - DIRECTION
      ?auto_6914375 - MODE
      ?auto_6914377 - DIRECTION
      ?auto_6914378 - MODE
    )
    :vars
    (
      ?auto_6914383 - INSTRUMENT
      ?auto_6914381 - SATELLITE
      ?auto_6914382 - DIRECTION
      ?auto_6914380 - DIRECTION
      ?auto_6914379 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6914374 ?auto_6914372 ) ) ( not ( = ?auto_6914376 ?auto_6914372 ) ) ( not ( = ?auto_6914376 ?auto_6914374 ) ) ( not ( = ?auto_6914377 ?auto_6914372 ) ) ( not ( = ?auto_6914377 ?auto_6914374 ) ) ( not ( = ?auto_6914377 ?auto_6914376 ) ) ( ON_BOARD ?auto_6914383 ?auto_6914381 ) ( SUPPORTS ?auto_6914383 ?auto_6914378 ) ( not ( = ?auto_6914377 ?auto_6914382 ) ) ( HAVE_IMAGE ?auto_6914376 ?auto_6914375 ) ( not ( = ?auto_6914376 ?auto_6914382 ) ) ( not ( = ?auto_6914375 ?auto_6914378 ) ) ( CALIBRATION_TARGET ?auto_6914383 ?auto_6914382 ) ( not ( = ?auto_6914382 ?auto_6914380 ) ) ( not ( = ?auto_6914377 ?auto_6914380 ) ) ( not ( = ?auto_6914376 ?auto_6914380 ) ) ( ON_BOARD ?auto_6914379 ?auto_6914381 ) ( POWER_ON ?auto_6914379 ) ( not ( = ?auto_6914383 ?auto_6914379 ) ) ( POINTING ?auto_6914381 ?auto_6914382 ) ( HAVE_IMAGE ?auto_6914372 ?auto_6914373 ) ( HAVE_IMAGE ?auto_6914374 ?auto_6914371 ) ( not ( = ?auto_6914372 ?auto_6914382 ) ) ( not ( = ?auto_6914372 ?auto_6914380 ) ) ( not ( = ?auto_6914373 ?auto_6914371 ) ) ( not ( = ?auto_6914373 ?auto_6914375 ) ) ( not ( = ?auto_6914373 ?auto_6914378 ) ) ( not ( = ?auto_6914374 ?auto_6914382 ) ) ( not ( = ?auto_6914374 ?auto_6914380 ) ) ( not ( = ?auto_6914371 ?auto_6914375 ) ) ( not ( = ?auto_6914371 ?auto_6914378 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6914376 ?auto_6914375 ?auto_6914377 ?auto_6914378 )
      ( GET-4IMAGE-VERIFY ?auto_6914372 ?auto_6914373 ?auto_6914374 ?auto_6914371 ?auto_6914376 ?auto_6914375 ?auto_6914377 ?auto_6914378 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6914429 - DIRECTION
      ?auto_6914430 - MODE
      ?auto_6914431 - DIRECTION
      ?auto_6914428 - MODE
      ?auto_6914433 - DIRECTION
      ?auto_6914432 - MODE
      ?auto_6914434 - DIRECTION
      ?auto_6914435 - MODE
    )
    :vars
    (
      ?auto_6914440 - INSTRUMENT
      ?auto_6914438 - SATELLITE
      ?auto_6914439 - DIRECTION
      ?auto_6914437 - DIRECTION
      ?auto_6914436 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6914431 ?auto_6914429 ) ) ( not ( = ?auto_6914433 ?auto_6914429 ) ) ( not ( = ?auto_6914433 ?auto_6914431 ) ) ( not ( = ?auto_6914434 ?auto_6914429 ) ) ( not ( = ?auto_6914434 ?auto_6914431 ) ) ( not ( = ?auto_6914434 ?auto_6914433 ) ) ( ON_BOARD ?auto_6914440 ?auto_6914438 ) ( SUPPORTS ?auto_6914440 ?auto_6914432 ) ( not ( = ?auto_6914433 ?auto_6914439 ) ) ( HAVE_IMAGE ?auto_6914434 ?auto_6914435 ) ( not ( = ?auto_6914434 ?auto_6914439 ) ) ( not ( = ?auto_6914435 ?auto_6914432 ) ) ( CALIBRATION_TARGET ?auto_6914440 ?auto_6914439 ) ( not ( = ?auto_6914439 ?auto_6914437 ) ) ( not ( = ?auto_6914433 ?auto_6914437 ) ) ( not ( = ?auto_6914434 ?auto_6914437 ) ) ( ON_BOARD ?auto_6914436 ?auto_6914438 ) ( POWER_ON ?auto_6914436 ) ( not ( = ?auto_6914440 ?auto_6914436 ) ) ( POINTING ?auto_6914438 ?auto_6914439 ) ( HAVE_IMAGE ?auto_6914429 ?auto_6914430 ) ( HAVE_IMAGE ?auto_6914431 ?auto_6914428 ) ( not ( = ?auto_6914429 ?auto_6914439 ) ) ( not ( = ?auto_6914429 ?auto_6914437 ) ) ( not ( = ?auto_6914430 ?auto_6914428 ) ) ( not ( = ?auto_6914430 ?auto_6914432 ) ) ( not ( = ?auto_6914430 ?auto_6914435 ) ) ( not ( = ?auto_6914431 ?auto_6914439 ) ) ( not ( = ?auto_6914431 ?auto_6914437 ) ) ( not ( = ?auto_6914428 ?auto_6914432 ) ) ( not ( = ?auto_6914428 ?auto_6914435 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6914434 ?auto_6914435 ?auto_6914433 ?auto_6914432 )
      ( GET-4IMAGE-VERIFY ?auto_6914429 ?auto_6914430 ?auto_6914431 ?auto_6914428 ?auto_6914433 ?auto_6914432 ?auto_6914434 ?auto_6914435 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6914649 - DIRECTION
      ?auto_6914650 - MODE
      ?auto_6914651 - DIRECTION
      ?auto_6914648 - MODE
      ?auto_6914653 - DIRECTION
      ?auto_6914652 - MODE
      ?auto_6914654 - DIRECTION
      ?auto_6914655 - MODE
    )
    :vars
    (
      ?auto_6914660 - INSTRUMENT
      ?auto_6914658 - SATELLITE
      ?auto_6914659 - DIRECTION
      ?auto_6914657 - DIRECTION
      ?auto_6914656 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6914651 ?auto_6914649 ) ) ( not ( = ?auto_6914653 ?auto_6914649 ) ) ( not ( = ?auto_6914653 ?auto_6914651 ) ) ( not ( = ?auto_6914654 ?auto_6914649 ) ) ( not ( = ?auto_6914654 ?auto_6914651 ) ) ( not ( = ?auto_6914654 ?auto_6914653 ) ) ( ON_BOARD ?auto_6914660 ?auto_6914658 ) ( SUPPORTS ?auto_6914660 ?auto_6914648 ) ( not ( = ?auto_6914651 ?auto_6914659 ) ) ( HAVE_IMAGE ?auto_6914653 ?auto_6914652 ) ( not ( = ?auto_6914653 ?auto_6914659 ) ) ( not ( = ?auto_6914652 ?auto_6914648 ) ) ( CALIBRATION_TARGET ?auto_6914660 ?auto_6914659 ) ( not ( = ?auto_6914659 ?auto_6914657 ) ) ( not ( = ?auto_6914651 ?auto_6914657 ) ) ( not ( = ?auto_6914653 ?auto_6914657 ) ) ( ON_BOARD ?auto_6914656 ?auto_6914658 ) ( POWER_ON ?auto_6914656 ) ( not ( = ?auto_6914660 ?auto_6914656 ) ) ( POINTING ?auto_6914658 ?auto_6914659 ) ( HAVE_IMAGE ?auto_6914649 ?auto_6914650 ) ( HAVE_IMAGE ?auto_6914654 ?auto_6914655 ) ( not ( = ?auto_6914649 ?auto_6914659 ) ) ( not ( = ?auto_6914649 ?auto_6914657 ) ) ( not ( = ?auto_6914650 ?auto_6914648 ) ) ( not ( = ?auto_6914650 ?auto_6914652 ) ) ( not ( = ?auto_6914650 ?auto_6914655 ) ) ( not ( = ?auto_6914648 ?auto_6914655 ) ) ( not ( = ?auto_6914652 ?auto_6914655 ) ) ( not ( = ?auto_6914654 ?auto_6914659 ) ) ( not ( = ?auto_6914654 ?auto_6914657 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6914653 ?auto_6914652 ?auto_6914651 ?auto_6914648 )
      ( GET-4IMAGE-VERIFY ?auto_6914649 ?auto_6914650 ?auto_6914651 ?auto_6914648 ?auto_6914653 ?auto_6914652 ?auto_6914654 ?auto_6914655 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6914759 - DIRECTION
      ?auto_6914760 - MODE
      ?auto_6914761 - DIRECTION
      ?auto_6914758 - MODE
      ?auto_6914763 - DIRECTION
      ?auto_6914762 - MODE
      ?auto_6914764 - DIRECTION
      ?auto_6914765 - MODE
    )
    :vars
    (
      ?auto_6914770 - INSTRUMENT
      ?auto_6914768 - SATELLITE
      ?auto_6914769 - DIRECTION
      ?auto_6914767 - DIRECTION
      ?auto_6914766 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6914761 ?auto_6914759 ) ) ( not ( = ?auto_6914763 ?auto_6914759 ) ) ( not ( = ?auto_6914763 ?auto_6914761 ) ) ( not ( = ?auto_6914764 ?auto_6914759 ) ) ( not ( = ?auto_6914764 ?auto_6914761 ) ) ( not ( = ?auto_6914764 ?auto_6914763 ) ) ( ON_BOARD ?auto_6914770 ?auto_6914768 ) ( SUPPORTS ?auto_6914770 ?auto_6914758 ) ( not ( = ?auto_6914761 ?auto_6914769 ) ) ( HAVE_IMAGE ?auto_6914764 ?auto_6914765 ) ( not ( = ?auto_6914764 ?auto_6914769 ) ) ( not ( = ?auto_6914765 ?auto_6914758 ) ) ( CALIBRATION_TARGET ?auto_6914770 ?auto_6914769 ) ( not ( = ?auto_6914769 ?auto_6914767 ) ) ( not ( = ?auto_6914761 ?auto_6914767 ) ) ( not ( = ?auto_6914764 ?auto_6914767 ) ) ( ON_BOARD ?auto_6914766 ?auto_6914768 ) ( POWER_ON ?auto_6914766 ) ( not ( = ?auto_6914770 ?auto_6914766 ) ) ( POINTING ?auto_6914768 ?auto_6914769 ) ( HAVE_IMAGE ?auto_6914759 ?auto_6914760 ) ( HAVE_IMAGE ?auto_6914763 ?auto_6914762 ) ( not ( = ?auto_6914759 ?auto_6914769 ) ) ( not ( = ?auto_6914759 ?auto_6914767 ) ) ( not ( = ?auto_6914760 ?auto_6914758 ) ) ( not ( = ?auto_6914760 ?auto_6914762 ) ) ( not ( = ?auto_6914760 ?auto_6914765 ) ) ( not ( = ?auto_6914758 ?auto_6914762 ) ) ( not ( = ?auto_6914763 ?auto_6914769 ) ) ( not ( = ?auto_6914763 ?auto_6914767 ) ) ( not ( = ?auto_6914762 ?auto_6914765 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6914764 ?auto_6914765 ?auto_6914761 ?auto_6914758 )
      ( GET-4IMAGE-VERIFY ?auto_6914759 ?auto_6914760 ?auto_6914761 ?auto_6914758 ?auto_6914763 ?auto_6914762 ?auto_6914764 ?auto_6914765 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6954048 - DIRECTION
      ?auto_6954049 - MODE
      ?auto_6954050 - DIRECTION
      ?auto_6954047 - MODE
      ?auto_6954052 - DIRECTION
      ?auto_6954051 - MODE
      ?auto_6954053 - DIRECTION
      ?auto_6954054 - MODE
    )
    :vars
    (
      ?auto_6954057 - INSTRUMENT
      ?auto_6954055 - SATELLITE
      ?auto_6954056 - DIRECTION
      ?auto_6954058 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6954050 ?auto_6954048 ) ) ( not ( = ?auto_6954052 ?auto_6954048 ) ) ( not ( = ?auto_6954052 ?auto_6954050 ) ) ( not ( = ?auto_6954053 ?auto_6954048 ) ) ( not ( = ?auto_6954053 ?auto_6954050 ) ) ( not ( = ?auto_6954053 ?auto_6954052 ) ) ( ON_BOARD ?auto_6954057 ?auto_6954055 ) ( SUPPORTS ?auto_6954057 ?auto_6954049 ) ( not ( = ?auto_6954048 ?auto_6954056 ) ) ( HAVE_IMAGE ?auto_6954050 ?auto_6954047 ) ( not ( = ?auto_6954050 ?auto_6954056 ) ) ( not ( = ?auto_6954047 ?auto_6954049 ) ) ( CALIBRATION_TARGET ?auto_6954057 ?auto_6954056 ) ( not ( = ?auto_6954056 ?auto_6954052 ) ) ( ON_BOARD ?auto_6954058 ?auto_6954055 ) ( POWER_ON ?auto_6954058 ) ( not ( = ?auto_6954057 ?auto_6954058 ) ) ( POINTING ?auto_6954055 ?auto_6954056 ) ( HAVE_IMAGE ?auto_6954052 ?auto_6954051 ) ( HAVE_IMAGE ?auto_6954053 ?auto_6954054 ) ( not ( = ?auto_6954049 ?auto_6954051 ) ) ( not ( = ?auto_6954049 ?auto_6954054 ) ) ( not ( = ?auto_6954047 ?auto_6954051 ) ) ( not ( = ?auto_6954047 ?auto_6954054 ) ) ( not ( = ?auto_6954051 ?auto_6954054 ) ) ( not ( = ?auto_6954053 ?auto_6954056 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6954050 ?auto_6954047 ?auto_6954048 ?auto_6954049 )
      ( GET-4IMAGE-VERIFY ?auto_6954048 ?auto_6954049 ?auto_6954050 ?auto_6954047 ?auto_6954052 ?auto_6954051 ?auto_6954053 ?auto_6954054 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6916962 - DIRECTION
      ?auto_6916963 - MODE
      ?auto_6916964 - DIRECTION
      ?auto_6916961 - MODE
      ?auto_6916966 - DIRECTION
      ?auto_6916965 - MODE
      ?auto_6916967 - DIRECTION
      ?auto_6916968 - MODE
    )
    :vars
    (
      ?auto_6916973 - INSTRUMENT
      ?auto_6916971 - SATELLITE
      ?auto_6916972 - DIRECTION
      ?auto_6916970 - DIRECTION
      ?auto_6916969 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6916964 ?auto_6916962 ) ) ( not ( = ?auto_6916966 ?auto_6916962 ) ) ( not ( = ?auto_6916966 ?auto_6916964 ) ) ( not ( = ?auto_6916967 ?auto_6916962 ) ) ( not ( = ?auto_6916967 ?auto_6916964 ) ) ( not ( = ?auto_6916967 ?auto_6916966 ) ) ( ON_BOARD ?auto_6916973 ?auto_6916971 ) ( SUPPORTS ?auto_6916973 ?auto_6916963 ) ( not ( = ?auto_6916962 ?auto_6916972 ) ) ( HAVE_IMAGE ?auto_6916966 ?auto_6916965 ) ( not ( = ?auto_6916966 ?auto_6916972 ) ) ( not ( = ?auto_6916965 ?auto_6916963 ) ) ( CALIBRATION_TARGET ?auto_6916973 ?auto_6916972 ) ( not ( = ?auto_6916972 ?auto_6916970 ) ) ( not ( = ?auto_6916962 ?auto_6916970 ) ) ( not ( = ?auto_6916966 ?auto_6916970 ) ) ( ON_BOARD ?auto_6916969 ?auto_6916971 ) ( POWER_ON ?auto_6916969 ) ( not ( = ?auto_6916973 ?auto_6916969 ) ) ( POINTING ?auto_6916971 ?auto_6916972 ) ( HAVE_IMAGE ?auto_6916964 ?auto_6916961 ) ( HAVE_IMAGE ?auto_6916967 ?auto_6916968 ) ( not ( = ?auto_6916963 ?auto_6916961 ) ) ( not ( = ?auto_6916963 ?auto_6916968 ) ) ( not ( = ?auto_6916964 ?auto_6916972 ) ) ( not ( = ?auto_6916964 ?auto_6916970 ) ) ( not ( = ?auto_6916961 ?auto_6916965 ) ) ( not ( = ?auto_6916961 ?auto_6916968 ) ) ( not ( = ?auto_6916965 ?auto_6916968 ) ) ( not ( = ?auto_6916967 ?auto_6916972 ) ) ( not ( = ?auto_6916967 ?auto_6916970 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6916966 ?auto_6916965 ?auto_6916962 ?auto_6916963 )
      ( GET-4IMAGE-VERIFY ?auto_6916962 ?auto_6916963 ?auto_6916964 ?auto_6916961 ?auto_6916966 ?auto_6916965 ?auto_6916967 ?auto_6916968 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_6917072 - DIRECTION
      ?auto_6917073 - MODE
      ?auto_6917074 - DIRECTION
      ?auto_6917071 - MODE
      ?auto_6917076 - DIRECTION
      ?auto_6917075 - MODE
      ?auto_6917077 - DIRECTION
      ?auto_6917078 - MODE
    )
    :vars
    (
      ?auto_6917083 - INSTRUMENT
      ?auto_6917081 - SATELLITE
      ?auto_6917082 - DIRECTION
      ?auto_6917080 - DIRECTION
      ?auto_6917079 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_6917074 ?auto_6917072 ) ) ( not ( = ?auto_6917076 ?auto_6917072 ) ) ( not ( = ?auto_6917076 ?auto_6917074 ) ) ( not ( = ?auto_6917077 ?auto_6917072 ) ) ( not ( = ?auto_6917077 ?auto_6917074 ) ) ( not ( = ?auto_6917077 ?auto_6917076 ) ) ( ON_BOARD ?auto_6917083 ?auto_6917081 ) ( SUPPORTS ?auto_6917083 ?auto_6917073 ) ( not ( = ?auto_6917072 ?auto_6917082 ) ) ( HAVE_IMAGE ?auto_6917077 ?auto_6917078 ) ( not ( = ?auto_6917077 ?auto_6917082 ) ) ( not ( = ?auto_6917078 ?auto_6917073 ) ) ( CALIBRATION_TARGET ?auto_6917083 ?auto_6917082 ) ( not ( = ?auto_6917082 ?auto_6917080 ) ) ( not ( = ?auto_6917072 ?auto_6917080 ) ) ( not ( = ?auto_6917077 ?auto_6917080 ) ) ( ON_BOARD ?auto_6917079 ?auto_6917081 ) ( POWER_ON ?auto_6917079 ) ( not ( = ?auto_6917083 ?auto_6917079 ) ) ( POINTING ?auto_6917081 ?auto_6917082 ) ( HAVE_IMAGE ?auto_6917074 ?auto_6917071 ) ( HAVE_IMAGE ?auto_6917076 ?auto_6917075 ) ( not ( = ?auto_6917073 ?auto_6917071 ) ) ( not ( = ?auto_6917073 ?auto_6917075 ) ) ( not ( = ?auto_6917074 ?auto_6917082 ) ) ( not ( = ?auto_6917074 ?auto_6917080 ) ) ( not ( = ?auto_6917071 ?auto_6917075 ) ) ( not ( = ?auto_6917071 ?auto_6917078 ) ) ( not ( = ?auto_6917076 ?auto_6917082 ) ) ( not ( = ?auto_6917076 ?auto_6917080 ) ) ( not ( = ?auto_6917075 ?auto_6917078 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_6917077 ?auto_6917078 ?auto_6917072 ?auto_6917073 )
      ( GET-4IMAGE-VERIFY ?auto_6917072 ?auto_6917073 ?auto_6917074 ?auto_6917071 ?auto_6917076 ?auto_6917075 ?auto_6917077 ?auto_6917078 ) )
  )

)

