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
      ?auto_12896 - DIRECTION
      ?auto_12897 - MODE
    )
    :vars
    (
      ?auto_12898 - INSTRUMENT
      ?auto_12899 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_12898 ) ( ON_BOARD ?auto_12898 ?auto_12899 ) ( SUPPORTS ?auto_12898 ?auto_12897 ) ( POWER_ON ?auto_12898 ) ( POINTING ?auto_12899 ?auto_12896 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_12899 ?auto_12896 ?auto_12898 ?auto_12897 )
      ( GET-1IMAGE-VERIFY ?auto_12896 ?auto_12897 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_12914 - DIRECTION
      ?auto_12915 - MODE
    )
    :vars
    (
      ?auto_12916 - INSTRUMENT
      ?auto_12917 - SATELLITE
      ?auto_12918 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_12916 ) ( ON_BOARD ?auto_12916 ?auto_12917 ) ( SUPPORTS ?auto_12916 ?auto_12915 ) ( POWER_ON ?auto_12916 ) ( POINTING ?auto_12917 ?auto_12918 ) ( not ( = ?auto_12914 ?auto_12918 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_12917 ?auto_12914 ?auto_12918 )
      ( GET-1IMAGE ?auto_12914 ?auto_12915 )
      ( GET-1IMAGE-VERIFY ?auto_12914 ?auto_12915 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_12935 - DIRECTION
      ?auto_12936 - MODE
    )
    :vars
    (
      ?auto_12938 - INSTRUMENT
      ?auto_12939 - SATELLITE
      ?auto_12937 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_12938 ?auto_12939 ) ( SUPPORTS ?auto_12938 ?auto_12936 ) ( POWER_ON ?auto_12938 ) ( POINTING ?auto_12939 ?auto_12937 ) ( not ( = ?auto_12935 ?auto_12937 ) ) ( CALIBRATION_TARGET ?auto_12938 ?auto_12937 ) ( NOT_CALIBRATED ?auto_12938 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_12939 ?auto_12938 ?auto_12937 )
      ( GET-1IMAGE ?auto_12935 ?auto_12936 )
      ( GET-1IMAGE-VERIFY ?auto_12935 ?auto_12936 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_12956 - DIRECTION
      ?auto_12957 - MODE
    )
    :vars
    (
      ?auto_12960 - INSTRUMENT
      ?auto_12959 - SATELLITE
      ?auto_12958 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_12960 ?auto_12959 ) ( SUPPORTS ?auto_12960 ?auto_12957 ) ( POINTING ?auto_12959 ?auto_12958 ) ( not ( = ?auto_12956 ?auto_12958 ) ) ( CALIBRATION_TARGET ?auto_12960 ?auto_12958 ) ( POWER_AVAIL ?auto_12959 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_12960 ?auto_12959 )
      ( GET-1IMAGE ?auto_12956 ?auto_12957 )
      ( GET-1IMAGE-VERIFY ?auto_12956 ?auto_12957 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_12977 - DIRECTION
      ?auto_12978 - MODE
    )
    :vars
    (
      ?auto_12981 - INSTRUMENT
      ?auto_12979 - SATELLITE
      ?auto_12980 - DIRECTION
      ?auto_12982 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_12981 ?auto_12979 ) ( SUPPORTS ?auto_12981 ?auto_12978 ) ( not ( = ?auto_12977 ?auto_12980 ) ) ( CALIBRATION_TARGET ?auto_12981 ?auto_12980 ) ( POWER_AVAIL ?auto_12979 ) ( POINTING ?auto_12979 ?auto_12982 ) ( not ( = ?auto_12980 ?auto_12982 ) ) ( not ( = ?auto_12977 ?auto_12982 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_12979 ?auto_12980 ?auto_12982 )
      ( GET-1IMAGE ?auto_12977 ?auto_12978 )
      ( GET-1IMAGE-VERIFY ?auto_12977 ?auto_12978 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13062 - DIRECTION
      ?auto_13063 - MODE
      ?auto_13064 - DIRECTION
      ?auto_13061 - MODE
    )
    :vars
    (
      ?auto_13066 - INSTRUMENT
      ?auto_13065 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_13064 ?auto_13062 ) ) ( CALIBRATED ?auto_13066 ) ( ON_BOARD ?auto_13066 ?auto_13065 ) ( SUPPORTS ?auto_13066 ?auto_13061 ) ( POWER_ON ?auto_13066 ) ( POINTING ?auto_13065 ?auto_13064 ) ( HAVE_IMAGE ?auto_13062 ?auto_13063 ) ( not ( = ?auto_13063 ?auto_13061 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13064 ?auto_13061 )
      ( GET-2IMAGE-VERIFY ?auto_13062 ?auto_13063 ?auto_13064 ?auto_13061 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13068 - DIRECTION
      ?auto_13069 - MODE
      ?auto_13070 - DIRECTION
      ?auto_13067 - MODE
    )
    :vars
    (
      ?auto_13072 - INSTRUMENT
      ?auto_13071 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_13070 ?auto_13068 ) ) ( CALIBRATED ?auto_13072 ) ( ON_BOARD ?auto_13072 ?auto_13071 ) ( SUPPORTS ?auto_13072 ?auto_13069 ) ( POWER_ON ?auto_13072 ) ( POINTING ?auto_13071 ?auto_13068 ) ( HAVE_IMAGE ?auto_13070 ?auto_13067 ) ( not ( = ?auto_13069 ?auto_13067 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13068 ?auto_13069 )
      ( GET-2IMAGE-VERIFY ?auto_13068 ?auto_13069 ?auto_13070 ?auto_13067 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13141 - DIRECTION
      ?auto_13142 - MODE
      ?auto_13143 - DIRECTION
      ?auto_13140 - MODE
    )
    :vars
    (
      ?auto_13145 - INSTRUMENT
      ?auto_13146 - SATELLITE
      ?auto_13144 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_13143 ?auto_13141 ) ) ( CALIBRATED ?auto_13145 ) ( ON_BOARD ?auto_13145 ?auto_13146 ) ( SUPPORTS ?auto_13145 ?auto_13140 ) ( POWER_ON ?auto_13145 ) ( POINTING ?auto_13146 ?auto_13144 ) ( not ( = ?auto_13143 ?auto_13144 ) ) ( HAVE_IMAGE ?auto_13141 ?auto_13142 ) ( not ( = ?auto_13141 ?auto_13144 ) ) ( not ( = ?auto_13142 ?auto_13140 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13143 ?auto_13140 )
      ( GET-2IMAGE-VERIFY ?auto_13141 ?auto_13142 ?auto_13143 ?auto_13140 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13148 - DIRECTION
      ?auto_13149 - MODE
      ?auto_13150 - DIRECTION
      ?auto_13147 - MODE
    )
    :vars
    (
      ?auto_13153 - INSTRUMENT
      ?auto_13151 - SATELLITE
      ?auto_13152 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_13150 ?auto_13148 ) ) ( CALIBRATED ?auto_13153 ) ( ON_BOARD ?auto_13153 ?auto_13151 ) ( SUPPORTS ?auto_13153 ?auto_13149 ) ( POWER_ON ?auto_13153 ) ( POINTING ?auto_13151 ?auto_13152 ) ( not ( = ?auto_13148 ?auto_13152 ) ) ( HAVE_IMAGE ?auto_13150 ?auto_13147 ) ( not ( = ?auto_13150 ?auto_13152 ) ) ( not ( = ?auto_13147 ?auto_13149 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13150 ?auto_13147 ?auto_13148 ?auto_13149 )
      ( GET-2IMAGE-VERIFY ?auto_13148 ?auto_13149 ?auto_13150 ?auto_13147 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_13228 - DIRECTION
      ?auto_13229 - MODE
    )
    :vars
    (
      ?auto_13234 - DIRECTION
      ?auto_13233 - INSTRUMENT
      ?auto_13231 - SATELLITE
      ?auto_13232 - DIRECTION
      ?auto_13230 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_13228 ?auto_13234 ) ) ( ON_BOARD ?auto_13233 ?auto_13231 ) ( SUPPORTS ?auto_13233 ?auto_13229 ) ( POWER_ON ?auto_13233 ) ( POINTING ?auto_13231 ?auto_13232 ) ( not ( = ?auto_13228 ?auto_13232 ) ) ( HAVE_IMAGE ?auto_13234 ?auto_13230 ) ( not ( = ?auto_13234 ?auto_13232 ) ) ( not ( = ?auto_13230 ?auto_13229 ) ) ( CALIBRATION_TARGET ?auto_13233 ?auto_13232 ) ( NOT_CALIBRATED ?auto_13233 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_13231 ?auto_13233 ?auto_13232 )
      ( GET-2IMAGE ?auto_13234 ?auto_13230 ?auto_13228 ?auto_13229 )
      ( GET-1IMAGE-VERIFY ?auto_13228 ?auto_13229 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13236 - DIRECTION
      ?auto_13237 - MODE
      ?auto_13238 - DIRECTION
      ?auto_13235 - MODE
    )
    :vars
    (
      ?auto_13241 - INSTRUMENT
      ?auto_13239 - SATELLITE
      ?auto_13240 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_13238 ?auto_13236 ) ) ( ON_BOARD ?auto_13241 ?auto_13239 ) ( SUPPORTS ?auto_13241 ?auto_13235 ) ( POWER_ON ?auto_13241 ) ( POINTING ?auto_13239 ?auto_13240 ) ( not ( = ?auto_13238 ?auto_13240 ) ) ( HAVE_IMAGE ?auto_13236 ?auto_13237 ) ( not ( = ?auto_13236 ?auto_13240 ) ) ( not ( = ?auto_13237 ?auto_13235 ) ) ( CALIBRATION_TARGET ?auto_13241 ?auto_13240 ) ( NOT_CALIBRATED ?auto_13241 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13238 ?auto_13235 )
      ( GET-2IMAGE-VERIFY ?auto_13236 ?auto_13237 ?auto_13238 ?auto_13235 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13243 - DIRECTION
      ?auto_13244 - MODE
      ?auto_13245 - DIRECTION
      ?auto_13242 - MODE
    )
    :vars
    (
      ?auto_13247 - INSTRUMENT
      ?auto_13248 - SATELLITE
      ?auto_13246 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_13245 ?auto_13243 ) ) ( ON_BOARD ?auto_13247 ?auto_13248 ) ( SUPPORTS ?auto_13247 ?auto_13244 ) ( POWER_ON ?auto_13247 ) ( POINTING ?auto_13248 ?auto_13246 ) ( not ( = ?auto_13243 ?auto_13246 ) ) ( HAVE_IMAGE ?auto_13245 ?auto_13242 ) ( not ( = ?auto_13245 ?auto_13246 ) ) ( not ( = ?auto_13242 ?auto_13244 ) ) ( CALIBRATION_TARGET ?auto_13247 ?auto_13246 ) ( NOT_CALIBRATED ?auto_13247 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13245 ?auto_13242 ?auto_13243 ?auto_13244 )
      ( GET-2IMAGE-VERIFY ?auto_13243 ?auto_13244 ?auto_13245 ?auto_13242 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_13323 - DIRECTION
      ?auto_13324 - MODE
    )
    :vars
    (
      ?auto_13326 - DIRECTION
      ?auto_13327 - INSTRUMENT
      ?auto_13328 - SATELLITE
      ?auto_13325 - DIRECTION
      ?auto_13329 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_13323 ?auto_13326 ) ) ( ON_BOARD ?auto_13327 ?auto_13328 ) ( SUPPORTS ?auto_13327 ?auto_13324 ) ( POINTING ?auto_13328 ?auto_13325 ) ( not ( = ?auto_13323 ?auto_13325 ) ) ( HAVE_IMAGE ?auto_13326 ?auto_13329 ) ( not ( = ?auto_13326 ?auto_13325 ) ) ( not ( = ?auto_13329 ?auto_13324 ) ) ( CALIBRATION_TARGET ?auto_13327 ?auto_13325 ) ( POWER_AVAIL ?auto_13328 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_13327 ?auto_13328 )
      ( GET-2IMAGE ?auto_13326 ?auto_13329 ?auto_13323 ?auto_13324 )
      ( GET-1IMAGE-VERIFY ?auto_13323 ?auto_13324 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13331 - DIRECTION
      ?auto_13332 - MODE
      ?auto_13333 - DIRECTION
      ?auto_13330 - MODE
    )
    :vars
    (
      ?auto_13334 - INSTRUMENT
      ?auto_13336 - SATELLITE
      ?auto_13335 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_13333 ?auto_13331 ) ) ( ON_BOARD ?auto_13334 ?auto_13336 ) ( SUPPORTS ?auto_13334 ?auto_13330 ) ( POINTING ?auto_13336 ?auto_13335 ) ( not ( = ?auto_13333 ?auto_13335 ) ) ( HAVE_IMAGE ?auto_13331 ?auto_13332 ) ( not ( = ?auto_13331 ?auto_13335 ) ) ( not ( = ?auto_13332 ?auto_13330 ) ) ( CALIBRATION_TARGET ?auto_13334 ?auto_13335 ) ( POWER_AVAIL ?auto_13336 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13333 ?auto_13330 )
      ( GET-2IMAGE-VERIFY ?auto_13331 ?auto_13332 ?auto_13333 ?auto_13330 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13338 - DIRECTION
      ?auto_13339 - MODE
      ?auto_13340 - DIRECTION
      ?auto_13337 - MODE
    )
    :vars
    (
      ?auto_13343 - INSTRUMENT
      ?auto_13341 - SATELLITE
      ?auto_13342 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_13340 ?auto_13338 ) ) ( ON_BOARD ?auto_13343 ?auto_13341 ) ( SUPPORTS ?auto_13343 ?auto_13339 ) ( POINTING ?auto_13341 ?auto_13342 ) ( not ( = ?auto_13338 ?auto_13342 ) ) ( HAVE_IMAGE ?auto_13340 ?auto_13337 ) ( not ( = ?auto_13340 ?auto_13342 ) ) ( not ( = ?auto_13337 ?auto_13339 ) ) ( CALIBRATION_TARGET ?auto_13343 ?auto_13342 ) ( POWER_AVAIL ?auto_13341 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13340 ?auto_13337 ?auto_13338 ?auto_13339 )
      ( GET-2IMAGE-VERIFY ?auto_13338 ?auto_13339 ?auto_13340 ?auto_13337 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_13418 - DIRECTION
      ?auto_13419 - MODE
    )
    :vars
    (
      ?auto_13423 - DIRECTION
      ?auto_13424 - INSTRUMENT
      ?auto_13421 - SATELLITE
      ?auto_13422 - DIRECTION
      ?auto_13420 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_13418 ?auto_13423 ) ) ( ON_BOARD ?auto_13424 ?auto_13421 ) ( SUPPORTS ?auto_13424 ?auto_13419 ) ( not ( = ?auto_13418 ?auto_13422 ) ) ( HAVE_IMAGE ?auto_13423 ?auto_13420 ) ( not ( = ?auto_13423 ?auto_13422 ) ) ( not ( = ?auto_13420 ?auto_13419 ) ) ( CALIBRATION_TARGET ?auto_13424 ?auto_13422 ) ( POWER_AVAIL ?auto_13421 ) ( POINTING ?auto_13421 ?auto_13423 ) )
    :subtasks
    ( ( !TURN_TO ?auto_13421 ?auto_13422 ?auto_13423 )
      ( GET-2IMAGE ?auto_13423 ?auto_13420 ?auto_13418 ?auto_13419 )
      ( GET-1IMAGE-VERIFY ?auto_13418 ?auto_13419 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13426 - DIRECTION
      ?auto_13427 - MODE
      ?auto_13428 - DIRECTION
      ?auto_13425 - MODE
    )
    :vars
    (
      ?auto_13429 - INSTRUMENT
      ?auto_13430 - SATELLITE
      ?auto_13431 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_13428 ?auto_13426 ) ) ( ON_BOARD ?auto_13429 ?auto_13430 ) ( SUPPORTS ?auto_13429 ?auto_13425 ) ( not ( = ?auto_13428 ?auto_13431 ) ) ( HAVE_IMAGE ?auto_13426 ?auto_13427 ) ( not ( = ?auto_13426 ?auto_13431 ) ) ( not ( = ?auto_13427 ?auto_13425 ) ) ( CALIBRATION_TARGET ?auto_13429 ?auto_13431 ) ( POWER_AVAIL ?auto_13430 ) ( POINTING ?auto_13430 ?auto_13426 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13428 ?auto_13425 )
      ( GET-2IMAGE-VERIFY ?auto_13426 ?auto_13427 ?auto_13428 ?auto_13425 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13433 - DIRECTION
      ?auto_13434 - MODE
      ?auto_13435 - DIRECTION
      ?auto_13432 - MODE
    )
    :vars
    (
      ?auto_13436 - INSTRUMENT
      ?auto_13438 - SATELLITE
      ?auto_13437 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_13435 ?auto_13433 ) ) ( ON_BOARD ?auto_13436 ?auto_13438 ) ( SUPPORTS ?auto_13436 ?auto_13434 ) ( not ( = ?auto_13433 ?auto_13437 ) ) ( HAVE_IMAGE ?auto_13435 ?auto_13432 ) ( not ( = ?auto_13435 ?auto_13437 ) ) ( not ( = ?auto_13432 ?auto_13434 ) ) ( CALIBRATION_TARGET ?auto_13436 ?auto_13437 ) ( POWER_AVAIL ?auto_13438 ) ( POINTING ?auto_13438 ?auto_13435 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13435 ?auto_13432 ?auto_13433 ?auto_13434 )
      ( GET-2IMAGE-VERIFY ?auto_13433 ?auto_13434 ?auto_13435 ?auto_13432 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_13513 - DIRECTION
      ?auto_13514 - MODE
    )
    :vars
    (
      ?auto_13515 - DIRECTION
      ?auto_13516 - INSTRUMENT
      ?auto_13518 - SATELLITE
      ?auto_13517 - DIRECTION
      ?auto_13519 - MODE
      ?auto_13520 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13513 ?auto_13515 ) ) ( ON_BOARD ?auto_13516 ?auto_13518 ) ( SUPPORTS ?auto_13516 ?auto_13514 ) ( not ( = ?auto_13513 ?auto_13517 ) ) ( HAVE_IMAGE ?auto_13515 ?auto_13519 ) ( not ( = ?auto_13515 ?auto_13517 ) ) ( not ( = ?auto_13519 ?auto_13514 ) ) ( CALIBRATION_TARGET ?auto_13516 ?auto_13517 ) ( POINTING ?auto_13518 ?auto_13515 ) ( ON_BOARD ?auto_13520 ?auto_13518 ) ( POWER_ON ?auto_13520 ) ( not ( = ?auto_13516 ?auto_13520 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_13520 ?auto_13518 )
      ( GET-2IMAGE ?auto_13515 ?auto_13519 ?auto_13513 ?auto_13514 )
      ( GET-1IMAGE-VERIFY ?auto_13513 ?auto_13514 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13522 - DIRECTION
      ?auto_13523 - MODE
      ?auto_13524 - DIRECTION
      ?auto_13521 - MODE
    )
    :vars
    (
      ?auto_13525 - INSTRUMENT
      ?auto_13526 - SATELLITE
      ?auto_13527 - DIRECTION
      ?auto_13528 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13524 ?auto_13522 ) ) ( ON_BOARD ?auto_13525 ?auto_13526 ) ( SUPPORTS ?auto_13525 ?auto_13521 ) ( not ( = ?auto_13524 ?auto_13527 ) ) ( HAVE_IMAGE ?auto_13522 ?auto_13523 ) ( not ( = ?auto_13522 ?auto_13527 ) ) ( not ( = ?auto_13523 ?auto_13521 ) ) ( CALIBRATION_TARGET ?auto_13525 ?auto_13527 ) ( POINTING ?auto_13526 ?auto_13522 ) ( ON_BOARD ?auto_13528 ?auto_13526 ) ( POWER_ON ?auto_13528 ) ( not ( = ?auto_13525 ?auto_13528 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13524 ?auto_13521 )
      ( GET-2IMAGE-VERIFY ?auto_13522 ?auto_13523 ?auto_13524 ?auto_13521 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13530 - DIRECTION
      ?auto_13531 - MODE
      ?auto_13532 - DIRECTION
      ?auto_13529 - MODE
    )
    :vars
    (
      ?auto_13536 - INSTRUMENT
      ?auto_13534 - SATELLITE
      ?auto_13533 - DIRECTION
      ?auto_13535 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13532 ?auto_13530 ) ) ( ON_BOARD ?auto_13536 ?auto_13534 ) ( SUPPORTS ?auto_13536 ?auto_13531 ) ( not ( = ?auto_13530 ?auto_13533 ) ) ( HAVE_IMAGE ?auto_13532 ?auto_13529 ) ( not ( = ?auto_13532 ?auto_13533 ) ) ( not ( = ?auto_13529 ?auto_13531 ) ) ( CALIBRATION_TARGET ?auto_13536 ?auto_13533 ) ( POINTING ?auto_13534 ?auto_13532 ) ( ON_BOARD ?auto_13535 ?auto_13534 ) ( POWER_ON ?auto_13535 ) ( not ( = ?auto_13536 ?auto_13535 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13532 ?auto_13529 ?auto_13530 ?auto_13531 )
      ( GET-2IMAGE-VERIFY ?auto_13530 ?auto_13531 ?auto_13532 ?auto_13529 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_13619 - DIRECTION
      ?auto_13620 - MODE
    )
    :vars
    (
      ?auto_13625 - DIRECTION
      ?auto_13624 - INSTRUMENT
      ?auto_13622 - SATELLITE
      ?auto_13621 - DIRECTION
      ?auto_13626 - MODE
      ?auto_13623 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13619 ?auto_13625 ) ) ( ON_BOARD ?auto_13624 ?auto_13622 ) ( SUPPORTS ?auto_13624 ?auto_13620 ) ( not ( = ?auto_13619 ?auto_13621 ) ) ( not ( = ?auto_13625 ?auto_13621 ) ) ( not ( = ?auto_13626 ?auto_13620 ) ) ( CALIBRATION_TARGET ?auto_13624 ?auto_13621 ) ( POINTING ?auto_13622 ?auto_13625 ) ( ON_BOARD ?auto_13623 ?auto_13622 ) ( POWER_ON ?auto_13623 ) ( not ( = ?auto_13624 ?auto_13623 ) ) ( CALIBRATED ?auto_13623 ) ( SUPPORTS ?auto_13623 ?auto_13626 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13625 ?auto_13626 )
      ( GET-2IMAGE ?auto_13625 ?auto_13626 ?auto_13619 ?auto_13620 )
      ( GET-1IMAGE-VERIFY ?auto_13619 ?auto_13620 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13628 - DIRECTION
      ?auto_13629 - MODE
      ?auto_13630 - DIRECTION
      ?auto_13627 - MODE
    )
    :vars
    (
      ?auto_13632 - INSTRUMENT
      ?auto_13631 - SATELLITE
      ?auto_13634 - DIRECTION
      ?auto_13633 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13630 ?auto_13628 ) ) ( ON_BOARD ?auto_13632 ?auto_13631 ) ( SUPPORTS ?auto_13632 ?auto_13627 ) ( not ( = ?auto_13630 ?auto_13634 ) ) ( not ( = ?auto_13628 ?auto_13634 ) ) ( not ( = ?auto_13629 ?auto_13627 ) ) ( CALIBRATION_TARGET ?auto_13632 ?auto_13634 ) ( POINTING ?auto_13631 ?auto_13628 ) ( ON_BOARD ?auto_13633 ?auto_13631 ) ( POWER_ON ?auto_13633 ) ( not ( = ?auto_13632 ?auto_13633 ) ) ( CALIBRATED ?auto_13633 ) ( SUPPORTS ?auto_13633 ?auto_13629 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13630 ?auto_13627 )
      ( GET-2IMAGE-VERIFY ?auto_13628 ?auto_13629 ?auto_13630 ?auto_13627 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13636 - DIRECTION
      ?auto_13637 - MODE
      ?auto_13638 - DIRECTION
      ?auto_13635 - MODE
    )
    :vars
    (
      ?auto_13642 - INSTRUMENT
      ?auto_13641 - SATELLITE
      ?auto_13639 - DIRECTION
      ?auto_13640 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13638 ?auto_13636 ) ) ( ON_BOARD ?auto_13642 ?auto_13641 ) ( SUPPORTS ?auto_13642 ?auto_13637 ) ( not ( = ?auto_13636 ?auto_13639 ) ) ( not ( = ?auto_13638 ?auto_13639 ) ) ( not ( = ?auto_13635 ?auto_13637 ) ) ( CALIBRATION_TARGET ?auto_13642 ?auto_13639 ) ( POINTING ?auto_13641 ?auto_13638 ) ( ON_BOARD ?auto_13640 ?auto_13641 ) ( POWER_ON ?auto_13640 ) ( not ( = ?auto_13642 ?auto_13640 ) ) ( CALIBRATED ?auto_13640 ) ( SUPPORTS ?auto_13640 ?auto_13635 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13638 ?auto_13635 ?auto_13636 ?auto_13637 )
      ( GET-2IMAGE-VERIFY ?auto_13636 ?auto_13637 ?auto_13638 ?auto_13635 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_13725 - DIRECTION
      ?auto_13726 - MODE
    )
    :vars
    (
      ?auto_13731 - DIRECTION
      ?auto_13730 - INSTRUMENT
      ?auto_13729 - SATELLITE
      ?auto_13727 - DIRECTION
      ?auto_13732 - MODE
      ?auto_13728 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13725 ?auto_13731 ) ) ( ON_BOARD ?auto_13730 ?auto_13729 ) ( SUPPORTS ?auto_13730 ?auto_13726 ) ( not ( = ?auto_13725 ?auto_13727 ) ) ( not ( = ?auto_13731 ?auto_13727 ) ) ( not ( = ?auto_13732 ?auto_13726 ) ) ( CALIBRATION_TARGET ?auto_13730 ?auto_13727 ) ( ON_BOARD ?auto_13728 ?auto_13729 ) ( POWER_ON ?auto_13728 ) ( not ( = ?auto_13730 ?auto_13728 ) ) ( CALIBRATED ?auto_13728 ) ( SUPPORTS ?auto_13728 ?auto_13732 ) ( POINTING ?auto_13729 ?auto_13727 ) )
    :subtasks
    ( ( !TURN_TO ?auto_13729 ?auto_13731 ?auto_13727 )
      ( GET-2IMAGE ?auto_13731 ?auto_13732 ?auto_13725 ?auto_13726 )
      ( GET-1IMAGE-VERIFY ?auto_13725 ?auto_13726 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13734 - DIRECTION
      ?auto_13735 - MODE
      ?auto_13736 - DIRECTION
      ?auto_13733 - MODE
    )
    :vars
    (
      ?auto_13738 - INSTRUMENT
      ?auto_13737 - SATELLITE
      ?auto_13740 - DIRECTION
      ?auto_13739 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13736 ?auto_13734 ) ) ( ON_BOARD ?auto_13738 ?auto_13737 ) ( SUPPORTS ?auto_13738 ?auto_13733 ) ( not ( = ?auto_13736 ?auto_13740 ) ) ( not ( = ?auto_13734 ?auto_13740 ) ) ( not ( = ?auto_13735 ?auto_13733 ) ) ( CALIBRATION_TARGET ?auto_13738 ?auto_13740 ) ( ON_BOARD ?auto_13739 ?auto_13737 ) ( POWER_ON ?auto_13739 ) ( not ( = ?auto_13738 ?auto_13739 ) ) ( CALIBRATED ?auto_13739 ) ( SUPPORTS ?auto_13739 ?auto_13735 ) ( POINTING ?auto_13737 ?auto_13740 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13736 ?auto_13733 )
      ( GET-2IMAGE-VERIFY ?auto_13734 ?auto_13735 ?auto_13736 ?auto_13733 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13742 - DIRECTION
      ?auto_13743 - MODE
      ?auto_13744 - DIRECTION
      ?auto_13741 - MODE
    )
    :vars
    (
      ?auto_13746 - INSTRUMENT
      ?auto_13745 - SATELLITE
      ?auto_13747 - DIRECTION
      ?auto_13748 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13744 ?auto_13742 ) ) ( ON_BOARD ?auto_13746 ?auto_13745 ) ( SUPPORTS ?auto_13746 ?auto_13743 ) ( not ( = ?auto_13742 ?auto_13747 ) ) ( not ( = ?auto_13744 ?auto_13747 ) ) ( not ( = ?auto_13741 ?auto_13743 ) ) ( CALIBRATION_TARGET ?auto_13746 ?auto_13747 ) ( ON_BOARD ?auto_13748 ?auto_13745 ) ( POWER_ON ?auto_13748 ) ( not ( = ?auto_13746 ?auto_13748 ) ) ( CALIBRATED ?auto_13748 ) ( SUPPORTS ?auto_13748 ?auto_13741 ) ( POINTING ?auto_13745 ?auto_13747 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13744 ?auto_13741 ?auto_13742 ?auto_13743 )
      ( GET-2IMAGE-VERIFY ?auto_13742 ?auto_13743 ?auto_13744 ?auto_13741 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_13831 - DIRECTION
      ?auto_13832 - MODE
    )
    :vars
    (
      ?auto_13837 - DIRECTION
      ?auto_13834 - INSTRUMENT
      ?auto_13833 - SATELLITE
      ?auto_13835 - DIRECTION
      ?auto_13838 - MODE
      ?auto_13836 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13831 ?auto_13837 ) ) ( ON_BOARD ?auto_13834 ?auto_13833 ) ( SUPPORTS ?auto_13834 ?auto_13832 ) ( not ( = ?auto_13831 ?auto_13835 ) ) ( not ( = ?auto_13837 ?auto_13835 ) ) ( not ( = ?auto_13838 ?auto_13832 ) ) ( CALIBRATION_TARGET ?auto_13834 ?auto_13835 ) ( ON_BOARD ?auto_13836 ?auto_13833 ) ( POWER_ON ?auto_13836 ) ( not ( = ?auto_13834 ?auto_13836 ) ) ( SUPPORTS ?auto_13836 ?auto_13838 ) ( POINTING ?auto_13833 ?auto_13835 ) ( CALIBRATION_TARGET ?auto_13836 ?auto_13835 ) ( NOT_CALIBRATED ?auto_13836 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_13833 ?auto_13836 ?auto_13835 )
      ( GET-2IMAGE ?auto_13837 ?auto_13838 ?auto_13831 ?auto_13832 )
      ( GET-1IMAGE-VERIFY ?auto_13831 ?auto_13832 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13840 - DIRECTION
      ?auto_13841 - MODE
      ?auto_13842 - DIRECTION
      ?auto_13839 - MODE
    )
    :vars
    (
      ?auto_13845 - INSTRUMENT
      ?auto_13846 - SATELLITE
      ?auto_13843 - DIRECTION
      ?auto_13844 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13842 ?auto_13840 ) ) ( ON_BOARD ?auto_13845 ?auto_13846 ) ( SUPPORTS ?auto_13845 ?auto_13839 ) ( not ( = ?auto_13842 ?auto_13843 ) ) ( not ( = ?auto_13840 ?auto_13843 ) ) ( not ( = ?auto_13841 ?auto_13839 ) ) ( CALIBRATION_TARGET ?auto_13845 ?auto_13843 ) ( ON_BOARD ?auto_13844 ?auto_13846 ) ( POWER_ON ?auto_13844 ) ( not ( = ?auto_13845 ?auto_13844 ) ) ( SUPPORTS ?auto_13844 ?auto_13841 ) ( POINTING ?auto_13846 ?auto_13843 ) ( CALIBRATION_TARGET ?auto_13844 ?auto_13843 ) ( NOT_CALIBRATED ?auto_13844 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_13842 ?auto_13839 )
      ( GET-2IMAGE-VERIFY ?auto_13840 ?auto_13841 ?auto_13842 ?auto_13839 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_13848 - DIRECTION
      ?auto_13849 - MODE
      ?auto_13850 - DIRECTION
      ?auto_13847 - MODE
    )
    :vars
    (
      ?auto_13852 - INSTRUMENT
      ?auto_13851 - SATELLITE
      ?auto_13854 - DIRECTION
      ?auto_13853 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_13850 ?auto_13848 ) ) ( ON_BOARD ?auto_13852 ?auto_13851 ) ( SUPPORTS ?auto_13852 ?auto_13849 ) ( not ( = ?auto_13848 ?auto_13854 ) ) ( not ( = ?auto_13850 ?auto_13854 ) ) ( not ( = ?auto_13847 ?auto_13849 ) ) ( CALIBRATION_TARGET ?auto_13852 ?auto_13854 ) ( ON_BOARD ?auto_13853 ?auto_13851 ) ( POWER_ON ?auto_13853 ) ( not ( = ?auto_13852 ?auto_13853 ) ) ( SUPPORTS ?auto_13853 ?auto_13847 ) ( POINTING ?auto_13851 ?auto_13854 ) ( CALIBRATION_TARGET ?auto_13853 ?auto_13854 ) ( NOT_CALIBRATED ?auto_13853 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_13850 ?auto_13847 ?auto_13848 ?auto_13849 )
      ( GET-2IMAGE-VERIFY ?auto_13848 ?auto_13849 ?auto_13850 ?auto_13847 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14294 - DIRECTION
      ?auto_14295 - MODE
      ?auto_14296 - DIRECTION
      ?auto_14293 - MODE
      ?auto_14298 - DIRECTION
      ?auto_14297 - MODE
    )
    :vars
    (
      ?auto_14299 - INSTRUMENT
      ?auto_14300 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_14296 ?auto_14294 ) ) ( not ( = ?auto_14298 ?auto_14294 ) ) ( not ( = ?auto_14298 ?auto_14296 ) ) ( CALIBRATED ?auto_14299 ) ( ON_BOARD ?auto_14299 ?auto_14300 ) ( SUPPORTS ?auto_14299 ?auto_14297 ) ( POWER_ON ?auto_14299 ) ( POINTING ?auto_14300 ?auto_14298 ) ( HAVE_IMAGE ?auto_14294 ?auto_14295 ) ( HAVE_IMAGE ?auto_14296 ?auto_14293 ) ( not ( = ?auto_14295 ?auto_14293 ) ) ( not ( = ?auto_14295 ?auto_14297 ) ) ( not ( = ?auto_14293 ?auto_14297 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_14298 ?auto_14297 )
      ( GET-3IMAGE-VERIFY ?auto_14294 ?auto_14295 ?auto_14296 ?auto_14293 ?auto_14298 ?auto_14297 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14310 - DIRECTION
      ?auto_14311 - MODE
      ?auto_14312 - DIRECTION
      ?auto_14309 - MODE
      ?auto_14314 - DIRECTION
      ?auto_14313 - MODE
    )
    :vars
    (
      ?auto_14315 - INSTRUMENT
      ?auto_14316 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_14312 ?auto_14310 ) ) ( not ( = ?auto_14314 ?auto_14310 ) ) ( not ( = ?auto_14314 ?auto_14312 ) ) ( CALIBRATED ?auto_14315 ) ( ON_BOARD ?auto_14315 ?auto_14316 ) ( SUPPORTS ?auto_14315 ?auto_14309 ) ( POWER_ON ?auto_14315 ) ( POINTING ?auto_14316 ?auto_14312 ) ( HAVE_IMAGE ?auto_14310 ?auto_14311 ) ( HAVE_IMAGE ?auto_14314 ?auto_14313 ) ( not ( = ?auto_14311 ?auto_14309 ) ) ( not ( = ?auto_14311 ?auto_14313 ) ) ( not ( = ?auto_14309 ?auto_14313 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_14312 ?auto_14309 )
      ( GET-3IMAGE-VERIFY ?auto_14310 ?auto_14311 ?auto_14312 ?auto_14309 ?auto_14314 ?auto_14313 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14370 - DIRECTION
      ?auto_14371 - MODE
      ?auto_14372 - DIRECTION
      ?auto_14369 - MODE
      ?auto_14374 - DIRECTION
      ?auto_14373 - MODE
    )
    :vars
    (
      ?auto_14375 - INSTRUMENT
      ?auto_14376 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_14372 ?auto_14370 ) ) ( not ( = ?auto_14374 ?auto_14370 ) ) ( not ( = ?auto_14374 ?auto_14372 ) ) ( CALIBRATED ?auto_14375 ) ( ON_BOARD ?auto_14375 ?auto_14376 ) ( SUPPORTS ?auto_14375 ?auto_14371 ) ( POWER_ON ?auto_14375 ) ( POINTING ?auto_14376 ?auto_14370 ) ( HAVE_IMAGE ?auto_14372 ?auto_14369 ) ( HAVE_IMAGE ?auto_14374 ?auto_14373 ) ( not ( = ?auto_14371 ?auto_14369 ) ) ( not ( = ?auto_14371 ?auto_14373 ) ) ( not ( = ?auto_14369 ?auto_14373 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_14370 ?auto_14371 )
      ( GET-3IMAGE-VERIFY ?auto_14370 ?auto_14371 ?auto_14372 ?auto_14369 ?auto_14374 ?auto_14373 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14477 - DIRECTION
      ?auto_14478 - MODE
      ?auto_14479 - DIRECTION
      ?auto_14476 - MODE
      ?auto_14481 - DIRECTION
      ?auto_14480 - MODE
    )
    :vars
    (
      ?auto_14483 - INSTRUMENT
      ?auto_14484 - SATELLITE
      ?auto_14482 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14479 ?auto_14477 ) ) ( not ( = ?auto_14481 ?auto_14477 ) ) ( not ( = ?auto_14481 ?auto_14479 ) ) ( CALIBRATED ?auto_14483 ) ( ON_BOARD ?auto_14483 ?auto_14484 ) ( SUPPORTS ?auto_14483 ?auto_14480 ) ( POWER_ON ?auto_14483 ) ( POINTING ?auto_14484 ?auto_14482 ) ( not ( = ?auto_14481 ?auto_14482 ) ) ( HAVE_IMAGE ?auto_14477 ?auto_14478 ) ( not ( = ?auto_14477 ?auto_14482 ) ) ( not ( = ?auto_14478 ?auto_14480 ) ) ( HAVE_IMAGE ?auto_14479 ?auto_14476 ) ( not ( = ?auto_14478 ?auto_14476 ) ) ( not ( = ?auto_14479 ?auto_14482 ) ) ( not ( = ?auto_14476 ?auto_14480 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14477 ?auto_14478 ?auto_14481 ?auto_14480 )
      ( GET-3IMAGE-VERIFY ?auto_14477 ?auto_14478 ?auto_14479 ?auto_14476 ?auto_14481 ?auto_14480 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14495 - DIRECTION
      ?auto_14496 - MODE
      ?auto_14497 - DIRECTION
      ?auto_14494 - MODE
      ?auto_14499 - DIRECTION
      ?auto_14498 - MODE
    )
    :vars
    (
      ?auto_14501 - INSTRUMENT
      ?auto_14502 - SATELLITE
      ?auto_14500 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14497 ?auto_14495 ) ) ( not ( = ?auto_14499 ?auto_14495 ) ) ( not ( = ?auto_14499 ?auto_14497 ) ) ( CALIBRATED ?auto_14501 ) ( ON_BOARD ?auto_14501 ?auto_14502 ) ( SUPPORTS ?auto_14501 ?auto_14494 ) ( POWER_ON ?auto_14501 ) ( POINTING ?auto_14502 ?auto_14500 ) ( not ( = ?auto_14497 ?auto_14500 ) ) ( HAVE_IMAGE ?auto_14495 ?auto_14496 ) ( not ( = ?auto_14495 ?auto_14500 ) ) ( not ( = ?auto_14496 ?auto_14494 ) ) ( HAVE_IMAGE ?auto_14499 ?auto_14498 ) ( not ( = ?auto_14496 ?auto_14498 ) ) ( not ( = ?auto_14494 ?auto_14498 ) ) ( not ( = ?auto_14499 ?auto_14500 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14495 ?auto_14496 ?auto_14497 ?auto_14494 )
      ( GET-3IMAGE-VERIFY ?auto_14495 ?auto_14496 ?auto_14497 ?auto_14494 ?auto_14499 ?auto_14498 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14567 - DIRECTION
      ?auto_14568 - MODE
      ?auto_14569 - DIRECTION
      ?auto_14566 - MODE
      ?auto_14571 - DIRECTION
      ?auto_14570 - MODE
    )
    :vars
    (
      ?auto_14573 - INSTRUMENT
      ?auto_14574 - SATELLITE
      ?auto_14572 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14569 ?auto_14567 ) ) ( not ( = ?auto_14571 ?auto_14567 ) ) ( not ( = ?auto_14571 ?auto_14569 ) ) ( CALIBRATED ?auto_14573 ) ( ON_BOARD ?auto_14573 ?auto_14574 ) ( SUPPORTS ?auto_14573 ?auto_14568 ) ( POWER_ON ?auto_14573 ) ( POINTING ?auto_14574 ?auto_14572 ) ( not ( = ?auto_14567 ?auto_14572 ) ) ( HAVE_IMAGE ?auto_14569 ?auto_14566 ) ( not ( = ?auto_14569 ?auto_14572 ) ) ( not ( = ?auto_14566 ?auto_14568 ) ) ( HAVE_IMAGE ?auto_14571 ?auto_14570 ) ( not ( = ?auto_14568 ?auto_14570 ) ) ( not ( = ?auto_14566 ?auto_14570 ) ) ( not ( = ?auto_14571 ?auto_14572 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14569 ?auto_14566 ?auto_14567 ?auto_14568 )
      ( GET-3IMAGE-VERIFY ?auto_14567 ?auto_14568 ?auto_14569 ?auto_14566 ?auto_14571 ?auto_14570 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14691 - DIRECTION
      ?auto_14692 - MODE
      ?auto_14693 - DIRECTION
      ?auto_14690 - MODE
      ?auto_14695 - DIRECTION
      ?auto_14694 - MODE
    )
    :vars
    (
      ?auto_14698 - INSTRUMENT
      ?auto_14697 - SATELLITE
      ?auto_14696 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14693 ?auto_14691 ) ) ( not ( = ?auto_14695 ?auto_14691 ) ) ( not ( = ?auto_14695 ?auto_14693 ) ) ( ON_BOARD ?auto_14698 ?auto_14697 ) ( SUPPORTS ?auto_14698 ?auto_14694 ) ( POWER_ON ?auto_14698 ) ( POINTING ?auto_14697 ?auto_14696 ) ( not ( = ?auto_14695 ?auto_14696 ) ) ( HAVE_IMAGE ?auto_14691 ?auto_14692 ) ( not ( = ?auto_14691 ?auto_14696 ) ) ( not ( = ?auto_14692 ?auto_14694 ) ) ( CALIBRATION_TARGET ?auto_14698 ?auto_14696 ) ( NOT_CALIBRATED ?auto_14698 ) ( HAVE_IMAGE ?auto_14693 ?auto_14690 ) ( not ( = ?auto_14692 ?auto_14690 ) ) ( not ( = ?auto_14693 ?auto_14696 ) ) ( not ( = ?auto_14690 ?auto_14694 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14691 ?auto_14692 ?auto_14695 ?auto_14694 )
      ( GET-3IMAGE-VERIFY ?auto_14691 ?auto_14692 ?auto_14693 ?auto_14690 ?auto_14695 ?auto_14694 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14709 - DIRECTION
      ?auto_14710 - MODE
      ?auto_14711 - DIRECTION
      ?auto_14708 - MODE
      ?auto_14713 - DIRECTION
      ?auto_14712 - MODE
    )
    :vars
    (
      ?auto_14716 - INSTRUMENT
      ?auto_14715 - SATELLITE
      ?auto_14714 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14711 ?auto_14709 ) ) ( not ( = ?auto_14713 ?auto_14709 ) ) ( not ( = ?auto_14713 ?auto_14711 ) ) ( ON_BOARD ?auto_14716 ?auto_14715 ) ( SUPPORTS ?auto_14716 ?auto_14708 ) ( POWER_ON ?auto_14716 ) ( POINTING ?auto_14715 ?auto_14714 ) ( not ( = ?auto_14711 ?auto_14714 ) ) ( HAVE_IMAGE ?auto_14709 ?auto_14710 ) ( not ( = ?auto_14709 ?auto_14714 ) ) ( not ( = ?auto_14710 ?auto_14708 ) ) ( CALIBRATION_TARGET ?auto_14716 ?auto_14714 ) ( NOT_CALIBRATED ?auto_14716 ) ( HAVE_IMAGE ?auto_14713 ?auto_14712 ) ( not ( = ?auto_14710 ?auto_14712 ) ) ( not ( = ?auto_14708 ?auto_14712 ) ) ( not ( = ?auto_14713 ?auto_14714 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14709 ?auto_14710 ?auto_14711 ?auto_14708 )
      ( GET-3IMAGE-VERIFY ?auto_14709 ?auto_14710 ?auto_14711 ?auto_14708 ?auto_14713 ?auto_14712 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14781 - DIRECTION
      ?auto_14782 - MODE
      ?auto_14783 - DIRECTION
      ?auto_14780 - MODE
      ?auto_14785 - DIRECTION
      ?auto_14784 - MODE
    )
    :vars
    (
      ?auto_14788 - INSTRUMENT
      ?auto_14787 - SATELLITE
      ?auto_14786 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14783 ?auto_14781 ) ) ( not ( = ?auto_14785 ?auto_14781 ) ) ( not ( = ?auto_14785 ?auto_14783 ) ) ( ON_BOARD ?auto_14788 ?auto_14787 ) ( SUPPORTS ?auto_14788 ?auto_14782 ) ( POWER_ON ?auto_14788 ) ( POINTING ?auto_14787 ?auto_14786 ) ( not ( = ?auto_14781 ?auto_14786 ) ) ( HAVE_IMAGE ?auto_14783 ?auto_14780 ) ( not ( = ?auto_14783 ?auto_14786 ) ) ( not ( = ?auto_14780 ?auto_14782 ) ) ( CALIBRATION_TARGET ?auto_14788 ?auto_14786 ) ( NOT_CALIBRATED ?auto_14788 ) ( HAVE_IMAGE ?auto_14785 ?auto_14784 ) ( not ( = ?auto_14782 ?auto_14784 ) ) ( not ( = ?auto_14780 ?auto_14784 ) ) ( not ( = ?auto_14785 ?auto_14786 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14783 ?auto_14780 ?auto_14781 ?auto_14782 )
      ( GET-3IMAGE-VERIFY ?auto_14781 ?auto_14782 ?auto_14783 ?auto_14780 ?auto_14785 ?auto_14784 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14905 - DIRECTION
      ?auto_14906 - MODE
      ?auto_14907 - DIRECTION
      ?auto_14904 - MODE
      ?auto_14909 - DIRECTION
      ?auto_14908 - MODE
    )
    :vars
    (
      ?auto_14912 - INSTRUMENT
      ?auto_14911 - SATELLITE
      ?auto_14910 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14907 ?auto_14905 ) ) ( not ( = ?auto_14909 ?auto_14905 ) ) ( not ( = ?auto_14909 ?auto_14907 ) ) ( ON_BOARD ?auto_14912 ?auto_14911 ) ( SUPPORTS ?auto_14912 ?auto_14908 ) ( POINTING ?auto_14911 ?auto_14910 ) ( not ( = ?auto_14909 ?auto_14910 ) ) ( HAVE_IMAGE ?auto_14905 ?auto_14906 ) ( not ( = ?auto_14905 ?auto_14910 ) ) ( not ( = ?auto_14906 ?auto_14908 ) ) ( CALIBRATION_TARGET ?auto_14912 ?auto_14910 ) ( POWER_AVAIL ?auto_14911 ) ( HAVE_IMAGE ?auto_14907 ?auto_14904 ) ( not ( = ?auto_14906 ?auto_14904 ) ) ( not ( = ?auto_14907 ?auto_14910 ) ) ( not ( = ?auto_14904 ?auto_14908 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14905 ?auto_14906 ?auto_14909 ?auto_14908 )
      ( GET-3IMAGE-VERIFY ?auto_14905 ?auto_14906 ?auto_14907 ?auto_14904 ?auto_14909 ?auto_14908 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14923 - DIRECTION
      ?auto_14924 - MODE
      ?auto_14925 - DIRECTION
      ?auto_14922 - MODE
      ?auto_14927 - DIRECTION
      ?auto_14926 - MODE
    )
    :vars
    (
      ?auto_14930 - INSTRUMENT
      ?auto_14929 - SATELLITE
      ?auto_14928 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14925 ?auto_14923 ) ) ( not ( = ?auto_14927 ?auto_14923 ) ) ( not ( = ?auto_14927 ?auto_14925 ) ) ( ON_BOARD ?auto_14930 ?auto_14929 ) ( SUPPORTS ?auto_14930 ?auto_14922 ) ( POINTING ?auto_14929 ?auto_14928 ) ( not ( = ?auto_14925 ?auto_14928 ) ) ( HAVE_IMAGE ?auto_14923 ?auto_14924 ) ( not ( = ?auto_14923 ?auto_14928 ) ) ( not ( = ?auto_14924 ?auto_14922 ) ) ( CALIBRATION_TARGET ?auto_14930 ?auto_14928 ) ( POWER_AVAIL ?auto_14929 ) ( HAVE_IMAGE ?auto_14927 ?auto_14926 ) ( not ( = ?auto_14924 ?auto_14926 ) ) ( not ( = ?auto_14922 ?auto_14926 ) ) ( not ( = ?auto_14927 ?auto_14928 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14923 ?auto_14924 ?auto_14925 ?auto_14922 )
      ( GET-3IMAGE-VERIFY ?auto_14923 ?auto_14924 ?auto_14925 ?auto_14922 ?auto_14927 ?auto_14926 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14995 - DIRECTION
      ?auto_14996 - MODE
      ?auto_14997 - DIRECTION
      ?auto_14994 - MODE
      ?auto_14999 - DIRECTION
      ?auto_14998 - MODE
    )
    :vars
    (
      ?auto_15002 - INSTRUMENT
      ?auto_15001 - SATELLITE
      ?auto_15000 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14997 ?auto_14995 ) ) ( not ( = ?auto_14999 ?auto_14995 ) ) ( not ( = ?auto_14999 ?auto_14997 ) ) ( ON_BOARD ?auto_15002 ?auto_15001 ) ( SUPPORTS ?auto_15002 ?auto_14996 ) ( POINTING ?auto_15001 ?auto_15000 ) ( not ( = ?auto_14995 ?auto_15000 ) ) ( HAVE_IMAGE ?auto_14997 ?auto_14994 ) ( not ( = ?auto_14997 ?auto_15000 ) ) ( not ( = ?auto_14994 ?auto_14996 ) ) ( CALIBRATION_TARGET ?auto_15002 ?auto_15000 ) ( POWER_AVAIL ?auto_15001 ) ( HAVE_IMAGE ?auto_14999 ?auto_14998 ) ( not ( = ?auto_14996 ?auto_14998 ) ) ( not ( = ?auto_14994 ?auto_14998 ) ) ( not ( = ?auto_14999 ?auto_15000 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14997 ?auto_14994 ?auto_14995 ?auto_14996 )
      ( GET-3IMAGE-VERIFY ?auto_14995 ?auto_14996 ?auto_14997 ?auto_14994 ?auto_14999 ?auto_14998 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_15071 - DIRECTION
      ?auto_15072 - MODE
    )
    :vars
    (
      ?auto_15075 - DIRECTION
      ?auto_15076 - INSTRUMENT
      ?auto_15074 - SATELLITE
      ?auto_15073 - DIRECTION
      ?auto_15077 - MODE
      ?auto_15078 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_15071 ?auto_15075 ) ) ( ON_BOARD ?auto_15076 ?auto_15074 ) ( SUPPORTS ?auto_15076 ?auto_15072 ) ( not ( = ?auto_15071 ?auto_15073 ) ) ( HAVE_IMAGE ?auto_15075 ?auto_15077 ) ( not ( = ?auto_15075 ?auto_15073 ) ) ( not ( = ?auto_15077 ?auto_15072 ) ) ( CALIBRATION_TARGET ?auto_15076 ?auto_15073 ) ( POWER_AVAIL ?auto_15074 ) ( POINTING ?auto_15074 ?auto_15078 ) ( not ( = ?auto_15073 ?auto_15078 ) ) ( not ( = ?auto_15071 ?auto_15078 ) ) ( not ( = ?auto_15075 ?auto_15078 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_15074 ?auto_15073 ?auto_15078 )
      ( GET-2IMAGE ?auto_15075 ?auto_15077 ?auto_15071 ?auto_15072 )
      ( GET-1IMAGE-VERIFY ?auto_15071 ?auto_15072 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15080 - DIRECTION
      ?auto_15081 - MODE
      ?auto_15082 - DIRECTION
      ?auto_15079 - MODE
    )
    :vars
    (
      ?auto_15084 - INSTRUMENT
      ?auto_15085 - SATELLITE
      ?auto_15083 - DIRECTION
      ?auto_15086 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_15082 ?auto_15080 ) ) ( ON_BOARD ?auto_15084 ?auto_15085 ) ( SUPPORTS ?auto_15084 ?auto_15079 ) ( not ( = ?auto_15082 ?auto_15083 ) ) ( HAVE_IMAGE ?auto_15080 ?auto_15081 ) ( not ( = ?auto_15080 ?auto_15083 ) ) ( not ( = ?auto_15081 ?auto_15079 ) ) ( CALIBRATION_TARGET ?auto_15084 ?auto_15083 ) ( POWER_AVAIL ?auto_15085 ) ( POINTING ?auto_15085 ?auto_15086 ) ( not ( = ?auto_15083 ?auto_15086 ) ) ( not ( = ?auto_15082 ?auto_15086 ) ) ( not ( = ?auto_15080 ?auto_15086 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15082 ?auto_15079 )
      ( GET-2IMAGE-VERIFY ?auto_15080 ?auto_15081 ?auto_15082 ?auto_15079 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15088 - DIRECTION
      ?auto_15089 - MODE
      ?auto_15090 - DIRECTION
      ?auto_15087 - MODE
    )
    :vars
    (
      ?auto_15094 - DIRECTION
      ?auto_15093 - INSTRUMENT
      ?auto_15091 - SATELLITE
      ?auto_15092 - DIRECTION
      ?auto_15095 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_15090 ?auto_15088 ) ) ( not ( = ?auto_15090 ?auto_15094 ) ) ( ON_BOARD ?auto_15093 ?auto_15091 ) ( SUPPORTS ?auto_15093 ?auto_15087 ) ( not ( = ?auto_15090 ?auto_15092 ) ) ( HAVE_IMAGE ?auto_15094 ?auto_15095 ) ( not ( = ?auto_15094 ?auto_15092 ) ) ( not ( = ?auto_15095 ?auto_15087 ) ) ( CALIBRATION_TARGET ?auto_15093 ?auto_15092 ) ( POWER_AVAIL ?auto_15091 ) ( POINTING ?auto_15091 ?auto_15088 ) ( not ( = ?auto_15092 ?auto_15088 ) ) ( not ( = ?auto_15094 ?auto_15088 ) ) ( HAVE_IMAGE ?auto_15088 ?auto_15089 ) ( not ( = ?auto_15089 ?auto_15087 ) ) ( not ( = ?auto_15089 ?auto_15095 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15094 ?auto_15095 ?auto_15090 ?auto_15087 )
      ( GET-2IMAGE-VERIFY ?auto_15088 ?auto_15089 ?auto_15090 ?auto_15087 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15097 - DIRECTION
      ?auto_15098 - MODE
      ?auto_15099 - DIRECTION
      ?auto_15096 - MODE
    )
    :vars
    (
      ?auto_15103 - INSTRUMENT
      ?auto_15101 - SATELLITE
      ?auto_15102 - DIRECTION
      ?auto_15100 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_15099 ?auto_15097 ) ) ( ON_BOARD ?auto_15103 ?auto_15101 ) ( SUPPORTS ?auto_15103 ?auto_15098 ) ( not ( = ?auto_15097 ?auto_15102 ) ) ( HAVE_IMAGE ?auto_15099 ?auto_15096 ) ( not ( = ?auto_15099 ?auto_15102 ) ) ( not ( = ?auto_15096 ?auto_15098 ) ) ( CALIBRATION_TARGET ?auto_15103 ?auto_15102 ) ( POWER_AVAIL ?auto_15101 ) ( POINTING ?auto_15101 ?auto_15100 ) ( not ( = ?auto_15102 ?auto_15100 ) ) ( not ( = ?auto_15097 ?auto_15100 ) ) ( not ( = ?auto_15099 ?auto_15100 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15099 ?auto_15096 ?auto_15097 ?auto_15098 )
      ( GET-2IMAGE-VERIFY ?auto_15097 ?auto_15098 ?auto_15099 ?auto_15096 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15105 - DIRECTION
      ?auto_15106 - MODE
      ?auto_15107 - DIRECTION
      ?auto_15104 - MODE
    )
    :vars
    (
      ?auto_15111 - DIRECTION
      ?auto_15110 - INSTRUMENT
      ?auto_15108 - SATELLITE
      ?auto_15109 - DIRECTION
      ?auto_15112 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_15107 ?auto_15105 ) ) ( not ( = ?auto_15105 ?auto_15111 ) ) ( ON_BOARD ?auto_15110 ?auto_15108 ) ( SUPPORTS ?auto_15110 ?auto_15106 ) ( not ( = ?auto_15105 ?auto_15109 ) ) ( HAVE_IMAGE ?auto_15111 ?auto_15112 ) ( not ( = ?auto_15111 ?auto_15109 ) ) ( not ( = ?auto_15112 ?auto_15106 ) ) ( CALIBRATION_TARGET ?auto_15110 ?auto_15109 ) ( POWER_AVAIL ?auto_15108 ) ( POINTING ?auto_15108 ?auto_15107 ) ( not ( = ?auto_15109 ?auto_15107 ) ) ( not ( = ?auto_15111 ?auto_15107 ) ) ( HAVE_IMAGE ?auto_15107 ?auto_15104 ) ( not ( = ?auto_15106 ?auto_15104 ) ) ( not ( = ?auto_15104 ?auto_15112 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15111 ?auto_15112 ?auto_15105 ?auto_15106 )
      ( GET-2IMAGE-VERIFY ?auto_15105 ?auto_15106 ?auto_15107 ?auto_15104 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15134 - DIRECTION
      ?auto_15135 - MODE
      ?auto_15136 - DIRECTION
      ?auto_15133 - MODE
      ?auto_15138 - DIRECTION
      ?auto_15137 - MODE
    )
    :vars
    (
      ?auto_15141 - INSTRUMENT
      ?auto_15139 - SATELLITE
      ?auto_15140 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_15136 ?auto_15134 ) ) ( not ( = ?auto_15138 ?auto_15134 ) ) ( not ( = ?auto_15138 ?auto_15136 ) ) ( ON_BOARD ?auto_15141 ?auto_15139 ) ( SUPPORTS ?auto_15141 ?auto_15137 ) ( not ( = ?auto_15138 ?auto_15140 ) ) ( HAVE_IMAGE ?auto_15134 ?auto_15135 ) ( not ( = ?auto_15134 ?auto_15140 ) ) ( not ( = ?auto_15135 ?auto_15137 ) ) ( CALIBRATION_TARGET ?auto_15141 ?auto_15140 ) ( POWER_AVAIL ?auto_15139 ) ( POINTING ?auto_15139 ?auto_15136 ) ( not ( = ?auto_15140 ?auto_15136 ) ) ( HAVE_IMAGE ?auto_15136 ?auto_15133 ) ( not ( = ?auto_15135 ?auto_15133 ) ) ( not ( = ?auto_15133 ?auto_15137 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15134 ?auto_15135 ?auto_15138 ?auto_15137 )
      ( GET-3IMAGE-VERIFY ?auto_15134 ?auto_15135 ?auto_15136 ?auto_15133 ?auto_15138 ?auto_15137 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15153 - DIRECTION
      ?auto_15154 - MODE
      ?auto_15155 - DIRECTION
      ?auto_15152 - MODE
      ?auto_15157 - DIRECTION
      ?auto_15156 - MODE
    )
    :vars
    (
      ?auto_15160 - INSTRUMENT
      ?auto_15158 - SATELLITE
      ?auto_15159 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_15155 ?auto_15153 ) ) ( not ( = ?auto_15157 ?auto_15153 ) ) ( not ( = ?auto_15157 ?auto_15155 ) ) ( ON_BOARD ?auto_15160 ?auto_15158 ) ( SUPPORTS ?auto_15160 ?auto_15152 ) ( not ( = ?auto_15155 ?auto_15159 ) ) ( HAVE_IMAGE ?auto_15153 ?auto_15154 ) ( not ( = ?auto_15153 ?auto_15159 ) ) ( not ( = ?auto_15154 ?auto_15152 ) ) ( CALIBRATION_TARGET ?auto_15160 ?auto_15159 ) ( POWER_AVAIL ?auto_15158 ) ( POINTING ?auto_15158 ?auto_15157 ) ( not ( = ?auto_15159 ?auto_15157 ) ) ( HAVE_IMAGE ?auto_15157 ?auto_15156 ) ( not ( = ?auto_15154 ?auto_15156 ) ) ( not ( = ?auto_15152 ?auto_15156 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15153 ?auto_15154 ?auto_15155 ?auto_15152 )
      ( GET-3IMAGE-VERIFY ?auto_15153 ?auto_15154 ?auto_15155 ?auto_15152 ?auto_15157 ?auto_15156 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15172 - DIRECTION
      ?auto_15173 - MODE
      ?auto_15174 - DIRECTION
      ?auto_15171 - MODE
      ?auto_15176 - DIRECTION
      ?auto_15175 - MODE
    )
    :vars
    (
      ?auto_15179 - INSTRUMENT
      ?auto_15177 - SATELLITE
      ?auto_15178 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_15174 ?auto_15172 ) ) ( not ( = ?auto_15176 ?auto_15172 ) ) ( not ( = ?auto_15176 ?auto_15174 ) ) ( ON_BOARD ?auto_15179 ?auto_15177 ) ( SUPPORTS ?auto_15179 ?auto_15175 ) ( not ( = ?auto_15176 ?auto_15178 ) ) ( HAVE_IMAGE ?auto_15174 ?auto_15171 ) ( not ( = ?auto_15174 ?auto_15178 ) ) ( not ( = ?auto_15171 ?auto_15175 ) ) ( CALIBRATION_TARGET ?auto_15179 ?auto_15178 ) ( POWER_AVAIL ?auto_15177 ) ( POINTING ?auto_15177 ?auto_15172 ) ( not ( = ?auto_15178 ?auto_15172 ) ) ( HAVE_IMAGE ?auto_15172 ?auto_15173 ) ( not ( = ?auto_15173 ?auto_15171 ) ) ( not ( = ?auto_15173 ?auto_15175 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15174 ?auto_15171 ?auto_15176 ?auto_15175 )
      ( GET-3IMAGE-VERIFY ?auto_15172 ?auto_15173 ?auto_15174 ?auto_15171 ?auto_15176 ?auto_15175 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15192 - DIRECTION
      ?auto_15193 - MODE
      ?auto_15194 - DIRECTION
      ?auto_15191 - MODE
      ?auto_15196 - DIRECTION
      ?auto_15195 - MODE
    )
    :vars
    (
      ?auto_15199 - INSTRUMENT
      ?auto_15197 - SATELLITE
      ?auto_15198 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_15194 ?auto_15192 ) ) ( not ( = ?auto_15196 ?auto_15192 ) ) ( not ( = ?auto_15196 ?auto_15194 ) ) ( ON_BOARD ?auto_15199 ?auto_15197 ) ( SUPPORTS ?auto_15199 ?auto_15191 ) ( not ( = ?auto_15194 ?auto_15198 ) ) ( HAVE_IMAGE ?auto_15196 ?auto_15195 ) ( not ( = ?auto_15196 ?auto_15198 ) ) ( not ( = ?auto_15195 ?auto_15191 ) ) ( CALIBRATION_TARGET ?auto_15199 ?auto_15198 ) ( POWER_AVAIL ?auto_15197 ) ( POINTING ?auto_15197 ?auto_15192 ) ( not ( = ?auto_15198 ?auto_15192 ) ) ( HAVE_IMAGE ?auto_15192 ?auto_15193 ) ( not ( = ?auto_15193 ?auto_15191 ) ) ( not ( = ?auto_15193 ?auto_15195 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15196 ?auto_15195 ?auto_15194 ?auto_15191 )
      ( GET-3IMAGE-VERIFY ?auto_15192 ?auto_15193 ?auto_15194 ?auto_15191 ?auto_15196 ?auto_15195 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15233 - DIRECTION
      ?auto_15234 - MODE
      ?auto_15235 - DIRECTION
      ?auto_15232 - MODE
      ?auto_15237 - DIRECTION
      ?auto_15236 - MODE
    )
    :vars
    (
      ?auto_15240 - INSTRUMENT
      ?auto_15238 - SATELLITE
      ?auto_15239 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_15235 ?auto_15233 ) ) ( not ( = ?auto_15237 ?auto_15233 ) ) ( not ( = ?auto_15237 ?auto_15235 ) ) ( ON_BOARD ?auto_15240 ?auto_15238 ) ( SUPPORTS ?auto_15240 ?auto_15234 ) ( not ( = ?auto_15233 ?auto_15239 ) ) ( HAVE_IMAGE ?auto_15235 ?auto_15232 ) ( not ( = ?auto_15235 ?auto_15239 ) ) ( not ( = ?auto_15232 ?auto_15234 ) ) ( CALIBRATION_TARGET ?auto_15240 ?auto_15239 ) ( POWER_AVAIL ?auto_15238 ) ( POINTING ?auto_15238 ?auto_15237 ) ( not ( = ?auto_15239 ?auto_15237 ) ) ( HAVE_IMAGE ?auto_15237 ?auto_15236 ) ( not ( = ?auto_15234 ?auto_15236 ) ) ( not ( = ?auto_15232 ?auto_15236 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15235 ?auto_15232 ?auto_15233 ?auto_15234 )
      ( GET-3IMAGE-VERIFY ?auto_15233 ?auto_15234 ?auto_15235 ?auto_15232 ?auto_15237 ?auto_15236 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15252 - DIRECTION
      ?auto_15253 - MODE
      ?auto_15254 - DIRECTION
      ?auto_15251 - MODE
      ?auto_15256 - DIRECTION
      ?auto_15255 - MODE
    )
    :vars
    (
      ?auto_15259 - INSTRUMENT
      ?auto_15257 - SATELLITE
      ?auto_15258 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_15254 ?auto_15252 ) ) ( not ( = ?auto_15256 ?auto_15252 ) ) ( not ( = ?auto_15256 ?auto_15254 ) ) ( ON_BOARD ?auto_15259 ?auto_15257 ) ( SUPPORTS ?auto_15259 ?auto_15253 ) ( not ( = ?auto_15252 ?auto_15258 ) ) ( HAVE_IMAGE ?auto_15256 ?auto_15255 ) ( not ( = ?auto_15256 ?auto_15258 ) ) ( not ( = ?auto_15255 ?auto_15253 ) ) ( CALIBRATION_TARGET ?auto_15259 ?auto_15258 ) ( POWER_AVAIL ?auto_15257 ) ( POINTING ?auto_15257 ?auto_15254 ) ( not ( = ?auto_15258 ?auto_15254 ) ) ( HAVE_IMAGE ?auto_15254 ?auto_15251 ) ( not ( = ?auto_15253 ?auto_15251 ) ) ( not ( = ?auto_15251 ?auto_15255 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15256 ?auto_15255 ?auto_15252 ?auto_15253 )
      ( GET-3IMAGE-VERIFY ?auto_15252 ?auto_15253 ?auto_15254 ?auto_15251 ?auto_15256 ?auto_15255 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_15315 - DIRECTION
      ?auto_15316 - MODE
    )
    :vars
    (
      ?auto_15321 - DIRECTION
      ?auto_15320 - INSTRUMENT
      ?auto_15318 - SATELLITE
      ?auto_15319 - DIRECTION
      ?auto_15322 - MODE
      ?auto_15317 - DIRECTION
      ?auto_15323 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15315 ?auto_15321 ) ) ( ON_BOARD ?auto_15320 ?auto_15318 ) ( SUPPORTS ?auto_15320 ?auto_15316 ) ( not ( = ?auto_15315 ?auto_15319 ) ) ( HAVE_IMAGE ?auto_15321 ?auto_15322 ) ( not ( = ?auto_15321 ?auto_15319 ) ) ( not ( = ?auto_15322 ?auto_15316 ) ) ( CALIBRATION_TARGET ?auto_15320 ?auto_15319 ) ( POINTING ?auto_15318 ?auto_15317 ) ( not ( = ?auto_15319 ?auto_15317 ) ) ( not ( = ?auto_15315 ?auto_15317 ) ) ( not ( = ?auto_15321 ?auto_15317 ) ) ( ON_BOARD ?auto_15323 ?auto_15318 ) ( POWER_ON ?auto_15323 ) ( not ( = ?auto_15320 ?auto_15323 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_15323 ?auto_15318 )
      ( GET-2IMAGE ?auto_15321 ?auto_15322 ?auto_15315 ?auto_15316 )
      ( GET-1IMAGE-VERIFY ?auto_15315 ?auto_15316 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15325 - DIRECTION
      ?auto_15326 - MODE
      ?auto_15327 - DIRECTION
      ?auto_15324 - MODE
    )
    :vars
    (
      ?auto_15329 - INSTRUMENT
      ?auto_15330 - SATELLITE
      ?auto_15331 - DIRECTION
      ?auto_15328 - DIRECTION
      ?auto_15332 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15327 ?auto_15325 ) ) ( ON_BOARD ?auto_15329 ?auto_15330 ) ( SUPPORTS ?auto_15329 ?auto_15324 ) ( not ( = ?auto_15327 ?auto_15331 ) ) ( HAVE_IMAGE ?auto_15325 ?auto_15326 ) ( not ( = ?auto_15325 ?auto_15331 ) ) ( not ( = ?auto_15326 ?auto_15324 ) ) ( CALIBRATION_TARGET ?auto_15329 ?auto_15331 ) ( POINTING ?auto_15330 ?auto_15328 ) ( not ( = ?auto_15331 ?auto_15328 ) ) ( not ( = ?auto_15327 ?auto_15328 ) ) ( not ( = ?auto_15325 ?auto_15328 ) ) ( ON_BOARD ?auto_15332 ?auto_15330 ) ( POWER_ON ?auto_15332 ) ( not ( = ?auto_15329 ?auto_15332 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15327 ?auto_15324 )
      ( GET-2IMAGE-VERIFY ?auto_15325 ?auto_15326 ?auto_15327 ?auto_15324 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15334 - DIRECTION
      ?auto_15335 - MODE
      ?auto_15336 - DIRECTION
      ?auto_15333 - MODE
    )
    :vars
    (
      ?auto_15340 - DIRECTION
      ?auto_15337 - INSTRUMENT
      ?auto_15341 - SATELLITE
      ?auto_15342 - DIRECTION
      ?auto_15339 - MODE
      ?auto_15338 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15336 ?auto_15334 ) ) ( not ( = ?auto_15336 ?auto_15340 ) ) ( ON_BOARD ?auto_15337 ?auto_15341 ) ( SUPPORTS ?auto_15337 ?auto_15333 ) ( not ( = ?auto_15336 ?auto_15342 ) ) ( HAVE_IMAGE ?auto_15340 ?auto_15339 ) ( not ( = ?auto_15340 ?auto_15342 ) ) ( not ( = ?auto_15339 ?auto_15333 ) ) ( CALIBRATION_TARGET ?auto_15337 ?auto_15342 ) ( POINTING ?auto_15341 ?auto_15334 ) ( not ( = ?auto_15342 ?auto_15334 ) ) ( not ( = ?auto_15340 ?auto_15334 ) ) ( ON_BOARD ?auto_15338 ?auto_15341 ) ( POWER_ON ?auto_15338 ) ( not ( = ?auto_15337 ?auto_15338 ) ) ( HAVE_IMAGE ?auto_15334 ?auto_15335 ) ( not ( = ?auto_15335 ?auto_15333 ) ) ( not ( = ?auto_15335 ?auto_15339 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15340 ?auto_15339 ?auto_15336 ?auto_15333 )
      ( GET-2IMAGE-VERIFY ?auto_15334 ?auto_15335 ?auto_15336 ?auto_15333 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15344 - DIRECTION
      ?auto_15345 - MODE
      ?auto_15346 - DIRECTION
      ?auto_15343 - MODE
    )
    :vars
    (
      ?auto_15347 - INSTRUMENT
      ?auto_15350 - SATELLITE
      ?auto_15351 - DIRECTION
      ?auto_15349 - DIRECTION
      ?auto_15348 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15346 ?auto_15344 ) ) ( ON_BOARD ?auto_15347 ?auto_15350 ) ( SUPPORTS ?auto_15347 ?auto_15345 ) ( not ( = ?auto_15344 ?auto_15351 ) ) ( HAVE_IMAGE ?auto_15346 ?auto_15343 ) ( not ( = ?auto_15346 ?auto_15351 ) ) ( not ( = ?auto_15343 ?auto_15345 ) ) ( CALIBRATION_TARGET ?auto_15347 ?auto_15351 ) ( POINTING ?auto_15350 ?auto_15349 ) ( not ( = ?auto_15351 ?auto_15349 ) ) ( not ( = ?auto_15344 ?auto_15349 ) ) ( not ( = ?auto_15346 ?auto_15349 ) ) ( ON_BOARD ?auto_15348 ?auto_15350 ) ( POWER_ON ?auto_15348 ) ( not ( = ?auto_15347 ?auto_15348 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15346 ?auto_15343 ?auto_15344 ?auto_15345 )
      ( GET-2IMAGE-VERIFY ?auto_15344 ?auto_15345 ?auto_15346 ?auto_15343 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15353 - DIRECTION
      ?auto_15354 - MODE
      ?auto_15355 - DIRECTION
      ?auto_15352 - MODE
    )
    :vars
    (
      ?auto_15359 - DIRECTION
      ?auto_15356 - INSTRUMENT
      ?auto_15360 - SATELLITE
      ?auto_15361 - DIRECTION
      ?auto_15358 - MODE
      ?auto_15357 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15355 ?auto_15353 ) ) ( not ( = ?auto_15353 ?auto_15359 ) ) ( ON_BOARD ?auto_15356 ?auto_15360 ) ( SUPPORTS ?auto_15356 ?auto_15354 ) ( not ( = ?auto_15353 ?auto_15361 ) ) ( HAVE_IMAGE ?auto_15359 ?auto_15358 ) ( not ( = ?auto_15359 ?auto_15361 ) ) ( not ( = ?auto_15358 ?auto_15354 ) ) ( CALIBRATION_TARGET ?auto_15356 ?auto_15361 ) ( POINTING ?auto_15360 ?auto_15355 ) ( not ( = ?auto_15361 ?auto_15355 ) ) ( not ( = ?auto_15359 ?auto_15355 ) ) ( ON_BOARD ?auto_15357 ?auto_15360 ) ( POWER_ON ?auto_15357 ) ( not ( = ?auto_15356 ?auto_15357 ) ) ( HAVE_IMAGE ?auto_15355 ?auto_15352 ) ( not ( = ?auto_15354 ?auto_15352 ) ) ( not ( = ?auto_15352 ?auto_15358 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15359 ?auto_15358 ?auto_15353 ?auto_15354 )
      ( GET-2IMAGE-VERIFY ?auto_15353 ?auto_15354 ?auto_15355 ?auto_15352 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15385 - DIRECTION
      ?auto_15386 - MODE
      ?auto_15387 - DIRECTION
      ?auto_15384 - MODE
      ?auto_15389 - DIRECTION
      ?auto_15388 - MODE
    )
    :vars
    (
      ?auto_15390 - INSTRUMENT
      ?auto_15392 - SATELLITE
      ?auto_15393 - DIRECTION
      ?auto_15391 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15387 ?auto_15385 ) ) ( not ( = ?auto_15389 ?auto_15385 ) ) ( not ( = ?auto_15389 ?auto_15387 ) ) ( ON_BOARD ?auto_15390 ?auto_15392 ) ( SUPPORTS ?auto_15390 ?auto_15388 ) ( not ( = ?auto_15389 ?auto_15393 ) ) ( HAVE_IMAGE ?auto_15385 ?auto_15386 ) ( not ( = ?auto_15385 ?auto_15393 ) ) ( not ( = ?auto_15386 ?auto_15388 ) ) ( CALIBRATION_TARGET ?auto_15390 ?auto_15393 ) ( POINTING ?auto_15392 ?auto_15387 ) ( not ( = ?auto_15393 ?auto_15387 ) ) ( ON_BOARD ?auto_15391 ?auto_15392 ) ( POWER_ON ?auto_15391 ) ( not ( = ?auto_15390 ?auto_15391 ) ) ( HAVE_IMAGE ?auto_15387 ?auto_15384 ) ( not ( = ?auto_15386 ?auto_15384 ) ) ( not ( = ?auto_15384 ?auto_15388 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15385 ?auto_15386 ?auto_15389 ?auto_15388 )
      ( GET-3IMAGE-VERIFY ?auto_15385 ?auto_15386 ?auto_15387 ?auto_15384 ?auto_15389 ?auto_15388 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15406 - DIRECTION
      ?auto_15407 - MODE
      ?auto_15408 - DIRECTION
      ?auto_15405 - MODE
      ?auto_15410 - DIRECTION
      ?auto_15409 - MODE
    )
    :vars
    (
      ?auto_15411 - INSTRUMENT
      ?auto_15413 - SATELLITE
      ?auto_15414 - DIRECTION
      ?auto_15412 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15408 ?auto_15406 ) ) ( not ( = ?auto_15410 ?auto_15406 ) ) ( not ( = ?auto_15410 ?auto_15408 ) ) ( ON_BOARD ?auto_15411 ?auto_15413 ) ( SUPPORTS ?auto_15411 ?auto_15405 ) ( not ( = ?auto_15408 ?auto_15414 ) ) ( HAVE_IMAGE ?auto_15406 ?auto_15407 ) ( not ( = ?auto_15406 ?auto_15414 ) ) ( not ( = ?auto_15407 ?auto_15405 ) ) ( CALIBRATION_TARGET ?auto_15411 ?auto_15414 ) ( POINTING ?auto_15413 ?auto_15410 ) ( not ( = ?auto_15414 ?auto_15410 ) ) ( ON_BOARD ?auto_15412 ?auto_15413 ) ( POWER_ON ?auto_15412 ) ( not ( = ?auto_15411 ?auto_15412 ) ) ( HAVE_IMAGE ?auto_15410 ?auto_15409 ) ( not ( = ?auto_15407 ?auto_15409 ) ) ( not ( = ?auto_15405 ?auto_15409 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15406 ?auto_15407 ?auto_15408 ?auto_15405 )
      ( GET-3IMAGE-VERIFY ?auto_15406 ?auto_15407 ?auto_15408 ?auto_15405 ?auto_15410 ?auto_15409 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15427 - DIRECTION
      ?auto_15428 - MODE
      ?auto_15429 - DIRECTION
      ?auto_15426 - MODE
      ?auto_15431 - DIRECTION
      ?auto_15430 - MODE
    )
    :vars
    (
      ?auto_15432 - INSTRUMENT
      ?auto_15434 - SATELLITE
      ?auto_15435 - DIRECTION
      ?auto_15433 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15429 ?auto_15427 ) ) ( not ( = ?auto_15431 ?auto_15427 ) ) ( not ( = ?auto_15431 ?auto_15429 ) ) ( ON_BOARD ?auto_15432 ?auto_15434 ) ( SUPPORTS ?auto_15432 ?auto_15430 ) ( not ( = ?auto_15431 ?auto_15435 ) ) ( HAVE_IMAGE ?auto_15429 ?auto_15426 ) ( not ( = ?auto_15429 ?auto_15435 ) ) ( not ( = ?auto_15426 ?auto_15430 ) ) ( CALIBRATION_TARGET ?auto_15432 ?auto_15435 ) ( POINTING ?auto_15434 ?auto_15427 ) ( not ( = ?auto_15435 ?auto_15427 ) ) ( ON_BOARD ?auto_15433 ?auto_15434 ) ( POWER_ON ?auto_15433 ) ( not ( = ?auto_15432 ?auto_15433 ) ) ( HAVE_IMAGE ?auto_15427 ?auto_15428 ) ( not ( = ?auto_15428 ?auto_15426 ) ) ( not ( = ?auto_15428 ?auto_15430 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15429 ?auto_15426 ?auto_15431 ?auto_15430 )
      ( GET-3IMAGE-VERIFY ?auto_15427 ?auto_15428 ?auto_15429 ?auto_15426 ?auto_15431 ?auto_15430 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15449 - DIRECTION
      ?auto_15450 - MODE
      ?auto_15451 - DIRECTION
      ?auto_15448 - MODE
      ?auto_15453 - DIRECTION
      ?auto_15452 - MODE
    )
    :vars
    (
      ?auto_15454 - INSTRUMENT
      ?auto_15456 - SATELLITE
      ?auto_15457 - DIRECTION
      ?auto_15455 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15451 ?auto_15449 ) ) ( not ( = ?auto_15453 ?auto_15449 ) ) ( not ( = ?auto_15453 ?auto_15451 ) ) ( ON_BOARD ?auto_15454 ?auto_15456 ) ( SUPPORTS ?auto_15454 ?auto_15448 ) ( not ( = ?auto_15451 ?auto_15457 ) ) ( HAVE_IMAGE ?auto_15453 ?auto_15452 ) ( not ( = ?auto_15453 ?auto_15457 ) ) ( not ( = ?auto_15452 ?auto_15448 ) ) ( CALIBRATION_TARGET ?auto_15454 ?auto_15457 ) ( POINTING ?auto_15456 ?auto_15449 ) ( not ( = ?auto_15457 ?auto_15449 ) ) ( ON_BOARD ?auto_15455 ?auto_15456 ) ( POWER_ON ?auto_15455 ) ( not ( = ?auto_15454 ?auto_15455 ) ) ( HAVE_IMAGE ?auto_15449 ?auto_15450 ) ( not ( = ?auto_15450 ?auto_15448 ) ) ( not ( = ?auto_15450 ?auto_15452 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15453 ?auto_15452 ?auto_15451 ?auto_15448 )
      ( GET-3IMAGE-VERIFY ?auto_15449 ?auto_15450 ?auto_15451 ?auto_15448 ?auto_15453 ?auto_15452 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15494 - DIRECTION
      ?auto_15495 - MODE
      ?auto_15496 - DIRECTION
      ?auto_15493 - MODE
      ?auto_15498 - DIRECTION
      ?auto_15497 - MODE
    )
    :vars
    (
      ?auto_15499 - INSTRUMENT
      ?auto_15501 - SATELLITE
      ?auto_15502 - DIRECTION
      ?auto_15500 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15496 ?auto_15494 ) ) ( not ( = ?auto_15498 ?auto_15494 ) ) ( not ( = ?auto_15498 ?auto_15496 ) ) ( ON_BOARD ?auto_15499 ?auto_15501 ) ( SUPPORTS ?auto_15499 ?auto_15495 ) ( not ( = ?auto_15494 ?auto_15502 ) ) ( HAVE_IMAGE ?auto_15496 ?auto_15493 ) ( not ( = ?auto_15496 ?auto_15502 ) ) ( not ( = ?auto_15493 ?auto_15495 ) ) ( CALIBRATION_TARGET ?auto_15499 ?auto_15502 ) ( POINTING ?auto_15501 ?auto_15498 ) ( not ( = ?auto_15502 ?auto_15498 ) ) ( ON_BOARD ?auto_15500 ?auto_15501 ) ( POWER_ON ?auto_15500 ) ( not ( = ?auto_15499 ?auto_15500 ) ) ( HAVE_IMAGE ?auto_15498 ?auto_15497 ) ( not ( = ?auto_15495 ?auto_15497 ) ) ( not ( = ?auto_15493 ?auto_15497 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15496 ?auto_15493 ?auto_15494 ?auto_15495 )
      ( GET-3IMAGE-VERIFY ?auto_15494 ?auto_15495 ?auto_15496 ?auto_15493 ?auto_15498 ?auto_15497 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15515 - DIRECTION
      ?auto_15516 - MODE
      ?auto_15517 - DIRECTION
      ?auto_15514 - MODE
      ?auto_15519 - DIRECTION
      ?auto_15518 - MODE
    )
    :vars
    (
      ?auto_15520 - INSTRUMENT
      ?auto_15522 - SATELLITE
      ?auto_15523 - DIRECTION
      ?auto_15521 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15517 ?auto_15515 ) ) ( not ( = ?auto_15519 ?auto_15515 ) ) ( not ( = ?auto_15519 ?auto_15517 ) ) ( ON_BOARD ?auto_15520 ?auto_15522 ) ( SUPPORTS ?auto_15520 ?auto_15516 ) ( not ( = ?auto_15515 ?auto_15523 ) ) ( HAVE_IMAGE ?auto_15519 ?auto_15518 ) ( not ( = ?auto_15519 ?auto_15523 ) ) ( not ( = ?auto_15518 ?auto_15516 ) ) ( CALIBRATION_TARGET ?auto_15520 ?auto_15523 ) ( POINTING ?auto_15522 ?auto_15517 ) ( not ( = ?auto_15523 ?auto_15517 ) ) ( ON_BOARD ?auto_15521 ?auto_15522 ) ( POWER_ON ?auto_15521 ) ( not ( = ?auto_15520 ?auto_15521 ) ) ( HAVE_IMAGE ?auto_15517 ?auto_15514 ) ( not ( = ?auto_15516 ?auto_15514 ) ) ( not ( = ?auto_15514 ?auto_15518 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15519 ?auto_15518 ?auto_15515 ?auto_15516 )
      ( GET-3IMAGE-VERIFY ?auto_15515 ?auto_15516 ?auto_15517 ?auto_15514 ?auto_15519 ?auto_15518 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_15836 - DIRECTION
      ?auto_15837 - MODE
    )
    :vars
    (
      ?auto_15843 - DIRECTION
      ?auto_15842 - INSTRUMENT
      ?auto_15839 - SATELLITE
      ?auto_15838 - DIRECTION
      ?auto_15840 - MODE
      ?auto_15844 - DIRECTION
      ?auto_15841 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15836 ?auto_15843 ) ) ( ON_BOARD ?auto_15842 ?auto_15839 ) ( SUPPORTS ?auto_15842 ?auto_15837 ) ( not ( = ?auto_15836 ?auto_15838 ) ) ( HAVE_IMAGE ?auto_15843 ?auto_15840 ) ( not ( = ?auto_15843 ?auto_15838 ) ) ( not ( = ?auto_15840 ?auto_15837 ) ) ( CALIBRATION_TARGET ?auto_15842 ?auto_15838 ) ( not ( = ?auto_15838 ?auto_15844 ) ) ( not ( = ?auto_15836 ?auto_15844 ) ) ( not ( = ?auto_15843 ?auto_15844 ) ) ( ON_BOARD ?auto_15841 ?auto_15839 ) ( POWER_ON ?auto_15841 ) ( not ( = ?auto_15842 ?auto_15841 ) ) ( POINTING ?auto_15839 ?auto_15838 ) )
    :subtasks
    ( ( !TURN_TO ?auto_15839 ?auto_15844 ?auto_15838 )
      ( GET-2IMAGE ?auto_15843 ?auto_15840 ?auto_15836 ?auto_15837 )
      ( GET-1IMAGE-VERIFY ?auto_15836 ?auto_15837 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15846 - DIRECTION
      ?auto_15847 - MODE
      ?auto_15848 - DIRECTION
      ?auto_15845 - MODE
    )
    :vars
    (
      ?auto_15849 - INSTRUMENT
      ?auto_15850 - SATELLITE
      ?auto_15852 - DIRECTION
      ?auto_15851 - DIRECTION
      ?auto_15853 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15848 ?auto_15846 ) ) ( ON_BOARD ?auto_15849 ?auto_15850 ) ( SUPPORTS ?auto_15849 ?auto_15845 ) ( not ( = ?auto_15848 ?auto_15852 ) ) ( HAVE_IMAGE ?auto_15846 ?auto_15847 ) ( not ( = ?auto_15846 ?auto_15852 ) ) ( not ( = ?auto_15847 ?auto_15845 ) ) ( CALIBRATION_TARGET ?auto_15849 ?auto_15852 ) ( not ( = ?auto_15852 ?auto_15851 ) ) ( not ( = ?auto_15848 ?auto_15851 ) ) ( not ( = ?auto_15846 ?auto_15851 ) ) ( ON_BOARD ?auto_15853 ?auto_15850 ) ( POWER_ON ?auto_15853 ) ( not ( = ?auto_15849 ?auto_15853 ) ) ( POINTING ?auto_15850 ?auto_15852 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15848 ?auto_15845 )
      ( GET-2IMAGE-VERIFY ?auto_15846 ?auto_15847 ?auto_15848 ?auto_15845 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15865 - DIRECTION
      ?auto_15866 - MODE
      ?auto_15867 - DIRECTION
      ?auto_15864 - MODE
    )
    :vars
    (
      ?auto_15872 - INSTRUMENT
      ?auto_15869 - SATELLITE
      ?auto_15870 - DIRECTION
      ?auto_15868 - DIRECTION
      ?auto_15871 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15867 ?auto_15865 ) ) ( ON_BOARD ?auto_15872 ?auto_15869 ) ( SUPPORTS ?auto_15872 ?auto_15866 ) ( not ( = ?auto_15865 ?auto_15870 ) ) ( HAVE_IMAGE ?auto_15867 ?auto_15864 ) ( not ( = ?auto_15867 ?auto_15870 ) ) ( not ( = ?auto_15864 ?auto_15866 ) ) ( CALIBRATION_TARGET ?auto_15872 ?auto_15870 ) ( not ( = ?auto_15870 ?auto_15868 ) ) ( not ( = ?auto_15865 ?auto_15868 ) ) ( not ( = ?auto_15867 ?auto_15868 ) ) ( ON_BOARD ?auto_15871 ?auto_15869 ) ( POWER_ON ?auto_15871 ) ( not ( = ?auto_15872 ?auto_15871 ) ) ( POINTING ?auto_15869 ?auto_15870 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15867 ?auto_15864 ?auto_15865 ?auto_15866 )
      ( GET-2IMAGE-VERIFY ?auto_15865 ?auto_15866 ?auto_15867 ?auto_15864 ) )
  )

)

