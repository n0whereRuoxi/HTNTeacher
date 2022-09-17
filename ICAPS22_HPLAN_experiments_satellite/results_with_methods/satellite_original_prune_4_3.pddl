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

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_275170 - DIRECTION
      ?auto_275171 - MODE
    )
    :vars
    (
      ?auto_275172 - INSTRUMENT
      ?auto_275173 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_275172 ) ( ON_BOARD ?auto_275172 ?auto_275173 ) ( SUPPORTS ?auto_275172 ?auto_275171 ) ( POWER_ON ?auto_275172 ) ( POINTING ?auto_275173 ?auto_275170 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_275173 ?auto_275170 ?auto_275172 ?auto_275171 )
      ( GET-1IMAGE-VERIFY ?auto_275170 ?auto_275171 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_275198 - DIRECTION
      ?auto_275199 - MODE
    )
    :vars
    (
      ?auto_275201 - INSTRUMENT
      ?auto_275200 - SATELLITE
      ?auto_275202 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_275201 ) ( ON_BOARD ?auto_275201 ?auto_275200 ) ( SUPPORTS ?auto_275201 ?auto_275199 ) ( POWER_ON ?auto_275201 ) ( POINTING ?auto_275200 ?auto_275202 ) ( not ( = ?auto_275198 ?auto_275202 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_275200 ?auto_275198 ?auto_275202 )
      ( GET-1IMAGE ?auto_275198 ?auto_275199 )
      ( GET-1IMAGE-VERIFY ?auto_275198 ?auto_275199 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_275230 - DIRECTION
      ?auto_275231 - MODE
    )
    :vars
    (
      ?auto_275234 - INSTRUMENT
      ?auto_275233 - SATELLITE
      ?auto_275232 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275234 ?auto_275233 ) ( SUPPORTS ?auto_275234 ?auto_275231 ) ( POWER_ON ?auto_275234 ) ( POINTING ?auto_275233 ?auto_275232 ) ( not ( = ?auto_275230 ?auto_275232 ) ) ( CALIBRATION_TARGET ?auto_275234 ?auto_275232 ) ( NOT_CALIBRATED ?auto_275234 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_275233 ?auto_275234 ?auto_275232 )
      ( GET-1IMAGE ?auto_275230 ?auto_275231 )
      ( GET-1IMAGE-VERIFY ?auto_275230 ?auto_275231 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_275262 - DIRECTION
      ?auto_275263 - MODE
    )
    :vars
    (
      ?auto_275266 - INSTRUMENT
      ?auto_275264 - SATELLITE
      ?auto_275265 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275266 ?auto_275264 ) ( SUPPORTS ?auto_275266 ?auto_275263 ) ( POINTING ?auto_275264 ?auto_275265 ) ( not ( = ?auto_275262 ?auto_275265 ) ) ( CALIBRATION_TARGET ?auto_275266 ?auto_275265 ) ( POWER_AVAIL ?auto_275264 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_275266 ?auto_275264 )
      ( GET-1IMAGE ?auto_275262 ?auto_275263 )
      ( GET-1IMAGE-VERIFY ?auto_275262 ?auto_275263 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_275294 - DIRECTION
      ?auto_275295 - MODE
    )
    :vars
    (
      ?auto_275296 - INSTRUMENT
      ?auto_275297 - SATELLITE
      ?auto_275298 - DIRECTION
      ?auto_275299 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275296 ?auto_275297 ) ( SUPPORTS ?auto_275296 ?auto_275295 ) ( not ( = ?auto_275294 ?auto_275298 ) ) ( CALIBRATION_TARGET ?auto_275296 ?auto_275298 ) ( POWER_AVAIL ?auto_275297 ) ( POINTING ?auto_275297 ?auto_275299 ) ( not ( = ?auto_275298 ?auto_275299 ) ) ( not ( = ?auto_275294 ?auto_275299 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_275297 ?auto_275298 ?auto_275299 )
      ( GET-1IMAGE ?auto_275294 ?auto_275295 )
      ( GET-1IMAGE-VERIFY ?auto_275294 ?auto_275295 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_275511 - DIRECTION
      ?auto_275512 - MODE
      ?auto_275513 - DIRECTION
      ?auto_275510 - MODE
    )
    :vars
    (
      ?auto_275515 - INSTRUMENT
      ?auto_275514 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_275513 ?auto_275511 ) ) ( CALIBRATED ?auto_275515 ) ( ON_BOARD ?auto_275515 ?auto_275514 ) ( SUPPORTS ?auto_275515 ?auto_275510 ) ( POWER_ON ?auto_275515 ) ( POINTING ?auto_275514 ?auto_275513 ) ( HAVE_IMAGE ?auto_275511 ?auto_275512 ) ( not ( = ?auto_275512 ?auto_275510 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_275513 ?auto_275510 )
      ( GET-2IMAGE-VERIFY ?auto_275511 ?auto_275512 ?auto_275513 ?auto_275510 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_275517 - DIRECTION
      ?auto_275518 - MODE
      ?auto_275519 - DIRECTION
      ?auto_275516 - MODE
    )
    :vars
    (
      ?auto_275521 - INSTRUMENT
      ?auto_275520 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_275519 ?auto_275517 ) ) ( CALIBRATED ?auto_275521 ) ( ON_BOARD ?auto_275521 ?auto_275520 ) ( SUPPORTS ?auto_275521 ?auto_275518 ) ( POWER_ON ?auto_275521 ) ( POINTING ?auto_275520 ?auto_275517 ) ( HAVE_IMAGE ?auto_275519 ?auto_275516 ) ( not ( = ?auto_275518 ?auto_275516 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_275517 ?auto_275518 )
      ( GET-2IMAGE-VERIFY ?auto_275517 ?auto_275518 ?auto_275519 ?auto_275516 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_275740 - DIRECTION
      ?auto_275741 - MODE
      ?auto_275742 - DIRECTION
      ?auto_275739 - MODE
    )
    :vars
    (
      ?auto_275745 - INSTRUMENT
      ?auto_275743 - SATELLITE
      ?auto_275744 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_275742 ?auto_275740 ) ) ( CALIBRATED ?auto_275745 ) ( ON_BOARD ?auto_275745 ?auto_275743 ) ( SUPPORTS ?auto_275745 ?auto_275739 ) ( POWER_ON ?auto_275745 ) ( POINTING ?auto_275743 ?auto_275744 ) ( not ( = ?auto_275742 ?auto_275744 ) ) ( HAVE_IMAGE ?auto_275740 ?auto_275741 ) ( not ( = ?auto_275740 ?auto_275744 ) ) ( not ( = ?auto_275741 ?auto_275739 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_275742 ?auto_275739 )
      ( GET-2IMAGE-VERIFY ?auto_275740 ?auto_275741 ?auto_275742 ?auto_275739 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_275747 - DIRECTION
      ?auto_275748 - MODE
      ?auto_275749 - DIRECTION
      ?auto_275746 - MODE
    )
    :vars
    (
      ?auto_275752 - INSTRUMENT
      ?auto_275750 - SATELLITE
      ?auto_275751 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_275749 ?auto_275747 ) ) ( CALIBRATED ?auto_275752 ) ( ON_BOARD ?auto_275752 ?auto_275750 ) ( SUPPORTS ?auto_275752 ?auto_275748 ) ( POWER_ON ?auto_275752 ) ( POINTING ?auto_275750 ?auto_275751 ) ( not ( = ?auto_275747 ?auto_275751 ) ) ( HAVE_IMAGE ?auto_275749 ?auto_275746 ) ( not ( = ?auto_275749 ?auto_275751 ) ) ( not ( = ?auto_275746 ?auto_275748 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_275749 ?auto_275746 ?auto_275747 ?auto_275748 )
      ( GET-2IMAGE-VERIFY ?auto_275747 ?auto_275748 ?auto_275749 ?auto_275746 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_275994 - DIRECTION
      ?auto_275995 - MODE
    )
    :vars
    (
      ?auto_275999 - DIRECTION
      ?auto_276000 - INSTRUMENT
      ?auto_275997 - SATELLITE
      ?auto_275998 - DIRECTION
      ?auto_275996 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_275994 ?auto_275999 ) ) ( ON_BOARD ?auto_276000 ?auto_275997 ) ( SUPPORTS ?auto_276000 ?auto_275995 ) ( POWER_ON ?auto_276000 ) ( POINTING ?auto_275997 ?auto_275998 ) ( not ( = ?auto_275994 ?auto_275998 ) ) ( HAVE_IMAGE ?auto_275999 ?auto_275996 ) ( not ( = ?auto_275999 ?auto_275998 ) ) ( not ( = ?auto_275996 ?auto_275995 ) ) ( CALIBRATION_TARGET ?auto_276000 ?auto_275998 ) ( NOT_CALIBRATED ?auto_276000 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_275997 ?auto_276000 ?auto_275998 )
      ( GET-2IMAGE ?auto_275999 ?auto_275996 ?auto_275994 ?auto_275995 )
      ( GET-1IMAGE-VERIFY ?auto_275994 ?auto_275995 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_276002 - DIRECTION
      ?auto_276003 - MODE
      ?auto_276004 - DIRECTION
      ?auto_276001 - MODE
    )
    :vars
    (
      ?auto_276007 - INSTRUMENT
      ?auto_276005 - SATELLITE
      ?auto_276006 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_276004 ?auto_276002 ) ) ( ON_BOARD ?auto_276007 ?auto_276005 ) ( SUPPORTS ?auto_276007 ?auto_276001 ) ( POWER_ON ?auto_276007 ) ( POINTING ?auto_276005 ?auto_276006 ) ( not ( = ?auto_276004 ?auto_276006 ) ) ( HAVE_IMAGE ?auto_276002 ?auto_276003 ) ( not ( = ?auto_276002 ?auto_276006 ) ) ( not ( = ?auto_276003 ?auto_276001 ) ) ( CALIBRATION_TARGET ?auto_276007 ?auto_276006 ) ( NOT_CALIBRATED ?auto_276007 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_276004 ?auto_276001 )
      ( GET-2IMAGE-VERIFY ?auto_276002 ?auto_276003 ?auto_276004 ?auto_276001 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_276009 - DIRECTION
      ?auto_276010 - MODE
      ?auto_276011 - DIRECTION
      ?auto_276008 - MODE
    )
    :vars
    (
      ?auto_276012 - INSTRUMENT
      ?auto_276013 - SATELLITE
      ?auto_276014 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_276011 ?auto_276009 ) ) ( ON_BOARD ?auto_276012 ?auto_276013 ) ( SUPPORTS ?auto_276012 ?auto_276010 ) ( POWER_ON ?auto_276012 ) ( POINTING ?auto_276013 ?auto_276014 ) ( not ( = ?auto_276009 ?auto_276014 ) ) ( HAVE_IMAGE ?auto_276011 ?auto_276008 ) ( not ( = ?auto_276011 ?auto_276014 ) ) ( not ( = ?auto_276008 ?auto_276010 ) ) ( CALIBRATION_TARGET ?auto_276012 ?auto_276014 ) ( NOT_CALIBRATED ?auto_276012 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_276011 ?auto_276008 ?auto_276009 ?auto_276010 )
      ( GET-2IMAGE-VERIFY ?auto_276009 ?auto_276010 ?auto_276011 ?auto_276008 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_276256 - DIRECTION
      ?auto_276257 - MODE
    )
    :vars
    (
      ?auto_276261 - DIRECTION
      ?auto_276259 - INSTRUMENT
      ?auto_276260 - SATELLITE
      ?auto_276262 - DIRECTION
      ?auto_276258 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_276256 ?auto_276261 ) ) ( ON_BOARD ?auto_276259 ?auto_276260 ) ( SUPPORTS ?auto_276259 ?auto_276257 ) ( POINTING ?auto_276260 ?auto_276262 ) ( not ( = ?auto_276256 ?auto_276262 ) ) ( HAVE_IMAGE ?auto_276261 ?auto_276258 ) ( not ( = ?auto_276261 ?auto_276262 ) ) ( not ( = ?auto_276258 ?auto_276257 ) ) ( CALIBRATION_TARGET ?auto_276259 ?auto_276262 ) ( POWER_AVAIL ?auto_276260 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_276259 ?auto_276260 )
      ( GET-2IMAGE ?auto_276261 ?auto_276258 ?auto_276256 ?auto_276257 )
      ( GET-1IMAGE-VERIFY ?auto_276256 ?auto_276257 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_276264 - DIRECTION
      ?auto_276265 - MODE
      ?auto_276266 - DIRECTION
      ?auto_276263 - MODE
    )
    :vars
    (
      ?auto_276267 - INSTRUMENT
      ?auto_276269 - SATELLITE
      ?auto_276268 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_276266 ?auto_276264 ) ) ( ON_BOARD ?auto_276267 ?auto_276269 ) ( SUPPORTS ?auto_276267 ?auto_276263 ) ( POINTING ?auto_276269 ?auto_276268 ) ( not ( = ?auto_276266 ?auto_276268 ) ) ( HAVE_IMAGE ?auto_276264 ?auto_276265 ) ( not ( = ?auto_276264 ?auto_276268 ) ) ( not ( = ?auto_276265 ?auto_276263 ) ) ( CALIBRATION_TARGET ?auto_276267 ?auto_276268 ) ( POWER_AVAIL ?auto_276269 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_276266 ?auto_276263 )
      ( GET-2IMAGE-VERIFY ?auto_276264 ?auto_276265 ?auto_276266 ?auto_276263 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_276271 - DIRECTION
      ?auto_276272 - MODE
      ?auto_276273 - DIRECTION
      ?auto_276270 - MODE
    )
    :vars
    (
      ?auto_276274 - INSTRUMENT
      ?auto_276276 - SATELLITE
      ?auto_276275 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_276273 ?auto_276271 ) ) ( ON_BOARD ?auto_276274 ?auto_276276 ) ( SUPPORTS ?auto_276274 ?auto_276272 ) ( POINTING ?auto_276276 ?auto_276275 ) ( not ( = ?auto_276271 ?auto_276275 ) ) ( HAVE_IMAGE ?auto_276273 ?auto_276270 ) ( not ( = ?auto_276273 ?auto_276275 ) ) ( not ( = ?auto_276270 ?auto_276272 ) ) ( CALIBRATION_TARGET ?auto_276274 ?auto_276275 ) ( POWER_AVAIL ?auto_276276 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_276273 ?auto_276270 ?auto_276271 ?auto_276272 )
      ( GET-2IMAGE-VERIFY ?auto_276271 ?auto_276272 ?auto_276273 ?auto_276270 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_276518 - DIRECTION
      ?auto_276519 - MODE
    )
    :vars
    (
      ?auto_276520 - DIRECTION
      ?auto_276521 - INSTRUMENT
      ?auto_276524 - SATELLITE
      ?auto_276523 - DIRECTION
      ?auto_276522 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_276518 ?auto_276520 ) ) ( ON_BOARD ?auto_276521 ?auto_276524 ) ( SUPPORTS ?auto_276521 ?auto_276519 ) ( not ( = ?auto_276518 ?auto_276523 ) ) ( HAVE_IMAGE ?auto_276520 ?auto_276522 ) ( not ( = ?auto_276520 ?auto_276523 ) ) ( not ( = ?auto_276522 ?auto_276519 ) ) ( CALIBRATION_TARGET ?auto_276521 ?auto_276523 ) ( POWER_AVAIL ?auto_276524 ) ( POINTING ?auto_276524 ?auto_276520 ) )
    :subtasks
    ( ( !TURN_TO ?auto_276524 ?auto_276523 ?auto_276520 )
      ( GET-2IMAGE ?auto_276520 ?auto_276522 ?auto_276518 ?auto_276519 )
      ( GET-1IMAGE-VERIFY ?auto_276518 ?auto_276519 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_276526 - DIRECTION
      ?auto_276527 - MODE
      ?auto_276528 - DIRECTION
      ?auto_276525 - MODE
    )
    :vars
    (
      ?auto_276531 - INSTRUMENT
      ?auto_276530 - SATELLITE
      ?auto_276529 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_276528 ?auto_276526 ) ) ( ON_BOARD ?auto_276531 ?auto_276530 ) ( SUPPORTS ?auto_276531 ?auto_276525 ) ( not ( = ?auto_276528 ?auto_276529 ) ) ( HAVE_IMAGE ?auto_276526 ?auto_276527 ) ( not ( = ?auto_276526 ?auto_276529 ) ) ( not ( = ?auto_276527 ?auto_276525 ) ) ( CALIBRATION_TARGET ?auto_276531 ?auto_276529 ) ( POWER_AVAIL ?auto_276530 ) ( POINTING ?auto_276530 ?auto_276526 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_276528 ?auto_276525 )
      ( GET-2IMAGE-VERIFY ?auto_276526 ?auto_276527 ?auto_276528 ?auto_276525 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_276533 - DIRECTION
      ?auto_276534 - MODE
      ?auto_276535 - DIRECTION
      ?auto_276532 - MODE
    )
    :vars
    (
      ?auto_276538 - INSTRUMENT
      ?auto_276536 - SATELLITE
      ?auto_276537 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_276535 ?auto_276533 ) ) ( ON_BOARD ?auto_276538 ?auto_276536 ) ( SUPPORTS ?auto_276538 ?auto_276534 ) ( not ( = ?auto_276533 ?auto_276537 ) ) ( HAVE_IMAGE ?auto_276535 ?auto_276532 ) ( not ( = ?auto_276535 ?auto_276537 ) ) ( not ( = ?auto_276532 ?auto_276534 ) ) ( CALIBRATION_TARGET ?auto_276538 ?auto_276537 ) ( POWER_AVAIL ?auto_276536 ) ( POINTING ?auto_276536 ?auto_276535 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_276535 ?auto_276532 ?auto_276533 ?auto_276534 )
      ( GET-2IMAGE-VERIFY ?auto_276533 ?auto_276534 ?auto_276535 ?auto_276532 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_276780 - DIRECTION
      ?auto_276781 - MODE
    )
    :vars
    (
      ?auto_276786 - DIRECTION
      ?auto_276785 - INSTRUMENT
      ?auto_276783 - SATELLITE
      ?auto_276784 - DIRECTION
      ?auto_276782 - MODE
      ?auto_276787 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_276780 ?auto_276786 ) ) ( ON_BOARD ?auto_276785 ?auto_276783 ) ( SUPPORTS ?auto_276785 ?auto_276781 ) ( not ( = ?auto_276780 ?auto_276784 ) ) ( HAVE_IMAGE ?auto_276786 ?auto_276782 ) ( not ( = ?auto_276786 ?auto_276784 ) ) ( not ( = ?auto_276782 ?auto_276781 ) ) ( CALIBRATION_TARGET ?auto_276785 ?auto_276784 ) ( POINTING ?auto_276783 ?auto_276786 ) ( ON_BOARD ?auto_276787 ?auto_276783 ) ( POWER_ON ?auto_276787 ) ( not ( = ?auto_276785 ?auto_276787 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_276787 ?auto_276783 )
      ( GET-2IMAGE ?auto_276786 ?auto_276782 ?auto_276780 ?auto_276781 )
      ( GET-1IMAGE-VERIFY ?auto_276780 ?auto_276781 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_276789 - DIRECTION
      ?auto_276790 - MODE
      ?auto_276791 - DIRECTION
      ?auto_276788 - MODE
    )
    :vars
    (
      ?auto_276795 - INSTRUMENT
      ?auto_276793 - SATELLITE
      ?auto_276794 - DIRECTION
      ?auto_276792 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_276791 ?auto_276789 ) ) ( ON_BOARD ?auto_276795 ?auto_276793 ) ( SUPPORTS ?auto_276795 ?auto_276788 ) ( not ( = ?auto_276791 ?auto_276794 ) ) ( HAVE_IMAGE ?auto_276789 ?auto_276790 ) ( not ( = ?auto_276789 ?auto_276794 ) ) ( not ( = ?auto_276790 ?auto_276788 ) ) ( CALIBRATION_TARGET ?auto_276795 ?auto_276794 ) ( POINTING ?auto_276793 ?auto_276789 ) ( ON_BOARD ?auto_276792 ?auto_276793 ) ( POWER_ON ?auto_276792 ) ( not ( = ?auto_276795 ?auto_276792 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_276791 ?auto_276788 )
      ( GET-2IMAGE-VERIFY ?auto_276789 ?auto_276790 ?auto_276791 ?auto_276788 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_276797 - DIRECTION
      ?auto_276798 - MODE
      ?auto_276799 - DIRECTION
      ?auto_276796 - MODE
    )
    :vars
    (
      ?auto_276803 - INSTRUMENT
      ?auto_276801 - SATELLITE
      ?auto_276800 - DIRECTION
      ?auto_276802 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_276799 ?auto_276797 ) ) ( ON_BOARD ?auto_276803 ?auto_276801 ) ( SUPPORTS ?auto_276803 ?auto_276798 ) ( not ( = ?auto_276797 ?auto_276800 ) ) ( HAVE_IMAGE ?auto_276799 ?auto_276796 ) ( not ( = ?auto_276799 ?auto_276800 ) ) ( not ( = ?auto_276796 ?auto_276798 ) ) ( CALIBRATION_TARGET ?auto_276803 ?auto_276800 ) ( POINTING ?auto_276801 ?auto_276799 ) ( ON_BOARD ?auto_276802 ?auto_276801 ) ( POWER_ON ?auto_276802 ) ( not ( = ?auto_276803 ?auto_276802 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_276799 ?auto_276796 ?auto_276797 ?auto_276798 )
      ( GET-2IMAGE-VERIFY ?auto_276797 ?auto_276798 ?auto_276799 ?auto_276796 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_277068 - DIRECTION
      ?auto_277069 - MODE
    )
    :vars
    (
      ?auto_277071 - DIRECTION
      ?auto_277074 - INSTRUMENT
      ?auto_277072 - SATELLITE
      ?auto_277070 - DIRECTION
      ?auto_277075 - MODE
      ?auto_277073 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_277068 ?auto_277071 ) ) ( ON_BOARD ?auto_277074 ?auto_277072 ) ( SUPPORTS ?auto_277074 ?auto_277069 ) ( not ( = ?auto_277068 ?auto_277070 ) ) ( not ( = ?auto_277071 ?auto_277070 ) ) ( not ( = ?auto_277075 ?auto_277069 ) ) ( CALIBRATION_TARGET ?auto_277074 ?auto_277070 ) ( POINTING ?auto_277072 ?auto_277071 ) ( ON_BOARD ?auto_277073 ?auto_277072 ) ( POWER_ON ?auto_277073 ) ( not ( = ?auto_277074 ?auto_277073 ) ) ( CALIBRATED ?auto_277073 ) ( SUPPORTS ?auto_277073 ?auto_277075 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_277071 ?auto_277075 )
      ( GET-2IMAGE ?auto_277071 ?auto_277075 ?auto_277068 ?auto_277069 )
      ( GET-1IMAGE-VERIFY ?auto_277068 ?auto_277069 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_277077 - DIRECTION
      ?auto_277078 - MODE
      ?auto_277079 - DIRECTION
      ?auto_277076 - MODE
    )
    :vars
    (
      ?auto_277080 - INSTRUMENT
      ?auto_277081 - SATELLITE
      ?auto_277082 - DIRECTION
      ?auto_277083 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_277079 ?auto_277077 ) ) ( ON_BOARD ?auto_277080 ?auto_277081 ) ( SUPPORTS ?auto_277080 ?auto_277076 ) ( not ( = ?auto_277079 ?auto_277082 ) ) ( not ( = ?auto_277077 ?auto_277082 ) ) ( not ( = ?auto_277078 ?auto_277076 ) ) ( CALIBRATION_TARGET ?auto_277080 ?auto_277082 ) ( POINTING ?auto_277081 ?auto_277077 ) ( ON_BOARD ?auto_277083 ?auto_277081 ) ( POWER_ON ?auto_277083 ) ( not ( = ?auto_277080 ?auto_277083 ) ) ( CALIBRATED ?auto_277083 ) ( SUPPORTS ?auto_277083 ?auto_277078 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_277079 ?auto_277076 )
      ( GET-2IMAGE-VERIFY ?auto_277077 ?auto_277078 ?auto_277079 ?auto_277076 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_277085 - DIRECTION
      ?auto_277086 - MODE
      ?auto_277087 - DIRECTION
      ?auto_277084 - MODE
    )
    :vars
    (
      ?auto_277090 - INSTRUMENT
      ?auto_277091 - SATELLITE
      ?auto_277089 - DIRECTION
      ?auto_277088 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_277087 ?auto_277085 ) ) ( ON_BOARD ?auto_277090 ?auto_277091 ) ( SUPPORTS ?auto_277090 ?auto_277086 ) ( not ( = ?auto_277085 ?auto_277089 ) ) ( not ( = ?auto_277087 ?auto_277089 ) ) ( not ( = ?auto_277084 ?auto_277086 ) ) ( CALIBRATION_TARGET ?auto_277090 ?auto_277089 ) ( POINTING ?auto_277091 ?auto_277087 ) ( ON_BOARD ?auto_277088 ?auto_277091 ) ( POWER_ON ?auto_277088 ) ( not ( = ?auto_277090 ?auto_277088 ) ) ( CALIBRATED ?auto_277088 ) ( SUPPORTS ?auto_277088 ?auto_277084 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_277087 ?auto_277084 ?auto_277085 ?auto_277086 )
      ( GET-2IMAGE-VERIFY ?auto_277085 ?auto_277086 ?auto_277087 ?auto_277084 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_277356 - DIRECTION
      ?auto_277357 - MODE
    )
    :vars
    (
      ?auto_277358 - DIRECTION
      ?auto_277362 - INSTRUMENT
      ?auto_277363 - SATELLITE
      ?auto_277360 - DIRECTION
      ?auto_277361 - MODE
      ?auto_277359 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_277356 ?auto_277358 ) ) ( ON_BOARD ?auto_277362 ?auto_277363 ) ( SUPPORTS ?auto_277362 ?auto_277357 ) ( not ( = ?auto_277356 ?auto_277360 ) ) ( not ( = ?auto_277358 ?auto_277360 ) ) ( not ( = ?auto_277361 ?auto_277357 ) ) ( CALIBRATION_TARGET ?auto_277362 ?auto_277360 ) ( ON_BOARD ?auto_277359 ?auto_277363 ) ( POWER_ON ?auto_277359 ) ( not ( = ?auto_277362 ?auto_277359 ) ) ( CALIBRATED ?auto_277359 ) ( SUPPORTS ?auto_277359 ?auto_277361 ) ( POINTING ?auto_277363 ?auto_277360 ) )
    :subtasks
    ( ( !TURN_TO ?auto_277363 ?auto_277358 ?auto_277360 )
      ( GET-2IMAGE ?auto_277358 ?auto_277361 ?auto_277356 ?auto_277357 )
      ( GET-1IMAGE-VERIFY ?auto_277356 ?auto_277357 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_277365 - DIRECTION
      ?auto_277366 - MODE
      ?auto_277367 - DIRECTION
      ?auto_277364 - MODE
    )
    :vars
    (
      ?auto_277371 - INSTRUMENT
      ?auto_277369 - SATELLITE
      ?auto_277368 - DIRECTION
      ?auto_277370 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_277367 ?auto_277365 ) ) ( ON_BOARD ?auto_277371 ?auto_277369 ) ( SUPPORTS ?auto_277371 ?auto_277364 ) ( not ( = ?auto_277367 ?auto_277368 ) ) ( not ( = ?auto_277365 ?auto_277368 ) ) ( not ( = ?auto_277366 ?auto_277364 ) ) ( CALIBRATION_TARGET ?auto_277371 ?auto_277368 ) ( ON_BOARD ?auto_277370 ?auto_277369 ) ( POWER_ON ?auto_277370 ) ( not ( = ?auto_277371 ?auto_277370 ) ) ( CALIBRATED ?auto_277370 ) ( SUPPORTS ?auto_277370 ?auto_277366 ) ( POINTING ?auto_277369 ?auto_277368 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_277367 ?auto_277364 )
      ( GET-2IMAGE-VERIFY ?auto_277365 ?auto_277366 ?auto_277367 ?auto_277364 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_277373 - DIRECTION
      ?auto_277374 - MODE
      ?auto_277375 - DIRECTION
      ?auto_277372 - MODE
    )
    :vars
    (
      ?auto_277377 - INSTRUMENT
      ?auto_277376 - SATELLITE
      ?auto_277378 - DIRECTION
      ?auto_277379 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_277375 ?auto_277373 ) ) ( ON_BOARD ?auto_277377 ?auto_277376 ) ( SUPPORTS ?auto_277377 ?auto_277374 ) ( not ( = ?auto_277373 ?auto_277378 ) ) ( not ( = ?auto_277375 ?auto_277378 ) ) ( not ( = ?auto_277372 ?auto_277374 ) ) ( CALIBRATION_TARGET ?auto_277377 ?auto_277378 ) ( ON_BOARD ?auto_277379 ?auto_277376 ) ( POWER_ON ?auto_277379 ) ( not ( = ?auto_277377 ?auto_277379 ) ) ( CALIBRATED ?auto_277379 ) ( SUPPORTS ?auto_277379 ?auto_277372 ) ( POINTING ?auto_277376 ?auto_277378 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_277375 ?auto_277372 ?auto_277373 ?auto_277374 )
      ( GET-2IMAGE-VERIFY ?auto_277373 ?auto_277374 ?auto_277375 ?auto_277372 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_277644 - DIRECTION
      ?auto_277645 - MODE
    )
    :vars
    (
      ?auto_277648 - DIRECTION
      ?auto_277649 - INSTRUMENT
      ?auto_277646 - SATELLITE
      ?auto_277650 - DIRECTION
      ?auto_277647 - MODE
      ?auto_277651 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_277644 ?auto_277648 ) ) ( ON_BOARD ?auto_277649 ?auto_277646 ) ( SUPPORTS ?auto_277649 ?auto_277645 ) ( not ( = ?auto_277644 ?auto_277650 ) ) ( not ( = ?auto_277648 ?auto_277650 ) ) ( not ( = ?auto_277647 ?auto_277645 ) ) ( CALIBRATION_TARGET ?auto_277649 ?auto_277650 ) ( ON_BOARD ?auto_277651 ?auto_277646 ) ( POWER_ON ?auto_277651 ) ( not ( = ?auto_277649 ?auto_277651 ) ) ( SUPPORTS ?auto_277651 ?auto_277647 ) ( POINTING ?auto_277646 ?auto_277650 ) ( CALIBRATION_TARGET ?auto_277651 ?auto_277650 ) ( NOT_CALIBRATED ?auto_277651 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_277646 ?auto_277651 ?auto_277650 )
      ( GET-2IMAGE ?auto_277648 ?auto_277647 ?auto_277644 ?auto_277645 )
      ( GET-1IMAGE-VERIFY ?auto_277644 ?auto_277645 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_277653 - DIRECTION
      ?auto_277654 - MODE
      ?auto_277655 - DIRECTION
      ?auto_277652 - MODE
    )
    :vars
    (
      ?auto_277658 - INSTRUMENT
      ?auto_277656 - SATELLITE
      ?auto_277657 - DIRECTION
      ?auto_277659 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_277655 ?auto_277653 ) ) ( ON_BOARD ?auto_277658 ?auto_277656 ) ( SUPPORTS ?auto_277658 ?auto_277652 ) ( not ( = ?auto_277655 ?auto_277657 ) ) ( not ( = ?auto_277653 ?auto_277657 ) ) ( not ( = ?auto_277654 ?auto_277652 ) ) ( CALIBRATION_TARGET ?auto_277658 ?auto_277657 ) ( ON_BOARD ?auto_277659 ?auto_277656 ) ( POWER_ON ?auto_277659 ) ( not ( = ?auto_277658 ?auto_277659 ) ) ( SUPPORTS ?auto_277659 ?auto_277654 ) ( POINTING ?auto_277656 ?auto_277657 ) ( CALIBRATION_TARGET ?auto_277659 ?auto_277657 ) ( NOT_CALIBRATED ?auto_277659 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_277655 ?auto_277652 )
      ( GET-2IMAGE-VERIFY ?auto_277653 ?auto_277654 ?auto_277655 ?auto_277652 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_277661 - DIRECTION
      ?auto_277662 - MODE
      ?auto_277663 - DIRECTION
      ?auto_277660 - MODE
    )
    :vars
    (
      ?auto_277666 - INSTRUMENT
      ?auto_277667 - SATELLITE
      ?auto_277664 - DIRECTION
      ?auto_277665 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_277663 ?auto_277661 ) ) ( ON_BOARD ?auto_277666 ?auto_277667 ) ( SUPPORTS ?auto_277666 ?auto_277662 ) ( not ( = ?auto_277661 ?auto_277664 ) ) ( not ( = ?auto_277663 ?auto_277664 ) ) ( not ( = ?auto_277660 ?auto_277662 ) ) ( CALIBRATION_TARGET ?auto_277666 ?auto_277664 ) ( ON_BOARD ?auto_277665 ?auto_277667 ) ( POWER_ON ?auto_277665 ) ( not ( = ?auto_277666 ?auto_277665 ) ) ( SUPPORTS ?auto_277665 ?auto_277660 ) ( POINTING ?auto_277667 ?auto_277664 ) ( CALIBRATION_TARGET ?auto_277665 ?auto_277664 ) ( NOT_CALIBRATED ?auto_277665 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_277663 ?auto_277660 ?auto_277661 ?auto_277662 )
      ( GET-2IMAGE-VERIFY ?auto_277661 ?auto_277662 ?auto_277663 ?auto_277660 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_279154 - DIRECTION
      ?auto_279155 - MODE
      ?auto_279156 - DIRECTION
      ?auto_279153 - MODE
      ?auto_279158 - DIRECTION
      ?auto_279157 - MODE
    )
    :vars
    (
      ?auto_279160 - INSTRUMENT
      ?auto_279159 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_279156 ?auto_279154 ) ) ( not ( = ?auto_279158 ?auto_279154 ) ) ( not ( = ?auto_279158 ?auto_279156 ) ) ( CALIBRATED ?auto_279160 ) ( ON_BOARD ?auto_279160 ?auto_279159 ) ( SUPPORTS ?auto_279160 ?auto_279157 ) ( POWER_ON ?auto_279160 ) ( POINTING ?auto_279159 ?auto_279158 ) ( HAVE_IMAGE ?auto_279154 ?auto_279155 ) ( HAVE_IMAGE ?auto_279156 ?auto_279153 ) ( not ( = ?auto_279155 ?auto_279153 ) ) ( not ( = ?auto_279155 ?auto_279157 ) ) ( not ( = ?auto_279153 ?auto_279157 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_279158 ?auto_279157 )
      ( GET-3IMAGE-VERIFY ?auto_279154 ?auto_279155 ?auto_279156 ?auto_279153 ?auto_279158 ?auto_279157 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_279170 - DIRECTION
      ?auto_279171 - MODE
      ?auto_279172 - DIRECTION
      ?auto_279169 - MODE
      ?auto_279174 - DIRECTION
      ?auto_279173 - MODE
    )
    :vars
    (
      ?auto_279176 - INSTRUMENT
      ?auto_279175 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_279172 ?auto_279170 ) ) ( not ( = ?auto_279174 ?auto_279170 ) ) ( not ( = ?auto_279174 ?auto_279172 ) ) ( CALIBRATED ?auto_279176 ) ( ON_BOARD ?auto_279176 ?auto_279175 ) ( SUPPORTS ?auto_279176 ?auto_279169 ) ( POWER_ON ?auto_279176 ) ( POINTING ?auto_279175 ?auto_279172 ) ( HAVE_IMAGE ?auto_279170 ?auto_279171 ) ( HAVE_IMAGE ?auto_279174 ?auto_279173 ) ( not ( = ?auto_279171 ?auto_279169 ) ) ( not ( = ?auto_279171 ?auto_279173 ) ) ( not ( = ?auto_279169 ?auto_279173 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_279172 ?auto_279169 )
      ( GET-3IMAGE-VERIFY ?auto_279170 ?auto_279171 ?auto_279172 ?auto_279169 ?auto_279174 ?auto_279173 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_279230 - DIRECTION
      ?auto_279231 - MODE
      ?auto_279232 - DIRECTION
      ?auto_279229 - MODE
      ?auto_279234 - DIRECTION
      ?auto_279233 - MODE
    )
    :vars
    (
      ?auto_279236 - INSTRUMENT
      ?auto_279235 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_279232 ?auto_279230 ) ) ( not ( = ?auto_279234 ?auto_279230 ) ) ( not ( = ?auto_279234 ?auto_279232 ) ) ( CALIBRATED ?auto_279236 ) ( ON_BOARD ?auto_279236 ?auto_279235 ) ( SUPPORTS ?auto_279236 ?auto_279231 ) ( POWER_ON ?auto_279236 ) ( POINTING ?auto_279235 ?auto_279230 ) ( HAVE_IMAGE ?auto_279232 ?auto_279229 ) ( HAVE_IMAGE ?auto_279234 ?auto_279233 ) ( not ( = ?auto_279231 ?auto_279229 ) ) ( not ( = ?auto_279231 ?auto_279233 ) ) ( not ( = ?auto_279229 ?auto_279233 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_279230 ?auto_279231 )
      ( GET-3IMAGE-VERIFY ?auto_279230 ?auto_279231 ?auto_279232 ?auto_279229 ?auto_279234 ?auto_279233 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_279987 - DIRECTION
      ?auto_279988 - MODE
      ?auto_279989 - DIRECTION
      ?auto_279986 - MODE
      ?auto_279991 - DIRECTION
      ?auto_279990 - MODE
    )
    :vars
    (
      ?auto_279994 - INSTRUMENT
      ?auto_279993 - SATELLITE
      ?auto_279992 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_279989 ?auto_279987 ) ) ( not ( = ?auto_279991 ?auto_279987 ) ) ( not ( = ?auto_279991 ?auto_279989 ) ) ( CALIBRATED ?auto_279994 ) ( ON_BOARD ?auto_279994 ?auto_279993 ) ( SUPPORTS ?auto_279994 ?auto_279990 ) ( POWER_ON ?auto_279994 ) ( POINTING ?auto_279993 ?auto_279992 ) ( not ( = ?auto_279991 ?auto_279992 ) ) ( HAVE_IMAGE ?auto_279987 ?auto_279988 ) ( not ( = ?auto_279987 ?auto_279992 ) ) ( not ( = ?auto_279988 ?auto_279990 ) ) ( HAVE_IMAGE ?auto_279989 ?auto_279986 ) ( not ( = ?auto_279988 ?auto_279986 ) ) ( not ( = ?auto_279989 ?auto_279992 ) ) ( not ( = ?auto_279986 ?auto_279990 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_279987 ?auto_279988 ?auto_279991 ?auto_279990 )
      ( GET-3IMAGE-VERIFY ?auto_279987 ?auto_279988 ?auto_279989 ?auto_279986 ?auto_279991 ?auto_279990 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_280005 - DIRECTION
      ?auto_280006 - MODE
      ?auto_280007 - DIRECTION
      ?auto_280004 - MODE
      ?auto_280009 - DIRECTION
      ?auto_280008 - MODE
    )
    :vars
    (
      ?auto_280012 - INSTRUMENT
      ?auto_280011 - SATELLITE
      ?auto_280010 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_280007 ?auto_280005 ) ) ( not ( = ?auto_280009 ?auto_280005 ) ) ( not ( = ?auto_280009 ?auto_280007 ) ) ( CALIBRATED ?auto_280012 ) ( ON_BOARD ?auto_280012 ?auto_280011 ) ( SUPPORTS ?auto_280012 ?auto_280004 ) ( POWER_ON ?auto_280012 ) ( POINTING ?auto_280011 ?auto_280010 ) ( not ( = ?auto_280007 ?auto_280010 ) ) ( HAVE_IMAGE ?auto_280005 ?auto_280006 ) ( not ( = ?auto_280005 ?auto_280010 ) ) ( not ( = ?auto_280006 ?auto_280004 ) ) ( HAVE_IMAGE ?auto_280009 ?auto_280008 ) ( not ( = ?auto_280006 ?auto_280008 ) ) ( not ( = ?auto_280004 ?auto_280008 ) ) ( not ( = ?auto_280009 ?auto_280010 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280005 ?auto_280006 ?auto_280007 ?auto_280004 )
      ( GET-3IMAGE-VERIFY ?auto_280005 ?auto_280006 ?auto_280007 ?auto_280004 ?auto_280009 ?auto_280008 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_280077 - DIRECTION
      ?auto_280078 - MODE
      ?auto_280079 - DIRECTION
      ?auto_280076 - MODE
      ?auto_280081 - DIRECTION
      ?auto_280080 - MODE
    )
    :vars
    (
      ?auto_280084 - INSTRUMENT
      ?auto_280083 - SATELLITE
      ?auto_280082 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_280079 ?auto_280077 ) ) ( not ( = ?auto_280081 ?auto_280077 ) ) ( not ( = ?auto_280081 ?auto_280079 ) ) ( CALIBRATED ?auto_280084 ) ( ON_BOARD ?auto_280084 ?auto_280083 ) ( SUPPORTS ?auto_280084 ?auto_280078 ) ( POWER_ON ?auto_280084 ) ( POINTING ?auto_280083 ?auto_280082 ) ( not ( = ?auto_280077 ?auto_280082 ) ) ( HAVE_IMAGE ?auto_280079 ?auto_280076 ) ( not ( = ?auto_280079 ?auto_280082 ) ) ( not ( = ?auto_280076 ?auto_280078 ) ) ( HAVE_IMAGE ?auto_280081 ?auto_280080 ) ( not ( = ?auto_280078 ?auto_280080 ) ) ( not ( = ?auto_280076 ?auto_280080 ) ) ( not ( = ?auto_280081 ?auto_280082 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280079 ?auto_280076 ?auto_280077 ?auto_280078 )
      ( GET-3IMAGE-VERIFY ?auto_280077 ?auto_280078 ?auto_280079 ?auto_280076 ?auto_280081 ?auto_280080 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_280946 - DIRECTION
      ?auto_280947 - MODE
      ?auto_280948 - DIRECTION
      ?auto_280945 - MODE
      ?auto_280950 - DIRECTION
      ?auto_280949 - MODE
    )
    :vars
    (
      ?auto_280953 - INSTRUMENT
      ?auto_280951 - SATELLITE
      ?auto_280952 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_280948 ?auto_280946 ) ) ( not ( = ?auto_280950 ?auto_280946 ) ) ( not ( = ?auto_280950 ?auto_280948 ) ) ( ON_BOARD ?auto_280953 ?auto_280951 ) ( SUPPORTS ?auto_280953 ?auto_280949 ) ( POWER_ON ?auto_280953 ) ( POINTING ?auto_280951 ?auto_280952 ) ( not ( = ?auto_280950 ?auto_280952 ) ) ( HAVE_IMAGE ?auto_280946 ?auto_280947 ) ( not ( = ?auto_280946 ?auto_280952 ) ) ( not ( = ?auto_280947 ?auto_280949 ) ) ( CALIBRATION_TARGET ?auto_280953 ?auto_280952 ) ( NOT_CALIBRATED ?auto_280953 ) ( HAVE_IMAGE ?auto_280948 ?auto_280945 ) ( not ( = ?auto_280947 ?auto_280945 ) ) ( not ( = ?auto_280948 ?auto_280952 ) ) ( not ( = ?auto_280945 ?auto_280949 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280946 ?auto_280947 ?auto_280950 ?auto_280949 )
      ( GET-3IMAGE-VERIFY ?auto_280946 ?auto_280947 ?auto_280948 ?auto_280945 ?auto_280950 ?auto_280949 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_280964 - DIRECTION
      ?auto_280965 - MODE
      ?auto_280966 - DIRECTION
      ?auto_280963 - MODE
      ?auto_280968 - DIRECTION
      ?auto_280967 - MODE
    )
    :vars
    (
      ?auto_280971 - INSTRUMENT
      ?auto_280969 - SATELLITE
      ?auto_280970 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_280966 ?auto_280964 ) ) ( not ( = ?auto_280968 ?auto_280964 ) ) ( not ( = ?auto_280968 ?auto_280966 ) ) ( ON_BOARD ?auto_280971 ?auto_280969 ) ( SUPPORTS ?auto_280971 ?auto_280963 ) ( POWER_ON ?auto_280971 ) ( POINTING ?auto_280969 ?auto_280970 ) ( not ( = ?auto_280966 ?auto_280970 ) ) ( HAVE_IMAGE ?auto_280964 ?auto_280965 ) ( not ( = ?auto_280964 ?auto_280970 ) ) ( not ( = ?auto_280965 ?auto_280963 ) ) ( CALIBRATION_TARGET ?auto_280971 ?auto_280970 ) ( NOT_CALIBRATED ?auto_280971 ) ( HAVE_IMAGE ?auto_280968 ?auto_280967 ) ( not ( = ?auto_280965 ?auto_280967 ) ) ( not ( = ?auto_280963 ?auto_280967 ) ) ( not ( = ?auto_280968 ?auto_280970 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_280964 ?auto_280965 ?auto_280966 ?auto_280963 )
      ( GET-3IMAGE-VERIFY ?auto_280964 ?auto_280965 ?auto_280966 ?auto_280963 ?auto_280968 ?auto_280967 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_281036 - DIRECTION
      ?auto_281037 - MODE
      ?auto_281038 - DIRECTION
      ?auto_281035 - MODE
      ?auto_281040 - DIRECTION
      ?auto_281039 - MODE
    )
    :vars
    (
      ?auto_281043 - INSTRUMENT
      ?auto_281041 - SATELLITE
      ?auto_281042 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_281038 ?auto_281036 ) ) ( not ( = ?auto_281040 ?auto_281036 ) ) ( not ( = ?auto_281040 ?auto_281038 ) ) ( ON_BOARD ?auto_281043 ?auto_281041 ) ( SUPPORTS ?auto_281043 ?auto_281037 ) ( POWER_ON ?auto_281043 ) ( POINTING ?auto_281041 ?auto_281042 ) ( not ( = ?auto_281036 ?auto_281042 ) ) ( HAVE_IMAGE ?auto_281038 ?auto_281035 ) ( not ( = ?auto_281038 ?auto_281042 ) ) ( not ( = ?auto_281035 ?auto_281037 ) ) ( CALIBRATION_TARGET ?auto_281043 ?auto_281042 ) ( NOT_CALIBRATED ?auto_281043 ) ( HAVE_IMAGE ?auto_281040 ?auto_281039 ) ( not ( = ?auto_281037 ?auto_281039 ) ) ( not ( = ?auto_281035 ?auto_281039 ) ) ( not ( = ?auto_281040 ?auto_281042 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281038 ?auto_281035 ?auto_281036 ?auto_281037 )
      ( GET-3IMAGE-VERIFY ?auto_281036 ?auto_281037 ?auto_281038 ?auto_281035 ?auto_281040 ?auto_281039 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_281905 - DIRECTION
      ?auto_281906 - MODE
      ?auto_281907 - DIRECTION
      ?auto_281904 - MODE
      ?auto_281909 - DIRECTION
      ?auto_281908 - MODE
    )
    :vars
    (
      ?auto_281912 - INSTRUMENT
      ?auto_281910 - SATELLITE
      ?auto_281911 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_281907 ?auto_281905 ) ) ( not ( = ?auto_281909 ?auto_281905 ) ) ( not ( = ?auto_281909 ?auto_281907 ) ) ( ON_BOARD ?auto_281912 ?auto_281910 ) ( SUPPORTS ?auto_281912 ?auto_281908 ) ( POINTING ?auto_281910 ?auto_281911 ) ( not ( = ?auto_281909 ?auto_281911 ) ) ( HAVE_IMAGE ?auto_281905 ?auto_281906 ) ( not ( = ?auto_281905 ?auto_281911 ) ) ( not ( = ?auto_281906 ?auto_281908 ) ) ( CALIBRATION_TARGET ?auto_281912 ?auto_281911 ) ( POWER_AVAIL ?auto_281910 ) ( HAVE_IMAGE ?auto_281907 ?auto_281904 ) ( not ( = ?auto_281906 ?auto_281904 ) ) ( not ( = ?auto_281907 ?auto_281911 ) ) ( not ( = ?auto_281904 ?auto_281908 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281905 ?auto_281906 ?auto_281909 ?auto_281908 )
      ( GET-3IMAGE-VERIFY ?auto_281905 ?auto_281906 ?auto_281907 ?auto_281904 ?auto_281909 ?auto_281908 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_281923 - DIRECTION
      ?auto_281924 - MODE
      ?auto_281925 - DIRECTION
      ?auto_281922 - MODE
      ?auto_281927 - DIRECTION
      ?auto_281926 - MODE
    )
    :vars
    (
      ?auto_281930 - INSTRUMENT
      ?auto_281928 - SATELLITE
      ?auto_281929 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_281925 ?auto_281923 ) ) ( not ( = ?auto_281927 ?auto_281923 ) ) ( not ( = ?auto_281927 ?auto_281925 ) ) ( ON_BOARD ?auto_281930 ?auto_281928 ) ( SUPPORTS ?auto_281930 ?auto_281922 ) ( POINTING ?auto_281928 ?auto_281929 ) ( not ( = ?auto_281925 ?auto_281929 ) ) ( HAVE_IMAGE ?auto_281923 ?auto_281924 ) ( not ( = ?auto_281923 ?auto_281929 ) ) ( not ( = ?auto_281924 ?auto_281922 ) ) ( CALIBRATION_TARGET ?auto_281930 ?auto_281929 ) ( POWER_AVAIL ?auto_281928 ) ( HAVE_IMAGE ?auto_281927 ?auto_281926 ) ( not ( = ?auto_281924 ?auto_281926 ) ) ( not ( = ?auto_281922 ?auto_281926 ) ) ( not ( = ?auto_281927 ?auto_281929 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281923 ?auto_281924 ?auto_281925 ?auto_281922 )
      ( GET-3IMAGE-VERIFY ?auto_281923 ?auto_281924 ?auto_281925 ?auto_281922 ?auto_281927 ?auto_281926 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_281995 - DIRECTION
      ?auto_281996 - MODE
      ?auto_281997 - DIRECTION
      ?auto_281994 - MODE
      ?auto_281999 - DIRECTION
      ?auto_281998 - MODE
    )
    :vars
    (
      ?auto_282002 - INSTRUMENT
      ?auto_282000 - SATELLITE
      ?auto_282001 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_281997 ?auto_281995 ) ) ( not ( = ?auto_281999 ?auto_281995 ) ) ( not ( = ?auto_281999 ?auto_281997 ) ) ( ON_BOARD ?auto_282002 ?auto_282000 ) ( SUPPORTS ?auto_282002 ?auto_281996 ) ( POINTING ?auto_282000 ?auto_282001 ) ( not ( = ?auto_281995 ?auto_282001 ) ) ( HAVE_IMAGE ?auto_281997 ?auto_281994 ) ( not ( = ?auto_281997 ?auto_282001 ) ) ( not ( = ?auto_281994 ?auto_281996 ) ) ( CALIBRATION_TARGET ?auto_282002 ?auto_282001 ) ( POWER_AVAIL ?auto_282000 ) ( HAVE_IMAGE ?auto_281999 ?auto_281998 ) ( not ( = ?auto_281996 ?auto_281998 ) ) ( not ( = ?auto_281994 ?auto_281998 ) ) ( not ( = ?auto_281999 ?auto_282001 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_281997 ?auto_281994 ?auto_281995 ?auto_281996 )
      ( GET-3IMAGE-VERIFY ?auto_281995 ?auto_281996 ?auto_281997 ?auto_281994 ?auto_281999 ?auto_281998 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_282816 - DIRECTION
      ?auto_282817 - MODE
    )
    :vars
    (
      ?auto_282821 - DIRECTION
      ?auto_282820 - INSTRUMENT
      ?auto_282818 - SATELLITE
      ?auto_282819 - DIRECTION
      ?auto_282822 - MODE
      ?auto_282823 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_282816 ?auto_282821 ) ) ( ON_BOARD ?auto_282820 ?auto_282818 ) ( SUPPORTS ?auto_282820 ?auto_282817 ) ( not ( = ?auto_282816 ?auto_282819 ) ) ( HAVE_IMAGE ?auto_282821 ?auto_282822 ) ( not ( = ?auto_282821 ?auto_282819 ) ) ( not ( = ?auto_282822 ?auto_282817 ) ) ( CALIBRATION_TARGET ?auto_282820 ?auto_282819 ) ( POWER_AVAIL ?auto_282818 ) ( POINTING ?auto_282818 ?auto_282823 ) ( not ( = ?auto_282819 ?auto_282823 ) ) ( not ( = ?auto_282816 ?auto_282823 ) ) ( not ( = ?auto_282821 ?auto_282823 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_282818 ?auto_282819 ?auto_282823 )
      ( GET-2IMAGE ?auto_282821 ?auto_282822 ?auto_282816 ?auto_282817 )
      ( GET-1IMAGE-VERIFY ?auto_282816 ?auto_282817 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_282825 - DIRECTION
      ?auto_282826 - MODE
      ?auto_282827 - DIRECTION
      ?auto_282824 - MODE
    )
    :vars
    (
      ?auto_282830 - INSTRUMENT
      ?auto_282829 - SATELLITE
      ?auto_282831 - DIRECTION
      ?auto_282828 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_282827 ?auto_282825 ) ) ( ON_BOARD ?auto_282830 ?auto_282829 ) ( SUPPORTS ?auto_282830 ?auto_282824 ) ( not ( = ?auto_282827 ?auto_282831 ) ) ( HAVE_IMAGE ?auto_282825 ?auto_282826 ) ( not ( = ?auto_282825 ?auto_282831 ) ) ( not ( = ?auto_282826 ?auto_282824 ) ) ( CALIBRATION_TARGET ?auto_282830 ?auto_282831 ) ( POWER_AVAIL ?auto_282829 ) ( POINTING ?auto_282829 ?auto_282828 ) ( not ( = ?auto_282831 ?auto_282828 ) ) ( not ( = ?auto_282827 ?auto_282828 ) ) ( not ( = ?auto_282825 ?auto_282828 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_282827 ?auto_282824 )
      ( GET-2IMAGE-VERIFY ?auto_282825 ?auto_282826 ?auto_282827 ?auto_282824 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_282833 - DIRECTION
      ?auto_282834 - MODE
      ?auto_282835 - DIRECTION
      ?auto_282832 - MODE
    )
    :vars
    (
      ?auto_282836 - DIRECTION
      ?auto_282840 - INSTRUMENT
      ?auto_282839 - SATELLITE
      ?auto_282838 - DIRECTION
      ?auto_282837 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_282835 ?auto_282833 ) ) ( not ( = ?auto_282835 ?auto_282836 ) ) ( ON_BOARD ?auto_282840 ?auto_282839 ) ( SUPPORTS ?auto_282840 ?auto_282832 ) ( not ( = ?auto_282835 ?auto_282838 ) ) ( HAVE_IMAGE ?auto_282836 ?auto_282837 ) ( not ( = ?auto_282836 ?auto_282838 ) ) ( not ( = ?auto_282837 ?auto_282832 ) ) ( CALIBRATION_TARGET ?auto_282840 ?auto_282838 ) ( POWER_AVAIL ?auto_282839 ) ( POINTING ?auto_282839 ?auto_282833 ) ( not ( = ?auto_282838 ?auto_282833 ) ) ( not ( = ?auto_282836 ?auto_282833 ) ) ( HAVE_IMAGE ?auto_282833 ?auto_282834 ) ( not ( = ?auto_282834 ?auto_282832 ) ) ( not ( = ?auto_282834 ?auto_282837 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282836 ?auto_282837 ?auto_282835 ?auto_282832 )
      ( GET-2IMAGE-VERIFY ?auto_282833 ?auto_282834 ?auto_282835 ?auto_282832 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_282842 - DIRECTION
      ?auto_282843 - MODE
      ?auto_282844 - DIRECTION
      ?auto_282841 - MODE
    )
    :vars
    (
      ?auto_282848 - INSTRUMENT
      ?auto_282847 - SATELLITE
      ?auto_282846 - DIRECTION
      ?auto_282845 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_282844 ?auto_282842 ) ) ( ON_BOARD ?auto_282848 ?auto_282847 ) ( SUPPORTS ?auto_282848 ?auto_282843 ) ( not ( = ?auto_282842 ?auto_282846 ) ) ( HAVE_IMAGE ?auto_282844 ?auto_282841 ) ( not ( = ?auto_282844 ?auto_282846 ) ) ( not ( = ?auto_282841 ?auto_282843 ) ) ( CALIBRATION_TARGET ?auto_282848 ?auto_282846 ) ( POWER_AVAIL ?auto_282847 ) ( POINTING ?auto_282847 ?auto_282845 ) ( not ( = ?auto_282846 ?auto_282845 ) ) ( not ( = ?auto_282842 ?auto_282845 ) ) ( not ( = ?auto_282844 ?auto_282845 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282844 ?auto_282841 ?auto_282842 ?auto_282843 )
      ( GET-2IMAGE-VERIFY ?auto_282842 ?auto_282843 ?auto_282844 ?auto_282841 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_282850 - DIRECTION
      ?auto_282851 - MODE
      ?auto_282852 - DIRECTION
      ?auto_282849 - MODE
    )
    :vars
    (
      ?auto_282853 - DIRECTION
      ?auto_282857 - INSTRUMENT
      ?auto_282856 - SATELLITE
      ?auto_282855 - DIRECTION
      ?auto_282854 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_282852 ?auto_282850 ) ) ( not ( = ?auto_282850 ?auto_282853 ) ) ( ON_BOARD ?auto_282857 ?auto_282856 ) ( SUPPORTS ?auto_282857 ?auto_282851 ) ( not ( = ?auto_282850 ?auto_282855 ) ) ( HAVE_IMAGE ?auto_282853 ?auto_282854 ) ( not ( = ?auto_282853 ?auto_282855 ) ) ( not ( = ?auto_282854 ?auto_282851 ) ) ( CALIBRATION_TARGET ?auto_282857 ?auto_282855 ) ( POWER_AVAIL ?auto_282856 ) ( POINTING ?auto_282856 ?auto_282852 ) ( not ( = ?auto_282855 ?auto_282852 ) ) ( not ( = ?auto_282853 ?auto_282852 ) ) ( HAVE_IMAGE ?auto_282852 ?auto_282849 ) ( not ( = ?auto_282851 ?auto_282849 ) ) ( not ( = ?auto_282849 ?auto_282854 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282853 ?auto_282854 ?auto_282850 ?auto_282851 )
      ( GET-2IMAGE-VERIFY ?auto_282850 ?auto_282851 ?auto_282852 ?auto_282849 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_282879 - DIRECTION
      ?auto_282880 - MODE
      ?auto_282881 - DIRECTION
      ?auto_282878 - MODE
      ?auto_282883 - DIRECTION
      ?auto_282882 - MODE
    )
    :vars
    (
      ?auto_282886 - INSTRUMENT
      ?auto_282885 - SATELLITE
      ?auto_282884 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_282881 ?auto_282879 ) ) ( not ( = ?auto_282883 ?auto_282879 ) ) ( not ( = ?auto_282883 ?auto_282881 ) ) ( ON_BOARD ?auto_282886 ?auto_282885 ) ( SUPPORTS ?auto_282886 ?auto_282882 ) ( not ( = ?auto_282883 ?auto_282884 ) ) ( HAVE_IMAGE ?auto_282879 ?auto_282880 ) ( not ( = ?auto_282879 ?auto_282884 ) ) ( not ( = ?auto_282880 ?auto_282882 ) ) ( CALIBRATION_TARGET ?auto_282886 ?auto_282884 ) ( POWER_AVAIL ?auto_282885 ) ( POINTING ?auto_282885 ?auto_282881 ) ( not ( = ?auto_282884 ?auto_282881 ) ) ( HAVE_IMAGE ?auto_282881 ?auto_282878 ) ( not ( = ?auto_282880 ?auto_282878 ) ) ( not ( = ?auto_282878 ?auto_282882 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282879 ?auto_282880 ?auto_282883 ?auto_282882 )
      ( GET-3IMAGE-VERIFY ?auto_282879 ?auto_282880 ?auto_282881 ?auto_282878 ?auto_282883 ?auto_282882 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_282898 - DIRECTION
      ?auto_282899 - MODE
      ?auto_282900 - DIRECTION
      ?auto_282897 - MODE
      ?auto_282902 - DIRECTION
      ?auto_282901 - MODE
    )
    :vars
    (
      ?auto_282905 - INSTRUMENT
      ?auto_282904 - SATELLITE
      ?auto_282903 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_282900 ?auto_282898 ) ) ( not ( = ?auto_282902 ?auto_282898 ) ) ( not ( = ?auto_282902 ?auto_282900 ) ) ( ON_BOARD ?auto_282905 ?auto_282904 ) ( SUPPORTS ?auto_282905 ?auto_282897 ) ( not ( = ?auto_282900 ?auto_282903 ) ) ( HAVE_IMAGE ?auto_282898 ?auto_282899 ) ( not ( = ?auto_282898 ?auto_282903 ) ) ( not ( = ?auto_282899 ?auto_282897 ) ) ( CALIBRATION_TARGET ?auto_282905 ?auto_282903 ) ( POWER_AVAIL ?auto_282904 ) ( POINTING ?auto_282904 ?auto_282902 ) ( not ( = ?auto_282903 ?auto_282902 ) ) ( HAVE_IMAGE ?auto_282902 ?auto_282901 ) ( not ( = ?auto_282899 ?auto_282901 ) ) ( not ( = ?auto_282897 ?auto_282901 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282898 ?auto_282899 ?auto_282900 ?auto_282897 )
      ( GET-3IMAGE-VERIFY ?auto_282898 ?auto_282899 ?auto_282900 ?auto_282897 ?auto_282902 ?auto_282901 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_282917 - DIRECTION
      ?auto_282918 - MODE
      ?auto_282919 - DIRECTION
      ?auto_282916 - MODE
      ?auto_282921 - DIRECTION
      ?auto_282920 - MODE
    )
    :vars
    (
      ?auto_282924 - INSTRUMENT
      ?auto_282923 - SATELLITE
      ?auto_282922 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_282919 ?auto_282917 ) ) ( not ( = ?auto_282921 ?auto_282917 ) ) ( not ( = ?auto_282921 ?auto_282919 ) ) ( ON_BOARD ?auto_282924 ?auto_282923 ) ( SUPPORTS ?auto_282924 ?auto_282920 ) ( not ( = ?auto_282921 ?auto_282922 ) ) ( HAVE_IMAGE ?auto_282919 ?auto_282916 ) ( not ( = ?auto_282919 ?auto_282922 ) ) ( not ( = ?auto_282916 ?auto_282920 ) ) ( CALIBRATION_TARGET ?auto_282924 ?auto_282922 ) ( POWER_AVAIL ?auto_282923 ) ( POINTING ?auto_282923 ?auto_282917 ) ( not ( = ?auto_282922 ?auto_282917 ) ) ( HAVE_IMAGE ?auto_282917 ?auto_282918 ) ( not ( = ?auto_282918 ?auto_282916 ) ) ( not ( = ?auto_282918 ?auto_282920 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282919 ?auto_282916 ?auto_282921 ?auto_282920 )
      ( GET-3IMAGE-VERIFY ?auto_282917 ?auto_282918 ?auto_282919 ?auto_282916 ?auto_282921 ?auto_282920 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_282937 - DIRECTION
      ?auto_282938 - MODE
      ?auto_282939 - DIRECTION
      ?auto_282936 - MODE
      ?auto_282941 - DIRECTION
      ?auto_282940 - MODE
    )
    :vars
    (
      ?auto_282944 - INSTRUMENT
      ?auto_282943 - SATELLITE
      ?auto_282942 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_282939 ?auto_282937 ) ) ( not ( = ?auto_282941 ?auto_282937 ) ) ( not ( = ?auto_282941 ?auto_282939 ) ) ( ON_BOARD ?auto_282944 ?auto_282943 ) ( SUPPORTS ?auto_282944 ?auto_282936 ) ( not ( = ?auto_282939 ?auto_282942 ) ) ( HAVE_IMAGE ?auto_282941 ?auto_282940 ) ( not ( = ?auto_282941 ?auto_282942 ) ) ( not ( = ?auto_282940 ?auto_282936 ) ) ( CALIBRATION_TARGET ?auto_282944 ?auto_282942 ) ( POWER_AVAIL ?auto_282943 ) ( POINTING ?auto_282943 ?auto_282937 ) ( not ( = ?auto_282942 ?auto_282937 ) ) ( HAVE_IMAGE ?auto_282937 ?auto_282938 ) ( not ( = ?auto_282938 ?auto_282936 ) ) ( not ( = ?auto_282938 ?auto_282940 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282941 ?auto_282940 ?auto_282939 ?auto_282936 )
      ( GET-3IMAGE-VERIFY ?auto_282937 ?auto_282938 ?auto_282939 ?auto_282936 ?auto_282941 ?auto_282940 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_282978 - DIRECTION
      ?auto_282979 - MODE
      ?auto_282980 - DIRECTION
      ?auto_282977 - MODE
      ?auto_282982 - DIRECTION
      ?auto_282981 - MODE
    )
    :vars
    (
      ?auto_282985 - INSTRUMENT
      ?auto_282984 - SATELLITE
      ?auto_282983 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_282980 ?auto_282978 ) ) ( not ( = ?auto_282982 ?auto_282978 ) ) ( not ( = ?auto_282982 ?auto_282980 ) ) ( ON_BOARD ?auto_282985 ?auto_282984 ) ( SUPPORTS ?auto_282985 ?auto_282979 ) ( not ( = ?auto_282978 ?auto_282983 ) ) ( HAVE_IMAGE ?auto_282980 ?auto_282977 ) ( not ( = ?auto_282980 ?auto_282983 ) ) ( not ( = ?auto_282977 ?auto_282979 ) ) ( CALIBRATION_TARGET ?auto_282985 ?auto_282983 ) ( POWER_AVAIL ?auto_282984 ) ( POINTING ?auto_282984 ?auto_282982 ) ( not ( = ?auto_282983 ?auto_282982 ) ) ( HAVE_IMAGE ?auto_282982 ?auto_282981 ) ( not ( = ?auto_282979 ?auto_282981 ) ) ( not ( = ?auto_282977 ?auto_282981 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_282980 ?auto_282977 ?auto_282978 ?auto_282979 )
      ( GET-3IMAGE-VERIFY ?auto_282978 ?auto_282979 ?auto_282980 ?auto_282977 ?auto_282982 ?auto_282981 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_282997 - DIRECTION
      ?auto_282998 - MODE
      ?auto_282999 - DIRECTION
      ?auto_282996 - MODE
      ?auto_283001 - DIRECTION
      ?auto_283000 - MODE
    )
    :vars
    (
      ?auto_283004 - INSTRUMENT
      ?auto_283003 - SATELLITE
      ?auto_283002 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_282999 ?auto_282997 ) ) ( not ( = ?auto_283001 ?auto_282997 ) ) ( not ( = ?auto_283001 ?auto_282999 ) ) ( ON_BOARD ?auto_283004 ?auto_283003 ) ( SUPPORTS ?auto_283004 ?auto_282998 ) ( not ( = ?auto_282997 ?auto_283002 ) ) ( HAVE_IMAGE ?auto_283001 ?auto_283000 ) ( not ( = ?auto_283001 ?auto_283002 ) ) ( not ( = ?auto_283000 ?auto_282998 ) ) ( CALIBRATION_TARGET ?auto_283004 ?auto_283002 ) ( POWER_AVAIL ?auto_283003 ) ( POINTING ?auto_283003 ?auto_282999 ) ( not ( = ?auto_283002 ?auto_282999 ) ) ( HAVE_IMAGE ?auto_282999 ?auto_282996 ) ( not ( = ?auto_282998 ?auto_282996 ) ) ( not ( = ?auto_282996 ?auto_283000 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283001 ?auto_283000 ?auto_282997 ?auto_282998 )
      ( GET-3IMAGE-VERIFY ?auto_282997 ?auto_282998 ?auto_282999 ?auto_282996 ?auto_283001 ?auto_283000 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_283820 - DIRECTION
      ?auto_283821 - MODE
    )
    :vars
    (
      ?auto_283823 - DIRECTION
      ?auto_283827 - INSTRUMENT
      ?auto_283826 - SATELLITE
      ?auto_283825 - DIRECTION
      ?auto_283824 - MODE
      ?auto_283822 - DIRECTION
      ?auto_283828 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_283820 ?auto_283823 ) ) ( ON_BOARD ?auto_283827 ?auto_283826 ) ( SUPPORTS ?auto_283827 ?auto_283821 ) ( not ( = ?auto_283820 ?auto_283825 ) ) ( HAVE_IMAGE ?auto_283823 ?auto_283824 ) ( not ( = ?auto_283823 ?auto_283825 ) ) ( not ( = ?auto_283824 ?auto_283821 ) ) ( CALIBRATION_TARGET ?auto_283827 ?auto_283825 ) ( POINTING ?auto_283826 ?auto_283822 ) ( not ( = ?auto_283825 ?auto_283822 ) ) ( not ( = ?auto_283820 ?auto_283822 ) ) ( not ( = ?auto_283823 ?auto_283822 ) ) ( ON_BOARD ?auto_283828 ?auto_283826 ) ( POWER_ON ?auto_283828 ) ( not ( = ?auto_283827 ?auto_283828 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_283828 ?auto_283826 )
      ( GET-2IMAGE ?auto_283823 ?auto_283824 ?auto_283820 ?auto_283821 )
      ( GET-1IMAGE-VERIFY ?auto_283820 ?auto_283821 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_283830 - DIRECTION
      ?auto_283831 - MODE
      ?auto_283832 - DIRECTION
      ?auto_283829 - MODE
    )
    :vars
    (
      ?auto_283836 - INSTRUMENT
      ?auto_283837 - SATELLITE
      ?auto_283835 - DIRECTION
      ?auto_283834 - DIRECTION
      ?auto_283833 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_283832 ?auto_283830 ) ) ( ON_BOARD ?auto_283836 ?auto_283837 ) ( SUPPORTS ?auto_283836 ?auto_283829 ) ( not ( = ?auto_283832 ?auto_283835 ) ) ( HAVE_IMAGE ?auto_283830 ?auto_283831 ) ( not ( = ?auto_283830 ?auto_283835 ) ) ( not ( = ?auto_283831 ?auto_283829 ) ) ( CALIBRATION_TARGET ?auto_283836 ?auto_283835 ) ( POINTING ?auto_283837 ?auto_283834 ) ( not ( = ?auto_283835 ?auto_283834 ) ) ( not ( = ?auto_283832 ?auto_283834 ) ) ( not ( = ?auto_283830 ?auto_283834 ) ) ( ON_BOARD ?auto_283833 ?auto_283837 ) ( POWER_ON ?auto_283833 ) ( not ( = ?auto_283836 ?auto_283833 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_283832 ?auto_283829 )
      ( GET-2IMAGE-VERIFY ?auto_283830 ?auto_283831 ?auto_283832 ?auto_283829 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_283839 - DIRECTION
      ?auto_283840 - MODE
      ?auto_283841 - DIRECTION
      ?auto_283838 - MODE
    )
    :vars
    (
      ?auto_283843 - DIRECTION
      ?auto_283842 - INSTRUMENT
      ?auto_283845 - SATELLITE
      ?auto_283847 - DIRECTION
      ?auto_283844 - MODE
      ?auto_283846 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_283841 ?auto_283839 ) ) ( not ( = ?auto_283841 ?auto_283843 ) ) ( ON_BOARD ?auto_283842 ?auto_283845 ) ( SUPPORTS ?auto_283842 ?auto_283838 ) ( not ( = ?auto_283841 ?auto_283847 ) ) ( HAVE_IMAGE ?auto_283843 ?auto_283844 ) ( not ( = ?auto_283843 ?auto_283847 ) ) ( not ( = ?auto_283844 ?auto_283838 ) ) ( CALIBRATION_TARGET ?auto_283842 ?auto_283847 ) ( POINTING ?auto_283845 ?auto_283839 ) ( not ( = ?auto_283847 ?auto_283839 ) ) ( not ( = ?auto_283843 ?auto_283839 ) ) ( ON_BOARD ?auto_283846 ?auto_283845 ) ( POWER_ON ?auto_283846 ) ( not ( = ?auto_283842 ?auto_283846 ) ) ( HAVE_IMAGE ?auto_283839 ?auto_283840 ) ( not ( = ?auto_283840 ?auto_283838 ) ) ( not ( = ?auto_283840 ?auto_283844 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283843 ?auto_283844 ?auto_283841 ?auto_283838 )
      ( GET-2IMAGE-VERIFY ?auto_283839 ?auto_283840 ?auto_283841 ?auto_283838 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_283849 - DIRECTION
      ?auto_283850 - MODE
      ?auto_283851 - DIRECTION
      ?auto_283848 - MODE
    )
    :vars
    (
      ?auto_283853 - INSTRUMENT
      ?auto_283854 - SATELLITE
      ?auto_283856 - DIRECTION
      ?auto_283852 - DIRECTION
      ?auto_283855 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_283851 ?auto_283849 ) ) ( ON_BOARD ?auto_283853 ?auto_283854 ) ( SUPPORTS ?auto_283853 ?auto_283850 ) ( not ( = ?auto_283849 ?auto_283856 ) ) ( HAVE_IMAGE ?auto_283851 ?auto_283848 ) ( not ( = ?auto_283851 ?auto_283856 ) ) ( not ( = ?auto_283848 ?auto_283850 ) ) ( CALIBRATION_TARGET ?auto_283853 ?auto_283856 ) ( POINTING ?auto_283854 ?auto_283852 ) ( not ( = ?auto_283856 ?auto_283852 ) ) ( not ( = ?auto_283849 ?auto_283852 ) ) ( not ( = ?auto_283851 ?auto_283852 ) ) ( ON_BOARD ?auto_283855 ?auto_283854 ) ( POWER_ON ?auto_283855 ) ( not ( = ?auto_283853 ?auto_283855 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283851 ?auto_283848 ?auto_283849 ?auto_283850 )
      ( GET-2IMAGE-VERIFY ?auto_283849 ?auto_283850 ?auto_283851 ?auto_283848 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_283858 - DIRECTION
      ?auto_283859 - MODE
      ?auto_283860 - DIRECTION
      ?auto_283857 - MODE
    )
    :vars
    (
      ?auto_283862 - DIRECTION
      ?auto_283861 - INSTRUMENT
      ?auto_283864 - SATELLITE
      ?auto_283866 - DIRECTION
      ?auto_283863 - MODE
      ?auto_283865 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_283860 ?auto_283858 ) ) ( not ( = ?auto_283858 ?auto_283862 ) ) ( ON_BOARD ?auto_283861 ?auto_283864 ) ( SUPPORTS ?auto_283861 ?auto_283859 ) ( not ( = ?auto_283858 ?auto_283866 ) ) ( HAVE_IMAGE ?auto_283862 ?auto_283863 ) ( not ( = ?auto_283862 ?auto_283866 ) ) ( not ( = ?auto_283863 ?auto_283859 ) ) ( CALIBRATION_TARGET ?auto_283861 ?auto_283866 ) ( POINTING ?auto_283864 ?auto_283860 ) ( not ( = ?auto_283866 ?auto_283860 ) ) ( not ( = ?auto_283862 ?auto_283860 ) ) ( ON_BOARD ?auto_283865 ?auto_283864 ) ( POWER_ON ?auto_283865 ) ( not ( = ?auto_283861 ?auto_283865 ) ) ( HAVE_IMAGE ?auto_283860 ?auto_283857 ) ( not ( = ?auto_283859 ?auto_283857 ) ) ( not ( = ?auto_283857 ?auto_283863 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283862 ?auto_283863 ?auto_283858 ?auto_283859 )
      ( GET-2IMAGE-VERIFY ?auto_283858 ?auto_283859 ?auto_283860 ?auto_283857 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_283890 - DIRECTION
      ?auto_283891 - MODE
      ?auto_283892 - DIRECTION
      ?auto_283889 - MODE
      ?auto_283894 - DIRECTION
      ?auto_283893 - MODE
    )
    :vars
    (
      ?auto_283895 - INSTRUMENT
      ?auto_283896 - SATELLITE
      ?auto_283898 - DIRECTION
      ?auto_283897 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_283892 ?auto_283890 ) ) ( not ( = ?auto_283894 ?auto_283890 ) ) ( not ( = ?auto_283894 ?auto_283892 ) ) ( ON_BOARD ?auto_283895 ?auto_283896 ) ( SUPPORTS ?auto_283895 ?auto_283893 ) ( not ( = ?auto_283894 ?auto_283898 ) ) ( HAVE_IMAGE ?auto_283890 ?auto_283891 ) ( not ( = ?auto_283890 ?auto_283898 ) ) ( not ( = ?auto_283891 ?auto_283893 ) ) ( CALIBRATION_TARGET ?auto_283895 ?auto_283898 ) ( POINTING ?auto_283896 ?auto_283892 ) ( not ( = ?auto_283898 ?auto_283892 ) ) ( ON_BOARD ?auto_283897 ?auto_283896 ) ( POWER_ON ?auto_283897 ) ( not ( = ?auto_283895 ?auto_283897 ) ) ( HAVE_IMAGE ?auto_283892 ?auto_283889 ) ( not ( = ?auto_283891 ?auto_283889 ) ) ( not ( = ?auto_283889 ?auto_283893 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283890 ?auto_283891 ?auto_283894 ?auto_283893 )
      ( GET-3IMAGE-VERIFY ?auto_283890 ?auto_283891 ?auto_283892 ?auto_283889 ?auto_283894 ?auto_283893 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_283911 - DIRECTION
      ?auto_283912 - MODE
      ?auto_283913 - DIRECTION
      ?auto_283910 - MODE
      ?auto_283915 - DIRECTION
      ?auto_283914 - MODE
    )
    :vars
    (
      ?auto_283916 - INSTRUMENT
      ?auto_283917 - SATELLITE
      ?auto_283919 - DIRECTION
      ?auto_283918 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_283913 ?auto_283911 ) ) ( not ( = ?auto_283915 ?auto_283911 ) ) ( not ( = ?auto_283915 ?auto_283913 ) ) ( ON_BOARD ?auto_283916 ?auto_283917 ) ( SUPPORTS ?auto_283916 ?auto_283910 ) ( not ( = ?auto_283913 ?auto_283919 ) ) ( HAVE_IMAGE ?auto_283911 ?auto_283912 ) ( not ( = ?auto_283911 ?auto_283919 ) ) ( not ( = ?auto_283912 ?auto_283910 ) ) ( CALIBRATION_TARGET ?auto_283916 ?auto_283919 ) ( POINTING ?auto_283917 ?auto_283915 ) ( not ( = ?auto_283919 ?auto_283915 ) ) ( ON_BOARD ?auto_283918 ?auto_283917 ) ( POWER_ON ?auto_283918 ) ( not ( = ?auto_283916 ?auto_283918 ) ) ( HAVE_IMAGE ?auto_283915 ?auto_283914 ) ( not ( = ?auto_283912 ?auto_283914 ) ) ( not ( = ?auto_283910 ?auto_283914 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283911 ?auto_283912 ?auto_283913 ?auto_283910 )
      ( GET-3IMAGE-VERIFY ?auto_283911 ?auto_283912 ?auto_283913 ?auto_283910 ?auto_283915 ?auto_283914 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_283932 - DIRECTION
      ?auto_283933 - MODE
      ?auto_283934 - DIRECTION
      ?auto_283931 - MODE
      ?auto_283936 - DIRECTION
      ?auto_283935 - MODE
    )
    :vars
    (
      ?auto_283937 - INSTRUMENT
      ?auto_283938 - SATELLITE
      ?auto_283940 - DIRECTION
      ?auto_283939 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_283934 ?auto_283932 ) ) ( not ( = ?auto_283936 ?auto_283932 ) ) ( not ( = ?auto_283936 ?auto_283934 ) ) ( ON_BOARD ?auto_283937 ?auto_283938 ) ( SUPPORTS ?auto_283937 ?auto_283935 ) ( not ( = ?auto_283936 ?auto_283940 ) ) ( HAVE_IMAGE ?auto_283934 ?auto_283931 ) ( not ( = ?auto_283934 ?auto_283940 ) ) ( not ( = ?auto_283931 ?auto_283935 ) ) ( CALIBRATION_TARGET ?auto_283937 ?auto_283940 ) ( POINTING ?auto_283938 ?auto_283932 ) ( not ( = ?auto_283940 ?auto_283932 ) ) ( ON_BOARD ?auto_283939 ?auto_283938 ) ( POWER_ON ?auto_283939 ) ( not ( = ?auto_283937 ?auto_283939 ) ) ( HAVE_IMAGE ?auto_283932 ?auto_283933 ) ( not ( = ?auto_283933 ?auto_283931 ) ) ( not ( = ?auto_283933 ?auto_283935 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283934 ?auto_283931 ?auto_283936 ?auto_283935 )
      ( GET-3IMAGE-VERIFY ?auto_283932 ?auto_283933 ?auto_283934 ?auto_283931 ?auto_283936 ?auto_283935 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_283954 - DIRECTION
      ?auto_283955 - MODE
      ?auto_283956 - DIRECTION
      ?auto_283953 - MODE
      ?auto_283958 - DIRECTION
      ?auto_283957 - MODE
    )
    :vars
    (
      ?auto_283959 - INSTRUMENT
      ?auto_283960 - SATELLITE
      ?auto_283962 - DIRECTION
      ?auto_283961 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_283956 ?auto_283954 ) ) ( not ( = ?auto_283958 ?auto_283954 ) ) ( not ( = ?auto_283958 ?auto_283956 ) ) ( ON_BOARD ?auto_283959 ?auto_283960 ) ( SUPPORTS ?auto_283959 ?auto_283953 ) ( not ( = ?auto_283956 ?auto_283962 ) ) ( HAVE_IMAGE ?auto_283958 ?auto_283957 ) ( not ( = ?auto_283958 ?auto_283962 ) ) ( not ( = ?auto_283957 ?auto_283953 ) ) ( CALIBRATION_TARGET ?auto_283959 ?auto_283962 ) ( POINTING ?auto_283960 ?auto_283954 ) ( not ( = ?auto_283962 ?auto_283954 ) ) ( ON_BOARD ?auto_283961 ?auto_283960 ) ( POWER_ON ?auto_283961 ) ( not ( = ?auto_283959 ?auto_283961 ) ) ( HAVE_IMAGE ?auto_283954 ?auto_283955 ) ( not ( = ?auto_283955 ?auto_283953 ) ) ( not ( = ?auto_283955 ?auto_283957 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_283958 ?auto_283957 ?auto_283956 ?auto_283953 )
      ( GET-3IMAGE-VERIFY ?auto_283954 ?auto_283955 ?auto_283956 ?auto_283953 ?auto_283958 ?auto_283957 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_283999 - DIRECTION
      ?auto_284000 - MODE
      ?auto_284001 - DIRECTION
      ?auto_283998 - MODE
      ?auto_284003 - DIRECTION
      ?auto_284002 - MODE
    )
    :vars
    (
      ?auto_284004 - INSTRUMENT
      ?auto_284005 - SATELLITE
      ?auto_284007 - DIRECTION
      ?auto_284006 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_284001 ?auto_283999 ) ) ( not ( = ?auto_284003 ?auto_283999 ) ) ( not ( = ?auto_284003 ?auto_284001 ) ) ( ON_BOARD ?auto_284004 ?auto_284005 ) ( SUPPORTS ?auto_284004 ?auto_284000 ) ( not ( = ?auto_283999 ?auto_284007 ) ) ( HAVE_IMAGE ?auto_284001 ?auto_283998 ) ( not ( = ?auto_284001 ?auto_284007 ) ) ( not ( = ?auto_283998 ?auto_284000 ) ) ( CALIBRATION_TARGET ?auto_284004 ?auto_284007 ) ( POINTING ?auto_284005 ?auto_284003 ) ( not ( = ?auto_284007 ?auto_284003 ) ) ( ON_BOARD ?auto_284006 ?auto_284005 ) ( POWER_ON ?auto_284006 ) ( not ( = ?auto_284004 ?auto_284006 ) ) ( HAVE_IMAGE ?auto_284003 ?auto_284002 ) ( not ( = ?auto_284000 ?auto_284002 ) ) ( not ( = ?auto_283998 ?auto_284002 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_284001 ?auto_283998 ?auto_283999 ?auto_284000 )
      ( GET-3IMAGE-VERIFY ?auto_283999 ?auto_284000 ?auto_284001 ?auto_283998 ?auto_284003 ?auto_284002 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_284020 - DIRECTION
      ?auto_284021 - MODE
      ?auto_284022 - DIRECTION
      ?auto_284019 - MODE
      ?auto_284024 - DIRECTION
      ?auto_284023 - MODE
    )
    :vars
    (
      ?auto_284025 - INSTRUMENT
      ?auto_284026 - SATELLITE
      ?auto_284028 - DIRECTION
      ?auto_284027 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_284022 ?auto_284020 ) ) ( not ( = ?auto_284024 ?auto_284020 ) ) ( not ( = ?auto_284024 ?auto_284022 ) ) ( ON_BOARD ?auto_284025 ?auto_284026 ) ( SUPPORTS ?auto_284025 ?auto_284021 ) ( not ( = ?auto_284020 ?auto_284028 ) ) ( HAVE_IMAGE ?auto_284024 ?auto_284023 ) ( not ( = ?auto_284024 ?auto_284028 ) ) ( not ( = ?auto_284023 ?auto_284021 ) ) ( CALIBRATION_TARGET ?auto_284025 ?auto_284028 ) ( POINTING ?auto_284026 ?auto_284022 ) ( not ( = ?auto_284028 ?auto_284022 ) ) ( ON_BOARD ?auto_284027 ?auto_284026 ) ( POWER_ON ?auto_284027 ) ( not ( = ?auto_284025 ?auto_284027 ) ) ( HAVE_IMAGE ?auto_284022 ?auto_284019 ) ( not ( = ?auto_284021 ?auto_284019 ) ) ( not ( = ?auto_284019 ?auto_284023 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_284024 ?auto_284023 ?auto_284020 ?auto_284021 )
      ( GET-3IMAGE-VERIFY ?auto_284020 ?auto_284021 ?auto_284022 ?auto_284019 ?auto_284024 ?auto_284023 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_285991 - DIRECTION
      ?auto_285992 - MODE
    )
    :vars
    (
      ?auto_285995 - DIRECTION
      ?auto_285996 - INSTRUMENT
      ?auto_285999 - SATELLITE
      ?auto_285993 - DIRECTION
      ?auto_285998 - MODE
      ?auto_285997 - DIRECTION
      ?auto_285994 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_285991 ?auto_285995 ) ) ( ON_BOARD ?auto_285996 ?auto_285999 ) ( SUPPORTS ?auto_285996 ?auto_285992 ) ( not ( = ?auto_285991 ?auto_285993 ) ) ( HAVE_IMAGE ?auto_285995 ?auto_285998 ) ( not ( = ?auto_285995 ?auto_285993 ) ) ( not ( = ?auto_285998 ?auto_285992 ) ) ( CALIBRATION_TARGET ?auto_285996 ?auto_285993 ) ( not ( = ?auto_285993 ?auto_285997 ) ) ( not ( = ?auto_285991 ?auto_285997 ) ) ( not ( = ?auto_285995 ?auto_285997 ) ) ( ON_BOARD ?auto_285994 ?auto_285999 ) ( POWER_ON ?auto_285994 ) ( not ( = ?auto_285996 ?auto_285994 ) ) ( POINTING ?auto_285999 ?auto_285993 ) )
    :subtasks
    ( ( !TURN_TO ?auto_285999 ?auto_285997 ?auto_285993 )
      ( GET-2IMAGE ?auto_285995 ?auto_285998 ?auto_285991 ?auto_285992 )
      ( GET-1IMAGE-VERIFY ?auto_285991 ?auto_285992 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_286001 - DIRECTION
      ?auto_286002 - MODE
      ?auto_286003 - DIRECTION
      ?auto_286000 - MODE
    )
    :vars
    (
      ?auto_286004 - INSTRUMENT
      ?auto_286008 - SATELLITE
      ?auto_286007 - DIRECTION
      ?auto_286005 - DIRECTION
      ?auto_286006 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_286003 ?auto_286001 ) ) ( ON_BOARD ?auto_286004 ?auto_286008 ) ( SUPPORTS ?auto_286004 ?auto_286000 ) ( not ( = ?auto_286003 ?auto_286007 ) ) ( HAVE_IMAGE ?auto_286001 ?auto_286002 ) ( not ( = ?auto_286001 ?auto_286007 ) ) ( not ( = ?auto_286002 ?auto_286000 ) ) ( CALIBRATION_TARGET ?auto_286004 ?auto_286007 ) ( not ( = ?auto_286007 ?auto_286005 ) ) ( not ( = ?auto_286003 ?auto_286005 ) ) ( not ( = ?auto_286001 ?auto_286005 ) ) ( ON_BOARD ?auto_286006 ?auto_286008 ) ( POWER_ON ?auto_286006 ) ( not ( = ?auto_286004 ?auto_286006 ) ) ( POINTING ?auto_286008 ?auto_286007 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_286003 ?auto_286000 )
      ( GET-2IMAGE-VERIFY ?auto_286001 ?auto_286002 ?auto_286003 ?auto_286000 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_286020 - DIRECTION
      ?auto_286021 - MODE
      ?auto_286022 - DIRECTION
      ?auto_286019 - MODE
    )
    :vars
    (
      ?auto_286023 - INSTRUMENT
      ?auto_286024 - SATELLITE
      ?auto_286027 - DIRECTION
      ?auto_286026 - DIRECTION
      ?auto_286025 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_286022 ?auto_286020 ) ) ( ON_BOARD ?auto_286023 ?auto_286024 ) ( SUPPORTS ?auto_286023 ?auto_286021 ) ( not ( = ?auto_286020 ?auto_286027 ) ) ( HAVE_IMAGE ?auto_286022 ?auto_286019 ) ( not ( = ?auto_286022 ?auto_286027 ) ) ( not ( = ?auto_286019 ?auto_286021 ) ) ( CALIBRATION_TARGET ?auto_286023 ?auto_286027 ) ( not ( = ?auto_286027 ?auto_286026 ) ) ( not ( = ?auto_286020 ?auto_286026 ) ) ( not ( = ?auto_286022 ?auto_286026 ) ) ( ON_BOARD ?auto_286025 ?auto_286024 ) ( POWER_ON ?auto_286025 ) ( not ( = ?auto_286023 ?auto_286025 ) ) ( POINTING ?auto_286024 ?auto_286027 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_286022 ?auto_286019 ?auto_286020 ?auto_286021 )
      ( GET-2IMAGE-VERIFY ?auto_286020 ?auto_286021 ?auto_286022 ?auto_286019 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_298323 - DIRECTION
      ?auto_298324 - MODE
      ?auto_298325 - DIRECTION
      ?auto_298322 - MODE
      ?auto_298327 - DIRECTION
      ?auto_298326 - MODE
      ?auto_298328 - DIRECTION
      ?auto_298329 - MODE
    )
    :vars
    (
      ?auto_298331 - INSTRUMENT
      ?auto_298330 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_298325 ?auto_298323 ) ) ( not ( = ?auto_298327 ?auto_298323 ) ) ( not ( = ?auto_298327 ?auto_298325 ) ) ( not ( = ?auto_298328 ?auto_298323 ) ) ( not ( = ?auto_298328 ?auto_298325 ) ) ( not ( = ?auto_298328 ?auto_298327 ) ) ( CALIBRATED ?auto_298331 ) ( ON_BOARD ?auto_298331 ?auto_298330 ) ( SUPPORTS ?auto_298331 ?auto_298329 ) ( POWER_ON ?auto_298331 ) ( POINTING ?auto_298330 ?auto_298328 ) ( HAVE_IMAGE ?auto_298323 ?auto_298324 ) ( HAVE_IMAGE ?auto_298325 ?auto_298322 ) ( HAVE_IMAGE ?auto_298327 ?auto_298326 ) ( not ( = ?auto_298324 ?auto_298322 ) ) ( not ( = ?auto_298324 ?auto_298326 ) ) ( not ( = ?auto_298324 ?auto_298329 ) ) ( not ( = ?auto_298322 ?auto_298326 ) ) ( not ( = ?auto_298322 ?auto_298329 ) ) ( not ( = ?auto_298326 ?auto_298329 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_298328 ?auto_298329 )
      ( GET-4IMAGE-VERIFY ?auto_298323 ?auto_298324 ?auto_298325 ?auto_298322 ?auto_298327 ?auto_298326 ?auto_298328 ?auto_298329 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_298353 - DIRECTION
      ?auto_298354 - MODE
      ?auto_298355 - DIRECTION
      ?auto_298352 - MODE
      ?auto_298357 - DIRECTION
      ?auto_298356 - MODE
      ?auto_298358 - DIRECTION
      ?auto_298359 - MODE
    )
    :vars
    (
      ?auto_298361 - INSTRUMENT
      ?auto_298360 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_298355 ?auto_298353 ) ) ( not ( = ?auto_298357 ?auto_298353 ) ) ( not ( = ?auto_298357 ?auto_298355 ) ) ( not ( = ?auto_298358 ?auto_298353 ) ) ( not ( = ?auto_298358 ?auto_298355 ) ) ( not ( = ?auto_298358 ?auto_298357 ) ) ( CALIBRATED ?auto_298361 ) ( ON_BOARD ?auto_298361 ?auto_298360 ) ( SUPPORTS ?auto_298361 ?auto_298356 ) ( POWER_ON ?auto_298361 ) ( POINTING ?auto_298360 ?auto_298357 ) ( HAVE_IMAGE ?auto_298353 ?auto_298354 ) ( HAVE_IMAGE ?auto_298355 ?auto_298352 ) ( HAVE_IMAGE ?auto_298358 ?auto_298359 ) ( not ( = ?auto_298354 ?auto_298352 ) ) ( not ( = ?auto_298354 ?auto_298356 ) ) ( not ( = ?auto_298354 ?auto_298359 ) ) ( not ( = ?auto_298352 ?auto_298356 ) ) ( not ( = ?auto_298352 ?auto_298359 ) ) ( not ( = ?auto_298356 ?auto_298359 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_298357 ?auto_298356 )
      ( GET-4IMAGE-VERIFY ?auto_298353 ?auto_298354 ?auto_298355 ?auto_298352 ?auto_298357 ?auto_298356 ?auto_298358 ?auto_298359 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_298499 - DIRECTION
      ?auto_298500 - MODE
      ?auto_298501 - DIRECTION
      ?auto_298498 - MODE
      ?auto_298503 - DIRECTION
      ?auto_298502 - MODE
      ?auto_298504 - DIRECTION
      ?auto_298505 - MODE
    )
    :vars
    (
      ?auto_298507 - INSTRUMENT
      ?auto_298506 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_298501 ?auto_298499 ) ) ( not ( = ?auto_298503 ?auto_298499 ) ) ( not ( = ?auto_298503 ?auto_298501 ) ) ( not ( = ?auto_298504 ?auto_298499 ) ) ( not ( = ?auto_298504 ?auto_298501 ) ) ( not ( = ?auto_298504 ?auto_298503 ) ) ( CALIBRATED ?auto_298507 ) ( ON_BOARD ?auto_298507 ?auto_298506 ) ( SUPPORTS ?auto_298507 ?auto_298498 ) ( POWER_ON ?auto_298507 ) ( POINTING ?auto_298506 ?auto_298501 ) ( HAVE_IMAGE ?auto_298499 ?auto_298500 ) ( HAVE_IMAGE ?auto_298503 ?auto_298502 ) ( HAVE_IMAGE ?auto_298504 ?auto_298505 ) ( not ( = ?auto_298500 ?auto_298498 ) ) ( not ( = ?auto_298500 ?auto_298502 ) ) ( not ( = ?auto_298500 ?auto_298505 ) ) ( not ( = ?auto_298498 ?auto_298502 ) ) ( not ( = ?auto_298498 ?auto_298505 ) ) ( not ( = ?auto_298502 ?auto_298505 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_298501 ?auto_298498 )
      ( GET-4IMAGE-VERIFY ?auto_298499 ?auto_298500 ?auto_298501 ?auto_298498 ?auto_298503 ?auto_298502 ?auto_298504 ?auto_298505 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_299373 - DIRECTION
      ?auto_299374 - MODE
      ?auto_299375 - DIRECTION
      ?auto_299372 - MODE
      ?auto_299377 - DIRECTION
      ?auto_299376 - MODE
      ?auto_299378 - DIRECTION
      ?auto_299379 - MODE
    )
    :vars
    (
      ?auto_299381 - INSTRUMENT
      ?auto_299380 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_299375 ?auto_299373 ) ) ( not ( = ?auto_299377 ?auto_299373 ) ) ( not ( = ?auto_299377 ?auto_299375 ) ) ( not ( = ?auto_299378 ?auto_299373 ) ) ( not ( = ?auto_299378 ?auto_299375 ) ) ( not ( = ?auto_299378 ?auto_299377 ) ) ( CALIBRATED ?auto_299381 ) ( ON_BOARD ?auto_299381 ?auto_299380 ) ( SUPPORTS ?auto_299381 ?auto_299374 ) ( POWER_ON ?auto_299381 ) ( POINTING ?auto_299380 ?auto_299373 ) ( HAVE_IMAGE ?auto_299375 ?auto_299372 ) ( HAVE_IMAGE ?auto_299377 ?auto_299376 ) ( HAVE_IMAGE ?auto_299378 ?auto_299379 ) ( not ( = ?auto_299374 ?auto_299372 ) ) ( not ( = ?auto_299374 ?auto_299376 ) ) ( not ( = ?auto_299374 ?auto_299379 ) ) ( not ( = ?auto_299372 ?auto_299376 ) ) ( not ( = ?auto_299372 ?auto_299379 ) ) ( not ( = ?auto_299376 ?auto_299379 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_299373 ?auto_299374 )
      ( GET-4IMAGE-VERIFY ?auto_299373 ?auto_299374 ?auto_299375 ?auto_299372 ?auto_299377 ?auto_299376 ?auto_299378 ?auto_299379 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_300400 - DIRECTION
      ?auto_300401 - MODE
      ?auto_300402 - DIRECTION
      ?auto_300399 - MODE
      ?auto_300404 - DIRECTION
      ?auto_300403 - MODE
      ?auto_300405 - DIRECTION
      ?auto_300406 - MODE
    )
    :vars
    (
      ?auto_300408 - INSTRUMENT
      ?auto_300407 - SATELLITE
      ?auto_300409 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_300402 ?auto_300400 ) ) ( not ( = ?auto_300404 ?auto_300400 ) ) ( not ( = ?auto_300404 ?auto_300402 ) ) ( not ( = ?auto_300405 ?auto_300400 ) ) ( not ( = ?auto_300405 ?auto_300402 ) ) ( not ( = ?auto_300405 ?auto_300404 ) ) ( CALIBRATED ?auto_300408 ) ( ON_BOARD ?auto_300408 ?auto_300407 ) ( SUPPORTS ?auto_300408 ?auto_300406 ) ( POWER_ON ?auto_300408 ) ( POINTING ?auto_300407 ?auto_300409 ) ( not ( = ?auto_300405 ?auto_300409 ) ) ( HAVE_IMAGE ?auto_300400 ?auto_300401 ) ( not ( = ?auto_300400 ?auto_300409 ) ) ( not ( = ?auto_300401 ?auto_300406 ) ) ( HAVE_IMAGE ?auto_300402 ?auto_300399 ) ( HAVE_IMAGE ?auto_300404 ?auto_300403 ) ( not ( = ?auto_300401 ?auto_300399 ) ) ( not ( = ?auto_300401 ?auto_300403 ) ) ( not ( = ?auto_300402 ?auto_300409 ) ) ( not ( = ?auto_300399 ?auto_300403 ) ) ( not ( = ?auto_300399 ?auto_300406 ) ) ( not ( = ?auto_300404 ?auto_300409 ) ) ( not ( = ?auto_300403 ?auto_300406 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_300400 ?auto_300401 ?auto_300405 ?auto_300406 )
      ( GET-4IMAGE-VERIFY ?auto_300400 ?auto_300401 ?auto_300402 ?auto_300399 ?auto_300404 ?auto_300403 ?auto_300405 ?auto_300406 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_300433 - DIRECTION
      ?auto_300434 - MODE
      ?auto_300435 - DIRECTION
      ?auto_300432 - MODE
      ?auto_300437 - DIRECTION
      ?auto_300436 - MODE
      ?auto_300438 - DIRECTION
      ?auto_300439 - MODE
    )
    :vars
    (
      ?auto_300441 - INSTRUMENT
      ?auto_300440 - SATELLITE
      ?auto_300442 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_300435 ?auto_300433 ) ) ( not ( = ?auto_300437 ?auto_300433 ) ) ( not ( = ?auto_300437 ?auto_300435 ) ) ( not ( = ?auto_300438 ?auto_300433 ) ) ( not ( = ?auto_300438 ?auto_300435 ) ) ( not ( = ?auto_300438 ?auto_300437 ) ) ( CALIBRATED ?auto_300441 ) ( ON_BOARD ?auto_300441 ?auto_300440 ) ( SUPPORTS ?auto_300441 ?auto_300436 ) ( POWER_ON ?auto_300441 ) ( POINTING ?auto_300440 ?auto_300442 ) ( not ( = ?auto_300437 ?auto_300442 ) ) ( HAVE_IMAGE ?auto_300433 ?auto_300434 ) ( not ( = ?auto_300433 ?auto_300442 ) ) ( not ( = ?auto_300434 ?auto_300436 ) ) ( HAVE_IMAGE ?auto_300435 ?auto_300432 ) ( HAVE_IMAGE ?auto_300438 ?auto_300439 ) ( not ( = ?auto_300434 ?auto_300432 ) ) ( not ( = ?auto_300434 ?auto_300439 ) ) ( not ( = ?auto_300435 ?auto_300442 ) ) ( not ( = ?auto_300432 ?auto_300436 ) ) ( not ( = ?auto_300432 ?auto_300439 ) ) ( not ( = ?auto_300436 ?auto_300439 ) ) ( not ( = ?auto_300438 ?auto_300442 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_300433 ?auto_300434 ?auto_300437 ?auto_300436 )
      ( GET-4IMAGE-VERIFY ?auto_300433 ?auto_300434 ?auto_300435 ?auto_300432 ?auto_300437 ?auto_300436 ?auto_300438 ?auto_300439 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_300592 - DIRECTION
      ?auto_300593 - MODE
      ?auto_300594 - DIRECTION
      ?auto_300591 - MODE
      ?auto_300596 - DIRECTION
      ?auto_300595 - MODE
      ?auto_300597 - DIRECTION
      ?auto_300598 - MODE
    )
    :vars
    (
      ?auto_300600 - INSTRUMENT
      ?auto_300599 - SATELLITE
      ?auto_300601 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_300594 ?auto_300592 ) ) ( not ( = ?auto_300596 ?auto_300592 ) ) ( not ( = ?auto_300596 ?auto_300594 ) ) ( not ( = ?auto_300597 ?auto_300592 ) ) ( not ( = ?auto_300597 ?auto_300594 ) ) ( not ( = ?auto_300597 ?auto_300596 ) ) ( CALIBRATED ?auto_300600 ) ( ON_BOARD ?auto_300600 ?auto_300599 ) ( SUPPORTS ?auto_300600 ?auto_300591 ) ( POWER_ON ?auto_300600 ) ( POINTING ?auto_300599 ?auto_300601 ) ( not ( = ?auto_300594 ?auto_300601 ) ) ( HAVE_IMAGE ?auto_300592 ?auto_300593 ) ( not ( = ?auto_300592 ?auto_300601 ) ) ( not ( = ?auto_300593 ?auto_300591 ) ) ( HAVE_IMAGE ?auto_300596 ?auto_300595 ) ( HAVE_IMAGE ?auto_300597 ?auto_300598 ) ( not ( = ?auto_300593 ?auto_300595 ) ) ( not ( = ?auto_300593 ?auto_300598 ) ) ( not ( = ?auto_300591 ?auto_300595 ) ) ( not ( = ?auto_300591 ?auto_300598 ) ) ( not ( = ?auto_300596 ?auto_300601 ) ) ( not ( = ?auto_300595 ?auto_300598 ) ) ( not ( = ?auto_300597 ?auto_300601 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_300592 ?auto_300593 ?auto_300594 ?auto_300591 )
      ( GET-4IMAGE-VERIFY ?auto_300592 ?auto_300593 ?auto_300594 ?auto_300591 ?auto_300596 ?auto_300595 ?auto_300597 ?auto_300598 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_301619 - DIRECTION
      ?auto_301620 - MODE
      ?auto_301621 - DIRECTION
      ?auto_301618 - MODE
      ?auto_301623 - DIRECTION
      ?auto_301622 - MODE
      ?auto_301624 - DIRECTION
      ?auto_301625 - MODE
    )
    :vars
    (
      ?auto_301627 - INSTRUMENT
      ?auto_301626 - SATELLITE
      ?auto_301628 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_301621 ?auto_301619 ) ) ( not ( = ?auto_301623 ?auto_301619 ) ) ( not ( = ?auto_301623 ?auto_301621 ) ) ( not ( = ?auto_301624 ?auto_301619 ) ) ( not ( = ?auto_301624 ?auto_301621 ) ) ( not ( = ?auto_301624 ?auto_301623 ) ) ( CALIBRATED ?auto_301627 ) ( ON_BOARD ?auto_301627 ?auto_301626 ) ( SUPPORTS ?auto_301627 ?auto_301620 ) ( POWER_ON ?auto_301627 ) ( POINTING ?auto_301626 ?auto_301628 ) ( not ( = ?auto_301619 ?auto_301628 ) ) ( HAVE_IMAGE ?auto_301621 ?auto_301618 ) ( not ( = ?auto_301621 ?auto_301628 ) ) ( not ( = ?auto_301618 ?auto_301620 ) ) ( HAVE_IMAGE ?auto_301623 ?auto_301622 ) ( HAVE_IMAGE ?auto_301624 ?auto_301625 ) ( not ( = ?auto_301620 ?auto_301622 ) ) ( not ( = ?auto_301620 ?auto_301625 ) ) ( not ( = ?auto_301618 ?auto_301622 ) ) ( not ( = ?auto_301618 ?auto_301625 ) ) ( not ( = ?auto_301623 ?auto_301628 ) ) ( not ( = ?auto_301622 ?auto_301625 ) ) ( not ( = ?auto_301624 ?auto_301628 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_301621 ?auto_301618 ?auto_301619 ?auto_301620 )
      ( GET-4IMAGE-VERIFY ?auto_301619 ?auto_301620 ?auto_301621 ?auto_301618 ?auto_301623 ?auto_301622 ?auto_301624 ?auto_301625 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_302755 - DIRECTION
      ?auto_302756 - MODE
      ?auto_302757 - DIRECTION
      ?auto_302754 - MODE
      ?auto_302759 - DIRECTION
      ?auto_302758 - MODE
      ?auto_302760 - DIRECTION
      ?auto_302761 - MODE
    )
    :vars
    (
      ?auto_302764 - INSTRUMENT
      ?auto_302763 - SATELLITE
      ?auto_302762 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_302757 ?auto_302755 ) ) ( not ( = ?auto_302759 ?auto_302755 ) ) ( not ( = ?auto_302759 ?auto_302757 ) ) ( not ( = ?auto_302760 ?auto_302755 ) ) ( not ( = ?auto_302760 ?auto_302757 ) ) ( not ( = ?auto_302760 ?auto_302759 ) ) ( ON_BOARD ?auto_302764 ?auto_302763 ) ( SUPPORTS ?auto_302764 ?auto_302761 ) ( POWER_ON ?auto_302764 ) ( POINTING ?auto_302763 ?auto_302762 ) ( not ( = ?auto_302760 ?auto_302762 ) ) ( HAVE_IMAGE ?auto_302755 ?auto_302756 ) ( not ( = ?auto_302755 ?auto_302762 ) ) ( not ( = ?auto_302756 ?auto_302761 ) ) ( CALIBRATION_TARGET ?auto_302764 ?auto_302762 ) ( NOT_CALIBRATED ?auto_302764 ) ( HAVE_IMAGE ?auto_302757 ?auto_302754 ) ( HAVE_IMAGE ?auto_302759 ?auto_302758 ) ( not ( = ?auto_302756 ?auto_302754 ) ) ( not ( = ?auto_302756 ?auto_302758 ) ) ( not ( = ?auto_302757 ?auto_302762 ) ) ( not ( = ?auto_302754 ?auto_302758 ) ) ( not ( = ?auto_302754 ?auto_302761 ) ) ( not ( = ?auto_302759 ?auto_302762 ) ) ( not ( = ?auto_302758 ?auto_302761 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_302755 ?auto_302756 ?auto_302760 ?auto_302761 )
      ( GET-4IMAGE-VERIFY ?auto_302755 ?auto_302756 ?auto_302757 ?auto_302754 ?auto_302759 ?auto_302758 ?auto_302760 ?auto_302761 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_302788 - DIRECTION
      ?auto_302789 - MODE
      ?auto_302790 - DIRECTION
      ?auto_302787 - MODE
      ?auto_302792 - DIRECTION
      ?auto_302791 - MODE
      ?auto_302793 - DIRECTION
      ?auto_302794 - MODE
    )
    :vars
    (
      ?auto_302797 - INSTRUMENT
      ?auto_302796 - SATELLITE
      ?auto_302795 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_302790 ?auto_302788 ) ) ( not ( = ?auto_302792 ?auto_302788 ) ) ( not ( = ?auto_302792 ?auto_302790 ) ) ( not ( = ?auto_302793 ?auto_302788 ) ) ( not ( = ?auto_302793 ?auto_302790 ) ) ( not ( = ?auto_302793 ?auto_302792 ) ) ( ON_BOARD ?auto_302797 ?auto_302796 ) ( SUPPORTS ?auto_302797 ?auto_302791 ) ( POWER_ON ?auto_302797 ) ( POINTING ?auto_302796 ?auto_302795 ) ( not ( = ?auto_302792 ?auto_302795 ) ) ( HAVE_IMAGE ?auto_302788 ?auto_302789 ) ( not ( = ?auto_302788 ?auto_302795 ) ) ( not ( = ?auto_302789 ?auto_302791 ) ) ( CALIBRATION_TARGET ?auto_302797 ?auto_302795 ) ( NOT_CALIBRATED ?auto_302797 ) ( HAVE_IMAGE ?auto_302790 ?auto_302787 ) ( HAVE_IMAGE ?auto_302793 ?auto_302794 ) ( not ( = ?auto_302789 ?auto_302787 ) ) ( not ( = ?auto_302789 ?auto_302794 ) ) ( not ( = ?auto_302790 ?auto_302795 ) ) ( not ( = ?auto_302787 ?auto_302791 ) ) ( not ( = ?auto_302787 ?auto_302794 ) ) ( not ( = ?auto_302791 ?auto_302794 ) ) ( not ( = ?auto_302793 ?auto_302795 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_302788 ?auto_302789 ?auto_302792 ?auto_302791 )
      ( GET-4IMAGE-VERIFY ?auto_302788 ?auto_302789 ?auto_302790 ?auto_302787 ?auto_302792 ?auto_302791 ?auto_302793 ?auto_302794 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_302947 - DIRECTION
      ?auto_302948 - MODE
      ?auto_302949 - DIRECTION
      ?auto_302946 - MODE
      ?auto_302951 - DIRECTION
      ?auto_302950 - MODE
      ?auto_302952 - DIRECTION
      ?auto_302953 - MODE
    )
    :vars
    (
      ?auto_302956 - INSTRUMENT
      ?auto_302955 - SATELLITE
      ?auto_302954 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_302949 ?auto_302947 ) ) ( not ( = ?auto_302951 ?auto_302947 ) ) ( not ( = ?auto_302951 ?auto_302949 ) ) ( not ( = ?auto_302952 ?auto_302947 ) ) ( not ( = ?auto_302952 ?auto_302949 ) ) ( not ( = ?auto_302952 ?auto_302951 ) ) ( ON_BOARD ?auto_302956 ?auto_302955 ) ( SUPPORTS ?auto_302956 ?auto_302946 ) ( POWER_ON ?auto_302956 ) ( POINTING ?auto_302955 ?auto_302954 ) ( not ( = ?auto_302949 ?auto_302954 ) ) ( HAVE_IMAGE ?auto_302947 ?auto_302948 ) ( not ( = ?auto_302947 ?auto_302954 ) ) ( not ( = ?auto_302948 ?auto_302946 ) ) ( CALIBRATION_TARGET ?auto_302956 ?auto_302954 ) ( NOT_CALIBRATED ?auto_302956 ) ( HAVE_IMAGE ?auto_302951 ?auto_302950 ) ( HAVE_IMAGE ?auto_302952 ?auto_302953 ) ( not ( = ?auto_302948 ?auto_302950 ) ) ( not ( = ?auto_302948 ?auto_302953 ) ) ( not ( = ?auto_302946 ?auto_302950 ) ) ( not ( = ?auto_302946 ?auto_302953 ) ) ( not ( = ?auto_302951 ?auto_302954 ) ) ( not ( = ?auto_302950 ?auto_302953 ) ) ( not ( = ?auto_302952 ?auto_302954 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_302947 ?auto_302948 ?auto_302949 ?auto_302946 )
      ( GET-4IMAGE-VERIFY ?auto_302947 ?auto_302948 ?auto_302949 ?auto_302946 ?auto_302951 ?auto_302950 ?auto_302952 ?auto_302953 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_303974 - DIRECTION
      ?auto_303975 - MODE
      ?auto_303976 - DIRECTION
      ?auto_303973 - MODE
      ?auto_303978 - DIRECTION
      ?auto_303977 - MODE
      ?auto_303979 - DIRECTION
      ?auto_303980 - MODE
    )
    :vars
    (
      ?auto_303983 - INSTRUMENT
      ?auto_303982 - SATELLITE
      ?auto_303981 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_303976 ?auto_303974 ) ) ( not ( = ?auto_303978 ?auto_303974 ) ) ( not ( = ?auto_303978 ?auto_303976 ) ) ( not ( = ?auto_303979 ?auto_303974 ) ) ( not ( = ?auto_303979 ?auto_303976 ) ) ( not ( = ?auto_303979 ?auto_303978 ) ) ( ON_BOARD ?auto_303983 ?auto_303982 ) ( SUPPORTS ?auto_303983 ?auto_303975 ) ( POWER_ON ?auto_303983 ) ( POINTING ?auto_303982 ?auto_303981 ) ( not ( = ?auto_303974 ?auto_303981 ) ) ( HAVE_IMAGE ?auto_303976 ?auto_303973 ) ( not ( = ?auto_303976 ?auto_303981 ) ) ( not ( = ?auto_303973 ?auto_303975 ) ) ( CALIBRATION_TARGET ?auto_303983 ?auto_303981 ) ( NOT_CALIBRATED ?auto_303983 ) ( HAVE_IMAGE ?auto_303978 ?auto_303977 ) ( HAVE_IMAGE ?auto_303979 ?auto_303980 ) ( not ( = ?auto_303975 ?auto_303977 ) ) ( not ( = ?auto_303975 ?auto_303980 ) ) ( not ( = ?auto_303973 ?auto_303977 ) ) ( not ( = ?auto_303973 ?auto_303980 ) ) ( not ( = ?auto_303978 ?auto_303981 ) ) ( not ( = ?auto_303977 ?auto_303980 ) ) ( not ( = ?auto_303979 ?auto_303981 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_303976 ?auto_303973 ?auto_303974 ?auto_303975 )
      ( GET-4IMAGE-VERIFY ?auto_303974 ?auto_303975 ?auto_303976 ?auto_303973 ?auto_303978 ?auto_303977 ?auto_303979 ?auto_303980 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_305110 - DIRECTION
      ?auto_305111 - MODE
      ?auto_305112 - DIRECTION
      ?auto_305109 - MODE
      ?auto_305114 - DIRECTION
      ?auto_305113 - MODE
      ?auto_305115 - DIRECTION
      ?auto_305116 - MODE
    )
    :vars
    (
      ?auto_305118 - INSTRUMENT
      ?auto_305119 - SATELLITE
      ?auto_305117 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_305112 ?auto_305110 ) ) ( not ( = ?auto_305114 ?auto_305110 ) ) ( not ( = ?auto_305114 ?auto_305112 ) ) ( not ( = ?auto_305115 ?auto_305110 ) ) ( not ( = ?auto_305115 ?auto_305112 ) ) ( not ( = ?auto_305115 ?auto_305114 ) ) ( ON_BOARD ?auto_305118 ?auto_305119 ) ( SUPPORTS ?auto_305118 ?auto_305116 ) ( POINTING ?auto_305119 ?auto_305117 ) ( not ( = ?auto_305115 ?auto_305117 ) ) ( HAVE_IMAGE ?auto_305110 ?auto_305111 ) ( not ( = ?auto_305110 ?auto_305117 ) ) ( not ( = ?auto_305111 ?auto_305116 ) ) ( CALIBRATION_TARGET ?auto_305118 ?auto_305117 ) ( POWER_AVAIL ?auto_305119 ) ( HAVE_IMAGE ?auto_305112 ?auto_305109 ) ( HAVE_IMAGE ?auto_305114 ?auto_305113 ) ( not ( = ?auto_305111 ?auto_305109 ) ) ( not ( = ?auto_305111 ?auto_305113 ) ) ( not ( = ?auto_305112 ?auto_305117 ) ) ( not ( = ?auto_305109 ?auto_305113 ) ) ( not ( = ?auto_305109 ?auto_305116 ) ) ( not ( = ?auto_305114 ?auto_305117 ) ) ( not ( = ?auto_305113 ?auto_305116 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_305110 ?auto_305111 ?auto_305115 ?auto_305116 )
      ( GET-4IMAGE-VERIFY ?auto_305110 ?auto_305111 ?auto_305112 ?auto_305109 ?auto_305114 ?auto_305113 ?auto_305115 ?auto_305116 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_305143 - DIRECTION
      ?auto_305144 - MODE
      ?auto_305145 - DIRECTION
      ?auto_305142 - MODE
      ?auto_305147 - DIRECTION
      ?auto_305146 - MODE
      ?auto_305148 - DIRECTION
      ?auto_305149 - MODE
    )
    :vars
    (
      ?auto_305151 - INSTRUMENT
      ?auto_305152 - SATELLITE
      ?auto_305150 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_305145 ?auto_305143 ) ) ( not ( = ?auto_305147 ?auto_305143 ) ) ( not ( = ?auto_305147 ?auto_305145 ) ) ( not ( = ?auto_305148 ?auto_305143 ) ) ( not ( = ?auto_305148 ?auto_305145 ) ) ( not ( = ?auto_305148 ?auto_305147 ) ) ( ON_BOARD ?auto_305151 ?auto_305152 ) ( SUPPORTS ?auto_305151 ?auto_305146 ) ( POINTING ?auto_305152 ?auto_305150 ) ( not ( = ?auto_305147 ?auto_305150 ) ) ( HAVE_IMAGE ?auto_305143 ?auto_305144 ) ( not ( = ?auto_305143 ?auto_305150 ) ) ( not ( = ?auto_305144 ?auto_305146 ) ) ( CALIBRATION_TARGET ?auto_305151 ?auto_305150 ) ( POWER_AVAIL ?auto_305152 ) ( HAVE_IMAGE ?auto_305145 ?auto_305142 ) ( HAVE_IMAGE ?auto_305148 ?auto_305149 ) ( not ( = ?auto_305144 ?auto_305142 ) ) ( not ( = ?auto_305144 ?auto_305149 ) ) ( not ( = ?auto_305145 ?auto_305150 ) ) ( not ( = ?auto_305142 ?auto_305146 ) ) ( not ( = ?auto_305142 ?auto_305149 ) ) ( not ( = ?auto_305146 ?auto_305149 ) ) ( not ( = ?auto_305148 ?auto_305150 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_305143 ?auto_305144 ?auto_305147 ?auto_305146 )
      ( GET-4IMAGE-VERIFY ?auto_305143 ?auto_305144 ?auto_305145 ?auto_305142 ?auto_305147 ?auto_305146 ?auto_305148 ?auto_305149 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_305302 - DIRECTION
      ?auto_305303 - MODE
      ?auto_305304 - DIRECTION
      ?auto_305301 - MODE
      ?auto_305306 - DIRECTION
      ?auto_305305 - MODE
      ?auto_305307 - DIRECTION
      ?auto_305308 - MODE
    )
    :vars
    (
      ?auto_305310 - INSTRUMENT
      ?auto_305311 - SATELLITE
      ?auto_305309 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_305304 ?auto_305302 ) ) ( not ( = ?auto_305306 ?auto_305302 ) ) ( not ( = ?auto_305306 ?auto_305304 ) ) ( not ( = ?auto_305307 ?auto_305302 ) ) ( not ( = ?auto_305307 ?auto_305304 ) ) ( not ( = ?auto_305307 ?auto_305306 ) ) ( ON_BOARD ?auto_305310 ?auto_305311 ) ( SUPPORTS ?auto_305310 ?auto_305301 ) ( POINTING ?auto_305311 ?auto_305309 ) ( not ( = ?auto_305304 ?auto_305309 ) ) ( HAVE_IMAGE ?auto_305302 ?auto_305303 ) ( not ( = ?auto_305302 ?auto_305309 ) ) ( not ( = ?auto_305303 ?auto_305301 ) ) ( CALIBRATION_TARGET ?auto_305310 ?auto_305309 ) ( POWER_AVAIL ?auto_305311 ) ( HAVE_IMAGE ?auto_305306 ?auto_305305 ) ( HAVE_IMAGE ?auto_305307 ?auto_305308 ) ( not ( = ?auto_305303 ?auto_305305 ) ) ( not ( = ?auto_305303 ?auto_305308 ) ) ( not ( = ?auto_305301 ?auto_305305 ) ) ( not ( = ?auto_305301 ?auto_305308 ) ) ( not ( = ?auto_305306 ?auto_305309 ) ) ( not ( = ?auto_305305 ?auto_305308 ) ) ( not ( = ?auto_305307 ?auto_305309 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_305302 ?auto_305303 ?auto_305304 ?auto_305301 )
      ( GET-4IMAGE-VERIFY ?auto_305302 ?auto_305303 ?auto_305304 ?auto_305301 ?auto_305306 ?auto_305305 ?auto_305307 ?auto_305308 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_306329 - DIRECTION
      ?auto_306330 - MODE
      ?auto_306331 - DIRECTION
      ?auto_306328 - MODE
      ?auto_306333 - DIRECTION
      ?auto_306332 - MODE
      ?auto_306334 - DIRECTION
      ?auto_306335 - MODE
    )
    :vars
    (
      ?auto_306337 - INSTRUMENT
      ?auto_306338 - SATELLITE
      ?auto_306336 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_306331 ?auto_306329 ) ) ( not ( = ?auto_306333 ?auto_306329 ) ) ( not ( = ?auto_306333 ?auto_306331 ) ) ( not ( = ?auto_306334 ?auto_306329 ) ) ( not ( = ?auto_306334 ?auto_306331 ) ) ( not ( = ?auto_306334 ?auto_306333 ) ) ( ON_BOARD ?auto_306337 ?auto_306338 ) ( SUPPORTS ?auto_306337 ?auto_306330 ) ( POINTING ?auto_306338 ?auto_306336 ) ( not ( = ?auto_306329 ?auto_306336 ) ) ( HAVE_IMAGE ?auto_306331 ?auto_306328 ) ( not ( = ?auto_306331 ?auto_306336 ) ) ( not ( = ?auto_306328 ?auto_306330 ) ) ( CALIBRATION_TARGET ?auto_306337 ?auto_306336 ) ( POWER_AVAIL ?auto_306338 ) ( HAVE_IMAGE ?auto_306333 ?auto_306332 ) ( HAVE_IMAGE ?auto_306334 ?auto_306335 ) ( not ( = ?auto_306330 ?auto_306332 ) ) ( not ( = ?auto_306330 ?auto_306335 ) ) ( not ( = ?auto_306328 ?auto_306332 ) ) ( not ( = ?auto_306328 ?auto_306335 ) ) ( not ( = ?auto_306333 ?auto_306336 ) ) ( not ( = ?auto_306332 ?auto_306335 ) ) ( not ( = ?auto_306334 ?auto_306336 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_306331 ?auto_306328 ?auto_306329 ?auto_306330 )
      ( GET-4IMAGE-VERIFY ?auto_306329 ?auto_306330 ?auto_306331 ?auto_306328 ?auto_306333 ?auto_306332 ?auto_306334 ?auto_306335 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_307076 - DIRECTION
      ?auto_307077 - MODE
      ?auto_307078 - DIRECTION
      ?auto_307075 - MODE
      ?auto_307080 - DIRECTION
      ?auto_307079 - MODE
    )
    :vars
    (
      ?auto_307082 - INSTRUMENT
      ?auto_307081 - SATELLITE
      ?auto_307084 - DIRECTION
      ?auto_307083 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_307078 ?auto_307076 ) ) ( not ( = ?auto_307080 ?auto_307076 ) ) ( not ( = ?auto_307080 ?auto_307078 ) ) ( ON_BOARD ?auto_307082 ?auto_307081 ) ( SUPPORTS ?auto_307082 ?auto_307079 ) ( not ( = ?auto_307080 ?auto_307084 ) ) ( HAVE_IMAGE ?auto_307076 ?auto_307077 ) ( not ( = ?auto_307076 ?auto_307084 ) ) ( not ( = ?auto_307077 ?auto_307079 ) ) ( CALIBRATION_TARGET ?auto_307082 ?auto_307084 ) ( POWER_AVAIL ?auto_307081 ) ( POINTING ?auto_307081 ?auto_307083 ) ( not ( = ?auto_307084 ?auto_307083 ) ) ( not ( = ?auto_307080 ?auto_307083 ) ) ( not ( = ?auto_307076 ?auto_307083 ) ) ( HAVE_IMAGE ?auto_307078 ?auto_307075 ) ( not ( = ?auto_307077 ?auto_307075 ) ) ( not ( = ?auto_307078 ?auto_307084 ) ) ( not ( = ?auto_307078 ?auto_307083 ) ) ( not ( = ?auto_307075 ?auto_307079 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307076 ?auto_307077 ?auto_307080 ?auto_307079 )
      ( GET-3IMAGE-VERIFY ?auto_307076 ?auto_307077 ?auto_307078 ?auto_307075 ?auto_307080 ?auto_307079 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_307105 - DIRECTION
      ?auto_307106 - MODE
      ?auto_307107 - DIRECTION
      ?auto_307104 - MODE
      ?auto_307109 - DIRECTION
      ?auto_307108 - MODE
    )
    :vars
    (
      ?auto_307111 - INSTRUMENT
      ?auto_307110 - SATELLITE
      ?auto_307113 - DIRECTION
      ?auto_307112 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_307107 ?auto_307105 ) ) ( not ( = ?auto_307109 ?auto_307105 ) ) ( not ( = ?auto_307109 ?auto_307107 ) ) ( ON_BOARD ?auto_307111 ?auto_307110 ) ( SUPPORTS ?auto_307111 ?auto_307104 ) ( not ( = ?auto_307107 ?auto_307113 ) ) ( HAVE_IMAGE ?auto_307105 ?auto_307106 ) ( not ( = ?auto_307105 ?auto_307113 ) ) ( not ( = ?auto_307106 ?auto_307104 ) ) ( CALIBRATION_TARGET ?auto_307111 ?auto_307113 ) ( POWER_AVAIL ?auto_307110 ) ( POINTING ?auto_307110 ?auto_307112 ) ( not ( = ?auto_307113 ?auto_307112 ) ) ( not ( = ?auto_307107 ?auto_307112 ) ) ( not ( = ?auto_307105 ?auto_307112 ) ) ( HAVE_IMAGE ?auto_307109 ?auto_307108 ) ( not ( = ?auto_307106 ?auto_307108 ) ) ( not ( = ?auto_307104 ?auto_307108 ) ) ( not ( = ?auto_307109 ?auto_307113 ) ) ( not ( = ?auto_307109 ?auto_307112 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307105 ?auto_307106 ?auto_307107 ?auto_307104 )
      ( GET-3IMAGE-VERIFY ?auto_307105 ?auto_307106 ?auto_307107 ?auto_307104 ?auto_307109 ?auto_307108 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_307267 - DIRECTION
      ?auto_307268 - MODE
      ?auto_307269 - DIRECTION
      ?auto_307266 - MODE
      ?auto_307271 - DIRECTION
      ?auto_307270 - MODE
    )
    :vars
    (
      ?auto_307273 - INSTRUMENT
      ?auto_307272 - SATELLITE
      ?auto_307275 - DIRECTION
      ?auto_307274 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_307269 ?auto_307267 ) ) ( not ( = ?auto_307271 ?auto_307267 ) ) ( not ( = ?auto_307271 ?auto_307269 ) ) ( ON_BOARD ?auto_307273 ?auto_307272 ) ( SUPPORTS ?auto_307273 ?auto_307268 ) ( not ( = ?auto_307267 ?auto_307275 ) ) ( HAVE_IMAGE ?auto_307269 ?auto_307266 ) ( not ( = ?auto_307269 ?auto_307275 ) ) ( not ( = ?auto_307266 ?auto_307268 ) ) ( CALIBRATION_TARGET ?auto_307273 ?auto_307275 ) ( POWER_AVAIL ?auto_307272 ) ( POINTING ?auto_307272 ?auto_307274 ) ( not ( = ?auto_307275 ?auto_307274 ) ) ( not ( = ?auto_307267 ?auto_307274 ) ) ( not ( = ?auto_307269 ?auto_307274 ) ) ( HAVE_IMAGE ?auto_307271 ?auto_307270 ) ( not ( = ?auto_307268 ?auto_307270 ) ) ( not ( = ?auto_307266 ?auto_307270 ) ) ( not ( = ?auto_307271 ?auto_307275 ) ) ( not ( = ?auto_307271 ?auto_307274 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307269 ?auto_307266 ?auto_307267 ?auto_307268 )
      ( GET-3IMAGE-VERIFY ?auto_307267 ?auto_307268 ?auto_307269 ?auto_307266 ?auto_307271 ?auto_307270 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_307520 - DIRECTION
      ?auto_307521 - MODE
      ?auto_307522 - DIRECTION
      ?auto_307519 - MODE
      ?auto_307524 - DIRECTION
      ?auto_307523 - MODE
      ?auto_307525 - DIRECTION
      ?auto_307526 - MODE
    )
    :vars
    (
      ?auto_307528 - INSTRUMENT
      ?auto_307527 - SATELLITE
      ?auto_307529 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_307522 ?auto_307520 ) ) ( not ( = ?auto_307524 ?auto_307520 ) ) ( not ( = ?auto_307524 ?auto_307522 ) ) ( not ( = ?auto_307525 ?auto_307520 ) ) ( not ( = ?auto_307525 ?auto_307522 ) ) ( not ( = ?auto_307525 ?auto_307524 ) ) ( ON_BOARD ?auto_307528 ?auto_307527 ) ( SUPPORTS ?auto_307528 ?auto_307526 ) ( not ( = ?auto_307525 ?auto_307529 ) ) ( HAVE_IMAGE ?auto_307520 ?auto_307521 ) ( not ( = ?auto_307520 ?auto_307529 ) ) ( not ( = ?auto_307521 ?auto_307526 ) ) ( CALIBRATION_TARGET ?auto_307528 ?auto_307529 ) ( POWER_AVAIL ?auto_307527 ) ( POINTING ?auto_307527 ?auto_307524 ) ( not ( = ?auto_307529 ?auto_307524 ) ) ( HAVE_IMAGE ?auto_307522 ?auto_307519 ) ( HAVE_IMAGE ?auto_307524 ?auto_307523 ) ( not ( = ?auto_307521 ?auto_307519 ) ) ( not ( = ?auto_307521 ?auto_307523 ) ) ( not ( = ?auto_307522 ?auto_307529 ) ) ( not ( = ?auto_307519 ?auto_307523 ) ) ( not ( = ?auto_307519 ?auto_307526 ) ) ( not ( = ?auto_307523 ?auto_307526 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307520 ?auto_307521 ?auto_307525 ?auto_307526 )
      ( GET-4IMAGE-VERIFY ?auto_307520 ?auto_307521 ?auto_307522 ?auto_307519 ?auto_307524 ?auto_307523 ?auto_307525 ?auto_307526 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_307555 - DIRECTION
      ?auto_307556 - MODE
      ?auto_307557 - DIRECTION
      ?auto_307554 - MODE
      ?auto_307559 - DIRECTION
      ?auto_307558 - MODE
      ?auto_307560 - DIRECTION
      ?auto_307561 - MODE
    )
    :vars
    (
      ?auto_307563 - INSTRUMENT
      ?auto_307562 - SATELLITE
      ?auto_307564 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_307557 ?auto_307555 ) ) ( not ( = ?auto_307559 ?auto_307555 ) ) ( not ( = ?auto_307559 ?auto_307557 ) ) ( not ( = ?auto_307560 ?auto_307555 ) ) ( not ( = ?auto_307560 ?auto_307557 ) ) ( not ( = ?auto_307560 ?auto_307559 ) ) ( ON_BOARD ?auto_307563 ?auto_307562 ) ( SUPPORTS ?auto_307563 ?auto_307558 ) ( not ( = ?auto_307559 ?auto_307564 ) ) ( HAVE_IMAGE ?auto_307555 ?auto_307556 ) ( not ( = ?auto_307555 ?auto_307564 ) ) ( not ( = ?auto_307556 ?auto_307558 ) ) ( CALIBRATION_TARGET ?auto_307563 ?auto_307564 ) ( POWER_AVAIL ?auto_307562 ) ( POINTING ?auto_307562 ?auto_307560 ) ( not ( = ?auto_307564 ?auto_307560 ) ) ( HAVE_IMAGE ?auto_307557 ?auto_307554 ) ( HAVE_IMAGE ?auto_307560 ?auto_307561 ) ( not ( = ?auto_307556 ?auto_307554 ) ) ( not ( = ?auto_307556 ?auto_307561 ) ) ( not ( = ?auto_307557 ?auto_307564 ) ) ( not ( = ?auto_307554 ?auto_307558 ) ) ( not ( = ?auto_307554 ?auto_307561 ) ) ( not ( = ?auto_307558 ?auto_307561 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307555 ?auto_307556 ?auto_307559 ?auto_307558 )
      ( GET-4IMAGE-VERIFY ?auto_307555 ?auto_307556 ?auto_307557 ?auto_307554 ?auto_307559 ?auto_307558 ?auto_307560 ?auto_307561 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_307589 - DIRECTION
      ?auto_307590 - MODE
      ?auto_307591 - DIRECTION
      ?auto_307588 - MODE
      ?auto_307593 - DIRECTION
      ?auto_307592 - MODE
      ?auto_307594 - DIRECTION
      ?auto_307595 - MODE
    )
    :vars
    (
      ?auto_307597 - INSTRUMENT
      ?auto_307596 - SATELLITE
      ?auto_307598 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_307591 ?auto_307589 ) ) ( not ( = ?auto_307593 ?auto_307589 ) ) ( not ( = ?auto_307593 ?auto_307591 ) ) ( not ( = ?auto_307594 ?auto_307589 ) ) ( not ( = ?auto_307594 ?auto_307591 ) ) ( not ( = ?auto_307594 ?auto_307593 ) ) ( ON_BOARD ?auto_307597 ?auto_307596 ) ( SUPPORTS ?auto_307597 ?auto_307595 ) ( not ( = ?auto_307594 ?auto_307598 ) ) ( HAVE_IMAGE ?auto_307589 ?auto_307590 ) ( not ( = ?auto_307589 ?auto_307598 ) ) ( not ( = ?auto_307590 ?auto_307595 ) ) ( CALIBRATION_TARGET ?auto_307597 ?auto_307598 ) ( POWER_AVAIL ?auto_307596 ) ( POINTING ?auto_307596 ?auto_307591 ) ( not ( = ?auto_307598 ?auto_307591 ) ) ( HAVE_IMAGE ?auto_307591 ?auto_307588 ) ( HAVE_IMAGE ?auto_307593 ?auto_307592 ) ( not ( = ?auto_307590 ?auto_307588 ) ) ( not ( = ?auto_307590 ?auto_307592 ) ) ( not ( = ?auto_307588 ?auto_307592 ) ) ( not ( = ?auto_307588 ?auto_307595 ) ) ( not ( = ?auto_307593 ?auto_307598 ) ) ( not ( = ?auto_307592 ?auto_307595 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307589 ?auto_307590 ?auto_307594 ?auto_307595 )
      ( GET-4IMAGE-VERIFY ?auto_307589 ?auto_307590 ?auto_307591 ?auto_307588 ?auto_307593 ?auto_307592 ?auto_307594 ?auto_307595 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_307622 - DIRECTION
      ?auto_307623 - MODE
      ?auto_307624 - DIRECTION
      ?auto_307621 - MODE
      ?auto_307626 - DIRECTION
      ?auto_307625 - MODE
      ?auto_307627 - DIRECTION
      ?auto_307628 - MODE
    )
    :vars
    (
      ?auto_307630 - INSTRUMENT
      ?auto_307629 - SATELLITE
      ?auto_307631 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_307624 ?auto_307622 ) ) ( not ( = ?auto_307626 ?auto_307622 ) ) ( not ( = ?auto_307626 ?auto_307624 ) ) ( not ( = ?auto_307627 ?auto_307622 ) ) ( not ( = ?auto_307627 ?auto_307624 ) ) ( not ( = ?auto_307627 ?auto_307626 ) ) ( ON_BOARD ?auto_307630 ?auto_307629 ) ( SUPPORTS ?auto_307630 ?auto_307625 ) ( not ( = ?auto_307626 ?auto_307631 ) ) ( HAVE_IMAGE ?auto_307622 ?auto_307623 ) ( not ( = ?auto_307622 ?auto_307631 ) ) ( not ( = ?auto_307623 ?auto_307625 ) ) ( CALIBRATION_TARGET ?auto_307630 ?auto_307631 ) ( POWER_AVAIL ?auto_307629 ) ( POINTING ?auto_307629 ?auto_307624 ) ( not ( = ?auto_307631 ?auto_307624 ) ) ( HAVE_IMAGE ?auto_307624 ?auto_307621 ) ( HAVE_IMAGE ?auto_307627 ?auto_307628 ) ( not ( = ?auto_307623 ?auto_307621 ) ) ( not ( = ?auto_307623 ?auto_307628 ) ) ( not ( = ?auto_307621 ?auto_307625 ) ) ( not ( = ?auto_307621 ?auto_307628 ) ) ( not ( = ?auto_307625 ?auto_307628 ) ) ( not ( = ?auto_307627 ?auto_307631 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307622 ?auto_307623 ?auto_307626 ?auto_307625 )
      ( GET-4IMAGE-VERIFY ?auto_307622 ?auto_307623 ?auto_307624 ?auto_307621 ?auto_307626 ?auto_307625 ?auto_307627 ?auto_307628 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_307726 - DIRECTION
      ?auto_307727 - MODE
      ?auto_307728 - DIRECTION
      ?auto_307725 - MODE
      ?auto_307730 - DIRECTION
      ?auto_307729 - MODE
      ?auto_307731 - DIRECTION
      ?auto_307732 - MODE
    )
    :vars
    (
      ?auto_307734 - INSTRUMENT
      ?auto_307733 - SATELLITE
      ?auto_307735 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_307728 ?auto_307726 ) ) ( not ( = ?auto_307730 ?auto_307726 ) ) ( not ( = ?auto_307730 ?auto_307728 ) ) ( not ( = ?auto_307731 ?auto_307726 ) ) ( not ( = ?auto_307731 ?auto_307728 ) ) ( not ( = ?auto_307731 ?auto_307730 ) ) ( ON_BOARD ?auto_307734 ?auto_307733 ) ( SUPPORTS ?auto_307734 ?auto_307725 ) ( not ( = ?auto_307728 ?auto_307735 ) ) ( HAVE_IMAGE ?auto_307726 ?auto_307727 ) ( not ( = ?auto_307726 ?auto_307735 ) ) ( not ( = ?auto_307727 ?auto_307725 ) ) ( CALIBRATION_TARGET ?auto_307734 ?auto_307735 ) ( POWER_AVAIL ?auto_307733 ) ( POINTING ?auto_307733 ?auto_307731 ) ( not ( = ?auto_307735 ?auto_307731 ) ) ( HAVE_IMAGE ?auto_307730 ?auto_307729 ) ( HAVE_IMAGE ?auto_307731 ?auto_307732 ) ( not ( = ?auto_307727 ?auto_307729 ) ) ( not ( = ?auto_307727 ?auto_307732 ) ) ( not ( = ?auto_307725 ?auto_307729 ) ) ( not ( = ?auto_307725 ?auto_307732 ) ) ( not ( = ?auto_307730 ?auto_307735 ) ) ( not ( = ?auto_307729 ?auto_307732 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307726 ?auto_307727 ?auto_307728 ?auto_307725 )
      ( GET-4IMAGE-VERIFY ?auto_307726 ?auto_307727 ?auto_307728 ?auto_307725 ?auto_307730 ?auto_307729 ?auto_307731 ?auto_307732 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_307760 - DIRECTION
      ?auto_307761 - MODE
      ?auto_307762 - DIRECTION
      ?auto_307759 - MODE
      ?auto_307764 - DIRECTION
      ?auto_307763 - MODE
      ?auto_307765 - DIRECTION
      ?auto_307766 - MODE
    )
    :vars
    (
      ?auto_307768 - INSTRUMENT
      ?auto_307767 - SATELLITE
      ?auto_307769 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_307762 ?auto_307760 ) ) ( not ( = ?auto_307764 ?auto_307760 ) ) ( not ( = ?auto_307764 ?auto_307762 ) ) ( not ( = ?auto_307765 ?auto_307760 ) ) ( not ( = ?auto_307765 ?auto_307762 ) ) ( not ( = ?auto_307765 ?auto_307764 ) ) ( ON_BOARD ?auto_307768 ?auto_307767 ) ( SUPPORTS ?auto_307768 ?auto_307759 ) ( not ( = ?auto_307762 ?auto_307769 ) ) ( HAVE_IMAGE ?auto_307760 ?auto_307761 ) ( not ( = ?auto_307760 ?auto_307769 ) ) ( not ( = ?auto_307761 ?auto_307759 ) ) ( CALIBRATION_TARGET ?auto_307768 ?auto_307769 ) ( POWER_AVAIL ?auto_307767 ) ( POINTING ?auto_307767 ?auto_307764 ) ( not ( = ?auto_307769 ?auto_307764 ) ) ( HAVE_IMAGE ?auto_307764 ?auto_307763 ) ( HAVE_IMAGE ?auto_307765 ?auto_307766 ) ( not ( = ?auto_307761 ?auto_307763 ) ) ( not ( = ?auto_307761 ?auto_307766 ) ) ( not ( = ?auto_307759 ?auto_307763 ) ) ( not ( = ?auto_307759 ?auto_307766 ) ) ( not ( = ?auto_307763 ?auto_307766 ) ) ( not ( = ?auto_307765 ?auto_307769 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_307760 ?auto_307761 ?auto_307762 ?auto_307759 )
      ( GET-4IMAGE-VERIFY ?auto_307760 ?auto_307761 ?auto_307762 ?auto_307759 ?auto_307764 ?auto_307763 ?auto_307765 ?auto_307766 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_308297 - DIRECTION
      ?auto_308298 - MODE
      ?auto_308299 - DIRECTION
      ?auto_308296 - MODE
      ?auto_308301 - DIRECTION
      ?auto_308300 - MODE
      ?auto_308302 - DIRECTION
      ?auto_308303 - MODE
    )
    :vars
    (
      ?auto_308305 - INSTRUMENT
      ?auto_308304 - SATELLITE
      ?auto_308306 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_308299 ?auto_308297 ) ) ( not ( = ?auto_308301 ?auto_308297 ) ) ( not ( = ?auto_308301 ?auto_308299 ) ) ( not ( = ?auto_308302 ?auto_308297 ) ) ( not ( = ?auto_308302 ?auto_308299 ) ) ( not ( = ?auto_308302 ?auto_308301 ) ) ( ON_BOARD ?auto_308305 ?auto_308304 ) ( SUPPORTS ?auto_308305 ?auto_308303 ) ( not ( = ?auto_308302 ?auto_308306 ) ) ( HAVE_IMAGE ?auto_308299 ?auto_308296 ) ( not ( = ?auto_308299 ?auto_308306 ) ) ( not ( = ?auto_308296 ?auto_308303 ) ) ( CALIBRATION_TARGET ?auto_308305 ?auto_308306 ) ( POWER_AVAIL ?auto_308304 ) ( POINTING ?auto_308304 ?auto_308297 ) ( not ( = ?auto_308306 ?auto_308297 ) ) ( HAVE_IMAGE ?auto_308297 ?auto_308298 ) ( HAVE_IMAGE ?auto_308301 ?auto_308300 ) ( not ( = ?auto_308298 ?auto_308296 ) ) ( not ( = ?auto_308298 ?auto_308300 ) ) ( not ( = ?auto_308298 ?auto_308303 ) ) ( not ( = ?auto_308296 ?auto_308300 ) ) ( not ( = ?auto_308301 ?auto_308306 ) ) ( not ( = ?auto_308300 ?auto_308303 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_308299 ?auto_308296 ?auto_308302 ?auto_308303 )
      ( GET-4IMAGE-VERIFY ?auto_308297 ?auto_308298 ?auto_308299 ?auto_308296 ?auto_308301 ?auto_308300 ?auto_308302 ?auto_308303 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_308330 - DIRECTION
      ?auto_308331 - MODE
      ?auto_308332 - DIRECTION
      ?auto_308329 - MODE
      ?auto_308334 - DIRECTION
      ?auto_308333 - MODE
      ?auto_308335 - DIRECTION
      ?auto_308336 - MODE
    )
    :vars
    (
      ?auto_308338 - INSTRUMENT
      ?auto_308337 - SATELLITE
      ?auto_308339 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_308332 ?auto_308330 ) ) ( not ( = ?auto_308334 ?auto_308330 ) ) ( not ( = ?auto_308334 ?auto_308332 ) ) ( not ( = ?auto_308335 ?auto_308330 ) ) ( not ( = ?auto_308335 ?auto_308332 ) ) ( not ( = ?auto_308335 ?auto_308334 ) ) ( ON_BOARD ?auto_308338 ?auto_308337 ) ( SUPPORTS ?auto_308338 ?auto_308333 ) ( not ( = ?auto_308334 ?auto_308339 ) ) ( HAVE_IMAGE ?auto_308332 ?auto_308329 ) ( not ( = ?auto_308332 ?auto_308339 ) ) ( not ( = ?auto_308329 ?auto_308333 ) ) ( CALIBRATION_TARGET ?auto_308338 ?auto_308339 ) ( POWER_AVAIL ?auto_308337 ) ( POINTING ?auto_308337 ?auto_308330 ) ( not ( = ?auto_308339 ?auto_308330 ) ) ( HAVE_IMAGE ?auto_308330 ?auto_308331 ) ( HAVE_IMAGE ?auto_308335 ?auto_308336 ) ( not ( = ?auto_308331 ?auto_308329 ) ) ( not ( = ?auto_308331 ?auto_308333 ) ) ( not ( = ?auto_308331 ?auto_308336 ) ) ( not ( = ?auto_308329 ?auto_308336 ) ) ( not ( = ?auto_308333 ?auto_308336 ) ) ( not ( = ?auto_308335 ?auto_308339 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_308332 ?auto_308329 ?auto_308334 ?auto_308333 )
      ( GET-4IMAGE-VERIFY ?auto_308330 ?auto_308331 ?auto_308332 ?auto_308329 ?auto_308334 ?auto_308333 ?auto_308335 ?auto_308336 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_308542 - DIRECTION
      ?auto_308543 - MODE
      ?auto_308544 - DIRECTION
      ?auto_308541 - MODE
      ?auto_308546 - DIRECTION
      ?auto_308545 - MODE
      ?auto_308547 - DIRECTION
      ?auto_308548 - MODE
    )
    :vars
    (
      ?auto_308550 - INSTRUMENT
      ?auto_308549 - SATELLITE
      ?auto_308551 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_308544 ?auto_308542 ) ) ( not ( = ?auto_308546 ?auto_308542 ) ) ( not ( = ?auto_308546 ?auto_308544 ) ) ( not ( = ?auto_308547 ?auto_308542 ) ) ( not ( = ?auto_308547 ?auto_308544 ) ) ( not ( = ?auto_308547 ?auto_308546 ) ) ( ON_BOARD ?auto_308550 ?auto_308549 ) ( SUPPORTS ?auto_308550 ?auto_308541 ) ( not ( = ?auto_308544 ?auto_308551 ) ) ( HAVE_IMAGE ?auto_308546 ?auto_308545 ) ( not ( = ?auto_308546 ?auto_308551 ) ) ( not ( = ?auto_308545 ?auto_308541 ) ) ( CALIBRATION_TARGET ?auto_308550 ?auto_308551 ) ( POWER_AVAIL ?auto_308549 ) ( POINTING ?auto_308549 ?auto_308542 ) ( not ( = ?auto_308551 ?auto_308542 ) ) ( HAVE_IMAGE ?auto_308542 ?auto_308543 ) ( HAVE_IMAGE ?auto_308547 ?auto_308548 ) ( not ( = ?auto_308543 ?auto_308541 ) ) ( not ( = ?auto_308543 ?auto_308545 ) ) ( not ( = ?auto_308543 ?auto_308548 ) ) ( not ( = ?auto_308541 ?auto_308548 ) ) ( not ( = ?auto_308545 ?auto_308548 ) ) ( not ( = ?auto_308547 ?auto_308551 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_308546 ?auto_308545 ?auto_308544 ?auto_308541 )
      ( GET-4IMAGE-VERIFY ?auto_308542 ?auto_308543 ?auto_308544 ?auto_308541 ?auto_308546 ?auto_308545 ?auto_308547 ?auto_308548 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_308793 - DIRECTION
      ?auto_308794 - MODE
      ?auto_308795 - DIRECTION
      ?auto_308792 - MODE
      ?auto_308797 - DIRECTION
      ?auto_308796 - MODE
      ?auto_308798 - DIRECTION
      ?auto_308799 - MODE
    )
    :vars
    (
      ?auto_308801 - INSTRUMENT
      ?auto_308800 - SATELLITE
      ?auto_308802 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_308795 ?auto_308793 ) ) ( not ( = ?auto_308797 ?auto_308793 ) ) ( not ( = ?auto_308797 ?auto_308795 ) ) ( not ( = ?auto_308798 ?auto_308793 ) ) ( not ( = ?auto_308798 ?auto_308795 ) ) ( not ( = ?auto_308798 ?auto_308797 ) ) ( ON_BOARD ?auto_308801 ?auto_308800 ) ( SUPPORTS ?auto_308801 ?auto_308794 ) ( not ( = ?auto_308793 ?auto_308802 ) ) ( HAVE_IMAGE ?auto_308795 ?auto_308792 ) ( not ( = ?auto_308795 ?auto_308802 ) ) ( not ( = ?auto_308792 ?auto_308794 ) ) ( CALIBRATION_TARGET ?auto_308801 ?auto_308802 ) ( POWER_AVAIL ?auto_308800 ) ( POINTING ?auto_308800 ?auto_308798 ) ( not ( = ?auto_308802 ?auto_308798 ) ) ( HAVE_IMAGE ?auto_308797 ?auto_308796 ) ( HAVE_IMAGE ?auto_308798 ?auto_308799 ) ( not ( = ?auto_308794 ?auto_308796 ) ) ( not ( = ?auto_308794 ?auto_308799 ) ) ( not ( = ?auto_308792 ?auto_308796 ) ) ( not ( = ?auto_308792 ?auto_308799 ) ) ( not ( = ?auto_308797 ?auto_308802 ) ) ( not ( = ?auto_308796 ?auto_308799 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_308795 ?auto_308792 ?auto_308793 ?auto_308794 )
      ( GET-4IMAGE-VERIFY ?auto_308793 ?auto_308794 ?auto_308795 ?auto_308792 ?auto_308797 ?auto_308796 ?auto_308798 ?auto_308799 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_308827 - DIRECTION
      ?auto_308828 - MODE
      ?auto_308829 - DIRECTION
      ?auto_308826 - MODE
      ?auto_308831 - DIRECTION
      ?auto_308830 - MODE
      ?auto_308832 - DIRECTION
      ?auto_308833 - MODE
    )
    :vars
    (
      ?auto_308835 - INSTRUMENT
      ?auto_308834 - SATELLITE
      ?auto_308836 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_308829 ?auto_308827 ) ) ( not ( = ?auto_308831 ?auto_308827 ) ) ( not ( = ?auto_308831 ?auto_308829 ) ) ( not ( = ?auto_308832 ?auto_308827 ) ) ( not ( = ?auto_308832 ?auto_308829 ) ) ( not ( = ?auto_308832 ?auto_308831 ) ) ( ON_BOARD ?auto_308835 ?auto_308834 ) ( SUPPORTS ?auto_308835 ?auto_308828 ) ( not ( = ?auto_308827 ?auto_308836 ) ) ( HAVE_IMAGE ?auto_308829 ?auto_308826 ) ( not ( = ?auto_308829 ?auto_308836 ) ) ( not ( = ?auto_308826 ?auto_308828 ) ) ( CALIBRATION_TARGET ?auto_308835 ?auto_308836 ) ( POWER_AVAIL ?auto_308834 ) ( POINTING ?auto_308834 ?auto_308831 ) ( not ( = ?auto_308836 ?auto_308831 ) ) ( HAVE_IMAGE ?auto_308831 ?auto_308830 ) ( HAVE_IMAGE ?auto_308832 ?auto_308833 ) ( not ( = ?auto_308828 ?auto_308830 ) ) ( not ( = ?auto_308828 ?auto_308833 ) ) ( not ( = ?auto_308826 ?auto_308830 ) ) ( not ( = ?auto_308826 ?auto_308833 ) ) ( not ( = ?auto_308830 ?auto_308833 ) ) ( not ( = ?auto_308832 ?auto_308836 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_308829 ?auto_308826 ?auto_308827 ?auto_308828 )
      ( GET-4IMAGE-VERIFY ?auto_308827 ?auto_308828 ?auto_308829 ?auto_308826 ?auto_308831 ?auto_308830 ?auto_308832 ?auto_308833 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309115 - DIRECTION
      ?auto_309116 - MODE
      ?auto_309117 - DIRECTION
      ?auto_309114 - MODE
      ?auto_309119 - DIRECTION
      ?auto_309118 - MODE
      ?auto_309120 - DIRECTION
      ?auto_309121 - MODE
    )
    :vars
    (
      ?auto_309123 - INSTRUMENT
      ?auto_309122 - SATELLITE
      ?auto_309124 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_309117 ?auto_309115 ) ) ( not ( = ?auto_309119 ?auto_309115 ) ) ( not ( = ?auto_309119 ?auto_309117 ) ) ( not ( = ?auto_309120 ?auto_309115 ) ) ( not ( = ?auto_309120 ?auto_309117 ) ) ( not ( = ?auto_309120 ?auto_309119 ) ) ( ON_BOARD ?auto_309123 ?auto_309122 ) ( SUPPORTS ?auto_309123 ?auto_309116 ) ( not ( = ?auto_309115 ?auto_309124 ) ) ( HAVE_IMAGE ?auto_309119 ?auto_309118 ) ( not ( = ?auto_309119 ?auto_309124 ) ) ( not ( = ?auto_309118 ?auto_309116 ) ) ( CALIBRATION_TARGET ?auto_309123 ?auto_309124 ) ( POWER_AVAIL ?auto_309122 ) ( POINTING ?auto_309122 ?auto_309117 ) ( not ( = ?auto_309124 ?auto_309117 ) ) ( HAVE_IMAGE ?auto_309117 ?auto_309114 ) ( HAVE_IMAGE ?auto_309120 ?auto_309121 ) ( not ( = ?auto_309116 ?auto_309114 ) ) ( not ( = ?auto_309116 ?auto_309121 ) ) ( not ( = ?auto_309114 ?auto_309118 ) ) ( not ( = ?auto_309114 ?auto_309121 ) ) ( not ( = ?auto_309118 ?auto_309121 ) ) ( not ( = ?auto_309120 ?auto_309124 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309119 ?auto_309118 ?auto_309115 ?auto_309116 )
      ( GET-4IMAGE-VERIFY ?auto_309115 ?auto_309116 ?auto_309117 ?auto_309114 ?auto_309119 ?auto_309118 ?auto_309120 ?auto_309121 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_309575 - DIRECTION
      ?auto_309576 - MODE
      ?auto_309577 - DIRECTION
      ?auto_309574 - MODE
      ?auto_309579 - DIRECTION
      ?auto_309578 - MODE
    )
    :vars
    (
      ?auto_309580 - INSTRUMENT
      ?auto_309581 - SATELLITE
      ?auto_309583 - DIRECTION
      ?auto_309584 - DIRECTION
      ?auto_309582 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_309577 ?auto_309575 ) ) ( not ( = ?auto_309579 ?auto_309575 ) ) ( not ( = ?auto_309579 ?auto_309577 ) ) ( ON_BOARD ?auto_309580 ?auto_309581 ) ( SUPPORTS ?auto_309580 ?auto_309578 ) ( not ( = ?auto_309579 ?auto_309583 ) ) ( HAVE_IMAGE ?auto_309575 ?auto_309576 ) ( not ( = ?auto_309575 ?auto_309583 ) ) ( not ( = ?auto_309576 ?auto_309578 ) ) ( CALIBRATION_TARGET ?auto_309580 ?auto_309583 ) ( POINTING ?auto_309581 ?auto_309584 ) ( not ( = ?auto_309583 ?auto_309584 ) ) ( not ( = ?auto_309579 ?auto_309584 ) ) ( not ( = ?auto_309575 ?auto_309584 ) ) ( ON_BOARD ?auto_309582 ?auto_309581 ) ( POWER_ON ?auto_309582 ) ( not ( = ?auto_309580 ?auto_309582 ) ) ( HAVE_IMAGE ?auto_309577 ?auto_309574 ) ( not ( = ?auto_309576 ?auto_309574 ) ) ( not ( = ?auto_309577 ?auto_309583 ) ) ( not ( = ?auto_309577 ?auto_309584 ) ) ( not ( = ?auto_309574 ?auto_309578 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309575 ?auto_309576 ?auto_309579 ?auto_309578 )
      ( GET-3IMAGE-VERIFY ?auto_309575 ?auto_309576 ?auto_309577 ?auto_309574 ?auto_309579 ?auto_309578 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_309607 - DIRECTION
      ?auto_309608 - MODE
      ?auto_309609 - DIRECTION
      ?auto_309606 - MODE
      ?auto_309611 - DIRECTION
      ?auto_309610 - MODE
    )
    :vars
    (
      ?auto_309612 - INSTRUMENT
      ?auto_309613 - SATELLITE
      ?auto_309615 - DIRECTION
      ?auto_309616 - DIRECTION
      ?auto_309614 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_309609 ?auto_309607 ) ) ( not ( = ?auto_309611 ?auto_309607 ) ) ( not ( = ?auto_309611 ?auto_309609 ) ) ( ON_BOARD ?auto_309612 ?auto_309613 ) ( SUPPORTS ?auto_309612 ?auto_309606 ) ( not ( = ?auto_309609 ?auto_309615 ) ) ( HAVE_IMAGE ?auto_309607 ?auto_309608 ) ( not ( = ?auto_309607 ?auto_309615 ) ) ( not ( = ?auto_309608 ?auto_309606 ) ) ( CALIBRATION_TARGET ?auto_309612 ?auto_309615 ) ( POINTING ?auto_309613 ?auto_309616 ) ( not ( = ?auto_309615 ?auto_309616 ) ) ( not ( = ?auto_309609 ?auto_309616 ) ) ( not ( = ?auto_309607 ?auto_309616 ) ) ( ON_BOARD ?auto_309614 ?auto_309613 ) ( POWER_ON ?auto_309614 ) ( not ( = ?auto_309612 ?auto_309614 ) ) ( HAVE_IMAGE ?auto_309611 ?auto_309610 ) ( not ( = ?auto_309608 ?auto_309610 ) ) ( not ( = ?auto_309606 ?auto_309610 ) ) ( not ( = ?auto_309611 ?auto_309615 ) ) ( not ( = ?auto_309611 ?auto_309616 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309607 ?auto_309608 ?auto_309609 ?auto_309606 )
      ( GET-3IMAGE-VERIFY ?auto_309607 ?auto_309608 ?auto_309609 ?auto_309606 ?auto_309611 ?auto_309610 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_309781 - DIRECTION
      ?auto_309782 - MODE
      ?auto_309783 - DIRECTION
      ?auto_309780 - MODE
      ?auto_309785 - DIRECTION
      ?auto_309784 - MODE
    )
    :vars
    (
      ?auto_309786 - INSTRUMENT
      ?auto_309787 - SATELLITE
      ?auto_309789 - DIRECTION
      ?auto_309790 - DIRECTION
      ?auto_309788 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_309783 ?auto_309781 ) ) ( not ( = ?auto_309785 ?auto_309781 ) ) ( not ( = ?auto_309785 ?auto_309783 ) ) ( ON_BOARD ?auto_309786 ?auto_309787 ) ( SUPPORTS ?auto_309786 ?auto_309782 ) ( not ( = ?auto_309781 ?auto_309789 ) ) ( HAVE_IMAGE ?auto_309783 ?auto_309780 ) ( not ( = ?auto_309783 ?auto_309789 ) ) ( not ( = ?auto_309780 ?auto_309782 ) ) ( CALIBRATION_TARGET ?auto_309786 ?auto_309789 ) ( POINTING ?auto_309787 ?auto_309790 ) ( not ( = ?auto_309789 ?auto_309790 ) ) ( not ( = ?auto_309781 ?auto_309790 ) ) ( not ( = ?auto_309783 ?auto_309790 ) ) ( ON_BOARD ?auto_309788 ?auto_309787 ) ( POWER_ON ?auto_309788 ) ( not ( = ?auto_309786 ?auto_309788 ) ) ( HAVE_IMAGE ?auto_309785 ?auto_309784 ) ( not ( = ?auto_309782 ?auto_309784 ) ) ( not ( = ?auto_309780 ?auto_309784 ) ) ( not ( = ?auto_309785 ?auto_309789 ) ) ( not ( = ?auto_309785 ?auto_309790 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_309783 ?auto_309780 ?auto_309781 ?auto_309782 )
      ( GET-3IMAGE-VERIFY ?auto_309781 ?auto_309782 ?auto_309783 ?auto_309780 ?auto_309785 ?auto_309784 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310055 - DIRECTION
      ?auto_310056 - MODE
      ?auto_310057 - DIRECTION
      ?auto_310054 - MODE
      ?auto_310059 - DIRECTION
      ?auto_310058 - MODE
      ?auto_310060 - DIRECTION
      ?auto_310061 - MODE
    )
    :vars
    (
      ?auto_310062 - INSTRUMENT
      ?auto_310063 - SATELLITE
      ?auto_310065 - DIRECTION
      ?auto_310064 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_310057 ?auto_310055 ) ) ( not ( = ?auto_310059 ?auto_310055 ) ) ( not ( = ?auto_310059 ?auto_310057 ) ) ( not ( = ?auto_310060 ?auto_310055 ) ) ( not ( = ?auto_310060 ?auto_310057 ) ) ( not ( = ?auto_310060 ?auto_310059 ) ) ( ON_BOARD ?auto_310062 ?auto_310063 ) ( SUPPORTS ?auto_310062 ?auto_310061 ) ( not ( = ?auto_310060 ?auto_310065 ) ) ( HAVE_IMAGE ?auto_310055 ?auto_310056 ) ( not ( = ?auto_310055 ?auto_310065 ) ) ( not ( = ?auto_310056 ?auto_310061 ) ) ( CALIBRATION_TARGET ?auto_310062 ?auto_310065 ) ( POINTING ?auto_310063 ?auto_310059 ) ( not ( = ?auto_310065 ?auto_310059 ) ) ( ON_BOARD ?auto_310064 ?auto_310063 ) ( POWER_ON ?auto_310064 ) ( not ( = ?auto_310062 ?auto_310064 ) ) ( HAVE_IMAGE ?auto_310057 ?auto_310054 ) ( HAVE_IMAGE ?auto_310059 ?auto_310058 ) ( not ( = ?auto_310056 ?auto_310054 ) ) ( not ( = ?auto_310056 ?auto_310058 ) ) ( not ( = ?auto_310057 ?auto_310065 ) ) ( not ( = ?auto_310054 ?auto_310058 ) ) ( not ( = ?auto_310054 ?auto_310061 ) ) ( not ( = ?auto_310058 ?auto_310061 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_310055 ?auto_310056 ?auto_310060 ?auto_310061 )
      ( GET-4IMAGE-VERIFY ?auto_310055 ?auto_310056 ?auto_310057 ?auto_310054 ?auto_310059 ?auto_310058 ?auto_310060 ?auto_310061 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310093 - DIRECTION
      ?auto_310094 - MODE
      ?auto_310095 - DIRECTION
      ?auto_310092 - MODE
      ?auto_310097 - DIRECTION
      ?auto_310096 - MODE
      ?auto_310098 - DIRECTION
      ?auto_310099 - MODE
    )
    :vars
    (
      ?auto_310100 - INSTRUMENT
      ?auto_310101 - SATELLITE
      ?auto_310103 - DIRECTION
      ?auto_310102 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_310095 ?auto_310093 ) ) ( not ( = ?auto_310097 ?auto_310093 ) ) ( not ( = ?auto_310097 ?auto_310095 ) ) ( not ( = ?auto_310098 ?auto_310093 ) ) ( not ( = ?auto_310098 ?auto_310095 ) ) ( not ( = ?auto_310098 ?auto_310097 ) ) ( ON_BOARD ?auto_310100 ?auto_310101 ) ( SUPPORTS ?auto_310100 ?auto_310096 ) ( not ( = ?auto_310097 ?auto_310103 ) ) ( HAVE_IMAGE ?auto_310093 ?auto_310094 ) ( not ( = ?auto_310093 ?auto_310103 ) ) ( not ( = ?auto_310094 ?auto_310096 ) ) ( CALIBRATION_TARGET ?auto_310100 ?auto_310103 ) ( POINTING ?auto_310101 ?auto_310098 ) ( not ( = ?auto_310103 ?auto_310098 ) ) ( ON_BOARD ?auto_310102 ?auto_310101 ) ( POWER_ON ?auto_310102 ) ( not ( = ?auto_310100 ?auto_310102 ) ) ( HAVE_IMAGE ?auto_310095 ?auto_310092 ) ( HAVE_IMAGE ?auto_310098 ?auto_310099 ) ( not ( = ?auto_310094 ?auto_310092 ) ) ( not ( = ?auto_310094 ?auto_310099 ) ) ( not ( = ?auto_310095 ?auto_310103 ) ) ( not ( = ?auto_310092 ?auto_310096 ) ) ( not ( = ?auto_310092 ?auto_310099 ) ) ( not ( = ?auto_310096 ?auto_310099 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_310093 ?auto_310094 ?auto_310097 ?auto_310096 )
      ( GET-4IMAGE-VERIFY ?auto_310093 ?auto_310094 ?auto_310095 ?auto_310092 ?auto_310097 ?auto_310096 ?auto_310098 ?auto_310099 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310130 - DIRECTION
      ?auto_310131 - MODE
      ?auto_310132 - DIRECTION
      ?auto_310129 - MODE
      ?auto_310134 - DIRECTION
      ?auto_310133 - MODE
      ?auto_310135 - DIRECTION
      ?auto_310136 - MODE
    )
    :vars
    (
      ?auto_310137 - INSTRUMENT
      ?auto_310138 - SATELLITE
      ?auto_310140 - DIRECTION
      ?auto_310139 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_310132 ?auto_310130 ) ) ( not ( = ?auto_310134 ?auto_310130 ) ) ( not ( = ?auto_310134 ?auto_310132 ) ) ( not ( = ?auto_310135 ?auto_310130 ) ) ( not ( = ?auto_310135 ?auto_310132 ) ) ( not ( = ?auto_310135 ?auto_310134 ) ) ( ON_BOARD ?auto_310137 ?auto_310138 ) ( SUPPORTS ?auto_310137 ?auto_310136 ) ( not ( = ?auto_310135 ?auto_310140 ) ) ( HAVE_IMAGE ?auto_310130 ?auto_310131 ) ( not ( = ?auto_310130 ?auto_310140 ) ) ( not ( = ?auto_310131 ?auto_310136 ) ) ( CALIBRATION_TARGET ?auto_310137 ?auto_310140 ) ( POINTING ?auto_310138 ?auto_310132 ) ( not ( = ?auto_310140 ?auto_310132 ) ) ( ON_BOARD ?auto_310139 ?auto_310138 ) ( POWER_ON ?auto_310139 ) ( not ( = ?auto_310137 ?auto_310139 ) ) ( HAVE_IMAGE ?auto_310132 ?auto_310129 ) ( HAVE_IMAGE ?auto_310134 ?auto_310133 ) ( not ( = ?auto_310131 ?auto_310129 ) ) ( not ( = ?auto_310131 ?auto_310133 ) ) ( not ( = ?auto_310129 ?auto_310133 ) ) ( not ( = ?auto_310129 ?auto_310136 ) ) ( not ( = ?auto_310134 ?auto_310140 ) ) ( not ( = ?auto_310133 ?auto_310136 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_310130 ?auto_310131 ?auto_310135 ?auto_310136 )
      ( GET-4IMAGE-VERIFY ?auto_310130 ?auto_310131 ?auto_310132 ?auto_310129 ?auto_310134 ?auto_310133 ?auto_310135 ?auto_310136 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310166 - DIRECTION
      ?auto_310167 - MODE
      ?auto_310168 - DIRECTION
      ?auto_310165 - MODE
      ?auto_310170 - DIRECTION
      ?auto_310169 - MODE
      ?auto_310171 - DIRECTION
      ?auto_310172 - MODE
    )
    :vars
    (
      ?auto_310173 - INSTRUMENT
      ?auto_310174 - SATELLITE
      ?auto_310176 - DIRECTION
      ?auto_310175 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_310168 ?auto_310166 ) ) ( not ( = ?auto_310170 ?auto_310166 ) ) ( not ( = ?auto_310170 ?auto_310168 ) ) ( not ( = ?auto_310171 ?auto_310166 ) ) ( not ( = ?auto_310171 ?auto_310168 ) ) ( not ( = ?auto_310171 ?auto_310170 ) ) ( ON_BOARD ?auto_310173 ?auto_310174 ) ( SUPPORTS ?auto_310173 ?auto_310169 ) ( not ( = ?auto_310170 ?auto_310176 ) ) ( HAVE_IMAGE ?auto_310166 ?auto_310167 ) ( not ( = ?auto_310166 ?auto_310176 ) ) ( not ( = ?auto_310167 ?auto_310169 ) ) ( CALIBRATION_TARGET ?auto_310173 ?auto_310176 ) ( POINTING ?auto_310174 ?auto_310168 ) ( not ( = ?auto_310176 ?auto_310168 ) ) ( ON_BOARD ?auto_310175 ?auto_310174 ) ( POWER_ON ?auto_310175 ) ( not ( = ?auto_310173 ?auto_310175 ) ) ( HAVE_IMAGE ?auto_310168 ?auto_310165 ) ( HAVE_IMAGE ?auto_310171 ?auto_310172 ) ( not ( = ?auto_310167 ?auto_310165 ) ) ( not ( = ?auto_310167 ?auto_310172 ) ) ( not ( = ?auto_310165 ?auto_310169 ) ) ( not ( = ?auto_310165 ?auto_310172 ) ) ( not ( = ?auto_310169 ?auto_310172 ) ) ( not ( = ?auto_310171 ?auto_310176 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_310166 ?auto_310167 ?auto_310170 ?auto_310169 )
      ( GET-4IMAGE-VERIFY ?auto_310166 ?auto_310167 ?auto_310168 ?auto_310165 ?auto_310170 ?auto_310169 ?auto_310171 ?auto_310172 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310279 - DIRECTION
      ?auto_310280 - MODE
      ?auto_310281 - DIRECTION
      ?auto_310278 - MODE
      ?auto_310283 - DIRECTION
      ?auto_310282 - MODE
      ?auto_310284 - DIRECTION
      ?auto_310285 - MODE
    )
    :vars
    (
      ?auto_310286 - INSTRUMENT
      ?auto_310287 - SATELLITE
      ?auto_310289 - DIRECTION
      ?auto_310288 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_310281 ?auto_310279 ) ) ( not ( = ?auto_310283 ?auto_310279 ) ) ( not ( = ?auto_310283 ?auto_310281 ) ) ( not ( = ?auto_310284 ?auto_310279 ) ) ( not ( = ?auto_310284 ?auto_310281 ) ) ( not ( = ?auto_310284 ?auto_310283 ) ) ( ON_BOARD ?auto_310286 ?auto_310287 ) ( SUPPORTS ?auto_310286 ?auto_310278 ) ( not ( = ?auto_310281 ?auto_310289 ) ) ( HAVE_IMAGE ?auto_310279 ?auto_310280 ) ( not ( = ?auto_310279 ?auto_310289 ) ) ( not ( = ?auto_310280 ?auto_310278 ) ) ( CALIBRATION_TARGET ?auto_310286 ?auto_310289 ) ( POINTING ?auto_310287 ?auto_310284 ) ( not ( = ?auto_310289 ?auto_310284 ) ) ( ON_BOARD ?auto_310288 ?auto_310287 ) ( POWER_ON ?auto_310288 ) ( not ( = ?auto_310286 ?auto_310288 ) ) ( HAVE_IMAGE ?auto_310283 ?auto_310282 ) ( HAVE_IMAGE ?auto_310284 ?auto_310285 ) ( not ( = ?auto_310280 ?auto_310282 ) ) ( not ( = ?auto_310280 ?auto_310285 ) ) ( not ( = ?auto_310278 ?auto_310282 ) ) ( not ( = ?auto_310278 ?auto_310285 ) ) ( not ( = ?auto_310283 ?auto_310289 ) ) ( not ( = ?auto_310282 ?auto_310285 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_310279 ?auto_310280 ?auto_310281 ?auto_310278 )
      ( GET-4IMAGE-VERIFY ?auto_310279 ?auto_310280 ?auto_310281 ?auto_310278 ?auto_310283 ?auto_310282 ?auto_310284 ?auto_310285 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310316 - DIRECTION
      ?auto_310317 - MODE
      ?auto_310318 - DIRECTION
      ?auto_310315 - MODE
      ?auto_310320 - DIRECTION
      ?auto_310319 - MODE
      ?auto_310321 - DIRECTION
      ?auto_310322 - MODE
    )
    :vars
    (
      ?auto_310323 - INSTRUMENT
      ?auto_310324 - SATELLITE
      ?auto_310326 - DIRECTION
      ?auto_310325 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_310318 ?auto_310316 ) ) ( not ( = ?auto_310320 ?auto_310316 ) ) ( not ( = ?auto_310320 ?auto_310318 ) ) ( not ( = ?auto_310321 ?auto_310316 ) ) ( not ( = ?auto_310321 ?auto_310318 ) ) ( not ( = ?auto_310321 ?auto_310320 ) ) ( ON_BOARD ?auto_310323 ?auto_310324 ) ( SUPPORTS ?auto_310323 ?auto_310315 ) ( not ( = ?auto_310318 ?auto_310326 ) ) ( HAVE_IMAGE ?auto_310316 ?auto_310317 ) ( not ( = ?auto_310316 ?auto_310326 ) ) ( not ( = ?auto_310317 ?auto_310315 ) ) ( CALIBRATION_TARGET ?auto_310323 ?auto_310326 ) ( POINTING ?auto_310324 ?auto_310320 ) ( not ( = ?auto_310326 ?auto_310320 ) ) ( ON_BOARD ?auto_310325 ?auto_310324 ) ( POWER_ON ?auto_310325 ) ( not ( = ?auto_310323 ?auto_310325 ) ) ( HAVE_IMAGE ?auto_310320 ?auto_310319 ) ( HAVE_IMAGE ?auto_310321 ?auto_310322 ) ( not ( = ?auto_310317 ?auto_310319 ) ) ( not ( = ?auto_310317 ?auto_310322 ) ) ( not ( = ?auto_310315 ?auto_310319 ) ) ( not ( = ?auto_310315 ?auto_310322 ) ) ( not ( = ?auto_310319 ?auto_310322 ) ) ( not ( = ?auto_310321 ?auto_310326 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_310316 ?auto_310317 ?auto_310318 ?auto_310315 )
      ( GET-4IMAGE-VERIFY ?auto_310316 ?auto_310317 ?auto_310318 ?auto_310315 ?auto_310320 ?auto_310319 ?auto_310321 ?auto_310322 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310892 - DIRECTION
      ?auto_310893 - MODE
      ?auto_310894 - DIRECTION
      ?auto_310891 - MODE
      ?auto_310896 - DIRECTION
      ?auto_310895 - MODE
      ?auto_310897 - DIRECTION
      ?auto_310898 - MODE
    )
    :vars
    (
      ?auto_310899 - INSTRUMENT
      ?auto_310900 - SATELLITE
      ?auto_310902 - DIRECTION
      ?auto_310901 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_310894 ?auto_310892 ) ) ( not ( = ?auto_310896 ?auto_310892 ) ) ( not ( = ?auto_310896 ?auto_310894 ) ) ( not ( = ?auto_310897 ?auto_310892 ) ) ( not ( = ?auto_310897 ?auto_310894 ) ) ( not ( = ?auto_310897 ?auto_310896 ) ) ( ON_BOARD ?auto_310899 ?auto_310900 ) ( SUPPORTS ?auto_310899 ?auto_310898 ) ( not ( = ?auto_310897 ?auto_310902 ) ) ( HAVE_IMAGE ?auto_310894 ?auto_310891 ) ( not ( = ?auto_310894 ?auto_310902 ) ) ( not ( = ?auto_310891 ?auto_310898 ) ) ( CALIBRATION_TARGET ?auto_310899 ?auto_310902 ) ( POINTING ?auto_310900 ?auto_310892 ) ( not ( = ?auto_310902 ?auto_310892 ) ) ( ON_BOARD ?auto_310901 ?auto_310900 ) ( POWER_ON ?auto_310901 ) ( not ( = ?auto_310899 ?auto_310901 ) ) ( HAVE_IMAGE ?auto_310892 ?auto_310893 ) ( HAVE_IMAGE ?auto_310896 ?auto_310895 ) ( not ( = ?auto_310893 ?auto_310891 ) ) ( not ( = ?auto_310893 ?auto_310895 ) ) ( not ( = ?auto_310893 ?auto_310898 ) ) ( not ( = ?auto_310891 ?auto_310895 ) ) ( not ( = ?auto_310896 ?auto_310902 ) ) ( not ( = ?auto_310895 ?auto_310898 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_310894 ?auto_310891 ?auto_310897 ?auto_310898 )
      ( GET-4IMAGE-VERIFY ?auto_310892 ?auto_310893 ?auto_310894 ?auto_310891 ?auto_310896 ?auto_310895 ?auto_310897 ?auto_310898 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310928 - DIRECTION
      ?auto_310929 - MODE
      ?auto_310930 - DIRECTION
      ?auto_310927 - MODE
      ?auto_310932 - DIRECTION
      ?auto_310931 - MODE
      ?auto_310933 - DIRECTION
      ?auto_310934 - MODE
    )
    :vars
    (
      ?auto_310935 - INSTRUMENT
      ?auto_310936 - SATELLITE
      ?auto_310938 - DIRECTION
      ?auto_310937 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_310930 ?auto_310928 ) ) ( not ( = ?auto_310932 ?auto_310928 ) ) ( not ( = ?auto_310932 ?auto_310930 ) ) ( not ( = ?auto_310933 ?auto_310928 ) ) ( not ( = ?auto_310933 ?auto_310930 ) ) ( not ( = ?auto_310933 ?auto_310932 ) ) ( ON_BOARD ?auto_310935 ?auto_310936 ) ( SUPPORTS ?auto_310935 ?auto_310931 ) ( not ( = ?auto_310932 ?auto_310938 ) ) ( HAVE_IMAGE ?auto_310930 ?auto_310927 ) ( not ( = ?auto_310930 ?auto_310938 ) ) ( not ( = ?auto_310927 ?auto_310931 ) ) ( CALIBRATION_TARGET ?auto_310935 ?auto_310938 ) ( POINTING ?auto_310936 ?auto_310928 ) ( not ( = ?auto_310938 ?auto_310928 ) ) ( ON_BOARD ?auto_310937 ?auto_310936 ) ( POWER_ON ?auto_310937 ) ( not ( = ?auto_310935 ?auto_310937 ) ) ( HAVE_IMAGE ?auto_310928 ?auto_310929 ) ( HAVE_IMAGE ?auto_310933 ?auto_310934 ) ( not ( = ?auto_310929 ?auto_310927 ) ) ( not ( = ?auto_310929 ?auto_310931 ) ) ( not ( = ?auto_310929 ?auto_310934 ) ) ( not ( = ?auto_310927 ?auto_310934 ) ) ( not ( = ?auto_310931 ?auto_310934 ) ) ( not ( = ?auto_310933 ?auto_310938 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_310930 ?auto_310927 ?auto_310932 ?auto_310931 )
      ( GET-4IMAGE-VERIFY ?auto_310928 ?auto_310929 ?auto_310930 ?auto_310927 ?auto_310932 ?auto_310931 ?auto_310933 ?auto_310934 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_311156 - DIRECTION
      ?auto_311157 - MODE
      ?auto_311158 - DIRECTION
      ?auto_311155 - MODE
      ?auto_311160 - DIRECTION
      ?auto_311159 - MODE
      ?auto_311161 - DIRECTION
      ?auto_311162 - MODE
    )
    :vars
    (
      ?auto_311163 - INSTRUMENT
      ?auto_311164 - SATELLITE
      ?auto_311166 - DIRECTION
      ?auto_311165 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_311158 ?auto_311156 ) ) ( not ( = ?auto_311160 ?auto_311156 ) ) ( not ( = ?auto_311160 ?auto_311158 ) ) ( not ( = ?auto_311161 ?auto_311156 ) ) ( not ( = ?auto_311161 ?auto_311158 ) ) ( not ( = ?auto_311161 ?auto_311160 ) ) ( ON_BOARD ?auto_311163 ?auto_311164 ) ( SUPPORTS ?auto_311163 ?auto_311155 ) ( not ( = ?auto_311158 ?auto_311166 ) ) ( HAVE_IMAGE ?auto_311160 ?auto_311159 ) ( not ( = ?auto_311160 ?auto_311166 ) ) ( not ( = ?auto_311159 ?auto_311155 ) ) ( CALIBRATION_TARGET ?auto_311163 ?auto_311166 ) ( POINTING ?auto_311164 ?auto_311156 ) ( not ( = ?auto_311166 ?auto_311156 ) ) ( ON_BOARD ?auto_311165 ?auto_311164 ) ( POWER_ON ?auto_311165 ) ( not ( = ?auto_311163 ?auto_311165 ) ) ( HAVE_IMAGE ?auto_311156 ?auto_311157 ) ( HAVE_IMAGE ?auto_311161 ?auto_311162 ) ( not ( = ?auto_311157 ?auto_311155 ) ) ( not ( = ?auto_311157 ?auto_311159 ) ) ( not ( = ?auto_311157 ?auto_311162 ) ) ( not ( = ?auto_311155 ?auto_311162 ) ) ( not ( = ?auto_311159 ?auto_311162 ) ) ( not ( = ?auto_311161 ?auto_311166 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_311160 ?auto_311159 ?auto_311158 ?auto_311155 )
      ( GET-4IMAGE-VERIFY ?auto_311156 ?auto_311157 ?auto_311158 ?auto_311155 ?auto_311160 ?auto_311159 ?auto_311161 ?auto_311162 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_311427 - DIRECTION
      ?auto_311428 - MODE
      ?auto_311429 - DIRECTION
      ?auto_311426 - MODE
      ?auto_311431 - DIRECTION
      ?auto_311430 - MODE
      ?auto_311432 - DIRECTION
      ?auto_311433 - MODE
    )
    :vars
    (
      ?auto_311434 - INSTRUMENT
      ?auto_311435 - SATELLITE
      ?auto_311437 - DIRECTION
      ?auto_311436 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_311429 ?auto_311427 ) ) ( not ( = ?auto_311431 ?auto_311427 ) ) ( not ( = ?auto_311431 ?auto_311429 ) ) ( not ( = ?auto_311432 ?auto_311427 ) ) ( not ( = ?auto_311432 ?auto_311429 ) ) ( not ( = ?auto_311432 ?auto_311431 ) ) ( ON_BOARD ?auto_311434 ?auto_311435 ) ( SUPPORTS ?auto_311434 ?auto_311428 ) ( not ( = ?auto_311427 ?auto_311437 ) ) ( HAVE_IMAGE ?auto_311429 ?auto_311426 ) ( not ( = ?auto_311429 ?auto_311437 ) ) ( not ( = ?auto_311426 ?auto_311428 ) ) ( CALIBRATION_TARGET ?auto_311434 ?auto_311437 ) ( POINTING ?auto_311435 ?auto_311432 ) ( not ( = ?auto_311437 ?auto_311432 ) ) ( ON_BOARD ?auto_311436 ?auto_311435 ) ( POWER_ON ?auto_311436 ) ( not ( = ?auto_311434 ?auto_311436 ) ) ( HAVE_IMAGE ?auto_311431 ?auto_311430 ) ( HAVE_IMAGE ?auto_311432 ?auto_311433 ) ( not ( = ?auto_311428 ?auto_311430 ) ) ( not ( = ?auto_311428 ?auto_311433 ) ) ( not ( = ?auto_311426 ?auto_311430 ) ) ( not ( = ?auto_311426 ?auto_311433 ) ) ( not ( = ?auto_311431 ?auto_311437 ) ) ( not ( = ?auto_311430 ?auto_311433 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_311429 ?auto_311426 ?auto_311427 ?auto_311428 )
      ( GET-4IMAGE-VERIFY ?auto_311427 ?auto_311428 ?auto_311429 ?auto_311426 ?auto_311431 ?auto_311430 ?auto_311432 ?auto_311433 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_311464 - DIRECTION
      ?auto_311465 - MODE
      ?auto_311466 - DIRECTION
      ?auto_311463 - MODE
      ?auto_311468 - DIRECTION
      ?auto_311467 - MODE
      ?auto_311469 - DIRECTION
      ?auto_311470 - MODE
    )
    :vars
    (
      ?auto_311471 - INSTRUMENT
      ?auto_311472 - SATELLITE
      ?auto_311474 - DIRECTION
      ?auto_311473 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_311466 ?auto_311464 ) ) ( not ( = ?auto_311468 ?auto_311464 ) ) ( not ( = ?auto_311468 ?auto_311466 ) ) ( not ( = ?auto_311469 ?auto_311464 ) ) ( not ( = ?auto_311469 ?auto_311466 ) ) ( not ( = ?auto_311469 ?auto_311468 ) ) ( ON_BOARD ?auto_311471 ?auto_311472 ) ( SUPPORTS ?auto_311471 ?auto_311465 ) ( not ( = ?auto_311464 ?auto_311474 ) ) ( HAVE_IMAGE ?auto_311466 ?auto_311463 ) ( not ( = ?auto_311466 ?auto_311474 ) ) ( not ( = ?auto_311463 ?auto_311465 ) ) ( CALIBRATION_TARGET ?auto_311471 ?auto_311474 ) ( POINTING ?auto_311472 ?auto_311468 ) ( not ( = ?auto_311474 ?auto_311468 ) ) ( ON_BOARD ?auto_311473 ?auto_311472 ) ( POWER_ON ?auto_311473 ) ( not ( = ?auto_311471 ?auto_311473 ) ) ( HAVE_IMAGE ?auto_311468 ?auto_311467 ) ( HAVE_IMAGE ?auto_311469 ?auto_311470 ) ( not ( = ?auto_311465 ?auto_311467 ) ) ( not ( = ?auto_311465 ?auto_311470 ) ) ( not ( = ?auto_311463 ?auto_311467 ) ) ( not ( = ?auto_311463 ?auto_311470 ) ) ( not ( = ?auto_311467 ?auto_311470 ) ) ( not ( = ?auto_311469 ?auto_311474 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_311466 ?auto_311463 ?auto_311464 ?auto_311465 )
      ( GET-4IMAGE-VERIFY ?auto_311464 ?auto_311465 ?auto_311466 ?auto_311463 ?auto_311468 ?auto_311467 ?auto_311469 ?auto_311470 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_311774 - DIRECTION
      ?auto_311775 - MODE
      ?auto_311776 - DIRECTION
      ?auto_311773 - MODE
      ?auto_311778 - DIRECTION
      ?auto_311777 - MODE
      ?auto_311779 - DIRECTION
      ?auto_311780 - MODE
    )
    :vars
    (
      ?auto_311781 - INSTRUMENT
      ?auto_311782 - SATELLITE
      ?auto_311784 - DIRECTION
      ?auto_311783 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_311776 ?auto_311774 ) ) ( not ( = ?auto_311778 ?auto_311774 ) ) ( not ( = ?auto_311778 ?auto_311776 ) ) ( not ( = ?auto_311779 ?auto_311774 ) ) ( not ( = ?auto_311779 ?auto_311776 ) ) ( not ( = ?auto_311779 ?auto_311778 ) ) ( ON_BOARD ?auto_311781 ?auto_311782 ) ( SUPPORTS ?auto_311781 ?auto_311775 ) ( not ( = ?auto_311774 ?auto_311784 ) ) ( HAVE_IMAGE ?auto_311778 ?auto_311777 ) ( not ( = ?auto_311778 ?auto_311784 ) ) ( not ( = ?auto_311777 ?auto_311775 ) ) ( CALIBRATION_TARGET ?auto_311781 ?auto_311784 ) ( POINTING ?auto_311782 ?auto_311776 ) ( not ( = ?auto_311784 ?auto_311776 ) ) ( ON_BOARD ?auto_311783 ?auto_311782 ) ( POWER_ON ?auto_311783 ) ( not ( = ?auto_311781 ?auto_311783 ) ) ( HAVE_IMAGE ?auto_311776 ?auto_311773 ) ( HAVE_IMAGE ?auto_311779 ?auto_311780 ) ( not ( = ?auto_311775 ?auto_311773 ) ) ( not ( = ?auto_311775 ?auto_311780 ) ) ( not ( = ?auto_311773 ?auto_311777 ) ) ( not ( = ?auto_311773 ?auto_311780 ) ) ( not ( = ?auto_311777 ?auto_311780 ) ) ( not ( = ?auto_311779 ?auto_311784 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_311778 ?auto_311777 ?auto_311774 ?auto_311775 )
      ( GET-4IMAGE-VERIFY ?auto_311774 ?auto_311775 ?auto_311776 ?auto_311773 ?auto_311778 ?auto_311777 ?auto_311779 ?auto_311780 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_317778 - DIRECTION
      ?auto_317779 - MODE
      ?auto_317780 - DIRECTION
      ?auto_317777 - MODE
      ?auto_317782 - DIRECTION
      ?auto_317781 - MODE
    )
    :vars
    (
      ?auto_317784 - INSTRUMENT
      ?auto_317786 - SATELLITE
      ?auto_317785 - DIRECTION
      ?auto_317783 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_317780 ?auto_317778 ) ) ( not ( = ?auto_317782 ?auto_317778 ) ) ( not ( = ?auto_317782 ?auto_317780 ) ) ( ON_BOARD ?auto_317784 ?auto_317786 ) ( SUPPORTS ?auto_317784 ?auto_317781 ) ( not ( = ?auto_317782 ?auto_317785 ) ) ( HAVE_IMAGE ?auto_317778 ?auto_317779 ) ( not ( = ?auto_317778 ?auto_317785 ) ) ( not ( = ?auto_317779 ?auto_317781 ) ) ( CALIBRATION_TARGET ?auto_317784 ?auto_317785 ) ( not ( = ?auto_317785 ?auto_317780 ) ) ( ON_BOARD ?auto_317783 ?auto_317786 ) ( POWER_ON ?auto_317783 ) ( not ( = ?auto_317784 ?auto_317783 ) ) ( POINTING ?auto_317786 ?auto_317785 ) ( HAVE_IMAGE ?auto_317780 ?auto_317777 ) ( not ( = ?auto_317779 ?auto_317777 ) ) ( not ( = ?auto_317777 ?auto_317781 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_317778 ?auto_317779 ?auto_317782 ?auto_317781 )
      ( GET-3IMAGE-VERIFY ?auto_317778 ?auto_317779 ?auto_317780 ?auto_317777 ?auto_317782 ?auto_317781 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_317810 - DIRECTION
      ?auto_317811 - MODE
      ?auto_317812 - DIRECTION
      ?auto_317809 - MODE
      ?auto_317814 - DIRECTION
      ?auto_317813 - MODE
    )
    :vars
    (
      ?auto_317816 - INSTRUMENT
      ?auto_317818 - SATELLITE
      ?auto_317817 - DIRECTION
      ?auto_317815 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_317812 ?auto_317810 ) ) ( not ( = ?auto_317814 ?auto_317810 ) ) ( not ( = ?auto_317814 ?auto_317812 ) ) ( ON_BOARD ?auto_317816 ?auto_317818 ) ( SUPPORTS ?auto_317816 ?auto_317809 ) ( not ( = ?auto_317812 ?auto_317817 ) ) ( HAVE_IMAGE ?auto_317810 ?auto_317811 ) ( not ( = ?auto_317810 ?auto_317817 ) ) ( not ( = ?auto_317811 ?auto_317809 ) ) ( CALIBRATION_TARGET ?auto_317816 ?auto_317817 ) ( not ( = ?auto_317817 ?auto_317814 ) ) ( ON_BOARD ?auto_317815 ?auto_317818 ) ( POWER_ON ?auto_317815 ) ( not ( = ?auto_317816 ?auto_317815 ) ) ( POINTING ?auto_317818 ?auto_317817 ) ( HAVE_IMAGE ?auto_317814 ?auto_317813 ) ( not ( = ?auto_317811 ?auto_317813 ) ) ( not ( = ?auto_317809 ?auto_317813 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_317810 ?auto_317811 ?auto_317812 ?auto_317809 )
      ( GET-3IMAGE-VERIFY ?auto_317810 ?auto_317811 ?auto_317812 ?auto_317809 ?auto_317814 ?auto_317813 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_315069 - DIRECTION
      ?auto_315070 - MODE
      ?auto_315071 - DIRECTION
      ?auto_315068 - MODE
      ?auto_315073 - DIRECTION
      ?auto_315072 - MODE
    )
    :vars
    (
      ?auto_315078 - INSTRUMENT
      ?auto_315075 - SATELLITE
      ?auto_315077 - DIRECTION
      ?auto_315076 - DIRECTION
      ?auto_315074 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_315071 ?auto_315069 ) ) ( not ( = ?auto_315073 ?auto_315069 ) ) ( not ( = ?auto_315073 ?auto_315071 ) ) ( ON_BOARD ?auto_315078 ?auto_315075 ) ( SUPPORTS ?auto_315078 ?auto_315072 ) ( not ( = ?auto_315073 ?auto_315077 ) ) ( HAVE_IMAGE ?auto_315071 ?auto_315068 ) ( not ( = ?auto_315071 ?auto_315077 ) ) ( not ( = ?auto_315068 ?auto_315072 ) ) ( CALIBRATION_TARGET ?auto_315078 ?auto_315077 ) ( not ( = ?auto_315077 ?auto_315076 ) ) ( not ( = ?auto_315073 ?auto_315076 ) ) ( not ( = ?auto_315071 ?auto_315076 ) ) ( ON_BOARD ?auto_315074 ?auto_315075 ) ( POWER_ON ?auto_315074 ) ( not ( = ?auto_315078 ?auto_315074 ) ) ( POINTING ?auto_315075 ?auto_315077 ) ( HAVE_IMAGE ?auto_315069 ?auto_315070 ) ( not ( = ?auto_315069 ?auto_315077 ) ) ( not ( = ?auto_315069 ?auto_315076 ) ) ( not ( = ?auto_315070 ?auto_315068 ) ) ( not ( = ?auto_315070 ?auto_315072 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_315071 ?auto_315068 ?auto_315073 ?auto_315072 )
      ( GET-3IMAGE-VERIFY ?auto_315069 ?auto_315070 ?auto_315071 ?auto_315068 ?auto_315073 ?auto_315072 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_315105 - DIRECTION
      ?auto_315106 - MODE
      ?auto_315107 - DIRECTION
      ?auto_315104 - MODE
      ?auto_315109 - DIRECTION
      ?auto_315108 - MODE
    )
    :vars
    (
      ?auto_315114 - INSTRUMENT
      ?auto_315111 - SATELLITE
      ?auto_315113 - DIRECTION
      ?auto_315112 - DIRECTION
      ?auto_315110 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_315107 ?auto_315105 ) ) ( not ( = ?auto_315109 ?auto_315105 ) ) ( not ( = ?auto_315109 ?auto_315107 ) ) ( ON_BOARD ?auto_315114 ?auto_315111 ) ( SUPPORTS ?auto_315114 ?auto_315104 ) ( not ( = ?auto_315107 ?auto_315113 ) ) ( HAVE_IMAGE ?auto_315109 ?auto_315108 ) ( not ( = ?auto_315109 ?auto_315113 ) ) ( not ( = ?auto_315108 ?auto_315104 ) ) ( CALIBRATION_TARGET ?auto_315114 ?auto_315113 ) ( not ( = ?auto_315113 ?auto_315112 ) ) ( not ( = ?auto_315107 ?auto_315112 ) ) ( not ( = ?auto_315109 ?auto_315112 ) ) ( ON_BOARD ?auto_315110 ?auto_315111 ) ( POWER_ON ?auto_315110 ) ( not ( = ?auto_315114 ?auto_315110 ) ) ( POINTING ?auto_315111 ?auto_315113 ) ( HAVE_IMAGE ?auto_315105 ?auto_315106 ) ( not ( = ?auto_315105 ?auto_315113 ) ) ( not ( = ?auto_315105 ?auto_315112 ) ) ( not ( = ?auto_315106 ?auto_315104 ) ) ( not ( = ?auto_315106 ?auto_315108 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_315109 ?auto_315108 ?auto_315107 ?auto_315104 )
      ( GET-3IMAGE-VERIFY ?auto_315105 ?auto_315106 ?auto_315107 ?auto_315104 ?auto_315109 ?auto_315108 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_318010 - DIRECTION
      ?auto_318011 - MODE
      ?auto_318012 - DIRECTION
      ?auto_318009 - MODE
      ?auto_318014 - DIRECTION
      ?auto_318013 - MODE
    )
    :vars
    (
      ?auto_318016 - INSTRUMENT
      ?auto_318018 - SATELLITE
      ?auto_318017 - DIRECTION
      ?auto_318015 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_318012 ?auto_318010 ) ) ( not ( = ?auto_318014 ?auto_318010 ) ) ( not ( = ?auto_318014 ?auto_318012 ) ) ( ON_BOARD ?auto_318016 ?auto_318018 ) ( SUPPORTS ?auto_318016 ?auto_318011 ) ( not ( = ?auto_318010 ?auto_318017 ) ) ( HAVE_IMAGE ?auto_318012 ?auto_318009 ) ( not ( = ?auto_318012 ?auto_318017 ) ) ( not ( = ?auto_318009 ?auto_318011 ) ) ( CALIBRATION_TARGET ?auto_318016 ?auto_318017 ) ( not ( = ?auto_318017 ?auto_318014 ) ) ( ON_BOARD ?auto_318015 ?auto_318018 ) ( POWER_ON ?auto_318015 ) ( not ( = ?auto_318016 ?auto_318015 ) ) ( POINTING ?auto_318018 ?auto_318017 ) ( HAVE_IMAGE ?auto_318014 ?auto_318013 ) ( not ( = ?auto_318011 ?auto_318013 ) ) ( not ( = ?auto_318009 ?auto_318013 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_318012 ?auto_318009 ?auto_318010 ?auto_318011 )
      ( GET-3IMAGE-VERIFY ?auto_318010 ?auto_318011 ?auto_318012 ?auto_318009 ?auto_318014 ?auto_318013 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_315277 - DIRECTION
      ?auto_315278 - MODE
      ?auto_315279 - DIRECTION
      ?auto_315276 - MODE
      ?auto_315281 - DIRECTION
      ?auto_315280 - MODE
    )
    :vars
    (
      ?auto_315286 - INSTRUMENT
      ?auto_315283 - SATELLITE
      ?auto_315285 - DIRECTION
      ?auto_315284 - DIRECTION
      ?auto_315282 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_315279 ?auto_315277 ) ) ( not ( = ?auto_315281 ?auto_315277 ) ) ( not ( = ?auto_315281 ?auto_315279 ) ) ( ON_BOARD ?auto_315286 ?auto_315283 ) ( SUPPORTS ?auto_315286 ?auto_315278 ) ( not ( = ?auto_315277 ?auto_315285 ) ) ( HAVE_IMAGE ?auto_315281 ?auto_315280 ) ( not ( = ?auto_315281 ?auto_315285 ) ) ( not ( = ?auto_315280 ?auto_315278 ) ) ( CALIBRATION_TARGET ?auto_315286 ?auto_315285 ) ( not ( = ?auto_315285 ?auto_315284 ) ) ( not ( = ?auto_315277 ?auto_315284 ) ) ( not ( = ?auto_315281 ?auto_315284 ) ) ( ON_BOARD ?auto_315282 ?auto_315283 ) ( POWER_ON ?auto_315282 ) ( not ( = ?auto_315286 ?auto_315282 ) ) ( POINTING ?auto_315283 ?auto_315285 ) ( HAVE_IMAGE ?auto_315279 ?auto_315276 ) ( not ( = ?auto_315278 ?auto_315276 ) ) ( not ( = ?auto_315279 ?auto_315285 ) ) ( not ( = ?auto_315279 ?auto_315284 ) ) ( not ( = ?auto_315276 ?auto_315280 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_315281 ?auto_315280 ?auto_315277 ?auto_315278 )
      ( GET-3IMAGE-VERIFY ?auto_315277 ?auto_315278 ?auto_315279 ?auto_315276 ?auto_315281 ?auto_315280 ) )
  )

)

