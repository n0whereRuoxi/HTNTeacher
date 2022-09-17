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
      ?auto_439300 - DIRECTION
      ?auto_439301 - MODE
    )
    :vars
    (
      ?auto_439302 - INSTRUMENT
      ?auto_439303 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_439302 ) ( ON_BOARD ?auto_439302 ?auto_439303 ) ( SUPPORTS ?auto_439302 ?auto_439301 ) ( POWER_ON ?auto_439302 ) ( POINTING ?auto_439303 ?auto_439300 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_439303 ?auto_439300 ?auto_439302 ?auto_439301 )
      ( GET-1IMAGE-VERIFY ?auto_439300 ?auto_439301 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_439340 - DIRECTION
      ?auto_439341 - MODE
    )
    :vars
    (
      ?auto_439342 - INSTRUMENT
      ?auto_439343 - SATELLITE
      ?auto_439344 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_439342 ) ( ON_BOARD ?auto_439342 ?auto_439343 ) ( SUPPORTS ?auto_439342 ?auto_439341 ) ( POWER_ON ?auto_439342 ) ( POINTING ?auto_439343 ?auto_439344 ) ( not ( = ?auto_439340 ?auto_439344 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_439343 ?auto_439340 ?auto_439344 )
      ( GET-1IMAGE ?auto_439340 ?auto_439341 )
      ( GET-1IMAGE-VERIFY ?auto_439340 ?auto_439341 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_439385 - DIRECTION
      ?auto_439386 - MODE
    )
    :vars
    (
      ?auto_439389 - INSTRUMENT
      ?auto_439388 - SATELLITE
      ?auto_439387 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_439389 ?auto_439388 ) ( SUPPORTS ?auto_439389 ?auto_439386 ) ( POWER_ON ?auto_439389 ) ( POINTING ?auto_439388 ?auto_439387 ) ( not ( = ?auto_439385 ?auto_439387 ) ) ( CALIBRATION_TARGET ?auto_439389 ?auto_439387 ) ( NOT_CALIBRATED ?auto_439389 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_439388 ?auto_439389 ?auto_439387 )
      ( GET-1IMAGE ?auto_439385 ?auto_439386 )
      ( GET-1IMAGE-VERIFY ?auto_439385 ?auto_439386 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_439430 - DIRECTION
      ?auto_439431 - MODE
    )
    :vars
    (
      ?auto_439434 - INSTRUMENT
      ?auto_439433 - SATELLITE
      ?auto_439432 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_439434 ?auto_439433 ) ( SUPPORTS ?auto_439434 ?auto_439431 ) ( POINTING ?auto_439433 ?auto_439432 ) ( not ( = ?auto_439430 ?auto_439432 ) ) ( CALIBRATION_TARGET ?auto_439434 ?auto_439432 ) ( POWER_AVAIL ?auto_439433 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_439434 ?auto_439433 )
      ( GET-1IMAGE ?auto_439430 ?auto_439431 )
      ( GET-1IMAGE-VERIFY ?auto_439430 ?auto_439431 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_439475 - DIRECTION
      ?auto_439476 - MODE
    )
    :vars
    (
      ?auto_439478 - INSTRUMENT
      ?auto_439477 - SATELLITE
      ?auto_439479 - DIRECTION
      ?auto_439480 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_439478 ?auto_439477 ) ( SUPPORTS ?auto_439478 ?auto_439476 ) ( not ( = ?auto_439475 ?auto_439479 ) ) ( CALIBRATION_TARGET ?auto_439478 ?auto_439479 ) ( POWER_AVAIL ?auto_439477 ) ( POINTING ?auto_439477 ?auto_439480 ) ( not ( = ?auto_439479 ?auto_439480 ) ) ( not ( = ?auto_439475 ?auto_439480 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_439477 ?auto_439479 ?auto_439480 )
      ( GET-1IMAGE ?auto_439475 ?auto_439476 )
      ( GET-1IMAGE-VERIFY ?auto_439475 ?auto_439476 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_440016 - DIRECTION
      ?auto_440017 - MODE
      ?auto_440018 - DIRECTION
      ?auto_440015 - MODE
    )
    :vars
    (
      ?auto_440020 - INSTRUMENT
      ?auto_440019 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_440018 ?auto_440016 ) ) ( CALIBRATED ?auto_440020 ) ( ON_BOARD ?auto_440020 ?auto_440019 ) ( SUPPORTS ?auto_440020 ?auto_440015 ) ( POWER_ON ?auto_440020 ) ( POINTING ?auto_440019 ?auto_440018 ) ( HAVE_IMAGE ?auto_440016 ?auto_440017 ) ( not ( = ?auto_440017 ?auto_440015 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_440018 ?auto_440015 )
      ( GET-2IMAGE-VERIFY ?auto_440016 ?auto_440017 ?auto_440018 ?auto_440015 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_440022 - DIRECTION
      ?auto_440023 - MODE
      ?auto_440024 - DIRECTION
      ?auto_440021 - MODE
    )
    :vars
    (
      ?auto_440026 - INSTRUMENT
      ?auto_440025 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_440024 ?auto_440022 ) ) ( CALIBRATED ?auto_440026 ) ( ON_BOARD ?auto_440026 ?auto_440025 ) ( SUPPORTS ?auto_440026 ?auto_440023 ) ( POWER_ON ?auto_440026 ) ( POINTING ?auto_440025 ?auto_440022 ) ( HAVE_IMAGE ?auto_440024 ?auto_440021 ) ( not ( = ?auto_440023 ?auto_440021 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_440022 ?auto_440023 )
      ( GET-2IMAGE-VERIFY ?auto_440022 ?auto_440023 ?auto_440024 ?auto_440021 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_440617 - DIRECTION
      ?auto_440618 - MODE
      ?auto_440619 - DIRECTION
      ?auto_440616 - MODE
    )
    :vars
    (
      ?auto_440621 - INSTRUMENT
      ?auto_440622 - SATELLITE
      ?auto_440620 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_440619 ?auto_440617 ) ) ( CALIBRATED ?auto_440621 ) ( ON_BOARD ?auto_440621 ?auto_440622 ) ( SUPPORTS ?auto_440621 ?auto_440616 ) ( POWER_ON ?auto_440621 ) ( POINTING ?auto_440622 ?auto_440620 ) ( not ( = ?auto_440619 ?auto_440620 ) ) ( HAVE_IMAGE ?auto_440617 ?auto_440618 ) ( not ( = ?auto_440617 ?auto_440620 ) ) ( not ( = ?auto_440618 ?auto_440616 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_440619 ?auto_440616 )
      ( GET-2IMAGE-VERIFY ?auto_440617 ?auto_440618 ?auto_440619 ?auto_440616 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_440624 - DIRECTION
      ?auto_440625 - MODE
      ?auto_440626 - DIRECTION
      ?auto_440623 - MODE
    )
    :vars
    (
      ?auto_440627 - INSTRUMENT
      ?auto_440628 - SATELLITE
      ?auto_440629 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_440626 ?auto_440624 ) ) ( CALIBRATED ?auto_440627 ) ( ON_BOARD ?auto_440627 ?auto_440628 ) ( SUPPORTS ?auto_440627 ?auto_440625 ) ( POWER_ON ?auto_440627 ) ( POINTING ?auto_440628 ?auto_440629 ) ( not ( = ?auto_440624 ?auto_440629 ) ) ( HAVE_IMAGE ?auto_440626 ?auto_440623 ) ( not ( = ?auto_440626 ?auto_440629 ) ) ( not ( = ?auto_440623 ?auto_440625 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_440626 ?auto_440623 ?auto_440624 ?auto_440625 )
      ( GET-2IMAGE-VERIFY ?auto_440624 ?auto_440625 ?auto_440626 ?auto_440623 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_441276 - DIRECTION
      ?auto_441277 - MODE
    )
    :vars
    (
      ?auto_441278 - DIRECTION
      ?auto_441280 - INSTRUMENT
      ?auto_441281 - SATELLITE
      ?auto_441282 - DIRECTION
      ?auto_441279 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_441276 ?auto_441278 ) ) ( ON_BOARD ?auto_441280 ?auto_441281 ) ( SUPPORTS ?auto_441280 ?auto_441277 ) ( POWER_ON ?auto_441280 ) ( POINTING ?auto_441281 ?auto_441282 ) ( not ( = ?auto_441276 ?auto_441282 ) ) ( HAVE_IMAGE ?auto_441278 ?auto_441279 ) ( not ( = ?auto_441278 ?auto_441282 ) ) ( not ( = ?auto_441279 ?auto_441277 ) ) ( CALIBRATION_TARGET ?auto_441280 ?auto_441282 ) ( NOT_CALIBRATED ?auto_441280 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_441281 ?auto_441280 ?auto_441282 )
      ( GET-2IMAGE ?auto_441278 ?auto_441279 ?auto_441276 ?auto_441277 )
      ( GET-1IMAGE-VERIFY ?auto_441276 ?auto_441277 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_441284 - DIRECTION
      ?auto_441285 - MODE
      ?auto_441286 - DIRECTION
      ?auto_441283 - MODE
    )
    :vars
    (
      ?auto_441288 - INSTRUMENT
      ?auto_441289 - SATELLITE
      ?auto_441287 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_441286 ?auto_441284 ) ) ( ON_BOARD ?auto_441288 ?auto_441289 ) ( SUPPORTS ?auto_441288 ?auto_441283 ) ( POWER_ON ?auto_441288 ) ( POINTING ?auto_441289 ?auto_441287 ) ( not ( = ?auto_441286 ?auto_441287 ) ) ( HAVE_IMAGE ?auto_441284 ?auto_441285 ) ( not ( = ?auto_441284 ?auto_441287 ) ) ( not ( = ?auto_441285 ?auto_441283 ) ) ( CALIBRATION_TARGET ?auto_441288 ?auto_441287 ) ( NOT_CALIBRATED ?auto_441288 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_441286 ?auto_441283 )
      ( GET-2IMAGE-VERIFY ?auto_441284 ?auto_441285 ?auto_441286 ?auto_441283 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_441291 - DIRECTION
      ?auto_441292 - MODE
      ?auto_441293 - DIRECTION
      ?auto_441290 - MODE
    )
    :vars
    (
      ?auto_441294 - INSTRUMENT
      ?auto_441296 - SATELLITE
      ?auto_441295 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_441293 ?auto_441291 ) ) ( ON_BOARD ?auto_441294 ?auto_441296 ) ( SUPPORTS ?auto_441294 ?auto_441292 ) ( POWER_ON ?auto_441294 ) ( POINTING ?auto_441296 ?auto_441295 ) ( not ( = ?auto_441291 ?auto_441295 ) ) ( HAVE_IMAGE ?auto_441293 ?auto_441290 ) ( not ( = ?auto_441293 ?auto_441295 ) ) ( not ( = ?auto_441290 ?auto_441292 ) ) ( CALIBRATION_TARGET ?auto_441294 ?auto_441295 ) ( NOT_CALIBRATED ?auto_441294 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_441293 ?auto_441290 ?auto_441291 ?auto_441292 )
      ( GET-2IMAGE-VERIFY ?auto_441291 ?auto_441292 ?auto_441293 ?auto_441290 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_441943 - DIRECTION
      ?auto_441944 - MODE
    )
    :vars
    (
      ?auto_441949 - DIRECTION
      ?auto_441945 - INSTRUMENT
      ?auto_441948 - SATELLITE
      ?auto_441946 - DIRECTION
      ?auto_441947 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_441943 ?auto_441949 ) ) ( ON_BOARD ?auto_441945 ?auto_441948 ) ( SUPPORTS ?auto_441945 ?auto_441944 ) ( POINTING ?auto_441948 ?auto_441946 ) ( not ( = ?auto_441943 ?auto_441946 ) ) ( HAVE_IMAGE ?auto_441949 ?auto_441947 ) ( not ( = ?auto_441949 ?auto_441946 ) ) ( not ( = ?auto_441947 ?auto_441944 ) ) ( CALIBRATION_TARGET ?auto_441945 ?auto_441946 ) ( POWER_AVAIL ?auto_441948 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_441945 ?auto_441948 )
      ( GET-2IMAGE ?auto_441949 ?auto_441947 ?auto_441943 ?auto_441944 )
      ( GET-1IMAGE-VERIFY ?auto_441943 ?auto_441944 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_441951 - DIRECTION
      ?auto_441952 - MODE
      ?auto_441953 - DIRECTION
      ?auto_441950 - MODE
    )
    :vars
    (
      ?auto_441955 - INSTRUMENT
      ?auto_441954 - SATELLITE
      ?auto_441956 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_441953 ?auto_441951 ) ) ( ON_BOARD ?auto_441955 ?auto_441954 ) ( SUPPORTS ?auto_441955 ?auto_441950 ) ( POINTING ?auto_441954 ?auto_441956 ) ( not ( = ?auto_441953 ?auto_441956 ) ) ( HAVE_IMAGE ?auto_441951 ?auto_441952 ) ( not ( = ?auto_441951 ?auto_441956 ) ) ( not ( = ?auto_441952 ?auto_441950 ) ) ( CALIBRATION_TARGET ?auto_441955 ?auto_441956 ) ( POWER_AVAIL ?auto_441954 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_441953 ?auto_441950 )
      ( GET-2IMAGE-VERIFY ?auto_441951 ?auto_441952 ?auto_441953 ?auto_441950 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_441958 - DIRECTION
      ?auto_441959 - MODE
      ?auto_441960 - DIRECTION
      ?auto_441957 - MODE
    )
    :vars
    (
      ?auto_441963 - INSTRUMENT
      ?auto_441962 - SATELLITE
      ?auto_441961 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_441960 ?auto_441958 ) ) ( ON_BOARD ?auto_441963 ?auto_441962 ) ( SUPPORTS ?auto_441963 ?auto_441959 ) ( POINTING ?auto_441962 ?auto_441961 ) ( not ( = ?auto_441958 ?auto_441961 ) ) ( HAVE_IMAGE ?auto_441960 ?auto_441957 ) ( not ( = ?auto_441960 ?auto_441961 ) ) ( not ( = ?auto_441957 ?auto_441959 ) ) ( CALIBRATION_TARGET ?auto_441963 ?auto_441961 ) ( POWER_AVAIL ?auto_441962 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_441960 ?auto_441957 ?auto_441958 ?auto_441959 )
      ( GET-2IMAGE-VERIFY ?auto_441958 ?auto_441959 ?auto_441960 ?auto_441957 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_442610 - DIRECTION
      ?auto_442611 - MODE
    )
    :vars
    (
      ?auto_442614 - DIRECTION
      ?auto_442616 - INSTRUMENT
      ?auto_442613 - SATELLITE
      ?auto_442612 - DIRECTION
      ?auto_442615 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_442610 ?auto_442614 ) ) ( ON_BOARD ?auto_442616 ?auto_442613 ) ( SUPPORTS ?auto_442616 ?auto_442611 ) ( not ( = ?auto_442610 ?auto_442612 ) ) ( HAVE_IMAGE ?auto_442614 ?auto_442615 ) ( not ( = ?auto_442614 ?auto_442612 ) ) ( not ( = ?auto_442615 ?auto_442611 ) ) ( CALIBRATION_TARGET ?auto_442616 ?auto_442612 ) ( POWER_AVAIL ?auto_442613 ) ( POINTING ?auto_442613 ?auto_442614 ) )
    :subtasks
    ( ( !TURN_TO ?auto_442613 ?auto_442612 ?auto_442614 )
      ( GET-2IMAGE ?auto_442614 ?auto_442615 ?auto_442610 ?auto_442611 )
      ( GET-1IMAGE-VERIFY ?auto_442610 ?auto_442611 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_442618 - DIRECTION
      ?auto_442619 - MODE
      ?auto_442620 - DIRECTION
      ?auto_442617 - MODE
    )
    :vars
    (
      ?auto_442622 - INSTRUMENT
      ?auto_442623 - SATELLITE
      ?auto_442621 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_442620 ?auto_442618 ) ) ( ON_BOARD ?auto_442622 ?auto_442623 ) ( SUPPORTS ?auto_442622 ?auto_442617 ) ( not ( = ?auto_442620 ?auto_442621 ) ) ( HAVE_IMAGE ?auto_442618 ?auto_442619 ) ( not ( = ?auto_442618 ?auto_442621 ) ) ( not ( = ?auto_442619 ?auto_442617 ) ) ( CALIBRATION_TARGET ?auto_442622 ?auto_442621 ) ( POWER_AVAIL ?auto_442623 ) ( POINTING ?auto_442623 ?auto_442618 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_442620 ?auto_442617 )
      ( GET-2IMAGE-VERIFY ?auto_442618 ?auto_442619 ?auto_442620 ?auto_442617 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_442625 - DIRECTION
      ?auto_442626 - MODE
      ?auto_442627 - DIRECTION
      ?auto_442624 - MODE
    )
    :vars
    (
      ?auto_442629 - INSTRUMENT
      ?auto_442630 - SATELLITE
      ?auto_442628 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_442627 ?auto_442625 ) ) ( ON_BOARD ?auto_442629 ?auto_442630 ) ( SUPPORTS ?auto_442629 ?auto_442626 ) ( not ( = ?auto_442625 ?auto_442628 ) ) ( HAVE_IMAGE ?auto_442627 ?auto_442624 ) ( not ( = ?auto_442627 ?auto_442628 ) ) ( not ( = ?auto_442624 ?auto_442626 ) ) ( CALIBRATION_TARGET ?auto_442629 ?auto_442628 ) ( POWER_AVAIL ?auto_442630 ) ( POINTING ?auto_442630 ?auto_442627 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_442627 ?auto_442624 ?auto_442625 ?auto_442626 )
      ( GET-2IMAGE-VERIFY ?auto_442625 ?auto_442626 ?auto_442627 ?auto_442624 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_443277 - DIRECTION
      ?auto_443278 - MODE
    )
    :vars
    (
      ?auto_443283 - DIRECTION
      ?auto_443280 - INSTRUMENT
      ?auto_443282 - SATELLITE
      ?auto_443279 - DIRECTION
      ?auto_443281 - MODE
      ?auto_443284 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_443277 ?auto_443283 ) ) ( ON_BOARD ?auto_443280 ?auto_443282 ) ( SUPPORTS ?auto_443280 ?auto_443278 ) ( not ( = ?auto_443277 ?auto_443279 ) ) ( HAVE_IMAGE ?auto_443283 ?auto_443281 ) ( not ( = ?auto_443283 ?auto_443279 ) ) ( not ( = ?auto_443281 ?auto_443278 ) ) ( CALIBRATION_TARGET ?auto_443280 ?auto_443279 ) ( POINTING ?auto_443282 ?auto_443283 ) ( ON_BOARD ?auto_443284 ?auto_443282 ) ( POWER_ON ?auto_443284 ) ( not ( = ?auto_443280 ?auto_443284 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_443284 ?auto_443282 )
      ( GET-2IMAGE ?auto_443283 ?auto_443281 ?auto_443277 ?auto_443278 )
      ( GET-1IMAGE-VERIFY ?auto_443277 ?auto_443278 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_443286 - DIRECTION
      ?auto_443287 - MODE
      ?auto_443288 - DIRECTION
      ?auto_443285 - MODE
    )
    :vars
    (
      ?auto_443291 - INSTRUMENT
      ?auto_443292 - SATELLITE
      ?auto_443289 - DIRECTION
      ?auto_443290 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_443288 ?auto_443286 ) ) ( ON_BOARD ?auto_443291 ?auto_443292 ) ( SUPPORTS ?auto_443291 ?auto_443285 ) ( not ( = ?auto_443288 ?auto_443289 ) ) ( HAVE_IMAGE ?auto_443286 ?auto_443287 ) ( not ( = ?auto_443286 ?auto_443289 ) ) ( not ( = ?auto_443287 ?auto_443285 ) ) ( CALIBRATION_TARGET ?auto_443291 ?auto_443289 ) ( POINTING ?auto_443292 ?auto_443286 ) ( ON_BOARD ?auto_443290 ?auto_443292 ) ( POWER_ON ?auto_443290 ) ( not ( = ?auto_443291 ?auto_443290 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_443288 ?auto_443285 )
      ( GET-2IMAGE-VERIFY ?auto_443286 ?auto_443287 ?auto_443288 ?auto_443285 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_443294 - DIRECTION
      ?auto_443295 - MODE
      ?auto_443296 - DIRECTION
      ?auto_443293 - MODE
    )
    :vars
    (
      ?auto_443298 - INSTRUMENT
      ?auto_443300 - SATELLITE
      ?auto_443299 - DIRECTION
      ?auto_443297 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_443296 ?auto_443294 ) ) ( ON_BOARD ?auto_443298 ?auto_443300 ) ( SUPPORTS ?auto_443298 ?auto_443295 ) ( not ( = ?auto_443294 ?auto_443299 ) ) ( HAVE_IMAGE ?auto_443296 ?auto_443293 ) ( not ( = ?auto_443296 ?auto_443299 ) ) ( not ( = ?auto_443293 ?auto_443295 ) ) ( CALIBRATION_TARGET ?auto_443298 ?auto_443299 ) ( POINTING ?auto_443300 ?auto_443296 ) ( ON_BOARD ?auto_443297 ?auto_443300 ) ( POWER_ON ?auto_443297 ) ( not ( = ?auto_443298 ?auto_443297 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_443296 ?auto_443293 ?auto_443294 ?auto_443295 )
      ( GET-2IMAGE-VERIFY ?auto_443294 ?auto_443295 ?auto_443296 ?auto_443293 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_444001 - DIRECTION
      ?auto_444002 - MODE
    )
    :vars
    (
      ?auto_444003 - DIRECTION
      ?auto_444006 - INSTRUMENT
      ?auto_444008 - SATELLITE
      ?auto_444007 - DIRECTION
      ?auto_444004 - MODE
      ?auto_444005 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_444001 ?auto_444003 ) ) ( ON_BOARD ?auto_444006 ?auto_444008 ) ( SUPPORTS ?auto_444006 ?auto_444002 ) ( not ( = ?auto_444001 ?auto_444007 ) ) ( not ( = ?auto_444003 ?auto_444007 ) ) ( not ( = ?auto_444004 ?auto_444002 ) ) ( CALIBRATION_TARGET ?auto_444006 ?auto_444007 ) ( POINTING ?auto_444008 ?auto_444003 ) ( ON_BOARD ?auto_444005 ?auto_444008 ) ( POWER_ON ?auto_444005 ) ( not ( = ?auto_444006 ?auto_444005 ) ) ( CALIBRATED ?auto_444005 ) ( SUPPORTS ?auto_444005 ?auto_444004 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_444003 ?auto_444004 )
      ( GET-2IMAGE ?auto_444003 ?auto_444004 ?auto_444001 ?auto_444002 )
      ( GET-1IMAGE-VERIFY ?auto_444001 ?auto_444002 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_444010 - DIRECTION
      ?auto_444011 - MODE
      ?auto_444012 - DIRECTION
      ?auto_444009 - MODE
    )
    :vars
    (
      ?auto_444014 - INSTRUMENT
      ?auto_444016 - SATELLITE
      ?auto_444013 - DIRECTION
      ?auto_444015 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_444012 ?auto_444010 ) ) ( ON_BOARD ?auto_444014 ?auto_444016 ) ( SUPPORTS ?auto_444014 ?auto_444009 ) ( not ( = ?auto_444012 ?auto_444013 ) ) ( not ( = ?auto_444010 ?auto_444013 ) ) ( not ( = ?auto_444011 ?auto_444009 ) ) ( CALIBRATION_TARGET ?auto_444014 ?auto_444013 ) ( POINTING ?auto_444016 ?auto_444010 ) ( ON_BOARD ?auto_444015 ?auto_444016 ) ( POWER_ON ?auto_444015 ) ( not ( = ?auto_444014 ?auto_444015 ) ) ( CALIBRATED ?auto_444015 ) ( SUPPORTS ?auto_444015 ?auto_444011 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_444012 ?auto_444009 )
      ( GET-2IMAGE-VERIFY ?auto_444010 ?auto_444011 ?auto_444012 ?auto_444009 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_444018 - DIRECTION
      ?auto_444019 - MODE
      ?auto_444020 - DIRECTION
      ?auto_444017 - MODE
    )
    :vars
    (
      ?auto_444022 - INSTRUMENT
      ?auto_444021 - SATELLITE
      ?auto_444024 - DIRECTION
      ?auto_444023 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_444020 ?auto_444018 ) ) ( ON_BOARD ?auto_444022 ?auto_444021 ) ( SUPPORTS ?auto_444022 ?auto_444019 ) ( not ( = ?auto_444018 ?auto_444024 ) ) ( not ( = ?auto_444020 ?auto_444024 ) ) ( not ( = ?auto_444017 ?auto_444019 ) ) ( CALIBRATION_TARGET ?auto_444022 ?auto_444024 ) ( POINTING ?auto_444021 ?auto_444020 ) ( ON_BOARD ?auto_444023 ?auto_444021 ) ( POWER_ON ?auto_444023 ) ( not ( = ?auto_444022 ?auto_444023 ) ) ( CALIBRATED ?auto_444023 ) ( SUPPORTS ?auto_444023 ?auto_444017 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_444020 ?auto_444017 ?auto_444018 ?auto_444019 )
      ( GET-2IMAGE-VERIFY ?auto_444018 ?auto_444019 ?auto_444020 ?auto_444017 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_444725 - DIRECTION
      ?auto_444726 - MODE
    )
    :vars
    (
      ?auto_444732 - DIRECTION
      ?auto_444728 - INSTRUMENT
      ?auto_444727 - SATELLITE
      ?auto_444731 - DIRECTION
      ?auto_444729 - MODE
      ?auto_444730 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_444725 ?auto_444732 ) ) ( ON_BOARD ?auto_444728 ?auto_444727 ) ( SUPPORTS ?auto_444728 ?auto_444726 ) ( not ( = ?auto_444725 ?auto_444731 ) ) ( not ( = ?auto_444732 ?auto_444731 ) ) ( not ( = ?auto_444729 ?auto_444726 ) ) ( CALIBRATION_TARGET ?auto_444728 ?auto_444731 ) ( ON_BOARD ?auto_444730 ?auto_444727 ) ( POWER_ON ?auto_444730 ) ( not ( = ?auto_444728 ?auto_444730 ) ) ( CALIBRATED ?auto_444730 ) ( SUPPORTS ?auto_444730 ?auto_444729 ) ( POINTING ?auto_444727 ?auto_444731 ) )
    :subtasks
    ( ( !TURN_TO ?auto_444727 ?auto_444732 ?auto_444731 )
      ( GET-2IMAGE ?auto_444732 ?auto_444729 ?auto_444725 ?auto_444726 )
      ( GET-1IMAGE-VERIFY ?auto_444725 ?auto_444726 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_444734 - DIRECTION
      ?auto_444735 - MODE
      ?auto_444736 - DIRECTION
      ?auto_444733 - MODE
    )
    :vars
    (
      ?auto_444738 - INSTRUMENT
      ?auto_444737 - SATELLITE
      ?auto_444739 - DIRECTION
      ?auto_444740 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_444736 ?auto_444734 ) ) ( ON_BOARD ?auto_444738 ?auto_444737 ) ( SUPPORTS ?auto_444738 ?auto_444733 ) ( not ( = ?auto_444736 ?auto_444739 ) ) ( not ( = ?auto_444734 ?auto_444739 ) ) ( not ( = ?auto_444735 ?auto_444733 ) ) ( CALIBRATION_TARGET ?auto_444738 ?auto_444739 ) ( ON_BOARD ?auto_444740 ?auto_444737 ) ( POWER_ON ?auto_444740 ) ( not ( = ?auto_444738 ?auto_444740 ) ) ( CALIBRATED ?auto_444740 ) ( SUPPORTS ?auto_444740 ?auto_444735 ) ( POINTING ?auto_444737 ?auto_444739 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_444736 ?auto_444733 )
      ( GET-2IMAGE-VERIFY ?auto_444734 ?auto_444735 ?auto_444736 ?auto_444733 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_444742 - DIRECTION
      ?auto_444743 - MODE
      ?auto_444744 - DIRECTION
      ?auto_444741 - MODE
    )
    :vars
    (
      ?auto_444745 - INSTRUMENT
      ?auto_444746 - SATELLITE
      ?auto_444747 - DIRECTION
      ?auto_444748 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_444744 ?auto_444742 ) ) ( ON_BOARD ?auto_444745 ?auto_444746 ) ( SUPPORTS ?auto_444745 ?auto_444743 ) ( not ( = ?auto_444742 ?auto_444747 ) ) ( not ( = ?auto_444744 ?auto_444747 ) ) ( not ( = ?auto_444741 ?auto_444743 ) ) ( CALIBRATION_TARGET ?auto_444745 ?auto_444747 ) ( ON_BOARD ?auto_444748 ?auto_444746 ) ( POWER_ON ?auto_444748 ) ( not ( = ?auto_444745 ?auto_444748 ) ) ( CALIBRATED ?auto_444748 ) ( SUPPORTS ?auto_444748 ?auto_444741 ) ( POINTING ?auto_444746 ?auto_444747 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_444744 ?auto_444741 ?auto_444742 ?auto_444743 )
      ( GET-2IMAGE-VERIFY ?auto_444742 ?auto_444743 ?auto_444744 ?auto_444741 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_445449 - DIRECTION
      ?auto_445450 - MODE
    )
    :vars
    (
      ?auto_445454 - DIRECTION
      ?auto_445452 - INSTRUMENT
      ?auto_445453 - SATELLITE
      ?auto_445455 - DIRECTION
      ?auto_445451 - MODE
      ?auto_445456 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_445449 ?auto_445454 ) ) ( ON_BOARD ?auto_445452 ?auto_445453 ) ( SUPPORTS ?auto_445452 ?auto_445450 ) ( not ( = ?auto_445449 ?auto_445455 ) ) ( not ( = ?auto_445454 ?auto_445455 ) ) ( not ( = ?auto_445451 ?auto_445450 ) ) ( CALIBRATION_TARGET ?auto_445452 ?auto_445455 ) ( ON_BOARD ?auto_445456 ?auto_445453 ) ( POWER_ON ?auto_445456 ) ( not ( = ?auto_445452 ?auto_445456 ) ) ( SUPPORTS ?auto_445456 ?auto_445451 ) ( POINTING ?auto_445453 ?auto_445455 ) ( CALIBRATION_TARGET ?auto_445456 ?auto_445455 ) ( NOT_CALIBRATED ?auto_445456 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_445453 ?auto_445456 ?auto_445455 )
      ( GET-2IMAGE ?auto_445454 ?auto_445451 ?auto_445449 ?auto_445450 )
      ( GET-1IMAGE-VERIFY ?auto_445449 ?auto_445450 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_445458 - DIRECTION
      ?auto_445459 - MODE
      ?auto_445460 - DIRECTION
      ?auto_445457 - MODE
    )
    :vars
    (
      ?auto_445463 - INSTRUMENT
      ?auto_445461 - SATELLITE
      ?auto_445464 - DIRECTION
      ?auto_445462 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_445460 ?auto_445458 ) ) ( ON_BOARD ?auto_445463 ?auto_445461 ) ( SUPPORTS ?auto_445463 ?auto_445457 ) ( not ( = ?auto_445460 ?auto_445464 ) ) ( not ( = ?auto_445458 ?auto_445464 ) ) ( not ( = ?auto_445459 ?auto_445457 ) ) ( CALIBRATION_TARGET ?auto_445463 ?auto_445464 ) ( ON_BOARD ?auto_445462 ?auto_445461 ) ( POWER_ON ?auto_445462 ) ( not ( = ?auto_445463 ?auto_445462 ) ) ( SUPPORTS ?auto_445462 ?auto_445459 ) ( POINTING ?auto_445461 ?auto_445464 ) ( CALIBRATION_TARGET ?auto_445462 ?auto_445464 ) ( NOT_CALIBRATED ?auto_445462 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_445460 ?auto_445457 )
      ( GET-2IMAGE-VERIFY ?auto_445458 ?auto_445459 ?auto_445460 ?auto_445457 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_445466 - DIRECTION
      ?auto_445467 - MODE
      ?auto_445468 - DIRECTION
      ?auto_445465 - MODE
    )
    :vars
    (
      ?auto_445471 - INSTRUMENT
      ?auto_445469 - SATELLITE
      ?auto_445472 - DIRECTION
      ?auto_445470 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_445468 ?auto_445466 ) ) ( ON_BOARD ?auto_445471 ?auto_445469 ) ( SUPPORTS ?auto_445471 ?auto_445467 ) ( not ( = ?auto_445466 ?auto_445472 ) ) ( not ( = ?auto_445468 ?auto_445472 ) ) ( not ( = ?auto_445465 ?auto_445467 ) ) ( CALIBRATION_TARGET ?auto_445471 ?auto_445472 ) ( ON_BOARD ?auto_445470 ?auto_445469 ) ( POWER_ON ?auto_445470 ) ( not ( = ?auto_445471 ?auto_445470 ) ) ( SUPPORTS ?auto_445470 ?auto_445465 ) ( POINTING ?auto_445469 ?auto_445472 ) ( CALIBRATION_TARGET ?auto_445470 ?auto_445472 ) ( NOT_CALIBRATED ?auto_445470 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_445468 ?auto_445465 ?auto_445466 ?auto_445467 )
      ( GET-2IMAGE-VERIFY ?auto_445466 ?auto_445467 ?auto_445468 ?auto_445465 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_450342 - DIRECTION
      ?auto_450343 - MODE
      ?auto_450344 - DIRECTION
      ?auto_450341 - MODE
      ?auto_450346 - DIRECTION
      ?auto_450345 - MODE
    )
    :vars
    (
      ?auto_450348 - INSTRUMENT
      ?auto_450347 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_450344 ?auto_450342 ) ) ( not ( = ?auto_450346 ?auto_450342 ) ) ( not ( = ?auto_450346 ?auto_450344 ) ) ( CALIBRATED ?auto_450348 ) ( ON_BOARD ?auto_450348 ?auto_450347 ) ( SUPPORTS ?auto_450348 ?auto_450345 ) ( POWER_ON ?auto_450348 ) ( POINTING ?auto_450347 ?auto_450346 ) ( HAVE_IMAGE ?auto_450342 ?auto_450343 ) ( HAVE_IMAGE ?auto_450344 ?auto_450341 ) ( not ( = ?auto_450343 ?auto_450341 ) ) ( not ( = ?auto_450343 ?auto_450345 ) ) ( not ( = ?auto_450341 ?auto_450345 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_450346 ?auto_450345 )
      ( GET-3IMAGE-VERIFY ?auto_450342 ?auto_450343 ?auto_450344 ?auto_450341 ?auto_450346 ?auto_450345 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_450358 - DIRECTION
      ?auto_450359 - MODE
      ?auto_450360 - DIRECTION
      ?auto_450357 - MODE
      ?auto_450362 - DIRECTION
      ?auto_450361 - MODE
    )
    :vars
    (
      ?auto_450364 - INSTRUMENT
      ?auto_450363 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_450360 ?auto_450358 ) ) ( not ( = ?auto_450362 ?auto_450358 ) ) ( not ( = ?auto_450362 ?auto_450360 ) ) ( CALIBRATED ?auto_450364 ) ( ON_BOARD ?auto_450364 ?auto_450363 ) ( SUPPORTS ?auto_450364 ?auto_450357 ) ( POWER_ON ?auto_450364 ) ( POINTING ?auto_450363 ?auto_450360 ) ( HAVE_IMAGE ?auto_450358 ?auto_450359 ) ( HAVE_IMAGE ?auto_450362 ?auto_450361 ) ( not ( = ?auto_450359 ?auto_450357 ) ) ( not ( = ?auto_450359 ?auto_450361 ) ) ( not ( = ?auto_450357 ?auto_450361 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_450360 ?auto_450357 )
      ( GET-3IMAGE-VERIFY ?auto_450358 ?auto_450359 ?auto_450360 ?auto_450357 ?auto_450362 ?auto_450361 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_450418 - DIRECTION
      ?auto_450419 - MODE
      ?auto_450420 - DIRECTION
      ?auto_450417 - MODE
      ?auto_450422 - DIRECTION
      ?auto_450421 - MODE
    )
    :vars
    (
      ?auto_450424 - INSTRUMENT
      ?auto_450423 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_450420 ?auto_450418 ) ) ( not ( = ?auto_450422 ?auto_450418 ) ) ( not ( = ?auto_450422 ?auto_450420 ) ) ( CALIBRATED ?auto_450424 ) ( ON_BOARD ?auto_450424 ?auto_450423 ) ( SUPPORTS ?auto_450424 ?auto_450419 ) ( POWER_ON ?auto_450424 ) ( POINTING ?auto_450423 ?auto_450418 ) ( HAVE_IMAGE ?auto_450420 ?auto_450417 ) ( HAVE_IMAGE ?auto_450422 ?auto_450421 ) ( not ( = ?auto_450419 ?auto_450417 ) ) ( not ( = ?auto_450419 ?auto_450421 ) ) ( not ( = ?auto_450417 ?auto_450421 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_450418 ?auto_450419 )
      ( GET-3IMAGE-VERIFY ?auto_450418 ?auto_450419 ?auto_450420 ?auto_450417 ?auto_450422 ?auto_450421 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_453707 - DIRECTION
      ?auto_453708 - MODE
      ?auto_453709 - DIRECTION
      ?auto_453706 - MODE
      ?auto_453711 - DIRECTION
      ?auto_453710 - MODE
    )
    :vars
    (
      ?auto_453713 - INSTRUMENT
      ?auto_453714 - SATELLITE
      ?auto_453712 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_453709 ?auto_453707 ) ) ( not ( = ?auto_453711 ?auto_453707 ) ) ( not ( = ?auto_453711 ?auto_453709 ) ) ( CALIBRATED ?auto_453713 ) ( ON_BOARD ?auto_453713 ?auto_453714 ) ( SUPPORTS ?auto_453713 ?auto_453710 ) ( POWER_ON ?auto_453713 ) ( POINTING ?auto_453714 ?auto_453712 ) ( not ( = ?auto_453711 ?auto_453712 ) ) ( HAVE_IMAGE ?auto_453707 ?auto_453708 ) ( not ( = ?auto_453707 ?auto_453712 ) ) ( not ( = ?auto_453708 ?auto_453710 ) ) ( HAVE_IMAGE ?auto_453709 ?auto_453706 ) ( not ( = ?auto_453708 ?auto_453706 ) ) ( not ( = ?auto_453709 ?auto_453712 ) ) ( not ( = ?auto_453706 ?auto_453710 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_453707 ?auto_453708 ?auto_453711 ?auto_453710 )
      ( GET-3IMAGE-VERIFY ?auto_453707 ?auto_453708 ?auto_453709 ?auto_453706 ?auto_453711 ?auto_453710 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_453725 - DIRECTION
      ?auto_453726 - MODE
      ?auto_453727 - DIRECTION
      ?auto_453724 - MODE
      ?auto_453729 - DIRECTION
      ?auto_453728 - MODE
    )
    :vars
    (
      ?auto_453731 - INSTRUMENT
      ?auto_453732 - SATELLITE
      ?auto_453730 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_453727 ?auto_453725 ) ) ( not ( = ?auto_453729 ?auto_453725 ) ) ( not ( = ?auto_453729 ?auto_453727 ) ) ( CALIBRATED ?auto_453731 ) ( ON_BOARD ?auto_453731 ?auto_453732 ) ( SUPPORTS ?auto_453731 ?auto_453724 ) ( POWER_ON ?auto_453731 ) ( POINTING ?auto_453732 ?auto_453730 ) ( not ( = ?auto_453727 ?auto_453730 ) ) ( HAVE_IMAGE ?auto_453725 ?auto_453726 ) ( not ( = ?auto_453725 ?auto_453730 ) ) ( not ( = ?auto_453726 ?auto_453724 ) ) ( HAVE_IMAGE ?auto_453729 ?auto_453728 ) ( not ( = ?auto_453726 ?auto_453728 ) ) ( not ( = ?auto_453724 ?auto_453728 ) ) ( not ( = ?auto_453729 ?auto_453730 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_453725 ?auto_453726 ?auto_453727 ?auto_453724 )
      ( GET-3IMAGE-VERIFY ?auto_453725 ?auto_453726 ?auto_453727 ?auto_453724 ?auto_453729 ?auto_453728 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_453797 - DIRECTION
      ?auto_453798 - MODE
      ?auto_453799 - DIRECTION
      ?auto_453796 - MODE
      ?auto_453801 - DIRECTION
      ?auto_453800 - MODE
    )
    :vars
    (
      ?auto_453803 - INSTRUMENT
      ?auto_453804 - SATELLITE
      ?auto_453802 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_453799 ?auto_453797 ) ) ( not ( = ?auto_453801 ?auto_453797 ) ) ( not ( = ?auto_453801 ?auto_453799 ) ) ( CALIBRATED ?auto_453803 ) ( ON_BOARD ?auto_453803 ?auto_453804 ) ( SUPPORTS ?auto_453803 ?auto_453798 ) ( POWER_ON ?auto_453803 ) ( POINTING ?auto_453804 ?auto_453802 ) ( not ( = ?auto_453797 ?auto_453802 ) ) ( HAVE_IMAGE ?auto_453799 ?auto_453796 ) ( not ( = ?auto_453799 ?auto_453802 ) ) ( not ( = ?auto_453796 ?auto_453798 ) ) ( HAVE_IMAGE ?auto_453801 ?auto_453800 ) ( not ( = ?auto_453798 ?auto_453800 ) ) ( not ( = ?auto_453796 ?auto_453800 ) ) ( not ( = ?auto_453801 ?auto_453802 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_453799 ?auto_453796 ?auto_453797 ?auto_453798 )
      ( GET-3IMAGE-VERIFY ?auto_453797 ?auto_453798 ?auto_453799 ?auto_453796 ?auto_453801 ?auto_453800 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_457471 - DIRECTION
      ?auto_457472 - MODE
      ?auto_457473 - DIRECTION
      ?auto_457470 - MODE
      ?auto_457475 - DIRECTION
      ?auto_457474 - MODE
    )
    :vars
    (
      ?auto_457476 - INSTRUMENT
      ?auto_457477 - SATELLITE
      ?auto_457478 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_457473 ?auto_457471 ) ) ( not ( = ?auto_457475 ?auto_457471 ) ) ( not ( = ?auto_457475 ?auto_457473 ) ) ( ON_BOARD ?auto_457476 ?auto_457477 ) ( SUPPORTS ?auto_457476 ?auto_457474 ) ( POWER_ON ?auto_457476 ) ( POINTING ?auto_457477 ?auto_457478 ) ( not ( = ?auto_457475 ?auto_457478 ) ) ( HAVE_IMAGE ?auto_457471 ?auto_457472 ) ( not ( = ?auto_457471 ?auto_457478 ) ) ( not ( = ?auto_457472 ?auto_457474 ) ) ( CALIBRATION_TARGET ?auto_457476 ?auto_457478 ) ( NOT_CALIBRATED ?auto_457476 ) ( HAVE_IMAGE ?auto_457473 ?auto_457470 ) ( not ( = ?auto_457472 ?auto_457470 ) ) ( not ( = ?auto_457473 ?auto_457478 ) ) ( not ( = ?auto_457470 ?auto_457474 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_457471 ?auto_457472 ?auto_457475 ?auto_457474 )
      ( GET-3IMAGE-VERIFY ?auto_457471 ?auto_457472 ?auto_457473 ?auto_457470 ?auto_457475 ?auto_457474 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_457489 - DIRECTION
      ?auto_457490 - MODE
      ?auto_457491 - DIRECTION
      ?auto_457488 - MODE
      ?auto_457493 - DIRECTION
      ?auto_457492 - MODE
    )
    :vars
    (
      ?auto_457494 - INSTRUMENT
      ?auto_457495 - SATELLITE
      ?auto_457496 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_457491 ?auto_457489 ) ) ( not ( = ?auto_457493 ?auto_457489 ) ) ( not ( = ?auto_457493 ?auto_457491 ) ) ( ON_BOARD ?auto_457494 ?auto_457495 ) ( SUPPORTS ?auto_457494 ?auto_457488 ) ( POWER_ON ?auto_457494 ) ( POINTING ?auto_457495 ?auto_457496 ) ( not ( = ?auto_457491 ?auto_457496 ) ) ( HAVE_IMAGE ?auto_457489 ?auto_457490 ) ( not ( = ?auto_457489 ?auto_457496 ) ) ( not ( = ?auto_457490 ?auto_457488 ) ) ( CALIBRATION_TARGET ?auto_457494 ?auto_457496 ) ( NOT_CALIBRATED ?auto_457494 ) ( HAVE_IMAGE ?auto_457493 ?auto_457492 ) ( not ( = ?auto_457490 ?auto_457492 ) ) ( not ( = ?auto_457488 ?auto_457492 ) ) ( not ( = ?auto_457493 ?auto_457496 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_457489 ?auto_457490 ?auto_457491 ?auto_457488 )
      ( GET-3IMAGE-VERIFY ?auto_457489 ?auto_457490 ?auto_457491 ?auto_457488 ?auto_457493 ?auto_457492 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_457561 - DIRECTION
      ?auto_457562 - MODE
      ?auto_457563 - DIRECTION
      ?auto_457560 - MODE
      ?auto_457565 - DIRECTION
      ?auto_457564 - MODE
    )
    :vars
    (
      ?auto_457566 - INSTRUMENT
      ?auto_457567 - SATELLITE
      ?auto_457568 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_457563 ?auto_457561 ) ) ( not ( = ?auto_457565 ?auto_457561 ) ) ( not ( = ?auto_457565 ?auto_457563 ) ) ( ON_BOARD ?auto_457566 ?auto_457567 ) ( SUPPORTS ?auto_457566 ?auto_457562 ) ( POWER_ON ?auto_457566 ) ( POINTING ?auto_457567 ?auto_457568 ) ( not ( = ?auto_457561 ?auto_457568 ) ) ( HAVE_IMAGE ?auto_457563 ?auto_457560 ) ( not ( = ?auto_457563 ?auto_457568 ) ) ( not ( = ?auto_457560 ?auto_457562 ) ) ( CALIBRATION_TARGET ?auto_457566 ?auto_457568 ) ( NOT_CALIBRATED ?auto_457566 ) ( HAVE_IMAGE ?auto_457565 ?auto_457564 ) ( not ( = ?auto_457562 ?auto_457564 ) ) ( not ( = ?auto_457560 ?auto_457564 ) ) ( not ( = ?auto_457565 ?auto_457568 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_457563 ?auto_457560 ?auto_457561 ?auto_457562 )
      ( GET-3IMAGE-VERIFY ?auto_457561 ?auto_457562 ?auto_457563 ?auto_457560 ?auto_457565 ?auto_457564 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_461235 - DIRECTION
      ?auto_461236 - MODE
      ?auto_461237 - DIRECTION
      ?auto_461234 - MODE
      ?auto_461239 - DIRECTION
      ?auto_461238 - MODE
    )
    :vars
    (
      ?auto_461240 - INSTRUMENT
      ?auto_461241 - SATELLITE
      ?auto_461242 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_461237 ?auto_461235 ) ) ( not ( = ?auto_461239 ?auto_461235 ) ) ( not ( = ?auto_461239 ?auto_461237 ) ) ( ON_BOARD ?auto_461240 ?auto_461241 ) ( SUPPORTS ?auto_461240 ?auto_461238 ) ( POINTING ?auto_461241 ?auto_461242 ) ( not ( = ?auto_461239 ?auto_461242 ) ) ( HAVE_IMAGE ?auto_461235 ?auto_461236 ) ( not ( = ?auto_461235 ?auto_461242 ) ) ( not ( = ?auto_461236 ?auto_461238 ) ) ( CALIBRATION_TARGET ?auto_461240 ?auto_461242 ) ( POWER_AVAIL ?auto_461241 ) ( HAVE_IMAGE ?auto_461237 ?auto_461234 ) ( not ( = ?auto_461236 ?auto_461234 ) ) ( not ( = ?auto_461237 ?auto_461242 ) ) ( not ( = ?auto_461234 ?auto_461238 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_461235 ?auto_461236 ?auto_461239 ?auto_461238 )
      ( GET-3IMAGE-VERIFY ?auto_461235 ?auto_461236 ?auto_461237 ?auto_461234 ?auto_461239 ?auto_461238 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_461253 - DIRECTION
      ?auto_461254 - MODE
      ?auto_461255 - DIRECTION
      ?auto_461252 - MODE
      ?auto_461257 - DIRECTION
      ?auto_461256 - MODE
    )
    :vars
    (
      ?auto_461258 - INSTRUMENT
      ?auto_461259 - SATELLITE
      ?auto_461260 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_461255 ?auto_461253 ) ) ( not ( = ?auto_461257 ?auto_461253 ) ) ( not ( = ?auto_461257 ?auto_461255 ) ) ( ON_BOARD ?auto_461258 ?auto_461259 ) ( SUPPORTS ?auto_461258 ?auto_461252 ) ( POINTING ?auto_461259 ?auto_461260 ) ( not ( = ?auto_461255 ?auto_461260 ) ) ( HAVE_IMAGE ?auto_461253 ?auto_461254 ) ( not ( = ?auto_461253 ?auto_461260 ) ) ( not ( = ?auto_461254 ?auto_461252 ) ) ( CALIBRATION_TARGET ?auto_461258 ?auto_461260 ) ( POWER_AVAIL ?auto_461259 ) ( HAVE_IMAGE ?auto_461257 ?auto_461256 ) ( not ( = ?auto_461254 ?auto_461256 ) ) ( not ( = ?auto_461252 ?auto_461256 ) ) ( not ( = ?auto_461257 ?auto_461260 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_461253 ?auto_461254 ?auto_461255 ?auto_461252 )
      ( GET-3IMAGE-VERIFY ?auto_461253 ?auto_461254 ?auto_461255 ?auto_461252 ?auto_461257 ?auto_461256 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_461325 - DIRECTION
      ?auto_461326 - MODE
      ?auto_461327 - DIRECTION
      ?auto_461324 - MODE
      ?auto_461329 - DIRECTION
      ?auto_461328 - MODE
    )
    :vars
    (
      ?auto_461330 - INSTRUMENT
      ?auto_461331 - SATELLITE
      ?auto_461332 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_461327 ?auto_461325 ) ) ( not ( = ?auto_461329 ?auto_461325 ) ) ( not ( = ?auto_461329 ?auto_461327 ) ) ( ON_BOARD ?auto_461330 ?auto_461331 ) ( SUPPORTS ?auto_461330 ?auto_461326 ) ( POINTING ?auto_461331 ?auto_461332 ) ( not ( = ?auto_461325 ?auto_461332 ) ) ( HAVE_IMAGE ?auto_461327 ?auto_461324 ) ( not ( = ?auto_461327 ?auto_461332 ) ) ( not ( = ?auto_461324 ?auto_461326 ) ) ( CALIBRATION_TARGET ?auto_461330 ?auto_461332 ) ( POWER_AVAIL ?auto_461331 ) ( HAVE_IMAGE ?auto_461329 ?auto_461328 ) ( not ( = ?auto_461326 ?auto_461328 ) ) ( not ( = ?auto_461324 ?auto_461328 ) ) ( not ( = ?auto_461329 ?auto_461332 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_461327 ?auto_461324 ?auto_461325 ?auto_461326 )
      ( GET-3IMAGE-VERIFY ?auto_461325 ?auto_461326 ?auto_461327 ?auto_461324 ?auto_461329 ?auto_461328 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_464951 - DIRECTION
      ?auto_464952 - MODE
    )
    :vars
    (
      ?auto_464955 - DIRECTION
      ?auto_464953 - INSTRUMENT
      ?auto_464954 - SATELLITE
      ?auto_464957 - DIRECTION
      ?auto_464956 - MODE
      ?auto_464958 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_464951 ?auto_464955 ) ) ( ON_BOARD ?auto_464953 ?auto_464954 ) ( SUPPORTS ?auto_464953 ?auto_464952 ) ( not ( = ?auto_464951 ?auto_464957 ) ) ( HAVE_IMAGE ?auto_464955 ?auto_464956 ) ( not ( = ?auto_464955 ?auto_464957 ) ) ( not ( = ?auto_464956 ?auto_464952 ) ) ( CALIBRATION_TARGET ?auto_464953 ?auto_464957 ) ( POWER_AVAIL ?auto_464954 ) ( POINTING ?auto_464954 ?auto_464958 ) ( not ( = ?auto_464957 ?auto_464958 ) ) ( not ( = ?auto_464951 ?auto_464958 ) ) ( not ( = ?auto_464955 ?auto_464958 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_464954 ?auto_464957 ?auto_464958 )
      ( GET-2IMAGE ?auto_464955 ?auto_464956 ?auto_464951 ?auto_464952 )
      ( GET-1IMAGE-VERIFY ?auto_464951 ?auto_464952 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_464960 - DIRECTION
      ?auto_464961 - MODE
      ?auto_464962 - DIRECTION
      ?auto_464959 - MODE
    )
    :vars
    (
      ?auto_464966 - INSTRUMENT
      ?auto_464963 - SATELLITE
      ?auto_464965 - DIRECTION
      ?auto_464964 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_464962 ?auto_464960 ) ) ( ON_BOARD ?auto_464966 ?auto_464963 ) ( SUPPORTS ?auto_464966 ?auto_464959 ) ( not ( = ?auto_464962 ?auto_464965 ) ) ( HAVE_IMAGE ?auto_464960 ?auto_464961 ) ( not ( = ?auto_464960 ?auto_464965 ) ) ( not ( = ?auto_464961 ?auto_464959 ) ) ( CALIBRATION_TARGET ?auto_464966 ?auto_464965 ) ( POWER_AVAIL ?auto_464963 ) ( POINTING ?auto_464963 ?auto_464964 ) ( not ( = ?auto_464965 ?auto_464964 ) ) ( not ( = ?auto_464962 ?auto_464964 ) ) ( not ( = ?auto_464960 ?auto_464964 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_464962 ?auto_464959 )
      ( GET-2IMAGE-VERIFY ?auto_464960 ?auto_464961 ?auto_464962 ?auto_464959 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_464968 - DIRECTION
      ?auto_464969 - MODE
      ?auto_464970 - DIRECTION
      ?auto_464967 - MODE
    )
    :vars
    (
      ?auto_464972 - DIRECTION
      ?auto_464975 - INSTRUMENT
      ?auto_464971 - SATELLITE
      ?auto_464974 - DIRECTION
      ?auto_464973 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_464970 ?auto_464968 ) ) ( not ( = ?auto_464970 ?auto_464972 ) ) ( ON_BOARD ?auto_464975 ?auto_464971 ) ( SUPPORTS ?auto_464975 ?auto_464967 ) ( not ( = ?auto_464970 ?auto_464974 ) ) ( HAVE_IMAGE ?auto_464972 ?auto_464973 ) ( not ( = ?auto_464972 ?auto_464974 ) ) ( not ( = ?auto_464973 ?auto_464967 ) ) ( CALIBRATION_TARGET ?auto_464975 ?auto_464974 ) ( POWER_AVAIL ?auto_464971 ) ( POINTING ?auto_464971 ?auto_464968 ) ( not ( = ?auto_464974 ?auto_464968 ) ) ( not ( = ?auto_464972 ?auto_464968 ) ) ( HAVE_IMAGE ?auto_464968 ?auto_464969 ) ( not ( = ?auto_464969 ?auto_464967 ) ) ( not ( = ?auto_464969 ?auto_464973 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_464972 ?auto_464973 ?auto_464970 ?auto_464967 )
      ( GET-2IMAGE-VERIFY ?auto_464968 ?auto_464969 ?auto_464970 ?auto_464967 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_464977 - DIRECTION
      ?auto_464978 - MODE
      ?auto_464979 - DIRECTION
      ?auto_464976 - MODE
    )
    :vars
    (
      ?auto_464983 - INSTRUMENT
      ?auto_464980 - SATELLITE
      ?auto_464982 - DIRECTION
      ?auto_464981 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_464979 ?auto_464977 ) ) ( ON_BOARD ?auto_464983 ?auto_464980 ) ( SUPPORTS ?auto_464983 ?auto_464978 ) ( not ( = ?auto_464977 ?auto_464982 ) ) ( HAVE_IMAGE ?auto_464979 ?auto_464976 ) ( not ( = ?auto_464979 ?auto_464982 ) ) ( not ( = ?auto_464976 ?auto_464978 ) ) ( CALIBRATION_TARGET ?auto_464983 ?auto_464982 ) ( POWER_AVAIL ?auto_464980 ) ( POINTING ?auto_464980 ?auto_464981 ) ( not ( = ?auto_464982 ?auto_464981 ) ) ( not ( = ?auto_464977 ?auto_464981 ) ) ( not ( = ?auto_464979 ?auto_464981 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_464979 ?auto_464976 ?auto_464977 ?auto_464978 )
      ( GET-2IMAGE-VERIFY ?auto_464977 ?auto_464978 ?auto_464979 ?auto_464976 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_464985 - DIRECTION
      ?auto_464986 - MODE
      ?auto_464987 - DIRECTION
      ?auto_464984 - MODE
    )
    :vars
    (
      ?auto_464989 - DIRECTION
      ?auto_464992 - INSTRUMENT
      ?auto_464988 - SATELLITE
      ?auto_464991 - DIRECTION
      ?auto_464990 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_464987 ?auto_464985 ) ) ( not ( = ?auto_464985 ?auto_464989 ) ) ( ON_BOARD ?auto_464992 ?auto_464988 ) ( SUPPORTS ?auto_464992 ?auto_464986 ) ( not ( = ?auto_464985 ?auto_464991 ) ) ( HAVE_IMAGE ?auto_464989 ?auto_464990 ) ( not ( = ?auto_464989 ?auto_464991 ) ) ( not ( = ?auto_464990 ?auto_464986 ) ) ( CALIBRATION_TARGET ?auto_464992 ?auto_464991 ) ( POWER_AVAIL ?auto_464988 ) ( POINTING ?auto_464988 ?auto_464987 ) ( not ( = ?auto_464991 ?auto_464987 ) ) ( not ( = ?auto_464989 ?auto_464987 ) ) ( HAVE_IMAGE ?auto_464987 ?auto_464984 ) ( not ( = ?auto_464986 ?auto_464984 ) ) ( not ( = ?auto_464984 ?auto_464990 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_464989 ?auto_464990 ?auto_464985 ?auto_464986 )
      ( GET-2IMAGE-VERIFY ?auto_464985 ?auto_464986 ?auto_464987 ?auto_464984 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_465014 - DIRECTION
      ?auto_465015 - MODE
      ?auto_465016 - DIRECTION
      ?auto_465013 - MODE
      ?auto_465018 - DIRECTION
      ?auto_465017 - MODE
    )
    :vars
    (
      ?auto_465021 - INSTRUMENT
      ?auto_465019 - SATELLITE
      ?auto_465020 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_465016 ?auto_465014 ) ) ( not ( = ?auto_465018 ?auto_465014 ) ) ( not ( = ?auto_465018 ?auto_465016 ) ) ( ON_BOARD ?auto_465021 ?auto_465019 ) ( SUPPORTS ?auto_465021 ?auto_465017 ) ( not ( = ?auto_465018 ?auto_465020 ) ) ( HAVE_IMAGE ?auto_465014 ?auto_465015 ) ( not ( = ?auto_465014 ?auto_465020 ) ) ( not ( = ?auto_465015 ?auto_465017 ) ) ( CALIBRATION_TARGET ?auto_465021 ?auto_465020 ) ( POWER_AVAIL ?auto_465019 ) ( POINTING ?auto_465019 ?auto_465016 ) ( not ( = ?auto_465020 ?auto_465016 ) ) ( HAVE_IMAGE ?auto_465016 ?auto_465013 ) ( not ( = ?auto_465015 ?auto_465013 ) ) ( not ( = ?auto_465013 ?auto_465017 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_465014 ?auto_465015 ?auto_465018 ?auto_465017 )
      ( GET-3IMAGE-VERIFY ?auto_465014 ?auto_465015 ?auto_465016 ?auto_465013 ?auto_465018 ?auto_465017 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_465033 - DIRECTION
      ?auto_465034 - MODE
      ?auto_465035 - DIRECTION
      ?auto_465032 - MODE
      ?auto_465037 - DIRECTION
      ?auto_465036 - MODE
    )
    :vars
    (
      ?auto_465040 - INSTRUMENT
      ?auto_465038 - SATELLITE
      ?auto_465039 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_465035 ?auto_465033 ) ) ( not ( = ?auto_465037 ?auto_465033 ) ) ( not ( = ?auto_465037 ?auto_465035 ) ) ( ON_BOARD ?auto_465040 ?auto_465038 ) ( SUPPORTS ?auto_465040 ?auto_465032 ) ( not ( = ?auto_465035 ?auto_465039 ) ) ( HAVE_IMAGE ?auto_465033 ?auto_465034 ) ( not ( = ?auto_465033 ?auto_465039 ) ) ( not ( = ?auto_465034 ?auto_465032 ) ) ( CALIBRATION_TARGET ?auto_465040 ?auto_465039 ) ( POWER_AVAIL ?auto_465038 ) ( POINTING ?auto_465038 ?auto_465037 ) ( not ( = ?auto_465039 ?auto_465037 ) ) ( HAVE_IMAGE ?auto_465037 ?auto_465036 ) ( not ( = ?auto_465034 ?auto_465036 ) ) ( not ( = ?auto_465032 ?auto_465036 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_465033 ?auto_465034 ?auto_465035 ?auto_465032 )
      ( GET-3IMAGE-VERIFY ?auto_465033 ?auto_465034 ?auto_465035 ?auto_465032 ?auto_465037 ?auto_465036 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_465052 - DIRECTION
      ?auto_465053 - MODE
      ?auto_465054 - DIRECTION
      ?auto_465051 - MODE
      ?auto_465056 - DIRECTION
      ?auto_465055 - MODE
    )
    :vars
    (
      ?auto_465059 - INSTRUMENT
      ?auto_465057 - SATELLITE
      ?auto_465058 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_465054 ?auto_465052 ) ) ( not ( = ?auto_465056 ?auto_465052 ) ) ( not ( = ?auto_465056 ?auto_465054 ) ) ( ON_BOARD ?auto_465059 ?auto_465057 ) ( SUPPORTS ?auto_465059 ?auto_465055 ) ( not ( = ?auto_465056 ?auto_465058 ) ) ( HAVE_IMAGE ?auto_465054 ?auto_465051 ) ( not ( = ?auto_465054 ?auto_465058 ) ) ( not ( = ?auto_465051 ?auto_465055 ) ) ( CALIBRATION_TARGET ?auto_465059 ?auto_465058 ) ( POWER_AVAIL ?auto_465057 ) ( POINTING ?auto_465057 ?auto_465052 ) ( not ( = ?auto_465058 ?auto_465052 ) ) ( HAVE_IMAGE ?auto_465052 ?auto_465053 ) ( not ( = ?auto_465053 ?auto_465051 ) ) ( not ( = ?auto_465053 ?auto_465055 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_465054 ?auto_465051 ?auto_465056 ?auto_465055 )
      ( GET-3IMAGE-VERIFY ?auto_465052 ?auto_465053 ?auto_465054 ?auto_465051 ?auto_465056 ?auto_465055 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_465072 - DIRECTION
      ?auto_465073 - MODE
      ?auto_465074 - DIRECTION
      ?auto_465071 - MODE
      ?auto_465076 - DIRECTION
      ?auto_465075 - MODE
    )
    :vars
    (
      ?auto_465079 - INSTRUMENT
      ?auto_465077 - SATELLITE
      ?auto_465078 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_465074 ?auto_465072 ) ) ( not ( = ?auto_465076 ?auto_465072 ) ) ( not ( = ?auto_465076 ?auto_465074 ) ) ( ON_BOARD ?auto_465079 ?auto_465077 ) ( SUPPORTS ?auto_465079 ?auto_465071 ) ( not ( = ?auto_465074 ?auto_465078 ) ) ( HAVE_IMAGE ?auto_465076 ?auto_465075 ) ( not ( = ?auto_465076 ?auto_465078 ) ) ( not ( = ?auto_465075 ?auto_465071 ) ) ( CALIBRATION_TARGET ?auto_465079 ?auto_465078 ) ( POWER_AVAIL ?auto_465077 ) ( POINTING ?auto_465077 ?auto_465072 ) ( not ( = ?auto_465078 ?auto_465072 ) ) ( HAVE_IMAGE ?auto_465072 ?auto_465073 ) ( not ( = ?auto_465073 ?auto_465071 ) ) ( not ( = ?auto_465073 ?auto_465075 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_465076 ?auto_465075 ?auto_465074 ?auto_465071 )
      ( GET-3IMAGE-VERIFY ?auto_465072 ?auto_465073 ?auto_465074 ?auto_465071 ?auto_465076 ?auto_465075 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_465113 - DIRECTION
      ?auto_465114 - MODE
      ?auto_465115 - DIRECTION
      ?auto_465112 - MODE
      ?auto_465117 - DIRECTION
      ?auto_465116 - MODE
    )
    :vars
    (
      ?auto_465120 - INSTRUMENT
      ?auto_465118 - SATELLITE
      ?auto_465119 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_465115 ?auto_465113 ) ) ( not ( = ?auto_465117 ?auto_465113 ) ) ( not ( = ?auto_465117 ?auto_465115 ) ) ( ON_BOARD ?auto_465120 ?auto_465118 ) ( SUPPORTS ?auto_465120 ?auto_465114 ) ( not ( = ?auto_465113 ?auto_465119 ) ) ( HAVE_IMAGE ?auto_465115 ?auto_465112 ) ( not ( = ?auto_465115 ?auto_465119 ) ) ( not ( = ?auto_465112 ?auto_465114 ) ) ( CALIBRATION_TARGET ?auto_465120 ?auto_465119 ) ( POWER_AVAIL ?auto_465118 ) ( POINTING ?auto_465118 ?auto_465117 ) ( not ( = ?auto_465119 ?auto_465117 ) ) ( HAVE_IMAGE ?auto_465117 ?auto_465116 ) ( not ( = ?auto_465114 ?auto_465116 ) ) ( not ( = ?auto_465112 ?auto_465116 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_465115 ?auto_465112 ?auto_465113 ?auto_465114 )
      ( GET-3IMAGE-VERIFY ?auto_465113 ?auto_465114 ?auto_465115 ?auto_465112 ?auto_465117 ?auto_465116 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_465132 - DIRECTION
      ?auto_465133 - MODE
      ?auto_465134 - DIRECTION
      ?auto_465131 - MODE
      ?auto_465136 - DIRECTION
      ?auto_465135 - MODE
    )
    :vars
    (
      ?auto_465139 - INSTRUMENT
      ?auto_465137 - SATELLITE
      ?auto_465138 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_465134 ?auto_465132 ) ) ( not ( = ?auto_465136 ?auto_465132 ) ) ( not ( = ?auto_465136 ?auto_465134 ) ) ( ON_BOARD ?auto_465139 ?auto_465137 ) ( SUPPORTS ?auto_465139 ?auto_465133 ) ( not ( = ?auto_465132 ?auto_465138 ) ) ( HAVE_IMAGE ?auto_465136 ?auto_465135 ) ( not ( = ?auto_465136 ?auto_465138 ) ) ( not ( = ?auto_465135 ?auto_465133 ) ) ( CALIBRATION_TARGET ?auto_465139 ?auto_465138 ) ( POWER_AVAIL ?auto_465137 ) ( POINTING ?auto_465137 ?auto_465134 ) ( not ( = ?auto_465138 ?auto_465134 ) ) ( HAVE_IMAGE ?auto_465134 ?auto_465131 ) ( not ( = ?auto_465133 ?auto_465131 ) ) ( not ( = ?auto_465131 ?auto_465135 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_465136 ?auto_465135 ?auto_465132 ?auto_465133 )
      ( GET-3IMAGE-VERIFY ?auto_465132 ?auto_465133 ?auto_465134 ?auto_465131 ?auto_465136 ?auto_465135 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_468791 - DIRECTION
      ?auto_468792 - MODE
    )
    :vars
    (
      ?auto_468795 - DIRECTION
      ?auto_468798 - INSTRUMENT
      ?auto_468793 - SATELLITE
      ?auto_468797 - DIRECTION
      ?auto_468796 - MODE
      ?auto_468794 - DIRECTION
      ?auto_468799 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_468791 ?auto_468795 ) ) ( ON_BOARD ?auto_468798 ?auto_468793 ) ( SUPPORTS ?auto_468798 ?auto_468792 ) ( not ( = ?auto_468791 ?auto_468797 ) ) ( HAVE_IMAGE ?auto_468795 ?auto_468796 ) ( not ( = ?auto_468795 ?auto_468797 ) ) ( not ( = ?auto_468796 ?auto_468792 ) ) ( CALIBRATION_TARGET ?auto_468798 ?auto_468797 ) ( POINTING ?auto_468793 ?auto_468794 ) ( not ( = ?auto_468797 ?auto_468794 ) ) ( not ( = ?auto_468791 ?auto_468794 ) ) ( not ( = ?auto_468795 ?auto_468794 ) ) ( ON_BOARD ?auto_468799 ?auto_468793 ) ( POWER_ON ?auto_468799 ) ( not ( = ?auto_468798 ?auto_468799 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_468799 ?auto_468793 )
      ( GET-2IMAGE ?auto_468795 ?auto_468796 ?auto_468791 ?auto_468792 )
      ( GET-1IMAGE-VERIFY ?auto_468791 ?auto_468792 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_468801 - DIRECTION
      ?auto_468802 - MODE
      ?auto_468803 - DIRECTION
      ?auto_468800 - MODE
    )
    :vars
    (
      ?auto_468804 - INSTRUMENT
      ?auto_468808 - SATELLITE
      ?auto_468807 - DIRECTION
      ?auto_468806 - DIRECTION
      ?auto_468805 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_468803 ?auto_468801 ) ) ( ON_BOARD ?auto_468804 ?auto_468808 ) ( SUPPORTS ?auto_468804 ?auto_468800 ) ( not ( = ?auto_468803 ?auto_468807 ) ) ( HAVE_IMAGE ?auto_468801 ?auto_468802 ) ( not ( = ?auto_468801 ?auto_468807 ) ) ( not ( = ?auto_468802 ?auto_468800 ) ) ( CALIBRATION_TARGET ?auto_468804 ?auto_468807 ) ( POINTING ?auto_468808 ?auto_468806 ) ( not ( = ?auto_468807 ?auto_468806 ) ) ( not ( = ?auto_468803 ?auto_468806 ) ) ( not ( = ?auto_468801 ?auto_468806 ) ) ( ON_BOARD ?auto_468805 ?auto_468808 ) ( POWER_ON ?auto_468805 ) ( not ( = ?auto_468804 ?auto_468805 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_468803 ?auto_468800 )
      ( GET-2IMAGE-VERIFY ?auto_468801 ?auto_468802 ?auto_468803 ?auto_468800 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_468810 - DIRECTION
      ?auto_468811 - MODE
      ?auto_468812 - DIRECTION
      ?auto_468809 - MODE
    )
    :vars
    (
      ?auto_468813 - DIRECTION
      ?auto_468816 - INSTRUMENT
      ?auto_468815 - SATELLITE
      ?auto_468814 - DIRECTION
      ?auto_468817 - MODE
      ?auto_468818 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_468812 ?auto_468810 ) ) ( not ( = ?auto_468812 ?auto_468813 ) ) ( ON_BOARD ?auto_468816 ?auto_468815 ) ( SUPPORTS ?auto_468816 ?auto_468809 ) ( not ( = ?auto_468812 ?auto_468814 ) ) ( HAVE_IMAGE ?auto_468813 ?auto_468817 ) ( not ( = ?auto_468813 ?auto_468814 ) ) ( not ( = ?auto_468817 ?auto_468809 ) ) ( CALIBRATION_TARGET ?auto_468816 ?auto_468814 ) ( POINTING ?auto_468815 ?auto_468810 ) ( not ( = ?auto_468814 ?auto_468810 ) ) ( not ( = ?auto_468813 ?auto_468810 ) ) ( ON_BOARD ?auto_468818 ?auto_468815 ) ( POWER_ON ?auto_468818 ) ( not ( = ?auto_468816 ?auto_468818 ) ) ( HAVE_IMAGE ?auto_468810 ?auto_468811 ) ( not ( = ?auto_468811 ?auto_468809 ) ) ( not ( = ?auto_468811 ?auto_468817 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_468813 ?auto_468817 ?auto_468812 ?auto_468809 )
      ( GET-2IMAGE-VERIFY ?auto_468810 ?auto_468811 ?auto_468812 ?auto_468809 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_468820 - DIRECTION
      ?auto_468821 - MODE
      ?auto_468822 - DIRECTION
      ?auto_468819 - MODE
    )
    :vars
    (
      ?auto_468826 - INSTRUMENT
      ?auto_468825 - SATELLITE
      ?auto_468824 - DIRECTION
      ?auto_468823 - DIRECTION
      ?auto_468827 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_468822 ?auto_468820 ) ) ( ON_BOARD ?auto_468826 ?auto_468825 ) ( SUPPORTS ?auto_468826 ?auto_468821 ) ( not ( = ?auto_468820 ?auto_468824 ) ) ( HAVE_IMAGE ?auto_468822 ?auto_468819 ) ( not ( = ?auto_468822 ?auto_468824 ) ) ( not ( = ?auto_468819 ?auto_468821 ) ) ( CALIBRATION_TARGET ?auto_468826 ?auto_468824 ) ( POINTING ?auto_468825 ?auto_468823 ) ( not ( = ?auto_468824 ?auto_468823 ) ) ( not ( = ?auto_468820 ?auto_468823 ) ) ( not ( = ?auto_468822 ?auto_468823 ) ) ( ON_BOARD ?auto_468827 ?auto_468825 ) ( POWER_ON ?auto_468827 ) ( not ( = ?auto_468826 ?auto_468827 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_468822 ?auto_468819 ?auto_468820 ?auto_468821 )
      ( GET-2IMAGE-VERIFY ?auto_468820 ?auto_468821 ?auto_468822 ?auto_468819 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_468829 - DIRECTION
      ?auto_468830 - MODE
      ?auto_468831 - DIRECTION
      ?auto_468828 - MODE
    )
    :vars
    (
      ?auto_468832 - DIRECTION
      ?auto_468835 - INSTRUMENT
      ?auto_468834 - SATELLITE
      ?auto_468833 - DIRECTION
      ?auto_468836 - MODE
      ?auto_468837 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_468831 ?auto_468829 ) ) ( not ( = ?auto_468829 ?auto_468832 ) ) ( ON_BOARD ?auto_468835 ?auto_468834 ) ( SUPPORTS ?auto_468835 ?auto_468830 ) ( not ( = ?auto_468829 ?auto_468833 ) ) ( HAVE_IMAGE ?auto_468832 ?auto_468836 ) ( not ( = ?auto_468832 ?auto_468833 ) ) ( not ( = ?auto_468836 ?auto_468830 ) ) ( CALIBRATION_TARGET ?auto_468835 ?auto_468833 ) ( POINTING ?auto_468834 ?auto_468831 ) ( not ( = ?auto_468833 ?auto_468831 ) ) ( not ( = ?auto_468832 ?auto_468831 ) ) ( ON_BOARD ?auto_468837 ?auto_468834 ) ( POWER_ON ?auto_468837 ) ( not ( = ?auto_468835 ?auto_468837 ) ) ( HAVE_IMAGE ?auto_468831 ?auto_468828 ) ( not ( = ?auto_468830 ?auto_468828 ) ) ( not ( = ?auto_468828 ?auto_468836 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_468832 ?auto_468836 ?auto_468829 ?auto_468830 )
      ( GET-2IMAGE-VERIFY ?auto_468829 ?auto_468830 ?auto_468831 ?auto_468828 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_468861 - DIRECTION
      ?auto_468862 - MODE
      ?auto_468863 - DIRECTION
      ?auto_468860 - MODE
      ?auto_468865 - DIRECTION
      ?auto_468864 - MODE
    )
    :vars
    (
      ?auto_468868 - INSTRUMENT
      ?auto_468867 - SATELLITE
      ?auto_468866 - DIRECTION
      ?auto_468869 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_468863 ?auto_468861 ) ) ( not ( = ?auto_468865 ?auto_468861 ) ) ( not ( = ?auto_468865 ?auto_468863 ) ) ( ON_BOARD ?auto_468868 ?auto_468867 ) ( SUPPORTS ?auto_468868 ?auto_468864 ) ( not ( = ?auto_468865 ?auto_468866 ) ) ( HAVE_IMAGE ?auto_468861 ?auto_468862 ) ( not ( = ?auto_468861 ?auto_468866 ) ) ( not ( = ?auto_468862 ?auto_468864 ) ) ( CALIBRATION_TARGET ?auto_468868 ?auto_468866 ) ( POINTING ?auto_468867 ?auto_468863 ) ( not ( = ?auto_468866 ?auto_468863 ) ) ( ON_BOARD ?auto_468869 ?auto_468867 ) ( POWER_ON ?auto_468869 ) ( not ( = ?auto_468868 ?auto_468869 ) ) ( HAVE_IMAGE ?auto_468863 ?auto_468860 ) ( not ( = ?auto_468862 ?auto_468860 ) ) ( not ( = ?auto_468860 ?auto_468864 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_468861 ?auto_468862 ?auto_468865 ?auto_468864 )
      ( GET-3IMAGE-VERIFY ?auto_468861 ?auto_468862 ?auto_468863 ?auto_468860 ?auto_468865 ?auto_468864 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_468882 - DIRECTION
      ?auto_468883 - MODE
      ?auto_468884 - DIRECTION
      ?auto_468881 - MODE
      ?auto_468886 - DIRECTION
      ?auto_468885 - MODE
    )
    :vars
    (
      ?auto_468889 - INSTRUMENT
      ?auto_468888 - SATELLITE
      ?auto_468887 - DIRECTION
      ?auto_468890 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_468884 ?auto_468882 ) ) ( not ( = ?auto_468886 ?auto_468882 ) ) ( not ( = ?auto_468886 ?auto_468884 ) ) ( ON_BOARD ?auto_468889 ?auto_468888 ) ( SUPPORTS ?auto_468889 ?auto_468881 ) ( not ( = ?auto_468884 ?auto_468887 ) ) ( HAVE_IMAGE ?auto_468882 ?auto_468883 ) ( not ( = ?auto_468882 ?auto_468887 ) ) ( not ( = ?auto_468883 ?auto_468881 ) ) ( CALIBRATION_TARGET ?auto_468889 ?auto_468887 ) ( POINTING ?auto_468888 ?auto_468886 ) ( not ( = ?auto_468887 ?auto_468886 ) ) ( ON_BOARD ?auto_468890 ?auto_468888 ) ( POWER_ON ?auto_468890 ) ( not ( = ?auto_468889 ?auto_468890 ) ) ( HAVE_IMAGE ?auto_468886 ?auto_468885 ) ( not ( = ?auto_468883 ?auto_468885 ) ) ( not ( = ?auto_468881 ?auto_468885 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_468882 ?auto_468883 ?auto_468884 ?auto_468881 )
      ( GET-3IMAGE-VERIFY ?auto_468882 ?auto_468883 ?auto_468884 ?auto_468881 ?auto_468886 ?auto_468885 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_468903 - DIRECTION
      ?auto_468904 - MODE
      ?auto_468905 - DIRECTION
      ?auto_468902 - MODE
      ?auto_468907 - DIRECTION
      ?auto_468906 - MODE
    )
    :vars
    (
      ?auto_468910 - INSTRUMENT
      ?auto_468909 - SATELLITE
      ?auto_468908 - DIRECTION
      ?auto_468911 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_468905 ?auto_468903 ) ) ( not ( = ?auto_468907 ?auto_468903 ) ) ( not ( = ?auto_468907 ?auto_468905 ) ) ( ON_BOARD ?auto_468910 ?auto_468909 ) ( SUPPORTS ?auto_468910 ?auto_468906 ) ( not ( = ?auto_468907 ?auto_468908 ) ) ( HAVE_IMAGE ?auto_468905 ?auto_468902 ) ( not ( = ?auto_468905 ?auto_468908 ) ) ( not ( = ?auto_468902 ?auto_468906 ) ) ( CALIBRATION_TARGET ?auto_468910 ?auto_468908 ) ( POINTING ?auto_468909 ?auto_468903 ) ( not ( = ?auto_468908 ?auto_468903 ) ) ( ON_BOARD ?auto_468911 ?auto_468909 ) ( POWER_ON ?auto_468911 ) ( not ( = ?auto_468910 ?auto_468911 ) ) ( HAVE_IMAGE ?auto_468903 ?auto_468904 ) ( not ( = ?auto_468904 ?auto_468902 ) ) ( not ( = ?auto_468904 ?auto_468906 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_468905 ?auto_468902 ?auto_468907 ?auto_468906 )
      ( GET-3IMAGE-VERIFY ?auto_468903 ?auto_468904 ?auto_468905 ?auto_468902 ?auto_468907 ?auto_468906 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_468925 - DIRECTION
      ?auto_468926 - MODE
      ?auto_468927 - DIRECTION
      ?auto_468924 - MODE
      ?auto_468929 - DIRECTION
      ?auto_468928 - MODE
    )
    :vars
    (
      ?auto_468932 - INSTRUMENT
      ?auto_468931 - SATELLITE
      ?auto_468930 - DIRECTION
      ?auto_468933 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_468927 ?auto_468925 ) ) ( not ( = ?auto_468929 ?auto_468925 ) ) ( not ( = ?auto_468929 ?auto_468927 ) ) ( ON_BOARD ?auto_468932 ?auto_468931 ) ( SUPPORTS ?auto_468932 ?auto_468924 ) ( not ( = ?auto_468927 ?auto_468930 ) ) ( HAVE_IMAGE ?auto_468929 ?auto_468928 ) ( not ( = ?auto_468929 ?auto_468930 ) ) ( not ( = ?auto_468928 ?auto_468924 ) ) ( CALIBRATION_TARGET ?auto_468932 ?auto_468930 ) ( POINTING ?auto_468931 ?auto_468925 ) ( not ( = ?auto_468930 ?auto_468925 ) ) ( ON_BOARD ?auto_468933 ?auto_468931 ) ( POWER_ON ?auto_468933 ) ( not ( = ?auto_468932 ?auto_468933 ) ) ( HAVE_IMAGE ?auto_468925 ?auto_468926 ) ( not ( = ?auto_468926 ?auto_468924 ) ) ( not ( = ?auto_468926 ?auto_468928 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_468929 ?auto_468928 ?auto_468927 ?auto_468924 )
      ( GET-3IMAGE-VERIFY ?auto_468925 ?auto_468926 ?auto_468927 ?auto_468924 ?auto_468929 ?auto_468928 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_468970 - DIRECTION
      ?auto_468971 - MODE
      ?auto_468972 - DIRECTION
      ?auto_468969 - MODE
      ?auto_468974 - DIRECTION
      ?auto_468973 - MODE
    )
    :vars
    (
      ?auto_468977 - INSTRUMENT
      ?auto_468976 - SATELLITE
      ?auto_468975 - DIRECTION
      ?auto_468978 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_468972 ?auto_468970 ) ) ( not ( = ?auto_468974 ?auto_468970 ) ) ( not ( = ?auto_468974 ?auto_468972 ) ) ( ON_BOARD ?auto_468977 ?auto_468976 ) ( SUPPORTS ?auto_468977 ?auto_468971 ) ( not ( = ?auto_468970 ?auto_468975 ) ) ( HAVE_IMAGE ?auto_468972 ?auto_468969 ) ( not ( = ?auto_468972 ?auto_468975 ) ) ( not ( = ?auto_468969 ?auto_468971 ) ) ( CALIBRATION_TARGET ?auto_468977 ?auto_468975 ) ( POINTING ?auto_468976 ?auto_468974 ) ( not ( = ?auto_468975 ?auto_468974 ) ) ( ON_BOARD ?auto_468978 ?auto_468976 ) ( POWER_ON ?auto_468978 ) ( not ( = ?auto_468977 ?auto_468978 ) ) ( HAVE_IMAGE ?auto_468974 ?auto_468973 ) ( not ( = ?auto_468971 ?auto_468973 ) ) ( not ( = ?auto_468969 ?auto_468973 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_468972 ?auto_468969 ?auto_468970 ?auto_468971 )
      ( GET-3IMAGE-VERIFY ?auto_468970 ?auto_468971 ?auto_468972 ?auto_468969 ?auto_468974 ?auto_468973 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_468991 - DIRECTION
      ?auto_468992 - MODE
      ?auto_468993 - DIRECTION
      ?auto_468990 - MODE
      ?auto_468995 - DIRECTION
      ?auto_468994 - MODE
    )
    :vars
    (
      ?auto_468998 - INSTRUMENT
      ?auto_468997 - SATELLITE
      ?auto_468996 - DIRECTION
      ?auto_468999 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_468993 ?auto_468991 ) ) ( not ( = ?auto_468995 ?auto_468991 ) ) ( not ( = ?auto_468995 ?auto_468993 ) ) ( ON_BOARD ?auto_468998 ?auto_468997 ) ( SUPPORTS ?auto_468998 ?auto_468992 ) ( not ( = ?auto_468991 ?auto_468996 ) ) ( HAVE_IMAGE ?auto_468995 ?auto_468994 ) ( not ( = ?auto_468995 ?auto_468996 ) ) ( not ( = ?auto_468994 ?auto_468992 ) ) ( CALIBRATION_TARGET ?auto_468998 ?auto_468996 ) ( POINTING ?auto_468997 ?auto_468993 ) ( not ( = ?auto_468996 ?auto_468993 ) ) ( ON_BOARD ?auto_468999 ?auto_468997 ) ( POWER_ON ?auto_468999 ) ( not ( = ?auto_468998 ?auto_468999 ) ) ( HAVE_IMAGE ?auto_468993 ?auto_468990 ) ( not ( = ?auto_468992 ?auto_468990 ) ) ( not ( = ?auto_468990 ?auto_468994 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_468995 ?auto_468994 ?auto_468991 ?auto_468992 )
      ( GET-3IMAGE-VERIFY ?auto_468991 ?auto_468992 ?auto_468993 ?auto_468990 ?auto_468995 ?auto_468994 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_477056 - DIRECTION
      ?auto_477057 - MODE
    )
    :vars
    (
      ?auto_477062 - DIRECTION
      ?auto_477063 - INSTRUMENT
      ?auto_477059 - SATELLITE
      ?auto_477060 - DIRECTION
      ?auto_477064 - MODE
      ?auto_477061 - DIRECTION
      ?auto_477058 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_477056 ?auto_477062 ) ) ( ON_BOARD ?auto_477063 ?auto_477059 ) ( SUPPORTS ?auto_477063 ?auto_477057 ) ( not ( = ?auto_477056 ?auto_477060 ) ) ( HAVE_IMAGE ?auto_477062 ?auto_477064 ) ( not ( = ?auto_477062 ?auto_477060 ) ) ( not ( = ?auto_477064 ?auto_477057 ) ) ( CALIBRATION_TARGET ?auto_477063 ?auto_477060 ) ( not ( = ?auto_477060 ?auto_477061 ) ) ( not ( = ?auto_477056 ?auto_477061 ) ) ( not ( = ?auto_477062 ?auto_477061 ) ) ( ON_BOARD ?auto_477058 ?auto_477059 ) ( POWER_ON ?auto_477058 ) ( not ( = ?auto_477063 ?auto_477058 ) ) ( POINTING ?auto_477059 ?auto_477060 ) )
    :subtasks
    ( ( !TURN_TO ?auto_477059 ?auto_477061 ?auto_477060 )
      ( GET-2IMAGE ?auto_477062 ?auto_477064 ?auto_477056 ?auto_477057 )
      ( GET-1IMAGE-VERIFY ?auto_477056 ?auto_477057 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_477066 - DIRECTION
      ?auto_477067 - MODE
      ?auto_477068 - DIRECTION
      ?auto_477065 - MODE
    )
    :vars
    (
      ?auto_477069 - INSTRUMENT
      ?auto_477072 - SATELLITE
      ?auto_477070 - DIRECTION
      ?auto_477073 - DIRECTION
      ?auto_477071 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_477068 ?auto_477066 ) ) ( ON_BOARD ?auto_477069 ?auto_477072 ) ( SUPPORTS ?auto_477069 ?auto_477065 ) ( not ( = ?auto_477068 ?auto_477070 ) ) ( HAVE_IMAGE ?auto_477066 ?auto_477067 ) ( not ( = ?auto_477066 ?auto_477070 ) ) ( not ( = ?auto_477067 ?auto_477065 ) ) ( CALIBRATION_TARGET ?auto_477069 ?auto_477070 ) ( not ( = ?auto_477070 ?auto_477073 ) ) ( not ( = ?auto_477068 ?auto_477073 ) ) ( not ( = ?auto_477066 ?auto_477073 ) ) ( ON_BOARD ?auto_477071 ?auto_477072 ) ( POWER_ON ?auto_477071 ) ( not ( = ?auto_477069 ?auto_477071 ) ) ( POINTING ?auto_477072 ?auto_477070 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_477068 ?auto_477065 )
      ( GET-2IMAGE-VERIFY ?auto_477066 ?auto_477067 ?auto_477068 ?auto_477065 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_477085 - DIRECTION
      ?auto_477086 - MODE
      ?auto_477087 - DIRECTION
      ?auto_477084 - MODE
    )
    :vars
    (
      ?auto_477088 - INSTRUMENT
      ?auto_477090 - SATELLITE
      ?auto_477089 - DIRECTION
      ?auto_477091 - DIRECTION
      ?auto_477092 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_477087 ?auto_477085 ) ) ( ON_BOARD ?auto_477088 ?auto_477090 ) ( SUPPORTS ?auto_477088 ?auto_477086 ) ( not ( = ?auto_477085 ?auto_477089 ) ) ( HAVE_IMAGE ?auto_477087 ?auto_477084 ) ( not ( = ?auto_477087 ?auto_477089 ) ) ( not ( = ?auto_477084 ?auto_477086 ) ) ( CALIBRATION_TARGET ?auto_477088 ?auto_477089 ) ( not ( = ?auto_477089 ?auto_477091 ) ) ( not ( = ?auto_477085 ?auto_477091 ) ) ( not ( = ?auto_477087 ?auto_477091 ) ) ( ON_BOARD ?auto_477092 ?auto_477090 ) ( POWER_ON ?auto_477092 ) ( not ( = ?auto_477088 ?auto_477092 ) ) ( POINTING ?auto_477090 ?auto_477089 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_477087 ?auto_477084 ?auto_477085 ?auto_477086 )
      ( GET-2IMAGE-VERIFY ?auto_477085 ?auto_477086 ?auto_477087 ?auto_477084 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_526663 - DIRECTION
      ?auto_526664 - MODE
      ?auto_526665 - DIRECTION
      ?auto_526662 - MODE
      ?auto_526667 - DIRECTION
      ?auto_526666 - MODE
      ?auto_526668 - DIRECTION
      ?auto_526669 - MODE
    )
    :vars
    (
      ?auto_526671 - INSTRUMENT
      ?auto_526670 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_526665 ?auto_526663 ) ) ( not ( = ?auto_526667 ?auto_526663 ) ) ( not ( = ?auto_526667 ?auto_526665 ) ) ( not ( = ?auto_526668 ?auto_526663 ) ) ( not ( = ?auto_526668 ?auto_526665 ) ) ( not ( = ?auto_526668 ?auto_526667 ) ) ( CALIBRATED ?auto_526671 ) ( ON_BOARD ?auto_526671 ?auto_526670 ) ( SUPPORTS ?auto_526671 ?auto_526669 ) ( POWER_ON ?auto_526671 ) ( POINTING ?auto_526670 ?auto_526668 ) ( HAVE_IMAGE ?auto_526663 ?auto_526664 ) ( HAVE_IMAGE ?auto_526665 ?auto_526662 ) ( HAVE_IMAGE ?auto_526667 ?auto_526666 ) ( not ( = ?auto_526664 ?auto_526662 ) ) ( not ( = ?auto_526664 ?auto_526666 ) ) ( not ( = ?auto_526664 ?auto_526669 ) ) ( not ( = ?auto_526662 ?auto_526666 ) ) ( not ( = ?auto_526662 ?auto_526669 ) ) ( not ( = ?auto_526666 ?auto_526669 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_526668 ?auto_526669 )
      ( GET-4IMAGE-VERIFY ?auto_526663 ?auto_526664 ?auto_526665 ?auto_526662 ?auto_526667 ?auto_526666 ?auto_526668 ?auto_526669 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_526693 - DIRECTION
      ?auto_526694 - MODE
      ?auto_526695 - DIRECTION
      ?auto_526692 - MODE
      ?auto_526697 - DIRECTION
      ?auto_526696 - MODE
      ?auto_526698 - DIRECTION
      ?auto_526699 - MODE
    )
    :vars
    (
      ?auto_526701 - INSTRUMENT
      ?auto_526700 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_526695 ?auto_526693 ) ) ( not ( = ?auto_526697 ?auto_526693 ) ) ( not ( = ?auto_526697 ?auto_526695 ) ) ( not ( = ?auto_526698 ?auto_526693 ) ) ( not ( = ?auto_526698 ?auto_526695 ) ) ( not ( = ?auto_526698 ?auto_526697 ) ) ( CALIBRATED ?auto_526701 ) ( ON_BOARD ?auto_526701 ?auto_526700 ) ( SUPPORTS ?auto_526701 ?auto_526696 ) ( POWER_ON ?auto_526701 ) ( POINTING ?auto_526700 ?auto_526697 ) ( HAVE_IMAGE ?auto_526693 ?auto_526694 ) ( HAVE_IMAGE ?auto_526695 ?auto_526692 ) ( HAVE_IMAGE ?auto_526698 ?auto_526699 ) ( not ( = ?auto_526694 ?auto_526692 ) ) ( not ( = ?auto_526694 ?auto_526696 ) ) ( not ( = ?auto_526694 ?auto_526699 ) ) ( not ( = ?auto_526692 ?auto_526696 ) ) ( not ( = ?auto_526692 ?auto_526699 ) ) ( not ( = ?auto_526696 ?auto_526699 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_526697 ?auto_526696 )
      ( GET-4IMAGE-VERIFY ?auto_526693 ?auto_526694 ?auto_526695 ?auto_526692 ?auto_526697 ?auto_526696 ?auto_526698 ?auto_526699 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_526839 - DIRECTION
      ?auto_526840 - MODE
      ?auto_526841 - DIRECTION
      ?auto_526838 - MODE
      ?auto_526843 - DIRECTION
      ?auto_526842 - MODE
      ?auto_526844 - DIRECTION
      ?auto_526845 - MODE
    )
    :vars
    (
      ?auto_526847 - INSTRUMENT
      ?auto_526846 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_526841 ?auto_526839 ) ) ( not ( = ?auto_526843 ?auto_526839 ) ) ( not ( = ?auto_526843 ?auto_526841 ) ) ( not ( = ?auto_526844 ?auto_526839 ) ) ( not ( = ?auto_526844 ?auto_526841 ) ) ( not ( = ?auto_526844 ?auto_526843 ) ) ( CALIBRATED ?auto_526847 ) ( ON_BOARD ?auto_526847 ?auto_526846 ) ( SUPPORTS ?auto_526847 ?auto_526838 ) ( POWER_ON ?auto_526847 ) ( POINTING ?auto_526846 ?auto_526841 ) ( HAVE_IMAGE ?auto_526839 ?auto_526840 ) ( HAVE_IMAGE ?auto_526843 ?auto_526842 ) ( HAVE_IMAGE ?auto_526844 ?auto_526845 ) ( not ( = ?auto_526840 ?auto_526838 ) ) ( not ( = ?auto_526840 ?auto_526842 ) ) ( not ( = ?auto_526840 ?auto_526845 ) ) ( not ( = ?auto_526838 ?auto_526842 ) ) ( not ( = ?auto_526838 ?auto_526845 ) ) ( not ( = ?auto_526842 ?auto_526845 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_526841 ?auto_526838 )
      ( GET-4IMAGE-VERIFY ?auto_526839 ?auto_526840 ?auto_526841 ?auto_526838 ?auto_526843 ?auto_526842 ?auto_526844 ?auto_526845 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_527713 - DIRECTION
      ?auto_527714 - MODE
      ?auto_527715 - DIRECTION
      ?auto_527712 - MODE
      ?auto_527717 - DIRECTION
      ?auto_527716 - MODE
      ?auto_527718 - DIRECTION
      ?auto_527719 - MODE
    )
    :vars
    (
      ?auto_527721 - INSTRUMENT
      ?auto_527720 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_527715 ?auto_527713 ) ) ( not ( = ?auto_527717 ?auto_527713 ) ) ( not ( = ?auto_527717 ?auto_527715 ) ) ( not ( = ?auto_527718 ?auto_527713 ) ) ( not ( = ?auto_527718 ?auto_527715 ) ) ( not ( = ?auto_527718 ?auto_527717 ) ) ( CALIBRATED ?auto_527721 ) ( ON_BOARD ?auto_527721 ?auto_527720 ) ( SUPPORTS ?auto_527721 ?auto_527714 ) ( POWER_ON ?auto_527721 ) ( POINTING ?auto_527720 ?auto_527713 ) ( HAVE_IMAGE ?auto_527715 ?auto_527712 ) ( HAVE_IMAGE ?auto_527717 ?auto_527716 ) ( HAVE_IMAGE ?auto_527718 ?auto_527719 ) ( not ( = ?auto_527714 ?auto_527712 ) ) ( not ( = ?auto_527714 ?auto_527716 ) ) ( not ( = ?auto_527714 ?auto_527719 ) ) ( not ( = ?auto_527712 ?auto_527716 ) ) ( not ( = ?auto_527712 ?auto_527719 ) ) ( not ( = ?auto_527716 ?auto_527719 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_527713 ?auto_527714 )
      ( GET-4IMAGE-VERIFY ?auto_527713 ?auto_527714 ?auto_527715 ?auto_527712 ?auto_527717 ?auto_527716 ?auto_527718 ?auto_527719 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_538112 - DIRECTION
      ?auto_538113 - MODE
      ?auto_538114 - DIRECTION
      ?auto_538111 - MODE
      ?auto_538116 - DIRECTION
      ?auto_538115 - MODE
      ?auto_538117 - DIRECTION
      ?auto_538118 - MODE
    )
    :vars
    (
      ?auto_538119 - INSTRUMENT
      ?auto_538120 - SATELLITE
      ?auto_538121 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_538114 ?auto_538112 ) ) ( not ( = ?auto_538116 ?auto_538112 ) ) ( not ( = ?auto_538116 ?auto_538114 ) ) ( not ( = ?auto_538117 ?auto_538112 ) ) ( not ( = ?auto_538117 ?auto_538114 ) ) ( not ( = ?auto_538117 ?auto_538116 ) ) ( CALIBRATED ?auto_538119 ) ( ON_BOARD ?auto_538119 ?auto_538120 ) ( SUPPORTS ?auto_538119 ?auto_538118 ) ( POWER_ON ?auto_538119 ) ( POINTING ?auto_538120 ?auto_538121 ) ( not ( = ?auto_538117 ?auto_538121 ) ) ( HAVE_IMAGE ?auto_538112 ?auto_538113 ) ( not ( = ?auto_538112 ?auto_538121 ) ) ( not ( = ?auto_538113 ?auto_538118 ) ) ( HAVE_IMAGE ?auto_538114 ?auto_538111 ) ( HAVE_IMAGE ?auto_538116 ?auto_538115 ) ( not ( = ?auto_538113 ?auto_538111 ) ) ( not ( = ?auto_538113 ?auto_538115 ) ) ( not ( = ?auto_538114 ?auto_538121 ) ) ( not ( = ?auto_538111 ?auto_538115 ) ) ( not ( = ?auto_538111 ?auto_538118 ) ) ( not ( = ?auto_538116 ?auto_538121 ) ) ( not ( = ?auto_538115 ?auto_538118 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_538112 ?auto_538113 ?auto_538117 ?auto_538118 )
      ( GET-4IMAGE-VERIFY ?auto_538112 ?auto_538113 ?auto_538114 ?auto_538111 ?auto_538116 ?auto_538115 ?auto_538117 ?auto_538118 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_538145 - DIRECTION
      ?auto_538146 - MODE
      ?auto_538147 - DIRECTION
      ?auto_538144 - MODE
      ?auto_538149 - DIRECTION
      ?auto_538148 - MODE
      ?auto_538150 - DIRECTION
      ?auto_538151 - MODE
    )
    :vars
    (
      ?auto_538152 - INSTRUMENT
      ?auto_538153 - SATELLITE
      ?auto_538154 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_538147 ?auto_538145 ) ) ( not ( = ?auto_538149 ?auto_538145 ) ) ( not ( = ?auto_538149 ?auto_538147 ) ) ( not ( = ?auto_538150 ?auto_538145 ) ) ( not ( = ?auto_538150 ?auto_538147 ) ) ( not ( = ?auto_538150 ?auto_538149 ) ) ( CALIBRATED ?auto_538152 ) ( ON_BOARD ?auto_538152 ?auto_538153 ) ( SUPPORTS ?auto_538152 ?auto_538148 ) ( POWER_ON ?auto_538152 ) ( POINTING ?auto_538153 ?auto_538154 ) ( not ( = ?auto_538149 ?auto_538154 ) ) ( HAVE_IMAGE ?auto_538145 ?auto_538146 ) ( not ( = ?auto_538145 ?auto_538154 ) ) ( not ( = ?auto_538146 ?auto_538148 ) ) ( HAVE_IMAGE ?auto_538147 ?auto_538144 ) ( HAVE_IMAGE ?auto_538150 ?auto_538151 ) ( not ( = ?auto_538146 ?auto_538144 ) ) ( not ( = ?auto_538146 ?auto_538151 ) ) ( not ( = ?auto_538147 ?auto_538154 ) ) ( not ( = ?auto_538144 ?auto_538148 ) ) ( not ( = ?auto_538144 ?auto_538151 ) ) ( not ( = ?auto_538148 ?auto_538151 ) ) ( not ( = ?auto_538150 ?auto_538154 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_538145 ?auto_538146 ?auto_538149 ?auto_538148 )
      ( GET-4IMAGE-VERIFY ?auto_538145 ?auto_538146 ?auto_538147 ?auto_538144 ?auto_538149 ?auto_538148 ?auto_538150 ?auto_538151 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_538304 - DIRECTION
      ?auto_538305 - MODE
      ?auto_538306 - DIRECTION
      ?auto_538303 - MODE
      ?auto_538308 - DIRECTION
      ?auto_538307 - MODE
      ?auto_538309 - DIRECTION
      ?auto_538310 - MODE
    )
    :vars
    (
      ?auto_538311 - INSTRUMENT
      ?auto_538312 - SATELLITE
      ?auto_538313 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_538306 ?auto_538304 ) ) ( not ( = ?auto_538308 ?auto_538304 ) ) ( not ( = ?auto_538308 ?auto_538306 ) ) ( not ( = ?auto_538309 ?auto_538304 ) ) ( not ( = ?auto_538309 ?auto_538306 ) ) ( not ( = ?auto_538309 ?auto_538308 ) ) ( CALIBRATED ?auto_538311 ) ( ON_BOARD ?auto_538311 ?auto_538312 ) ( SUPPORTS ?auto_538311 ?auto_538303 ) ( POWER_ON ?auto_538311 ) ( POINTING ?auto_538312 ?auto_538313 ) ( not ( = ?auto_538306 ?auto_538313 ) ) ( HAVE_IMAGE ?auto_538304 ?auto_538305 ) ( not ( = ?auto_538304 ?auto_538313 ) ) ( not ( = ?auto_538305 ?auto_538303 ) ) ( HAVE_IMAGE ?auto_538308 ?auto_538307 ) ( HAVE_IMAGE ?auto_538309 ?auto_538310 ) ( not ( = ?auto_538305 ?auto_538307 ) ) ( not ( = ?auto_538305 ?auto_538310 ) ) ( not ( = ?auto_538303 ?auto_538307 ) ) ( not ( = ?auto_538303 ?auto_538310 ) ) ( not ( = ?auto_538308 ?auto_538313 ) ) ( not ( = ?auto_538307 ?auto_538310 ) ) ( not ( = ?auto_538309 ?auto_538313 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_538304 ?auto_538305 ?auto_538306 ?auto_538303 )
      ( GET-4IMAGE-VERIFY ?auto_538304 ?auto_538305 ?auto_538306 ?auto_538303 ?auto_538308 ?auto_538307 ?auto_538309 ?auto_538310 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_539331 - DIRECTION
      ?auto_539332 - MODE
      ?auto_539333 - DIRECTION
      ?auto_539330 - MODE
      ?auto_539335 - DIRECTION
      ?auto_539334 - MODE
      ?auto_539336 - DIRECTION
      ?auto_539337 - MODE
    )
    :vars
    (
      ?auto_539338 - INSTRUMENT
      ?auto_539339 - SATELLITE
      ?auto_539340 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_539333 ?auto_539331 ) ) ( not ( = ?auto_539335 ?auto_539331 ) ) ( not ( = ?auto_539335 ?auto_539333 ) ) ( not ( = ?auto_539336 ?auto_539331 ) ) ( not ( = ?auto_539336 ?auto_539333 ) ) ( not ( = ?auto_539336 ?auto_539335 ) ) ( CALIBRATED ?auto_539338 ) ( ON_BOARD ?auto_539338 ?auto_539339 ) ( SUPPORTS ?auto_539338 ?auto_539332 ) ( POWER_ON ?auto_539338 ) ( POINTING ?auto_539339 ?auto_539340 ) ( not ( = ?auto_539331 ?auto_539340 ) ) ( HAVE_IMAGE ?auto_539333 ?auto_539330 ) ( not ( = ?auto_539333 ?auto_539340 ) ) ( not ( = ?auto_539330 ?auto_539332 ) ) ( HAVE_IMAGE ?auto_539335 ?auto_539334 ) ( HAVE_IMAGE ?auto_539336 ?auto_539337 ) ( not ( = ?auto_539332 ?auto_539334 ) ) ( not ( = ?auto_539332 ?auto_539337 ) ) ( not ( = ?auto_539330 ?auto_539334 ) ) ( not ( = ?auto_539330 ?auto_539337 ) ) ( not ( = ?auto_539335 ?auto_539340 ) ) ( not ( = ?auto_539334 ?auto_539337 ) ) ( not ( = ?auto_539336 ?auto_539340 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_539333 ?auto_539330 ?auto_539331 ?auto_539332 )
      ( GET-4IMAGE-VERIFY ?auto_539331 ?auto_539332 ?auto_539333 ?auto_539330 ?auto_539335 ?auto_539334 ?auto_539336 ?auto_539337 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_551042 - DIRECTION
      ?auto_551043 - MODE
      ?auto_551044 - DIRECTION
      ?auto_551041 - MODE
      ?auto_551046 - DIRECTION
      ?auto_551045 - MODE
      ?auto_551047 - DIRECTION
      ?auto_551048 - MODE
    )
    :vars
    (
      ?auto_551049 - INSTRUMENT
      ?auto_551050 - SATELLITE
      ?auto_551051 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_551044 ?auto_551042 ) ) ( not ( = ?auto_551046 ?auto_551042 ) ) ( not ( = ?auto_551046 ?auto_551044 ) ) ( not ( = ?auto_551047 ?auto_551042 ) ) ( not ( = ?auto_551047 ?auto_551044 ) ) ( not ( = ?auto_551047 ?auto_551046 ) ) ( ON_BOARD ?auto_551049 ?auto_551050 ) ( SUPPORTS ?auto_551049 ?auto_551048 ) ( POWER_ON ?auto_551049 ) ( POINTING ?auto_551050 ?auto_551051 ) ( not ( = ?auto_551047 ?auto_551051 ) ) ( HAVE_IMAGE ?auto_551042 ?auto_551043 ) ( not ( = ?auto_551042 ?auto_551051 ) ) ( not ( = ?auto_551043 ?auto_551048 ) ) ( CALIBRATION_TARGET ?auto_551049 ?auto_551051 ) ( NOT_CALIBRATED ?auto_551049 ) ( HAVE_IMAGE ?auto_551044 ?auto_551041 ) ( HAVE_IMAGE ?auto_551046 ?auto_551045 ) ( not ( = ?auto_551043 ?auto_551041 ) ) ( not ( = ?auto_551043 ?auto_551045 ) ) ( not ( = ?auto_551044 ?auto_551051 ) ) ( not ( = ?auto_551041 ?auto_551045 ) ) ( not ( = ?auto_551041 ?auto_551048 ) ) ( not ( = ?auto_551046 ?auto_551051 ) ) ( not ( = ?auto_551045 ?auto_551048 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_551042 ?auto_551043 ?auto_551047 ?auto_551048 )
      ( GET-4IMAGE-VERIFY ?auto_551042 ?auto_551043 ?auto_551044 ?auto_551041 ?auto_551046 ?auto_551045 ?auto_551047 ?auto_551048 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_551075 - DIRECTION
      ?auto_551076 - MODE
      ?auto_551077 - DIRECTION
      ?auto_551074 - MODE
      ?auto_551079 - DIRECTION
      ?auto_551078 - MODE
      ?auto_551080 - DIRECTION
      ?auto_551081 - MODE
    )
    :vars
    (
      ?auto_551082 - INSTRUMENT
      ?auto_551083 - SATELLITE
      ?auto_551084 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_551077 ?auto_551075 ) ) ( not ( = ?auto_551079 ?auto_551075 ) ) ( not ( = ?auto_551079 ?auto_551077 ) ) ( not ( = ?auto_551080 ?auto_551075 ) ) ( not ( = ?auto_551080 ?auto_551077 ) ) ( not ( = ?auto_551080 ?auto_551079 ) ) ( ON_BOARD ?auto_551082 ?auto_551083 ) ( SUPPORTS ?auto_551082 ?auto_551078 ) ( POWER_ON ?auto_551082 ) ( POINTING ?auto_551083 ?auto_551084 ) ( not ( = ?auto_551079 ?auto_551084 ) ) ( HAVE_IMAGE ?auto_551075 ?auto_551076 ) ( not ( = ?auto_551075 ?auto_551084 ) ) ( not ( = ?auto_551076 ?auto_551078 ) ) ( CALIBRATION_TARGET ?auto_551082 ?auto_551084 ) ( NOT_CALIBRATED ?auto_551082 ) ( HAVE_IMAGE ?auto_551077 ?auto_551074 ) ( HAVE_IMAGE ?auto_551080 ?auto_551081 ) ( not ( = ?auto_551076 ?auto_551074 ) ) ( not ( = ?auto_551076 ?auto_551081 ) ) ( not ( = ?auto_551077 ?auto_551084 ) ) ( not ( = ?auto_551074 ?auto_551078 ) ) ( not ( = ?auto_551074 ?auto_551081 ) ) ( not ( = ?auto_551078 ?auto_551081 ) ) ( not ( = ?auto_551080 ?auto_551084 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_551075 ?auto_551076 ?auto_551079 ?auto_551078 )
      ( GET-4IMAGE-VERIFY ?auto_551075 ?auto_551076 ?auto_551077 ?auto_551074 ?auto_551079 ?auto_551078 ?auto_551080 ?auto_551081 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_551234 - DIRECTION
      ?auto_551235 - MODE
      ?auto_551236 - DIRECTION
      ?auto_551233 - MODE
      ?auto_551238 - DIRECTION
      ?auto_551237 - MODE
      ?auto_551239 - DIRECTION
      ?auto_551240 - MODE
    )
    :vars
    (
      ?auto_551241 - INSTRUMENT
      ?auto_551242 - SATELLITE
      ?auto_551243 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_551236 ?auto_551234 ) ) ( not ( = ?auto_551238 ?auto_551234 ) ) ( not ( = ?auto_551238 ?auto_551236 ) ) ( not ( = ?auto_551239 ?auto_551234 ) ) ( not ( = ?auto_551239 ?auto_551236 ) ) ( not ( = ?auto_551239 ?auto_551238 ) ) ( ON_BOARD ?auto_551241 ?auto_551242 ) ( SUPPORTS ?auto_551241 ?auto_551233 ) ( POWER_ON ?auto_551241 ) ( POINTING ?auto_551242 ?auto_551243 ) ( not ( = ?auto_551236 ?auto_551243 ) ) ( HAVE_IMAGE ?auto_551234 ?auto_551235 ) ( not ( = ?auto_551234 ?auto_551243 ) ) ( not ( = ?auto_551235 ?auto_551233 ) ) ( CALIBRATION_TARGET ?auto_551241 ?auto_551243 ) ( NOT_CALIBRATED ?auto_551241 ) ( HAVE_IMAGE ?auto_551238 ?auto_551237 ) ( HAVE_IMAGE ?auto_551239 ?auto_551240 ) ( not ( = ?auto_551235 ?auto_551237 ) ) ( not ( = ?auto_551235 ?auto_551240 ) ) ( not ( = ?auto_551233 ?auto_551237 ) ) ( not ( = ?auto_551233 ?auto_551240 ) ) ( not ( = ?auto_551238 ?auto_551243 ) ) ( not ( = ?auto_551237 ?auto_551240 ) ) ( not ( = ?auto_551239 ?auto_551243 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_551234 ?auto_551235 ?auto_551236 ?auto_551233 )
      ( GET-4IMAGE-VERIFY ?auto_551234 ?auto_551235 ?auto_551236 ?auto_551233 ?auto_551238 ?auto_551237 ?auto_551239 ?auto_551240 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_552261 - DIRECTION
      ?auto_552262 - MODE
      ?auto_552263 - DIRECTION
      ?auto_552260 - MODE
      ?auto_552265 - DIRECTION
      ?auto_552264 - MODE
      ?auto_552266 - DIRECTION
      ?auto_552267 - MODE
    )
    :vars
    (
      ?auto_552268 - INSTRUMENT
      ?auto_552269 - SATELLITE
      ?auto_552270 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_552263 ?auto_552261 ) ) ( not ( = ?auto_552265 ?auto_552261 ) ) ( not ( = ?auto_552265 ?auto_552263 ) ) ( not ( = ?auto_552266 ?auto_552261 ) ) ( not ( = ?auto_552266 ?auto_552263 ) ) ( not ( = ?auto_552266 ?auto_552265 ) ) ( ON_BOARD ?auto_552268 ?auto_552269 ) ( SUPPORTS ?auto_552268 ?auto_552262 ) ( POWER_ON ?auto_552268 ) ( POINTING ?auto_552269 ?auto_552270 ) ( not ( = ?auto_552261 ?auto_552270 ) ) ( HAVE_IMAGE ?auto_552263 ?auto_552260 ) ( not ( = ?auto_552263 ?auto_552270 ) ) ( not ( = ?auto_552260 ?auto_552262 ) ) ( CALIBRATION_TARGET ?auto_552268 ?auto_552270 ) ( NOT_CALIBRATED ?auto_552268 ) ( HAVE_IMAGE ?auto_552265 ?auto_552264 ) ( HAVE_IMAGE ?auto_552266 ?auto_552267 ) ( not ( = ?auto_552262 ?auto_552264 ) ) ( not ( = ?auto_552262 ?auto_552267 ) ) ( not ( = ?auto_552260 ?auto_552264 ) ) ( not ( = ?auto_552260 ?auto_552267 ) ) ( not ( = ?auto_552265 ?auto_552270 ) ) ( not ( = ?auto_552264 ?auto_552267 ) ) ( not ( = ?auto_552266 ?auto_552270 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_552263 ?auto_552260 ?auto_552261 ?auto_552262 )
      ( GET-4IMAGE-VERIFY ?auto_552261 ?auto_552262 ?auto_552263 ?auto_552260 ?auto_552265 ?auto_552264 ?auto_552266 ?auto_552267 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_563972 - DIRECTION
      ?auto_563973 - MODE
      ?auto_563974 - DIRECTION
      ?auto_563971 - MODE
      ?auto_563976 - DIRECTION
      ?auto_563975 - MODE
      ?auto_563977 - DIRECTION
      ?auto_563978 - MODE
    )
    :vars
    (
      ?auto_563981 - INSTRUMENT
      ?auto_563979 - SATELLITE
      ?auto_563980 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_563974 ?auto_563972 ) ) ( not ( = ?auto_563976 ?auto_563972 ) ) ( not ( = ?auto_563976 ?auto_563974 ) ) ( not ( = ?auto_563977 ?auto_563972 ) ) ( not ( = ?auto_563977 ?auto_563974 ) ) ( not ( = ?auto_563977 ?auto_563976 ) ) ( ON_BOARD ?auto_563981 ?auto_563979 ) ( SUPPORTS ?auto_563981 ?auto_563978 ) ( POINTING ?auto_563979 ?auto_563980 ) ( not ( = ?auto_563977 ?auto_563980 ) ) ( HAVE_IMAGE ?auto_563972 ?auto_563973 ) ( not ( = ?auto_563972 ?auto_563980 ) ) ( not ( = ?auto_563973 ?auto_563978 ) ) ( CALIBRATION_TARGET ?auto_563981 ?auto_563980 ) ( POWER_AVAIL ?auto_563979 ) ( HAVE_IMAGE ?auto_563974 ?auto_563971 ) ( HAVE_IMAGE ?auto_563976 ?auto_563975 ) ( not ( = ?auto_563973 ?auto_563971 ) ) ( not ( = ?auto_563973 ?auto_563975 ) ) ( not ( = ?auto_563974 ?auto_563980 ) ) ( not ( = ?auto_563971 ?auto_563975 ) ) ( not ( = ?auto_563971 ?auto_563978 ) ) ( not ( = ?auto_563976 ?auto_563980 ) ) ( not ( = ?auto_563975 ?auto_563978 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_563972 ?auto_563973 ?auto_563977 ?auto_563978 )
      ( GET-4IMAGE-VERIFY ?auto_563972 ?auto_563973 ?auto_563974 ?auto_563971 ?auto_563976 ?auto_563975 ?auto_563977 ?auto_563978 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_564005 - DIRECTION
      ?auto_564006 - MODE
      ?auto_564007 - DIRECTION
      ?auto_564004 - MODE
      ?auto_564009 - DIRECTION
      ?auto_564008 - MODE
      ?auto_564010 - DIRECTION
      ?auto_564011 - MODE
    )
    :vars
    (
      ?auto_564014 - INSTRUMENT
      ?auto_564012 - SATELLITE
      ?auto_564013 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_564007 ?auto_564005 ) ) ( not ( = ?auto_564009 ?auto_564005 ) ) ( not ( = ?auto_564009 ?auto_564007 ) ) ( not ( = ?auto_564010 ?auto_564005 ) ) ( not ( = ?auto_564010 ?auto_564007 ) ) ( not ( = ?auto_564010 ?auto_564009 ) ) ( ON_BOARD ?auto_564014 ?auto_564012 ) ( SUPPORTS ?auto_564014 ?auto_564008 ) ( POINTING ?auto_564012 ?auto_564013 ) ( not ( = ?auto_564009 ?auto_564013 ) ) ( HAVE_IMAGE ?auto_564005 ?auto_564006 ) ( not ( = ?auto_564005 ?auto_564013 ) ) ( not ( = ?auto_564006 ?auto_564008 ) ) ( CALIBRATION_TARGET ?auto_564014 ?auto_564013 ) ( POWER_AVAIL ?auto_564012 ) ( HAVE_IMAGE ?auto_564007 ?auto_564004 ) ( HAVE_IMAGE ?auto_564010 ?auto_564011 ) ( not ( = ?auto_564006 ?auto_564004 ) ) ( not ( = ?auto_564006 ?auto_564011 ) ) ( not ( = ?auto_564007 ?auto_564013 ) ) ( not ( = ?auto_564004 ?auto_564008 ) ) ( not ( = ?auto_564004 ?auto_564011 ) ) ( not ( = ?auto_564008 ?auto_564011 ) ) ( not ( = ?auto_564010 ?auto_564013 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_564005 ?auto_564006 ?auto_564009 ?auto_564008 )
      ( GET-4IMAGE-VERIFY ?auto_564005 ?auto_564006 ?auto_564007 ?auto_564004 ?auto_564009 ?auto_564008 ?auto_564010 ?auto_564011 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_564164 - DIRECTION
      ?auto_564165 - MODE
      ?auto_564166 - DIRECTION
      ?auto_564163 - MODE
      ?auto_564168 - DIRECTION
      ?auto_564167 - MODE
      ?auto_564169 - DIRECTION
      ?auto_564170 - MODE
    )
    :vars
    (
      ?auto_564173 - INSTRUMENT
      ?auto_564171 - SATELLITE
      ?auto_564172 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_564166 ?auto_564164 ) ) ( not ( = ?auto_564168 ?auto_564164 ) ) ( not ( = ?auto_564168 ?auto_564166 ) ) ( not ( = ?auto_564169 ?auto_564164 ) ) ( not ( = ?auto_564169 ?auto_564166 ) ) ( not ( = ?auto_564169 ?auto_564168 ) ) ( ON_BOARD ?auto_564173 ?auto_564171 ) ( SUPPORTS ?auto_564173 ?auto_564163 ) ( POINTING ?auto_564171 ?auto_564172 ) ( not ( = ?auto_564166 ?auto_564172 ) ) ( HAVE_IMAGE ?auto_564164 ?auto_564165 ) ( not ( = ?auto_564164 ?auto_564172 ) ) ( not ( = ?auto_564165 ?auto_564163 ) ) ( CALIBRATION_TARGET ?auto_564173 ?auto_564172 ) ( POWER_AVAIL ?auto_564171 ) ( HAVE_IMAGE ?auto_564168 ?auto_564167 ) ( HAVE_IMAGE ?auto_564169 ?auto_564170 ) ( not ( = ?auto_564165 ?auto_564167 ) ) ( not ( = ?auto_564165 ?auto_564170 ) ) ( not ( = ?auto_564163 ?auto_564167 ) ) ( not ( = ?auto_564163 ?auto_564170 ) ) ( not ( = ?auto_564168 ?auto_564172 ) ) ( not ( = ?auto_564167 ?auto_564170 ) ) ( not ( = ?auto_564169 ?auto_564172 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_564164 ?auto_564165 ?auto_564166 ?auto_564163 )
      ( GET-4IMAGE-VERIFY ?auto_564164 ?auto_564165 ?auto_564166 ?auto_564163 ?auto_564168 ?auto_564167 ?auto_564169 ?auto_564170 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_565191 - DIRECTION
      ?auto_565192 - MODE
      ?auto_565193 - DIRECTION
      ?auto_565190 - MODE
      ?auto_565195 - DIRECTION
      ?auto_565194 - MODE
      ?auto_565196 - DIRECTION
      ?auto_565197 - MODE
    )
    :vars
    (
      ?auto_565200 - INSTRUMENT
      ?auto_565198 - SATELLITE
      ?auto_565199 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_565193 ?auto_565191 ) ) ( not ( = ?auto_565195 ?auto_565191 ) ) ( not ( = ?auto_565195 ?auto_565193 ) ) ( not ( = ?auto_565196 ?auto_565191 ) ) ( not ( = ?auto_565196 ?auto_565193 ) ) ( not ( = ?auto_565196 ?auto_565195 ) ) ( ON_BOARD ?auto_565200 ?auto_565198 ) ( SUPPORTS ?auto_565200 ?auto_565192 ) ( POINTING ?auto_565198 ?auto_565199 ) ( not ( = ?auto_565191 ?auto_565199 ) ) ( HAVE_IMAGE ?auto_565193 ?auto_565190 ) ( not ( = ?auto_565193 ?auto_565199 ) ) ( not ( = ?auto_565190 ?auto_565192 ) ) ( CALIBRATION_TARGET ?auto_565200 ?auto_565199 ) ( POWER_AVAIL ?auto_565198 ) ( HAVE_IMAGE ?auto_565195 ?auto_565194 ) ( HAVE_IMAGE ?auto_565196 ?auto_565197 ) ( not ( = ?auto_565192 ?auto_565194 ) ) ( not ( = ?auto_565192 ?auto_565197 ) ) ( not ( = ?auto_565190 ?auto_565194 ) ) ( not ( = ?auto_565190 ?auto_565197 ) ) ( not ( = ?auto_565195 ?auto_565199 ) ) ( not ( = ?auto_565194 ?auto_565197 ) ) ( not ( = ?auto_565196 ?auto_565199 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_565193 ?auto_565190 ?auto_565191 ?auto_565192 )
      ( GET-4IMAGE-VERIFY ?auto_565191 ?auto_565192 ?auto_565193 ?auto_565190 ?auto_565195 ?auto_565194 ?auto_565196 ?auto_565197 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_576513 - DIRECTION
      ?auto_576514 - MODE
      ?auto_576515 - DIRECTION
      ?auto_576512 - MODE
      ?auto_576517 - DIRECTION
      ?auto_576516 - MODE
    )
    :vars
    (
      ?auto_576519 - INSTRUMENT
      ?auto_576520 - SATELLITE
      ?auto_576518 - DIRECTION
      ?auto_576521 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_576515 ?auto_576513 ) ) ( not ( = ?auto_576517 ?auto_576513 ) ) ( not ( = ?auto_576517 ?auto_576515 ) ) ( ON_BOARD ?auto_576519 ?auto_576520 ) ( SUPPORTS ?auto_576519 ?auto_576516 ) ( not ( = ?auto_576517 ?auto_576518 ) ) ( HAVE_IMAGE ?auto_576513 ?auto_576514 ) ( not ( = ?auto_576513 ?auto_576518 ) ) ( not ( = ?auto_576514 ?auto_576516 ) ) ( CALIBRATION_TARGET ?auto_576519 ?auto_576518 ) ( POWER_AVAIL ?auto_576520 ) ( POINTING ?auto_576520 ?auto_576521 ) ( not ( = ?auto_576518 ?auto_576521 ) ) ( not ( = ?auto_576517 ?auto_576521 ) ) ( not ( = ?auto_576513 ?auto_576521 ) ) ( HAVE_IMAGE ?auto_576515 ?auto_576512 ) ( not ( = ?auto_576514 ?auto_576512 ) ) ( not ( = ?auto_576515 ?auto_576518 ) ) ( not ( = ?auto_576515 ?auto_576521 ) ) ( not ( = ?auto_576512 ?auto_576516 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_576513 ?auto_576514 ?auto_576517 ?auto_576516 )
      ( GET-3IMAGE-VERIFY ?auto_576513 ?auto_576514 ?auto_576515 ?auto_576512 ?auto_576517 ?auto_576516 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_576542 - DIRECTION
      ?auto_576543 - MODE
      ?auto_576544 - DIRECTION
      ?auto_576541 - MODE
      ?auto_576546 - DIRECTION
      ?auto_576545 - MODE
    )
    :vars
    (
      ?auto_576548 - INSTRUMENT
      ?auto_576549 - SATELLITE
      ?auto_576547 - DIRECTION
      ?auto_576550 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_576544 ?auto_576542 ) ) ( not ( = ?auto_576546 ?auto_576542 ) ) ( not ( = ?auto_576546 ?auto_576544 ) ) ( ON_BOARD ?auto_576548 ?auto_576549 ) ( SUPPORTS ?auto_576548 ?auto_576541 ) ( not ( = ?auto_576544 ?auto_576547 ) ) ( HAVE_IMAGE ?auto_576542 ?auto_576543 ) ( not ( = ?auto_576542 ?auto_576547 ) ) ( not ( = ?auto_576543 ?auto_576541 ) ) ( CALIBRATION_TARGET ?auto_576548 ?auto_576547 ) ( POWER_AVAIL ?auto_576549 ) ( POINTING ?auto_576549 ?auto_576550 ) ( not ( = ?auto_576547 ?auto_576550 ) ) ( not ( = ?auto_576544 ?auto_576550 ) ) ( not ( = ?auto_576542 ?auto_576550 ) ) ( HAVE_IMAGE ?auto_576546 ?auto_576545 ) ( not ( = ?auto_576543 ?auto_576545 ) ) ( not ( = ?auto_576541 ?auto_576545 ) ) ( not ( = ?auto_576546 ?auto_576547 ) ) ( not ( = ?auto_576546 ?auto_576550 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_576542 ?auto_576543 ?auto_576544 ?auto_576541 )
      ( GET-3IMAGE-VERIFY ?auto_576542 ?auto_576543 ?auto_576544 ?auto_576541 ?auto_576546 ?auto_576545 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_576704 - DIRECTION
      ?auto_576705 - MODE
      ?auto_576706 - DIRECTION
      ?auto_576703 - MODE
      ?auto_576708 - DIRECTION
      ?auto_576707 - MODE
    )
    :vars
    (
      ?auto_576710 - INSTRUMENT
      ?auto_576711 - SATELLITE
      ?auto_576709 - DIRECTION
      ?auto_576712 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_576706 ?auto_576704 ) ) ( not ( = ?auto_576708 ?auto_576704 ) ) ( not ( = ?auto_576708 ?auto_576706 ) ) ( ON_BOARD ?auto_576710 ?auto_576711 ) ( SUPPORTS ?auto_576710 ?auto_576705 ) ( not ( = ?auto_576704 ?auto_576709 ) ) ( HAVE_IMAGE ?auto_576706 ?auto_576703 ) ( not ( = ?auto_576706 ?auto_576709 ) ) ( not ( = ?auto_576703 ?auto_576705 ) ) ( CALIBRATION_TARGET ?auto_576710 ?auto_576709 ) ( POWER_AVAIL ?auto_576711 ) ( POINTING ?auto_576711 ?auto_576712 ) ( not ( = ?auto_576709 ?auto_576712 ) ) ( not ( = ?auto_576704 ?auto_576712 ) ) ( not ( = ?auto_576706 ?auto_576712 ) ) ( HAVE_IMAGE ?auto_576708 ?auto_576707 ) ( not ( = ?auto_576705 ?auto_576707 ) ) ( not ( = ?auto_576703 ?auto_576707 ) ) ( not ( = ?auto_576708 ?auto_576709 ) ) ( not ( = ?auto_576708 ?auto_576712 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_576706 ?auto_576703 ?auto_576704 ?auto_576705 )
      ( GET-3IMAGE-VERIFY ?auto_576704 ?auto_576705 ?auto_576706 ?auto_576703 ?auto_576708 ?auto_576707 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_576957 - DIRECTION
      ?auto_576958 - MODE
      ?auto_576959 - DIRECTION
      ?auto_576956 - MODE
      ?auto_576961 - DIRECTION
      ?auto_576960 - MODE
      ?auto_576962 - DIRECTION
      ?auto_576963 - MODE
    )
    :vars
    (
      ?auto_576965 - INSTRUMENT
      ?auto_576966 - SATELLITE
      ?auto_576964 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_576959 ?auto_576957 ) ) ( not ( = ?auto_576961 ?auto_576957 ) ) ( not ( = ?auto_576961 ?auto_576959 ) ) ( not ( = ?auto_576962 ?auto_576957 ) ) ( not ( = ?auto_576962 ?auto_576959 ) ) ( not ( = ?auto_576962 ?auto_576961 ) ) ( ON_BOARD ?auto_576965 ?auto_576966 ) ( SUPPORTS ?auto_576965 ?auto_576963 ) ( not ( = ?auto_576962 ?auto_576964 ) ) ( HAVE_IMAGE ?auto_576957 ?auto_576958 ) ( not ( = ?auto_576957 ?auto_576964 ) ) ( not ( = ?auto_576958 ?auto_576963 ) ) ( CALIBRATION_TARGET ?auto_576965 ?auto_576964 ) ( POWER_AVAIL ?auto_576966 ) ( POINTING ?auto_576966 ?auto_576961 ) ( not ( = ?auto_576964 ?auto_576961 ) ) ( HAVE_IMAGE ?auto_576959 ?auto_576956 ) ( HAVE_IMAGE ?auto_576961 ?auto_576960 ) ( not ( = ?auto_576958 ?auto_576956 ) ) ( not ( = ?auto_576958 ?auto_576960 ) ) ( not ( = ?auto_576959 ?auto_576964 ) ) ( not ( = ?auto_576956 ?auto_576960 ) ) ( not ( = ?auto_576956 ?auto_576963 ) ) ( not ( = ?auto_576960 ?auto_576963 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_576957 ?auto_576958 ?auto_576962 ?auto_576963 )
      ( GET-4IMAGE-VERIFY ?auto_576957 ?auto_576958 ?auto_576959 ?auto_576956 ?auto_576961 ?auto_576960 ?auto_576962 ?auto_576963 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_576992 - DIRECTION
      ?auto_576993 - MODE
      ?auto_576994 - DIRECTION
      ?auto_576991 - MODE
      ?auto_576996 - DIRECTION
      ?auto_576995 - MODE
      ?auto_576997 - DIRECTION
      ?auto_576998 - MODE
    )
    :vars
    (
      ?auto_577000 - INSTRUMENT
      ?auto_577001 - SATELLITE
      ?auto_576999 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_576994 ?auto_576992 ) ) ( not ( = ?auto_576996 ?auto_576992 ) ) ( not ( = ?auto_576996 ?auto_576994 ) ) ( not ( = ?auto_576997 ?auto_576992 ) ) ( not ( = ?auto_576997 ?auto_576994 ) ) ( not ( = ?auto_576997 ?auto_576996 ) ) ( ON_BOARD ?auto_577000 ?auto_577001 ) ( SUPPORTS ?auto_577000 ?auto_576995 ) ( not ( = ?auto_576996 ?auto_576999 ) ) ( HAVE_IMAGE ?auto_576992 ?auto_576993 ) ( not ( = ?auto_576992 ?auto_576999 ) ) ( not ( = ?auto_576993 ?auto_576995 ) ) ( CALIBRATION_TARGET ?auto_577000 ?auto_576999 ) ( POWER_AVAIL ?auto_577001 ) ( POINTING ?auto_577001 ?auto_576997 ) ( not ( = ?auto_576999 ?auto_576997 ) ) ( HAVE_IMAGE ?auto_576994 ?auto_576991 ) ( HAVE_IMAGE ?auto_576997 ?auto_576998 ) ( not ( = ?auto_576993 ?auto_576991 ) ) ( not ( = ?auto_576993 ?auto_576998 ) ) ( not ( = ?auto_576994 ?auto_576999 ) ) ( not ( = ?auto_576991 ?auto_576995 ) ) ( not ( = ?auto_576991 ?auto_576998 ) ) ( not ( = ?auto_576995 ?auto_576998 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_576992 ?auto_576993 ?auto_576996 ?auto_576995 )
      ( GET-4IMAGE-VERIFY ?auto_576992 ?auto_576993 ?auto_576994 ?auto_576991 ?auto_576996 ?auto_576995 ?auto_576997 ?auto_576998 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_577026 - DIRECTION
      ?auto_577027 - MODE
      ?auto_577028 - DIRECTION
      ?auto_577025 - MODE
      ?auto_577030 - DIRECTION
      ?auto_577029 - MODE
      ?auto_577031 - DIRECTION
      ?auto_577032 - MODE
    )
    :vars
    (
      ?auto_577034 - INSTRUMENT
      ?auto_577035 - SATELLITE
      ?auto_577033 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_577028 ?auto_577026 ) ) ( not ( = ?auto_577030 ?auto_577026 ) ) ( not ( = ?auto_577030 ?auto_577028 ) ) ( not ( = ?auto_577031 ?auto_577026 ) ) ( not ( = ?auto_577031 ?auto_577028 ) ) ( not ( = ?auto_577031 ?auto_577030 ) ) ( ON_BOARD ?auto_577034 ?auto_577035 ) ( SUPPORTS ?auto_577034 ?auto_577032 ) ( not ( = ?auto_577031 ?auto_577033 ) ) ( HAVE_IMAGE ?auto_577026 ?auto_577027 ) ( not ( = ?auto_577026 ?auto_577033 ) ) ( not ( = ?auto_577027 ?auto_577032 ) ) ( CALIBRATION_TARGET ?auto_577034 ?auto_577033 ) ( POWER_AVAIL ?auto_577035 ) ( POINTING ?auto_577035 ?auto_577028 ) ( not ( = ?auto_577033 ?auto_577028 ) ) ( HAVE_IMAGE ?auto_577028 ?auto_577025 ) ( HAVE_IMAGE ?auto_577030 ?auto_577029 ) ( not ( = ?auto_577027 ?auto_577025 ) ) ( not ( = ?auto_577027 ?auto_577029 ) ) ( not ( = ?auto_577025 ?auto_577029 ) ) ( not ( = ?auto_577025 ?auto_577032 ) ) ( not ( = ?auto_577030 ?auto_577033 ) ) ( not ( = ?auto_577029 ?auto_577032 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_577026 ?auto_577027 ?auto_577031 ?auto_577032 )
      ( GET-4IMAGE-VERIFY ?auto_577026 ?auto_577027 ?auto_577028 ?auto_577025 ?auto_577030 ?auto_577029 ?auto_577031 ?auto_577032 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_577059 - DIRECTION
      ?auto_577060 - MODE
      ?auto_577061 - DIRECTION
      ?auto_577058 - MODE
      ?auto_577063 - DIRECTION
      ?auto_577062 - MODE
      ?auto_577064 - DIRECTION
      ?auto_577065 - MODE
    )
    :vars
    (
      ?auto_577067 - INSTRUMENT
      ?auto_577068 - SATELLITE
      ?auto_577066 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_577061 ?auto_577059 ) ) ( not ( = ?auto_577063 ?auto_577059 ) ) ( not ( = ?auto_577063 ?auto_577061 ) ) ( not ( = ?auto_577064 ?auto_577059 ) ) ( not ( = ?auto_577064 ?auto_577061 ) ) ( not ( = ?auto_577064 ?auto_577063 ) ) ( ON_BOARD ?auto_577067 ?auto_577068 ) ( SUPPORTS ?auto_577067 ?auto_577062 ) ( not ( = ?auto_577063 ?auto_577066 ) ) ( HAVE_IMAGE ?auto_577059 ?auto_577060 ) ( not ( = ?auto_577059 ?auto_577066 ) ) ( not ( = ?auto_577060 ?auto_577062 ) ) ( CALIBRATION_TARGET ?auto_577067 ?auto_577066 ) ( POWER_AVAIL ?auto_577068 ) ( POINTING ?auto_577068 ?auto_577061 ) ( not ( = ?auto_577066 ?auto_577061 ) ) ( HAVE_IMAGE ?auto_577061 ?auto_577058 ) ( HAVE_IMAGE ?auto_577064 ?auto_577065 ) ( not ( = ?auto_577060 ?auto_577058 ) ) ( not ( = ?auto_577060 ?auto_577065 ) ) ( not ( = ?auto_577058 ?auto_577062 ) ) ( not ( = ?auto_577058 ?auto_577065 ) ) ( not ( = ?auto_577062 ?auto_577065 ) ) ( not ( = ?auto_577064 ?auto_577066 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_577059 ?auto_577060 ?auto_577063 ?auto_577062 )
      ( GET-4IMAGE-VERIFY ?auto_577059 ?auto_577060 ?auto_577061 ?auto_577058 ?auto_577063 ?auto_577062 ?auto_577064 ?auto_577065 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_577163 - DIRECTION
      ?auto_577164 - MODE
      ?auto_577165 - DIRECTION
      ?auto_577162 - MODE
      ?auto_577167 - DIRECTION
      ?auto_577166 - MODE
      ?auto_577168 - DIRECTION
      ?auto_577169 - MODE
    )
    :vars
    (
      ?auto_577171 - INSTRUMENT
      ?auto_577172 - SATELLITE
      ?auto_577170 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_577165 ?auto_577163 ) ) ( not ( = ?auto_577167 ?auto_577163 ) ) ( not ( = ?auto_577167 ?auto_577165 ) ) ( not ( = ?auto_577168 ?auto_577163 ) ) ( not ( = ?auto_577168 ?auto_577165 ) ) ( not ( = ?auto_577168 ?auto_577167 ) ) ( ON_BOARD ?auto_577171 ?auto_577172 ) ( SUPPORTS ?auto_577171 ?auto_577162 ) ( not ( = ?auto_577165 ?auto_577170 ) ) ( HAVE_IMAGE ?auto_577163 ?auto_577164 ) ( not ( = ?auto_577163 ?auto_577170 ) ) ( not ( = ?auto_577164 ?auto_577162 ) ) ( CALIBRATION_TARGET ?auto_577171 ?auto_577170 ) ( POWER_AVAIL ?auto_577172 ) ( POINTING ?auto_577172 ?auto_577168 ) ( not ( = ?auto_577170 ?auto_577168 ) ) ( HAVE_IMAGE ?auto_577167 ?auto_577166 ) ( HAVE_IMAGE ?auto_577168 ?auto_577169 ) ( not ( = ?auto_577164 ?auto_577166 ) ) ( not ( = ?auto_577164 ?auto_577169 ) ) ( not ( = ?auto_577162 ?auto_577166 ) ) ( not ( = ?auto_577162 ?auto_577169 ) ) ( not ( = ?auto_577167 ?auto_577170 ) ) ( not ( = ?auto_577166 ?auto_577169 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_577163 ?auto_577164 ?auto_577165 ?auto_577162 )
      ( GET-4IMAGE-VERIFY ?auto_577163 ?auto_577164 ?auto_577165 ?auto_577162 ?auto_577167 ?auto_577166 ?auto_577168 ?auto_577169 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_577197 - DIRECTION
      ?auto_577198 - MODE
      ?auto_577199 - DIRECTION
      ?auto_577196 - MODE
      ?auto_577201 - DIRECTION
      ?auto_577200 - MODE
      ?auto_577202 - DIRECTION
      ?auto_577203 - MODE
    )
    :vars
    (
      ?auto_577205 - INSTRUMENT
      ?auto_577206 - SATELLITE
      ?auto_577204 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_577199 ?auto_577197 ) ) ( not ( = ?auto_577201 ?auto_577197 ) ) ( not ( = ?auto_577201 ?auto_577199 ) ) ( not ( = ?auto_577202 ?auto_577197 ) ) ( not ( = ?auto_577202 ?auto_577199 ) ) ( not ( = ?auto_577202 ?auto_577201 ) ) ( ON_BOARD ?auto_577205 ?auto_577206 ) ( SUPPORTS ?auto_577205 ?auto_577196 ) ( not ( = ?auto_577199 ?auto_577204 ) ) ( HAVE_IMAGE ?auto_577197 ?auto_577198 ) ( not ( = ?auto_577197 ?auto_577204 ) ) ( not ( = ?auto_577198 ?auto_577196 ) ) ( CALIBRATION_TARGET ?auto_577205 ?auto_577204 ) ( POWER_AVAIL ?auto_577206 ) ( POINTING ?auto_577206 ?auto_577201 ) ( not ( = ?auto_577204 ?auto_577201 ) ) ( HAVE_IMAGE ?auto_577201 ?auto_577200 ) ( HAVE_IMAGE ?auto_577202 ?auto_577203 ) ( not ( = ?auto_577198 ?auto_577200 ) ) ( not ( = ?auto_577198 ?auto_577203 ) ) ( not ( = ?auto_577196 ?auto_577200 ) ) ( not ( = ?auto_577196 ?auto_577203 ) ) ( not ( = ?auto_577200 ?auto_577203 ) ) ( not ( = ?auto_577202 ?auto_577204 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_577197 ?auto_577198 ?auto_577199 ?auto_577196 )
      ( GET-4IMAGE-VERIFY ?auto_577197 ?auto_577198 ?auto_577199 ?auto_577196 ?auto_577201 ?auto_577200 ?auto_577202 ?auto_577203 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_577734 - DIRECTION
      ?auto_577735 - MODE
      ?auto_577736 - DIRECTION
      ?auto_577733 - MODE
      ?auto_577738 - DIRECTION
      ?auto_577737 - MODE
      ?auto_577739 - DIRECTION
      ?auto_577740 - MODE
    )
    :vars
    (
      ?auto_577742 - INSTRUMENT
      ?auto_577743 - SATELLITE
      ?auto_577741 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_577736 ?auto_577734 ) ) ( not ( = ?auto_577738 ?auto_577734 ) ) ( not ( = ?auto_577738 ?auto_577736 ) ) ( not ( = ?auto_577739 ?auto_577734 ) ) ( not ( = ?auto_577739 ?auto_577736 ) ) ( not ( = ?auto_577739 ?auto_577738 ) ) ( ON_BOARD ?auto_577742 ?auto_577743 ) ( SUPPORTS ?auto_577742 ?auto_577740 ) ( not ( = ?auto_577739 ?auto_577741 ) ) ( HAVE_IMAGE ?auto_577736 ?auto_577733 ) ( not ( = ?auto_577736 ?auto_577741 ) ) ( not ( = ?auto_577733 ?auto_577740 ) ) ( CALIBRATION_TARGET ?auto_577742 ?auto_577741 ) ( POWER_AVAIL ?auto_577743 ) ( POINTING ?auto_577743 ?auto_577734 ) ( not ( = ?auto_577741 ?auto_577734 ) ) ( HAVE_IMAGE ?auto_577734 ?auto_577735 ) ( HAVE_IMAGE ?auto_577738 ?auto_577737 ) ( not ( = ?auto_577735 ?auto_577733 ) ) ( not ( = ?auto_577735 ?auto_577737 ) ) ( not ( = ?auto_577735 ?auto_577740 ) ) ( not ( = ?auto_577733 ?auto_577737 ) ) ( not ( = ?auto_577738 ?auto_577741 ) ) ( not ( = ?auto_577737 ?auto_577740 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_577736 ?auto_577733 ?auto_577739 ?auto_577740 )
      ( GET-4IMAGE-VERIFY ?auto_577734 ?auto_577735 ?auto_577736 ?auto_577733 ?auto_577738 ?auto_577737 ?auto_577739 ?auto_577740 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_577767 - DIRECTION
      ?auto_577768 - MODE
      ?auto_577769 - DIRECTION
      ?auto_577766 - MODE
      ?auto_577771 - DIRECTION
      ?auto_577770 - MODE
      ?auto_577772 - DIRECTION
      ?auto_577773 - MODE
    )
    :vars
    (
      ?auto_577775 - INSTRUMENT
      ?auto_577776 - SATELLITE
      ?auto_577774 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_577769 ?auto_577767 ) ) ( not ( = ?auto_577771 ?auto_577767 ) ) ( not ( = ?auto_577771 ?auto_577769 ) ) ( not ( = ?auto_577772 ?auto_577767 ) ) ( not ( = ?auto_577772 ?auto_577769 ) ) ( not ( = ?auto_577772 ?auto_577771 ) ) ( ON_BOARD ?auto_577775 ?auto_577776 ) ( SUPPORTS ?auto_577775 ?auto_577770 ) ( not ( = ?auto_577771 ?auto_577774 ) ) ( HAVE_IMAGE ?auto_577769 ?auto_577766 ) ( not ( = ?auto_577769 ?auto_577774 ) ) ( not ( = ?auto_577766 ?auto_577770 ) ) ( CALIBRATION_TARGET ?auto_577775 ?auto_577774 ) ( POWER_AVAIL ?auto_577776 ) ( POINTING ?auto_577776 ?auto_577767 ) ( not ( = ?auto_577774 ?auto_577767 ) ) ( HAVE_IMAGE ?auto_577767 ?auto_577768 ) ( HAVE_IMAGE ?auto_577772 ?auto_577773 ) ( not ( = ?auto_577768 ?auto_577766 ) ) ( not ( = ?auto_577768 ?auto_577770 ) ) ( not ( = ?auto_577768 ?auto_577773 ) ) ( not ( = ?auto_577766 ?auto_577773 ) ) ( not ( = ?auto_577770 ?auto_577773 ) ) ( not ( = ?auto_577772 ?auto_577774 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_577769 ?auto_577766 ?auto_577771 ?auto_577770 )
      ( GET-4IMAGE-VERIFY ?auto_577767 ?auto_577768 ?auto_577769 ?auto_577766 ?auto_577771 ?auto_577770 ?auto_577772 ?auto_577773 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_577979 - DIRECTION
      ?auto_577980 - MODE
      ?auto_577981 - DIRECTION
      ?auto_577978 - MODE
      ?auto_577983 - DIRECTION
      ?auto_577982 - MODE
      ?auto_577984 - DIRECTION
      ?auto_577985 - MODE
    )
    :vars
    (
      ?auto_577987 - INSTRUMENT
      ?auto_577988 - SATELLITE
      ?auto_577986 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_577981 ?auto_577979 ) ) ( not ( = ?auto_577983 ?auto_577979 ) ) ( not ( = ?auto_577983 ?auto_577981 ) ) ( not ( = ?auto_577984 ?auto_577979 ) ) ( not ( = ?auto_577984 ?auto_577981 ) ) ( not ( = ?auto_577984 ?auto_577983 ) ) ( ON_BOARD ?auto_577987 ?auto_577988 ) ( SUPPORTS ?auto_577987 ?auto_577978 ) ( not ( = ?auto_577981 ?auto_577986 ) ) ( HAVE_IMAGE ?auto_577983 ?auto_577982 ) ( not ( = ?auto_577983 ?auto_577986 ) ) ( not ( = ?auto_577982 ?auto_577978 ) ) ( CALIBRATION_TARGET ?auto_577987 ?auto_577986 ) ( POWER_AVAIL ?auto_577988 ) ( POINTING ?auto_577988 ?auto_577979 ) ( not ( = ?auto_577986 ?auto_577979 ) ) ( HAVE_IMAGE ?auto_577979 ?auto_577980 ) ( HAVE_IMAGE ?auto_577984 ?auto_577985 ) ( not ( = ?auto_577980 ?auto_577978 ) ) ( not ( = ?auto_577980 ?auto_577982 ) ) ( not ( = ?auto_577980 ?auto_577985 ) ) ( not ( = ?auto_577978 ?auto_577985 ) ) ( not ( = ?auto_577982 ?auto_577985 ) ) ( not ( = ?auto_577984 ?auto_577986 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_577983 ?auto_577982 ?auto_577981 ?auto_577978 )
      ( GET-4IMAGE-VERIFY ?auto_577979 ?auto_577980 ?auto_577981 ?auto_577978 ?auto_577983 ?auto_577982 ?auto_577984 ?auto_577985 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_578230 - DIRECTION
      ?auto_578231 - MODE
      ?auto_578232 - DIRECTION
      ?auto_578229 - MODE
      ?auto_578234 - DIRECTION
      ?auto_578233 - MODE
      ?auto_578235 - DIRECTION
      ?auto_578236 - MODE
    )
    :vars
    (
      ?auto_578238 - INSTRUMENT
      ?auto_578239 - SATELLITE
      ?auto_578237 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_578232 ?auto_578230 ) ) ( not ( = ?auto_578234 ?auto_578230 ) ) ( not ( = ?auto_578234 ?auto_578232 ) ) ( not ( = ?auto_578235 ?auto_578230 ) ) ( not ( = ?auto_578235 ?auto_578232 ) ) ( not ( = ?auto_578235 ?auto_578234 ) ) ( ON_BOARD ?auto_578238 ?auto_578239 ) ( SUPPORTS ?auto_578238 ?auto_578231 ) ( not ( = ?auto_578230 ?auto_578237 ) ) ( HAVE_IMAGE ?auto_578232 ?auto_578229 ) ( not ( = ?auto_578232 ?auto_578237 ) ) ( not ( = ?auto_578229 ?auto_578231 ) ) ( CALIBRATION_TARGET ?auto_578238 ?auto_578237 ) ( POWER_AVAIL ?auto_578239 ) ( POINTING ?auto_578239 ?auto_578235 ) ( not ( = ?auto_578237 ?auto_578235 ) ) ( HAVE_IMAGE ?auto_578234 ?auto_578233 ) ( HAVE_IMAGE ?auto_578235 ?auto_578236 ) ( not ( = ?auto_578231 ?auto_578233 ) ) ( not ( = ?auto_578231 ?auto_578236 ) ) ( not ( = ?auto_578229 ?auto_578233 ) ) ( not ( = ?auto_578229 ?auto_578236 ) ) ( not ( = ?auto_578234 ?auto_578237 ) ) ( not ( = ?auto_578233 ?auto_578236 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_578232 ?auto_578229 ?auto_578230 ?auto_578231 )
      ( GET-4IMAGE-VERIFY ?auto_578230 ?auto_578231 ?auto_578232 ?auto_578229 ?auto_578234 ?auto_578233 ?auto_578235 ?auto_578236 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_578264 - DIRECTION
      ?auto_578265 - MODE
      ?auto_578266 - DIRECTION
      ?auto_578263 - MODE
      ?auto_578268 - DIRECTION
      ?auto_578267 - MODE
      ?auto_578269 - DIRECTION
      ?auto_578270 - MODE
    )
    :vars
    (
      ?auto_578272 - INSTRUMENT
      ?auto_578273 - SATELLITE
      ?auto_578271 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_578266 ?auto_578264 ) ) ( not ( = ?auto_578268 ?auto_578264 ) ) ( not ( = ?auto_578268 ?auto_578266 ) ) ( not ( = ?auto_578269 ?auto_578264 ) ) ( not ( = ?auto_578269 ?auto_578266 ) ) ( not ( = ?auto_578269 ?auto_578268 ) ) ( ON_BOARD ?auto_578272 ?auto_578273 ) ( SUPPORTS ?auto_578272 ?auto_578265 ) ( not ( = ?auto_578264 ?auto_578271 ) ) ( HAVE_IMAGE ?auto_578266 ?auto_578263 ) ( not ( = ?auto_578266 ?auto_578271 ) ) ( not ( = ?auto_578263 ?auto_578265 ) ) ( CALIBRATION_TARGET ?auto_578272 ?auto_578271 ) ( POWER_AVAIL ?auto_578273 ) ( POINTING ?auto_578273 ?auto_578268 ) ( not ( = ?auto_578271 ?auto_578268 ) ) ( HAVE_IMAGE ?auto_578268 ?auto_578267 ) ( HAVE_IMAGE ?auto_578269 ?auto_578270 ) ( not ( = ?auto_578265 ?auto_578267 ) ) ( not ( = ?auto_578265 ?auto_578270 ) ) ( not ( = ?auto_578263 ?auto_578267 ) ) ( not ( = ?auto_578263 ?auto_578270 ) ) ( not ( = ?auto_578267 ?auto_578270 ) ) ( not ( = ?auto_578269 ?auto_578271 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_578266 ?auto_578263 ?auto_578264 ?auto_578265 )
      ( GET-4IMAGE-VERIFY ?auto_578264 ?auto_578265 ?auto_578266 ?auto_578263 ?auto_578268 ?auto_578267 ?auto_578269 ?auto_578270 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_578552 - DIRECTION
      ?auto_578553 - MODE
      ?auto_578554 - DIRECTION
      ?auto_578551 - MODE
      ?auto_578556 - DIRECTION
      ?auto_578555 - MODE
      ?auto_578557 - DIRECTION
      ?auto_578558 - MODE
    )
    :vars
    (
      ?auto_578560 - INSTRUMENT
      ?auto_578561 - SATELLITE
      ?auto_578559 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_578554 ?auto_578552 ) ) ( not ( = ?auto_578556 ?auto_578552 ) ) ( not ( = ?auto_578556 ?auto_578554 ) ) ( not ( = ?auto_578557 ?auto_578552 ) ) ( not ( = ?auto_578557 ?auto_578554 ) ) ( not ( = ?auto_578557 ?auto_578556 ) ) ( ON_BOARD ?auto_578560 ?auto_578561 ) ( SUPPORTS ?auto_578560 ?auto_578553 ) ( not ( = ?auto_578552 ?auto_578559 ) ) ( HAVE_IMAGE ?auto_578556 ?auto_578555 ) ( not ( = ?auto_578556 ?auto_578559 ) ) ( not ( = ?auto_578555 ?auto_578553 ) ) ( CALIBRATION_TARGET ?auto_578560 ?auto_578559 ) ( POWER_AVAIL ?auto_578561 ) ( POINTING ?auto_578561 ?auto_578554 ) ( not ( = ?auto_578559 ?auto_578554 ) ) ( HAVE_IMAGE ?auto_578554 ?auto_578551 ) ( HAVE_IMAGE ?auto_578557 ?auto_578558 ) ( not ( = ?auto_578553 ?auto_578551 ) ) ( not ( = ?auto_578553 ?auto_578558 ) ) ( not ( = ?auto_578551 ?auto_578555 ) ) ( not ( = ?auto_578551 ?auto_578558 ) ) ( not ( = ?auto_578555 ?auto_578558 ) ) ( not ( = ?auto_578557 ?auto_578559 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_578556 ?auto_578555 ?auto_578552 ?auto_578553 )
      ( GET-4IMAGE-VERIFY ?auto_578552 ?auto_578553 ?auto_578554 ?auto_578551 ?auto_578556 ?auto_578555 ?auto_578557 ?auto_578558 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_589798 - DIRECTION
      ?auto_589799 - MODE
      ?auto_589800 - DIRECTION
      ?auto_589797 - MODE
      ?auto_589802 - DIRECTION
      ?auto_589801 - MODE
    )
    :vars
    (
      ?auto_589806 - INSTRUMENT
      ?auto_589807 - SATELLITE
      ?auto_589804 - DIRECTION
      ?auto_589803 - DIRECTION
      ?auto_589805 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_589800 ?auto_589798 ) ) ( not ( = ?auto_589802 ?auto_589798 ) ) ( not ( = ?auto_589802 ?auto_589800 ) ) ( ON_BOARD ?auto_589806 ?auto_589807 ) ( SUPPORTS ?auto_589806 ?auto_589801 ) ( not ( = ?auto_589802 ?auto_589804 ) ) ( HAVE_IMAGE ?auto_589798 ?auto_589799 ) ( not ( = ?auto_589798 ?auto_589804 ) ) ( not ( = ?auto_589799 ?auto_589801 ) ) ( CALIBRATION_TARGET ?auto_589806 ?auto_589804 ) ( POINTING ?auto_589807 ?auto_589803 ) ( not ( = ?auto_589804 ?auto_589803 ) ) ( not ( = ?auto_589802 ?auto_589803 ) ) ( not ( = ?auto_589798 ?auto_589803 ) ) ( ON_BOARD ?auto_589805 ?auto_589807 ) ( POWER_ON ?auto_589805 ) ( not ( = ?auto_589806 ?auto_589805 ) ) ( HAVE_IMAGE ?auto_589800 ?auto_589797 ) ( not ( = ?auto_589799 ?auto_589797 ) ) ( not ( = ?auto_589800 ?auto_589804 ) ) ( not ( = ?auto_589800 ?auto_589803 ) ) ( not ( = ?auto_589797 ?auto_589801 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_589798 ?auto_589799 ?auto_589802 ?auto_589801 )
      ( GET-3IMAGE-VERIFY ?auto_589798 ?auto_589799 ?auto_589800 ?auto_589797 ?auto_589802 ?auto_589801 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_589830 - DIRECTION
      ?auto_589831 - MODE
      ?auto_589832 - DIRECTION
      ?auto_589829 - MODE
      ?auto_589834 - DIRECTION
      ?auto_589833 - MODE
    )
    :vars
    (
      ?auto_589838 - INSTRUMENT
      ?auto_589839 - SATELLITE
      ?auto_589836 - DIRECTION
      ?auto_589835 - DIRECTION
      ?auto_589837 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_589832 ?auto_589830 ) ) ( not ( = ?auto_589834 ?auto_589830 ) ) ( not ( = ?auto_589834 ?auto_589832 ) ) ( ON_BOARD ?auto_589838 ?auto_589839 ) ( SUPPORTS ?auto_589838 ?auto_589829 ) ( not ( = ?auto_589832 ?auto_589836 ) ) ( HAVE_IMAGE ?auto_589830 ?auto_589831 ) ( not ( = ?auto_589830 ?auto_589836 ) ) ( not ( = ?auto_589831 ?auto_589829 ) ) ( CALIBRATION_TARGET ?auto_589838 ?auto_589836 ) ( POINTING ?auto_589839 ?auto_589835 ) ( not ( = ?auto_589836 ?auto_589835 ) ) ( not ( = ?auto_589832 ?auto_589835 ) ) ( not ( = ?auto_589830 ?auto_589835 ) ) ( ON_BOARD ?auto_589837 ?auto_589839 ) ( POWER_ON ?auto_589837 ) ( not ( = ?auto_589838 ?auto_589837 ) ) ( HAVE_IMAGE ?auto_589834 ?auto_589833 ) ( not ( = ?auto_589831 ?auto_589833 ) ) ( not ( = ?auto_589829 ?auto_589833 ) ) ( not ( = ?auto_589834 ?auto_589836 ) ) ( not ( = ?auto_589834 ?auto_589835 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_589830 ?auto_589831 ?auto_589832 ?auto_589829 )
      ( GET-3IMAGE-VERIFY ?auto_589830 ?auto_589831 ?auto_589832 ?auto_589829 ?auto_589834 ?auto_589833 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_590004 - DIRECTION
      ?auto_590005 - MODE
      ?auto_590006 - DIRECTION
      ?auto_590003 - MODE
      ?auto_590008 - DIRECTION
      ?auto_590007 - MODE
    )
    :vars
    (
      ?auto_590012 - INSTRUMENT
      ?auto_590013 - SATELLITE
      ?auto_590010 - DIRECTION
      ?auto_590009 - DIRECTION
      ?auto_590011 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_590006 ?auto_590004 ) ) ( not ( = ?auto_590008 ?auto_590004 ) ) ( not ( = ?auto_590008 ?auto_590006 ) ) ( ON_BOARD ?auto_590012 ?auto_590013 ) ( SUPPORTS ?auto_590012 ?auto_590005 ) ( not ( = ?auto_590004 ?auto_590010 ) ) ( HAVE_IMAGE ?auto_590006 ?auto_590003 ) ( not ( = ?auto_590006 ?auto_590010 ) ) ( not ( = ?auto_590003 ?auto_590005 ) ) ( CALIBRATION_TARGET ?auto_590012 ?auto_590010 ) ( POINTING ?auto_590013 ?auto_590009 ) ( not ( = ?auto_590010 ?auto_590009 ) ) ( not ( = ?auto_590004 ?auto_590009 ) ) ( not ( = ?auto_590006 ?auto_590009 ) ) ( ON_BOARD ?auto_590011 ?auto_590013 ) ( POWER_ON ?auto_590011 ) ( not ( = ?auto_590012 ?auto_590011 ) ) ( HAVE_IMAGE ?auto_590008 ?auto_590007 ) ( not ( = ?auto_590005 ?auto_590007 ) ) ( not ( = ?auto_590003 ?auto_590007 ) ) ( not ( = ?auto_590008 ?auto_590010 ) ) ( not ( = ?auto_590008 ?auto_590009 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_590006 ?auto_590003 ?auto_590004 ?auto_590005 )
      ( GET-3IMAGE-VERIFY ?auto_590004 ?auto_590005 ?auto_590006 ?auto_590003 ?auto_590008 ?auto_590007 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_590278 - DIRECTION
      ?auto_590279 - MODE
      ?auto_590280 - DIRECTION
      ?auto_590277 - MODE
      ?auto_590282 - DIRECTION
      ?auto_590281 - MODE
      ?auto_590283 - DIRECTION
      ?auto_590284 - MODE
    )
    :vars
    (
      ?auto_590287 - INSTRUMENT
      ?auto_590288 - SATELLITE
      ?auto_590285 - DIRECTION
      ?auto_590286 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_590280 ?auto_590278 ) ) ( not ( = ?auto_590282 ?auto_590278 ) ) ( not ( = ?auto_590282 ?auto_590280 ) ) ( not ( = ?auto_590283 ?auto_590278 ) ) ( not ( = ?auto_590283 ?auto_590280 ) ) ( not ( = ?auto_590283 ?auto_590282 ) ) ( ON_BOARD ?auto_590287 ?auto_590288 ) ( SUPPORTS ?auto_590287 ?auto_590284 ) ( not ( = ?auto_590283 ?auto_590285 ) ) ( HAVE_IMAGE ?auto_590278 ?auto_590279 ) ( not ( = ?auto_590278 ?auto_590285 ) ) ( not ( = ?auto_590279 ?auto_590284 ) ) ( CALIBRATION_TARGET ?auto_590287 ?auto_590285 ) ( POINTING ?auto_590288 ?auto_590282 ) ( not ( = ?auto_590285 ?auto_590282 ) ) ( ON_BOARD ?auto_590286 ?auto_590288 ) ( POWER_ON ?auto_590286 ) ( not ( = ?auto_590287 ?auto_590286 ) ) ( HAVE_IMAGE ?auto_590280 ?auto_590277 ) ( HAVE_IMAGE ?auto_590282 ?auto_590281 ) ( not ( = ?auto_590279 ?auto_590277 ) ) ( not ( = ?auto_590279 ?auto_590281 ) ) ( not ( = ?auto_590280 ?auto_590285 ) ) ( not ( = ?auto_590277 ?auto_590281 ) ) ( not ( = ?auto_590277 ?auto_590284 ) ) ( not ( = ?auto_590281 ?auto_590284 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_590278 ?auto_590279 ?auto_590283 ?auto_590284 )
      ( GET-4IMAGE-VERIFY ?auto_590278 ?auto_590279 ?auto_590280 ?auto_590277 ?auto_590282 ?auto_590281 ?auto_590283 ?auto_590284 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_590316 - DIRECTION
      ?auto_590317 - MODE
      ?auto_590318 - DIRECTION
      ?auto_590315 - MODE
      ?auto_590320 - DIRECTION
      ?auto_590319 - MODE
      ?auto_590321 - DIRECTION
      ?auto_590322 - MODE
    )
    :vars
    (
      ?auto_590325 - INSTRUMENT
      ?auto_590326 - SATELLITE
      ?auto_590323 - DIRECTION
      ?auto_590324 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_590318 ?auto_590316 ) ) ( not ( = ?auto_590320 ?auto_590316 ) ) ( not ( = ?auto_590320 ?auto_590318 ) ) ( not ( = ?auto_590321 ?auto_590316 ) ) ( not ( = ?auto_590321 ?auto_590318 ) ) ( not ( = ?auto_590321 ?auto_590320 ) ) ( ON_BOARD ?auto_590325 ?auto_590326 ) ( SUPPORTS ?auto_590325 ?auto_590319 ) ( not ( = ?auto_590320 ?auto_590323 ) ) ( HAVE_IMAGE ?auto_590316 ?auto_590317 ) ( not ( = ?auto_590316 ?auto_590323 ) ) ( not ( = ?auto_590317 ?auto_590319 ) ) ( CALIBRATION_TARGET ?auto_590325 ?auto_590323 ) ( POINTING ?auto_590326 ?auto_590321 ) ( not ( = ?auto_590323 ?auto_590321 ) ) ( ON_BOARD ?auto_590324 ?auto_590326 ) ( POWER_ON ?auto_590324 ) ( not ( = ?auto_590325 ?auto_590324 ) ) ( HAVE_IMAGE ?auto_590318 ?auto_590315 ) ( HAVE_IMAGE ?auto_590321 ?auto_590322 ) ( not ( = ?auto_590317 ?auto_590315 ) ) ( not ( = ?auto_590317 ?auto_590322 ) ) ( not ( = ?auto_590318 ?auto_590323 ) ) ( not ( = ?auto_590315 ?auto_590319 ) ) ( not ( = ?auto_590315 ?auto_590322 ) ) ( not ( = ?auto_590319 ?auto_590322 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_590316 ?auto_590317 ?auto_590320 ?auto_590319 )
      ( GET-4IMAGE-VERIFY ?auto_590316 ?auto_590317 ?auto_590318 ?auto_590315 ?auto_590320 ?auto_590319 ?auto_590321 ?auto_590322 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_590353 - DIRECTION
      ?auto_590354 - MODE
      ?auto_590355 - DIRECTION
      ?auto_590352 - MODE
      ?auto_590357 - DIRECTION
      ?auto_590356 - MODE
      ?auto_590358 - DIRECTION
      ?auto_590359 - MODE
    )
    :vars
    (
      ?auto_590362 - INSTRUMENT
      ?auto_590363 - SATELLITE
      ?auto_590360 - DIRECTION
      ?auto_590361 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_590355 ?auto_590353 ) ) ( not ( = ?auto_590357 ?auto_590353 ) ) ( not ( = ?auto_590357 ?auto_590355 ) ) ( not ( = ?auto_590358 ?auto_590353 ) ) ( not ( = ?auto_590358 ?auto_590355 ) ) ( not ( = ?auto_590358 ?auto_590357 ) ) ( ON_BOARD ?auto_590362 ?auto_590363 ) ( SUPPORTS ?auto_590362 ?auto_590359 ) ( not ( = ?auto_590358 ?auto_590360 ) ) ( HAVE_IMAGE ?auto_590353 ?auto_590354 ) ( not ( = ?auto_590353 ?auto_590360 ) ) ( not ( = ?auto_590354 ?auto_590359 ) ) ( CALIBRATION_TARGET ?auto_590362 ?auto_590360 ) ( POINTING ?auto_590363 ?auto_590355 ) ( not ( = ?auto_590360 ?auto_590355 ) ) ( ON_BOARD ?auto_590361 ?auto_590363 ) ( POWER_ON ?auto_590361 ) ( not ( = ?auto_590362 ?auto_590361 ) ) ( HAVE_IMAGE ?auto_590355 ?auto_590352 ) ( HAVE_IMAGE ?auto_590357 ?auto_590356 ) ( not ( = ?auto_590354 ?auto_590352 ) ) ( not ( = ?auto_590354 ?auto_590356 ) ) ( not ( = ?auto_590352 ?auto_590356 ) ) ( not ( = ?auto_590352 ?auto_590359 ) ) ( not ( = ?auto_590357 ?auto_590360 ) ) ( not ( = ?auto_590356 ?auto_590359 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_590353 ?auto_590354 ?auto_590358 ?auto_590359 )
      ( GET-4IMAGE-VERIFY ?auto_590353 ?auto_590354 ?auto_590355 ?auto_590352 ?auto_590357 ?auto_590356 ?auto_590358 ?auto_590359 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_590389 - DIRECTION
      ?auto_590390 - MODE
      ?auto_590391 - DIRECTION
      ?auto_590388 - MODE
      ?auto_590393 - DIRECTION
      ?auto_590392 - MODE
      ?auto_590394 - DIRECTION
      ?auto_590395 - MODE
    )
    :vars
    (
      ?auto_590398 - INSTRUMENT
      ?auto_590399 - SATELLITE
      ?auto_590396 - DIRECTION
      ?auto_590397 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_590391 ?auto_590389 ) ) ( not ( = ?auto_590393 ?auto_590389 ) ) ( not ( = ?auto_590393 ?auto_590391 ) ) ( not ( = ?auto_590394 ?auto_590389 ) ) ( not ( = ?auto_590394 ?auto_590391 ) ) ( not ( = ?auto_590394 ?auto_590393 ) ) ( ON_BOARD ?auto_590398 ?auto_590399 ) ( SUPPORTS ?auto_590398 ?auto_590392 ) ( not ( = ?auto_590393 ?auto_590396 ) ) ( HAVE_IMAGE ?auto_590389 ?auto_590390 ) ( not ( = ?auto_590389 ?auto_590396 ) ) ( not ( = ?auto_590390 ?auto_590392 ) ) ( CALIBRATION_TARGET ?auto_590398 ?auto_590396 ) ( POINTING ?auto_590399 ?auto_590391 ) ( not ( = ?auto_590396 ?auto_590391 ) ) ( ON_BOARD ?auto_590397 ?auto_590399 ) ( POWER_ON ?auto_590397 ) ( not ( = ?auto_590398 ?auto_590397 ) ) ( HAVE_IMAGE ?auto_590391 ?auto_590388 ) ( HAVE_IMAGE ?auto_590394 ?auto_590395 ) ( not ( = ?auto_590390 ?auto_590388 ) ) ( not ( = ?auto_590390 ?auto_590395 ) ) ( not ( = ?auto_590388 ?auto_590392 ) ) ( not ( = ?auto_590388 ?auto_590395 ) ) ( not ( = ?auto_590392 ?auto_590395 ) ) ( not ( = ?auto_590394 ?auto_590396 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_590389 ?auto_590390 ?auto_590393 ?auto_590392 )
      ( GET-4IMAGE-VERIFY ?auto_590389 ?auto_590390 ?auto_590391 ?auto_590388 ?auto_590393 ?auto_590392 ?auto_590394 ?auto_590395 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_590502 - DIRECTION
      ?auto_590503 - MODE
      ?auto_590504 - DIRECTION
      ?auto_590501 - MODE
      ?auto_590506 - DIRECTION
      ?auto_590505 - MODE
      ?auto_590507 - DIRECTION
      ?auto_590508 - MODE
    )
    :vars
    (
      ?auto_590511 - INSTRUMENT
      ?auto_590512 - SATELLITE
      ?auto_590509 - DIRECTION
      ?auto_590510 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_590504 ?auto_590502 ) ) ( not ( = ?auto_590506 ?auto_590502 ) ) ( not ( = ?auto_590506 ?auto_590504 ) ) ( not ( = ?auto_590507 ?auto_590502 ) ) ( not ( = ?auto_590507 ?auto_590504 ) ) ( not ( = ?auto_590507 ?auto_590506 ) ) ( ON_BOARD ?auto_590511 ?auto_590512 ) ( SUPPORTS ?auto_590511 ?auto_590501 ) ( not ( = ?auto_590504 ?auto_590509 ) ) ( HAVE_IMAGE ?auto_590502 ?auto_590503 ) ( not ( = ?auto_590502 ?auto_590509 ) ) ( not ( = ?auto_590503 ?auto_590501 ) ) ( CALIBRATION_TARGET ?auto_590511 ?auto_590509 ) ( POINTING ?auto_590512 ?auto_590507 ) ( not ( = ?auto_590509 ?auto_590507 ) ) ( ON_BOARD ?auto_590510 ?auto_590512 ) ( POWER_ON ?auto_590510 ) ( not ( = ?auto_590511 ?auto_590510 ) ) ( HAVE_IMAGE ?auto_590506 ?auto_590505 ) ( HAVE_IMAGE ?auto_590507 ?auto_590508 ) ( not ( = ?auto_590503 ?auto_590505 ) ) ( not ( = ?auto_590503 ?auto_590508 ) ) ( not ( = ?auto_590501 ?auto_590505 ) ) ( not ( = ?auto_590501 ?auto_590508 ) ) ( not ( = ?auto_590506 ?auto_590509 ) ) ( not ( = ?auto_590505 ?auto_590508 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_590502 ?auto_590503 ?auto_590504 ?auto_590501 )
      ( GET-4IMAGE-VERIFY ?auto_590502 ?auto_590503 ?auto_590504 ?auto_590501 ?auto_590506 ?auto_590505 ?auto_590507 ?auto_590508 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_590539 - DIRECTION
      ?auto_590540 - MODE
      ?auto_590541 - DIRECTION
      ?auto_590538 - MODE
      ?auto_590543 - DIRECTION
      ?auto_590542 - MODE
      ?auto_590544 - DIRECTION
      ?auto_590545 - MODE
    )
    :vars
    (
      ?auto_590548 - INSTRUMENT
      ?auto_590549 - SATELLITE
      ?auto_590546 - DIRECTION
      ?auto_590547 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_590541 ?auto_590539 ) ) ( not ( = ?auto_590543 ?auto_590539 ) ) ( not ( = ?auto_590543 ?auto_590541 ) ) ( not ( = ?auto_590544 ?auto_590539 ) ) ( not ( = ?auto_590544 ?auto_590541 ) ) ( not ( = ?auto_590544 ?auto_590543 ) ) ( ON_BOARD ?auto_590548 ?auto_590549 ) ( SUPPORTS ?auto_590548 ?auto_590538 ) ( not ( = ?auto_590541 ?auto_590546 ) ) ( HAVE_IMAGE ?auto_590539 ?auto_590540 ) ( not ( = ?auto_590539 ?auto_590546 ) ) ( not ( = ?auto_590540 ?auto_590538 ) ) ( CALIBRATION_TARGET ?auto_590548 ?auto_590546 ) ( POINTING ?auto_590549 ?auto_590543 ) ( not ( = ?auto_590546 ?auto_590543 ) ) ( ON_BOARD ?auto_590547 ?auto_590549 ) ( POWER_ON ?auto_590547 ) ( not ( = ?auto_590548 ?auto_590547 ) ) ( HAVE_IMAGE ?auto_590543 ?auto_590542 ) ( HAVE_IMAGE ?auto_590544 ?auto_590545 ) ( not ( = ?auto_590540 ?auto_590542 ) ) ( not ( = ?auto_590540 ?auto_590545 ) ) ( not ( = ?auto_590538 ?auto_590542 ) ) ( not ( = ?auto_590538 ?auto_590545 ) ) ( not ( = ?auto_590542 ?auto_590545 ) ) ( not ( = ?auto_590544 ?auto_590546 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_590539 ?auto_590540 ?auto_590541 ?auto_590538 )
      ( GET-4IMAGE-VERIFY ?auto_590539 ?auto_590540 ?auto_590541 ?auto_590538 ?auto_590543 ?auto_590542 ?auto_590544 ?auto_590545 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_591115 - DIRECTION
      ?auto_591116 - MODE
      ?auto_591117 - DIRECTION
      ?auto_591114 - MODE
      ?auto_591119 - DIRECTION
      ?auto_591118 - MODE
      ?auto_591120 - DIRECTION
      ?auto_591121 - MODE
    )
    :vars
    (
      ?auto_591124 - INSTRUMENT
      ?auto_591125 - SATELLITE
      ?auto_591122 - DIRECTION
      ?auto_591123 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_591117 ?auto_591115 ) ) ( not ( = ?auto_591119 ?auto_591115 ) ) ( not ( = ?auto_591119 ?auto_591117 ) ) ( not ( = ?auto_591120 ?auto_591115 ) ) ( not ( = ?auto_591120 ?auto_591117 ) ) ( not ( = ?auto_591120 ?auto_591119 ) ) ( ON_BOARD ?auto_591124 ?auto_591125 ) ( SUPPORTS ?auto_591124 ?auto_591121 ) ( not ( = ?auto_591120 ?auto_591122 ) ) ( HAVE_IMAGE ?auto_591117 ?auto_591114 ) ( not ( = ?auto_591117 ?auto_591122 ) ) ( not ( = ?auto_591114 ?auto_591121 ) ) ( CALIBRATION_TARGET ?auto_591124 ?auto_591122 ) ( POINTING ?auto_591125 ?auto_591115 ) ( not ( = ?auto_591122 ?auto_591115 ) ) ( ON_BOARD ?auto_591123 ?auto_591125 ) ( POWER_ON ?auto_591123 ) ( not ( = ?auto_591124 ?auto_591123 ) ) ( HAVE_IMAGE ?auto_591115 ?auto_591116 ) ( HAVE_IMAGE ?auto_591119 ?auto_591118 ) ( not ( = ?auto_591116 ?auto_591114 ) ) ( not ( = ?auto_591116 ?auto_591118 ) ) ( not ( = ?auto_591116 ?auto_591121 ) ) ( not ( = ?auto_591114 ?auto_591118 ) ) ( not ( = ?auto_591119 ?auto_591122 ) ) ( not ( = ?auto_591118 ?auto_591121 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_591117 ?auto_591114 ?auto_591120 ?auto_591121 )
      ( GET-4IMAGE-VERIFY ?auto_591115 ?auto_591116 ?auto_591117 ?auto_591114 ?auto_591119 ?auto_591118 ?auto_591120 ?auto_591121 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_591151 - DIRECTION
      ?auto_591152 - MODE
      ?auto_591153 - DIRECTION
      ?auto_591150 - MODE
      ?auto_591155 - DIRECTION
      ?auto_591154 - MODE
      ?auto_591156 - DIRECTION
      ?auto_591157 - MODE
    )
    :vars
    (
      ?auto_591160 - INSTRUMENT
      ?auto_591161 - SATELLITE
      ?auto_591158 - DIRECTION
      ?auto_591159 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_591153 ?auto_591151 ) ) ( not ( = ?auto_591155 ?auto_591151 ) ) ( not ( = ?auto_591155 ?auto_591153 ) ) ( not ( = ?auto_591156 ?auto_591151 ) ) ( not ( = ?auto_591156 ?auto_591153 ) ) ( not ( = ?auto_591156 ?auto_591155 ) ) ( ON_BOARD ?auto_591160 ?auto_591161 ) ( SUPPORTS ?auto_591160 ?auto_591154 ) ( not ( = ?auto_591155 ?auto_591158 ) ) ( HAVE_IMAGE ?auto_591153 ?auto_591150 ) ( not ( = ?auto_591153 ?auto_591158 ) ) ( not ( = ?auto_591150 ?auto_591154 ) ) ( CALIBRATION_TARGET ?auto_591160 ?auto_591158 ) ( POINTING ?auto_591161 ?auto_591151 ) ( not ( = ?auto_591158 ?auto_591151 ) ) ( ON_BOARD ?auto_591159 ?auto_591161 ) ( POWER_ON ?auto_591159 ) ( not ( = ?auto_591160 ?auto_591159 ) ) ( HAVE_IMAGE ?auto_591151 ?auto_591152 ) ( HAVE_IMAGE ?auto_591156 ?auto_591157 ) ( not ( = ?auto_591152 ?auto_591150 ) ) ( not ( = ?auto_591152 ?auto_591154 ) ) ( not ( = ?auto_591152 ?auto_591157 ) ) ( not ( = ?auto_591150 ?auto_591157 ) ) ( not ( = ?auto_591154 ?auto_591157 ) ) ( not ( = ?auto_591156 ?auto_591158 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_591153 ?auto_591150 ?auto_591155 ?auto_591154 )
      ( GET-4IMAGE-VERIFY ?auto_591151 ?auto_591152 ?auto_591153 ?auto_591150 ?auto_591155 ?auto_591154 ?auto_591156 ?auto_591157 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_591379 - DIRECTION
      ?auto_591380 - MODE
      ?auto_591381 - DIRECTION
      ?auto_591378 - MODE
      ?auto_591383 - DIRECTION
      ?auto_591382 - MODE
      ?auto_591384 - DIRECTION
      ?auto_591385 - MODE
    )
    :vars
    (
      ?auto_591388 - INSTRUMENT
      ?auto_591389 - SATELLITE
      ?auto_591386 - DIRECTION
      ?auto_591387 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_591381 ?auto_591379 ) ) ( not ( = ?auto_591383 ?auto_591379 ) ) ( not ( = ?auto_591383 ?auto_591381 ) ) ( not ( = ?auto_591384 ?auto_591379 ) ) ( not ( = ?auto_591384 ?auto_591381 ) ) ( not ( = ?auto_591384 ?auto_591383 ) ) ( ON_BOARD ?auto_591388 ?auto_591389 ) ( SUPPORTS ?auto_591388 ?auto_591378 ) ( not ( = ?auto_591381 ?auto_591386 ) ) ( HAVE_IMAGE ?auto_591383 ?auto_591382 ) ( not ( = ?auto_591383 ?auto_591386 ) ) ( not ( = ?auto_591382 ?auto_591378 ) ) ( CALIBRATION_TARGET ?auto_591388 ?auto_591386 ) ( POINTING ?auto_591389 ?auto_591379 ) ( not ( = ?auto_591386 ?auto_591379 ) ) ( ON_BOARD ?auto_591387 ?auto_591389 ) ( POWER_ON ?auto_591387 ) ( not ( = ?auto_591388 ?auto_591387 ) ) ( HAVE_IMAGE ?auto_591379 ?auto_591380 ) ( HAVE_IMAGE ?auto_591384 ?auto_591385 ) ( not ( = ?auto_591380 ?auto_591378 ) ) ( not ( = ?auto_591380 ?auto_591382 ) ) ( not ( = ?auto_591380 ?auto_591385 ) ) ( not ( = ?auto_591378 ?auto_591385 ) ) ( not ( = ?auto_591382 ?auto_591385 ) ) ( not ( = ?auto_591384 ?auto_591386 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_591383 ?auto_591382 ?auto_591381 ?auto_591378 )
      ( GET-4IMAGE-VERIFY ?auto_591379 ?auto_591380 ?auto_591381 ?auto_591378 ?auto_591383 ?auto_591382 ?auto_591384 ?auto_591385 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_591650 - DIRECTION
      ?auto_591651 - MODE
      ?auto_591652 - DIRECTION
      ?auto_591649 - MODE
      ?auto_591654 - DIRECTION
      ?auto_591653 - MODE
      ?auto_591655 - DIRECTION
      ?auto_591656 - MODE
    )
    :vars
    (
      ?auto_591659 - INSTRUMENT
      ?auto_591660 - SATELLITE
      ?auto_591657 - DIRECTION
      ?auto_591658 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_591652 ?auto_591650 ) ) ( not ( = ?auto_591654 ?auto_591650 ) ) ( not ( = ?auto_591654 ?auto_591652 ) ) ( not ( = ?auto_591655 ?auto_591650 ) ) ( not ( = ?auto_591655 ?auto_591652 ) ) ( not ( = ?auto_591655 ?auto_591654 ) ) ( ON_BOARD ?auto_591659 ?auto_591660 ) ( SUPPORTS ?auto_591659 ?auto_591651 ) ( not ( = ?auto_591650 ?auto_591657 ) ) ( HAVE_IMAGE ?auto_591652 ?auto_591649 ) ( not ( = ?auto_591652 ?auto_591657 ) ) ( not ( = ?auto_591649 ?auto_591651 ) ) ( CALIBRATION_TARGET ?auto_591659 ?auto_591657 ) ( POINTING ?auto_591660 ?auto_591655 ) ( not ( = ?auto_591657 ?auto_591655 ) ) ( ON_BOARD ?auto_591658 ?auto_591660 ) ( POWER_ON ?auto_591658 ) ( not ( = ?auto_591659 ?auto_591658 ) ) ( HAVE_IMAGE ?auto_591654 ?auto_591653 ) ( HAVE_IMAGE ?auto_591655 ?auto_591656 ) ( not ( = ?auto_591651 ?auto_591653 ) ) ( not ( = ?auto_591651 ?auto_591656 ) ) ( not ( = ?auto_591649 ?auto_591653 ) ) ( not ( = ?auto_591649 ?auto_591656 ) ) ( not ( = ?auto_591654 ?auto_591657 ) ) ( not ( = ?auto_591653 ?auto_591656 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_591652 ?auto_591649 ?auto_591650 ?auto_591651 )
      ( GET-4IMAGE-VERIFY ?auto_591650 ?auto_591651 ?auto_591652 ?auto_591649 ?auto_591654 ?auto_591653 ?auto_591655 ?auto_591656 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_591687 - DIRECTION
      ?auto_591688 - MODE
      ?auto_591689 - DIRECTION
      ?auto_591686 - MODE
      ?auto_591691 - DIRECTION
      ?auto_591690 - MODE
      ?auto_591692 - DIRECTION
      ?auto_591693 - MODE
    )
    :vars
    (
      ?auto_591696 - INSTRUMENT
      ?auto_591697 - SATELLITE
      ?auto_591694 - DIRECTION
      ?auto_591695 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_591689 ?auto_591687 ) ) ( not ( = ?auto_591691 ?auto_591687 ) ) ( not ( = ?auto_591691 ?auto_591689 ) ) ( not ( = ?auto_591692 ?auto_591687 ) ) ( not ( = ?auto_591692 ?auto_591689 ) ) ( not ( = ?auto_591692 ?auto_591691 ) ) ( ON_BOARD ?auto_591696 ?auto_591697 ) ( SUPPORTS ?auto_591696 ?auto_591688 ) ( not ( = ?auto_591687 ?auto_591694 ) ) ( HAVE_IMAGE ?auto_591689 ?auto_591686 ) ( not ( = ?auto_591689 ?auto_591694 ) ) ( not ( = ?auto_591686 ?auto_591688 ) ) ( CALIBRATION_TARGET ?auto_591696 ?auto_591694 ) ( POINTING ?auto_591697 ?auto_591691 ) ( not ( = ?auto_591694 ?auto_591691 ) ) ( ON_BOARD ?auto_591695 ?auto_591697 ) ( POWER_ON ?auto_591695 ) ( not ( = ?auto_591696 ?auto_591695 ) ) ( HAVE_IMAGE ?auto_591691 ?auto_591690 ) ( HAVE_IMAGE ?auto_591692 ?auto_591693 ) ( not ( = ?auto_591688 ?auto_591690 ) ) ( not ( = ?auto_591688 ?auto_591693 ) ) ( not ( = ?auto_591686 ?auto_591690 ) ) ( not ( = ?auto_591686 ?auto_591693 ) ) ( not ( = ?auto_591690 ?auto_591693 ) ) ( not ( = ?auto_591692 ?auto_591694 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_591689 ?auto_591686 ?auto_591687 ?auto_591688 )
      ( GET-4IMAGE-VERIFY ?auto_591687 ?auto_591688 ?auto_591689 ?auto_591686 ?auto_591691 ?auto_591690 ?auto_591692 ?auto_591693 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_591997 - DIRECTION
      ?auto_591998 - MODE
      ?auto_591999 - DIRECTION
      ?auto_591996 - MODE
      ?auto_592001 - DIRECTION
      ?auto_592000 - MODE
      ?auto_592002 - DIRECTION
      ?auto_592003 - MODE
    )
    :vars
    (
      ?auto_592006 - INSTRUMENT
      ?auto_592007 - SATELLITE
      ?auto_592004 - DIRECTION
      ?auto_592005 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_591999 ?auto_591997 ) ) ( not ( = ?auto_592001 ?auto_591997 ) ) ( not ( = ?auto_592001 ?auto_591999 ) ) ( not ( = ?auto_592002 ?auto_591997 ) ) ( not ( = ?auto_592002 ?auto_591999 ) ) ( not ( = ?auto_592002 ?auto_592001 ) ) ( ON_BOARD ?auto_592006 ?auto_592007 ) ( SUPPORTS ?auto_592006 ?auto_591998 ) ( not ( = ?auto_591997 ?auto_592004 ) ) ( HAVE_IMAGE ?auto_592001 ?auto_592000 ) ( not ( = ?auto_592001 ?auto_592004 ) ) ( not ( = ?auto_592000 ?auto_591998 ) ) ( CALIBRATION_TARGET ?auto_592006 ?auto_592004 ) ( POINTING ?auto_592007 ?auto_591999 ) ( not ( = ?auto_592004 ?auto_591999 ) ) ( ON_BOARD ?auto_592005 ?auto_592007 ) ( POWER_ON ?auto_592005 ) ( not ( = ?auto_592006 ?auto_592005 ) ) ( HAVE_IMAGE ?auto_591999 ?auto_591996 ) ( HAVE_IMAGE ?auto_592002 ?auto_592003 ) ( not ( = ?auto_591998 ?auto_591996 ) ) ( not ( = ?auto_591998 ?auto_592003 ) ) ( not ( = ?auto_591996 ?auto_592000 ) ) ( not ( = ?auto_591996 ?auto_592003 ) ) ( not ( = ?auto_592000 ?auto_592003 ) ) ( not ( = ?auto_592002 ?auto_592004 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_592001 ?auto_592000 ?auto_591997 ?auto_591998 )
      ( GET-4IMAGE-VERIFY ?auto_591997 ?auto_591998 ?auto_591999 ?auto_591996 ?auto_592001 ?auto_592000 ?auto_592002 ?auto_592003 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_632702 - DIRECTION
      ?auto_632703 - MODE
      ?auto_632704 - DIRECTION
      ?auto_632701 - MODE
      ?auto_632706 - DIRECTION
      ?auto_632705 - MODE
    )
    :vars
    (
      ?auto_632707 - INSTRUMENT
      ?auto_632709 - SATELLITE
      ?auto_632708 - DIRECTION
      ?auto_632710 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_632704 ?auto_632702 ) ) ( not ( = ?auto_632706 ?auto_632702 ) ) ( not ( = ?auto_632706 ?auto_632704 ) ) ( ON_BOARD ?auto_632707 ?auto_632709 ) ( SUPPORTS ?auto_632707 ?auto_632705 ) ( not ( = ?auto_632706 ?auto_632708 ) ) ( HAVE_IMAGE ?auto_632702 ?auto_632703 ) ( not ( = ?auto_632702 ?auto_632708 ) ) ( not ( = ?auto_632703 ?auto_632705 ) ) ( CALIBRATION_TARGET ?auto_632707 ?auto_632708 ) ( not ( = ?auto_632708 ?auto_632704 ) ) ( ON_BOARD ?auto_632710 ?auto_632709 ) ( POWER_ON ?auto_632710 ) ( not ( = ?auto_632707 ?auto_632710 ) ) ( POINTING ?auto_632709 ?auto_632708 ) ( HAVE_IMAGE ?auto_632704 ?auto_632701 ) ( not ( = ?auto_632703 ?auto_632701 ) ) ( not ( = ?auto_632701 ?auto_632705 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_632702 ?auto_632703 ?auto_632706 ?auto_632705 )
      ( GET-3IMAGE-VERIFY ?auto_632702 ?auto_632703 ?auto_632704 ?auto_632701 ?auto_632706 ?auto_632705 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_632734 - DIRECTION
      ?auto_632735 - MODE
      ?auto_632736 - DIRECTION
      ?auto_632733 - MODE
      ?auto_632738 - DIRECTION
      ?auto_632737 - MODE
    )
    :vars
    (
      ?auto_632739 - INSTRUMENT
      ?auto_632741 - SATELLITE
      ?auto_632740 - DIRECTION
      ?auto_632742 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_632736 ?auto_632734 ) ) ( not ( = ?auto_632738 ?auto_632734 ) ) ( not ( = ?auto_632738 ?auto_632736 ) ) ( ON_BOARD ?auto_632739 ?auto_632741 ) ( SUPPORTS ?auto_632739 ?auto_632733 ) ( not ( = ?auto_632736 ?auto_632740 ) ) ( HAVE_IMAGE ?auto_632734 ?auto_632735 ) ( not ( = ?auto_632734 ?auto_632740 ) ) ( not ( = ?auto_632735 ?auto_632733 ) ) ( CALIBRATION_TARGET ?auto_632739 ?auto_632740 ) ( not ( = ?auto_632740 ?auto_632738 ) ) ( ON_BOARD ?auto_632742 ?auto_632741 ) ( POWER_ON ?auto_632742 ) ( not ( = ?auto_632739 ?auto_632742 ) ) ( POINTING ?auto_632741 ?auto_632740 ) ( HAVE_IMAGE ?auto_632738 ?auto_632737 ) ( not ( = ?auto_632735 ?auto_632737 ) ) ( not ( = ?auto_632733 ?auto_632737 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_632734 ?auto_632735 ?auto_632736 ?auto_632733 )
      ( GET-3IMAGE-VERIFY ?auto_632734 ?auto_632735 ?auto_632736 ?auto_632733 ?auto_632738 ?auto_632737 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_618426 - DIRECTION
      ?auto_618427 - MODE
      ?auto_618428 - DIRECTION
      ?auto_618425 - MODE
      ?auto_618430 - DIRECTION
      ?auto_618429 - MODE
    )
    :vars
    (
      ?auto_618431 - INSTRUMENT
      ?auto_618433 - SATELLITE
      ?auto_618434 - DIRECTION
      ?auto_618435 - DIRECTION
      ?auto_618432 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_618428 ?auto_618426 ) ) ( not ( = ?auto_618430 ?auto_618426 ) ) ( not ( = ?auto_618430 ?auto_618428 ) ) ( ON_BOARD ?auto_618431 ?auto_618433 ) ( SUPPORTS ?auto_618431 ?auto_618429 ) ( not ( = ?auto_618430 ?auto_618434 ) ) ( HAVE_IMAGE ?auto_618428 ?auto_618425 ) ( not ( = ?auto_618428 ?auto_618434 ) ) ( not ( = ?auto_618425 ?auto_618429 ) ) ( CALIBRATION_TARGET ?auto_618431 ?auto_618434 ) ( not ( = ?auto_618434 ?auto_618435 ) ) ( not ( = ?auto_618430 ?auto_618435 ) ) ( not ( = ?auto_618428 ?auto_618435 ) ) ( ON_BOARD ?auto_618432 ?auto_618433 ) ( POWER_ON ?auto_618432 ) ( not ( = ?auto_618431 ?auto_618432 ) ) ( POINTING ?auto_618433 ?auto_618434 ) ( HAVE_IMAGE ?auto_618426 ?auto_618427 ) ( not ( = ?auto_618426 ?auto_618434 ) ) ( not ( = ?auto_618426 ?auto_618435 ) ) ( not ( = ?auto_618427 ?auto_618425 ) ) ( not ( = ?auto_618427 ?auto_618429 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_618428 ?auto_618425 ?auto_618430 ?auto_618429 )
      ( GET-3IMAGE-VERIFY ?auto_618426 ?auto_618427 ?auto_618428 ?auto_618425 ?auto_618430 ?auto_618429 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_618462 - DIRECTION
      ?auto_618463 - MODE
      ?auto_618464 - DIRECTION
      ?auto_618461 - MODE
      ?auto_618466 - DIRECTION
      ?auto_618465 - MODE
    )
    :vars
    (
      ?auto_618467 - INSTRUMENT
      ?auto_618469 - SATELLITE
      ?auto_618470 - DIRECTION
      ?auto_618471 - DIRECTION
      ?auto_618468 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_618464 ?auto_618462 ) ) ( not ( = ?auto_618466 ?auto_618462 ) ) ( not ( = ?auto_618466 ?auto_618464 ) ) ( ON_BOARD ?auto_618467 ?auto_618469 ) ( SUPPORTS ?auto_618467 ?auto_618461 ) ( not ( = ?auto_618464 ?auto_618470 ) ) ( HAVE_IMAGE ?auto_618466 ?auto_618465 ) ( not ( = ?auto_618466 ?auto_618470 ) ) ( not ( = ?auto_618465 ?auto_618461 ) ) ( CALIBRATION_TARGET ?auto_618467 ?auto_618470 ) ( not ( = ?auto_618470 ?auto_618471 ) ) ( not ( = ?auto_618464 ?auto_618471 ) ) ( not ( = ?auto_618466 ?auto_618471 ) ) ( ON_BOARD ?auto_618468 ?auto_618469 ) ( POWER_ON ?auto_618468 ) ( not ( = ?auto_618467 ?auto_618468 ) ) ( POINTING ?auto_618469 ?auto_618470 ) ( HAVE_IMAGE ?auto_618462 ?auto_618463 ) ( not ( = ?auto_618462 ?auto_618470 ) ) ( not ( = ?auto_618462 ?auto_618471 ) ) ( not ( = ?auto_618463 ?auto_618461 ) ) ( not ( = ?auto_618463 ?auto_618465 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_618466 ?auto_618465 ?auto_618464 ?auto_618461 )
      ( GET-3IMAGE-VERIFY ?auto_618462 ?auto_618463 ?auto_618464 ?auto_618461 ?auto_618466 ?auto_618465 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_632934 - DIRECTION
      ?auto_632935 - MODE
      ?auto_632936 - DIRECTION
      ?auto_632933 - MODE
      ?auto_632938 - DIRECTION
      ?auto_632937 - MODE
    )
    :vars
    (
      ?auto_632939 - INSTRUMENT
      ?auto_632941 - SATELLITE
      ?auto_632940 - DIRECTION
      ?auto_632942 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_632936 ?auto_632934 ) ) ( not ( = ?auto_632938 ?auto_632934 ) ) ( not ( = ?auto_632938 ?auto_632936 ) ) ( ON_BOARD ?auto_632939 ?auto_632941 ) ( SUPPORTS ?auto_632939 ?auto_632935 ) ( not ( = ?auto_632934 ?auto_632940 ) ) ( HAVE_IMAGE ?auto_632936 ?auto_632933 ) ( not ( = ?auto_632936 ?auto_632940 ) ) ( not ( = ?auto_632933 ?auto_632935 ) ) ( CALIBRATION_TARGET ?auto_632939 ?auto_632940 ) ( not ( = ?auto_632940 ?auto_632938 ) ) ( ON_BOARD ?auto_632942 ?auto_632941 ) ( POWER_ON ?auto_632942 ) ( not ( = ?auto_632939 ?auto_632942 ) ) ( POINTING ?auto_632941 ?auto_632940 ) ( HAVE_IMAGE ?auto_632938 ?auto_632937 ) ( not ( = ?auto_632935 ?auto_632937 ) ) ( not ( = ?auto_632933 ?auto_632937 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_632936 ?auto_632933 ?auto_632934 ?auto_632935 )
      ( GET-3IMAGE-VERIFY ?auto_632934 ?auto_632935 ?auto_632936 ?auto_632933 ?auto_632938 ?auto_632937 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_618634 - DIRECTION
      ?auto_618635 - MODE
      ?auto_618636 - DIRECTION
      ?auto_618633 - MODE
      ?auto_618638 - DIRECTION
      ?auto_618637 - MODE
    )
    :vars
    (
      ?auto_618639 - INSTRUMENT
      ?auto_618641 - SATELLITE
      ?auto_618642 - DIRECTION
      ?auto_618643 - DIRECTION
      ?auto_618640 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_618636 ?auto_618634 ) ) ( not ( = ?auto_618638 ?auto_618634 ) ) ( not ( = ?auto_618638 ?auto_618636 ) ) ( ON_BOARD ?auto_618639 ?auto_618641 ) ( SUPPORTS ?auto_618639 ?auto_618635 ) ( not ( = ?auto_618634 ?auto_618642 ) ) ( HAVE_IMAGE ?auto_618638 ?auto_618637 ) ( not ( = ?auto_618638 ?auto_618642 ) ) ( not ( = ?auto_618637 ?auto_618635 ) ) ( CALIBRATION_TARGET ?auto_618639 ?auto_618642 ) ( not ( = ?auto_618642 ?auto_618643 ) ) ( not ( = ?auto_618634 ?auto_618643 ) ) ( not ( = ?auto_618638 ?auto_618643 ) ) ( ON_BOARD ?auto_618640 ?auto_618641 ) ( POWER_ON ?auto_618640 ) ( not ( = ?auto_618639 ?auto_618640 ) ) ( POINTING ?auto_618641 ?auto_618642 ) ( HAVE_IMAGE ?auto_618636 ?auto_618633 ) ( not ( = ?auto_618635 ?auto_618633 ) ) ( not ( = ?auto_618636 ?auto_618642 ) ) ( not ( = ?auto_618636 ?auto_618643 ) ) ( not ( = ?auto_618633 ?auto_618637 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_618638 ?auto_618637 ?auto_618634 ?auto_618635 )
      ( GET-3IMAGE-VERIFY ?auto_618634 ?auto_618635 ?auto_618636 ?auto_618633 ?auto_618638 ?auto_618637 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_868316 - DIRECTION
      ?auto_868317 - MODE
      ?auto_868318 - DIRECTION
      ?auto_868315 - MODE
      ?auto_868320 - DIRECTION
      ?auto_868319 - MODE
      ?auto_868321 - DIRECTION
      ?auto_868322 - MODE
      ?auto_868323 - DIRECTION
      ?auto_868324 - MODE
    )
    :vars
    (
      ?auto_868325 - INSTRUMENT
      ?auto_868326 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_868318 ?auto_868316 ) ) ( not ( = ?auto_868320 ?auto_868316 ) ) ( not ( = ?auto_868320 ?auto_868318 ) ) ( not ( = ?auto_868321 ?auto_868316 ) ) ( not ( = ?auto_868321 ?auto_868318 ) ) ( not ( = ?auto_868321 ?auto_868320 ) ) ( not ( = ?auto_868323 ?auto_868316 ) ) ( not ( = ?auto_868323 ?auto_868318 ) ) ( not ( = ?auto_868323 ?auto_868320 ) ) ( not ( = ?auto_868323 ?auto_868321 ) ) ( CALIBRATED ?auto_868325 ) ( ON_BOARD ?auto_868325 ?auto_868326 ) ( SUPPORTS ?auto_868325 ?auto_868324 ) ( POWER_ON ?auto_868325 ) ( POINTING ?auto_868326 ?auto_868323 ) ( HAVE_IMAGE ?auto_868316 ?auto_868317 ) ( HAVE_IMAGE ?auto_868318 ?auto_868315 ) ( HAVE_IMAGE ?auto_868320 ?auto_868319 ) ( HAVE_IMAGE ?auto_868321 ?auto_868322 ) ( not ( = ?auto_868317 ?auto_868315 ) ) ( not ( = ?auto_868317 ?auto_868319 ) ) ( not ( = ?auto_868317 ?auto_868322 ) ) ( not ( = ?auto_868317 ?auto_868324 ) ) ( not ( = ?auto_868315 ?auto_868319 ) ) ( not ( = ?auto_868315 ?auto_868322 ) ) ( not ( = ?auto_868315 ?auto_868324 ) ) ( not ( = ?auto_868319 ?auto_868322 ) ) ( not ( = ?auto_868319 ?auto_868324 ) ) ( not ( = ?auto_868322 ?auto_868324 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_868323 ?auto_868324 )
      ( GET-5IMAGE-VERIFY ?auto_868316 ?auto_868317 ?auto_868318 ?auto_868315 ?auto_868320 ?auto_868319 ?auto_868321 ?auto_868322 ?auto_868323 ?auto_868324 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_868364 - DIRECTION
      ?auto_868365 - MODE
      ?auto_868366 - DIRECTION
      ?auto_868363 - MODE
      ?auto_868368 - DIRECTION
      ?auto_868367 - MODE
      ?auto_868369 - DIRECTION
      ?auto_868370 - MODE
      ?auto_868371 - DIRECTION
      ?auto_868372 - MODE
    )
    :vars
    (
      ?auto_868373 - INSTRUMENT
      ?auto_868374 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_868366 ?auto_868364 ) ) ( not ( = ?auto_868368 ?auto_868364 ) ) ( not ( = ?auto_868368 ?auto_868366 ) ) ( not ( = ?auto_868369 ?auto_868364 ) ) ( not ( = ?auto_868369 ?auto_868366 ) ) ( not ( = ?auto_868369 ?auto_868368 ) ) ( not ( = ?auto_868371 ?auto_868364 ) ) ( not ( = ?auto_868371 ?auto_868366 ) ) ( not ( = ?auto_868371 ?auto_868368 ) ) ( not ( = ?auto_868371 ?auto_868369 ) ) ( CALIBRATED ?auto_868373 ) ( ON_BOARD ?auto_868373 ?auto_868374 ) ( SUPPORTS ?auto_868373 ?auto_868370 ) ( POWER_ON ?auto_868373 ) ( POINTING ?auto_868374 ?auto_868369 ) ( HAVE_IMAGE ?auto_868364 ?auto_868365 ) ( HAVE_IMAGE ?auto_868366 ?auto_868363 ) ( HAVE_IMAGE ?auto_868368 ?auto_868367 ) ( HAVE_IMAGE ?auto_868371 ?auto_868372 ) ( not ( = ?auto_868365 ?auto_868363 ) ) ( not ( = ?auto_868365 ?auto_868367 ) ) ( not ( = ?auto_868365 ?auto_868370 ) ) ( not ( = ?auto_868365 ?auto_868372 ) ) ( not ( = ?auto_868363 ?auto_868367 ) ) ( not ( = ?auto_868363 ?auto_868370 ) ) ( not ( = ?auto_868363 ?auto_868372 ) ) ( not ( = ?auto_868367 ?auto_868370 ) ) ( not ( = ?auto_868367 ?auto_868372 ) ) ( not ( = ?auto_868370 ?auto_868372 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_868369 ?auto_868370 )
      ( GET-5IMAGE-VERIFY ?auto_868364 ?auto_868365 ?auto_868366 ?auto_868363 ?auto_868368 ?auto_868367 ?auto_868369 ?auto_868370 ?auto_868371 ?auto_868372 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_868648 - DIRECTION
      ?auto_868649 - MODE
      ?auto_868650 - DIRECTION
      ?auto_868647 - MODE
      ?auto_868652 - DIRECTION
      ?auto_868651 - MODE
      ?auto_868653 - DIRECTION
      ?auto_868654 - MODE
      ?auto_868655 - DIRECTION
      ?auto_868656 - MODE
    )
    :vars
    (
      ?auto_868657 - INSTRUMENT
      ?auto_868658 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_868650 ?auto_868648 ) ) ( not ( = ?auto_868652 ?auto_868648 ) ) ( not ( = ?auto_868652 ?auto_868650 ) ) ( not ( = ?auto_868653 ?auto_868648 ) ) ( not ( = ?auto_868653 ?auto_868650 ) ) ( not ( = ?auto_868653 ?auto_868652 ) ) ( not ( = ?auto_868655 ?auto_868648 ) ) ( not ( = ?auto_868655 ?auto_868650 ) ) ( not ( = ?auto_868655 ?auto_868652 ) ) ( not ( = ?auto_868655 ?auto_868653 ) ) ( CALIBRATED ?auto_868657 ) ( ON_BOARD ?auto_868657 ?auto_868658 ) ( SUPPORTS ?auto_868657 ?auto_868651 ) ( POWER_ON ?auto_868657 ) ( POINTING ?auto_868658 ?auto_868652 ) ( HAVE_IMAGE ?auto_868648 ?auto_868649 ) ( HAVE_IMAGE ?auto_868650 ?auto_868647 ) ( HAVE_IMAGE ?auto_868653 ?auto_868654 ) ( HAVE_IMAGE ?auto_868655 ?auto_868656 ) ( not ( = ?auto_868649 ?auto_868647 ) ) ( not ( = ?auto_868649 ?auto_868651 ) ) ( not ( = ?auto_868649 ?auto_868654 ) ) ( not ( = ?auto_868649 ?auto_868656 ) ) ( not ( = ?auto_868647 ?auto_868651 ) ) ( not ( = ?auto_868647 ?auto_868654 ) ) ( not ( = ?auto_868647 ?auto_868656 ) ) ( not ( = ?auto_868651 ?auto_868654 ) ) ( not ( = ?auto_868651 ?auto_868656 ) ) ( not ( = ?auto_868654 ?auto_868656 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_868652 ?auto_868651 )
      ( GET-5IMAGE-VERIFY ?auto_868648 ?auto_868649 ?auto_868650 ?auto_868647 ?auto_868652 ?auto_868651 ?auto_868653 ?auto_868654 ?auto_868655 ?auto_868656 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_870686 - DIRECTION
      ?auto_870687 - MODE
      ?auto_870688 - DIRECTION
      ?auto_870685 - MODE
      ?auto_870690 - DIRECTION
      ?auto_870689 - MODE
      ?auto_870691 - DIRECTION
      ?auto_870692 - MODE
      ?auto_870693 - DIRECTION
      ?auto_870694 - MODE
    )
    :vars
    (
      ?auto_870695 - INSTRUMENT
      ?auto_870696 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_870688 ?auto_870686 ) ) ( not ( = ?auto_870690 ?auto_870686 ) ) ( not ( = ?auto_870690 ?auto_870688 ) ) ( not ( = ?auto_870691 ?auto_870686 ) ) ( not ( = ?auto_870691 ?auto_870688 ) ) ( not ( = ?auto_870691 ?auto_870690 ) ) ( not ( = ?auto_870693 ?auto_870686 ) ) ( not ( = ?auto_870693 ?auto_870688 ) ) ( not ( = ?auto_870693 ?auto_870690 ) ) ( not ( = ?auto_870693 ?auto_870691 ) ) ( CALIBRATED ?auto_870695 ) ( ON_BOARD ?auto_870695 ?auto_870696 ) ( SUPPORTS ?auto_870695 ?auto_870685 ) ( POWER_ON ?auto_870695 ) ( POINTING ?auto_870696 ?auto_870688 ) ( HAVE_IMAGE ?auto_870686 ?auto_870687 ) ( HAVE_IMAGE ?auto_870690 ?auto_870689 ) ( HAVE_IMAGE ?auto_870691 ?auto_870692 ) ( HAVE_IMAGE ?auto_870693 ?auto_870694 ) ( not ( = ?auto_870687 ?auto_870685 ) ) ( not ( = ?auto_870687 ?auto_870689 ) ) ( not ( = ?auto_870687 ?auto_870692 ) ) ( not ( = ?auto_870687 ?auto_870694 ) ) ( not ( = ?auto_870685 ?auto_870689 ) ) ( not ( = ?auto_870685 ?auto_870692 ) ) ( not ( = ?auto_870685 ?auto_870694 ) ) ( not ( = ?auto_870689 ?auto_870692 ) ) ( not ( = ?auto_870689 ?auto_870694 ) ) ( not ( = ?auto_870692 ?auto_870694 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_870688 ?auto_870685 )
      ( GET-5IMAGE-VERIFY ?auto_870686 ?auto_870687 ?auto_870688 ?auto_870685 ?auto_870690 ?auto_870689 ?auto_870691 ?auto_870692 ?auto_870693 ?auto_870694 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_885316 - DIRECTION
      ?auto_885317 - MODE
      ?auto_885318 - DIRECTION
      ?auto_885315 - MODE
      ?auto_885320 - DIRECTION
      ?auto_885319 - MODE
      ?auto_885321 - DIRECTION
      ?auto_885322 - MODE
      ?auto_885323 - DIRECTION
      ?auto_885324 - MODE
    )
    :vars
    (
      ?auto_885325 - INSTRUMENT
      ?auto_885326 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_885318 ?auto_885316 ) ) ( not ( = ?auto_885320 ?auto_885316 ) ) ( not ( = ?auto_885320 ?auto_885318 ) ) ( not ( = ?auto_885321 ?auto_885316 ) ) ( not ( = ?auto_885321 ?auto_885318 ) ) ( not ( = ?auto_885321 ?auto_885320 ) ) ( not ( = ?auto_885323 ?auto_885316 ) ) ( not ( = ?auto_885323 ?auto_885318 ) ) ( not ( = ?auto_885323 ?auto_885320 ) ) ( not ( = ?auto_885323 ?auto_885321 ) ) ( CALIBRATED ?auto_885325 ) ( ON_BOARD ?auto_885325 ?auto_885326 ) ( SUPPORTS ?auto_885325 ?auto_885317 ) ( POWER_ON ?auto_885325 ) ( POINTING ?auto_885326 ?auto_885316 ) ( HAVE_IMAGE ?auto_885318 ?auto_885315 ) ( HAVE_IMAGE ?auto_885320 ?auto_885319 ) ( HAVE_IMAGE ?auto_885321 ?auto_885322 ) ( HAVE_IMAGE ?auto_885323 ?auto_885324 ) ( not ( = ?auto_885317 ?auto_885315 ) ) ( not ( = ?auto_885317 ?auto_885319 ) ) ( not ( = ?auto_885317 ?auto_885322 ) ) ( not ( = ?auto_885317 ?auto_885324 ) ) ( not ( = ?auto_885315 ?auto_885319 ) ) ( not ( = ?auto_885315 ?auto_885322 ) ) ( not ( = ?auto_885315 ?auto_885324 ) ) ( not ( = ?auto_885319 ?auto_885322 ) ) ( not ( = ?auto_885319 ?auto_885324 ) ) ( not ( = ?auto_885322 ?auto_885324 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_885316 ?auto_885317 )
      ( GET-5IMAGE-VERIFY ?auto_885316 ?auto_885317 ?auto_885318 ?auto_885315 ?auto_885320 ?auto_885319 ?auto_885321 ?auto_885322 ?auto_885323 ?auto_885324 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_898005 - DIRECTION
      ?auto_898006 - MODE
      ?auto_898007 - DIRECTION
      ?auto_898004 - MODE
      ?auto_898009 - DIRECTION
      ?auto_898008 - MODE
      ?auto_898010 - DIRECTION
      ?auto_898011 - MODE
      ?auto_898012 - DIRECTION
      ?auto_898013 - MODE
    )
    :vars
    (
      ?auto_898016 - INSTRUMENT
      ?auto_898015 - SATELLITE
      ?auto_898014 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_898007 ?auto_898005 ) ) ( not ( = ?auto_898009 ?auto_898005 ) ) ( not ( = ?auto_898009 ?auto_898007 ) ) ( not ( = ?auto_898010 ?auto_898005 ) ) ( not ( = ?auto_898010 ?auto_898007 ) ) ( not ( = ?auto_898010 ?auto_898009 ) ) ( not ( = ?auto_898012 ?auto_898005 ) ) ( not ( = ?auto_898012 ?auto_898007 ) ) ( not ( = ?auto_898012 ?auto_898009 ) ) ( not ( = ?auto_898012 ?auto_898010 ) ) ( CALIBRATED ?auto_898016 ) ( ON_BOARD ?auto_898016 ?auto_898015 ) ( SUPPORTS ?auto_898016 ?auto_898013 ) ( POWER_ON ?auto_898016 ) ( POINTING ?auto_898015 ?auto_898014 ) ( not ( = ?auto_898012 ?auto_898014 ) ) ( HAVE_IMAGE ?auto_898005 ?auto_898006 ) ( not ( = ?auto_898005 ?auto_898014 ) ) ( not ( = ?auto_898006 ?auto_898013 ) ) ( HAVE_IMAGE ?auto_898007 ?auto_898004 ) ( HAVE_IMAGE ?auto_898009 ?auto_898008 ) ( HAVE_IMAGE ?auto_898010 ?auto_898011 ) ( not ( = ?auto_898006 ?auto_898004 ) ) ( not ( = ?auto_898006 ?auto_898008 ) ) ( not ( = ?auto_898006 ?auto_898011 ) ) ( not ( = ?auto_898007 ?auto_898014 ) ) ( not ( = ?auto_898004 ?auto_898008 ) ) ( not ( = ?auto_898004 ?auto_898011 ) ) ( not ( = ?auto_898004 ?auto_898013 ) ) ( not ( = ?auto_898009 ?auto_898014 ) ) ( not ( = ?auto_898008 ?auto_898011 ) ) ( not ( = ?auto_898008 ?auto_898013 ) ) ( not ( = ?auto_898010 ?auto_898014 ) ) ( not ( = ?auto_898011 ?auto_898013 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_898005 ?auto_898006 ?auto_898012 ?auto_898013 )
      ( GET-5IMAGE-VERIFY ?auto_898005 ?auto_898006 ?auto_898007 ?auto_898004 ?auto_898009 ?auto_898008 ?auto_898010 ?auto_898011 ?auto_898012 ?auto_898013 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_898057 - DIRECTION
      ?auto_898058 - MODE
      ?auto_898059 - DIRECTION
      ?auto_898056 - MODE
      ?auto_898061 - DIRECTION
      ?auto_898060 - MODE
      ?auto_898062 - DIRECTION
      ?auto_898063 - MODE
      ?auto_898064 - DIRECTION
      ?auto_898065 - MODE
    )
    :vars
    (
      ?auto_898068 - INSTRUMENT
      ?auto_898067 - SATELLITE
      ?auto_898066 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_898059 ?auto_898057 ) ) ( not ( = ?auto_898061 ?auto_898057 ) ) ( not ( = ?auto_898061 ?auto_898059 ) ) ( not ( = ?auto_898062 ?auto_898057 ) ) ( not ( = ?auto_898062 ?auto_898059 ) ) ( not ( = ?auto_898062 ?auto_898061 ) ) ( not ( = ?auto_898064 ?auto_898057 ) ) ( not ( = ?auto_898064 ?auto_898059 ) ) ( not ( = ?auto_898064 ?auto_898061 ) ) ( not ( = ?auto_898064 ?auto_898062 ) ) ( CALIBRATED ?auto_898068 ) ( ON_BOARD ?auto_898068 ?auto_898067 ) ( SUPPORTS ?auto_898068 ?auto_898063 ) ( POWER_ON ?auto_898068 ) ( POINTING ?auto_898067 ?auto_898066 ) ( not ( = ?auto_898062 ?auto_898066 ) ) ( HAVE_IMAGE ?auto_898057 ?auto_898058 ) ( not ( = ?auto_898057 ?auto_898066 ) ) ( not ( = ?auto_898058 ?auto_898063 ) ) ( HAVE_IMAGE ?auto_898059 ?auto_898056 ) ( HAVE_IMAGE ?auto_898061 ?auto_898060 ) ( HAVE_IMAGE ?auto_898064 ?auto_898065 ) ( not ( = ?auto_898058 ?auto_898056 ) ) ( not ( = ?auto_898058 ?auto_898060 ) ) ( not ( = ?auto_898058 ?auto_898065 ) ) ( not ( = ?auto_898059 ?auto_898066 ) ) ( not ( = ?auto_898056 ?auto_898060 ) ) ( not ( = ?auto_898056 ?auto_898063 ) ) ( not ( = ?auto_898056 ?auto_898065 ) ) ( not ( = ?auto_898061 ?auto_898066 ) ) ( not ( = ?auto_898060 ?auto_898063 ) ) ( not ( = ?auto_898060 ?auto_898065 ) ) ( not ( = ?auto_898063 ?auto_898065 ) ) ( not ( = ?auto_898064 ?auto_898066 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_898057 ?auto_898058 ?auto_898062 ?auto_898063 )
      ( GET-5IMAGE-VERIFY ?auto_898057 ?auto_898058 ?auto_898059 ?auto_898056 ?auto_898061 ?auto_898060 ?auto_898062 ?auto_898063 ?auto_898064 ?auto_898065 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_898363 - DIRECTION
      ?auto_898364 - MODE
      ?auto_898365 - DIRECTION
      ?auto_898362 - MODE
      ?auto_898367 - DIRECTION
      ?auto_898366 - MODE
      ?auto_898368 - DIRECTION
      ?auto_898369 - MODE
      ?auto_898370 - DIRECTION
      ?auto_898371 - MODE
    )
    :vars
    (
      ?auto_898374 - INSTRUMENT
      ?auto_898373 - SATELLITE
      ?auto_898372 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_898365 ?auto_898363 ) ) ( not ( = ?auto_898367 ?auto_898363 ) ) ( not ( = ?auto_898367 ?auto_898365 ) ) ( not ( = ?auto_898368 ?auto_898363 ) ) ( not ( = ?auto_898368 ?auto_898365 ) ) ( not ( = ?auto_898368 ?auto_898367 ) ) ( not ( = ?auto_898370 ?auto_898363 ) ) ( not ( = ?auto_898370 ?auto_898365 ) ) ( not ( = ?auto_898370 ?auto_898367 ) ) ( not ( = ?auto_898370 ?auto_898368 ) ) ( CALIBRATED ?auto_898374 ) ( ON_BOARD ?auto_898374 ?auto_898373 ) ( SUPPORTS ?auto_898374 ?auto_898366 ) ( POWER_ON ?auto_898374 ) ( POINTING ?auto_898373 ?auto_898372 ) ( not ( = ?auto_898367 ?auto_898372 ) ) ( HAVE_IMAGE ?auto_898363 ?auto_898364 ) ( not ( = ?auto_898363 ?auto_898372 ) ) ( not ( = ?auto_898364 ?auto_898366 ) ) ( HAVE_IMAGE ?auto_898365 ?auto_898362 ) ( HAVE_IMAGE ?auto_898368 ?auto_898369 ) ( HAVE_IMAGE ?auto_898370 ?auto_898371 ) ( not ( = ?auto_898364 ?auto_898362 ) ) ( not ( = ?auto_898364 ?auto_898369 ) ) ( not ( = ?auto_898364 ?auto_898371 ) ) ( not ( = ?auto_898365 ?auto_898372 ) ) ( not ( = ?auto_898362 ?auto_898366 ) ) ( not ( = ?auto_898362 ?auto_898369 ) ) ( not ( = ?auto_898362 ?auto_898371 ) ) ( not ( = ?auto_898366 ?auto_898369 ) ) ( not ( = ?auto_898366 ?auto_898371 ) ) ( not ( = ?auto_898368 ?auto_898372 ) ) ( not ( = ?auto_898369 ?auto_898371 ) ) ( not ( = ?auto_898370 ?auto_898372 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_898363 ?auto_898364 ?auto_898367 ?auto_898366 )
      ( GET-5IMAGE-VERIFY ?auto_898363 ?auto_898364 ?auto_898365 ?auto_898362 ?auto_898367 ?auto_898366 ?auto_898368 ?auto_898369 ?auto_898370 ?auto_898371 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_900560 - DIRECTION
      ?auto_900561 - MODE
      ?auto_900562 - DIRECTION
      ?auto_900559 - MODE
      ?auto_900564 - DIRECTION
      ?auto_900563 - MODE
      ?auto_900565 - DIRECTION
      ?auto_900566 - MODE
      ?auto_900567 - DIRECTION
      ?auto_900568 - MODE
    )
    :vars
    (
      ?auto_900571 - INSTRUMENT
      ?auto_900570 - SATELLITE
      ?auto_900569 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_900562 ?auto_900560 ) ) ( not ( = ?auto_900564 ?auto_900560 ) ) ( not ( = ?auto_900564 ?auto_900562 ) ) ( not ( = ?auto_900565 ?auto_900560 ) ) ( not ( = ?auto_900565 ?auto_900562 ) ) ( not ( = ?auto_900565 ?auto_900564 ) ) ( not ( = ?auto_900567 ?auto_900560 ) ) ( not ( = ?auto_900567 ?auto_900562 ) ) ( not ( = ?auto_900567 ?auto_900564 ) ) ( not ( = ?auto_900567 ?auto_900565 ) ) ( CALIBRATED ?auto_900571 ) ( ON_BOARD ?auto_900571 ?auto_900570 ) ( SUPPORTS ?auto_900571 ?auto_900559 ) ( POWER_ON ?auto_900571 ) ( POINTING ?auto_900570 ?auto_900569 ) ( not ( = ?auto_900562 ?auto_900569 ) ) ( HAVE_IMAGE ?auto_900560 ?auto_900561 ) ( not ( = ?auto_900560 ?auto_900569 ) ) ( not ( = ?auto_900561 ?auto_900559 ) ) ( HAVE_IMAGE ?auto_900564 ?auto_900563 ) ( HAVE_IMAGE ?auto_900565 ?auto_900566 ) ( HAVE_IMAGE ?auto_900567 ?auto_900568 ) ( not ( = ?auto_900561 ?auto_900563 ) ) ( not ( = ?auto_900561 ?auto_900566 ) ) ( not ( = ?auto_900561 ?auto_900568 ) ) ( not ( = ?auto_900559 ?auto_900563 ) ) ( not ( = ?auto_900559 ?auto_900566 ) ) ( not ( = ?auto_900559 ?auto_900568 ) ) ( not ( = ?auto_900564 ?auto_900569 ) ) ( not ( = ?auto_900563 ?auto_900566 ) ) ( not ( = ?auto_900563 ?auto_900568 ) ) ( not ( = ?auto_900565 ?auto_900569 ) ) ( not ( = ?auto_900566 ?auto_900568 ) ) ( not ( = ?auto_900567 ?auto_900569 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_900560 ?auto_900561 ?auto_900562 ?auto_900559 )
      ( GET-5IMAGE-VERIFY ?auto_900560 ?auto_900561 ?auto_900562 ?auto_900559 ?auto_900564 ?auto_900563 ?auto_900565 ?auto_900566 ?auto_900567 ?auto_900568 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_917395 - DIRECTION
      ?auto_917396 - MODE
      ?auto_917397 - DIRECTION
      ?auto_917394 - MODE
      ?auto_917399 - DIRECTION
      ?auto_917398 - MODE
      ?auto_917400 - DIRECTION
      ?auto_917401 - MODE
      ?auto_917402 - DIRECTION
      ?auto_917403 - MODE
    )
    :vars
    (
      ?auto_917406 - INSTRUMENT
      ?auto_917405 - SATELLITE
      ?auto_917404 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_917397 ?auto_917395 ) ) ( not ( = ?auto_917399 ?auto_917395 ) ) ( not ( = ?auto_917399 ?auto_917397 ) ) ( not ( = ?auto_917400 ?auto_917395 ) ) ( not ( = ?auto_917400 ?auto_917397 ) ) ( not ( = ?auto_917400 ?auto_917399 ) ) ( not ( = ?auto_917402 ?auto_917395 ) ) ( not ( = ?auto_917402 ?auto_917397 ) ) ( not ( = ?auto_917402 ?auto_917399 ) ) ( not ( = ?auto_917402 ?auto_917400 ) ) ( CALIBRATED ?auto_917406 ) ( ON_BOARD ?auto_917406 ?auto_917405 ) ( SUPPORTS ?auto_917406 ?auto_917396 ) ( POWER_ON ?auto_917406 ) ( POINTING ?auto_917405 ?auto_917404 ) ( not ( = ?auto_917395 ?auto_917404 ) ) ( HAVE_IMAGE ?auto_917397 ?auto_917394 ) ( not ( = ?auto_917397 ?auto_917404 ) ) ( not ( = ?auto_917394 ?auto_917396 ) ) ( HAVE_IMAGE ?auto_917399 ?auto_917398 ) ( HAVE_IMAGE ?auto_917400 ?auto_917401 ) ( HAVE_IMAGE ?auto_917402 ?auto_917403 ) ( not ( = ?auto_917396 ?auto_917398 ) ) ( not ( = ?auto_917396 ?auto_917401 ) ) ( not ( = ?auto_917396 ?auto_917403 ) ) ( not ( = ?auto_917394 ?auto_917398 ) ) ( not ( = ?auto_917394 ?auto_917401 ) ) ( not ( = ?auto_917394 ?auto_917403 ) ) ( not ( = ?auto_917399 ?auto_917404 ) ) ( not ( = ?auto_917398 ?auto_917401 ) ) ( not ( = ?auto_917398 ?auto_917403 ) ) ( not ( = ?auto_917400 ?auto_917404 ) ) ( not ( = ?auto_917401 ?auto_917403 ) ) ( not ( = ?auto_917402 ?auto_917404 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_917397 ?auto_917394 ?auto_917395 ?auto_917396 )
      ( GET-5IMAGE-VERIFY ?auto_917395 ?auto_917396 ?auto_917397 ?auto_917394 ?auto_917399 ?auto_917398 ?auto_917400 ?auto_917401 ?auto_917402 ?auto_917403 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_931162 - DIRECTION
      ?auto_931163 - MODE
      ?auto_931164 - DIRECTION
      ?auto_931161 - MODE
      ?auto_931166 - DIRECTION
      ?auto_931165 - MODE
      ?auto_931167 - DIRECTION
      ?auto_931168 - MODE
      ?auto_931169 - DIRECTION
      ?auto_931170 - MODE
    )
    :vars
    (
      ?auto_931173 - INSTRUMENT
      ?auto_931172 - SATELLITE
      ?auto_931171 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_931164 ?auto_931162 ) ) ( not ( = ?auto_931166 ?auto_931162 ) ) ( not ( = ?auto_931166 ?auto_931164 ) ) ( not ( = ?auto_931167 ?auto_931162 ) ) ( not ( = ?auto_931167 ?auto_931164 ) ) ( not ( = ?auto_931167 ?auto_931166 ) ) ( not ( = ?auto_931169 ?auto_931162 ) ) ( not ( = ?auto_931169 ?auto_931164 ) ) ( not ( = ?auto_931169 ?auto_931166 ) ) ( not ( = ?auto_931169 ?auto_931167 ) ) ( ON_BOARD ?auto_931173 ?auto_931172 ) ( SUPPORTS ?auto_931173 ?auto_931170 ) ( POWER_ON ?auto_931173 ) ( POINTING ?auto_931172 ?auto_931171 ) ( not ( = ?auto_931169 ?auto_931171 ) ) ( HAVE_IMAGE ?auto_931162 ?auto_931163 ) ( not ( = ?auto_931162 ?auto_931171 ) ) ( not ( = ?auto_931163 ?auto_931170 ) ) ( CALIBRATION_TARGET ?auto_931173 ?auto_931171 ) ( NOT_CALIBRATED ?auto_931173 ) ( HAVE_IMAGE ?auto_931164 ?auto_931161 ) ( HAVE_IMAGE ?auto_931166 ?auto_931165 ) ( HAVE_IMAGE ?auto_931167 ?auto_931168 ) ( not ( = ?auto_931163 ?auto_931161 ) ) ( not ( = ?auto_931163 ?auto_931165 ) ) ( not ( = ?auto_931163 ?auto_931168 ) ) ( not ( = ?auto_931164 ?auto_931171 ) ) ( not ( = ?auto_931161 ?auto_931165 ) ) ( not ( = ?auto_931161 ?auto_931168 ) ) ( not ( = ?auto_931161 ?auto_931170 ) ) ( not ( = ?auto_931166 ?auto_931171 ) ) ( not ( = ?auto_931165 ?auto_931168 ) ) ( not ( = ?auto_931165 ?auto_931170 ) ) ( not ( = ?auto_931167 ?auto_931171 ) ) ( not ( = ?auto_931168 ?auto_931170 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_931162 ?auto_931163 ?auto_931169 ?auto_931170 )
      ( GET-5IMAGE-VERIFY ?auto_931162 ?auto_931163 ?auto_931164 ?auto_931161 ?auto_931166 ?auto_931165 ?auto_931167 ?auto_931168 ?auto_931169 ?auto_931170 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_931214 - DIRECTION
      ?auto_931215 - MODE
      ?auto_931216 - DIRECTION
      ?auto_931213 - MODE
      ?auto_931218 - DIRECTION
      ?auto_931217 - MODE
      ?auto_931219 - DIRECTION
      ?auto_931220 - MODE
      ?auto_931221 - DIRECTION
      ?auto_931222 - MODE
    )
    :vars
    (
      ?auto_931225 - INSTRUMENT
      ?auto_931224 - SATELLITE
      ?auto_931223 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_931216 ?auto_931214 ) ) ( not ( = ?auto_931218 ?auto_931214 ) ) ( not ( = ?auto_931218 ?auto_931216 ) ) ( not ( = ?auto_931219 ?auto_931214 ) ) ( not ( = ?auto_931219 ?auto_931216 ) ) ( not ( = ?auto_931219 ?auto_931218 ) ) ( not ( = ?auto_931221 ?auto_931214 ) ) ( not ( = ?auto_931221 ?auto_931216 ) ) ( not ( = ?auto_931221 ?auto_931218 ) ) ( not ( = ?auto_931221 ?auto_931219 ) ) ( ON_BOARD ?auto_931225 ?auto_931224 ) ( SUPPORTS ?auto_931225 ?auto_931220 ) ( POWER_ON ?auto_931225 ) ( POINTING ?auto_931224 ?auto_931223 ) ( not ( = ?auto_931219 ?auto_931223 ) ) ( HAVE_IMAGE ?auto_931214 ?auto_931215 ) ( not ( = ?auto_931214 ?auto_931223 ) ) ( not ( = ?auto_931215 ?auto_931220 ) ) ( CALIBRATION_TARGET ?auto_931225 ?auto_931223 ) ( NOT_CALIBRATED ?auto_931225 ) ( HAVE_IMAGE ?auto_931216 ?auto_931213 ) ( HAVE_IMAGE ?auto_931218 ?auto_931217 ) ( HAVE_IMAGE ?auto_931221 ?auto_931222 ) ( not ( = ?auto_931215 ?auto_931213 ) ) ( not ( = ?auto_931215 ?auto_931217 ) ) ( not ( = ?auto_931215 ?auto_931222 ) ) ( not ( = ?auto_931216 ?auto_931223 ) ) ( not ( = ?auto_931213 ?auto_931217 ) ) ( not ( = ?auto_931213 ?auto_931220 ) ) ( not ( = ?auto_931213 ?auto_931222 ) ) ( not ( = ?auto_931218 ?auto_931223 ) ) ( not ( = ?auto_931217 ?auto_931220 ) ) ( not ( = ?auto_931217 ?auto_931222 ) ) ( not ( = ?auto_931220 ?auto_931222 ) ) ( not ( = ?auto_931221 ?auto_931223 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_931214 ?auto_931215 ?auto_931219 ?auto_931220 )
      ( GET-5IMAGE-VERIFY ?auto_931214 ?auto_931215 ?auto_931216 ?auto_931213 ?auto_931218 ?auto_931217 ?auto_931219 ?auto_931220 ?auto_931221 ?auto_931222 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_931520 - DIRECTION
      ?auto_931521 - MODE
      ?auto_931522 - DIRECTION
      ?auto_931519 - MODE
      ?auto_931524 - DIRECTION
      ?auto_931523 - MODE
      ?auto_931525 - DIRECTION
      ?auto_931526 - MODE
      ?auto_931527 - DIRECTION
      ?auto_931528 - MODE
    )
    :vars
    (
      ?auto_931531 - INSTRUMENT
      ?auto_931530 - SATELLITE
      ?auto_931529 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_931522 ?auto_931520 ) ) ( not ( = ?auto_931524 ?auto_931520 ) ) ( not ( = ?auto_931524 ?auto_931522 ) ) ( not ( = ?auto_931525 ?auto_931520 ) ) ( not ( = ?auto_931525 ?auto_931522 ) ) ( not ( = ?auto_931525 ?auto_931524 ) ) ( not ( = ?auto_931527 ?auto_931520 ) ) ( not ( = ?auto_931527 ?auto_931522 ) ) ( not ( = ?auto_931527 ?auto_931524 ) ) ( not ( = ?auto_931527 ?auto_931525 ) ) ( ON_BOARD ?auto_931531 ?auto_931530 ) ( SUPPORTS ?auto_931531 ?auto_931523 ) ( POWER_ON ?auto_931531 ) ( POINTING ?auto_931530 ?auto_931529 ) ( not ( = ?auto_931524 ?auto_931529 ) ) ( HAVE_IMAGE ?auto_931520 ?auto_931521 ) ( not ( = ?auto_931520 ?auto_931529 ) ) ( not ( = ?auto_931521 ?auto_931523 ) ) ( CALIBRATION_TARGET ?auto_931531 ?auto_931529 ) ( NOT_CALIBRATED ?auto_931531 ) ( HAVE_IMAGE ?auto_931522 ?auto_931519 ) ( HAVE_IMAGE ?auto_931525 ?auto_931526 ) ( HAVE_IMAGE ?auto_931527 ?auto_931528 ) ( not ( = ?auto_931521 ?auto_931519 ) ) ( not ( = ?auto_931521 ?auto_931526 ) ) ( not ( = ?auto_931521 ?auto_931528 ) ) ( not ( = ?auto_931522 ?auto_931529 ) ) ( not ( = ?auto_931519 ?auto_931523 ) ) ( not ( = ?auto_931519 ?auto_931526 ) ) ( not ( = ?auto_931519 ?auto_931528 ) ) ( not ( = ?auto_931523 ?auto_931526 ) ) ( not ( = ?auto_931523 ?auto_931528 ) ) ( not ( = ?auto_931525 ?auto_931529 ) ) ( not ( = ?auto_931526 ?auto_931528 ) ) ( not ( = ?auto_931527 ?auto_931529 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_931520 ?auto_931521 ?auto_931524 ?auto_931523 )
      ( GET-5IMAGE-VERIFY ?auto_931520 ?auto_931521 ?auto_931522 ?auto_931519 ?auto_931524 ?auto_931523 ?auto_931525 ?auto_931526 ?auto_931527 ?auto_931528 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_933717 - DIRECTION
      ?auto_933718 - MODE
      ?auto_933719 - DIRECTION
      ?auto_933716 - MODE
      ?auto_933721 - DIRECTION
      ?auto_933720 - MODE
      ?auto_933722 - DIRECTION
      ?auto_933723 - MODE
      ?auto_933724 - DIRECTION
      ?auto_933725 - MODE
    )
    :vars
    (
      ?auto_933728 - INSTRUMENT
      ?auto_933727 - SATELLITE
      ?auto_933726 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_933719 ?auto_933717 ) ) ( not ( = ?auto_933721 ?auto_933717 ) ) ( not ( = ?auto_933721 ?auto_933719 ) ) ( not ( = ?auto_933722 ?auto_933717 ) ) ( not ( = ?auto_933722 ?auto_933719 ) ) ( not ( = ?auto_933722 ?auto_933721 ) ) ( not ( = ?auto_933724 ?auto_933717 ) ) ( not ( = ?auto_933724 ?auto_933719 ) ) ( not ( = ?auto_933724 ?auto_933721 ) ) ( not ( = ?auto_933724 ?auto_933722 ) ) ( ON_BOARD ?auto_933728 ?auto_933727 ) ( SUPPORTS ?auto_933728 ?auto_933716 ) ( POWER_ON ?auto_933728 ) ( POINTING ?auto_933727 ?auto_933726 ) ( not ( = ?auto_933719 ?auto_933726 ) ) ( HAVE_IMAGE ?auto_933717 ?auto_933718 ) ( not ( = ?auto_933717 ?auto_933726 ) ) ( not ( = ?auto_933718 ?auto_933716 ) ) ( CALIBRATION_TARGET ?auto_933728 ?auto_933726 ) ( NOT_CALIBRATED ?auto_933728 ) ( HAVE_IMAGE ?auto_933721 ?auto_933720 ) ( HAVE_IMAGE ?auto_933722 ?auto_933723 ) ( HAVE_IMAGE ?auto_933724 ?auto_933725 ) ( not ( = ?auto_933718 ?auto_933720 ) ) ( not ( = ?auto_933718 ?auto_933723 ) ) ( not ( = ?auto_933718 ?auto_933725 ) ) ( not ( = ?auto_933716 ?auto_933720 ) ) ( not ( = ?auto_933716 ?auto_933723 ) ) ( not ( = ?auto_933716 ?auto_933725 ) ) ( not ( = ?auto_933721 ?auto_933726 ) ) ( not ( = ?auto_933720 ?auto_933723 ) ) ( not ( = ?auto_933720 ?auto_933725 ) ) ( not ( = ?auto_933722 ?auto_933726 ) ) ( not ( = ?auto_933723 ?auto_933725 ) ) ( not ( = ?auto_933724 ?auto_933726 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_933717 ?auto_933718 ?auto_933719 ?auto_933716 )
      ( GET-5IMAGE-VERIFY ?auto_933717 ?auto_933718 ?auto_933719 ?auto_933716 ?auto_933721 ?auto_933720 ?auto_933722 ?auto_933723 ?auto_933724 ?auto_933725 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_950552 - DIRECTION
      ?auto_950553 - MODE
      ?auto_950554 - DIRECTION
      ?auto_950551 - MODE
      ?auto_950556 - DIRECTION
      ?auto_950555 - MODE
      ?auto_950557 - DIRECTION
      ?auto_950558 - MODE
      ?auto_950559 - DIRECTION
      ?auto_950560 - MODE
    )
    :vars
    (
      ?auto_950563 - INSTRUMENT
      ?auto_950562 - SATELLITE
      ?auto_950561 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_950554 ?auto_950552 ) ) ( not ( = ?auto_950556 ?auto_950552 ) ) ( not ( = ?auto_950556 ?auto_950554 ) ) ( not ( = ?auto_950557 ?auto_950552 ) ) ( not ( = ?auto_950557 ?auto_950554 ) ) ( not ( = ?auto_950557 ?auto_950556 ) ) ( not ( = ?auto_950559 ?auto_950552 ) ) ( not ( = ?auto_950559 ?auto_950554 ) ) ( not ( = ?auto_950559 ?auto_950556 ) ) ( not ( = ?auto_950559 ?auto_950557 ) ) ( ON_BOARD ?auto_950563 ?auto_950562 ) ( SUPPORTS ?auto_950563 ?auto_950553 ) ( POWER_ON ?auto_950563 ) ( POINTING ?auto_950562 ?auto_950561 ) ( not ( = ?auto_950552 ?auto_950561 ) ) ( HAVE_IMAGE ?auto_950554 ?auto_950551 ) ( not ( = ?auto_950554 ?auto_950561 ) ) ( not ( = ?auto_950551 ?auto_950553 ) ) ( CALIBRATION_TARGET ?auto_950563 ?auto_950561 ) ( NOT_CALIBRATED ?auto_950563 ) ( HAVE_IMAGE ?auto_950556 ?auto_950555 ) ( HAVE_IMAGE ?auto_950557 ?auto_950558 ) ( HAVE_IMAGE ?auto_950559 ?auto_950560 ) ( not ( = ?auto_950553 ?auto_950555 ) ) ( not ( = ?auto_950553 ?auto_950558 ) ) ( not ( = ?auto_950553 ?auto_950560 ) ) ( not ( = ?auto_950551 ?auto_950555 ) ) ( not ( = ?auto_950551 ?auto_950558 ) ) ( not ( = ?auto_950551 ?auto_950560 ) ) ( not ( = ?auto_950556 ?auto_950561 ) ) ( not ( = ?auto_950555 ?auto_950558 ) ) ( not ( = ?auto_950555 ?auto_950560 ) ) ( not ( = ?auto_950557 ?auto_950561 ) ) ( not ( = ?auto_950558 ?auto_950560 ) ) ( not ( = ?auto_950559 ?auto_950561 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_950554 ?auto_950551 ?auto_950552 ?auto_950553 )
      ( GET-5IMAGE-VERIFY ?auto_950552 ?auto_950553 ?auto_950554 ?auto_950551 ?auto_950556 ?auto_950555 ?auto_950557 ?auto_950558 ?auto_950559 ?auto_950560 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_964319 - DIRECTION
      ?auto_964320 - MODE
      ?auto_964321 - DIRECTION
      ?auto_964318 - MODE
      ?auto_964323 - DIRECTION
      ?auto_964322 - MODE
      ?auto_964324 - DIRECTION
      ?auto_964325 - MODE
      ?auto_964326 - DIRECTION
      ?auto_964327 - MODE
    )
    :vars
    (
      ?auto_964328 - INSTRUMENT
      ?auto_964329 - SATELLITE
      ?auto_964330 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_964321 ?auto_964319 ) ) ( not ( = ?auto_964323 ?auto_964319 ) ) ( not ( = ?auto_964323 ?auto_964321 ) ) ( not ( = ?auto_964324 ?auto_964319 ) ) ( not ( = ?auto_964324 ?auto_964321 ) ) ( not ( = ?auto_964324 ?auto_964323 ) ) ( not ( = ?auto_964326 ?auto_964319 ) ) ( not ( = ?auto_964326 ?auto_964321 ) ) ( not ( = ?auto_964326 ?auto_964323 ) ) ( not ( = ?auto_964326 ?auto_964324 ) ) ( ON_BOARD ?auto_964328 ?auto_964329 ) ( SUPPORTS ?auto_964328 ?auto_964327 ) ( POINTING ?auto_964329 ?auto_964330 ) ( not ( = ?auto_964326 ?auto_964330 ) ) ( HAVE_IMAGE ?auto_964319 ?auto_964320 ) ( not ( = ?auto_964319 ?auto_964330 ) ) ( not ( = ?auto_964320 ?auto_964327 ) ) ( CALIBRATION_TARGET ?auto_964328 ?auto_964330 ) ( POWER_AVAIL ?auto_964329 ) ( HAVE_IMAGE ?auto_964321 ?auto_964318 ) ( HAVE_IMAGE ?auto_964323 ?auto_964322 ) ( HAVE_IMAGE ?auto_964324 ?auto_964325 ) ( not ( = ?auto_964320 ?auto_964318 ) ) ( not ( = ?auto_964320 ?auto_964322 ) ) ( not ( = ?auto_964320 ?auto_964325 ) ) ( not ( = ?auto_964321 ?auto_964330 ) ) ( not ( = ?auto_964318 ?auto_964322 ) ) ( not ( = ?auto_964318 ?auto_964325 ) ) ( not ( = ?auto_964318 ?auto_964327 ) ) ( not ( = ?auto_964323 ?auto_964330 ) ) ( not ( = ?auto_964322 ?auto_964325 ) ) ( not ( = ?auto_964322 ?auto_964327 ) ) ( not ( = ?auto_964324 ?auto_964330 ) ) ( not ( = ?auto_964325 ?auto_964327 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_964319 ?auto_964320 ?auto_964326 ?auto_964327 )
      ( GET-5IMAGE-VERIFY ?auto_964319 ?auto_964320 ?auto_964321 ?auto_964318 ?auto_964323 ?auto_964322 ?auto_964324 ?auto_964325 ?auto_964326 ?auto_964327 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_964371 - DIRECTION
      ?auto_964372 - MODE
      ?auto_964373 - DIRECTION
      ?auto_964370 - MODE
      ?auto_964375 - DIRECTION
      ?auto_964374 - MODE
      ?auto_964376 - DIRECTION
      ?auto_964377 - MODE
      ?auto_964378 - DIRECTION
      ?auto_964379 - MODE
    )
    :vars
    (
      ?auto_964380 - INSTRUMENT
      ?auto_964381 - SATELLITE
      ?auto_964382 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_964373 ?auto_964371 ) ) ( not ( = ?auto_964375 ?auto_964371 ) ) ( not ( = ?auto_964375 ?auto_964373 ) ) ( not ( = ?auto_964376 ?auto_964371 ) ) ( not ( = ?auto_964376 ?auto_964373 ) ) ( not ( = ?auto_964376 ?auto_964375 ) ) ( not ( = ?auto_964378 ?auto_964371 ) ) ( not ( = ?auto_964378 ?auto_964373 ) ) ( not ( = ?auto_964378 ?auto_964375 ) ) ( not ( = ?auto_964378 ?auto_964376 ) ) ( ON_BOARD ?auto_964380 ?auto_964381 ) ( SUPPORTS ?auto_964380 ?auto_964377 ) ( POINTING ?auto_964381 ?auto_964382 ) ( not ( = ?auto_964376 ?auto_964382 ) ) ( HAVE_IMAGE ?auto_964371 ?auto_964372 ) ( not ( = ?auto_964371 ?auto_964382 ) ) ( not ( = ?auto_964372 ?auto_964377 ) ) ( CALIBRATION_TARGET ?auto_964380 ?auto_964382 ) ( POWER_AVAIL ?auto_964381 ) ( HAVE_IMAGE ?auto_964373 ?auto_964370 ) ( HAVE_IMAGE ?auto_964375 ?auto_964374 ) ( HAVE_IMAGE ?auto_964378 ?auto_964379 ) ( not ( = ?auto_964372 ?auto_964370 ) ) ( not ( = ?auto_964372 ?auto_964374 ) ) ( not ( = ?auto_964372 ?auto_964379 ) ) ( not ( = ?auto_964373 ?auto_964382 ) ) ( not ( = ?auto_964370 ?auto_964374 ) ) ( not ( = ?auto_964370 ?auto_964377 ) ) ( not ( = ?auto_964370 ?auto_964379 ) ) ( not ( = ?auto_964375 ?auto_964382 ) ) ( not ( = ?auto_964374 ?auto_964377 ) ) ( not ( = ?auto_964374 ?auto_964379 ) ) ( not ( = ?auto_964377 ?auto_964379 ) ) ( not ( = ?auto_964378 ?auto_964382 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_964371 ?auto_964372 ?auto_964376 ?auto_964377 )
      ( GET-5IMAGE-VERIFY ?auto_964371 ?auto_964372 ?auto_964373 ?auto_964370 ?auto_964375 ?auto_964374 ?auto_964376 ?auto_964377 ?auto_964378 ?auto_964379 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_964677 - DIRECTION
      ?auto_964678 - MODE
      ?auto_964679 - DIRECTION
      ?auto_964676 - MODE
      ?auto_964681 - DIRECTION
      ?auto_964680 - MODE
      ?auto_964682 - DIRECTION
      ?auto_964683 - MODE
      ?auto_964684 - DIRECTION
      ?auto_964685 - MODE
    )
    :vars
    (
      ?auto_964686 - INSTRUMENT
      ?auto_964687 - SATELLITE
      ?auto_964688 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_964679 ?auto_964677 ) ) ( not ( = ?auto_964681 ?auto_964677 ) ) ( not ( = ?auto_964681 ?auto_964679 ) ) ( not ( = ?auto_964682 ?auto_964677 ) ) ( not ( = ?auto_964682 ?auto_964679 ) ) ( not ( = ?auto_964682 ?auto_964681 ) ) ( not ( = ?auto_964684 ?auto_964677 ) ) ( not ( = ?auto_964684 ?auto_964679 ) ) ( not ( = ?auto_964684 ?auto_964681 ) ) ( not ( = ?auto_964684 ?auto_964682 ) ) ( ON_BOARD ?auto_964686 ?auto_964687 ) ( SUPPORTS ?auto_964686 ?auto_964680 ) ( POINTING ?auto_964687 ?auto_964688 ) ( not ( = ?auto_964681 ?auto_964688 ) ) ( HAVE_IMAGE ?auto_964677 ?auto_964678 ) ( not ( = ?auto_964677 ?auto_964688 ) ) ( not ( = ?auto_964678 ?auto_964680 ) ) ( CALIBRATION_TARGET ?auto_964686 ?auto_964688 ) ( POWER_AVAIL ?auto_964687 ) ( HAVE_IMAGE ?auto_964679 ?auto_964676 ) ( HAVE_IMAGE ?auto_964682 ?auto_964683 ) ( HAVE_IMAGE ?auto_964684 ?auto_964685 ) ( not ( = ?auto_964678 ?auto_964676 ) ) ( not ( = ?auto_964678 ?auto_964683 ) ) ( not ( = ?auto_964678 ?auto_964685 ) ) ( not ( = ?auto_964679 ?auto_964688 ) ) ( not ( = ?auto_964676 ?auto_964680 ) ) ( not ( = ?auto_964676 ?auto_964683 ) ) ( not ( = ?auto_964676 ?auto_964685 ) ) ( not ( = ?auto_964680 ?auto_964683 ) ) ( not ( = ?auto_964680 ?auto_964685 ) ) ( not ( = ?auto_964682 ?auto_964688 ) ) ( not ( = ?auto_964683 ?auto_964685 ) ) ( not ( = ?auto_964684 ?auto_964688 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_964677 ?auto_964678 ?auto_964681 ?auto_964680 )
      ( GET-5IMAGE-VERIFY ?auto_964677 ?auto_964678 ?auto_964679 ?auto_964676 ?auto_964681 ?auto_964680 ?auto_964682 ?auto_964683 ?auto_964684 ?auto_964685 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_966874 - DIRECTION
      ?auto_966875 - MODE
      ?auto_966876 - DIRECTION
      ?auto_966873 - MODE
      ?auto_966878 - DIRECTION
      ?auto_966877 - MODE
      ?auto_966879 - DIRECTION
      ?auto_966880 - MODE
      ?auto_966881 - DIRECTION
      ?auto_966882 - MODE
    )
    :vars
    (
      ?auto_966883 - INSTRUMENT
      ?auto_966884 - SATELLITE
      ?auto_966885 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_966876 ?auto_966874 ) ) ( not ( = ?auto_966878 ?auto_966874 ) ) ( not ( = ?auto_966878 ?auto_966876 ) ) ( not ( = ?auto_966879 ?auto_966874 ) ) ( not ( = ?auto_966879 ?auto_966876 ) ) ( not ( = ?auto_966879 ?auto_966878 ) ) ( not ( = ?auto_966881 ?auto_966874 ) ) ( not ( = ?auto_966881 ?auto_966876 ) ) ( not ( = ?auto_966881 ?auto_966878 ) ) ( not ( = ?auto_966881 ?auto_966879 ) ) ( ON_BOARD ?auto_966883 ?auto_966884 ) ( SUPPORTS ?auto_966883 ?auto_966873 ) ( POINTING ?auto_966884 ?auto_966885 ) ( not ( = ?auto_966876 ?auto_966885 ) ) ( HAVE_IMAGE ?auto_966874 ?auto_966875 ) ( not ( = ?auto_966874 ?auto_966885 ) ) ( not ( = ?auto_966875 ?auto_966873 ) ) ( CALIBRATION_TARGET ?auto_966883 ?auto_966885 ) ( POWER_AVAIL ?auto_966884 ) ( HAVE_IMAGE ?auto_966878 ?auto_966877 ) ( HAVE_IMAGE ?auto_966879 ?auto_966880 ) ( HAVE_IMAGE ?auto_966881 ?auto_966882 ) ( not ( = ?auto_966875 ?auto_966877 ) ) ( not ( = ?auto_966875 ?auto_966880 ) ) ( not ( = ?auto_966875 ?auto_966882 ) ) ( not ( = ?auto_966873 ?auto_966877 ) ) ( not ( = ?auto_966873 ?auto_966880 ) ) ( not ( = ?auto_966873 ?auto_966882 ) ) ( not ( = ?auto_966878 ?auto_966885 ) ) ( not ( = ?auto_966877 ?auto_966880 ) ) ( not ( = ?auto_966877 ?auto_966882 ) ) ( not ( = ?auto_966879 ?auto_966885 ) ) ( not ( = ?auto_966880 ?auto_966882 ) ) ( not ( = ?auto_966881 ?auto_966885 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_966874 ?auto_966875 ?auto_966876 ?auto_966873 )
      ( GET-5IMAGE-VERIFY ?auto_966874 ?auto_966875 ?auto_966876 ?auto_966873 ?auto_966878 ?auto_966877 ?auto_966879 ?auto_966880 ?auto_966881 ?auto_966882 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_983709 - DIRECTION
      ?auto_983710 - MODE
      ?auto_983711 - DIRECTION
      ?auto_983708 - MODE
      ?auto_983713 - DIRECTION
      ?auto_983712 - MODE
      ?auto_983714 - DIRECTION
      ?auto_983715 - MODE
      ?auto_983716 - DIRECTION
      ?auto_983717 - MODE
    )
    :vars
    (
      ?auto_983718 - INSTRUMENT
      ?auto_983719 - SATELLITE
      ?auto_983720 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_983711 ?auto_983709 ) ) ( not ( = ?auto_983713 ?auto_983709 ) ) ( not ( = ?auto_983713 ?auto_983711 ) ) ( not ( = ?auto_983714 ?auto_983709 ) ) ( not ( = ?auto_983714 ?auto_983711 ) ) ( not ( = ?auto_983714 ?auto_983713 ) ) ( not ( = ?auto_983716 ?auto_983709 ) ) ( not ( = ?auto_983716 ?auto_983711 ) ) ( not ( = ?auto_983716 ?auto_983713 ) ) ( not ( = ?auto_983716 ?auto_983714 ) ) ( ON_BOARD ?auto_983718 ?auto_983719 ) ( SUPPORTS ?auto_983718 ?auto_983710 ) ( POINTING ?auto_983719 ?auto_983720 ) ( not ( = ?auto_983709 ?auto_983720 ) ) ( HAVE_IMAGE ?auto_983711 ?auto_983708 ) ( not ( = ?auto_983711 ?auto_983720 ) ) ( not ( = ?auto_983708 ?auto_983710 ) ) ( CALIBRATION_TARGET ?auto_983718 ?auto_983720 ) ( POWER_AVAIL ?auto_983719 ) ( HAVE_IMAGE ?auto_983713 ?auto_983712 ) ( HAVE_IMAGE ?auto_983714 ?auto_983715 ) ( HAVE_IMAGE ?auto_983716 ?auto_983717 ) ( not ( = ?auto_983710 ?auto_983712 ) ) ( not ( = ?auto_983710 ?auto_983715 ) ) ( not ( = ?auto_983710 ?auto_983717 ) ) ( not ( = ?auto_983708 ?auto_983712 ) ) ( not ( = ?auto_983708 ?auto_983715 ) ) ( not ( = ?auto_983708 ?auto_983717 ) ) ( not ( = ?auto_983713 ?auto_983720 ) ) ( not ( = ?auto_983712 ?auto_983715 ) ) ( not ( = ?auto_983712 ?auto_983717 ) ) ( not ( = ?auto_983714 ?auto_983720 ) ) ( not ( = ?auto_983715 ?auto_983717 ) ) ( not ( = ?auto_983716 ?auto_983720 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_983711 ?auto_983708 ?auto_983709 ?auto_983710 )
      ( GET-5IMAGE-VERIFY ?auto_983709 ?auto_983710 ?auto_983711 ?auto_983708 ?auto_983713 ?auto_983712 ?auto_983714 ?auto_983715 ?auto_983716 ?auto_983717 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_992509 - DIRECTION
      ?auto_992510 - MODE
      ?auto_992511 - DIRECTION
      ?auto_992508 - MODE
      ?auto_992513 - DIRECTION
      ?auto_992512 - MODE
      ?auto_992514 - DIRECTION
      ?auto_992515 - MODE
    )
    :vars
    (
      ?auto_992519 - INSTRUMENT
      ?auto_992517 - SATELLITE
      ?auto_992518 - DIRECTION
      ?auto_992516 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_992511 ?auto_992509 ) ) ( not ( = ?auto_992513 ?auto_992509 ) ) ( not ( = ?auto_992513 ?auto_992511 ) ) ( not ( = ?auto_992514 ?auto_992509 ) ) ( not ( = ?auto_992514 ?auto_992511 ) ) ( not ( = ?auto_992514 ?auto_992513 ) ) ( ON_BOARD ?auto_992519 ?auto_992517 ) ( SUPPORTS ?auto_992519 ?auto_992515 ) ( not ( = ?auto_992514 ?auto_992518 ) ) ( HAVE_IMAGE ?auto_992509 ?auto_992510 ) ( not ( = ?auto_992509 ?auto_992518 ) ) ( not ( = ?auto_992510 ?auto_992515 ) ) ( CALIBRATION_TARGET ?auto_992519 ?auto_992518 ) ( POWER_AVAIL ?auto_992517 ) ( POINTING ?auto_992517 ?auto_992516 ) ( not ( = ?auto_992518 ?auto_992516 ) ) ( not ( = ?auto_992514 ?auto_992516 ) ) ( not ( = ?auto_992509 ?auto_992516 ) ) ( HAVE_IMAGE ?auto_992511 ?auto_992508 ) ( HAVE_IMAGE ?auto_992513 ?auto_992512 ) ( not ( = ?auto_992510 ?auto_992508 ) ) ( not ( = ?auto_992510 ?auto_992512 ) ) ( not ( = ?auto_992511 ?auto_992518 ) ) ( not ( = ?auto_992511 ?auto_992516 ) ) ( not ( = ?auto_992508 ?auto_992512 ) ) ( not ( = ?auto_992508 ?auto_992515 ) ) ( not ( = ?auto_992513 ?auto_992518 ) ) ( not ( = ?auto_992513 ?auto_992516 ) ) ( not ( = ?auto_992512 ?auto_992515 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_992509 ?auto_992510 ?auto_992514 ?auto_992515 )
      ( GET-4IMAGE-VERIFY ?auto_992509 ?auto_992510 ?auto_992511 ?auto_992508 ?auto_992513 ?auto_992512 ?auto_992514 ?auto_992515 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_992556 - DIRECTION
      ?auto_992557 - MODE
      ?auto_992558 - DIRECTION
      ?auto_992555 - MODE
      ?auto_992560 - DIRECTION
      ?auto_992559 - MODE
      ?auto_992561 - DIRECTION
      ?auto_992562 - MODE
    )
    :vars
    (
      ?auto_992566 - INSTRUMENT
      ?auto_992564 - SATELLITE
      ?auto_992565 - DIRECTION
      ?auto_992563 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_992558 ?auto_992556 ) ) ( not ( = ?auto_992560 ?auto_992556 ) ) ( not ( = ?auto_992560 ?auto_992558 ) ) ( not ( = ?auto_992561 ?auto_992556 ) ) ( not ( = ?auto_992561 ?auto_992558 ) ) ( not ( = ?auto_992561 ?auto_992560 ) ) ( ON_BOARD ?auto_992566 ?auto_992564 ) ( SUPPORTS ?auto_992566 ?auto_992559 ) ( not ( = ?auto_992560 ?auto_992565 ) ) ( HAVE_IMAGE ?auto_992556 ?auto_992557 ) ( not ( = ?auto_992556 ?auto_992565 ) ) ( not ( = ?auto_992557 ?auto_992559 ) ) ( CALIBRATION_TARGET ?auto_992566 ?auto_992565 ) ( POWER_AVAIL ?auto_992564 ) ( POINTING ?auto_992564 ?auto_992563 ) ( not ( = ?auto_992565 ?auto_992563 ) ) ( not ( = ?auto_992560 ?auto_992563 ) ) ( not ( = ?auto_992556 ?auto_992563 ) ) ( HAVE_IMAGE ?auto_992558 ?auto_992555 ) ( HAVE_IMAGE ?auto_992561 ?auto_992562 ) ( not ( = ?auto_992557 ?auto_992555 ) ) ( not ( = ?auto_992557 ?auto_992562 ) ) ( not ( = ?auto_992558 ?auto_992565 ) ) ( not ( = ?auto_992558 ?auto_992563 ) ) ( not ( = ?auto_992555 ?auto_992559 ) ) ( not ( = ?auto_992555 ?auto_992562 ) ) ( not ( = ?auto_992559 ?auto_992562 ) ) ( not ( = ?auto_992561 ?auto_992565 ) ) ( not ( = ?auto_992561 ?auto_992563 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_992556 ?auto_992557 ?auto_992560 ?auto_992559 )
      ( GET-4IMAGE-VERIFY ?auto_992556 ?auto_992557 ?auto_992558 ?auto_992555 ?auto_992560 ?auto_992559 ?auto_992561 ?auto_992562 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_992859 - DIRECTION
      ?auto_992860 - MODE
      ?auto_992861 - DIRECTION
      ?auto_992858 - MODE
      ?auto_992863 - DIRECTION
      ?auto_992862 - MODE
      ?auto_992864 - DIRECTION
      ?auto_992865 - MODE
    )
    :vars
    (
      ?auto_992869 - INSTRUMENT
      ?auto_992867 - SATELLITE
      ?auto_992868 - DIRECTION
      ?auto_992866 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_992861 ?auto_992859 ) ) ( not ( = ?auto_992863 ?auto_992859 ) ) ( not ( = ?auto_992863 ?auto_992861 ) ) ( not ( = ?auto_992864 ?auto_992859 ) ) ( not ( = ?auto_992864 ?auto_992861 ) ) ( not ( = ?auto_992864 ?auto_992863 ) ) ( ON_BOARD ?auto_992869 ?auto_992867 ) ( SUPPORTS ?auto_992869 ?auto_992858 ) ( not ( = ?auto_992861 ?auto_992868 ) ) ( HAVE_IMAGE ?auto_992859 ?auto_992860 ) ( not ( = ?auto_992859 ?auto_992868 ) ) ( not ( = ?auto_992860 ?auto_992858 ) ) ( CALIBRATION_TARGET ?auto_992869 ?auto_992868 ) ( POWER_AVAIL ?auto_992867 ) ( POINTING ?auto_992867 ?auto_992866 ) ( not ( = ?auto_992868 ?auto_992866 ) ) ( not ( = ?auto_992861 ?auto_992866 ) ) ( not ( = ?auto_992859 ?auto_992866 ) ) ( HAVE_IMAGE ?auto_992863 ?auto_992862 ) ( HAVE_IMAGE ?auto_992864 ?auto_992865 ) ( not ( = ?auto_992860 ?auto_992862 ) ) ( not ( = ?auto_992860 ?auto_992865 ) ) ( not ( = ?auto_992858 ?auto_992862 ) ) ( not ( = ?auto_992858 ?auto_992865 ) ) ( not ( = ?auto_992863 ?auto_992868 ) ) ( not ( = ?auto_992863 ?auto_992866 ) ) ( not ( = ?auto_992862 ?auto_992865 ) ) ( not ( = ?auto_992864 ?auto_992868 ) ) ( not ( = ?auto_992864 ?auto_992866 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_992859 ?auto_992860 ?auto_992861 ?auto_992858 )
      ( GET-4IMAGE-VERIFY ?auto_992859 ?auto_992860 ?auto_992861 ?auto_992858 ?auto_992863 ?auto_992862 ?auto_992864 ?auto_992865 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_995248 - DIRECTION
      ?auto_995249 - MODE
      ?auto_995250 - DIRECTION
      ?auto_995247 - MODE
      ?auto_995252 - DIRECTION
      ?auto_995251 - MODE
      ?auto_995253 - DIRECTION
      ?auto_995254 - MODE
    )
    :vars
    (
      ?auto_995258 - INSTRUMENT
      ?auto_995256 - SATELLITE
      ?auto_995257 - DIRECTION
      ?auto_995255 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_995250 ?auto_995248 ) ) ( not ( = ?auto_995252 ?auto_995248 ) ) ( not ( = ?auto_995252 ?auto_995250 ) ) ( not ( = ?auto_995253 ?auto_995248 ) ) ( not ( = ?auto_995253 ?auto_995250 ) ) ( not ( = ?auto_995253 ?auto_995252 ) ) ( ON_BOARD ?auto_995258 ?auto_995256 ) ( SUPPORTS ?auto_995258 ?auto_995249 ) ( not ( = ?auto_995248 ?auto_995257 ) ) ( HAVE_IMAGE ?auto_995250 ?auto_995247 ) ( not ( = ?auto_995250 ?auto_995257 ) ) ( not ( = ?auto_995247 ?auto_995249 ) ) ( CALIBRATION_TARGET ?auto_995258 ?auto_995257 ) ( POWER_AVAIL ?auto_995256 ) ( POINTING ?auto_995256 ?auto_995255 ) ( not ( = ?auto_995257 ?auto_995255 ) ) ( not ( = ?auto_995248 ?auto_995255 ) ) ( not ( = ?auto_995250 ?auto_995255 ) ) ( HAVE_IMAGE ?auto_995252 ?auto_995251 ) ( HAVE_IMAGE ?auto_995253 ?auto_995254 ) ( not ( = ?auto_995249 ?auto_995251 ) ) ( not ( = ?auto_995249 ?auto_995254 ) ) ( not ( = ?auto_995247 ?auto_995251 ) ) ( not ( = ?auto_995247 ?auto_995254 ) ) ( not ( = ?auto_995252 ?auto_995257 ) ) ( not ( = ?auto_995252 ?auto_995255 ) ) ( not ( = ?auto_995251 ?auto_995254 ) ) ( not ( = ?auto_995253 ?auto_995257 ) ) ( not ( = ?auto_995253 ?auto_995255 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_995250 ?auto_995247 ?auto_995248 ?auto_995249 )
      ( GET-4IMAGE-VERIFY ?auto_995248 ?auto_995249 ?auto_995250 ?auto_995247 ?auto_995252 ?auto_995251 ?auto_995253 ?auto_995254 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_997775 - DIRECTION
      ?auto_997776 - MODE
      ?auto_997777 - DIRECTION
      ?auto_997774 - MODE
      ?auto_997779 - DIRECTION
      ?auto_997778 - MODE
      ?auto_997780 - DIRECTION
      ?auto_997781 - MODE
      ?auto_997782 - DIRECTION
      ?auto_997783 - MODE
    )
    :vars
    (
      ?auto_997786 - INSTRUMENT
      ?auto_997784 - SATELLITE
      ?auto_997785 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_997777 ?auto_997775 ) ) ( not ( = ?auto_997779 ?auto_997775 ) ) ( not ( = ?auto_997779 ?auto_997777 ) ) ( not ( = ?auto_997780 ?auto_997775 ) ) ( not ( = ?auto_997780 ?auto_997777 ) ) ( not ( = ?auto_997780 ?auto_997779 ) ) ( not ( = ?auto_997782 ?auto_997775 ) ) ( not ( = ?auto_997782 ?auto_997777 ) ) ( not ( = ?auto_997782 ?auto_997779 ) ) ( not ( = ?auto_997782 ?auto_997780 ) ) ( ON_BOARD ?auto_997786 ?auto_997784 ) ( SUPPORTS ?auto_997786 ?auto_997783 ) ( not ( = ?auto_997782 ?auto_997785 ) ) ( HAVE_IMAGE ?auto_997775 ?auto_997776 ) ( not ( = ?auto_997775 ?auto_997785 ) ) ( not ( = ?auto_997776 ?auto_997783 ) ) ( CALIBRATION_TARGET ?auto_997786 ?auto_997785 ) ( POWER_AVAIL ?auto_997784 ) ( POINTING ?auto_997784 ?auto_997780 ) ( not ( = ?auto_997785 ?auto_997780 ) ) ( HAVE_IMAGE ?auto_997777 ?auto_997774 ) ( HAVE_IMAGE ?auto_997779 ?auto_997778 ) ( HAVE_IMAGE ?auto_997780 ?auto_997781 ) ( not ( = ?auto_997776 ?auto_997774 ) ) ( not ( = ?auto_997776 ?auto_997778 ) ) ( not ( = ?auto_997776 ?auto_997781 ) ) ( not ( = ?auto_997777 ?auto_997785 ) ) ( not ( = ?auto_997774 ?auto_997778 ) ) ( not ( = ?auto_997774 ?auto_997781 ) ) ( not ( = ?auto_997774 ?auto_997783 ) ) ( not ( = ?auto_997779 ?auto_997785 ) ) ( not ( = ?auto_997778 ?auto_997781 ) ) ( not ( = ?auto_997778 ?auto_997783 ) ) ( not ( = ?auto_997781 ?auto_997783 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_997775 ?auto_997776 ?auto_997782 ?auto_997783 )
      ( GET-5IMAGE-VERIFY ?auto_997775 ?auto_997776 ?auto_997777 ?auto_997774 ?auto_997779 ?auto_997778 ?auto_997780 ?auto_997781 ?auto_997782 ?auto_997783 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_997830 - DIRECTION
      ?auto_997831 - MODE
      ?auto_997832 - DIRECTION
      ?auto_997829 - MODE
      ?auto_997834 - DIRECTION
      ?auto_997833 - MODE
      ?auto_997835 - DIRECTION
      ?auto_997836 - MODE
      ?auto_997837 - DIRECTION
      ?auto_997838 - MODE
    )
    :vars
    (
      ?auto_997841 - INSTRUMENT
      ?auto_997839 - SATELLITE
      ?auto_997840 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_997832 ?auto_997830 ) ) ( not ( = ?auto_997834 ?auto_997830 ) ) ( not ( = ?auto_997834 ?auto_997832 ) ) ( not ( = ?auto_997835 ?auto_997830 ) ) ( not ( = ?auto_997835 ?auto_997832 ) ) ( not ( = ?auto_997835 ?auto_997834 ) ) ( not ( = ?auto_997837 ?auto_997830 ) ) ( not ( = ?auto_997837 ?auto_997832 ) ) ( not ( = ?auto_997837 ?auto_997834 ) ) ( not ( = ?auto_997837 ?auto_997835 ) ) ( ON_BOARD ?auto_997841 ?auto_997839 ) ( SUPPORTS ?auto_997841 ?auto_997836 ) ( not ( = ?auto_997835 ?auto_997840 ) ) ( HAVE_IMAGE ?auto_997830 ?auto_997831 ) ( not ( = ?auto_997830 ?auto_997840 ) ) ( not ( = ?auto_997831 ?auto_997836 ) ) ( CALIBRATION_TARGET ?auto_997841 ?auto_997840 ) ( POWER_AVAIL ?auto_997839 ) ( POINTING ?auto_997839 ?auto_997837 ) ( not ( = ?auto_997840 ?auto_997837 ) ) ( HAVE_IMAGE ?auto_997832 ?auto_997829 ) ( HAVE_IMAGE ?auto_997834 ?auto_997833 ) ( HAVE_IMAGE ?auto_997837 ?auto_997838 ) ( not ( = ?auto_997831 ?auto_997829 ) ) ( not ( = ?auto_997831 ?auto_997833 ) ) ( not ( = ?auto_997831 ?auto_997838 ) ) ( not ( = ?auto_997832 ?auto_997840 ) ) ( not ( = ?auto_997829 ?auto_997833 ) ) ( not ( = ?auto_997829 ?auto_997836 ) ) ( not ( = ?auto_997829 ?auto_997838 ) ) ( not ( = ?auto_997834 ?auto_997840 ) ) ( not ( = ?auto_997833 ?auto_997836 ) ) ( not ( = ?auto_997833 ?auto_997838 ) ) ( not ( = ?auto_997836 ?auto_997838 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_997830 ?auto_997831 ?auto_997835 ?auto_997836 )
      ( GET-5IMAGE-VERIFY ?auto_997830 ?auto_997831 ?auto_997832 ?auto_997829 ?auto_997834 ?auto_997833 ?auto_997835 ?auto_997836 ?auto_997837 ?auto_997838 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_997883 - DIRECTION
      ?auto_997884 - MODE
      ?auto_997885 - DIRECTION
      ?auto_997882 - MODE
      ?auto_997887 - DIRECTION
      ?auto_997886 - MODE
      ?auto_997888 - DIRECTION
      ?auto_997889 - MODE
      ?auto_997890 - DIRECTION
      ?auto_997891 - MODE
    )
    :vars
    (
      ?auto_997894 - INSTRUMENT
      ?auto_997892 - SATELLITE
      ?auto_997893 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_997885 ?auto_997883 ) ) ( not ( = ?auto_997887 ?auto_997883 ) ) ( not ( = ?auto_997887 ?auto_997885 ) ) ( not ( = ?auto_997888 ?auto_997883 ) ) ( not ( = ?auto_997888 ?auto_997885 ) ) ( not ( = ?auto_997888 ?auto_997887 ) ) ( not ( = ?auto_997890 ?auto_997883 ) ) ( not ( = ?auto_997890 ?auto_997885 ) ) ( not ( = ?auto_997890 ?auto_997887 ) ) ( not ( = ?auto_997890 ?auto_997888 ) ) ( ON_BOARD ?auto_997894 ?auto_997892 ) ( SUPPORTS ?auto_997894 ?auto_997891 ) ( not ( = ?auto_997890 ?auto_997893 ) ) ( HAVE_IMAGE ?auto_997883 ?auto_997884 ) ( not ( = ?auto_997883 ?auto_997893 ) ) ( not ( = ?auto_997884 ?auto_997891 ) ) ( CALIBRATION_TARGET ?auto_997894 ?auto_997893 ) ( POWER_AVAIL ?auto_997892 ) ( POINTING ?auto_997892 ?auto_997887 ) ( not ( = ?auto_997893 ?auto_997887 ) ) ( HAVE_IMAGE ?auto_997885 ?auto_997882 ) ( HAVE_IMAGE ?auto_997887 ?auto_997886 ) ( HAVE_IMAGE ?auto_997888 ?auto_997889 ) ( not ( = ?auto_997884 ?auto_997882 ) ) ( not ( = ?auto_997884 ?auto_997886 ) ) ( not ( = ?auto_997884 ?auto_997889 ) ) ( not ( = ?auto_997885 ?auto_997893 ) ) ( not ( = ?auto_997882 ?auto_997886 ) ) ( not ( = ?auto_997882 ?auto_997889 ) ) ( not ( = ?auto_997882 ?auto_997891 ) ) ( not ( = ?auto_997886 ?auto_997889 ) ) ( not ( = ?auto_997886 ?auto_997891 ) ) ( not ( = ?auto_997888 ?auto_997893 ) ) ( not ( = ?auto_997889 ?auto_997891 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_997883 ?auto_997884 ?auto_997890 ?auto_997891 )
      ( GET-5IMAGE-VERIFY ?auto_997883 ?auto_997884 ?auto_997885 ?auto_997882 ?auto_997887 ?auto_997886 ?auto_997888 ?auto_997889 ?auto_997890 ?auto_997891 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_997935 - DIRECTION
      ?auto_997936 - MODE
      ?auto_997937 - DIRECTION
      ?auto_997934 - MODE
      ?auto_997939 - DIRECTION
      ?auto_997938 - MODE
      ?auto_997940 - DIRECTION
      ?auto_997941 - MODE
      ?auto_997942 - DIRECTION
      ?auto_997943 - MODE
    )
    :vars
    (
      ?auto_997946 - INSTRUMENT
      ?auto_997944 - SATELLITE
      ?auto_997945 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_997937 ?auto_997935 ) ) ( not ( = ?auto_997939 ?auto_997935 ) ) ( not ( = ?auto_997939 ?auto_997937 ) ) ( not ( = ?auto_997940 ?auto_997935 ) ) ( not ( = ?auto_997940 ?auto_997937 ) ) ( not ( = ?auto_997940 ?auto_997939 ) ) ( not ( = ?auto_997942 ?auto_997935 ) ) ( not ( = ?auto_997942 ?auto_997937 ) ) ( not ( = ?auto_997942 ?auto_997939 ) ) ( not ( = ?auto_997942 ?auto_997940 ) ) ( ON_BOARD ?auto_997946 ?auto_997944 ) ( SUPPORTS ?auto_997946 ?auto_997941 ) ( not ( = ?auto_997940 ?auto_997945 ) ) ( HAVE_IMAGE ?auto_997935 ?auto_997936 ) ( not ( = ?auto_997935 ?auto_997945 ) ) ( not ( = ?auto_997936 ?auto_997941 ) ) ( CALIBRATION_TARGET ?auto_997946 ?auto_997945 ) ( POWER_AVAIL ?auto_997944 ) ( POINTING ?auto_997944 ?auto_997939 ) ( not ( = ?auto_997945 ?auto_997939 ) ) ( HAVE_IMAGE ?auto_997937 ?auto_997934 ) ( HAVE_IMAGE ?auto_997939 ?auto_997938 ) ( HAVE_IMAGE ?auto_997942 ?auto_997943 ) ( not ( = ?auto_997936 ?auto_997934 ) ) ( not ( = ?auto_997936 ?auto_997938 ) ) ( not ( = ?auto_997936 ?auto_997943 ) ) ( not ( = ?auto_997937 ?auto_997945 ) ) ( not ( = ?auto_997934 ?auto_997938 ) ) ( not ( = ?auto_997934 ?auto_997941 ) ) ( not ( = ?auto_997934 ?auto_997943 ) ) ( not ( = ?auto_997938 ?auto_997941 ) ) ( not ( = ?auto_997938 ?auto_997943 ) ) ( not ( = ?auto_997941 ?auto_997943 ) ) ( not ( = ?auto_997942 ?auto_997945 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_997935 ?auto_997936 ?auto_997940 ?auto_997941 )
      ( GET-5IMAGE-VERIFY ?auto_997935 ?auto_997936 ?auto_997937 ?auto_997934 ?auto_997939 ?auto_997938 ?auto_997940 ?auto_997941 ?auto_997942 ?auto_997943 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_998154 - DIRECTION
      ?auto_998155 - MODE
      ?auto_998156 - DIRECTION
      ?auto_998153 - MODE
      ?auto_998158 - DIRECTION
      ?auto_998157 - MODE
      ?auto_998159 - DIRECTION
      ?auto_998160 - MODE
      ?auto_998161 - DIRECTION
      ?auto_998162 - MODE
    )
    :vars
    (
      ?auto_998165 - INSTRUMENT
      ?auto_998163 - SATELLITE
      ?auto_998164 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_998156 ?auto_998154 ) ) ( not ( = ?auto_998158 ?auto_998154 ) ) ( not ( = ?auto_998158 ?auto_998156 ) ) ( not ( = ?auto_998159 ?auto_998154 ) ) ( not ( = ?auto_998159 ?auto_998156 ) ) ( not ( = ?auto_998159 ?auto_998158 ) ) ( not ( = ?auto_998161 ?auto_998154 ) ) ( not ( = ?auto_998161 ?auto_998156 ) ) ( not ( = ?auto_998161 ?auto_998158 ) ) ( not ( = ?auto_998161 ?auto_998159 ) ) ( ON_BOARD ?auto_998165 ?auto_998163 ) ( SUPPORTS ?auto_998165 ?auto_998157 ) ( not ( = ?auto_998158 ?auto_998164 ) ) ( HAVE_IMAGE ?auto_998154 ?auto_998155 ) ( not ( = ?auto_998154 ?auto_998164 ) ) ( not ( = ?auto_998155 ?auto_998157 ) ) ( CALIBRATION_TARGET ?auto_998165 ?auto_998164 ) ( POWER_AVAIL ?auto_998163 ) ( POINTING ?auto_998163 ?auto_998161 ) ( not ( = ?auto_998164 ?auto_998161 ) ) ( HAVE_IMAGE ?auto_998156 ?auto_998153 ) ( HAVE_IMAGE ?auto_998159 ?auto_998160 ) ( HAVE_IMAGE ?auto_998161 ?auto_998162 ) ( not ( = ?auto_998155 ?auto_998153 ) ) ( not ( = ?auto_998155 ?auto_998160 ) ) ( not ( = ?auto_998155 ?auto_998162 ) ) ( not ( = ?auto_998156 ?auto_998164 ) ) ( not ( = ?auto_998153 ?auto_998157 ) ) ( not ( = ?auto_998153 ?auto_998160 ) ) ( not ( = ?auto_998153 ?auto_998162 ) ) ( not ( = ?auto_998157 ?auto_998160 ) ) ( not ( = ?auto_998157 ?auto_998162 ) ) ( not ( = ?auto_998159 ?auto_998164 ) ) ( not ( = ?auto_998160 ?auto_998162 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_998154 ?auto_998155 ?auto_998158 ?auto_998157 )
      ( GET-5IMAGE-VERIFY ?auto_998154 ?auto_998155 ?auto_998156 ?auto_998153 ?auto_998158 ?auto_998157 ?auto_998159 ?auto_998160 ?auto_998161 ?auto_998162 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_998207 - DIRECTION
      ?auto_998208 - MODE
      ?auto_998209 - DIRECTION
      ?auto_998206 - MODE
      ?auto_998211 - DIRECTION
      ?auto_998210 - MODE
      ?auto_998212 - DIRECTION
      ?auto_998213 - MODE
      ?auto_998214 - DIRECTION
      ?auto_998215 - MODE
    )
    :vars
    (
      ?auto_998218 - INSTRUMENT
      ?auto_998216 - SATELLITE
      ?auto_998217 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_998209 ?auto_998207 ) ) ( not ( = ?auto_998211 ?auto_998207 ) ) ( not ( = ?auto_998211 ?auto_998209 ) ) ( not ( = ?auto_998212 ?auto_998207 ) ) ( not ( = ?auto_998212 ?auto_998209 ) ) ( not ( = ?auto_998212 ?auto_998211 ) ) ( not ( = ?auto_998214 ?auto_998207 ) ) ( not ( = ?auto_998214 ?auto_998209 ) ) ( not ( = ?auto_998214 ?auto_998211 ) ) ( not ( = ?auto_998214 ?auto_998212 ) ) ( ON_BOARD ?auto_998218 ?auto_998216 ) ( SUPPORTS ?auto_998218 ?auto_998210 ) ( not ( = ?auto_998211 ?auto_998217 ) ) ( HAVE_IMAGE ?auto_998207 ?auto_998208 ) ( not ( = ?auto_998207 ?auto_998217 ) ) ( not ( = ?auto_998208 ?auto_998210 ) ) ( CALIBRATION_TARGET ?auto_998218 ?auto_998217 ) ( POWER_AVAIL ?auto_998216 ) ( POINTING ?auto_998216 ?auto_998212 ) ( not ( = ?auto_998217 ?auto_998212 ) ) ( HAVE_IMAGE ?auto_998209 ?auto_998206 ) ( HAVE_IMAGE ?auto_998212 ?auto_998213 ) ( HAVE_IMAGE ?auto_998214 ?auto_998215 ) ( not ( = ?auto_998208 ?auto_998206 ) ) ( not ( = ?auto_998208 ?auto_998213 ) ) ( not ( = ?auto_998208 ?auto_998215 ) ) ( not ( = ?auto_998209 ?auto_998217 ) ) ( not ( = ?auto_998206 ?auto_998210 ) ) ( not ( = ?auto_998206 ?auto_998213 ) ) ( not ( = ?auto_998206 ?auto_998215 ) ) ( not ( = ?auto_998210 ?auto_998213 ) ) ( not ( = ?auto_998210 ?auto_998215 ) ) ( not ( = ?auto_998213 ?auto_998215 ) ) ( not ( = ?auto_998214 ?auto_998217 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_998207 ?auto_998208 ?auto_998211 ?auto_998210 )
      ( GET-5IMAGE-VERIFY ?auto_998207 ?auto_998208 ?auto_998209 ?auto_998206 ?auto_998211 ?auto_998210 ?auto_998212 ?auto_998213 ?auto_998214 ?auto_998215 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_999270 - DIRECTION
      ?auto_999271 - MODE
      ?auto_999272 - DIRECTION
      ?auto_999269 - MODE
      ?auto_999274 - DIRECTION
      ?auto_999273 - MODE
      ?auto_999275 - DIRECTION
      ?auto_999276 - MODE
      ?auto_999277 - DIRECTION
      ?auto_999278 - MODE
    )
    :vars
    (
      ?auto_999281 - INSTRUMENT
      ?auto_999279 - SATELLITE
      ?auto_999280 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_999272 ?auto_999270 ) ) ( not ( = ?auto_999274 ?auto_999270 ) ) ( not ( = ?auto_999274 ?auto_999272 ) ) ( not ( = ?auto_999275 ?auto_999270 ) ) ( not ( = ?auto_999275 ?auto_999272 ) ) ( not ( = ?auto_999275 ?auto_999274 ) ) ( not ( = ?auto_999277 ?auto_999270 ) ) ( not ( = ?auto_999277 ?auto_999272 ) ) ( not ( = ?auto_999277 ?auto_999274 ) ) ( not ( = ?auto_999277 ?auto_999275 ) ) ( ON_BOARD ?auto_999281 ?auto_999279 ) ( SUPPORTS ?auto_999281 ?auto_999278 ) ( not ( = ?auto_999277 ?auto_999280 ) ) ( HAVE_IMAGE ?auto_999270 ?auto_999271 ) ( not ( = ?auto_999270 ?auto_999280 ) ) ( not ( = ?auto_999271 ?auto_999278 ) ) ( CALIBRATION_TARGET ?auto_999281 ?auto_999280 ) ( POWER_AVAIL ?auto_999279 ) ( POINTING ?auto_999279 ?auto_999272 ) ( not ( = ?auto_999280 ?auto_999272 ) ) ( HAVE_IMAGE ?auto_999272 ?auto_999269 ) ( HAVE_IMAGE ?auto_999274 ?auto_999273 ) ( HAVE_IMAGE ?auto_999275 ?auto_999276 ) ( not ( = ?auto_999271 ?auto_999269 ) ) ( not ( = ?auto_999271 ?auto_999273 ) ) ( not ( = ?auto_999271 ?auto_999276 ) ) ( not ( = ?auto_999269 ?auto_999273 ) ) ( not ( = ?auto_999269 ?auto_999276 ) ) ( not ( = ?auto_999269 ?auto_999278 ) ) ( not ( = ?auto_999274 ?auto_999280 ) ) ( not ( = ?auto_999273 ?auto_999276 ) ) ( not ( = ?auto_999273 ?auto_999278 ) ) ( not ( = ?auto_999275 ?auto_999280 ) ) ( not ( = ?auto_999276 ?auto_999278 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_999270 ?auto_999271 ?auto_999277 ?auto_999278 )
      ( GET-5IMAGE-VERIFY ?auto_999270 ?auto_999271 ?auto_999272 ?auto_999269 ?auto_999274 ?auto_999273 ?auto_999275 ?auto_999276 ?auto_999277 ?auto_999278 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_999322 - DIRECTION
      ?auto_999323 - MODE
      ?auto_999324 - DIRECTION
      ?auto_999321 - MODE
      ?auto_999326 - DIRECTION
      ?auto_999325 - MODE
      ?auto_999327 - DIRECTION
      ?auto_999328 - MODE
      ?auto_999329 - DIRECTION
      ?auto_999330 - MODE
    )
    :vars
    (
      ?auto_999333 - INSTRUMENT
      ?auto_999331 - SATELLITE
      ?auto_999332 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_999324 ?auto_999322 ) ) ( not ( = ?auto_999326 ?auto_999322 ) ) ( not ( = ?auto_999326 ?auto_999324 ) ) ( not ( = ?auto_999327 ?auto_999322 ) ) ( not ( = ?auto_999327 ?auto_999324 ) ) ( not ( = ?auto_999327 ?auto_999326 ) ) ( not ( = ?auto_999329 ?auto_999322 ) ) ( not ( = ?auto_999329 ?auto_999324 ) ) ( not ( = ?auto_999329 ?auto_999326 ) ) ( not ( = ?auto_999329 ?auto_999327 ) ) ( ON_BOARD ?auto_999333 ?auto_999331 ) ( SUPPORTS ?auto_999333 ?auto_999328 ) ( not ( = ?auto_999327 ?auto_999332 ) ) ( HAVE_IMAGE ?auto_999322 ?auto_999323 ) ( not ( = ?auto_999322 ?auto_999332 ) ) ( not ( = ?auto_999323 ?auto_999328 ) ) ( CALIBRATION_TARGET ?auto_999333 ?auto_999332 ) ( POWER_AVAIL ?auto_999331 ) ( POINTING ?auto_999331 ?auto_999324 ) ( not ( = ?auto_999332 ?auto_999324 ) ) ( HAVE_IMAGE ?auto_999324 ?auto_999321 ) ( HAVE_IMAGE ?auto_999326 ?auto_999325 ) ( HAVE_IMAGE ?auto_999329 ?auto_999330 ) ( not ( = ?auto_999323 ?auto_999321 ) ) ( not ( = ?auto_999323 ?auto_999325 ) ) ( not ( = ?auto_999323 ?auto_999330 ) ) ( not ( = ?auto_999321 ?auto_999325 ) ) ( not ( = ?auto_999321 ?auto_999328 ) ) ( not ( = ?auto_999321 ?auto_999330 ) ) ( not ( = ?auto_999326 ?auto_999332 ) ) ( not ( = ?auto_999325 ?auto_999328 ) ) ( not ( = ?auto_999325 ?auto_999330 ) ) ( not ( = ?auto_999328 ?auto_999330 ) ) ( not ( = ?auto_999329 ?auto_999332 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_999322 ?auto_999323 ?auto_999327 ?auto_999328 )
      ( GET-5IMAGE-VERIFY ?auto_999322 ?auto_999323 ?auto_999324 ?auto_999321 ?auto_999326 ?auto_999325 ?auto_999327 ?auto_999328 ?auto_999329 ?auto_999330 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_999680 - DIRECTION
      ?auto_999681 - MODE
      ?auto_999682 - DIRECTION
      ?auto_999679 - MODE
      ?auto_999684 - DIRECTION
      ?auto_999683 - MODE
      ?auto_999685 - DIRECTION
      ?auto_999686 - MODE
      ?auto_999687 - DIRECTION
      ?auto_999688 - MODE
    )
    :vars
    (
      ?auto_999691 - INSTRUMENT
      ?auto_999689 - SATELLITE
      ?auto_999690 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_999682 ?auto_999680 ) ) ( not ( = ?auto_999684 ?auto_999680 ) ) ( not ( = ?auto_999684 ?auto_999682 ) ) ( not ( = ?auto_999685 ?auto_999680 ) ) ( not ( = ?auto_999685 ?auto_999682 ) ) ( not ( = ?auto_999685 ?auto_999684 ) ) ( not ( = ?auto_999687 ?auto_999680 ) ) ( not ( = ?auto_999687 ?auto_999682 ) ) ( not ( = ?auto_999687 ?auto_999684 ) ) ( not ( = ?auto_999687 ?auto_999685 ) ) ( ON_BOARD ?auto_999691 ?auto_999689 ) ( SUPPORTS ?auto_999691 ?auto_999683 ) ( not ( = ?auto_999684 ?auto_999690 ) ) ( HAVE_IMAGE ?auto_999680 ?auto_999681 ) ( not ( = ?auto_999680 ?auto_999690 ) ) ( not ( = ?auto_999681 ?auto_999683 ) ) ( CALIBRATION_TARGET ?auto_999691 ?auto_999690 ) ( POWER_AVAIL ?auto_999689 ) ( POINTING ?auto_999689 ?auto_999682 ) ( not ( = ?auto_999690 ?auto_999682 ) ) ( HAVE_IMAGE ?auto_999682 ?auto_999679 ) ( HAVE_IMAGE ?auto_999685 ?auto_999686 ) ( HAVE_IMAGE ?auto_999687 ?auto_999688 ) ( not ( = ?auto_999681 ?auto_999679 ) ) ( not ( = ?auto_999681 ?auto_999686 ) ) ( not ( = ?auto_999681 ?auto_999688 ) ) ( not ( = ?auto_999679 ?auto_999683 ) ) ( not ( = ?auto_999679 ?auto_999686 ) ) ( not ( = ?auto_999679 ?auto_999688 ) ) ( not ( = ?auto_999683 ?auto_999686 ) ) ( not ( = ?auto_999683 ?auto_999688 ) ) ( not ( = ?auto_999685 ?auto_999690 ) ) ( not ( = ?auto_999686 ?auto_999688 ) ) ( not ( = ?auto_999687 ?auto_999690 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_999680 ?auto_999681 ?auto_999684 ?auto_999683 )
      ( GET-5IMAGE-VERIFY ?auto_999680 ?auto_999681 ?auto_999682 ?auto_999679 ?auto_999684 ?auto_999683 ?auto_999685 ?auto_999686 ?auto_999687 ?auto_999688 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1000432 - DIRECTION
      ?auto_1000433 - MODE
      ?auto_1000434 - DIRECTION
      ?auto_1000431 - MODE
      ?auto_1000436 - DIRECTION
      ?auto_1000435 - MODE
      ?auto_1000437 - DIRECTION
      ?auto_1000438 - MODE
      ?auto_1000439 - DIRECTION
      ?auto_1000440 - MODE
    )
    :vars
    (
      ?auto_1000443 - INSTRUMENT
      ?auto_1000441 - SATELLITE
      ?auto_1000442 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1000434 ?auto_1000432 ) ) ( not ( = ?auto_1000436 ?auto_1000432 ) ) ( not ( = ?auto_1000436 ?auto_1000434 ) ) ( not ( = ?auto_1000437 ?auto_1000432 ) ) ( not ( = ?auto_1000437 ?auto_1000434 ) ) ( not ( = ?auto_1000437 ?auto_1000436 ) ) ( not ( = ?auto_1000439 ?auto_1000432 ) ) ( not ( = ?auto_1000439 ?auto_1000434 ) ) ( not ( = ?auto_1000439 ?auto_1000436 ) ) ( not ( = ?auto_1000439 ?auto_1000437 ) ) ( ON_BOARD ?auto_1000443 ?auto_1000441 ) ( SUPPORTS ?auto_1000443 ?auto_1000431 ) ( not ( = ?auto_1000434 ?auto_1000442 ) ) ( HAVE_IMAGE ?auto_1000432 ?auto_1000433 ) ( not ( = ?auto_1000432 ?auto_1000442 ) ) ( not ( = ?auto_1000433 ?auto_1000431 ) ) ( CALIBRATION_TARGET ?auto_1000443 ?auto_1000442 ) ( POWER_AVAIL ?auto_1000441 ) ( POINTING ?auto_1000441 ?auto_1000439 ) ( not ( = ?auto_1000442 ?auto_1000439 ) ) ( HAVE_IMAGE ?auto_1000436 ?auto_1000435 ) ( HAVE_IMAGE ?auto_1000437 ?auto_1000438 ) ( HAVE_IMAGE ?auto_1000439 ?auto_1000440 ) ( not ( = ?auto_1000433 ?auto_1000435 ) ) ( not ( = ?auto_1000433 ?auto_1000438 ) ) ( not ( = ?auto_1000433 ?auto_1000440 ) ) ( not ( = ?auto_1000431 ?auto_1000435 ) ) ( not ( = ?auto_1000431 ?auto_1000438 ) ) ( not ( = ?auto_1000431 ?auto_1000440 ) ) ( not ( = ?auto_1000436 ?auto_1000442 ) ) ( not ( = ?auto_1000435 ?auto_1000438 ) ) ( not ( = ?auto_1000435 ?auto_1000440 ) ) ( not ( = ?auto_1000437 ?auto_1000442 ) ) ( not ( = ?auto_1000438 ?auto_1000440 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1000432 ?auto_1000433 ?auto_1000434 ?auto_1000431 )
      ( GET-5IMAGE-VERIFY ?auto_1000432 ?auto_1000433 ?auto_1000434 ?auto_1000431 ?auto_1000436 ?auto_1000435 ?auto_1000437 ?auto_1000438 ?auto_1000439 ?auto_1000440 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1000485 - DIRECTION
      ?auto_1000486 - MODE
      ?auto_1000487 - DIRECTION
      ?auto_1000484 - MODE
      ?auto_1000489 - DIRECTION
      ?auto_1000488 - MODE
      ?auto_1000490 - DIRECTION
      ?auto_1000491 - MODE
      ?auto_1000492 - DIRECTION
      ?auto_1000493 - MODE
    )
    :vars
    (
      ?auto_1000496 - INSTRUMENT
      ?auto_1000494 - SATELLITE
      ?auto_1000495 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1000487 ?auto_1000485 ) ) ( not ( = ?auto_1000489 ?auto_1000485 ) ) ( not ( = ?auto_1000489 ?auto_1000487 ) ) ( not ( = ?auto_1000490 ?auto_1000485 ) ) ( not ( = ?auto_1000490 ?auto_1000487 ) ) ( not ( = ?auto_1000490 ?auto_1000489 ) ) ( not ( = ?auto_1000492 ?auto_1000485 ) ) ( not ( = ?auto_1000492 ?auto_1000487 ) ) ( not ( = ?auto_1000492 ?auto_1000489 ) ) ( not ( = ?auto_1000492 ?auto_1000490 ) ) ( ON_BOARD ?auto_1000496 ?auto_1000494 ) ( SUPPORTS ?auto_1000496 ?auto_1000484 ) ( not ( = ?auto_1000487 ?auto_1000495 ) ) ( HAVE_IMAGE ?auto_1000485 ?auto_1000486 ) ( not ( = ?auto_1000485 ?auto_1000495 ) ) ( not ( = ?auto_1000486 ?auto_1000484 ) ) ( CALIBRATION_TARGET ?auto_1000496 ?auto_1000495 ) ( POWER_AVAIL ?auto_1000494 ) ( POINTING ?auto_1000494 ?auto_1000490 ) ( not ( = ?auto_1000495 ?auto_1000490 ) ) ( HAVE_IMAGE ?auto_1000489 ?auto_1000488 ) ( HAVE_IMAGE ?auto_1000490 ?auto_1000491 ) ( HAVE_IMAGE ?auto_1000492 ?auto_1000493 ) ( not ( = ?auto_1000486 ?auto_1000488 ) ) ( not ( = ?auto_1000486 ?auto_1000491 ) ) ( not ( = ?auto_1000486 ?auto_1000493 ) ) ( not ( = ?auto_1000484 ?auto_1000488 ) ) ( not ( = ?auto_1000484 ?auto_1000491 ) ) ( not ( = ?auto_1000484 ?auto_1000493 ) ) ( not ( = ?auto_1000489 ?auto_1000495 ) ) ( not ( = ?auto_1000488 ?auto_1000491 ) ) ( not ( = ?auto_1000488 ?auto_1000493 ) ) ( not ( = ?auto_1000491 ?auto_1000493 ) ) ( not ( = ?auto_1000492 ?auto_1000495 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1000485 ?auto_1000486 ?auto_1000487 ?auto_1000484 )
      ( GET-5IMAGE-VERIFY ?auto_1000485 ?auto_1000486 ?auto_1000487 ?auto_1000484 ?auto_1000489 ?auto_1000488 ?auto_1000490 ?auto_1000491 ?auto_1000492 ?auto_1000493 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1001019 - DIRECTION
      ?auto_1001020 - MODE
      ?auto_1001021 - DIRECTION
      ?auto_1001018 - MODE
      ?auto_1001023 - DIRECTION
      ?auto_1001022 - MODE
      ?auto_1001024 - DIRECTION
      ?auto_1001025 - MODE
      ?auto_1001026 - DIRECTION
      ?auto_1001027 - MODE
    )
    :vars
    (
      ?auto_1001030 - INSTRUMENT
      ?auto_1001028 - SATELLITE
      ?auto_1001029 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1001021 ?auto_1001019 ) ) ( not ( = ?auto_1001023 ?auto_1001019 ) ) ( not ( = ?auto_1001023 ?auto_1001021 ) ) ( not ( = ?auto_1001024 ?auto_1001019 ) ) ( not ( = ?auto_1001024 ?auto_1001021 ) ) ( not ( = ?auto_1001024 ?auto_1001023 ) ) ( not ( = ?auto_1001026 ?auto_1001019 ) ) ( not ( = ?auto_1001026 ?auto_1001021 ) ) ( not ( = ?auto_1001026 ?auto_1001023 ) ) ( not ( = ?auto_1001026 ?auto_1001024 ) ) ( ON_BOARD ?auto_1001030 ?auto_1001028 ) ( SUPPORTS ?auto_1001030 ?auto_1001018 ) ( not ( = ?auto_1001021 ?auto_1001029 ) ) ( HAVE_IMAGE ?auto_1001019 ?auto_1001020 ) ( not ( = ?auto_1001019 ?auto_1001029 ) ) ( not ( = ?auto_1001020 ?auto_1001018 ) ) ( CALIBRATION_TARGET ?auto_1001030 ?auto_1001029 ) ( POWER_AVAIL ?auto_1001028 ) ( POINTING ?auto_1001028 ?auto_1001023 ) ( not ( = ?auto_1001029 ?auto_1001023 ) ) ( HAVE_IMAGE ?auto_1001023 ?auto_1001022 ) ( HAVE_IMAGE ?auto_1001024 ?auto_1001025 ) ( HAVE_IMAGE ?auto_1001026 ?auto_1001027 ) ( not ( = ?auto_1001020 ?auto_1001022 ) ) ( not ( = ?auto_1001020 ?auto_1001025 ) ) ( not ( = ?auto_1001020 ?auto_1001027 ) ) ( not ( = ?auto_1001018 ?auto_1001022 ) ) ( not ( = ?auto_1001018 ?auto_1001025 ) ) ( not ( = ?auto_1001018 ?auto_1001027 ) ) ( not ( = ?auto_1001022 ?auto_1001025 ) ) ( not ( = ?auto_1001022 ?auto_1001027 ) ) ( not ( = ?auto_1001024 ?auto_1001029 ) ) ( not ( = ?auto_1001025 ?auto_1001027 ) ) ( not ( = ?auto_1001026 ?auto_1001029 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1001019 ?auto_1001020 ?auto_1001021 ?auto_1001018 )
      ( GET-5IMAGE-VERIFY ?auto_1001019 ?auto_1001020 ?auto_1001021 ?auto_1001018 ?auto_1001023 ?auto_1001022 ?auto_1001024 ?auto_1001025 ?auto_1001026 ?auto_1001027 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1012234 - DIRECTION
      ?auto_1012235 - MODE
      ?auto_1012236 - DIRECTION
      ?auto_1012233 - MODE
      ?auto_1012238 - DIRECTION
      ?auto_1012237 - MODE
      ?auto_1012239 - DIRECTION
      ?auto_1012240 - MODE
      ?auto_1012241 - DIRECTION
      ?auto_1012242 - MODE
    )
    :vars
    (
      ?auto_1012245 - INSTRUMENT
      ?auto_1012243 - SATELLITE
      ?auto_1012244 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1012236 ?auto_1012234 ) ) ( not ( = ?auto_1012238 ?auto_1012234 ) ) ( not ( = ?auto_1012238 ?auto_1012236 ) ) ( not ( = ?auto_1012239 ?auto_1012234 ) ) ( not ( = ?auto_1012239 ?auto_1012236 ) ) ( not ( = ?auto_1012239 ?auto_1012238 ) ) ( not ( = ?auto_1012241 ?auto_1012234 ) ) ( not ( = ?auto_1012241 ?auto_1012236 ) ) ( not ( = ?auto_1012241 ?auto_1012238 ) ) ( not ( = ?auto_1012241 ?auto_1012239 ) ) ( ON_BOARD ?auto_1012245 ?auto_1012243 ) ( SUPPORTS ?auto_1012245 ?auto_1012242 ) ( not ( = ?auto_1012241 ?auto_1012244 ) ) ( HAVE_IMAGE ?auto_1012236 ?auto_1012233 ) ( not ( = ?auto_1012236 ?auto_1012244 ) ) ( not ( = ?auto_1012233 ?auto_1012242 ) ) ( CALIBRATION_TARGET ?auto_1012245 ?auto_1012244 ) ( POWER_AVAIL ?auto_1012243 ) ( POINTING ?auto_1012243 ?auto_1012234 ) ( not ( = ?auto_1012244 ?auto_1012234 ) ) ( HAVE_IMAGE ?auto_1012234 ?auto_1012235 ) ( HAVE_IMAGE ?auto_1012238 ?auto_1012237 ) ( HAVE_IMAGE ?auto_1012239 ?auto_1012240 ) ( not ( = ?auto_1012235 ?auto_1012233 ) ) ( not ( = ?auto_1012235 ?auto_1012237 ) ) ( not ( = ?auto_1012235 ?auto_1012240 ) ) ( not ( = ?auto_1012235 ?auto_1012242 ) ) ( not ( = ?auto_1012233 ?auto_1012237 ) ) ( not ( = ?auto_1012233 ?auto_1012240 ) ) ( not ( = ?auto_1012238 ?auto_1012244 ) ) ( not ( = ?auto_1012237 ?auto_1012240 ) ) ( not ( = ?auto_1012237 ?auto_1012242 ) ) ( not ( = ?auto_1012239 ?auto_1012244 ) ) ( not ( = ?auto_1012240 ?auto_1012242 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1012236 ?auto_1012233 ?auto_1012241 ?auto_1012242 )
      ( GET-5IMAGE-VERIFY ?auto_1012234 ?auto_1012235 ?auto_1012236 ?auto_1012233 ?auto_1012238 ?auto_1012237 ?auto_1012239 ?auto_1012240 ?auto_1012241 ?auto_1012242 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1012286 - DIRECTION
      ?auto_1012287 - MODE
      ?auto_1012288 - DIRECTION
      ?auto_1012285 - MODE
      ?auto_1012290 - DIRECTION
      ?auto_1012289 - MODE
      ?auto_1012291 - DIRECTION
      ?auto_1012292 - MODE
      ?auto_1012293 - DIRECTION
      ?auto_1012294 - MODE
    )
    :vars
    (
      ?auto_1012297 - INSTRUMENT
      ?auto_1012295 - SATELLITE
      ?auto_1012296 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1012288 ?auto_1012286 ) ) ( not ( = ?auto_1012290 ?auto_1012286 ) ) ( not ( = ?auto_1012290 ?auto_1012288 ) ) ( not ( = ?auto_1012291 ?auto_1012286 ) ) ( not ( = ?auto_1012291 ?auto_1012288 ) ) ( not ( = ?auto_1012291 ?auto_1012290 ) ) ( not ( = ?auto_1012293 ?auto_1012286 ) ) ( not ( = ?auto_1012293 ?auto_1012288 ) ) ( not ( = ?auto_1012293 ?auto_1012290 ) ) ( not ( = ?auto_1012293 ?auto_1012291 ) ) ( ON_BOARD ?auto_1012297 ?auto_1012295 ) ( SUPPORTS ?auto_1012297 ?auto_1012292 ) ( not ( = ?auto_1012291 ?auto_1012296 ) ) ( HAVE_IMAGE ?auto_1012288 ?auto_1012285 ) ( not ( = ?auto_1012288 ?auto_1012296 ) ) ( not ( = ?auto_1012285 ?auto_1012292 ) ) ( CALIBRATION_TARGET ?auto_1012297 ?auto_1012296 ) ( POWER_AVAIL ?auto_1012295 ) ( POINTING ?auto_1012295 ?auto_1012286 ) ( not ( = ?auto_1012296 ?auto_1012286 ) ) ( HAVE_IMAGE ?auto_1012286 ?auto_1012287 ) ( HAVE_IMAGE ?auto_1012290 ?auto_1012289 ) ( HAVE_IMAGE ?auto_1012293 ?auto_1012294 ) ( not ( = ?auto_1012287 ?auto_1012285 ) ) ( not ( = ?auto_1012287 ?auto_1012289 ) ) ( not ( = ?auto_1012287 ?auto_1012292 ) ) ( not ( = ?auto_1012287 ?auto_1012294 ) ) ( not ( = ?auto_1012285 ?auto_1012289 ) ) ( not ( = ?auto_1012285 ?auto_1012294 ) ) ( not ( = ?auto_1012290 ?auto_1012296 ) ) ( not ( = ?auto_1012289 ?auto_1012292 ) ) ( not ( = ?auto_1012289 ?auto_1012294 ) ) ( not ( = ?auto_1012292 ?auto_1012294 ) ) ( not ( = ?auto_1012293 ?auto_1012296 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1012288 ?auto_1012285 ?auto_1012291 ?auto_1012292 )
      ( GET-5IMAGE-VERIFY ?auto_1012286 ?auto_1012287 ?auto_1012288 ?auto_1012285 ?auto_1012290 ?auto_1012289 ?auto_1012291 ?auto_1012292 ?auto_1012293 ?auto_1012294 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1012644 - DIRECTION
      ?auto_1012645 - MODE
      ?auto_1012646 - DIRECTION
      ?auto_1012643 - MODE
      ?auto_1012648 - DIRECTION
      ?auto_1012647 - MODE
      ?auto_1012649 - DIRECTION
      ?auto_1012650 - MODE
      ?auto_1012651 - DIRECTION
      ?auto_1012652 - MODE
    )
    :vars
    (
      ?auto_1012655 - INSTRUMENT
      ?auto_1012653 - SATELLITE
      ?auto_1012654 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1012646 ?auto_1012644 ) ) ( not ( = ?auto_1012648 ?auto_1012644 ) ) ( not ( = ?auto_1012648 ?auto_1012646 ) ) ( not ( = ?auto_1012649 ?auto_1012644 ) ) ( not ( = ?auto_1012649 ?auto_1012646 ) ) ( not ( = ?auto_1012649 ?auto_1012648 ) ) ( not ( = ?auto_1012651 ?auto_1012644 ) ) ( not ( = ?auto_1012651 ?auto_1012646 ) ) ( not ( = ?auto_1012651 ?auto_1012648 ) ) ( not ( = ?auto_1012651 ?auto_1012649 ) ) ( ON_BOARD ?auto_1012655 ?auto_1012653 ) ( SUPPORTS ?auto_1012655 ?auto_1012647 ) ( not ( = ?auto_1012648 ?auto_1012654 ) ) ( HAVE_IMAGE ?auto_1012646 ?auto_1012643 ) ( not ( = ?auto_1012646 ?auto_1012654 ) ) ( not ( = ?auto_1012643 ?auto_1012647 ) ) ( CALIBRATION_TARGET ?auto_1012655 ?auto_1012654 ) ( POWER_AVAIL ?auto_1012653 ) ( POINTING ?auto_1012653 ?auto_1012644 ) ( not ( = ?auto_1012654 ?auto_1012644 ) ) ( HAVE_IMAGE ?auto_1012644 ?auto_1012645 ) ( HAVE_IMAGE ?auto_1012649 ?auto_1012650 ) ( HAVE_IMAGE ?auto_1012651 ?auto_1012652 ) ( not ( = ?auto_1012645 ?auto_1012643 ) ) ( not ( = ?auto_1012645 ?auto_1012647 ) ) ( not ( = ?auto_1012645 ?auto_1012650 ) ) ( not ( = ?auto_1012645 ?auto_1012652 ) ) ( not ( = ?auto_1012643 ?auto_1012650 ) ) ( not ( = ?auto_1012643 ?auto_1012652 ) ) ( not ( = ?auto_1012647 ?auto_1012650 ) ) ( not ( = ?auto_1012647 ?auto_1012652 ) ) ( not ( = ?auto_1012649 ?auto_1012654 ) ) ( not ( = ?auto_1012650 ?auto_1012652 ) ) ( not ( = ?auto_1012651 ?auto_1012654 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1012646 ?auto_1012643 ?auto_1012648 ?auto_1012647 )
      ( GET-5IMAGE-VERIFY ?auto_1012644 ?auto_1012645 ?auto_1012646 ?auto_1012643 ?auto_1012648 ?auto_1012647 ?auto_1012649 ?auto_1012650 ?auto_1012651 ?auto_1012652 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1015531 - DIRECTION
      ?auto_1015532 - MODE
      ?auto_1015533 - DIRECTION
      ?auto_1015530 - MODE
      ?auto_1015535 - DIRECTION
      ?auto_1015534 - MODE
      ?auto_1015536 - DIRECTION
      ?auto_1015537 - MODE
      ?auto_1015538 - DIRECTION
      ?auto_1015539 - MODE
    )
    :vars
    (
      ?auto_1015542 - INSTRUMENT
      ?auto_1015540 - SATELLITE
      ?auto_1015541 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1015533 ?auto_1015531 ) ) ( not ( = ?auto_1015535 ?auto_1015531 ) ) ( not ( = ?auto_1015535 ?auto_1015533 ) ) ( not ( = ?auto_1015536 ?auto_1015531 ) ) ( not ( = ?auto_1015536 ?auto_1015533 ) ) ( not ( = ?auto_1015536 ?auto_1015535 ) ) ( not ( = ?auto_1015538 ?auto_1015531 ) ) ( not ( = ?auto_1015538 ?auto_1015533 ) ) ( not ( = ?auto_1015538 ?auto_1015535 ) ) ( not ( = ?auto_1015538 ?auto_1015536 ) ) ( ON_BOARD ?auto_1015542 ?auto_1015540 ) ( SUPPORTS ?auto_1015542 ?auto_1015530 ) ( not ( = ?auto_1015533 ?auto_1015541 ) ) ( HAVE_IMAGE ?auto_1015535 ?auto_1015534 ) ( not ( = ?auto_1015535 ?auto_1015541 ) ) ( not ( = ?auto_1015534 ?auto_1015530 ) ) ( CALIBRATION_TARGET ?auto_1015542 ?auto_1015541 ) ( POWER_AVAIL ?auto_1015540 ) ( POINTING ?auto_1015540 ?auto_1015531 ) ( not ( = ?auto_1015541 ?auto_1015531 ) ) ( HAVE_IMAGE ?auto_1015531 ?auto_1015532 ) ( HAVE_IMAGE ?auto_1015536 ?auto_1015537 ) ( HAVE_IMAGE ?auto_1015538 ?auto_1015539 ) ( not ( = ?auto_1015532 ?auto_1015530 ) ) ( not ( = ?auto_1015532 ?auto_1015534 ) ) ( not ( = ?auto_1015532 ?auto_1015537 ) ) ( not ( = ?auto_1015532 ?auto_1015539 ) ) ( not ( = ?auto_1015530 ?auto_1015537 ) ) ( not ( = ?auto_1015530 ?auto_1015539 ) ) ( not ( = ?auto_1015534 ?auto_1015537 ) ) ( not ( = ?auto_1015534 ?auto_1015539 ) ) ( not ( = ?auto_1015536 ?auto_1015541 ) ) ( not ( = ?auto_1015537 ?auto_1015539 ) ) ( not ( = ?auto_1015538 ?auto_1015541 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1015535 ?auto_1015534 ?auto_1015533 ?auto_1015530 )
      ( GET-5IMAGE-VERIFY ?auto_1015531 ?auto_1015532 ?auto_1015533 ?auto_1015530 ?auto_1015535 ?auto_1015534 ?auto_1015536 ?auto_1015537 ?auto_1015538 ?auto_1015539 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1017699 - DIRECTION
      ?auto_1017700 - MODE
      ?auto_1017701 - DIRECTION
      ?auto_1017698 - MODE
      ?auto_1017703 - DIRECTION
      ?auto_1017702 - MODE
      ?auto_1017704 - DIRECTION
      ?auto_1017705 - MODE
      ?auto_1017706 - DIRECTION
      ?auto_1017707 - MODE
    )
    :vars
    (
      ?auto_1017710 - INSTRUMENT
      ?auto_1017708 - SATELLITE
      ?auto_1017709 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1017701 ?auto_1017699 ) ) ( not ( = ?auto_1017703 ?auto_1017699 ) ) ( not ( = ?auto_1017703 ?auto_1017701 ) ) ( not ( = ?auto_1017704 ?auto_1017699 ) ) ( not ( = ?auto_1017704 ?auto_1017701 ) ) ( not ( = ?auto_1017704 ?auto_1017703 ) ) ( not ( = ?auto_1017706 ?auto_1017699 ) ) ( not ( = ?auto_1017706 ?auto_1017701 ) ) ( not ( = ?auto_1017706 ?auto_1017703 ) ) ( not ( = ?auto_1017706 ?auto_1017704 ) ) ( ON_BOARD ?auto_1017710 ?auto_1017708 ) ( SUPPORTS ?auto_1017710 ?auto_1017700 ) ( not ( = ?auto_1017699 ?auto_1017709 ) ) ( HAVE_IMAGE ?auto_1017701 ?auto_1017698 ) ( not ( = ?auto_1017701 ?auto_1017709 ) ) ( not ( = ?auto_1017698 ?auto_1017700 ) ) ( CALIBRATION_TARGET ?auto_1017710 ?auto_1017709 ) ( POWER_AVAIL ?auto_1017708 ) ( POINTING ?auto_1017708 ?auto_1017706 ) ( not ( = ?auto_1017709 ?auto_1017706 ) ) ( HAVE_IMAGE ?auto_1017703 ?auto_1017702 ) ( HAVE_IMAGE ?auto_1017704 ?auto_1017705 ) ( HAVE_IMAGE ?auto_1017706 ?auto_1017707 ) ( not ( = ?auto_1017700 ?auto_1017702 ) ) ( not ( = ?auto_1017700 ?auto_1017705 ) ) ( not ( = ?auto_1017700 ?auto_1017707 ) ) ( not ( = ?auto_1017698 ?auto_1017702 ) ) ( not ( = ?auto_1017698 ?auto_1017705 ) ) ( not ( = ?auto_1017698 ?auto_1017707 ) ) ( not ( = ?auto_1017703 ?auto_1017709 ) ) ( not ( = ?auto_1017702 ?auto_1017705 ) ) ( not ( = ?auto_1017702 ?auto_1017707 ) ) ( not ( = ?auto_1017704 ?auto_1017709 ) ) ( not ( = ?auto_1017705 ?auto_1017707 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1017701 ?auto_1017698 ?auto_1017699 ?auto_1017700 )
      ( GET-5IMAGE-VERIFY ?auto_1017699 ?auto_1017700 ?auto_1017701 ?auto_1017698 ?auto_1017703 ?auto_1017702 ?auto_1017704 ?auto_1017705 ?auto_1017706 ?auto_1017707 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1017752 - DIRECTION
      ?auto_1017753 - MODE
      ?auto_1017754 - DIRECTION
      ?auto_1017751 - MODE
      ?auto_1017756 - DIRECTION
      ?auto_1017755 - MODE
      ?auto_1017757 - DIRECTION
      ?auto_1017758 - MODE
      ?auto_1017759 - DIRECTION
      ?auto_1017760 - MODE
    )
    :vars
    (
      ?auto_1017763 - INSTRUMENT
      ?auto_1017761 - SATELLITE
      ?auto_1017762 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1017754 ?auto_1017752 ) ) ( not ( = ?auto_1017756 ?auto_1017752 ) ) ( not ( = ?auto_1017756 ?auto_1017754 ) ) ( not ( = ?auto_1017757 ?auto_1017752 ) ) ( not ( = ?auto_1017757 ?auto_1017754 ) ) ( not ( = ?auto_1017757 ?auto_1017756 ) ) ( not ( = ?auto_1017759 ?auto_1017752 ) ) ( not ( = ?auto_1017759 ?auto_1017754 ) ) ( not ( = ?auto_1017759 ?auto_1017756 ) ) ( not ( = ?auto_1017759 ?auto_1017757 ) ) ( ON_BOARD ?auto_1017763 ?auto_1017761 ) ( SUPPORTS ?auto_1017763 ?auto_1017753 ) ( not ( = ?auto_1017752 ?auto_1017762 ) ) ( HAVE_IMAGE ?auto_1017754 ?auto_1017751 ) ( not ( = ?auto_1017754 ?auto_1017762 ) ) ( not ( = ?auto_1017751 ?auto_1017753 ) ) ( CALIBRATION_TARGET ?auto_1017763 ?auto_1017762 ) ( POWER_AVAIL ?auto_1017761 ) ( POINTING ?auto_1017761 ?auto_1017757 ) ( not ( = ?auto_1017762 ?auto_1017757 ) ) ( HAVE_IMAGE ?auto_1017756 ?auto_1017755 ) ( HAVE_IMAGE ?auto_1017757 ?auto_1017758 ) ( HAVE_IMAGE ?auto_1017759 ?auto_1017760 ) ( not ( = ?auto_1017753 ?auto_1017755 ) ) ( not ( = ?auto_1017753 ?auto_1017758 ) ) ( not ( = ?auto_1017753 ?auto_1017760 ) ) ( not ( = ?auto_1017751 ?auto_1017755 ) ) ( not ( = ?auto_1017751 ?auto_1017758 ) ) ( not ( = ?auto_1017751 ?auto_1017760 ) ) ( not ( = ?auto_1017756 ?auto_1017762 ) ) ( not ( = ?auto_1017755 ?auto_1017758 ) ) ( not ( = ?auto_1017755 ?auto_1017760 ) ) ( not ( = ?auto_1017758 ?auto_1017760 ) ) ( not ( = ?auto_1017759 ?auto_1017762 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1017754 ?auto_1017751 ?auto_1017752 ?auto_1017753 )
      ( GET-5IMAGE-VERIFY ?auto_1017752 ?auto_1017753 ?auto_1017754 ?auto_1017751 ?auto_1017756 ?auto_1017755 ?auto_1017757 ?auto_1017758 ?auto_1017759 ?auto_1017760 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1018286 - DIRECTION
      ?auto_1018287 - MODE
      ?auto_1018288 - DIRECTION
      ?auto_1018285 - MODE
      ?auto_1018290 - DIRECTION
      ?auto_1018289 - MODE
      ?auto_1018291 - DIRECTION
      ?auto_1018292 - MODE
      ?auto_1018293 - DIRECTION
      ?auto_1018294 - MODE
    )
    :vars
    (
      ?auto_1018297 - INSTRUMENT
      ?auto_1018295 - SATELLITE
      ?auto_1018296 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1018288 ?auto_1018286 ) ) ( not ( = ?auto_1018290 ?auto_1018286 ) ) ( not ( = ?auto_1018290 ?auto_1018288 ) ) ( not ( = ?auto_1018291 ?auto_1018286 ) ) ( not ( = ?auto_1018291 ?auto_1018288 ) ) ( not ( = ?auto_1018291 ?auto_1018290 ) ) ( not ( = ?auto_1018293 ?auto_1018286 ) ) ( not ( = ?auto_1018293 ?auto_1018288 ) ) ( not ( = ?auto_1018293 ?auto_1018290 ) ) ( not ( = ?auto_1018293 ?auto_1018291 ) ) ( ON_BOARD ?auto_1018297 ?auto_1018295 ) ( SUPPORTS ?auto_1018297 ?auto_1018287 ) ( not ( = ?auto_1018286 ?auto_1018296 ) ) ( HAVE_IMAGE ?auto_1018288 ?auto_1018285 ) ( not ( = ?auto_1018288 ?auto_1018296 ) ) ( not ( = ?auto_1018285 ?auto_1018287 ) ) ( CALIBRATION_TARGET ?auto_1018297 ?auto_1018296 ) ( POWER_AVAIL ?auto_1018295 ) ( POINTING ?auto_1018295 ?auto_1018290 ) ( not ( = ?auto_1018296 ?auto_1018290 ) ) ( HAVE_IMAGE ?auto_1018290 ?auto_1018289 ) ( HAVE_IMAGE ?auto_1018291 ?auto_1018292 ) ( HAVE_IMAGE ?auto_1018293 ?auto_1018294 ) ( not ( = ?auto_1018287 ?auto_1018289 ) ) ( not ( = ?auto_1018287 ?auto_1018292 ) ) ( not ( = ?auto_1018287 ?auto_1018294 ) ) ( not ( = ?auto_1018285 ?auto_1018289 ) ) ( not ( = ?auto_1018285 ?auto_1018292 ) ) ( not ( = ?auto_1018285 ?auto_1018294 ) ) ( not ( = ?auto_1018289 ?auto_1018292 ) ) ( not ( = ?auto_1018289 ?auto_1018294 ) ) ( not ( = ?auto_1018291 ?auto_1018296 ) ) ( not ( = ?auto_1018292 ?auto_1018294 ) ) ( not ( = ?auto_1018293 ?auto_1018296 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1018288 ?auto_1018285 ?auto_1018286 ?auto_1018287 )
      ( GET-5IMAGE-VERIFY ?auto_1018286 ?auto_1018287 ?auto_1018288 ?auto_1018285 ?auto_1018290 ?auto_1018289 ?auto_1018291 ?auto_1018292 ?auto_1018293 ?auto_1018294 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1022547 - DIRECTION
      ?auto_1022548 - MODE
      ?auto_1022549 - DIRECTION
      ?auto_1022546 - MODE
      ?auto_1022551 - DIRECTION
      ?auto_1022550 - MODE
      ?auto_1022552 - DIRECTION
      ?auto_1022553 - MODE
      ?auto_1022554 - DIRECTION
      ?auto_1022555 - MODE
    )
    :vars
    (
      ?auto_1022558 - INSTRUMENT
      ?auto_1022556 - SATELLITE
      ?auto_1022557 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_1022549 ?auto_1022547 ) ) ( not ( = ?auto_1022551 ?auto_1022547 ) ) ( not ( = ?auto_1022551 ?auto_1022549 ) ) ( not ( = ?auto_1022552 ?auto_1022547 ) ) ( not ( = ?auto_1022552 ?auto_1022549 ) ) ( not ( = ?auto_1022552 ?auto_1022551 ) ) ( not ( = ?auto_1022554 ?auto_1022547 ) ) ( not ( = ?auto_1022554 ?auto_1022549 ) ) ( not ( = ?auto_1022554 ?auto_1022551 ) ) ( not ( = ?auto_1022554 ?auto_1022552 ) ) ( ON_BOARD ?auto_1022558 ?auto_1022556 ) ( SUPPORTS ?auto_1022558 ?auto_1022548 ) ( not ( = ?auto_1022547 ?auto_1022557 ) ) ( HAVE_IMAGE ?auto_1022551 ?auto_1022550 ) ( not ( = ?auto_1022551 ?auto_1022557 ) ) ( not ( = ?auto_1022550 ?auto_1022548 ) ) ( CALIBRATION_TARGET ?auto_1022558 ?auto_1022557 ) ( POWER_AVAIL ?auto_1022556 ) ( POINTING ?auto_1022556 ?auto_1022549 ) ( not ( = ?auto_1022557 ?auto_1022549 ) ) ( HAVE_IMAGE ?auto_1022549 ?auto_1022546 ) ( HAVE_IMAGE ?auto_1022552 ?auto_1022553 ) ( HAVE_IMAGE ?auto_1022554 ?auto_1022555 ) ( not ( = ?auto_1022548 ?auto_1022546 ) ) ( not ( = ?auto_1022548 ?auto_1022553 ) ) ( not ( = ?auto_1022548 ?auto_1022555 ) ) ( not ( = ?auto_1022546 ?auto_1022550 ) ) ( not ( = ?auto_1022546 ?auto_1022553 ) ) ( not ( = ?auto_1022546 ?auto_1022555 ) ) ( not ( = ?auto_1022550 ?auto_1022553 ) ) ( not ( = ?auto_1022550 ?auto_1022555 ) ) ( not ( = ?auto_1022552 ?auto_1022557 ) ) ( not ( = ?auto_1022553 ?auto_1022555 ) ) ( not ( = ?auto_1022554 ?auto_1022557 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1022551 ?auto_1022550 ?auto_1022547 ?auto_1022548 )
      ( GET-5IMAGE-VERIFY ?auto_1022547 ?auto_1022548 ?auto_1022549 ?auto_1022546 ?auto_1022551 ?auto_1022550 ?auto_1022552 ?auto_1022553 ?auto_1022554 ?auto_1022555 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1026788 - DIRECTION
      ?auto_1026789 - MODE
      ?auto_1026790 - DIRECTION
      ?auto_1026787 - MODE
      ?auto_1026792 - DIRECTION
      ?auto_1026791 - MODE
      ?auto_1026793 - DIRECTION
      ?auto_1026794 - MODE
    )
    :vars
    (
      ?auto_1026797 - INSTRUMENT
      ?auto_1026798 - SATELLITE
      ?auto_1026799 - DIRECTION
      ?auto_1026795 - DIRECTION
      ?auto_1026796 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1026790 ?auto_1026788 ) ) ( not ( = ?auto_1026792 ?auto_1026788 ) ) ( not ( = ?auto_1026792 ?auto_1026790 ) ) ( not ( = ?auto_1026793 ?auto_1026788 ) ) ( not ( = ?auto_1026793 ?auto_1026790 ) ) ( not ( = ?auto_1026793 ?auto_1026792 ) ) ( ON_BOARD ?auto_1026797 ?auto_1026798 ) ( SUPPORTS ?auto_1026797 ?auto_1026794 ) ( not ( = ?auto_1026793 ?auto_1026799 ) ) ( HAVE_IMAGE ?auto_1026788 ?auto_1026789 ) ( not ( = ?auto_1026788 ?auto_1026799 ) ) ( not ( = ?auto_1026789 ?auto_1026794 ) ) ( CALIBRATION_TARGET ?auto_1026797 ?auto_1026799 ) ( POINTING ?auto_1026798 ?auto_1026795 ) ( not ( = ?auto_1026799 ?auto_1026795 ) ) ( not ( = ?auto_1026793 ?auto_1026795 ) ) ( not ( = ?auto_1026788 ?auto_1026795 ) ) ( ON_BOARD ?auto_1026796 ?auto_1026798 ) ( POWER_ON ?auto_1026796 ) ( not ( = ?auto_1026797 ?auto_1026796 ) ) ( HAVE_IMAGE ?auto_1026790 ?auto_1026787 ) ( HAVE_IMAGE ?auto_1026792 ?auto_1026791 ) ( not ( = ?auto_1026789 ?auto_1026787 ) ) ( not ( = ?auto_1026789 ?auto_1026791 ) ) ( not ( = ?auto_1026790 ?auto_1026799 ) ) ( not ( = ?auto_1026790 ?auto_1026795 ) ) ( not ( = ?auto_1026787 ?auto_1026791 ) ) ( not ( = ?auto_1026787 ?auto_1026794 ) ) ( not ( = ?auto_1026792 ?auto_1026799 ) ) ( not ( = ?auto_1026792 ?auto_1026795 ) ) ( not ( = ?auto_1026791 ?auto_1026794 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1026788 ?auto_1026789 ?auto_1026793 ?auto_1026794 )
      ( GET-4IMAGE-VERIFY ?auto_1026788 ?auto_1026789 ?auto_1026790 ?auto_1026787 ?auto_1026792 ?auto_1026791 ?auto_1026793 ?auto_1026794 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1026839 - DIRECTION
      ?auto_1026840 - MODE
      ?auto_1026841 - DIRECTION
      ?auto_1026838 - MODE
      ?auto_1026843 - DIRECTION
      ?auto_1026842 - MODE
      ?auto_1026844 - DIRECTION
      ?auto_1026845 - MODE
    )
    :vars
    (
      ?auto_1026848 - INSTRUMENT
      ?auto_1026849 - SATELLITE
      ?auto_1026850 - DIRECTION
      ?auto_1026846 - DIRECTION
      ?auto_1026847 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1026841 ?auto_1026839 ) ) ( not ( = ?auto_1026843 ?auto_1026839 ) ) ( not ( = ?auto_1026843 ?auto_1026841 ) ) ( not ( = ?auto_1026844 ?auto_1026839 ) ) ( not ( = ?auto_1026844 ?auto_1026841 ) ) ( not ( = ?auto_1026844 ?auto_1026843 ) ) ( ON_BOARD ?auto_1026848 ?auto_1026849 ) ( SUPPORTS ?auto_1026848 ?auto_1026842 ) ( not ( = ?auto_1026843 ?auto_1026850 ) ) ( HAVE_IMAGE ?auto_1026839 ?auto_1026840 ) ( not ( = ?auto_1026839 ?auto_1026850 ) ) ( not ( = ?auto_1026840 ?auto_1026842 ) ) ( CALIBRATION_TARGET ?auto_1026848 ?auto_1026850 ) ( POINTING ?auto_1026849 ?auto_1026846 ) ( not ( = ?auto_1026850 ?auto_1026846 ) ) ( not ( = ?auto_1026843 ?auto_1026846 ) ) ( not ( = ?auto_1026839 ?auto_1026846 ) ) ( ON_BOARD ?auto_1026847 ?auto_1026849 ) ( POWER_ON ?auto_1026847 ) ( not ( = ?auto_1026848 ?auto_1026847 ) ) ( HAVE_IMAGE ?auto_1026841 ?auto_1026838 ) ( HAVE_IMAGE ?auto_1026844 ?auto_1026845 ) ( not ( = ?auto_1026840 ?auto_1026838 ) ) ( not ( = ?auto_1026840 ?auto_1026845 ) ) ( not ( = ?auto_1026841 ?auto_1026850 ) ) ( not ( = ?auto_1026841 ?auto_1026846 ) ) ( not ( = ?auto_1026838 ?auto_1026842 ) ) ( not ( = ?auto_1026838 ?auto_1026845 ) ) ( not ( = ?auto_1026842 ?auto_1026845 ) ) ( not ( = ?auto_1026844 ?auto_1026850 ) ) ( not ( = ?auto_1026844 ?auto_1026846 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1026839 ?auto_1026840 ?auto_1026843 ?auto_1026842 )
      ( GET-4IMAGE-VERIFY ?auto_1026839 ?auto_1026840 ?auto_1026841 ?auto_1026838 ?auto_1026843 ?auto_1026842 ?auto_1026844 ?auto_1026845 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1027164 - DIRECTION
      ?auto_1027165 - MODE
      ?auto_1027166 - DIRECTION
      ?auto_1027163 - MODE
      ?auto_1027168 - DIRECTION
      ?auto_1027167 - MODE
      ?auto_1027169 - DIRECTION
      ?auto_1027170 - MODE
    )
    :vars
    (
      ?auto_1027173 - INSTRUMENT
      ?auto_1027174 - SATELLITE
      ?auto_1027175 - DIRECTION
      ?auto_1027171 - DIRECTION
      ?auto_1027172 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1027166 ?auto_1027164 ) ) ( not ( = ?auto_1027168 ?auto_1027164 ) ) ( not ( = ?auto_1027168 ?auto_1027166 ) ) ( not ( = ?auto_1027169 ?auto_1027164 ) ) ( not ( = ?auto_1027169 ?auto_1027166 ) ) ( not ( = ?auto_1027169 ?auto_1027168 ) ) ( ON_BOARD ?auto_1027173 ?auto_1027174 ) ( SUPPORTS ?auto_1027173 ?auto_1027163 ) ( not ( = ?auto_1027166 ?auto_1027175 ) ) ( HAVE_IMAGE ?auto_1027164 ?auto_1027165 ) ( not ( = ?auto_1027164 ?auto_1027175 ) ) ( not ( = ?auto_1027165 ?auto_1027163 ) ) ( CALIBRATION_TARGET ?auto_1027173 ?auto_1027175 ) ( POINTING ?auto_1027174 ?auto_1027171 ) ( not ( = ?auto_1027175 ?auto_1027171 ) ) ( not ( = ?auto_1027166 ?auto_1027171 ) ) ( not ( = ?auto_1027164 ?auto_1027171 ) ) ( ON_BOARD ?auto_1027172 ?auto_1027174 ) ( POWER_ON ?auto_1027172 ) ( not ( = ?auto_1027173 ?auto_1027172 ) ) ( HAVE_IMAGE ?auto_1027168 ?auto_1027167 ) ( HAVE_IMAGE ?auto_1027169 ?auto_1027170 ) ( not ( = ?auto_1027165 ?auto_1027167 ) ) ( not ( = ?auto_1027165 ?auto_1027170 ) ) ( not ( = ?auto_1027163 ?auto_1027167 ) ) ( not ( = ?auto_1027163 ?auto_1027170 ) ) ( not ( = ?auto_1027168 ?auto_1027175 ) ) ( not ( = ?auto_1027168 ?auto_1027171 ) ) ( not ( = ?auto_1027167 ?auto_1027170 ) ) ( not ( = ?auto_1027169 ?auto_1027175 ) ) ( not ( = ?auto_1027169 ?auto_1027171 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1027164 ?auto_1027165 ?auto_1027166 ?auto_1027163 )
      ( GET-4IMAGE-VERIFY ?auto_1027164 ?auto_1027165 ?auto_1027166 ?auto_1027163 ?auto_1027168 ?auto_1027167 ?auto_1027169 ?auto_1027170 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1029707 - DIRECTION
      ?auto_1029708 - MODE
      ?auto_1029709 - DIRECTION
      ?auto_1029706 - MODE
      ?auto_1029711 - DIRECTION
      ?auto_1029710 - MODE
      ?auto_1029712 - DIRECTION
      ?auto_1029713 - MODE
    )
    :vars
    (
      ?auto_1029716 - INSTRUMENT
      ?auto_1029717 - SATELLITE
      ?auto_1029718 - DIRECTION
      ?auto_1029714 - DIRECTION
      ?auto_1029715 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1029709 ?auto_1029707 ) ) ( not ( = ?auto_1029711 ?auto_1029707 ) ) ( not ( = ?auto_1029711 ?auto_1029709 ) ) ( not ( = ?auto_1029712 ?auto_1029707 ) ) ( not ( = ?auto_1029712 ?auto_1029709 ) ) ( not ( = ?auto_1029712 ?auto_1029711 ) ) ( ON_BOARD ?auto_1029716 ?auto_1029717 ) ( SUPPORTS ?auto_1029716 ?auto_1029708 ) ( not ( = ?auto_1029707 ?auto_1029718 ) ) ( HAVE_IMAGE ?auto_1029709 ?auto_1029706 ) ( not ( = ?auto_1029709 ?auto_1029718 ) ) ( not ( = ?auto_1029706 ?auto_1029708 ) ) ( CALIBRATION_TARGET ?auto_1029716 ?auto_1029718 ) ( POINTING ?auto_1029717 ?auto_1029714 ) ( not ( = ?auto_1029718 ?auto_1029714 ) ) ( not ( = ?auto_1029707 ?auto_1029714 ) ) ( not ( = ?auto_1029709 ?auto_1029714 ) ) ( ON_BOARD ?auto_1029715 ?auto_1029717 ) ( POWER_ON ?auto_1029715 ) ( not ( = ?auto_1029716 ?auto_1029715 ) ) ( HAVE_IMAGE ?auto_1029711 ?auto_1029710 ) ( HAVE_IMAGE ?auto_1029712 ?auto_1029713 ) ( not ( = ?auto_1029708 ?auto_1029710 ) ) ( not ( = ?auto_1029708 ?auto_1029713 ) ) ( not ( = ?auto_1029706 ?auto_1029710 ) ) ( not ( = ?auto_1029706 ?auto_1029713 ) ) ( not ( = ?auto_1029711 ?auto_1029718 ) ) ( not ( = ?auto_1029711 ?auto_1029714 ) ) ( not ( = ?auto_1029710 ?auto_1029713 ) ) ( not ( = ?auto_1029712 ?auto_1029718 ) ) ( not ( = ?auto_1029712 ?auto_1029714 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1029709 ?auto_1029706 ?auto_1029707 ?auto_1029708 )
      ( GET-4IMAGE-VERIFY ?auto_1029707 ?auto_1029708 ?auto_1029709 ?auto_1029706 ?auto_1029711 ?auto_1029710 ?auto_1029712 ?auto_1029713 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1032414 - DIRECTION
      ?auto_1032415 - MODE
      ?auto_1032416 - DIRECTION
      ?auto_1032413 - MODE
      ?auto_1032418 - DIRECTION
      ?auto_1032417 - MODE
      ?auto_1032419 - DIRECTION
      ?auto_1032420 - MODE
      ?auto_1032421 - DIRECTION
      ?auto_1032422 - MODE
    )
    :vars
    (
      ?auto_1032424 - INSTRUMENT
      ?auto_1032425 - SATELLITE
      ?auto_1032426 - DIRECTION
      ?auto_1032423 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1032416 ?auto_1032414 ) ) ( not ( = ?auto_1032418 ?auto_1032414 ) ) ( not ( = ?auto_1032418 ?auto_1032416 ) ) ( not ( = ?auto_1032419 ?auto_1032414 ) ) ( not ( = ?auto_1032419 ?auto_1032416 ) ) ( not ( = ?auto_1032419 ?auto_1032418 ) ) ( not ( = ?auto_1032421 ?auto_1032414 ) ) ( not ( = ?auto_1032421 ?auto_1032416 ) ) ( not ( = ?auto_1032421 ?auto_1032418 ) ) ( not ( = ?auto_1032421 ?auto_1032419 ) ) ( ON_BOARD ?auto_1032424 ?auto_1032425 ) ( SUPPORTS ?auto_1032424 ?auto_1032422 ) ( not ( = ?auto_1032421 ?auto_1032426 ) ) ( HAVE_IMAGE ?auto_1032414 ?auto_1032415 ) ( not ( = ?auto_1032414 ?auto_1032426 ) ) ( not ( = ?auto_1032415 ?auto_1032422 ) ) ( CALIBRATION_TARGET ?auto_1032424 ?auto_1032426 ) ( POINTING ?auto_1032425 ?auto_1032419 ) ( not ( = ?auto_1032426 ?auto_1032419 ) ) ( ON_BOARD ?auto_1032423 ?auto_1032425 ) ( POWER_ON ?auto_1032423 ) ( not ( = ?auto_1032424 ?auto_1032423 ) ) ( HAVE_IMAGE ?auto_1032416 ?auto_1032413 ) ( HAVE_IMAGE ?auto_1032418 ?auto_1032417 ) ( HAVE_IMAGE ?auto_1032419 ?auto_1032420 ) ( not ( = ?auto_1032415 ?auto_1032413 ) ) ( not ( = ?auto_1032415 ?auto_1032417 ) ) ( not ( = ?auto_1032415 ?auto_1032420 ) ) ( not ( = ?auto_1032416 ?auto_1032426 ) ) ( not ( = ?auto_1032413 ?auto_1032417 ) ) ( not ( = ?auto_1032413 ?auto_1032420 ) ) ( not ( = ?auto_1032413 ?auto_1032422 ) ) ( not ( = ?auto_1032418 ?auto_1032426 ) ) ( not ( = ?auto_1032417 ?auto_1032420 ) ) ( not ( = ?auto_1032417 ?auto_1032422 ) ) ( not ( = ?auto_1032420 ?auto_1032422 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1032414 ?auto_1032415 ?auto_1032421 ?auto_1032422 )
      ( GET-5IMAGE-VERIFY ?auto_1032414 ?auto_1032415 ?auto_1032416 ?auto_1032413 ?auto_1032418 ?auto_1032417 ?auto_1032419 ?auto_1032420 ?auto_1032421 ?auto_1032422 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1032473 - DIRECTION
      ?auto_1032474 - MODE
      ?auto_1032475 - DIRECTION
      ?auto_1032472 - MODE
      ?auto_1032477 - DIRECTION
      ?auto_1032476 - MODE
      ?auto_1032478 - DIRECTION
      ?auto_1032479 - MODE
      ?auto_1032480 - DIRECTION
      ?auto_1032481 - MODE
    )
    :vars
    (
      ?auto_1032483 - INSTRUMENT
      ?auto_1032484 - SATELLITE
      ?auto_1032485 - DIRECTION
      ?auto_1032482 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1032475 ?auto_1032473 ) ) ( not ( = ?auto_1032477 ?auto_1032473 ) ) ( not ( = ?auto_1032477 ?auto_1032475 ) ) ( not ( = ?auto_1032478 ?auto_1032473 ) ) ( not ( = ?auto_1032478 ?auto_1032475 ) ) ( not ( = ?auto_1032478 ?auto_1032477 ) ) ( not ( = ?auto_1032480 ?auto_1032473 ) ) ( not ( = ?auto_1032480 ?auto_1032475 ) ) ( not ( = ?auto_1032480 ?auto_1032477 ) ) ( not ( = ?auto_1032480 ?auto_1032478 ) ) ( ON_BOARD ?auto_1032483 ?auto_1032484 ) ( SUPPORTS ?auto_1032483 ?auto_1032479 ) ( not ( = ?auto_1032478 ?auto_1032485 ) ) ( HAVE_IMAGE ?auto_1032473 ?auto_1032474 ) ( not ( = ?auto_1032473 ?auto_1032485 ) ) ( not ( = ?auto_1032474 ?auto_1032479 ) ) ( CALIBRATION_TARGET ?auto_1032483 ?auto_1032485 ) ( POINTING ?auto_1032484 ?auto_1032480 ) ( not ( = ?auto_1032485 ?auto_1032480 ) ) ( ON_BOARD ?auto_1032482 ?auto_1032484 ) ( POWER_ON ?auto_1032482 ) ( not ( = ?auto_1032483 ?auto_1032482 ) ) ( HAVE_IMAGE ?auto_1032475 ?auto_1032472 ) ( HAVE_IMAGE ?auto_1032477 ?auto_1032476 ) ( HAVE_IMAGE ?auto_1032480 ?auto_1032481 ) ( not ( = ?auto_1032474 ?auto_1032472 ) ) ( not ( = ?auto_1032474 ?auto_1032476 ) ) ( not ( = ?auto_1032474 ?auto_1032481 ) ) ( not ( = ?auto_1032475 ?auto_1032485 ) ) ( not ( = ?auto_1032472 ?auto_1032476 ) ) ( not ( = ?auto_1032472 ?auto_1032479 ) ) ( not ( = ?auto_1032472 ?auto_1032481 ) ) ( not ( = ?auto_1032477 ?auto_1032485 ) ) ( not ( = ?auto_1032476 ?auto_1032479 ) ) ( not ( = ?auto_1032476 ?auto_1032481 ) ) ( not ( = ?auto_1032479 ?auto_1032481 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1032473 ?auto_1032474 ?auto_1032478 ?auto_1032479 )
      ( GET-5IMAGE-VERIFY ?auto_1032473 ?auto_1032474 ?auto_1032475 ?auto_1032472 ?auto_1032477 ?auto_1032476 ?auto_1032478 ?auto_1032479 ?auto_1032480 ?auto_1032481 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1032530 - DIRECTION
      ?auto_1032531 - MODE
      ?auto_1032532 - DIRECTION
      ?auto_1032529 - MODE
      ?auto_1032534 - DIRECTION
      ?auto_1032533 - MODE
      ?auto_1032535 - DIRECTION
      ?auto_1032536 - MODE
      ?auto_1032537 - DIRECTION
      ?auto_1032538 - MODE
    )
    :vars
    (
      ?auto_1032540 - INSTRUMENT
      ?auto_1032541 - SATELLITE
      ?auto_1032542 - DIRECTION
      ?auto_1032539 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1032532 ?auto_1032530 ) ) ( not ( = ?auto_1032534 ?auto_1032530 ) ) ( not ( = ?auto_1032534 ?auto_1032532 ) ) ( not ( = ?auto_1032535 ?auto_1032530 ) ) ( not ( = ?auto_1032535 ?auto_1032532 ) ) ( not ( = ?auto_1032535 ?auto_1032534 ) ) ( not ( = ?auto_1032537 ?auto_1032530 ) ) ( not ( = ?auto_1032537 ?auto_1032532 ) ) ( not ( = ?auto_1032537 ?auto_1032534 ) ) ( not ( = ?auto_1032537 ?auto_1032535 ) ) ( ON_BOARD ?auto_1032540 ?auto_1032541 ) ( SUPPORTS ?auto_1032540 ?auto_1032538 ) ( not ( = ?auto_1032537 ?auto_1032542 ) ) ( HAVE_IMAGE ?auto_1032530 ?auto_1032531 ) ( not ( = ?auto_1032530 ?auto_1032542 ) ) ( not ( = ?auto_1032531 ?auto_1032538 ) ) ( CALIBRATION_TARGET ?auto_1032540 ?auto_1032542 ) ( POINTING ?auto_1032541 ?auto_1032534 ) ( not ( = ?auto_1032542 ?auto_1032534 ) ) ( ON_BOARD ?auto_1032539 ?auto_1032541 ) ( POWER_ON ?auto_1032539 ) ( not ( = ?auto_1032540 ?auto_1032539 ) ) ( HAVE_IMAGE ?auto_1032532 ?auto_1032529 ) ( HAVE_IMAGE ?auto_1032534 ?auto_1032533 ) ( HAVE_IMAGE ?auto_1032535 ?auto_1032536 ) ( not ( = ?auto_1032531 ?auto_1032529 ) ) ( not ( = ?auto_1032531 ?auto_1032533 ) ) ( not ( = ?auto_1032531 ?auto_1032536 ) ) ( not ( = ?auto_1032532 ?auto_1032542 ) ) ( not ( = ?auto_1032529 ?auto_1032533 ) ) ( not ( = ?auto_1032529 ?auto_1032536 ) ) ( not ( = ?auto_1032529 ?auto_1032538 ) ) ( not ( = ?auto_1032533 ?auto_1032536 ) ) ( not ( = ?auto_1032533 ?auto_1032538 ) ) ( not ( = ?auto_1032535 ?auto_1032542 ) ) ( not ( = ?auto_1032536 ?auto_1032538 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1032530 ?auto_1032531 ?auto_1032537 ?auto_1032538 )
      ( GET-5IMAGE-VERIFY ?auto_1032530 ?auto_1032531 ?auto_1032532 ?auto_1032529 ?auto_1032534 ?auto_1032533 ?auto_1032535 ?auto_1032536 ?auto_1032537 ?auto_1032538 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1032586 - DIRECTION
      ?auto_1032587 - MODE
      ?auto_1032588 - DIRECTION
      ?auto_1032585 - MODE
      ?auto_1032590 - DIRECTION
      ?auto_1032589 - MODE
      ?auto_1032591 - DIRECTION
      ?auto_1032592 - MODE
      ?auto_1032593 - DIRECTION
      ?auto_1032594 - MODE
    )
    :vars
    (
      ?auto_1032596 - INSTRUMENT
      ?auto_1032597 - SATELLITE
      ?auto_1032598 - DIRECTION
      ?auto_1032595 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1032588 ?auto_1032586 ) ) ( not ( = ?auto_1032590 ?auto_1032586 ) ) ( not ( = ?auto_1032590 ?auto_1032588 ) ) ( not ( = ?auto_1032591 ?auto_1032586 ) ) ( not ( = ?auto_1032591 ?auto_1032588 ) ) ( not ( = ?auto_1032591 ?auto_1032590 ) ) ( not ( = ?auto_1032593 ?auto_1032586 ) ) ( not ( = ?auto_1032593 ?auto_1032588 ) ) ( not ( = ?auto_1032593 ?auto_1032590 ) ) ( not ( = ?auto_1032593 ?auto_1032591 ) ) ( ON_BOARD ?auto_1032596 ?auto_1032597 ) ( SUPPORTS ?auto_1032596 ?auto_1032592 ) ( not ( = ?auto_1032591 ?auto_1032598 ) ) ( HAVE_IMAGE ?auto_1032586 ?auto_1032587 ) ( not ( = ?auto_1032586 ?auto_1032598 ) ) ( not ( = ?auto_1032587 ?auto_1032592 ) ) ( CALIBRATION_TARGET ?auto_1032596 ?auto_1032598 ) ( POINTING ?auto_1032597 ?auto_1032590 ) ( not ( = ?auto_1032598 ?auto_1032590 ) ) ( ON_BOARD ?auto_1032595 ?auto_1032597 ) ( POWER_ON ?auto_1032595 ) ( not ( = ?auto_1032596 ?auto_1032595 ) ) ( HAVE_IMAGE ?auto_1032588 ?auto_1032585 ) ( HAVE_IMAGE ?auto_1032590 ?auto_1032589 ) ( HAVE_IMAGE ?auto_1032593 ?auto_1032594 ) ( not ( = ?auto_1032587 ?auto_1032585 ) ) ( not ( = ?auto_1032587 ?auto_1032589 ) ) ( not ( = ?auto_1032587 ?auto_1032594 ) ) ( not ( = ?auto_1032588 ?auto_1032598 ) ) ( not ( = ?auto_1032585 ?auto_1032589 ) ) ( not ( = ?auto_1032585 ?auto_1032592 ) ) ( not ( = ?auto_1032585 ?auto_1032594 ) ) ( not ( = ?auto_1032589 ?auto_1032592 ) ) ( not ( = ?auto_1032589 ?auto_1032594 ) ) ( not ( = ?auto_1032592 ?auto_1032594 ) ) ( not ( = ?auto_1032593 ?auto_1032598 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1032586 ?auto_1032587 ?auto_1032591 ?auto_1032592 )
      ( GET-5IMAGE-VERIFY ?auto_1032586 ?auto_1032587 ?auto_1032588 ?auto_1032585 ?auto_1032590 ?auto_1032589 ?auto_1032591 ?auto_1032592 ?auto_1032593 ?auto_1032594 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1032821 - DIRECTION
      ?auto_1032822 - MODE
      ?auto_1032823 - DIRECTION
      ?auto_1032820 - MODE
      ?auto_1032825 - DIRECTION
      ?auto_1032824 - MODE
      ?auto_1032826 - DIRECTION
      ?auto_1032827 - MODE
      ?auto_1032828 - DIRECTION
      ?auto_1032829 - MODE
    )
    :vars
    (
      ?auto_1032831 - INSTRUMENT
      ?auto_1032832 - SATELLITE
      ?auto_1032833 - DIRECTION
      ?auto_1032830 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1032823 ?auto_1032821 ) ) ( not ( = ?auto_1032825 ?auto_1032821 ) ) ( not ( = ?auto_1032825 ?auto_1032823 ) ) ( not ( = ?auto_1032826 ?auto_1032821 ) ) ( not ( = ?auto_1032826 ?auto_1032823 ) ) ( not ( = ?auto_1032826 ?auto_1032825 ) ) ( not ( = ?auto_1032828 ?auto_1032821 ) ) ( not ( = ?auto_1032828 ?auto_1032823 ) ) ( not ( = ?auto_1032828 ?auto_1032825 ) ) ( not ( = ?auto_1032828 ?auto_1032826 ) ) ( ON_BOARD ?auto_1032831 ?auto_1032832 ) ( SUPPORTS ?auto_1032831 ?auto_1032824 ) ( not ( = ?auto_1032825 ?auto_1032833 ) ) ( HAVE_IMAGE ?auto_1032821 ?auto_1032822 ) ( not ( = ?auto_1032821 ?auto_1032833 ) ) ( not ( = ?auto_1032822 ?auto_1032824 ) ) ( CALIBRATION_TARGET ?auto_1032831 ?auto_1032833 ) ( POINTING ?auto_1032832 ?auto_1032828 ) ( not ( = ?auto_1032833 ?auto_1032828 ) ) ( ON_BOARD ?auto_1032830 ?auto_1032832 ) ( POWER_ON ?auto_1032830 ) ( not ( = ?auto_1032831 ?auto_1032830 ) ) ( HAVE_IMAGE ?auto_1032823 ?auto_1032820 ) ( HAVE_IMAGE ?auto_1032826 ?auto_1032827 ) ( HAVE_IMAGE ?auto_1032828 ?auto_1032829 ) ( not ( = ?auto_1032822 ?auto_1032820 ) ) ( not ( = ?auto_1032822 ?auto_1032827 ) ) ( not ( = ?auto_1032822 ?auto_1032829 ) ) ( not ( = ?auto_1032823 ?auto_1032833 ) ) ( not ( = ?auto_1032820 ?auto_1032824 ) ) ( not ( = ?auto_1032820 ?auto_1032827 ) ) ( not ( = ?auto_1032820 ?auto_1032829 ) ) ( not ( = ?auto_1032824 ?auto_1032827 ) ) ( not ( = ?auto_1032824 ?auto_1032829 ) ) ( not ( = ?auto_1032826 ?auto_1032833 ) ) ( not ( = ?auto_1032827 ?auto_1032829 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1032821 ?auto_1032822 ?auto_1032825 ?auto_1032824 )
      ( GET-5IMAGE-VERIFY ?auto_1032821 ?auto_1032822 ?auto_1032823 ?auto_1032820 ?auto_1032825 ?auto_1032824 ?auto_1032826 ?auto_1032827 ?auto_1032828 ?auto_1032829 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1032878 - DIRECTION
      ?auto_1032879 - MODE
      ?auto_1032880 - DIRECTION
      ?auto_1032877 - MODE
      ?auto_1032882 - DIRECTION
      ?auto_1032881 - MODE
      ?auto_1032883 - DIRECTION
      ?auto_1032884 - MODE
      ?auto_1032885 - DIRECTION
      ?auto_1032886 - MODE
    )
    :vars
    (
      ?auto_1032888 - INSTRUMENT
      ?auto_1032889 - SATELLITE
      ?auto_1032890 - DIRECTION
      ?auto_1032887 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1032880 ?auto_1032878 ) ) ( not ( = ?auto_1032882 ?auto_1032878 ) ) ( not ( = ?auto_1032882 ?auto_1032880 ) ) ( not ( = ?auto_1032883 ?auto_1032878 ) ) ( not ( = ?auto_1032883 ?auto_1032880 ) ) ( not ( = ?auto_1032883 ?auto_1032882 ) ) ( not ( = ?auto_1032885 ?auto_1032878 ) ) ( not ( = ?auto_1032885 ?auto_1032880 ) ) ( not ( = ?auto_1032885 ?auto_1032882 ) ) ( not ( = ?auto_1032885 ?auto_1032883 ) ) ( ON_BOARD ?auto_1032888 ?auto_1032889 ) ( SUPPORTS ?auto_1032888 ?auto_1032881 ) ( not ( = ?auto_1032882 ?auto_1032890 ) ) ( HAVE_IMAGE ?auto_1032878 ?auto_1032879 ) ( not ( = ?auto_1032878 ?auto_1032890 ) ) ( not ( = ?auto_1032879 ?auto_1032881 ) ) ( CALIBRATION_TARGET ?auto_1032888 ?auto_1032890 ) ( POINTING ?auto_1032889 ?auto_1032883 ) ( not ( = ?auto_1032890 ?auto_1032883 ) ) ( ON_BOARD ?auto_1032887 ?auto_1032889 ) ( POWER_ON ?auto_1032887 ) ( not ( = ?auto_1032888 ?auto_1032887 ) ) ( HAVE_IMAGE ?auto_1032880 ?auto_1032877 ) ( HAVE_IMAGE ?auto_1032883 ?auto_1032884 ) ( HAVE_IMAGE ?auto_1032885 ?auto_1032886 ) ( not ( = ?auto_1032879 ?auto_1032877 ) ) ( not ( = ?auto_1032879 ?auto_1032884 ) ) ( not ( = ?auto_1032879 ?auto_1032886 ) ) ( not ( = ?auto_1032880 ?auto_1032890 ) ) ( not ( = ?auto_1032877 ?auto_1032881 ) ) ( not ( = ?auto_1032877 ?auto_1032884 ) ) ( not ( = ?auto_1032877 ?auto_1032886 ) ) ( not ( = ?auto_1032881 ?auto_1032884 ) ) ( not ( = ?auto_1032881 ?auto_1032886 ) ) ( not ( = ?auto_1032884 ?auto_1032886 ) ) ( not ( = ?auto_1032885 ?auto_1032890 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1032878 ?auto_1032879 ?auto_1032882 ?auto_1032881 )
      ( GET-5IMAGE-VERIFY ?auto_1032878 ?auto_1032879 ?auto_1032880 ?auto_1032877 ?auto_1032882 ?auto_1032881 ?auto_1032883 ?auto_1032884 ?auto_1032885 ?auto_1032886 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1034015 - DIRECTION
      ?auto_1034016 - MODE
      ?auto_1034017 - DIRECTION
      ?auto_1034014 - MODE
      ?auto_1034019 - DIRECTION
      ?auto_1034018 - MODE
      ?auto_1034020 - DIRECTION
      ?auto_1034021 - MODE
      ?auto_1034022 - DIRECTION
      ?auto_1034023 - MODE
    )
    :vars
    (
      ?auto_1034025 - INSTRUMENT
      ?auto_1034026 - SATELLITE
      ?auto_1034027 - DIRECTION
      ?auto_1034024 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1034017 ?auto_1034015 ) ) ( not ( = ?auto_1034019 ?auto_1034015 ) ) ( not ( = ?auto_1034019 ?auto_1034017 ) ) ( not ( = ?auto_1034020 ?auto_1034015 ) ) ( not ( = ?auto_1034020 ?auto_1034017 ) ) ( not ( = ?auto_1034020 ?auto_1034019 ) ) ( not ( = ?auto_1034022 ?auto_1034015 ) ) ( not ( = ?auto_1034022 ?auto_1034017 ) ) ( not ( = ?auto_1034022 ?auto_1034019 ) ) ( not ( = ?auto_1034022 ?auto_1034020 ) ) ( ON_BOARD ?auto_1034025 ?auto_1034026 ) ( SUPPORTS ?auto_1034025 ?auto_1034023 ) ( not ( = ?auto_1034022 ?auto_1034027 ) ) ( HAVE_IMAGE ?auto_1034015 ?auto_1034016 ) ( not ( = ?auto_1034015 ?auto_1034027 ) ) ( not ( = ?auto_1034016 ?auto_1034023 ) ) ( CALIBRATION_TARGET ?auto_1034025 ?auto_1034027 ) ( POINTING ?auto_1034026 ?auto_1034017 ) ( not ( = ?auto_1034027 ?auto_1034017 ) ) ( ON_BOARD ?auto_1034024 ?auto_1034026 ) ( POWER_ON ?auto_1034024 ) ( not ( = ?auto_1034025 ?auto_1034024 ) ) ( HAVE_IMAGE ?auto_1034017 ?auto_1034014 ) ( HAVE_IMAGE ?auto_1034019 ?auto_1034018 ) ( HAVE_IMAGE ?auto_1034020 ?auto_1034021 ) ( not ( = ?auto_1034016 ?auto_1034014 ) ) ( not ( = ?auto_1034016 ?auto_1034018 ) ) ( not ( = ?auto_1034016 ?auto_1034021 ) ) ( not ( = ?auto_1034014 ?auto_1034018 ) ) ( not ( = ?auto_1034014 ?auto_1034021 ) ) ( not ( = ?auto_1034014 ?auto_1034023 ) ) ( not ( = ?auto_1034019 ?auto_1034027 ) ) ( not ( = ?auto_1034018 ?auto_1034021 ) ) ( not ( = ?auto_1034018 ?auto_1034023 ) ) ( not ( = ?auto_1034020 ?auto_1034027 ) ) ( not ( = ?auto_1034021 ?auto_1034023 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1034015 ?auto_1034016 ?auto_1034022 ?auto_1034023 )
      ( GET-5IMAGE-VERIFY ?auto_1034015 ?auto_1034016 ?auto_1034017 ?auto_1034014 ?auto_1034019 ?auto_1034018 ?auto_1034020 ?auto_1034021 ?auto_1034022 ?auto_1034023 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1034071 - DIRECTION
      ?auto_1034072 - MODE
      ?auto_1034073 - DIRECTION
      ?auto_1034070 - MODE
      ?auto_1034075 - DIRECTION
      ?auto_1034074 - MODE
      ?auto_1034076 - DIRECTION
      ?auto_1034077 - MODE
      ?auto_1034078 - DIRECTION
      ?auto_1034079 - MODE
    )
    :vars
    (
      ?auto_1034081 - INSTRUMENT
      ?auto_1034082 - SATELLITE
      ?auto_1034083 - DIRECTION
      ?auto_1034080 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1034073 ?auto_1034071 ) ) ( not ( = ?auto_1034075 ?auto_1034071 ) ) ( not ( = ?auto_1034075 ?auto_1034073 ) ) ( not ( = ?auto_1034076 ?auto_1034071 ) ) ( not ( = ?auto_1034076 ?auto_1034073 ) ) ( not ( = ?auto_1034076 ?auto_1034075 ) ) ( not ( = ?auto_1034078 ?auto_1034071 ) ) ( not ( = ?auto_1034078 ?auto_1034073 ) ) ( not ( = ?auto_1034078 ?auto_1034075 ) ) ( not ( = ?auto_1034078 ?auto_1034076 ) ) ( ON_BOARD ?auto_1034081 ?auto_1034082 ) ( SUPPORTS ?auto_1034081 ?auto_1034077 ) ( not ( = ?auto_1034076 ?auto_1034083 ) ) ( HAVE_IMAGE ?auto_1034071 ?auto_1034072 ) ( not ( = ?auto_1034071 ?auto_1034083 ) ) ( not ( = ?auto_1034072 ?auto_1034077 ) ) ( CALIBRATION_TARGET ?auto_1034081 ?auto_1034083 ) ( POINTING ?auto_1034082 ?auto_1034073 ) ( not ( = ?auto_1034083 ?auto_1034073 ) ) ( ON_BOARD ?auto_1034080 ?auto_1034082 ) ( POWER_ON ?auto_1034080 ) ( not ( = ?auto_1034081 ?auto_1034080 ) ) ( HAVE_IMAGE ?auto_1034073 ?auto_1034070 ) ( HAVE_IMAGE ?auto_1034075 ?auto_1034074 ) ( HAVE_IMAGE ?auto_1034078 ?auto_1034079 ) ( not ( = ?auto_1034072 ?auto_1034070 ) ) ( not ( = ?auto_1034072 ?auto_1034074 ) ) ( not ( = ?auto_1034072 ?auto_1034079 ) ) ( not ( = ?auto_1034070 ?auto_1034074 ) ) ( not ( = ?auto_1034070 ?auto_1034077 ) ) ( not ( = ?auto_1034070 ?auto_1034079 ) ) ( not ( = ?auto_1034075 ?auto_1034083 ) ) ( not ( = ?auto_1034074 ?auto_1034077 ) ) ( not ( = ?auto_1034074 ?auto_1034079 ) ) ( not ( = ?auto_1034077 ?auto_1034079 ) ) ( not ( = ?auto_1034078 ?auto_1034083 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1034071 ?auto_1034072 ?auto_1034076 ?auto_1034077 )
      ( GET-5IMAGE-VERIFY ?auto_1034071 ?auto_1034072 ?auto_1034073 ?auto_1034070 ?auto_1034075 ?auto_1034074 ?auto_1034076 ?auto_1034077 ?auto_1034078 ?auto_1034079 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1034455 - DIRECTION
      ?auto_1034456 - MODE
      ?auto_1034457 - DIRECTION
      ?auto_1034454 - MODE
      ?auto_1034459 - DIRECTION
      ?auto_1034458 - MODE
      ?auto_1034460 - DIRECTION
      ?auto_1034461 - MODE
      ?auto_1034462 - DIRECTION
      ?auto_1034463 - MODE
    )
    :vars
    (
      ?auto_1034465 - INSTRUMENT
      ?auto_1034466 - SATELLITE
      ?auto_1034467 - DIRECTION
      ?auto_1034464 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1034457 ?auto_1034455 ) ) ( not ( = ?auto_1034459 ?auto_1034455 ) ) ( not ( = ?auto_1034459 ?auto_1034457 ) ) ( not ( = ?auto_1034460 ?auto_1034455 ) ) ( not ( = ?auto_1034460 ?auto_1034457 ) ) ( not ( = ?auto_1034460 ?auto_1034459 ) ) ( not ( = ?auto_1034462 ?auto_1034455 ) ) ( not ( = ?auto_1034462 ?auto_1034457 ) ) ( not ( = ?auto_1034462 ?auto_1034459 ) ) ( not ( = ?auto_1034462 ?auto_1034460 ) ) ( ON_BOARD ?auto_1034465 ?auto_1034466 ) ( SUPPORTS ?auto_1034465 ?auto_1034458 ) ( not ( = ?auto_1034459 ?auto_1034467 ) ) ( HAVE_IMAGE ?auto_1034455 ?auto_1034456 ) ( not ( = ?auto_1034455 ?auto_1034467 ) ) ( not ( = ?auto_1034456 ?auto_1034458 ) ) ( CALIBRATION_TARGET ?auto_1034465 ?auto_1034467 ) ( POINTING ?auto_1034466 ?auto_1034457 ) ( not ( = ?auto_1034467 ?auto_1034457 ) ) ( ON_BOARD ?auto_1034464 ?auto_1034466 ) ( POWER_ON ?auto_1034464 ) ( not ( = ?auto_1034465 ?auto_1034464 ) ) ( HAVE_IMAGE ?auto_1034457 ?auto_1034454 ) ( HAVE_IMAGE ?auto_1034460 ?auto_1034461 ) ( HAVE_IMAGE ?auto_1034462 ?auto_1034463 ) ( not ( = ?auto_1034456 ?auto_1034454 ) ) ( not ( = ?auto_1034456 ?auto_1034461 ) ) ( not ( = ?auto_1034456 ?auto_1034463 ) ) ( not ( = ?auto_1034454 ?auto_1034458 ) ) ( not ( = ?auto_1034454 ?auto_1034461 ) ) ( not ( = ?auto_1034454 ?auto_1034463 ) ) ( not ( = ?auto_1034458 ?auto_1034461 ) ) ( not ( = ?auto_1034458 ?auto_1034463 ) ) ( not ( = ?auto_1034460 ?auto_1034467 ) ) ( not ( = ?auto_1034461 ?auto_1034463 ) ) ( not ( = ?auto_1034462 ?auto_1034467 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1034455 ?auto_1034456 ?auto_1034459 ?auto_1034458 )
      ( GET-5IMAGE-VERIFY ?auto_1034455 ?auto_1034456 ?auto_1034457 ?auto_1034454 ?auto_1034459 ?auto_1034458 ?auto_1034460 ?auto_1034461 ?auto_1034462 ?auto_1034463 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1035262 - DIRECTION
      ?auto_1035263 - MODE
      ?auto_1035264 - DIRECTION
      ?auto_1035261 - MODE
      ?auto_1035266 - DIRECTION
      ?auto_1035265 - MODE
      ?auto_1035267 - DIRECTION
      ?auto_1035268 - MODE
      ?auto_1035269 - DIRECTION
      ?auto_1035270 - MODE
    )
    :vars
    (
      ?auto_1035272 - INSTRUMENT
      ?auto_1035273 - SATELLITE
      ?auto_1035274 - DIRECTION
      ?auto_1035271 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1035264 ?auto_1035262 ) ) ( not ( = ?auto_1035266 ?auto_1035262 ) ) ( not ( = ?auto_1035266 ?auto_1035264 ) ) ( not ( = ?auto_1035267 ?auto_1035262 ) ) ( not ( = ?auto_1035267 ?auto_1035264 ) ) ( not ( = ?auto_1035267 ?auto_1035266 ) ) ( not ( = ?auto_1035269 ?auto_1035262 ) ) ( not ( = ?auto_1035269 ?auto_1035264 ) ) ( not ( = ?auto_1035269 ?auto_1035266 ) ) ( not ( = ?auto_1035269 ?auto_1035267 ) ) ( ON_BOARD ?auto_1035272 ?auto_1035273 ) ( SUPPORTS ?auto_1035272 ?auto_1035261 ) ( not ( = ?auto_1035264 ?auto_1035274 ) ) ( HAVE_IMAGE ?auto_1035262 ?auto_1035263 ) ( not ( = ?auto_1035262 ?auto_1035274 ) ) ( not ( = ?auto_1035263 ?auto_1035261 ) ) ( CALIBRATION_TARGET ?auto_1035272 ?auto_1035274 ) ( POINTING ?auto_1035273 ?auto_1035269 ) ( not ( = ?auto_1035274 ?auto_1035269 ) ) ( ON_BOARD ?auto_1035271 ?auto_1035273 ) ( POWER_ON ?auto_1035271 ) ( not ( = ?auto_1035272 ?auto_1035271 ) ) ( HAVE_IMAGE ?auto_1035266 ?auto_1035265 ) ( HAVE_IMAGE ?auto_1035267 ?auto_1035268 ) ( HAVE_IMAGE ?auto_1035269 ?auto_1035270 ) ( not ( = ?auto_1035263 ?auto_1035265 ) ) ( not ( = ?auto_1035263 ?auto_1035268 ) ) ( not ( = ?auto_1035263 ?auto_1035270 ) ) ( not ( = ?auto_1035261 ?auto_1035265 ) ) ( not ( = ?auto_1035261 ?auto_1035268 ) ) ( not ( = ?auto_1035261 ?auto_1035270 ) ) ( not ( = ?auto_1035266 ?auto_1035274 ) ) ( not ( = ?auto_1035265 ?auto_1035268 ) ) ( not ( = ?auto_1035265 ?auto_1035270 ) ) ( not ( = ?auto_1035267 ?auto_1035274 ) ) ( not ( = ?auto_1035268 ?auto_1035270 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1035262 ?auto_1035263 ?auto_1035264 ?auto_1035261 )
      ( GET-5IMAGE-VERIFY ?auto_1035262 ?auto_1035263 ?auto_1035264 ?auto_1035261 ?auto_1035266 ?auto_1035265 ?auto_1035267 ?auto_1035268 ?auto_1035269 ?auto_1035270 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1035319 - DIRECTION
      ?auto_1035320 - MODE
      ?auto_1035321 - DIRECTION
      ?auto_1035318 - MODE
      ?auto_1035323 - DIRECTION
      ?auto_1035322 - MODE
      ?auto_1035324 - DIRECTION
      ?auto_1035325 - MODE
      ?auto_1035326 - DIRECTION
      ?auto_1035327 - MODE
    )
    :vars
    (
      ?auto_1035329 - INSTRUMENT
      ?auto_1035330 - SATELLITE
      ?auto_1035331 - DIRECTION
      ?auto_1035328 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1035321 ?auto_1035319 ) ) ( not ( = ?auto_1035323 ?auto_1035319 ) ) ( not ( = ?auto_1035323 ?auto_1035321 ) ) ( not ( = ?auto_1035324 ?auto_1035319 ) ) ( not ( = ?auto_1035324 ?auto_1035321 ) ) ( not ( = ?auto_1035324 ?auto_1035323 ) ) ( not ( = ?auto_1035326 ?auto_1035319 ) ) ( not ( = ?auto_1035326 ?auto_1035321 ) ) ( not ( = ?auto_1035326 ?auto_1035323 ) ) ( not ( = ?auto_1035326 ?auto_1035324 ) ) ( ON_BOARD ?auto_1035329 ?auto_1035330 ) ( SUPPORTS ?auto_1035329 ?auto_1035318 ) ( not ( = ?auto_1035321 ?auto_1035331 ) ) ( HAVE_IMAGE ?auto_1035319 ?auto_1035320 ) ( not ( = ?auto_1035319 ?auto_1035331 ) ) ( not ( = ?auto_1035320 ?auto_1035318 ) ) ( CALIBRATION_TARGET ?auto_1035329 ?auto_1035331 ) ( POINTING ?auto_1035330 ?auto_1035324 ) ( not ( = ?auto_1035331 ?auto_1035324 ) ) ( ON_BOARD ?auto_1035328 ?auto_1035330 ) ( POWER_ON ?auto_1035328 ) ( not ( = ?auto_1035329 ?auto_1035328 ) ) ( HAVE_IMAGE ?auto_1035323 ?auto_1035322 ) ( HAVE_IMAGE ?auto_1035324 ?auto_1035325 ) ( HAVE_IMAGE ?auto_1035326 ?auto_1035327 ) ( not ( = ?auto_1035320 ?auto_1035322 ) ) ( not ( = ?auto_1035320 ?auto_1035325 ) ) ( not ( = ?auto_1035320 ?auto_1035327 ) ) ( not ( = ?auto_1035318 ?auto_1035322 ) ) ( not ( = ?auto_1035318 ?auto_1035325 ) ) ( not ( = ?auto_1035318 ?auto_1035327 ) ) ( not ( = ?auto_1035323 ?auto_1035331 ) ) ( not ( = ?auto_1035322 ?auto_1035325 ) ) ( not ( = ?auto_1035322 ?auto_1035327 ) ) ( not ( = ?auto_1035325 ?auto_1035327 ) ) ( not ( = ?auto_1035326 ?auto_1035331 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1035319 ?auto_1035320 ?auto_1035321 ?auto_1035318 )
      ( GET-5IMAGE-VERIFY ?auto_1035319 ?auto_1035320 ?auto_1035321 ?auto_1035318 ?auto_1035323 ?auto_1035322 ?auto_1035324 ?auto_1035325 ?auto_1035326 ?auto_1035327 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1035891 - DIRECTION
      ?auto_1035892 - MODE
      ?auto_1035893 - DIRECTION
      ?auto_1035890 - MODE
      ?auto_1035895 - DIRECTION
      ?auto_1035894 - MODE
      ?auto_1035896 - DIRECTION
      ?auto_1035897 - MODE
      ?auto_1035898 - DIRECTION
      ?auto_1035899 - MODE
    )
    :vars
    (
      ?auto_1035901 - INSTRUMENT
      ?auto_1035902 - SATELLITE
      ?auto_1035903 - DIRECTION
      ?auto_1035900 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1035893 ?auto_1035891 ) ) ( not ( = ?auto_1035895 ?auto_1035891 ) ) ( not ( = ?auto_1035895 ?auto_1035893 ) ) ( not ( = ?auto_1035896 ?auto_1035891 ) ) ( not ( = ?auto_1035896 ?auto_1035893 ) ) ( not ( = ?auto_1035896 ?auto_1035895 ) ) ( not ( = ?auto_1035898 ?auto_1035891 ) ) ( not ( = ?auto_1035898 ?auto_1035893 ) ) ( not ( = ?auto_1035898 ?auto_1035895 ) ) ( not ( = ?auto_1035898 ?auto_1035896 ) ) ( ON_BOARD ?auto_1035901 ?auto_1035902 ) ( SUPPORTS ?auto_1035901 ?auto_1035890 ) ( not ( = ?auto_1035893 ?auto_1035903 ) ) ( HAVE_IMAGE ?auto_1035891 ?auto_1035892 ) ( not ( = ?auto_1035891 ?auto_1035903 ) ) ( not ( = ?auto_1035892 ?auto_1035890 ) ) ( CALIBRATION_TARGET ?auto_1035901 ?auto_1035903 ) ( POINTING ?auto_1035902 ?auto_1035895 ) ( not ( = ?auto_1035903 ?auto_1035895 ) ) ( ON_BOARD ?auto_1035900 ?auto_1035902 ) ( POWER_ON ?auto_1035900 ) ( not ( = ?auto_1035901 ?auto_1035900 ) ) ( HAVE_IMAGE ?auto_1035895 ?auto_1035894 ) ( HAVE_IMAGE ?auto_1035896 ?auto_1035897 ) ( HAVE_IMAGE ?auto_1035898 ?auto_1035899 ) ( not ( = ?auto_1035892 ?auto_1035894 ) ) ( not ( = ?auto_1035892 ?auto_1035897 ) ) ( not ( = ?auto_1035892 ?auto_1035899 ) ) ( not ( = ?auto_1035890 ?auto_1035894 ) ) ( not ( = ?auto_1035890 ?auto_1035897 ) ) ( not ( = ?auto_1035890 ?auto_1035899 ) ) ( not ( = ?auto_1035894 ?auto_1035897 ) ) ( not ( = ?auto_1035894 ?auto_1035899 ) ) ( not ( = ?auto_1035896 ?auto_1035903 ) ) ( not ( = ?auto_1035897 ?auto_1035899 ) ) ( not ( = ?auto_1035898 ?auto_1035903 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1035891 ?auto_1035892 ?auto_1035893 ?auto_1035890 )
      ( GET-5IMAGE-VERIFY ?auto_1035891 ?auto_1035892 ?auto_1035893 ?auto_1035890 ?auto_1035895 ?auto_1035894 ?auto_1035896 ?auto_1035897 ?auto_1035898 ?auto_1035899 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1047849 - DIRECTION
      ?auto_1047850 - MODE
      ?auto_1047851 - DIRECTION
      ?auto_1047848 - MODE
      ?auto_1047853 - DIRECTION
      ?auto_1047852 - MODE
      ?auto_1047854 - DIRECTION
      ?auto_1047855 - MODE
      ?auto_1047856 - DIRECTION
      ?auto_1047857 - MODE
    )
    :vars
    (
      ?auto_1047859 - INSTRUMENT
      ?auto_1047860 - SATELLITE
      ?auto_1047861 - DIRECTION
      ?auto_1047858 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1047851 ?auto_1047849 ) ) ( not ( = ?auto_1047853 ?auto_1047849 ) ) ( not ( = ?auto_1047853 ?auto_1047851 ) ) ( not ( = ?auto_1047854 ?auto_1047849 ) ) ( not ( = ?auto_1047854 ?auto_1047851 ) ) ( not ( = ?auto_1047854 ?auto_1047853 ) ) ( not ( = ?auto_1047856 ?auto_1047849 ) ) ( not ( = ?auto_1047856 ?auto_1047851 ) ) ( not ( = ?auto_1047856 ?auto_1047853 ) ) ( not ( = ?auto_1047856 ?auto_1047854 ) ) ( ON_BOARD ?auto_1047859 ?auto_1047860 ) ( SUPPORTS ?auto_1047859 ?auto_1047857 ) ( not ( = ?auto_1047856 ?auto_1047861 ) ) ( HAVE_IMAGE ?auto_1047851 ?auto_1047848 ) ( not ( = ?auto_1047851 ?auto_1047861 ) ) ( not ( = ?auto_1047848 ?auto_1047857 ) ) ( CALIBRATION_TARGET ?auto_1047859 ?auto_1047861 ) ( POINTING ?auto_1047860 ?auto_1047849 ) ( not ( = ?auto_1047861 ?auto_1047849 ) ) ( ON_BOARD ?auto_1047858 ?auto_1047860 ) ( POWER_ON ?auto_1047858 ) ( not ( = ?auto_1047859 ?auto_1047858 ) ) ( HAVE_IMAGE ?auto_1047849 ?auto_1047850 ) ( HAVE_IMAGE ?auto_1047853 ?auto_1047852 ) ( HAVE_IMAGE ?auto_1047854 ?auto_1047855 ) ( not ( = ?auto_1047850 ?auto_1047848 ) ) ( not ( = ?auto_1047850 ?auto_1047852 ) ) ( not ( = ?auto_1047850 ?auto_1047855 ) ) ( not ( = ?auto_1047850 ?auto_1047857 ) ) ( not ( = ?auto_1047848 ?auto_1047852 ) ) ( not ( = ?auto_1047848 ?auto_1047855 ) ) ( not ( = ?auto_1047853 ?auto_1047861 ) ) ( not ( = ?auto_1047852 ?auto_1047855 ) ) ( not ( = ?auto_1047852 ?auto_1047857 ) ) ( not ( = ?auto_1047854 ?auto_1047861 ) ) ( not ( = ?auto_1047855 ?auto_1047857 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1047851 ?auto_1047848 ?auto_1047856 ?auto_1047857 )
      ( GET-5IMAGE-VERIFY ?auto_1047849 ?auto_1047850 ?auto_1047851 ?auto_1047848 ?auto_1047853 ?auto_1047852 ?auto_1047854 ?auto_1047855 ?auto_1047856 ?auto_1047857 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1047905 - DIRECTION
      ?auto_1047906 - MODE
      ?auto_1047907 - DIRECTION
      ?auto_1047904 - MODE
      ?auto_1047909 - DIRECTION
      ?auto_1047908 - MODE
      ?auto_1047910 - DIRECTION
      ?auto_1047911 - MODE
      ?auto_1047912 - DIRECTION
      ?auto_1047913 - MODE
    )
    :vars
    (
      ?auto_1047915 - INSTRUMENT
      ?auto_1047916 - SATELLITE
      ?auto_1047917 - DIRECTION
      ?auto_1047914 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1047907 ?auto_1047905 ) ) ( not ( = ?auto_1047909 ?auto_1047905 ) ) ( not ( = ?auto_1047909 ?auto_1047907 ) ) ( not ( = ?auto_1047910 ?auto_1047905 ) ) ( not ( = ?auto_1047910 ?auto_1047907 ) ) ( not ( = ?auto_1047910 ?auto_1047909 ) ) ( not ( = ?auto_1047912 ?auto_1047905 ) ) ( not ( = ?auto_1047912 ?auto_1047907 ) ) ( not ( = ?auto_1047912 ?auto_1047909 ) ) ( not ( = ?auto_1047912 ?auto_1047910 ) ) ( ON_BOARD ?auto_1047915 ?auto_1047916 ) ( SUPPORTS ?auto_1047915 ?auto_1047911 ) ( not ( = ?auto_1047910 ?auto_1047917 ) ) ( HAVE_IMAGE ?auto_1047907 ?auto_1047904 ) ( not ( = ?auto_1047907 ?auto_1047917 ) ) ( not ( = ?auto_1047904 ?auto_1047911 ) ) ( CALIBRATION_TARGET ?auto_1047915 ?auto_1047917 ) ( POINTING ?auto_1047916 ?auto_1047905 ) ( not ( = ?auto_1047917 ?auto_1047905 ) ) ( ON_BOARD ?auto_1047914 ?auto_1047916 ) ( POWER_ON ?auto_1047914 ) ( not ( = ?auto_1047915 ?auto_1047914 ) ) ( HAVE_IMAGE ?auto_1047905 ?auto_1047906 ) ( HAVE_IMAGE ?auto_1047909 ?auto_1047908 ) ( HAVE_IMAGE ?auto_1047912 ?auto_1047913 ) ( not ( = ?auto_1047906 ?auto_1047904 ) ) ( not ( = ?auto_1047906 ?auto_1047908 ) ) ( not ( = ?auto_1047906 ?auto_1047911 ) ) ( not ( = ?auto_1047906 ?auto_1047913 ) ) ( not ( = ?auto_1047904 ?auto_1047908 ) ) ( not ( = ?auto_1047904 ?auto_1047913 ) ) ( not ( = ?auto_1047909 ?auto_1047917 ) ) ( not ( = ?auto_1047908 ?auto_1047911 ) ) ( not ( = ?auto_1047908 ?auto_1047913 ) ) ( not ( = ?auto_1047911 ?auto_1047913 ) ) ( not ( = ?auto_1047912 ?auto_1047917 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1047907 ?auto_1047904 ?auto_1047910 ?auto_1047911 )
      ( GET-5IMAGE-VERIFY ?auto_1047905 ?auto_1047906 ?auto_1047907 ?auto_1047904 ?auto_1047909 ?auto_1047908 ?auto_1047910 ?auto_1047911 ?auto_1047912 ?auto_1047913 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1048289 - DIRECTION
      ?auto_1048290 - MODE
      ?auto_1048291 - DIRECTION
      ?auto_1048288 - MODE
      ?auto_1048293 - DIRECTION
      ?auto_1048292 - MODE
      ?auto_1048294 - DIRECTION
      ?auto_1048295 - MODE
      ?auto_1048296 - DIRECTION
      ?auto_1048297 - MODE
    )
    :vars
    (
      ?auto_1048299 - INSTRUMENT
      ?auto_1048300 - SATELLITE
      ?auto_1048301 - DIRECTION
      ?auto_1048298 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1048291 ?auto_1048289 ) ) ( not ( = ?auto_1048293 ?auto_1048289 ) ) ( not ( = ?auto_1048293 ?auto_1048291 ) ) ( not ( = ?auto_1048294 ?auto_1048289 ) ) ( not ( = ?auto_1048294 ?auto_1048291 ) ) ( not ( = ?auto_1048294 ?auto_1048293 ) ) ( not ( = ?auto_1048296 ?auto_1048289 ) ) ( not ( = ?auto_1048296 ?auto_1048291 ) ) ( not ( = ?auto_1048296 ?auto_1048293 ) ) ( not ( = ?auto_1048296 ?auto_1048294 ) ) ( ON_BOARD ?auto_1048299 ?auto_1048300 ) ( SUPPORTS ?auto_1048299 ?auto_1048292 ) ( not ( = ?auto_1048293 ?auto_1048301 ) ) ( HAVE_IMAGE ?auto_1048291 ?auto_1048288 ) ( not ( = ?auto_1048291 ?auto_1048301 ) ) ( not ( = ?auto_1048288 ?auto_1048292 ) ) ( CALIBRATION_TARGET ?auto_1048299 ?auto_1048301 ) ( POINTING ?auto_1048300 ?auto_1048289 ) ( not ( = ?auto_1048301 ?auto_1048289 ) ) ( ON_BOARD ?auto_1048298 ?auto_1048300 ) ( POWER_ON ?auto_1048298 ) ( not ( = ?auto_1048299 ?auto_1048298 ) ) ( HAVE_IMAGE ?auto_1048289 ?auto_1048290 ) ( HAVE_IMAGE ?auto_1048294 ?auto_1048295 ) ( HAVE_IMAGE ?auto_1048296 ?auto_1048297 ) ( not ( = ?auto_1048290 ?auto_1048288 ) ) ( not ( = ?auto_1048290 ?auto_1048292 ) ) ( not ( = ?auto_1048290 ?auto_1048295 ) ) ( not ( = ?auto_1048290 ?auto_1048297 ) ) ( not ( = ?auto_1048288 ?auto_1048295 ) ) ( not ( = ?auto_1048288 ?auto_1048297 ) ) ( not ( = ?auto_1048292 ?auto_1048295 ) ) ( not ( = ?auto_1048292 ?auto_1048297 ) ) ( not ( = ?auto_1048294 ?auto_1048301 ) ) ( not ( = ?auto_1048295 ?auto_1048297 ) ) ( not ( = ?auto_1048296 ?auto_1048301 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1048291 ?auto_1048288 ?auto_1048293 ?auto_1048292 )
      ( GET-5IMAGE-VERIFY ?auto_1048289 ?auto_1048290 ?auto_1048291 ?auto_1048288 ?auto_1048293 ?auto_1048292 ?auto_1048294 ?auto_1048295 ?auto_1048296 ?auto_1048297 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1051371 - DIRECTION
      ?auto_1051372 - MODE
      ?auto_1051373 - DIRECTION
      ?auto_1051370 - MODE
      ?auto_1051375 - DIRECTION
      ?auto_1051374 - MODE
      ?auto_1051376 - DIRECTION
      ?auto_1051377 - MODE
      ?auto_1051378 - DIRECTION
      ?auto_1051379 - MODE
    )
    :vars
    (
      ?auto_1051381 - INSTRUMENT
      ?auto_1051382 - SATELLITE
      ?auto_1051383 - DIRECTION
      ?auto_1051380 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1051373 ?auto_1051371 ) ) ( not ( = ?auto_1051375 ?auto_1051371 ) ) ( not ( = ?auto_1051375 ?auto_1051373 ) ) ( not ( = ?auto_1051376 ?auto_1051371 ) ) ( not ( = ?auto_1051376 ?auto_1051373 ) ) ( not ( = ?auto_1051376 ?auto_1051375 ) ) ( not ( = ?auto_1051378 ?auto_1051371 ) ) ( not ( = ?auto_1051378 ?auto_1051373 ) ) ( not ( = ?auto_1051378 ?auto_1051375 ) ) ( not ( = ?auto_1051378 ?auto_1051376 ) ) ( ON_BOARD ?auto_1051381 ?auto_1051382 ) ( SUPPORTS ?auto_1051381 ?auto_1051370 ) ( not ( = ?auto_1051373 ?auto_1051383 ) ) ( HAVE_IMAGE ?auto_1051375 ?auto_1051374 ) ( not ( = ?auto_1051375 ?auto_1051383 ) ) ( not ( = ?auto_1051374 ?auto_1051370 ) ) ( CALIBRATION_TARGET ?auto_1051381 ?auto_1051383 ) ( POINTING ?auto_1051382 ?auto_1051371 ) ( not ( = ?auto_1051383 ?auto_1051371 ) ) ( ON_BOARD ?auto_1051380 ?auto_1051382 ) ( POWER_ON ?auto_1051380 ) ( not ( = ?auto_1051381 ?auto_1051380 ) ) ( HAVE_IMAGE ?auto_1051371 ?auto_1051372 ) ( HAVE_IMAGE ?auto_1051376 ?auto_1051377 ) ( HAVE_IMAGE ?auto_1051378 ?auto_1051379 ) ( not ( = ?auto_1051372 ?auto_1051370 ) ) ( not ( = ?auto_1051372 ?auto_1051374 ) ) ( not ( = ?auto_1051372 ?auto_1051377 ) ) ( not ( = ?auto_1051372 ?auto_1051379 ) ) ( not ( = ?auto_1051370 ?auto_1051377 ) ) ( not ( = ?auto_1051370 ?auto_1051379 ) ) ( not ( = ?auto_1051374 ?auto_1051377 ) ) ( not ( = ?auto_1051374 ?auto_1051379 ) ) ( not ( = ?auto_1051376 ?auto_1051383 ) ) ( not ( = ?auto_1051377 ?auto_1051379 ) ) ( not ( = ?auto_1051378 ?auto_1051383 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1051375 ?auto_1051374 ?auto_1051373 ?auto_1051370 )
      ( GET-5IMAGE-VERIFY ?auto_1051371 ?auto_1051372 ?auto_1051373 ?auto_1051370 ?auto_1051375 ?auto_1051374 ?auto_1051376 ?auto_1051377 ?auto_1051378 ?auto_1051379 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1053690 - DIRECTION
      ?auto_1053691 - MODE
      ?auto_1053692 - DIRECTION
      ?auto_1053689 - MODE
      ?auto_1053694 - DIRECTION
      ?auto_1053693 - MODE
      ?auto_1053695 - DIRECTION
      ?auto_1053696 - MODE
      ?auto_1053697 - DIRECTION
      ?auto_1053698 - MODE
    )
    :vars
    (
      ?auto_1053700 - INSTRUMENT
      ?auto_1053701 - SATELLITE
      ?auto_1053702 - DIRECTION
      ?auto_1053699 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1053692 ?auto_1053690 ) ) ( not ( = ?auto_1053694 ?auto_1053690 ) ) ( not ( = ?auto_1053694 ?auto_1053692 ) ) ( not ( = ?auto_1053695 ?auto_1053690 ) ) ( not ( = ?auto_1053695 ?auto_1053692 ) ) ( not ( = ?auto_1053695 ?auto_1053694 ) ) ( not ( = ?auto_1053697 ?auto_1053690 ) ) ( not ( = ?auto_1053697 ?auto_1053692 ) ) ( not ( = ?auto_1053697 ?auto_1053694 ) ) ( not ( = ?auto_1053697 ?auto_1053695 ) ) ( ON_BOARD ?auto_1053700 ?auto_1053701 ) ( SUPPORTS ?auto_1053700 ?auto_1053691 ) ( not ( = ?auto_1053690 ?auto_1053702 ) ) ( HAVE_IMAGE ?auto_1053692 ?auto_1053689 ) ( not ( = ?auto_1053692 ?auto_1053702 ) ) ( not ( = ?auto_1053689 ?auto_1053691 ) ) ( CALIBRATION_TARGET ?auto_1053700 ?auto_1053702 ) ( POINTING ?auto_1053701 ?auto_1053697 ) ( not ( = ?auto_1053702 ?auto_1053697 ) ) ( ON_BOARD ?auto_1053699 ?auto_1053701 ) ( POWER_ON ?auto_1053699 ) ( not ( = ?auto_1053700 ?auto_1053699 ) ) ( HAVE_IMAGE ?auto_1053694 ?auto_1053693 ) ( HAVE_IMAGE ?auto_1053695 ?auto_1053696 ) ( HAVE_IMAGE ?auto_1053697 ?auto_1053698 ) ( not ( = ?auto_1053691 ?auto_1053693 ) ) ( not ( = ?auto_1053691 ?auto_1053696 ) ) ( not ( = ?auto_1053691 ?auto_1053698 ) ) ( not ( = ?auto_1053689 ?auto_1053693 ) ) ( not ( = ?auto_1053689 ?auto_1053696 ) ) ( not ( = ?auto_1053689 ?auto_1053698 ) ) ( not ( = ?auto_1053694 ?auto_1053702 ) ) ( not ( = ?auto_1053693 ?auto_1053696 ) ) ( not ( = ?auto_1053693 ?auto_1053698 ) ) ( not ( = ?auto_1053695 ?auto_1053702 ) ) ( not ( = ?auto_1053696 ?auto_1053698 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1053692 ?auto_1053689 ?auto_1053690 ?auto_1053691 )
      ( GET-5IMAGE-VERIFY ?auto_1053690 ?auto_1053691 ?auto_1053692 ?auto_1053689 ?auto_1053694 ?auto_1053693 ?auto_1053695 ?auto_1053696 ?auto_1053697 ?auto_1053698 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1053747 - DIRECTION
      ?auto_1053748 - MODE
      ?auto_1053749 - DIRECTION
      ?auto_1053746 - MODE
      ?auto_1053751 - DIRECTION
      ?auto_1053750 - MODE
      ?auto_1053752 - DIRECTION
      ?auto_1053753 - MODE
      ?auto_1053754 - DIRECTION
      ?auto_1053755 - MODE
    )
    :vars
    (
      ?auto_1053757 - INSTRUMENT
      ?auto_1053758 - SATELLITE
      ?auto_1053759 - DIRECTION
      ?auto_1053756 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1053749 ?auto_1053747 ) ) ( not ( = ?auto_1053751 ?auto_1053747 ) ) ( not ( = ?auto_1053751 ?auto_1053749 ) ) ( not ( = ?auto_1053752 ?auto_1053747 ) ) ( not ( = ?auto_1053752 ?auto_1053749 ) ) ( not ( = ?auto_1053752 ?auto_1053751 ) ) ( not ( = ?auto_1053754 ?auto_1053747 ) ) ( not ( = ?auto_1053754 ?auto_1053749 ) ) ( not ( = ?auto_1053754 ?auto_1053751 ) ) ( not ( = ?auto_1053754 ?auto_1053752 ) ) ( ON_BOARD ?auto_1053757 ?auto_1053758 ) ( SUPPORTS ?auto_1053757 ?auto_1053748 ) ( not ( = ?auto_1053747 ?auto_1053759 ) ) ( HAVE_IMAGE ?auto_1053749 ?auto_1053746 ) ( not ( = ?auto_1053749 ?auto_1053759 ) ) ( not ( = ?auto_1053746 ?auto_1053748 ) ) ( CALIBRATION_TARGET ?auto_1053757 ?auto_1053759 ) ( POINTING ?auto_1053758 ?auto_1053752 ) ( not ( = ?auto_1053759 ?auto_1053752 ) ) ( ON_BOARD ?auto_1053756 ?auto_1053758 ) ( POWER_ON ?auto_1053756 ) ( not ( = ?auto_1053757 ?auto_1053756 ) ) ( HAVE_IMAGE ?auto_1053751 ?auto_1053750 ) ( HAVE_IMAGE ?auto_1053752 ?auto_1053753 ) ( HAVE_IMAGE ?auto_1053754 ?auto_1053755 ) ( not ( = ?auto_1053748 ?auto_1053750 ) ) ( not ( = ?auto_1053748 ?auto_1053753 ) ) ( not ( = ?auto_1053748 ?auto_1053755 ) ) ( not ( = ?auto_1053746 ?auto_1053750 ) ) ( not ( = ?auto_1053746 ?auto_1053753 ) ) ( not ( = ?auto_1053746 ?auto_1053755 ) ) ( not ( = ?auto_1053751 ?auto_1053759 ) ) ( not ( = ?auto_1053750 ?auto_1053753 ) ) ( not ( = ?auto_1053750 ?auto_1053755 ) ) ( not ( = ?auto_1053753 ?auto_1053755 ) ) ( not ( = ?auto_1053754 ?auto_1053759 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1053749 ?auto_1053746 ?auto_1053747 ?auto_1053748 )
      ( GET-5IMAGE-VERIFY ?auto_1053747 ?auto_1053748 ?auto_1053749 ?auto_1053746 ?auto_1053751 ?auto_1053750 ?auto_1053752 ?auto_1053753 ?auto_1053754 ?auto_1053755 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1054319 - DIRECTION
      ?auto_1054320 - MODE
      ?auto_1054321 - DIRECTION
      ?auto_1054318 - MODE
      ?auto_1054323 - DIRECTION
      ?auto_1054322 - MODE
      ?auto_1054324 - DIRECTION
      ?auto_1054325 - MODE
      ?auto_1054326 - DIRECTION
      ?auto_1054327 - MODE
    )
    :vars
    (
      ?auto_1054329 - INSTRUMENT
      ?auto_1054330 - SATELLITE
      ?auto_1054331 - DIRECTION
      ?auto_1054328 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1054321 ?auto_1054319 ) ) ( not ( = ?auto_1054323 ?auto_1054319 ) ) ( not ( = ?auto_1054323 ?auto_1054321 ) ) ( not ( = ?auto_1054324 ?auto_1054319 ) ) ( not ( = ?auto_1054324 ?auto_1054321 ) ) ( not ( = ?auto_1054324 ?auto_1054323 ) ) ( not ( = ?auto_1054326 ?auto_1054319 ) ) ( not ( = ?auto_1054326 ?auto_1054321 ) ) ( not ( = ?auto_1054326 ?auto_1054323 ) ) ( not ( = ?auto_1054326 ?auto_1054324 ) ) ( ON_BOARD ?auto_1054329 ?auto_1054330 ) ( SUPPORTS ?auto_1054329 ?auto_1054320 ) ( not ( = ?auto_1054319 ?auto_1054331 ) ) ( HAVE_IMAGE ?auto_1054321 ?auto_1054318 ) ( not ( = ?auto_1054321 ?auto_1054331 ) ) ( not ( = ?auto_1054318 ?auto_1054320 ) ) ( CALIBRATION_TARGET ?auto_1054329 ?auto_1054331 ) ( POINTING ?auto_1054330 ?auto_1054323 ) ( not ( = ?auto_1054331 ?auto_1054323 ) ) ( ON_BOARD ?auto_1054328 ?auto_1054330 ) ( POWER_ON ?auto_1054328 ) ( not ( = ?auto_1054329 ?auto_1054328 ) ) ( HAVE_IMAGE ?auto_1054323 ?auto_1054322 ) ( HAVE_IMAGE ?auto_1054324 ?auto_1054325 ) ( HAVE_IMAGE ?auto_1054326 ?auto_1054327 ) ( not ( = ?auto_1054320 ?auto_1054322 ) ) ( not ( = ?auto_1054320 ?auto_1054325 ) ) ( not ( = ?auto_1054320 ?auto_1054327 ) ) ( not ( = ?auto_1054318 ?auto_1054322 ) ) ( not ( = ?auto_1054318 ?auto_1054325 ) ) ( not ( = ?auto_1054318 ?auto_1054327 ) ) ( not ( = ?auto_1054322 ?auto_1054325 ) ) ( not ( = ?auto_1054322 ?auto_1054327 ) ) ( not ( = ?auto_1054324 ?auto_1054331 ) ) ( not ( = ?auto_1054325 ?auto_1054327 ) ) ( not ( = ?auto_1054326 ?auto_1054331 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1054321 ?auto_1054318 ?auto_1054319 ?auto_1054320 )
      ( GET-5IMAGE-VERIFY ?auto_1054319 ?auto_1054320 ?auto_1054321 ?auto_1054318 ?auto_1054323 ?auto_1054322 ?auto_1054324 ?auto_1054325 ?auto_1054326 ?auto_1054327 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_1058867 - DIRECTION
      ?auto_1058868 - MODE
      ?auto_1058869 - DIRECTION
      ?auto_1058866 - MODE
      ?auto_1058871 - DIRECTION
      ?auto_1058870 - MODE
      ?auto_1058872 - DIRECTION
      ?auto_1058873 - MODE
      ?auto_1058874 - DIRECTION
      ?auto_1058875 - MODE
    )
    :vars
    (
      ?auto_1058877 - INSTRUMENT
      ?auto_1058878 - SATELLITE
      ?auto_1058879 - DIRECTION
      ?auto_1058876 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1058869 ?auto_1058867 ) ) ( not ( = ?auto_1058871 ?auto_1058867 ) ) ( not ( = ?auto_1058871 ?auto_1058869 ) ) ( not ( = ?auto_1058872 ?auto_1058867 ) ) ( not ( = ?auto_1058872 ?auto_1058869 ) ) ( not ( = ?auto_1058872 ?auto_1058871 ) ) ( not ( = ?auto_1058874 ?auto_1058867 ) ) ( not ( = ?auto_1058874 ?auto_1058869 ) ) ( not ( = ?auto_1058874 ?auto_1058871 ) ) ( not ( = ?auto_1058874 ?auto_1058872 ) ) ( ON_BOARD ?auto_1058877 ?auto_1058878 ) ( SUPPORTS ?auto_1058877 ?auto_1058868 ) ( not ( = ?auto_1058867 ?auto_1058879 ) ) ( HAVE_IMAGE ?auto_1058871 ?auto_1058870 ) ( not ( = ?auto_1058871 ?auto_1058879 ) ) ( not ( = ?auto_1058870 ?auto_1058868 ) ) ( CALIBRATION_TARGET ?auto_1058877 ?auto_1058879 ) ( POINTING ?auto_1058878 ?auto_1058869 ) ( not ( = ?auto_1058879 ?auto_1058869 ) ) ( ON_BOARD ?auto_1058876 ?auto_1058878 ) ( POWER_ON ?auto_1058876 ) ( not ( = ?auto_1058877 ?auto_1058876 ) ) ( HAVE_IMAGE ?auto_1058869 ?auto_1058866 ) ( HAVE_IMAGE ?auto_1058872 ?auto_1058873 ) ( HAVE_IMAGE ?auto_1058874 ?auto_1058875 ) ( not ( = ?auto_1058868 ?auto_1058866 ) ) ( not ( = ?auto_1058868 ?auto_1058873 ) ) ( not ( = ?auto_1058868 ?auto_1058875 ) ) ( not ( = ?auto_1058866 ?auto_1058870 ) ) ( not ( = ?auto_1058866 ?auto_1058873 ) ) ( not ( = ?auto_1058866 ?auto_1058875 ) ) ( not ( = ?auto_1058870 ?auto_1058873 ) ) ( not ( = ?auto_1058870 ?auto_1058875 ) ) ( not ( = ?auto_1058872 ?auto_1058879 ) ) ( not ( = ?auto_1058873 ?auto_1058875 ) ) ( not ( = ?auto_1058874 ?auto_1058879 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1058871 ?auto_1058870 ?auto_1058867 ?auto_1058868 )
      ( GET-5IMAGE-VERIFY ?auto_1058867 ?auto_1058868 ?auto_1058869 ?auto_1058866 ?auto_1058871 ?auto_1058870 ?auto_1058872 ?auto_1058873 ?auto_1058874 ?auto_1058875 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1138082 - DIRECTION
      ?auto_1138083 - MODE
      ?auto_1138084 - DIRECTION
      ?auto_1138081 - MODE
      ?auto_1138086 - DIRECTION
      ?auto_1138085 - MODE
      ?auto_1138087 - DIRECTION
      ?auto_1138088 - MODE
    )
    :vars
    (
      ?auto_1138090 - INSTRUMENT
      ?auto_1138089 - SATELLITE
      ?auto_1138091 - DIRECTION
      ?auto_1138092 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1138084 ?auto_1138082 ) ) ( not ( = ?auto_1138086 ?auto_1138082 ) ) ( not ( = ?auto_1138086 ?auto_1138084 ) ) ( not ( = ?auto_1138087 ?auto_1138082 ) ) ( not ( = ?auto_1138087 ?auto_1138084 ) ) ( not ( = ?auto_1138087 ?auto_1138086 ) ) ( ON_BOARD ?auto_1138090 ?auto_1138089 ) ( SUPPORTS ?auto_1138090 ?auto_1138088 ) ( not ( = ?auto_1138087 ?auto_1138091 ) ) ( HAVE_IMAGE ?auto_1138082 ?auto_1138083 ) ( not ( = ?auto_1138082 ?auto_1138091 ) ) ( not ( = ?auto_1138083 ?auto_1138088 ) ) ( CALIBRATION_TARGET ?auto_1138090 ?auto_1138091 ) ( not ( = ?auto_1138091 ?auto_1138084 ) ) ( ON_BOARD ?auto_1138092 ?auto_1138089 ) ( POWER_ON ?auto_1138092 ) ( not ( = ?auto_1138090 ?auto_1138092 ) ) ( POINTING ?auto_1138089 ?auto_1138091 ) ( HAVE_IMAGE ?auto_1138084 ?auto_1138081 ) ( HAVE_IMAGE ?auto_1138086 ?auto_1138085 ) ( not ( = ?auto_1138083 ?auto_1138081 ) ) ( not ( = ?auto_1138083 ?auto_1138085 ) ) ( not ( = ?auto_1138081 ?auto_1138085 ) ) ( not ( = ?auto_1138081 ?auto_1138088 ) ) ( not ( = ?auto_1138086 ?auto_1138091 ) ) ( not ( = ?auto_1138085 ?auto_1138088 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1138082 ?auto_1138083 ?auto_1138087 ?auto_1138088 )
      ( GET-4IMAGE-VERIFY ?auto_1138082 ?auto_1138083 ?auto_1138084 ?auto_1138081 ?auto_1138086 ?auto_1138085 ?auto_1138087 ?auto_1138088 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1138130 - DIRECTION
      ?auto_1138131 - MODE
      ?auto_1138132 - DIRECTION
      ?auto_1138129 - MODE
      ?auto_1138134 - DIRECTION
      ?auto_1138133 - MODE
      ?auto_1138135 - DIRECTION
      ?auto_1138136 - MODE
    )
    :vars
    (
      ?auto_1138138 - INSTRUMENT
      ?auto_1138137 - SATELLITE
      ?auto_1138139 - DIRECTION
      ?auto_1138140 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1138132 ?auto_1138130 ) ) ( not ( = ?auto_1138134 ?auto_1138130 ) ) ( not ( = ?auto_1138134 ?auto_1138132 ) ) ( not ( = ?auto_1138135 ?auto_1138130 ) ) ( not ( = ?auto_1138135 ?auto_1138132 ) ) ( not ( = ?auto_1138135 ?auto_1138134 ) ) ( ON_BOARD ?auto_1138138 ?auto_1138137 ) ( SUPPORTS ?auto_1138138 ?auto_1138133 ) ( not ( = ?auto_1138134 ?auto_1138139 ) ) ( HAVE_IMAGE ?auto_1138130 ?auto_1138131 ) ( not ( = ?auto_1138130 ?auto_1138139 ) ) ( not ( = ?auto_1138131 ?auto_1138133 ) ) ( CALIBRATION_TARGET ?auto_1138138 ?auto_1138139 ) ( not ( = ?auto_1138139 ?auto_1138132 ) ) ( ON_BOARD ?auto_1138140 ?auto_1138137 ) ( POWER_ON ?auto_1138140 ) ( not ( = ?auto_1138138 ?auto_1138140 ) ) ( POINTING ?auto_1138137 ?auto_1138139 ) ( HAVE_IMAGE ?auto_1138132 ?auto_1138129 ) ( HAVE_IMAGE ?auto_1138135 ?auto_1138136 ) ( not ( = ?auto_1138131 ?auto_1138129 ) ) ( not ( = ?auto_1138131 ?auto_1138136 ) ) ( not ( = ?auto_1138129 ?auto_1138133 ) ) ( not ( = ?auto_1138129 ?auto_1138136 ) ) ( not ( = ?auto_1138133 ?auto_1138136 ) ) ( not ( = ?auto_1138135 ?auto_1138139 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1138130 ?auto_1138131 ?auto_1138134 ?auto_1138133 )
      ( GET-4IMAGE-VERIFY ?auto_1138130 ?auto_1138131 ?auto_1138132 ?auto_1138129 ?auto_1138134 ?auto_1138133 ?auto_1138135 ?auto_1138136 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1138476 - DIRECTION
      ?auto_1138477 - MODE
      ?auto_1138478 - DIRECTION
      ?auto_1138475 - MODE
      ?auto_1138480 - DIRECTION
      ?auto_1138479 - MODE
      ?auto_1138481 - DIRECTION
      ?auto_1138482 - MODE
    )
    :vars
    (
      ?auto_1138484 - INSTRUMENT
      ?auto_1138483 - SATELLITE
      ?auto_1138485 - DIRECTION
      ?auto_1138486 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1138478 ?auto_1138476 ) ) ( not ( = ?auto_1138480 ?auto_1138476 ) ) ( not ( = ?auto_1138480 ?auto_1138478 ) ) ( not ( = ?auto_1138481 ?auto_1138476 ) ) ( not ( = ?auto_1138481 ?auto_1138478 ) ) ( not ( = ?auto_1138481 ?auto_1138480 ) ) ( ON_BOARD ?auto_1138484 ?auto_1138483 ) ( SUPPORTS ?auto_1138484 ?auto_1138475 ) ( not ( = ?auto_1138478 ?auto_1138485 ) ) ( HAVE_IMAGE ?auto_1138476 ?auto_1138477 ) ( not ( = ?auto_1138476 ?auto_1138485 ) ) ( not ( = ?auto_1138477 ?auto_1138475 ) ) ( CALIBRATION_TARGET ?auto_1138484 ?auto_1138485 ) ( not ( = ?auto_1138485 ?auto_1138480 ) ) ( ON_BOARD ?auto_1138486 ?auto_1138483 ) ( POWER_ON ?auto_1138486 ) ( not ( = ?auto_1138484 ?auto_1138486 ) ) ( POINTING ?auto_1138483 ?auto_1138485 ) ( HAVE_IMAGE ?auto_1138480 ?auto_1138479 ) ( HAVE_IMAGE ?auto_1138481 ?auto_1138482 ) ( not ( = ?auto_1138477 ?auto_1138479 ) ) ( not ( = ?auto_1138477 ?auto_1138482 ) ) ( not ( = ?auto_1138475 ?auto_1138479 ) ) ( not ( = ?auto_1138475 ?auto_1138482 ) ) ( not ( = ?auto_1138479 ?auto_1138482 ) ) ( not ( = ?auto_1138481 ?auto_1138485 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1138476 ?auto_1138477 ?auto_1138478 ?auto_1138475 )
      ( GET-4IMAGE-VERIFY ?auto_1138476 ?auto_1138477 ?auto_1138478 ?auto_1138475 ?auto_1138480 ?auto_1138479 ?auto_1138481 ?auto_1138482 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1101338 - DIRECTION
      ?auto_1101339 - MODE
      ?auto_1101340 - DIRECTION
      ?auto_1101337 - MODE
      ?auto_1101342 - DIRECTION
      ?auto_1101341 - MODE
      ?auto_1101343 - DIRECTION
      ?auto_1101344 - MODE
    )
    :vars
    (
      ?auto_1101346 - INSTRUMENT
      ?auto_1101347 - SATELLITE
      ?auto_1101345 - DIRECTION
      ?auto_1101349 - DIRECTION
      ?auto_1101348 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1101340 ?auto_1101338 ) ) ( not ( = ?auto_1101342 ?auto_1101338 ) ) ( not ( = ?auto_1101342 ?auto_1101340 ) ) ( not ( = ?auto_1101343 ?auto_1101338 ) ) ( not ( = ?auto_1101343 ?auto_1101340 ) ) ( not ( = ?auto_1101343 ?auto_1101342 ) ) ( ON_BOARD ?auto_1101346 ?auto_1101347 ) ( SUPPORTS ?auto_1101346 ?auto_1101344 ) ( not ( = ?auto_1101343 ?auto_1101345 ) ) ( HAVE_IMAGE ?auto_1101340 ?auto_1101337 ) ( not ( = ?auto_1101340 ?auto_1101345 ) ) ( not ( = ?auto_1101337 ?auto_1101344 ) ) ( CALIBRATION_TARGET ?auto_1101346 ?auto_1101345 ) ( not ( = ?auto_1101345 ?auto_1101349 ) ) ( not ( = ?auto_1101343 ?auto_1101349 ) ) ( not ( = ?auto_1101340 ?auto_1101349 ) ) ( ON_BOARD ?auto_1101348 ?auto_1101347 ) ( POWER_ON ?auto_1101348 ) ( not ( = ?auto_1101346 ?auto_1101348 ) ) ( POINTING ?auto_1101347 ?auto_1101345 ) ( HAVE_IMAGE ?auto_1101338 ?auto_1101339 ) ( HAVE_IMAGE ?auto_1101342 ?auto_1101341 ) ( not ( = ?auto_1101338 ?auto_1101345 ) ) ( not ( = ?auto_1101338 ?auto_1101349 ) ) ( not ( = ?auto_1101339 ?auto_1101337 ) ) ( not ( = ?auto_1101339 ?auto_1101341 ) ) ( not ( = ?auto_1101339 ?auto_1101344 ) ) ( not ( = ?auto_1101337 ?auto_1101341 ) ) ( not ( = ?auto_1101342 ?auto_1101345 ) ) ( not ( = ?auto_1101342 ?auto_1101349 ) ) ( not ( = ?auto_1101341 ?auto_1101344 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1101340 ?auto_1101337 ?auto_1101343 ?auto_1101344 )
      ( GET-4IMAGE-VERIFY ?auto_1101338 ?auto_1101339 ?auto_1101340 ?auto_1101337 ?auto_1101342 ?auto_1101341 ?auto_1101343 ?auto_1101344 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1101389 - DIRECTION
      ?auto_1101390 - MODE
      ?auto_1101391 - DIRECTION
      ?auto_1101388 - MODE
      ?auto_1101393 - DIRECTION
      ?auto_1101392 - MODE
      ?auto_1101394 - DIRECTION
      ?auto_1101395 - MODE
    )
    :vars
    (
      ?auto_1101397 - INSTRUMENT
      ?auto_1101398 - SATELLITE
      ?auto_1101396 - DIRECTION
      ?auto_1101400 - DIRECTION
      ?auto_1101399 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1101391 ?auto_1101389 ) ) ( not ( = ?auto_1101393 ?auto_1101389 ) ) ( not ( = ?auto_1101393 ?auto_1101391 ) ) ( not ( = ?auto_1101394 ?auto_1101389 ) ) ( not ( = ?auto_1101394 ?auto_1101391 ) ) ( not ( = ?auto_1101394 ?auto_1101393 ) ) ( ON_BOARD ?auto_1101397 ?auto_1101398 ) ( SUPPORTS ?auto_1101397 ?auto_1101392 ) ( not ( = ?auto_1101393 ?auto_1101396 ) ) ( HAVE_IMAGE ?auto_1101391 ?auto_1101388 ) ( not ( = ?auto_1101391 ?auto_1101396 ) ) ( not ( = ?auto_1101388 ?auto_1101392 ) ) ( CALIBRATION_TARGET ?auto_1101397 ?auto_1101396 ) ( not ( = ?auto_1101396 ?auto_1101400 ) ) ( not ( = ?auto_1101393 ?auto_1101400 ) ) ( not ( = ?auto_1101391 ?auto_1101400 ) ) ( ON_BOARD ?auto_1101399 ?auto_1101398 ) ( POWER_ON ?auto_1101399 ) ( not ( = ?auto_1101397 ?auto_1101399 ) ) ( POINTING ?auto_1101398 ?auto_1101396 ) ( HAVE_IMAGE ?auto_1101389 ?auto_1101390 ) ( HAVE_IMAGE ?auto_1101394 ?auto_1101395 ) ( not ( = ?auto_1101389 ?auto_1101396 ) ) ( not ( = ?auto_1101389 ?auto_1101400 ) ) ( not ( = ?auto_1101390 ?auto_1101388 ) ) ( not ( = ?auto_1101390 ?auto_1101392 ) ) ( not ( = ?auto_1101390 ?auto_1101395 ) ) ( not ( = ?auto_1101388 ?auto_1101395 ) ) ( not ( = ?auto_1101392 ?auto_1101395 ) ) ( not ( = ?auto_1101394 ?auto_1101396 ) ) ( not ( = ?auto_1101394 ?auto_1101400 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1101391 ?auto_1101388 ?auto_1101393 ?auto_1101392 )
      ( GET-4IMAGE-VERIFY ?auto_1101389 ?auto_1101390 ?auto_1101391 ?auto_1101388 ?auto_1101393 ?auto_1101392 ?auto_1101394 ?auto_1101395 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1101556 - DIRECTION
      ?auto_1101557 - MODE
      ?auto_1101558 - DIRECTION
      ?auto_1101555 - MODE
      ?auto_1101560 - DIRECTION
      ?auto_1101559 - MODE
      ?auto_1101561 - DIRECTION
      ?auto_1101562 - MODE
    )
    :vars
    (
      ?auto_1101564 - INSTRUMENT
      ?auto_1101565 - SATELLITE
      ?auto_1101563 - DIRECTION
      ?auto_1101567 - DIRECTION
      ?auto_1101566 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1101558 ?auto_1101556 ) ) ( not ( = ?auto_1101560 ?auto_1101556 ) ) ( not ( = ?auto_1101560 ?auto_1101558 ) ) ( not ( = ?auto_1101561 ?auto_1101556 ) ) ( not ( = ?auto_1101561 ?auto_1101558 ) ) ( not ( = ?auto_1101561 ?auto_1101560 ) ) ( ON_BOARD ?auto_1101564 ?auto_1101565 ) ( SUPPORTS ?auto_1101564 ?auto_1101562 ) ( not ( = ?auto_1101561 ?auto_1101563 ) ) ( HAVE_IMAGE ?auto_1101560 ?auto_1101559 ) ( not ( = ?auto_1101560 ?auto_1101563 ) ) ( not ( = ?auto_1101559 ?auto_1101562 ) ) ( CALIBRATION_TARGET ?auto_1101564 ?auto_1101563 ) ( not ( = ?auto_1101563 ?auto_1101567 ) ) ( not ( = ?auto_1101561 ?auto_1101567 ) ) ( not ( = ?auto_1101560 ?auto_1101567 ) ) ( ON_BOARD ?auto_1101566 ?auto_1101565 ) ( POWER_ON ?auto_1101566 ) ( not ( = ?auto_1101564 ?auto_1101566 ) ) ( POINTING ?auto_1101565 ?auto_1101563 ) ( HAVE_IMAGE ?auto_1101556 ?auto_1101557 ) ( HAVE_IMAGE ?auto_1101558 ?auto_1101555 ) ( not ( = ?auto_1101556 ?auto_1101563 ) ) ( not ( = ?auto_1101556 ?auto_1101567 ) ) ( not ( = ?auto_1101557 ?auto_1101555 ) ) ( not ( = ?auto_1101557 ?auto_1101559 ) ) ( not ( = ?auto_1101557 ?auto_1101562 ) ) ( not ( = ?auto_1101558 ?auto_1101563 ) ) ( not ( = ?auto_1101558 ?auto_1101567 ) ) ( not ( = ?auto_1101555 ?auto_1101559 ) ) ( not ( = ?auto_1101555 ?auto_1101562 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1101560 ?auto_1101559 ?auto_1101561 ?auto_1101562 )
      ( GET-4IMAGE-VERIFY ?auto_1101556 ?auto_1101557 ?auto_1101558 ?auto_1101555 ?auto_1101560 ?auto_1101559 ?auto_1101561 ?auto_1101562 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1101613 - DIRECTION
      ?auto_1101614 - MODE
      ?auto_1101615 - DIRECTION
      ?auto_1101612 - MODE
      ?auto_1101617 - DIRECTION
      ?auto_1101616 - MODE
      ?auto_1101618 - DIRECTION
      ?auto_1101619 - MODE
    )
    :vars
    (
      ?auto_1101621 - INSTRUMENT
      ?auto_1101622 - SATELLITE
      ?auto_1101620 - DIRECTION
      ?auto_1101624 - DIRECTION
      ?auto_1101623 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1101615 ?auto_1101613 ) ) ( not ( = ?auto_1101617 ?auto_1101613 ) ) ( not ( = ?auto_1101617 ?auto_1101615 ) ) ( not ( = ?auto_1101618 ?auto_1101613 ) ) ( not ( = ?auto_1101618 ?auto_1101615 ) ) ( not ( = ?auto_1101618 ?auto_1101617 ) ) ( ON_BOARD ?auto_1101621 ?auto_1101622 ) ( SUPPORTS ?auto_1101621 ?auto_1101616 ) ( not ( = ?auto_1101617 ?auto_1101620 ) ) ( HAVE_IMAGE ?auto_1101618 ?auto_1101619 ) ( not ( = ?auto_1101618 ?auto_1101620 ) ) ( not ( = ?auto_1101619 ?auto_1101616 ) ) ( CALIBRATION_TARGET ?auto_1101621 ?auto_1101620 ) ( not ( = ?auto_1101620 ?auto_1101624 ) ) ( not ( = ?auto_1101617 ?auto_1101624 ) ) ( not ( = ?auto_1101618 ?auto_1101624 ) ) ( ON_BOARD ?auto_1101623 ?auto_1101622 ) ( POWER_ON ?auto_1101623 ) ( not ( = ?auto_1101621 ?auto_1101623 ) ) ( POINTING ?auto_1101622 ?auto_1101620 ) ( HAVE_IMAGE ?auto_1101613 ?auto_1101614 ) ( HAVE_IMAGE ?auto_1101615 ?auto_1101612 ) ( not ( = ?auto_1101613 ?auto_1101620 ) ) ( not ( = ?auto_1101613 ?auto_1101624 ) ) ( not ( = ?auto_1101614 ?auto_1101612 ) ) ( not ( = ?auto_1101614 ?auto_1101616 ) ) ( not ( = ?auto_1101614 ?auto_1101619 ) ) ( not ( = ?auto_1101615 ?auto_1101620 ) ) ( not ( = ?auto_1101615 ?auto_1101624 ) ) ( not ( = ?auto_1101612 ?auto_1101616 ) ) ( not ( = ?auto_1101612 ?auto_1101619 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1101618 ?auto_1101619 ?auto_1101617 ?auto_1101616 )
      ( GET-4IMAGE-VERIFY ?auto_1101613 ?auto_1101614 ?auto_1101615 ?auto_1101612 ?auto_1101617 ?auto_1101616 ?auto_1101618 ?auto_1101619 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1101833 - DIRECTION
      ?auto_1101834 - MODE
      ?auto_1101835 - DIRECTION
      ?auto_1101832 - MODE
      ?auto_1101837 - DIRECTION
      ?auto_1101836 - MODE
      ?auto_1101838 - DIRECTION
      ?auto_1101839 - MODE
    )
    :vars
    (
      ?auto_1101841 - INSTRUMENT
      ?auto_1101842 - SATELLITE
      ?auto_1101840 - DIRECTION
      ?auto_1101844 - DIRECTION
      ?auto_1101843 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1101835 ?auto_1101833 ) ) ( not ( = ?auto_1101837 ?auto_1101833 ) ) ( not ( = ?auto_1101837 ?auto_1101835 ) ) ( not ( = ?auto_1101838 ?auto_1101833 ) ) ( not ( = ?auto_1101838 ?auto_1101835 ) ) ( not ( = ?auto_1101838 ?auto_1101837 ) ) ( ON_BOARD ?auto_1101841 ?auto_1101842 ) ( SUPPORTS ?auto_1101841 ?auto_1101832 ) ( not ( = ?auto_1101835 ?auto_1101840 ) ) ( HAVE_IMAGE ?auto_1101837 ?auto_1101836 ) ( not ( = ?auto_1101837 ?auto_1101840 ) ) ( not ( = ?auto_1101836 ?auto_1101832 ) ) ( CALIBRATION_TARGET ?auto_1101841 ?auto_1101840 ) ( not ( = ?auto_1101840 ?auto_1101844 ) ) ( not ( = ?auto_1101835 ?auto_1101844 ) ) ( not ( = ?auto_1101837 ?auto_1101844 ) ) ( ON_BOARD ?auto_1101843 ?auto_1101842 ) ( POWER_ON ?auto_1101843 ) ( not ( = ?auto_1101841 ?auto_1101843 ) ) ( POINTING ?auto_1101842 ?auto_1101840 ) ( HAVE_IMAGE ?auto_1101833 ?auto_1101834 ) ( HAVE_IMAGE ?auto_1101838 ?auto_1101839 ) ( not ( = ?auto_1101833 ?auto_1101840 ) ) ( not ( = ?auto_1101833 ?auto_1101844 ) ) ( not ( = ?auto_1101834 ?auto_1101832 ) ) ( not ( = ?auto_1101834 ?auto_1101836 ) ) ( not ( = ?auto_1101834 ?auto_1101839 ) ) ( not ( = ?auto_1101832 ?auto_1101839 ) ) ( not ( = ?auto_1101836 ?auto_1101839 ) ) ( not ( = ?auto_1101838 ?auto_1101840 ) ) ( not ( = ?auto_1101838 ?auto_1101844 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1101837 ?auto_1101836 ?auto_1101835 ?auto_1101832 )
      ( GET-4IMAGE-VERIFY ?auto_1101833 ?auto_1101834 ?auto_1101835 ?auto_1101832 ?auto_1101837 ?auto_1101836 ?auto_1101838 ?auto_1101839 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1101943 - DIRECTION
      ?auto_1101944 - MODE
      ?auto_1101945 - DIRECTION
      ?auto_1101942 - MODE
      ?auto_1101947 - DIRECTION
      ?auto_1101946 - MODE
      ?auto_1101948 - DIRECTION
      ?auto_1101949 - MODE
    )
    :vars
    (
      ?auto_1101951 - INSTRUMENT
      ?auto_1101952 - SATELLITE
      ?auto_1101950 - DIRECTION
      ?auto_1101954 - DIRECTION
      ?auto_1101953 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1101945 ?auto_1101943 ) ) ( not ( = ?auto_1101947 ?auto_1101943 ) ) ( not ( = ?auto_1101947 ?auto_1101945 ) ) ( not ( = ?auto_1101948 ?auto_1101943 ) ) ( not ( = ?auto_1101948 ?auto_1101945 ) ) ( not ( = ?auto_1101948 ?auto_1101947 ) ) ( ON_BOARD ?auto_1101951 ?auto_1101952 ) ( SUPPORTS ?auto_1101951 ?auto_1101942 ) ( not ( = ?auto_1101945 ?auto_1101950 ) ) ( HAVE_IMAGE ?auto_1101948 ?auto_1101949 ) ( not ( = ?auto_1101948 ?auto_1101950 ) ) ( not ( = ?auto_1101949 ?auto_1101942 ) ) ( CALIBRATION_TARGET ?auto_1101951 ?auto_1101950 ) ( not ( = ?auto_1101950 ?auto_1101954 ) ) ( not ( = ?auto_1101945 ?auto_1101954 ) ) ( not ( = ?auto_1101948 ?auto_1101954 ) ) ( ON_BOARD ?auto_1101953 ?auto_1101952 ) ( POWER_ON ?auto_1101953 ) ( not ( = ?auto_1101951 ?auto_1101953 ) ) ( POINTING ?auto_1101952 ?auto_1101950 ) ( HAVE_IMAGE ?auto_1101943 ?auto_1101944 ) ( HAVE_IMAGE ?auto_1101947 ?auto_1101946 ) ( not ( = ?auto_1101943 ?auto_1101950 ) ) ( not ( = ?auto_1101943 ?auto_1101954 ) ) ( not ( = ?auto_1101944 ?auto_1101942 ) ) ( not ( = ?auto_1101944 ?auto_1101946 ) ) ( not ( = ?auto_1101944 ?auto_1101949 ) ) ( not ( = ?auto_1101942 ?auto_1101946 ) ) ( not ( = ?auto_1101947 ?auto_1101950 ) ) ( not ( = ?auto_1101947 ?auto_1101954 ) ) ( not ( = ?auto_1101946 ?auto_1101949 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1101948 ?auto_1101949 ?auto_1101945 ?auto_1101942 )
      ( GET-4IMAGE-VERIFY ?auto_1101943 ?auto_1101944 ?auto_1101945 ?auto_1101942 ?auto_1101947 ?auto_1101946 ?auto_1101948 ?auto_1101949 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1141232 - DIRECTION
      ?auto_1141233 - MODE
      ?auto_1141234 - DIRECTION
      ?auto_1141231 - MODE
      ?auto_1141236 - DIRECTION
      ?auto_1141235 - MODE
      ?auto_1141237 - DIRECTION
      ?auto_1141238 - MODE
    )
    :vars
    (
      ?auto_1141240 - INSTRUMENT
      ?auto_1141239 - SATELLITE
      ?auto_1141241 - DIRECTION
      ?auto_1141242 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1141234 ?auto_1141232 ) ) ( not ( = ?auto_1141236 ?auto_1141232 ) ) ( not ( = ?auto_1141236 ?auto_1141234 ) ) ( not ( = ?auto_1141237 ?auto_1141232 ) ) ( not ( = ?auto_1141237 ?auto_1141234 ) ) ( not ( = ?auto_1141237 ?auto_1141236 ) ) ( ON_BOARD ?auto_1141240 ?auto_1141239 ) ( SUPPORTS ?auto_1141240 ?auto_1141233 ) ( not ( = ?auto_1141232 ?auto_1141241 ) ) ( HAVE_IMAGE ?auto_1141234 ?auto_1141231 ) ( not ( = ?auto_1141234 ?auto_1141241 ) ) ( not ( = ?auto_1141231 ?auto_1141233 ) ) ( CALIBRATION_TARGET ?auto_1141240 ?auto_1141241 ) ( not ( = ?auto_1141241 ?auto_1141236 ) ) ( ON_BOARD ?auto_1141242 ?auto_1141239 ) ( POWER_ON ?auto_1141242 ) ( not ( = ?auto_1141240 ?auto_1141242 ) ) ( POINTING ?auto_1141239 ?auto_1141241 ) ( HAVE_IMAGE ?auto_1141236 ?auto_1141235 ) ( HAVE_IMAGE ?auto_1141237 ?auto_1141238 ) ( not ( = ?auto_1141233 ?auto_1141235 ) ) ( not ( = ?auto_1141233 ?auto_1141238 ) ) ( not ( = ?auto_1141231 ?auto_1141235 ) ) ( not ( = ?auto_1141231 ?auto_1141238 ) ) ( not ( = ?auto_1141235 ?auto_1141238 ) ) ( not ( = ?auto_1141237 ?auto_1141241 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1141234 ?auto_1141231 ?auto_1141232 ?auto_1141233 )
      ( GET-4IMAGE-VERIFY ?auto_1141232 ?auto_1141233 ?auto_1141234 ?auto_1141231 ?auto_1141236 ?auto_1141235 ?auto_1141237 ?auto_1141238 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1104146 - DIRECTION
      ?auto_1104147 - MODE
      ?auto_1104148 - DIRECTION
      ?auto_1104145 - MODE
      ?auto_1104150 - DIRECTION
      ?auto_1104149 - MODE
      ?auto_1104151 - DIRECTION
      ?auto_1104152 - MODE
    )
    :vars
    (
      ?auto_1104154 - INSTRUMENT
      ?auto_1104155 - SATELLITE
      ?auto_1104153 - DIRECTION
      ?auto_1104157 - DIRECTION
      ?auto_1104156 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1104148 ?auto_1104146 ) ) ( not ( = ?auto_1104150 ?auto_1104146 ) ) ( not ( = ?auto_1104150 ?auto_1104148 ) ) ( not ( = ?auto_1104151 ?auto_1104146 ) ) ( not ( = ?auto_1104151 ?auto_1104148 ) ) ( not ( = ?auto_1104151 ?auto_1104150 ) ) ( ON_BOARD ?auto_1104154 ?auto_1104155 ) ( SUPPORTS ?auto_1104154 ?auto_1104147 ) ( not ( = ?auto_1104146 ?auto_1104153 ) ) ( HAVE_IMAGE ?auto_1104150 ?auto_1104149 ) ( not ( = ?auto_1104150 ?auto_1104153 ) ) ( not ( = ?auto_1104149 ?auto_1104147 ) ) ( CALIBRATION_TARGET ?auto_1104154 ?auto_1104153 ) ( not ( = ?auto_1104153 ?auto_1104157 ) ) ( not ( = ?auto_1104146 ?auto_1104157 ) ) ( not ( = ?auto_1104150 ?auto_1104157 ) ) ( ON_BOARD ?auto_1104156 ?auto_1104155 ) ( POWER_ON ?auto_1104156 ) ( not ( = ?auto_1104154 ?auto_1104156 ) ) ( POINTING ?auto_1104155 ?auto_1104153 ) ( HAVE_IMAGE ?auto_1104148 ?auto_1104145 ) ( HAVE_IMAGE ?auto_1104151 ?auto_1104152 ) ( not ( = ?auto_1104147 ?auto_1104145 ) ) ( not ( = ?auto_1104147 ?auto_1104152 ) ) ( not ( = ?auto_1104148 ?auto_1104153 ) ) ( not ( = ?auto_1104148 ?auto_1104157 ) ) ( not ( = ?auto_1104145 ?auto_1104149 ) ) ( not ( = ?auto_1104145 ?auto_1104152 ) ) ( not ( = ?auto_1104149 ?auto_1104152 ) ) ( not ( = ?auto_1104151 ?auto_1104153 ) ) ( not ( = ?auto_1104151 ?auto_1104157 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1104150 ?auto_1104149 ?auto_1104146 ?auto_1104147 )
      ( GET-4IMAGE-VERIFY ?auto_1104146 ?auto_1104147 ?auto_1104148 ?auto_1104145 ?auto_1104150 ?auto_1104149 ?auto_1104151 ?auto_1104152 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_1104256 - DIRECTION
      ?auto_1104257 - MODE
      ?auto_1104258 - DIRECTION
      ?auto_1104255 - MODE
      ?auto_1104260 - DIRECTION
      ?auto_1104259 - MODE
      ?auto_1104261 - DIRECTION
      ?auto_1104262 - MODE
    )
    :vars
    (
      ?auto_1104264 - INSTRUMENT
      ?auto_1104265 - SATELLITE
      ?auto_1104263 - DIRECTION
      ?auto_1104267 - DIRECTION
      ?auto_1104266 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_1104258 ?auto_1104256 ) ) ( not ( = ?auto_1104260 ?auto_1104256 ) ) ( not ( = ?auto_1104260 ?auto_1104258 ) ) ( not ( = ?auto_1104261 ?auto_1104256 ) ) ( not ( = ?auto_1104261 ?auto_1104258 ) ) ( not ( = ?auto_1104261 ?auto_1104260 ) ) ( ON_BOARD ?auto_1104264 ?auto_1104265 ) ( SUPPORTS ?auto_1104264 ?auto_1104257 ) ( not ( = ?auto_1104256 ?auto_1104263 ) ) ( HAVE_IMAGE ?auto_1104261 ?auto_1104262 ) ( not ( = ?auto_1104261 ?auto_1104263 ) ) ( not ( = ?auto_1104262 ?auto_1104257 ) ) ( CALIBRATION_TARGET ?auto_1104264 ?auto_1104263 ) ( not ( = ?auto_1104263 ?auto_1104267 ) ) ( not ( = ?auto_1104256 ?auto_1104267 ) ) ( not ( = ?auto_1104261 ?auto_1104267 ) ) ( ON_BOARD ?auto_1104266 ?auto_1104265 ) ( POWER_ON ?auto_1104266 ) ( not ( = ?auto_1104264 ?auto_1104266 ) ) ( POINTING ?auto_1104265 ?auto_1104263 ) ( HAVE_IMAGE ?auto_1104258 ?auto_1104255 ) ( HAVE_IMAGE ?auto_1104260 ?auto_1104259 ) ( not ( = ?auto_1104257 ?auto_1104255 ) ) ( not ( = ?auto_1104257 ?auto_1104259 ) ) ( not ( = ?auto_1104258 ?auto_1104263 ) ) ( not ( = ?auto_1104258 ?auto_1104267 ) ) ( not ( = ?auto_1104255 ?auto_1104259 ) ) ( not ( = ?auto_1104255 ?auto_1104262 ) ) ( not ( = ?auto_1104260 ?auto_1104263 ) ) ( not ( = ?auto_1104260 ?auto_1104267 ) ) ( not ( = ?auto_1104259 ?auto_1104262 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_1104261 ?auto_1104262 ?auto_1104256 ?auto_1104257 )
      ( GET-4IMAGE-VERIFY ?auto_1104256 ?auto_1104257 ?auto_1104258 ?auto_1104255 ?auto_1104260 ?auto_1104259 ?auto_1104261 ?auto_1104262 ) )
  )

)

