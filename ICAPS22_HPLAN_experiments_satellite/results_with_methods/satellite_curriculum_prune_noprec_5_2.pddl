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
      ?auto_163238 - DIRECTION
      ?auto_163239 - MODE
    )
    :vars
    (
      ?auto_163240 - INSTRUMENT
      ?auto_163241 - SATELLITE
      ?auto_163242 - DIRECTION
      ?auto_163243 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_163240 ?auto_163241 ) ( SUPPORTS ?auto_163240 ?auto_163239 ) ( not ( = ?auto_163238 ?auto_163242 ) ) ( CALIBRATION_TARGET ?auto_163240 ?auto_163242 ) ( POWER_AVAIL ?auto_163241 ) ( POINTING ?auto_163241 ?auto_163243 ) ( not ( = ?auto_163242 ?auto_163243 ) ) ( not ( = ?auto_163238 ?auto_163243 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_163241 ?auto_163242 ?auto_163243 )
      ( !SWITCH_ON ?auto_163240 ?auto_163241 )
      ( !CALIBRATE ?auto_163241 ?auto_163240 ?auto_163242 )
      ( !TURN_TO ?auto_163241 ?auto_163238 ?auto_163242 )
      ( !TAKE_IMAGE ?auto_163241 ?auto_163238 ?auto_163240 ?auto_163239 )
      ( GET-1IMAGE-VERIFY ?auto_163238 ?auto_163239 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_163246 - DIRECTION
      ?auto_163247 - MODE
    )
    :vars
    (
      ?auto_163248 - INSTRUMENT
      ?auto_163249 - SATELLITE
      ?auto_163250 - DIRECTION
      ?auto_163251 - DIRECTION
      ?auto_163252 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_163248 ?auto_163249 ) ( SUPPORTS ?auto_163248 ?auto_163247 ) ( not ( = ?auto_163246 ?auto_163250 ) ) ( CALIBRATION_TARGET ?auto_163248 ?auto_163250 ) ( POINTING ?auto_163249 ?auto_163251 ) ( not ( = ?auto_163250 ?auto_163251 ) ) ( ON_BOARD ?auto_163252 ?auto_163249 ) ( POWER_ON ?auto_163252 ) ( not ( = ?auto_163246 ?auto_163251 ) ) ( not ( = ?auto_163248 ?auto_163252 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_163252 ?auto_163249 )
      ( !TURN_TO ?auto_163249 ?auto_163250 ?auto_163251 )
      ( !SWITCH_ON ?auto_163248 ?auto_163249 )
      ( !CALIBRATE ?auto_163249 ?auto_163248 ?auto_163250 )
      ( !TURN_TO ?auto_163249 ?auto_163246 ?auto_163250 )
      ( !TAKE_IMAGE ?auto_163249 ?auto_163246 ?auto_163248 ?auto_163247 )
      ( GET-1IMAGE-VERIFY ?auto_163246 ?auto_163247 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_163265 - DIRECTION
      ?auto_163266 - MODE
      ?auto_163268 - DIRECTION
      ?auto_163267 - MODE
    )
    :vars
    (
      ?auto_163271 - INSTRUMENT
      ?auto_163272 - SATELLITE
      ?auto_163270 - DIRECTION
      ?auto_163269 - INSTRUMENT
      ?auto_163273 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_163271 ?auto_163272 ) ( SUPPORTS ?auto_163271 ?auto_163267 ) ( not ( = ?auto_163268 ?auto_163270 ) ) ( CALIBRATION_TARGET ?auto_163271 ?auto_163270 ) ( not ( = ?auto_163270 ?auto_163265 ) ) ( ON_BOARD ?auto_163269 ?auto_163272 ) ( not ( = ?auto_163268 ?auto_163265 ) ) ( not ( = ?auto_163271 ?auto_163269 ) ) ( SUPPORTS ?auto_163269 ?auto_163266 ) ( CALIBRATION_TARGET ?auto_163269 ?auto_163270 ) ( POWER_AVAIL ?auto_163272 ) ( POINTING ?auto_163272 ?auto_163273 ) ( not ( = ?auto_163270 ?auto_163273 ) ) ( not ( = ?auto_163265 ?auto_163273 ) ) ( not ( = ?auto_163266 ?auto_163267 ) ) ( not ( = ?auto_163268 ?auto_163273 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_163265 ?auto_163266 )
      ( GET-1IMAGE ?auto_163268 ?auto_163267 )
      ( GET-2IMAGE-VERIFY ?auto_163265 ?auto_163266 ?auto_163268 ?auto_163267 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_163426 - DIRECTION
      ?auto_163427 - MODE
      ?auto_163429 - DIRECTION
      ?auto_163428 - MODE
      ?auto_163430 - DIRECTION
      ?auto_163431 - MODE
    )
    :vars
    (
      ?auto_163433 - INSTRUMENT
      ?auto_163435 - SATELLITE
      ?auto_163434 - DIRECTION
      ?auto_163432 - INSTRUMENT
      ?auto_163436 - INSTRUMENT
      ?auto_163437 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_163433 ?auto_163435 ) ( SUPPORTS ?auto_163433 ?auto_163431 ) ( not ( = ?auto_163430 ?auto_163434 ) ) ( CALIBRATION_TARGET ?auto_163433 ?auto_163434 ) ( not ( = ?auto_163434 ?auto_163429 ) ) ( ON_BOARD ?auto_163432 ?auto_163435 ) ( not ( = ?auto_163430 ?auto_163429 ) ) ( not ( = ?auto_163433 ?auto_163432 ) ) ( SUPPORTS ?auto_163432 ?auto_163428 ) ( CALIBRATION_TARGET ?auto_163432 ?auto_163434 ) ( not ( = ?auto_163434 ?auto_163426 ) ) ( ON_BOARD ?auto_163436 ?auto_163435 ) ( not ( = ?auto_163429 ?auto_163426 ) ) ( not ( = ?auto_163432 ?auto_163436 ) ) ( SUPPORTS ?auto_163436 ?auto_163427 ) ( CALIBRATION_TARGET ?auto_163436 ?auto_163434 ) ( POWER_AVAIL ?auto_163435 ) ( POINTING ?auto_163435 ?auto_163437 ) ( not ( = ?auto_163434 ?auto_163437 ) ) ( not ( = ?auto_163426 ?auto_163437 ) ) ( not ( = ?auto_163427 ?auto_163428 ) ) ( not ( = ?auto_163429 ?auto_163437 ) ) ( not ( = ?auto_163426 ?auto_163430 ) ) ( not ( = ?auto_163427 ?auto_163431 ) ) ( not ( = ?auto_163428 ?auto_163431 ) ) ( not ( = ?auto_163430 ?auto_163437 ) ) ( not ( = ?auto_163433 ?auto_163436 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_163426 ?auto_163427 ?auto_163429 ?auto_163428 )
      ( GET-1IMAGE ?auto_163430 ?auto_163431 )
      ( GET-3IMAGE-VERIFY ?auto_163426 ?auto_163427 ?auto_163429 ?auto_163428 ?auto_163430 ?auto_163431 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_165206 - DIRECTION
      ?auto_165207 - MODE
      ?auto_165209 - DIRECTION
      ?auto_165208 - MODE
      ?auto_165210 - DIRECTION
      ?auto_165211 - MODE
      ?auto_165212 - DIRECTION
      ?auto_165213 - MODE
    )
    :vars
    (
      ?auto_165216 - INSTRUMENT
      ?auto_165217 - SATELLITE
      ?auto_165214 - DIRECTION
      ?auto_165215 - INSTRUMENT
      ?auto_165218 - INSTRUMENT
      ?auto_165220 - INSTRUMENT
      ?auto_165219 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_165216 ?auto_165217 ) ( SUPPORTS ?auto_165216 ?auto_165213 ) ( not ( = ?auto_165212 ?auto_165214 ) ) ( CALIBRATION_TARGET ?auto_165216 ?auto_165214 ) ( not ( = ?auto_165214 ?auto_165210 ) ) ( ON_BOARD ?auto_165215 ?auto_165217 ) ( not ( = ?auto_165212 ?auto_165210 ) ) ( not ( = ?auto_165216 ?auto_165215 ) ) ( SUPPORTS ?auto_165215 ?auto_165211 ) ( CALIBRATION_TARGET ?auto_165215 ?auto_165214 ) ( not ( = ?auto_165214 ?auto_165209 ) ) ( ON_BOARD ?auto_165218 ?auto_165217 ) ( not ( = ?auto_165210 ?auto_165209 ) ) ( not ( = ?auto_165215 ?auto_165218 ) ) ( SUPPORTS ?auto_165218 ?auto_165208 ) ( CALIBRATION_TARGET ?auto_165218 ?auto_165214 ) ( not ( = ?auto_165214 ?auto_165206 ) ) ( ON_BOARD ?auto_165220 ?auto_165217 ) ( not ( = ?auto_165209 ?auto_165206 ) ) ( not ( = ?auto_165218 ?auto_165220 ) ) ( SUPPORTS ?auto_165220 ?auto_165207 ) ( CALIBRATION_TARGET ?auto_165220 ?auto_165214 ) ( POWER_AVAIL ?auto_165217 ) ( POINTING ?auto_165217 ?auto_165219 ) ( not ( = ?auto_165214 ?auto_165219 ) ) ( not ( = ?auto_165206 ?auto_165219 ) ) ( not ( = ?auto_165207 ?auto_165208 ) ) ( not ( = ?auto_165209 ?auto_165219 ) ) ( not ( = ?auto_165206 ?auto_165210 ) ) ( not ( = ?auto_165207 ?auto_165211 ) ) ( not ( = ?auto_165208 ?auto_165211 ) ) ( not ( = ?auto_165210 ?auto_165219 ) ) ( not ( = ?auto_165215 ?auto_165220 ) ) ( not ( = ?auto_165206 ?auto_165212 ) ) ( not ( = ?auto_165207 ?auto_165213 ) ) ( not ( = ?auto_165209 ?auto_165212 ) ) ( not ( = ?auto_165208 ?auto_165213 ) ) ( not ( = ?auto_165211 ?auto_165213 ) ) ( not ( = ?auto_165212 ?auto_165219 ) ) ( not ( = ?auto_165216 ?auto_165218 ) ) ( not ( = ?auto_165216 ?auto_165220 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_165206 ?auto_165207 ?auto_165209 ?auto_165208 ?auto_165210 ?auto_165211 )
      ( GET-1IMAGE ?auto_165212 ?auto_165213 )
      ( GET-4IMAGE-VERIFY ?auto_165206 ?auto_165207 ?auto_165209 ?auto_165208 ?auto_165210 ?auto_165211 ?auto_165212 ?auto_165213 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_190680 - DIRECTION
      ?auto_190681 - MODE
      ?auto_190683 - DIRECTION
      ?auto_190682 - MODE
      ?auto_190684 - DIRECTION
      ?auto_190685 - MODE
      ?auto_190686 - DIRECTION
      ?auto_190687 - MODE
      ?auto_190688 - DIRECTION
      ?auto_190689 - MODE
    )
    :vars
    (
      ?auto_190692 - INSTRUMENT
      ?auto_190693 - SATELLITE
      ?auto_190691 - DIRECTION
      ?auto_190690 - INSTRUMENT
      ?auto_190697 - INSTRUMENT
      ?auto_190696 - INSTRUMENT
      ?auto_190694 - INSTRUMENT
      ?auto_190695 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_190692 ?auto_190693 ) ( SUPPORTS ?auto_190692 ?auto_190689 ) ( not ( = ?auto_190688 ?auto_190691 ) ) ( CALIBRATION_TARGET ?auto_190692 ?auto_190691 ) ( not ( = ?auto_190691 ?auto_190686 ) ) ( ON_BOARD ?auto_190690 ?auto_190693 ) ( not ( = ?auto_190688 ?auto_190686 ) ) ( not ( = ?auto_190692 ?auto_190690 ) ) ( SUPPORTS ?auto_190690 ?auto_190687 ) ( CALIBRATION_TARGET ?auto_190690 ?auto_190691 ) ( not ( = ?auto_190691 ?auto_190684 ) ) ( ON_BOARD ?auto_190697 ?auto_190693 ) ( not ( = ?auto_190686 ?auto_190684 ) ) ( not ( = ?auto_190690 ?auto_190697 ) ) ( SUPPORTS ?auto_190697 ?auto_190685 ) ( CALIBRATION_TARGET ?auto_190697 ?auto_190691 ) ( not ( = ?auto_190691 ?auto_190683 ) ) ( ON_BOARD ?auto_190696 ?auto_190693 ) ( not ( = ?auto_190684 ?auto_190683 ) ) ( not ( = ?auto_190697 ?auto_190696 ) ) ( SUPPORTS ?auto_190696 ?auto_190682 ) ( CALIBRATION_TARGET ?auto_190696 ?auto_190691 ) ( not ( = ?auto_190691 ?auto_190680 ) ) ( ON_BOARD ?auto_190694 ?auto_190693 ) ( not ( = ?auto_190683 ?auto_190680 ) ) ( not ( = ?auto_190696 ?auto_190694 ) ) ( SUPPORTS ?auto_190694 ?auto_190681 ) ( CALIBRATION_TARGET ?auto_190694 ?auto_190691 ) ( POWER_AVAIL ?auto_190693 ) ( POINTING ?auto_190693 ?auto_190695 ) ( not ( = ?auto_190691 ?auto_190695 ) ) ( not ( = ?auto_190680 ?auto_190695 ) ) ( not ( = ?auto_190681 ?auto_190682 ) ) ( not ( = ?auto_190683 ?auto_190695 ) ) ( not ( = ?auto_190680 ?auto_190684 ) ) ( not ( = ?auto_190681 ?auto_190685 ) ) ( not ( = ?auto_190682 ?auto_190685 ) ) ( not ( = ?auto_190684 ?auto_190695 ) ) ( not ( = ?auto_190697 ?auto_190694 ) ) ( not ( = ?auto_190680 ?auto_190686 ) ) ( not ( = ?auto_190681 ?auto_190687 ) ) ( not ( = ?auto_190683 ?auto_190686 ) ) ( not ( = ?auto_190682 ?auto_190687 ) ) ( not ( = ?auto_190685 ?auto_190687 ) ) ( not ( = ?auto_190686 ?auto_190695 ) ) ( not ( = ?auto_190690 ?auto_190696 ) ) ( not ( = ?auto_190690 ?auto_190694 ) ) ( not ( = ?auto_190680 ?auto_190688 ) ) ( not ( = ?auto_190681 ?auto_190689 ) ) ( not ( = ?auto_190683 ?auto_190688 ) ) ( not ( = ?auto_190682 ?auto_190689 ) ) ( not ( = ?auto_190684 ?auto_190688 ) ) ( not ( = ?auto_190685 ?auto_190689 ) ) ( not ( = ?auto_190687 ?auto_190689 ) ) ( not ( = ?auto_190688 ?auto_190695 ) ) ( not ( = ?auto_190692 ?auto_190697 ) ) ( not ( = ?auto_190692 ?auto_190696 ) ) ( not ( = ?auto_190692 ?auto_190694 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_190680 ?auto_190681 ?auto_190683 ?auto_190682 ?auto_190684 ?auto_190685 ?auto_190686 ?auto_190687 )
      ( GET-1IMAGE ?auto_190688 ?auto_190689 )
      ( GET-5IMAGE-VERIFY ?auto_190680 ?auto_190681 ?auto_190683 ?auto_190682 ?auto_190684 ?auto_190685 ?auto_190686 ?auto_190687 ?auto_190688 ?auto_190689 ) )
  )

)

