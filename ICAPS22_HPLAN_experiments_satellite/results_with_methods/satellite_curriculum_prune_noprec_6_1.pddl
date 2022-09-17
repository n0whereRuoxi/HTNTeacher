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
      ?auto_1571281 - DIRECTION
      ?auto_1571282 - MODE
    )
    :vars
    (
      ?auto_1571283 - INSTRUMENT
      ?auto_1571284 - SATELLITE
      ?auto_1571285 - DIRECTION
      ?auto_1571286 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1571283 ?auto_1571284 ) ( SUPPORTS ?auto_1571283 ?auto_1571282 ) ( not ( = ?auto_1571281 ?auto_1571285 ) ) ( CALIBRATION_TARGET ?auto_1571283 ?auto_1571285 ) ( POWER_AVAIL ?auto_1571284 ) ( POINTING ?auto_1571284 ?auto_1571286 ) ( not ( = ?auto_1571285 ?auto_1571286 ) ) ( not ( = ?auto_1571281 ?auto_1571286 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_1571284 ?auto_1571285 ?auto_1571286 )
      ( !SWITCH_ON ?auto_1571283 ?auto_1571284 )
      ( !CALIBRATE ?auto_1571284 ?auto_1571283 ?auto_1571285 )
      ( !TURN_TO ?auto_1571284 ?auto_1571281 ?auto_1571285 )
      ( !TAKE_IMAGE ?auto_1571284 ?auto_1571281 ?auto_1571283 ?auto_1571282 )
      ( GET-1IMAGE-VERIFY ?auto_1571281 ?auto_1571282 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_1571289 - DIRECTION
      ?auto_1571290 - MODE
    )
    :vars
    (
      ?auto_1571291 - INSTRUMENT
      ?auto_1571292 - SATELLITE
      ?auto_1571293 - DIRECTION
      ?auto_1571294 - DIRECTION
      ?auto_1571295 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_1571291 ?auto_1571292 ) ( SUPPORTS ?auto_1571291 ?auto_1571290 ) ( not ( = ?auto_1571289 ?auto_1571293 ) ) ( CALIBRATION_TARGET ?auto_1571291 ?auto_1571293 ) ( POINTING ?auto_1571292 ?auto_1571294 ) ( not ( = ?auto_1571293 ?auto_1571294 ) ) ( ON_BOARD ?auto_1571295 ?auto_1571292 ) ( POWER_ON ?auto_1571295 ) ( not ( = ?auto_1571289 ?auto_1571294 ) ) ( not ( = ?auto_1571291 ?auto_1571295 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_1571295 ?auto_1571292 )
      ( !TURN_TO ?auto_1571292 ?auto_1571293 ?auto_1571294 )
      ( !SWITCH_ON ?auto_1571291 ?auto_1571292 )
      ( !CALIBRATE ?auto_1571292 ?auto_1571291 ?auto_1571293 )
      ( !TURN_TO ?auto_1571292 ?auto_1571289 ?auto_1571293 )
      ( !TAKE_IMAGE ?auto_1571292 ?auto_1571289 ?auto_1571291 ?auto_1571290 )
      ( GET-1IMAGE-VERIFY ?auto_1571289 ?auto_1571290 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_1571308 - DIRECTION
      ?auto_1571309 - MODE
      ?auto_1571311 - DIRECTION
      ?auto_1571310 - MODE
    )
    :vars
    (
      ?auto_1571313 - INSTRUMENT
      ?auto_1571315 - SATELLITE
      ?auto_1571314 - DIRECTION
      ?auto_1571312 - INSTRUMENT
      ?auto_1571316 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1571313 ?auto_1571315 ) ( SUPPORTS ?auto_1571313 ?auto_1571310 ) ( not ( = ?auto_1571311 ?auto_1571314 ) ) ( CALIBRATION_TARGET ?auto_1571313 ?auto_1571314 ) ( not ( = ?auto_1571314 ?auto_1571308 ) ) ( ON_BOARD ?auto_1571312 ?auto_1571315 ) ( not ( = ?auto_1571311 ?auto_1571308 ) ) ( not ( = ?auto_1571313 ?auto_1571312 ) ) ( SUPPORTS ?auto_1571312 ?auto_1571309 ) ( CALIBRATION_TARGET ?auto_1571312 ?auto_1571314 ) ( POWER_AVAIL ?auto_1571315 ) ( POINTING ?auto_1571315 ?auto_1571316 ) ( not ( = ?auto_1571314 ?auto_1571316 ) ) ( not ( = ?auto_1571308 ?auto_1571316 ) ) ( not ( = ?auto_1571309 ?auto_1571310 ) ) ( not ( = ?auto_1571311 ?auto_1571316 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_1571308 ?auto_1571309 )
      ( GET-1IMAGE ?auto_1571311 ?auto_1571310 )
      ( GET-2IMAGE-VERIFY ?auto_1571308 ?auto_1571309 ?auto_1571311 ?auto_1571310 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_1571469 - DIRECTION
      ?auto_1571470 - MODE
      ?auto_1571472 - DIRECTION
      ?auto_1571471 - MODE
      ?auto_1571473 - DIRECTION
      ?auto_1571474 - MODE
    )
    :vars
    (
      ?auto_1571476 - INSTRUMENT
      ?auto_1571475 - SATELLITE
      ?auto_1571477 - DIRECTION
      ?auto_1571478 - INSTRUMENT
      ?auto_1571479 - INSTRUMENT
      ?auto_1571480 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1571476 ?auto_1571475 ) ( SUPPORTS ?auto_1571476 ?auto_1571474 ) ( not ( = ?auto_1571473 ?auto_1571477 ) ) ( CALIBRATION_TARGET ?auto_1571476 ?auto_1571477 ) ( not ( = ?auto_1571477 ?auto_1571472 ) ) ( ON_BOARD ?auto_1571478 ?auto_1571475 ) ( not ( = ?auto_1571473 ?auto_1571472 ) ) ( not ( = ?auto_1571476 ?auto_1571478 ) ) ( SUPPORTS ?auto_1571478 ?auto_1571471 ) ( CALIBRATION_TARGET ?auto_1571478 ?auto_1571477 ) ( not ( = ?auto_1571477 ?auto_1571469 ) ) ( ON_BOARD ?auto_1571479 ?auto_1571475 ) ( not ( = ?auto_1571472 ?auto_1571469 ) ) ( not ( = ?auto_1571478 ?auto_1571479 ) ) ( SUPPORTS ?auto_1571479 ?auto_1571470 ) ( CALIBRATION_TARGET ?auto_1571479 ?auto_1571477 ) ( POWER_AVAIL ?auto_1571475 ) ( POINTING ?auto_1571475 ?auto_1571480 ) ( not ( = ?auto_1571477 ?auto_1571480 ) ) ( not ( = ?auto_1571469 ?auto_1571480 ) ) ( not ( = ?auto_1571470 ?auto_1571471 ) ) ( not ( = ?auto_1571472 ?auto_1571480 ) ) ( not ( = ?auto_1571469 ?auto_1571473 ) ) ( not ( = ?auto_1571470 ?auto_1571474 ) ) ( not ( = ?auto_1571471 ?auto_1571474 ) ) ( not ( = ?auto_1571473 ?auto_1571480 ) ) ( not ( = ?auto_1571476 ?auto_1571479 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1571469 ?auto_1571470 ?auto_1571472 ?auto_1571471 )
      ( GET-1IMAGE ?auto_1571473 ?auto_1571474 )
      ( GET-3IMAGE-VERIFY ?auto_1571469 ?auto_1571470 ?auto_1571472 ?auto_1571471 ?auto_1571473 ?auto_1571474 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1573249 - DIRECTION
      ?auto_1573250 - MODE
      ?auto_1573252 - DIRECTION
      ?auto_1573251 - MODE
      ?auto_1573253 - DIRECTION
      ?auto_1573254 - MODE
      ?auto_1573255 - DIRECTION
      ?auto_1573256 - MODE
    )
    :vars
    (
      ?auto_1573257 - INSTRUMENT
      ?auto_1573258 - SATELLITE
      ?auto_1573259 - DIRECTION
      ?auto_1573260 - INSTRUMENT
      ?auto_1573263 - INSTRUMENT
      ?auto_1573261 - INSTRUMENT
      ?auto_1573262 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1573257 ?auto_1573258 ) ( SUPPORTS ?auto_1573257 ?auto_1573256 ) ( not ( = ?auto_1573255 ?auto_1573259 ) ) ( CALIBRATION_TARGET ?auto_1573257 ?auto_1573259 ) ( not ( = ?auto_1573259 ?auto_1573253 ) ) ( ON_BOARD ?auto_1573260 ?auto_1573258 ) ( not ( = ?auto_1573255 ?auto_1573253 ) ) ( not ( = ?auto_1573257 ?auto_1573260 ) ) ( SUPPORTS ?auto_1573260 ?auto_1573254 ) ( CALIBRATION_TARGET ?auto_1573260 ?auto_1573259 ) ( not ( = ?auto_1573259 ?auto_1573252 ) ) ( ON_BOARD ?auto_1573263 ?auto_1573258 ) ( not ( = ?auto_1573253 ?auto_1573252 ) ) ( not ( = ?auto_1573260 ?auto_1573263 ) ) ( SUPPORTS ?auto_1573263 ?auto_1573251 ) ( CALIBRATION_TARGET ?auto_1573263 ?auto_1573259 ) ( not ( = ?auto_1573259 ?auto_1573249 ) ) ( ON_BOARD ?auto_1573261 ?auto_1573258 ) ( not ( = ?auto_1573252 ?auto_1573249 ) ) ( not ( = ?auto_1573263 ?auto_1573261 ) ) ( SUPPORTS ?auto_1573261 ?auto_1573250 ) ( CALIBRATION_TARGET ?auto_1573261 ?auto_1573259 ) ( POWER_AVAIL ?auto_1573258 ) ( POINTING ?auto_1573258 ?auto_1573262 ) ( not ( = ?auto_1573259 ?auto_1573262 ) ) ( not ( = ?auto_1573249 ?auto_1573262 ) ) ( not ( = ?auto_1573250 ?auto_1573251 ) ) ( not ( = ?auto_1573252 ?auto_1573262 ) ) ( not ( = ?auto_1573249 ?auto_1573253 ) ) ( not ( = ?auto_1573250 ?auto_1573254 ) ) ( not ( = ?auto_1573251 ?auto_1573254 ) ) ( not ( = ?auto_1573253 ?auto_1573262 ) ) ( not ( = ?auto_1573260 ?auto_1573261 ) ) ( not ( = ?auto_1573249 ?auto_1573255 ) ) ( not ( = ?auto_1573250 ?auto_1573256 ) ) ( not ( = ?auto_1573252 ?auto_1573255 ) ) ( not ( = ?auto_1573251 ?auto_1573256 ) ) ( not ( = ?auto_1573254 ?auto_1573256 ) ) ( not ( = ?auto_1573255 ?auto_1573262 ) ) ( not ( = ?auto_1573257 ?auto_1573263 ) ) ( not ( = ?auto_1573257 ?auto_1573261 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_1573249 ?auto_1573250 ?auto_1573252 ?auto_1573251 ?auto_1573253 ?auto_1573254 )
      ( GET-1IMAGE ?auto_1573255 ?auto_1573256 )
      ( GET-4IMAGE-VERIFY ?auto_1573249 ?auto_1573250 ?auto_1573252 ?auto_1573251 ?auto_1573253 ?auto_1573254 ?auto_1573255 ?auto_1573256 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1598723 - DIRECTION
      ?auto_1598724 - MODE
      ?auto_1598726 - DIRECTION
      ?auto_1598725 - MODE
      ?auto_1598727 - DIRECTION
      ?auto_1598728 - MODE
      ?auto_1598729 - DIRECTION
      ?auto_1598730 - MODE
      ?auto_1598731 - DIRECTION
      ?auto_1598732 - MODE
    )
    :vars
    (
      ?auto_1598736 - INSTRUMENT
      ?auto_1598733 - SATELLITE
      ?auto_1598734 - DIRECTION
      ?auto_1598735 - INSTRUMENT
      ?auto_1598740 - INSTRUMENT
      ?auto_1598737 - INSTRUMENT
      ?auto_1598738 - INSTRUMENT
      ?auto_1598739 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_1598736 ?auto_1598733 ) ( SUPPORTS ?auto_1598736 ?auto_1598732 ) ( not ( = ?auto_1598731 ?auto_1598734 ) ) ( CALIBRATION_TARGET ?auto_1598736 ?auto_1598734 ) ( not ( = ?auto_1598734 ?auto_1598729 ) ) ( ON_BOARD ?auto_1598735 ?auto_1598733 ) ( not ( = ?auto_1598731 ?auto_1598729 ) ) ( not ( = ?auto_1598736 ?auto_1598735 ) ) ( SUPPORTS ?auto_1598735 ?auto_1598730 ) ( CALIBRATION_TARGET ?auto_1598735 ?auto_1598734 ) ( not ( = ?auto_1598734 ?auto_1598727 ) ) ( ON_BOARD ?auto_1598740 ?auto_1598733 ) ( not ( = ?auto_1598729 ?auto_1598727 ) ) ( not ( = ?auto_1598735 ?auto_1598740 ) ) ( SUPPORTS ?auto_1598740 ?auto_1598728 ) ( CALIBRATION_TARGET ?auto_1598740 ?auto_1598734 ) ( not ( = ?auto_1598734 ?auto_1598726 ) ) ( ON_BOARD ?auto_1598737 ?auto_1598733 ) ( not ( = ?auto_1598727 ?auto_1598726 ) ) ( not ( = ?auto_1598740 ?auto_1598737 ) ) ( SUPPORTS ?auto_1598737 ?auto_1598725 ) ( CALIBRATION_TARGET ?auto_1598737 ?auto_1598734 ) ( not ( = ?auto_1598734 ?auto_1598723 ) ) ( ON_BOARD ?auto_1598738 ?auto_1598733 ) ( not ( = ?auto_1598726 ?auto_1598723 ) ) ( not ( = ?auto_1598737 ?auto_1598738 ) ) ( SUPPORTS ?auto_1598738 ?auto_1598724 ) ( CALIBRATION_TARGET ?auto_1598738 ?auto_1598734 ) ( POWER_AVAIL ?auto_1598733 ) ( POINTING ?auto_1598733 ?auto_1598739 ) ( not ( = ?auto_1598734 ?auto_1598739 ) ) ( not ( = ?auto_1598723 ?auto_1598739 ) ) ( not ( = ?auto_1598724 ?auto_1598725 ) ) ( not ( = ?auto_1598726 ?auto_1598739 ) ) ( not ( = ?auto_1598723 ?auto_1598727 ) ) ( not ( = ?auto_1598724 ?auto_1598728 ) ) ( not ( = ?auto_1598725 ?auto_1598728 ) ) ( not ( = ?auto_1598727 ?auto_1598739 ) ) ( not ( = ?auto_1598740 ?auto_1598738 ) ) ( not ( = ?auto_1598723 ?auto_1598729 ) ) ( not ( = ?auto_1598724 ?auto_1598730 ) ) ( not ( = ?auto_1598726 ?auto_1598729 ) ) ( not ( = ?auto_1598725 ?auto_1598730 ) ) ( not ( = ?auto_1598728 ?auto_1598730 ) ) ( not ( = ?auto_1598729 ?auto_1598739 ) ) ( not ( = ?auto_1598735 ?auto_1598737 ) ) ( not ( = ?auto_1598735 ?auto_1598738 ) ) ( not ( = ?auto_1598723 ?auto_1598731 ) ) ( not ( = ?auto_1598724 ?auto_1598732 ) ) ( not ( = ?auto_1598726 ?auto_1598731 ) ) ( not ( = ?auto_1598725 ?auto_1598732 ) ) ( not ( = ?auto_1598727 ?auto_1598731 ) ) ( not ( = ?auto_1598728 ?auto_1598732 ) ) ( not ( = ?auto_1598730 ?auto_1598732 ) ) ( not ( = ?auto_1598731 ?auto_1598739 ) ) ( not ( = ?auto_1598736 ?auto_1598740 ) ) ( not ( = ?auto_1598736 ?auto_1598737 ) ) ( not ( = ?auto_1598736 ?auto_1598738 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_1598723 ?auto_1598724 ?auto_1598726 ?auto_1598725 ?auto_1598727 ?auto_1598728 ?auto_1598729 ?auto_1598730 )
      ( GET-1IMAGE ?auto_1598731 ?auto_1598732 )
      ( GET-5IMAGE-VERIFY ?auto_1598723 ?auto_1598724 ?auto_1598726 ?auto_1598725 ?auto_1598727 ?auto_1598728 ?auto_1598729 ?auto_1598730 ?auto_1598731 ?auto_1598732 ) )
  )

  ( :method GET-6IMAGE
    :parameters
    (
      ?auto_2034948 - DIRECTION
      ?auto_2034949 - MODE
      ?auto_2034951 - DIRECTION
      ?auto_2034950 - MODE
      ?auto_2034952 - DIRECTION
      ?auto_2034953 - MODE
      ?auto_2034954 - DIRECTION
      ?auto_2034955 - MODE
      ?auto_2034956 - DIRECTION
      ?auto_2034957 - MODE
      ?auto_2034959 - DIRECTION
      ?auto_2034958 - MODE
    )
    :vars
    (
      ?auto_2034962 - INSTRUMENT
      ?auto_2034961 - SATELLITE
      ?auto_2034960 - DIRECTION
      ?auto_2034963 - INSTRUMENT
      ?auto_2034967 - INSTRUMENT
      ?auto_2034965 - INSTRUMENT
      ?auto_2034966 - INSTRUMENT
      ?auto_2034968 - INSTRUMENT
      ?auto_2034964 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_2034962 ?auto_2034961 ) ( SUPPORTS ?auto_2034962 ?auto_2034958 ) ( not ( = ?auto_2034959 ?auto_2034960 ) ) ( CALIBRATION_TARGET ?auto_2034962 ?auto_2034960 ) ( not ( = ?auto_2034960 ?auto_2034956 ) ) ( ON_BOARD ?auto_2034963 ?auto_2034961 ) ( not ( = ?auto_2034959 ?auto_2034956 ) ) ( not ( = ?auto_2034962 ?auto_2034963 ) ) ( SUPPORTS ?auto_2034963 ?auto_2034957 ) ( CALIBRATION_TARGET ?auto_2034963 ?auto_2034960 ) ( not ( = ?auto_2034960 ?auto_2034954 ) ) ( ON_BOARD ?auto_2034967 ?auto_2034961 ) ( not ( = ?auto_2034956 ?auto_2034954 ) ) ( not ( = ?auto_2034963 ?auto_2034967 ) ) ( SUPPORTS ?auto_2034967 ?auto_2034955 ) ( CALIBRATION_TARGET ?auto_2034967 ?auto_2034960 ) ( not ( = ?auto_2034960 ?auto_2034952 ) ) ( ON_BOARD ?auto_2034965 ?auto_2034961 ) ( not ( = ?auto_2034954 ?auto_2034952 ) ) ( not ( = ?auto_2034967 ?auto_2034965 ) ) ( SUPPORTS ?auto_2034965 ?auto_2034953 ) ( CALIBRATION_TARGET ?auto_2034965 ?auto_2034960 ) ( not ( = ?auto_2034960 ?auto_2034951 ) ) ( ON_BOARD ?auto_2034966 ?auto_2034961 ) ( not ( = ?auto_2034952 ?auto_2034951 ) ) ( not ( = ?auto_2034965 ?auto_2034966 ) ) ( SUPPORTS ?auto_2034966 ?auto_2034950 ) ( CALIBRATION_TARGET ?auto_2034966 ?auto_2034960 ) ( not ( = ?auto_2034960 ?auto_2034948 ) ) ( ON_BOARD ?auto_2034968 ?auto_2034961 ) ( not ( = ?auto_2034951 ?auto_2034948 ) ) ( not ( = ?auto_2034966 ?auto_2034968 ) ) ( SUPPORTS ?auto_2034968 ?auto_2034949 ) ( CALIBRATION_TARGET ?auto_2034968 ?auto_2034960 ) ( POWER_AVAIL ?auto_2034961 ) ( POINTING ?auto_2034961 ?auto_2034964 ) ( not ( = ?auto_2034960 ?auto_2034964 ) ) ( not ( = ?auto_2034948 ?auto_2034964 ) ) ( not ( = ?auto_2034949 ?auto_2034950 ) ) ( not ( = ?auto_2034951 ?auto_2034964 ) ) ( not ( = ?auto_2034948 ?auto_2034952 ) ) ( not ( = ?auto_2034949 ?auto_2034953 ) ) ( not ( = ?auto_2034950 ?auto_2034953 ) ) ( not ( = ?auto_2034952 ?auto_2034964 ) ) ( not ( = ?auto_2034965 ?auto_2034968 ) ) ( not ( = ?auto_2034948 ?auto_2034954 ) ) ( not ( = ?auto_2034949 ?auto_2034955 ) ) ( not ( = ?auto_2034951 ?auto_2034954 ) ) ( not ( = ?auto_2034950 ?auto_2034955 ) ) ( not ( = ?auto_2034953 ?auto_2034955 ) ) ( not ( = ?auto_2034954 ?auto_2034964 ) ) ( not ( = ?auto_2034967 ?auto_2034966 ) ) ( not ( = ?auto_2034967 ?auto_2034968 ) ) ( not ( = ?auto_2034948 ?auto_2034956 ) ) ( not ( = ?auto_2034949 ?auto_2034957 ) ) ( not ( = ?auto_2034951 ?auto_2034956 ) ) ( not ( = ?auto_2034950 ?auto_2034957 ) ) ( not ( = ?auto_2034952 ?auto_2034956 ) ) ( not ( = ?auto_2034953 ?auto_2034957 ) ) ( not ( = ?auto_2034955 ?auto_2034957 ) ) ( not ( = ?auto_2034956 ?auto_2034964 ) ) ( not ( = ?auto_2034963 ?auto_2034965 ) ) ( not ( = ?auto_2034963 ?auto_2034966 ) ) ( not ( = ?auto_2034963 ?auto_2034968 ) ) ( not ( = ?auto_2034948 ?auto_2034959 ) ) ( not ( = ?auto_2034949 ?auto_2034958 ) ) ( not ( = ?auto_2034951 ?auto_2034959 ) ) ( not ( = ?auto_2034950 ?auto_2034958 ) ) ( not ( = ?auto_2034952 ?auto_2034959 ) ) ( not ( = ?auto_2034953 ?auto_2034958 ) ) ( not ( = ?auto_2034954 ?auto_2034959 ) ) ( not ( = ?auto_2034955 ?auto_2034958 ) ) ( not ( = ?auto_2034957 ?auto_2034958 ) ) ( not ( = ?auto_2034959 ?auto_2034964 ) ) ( not ( = ?auto_2034962 ?auto_2034967 ) ) ( not ( = ?auto_2034962 ?auto_2034965 ) ) ( not ( = ?auto_2034962 ?auto_2034966 ) ) ( not ( = ?auto_2034962 ?auto_2034968 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_2034948 ?auto_2034949 ?auto_2034951 ?auto_2034950 ?auto_2034952 ?auto_2034953 ?auto_2034954 ?auto_2034955 ?auto_2034956 ?auto_2034957 )
      ( GET-1IMAGE ?auto_2034959 ?auto_2034958 )
      ( GET-6IMAGE-VERIFY ?auto_2034948 ?auto_2034949 ?auto_2034951 ?auto_2034950 ?auto_2034952 ?auto_2034953 ?auto_2034954 ?auto_2034955 ?auto_2034956 ?auto_2034957 ?auto_2034959 ?auto_2034958 ) )
  )

)

