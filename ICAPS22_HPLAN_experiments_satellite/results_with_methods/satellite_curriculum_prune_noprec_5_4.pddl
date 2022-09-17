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
      ?auto_300834 - DIRECTION
      ?auto_300835 - MODE
    )
    :vars
    (
      ?auto_300836 - INSTRUMENT
      ?auto_300837 - SATELLITE
      ?auto_300838 - DIRECTION
      ?auto_300839 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_300836 ?auto_300837 ) ( SUPPORTS ?auto_300836 ?auto_300835 ) ( not ( = ?auto_300834 ?auto_300838 ) ) ( CALIBRATION_TARGET ?auto_300836 ?auto_300838 ) ( POWER_AVAIL ?auto_300837 ) ( POINTING ?auto_300837 ?auto_300839 ) ( not ( = ?auto_300838 ?auto_300839 ) ) ( not ( = ?auto_300834 ?auto_300839 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_300837 ?auto_300838 ?auto_300839 )
      ( !SWITCH_ON ?auto_300836 ?auto_300837 )
      ( !CALIBRATE ?auto_300837 ?auto_300836 ?auto_300838 )
      ( !TURN_TO ?auto_300837 ?auto_300834 ?auto_300838 )
      ( !TAKE_IMAGE ?auto_300837 ?auto_300834 ?auto_300836 ?auto_300835 )
      ( GET-1IMAGE-VERIFY ?auto_300834 ?auto_300835 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_300842 - DIRECTION
      ?auto_300843 - MODE
    )
    :vars
    (
      ?auto_300844 - INSTRUMENT
      ?auto_300845 - SATELLITE
      ?auto_300846 - DIRECTION
      ?auto_300847 - DIRECTION
      ?auto_300848 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_300844 ?auto_300845 ) ( SUPPORTS ?auto_300844 ?auto_300843 ) ( not ( = ?auto_300842 ?auto_300846 ) ) ( CALIBRATION_TARGET ?auto_300844 ?auto_300846 ) ( POINTING ?auto_300845 ?auto_300847 ) ( not ( = ?auto_300846 ?auto_300847 ) ) ( ON_BOARD ?auto_300848 ?auto_300845 ) ( POWER_ON ?auto_300848 ) ( not ( = ?auto_300842 ?auto_300847 ) ) ( not ( = ?auto_300844 ?auto_300848 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_300848 ?auto_300845 )
      ( !TURN_TO ?auto_300845 ?auto_300846 ?auto_300847 )
      ( !SWITCH_ON ?auto_300844 ?auto_300845 )
      ( !CALIBRATE ?auto_300845 ?auto_300844 ?auto_300846 )
      ( !TURN_TO ?auto_300845 ?auto_300842 ?auto_300846 )
      ( !TAKE_IMAGE ?auto_300845 ?auto_300842 ?auto_300844 ?auto_300843 )
      ( GET-1IMAGE-VERIFY ?auto_300842 ?auto_300843 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_300861 - DIRECTION
      ?auto_300862 - MODE
      ?auto_300864 - DIRECTION
      ?auto_300863 - MODE
    )
    :vars
    (
      ?auto_300868 - INSTRUMENT
      ?auto_300866 - SATELLITE
      ?auto_300865 - DIRECTION
      ?auto_300867 - INSTRUMENT
      ?auto_300869 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_300868 ?auto_300866 ) ( SUPPORTS ?auto_300868 ?auto_300863 ) ( not ( = ?auto_300864 ?auto_300865 ) ) ( CALIBRATION_TARGET ?auto_300868 ?auto_300865 ) ( not ( = ?auto_300865 ?auto_300861 ) ) ( ON_BOARD ?auto_300867 ?auto_300866 ) ( not ( = ?auto_300864 ?auto_300861 ) ) ( not ( = ?auto_300868 ?auto_300867 ) ) ( SUPPORTS ?auto_300867 ?auto_300862 ) ( CALIBRATION_TARGET ?auto_300867 ?auto_300865 ) ( POWER_AVAIL ?auto_300866 ) ( POINTING ?auto_300866 ?auto_300869 ) ( not ( = ?auto_300865 ?auto_300869 ) ) ( not ( = ?auto_300861 ?auto_300869 ) ) ( not ( = ?auto_300862 ?auto_300863 ) ) ( not ( = ?auto_300864 ?auto_300869 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_300861 ?auto_300862 )
      ( GET-1IMAGE ?auto_300864 ?auto_300863 )
      ( GET-2IMAGE-VERIFY ?auto_300861 ?auto_300862 ?auto_300864 ?auto_300863 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_301022 - DIRECTION
      ?auto_301023 - MODE
      ?auto_301025 - DIRECTION
      ?auto_301024 - MODE
      ?auto_301026 - DIRECTION
      ?auto_301027 - MODE
    )
    :vars
    (
      ?auto_301028 - INSTRUMENT
      ?auto_301030 - SATELLITE
      ?auto_301029 - DIRECTION
      ?auto_301031 - INSTRUMENT
      ?auto_301033 - INSTRUMENT
      ?auto_301032 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_301028 ?auto_301030 ) ( SUPPORTS ?auto_301028 ?auto_301027 ) ( not ( = ?auto_301026 ?auto_301029 ) ) ( CALIBRATION_TARGET ?auto_301028 ?auto_301029 ) ( not ( = ?auto_301029 ?auto_301025 ) ) ( ON_BOARD ?auto_301031 ?auto_301030 ) ( not ( = ?auto_301026 ?auto_301025 ) ) ( not ( = ?auto_301028 ?auto_301031 ) ) ( SUPPORTS ?auto_301031 ?auto_301024 ) ( CALIBRATION_TARGET ?auto_301031 ?auto_301029 ) ( not ( = ?auto_301029 ?auto_301022 ) ) ( ON_BOARD ?auto_301033 ?auto_301030 ) ( not ( = ?auto_301025 ?auto_301022 ) ) ( not ( = ?auto_301031 ?auto_301033 ) ) ( SUPPORTS ?auto_301033 ?auto_301023 ) ( CALIBRATION_TARGET ?auto_301033 ?auto_301029 ) ( POWER_AVAIL ?auto_301030 ) ( POINTING ?auto_301030 ?auto_301032 ) ( not ( = ?auto_301029 ?auto_301032 ) ) ( not ( = ?auto_301022 ?auto_301032 ) ) ( not ( = ?auto_301023 ?auto_301024 ) ) ( not ( = ?auto_301025 ?auto_301032 ) ) ( not ( = ?auto_301022 ?auto_301026 ) ) ( not ( = ?auto_301023 ?auto_301027 ) ) ( not ( = ?auto_301024 ?auto_301027 ) ) ( not ( = ?auto_301026 ?auto_301032 ) ) ( not ( = ?auto_301028 ?auto_301033 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_301022 ?auto_301023 ?auto_301025 ?auto_301024 )
      ( GET-1IMAGE ?auto_301026 ?auto_301027 )
      ( GET-3IMAGE-VERIFY ?auto_301022 ?auto_301023 ?auto_301025 ?auto_301024 ?auto_301026 ?auto_301027 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_302802 - DIRECTION
      ?auto_302803 - MODE
      ?auto_302805 - DIRECTION
      ?auto_302804 - MODE
      ?auto_302806 - DIRECTION
      ?auto_302807 - MODE
      ?auto_302808 - DIRECTION
      ?auto_302809 - MODE
    )
    :vars
    (
      ?auto_302813 - INSTRUMENT
      ?auto_302811 - SATELLITE
      ?auto_302810 - DIRECTION
      ?auto_302812 - INSTRUMENT
      ?auto_302814 - INSTRUMENT
      ?auto_302815 - INSTRUMENT
      ?auto_302816 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_302813 ?auto_302811 ) ( SUPPORTS ?auto_302813 ?auto_302809 ) ( not ( = ?auto_302808 ?auto_302810 ) ) ( CALIBRATION_TARGET ?auto_302813 ?auto_302810 ) ( not ( = ?auto_302810 ?auto_302806 ) ) ( ON_BOARD ?auto_302812 ?auto_302811 ) ( not ( = ?auto_302808 ?auto_302806 ) ) ( not ( = ?auto_302813 ?auto_302812 ) ) ( SUPPORTS ?auto_302812 ?auto_302807 ) ( CALIBRATION_TARGET ?auto_302812 ?auto_302810 ) ( not ( = ?auto_302810 ?auto_302805 ) ) ( ON_BOARD ?auto_302814 ?auto_302811 ) ( not ( = ?auto_302806 ?auto_302805 ) ) ( not ( = ?auto_302812 ?auto_302814 ) ) ( SUPPORTS ?auto_302814 ?auto_302804 ) ( CALIBRATION_TARGET ?auto_302814 ?auto_302810 ) ( not ( = ?auto_302810 ?auto_302802 ) ) ( ON_BOARD ?auto_302815 ?auto_302811 ) ( not ( = ?auto_302805 ?auto_302802 ) ) ( not ( = ?auto_302814 ?auto_302815 ) ) ( SUPPORTS ?auto_302815 ?auto_302803 ) ( CALIBRATION_TARGET ?auto_302815 ?auto_302810 ) ( POWER_AVAIL ?auto_302811 ) ( POINTING ?auto_302811 ?auto_302816 ) ( not ( = ?auto_302810 ?auto_302816 ) ) ( not ( = ?auto_302802 ?auto_302816 ) ) ( not ( = ?auto_302803 ?auto_302804 ) ) ( not ( = ?auto_302805 ?auto_302816 ) ) ( not ( = ?auto_302802 ?auto_302806 ) ) ( not ( = ?auto_302803 ?auto_302807 ) ) ( not ( = ?auto_302804 ?auto_302807 ) ) ( not ( = ?auto_302806 ?auto_302816 ) ) ( not ( = ?auto_302812 ?auto_302815 ) ) ( not ( = ?auto_302802 ?auto_302808 ) ) ( not ( = ?auto_302803 ?auto_302809 ) ) ( not ( = ?auto_302805 ?auto_302808 ) ) ( not ( = ?auto_302804 ?auto_302809 ) ) ( not ( = ?auto_302807 ?auto_302809 ) ) ( not ( = ?auto_302808 ?auto_302816 ) ) ( not ( = ?auto_302813 ?auto_302814 ) ) ( not ( = ?auto_302813 ?auto_302815 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_302802 ?auto_302803 ?auto_302805 ?auto_302804 ?auto_302806 ?auto_302807 )
      ( GET-1IMAGE ?auto_302808 ?auto_302809 )
      ( GET-4IMAGE-VERIFY ?auto_302802 ?auto_302803 ?auto_302805 ?auto_302804 ?auto_302806 ?auto_302807 ?auto_302808 ?auto_302809 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_328276 - DIRECTION
      ?auto_328277 - MODE
      ?auto_328279 - DIRECTION
      ?auto_328278 - MODE
      ?auto_328280 - DIRECTION
      ?auto_328281 - MODE
      ?auto_328282 - DIRECTION
      ?auto_328283 - MODE
      ?auto_328284 - DIRECTION
      ?auto_328285 - MODE
    )
    :vars
    (
      ?auto_328288 - INSTRUMENT
      ?auto_328289 - SATELLITE
      ?auto_328287 - DIRECTION
      ?auto_328286 - INSTRUMENT
      ?auto_328291 - INSTRUMENT
      ?auto_328292 - INSTRUMENT
      ?auto_328290 - INSTRUMENT
      ?auto_328293 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_328288 ?auto_328289 ) ( SUPPORTS ?auto_328288 ?auto_328285 ) ( not ( = ?auto_328284 ?auto_328287 ) ) ( CALIBRATION_TARGET ?auto_328288 ?auto_328287 ) ( not ( = ?auto_328287 ?auto_328282 ) ) ( ON_BOARD ?auto_328286 ?auto_328289 ) ( not ( = ?auto_328284 ?auto_328282 ) ) ( not ( = ?auto_328288 ?auto_328286 ) ) ( SUPPORTS ?auto_328286 ?auto_328283 ) ( CALIBRATION_TARGET ?auto_328286 ?auto_328287 ) ( not ( = ?auto_328287 ?auto_328280 ) ) ( ON_BOARD ?auto_328291 ?auto_328289 ) ( not ( = ?auto_328282 ?auto_328280 ) ) ( not ( = ?auto_328286 ?auto_328291 ) ) ( SUPPORTS ?auto_328291 ?auto_328281 ) ( CALIBRATION_TARGET ?auto_328291 ?auto_328287 ) ( not ( = ?auto_328287 ?auto_328279 ) ) ( ON_BOARD ?auto_328292 ?auto_328289 ) ( not ( = ?auto_328280 ?auto_328279 ) ) ( not ( = ?auto_328291 ?auto_328292 ) ) ( SUPPORTS ?auto_328292 ?auto_328278 ) ( CALIBRATION_TARGET ?auto_328292 ?auto_328287 ) ( not ( = ?auto_328287 ?auto_328276 ) ) ( ON_BOARD ?auto_328290 ?auto_328289 ) ( not ( = ?auto_328279 ?auto_328276 ) ) ( not ( = ?auto_328292 ?auto_328290 ) ) ( SUPPORTS ?auto_328290 ?auto_328277 ) ( CALIBRATION_TARGET ?auto_328290 ?auto_328287 ) ( POWER_AVAIL ?auto_328289 ) ( POINTING ?auto_328289 ?auto_328293 ) ( not ( = ?auto_328287 ?auto_328293 ) ) ( not ( = ?auto_328276 ?auto_328293 ) ) ( not ( = ?auto_328277 ?auto_328278 ) ) ( not ( = ?auto_328279 ?auto_328293 ) ) ( not ( = ?auto_328276 ?auto_328280 ) ) ( not ( = ?auto_328277 ?auto_328281 ) ) ( not ( = ?auto_328278 ?auto_328281 ) ) ( not ( = ?auto_328280 ?auto_328293 ) ) ( not ( = ?auto_328291 ?auto_328290 ) ) ( not ( = ?auto_328276 ?auto_328282 ) ) ( not ( = ?auto_328277 ?auto_328283 ) ) ( not ( = ?auto_328279 ?auto_328282 ) ) ( not ( = ?auto_328278 ?auto_328283 ) ) ( not ( = ?auto_328281 ?auto_328283 ) ) ( not ( = ?auto_328282 ?auto_328293 ) ) ( not ( = ?auto_328286 ?auto_328292 ) ) ( not ( = ?auto_328286 ?auto_328290 ) ) ( not ( = ?auto_328276 ?auto_328284 ) ) ( not ( = ?auto_328277 ?auto_328285 ) ) ( not ( = ?auto_328279 ?auto_328284 ) ) ( not ( = ?auto_328278 ?auto_328285 ) ) ( not ( = ?auto_328280 ?auto_328284 ) ) ( not ( = ?auto_328281 ?auto_328285 ) ) ( not ( = ?auto_328283 ?auto_328285 ) ) ( not ( = ?auto_328284 ?auto_328293 ) ) ( not ( = ?auto_328288 ?auto_328291 ) ) ( not ( = ?auto_328288 ?auto_328292 ) ) ( not ( = ?auto_328288 ?auto_328290 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_328276 ?auto_328277 ?auto_328279 ?auto_328278 ?auto_328280 ?auto_328281 ?auto_328282 ?auto_328283 )
      ( GET-1IMAGE ?auto_328284 ?auto_328285 )
      ( GET-5IMAGE-VERIFY ?auto_328276 ?auto_328277 ?auto_328279 ?auto_328278 ?auto_328280 ?auto_328281 ?auto_328282 ?auto_328283 ?auto_328284 ?auto_328285 ) )
  )

)

