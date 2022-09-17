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
      ?auto_14413 - DIRECTION
      ?auto_14414 - MODE
    )
    :vars
    (
      ?auto_14415 - INSTRUMENT
      ?auto_14416 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_14415 ) ( ON_BOARD ?auto_14415 ?auto_14416 ) ( SUPPORTS ?auto_14415 ?auto_14414 ) ( POWER_ON ?auto_14415 ) ( POINTING ?auto_14416 ?auto_14413 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_14416 ?auto_14413 ?auto_14415 ?auto_14414 )
      ( GET-1IMAGE-VERIFY ?auto_14413 ?auto_14414 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_14431 - DIRECTION
      ?auto_14432 - MODE
    )
    :vars
    (
      ?auto_14434 - INSTRUMENT
      ?auto_14433 - SATELLITE
      ?auto_14435 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_14434 ) ( ON_BOARD ?auto_14434 ?auto_14433 ) ( SUPPORTS ?auto_14434 ?auto_14432 ) ( POWER_ON ?auto_14434 ) ( POINTING ?auto_14433 ?auto_14435 ) ( not ( = ?auto_14431 ?auto_14435 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_14433 ?auto_14431 ?auto_14435 )
      ( GET-1IMAGE ?auto_14431 ?auto_14432 )
      ( GET-1IMAGE-VERIFY ?auto_14431 ?auto_14432 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_14452 - DIRECTION
      ?auto_14453 - MODE
    )
    :vars
    (
      ?auto_14455 - INSTRUMENT
      ?auto_14454 - SATELLITE
      ?auto_14456 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14455 ?auto_14454 ) ( SUPPORTS ?auto_14455 ?auto_14453 ) ( POWER_ON ?auto_14455 ) ( POINTING ?auto_14454 ?auto_14456 ) ( not ( = ?auto_14452 ?auto_14456 ) ) ( CALIBRATION_TARGET ?auto_14455 ?auto_14456 ) ( NOT_CALIBRATED ?auto_14455 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_14454 ?auto_14455 ?auto_14456 )
      ( GET-1IMAGE ?auto_14452 ?auto_14453 )
      ( GET-1IMAGE-VERIFY ?auto_14452 ?auto_14453 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_14473 - DIRECTION
      ?auto_14474 - MODE
    )
    :vars
    (
      ?auto_14477 - INSTRUMENT
      ?auto_14475 - SATELLITE
      ?auto_14476 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14477 ?auto_14475 ) ( SUPPORTS ?auto_14477 ?auto_14474 ) ( POINTING ?auto_14475 ?auto_14476 ) ( not ( = ?auto_14473 ?auto_14476 ) ) ( CALIBRATION_TARGET ?auto_14477 ?auto_14476 ) ( POWER_AVAIL ?auto_14475 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_14477 ?auto_14475 )
      ( GET-1IMAGE ?auto_14473 ?auto_14474 )
      ( GET-1IMAGE-VERIFY ?auto_14473 ?auto_14474 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_14494 - DIRECTION
      ?auto_14495 - MODE
    )
    :vars
    (
      ?auto_14498 - INSTRUMENT
      ?auto_14496 - SATELLITE
      ?auto_14497 - DIRECTION
      ?auto_14499 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14498 ?auto_14496 ) ( SUPPORTS ?auto_14498 ?auto_14495 ) ( not ( = ?auto_14494 ?auto_14497 ) ) ( CALIBRATION_TARGET ?auto_14498 ?auto_14497 ) ( POWER_AVAIL ?auto_14496 ) ( POINTING ?auto_14496 ?auto_14499 ) ( not ( = ?auto_14497 ?auto_14499 ) ) ( not ( = ?auto_14494 ?auto_14499 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_14496 ?auto_14497 ?auto_14499 )
      ( GET-1IMAGE ?auto_14494 ?auto_14495 )
      ( GET-1IMAGE-VERIFY ?auto_14494 ?auto_14495 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_14574 - DIRECTION
      ?auto_14575 - MODE
    )
    :vars
    (
      ?auto_14576 - INSTRUMENT
      ?auto_14577 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_14576 ) ( ON_BOARD ?auto_14576 ?auto_14577 ) ( SUPPORTS ?auto_14576 ?auto_14575 ) ( POWER_ON ?auto_14576 ) ( POINTING ?auto_14577 ?auto_14574 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_14577 ?auto_14574 ?auto_14576 ?auto_14575 )
      ( GET-1IMAGE-VERIFY ?auto_14574 ?auto_14575 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_14578 - DIRECTION
      ?auto_14579 - MODE
      ?auto_14581 - DIRECTION
      ?auto_14580 - MODE
    )
    :vars
    (
      ?auto_14583 - INSTRUMENT
      ?auto_14582 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_14583 ) ( ON_BOARD ?auto_14583 ?auto_14582 ) ( SUPPORTS ?auto_14583 ?auto_14580 ) ( POWER_ON ?auto_14583 ) ( POINTING ?auto_14582 ?auto_14581 ) ( HAVE_IMAGE ?auto_14578 ?auto_14579 ) ( not ( = ?auto_14578 ?auto_14581 ) ) ( not ( = ?auto_14579 ?auto_14580 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_14581 ?auto_14580 )
      ( GET-2IMAGE-VERIFY ?auto_14578 ?auto_14579 ?auto_14581 ?auto_14580 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_14584 - DIRECTION
      ?auto_14585 - MODE
      ?auto_14587 - DIRECTION
      ?auto_14586 - MODE
    )
    :vars
    (
      ?auto_14589 - INSTRUMENT
      ?auto_14588 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_14589 ) ( ON_BOARD ?auto_14589 ?auto_14588 ) ( SUPPORTS ?auto_14589 ?auto_14585 ) ( POWER_ON ?auto_14589 ) ( POINTING ?auto_14588 ?auto_14584 ) ( HAVE_IMAGE ?auto_14587 ?auto_14586 ) ( not ( = ?auto_14584 ?auto_14587 ) ) ( not ( = ?auto_14585 ?auto_14586 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_14584 ?auto_14585 )
      ( GET-2IMAGE-VERIFY ?auto_14584 ?auto_14585 ?auto_14587 ?auto_14586 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14596 - DIRECTION
      ?auto_14597 - MODE
      ?auto_14599 - DIRECTION
      ?auto_14598 - MODE
      ?auto_14601 - DIRECTION
      ?auto_14600 - MODE
    )
    :vars
    (
      ?auto_14603 - INSTRUMENT
      ?auto_14602 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_14603 ) ( ON_BOARD ?auto_14603 ?auto_14602 ) ( SUPPORTS ?auto_14603 ?auto_14600 ) ( POWER_ON ?auto_14603 ) ( POINTING ?auto_14602 ?auto_14601 ) ( HAVE_IMAGE ?auto_14596 ?auto_14597 ) ( HAVE_IMAGE ?auto_14599 ?auto_14598 ) ( not ( = ?auto_14596 ?auto_14599 ) ) ( not ( = ?auto_14596 ?auto_14601 ) ) ( not ( = ?auto_14597 ?auto_14598 ) ) ( not ( = ?auto_14597 ?auto_14600 ) ) ( not ( = ?auto_14599 ?auto_14601 ) ) ( not ( = ?auto_14598 ?auto_14600 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_14601 ?auto_14600 )
      ( GET-3IMAGE-VERIFY ?auto_14596 ?auto_14597 ?auto_14599 ?auto_14598 ?auto_14601 ?auto_14600 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14604 - DIRECTION
      ?auto_14605 - MODE
      ?auto_14607 - DIRECTION
      ?auto_14606 - MODE
      ?auto_14609 - DIRECTION
      ?auto_14608 - MODE
    )
    :vars
    (
      ?auto_14611 - INSTRUMENT
      ?auto_14610 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_14611 ) ( ON_BOARD ?auto_14611 ?auto_14610 ) ( SUPPORTS ?auto_14611 ?auto_14606 ) ( POWER_ON ?auto_14611 ) ( POINTING ?auto_14610 ?auto_14607 ) ( HAVE_IMAGE ?auto_14604 ?auto_14605 ) ( HAVE_IMAGE ?auto_14609 ?auto_14608 ) ( not ( = ?auto_14604 ?auto_14607 ) ) ( not ( = ?auto_14604 ?auto_14609 ) ) ( not ( = ?auto_14605 ?auto_14606 ) ) ( not ( = ?auto_14605 ?auto_14608 ) ) ( not ( = ?auto_14607 ?auto_14609 ) ) ( not ( = ?auto_14606 ?auto_14608 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_14607 ?auto_14606 )
      ( GET-3IMAGE-VERIFY ?auto_14604 ?auto_14605 ?auto_14607 ?auto_14606 ?auto_14609 ?auto_14608 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14620 - DIRECTION
      ?auto_14621 - MODE
      ?auto_14623 - DIRECTION
      ?auto_14622 - MODE
      ?auto_14625 - DIRECTION
      ?auto_14624 - MODE
    )
    :vars
    (
      ?auto_14627 - INSTRUMENT
      ?auto_14626 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_14627 ) ( ON_BOARD ?auto_14627 ?auto_14626 ) ( SUPPORTS ?auto_14627 ?auto_14621 ) ( POWER_ON ?auto_14627 ) ( POINTING ?auto_14626 ?auto_14620 ) ( HAVE_IMAGE ?auto_14623 ?auto_14622 ) ( HAVE_IMAGE ?auto_14625 ?auto_14624 ) ( not ( = ?auto_14620 ?auto_14623 ) ) ( not ( = ?auto_14620 ?auto_14625 ) ) ( not ( = ?auto_14621 ?auto_14622 ) ) ( not ( = ?auto_14621 ?auto_14624 ) ) ( not ( = ?auto_14623 ?auto_14625 ) ) ( not ( = ?auto_14622 ?auto_14624 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_14620 ?auto_14621 )
      ( GET-3IMAGE-VERIFY ?auto_14620 ?auto_14621 ?auto_14623 ?auto_14622 ?auto_14625 ?auto_14624 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_14652 - DIRECTION
      ?auto_14653 - MODE
    )
    :vars
    (
      ?auto_14655 - INSTRUMENT
      ?auto_14654 - SATELLITE
      ?auto_14656 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_14655 ) ( ON_BOARD ?auto_14655 ?auto_14654 ) ( SUPPORTS ?auto_14655 ?auto_14653 ) ( POWER_ON ?auto_14655 ) ( POINTING ?auto_14654 ?auto_14656 ) ( not ( = ?auto_14652 ?auto_14656 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_14654 ?auto_14652 ?auto_14656 )
      ( GET-1IMAGE ?auto_14652 ?auto_14653 )
      ( GET-1IMAGE-VERIFY ?auto_14652 ?auto_14653 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_14657 - DIRECTION
      ?auto_14658 - MODE
      ?auto_14660 - DIRECTION
      ?auto_14659 - MODE
    )
    :vars
    (
      ?auto_14661 - INSTRUMENT
      ?auto_14663 - SATELLITE
      ?auto_14662 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_14661 ) ( ON_BOARD ?auto_14661 ?auto_14663 ) ( SUPPORTS ?auto_14661 ?auto_14659 ) ( POWER_ON ?auto_14661 ) ( POINTING ?auto_14663 ?auto_14662 ) ( not ( = ?auto_14660 ?auto_14662 ) ) ( HAVE_IMAGE ?auto_14657 ?auto_14658 ) ( not ( = ?auto_14657 ?auto_14660 ) ) ( not ( = ?auto_14657 ?auto_14662 ) ) ( not ( = ?auto_14658 ?auto_14659 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_14660 ?auto_14659 )
      ( GET-2IMAGE-VERIFY ?auto_14657 ?auto_14658 ?auto_14660 ?auto_14659 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_14664 - DIRECTION
      ?auto_14665 - MODE
      ?auto_14667 - DIRECTION
      ?auto_14666 - MODE
    )
    :vars
    (
      ?auto_14669 - INSTRUMENT
      ?auto_14670 - SATELLITE
      ?auto_14668 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_14669 ) ( ON_BOARD ?auto_14669 ?auto_14670 ) ( SUPPORTS ?auto_14669 ?auto_14665 ) ( POWER_ON ?auto_14669 ) ( POINTING ?auto_14670 ?auto_14668 ) ( not ( = ?auto_14664 ?auto_14668 ) ) ( HAVE_IMAGE ?auto_14667 ?auto_14666 ) ( not ( = ?auto_14667 ?auto_14664 ) ) ( not ( = ?auto_14667 ?auto_14668 ) ) ( not ( = ?auto_14666 ?auto_14665 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14667 ?auto_14666 ?auto_14664 ?auto_14665 )
      ( GET-2IMAGE-VERIFY ?auto_14664 ?auto_14665 ?auto_14667 ?auto_14666 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14680 - DIRECTION
      ?auto_14681 - MODE
      ?auto_14683 - DIRECTION
      ?auto_14682 - MODE
      ?auto_14685 - DIRECTION
      ?auto_14684 - MODE
    )
    :vars
    (
      ?auto_14687 - INSTRUMENT
      ?auto_14688 - SATELLITE
      ?auto_14686 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_14687 ) ( ON_BOARD ?auto_14687 ?auto_14688 ) ( SUPPORTS ?auto_14687 ?auto_14684 ) ( POWER_ON ?auto_14687 ) ( POINTING ?auto_14688 ?auto_14686 ) ( not ( = ?auto_14685 ?auto_14686 ) ) ( HAVE_IMAGE ?auto_14683 ?auto_14682 ) ( not ( = ?auto_14683 ?auto_14685 ) ) ( not ( = ?auto_14683 ?auto_14686 ) ) ( not ( = ?auto_14682 ?auto_14684 ) ) ( HAVE_IMAGE ?auto_14680 ?auto_14681 ) ( not ( = ?auto_14680 ?auto_14683 ) ) ( not ( = ?auto_14680 ?auto_14685 ) ) ( not ( = ?auto_14680 ?auto_14686 ) ) ( not ( = ?auto_14681 ?auto_14682 ) ) ( not ( = ?auto_14681 ?auto_14684 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14683 ?auto_14682 ?auto_14685 ?auto_14684 )
      ( GET-3IMAGE-VERIFY ?auto_14680 ?auto_14681 ?auto_14683 ?auto_14682 ?auto_14685 ?auto_14684 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14689 - DIRECTION
      ?auto_14690 - MODE
      ?auto_14692 - DIRECTION
      ?auto_14691 - MODE
      ?auto_14694 - DIRECTION
      ?auto_14693 - MODE
    )
    :vars
    (
      ?auto_14696 - INSTRUMENT
      ?auto_14697 - SATELLITE
      ?auto_14695 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_14696 ) ( ON_BOARD ?auto_14696 ?auto_14697 ) ( SUPPORTS ?auto_14696 ?auto_14691 ) ( POWER_ON ?auto_14696 ) ( POINTING ?auto_14697 ?auto_14695 ) ( not ( = ?auto_14692 ?auto_14695 ) ) ( HAVE_IMAGE ?auto_14694 ?auto_14693 ) ( not ( = ?auto_14694 ?auto_14692 ) ) ( not ( = ?auto_14694 ?auto_14695 ) ) ( not ( = ?auto_14693 ?auto_14691 ) ) ( HAVE_IMAGE ?auto_14689 ?auto_14690 ) ( not ( = ?auto_14689 ?auto_14692 ) ) ( not ( = ?auto_14689 ?auto_14694 ) ) ( not ( = ?auto_14689 ?auto_14695 ) ) ( not ( = ?auto_14690 ?auto_14691 ) ) ( not ( = ?auto_14690 ?auto_14693 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14694 ?auto_14693 ?auto_14692 ?auto_14691 )
      ( GET-3IMAGE-VERIFY ?auto_14689 ?auto_14690 ?auto_14692 ?auto_14691 ?auto_14694 ?auto_14693 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14707 - DIRECTION
      ?auto_14708 - MODE
      ?auto_14710 - DIRECTION
      ?auto_14709 - MODE
      ?auto_14712 - DIRECTION
      ?auto_14711 - MODE
    )
    :vars
    (
      ?auto_14714 - INSTRUMENT
      ?auto_14715 - SATELLITE
      ?auto_14713 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_14714 ) ( ON_BOARD ?auto_14714 ?auto_14715 ) ( SUPPORTS ?auto_14714 ?auto_14708 ) ( POWER_ON ?auto_14714 ) ( POINTING ?auto_14715 ?auto_14713 ) ( not ( = ?auto_14707 ?auto_14713 ) ) ( HAVE_IMAGE ?auto_14712 ?auto_14709 ) ( not ( = ?auto_14712 ?auto_14707 ) ) ( not ( = ?auto_14712 ?auto_14713 ) ) ( not ( = ?auto_14709 ?auto_14708 ) ) ( HAVE_IMAGE ?auto_14710 ?auto_14709 ) ( HAVE_IMAGE ?auto_14712 ?auto_14711 ) ( not ( = ?auto_14707 ?auto_14710 ) ) ( not ( = ?auto_14708 ?auto_14711 ) ) ( not ( = ?auto_14710 ?auto_14712 ) ) ( not ( = ?auto_14710 ?auto_14713 ) ) ( not ( = ?auto_14709 ?auto_14711 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14712 ?auto_14709 ?auto_14707 ?auto_14708 )
      ( GET-3IMAGE-VERIFY ?auto_14707 ?auto_14708 ?auto_14710 ?auto_14709 ?auto_14712 ?auto_14711 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_14745 - DIRECTION
      ?auto_14746 - MODE
    )
    :vars
    (
      ?auto_14750 - INSTRUMENT
      ?auto_14751 - SATELLITE
      ?auto_14747 - DIRECTION
      ?auto_14748 - DIRECTION
      ?auto_14749 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_14750 ?auto_14751 ) ( SUPPORTS ?auto_14750 ?auto_14746 ) ( POWER_ON ?auto_14750 ) ( POINTING ?auto_14751 ?auto_14747 ) ( not ( = ?auto_14745 ?auto_14747 ) ) ( HAVE_IMAGE ?auto_14748 ?auto_14749 ) ( not ( = ?auto_14748 ?auto_14745 ) ) ( not ( = ?auto_14748 ?auto_14747 ) ) ( not ( = ?auto_14749 ?auto_14746 ) ) ( CALIBRATION_TARGET ?auto_14750 ?auto_14747 ) ( NOT_CALIBRATED ?auto_14750 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_14751 ?auto_14750 ?auto_14747 )
      ( GET-2IMAGE ?auto_14748 ?auto_14749 ?auto_14745 ?auto_14746 )
      ( GET-1IMAGE-VERIFY ?auto_14745 ?auto_14746 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_14752 - DIRECTION
      ?auto_14753 - MODE
      ?auto_14755 - DIRECTION
      ?auto_14754 - MODE
    )
    :vars
    (
      ?auto_14757 - INSTRUMENT
      ?auto_14756 - SATELLITE
      ?auto_14758 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14757 ?auto_14756 ) ( SUPPORTS ?auto_14757 ?auto_14754 ) ( POWER_ON ?auto_14757 ) ( POINTING ?auto_14756 ?auto_14758 ) ( not ( = ?auto_14755 ?auto_14758 ) ) ( HAVE_IMAGE ?auto_14752 ?auto_14753 ) ( not ( = ?auto_14752 ?auto_14755 ) ) ( not ( = ?auto_14752 ?auto_14758 ) ) ( not ( = ?auto_14753 ?auto_14754 ) ) ( CALIBRATION_TARGET ?auto_14757 ?auto_14758 ) ( NOT_CALIBRATED ?auto_14757 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_14755 ?auto_14754 )
      ( GET-2IMAGE-VERIFY ?auto_14752 ?auto_14753 ?auto_14755 ?auto_14754 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_14759 - DIRECTION
      ?auto_14760 - MODE
      ?auto_14762 - DIRECTION
      ?auto_14761 - MODE
    )
    :vars
    (
      ?auto_14765 - INSTRUMENT
      ?auto_14764 - SATELLITE
      ?auto_14763 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14765 ?auto_14764 ) ( SUPPORTS ?auto_14765 ?auto_14760 ) ( POWER_ON ?auto_14765 ) ( POINTING ?auto_14764 ?auto_14763 ) ( not ( = ?auto_14759 ?auto_14763 ) ) ( HAVE_IMAGE ?auto_14762 ?auto_14761 ) ( not ( = ?auto_14762 ?auto_14759 ) ) ( not ( = ?auto_14762 ?auto_14763 ) ) ( not ( = ?auto_14761 ?auto_14760 ) ) ( CALIBRATION_TARGET ?auto_14765 ?auto_14763 ) ( NOT_CALIBRATED ?auto_14765 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14762 ?auto_14761 ?auto_14759 ?auto_14760 )
      ( GET-2IMAGE-VERIFY ?auto_14759 ?auto_14760 ?auto_14762 ?auto_14761 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14775 - DIRECTION
      ?auto_14776 - MODE
      ?auto_14778 - DIRECTION
      ?auto_14777 - MODE
      ?auto_14780 - DIRECTION
      ?auto_14779 - MODE
    )
    :vars
    (
      ?auto_14783 - INSTRUMENT
      ?auto_14782 - SATELLITE
      ?auto_14781 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14783 ?auto_14782 ) ( SUPPORTS ?auto_14783 ?auto_14779 ) ( POWER_ON ?auto_14783 ) ( POINTING ?auto_14782 ?auto_14781 ) ( not ( = ?auto_14780 ?auto_14781 ) ) ( HAVE_IMAGE ?auto_14778 ?auto_14776 ) ( not ( = ?auto_14778 ?auto_14780 ) ) ( not ( = ?auto_14778 ?auto_14781 ) ) ( not ( = ?auto_14776 ?auto_14779 ) ) ( CALIBRATION_TARGET ?auto_14783 ?auto_14781 ) ( NOT_CALIBRATED ?auto_14783 ) ( HAVE_IMAGE ?auto_14775 ?auto_14776 ) ( HAVE_IMAGE ?auto_14778 ?auto_14777 ) ( not ( = ?auto_14775 ?auto_14778 ) ) ( not ( = ?auto_14775 ?auto_14780 ) ) ( not ( = ?auto_14775 ?auto_14781 ) ) ( not ( = ?auto_14776 ?auto_14777 ) ) ( not ( = ?auto_14777 ?auto_14779 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14778 ?auto_14776 ?auto_14780 ?auto_14779 )
      ( GET-3IMAGE-VERIFY ?auto_14775 ?auto_14776 ?auto_14778 ?auto_14777 ?auto_14780 ?auto_14779 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14784 - DIRECTION
      ?auto_14785 - MODE
      ?auto_14787 - DIRECTION
      ?auto_14786 - MODE
      ?auto_14789 - DIRECTION
      ?auto_14788 - MODE
    )
    :vars
    (
      ?auto_14792 - INSTRUMENT
      ?auto_14791 - SATELLITE
      ?auto_14790 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14792 ?auto_14791 ) ( SUPPORTS ?auto_14792 ?auto_14786 ) ( POWER_ON ?auto_14792 ) ( POINTING ?auto_14791 ?auto_14790 ) ( not ( = ?auto_14787 ?auto_14790 ) ) ( HAVE_IMAGE ?auto_14784 ?auto_14785 ) ( not ( = ?auto_14784 ?auto_14787 ) ) ( not ( = ?auto_14784 ?auto_14790 ) ) ( not ( = ?auto_14785 ?auto_14786 ) ) ( CALIBRATION_TARGET ?auto_14792 ?auto_14790 ) ( NOT_CALIBRATED ?auto_14792 ) ( HAVE_IMAGE ?auto_14789 ?auto_14788 ) ( not ( = ?auto_14784 ?auto_14789 ) ) ( not ( = ?auto_14785 ?auto_14788 ) ) ( not ( = ?auto_14787 ?auto_14789 ) ) ( not ( = ?auto_14786 ?auto_14788 ) ) ( not ( = ?auto_14789 ?auto_14790 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14784 ?auto_14785 ?auto_14787 ?auto_14786 )
      ( GET-3IMAGE-VERIFY ?auto_14784 ?auto_14785 ?auto_14787 ?auto_14786 ?auto_14789 ?auto_14788 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14802 - DIRECTION
      ?auto_14803 - MODE
      ?auto_14805 - DIRECTION
      ?auto_14804 - MODE
      ?auto_14807 - DIRECTION
      ?auto_14806 - MODE
    )
    :vars
    (
      ?auto_14810 - INSTRUMENT
      ?auto_14809 - SATELLITE
      ?auto_14808 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14810 ?auto_14809 ) ( SUPPORTS ?auto_14810 ?auto_14803 ) ( POWER_ON ?auto_14810 ) ( POINTING ?auto_14809 ?auto_14808 ) ( not ( = ?auto_14802 ?auto_14808 ) ) ( HAVE_IMAGE ?auto_14805 ?auto_14804 ) ( not ( = ?auto_14805 ?auto_14802 ) ) ( not ( = ?auto_14805 ?auto_14808 ) ) ( not ( = ?auto_14804 ?auto_14803 ) ) ( CALIBRATION_TARGET ?auto_14810 ?auto_14808 ) ( NOT_CALIBRATED ?auto_14810 ) ( HAVE_IMAGE ?auto_14807 ?auto_14806 ) ( not ( = ?auto_14802 ?auto_14807 ) ) ( not ( = ?auto_14803 ?auto_14806 ) ) ( not ( = ?auto_14805 ?auto_14807 ) ) ( not ( = ?auto_14804 ?auto_14806 ) ) ( not ( = ?auto_14807 ?auto_14808 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14805 ?auto_14804 ?auto_14802 ?auto_14803 )
      ( GET-3IMAGE-VERIFY ?auto_14802 ?auto_14803 ?auto_14805 ?auto_14804 ?auto_14807 ?auto_14806 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_14840 - DIRECTION
      ?auto_14841 - MODE
    )
    :vars
    (
      ?auto_14846 - INSTRUMENT
      ?auto_14845 - SATELLITE
      ?auto_14843 - DIRECTION
      ?auto_14844 - DIRECTION
      ?auto_14842 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_14846 ?auto_14845 ) ( SUPPORTS ?auto_14846 ?auto_14841 ) ( POINTING ?auto_14845 ?auto_14843 ) ( not ( = ?auto_14840 ?auto_14843 ) ) ( HAVE_IMAGE ?auto_14844 ?auto_14842 ) ( not ( = ?auto_14844 ?auto_14840 ) ) ( not ( = ?auto_14844 ?auto_14843 ) ) ( not ( = ?auto_14842 ?auto_14841 ) ) ( CALIBRATION_TARGET ?auto_14846 ?auto_14843 ) ( POWER_AVAIL ?auto_14845 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_14846 ?auto_14845 )
      ( GET-2IMAGE ?auto_14844 ?auto_14842 ?auto_14840 ?auto_14841 )
      ( GET-1IMAGE-VERIFY ?auto_14840 ?auto_14841 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_14847 - DIRECTION
      ?auto_14848 - MODE
      ?auto_14850 - DIRECTION
      ?auto_14849 - MODE
    )
    :vars
    (
      ?auto_14853 - INSTRUMENT
      ?auto_14851 - SATELLITE
      ?auto_14852 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14853 ?auto_14851 ) ( SUPPORTS ?auto_14853 ?auto_14849 ) ( POINTING ?auto_14851 ?auto_14852 ) ( not ( = ?auto_14850 ?auto_14852 ) ) ( HAVE_IMAGE ?auto_14847 ?auto_14848 ) ( not ( = ?auto_14847 ?auto_14850 ) ) ( not ( = ?auto_14847 ?auto_14852 ) ) ( not ( = ?auto_14848 ?auto_14849 ) ) ( CALIBRATION_TARGET ?auto_14853 ?auto_14852 ) ( POWER_AVAIL ?auto_14851 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_14850 ?auto_14849 )
      ( GET-2IMAGE-VERIFY ?auto_14847 ?auto_14848 ?auto_14850 ?auto_14849 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_14854 - DIRECTION
      ?auto_14855 - MODE
      ?auto_14857 - DIRECTION
      ?auto_14856 - MODE
    )
    :vars
    (
      ?auto_14859 - INSTRUMENT
      ?auto_14858 - SATELLITE
      ?auto_14860 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14859 ?auto_14858 ) ( SUPPORTS ?auto_14859 ?auto_14855 ) ( POINTING ?auto_14858 ?auto_14860 ) ( not ( = ?auto_14854 ?auto_14860 ) ) ( HAVE_IMAGE ?auto_14857 ?auto_14856 ) ( not ( = ?auto_14857 ?auto_14854 ) ) ( not ( = ?auto_14857 ?auto_14860 ) ) ( not ( = ?auto_14856 ?auto_14855 ) ) ( CALIBRATION_TARGET ?auto_14859 ?auto_14860 ) ( POWER_AVAIL ?auto_14858 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14857 ?auto_14856 ?auto_14854 ?auto_14855 )
      ( GET-2IMAGE-VERIFY ?auto_14854 ?auto_14855 ?auto_14857 ?auto_14856 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14870 - DIRECTION
      ?auto_14871 - MODE
      ?auto_14873 - DIRECTION
      ?auto_14872 - MODE
      ?auto_14875 - DIRECTION
      ?auto_14874 - MODE
    )
    :vars
    (
      ?auto_14877 - INSTRUMENT
      ?auto_14876 - SATELLITE
      ?auto_14878 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14877 ?auto_14876 ) ( SUPPORTS ?auto_14877 ?auto_14874 ) ( POINTING ?auto_14876 ?auto_14878 ) ( not ( = ?auto_14875 ?auto_14878 ) ) ( HAVE_IMAGE ?auto_14870 ?auto_14871 ) ( not ( = ?auto_14870 ?auto_14875 ) ) ( not ( = ?auto_14870 ?auto_14878 ) ) ( not ( = ?auto_14871 ?auto_14874 ) ) ( CALIBRATION_TARGET ?auto_14877 ?auto_14878 ) ( POWER_AVAIL ?auto_14876 ) ( HAVE_IMAGE ?auto_14873 ?auto_14872 ) ( not ( = ?auto_14870 ?auto_14873 ) ) ( not ( = ?auto_14871 ?auto_14872 ) ) ( not ( = ?auto_14873 ?auto_14875 ) ) ( not ( = ?auto_14873 ?auto_14878 ) ) ( not ( = ?auto_14872 ?auto_14874 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14870 ?auto_14871 ?auto_14875 ?auto_14874 )
      ( GET-3IMAGE-VERIFY ?auto_14870 ?auto_14871 ?auto_14873 ?auto_14872 ?auto_14875 ?auto_14874 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14879 - DIRECTION
      ?auto_14880 - MODE
      ?auto_14882 - DIRECTION
      ?auto_14881 - MODE
      ?auto_14884 - DIRECTION
      ?auto_14883 - MODE
    )
    :vars
    (
      ?auto_14886 - INSTRUMENT
      ?auto_14885 - SATELLITE
      ?auto_14887 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14886 ?auto_14885 ) ( SUPPORTS ?auto_14886 ?auto_14881 ) ( POINTING ?auto_14885 ?auto_14887 ) ( not ( = ?auto_14882 ?auto_14887 ) ) ( HAVE_IMAGE ?auto_14884 ?auto_14883 ) ( not ( = ?auto_14884 ?auto_14882 ) ) ( not ( = ?auto_14884 ?auto_14887 ) ) ( not ( = ?auto_14883 ?auto_14881 ) ) ( CALIBRATION_TARGET ?auto_14886 ?auto_14887 ) ( POWER_AVAIL ?auto_14885 ) ( HAVE_IMAGE ?auto_14879 ?auto_14880 ) ( not ( = ?auto_14879 ?auto_14882 ) ) ( not ( = ?auto_14879 ?auto_14884 ) ) ( not ( = ?auto_14879 ?auto_14887 ) ) ( not ( = ?auto_14880 ?auto_14881 ) ) ( not ( = ?auto_14880 ?auto_14883 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14884 ?auto_14883 ?auto_14882 ?auto_14881 )
      ( GET-3IMAGE-VERIFY ?auto_14879 ?auto_14880 ?auto_14882 ?auto_14881 ?auto_14884 ?auto_14883 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14897 - DIRECTION
      ?auto_14898 - MODE
      ?auto_14900 - DIRECTION
      ?auto_14899 - MODE
      ?auto_14902 - DIRECTION
      ?auto_14901 - MODE
    )
    :vars
    (
      ?auto_14904 - INSTRUMENT
      ?auto_14903 - SATELLITE
      ?auto_14905 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14904 ?auto_14903 ) ( SUPPORTS ?auto_14904 ?auto_14898 ) ( POINTING ?auto_14903 ?auto_14905 ) ( not ( = ?auto_14897 ?auto_14905 ) ) ( HAVE_IMAGE ?auto_14900 ?auto_14899 ) ( not ( = ?auto_14900 ?auto_14897 ) ) ( not ( = ?auto_14900 ?auto_14905 ) ) ( not ( = ?auto_14899 ?auto_14898 ) ) ( CALIBRATION_TARGET ?auto_14904 ?auto_14905 ) ( POWER_AVAIL ?auto_14903 ) ( HAVE_IMAGE ?auto_14902 ?auto_14901 ) ( not ( = ?auto_14897 ?auto_14902 ) ) ( not ( = ?auto_14898 ?auto_14901 ) ) ( not ( = ?auto_14900 ?auto_14902 ) ) ( not ( = ?auto_14899 ?auto_14901 ) ) ( not ( = ?auto_14902 ?auto_14905 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14900 ?auto_14899 ?auto_14897 ?auto_14898 )
      ( GET-3IMAGE-VERIFY ?auto_14897 ?auto_14898 ?auto_14900 ?auto_14899 ?auto_14902 ?auto_14901 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_14935 - DIRECTION
      ?auto_14936 - MODE
    )
    :vars
    (
      ?auto_14940 - INSTRUMENT
      ?auto_14938 - SATELLITE
      ?auto_14941 - DIRECTION
      ?auto_14939 - DIRECTION
      ?auto_14937 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_14940 ?auto_14938 ) ( SUPPORTS ?auto_14940 ?auto_14936 ) ( not ( = ?auto_14935 ?auto_14941 ) ) ( HAVE_IMAGE ?auto_14939 ?auto_14937 ) ( not ( = ?auto_14939 ?auto_14935 ) ) ( not ( = ?auto_14939 ?auto_14941 ) ) ( not ( = ?auto_14937 ?auto_14936 ) ) ( CALIBRATION_TARGET ?auto_14940 ?auto_14941 ) ( POWER_AVAIL ?auto_14938 ) ( POINTING ?auto_14938 ?auto_14939 ) )
    :subtasks
    ( ( !TURN_TO ?auto_14938 ?auto_14941 ?auto_14939 )
      ( GET-2IMAGE ?auto_14939 ?auto_14937 ?auto_14935 ?auto_14936 )
      ( GET-1IMAGE-VERIFY ?auto_14935 ?auto_14936 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_14942 - DIRECTION
      ?auto_14943 - MODE
      ?auto_14945 - DIRECTION
      ?auto_14944 - MODE
    )
    :vars
    (
      ?auto_14946 - INSTRUMENT
      ?auto_14948 - SATELLITE
      ?auto_14947 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14946 ?auto_14948 ) ( SUPPORTS ?auto_14946 ?auto_14944 ) ( not ( = ?auto_14945 ?auto_14947 ) ) ( HAVE_IMAGE ?auto_14942 ?auto_14943 ) ( not ( = ?auto_14942 ?auto_14945 ) ) ( not ( = ?auto_14942 ?auto_14947 ) ) ( not ( = ?auto_14943 ?auto_14944 ) ) ( CALIBRATION_TARGET ?auto_14946 ?auto_14947 ) ( POWER_AVAIL ?auto_14948 ) ( POINTING ?auto_14948 ?auto_14942 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_14945 ?auto_14944 )
      ( GET-2IMAGE-VERIFY ?auto_14942 ?auto_14943 ?auto_14945 ?auto_14944 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_14949 - DIRECTION
      ?auto_14950 - MODE
      ?auto_14952 - DIRECTION
      ?auto_14951 - MODE
    )
    :vars
    (
      ?auto_14955 - INSTRUMENT
      ?auto_14953 - SATELLITE
      ?auto_14954 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14955 ?auto_14953 ) ( SUPPORTS ?auto_14955 ?auto_14950 ) ( not ( = ?auto_14949 ?auto_14954 ) ) ( HAVE_IMAGE ?auto_14952 ?auto_14951 ) ( not ( = ?auto_14952 ?auto_14949 ) ) ( not ( = ?auto_14952 ?auto_14954 ) ) ( not ( = ?auto_14951 ?auto_14950 ) ) ( CALIBRATION_TARGET ?auto_14955 ?auto_14954 ) ( POWER_AVAIL ?auto_14953 ) ( POINTING ?auto_14953 ?auto_14952 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14952 ?auto_14951 ?auto_14949 ?auto_14950 )
      ( GET-2IMAGE-VERIFY ?auto_14949 ?auto_14950 ?auto_14952 ?auto_14951 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14965 - DIRECTION
      ?auto_14966 - MODE
      ?auto_14968 - DIRECTION
      ?auto_14967 - MODE
      ?auto_14970 - DIRECTION
      ?auto_14969 - MODE
    )
    :vars
    (
      ?auto_14973 - INSTRUMENT
      ?auto_14971 - SATELLITE
      ?auto_14972 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14973 ?auto_14971 ) ( SUPPORTS ?auto_14973 ?auto_14969 ) ( not ( = ?auto_14970 ?auto_14972 ) ) ( HAVE_IMAGE ?auto_14965 ?auto_14967 ) ( not ( = ?auto_14965 ?auto_14970 ) ) ( not ( = ?auto_14965 ?auto_14972 ) ) ( not ( = ?auto_14967 ?auto_14969 ) ) ( CALIBRATION_TARGET ?auto_14973 ?auto_14972 ) ( POWER_AVAIL ?auto_14971 ) ( POINTING ?auto_14971 ?auto_14965 ) ( HAVE_IMAGE ?auto_14965 ?auto_14966 ) ( HAVE_IMAGE ?auto_14968 ?auto_14967 ) ( not ( = ?auto_14965 ?auto_14968 ) ) ( not ( = ?auto_14966 ?auto_14967 ) ) ( not ( = ?auto_14966 ?auto_14969 ) ) ( not ( = ?auto_14968 ?auto_14970 ) ) ( not ( = ?auto_14968 ?auto_14972 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14965 ?auto_14967 ?auto_14970 ?auto_14969 )
      ( GET-3IMAGE-VERIFY ?auto_14965 ?auto_14966 ?auto_14968 ?auto_14967 ?auto_14970 ?auto_14969 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14974 - DIRECTION
      ?auto_14975 - MODE
      ?auto_14977 - DIRECTION
      ?auto_14976 - MODE
      ?auto_14979 - DIRECTION
      ?auto_14978 - MODE
    )
    :vars
    (
      ?auto_14982 - INSTRUMENT
      ?auto_14980 - SATELLITE
      ?auto_14981 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14982 ?auto_14980 ) ( SUPPORTS ?auto_14982 ?auto_14976 ) ( not ( = ?auto_14977 ?auto_14981 ) ) ( HAVE_IMAGE ?auto_14974 ?auto_14975 ) ( not ( = ?auto_14974 ?auto_14977 ) ) ( not ( = ?auto_14974 ?auto_14981 ) ) ( not ( = ?auto_14975 ?auto_14976 ) ) ( CALIBRATION_TARGET ?auto_14982 ?auto_14981 ) ( POWER_AVAIL ?auto_14980 ) ( POINTING ?auto_14980 ?auto_14974 ) ( HAVE_IMAGE ?auto_14979 ?auto_14978 ) ( not ( = ?auto_14974 ?auto_14979 ) ) ( not ( = ?auto_14975 ?auto_14978 ) ) ( not ( = ?auto_14977 ?auto_14979 ) ) ( not ( = ?auto_14976 ?auto_14978 ) ) ( not ( = ?auto_14979 ?auto_14981 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14974 ?auto_14975 ?auto_14977 ?auto_14976 )
      ( GET-3IMAGE-VERIFY ?auto_14974 ?auto_14975 ?auto_14977 ?auto_14976 ?auto_14979 ?auto_14978 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_14992 - DIRECTION
      ?auto_14993 - MODE
      ?auto_14995 - DIRECTION
      ?auto_14994 - MODE
      ?auto_14997 - DIRECTION
      ?auto_14996 - MODE
    )
    :vars
    (
      ?auto_15000 - INSTRUMENT
      ?auto_14998 - SATELLITE
      ?auto_14999 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_15000 ?auto_14998 ) ( SUPPORTS ?auto_15000 ?auto_14993 ) ( not ( = ?auto_14992 ?auto_14999 ) ) ( HAVE_IMAGE ?auto_14995 ?auto_14994 ) ( not ( = ?auto_14995 ?auto_14992 ) ) ( not ( = ?auto_14995 ?auto_14999 ) ) ( not ( = ?auto_14994 ?auto_14993 ) ) ( CALIBRATION_TARGET ?auto_15000 ?auto_14999 ) ( POWER_AVAIL ?auto_14998 ) ( POINTING ?auto_14998 ?auto_14995 ) ( HAVE_IMAGE ?auto_14997 ?auto_14996 ) ( not ( = ?auto_14992 ?auto_14997 ) ) ( not ( = ?auto_14993 ?auto_14996 ) ) ( not ( = ?auto_14995 ?auto_14997 ) ) ( not ( = ?auto_14994 ?auto_14996 ) ) ( not ( = ?auto_14997 ?auto_14999 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14995 ?auto_14994 ?auto_14992 ?auto_14993 )
      ( GET-3IMAGE-VERIFY ?auto_14992 ?auto_14993 ?auto_14995 ?auto_14994 ?auto_14997 ?auto_14996 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_15030 - DIRECTION
      ?auto_15031 - MODE
    )
    :vars
    (
      ?auto_15036 - INSTRUMENT
      ?auto_15034 - SATELLITE
      ?auto_15035 - DIRECTION
      ?auto_15032 - DIRECTION
      ?auto_15033 - MODE
      ?auto_15037 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15036 ?auto_15034 ) ( SUPPORTS ?auto_15036 ?auto_15031 ) ( not ( = ?auto_15030 ?auto_15035 ) ) ( HAVE_IMAGE ?auto_15032 ?auto_15033 ) ( not ( = ?auto_15032 ?auto_15030 ) ) ( not ( = ?auto_15032 ?auto_15035 ) ) ( not ( = ?auto_15033 ?auto_15031 ) ) ( CALIBRATION_TARGET ?auto_15036 ?auto_15035 ) ( POINTING ?auto_15034 ?auto_15032 ) ( ON_BOARD ?auto_15037 ?auto_15034 ) ( POWER_ON ?auto_15037 ) ( not ( = ?auto_15036 ?auto_15037 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_15037 ?auto_15034 )
      ( GET-2IMAGE ?auto_15032 ?auto_15033 ?auto_15030 ?auto_15031 )
      ( GET-1IMAGE-VERIFY ?auto_15030 ?auto_15031 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15038 - DIRECTION
      ?auto_15039 - MODE
      ?auto_15041 - DIRECTION
      ?auto_15040 - MODE
    )
    :vars
    (
      ?auto_15045 - INSTRUMENT
      ?auto_15043 - SATELLITE
      ?auto_15042 - DIRECTION
      ?auto_15044 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15045 ?auto_15043 ) ( SUPPORTS ?auto_15045 ?auto_15040 ) ( not ( = ?auto_15041 ?auto_15042 ) ) ( HAVE_IMAGE ?auto_15038 ?auto_15039 ) ( not ( = ?auto_15038 ?auto_15041 ) ) ( not ( = ?auto_15038 ?auto_15042 ) ) ( not ( = ?auto_15039 ?auto_15040 ) ) ( CALIBRATION_TARGET ?auto_15045 ?auto_15042 ) ( POINTING ?auto_15043 ?auto_15038 ) ( ON_BOARD ?auto_15044 ?auto_15043 ) ( POWER_ON ?auto_15044 ) ( not ( = ?auto_15045 ?auto_15044 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15041 ?auto_15040 )
      ( GET-2IMAGE-VERIFY ?auto_15038 ?auto_15039 ?auto_15041 ?auto_15040 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15046 - DIRECTION
      ?auto_15047 - MODE
      ?auto_15049 - DIRECTION
      ?auto_15048 - MODE
    )
    :vars
    (
      ?auto_15051 - INSTRUMENT
      ?auto_15053 - SATELLITE
      ?auto_15050 - DIRECTION
      ?auto_15052 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15051 ?auto_15053 ) ( SUPPORTS ?auto_15051 ?auto_15047 ) ( not ( = ?auto_15046 ?auto_15050 ) ) ( HAVE_IMAGE ?auto_15049 ?auto_15048 ) ( not ( = ?auto_15049 ?auto_15046 ) ) ( not ( = ?auto_15049 ?auto_15050 ) ) ( not ( = ?auto_15048 ?auto_15047 ) ) ( CALIBRATION_TARGET ?auto_15051 ?auto_15050 ) ( POINTING ?auto_15053 ?auto_15049 ) ( ON_BOARD ?auto_15052 ?auto_15053 ) ( POWER_ON ?auto_15052 ) ( not ( = ?auto_15051 ?auto_15052 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15049 ?auto_15048 ?auto_15046 ?auto_15047 )
      ( GET-2IMAGE-VERIFY ?auto_15046 ?auto_15047 ?auto_15049 ?auto_15048 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15064 - DIRECTION
      ?auto_15065 - MODE
      ?auto_15067 - DIRECTION
      ?auto_15066 - MODE
      ?auto_15069 - DIRECTION
      ?auto_15068 - MODE
    )
    :vars
    (
      ?auto_15071 - INSTRUMENT
      ?auto_15073 - SATELLITE
      ?auto_15070 - DIRECTION
      ?auto_15072 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15071 ?auto_15073 ) ( SUPPORTS ?auto_15071 ?auto_15068 ) ( not ( = ?auto_15069 ?auto_15070 ) ) ( HAVE_IMAGE ?auto_15067 ?auto_15065 ) ( not ( = ?auto_15067 ?auto_15069 ) ) ( not ( = ?auto_15067 ?auto_15070 ) ) ( not ( = ?auto_15065 ?auto_15068 ) ) ( CALIBRATION_TARGET ?auto_15071 ?auto_15070 ) ( POINTING ?auto_15073 ?auto_15067 ) ( ON_BOARD ?auto_15072 ?auto_15073 ) ( POWER_ON ?auto_15072 ) ( not ( = ?auto_15071 ?auto_15072 ) ) ( HAVE_IMAGE ?auto_15064 ?auto_15065 ) ( HAVE_IMAGE ?auto_15067 ?auto_15066 ) ( not ( = ?auto_15064 ?auto_15067 ) ) ( not ( = ?auto_15064 ?auto_15069 ) ) ( not ( = ?auto_15064 ?auto_15070 ) ) ( not ( = ?auto_15065 ?auto_15066 ) ) ( not ( = ?auto_15066 ?auto_15068 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15067 ?auto_15065 ?auto_15069 ?auto_15068 )
      ( GET-3IMAGE-VERIFY ?auto_15064 ?auto_15065 ?auto_15067 ?auto_15066 ?auto_15069 ?auto_15068 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15074 - DIRECTION
      ?auto_15075 - MODE
      ?auto_15077 - DIRECTION
      ?auto_15076 - MODE
      ?auto_15079 - DIRECTION
      ?auto_15078 - MODE
    )
    :vars
    (
      ?auto_15081 - INSTRUMENT
      ?auto_15083 - SATELLITE
      ?auto_15080 - DIRECTION
      ?auto_15082 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15081 ?auto_15083 ) ( SUPPORTS ?auto_15081 ?auto_15076 ) ( not ( = ?auto_15077 ?auto_15080 ) ) ( HAVE_IMAGE ?auto_15074 ?auto_15075 ) ( not ( = ?auto_15074 ?auto_15077 ) ) ( not ( = ?auto_15074 ?auto_15080 ) ) ( not ( = ?auto_15075 ?auto_15076 ) ) ( CALIBRATION_TARGET ?auto_15081 ?auto_15080 ) ( POINTING ?auto_15083 ?auto_15074 ) ( ON_BOARD ?auto_15082 ?auto_15083 ) ( POWER_ON ?auto_15082 ) ( not ( = ?auto_15081 ?auto_15082 ) ) ( HAVE_IMAGE ?auto_15079 ?auto_15078 ) ( not ( = ?auto_15074 ?auto_15079 ) ) ( not ( = ?auto_15075 ?auto_15078 ) ) ( not ( = ?auto_15077 ?auto_15079 ) ) ( not ( = ?auto_15076 ?auto_15078 ) ) ( not ( = ?auto_15079 ?auto_15080 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15074 ?auto_15075 ?auto_15077 ?auto_15076 )
      ( GET-3IMAGE-VERIFY ?auto_15074 ?auto_15075 ?auto_15077 ?auto_15076 ?auto_15079 ?auto_15078 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15094 - DIRECTION
      ?auto_15095 - MODE
      ?auto_15097 - DIRECTION
      ?auto_15096 - MODE
      ?auto_15099 - DIRECTION
      ?auto_15098 - MODE
    )
    :vars
    (
      ?auto_15101 - INSTRUMENT
      ?auto_15103 - SATELLITE
      ?auto_15100 - DIRECTION
      ?auto_15102 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15101 ?auto_15103 ) ( SUPPORTS ?auto_15101 ?auto_15095 ) ( not ( = ?auto_15094 ?auto_15100 ) ) ( HAVE_IMAGE ?auto_15099 ?auto_15098 ) ( not ( = ?auto_15099 ?auto_15094 ) ) ( not ( = ?auto_15099 ?auto_15100 ) ) ( not ( = ?auto_15098 ?auto_15095 ) ) ( CALIBRATION_TARGET ?auto_15101 ?auto_15100 ) ( POINTING ?auto_15103 ?auto_15099 ) ( ON_BOARD ?auto_15102 ?auto_15103 ) ( POWER_ON ?auto_15102 ) ( not ( = ?auto_15101 ?auto_15102 ) ) ( HAVE_IMAGE ?auto_15097 ?auto_15096 ) ( not ( = ?auto_15094 ?auto_15097 ) ) ( not ( = ?auto_15095 ?auto_15096 ) ) ( not ( = ?auto_15097 ?auto_15099 ) ) ( not ( = ?auto_15097 ?auto_15100 ) ) ( not ( = ?auto_15096 ?auto_15098 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15099 ?auto_15098 ?auto_15094 ?auto_15095 )
      ( GET-3IMAGE-VERIFY ?auto_15094 ?auto_15095 ?auto_15097 ?auto_15096 ?auto_15099 ?auto_15098 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_15136 - DIRECTION
      ?auto_15137 - MODE
    )
    :vars
    (
      ?auto_15140 - INSTRUMENT
      ?auto_15142 - SATELLITE
      ?auto_15139 - DIRECTION
      ?auto_15143 - DIRECTION
      ?auto_15138 - MODE
      ?auto_15141 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15140 ?auto_15142 ) ( SUPPORTS ?auto_15140 ?auto_15137 ) ( not ( = ?auto_15136 ?auto_15139 ) ) ( not ( = ?auto_15143 ?auto_15136 ) ) ( not ( = ?auto_15143 ?auto_15139 ) ) ( not ( = ?auto_15138 ?auto_15137 ) ) ( CALIBRATION_TARGET ?auto_15140 ?auto_15139 ) ( POINTING ?auto_15142 ?auto_15143 ) ( ON_BOARD ?auto_15141 ?auto_15142 ) ( POWER_ON ?auto_15141 ) ( not ( = ?auto_15140 ?auto_15141 ) ) ( CALIBRATED ?auto_15141 ) ( SUPPORTS ?auto_15141 ?auto_15138 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15143 ?auto_15138 )
      ( GET-2IMAGE ?auto_15143 ?auto_15138 ?auto_15136 ?auto_15137 )
      ( GET-1IMAGE-VERIFY ?auto_15136 ?auto_15137 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15144 - DIRECTION
      ?auto_15145 - MODE
      ?auto_15147 - DIRECTION
      ?auto_15146 - MODE
    )
    :vars
    (
      ?auto_15149 - INSTRUMENT
      ?auto_15150 - SATELLITE
      ?auto_15148 - DIRECTION
      ?auto_15151 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15149 ?auto_15150 ) ( SUPPORTS ?auto_15149 ?auto_15146 ) ( not ( = ?auto_15147 ?auto_15148 ) ) ( not ( = ?auto_15144 ?auto_15147 ) ) ( not ( = ?auto_15144 ?auto_15148 ) ) ( not ( = ?auto_15145 ?auto_15146 ) ) ( CALIBRATION_TARGET ?auto_15149 ?auto_15148 ) ( POINTING ?auto_15150 ?auto_15144 ) ( ON_BOARD ?auto_15151 ?auto_15150 ) ( POWER_ON ?auto_15151 ) ( not ( = ?auto_15149 ?auto_15151 ) ) ( CALIBRATED ?auto_15151 ) ( SUPPORTS ?auto_15151 ?auto_15145 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15147 ?auto_15146 )
      ( GET-2IMAGE-VERIFY ?auto_15144 ?auto_15145 ?auto_15147 ?auto_15146 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15152 - DIRECTION
      ?auto_15153 - MODE
      ?auto_15155 - DIRECTION
      ?auto_15154 - MODE
    )
    :vars
    (
      ?auto_15156 - INSTRUMENT
      ?auto_15157 - SATELLITE
      ?auto_15158 - DIRECTION
      ?auto_15159 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15156 ?auto_15157 ) ( SUPPORTS ?auto_15156 ?auto_15153 ) ( not ( = ?auto_15152 ?auto_15158 ) ) ( not ( = ?auto_15155 ?auto_15152 ) ) ( not ( = ?auto_15155 ?auto_15158 ) ) ( not ( = ?auto_15154 ?auto_15153 ) ) ( CALIBRATION_TARGET ?auto_15156 ?auto_15158 ) ( POINTING ?auto_15157 ?auto_15155 ) ( ON_BOARD ?auto_15159 ?auto_15157 ) ( POWER_ON ?auto_15159 ) ( not ( = ?auto_15156 ?auto_15159 ) ) ( CALIBRATED ?auto_15159 ) ( SUPPORTS ?auto_15159 ?auto_15154 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15155 ?auto_15154 ?auto_15152 ?auto_15153 )
      ( GET-2IMAGE-VERIFY ?auto_15152 ?auto_15153 ?auto_15155 ?auto_15154 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_15242 - DIRECTION
      ?auto_15243 - MODE
    )
    :vars
    (
      ?auto_15244 - INSTRUMENT
      ?auto_15247 - SATELLITE
      ?auto_15248 - DIRECTION
      ?auto_15245 - DIRECTION
      ?auto_15246 - MODE
      ?auto_15249 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15244 ?auto_15247 ) ( SUPPORTS ?auto_15244 ?auto_15243 ) ( not ( = ?auto_15242 ?auto_15248 ) ) ( not ( = ?auto_15245 ?auto_15242 ) ) ( not ( = ?auto_15245 ?auto_15248 ) ) ( not ( = ?auto_15246 ?auto_15243 ) ) ( CALIBRATION_TARGET ?auto_15244 ?auto_15248 ) ( ON_BOARD ?auto_15249 ?auto_15247 ) ( POWER_ON ?auto_15249 ) ( not ( = ?auto_15244 ?auto_15249 ) ) ( CALIBRATED ?auto_15249 ) ( SUPPORTS ?auto_15249 ?auto_15246 ) ( POINTING ?auto_15247 ?auto_15248 ) )
    :subtasks
    ( ( !TURN_TO ?auto_15247 ?auto_15245 ?auto_15248 )
      ( GET-2IMAGE ?auto_15245 ?auto_15246 ?auto_15242 ?auto_15243 )
      ( GET-1IMAGE-VERIFY ?auto_15242 ?auto_15243 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15250 - DIRECTION
      ?auto_15251 - MODE
      ?auto_15253 - DIRECTION
      ?auto_15252 - MODE
    )
    :vars
    (
      ?auto_15257 - INSTRUMENT
      ?auto_15254 - SATELLITE
      ?auto_15255 - DIRECTION
      ?auto_15256 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15257 ?auto_15254 ) ( SUPPORTS ?auto_15257 ?auto_15252 ) ( not ( = ?auto_15253 ?auto_15255 ) ) ( not ( = ?auto_15250 ?auto_15253 ) ) ( not ( = ?auto_15250 ?auto_15255 ) ) ( not ( = ?auto_15251 ?auto_15252 ) ) ( CALIBRATION_TARGET ?auto_15257 ?auto_15255 ) ( ON_BOARD ?auto_15256 ?auto_15254 ) ( POWER_ON ?auto_15256 ) ( not ( = ?auto_15257 ?auto_15256 ) ) ( CALIBRATED ?auto_15256 ) ( SUPPORTS ?auto_15256 ?auto_15251 ) ( POINTING ?auto_15254 ?auto_15255 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15253 ?auto_15252 )
      ( GET-2IMAGE-VERIFY ?auto_15250 ?auto_15251 ?auto_15253 ?auto_15252 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15258 - DIRECTION
      ?auto_15259 - MODE
      ?auto_15261 - DIRECTION
      ?auto_15260 - MODE
    )
    :vars
    (
      ?auto_15264 - INSTRUMENT
      ?auto_15262 - SATELLITE
      ?auto_15265 - DIRECTION
      ?auto_15263 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15264 ?auto_15262 ) ( SUPPORTS ?auto_15264 ?auto_15259 ) ( not ( = ?auto_15258 ?auto_15265 ) ) ( not ( = ?auto_15261 ?auto_15258 ) ) ( not ( = ?auto_15261 ?auto_15265 ) ) ( not ( = ?auto_15260 ?auto_15259 ) ) ( CALIBRATION_TARGET ?auto_15264 ?auto_15265 ) ( ON_BOARD ?auto_15263 ?auto_15262 ) ( POWER_ON ?auto_15263 ) ( not ( = ?auto_15264 ?auto_15263 ) ) ( CALIBRATED ?auto_15263 ) ( SUPPORTS ?auto_15263 ?auto_15260 ) ( POINTING ?auto_15262 ?auto_15265 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15261 ?auto_15260 ?auto_15258 ?auto_15259 )
      ( GET-2IMAGE-VERIFY ?auto_15258 ?auto_15259 ?auto_15261 ?auto_15260 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_15348 - DIRECTION
      ?auto_15349 - MODE
    )
    :vars
    (
      ?auto_15354 - INSTRUMENT
      ?auto_15352 - SATELLITE
      ?auto_15355 - DIRECTION
      ?auto_15351 - DIRECTION
      ?auto_15350 - MODE
      ?auto_15353 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15354 ?auto_15352 ) ( SUPPORTS ?auto_15354 ?auto_15349 ) ( not ( = ?auto_15348 ?auto_15355 ) ) ( not ( = ?auto_15351 ?auto_15348 ) ) ( not ( = ?auto_15351 ?auto_15355 ) ) ( not ( = ?auto_15350 ?auto_15349 ) ) ( CALIBRATION_TARGET ?auto_15354 ?auto_15355 ) ( ON_BOARD ?auto_15353 ?auto_15352 ) ( POWER_ON ?auto_15353 ) ( not ( = ?auto_15354 ?auto_15353 ) ) ( SUPPORTS ?auto_15353 ?auto_15350 ) ( POINTING ?auto_15352 ?auto_15355 ) ( CALIBRATION_TARGET ?auto_15353 ?auto_15355 ) ( NOT_CALIBRATED ?auto_15353 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_15352 ?auto_15353 ?auto_15355 )
      ( GET-2IMAGE ?auto_15351 ?auto_15350 ?auto_15348 ?auto_15349 )
      ( GET-1IMAGE-VERIFY ?auto_15348 ?auto_15349 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15356 - DIRECTION
      ?auto_15357 - MODE
      ?auto_15359 - DIRECTION
      ?auto_15358 - MODE
    )
    :vars
    (
      ?auto_15363 - INSTRUMENT
      ?auto_15360 - SATELLITE
      ?auto_15362 - DIRECTION
      ?auto_15361 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15363 ?auto_15360 ) ( SUPPORTS ?auto_15363 ?auto_15358 ) ( not ( = ?auto_15359 ?auto_15362 ) ) ( not ( = ?auto_15356 ?auto_15359 ) ) ( not ( = ?auto_15356 ?auto_15362 ) ) ( not ( = ?auto_15357 ?auto_15358 ) ) ( CALIBRATION_TARGET ?auto_15363 ?auto_15362 ) ( ON_BOARD ?auto_15361 ?auto_15360 ) ( POWER_ON ?auto_15361 ) ( not ( = ?auto_15363 ?auto_15361 ) ) ( SUPPORTS ?auto_15361 ?auto_15357 ) ( POINTING ?auto_15360 ?auto_15362 ) ( CALIBRATION_TARGET ?auto_15361 ?auto_15362 ) ( NOT_CALIBRATED ?auto_15361 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15359 ?auto_15358 )
      ( GET-2IMAGE-VERIFY ?auto_15356 ?auto_15357 ?auto_15359 ?auto_15358 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15364 - DIRECTION
      ?auto_15365 - MODE
      ?auto_15367 - DIRECTION
      ?auto_15366 - MODE
    )
    :vars
    (
      ?auto_15369 - INSTRUMENT
      ?auto_15371 - SATELLITE
      ?auto_15370 - DIRECTION
      ?auto_15368 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15369 ?auto_15371 ) ( SUPPORTS ?auto_15369 ?auto_15365 ) ( not ( = ?auto_15364 ?auto_15370 ) ) ( not ( = ?auto_15367 ?auto_15364 ) ) ( not ( = ?auto_15367 ?auto_15370 ) ) ( not ( = ?auto_15366 ?auto_15365 ) ) ( CALIBRATION_TARGET ?auto_15369 ?auto_15370 ) ( ON_BOARD ?auto_15368 ?auto_15371 ) ( POWER_ON ?auto_15368 ) ( not ( = ?auto_15369 ?auto_15368 ) ) ( SUPPORTS ?auto_15368 ?auto_15366 ) ( POINTING ?auto_15371 ?auto_15370 ) ( CALIBRATION_TARGET ?auto_15368 ?auto_15370 ) ( NOT_CALIBRATED ?auto_15368 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15367 ?auto_15366 ?auto_15364 ?auto_15365 )
      ( GET-2IMAGE-VERIFY ?auto_15364 ?auto_15365 ?auto_15367 ?auto_15366 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_15454 - DIRECTION
      ?auto_15455 - MODE
    )
    :vars
    (
      ?auto_15458 - INSTRUMENT
      ?auto_15461 - SATELLITE
      ?auto_15459 - DIRECTION
      ?auto_15460 - DIRECTION
      ?auto_15456 - MODE
      ?auto_15457 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15458 ?auto_15461 ) ( SUPPORTS ?auto_15458 ?auto_15455 ) ( not ( = ?auto_15454 ?auto_15459 ) ) ( not ( = ?auto_15460 ?auto_15454 ) ) ( not ( = ?auto_15460 ?auto_15459 ) ) ( not ( = ?auto_15456 ?auto_15455 ) ) ( CALIBRATION_TARGET ?auto_15458 ?auto_15459 ) ( ON_BOARD ?auto_15457 ?auto_15461 ) ( not ( = ?auto_15458 ?auto_15457 ) ) ( SUPPORTS ?auto_15457 ?auto_15456 ) ( POINTING ?auto_15461 ?auto_15459 ) ( CALIBRATION_TARGET ?auto_15457 ?auto_15459 ) ( POWER_AVAIL ?auto_15461 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_15457 ?auto_15461 )
      ( GET-2IMAGE ?auto_15460 ?auto_15456 ?auto_15454 ?auto_15455 )
      ( GET-1IMAGE-VERIFY ?auto_15454 ?auto_15455 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15462 - DIRECTION
      ?auto_15463 - MODE
      ?auto_15465 - DIRECTION
      ?auto_15464 - MODE
    )
    :vars
    (
      ?auto_15468 - INSTRUMENT
      ?auto_15469 - SATELLITE
      ?auto_15467 - DIRECTION
      ?auto_15466 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15468 ?auto_15469 ) ( SUPPORTS ?auto_15468 ?auto_15464 ) ( not ( = ?auto_15465 ?auto_15467 ) ) ( not ( = ?auto_15462 ?auto_15465 ) ) ( not ( = ?auto_15462 ?auto_15467 ) ) ( not ( = ?auto_15463 ?auto_15464 ) ) ( CALIBRATION_TARGET ?auto_15468 ?auto_15467 ) ( ON_BOARD ?auto_15466 ?auto_15469 ) ( not ( = ?auto_15468 ?auto_15466 ) ) ( SUPPORTS ?auto_15466 ?auto_15463 ) ( POINTING ?auto_15469 ?auto_15467 ) ( CALIBRATION_TARGET ?auto_15466 ?auto_15467 ) ( POWER_AVAIL ?auto_15469 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15465 ?auto_15464 )
      ( GET-2IMAGE-VERIFY ?auto_15462 ?auto_15463 ?auto_15465 ?auto_15464 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15470 - DIRECTION
      ?auto_15471 - MODE
      ?auto_15473 - DIRECTION
      ?auto_15472 - MODE
    )
    :vars
    (
      ?auto_15477 - INSTRUMENT
      ?auto_15474 - SATELLITE
      ?auto_15476 - DIRECTION
      ?auto_15475 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_15477 ?auto_15474 ) ( SUPPORTS ?auto_15477 ?auto_15471 ) ( not ( = ?auto_15470 ?auto_15476 ) ) ( not ( = ?auto_15473 ?auto_15470 ) ) ( not ( = ?auto_15473 ?auto_15476 ) ) ( not ( = ?auto_15472 ?auto_15471 ) ) ( CALIBRATION_TARGET ?auto_15477 ?auto_15476 ) ( ON_BOARD ?auto_15475 ?auto_15474 ) ( not ( = ?auto_15477 ?auto_15475 ) ) ( SUPPORTS ?auto_15475 ?auto_15472 ) ( POINTING ?auto_15474 ?auto_15476 ) ( CALIBRATION_TARGET ?auto_15475 ?auto_15476 ) ( POWER_AVAIL ?auto_15474 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15473 ?auto_15472 ?auto_15470 ?auto_15471 )
      ( GET-2IMAGE-VERIFY ?auto_15470 ?auto_15471 ?auto_15473 ?auto_15472 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_15560 - DIRECTION
      ?auto_15561 - MODE
    )
    :vars
    (
      ?auto_15566 - INSTRUMENT
      ?auto_15562 - SATELLITE
      ?auto_15565 - DIRECTION
      ?auto_15564 - DIRECTION
      ?auto_15567 - MODE
      ?auto_15563 - INSTRUMENT
      ?auto_15568 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_15566 ?auto_15562 ) ( SUPPORTS ?auto_15566 ?auto_15561 ) ( not ( = ?auto_15560 ?auto_15565 ) ) ( not ( = ?auto_15564 ?auto_15560 ) ) ( not ( = ?auto_15564 ?auto_15565 ) ) ( not ( = ?auto_15567 ?auto_15561 ) ) ( CALIBRATION_TARGET ?auto_15566 ?auto_15565 ) ( ON_BOARD ?auto_15563 ?auto_15562 ) ( not ( = ?auto_15566 ?auto_15563 ) ) ( SUPPORTS ?auto_15563 ?auto_15567 ) ( CALIBRATION_TARGET ?auto_15563 ?auto_15565 ) ( POWER_AVAIL ?auto_15562 ) ( POINTING ?auto_15562 ?auto_15568 ) ( not ( = ?auto_15565 ?auto_15568 ) ) ( not ( = ?auto_15560 ?auto_15568 ) ) ( not ( = ?auto_15564 ?auto_15568 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_15562 ?auto_15565 ?auto_15568 )
      ( GET-2IMAGE ?auto_15564 ?auto_15567 ?auto_15560 ?auto_15561 )
      ( GET-1IMAGE-VERIFY ?auto_15560 ?auto_15561 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15569 - DIRECTION
      ?auto_15570 - MODE
      ?auto_15572 - DIRECTION
      ?auto_15571 - MODE
    )
    :vars
    (
      ?auto_15574 - INSTRUMENT
      ?auto_15577 - SATELLITE
      ?auto_15576 - DIRECTION
      ?auto_15575 - INSTRUMENT
      ?auto_15573 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_15574 ?auto_15577 ) ( SUPPORTS ?auto_15574 ?auto_15571 ) ( not ( = ?auto_15572 ?auto_15576 ) ) ( not ( = ?auto_15569 ?auto_15572 ) ) ( not ( = ?auto_15569 ?auto_15576 ) ) ( not ( = ?auto_15570 ?auto_15571 ) ) ( CALIBRATION_TARGET ?auto_15574 ?auto_15576 ) ( ON_BOARD ?auto_15575 ?auto_15577 ) ( not ( = ?auto_15574 ?auto_15575 ) ) ( SUPPORTS ?auto_15575 ?auto_15570 ) ( CALIBRATION_TARGET ?auto_15575 ?auto_15576 ) ( POWER_AVAIL ?auto_15577 ) ( POINTING ?auto_15577 ?auto_15573 ) ( not ( = ?auto_15576 ?auto_15573 ) ) ( not ( = ?auto_15572 ?auto_15573 ) ) ( not ( = ?auto_15569 ?auto_15573 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15572 ?auto_15571 )
      ( GET-2IMAGE-VERIFY ?auto_15569 ?auto_15570 ?auto_15572 ?auto_15571 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15578 - DIRECTION
      ?auto_15579 - MODE
      ?auto_15581 - DIRECTION
      ?auto_15580 - MODE
    )
    :vars
    (
      ?auto_15582 - INSTRUMENT
      ?auto_15586 - SATELLITE
      ?auto_15583 - DIRECTION
      ?auto_15584 - INSTRUMENT
      ?auto_15585 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_15582 ?auto_15586 ) ( SUPPORTS ?auto_15582 ?auto_15579 ) ( not ( = ?auto_15578 ?auto_15583 ) ) ( not ( = ?auto_15581 ?auto_15578 ) ) ( not ( = ?auto_15581 ?auto_15583 ) ) ( not ( = ?auto_15580 ?auto_15579 ) ) ( CALIBRATION_TARGET ?auto_15582 ?auto_15583 ) ( ON_BOARD ?auto_15584 ?auto_15586 ) ( not ( = ?auto_15582 ?auto_15584 ) ) ( SUPPORTS ?auto_15584 ?auto_15580 ) ( CALIBRATION_TARGET ?auto_15584 ?auto_15583 ) ( POWER_AVAIL ?auto_15586 ) ( POINTING ?auto_15586 ?auto_15585 ) ( not ( = ?auto_15583 ?auto_15585 ) ) ( not ( = ?auto_15578 ?auto_15585 ) ) ( not ( = ?auto_15581 ?auto_15585 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15581 ?auto_15580 ?auto_15578 ?auto_15579 )
      ( GET-2IMAGE-VERIFY ?auto_15578 ?auto_15579 ?auto_15581 ?auto_15580 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_15813 - DIRECTION
      ?auto_15814 - MODE
    )
    :vars
    (
      ?auto_15815 - INSTRUMENT
      ?auto_15816 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_15815 ) ( ON_BOARD ?auto_15815 ?auto_15816 ) ( SUPPORTS ?auto_15815 ?auto_15814 ) ( POWER_ON ?auto_15815 ) ( POINTING ?auto_15816 ?auto_15813 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_15816 ?auto_15813 ?auto_15815 ?auto_15814 )
      ( GET-1IMAGE-VERIFY ?auto_15813 ?auto_15814 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15817 - DIRECTION
      ?auto_15818 - MODE
      ?auto_15820 - DIRECTION
      ?auto_15819 - MODE
    )
    :vars
    (
      ?auto_15821 - INSTRUMENT
      ?auto_15822 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_15821 ) ( ON_BOARD ?auto_15821 ?auto_15822 ) ( SUPPORTS ?auto_15821 ?auto_15819 ) ( POWER_ON ?auto_15821 ) ( POINTING ?auto_15822 ?auto_15820 ) ( HAVE_IMAGE ?auto_15817 ?auto_15818 ) ( not ( = ?auto_15817 ?auto_15820 ) ) ( not ( = ?auto_15818 ?auto_15819 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15820 ?auto_15819 )
      ( GET-2IMAGE-VERIFY ?auto_15817 ?auto_15818 ?auto_15820 ?auto_15819 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15823 - DIRECTION
      ?auto_15824 - MODE
      ?auto_15826 - DIRECTION
      ?auto_15825 - MODE
    )
    :vars
    (
      ?auto_15827 - INSTRUMENT
      ?auto_15828 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_15827 ) ( ON_BOARD ?auto_15827 ?auto_15828 ) ( SUPPORTS ?auto_15827 ?auto_15825 ) ( POWER_ON ?auto_15827 ) ( POINTING ?auto_15828 ?auto_15826 ) ( HAVE_IMAGE ?auto_15823 ?auto_15824 ) ( not ( = ?auto_15823 ?auto_15826 ) ) ( not ( = ?auto_15824 ?auto_15825 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15826 ?auto_15825 )
      ( GET-2IMAGE-VERIFY ?auto_15823 ?auto_15824 ?auto_15826 ?auto_15825 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15829 - DIRECTION
      ?auto_15830 - MODE
      ?auto_15832 - DIRECTION
      ?auto_15831 - MODE
    )
    :vars
    (
      ?auto_15833 - INSTRUMENT
      ?auto_15834 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_15833 ) ( ON_BOARD ?auto_15833 ?auto_15834 ) ( SUPPORTS ?auto_15833 ?auto_15830 ) ( POWER_ON ?auto_15833 ) ( POINTING ?auto_15834 ?auto_15829 ) ( HAVE_IMAGE ?auto_15832 ?auto_15831 ) ( not ( = ?auto_15829 ?auto_15832 ) ) ( not ( = ?auto_15830 ?auto_15831 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15829 ?auto_15830 )
      ( GET-2IMAGE-VERIFY ?auto_15829 ?auto_15830 ?auto_15832 ?auto_15831 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_15835 - DIRECTION
      ?auto_15836 - MODE
      ?auto_15838 - DIRECTION
      ?auto_15837 - MODE
    )
    :vars
    (
      ?auto_15839 - INSTRUMENT
      ?auto_15840 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_15839 ) ( ON_BOARD ?auto_15839 ?auto_15840 ) ( SUPPORTS ?auto_15839 ?auto_15836 ) ( POWER_ON ?auto_15839 ) ( POINTING ?auto_15840 ?auto_15835 ) ( HAVE_IMAGE ?auto_15838 ?auto_15837 ) ( not ( = ?auto_15835 ?auto_15838 ) ) ( not ( = ?auto_15836 ?auto_15837 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15835 ?auto_15836 )
      ( GET-2IMAGE-VERIFY ?auto_15835 ?auto_15836 ?auto_15838 ?auto_15837 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15847 - DIRECTION
      ?auto_15848 - MODE
      ?auto_15850 - DIRECTION
      ?auto_15849 - MODE
      ?auto_15852 - DIRECTION
      ?auto_15851 - MODE
    )
    :vars
    (
      ?auto_15853 - INSTRUMENT
      ?auto_15854 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_15853 ) ( ON_BOARD ?auto_15853 ?auto_15854 ) ( SUPPORTS ?auto_15853 ?auto_15851 ) ( POWER_ON ?auto_15853 ) ( POINTING ?auto_15854 ?auto_15852 ) ( HAVE_IMAGE ?auto_15847 ?auto_15848 ) ( HAVE_IMAGE ?auto_15850 ?auto_15849 ) ( not ( = ?auto_15847 ?auto_15850 ) ) ( not ( = ?auto_15847 ?auto_15852 ) ) ( not ( = ?auto_15848 ?auto_15849 ) ) ( not ( = ?auto_15848 ?auto_15851 ) ) ( not ( = ?auto_15850 ?auto_15852 ) ) ( not ( = ?auto_15849 ?auto_15851 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15852 ?auto_15851 )
      ( GET-3IMAGE-VERIFY ?auto_15847 ?auto_15848 ?auto_15850 ?auto_15849 ?auto_15852 ?auto_15851 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15855 - DIRECTION
      ?auto_15856 - MODE
      ?auto_15858 - DIRECTION
      ?auto_15857 - MODE
      ?auto_15860 - DIRECTION
      ?auto_15859 - MODE
    )
    :vars
    (
      ?auto_15861 - INSTRUMENT
      ?auto_15862 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_15861 ) ( ON_BOARD ?auto_15861 ?auto_15862 ) ( SUPPORTS ?auto_15861 ?auto_15859 ) ( POWER_ON ?auto_15861 ) ( POINTING ?auto_15862 ?auto_15860 ) ( HAVE_IMAGE ?auto_15855 ?auto_15856 ) ( HAVE_IMAGE ?auto_15858 ?auto_15857 ) ( not ( = ?auto_15855 ?auto_15858 ) ) ( not ( = ?auto_15855 ?auto_15860 ) ) ( not ( = ?auto_15856 ?auto_15857 ) ) ( not ( = ?auto_15856 ?auto_15859 ) ) ( not ( = ?auto_15858 ?auto_15860 ) ) ( not ( = ?auto_15857 ?auto_15859 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15860 ?auto_15859 )
      ( GET-3IMAGE-VERIFY ?auto_15855 ?auto_15856 ?auto_15858 ?auto_15857 ?auto_15860 ?auto_15859 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15863 - DIRECTION
      ?auto_15864 - MODE
      ?auto_15866 - DIRECTION
      ?auto_15865 - MODE
      ?auto_15868 - DIRECTION
      ?auto_15867 - MODE
    )
    :vars
    (
      ?auto_15869 - INSTRUMENT
      ?auto_15870 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_15869 ) ( ON_BOARD ?auto_15869 ?auto_15870 ) ( SUPPORTS ?auto_15869 ?auto_15865 ) ( POWER_ON ?auto_15869 ) ( POINTING ?auto_15870 ?auto_15866 ) ( HAVE_IMAGE ?auto_15863 ?auto_15864 ) ( HAVE_IMAGE ?auto_15868 ?auto_15867 ) ( not ( = ?auto_15863 ?auto_15866 ) ) ( not ( = ?auto_15863 ?auto_15868 ) ) ( not ( = ?auto_15864 ?auto_15865 ) ) ( not ( = ?auto_15864 ?auto_15867 ) ) ( not ( = ?auto_15866 ?auto_15868 ) ) ( not ( = ?auto_15865 ?auto_15867 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15866 ?auto_15865 )
      ( GET-3IMAGE-VERIFY ?auto_15863 ?auto_15864 ?auto_15866 ?auto_15865 ?auto_15868 ?auto_15867 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15871 - DIRECTION
      ?auto_15872 - MODE
      ?auto_15874 - DIRECTION
      ?auto_15873 - MODE
      ?auto_15876 - DIRECTION
      ?auto_15875 - MODE
    )
    :vars
    (
      ?auto_15877 - INSTRUMENT
      ?auto_15878 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_15877 ) ( ON_BOARD ?auto_15877 ?auto_15878 ) ( SUPPORTS ?auto_15877 ?auto_15873 ) ( POWER_ON ?auto_15877 ) ( POINTING ?auto_15878 ?auto_15874 ) ( HAVE_IMAGE ?auto_15871 ?auto_15872 ) ( HAVE_IMAGE ?auto_15876 ?auto_15875 ) ( not ( = ?auto_15871 ?auto_15874 ) ) ( not ( = ?auto_15871 ?auto_15876 ) ) ( not ( = ?auto_15872 ?auto_15873 ) ) ( not ( = ?auto_15872 ?auto_15875 ) ) ( not ( = ?auto_15874 ?auto_15876 ) ) ( not ( = ?auto_15873 ?auto_15875 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15874 ?auto_15873 )
      ( GET-3IMAGE-VERIFY ?auto_15871 ?auto_15872 ?auto_15874 ?auto_15873 ?auto_15876 ?auto_15875 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15887 - DIRECTION
      ?auto_15888 - MODE
      ?auto_15890 - DIRECTION
      ?auto_15889 - MODE
      ?auto_15892 - DIRECTION
      ?auto_15891 - MODE
    )
    :vars
    (
      ?auto_15893 - INSTRUMENT
      ?auto_15894 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_15893 ) ( ON_BOARD ?auto_15893 ?auto_15894 ) ( SUPPORTS ?auto_15893 ?auto_15891 ) ( POWER_ON ?auto_15893 ) ( POINTING ?auto_15894 ?auto_15892 ) ( HAVE_IMAGE ?auto_15887 ?auto_15888 ) ( HAVE_IMAGE ?auto_15890 ?auto_15889 ) ( not ( = ?auto_15887 ?auto_15890 ) ) ( not ( = ?auto_15887 ?auto_15892 ) ) ( not ( = ?auto_15888 ?auto_15889 ) ) ( not ( = ?auto_15888 ?auto_15891 ) ) ( not ( = ?auto_15890 ?auto_15892 ) ) ( not ( = ?auto_15889 ?auto_15891 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15892 ?auto_15891 )
      ( GET-3IMAGE-VERIFY ?auto_15887 ?auto_15888 ?auto_15890 ?auto_15889 ?auto_15892 ?auto_15891 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15895 - DIRECTION
      ?auto_15896 - MODE
      ?auto_15898 - DIRECTION
      ?auto_15897 - MODE
      ?auto_15900 - DIRECTION
      ?auto_15899 - MODE
    )
    :vars
    (
      ?auto_15901 - INSTRUMENT
      ?auto_15902 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_15901 ) ( ON_BOARD ?auto_15901 ?auto_15902 ) ( SUPPORTS ?auto_15901 ?auto_15899 ) ( POWER_ON ?auto_15901 ) ( POINTING ?auto_15902 ?auto_15900 ) ( HAVE_IMAGE ?auto_15895 ?auto_15896 ) ( HAVE_IMAGE ?auto_15898 ?auto_15897 ) ( not ( = ?auto_15895 ?auto_15898 ) ) ( not ( = ?auto_15895 ?auto_15900 ) ) ( not ( = ?auto_15896 ?auto_15897 ) ) ( not ( = ?auto_15896 ?auto_15899 ) ) ( not ( = ?auto_15898 ?auto_15900 ) ) ( not ( = ?auto_15897 ?auto_15899 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15900 ?auto_15899 )
      ( GET-3IMAGE-VERIFY ?auto_15895 ?auto_15896 ?auto_15898 ?auto_15897 ?auto_15900 ?auto_15899 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15903 - DIRECTION
      ?auto_15904 - MODE
      ?auto_15906 - DIRECTION
      ?auto_15905 - MODE
      ?auto_15908 - DIRECTION
      ?auto_15907 - MODE
    )
    :vars
    (
      ?auto_15909 - INSTRUMENT
      ?auto_15910 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_15909 ) ( ON_BOARD ?auto_15909 ?auto_15910 ) ( SUPPORTS ?auto_15909 ?auto_15905 ) ( POWER_ON ?auto_15909 ) ( POINTING ?auto_15910 ?auto_15906 ) ( HAVE_IMAGE ?auto_15903 ?auto_15904 ) ( HAVE_IMAGE ?auto_15908 ?auto_15907 ) ( not ( = ?auto_15903 ?auto_15906 ) ) ( not ( = ?auto_15903 ?auto_15908 ) ) ( not ( = ?auto_15904 ?auto_15905 ) ) ( not ( = ?auto_15904 ?auto_15907 ) ) ( not ( = ?auto_15906 ?auto_15908 ) ) ( not ( = ?auto_15905 ?auto_15907 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15906 ?auto_15905 )
      ( GET-3IMAGE-VERIFY ?auto_15903 ?auto_15904 ?auto_15906 ?auto_15905 ?auto_15908 ?auto_15907 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15911 - DIRECTION
      ?auto_15912 - MODE
      ?auto_15914 - DIRECTION
      ?auto_15913 - MODE
      ?auto_15916 - DIRECTION
      ?auto_15915 - MODE
    )
    :vars
    (
      ?auto_15917 - INSTRUMENT
      ?auto_15918 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_15917 ) ( ON_BOARD ?auto_15917 ?auto_15918 ) ( SUPPORTS ?auto_15917 ?auto_15913 ) ( POWER_ON ?auto_15917 ) ( POINTING ?auto_15918 ?auto_15914 ) ( HAVE_IMAGE ?auto_15911 ?auto_15912 ) ( HAVE_IMAGE ?auto_15916 ?auto_15915 ) ( not ( = ?auto_15911 ?auto_15914 ) ) ( not ( = ?auto_15911 ?auto_15916 ) ) ( not ( = ?auto_15912 ?auto_15913 ) ) ( not ( = ?auto_15912 ?auto_15915 ) ) ( not ( = ?auto_15914 ?auto_15916 ) ) ( not ( = ?auto_15913 ?auto_15915 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15914 ?auto_15913 )
      ( GET-3IMAGE-VERIFY ?auto_15911 ?auto_15912 ?auto_15914 ?auto_15913 ?auto_15916 ?auto_15915 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15927 - DIRECTION
      ?auto_15928 - MODE
      ?auto_15930 - DIRECTION
      ?auto_15929 - MODE
      ?auto_15932 - DIRECTION
      ?auto_15931 - MODE
    )
    :vars
    (
      ?auto_15933 - INSTRUMENT
      ?auto_15934 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_15933 ) ( ON_BOARD ?auto_15933 ?auto_15934 ) ( SUPPORTS ?auto_15933 ?auto_15928 ) ( POWER_ON ?auto_15933 ) ( POINTING ?auto_15934 ?auto_15927 ) ( HAVE_IMAGE ?auto_15930 ?auto_15929 ) ( HAVE_IMAGE ?auto_15932 ?auto_15931 ) ( not ( = ?auto_15927 ?auto_15930 ) ) ( not ( = ?auto_15927 ?auto_15932 ) ) ( not ( = ?auto_15928 ?auto_15929 ) ) ( not ( = ?auto_15928 ?auto_15931 ) ) ( not ( = ?auto_15930 ?auto_15932 ) ) ( not ( = ?auto_15929 ?auto_15931 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15927 ?auto_15928 )
      ( GET-3IMAGE-VERIFY ?auto_15927 ?auto_15928 ?auto_15930 ?auto_15929 ?auto_15932 ?auto_15931 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15935 - DIRECTION
      ?auto_15936 - MODE
      ?auto_15938 - DIRECTION
      ?auto_15937 - MODE
      ?auto_15940 - DIRECTION
      ?auto_15939 - MODE
    )
    :vars
    (
      ?auto_15941 - INSTRUMENT
      ?auto_15942 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_15941 ) ( ON_BOARD ?auto_15941 ?auto_15942 ) ( SUPPORTS ?auto_15941 ?auto_15936 ) ( POWER_ON ?auto_15941 ) ( POINTING ?auto_15942 ?auto_15935 ) ( HAVE_IMAGE ?auto_15938 ?auto_15937 ) ( HAVE_IMAGE ?auto_15940 ?auto_15939 ) ( not ( = ?auto_15935 ?auto_15938 ) ) ( not ( = ?auto_15935 ?auto_15940 ) ) ( not ( = ?auto_15936 ?auto_15937 ) ) ( not ( = ?auto_15936 ?auto_15939 ) ) ( not ( = ?auto_15938 ?auto_15940 ) ) ( not ( = ?auto_15937 ?auto_15939 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15935 ?auto_15936 )
      ( GET-3IMAGE-VERIFY ?auto_15935 ?auto_15936 ?auto_15938 ?auto_15937 ?auto_15940 ?auto_15939 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15951 - DIRECTION
      ?auto_15952 - MODE
      ?auto_15954 - DIRECTION
      ?auto_15953 - MODE
      ?auto_15956 - DIRECTION
      ?auto_15955 - MODE
    )
    :vars
    (
      ?auto_15957 - INSTRUMENT
      ?auto_15958 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_15957 ) ( ON_BOARD ?auto_15957 ?auto_15958 ) ( SUPPORTS ?auto_15957 ?auto_15952 ) ( POWER_ON ?auto_15957 ) ( POINTING ?auto_15958 ?auto_15951 ) ( HAVE_IMAGE ?auto_15954 ?auto_15953 ) ( HAVE_IMAGE ?auto_15956 ?auto_15955 ) ( not ( = ?auto_15951 ?auto_15954 ) ) ( not ( = ?auto_15951 ?auto_15956 ) ) ( not ( = ?auto_15952 ?auto_15953 ) ) ( not ( = ?auto_15952 ?auto_15955 ) ) ( not ( = ?auto_15954 ?auto_15956 ) ) ( not ( = ?auto_15953 ?auto_15955 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15951 ?auto_15952 )
      ( GET-3IMAGE-VERIFY ?auto_15951 ?auto_15952 ?auto_15954 ?auto_15953 ?auto_15956 ?auto_15955 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_15959 - DIRECTION
      ?auto_15960 - MODE
      ?auto_15962 - DIRECTION
      ?auto_15961 - MODE
      ?auto_15964 - DIRECTION
      ?auto_15963 - MODE
    )
    :vars
    (
      ?auto_15965 - INSTRUMENT
      ?auto_15966 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_15965 ) ( ON_BOARD ?auto_15965 ?auto_15966 ) ( SUPPORTS ?auto_15965 ?auto_15960 ) ( POWER_ON ?auto_15965 ) ( POINTING ?auto_15966 ?auto_15959 ) ( HAVE_IMAGE ?auto_15962 ?auto_15961 ) ( HAVE_IMAGE ?auto_15964 ?auto_15963 ) ( not ( = ?auto_15959 ?auto_15962 ) ) ( not ( = ?auto_15959 ?auto_15964 ) ) ( not ( = ?auto_15960 ?auto_15961 ) ) ( not ( = ?auto_15960 ?auto_15963 ) ) ( not ( = ?auto_15962 ?auto_15964 ) ) ( not ( = ?auto_15961 ?auto_15963 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15959 ?auto_15960 )
      ( GET-3IMAGE-VERIFY ?auto_15959 ?auto_15960 ?auto_15962 ?auto_15961 ?auto_15964 ?auto_15963 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_15999 - DIRECTION
      ?auto_16000 - MODE
    )
    :vars
    (
      ?auto_16001 - INSTRUMENT
      ?auto_16002 - SATELLITE
      ?auto_16003 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_16001 ) ( ON_BOARD ?auto_16001 ?auto_16002 ) ( SUPPORTS ?auto_16001 ?auto_16000 ) ( POWER_ON ?auto_16001 ) ( POINTING ?auto_16002 ?auto_16003 ) ( not ( = ?auto_15999 ?auto_16003 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_16002 ?auto_15999 ?auto_16003 )
      ( GET-1IMAGE ?auto_15999 ?auto_16000 )
      ( GET-1IMAGE-VERIFY ?auto_15999 ?auto_16000 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_16004 - DIRECTION
      ?auto_16005 - MODE
      ?auto_16007 - DIRECTION
      ?auto_16006 - MODE
    )
    :vars
    (
      ?auto_16009 - INSTRUMENT
      ?auto_16010 - SATELLITE
      ?auto_16008 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_16009 ) ( ON_BOARD ?auto_16009 ?auto_16010 ) ( SUPPORTS ?auto_16009 ?auto_16006 ) ( POWER_ON ?auto_16009 ) ( POINTING ?auto_16010 ?auto_16008 ) ( not ( = ?auto_16007 ?auto_16008 ) ) ( HAVE_IMAGE ?auto_16004 ?auto_16005 ) ( not ( = ?auto_16004 ?auto_16007 ) ) ( not ( = ?auto_16004 ?auto_16008 ) ) ( not ( = ?auto_16005 ?auto_16006 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_16007 ?auto_16006 )
      ( GET-2IMAGE-VERIFY ?auto_16004 ?auto_16005 ?auto_16007 ?auto_16006 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_16011 - DIRECTION
      ?auto_16012 - MODE
      ?auto_16014 - DIRECTION
      ?auto_16013 - MODE
    )
    :vars
    (
      ?auto_16018 - INSTRUMENT
      ?auto_16019 - SATELLITE
      ?auto_16017 - DIRECTION
      ?auto_16016 - DIRECTION
      ?auto_16015 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_16018 ) ( ON_BOARD ?auto_16018 ?auto_16019 ) ( SUPPORTS ?auto_16018 ?auto_16013 ) ( POWER_ON ?auto_16018 ) ( POINTING ?auto_16019 ?auto_16017 ) ( not ( = ?auto_16014 ?auto_16017 ) ) ( HAVE_IMAGE ?auto_16016 ?auto_16015 ) ( not ( = ?auto_16016 ?auto_16014 ) ) ( not ( = ?auto_16016 ?auto_16017 ) ) ( not ( = ?auto_16015 ?auto_16013 ) ) ( HAVE_IMAGE ?auto_16011 ?auto_16012 ) ( not ( = ?auto_16011 ?auto_16014 ) ) ( not ( = ?auto_16011 ?auto_16017 ) ) ( not ( = ?auto_16011 ?auto_16016 ) ) ( not ( = ?auto_16012 ?auto_16013 ) ) ( not ( = ?auto_16012 ?auto_16015 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16016 ?auto_16015 ?auto_16014 ?auto_16013 )
      ( GET-2IMAGE-VERIFY ?auto_16011 ?auto_16012 ?auto_16014 ?auto_16013 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_16020 - DIRECTION
      ?auto_16021 - MODE
      ?auto_16023 - DIRECTION
      ?auto_16022 - MODE
    )
    :vars
    (
      ?auto_16025 - INSTRUMENT
      ?auto_16026 - SATELLITE
      ?auto_16024 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_16025 ) ( ON_BOARD ?auto_16025 ?auto_16026 ) ( SUPPORTS ?auto_16025 ?auto_16021 ) ( POWER_ON ?auto_16025 ) ( POINTING ?auto_16026 ?auto_16024 ) ( not ( = ?auto_16020 ?auto_16024 ) ) ( HAVE_IMAGE ?auto_16023 ?auto_16022 ) ( not ( = ?auto_16023 ?auto_16020 ) ) ( not ( = ?auto_16023 ?auto_16024 ) ) ( not ( = ?auto_16022 ?auto_16021 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16023 ?auto_16022 ?auto_16020 ?auto_16021 )
      ( GET-2IMAGE-VERIFY ?auto_16020 ?auto_16021 ?auto_16023 ?auto_16022 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_16027 - DIRECTION
      ?auto_16028 - MODE
      ?auto_16030 - DIRECTION
      ?auto_16029 - MODE
    )
    :vars
    (
      ?auto_16034 - INSTRUMENT
      ?auto_16035 - SATELLITE
      ?auto_16033 - DIRECTION
      ?auto_16032 - DIRECTION
      ?auto_16031 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_16034 ) ( ON_BOARD ?auto_16034 ?auto_16035 ) ( SUPPORTS ?auto_16034 ?auto_16028 ) ( POWER_ON ?auto_16034 ) ( POINTING ?auto_16035 ?auto_16033 ) ( not ( = ?auto_16027 ?auto_16033 ) ) ( HAVE_IMAGE ?auto_16032 ?auto_16031 ) ( not ( = ?auto_16032 ?auto_16027 ) ) ( not ( = ?auto_16032 ?auto_16033 ) ) ( not ( = ?auto_16031 ?auto_16028 ) ) ( HAVE_IMAGE ?auto_16030 ?auto_16029 ) ( not ( = ?auto_16027 ?auto_16030 ) ) ( not ( = ?auto_16028 ?auto_16029 ) ) ( not ( = ?auto_16030 ?auto_16033 ) ) ( not ( = ?auto_16030 ?auto_16032 ) ) ( not ( = ?auto_16029 ?auto_16031 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16032 ?auto_16031 ?auto_16027 ?auto_16028 )
      ( GET-2IMAGE-VERIFY ?auto_16027 ?auto_16028 ?auto_16030 ?auto_16029 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16045 - DIRECTION
      ?auto_16046 - MODE
      ?auto_16048 - DIRECTION
      ?auto_16047 - MODE
      ?auto_16050 - DIRECTION
      ?auto_16049 - MODE
    )
    :vars
    (
      ?auto_16052 - INSTRUMENT
      ?auto_16053 - SATELLITE
      ?auto_16051 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_16052 ) ( ON_BOARD ?auto_16052 ?auto_16053 ) ( SUPPORTS ?auto_16052 ?auto_16049 ) ( POWER_ON ?auto_16052 ) ( POINTING ?auto_16053 ?auto_16051 ) ( not ( = ?auto_16050 ?auto_16051 ) ) ( HAVE_IMAGE ?auto_16048 ?auto_16046 ) ( not ( = ?auto_16048 ?auto_16050 ) ) ( not ( = ?auto_16048 ?auto_16051 ) ) ( not ( = ?auto_16046 ?auto_16049 ) ) ( HAVE_IMAGE ?auto_16045 ?auto_16046 ) ( HAVE_IMAGE ?auto_16048 ?auto_16047 ) ( not ( = ?auto_16045 ?auto_16048 ) ) ( not ( = ?auto_16045 ?auto_16050 ) ) ( not ( = ?auto_16045 ?auto_16051 ) ) ( not ( = ?auto_16046 ?auto_16047 ) ) ( not ( = ?auto_16047 ?auto_16049 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16048 ?auto_16046 ?auto_16050 ?auto_16049 )
      ( GET-3IMAGE-VERIFY ?auto_16045 ?auto_16046 ?auto_16048 ?auto_16047 ?auto_16050 ?auto_16049 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16054 - DIRECTION
      ?auto_16055 - MODE
      ?auto_16057 - DIRECTION
      ?auto_16056 - MODE
      ?auto_16059 - DIRECTION
      ?auto_16058 - MODE
    )
    :vars
    (
      ?auto_16061 - INSTRUMENT
      ?auto_16062 - SATELLITE
      ?auto_16060 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_16061 ) ( ON_BOARD ?auto_16061 ?auto_16062 ) ( SUPPORTS ?auto_16061 ?auto_16058 ) ( POWER_ON ?auto_16061 ) ( POINTING ?auto_16062 ?auto_16060 ) ( not ( = ?auto_16059 ?auto_16060 ) ) ( HAVE_IMAGE ?auto_16054 ?auto_16055 ) ( not ( = ?auto_16054 ?auto_16059 ) ) ( not ( = ?auto_16054 ?auto_16060 ) ) ( not ( = ?auto_16055 ?auto_16058 ) ) ( HAVE_IMAGE ?auto_16057 ?auto_16056 ) ( not ( = ?auto_16054 ?auto_16057 ) ) ( not ( = ?auto_16055 ?auto_16056 ) ) ( not ( = ?auto_16057 ?auto_16059 ) ) ( not ( = ?auto_16057 ?auto_16060 ) ) ( not ( = ?auto_16056 ?auto_16058 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16054 ?auto_16055 ?auto_16059 ?auto_16058 )
      ( GET-3IMAGE-VERIFY ?auto_16054 ?auto_16055 ?auto_16057 ?auto_16056 ?auto_16059 ?auto_16058 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16063 - DIRECTION
      ?auto_16064 - MODE
      ?auto_16066 - DIRECTION
      ?auto_16065 - MODE
      ?auto_16068 - DIRECTION
      ?auto_16067 - MODE
    )
    :vars
    (
      ?auto_16070 - INSTRUMENT
      ?auto_16071 - SATELLITE
      ?auto_16069 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_16070 ) ( ON_BOARD ?auto_16070 ?auto_16071 ) ( SUPPORTS ?auto_16070 ?auto_16065 ) ( POWER_ON ?auto_16070 ) ( POINTING ?auto_16071 ?auto_16069 ) ( not ( = ?auto_16066 ?auto_16069 ) ) ( HAVE_IMAGE ?auto_16068 ?auto_16067 ) ( not ( = ?auto_16068 ?auto_16066 ) ) ( not ( = ?auto_16068 ?auto_16069 ) ) ( not ( = ?auto_16067 ?auto_16065 ) ) ( HAVE_IMAGE ?auto_16063 ?auto_16064 ) ( not ( = ?auto_16063 ?auto_16066 ) ) ( not ( = ?auto_16063 ?auto_16068 ) ) ( not ( = ?auto_16063 ?auto_16069 ) ) ( not ( = ?auto_16064 ?auto_16065 ) ) ( not ( = ?auto_16064 ?auto_16067 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16068 ?auto_16067 ?auto_16066 ?auto_16065 )
      ( GET-3IMAGE-VERIFY ?auto_16063 ?auto_16064 ?auto_16066 ?auto_16065 ?auto_16068 ?auto_16067 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16072 - DIRECTION
      ?auto_16073 - MODE
      ?auto_16075 - DIRECTION
      ?auto_16074 - MODE
      ?auto_16077 - DIRECTION
      ?auto_16076 - MODE
    )
    :vars
    (
      ?auto_16079 - INSTRUMENT
      ?auto_16080 - SATELLITE
      ?auto_16078 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_16079 ) ( ON_BOARD ?auto_16079 ?auto_16080 ) ( SUPPORTS ?auto_16079 ?auto_16074 ) ( POWER_ON ?auto_16079 ) ( POINTING ?auto_16080 ?auto_16078 ) ( not ( = ?auto_16075 ?auto_16078 ) ) ( HAVE_IMAGE ?auto_16072 ?auto_16073 ) ( not ( = ?auto_16072 ?auto_16075 ) ) ( not ( = ?auto_16072 ?auto_16078 ) ) ( not ( = ?auto_16073 ?auto_16074 ) ) ( HAVE_IMAGE ?auto_16077 ?auto_16076 ) ( not ( = ?auto_16072 ?auto_16077 ) ) ( not ( = ?auto_16073 ?auto_16076 ) ) ( not ( = ?auto_16075 ?auto_16077 ) ) ( not ( = ?auto_16074 ?auto_16076 ) ) ( not ( = ?auto_16077 ?auto_16078 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16072 ?auto_16073 ?auto_16075 ?auto_16074 )
      ( GET-3IMAGE-VERIFY ?auto_16072 ?auto_16073 ?auto_16075 ?auto_16074 ?auto_16077 ?auto_16076 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16090 - DIRECTION
      ?auto_16091 - MODE
      ?auto_16093 - DIRECTION
      ?auto_16092 - MODE
      ?auto_16095 - DIRECTION
      ?auto_16094 - MODE
    )
    :vars
    (
      ?auto_16097 - INSTRUMENT
      ?auto_16098 - SATELLITE
      ?auto_16096 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_16097 ) ( ON_BOARD ?auto_16097 ?auto_16098 ) ( SUPPORTS ?auto_16097 ?auto_16094 ) ( POWER_ON ?auto_16097 ) ( POINTING ?auto_16098 ?auto_16096 ) ( not ( = ?auto_16095 ?auto_16096 ) ) ( HAVE_IMAGE ?auto_16093 ?auto_16092 ) ( not ( = ?auto_16093 ?auto_16095 ) ) ( not ( = ?auto_16093 ?auto_16096 ) ) ( not ( = ?auto_16092 ?auto_16094 ) ) ( HAVE_IMAGE ?auto_16090 ?auto_16091 ) ( not ( = ?auto_16090 ?auto_16093 ) ) ( not ( = ?auto_16090 ?auto_16095 ) ) ( not ( = ?auto_16090 ?auto_16096 ) ) ( not ( = ?auto_16091 ?auto_16092 ) ) ( not ( = ?auto_16091 ?auto_16094 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16093 ?auto_16092 ?auto_16095 ?auto_16094 )
      ( GET-3IMAGE-VERIFY ?auto_16090 ?auto_16091 ?auto_16093 ?auto_16092 ?auto_16095 ?auto_16094 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16099 - DIRECTION
      ?auto_16100 - MODE
      ?auto_16102 - DIRECTION
      ?auto_16101 - MODE
      ?auto_16104 - DIRECTION
      ?auto_16103 - MODE
    )
    :vars
    (
      ?auto_16108 - INSTRUMENT
      ?auto_16109 - SATELLITE
      ?auto_16107 - DIRECTION
      ?auto_16106 - DIRECTION
      ?auto_16105 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_16108 ) ( ON_BOARD ?auto_16108 ?auto_16109 ) ( SUPPORTS ?auto_16108 ?auto_16103 ) ( POWER_ON ?auto_16108 ) ( POINTING ?auto_16109 ?auto_16107 ) ( not ( = ?auto_16104 ?auto_16107 ) ) ( HAVE_IMAGE ?auto_16106 ?auto_16105 ) ( not ( = ?auto_16106 ?auto_16104 ) ) ( not ( = ?auto_16106 ?auto_16107 ) ) ( not ( = ?auto_16105 ?auto_16103 ) ) ( HAVE_IMAGE ?auto_16099 ?auto_16100 ) ( HAVE_IMAGE ?auto_16102 ?auto_16101 ) ( not ( = ?auto_16099 ?auto_16102 ) ) ( not ( = ?auto_16099 ?auto_16104 ) ) ( not ( = ?auto_16099 ?auto_16107 ) ) ( not ( = ?auto_16099 ?auto_16106 ) ) ( not ( = ?auto_16100 ?auto_16101 ) ) ( not ( = ?auto_16100 ?auto_16103 ) ) ( not ( = ?auto_16100 ?auto_16105 ) ) ( not ( = ?auto_16102 ?auto_16104 ) ) ( not ( = ?auto_16102 ?auto_16107 ) ) ( not ( = ?auto_16102 ?auto_16106 ) ) ( not ( = ?auto_16101 ?auto_16103 ) ) ( not ( = ?auto_16101 ?auto_16105 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16106 ?auto_16105 ?auto_16104 ?auto_16103 )
      ( GET-3IMAGE-VERIFY ?auto_16099 ?auto_16100 ?auto_16102 ?auto_16101 ?auto_16104 ?auto_16103 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16110 - DIRECTION
      ?auto_16111 - MODE
      ?auto_16113 - DIRECTION
      ?auto_16112 - MODE
      ?auto_16115 - DIRECTION
      ?auto_16114 - MODE
    )
    :vars
    (
      ?auto_16117 - INSTRUMENT
      ?auto_16118 - SATELLITE
      ?auto_16116 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_16117 ) ( ON_BOARD ?auto_16117 ?auto_16118 ) ( SUPPORTS ?auto_16117 ?auto_16112 ) ( POWER_ON ?auto_16117 ) ( POINTING ?auto_16118 ?auto_16116 ) ( not ( = ?auto_16113 ?auto_16116 ) ) ( HAVE_IMAGE ?auto_16115 ?auto_16114 ) ( not ( = ?auto_16115 ?auto_16113 ) ) ( not ( = ?auto_16115 ?auto_16116 ) ) ( not ( = ?auto_16114 ?auto_16112 ) ) ( HAVE_IMAGE ?auto_16110 ?auto_16111 ) ( not ( = ?auto_16110 ?auto_16113 ) ) ( not ( = ?auto_16110 ?auto_16115 ) ) ( not ( = ?auto_16110 ?auto_16116 ) ) ( not ( = ?auto_16111 ?auto_16112 ) ) ( not ( = ?auto_16111 ?auto_16114 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16115 ?auto_16114 ?auto_16113 ?auto_16112 )
      ( GET-3IMAGE-VERIFY ?auto_16110 ?auto_16111 ?auto_16113 ?auto_16112 ?auto_16115 ?auto_16114 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16119 - DIRECTION
      ?auto_16120 - MODE
      ?auto_16122 - DIRECTION
      ?auto_16121 - MODE
      ?auto_16124 - DIRECTION
      ?auto_16123 - MODE
    )
    :vars
    (
      ?auto_16128 - INSTRUMENT
      ?auto_16129 - SATELLITE
      ?auto_16127 - DIRECTION
      ?auto_16126 - DIRECTION
      ?auto_16125 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_16128 ) ( ON_BOARD ?auto_16128 ?auto_16129 ) ( SUPPORTS ?auto_16128 ?auto_16121 ) ( POWER_ON ?auto_16128 ) ( POINTING ?auto_16129 ?auto_16127 ) ( not ( = ?auto_16122 ?auto_16127 ) ) ( HAVE_IMAGE ?auto_16126 ?auto_16125 ) ( not ( = ?auto_16126 ?auto_16122 ) ) ( not ( = ?auto_16126 ?auto_16127 ) ) ( not ( = ?auto_16125 ?auto_16121 ) ) ( HAVE_IMAGE ?auto_16119 ?auto_16120 ) ( HAVE_IMAGE ?auto_16124 ?auto_16123 ) ( not ( = ?auto_16119 ?auto_16122 ) ) ( not ( = ?auto_16119 ?auto_16124 ) ) ( not ( = ?auto_16119 ?auto_16127 ) ) ( not ( = ?auto_16119 ?auto_16126 ) ) ( not ( = ?auto_16120 ?auto_16121 ) ) ( not ( = ?auto_16120 ?auto_16123 ) ) ( not ( = ?auto_16120 ?auto_16125 ) ) ( not ( = ?auto_16122 ?auto_16124 ) ) ( not ( = ?auto_16121 ?auto_16123 ) ) ( not ( = ?auto_16124 ?auto_16127 ) ) ( not ( = ?auto_16124 ?auto_16126 ) ) ( not ( = ?auto_16123 ?auto_16125 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16126 ?auto_16125 ?auto_16122 ?auto_16121 )
      ( GET-3IMAGE-VERIFY ?auto_16119 ?auto_16120 ?auto_16122 ?auto_16121 ?auto_16124 ?auto_16123 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16141 - DIRECTION
      ?auto_16142 - MODE
      ?auto_16144 - DIRECTION
      ?auto_16143 - MODE
      ?auto_16146 - DIRECTION
      ?auto_16145 - MODE
    )
    :vars
    (
      ?auto_16148 - INSTRUMENT
      ?auto_16149 - SATELLITE
      ?auto_16147 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_16148 ) ( ON_BOARD ?auto_16148 ?auto_16149 ) ( SUPPORTS ?auto_16148 ?auto_16142 ) ( POWER_ON ?auto_16148 ) ( POINTING ?auto_16149 ?auto_16147 ) ( not ( = ?auto_16141 ?auto_16147 ) ) ( HAVE_IMAGE ?auto_16146 ?auto_16145 ) ( not ( = ?auto_16146 ?auto_16141 ) ) ( not ( = ?auto_16146 ?auto_16147 ) ) ( not ( = ?auto_16145 ?auto_16142 ) ) ( HAVE_IMAGE ?auto_16144 ?auto_16143 ) ( not ( = ?auto_16141 ?auto_16144 ) ) ( not ( = ?auto_16142 ?auto_16143 ) ) ( not ( = ?auto_16144 ?auto_16146 ) ) ( not ( = ?auto_16144 ?auto_16147 ) ) ( not ( = ?auto_16143 ?auto_16145 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16146 ?auto_16145 ?auto_16141 ?auto_16142 )
      ( GET-3IMAGE-VERIFY ?auto_16141 ?auto_16142 ?auto_16144 ?auto_16143 ?auto_16146 ?auto_16145 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16150 - DIRECTION
      ?auto_16151 - MODE
      ?auto_16153 - DIRECTION
      ?auto_16152 - MODE
      ?auto_16155 - DIRECTION
      ?auto_16154 - MODE
    )
    :vars
    (
      ?auto_16157 - INSTRUMENT
      ?auto_16158 - SATELLITE
      ?auto_16156 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_16157 ) ( ON_BOARD ?auto_16157 ?auto_16158 ) ( SUPPORTS ?auto_16157 ?auto_16151 ) ( POWER_ON ?auto_16157 ) ( POINTING ?auto_16158 ?auto_16156 ) ( not ( = ?auto_16150 ?auto_16156 ) ) ( HAVE_IMAGE ?auto_16153 ?auto_16152 ) ( not ( = ?auto_16153 ?auto_16150 ) ) ( not ( = ?auto_16153 ?auto_16156 ) ) ( not ( = ?auto_16152 ?auto_16151 ) ) ( HAVE_IMAGE ?auto_16155 ?auto_16154 ) ( not ( = ?auto_16150 ?auto_16155 ) ) ( not ( = ?auto_16151 ?auto_16154 ) ) ( not ( = ?auto_16153 ?auto_16155 ) ) ( not ( = ?auto_16152 ?auto_16154 ) ) ( not ( = ?auto_16155 ?auto_16156 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16153 ?auto_16152 ?auto_16150 ?auto_16151 )
      ( GET-3IMAGE-VERIFY ?auto_16150 ?auto_16151 ?auto_16153 ?auto_16152 ?auto_16155 ?auto_16154 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16168 - DIRECTION
      ?auto_16169 - MODE
      ?auto_16171 - DIRECTION
      ?auto_16170 - MODE
      ?auto_16173 - DIRECTION
      ?auto_16172 - MODE
    )
    :vars
    (
      ?auto_16175 - INSTRUMENT
      ?auto_16176 - SATELLITE
      ?auto_16174 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_16175 ) ( ON_BOARD ?auto_16175 ?auto_16176 ) ( SUPPORTS ?auto_16175 ?auto_16169 ) ( POWER_ON ?auto_16175 ) ( POINTING ?auto_16176 ?auto_16174 ) ( not ( = ?auto_16168 ?auto_16174 ) ) ( HAVE_IMAGE ?auto_16173 ?auto_16172 ) ( not ( = ?auto_16173 ?auto_16168 ) ) ( not ( = ?auto_16173 ?auto_16174 ) ) ( not ( = ?auto_16172 ?auto_16169 ) ) ( HAVE_IMAGE ?auto_16171 ?auto_16170 ) ( not ( = ?auto_16168 ?auto_16171 ) ) ( not ( = ?auto_16169 ?auto_16170 ) ) ( not ( = ?auto_16171 ?auto_16173 ) ) ( not ( = ?auto_16171 ?auto_16174 ) ) ( not ( = ?auto_16170 ?auto_16172 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16173 ?auto_16172 ?auto_16168 ?auto_16169 )
      ( GET-3IMAGE-VERIFY ?auto_16168 ?auto_16169 ?auto_16171 ?auto_16170 ?auto_16173 ?auto_16172 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16177 - DIRECTION
      ?auto_16178 - MODE
      ?auto_16180 - DIRECTION
      ?auto_16179 - MODE
      ?auto_16182 - DIRECTION
      ?auto_16181 - MODE
    )
    :vars
    (
      ?auto_16186 - INSTRUMENT
      ?auto_16187 - SATELLITE
      ?auto_16185 - DIRECTION
      ?auto_16184 - DIRECTION
      ?auto_16183 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_16186 ) ( ON_BOARD ?auto_16186 ?auto_16187 ) ( SUPPORTS ?auto_16186 ?auto_16178 ) ( POWER_ON ?auto_16186 ) ( POINTING ?auto_16187 ?auto_16185 ) ( not ( = ?auto_16177 ?auto_16185 ) ) ( HAVE_IMAGE ?auto_16184 ?auto_16183 ) ( not ( = ?auto_16184 ?auto_16177 ) ) ( not ( = ?auto_16184 ?auto_16185 ) ) ( not ( = ?auto_16183 ?auto_16178 ) ) ( HAVE_IMAGE ?auto_16180 ?auto_16179 ) ( HAVE_IMAGE ?auto_16182 ?auto_16181 ) ( not ( = ?auto_16177 ?auto_16180 ) ) ( not ( = ?auto_16177 ?auto_16182 ) ) ( not ( = ?auto_16178 ?auto_16179 ) ) ( not ( = ?auto_16178 ?auto_16181 ) ) ( not ( = ?auto_16180 ?auto_16182 ) ) ( not ( = ?auto_16180 ?auto_16185 ) ) ( not ( = ?auto_16180 ?auto_16184 ) ) ( not ( = ?auto_16179 ?auto_16181 ) ) ( not ( = ?auto_16179 ?auto_16183 ) ) ( not ( = ?auto_16182 ?auto_16185 ) ) ( not ( = ?auto_16182 ?auto_16184 ) ) ( not ( = ?auto_16181 ?auto_16183 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16184 ?auto_16183 ?auto_16177 ?auto_16178 )
      ( GET-3IMAGE-VERIFY ?auto_16177 ?auto_16178 ?auto_16180 ?auto_16179 ?auto_16182 ?auto_16181 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_16230 - DIRECTION
      ?auto_16231 - MODE
    )
    :vars
    (
      ?auto_16235 - INSTRUMENT
      ?auto_16236 - SATELLITE
      ?auto_16234 - DIRECTION
      ?auto_16233 - DIRECTION
      ?auto_16232 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_16235 ?auto_16236 ) ( SUPPORTS ?auto_16235 ?auto_16231 ) ( POWER_ON ?auto_16235 ) ( POINTING ?auto_16236 ?auto_16234 ) ( not ( = ?auto_16230 ?auto_16234 ) ) ( HAVE_IMAGE ?auto_16233 ?auto_16232 ) ( not ( = ?auto_16233 ?auto_16230 ) ) ( not ( = ?auto_16233 ?auto_16234 ) ) ( not ( = ?auto_16232 ?auto_16231 ) ) ( CALIBRATION_TARGET ?auto_16235 ?auto_16234 ) ( NOT_CALIBRATED ?auto_16235 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_16236 ?auto_16235 ?auto_16234 )
      ( GET-2IMAGE ?auto_16233 ?auto_16232 ?auto_16230 ?auto_16231 )
      ( GET-1IMAGE-VERIFY ?auto_16230 ?auto_16231 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_16237 - DIRECTION
      ?auto_16238 - MODE
      ?auto_16240 - DIRECTION
      ?auto_16239 - MODE
    )
    :vars
    (
      ?auto_16242 - INSTRUMENT
      ?auto_16243 - SATELLITE
      ?auto_16241 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16242 ?auto_16243 ) ( SUPPORTS ?auto_16242 ?auto_16239 ) ( POWER_ON ?auto_16242 ) ( POINTING ?auto_16243 ?auto_16241 ) ( not ( = ?auto_16240 ?auto_16241 ) ) ( HAVE_IMAGE ?auto_16237 ?auto_16238 ) ( not ( = ?auto_16237 ?auto_16240 ) ) ( not ( = ?auto_16237 ?auto_16241 ) ) ( not ( = ?auto_16238 ?auto_16239 ) ) ( CALIBRATION_TARGET ?auto_16242 ?auto_16241 ) ( NOT_CALIBRATED ?auto_16242 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_16240 ?auto_16239 )
      ( GET-2IMAGE-VERIFY ?auto_16237 ?auto_16238 ?auto_16240 ?auto_16239 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_16244 - DIRECTION
      ?auto_16245 - MODE
      ?auto_16247 - DIRECTION
      ?auto_16246 - MODE
    )
    :vars
    (
      ?auto_16252 - INSTRUMENT
      ?auto_16251 - SATELLITE
      ?auto_16248 - DIRECTION
      ?auto_16250 - DIRECTION
      ?auto_16249 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_16252 ?auto_16251 ) ( SUPPORTS ?auto_16252 ?auto_16246 ) ( POWER_ON ?auto_16252 ) ( POINTING ?auto_16251 ?auto_16248 ) ( not ( = ?auto_16247 ?auto_16248 ) ) ( HAVE_IMAGE ?auto_16250 ?auto_16249 ) ( not ( = ?auto_16250 ?auto_16247 ) ) ( not ( = ?auto_16250 ?auto_16248 ) ) ( not ( = ?auto_16249 ?auto_16246 ) ) ( CALIBRATION_TARGET ?auto_16252 ?auto_16248 ) ( NOT_CALIBRATED ?auto_16252 ) ( HAVE_IMAGE ?auto_16244 ?auto_16245 ) ( not ( = ?auto_16244 ?auto_16247 ) ) ( not ( = ?auto_16244 ?auto_16248 ) ) ( not ( = ?auto_16244 ?auto_16250 ) ) ( not ( = ?auto_16245 ?auto_16246 ) ) ( not ( = ?auto_16245 ?auto_16249 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16250 ?auto_16249 ?auto_16247 ?auto_16246 )
      ( GET-2IMAGE-VERIFY ?auto_16244 ?auto_16245 ?auto_16247 ?auto_16246 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_16253 - DIRECTION
      ?auto_16254 - MODE
      ?auto_16256 - DIRECTION
      ?auto_16255 - MODE
    )
    :vars
    (
      ?auto_16259 - INSTRUMENT
      ?auto_16258 - SATELLITE
      ?auto_16257 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16259 ?auto_16258 ) ( SUPPORTS ?auto_16259 ?auto_16254 ) ( POWER_ON ?auto_16259 ) ( POINTING ?auto_16258 ?auto_16257 ) ( not ( = ?auto_16253 ?auto_16257 ) ) ( HAVE_IMAGE ?auto_16256 ?auto_16255 ) ( not ( = ?auto_16256 ?auto_16253 ) ) ( not ( = ?auto_16256 ?auto_16257 ) ) ( not ( = ?auto_16255 ?auto_16254 ) ) ( CALIBRATION_TARGET ?auto_16259 ?auto_16257 ) ( NOT_CALIBRATED ?auto_16259 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16256 ?auto_16255 ?auto_16253 ?auto_16254 )
      ( GET-2IMAGE-VERIFY ?auto_16253 ?auto_16254 ?auto_16256 ?auto_16255 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_16260 - DIRECTION
      ?auto_16261 - MODE
      ?auto_16263 - DIRECTION
      ?auto_16262 - MODE
    )
    :vars
    (
      ?auto_16268 - INSTRUMENT
      ?auto_16267 - SATELLITE
      ?auto_16264 - DIRECTION
      ?auto_16266 - DIRECTION
      ?auto_16265 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_16268 ?auto_16267 ) ( SUPPORTS ?auto_16268 ?auto_16261 ) ( POWER_ON ?auto_16268 ) ( POINTING ?auto_16267 ?auto_16264 ) ( not ( = ?auto_16260 ?auto_16264 ) ) ( HAVE_IMAGE ?auto_16266 ?auto_16265 ) ( not ( = ?auto_16266 ?auto_16260 ) ) ( not ( = ?auto_16266 ?auto_16264 ) ) ( not ( = ?auto_16265 ?auto_16261 ) ) ( CALIBRATION_TARGET ?auto_16268 ?auto_16264 ) ( NOT_CALIBRATED ?auto_16268 ) ( HAVE_IMAGE ?auto_16263 ?auto_16262 ) ( not ( = ?auto_16260 ?auto_16263 ) ) ( not ( = ?auto_16261 ?auto_16262 ) ) ( not ( = ?auto_16263 ?auto_16264 ) ) ( not ( = ?auto_16263 ?auto_16266 ) ) ( not ( = ?auto_16262 ?auto_16265 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16266 ?auto_16265 ?auto_16260 ?auto_16261 )
      ( GET-2IMAGE-VERIFY ?auto_16260 ?auto_16261 ?auto_16263 ?auto_16262 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16278 - DIRECTION
      ?auto_16279 - MODE
      ?auto_16281 - DIRECTION
      ?auto_16280 - MODE
      ?auto_16283 - DIRECTION
      ?auto_16282 - MODE
    )
    :vars
    (
      ?auto_16286 - INSTRUMENT
      ?auto_16285 - SATELLITE
      ?auto_16284 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16286 ?auto_16285 ) ( SUPPORTS ?auto_16286 ?auto_16282 ) ( POWER_ON ?auto_16286 ) ( POINTING ?auto_16285 ?auto_16284 ) ( not ( = ?auto_16283 ?auto_16284 ) ) ( HAVE_IMAGE ?auto_16281 ?auto_16279 ) ( not ( = ?auto_16281 ?auto_16283 ) ) ( not ( = ?auto_16281 ?auto_16284 ) ) ( not ( = ?auto_16279 ?auto_16282 ) ) ( CALIBRATION_TARGET ?auto_16286 ?auto_16284 ) ( NOT_CALIBRATED ?auto_16286 ) ( HAVE_IMAGE ?auto_16278 ?auto_16279 ) ( HAVE_IMAGE ?auto_16281 ?auto_16280 ) ( not ( = ?auto_16278 ?auto_16281 ) ) ( not ( = ?auto_16278 ?auto_16283 ) ) ( not ( = ?auto_16278 ?auto_16284 ) ) ( not ( = ?auto_16279 ?auto_16280 ) ) ( not ( = ?auto_16280 ?auto_16282 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16281 ?auto_16279 ?auto_16283 ?auto_16282 )
      ( GET-3IMAGE-VERIFY ?auto_16278 ?auto_16279 ?auto_16281 ?auto_16280 ?auto_16283 ?auto_16282 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16287 - DIRECTION
      ?auto_16288 - MODE
      ?auto_16290 - DIRECTION
      ?auto_16289 - MODE
      ?auto_16292 - DIRECTION
      ?auto_16291 - MODE
    )
    :vars
    (
      ?auto_16295 - INSTRUMENT
      ?auto_16294 - SATELLITE
      ?auto_16293 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16295 ?auto_16294 ) ( SUPPORTS ?auto_16295 ?auto_16291 ) ( POWER_ON ?auto_16295 ) ( POINTING ?auto_16294 ?auto_16293 ) ( not ( = ?auto_16292 ?auto_16293 ) ) ( HAVE_IMAGE ?auto_16287 ?auto_16288 ) ( not ( = ?auto_16287 ?auto_16292 ) ) ( not ( = ?auto_16287 ?auto_16293 ) ) ( not ( = ?auto_16288 ?auto_16291 ) ) ( CALIBRATION_TARGET ?auto_16295 ?auto_16293 ) ( NOT_CALIBRATED ?auto_16295 ) ( HAVE_IMAGE ?auto_16290 ?auto_16289 ) ( not ( = ?auto_16287 ?auto_16290 ) ) ( not ( = ?auto_16288 ?auto_16289 ) ) ( not ( = ?auto_16290 ?auto_16292 ) ) ( not ( = ?auto_16290 ?auto_16293 ) ) ( not ( = ?auto_16289 ?auto_16291 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16287 ?auto_16288 ?auto_16292 ?auto_16291 )
      ( GET-3IMAGE-VERIFY ?auto_16287 ?auto_16288 ?auto_16290 ?auto_16289 ?auto_16292 ?auto_16291 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16296 - DIRECTION
      ?auto_16297 - MODE
      ?auto_16299 - DIRECTION
      ?auto_16298 - MODE
      ?auto_16301 - DIRECTION
      ?auto_16300 - MODE
    )
    :vars
    (
      ?auto_16304 - INSTRUMENT
      ?auto_16303 - SATELLITE
      ?auto_16302 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16304 ?auto_16303 ) ( SUPPORTS ?auto_16304 ?auto_16298 ) ( POWER_ON ?auto_16304 ) ( POINTING ?auto_16303 ?auto_16302 ) ( not ( = ?auto_16299 ?auto_16302 ) ) ( HAVE_IMAGE ?auto_16301 ?auto_16300 ) ( not ( = ?auto_16301 ?auto_16299 ) ) ( not ( = ?auto_16301 ?auto_16302 ) ) ( not ( = ?auto_16300 ?auto_16298 ) ) ( CALIBRATION_TARGET ?auto_16304 ?auto_16302 ) ( NOT_CALIBRATED ?auto_16304 ) ( HAVE_IMAGE ?auto_16296 ?auto_16297 ) ( not ( = ?auto_16296 ?auto_16299 ) ) ( not ( = ?auto_16296 ?auto_16301 ) ) ( not ( = ?auto_16296 ?auto_16302 ) ) ( not ( = ?auto_16297 ?auto_16298 ) ) ( not ( = ?auto_16297 ?auto_16300 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16301 ?auto_16300 ?auto_16299 ?auto_16298 )
      ( GET-3IMAGE-VERIFY ?auto_16296 ?auto_16297 ?auto_16299 ?auto_16298 ?auto_16301 ?auto_16300 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16305 - DIRECTION
      ?auto_16306 - MODE
      ?auto_16308 - DIRECTION
      ?auto_16307 - MODE
      ?auto_16310 - DIRECTION
      ?auto_16309 - MODE
    )
    :vars
    (
      ?auto_16313 - INSTRUMENT
      ?auto_16312 - SATELLITE
      ?auto_16311 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16313 ?auto_16312 ) ( SUPPORTS ?auto_16313 ?auto_16307 ) ( POWER_ON ?auto_16313 ) ( POINTING ?auto_16312 ?auto_16311 ) ( not ( = ?auto_16308 ?auto_16311 ) ) ( HAVE_IMAGE ?auto_16305 ?auto_16306 ) ( not ( = ?auto_16305 ?auto_16308 ) ) ( not ( = ?auto_16305 ?auto_16311 ) ) ( not ( = ?auto_16306 ?auto_16307 ) ) ( CALIBRATION_TARGET ?auto_16313 ?auto_16311 ) ( NOT_CALIBRATED ?auto_16313 ) ( HAVE_IMAGE ?auto_16310 ?auto_16309 ) ( not ( = ?auto_16305 ?auto_16310 ) ) ( not ( = ?auto_16306 ?auto_16309 ) ) ( not ( = ?auto_16308 ?auto_16310 ) ) ( not ( = ?auto_16307 ?auto_16309 ) ) ( not ( = ?auto_16310 ?auto_16311 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16305 ?auto_16306 ?auto_16308 ?auto_16307 )
      ( GET-3IMAGE-VERIFY ?auto_16305 ?auto_16306 ?auto_16308 ?auto_16307 ?auto_16310 ?auto_16309 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16323 - DIRECTION
      ?auto_16324 - MODE
      ?auto_16326 - DIRECTION
      ?auto_16325 - MODE
      ?auto_16328 - DIRECTION
      ?auto_16327 - MODE
    )
    :vars
    (
      ?auto_16331 - INSTRUMENT
      ?auto_16330 - SATELLITE
      ?auto_16329 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16331 ?auto_16330 ) ( SUPPORTS ?auto_16331 ?auto_16327 ) ( POWER_ON ?auto_16331 ) ( POINTING ?auto_16330 ?auto_16329 ) ( not ( = ?auto_16328 ?auto_16329 ) ) ( HAVE_IMAGE ?auto_16326 ?auto_16325 ) ( not ( = ?auto_16326 ?auto_16328 ) ) ( not ( = ?auto_16326 ?auto_16329 ) ) ( not ( = ?auto_16325 ?auto_16327 ) ) ( CALIBRATION_TARGET ?auto_16331 ?auto_16329 ) ( NOT_CALIBRATED ?auto_16331 ) ( HAVE_IMAGE ?auto_16323 ?auto_16324 ) ( not ( = ?auto_16323 ?auto_16326 ) ) ( not ( = ?auto_16323 ?auto_16328 ) ) ( not ( = ?auto_16323 ?auto_16329 ) ) ( not ( = ?auto_16324 ?auto_16325 ) ) ( not ( = ?auto_16324 ?auto_16327 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16326 ?auto_16325 ?auto_16328 ?auto_16327 )
      ( GET-3IMAGE-VERIFY ?auto_16323 ?auto_16324 ?auto_16326 ?auto_16325 ?auto_16328 ?auto_16327 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16332 - DIRECTION
      ?auto_16333 - MODE
      ?auto_16335 - DIRECTION
      ?auto_16334 - MODE
      ?auto_16337 - DIRECTION
      ?auto_16336 - MODE
    )
    :vars
    (
      ?auto_16342 - INSTRUMENT
      ?auto_16341 - SATELLITE
      ?auto_16338 - DIRECTION
      ?auto_16340 - DIRECTION
      ?auto_16339 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_16342 ?auto_16341 ) ( SUPPORTS ?auto_16342 ?auto_16336 ) ( POWER_ON ?auto_16342 ) ( POINTING ?auto_16341 ?auto_16338 ) ( not ( = ?auto_16337 ?auto_16338 ) ) ( HAVE_IMAGE ?auto_16340 ?auto_16339 ) ( not ( = ?auto_16340 ?auto_16337 ) ) ( not ( = ?auto_16340 ?auto_16338 ) ) ( not ( = ?auto_16339 ?auto_16336 ) ) ( CALIBRATION_TARGET ?auto_16342 ?auto_16338 ) ( NOT_CALIBRATED ?auto_16342 ) ( HAVE_IMAGE ?auto_16332 ?auto_16333 ) ( HAVE_IMAGE ?auto_16335 ?auto_16334 ) ( not ( = ?auto_16332 ?auto_16335 ) ) ( not ( = ?auto_16332 ?auto_16337 ) ) ( not ( = ?auto_16332 ?auto_16338 ) ) ( not ( = ?auto_16332 ?auto_16340 ) ) ( not ( = ?auto_16333 ?auto_16334 ) ) ( not ( = ?auto_16333 ?auto_16336 ) ) ( not ( = ?auto_16333 ?auto_16339 ) ) ( not ( = ?auto_16335 ?auto_16337 ) ) ( not ( = ?auto_16335 ?auto_16338 ) ) ( not ( = ?auto_16335 ?auto_16340 ) ) ( not ( = ?auto_16334 ?auto_16336 ) ) ( not ( = ?auto_16334 ?auto_16339 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16340 ?auto_16339 ?auto_16337 ?auto_16336 )
      ( GET-3IMAGE-VERIFY ?auto_16332 ?auto_16333 ?auto_16335 ?auto_16334 ?auto_16337 ?auto_16336 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16343 - DIRECTION
      ?auto_16344 - MODE
      ?auto_16346 - DIRECTION
      ?auto_16345 - MODE
      ?auto_16348 - DIRECTION
      ?auto_16347 - MODE
    )
    :vars
    (
      ?auto_16351 - INSTRUMENT
      ?auto_16350 - SATELLITE
      ?auto_16349 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16351 ?auto_16350 ) ( SUPPORTS ?auto_16351 ?auto_16345 ) ( POWER_ON ?auto_16351 ) ( POINTING ?auto_16350 ?auto_16349 ) ( not ( = ?auto_16346 ?auto_16349 ) ) ( HAVE_IMAGE ?auto_16348 ?auto_16347 ) ( not ( = ?auto_16348 ?auto_16346 ) ) ( not ( = ?auto_16348 ?auto_16349 ) ) ( not ( = ?auto_16347 ?auto_16345 ) ) ( CALIBRATION_TARGET ?auto_16351 ?auto_16349 ) ( NOT_CALIBRATED ?auto_16351 ) ( HAVE_IMAGE ?auto_16343 ?auto_16344 ) ( not ( = ?auto_16343 ?auto_16346 ) ) ( not ( = ?auto_16343 ?auto_16348 ) ) ( not ( = ?auto_16343 ?auto_16349 ) ) ( not ( = ?auto_16344 ?auto_16345 ) ) ( not ( = ?auto_16344 ?auto_16347 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16348 ?auto_16347 ?auto_16346 ?auto_16345 )
      ( GET-3IMAGE-VERIFY ?auto_16343 ?auto_16344 ?auto_16346 ?auto_16345 ?auto_16348 ?auto_16347 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16352 - DIRECTION
      ?auto_16353 - MODE
      ?auto_16355 - DIRECTION
      ?auto_16354 - MODE
      ?auto_16357 - DIRECTION
      ?auto_16356 - MODE
    )
    :vars
    (
      ?auto_16362 - INSTRUMENT
      ?auto_16361 - SATELLITE
      ?auto_16358 - DIRECTION
      ?auto_16360 - DIRECTION
      ?auto_16359 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_16362 ?auto_16361 ) ( SUPPORTS ?auto_16362 ?auto_16354 ) ( POWER_ON ?auto_16362 ) ( POINTING ?auto_16361 ?auto_16358 ) ( not ( = ?auto_16355 ?auto_16358 ) ) ( HAVE_IMAGE ?auto_16360 ?auto_16359 ) ( not ( = ?auto_16360 ?auto_16355 ) ) ( not ( = ?auto_16360 ?auto_16358 ) ) ( not ( = ?auto_16359 ?auto_16354 ) ) ( CALIBRATION_TARGET ?auto_16362 ?auto_16358 ) ( NOT_CALIBRATED ?auto_16362 ) ( HAVE_IMAGE ?auto_16352 ?auto_16353 ) ( HAVE_IMAGE ?auto_16357 ?auto_16356 ) ( not ( = ?auto_16352 ?auto_16355 ) ) ( not ( = ?auto_16352 ?auto_16357 ) ) ( not ( = ?auto_16352 ?auto_16358 ) ) ( not ( = ?auto_16352 ?auto_16360 ) ) ( not ( = ?auto_16353 ?auto_16354 ) ) ( not ( = ?auto_16353 ?auto_16356 ) ) ( not ( = ?auto_16353 ?auto_16359 ) ) ( not ( = ?auto_16355 ?auto_16357 ) ) ( not ( = ?auto_16354 ?auto_16356 ) ) ( not ( = ?auto_16357 ?auto_16358 ) ) ( not ( = ?auto_16357 ?auto_16360 ) ) ( not ( = ?auto_16356 ?auto_16359 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16360 ?auto_16359 ?auto_16355 ?auto_16354 )
      ( GET-3IMAGE-VERIFY ?auto_16352 ?auto_16353 ?auto_16355 ?auto_16354 ?auto_16357 ?auto_16356 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16374 - DIRECTION
      ?auto_16375 - MODE
      ?auto_16377 - DIRECTION
      ?auto_16376 - MODE
      ?auto_16379 - DIRECTION
      ?auto_16378 - MODE
    )
    :vars
    (
      ?auto_16382 - INSTRUMENT
      ?auto_16381 - SATELLITE
      ?auto_16380 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16382 ?auto_16381 ) ( SUPPORTS ?auto_16382 ?auto_16375 ) ( POWER_ON ?auto_16382 ) ( POINTING ?auto_16381 ?auto_16380 ) ( not ( = ?auto_16374 ?auto_16380 ) ) ( HAVE_IMAGE ?auto_16379 ?auto_16378 ) ( not ( = ?auto_16379 ?auto_16374 ) ) ( not ( = ?auto_16379 ?auto_16380 ) ) ( not ( = ?auto_16378 ?auto_16375 ) ) ( CALIBRATION_TARGET ?auto_16382 ?auto_16380 ) ( NOT_CALIBRATED ?auto_16382 ) ( HAVE_IMAGE ?auto_16377 ?auto_16376 ) ( not ( = ?auto_16374 ?auto_16377 ) ) ( not ( = ?auto_16375 ?auto_16376 ) ) ( not ( = ?auto_16377 ?auto_16379 ) ) ( not ( = ?auto_16377 ?auto_16380 ) ) ( not ( = ?auto_16376 ?auto_16378 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16379 ?auto_16378 ?auto_16374 ?auto_16375 )
      ( GET-3IMAGE-VERIFY ?auto_16374 ?auto_16375 ?auto_16377 ?auto_16376 ?auto_16379 ?auto_16378 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16383 - DIRECTION
      ?auto_16384 - MODE
      ?auto_16386 - DIRECTION
      ?auto_16385 - MODE
      ?auto_16388 - DIRECTION
      ?auto_16387 - MODE
    )
    :vars
    (
      ?auto_16391 - INSTRUMENT
      ?auto_16390 - SATELLITE
      ?auto_16389 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16391 ?auto_16390 ) ( SUPPORTS ?auto_16391 ?auto_16384 ) ( POWER_ON ?auto_16391 ) ( POINTING ?auto_16390 ?auto_16389 ) ( not ( = ?auto_16383 ?auto_16389 ) ) ( HAVE_IMAGE ?auto_16386 ?auto_16385 ) ( not ( = ?auto_16386 ?auto_16383 ) ) ( not ( = ?auto_16386 ?auto_16389 ) ) ( not ( = ?auto_16385 ?auto_16384 ) ) ( CALIBRATION_TARGET ?auto_16391 ?auto_16389 ) ( NOT_CALIBRATED ?auto_16391 ) ( HAVE_IMAGE ?auto_16388 ?auto_16387 ) ( not ( = ?auto_16383 ?auto_16388 ) ) ( not ( = ?auto_16384 ?auto_16387 ) ) ( not ( = ?auto_16386 ?auto_16388 ) ) ( not ( = ?auto_16385 ?auto_16387 ) ) ( not ( = ?auto_16388 ?auto_16389 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16386 ?auto_16385 ?auto_16383 ?auto_16384 )
      ( GET-3IMAGE-VERIFY ?auto_16383 ?auto_16384 ?auto_16386 ?auto_16385 ?auto_16388 ?auto_16387 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16401 - DIRECTION
      ?auto_16402 - MODE
      ?auto_16404 - DIRECTION
      ?auto_16403 - MODE
      ?auto_16406 - DIRECTION
      ?auto_16405 - MODE
    )
    :vars
    (
      ?auto_16409 - INSTRUMENT
      ?auto_16408 - SATELLITE
      ?auto_16407 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16409 ?auto_16408 ) ( SUPPORTS ?auto_16409 ?auto_16402 ) ( POWER_ON ?auto_16409 ) ( POINTING ?auto_16408 ?auto_16407 ) ( not ( = ?auto_16401 ?auto_16407 ) ) ( HAVE_IMAGE ?auto_16406 ?auto_16405 ) ( not ( = ?auto_16406 ?auto_16401 ) ) ( not ( = ?auto_16406 ?auto_16407 ) ) ( not ( = ?auto_16405 ?auto_16402 ) ) ( CALIBRATION_TARGET ?auto_16409 ?auto_16407 ) ( NOT_CALIBRATED ?auto_16409 ) ( HAVE_IMAGE ?auto_16404 ?auto_16403 ) ( not ( = ?auto_16401 ?auto_16404 ) ) ( not ( = ?auto_16402 ?auto_16403 ) ) ( not ( = ?auto_16404 ?auto_16406 ) ) ( not ( = ?auto_16404 ?auto_16407 ) ) ( not ( = ?auto_16403 ?auto_16405 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16406 ?auto_16405 ?auto_16401 ?auto_16402 )
      ( GET-3IMAGE-VERIFY ?auto_16401 ?auto_16402 ?auto_16404 ?auto_16403 ?auto_16406 ?auto_16405 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16410 - DIRECTION
      ?auto_16411 - MODE
      ?auto_16413 - DIRECTION
      ?auto_16412 - MODE
      ?auto_16415 - DIRECTION
      ?auto_16414 - MODE
    )
    :vars
    (
      ?auto_16420 - INSTRUMENT
      ?auto_16419 - SATELLITE
      ?auto_16416 - DIRECTION
      ?auto_16418 - DIRECTION
      ?auto_16417 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_16420 ?auto_16419 ) ( SUPPORTS ?auto_16420 ?auto_16411 ) ( POWER_ON ?auto_16420 ) ( POINTING ?auto_16419 ?auto_16416 ) ( not ( = ?auto_16410 ?auto_16416 ) ) ( HAVE_IMAGE ?auto_16418 ?auto_16417 ) ( not ( = ?auto_16418 ?auto_16410 ) ) ( not ( = ?auto_16418 ?auto_16416 ) ) ( not ( = ?auto_16417 ?auto_16411 ) ) ( CALIBRATION_TARGET ?auto_16420 ?auto_16416 ) ( NOT_CALIBRATED ?auto_16420 ) ( HAVE_IMAGE ?auto_16413 ?auto_16412 ) ( HAVE_IMAGE ?auto_16415 ?auto_16414 ) ( not ( = ?auto_16410 ?auto_16413 ) ) ( not ( = ?auto_16410 ?auto_16415 ) ) ( not ( = ?auto_16411 ?auto_16412 ) ) ( not ( = ?auto_16411 ?auto_16414 ) ) ( not ( = ?auto_16413 ?auto_16415 ) ) ( not ( = ?auto_16413 ?auto_16416 ) ) ( not ( = ?auto_16413 ?auto_16418 ) ) ( not ( = ?auto_16412 ?auto_16414 ) ) ( not ( = ?auto_16412 ?auto_16417 ) ) ( not ( = ?auto_16415 ?auto_16416 ) ) ( not ( = ?auto_16415 ?auto_16418 ) ) ( not ( = ?auto_16414 ?auto_16417 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16418 ?auto_16417 ?auto_16410 ?auto_16411 )
      ( GET-3IMAGE-VERIFY ?auto_16410 ?auto_16411 ?auto_16413 ?auto_16412 ?auto_16415 ?auto_16414 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_16463 - DIRECTION
      ?auto_16464 - MODE
    )
    :vars
    (
      ?auto_16469 - INSTRUMENT
      ?auto_16468 - SATELLITE
      ?auto_16465 - DIRECTION
      ?auto_16467 - DIRECTION
      ?auto_16466 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_16469 ?auto_16468 ) ( SUPPORTS ?auto_16469 ?auto_16464 ) ( POINTING ?auto_16468 ?auto_16465 ) ( not ( = ?auto_16463 ?auto_16465 ) ) ( HAVE_IMAGE ?auto_16467 ?auto_16466 ) ( not ( = ?auto_16467 ?auto_16463 ) ) ( not ( = ?auto_16467 ?auto_16465 ) ) ( not ( = ?auto_16466 ?auto_16464 ) ) ( CALIBRATION_TARGET ?auto_16469 ?auto_16465 ) ( POWER_AVAIL ?auto_16468 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_16469 ?auto_16468 )
      ( GET-2IMAGE ?auto_16467 ?auto_16466 ?auto_16463 ?auto_16464 )
      ( GET-1IMAGE-VERIFY ?auto_16463 ?auto_16464 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_16470 - DIRECTION
      ?auto_16471 - MODE
      ?auto_16473 - DIRECTION
      ?auto_16472 - MODE
    )
    :vars
    (
      ?auto_16474 - INSTRUMENT
      ?auto_16475 - SATELLITE
      ?auto_16476 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16474 ?auto_16475 ) ( SUPPORTS ?auto_16474 ?auto_16472 ) ( POINTING ?auto_16475 ?auto_16476 ) ( not ( = ?auto_16473 ?auto_16476 ) ) ( HAVE_IMAGE ?auto_16470 ?auto_16471 ) ( not ( = ?auto_16470 ?auto_16473 ) ) ( not ( = ?auto_16470 ?auto_16476 ) ) ( not ( = ?auto_16471 ?auto_16472 ) ) ( CALIBRATION_TARGET ?auto_16474 ?auto_16476 ) ( POWER_AVAIL ?auto_16475 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_16473 ?auto_16472 )
      ( GET-2IMAGE-VERIFY ?auto_16470 ?auto_16471 ?auto_16473 ?auto_16472 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_16477 - DIRECTION
      ?auto_16478 - MODE
      ?auto_16480 - DIRECTION
      ?auto_16479 - MODE
    )
    :vars
    (
      ?auto_16484 - INSTRUMENT
      ?auto_16483 - SATELLITE
      ?auto_16485 - DIRECTION
      ?auto_16482 - DIRECTION
      ?auto_16481 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_16484 ?auto_16483 ) ( SUPPORTS ?auto_16484 ?auto_16479 ) ( POINTING ?auto_16483 ?auto_16485 ) ( not ( = ?auto_16480 ?auto_16485 ) ) ( HAVE_IMAGE ?auto_16482 ?auto_16481 ) ( not ( = ?auto_16482 ?auto_16480 ) ) ( not ( = ?auto_16482 ?auto_16485 ) ) ( not ( = ?auto_16481 ?auto_16479 ) ) ( CALIBRATION_TARGET ?auto_16484 ?auto_16485 ) ( POWER_AVAIL ?auto_16483 ) ( HAVE_IMAGE ?auto_16477 ?auto_16478 ) ( not ( = ?auto_16477 ?auto_16480 ) ) ( not ( = ?auto_16477 ?auto_16485 ) ) ( not ( = ?auto_16477 ?auto_16482 ) ) ( not ( = ?auto_16478 ?auto_16479 ) ) ( not ( = ?auto_16478 ?auto_16481 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16482 ?auto_16481 ?auto_16480 ?auto_16479 )
      ( GET-2IMAGE-VERIFY ?auto_16477 ?auto_16478 ?auto_16480 ?auto_16479 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_16486 - DIRECTION
      ?auto_16487 - MODE
      ?auto_16489 - DIRECTION
      ?auto_16488 - MODE
    )
    :vars
    (
      ?auto_16491 - INSTRUMENT
      ?auto_16490 - SATELLITE
      ?auto_16492 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16491 ?auto_16490 ) ( SUPPORTS ?auto_16491 ?auto_16487 ) ( POINTING ?auto_16490 ?auto_16492 ) ( not ( = ?auto_16486 ?auto_16492 ) ) ( HAVE_IMAGE ?auto_16489 ?auto_16488 ) ( not ( = ?auto_16489 ?auto_16486 ) ) ( not ( = ?auto_16489 ?auto_16492 ) ) ( not ( = ?auto_16488 ?auto_16487 ) ) ( CALIBRATION_TARGET ?auto_16491 ?auto_16492 ) ( POWER_AVAIL ?auto_16490 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16489 ?auto_16488 ?auto_16486 ?auto_16487 )
      ( GET-2IMAGE-VERIFY ?auto_16486 ?auto_16487 ?auto_16489 ?auto_16488 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_16493 - DIRECTION
      ?auto_16494 - MODE
      ?auto_16496 - DIRECTION
      ?auto_16495 - MODE
    )
    :vars
    (
      ?auto_16500 - INSTRUMENT
      ?auto_16499 - SATELLITE
      ?auto_16501 - DIRECTION
      ?auto_16498 - DIRECTION
      ?auto_16497 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_16500 ?auto_16499 ) ( SUPPORTS ?auto_16500 ?auto_16494 ) ( POINTING ?auto_16499 ?auto_16501 ) ( not ( = ?auto_16493 ?auto_16501 ) ) ( HAVE_IMAGE ?auto_16498 ?auto_16497 ) ( not ( = ?auto_16498 ?auto_16493 ) ) ( not ( = ?auto_16498 ?auto_16501 ) ) ( not ( = ?auto_16497 ?auto_16494 ) ) ( CALIBRATION_TARGET ?auto_16500 ?auto_16501 ) ( POWER_AVAIL ?auto_16499 ) ( HAVE_IMAGE ?auto_16496 ?auto_16495 ) ( not ( = ?auto_16493 ?auto_16496 ) ) ( not ( = ?auto_16494 ?auto_16495 ) ) ( not ( = ?auto_16496 ?auto_16501 ) ) ( not ( = ?auto_16496 ?auto_16498 ) ) ( not ( = ?auto_16495 ?auto_16497 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16498 ?auto_16497 ?auto_16493 ?auto_16494 )
      ( GET-2IMAGE-VERIFY ?auto_16493 ?auto_16494 ?auto_16496 ?auto_16495 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16511 - DIRECTION
      ?auto_16512 - MODE
      ?auto_16514 - DIRECTION
      ?auto_16513 - MODE
      ?auto_16516 - DIRECTION
      ?auto_16515 - MODE
    )
    :vars
    (
      ?auto_16518 - INSTRUMENT
      ?auto_16517 - SATELLITE
      ?auto_16519 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16518 ?auto_16517 ) ( SUPPORTS ?auto_16518 ?auto_16515 ) ( POINTING ?auto_16517 ?auto_16519 ) ( not ( = ?auto_16516 ?auto_16519 ) ) ( HAVE_IMAGE ?auto_16511 ?auto_16512 ) ( not ( = ?auto_16511 ?auto_16516 ) ) ( not ( = ?auto_16511 ?auto_16519 ) ) ( not ( = ?auto_16512 ?auto_16515 ) ) ( CALIBRATION_TARGET ?auto_16518 ?auto_16519 ) ( POWER_AVAIL ?auto_16517 ) ( HAVE_IMAGE ?auto_16514 ?auto_16513 ) ( not ( = ?auto_16511 ?auto_16514 ) ) ( not ( = ?auto_16512 ?auto_16513 ) ) ( not ( = ?auto_16514 ?auto_16516 ) ) ( not ( = ?auto_16514 ?auto_16519 ) ) ( not ( = ?auto_16513 ?auto_16515 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16511 ?auto_16512 ?auto_16516 ?auto_16515 )
      ( GET-3IMAGE-VERIFY ?auto_16511 ?auto_16512 ?auto_16514 ?auto_16513 ?auto_16516 ?auto_16515 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16520 - DIRECTION
      ?auto_16521 - MODE
      ?auto_16523 - DIRECTION
      ?auto_16522 - MODE
      ?auto_16525 - DIRECTION
      ?auto_16524 - MODE
    )
    :vars
    (
      ?auto_16527 - INSTRUMENT
      ?auto_16526 - SATELLITE
      ?auto_16528 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16527 ?auto_16526 ) ( SUPPORTS ?auto_16527 ?auto_16524 ) ( POINTING ?auto_16526 ?auto_16528 ) ( not ( = ?auto_16525 ?auto_16528 ) ) ( HAVE_IMAGE ?auto_16520 ?auto_16521 ) ( not ( = ?auto_16520 ?auto_16525 ) ) ( not ( = ?auto_16520 ?auto_16528 ) ) ( not ( = ?auto_16521 ?auto_16524 ) ) ( CALIBRATION_TARGET ?auto_16527 ?auto_16528 ) ( POWER_AVAIL ?auto_16526 ) ( HAVE_IMAGE ?auto_16523 ?auto_16522 ) ( not ( = ?auto_16520 ?auto_16523 ) ) ( not ( = ?auto_16521 ?auto_16522 ) ) ( not ( = ?auto_16523 ?auto_16525 ) ) ( not ( = ?auto_16523 ?auto_16528 ) ) ( not ( = ?auto_16522 ?auto_16524 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16520 ?auto_16521 ?auto_16525 ?auto_16524 )
      ( GET-3IMAGE-VERIFY ?auto_16520 ?auto_16521 ?auto_16523 ?auto_16522 ?auto_16525 ?auto_16524 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16529 - DIRECTION
      ?auto_16530 - MODE
      ?auto_16532 - DIRECTION
      ?auto_16531 - MODE
      ?auto_16534 - DIRECTION
      ?auto_16533 - MODE
    )
    :vars
    (
      ?auto_16536 - INSTRUMENT
      ?auto_16535 - SATELLITE
      ?auto_16537 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16536 ?auto_16535 ) ( SUPPORTS ?auto_16536 ?auto_16531 ) ( POINTING ?auto_16535 ?auto_16537 ) ( not ( = ?auto_16532 ?auto_16537 ) ) ( HAVE_IMAGE ?auto_16534 ?auto_16533 ) ( not ( = ?auto_16534 ?auto_16532 ) ) ( not ( = ?auto_16534 ?auto_16537 ) ) ( not ( = ?auto_16533 ?auto_16531 ) ) ( CALIBRATION_TARGET ?auto_16536 ?auto_16537 ) ( POWER_AVAIL ?auto_16535 ) ( HAVE_IMAGE ?auto_16529 ?auto_16530 ) ( not ( = ?auto_16529 ?auto_16532 ) ) ( not ( = ?auto_16529 ?auto_16534 ) ) ( not ( = ?auto_16529 ?auto_16537 ) ) ( not ( = ?auto_16530 ?auto_16531 ) ) ( not ( = ?auto_16530 ?auto_16533 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16534 ?auto_16533 ?auto_16532 ?auto_16531 )
      ( GET-3IMAGE-VERIFY ?auto_16529 ?auto_16530 ?auto_16532 ?auto_16531 ?auto_16534 ?auto_16533 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16538 - DIRECTION
      ?auto_16539 - MODE
      ?auto_16541 - DIRECTION
      ?auto_16540 - MODE
      ?auto_16543 - DIRECTION
      ?auto_16542 - MODE
    )
    :vars
    (
      ?auto_16545 - INSTRUMENT
      ?auto_16544 - SATELLITE
      ?auto_16546 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16545 ?auto_16544 ) ( SUPPORTS ?auto_16545 ?auto_16540 ) ( POINTING ?auto_16544 ?auto_16546 ) ( not ( = ?auto_16541 ?auto_16546 ) ) ( HAVE_IMAGE ?auto_16538 ?auto_16539 ) ( not ( = ?auto_16538 ?auto_16541 ) ) ( not ( = ?auto_16538 ?auto_16546 ) ) ( not ( = ?auto_16539 ?auto_16540 ) ) ( CALIBRATION_TARGET ?auto_16545 ?auto_16546 ) ( POWER_AVAIL ?auto_16544 ) ( HAVE_IMAGE ?auto_16543 ?auto_16542 ) ( not ( = ?auto_16538 ?auto_16543 ) ) ( not ( = ?auto_16539 ?auto_16542 ) ) ( not ( = ?auto_16541 ?auto_16543 ) ) ( not ( = ?auto_16540 ?auto_16542 ) ) ( not ( = ?auto_16543 ?auto_16546 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16538 ?auto_16539 ?auto_16541 ?auto_16540 )
      ( GET-3IMAGE-VERIFY ?auto_16538 ?auto_16539 ?auto_16541 ?auto_16540 ?auto_16543 ?auto_16542 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16556 - DIRECTION
      ?auto_16557 - MODE
      ?auto_16559 - DIRECTION
      ?auto_16558 - MODE
      ?auto_16561 - DIRECTION
      ?auto_16560 - MODE
    )
    :vars
    (
      ?auto_16563 - INSTRUMENT
      ?auto_16562 - SATELLITE
      ?auto_16564 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16563 ?auto_16562 ) ( SUPPORTS ?auto_16563 ?auto_16560 ) ( POINTING ?auto_16562 ?auto_16564 ) ( not ( = ?auto_16561 ?auto_16564 ) ) ( HAVE_IMAGE ?auto_16559 ?auto_16558 ) ( not ( = ?auto_16559 ?auto_16561 ) ) ( not ( = ?auto_16559 ?auto_16564 ) ) ( not ( = ?auto_16558 ?auto_16560 ) ) ( CALIBRATION_TARGET ?auto_16563 ?auto_16564 ) ( POWER_AVAIL ?auto_16562 ) ( HAVE_IMAGE ?auto_16556 ?auto_16557 ) ( not ( = ?auto_16556 ?auto_16559 ) ) ( not ( = ?auto_16556 ?auto_16561 ) ) ( not ( = ?auto_16556 ?auto_16564 ) ) ( not ( = ?auto_16557 ?auto_16558 ) ) ( not ( = ?auto_16557 ?auto_16560 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16559 ?auto_16558 ?auto_16561 ?auto_16560 )
      ( GET-3IMAGE-VERIFY ?auto_16556 ?auto_16557 ?auto_16559 ?auto_16558 ?auto_16561 ?auto_16560 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16565 - DIRECTION
      ?auto_16566 - MODE
      ?auto_16568 - DIRECTION
      ?auto_16567 - MODE
      ?auto_16570 - DIRECTION
      ?auto_16569 - MODE
    )
    :vars
    (
      ?auto_16574 - INSTRUMENT
      ?auto_16573 - SATELLITE
      ?auto_16575 - DIRECTION
      ?auto_16572 - DIRECTION
      ?auto_16571 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_16574 ?auto_16573 ) ( SUPPORTS ?auto_16574 ?auto_16569 ) ( POINTING ?auto_16573 ?auto_16575 ) ( not ( = ?auto_16570 ?auto_16575 ) ) ( HAVE_IMAGE ?auto_16572 ?auto_16571 ) ( not ( = ?auto_16572 ?auto_16570 ) ) ( not ( = ?auto_16572 ?auto_16575 ) ) ( not ( = ?auto_16571 ?auto_16569 ) ) ( CALIBRATION_TARGET ?auto_16574 ?auto_16575 ) ( POWER_AVAIL ?auto_16573 ) ( HAVE_IMAGE ?auto_16565 ?auto_16566 ) ( HAVE_IMAGE ?auto_16568 ?auto_16567 ) ( not ( = ?auto_16565 ?auto_16568 ) ) ( not ( = ?auto_16565 ?auto_16570 ) ) ( not ( = ?auto_16565 ?auto_16575 ) ) ( not ( = ?auto_16565 ?auto_16572 ) ) ( not ( = ?auto_16566 ?auto_16567 ) ) ( not ( = ?auto_16566 ?auto_16569 ) ) ( not ( = ?auto_16566 ?auto_16571 ) ) ( not ( = ?auto_16568 ?auto_16570 ) ) ( not ( = ?auto_16568 ?auto_16575 ) ) ( not ( = ?auto_16568 ?auto_16572 ) ) ( not ( = ?auto_16567 ?auto_16569 ) ) ( not ( = ?auto_16567 ?auto_16571 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16572 ?auto_16571 ?auto_16570 ?auto_16569 )
      ( GET-3IMAGE-VERIFY ?auto_16565 ?auto_16566 ?auto_16568 ?auto_16567 ?auto_16570 ?auto_16569 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16576 - DIRECTION
      ?auto_16577 - MODE
      ?auto_16579 - DIRECTION
      ?auto_16578 - MODE
      ?auto_16581 - DIRECTION
      ?auto_16580 - MODE
    )
    :vars
    (
      ?auto_16583 - INSTRUMENT
      ?auto_16582 - SATELLITE
      ?auto_16584 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16583 ?auto_16582 ) ( SUPPORTS ?auto_16583 ?auto_16578 ) ( POINTING ?auto_16582 ?auto_16584 ) ( not ( = ?auto_16579 ?auto_16584 ) ) ( HAVE_IMAGE ?auto_16581 ?auto_16580 ) ( not ( = ?auto_16581 ?auto_16579 ) ) ( not ( = ?auto_16581 ?auto_16584 ) ) ( not ( = ?auto_16580 ?auto_16578 ) ) ( CALIBRATION_TARGET ?auto_16583 ?auto_16584 ) ( POWER_AVAIL ?auto_16582 ) ( HAVE_IMAGE ?auto_16576 ?auto_16577 ) ( not ( = ?auto_16576 ?auto_16579 ) ) ( not ( = ?auto_16576 ?auto_16581 ) ) ( not ( = ?auto_16576 ?auto_16584 ) ) ( not ( = ?auto_16577 ?auto_16578 ) ) ( not ( = ?auto_16577 ?auto_16580 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16581 ?auto_16580 ?auto_16579 ?auto_16578 )
      ( GET-3IMAGE-VERIFY ?auto_16576 ?auto_16577 ?auto_16579 ?auto_16578 ?auto_16581 ?auto_16580 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16585 - DIRECTION
      ?auto_16586 - MODE
      ?auto_16588 - DIRECTION
      ?auto_16587 - MODE
      ?auto_16590 - DIRECTION
      ?auto_16589 - MODE
    )
    :vars
    (
      ?auto_16594 - INSTRUMENT
      ?auto_16593 - SATELLITE
      ?auto_16595 - DIRECTION
      ?auto_16592 - DIRECTION
      ?auto_16591 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_16594 ?auto_16593 ) ( SUPPORTS ?auto_16594 ?auto_16587 ) ( POINTING ?auto_16593 ?auto_16595 ) ( not ( = ?auto_16588 ?auto_16595 ) ) ( HAVE_IMAGE ?auto_16592 ?auto_16591 ) ( not ( = ?auto_16592 ?auto_16588 ) ) ( not ( = ?auto_16592 ?auto_16595 ) ) ( not ( = ?auto_16591 ?auto_16587 ) ) ( CALIBRATION_TARGET ?auto_16594 ?auto_16595 ) ( POWER_AVAIL ?auto_16593 ) ( HAVE_IMAGE ?auto_16585 ?auto_16586 ) ( HAVE_IMAGE ?auto_16590 ?auto_16589 ) ( not ( = ?auto_16585 ?auto_16588 ) ) ( not ( = ?auto_16585 ?auto_16590 ) ) ( not ( = ?auto_16585 ?auto_16595 ) ) ( not ( = ?auto_16585 ?auto_16592 ) ) ( not ( = ?auto_16586 ?auto_16587 ) ) ( not ( = ?auto_16586 ?auto_16589 ) ) ( not ( = ?auto_16586 ?auto_16591 ) ) ( not ( = ?auto_16588 ?auto_16590 ) ) ( not ( = ?auto_16587 ?auto_16589 ) ) ( not ( = ?auto_16590 ?auto_16595 ) ) ( not ( = ?auto_16590 ?auto_16592 ) ) ( not ( = ?auto_16589 ?auto_16591 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16592 ?auto_16591 ?auto_16588 ?auto_16587 )
      ( GET-3IMAGE-VERIFY ?auto_16585 ?auto_16586 ?auto_16588 ?auto_16587 ?auto_16590 ?auto_16589 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16607 - DIRECTION
      ?auto_16608 - MODE
      ?auto_16610 - DIRECTION
      ?auto_16609 - MODE
      ?auto_16612 - DIRECTION
      ?auto_16611 - MODE
    )
    :vars
    (
      ?auto_16614 - INSTRUMENT
      ?auto_16613 - SATELLITE
      ?auto_16615 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16614 ?auto_16613 ) ( SUPPORTS ?auto_16614 ?auto_16608 ) ( POINTING ?auto_16613 ?auto_16615 ) ( not ( = ?auto_16607 ?auto_16615 ) ) ( HAVE_IMAGE ?auto_16610 ?auto_16609 ) ( not ( = ?auto_16610 ?auto_16607 ) ) ( not ( = ?auto_16610 ?auto_16615 ) ) ( not ( = ?auto_16609 ?auto_16608 ) ) ( CALIBRATION_TARGET ?auto_16614 ?auto_16615 ) ( POWER_AVAIL ?auto_16613 ) ( HAVE_IMAGE ?auto_16612 ?auto_16611 ) ( not ( = ?auto_16607 ?auto_16612 ) ) ( not ( = ?auto_16608 ?auto_16611 ) ) ( not ( = ?auto_16610 ?auto_16612 ) ) ( not ( = ?auto_16609 ?auto_16611 ) ) ( not ( = ?auto_16612 ?auto_16615 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16610 ?auto_16609 ?auto_16607 ?auto_16608 )
      ( GET-3IMAGE-VERIFY ?auto_16607 ?auto_16608 ?auto_16610 ?auto_16609 ?auto_16612 ?auto_16611 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16616 - DIRECTION
      ?auto_16617 - MODE
      ?auto_16619 - DIRECTION
      ?auto_16618 - MODE
      ?auto_16621 - DIRECTION
      ?auto_16620 - MODE
    )
    :vars
    (
      ?auto_16623 - INSTRUMENT
      ?auto_16622 - SATELLITE
      ?auto_16624 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16623 ?auto_16622 ) ( SUPPORTS ?auto_16623 ?auto_16617 ) ( POINTING ?auto_16622 ?auto_16624 ) ( not ( = ?auto_16616 ?auto_16624 ) ) ( HAVE_IMAGE ?auto_16619 ?auto_16618 ) ( not ( = ?auto_16619 ?auto_16616 ) ) ( not ( = ?auto_16619 ?auto_16624 ) ) ( not ( = ?auto_16618 ?auto_16617 ) ) ( CALIBRATION_TARGET ?auto_16623 ?auto_16624 ) ( POWER_AVAIL ?auto_16622 ) ( HAVE_IMAGE ?auto_16621 ?auto_16620 ) ( not ( = ?auto_16616 ?auto_16621 ) ) ( not ( = ?auto_16617 ?auto_16620 ) ) ( not ( = ?auto_16619 ?auto_16621 ) ) ( not ( = ?auto_16618 ?auto_16620 ) ) ( not ( = ?auto_16621 ?auto_16624 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16619 ?auto_16618 ?auto_16616 ?auto_16617 )
      ( GET-3IMAGE-VERIFY ?auto_16616 ?auto_16617 ?auto_16619 ?auto_16618 ?auto_16621 ?auto_16620 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16634 - DIRECTION
      ?auto_16635 - MODE
      ?auto_16637 - DIRECTION
      ?auto_16636 - MODE
      ?auto_16639 - DIRECTION
      ?auto_16638 - MODE
    )
    :vars
    (
      ?auto_16641 - INSTRUMENT
      ?auto_16640 - SATELLITE
      ?auto_16642 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16641 ?auto_16640 ) ( SUPPORTS ?auto_16641 ?auto_16635 ) ( POINTING ?auto_16640 ?auto_16642 ) ( not ( = ?auto_16634 ?auto_16642 ) ) ( HAVE_IMAGE ?auto_16639 ?auto_16638 ) ( not ( = ?auto_16639 ?auto_16634 ) ) ( not ( = ?auto_16639 ?auto_16642 ) ) ( not ( = ?auto_16638 ?auto_16635 ) ) ( CALIBRATION_TARGET ?auto_16641 ?auto_16642 ) ( POWER_AVAIL ?auto_16640 ) ( HAVE_IMAGE ?auto_16637 ?auto_16636 ) ( not ( = ?auto_16634 ?auto_16637 ) ) ( not ( = ?auto_16635 ?auto_16636 ) ) ( not ( = ?auto_16637 ?auto_16639 ) ) ( not ( = ?auto_16637 ?auto_16642 ) ) ( not ( = ?auto_16636 ?auto_16638 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16639 ?auto_16638 ?auto_16634 ?auto_16635 )
      ( GET-3IMAGE-VERIFY ?auto_16634 ?auto_16635 ?auto_16637 ?auto_16636 ?auto_16639 ?auto_16638 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16643 - DIRECTION
      ?auto_16644 - MODE
      ?auto_16646 - DIRECTION
      ?auto_16645 - MODE
      ?auto_16648 - DIRECTION
      ?auto_16647 - MODE
    )
    :vars
    (
      ?auto_16652 - INSTRUMENT
      ?auto_16651 - SATELLITE
      ?auto_16653 - DIRECTION
      ?auto_16650 - DIRECTION
      ?auto_16649 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_16652 ?auto_16651 ) ( SUPPORTS ?auto_16652 ?auto_16644 ) ( POINTING ?auto_16651 ?auto_16653 ) ( not ( = ?auto_16643 ?auto_16653 ) ) ( HAVE_IMAGE ?auto_16650 ?auto_16649 ) ( not ( = ?auto_16650 ?auto_16643 ) ) ( not ( = ?auto_16650 ?auto_16653 ) ) ( not ( = ?auto_16649 ?auto_16644 ) ) ( CALIBRATION_TARGET ?auto_16652 ?auto_16653 ) ( POWER_AVAIL ?auto_16651 ) ( HAVE_IMAGE ?auto_16646 ?auto_16645 ) ( HAVE_IMAGE ?auto_16648 ?auto_16647 ) ( not ( = ?auto_16643 ?auto_16646 ) ) ( not ( = ?auto_16643 ?auto_16648 ) ) ( not ( = ?auto_16644 ?auto_16645 ) ) ( not ( = ?auto_16644 ?auto_16647 ) ) ( not ( = ?auto_16646 ?auto_16648 ) ) ( not ( = ?auto_16646 ?auto_16653 ) ) ( not ( = ?auto_16646 ?auto_16650 ) ) ( not ( = ?auto_16645 ?auto_16647 ) ) ( not ( = ?auto_16645 ?auto_16649 ) ) ( not ( = ?auto_16648 ?auto_16653 ) ) ( not ( = ?auto_16648 ?auto_16650 ) ) ( not ( = ?auto_16647 ?auto_16649 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16650 ?auto_16649 ?auto_16643 ?auto_16644 )
      ( GET-3IMAGE-VERIFY ?auto_16643 ?auto_16644 ?auto_16646 ?auto_16645 ?auto_16648 ?auto_16647 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_16696 - DIRECTION
      ?auto_16697 - MODE
    )
    :vars
    (
      ?auto_16701 - INSTRUMENT
      ?auto_16700 - SATELLITE
      ?auto_16702 - DIRECTION
      ?auto_16699 - DIRECTION
      ?auto_16698 - MODE
      ?auto_16703 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16701 ?auto_16700 ) ( SUPPORTS ?auto_16701 ?auto_16697 ) ( not ( = ?auto_16696 ?auto_16702 ) ) ( HAVE_IMAGE ?auto_16699 ?auto_16698 ) ( not ( = ?auto_16699 ?auto_16696 ) ) ( not ( = ?auto_16699 ?auto_16702 ) ) ( not ( = ?auto_16698 ?auto_16697 ) ) ( CALIBRATION_TARGET ?auto_16701 ?auto_16702 ) ( POWER_AVAIL ?auto_16700 ) ( POINTING ?auto_16700 ?auto_16703 ) ( not ( = ?auto_16702 ?auto_16703 ) ) ( not ( = ?auto_16696 ?auto_16703 ) ) ( not ( = ?auto_16699 ?auto_16703 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_16700 ?auto_16702 ?auto_16703 )
      ( GET-2IMAGE ?auto_16699 ?auto_16698 ?auto_16696 ?auto_16697 )
      ( GET-1IMAGE-VERIFY ?auto_16696 ?auto_16697 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_16704 - DIRECTION
      ?auto_16705 - MODE
      ?auto_16707 - DIRECTION
      ?auto_16706 - MODE
    )
    :vars
    (
      ?auto_16708 - INSTRUMENT
      ?auto_16711 - SATELLITE
      ?auto_16709 - DIRECTION
      ?auto_16710 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16708 ?auto_16711 ) ( SUPPORTS ?auto_16708 ?auto_16706 ) ( not ( = ?auto_16707 ?auto_16709 ) ) ( HAVE_IMAGE ?auto_16704 ?auto_16705 ) ( not ( = ?auto_16704 ?auto_16707 ) ) ( not ( = ?auto_16704 ?auto_16709 ) ) ( not ( = ?auto_16705 ?auto_16706 ) ) ( CALIBRATION_TARGET ?auto_16708 ?auto_16709 ) ( POWER_AVAIL ?auto_16711 ) ( POINTING ?auto_16711 ?auto_16710 ) ( not ( = ?auto_16709 ?auto_16710 ) ) ( not ( = ?auto_16707 ?auto_16710 ) ) ( not ( = ?auto_16704 ?auto_16710 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_16707 ?auto_16706 )
      ( GET-2IMAGE-VERIFY ?auto_16704 ?auto_16705 ?auto_16707 ?auto_16706 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_16712 - DIRECTION
      ?auto_16713 - MODE
      ?auto_16715 - DIRECTION
      ?auto_16714 - MODE
    )
    :vars
    (
      ?auto_16720 - INSTRUMENT
      ?auto_16719 - SATELLITE
      ?auto_16718 - DIRECTION
      ?auto_16717 - DIRECTION
      ?auto_16716 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_16720 ?auto_16719 ) ( SUPPORTS ?auto_16720 ?auto_16714 ) ( not ( = ?auto_16715 ?auto_16718 ) ) ( HAVE_IMAGE ?auto_16717 ?auto_16716 ) ( not ( = ?auto_16717 ?auto_16715 ) ) ( not ( = ?auto_16717 ?auto_16718 ) ) ( not ( = ?auto_16716 ?auto_16714 ) ) ( CALIBRATION_TARGET ?auto_16720 ?auto_16718 ) ( POWER_AVAIL ?auto_16719 ) ( POINTING ?auto_16719 ?auto_16712 ) ( not ( = ?auto_16718 ?auto_16712 ) ) ( not ( = ?auto_16715 ?auto_16712 ) ) ( not ( = ?auto_16717 ?auto_16712 ) ) ( HAVE_IMAGE ?auto_16712 ?auto_16713 ) ( not ( = ?auto_16713 ?auto_16714 ) ) ( not ( = ?auto_16713 ?auto_16716 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16717 ?auto_16716 ?auto_16715 ?auto_16714 )
      ( GET-2IMAGE-VERIFY ?auto_16712 ?auto_16713 ?auto_16715 ?auto_16714 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_16721 - DIRECTION
      ?auto_16722 - MODE
      ?auto_16724 - DIRECTION
      ?auto_16723 - MODE
    )
    :vars
    (
      ?auto_16728 - INSTRUMENT
      ?auto_16727 - SATELLITE
      ?auto_16726 - DIRECTION
      ?auto_16725 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16728 ?auto_16727 ) ( SUPPORTS ?auto_16728 ?auto_16722 ) ( not ( = ?auto_16721 ?auto_16726 ) ) ( HAVE_IMAGE ?auto_16724 ?auto_16723 ) ( not ( = ?auto_16724 ?auto_16721 ) ) ( not ( = ?auto_16724 ?auto_16726 ) ) ( not ( = ?auto_16723 ?auto_16722 ) ) ( CALIBRATION_TARGET ?auto_16728 ?auto_16726 ) ( POWER_AVAIL ?auto_16727 ) ( POINTING ?auto_16727 ?auto_16725 ) ( not ( = ?auto_16726 ?auto_16725 ) ) ( not ( = ?auto_16721 ?auto_16725 ) ) ( not ( = ?auto_16724 ?auto_16725 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16724 ?auto_16723 ?auto_16721 ?auto_16722 )
      ( GET-2IMAGE-VERIFY ?auto_16721 ?auto_16722 ?auto_16724 ?auto_16723 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_16729 - DIRECTION
      ?auto_16730 - MODE
      ?auto_16732 - DIRECTION
      ?auto_16731 - MODE
    )
    :vars
    (
      ?auto_16737 - INSTRUMENT
      ?auto_16736 - SATELLITE
      ?auto_16735 - DIRECTION
      ?auto_16734 - DIRECTION
      ?auto_16733 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_16737 ?auto_16736 ) ( SUPPORTS ?auto_16737 ?auto_16730 ) ( not ( = ?auto_16729 ?auto_16735 ) ) ( HAVE_IMAGE ?auto_16734 ?auto_16733 ) ( not ( = ?auto_16734 ?auto_16729 ) ) ( not ( = ?auto_16734 ?auto_16735 ) ) ( not ( = ?auto_16733 ?auto_16730 ) ) ( CALIBRATION_TARGET ?auto_16737 ?auto_16735 ) ( POWER_AVAIL ?auto_16736 ) ( POINTING ?auto_16736 ?auto_16732 ) ( not ( = ?auto_16735 ?auto_16732 ) ) ( not ( = ?auto_16729 ?auto_16732 ) ) ( not ( = ?auto_16734 ?auto_16732 ) ) ( HAVE_IMAGE ?auto_16732 ?auto_16731 ) ( not ( = ?auto_16730 ?auto_16731 ) ) ( not ( = ?auto_16731 ?auto_16733 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16734 ?auto_16733 ?auto_16729 ?auto_16730 )
      ( GET-2IMAGE-VERIFY ?auto_16729 ?auto_16730 ?auto_16732 ?auto_16731 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16748 - DIRECTION
      ?auto_16749 - MODE
      ?auto_16751 - DIRECTION
      ?auto_16750 - MODE
      ?auto_16753 - DIRECTION
      ?auto_16752 - MODE
    )
    :vars
    (
      ?auto_16757 - INSTRUMENT
      ?auto_16756 - SATELLITE
      ?auto_16755 - DIRECTION
      ?auto_16754 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16757 ?auto_16756 ) ( SUPPORTS ?auto_16757 ?auto_16752 ) ( not ( = ?auto_16753 ?auto_16755 ) ) ( HAVE_IMAGE ?auto_16748 ?auto_16749 ) ( not ( = ?auto_16748 ?auto_16753 ) ) ( not ( = ?auto_16748 ?auto_16755 ) ) ( not ( = ?auto_16749 ?auto_16752 ) ) ( CALIBRATION_TARGET ?auto_16757 ?auto_16755 ) ( POWER_AVAIL ?auto_16756 ) ( POINTING ?auto_16756 ?auto_16754 ) ( not ( = ?auto_16755 ?auto_16754 ) ) ( not ( = ?auto_16753 ?auto_16754 ) ) ( not ( = ?auto_16748 ?auto_16754 ) ) ( HAVE_IMAGE ?auto_16751 ?auto_16750 ) ( not ( = ?auto_16748 ?auto_16751 ) ) ( not ( = ?auto_16749 ?auto_16750 ) ) ( not ( = ?auto_16751 ?auto_16753 ) ) ( not ( = ?auto_16751 ?auto_16755 ) ) ( not ( = ?auto_16751 ?auto_16754 ) ) ( not ( = ?auto_16750 ?auto_16752 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16748 ?auto_16749 ?auto_16753 ?auto_16752 )
      ( GET-3IMAGE-VERIFY ?auto_16748 ?auto_16749 ?auto_16751 ?auto_16750 ?auto_16753 ?auto_16752 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16758 - DIRECTION
      ?auto_16759 - MODE
      ?auto_16761 - DIRECTION
      ?auto_16760 - MODE
      ?auto_16763 - DIRECTION
      ?auto_16762 - MODE
    )
    :vars
    (
      ?auto_16766 - INSTRUMENT
      ?auto_16765 - SATELLITE
      ?auto_16764 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16766 ?auto_16765 ) ( SUPPORTS ?auto_16766 ?auto_16762 ) ( not ( = ?auto_16763 ?auto_16764 ) ) ( HAVE_IMAGE ?auto_16758 ?auto_16759 ) ( not ( = ?auto_16758 ?auto_16763 ) ) ( not ( = ?auto_16758 ?auto_16764 ) ) ( not ( = ?auto_16759 ?auto_16762 ) ) ( CALIBRATION_TARGET ?auto_16766 ?auto_16764 ) ( POWER_AVAIL ?auto_16765 ) ( POINTING ?auto_16765 ?auto_16761 ) ( not ( = ?auto_16764 ?auto_16761 ) ) ( not ( = ?auto_16763 ?auto_16761 ) ) ( not ( = ?auto_16758 ?auto_16761 ) ) ( HAVE_IMAGE ?auto_16761 ?auto_16760 ) ( not ( = ?auto_16759 ?auto_16760 ) ) ( not ( = ?auto_16760 ?auto_16762 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16758 ?auto_16759 ?auto_16763 ?auto_16762 )
      ( GET-3IMAGE-VERIFY ?auto_16758 ?auto_16759 ?auto_16761 ?auto_16760 ?auto_16763 ?auto_16762 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16767 - DIRECTION
      ?auto_16768 - MODE
      ?auto_16770 - DIRECTION
      ?auto_16769 - MODE
      ?auto_16772 - DIRECTION
      ?auto_16771 - MODE
    )
    :vars
    (
      ?auto_16776 - INSTRUMENT
      ?auto_16775 - SATELLITE
      ?auto_16774 - DIRECTION
      ?auto_16773 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16776 ?auto_16775 ) ( SUPPORTS ?auto_16776 ?auto_16769 ) ( not ( = ?auto_16770 ?auto_16774 ) ) ( HAVE_IMAGE ?auto_16767 ?auto_16768 ) ( not ( = ?auto_16767 ?auto_16770 ) ) ( not ( = ?auto_16767 ?auto_16774 ) ) ( not ( = ?auto_16768 ?auto_16769 ) ) ( CALIBRATION_TARGET ?auto_16776 ?auto_16774 ) ( POWER_AVAIL ?auto_16775 ) ( POINTING ?auto_16775 ?auto_16773 ) ( not ( = ?auto_16774 ?auto_16773 ) ) ( not ( = ?auto_16770 ?auto_16773 ) ) ( not ( = ?auto_16767 ?auto_16773 ) ) ( HAVE_IMAGE ?auto_16772 ?auto_16771 ) ( not ( = ?auto_16767 ?auto_16772 ) ) ( not ( = ?auto_16768 ?auto_16771 ) ) ( not ( = ?auto_16770 ?auto_16772 ) ) ( not ( = ?auto_16769 ?auto_16771 ) ) ( not ( = ?auto_16772 ?auto_16774 ) ) ( not ( = ?auto_16772 ?auto_16773 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16767 ?auto_16768 ?auto_16770 ?auto_16769 )
      ( GET-3IMAGE-VERIFY ?auto_16767 ?auto_16768 ?auto_16770 ?auto_16769 ?auto_16772 ?auto_16771 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16777 - DIRECTION
      ?auto_16778 - MODE
      ?auto_16780 - DIRECTION
      ?auto_16779 - MODE
      ?auto_16782 - DIRECTION
      ?auto_16781 - MODE
    )
    :vars
    (
      ?auto_16785 - INSTRUMENT
      ?auto_16784 - SATELLITE
      ?auto_16783 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16785 ?auto_16784 ) ( SUPPORTS ?auto_16785 ?auto_16779 ) ( not ( = ?auto_16780 ?auto_16783 ) ) ( HAVE_IMAGE ?auto_16777 ?auto_16778 ) ( not ( = ?auto_16777 ?auto_16780 ) ) ( not ( = ?auto_16777 ?auto_16783 ) ) ( not ( = ?auto_16778 ?auto_16779 ) ) ( CALIBRATION_TARGET ?auto_16785 ?auto_16783 ) ( POWER_AVAIL ?auto_16784 ) ( POINTING ?auto_16784 ?auto_16782 ) ( not ( = ?auto_16783 ?auto_16782 ) ) ( not ( = ?auto_16780 ?auto_16782 ) ) ( not ( = ?auto_16777 ?auto_16782 ) ) ( HAVE_IMAGE ?auto_16782 ?auto_16781 ) ( not ( = ?auto_16778 ?auto_16781 ) ) ( not ( = ?auto_16779 ?auto_16781 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16777 ?auto_16778 ?auto_16780 ?auto_16779 )
      ( GET-3IMAGE-VERIFY ?auto_16777 ?auto_16778 ?auto_16780 ?auto_16779 ?auto_16782 ?auto_16781 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16796 - DIRECTION
      ?auto_16797 - MODE
      ?auto_16799 - DIRECTION
      ?auto_16798 - MODE
      ?auto_16801 - DIRECTION
      ?auto_16800 - MODE
    )
    :vars
    (
      ?auto_16804 - INSTRUMENT
      ?auto_16803 - SATELLITE
      ?auto_16802 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16804 ?auto_16803 ) ( SUPPORTS ?auto_16804 ?auto_16800 ) ( not ( = ?auto_16801 ?auto_16802 ) ) ( HAVE_IMAGE ?auto_16799 ?auto_16798 ) ( not ( = ?auto_16799 ?auto_16801 ) ) ( not ( = ?auto_16799 ?auto_16802 ) ) ( not ( = ?auto_16798 ?auto_16800 ) ) ( CALIBRATION_TARGET ?auto_16804 ?auto_16802 ) ( POWER_AVAIL ?auto_16803 ) ( POINTING ?auto_16803 ?auto_16796 ) ( not ( = ?auto_16802 ?auto_16796 ) ) ( not ( = ?auto_16801 ?auto_16796 ) ) ( not ( = ?auto_16799 ?auto_16796 ) ) ( HAVE_IMAGE ?auto_16796 ?auto_16797 ) ( not ( = ?auto_16797 ?auto_16798 ) ) ( not ( = ?auto_16797 ?auto_16800 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16799 ?auto_16798 ?auto_16801 ?auto_16800 )
      ( GET-3IMAGE-VERIFY ?auto_16796 ?auto_16797 ?auto_16799 ?auto_16798 ?auto_16801 ?auto_16800 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16805 - DIRECTION
      ?auto_16806 - MODE
      ?auto_16808 - DIRECTION
      ?auto_16807 - MODE
      ?auto_16810 - DIRECTION
      ?auto_16809 - MODE
    )
    :vars
    (
      ?auto_16815 - INSTRUMENT
      ?auto_16814 - SATELLITE
      ?auto_16813 - DIRECTION
      ?auto_16812 - DIRECTION
      ?auto_16811 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_16815 ?auto_16814 ) ( SUPPORTS ?auto_16815 ?auto_16809 ) ( not ( = ?auto_16810 ?auto_16813 ) ) ( HAVE_IMAGE ?auto_16812 ?auto_16811 ) ( not ( = ?auto_16812 ?auto_16810 ) ) ( not ( = ?auto_16812 ?auto_16813 ) ) ( not ( = ?auto_16811 ?auto_16809 ) ) ( CALIBRATION_TARGET ?auto_16815 ?auto_16813 ) ( POWER_AVAIL ?auto_16814 ) ( POINTING ?auto_16814 ?auto_16808 ) ( not ( = ?auto_16813 ?auto_16808 ) ) ( not ( = ?auto_16810 ?auto_16808 ) ) ( not ( = ?auto_16812 ?auto_16808 ) ) ( HAVE_IMAGE ?auto_16805 ?auto_16806 ) ( HAVE_IMAGE ?auto_16808 ?auto_16807 ) ( not ( = ?auto_16805 ?auto_16808 ) ) ( not ( = ?auto_16805 ?auto_16810 ) ) ( not ( = ?auto_16805 ?auto_16813 ) ) ( not ( = ?auto_16805 ?auto_16812 ) ) ( not ( = ?auto_16806 ?auto_16807 ) ) ( not ( = ?auto_16806 ?auto_16809 ) ) ( not ( = ?auto_16806 ?auto_16811 ) ) ( not ( = ?auto_16807 ?auto_16809 ) ) ( not ( = ?auto_16807 ?auto_16811 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16812 ?auto_16811 ?auto_16810 ?auto_16809 )
      ( GET-3IMAGE-VERIFY ?auto_16805 ?auto_16806 ?auto_16808 ?auto_16807 ?auto_16810 ?auto_16809 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16816 - DIRECTION
      ?auto_16817 - MODE
      ?auto_16819 - DIRECTION
      ?auto_16818 - MODE
      ?auto_16821 - DIRECTION
      ?auto_16820 - MODE
    )
    :vars
    (
      ?auto_16824 - INSTRUMENT
      ?auto_16823 - SATELLITE
      ?auto_16822 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16824 ?auto_16823 ) ( SUPPORTS ?auto_16824 ?auto_16818 ) ( not ( = ?auto_16819 ?auto_16822 ) ) ( HAVE_IMAGE ?auto_16821 ?auto_16820 ) ( not ( = ?auto_16821 ?auto_16819 ) ) ( not ( = ?auto_16821 ?auto_16822 ) ) ( not ( = ?auto_16820 ?auto_16818 ) ) ( CALIBRATION_TARGET ?auto_16824 ?auto_16822 ) ( POWER_AVAIL ?auto_16823 ) ( POINTING ?auto_16823 ?auto_16816 ) ( not ( = ?auto_16822 ?auto_16816 ) ) ( not ( = ?auto_16819 ?auto_16816 ) ) ( not ( = ?auto_16821 ?auto_16816 ) ) ( HAVE_IMAGE ?auto_16816 ?auto_16817 ) ( not ( = ?auto_16817 ?auto_16818 ) ) ( not ( = ?auto_16817 ?auto_16820 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16821 ?auto_16820 ?auto_16819 ?auto_16818 )
      ( GET-3IMAGE-VERIFY ?auto_16816 ?auto_16817 ?auto_16819 ?auto_16818 ?auto_16821 ?auto_16820 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16825 - DIRECTION
      ?auto_16826 - MODE
      ?auto_16828 - DIRECTION
      ?auto_16827 - MODE
      ?auto_16830 - DIRECTION
      ?auto_16829 - MODE
    )
    :vars
    (
      ?auto_16835 - INSTRUMENT
      ?auto_16834 - SATELLITE
      ?auto_16833 - DIRECTION
      ?auto_16832 - DIRECTION
      ?auto_16831 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_16835 ?auto_16834 ) ( SUPPORTS ?auto_16835 ?auto_16827 ) ( not ( = ?auto_16828 ?auto_16833 ) ) ( HAVE_IMAGE ?auto_16832 ?auto_16831 ) ( not ( = ?auto_16832 ?auto_16828 ) ) ( not ( = ?auto_16832 ?auto_16833 ) ) ( not ( = ?auto_16831 ?auto_16827 ) ) ( CALIBRATION_TARGET ?auto_16835 ?auto_16833 ) ( POWER_AVAIL ?auto_16834 ) ( POINTING ?auto_16834 ?auto_16830 ) ( not ( = ?auto_16833 ?auto_16830 ) ) ( not ( = ?auto_16828 ?auto_16830 ) ) ( not ( = ?auto_16832 ?auto_16830 ) ) ( HAVE_IMAGE ?auto_16825 ?auto_16826 ) ( HAVE_IMAGE ?auto_16830 ?auto_16829 ) ( not ( = ?auto_16825 ?auto_16828 ) ) ( not ( = ?auto_16825 ?auto_16830 ) ) ( not ( = ?auto_16825 ?auto_16833 ) ) ( not ( = ?auto_16825 ?auto_16832 ) ) ( not ( = ?auto_16826 ?auto_16827 ) ) ( not ( = ?auto_16826 ?auto_16829 ) ) ( not ( = ?auto_16826 ?auto_16831 ) ) ( not ( = ?auto_16827 ?auto_16829 ) ) ( not ( = ?auto_16829 ?auto_16831 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16832 ?auto_16831 ?auto_16828 ?auto_16827 )
      ( GET-3IMAGE-VERIFY ?auto_16825 ?auto_16826 ?auto_16828 ?auto_16827 ?auto_16830 ?auto_16829 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16847 - DIRECTION
      ?auto_16848 - MODE
      ?auto_16850 - DIRECTION
      ?auto_16849 - MODE
      ?auto_16852 - DIRECTION
      ?auto_16851 - MODE
    )
    :vars
    (
      ?auto_16856 - INSTRUMENT
      ?auto_16855 - SATELLITE
      ?auto_16854 - DIRECTION
      ?auto_16853 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16856 ?auto_16855 ) ( SUPPORTS ?auto_16856 ?auto_16848 ) ( not ( = ?auto_16847 ?auto_16854 ) ) ( HAVE_IMAGE ?auto_16850 ?auto_16849 ) ( not ( = ?auto_16850 ?auto_16847 ) ) ( not ( = ?auto_16850 ?auto_16854 ) ) ( not ( = ?auto_16849 ?auto_16848 ) ) ( CALIBRATION_TARGET ?auto_16856 ?auto_16854 ) ( POWER_AVAIL ?auto_16855 ) ( POINTING ?auto_16855 ?auto_16853 ) ( not ( = ?auto_16854 ?auto_16853 ) ) ( not ( = ?auto_16847 ?auto_16853 ) ) ( not ( = ?auto_16850 ?auto_16853 ) ) ( HAVE_IMAGE ?auto_16852 ?auto_16851 ) ( not ( = ?auto_16847 ?auto_16852 ) ) ( not ( = ?auto_16848 ?auto_16851 ) ) ( not ( = ?auto_16850 ?auto_16852 ) ) ( not ( = ?auto_16849 ?auto_16851 ) ) ( not ( = ?auto_16852 ?auto_16854 ) ) ( not ( = ?auto_16852 ?auto_16853 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16850 ?auto_16849 ?auto_16847 ?auto_16848 )
      ( GET-3IMAGE-VERIFY ?auto_16847 ?auto_16848 ?auto_16850 ?auto_16849 ?auto_16852 ?auto_16851 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16857 - DIRECTION
      ?auto_16858 - MODE
      ?auto_16860 - DIRECTION
      ?auto_16859 - MODE
      ?auto_16862 - DIRECTION
      ?auto_16861 - MODE
    )
    :vars
    (
      ?auto_16865 - INSTRUMENT
      ?auto_16864 - SATELLITE
      ?auto_16863 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16865 ?auto_16864 ) ( SUPPORTS ?auto_16865 ?auto_16858 ) ( not ( = ?auto_16857 ?auto_16863 ) ) ( HAVE_IMAGE ?auto_16860 ?auto_16859 ) ( not ( = ?auto_16860 ?auto_16857 ) ) ( not ( = ?auto_16860 ?auto_16863 ) ) ( not ( = ?auto_16859 ?auto_16858 ) ) ( CALIBRATION_TARGET ?auto_16865 ?auto_16863 ) ( POWER_AVAIL ?auto_16864 ) ( POINTING ?auto_16864 ?auto_16862 ) ( not ( = ?auto_16863 ?auto_16862 ) ) ( not ( = ?auto_16857 ?auto_16862 ) ) ( not ( = ?auto_16860 ?auto_16862 ) ) ( HAVE_IMAGE ?auto_16862 ?auto_16861 ) ( not ( = ?auto_16858 ?auto_16861 ) ) ( not ( = ?auto_16859 ?auto_16861 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16860 ?auto_16859 ?auto_16857 ?auto_16858 )
      ( GET-3IMAGE-VERIFY ?auto_16857 ?auto_16858 ?auto_16860 ?auto_16859 ?auto_16862 ?auto_16861 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16876 - DIRECTION
      ?auto_16877 - MODE
      ?auto_16879 - DIRECTION
      ?auto_16878 - MODE
      ?auto_16881 - DIRECTION
      ?auto_16880 - MODE
    )
    :vars
    (
      ?auto_16884 - INSTRUMENT
      ?auto_16883 - SATELLITE
      ?auto_16882 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_16884 ?auto_16883 ) ( SUPPORTS ?auto_16884 ?auto_16877 ) ( not ( = ?auto_16876 ?auto_16882 ) ) ( HAVE_IMAGE ?auto_16881 ?auto_16880 ) ( not ( = ?auto_16881 ?auto_16876 ) ) ( not ( = ?auto_16881 ?auto_16882 ) ) ( not ( = ?auto_16880 ?auto_16877 ) ) ( CALIBRATION_TARGET ?auto_16884 ?auto_16882 ) ( POWER_AVAIL ?auto_16883 ) ( POINTING ?auto_16883 ?auto_16879 ) ( not ( = ?auto_16882 ?auto_16879 ) ) ( not ( = ?auto_16876 ?auto_16879 ) ) ( not ( = ?auto_16881 ?auto_16879 ) ) ( HAVE_IMAGE ?auto_16879 ?auto_16878 ) ( not ( = ?auto_16877 ?auto_16878 ) ) ( not ( = ?auto_16878 ?auto_16880 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16881 ?auto_16880 ?auto_16876 ?auto_16877 )
      ( GET-3IMAGE-VERIFY ?auto_16876 ?auto_16877 ?auto_16879 ?auto_16878 ?auto_16881 ?auto_16880 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16885 - DIRECTION
      ?auto_16886 - MODE
      ?auto_16888 - DIRECTION
      ?auto_16887 - MODE
      ?auto_16890 - DIRECTION
      ?auto_16889 - MODE
    )
    :vars
    (
      ?auto_16895 - INSTRUMENT
      ?auto_16894 - SATELLITE
      ?auto_16893 - DIRECTION
      ?auto_16892 - DIRECTION
      ?auto_16891 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_16895 ?auto_16894 ) ( SUPPORTS ?auto_16895 ?auto_16886 ) ( not ( = ?auto_16885 ?auto_16893 ) ) ( HAVE_IMAGE ?auto_16892 ?auto_16891 ) ( not ( = ?auto_16892 ?auto_16885 ) ) ( not ( = ?auto_16892 ?auto_16893 ) ) ( not ( = ?auto_16891 ?auto_16886 ) ) ( CALIBRATION_TARGET ?auto_16895 ?auto_16893 ) ( POWER_AVAIL ?auto_16894 ) ( POINTING ?auto_16894 ?auto_16890 ) ( not ( = ?auto_16893 ?auto_16890 ) ) ( not ( = ?auto_16885 ?auto_16890 ) ) ( not ( = ?auto_16892 ?auto_16890 ) ) ( HAVE_IMAGE ?auto_16888 ?auto_16887 ) ( HAVE_IMAGE ?auto_16890 ?auto_16889 ) ( not ( = ?auto_16885 ?auto_16888 ) ) ( not ( = ?auto_16886 ?auto_16887 ) ) ( not ( = ?auto_16886 ?auto_16889 ) ) ( not ( = ?auto_16888 ?auto_16890 ) ) ( not ( = ?auto_16888 ?auto_16893 ) ) ( not ( = ?auto_16888 ?auto_16892 ) ) ( not ( = ?auto_16887 ?auto_16889 ) ) ( not ( = ?auto_16887 ?auto_16891 ) ) ( not ( = ?auto_16889 ?auto_16891 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16892 ?auto_16891 ?auto_16885 ?auto_16886 )
      ( GET-3IMAGE-VERIFY ?auto_16885 ?auto_16886 ?auto_16888 ?auto_16887 ?auto_16890 ?auto_16889 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_16940 - DIRECTION
      ?auto_16941 - MODE
    )
    :vars
    (
      ?auto_16947 - INSTRUMENT
      ?auto_16946 - SATELLITE
      ?auto_16945 - DIRECTION
      ?auto_16944 - DIRECTION
      ?auto_16943 - MODE
      ?auto_16942 - DIRECTION
      ?auto_16948 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_16947 ?auto_16946 ) ( SUPPORTS ?auto_16947 ?auto_16941 ) ( not ( = ?auto_16940 ?auto_16945 ) ) ( HAVE_IMAGE ?auto_16944 ?auto_16943 ) ( not ( = ?auto_16944 ?auto_16940 ) ) ( not ( = ?auto_16944 ?auto_16945 ) ) ( not ( = ?auto_16943 ?auto_16941 ) ) ( CALIBRATION_TARGET ?auto_16947 ?auto_16945 ) ( POINTING ?auto_16946 ?auto_16942 ) ( not ( = ?auto_16945 ?auto_16942 ) ) ( not ( = ?auto_16940 ?auto_16942 ) ) ( not ( = ?auto_16944 ?auto_16942 ) ) ( ON_BOARD ?auto_16948 ?auto_16946 ) ( POWER_ON ?auto_16948 ) ( not ( = ?auto_16947 ?auto_16948 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_16948 ?auto_16946 )
      ( GET-2IMAGE ?auto_16944 ?auto_16943 ?auto_16940 ?auto_16941 )
      ( GET-1IMAGE-VERIFY ?auto_16940 ?auto_16941 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_16949 - DIRECTION
      ?auto_16950 - MODE
      ?auto_16952 - DIRECTION
      ?auto_16951 - MODE
    )
    :vars
    (
      ?auto_16956 - INSTRUMENT
      ?auto_16954 - SATELLITE
      ?auto_16953 - DIRECTION
      ?auto_16955 - DIRECTION
      ?auto_16957 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_16956 ?auto_16954 ) ( SUPPORTS ?auto_16956 ?auto_16951 ) ( not ( = ?auto_16952 ?auto_16953 ) ) ( HAVE_IMAGE ?auto_16949 ?auto_16950 ) ( not ( = ?auto_16949 ?auto_16952 ) ) ( not ( = ?auto_16949 ?auto_16953 ) ) ( not ( = ?auto_16950 ?auto_16951 ) ) ( CALIBRATION_TARGET ?auto_16956 ?auto_16953 ) ( POINTING ?auto_16954 ?auto_16955 ) ( not ( = ?auto_16953 ?auto_16955 ) ) ( not ( = ?auto_16952 ?auto_16955 ) ) ( not ( = ?auto_16949 ?auto_16955 ) ) ( ON_BOARD ?auto_16957 ?auto_16954 ) ( POWER_ON ?auto_16957 ) ( not ( = ?auto_16956 ?auto_16957 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_16952 ?auto_16951 )
      ( GET-2IMAGE-VERIFY ?auto_16949 ?auto_16950 ?auto_16952 ?auto_16951 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_16958 - DIRECTION
      ?auto_16959 - MODE
      ?auto_16961 - DIRECTION
      ?auto_16960 - MODE
    )
    :vars
    (
      ?auto_16967 - INSTRUMENT
      ?auto_16965 - SATELLITE
      ?auto_16966 - DIRECTION
      ?auto_16964 - DIRECTION
      ?auto_16963 - MODE
      ?auto_16962 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_16967 ?auto_16965 ) ( SUPPORTS ?auto_16967 ?auto_16960 ) ( not ( = ?auto_16961 ?auto_16966 ) ) ( HAVE_IMAGE ?auto_16964 ?auto_16963 ) ( not ( = ?auto_16964 ?auto_16961 ) ) ( not ( = ?auto_16964 ?auto_16966 ) ) ( not ( = ?auto_16963 ?auto_16960 ) ) ( CALIBRATION_TARGET ?auto_16967 ?auto_16966 ) ( POINTING ?auto_16965 ?auto_16958 ) ( not ( = ?auto_16966 ?auto_16958 ) ) ( not ( = ?auto_16961 ?auto_16958 ) ) ( not ( = ?auto_16964 ?auto_16958 ) ) ( ON_BOARD ?auto_16962 ?auto_16965 ) ( POWER_ON ?auto_16962 ) ( not ( = ?auto_16967 ?auto_16962 ) ) ( HAVE_IMAGE ?auto_16958 ?auto_16959 ) ( not ( = ?auto_16959 ?auto_16960 ) ) ( not ( = ?auto_16959 ?auto_16963 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16964 ?auto_16963 ?auto_16961 ?auto_16960 )
      ( GET-2IMAGE-VERIFY ?auto_16958 ?auto_16959 ?auto_16961 ?auto_16960 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_16968 - DIRECTION
      ?auto_16969 - MODE
      ?auto_16971 - DIRECTION
      ?auto_16970 - MODE
    )
    :vars
    (
      ?auto_16975 - INSTRUMENT
      ?auto_16973 - SATELLITE
      ?auto_16974 - DIRECTION
      ?auto_16976 - DIRECTION
      ?auto_16972 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_16975 ?auto_16973 ) ( SUPPORTS ?auto_16975 ?auto_16969 ) ( not ( = ?auto_16968 ?auto_16974 ) ) ( HAVE_IMAGE ?auto_16971 ?auto_16970 ) ( not ( = ?auto_16971 ?auto_16968 ) ) ( not ( = ?auto_16971 ?auto_16974 ) ) ( not ( = ?auto_16970 ?auto_16969 ) ) ( CALIBRATION_TARGET ?auto_16975 ?auto_16974 ) ( POINTING ?auto_16973 ?auto_16976 ) ( not ( = ?auto_16974 ?auto_16976 ) ) ( not ( = ?auto_16968 ?auto_16976 ) ) ( not ( = ?auto_16971 ?auto_16976 ) ) ( ON_BOARD ?auto_16972 ?auto_16973 ) ( POWER_ON ?auto_16972 ) ( not ( = ?auto_16975 ?auto_16972 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16971 ?auto_16970 ?auto_16968 ?auto_16969 )
      ( GET-2IMAGE-VERIFY ?auto_16968 ?auto_16969 ?auto_16971 ?auto_16970 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_16977 - DIRECTION
      ?auto_16978 - MODE
      ?auto_16980 - DIRECTION
      ?auto_16979 - MODE
    )
    :vars
    (
      ?auto_16986 - INSTRUMENT
      ?auto_16984 - SATELLITE
      ?auto_16985 - DIRECTION
      ?auto_16983 - DIRECTION
      ?auto_16982 - MODE
      ?auto_16981 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_16986 ?auto_16984 ) ( SUPPORTS ?auto_16986 ?auto_16978 ) ( not ( = ?auto_16977 ?auto_16985 ) ) ( HAVE_IMAGE ?auto_16983 ?auto_16982 ) ( not ( = ?auto_16983 ?auto_16977 ) ) ( not ( = ?auto_16983 ?auto_16985 ) ) ( not ( = ?auto_16982 ?auto_16978 ) ) ( CALIBRATION_TARGET ?auto_16986 ?auto_16985 ) ( POINTING ?auto_16984 ?auto_16980 ) ( not ( = ?auto_16985 ?auto_16980 ) ) ( not ( = ?auto_16977 ?auto_16980 ) ) ( not ( = ?auto_16983 ?auto_16980 ) ) ( ON_BOARD ?auto_16981 ?auto_16984 ) ( POWER_ON ?auto_16981 ) ( not ( = ?auto_16986 ?auto_16981 ) ) ( HAVE_IMAGE ?auto_16980 ?auto_16979 ) ( not ( = ?auto_16978 ?auto_16979 ) ) ( not ( = ?auto_16979 ?auto_16982 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16983 ?auto_16982 ?auto_16977 ?auto_16978 )
      ( GET-2IMAGE-VERIFY ?auto_16977 ?auto_16978 ?auto_16980 ?auto_16979 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_16998 - DIRECTION
      ?auto_16999 - MODE
      ?auto_17001 - DIRECTION
      ?auto_17000 - MODE
      ?auto_17003 - DIRECTION
      ?auto_17002 - MODE
    )
    :vars
    (
      ?auto_17007 - INSTRUMENT
      ?auto_17005 - SATELLITE
      ?auto_17006 - DIRECTION
      ?auto_17008 - DIRECTION
      ?auto_17004 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17007 ?auto_17005 ) ( SUPPORTS ?auto_17007 ?auto_17002 ) ( not ( = ?auto_17003 ?auto_17006 ) ) ( HAVE_IMAGE ?auto_16998 ?auto_16999 ) ( not ( = ?auto_16998 ?auto_17003 ) ) ( not ( = ?auto_16998 ?auto_17006 ) ) ( not ( = ?auto_16999 ?auto_17002 ) ) ( CALIBRATION_TARGET ?auto_17007 ?auto_17006 ) ( POINTING ?auto_17005 ?auto_17008 ) ( not ( = ?auto_17006 ?auto_17008 ) ) ( not ( = ?auto_17003 ?auto_17008 ) ) ( not ( = ?auto_16998 ?auto_17008 ) ) ( ON_BOARD ?auto_17004 ?auto_17005 ) ( POWER_ON ?auto_17004 ) ( not ( = ?auto_17007 ?auto_17004 ) ) ( HAVE_IMAGE ?auto_17001 ?auto_17000 ) ( not ( = ?auto_16998 ?auto_17001 ) ) ( not ( = ?auto_16999 ?auto_17000 ) ) ( not ( = ?auto_17001 ?auto_17003 ) ) ( not ( = ?auto_17001 ?auto_17006 ) ) ( not ( = ?auto_17001 ?auto_17008 ) ) ( not ( = ?auto_17000 ?auto_17002 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16998 ?auto_16999 ?auto_17003 ?auto_17002 )
      ( GET-3IMAGE-VERIFY ?auto_16998 ?auto_16999 ?auto_17001 ?auto_17000 ?auto_17003 ?auto_17002 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17009 - DIRECTION
      ?auto_17010 - MODE
      ?auto_17012 - DIRECTION
      ?auto_17011 - MODE
      ?auto_17014 - DIRECTION
      ?auto_17013 - MODE
    )
    :vars
    (
      ?auto_17018 - INSTRUMENT
      ?auto_17016 - SATELLITE
      ?auto_17017 - DIRECTION
      ?auto_17015 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17018 ?auto_17016 ) ( SUPPORTS ?auto_17018 ?auto_17013 ) ( not ( = ?auto_17014 ?auto_17017 ) ) ( HAVE_IMAGE ?auto_17009 ?auto_17010 ) ( not ( = ?auto_17009 ?auto_17014 ) ) ( not ( = ?auto_17009 ?auto_17017 ) ) ( not ( = ?auto_17010 ?auto_17013 ) ) ( CALIBRATION_TARGET ?auto_17018 ?auto_17017 ) ( POINTING ?auto_17016 ?auto_17012 ) ( not ( = ?auto_17017 ?auto_17012 ) ) ( not ( = ?auto_17014 ?auto_17012 ) ) ( not ( = ?auto_17009 ?auto_17012 ) ) ( ON_BOARD ?auto_17015 ?auto_17016 ) ( POWER_ON ?auto_17015 ) ( not ( = ?auto_17018 ?auto_17015 ) ) ( HAVE_IMAGE ?auto_17012 ?auto_17011 ) ( not ( = ?auto_17010 ?auto_17011 ) ) ( not ( = ?auto_17011 ?auto_17013 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17009 ?auto_17010 ?auto_17014 ?auto_17013 )
      ( GET-3IMAGE-VERIFY ?auto_17009 ?auto_17010 ?auto_17012 ?auto_17011 ?auto_17014 ?auto_17013 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17019 - DIRECTION
      ?auto_17020 - MODE
      ?auto_17022 - DIRECTION
      ?auto_17021 - MODE
      ?auto_17024 - DIRECTION
      ?auto_17023 - MODE
    )
    :vars
    (
      ?auto_17028 - INSTRUMENT
      ?auto_17026 - SATELLITE
      ?auto_17027 - DIRECTION
      ?auto_17029 - DIRECTION
      ?auto_17025 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17028 ?auto_17026 ) ( SUPPORTS ?auto_17028 ?auto_17021 ) ( not ( = ?auto_17022 ?auto_17027 ) ) ( HAVE_IMAGE ?auto_17024 ?auto_17023 ) ( not ( = ?auto_17024 ?auto_17022 ) ) ( not ( = ?auto_17024 ?auto_17027 ) ) ( not ( = ?auto_17023 ?auto_17021 ) ) ( CALIBRATION_TARGET ?auto_17028 ?auto_17027 ) ( POINTING ?auto_17026 ?auto_17029 ) ( not ( = ?auto_17027 ?auto_17029 ) ) ( not ( = ?auto_17022 ?auto_17029 ) ) ( not ( = ?auto_17024 ?auto_17029 ) ) ( ON_BOARD ?auto_17025 ?auto_17026 ) ( POWER_ON ?auto_17025 ) ( not ( = ?auto_17028 ?auto_17025 ) ) ( HAVE_IMAGE ?auto_17019 ?auto_17020 ) ( not ( = ?auto_17019 ?auto_17022 ) ) ( not ( = ?auto_17019 ?auto_17024 ) ) ( not ( = ?auto_17019 ?auto_17027 ) ) ( not ( = ?auto_17019 ?auto_17029 ) ) ( not ( = ?auto_17020 ?auto_17021 ) ) ( not ( = ?auto_17020 ?auto_17023 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17024 ?auto_17023 ?auto_17022 ?auto_17021 )
      ( GET-3IMAGE-VERIFY ?auto_17019 ?auto_17020 ?auto_17022 ?auto_17021 ?auto_17024 ?auto_17023 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17030 - DIRECTION
      ?auto_17031 - MODE
      ?auto_17033 - DIRECTION
      ?auto_17032 - MODE
      ?auto_17035 - DIRECTION
      ?auto_17034 - MODE
    )
    :vars
    (
      ?auto_17039 - INSTRUMENT
      ?auto_17037 - SATELLITE
      ?auto_17038 - DIRECTION
      ?auto_17036 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17039 ?auto_17037 ) ( SUPPORTS ?auto_17039 ?auto_17032 ) ( not ( = ?auto_17033 ?auto_17038 ) ) ( HAVE_IMAGE ?auto_17030 ?auto_17031 ) ( not ( = ?auto_17030 ?auto_17033 ) ) ( not ( = ?auto_17030 ?auto_17038 ) ) ( not ( = ?auto_17031 ?auto_17032 ) ) ( CALIBRATION_TARGET ?auto_17039 ?auto_17038 ) ( POINTING ?auto_17037 ?auto_17035 ) ( not ( = ?auto_17038 ?auto_17035 ) ) ( not ( = ?auto_17033 ?auto_17035 ) ) ( not ( = ?auto_17030 ?auto_17035 ) ) ( ON_BOARD ?auto_17036 ?auto_17037 ) ( POWER_ON ?auto_17036 ) ( not ( = ?auto_17039 ?auto_17036 ) ) ( HAVE_IMAGE ?auto_17035 ?auto_17034 ) ( not ( = ?auto_17031 ?auto_17034 ) ) ( not ( = ?auto_17032 ?auto_17034 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17030 ?auto_17031 ?auto_17033 ?auto_17032 )
      ( GET-3IMAGE-VERIFY ?auto_17030 ?auto_17031 ?auto_17033 ?auto_17032 ?auto_17035 ?auto_17034 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17051 - DIRECTION
      ?auto_17052 - MODE
      ?auto_17054 - DIRECTION
      ?auto_17053 - MODE
      ?auto_17056 - DIRECTION
      ?auto_17055 - MODE
    )
    :vars
    (
      ?auto_17060 - INSTRUMENT
      ?auto_17058 - SATELLITE
      ?auto_17059 - DIRECTION
      ?auto_17057 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17060 ?auto_17058 ) ( SUPPORTS ?auto_17060 ?auto_17055 ) ( not ( = ?auto_17056 ?auto_17059 ) ) ( HAVE_IMAGE ?auto_17054 ?auto_17053 ) ( not ( = ?auto_17054 ?auto_17056 ) ) ( not ( = ?auto_17054 ?auto_17059 ) ) ( not ( = ?auto_17053 ?auto_17055 ) ) ( CALIBRATION_TARGET ?auto_17060 ?auto_17059 ) ( POINTING ?auto_17058 ?auto_17051 ) ( not ( = ?auto_17059 ?auto_17051 ) ) ( not ( = ?auto_17056 ?auto_17051 ) ) ( not ( = ?auto_17054 ?auto_17051 ) ) ( ON_BOARD ?auto_17057 ?auto_17058 ) ( POWER_ON ?auto_17057 ) ( not ( = ?auto_17060 ?auto_17057 ) ) ( HAVE_IMAGE ?auto_17051 ?auto_17052 ) ( not ( = ?auto_17052 ?auto_17053 ) ) ( not ( = ?auto_17052 ?auto_17055 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17054 ?auto_17053 ?auto_17056 ?auto_17055 )
      ( GET-3IMAGE-VERIFY ?auto_17051 ?auto_17052 ?auto_17054 ?auto_17053 ?auto_17056 ?auto_17055 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17061 - DIRECTION
      ?auto_17062 - MODE
      ?auto_17064 - DIRECTION
      ?auto_17063 - MODE
      ?auto_17066 - DIRECTION
      ?auto_17065 - MODE
    )
    :vars
    (
      ?auto_17072 - INSTRUMENT
      ?auto_17070 - SATELLITE
      ?auto_17071 - DIRECTION
      ?auto_17069 - DIRECTION
      ?auto_17068 - MODE
      ?auto_17067 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17072 ?auto_17070 ) ( SUPPORTS ?auto_17072 ?auto_17065 ) ( not ( = ?auto_17066 ?auto_17071 ) ) ( HAVE_IMAGE ?auto_17069 ?auto_17068 ) ( not ( = ?auto_17069 ?auto_17066 ) ) ( not ( = ?auto_17069 ?auto_17071 ) ) ( not ( = ?auto_17068 ?auto_17065 ) ) ( CALIBRATION_TARGET ?auto_17072 ?auto_17071 ) ( POINTING ?auto_17070 ?auto_17064 ) ( not ( = ?auto_17071 ?auto_17064 ) ) ( not ( = ?auto_17066 ?auto_17064 ) ) ( not ( = ?auto_17069 ?auto_17064 ) ) ( ON_BOARD ?auto_17067 ?auto_17070 ) ( POWER_ON ?auto_17067 ) ( not ( = ?auto_17072 ?auto_17067 ) ) ( HAVE_IMAGE ?auto_17061 ?auto_17062 ) ( HAVE_IMAGE ?auto_17064 ?auto_17063 ) ( not ( = ?auto_17061 ?auto_17064 ) ) ( not ( = ?auto_17061 ?auto_17066 ) ) ( not ( = ?auto_17061 ?auto_17071 ) ) ( not ( = ?auto_17061 ?auto_17069 ) ) ( not ( = ?auto_17062 ?auto_17063 ) ) ( not ( = ?auto_17062 ?auto_17065 ) ) ( not ( = ?auto_17062 ?auto_17068 ) ) ( not ( = ?auto_17063 ?auto_17065 ) ) ( not ( = ?auto_17063 ?auto_17068 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17069 ?auto_17068 ?auto_17066 ?auto_17065 )
      ( GET-3IMAGE-VERIFY ?auto_17061 ?auto_17062 ?auto_17064 ?auto_17063 ?auto_17066 ?auto_17065 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17073 - DIRECTION
      ?auto_17074 - MODE
      ?auto_17076 - DIRECTION
      ?auto_17075 - MODE
      ?auto_17078 - DIRECTION
      ?auto_17077 - MODE
    )
    :vars
    (
      ?auto_17082 - INSTRUMENT
      ?auto_17080 - SATELLITE
      ?auto_17081 - DIRECTION
      ?auto_17079 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17082 ?auto_17080 ) ( SUPPORTS ?auto_17082 ?auto_17075 ) ( not ( = ?auto_17076 ?auto_17081 ) ) ( HAVE_IMAGE ?auto_17078 ?auto_17077 ) ( not ( = ?auto_17078 ?auto_17076 ) ) ( not ( = ?auto_17078 ?auto_17081 ) ) ( not ( = ?auto_17077 ?auto_17075 ) ) ( CALIBRATION_TARGET ?auto_17082 ?auto_17081 ) ( POINTING ?auto_17080 ?auto_17073 ) ( not ( = ?auto_17081 ?auto_17073 ) ) ( not ( = ?auto_17076 ?auto_17073 ) ) ( not ( = ?auto_17078 ?auto_17073 ) ) ( ON_BOARD ?auto_17079 ?auto_17080 ) ( POWER_ON ?auto_17079 ) ( not ( = ?auto_17082 ?auto_17079 ) ) ( HAVE_IMAGE ?auto_17073 ?auto_17074 ) ( not ( = ?auto_17074 ?auto_17075 ) ) ( not ( = ?auto_17074 ?auto_17077 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17078 ?auto_17077 ?auto_17076 ?auto_17075 )
      ( GET-3IMAGE-VERIFY ?auto_17073 ?auto_17074 ?auto_17076 ?auto_17075 ?auto_17078 ?auto_17077 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17083 - DIRECTION
      ?auto_17084 - MODE
      ?auto_17086 - DIRECTION
      ?auto_17085 - MODE
      ?auto_17088 - DIRECTION
      ?auto_17087 - MODE
    )
    :vars
    (
      ?auto_17094 - INSTRUMENT
      ?auto_17092 - SATELLITE
      ?auto_17093 - DIRECTION
      ?auto_17091 - DIRECTION
      ?auto_17090 - MODE
      ?auto_17089 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17094 ?auto_17092 ) ( SUPPORTS ?auto_17094 ?auto_17085 ) ( not ( = ?auto_17086 ?auto_17093 ) ) ( HAVE_IMAGE ?auto_17091 ?auto_17090 ) ( not ( = ?auto_17091 ?auto_17086 ) ) ( not ( = ?auto_17091 ?auto_17093 ) ) ( not ( = ?auto_17090 ?auto_17085 ) ) ( CALIBRATION_TARGET ?auto_17094 ?auto_17093 ) ( POINTING ?auto_17092 ?auto_17088 ) ( not ( = ?auto_17093 ?auto_17088 ) ) ( not ( = ?auto_17086 ?auto_17088 ) ) ( not ( = ?auto_17091 ?auto_17088 ) ) ( ON_BOARD ?auto_17089 ?auto_17092 ) ( POWER_ON ?auto_17089 ) ( not ( = ?auto_17094 ?auto_17089 ) ) ( HAVE_IMAGE ?auto_17083 ?auto_17084 ) ( HAVE_IMAGE ?auto_17088 ?auto_17087 ) ( not ( = ?auto_17083 ?auto_17086 ) ) ( not ( = ?auto_17083 ?auto_17088 ) ) ( not ( = ?auto_17083 ?auto_17093 ) ) ( not ( = ?auto_17083 ?auto_17091 ) ) ( not ( = ?auto_17084 ?auto_17085 ) ) ( not ( = ?auto_17084 ?auto_17087 ) ) ( not ( = ?auto_17084 ?auto_17090 ) ) ( not ( = ?auto_17085 ?auto_17087 ) ) ( not ( = ?auto_17087 ?auto_17090 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17091 ?auto_17090 ?auto_17086 ?auto_17085 )
      ( GET-3IMAGE-VERIFY ?auto_17083 ?auto_17084 ?auto_17086 ?auto_17085 ?auto_17088 ?auto_17087 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17107 - DIRECTION
      ?auto_17108 - MODE
      ?auto_17110 - DIRECTION
      ?auto_17109 - MODE
      ?auto_17112 - DIRECTION
      ?auto_17111 - MODE
    )
    :vars
    (
      ?auto_17116 - INSTRUMENT
      ?auto_17114 - SATELLITE
      ?auto_17115 - DIRECTION
      ?auto_17117 - DIRECTION
      ?auto_17113 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17116 ?auto_17114 ) ( SUPPORTS ?auto_17116 ?auto_17108 ) ( not ( = ?auto_17107 ?auto_17115 ) ) ( HAVE_IMAGE ?auto_17112 ?auto_17111 ) ( not ( = ?auto_17112 ?auto_17107 ) ) ( not ( = ?auto_17112 ?auto_17115 ) ) ( not ( = ?auto_17111 ?auto_17108 ) ) ( CALIBRATION_TARGET ?auto_17116 ?auto_17115 ) ( POINTING ?auto_17114 ?auto_17117 ) ( not ( = ?auto_17115 ?auto_17117 ) ) ( not ( = ?auto_17107 ?auto_17117 ) ) ( not ( = ?auto_17112 ?auto_17117 ) ) ( ON_BOARD ?auto_17113 ?auto_17114 ) ( POWER_ON ?auto_17113 ) ( not ( = ?auto_17116 ?auto_17113 ) ) ( HAVE_IMAGE ?auto_17110 ?auto_17109 ) ( not ( = ?auto_17107 ?auto_17110 ) ) ( not ( = ?auto_17108 ?auto_17109 ) ) ( not ( = ?auto_17110 ?auto_17112 ) ) ( not ( = ?auto_17110 ?auto_17115 ) ) ( not ( = ?auto_17110 ?auto_17117 ) ) ( not ( = ?auto_17109 ?auto_17111 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17112 ?auto_17111 ?auto_17107 ?auto_17108 )
      ( GET-3IMAGE-VERIFY ?auto_17107 ?auto_17108 ?auto_17110 ?auto_17109 ?auto_17112 ?auto_17111 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17118 - DIRECTION
      ?auto_17119 - MODE
      ?auto_17121 - DIRECTION
      ?auto_17120 - MODE
      ?auto_17123 - DIRECTION
      ?auto_17122 - MODE
    )
    :vars
    (
      ?auto_17127 - INSTRUMENT
      ?auto_17125 - SATELLITE
      ?auto_17126 - DIRECTION
      ?auto_17124 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17127 ?auto_17125 ) ( SUPPORTS ?auto_17127 ?auto_17119 ) ( not ( = ?auto_17118 ?auto_17126 ) ) ( HAVE_IMAGE ?auto_17121 ?auto_17120 ) ( not ( = ?auto_17121 ?auto_17118 ) ) ( not ( = ?auto_17121 ?auto_17126 ) ) ( not ( = ?auto_17120 ?auto_17119 ) ) ( CALIBRATION_TARGET ?auto_17127 ?auto_17126 ) ( POINTING ?auto_17125 ?auto_17123 ) ( not ( = ?auto_17126 ?auto_17123 ) ) ( not ( = ?auto_17118 ?auto_17123 ) ) ( not ( = ?auto_17121 ?auto_17123 ) ) ( ON_BOARD ?auto_17124 ?auto_17125 ) ( POWER_ON ?auto_17124 ) ( not ( = ?auto_17127 ?auto_17124 ) ) ( HAVE_IMAGE ?auto_17123 ?auto_17122 ) ( not ( = ?auto_17119 ?auto_17122 ) ) ( not ( = ?auto_17120 ?auto_17122 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17121 ?auto_17120 ?auto_17118 ?auto_17119 )
      ( GET-3IMAGE-VERIFY ?auto_17118 ?auto_17119 ?auto_17121 ?auto_17120 ?auto_17123 ?auto_17122 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17139 - DIRECTION
      ?auto_17140 - MODE
      ?auto_17142 - DIRECTION
      ?auto_17141 - MODE
      ?auto_17144 - DIRECTION
      ?auto_17143 - MODE
    )
    :vars
    (
      ?auto_17148 - INSTRUMENT
      ?auto_17146 - SATELLITE
      ?auto_17147 - DIRECTION
      ?auto_17145 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17148 ?auto_17146 ) ( SUPPORTS ?auto_17148 ?auto_17140 ) ( not ( = ?auto_17139 ?auto_17147 ) ) ( HAVE_IMAGE ?auto_17144 ?auto_17143 ) ( not ( = ?auto_17144 ?auto_17139 ) ) ( not ( = ?auto_17144 ?auto_17147 ) ) ( not ( = ?auto_17143 ?auto_17140 ) ) ( CALIBRATION_TARGET ?auto_17148 ?auto_17147 ) ( POINTING ?auto_17146 ?auto_17142 ) ( not ( = ?auto_17147 ?auto_17142 ) ) ( not ( = ?auto_17139 ?auto_17142 ) ) ( not ( = ?auto_17144 ?auto_17142 ) ) ( ON_BOARD ?auto_17145 ?auto_17146 ) ( POWER_ON ?auto_17145 ) ( not ( = ?auto_17148 ?auto_17145 ) ) ( HAVE_IMAGE ?auto_17142 ?auto_17141 ) ( not ( = ?auto_17140 ?auto_17141 ) ) ( not ( = ?auto_17141 ?auto_17143 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17144 ?auto_17143 ?auto_17139 ?auto_17140 )
      ( GET-3IMAGE-VERIFY ?auto_17139 ?auto_17140 ?auto_17142 ?auto_17141 ?auto_17144 ?auto_17143 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17149 - DIRECTION
      ?auto_17150 - MODE
      ?auto_17152 - DIRECTION
      ?auto_17151 - MODE
      ?auto_17154 - DIRECTION
      ?auto_17153 - MODE
    )
    :vars
    (
      ?auto_17160 - INSTRUMENT
      ?auto_17158 - SATELLITE
      ?auto_17159 - DIRECTION
      ?auto_17157 - DIRECTION
      ?auto_17156 - MODE
      ?auto_17155 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17160 ?auto_17158 ) ( SUPPORTS ?auto_17160 ?auto_17150 ) ( not ( = ?auto_17149 ?auto_17159 ) ) ( HAVE_IMAGE ?auto_17157 ?auto_17156 ) ( not ( = ?auto_17157 ?auto_17149 ) ) ( not ( = ?auto_17157 ?auto_17159 ) ) ( not ( = ?auto_17156 ?auto_17150 ) ) ( CALIBRATION_TARGET ?auto_17160 ?auto_17159 ) ( POINTING ?auto_17158 ?auto_17154 ) ( not ( = ?auto_17159 ?auto_17154 ) ) ( not ( = ?auto_17149 ?auto_17154 ) ) ( not ( = ?auto_17157 ?auto_17154 ) ) ( ON_BOARD ?auto_17155 ?auto_17158 ) ( POWER_ON ?auto_17155 ) ( not ( = ?auto_17160 ?auto_17155 ) ) ( HAVE_IMAGE ?auto_17152 ?auto_17151 ) ( HAVE_IMAGE ?auto_17154 ?auto_17153 ) ( not ( = ?auto_17149 ?auto_17152 ) ) ( not ( = ?auto_17150 ?auto_17151 ) ) ( not ( = ?auto_17150 ?auto_17153 ) ) ( not ( = ?auto_17152 ?auto_17154 ) ) ( not ( = ?auto_17152 ?auto_17159 ) ) ( not ( = ?auto_17152 ?auto_17157 ) ) ( not ( = ?auto_17151 ?auto_17153 ) ) ( not ( = ?auto_17151 ?auto_17156 ) ) ( not ( = ?auto_17153 ?auto_17156 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17157 ?auto_17156 ?auto_17149 ?auto_17150 )
      ( GET-3IMAGE-VERIFY ?auto_17149 ?auto_17150 ?auto_17152 ?auto_17151 ?auto_17154 ?auto_17153 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_17209 - DIRECTION
      ?auto_17210 - MODE
    )
    :vars
    (
      ?auto_17216 - INSTRUMENT
      ?auto_17214 - SATELLITE
      ?auto_17215 - DIRECTION
      ?auto_17213 - DIRECTION
      ?auto_17212 - MODE
      ?auto_17217 - DIRECTION
      ?auto_17211 - INSTRUMENT
      ?auto_17218 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_17216 ?auto_17214 ) ( SUPPORTS ?auto_17216 ?auto_17210 ) ( not ( = ?auto_17209 ?auto_17215 ) ) ( HAVE_IMAGE ?auto_17213 ?auto_17212 ) ( not ( = ?auto_17213 ?auto_17209 ) ) ( not ( = ?auto_17213 ?auto_17215 ) ) ( not ( = ?auto_17212 ?auto_17210 ) ) ( CALIBRATION_TARGET ?auto_17216 ?auto_17215 ) ( POINTING ?auto_17214 ?auto_17217 ) ( not ( = ?auto_17215 ?auto_17217 ) ) ( not ( = ?auto_17209 ?auto_17217 ) ) ( not ( = ?auto_17213 ?auto_17217 ) ) ( ON_BOARD ?auto_17211 ?auto_17214 ) ( POWER_ON ?auto_17211 ) ( not ( = ?auto_17216 ?auto_17211 ) ) ( CALIBRATED ?auto_17211 ) ( SUPPORTS ?auto_17211 ?auto_17218 ) ( not ( = ?auto_17212 ?auto_17218 ) ) ( not ( = ?auto_17210 ?auto_17218 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17213 ?auto_17212 ?auto_17217 ?auto_17218 )
      ( GET-2IMAGE ?auto_17213 ?auto_17212 ?auto_17209 ?auto_17210 )
      ( GET-1IMAGE-VERIFY ?auto_17209 ?auto_17210 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_17219 - DIRECTION
      ?auto_17220 - MODE
      ?auto_17222 - DIRECTION
      ?auto_17221 - MODE
    )
    :vars
    (
      ?auto_17224 - INSTRUMENT
      ?auto_17228 - SATELLITE
      ?auto_17227 - DIRECTION
      ?auto_17225 - DIRECTION
      ?auto_17226 - INSTRUMENT
      ?auto_17223 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_17224 ?auto_17228 ) ( SUPPORTS ?auto_17224 ?auto_17221 ) ( not ( = ?auto_17222 ?auto_17227 ) ) ( HAVE_IMAGE ?auto_17219 ?auto_17220 ) ( not ( = ?auto_17219 ?auto_17222 ) ) ( not ( = ?auto_17219 ?auto_17227 ) ) ( not ( = ?auto_17220 ?auto_17221 ) ) ( CALIBRATION_TARGET ?auto_17224 ?auto_17227 ) ( POINTING ?auto_17228 ?auto_17225 ) ( not ( = ?auto_17227 ?auto_17225 ) ) ( not ( = ?auto_17222 ?auto_17225 ) ) ( not ( = ?auto_17219 ?auto_17225 ) ) ( ON_BOARD ?auto_17226 ?auto_17228 ) ( POWER_ON ?auto_17226 ) ( not ( = ?auto_17224 ?auto_17226 ) ) ( CALIBRATED ?auto_17226 ) ( SUPPORTS ?auto_17226 ?auto_17223 ) ( not ( = ?auto_17220 ?auto_17223 ) ) ( not ( = ?auto_17221 ?auto_17223 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_17222 ?auto_17221 )
      ( GET-2IMAGE-VERIFY ?auto_17219 ?auto_17220 ?auto_17222 ?auto_17221 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_17229 - DIRECTION
      ?auto_17230 - MODE
      ?auto_17232 - DIRECTION
      ?auto_17231 - MODE
    )
    :vars
    (
      ?auto_17236 - INSTRUMENT
      ?auto_17234 - SATELLITE
      ?auto_17233 - DIRECTION
      ?auto_17238 - DIRECTION
      ?auto_17237 - MODE
      ?auto_17235 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17236 ?auto_17234 ) ( SUPPORTS ?auto_17236 ?auto_17231 ) ( not ( = ?auto_17232 ?auto_17233 ) ) ( HAVE_IMAGE ?auto_17238 ?auto_17237 ) ( not ( = ?auto_17238 ?auto_17232 ) ) ( not ( = ?auto_17238 ?auto_17233 ) ) ( not ( = ?auto_17237 ?auto_17231 ) ) ( CALIBRATION_TARGET ?auto_17236 ?auto_17233 ) ( POINTING ?auto_17234 ?auto_17229 ) ( not ( = ?auto_17233 ?auto_17229 ) ) ( not ( = ?auto_17232 ?auto_17229 ) ) ( not ( = ?auto_17238 ?auto_17229 ) ) ( ON_BOARD ?auto_17235 ?auto_17234 ) ( POWER_ON ?auto_17235 ) ( not ( = ?auto_17236 ?auto_17235 ) ) ( CALIBRATED ?auto_17235 ) ( SUPPORTS ?auto_17235 ?auto_17230 ) ( not ( = ?auto_17237 ?auto_17230 ) ) ( not ( = ?auto_17231 ?auto_17230 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17238 ?auto_17237 ?auto_17232 ?auto_17231 )
      ( GET-2IMAGE-VERIFY ?auto_17229 ?auto_17230 ?auto_17232 ?auto_17231 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_17239 - DIRECTION
      ?auto_17240 - MODE
      ?auto_17242 - DIRECTION
      ?auto_17241 - MODE
    )
    :vars
    (
      ?auto_17247 - INSTRUMENT
      ?auto_17245 - SATELLITE
      ?auto_17244 - DIRECTION
      ?auto_17243 - DIRECTION
      ?auto_17246 - INSTRUMENT
      ?auto_17248 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_17247 ?auto_17245 ) ( SUPPORTS ?auto_17247 ?auto_17240 ) ( not ( = ?auto_17239 ?auto_17244 ) ) ( HAVE_IMAGE ?auto_17242 ?auto_17241 ) ( not ( = ?auto_17242 ?auto_17239 ) ) ( not ( = ?auto_17242 ?auto_17244 ) ) ( not ( = ?auto_17241 ?auto_17240 ) ) ( CALIBRATION_TARGET ?auto_17247 ?auto_17244 ) ( POINTING ?auto_17245 ?auto_17243 ) ( not ( = ?auto_17244 ?auto_17243 ) ) ( not ( = ?auto_17239 ?auto_17243 ) ) ( not ( = ?auto_17242 ?auto_17243 ) ) ( ON_BOARD ?auto_17246 ?auto_17245 ) ( POWER_ON ?auto_17246 ) ( not ( = ?auto_17247 ?auto_17246 ) ) ( CALIBRATED ?auto_17246 ) ( SUPPORTS ?auto_17246 ?auto_17248 ) ( not ( = ?auto_17241 ?auto_17248 ) ) ( not ( = ?auto_17240 ?auto_17248 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17242 ?auto_17241 ?auto_17239 ?auto_17240 )
      ( GET-2IMAGE-VERIFY ?auto_17239 ?auto_17240 ?auto_17242 ?auto_17241 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_17249 - DIRECTION
      ?auto_17250 - MODE
      ?auto_17252 - DIRECTION
      ?auto_17251 - MODE
    )
    :vars
    (
      ?auto_17256 - INSTRUMENT
      ?auto_17254 - SATELLITE
      ?auto_17253 - DIRECTION
      ?auto_17258 - DIRECTION
      ?auto_17257 - MODE
      ?auto_17255 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17256 ?auto_17254 ) ( SUPPORTS ?auto_17256 ?auto_17250 ) ( not ( = ?auto_17249 ?auto_17253 ) ) ( HAVE_IMAGE ?auto_17258 ?auto_17257 ) ( not ( = ?auto_17258 ?auto_17249 ) ) ( not ( = ?auto_17258 ?auto_17253 ) ) ( not ( = ?auto_17257 ?auto_17250 ) ) ( CALIBRATION_TARGET ?auto_17256 ?auto_17253 ) ( POINTING ?auto_17254 ?auto_17252 ) ( not ( = ?auto_17253 ?auto_17252 ) ) ( not ( = ?auto_17249 ?auto_17252 ) ) ( not ( = ?auto_17258 ?auto_17252 ) ) ( ON_BOARD ?auto_17255 ?auto_17254 ) ( POWER_ON ?auto_17255 ) ( not ( = ?auto_17256 ?auto_17255 ) ) ( CALIBRATED ?auto_17255 ) ( SUPPORTS ?auto_17255 ?auto_17251 ) ( not ( = ?auto_17257 ?auto_17251 ) ) ( not ( = ?auto_17250 ?auto_17251 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17258 ?auto_17257 ?auto_17249 ?auto_17250 )
      ( GET-2IMAGE-VERIFY ?auto_17249 ?auto_17250 ?auto_17252 ?auto_17251 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17271 - DIRECTION
      ?auto_17272 - MODE
      ?auto_17274 - DIRECTION
      ?auto_17273 - MODE
      ?auto_17276 - DIRECTION
      ?auto_17275 - MODE
    )
    :vars
    (
      ?auto_17281 - INSTRUMENT
      ?auto_17279 - SATELLITE
      ?auto_17278 - DIRECTION
      ?auto_17277 - DIRECTION
      ?auto_17280 - INSTRUMENT
      ?auto_17282 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_17281 ?auto_17279 ) ( SUPPORTS ?auto_17281 ?auto_17275 ) ( not ( = ?auto_17276 ?auto_17278 ) ) ( HAVE_IMAGE ?auto_17271 ?auto_17273 ) ( not ( = ?auto_17271 ?auto_17276 ) ) ( not ( = ?auto_17271 ?auto_17278 ) ) ( not ( = ?auto_17273 ?auto_17275 ) ) ( CALIBRATION_TARGET ?auto_17281 ?auto_17278 ) ( POINTING ?auto_17279 ?auto_17277 ) ( not ( = ?auto_17278 ?auto_17277 ) ) ( not ( = ?auto_17276 ?auto_17277 ) ) ( not ( = ?auto_17271 ?auto_17277 ) ) ( ON_BOARD ?auto_17280 ?auto_17279 ) ( POWER_ON ?auto_17280 ) ( not ( = ?auto_17281 ?auto_17280 ) ) ( CALIBRATED ?auto_17280 ) ( SUPPORTS ?auto_17280 ?auto_17282 ) ( not ( = ?auto_17273 ?auto_17282 ) ) ( not ( = ?auto_17275 ?auto_17282 ) ) ( HAVE_IMAGE ?auto_17271 ?auto_17272 ) ( HAVE_IMAGE ?auto_17274 ?auto_17273 ) ( not ( = ?auto_17271 ?auto_17274 ) ) ( not ( = ?auto_17272 ?auto_17273 ) ) ( not ( = ?auto_17272 ?auto_17275 ) ) ( not ( = ?auto_17272 ?auto_17282 ) ) ( not ( = ?auto_17274 ?auto_17276 ) ) ( not ( = ?auto_17274 ?auto_17278 ) ) ( not ( = ?auto_17274 ?auto_17277 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17271 ?auto_17273 ?auto_17276 ?auto_17275 )
      ( GET-3IMAGE-VERIFY ?auto_17271 ?auto_17272 ?auto_17274 ?auto_17273 ?auto_17276 ?auto_17275 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17283 - DIRECTION
      ?auto_17284 - MODE
      ?auto_17286 - DIRECTION
      ?auto_17285 - MODE
      ?auto_17288 - DIRECTION
      ?auto_17287 - MODE
    )
    :vars
    (
      ?auto_17292 - INSTRUMENT
      ?auto_17290 - SATELLITE
      ?auto_17289 - DIRECTION
      ?auto_17291 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17292 ?auto_17290 ) ( SUPPORTS ?auto_17292 ?auto_17287 ) ( not ( = ?auto_17288 ?auto_17289 ) ) ( HAVE_IMAGE ?auto_17283 ?auto_17284 ) ( not ( = ?auto_17283 ?auto_17288 ) ) ( not ( = ?auto_17283 ?auto_17289 ) ) ( not ( = ?auto_17284 ?auto_17287 ) ) ( CALIBRATION_TARGET ?auto_17292 ?auto_17289 ) ( POINTING ?auto_17290 ?auto_17286 ) ( not ( = ?auto_17289 ?auto_17286 ) ) ( not ( = ?auto_17288 ?auto_17286 ) ) ( not ( = ?auto_17283 ?auto_17286 ) ) ( ON_BOARD ?auto_17291 ?auto_17290 ) ( POWER_ON ?auto_17291 ) ( not ( = ?auto_17292 ?auto_17291 ) ) ( CALIBRATED ?auto_17291 ) ( SUPPORTS ?auto_17291 ?auto_17285 ) ( not ( = ?auto_17284 ?auto_17285 ) ) ( not ( = ?auto_17287 ?auto_17285 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17283 ?auto_17284 ?auto_17288 ?auto_17287 )
      ( GET-3IMAGE-VERIFY ?auto_17283 ?auto_17284 ?auto_17286 ?auto_17285 ?auto_17288 ?auto_17287 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17293 - DIRECTION
      ?auto_17294 - MODE
      ?auto_17296 - DIRECTION
      ?auto_17295 - MODE
      ?auto_17298 - DIRECTION
      ?auto_17297 - MODE
    )
    :vars
    (
      ?auto_17303 - INSTRUMENT
      ?auto_17301 - SATELLITE
      ?auto_17300 - DIRECTION
      ?auto_17299 - DIRECTION
      ?auto_17302 - INSTRUMENT
      ?auto_17304 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_17303 ?auto_17301 ) ( SUPPORTS ?auto_17303 ?auto_17295 ) ( not ( = ?auto_17296 ?auto_17300 ) ) ( HAVE_IMAGE ?auto_17298 ?auto_17297 ) ( not ( = ?auto_17298 ?auto_17296 ) ) ( not ( = ?auto_17298 ?auto_17300 ) ) ( not ( = ?auto_17297 ?auto_17295 ) ) ( CALIBRATION_TARGET ?auto_17303 ?auto_17300 ) ( POINTING ?auto_17301 ?auto_17299 ) ( not ( = ?auto_17300 ?auto_17299 ) ) ( not ( = ?auto_17296 ?auto_17299 ) ) ( not ( = ?auto_17298 ?auto_17299 ) ) ( ON_BOARD ?auto_17302 ?auto_17301 ) ( POWER_ON ?auto_17302 ) ( not ( = ?auto_17303 ?auto_17302 ) ) ( CALIBRATED ?auto_17302 ) ( SUPPORTS ?auto_17302 ?auto_17304 ) ( not ( = ?auto_17297 ?auto_17304 ) ) ( not ( = ?auto_17295 ?auto_17304 ) ) ( HAVE_IMAGE ?auto_17293 ?auto_17294 ) ( not ( = ?auto_17293 ?auto_17296 ) ) ( not ( = ?auto_17293 ?auto_17298 ) ) ( not ( = ?auto_17293 ?auto_17300 ) ) ( not ( = ?auto_17293 ?auto_17299 ) ) ( not ( = ?auto_17294 ?auto_17295 ) ) ( not ( = ?auto_17294 ?auto_17297 ) ) ( not ( = ?auto_17294 ?auto_17304 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17298 ?auto_17297 ?auto_17296 ?auto_17295 )
      ( GET-3IMAGE-VERIFY ?auto_17293 ?auto_17294 ?auto_17296 ?auto_17295 ?auto_17298 ?auto_17297 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17305 - DIRECTION
      ?auto_17306 - MODE
      ?auto_17308 - DIRECTION
      ?auto_17307 - MODE
      ?auto_17310 - DIRECTION
      ?auto_17309 - MODE
    )
    :vars
    (
      ?auto_17314 - INSTRUMENT
      ?auto_17312 - SATELLITE
      ?auto_17311 - DIRECTION
      ?auto_17313 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17314 ?auto_17312 ) ( SUPPORTS ?auto_17314 ?auto_17307 ) ( not ( = ?auto_17308 ?auto_17311 ) ) ( HAVE_IMAGE ?auto_17305 ?auto_17306 ) ( not ( = ?auto_17305 ?auto_17308 ) ) ( not ( = ?auto_17305 ?auto_17311 ) ) ( not ( = ?auto_17306 ?auto_17307 ) ) ( CALIBRATION_TARGET ?auto_17314 ?auto_17311 ) ( POINTING ?auto_17312 ?auto_17310 ) ( not ( = ?auto_17311 ?auto_17310 ) ) ( not ( = ?auto_17308 ?auto_17310 ) ) ( not ( = ?auto_17305 ?auto_17310 ) ) ( ON_BOARD ?auto_17313 ?auto_17312 ) ( POWER_ON ?auto_17313 ) ( not ( = ?auto_17314 ?auto_17313 ) ) ( CALIBRATED ?auto_17313 ) ( SUPPORTS ?auto_17313 ?auto_17309 ) ( not ( = ?auto_17306 ?auto_17309 ) ) ( not ( = ?auto_17307 ?auto_17309 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17305 ?auto_17306 ?auto_17308 ?auto_17307 )
      ( GET-3IMAGE-VERIFY ?auto_17305 ?auto_17306 ?auto_17308 ?auto_17307 ?auto_17310 ?auto_17309 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17327 - DIRECTION
      ?auto_17328 - MODE
      ?auto_17330 - DIRECTION
      ?auto_17329 - MODE
      ?auto_17332 - DIRECTION
      ?auto_17331 - MODE
    )
    :vars
    (
      ?auto_17336 - INSTRUMENT
      ?auto_17334 - SATELLITE
      ?auto_17333 - DIRECTION
      ?auto_17335 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17336 ?auto_17334 ) ( SUPPORTS ?auto_17336 ?auto_17331 ) ( not ( = ?auto_17332 ?auto_17333 ) ) ( HAVE_IMAGE ?auto_17330 ?auto_17329 ) ( not ( = ?auto_17330 ?auto_17332 ) ) ( not ( = ?auto_17330 ?auto_17333 ) ) ( not ( = ?auto_17329 ?auto_17331 ) ) ( CALIBRATION_TARGET ?auto_17336 ?auto_17333 ) ( POINTING ?auto_17334 ?auto_17327 ) ( not ( = ?auto_17333 ?auto_17327 ) ) ( not ( = ?auto_17332 ?auto_17327 ) ) ( not ( = ?auto_17330 ?auto_17327 ) ) ( ON_BOARD ?auto_17335 ?auto_17334 ) ( POWER_ON ?auto_17335 ) ( not ( = ?auto_17336 ?auto_17335 ) ) ( CALIBRATED ?auto_17335 ) ( SUPPORTS ?auto_17335 ?auto_17328 ) ( not ( = ?auto_17329 ?auto_17328 ) ) ( not ( = ?auto_17331 ?auto_17328 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17330 ?auto_17329 ?auto_17332 ?auto_17331 )
      ( GET-3IMAGE-VERIFY ?auto_17327 ?auto_17328 ?auto_17330 ?auto_17329 ?auto_17332 ?auto_17331 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17349 - DIRECTION
      ?auto_17350 - MODE
      ?auto_17352 - DIRECTION
      ?auto_17351 - MODE
      ?auto_17354 - DIRECTION
      ?auto_17353 - MODE
    )
    :vars
    (
      ?auto_17358 - INSTRUMENT
      ?auto_17356 - SATELLITE
      ?auto_17355 - DIRECTION
      ?auto_17357 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17358 ?auto_17356 ) ( SUPPORTS ?auto_17358 ?auto_17351 ) ( not ( = ?auto_17352 ?auto_17355 ) ) ( HAVE_IMAGE ?auto_17354 ?auto_17353 ) ( not ( = ?auto_17354 ?auto_17352 ) ) ( not ( = ?auto_17354 ?auto_17355 ) ) ( not ( = ?auto_17353 ?auto_17351 ) ) ( CALIBRATION_TARGET ?auto_17358 ?auto_17355 ) ( POINTING ?auto_17356 ?auto_17349 ) ( not ( = ?auto_17355 ?auto_17349 ) ) ( not ( = ?auto_17352 ?auto_17349 ) ) ( not ( = ?auto_17354 ?auto_17349 ) ) ( ON_BOARD ?auto_17357 ?auto_17356 ) ( POWER_ON ?auto_17357 ) ( not ( = ?auto_17358 ?auto_17357 ) ) ( CALIBRATED ?auto_17357 ) ( SUPPORTS ?auto_17357 ?auto_17350 ) ( not ( = ?auto_17353 ?auto_17350 ) ) ( not ( = ?auto_17351 ?auto_17350 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17354 ?auto_17353 ?auto_17352 ?auto_17351 )
      ( GET-3IMAGE-VERIFY ?auto_17349 ?auto_17350 ?auto_17352 ?auto_17351 ?auto_17354 ?auto_17353 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17383 - DIRECTION
      ?auto_17384 - MODE
      ?auto_17386 - DIRECTION
      ?auto_17385 - MODE
      ?auto_17388 - DIRECTION
      ?auto_17387 - MODE
    )
    :vars
    (
      ?auto_17393 - INSTRUMENT
      ?auto_17391 - SATELLITE
      ?auto_17390 - DIRECTION
      ?auto_17389 - DIRECTION
      ?auto_17392 - INSTRUMENT
      ?auto_17394 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_17393 ?auto_17391 ) ( SUPPORTS ?auto_17393 ?auto_17384 ) ( not ( = ?auto_17383 ?auto_17390 ) ) ( HAVE_IMAGE ?auto_17386 ?auto_17387 ) ( not ( = ?auto_17386 ?auto_17383 ) ) ( not ( = ?auto_17386 ?auto_17390 ) ) ( not ( = ?auto_17387 ?auto_17384 ) ) ( CALIBRATION_TARGET ?auto_17393 ?auto_17390 ) ( POINTING ?auto_17391 ?auto_17389 ) ( not ( = ?auto_17390 ?auto_17389 ) ) ( not ( = ?auto_17383 ?auto_17389 ) ) ( not ( = ?auto_17386 ?auto_17389 ) ) ( ON_BOARD ?auto_17392 ?auto_17391 ) ( POWER_ON ?auto_17392 ) ( not ( = ?auto_17393 ?auto_17392 ) ) ( CALIBRATED ?auto_17392 ) ( SUPPORTS ?auto_17392 ?auto_17394 ) ( not ( = ?auto_17387 ?auto_17394 ) ) ( not ( = ?auto_17384 ?auto_17394 ) ) ( HAVE_IMAGE ?auto_17386 ?auto_17385 ) ( HAVE_IMAGE ?auto_17388 ?auto_17387 ) ( not ( = ?auto_17383 ?auto_17388 ) ) ( not ( = ?auto_17384 ?auto_17385 ) ) ( not ( = ?auto_17386 ?auto_17388 ) ) ( not ( = ?auto_17385 ?auto_17387 ) ) ( not ( = ?auto_17385 ?auto_17394 ) ) ( not ( = ?auto_17388 ?auto_17390 ) ) ( not ( = ?auto_17388 ?auto_17389 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17386 ?auto_17387 ?auto_17383 ?auto_17384 )
      ( GET-3IMAGE-VERIFY ?auto_17383 ?auto_17384 ?auto_17386 ?auto_17385 ?auto_17388 ?auto_17387 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17395 - DIRECTION
      ?auto_17396 - MODE
      ?auto_17398 - DIRECTION
      ?auto_17397 - MODE
      ?auto_17400 - DIRECTION
      ?auto_17399 - MODE
    )
    :vars
    (
      ?auto_17404 - INSTRUMENT
      ?auto_17402 - SATELLITE
      ?auto_17401 - DIRECTION
      ?auto_17403 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17404 ?auto_17402 ) ( SUPPORTS ?auto_17404 ?auto_17396 ) ( not ( = ?auto_17395 ?auto_17401 ) ) ( HAVE_IMAGE ?auto_17398 ?auto_17397 ) ( not ( = ?auto_17398 ?auto_17395 ) ) ( not ( = ?auto_17398 ?auto_17401 ) ) ( not ( = ?auto_17397 ?auto_17396 ) ) ( CALIBRATION_TARGET ?auto_17404 ?auto_17401 ) ( POINTING ?auto_17402 ?auto_17400 ) ( not ( = ?auto_17401 ?auto_17400 ) ) ( not ( = ?auto_17395 ?auto_17400 ) ) ( not ( = ?auto_17398 ?auto_17400 ) ) ( ON_BOARD ?auto_17403 ?auto_17402 ) ( POWER_ON ?auto_17403 ) ( not ( = ?auto_17404 ?auto_17403 ) ) ( CALIBRATED ?auto_17403 ) ( SUPPORTS ?auto_17403 ?auto_17399 ) ( not ( = ?auto_17397 ?auto_17399 ) ) ( not ( = ?auto_17396 ?auto_17399 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17398 ?auto_17397 ?auto_17395 ?auto_17396 )
      ( GET-3IMAGE-VERIFY ?auto_17395 ?auto_17396 ?auto_17398 ?auto_17397 ?auto_17400 ?auto_17399 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17417 - DIRECTION
      ?auto_17418 - MODE
      ?auto_17420 - DIRECTION
      ?auto_17419 - MODE
      ?auto_17422 - DIRECTION
      ?auto_17421 - MODE
    )
    :vars
    (
      ?auto_17426 - INSTRUMENT
      ?auto_17424 - SATELLITE
      ?auto_17423 - DIRECTION
      ?auto_17425 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17426 ?auto_17424 ) ( SUPPORTS ?auto_17426 ?auto_17418 ) ( not ( = ?auto_17417 ?auto_17423 ) ) ( HAVE_IMAGE ?auto_17422 ?auto_17421 ) ( not ( = ?auto_17422 ?auto_17417 ) ) ( not ( = ?auto_17422 ?auto_17423 ) ) ( not ( = ?auto_17421 ?auto_17418 ) ) ( CALIBRATION_TARGET ?auto_17426 ?auto_17423 ) ( POINTING ?auto_17424 ?auto_17420 ) ( not ( = ?auto_17423 ?auto_17420 ) ) ( not ( = ?auto_17417 ?auto_17420 ) ) ( not ( = ?auto_17422 ?auto_17420 ) ) ( ON_BOARD ?auto_17425 ?auto_17424 ) ( POWER_ON ?auto_17425 ) ( not ( = ?auto_17426 ?auto_17425 ) ) ( CALIBRATED ?auto_17425 ) ( SUPPORTS ?auto_17425 ?auto_17419 ) ( not ( = ?auto_17421 ?auto_17419 ) ) ( not ( = ?auto_17418 ?auto_17419 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17422 ?auto_17421 ?auto_17417 ?auto_17418 )
      ( GET-3IMAGE-VERIFY ?auto_17417 ?auto_17418 ?auto_17420 ?auto_17419 ?auto_17422 ?auto_17421 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_17489 - DIRECTION
      ?auto_17490 - MODE
    )
    :vars
    (
      ?auto_17495 - INSTRUMENT
      ?auto_17493 - SATELLITE
      ?auto_17492 - DIRECTION
      ?auto_17498 - DIRECTION
      ?auto_17497 - MODE
      ?auto_17491 - DIRECTION
      ?auto_17494 - INSTRUMENT
      ?auto_17496 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_17495 ?auto_17493 ) ( SUPPORTS ?auto_17495 ?auto_17490 ) ( not ( = ?auto_17489 ?auto_17492 ) ) ( HAVE_IMAGE ?auto_17498 ?auto_17497 ) ( not ( = ?auto_17498 ?auto_17489 ) ) ( not ( = ?auto_17498 ?auto_17492 ) ) ( not ( = ?auto_17497 ?auto_17490 ) ) ( CALIBRATION_TARGET ?auto_17495 ?auto_17492 ) ( not ( = ?auto_17492 ?auto_17491 ) ) ( not ( = ?auto_17489 ?auto_17491 ) ) ( not ( = ?auto_17498 ?auto_17491 ) ) ( ON_BOARD ?auto_17494 ?auto_17493 ) ( POWER_ON ?auto_17494 ) ( not ( = ?auto_17495 ?auto_17494 ) ) ( CALIBRATED ?auto_17494 ) ( SUPPORTS ?auto_17494 ?auto_17496 ) ( not ( = ?auto_17497 ?auto_17496 ) ) ( not ( = ?auto_17490 ?auto_17496 ) ) ( POINTING ?auto_17493 ?auto_17492 ) )
    :subtasks
    ( ( !TURN_TO ?auto_17493 ?auto_17491 ?auto_17492 )
      ( GET-2IMAGE ?auto_17498 ?auto_17497 ?auto_17489 ?auto_17490 )
      ( GET-1IMAGE-VERIFY ?auto_17489 ?auto_17490 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_17499 - DIRECTION
      ?auto_17500 - MODE
      ?auto_17502 - DIRECTION
      ?auto_17501 - MODE
    )
    :vars
    (
      ?auto_17503 - INSTRUMENT
      ?auto_17507 - SATELLITE
      ?auto_17505 - DIRECTION
      ?auto_17504 - DIRECTION
      ?auto_17508 - INSTRUMENT
      ?auto_17506 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_17503 ?auto_17507 ) ( SUPPORTS ?auto_17503 ?auto_17501 ) ( not ( = ?auto_17502 ?auto_17505 ) ) ( HAVE_IMAGE ?auto_17499 ?auto_17500 ) ( not ( = ?auto_17499 ?auto_17502 ) ) ( not ( = ?auto_17499 ?auto_17505 ) ) ( not ( = ?auto_17500 ?auto_17501 ) ) ( CALIBRATION_TARGET ?auto_17503 ?auto_17505 ) ( not ( = ?auto_17505 ?auto_17504 ) ) ( not ( = ?auto_17502 ?auto_17504 ) ) ( not ( = ?auto_17499 ?auto_17504 ) ) ( ON_BOARD ?auto_17508 ?auto_17507 ) ( POWER_ON ?auto_17508 ) ( not ( = ?auto_17503 ?auto_17508 ) ) ( CALIBRATED ?auto_17508 ) ( SUPPORTS ?auto_17508 ?auto_17506 ) ( not ( = ?auto_17500 ?auto_17506 ) ) ( not ( = ?auto_17501 ?auto_17506 ) ) ( POINTING ?auto_17507 ?auto_17505 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_17502 ?auto_17501 )
      ( GET-2IMAGE-VERIFY ?auto_17499 ?auto_17500 ?auto_17502 ?auto_17501 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_17509 - DIRECTION
      ?auto_17510 - MODE
      ?auto_17512 - DIRECTION
      ?auto_17511 - MODE
    )
    :vars
    (
      ?auto_17517 - INSTRUMENT
      ?auto_17518 - SATELLITE
      ?auto_17513 - DIRECTION
      ?auto_17515 - DIRECTION
      ?auto_17514 - MODE
      ?auto_17516 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17517 ?auto_17518 ) ( SUPPORTS ?auto_17517 ?auto_17511 ) ( not ( = ?auto_17512 ?auto_17513 ) ) ( HAVE_IMAGE ?auto_17515 ?auto_17514 ) ( not ( = ?auto_17515 ?auto_17512 ) ) ( not ( = ?auto_17515 ?auto_17513 ) ) ( not ( = ?auto_17514 ?auto_17511 ) ) ( CALIBRATION_TARGET ?auto_17517 ?auto_17513 ) ( not ( = ?auto_17513 ?auto_17509 ) ) ( not ( = ?auto_17512 ?auto_17509 ) ) ( not ( = ?auto_17515 ?auto_17509 ) ) ( ON_BOARD ?auto_17516 ?auto_17518 ) ( POWER_ON ?auto_17516 ) ( not ( = ?auto_17517 ?auto_17516 ) ) ( CALIBRATED ?auto_17516 ) ( SUPPORTS ?auto_17516 ?auto_17510 ) ( not ( = ?auto_17514 ?auto_17510 ) ) ( not ( = ?auto_17511 ?auto_17510 ) ) ( POINTING ?auto_17518 ?auto_17513 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17515 ?auto_17514 ?auto_17512 ?auto_17511 )
      ( GET-2IMAGE-VERIFY ?auto_17509 ?auto_17510 ?auto_17512 ?auto_17511 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_17519 - DIRECTION
      ?auto_17520 - MODE
      ?auto_17522 - DIRECTION
      ?auto_17521 - MODE
    )
    :vars
    (
      ?auto_17527 - INSTRUMENT
      ?auto_17528 - SATELLITE
      ?auto_17525 - DIRECTION
      ?auto_17524 - DIRECTION
      ?auto_17526 - INSTRUMENT
      ?auto_17523 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_17527 ?auto_17528 ) ( SUPPORTS ?auto_17527 ?auto_17520 ) ( not ( = ?auto_17519 ?auto_17525 ) ) ( HAVE_IMAGE ?auto_17522 ?auto_17521 ) ( not ( = ?auto_17522 ?auto_17519 ) ) ( not ( = ?auto_17522 ?auto_17525 ) ) ( not ( = ?auto_17521 ?auto_17520 ) ) ( CALIBRATION_TARGET ?auto_17527 ?auto_17525 ) ( not ( = ?auto_17525 ?auto_17524 ) ) ( not ( = ?auto_17519 ?auto_17524 ) ) ( not ( = ?auto_17522 ?auto_17524 ) ) ( ON_BOARD ?auto_17526 ?auto_17528 ) ( POWER_ON ?auto_17526 ) ( not ( = ?auto_17527 ?auto_17526 ) ) ( CALIBRATED ?auto_17526 ) ( SUPPORTS ?auto_17526 ?auto_17523 ) ( not ( = ?auto_17521 ?auto_17523 ) ) ( not ( = ?auto_17520 ?auto_17523 ) ) ( POINTING ?auto_17528 ?auto_17525 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17522 ?auto_17521 ?auto_17519 ?auto_17520 )
      ( GET-2IMAGE-VERIFY ?auto_17519 ?auto_17520 ?auto_17522 ?auto_17521 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_17529 - DIRECTION
      ?auto_17530 - MODE
      ?auto_17532 - DIRECTION
      ?auto_17531 - MODE
    )
    :vars
    (
      ?auto_17537 - INSTRUMENT
      ?auto_17538 - SATELLITE
      ?auto_17533 - DIRECTION
      ?auto_17535 - DIRECTION
      ?auto_17534 - MODE
      ?auto_17536 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17537 ?auto_17538 ) ( SUPPORTS ?auto_17537 ?auto_17530 ) ( not ( = ?auto_17529 ?auto_17533 ) ) ( HAVE_IMAGE ?auto_17535 ?auto_17534 ) ( not ( = ?auto_17535 ?auto_17529 ) ) ( not ( = ?auto_17535 ?auto_17533 ) ) ( not ( = ?auto_17534 ?auto_17530 ) ) ( CALIBRATION_TARGET ?auto_17537 ?auto_17533 ) ( not ( = ?auto_17533 ?auto_17532 ) ) ( not ( = ?auto_17529 ?auto_17532 ) ) ( not ( = ?auto_17535 ?auto_17532 ) ) ( ON_BOARD ?auto_17536 ?auto_17538 ) ( POWER_ON ?auto_17536 ) ( not ( = ?auto_17537 ?auto_17536 ) ) ( CALIBRATED ?auto_17536 ) ( SUPPORTS ?auto_17536 ?auto_17531 ) ( not ( = ?auto_17534 ?auto_17531 ) ) ( not ( = ?auto_17530 ?auto_17531 ) ) ( POINTING ?auto_17538 ?auto_17533 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17535 ?auto_17534 ?auto_17529 ?auto_17530 )
      ( GET-2IMAGE-VERIFY ?auto_17529 ?auto_17530 ?auto_17532 ?auto_17531 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17551 - DIRECTION
      ?auto_17552 - MODE
      ?auto_17554 - DIRECTION
      ?auto_17553 - MODE
      ?auto_17556 - DIRECTION
      ?auto_17555 - MODE
    )
    :vars
    (
      ?auto_17561 - INSTRUMENT
      ?auto_17562 - SATELLITE
      ?auto_17559 - DIRECTION
      ?auto_17558 - DIRECTION
      ?auto_17560 - INSTRUMENT
      ?auto_17557 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_17561 ?auto_17562 ) ( SUPPORTS ?auto_17561 ?auto_17555 ) ( not ( = ?auto_17556 ?auto_17559 ) ) ( HAVE_IMAGE ?auto_17554 ?auto_17553 ) ( not ( = ?auto_17554 ?auto_17556 ) ) ( not ( = ?auto_17554 ?auto_17559 ) ) ( not ( = ?auto_17553 ?auto_17555 ) ) ( CALIBRATION_TARGET ?auto_17561 ?auto_17559 ) ( not ( = ?auto_17559 ?auto_17558 ) ) ( not ( = ?auto_17556 ?auto_17558 ) ) ( not ( = ?auto_17554 ?auto_17558 ) ) ( ON_BOARD ?auto_17560 ?auto_17562 ) ( POWER_ON ?auto_17560 ) ( not ( = ?auto_17561 ?auto_17560 ) ) ( CALIBRATED ?auto_17560 ) ( SUPPORTS ?auto_17560 ?auto_17557 ) ( not ( = ?auto_17553 ?auto_17557 ) ) ( not ( = ?auto_17555 ?auto_17557 ) ) ( POINTING ?auto_17562 ?auto_17559 ) ( HAVE_IMAGE ?auto_17551 ?auto_17552 ) ( not ( = ?auto_17551 ?auto_17554 ) ) ( not ( = ?auto_17551 ?auto_17556 ) ) ( not ( = ?auto_17551 ?auto_17559 ) ) ( not ( = ?auto_17551 ?auto_17558 ) ) ( not ( = ?auto_17552 ?auto_17553 ) ) ( not ( = ?auto_17552 ?auto_17555 ) ) ( not ( = ?auto_17552 ?auto_17557 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17554 ?auto_17553 ?auto_17556 ?auto_17555 )
      ( GET-3IMAGE-VERIFY ?auto_17551 ?auto_17552 ?auto_17554 ?auto_17553 ?auto_17556 ?auto_17555 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17563 - DIRECTION
      ?auto_17564 - MODE
      ?auto_17566 - DIRECTION
      ?auto_17565 - MODE
      ?auto_17568 - DIRECTION
      ?auto_17567 - MODE
    )
    :vars
    (
      ?auto_17571 - INSTRUMENT
      ?auto_17572 - SATELLITE
      ?auto_17569 - DIRECTION
      ?auto_17570 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17571 ?auto_17572 ) ( SUPPORTS ?auto_17571 ?auto_17567 ) ( not ( = ?auto_17568 ?auto_17569 ) ) ( HAVE_IMAGE ?auto_17563 ?auto_17564 ) ( not ( = ?auto_17563 ?auto_17568 ) ) ( not ( = ?auto_17563 ?auto_17569 ) ) ( not ( = ?auto_17564 ?auto_17567 ) ) ( CALIBRATION_TARGET ?auto_17571 ?auto_17569 ) ( not ( = ?auto_17569 ?auto_17566 ) ) ( not ( = ?auto_17568 ?auto_17566 ) ) ( not ( = ?auto_17563 ?auto_17566 ) ) ( ON_BOARD ?auto_17570 ?auto_17572 ) ( POWER_ON ?auto_17570 ) ( not ( = ?auto_17571 ?auto_17570 ) ) ( CALIBRATED ?auto_17570 ) ( SUPPORTS ?auto_17570 ?auto_17565 ) ( not ( = ?auto_17564 ?auto_17565 ) ) ( not ( = ?auto_17567 ?auto_17565 ) ) ( POINTING ?auto_17572 ?auto_17569 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17563 ?auto_17564 ?auto_17568 ?auto_17567 )
      ( GET-3IMAGE-VERIFY ?auto_17563 ?auto_17564 ?auto_17566 ?auto_17565 ?auto_17568 ?auto_17567 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17573 - DIRECTION
      ?auto_17574 - MODE
      ?auto_17576 - DIRECTION
      ?auto_17575 - MODE
      ?auto_17578 - DIRECTION
      ?auto_17577 - MODE
    )
    :vars
    (
      ?auto_17583 - INSTRUMENT
      ?auto_17584 - SATELLITE
      ?auto_17581 - DIRECTION
      ?auto_17580 - DIRECTION
      ?auto_17582 - INSTRUMENT
      ?auto_17579 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_17583 ?auto_17584 ) ( SUPPORTS ?auto_17583 ?auto_17575 ) ( not ( = ?auto_17576 ?auto_17581 ) ) ( HAVE_IMAGE ?auto_17578 ?auto_17577 ) ( not ( = ?auto_17578 ?auto_17576 ) ) ( not ( = ?auto_17578 ?auto_17581 ) ) ( not ( = ?auto_17577 ?auto_17575 ) ) ( CALIBRATION_TARGET ?auto_17583 ?auto_17581 ) ( not ( = ?auto_17581 ?auto_17580 ) ) ( not ( = ?auto_17576 ?auto_17580 ) ) ( not ( = ?auto_17578 ?auto_17580 ) ) ( ON_BOARD ?auto_17582 ?auto_17584 ) ( POWER_ON ?auto_17582 ) ( not ( = ?auto_17583 ?auto_17582 ) ) ( CALIBRATED ?auto_17582 ) ( SUPPORTS ?auto_17582 ?auto_17579 ) ( not ( = ?auto_17577 ?auto_17579 ) ) ( not ( = ?auto_17575 ?auto_17579 ) ) ( POINTING ?auto_17584 ?auto_17581 ) ( HAVE_IMAGE ?auto_17573 ?auto_17574 ) ( not ( = ?auto_17573 ?auto_17576 ) ) ( not ( = ?auto_17573 ?auto_17578 ) ) ( not ( = ?auto_17573 ?auto_17581 ) ) ( not ( = ?auto_17573 ?auto_17580 ) ) ( not ( = ?auto_17574 ?auto_17575 ) ) ( not ( = ?auto_17574 ?auto_17577 ) ) ( not ( = ?auto_17574 ?auto_17579 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17578 ?auto_17577 ?auto_17576 ?auto_17575 )
      ( GET-3IMAGE-VERIFY ?auto_17573 ?auto_17574 ?auto_17576 ?auto_17575 ?auto_17578 ?auto_17577 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17585 - DIRECTION
      ?auto_17586 - MODE
      ?auto_17588 - DIRECTION
      ?auto_17587 - MODE
      ?auto_17590 - DIRECTION
      ?auto_17589 - MODE
    )
    :vars
    (
      ?auto_17593 - INSTRUMENT
      ?auto_17594 - SATELLITE
      ?auto_17591 - DIRECTION
      ?auto_17592 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17593 ?auto_17594 ) ( SUPPORTS ?auto_17593 ?auto_17587 ) ( not ( = ?auto_17588 ?auto_17591 ) ) ( HAVE_IMAGE ?auto_17585 ?auto_17586 ) ( not ( = ?auto_17585 ?auto_17588 ) ) ( not ( = ?auto_17585 ?auto_17591 ) ) ( not ( = ?auto_17586 ?auto_17587 ) ) ( CALIBRATION_TARGET ?auto_17593 ?auto_17591 ) ( not ( = ?auto_17591 ?auto_17590 ) ) ( not ( = ?auto_17588 ?auto_17590 ) ) ( not ( = ?auto_17585 ?auto_17590 ) ) ( ON_BOARD ?auto_17592 ?auto_17594 ) ( POWER_ON ?auto_17592 ) ( not ( = ?auto_17593 ?auto_17592 ) ) ( CALIBRATED ?auto_17592 ) ( SUPPORTS ?auto_17592 ?auto_17589 ) ( not ( = ?auto_17586 ?auto_17589 ) ) ( not ( = ?auto_17587 ?auto_17589 ) ) ( POINTING ?auto_17594 ?auto_17591 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17585 ?auto_17586 ?auto_17588 ?auto_17587 )
      ( GET-3IMAGE-VERIFY ?auto_17585 ?auto_17586 ?auto_17588 ?auto_17587 ?auto_17590 ?auto_17589 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17607 - DIRECTION
      ?auto_17608 - MODE
      ?auto_17610 - DIRECTION
      ?auto_17609 - MODE
      ?auto_17612 - DIRECTION
      ?auto_17611 - MODE
    )
    :vars
    (
      ?auto_17615 - INSTRUMENT
      ?auto_17616 - SATELLITE
      ?auto_17613 - DIRECTION
      ?auto_17614 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17615 ?auto_17616 ) ( SUPPORTS ?auto_17615 ?auto_17611 ) ( not ( = ?auto_17612 ?auto_17613 ) ) ( HAVE_IMAGE ?auto_17610 ?auto_17609 ) ( not ( = ?auto_17610 ?auto_17612 ) ) ( not ( = ?auto_17610 ?auto_17613 ) ) ( not ( = ?auto_17609 ?auto_17611 ) ) ( CALIBRATION_TARGET ?auto_17615 ?auto_17613 ) ( not ( = ?auto_17613 ?auto_17607 ) ) ( not ( = ?auto_17612 ?auto_17607 ) ) ( not ( = ?auto_17610 ?auto_17607 ) ) ( ON_BOARD ?auto_17614 ?auto_17616 ) ( POWER_ON ?auto_17614 ) ( not ( = ?auto_17615 ?auto_17614 ) ) ( CALIBRATED ?auto_17614 ) ( SUPPORTS ?auto_17614 ?auto_17608 ) ( not ( = ?auto_17609 ?auto_17608 ) ) ( not ( = ?auto_17611 ?auto_17608 ) ) ( POINTING ?auto_17616 ?auto_17613 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17610 ?auto_17609 ?auto_17612 ?auto_17611 )
      ( GET-3IMAGE-VERIFY ?auto_17607 ?auto_17608 ?auto_17610 ?auto_17609 ?auto_17612 ?auto_17611 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17629 - DIRECTION
      ?auto_17630 - MODE
      ?auto_17632 - DIRECTION
      ?auto_17631 - MODE
      ?auto_17634 - DIRECTION
      ?auto_17633 - MODE
    )
    :vars
    (
      ?auto_17637 - INSTRUMENT
      ?auto_17638 - SATELLITE
      ?auto_17635 - DIRECTION
      ?auto_17636 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17637 ?auto_17638 ) ( SUPPORTS ?auto_17637 ?auto_17631 ) ( not ( = ?auto_17632 ?auto_17635 ) ) ( HAVE_IMAGE ?auto_17634 ?auto_17633 ) ( not ( = ?auto_17634 ?auto_17632 ) ) ( not ( = ?auto_17634 ?auto_17635 ) ) ( not ( = ?auto_17633 ?auto_17631 ) ) ( CALIBRATION_TARGET ?auto_17637 ?auto_17635 ) ( not ( = ?auto_17635 ?auto_17629 ) ) ( not ( = ?auto_17632 ?auto_17629 ) ) ( not ( = ?auto_17634 ?auto_17629 ) ) ( ON_BOARD ?auto_17636 ?auto_17638 ) ( POWER_ON ?auto_17636 ) ( not ( = ?auto_17637 ?auto_17636 ) ) ( CALIBRATED ?auto_17636 ) ( SUPPORTS ?auto_17636 ?auto_17630 ) ( not ( = ?auto_17633 ?auto_17630 ) ) ( not ( = ?auto_17631 ?auto_17630 ) ) ( POINTING ?auto_17638 ?auto_17635 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17634 ?auto_17633 ?auto_17632 ?auto_17631 )
      ( GET-3IMAGE-VERIFY ?auto_17629 ?auto_17630 ?auto_17632 ?auto_17631 ?auto_17634 ?auto_17633 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17663 - DIRECTION
      ?auto_17664 - MODE
      ?auto_17666 - DIRECTION
      ?auto_17665 - MODE
      ?auto_17668 - DIRECTION
      ?auto_17667 - MODE
    )
    :vars
    (
      ?auto_17673 - INSTRUMENT
      ?auto_17674 - SATELLITE
      ?auto_17671 - DIRECTION
      ?auto_17670 - DIRECTION
      ?auto_17672 - INSTRUMENT
      ?auto_17669 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_17673 ?auto_17674 ) ( SUPPORTS ?auto_17673 ?auto_17664 ) ( not ( = ?auto_17663 ?auto_17671 ) ) ( HAVE_IMAGE ?auto_17666 ?auto_17667 ) ( not ( = ?auto_17666 ?auto_17663 ) ) ( not ( = ?auto_17666 ?auto_17671 ) ) ( not ( = ?auto_17667 ?auto_17664 ) ) ( CALIBRATION_TARGET ?auto_17673 ?auto_17671 ) ( not ( = ?auto_17671 ?auto_17670 ) ) ( not ( = ?auto_17663 ?auto_17670 ) ) ( not ( = ?auto_17666 ?auto_17670 ) ) ( ON_BOARD ?auto_17672 ?auto_17674 ) ( POWER_ON ?auto_17672 ) ( not ( = ?auto_17673 ?auto_17672 ) ) ( CALIBRATED ?auto_17672 ) ( SUPPORTS ?auto_17672 ?auto_17669 ) ( not ( = ?auto_17667 ?auto_17669 ) ) ( not ( = ?auto_17664 ?auto_17669 ) ) ( POINTING ?auto_17674 ?auto_17671 ) ( HAVE_IMAGE ?auto_17666 ?auto_17665 ) ( HAVE_IMAGE ?auto_17668 ?auto_17667 ) ( not ( = ?auto_17663 ?auto_17668 ) ) ( not ( = ?auto_17664 ?auto_17665 ) ) ( not ( = ?auto_17666 ?auto_17668 ) ) ( not ( = ?auto_17665 ?auto_17667 ) ) ( not ( = ?auto_17665 ?auto_17669 ) ) ( not ( = ?auto_17668 ?auto_17671 ) ) ( not ( = ?auto_17668 ?auto_17670 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17666 ?auto_17667 ?auto_17663 ?auto_17664 )
      ( GET-3IMAGE-VERIFY ?auto_17663 ?auto_17664 ?auto_17666 ?auto_17665 ?auto_17668 ?auto_17667 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17675 - DIRECTION
      ?auto_17676 - MODE
      ?auto_17678 - DIRECTION
      ?auto_17677 - MODE
      ?auto_17680 - DIRECTION
      ?auto_17679 - MODE
    )
    :vars
    (
      ?auto_17683 - INSTRUMENT
      ?auto_17684 - SATELLITE
      ?auto_17681 - DIRECTION
      ?auto_17682 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17683 ?auto_17684 ) ( SUPPORTS ?auto_17683 ?auto_17676 ) ( not ( = ?auto_17675 ?auto_17681 ) ) ( HAVE_IMAGE ?auto_17678 ?auto_17677 ) ( not ( = ?auto_17678 ?auto_17675 ) ) ( not ( = ?auto_17678 ?auto_17681 ) ) ( not ( = ?auto_17677 ?auto_17676 ) ) ( CALIBRATION_TARGET ?auto_17683 ?auto_17681 ) ( not ( = ?auto_17681 ?auto_17680 ) ) ( not ( = ?auto_17675 ?auto_17680 ) ) ( not ( = ?auto_17678 ?auto_17680 ) ) ( ON_BOARD ?auto_17682 ?auto_17684 ) ( POWER_ON ?auto_17682 ) ( not ( = ?auto_17683 ?auto_17682 ) ) ( CALIBRATED ?auto_17682 ) ( SUPPORTS ?auto_17682 ?auto_17679 ) ( not ( = ?auto_17677 ?auto_17679 ) ) ( not ( = ?auto_17676 ?auto_17679 ) ) ( POINTING ?auto_17684 ?auto_17681 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17678 ?auto_17677 ?auto_17675 ?auto_17676 )
      ( GET-3IMAGE-VERIFY ?auto_17675 ?auto_17676 ?auto_17678 ?auto_17677 ?auto_17680 ?auto_17679 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17697 - DIRECTION
      ?auto_17698 - MODE
      ?auto_17700 - DIRECTION
      ?auto_17699 - MODE
      ?auto_17702 - DIRECTION
      ?auto_17701 - MODE
    )
    :vars
    (
      ?auto_17705 - INSTRUMENT
      ?auto_17706 - SATELLITE
      ?auto_17703 - DIRECTION
      ?auto_17704 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17705 ?auto_17706 ) ( SUPPORTS ?auto_17705 ?auto_17698 ) ( not ( = ?auto_17697 ?auto_17703 ) ) ( HAVE_IMAGE ?auto_17702 ?auto_17701 ) ( not ( = ?auto_17702 ?auto_17697 ) ) ( not ( = ?auto_17702 ?auto_17703 ) ) ( not ( = ?auto_17701 ?auto_17698 ) ) ( CALIBRATION_TARGET ?auto_17705 ?auto_17703 ) ( not ( = ?auto_17703 ?auto_17700 ) ) ( not ( = ?auto_17697 ?auto_17700 ) ) ( not ( = ?auto_17702 ?auto_17700 ) ) ( ON_BOARD ?auto_17704 ?auto_17706 ) ( POWER_ON ?auto_17704 ) ( not ( = ?auto_17705 ?auto_17704 ) ) ( CALIBRATED ?auto_17704 ) ( SUPPORTS ?auto_17704 ?auto_17699 ) ( not ( = ?auto_17701 ?auto_17699 ) ) ( not ( = ?auto_17698 ?auto_17699 ) ) ( POINTING ?auto_17706 ?auto_17703 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17702 ?auto_17701 ?auto_17697 ?auto_17698 )
      ( GET-3IMAGE-VERIFY ?auto_17697 ?auto_17698 ?auto_17700 ?auto_17699 ?auto_17702 ?auto_17701 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_17769 - DIRECTION
      ?auto_17770 - MODE
    )
    :vars
    (
      ?auto_17777 - INSTRUMENT
      ?auto_17778 - SATELLITE
      ?auto_17773 - DIRECTION
      ?auto_17775 - DIRECTION
      ?auto_17774 - MODE
      ?auto_17772 - DIRECTION
      ?auto_17776 - INSTRUMENT
      ?auto_17771 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_17777 ?auto_17778 ) ( SUPPORTS ?auto_17777 ?auto_17770 ) ( not ( = ?auto_17769 ?auto_17773 ) ) ( HAVE_IMAGE ?auto_17775 ?auto_17774 ) ( not ( = ?auto_17775 ?auto_17769 ) ) ( not ( = ?auto_17775 ?auto_17773 ) ) ( not ( = ?auto_17774 ?auto_17770 ) ) ( CALIBRATION_TARGET ?auto_17777 ?auto_17773 ) ( not ( = ?auto_17773 ?auto_17772 ) ) ( not ( = ?auto_17769 ?auto_17772 ) ) ( not ( = ?auto_17775 ?auto_17772 ) ) ( ON_BOARD ?auto_17776 ?auto_17778 ) ( POWER_ON ?auto_17776 ) ( not ( = ?auto_17777 ?auto_17776 ) ) ( SUPPORTS ?auto_17776 ?auto_17771 ) ( not ( = ?auto_17774 ?auto_17771 ) ) ( not ( = ?auto_17770 ?auto_17771 ) ) ( POINTING ?auto_17778 ?auto_17773 ) ( CALIBRATION_TARGET ?auto_17776 ?auto_17773 ) ( NOT_CALIBRATED ?auto_17776 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_17778 ?auto_17776 ?auto_17773 )
      ( GET-2IMAGE ?auto_17775 ?auto_17774 ?auto_17769 ?auto_17770 )
      ( GET-1IMAGE-VERIFY ?auto_17769 ?auto_17770 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_17779 - DIRECTION
      ?auto_17780 - MODE
      ?auto_17782 - DIRECTION
      ?auto_17781 - MODE
    )
    :vars
    (
      ?auto_17788 - INSTRUMENT
      ?auto_17783 - SATELLITE
      ?auto_17785 - DIRECTION
      ?auto_17787 - DIRECTION
      ?auto_17784 - INSTRUMENT
      ?auto_17786 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_17788 ?auto_17783 ) ( SUPPORTS ?auto_17788 ?auto_17781 ) ( not ( = ?auto_17782 ?auto_17785 ) ) ( HAVE_IMAGE ?auto_17779 ?auto_17780 ) ( not ( = ?auto_17779 ?auto_17782 ) ) ( not ( = ?auto_17779 ?auto_17785 ) ) ( not ( = ?auto_17780 ?auto_17781 ) ) ( CALIBRATION_TARGET ?auto_17788 ?auto_17785 ) ( not ( = ?auto_17785 ?auto_17787 ) ) ( not ( = ?auto_17782 ?auto_17787 ) ) ( not ( = ?auto_17779 ?auto_17787 ) ) ( ON_BOARD ?auto_17784 ?auto_17783 ) ( POWER_ON ?auto_17784 ) ( not ( = ?auto_17788 ?auto_17784 ) ) ( SUPPORTS ?auto_17784 ?auto_17786 ) ( not ( = ?auto_17780 ?auto_17786 ) ) ( not ( = ?auto_17781 ?auto_17786 ) ) ( POINTING ?auto_17783 ?auto_17785 ) ( CALIBRATION_TARGET ?auto_17784 ?auto_17785 ) ( NOT_CALIBRATED ?auto_17784 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_17782 ?auto_17781 )
      ( GET-2IMAGE-VERIFY ?auto_17779 ?auto_17780 ?auto_17782 ?auto_17781 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_17789 - DIRECTION
      ?auto_17790 - MODE
      ?auto_17792 - DIRECTION
      ?auto_17791 - MODE
    )
    :vars
    (
      ?auto_17798 - INSTRUMENT
      ?auto_17794 - SATELLITE
      ?auto_17795 - DIRECTION
      ?auto_17797 - DIRECTION
      ?auto_17796 - MODE
      ?auto_17793 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17798 ?auto_17794 ) ( SUPPORTS ?auto_17798 ?auto_17791 ) ( not ( = ?auto_17792 ?auto_17795 ) ) ( HAVE_IMAGE ?auto_17797 ?auto_17796 ) ( not ( = ?auto_17797 ?auto_17792 ) ) ( not ( = ?auto_17797 ?auto_17795 ) ) ( not ( = ?auto_17796 ?auto_17791 ) ) ( CALIBRATION_TARGET ?auto_17798 ?auto_17795 ) ( not ( = ?auto_17795 ?auto_17789 ) ) ( not ( = ?auto_17792 ?auto_17789 ) ) ( not ( = ?auto_17797 ?auto_17789 ) ) ( ON_BOARD ?auto_17793 ?auto_17794 ) ( POWER_ON ?auto_17793 ) ( not ( = ?auto_17798 ?auto_17793 ) ) ( SUPPORTS ?auto_17793 ?auto_17790 ) ( not ( = ?auto_17796 ?auto_17790 ) ) ( not ( = ?auto_17791 ?auto_17790 ) ) ( POINTING ?auto_17794 ?auto_17795 ) ( CALIBRATION_TARGET ?auto_17793 ?auto_17795 ) ( NOT_CALIBRATED ?auto_17793 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17797 ?auto_17796 ?auto_17792 ?auto_17791 )
      ( GET-2IMAGE-VERIFY ?auto_17789 ?auto_17790 ?auto_17792 ?auto_17791 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_17799 - DIRECTION
      ?auto_17800 - MODE
      ?auto_17802 - DIRECTION
      ?auto_17801 - MODE
    )
    :vars
    (
      ?auto_17808 - INSTRUMENT
      ?auto_17804 - SATELLITE
      ?auto_17806 - DIRECTION
      ?auto_17805 - DIRECTION
      ?auto_17803 - INSTRUMENT
      ?auto_17807 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_17808 ?auto_17804 ) ( SUPPORTS ?auto_17808 ?auto_17800 ) ( not ( = ?auto_17799 ?auto_17806 ) ) ( HAVE_IMAGE ?auto_17802 ?auto_17801 ) ( not ( = ?auto_17802 ?auto_17799 ) ) ( not ( = ?auto_17802 ?auto_17806 ) ) ( not ( = ?auto_17801 ?auto_17800 ) ) ( CALIBRATION_TARGET ?auto_17808 ?auto_17806 ) ( not ( = ?auto_17806 ?auto_17805 ) ) ( not ( = ?auto_17799 ?auto_17805 ) ) ( not ( = ?auto_17802 ?auto_17805 ) ) ( ON_BOARD ?auto_17803 ?auto_17804 ) ( POWER_ON ?auto_17803 ) ( not ( = ?auto_17808 ?auto_17803 ) ) ( SUPPORTS ?auto_17803 ?auto_17807 ) ( not ( = ?auto_17801 ?auto_17807 ) ) ( not ( = ?auto_17800 ?auto_17807 ) ) ( POINTING ?auto_17804 ?auto_17806 ) ( CALIBRATION_TARGET ?auto_17803 ?auto_17806 ) ( NOT_CALIBRATED ?auto_17803 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17802 ?auto_17801 ?auto_17799 ?auto_17800 )
      ( GET-2IMAGE-VERIFY ?auto_17799 ?auto_17800 ?auto_17802 ?auto_17801 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_17809 - DIRECTION
      ?auto_17810 - MODE
      ?auto_17812 - DIRECTION
      ?auto_17811 - MODE
    )
    :vars
    (
      ?auto_17818 - INSTRUMENT
      ?auto_17814 - SATELLITE
      ?auto_17815 - DIRECTION
      ?auto_17817 - DIRECTION
      ?auto_17816 - MODE
      ?auto_17813 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17818 ?auto_17814 ) ( SUPPORTS ?auto_17818 ?auto_17810 ) ( not ( = ?auto_17809 ?auto_17815 ) ) ( HAVE_IMAGE ?auto_17817 ?auto_17816 ) ( not ( = ?auto_17817 ?auto_17809 ) ) ( not ( = ?auto_17817 ?auto_17815 ) ) ( not ( = ?auto_17816 ?auto_17810 ) ) ( CALIBRATION_TARGET ?auto_17818 ?auto_17815 ) ( not ( = ?auto_17815 ?auto_17812 ) ) ( not ( = ?auto_17809 ?auto_17812 ) ) ( not ( = ?auto_17817 ?auto_17812 ) ) ( ON_BOARD ?auto_17813 ?auto_17814 ) ( POWER_ON ?auto_17813 ) ( not ( = ?auto_17818 ?auto_17813 ) ) ( SUPPORTS ?auto_17813 ?auto_17811 ) ( not ( = ?auto_17816 ?auto_17811 ) ) ( not ( = ?auto_17810 ?auto_17811 ) ) ( POINTING ?auto_17814 ?auto_17815 ) ( CALIBRATION_TARGET ?auto_17813 ?auto_17815 ) ( NOT_CALIBRATED ?auto_17813 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17817 ?auto_17816 ?auto_17809 ?auto_17810 )
      ( GET-2IMAGE-VERIFY ?auto_17809 ?auto_17810 ?auto_17812 ?auto_17811 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17831 - DIRECTION
      ?auto_17832 - MODE
      ?auto_17834 - DIRECTION
      ?auto_17833 - MODE
      ?auto_17836 - DIRECTION
      ?auto_17835 - MODE
    )
    :vars
    (
      ?auto_17842 - INSTRUMENT
      ?auto_17838 - SATELLITE
      ?auto_17840 - DIRECTION
      ?auto_17839 - DIRECTION
      ?auto_17837 - INSTRUMENT
      ?auto_17841 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_17842 ?auto_17838 ) ( SUPPORTS ?auto_17842 ?auto_17835 ) ( not ( = ?auto_17836 ?auto_17840 ) ) ( HAVE_IMAGE ?auto_17831 ?auto_17833 ) ( not ( = ?auto_17831 ?auto_17836 ) ) ( not ( = ?auto_17831 ?auto_17840 ) ) ( not ( = ?auto_17833 ?auto_17835 ) ) ( CALIBRATION_TARGET ?auto_17842 ?auto_17840 ) ( not ( = ?auto_17840 ?auto_17839 ) ) ( not ( = ?auto_17836 ?auto_17839 ) ) ( not ( = ?auto_17831 ?auto_17839 ) ) ( ON_BOARD ?auto_17837 ?auto_17838 ) ( POWER_ON ?auto_17837 ) ( not ( = ?auto_17842 ?auto_17837 ) ) ( SUPPORTS ?auto_17837 ?auto_17841 ) ( not ( = ?auto_17833 ?auto_17841 ) ) ( not ( = ?auto_17835 ?auto_17841 ) ) ( POINTING ?auto_17838 ?auto_17840 ) ( CALIBRATION_TARGET ?auto_17837 ?auto_17840 ) ( NOT_CALIBRATED ?auto_17837 ) ( HAVE_IMAGE ?auto_17831 ?auto_17832 ) ( HAVE_IMAGE ?auto_17834 ?auto_17833 ) ( not ( = ?auto_17831 ?auto_17834 ) ) ( not ( = ?auto_17832 ?auto_17833 ) ) ( not ( = ?auto_17832 ?auto_17835 ) ) ( not ( = ?auto_17832 ?auto_17841 ) ) ( not ( = ?auto_17834 ?auto_17836 ) ) ( not ( = ?auto_17834 ?auto_17840 ) ) ( not ( = ?auto_17834 ?auto_17839 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17831 ?auto_17833 ?auto_17836 ?auto_17835 )
      ( GET-3IMAGE-VERIFY ?auto_17831 ?auto_17832 ?auto_17834 ?auto_17833 ?auto_17836 ?auto_17835 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17843 - DIRECTION
      ?auto_17844 - MODE
      ?auto_17846 - DIRECTION
      ?auto_17845 - MODE
      ?auto_17848 - DIRECTION
      ?auto_17847 - MODE
    )
    :vars
    (
      ?auto_17852 - INSTRUMENT
      ?auto_17850 - SATELLITE
      ?auto_17851 - DIRECTION
      ?auto_17849 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17852 ?auto_17850 ) ( SUPPORTS ?auto_17852 ?auto_17847 ) ( not ( = ?auto_17848 ?auto_17851 ) ) ( HAVE_IMAGE ?auto_17843 ?auto_17844 ) ( not ( = ?auto_17843 ?auto_17848 ) ) ( not ( = ?auto_17843 ?auto_17851 ) ) ( not ( = ?auto_17844 ?auto_17847 ) ) ( CALIBRATION_TARGET ?auto_17852 ?auto_17851 ) ( not ( = ?auto_17851 ?auto_17846 ) ) ( not ( = ?auto_17848 ?auto_17846 ) ) ( not ( = ?auto_17843 ?auto_17846 ) ) ( ON_BOARD ?auto_17849 ?auto_17850 ) ( POWER_ON ?auto_17849 ) ( not ( = ?auto_17852 ?auto_17849 ) ) ( SUPPORTS ?auto_17849 ?auto_17845 ) ( not ( = ?auto_17844 ?auto_17845 ) ) ( not ( = ?auto_17847 ?auto_17845 ) ) ( POINTING ?auto_17850 ?auto_17851 ) ( CALIBRATION_TARGET ?auto_17849 ?auto_17851 ) ( NOT_CALIBRATED ?auto_17849 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17843 ?auto_17844 ?auto_17848 ?auto_17847 )
      ( GET-3IMAGE-VERIFY ?auto_17843 ?auto_17844 ?auto_17846 ?auto_17845 ?auto_17848 ?auto_17847 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17853 - DIRECTION
      ?auto_17854 - MODE
      ?auto_17856 - DIRECTION
      ?auto_17855 - MODE
      ?auto_17858 - DIRECTION
      ?auto_17857 - MODE
    )
    :vars
    (
      ?auto_17864 - INSTRUMENT
      ?auto_17860 - SATELLITE
      ?auto_17862 - DIRECTION
      ?auto_17861 - DIRECTION
      ?auto_17859 - INSTRUMENT
      ?auto_17863 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_17864 ?auto_17860 ) ( SUPPORTS ?auto_17864 ?auto_17855 ) ( not ( = ?auto_17856 ?auto_17862 ) ) ( HAVE_IMAGE ?auto_17858 ?auto_17857 ) ( not ( = ?auto_17858 ?auto_17856 ) ) ( not ( = ?auto_17858 ?auto_17862 ) ) ( not ( = ?auto_17857 ?auto_17855 ) ) ( CALIBRATION_TARGET ?auto_17864 ?auto_17862 ) ( not ( = ?auto_17862 ?auto_17861 ) ) ( not ( = ?auto_17856 ?auto_17861 ) ) ( not ( = ?auto_17858 ?auto_17861 ) ) ( ON_BOARD ?auto_17859 ?auto_17860 ) ( POWER_ON ?auto_17859 ) ( not ( = ?auto_17864 ?auto_17859 ) ) ( SUPPORTS ?auto_17859 ?auto_17863 ) ( not ( = ?auto_17857 ?auto_17863 ) ) ( not ( = ?auto_17855 ?auto_17863 ) ) ( POINTING ?auto_17860 ?auto_17862 ) ( CALIBRATION_TARGET ?auto_17859 ?auto_17862 ) ( NOT_CALIBRATED ?auto_17859 ) ( HAVE_IMAGE ?auto_17853 ?auto_17854 ) ( not ( = ?auto_17853 ?auto_17856 ) ) ( not ( = ?auto_17853 ?auto_17858 ) ) ( not ( = ?auto_17853 ?auto_17862 ) ) ( not ( = ?auto_17853 ?auto_17861 ) ) ( not ( = ?auto_17854 ?auto_17855 ) ) ( not ( = ?auto_17854 ?auto_17857 ) ) ( not ( = ?auto_17854 ?auto_17863 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17858 ?auto_17857 ?auto_17856 ?auto_17855 )
      ( GET-3IMAGE-VERIFY ?auto_17853 ?auto_17854 ?auto_17856 ?auto_17855 ?auto_17858 ?auto_17857 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17865 - DIRECTION
      ?auto_17866 - MODE
      ?auto_17868 - DIRECTION
      ?auto_17867 - MODE
      ?auto_17870 - DIRECTION
      ?auto_17869 - MODE
    )
    :vars
    (
      ?auto_17874 - INSTRUMENT
      ?auto_17872 - SATELLITE
      ?auto_17873 - DIRECTION
      ?auto_17871 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17874 ?auto_17872 ) ( SUPPORTS ?auto_17874 ?auto_17867 ) ( not ( = ?auto_17868 ?auto_17873 ) ) ( HAVE_IMAGE ?auto_17865 ?auto_17866 ) ( not ( = ?auto_17865 ?auto_17868 ) ) ( not ( = ?auto_17865 ?auto_17873 ) ) ( not ( = ?auto_17866 ?auto_17867 ) ) ( CALIBRATION_TARGET ?auto_17874 ?auto_17873 ) ( not ( = ?auto_17873 ?auto_17870 ) ) ( not ( = ?auto_17868 ?auto_17870 ) ) ( not ( = ?auto_17865 ?auto_17870 ) ) ( ON_BOARD ?auto_17871 ?auto_17872 ) ( POWER_ON ?auto_17871 ) ( not ( = ?auto_17874 ?auto_17871 ) ) ( SUPPORTS ?auto_17871 ?auto_17869 ) ( not ( = ?auto_17866 ?auto_17869 ) ) ( not ( = ?auto_17867 ?auto_17869 ) ) ( POINTING ?auto_17872 ?auto_17873 ) ( CALIBRATION_TARGET ?auto_17871 ?auto_17873 ) ( NOT_CALIBRATED ?auto_17871 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17865 ?auto_17866 ?auto_17868 ?auto_17867 )
      ( GET-3IMAGE-VERIFY ?auto_17865 ?auto_17866 ?auto_17868 ?auto_17867 ?auto_17870 ?auto_17869 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17887 - DIRECTION
      ?auto_17888 - MODE
      ?auto_17890 - DIRECTION
      ?auto_17889 - MODE
      ?auto_17892 - DIRECTION
      ?auto_17891 - MODE
    )
    :vars
    (
      ?auto_17896 - INSTRUMENT
      ?auto_17894 - SATELLITE
      ?auto_17895 - DIRECTION
      ?auto_17893 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17896 ?auto_17894 ) ( SUPPORTS ?auto_17896 ?auto_17891 ) ( not ( = ?auto_17892 ?auto_17895 ) ) ( HAVE_IMAGE ?auto_17890 ?auto_17889 ) ( not ( = ?auto_17890 ?auto_17892 ) ) ( not ( = ?auto_17890 ?auto_17895 ) ) ( not ( = ?auto_17889 ?auto_17891 ) ) ( CALIBRATION_TARGET ?auto_17896 ?auto_17895 ) ( not ( = ?auto_17895 ?auto_17887 ) ) ( not ( = ?auto_17892 ?auto_17887 ) ) ( not ( = ?auto_17890 ?auto_17887 ) ) ( ON_BOARD ?auto_17893 ?auto_17894 ) ( POWER_ON ?auto_17893 ) ( not ( = ?auto_17896 ?auto_17893 ) ) ( SUPPORTS ?auto_17893 ?auto_17888 ) ( not ( = ?auto_17889 ?auto_17888 ) ) ( not ( = ?auto_17891 ?auto_17888 ) ) ( POINTING ?auto_17894 ?auto_17895 ) ( CALIBRATION_TARGET ?auto_17893 ?auto_17895 ) ( NOT_CALIBRATED ?auto_17893 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17890 ?auto_17889 ?auto_17892 ?auto_17891 )
      ( GET-3IMAGE-VERIFY ?auto_17887 ?auto_17888 ?auto_17890 ?auto_17889 ?auto_17892 ?auto_17891 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17909 - DIRECTION
      ?auto_17910 - MODE
      ?auto_17912 - DIRECTION
      ?auto_17911 - MODE
      ?auto_17914 - DIRECTION
      ?auto_17913 - MODE
    )
    :vars
    (
      ?auto_17918 - INSTRUMENT
      ?auto_17916 - SATELLITE
      ?auto_17917 - DIRECTION
      ?auto_17915 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17918 ?auto_17916 ) ( SUPPORTS ?auto_17918 ?auto_17911 ) ( not ( = ?auto_17912 ?auto_17917 ) ) ( HAVE_IMAGE ?auto_17914 ?auto_17913 ) ( not ( = ?auto_17914 ?auto_17912 ) ) ( not ( = ?auto_17914 ?auto_17917 ) ) ( not ( = ?auto_17913 ?auto_17911 ) ) ( CALIBRATION_TARGET ?auto_17918 ?auto_17917 ) ( not ( = ?auto_17917 ?auto_17909 ) ) ( not ( = ?auto_17912 ?auto_17909 ) ) ( not ( = ?auto_17914 ?auto_17909 ) ) ( ON_BOARD ?auto_17915 ?auto_17916 ) ( POWER_ON ?auto_17915 ) ( not ( = ?auto_17918 ?auto_17915 ) ) ( SUPPORTS ?auto_17915 ?auto_17910 ) ( not ( = ?auto_17913 ?auto_17910 ) ) ( not ( = ?auto_17911 ?auto_17910 ) ) ( POINTING ?auto_17916 ?auto_17917 ) ( CALIBRATION_TARGET ?auto_17915 ?auto_17917 ) ( NOT_CALIBRATED ?auto_17915 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17914 ?auto_17913 ?auto_17912 ?auto_17911 )
      ( GET-3IMAGE-VERIFY ?auto_17909 ?auto_17910 ?auto_17912 ?auto_17911 ?auto_17914 ?auto_17913 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17943 - DIRECTION
      ?auto_17944 - MODE
      ?auto_17946 - DIRECTION
      ?auto_17945 - MODE
      ?auto_17948 - DIRECTION
      ?auto_17947 - MODE
    )
    :vars
    (
      ?auto_17954 - INSTRUMENT
      ?auto_17950 - SATELLITE
      ?auto_17952 - DIRECTION
      ?auto_17951 - DIRECTION
      ?auto_17949 - INSTRUMENT
      ?auto_17953 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_17954 ?auto_17950 ) ( SUPPORTS ?auto_17954 ?auto_17944 ) ( not ( = ?auto_17943 ?auto_17952 ) ) ( HAVE_IMAGE ?auto_17946 ?auto_17945 ) ( not ( = ?auto_17946 ?auto_17943 ) ) ( not ( = ?auto_17946 ?auto_17952 ) ) ( not ( = ?auto_17945 ?auto_17944 ) ) ( CALIBRATION_TARGET ?auto_17954 ?auto_17952 ) ( not ( = ?auto_17952 ?auto_17951 ) ) ( not ( = ?auto_17943 ?auto_17951 ) ) ( not ( = ?auto_17946 ?auto_17951 ) ) ( ON_BOARD ?auto_17949 ?auto_17950 ) ( POWER_ON ?auto_17949 ) ( not ( = ?auto_17954 ?auto_17949 ) ) ( SUPPORTS ?auto_17949 ?auto_17953 ) ( not ( = ?auto_17945 ?auto_17953 ) ) ( not ( = ?auto_17944 ?auto_17953 ) ) ( POINTING ?auto_17950 ?auto_17952 ) ( CALIBRATION_TARGET ?auto_17949 ?auto_17952 ) ( NOT_CALIBRATED ?auto_17949 ) ( HAVE_IMAGE ?auto_17948 ?auto_17947 ) ( not ( = ?auto_17943 ?auto_17948 ) ) ( not ( = ?auto_17944 ?auto_17947 ) ) ( not ( = ?auto_17946 ?auto_17948 ) ) ( not ( = ?auto_17945 ?auto_17947 ) ) ( not ( = ?auto_17948 ?auto_17952 ) ) ( not ( = ?auto_17948 ?auto_17951 ) ) ( not ( = ?auto_17947 ?auto_17953 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17946 ?auto_17945 ?auto_17943 ?auto_17944 )
      ( GET-3IMAGE-VERIFY ?auto_17943 ?auto_17944 ?auto_17946 ?auto_17945 ?auto_17948 ?auto_17947 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17955 - DIRECTION
      ?auto_17956 - MODE
      ?auto_17958 - DIRECTION
      ?auto_17957 - MODE
      ?auto_17960 - DIRECTION
      ?auto_17959 - MODE
    )
    :vars
    (
      ?auto_17964 - INSTRUMENT
      ?auto_17962 - SATELLITE
      ?auto_17963 - DIRECTION
      ?auto_17961 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17964 ?auto_17962 ) ( SUPPORTS ?auto_17964 ?auto_17956 ) ( not ( = ?auto_17955 ?auto_17963 ) ) ( HAVE_IMAGE ?auto_17958 ?auto_17957 ) ( not ( = ?auto_17958 ?auto_17955 ) ) ( not ( = ?auto_17958 ?auto_17963 ) ) ( not ( = ?auto_17957 ?auto_17956 ) ) ( CALIBRATION_TARGET ?auto_17964 ?auto_17963 ) ( not ( = ?auto_17963 ?auto_17960 ) ) ( not ( = ?auto_17955 ?auto_17960 ) ) ( not ( = ?auto_17958 ?auto_17960 ) ) ( ON_BOARD ?auto_17961 ?auto_17962 ) ( POWER_ON ?auto_17961 ) ( not ( = ?auto_17964 ?auto_17961 ) ) ( SUPPORTS ?auto_17961 ?auto_17959 ) ( not ( = ?auto_17957 ?auto_17959 ) ) ( not ( = ?auto_17956 ?auto_17959 ) ) ( POINTING ?auto_17962 ?auto_17963 ) ( CALIBRATION_TARGET ?auto_17961 ?auto_17963 ) ( NOT_CALIBRATED ?auto_17961 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17958 ?auto_17957 ?auto_17955 ?auto_17956 )
      ( GET-3IMAGE-VERIFY ?auto_17955 ?auto_17956 ?auto_17958 ?auto_17957 ?auto_17960 ?auto_17959 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_17977 - DIRECTION
      ?auto_17978 - MODE
      ?auto_17980 - DIRECTION
      ?auto_17979 - MODE
      ?auto_17982 - DIRECTION
      ?auto_17981 - MODE
    )
    :vars
    (
      ?auto_17986 - INSTRUMENT
      ?auto_17984 - SATELLITE
      ?auto_17985 - DIRECTION
      ?auto_17983 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_17986 ?auto_17984 ) ( SUPPORTS ?auto_17986 ?auto_17978 ) ( not ( = ?auto_17977 ?auto_17985 ) ) ( HAVE_IMAGE ?auto_17982 ?auto_17981 ) ( not ( = ?auto_17982 ?auto_17977 ) ) ( not ( = ?auto_17982 ?auto_17985 ) ) ( not ( = ?auto_17981 ?auto_17978 ) ) ( CALIBRATION_TARGET ?auto_17986 ?auto_17985 ) ( not ( = ?auto_17985 ?auto_17980 ) ) ( not ( = ?auto_17977 ?auto_17980 ) ) ( not ( = ?auto_17982 ?auto_17980 ) ) ( ON_BOARD ?auto_17983 ?auto_17984 ) ( POWER_ON ?auto_17983 ) ( not ( = ?auto_17986 ?auto_17983 ) ) ( SUPPORTS ?auto_17983 ?auto_17979 ) ( not ( = ?auto_17981 ?auto_17979 ) ) ( not ( = ?auto_17978 ?auto_17979 ) ) ( POINTING ?auto_17984 ?auto_17985 ) ( CALIBRATION_TARGET ?auto_17983 ?auto_17985 ) ( NOT_CALIBRATED ?auto_17983 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17982 ?auto_17981 ?auto_17977 ?auto_17978 )
      ( GET-3IMAGE-VERIFY ?auto_17977 ?auto_17978 ?auto_17980 ?auto_17979 ?auto_17982 ?auto_17981 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_18049 - DIRECTION
      ?auto_18050 - MODE
    )
    :vars
    (
      ?auto_18058 - INSTRUMENT
      ?auto_18052 - SATELLITE
      ?auto_18054 - DIRECTION
      ?auto_18056 - DIRECTION
      ?auto_18055 - MODE
      ?auto_18053 - DIRECTION
      ?auto_18051 - INSTRUMENT
      ?auto_18057 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_18058 ?auto_18052 ) ( SUPPORTS ?auto_18058 ?auto_18050 ) ( not ( = ?auto_18049 ?auto_18054 ) ) ( HAVE_IMAGE ?auto_18056 ?auto_18055 ) ( not ( = ?auto_18056 ?auto_18049 ) ) ( not ( = ?auto_18056 ?auto_18054 ) ) ( not ( = ?auto_18055 ?auto_18050 ) ) ( CALIBRATION_TARGET ?auto_18058 ?auto_18054 ) ( not ( = ?auto_18054 ?auto_18053 ) ) ( not ( = ?auto_18049 ?auto_18053 ) ) ( not ( = ?auto_18056 ?auto_18053 ) ) ( ON_BOARD ?auto_18051 ?auto_18052 ) ( not ( = ?auto_18058 ?auto_18051 ) ) ( SUPPORTS ?auto_18051 ?auto_18057 ) ( not ( = ?auto_18055 ?auto_18057 ) ) ( not ( = ?auto_18050 ?auto_18057 ) ) ( POINTING ?auto_18052 ?auto_18054 ) ( CALIBRATION_TARGET ?auto_18051 ?auto_18054 ) ( POWER_AVAIL ?auto_18052 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_18051 ?auto_18052 )
      ( GET-2IMAGE ?auto_18056 ?auto_18055 ?auto_18049 ?auto_18050 )
      ( GET-1IMAGE-VERIFY ?auto_18049 ?auto_18050 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18059 - DIRECTION
      ?auto_18060 - MODE
      ?auto_18062 - DIRECTION
      ?auto_18061 - MODE
    )
    :vars
    (
      ?auto_18066 - INSTRUMENT
      ?auto_18063 - SATELLITE
      ?auto_18067 - DIRECTION
      ?auto_18064 - DIRECTION
      ?auto_18068 - INSTRUMENT
      ?auto_18065 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_18066 ?auto_18063 ) ( SUPPORTS ?auto_18066 ?auto_18061 ) ( not ( = ?auto_18062 ?auto_18067 ) ) ( HAVE_IMAGE ?auto_18059 ?auto_18060 ) ( not ( = ?auto_18059 ?auto_18062 ) ) ( not ( = ?auto_18059 ?auto_18067 ) ) ( not ( = ?auto_18060 ?auto_18061 ) ) ( CALIBRATION_TARGET ?auto_18066 ?auto_18067 ) ( not ( = ?auto_18067 ?auto_18064 ) ) ( not ( = ?auto_18062 ?auto_18064 ) ) ( not ( = ?auto_18059 ?auto_18064 ) ) ( ON_BOARD ?auto_18068 ?auto_18063 ) ( not ( = ?auto_18066 ?auto_18068 ) ) ( SUPPORTS ?auto_18068 ?auto_18065 ) ( not ( = ?auto_18060 ?auto_18065 ) ) ( not ( = ?auto_18061 ?auto_18065 ) ) ( POINTING ?auto_18063 ?auto_18067 ) ( CALIBRATION_TARGET ?auto_18068 ?auto_18067 ) ( POWER_AVAIL ?auto_18063 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18062 ?auto_18061 )
      ( GET-2IMAGE-VERIFY ?auto_18059 ?auto_18060 ?auto_18062 ?auto_18061 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18069 - DIRECTION
      ?auto_18070 - MODE
      ?auto_18072 - DIRECTION
      ?auto_18071 - MODE
    )
    :vars
    (
      ?auto_18078 - INSTRUMENT
      ?auto_18073 - SATELLITE
      ?auto_18075 - DIRECTION
      ?auto_18077 - DIRECTION
      ?auto_18076 - MODE
      ?auto_18074 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18078 ?auto_18073 ) ( SUPPORTS ?auto_18078 ?auto_18071 ) ( not ( = ?auto_18072 ?auto_18075 ) ) ( HAVE_IMAGE ?auto_18077 ?auto_18076 ) ( not ( = ?auto_18077 ?auto_18072 ) ) ( not ( = ?auto_18077 ?auto_18075 ) ) ( not ( = ?auto_18076 ?auto_18071 ) ) ( CALIBRATION_TARGET ?auto_18078 ?auto_18075 ) ( not ( = ?auto_18075 ?auto_18069 ) ) ( not ( = ?auto_18072 ?auto_18069 ) ) ( not ( = ?auto_18077 ?auto_18069 ) ) ( ON_BOARD ?auto_18074 ?auto_18073 ) ( not ( = ?auto_18078 ?auto_18074 ) ) ( SUPPORTS ?auto_18074 ?auto_18070 ) ( not ( = ?auto_18076 ?auto_18070 ) ) ( not ( = ?auto_18071 ?auto_18070 ) ) ( POINTING ?auto_18073 ?auto_18075 ) ( CALIBRATION_TARGET ?auto_18074 ?auto_18075 ) ( POWER_AVAIL ?auto_18073 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18077 ?auto_18076 ?auto_18072 ?auto_18071 )
      ( GET-2IMAGE-VERIFY ?auto_18069 ?auto_18070 ?auto_18072 ?auto_18071 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18079 - DIRECTION
      ?auto_18080 - MODE
      ?auto_18082 - DIRECTION
      ?auto_18081 - MODE
    )
    :vars
    (
      ?auto_18087 - INSTRUMENT
      ?auto_18083 - SATELLITE
      ?auto_18086 - DIRECTION
      ?auto_18084 - DIRECTION
      ?auto_18085 - INSTRUMENT
      ?auto_18088 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_18087 ?auto_18083 ) ( SUPPORTS ?auto_18087 ?auto_18080 ) ( not ( = ?auto_18079 ?auto_18086 ) ) ( HAVE_IMAGE ?auto_18082 ?auto_18081 ) ( not ( = ?auto_18082 ?auto_18079 ) ) ( not ( = ?auto_18082 ?auto_18086 ) ) ( not ( = ?auto_18081 ?auto_18080 ) ) ( CALIBRATION_TARGET ?auto_18087 ?auto_18086 ) ( not ( = ?auto_18086 ?auto_18084 ) ) ( not ( = ?auto_18079 ?auto_18084 ) ) ( not ( = ?auto_18082 ?auto_18084 ) ) ( ON_BOARD ?auto_18085 ?auto_18083 ) ( not ( = ?auto_18087 ?auto_18085 ) ) ( SUPPORTS ?auto_18085 ?auto_18088 ) ( not ( = ?auto_18081 ?auto_18088 ) ) ( not ( = ?auto_18080 ?auto_18088 ) ) ( POINTING ?auto_18083 ?auto_18086 ) ( CALIBRATION_TARGET ?auto_18085 ?auto_18086 ) ( POWER_AVAIL ?auto_18083 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18082 ?auto_18081 ?auto_18079 ?auto_18080 )
      ( GET-2IMAGE-VERIFY ?auto_18079 ?auto_18080 ?auto_18082 ?auto_18081 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18089 - DIRECTION
      ?auto_18090 - MODE
      ?auto_18092 - DIRECTION
      ?auto_18091 - MODE
    )
    :vars
    (
      ?auto_18098 - INSTRUMENT
      ?auto_18093 - SATELLITE
      ?auto_18095 - DIRECTION
      ?auto_18097 - DIRECTION
      ?auto_18096 - MODE
      ?auto_18094 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18098 ?auto_18093 ) ( SUPPORTS ?auto_18098 ?auto_18090 ) ( not ( = ?auto_18089 ?auto_18095 ) ) ( HAVE_IMAGE ?auto_18097 ?auto_18096 ) ( not ( = ?auto_18097 ?auto_18089 ) ) ( not ( = ?auto_18097 ?auto_18095 ) ) ( not ( = ?auto_18096 ?auto_18090 ) ) ( CALIBRATION_TARGET ?auto_18098 ?auto_18095 ) ( not ( = ?auto_18095 ?auto_18092 ) ) ( not ( = ?auto_18089 ?auto_18092 ) ) ( not ( = ?auto_18097 ?auto_18092 ) ) ( ON_BOARD ?auto_18094 ?auto_18093 ) ( not ( = ?auto_18098 ?auto_18094 ) ) ( SUPPORTS ?auto_18094 ?auto_18091 ) ( not ( = ?auto_18096 ?auto_18091 ) ) ( not ( = ?auto_18090 ?auto_18091 ) ) ( POINTING ?auto_18093 ?auto_18095 ) ( CALIBRATION_TARGET ?auto_18094 ?auto_18095 ) ( POWER_AVAIL ?auto_18093 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18097 ?auto_18096 ?auto_18089 ?auto_18090 )
      ( GET-2IMAGE-VERIFY ?auto_18089 ?auto_18090 ?auto_18092 ?auto_18091 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18111 - DIRECTION
      ?auto_18112 - MODE
      ?auto_18114 - DIRECTION
      ?auto_18113 - MODE
      ?auto_18116 - DIRECTION
      ?auto_18115 - MODE
    )
    :vars
    (
      ?auto_18121 - INSTRUMENT
      ?auto_18117 - SATELLITE
      ?auto_18120 - DIRECTION
      ?auto_18118 - DIRECTION
      ?auto_18119 - INSTRUMENT
      ?auto_18122 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_18121 ?auto_18117 ) ( SUPPORTS ?auto_18121 ?auto_18115 ) ( not ( = ?auto_18116 ?auto_18120 ) ) ( HAVE_IMAGE ?auto_18111 ?auto_18112 ) ( not ( = ?auto_18111 ?auto_18116 ) ) ( not ( = ?auto_18111 ?auto_18120 ) ) ( not ( = ?auto_18112 ?auto_18115 ) ) ( CALIBRATION_TARGET ?auto_18121 ?auto_18120 ) ( not ( = ?auto_18120 ?auto_18118 ) ) ( not ( = ?auto_18116 ?auto_18118 ) ) ( not ( = ?auto_18111 ?auto_18118 ) ) ( ON_BOARD ?auto_18119 ?auto_18117 ) ( not ( = ?auto_18121 ?auto_18119 ) ) ( SUPPORTS ?auto_18119 ?auto_18122 ) ( not ( = ?auto_18112 ?auto_18122 ) ) ( not ( = ?auto_18115 ?auto_18122 ) ) ( POINTING ?auto_18117 ?auto_18120 ) ( CALIBRATION_TARGET ?auto_18119 ?auto_18120 ) ( POWER_AVAIL ?auto_18117 ) ( HAVE_IMAGE ?auto_18114 ?auto_18113 ) ( not ( = ?auto_18111 ?auto_18114 ) ) ( not ( = ?auto_18112 ?auto_18113 ) ) ( not ( = ?auto_18114 ?auto_18116 ) ) ( not ( = ?auto_18114 ?auto_18120 ) ) ( not ( = ?auto_18114 ?auto_18118 ) ) ( not ( = ?auto_18113 ?auto_18115 ) ) ( not ( = ?auto_18113 ?auto_18122 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18111 ?auto_18112 ?auto_18116 ?auto_18115 )
      ( GET-3IMAGE-VERIFY ?auto_18111 ?auto_18112 ?auto_18114 ?auto_18113 ?auto_18116 ?auto_18115 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18123 - DIRECTION
      ?auto_18124 - MODE
      ?auto_18126 - DIRECTION
      ?auto_18125 - MODE
      ?auto_18128 - DIRECTION
      ?auto_18127 - MODE
    )
    :vars
    (
      ?auto_18132 - INSTRUMENT
      ?auto_18129 - SATELLITE
      ?auto_18131 - DIRECTION
      ?auto_18130 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18132 ?auto_18129 ) ( SUPPORTS ?auto_18132 ?auto_18127 ) ( not ( = ?auto_18128 ?auto_18131 ) ) ( HAVE_IMAGE ?auto_18123 ?auto_18124 ) ( not ( = ?auto_18123 ?auto_18128 ) ) ( not ( = ?auto_18123 ?auto_18131 ) ) ( not ( = ?auto_18124 ?auto_18127 ) ) ( CALIBRATION_TARGET ?auto_18132 ?auto_18131 ) ( not ( = ?auto_18131 ?auto_18126 ) ) ( not ( = ?auto_18128 ?auto_18126 ) ) ( not ( = ?auto_18123 ?auto_18126 ) ) ( ON_BOARD ?auto_18130 ?auto_18129 ) ( not ( = ?auto_18132 ?auto_18130 ) ) ( SUPPORTS ?auto_18130 ?auto_18125 ) ( not ( = ?auto_18124 ?auto_18125 ) ) ( not ( = ?auto_18127 ?auto_18125 ) ) ( POINTING ?auto_18129 ?auto_18131 ) ( CALIBRATION_TARGET ?auto_18130 ?auto_18131 ) ( POWER_AVAIL ?auto_18129 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18123 ?auto_18124 ?auto_18128 ?auto_18127 )
      ( GET-3IMAGE-VERIFY ?auto_18123 ?auto_18124 ?auto_18126 ?auto_18125 ?auto_18128 ?auto_18127 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18133 - DIRECTION
      ?auto_18134 - MODE
      ?auto_18136 - DIRECTION
      ?auto_18135 - MODE
      ?auto_18138 - DIRECTION
      ?auto_18137 - MODE
    )
    :vars
    (
      ?auto_18143 - INSTRUMENT
      ?auto_18139 - SATELLITE
      ?auto_18142 - DIRECTION
      ?auto_18140 - DIRECTION
      ?auto_18141 - INSTRUMENT
      ?auto_18144 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_18143 ?auto_18139 ) ( SUPPORTS ?auto_18143 ?auto_18135 ) ( not ( = ?auto_18136 ?auto_18142 ) ) ( HAVE_IMAGE ?auto_18138 ?auto_18137 ) ( not ( = ?auto_18138 ?auto_18136 ) ) ( not ( = ?auto_18138 ?auto_18142 ) ) ( not ( = ?auto_18137 ?auto_18135 ) ) ( CALIBRATION_TARGET ?auto_18143 ?auto_18142 ) ( not ( = ?auto_18142 ?auto_18140 ) ) ( not ( = ?auto_18136 ?auto_18140 ) ) ( not ( = ?auto_18138 ?auto_18140 ) ) ( ON_BOARD ?auto_18141 ?auto_18139 ) ( not ( = ?auto_18143 ?auto_18141 ) ) ( SUPPORTS ?auto_18141 ?auto_18144 ) ( not ( = ?auto_18137 ?auto_18144 ) ) ( not ( = ?auto_18135 ?auto_18144 ) ) ( POINTING ?auto_18139 ?auto_18142 ) ( CALIBRATION_TARGET ?auto_18141 ?auto_18142 ) ( POWER_AVAIL ?auto_18139 ) ( HAVE_IMAGE ?auto_18133 ?auto_18134 ) ( not ( = ?auto_18133 ?auto_18136 ) ) ( not ( = ?auto_18133 ?auto_18138 ) ) ( not ( = ?auto_18133 ?auto_18142 ) ) ( not ( = ?auto_18133 ?auto_18140 ) ) ( not ( = ?auto_18134 ?auto_18135 ) ) ( not ( = ?auto_18134 ?auto_18137 ) ) ( not ( = ?auto_18134 ?auto_18144 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18138 ?auto_18137 ?auto_18136 ?auto_18135 )
      ( GET-3IMAGE-VERIFY ?auto_18133 ?auto_18134 ?auto_18136 ?auto_18135 ?auto_18138 ?auto_18137 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18145 - DIRECTION
      ?auto_18146 - MODE
      ?auto_18148 - DIRECTION
      ?auto_18147 - MODE
      ?auto_18150 - DIRECTION
      ?auto_18149 - MODE
    )
    :vars
    (
      ?auto_18154 - INSTRUMENT
      ?auto_18151 - SATELLITE
      ?auto_18153 - DIRECTION
      ?auto_18152 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18154 ?auto_18151 ) ( SUPPORTS ?auto_18154 ?auto_18147 ) ( not ( = ?auto_18148 ?auto_18153 ) ) ( HAVE_IMAGE ?auto_18145 ?auto_18146 ) ( not ( = ?auto_18145 ?auto_18148 ) ) ( not ( = ?auto_18145 ?auto_18153 ) ) ( not ( = ?auto_18146 ?auto_18147 ) ) ( CALIBRATION_TARGET ?auto_18154 ?auto_18153 ) ( not ( = ?auto_18153 ?auto_18150 ) ) ( not ( = ?auto_18148 ?auto_18150 ) ) ( not ( = ?auto_18145 ?auto_18150 ) ) ( ON_BOARD ?auto_18152 ?auto_18151 ) ( not ( = ?auto_18154 ?auto_18152 ) ) ( SUPPORTS ?auto_18152 ?auto_18149 ) ( not ( = ?auto_18146 ?auto_18149 ) ) ( not ( = ?auto_18147 ?auto_18149 ) ) ( POINTING ?auto_18151 ?auto_18153 ) ( CALIBRATION_TARGET ?auto_18152 ?auto_18153 ) ( POWER_AVAIL ?auto_18151 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18145 ?auto_18146 ?auto_18148 ?auto_18147 )
      ( GET-3IMAGE-VERIFY ?auto_18145 ?auto_18146 ?auto_18148 ?auto_18147 ?auto_18150 ?auto_18149 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18167 - DIRECTION
      ?auto_18168 - MODE
      ?auto_18170 - DIRECTION
      ?auto_18169 - MODE
      ?auto_18172 - DIRECTION
      ?auto_18171 - MODE
    )
    :vars
    (
      ?auto_18176 - INSTRUMENT
      ?auto_18173 - SATELLITE
      ?auto_18175 - DIRECTION
      ?auto_18174 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18176 ?auto_18173 ) ( SUPPORTS ?auto_18176 ?auto_18171 ) ( not ( = ?auto_18172 ?auto_18175 ) ) ( HAVE_IMAGE ?auto_18170 ?auto_18169 ) ( not ( = ?auto_18170 ?auto_18172 ) ) ( not ( = ?auto_18170 ?auto_18175 ) ) ( not ( = ?auto_18169 ?auto_18171 ) ) ( CALIBRATION_TARGET ?auto_18176 ?auto_18175 ) ( not ( = ?auto_18175 ?auto_18167 ) ) ( not ( = ?auto_18172 ?auto_18167 ) ) ( not ( = ?auto_18170 ?auto_18167 ) ) ( ON_BOARD ?auto_18174 ?auto_18173 ) ( not ( = ?auto_18176 ?auto_18174 ) ) ( SUPPORTS ?auto_18174 ?auto_18168 ) ( not ( = ?auto_18169 ?auto_18168 ) ) ( not ( = ?auto_18171 ?auto_18168 ) ) ( POINTING ?auto_18173 ?auto_18175 ) ( CALIBRATION_TARGET ?auto_18174 ?auto_18175 ) ( POWER_AVAIL ?auto_18173 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18170 ?auto_18169 ?auto_18172 ?auto_18171 )
      ( GET-3IMAGE-VERIFY ?auto_18167 ?auto_18168 ?auto_18170 ?auto_18169 ?auto_18172 ?auto_18171 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18189 - DIRECTION
      ?auto_18190 - MODE
      ?auto_18192 - DIRECTION
      ?auto_18191 - MODE
      ?auto_18194 - DIRECTION
      ?auto_18193 - MODE
    )
    :vars
    (
      ?auto_18198 - INSTRUMENT
      ?auto_18195 - SATELLITE
      ?auto_18197 - DIRECTION
      ?auto_18196 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18198 ?auto_18195 ) ( SUPPORTS ?auto_18198 ?auto_18191 ) ( not ( = ?auto_18192 ?auto_18197 ) ) ( HAVE_IMAGE ?auto_18194 ?auto_18193 ) ( not ( = ?auto_18194 ?auto_18192 ) ) ( not ( = ?auto_18194 ?auto_18197 ) ) ( not ( = ?auto_18193 ?auto_18191 ) ) ( CALIBRATION_TARGET ?auto_18198 ?auto_18197 ) ( not ( = ?auto_18197 ?auto_18189 ) ) ( not ( = ?auto_18192 ?auto_18189 ) ) ( not ( = ?auto_18194 ?auto_18189 ) ) ( ON_BOARD ?auto_18196 ?auto_18195 ) ( not ( = ?auto_18198 ?auto_18196 ) ) ( SUPPORTS ?auto_18196 ?auto_18190 ) ( not ( = ?auto_18193 ?auto_18190 ) ) ( not ( = ?auto_18191 ?auto_18190 ) ) ( POINTING ?auto_18195 ?auto_18197 ) ( CALIBRATION_TARGET ?auto_18196 ?auto_18197 ) ( POWER_AVAIL ?auto_18195 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18194 ?auto_18193 ?auto_18192 ?auto_18191 )
      ( GET-3IMAGE-VERIFY ?auto_18189 ?auto_18190 ?auto_18192 ?auto_18191 ?auto_18194 ?auto_18193 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18223 - DIRECTION
      ?auto_18224 - MODE
      ?auto_18226 - DIRECTION
      ?auto_18225 - MODE
      ?auto_18228 - DIRECTION
      ?auto_18227 - MODE
    )
    :vars
    (
      ?auto_18233 - INSTRUMENT
      ?auto_18229 - SATELLITE
      ?auto_18232 - DIRECTION
      ?auto_18230 - DIRECTION
      ?auto_18231 - INSTRUMENT
      ?auto_18234 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_18233 ?auto_18229 ) ( SUPPORTS ?auto_18233 ?auto_18224 ) ( not ( = ?auto_18223 ?auto_18232 ) ) ( HAVE_IMAGE ?auto_18226 ?auto_18227 ) ( not ( = ?auto_18226 ?auto_18223 ) ) ( not ( = ?auto_18226 ?auto_18232 ) ) ( not ( = ?auto_18227 ?auto_18224 ) ) ( CALIBRATION_TARGET ?auto_18233 ?auto_18232 ) ( not ( = ?auto_18232 ?auto_18230 ) ) ( not ( = ?auto_18223 ?auto_18230 ) ) ( not ( = ?auto_18226 ?auto_18230 ) ) ( ON_BOARD ?auto_18231 ?auto_18229 ) ( not ( = ?auto_18233 ?auto_18231 ) ) ( SUPPORTS ?auto_18231 ?auto_18234 ) ( not ( = ?auto_18227 ?auto_18234 ) ) ( not ( = ?auto_18224 ?auto_18234 ) ) ( POINTING ?auto_18229 ?auto_18232 ) ( CALIBRATION_TARGET ?auto_18231 ?auto_18232 ) ( POWER_AVAIL ?auto_18229 ) ( HAVE_IMAGE ?auto_18226 ?auto_18225 ) ( HAVE_IMAGE ?auto_18228 ?auto_18227 ) ( not ( = ?auto_18223 ?auto_18228 ) ) ( not ( = ?auto_18224 ?auto_18225 ) ) ( not ( = ?auto_18226 ?auto_18228 ) ) ( not ( = ?auto_18225 ?auto_18227 ) ) ( not ( = ?auto_18225 ?auto_18234 ) ) ( not ( = ?auto_18228 ?auto_18232 ) ) ( not ( = ?auto_18228 ?auto_18230 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18226 ?auto_18227 ?auto_18223 ?auto_18224 )
      ( GET-3IMAGE-VERIFY ?auto_18223 ?auto_18224 ?auto_18226 ?auto_18225 ?auto_18228 ?auto_18227 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18235 - DIRECTION
      ?auto_18236 - MODE
      ?auto_18238 - DIRECTION
      ?auto_18237 - MODE
      ?auto_18240 - DIRECTION
      ?auto_18239 - MODE
    )
    :vars
    (
      ?auto_18244 - INSTRUMENT
      ?auto_18241 - SATELLITE
      ?auto_18243 - DIRECTION
      ?auto_18242 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18244 ?auto_18241 ) ( SUPPORTS ?auto_18244 ?auto_18236 ) ( not ( = ?auto_18235 ?auto_18243 ) ) ( HAVE_IMAGE ?auto_18238 ?auto_18237 ) ( not ( = ?auto_18238 ?auto_18235 ) ) ( not ( = ?auto_18238 ?auto_18243 ) ) ( not ( = ?auto_18237 ?auto_18236 ) ) ( CALIBRATION_TARGET ?auto_18244 ?auto_18243 ) ( not ( = ?auto_18243 ?auto_18240 ) ) ( not ( = ?auto_18235 ?auto_18240 ) ) ( not ( = ?auto_18238 ?auto_18240 ) ) ( ON_BOARD ?auto_18242 ?auto_18241 ) ( not ( = ?auto_18244 ?auto_18242 ) ) ( SUPPORTS ?auto_18242 ?auto_18239 ) ( not ( = ?auto_18237 ?auto_18239 ) ) ( not ( = ?auto_18236 ?auto_18239 ) ) ( POINTING ?auto_18241 ?auto_18243 ) ( CALIBRATION_TARGET ?auto_18242 ?auto_18243 ) ( POWER_AVAIL ?auto_18241 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18238 ?auto_18237 ?auto_18235 ?auto_18236 )
      ( GET-3IMAGE-VERIFY ?auto_18235 ?auto_18236 ?auto_18238 ?auto_18237 ?auto_18240 ?auto_18239 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18257 - DIRECTION
      ?auto_18258 - MODE
      ?auto_18260 - DIRECTION
      ?auto_18259 - MODE
      ?auto_18262 - DIRECTION
      ?auto_18261 - MODE
    )
    :vars
    (
      ?auto_18266 - INSTRUMENT
      ?auto_18263 - SATELLITE
      ?auto_18265 - DIRECTION
      ?auto_18264 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18266 ?auto_18263 ) ( SUPPORTS ?auto_18266 ?auto_18258 ) ( not ( = ?auto_18257 ?auto_18265 ) ) ( HAVE_IMAGE ?auto_18262 ?auto_18261 ) ( not ( = ?auto_18262 ?auto_18257 ) ) ( not ( = ?auto_18262 ?auto_18265 ) ) ( not ( = ?auto_18261 ?auto_18258 ) ) ( CALIBRATION_TARGET ?auto_18266 ?auto_18265 ) ( not ( = ?auto_18265 ?auto_18260 ) ) ( not ( = ?auto_18257 ?auto_18260 ) ) ( not ( = ?auto_18262 ?auto_18260 ) ) ( ON_BOARD ?auto_18264 ?auto_18263 ) ( not ( = ?auto_18266 ?auto_18264 ) ) ( SUPPORTS ?auto_18264 ?auto_18259 ) ( not ( = ?auto_18261 ?auto_18259 ) ) ( not ( = ?auto_18258 ?auto_18259 ) ) ( POINTING ?auto_18263 ?auto_18265 ) ( CALIBRATION_TARGET ?auto_18264 ?auto_18265 ) ( POWER_AVAIL ?auto_18263 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18262 ?auto_18261 ?auto_18257 ?auto_18258 )
      ( GET-3IMAGE-VERIFY ?auto_18257 ?auto_18258 ?auto_18260 ?auto_18259 ?auto_18262 ?auto_18261 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_18329 - DIRECTION
      ?auto_18330 - MODE
    )
    :vars
    (
      ?auto_18337 - INSTRUMENT
      ?auto_18331 - SATELLITE
      ?auto_18334 - DIRECTION
      ?auto_18336 - DIRECTION
      ?auto_18335 - MODE
      ?auto_18332 - DIRECTION
      ?auto_18333 - INSTRUMENT
      ?auto_18338 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_18337 ?auto_18331 ) ( SUPPORTS ?auto_18337 ?auto_18330 ) ( not ( = ?auto_18329 ?auto_18334 ) ) ( HAVE_IMAGE ?auto_18336 ?auto_18335 ) ( not ( = ?auto_18336 ?auto_18329 ) ) ( not ( = ?auto_18336 ?auto_18334 ) ) ( not ( = ?auto_18335 ?auto_18330 ) ) ( CALIBRATION_TARGET ?auto_18337 ?auto_18334 ) ( not ( = ?auto_18334 ?auto_18332 ) ) ( not ( = ?auto_18329 ?auto_18332 ) ) ( not ( = ?auto_18336 ?auto_18332 ) ) ( ON_BOARD ?auto_18333 ?auto_18331 ) ( not ( = ?auto_18337 ?auto_18333 ) ) ( SUPPORTS ?auto_18333 ?auto_18338 ) ( not ( = ?auto_18335 ?auto_18338 ) ) ( not ( = ?auto_18330 ?auto_18338 ) ) ( CALIBRATION_TARGET ?auto_18333 ?auto_18334 ) ( POWER_AVAIL ?auto_18331 ) ( POINTING ?auto_18331 ?auto_18336 ) )
    :subtasks
    ( ( !TURN_TO ?auto_18331 ?auto_18334 ?auto_18336 )
      ( GET-2IMAGE ?auto_18336 ?auto_18335 ?auto_18329 ?auto_18330 )
      ( GET-1IMAGE-VERIFY ?auto_18329 ?auto_18330 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18339 - DIRECTION
      ?auto_18340 - MODE
      ?auto_18342 - DIRECTION
      ?auto_18341 - MODE
    )
    :vars
    (
      ?auto_18344 - INSTRUMENT
      ?auto_18346 - SATELLITE
      ?auto_18347 - DIRECTION
      ?auto_18345 - DIRECTION
      ?auto_18343 - INSTRUMENT
      ?auto_18348 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_18344 ?auto_18346 ) ( SUPPORTS ?auto_18344 ?auto_18341 ) ( not ( = ?auto_18342 ?auto_18347 ) ) ( HAVE_IMAGE ?auto_18339 ?auto_18340 ) ( not ( = ?auto_18339 ?auto_18342 ) ) ( not ( = ?auto_18339 ?auto_18347 ) ) ( not ( = ?auto_18340 ?auto_18341 ) ) ( CALIBRATION_TARGET ?auto_18344 ?auto_18347 ) ( not ( = ?auto_18347 ?auto_18345 ) ) ( not ( = ?auto_18342 ?auto_18345 ) ) ( not ( = ?auto_18339 ?auto_18345 ) ) ( ON_BOARD ?auto_18343 ?auto_18346 ) ( not ( = ?auto_18344 ?auto_18343 ) ) ( SUPPORTS ?auto_18343 ?auto_18348 ) ( not ( = ?auto_18340 ?auto_18348 ) ) ( not ( = ?auto_18341 ?auto_18348 ) ) ( CALIBRATION_TARGET ?auto_18343 ?auto_18347 ) ( POWER_AVAIL ?auto_18346 ) ( POINTING ?auto_18346 ?auto_18339 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18342 ?auto_18341 )
      ( GET-2IMAGE-VERIFY ?auto_18339 ?auto_18340 ?auto_18342 ?auto_18341 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18349 - DIRECTION
      ?auto_18350 - MODE
      ?auto_18352 - DIRECTION
      ?auto_18351 - MODE
    )
    :vars
    (
      ?auto_18358 - INSTRUMENT
      ?auto_18357 - SATELLITE
      ?auto_18356 - DIRECTION
      ?auto_18354 - DIRECTION
      ?auto_18353 - MODE
      ?auto_18355 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18358 ?auto_18357 ) ( SUPPORTS ?auto_18358 ?auto_18351 ) ( not ( = ?auto_18352 ?auto_18356 ) ) ( HAVE_IMAGE ?auto_18354 ?auto_18353 ) ( not ( = ?auto_18354 ?auto_18352 ) ) ( not ( = ?auto_18354 ?auto_18356 ) ) ( not ( = ?auto_18353 ?auto_18351 ) ) ( CALIBRATION_TARGET ?auto_18358 ?auto_18356 ) ( not ( = ?auto_18356 ?auto_18349 ) ) ( not ( = ?auto_18352 ?auto_18349 ) ) ( not ( = ?auto_18354 ?auto_18349 ) ) ( ON_BOARD ?auto_18355 ?auto_18357 ) ( not ( = ?auto_18358 ?auto_18355 ) ) ( SUPPORTS ?auto_18355 ?auto_18350 ) ( not ( = ?auto_18353 ?auto_18350 ) ) ( not ( = ?auto_18351 ?auto_18350 ) ) ( CALIBRATION_TARGET ?auto_18355 ?auto_18356 ) ( POWER_AVAIL ?auto_18357 ) ( POINTING ?auto_18357 ?auto_18354 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18354 ?auto_18353 ?auto_18352 ?auto_18351 )
      ( GET-2IMAGE-VERIFY ?auto_18349 ?auto_18350 ?auto_18352 ?auto_18351 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18359 - DIRECTION
      ?auto_18360 - MODE
      ?auto_18362 - DIRECTION
      ?auto_18361 - MODE
    )
    :vars
    (
      ?auto_18368 - INSTRUMENT
      ?auto_18367 - SATELLITE
      ?auto_18366 - DIRECTION
      ?auto_18364 - DIRECTION
      ?auto_18365 - INSTRUMENT
      ?auto_18363 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_18368 ?auto_18367 ) ( SUPPORTS ?auto_18368 ?auto_18360 ) ( not ( = ?auto_18359 ?auto_18366 ) ) ( HAVE_IMAGE ?auto_18362 ?auto_18361 ) ( not ( = ?auto_18362 ?auto_18359 ) ) ( not ( = ?auto_18362 ?auto_18366 ) ) ( not ( = ?auto_18361 ?auto_18360 ) ) ( CALIBRATION_TARGET ?auto_18368 ?auto_18366 ) ( not ( = ?auto_18366 ?auto_18364 ) ) ( not ( = ?auto_18359 ?auto_18364 ) ) ( not ( = ?auto_18362 ?auto_18364 ) ) ( ON_BOARD ?auto_18365 ?auto_18367 ) ( not ( = ?auto_18368 ?auto_18365 ) ) ( SUPPORTS ?auto_18365 ?auto_18363 ) ( not ( = ?auto_18361 ?auto_18363 ) ) ( not ( = ?auto_18360 ?auto_18363 ) ) ( CALIBRATION_TARGET ?auto_18365 ?auto_18366 ) ( POWER_AVAIL ?auto_18367 ) ( POINTING ?auto_18367 ?auto_18362 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18362 ?auto_18361 ?auto_18359 ?auto_18360 )
      ( GET-2IMAGE-VERIFY ?auto_18359 ?auto_18360 ?auto_18362 ?auto_18361 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18369 - DIRECTION
      ?auto_18370 - MODE
      ?auto_18372 - DIRECTION
      ?auto_18371 - MODE
    )
    :vars
    (
      ?auto_18378 - INSTRUMENT
      ?auto_18377 - SATELLITE
      ?auto_18376 - DIRECTION
      ?auto_18374 - DIRECTION
      ?auto_18373 - MODE
      ?auto_18375 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18378 ?auto_18377 ) ( SUPPORTS ?auto_18378 ?auto_18370 ) ( not ( = ?auto_18369 ?auto_18376 ) ) ( HAVE_IMAGE ?auto_18374 ?auto_18373 ) ( not ( = ?auto_18374 ?auto_18369 ) ) ( not ( = ?auto_18374 ?auto_18376 ) ) ( not ( = ?auto_18373 ?auto_18370 ) ) ( CALIBRATION_TARGET ?auto_18378 ?auto_18376 ) ( not ( = ?auto_18376 ?auto_18372 ) ) ( not ( = ?auto_18369 ?auto_18372 ) ) ( not ( = ?auto_18374 ?auto_18372 ) ) ( ON_BOARD ?auto_18375 ?auto_18377 ) ( not ( = ?auto_18378 ?auto_18375 ) ) ( SUPPORTS ?auto_18375 ?auto_18371 ) ( not ( = ?auto_18373 ?auto_18371 ) ) ( not ( = ?auto_18370 ?auto_18371 ) ) ( CALIBRATION_TARGET ?auto_18375 ?auto_18376 ) ( POWER_AVAIL ?auto_18377 ) ( POINTING ?auto_18377 ?auto_18374 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18374 ?auto_18373 ?auto_18369 ?auto_18370 )
      ( GET-2IMAGE-VERIFY ?auto_18369 ?auto_18370 ?auto_18372 ?auto_18371 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18391 - DIRECTION
      ?auto_18392 - MODE
      ?auto_18394 - DIRECTION
      ?auto_18393 - MODE
      ?auto_18396 - DIRECTION
      ?auto_18395 - MODE
    )
    :vars
    (
      ?auto_18402 - INSTRUMENT
      ?auto_18401 - SATELLITE
      ?auto_18400 - DIRECTION
      ?auto_18398 - DIRECTION
      ?auto_18399 - INSTRUMENT
      ?auto_18397 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_18402 ?auto_18401 ) ( SUPPORTS ?auto_18402 ?auto_18395 ) ( not ( = ?auto_18396 ?auto_18400 ) ) ( HAVE_IMAGE ?auto_18391 ?auto_18392 ) ( not ( = ?auto_18391 ?auto_18396 ) ) ( not ( = ?auto_18391 ?auto_18400 ) ) ( not ( = ?auto_18392 ?auto_18395 ) ) ( CALIBRATION_TARGET ?auto_18402 ?auto_18400 ) ( not ( = ?auto_18400 ?auto_18398 ) ) ( not ( = ?auto_18396 ?auto_18398 ) ) ( not ( = ?auto_18391 ?auto_18398 ) ) ( ON_BOARD ?auto_18399 ?auto_18401 ) ( not ( = ?auto_18402 ?auto_18399 ) ) ( SUPPORTS ?auto_18399 ?auto_18397 ) ( not ( = ?auto_18392 ?auto_18397 ) ) ( not ( = ?auto_18395 ?auto_18397 ) ) ( CALIBRATION_TARGET ?auto_18399 ?auto_18400 ) ( POWER_AVAIL ?auto_18401 ) ( POINTING ?auto_18401 ?auto_18391 ) ( HAVE_IMAGE ?auto_18394 ?auto_18393 ) ( not ( = ?auto_18391 ?auto_18394 ) ) ( not ( = ?auto_18392 ?auto_18393 ) ) ( not ( = ?auto_18394 ?auto_18396 ) ) ( not ( = ?auto_18394 ?auto_18400 ) ) ( not ( = ?auto_18394 ?auto_18398 ) ) ( not ( = ?auto_18393 ?auto_18395 ) ) ( not ( = ?auto_18393 ?auto_18397 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18391 ?auto_18392 ?auto_18396 ?auto_18395 )
      ( GET-3IMAGE-VERIFY ?auto_18391 ?auto_18392 ?auto_18394 ?auto_18393 ?auto_18396 ?auto_18395 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18403 - DIRECTION
      ?auto_18404 - MODE
      ?auto_18406 - DIRECTION
      ?auto_18405 - MODE
      ?auto_18408 - DIRECTION
      ?auto_18407 - MODE
    )
    :vars
    (
      ?auto_18412 - INSTRUMENT
      ?auto_18411 - SATELLITE
      ?auto_18410 - DIRECTION
      ?auto_18409 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18412 ?auto_18411 ) ( SUPPORTS ?auto_18412 ?auto_18407 ) ( not ( = ?auto_18408 ?auto_18410 ) ) ( HAVE_IMAGE ?auto_18403 ?auto_18404 ) ( not ( = ?auto_18403 ?auto_18408 ) ) ( not ( = ?auto_18403 ?auto_18410 ) ) ( not ( = ?auto_18404 ?auto_18407 ) ) ( CALIBRATION_TARGET ?auto_18412 ?auto_18410 ) ( not ( = ?auto_18410 ?auto_18406 ) ) ( not ( = ?auto_18408 ?auto_18406 ) ) ( not ( = ?auto_18403 ?auto_18406 ) ) ( ON_BOARD ?auto_18409 ?auto_18411 ) ( not ( = ?auto_18412 ?auto_18409 ) ) ( SUPPORTS ?auto_18409 ?auto_18405 ) ( not ( = ?auto_18404 ?auto_18405 ) ) ( not ( = ?auto_18407 ?auto_18405 ) ) ( CALIBRATION_TARGET ?auto_18409 ?auto_18410 ) ( POWER_AVAIL ?auto_18411 ) ( POINTING ?auto_18411 ?auto_18403 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18403 ?auto_18404 ?auto_18408 ?auto_18407 )
      ( GET-3IMAGE-VERIFY ?auto_18403 ?auto_18404 ?auto_18406 ?auto_18405 ?auto_18408 ?auto_18407 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18413 - DIRECTION
      ?auto_18414 - MODE
      ?auto_18416 - DIRECTION
      ?auto_18415 - MODE
      ?auto_18418 - DIRECTION
      ?auto_18417 - MODE
    )
    :vars
    (
      ?auto_18424 - INSTRUMENT
      ?auto_18423 - SATELLITE
      ?auto_18422 - DIRECTION
      ?auto_18420 - DIRECTION
      ?auto_18421 - INSTRUMENT
      ?auto_18419 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_18424 ?auto_18423 ) ( SUPPORTS ?auto_18424 ?auto_18415 ) ( not ( = ?auto_18416 ?auto_18422 ) ) ( HAVE_IMAGE ?auto_18418 ?auto_18417 ) ( not ( = ?auto_18418 ?auto_18416 ) ) ( not ( = ?auto_18418 ?auto_18422 ) ) ( not ( = ?auto_18417 ?auto_18415 ) ) ( CALIBRATION_TARGET ?auto_18424 ?auto_18422 ) ( not ( = ?auto_18422 ?auto_18420 ) ) ( not ( = ?auto_18416 ?auto_18420 ) ) ( not ( = ?auto_18418 ?auto_18420 ) ) ( ON_BOARD ?auto_18421 ?auto_18423 ) ( not ( = ?auto_18424 ?auto_18421 ) ) ( SUPPORTS ?auto_18421 ?auto_18419 ) ( not ( = ?auto_18417 ?auto_18419 ) ) ( not ( = ?auto_18415 ?auto_18419 ) ) ( CALIBRATION_TARGET ?auto_18421 ?auto_18422 ) ( POWER_AVAIL ?auto_18423 ) ( POINTING ?auto_18423 ?auto_18418 ) ( HAVE_IMAGE ?auto_18413 ?auto_18414 ) ( not ( = ?auto_18413 ?auto_18416 ) ) ( not ( = ?auto_18413 ?auto_18418 ) ) ( not ( = ?auto_18413 ?auto_18422 ) ) ( not ( = ?auto_18413 ?auto_18420 ) ) ( not ( = ?auto_18414 ?auto_18415 ) ) ( not ( = ?auto_18414 ?auto_18417 ) ) ( not ( = ?auto_18414 ?auto_18419 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18418 ?auto_18417 ?auto_18416 ?auto_18415 )
      ( GET-3IMAGE-VERIFY ?auto_18413 ?auto_18414 ?auto_18416 ?auto_18415 ?auto_18418 ?auto_18417 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18425 - DIRECTION
      ?auto_18426 - MODE
      ?auto_18428 - DIRECTION
      ?auto_18427 - MODE
      ?auto_18430 - DIRECTION
      ?auto_18429 - MODE
    )
    :vars
    (
      ?auto_18434 - INSTRUMENT
      ?auto_18433 - SATELLITE
      ?auto_18432 - DIRECTION
      ?auto_18431 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18434 ?auto_18433 ) ( SUPPORTS ?auto_18434 ?auto_18427 ) ( not ( = ?auto_18428 ?auto_18432 ) ) ( HAVE_IMAGE ?auto_18425 ?auto_18426 ) ( not ( = ?auto_18425 ?auto_18428 ) ) ( not ( = ?auto_18425 ?auto_18432 ) ) ( not ( = ?auto_18426 ?auto_18427 ) ) ( CALIBRATION_TARGET ?auto_18434 ?auto_18432 ) ( not ( = ?auto_18432 ?auto_18430 ) ) ( not ( = ?auto_18428 ?auto_18430 ) ) ( not ( = ?auto_18425 ?auto_18430 ) ) ( ON_BOARD ?auto_18431 ?auto_18433 ) ( not ( = ?auto_18434 ?auto_18431 ) ) ( SUPPORTS ?auto_18431 ?auto_18429 ) ( not ( = ?auto_18426 ?auto_18429 ) ) ( not ( = ?auto_18427 ?auto_18429 ) ) ( CALIBRATION_TARGET ?auto_18431 ?auto_18432 ) ( POWER_AVAIL ?auto_18433 ) ( POINTING ?auto_18433 ?auto_18425 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18425 ?auto_18426 ?auto_18428 ?auto_18427 )
      ( GET-3IMAGE-VERIFY ?auto_18425 ?auto_18426 ?auto_18428 ?auto_18427 ?auto_18430 ?auto_18429 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18447 - DIRECTION
      ?auto_18448 - MODE
      ?auto_18450 - DIRECTION
      ?auto_18449 - MODE
      ?auto_18452 - DIRECTION
      ?auto_18451 - MODE
    )
    :vars
    (
      ?auto_18456 - INSTRUMENT
      ?auto_18455 - SATELLITE
      ?auto_18454 - DIRECTION
      ?auto_18453 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18456 ?auto_18455 ) ( SUPPORTS ?auto_18456 ?auto_18451 ) ( not ( = ?auto_18452 ?auto_18454 ) ) ( HAVE_IMAGE ?auto_18450 ?auto_18449 ) ( not ( = ?auto_18450 ?auto_18452 ) ) ( not ( = ?auto_18450 ?auto_18454 ) ) ( not ( = ?auto_18449 ?auto_18451 ) ) ( CALIBRATION_TARGET ?auto_18456 ?auto_18454 ) ( not ( = ?auto_18454 ?auto_18447 ) ) ( not ( = ?auto_18452 ?auto_18447 ) ) ( not ( = ?auto_18450 ?auto_18447 ) ) ( ON_BOARD ?auto_18453 ?auto_18455 ) ( not ( = ?auto_18456 ?auto_18453 ) ) ( SUPPORTS ?auto_18453 ?auto_18448 ) ( not ( = ?auto_18449 ?auto_18448 ) ) ( not ( = ?auto_18451 ?auto_18448 ) ) ( CALIBRATION_TARGET ?auto_18453 ?auto_18454 ) ( POWER_AVAIL ?auto_18455 ) ( POINTING ?auto_18455 ?auto_18450 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18450 ?auto_18449 ?auto_18452 ?auto_18451 )
      ( GET-3IMAGE-VERIFY ?auto_18447 ?auto_18448 ?auto_18450 ?auto_18449 ?auto_18452 ?auto_18451 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18469 - DIRECTION
      ?auto_18470 - MODE
      ?auto_18472 - DIRECTION
      ?auto_18471 - MODE
      ?auto_18474 - DIRECTION
      ?auto_18473 - MODE
    )
    :vars
    (
      ?auto_18478 - INSTRUMENT
      ?auto_18477 - SATELLITE
      ?auto_18476 - DIRECTION
      ?auto_18475 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18478 ?auto_18477 ) ( SUPPORTS ?auto_18478 ?auto_18471 ) ( not ( = ?auto_18472 ?auto_18476 ) ) ( HAVE_IMAGE ?auto_18474 ?auto_18473 ) ( not ( = ?auto_18474 ?auto_18472 ) ) ( not ( = ?auto_18474 ?auto_18476 ) ) ( not ( = ?auto_18473 ?auto_18471 ) ) ( CALIBRATION_TARGET ?auto_18478 ?auto_18476 ) ( not ( = ?auto_18476 ?auto_18469 ) ) ( not ( = ?auto_18472 ?auto_18469 ) ) ( not ( = ?auto_18474 ?auto_18469 ) ) ( ON_BOARD ?auto_18475 ?auto_18477 ) ( not ( = ?auto_18478 ?auto_18475 ) ) ( SUPPORTS ?auto_18475 ?auto_18470 ) ( not ( = ?auto_18473 ?auto_18470 ) ) ( not ( = ?auto_18471 ?auto_18470 ) ) ( CALIBRATION_TARGET ?auto_18475 ?auto_18476 ) ( POWER_AVAIL ?auto_18477 ) ( POINTING ?auto_18477 ?auto_18474 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18474 ?auto_18473 ?auto_18472 ?auto_18471 )
      ( GET-3IMAGE-VERIFY ?auto_18469 ?auto_18470 ?auto_18472 ?auto_18471 ?auto_18474 ?auto_18473 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18503 - DIRECTION
      ?auto_18504 - MODE
      ?auto_18506 - DIRECTION
      ?auto_18505 - MODE
      ?auto_18508 - DIRECTION
      ?auto_18507 - MODE
    )
    :vars
    (
      ?auto_18514 - INSTRUMENT
      ?auto_18513 - SATELLITE
      ?auto_18512 - DIRECTION
      ?auto_18510 - DIRECTION
      ?auto_18511 - INSTRUMENT
      ?auto_18509 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_18514 ?auto_18513 ) ( SUPPORTS ?auto_18514 ?auto_18504 ) ( not ( = ?auto_18503 ?auto_18512 ) ) ( HAVE_IMAGE ?auto_18506 ?auto_18507 ) ( not ( = ?auto_18506 ?auto_18503 ) ) ( not ( = ?auto_18506 ?auto_18512 ) ) ( not ( = ?auto_18507 ?auto_18504 ) ) ( CALIBRATION_TARGET ?auto_18514 ?auto_18512 ) ( not ( = ?auto_18512 ?auto_18510 ) ) ( not ( = ?auto_18503 ?auto_18510 ) ) ( not ( = ?auto_18506 ?auto_18510 ) ) ( ON_BOARD ?auto_18511 ?auto_18513 ) ( not ( = ?auto_18514 ?auto_18511 ) ) ( SUPPORTS ?auto_18511 ?auto_18509 ) ( not ( = ?auto_18507 ?auto_18509 ) ) ( not ( = ?auto_18504 ?auto_18509 ) ) ( CALIBRATION_TARGET ?auto_18511 ?auto_18512 ) ( POWER_AVAIL ?auto_18513 ) ( POINTING ?auto_18513 ?auto_18506 ) ( HAVE_IMAGE ?auto_18506 ?auto_18505 ) ( HAVE_IMAGE ?auto_18508 ?auto_18507 ) ( not ( = ?auto_18503 ?auto_18508 ) ) ( not ( = ?auto_18504 ?auto_18505 ) ) ( not ( = ?auto_18506 ?auto_18508 ) ) ( not ( = ?auto_18505 ?auto_18507 ) ) ( not ( = ?auto_18505 ?auto_18509 ) ) ( not ( = ?auto_18508 ?auto_18512 ) ) ( not ( = ?auto_18508 ?auto_18510 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18506 ?auto_18507 ?auto_18503 ?auto_18504 )
      ( GET-3IMAGE-VERIFY ?auto_18503 ?auto_18504 ?auto_18506 ?auto_18505 ?auto_18508 ?auto_18507 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18515 - DIRECTION
      ?auto_18516 - MODE
      ?auto_18518 - DIRECTION
      ?auto_18517 - MODE
      ?auto_18520 - DIRECTION
      ?auto_18519 - MODE
    )
    :vars
    (
      ?auto_18524 - INSTRUMENT
      ?auto_18523 - SATELLITE
      ?auto_18522 - DIRECTION
      ?auto_18521 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18524 ?auto_18523 ) ( SUPPORTS ?auto_18524 ?auto_18516 ) ( not ( = ?auto_18515 ?auto_18522 ) ) ( HAVE_IMAGE ?auto_18518 ?auto_18517 ) ( not ( = ?auto_18518 ?auto_18515 ) ) ( not ( = ?auto_18518 ?auto_18522 ) ) ( not ( = ?auto_18517 ?auto_18516 ) ) ( CALIBRATION_TARGET ?auto_18524 ?auto_18522 ) ( not ( = ?auto_18522 ?auto_18520 ) ) ( not ( = ?auto_18515 ?auto_18520 ) ) ( not ( = ?auto_18518 ?auto_18520 ) ) ( ON_BOARD ?auto_18521 ?auto_18523 ) ( not ( = ?auto_18524 ?auto_18521 ) ) ( SUPPORTS ?auto_18521 ?auto_18519 ) ( not ( = ?auto_18517 ?auto_18519 ) ) ( not ( = ?auto_18516 ?auto_18519 ) ) ( CALIBRATION_TARGET ?auto_18521 ?auto_18522 ) ( POWER_AVAIL ?auto_18523 ) ( POINTING ?auto_18523 ?auto_18518 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18518 ?auto_18517 ?auto_18515 ?auto_18516 )
      ( GET-3IMAGE-VERIFY ?auto_18515 ?auto_18516 ?auto_18518 ?auto_18517 ?auto_18520 ?auto_18519 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18537 - DIRECTION
      ?auto_18538 - MODE
      ?auto_18540 - DIRECTION
      ?auto_18539 - MODE
      ?auto_18542 - DIRECTION
      ?auto_18541 - MODE
    )
    :vars
    (
      ?auto_18546 - INSTRUMENT
      ?auto_18545 - SATELLITE
      ?auto_18544 - DIRECTION
      ?auto_18543 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18546 ?auto_18545 ) ( SUPPORTS ?auto_18546 ?auto_18538 ) ( not ( = ?auto_18537 ?auto_18544 ) ) ( HAVE_IMAGE ?auto_18542 ?auto_18541 ) ( not ( = ?auto_18542 ?auto_18537 ) ) ( not ( = ?auto_18542 ?auto_18544 ) ) ( not ( = ?auto_18541 ?auto_18538 ) ) ( CALIBRATION_TARGET ?auto_18546 ?auto_18544 ) ( not ( = ?auto_18544 ?auto_18540 ) ) ( not ( = ?auto_18537 ?auto_18540 ) ) ( not ( = ?auto_18542 ?auto_18540 ) ) ( ON_BOARD ?auto_18543 ?auto_18545 ) ( not ( = ?auto_18546 ?auto_18543 ) ) ( SUPPORTS ?auto_18543 ?auto_18539 ) ( not ( = ?auto_18541 ?auto_18539 ) ) ( not ( = ?auto_18538 ?auto_18539 ) ) ( CALIBRATION_TARGET ?auto_18543 ?auto_18544 ) ( POWER_AVAIL ?auto_18545 ) ( POINTING ?auto_18545 ?auto_18542 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18542 ?auto_18541 ?auto_18537 ?auto_18538 )
      ( GET-3IMAGE-VERIFY ?auto_18537 ?auto_18538 ?auto_18540 ?auto_18539 ?auto_18542 ?auto_18541 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_18609 - DIRECTION
      ?auto_18610 - MODE
    )
    :vars
    (
      ?auto_18618 - INSTRUMENT
      ?auto_18617 - SATELLITE
      ?auto_18616 - DIRECTION
      ?auto_18613 - DIRECTION
      ?auto_18612 - MODE
      ?auto_18614 - DIRECTION
      ?auto_18615 - INSTRUMENT
      ?auto_18611 - MODE
      ?auto_18619 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18618 ?auto_18617 ) ( SUPPORTS ?auto_18618 ?auto_18610 ) ( not ( = ?auto_18609 ?auto_18616 ) ) ( HAVE_IMAGE ?auto_18613 ?auto_18612 ) ( not ( = ?auto_18613 ?auto_18609 ) ) ( not ( = ?auto_18613 ?auto_18616 ) ) ( not ( = ?auto_18612 ?auto_18610 ) ) ( CALIBRATION_TARGET ?auto_18618 ?auto_18616 ) ( not ( = ?auto_18616 ?auto_18614 ) ) ( not ( = ?auto_18609 ?auto_18614 ) ) ( not ( = ?auto_18613 ?auto_18614 ) ) ( ON_BOARD ?auto_18615 ?auto_18617 ) ( not ( = ?auto_18618 ?auto_18615 ) ) ( SUPPORTS ?auto_18615 ?auto_18611 ) ( not ( = ?auto_18612 ?auto_18611 ) ) ( not ( = ?auto_18610 ?auto_18611 ) ) ( CALIBRATION_TARGET ?auto_18615 ?auto_18616 ) ( POINTING ?auto_18617 ?auto_18613 ) ( ON_BOARD ?auto_18619 ?auto_18617 ) ( POWER_ON ?auto_18619 ) ( not ( = ?auto_18618 ?auto_18619 ) ) ( not ( = ?auto_18615 ?auto_18619 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_18619 ?auto_18617 )
      ( GET-2IMAGE ?auto_18613 ?auto_18612 ?auto_18609 ?auto_18610 )
      ( GET-1IMAGE-VERIFY ?auto_18609 ?auto_18610 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18620 - DIRECTION
      ?auto_18621 - MODE
      ?auto_18623 - DIRECTION
      ?auto_18622 - MODE
    )
    :vars
    (
      ?auto_18629 - INSTRUMENT
      ?auto_18627 - SATELLITE
      ?auto_18626 - DIRECTION
      ?auto_18625 - DIRECTION
      ?auto_18624 - INSTRUMENT
      ?auto_18628 - MODE
      ?auto_18630 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18629 ?auto_18627 ) ( SUPPORTS ?auto_18629 ?auto_18622 ) ( not ( = ?auto_18623 ?auto_18626 ) ) ( HAVE_IMAGE ?auto_18620 ?auto_18621 ) ( not ( = ?auto_18620 ?auto_18623 ) ) ( not ( = ?auto_18620 ?auto_18626 ) ) ( not ( = ?auto_18621 ?auto_18622 ) ) ( CALIBRATION_TARGET ?auto_18629 ?auto_18626 ) ( not ( = ?auto_18626 ?auto_18625 ) ) ( not ( = ?auto_18623 ?auto_18625 ) ) ( not ( = ?auto_18620 ?auto_18625 ) ) ( ON_BOARD ?auto_18624 ?auto_18627 ) ( not ( = ?auto_18629 ?auto_18624 ) ) ( SUPPORTS ?auto_18624 ?auto_18628 ) ( not ( = ?auto_18621 ?auto_18628 ) ) ( not ( = ?auto_18622 ?auto_18628 ) ) ( CALIBRATION_TARGET ?auto_18624 ?auto_18626 ) ( POINTING ?auto_18627 ?auto_18620 ) ( ON_BOARD ?auto_18630 ?auto_18627 ) ( POWER_ON ?auto_18630 ) ( not ( = ?auto_18629 ?auto_18630 ) ) ( not ( = ?auto_18624 ?auto_18630 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18623 ?auto_18622 )
      ( GET-2IMAGE-VERIFY ?auto_18620 ?auto_18621 ?auto_18623 ?auto_18622 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18631 - DIRECTION
      ?auto_18632 - MODE
      ?auto_18634 - DIRECTION
      ?auto_18633 - MODE
    )
    :vars
    (
      ?auto_18638 - INSTRUMENT
      ?auto_18639 - SATELLITE
      ?auto_18635 - DIRECTION
      ?auto_18641 - DIRECTION
      ?auto_18640 - MODE
      ?auto_18637 - INSTRUMENT
      ?auto_18636 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18638 ?auto_18639 ) ( SUPPORTS ?auto_18638 ?auto_18633 ) ( not ( = ?auto_18634 ?auto_18635 ) ) ( HAVE_IMAGE ?auto_18641 ?auto_18640 ) ( not ( = ?auto_18641 ?auto_18634 ) ) ( not ( = ?auto_18641 ?auto_18635 ) ) ( not ( = ?auto_18640 ?auto_18633 ) ) ( CALIBRATION_TARGET ?auto_18638 ?auto_18635 ) ( not ( = ?auto_18635 ?auto_18631 ) ) ( not ( = ?auto_18634 ?auto_18631 ) ) ( not ( = ?auto_18641 ?auto_18631 ) ) ( ON_BOARD ?auto_18637 ?auto_18639 ) ( not ( = ?auto_18638 ?auto_18637 ) ) ( SUPPORTS ?auto_18637 ?auto_18632 ) ( not ( = ?auto_18640 ?auto_18632 ) ) ( not ( = ?auto_18633 ?auto_18632 ) ) ( CALIBRATION_TARGET ?auto_18637 ?auto_18635 ) ( POINTING ?auto_18639 ?auto_18641 ) ( ON_BOARD ?auto_18636 ?auto_18639 ) ( POWER_ON ?auto_18636 ) ( not ( = ?auto_18638 ?auto_18636 ) ) ( not ( = ?auto_18637 ?auto_18636 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18641 ?auto_18640 ?auto_18634 ?auto_18633 )
      ( GET-2IMAGE-VERIFY ?auto_18631 ?auto_18632 ?auto_18634 ?auto_18633 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18642 - DIRECTION
      ?auto_18643 - MODE
      ?auto_18645 - DIRECTION
      ?auto_18644 - MODE
    )
    :vars
    (
      ?auto_18651 - INSTRUMENT
      ?auto_18652 - SATELLITE
      ?auto_18646 - DIRECTION
      ?auto_18649 - DIRECTION
      ?auto_18648 - INSTRUMENT
      ?auto_18650 - MODE
      ?auto_18647 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18651 ?auto_18652 ) ( SUPPORTS ?auto_18651 ?auto_18643 ) ( not ( = ?auto_18642 ?auto_18646 ) ) ( HAVE_IMAGE ?auto_18645 ?auto_18644 ) ( not ( = ?auto_18645 ?auto_18642 ) ) ( not ( = ?auto_18645 ?auto_18646 ) ) ( not ( = ?auto_18644 ?auto_18643 ) ) ( CALIBRATION_TARGET ?auto_18651 ?auto_18646 ) ( not ( = ?auto_18646 ?auto_18649 ) ) ( not ( = ?auto_18642 ?auto_18649 ) ) ( not ( = ?auto_18645 ?auto_18649 ) ) ( ON_BOARD ?auto_18648 ?auto_18652 ) ( not ( = ?auto_18651 ?auto_18648 ) ) ( SUPPORTS ?auto_18648 ?auto_18650 ) ( not ( = ?auto_18644 ?auto_18650 ) ) ( not ( = ?auto_18643 ?auto_18650 ) ) ( CALIBRATION_TARGET ?auto_18648 ?auto_18646 ) ( POINTING ?auto_18652 ?auto_18645 ) ( ON_BOARD ?auto_18647 ?auto_18652 ) ( POWER_ON ?auto_18647 ) ( not ( = ?auto_18651 ?auto_18647 ) ) ( not ( = ?auto_18648 ?auto_18647 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18645 ?auto_18644 ?auto_18642 ?auto_18643 )
      ( GET-2IMAGE-VERIFY ?auto_18642 ?auto_18643 ?auto_18645 ?auto_18644 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18653 - DIRECTION
      ?auto_18654 - MODE
      ?auto_18656 - DIRECTION
      ?auto_18655 - MODE
    )
    :vars
    (
      ?auto_18660 - INSTRUMENT
      ?auto_18661 - SATELLITE
      ?auto_18657 - DIRECTION
      ?auto_18663 - DIRECTION
      ?auto_18662 - MODE
      ?auto_18659 - INSTRUMENT
      ?auto_18658 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18660 ?auto_18661 ) ( SUPPORTS ?auto_18660 ?auto_18654 ) ( not ( = ?auto_18653 ?auto_18657 ) ) ( HAVE_IMAGE ?auto_18663 ?auto_18662 ) ( not ( = ?auto_18663 ?auto_18653 ) ) ( not ( = ?auto_18663 ?auto_18657 ) ) ( not ( = ?auto_18662 ?auto_18654 ) ) ( CALIBRATION_TARGET ?auto_18660 ?auto_18657 ) ( not ( = ?auto_18657 ?auto_18656 ) ) ( not ( = ?auto_18653 ?auto_18656 ) ) ( not ( = ?auto_18663 ?auto_18656 ) ) ( ON_BOARD ?auto_18659 ?auto_18661 ) ( not ( = ?auto_18660 ?auto_18659 ) ) ( SUPPORTS ?auto_18659 ?auto_18655 ) ( not ( = ?auto_18662 ?auto_18655 ) ) ( not ( = ?auto_18654 ?auto_18655 ) ) ( CALIBRATION_TARGET ?auto_18659 ?auto_18657 ) ( POINTING ?auto_18661 ?auto_18663 ) ( ON_BOARD ?auto_18658 ?auto_18661 ) ( POWER_ON ?auto_18658 ) ( not ( = ?auto_18660 ?auto_18658 ) ) ( not ( = ?auto_18659 ?auto_18658 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18663 ?auto_18662 ?auto_18653 ?auto_18654 )
      ( GET-2IMAGE-VERIFY ?auto_18653 ?auto_18654 ?auto_18656 ?auto_18655 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18677 - DIRECTION
      ?auto_18678 - MODE
      ?auto_18680 - DIRECTION
      ?auto_18679 - MODE
      ?auto_18682 - DIRECTION
      ?auto_18681 - MODE
    )
    :vars
    (
      ?auto_18688 - INSTRUMENT
      ?auto_18689 - SATELLITE
      ?auto_18683 - DIRECTION
      ?auto_18686 - DIRECTION
      ?auto_18685 - INSTRUMENT
      ?auto_18687 - MODE
      ?auto_18684 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18688 ?auto_18689 ) ( SUPPORTS ?auto_18688 ?auto_18681 ) ( not ( = ?auto_18682 ?auto_18683 ) ) ( HAVE_IMAGE ?auto_18677 ?auto_18678 ) ( not ( = ?auto_18677 ?auto_18682 ) ) ( not ( = ?auto_18677 ?auto_18683 ) ) ( not ( = ?auto_18678 ?auto_18681 ) ) ( CALIBRATION_TARGET ?auto_18688 ?auto_18683 ) ( not ( = ?auto_18683 ?auto_18686 ) ) ( not ( = ?auto_18682 ?auto_18686 ) ) ( not ( = ?auto_18677 ?auto_18686 ) ) ( ON_BOARD ?auto_18685 ?auto_18689 ) ( not ( = ?auto_18688 ?auto_18685 ) ) ( SUPPORTS ?auto_18685 ?auto_18687 ) ( not ( = ?auto_18678 ?auto_18687 ) ) ( not ( = ?auto_18681 ?auto_18687 ) ) ( CALIBRATION_TARGET ?auto_18685 ?auto_18683 ) ( POINTING ?auto_18689 ?auto_18677 ) ( ON_BOARD ?auto_18684 ?auto_18689 ) ( POWER_ON ?auto_18684 ) ( not ( = ?auto_18688 ?auto_18684 ) ) ( not ( = ?auto_18685 ?auto_18684 ) ) ( HAVE_IMAGE ?auto_18680 ?auto_18679 ) ( not ( = ?auto_18677 ?auto_18680 ) ) ( not ( = ?auto_18678 ?auto_18679 ) ) ( not ( = ?auto_18680 ?auto_18682 ) ) ( not ( = ?auto_18680 ?auto_18683 ) ) ( not ( = ?auto_18680 ?auto_18686 ) ) ( not ( = ?auto_18679 ?auto_18681 ) ) ( not ( = ?auto_18679 ?auto_18687 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18677 ?auto_18678 ?auto_18682 ?auto_18681 )
      ( GET-3IMAGE-VERIFY ?auto_18677 ?auto_18678 ?auto_18680 ?auto_18679 ?auto_18682 ?auto_18681 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18690 - DIRECTION
      ?auto_18691 - MODE
      ?auto_18693 - DIRECTION
      ?auto_18692 - MODE
      ?auto_18695 - DIRECTION
      ?auto_18694 - MODE
    )
    :vars
    (
      ?auto_18699 - INSTRUMENT
      ?auto_18700 - SATELLITE
      ?auto_18696 - DIRECTION
      ?auto_18698 - INSTRUMENT
      ?auto_18697 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18699 ?auto_18700 ) ( SUPPORTS ?auto_18699 ?auto_18694 ) ( not ( = ?auto_18695 ?auto_18696 ) ) ( HAVE_IMAGE ?auto_18690 ?auto_18691 ) ( not ( = ?auto_18690 ?auto_18695 ) ) ( not ( = ?auto_18690 ?auto_18696 ) ) ( not ( = ?auto_18691 ?auto_18694 ) ) ( CALIBRATION_TARGET ?auto_18699 ?auto_18696 ) ( not ( = ?auto_18696 ?auto_18693 ) ) ( not ( = ?auto_18695 ?auto_18693 ) ) ( not ( = ?auto_18690 ?auto_18693 ) ) ( ON_BOARD ?auto_18698 ?auto_18700 ) ( not ( = ?auto_18699 ?auto_18698 ) ) ( SUPPORTS ?auto_18698 ?auto_18692 ) ( not ( = ?auto_18691 ?auto_18692 ) ) ( not ( = ?auto_18694 ?auto_18692 ) ) ( CALIBRATION_TARGET ?auto_18698 ?auto_18696 ) ( POINTING ?auto_18700 ?auto_18690 ) ( ON_BOARD ?auto_18697 ?auto_18700 ) ( POWER_ON ?auto_18697 ) ( not ( = ?auto_18699 ?auto_18697 ) ) ( not ( = ?auto_18698 ?auto_18697 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18690 ?auto_18691 ?auto_18695 ?auto_18694 )
      ( GET-3IMAGE-VERIFY ?auto_18690 ?auto_18691 ?auto_18693 ?auto_18692 ?auto_18695 ?auto_18694 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18701 - DIRECTION
      ?auto_18702 - MODE
      ?auto_18704 - DIRECTION
      ?auto_18703 - MODE
      ?auto_18706 - DIRECTION
      ?auto_18705 - MODE
    )
    :vars
    (
      ?auto_18712 - INSTRUMENT
      ?auto_18713 - SATELLITE
      ?auto_18707 - DIRECTION
      ?auto_18710 - DIRECTION
      ?auto_18709 - INSTRUMENT
      ?auto_18711 - MODE
      ?auto_18708 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18712 ?auto_18713 ) ( SUPPORTS ?auto_18712 ?auto_18703 ) ( not ( = ?auto_18704 ?auto_18707 ) ) ( HAVE_IMAGE ?auto_18706 ?auto_18705 ) ( not ( = ?auto_18706 ?auto_18704 ) ) ( not ( = ?auto_18706 ?auto_18707 ) ) ( not ( = ?auto_18705 ?auto_18703 ) ) ( CALIBRATION_TARGET ?auto_18712 ?auto_18707 ) ( not ( = ?auto_18707 ?auto_18710 ) ) ( not ( = ?auto_18704 ?auto_18710 ) ) ( not ( = ?auto_18706 ?auto_18710 ) ) ( ON_BOARD ?auto_18709 ?auto_18713 ) ( not ( = ?auto_18712 ?auto_18709 ) ) ( SUPPORTS ?auto_18709 ?auto_18711 ) ( not ( = ?auto_18705 ?auto_18711 ) ) ( not ( = ?auto_18703 ?auto_18711 ) ) ( CALIBRATION_TARGET ?auto_18709 ?auto_18707 ) ( POINTING ?auto_18713 ?auto_18706 ) ( ON_BOARD ?auto_18708 ?auto_18713 ) ( POWER_ON ?auto_18708 ) ( not ( = ?auto_18712 ?auto_18708 ) ) ( not ( = ?auto_18709 ?auto_18708 ) ) ( HAVE_IMAGE ?auto_18701 ?auto_18702 ) ( not ( = ?auto_18701 ?auto_18704 ) ) ( not ( = ?auto_18701 ?auto_18706 ) ) ( not ( = ?auto_18701 ?auto_18707 ) ) ( not ( = ?auto_18701 ?auto_18710 ) ) ( not ( = ?auto_18702 ?auto_18703 ) ) ( not ( = ?auto_18702 ?auto_18705 ) ) ( not ( = ?auto_18702 ?auto_18711 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18706 ?auto_18705 ?auto_18704 ?auto_18703 )
      ( GET-3IMAGE-VERIFY ?auto_18701 ?auto_18702 ?auto_18704 ?auto_18703 ?auto_18706 ?auto_18705 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18714 - DIRECTION
      ?auto_18715 - MODE
      ?auto_18717 - DIRECTION
      ?auto_18716 - MODE
      ?auto_18719 - DIRECTION
      ?auto_18718 - MODE
    )
    :vars
    (
      ?auto_18723 - INSTRUMENT
      ?auto_18724 - SATELLITE
      ?auto_18720 - DIRECTION
      ?auto_18722 - INSTRUMENT
      ?auto_18721 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18723 ?auto_18724 ) ( SUPPORTS ?auto_18723 ?auto_18716 ) ( not ( = ?auto_18717 ?auto_18720 ) ) ( HAVE_IMAGE ?auto_18714 ?auto_18715 ) ( not ( = ?auto_18714 ?auto_18717 ) ) ( not ( = ?auto_18714 ?auto_18720 ) ) ( not ( = ?auto_18715 ?auto_18716 ) ) ( CALIBRATION_TARGET ?auto_18723 ?auto_18720 ) ( not ( = ?auto_18720 ?auto_18719 ) ) ( not ( = ?auto_18717 ?auto_18719 ) ) ( not ( = ?auto_18714 ?auto_18719 ) ) ( ON_BOARD ?auto_18722 ?auto_18724 ) ( not ( = ?auto_18723 ?auto_18722 ) ) ( SUPPORTS ?auto_18722 ?auto_18718 ) ( not ( = ?auto_18715 ?auto_18718 ) ) ( not ( = ?auto_18716 ?auto_18718 ) ) ( CALIBRATION_TARGET ?auto_18722 ?auto_18720 ) ( POINTING ?auto_18724 ?auto_18714 ) ( ON_BOARD ?auto_18721 ?auto_18724 ) ( POWER_ON ?auto_18721 ) ( not ( = ?auto_18723 ?auto_18721 ) ) ( not ( = ?auto_18722 ?auto_18721 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18714 ?auto_18715 ?auto_18717 ?auto_18716 )
      ( GET-3IMAGE-VERIFY ?auto_18714 ?auto_18715 ?auto_18717 ?auto_18716 ?auto_18719 ?auto_18718 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18738 - DIRECTION
      ?auto_18739 - MODE
      ?auto_18741 - DIRECTION
      ?auto_18740 - MODE
      ?auto_18743 - DIRECTION
      ?auto_18742 - MODE
    )
    :vars
    (
      ?auto_18747 - INSTRUMENT
      ?auto_18748 - SATELLITE
      ?auto_18744 - DIRECTION
      ?auto_18746 - INSTRUMENT
      ?auto_18745 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18747 ?auto_18748 ) ( SUPPORTS ?auto_18747 ?auto_18742 ) ( not ( = ?auto_18743 ?auto_18744 ) ) ( HAVE_IMAGE ?auto_18741 ?auto_18740 ) ( not ( = ?auto_18741 ?auto_18743 ) ) ( not ( = ?auto_18741 ?auto_18744 ) ) ( not ( = ?auto_18740 ?auto_18742 ) ) ( CALIBRATION_TARGET ?auto_18747 ?auto_18744 ) ( not ( = ?auto_18744 ?auto_18738 ) ) ( not ( = ?auto_18743 ?auto_18738 ) ) ( not ( = ?auto_18741 ?auto_18738 ) ) ( ON_BOARD ?auto_18746 ?auto_18748 ) ( not ( = ?auto_18747 ?auto_18746 ) ) ( SUPPORTS ?auto_18746 ?auto_18739 ) ( not ( = ?auto_18740 ?auto_18739 ) ) ( not ( = ?auto_18742 ?auto_18739 ) ) ( CALIBRATION_TARGET ?auto_18746 ?auto_18744 ) ( POINTING ?auto_18748 ?auto_18741 ) ( ON_BOARD ?auto_18745 ?auto_18748 ) ( POWER_ON ?auto_18745 ) ( not ( = ?auto_18747 ?auto_18745 ) ) ( not ( = ?auto_18746 ?auto_18745 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18741 ?auto_18740 ?auto_18743 ?auto_18742 )
      ( GET-3IMAGE-VERIFY ?auto_18738 ?auto_18739 ?auto_18741 ?auto_18740 ?auto_18743 ?auto_18742 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18762 - DIRECTION
      ?auto_18763 - MODE
      ?auto_18765 - DIRECTION
      ?auto_18764 - MODE
      ?auto_18767 - DIRECTION
      ?auto_18766 - MODE
    )
    :vars
    (
      ?auto_18771 - INSTRUMENT
      ?auto_18772 - SATELLITE
      ?auto_18768 - DIRECTION
      ?auto_18770 - INSTRUMENT
      ?auto_18769 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18771 ?auto_18772 ) ( SUPPORTS ?auto_18771 ?auto_18764 ) ( not ( = ?auto_18765 ?auto_18768 ) ) ( HAVE_IMAGE ?auto_18767 ?auto_18766 ) ( not ( = ?auto_18767 ?auto_18765 ) ) ( not ( = ?auto_18767 ?auto_18768 ) ) ( not ( = ?auto_18766 ?auto_18764 ) ) ( CALIBRATION_TARGET ?auto_18771 ?auto_18768 ) ( not ( = ?auto_18768 ?auto_18762 ) ) ( not ( = ?auto_18765 ?auto_18762 ) ) ( not ( = ?auto_18767 ?auto_18762 ) ) ( ON_BOARD ?auto_18770 ?auto_18772 ) ( not ( = ?auto_18771 ?auto_18770 ) ) ( SUPPORTS ?auto_18770 ?auto_18763 ) ( not ( = ?auto_18766 ?auto_18763 ) ) ( not ( = ?auto_18764 ?auto_18763 ) ) ( CALIBRATION_TARGET ?auto_18770 ?auto_18768 ) ( POINTING ?auto_18772 ?auto_18767 ) ( ON_BOARD ?auto_18769 ?auto_18772 ) ( POWER_ON ?auto_18769 ) ( not ( = ?auto_18771 ?auto_18769 ) ) ( not ( = ?auto_18770 ?auto_18769 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18767 ?auto_18766 ?auto_18765 ?auto_18764 )
      ( GET-3IMAGE-VERIFY ?auto_18762 ?auto_18763 ?auto_18765 ?auto_18764 ?auto_18767 ?auto_18766 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18799 - DIRECTION
      ?auto_18800 - MODE
      ?auto_18802 - DIRECTION
      ?auto_18801 - MODE
      ?auto_18804 - DIRECTION
      ?auto_18803 - MODE
    )
    :vars
    (
      ?auto_18810 - INSTRUMENT
      ?auto_18811 - SATELLITE
      ?auto_18805 - DIRECTION
      ?auto_18808 - DIRECTION
      ?auto_18807 - INSTRUMENT
      ?auto_18809 - MODE
      ?auto_18806 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18810 ?auto_18811 ) ( SUPPORTS ?auto_18810 ?auto_18800 ) ( not ( = ?auto_18799 ?auto_18805 ) ) ( HAVE_IMAGE ?auto_18804 ?auto_18803 ) ( not ( = ?auto_18804 ?auto_18799 ) ) ( not ( = ?auto_18804 ?auto_18805 ) ) ( not ( = ?auto_18803 ?auto_18800 ) ) ( CALIBRATION_TARGET ?auto_18810 ?auto_18805 ) ( not ( = ?auto_18805 ?auto_18808 ) ) ( not ( = ?auto_18799 ?auto_18808 ) ) ( not ( = ?auto_18804 ?auto_18808 ) ) ( ON_BOARD ?auto_18807 ?auto_18811 ) ( not ( = ?auto_18810 ?auto_18807 ) ) ( SUPPORTS ?auto_18807 ?auto_18809 ) ( not ( = ?auto_18803 ?auto_18809 ) ) ( not ( = ?auto_18800 ?auto_18809 ) ) ( CALIBRATION_TARGET ?auto_18807 ?auto_18805 ) ( POINTING ?auto_18811 ?auto_18804 ) ( ON_BOARD ?auto_18806 ?auto_18811 ) ( POWER_ON ?auto_18806 ) ( not ( = ?auto_18810 ?auto_18806 ) ) ( not ( = ?auto_18807 ?auto_18806 ) ) ( HAVE_IMAGE ?auto_18802 ?auto_18801 ) ( not ( = ?auto_18799 ?auto_18802 ) ) ( not ( = ?auto_18800 ?auto_18801 ) ) ( not ( = ?auto_18802 ?auto_18804 ) ) ( not ( = ?auto_18802 ?auto_18805 ) ) ( not ( = ?auto_18802 ?auto_18808 ) ) ( not ( = ?auto_18801 ?auto_18803 ) ) ( not ( = ?auto_18801 ?auto_18809 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18804 ?auto_18803 ?auto_18799 ?auto_18800 )
      ( GET-3IMAGE-VERIFY ?auto_18799 ?auto_18800 ?auto_18802 ?auto_18801 ?auto_18804 ?auto_18803 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18812 - DIRECTION
      ?auto_18813 - MODE
      ?auto_18815 - DIRECTION
      ?auto_18814 - MODE
      ?auto_18817 - DIRECTION
      ?auto_18816 - MODE
    )
    :vars
    (
      ?auto_18821 - INSTRUMENT
      ?auto_18822 - SATELLITE
      ?auto_18818 - DIRECTION
      ?auto_18820 - INSTRUMENT
      ?auto_18819 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18821 ?auto_18822 ) ( SUPPORTS ?auto_18821 ?auto_18813 ) ( not ( = ?auto_18812 ?auto_18818 ) ) ( HAVE_IMAGE ?auto_18815 ?auto_18814 ) ( not ( = ?auto_18815 ?auto_18812 ) ) ( not ( = ?auto_18815 ?auto_18818 ) ) ( not ( = ?auto_18814 ?auto_18813 ) ) ( CALIBRATION_TARGET ?auto_18821 ?auto_18818 ) ( not ( = ?auto_18818 ?auto_18817 ) ) ( not ( = ?auto_18812 ?auto_18817 ) ) ( not ( = ?auto_18815 ?auto_18817 ) ) ( ON_BOARD ?auto_18820 ?auto_18822 ) ( not ( = ?auto_18821 ?auto_18820 ) ) ( SUPPORTS ?auto_18820 ?auto_18816 ) ( not ( = ?auto_18814 ?auto_18816 ) ) ( not ( = ?auto_18813 ?auto_18816 ) ) ( CALIBRATION_TARGET ?auto_18820 ?auto_18818 ) ( POINTING ?auto_18822 ?auto_18815 ) ( ON_BOARD ?auto_18819 ?auto_18822 ) ( POWER_ON ?auto_18819 ) ( not ( = ?auto_18821 ?auto_18819 ) ) ( not ( = ?auto_18820 ?auto_18819 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18815 ?auto_18814 ?auto_18812 ?auto_18813 )
      ( GET-3IMAGE-VERIFY ?auto_18812 ?auto_18813 ?auto_18815 ?auto_18814 ?auto_18817 ?auto_18816 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18836 - DIRECTION
      ?auto_18837 - MODE
      ?auto_18839 - DIRECTION
      ?auto_18838 - MODE
      ?auto_18841 - DIRECTION
      ?auto_18840 - MODE
    )
    :vars
    (
      ?auto_18845 - INSTRUMENT
      ?auto_18846 - SATELLITE
      ?auto_18842 - DIRECTION
      ?auto_18844 - INSTRUMENT
      ?auto_18843 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18845 ?auto_18846 ) ( SUPPORTS ?auto_18845 ?auto_18837 ) ( not ( = ?auto_18836 ?auto_18842 ) ) ( HAVE_IMAGE ?auto_18841 ?auto_18840 ) ( not ( = ?auto_18841 ?auto_18836 ) ) ( not ( = ?auto_18841 ?auto_18842 ) ) ( not ( = ?auto_18840 ?auto_18837 ) ) ( CALIBRATION_TARGET ?auto_18845 ?auto_18842 ) ( not ( = ?auto_18842 ?auto_18839 ) ) ( not ( = ?auto_18836 ?auto_18839 ) ) ( not ( = ?auto_18841 ?auto_18839 ) ) ( ON_BOARD ?auto_18844 ?auto_18846 ) ( not ( = ?auto_18845 ?auto_18844 ) ) ( SUPPORTS ?auto_18844 ?auto_18838 ) ( not ( = ?auto_18840 ?auto_18838 ) ) ( not ( = ?auto_18837 ?auto_18838 ) ) ( CALIBRATION_TARGET ?auto_18844 ?auto_18842 ) ( POINTING ?auto_18846 ?auto_18841 ) ( ON_BOARD ?auto_18843 ?auto_18846 ) ( POWER_ON ?auto_18843 ) ( not ( = ?auto_18845 ?auto_18843 ) ) ( not ( = ?auto_18844 ?auto_18843 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18841 ?auto_18840 ?auto_18836 ?auto_18837 )
      ( GET-3IMAGE-VERIFY ?auto_18836 ?auto_18837 ?auto_18839 ?auto_18838 ?auto_18841 ?auto_18840 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_18914 - DIRECTION
      ?auto_18915 - MODE
    )
    :vars
    (
      ?auto_18921 - INSTRUMENT
      ?auto_18922 - SATELLITE
      ?auto_18916 - DIRECTION
      ?auto_18924 - DIRECTION
      ?auto_18923 - MODE
      ?auto_18919 - DIRECTION
      ?auto_18918 - INSTRUMENT
      ?auto_18920 - MODE
      ?auto_18917 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18921 ?auto_18922 ) ( SUPPORTS ?auto_18921 ?auto_18915 ) ( not ( = ?auto_18914 ?auto_18916 ) ) ( not ( = ?auto_18924 ?auto_18914 ) ) ( not ( = ?auto_18924 ?auto_18916 ) ) ( not ( = ?auto_18923 ?auto_18915 ) ) ( CALIBRATION_TARGET ?auto_18921 ?auto_18916 ) ( not ( = ?auto_18916 ?auto_18919 ) ) ( not ( = ?auto_18914 ?auto_18919 ) ) ( not ( = ?auto_18924 ?auto_18919 ) ) ( ON_BOARD ?auto_18918 ?auto_18922 ) ( not ( = ?auto_18921 ?auto_18918 ) ) ( SUPPORTS ?auto_18918 ?auto_18920 ) ( not ( = ?auto_18923 ?auto_18920 ) ) ( not ( = ?auto_18915 ?auto_18920 ) ) ( CALIBRATION_TARGET ?auto_18918 ?auto_18916 ) ( POINTING ?auto_18922 ?auto_18924 ) ( ON_BOARD ?auto_18917 ?auto_18922 ) ( POWER_ON ?auto_18917 ) ( not ( = ?auto_18921 ?auto_18917 ) ) ( not ( = ?auto_18918 ?auto_18917 ) ) ( CALIBRATED ?auto_18917 ) ( SUPPORTS ?auto_18917 ?auto_18923 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18924 ?auto_18923 )
      ( GET-2IMAGE ?auto_18924 ?auto_18923 ?auto_18914 ?auto_18915 )
      ( GET-1IMAGE-VERIFY ?auto_18914 ?auto_18915 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18925 - DIRECTION
      ?auto_18926 - MODE
      ?auto_18928 - DIRECTION
      ?auto_18927 - MODE
    )
    :vars
    (
      ?auto_18935 - INSTRUMENT
      ?auto_18929 - SATELLITE
      ?auto_18933 - DIRECTION
      ?auto_18931 - DIRECTION
      ?auto_18930 - INSTRUMENT
      ?auto_18932 - MODE
      ?auto_18934 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18935 ?auto_18929 ) ( SUPPORTS ?auto_18935 ?auto_18927 ) ( not ( = ?auto_18928 ?auto_18933 ) ) ( not ( = ?auto_18925 ?auto_18928 ) ) ( not ( = ?auto_18925 ?auto_18933 ) ) ( not ( = ?auto_18926 ?auto_18927 ) ) ( CALIBRATION_TARGET ?auto_18935 ?auto_18933 ) ( not ( = ?auto_18933 ?auto_18931 ) ) ( not ( = ?auto_18928 ?auto_18931 ) ) ( not ( = ?auto_18925 ?auto_18931 ) ) ( ON_BOARD ?auto_18930 ?auto_18929 ) ( not ( = ?auto_18935 ?auto_18930 ) ) ( SUPPORTS ?auto_18930 ?auto_18932 ) ( not ( = ?auto_18926 ?auto_18932 ) ) ( not ( = ?auto_18927 ?auto_18932 ) ) ( CALIBRATION_TARGET ?auto_18930 ?auto_18933 ) ( POINTING ?auto_18929 ?auto_18925 ) ( ON_BOARD ?auto_18934 ?auto_18929 ) ( POWER_ON ?auto_18934 ) ( not ( = ?auto_18935 ?auto_18934 ) ) ( not ( = ?auto_18930 ?auto_18934 ) ) ( CALIBRATED ?auto_18934 ) ( SUPPORTS ?auto_18934 ?auto_18926 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18928 ?auto_18927 )
      ( GET-2IMAGE-VERIFY ?auto_18925 ?auto_18926 ?auto_18928 ?auto_18927 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18936 - DIRECTION
      ?auto_18937 - MODE
      ?auto_18939 - DIRECTION
      ?auto_18938 - MODE
    )
    :vars
    (
      ?auto_18944 - INSTRUMENT
      ?auto_18941 - SATELLITE
      ?auto_18943 - DIRECTION
      ?auto_18946 - DIRECTION
      ?auto_18945 - MODE
      ?auto_18942 - INSTRUMENT
      ?auto_18940 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18944 ?auto_18941 ) ( SUPPORTS ?auto_18944 ?auto_18938 ) ( not ( = ?auto_18939 ?auto_18943 ) ) ( not ( = ?auto_18946 ?auto_18939 ) ) ( not ( = ?auto_18946 ?auto_18943 ) ) ( not ( = ?auto_18945 ?auto_18938 ) ) ( CALIBRATION_TARGET ?auto_18944 ?auto_18943 ) ( not ( = ?auto_18943 ?auto_18936 ) ) ( not ( = ?auto_18939 ?auto_18936 ) ) ( not ( = ?auto_18946 ?auto_18936 ) ) ( ON_BOARD ?auto_18942 ?auto_18941 ) ( not ( = ?auto_18944 ?auto_18942 ) ) ( SUPPORTS ?auto_18942 ?auto_18937 ) ( not ( = ?auto_18945 ?auto_18937 ) ) ( not ( = ?auto_18938 ?auto_18937 ) ) ( CALIBRATION_TARGET ?auto_18942 ?auto_18943 ) ( POINTING ?auto_18941 ?auto_18946 ) ( ON_BOARD ?auto_18940 ?auto_18941 ) ( POWER_ON ?auto_18940 ) ( not ( = ?auto_18944 ?auto_18940 ) ) ( not ( = ?auto_18942 ?auto_18940 ) ) ( CALIBRATED ?auto_18940 ) ( SUPPORTS ?auto_18940 ?auto_18945 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18946 ?auto_18945 ?auto_18939 ?auto_18938 )
      ( GET-2IMAGE-VERIFY ?auto_18936 ?auto_18937 ?auto_18939 ?auto_18938 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18947 - DIRECTION
      ?auto_18948 - MODE
      ?auto_18950 - DIRECTION
      ?auto_18949 - MODE
    )
    :vars
    (
      ?auto_18957 - INSTRUMENT
      ?auto_18953 - SATELLITE
      ?auto_18955 - DIRECTION
      ?auto_18956 - DIRECTION
      ?auto_18954 - INSTRUMENT
      ?auto_18951 - MODE
      ?auto_18952 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18957 ?auto_18953 ) ( SUPPORTS ?auto_18957 ?auto_18948 ) ( not ( = ?auto_18947 ?auto_18955 ) ) ( not ( = ?auto_18950 ?auto_18947 ) ) ( not ( = ?auto_18950 ?auto_18955 ) ) ( not ( = ?auto_18949 ?auto_18948 ) ) ( CALIBRATION_TARGET ?auto_18957 ?auto_18955 ) ( not ( = ?auto_18955 ?auto_18956 ) ) ( not ( = ?auto_18947 ?auto_18956 ) ) ( not ( = ?auto_18950 ?auto_18956 ) ) ( ON_BOARD ?auto_18954 ?auto_18953 ) ( not ( = ?auto_18957 ?auto_18954 ) ) ( SUPPORTS ?auto_18954 ?auto_18951 ) ( not ( = ?auto_18949 ?auto_18951 ) ) ( not ( = ?auto_18948 ?auto_18951 ) ) ( CALIBRATION_TARGET ?auto_18954 ?auto_18955 ) ( POINTING ?auto_18953 ?auto_18950 ) ( ON_BOARD ?auto_18952 ?auto_18953 ) ( POWER_ON ?auto_18952 ) ( not ( = ?auto_18957 ?auto_18952 ) ) ( not ( = ?auto_18954 ?auto_18952 ) ) ( CALIBRATED ?auto_18952 ) ( SUPPORTS ?auto_18952 ?auto_18949 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18950 ?auto_18949 ?auto_18947 ?auto_18948 )
      ( GET-2IMAGE-VERIFY ?auto_18947 ?auto_18948 ?auto_18950 ?auto_18949 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_18958 - DIRECTION
      ?auto_18959 - MODE
      ?auto_18961 - DIRECTION
      ?auto_18960 - MODE
    )
    :vars
    (
      ?auto_18966 - INSTRUMENT
      ?auto_18963 - SATELLITE
      ?auto_18965 - DIRECTION
      ?auto_18968 - DIRECTION
      ?auto_18967 - MODE
      ?auto_18964 - INSTRUMENT
      ?auto_18962 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_18966 ?auto_18963 ) ( SUPPORTS ?auto_18966 ?auto_18959 ) ( not ( = ?auto_18958 ?auto_18965 ) ) ( not ( = ?auto_18968 ?auto_18958 ) ) ( not ( = ?auto_18968 ?auto_18965 ) ) ( not ( = ?auto_18967 ?auto_18959 ) ) ( CALIBRATION_TARGET ?auto_18966 ?auto_18965 ) ( not ( = ?auto_18965 ?auto_18961 ) ) ( not ( = ?auto_18958 ?auto_18961 ) ) ( not ( = ?auto_18968 ?auto_18961 ) ) ( ON_BOARD ?auto_18964 ?auto_18963 ) ( not ( = ?auto_18966 ?auto_18964 ) ) ( SUPPORTS ?auto_18964 ?auto_18960 ) ( not ( = ?auto_18967 ?auto_18960 ) ) ( not ( = ?auto_18959 ?auto_18960 ) ) ( CALIBRATION_TARGET ?auto_18964 ?auto_18965 ) ( POINTING ?auto_18963 ?auto_18968 ) ( ON_BOARD ?auto_18962 ?auto_18963 ) ( POWER_ON ?auto_18962 ) ( not ( = ?auto_18966 ?auto_18962 ) ) ( not ( = ?auto_18964 ?auto_18962 ) ) ( CALIBRATED ?auto_18962 ) ( SUPPORTS ?auto_18962 ?auto_18967 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18968 ?auto_18967 ?auto_18958 ?auto_18959 )
      ( GET-2IMAGE-VERIFY ?auto_18958 ?auto_18959 ?auto_18961 ?auto_18960 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_18995 - DIRECTION
      ?auto_18996 - MODE
      ?auto_18998 - DIRECTION
      ?auto_18997 - MODE
      ?auto_19000 - DIRECTION
      ?auto_18999 - MODE
    )
    :vars
    (
      ?auto_19005 - INSTRUMENT
      ?auto_19002 - SATELLITE
      ?auto_19004 - DIRECTION
      ?auto_19003 - INSTRUMENT
      ?auto_19001 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19005 ?auto_19002 ) ( SUPPORTS ?auto_19005 ?auto_18999 ) ( not ( = ?auto_19000 ?auto_19004 ) ) ( not ( = ?auto_18995 ?auto_19000 ) ) ( not ( = ?auto_18995 ?auto_19004 ) ) ( not ( = ?auto_18996 ?auto_18999 ) ) ( CALIBRATION_TARGET ?auto_19005 ?auto_19004 ) ( not ( = ?auto_19004 ?auto_18998 ) ) ( not ( = ?auto_19000 ?auto_18998 ) ) ( not ( = ?auto_18995 ?auto_18998 ) ) ( ON_BOARD ?auto_19003 ?auto_19002 ) ( not ( = ?auto_19005 ?auto_19003 ) ) ( SUPPORTS ?auto_19003 ?auto_18997 ) ( not ( = ?auto_18996 ?auto_18997 ) ) ( not ( = ?auto_18999 ?auto_18997 ) ) ( CALIBRATION_TARGET ?auto_19003 ?auto_19004 ) ( POINTING ?auto_19002 ?auto_18995 ) ( ON_BOARD ?auto_19001 ?auto_19002 ) ( POWER_ON ?auto_19001 ) ( not ( = ?auto_19005 ?auto_19001 ) ) ( not ( = ?auto_19003 ?auto_19001 ) ) ( CALIBRATED ?auto_19001 ) ( SUPPORTS ?auto_19001 ?auto_18996 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18995 ?auto_18996 ?auto_19000 ?auto_18999 )
      ( GET-3IMAGE-VERIFY ?auto_18995 ?auto_18996 ?auto_18998 ?auto_18997 ?auto_19000 ?auto_18999 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19019 - DIRECTION
      ?auto_19020 - MODE
      ?auto_19022 - DIRECTION
      ?auto_19021 - MODE
      ?auto_19024 - DIRECTION
      ?auto_19023 - MODE
    )
    :vars
    (
      ?auto_19029 - INSTRUMENT
      ?auto_19026 - SATELLITE
      ?auto_19028 - DIRECTION
      ?auto_19027 - INSTRUMENT
      ?auto_19025 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19029 ?auto_19026 ) ( SUPPORTS ?auto_19029 ?auto_19021 ) ( not ( = ?auto_19022 ?auto_19028 ) ) ( not ( = ?auto_19019 ?auto_19022 ) ) ( not ( = ?auto_19019 ?auto_19028 ) ) ( not ( = ?auto_19020 ?auto_19021 ) ) ( CALIBRATION_TARGET ?auto_19029 ?auto_19028 ) ( not ( = ?auto_19028 ?auto_19024 ) ) ( not ( = ?auto_19022 ?auto_19024 ) ) ( not ( = ?auto_19019 ?auto_19024 ) ) ( ON_BOARD ?auto_19027 ?auto_19026 ) ( not ( = ?auto_19029 ?auto_19027 ) ) ( SUPPORTS ?auto_19027 ?auto_19023 ) ( not ( = ?auto_19020 ?auto_19023 ) ) ( not ( = ?auto_19021 ?auto_19023 ) ) ( CALIBRATION_TARGET ?auto_19027 ?auto_19028 ) ( POINTING ?auto_19026 ?auto_19019 ) ( ON_BOARD ?auto_19025 ?auto_19026 ) ( POWER_ON ?auto_19025 ) ( not ( = ?auto_19029 ?auto_19025 ) ) ( not ( = ?auto_19027 ?auto_19025 ) ) ( CALIBRATED ?auto_19025 ) ( SUPPORTS ?auto_19025 ?auto_19020 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19019 ?auto_19020 ?auto_19022 ?auto_19021 )
      ( GET-3IMAGE-VERIFY ?auto_19019 ?auto_19020 ?auto_19022 ?auto_19021 ?auto_19024 ?auto_19023 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19043 - DIRECTION
      ?auto_19044 - MODE
      ?auto_19046 - DIRECTION
      ?auto_19045 - MODE
      ?auto_19048 - DIRECTION
      ?auto_19047 - MODE
    )
    :vars
    (
      ?auto_19053 - INSTRUMENT
      ?auto_19050 - SATELLITE
      ?auto_19052 - DIRECTION
      ?auto_19051 - INSTRUMENT
      ?auto_19049 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19053 ?auto_19050 ) ( SUPPORTS ?auto_19053 ?auto_19047 ) ( not ( = ?auto_19048 ?auto_19052 ) ) ( not ( = ?auto_19046 ?auto_19048 ) ) ( not ( = ?auto_19046 ?auto_19052 ) ) ( not ( = ?auto_19045 ?auto_19047 ) ) ( CALIBRATION_TARGET ?auto_19053 ?auto_19052 ) ( not ( = ?auto_19052 ?auto_19043 ) ) ( not ( = ?auto_19048 ?auto_19043 ) ) ( not ( = ?auto_19046 ?auto_19043 ) ) ( ON_BOARD ?auto_19051 ?auto_19050 ) ( not ( = ?auto_19053 ?auto_19051 ) ) ( SUPPORTS ?auto_19051 ?auto_19044 ) ( not ( = ?auto_19045 ?auto_19044 ) ) ( not ( = ?auto_19047 ?auto_19044 ) ) ( CALIBRATION_TARGET ?auto_19051 ?auto_19052 ) ( POINTING ?auto_19050 ?auto_19046 ) ( ON_BOARD ?auto_19049 ?auto_19050 ) ( POWER_ON ?auto_19049 ) ( not ( = ?auto_19053 ?auto_19049 ) ) ( not ( = ?auto_19051 ?auto_19049 ) ) ( CALIBRATED ?auto_19049 ) ( SUPPORTS ?auto_19049 ?auto_19045 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19046 ?auto_19045 ?auto_19048 ?auto_19047 )
      ( GET-3IMAGE-VERIFY ?auto_19043 ?auto_19044 ?auto_19046 ?auto_19045 ?auto_19048 ?auto_19047 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19067 - DIRECTION
      ?auto_19068 - MODE
      ?auto_19070 - DIRECTION
      ?auto_19069 - MODE
      ?auto_19072 - DIRECTION
      ?auto_19071 - MODE
    )
    :vars
    (
      ?auto_19077 - INSTRUMENT
      ?auto_19074 - SATELLITE
      ?auto_19076 - DIRECTION
      ?auto_19075 - INSTRUMENT
      ?auto_19073 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19077 ?auto_19074 ) ( SUPPORTS ?auto_19077 ?auto_19069 ) ( not ( = ?auto_19070 ?auto_19076 ) ) ( not ( = ?auto_19072 ?auto_19070 ) ) ( not ( = ?auto_19072 ?auto_19076 ) ) ( not ( = ?auto_19071 ?auto_19069 ) ) ( CALIBRATION_TARGET ?auto_19077 ?auto_19076 ) ( not ( = ?auto_19076 ?auto_19067 ) ) ( not ( = ?auto_19070 ?auto_19067 ) ) ( not ( = ?auto_19072 ?auto_19067 ) ) ( ON_BOARD ?auto_19075 ?auto_19074 ) ( not ( = ?auto_19077 ?auto_19075 ) ) ( SUPPORTS ?auto_19075 ?auto_19068 ) ( not ( = ?auto_19071 ?auto_19068 ) ) ( not ( = ?auto_19069 ?auto_19068 ) ) ( CALIBRATION_TARGET ?auto_19075 ?auto_19076 ) ( POINTING ?auto_19074 ?auto_19072 ) ( ON_BOARD ?auto_19073 ?auto_19074 ) ( POWER_ON ?auto_19073 ) ( not ( = ?auto_19077 ?auto_19073 ) ) ( not ( = ?auto_19075 ?auto_19073 ) ) ( CALIBRATED ?auto_19073 ) ( SUPPORTS ?auto_19073 ?auto_19071 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19072 ?auto_19071 ?auto_19070 ?auto_19069 )
      ( GET-3IMAGE-VERIFY ?auto_19067 ?auto_19068 ?auto_19070 ?auto_19069 ?auto_19072 ?auto_19071 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19117 - DIRECTION
      ?auto_19118 - MODE
      ?auto_19120 - DIRECTION
      ?auto_19119 - MODE
      ?auto_19122 - DIRECTION
      ?auto_19121 - MODE
    )
    :vars
    (
      ?auto_19127 - INSTRUMENT
      ?auto_19124 - SATELLITE
      ?auto_19126 - DIRECTION
      ?auto_19125 - INSTRUMENT
      ?auto_19123 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19127 ?auto_19124 ) ( SUPPORTS ?auto_19127 ?auto_19118 ) ( not ( = ?auto_19117 ?auto_19126 ) ) ( not ( = ?auto_19120 ?auto_19117 ) ) ( not ( = ?auto_19120 ?auto_19126 ) ) ( not ( = ?auto_19119 ?auto_19118 ) ) ( CALIBRATION_TARGET ?auto_19127 ?auto_19126 ) ( not ( = ?auto_19126 ?auto_19122 ) ) ( not ( = ?auto_19117 ?auto_19122 ) ) ( not ( = ?auto_19120 ?auto_19122 ) ) ( ON_BOARD ?auto_19125 ?auto_19124 ) ( not ( = ?auto_19127 ?auto_19125 ) ) ( SUPPORTS ?auto_19125 ?auto_19121 ) ( not ( = ?auto_19119 ?auto_19121 ) ) ( not ( = ?auto_19118 ?auto_19121 ) ) ( CALIBRATION_TARGET ?auto_19125 ?auto_19126 ) ( POINTING ?auto_19124 ?auto_19120 ) ( ON_BOARD ?auto_19123 ?auto_19124 ) ( POWER_ON ?auto_19123 ) ( not ( = ?auto_19127 ?auto_19123 ) ) ( not ( = ?auto_19125 ?auto_19123 ) ) ( CALIBRATED ?auto_19123 ) ( SUPPORTS ?auto_19123 ?auto_19119 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19120 ?auto_19119 ?auto_19117 ?auto_19118 )
      ( GET-3IMAGE-VERIFY ?auto_19117 ?auto_19118 ?auto_19120 ?auto_19119 ?auto_19122 ?auto_19121 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19141 - DIRECTION
      ?auto_19142 - MODE
      ?auto_19144 - DIRECTION
      ?auto_19143 - MODE
      ?auto_19146 - DIRECTION
      ?auto_19145 - MODE
    )
    :vars
    (
      ?auto_19151 - INSTRUMENT
      ?auto_19148 - SATELLITE
      ?auto_19150 - DIRECTION
      ?auto_19149 - INSTRUMENT
      ?auto_19147 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19151 ?auto_19148 ) ( SUPPORTS ?auto_19151 ?auto_19142 ) ( not ( = ?auto_19141 ?auto_19150 ) ) ( not ( = ?auto_19146 ?auto_19141 ) ) ( not ( = ?auto_19146 ?auto_19150 ) ) ( not ( = ?auto_19145 ?auto_19142 ) ) ( CALIBRATION_TARGET ?auto_19151 ?auto_19150 ) ( not ( = ?auto_19150 ?auto_19144 ) ) ( not ( = ?auto_19141 ?auto_19144 ) ) ( not ( = ?auto_19146 ?auto_19144 ) ) ( ON_BOARD ?auto_19149 ?auto_19148 ) ( not ( = ?auto_19151 ?auto_19149 ) ) ( SUPPORTS ?auto_19149 ?auto_19143 ) ( not ( = ?auto_19145 ?auto_19143 ) ) ( not ( = ?auto_19142 ?auto_19143 ) ) ( CALIBRATION_TARGET ?auto_19149 ?auto_19150 ) ( POINTING ?auto_19148 ?auto_19146 ) ( ON_BOARD ?auto_19147 ?auto_19148 ) ( POWER_ON ?auto_19147 ) ( not ( = ?auto_19151 ?auto_19147 ) ) ( not ( = ?auto_19149 ?auto_19147 ) ) ( CALIBRATED ?auto_19147 ) ( SUPPORTS ?auto_19147 ?auto_19145 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19146 ?auto_19145 ?auto_19141 ?auto_19142 )
      ( GET-3IMAGE-VERIFY ?auto_19141 ?auto_19142 ?auto_19144 ?auto_19143 ?auto_19146 ?auto_19145 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_19219 - DIRECTION
      ?auto_19220 - MODE
    )
    :vars
    (
      ?auto_19227 - INSTRUMENT
      ?auto_19223 - SATELLITE
      ?auto_19225 - DIRECTION
      ?auto_19229 - DIRECTION
      ?auto_19228 - MODE
      ?auto_19226 - DIRECTION
      ?auto_19224 - INSTRUMENT
      ?auto_19221 - MODE
      ?auto_19222 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19227 ?auto_19223 ) ( SUPPORTS ?auto_19227 ?auto_19220 ) ( not ( = ?auto_19219 ?auto_19225 ) ) ( not ( = ?auto_19229 ?auto_19219 ) ) ( not ( = ?auto_19229 ?auto_19225 ) ) ( not ( = ?auto_19228 ?auto_19220 ) ) ( CALIBRATION_TARGET ?auto_19227 ?auto_19225 ) ( not ( = ?auto_19225 ?auto_19226 ) ) ( not ( = ?auto_19219 ?auto_19226 ) ) ( not ( = ?auto_19229 ?auto_19226 ) ) ( ON_BOARD ?auto_19224 ?auto_19223 ) ( not ( = ?auto_19227 ?auto_19224 ) ) ( SUPPORTS ?auto_19224 ?auto_19221 ) ( not ( = ?auto_19228 ?auto_19221 ) ) ( not ( = ?auto_19220 ?auto_19221 ) ) ( CALIBRATION_TARGET ?auto_19224 ?auto_19225 ) ( ON_BOARD ?auto_19222 ?auto_19223 ) ( POWER_ON ?auto_19222 ) ( not ( = ?auto_19227 ?auto_19222 ) ) ( not ( = ?auto_19224 ?auto_19222 ) ) ( CALIBRATED ?auto_19222 ) ( SUPPORTS ?auto_19222 ?auto_19228 ) ( POINTING ?auto_19223 ?auto_19225 ) )
    :subtasks
    ( ( !TURN_TO ?auto_19223 ?auto_19229 ?auto_19225 )
      ( GET-2IMAGE ?auto_19229 ?auto_19228 ?auto_19219 ?auto_19220 )
      ( GET-1IMAGE-VERIFY ?auto_19219 ?auto_19220 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_19230 - DIRECTION
      ?auto_19231 - MODE
      ?auto_19233 - DIRECTION
      ?auto_19232 - MODE
    )
    :vars
    (
      ?auto_19237 - INSTRUMENT
      ?auto_19239 - SATELLITE
      ?auto_19234 - DIRECTION
      ?auto_19240 - DIRECTION
      ?auto_19235 - INSTRUMENT
      ?auto_19238 - MODE
      ?auto_19236 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19237 ?auto_19239 ) ( SUPPORTS ?auto_19237 ?auto_19232 ) ( not ( = ?auto_19233 ?auto_19234 ) ) ( not ( = ?auto_19230 ?auto_19233 ) ) ( not ( = ?auto_19230 ?auto_19234 ) ) ( not ( = ?auto_19231 ?auto_19232 ) ) ( CALIBRATION_TARGET ?auto_19237 ?auto_19234 ) ( not ( = ?auto_19234 ?auto_19240 ) ) ( not ( = ?auto_19233 ?auto_19240 ) ) ( not ( = ?auto_19230 ?auto_19240 ) ) ( ON_BOARD ?auto_19235 ?auto_19239 ) ( not ( = ?auto_19237 ?auto_19235 ) ) ( SUPPORTS ?auto_19235 ?auto_19238 ) ( not ( = ?auto_19231 ?auto_19238 ) ) ( not ( = ?auto_19232 ?auto_19238 ) ) ( CALIBRATION_TARGET ?auto_19235 ?auto_19234 ) ( ON_BOARD ?auto_19236 ?auto_19239 ) ( POWER_ON ?auto_19236 ) ( not ( = ?auto_19237 ?auto_19236 ) ) ( not ( = ?auto_19235 ?auto_19236 ) ) ( CALIBRATED ?auto_19236 ) ( SUPPORTS ?auto_19236 ?auto_19231 ) ( POINTING ?auto_19239 ?auto_19234 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_19233 ?auto_19232 )
      ( GET-2IMAGE-VERIFY ?auto_19230 ?auto_19231 ?auto_19233 ?auto_19232 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_19241 - DIRECTION
      ?auto_19242 - MODE
      ?auto_19244 - DIRECTION
      ?auto_19243 - MODE
    )
    :vars
    (
      ?auto_19247 - INSTRUMENT
      ?auto_19245 - SATELLITE
      ?auto_19249 - DIRECTION
      ?auto_19251 - DIRECTION
      ?auto_19250 - MODE
      ?auto_19248 - INSTRUMENT
      ?auto_19246 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19247 ?auto_19245 ) ( SUPPORTS ?auto_19247 ?auto_19243 ) ( not ( = ?auto_19244 ?auto_19249 ) ) ( not ( = ?auto_19251 ?auto_19244 ) ) ( not ( = ?auto_19251 ?auto_19249 ) ) ( not ( = ?auto_19250 ?auto_19243 ) ) ( CALIBRATION_TARGET ?auto_19247 ?auto_19249 ) ( not ( = ?auto_19249 ?auto_19241 ) ) ( not ( = ?auto_19244 ?auto_19241 ) ) ( not ( = ?auto_19251 ?auto_19241 ) ) ( ON_BOARD ?auto_19248 ?auto_19245 ) ( not ( = ?auto_19247 ?auto_19248 ) ) ( SUPPORTS ?auto_19248 ?auto_19242 ) ( not ( = ?auto_19250 ?auto_19242 ) ) ( not ( = ?auto_19243 ?auto_19242 ) ) ( CALIBRATION_TARGET ?auto_19248 ?auto_19249 ) ( ON_BOARD ?auto_19246 ?auto_19245 ) ( POWER_ON ?auto_19246 ) ( not ( = ?auto_19247 ?auto_19246 ) ) ( not ( = ?auto_19248 ?auto_19246 ) ) ( CALIBRATED ?auto_19246 ) ( SUPPORTS ?auto_19246 ?auto_19250 ) ( POINTING ?auto_19245 ?auto_19249 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19251 ?auto_19250 ?auto_19244 ?auto_19243 )
      ( GET-2IMAGE-VERIFY ?auto_19241 ?auto_19242 ?auto_19244 ?auto_19243 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_19252 - DIRECTION
      ?auto_19253 - MODE
      ?auto_19255 - DIRECTION
      ?auto_19254 - MODE
    )
    :vars
    (
      ?auto_19258 - INSTRUMENT
      ?auto_19256 - SATELLITE
      ?auto_19262 - DIRECTION
      ?auto_19259 - DIRECTION
      ?auto_19260 - INSTRUMENT
      ?auto_19261 - MODE
      ?auto_19257 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19258 ?auto_19256 ) ( SUPPORTS ?auto_19258 ?auto_19253 ) ( not ( = ?auto_19252 ?auto_19262 ) ) ( not ( = ?auto_19255 ?auto_19252 ) ) ( not ( = ?auto_19255 ?auto_19262 ) ) ( not ( = ?auto_19254 ?auto_19253 ) ) ( CALIBRATION_TARGET ?auto_19258 ?auto_19262 ) ( not ( = ?auto_19262 ?auto_19259 ) ) ( not ( = ?auto_19252 ?auto_19259 ) ) ( not ( = ?auto_19255 ?auto_19259 ) ) ( ON_BOARD ?auto_19260 ?auto_19256 ) ( not ( = ?auto_19258 ?auto_19260 ) ) ( SUPPORTS ?auto_19260 ?auto_19261 ) ( not ( = ?auto_19254 ?auto_19261 ) ) ( not ( = ?auto_19253 ?auto_19261 ) ) ( CALIBRATION_TARGET ?auto_19260 ?auto_19262 ) ( ON_BOARD ?auto_19257 ?auto_19256 ) ( POWER_ON ?auto_19257 ) ( not ( = ?auto_19258 ?auto_19257 ) ) ( not ( = ?auto_19260 ?auto_19257 ) ) ( CALIBRATED ?auto_19257 ) ( SUPPORTS ?auto_19257 ?auto_19254 ) ( POINTING ?auto_19256 ?auto_19262 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19255 ?auto_19254 ?auto_19252 ?auto_19253 )
      ( GET-2IMAGE-VERIFY ?auto_19252 ?auto_19253 ?auto_19255 ?auto_19254 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_19263 - DIRECTION
      ?auto_19264 - MODE
      ?auto_19266 - DIRECTION
      ?auto_19265 - MODE
    )
    :vars
    (
      ?auto_19269 - INSTRUMENT
      ?auto_19267 - SATELLITE
      ?auto_19271 - DIRECTION
      ?auto_19273 - DIRECTION
      ?auto_19272 - MODE
      ?auto_19270 - INSTRUMENT
      ?auto_19268 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19269 ?auto_19267 ) ( SUPPORTS ?auto_19269 ?auto_19264 ) ( not ( = ?auto_19263 ?auto_19271 ) ) ( not ( = ?auto_19273 ?auto_19263 ) ) ( not ( = ?auto_19273 ?auto_19271 ) ) ( not ( = ?auto_19272 ?auto_19264 ) ) ( CALIBRATION_TARGET ?auto_19269 ?auto_19271 ) ( not ( = ?auto_19271 ?auto_19266 ) ) ( not ( = ?auto_19263 ?auto_19266 ) ) ( not ( = ?auto_19273 ?auto_19266 ) ) ( ON_BOARD ?auto_19270 ?auto_19267 ) ( not ( = ?auto_19269 ?auto_19270 ) ) ( SUPPORTS ?auto_19270 ?auto_19265 ) ( not ( = ?auto_19272 ?auto_19265 ) ) ( not ( = ?auto_19264 ?auto_19265 ) ) ( CALIBRATION_TARGET ?auto_19270 ?auto_19271 ) ( ON_BOARD ?auto_19268 ?auto_19267 ) ( POWER_ON ?auto_19268 ) ( not ( = ?auto_19269 ?auto_19268 ) ) ( not ( = ?auto_19270 ?auto_19268 ) ) ( CALIBRATED ?auto_19268 ) ( SUPPORTS ?auto_19268 ?auto_19272 ) ( POINTING ?auto_19267 ?auto_19271 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19273 ?auto_19272 ?auto_19263 ?auto_19264 )
      ( GET-2IMAGE-VERIFY ?auto_19263 ?auto_19264 ?auto_19266 ?auto_19265 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19300 - DIRECTION
      ?auto_19301 - MODE
      ?auto_19303 - DIRECTION
      ?auto_19302 - MODE
      ?auto_19305 - DIRECTION
      ?auto_19304 - MODE
    )
    :vars
    (
      ?auto_19308 - INSTRUMENT
      ?auto_19306 - SATELLITE
      ?auto_19310 - DIRECTION
      ?auto_19309 - INSTRUMENT
      ?auto_19307 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19308 ?auto_19306 ) ( SUPPORTS ?auto_19308 ?auto_19304 ) ( not ( = ?auto_19305 ?auto_19310 ) ) ( not ( = ?auto_19300 ?auto_19305 ) ) ( not ( = ?auto_19300 ?auto_19310 ) ) ( not ( = ?auto_19301 ?auto_19304 ) ) ( CALIBRATION_TARGET ?auto_19308 ?auto_19310 ) ( not ( = ?auto_19310 ?auto_19303 ) ) ( not ( = ?auto_19305 ?auto_19303 ) ) ( not ( = ?auto_19300 ?auto_19303 ) ) ( ON_BOARD ?auto_19309 ?auto_19306 ) ( not ( = ?auto_19308 ?auto_19309 ) ) ( SUPPORTS ?auto_19309 ?auto_19302 ) ( not ( = ?auto_19301 ?auto_19302 ) ) ( not ( = ?auto_19304 ?auto_19302 ) ) ( CALIBRATION_TARGET ?auto_19309 ?auto_19310 ) ( ON_BOARD ?auto_19307 ?auto_19306 ) ( POWER_ON ?auto_19307 ) ( not ( = ?auto_19308 ?auto_19307 ) ) ( not ( = ?auto_19309 ?auto_19307 ) ) ( CALIBRATED ?auto_19307 ) ( SUPPORTS ?auto_19307 ?auto_19301 ) ( POINTING ?auto_19306 ?auto_19310 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19300 ?auto_19301 ?auto_19305 ?auto_19304 )
      ( GET-3IMAGE-VERIFY ?auto_19300 ?auto_19301 ?auto_19303 ?auto_19302 ?auto_19305 ?auto_19304 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19324 - DIRECTION
      ?auto_19325 - MODE
      ?auto_19327 - DIRECTION
      ?auto_19326 - MODE
      ?auto_19329 - DIRECTION
      ?auto_19328 - MODE
    )
    :vars
    (
      ?auto_19332 - INSTRUMENT
      ?auto_19330 - SATELLITE
      ?auto_19334 - DIRECTION
      ?auto_19333 - INSTRUMENT
      ?auto_19331 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19332 ?auto_19330 ) ( SUPPORTS ?auto_19332 ?auto_19326 ) ( not ( = ?auto_19327 ?auto_19334 ) ) ( not ( = ?auto_19324 ?auto_19327 ) ) ( not ( = ?auto_19324 ?auto_19334 ) ) ( not ( = ?auto_19325 ?auto_19326 ) ) ( CALIBRATION_TARGET ?auto_19332 ?auto_19334 ) ( not ( = ?auto_19334 ?auto_19329 ) ) ( not ( = ?auto_19327 ?auto_19329 ) ) ( not ( = ?auto_19324 ?auto_19329 ) ) ( ON_BOARD ?auto_19333 ?auto_19330 ) ( not ( = ?auto_19332 ?auto_19333 ) ) ( SUPPORTS ?auto_19333 ?auto_19328 ) ( not ( = ?auto_19325 ?auto_19328 ) ) ( not ( = ?auto_19326 ?auto_19328 ) ) ( CALIBRATION_TARGET ?auto_19333 ?auto_19334 ) ( ON_BOARD ?auto_19331 ?auto_19330 ) ( POWER_ON ?auto_19331 ) ( not ( = ?auto_19332 ?auto_19331 ) ) ( not ( = ?auto_19333 ?auto_19331 ) ) ( CALIBRATED ?auto_19331 ) ( SUPPORTS ?auto_19331 ?auto_19325 ) ( POINTING ?auto_19330 ?auto_19334 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19324 ?auto_19325 ?auto_19327 ?auto_19326 )
      ( GET-3IMAGE-VERIFY ?auto_19324 ?auto_19325 ?auto_19327 ?auto_19326 ?auto_19329 ?auto_19328 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19348 - DIRECTION
      ?auto_19349 - MODE
      ?auto_19351 - DIRECTION
      ?auto_19350 - MODE
      ?auto_19353 - DIRECTION
      ?auto_19352 - MODE
    )
    :vars
    (
      ?auto_19356 - INSTRUMENT
      ?auto_19354 - SATELLITE
      ?auto_19358 - DIRECTION
      ?auto_19357 - INSTRUMENT
      ?auto_19355 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19356 ?auto_19354 ) ( SUPPORTS ?auto_19356 ?auto_19352 ) ( not ( = ?auto_19353 ?auto_19358 ) ) ( not ( = ?auto_19351 ?auto_19353 ) ) ( not ( = ?auto_19351 ?auto_19358 ) ) ( not ( = ?auto_19350 ?auto_19352 ) ) ( CALIBRATION_TARGET ?auto_19356 ?auto_19358 ) ( not ( = ?auto_19358 ?auto_19348 ) ) ( not ( = ?auto_19353 ?auto_19348 ) ) ( not ( = ?auto_19351 ?auto_19348 ) ) ( ON_BOARD ?auto_19357 ?auto_19354 ) ( not ( = ?auto_19356 ?auto_19357 ) ) ( SUPPORTS ?auto_19357 ?auto_19349 ) ( not ( = ?auto_19350 ?auto_19349 ) ) ( not ( = ?auto_19352 ?auto_19349 ) ) ( CALIBRATION_TARGET ?auto_19357 ?auto_19358 ) ( ON_BOARD ?auto_19355 ?auto_19354 ) ( POWER_ON ?auto_19355 ) ( not ( = ?auto_19356 ?auto_19355 ) ) ( not ( = ?auto_19357 ?auto_19355 ) ) ( CALIBRATED ?auto_19355 ) ( SUPPORTS ?auto_19355 ?auto_19350 ) ( POINTING ?auto_19354 ?auto_19358 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19351 ?auto_19350 ?auto_19353 ?auto_19352 )
      ( GET-3IMAGE-VERIFY ?auto_19348 ?auto_19349 ?auto_19351 ?auto_19350 ?auto_19353 ?auto_19352 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19372 - DIRECTION
      ?auto_19373 - MODE
      ?auto_19375 - DIRECTION
      ?auto_19374 - MODE
      ?auto_19377 - DIRECTION
      ?auto_19376 - MODE
    )
    :vars
    (
      ?auto_19380 - INSTRUMENT
      ?auto_19378 - SATELLITE
      ?auto_19382 - DIRECTION
      ?auto_19381 - INSTRUMENT
      ?auto_19379 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19380 ?auto_19378 ) ( SUPPORTS ?auto_19380 ?auto_19374 ) ( not ( = ?auto_19375 ?auto_19382 ) ) ( not ( = ?auto_19377 ?auto_19375 ) ) ( not ( = ?auto_19377 ?auto_19382 ) ) ( not ( = ?auto_19376 ?auto_19374 ) ) ( CALIBRATION_TARGET ?auto_19380 ?auto_19382 ) ( not ( = ?auto_19382 ?auto_19372 ) ) ( not ( = ?auto_19375 ?auto_19372 ) ) ( not ( = ?auto_19377 ?auto_19372 ) ) ( ON_BOARD ?auto_19381 ?auto_19378 ) ( not ( = ?auto_19380 ?auto_19381 ) ) ( SUPPORTS ?auto_19381 ?auto_19373 ) ( not ( = ?auto_19376 ?auto_19373 ) ) ( not ( = ?auto_19374 ?auto_19373 ) ) ( CALIBRATION_TARGET ?auto_19381 ?auto_19382 ) ( ON_BOARD ?auto_19379 ?auto_19378 ) ( POWER_ON ?auto_19379 ) ( not ( = ?auto_19380 ?auto_19379 ) ) ( not ( = ?auto_19381 ?auto_19379 ) ) ( CALIBRATED ?auto_19379 ) ( SUPPORTS ?auto_19379 ?auto_19376 ) ( POINTING ?auto_19378 ?auto_19382 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19377 ?auto_19376 ?auto_19375 ?auto_19374 )
      ( GET-3IMAGE-VERIFY ?auto_19372 ?auto_19373 ?auto_19375 ?auto_19374 ?auto_19377 ?auto_19376 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19422 - DIRECTION
      ?auto_19423 - MODE
      ?auto_19425 - DIRECTION
      ?auto_19424 - MODE
      ?auto_19427 - DIRECTION
      ?auto_19426 - MODE
    )
    :vars
    (
      ?auto_19430 - INSTRUMENT
      ?auto_19428 - SATELLITE
      ?auto_19432 - DIRECTION
      ?auto_19431 - INSTRUMENT
      ?auto_19429 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19430 ?auto_19428 ) ( SUPPORTS ?auto_19430 ?auto_19423 ) ( not ( = ?auto_19422 ?auto_19432 ) ) ( not ( = ?auto_19425 ?auto_19422 ) ) ( not ( = ?auto_19425 ?auto_19432 ) ) ( not ( = ?auto_19424 ?auto_19423 ) ) ( CALIBRATION_TARGET ?auto_19430 ?auto_19432 ) ( not ( = ?auto_19432 ?auto_19427 ) ) ( not ( = ?auto_19422 ?auto_19427 ) ) ( not ( = ?auto_19425 ?auto_19427 ) ) ( ON_BOARD ?auto_19431 ?auto_19428 ) ( not ( = ?auto_19430 ?auto_19431 ) ) ( SUPPORTS ?auto_19431 ?auto_19426 ) ( not ( = ?auto_19424 ?auto_19426 ) ) ( not ( = ?auto_19423 ?auto_19426 ) ) ( CALIBRATION_TARGET ?auto_19431 ?auto_19432 ) ( ON_BOARD ?auto_19429 ?auto_19428 ) ( POWER_ON ?auto_19429 ) ( not ( = ?auto_19430 ?auto_19429 ) ) ( not ( = ?auto_19431 ?auto_19429 ) ) ( CALIBRATED ?auto_19429 ) ( SUPPORTS ?auto_19429 ?auto_19424 ) ( POINTING ?auto_19428 ?auto_19432 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19425 ?auto_19424 ?auto_19422 ?auto_19423 )
      ( GET-3IMAGE-VERIFY ?auto_19422 ?auto_19423 ?auto_19425 ?auto_19424 ?auto_19427 ?auto_19426 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19446 - DIRECTION
      ?auto_19447 - MODE
      ?auto_19449 - DIRECTION
      ?auto_19448 - MODE
      ?auto_19451 - DIRECTION
      ?auto_19450 - MODE
    )
    :vars
    (
      ?auto_19454 - INSTRUMENT
      ?auto_19452 - SATELLITE
      ?auto_19456 - DIRECTION
      ?auto_19455 - INSTRUMENT
      ?auto_19453 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19454 ?auto_19452 ) ( SUPPORTS ?auto_19454 ?auto_19447 ) ( not ( = ?auto_19446 ?auto_19456 ) ) ( not ( = ?auto_19451 ?auto_19446 ) ) ( not ( = ?auto_19451 ?auto_19456 ) ) ( not ( = ?auto_19450 ?auto_19447 ) ) ( CALIBRATION_TARGET ?auto_19454 ?auto_19456 ) ( not ( = ?auto_19456 ?auto_19449 ) ) ( not ( = ?auto_19446 ?auto_19449 ) ) ( not ( = ?auto_19451 ?auto_19449 ) ) ( ON_BOARD ?auto_19455 ?auto_19452 ) ( not ( = ?auto_19454 ?auto_19455 ) ) ( SUPPORTS ?auto_19455 ?auto_19448 ) ( not ( = ?auto_19450 ?auto_19448 ) ) ( not ( = ?auto_19447 ?auto_19448 ) ) ( CALIBRATION_TARGET ?auto_19455 ?auto_19456 ) ( ON_BOARD ?auto_19453 ?auto_19452 ) ( POWER_ON ?auto_19453 ) ( not ( = ?auto_19454 ?auto_19453 ) ) ( not ( = ?auto_19455 ?auto_19453 ) ) ( CALIBRATED ?auto_19453 ) ( SUPPORTS ?auto_19453 ?auto_19450 ) ( POINTING ?auto_19452 ?auto_19456 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19451 ?auto_19450 ?auto_19446 ?auto_19447 )
      ( GET-3IMAGE-VERIFY ?auto_19446 ?auto_19447 ?auto_19449 ?auto_19448 ?auto_19451 ?auto_19450 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_19524 - DIRECTION
      ?auto_19525 - MODE
    )
    :vars
    (
      ?auto_19528 - INSTRUMENT
      ?auto_19526 - SATELLITE
      ?auto_19532 - DIRECTION
      ?auto_19534 - DIRECTION
      ?auto_19533 - MODE
      ?auto_19529 - DIRECTION
      ?auto_19530 - INSTRUMENT
      ?auto_19531 - MODE
      ?auto_19527 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19528 ?auto_19526 ) ( SUPPORTS ?auto_19528 ?auto_19525 ) ( not ( = ?auto_19524 ?auto_19532 ) ) ( not ( = ?auto_19534 ?auto_19524 ) ) ( not ( = ?auto_19534 ?auto_19532 ) ) ( not ( = ?auto_19533 ?auto_19525 ) ) ( CALIBRATION_TARGET ?auto_19528 ?auto_19532 ) ( not ( = ?auto_19532 ?auto_19529 ) ) ( not ( = ?auto_19524 ?auto_19529 ) ) ( not ( = ?auto_19534 ?auto_19529 ) ) ( ON_BOARD ?auto_19530 ?auto_19526 ) ( not ( = ?auto_19528 ?auto_19530 ) ) ( SUPPORTS ?auto_19530 ?auto_19531 ) ( not ( = ?auto_19533 ?auto_19531 ) ) ( not ( = ?auto_19525 ?auto_19531 ) ) ( CALIBRATION_TARGET ?auto_19530 ?auto_19532 ) ( ON_BOARD ?auto_19527 ?auto_19526 ) ( POWER_ON ?auto_19527 ) ( not ( = ?auto_19528 ?auto_19527 ) ) ( not ( = ?auto_19530 ?auto_19527 ) ) ( SUPPORTS ?auto_19527 ?auto_19533 ) ( POINTING ?auto_19526 ?auto_19532 ) ( CALIBRATION_TARGET ?auto_19527 ?auto_19532 ) ( NOT_CALIBRATED ?auto_19527 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_19526 ?auto_19527 ?auto_19532 )
      ( GET-2IMAGE ?auto_19534 ?auto_19533 ?auto_19524 ?auto_19525 )
      ( GET-1IMAGE-VERIFY ?auto_19524 ?auto_19525 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_19535 - DIRECTION
      ?auto_19536 - MODE
      ?auto_19538 - DIRECTION
      ?auto_19537 - MODE
    )
    :vars
    (
      ?auto_19543 - INSTRUMENT
      ?auto_19542 - SATELLITE
      ?auto_19545 - DIRECTION
      ?auto_19539 - DIRECTION
      ?auto_19541 - INSTRUMENT
      ?auto_19544 - MODE
      ?auto_19540 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19543 ?auto_19542 ) ( SUPPORTS ?auto_19543 ?auto_19537 ) ( not ( = ?auto_19538 ?auto_19545 ) ) ( not ( = ?auto_19535 ?auto_19538 ) ) ( not ( = ?auto_19535 ?auto_19545 ) ) ( not ( = ?auto_19536 ?auto_19537 ) ) ( CALIBRATION_TARGET ?auto_19543 ?auto_19545 ) ( not ( = ?auto_19545 ?auto_19539 ) ) ( not ( = ?auto_19538 ?auto_19539 ) ) ( not ( = ?auto_19535 ?auto_19539 ) ) ( ON_BOARD ?auto_19541 ?auto_19542 ) ( not ( = ?auto_19543 ?auto_19541 ) ) ( SUPPORTS ?auto_19541 ?auto_19544 ) ( not ( = ?auto_19536 ?auto_19544 ) ) ( not ( = ?auto_19537 ?auto_19544 ) ) ( CALIBRATION_TARGET ?auto_19541 ?auto_19545 ) ( ON_BOARD ?auto_19540 ?auto_19542 ) ( POWER_ON ?auto_19540 ) ( not ( = ?auto_19543 ?auto_19540 ) ) ( not ( = ?auto_19541 ?auto_19540 ) ) ( SUPPORTS ?auto_19540 ?auto_19536 ) ( POINTING ?auto_19542 ?auto_19545 ) ( CALIBRATION_TARGET ?auto_19540 ?auto_19545 ) ( NOT_CALIBRATED ?auto_19540 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_19538 ?auto_19537 )
      ( GET-2IMAGE-VERIFY ?auto_19535 ?auto_19536 ?auto_19538 ?auto_19537 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_19546 - DIRECTION
      ?auto_19547 - MODE
      ?auto_19549 - DIRECTION
      ?auto_19548 - MODE
    )
    :vars
    (
      ?auto_19550 - INSTRUMENT
      ?auto_19553 - SATELLITE
      ?auto_19551 - DIRECTION
      ?auto_19556 - DIRECTION
      ?auto_19555 - MODE
      ?auto_19554 - INSTRUMENT
      ?auto_19552 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19550 ?auto_19553 ) ( SUPPORTS ?auto_19550 ?auto_19548 ) ( not ( = ?auto_19549 ?auto_19551 ) ) ( not ( = ?auto_19556 ?auto_19549 ) ) ( not ( = ?auto_19556 ?auto_19551 ) ) ( not ( = ?auto_19555 ?auto_19548 ) ) ( CALIBRATION_TARGET ?auto_19550 ?auto_19551 ) ( not ( = ?auto_19551 ?auto_19546 ) ) ( not ( = ?auto_19549 ?auto_19546 ) ) ( not ( = ?auto_19556 ?auto_19546 ) ) ( ON_BOARD ?auto_19554 ?auto_19553 ) ( not ( = ?auto_19550 ?auto_19554 ) ) ( SUPPORTS ?auto_19554 ?auto_19547 ) ( not ( = ?auto_19555 ?auto_19547 ) ) ( not ( = ?auto_19548 ?auto_19547 ) ) ( CALIBRATION_TARGET ?auto_19554 ?auto_19551 ) ( ON_BOARD ?auto_19552 ?auto_19553 ) ( POWER_ON ?auto_19552 ) ( not ( = ?auto_19550 ?auto_19552 ) ) ( not ( = ?auto_19554 ?auto_19552 ) ) ( SUPPORTS ?auto_19552 ?auto_19555 ) ( POINTING ?auto_19553 ?auto_19551 ) ( CALIBRATION_TARGET ?auto_19552 ?auto_19551 ) ( NOT_CALIBRATED ?auto_19552 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19556 ?auto_19555 ?auto_19549 ?auto_19548 )
      ( GET-2IMAGE-VERIFY ?auto_19546 ?auto_19547 ?auto_19549 ?auto_19548 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_19557 - DIRECTION
      ?auto_19558 - MODE
      ?auto_19560 - DIRECTION
      ?auto_19559 - MODE
    )
    :vars
    (
      ?auto_19562 - INSTRUMENT
      ?auto_19565 - SATELLITE
      ?auto_19563 - DIRECTION
      ?auto_19561 - DIRECTION
      ?auto_19566 - INSTRUMENT
      ?auto_19567 - MODE
      ?auto_19564 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19562 ?auto_19565 ) ( SUPPORTS ?auto_19562 ?auto_19558 ) ( not ( = ?auto_19557 ?auto_19563 ) ) ( not ( = ?auto_19560 ?auto_19557 ) ) ( not ( = ?auto_19560 ?auto_19563 ) ) ( not ( = ?auto_19559 ?auto_19558 ) ) ( CALIBRATION_TARGET ?auto_19562 ?auto_19563 ) ( not ( = ?auto_19563 ?auto_19561 ) ) ( not ( = ?auto_19557 ?auto_19561 ) ) ( not ( = ?auto_19560 ?auto_19561 ) ) ( ON_BOARD ?auto_19566 ?auto_19565 ) ( not ( = ?auto_19562 ?auto_19566 ) ) ( SUPPORTS ?auto_19566 ?auto_19567 ) ( not ( = ?auto_19559 ?auto_19567 ) ) ( not ( = ?auto_19558 ?auto_19567 ) ) ( CALIBRATION_TARGET ?auto_19566 ?auto_19563 ) ( ON_BOARD ?auto_19564 ?auto_19565 ) ( POWER_ON ?auto_19564 ) ( not ( = ?auto_19562 ?auto_19564 ) ) ( not ( = ?auto_19566 ?auto_19564 ) ) ( SUPPORTS ?auto_19564 ?auto_19559 ) ( POINTING ?auto_19565 ?auto_19563 ) ( CALIBRATION_TARGET ?auto_19564 ?auto_19563 ) ( NOT_CALIBRATED ?auto_19564 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19560 ?auto_19559 ?auto_19557 ?auto_19558 )
      ( GET-2IMAGE-VERIFY ?auto_19557 ?auto_19558 ?auto_19560 ?auto_19559 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_19568 - DIRECTION
      ?auto_19569 - MODE
      ?auto_19571 - DIRECTION
      ?auto_19570 - MODE
    )
    :vars
    (
      ?auto_19572 - INSTRUMENT
      ?auto_19575 - SATELLITE
      ?auto_19573 - DIRECTION
      ?auto_19578 - DIRECTION
      ?auto_19577 - MODE
      ?auto_19576 - INSTRUMENT
      ?auto_19574 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19572 ?auto_19575 ) ( SUPPORTS ?auto_19572 ?auto_19569 ) ( not ( = ?auto_19568 ?auto_19573 ) ) ( not ( = ?auto_19578 ?auto_19568 ) ) ( not ( = ?auto_19578 ?auto_19573 ) ) ( not ( = ?auto_19577 ?auto_19569 ) ) ( CALIBRATION_TARGET ?auto_19572 ?auto_19573 ) ( not ( = ?auto_19573 ?auto_19571 ) ) ( not ( = ?auto_19568 ?auto_19571 ) ) ( not ( = ?auto_19578 ?auto_19571 ) ) ( ON_BOARD ?auto_19576 ?auto_19575 ) ( not ( = ?auto_19572 ?auto_19576 ) ) ( SUPPORTS ?auto_19576 ?auto_19570 ) ( not ( = ?auto_19577 ?auto_19570 ) ) ( not ( = ?auto_19569 ?auto_19570 ) ) ( CALIBRATION_TARGET ?auto_19576 ?auto_19573 ) ( ON_BOARD ?auto_19574 ?auto_19575 ) ( POWER_ON ?auto_19574 ) ( not ( = ?auto_19572 ?auto_19574 ) ) ( not ( = ?auto_19576 ?auto_19574 ) ) ( SUPPORTS ?auto_19574 ?auto_19577 ) ( POINTING ?auto_19575 ?auto_19573 ) ( CALIBRATION_TARGET ?auto_19574 ?auto_19573 ) ( NOT_CALIBRATED ?auto_19574 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19578 ?auto_19577 ?auto_19568 ?auto_19569 )
      ( GET-2IMAGE-VERIFY ?auto_19568 ?auto_19569 ?auto_19571 ?auto_19570 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19605 - DIRECTION
      ?auto_19606 - MODE
      ?auto_19608 - DIRECTION
      ?auto_19607 - MODE
      ?auto_19610 - DIRECTION
      ?auto_19609 - MODE
    )
    :vars
    (
      ?auto_19611 - INSTRUMENT
      ?auto_19614 - SATELLITE
      ?auto_19612 - DIRECTION
      ?auto_19615 - INSTRUMENT
      ?auto_19613 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19611 ?auto_19614 ) ( SUPPORTS ?auto_19611 ?auto_19609 ) ( not ( = ?auto_19610 ?auto_19612 ) ) ( not ( = ?auto_19605 ?auto_19610 ) ) ( not ( = ?auto_19605 ?auto_19612 ) ) ( not ( = ?auto_19606 ?auto_19609 ) ) ( CALIBRATION_TARGET ?auto_19611 ?auto_19612 ) ( not ( = ?auto_19612 ?auto_19608 ) ) ( not ( = ?auto_19610 ?auto_19608 ) ) ( not ( = ?auto_19605 ?auto_19608 ) ) ( ON_BOARD ?auto_19615 ?auto_19614 ) ( not ( = ?auto_19611 ?auto_19615 ) ) ( SUPPORTS ?auto_19615 ?auto_19607 ) ( not ( = ?auto_19606 ?auto_19607 ) ) ( not ( = ?auto_19609 ?auto_19607 ) ) ( CALIBRATION_TARGET ?auto_19615 ?auto_19612 ) ( ON_BOARD ?auto_19613 ?auto_19614 ) ( POWER_ON ?auto_19613 ) ( not ( = ?auto_19611 ?auto_19613 ) ) ( not ( = ?auto_19615 ?auto_19613 ) ) ( SUPPORTS ?auto_19613 ?auto_19606 ) ( POINTING ?auto_19614 ?auto_19612 ) ( CALIBRATION_TARGET ?auto_19613 ?auto_19612 ) ( NOT_CALIBRATED ?auto_19613 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19605 ?auto_19606 ?auto_19610 ?auto_19609 )
      ( GET-3IMAGE-VERIFY ?auto_19605 ?auto_19606 ?auto_19608 ?auto_19607 ?auto_19610 ?auto_19609 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19629 - DIRECTION
      ?auto_19630 - MODE
      ?auto_19632 - DIRECTION
      ?auto_19631 - MODE
      ?auto_19634 - DIRECTION
      ?auto_19633 - MODE
    )
    :vars
    (
      ?auto_19635 - INSTRUMENT
      ?auto_19638 - SATELLITE
      ?auto_19636 - DIRECTION
      ?auto_19639 - INSTRUMENT
      ?auto_19637 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19635 ?auto_19638 ) ( SUPPORTS ?auto_19635 ?auto_19631 ) ( not ( = ?auto_19632 ?auto_19636 ) ) ( not ( = ?auto_19629 ?auto_19632 ) ) ( not ( = ?auto_19629 ?auto_19636 ) ) ( not ( = ?auto_19630 ?auto_19631 ) ) ( CALIBRATION_TARGET ?auto_19635 ?auto_19636 ) ( not ( = ?auto_19636 ?auto_19634 ) ) ( not ( = ?auto_19632 ?auto_19634 ) ) ( not ( = ?auto_19629 ?auto_19634 ) ) ( ON_BOARD ?auto_19639 ?auto_19638 ) ( not ( = ?auto_19635 ?auto_19639 ) ) ( SUPPORTS ?auto_19639 ?auto_19633 ) ( not ( = ?auto_19630 ?auto_19633 ) ) ( not ( = ?auto_19631 ?auto_19633 ) ) ( CALIBRATION_TARGET ?auto_19639 ?auto_19636 ) ( ON_BOARD ?auto_19637 ?auto_19638 ) ( POWER_ON ?auto_19637 ) ( not ( = ?auto_19635 ?auto_19637 ) ) ( not ( = ?auto_19639 ?auto_19637 ) ) ( SUPPORTS ?auto_19637 ?auto_19630 ) ( POINTING ?auto_19638 ?auto_19636 ) ( CALIBRATION_TARGET ?auto_19637 ?auto_19636 ) ( NOT_CALIBRATED ?auto_19637 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19629 ?auto_19630 ?auto_19632 ?auto_19631 )
      ( GET-3IMAGE-VERIFY ?auto_19629 ?auto_19630 ?auto_19632 ?auto_19631 ?auto_19634 ?auto_19633 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19653 - DIRECTION
      ?auto_19654 - MODE
      ?auto_19656 - DIRECTION
      ?auto_19655 - MODE
      ?auto_19658 - DIRECTION
      ?auto_19657 - MODE
    )
    :vars
    (
      ?auto_19659 - INSTRUMENT
      ?auto_19662 - SATELLITE
      ?auto_19660 - DIRECTION
      ?auto_19663 - INSTRUMENT
      ?auto_19661 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19659 ?auto_19662 ) ( SUPPORTS ?auto_19659 ?auto_19657 ) ( not ( = ?auto_19658 ?auto_19660 ) ) ( not ( = ?auto_19656 ?auto_19658 ) ) ( not ( = ?auto_19656 ?auto_19660 ) ) ( not ( = ?auto_19655 ?auto_19657 ) ) ( CALIBRATION_TARGET ?auto_19659 ?auto_19660 ) ( not ( = ?auto_19660 ?auto_19653 ) ) ( not ( = ?auto_19658 ?auto_19653 ) ) ( not ( = ?auto_19656 ?auto_19653 ) ) ( ON_BOARD ?auto_19663 ?auto_19662 ) ( not ( = ?auto_19659 ?auto_19663 ) ) ( SUPPORTS ?auto_19663 ?auto_19654 ) ( not ( = ?auto_19655 ?auto_19654 ) ) ( not ( = ?auto_19657 ?auto_19654 ) ) ( CALIBRATION_TARGET ?auto_19663 ?auto_19660 ) ( ON_BOARD ?auto_19661 ?auto_19662 ) ( POWER_ON ?auto_19661 ) ( not ( = ?auto_19659 ?auto_19661 ) ) ( not ( = ?auto_19663 ?auto_19661 ) ) ( SUPPORTS ?auto_19661 ?auto_19655 ) ( POINTING ?auto_19662 ?auto_19660 ) ( CALIBRATION_TARGET ?auto_19661 ?auto_19660 ) ( NOT_CALIBRATED ?auto_19661 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19656 ?auto_19655 ?auto_19658 ?auto_19657 )
      ( GET-3IMAGE-VERIFY ?auto_19653 ?auto_19654 ?auto_19656 ?auto_19655 ?auto_19658 ?auto_19657 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19677 - DIRECTION
      ?auto_19678 - MODE
      ?auto_19680 - DIRECTION
      ?auto_19679 - MODE
      ?auto_19682 - DIRECTION
      ?auto_19681 - MODE
    )
    :vars
    (
      ?auto_19683 - INSTRUMENT
      ?auto_19686 - SATELLITE
      ?auto_19684 - DIRECTION
      ?auto_19687 - INSTRUMENT
      ?auto_19685 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19683 ?auto_19686 ) ( SUPPORTS ?auto_19683 ?auto_19679 ) ( not ( = ?auto_19680 ?auto_19684 ) ) ( not ( = ?auto_19682 ?auto_19680 ) ) ( not ( = ?auto_19682 ?auto_19684 ) ) ( not ( = ?auto_19681 ?auto_19679 ) ) ( CALIBRATION_TARGET ?auto_19683 ?auto_19684 ) ( not ( = ?auto_19684 ?auto_19677 ) ) ( not ( = ?auto_19680 ?auto_19677 ) ) ( not ( = ?auto_19682 ?auto_19677 ) ) ( ON_BOARD ?auto_19687 ?auto_19686 ) ( not ( = ?auto_19683 ?auto_19687 ) ) ( SUPPORTS ?auto_19687 ?auto_19678 ) ( not ( = ?auto_19681 ?auto_19678 ) ) ( not ( = ?auto_19679 ?auto_19678 ) ) ( CALIBRATION_TARGET ?auto_19687 ?auto_19684 ) ( ON_BOARD ?auto_19685 ?auto_19686 ) ( POWER_ON ?auto_19685 ) ( not ( = ?auto_19683 ?auto_19685 ) ) ( not ( = ?auto_19687 ?auto_19685 ) ) ( SUPPORTS ?auto_19685 ?auto_19681 ) ( POINTING ?auto_19686 ?auto_19684 ) ( CALIBRATION_TARGET ?auto_19685 ?auto_19684 ) ( NOT_CALIBRATED ?auto_19685 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19682 ?auto_19681 ?auto_19680 ?auto_19679 )
      ( GET-3IMAGE-VERIFY ?auto_19677 ?auto_19678 ?auto_19680 ?auto_19679 ?auto_19682 ?auto_19681 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19727 - DIRECTION
      ?auto_19728 - MODE
      ?auto_19730 - DIRECTION
      ?auto_19729 - MODE
      ?auto_19732 - DIRECTION
      ?auto_19731 - MODE
    )
    :vars
    (
      ?auto_19733 - INSTRUMENT
      ?auto_19736 - SATELLITE
      ?auto_19734 - DIRECTION
      ?auto_19737 - INSTRUMENT
      ?auto_19735 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19733 ?auto_19736 ) ( SUPPORTS ?auto_19733 ?auto_19728 ) ( not ( = ?auto_19727 ?auto_19734 ) ) ( not ( = ?auto_19730 ?auto_19727 ) ) ( not ( = ?auto_19730 ?auto_19734 ) ) ( not ( = ?auto_19729 ?auto_19728 ) ) ( CALIBRATION_TARGET ?auto_19733 ?auto_19734 ) ( not ( = ?auto_19734 ?auto_19732 ) ) ( not ( = ?auto_19727 ?auto_19732 ) ) ( not ( = ?auto_19730 ?auto_19732 ) ) ( ON_BOARD ?auto_19737 ?auto_19736 ) ( not ( = ?auto_19733 ?auto_19737 ) ) ( SUPPORTS ?auto_19737 ?auto_19731 ) ( not ( = ?auto_19729 ?auto_19731 ) ) ( not ( = ?auto_19728 ?auto_19731 ) ) ( CALIBRATION_TARGET ?auto_19737 ?auto_19734 ) ( ON_BOARD ?auto_19735 ?auto_19736 ) ( POWER_ON ?auto_19735 ) ( not ( = ?auto_19733 ?auto_19735 ) ) ( not ( = ?auto_19737 ?auto_19735 ) ) ( SUPPORTS ?auto_19735 ?auto_19729 ) ( POINTING ?auto_19736 ?auto_19734 ) ( CALIBRATION_TARGET ?auto_19735 ?auto_19734 ) ( NOT_CALIBRATED ?auto_19735 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19730 ?auto_19729 ?auto_19727 ?auto_19728 )
      ( GET-3IMAGE-VERIFY ?auto_19727 ?auto_19728 ?auto_19730 ?auto_19729 ?auto_19732 ?auto_19731 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19751 - DIRECTION
      ?auto_19752 - MODE
      ?auto_19754 - DIRECTION
      ?auto_19753 - MODE
      ?auto_19756 - DIRECTION
      ?auto_19755 - MODE
    )
    :vars
    (
      ?auto_19757 - INSTRUMENT
      ?auto_19760 - SATELLITE
      ?auto_19758 - DIRECTION
      ?auto_19761 - INSTRUMENT
      ?auto_19759 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19757 ?auto_19760 ) ( SUPPORTS ?auto_19757 ?auto_19752 ) ( not ( = ?auto_19751 ?auto_19758 ) ) ( not ( = ?auto_19756 ?auto_19751 ) ) ( not ( = ?auto_19756 ?auto_19758 ) ) ( not ( = ?auto_19755 ?auto_19752 ) ) ( CALIBRATION_TARGET ?auto_19757 ?auto_19758 ) ( not ( = ?auto_19758 ?auto_19754 ) ) ( not ( = ?auto_19751 ?auto_19754 ) ) ( not ( = ?auto_19756 ?auto_19754 ) ) ( ON_BOARD ?auto_19761 ?auto_19760 ) ( not ( = ?auto_19757 ?auto_19761 ) ) ( SUPPORTS ?auto_19761 ?auto_19753 ) ( not ( = ?auto_19755 ?auto_19753 ) ) ( not ( = ?auto_19752 ?auto_19753 ) ) ( CALIBRATION_TARGET ?auto_19761 ?auto_19758 ) ( ON_BOARD ?auto_19759 ?auto_19760 ) ( POWER_ON ?auto_19759 ) ( not ( = ?auto_19757 ?auto_19759 ) ) ( not ( = ?auto_19761 ?auto_19759 ) ) ( SUPPORTS ?auto_19759 ?auto_19755 ) ( POINTING ?auto_19760 ?auto_19758 ) ( CALIBRATION_TARGET ?auto_19759 ?auto_19758 ) ( NOT_CALIBRATED ?auto_19759 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19756 ?auto_19755 ?auto_19751 ?auto_19752 )
      ( GET-3IMAGE-VERIFY ?auto_19751 ?auto_19752 ?auto_19754 ?auto_19753 ?auto_19756 ?auto_19755 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_19829 - DIRECTION
      ?auto_19830 - MODE
    )
    :vars
    (
      ?auto_19832 - INSTRUMENT
      ?auto_19835 - SATELLITE
      ?auto_19833 - DIRECTION
      ?auto_19839 - DIRECTION
      ?auto_19838 - MODE
      ?auto_19831 - DIRECTION
      ?auto_19836 - INSTRUMENT
      ?auto_19837 - MODE
      ?auto_19834 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19832 ?auto_19835 ) ( SUPPORTS ?auto_19832 ?auto_19830 ) ( not ( = ?auto_19829 ?auto_19833 ) ) ( not ( = ?auto_19839 ?auto_19829 ) ) ( not ( = ?auto_19839 ?auto_19833 ) ) ( not ( = ?auto_19838 ?auto_19830 ) ) ( CALIBRATION_TARGET ?auto_19832 ?auto_19833 ) ( not ( = ?auto_19833 ?auto_19831 ) ) ( not ( = ?auto_19829 ?auto_19831 ) ) ( not ( = ?auto_19839 ?auto_19831 ) ) ( ON_BOARD ?auto_19836 ?auto_19835 ) ( not ( = ?auto_19832 ?auto_19836 ) ) ( SUPPORTS ?auto_19836 ?auto_19837 ) ( not ( = ?auto_19838 ?auto_19837 ) ) ( not ( = ?auto_19830 ?auto_19837 ) ) ( CALIBRATION_TARGET ?auto_19836 ?auto_19833 ) ( ON_BOARD ?auto_19834 ?auto_19835 ) ( not ( = ?auto_19832 ?auto_19834 ) ) ( not ( = ?auto_19836 ?auto_19834 ) ) ( SUPPORTS ?auto_19834 ?auto_19838 ) ( POINTING ?auto_19835 ?auto_19833 ) ( CALIBRATION_TARGET ?auto_19834 ?auto_19833 ) ( POWER_AVAIL ?auto_19835 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_19834 ?auto_19835 )
      ( GET-2IMAGE ?auto_19839 ?auto_19838 ?auto_19829 ?auto_19830 )
      ( GET-1IMAGE-VERIFY ?auto_19829 ?auto_19830 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_19840 - DIRECTION
      ?auto_19841 - MODE
      ?auto_19843 - DIRECTION
      ?auto_19842 - MODE
    )
    :vars
    (
      ?auto_19849 - INSTRUMENT
      ?auto_19848 - SATELLITE
      ?auto_19850 - DIRECTION
      ?auto_19845 - DIRECTION
      ?auto_19847 - INSTRUMENT
      ?auto_19846 - MODE
      ?auto_19844 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19849 ?auto_19848 ) ( SUPPORTS ?auto_19849 ?auto_19842 ) ( not ( = ?auto_19843 ?auto_19850 ) ) ( not ( = ?auto_19840 ?auto_19843 ) ) ( not ( = ?auto_19840 ?auto_19850 ) ) ( not ( = ?auto_19841 ?auto_19842 ) ) ( CALIBRATION_TARGET ?auto_19849 ?auto_19850 ) ( not ( = ?auto_19850 ?auto_19845 ) ) ( not ( = ?auto_19843 ?auto_19845 ) ) ( not ( = ?auto_19840 ?auto_19845 ) ) ( ON_BOARD ?auto_19847 ?auto_19848 ) ( not ( = ?auto_19849 ?auto_19847 ) ) ( SUPPORTS ?auto_19847 ?auto_19846 ) ( not ( = ?auto_19841 ?auto_19846 ) ) ( not ( = ?auto_19842 ?auto_19846 ) ) ( CALIBRATION_TARGET ?auto_19847 ?auto_19850 ) ( ON_BOARD ?auto_19844 ?auto_19848 ) ( not ( = ?auto_19849 ?auto_19844 ) ) ( not ( = ?auto_19847 ?auto_19844 ) ) ( SUPPORTS ?auto_19844 ?auto_19841 ) ( POINTING ?auto_19848 ?auto_19850 ) ( CALIBRATION_TARGET ?auto_19844 ?auto_19850 ) ( POWER_AVAIL ?auto_19848 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_19843 ?auto_19842 )
      ( GET-2IMAGE-VERIFY ?auto_19840 ?auto_19841 ?auto_19843 ?auto_19842 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_19851 - DIRECTION
      ?auto_19852 - MODE
      ?auto_19854 - DIRECTION
      ?auto_19853 - MODE
    )
    :vars
    (
      ?auto_19859 - INSTRUMENT
      ?auto_19858 - SATELLITE
      ?auto_19857 - DIRECTION
      ?auto_19861 - DIRECTION
      ?auto_19860 - MODE
      ?auto_19856 - INSTRUMENT
      ?auto_19855 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19859 ?auto_19858 ) ( SUPPORTS ?auto_19859 ?auto_19853 ) ( not ( = ?auto_19854 ?auto_19857 ) ) ( not ( = ?auto_19861 ?auto_19854 ) ) ( not ( = ?auto_19861 ?auto_19857 ) ) ( not ( = ?auto_19860 ?auto_19853 ) ) ( CALIBRATION_TARGET ?auto_19859 ?auto_19857 ) ( not ( = ?auto_19857 ?auto_19851 ) ) ( not ( = ?auto_19854 ?auto_19851 ) ) ( not ( = ?auto_19861 ?auto_19851 ) ) ( ON_BOARD ?auto_19856 ?auto_19858 ) ( not ( = ?auto_19859 ?auto_19856 ) ) ( SUPPORTS ?auto_19856 ?auto_19852 ) ( not ( = ?auto_19860 ?auto_19852 ) ) ( not ( = ?auto_19853 ?auto_19852 ) ) ( CALIBRATION_TARGET ?auto_19856 ?auto_19857 ) ( ON_BOARD ?auto_19855 ?auto_19858 ) ( not ( = ?auto_19859 ?auto_19855 ) ) ( not ( = ?auto_19856 ?auto_19855 ) ) ( SUPPORTS ?auto_19855 ?auto_19860 ) ( POINTING ?auto_19858 ?auto_19857 ) ( CALIBRATION_TARGET ?auto_19855 ?auto_19857 ) ( POWER_AVAIL ?auto_19858 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19861 ?auto_19860 ?auto_19854 ?auto_19853 )
      ( GET-2IMAGE-VERIFY ?auto_19851 ?auto_19852 ?auto_19854 ?auto_19853 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_19862 - DIRECTION
      ?auto_19863 - MODE
      ?auto_19865 - DIRECTION
      ?auto_19864 - MODE
    )
    :vars
    (
      ?auto_19872 - INSTRUMENT
      ?auto_19869 - SATELLITE
      ?auto_19868 - DIRECTION
      ?auto_19871 - DIRECTION
      ?auto_19867 - INSTRUMENT
      ?auto_19870 - MODE
      ?auto_19866 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19872 ?auto_19869 ) ( SUPPORTS ?auto_19872 ?auto_19863 ) ( not ( = ?auto_19862 ?auto_19868 ) ) ( not ( = ?auto_19865 ?auto_19862 ) ) ( not ( = ?auto_19865 ?auto_19868 ) ) ( not ( = ?auto_19864 ?auto_19863 ) ) ( CALIBRATION_TARGET ?auto_19872 ?auto_19868 ) ( not ( = ?auto_19868 ?auto_19871 ) ) ( not ( = ?auto_19862 ?auto_19871 ) ) ( not ( = ?auto_19865 ?auto_19871 ) ) ( ON_BOARD ?auto_19867 ?auto_19869 ) ( not ( = ?auto_19872 ?auto_19867 ) ) ( SUPPORTS ?auto_19867 ?auto_19870 ) ( not ( = ?auto_19864 ?auto_19870 ) ) ( not ( = ?auto_19863 ?auto_19870 ) ) ( CALIBRATION_TARGET ?auto_19867 ?auto_19868 ) ( ON_BOARD ?auto_19866 ?auto_19869 ) ( not ( = ?auto_19872 ?auto_19866 ) ) ( not ( = ?auto_19867 ?auto_19866 ) ) ( SUPPORTS ?auto_19866 ?auto_19864 ) ( POINTING ?auto_19869 ?auto_19868 ) ( CALIBRATION_TARGET ?auto_19866 ?auto_19868 ) ( POWER_AVAIL ?auto_19869 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19865 ?auto_19864 ?auto_19862 ?auto_19863 )
      ( GET-2IMAGE-VERIFY ?auto_19862 ?auto_19863 ?auto_19865 ?auto_19864 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_19873 - DIRECTION
      ?auto_19874 - MODE
      ?auto_19876 - DIRECTION
      ?auto_19875 - MODE
    )
    :vars
    (
      ?auto_19881 - INSTRUMENT
      ?auto_19880 - SATELLITE
      ?auto_19879 - DIRECTION
      ?auto_19883 - DIRECTION
      ?auto_19882 - MODE
      ?auto_19878 - INSTRUMENT
      ?auto_19877 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19881 ?auto_19880 ) ( SUPPORTS ?auto_19881 ?auto_19874 ) ( not ( = ?auto_19873 ?auto_19879 ) ) ( not ( = ?auto_19883 ?auto_19873 ) ) ( not ( = ?auto_19883 ?auto_19879 ) ) ( not ( = ?auto_19882 ?auto_19874 ) ) ( CALIBRATION_TARGET ?auto_19881 ?auto_19879 ) ( not ( = ?auto_19879 ?auto_19876 ) ) ( not ( = ?auto_19873 ?auto_19876 ) ) ( not ( = ?auto_19883 ?auto_19876 ) ) ( ON_BOARD ?auto_19878 ?auto_19880 ) ( not ( = ?auto_19881 ?auto_19878 ) ) ( SUPPORTS ?auto_19878 ?auto_19875 ) ( not ( = ?auto_19882 ?auto_19875 ) ) ( not ( = ?auto_19874 ?auto_19875 ) ) ( CALIBRATION_TARGET ?auto_19878 ?auto_19879 ) ( ON_BOARD ?auto_19877 ?auto_19880 ) ( not ( = ?auto_19881 ?auto_19877 ) ) ( not ( = ?auto_19878 ?auto_19877 ) ) ( SUPPORTS ?auto_19877 ?auto_19882 ) ( POINTING ?auto_19880 ?auto_19879 ) ( CALIBRATION_TARGET ?auto_19877 ?auto_19879 ) ( POWER_AVAIL ?auto_19880 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19883 ?auto_19882 ?auto_19873 ?auto_19874 )
      ( GET-2IMAGE-VERIFY ?auto_19873 ?auto_19874 ?auto_19876 ?auto_19875 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19910 - DIRECTION
      ?auto_19911 - MODE
      ?auto_19913 - DIRECTION
      ?auto_19912 - MODE
      ?auto_19915 - DIRECTION
      ?auto_19914 - MODE
    )
    :vars
    (
      ?auto_19920 - INSTRUMENT
      ?auto_19919 - SATELLITE
      ?auto_19918 - DIRECTION
      ?auto_19917 - INSTRUMENT
      ?auto_19916 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19920 ?auto_19919 ) ( SUPPORTS ?auto_19920 ?auto_19914 ) ( not ( = ?auto_19915 ?auto_19918 ) ) ( not ( = ?auto_19910 ?auto_19915 ) ) ( not ( = ?auto_19910 ?auto_19918 ) ) ( not ( = ?auto_19911 ?auto_19914 ) ) ( CALIBRATION_TARGET ?auto_19920 ?auto_19918 ) ( not ( = ?auto_19918 ?auto_19913 ) ) ( not ( = ?auto_19915 ?auto_19913 ) ) ( not ( = ?auto_19910 ?auto_19913 ) ) ( ON_BOARD ?auto_19917 ?auto_19919 ) ( not ( = ?auto_19920 ?auto_19917 ) ) ( SUPPORTS ?auto_19917 ?auto_19912 ) ( not ( = ?auto_19911 ?auto_19912 ) ) ( not ( = ?auto_19914 ?auto_19912 ) ) ( CALIBRATION_TARGET ?auto_19917 ?auto_19918 ) ( ON_BOARD ?auto_19916 ?auto_19919 ) ( not ( = ?auto_19920 ?auto_19916 ) ) ( not ( = ?auto_19917 ?auto_19916 ) ) ( SUPPORTS ?auto_19916 ?auto_19911 ) ( POINTING ?auto_19919 ?auto_19918 ) ( CALIBRATION_TARGET ?auto_19916 ?auto_19918 ) ( POWER_AVAIL ?auto_19919 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19910 ?auto_19911 ?auto_19915 ?auto_19914 )
      ( GET-3IMAGE-VERIFY ?auto_19910 ?auto_19911 ?auto_19913 ?auto_19912 ?auto_19915 ?auto_19914 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19934 - DIRECTION
      ?auto_19935 - MODE
      ?auto_19937 - DIRECTION
      ?auto_19936 - MODE
      ?auto_19939 - DIRECTION
      ?auto_19938 - MODE
    )
    :vars
    (
      ?auto_19944 - INSTRUMENT
      ?auto_19943 - SATELLITE
      ?auto_19942 - DIRECTION
      ?auto_19941 - INSTRUMENT
      ?auto_19940 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19944 ?auto_19943 ) ( SUPPORTS ?auto_19944 ?auto_19936 ) ( not ( = ?auto_19937 ?auto_19942 ) ) ( not ( = ?auto_19934 ?auto_19937 ) ) ( not ( = ?auto_19934 ?auto_19942 ) ) ( not ( = ?auto_19935 ?auto_19936 ) ) ( CALIBRATION_TARGET ?auto_19944 ?auto_19942 ) ( not ( = ?auto_19942 ?auto_19939 ) ) ( not ( = ?auto_19937 ?auto_19939 ) ) ( not ( = ?auto_19934 ?auto_19939 ) ) ( ON_BOARD ?auto_19941 ?auto_19943 ) ( not ( = ?auto_19944 ?auto_19941 ) ) ( SUPPORTS ?auto_19941 ?auto_19938 ) ( not ( = ?auto_19935 ?auto_19938 ) ) ( not ( = ?auto_19936 ?auto_19938 ) ) ( CALIBRATION_TARGET ?auto_19941 ?auto_19942 ) ( ON_BOARD ?auto_19940 ?auto_19943 ) ( not ( = ?auto_19944 ?auto_19940 ) ) ( not ( = ?auto_19941 ?auto_19940 ) ) ( SUPPORTS ?auto_19940 ?auto_19935 ) ( POINTING ?auto_19943 ?auto_19942 ) ( CALIBRATION_TARGET ?auto_19940 ?auto_19942 ) ( POWER_AVAIL ?auto_19943 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19934 ?auto_19935 ?auto_19937 ?auto_19936 )
      ( GET-3IMAGE-VERIFY ?auto_19934 ?auto_19935 ?auto_19937 ?auto_19936 ?auto_19939 ?auto_19938 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19958 - DIRECTION
      ?auto_19959 - MODE
      ?auto_19961 - DIRECTION
      ?auto_19960 - MODE
      ?auto_19963 - DIRECTION
      ?auto_19962 - MODE
    )
    :vars
    (
      ?auto_19968 - INSTRUMENT
      ?auto_19967 - SATELLITE
      ?auto_19966 - DIRECTION
      ?auto_19965 - INSTRUMENT
      ?auto_19964 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19968 ?auto_19967 ) ( SUPPORTS ?auto_19968 ?auto_19962 ) ( not ( = ?auto_19963 ?auto_19966 ) ) ( not ( = ?auto_19961 ?auto_19963 ) ) ( not ( = ?auto_19961 ?auto_19966 ) ) ( not ( = ?auto_19960 ?auto_19962 ) ) ( CALIBRATION_TARGET ?auto_19968 ?auto_19966 ) ( not ( = ?auto_19966 ?auto_19958 ) ) ( not ( = ?auto_19963 ?auto_19958 ) ) ( not ( = ?auto_19961 ?auto_19958 ) ) ( ON_BOARD ?auto_19965 ?auto_19967 ) ( not ( = ?auto_19968 ?auto_19965 ) ) ( SUPPORTS ?auto_19965 ?auto_19959 ) ( not ( = ?auto_19960 ?auto_19959 ) ) ( not ( = ?auto_19962 ?auto_19959 ) ) ( CALIBRATION_TARGET ?auto_19965 ?auto_19966 ) ( ON_BOARD ?auto_19964 ?auto_19967 ) ( not ( = ?auto_19968 ?auto_19964 ) ) ( not ( = ?auto_19965 ?auto_19964 ) ) ( SUPPORTS ?auto_19964 ?auto_19960 ) ( POINTING ?auto_19967 ?auto_19966 ) ( CALIBRATION_TARGET ?auto_19964 ?auto_19966 ) ( POWER_AVAIL ?auto_19967 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19961 ?auto_19960 ?auto_19963 ?auto_19962 )
      ( GET-3IMAGE-VERIFY ?auto_19958 ?auto_19959 ?auto_19961 ?auto_19960 ?auto_19963 ?auto_19962 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_19982 - DIRECTION
      ?auto_19983 - MODE
      ?auto_19985 - DIRECTION
      ?auto_19984 - MODE
      ?auto_19987 - DIRECTION
      ?auto_19986 - MODE
    )
    :vars
    (
      ?auto_19992 - INSTRUMENT
      ?auto_19991 - SATELLITE
      ?auto_19990 - DIRECTION
      ?auto_19989 - INSTRUMENT
      ?auto_19988 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_19992 ?auto_19991 ) ( SUPPORTS ?auto_19992 ?auto_19984 ) ( not ( = ?auto_19985 ?auto_19990 ) ) ( not ( = ?auto_19987 ?auto_19985 ) ) ( not ( = ?auto_19987 ?auto_19990 ) ) ( not ( = ?auto_19986 ?auto_19984 ) ) ( CALIBRATION_TARGET ?auto_19992 ?auto_19990 ) ( not ( = ?auto_19990 ?auto_19982 ) ) ( not ( = ?auto_19985 ?auto_19982 ) ) ( not ( = ?auto_19987 ?auto_19982 ) ) ( ON_BOARD ?auto_19989 ?auto_19991 ) ( not ( = ?auto_19992 ?auto_19989 ) ) ( SUPPORTS ?auto_19989 ?auto_19983 ) ( not ( = ?auto_19986 ?auto_19983 ) ) ( not ( = ?auto_19984 ?auto_19983 ) ) ( CALIBRATION_TARGET ?auto_19989 ?auto_19990 ) ( ON_BOARD ?auto_19988 ?auto_19991 ) ( not ( = ?auto_19992 ?auto_19988 ) ) ( not ( = ?auto_19989 ?auto_19988 ) ) ( SUPPORTS ?auto_19988 ?auto_19986 ) ( POINTING ?auto_19991 ?auto_19990 ) ( CALIBRATION_TARGET ?auto_19988 ?auto_19990 ) ( POWER_AVAIL ?auto_19991 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_19987 ?auto_19986 ?auto_19985 ?auto_19984 )
      ( GET-3IMAGE-VERIFY ?auto_19982 ?auto_19983 ?auto_19985 ?auto_19984 ?auto_19987 ?auto_19986 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20032 - DIRECTION
      ?auto_20033 - MODE
      ?auto_20035 - DIRECTION
      ?auto_20034 - MODE
      ?auto_20037 - DIRECTION
      ?auto_20036 - MODE
    )
    :vars
    (
      ?auto_20042 - INSTRUMENT
      ?auto_20041 - SATELLITE
      ?auto_20040 - DIRECTION
      ?auto_20039 - INSTRUMENT
      ?auto_20038 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_20042 ?auto_20041 ) ( SUPPORTS ?auto_20042 ?auto_20033 ) ( not ( = ?auto_20032 ?auto_20040 ) ) ( not ( = ?auto_20035 ?auto_20032 ) ) ( not ( = ?auto_20035 ?auto_20040 ) ) ( not ( = ?auto_20034 ?auto_20033 ) ) ( CALIBRATION_TARGET ?auto_20042 ?auto_20040 ) ( not ( = ?auto_20040 ?auto_20037 ) ) ( not ( = ?auto_20032 ?auto_20037 ) ) ( not ( = ?auto_20035 ?auto_20037 ) ) ( ON_BOARD ?auto_20039 ?auto_20041 ) ( not ( = ?auto_20042 ?auto_20039 ) ) ( SUPPORTS ?auto_20039 ?auto_20036 ) ( not ( = ?auto_20034 ?auto_20036 ) ) ( not ( = ?auto_20033 ?auto_20036 ) ) ( CALIBRATION_TARGET ?auto_20039 ?auto_20040 ) ( ON_BOARD ?auto_20038 ?auto_20041 ) ( not ( = ?auto_20042 ?auto_20038 ) ) ( not ( = ?auto_20039 ?auto_20038 ) ) ( SUPPORTS ?auto_20038 ?auto_20034 ) ( POINTING ?auto_20041 ?auto_20040 ) ( CALIBRATION_TARGET ?auto_20038 ?auto_20040 ) ( POWER_AVAIL ?auto_20041 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20035 ?auto_20034 ?auto_20032 ?auto_20033 )
      ( GET-3IMAGE-VERIFY ?auto_20032 ?auto_20033 ?auto_20035 ?auto_20034 ?auto_20037 ?auto_20036 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20056 - DIRECTION
      ?auto_20057 - MODE
      ?auto_20059 - DIRECTION
      ?auto_20058 - MODE
      ?auto_20061 - DIRECTION
      ?auto_20060 - MODE
    )
    :vars
    (
      ?auto_20066 - INSTRUMENT
      ?auto_20065 - SATELLITE
      ?auto_20064 - DIRECTION
      ?auto_20063 - INSTRUMENT
      ?auto_20062 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_20066 ?auto_20065 ) ( SUPPORTS ?auto_20066 ?auto_20057 ) ( not ( = ?auto_20056 ?auto_20064 ) ) ( not ( = ?auto_20061 ?auto_20056 ) ) ( not ( = ?auto_20061 ?auto_20064 ) ) ( not ( = ?auto_20060 ?auto_20057 ) ) ( CALIBRATION_TARGET ?auto_20066 ?auto_20064 ) ( not ( = ?auto_20064 ?auto_20059 ) ) ( not ( = ?auto_20056 ?auto_20059 ) ) ( not ( = ?auto_20061 ?auto_20059 ) ) ( ON_BOARD ?auto_20063 ?auto_20065 ) ( not ( = ?auto_20066 ?auto_20063 ) ) ( SUPPORTS ?auto_20063 ?auto_20058 ) ( not ( = ?auto_20060 ?auto_20058 ) ) ( not ( = ?auto_20057 ?auto_20058 ) ) ( CALIBRATION_TARGET ?auto_20063 ?auto_20064 ) ( ON_BOARD ?auto_20062 ?auto_20065 ) ( not ( = ?auto_20066 ?auto_20062 ) ) ( not ( = ?auto_20063 ?auto_20062 ) ) ( SUPPORTS ?auto_20062 ?auto_20060 ) ( POINTING ?auto_20065 ?auto_20064 ) ( CALIBRATION_TARGET ?auto_20062 ?auto_20064 ) ( POWER_AVAIL ?auto_20065 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20061 ?auto_20060 ?auto_20056 ?auto_20057 )
      ( GET-3IMAGE-VERIFY ?auto_20056 ?auto_20057 ?auto_20059 ?auto_20058 ?auto_20061 ?auto_20060 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_20134 - DIRECTION
      ?auto_20135 - MODE
    )
    :vars
    (
      ?auto_20142 - INSTRUMENT
      ?auto_20139 - SATELLITE
      ?auto_20138 - DIRECTION
      ?auto_20144 - DIRECTION
      ?auto_20143 - MODE
      ?auto_20141 - DIRECTION
      ?auto_20137 - INSTRUMENT
      ?auto_20140 - MODE
      ?auto_20136 - INSTRUMENT
      ?auto_20145 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20142 ?auto_20139 ) ( SUPPORTS ?auto_20142 ?auto_20135 ) ( not ( = ?auto_20134 ?auto_20138 ) ) ( not ( = ?auto_20144 ?auto_20134 ) ) ( not ( = ?auto_20144 ?auto_20138 ) ) ( not ( = ?auto_20143 ?auto_20135 ) ) ( CALIBRATION_TARGET ?auto_20142 ?auto_20138 ) ( not ( = ?auto_20138 ?auto_20141 ) ) ( not ( = ?auto_20134 ?auto_20141 ) ) ( not ( = ?auto_20144 ?auto_20141 ) ) ( ON_BOARD ?auto_20137 ?auto_20139 ) ( not ( = ?auto_20142 ?auto_20137 ) ) ( SUPPORTS ?auto_20137 ?auto_20140 ) ( not ( = ?auto_20143 ?auto_20140 ) ) ( not ( = ?auto_20135 ?auto_20140 ) ) ( CALIBRATION_TARGET ?auto_20137 ?auto_20138 ) ( ON_BOARD ?auto_20136 ?auto_20139 ) ( not ( = ?auto_20142 ?auto_20136 ) ) ( not ( = ?auto_20137 ?auto_20136 ) ) ( SUPPORTS ?auto_20136 ?auto_20143 ) ( CALIBRATION_TARGET ?auto_20136 ?auto_20138 ) ( POWER_AVAIL ?auto_20139 ) ( POINTING ?auto_20139 ?auto_20145 ) ( not ( = ?auto_20138 ?auto_20145 ) ) ( not ( = ?auto_20134 ?auto_20145 ) ) ( not ( = ?auto_20144 ?auto_20145 ) ) ( not ( = ?auto_20141 ?auto_20145 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_20139 ?auto_20138 ?auto_20145 )
      ( GET-2IMAGE ?auto_20144 ?auto_20143 ?auto_20134 ?auto_20135 )
      ( GET-1IMAGE-VERIFY ?auto_20134 ?auto_20135 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20146 - DIRECTION
      ?auto_20147 - MODE
      ?auto_20149 - DIRECTION
      ?auto_20148 - MODE
    )
    :vars
    (
      ?auto_20150 - INSTRUMENT
      ?auto_20153 - SATELLITE
      ?auto_20155 - DIRECTION
      ?auto_20152 - DIRECTION
      ?auto_20154 - INSTRUMENT
      ?auto_20151 - MODE
      ?auto_20156 - INSTRUMENT
      ?auto_20157 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20150 ?auto_20153 ) ( SUPPORTS ?auto_20150 ?auto_20148 ) ( not ( = ?auto_20149 ?auto_20155 ) ) ( not ( = ?auto_20146 ?auto_20149 ) ) ( not ( = ?auto_20146 ?auto_20155 ) ) ( not ( = ?auto_20147 ?auto_20148 ) ) ( CALIBRATION_TARGET ?auto_20150 ?auto_20155 ) ( not ( = ?auto_20155 ?auto_20152 ) ) ( not ( = ?auto_20149 ?auto_20152 ) ) ( not ( = ?auto_20146 ?auto_20152 ) ) ( ON_BOARD ?auto_20154 ?auto_20153 ) ( not ( = ?auto_20150 ?auto_20154 ) ) ( SUPPORTS ?auto_20154 ?auto_20151 ) ( not ( = ?auto_20147 ?auto_20151 ) ) ( not ( = ?auto_20148 ?auto_20151 ) ) ( CALIBRATION_TARGET ?auto_20154 ?auto_20155 ) ( ON_BOARD ?auto_20156 ?auto_20153 ) ( not ( = ?auto_20150 ?auto_20156 ) ) ( not ( = ?auto_20154 ?auto_20156 ) ) ( SUPPORTS ?auto_20156 ?auto_20147 ) ( CALIBRATION_TARGET ?auto_20156 ?auto_20155 ) ( POWER_AVAIL ?auto_20153 ) ( POINTING ?auto_20153 ?auto_20157 ) ( not ( = ?auto_20155 ?auto_20157 ) ) ( not ( = ?auto_20149 ?auto_20157 ) ) ( not ( = ?auto_20146 ?auto_20157 ) ) ( not ( = ?auto_20152 ?auto_20157 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_20149 ?auto_20148 )
      ( GET-2IMAGE-VERIFY ?auto_20146 ?auto_20147 ?auto_20149 ?auto_20148 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20158 - DIRECTION
      ?auto_20159 - MODE
      ?auto_20161 - DIRECTION
      ?auto_20160 - MODE
    )
    :vars
    (
      ?auto_20164 - INSTRUMENT
      ?auto_20165 - SATELLITE
      ?auto_20167 - DIRECTION
      ?auto_20169 - DIRECTION
      ?auto_20168 - MODE
      ?auto_20162 - INSTRUMENT
      ?auto_20166 - INSTRUMENT
      ?auto_20163 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20164 ?auto_20165 ) ( SUPPORTS ?auto_20164 ?auto_20160 ) ( not ( = ?auto_20161 ?auto_20167 ) ) ( not ( = ?auto_20169 ?auto_20161 ) ) ( not ( = ?auto_20169 ?auto_20167 ) ) ( not ( = ?auto_20168 ?auto_20160 ) ) ( CALIBRATION_TARGET ?auto_20164 ?auto_20167 ) ( not ( = ?auto_20167 ?auto_20158 ) ) ( not ( = ?auto_20161 ?auto_20158 ) ) ( not ( = ?auto_20169 ?auto_20158 ) ) ( ON_BOARD ?auto_20162 ?auto_20165 ) ( not ( = ?auto_20164 ?auto_20162 ) ) ( SUPPORTS ?auto_20162 ?auto_20159 ) ( not ( = ?auto_20168 ?auto_20159 ) ) ( not ( = ?auto_20160 ?auto_20159 ) ) ( CALIBRATION_TARGET ?auto_20162 ?auto_20167 ) ( ON_BOARD ?auto_20166 ?auto_20165 ) ( not ( = ?auto_20164 ?auto_20166 ) ) ( not ( = ?auto_20162 ?auto_20166 ) ) ( SUPPORTS ?auto_20166 ?auto_20168 ) ( CALIBRATION_TARGET ?auto_20166 ?auto_20167 ) ( POWER_AVAIL ?auto_20165 ) ( POINTING ?auto_20165 ?auto_20163 ) ( not ( = ?auto_20167 ?auto_20163 ) ) ( not ( = ?auto_20161 ?auto_20163 ) ) ( not ( = ?auto_20169 ?auto_20163 ) ) ( not ( = ?auto_20158 ?auto_20163 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20169 ?auto_20168 ?auto_20161 ?auto_20160 )
      ( GET-2IMAGE-VERIFY ?auto_20158 ?auto_20159 ?auto_20161 ?auto_20160 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20170 - DIRECTION
      ?auto_20171 - MODE
      ?auto_20173 - DIRECTION
      ?auto_20172 - MODE
    )
    :vars
    (
      ?auto_20177 - INSTRUMENT
      ?auto_20179 - SATELLITE
      ?auto_20181 - DIRECTION
      ?auto_20178 - DIRECTION
      ?auto_20174 - INSTRUMENT
      ?auto_20175 - MODE
      ?auto_20180 - INSTRUMENT
      ?auto_20176 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20177 ?auto_20179 ) ( SUPPORTS ?auto_20177 ?auto_20171 ) ( not ( = ?auto_20170 ?auto_20181 ) ) ( not ( = ?auto_20173 ?auto_20170 ) ) ( not ( = ?auto_20173 ?auto_20181 ) ) ( not ( = ?auto_20172 ?auto_20171 ) ) ( CALIBRATION_TARGET ?auto_20177 ?auto_20181 ) ( not ( = ?auto_20181 ?auto_20178 ) ) ( not ( = ?auto_20170 ?auto_20178 ) ) ( not ( = ?auto_20173 ?auto_20178 ) ) ( ON_BOARD ?auto_20174 ?auto_20179 ) ( not ( = ?auto_20177 ?auto_20174 ) ) ( SUPPORTS ?auto_20174 ?auto_20175 ) ( not ( = ?auto_20172 ?auto_20175 ) ) ( not ( = ?auto_20171 ?auto_20175 ) ) ( CALIBRATION_TARGET ?auto_20174 ?auto_20181 ) ( ON_BOARD ?auto_20180 ?auto_20179 ) ( not ( = ?auto_20177 ?auto_20180 ) ) ( not ( = ?auto_20174 ?auto_20180 ) ) ( SUPPORTS ?auto_20180 ?auto_20172 ) ( CALIBRATION_TARGET ?auto_20180 ?auto_20181 ) ( POWER_AVAIL ?auto_20179 ) ( POINTING ?auto_20179 ?auto_20176 ) ( not ( = ?auto_20181 ?auto_20176 ) ) ( not ( = ?auto_20170 ?auto_20176 ) ) ( not ( = ?auto_20173 ?auto_20176 ) ) ( not ( = ?auto_20178 ?auto_20176 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20173 ?auto_20172 ?auto_20170 ?auto_20171 )
      ( GET-2IMAGE-VERIFY ?auto_20170 ?auto_20171 ?auto_20173 ?auto_20172 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20182 - DIRECTION
      ?auto_20183 - MODE
      ?auto_20185 - DIRECTION
      ?auto_20184 - MODE
    )
    :vars
    (
      ?auto_20188 - INSTRUMENT
      ?auto_20189 - SATELLITE
      ?auto_20191 - DIRECTION
      ?auto_20193 - DIRECTION
      ?auto_20192 - MODE
      ?auto_20186 - INSTRUMENT
      ?auto_20190 - INSTRUMENT
      ?auto_20187 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20188 ?auto_20189 ) ( SUPPORTS ?auto_20188 ?auto_20183 ) ( not ( = ?auto_20182 ?auto_20191 ) ) ( not ( = ?auto_20193 ?auto_20182 ) ) ( not ( = ?auto_20193 ?auto_20191 ) ) ( not ( = ?auto_20192 ?auto_20183 ) ) ( CALIBRATION_TARGET ?auto_20188 ?auto_20191 ) ( not ( = ?auto_20191 ?auto_20185 ) ) ( not ( = ?auto_20182 ?auto_20185 ) ) ( not ( = ?auto_20193 ?auto_20185 ) ) ( ON_BOARD ?auto_20186 ?auto_20189 ) ( not ( = ?auto_20188 ?auto_20186 ) ) ( SUPPORTS ?auto_20186 ?auto_20184 ) ( not ( = ?auto_20192 ?auto_20184 ) ) ( not ( = ?auto_20183 ?auto_20184 ) ) ( CALIBRATION_TARGET ?auto_20186 ?auto_20191 ) ( ON_BOARD ?auto_20190 ?auto_20189 ) ( not ( = ?auto_20188 ?auto_20190 ) ) ( not ( = ?auto_20186 ?auto_20190 ) ) ( SUPPORTS ?auto_20190 ?auto_20192 ) ( CALIBRATION_TARGET ?auto_20190 ?auto_20191 ) ( POWER_AVAIL ?auto_20189 ) ( POINTING ?auto_20189 ?auto_20187 ) ( not ( = ?auto_20191 ?auto_20187 ) ) ( not ( = ?auto_20182 ?auto_20187 ) ) ( not ( = ?auto_20193 ?auto_20187 ) ) ( not ( = ?auto_20185 ?auto_20187 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20193 ?auto_20192 ?auto_20182 ?auto_20183 )
      ( GET-2IMAGE-VERIFY ?auto_20182 ?auto_20183 ?auto_20185 ?auto_20184 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20222 - DIRECTION
      ?auto_20223 - MODE
      ?auto_20225 - DIRECTION
      ?auto_20224 - MODE
      ?auto_20227 - DIRECTION
      ?auto_20226 - MODE
    )
    :vars
    (
      ?auto_20230 - INSTRUMENT
      ?auto_20231 - SATELLITE
      ?auto_20233 - DIRECTION
      ?auto_20228 - INSTRUMENT
      ?auto_20232 - INSTRUMENT
      ?auto_20229 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20230 ?auto_20231 ) ( SUPPORTS ?auto_20230 ?auto_20226 ) ( not ( = ?auto_20227 ?auto_20233 ) ) ( not ( = ?auto_20222 ?auto_20227 ) ) ( not ( = ?auto_20222 ?auto_20233 ) ) ( not ( = ?auto_20223 ?auto_20226 ) ) ( CALIBRATION_TARGET ?auto_20230 ?auto_20233 ) ( not ( = ?auto_20233 ?auto_20225 ) ) ( not ( = ?auto_20227 ?auto_20225 ) ) ( not ( = ?auto_20222 ?auto_20225 ) ) ( ON_BOARD ?auto_20228 ?auto_20231 ) ( not ( = ?auto_20230 ?auto_20228 ) ) ( SUPPORTS ?auto_20228 ?auto_20224 ) ( not ( = ?auto_20223 ?auto_20224 ) ) ( not ( = ?auto_20226 ?auto_20224 ) ) ( CALIBRATION_TARGET ?auto_20228 ?auto_20233 ) ( ON_BOARD ?auto_20232 ?auto_20231 ) ( not ( = ?auto_20230 ?auto_20232 ) ) ( not ( = ?auto_20228 ?auto_20232 ) ) ( SUPPORTS ?auto_20232 ?auto_20223 ) ( CALIBRATION_TARGET ?auto_20232 ?auto_20233 ) ( POWER_AVAIL ?auto_20231 ) ( POINTING ?auto_20231 ?auto_20229 ) ( not ( = ?auto_20233 ?auto_20229 ) ) ( not ( = ?auto_20227 ?auto_20229 ) ) ( not ( = ?auto_20222 ?auto_20229 ) ) ( not ( = ?auto_20225 ?auto_20229 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20222 ?auto_20223 ?auto_20227 ?auto_20226 )
      ( GET-3IMAGE-VERIFY ?auto_20222 ?auto_20223 ?auto_20225 ?auto_20224 ?auto_20227 ?auto_20226 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20248 - DIRECTION
      ?auto_20249 - MODE
      ?auto_20251 - DIRECTION
      ?auto_20250 - MODE
      ?auto_20253 - DIRECTION
      ?auto_20252 - MODE
    )
    :vars
    (
      ?auto_20256 - INSTRUMENT
      ?auto_20257 - SATELLITE
      ?auto_20259 - DIRECTION
      ?auto_20254 - INSTRUMENT
      ?auto_20258 - INSTRUMENT
      ?auto_20255 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20256 ?auto_20257 ) ( SUPPORTS ?auto_20256 ?auto_20250 ) ( not ( = ?auto_20251 ?auto_20259 ) ) ( not ( = ?auto_20248 ?auto_20251 ) ) ( not ( = ?auto_20248 ?auto_20259 ) ) ( not ( = ?auto_20249 ?auto_20250 ) ) ( CALIBRATION_TARGET ?auto_20256 ?auto_20259 ) ( not ( = ?auto_20259 ?auto_20253 ) ) ( not ( = ?auto_20251 ?auto_20253 ) ) ( not ( = ?auto_20248 ?auto_20253 ) ) ( ON_BOARD ?auto_20254 ?auto_20257 ) ( not ( = ?auto_20256 ?auto_20254 ) ) ( SUPPORTS ?auto_20254 ?auto_20252 ) ( not ( = ?auto_20249 ?auto_20252 ) ) ( not ( = ?auto_20250 ?auto_20252 ) ) ( CALIBRATION_TARGET ?auto_20254 ?auto_20259 ) ( ON_BOARD ?auto_20258 ?auto_20257 ) ( not ( = ?auto_20256 ?auto_20258 ) ) ( not ( = ?auto_20254 ?auto_20258 ) ) ( SUPPORTS ?auto_20258 ?auto_20249 ) ( CALIBRATION_TARGET ?auto_20258 ?auto_20259 ) ( POWER_AVAIL ?auto_20257 ) ( POINTING ?auto_20257 ?auto_20255 ) ( not ( = ?auto_20259 ?auto_20255 ) ) ( not ( = ?auto_20251 ?auto_20255 ) ) ( not ( = ?auto_20248 ?auto_20255 ) ) ( not ( = ?auto_20253 ?auto_20255 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20248 ?auto_20249 ?auto_20251 ?auto_20250 )
      ( GET-3IMAGE-VERIFY ?auto_20248 ?auto_20249 ?auto_20251 ?auto_20250 ?auto_20253 ?auto_20252 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20274 - DIRECTION
      ?auto_20275 - MODE
      ?auto_20277 - DIRECTION
      ?auto_20276 - MODE
      ?auto_20279 - DIRECTION
      ?auto_20278 - MODE
    )
    :vars
    (
      ?auto_20282 - INSTRUMENT
      ?auto_20283 - SATELLITE
      ?auto_20285 - DIRECTION
      ?auto_20280 - INSTRUMENT
      ?auto_20284 - INSTRUMENT
      ?auto_20281 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20282 ?auto_20283 ) ( SUPPORTS ?auto_20282 ?auto_20278 ) ( not ( = ?auto_20279 ?auto_20285 ) ) ( not ( = ?auto_20277 ?auto_20279 ) ) ( not ( = ?auto_20277 ?auto_20285 ) ) ( not ( = ?auto_20276 ?auto_20278 ) ) ( CALIBRATION_TARGET ?auto_20282 ?auto_20285 ) ( not ( = ?auto_20285 ?auto_20274 ) ) ( not ( = ?auto_20279 ?auto_20274 ) ) ( not ( = ?auto_20277 ?auto_20274 ) ) ( ON_BOARD ?auto_20280 ?auto_20283 ) ( not ( = ?auto_20282 ?auto_20280 ) ) ( SUPPORTS ?auto_20280 ?auto_20275 ) ( not ( = ?auto_20276 ?auto_20275 ) ) ( not ( = ?auto_20278 ?auto_20275 ) ) ( CALIBRATION_TARGET ?auto_20280 ?auto_20285 ) ( ON_BOARD ?auto_20284 ?auto_20283 ) ( not ( = ?auto_20282 ?auto_20284 ) ) ( not ( = ?auto_20280 ?auto_20284 ) ) ( SUPPORTS ?auto_20284 ?auto_20276 ) ( CALIBRATION_TARGET ?auto_20284 ?auto_20285 ) ( POWER_AVAIL ?auto_20283 ) ( POINTING ?auto_20283 ?auto_20281 ) ( not ( = ?auto_20285 ?auto_20281 ) ) ( not ( = ?auto_20279 ?auto_20281 ) ) ( not ( = ?auto_20277 ?auto_20281 ) ) ( not ( = ?auto_20274 ?auto_20281 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20277 ?auto_20276 ?auto_20279 ?auto_20278 )
      ( GET-3IMAGE-VERIFY ?auto_20274 ?auto_20275 ?auto_20277 ?auto_20276 ?auto_20279 ?auto_20278 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20300 - DIRECTION
      ?auto_20301 - MODE
      ?auto_20303 - DIRECTION
      ?auto_20302 - MODE
      ?auto_20305 - DIRECTION
      ?auto_20304 - MODE
    )
    :vars
    (
      ?auto_20308 - INSTRUMENT
      ?auto_20309 - SATELLITE
      ?auto_20311 - DIRECTION
      ?auto_20306 - INSTRUMENT
      ?auto_20310 - INSTRUMENT
      ?auto_20307 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20308 ?auto_20309 ) ( SUPPORTS ?auto_20308 ?auto_20302 ) ( not ( = ?auto_20303 ?auto_20311 ) ) ( not ( = ?auto_20305 ?auto_20303 ) ) ( not ( = ?auto_20305 ?auto_20311 ) ) ( not ( = ?auto_20304 ?auto_20302 ) ) ( CALIBRATION_TARGET ?auto_20308 ?auto_20311 ) ( not ( = ?auto_20311 ?auto_20300 ) ) ( not ( = ?auto_20303 ?auto_20300 ) ) ( not ( = ?auto_20305 ?auto_20300 ) ) ( ON_BOARD ?auto_20306 ?auto_20309 ) ( not ( = ?auto_20308 ?auto_20306 ) ) ( SUPPORTS ?auto_20306 ?auto_20301 ) ( not ( = ?auto_20304 ?auto_20301 ) ) ( not ( = ?auto_20302 ?auto_20301 ) ) ( CALIBRATION_TARGET ?auto_20306 ?auto_20311 ) ( ON_BOARD ?auto_20310 ?auto_20309 ) ( not ( = ?auto_20308 ?auto_20310 ) ) ( not ( = ?auto_20306 ?auto_20310 ) ) ( SUPPORTS ?auto_20310 ?auto_20304 ) ( CALIBRATION_TARGET ?auto_20310 ?auto_20311 ) ( POWER_AVAIL ?auto_20309 ) ( POINTING ?auto_20309 ?auto_20307 ) ( not ( = ?auto_20311 ?auto_20307 ) ) ( not ( = ?auto_20303 ?auto_20307 ) ) ( not ( = ?auto_20305 ?auto_20307 ) ) ( not ( = ?auto_20300 ?auto_20307 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20305 ?auto_20304 ?auto_20303 ?auto_20302 )
      ( GET-3IMAGE-VERIFY ?auto_20300 ?auto_20301 ?auto_20303 ?auto_20302 ?auto_20305 ?auto_20304 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20354 - DIRECTION
      ?auto_20355 - MODE
      ?auto_20357 - DIRECTION
      ?auto_20356 - MODE
      ?auto_20359 - DIRECTION
      ?auto_20358 - MODE
    )
    :vars
    (
      ?auto_20362 - INSTRUMENT
      ?auto_20363 - SATELLITE
      ?auto_20365 - DIRECTION
      ?auto_20360 - INSTRUMENT
      ?auto_20364 - INSTRUMENT
      ?auto_20361 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20362 ?auto_20363 ) ( SUPPORTS ?auto_20362 ?auto_20355 ) ( not ( = ?auto_20354 ?auto_20365 ) ) ( not ( = ?auto_20357 ?auto_20354 ) ) ( not ( = ?auto_20357 ?auto_20365 ) ) ( not ( = ?auto_20356 ?auto_20355 ) ) ( CALIBRATION_TARGET ?auto_20362 ?auto_20365 ) ( not ( = ?auto_20365 ?auto_20359 ) ) ( not ( = ?auto_20354 ?auto_20359 ) ) ( not ( = ?auto_20357 ?auto_20359 ) ) ( ON_BOARD ?auto_20360 ?auto_20363 ) ( not ( = ?auto_20362 ?auto_20360 ) ) ( SUPPORTS ?auto_20360 ?auto_20358 ) ( not ( = ?auto_20356 ?auto_20358 ) ) ( not ( = ?auto_20355 ?auto_20358 ) ) ( CALIBRATION_TARGET ?auto_20360 ?auto_20365 ) ( ON_BOARD ?auto_20364 ?auto_20363 ) ( not ( = ?auto_20362 ?auto_20364 ) ) ( not ( = ?auto_20360 ?auto_20364 ) ) ( SUPPORTS ?auto_20364 ?auto_20356 ) ( CALIBRATION_TARGET ?auto_20364 ?auto_20365 ) ( POWER_AVAIL ?auto_20363 ) ( POINTING ?auto_20363 ?auto_20361 ) ( not ( = ?auto_20365 ?auto_20361 ) ) ( not ( = ?auto_20354 ?auto_20361 ) ) ( not ( = ?auto_20357 ?auto_20361 ) ) ( not ( = ?auto_20359 ?auto_20361 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20357 ?auto_20356 ?auto_20354 ?auto_20355 )
      ( GET-3IMAGE-VERIFY ?auto_20354 ?auto_20355 ?auto_20357 ?auto_20356 ?auto_20359 ?auto_20358 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20380 - DIRECTION
      ?auto_20381 - MODE
      ?auto_20383 - DIRECTION
      ?auto_20382 - MODE
      ?auto_20385 - DIRECTION
      ?auto_20384 - MODE
    )
    :vars
    (
      ?auto_20388 - INSTRUMENT
      ?auto_20389 - SATELLITE
      ?auto_20391 - DIRECTION
      ?auto_20386 - INSTRUMENT
      ?auto_20390 - INSTRUMENT
      ?auto_20387 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20388 ?auto_20389 ) ( SUPPORTS ?auto_20388 ?auto_20381 ) ( not ( = ?auto_20380 ?auto_20391 ) ) ( not ( = ?auto_20385 ?auto_20380 ) ) ( not ( = ?auto_20385 ?auto_20391 ) ) ( not ( = ?auto_20384 ?auto_20381 ) ) ( CALIBRATION_TARGET ?auto_20388 ?auto_20391 ) ( not ( = ?auto_20391 ?auto_20383 ) ) ( not ( = ?auto_20380 ?auto_20383 ) ) ( not ( = ?auto_20385 ?auto_20383 ) ) ( ON_BOARD ?auto_20386 ?auto_20389 ) ( not ( = ?auto_20388 ?auto_20386 ) ) ( SUPPORTS ?auto_20386 ?auto_20382 ) ( not ( = ?auto_20384 ?auto_20382 ) ) ( not ( = ?auto_20381 ?auto_20382 ) ) ( CALIBRATION_TARGET ?auto_20386 ?auto_20391 ) ( ON_BOARD ?auto_20390 ?auto_20389 ) ( not ( = ?auto_20388 ?auto_20390 ) ) ( not ( = ?auto_20386 ?auto_20390 ) ) ( SUPPORTS ?auto_20390 ?auto_20384 ) ( CALIBRATION_TARGET ?auto_20390 ?auto_20391 ) ( POWER_AVAIL ?auto_20389 ) ( POINTING ?auto_20389 ?auto_20387 ) ( not ( = ?auto_20391 ?auto_20387 ) ) ( not ( = ?auto_20380 ?auto_20387 ) ) ( not ( = ?auto_20385 ?auto_20387 ) ) ( not ( = ?auto_20383 ?auto_20387 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20385 ?auto_20384 ?auto_20380 ?auto_20381 )
      ( GET-3IMAGE-VERIFY ?auto_20380 ?auto_20381 ?auto_20383 ?auto_20382 ?auto_20385 ?auto_20384 ) )
  )

)
