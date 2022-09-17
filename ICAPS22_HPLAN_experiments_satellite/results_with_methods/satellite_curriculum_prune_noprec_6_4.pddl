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
      ?auto_5176228 - DIRECTION
      ?auto_5176229 - MODE
    )
    :vars
    (
      ?auto_5176230 - INSTRUMENT
      ?auto_5176231 - SATELLITE
      ?auto_5176232 - DIRECTION
      ?auto_5176233 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_5176230 ?auto_5176231 ) ( SUPPORTS ?auto_5176230 ?auto_5176229 ) ( not ( = ?auto_5176228 ?auto_5176232 ) ) ( CALIBRATION_TARGET ?auto_5176230 ?auto_5176232 ) ( POWER_AVAIL ?auto_5176231 ) ( POINTING ?auto_5176231 ?auto_5176233 ) ( not ( = ?auto_5176232 ?auto_5176233 ) ) ( not ( = ?auto_5176228 ?auto_5176233 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_5176231 ?auto_5176232 ?auto_5176233 )
      ( !SWITCH_ON ?auto_5176230 ?auto_5176231 )
      ( !CALIBRATE ?auto_5176231 ?auto_5176230 ?auto_5176232 )
      ( !TURN_TO ?auto_5176231 ?auto_5176228 ?auto_5176232 )
      ( !TAKE_IMAGE ?auto_5176231 ?auto_5176228 ?auto_5176230 ?auto_5176229 )
      ( GET-1IMAGE-VERIFY ?auto_5176228 ?auto_5176229 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_5176236 - DIRECTION
      ?auto_5176237 - MODE
    )
    :vars
    (
      ?auto_5176238 - INSTRUMENT
      ?auto_5176239 - SATELLITE
      ?auto_5176240 - DIRECTION
      ?auto_5176241 - DIRECTION
      ?auto_5176242 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_5176238 ?auto_5176239 ) ( SUPPORTS ?auto_5176238 ?auto_5176237 ) ( not ( = ?auto_5176236 ?auto_5176240 ) ) ( CALIBRATION_TARGET ?auto_5176238 ?auto_5176240 ) ( POINTING ?auto_5176239 ?auto_5176241 ) ( not ( = ?auto_5176240 ?auto_5176241 ) ) ( ON_BOARD ?auto_5176242 ?auto_5176239 ) ( POWER_ON ?auto_5176242 ) ( not ( = ?auto_5176236 ?auto_5176241 ) ) ( not ( = ?auto_5176238 ?auto_5176242 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_5176242 ?auto_5176239 )
      ( !TURN_TO ?auto_5176239 ?auto_5176240 ?auto_5176241 )
      ( !SWITCH_ON ?auto_5176238 ?auto_5176239 )
      ( !CALIBRATE ?auto_5176239 ?auto_5176238 ?auto_5176240 )
      ( !TURN_TO ?auto_5176239 ?auto_5176236 ?auto_5176240 )
      ( !TAKE_IMAGE ?auto_5176239 ?auto_5176236 ?auto_5176238 ?auto_5176237 )
      ( GET-1IMAGE-VERIFY ?auto_5176236 ?auto_5176237 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_5176255 - DIRECTION
      ?auto_5176256 - MODE
      ?auto_5176258 - DIRECTION
      ?auto_5176257 - MODE
    )
    :vars
    (
      ?auto_5176260 - INSTRUMENT
      ?auto_5176261 - SATELLITE
      ?auto_5176262 - DIRECTION
      ?auto_5176259 - INSTRUMENT
      ?auto_5176263 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_5176260 ?auto_5176261 ) ( SUPPORTS ?auto_5176260 ?auto_5176257 ) ( not ( = ?auto_5176258 ?auto_5176262 ) ) ( CALIBRATION_TARGET ?auto_5176260 ?auto_5176262 ) ( not ( = ?auto_5176262 ?auto_5176255 ) ) ( ON_BOARD ?auto_5176259 ?auto_5176261 ) ( not ( = ?auto_5176258 ?auto_5176255 ) ) ( not ( = ?auto_5176260 ?auto_5176259 ) ) ( SUPPORTS ?auto_5176259 ?auto_5176256 ) ( CALIBRATION_TARGET ?auto_5176259 ?auto_5176262 ) ( POWER_AVAIL ?auto_5176261 ) ( POINTING ?auto_5176261 ?auto_5176263 ) ( not ( = ?auto_5176262 ?auto_5176263 ) ) ( not ( = ?auto_5176255 ?auto_5176263 ) ) ( not ( = ?auto_5176256 ?auto_5176257 ) ) ( not ( = ?auto_5176258 ?auto_5176263 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_5176255 ?auto_5176256 )
      ( GET-1IMAGE ?auto_5176258 ?auto_5176257 )
      ( GET-2IMAGE-VERIFY ?auto_5176255 ?auto_5176256 ?auto_5176258 ?auto_5176257 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_5176416 - DIRECTION
      ?auto_5176417 - MODE
      ?auto_5176419 - DIRECTION
      ?auto_5176418 - MODE
      ?auto_5176420 - DIRECTION
      ?auto_5176421 - MODE
    )
    :vars
    (
      ?auto_5176424 - INSTRUMENT
      ?auto_5176423 - SATELLITE
      ?auto_5176425 - DIRECTION
      ?auto_5176422 - INSTRUMENT
      ?auto_5176426 - INSTRUMENT
      ?auto_5176427 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_5176424 ?auto_5176423 ) ( SUPPORTS ?auto_5176424 ?auto_5176421 ) ( not ( = ?auto_5176420 ?auto_5176425 ) ) ( CALIBRATION_TARGET ?auto_5176424 ?auto_5176425 ) ( not ( = ?auto_5176425 ?auto_5176419 ) ) ( ON_BOARD ?auto_5176422 ?auto_5176423 ) ( not ( = ?auto_5176420 ?auto_5176419 ) ) ( not ( = ?auto_5176424 ?auto_5176422 ) ) ( SUPPORTS ?auto_5176422 ?auto_5176418 ) ( CALIBRATION_TARGET ?auto_5176422 ?auto_5176425 ) ( not ( = ?auto_5176425 ?auto_5176416 ) ) ( ON_BOARD ?auto_5176426 ?auto_5176423 ) ( not ( = ?auto_5176419 ?auto_5176416 ) ) ( not ( = ?auto_5176422 ?auto_5176426 ) ) ( SUPPORTS ?auto_5176426 ?auto_5176417 ) ( CALIBRATION_TARGET ?auto_5176426 ?auto_5176425 ) ( POWER_AVAIL ?auto_5176423 ) ( POINTING ?auto_5176423 ?auto_5176427 ) ( not ( = ?auto_5176425 ?auto_5176427 ) ) ( not ( = ?auto_5176416 ?auto_5176427 ) ) ( not ( = ?auto_5176417 ?auto_5176418 ) ) ( not ( = ?auto_5176419 ?auto_5176427 ) ) ( not ( = ?auto_5176416 ?auto_5176420 ) ) ( not ( = ?auto_5176417 ?auto_5176421 ) ) ( not ( = ?auto_5176418 ?auto_5176421 ) ) ( not ( = ?auto_5176420 ?auto_5176427 ) ) ( not ( = ?auto_5176424 ?auto_5176426 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_5176416 ?auto_5176417 ?auto_5176419 ?auto_5176418 )
      ( GET-1IMAGE ?auto_5176420 ?auto_5176421 )
      ( GET-3IMAGE-VERIFY ?auto_5176416 ?auto_5176417 ?auto_5176419 ?auto_5176418 ?auto_5176420 ?auto_5176421 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_5178196 - DIRECTION
      ?auto_5178197 - MODE
      ?auto_5178199 - DIRECTION
      ?auto_5178198 - MODE
      ?auto_5178200 - DIRECTION
      ?auto_5178201 - MODE
      ?auto_5178202 - DIRECTION
      ?auto_5178203 - MODE
    )
    :vars
    (
      ?auto_5178206 - INSTRUMENT
      ?auto_5178204 - SATELLITE
      ?auto_5178207 - DIRECTION
      ?auto_5178205 - INSTRUMENT
      ?auto_5178208 - INSTRUMENT
      ?auto_5178209 - INSTRUMENT
      ?auto_5178210 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_5178206 ?auto_5178204 ) ( SUPPORTS ?auto_5178206 ?auto_5178203 ) ( not ( = ?auto_5178202 ?auto_5178207 ) ) ( CALIBRATION_TARGET ?auto_5178206 ?auto_5178207 ) ( not ( = ?auto_5178207 ?auto_5178200 ) ) ( ON_BOARD ?auto_5178205 ?auto_5178204 ) ( not ( = ?auto_5178202 ?auto_5178200 ) ) ( not ( = ?auto_5178206 ?auto_5178205 ) ) ( SUPPORTS ?auto_5178205 ?auto_5178201 ) ( CALIBRATION_TARGET ?auto_5178205 ?auto_5178207 ) ( not ( = ?auto_5178207 ?auto_5178199 ) ) ( ON_BOARD ?auto_5178208 ?auto_5178204 ) ( not ( = ?auto_5178200 ?auto_5178199 ) ) ( not ( = ?auto_5178205 ?auto_5178208 ) ) ( SUPPORTS ?auto_5178208 ?auto_5178198 ) ( CALIBRATION_TARGET ?auto_5178208 ?auto_5178207 ) ( not ( = ?auto_5178207 ?auto_5178196 ) ) ( ON_BOARD ?auto_5178209 ?auto_5178204 ) ( not ( = ?auto_5178199 ?auto_5178196 ) ) ( not ( = ?auto_5178208 ?auto_5178209 ) ) ( SUPPORTS ?auto_5178209 ?auto_5178197 ) ( CALIBRATION_TARGET ?auto_5178209 ?auto_5178207 ) ( POWER_AVAIL ?auto_5178204 ) ( POINTING ?auto_5178204 ?auto_5178210 ) ( not ( = ?auto_5178207 ?auto_5178210 ) ) ( not ( = ?auto_5178196 ?auto_5178210 ) ) ( not ( = ?auto_5178197 ?auto_5178198 ) ) ( not ( = ?auto_5178199 ?auto_5178210 ) ) ( not ( = ?auto_5178196 ?auto_5178200 ) ) ( not ( = ?auto_5178197 ?auto_5178201 ) ) ( not ( = ?auto_5178198 ?auto_5178201 ) ) ( not ( = ?auto_5178200 ?auto_5178210 ) ) ( not ( = ?auto_5178205 ?auto_5178209 ) ) ( not ( = ?auto_5178196 ?auto_5178202 ) ) ( not ( = ?auto_5178197 ?auto_5178203 ) ) ( not ( = ?auto_5178199 ?auto_5178202 ) ) ( not ( = ?auto_5178198 ?auto_5178203 ) ) ( not ( = ?auto_5178201 ?auto_5178203 ) ) ( not ( = ?auto_5178202 ?auto_5178210 ) ) ( not ( = ?auto_5178206 ?auto_5178208 ) ) ( not ( = ?auto_5178206 ?auto_5178209 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_5178196 ?auto_5178197 ?auto_5178199 ?auto_5178198 ?auto_5178200 ?auto_5178201 )
      ( GET-1IMAGE ?auto_5178202 ?auto_5178203 )
      ( GET-4IMAGE-VERIFY ?auto_5178196 ?auto_5178197 ?auto_5178199 ?auto_5178198 ?auto_5178200 ?auto_5178201 ?auto_5178202 ?auto_5178203 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_5203670 - DIRECTION
      ?auto_5203671 - MODE
      ?auto_5203673 - DIRECTION
      ?auto_5203672 - MODE
      ?auto_5203674 - DIRECTION
      ?auto_5203675 - MODE
      ?auto_5203676 - DIRECTION
      ?auto_5203677 - MODE
      ?auto_5203678 - DIRECTION
      ?auto_5203679 - MODE
    )
    :vars
    (
      ?auto_5203683 - INSTRUMENT
      ?auto_5203682 - SATELLITE
      ?auto_5203681 - DIRECTION
      ?auto_5203680 - INSTRUMENT
      ?auto_5203685 - INSTRUMENT
      ?auto_5203687 - INSTRUMENT
      ?auto_5203686 - INSTRUMENT
      ?auto_5203684 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_5203683 ?auto_5203682 ) ( SUPPORTS ?auto_5203683 ?auto_5203679 ) ( not ( = ?auto_5203678 ?auto_5203681 ) ) ( CALIBRATION_TARGET ?auto_5203683 ?auto_5203681 ) ( not ( = ?auto_5203681 ?auto_5203676 ) ) ( ON_BOARD ?auto_5203680 ?auto_5203682 ) ( not ( = ?auto_5203678 ?auto_5203676 ) ) ( not ( = ?auto_5203683 ?auto_5203680 ) ) ( SUPPORTS ?auto_5203680 ?auto_5203677 ) ( CALIBRATION_TARGET ?auto_5203680 ?auto_5203681 ) ( not ( = ?auto_5203681 ?auto_5203674 ) ) ( ON_BOARD ?auto_5203685 ?auto_5203682 ) ( not ( = ?auto_5203676 ?auto_5203674 ) ) ( not ( = ?auto_5203680 ?auto_5203685 ) ) ( SUPPORTS ?auto_5203685 ?auto_5203675 ) ( CALIBRATION_TARGET ?auto_5203685 ?auto_5203681 ) ( not ( = ?auto_5203681 ?auto_5203673 ) ) ( ON_BOARD ?auto_5203687 ?auto_5203682 ) ( not ( = ?auto_5203674 ?auto_5203673 ) ) ( not ( = ?auto_5203685 ?auto_5203687 ) ) ( SUPPORTS ?auto_5203687 ?auto_5203672 ) ( CALIBRATION_TARGET ?auto_5203687 ?auto_5203681 ) ( not ( = ?auto_5203681 ?auto_5203670 ) ) ( ON_BOARD ?auto_5203686 ?auto_5203682 ) ( not ( = ?auto_5203673 ?auto_5203670 ) ) ( not ( = ?auto_5203687 ?auto_5203686 ) ) ( SUPPORTS ?auto_5203686 ?auto_5203671 ) ( CALIBRATION_TARGET ?auto_5203686 ?auto_5203681 ) ( POWER_AVAIL ?auto_5203682 ) ( POINTING ?auto_5203682 ?auto_5203684 ) ( not ( = ?auto_5203681 ?auto_5203684 ) ) ( not ( = ?auto_5203670 ?auto_5203684 ) ) ( not ( = ?auto_5203671 ?auto_5203672 ) ) ( not ( = ?auto_5203673 ?auto_5203684 ) ) ( not ( = ?auto_5203670 ?auto_5203674 ) ) ( not ( = ?auto_5203671 ?auto_5203675 ) ) ( not ( = ?auto_5203672 ?auto_5203675 ) ) ( not ( = ?auto_5203674 ?auto_5203684 ) ) ( not ( = ?auto_5203685 ?auto_5203686 ) ) ( not ( = ?auto_5203670 ?auto_5203676 ) ) ( not ( = ?auto_5203671 ?auto_5203677 ) ) ( not ( = ?auto_5203673 ?auto_5203676 ) ) ( not ( = ?auto_5203672 ?auto_5203677 ) ) ( not ( = ?auto_5203675 ?auto_5203677 ) ) ( not ( = ?auto_5203676 ?auto_5203684 ) ) ( not ( = ?auto_5203680 ?auto_5203687 ) ) ( not ( = ?auto_5203680 ?auto_5203686 ) ) ( not ( = ?auto_5203670 ?auto_5203678 ) ) ( not ( = ?auto_5203671 ?auto_5203679 ) ) ( not ( = ?auto_5203673 ?auto_5203678 ) ) ( not ( = ?auto_5203672 ?auto_5203679 ) ) ( not ( = ?auto_5203674 ?auto_5203678 ) ) ( not ( = ?auto_5203675 ?auto_5203679 ) ) ( not ( = ?auto_5203677 ?auto_5203679 ) ) ( not ( = ?auto_5203678 ?auto_5203684 ) ) ( not ( = ?auto_5203683 ?auto_5203685 ) ) ( not ( = ?auto_5203683 ?auto_5203687 ) ) ( not ( = ?auto_5203683 ?auto_5203686 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_5203670 ?auto_5203671 ?auto_5203673 ?auto_5203672 ?auto_5203674 ?auto_5203675 ?auto_5203676 ?auto_5203677 )
      ( GET-1IMAGE ?auto_5203678 ?auto_5203679 )
      ( GET-5IMAGE-VERIFY ?auto_5203670 ?auto_5203671 ?auto_5203673 ?auto_5203672 ?auto_5203674 ?auto_5203675 ?auto_5203676 ?auto_5203677 ?auto_5203678 ?auto_5203679 ) )
  )

  ( :method GET-6IMAGE
    :parameters
    (
      ?auto_5639895 - DIRECTION
      ?auto_5639896 - MODE
      ?auto_5639898 - DIRECTION
      ?auto_5639897 - MODE
      ?auto_5639899 - DIRECTION
      ?auto_5639900 - MODE
      ?auto_5639901 - DIRECTION
      ?auto_5639902 - MODE
      ?auto_5639903 - DIRECTION
      ?auto_5639904 - MODE
      ?auto_5639906 - DIRECTION
      ?auto_5639905 - MODE
    )
    :vars
    (
      ?auto_5639908 - INSTRUMENT
      ?auto_5639910 - SATELLITE
      ?auto_5639909 - DIRECTION
      ?auto_5639907 - INSTRUMENT
      ?auto_5639913 - INSTRUMENT
      ?auto_5639912 - INSTRUMENT
      ?auto_5639915 - INSTRUMENT
      ?auto_5639911 - INSTRUMENT
      ?auto_5639914 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_5639908 ?auto_5639910 ) ( SUPPORTS ?auto_5639908 ?auto_5639905 ) ( not ( = ?auto_5639906 ?auto_5639909 ) ) ( CALIBRATION_TARGET ?auto_5639908 ?auto_5639909 ) ( not ( = ?auto_5639909 ?auto_5639903 ) ) ( ON_BOARD ?auto_5639907 ?auto_5639910 ) ( not ( = ?auto_5639906 ?auto_5639903 ) ) ( not ( = ?auto_5639908 ?auto_5639907 ) ) ( SUPPORTS ?auto_5639907 ?auto_5639904 ) ( CALIBRATION_TARGET ?auto_5639907 ?auto_5639909 ) ( not ( = ?auto_5639909 ?auto_5639901 ) ) ( ON_BOARD ?auto_5639913 ?auto_5639910 ) ( not ( = ?auto_5639903 ?auto_5639901 ) ) ( not ( = ?auto_5639907 ?auto_5639913 ) ) ( SUPPORTS ?auto_5639913 ?auto_5639902 ) ( CALIBRATION_TARGET ?auto_5639913 ?auto_5639909 ) ( not ( = ?auto_5639909 ?auto_5639899 ) ) ( ON_BOARD ?auto_5639912 ?auto_5639910 ) ( not ( = ?auto_5639901 ?auto_5639899 ) ) ( not ( = ?auto_5639913 ?auto_5639912 ) ) ( SUPPORTS ?auto_5639912 ?auto_5639900 ) ( CALIBRATION_TARGET ?auto_5639912 ?auto_5639909 ) ( not ( = ?auto_5639909 ?auto_5639898 ) ) ( ON_BOARD ?auto_5639915 ?auto_5639910 ) ( not ( = ?auto_5639899 ?auto_5639898 ) ) ( not ( = ?auto_5639912 ?auto_5639915 ) ) ( SUPPORTS ?auto_5639915 ?auto_5639897 ) ( CALIBRATION_TARGET ?auto_5639915 ?auto_5639909 ) ( not ( = ?auto_5639909 ?auto_5639895 ) ) ( ON_BOARD ?auto_5639911 ?auto_5639910 ) ( not ( = ?auto_5639898 ?auto_5639895 ) ) ( not ( = ?auto_5639915 ?auto_5639911 ) ) ( SUPPORTS ?auto_5639911 ?auto_5639896 ) ( CALIBRATION_TARGET ?auto_5639911 ?auto_5639909 ) ( POWER_AVAIL ?auto_5639910 ) ( POINTING ?auto_5639910 ?auto_5639914 ) ( not ( = ?auto_5639909 ?auto_5639914 ) ) ( not ( = ?auto_5639895 ?auto_5639914 ) ) ( not ( = ?auto_5639896 ?auto_5639897 ) ) ( not ( = ?auto_5639898 ?auto_5639914 ) ) ( not ( = ?auto_5639895 ?auto_5639899 ) ) ( not ( = ?auto_5639896 ?auto_5639900 ) ) ( not ( = ?auto_5639897 ?auto_5639900 ) ) ( not ( = ?auto_5639899 ?auto_5639914 ) ) ( not ( = ?auto_5639912 ?auto_5639911 ) ) ( not ( = ?auto_5639895 ?auto_5639901 ) ) ( not ( = ?auto_5639896 ?auto_5639902 ) ) ( not ( = ?auto_5639898 ?auto_5639901 ) ) ( not ( = ?auto_5639897 ?auto_5639902 ) ) ( not ( = ?auto_5639900 ?auto_5639902 ) ) ( not ( = ?auto_5639901 ?auto_5639914 ) ) ( not ( = ?auto_5639913 ?auto_5639915 ) ) ( not ( = ?auto_5639913 ?auto_5639911 ) ) ( not ( = ?auto_5639895 ?auto_5639903 ) ) ( not ( = ?auto_5639896 ?auto_5639904 ) ) ( not ( = ?auto_5639898 ?auto_5639903 ) ) ( not ( = ?auto_5639897 ?auto_5639904 ) ) ( not ( = ?auto_5639899 ?auto_5639903 ) ) ( not ( = ?auto_5639900 ?auto_5639904 ) ) ( not ( = ?auto_5639902 ?auto_5639904 ) ) ( not ( = ?auto_5639903 ?auto_5639914 ) ) ( not ( = ?auto_5639907 ?auto_5639912 ) ) ( not ( = ?auto_5639907 ?auto_5639915 ) ) ( not ( = ?auto_5639907 ?auto_5639911 ) ) ( not ( = ?auto_5639895 ?auto_5639906 ) ) ( not ( = ?auto_5639896 ?auto_5639905 ) ) ( not ( = ?auto_5639898 ?auto_5639906 ) ) ( not ( = ?auto_5639897 ?auto_5639905 ) ) ( not ( = ?auto_5639899 ?auto_5639906 ) ) ( not ( = ?auto_5639900 ?auto_5639905 ) ) ( not ( = ?auto_5639901 ?auto_5639906 ) ) ( not ( = ?auto_5639902 ?auto_5639905 ) ) ( not ( = ?auto_5639904 ?auto_5639905 ) ) ( not ( = ?auto_5639906 ?auto_5639914 ) ) ( not ( = ?auto_5639908 ?auto_5639913 ) ) ( not ( = ?auto_5639908 ?auto_5639912 ) ) ( not ( = ?auto_5639908 ?auto_5639915 ) ) ( not ( = ?auto_5639908 ?auto_5639911 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_5639895 ?auto_5639896 ?auto_5639898 ?auto_5639897 ?auto_5639899 ?auto_5639900 ?auto_5639901 ?auto_5639902 ?auto_5639903 ?auto_5639904 )
      ( GET-1IMAGE ?auto_5639906 ?auto_5639905 )
      ( GET-6IMAGE-VERIFY ?auto_5639895 ?auto_5639896 ?auto_5639898 ?auto_5639897 ?auto_5639899 ?auto_5639900 ?auto_5639901 ?auto_5639902 ?auto_5639903 ?auto_5639904 ?auto_5639906 ?auto_5639905 ) )
  )

)

