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
      ?auto_7378 - DIRECTION
      ?auto_7379 - MODE
    )
    :vars
    (
      ?auto_7380 - INSTRUMENT
      ?auto_7381 - SATELLITE
      ?auto_7382 - DIRECTION
      ?auto_7383 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_7380 ?auto_7381 ) ( SUPPORTS ?auto_7380 ?auto_7379 ) ( not ( = ?auto_7378 ?auto_7382 ) ) ( CALIBRATION_TARGET ?auto_7380 ?auto_7382 ) ( POWER_AVAIL ?auto_7381 ) ( POINTING ?auto_7381 ?auto_7383 ) ( not ( = ?auto_7382 ?auto_7383 ) ) ( not ( = ?auto_7378 ?auto_7383 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_7381 ?auto_7382 ?auto_7383 )
      ( !SWITCH_ON ?auto_7380 ?auto_7381 )
      ( !CALIBRATE ?auto_7381 ?auto_7380 ?auto_7382 )
      ( !TURN_TO ?auto_7381 ?auto_7378 ?auto_7382 )
      ( !TAKE_IMAGE ?auto_7381 ?auto_7378 ?auto_7380 ?auto_7379 )
      ( GET-1IMAGE-VERIFY ?auto_7378 ?auto_7379 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_7386 - DIRECTION
      ?auto_7387 - MODE
    )
    :vars
    (
      ?auto_7388 - INSTRUMENT
      ?auto_7389 - SATELLITE
      ?auto_7390 - DIRECTION
      ?auto_7391 - DIRECTION
      ?auto_7392 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7388 ?auto_7389 ) ( SUPPORTS ?auto_7388 ?auto_7387 ) ( not ( = ?auto_7386 ?auto_7390 ) ) ( CALIBRATION_TARGET ?auto_7388 ?auto_7390 ) ( POINTING ?auto_7389 ?auto_7391 ) ( not ( = ?auto_7390 ?auto_7391 ) ) ( ON_BOARD ?auto_7392 ?auto_7389 ) ( POWER_ON ?auto_7392 ) ( not ( = ?auto_7386 ?auto_7391 ) ) ( not ( = ?auto_7388 ?auto_7392 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_7392 ?auto_7389 )
      ( !TURN_TO ?auto_7389 ?auto_7390 ?auto_7391 )
      ( !SWITCH_ON ?auto_7388 ?auto_7389 )
      ( !CALIBRATE ?auto_7389 ?auto_7388 ?auto_7390 )
      ( !TURN_TO ?auto_7389 ?auto_7386 ?auto_7390 )
      ( !TAKE_IMAGE ?auto_7389 ?auto_7386 ?auto_7388 ?auto_7387 )
      ( GET-1IMAGE-VERIFY ?auto_7386 ?auto_7387 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7405 - DIRECTION
      ?auto_7406 - MODE
      ?auto_7408 - DIRECTION
      ?auto_7407 - MODE
    )
    :vars
    (
      ?auto_7410 - INSTRUMENT
      ?auto_7411 - SATELLITE
      ?auto_7412 - DIRECTION
      ?auto_7409 - INSTRUMENT
      ?auto_7413 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_7408 ?auto_7405 ) ) ( ON_BOARD ?auto_7410 ?auto_7411 ) ( SUPPORTS ?auto_7410 ?auto_7407 ) ( not ( = ?auto_7408 ?auto_7412 ) ) ( CALIBRATION_TARGET ?auto_7410 ?auto_7412 ) ( not ( = ?auto_7412 ?auto_7405 ) ) ( ON_BOARD ?auto_7409 ?auto_7411 ) ( not ( = ?auto_7410 ?auto_7409 ) ) ( SUPPORTS ?auto_7409 ?auto_7406 ) ( CALIBRATION_TARGET ?auto_7409 ?auto_7412 ) ( POWER_AVAIL ?auto_7411 ) ( POINTING ?auto_7411 ?auto_7413 ) ( not ( = ?auto_7412 ?auto_7413 ) ) ( not ( = ?auto_7405 ?auto_7413 ) ) ( not ( = ?auto_7406 ?auto_7407 ) ) ( not ( = ?auto_7408 ?auto_7413 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_7405 ?auto_7406 )
      ( GET-1IMAGE ?auto_7408 ?auto_7407 )
      ( GET-2IMAGE-VERIFY ?auto_7405 ?auto_7406 ?auto_7408 ?auto_7407 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_7414 - DIRECTION
      ?auto_7415 - MODE
      ?auto_7417 - DIRECTION
      ?auto_7416 - MODE
    )
    :vars
    (
      ?auto_7419 - INSTRUMENT
      ?auto_7420 - SATELLITE
      ?auto_7418 - DIRECTION
      ?auto_7421 - INSTRUMENT
      ?auto_7422 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_7417 ?auto_7414 ) ) ( ON_BOARD ?auto_7419 ?auto_7420 ) ( SUPPORTS ?auto_7419 ?auto_7415 ) ( not ( = ?auto_7414 ?auto_7418 ) ) ( CALIBRATION_TARGET ?auto_7419 ?auto_7418 ) ( not ( = ?auto_7418 ?auto_7417 ) ) ( ON_BOARD ?auto_7421 ?auto_7420 ) ( not ( = ?auto_7419 ?auto_7421 ) ) ( SUPPORTS ?auto_7421 ?auto_7416 ) ( CALIBRATION_TARGET ?auto_7421 ?auto_7418 ) ( POWER_AVAIL ?auto_7420 ) ( POINTING ?auto_7420 ?auto_7422 ) ( not ( = ?auto_7418 ?auto_7422 ) ) ( not ( = ?auto_7417 ?auto_7422 ) ) ( not ( = ?auto_7416 ?auto_7415 ) ) ( not ( = ?auto_7414 ?auto_7422 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7417 ?auto_7416 ?auto_7414 ?auto_7415 )
      ( GET-2IMAGE-VERIFY ?auto_7414 ?auto_7415 ?auto_7417 ?auto_7416 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_7436 - DIRECTION
      ?auto_7437 - MODE
    )
    :vars
    (
      ?auto_7438 - INSTRUMENT
      ?auto_7439 - SATELLITE
      ?auto_7440 - DIRECTION
      ?auto_7441 - DIRECTION
      ?auto_7442 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7438 ?auto_7439 ) ( SUPPORTS ?auto_7438 ?auto_7437 ) ( not ( = ?auto_7436 ?auto_7440 ) ) ( CALIBRATION_TARGET ?auto_7438 ?auto_7440 ) ( POINTING ?auto_7439 ?auto_7441 ) ( not ( = ?auto_7440 ?auto_7441 ) ) ( ON_BOARD ?auto_7442 ?auto_7439 ) ( POWER_ON ?auto_7442 ) ( not ( = ?auto_7436 ?auto_7441 ) ) ( not ( = ?auto_7438 ?auto_7442 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_7442 ?auto_7439 )
      ( !TURN_TO ?auto_7439 ?auto_7440 ?auto_7441 )
      ( !SWITCH_ON ?auto_7438 ?auto_7439 )
      ( !CALIBRATE ?auto_7439 ?auto_7438 ?auto_7440 )
      ( !TURN_TO ?auto_7439 ?auto_7436 ?auto_7440 )
      ( !TAKE_IMAGE ?auto_7439 ?auto_7436 ?auto_7438 ?auto_7437 )
      ( GET-1IMAGE-VERIFY ?auto_7436 ?auto_7437 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7571 - DIRECTION
      ?auto_7572 - MODE
      ?auto_7574 - DIRECTION
      ?auto_7573 - MODE
      ?auto_7575 - DIRECTION
      ?auto_7576 - MODE
    )
    :vars
    (
      ?auto_7579 - INSTRUMENT
      ?auto_7580 - SATELLITE
      ?auto_7577 - DIRECTION
      ?auto_7578 - INSTRUMENT
      ?auto_7582 - INSTRUMENT
      ?auto_7581 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_7574 ?auto_7571 ) ) ( not ( = ?auto_7575 ?auto_7571 ) ) ( not ( = ?auto_7575 ?auto_7574 ) ) ( ON_BOARD ?auto_7579 ?auto_7580 ) ( SUPPORTS ?auto_7579 ?auto_7576 ) ( not ( = ?auto_7575 ?auto_7577 ) ) ( CALIBRATION_TARGET ?auto_7579 ?auto_7577 ) ( not ( = ?auto_7577 ?auto_7574 ) ) ( ON_BOARD ?auto_7578 ?auto_7580 ) ( not ( = ?auto_7579 ?auto_7578 ) ) ( SUPPORTS ?auto_7578 ?auto_7573 ) ( CALIBRATION_TARGET ?auto_7578 ?auto_7577 ) ( not ( = ?auto_7577 ?auto_7571 ) ) ( ON_BOARD ?auto_7582 ?auto_7580 ) ( not ( = ?auto_7578 ?auto_7582 ) ) ( SUPPORTS ?auto_7582 ?auto_7572 ) ( CALIBRATION_TARGET ?auto_7582 ?auto_7577 ) ( POWER_AVAIL ?auto_7580 ) ( POINTING ?auto_7580 ?auto_7581 ) ( not ( = ?auto_7577 ?auto_7581 ) ) ( not ( = ?auto_7571 ?auto_7581 ) ) ( not ( = ?auto_7572 ?auto_7573 ) ) ( not ( = ?auto_7574 ?auto_7581 ) ) ( not ( = ?auto_7572 ?auto_7576 ) ) ( not ( = ?auto_7573 ?auto_7576 ) ) ( not ( = ?auto_7575 ?auto_7581 ) ) ( not ( = ?auto_7579 ?auto_7582 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_7574 ?auto_7573 ?auto_7571 ?auto_7572 )
      ( GET-1IMAGE ?auto_7575 ?auto_7576 )
      ( GET-3IMAGE-VERIFY ?auto_7571 ?auto_7572 ?auto_7574 ?auto_7573 ?auto_7575 ?auto_7576 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7597 - DIRECTION
      ?auto_7598 - MODE
      ?auto_7600 - DIRECTION
      ?auto_7599 - MODE
      ?auto_7601 - DIRECTION
      ?auto_7602 - MODE
    )
    :vars
    (
      ?auto_7606 - INSTRUMENT
      ?auto_7607 - SATELLITE
      ?auto_7604 - DIRECTION
      ?auto_7603 - INSTRUMENT
      ?auto_7605 - INSTRUMENT
      ?auto_7608 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_7600 ?auto_7597 ) ) ( not ( = ?auto_7601 ?auto_7597 ) ) ( not ( = ?auto_7601 ?auto_7600 ) ) ( ON_BOARD ?auto_7606 ?auto_7607 ) ( SUPPORTS ?auto_7606 ?auto_7599 ) ( not ( = ?auto_7600 ?auto_7604 ) ) ( CALIBRATION_TARGET ?auto_7606 ?auto_7604 ) ( not ( = ?auto_7604 ?auto_7601 ) ) ( ON_BOARD ?auto_7603 ?auto_7607 ) ( not ( = ?auto_7606 ?auto_7603 ) ) ( SUPPORTS ?auto_7603 ?auto_7602 ) ( CALIBRATION_TARGET ?auto_7603 ?auto_7604 ) ( not ( = ?auto_7604 ?auto_7597 ) ) ( ON_BOARD ?auto_7605 ?auto_7607 ) ( not ( = ?auto_7603 ?auto_7605 ) ) ( SUPPORTS ?auto_7605 ?auto_7598 ) ( CALIBRATION_TARGET ?auto_7605 ?auto_7604 ) ( POWER_AVAIL ?auto_7607 ) ( POINTING ?auto_7607 ?auto_7608 ) ( not ( = ?auto_7604 ?auto_7608 ) ) ( not ( = ?auto_7597 ?auto_7608 ) ) ( not ( = ?auto_7598 ?auto_7602 ) ) ( not ( = ?auto_7601 ?auto_7608 ) ) ( not ( = ?auto_7598 ?auto_7599 ) ) ( not ( = ?auto_7602 ?auto_7599 ) ) ( not ( = ?auto_7600 ?auto_7608 ) ) ( not ( = ?auto_7606 ?auto_7605 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_7597 ?auto_7598 ?auto_7601 ?auto_7602 ?auto_7600 ?auto_7599 )
      ( GET-3IMAGE-VERIFY ?auto_7597 ?auto_7598 ?auto_7600 ?auto_7599 ?auto_7601 ?auto_7602 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7623 - DIRECTION
      ?auto_7624 - MODE
      ?auto_7626 - DIRECTION
      ?auto_7625 - MODE
      ?auto_7627 - DIRECTION
      ?auto_7628 - MODE
    )
    :vars
    (
      ?auto_7634 - INSTRUMENT
      ?auto_7632 - SATELLITE
      ?auto_7633 - DIRECTION
      ?auto_7629 - INSTRUMENT
      ?auto_7631 - INSTRUMENT
      ?auto_7630 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_7626 ?auto_7623 ) ) ( not ( = ?auto_7627 ?auto_7623 ) ) ( not ( = ?auto_7627 ?auto_7626 ) ) ( ON_BOARD ?auto_7634 ?auto_7632 ) ( SUPPORTS ?auto_7634 ?auto_7628 ) ( not ( = ?auto_7627 ?auto_7633 ) ) ( CALIBRATION_TARGET ?auto_7634 ?auto_7633 ) ( not ( = ?auto_7633 ?auto_7623 ) ) ( ON_BOARD ?auto_7629 ?auto_7632 ) ( not ( = ?auto_7634 ?auto_7629 ) ) ( SUPPORTS ?auto_7629 ?auto_7624 ) ( CALIBRATION_TARGET ?auto_7629 ?auto_7633 ) ( not ( = ?auto_7633 ?auto_7626 ) ) ( ON_BOARD ?auto_7631 ?auto_7632 ) ( not ( = ?auto_7629 ?auto_7631 ) ) ( SUPPORTS ?auto_7631 ?auto_7625 ) ( CALIBRATION_TARGET ?auto_7631 ?auto_7633 ) ( POWER_AVAIL ?auto_7632 ) ( POINTING ?auto_7632 ?auto_7630 ) ( not ( = ?auto_7633 ?auto_7630 ) ) ( not ( = ?auto_7626 ?auto_7630 ) ) ( not ( = ?auto_7625 ?auto_7624 ) ) ( not ( = ?auto_7623 ?auto_7630 ) ) ( not ( = ?auto_7625 ?auto_7628 ) ) ( not ( = ?auto_7624 ?auto_7628 ) ) ( not ( = ?auto_7627 ?auto_7630 ) ) ( not ( = ?auto_7634 ?auto_7631 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_7626 ?auto_7625 ?auto_7627 ?auto_7628 ?auto_7623 ?auto_7624 )
      ( GET-3IMAGE-VERIFY ?auto_7623 ?auto_7624 ?auto_7626 ?auto_7625 ?auto_7627 ?auto_7628 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7649 - DIRECTION
      ?auto_7650 - MODE
      ?auto_7652 - DIRECTION
      ?auto_7651 - MODE
      ?auto_7653 - DIRECTION
      ?auto_7654 - MODE
    )
    :vars
    (
      ?auto_7660 - INSTRUMENT
      ?auto_7658 - SATELLITE
      ?auto_7659 - DIRECTION
      ?auto_7655 - INSTRUMENT
      ?auto_7657 - INSTRUMENT
      ?auto_7656 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_7652 ?auto_7649 ) ) ( not ( = ?auto_7653 ?auto_7649 ) ) ( not ( = ?auto_7653 ?auto_7652 ) ) ( ON_BOARD ?auto_7660 ?auto_7658 ) ( SUPPORTS ?auto_7660 ?auto_7651 ) ( not ( = ?auto_7652 ?auto_7659 ) ) ( CALIBRATION_TARGET ?auto_7660 ?auto_7659 ) ( not ( = ?auto_7659 ?auto_7649 ) ) ( ON_BOARD ?auto_7655 ?auto_7658 ) ( not ( = ?auto_7660 ?auto_7655 ) ) ( SUPPORTS ?auto_7655 ?auto_7650 ) ( CALIBRATION_TARGET ?auto_7655 ?auto_7659 ) ( not ( = ?auto_7659 ?auto_7653 ) ) ( ON_BOARD ?auto_7657 ?auto_7658 ) ( not ( = ?auto_7655 ?auto_7657 ) ) ( SUPPORTS ?auto_7657 ?auto_7654 ) ( CALIBRATION_TARGET ?auto_7657 ?auto_7659 ) ( POWER_AVAIL ?auto_7658 ) ( POINTING ?auto_7658 ?auto_7656 ) ( not ( = ?auto_7659 ?auto_7656 ) ) ( not ( = ?auto_7653 ?auto_7656 ) ) ( not ( = ?auto_7654 ?auto_7650 ) ) ( not ( = ?auto_7649 ?auto_7656 ) ) ( not ( = ?auto_7654 ?auto_7651 ) ) ( not ( = ?auto_7650 ?auto_7651 ) ) ( not ( = ?auto_7652 ?auto_7656 ) ) ( not ( = ?auto_7660 ?auto_7657 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_7653 ?auto_7654 ?auto_7652 ?auto_7651 ?auto_7649 ?auto_7650 )
      ( GET-3IMAGE-VERIFY ?auto_7649 ?auto_7650 ?auto_7652 ?auto_7651 ?auto_7653 ?auto_7654 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7703 - DIRECTION
      ?auto_7704 - MODE
      ?auto_7706 - DIRECTION
      ?auto_7705 - MODE
      ?auto_7707 - DIRECTION
      ?auto_7708 - MODE
    )
    :vars
    (
      ?auto_7714 - INSTRUMENT
      ?auto_7712 - SATELLITE
      ?auto_7713 - DIRECTION
      ?auto_7709 - INSTRUMENT
      ?auto_7711 - INSTRUMENT
      ?auto_7710 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_7706 ?auto_7703 ) ) ( not ( = ?auto_7707 ?auto_7703 ) ) ( not ( = ?auto_7707 ?auto_7706 ) ) ( ON_BOARD ?auto_7714 ?auto_7712 ) ( SUPPORTS ?auto_7714 ?auto_7704 ) ( not ( = ?auto_7703 ?auto_7713 ) ) ( CALIBRATION_TARGET ?auto_7714 ?auto_7713 ) ( not ( = ?auto_7713 ?auto_7707 ) ) ( ON_BOARD ?auto_7709 ?auto_7712 ) ( not ( = ?auto_7714 ?auto_7709 ) ) ( SUPPORTS ?auto_7709 ?auto_7708 ) ( CALIBRATION_TARGET ?auto_7709 ?auto_7713 ) ( not ( = ?auto_7713 ?auto_7706 ) ) ( ON_BOARD ?auto_7711 ?auto_7712 ) ( not ( = ?auto_7709 ?auto_7711 ) ) ( SUPPORTS ?auto_7711 ?auto_7705 ) ( CALIBRATION_TARGET ?auto_7711 ?auto_7713 ) ( POWER_AVAIL ?auto_7712 ) ( POINTING ?auto_7712 ?auto_7710 ) ( not ( = ?auto_7713 ?auto_7710 ) ) ( not ( = ?auto_7706 ?auto_7710 ) ) ( not ( = ?auto_7705 ?auto_7708 ) ) ( not ( = ?auto_7707 ?auto_7710 ) ) ( not ( = ?auto_7705 ?auto_7704 ) ) ( not ( = ?auto_7708 ?auto_7704 ) ) ( not ( = ?auto_7703 ?auto_7710 ) ) ( not ( = ?auto_7714 ?auto_7711 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_7706 ?auto_7705 ?auto_7703 ?auto_7704 ?auto_7707 ?auto_7708 )
      ( GET-3IMAGE-VERIFY ?auto_7703 ?auto_7704 ?auto_7706 ?auto_7705 ?auto_7707 ?auto_7708 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_7729 - DIRECTION
      ?auto_7730 - MODE
      ?auto_7732 - DIRECTION
      ?auto_7731 - MODE
      ?auto_7733 - DIRECTION
      ?auto_7734 - MODE
    )
    :vars
    (
      ?auto_7740 - INSTRUMENT
      ?auto_7738 - SATELLITE
      ?auto_7739 - DIRECTION
      ?auto_7735 - INSTRUMENT
      ?auto_7737 - INSTRUMENT
      ?auto_7736 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_7732 ?auto_7729 ) ) ( not ( = ?auto_7733 ?auto_7729 ) ) ( not ( = ?auto_7733 ?auto_7732 ) ) ( ON_BOARD ?auto_7740 ?auto_7738 ) ( SUPPORTS ?auto_7740 ?auto_7730 ) ( not ( = ?auto_7729 ?auto_7739 ) ) ( CALIBRATION_TARGET ?auto_7740 ?auto_7739 ) ( not ( = ?auto_7739 ?auto_7732 ) ) ( ON_BOARD ?auto_7735 ?auto_7738 ) ( not ( = ?auto_7740 ?auto_7735 ) ) ( SUPPORTS ?auto_7735 ?auto_7731 ) ( CALIBRATION_TARGET ?auto_7735 ?auto_7739 ) ( not ( = ?auto_7739 ?auto_7733 ) ) ( ON_BOARD ?auto_7737 ?auto_7738 ) ( not ( = ?auto_7735 ?auto_7737 ) ) ( SUPPORTS ?auto_7737 ?auto_7734 ) ( CALIBRATION_TARGET ?auto_7737 ?auto_7739 ) ( POWER_AVAIL ?auto_7738 ) ( POINTING ?auto_7738 ?auto_7736 ) ( not ( = ?auto_7739 ?auto_7736 ) ) ( not ( = ?auto_7733 ?auto_7736 ) ) ( not ( = ?auto_7734 ?auto_7731 ) ) ( not ( = ?auto_7732 ?auto_7736 ) ) ( not ( = ?auto_7734 ?auto_7730 ) ) ( not ( = ?auto_7731 ?auto_7730 ) ) ( not ( = ?auto_7729 ?auto_7736 ) ) ( not ( = ?auto_7740 ?auto_7737 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_7733 ?auto_7734 ?auto_7729 ?auto_7730 ?auto_7732 ?auto_7731 )
      ( GET-3IMAGE-VERIFY ?auto_7729 ?auto_7730 ?auto_7732 ?auto_7731 ?auto_7733 ?auto_7734 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_7815 - DIRECTION
      ?auto_7816 - MODE
    )
    :vars
    (
      ?auto_7817 - INSTRUMENT
      ?auto_7818 - SATELLITE
      ?auto_7819 - DIRECTION
      ?auto_7820 - DIRECTION
      ?auto_7821 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_7817 ?auto_7818 ) ( SUPPORTS ?auto_7817 ?auto_7816 ) ( not ( = ?auto_7815 ?auto_7819 ) ) ( CALIBRATION_TARGET ?auto_7817 ?auto_7819 ) ( POINTING ?auto_7818 ?auto_7820 ) ( not ( = ?auto_7819 ?auto_7820 ) ) ( ON_BOARD ?auto_7821 ?auto_7818 ) ( POWER_ON ?auto_7821 ) ( not ( = ?auto_7815 ?auto_7820 ) ) ( not ( = ?auto_7817 ?auto_7821 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_7821 ?auto_7818 )
      ( !TURN_TO ?auto_7818 ?auto_7819 ?auto_7820 )
      ( !SWITCH_ON ?auto_7817 ?auto_7818 )
      ( !CALIBRATE ?auto_7818 ?auto_7817 ?auto_7819 )
      ( !TURN_TO ?auto_7818 ?auto_7815 ?auto_7819 )
      ( !TAKE_IMAGE ?auto_7818 ?auto_7815 ?auto_7817 ?auto_7816 )
      ( GET-1IMAGE-VERIFY ?auto_7815 ?auto_7816 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_9381 - DIRECTION
      ?auto_9382 - MODE
      ?auto_9384 - DIRECTION
      ?auto_9383 - MODE
      ?auto_9385 - DIRECTION
      ?auto_9386 - MODE
      ?auto_9387 - DIRECTION
      ?auto_9388 - MODE
    )
    :vars
    (
      ?auto_9389 - INSTRUMENT
      ?auto_9390 - SATELLITE
      ?auto_9392 - DIRECTION
      ?auto_9391 - INSTRUMENT
      ?auto_9393 - INSTRUMENT
      ?auto_9395 - INSTRUMENT
      ?auto_9394 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9384 ?auto_9381 ) ) ( not ( = ?auto_9385 ?auto_9381 ) ) ( not ( = ?auto_9385 ?auto_9384 ) ) ( not ( = ?auto_9387 ?auto_9381 ) ) ( not ( = ?auto_9387 ?auto_9384 ) ) ( not ( = ?auto_9387 ?auto_9385 ) ) ( ON_BOARD ?auto_9389 ?auto_9390 ) ( SUPPORTS ?auto_9389 ?auto_9388 ) ( not ( = ?auto_9387 ?auto_9392 ) ) ( CALIBRATION_TARGET ?auto_9389 ?auto_9392 ) ( not ( = ?auto_9392 ?auto_9385 ) ) ( ON_BOARD ?auto_9391 ?auto_9390 ) ( not ( = ?auto_9389 ?auto_9391 ) ) ( SUPPORTS ?auto_9391 ?auto_9386 ) ( CALIBRATION_TARGET ?auto_9391 ?auto_9392 ) ( not ( = ?auto_9392 ?auto_9384 ) ) ( ON_BOARD ?auto_9393 ?auto_9390 ) ( not ( = ?auto_9391 ?auto_9393 ) ) ( SUPPORTS ?auto_9393 ?auto_9383 ) ( CALIBRATION_TARGET ?auto_9393 ?auto_9392 ) ( not ( = ?auto_9392 ?auto_9381 ) ) ( ON_BOARD ?auto_9395 ?auto_9390 ) ( not ( = ?auto_9393 ?auto_9395 ) ) ( SUPPORTS ?auto_9395 ?auto_9382 ) ( CALIBRATION_TARGET ?auto_9395 ?auto_9392 ) ( POWER_AVAIL ?auto_9390 ) ( POINTING ?auto_9390 ?auto_9394 ) ( not ( = ?auto_9392 ?auto_9394 ) ) ( not ( = ?auto_9381 ?auto_9394 ) ) ( not ( = ?auto_9382 ?auto_9383 ) ) ( not ( = ?auto_9384 ?auto_9394 ) ) ( not ( = ?auto_9382 ?auto_9386 ) ) ( not ( = ?auto_9383 ?auto_9386 ) ) ( not ( = ?auto_9385 ?auto_9394 ) ) ( not ( = ?auto_9391 ?auto_9395 ) ) ( not ( = ?auto_9382 ?auto_9388 ) ) ( not ( = ?auto_9383 ?auto_9388 ) ) ( not ( = ?auto_9386 ?auto_9388 ) ) ( not ( = ?auto_9387 ?auto_9394 ) ) ( not ( = ?auto_9389 ?auto_9393 ) ) ( not ( = ?auto_9389 ?auto_9395 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_9381 ?auto_9382 ?auto_9385 ?auto_9386 ?auto_9384 ?auto_9383 )
      ( GET-1IMAGE ?auto_9387 ?auto_9388 )
      ( GET-4IMAGE-VERIFY ?auto_9381 ?auto_9382 ?auto_9384 ?auto_9383 ?auto_9385 ?auto_9386 ?auto_9387 ?auto_9388 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_9430 - DIRECTION
      ?auto_9431 - MODE
      ?auto_9433 - DIRECTION
      ?auto_9432 - MODE
      ?auto_9434 - DIRECTION
      ?auto_9435 - MODE
      ?auto_9436 - DIRECTION
      ?auto_9437 - MODE
    )
    :vars
    (
      ?auto_9444 - INSTRUMENT
      ?auto_9441 - SATELLITE
      ?auto_9443 - DIRECTION
      ?auto_9439 - INSTRUMENT
      ?auto_9440 - INSTRUMENT
      ?auto_9438 - INSTRUMENT
      ?auto_9442 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9433 ?auto_9430 ) ) ( not ( = ?auto_9434 ?auto_9430 ) ) ( not ( = ?auto_9434 ?auto_9433 ) ) ( not ( = ?auto_9436 ?auto_9430 ) ) ( not ( = ?auto_9436 ?auto_9433 ) ) ( not ( = ?auto_9436 ?auto_9434 ) ) ( ON_BOARD ?auto_9444 ?auto_9441 ) ( SUPPORTS ?auto_9444 ?auto_9435 ) ( not ( = ?auto_9434 ?auto_9443 ) ) ( CALIBRATION_TARGET ?auto_9444 ?auto_9443 ) ( not ( = ?auto_9443 ?auto_9436 ) ) ( ON_BOARD ?auto_9439 ?auto_9441 ) ( not ( = ?auto_9444 ?auto_9439 ) ) ( SUPPORTS ?auto_9439 ?auto_9437 ) ( CALIBRATION_TARGET ?auto_9439 ?auto_9443 ) ( not ( = ?auto_9443 ?auto_9433 ) ) ( ON_BOARD ?auto_9440 ?auto_9441 ) ( not ( = ?auto_9439 ?auto_9440 ) ) ( SUPPORTS ?auto_9440 ?auto_9432 ) ( CALIBRATION_TARGET ?auto_9440 ?auto_9443 ) ( not ( = ?auto_9443 ?auto_9430 ) ) ( ON_BOARD ?auto_9438 ?auto_9441 ) ( not ( = ?auto_9440 ?auto_9438 ) ) ( SUPPORTS ?auto_9438 ?auto_9431 ) ( CALIBRATION_TARGET ?auto_9438 ?auto_9443 ) ( POWER_AVAIL ?auto_9441 ) ( POINTING ?auto_9441 ?auto_9442 ) ( not ( = ?auto_9443 ?auto_9442 ) ) ( not ( = ?auto_9430 ?auto_9442 ) ) ( not ( = ?auto_9431 ?auto_9432 ) ) ( not ( = ?auto_9433 ?auto_9442 ) ) ( not ( = ?auto_9431 ?auto_9437 ) ) ( not ( = ?auto_9432 ?auto_9437 ) ) ( not ( = ?auto_9436 ?auto_9442 ) ) ( not ( = ?auto_9439 ?auto_9438 ) ) ( not ( = ?auto_9431 ?auto_9435 ) ) ( not ( = ?auto_9432 ?auto_9435 ) ) ( not ( = ?auto_9437 ?auto_9435 ) ) ( not ( = ?auto_9434 ?auto_9442 ) ) ( not ( = ?auto_9444 ?auto_9440 ) ) ( not ( = ?auto_9444 ?auto_9438 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_9430 ?auto_9431 ?auto_9433 ?auto_9432 ?auto_9436 ?auto_9437 ?auto_9434 ?auto_9435 )
      ( GET-4IMAGE-VERIFY ?auto_9430 ?auto_9431 ?auto_9433 ?auto_9432 ?auto_9434 ?auto_9435 ?auto_9436 ?auto_9437 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_9479 - DIRECTION
      ?auto_9480 - MODE
      ?auto_9482 - DIRECTION
      ?auto_9481 - MODE
      ?auto_9483 - DIRECTION
      ?auto_9484 - MODE
      ?auto_9485 - DIRECTION
      ?auto_9486 - MODE
    )
    :vars
    (
      ?auto_9487 - INSTRUMENT
      ?auto_9492 - SATELLITE
      ?auto_9493 - DIRECTION
      ?auto_9491 - INSTRUMENT
      ?auto_9490 - INSTRUMENT
      ?auto_9488 - INSTRUMENT
      ?auto_9489 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9482 ?auto_9479 ) ) ( not ( = ?auto_9483 ?auto_9479 ) ) ( not ( = ?auto_9483 ?auto_9482 ) ) ( not ( = ?auto_9485 ?auto_9479 ) ) ( not ( = ?auto_9485 ?auto_9482 ) ) ( not ( = ?auto_9485 ?auto_9483 ) ) ( ON_BOARD ?auto_9487 ?auto_9492 ) ( SUPPORTS ?auto_9487 ?auto_9486 ) ( not ( = ?auto_9485 ?auto_9493 ) ) ( CALIBRATION_TARGET ?auto_9487 ?auto_9493 ) ( not ( = ?auto_9493 ?auto_9482 ) ) ( ON_BOARD ?auto_9491 ?auto_9492 ) ( not ( = ?auto_9487 ?auto_9491 ) ) ( SUPPORTS ?auto_9491 ?auto_9481 ) ( CALIBRATION_TARGET ?auto_9491 ?auto_9493 ) ( not ( = ?auto_9493 ?auto_9483 ) ) ( ON_BOARD ?auto_9490 ?auto_9492 ) ( not ( = ?auto_9491 ?auto_9490 ) ) ( SUPPORTS ?auto_9490 ?auto_9484 ) ( CALIBRATION_TARGET ?auto_9490 ?auto_9493 ) ( not ( = ?auto_9493 ?auto_9479 ) ) ( ON_BOARD ?auto_9488 ?auto_9492 ) ( not ( = ?auto_9490 ?auto_9488 ) ) ( SUPPORTS ?auto_9488 ?auto_9480 ) ( CALIBRATION_TARGET ?auto_9488 ?auto_9493 ) ( POWER_AVAIL ?auto_9492 ) ( POINTING ?auto_9492 ?auto_9489 ) ( not ( = ?auto_9493 ?auto_9489 ) ) ( not ( = ?auto_9479 ?auto_9489 ) ) ( not ( = ?auto_9480 ?auto_9484 ) ) ( not ( = ?auto_9483 ?auto_9489 ) ) ( not ( = ?auto_9480 ?auto_9481 ) ) ( not ( = ?auto_9484 ?auto_9481 ) ) ( not ( = ?auto_9482 ?auto_9489 ) ) ( not ( = ?auto_9491 ?auto_9488 ) ) ( not ( = ?auto_9480 ?auto_9486 ) ) ( not ( = ?auto_9484 ?auto_9486 ) ) ( not ( = ?auto_9481 ?auto_9486 ) ) ( not ( = ?auto_9485 ?auto_9489 ) ) ( not ( = ?auto_9487 ?auto_9490 ) ) ( not ( = ?auto_9487 ?auto_9488 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_9479 ?auto_9480 ?auto_9483 ?auto_9484 ?auto_9485 ?auto_9486 ?auto_9482 ?auto_9481 )
      ( GET-4IMAGE-VERIFY ?auto_9479 ?auto_9480 ?auto_9482 ?auto_9481 ?auto_9483 ?auto_9484 ?auto_9485 ?auto_9486 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_9528 - DIRECTION
      ?auto_9529 - MODE
      ?auto_9531 - DIRECTION
      ?auto_9530 - MODE
      ?auto_9532 - DIRECTION
      ?auto_9533 - MODE
      ?auto_9534 - DIRECTION
      ?auto_9535 - MODE
    )
    :vars
    (
      ?auto_9536 - INSTRUMENT
      ?auto_9541 - SATELLITE
      ?auto_9542 - DIRECTION
      ?auto_9540 - INSTRUMENT
      ?auto_9539 - INSTRUMENT
      ?auto_9537 - INSTRUMENT
      ?auto_9538 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9531 ?auto_9528 ) ) ( not ( = ?auto_9532 ?auto_9528 ) ) ( not ( = ?auto_9532 ?auto_9531 ) ) ( not ( = ?auto_9534 ?auto_9528 ) ) ( not ( = ?auto_9534 ?auto_9531 ) ) ( not ( = ?auto_9534 ?auto_9532 ) ) ( ON_BOARD ?auto_9536 ?auto_9541 ) ( SUPPORTS ?auto_9536 ?auto_9533 ) ( not ( = ?auto_9532 ?auto_9542 ) ) ( CALIBRATION_TARGET ?auto_9536 ?auto_9542 ) ( not ( = ?auto_9542 ?auto_9531 ) ) ( ON_BOARD ?auto_9540 ?auto_9541 ) ( not ( = ?auto_9536 ?auto_9540 ) ) ( SUPPORTS ?auto_9540 ?auto_9530 ) ( CALIBRATION_TARGET ?auto_9540 ?auto_9542 ) ( not ( = ?auto_9542 ?auto_9534 ) ) ( ON_BOARD ?auto_9539 ?auto_9541 ) ( not ( = ?auto_9540 ?auto_9539 ) ) ( SUPPORTS ?auto_9539 ?auto_9535 ) ( CALIBRATION_TARGET ?auto_9539 ?auto_9542 ) ( not ( = ?auto_9542 ?auto_9528 ) ) ( ON_BOARD ?auto_9537 ?auto_9541 ) ( not ( = ?auto_9539 ?auto_9537 ) ) ( SUPPORTS ?auto_9537 ?auto_9529 ) ( CALIBRATION_TARGET ?auto_9537 ?auto_9542 ) ( POWER_AVAIL ?auto_9541 ) ( POINTING ?auto_9541 ?auto_9538 ) ( not ( = ?auto_9542 ?auto_9538 ) ) ( not ( = ?auto_9528 ?auto_9538 ) ) ( not ( = ?auto_9529 ?auto_9535 ) ) ( not ( = ?auto_9534 ?auto_9538 ) ) ( not ( = ?auto_9529 ?auto_9530 ) ) ( not ( = ?auto_9535 ?auto_9530 ) ) ( not ( = ?auto_9531 ?auto_9538 ) ) ( not ( = ?auto_9540 ?auto_9537 ) ) ( not ( = ?auto_9529 ?auto_9533 ) ) ( not ( = ?auto_9535 ?auto_9533 ) ) ( not ( = ?auto_9530 ?auto_9533 ) ) ( not ( = ?auto_9532 ?auto_9538 ) ) ( not ( = ?auto_9536 ?auto_9539 ) ) ( not ( = ?auto_9536 ?auto_9537 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_9528 ?auto_9529 ?auto_9534 ?auto_9535 ?auto_9532 ?auto_9533 ?auto_9531 ?auto_9530 )
      ( GET-4IMAGE-VERIFY ?auto_9528 ?auto_9529 ?auto_9531 ?auto_9530 ?auto_9532 ?auto_9533 ?auto_9534 ?auto_9535 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_9683 - DIRECTION
      ?auto_9684 - MODE
      ?auto_9686 - DIRECTION
      ?auto_9685 - MODE
      ?auto_9687 - DIRECTION
      ?auto_9688 - MODE
      ?auto_9689 - DIRECTION
      ?auto_9690 - MODE
    )
    :vars
    (
      ?auto_9691 - INSTRUMENT
      ?auto_9696 - SATELLITE
      ?auto_9697 - DIRECTION
      ?auto_9695 - INSTRUMENT
      ?auto_9694 - INSTRUMENT
      ?auto_9692 - INSTRUMENT
      ?auto_9693 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9686 ?auto_9683 ) ) ( not ( = ?auto_9687 ?auto_9683 ) ) ( not ( = ?auto_9687 ?auto_9686 ) ) ( not ( = ?auto_9689 ?auto_9683 ) ) ( not ( = ?auto_9689 ?auto_9686 ) ) ( not ( = ?auto_9689 ?auto_9687 ) ) ( ON_BOARD ?auto_9691 ?auto_9696 ) ( SUPPORTS ?auto_9691 ?auto_9685 ) ( not ( = ?auto_9686 ?auto_9697 ) ) ( CALIBRATION_TARGET ?auto_9691 ?auto_9697 ) ( not ( = ?auto_9697 ?auto_9689 ) ) ( ON_BOARD ?auto_9695 ?auto_9696 ) ( not ( = ?auto_9691 ?auto_9695 ) ) ( SUPPORTS ?auto_9695 ?auto_9690 ) ( CALIBRATION_TARGET ?auto_9695 ?auto_9697 ) ( not ( = ?auto_9697 ?auto_9687 ) ) ( ON_BOARD ?auto_9694 ?auto_9696 ) ( not ( = ?auto_9695 ?auto_9694 ) ) ( SUPPORTS ?auto_9694 ?auto_9688 ) ( CALIBRATION_TARGET ?auto_9694 ?auto_9697 ) ( not ( = ?auto_9697 ?auto_9683 ) ) ( ON_BOARD ?auto_9692 ?auto_9696 ) ( not ( = ?auto_9694 ?auto_9692 ) ) ( SUPPORTS ?auto_9692 ?auto_9684 ) ( CALIBRATION_TARGET ?auto_9692 ?auto_9697 ) ( POWER_AVAIL ?auto_9696 ) ( POINTING ?auto_9696 ?auto_9693 ) ( not ( = ?auto_9697 ?auto_9693 ) ) ( not ( = ?auto_9683 ?auto_9693 ) ) ( not ( = ?auto_9684 ?auto_9688 ) ) ( not ( = ?auto_9687 ?auto_9693 ) ) ( not ( = ?auto_9684 ?auto_9690 ) ) ( not ( = ?auto_9688 ?auto_9690 ) ) ( not ( = ?auto_9689 ?auto_9693 ) ) ( not ( = ?auto_9695 ?auto_9692 ) ) ( not ( = ?auto_9684 ?auto_9685 ) ) ( not ( = ?auto_9688 ?auto_9685 ) ) ( not ( = ?auto_9690 ?auto_9685 ) ) ( not ( = ?auto_9686 ?auto_9693 ) ) ( not ( = ?auto_9691 ?auto_9694 ) ) ( not ( = ?auto_9691 ?auto_9692 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_9683 ?auto_9684 ?auto_9687 ?auto_9688 ?auto_9686 ?auto_9685 ?auto_9689 ?auto_9690 )
      ( GET-4IMAGE-VERIFY ?auto_9683 ?auto_9684 ?auto_9686 ?auto_9685 ?auto_9687 ?auto_9688 ?auto_9689 ?auto_9690 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_9732 - DIRECTION
      ?auto_9733 - MODE
      ?auto_9735 - DIRECTION
      ?auto_9734 - MODE
      ?auto_9736 - DIRECTION
      ?auto_9737 - MODE
      ?auto_9738 - DIRECTION
      ?auto_9739 - MODE
    )
    :vars
    (
      ?auto_9740 - INSTRUMENT
      ?auto_9745 - SATELLITE
      ?auto_9746 - DIRECTION
      ?auto_9744 - INSTRUMENT
      ?auto_9743 - INSTRUMENT
      ?auto_9741 - INSTRUMENT
      ?auto_9742 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9735 ?auto_9732 ) ) ( not ( = ?auto_9736 ?auto_9732 ) ) ( not ( = ?auto_9736 ?auto_9735 ) ) ( not ( = ?auto_9738 ?auto_9732 ) ) ( not ( = ?auto_9738 ?auto_9735 ) ) ( not ( = ?auto_9738 ?auto_9736 ) ) ( ON_BOARD ?auto_9740 ?auto_9745 ) ( SUPPORTS ?auto_9740 ?auto_9734 ) ( not ( = ?auto_9735 ?auto_9746 ) ) ( CALIBRATION_TARGET ?auto_9740 ?auto_9746 ) ( not ( = ?auto_9746 ?auto_9736 ) ) ( ON_BOARD ?auto_9744 ?auto_9745 ) ( not ( = ?auto_9740 ?auto_9744 ) ) ( SUPPORTS ?auto_9744 ?auto_9737 ) ( CALIBRATION_TARGET ?auto_9744 ?auto_9746 ) ( not ( = ?auto_9746 ?auto_9738 ) ) ( ON_BOARD ?auto_9743 ?auto_9745 ) ( not ( = ?auto_9744 ?auto_9743 ) ) ( SUPPORTS ?auto_9743 ?auto_9739 ) ( CALIBRATION_TARGET ?auto_9743 ?auto_9746 ) ( not ( = ?auto_9746 ?auto_9732 ) ) ( ON_BOARD ?auto_9741 ?auto_9745 ) ( not ( = ?auto_9743 ?auto_9741 ) ) ( SUPPORTS ?auto_9741 ?auto_9733 ) ( CALIBRATION_TARGET ?auto_9741 ?auto_9746 ) ( POWER_AVAIL ?auto_9745 ) ( POINTING ?auto_9745 ?auto_9742 ) ( not ( = ?auto_9746 ?auto_9742 ) ) ( not ( = ?auto_9732 ?auto_9742 ) ) ( not ( = ?auto_9733 ?auto_9739 ) ) ( not ( = ?auto_9738 ?auto_9742 ) ) ( not ( = ?auto_9733 ?auto_9737 ) ) ( not ( = ?auto_9739 ?auto_9737 ) ) ( not ( = ?auto_9736 ?auto_9742 ) ) ( not ( = ?auto_9744 ?auto_9741 ) ) ( not ( = ?auto_9733 ?auto_9734 ) ) ( not ( = ?auto_9739 ?auto_9734 ) ) ( not ( = ?auto_9737 ?auto_9734 ) ) ( not ( = ?auto_9735 ?auto_9742 ) ) ( not ( = ?auto_9740 ?auto_9743 ) ) ( not ( = ?auto_9740 ?auto_9741 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_9732 ?auto_9733 ?auto_9738 ?auto_9739 ?auto_9735 ?auto_9734 ?auto_9736 ?auto_9737 )
      ( GET-4IMAGE-VERIFY ?auto_9732 ?auto_9733 ?auto_9735 ?auto_9734 ?auto_9736 ?auto_9737 ?auto_9738 ?auto_9739 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_9887 - DIRECTION
      ?auto_9888 - MODE
      ?auto_9890 - DIRECTION
      ?auto_9889 - MODE
      ?auto_9891 - DIRECTION
      ?auto_9892 - MODE
      ?auto_9893 - DIRECTION
      ?auto_9894 - MODE
    )
    :vars
    (
      ?auto_9895 - INSTRUMENT
      ?auto_9900 - SATELLITE
      ?auto_9901 - DIRECTION
      ?auto_9899 - INSTRUMENT
      ?auto_9898 - INSTRUMENT
      ?auto_9896 - INSTRUMENT
      ?auto_9897 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9890 ?auto_9887 ) ) ( not ( = ?auto_9891 ?auto_9887 ) ) ( not ( = ?auto_9891 ?auto_9890 ) ) ( not ( = ?auto_9893 ?auto_9887 ) ) ( not ( = ?auto_9893 ?auto_9890 ) ) ( not ( = ?auto_9893 ?auto_9891 ) ) ( ON_BOARD ?auto_9895 ?auto_9900 ) ( SUPPORTS ?auto_9895 ?auto_9894 ) ( not ( = ?auto_9893 ?auto_9901 ) ) ( CALIBRATION_TARGET ?auto_9895 ?auto_9901 ) ( not ( = ?auto_9901 ?auto_9891 ) ) ( ON_BOARD ?auto_9899 ?auto_9900 ) ( not ( = ?auto_9895 ?auto_9899 ) ) ( SUPPORTS ?auto_9899 ?auto_9892 ) ( CALIBRATION_TARGET ?auto_9899 ?auto_9901 ) ( not ( = ?auto_9901 ?auto_9887 ) ) ( ON_BOARD ?auto_9898 ?auto_9900 ) ( not ( = ?auto_9899 ?auto_9898 ) ) ( SUPPORTS ?auto_9898 ?auto_9888 ) ( CALIBRATION_TARGET ?auto_9898 ?auto_9901 ) ( not ( = ?auto_9901 ?auto_9890 ) ) ( ON_BOARD ?auto_9896 ?auto_9900 ) ( not ( = ?auto_9898 ?auto_9896 ) ) ( SUPPORTS ?auto_9896 ?auto_9889 ) ( CALIBRATION_TARGET ?auto_9896 ?auto_9901 ) ( POWER_AVAIL ?auto_9900 ) ( POINTING ?auto_9900 ?auto_9897 ) ( not ( = ?auto_9901 ?auto_9897 ) ) ( not ( = ?auto_9890 ?auto_9897 ) ) ( not ( = ?auto_9889 ?auto_9888 ) ) ( not ( = ?auto_9887 ?auto_9897 ) ) ( not ( = ?auto_9889 ?auto_9892 ) ) ( not ( = ?auto_9888 ?auto_9892 ) ) ( not ( = ?auto_9891 ?auto_9897 ) ) ( not ( = ?auto_9899 ?auto_9896 ) ) ( not ( = ?auto_9889 ?auto_9894 ) ) ( not ( = ?auto_9888 ?auto_9894 ) ) ( not ( = ?auto_9892 ?auto_9894 ) ) ( not ( = ?auto_9893 ?auto_9897 ) ) ( not ( = ?auto_9895 ?auto_9898 ) ) ( not ( = ?auto_9895 ?auto_9896 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_9890 ?auto_9889 ?auto_9887 ?auto_9888 ?auto_9893 ?auto_9894 ?auto_9891 ?auto_9892 )
      ( GET-4IMAGE-VERIFY ?auto_9887 ?auto_9888 ?auto_9890 ?auto_9889 ?auto_9891 ?auto_9892 ?auto_9893 ?auto_9894 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_9936 - DIRECTION
      ?auto_9937 - MODE
      ?auto_9939 - DIRECTION
      ?auto_9938 - MODE
      ?auto_9940 - DIRECTION
      ?auto_9941 - MODE
      ?auto_9942 - DIRECTION
      ?auto_9943 - MODE
    )
    :vars
    (
      ?auto_9944 - INSTRUMENT
      ?auto_9949 - SATELLITE
      ?auto_9950 - DIRECTION
      ?auto_9948 - INSTRUMENT
      ?auto_9947 - INSTRUMENT
      ?auto_9945 - INSTRUMENT
      ?auto_9946 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_9939 ?auto_9936 ) ) ( not ( = ?auto_9940 ?auto_9936 ) ) ( not ( = ?auto_9940 ?auto_9939 ) ) ( not ( = ?auto_9942 ?auto_9936 ) ) ( not ( = ?auto_9942 ?auto_9939 ) ) ( not ( = ?auto_9942 ?auto_9940 ) ) ( ON_BOARD ?auto_9944 ?auto_9949 ) ( SUPPORTS ?auto_9944 ?auto_9941 ) ( not ( = ?auto_9940 ?auto_9950 ) ) ( CALIBRATION_TARGET ?auto_9944 ?auto_9950 ) ( not ( = ?auto_9950 ?auto_9942 ) ) ( ON_BOARD ?auto_9948 ?auto_9949 ) ( not ( = ?auto_9944 ?auto_9948 ) ) ( SUPPORTS ?auto_9948 ?auto_9943 ) ( CALIBRATION_TARGET ?auto_9948 ?auto_9950 ) ( not ( = ?auto_9950 ?auto_9936 ) ) ( ON_BOARD ?auto_9947 ?auto_9949 ) ( not ( = ?auto_9948 ?auto_9947 ) ) ( SUPPORTS ?auto_9947 ?auto_9937 ) ( CALIBRATION_TARGET ?auto_9947 ?auto_9950 ) ( not ( = ?auto_9950 ?auto_9939 ) ) ( ON_BOARD ?auto_9945 ?auto_9949 ) ( not ( = ?auto_9947 ?auto_9945 ) ) ( SUPPORTS ?auto_9945 ?auto_9938 ) ( CALIBRATION_TARGET ?auto_9945 ?auto_9950 ) ( POWER_AVAIL ?auto_9949 ) ( POINTING ?auto_9949 ?auto_9946 ) ( not ( = ?auto_9950 ?auto_9946 ) ) ( not ( = ?auto_9939 ?auto_9946 ) ) ( not ( = ?auto_9938 ?auto_9937 ) ) ( not ( = ?auto_9936 ?auto_9946 ) ) ( not ( = ?auto_9938 ?auto_9943 ) ) ( not ( = ?auto_9937 ?auto_9943 ) ) ( not ( = ?auto_9942 ?auto_9946 ) ) ( not ( = ?auto_9948 ?auto_9945 ) ) ( not ( = ?auto_9938 ?auto_9941 ) ) ( not ( = ?auto_9937 ?auto_9941 ) ) ( not ( = ?auto_9943 ?auto_9941 ) ) ( not ( = ?auto_9940 ?auto_9946 ) ) ( not ( = ?auto_9944 ?auto_9947 ) ) ( not ( = ?auto_9944 ?auto_9945 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_9939 ?auto_9938 ?auto_9936 ?auto_9937 ?auto_9940 ?auto_9941 ?auto_9942 ?auto_9943 )
      ( GET-4IMAGE-VERIFY ?auto_9936 ?auto_9937 ?auto_9939 ?auto_9938 ?auto_9940 ?auto_9941 ?auto_9942 ?auto_9943 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_10093 - DIRECTION
      ?auto_10094 - MODE
      ?auto_10096 - DIRECTION
      ?auto_10095 - MODE
      ?auto_10097 - DIRECTION
      ?auto_10098 - MODE
      ?auto_10099 - DIRECTION
      ?auto_10100 - MODE
    )
    :vars
    (
      ?auto_10101 - INSTRUMENT
      ?auto_10106 - SATELLITE
      ?auto_10107 - DIRECTION
      ?auto_10105 - INSTRUMENT
      ?auto_10104 - INSTRUMENT
      ?auto_10102 - INSTRUMENT
      ?auto_10103 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10096 ?auto_10093 ) ) ( not ( = ?auto_10097 ?auto_10093 ) ) ( not ( = ?auto_10097 ?auto_10096 ) ) ( not ( = ?auto_10099 ?auto_10093 ) ) ( not ( = ?auto_10099 ?auto_10096 ) ) ( not ( = ?auto_10099 ?auto_10097 ) ) ( ON_BOARD ?auto_10101 ?auto_10106 ) ( SUPPORTS ?auto_10101 ?auto_10100 ) ( not ( = ?auto_10099 ?auto_10107 ) ) ( CALIBRATION_TARGET ?auto_10101 ?auto_10107 ) ( not ( = ?auto_10107 ?auto_10096 ) ) ( ON_BOARD ?auto_10105 ?auto_10106 ) ( not ( = ?auto_10101 ?auto_10105 ) ) ( SUPPORTS ?auto_10105 ?auto_10095 ) ( CALIBRATION_TARGET ?auto_10105 ?auto_10107 ) ( not ( = ?auto_10107 ?auto_10093 ) ) ( ON_BOARD ?auto_10104 ?auto_10106 ) ( not ( = ?auto_10105 ?auto_10104 ) ) ( SUPPORTS ?auto_10104 ?auto_10094 ) ( CALIBRATION_TARGET ?auto_10104 ?auto_10107 ) ( not ( = ?auto_10107 ?auto_10097 ) ) ( ON_BOARD ?auto_10102 ?auto_10106 ) ( not ( = ?auto_10104 ?auto_10102 ) ) ( SUPPORTS ?auto_10102 ?auto_10098 ) ( CALIBRATION_TARGET ?auto_10102 ?auto_10107 ) ( POWER_AVAIL ?auto_10106 ) ( POINTING ?auto_10106 ?auto_10103 ) ( not ( = ?auto_10107 ?auto_10103 ) ) ( not ( = ?auto_10097 ?auto_10103 ) ) ( not ( = ?auto_10098 ?auto_10094 ) ) ( not ( = ?auto_10093 ?auto_10103 ) ) ( not ( = ?auto_10098 ?auto_10095 ) ) ( not ( = ?auto_10094 ?auto_10095 ) ) ( not ( = ?auto_10096 ?auto_10103 ) ) ( not ( = ?auto_10105 ?auto_10102 ) ) ( not ( = ?auto_10098 ?auto_10100 ) ) ( not ( = ?auto_10094 ?auto_10100 ) ) ( not ( = ?auto_10095 ?auto_10100 ) ) ( not ( = ?auto_10099 ?auto_10103 ) ) ( not ( = ?auto_10101 ?auto_10104 ) ) ( not ( = ?auto_10101 ?auto_10102 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_10097 ?auto_10098 ?auto_10093 ?auto_10094 ?auto_10099 ?auto_10100 ?auto_10096 ?auto_10095 )
      ( GET-4IMAGE-VERIFY ?auto_10093 ?auto_10094 ?auto_10096 ?auto_10095 ?auto_10097 ?auto_10098 ?auto_10099 ?auto_10100 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_10142 - DIRECTION
      ?auto_10143 - MODE
      ?auto_10145 - DIRECTION
      ?auto_10144 - MODE
      ?auto_10146 - DIRECTION
      ?auto_10147 - MODE
      ?auto_10148 - DIRECTION
      ?auto_10149 - MODE
    )
    :vars
    (
      ?auto_10150 - INSTRUMENT
      ?auto_10155 - SATELLITE
      ?auto_10156 - DIRECTION
      ?auto_10154 - INSTRUMENT
      ?auto_10153 - INSTRUMENT
      ?auto_10151 - INSTRUMENT
      ?auto_10152 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10145 ?auto_10142 ) ) ( not ( = ?auto_10146 ?auto_10142 ) ) ( not ( = ?auto_10146 ?auto_10145 ) ) ( not ( = ?auto_10148 ?auto_10142 ) ) ( not ( = ?auto_10148 ?auto_10145 ) ) ( not ( = ?auto_10148 ?auto_10146 ) ) ( ON_BOARD ?auto_10150 ?auto_10155 ) ( SUPPORTS ?auto_10150 ?auto_10147 ) ( not ( = ?auto_10146 ?auto_10156 ) ) ( CALIBRATION_TARGET ?auto_10150 ?auto_10156 ) ( not ( = ?auto_10156 ?auto_10145 ) ) ( ON_BOARD ?auto_10154 ?auto_10155 ) ( not ( = ?auto_10150 ?auto_10154 ) ) ( SUPPORTS ?auto_10154 ?auto_10144 ) ( CALIBRATION_TARGET ?auto_10154 ?auto_10156 ) ( not ( = ?auto_10156 ?auto_10142 ) ) ( ON_BOARD ?auto_10153 ?auto_10155 ) ( not ( = ?auto_10154 ?auto_10153 ) ) ( SUPPORTS ?auto_10153 ?auto_10143 ) ( CALIBRATION_TARGET ?auto_10153 ?auto_10156 ) ( not ( = ?auto_10156 ?auto_10148 ) ) ( ON_BOARD ?auto_10151 ?auto_10155 ) ( not ( = ?auto_10153 ?auto_10151 ) ) ( SUPPORTS ?auto_10151 ?auto_10149 ) ( CALIBRATION_TARGET ?auto_10151 ?auto_10156 ) ( POWER_AVAIL ?auto_10155 ) ( POINTING ?auto_10155 ?auto_10152 ) ( not ( = ?auto_10156 ?auto_10152 ) ) ( not ( = ?auto_10148 ?auto_10152 ) ) ( not ( = ?auto_10149 ?auto_10143 ) ) ( not ( = ?auto_10142 ?auto_10152 ) ) ( not ( = ?auto_10149 ?auto_10144 ) ) ( not ( = ?auto_10143 ?auto_10144 ) ) ( not ( = ?auto_10145 ?auto_10152 ) ) ( not ( = ?auto_10154 ?auto_10151 ) ) ( not ( = ?auto_10149 ?auto_10147 ) ) ( not ( = ?auto_10143 ?auto_10147 ) ) ( not ( = ?auto_10144 ?auto_10147 ) ) ( not ( = ?auto_10146 ?auto_10152 ) ) ( not ( = ?auto_10150 ?auto_10153 ) ) ( not ( = ?auto_10150 ?auto_10151 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_10148 ?auto_10149 ?auto_10142 ?auto_10143 ?auto_10146 ?auto_10147 ?auto_10145 ?auto_10144 )
      ( GET-4IMAGE-VERIFY ?auto_10142 ?auto_10143 ?auto_10145 ?auto_10144 ?auto_10146 ?auto_10147 ?auto_10148 ?auto_10149 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_10242 - DIRECTION
      ?auto_10243 - MODE
      ?auto_10245 - DIRECTION
      ?auto_10244 - MODE
      ?auto_10246 - DIRECTION
      ?auto_10247 - MODE
      ?auto_10248 - DIRECTION
      ?auto_10249 - MODE
    )
    :vars
    (
      ?auto_10250 - INSTRUMENT
      ?auto_10255 - SATELLITE
      ?auto_10256 - DIRECTION
      ?auto_10254 - INSTRUMENT
      ?auto_10253 - INSTRUMENT
      ?auto_10251 - INSTRUMENT
      ?auto_10252 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10245 ?auto_10242 ) ) ( not ( = ?auto_10246 ?auto_10242 ) ) ( not ( = ?auto_10246 ?auto_10245 ) ) ( not ( = ?auto_10248 ?auto_10242 ) ) ( not ( = ?auto_10248 ?auto_10245 ) ) ( not ( = ?auto_10248 ?auto_10246 ) ) ( ON_BOARD ?auto_10250 ?auto_10255 ) ( SUPPORTS ?auto_10250 ?auto_10244 ) ( not ( = ?auto_10245 ?auto_10256 ) ) ( CALIBRATION_TARGET ?auto_10250 ?auto_10256 ) ( not ( = ?auto_10256 ?auto_10248 ) ) ( ON_BOARD ?auto_10254 ?auto_10255 ) ( not ( = ?auto_10250 ?auto_10254 ) ) ( SUPPORTS ?auto_10254 ?auto_10249 ) ( CALIBRATION_TARGET ?auto_10254 ?auto_10256 ) ( not ( = ?auto_10256 ?auto_10242 ) ) ( ON_BOARD ?auto_10253 ?auto_10255 ) ( not ( = ?auto_10254 ?auto_10253 ) ) ( SUPPORTS ?auto_10253 ?auto_10243 ) ( CALIBRATION_TARGET ?auto_10253 ?auto_10256 ) ( not ( = ?auto_10256 ?auto_10246 ) ) ( ON_BOARD ?auto_10251 ?auto_10255 ) ( not ( = ?auto_10253 ?auto_10251 ) ) ( SUPPORTS ?auto_10251 ?auto_10247 ) ( CALIBRATION_TARGET ?auto_10251 ?auto_10256 ) ( POWER_AVAIL ?auto_10255 ) ( POINTING ?auto_10255 ?auto_10252 ) ( not ( = ?auto_10256 ?auto_10252 ) ) ( not ( = ?auto_10246 ?auto_10252 ) ) ( not ( = ?auto_10247 ?auto_10243 ) ) ( not ( = ?auto_10242 ?auto_10252 ) ) ( not ( = ?auto_10247 ?auto_10249 ) ) ( not ( = ?auto_10243 ?auto_10249 ) ) ( not ( = ?auto_10248 ?auto_10252 ) ) ( not ( = ?auto_10254 ?auto_10251 ) ) ( not ( = ?auto_10247 ?auto_10244 ) ) ( not ( = ?auto_10243 ?auto_10244 ) ) ( not ( = ?auto_10249 ?auto_10244 ) ) ( not ( = ?auto_10245 ?auto_10252 ) ) ( not ( = ?auto_10250 ?auto_10253 ) ) ( not ( = ?auto_10250 ?auto_10251 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_10246 ?auto_10247 ?auto_10242 ?auto_10243 ?auto_10245 ?auto_10244 ?auto_10248 ?auto_10249 )
      ( GET-4IMAGE-VERIFY ?auto_10242 ?auto_10243 ?auto_10245 ?auto_10244 ?auto_10246 ?auto_10247 ?auto_10248 ?auto_10249 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_10346 - DIRECTION
      ?auto_10347 - MODE
      ?auto_10349 - DIRECTION
      ?auto_10348 - MODE
      ?auto_10350 - DIRECTION
      ?auto_10351 - MODE
      ?auto_10352 - DIRECTION
      ?auto_10353 - MODE
    )
    :vars
    (
      ?auto_10354 - INSTRUMENT
      ?auto_10359 - SATELLITE
      ?auto_10360 - DIRECTION
      ?auto_10358 - INSTRUMENT
      ?auto_10357 - INSTRUMENT
      ?auto_10355 - INSTRUMENT
      ?auto_10356 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10349 ?auto_10346 ) ) ( not ( = ?auto_10350 ?auto_10346 ) ) ( not ( = ?auto_10350 ?auto_10349 ) ) ( not ( = ?auto_10352 ?auto_10346 ) ) ( not ( = ?auto_10352 ?auto_10349 ) ) ( not ( = ?auto_10352 ?auto_10350 ) ) ( ON_BOARD ?auto_10354 ?auto_10359 ) ( SUPPORTS ?auto_10354 ?auto_10348 ) ( not ( = ?auto_10349 ?auto_10360 ) ) ( CALIBRATION_TARGET ?auto_10354 ?auto_10360 ) ( not ( = ?auto_10360 ?auto_10350 ) ) ( ON_BOARD ?auto_10358 ?auto_10359 ) ( not ( = ?auto_10354 ?auto_10358 ) ) ( SUPPORTS ?auto_10358 ?auto_10351 ) ( CALIBRATION_TARGET ?auto_10358 ?auto_10360 ) ( not ( = ?auto_10360 ?auto_10346 ) ) ( ON_BOARD ?auto_10357 ?auto_10359 ) ( not ( = ?auto_10358 ?auto_10357 ) ) ( SUPPORTS ?auto_10357 ?auto_10347 ) ( CALIBRATION_TARGET ?auto_10357 ?auto_10360 ) ( not ( = ?auto_10360 ?auto_10352 ) ) ( ON_BOARD ?auto_10355 ?auto_10359 ) ( not ( = ?auto_10357 ?auto_10355 ) ) ( SUPPORTS ?auto_10355 ?auto_10353 ) ( CALIBRATION_TARGET ?auto_10355 ?auto_10360 ) ( POWER_AVAIL ?auto_10359 ) ( POINTING ?auto_10359 ?auto_10356 ) ( not ( = ?auto_10360 ?auto_10356 ) ) ( not ( = ?auto_10352 ?auto_10356 ) ) ( not ( = ?auto_10353 ?auto_10347 ) ) ( not ( = ?auto_10346 ?auto_10356 ) ) ( not ( = ?auto_10353 ?auto_10351 ) ) ( not ( = ?auto_10347 ?auto_10351 ) ) ( not ( = ?auto_10350 ?auto_10356 ) ) ( not ( = ?auto_10358 ?auto_10355 ) ) ( not ( = ?auto_10353 ?auto_10348 ) ) ( not ( = ?auto_10347 ?auto_10348 ) ) ( not ( = ?auto_10351 ?auto_10348 ) ) ( not ( = ?auto_10349 ?auto_10356 ) ) ( not ( = ?auto_10354 ?auto_10357 ) ) ( not ( = ?auto_10354 ?auto_10355 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_10352 ?auto_10353 ?auto_10346 ?auto_10347 ?auto_10349 ?auto_10348 ?auto_10350 ?auto_10351 )
      ( GET-4IMAGE-VERIFY ?auto_10346 ?auto_10347 ?auto_10349 ?auto_10348 ?auto_10350 ?auto_10351 ?auto_10352 ?auto_10353 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_10501 - DIRECTION
      ?auto_10502 - MODE
      ?auto_10504 - DIRECTION
      ?auto_10503 - MODE
      ?auto_10505 - DIRECTION
      ?auto_10506 - MODE
      ?auto_10507 - DIRECTION
      ?auto_10508 - MODE
    )
    :vars
    (
      ?auto_10509 - INSTRUMENT
      ?auto_10514 - SATELLITE
      ?auto_10515 - DIRECTION
      ?auto_10513 - INSTRUMENT
      ?auto_10512 - INSTRUMENT
      ?auto_10510 - INSTRUMENT
      ?auto_10511 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10504 ?auto_10501 ) ) ( not ( = ?auto_10505 ?auto_10501 ) ) ( not ( = ?auto_10505 ?auto_10504 ) ) ( not ( = ?auto_10507 ?auto_10501 ) ) ( not ( = ?auto_10507 ?auto_10504 ) ) ( not ( = ?auto_10507 ?auto_10505 ) ) ( ON_BOARD ?auto_10509 ?auto_10514 ) ( SUPPORTS ?auto_10509 ?auto_10508 ) ( not ( = ?auto_10507 ?auto_10515 ) ) ( CALIBRATION_TARGET ?auto_10509 ?auto_10515 ) ( not ( = ?auto_10515 ?auto_10501 ) ) ( ON_BOARD ?auto_10513 ?auto_10514 ) ( not ( = ?auto_10509 ?auto_10513 ) ) ( SUPPORTS ?auto_10513 ?auto_10502 ) ( CALIBRATION_TARGET ?auto_10513 ?auto_10515 ) ( not ( = ?auto_10515 ?auto_10505 ) ) ( ON_BOARD ?auto_10512 ?auto_10514 ) ( not ( = ?auto_10513 ?auto_10512 ) ) ( SUPPORTS ?auto_10512 ?auto_10506 ) ( CALIBRATION_TARGET ?auto_10512 ?auto_10515 ) ( not ( = ?auto_10515 ?auto_10504 ) ) ( ON_BOARD ?auto_10510 ?auto_10514 ) ( not ( = ?auto_10512 ?auto_10510 ) ) ( SUPPORTS ?auto_10510 ?auto_10503 ) ( CALIBRATION_TARGET ?auto_10510 ?auto_10515 ) ( POWER_AVAIL ?auto_10514 ) ( POINTING ?auto_10514 ?auto_10511 ) ( not ( = ?auto_10515 ?auto_10511 ) ) ( not ( = ?auto_10504 ?auto_10511 ) ) ( not ( = ?auto_10503 ?auto_10506 ) ) ( not ( = ?auto_10505 ?auto_10511 ) ) ( not ( = ?auto_10503 ?auto_10502 ) ) ( not ( = ?auto_10506 ?auto_10502 ) ) ( not ( = ?auto_10501 ?auto_10511 ) ) ( not ( = ?auto_10513 ?auto_10510 ) ) ( not ( = ?auto_10503 ?auto_10508 ) ) ( not ( = ?auto_10506 ?auto_10508 ) ) ( not ( = ?auto_10502 ?auto_10508 ) ) ( not ( = ?auto_10507 ?auto_10511 ) ) ( not ( = ?auto_10509 ?auto_10512 ) ) ( not ( = ?auto_10509 ?auto_10510 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_10504 ?auto_10503 ?auto_10505 ?auto_10506 ?auto_10507 ?auto_10508 ?auto_10501 ?auto_10502 )
      ( GET-4IMAGE-VERIFY ?auto_10501 ?auto_10502 ?auto_10504 ?auto_10503 ?auto_10505 ?auto_10506 ?auto_10507 ?auto_10508 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_10550 - DIRECTION
      ?auto_10551 - MODE
      ?auto_10553 - DIRECTION
      ?auto_10552 - MODE
      ?auto_10554 - DIRECTION
      ?auto_10555 - MODE
      ?auto_10556 - DIRECTION
      ?auto_10557 - MODE
    )
    :vars
    (
      ?auto_10558 - INSTRUMENT
      ?auto_10563 - SATELLITE
      ?auto_10564 - DIRECTION
      ?auto_10562 - INSTRUMENT
      ?auto_10561 - INSTRUMENT
      ?auto_10559 - INSTRUMENT
      ?auto_10560 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10553 ?auto_10550 ) ) ( not ( = ?auto_10554 ?auto_10550 ) ) ( not ( = ?auto_10554 ?auto_10553 ) ) ( not ( = ?auto_10556 ?auto_10550 ) ) ( not ( = ?auto_10556 ?auto_10553 ) ) ( not ( = ?auto_10556 ?auto_10554 ) ) ( ON_BOARD ?auto_10558 ?auto_10563 ) ( SUPPORTS ?auto_10558 ?auto_10555 ) ( not ( = ?auto_10554 ?auto_10564 ) ) ( CALIBRATION_TARGET ?auto_10558 ?auto_10564 ) ( not ( = ?auto_10564 ?auto_10550 ) ) ( ON_BOARD ?auto_10562 ?auto_10563 ) ( not ( = ?auto_10558 ?auto_10562 ) ) ( SUPPORTS ?auto_10562 ?auto_10551 ) ( CALIBRATION_TARGET ?auto_10562 ?auto_10564 ) ( not ( = ?auto_10564 ?auto_10556 ) ) ( ON_BOARD ?auto_10561 ?auto_10563 ) ( not ( = ?auto_10562 ?auto_10561 ) ) ( SUPPORTS ?auto_10561 ?auto_10557 ) ( CALIBRATION_TARGET ?auto_10561 ?auto_10564 ) ( not ( = ?auto_10564 ?auto_10553 ) ) ( ON_BOARD ?auto_10559 ?auto_10563 ) ( not ( = ?auto_10561 ?auto_10559 ) ) ( SUPPORTS ?auto_10559 ?auto_10552 ) ( CALIBRATION_TARGET ?auto_10559 ?auto_10564 ) ( POWER_AVAIL ?auto_10563 ) ( POINTING ?auto_10563 ?auto_10560 ) ( not ( = ?auto_10564 ?auto_10560 ) ) ( not ( = ?auto_10553 ?auto_10560 ) ) ( not ( = ?auto_10552 ?auto_10557 ) ) ( not ( = ?auto_10556 ?auto_10560 ) ) ( not ( = ?auto_10552 ?auto_10551 ) ) ( not ( = ?auto_10557 ?auto_10551 ) ) ( not ( = ?auto_10550 ?auto_10560 ) ) ( not ( = ?auto_10562 ?auto_10559 ) ) ( not ( = ?auto_10552 ?auto_10555 ) ) ( not ( = ?auto_10557 ?auto_10555 ) ) ( not ( = ?auto_10551 ?auto_10555 ) ) ( not ( = ?auto_10554 ?auto_10560 ) ) ( not ( = ?auto_10558 ?auto_10561 ) ) ( not ( = ?auto_10558 ?auto_10559 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_10553 ?auto_10552 ?auto_10556 ?auto_10557 ?auto_10554 ?auto_10555 ?auto_10550 ?auto_10551 )
      ( GET-4IMAGE-VERIFY ?auto_10550 ?auto_10551 ?auto_10553 ?auto_10552 ?auto_10554 ?auto_10555 ?auto_10556 ?auto_10557 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_10599 - DIRECTION
      ?auto_10600 - MODE
      ?auto_10602 - DIRECTION
      ?auto_10601 - MODE
      ?auto_10603 - DIRECTION
      ?auto_10604 - MODE
      ?auto_10605 - DIRECTION
      ?auto_10606 - MODE
    )
    :vars
    (
      ?auto_10607 - INSTRUMENT
      ?auto_10612 - SATELLITE
      ?auto_10613 - DIRECTION
      ?auto_10611 - INSTRUMENT
      ?auto_10610 - INSTRUMENT
      ?auto_10608 - INSTRUMENT
      ?auto_10609 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10602 ?auto_10599 ) ) ( not ( = ?auto_10603 ?auto_10599 ) ) ( not ( = ?auto_10603 ?auto_10602 ) ) ( not ( = ?auto_10605 ?auto_10599 ) ) ( not ( = ?auto_10605 ?auto_10602 ) ) ( not ( = ?auto_10605 ?auto_10603 ) ) ( ON_BOARD ?auto_10607 ?auto_10612 ) ( SUPPORTS ?auto_10607 ?auto_10606 ) ( not ( = ?auto_10605 ?auto_10613 ) ) ( CALIBRATION_TARGET ?auto_10607 ?auto_10613 ) ( not ( = ?auto_10613 ?auto_10599 ) ) ( ON_BOARD ?auto_10611 ?auto_10612 ) ( not ( = ?auto_10607 ?auto_10611 ) ) ( SUPPORTS ?auto_10611 ?auto_10600 ) ( CALIBRATION_TARGET ?auto_10611 ?auto_10613 ) ( not ( = ?auto_10613 ?auto_10602 ) ) ( ON_BOARD ?auto_10610 ?auto_10612 ) ( not ( = ?auto_10611 ?auto_10610 ) ) ( SUPPORTS ?auto_10610 ?auto_10601 ) ( CALIBRATION_TARGET ?auto_10610 ?auto_10613 ) ( not ( = ?auto_10613 ?auto_10603 ) ) ( ON_BOARD ?auto_10608 ?auto_10612 ) ( not ( = ?auto_10610 ?auto_10608 ) ) ( SUPPORTS ?auto_10608 ?auto_10604 ) ( CALIBRATION_TARGET ?auto_10608 ?auto_10613 ) ( POWER_AVAIL ?auto_10612 ) ( POINTING ?auto_10612 ?auto_10609 ) ( not ( = ?auto_10613 ?auto_10609 ) ) ( not ( = ?auto_10603 ?auto_10609 ) ) ( not ( = ?auto_10604 ?auto_10601 ) ) ( not ( = ?auto_10602 ?auto_10609 ) ) ( not ( = ?auto_10604 ?auto_10600 ) ) ( not ( = ?auto_10601 ?auto_10600 ) ) ( not ( = ?auto_10599 ?auto_10609 ) ) ( not ( = ?auto_10611 ?auto_10608 ) ) ( not ( = ?auto_10604 ?auto_10606 ) ) ( not ( = ?auto_10601 ?auto_10606 ) ) ( not ( = ?auto_10600 ?auto_10606 ) ) ( not ( = ?auto_10605 ?auto_10609 ) ) ( not ( = ?auto_10607 ?auto_10610 ) ) ( not ( = ?auto_10607 ?auto_10608 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_10603 ?auto_10604 ?auto_10602 ?auto_10601 ?auto_10605 ?auto_10606 ?auto_10599 ?auto_10600 )
      ( GET-4IMAGE-VERIFY ?auto_10599 ?auto_10600 ?auto_10602 ?auto_10601 ?auto_10603 ?auto_10604 ?auto_10605 ?auto_10606 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_10648 - DIRECTION
      ?auto_10649 - MODE
      ?auto_10651 - DIRECTION
      ?auto_10650 - MODE
      ?auto_10652 - DIRECTION
      ?auto_10653 - MODE
      ?auto_10654 - DIRECTION
      ?auto_10655 - MODE
    )
    :vars
    (
      ?auto_10656 - INSTRUMENT
      ?auto_10661 - SATELLITE
      ?auto_10662 - DIRECTION
      ?auto_10660 - INSTRUMENT
      ?auto_10659 - INSTRUMENT
      ?auto_10657 - INSTRUMENT
      ?auto_10658 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10651 ?auto_10648 ) ) ( not ( = ?auto_10652 ?auto_10648 ) ) ( not ( = ?auto_10652 ?auto_10651 ) ) ( not ( = ?auto_10654 ?auto_10648 ) ) ( not ( = ?auto_10654 ?auto_10651 ) ) ( not ( = ?auto_10654 ?auto_10652 ) ) ( ON_BOARD ?auto_10656 ?auto_10661 ) ( SUPPORTS ?auto_10656 ?auto_10653 ) ( not ( = ?auto_10652 ?auto_10662 ) ) ( CALIBRATION_TARGET ?auto_10656 ?auto_10662 ) ( not ( = ?auto_10662 ?auto_10648 ) ) ( ON_BOARD ?auto_10660 ?auto_10661 ) ( not ( = ?auto_10656 ?auto_10660 ) ) ( SUPPORTS ?auto_10660 ?auto_10649 ) ( CALIBRATION_TARGET ?auto_10660 ?auto_10662 ) ( not ( = ?auto_10662 ?auto_10651 ) ) ( ON_BOARD ?auto_10659 ?auto_10661 ) ( not ( = ?auto_10660 ?auto_10659 ) ) ( SUPPORTS ?auto_10659 ?auto_10650 ) ( CALIBRATION_TARGET ?auto_10659 ?auto_10662 ) ( not ( = ?auto_10662 ?auto_10654 ) ) ( ON_BOARD ?auto_10657 ?auto_10661 ) ( not ( = ?auto_10659 ?auto_10657 ) ) ( SUPPORTS ?auto_10657 ?auto_10655 ) ( CALIBRATION_TARGET ?auto_10657 ?auto_10662 ) ( POWER_AVAIL ?auto_10661 ) ( POINTING ?auto_10661 ?auto_10658 ) ( not ( = ?auto_10662 ?auto_10658 ) ) ( not ( = ?auto_10654 ?auto_10658 ) ) ( not ( = ?auto_10655 ?auto_10650 ) ) ( not ( = ?auto_10651 ?auto_10658 ) ) ( not ( = ?auto_10655 ?auto_10649 ) ) ( not ( = ?auto_10650 ?auto_10649 ) ) ( not ( = ?auto_10648 ?auto_10658 ) ) ( not ( = ?auto_10660 ?auto_10657 ) ) ( not ( = ?auto_10655 ?auto_10653 ) ) ( not ( = ?auto_10650 ?auto_10653 ) ) ( not ( = ?auto_10649 ?auto_10653 ) ) ( not ( = ?auto_10652 ?auto_10658 ) ) ( not ( = ?auto_10656 ?auto_10659 ) ) ( not ( = ?auto_10656 ?auto_10657 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_10654 ?auto_10655 ?auto_10651 ?auto_10650 ?auto_10652 ?auto_10653 ?auto_10648 ?auto_10649 )
      ( GET-4IMAGE-VERIFY ?auto_10648 ?auto_10649 ?auto_10651 ?auto_10650 ?auto_10652 ?auto_10653 ?auto_10654 ?auto_10655 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_10856 - DIRECTION
      ?auto_10857 - MODE
      ?auto_10859 - DIRECTION
      ?auto_10858 - MODE
      ?auto_10860 - DIRECTION
      ?auto_10861 - MODE
      ?auto_10862 - DIRECTION
      ?auto_10863 - MODE
    )
    :vars
    (
      ?auto_10864 - INSTRUMENT
      ?auto_10869 - SATELLITE
      ?auto_10870 - DIRECTION
      ?auto_10868 - INSTRUMENT
      ?auto_10867 - INSTRUMENT
      ?auto_10865 - INSTRUMENT
      ?auto_10866 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10859 ?auto_10856 ) ) ( not ( = ?auto_10860 ?auto_10856 ) ) ( not ( = ?auto_10860 ?auto_10859 ) ) ( not ( = ?auto_10862 ?auto_10856 ) ) ( not ( = ?auto_10862 ?auto_10859 ) ) ( not ( = ?auto_10862 ?auto_10860 ) ) ( ON_BOARD ?auto_10864 ?auto_10869 ) ( SUPPORTS ?auto_10864 ?auto_10858 ) ( not ( = ?auto_10859 ?auto_10870 ) ) ( CALIBRATION_TARGET ?auto_10864 ?auto_10870 ) ( not ( = ?auto_10870 ?auto_10856 ) ) ( ON_BOARD ?auto_10868 ?auto_10869 ) ( not ( = ?auto_10864 ?auto_10868 ) ) ( SUPPORTS ?auto_10868 ?auto_10857 ) ( CALIBRATION_TARGET ?auto_10868 ?auto_10870 ) ( not ( = ?auto_10870 ?auto_10862 ) ) ( ON_BOARD ?auto_10867 ?auto_10869 ) ( not ( = ?auto_10868 ?auto_10867 ) ) ( SUPPORTS ?auto_10867 ?auto_10863 ) ( CALIBRATION_TARGET ?auto_10867 ?auto_10870 ) ( not ( = ?auto_10870 ?auto_10860 ) ) ( ON_BOARD ?auto_10865 ?auto_10869 ) ( not ( = ?auto_10867 ?auto_10865 ) ) ( SUPPORTS ?auto_10865 ?auto_10861 ) ( CALIBRATION_TARGET ?auto_10865 ?auto_10870 ) ( POWER_AVAIL ?auto_10869 ) ( POINTING ?auto_10869 ?auto_10866 ) ( not ( = ?auto_10870 ?auto_10866 ) ) ( not ( = ?auto_10860 ?auto_10866 ) ) ( not ( = ?auto_10861 ?auto_10863 ) ) ( not ( = ?auto_10862 ?auto_10866 ) ) ( not ( = ?auto_10861 ?auto_10857 ) ) ( not ( = ?auto_10863 ?auto_10857 ) ) ( not ( = ?auto_10856 ?auto_10866 ) ) ( not ( = ?auto_10868 ?auto_10865 ) ) ( not ( = ?auto_10861 ?auto_10858 ) ) ( not ( = ?auto_10863 ?auto_10858 ) ) ( not ( = ?auto_10857 ?auto_10858 ) ) ( not ( = ?auto_10859 ?auto_10866 ) ) ( not ( = ?auto_10864 ?auto_10867 ) ) ( not ( = ?auto_10864 ?auto_10865 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_10860 ?auto_10861 ?auto_10862 ?auto_10863 ?auto_10859 ?auto_10858 ?auto_10856 ?auto_10857 )
      ( GET-4IMAGE-VERIFY ?auto_10856 ?auto_10857 ?auto_10859 ?auto_10858 ?auto_10860 ?auto_10861 ?auto_10862 ?auto_10863 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_10905 - DIRECTION
      ?auto_10906 - MODE
      ?auto_10908 - DIRECTION
      ?auto_10907 - MODE
      ?auto_10909 - DIRECTION
      ?auto_10910 - MODE
      ?auto_10911 - DIRECTION
      ?auto_10912 - MODE
    )
    :vars
    (
      ?auto_10913 - INSTRUMENT
      ?auto_10918 - SATELLITE
      ?auto_10919 - DIRECTION
      ?auto_10917 - INSTRUMENT
      ?auto_10916 - INSTRUMENT
      ?auto_10914 - INSTRUMENT
      ?auto_10915 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_10908 ?auto_10905 ) ) ( not ( = ?auto_10909 ?auto_10905 ) ) ( not ( = ?auto_10909 ?auto_10908 ) ) ( not ( = ?auto_10911 ?auto_10905 ) ) ( not ( = ?auto_10911 ?auto_10908 ) ) ( not ( = ?auto_10911 ?auto_10909 ) ) ( ON_BOARD ?auto_10913 ?auto_10918 ) ( SUPPORTS ?auto_10913 ?auto_10907 ) ( not ( = ?auto_10908 ?auto_10919 ) ) ( CALIBRATION_TARGET ?auto_10913 ?auto_10919 ) ( not ( = ?auto_10919 ?auto_10905 ) ) ( ON_BOARD ?auto_10917 ?auto_10918 ) ( not ( = ?auto_10913 ?auto_10917 ) ) ( SUPPORTS ?auto_10917 ?auto_10906 ) ( CALIBRATION_TARGET ?auto_10917 ?auto_10919 ) ( not ( = ?auto_10919 ?auto_10909 ) ) ( ON_BOARD ?auto_10916 ?auto_10918 ) ( not ( = ?auto_10917 ?auto_10916 ) ) ( SUPPORTS ?auto_10916 ?auto_10910 ) ( CALIBRATION_TARGET ?auto_10916 ?auto_10919 ) ( not ( = ?auto_10919 ?auto_10911 ) ) ( ON_BOARD ?auto_10914 ?auto_10918 ) ( not ( = ?auto_10916 ?auto_10914 ) ) ( SUPPORTS ?auto_10914 ?auto_10912 ) ( CALIBRATION_TARGET ?auto_10914 ?auto_10919 ) ( POWER_AVAIL ?auto_10918 ) ( POINTING ?auto_10918 ?auto_10915 ) ( not ( = ?auto_10919 ?auto_10915 ) ) ( not ( = ?auto_10911 ?auto_10915 ) ) ( not ( = ?auto_10912 ?auto_10910 ) ) ( not ( = ?auto_10909 ?auto_10915 ) ) ( not ( = ?auto_10912 ?auto_10906 ) ) ( not ( = ?auto_10910 ?auto_10906 ) ) ( not ( = ?auto_10905 ?auto_10915 ) ) ( not ( = ?auto_10917 ?auto_10914 ) ) ( not ( = ?auto_10912 ?auto_10907 ) ) ( not ( = ?auto_10910 ?auto_10907 ) ) ( not ( = ?auto_10906 ?auto_10907 ) ) ( not ( = ?auto_10908 ?auto_10915 ) ) ( not ( = ?auto_10913 ?auto_10916 ) ) ( not ( = ?auto_10913 ?auto_10914 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_10911 ?auto_10912 ?auto_10909 ?auto_10910 ?auto_10908 ?auto_10907 ?auto_10905 ?auto_10906 )
      ( GET-4IMAGE-VERIFY ?auto_10905 ?auto_10906 ?auto_10908 ?auto_10907 ?auto_10909 ?auto_10910 ?auto_10911 ?auto_10912 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_11221 - DIRECTION
      ?auto_11222 - MODE
      ?auto_11224 - DIRECTION
      ?auto_11223 - MODE
      ?auto_11225 - DIRECTION
      ?auto_11226 - MODE
      ?auto_11227 - DIRECTION
      ?auto_11228 - MODE
    )
    :vars
    (
      ?auto_11229 - INSTRUMENT
      ?auto_11234 - SATELLITE
      ?auto_11235 - DIRECTION
      ?auto_11233 - INSTRUMENT
      ?auto_11232 - INSTRUMENT
      ?auto_11230 - INSTRUMENT
      ?auto_11231 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_11224 ?auto_11221 ) ) ( not ( = ?auto_11225 ?auto_11221 ) ) ( not ( = ?auto_11225 ?auto_11224 ) ) ( not ( = ?auto_11227 ?auto_11221 ) ) ( not ( = ?auto_11227 ?auto_11224 ) ) ( not ( = ?auto_11227 ?auto_11225 ) ) ( ON_BOARD ?auto_11229 ?auto_11234 ) ( SUPPORTS ?auto_11229 ?auto_11222 ) ( not ( = ?auto_11221 ?auto_11235 ) ) ( CALIBRATION_TARGET ?auto_11229 ?auto_11235 ) ( not ( = ?auto_11235 ?auto_11227 ) ) ( ON_BOARD ?auto_11233 ?auto_11234 ) ( not ( = ?auto_11229 ?auto_11233 ) ) ( SUPPORTS ?auto_11233 ?auto_11228 ) ( CALIBRATION_TARGET ?auto_11233 ?auto_11235 ) ( not ( = ?auto_11235 ?auto_11225 ) ) ( ON_BOARD ?auto_11232 ?auto_11234 ) ( not ( = ?auto_11233 ?auto_11232 ) ) ( SUPPORTS ?auto_11232 ?auto_11226 ) ( CALIBRATION_TARGET ?auto_11232 ?auto_11235 ) ( not ( = ?auto_11235 ?auto_11224 ) ) ( ON_BOARD ?auto_11230 ?auto_11234 ) ( not ( = ?auto_11232 ?auto_11230 ) ) ( SUPPORTS ?auto_11230 ?auto_11223 ) ( CALIBRATION_TARGET ?auto_11230 ?auto_11235 ) ( POWER_AVAIL ?auto_11234 ) ( POINTING ?auto_11234 ?auto_11231 ) ( not ( = ?auto_11235 ?auto_11231 ) ) ( not ( = ?auto_11224 ?auto_11231 ) ) ( not ( = ?auto_11223 ?auto_11226 ) ) ( not ( = ?auto_11225 ?auto_11231 ) ) ( not ( = ?auto_11223 ?auto_11228 ) ) ( not ( = ?auto_11226 ?auto_11228 ) ) ( not ( = ?auto_11227 ?auto_11231 ) ) ( not ( = ?auto_11233 ?auto_11230 ) ) ( not ( = ?auto_11223 ?auto_11222 ) ) ( not ( = ?auto_11226 ?auto_11222 ) ) ( not ( = ?auto_11228 ?auto_11222 ) ) ( not ( = ?auto_11221 ?auto_11231 ) ) ( not ( = ?auto_11229 ?auto_11232 ) ) ( not ( = ?auto_11229 ?auto_11230 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_11224 ?auto_11223 ?auto_11225 ?auto_11226 ?auto_11221 ?auto_11222 ?auto_11227 ?auto_11228 )
      ( GET-4IMAGE-VERIFY ?auto_11221 ?auto_11222 ?auto_11224 ?auto_11223 ?auto_11225 ?auto_11226 ?auto_11227 ?auto_11228 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_11270 - DIRECTION
      ?auto_11271 - MODE
      ?auto_11273 - DIRECTION
      ?auto_11272 - MODE
      ?auto_11274 - DIRECTION
      ?auto_11275 - MODE
      ?auto_11276 - DIRECTION
      ?auto_11277 - MODE
    )
    :vars
    (
      ?auto_11278 - INSTRUMENT
      ?auto_11283 - SATELLITE
      ?auto_11284 - DIRECTION
      ?auto_11282 - INSTRUMENT
      ?auto_11281 - INSTRUMENT
      ?auto_11279 - INSTRUMENT
      ?auto_11280 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_11273 ?auto_11270 ) ) ( not ( = ?auto_11274 ?auto_11270 ) ) ( not ( = ?auto_11274 ?auto_11273 ) ) ( not ( = ?auto_11276 ?auto_11270 ) ) ( not ( = ?auto_11276 ?auto_11273 ) ) ( not ( = ?auto_11276 ?auto_11274 ) ) ( ON_BOARD ?auto_11278 ?auto_11283 ) ( SUPPORTS ?auto_11278 ?auto_11271 ) ( not ( = ?auto_11270 ?auto_11284 ) ) ( CALIBRATION_TARGET ?auto_11278 ?auto_11284 ) ( not ( = ?auto_11284 ?auto_11274 ) ) ( ON_BOARD ?auto_11282 ?auto_11283 ) ( not ( = ?auto_11278 ?auto_11282 ) ) ( SUPPORTS ?auto_11282 ?auto_11275 ) ( CALIBRATION_TARGET ?auto_11282 ?auto_11284 ) ( not ( = ?auto_11284 ?auto_11276 ) ) ( ON_BOARD ?auto_11281 ?auto_11283 ) ( not ( = ?auto_11282 ?auto_11281 ) ) ( SUPPORTS ?auto_11281 ?auto_11277 ) ( CALIBRATION_TARGET ?auto_11281 ?auto_11284 ) ( not ( = ?auto_11284 ?auto_11273 ) ) ( ON_BOARD ?auto_11279 ?auto_11283 ) ( not ( = ?auto_11281 ?auto_11279 ) ) ( SUPPORTS ?auto_11279 ?auto_11272 ) ( CALIBRATION_TARGET ?auto_11279 ?auto_11284 ) ( POWER_AVAIL ?auto_11283 ) ( POINTING ?auto_11283 ?auto_11280 ) ( not ( = ?auto_11284 ?auto_11280 ) ) ( not ( = ?auto_11273 ?auto_11280 ) ) ( not ( = ?auto_11272 ?auto_11277 ) ) ( not ( = ?auto_11276 ?auto_11280 ) ) ( not ( = ?auto_11272 ?auto_11275 ) ) ( not ( = ?auto_11277 ?auto_11275 ) ) ( not ( = ?auto_11274 ?auto_11280 ) ) ( not ( = ?auto_11282 ?auto_11279 ) ) ( not ( = ?auto_11272 ?auto_11271 ) ) ( not ( = ?auto_11277 ?auto_11271 ) ) ( not ( = ?auto_11275 ?auto_11271 ) ) ( not ( = ?auto_11270 ?auto_11280 ) ) ( not ( = ?auto_11278 ?auto_11281 ) ) ( not ( = ?auto_11278 ?auto_11279 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_11273 ?auto_11272 ?auto_11276 ?auto_11277 ?auto_11270 ?auto_11271 ?auto_11274 ?auto_11275 )
      ( GET-4IMAGE-VERIFY ?auto_11270 ?auto_11271 ?auto_11273 ?auto_11272 ?auto_11274 ?auto_11275 ?auto_11276 ?auto_11277 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_11425 - DIRECTION
      ?auto_11426 - MODE
      ?auto_11428 - DIRECTION
      ?auto_11427 - MODE
      ?auto_11429 - DIRECTION
      ?auto_11430 - MODE
      ?auto_11431 - DIRECTION
      ?auto_11432 - MODE
    )
    :vars
    (
      ?auto_11433 - INSTRUMENT
      ?auto_11438 - SATELLITE
      ?auto_11439 - DIRECTION
      ?auto_11437 - INSTRUMENT
      ?auto_11436 - INSTRUMENT
      ?auto_11434 - INSTRUMENT
      ?auto_11435 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_11428 ?auto_11425 ) ) ( not ( = ?auto_11429 ?auto_11425 ) ) ( not ( = ?auto_11429 ?auto_11428 ) ) ( not ( = ?auto_11431 ?auto_11425 ) ) ( not ( = ?auto_11431 ?auto_11428 ) ) ( not ( = ?auto_11431 ?auto_11429 ) ) ( ON_BOARD ?auto_11433 ?auto_11438 ) ( SUPPORTS ?auto_11433 ?auto_11426 ) ( not ( = ?auto_11425 ?auto_11439 ) ) ( CALIBRATION_TARGET ?auto_11433 ?auto_11439 ) ( not ( = ?auto_11439 ?auto_11431 ) ) ( ON_BOARD ?auto_11437 ?auto_11438 ) ( not ( = ?auto_11433 ?auto_11437 ) ) ( SUPPORTS ?auto_11437 ?auto_11432 ) ( CALIBRATION_TARGET ?auto_11437 ?auto_11439 ) ( not ( = ?auto_11439 ?auto_11428 ) ) ( ON_BOARD ?auto_11436 ?auto_11438 ) ( not ( = ?auto_11437 ?auto_11436 ) ) ( SUPPORTS ?auto_11436 ?auto_11427 ) ( CALIBRATION_TARGET ?auto_11436 ?auto_11439 ) ( not ( = ?auto_11439 ?auto_11429 ) ) ( ON_BOARD ?auto_11434 ?auto_11438 ) ( not ( = ?auto_11436 ?auto_11434 ) ) ( SUPPORTS ?auto_11434 ?auto_11430 ) ( CALIBRATION_TARGET ?auto_11434 ?auto_11439 ) ( POWER_AVAIL ?auto_11438 ) ( POINTING ?auto_11438 ?auto_11435 ) ( not ( = ?auto_11439 ?auto_11435 ) ) ( not ( = ?auto_11429 ?auto_11435 ) ) ( not ( = ?auto_11430 ?auto_11427 ) ) ( not ( = ?auto_11428 ?auto_11435 ) ) ( not ( = ?auto_11430 ?auto_11432 ) ) ( not ( = ?auto_11427 ?auto_11432 ) ) ( not ( = ?auto_11431 ?auto_11435 ) ) ( not ( = ?auto_11437 ?auto_11434 ) ) ( not ( = ?auto_11430 ?auto_11426 ) ) ( not ( = ?auto_11427 ?auto_11426 ) ) ( not ( = ?auto_11432 ?auto_11426 ) ) ( not ( = ?auto_11425 ?auto_11435 ) ) ( not ( = ?auto_11433 ?auto_11436 ) ) ( not ( = ?auto_11433 ?auto_11434 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_11429 ?auto_11430 ?auto_11428 ?auto_11427 ?auto_11425 ?auto_11426 ?auto_11431 ?auto_11432 )
      ( GET-4IMAGE-VERIFY ?auto_11425 ?auto_11426 ?auto_11428 ?auto_11427 ?auto_11429 ?auto_11430 ?auto_11431 ?auto_11432 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_11529 - DIRECTION
      ?auto_11530 - MODE
      ?auto_11532 - DIRECTION
      ?auto_11531 - MODE
      ?auto_11533 - DIRECTION
      ?auto_11534 - MODE
      ?auto_11535 - DIRECTION
      ?auto_11536 - MODE
    )
    :vars
    (
      ?auto_11537 - INSTRUMENT
      ?auto_11542 - SATELLITE
      ?auto_11543 - DIRECTION
      ?auto_11541 - INSTRUMENT
      ?auto_11540 - INSTRUMENT
      ?auto_11538 - INSTRUMENT
      ?auto_11539 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_11532 ?auto_11529 ) ) ( not ( = ?auto_11533 ?auto_11529 ) ) ( not ( = ?auto_11533 ?auto_11532 ) ) ( not ( = ?auto_11535 ?auto_11529 ) ) ( not ( = ?auto_11535 ?auto_11532 ) ) ( not ( = ?auto_11535 ?auto_11533 ) ) ( ON_BOARD ?auto_11537 ?auto_11542 ) ( SUPPORTS ?auto_11537 ?auto_11530 ) ( not ( = ?auto_11529 ?auto_11543 ) ) ( CALIBRATION_TARGET ?auto_11537 ?auto_11543 ) ( not ( = ?auto_11543 ?auto_11533 ) ) ( ON_BOARD ?auto_11541 ?auto_11542 ) ( not ( = ?auto_11537 ?auto_11541 ) ) ( SUPPORTS ?auto_11541 ?auto_11534 ) ( CALIBRATION_TARGET ?auto_11541 ?auto_11543 ) ( not ( = ?auto_11543 ?auto_11532 ) ) ( ON_BOARD ?auto_11540 ?auto_11542 ) ( not ( = ?auto_11541 ?auto_11540 ) ) ( SUPPORTS ?auto_11540 ?auto_11531 ) ( CALIBRATION_TARGET ?auto_11540 ?auto_11543 ) ( not ( = ?auto_11543 ?auto_11535 ) ) ( ON_BOARD ?auto_11538 ?auto_11542 ) ( not ( = ?auto_11540 ?auto_11538 ) ) ( SUPPORTS ?auto_11538 ?auto_11536 ) ( CALIBRATION_TARGET ?auto_11538 ?auto_11543 ) ( POWER_AVAIL ?auto_11542 ) ( POINTING ?auto_11542 ?auto_11539 ) ( not ( = ?auto_11543 ?auto_11539 ) ) ( not ( = ?auto_11535 ?auto_11539 ) ) ( not ( = ?auto_11536 ?auto_11531 ) ) ( not ( = ?auto_11532 ?auto_11539 ) ) ( not ( = ?auto_11536 ?auto_11534 ) ) ( not ( = ?auto_11531 ?auto_11534 ) ) ( not ( = ?auto_11533 ?auto_11539 ) ) ( not ( = ?auto_11541 ?auto_11538 ) ) ( not ( = ?auto_11536 ?auto_11530 ) ) ( not ( = ?auto_11531 ?auto_11530 ) ) ( not ( = ?auto_11534 ?auto_11530 ) ) ( not ( = ?auto_11529 ?auto_11539 ) ) ( not ( = ?auto_11537 ?auto_11540 ) ) ( not ( = ?auto_11537 ?auto_11538 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_11535 ?auto_11536 ?auto_11532 ?auto_11531 ?auto_11529 ?auto_11530 ?auto_11533 ?auto_11534 )
      ( GET-4IMAGE-VERIFY ?auto_11529 ?auto_11530 ?auto_11532 ?auto_11531 ?auto_11533 ?auto_11534 ?auto_11535 ?auto_11536 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_11684 - DIRECTION
      ?auto_11685 - MODE
      ?auto_11687 - DIRECTION
      ?auto_11686 - MODE
      ?auto_11688 - DIRECTION
      ?auto_11689 - MODE
      ?auto_11690 - DIRECTION
      ?auto_11691 - MODE
    )
    :vars
    (
      ?auto_11692 - INSTRUMENT
      ?auto_11697 - SATELLITE
      ?auto_11698 - DIRECTION
      ?auto_11696 - INSTRUMENT
      ?auto_11695 - INSTRUMENT
      ?auto_11693 - INSTRUMENT
      ?auto_11694 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_11687 ?auto_11684 ) ) ( not ( = ?auto_11688 ?auto_11684 ) ) ( not ( = ?auto_11688 ?auto_11687 ) ) ( not ( = ?auto_11690 ?auto_11684 ) ) ( not ( = ?auto_11690 ?auto_11687 ) ) ( not ( = ?auto_11690 ?auto_11688 ) ) ( ON_BOARD ?auto_11692 ?auto_11697 ) ( SUPPORTS ?auto_11692 ?auto_11685 ) ( not ( = ?auto_11684 ?auto_11698 ) ) ( CALIBRATION_TARGET ?auto_11692 ?auto_11698 ) ( not ( = ?auto_11698 ?auto_11687 ) ) ( ON_BOARD ?auto_11696 ?auto_11697 ) ( not ( = ?auto_11692 ?auto_11696 ) ) ( SUPPORTS ?auto_11696 ?auto_11686 ) ( CALIBRATION_TARGET ?auto_11696 ?auto_11698 ) ( not ( = ?auto_11698 ?auto_11690 ) ) ( ON_BOARD ?auto_11695 ?auto_11697 ) ( not ( = ?auto_11696 ?auto_11695 ) ) ( SUPPORTS ?auto_11695 ?auto_11691 ) ( CALIBRATION_TARGET ?auto_11695 ?auto_11698 ) ( not ( = ?auto_11698 ?auto_11688 ) ) ( ON_BOARD ?auto_11693 ?auto_11697 ) ( not ( = ?auto_11695 ?auto_11693 ) ) ( SUPPORTS ?auto_11693 ?auto_11689 ) ( CALIBRATION_TARGET ?auto_11693 ?auto_11698 ) ( POWER_AVAIL ?auto_11697 ) ( POINTING ?auto_11697 ?auto_11694 ) ( not ( = ?auto_11698 ?auto_11694 ) ) ( not ( = ?auto_11688 ?auto_11694 ) ) ( not ( = ?auto_11689 ?auto_11691 ) ) ( not ( = ?auto_11690 ?auto_11694 ) ) ( not ( = ?auto_11689 ?auto_11686 ) ) ( not ( = ?auto_11691 ?auto_11686 ) ) ( not ( = ?auto_11687 ?auto_11694 ) ) ( not ( = ?auto_11696 ?auto_11693 ) ) ( not ( = ?auto_11689 ?auto_11685 ) ) ( not ( = ?auto_11691 ?auto_11685 ) ) ( not ( = ?auto_11686 ?auto_11685 ) ) ( not ( = ?auto_11684 ?auto_11694 ) ) ( not ( = ?auto_11692 ?auto_11695 ) ) ( not ( = ?auto_11692 ?auto_11693 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_11688 ?auto_11689 ?auto_11690 ?auto_11691 ?auto_11684 ?auto_11685 ?auto_11687 ?auto_11686 )
      ( GET-4IMAGE-VERIFY ?auto_11684 ?auto_11685 ?auto_11687 ?auto_11686 ?auto_11688 ?auto_11689 ?auto_11690 ?auto_11691 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_11733 - DIRECTION
      ?auto_11734 - MODE
      ?auto_11736 - DIRECTION
      ?auto_11735 - MODE
      ?auto_11737 - DIRECTION
      ?auto_11738 - MODE
      ?auto_11739 - DIRECTION
      ?auto_11740 - MODE
    )
    :vars
    (
      ?auto_11741 - INSTRUMENT
      ?auto_11746 - SATELLITE
      ?auto_11747 - DIRECTION
      ?auto_11745 - INSTRUMENT
      ?auto_11744 - INSTRUMENT
      ?auto_11742 - INSTRUMENT
      ?auto_11743 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_11736 ?auto_11733 ) ) ( not ( = ?auto_11737 ?auto_11733 ) ) ( not ( = ?auto_11737 ?auto_11736 ) ) ( not ( = ?auto_11739 ?auto_11733 ) ) ( not ( = ?auto_11739 ?auto_11736 ) ) ( not ( = ?auto_11739 ?auto_11737 ) ) ( ON_BOARD ?auto_11741 ?auto_11746 ) ( SUPPORTS ?auto_11741 ?auto_11734 ) ( not ( = ?auto_11733 ?auto_11747 ) ) ( CALIBRATION_TARGET ?auto_11741 ?auto_11747 ) ( not ( = ?auto_11747 ?auto_11736 ) ) ( ON_BOARD ?auto_11745 ?auto_11746 ) ( not ( = ?auto_11741 ?auto_11745 ) ) ( SUPPORTS ?auto_11745 ?auto_11735 ) ( CALIBRATION_TARGET ?auto_11745 ?auto_11747 ) ( not ( = ?auto_11747 ?auto_11737 ) ) ( ON_BOARD ?auto_11744 ?auto_11746 ) ( not ( = ?auto_11745 ?auto_11744 ) ) ( SUPPORTS ?auto_11744 ?auto_11738 ) ( CALIBRATION_TARGET ?auto_11744 ?auto_11747 ) ( not ( = ?auto_11747 ?auto_11739 ) ) ( ON_BOARD ?auto_11742 ?auto_11746 ) ( not ( = ?auto_11744 ?auto_11742 ) ) ( SUPPORTS ?auto_11742 ?auto_11740 ) ( CALIBRATION_TARGET ?auto_11742 ?auto_11747 ) ( POWER_AVAIL ?auto_11746 ) ( POINTING ?auto_11746 ?auto_11743 ) ( not ( = ?auto_11747 ?auto_11743 ) ) ( not ( = ?auto_11739 ?auto_11743 ) ) ( not ( = ?auto_11740 ?auto_11738 ) ) ( not ( = ?auto_11737 ?auto_11743 ) ) ( not ( = ?auto_11740 ?auto_11735 ) ) ( not ( = ?auto_11738 ?auto_11735 ) ) ( not ( = ?auto_11736 ?auto_11743 ) ) ( not ( = ?auto_11745 ?auto_11742 ) ) ( not ( = ?auto_11740 ?auto_11734 ) ) ( not ( = ?auto_11738 ?auto_11734 ) ) ( not ( = ?auto_11735 ?auto_11734 ) ) ( not ( = ?auto_11733 ?auto_11743 ) ) ( not ( = ?auto_11741 ?auto_11744 ) ) ( not ( = ?auto_11741 ?auto_11742 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_11739 ?auto_11740 ?auto_11737 ?auto_11738 ?auto_11733 ?auto_11734 ?auto_11736 ?auto_11735 )
      ( GET-4IMAGE-VERIFY ?auto_11733 ?auto_11734 ?auto_11736 ?auto_11735 ?auto_11737 ?auto_11738 ?auto_11739 ?auto_11740 ) )
  )

)

