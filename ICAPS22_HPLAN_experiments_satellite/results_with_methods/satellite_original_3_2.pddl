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
      ?auto_14433 - INSTRUMENT
      ?auto_14434 - SATELLITE
      ?auto_14435 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_14433 ) ( ON_BOARD ?auto_14433 ?auto_14434 ) ( SUPPORTS ?auto_14433 ?auto_14432 ) ( POWER_ON ?auto_14433 ) ( POINTING ?auto_14434 ?auto_14435 ) ( not ( = ?auto_14431 ?auto_14435 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_14434 ?auto_14431 ?auto_14435 )
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
      ?auto_14454 - INSTRUMENT
      ?auto_14455 - SATELLITE
      ?auto_14456 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14454 ?auto_14455 ) ( SUPPORTS ?auto_14454 ?auto_14453 ) ( POWER_ON ?auto_14454 ) ( POINTING ?auto_14455 ?auto_14456 ) ( not ( = ?auto_14452 ?auto_14456 ) ) ( CALIBRATION_TARGET ?auto_14454 ?auto_14456 ) ( NOT_CALIBRATED ?auto_14454 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_14455 ?auto_14454 ?auto_14456 )
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
      ?auto_14476 - INSTRUMENT
      ?auto_14475 - SATELLITE
      ?auto_14477 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14476 ?auto_14475 ) ( SUPPORTS ?auto_14476 ?auto_14474 ) ( POINTING ?auto_14475 ?auto_14477 ) ( not ( = ?auto_14473 ?auto_14477 ) ) ( CALIBRATION_TARGET ?auto_14476 ?auto_14477 ) ( POWER_AVAIL ?auto_14475 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_14476 ?auto_14475 )
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
      ?auto_14496 - INSTRUMENT
      ?auto_14497 - SATELLITE
      ?auto_14498 - DIRECTION
      ?auto_14499 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_14496 ?auto_14497 ) ( SUPPORTS ?auto_14496 ?auto_14495 ) ( not ( = ?auto_14494 ?auto_14498 ) ) ( CALIBRATION_TARGET ?auto_14496 ?auto_14498 ) ( POWER_AVAIL ?auto_14497 ) ( POINTING ?auto_14497 ?auto_14499 ) ( not ( = ?auto_14498 ?auto_14499 ) ) ( not ( = ?auto_14494 ?auto_14499 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_14497 ?auto_14498 ?auto_14499 )
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
      ?auto_14582 - INSTRUMENT
      ?auto_14583 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_14581 ?auto_14578 ) ) ( CALIBRATED ?auto_14582 ) ( ON_BOARD ?auto_14582 ?auto_14583 ) ( SUPPORTS ?auto_14582 ?auto_14580 ) ( POWER_ON ?auto_14582 ) ( POINTING ?auto_14583 ?auto_14581 ) ( HAVE_IMAGE ?auto_14578 ?auto_14579 ) ( not ( = ?auto_14579 ?auto_14580 ) ) )
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
      ?auto_14588 - INSTRUMENT
      ?auto_14589 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_14587 ?auto_14584 ) ) ( CALIBRATED ?auto_14588 ) ( ON_BOARD ?auto_14588 ?auto_14589 ) ( SUPPORTS ?auto_14588 ?auto_14585 ) ( POWER_ON ?auto_14588 ) ( POINTING ?auto_14589 ?auto_14584 ) ( HAVE_IMAGE ?auto_14587 ?auto_14586 ) ( not ( = ?auto_14585 ?auto_14586 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_14584 ?auto_14585 )
      ( GET-2IMAGE-VERIFY ?auto_14584 ?auto_14585 ?auto_14587 ?auto_14586 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_14652 - DIRECTION
      ?auto_14653 - MODE
    )
    :vars
    (
      ?auto_14654 - INSTRUMENT
      ?auto_14655 - SATELLITE
      ?auto_14656 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_14654 ) ( ON_BOARD ?auto_14654 ?auto_14655 ) ( SUPPORTS ?auto_14654 ?auto_14653 ) ( POWER_ON ?auto_14654 ) ( POINTING ?auto_14655 ?auto_14656 ) ( not ( = ?auto_14652 ?auto_14656 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_14655 ?auto_14652 ?auto_14656 )
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
      ?auto_14663 - INSTRUMENT
      ?auto_14661 - SATELLITE
      ?auto_14662 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14660 ?auto_14657 ) ) ( CALIBRATED ?auto_14663 ) ( ON_BOARD ?auto_14663 ?auto_14661 ) ( SUPPORTS ?auto_14663 ?auto_14659 ) ( POWER_ON ?auto_14663 ) ( POINTING ?auto_14661 ?auto_14662 ) ( not ( = ?auto_14660 ?auto_14662 ) ) ( HAVE_IMAGE ?auto_14657 ?auto_14658 ) ( not ( = ?auto_14657 ?auto_14662 ) ) ( not ( = ?auto_14658 ?auto_14659 ) ) )
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
      ?auto_14668 - INSTRUMENT
      ?auto_14670 - SATELLITE
      ?auto_14669 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14667 ?auto_14664 ) ) ( CALIBRATED ?auto_14668 ) ( ON_BOARD ?auto_14668 ?auto_14670 ) ( SUPPORTS ?auto_14668 ?auto_14665 ) ( POWER_ON ?auto_14668 ) ( POINTING ?auto_14670 ?auto_14669 ) ( not ( = ?auto_14664 ?auto_14669 ) ) ( HAVE_IMAGE ?auto_14667 ?auto_14666 ) ( not ( = ?auto_14667 ?auto_14669 ) ) ( not ( = ?auto_14666 ?auto_14665 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14667 ?auto_14666 ?auto_14664 ?auto_14665 )
      ( GET-2IMAGE-VERIFY ?auto_14664 ?auto_14665 ?auto_14667 ?auto_14666 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_14745 - DIRECTION
      ?auto_14746 - MODE
    )
    :vars
    (
      ?auto_14749 - DIRECTION
      ?auto_14747 - INSTRUMENT
      ?auto_14750 - SATELLITE
      ?auto_14748 - DIRECTION
      ?auto_14751 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_14745 ?auto_14749 ) ) ( ON_BOARD ?auto_14747 ?auto_14750 ) ( SUPPORTS ?auto_14747 ?auto_14746 ) ( POWER_ON ?auto_14747 ) ( POINTING ?auto_14750 ?auto_14748 ) ( not ( = ?auto_14745 ?auto_14748 ) ) ( HAVE_IMAGE ?auto_14749 ?auto_14751 ) ( not ( = ?auto_14749 ?auto_14748 ) ) ( not ( = ?auto_14751 ?auto_14746 ) ) ( CALIBRATION_TARGET ?auto_14747 ?auto_14748 ) ( NOT_CALIBRATED ?auto_14747 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_14750 ?auto_14747 ?auto_14748 )
      ( GET-2IMAGE ?auto_14749 ?auto_14751 ?auto_14745 ?auto_14746 )
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
      ?auto_14758 - SATELLITE
      ?auto_14756 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14755 ?auto_14752 ) ) ( ON_BOARD ?auto_14757 ?auto_14758 ) ( SUPPORTS ?auto_14757 ?auto_14754 ) ( POWER_ON ?auto_14757 ) ( POINTING ?auto_14758 ?auto_14756 ) ( not ( = ?auto_14755 ?auto_14756 ) ) ( HAVE_IMAGE ?auto_14752 ?auto_14753 ) ( not ( = ?auto_14752 ?auto_14756 ) ) ( not ( = ?auto_14753 ?auto_14754 ) ) ( CALIBRATION_TARGET ?auto_14757 ?auto_14756 ) ( NOT_CALIBRATED ?auto_14757 ) )
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
      ?auto_14764 - INSTRUMENT
      ?auto_14765 - SATELLITE
      ?auto_14763 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14762 ?auto_14759 ) ) ( ON_BOARD ?auto_14764 ?auto_14765 ) ( SUPPORTS ?auto_14764 ?auto_14760 ) ( POWER_ON ?auto_14764 ) ( POINTING ?auto_14765 ?auto_14763 ) ( not ( = ?auto_14759 ?auto_14763 ) ) ( HAVE_IMAGE ?auto_14762 ?auto_14761 ) ( not ( = ?auto_14762 ?auto_14763 ) ) ( not ( = ?auto_14761 ?auto_14760 ) ) ( CALIBRATION_TARGET ?auto_14764 ?auto_14763 ) ( NOT_CALIBRATED ?auto_14764 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14762 ?auto_14761 ?auto_14759 ?auto_14760 )
      ( GET-2IMAGE-VERIFY ?auto_14759 ?auto_14760 ?auto_14762 ?auto_14761 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_14840 - DIRECTION
      ?auto_14841 - MODE
    )
    :vars
    (
      ?auto_14844 - DIRECTION
      ?auto_14845 - INSTRUMENT
      ?auto_14846 - SATELLITE
      ?auto_14842 - DIRECTION
      ?auto_14843 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_14840 ?auto_14844 ) ) ( ON_BOARD ?auto_14845 ?auto_14846 ) ( SUPPORTS ?auto_14845 ?auto_14841 ) ( POINTING ?auto_14846 ?auto_14842 ) ( not ( = ?auto_14840 ?auto_14842 ) ) ( HAVE_IMAGE ?auto_14844 ?auto_14843 ) ( not ( = ?auto_14844 ?auto_14842 ) ) ( not ( = ?auto_14843 ?auto_14841 ) ) ( CALIBRATION_TARGET ?auto_14845 ?auto_14842 ) ( POWER_AVAIL ?auto_14846 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_14845 ?auto_14846 )
      ( GET-2IMAGE ?auto_14844 ?auto_14843 ?auto_14840 ?auto_14841 )
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
      ?auto_14852 - INSTRUMENT
      ?auto_14851 - SATELLITE
      ?auto_14853 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14850 ?auto_14847 ) ) ( ON_BOARD ?auto_14852 ?auto_14851 ) ( SUPPORTS ?auto_14852 ?auto_14849 ) ( POINTING ?auto_14851 ?auto_14853 ) ( not ( = ?auto_14850 ?auto_14853 ) ) ( HAVE_IMAGE ?auto_14847 ?auto_14848 ) ( not ( = ?auto_14847 ?auto_14853 ) ) ( not ( = ?auto_14848 ?auto_14849 ) ) ( CALIBRATION_TARGET ?auto_14852 ?auto_14853 ) ( POWER_AVAIL ?auto_14851 ) )
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
      ?auto_14860 - INSTRUMENT
      ?auto_14859 - SATELLITE
      ?auto_14858 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14857 ?auto_14854 ) ) ( ON_BOARD ?auto_14860 ?auto_14859 ) ( SUPPORTS ?auto_14860 ?auto_14855 ) ( POINTING ?auto_14859 ?auto_14858 ) ( not ( = ?auto_14854 ?auto_14858 ) ) ( HAVE_IMAGE ?auto_14857 ?auto_14856 ) ( not ( = ?auto_14857 ?auto_14858 ) ) ( not ( = ?auto_14856 ?auto_14855 ) ) ( CALIBRATION_TARGET ?auto_14860 ?auto_14858 ) ( POWER_AVAIL ?auto_14859 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14857 ?auto_14856 ?auto_14854 ?auto_14855 )
      ( GET-2IMAGE-VERIFY ?auto_14854 ?auto_14855 ?auto_14857 ?auto_14856 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_14935 - DIRECTION
      ?auto_14936 - MODE
    )
    :vars
    (
      ?auto_14939 - DIRECTION
      ?auto_14941 - INSTRUMENT
      ?auto_14940 - SATELLITE
      ?auto_14938 - DIRECTION
      ?auto_14937 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_14935 ?auto_14939 ) ) ( ON_BOARD ?auto_14941 ?auto_14940 ) ( SUPPORTS ?auto_14941 ?auto_14936 ) ( not ( = ?auto_14935 ?auto_14938 ) ) ( HAVE_IMAGE ?auto_14939 ?auto_14937 ) ( not ( = ?auto_14939 ?auto_14938 ) ) ( not ( = ?auto_14937 ?auto_14936 ) ) ( CALIBRATION_TARGET ?auto_14941 ?auto_14938 ) ( POWER_AVAIL ?auto_14940 ) ( POINTING ?auto_14940 ?auto_14939 ) )
    :subtasks
    ( ( !TURN_TO ?auto_14940 ?auto_14938 ?auto_14939 )
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
      ?auto_14948 - INSTRUMENT
      ?auto_14947 - SATELLITE
      ?auto_14946 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14945 ?auto_14942 ) ) ( ON_BOARD ?auto_14948 ?auto_14947 ) ( SUPPORTS ?auto_14948 ?auto_14944 ) ( not ( = ?auto_14945 ?auto_14946 ) ) ( HAVE_IMAGE ?auto_14942 ?auto_14943 ) ( not ( = ?auto_14942 ?auto_14946 ) ) ( not ( = ?auto_14943 ?auto_14944 ) ) ( CALIBRATION_TARGET ?auto_14948 ?auto_14946 ) ( POWER_AVAIL ?auto_14947 ) ( POINTING ?auto_14947 ?auto_14942 ) )
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
      ?auto_14953 - INSTRUMENT
      ?auto_14954 - SATELLITE
      ?auto_14955 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_14952 ?auto_14949 ) ) ( ON_BOARD ?auto_14953 ?auto_14954 ) ( SUPPORTS ?auto_14953 ?auto_14950 ) ( not ( = ?auto_14949 ?auto_14955 ) ) ( HAVE_IMAGE ?auto_14952 ?auto_14951 ) ( not ( = ?auto_14952 ?auto_14955 ) ) ( not ( = ?auto_14951 ?auto_14950 ) ) ( CALIBRATION_TARGET ?auto_14953 ?auto_14955 ) ( POWER_AVAIL ?auto_14954 ) ( POINTING ?auto_14954 ?auto_14952 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_14952 ?auto_14951 ?auto_14949 ?auto_14950 )
      ( GET-2IMAGE-VERIFY ?auto_14949 ?auto_14950 ?auto_14952 ?auto_14951 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_15030 - DIRECTION
      ?auto_15031 - MODE
    )
    :vars
    (
      ?auto_15034 - DIRECTION
      ?auto_15033 - INSTRUMENT
      ?auto_15035 - SATELLITE
      ?auto_15036 - DIRECTION
      ?auto_15032 - MODE
      ?auto_15037 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15030 ?auto_15034 ) ) ( ON_BOARD ?auto_15033 ?auto_15035 ) ( SUPPORTS ?auto_15033 ?auto_15031 ) ( not ( = ?auto_15030 ?auto_15036 ) ) ( HAVE_IMAGE ?auto_15034 ?auto_15032 ) ( not ( = ?auto_15034 ?auto_15036 ) ) ( not ( = ?auto_15032 ?auto_15031 ) ) ( CALIBRATION_TARGET ?auto_15033 ?auto_15036 ) ( POINTING ?auto_15035 ?auto_15034 ) ( ON_BOARD ?auto_15037 ?auto_15035 ) ( POWER_ON ?auto_15037 ) ( not ( = ?auto_15033 ?auto_15037 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_15037 ?auto_15035 )
      ( GET-2IMAGE ?auto_15034 ?auto_15032 ?auto_15030 ?auto_15031 )
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
      ?auto_15042 - SATELLITE
      ?auto_15043 - DIRECTION
      ?auto_15044 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15041 ?auto_15038 ) ) ( ON_BOARD ?auto_15045 ?auto_15042 ) ( SUPPORTS ?auto_15045 ?auto_15040 ) ( not ( = ?auto_15041 ?auto_15043 ) ) ( HAVE_IMAGE ?auto_15038 ?auto_15039 ) ( not ( = ?auto_15038 ?auto_15043 ) ) ( not ( = ?auto_15039 ?auto_15040 ) ) ( CALIBRATION_TARGET ?auto_15045 ?auto_15043 ) ( POINTING ?auto_15042 ?auto_15038 ) ( ON_BOARD ?auto_15044 ?auto_15042 ) ( POWER_ON ?auto_15044 ) ( not ( = ?auto_15045 ?auto_15044 ) ) )
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
      ?auto_15052 - INSTRUMENT
      ?auto_15051 - SATELLITE
      ?auto_15053 - DIRECTION
      ?auto_15050 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15049 ?auto_15046 ) ) ( ON_BOARD ?auto_15052 ?auto_15051 ) ( SUPPORTS ?auto_15052 ?auto_15047 ) ( not ( = ?auto_15046 ?auto_15053 ) ) ( HAVE_IMAGE ?auto_15049 ?auto_15048 ) ( not ( = ?auto_15049 ?auto_15053 ) ) ( not ( = ?auto_15048 ?auto_15047 ) ) ( CALIBRATION_TARGET ?auto_15052 ?auto_15053 ) ( POINTING ?auto_15051 ?auto_15049 ) ( ON_BOARD ?auto_15050 ?auto_15051 ) ( POWER_ON ?auto_15050 ) ( not ( = ?auto_15052 ?auto_15050 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_15049 ?auto_15048 ?auto_15046 ?auto_15047 )
      ( GET-2IMAGE-VERIFY ?auto_15046 ?auto_15047 ?auto_15049 ?auto_15048 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_15136 - DIRECTION
      ?auto_15137 - MODE
    )
    :vars
    (
      ?auto_15143 - DIRECTION
      ?auto_15140 - INSTRUMENT
      ?auto_15139 - SATELLITE
      ?auto_15141 - DIRECTION
      ?auto_15142 - MODE
      ?auto_15138 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15136 ?auto_15143 ) ) ( ON_BOARD ?auto_15140 ?auto_15139 ) ( SUPPORTS ?auto_15140 ?auto_15137 ) ( not ( = ?auto_15136 ?auto_15141 ) ) ( not ( = ?auto_15143 ?auto_15141 ) ) ( not ( = ?auto_15142 ?auto_15137 ) ) ( CALIBRATION_TARGET ?auto_15140 ?auto_15141 ) ( POINTING ?auto_15139 ?auto_15143 ) ( ON_BOARD ?auto_15138 ?auto_15139 ) ( POWER_ON ?auto_15138 ) ( not ( = ?auto_15140 ?auto_15138 ) ) ( CALIBRATED ?auto_15138 ) ( SUPPORTS ?auto_15138 ?auto_15142 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15143 ?auto_15142 )
      ( GET-2IMAGE ?auto_15143 ?auto_15142 ?auto_15136 ?auto_15137 )
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
    ( and ( not ( = ?auto_15147 ?auto_15144 ) ) ( ON_BOARD ?auto_15149 ?auto_15150 ) ( SUPPORTS ?auto_15149 ?auto_15146 ) ( not ( = ?auto_15147 ?auto_15148 ) ) ( not ( = ?auto_15144 ?auto_15148 ) ) ( not ( = ?auto_15145 ?auto_15146 ) ) ( CALIBRATION_TARGET ?auto_15149 ?auto_15148 ) ( POINTING ?auto_15150 ?auto_15144 ) ( ON_BOARD ?auto_15151 ?auto_15150 ) ( POWER_ON ?auto_15151 ) ( not ( = ?auto_15149 ?auto_15151 ) ) ( CALIBRATED ?auto_15151 ) ( SUPPORTS ?auto_15151 ?auto_15145 ) )
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
      ?auto_15159 - INSTRUMENT
      ?auto_15158 - SATELLITE
      ?auto_15156 - DIRECTION
      ?auto_15157 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15155 ?auto_15152 ) ) ( ON_BOARD ?auto_15159 ?auto_15158 ) ( SUPPORTS ?auto_15159 ?auto_15153 ) ( not ( = ?auto_15152 ?auto_15156 ) ) ( not ( = ?auto_15155 ?auto_15156 ) ) ( not ( = ?auto_15154 ?auto_15153 ) ) ( CALIBRATION_TARGET ?auto_15159 ?auto_15156 ) ( POINTING ?auto_15158 ?auto_15155 ) ( ON_BOARD ?auto_15157 ?auto_15158 ) ( POWER_ON ?auto_15157 ) ( not ( = ?auto_15159 ?auto_15157 ) ) ( CALIBRATED ?auto_15157 ) ( SUPPORTS ?auto_15157 ?auto_15154 ) )
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
      ?auto_15248 - DIRECTION
      ?auto_15249 - INSTRUMENT
      ?auto_15246 - SATELLITE
      ?auto_15244 - DIRECTION
      ?auto_15247 - MODE
      ?auto_15245 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15242 ?auto_15248 ) ) ( ON_BOARD ?auto_15249 ?auto_15246 ) ( SUPPORTS ?auto_15249 ?auto_15243 ) ( not ( = ?auto_15242 ?auto_15244 ) ) ( not ( = ?auto_15248 ?auto_15244 ) ) ( not ( = ?auto_15247 ?auto_15243 ) ) ( CALIBRATION_TARGET ?auto_15249 ?auto_15244 ) ( ON_BOARD ?auto_15245 ?auto_15246 ) ( POWER_ON ?auto_15245 ) ( not ( = ?auto_15249 ?auto_15245 ) ) ( CALIBRATED ?auto_15245 ) ( SUPPORTS ?auto_15245 ?auto_15247 ) ( POINTING ?auto_15246 ?auto_15244 ) )
    :subtasks
    ( ( !TURN_TO ?auto_15246 ?auto_15248 ?auto_15244 )
      ( GET-2IMAGE ?auto_15248 ?auto_15247 ?auto_15242 ?auto_15243 )
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
      ?auto_15256 - INSTRUMENT
      ?auto_15255 - SATELLITE
      ?auto_15254 - DIRECTION
      ?auto_15257 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15253 ?auto_15250 ) ) ( ON_BOARD ?auto_15256 ?auto_15255 ) ( SUPPORTS ?auto_15256 ?auto_15252 ) ( not ( = ?auto_15253 ?auto_15254 ) ) ( not ( = ?auto_15250 ?auto_15254 ) ) ( not ( = ?auto_15251 ?auto_15252 ) ) ( CALIBRATION_TARGET ?auto_15256 ?auto_15254 ) ( ON_BOARD ?auto_15257 ?auto_15255 ) ( POWER_ON ?auto_15257 ) ( not ( = ?auto_15256 ?auto_15257 ) ) ( CALIBRATED ?auto_15257 ) ( SUPPORTS ?auto_15257 ?auto_15251 ) ( POINTING ?auto_15255 ?auto_15254 ) )
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
      ?auto_15262 - INSTRUMENT
      ?auto_15263 - SATELLITE
      ?auto_15264 - DIRECTION
      ?auto_15265 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15261 ?auto_15258 ) ) ( ON_BOARD ?auto_15262 ?auto_15263 ) ( SUPPORTS ?auto_15262 ?auto_15259 ) ( not ( = ?auto_15258 ?auto_15264 ) ) ( not ( = ?auto_15261 ?auto_15264 ) ) ( not ( = ?auto_15260 ?auto_15259 ) ) ( CALIBRATION_TARGET ?auto_15262 ?auto_15264 ) ( ON_BOARD ?auto_15265 ?auto_15263 ) ( POWER_ON ?auto_15265 ) ( not ( = ?auto_15262 ?auto_15265 ) ) ( CALIBRATED ?auto_15265 ) ( SUPPORTS ?auto_15265 ?auto_15260 ) ( POINTING ?auto_15263 ?auto_15264 ) )
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
      ?auto_15354 - DIRECTION
      ?auto_15350 - INSTRUMENT
      ?auto_15351 - SATELLITE
      ?auto_15352 - DIRECTION
      ?auto_15353 - MODE
      ?auto_15355 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15348 ?auto_15354 ) ) ( ON_BOARD ?auto_15350 ?auto_15351 ) ( SUPPORTS ?auto_15350 ?auto_15349 ) ( not ( = ?auto_15348 ?auto_15352 ) ) ( not ( = ?auto_15354 ?auto_15352 ) ) ( not ( = ?auto_15353 ?auto_15349 ) ) ( CALIBRATION_TARGET ?auto_15350 ?auto_15352 ) ( ON_BOARD ?auto_15355 ?auto_15351 ) ( POWER_ON ?auto_15355 ) ( not ( = ?auto_15350 ?auto_15355 ) ) ( SUPPORTS ?auto_15355 ?auto_15353 ) ( POINTING ?auto_15351 ?auto_15352 ) ( CALIBRATION_TARGET ?auto_15355 ?auto_15352 ) ( NOT_CALIBRATED ?auto_15355 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_15351 ?auto_15355 ?auto_15352 )
      ( GET-2IMAGE ?auto_15354 ?auto_15353 ?auto_15348 ?auto_15349 )
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
      ?auto_15360 - INSTRUMENT
      ?auto_15362 - SATELLITE
      ?auto_15363 - DIRECTION
      ?auto_15361 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15359 ?auto_15356 ) ) ( ON_BOARD ?auto_15360 ?auto_15362 ) ( SUPPORTS ?auto_15360 ?auto_15358 ) ( not ( = ?auto_15359 ?auto_15363 ) ) ( not ( = ?auto_15356 ?auto_15363 ) ) ( not ( = ?auto_15357 ?auto_15358 ) ) ( CALIBRATION_TARGET ?auto_15360 ?auto_15363 ) ( ON_BOARD ?auto_15361 ?auto_15362 ) ( POWER_ON ?auto_15361 ) ( not ( = ?auto_15360 ?auto_15361 ) ) ( SUPPORTS ?auto_15361 ?auto_15357 ) ( POINTING ?auto_15362 ?auto_15363 ) ( CALIBRATION_TARGET ?auto_15361 ?auto_15363 ) ( NOT_CALIBRATED ?auto_15361 ) )
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
      ?auto_15368 - INSTRUMENT
      ?auto_15370 - SATELLITE
      ?auto_15371 - DIRECTION
      ?auto_15369 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15367 ?auto_15364 ) ) ( ON_BOARD ?auto_15368 ?auto_15370 ) ( SUPPORTS ?auto_15368 ?auto_15365 ) ( not ( = ?auto_15364 ?auto_15371 ) ) ( not ( = ?auto_15367 ?auto_15371 ) ) ( not ( = ?auto_15366 ?auto_15365 ) ) ( CALIBRATION_TARGET ?auto_15368 ?auto_15371 ) ( ON_BOARD ?auto_15369 ?auto_15370 ) ( POWER_ON ?auto_15369 ) ( not ( = ?auto_15368 ?auto_15369 ) ) ( SUPPORTS ?auto_15369 ?auto_15366 ) ( POINTING ?auto_15370 ?auto_15371 ) ( CALIBRATION_TARGET ?auto_15369 ?auto_15371 ) ( NOT_CALIBRATED ?auto_15369 ) )
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
      ?auto_15457 - DIRECTION
      ?auto_15456 - INSTRUMENT
      ?auto_15460 - SATELLITE
      ?auto_15461 - DIRECTION
      ?auto_15458 - MODE
      ?auto_15459 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15454 ?auto_15457 ) ) ( ON_BOARD ?auto_15456 ?auto_15460 ) ( SUPPORTS ?auto_15456 ?auto_15455 ) ( not ( = ?auto_15454 ?auto_15461 ) ) ( not ( = ?auto_15457 ?auto_15461 ) ) ( not ( = ?auto_15458 ?auto_15455 ) ) ( CALIBRATION_TARGET ?auto_15456 ?auto_15461 ) ( ON_BOARD ?auto_15459 ?auto_15460 ) ( not ( = ?auto_15456 ?auto_15459 ) ) ( SUPPORTS ?auto_15459 ?auto_15458 ) ( POINTING ?auto_15460 ?auto_15461 ) ( CALIBRATION_TARGET ?auto_15459 ?auto_15461 ) ( POWER_AVAIL ?auto_15460 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_15459 ?auto_15460 )
      ( GET-2IMAGE ?auto_15457 ?auto_15458 ?auto_15454 ?auto_15455 )
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
      ?auto_15467 - INSTRUMENT
      ?auto_15468 - SATELLITE
      ?auto_15466 - DIRECTION
      ?auto_15469 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15465 ?auto_15462 ) ) ( ON_BOARD ?auto_15467 ?auto_15468 ) ( SUPPORTS ?auto_15467 ?auto_15464 ) ( not ( = ?auto_15465 ?auto_15466 ) ) ( not ( = ?auto_15462 ?auto_15466 ) ) ( not ( = ?auto_15463 ?auto_15464 ) ) ( CALIBRATION_TARGET ?auto_15467 ?auto_15466 ) ( ON_BOARD ?auto_15469 ?auto_15468 ) ( not ( = ?auto_15467 ?auto_15469 ) ) ( SUPPORTS ?auto_15469 ?auto_15463 ) ( POINTING ?auto_15468 ?auto_15466 ) ( CALIBRATION_TARGET ?auto_15469 ?auto_15466 ) ( POWER_AVAIL ?auto_15468 ) )
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
      ?auto_15474 - INSTRUMENT
      ?auto_15477 - SATELLITE
      ?auto_15476 - DIRECTION
      ?auto_15475 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_15473 ?auto_15470 ) ) ( ON_BOARD ?auto_15474 ?auto_15477 ) ( SUPPORTS ?auto_15474 ?auto_15471 ) ( not ( = ?auto_15470 ?auto_15476 ) ) ( not ( = ?auto_15473 ?auto_15476 ) ) ( not ( = ?auto_15472 ?auto_15471 ) ) ( CALIBRATION_TARGET ?auto_15474 ?auto_15476 ) ( ON_BOARD ?auto_15475 ?auto_15477 ) ( not ( = ?auto_15474 ?auto_15475 ) ) ( SUPPORTS ?auto_15475 ?auto_15472 ) ( POINTING ?auto_15477 ?auto_15476 ) ( CALIBRATION_TARGET ?auto_15475 ?auto_15476 ) ( POWER_AVAIL ?auto_15477 ) )
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
      ?auto_15566 - DIRECTION
      ?auto_15562 - INSTRUMENT
      ?auto_15567 - SATELLITE
      ?auto_15565 - DIRECTION
      ?auto_15564 - MODE
      ?auto_15563 - INSTRUMENT
      ?auto_15568 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_15560 ?auto_15566 ) ) ( ON_BOARD ?auto_15562 ?auto_15567 ) ( SUPPORTS ?auto_15562 ?auto_15561 ) ( not ( = ?auto_15560 ?auto_15565 ) ) ( not ( = ?auto_15566 ?auto_15565 ) ) ( not ( = ?auto_15564 ?auto_15561 ) ) ( CALIBRATION_TARGET ?auto_15562 ?auto_15565 ) ( ON_BOARD ?auto_15563 ?auto_15567 ) ( not ( = ?auto_15562 ?auto_15563 ) ) ( SUPPORTS ?auto_15563 ?auto_15564 ) ( CALIBRATION_TARGET ?auto_15563 ?auto_15565 ) ( POWER_AVAIL ?auto_15567 ) ( POINTING ?auto_15567 ?auto_15568 ) ( not ( = ?auto_15565 ?auto_15568 ) ) ( not ( = ?auto_15560 ?auto_15568 ) ) ( not ( = ?auto_15566 ?auto_15568 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_15567 ?auto_15565 ?auto_15568 )
      ( GET-2IMAGE ?auto_15566 ?auto_15564 ?auto_15560 ?auto_15561 )
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
      ?auto_15573 - INSTRUMENT
      ?auto_15574 - SATELLITE
      ?auto_15577 - DIRECTION
      ?auto_15575 - INSTRUMENT
      ?auto_15576 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_15572 ?auto_15569 ) ) ( ON_BOARD ?auto_15573 ?auto_15574 ) ( SUPPORTS ?auto_15573 ?auto_15571 ) ( not ( = ?auto_15572 ?auto_15577 ) ) ( not ( = ?auto_15569 ?auto_15577 ) ) ( not ( = ?auto_15570 ?auto_15571 ) ) ( CALIBRATION_TARGET ?auto_15573 ?auto_15577 ) ( ON_BOARD ?auto_15575 ?auto_15574 ) ( not ( = ?auto_15573 ?auto_15575 ) ) ( SUPPORTS ?auto_15575 ?auto_15570 ) ( CALIBRATION_TARGET ?auto_15575 ?auto_15577 ) ( POWER_AVAIL ?auto_15574 ) ( POINTING ?auto_15574 ?auto_15576 ) ( not ( = ?auto_15577 ?auto_15576 ) ) ( not ( = ?auto_15572 ?auto_15576 ) ) ( not ( = ?auto_15569 ?auto_15576 ) ) )
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
      ?auto_15585 - SATELLITE
      ?auto_15586 - DIRECTION
      ?auto_15583 - INSTRUMENT
      ?auto_15584 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_15581 ?auto_15578 ) ) ( ON_BOARD ?auto_15582 ?auto_15585 ) ( SUPPORTS ?auto_15582 ?auto_15579 ) ( not ( = ?auto_15578 ?auto_15586 ) ) ( not ( = ?auto_15581 ?auto_15586 ) ) ( not ( = ?auto_15580 ?auto_15579 ) ) ( CALIBRATION_TARGET ?auto_15582 ?auto_15586 ) ( ON_BOARD ?auto_15583 ?auto_15585 ) ( not ( = ?auto_15582 ?auto_15583 ) ) ( SUPPORTS ?auto_15583 ?auto_15580 ) ( CALIBRATION_TARGET ?auto_15583 ?auto_15586 ) ( POWER_AVAIL ?auto_15585 ) ( POINTING ?auto_15585 ?auto_15584 ) ( not ( = ?auto_15586 ?auto_15584 ) ) ( not ( = ?auto_15578 ?auto_15584 ) ) ( not ( = ?auto_15581 ?auto_15584 ) ) )
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
    ( and ( not ( = ?auto_15820 ?auto_15817 ) ) ( CALIBRATED ?auto_15821 ) ( ON_BOARD ?auto_15821 ?auto_15822 ) ( SUPPORTS ?auto_15821 ?auto_15819 ) ( POWER_ON ?auto_15821 ) ( POINTING ?auto_15822 ?auto_15820 ) ( HAVE_IMAGE ?auto_15817 ?auto_15818 ) ( not ( = ?auto_15818 ?auto_15819 ) ) )
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
    ( and ( not ( = ?auto_15826 ?auto_15823 ) ) ( CALIBRATED ?auto_15827 ) ( ON_BOARD ?auto_15827 ?auto_15828 ) ( SUPPORTS ?auto_15827 ?auto_15825 ) ( POWER_ON ?auto_15827 ) ( POINTING ?auto_15828 ?auto_15826 ) ( HAVE_IMAGE ?auto_15823 ?auto_15824 ) ( not ( = ?auto_15824 ?auto_15825 ) ) )
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
    ( and ( not ( = ?auto_15832 ?auto_15829 ) ) ( CALIBRATED ?auto_15833 ) ( ON_BOARD ?auto_15833 ?auto_15834 ) ( SUPPORTS ?auto_15833 ?auto_15830 ) ( POWER_ON ?auto_15833 ) ( POINTING ?auto_15834 ?auto_15829 ) ( HAVE_IMAGE ?auto_15832 ?auto_15831 ) ( not ( = ?auto_15830 ?auto_15831 ) ) )
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
    ( and ( not ( = ?auto_15838 ?auto_15835 ) ) ( CALIBRATED ?auto_15839 ) ( ON_BOARD ?auto_15839 ?auto_15840 ) ( SUPPORTS ?auto_15839 ?auto_15836 ) ( POWER_ON ?auto_15839 ) ( POINTING ?auto_15840 ?auto_15835 ) ( HAVE_IMAGE ?auto_15838 ?auto_15837 ) ( not ( = ?auto_15836 ?auto_15837 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15835 ?auto_15836 )
      ( GET-2IMAGE-VERIFY ?auto_15835 ?auto_15836 ?auto_15838 ?auto_15837 ) )
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
    ( and ( not ( = ?auto_15858 ?auto_15855 ) ) ( not ( = ?auto_15860 ?auto_15855 ) ) ( not ( = ?auto_15860 ?auto_15858 ) ) ( CALIBRATED ?auto_15861 ) ( ON_BOARD ?auto_15861 ?auto_15862 ) ( SUPPORTS ?auto_15861 ?auto_15859 ) ( POWER_ON ?auto_15861 ) ( POINTING ?auto_15862 ?auto_15860 ) ( HAVE_IMAGE ?auto_15855 ?auto_15856 ) ( HAVE_IMAGE ?auto_15858 ?auto_15857 ) ( not ( = ?auto_15856 ?auto_15857 ) ) ( not ( = ?auto_15856 ?auto_15859 ) ) ( not ( = ?auto_15857 ?auto_15859 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15860 ?auto_15859 )
      ( GET-3IMAGE-VERIFY ?auto_15855 ?auto_15856 ?auto_15858 ?auto_15857 ?auto_15860 ?auto_15859 ) )
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
    ( and ( not ( = ?auto_15874 ?auto_15871 ) ) ( not ( = ?auto_15876 ?auto_15871 ) ) ( not ( = ?auto_15876 ?auto_15874 ) ) ( CALIBRATED ?auto_15877 ) ( ON_BOARD ?auto_15877 ?auto_15878 ) ( SUPPORTS ?auto_15877 ?auto_15873 ) ( POWER_ON ?auto_15877 ) ( POINTING ?auto_15878 ?auto_15874 ) ( HAVE_IMAGE ?auto_15871 ?auto_15872 ) ( HAVE_IMAGE ?auto_15876 ?auto_15875 ) ( not ( = ?auto_15872 ?auto_15873 ) ) ( not ( = ?auto_15872 ?auto_15875 ) ) ( not ( = ?auto_15873 ?auto_15875 ) ) )
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
    ( and ( not ( = ?auto_15890 ?auto_15887 ) ) ( not ( = ?auto_15892 ?auto_15887 ) ) ( not ( = ?auto_15892 ?auto_15890 ) ) ( CALIBRATED ?auto_15893 ) ( ON_BOARD ?auto_15893 ?auto_15894 ) ( SUPPORTS ?auto_15893 ?auto_15891 ) ( POWER_ON ?auto_15893 ) ( POINTING ?auto_15894 ?auto_15892 ) ( HAVE_IMAGE ?auto_15887 ?auto_15888 ) ( HAVE_IMAGE ?auto_15890 ?auto_15889 ) ( not ( = ?auto_15888 ?auto_15889 ) ) ( not ( = ?auto_15888 ?auto_15891 ) ) ( not ( = ?auto_15889 ?auto_15891 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15892 ?auto_15891 )
      ( GET-3IMAGE-VERIFY ?auto_15887 ?auto_15888 ?auto_15890 ?auto_15889 ?auto_15892 ?auto_15891 ) )
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
    ( and ( not ( = ?auto_15906 ?auto_15903 ) ) ( not ( = ?auto_15908 ?auto_15903 ) ) ( not ( = ?auto_15908 ?auto_15906 ) ) ( CALIBRATED ?auto_15909 ) ( ON_BOARD ?auto_15909 ?auto_15910 ) ( SUPPORTS ?auto_15909 ?auto_15905 ) ( POWER_ON ?auto_15909 ) ( POINTING ?auto_15910 ?auto_15906 ) ( HAVE_IMAGE ?auto_15903 ?auto_15904 ) ( HAVE_IMAGE ?auto_15908 ?auto_15907 ) ( not ( = ?auto_15904 ?auto_15905 ) ) ( not ( = ?auto_15904 ?auto_15907 ) ) ( not ( = ?auto_15905 ?auto_15907 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15906 ?auto_15905 )
      ( GET-3IMAGE-VERIFY ?auto_15903 ?auto_15904 ?auto_15906 ?auto_15905 ?auto_15908 ?auto_15907 ) )
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
    ( and ( not ( = ?auto_15938 ?auto_15935 ) ) ( not ( = ?auto_15940 ?auto_15935 ) ) ( not ( = ?auto_15940 ?auto_15938 ) ) ( CALIBRATED ?auto_15941 ) ( ON_BOARD ?auto_15941 ?auto_15942 ) ( SUPPORTS ?auto_15941 ?auto_15936 ) ( POWER_ON ?auto_15941 ) ( POINTING ?auto_15942 ?auto_15935 ) ( HAVE_IMAGE ?auto_15938 ?auto_15937 ) ( HAVE_IMAGE ?auto_15940 ?auto_15939 ) ( not ( = ?auto_15936 ?auto_15937 ) ) ( not ( = ?auto_15936 ?auto_15939 ) ) ( not ( = ?auto_15937 ?auto_15939 ) ) )
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
    ( and ( not ( = ?auto_15954 ?auto_15951 ) ) ( not ( = ?auto_15956 ?auto_15951 ) ) ( not ( = ?auto_15956 ?auto_15954 ) ) ( CALIBRATED ?auto_15957 ) ( ON_BOARD ?auto_15957 ?auto_15958 ) ( SUPPORTS ?auto_15957 ?auto_15952 ) ( POWER_ON ?auto_15957 ) ( POINTING ?auto_15958 ?auto_15951 ) ( HAVE_IMAGE ?auto_15954 ?auto_15953 ) ( HAVE_IMAGE ?auto_15956 ?auto_15955 ) ( not ( = ?auto_15952 ?auto_15953 ) ) ( not ( = ?auto_15952 ?auto_15955 ) ) ( not ( = ?auto_15953 ?auto_15955 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_15951 ?auto_15952 )
      ( GET-3IMAGE-VERIFY ?auto_15951 ?auto_15952 ?auto_15954 ?auto_15953 ?auto_15956 ?auto_15955 ) )
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
      ?auto_16008 - INSTRUMENT
      ?auto_16010 - SATELLITE
      ?auto_16009 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16007 ?auto_16004 ) ) ( CALIBRATED ?auto_16008 ) ( ON_BOARD ?auto_16008 ?auto_16010 ) ( SUPPORTS ?auto_16008 ?auto_16006 ) ( POWER_ON ?auto_16008 ) ( POINTING ?auto_16010 ?auto_16009 ) ( not ( = ?auto_16007 ?auto_16009 ) ) ( HAVE_IMAGE ?auto_16004 ?auto_16005 ) ( not ( = ?auto_16004 ?auto_16009 ) ) ( not ( = ?auto_16005 ?auto_16006 ) ) )
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
      ?auto_16018 - DIRECTION
      ?auto_16016 - INSTRUMENT
      ?auto_16019 - SATELLITE
      ?auto_16015 - DIRECTION
      ?auto_16017 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_16014 ?auto_16011 ) ) ( not ( = ?auto_16014 ?auto_16018 ) ) ( CALIBRATED ?auto_16016 ) ( ON_BOARD ?auto_16016 ?auto_16019 ) ( SUPPORTS ?auto_16016 ?auto_16013 ) ( POWER_ON ?auto_16016 ) ( POINTING ?auto_16019 ?auto_16015 ) ( not ( = ?auto_16014 ?auto_16015 ) ) ( HAVE_IMAGE ?auto_16018 ?auto_16017 ) ( not ( = ?auto_16018 ?auto_16015 ) ) ( not ( = ?auto_16017 ?auto_16013 ) ) ( HAVE_IMAGE ?auto_16011 ?auto_16012 ) ( not ( = ?auto_16011 ?auto_16018 ) ) ( not ( = ?auto_16011 ?auto_16015 ) ) ( not ( = ?auto_16012 ?auto_16013 ) ) ( not ( = ?auto_16012 ?auto_16017 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16018 ?auto_16017 ?auto_16014 ?auto_16013 )
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
    ( and ( not ( = ?auto_16023 ?auto_16020 ) ) ( CALIBRATED ?auto_16025 ) ( ON_BOARD ?auto_16025 ?auto_16026 ) ( SUPPORTS ?auto_16025 ?auto_16021 ) ( POWER_ON ?auto_16025 ) ( POINTING ?auto_16026 ?auto_16024 ) ( not ( = ?auto_16020 ?auto_16024 ) ) ( HAVE_IMAGE ?auto_16023 ?auto_16022 ) ( not ( = ?auto_16023 ?auto_16024 ) ) ( not ( = ?auto_16022 ?auto_16021 ) ) )
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
      ?auto_16034 - DIRECTION
      ?auto_16032 - INSTRUMENT
      ?auto_16035 - SATELLITE
      ?auto_16031 - DIRECTION
      ?auto_16033 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_16030 ?auto_16027 ) ) ( not ( = ?auto_16027 ?auto_16034 ) ) ( CALIBRATED ?auto_16032 ) ( ON_BOARD ?auto_16032 ?auto_16035 ) ( SUPPORTS ?auto_16032 ?auto_16028 ) ( POWER_ON ?auto_16032 ) ( POINTING ?auto_16035 ?auto_16031 ) ( not ( = ?auto_16027 ?auto_16031 ) ) ( HAVE_IMAGE ?auto_16034 ?auto_16033 ) ( not ( = ?auto_16034 ?auto_16031 ) ) ( not ( = ?auto_16033 ?auto_16028 ) ) ( HAVE_IMAGE ?auto_16030 ?auto_16029 ) ( not ( = ?auto_16028 ?auto_16029 ) ) ( not ( = ?auto_16030 ?auto_16034 ) ) ( not ( = ?auto_16030 ?auto_16031 ) ) ( not ( = ?auto_16029 ?auto_16033 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16034 ?auto_16033 ?auto_16027 ?auto_16028 )
      ( GET-2IMAGE-VERIFY ?auto_16027 ?auto_16028 ?auto_16030 ?auto_16029 ) )
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
    ( and ( not ( = ?auto_16057 ?auto_16054 ) ) ( not ( = ?auto_16059 ?auto_16054 ) ) ( not ( = ?auto_16059 ?auto_16057 ) ) ( CALIBRATED ?auto_16061 ) ( ON_BOARD ?auto_16061 ?auto_16062 ) ( SUPPORTS ?auto_16061 ?auto_16058 ) ( POWER_ON ?auto_16061 ) ( POINTING ?auto_16062 ?auto_16060 ) ( not ( = ?auto_16059 ?auto_16060 ) ) ( HAVE_IMAGE ?auto_16054 ?auto_16055 ) ( not ( = ?auto_16054 ?auto_16060 ) ) ( not ( = ?auto_16055 ?auto_16058 ) ) ( HAVE_IMAGE ?auto_16057 ?auto_16056 ) ( not ( = ?auto_16055 ?auto_16056 ) ) ( not ( = ?auto_16057 ?auto_16060 ) ) ( not ( = ?auto_16056 ?auto_16058 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16054 ?auto_16055 ?auto_16059 ?auto_16058 )
      ( GET-3IMAGE-VERIFY ?auto_16054 ?auto_16055 ?auto_16057 ?auto_16056 ?auto_16059 ?auto_16058 ) )
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
    ( and ( not ( = ?auto_16075 ?auto_16072 ) ) ( not ( = ?auto_16077 ?auto_16072 ) ) ( not ( = ?auto_16077 ?auto_16075 ) ) ( CALIBRATED ?auto_16079 ) ( ON_BOARD ?auto_16079 ?auto_16080 ) ( SUPPORTS ?auto_16079 ?auto_16074 ) ( POWER_ON ?auto_16079 ) ( POINTING ?auto_16080 ?auto_16078 ) ( not ( = ?auto_16075 ?auto_16078 ) ) ( HAVE_IMAGE ?auto_16072 ?auto_16073 ) ( not ( = ?auto_16072 ?auto_16078 ) ) ( not ( = ?auto_16073 ?auto_16074 ) ) ( HAVE_IMAGE ?auto_16077 ?auto_16076 ) ( not ( = ?auto_16073 ?auto_16076 ) ) ( not ( = ?auto_16074 ?auto_16076 ) ) ( not ( = ?auto_16077 ?auto_16078 ) ) )
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
    ( and ( not ( = ?auto_16093 ?auto_16090 ) ) ( not ( = ?auto_16095 ?auto_16090 ) ) ( not ( = ?auto_16095 ?auto_16093 ) ) ( CALIBRATED ?auto_16097 ) ( ON_BOARD ?auto_16097 ?auto_16098 ) ( SUPPORTS ?auto_16097 ?auto_16094 ) ( POWER_ON ?auto_16097 ) ( POINTING ?auto_16098 ?auto_16096 ) ( not ( = ?auto_16095 ?auto_16096 ) ) ( HAVE_IMAGE ?auto_16093 ?auto_16092 ) ( not ( = ?auto_16093 ?auto_16096 ) ) ( not ( = ?auto_16092 ?auto_16094 ) ) ( HAVE_IMAGE ?auto_16090 ?auto_16091 ) ( not ( = ?auto_16090 ?auto_16096 ) ) ( not ( = ?auto_16091 ?auto_16092 ) ) ( not ( = ?auto_16091 ?auto_16094 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16093 ?auto_16092 ?auto_16095 ?auto_16094 )
      ( GET-3IMAGE-VERIFY ?auto_16090 ?auto_16091 ?auto_16093 ?auto_16092 ?auto_16095 ?auto_16094 ) )
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
    ( and ( not ( = ?auto_16113 ?auto_16110 ) ) ( not ( = ?auto_16115 ?auto_16110 ) ) ( not ( = ?auto_16115 ?auto_16113 ) ) ( CALIBRATED ?auto_16117 ) ( ON_BOARD ?auto_16117 ?auto_16118 ) ( SUPPORTS ?auto_16117 ?auto_16112 ) ( POWER_ON ?auto_16117 ) ( POINTING ?auto_16118 ?auto_16116 ) ( not ( = ?auto_16113 ?auto_16116 ) ) ( HAVE_IMAGE ?auto_16115 ?auto_16114 ) ( not ( = ?auto_16115 ?auto_16116 ) ) ( not ( = ?auto_16114 ?auto_16112 ) ) ( HAVE_IMAGE ?auto_16110 ?auto_16111 ) ( not ( = ?auto_16110 ?auto_16116 ) ) ( not ( = ?auto_16111 ?auto_16112 ) ) ( not ( = ?auto_16111 ?auto_16114 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16115 ?auto_16114 ?auto_16113 ?auto_16112 )
      ( GET-3IMAGE-VERIFY ?auto_16110 ?auto_16111 ?auto_16113 ?auto_16112 ?auto_16115 ?auto_16114 ) )
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
    ( and ( not ( = ?auto_16153 ?auto_16150 ) ) ( not ( = ?auto_16155 ?auto_16150 ) ) ( not ( = ?auto_16155 ?auto_16153 ) ) ( CALIBRATED ?auto_16157 ) ( ON_BOARD ?auto_16157 ?auto_16158 ) ( SUPPORTS ?auto_16157 ?auto_16151 ) ( POWER_ON ?auto_16157 ) ( POINTING ?auto_16158 ?auto_16156 ) ( not ( = ?auto_16150 ?auto_16156 ) ) ( HAVE_IMAGE ?auto_16153 ?auto_16152 ) ( not ( = ?auto_16153 ?auto_16156 ) ) ( not ( = ?auto_16152 ?auto_16151 ) ) ( HAVE_IMAGE ?auto_16155 ?auto_16154 ) ( not ( = ?auto_16151 ?auto_16154 ) ) ( not ( = ?auto_16152 ?auto_16154 ) ) ( not ( = ?auto_16155 ?auto_16156 ) ) )
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
    ( and ( not ( = ?auto_16171 ?auto_16168 ) ) ( not ( = ?auto_16173 ?auto_16168 ) ) ( not ( = ?auto_16173 ?auto_16171 ) ) ( CALIBRATED ?auto_16175 ) ( ON_BOARD ?auto_16175 ?auto_16176 ) ( SUPPORTS ?auto_16175 ?auto_16169 ) ( POWER_ON ?auto_16175 ) ( POINTING ?auto_16176 ?auto_16174 ) ( not ( = ?auto_16168 ?auto_16174 ) ) ( HAVE_IMAGE ?auto_16173 ?auto_16172 ) ( not ( = ?auto_16173 ?auto_16174 ) ) ( not ( = ?auto_16172 ?auto_16169 ) ) ( HAVE_IMAGE ?auto_16171 ?auto_16170 ) ( not ( = ?auto_16169 ?auto_16170 ) ) ( not ( = ?auto_16171 ?auto_16174 ) ) ( not ( = ?auto_16170 ?auto_16172 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16173 ?auto_16172 ?auto_16168 ?auto_16169 )
      ( GET-3IMAGE-VERIFY ?auto_16168 ?auto_16169 ?auto_16171 ?auto_16170 ?auto_16173 ?auto_16172 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_16230 - DIRECTION
      ?auto_16231 - MODE
    )
    :vars
    (
      ?auto_16235 - DIRECTION
      ?auto_16233 - INSTRUMENT
      ?auto_16236 - SATELLITE
      ?auto_16232 - DIRECTION
      ?auto_16234 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_16230 ?auto_16235 ) ) ( ON_BOARD ?auto_16233 ?auto_16236 ) ( SUPPORTS ?auto_16233 ?auto_16231 ) ( POWER_ON ?auto_16233 ) ( POINTING ?auto_16236 ?auto_16232 ) ( not ( = ?auto_16230 ?auto_16232 ) ) ( HAVE_IMAGE ?auto_16235 ?auto_16234 ) ( not ( = ?auto_16235 ?auto_16232 ) ) ( not ( = ?auto_16234 ?auto_16231 ) ) ( CALIBRATION_TARGET ?auto_16233 ?auto_16232 ) ( NOT_CALIBRATED ?auto_16233 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_16236 ?auto_16233 ?auto_16232 )
      ( GET-2IMAGE ?auto_16235 ?auto_16234 ?auto_16230 ?auto_16231 )
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
      ?auto_16241 - INSTRUMENT
      ?auto_16242 - SATELLITE
      ?auto_16243 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16240 ?auto_16237 ) ) ( ON_BOARD ?auto_16241 ?auto_16242 ) ( SUPPORTS ?auto_16241 ?auto_16239 ) ( POWER_ON ?auto_16241 ) ( POINTING ?auto_16242 ?auto_16243 ) ( not ( = ?auto_16240 ?auto_16243 ) ) ( HAVE_IMAGE ?auto_16237 ?auto_16238 ) ( not ( = ?auto_16237 ?auto_16243 ) ) ( not ( = ?auto_16238 ?auto_16239 ) ) ( CALIBRATION_TARGET ?auto_16241 ?auto_16243 ) ( NOT_CALIBRATED ?auto_16241 ) )
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
      ?auto_16251 - DIRECTION
      ?auto_16252 - INSTRUMENT
      ?auto_16248 - SATELLITE
      ?auto_16249 - DIRECTION
      ?auto_16250 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_16247 ?auto_16244 ) ) ( not ( = ?auto_16247 ?auto_16251 ) ) ( ON_BOARD ?auto_16252 ?auto_16248 ) ( SUPPORTS ?auto_16252 ?auto_16246 ) ( POWER_ON ?auto_16252 ) ( POINTING ?auto_16248 ?auto_16249 ) ( not ( = ?auto_16247 ?auto_16249 ) ) ( HAVE_IMAGE ?auto_16251 ?auto_16250 ) ( not ( = ?auto_16251 ?auto_16249 ) ) ( not ( = ?auto_16250 ?auto_16246 ) ) ( CALIBRATION_TARGET ?auto_16252 ?auto_16249 ) ( NOT_CALIBRATED ?auto_16252 ) ( HAVE_IMAGE ?auto_16244 ?auto_16245 ) ( not ( = ?auto_16244 ?auto_16251 ) ) ( not ( = ?auto_16244 ?auto_16249 ) ) ( not ( = ?auto_16245 ?auto_16246 ) ) ( not ( = ?auto_16245 ?auto_16250 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16251 ?auto_16250 ?auto_16247 ?auto_16246 )
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
      ?auto_16257 - SATELLITE
      ?auto_16258 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16256 ?auto_16253 ) ) ( ON_BOARD ?auto_16259 ?auto_16257 ) ( SUPPORTS ?auto_16259 ?auto_16254 ) ( POWER_ON ?auto_16259 ) ( POINTING ?auto_16257 ?auto_16258 ) ( not ( = ?auto_16253 ?auto_16258 ) ) ( HAVE_IMAGE ?auto_16256 ?auto_16255 ) ( not ( = ?auto_16256 ?auto_16258 ) ) ( not ( = ?auto_16255 ?auto_16254 ) ) ( CALIBRATION_TARGET ?auto_16259 ?auto_16258 ) ( NOT_CALIBRATED ?auto_16259 ) )
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
      ?auto_16267 - DIRECTION
      ?auto_16268 - INSTRUMENT
      ?auto_16264 - SATELLITE
      ?auto_16265 - DIRECTION
      ?auto_16266 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_16263 ?auto_16260 ) ) ( not ( = ?auto_16260 ?auto_16267 ) ) ( ON_BOARD ?auto_16268 ?auto_16264 ) ( SUPPORTS ?auto_16268 ?auto_16261 ) ( POWER_ON ?auto_16268 ) ( POINTING ?auto_16264 ?auto_16265 ) ( not ( = ?auto_16260 ?auto_16265 ) ) ( HAVE_IMAGE ?auto_16267 ?auto_16266 ) ( not ( = ?auto_16267 ?auto_16265 ) ) ( not ( = ?auto_16266 ?auto_16261 ) ) ( CALIBRATION_TARGET ?auto_16268 ?auto_16265 ) ( NOT_CALIBRATED ?auto_16268 ) ( HAVE_IMAGE ?auto_16263 ?auto_16262 ) ( not ( = ?auto_16261 ?auto_16262 ) ) ( not ( = ?auto_16263 ?auto_16267 ) ) ( not ( = ?auto_16263 ?auto_16265 ) ) ( not ( = ?auto_16262 ?auto_16266 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16267 ?auto_16266 ?auto_16260 ?auto_16261 )
      ( GET-2IMAGE-VERIFY ?auto_16260 ?auto_16261 ?auto_16263 ?auto_16262 ) )
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
      ?auto_16293 - SATELLITE
      ?auto_16294 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16290 ?auto_16287 ) ) ( not ( = ?auto_16292 ?auto_16287 ) ) ( not ( = ?auto_16292 ?auto_16290 ) ) ( ON_BOARD ?auto_16295 ?auto_16293 ) ( SUPPORTS ?auto_16295 ?auto_16291 ) ( POWER_ON ?auto_16295 ) ( POINTING ?auto_16293 ?auto_16294 ) ( not ( = ?auto_16292 ?auto_16294 ) ) ( HAVE_IMAGE ?auto_16287 ?auto_16288 ) ( not ( = ?auto_16287 ?auto_16294 ) ) ( not ( = ?auto_16288 ?auto_16291 ) ) ( CALIBRATION_TARGET ?auto_16295 ?auto_16294 ) ( NOT_CALIBRATED ?auto_16295 ) ( HAVE_IMAGE ?auto_16290 ?auto_16289 ) ( not ( = ?auto_16288 ?auto_16289 ) ) ( not ( = ?auto_16290 ?auto_16294 ) ) ( not ( = ?auto_16289 ?auto_16291 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16287 ?auto_16288 ?auto_16292 ?auto_16291 )
      ( GET-3IMAGE-VERIFY ?auto_16287 ?auto_16288 ?auto_16290 ?auto_16289 ?auto_16292 ?auto_16291 ) )
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
      ?auto_16311 - SATELLITE
      ?auto_16312 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16308 ?auto_16305 ) ) ( not ( = ?auto_16310 ?auto_16305 ) ) ( not ( = ?auto_16310 ?auto_16308 ) ) ( ON_BOARD ?auto_16313 ?auto_16311 ) ( SUPPORTS ?auto_16313 ?auto_16307 ) ( POWER_ON ?auto_16313 ) ( POINTING ?auto_16311 ?auto_16312 ) ( not ( = ?auto_16308 ?auto_16312 ) ) ( HAVE_IMAGE ?auto_16305 ?auto_16306 ) ( not ( = ?auto_16305 ?auto_16312 ) ) ( not ( = ?auto_16306 ?auto_16307 ) ) ( CALIBRATION_TARGET ?auto_16313 ?auto_16312 ) ( NOT_CALIBRATED ?auto_16313 ) ( HAVE_IMAGE ?auto_16310 ?auto_16309 ) ( not ( = ?auto_16306 ?auto_16309 ) ) ( not ( = ?auto_16307 ?auto_16309 ) ) ( not ( = ?auto_16310 ?auto_16312 ) ) )
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
      ?auto_16329 - SATELLITE
      ?auto_16330 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16326 ?auto_16323 ) ) ( not ( = ?auto_16328 ?auto_16323 ) ) ( not ( = ?auto_16328 ?auto_16326 ) ) ( ON_BOARD ?auto_16331 ?auto_16329 ) ( SUPPORTS ?auto_16331 ?auto_16327 ) ( POWER_ON ?auto_16331 ) ( POINTING ?auto_16329 ?auto_16330 ) ( not ( = ?auto_16328 ?auto_16330 ) ) ( HAVE_IMAGE ?auto_16326 ?auto_16325 ) ( not ( = ?auto_16326 ?auto_16330 ) ) ( not ( = ?auto_16325 ?auto_16327 ) ) ( CALIBRATION_TARGET ?auto_16331 ?auto_16330 ) ( NOT_CALIBRATED ?auto_16331 ) ( HAVE_IMAGE ?auto_16323 ?auto_16324 ) ( not ( = ?auto_16323 ?auto_16330 ) ) ( not ( = ?auto_16324 ?auto_16325 ) ) ( not ( = ?auto_16324 ?auto_16327 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16326 ?auto_16325 ?auto_16328 ?auto_16327 )
      ( GET-3IMAGE-VERIFY ?auto_16323 ?auto_16324 ?auto_16326 ?auto_16325 ?auto_16328 ?auto_16327 ) )
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
      ?auto_16349 - SATELLITE
      ?auto_16350 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16346 ?auto_16343 ) ) ( not ( = ?auto_16348 ?auto_16343 ) ) ( not ( = ?auto_16348 ?auto_16346 ) ) ( ON_BOARD ?auto_16351 ?auto_16349 ) ( SUPPORTS ?auto_16351 ?auto_16345 ) ( POWER_ON ?auto_16351 ) ( POINTING ?auto_16349 ?auto_16350 ) ( not ( = ?auto_16346 ?auto_16350 ) ) ( HAVE_IMAGE ?auto_16348 ?auto_16347 ) ( not ( = ?auto_16348 ?auto_16350 ) ) ( not ( = ?auto_16347 ?auto_16345 ) ) ( CALIBRATION_TARGET ?auto_16351 ?auto_16350 ) ( NOT_CALIBRATED ?auto_16351 ) ( HAVE_IMAGE ?auto_16343 ?auto_16344 ) ( not ( = ?auto_16343 ?auto_16350 ) ) ( not ( = ?auto_16344 ?auto_16345 ) ) ( not ( = ?auto_16344 ?auto_16347 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16348 ?auto_16347 ?auto_16346 ?auto_16345 )
      ( GET-3IMAGE-VERIFY ?auto_16343 ?auto_16344 ?auto_16346 ?auto_16345 ?auto_16348 ?auto_16347 ) )
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
      ?auto_16389 - SATELLITE
      ?auto_16390 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16386 ?auto_16383 ) ) ( not ( = ?auto_16388 ?auto_16383 ) ) ( not ( = ?auto_16388 ?auto_16386 ) ) ( ON_BOARD ?auto_16391 ?auto_16389 ) ( SUPPORTS ?auto_16391 ?auto_16384 ) ( POWER_ON ?auto_16391 ) ( POINTING ?auto_16389 ?auto_16390 ) ( not ( = ?auto_16383 ?auto_16390 ) ) ( HAVE_IMAGE ?auto_16386 ?auto_16385 ) ( not ( = ?auto_16386 ?auto_16390 ) ) ( not ( = ?auto_16385 ?auto_16384 ) ) ( CALIBRATION_TARGET ?auto_16391 ?auto_16390 ) ( NOT_CALIBRATED ?auto_16391 ) ( HAVE_IMAGE ?auto_16388 ?auto_16387 ) ( not ( = ?auto_16384 ?auto_16387 ) ) ( not ( = ?auto_16385 ?auto_16387 ) ) ( not ( = ?auto_16388 ?auto_16390 ) ) )
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
      ?auto_16407 - SATELLITE
      ?auto_16408 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16404 ?auto_16401 ) ) ( not ( = ?auto_16406 ?auto_16401 ) ) ( not ( = ?auto_16406 ?auto_16404 ) ) ( ON_BOARD ?auto_16409 ?auto_16407 ) ( SUPPORTS ?auto_16409 ?auto_16402 ) ( POWER_ON ?auto_16409 ) ( POINTING ?auto_16407 ?auto_16408 ) ( not ( = ?auto_16401 ?auto_16408 ) ) ( HAVE_IMAGE ?auto_16406 ?auto_16405 ) ( not ( = ?auto_16406 ?auto_16408 ) ) ( not ( = ?auto_16405 ?auto_16402 ) ) ( CALIBRATION_TARGET ?auto_16409 ?auto_16408 ) ( NOT_CALIBRATED ?auto_16409 ) ( HAVE_IMAGE ?auto_16404 ?auto_16403 ) ( not ( = ?auto_16402 ?auto_16403 ) ) ( not ( = ?auto_16404 ?auto_16408 ) ) ( not ( = ?auto_16403 ?auto_16405 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16406 ?auto_16405 ?auto_16401 ?auto_16402 )
      ( GET-3IMAGE-VERIFY ?auto_16401 ?auto_16402 ?auto_16404 ?auto_16403 ?auto_16406 ?auto_16405 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_16463 - DIRECTION
      ?auto_16464 - MODE
    )
    :vars
    (
      ?auto_16468 - DIRECTION
      ?auto_16469 - INSTRUMENT
      ?auto_16465 - SATELLITE
      ?auto_16466 - DIRECTION
      ?auto_16467 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_16463 ?auto_16468 ) ) ( ON_BOARD ?auto_16469 ?auto_16465 ) ( SUPPORTS ?auto_16469 ?auto_16464 ) ( POINTING ?auto_16465 ?auto_16466 ) ( not ( = ?auto_16463 ?auto_16466 ) ) ( HAVE_IMAGE ?auto_16468 ?auto_16467 ) ( not ( = ?auto_16468 ?auto_16466 ) ) ( not ( = ?auto_16467 ?auto_16464 ) ) ( CALIBRATION_TARGET ?auto_16469 ?auto_16466 ) ( POWER_AVAIL ?auto_16465 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_16469 ?auto_16465 )
      ( GET-2IMAGE ?auto_16468 ?auto_16467 ?auto_16463 ?auto_16464 )
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
      ?auto_16475 - INSTRUMENT
      ?auto_16474 - SATELLITE
      ?auto_16476 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16473 ?auto_16470 ) ) ( ON_BOARD ?auto_16475 ?auto_16474 ) ( SUPPORTS ?auto_16475 ?auto_16472 ) ( POINTING ?auto_16474 ?auto_16476 ) ( not ( = ?auto_16473 ?auto_16476 ) ) ( HAVE_IMAGE ?auto_16470 ?auto_16471 ) ( not ( = ?auto_16470 ?auto_16476 ) ) ( not ( = ?auto_16471 ?auto_16472 ) ) ( CALIBRATION_TARGET ?auto_16475 ?auto_16476 ) ( POWER_AVAIL ?auto_16474 ) )
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
      ?auto_16484 - DIRECTION
      ?auto_16481 - INSTRUMENT
      ?auto_16485 - SATELLITE
      ?auto_16482 - DIRECTION
      ?auto_16483 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_16480 ?auto_16477 ) ) ( not ( = ?auto_16480 ?auto_16484 ) ) ( ON_BOARD ?auto_16481 ?auto_16485 ) ( SUPPORTS ?auto_16481 ?auto_16479 ) ( POINTING ?auto_16485 ?auto_16482 ) ( not ( = ?auto_16480 ?auto_16482 ) ) ( HAVE_IMAGE ?auto_16484 ?auto_16483 ) ( not ( = ?auto_16484 ?auto_16482 ) ) ( not ( = ?auto_16483 ?auto_16479 ) ) ( CALIBRATION_TARGET ?auto_16481 ?auto_16482 ) ( POWER_AVAIL ?auto_16485 ) ( HAVE_IMAGE ?auto_16477 ?auto_16478 ) ( not ( = ?auto_16477 ?auto_16484 ) ) ( not ( = ?auto_16477 ?auto_16482 ) ) ( not ( = ?auto_16478 ?auto_16479 ) ) ( not ( = ?auto_16478 ?auto_16483 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16484 ?auto_16483 ?auto_16480 ?auto_16479 )
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
      ?auto_16490 - INSTRUMENT
      ?auto_16492 - SATELLITE
      ?auto_16491 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16489 ?auto_16486 ) ) ( ON_BOARD ?auto_16490 ?auto_16492 ) ( SUPPORTS ?auto_16490 ?auto_16487 ) ( POINTING ?auto_16492 ?auto_16491 ) ( not ( = ?auto_16486 ?auto_16491 ) ) ( HAVE_IMAGE ?auto_16489 ?auto_16488 ) ( not ( = ?auto_16489 ?auto_16491 ) ) ( not ( = ?auto_16488 ?auto_16487 ) ) ( CALIBRATION_TARGET ?auto_16490 ?auto_16491 ) ( POWER_AVAIL ?auto_16492 ) )
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
      ?auto_16500 - DIRECTION
      ?auto_16497 - INSTRUMENT
      ?auto_16501 - SATELLITE
      ?auto_16498 - DIRECTION
      ?auto_16499 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_16496 ?auto_16493 ) ) ( not ( = ?auto_16493 ?auto_16500 ) ) ( ON_BOARD ?auto_16497 ?auto_16501 ) ( SUPPORTS ?auto_16497 ?auto_16494 ) ( POINTING ?auto_16501 ?auto_16498 ) ( not ( = ?auto_16493 ?auto_16498 ) ) ( HAVE_IMAGE ?auto_16500 ?auto_16499 ) ( not ( = ?auto_16500 ?auto_16498 ) ) ( not ( = ?auto_16499 ?auto_16494 ) ) ( CALIBRATION_TARGET ?auto_16497 ?auto_16498 ) ( POWER_AVAIL ?auto_16501 ) ( HAVE_IMAGE ?auto_16496 ?auto_16495 ) ( not ( = ?auto_16494 ?auto_16495 ) ) ( not ( = ?auto_16496 ?auto_16500 ) ) ( not ( = ?auto_16496 ?auto_16498 ) ) ( not ( = ?auto_16495 ?auto_16499 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16500 ?auto_16499 ?auto_16493 ?auto_16494 )
      ( GET-2IMAGE-VERIFY ?auto_16493 ?auto_16494 ?auto_16496 ?auto_16495 ) )
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
      ?auto_16526 - INSTRUMENT
      ?auto_16528 - SATELLITE
      ?auto_16527 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16523 ?auto_16520 ) ) ( not ( = ?auto_16525 ?auto_16520 ) ) ( not ( = ?auto_16525 ?auto_16523 ) ) ( ON_BOARD ?auto_16526 ?auto_16528 ) ( SUPPORTS ?auto_16526 ?auto_16524 ) ( POINTING ?auto_16528 ?auto_16527 ) ( not ( = ?auto_16525 ?auto_16527 ) ) ( HAVE_IMAGE ?auto_16520 ?auto_16521 ) ( not ( = ?auto_16520 ?auto_16527 ) ) ( not ( = ?auto_16521 ?auto_16524 ) ) ( CALIBRATION_TARGET ?auto_16526 ?auto_16527 ) ( POWER_AVAIL ?auto_16528 ) ( HAVE_IMAGE ?auto_16523 ?auto_16522 ) ( not ( = ?auto_16521 ?auto_16522 ) ) ( not ( = ?auto_16523 ?auto_16527 ) ) ( not ( = ?auto_16522 ?auto_16524 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16520 ?auto_16521 ?auto_16525 ?auto_16524 )
      ( GET-3IMAGE-VERIFY ?auto_16520 ?auto_16521 ?auto_16523 ?auto_16522 ?auto_16525 ?auto_16524 ) )
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
      ?auto_16544 - INSTRUMENT
      ?auto_16546 - SATELLITE
      ?auto_16545 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16541 ?auto_16538 ) ) ( not ( = ?auto_16543 ?auto_16538 ) ) ( not ( = ?auto_16543 ?auto_16541 ) ) ( ON_BOARD ?auto_16544 ?auto_16546 ) ( SUPPORTS ?auto_16544 ?auto_16540 ) ( POINTING ?auto_16546 ?auto_16545 ) ( not ( = ?auto_16541 ?auto_16545 ) ) ( HAVE_IMAGE ?auto_16538 ?auto_16539 ) ( not ( = ?auto_16538 ?auto_16545 ) ) ( not ( = ?auto_16539 ?auto_16540 ) ) ( CALIBRATION_TARGET ?auto_16544 ?auto_16545 ) ( POWER_AVAIL ?auto_16546 ) ( HAVE_IMAGE ?auto_16543 ?auto_16542 ) ( not ( = ?auto_16539 ?auto_16542 ) ) ( not ( = ?auto_16540 ?auto_16542 ) ) ( not ( = ?auto_16543 ?auto_16545 ) ) )
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
      ?auto_16562 - INSTRUMENT
      ?auto_16564 - SATELLITE
      ?auto_16563 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16559 ?auto_16556 ) ) ( not ( = ?auto_16561 ?auto_16556 ) ) ( not ( = ?auto_16561 ?auto_16559 ) ) ( ON_BOARD ?auto_16562 ?auto_16564 ) ( SUPPORTS ?auto_16562 ?auto_16560 ) ( POINTING ?auto_16564 ?auto_16563 ) ( not ( = ?auto_16561 ?auto_16563 ) ) ( HAVE_IMAGE ?auto_16559 ?auto_16558 ) ( not ( = ?auto_16559 ?auto_16563 ) ) ( not ( = ?auto_16558 ?auto_16560 ) ) ( CALIBRATION_TARGET ?auto_16562 ?auto_16563 ) ( POWER_AVAIL ?auto_16564 ) ( HAVE_IMAGE ?auto_16556 ?auto_16557 ) ( not ( = ?auto_16556 ?auto_16563 ) ) ( not ( = ?auto_16557 ?auto_16558 ) ) ( not ( = ?auto_16557 ?auto_16560 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16559 ?auto_16558 ?auto_16561 ?auto_16560 )
      ( GET-3IMAGE-VERIFY ?auto_16556 ?auto_16557 ?auto_16559 ?auto_16558 ?auto_16561 ?auto_16560 ) )
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
      ?auto_16582 - INSTRUMENT
      ?auto_16584 - SATELLITE
      ?auto_16583 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16579 ?auto_16576 ) ) ( not ( = ?auto_16581 ?auto_16576 ) ) ( not ( = ?auto_16581 ?auto_16579 ) ) ( ON_BOARD ?auto_16582 ?auto_16584 ) ( SUPPORTS ?auto_16582 ?auto_16578 ) ( POINTING ?auto_16584 ?auto_16583 ) ( not ( = ?auto_16579 ?auto_16583 ) ) ( HAVE_IMAGE ?auto_16581 ?auto_16580 ) ( not ( = ?auto_16581 ?auto_16583 ) ) ( not ( = ?auto_16580 ?auto_16578 ) ) ( CALIBRATION_TARGET ?auto_16582 ?auto_16583 ) ( POWER_AVAIL ?auto_16584 ) ( HAVE_IMAGE ?auto_16576 ?auto_16577 ) ( not ( = ?auto_16576 ?auto_16583 ) ) ( not ( = ?auto_16577 ?auto_16578 ) ) ( not ( = ?auto_16577 ?auto_16580 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16581 ?auto_16580 ?auto_16579 ?auto_16578 )
      ( GET-3IMAGE-VERIFY ?auto_16576 ?auto_16577 ?auto_16579 ?auto_16578 ?auto_16581 ?auto_16580 ) )
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
      ?auto_16622 - INSTRUMENT
      ?auto_16624 - SATELLITE
      ?auto_16623 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16619 ?auto_16616 ) ) ( not ( = ?auto_16621 ?auto_16616 ) ) ( not ( = ?auto_16621 ?auto_16619 ) ) ( ON_BOARD ?auto_16622 ?auto_16624 ) ( SUPPORTS ?auto_16622 ?auto_16617 ) ( POINTING ?auto_16624 ?auto_16623 ) ( not ( = ?auto_16616 ?auto_16623 ) ) ( HAVE_IMAGE ?auto_16619 ?auto_16618 ) ( not ( = ?auto_16619 ?auto_16623 ) ) ( not ( = ?auto_16618 ?auto_16617 ) ) ( CALIBRATION_TARGET ?auto_16622 ?auto_16623 ) ( POWER_AVAIL ?auto_16624 ) ( HAVE_IMAGE ?auto_16621 ?auto_16620 ) ( not ( = ?auto_16617 ?auto_16620 ) ) ( not ( = ?auto_16618 ?auto_16620 ) ) ( not ( = ?auto_16621 ?auto_16623 ) ) )
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
      ?auto_16640 - INSTRUMENT
      ?auto_16642 - SATELLITE
      ?auto_16641 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16637 ?auto_16634 ) ) ( not ( = ?auto_16639 ?auto_16634 ) ) ( not ( = ?auto_16639 ?auto_16637 ) ) ( ON_BOARD ?auto_16640 ?auto_16642 ) ( SUPPORTS ?auto_16640 ?auto_16635 ) ( POINTING ?auto_16642 ?auto_16641 ) ( not ( = ?auto_16634 ?auto_16641 ) ) ( HAVE_IMAGE ?auto_16639 ?auto_16638 ) ( not ( = ?auto_16639 ?auto_16641 ) ) ( not ( = ?auto_16638 ?auto_16635 ) ) ( CALIBRATION_TARGET ?auto_16640 ?auto_16641 ) ( POWER_AVAIL ?auto_16642 ) ( HAVE_IMAGE ?auto_16637 ?auto_16636 ) ( not ( = ?auto_16635 ?auto_16636 ) ) ( not ( = ?auto_16637 ?auto_16641 ) ) ( not ( = ?auto_16636 ?auto_16638 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16639 ?auto_16638 ?auto_16634 ?auto_16635 )
      ( GET-3IMAGE-VERIFY ?auto_16634 ?auto_16635 ?auto_16637 ?auto_16636 ?auto_16639 ?auto_16638 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_16696 - DIRECTION
      ?auto_16697 - MODE
    )
    :vars
    (
      ?auto_16701 - DIRECTION
      ?auto_16698 - INSTRUMENT
      ?auto_16702 - SATELLITE
      ?auto_16699 - DIRECTION
      ?auto_16700 - MODE
      ?auto_16703 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16696 ?auto_16701 ) ) ( ON_BOARD ?auto_16698 ?auto_16702 ) ( SUPPORTS ?auto_16698 ?auto_16697 ) ( not ( = ?auto_16696 ?auto_16699 ) ) ( HAVE_IMAGE ?auto_16701 ?auto_16700 ) ( not ( = ?auto_16701 ?auto_16699 ) ) ( not ( = ?auto_16700 ?auto_16697 ) ) ( CALIBRATION_TARGET ?auto_16698 ?auto_16699 ) ( POWER_AVAIL ?auto_16702 ) ( POINTING ?auto_16702 ?auto_16703 ) ( not ( = ?auto_16699 ?auto_16703 ) ) ( not ( = ?auto_16696 ?auto_16703 ) ) ( not ( = ?auto_16701 ?auto_16703 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_16702 ?auto_16699 ?auto_16703 )
      ( GET-2IMAGE ?auto_16701 ?auto_16700 ?auto_16696 ?auto_16697 )
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
      ?auto_16709 - SATELLITE
      ?auto_16711 - DIRECTION
      ?auto_16710 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16707 ?auto_16704 ) ) ( ON_BOARD ?auto_16708 ?auto_16709 ) ( SUPPORTS ?auto_16708 ?auto_16706 ) ( not ( = ?auto_16707 ?auto_16711 ) ) ( HAVE_IMAGE ?auto_16704 ?auto_16705 ) ( not ( = ?auto_16704 ?auto_16711 ) ) ( not ( = ?auto_16705 ?auto_16706 ) ) ( CALIBRATION_TARGET ?auto_16708 ?auto_16711 ) ( POWER_AVAIL ?auto_16709 ) ( POINTING ?auto_16709 ?auto_16710 ) ( not ( = ?auto_16711 ?auto_16710 ) ) ( not ( = ?auto_16707 ?auto_16710 ) ) ( not ( = ?auto_16704 ?auto_16710 ) ) )
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
      ?auto_16719 - DIRECTION
      ?auto_16716 - INSTRUMENT
      ?auto_16720 - SATELLITE
      ?auto_16717 - DIRECTION
      ?auto_16718 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_16715 ?auto_16712 ) ) ( not ( = ?auto_16715 ?auto_16719 ) ) ( ON_BOARD ?auto_16716 ?auto_16720 ) ( SUPPORTS ?auto_16716 ?auto_16714 ) ( not ( = ?auto_16715 ?auto_16717 ) ) ( HAVE_IMAGE ?auto_16719 ?auto_16718 ) ( not ( = ?auto_16719 ?auto_16717 ) ) ( not ( = ?auto_16718 ?auto_16714 ) ) ( CALIBRATION_TARGET ?auto_16716 ?auto_16717 ) ( POWER_AVAIL ?auto_16720 ) ( POINTING ?auto_16720 ?auto_16712 ) ( not ( = ?auto_16717 ?auto_16712 ) ) ( not ( = ?auto_16719 ?auto_16712 ) ) ( HAVE_IMAGE ?auto_16712 ?auto_16713 ) ( not ( = ?auto_16713 ?auto_16714 ) ) ( not ( = ?auto_16713 ?auto_16718 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16719 ?auto_16718 ?auto_16715 ?auto_16714 )
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
      ?auto_16725 - INSTRUMENT
      ?auto_16728 - SATELLITE
      ?auto_16726 - DIRECTION
      ?auto_16727 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16724 ?auto_16721 ) ) ( ON_BOARD ?auto_16725 ?auto_16728 ) ( SUPPORTS ?auto_16725 ?auto_16722 ) ( not ( = ?auto_16721 ?auto_16726 ) ) ( HAVE_IMAGE ?auto_16724 ?auto_16723 ) ( not ( = ?auto_16724 ?auto_16726 ) ) ( not ( = ?auto_16723 ?auto_16722 ) ) ( CALIBRATION_TARGET ?auto_16725 ?auto_16726 ) ( POWER_AVAIL ?auto_16728 ) ( POINTING ?auto_16728 ?auto_16727 ) ( not ( = ?auto_16726 ?auto_16727 ) ) ( not ( = ?auto_16721 ?auto_16727 ) ) ( not ( = ?auto_16724 ?auto_16727 ) ) )
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
      ?auto_16736 - DIRECTION
      ?auto_16733 - INSTRUMENT
      ?auto_16737 - SATELLITE
      ?auto_16734 - DIRECTION
      ?auto_16735 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_16732 ?auto_16729 ) ) ( not ( = ?auto_16729 ?auto_16736 ) ) ( ON_BOARD ?auto_16733 ?auto_16737 ) ( SUPPORTS ?auto_16733 ?auto_16730 ) ( not ( = ?auto_16729 ?auto_16734 ) ) ( HAVE_IMAGE ?auto_16736 ?auto_16735 ) ( not ( = ?auto_16736 ?auto_16734 ) ) ( not ( = ?auto_16735 ?auto_16730 ) ) ( CALIBRATION_TARGET ?auto_16733 ?auto_16734 ) ( POWER_AVAIL ?auto_16737 ) ( POINTING ?auto_16737 ?auto_16732 ) ( not ( = ?auto_16734 ?auto_16732 ) ) ( not ( = ?auto_16736 ?auto_16732 ) ) ( HAVE_IMAGE ?auto_16732 ?auto_16731 ) ( not ( = ?auto_16730 ?auto_16731 ) ) ( not ( = ?auto_16731 ?auto_16735 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16736 ?auto_16735 ?auto_16729 ?auto_16730 )
      ( GET-2IMAGE-VERIFY ?auto_16729 ?auto_16730 ?auto_16732 ?auto_16731 ) )
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
      ?auto_16764 - INSTRUMENT
      ?auto_16766 - SATELLITE
      ?auto_16765 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16761 ?auto_16758 ) ) ( not ( = ?auto_16763 ?auto_16758 ) ) ( not ( = ?auto_16763 ?auto_16761 ) ) ( ON_BOARD ?auto_16764 ?auto_16766 ) ( SUPPORTS ?auto_16764 ?auto_16762 ) ( not ( = ?auto_16763 ?auto_16765 ) ) ( HAVE_IMAGE ?auto_16758 ?auto_16759 ) ( not ( = ?auto_16758 ?auto_16765 ) ) ( not ( = ?auto_16759 ?auto_16762 ) ) ( CALIBRATION_TARGET ?auto_16764 ?auto_16765 ) ( POWER_AVAIL ?auto_16766 ) ( POINTING ?auto_16766 ?auto_16761 ) ( not ( = ?auto_16765 ?auto_16761 ) ) ( HAVE_IMAGE ?auto_16761 ?auto_16760 ) ( not ( = ?auto_16759 ?auto_16760 ) ) ( not ( = ?auto_16760 ?auto_16762 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16758 ?auto_16759 ?auto_16763 ?auto_16762 )
      ( GET-3IMAGE-VERIFY ?auto_16758 ?auto_16759 ?auto_16761 ?auto_16760 ?auto_16763 ?auto_16762 ) )
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
      ?auto_16783 - INSTRUMENT
      ?auto_16785 - SATELLITE
      ?auto_16784 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16780 ?auto_16777 ) ) ( not ( = ?auto_16782 ?auto_16777 ) ) ( not ( = ?auto_16782 ?auto_16780 ) ) ( ON_BOARD ?auto_16783 ?auto_16785 ) ( SUPPORTS ?auto_16783 ?auto_16779 ) ( not ( = ?auto_16780 ?auto_16784 ) ) ( HAVE_IMAGE ?auto_16777 ?auto_16778 ) ( not ( = ?auto_16777 ?auto_16784 ) ) ( not ( = ?auto_16778 ?auto_16779 ) ) ( CALIBRATION_TARGET ?auto_16783 ?auto_16784 ) ( POWER_AVAIL ?auto_16785 ) ( POINTING ?auto_16785 ?auto_16782 ) ( not ( = ?auto_16784 ?auto_16782 ) ) ( HAVE_IMAGE ?auto_16782 ?auto_16781 ) ( not ( = ?auto_16778 ?auto_16781 ) ) ( not ( = ?auto_16779 ?auto_16781 ) ) )
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
      ?auto_16802 - INSTRUMENT
      ?auto_16804 - SATELLITE
      ?auto_16803 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16799 ?auto_16796 ) ) ( not ( = ?auto_16801 ?auto_16796 ) ) ( not ( = ?auto_16801 ?auto_16799 ) ) ( ON_BOARD ?auto_16802 ?auto_16804 ) ( SUPPORTS ?auto_16802 ?auto_16800 ) ( not ( = ?auto_16801 ?auto_16803 ) ) ( HAVE_IMAGE ?auto_16799 ?auto_16798 ) ( not ( = ?auto_16799 ?auto_16803 ) ) ( not ( = ?auto_16798 ?auto_16800 ) ) ( CALIBRATION_TARGET ?auto_16802 ?auto_16803 ) ( POWER_AVAIL ?auto_16804 ) ( POINTING ?auto_16804 ?auto_16796 ) ( not ( = ?auto_16803 ?auto_16796 ) ) ( HAVE_IMAGE ?auto_16796 ?auto_16797 ) ( not ( = ?auto_16797 ?auto_16798 ) ) ( not ( = ?auto_16797 ?auto_16800 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16799 ?auto_16798 ?auto_16801 ?auto_16800 )
      ( GET-3IMAGE-VERIFY ?auto_16796 ?auto_16797 ?auto_16799 ?auto_16798 ?auto_16801 ?auto_16800 ) )
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
      ?auto_16822 - INSTRUMENT
      ?auto_16824 - SATELLITE
      ?auto_16823 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16819 ?auto_16816 ) ) ( not ( = ?auto_16821 ?auto_16816 ) ) ( not ( = ?auto_16821 ?auto_16819 ) ) ( ON_BOARD ?auto_16822 ?auto_16824 ) ( SUPPORTS ?auto_16822 ?auto_16818 ) ( not ( = ?auto_16819 ?auto_16823 ) ) ( HAVE_IMAGE ?auto_16821 ?auto_16820 ) ( not ( = ?auto_16821 ?auto_16823 ) ) ( not ( = ?auto_16820 ?auto_16818 ) ) ( CALIBRATION_TARGET ?auto_16822 ?auto_16823 ) ( POWER_AVAIL ?auto_16824 ) ( POINTING ?auto_16824 ?auto_16816 ) ( not ( = ?auto_16823 ?auto_16816 ) ) ( HAVE_IMAGE ?auto_16816 ?auto_16817 ) ( not ( = ?auto_16817 ?auto_16818 ) ) ( not ( = ?auto_16817 ?auto_16820 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16821 ?auto_16820 ?auto_16819 ?auto_16818 )
      ( GET-3IMAGE-VERIFY ?auto_16816 ?auto_16817 ?auto_16819 ?auto_16818 ?auto_16821 ?auto_16820 ) )
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
      ?auto_16863 - INSTRUMENT
      ?auto_16865 - SATELLITE
      ?auto_16864 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16860 ?auto_16857 ) ) ( not ( = ?auto_16862 ?auto_16857 ) ) ( not ( = ?auto_16862 ?auto_16860 ) ) ( ON_BOARD ?auto_16863 ?auto_16865 ) ( SUPPORTS ?auto_16863 ?auto_16858 ) ( not ( = ?auto_16857 ?auto_16864 ) ) ( HAVE_IMAGE ?auto_16860 ?auto_16859 ) ( not ( = ?auto_16860 ?auto_16864 ) ) ( not ( = ?auto_16859 ?auto_16858 ) ) ( CALIBRATION_TARGET ?auto_16863 ?auto_16864 ) ( POWER_AVAIL ?auto_16865 ) ( POINTING ?auto_16865 ?auto_16862 ) ( not ( = ?auto_16864 ?auto_16862 ) ) ( HAVE_IMAGE ?auto_16862 ?auto_16861 ) ( not ( = ?auto_16858 ?auto_16861 ) ) ( not ( = ?auto_16859 ?auto_16861 ) ) )
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
      ?auto_16882 - INSTRUMENT
      ?auto_16884 - SATELLITE
      ?auto_16883 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_16879 ?auto_16876 ) ) ( not ( = ?auto_16881 ?auto_16876 ) ) ( not ( = ?auto_16881 ?auto_16879 ) ) ( ON_BOARD ?auto_16882 ?auto_16884 ) ( SUPPORTS ?auto_16882 ?auto_16877 ) ( not ( = ?auto_16876 ?auto_16883 ) ) ( HAVE_IMAGE ?auto_16881 ?auto_16880 ) ( not ( = ?auto_16881 ?auto_16883 ) ) ( not ( = ?auto_16880 ?auto_16877 ) ) ( CALIBRATION_TARGET ?auto_16882 ?auto_16883 ) ( POWER_AVAIL ?auto_16884 ) ( POINTING ?auto_16884 ?auto_16879 ) ( not ( = ?auto_16883 ?auto_16879 ) ) ( HAVE_IMAGE ?auto_16879 ?auto_16878 ) ( not ( = ?auto_16877 ?auto_16878 ) ) ( not ( = ?auto_16878 ?auto_16880 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16881 ?auto_16880 ?auto_16876 ?auto_16877 )
      ( GET-3IMAGE-VERIFY ?auto_16876 ?auto_16877 ?auto_16879 ?auto_16878 ?auto_16881 ?auto_16880 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_16940 - DIRECTION
      ?auto_16941 - MODE
    )
    :vars
    (
      ?auto_16945 - DIRECTION
      ?auto_16942 - INSTRUMENT
      ?auto_16947 - SATELLITE
      ?auto_16943 - DIRECTION
      ?auto_16944 - MODE
      ?auto_16946 - DIRECTION
      ?auto_16948 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_16940 ?auto_16945 ) ) ( ON_BOARD ?auto_16942 ?auto_16947 ) ( SUPPORTS ?auto_16942 ?auto_16941 ) ( not ( = ?auto_16940 ?auto_16943 ) ) ( HAVE_IMAGE ?auto_16945 ?auto_16944 ) ( not ( = ?auto_16945 ?auto_16943 ) ) ( not ( = ?auto_16944 ?auto_16941 ) ) ( CALIBRATION_TARGET ?auto_16942 ?auto_16943 ) ( POINTING ?auto_16947 ?auto_16946 ) ( not ( = ?auto_16943 ?auto_16946 ) ) ( not ( = ?auto_16940 ?auto_16946 ) ) ( not ( = ?auto_16945 ?auto_16946 ) ) ( ON_BOARD ?auto_16948 ?auto_16947 ) ( POWER_ON ?auto_16948 ) ( not ( = ?auto_16942 ?auto_16948 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_16948 ?auto_16947 )
      ( GET-2IMAGE ?auto_16945 ?auto_16944 ?auto_16940 ?auto_16941 )
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
      ?auto_16953 - SATELLITE
      ?auto_16957 - DIRECTION
      ?auto_16954 - DIRECTION
      ?auto_16955 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_16952 ?auto_16949 ) ) ( ON_BOARD ?auto_16956 ?auto_16953 ) ( SUPPORTS ?auto_16956 ?auto_16951 ) ( not ( = ?auto_16952 ?auto_16957 ) ) ( HAVE_IMAGE ?auto_16949 ?auto_16950 ) ( not ( = ?auto_16949 ?auto_16957 ) ) ( not ( = ?auto_16950 ?auto_16951 ) ) ( CALIBRATION_TARGET ?auto_16956 ?auto_16957 ) ( POINTING ?auto_16953 ?auto_16954 ) ( not ( = ?auto_16957 ?auto_16954 ) ) ( not ( = ?auto_16952 ?auto_16954 ) ) ( not ( = ?auto_16949 ?auto_16954 ) ) ( ON_BOARD ?auto_16955 ?auto_16953 ) ( POWER_ON ?auto_16955 ) ( not ( = ?auto_16956 ?auto_16955 ) ) )
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
      ?auto_16963 - DIRECTION
      ?auto_16966 - INSTRUMENT
      ?auto_16967 - SATELLITE
      ?auto_16965 - DIRECTION
      ?auto_16962 - MODE
      ?auto_16964 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_16961 ?auto_16958 ) ) ( not ( = ?auto_16961 ?auto_16963 ) ) ( ON_BOARD ?auto_16966 ?auto_16967 ) ( SUPPORTS ?auto_16966 ?auto_16960 ) ( not ( = ?auto_16961 ?auto_16965 ) ) ( HAVE_IMAGE ?auto_16963 ?auto_16962 ) ( not ( = ?auto_16963 ?auto_16965 ) ) ( not ( = ?auto_16962 ?auto_16960 ) ) ( CALIBRATION_TARGET ?auto_16966 ?auto_16965 ) ( POINTING ?auto_16967 ?auto_16958 ) ( not ( = ?auto_16965 ?auto_16958 ) ) ( not ( = ?auto_16963 ?auto_16958 ) ) ( ON_BOARD ?auto_16964 ?auto_16967 ) ( POWER_ON ?auto_16964 ) ( not ( = ?auto_16966 ?auto_16964 ) ) ( HAVE_IMAGE ?auto_16958 ?auto_16959 ) ( not ( = ?auto_16959 ?auto_16960 ) ) ( not ( = ?auto_16959 ?auto_16962 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16963 ?auto_16962 ?auto_16961 ?auto_16960 )
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
      ?auto_16974 - INSTRUMENT
      ?auto_16976 - SATELLITE
      ?auto_16973 - DIRECTION
      ?auto_16975 - DIRECTION
      ?auto_16972 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_16971 ?auto_16968 ) ) ( ON_BOARD ?auto_16974 ?auto_16976 ) ( SUPPORTS ?auto_16974 ?auto_16969 ) ( not ( = ?auto_16968 ?auto_16973 ) ) ( HAVE_IMAGE ?auto_16971 ?auto_16970 ) ( not ( = ?auto_16971 ?auto_16973 ) ) ( not ( = ?auto_16970 ?auto_16969 ) ) ( CALIBRATION_TARGET ?auto_16974 ?auto_16973 ) ( POINTING ?auto_16976 ?auto_16975 ) ( not ( = ?auto_16973 ?auto_16975 ) ) ( not ( = ?auto_16968 ?auto_16975 ) ) ( not ( = ?auto_16971 ?auto_16975 ) ) ( ON_BOARD ?auto_16972 ?auto_16976 ) ( POWER_ON ?auto_16972 ) ( not ( = ?auto_16974 ?auto_16972 ) ) )
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
      ?auto_16982 - DIRECTION
      ?auto_16985 - INSTRUMENT
      ?auto_16986 - SATELLITE
      ?auto_16984 - DIRECTION
      ?auto_16981 - MODE
      ?auto_16983 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_16980 ?auto_16977 ) ) ( not ( = ?auto_16977 ?auto_16982 ) ) ( ON_BOARD ?auto_16985 ?auto_16986 ) ( SUPPORTS ?auto_16985 ?auto_16978 ) ( not ( = ?auto_16977 ?auto_16984 ) ) ( HAVE_IMAGE ?auto_16982 ?auto_16981 ) ( not ( = ?auto_16982 ?auto_16984 ) ) ( not ( = ?auto_16981 ?auto_16978 ) ) ( CALIBRATION_TARGET ?auto_16985 ?auto_16984 ) ( POINTING ?auto_16986 ?auto_16980 ) ( not ( = ?auto_16984 ?auto_16980 ) ) ( not ( = ?auto_16982 ?auto_16980 ) ) ( ON_BOARD ?auto_16983 ?auto_16986 ) ( POWER_ON ?auto_16983 ) ( not ( = ?auto_16985 ?auto_16983 ) ) ( HAVE_IMAGE ?auto_16980 ?auto_16979 ) ( not ( = ?auto_16978 ?auto_16979 ) ) ( not ( = ?auto_16979 ?auto_16981 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_16982 ?auto_16981 ?auto_16977 ?auto_16978 )
      ( GET-2IMAGE-VERIFY ?auto_16977 ?auto_16978 ?auto_16980 ?auto_16979 ) )
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
      ?auto_17017 - INSTRUMENT
      ?auto_17018 - SATELLITE
      ?auto_17016 - DIRECTION
      ?auto_17015 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17012 ?auto_17009 ) ) ( not ( = ?auto_17014 ?auto_17009 ) ) ( not ( = ?auto_17014 ?auto_17012 ) ) ( ON_BOARD ?auto_17017 ?auto_17018 ) ( SUPPORTS ?auto_17017 ?auto_17013 ) ( not ( = ?auto_17014 ?auto_17016 ) ) ( HAVE_IMAGE ?auto_17009 ?auto_17010 ) ( not ( = ?auto_17009 ?auto_17016 ) ) ( not ( = ?auto_17010 ?auto_17013 ) ) ( CALIBRATION_TARGET ?auto_17017 ?auto_17016 ) ( POINTING ?auto_17018 ?auto_17012 ) ( not ( = ?auto_17016 ?auto_17012 ) ) ( ON_BOARD ?auto_17015 ?auto_17018 ) ( POWER_ON ?auto_17015 ) ( not ( = ?auto_17017 ?auto_17015 ) ) ( HAVE_IMAGE ?auto_17012 ?auto_17011 ) ( not ( = ?auto_17010 ?auto_17011 ) ) ( not ( = ?auto_17011 ?auto_17013 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17009 ?auto_17010 ?auto_17014 ?auto_17013 )
      ( GET-3IMAGE-VERIFY ?auto_17009 ?auto_17010 ?auto_17012 ?auto_17011 ?auto_17014 ?auto_17013 ) )
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
      ?auto_17038 - INSTRUMENT
      ?auto_17039 - SATELLITE
      ?auto_17037 - DIRECTION
      ?auto_17036 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17033 ?auto_17030 ) ) ( not ( = ?auto_17035 ?auto_17030 ) ) ( not ( = ?auto_17035 ?auto_17033 ) ) ( ON_BOARD ?auto_17038 ?auto_17039 ) ( SUPPORTS ?auto_17038 ?auto_17032 ) ( not ( = ?auto_17033 ?auto_17037 ) ) ( HAVE_IMAGE ?auto_17030 ?auto_17031 ) ( not ( = ?auto_17030 ?auto_17037 ) ) ( not ( = ?auto_17031 ?auto_17032 ) ) ( CALIBRATION_TARGET ?auto_17038 ?auto_17037 ) ( POINTING ?auto_17039 ?auto_17035 ) ( not ( = ?auto_17037 ?auto_17035 ) ) ( ON_BOARD ?auto_17036 ?auto_17039 ) ( POWER_ON ?auto_17036 ) ( not ( = ?auto_17038 ?auto_17036 ) ) ( HAVE_IMAGE ?auto_17035 ?auto_17034 ) ( not ( = ?auto_17031 ?auto_17034 ) ) ( not ( = ?auto_17032 ?auto_17034 ) ) )
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
      ?auto_17059 - INSTRUMENT
      ?auto_17060 - SATELLITE
      ?auto_17058 - DIRECTION
      ?auto_17057 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17054 ?auto_17051 ) ) ( not ( = ?auto_17056 ?auto_17051 ) ) ( not ( = ?auto_17056 ?auto_17054 ) ) ( ON_BOARD ?auto_17059 ?auto_17060 ) ( SUPPORTS ?auto_17059 ?auto_17055 ) ( not ( = ?auto_17056 ?auto_17058 ) ) ( HAVE_IMAGE ?auto_17054 ?auto_17053 ) ( not ( = ?auto_17054 ?auto_17058 ) ) ( not ( = ?auto_17053 ?auto_17055 ) ) ( CALIBRATION_TARGET ?auto_17059 ?auto_17058 ) ( POINTING ?auto_17060 ?auto_17051 ) ( not ( = ?auto_17058 ?auto_17051 ) ) ( ON_BOARD ?auto_17057 ?auto_17060 ) ( POWER_ON ?auto_17057 ) ( not ( = ?auto_17059 ?auto_17057 ) ) ( HAVE_IMAGE ?auto_17051 ?auto_17052 ) ( not ( = ?auto_17052 ?auto_17053 ) ) ( not ( = ?auto_17052 ?auto_17055 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17054 ?auto_17053 ?auto_17056 ?auto_17055 )
      ( GET-3IMAGE-VERIFY ?auto_17051 ?auto_17052 ?auto_17054 ?auto_17053 ?auto_17056 ?auto_17055 ) )
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
      ?auto_17081 - INSTRUMENT
      ?auto_17082 - SATELLITE
      ?auto_17080 - DIRECTION
      ?auto_17079 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17076 ?auto_17073 ) ) ( not ( = ?auto_17078 ?auto_17073 ) ) ( not ( = ?auto_17078 ?auto_17076 ) ) ( ON_BOARD ?auto_17081 ?auto_17082 ) ( SUPPORTS ?auto_17081 ?auto_17075 ) ( not ( = ?auto_17076 ?auto_17080 ) ) ( HAVE_IMAGE ?auto_17078 ?auto_17077 ) ( not ( = ?auto_17078 ?auto_17080 ) ) ( not ( = ?auto_17077 ?auto_17075 ) ) ( CALIBRATION_TARGET ?auto_17081 ?auto_17080 ) ( POINTING ?auto_17082 ?auto_17073 ) ( not ( = ?auto_17080 ?auto_17073 ) ) ( ON_BOARD ?auto_17079 ?auto_17082 ) ( POWER_ON ?auto_17079 ) ( not ( = ?auto_17081 ?auto_17079 ) ) ( HAVE_IMAGE ?auto_17073 ?auto_17074 ) ( not ( = ?auto_17074 ?auto_17075 ) ) ( not ( = ?auto_17074 ?auto_17077 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17078 ?auto_17077 ?auto_17076 ?auto_17075 )
      ( GET-3IMAGE-VERIFY ?auto_17073 ?auto_17074 ?auto_17076 ?auto_17075 ?auto_17078 ?auto_17077 ) )
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
      ?auto_17126 - INSTRUMENT
      ?auto_17127 - SATELLITE
      ?auto_17125 - DIRECTION
      ?auto_17124 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17121 ?auto_17118 ) ) ( not ( = ?auto_17123 ?auto_17118 ) ) ( not ( = ?auto_17123 ?auto_17121 ) ) ( ON_BOARD ?auto_17126 ?auto_17127 ) ( SUPPORTS ?auto_17126 ?auto_17119 ) ( not ( = ?auto_17118 ?auto_17125 ) ) ( HAVE_IMAGE ?auto_17121 ?auto_17120 ) ( not ( = ?auto_17121 ?auto_17125 ) ) ( not ( = ?auto_17120 ?auto_17119 ) ) ( CALIBRATION_TARGET ?auto_17126 ?auto_17125 ) ( POINTING ?auto_17127 ?auto_17123 ) ( not ( = ?auto_17125 ?auto_17123 ) ) ( ON_BOARD ?auto_17124 ?auto_17127 ) ( POWER_ON ?auto_17124 ) ( not ( = ?auto_17126 ?auto_17124 ) ) ( HAVE_IMAGE ?auto_17123 ?auto_17122 ) ( not ( = ?auto_17119 ?auto_17122 ) ) ( not ( = ?auto_17120 ?auto_17122 ) ) )
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
      ?auto_17147 - INSTRUMENT
      ?auto_17148 - SATELLITE
      ?auto_17146 - DIRECTION
      ?auto_17145 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17142 ?auto_17139 ) ) ( not ( = ?auto_17144 ?auto_17139 ) ) ( not ( = ?auto_17144 ?auto_17142 ) ) ( ON_BOARD ?auto_17147 ?auto_17148 ) ( SUPPORTS ?auto_17147 ?auto_17140 ) ( not ( = ?auto_17139 ?auto_17146 ) ) ( HAVE_IMAGE ?auto_17144 ?auto_17143 ) ( not ( = ?auto_17144 ?auto_17146 ) ) ( not ( = ?auto_17143 ?auto_17140 ) ) ( CALIBRATION_TARGET ?auto_17147 ?auto_17146 ) ( POINTING ?auto_17148 ?auto_17142 ) ( not ( = ?auto_17146 ?auto_17142 ) ) ( ON_BOARD ?auto_17145 ?auto_17148 ) ( POWER_ON ?auto_17145 ) ( not ( = ?auto_17147 ?auto_17145 ) ) ( HAVE_IMAGE ?auto_17142 ?auto_17141 ) ( not ( = ?auto_17140 ?auto_17141 ) ) ( not ( = ?auto_17141 ?auto_17143 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17144 ?auto_17143 ?auto_17139 ?auto_17140 )
      ( GET-3IMAGE-VERIFY ?auto_17139 ?auto_17140 ?auto_17142 ?auto_17141 ?auto_17144 ?auto_17143 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_17209 - DIRECTION
      ?auto_17210 - MODE
    )
    :vars
    (
      ?auto_17212 - DIRECTION
      ?auto_17215 - INSTRUMENT
      ?auto_17217 - SATELLITE
      ?auto_17214 - DIRECTION
      ?auto_17211 - MODE
      ?auto_17216 - DIRECTION
      ?auto_17213 - INSTRUMENT
      ?auto_17218 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_17209 ?auto_17212 ) ) ( ON_BOARD ?auto_17215 ?auto_17217 ) ( SUPPORTS ?auto_17215 ?auto_17210 ) ( not ( = ?auto_17209 ?auto_17214 ) ) ( HAVE_IMAGE ?auto_17212 ?auto_17211 ) ( not ( = ?auto_17212 ?auto_17214 ) ) ( not ( = ?auto_17211 ?auto_17210 ) ) ( CALIBRATION_TARGET ?auto_17215 ?auto_17214 ) ( POINTING ?auto_17217 ?auto_17216 ) ( not ( = ?auto_17214 ?auto_17216 ) ) ( not ( = ?auto_17209 ?auto_17216 ) ) ( not ( = ?auto_17212 ?auto_17216 ) ) ( ON_BOARD ?auto_17213 ?auto_17217 ) ( POWER_ON ?auto_17213 ) ( not ( = ?auto_17215 ?auto_17213 ) ) ( CALIBRATED ?auto_17213 ) ( SUPPORTS ?auto_17213 ?auto_17218 ) ( not ( = ?auto_17211 ?auto_17218 ) ) ( not ( = ?auto_17210 ?auto_17218 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17212 ?auto_17211 ?auto_17216 ?auto_17218 )
      ( GET-2IMAGE ?auto_17212 ?auto_17211 ?auto_17209 ?auto_17210 )
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
      ?auto_17225 - SATELLITE
      ?auto_17228 - DIRECTION
      ?auto_17226 - DIRECTION
      ?auto_17227 - INSTRUMENT
      ?auto_17223 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_17222 ?auto_17219 ) ) ( ON_BOARD ?auto_17224 ?auto_17225 ) ( SUPPORTS ?auto_17224 ?auto_17221 ) ( not ( = ?auto_17222 ?auto_17228 ) ) ( HAVE_IMAGE ?auto_17219 ?auto_17220 ) ( not ( = ?auto_17219 ?auto_17228 ) ) ( not ( = ?auto_17220 ?auto_17221 ) ) ( CALIBRATION_TARGET ?auto_17224 ?auto_17228 ) ( POINTING ?auto_17225 ?auto_17226 ) ( not ( = ?auto_17228 ?auto_17226 ) ) ( not ( = ?auto_17222 ?auto_17226 ) ) ( not ( = ?auto_17219 ?auto_17226 ) ) ( ON_BOARD ?auto_17227 ?auto_17225 ) ( POWER_ON ?auto_17227 ) ( not ( = ?auto_17224 ?auto_17227 ) ) ( CALIBRATED ?auto_17227 ) ( SUPPORTS ?auto_17227 ?auto_17223 ) ( not ( = ?auto_17220 ?auto_17223 ) ) ( not ( = ?auto_17221 ?auto_17223 ) ) )
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
      ?auto_17237 - DIRECTION
      ?auto_17233 - INSTRUMENT
      ?auto_17235 - SATELLITE
      ?auto_17238 - DIRECTION
      ?auto_17236 - MODE
      ?auto_17234 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17232 ?auto_17229 ) ) ( not ( = ?auto_17232 ?auto_17237 ) ) ( ON_BOARD ?auto_17233 ?auto_17235 ) ( SUPPORTS ?auto_17233 ?auto_17231 ) ( not ( = ?auto_17232 ?auto_17238 ) ) ( HAVE_IMAGE ?auto_17237 ?auto_17236 ) ( not ( = ?auto_17237 ?auto_17238 ) ) ( not ( = ?auto_17236 ?auto_17231 ) ) ( CALIBRATION_TARGET ?auto_17233 ?auto_17238 ) ( POINTING ?auto_17235 ?auto_17229 ) ( not ( = ?auto_17238 ?auto_17229 ) ) ( not ( = ?auto_17237 ?auto_17229 ) ) ( ON_BOARD ?auto_17234 ?auto_17235 ) ( POWER_ON ?auto_17234 ) ( not ( = ?auto_17233 ?auto_17234 ) ) ( CALIBRATED ?auto_17234 ) ( SUPPORTS ?auto_17234 ?auto_17230 ) ( not ( = ?auto_17236 ?auto_17230 ) ) ( not ( = ?auto_17231 ?auto_17230 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17237 ?auto_17236 ?auto_17232 ?auto_17231 )
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
      ?auto_17245 - INSTRUMENT
      ?auto_17247 - SATELLITE
      ?auto_17248 - DIRECTION
      ?auto_17243 - DIRECTION
      ?auto_17246 - INSTRUMENT
      ?auto_17244 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_17242 ?auto_17239 ) ) ( ON_BOARD ?auto_17245 ?auto_17247 ) ( SUPPORTS ?auto_17245 ?auto_17240 ) ( not ( = ?auto_17239 ?auto_17248 ) ) ( HAVE_IMAGE ?auto_17242 ?auto_17241 ) ( not ( = ?auto_17242 ?auto_17248 ) ) ( not ( = ?auto_17241 ?auto_17240 ) ) ( CALIBRATION_TARGET ?auto_17245 ?auto_17248 ) ( POINTING ?auto_17247 ?auto_17243 ) ( not ( = ?auto_17248 ?auto_17243 ) ) ( not ( = ?auto_17239 ?auto_17243 ) ) ( not ( = ?auto_17242 ?auto_17243 ) ) ( ON_BOARD ?auto_17246 ?auto_17247 ) ( POWER_ON ?auto_17246 ) ( not ( = ?auto_17245 ?auto_17246 ) ) ( CALIBRATED ?auto_17246 ) ( SUPPORTS ?auto_17246 ?auto_17244 ) ( not ( = ?auto_17241 ?auto_17244 ) ) ( not ( = ?auto_17240 ?auto_17244 ) ) )
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
      ?auto_17257 - DIRECTION
      ?auto_17253 - INSTRUMENT
      ?auto_17255 - SATELLITE
      ?auto_17258 - DIRECTION
      ?auto_17256 - MODE
      ?auto_17254 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17252 ?auto_17249 ) ) ( not ( = ?auto_17249 ?auto_17257 ) ) ( ON_BOARD ?auto_17253 ?auto_17255 ) ( SUPPORTS ?auto_17253 ?auto_17250 ) ( not ( = ?auto_17249 ?auto_17258 ) ) ( HAVE_IMAGE ?auto_17257 ?auto_17256 ) ( not ( = ?auto_17257 ?auto_17258 ) ) ( not ( = ?auto_17256 ?auto_17250 ) ) ( CALIBRATION_TARGET ?auto_17253 ?auto_17258 ) ( POINTING ?auto_17255 ?auto_17252 ) ( not ( = ?auto_17258 ?auto_17252 ) ) ( not ( = ?auto_17257 ?auto_17252 ) ) ( ON_BOARD ?auto_17254 ?auto_17255 ) ( POWER_ON ?auto_17254 ) ( not ( = ?auto_17253 ?auto_17254 ) ) ( CALIBRATED ?auto_17254 ) ( SUPPORTS ?auto_17254 ?auto_17251 ) ( not ( = ?auto_17256 ?auto_17251 ) ) ( not ( = ?auto_17250 ?auto_17251 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17257 ?auto_17256 ?auto_17249 ?auto_17250 )
      ( GET-2IMAGE-VERIFY ?auto_17249 ?auto_17250 ?auto_17252 ?auto_17251 ) )
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
      ?auto_17289 - INSTRUMENT
      ?auto_17291 - SATELLITE
      ?auto_17292 - DIRECTION
      ?auto_17290 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17286 ?auto_17283 ) ) ( not ( = ?auto_17288 ?auto_17283 ) ) ( not ( = ?auto_17288 ?auto_17286 ) ) ( ON_BOARD ?auto_17289 ?auto_17291 ) ( SUPPORTS ?auto_17289 ?auto_17287 ) ( not ( = ?auto_17288 ?auto_17292 ) ) ( HAVE_IMAGE ?auto_17283 ?auto_17284 ) ( not ( = ?auto_17283 ?auto_17292 ) ) ( not ( = ?auto_17284 ?auto_17287 ) ) ( CALIBRATION_TARGET ?auto_17289 ?auto_17292 ) ( POINTING ?auto_17291 ?auto_17286 ) ( not ( = ?auto_17292 ?auto_17286 ) ) ( ON_BOARD ?auto_17290 ?auto_17291 ) ( POWER_ON ?auto_17290 ) ( not ( = ?auto_17289 ?auto_17290 ) ) ( CALIBRATED ?auto_17290 ) ( SUPPORTS ?auto_17290 ?auto_17285 ) ( not ( = ?auto_17284 ?auto_17285 ) ) ( not ( = ?auto_17287 ?auto_17285 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17283 ?auto_17284 ?auto_17288 ?auto_17287 )
      ( GET-3IMAGE-VERIFY ?auto_17283 ?auto_17284 ?auto_17286 ?auto_17285 ?auto_17288 ?auto_17287 ) )
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
      ?auto_17311 - INSTRUMENT
      ?auto_17313 - SATELLITE
      ?auto_17314 - DIRECTION
      ?auto_17312 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17308 ?auto_17305 ) ) ( not ( = ?auto_17310 ?auto_17305 ) ) ( not ( = ?auto_17310 ?auto_17308 ) ) ( ON_BOARD ?auto_17311 ?auto_17313 ) ( SUPPORTS ?auto_17311 ?auto_17307 ) ( not ( = ?auto_17308 ?auto_17314 ) ) ( HAVE_IMAGE ?auto_17305 ?auto_17306 ) ( not ( = ?auto_17305 ?auto_17314 ) ) ( not ( = ?auto_17306 ?auto_17307 ) ) ( CALIBRATION_TARGET ?auto_17311 ?auto_17314 ) ( POINTING ?auto_17313 ?auto_17310 ) ( not ( = ?auto_17314 ?auto_17310 ) ) ( ON_BOARD ?auto_17312 ?auto_17313 ) ( POWER_ON ?auto_17312 ) ( not ( = ?auto_17311 ?auto_17312 ) ) ( CALIBRATED ?auto_17312 ) ( SUPPORTS ?auto_17312 ?auto_17309 ) ( not ( = ?auto_17306 ?auto_17309 ) ) ( not ( = ?auto_17307 ?auto_17309 ) ) )
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
      ?auto_17333 - INSTRUMENT
      ?auto_17335 - SATELLITE
      ?auto_17336 - DIRECTION
      ?auto_17334 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17330 ?auto_17327 ) ) ( not ( = ?auto_17332 ?auto_17327 ) ) ( not ( = ?auto_17332 ?auto_17330 ) ) ( ON_BOARD ?auto_17333 ?auto_17335 ) ( SUPPORTS ?auto_17333 ?auto_17331 ) ( not ( = ?auto_17332 ?auto_17336 ) ) ( HAVE_IMAGE ?auto_17330 ?auto_17329 ) ( not ( = ?auto_17330 ?auto_17336 ) ) ( not ( = ?auto_17329 ?auto_17331 ) ) ( CALIBRATION_TARGET ?auto_17333 ?auto_17336 ) ( POINTING ?auto_17335 ?auto_17327 ) ( not ( = ?auto_17336 ?auto_17327 ) ) ( ON_BOARD ?auto_17334 ?auto_17335 ) ( POWER_ON ?auto_17334 ) ( not ( = ?auto_17333 ?auto_17334 ) ) ( CALIBRATED ?auto_17334 ) ( SUPPORTS ?auto_17334 ?auto_17328 ) ( not ( = ?auto_17329 ?auto_17328 ) ) ( not ( = ?auto_17331 ?auto_17328 ) ) )
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
      ?auto_17355 - INSTRUMENT
      ?auto_17357 - SATELLITE
      ?auto_17358 - DIRECTION
      ?auto_17356 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17352 ?auto_17349 ) ) ( not ( = ?auto_17354 ?auto_17349 ) ) ( not ( = ?auto_17354 ?auto_17352 ) ) ( ON_BOARD ?auto_17355 ?auto_17357 ) ( SUPPORTS ?auto_17355 ?auto_17351 ) ( not ( = ?auto_17352 ?auto_17358 ) ) ( HAVE_IMAGE ?auto_17354 ?auto_17353 ) ( not ( = ?auto_17354 ?auto_17358 ) ) ( not ( = ?auto_17353 ?auto_17351 ) ) ( CALIBRATION_TARGET ?auto_17355 ?auto_17358 ) ( POINTING ?auto_17357 ?auto_17349 ) ( not ( = ?auto_17358 ?auto_17349 ) ) ( ON_BOARD ?auto_17356 ?auto_17357 ) ( POWER_ON ?auto_17356 ) ( not ( = ?auto_17355 ?auto_17356 ) ) ( CALIBRATED ?auto_17356 ) ( SUPPORTS ?auto_17356 ?auto_17350 ) ( not ( = ?auto_17353 ?auto_17350 ) ) ( not ( = ?auto_17351 ?auto_17350 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17354 ?auto_17353 ?auto_17352 ?auto_17351 )
      ( GET-3IMAGE-VERIFY ?auto_17349 ?auto_17350 ?auto_17352 ?auto_17351 ?auto_17354 ?auto_17353 ) )
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
      ?auto_17401 - INSTRUMENT
      ?auto_17403 - SATELLITE
      ?auto_17404 - DIRECTION
      ?auto_17402 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17398 ?auto_17395 ) ) ( not ( = ?auto_17400 ?auto_17395 ) ) ( not ( = ?auto_17400 ?auto_17398 ) ) ( ON_BOARD ?auto_17401 ?auto_17403 ) ( SUPPORTS ?auto_17401 ?auto_17396 ) ( not ( = ?auto_17395 ?auto_17404 ) ) ( HAVE_IMAGE ?auto_17398 ?auto_17397 ) ( not ( = ?auto_17398 ?auto_17404 ) ) ( not ( = ?auto_17397 ?auto_17396 ) ) ( CALIBRATION_TARGET ?auto_17401 ?auto_17404 ) ( POINTING ?auto_17403 ?auto_17400 ) ( not ( = ?auto_17404 ?auto_17400 ) ) ( ON_BOARD ?auto_17402 ?auto_17403 ) ( POWER_ON ?auto_17402 ) ( not ( = ?auto_17401 ?auto_17402 ) ) ( CALIBRATED ?auto_17402 ) ( SUPPORTS ?auto_17402 ?auto_17399 ) ( not ( = ?auto_17397 ?auto_17399 ) ) ( not ( = ?auto_17396 ?auto_17399 ) ) )
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
      ?auto_17423 - INSTRUMENT
      ?auto_17425 - SATELLITE
      ?auto_17426 - DIRECTION
      ?auto_17424 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17420 ?auto_17417 ) ) ( not ( = ?auto_17422 ?auto_17417 ) ) ( not ( = ?auto_17422 ?auto_17420 ) ) ( ON_BOARD ?auto_17423 ?auto_17425 ) ( SUPPORTS ?auto_17423 ?auto_17418 ) ( not ( = ?auto_17417 ?auto_17426 ) ) ( HAVE_IMAGE ?auto_17422 ?auto_17421 ) ( not ( = ?auto_17422 ?auto_17426 ) ) ( not ( = ?auto_17421 ?auto_17418 ) ) ( CALIBRATION_TARGET ?auto_17423 ?auto_17426 ) ( POINTING ?auto_17425 ?auto_17420 ) ( not ( = ?auto_17426 ?auto_17420 ) ) ( ON_BOARD ?auto_17424 ?auto_17425 ) ( POWER_ON ?auto_17424 ) ( not ( = ?auto_17423 ?auto_17424 ) ) ( CALIBRATED ?auto_17424 ) ( SUPPORTS ?auto_17424 ?auto_17419 ) ( not ( = ?auto_17421 ?auto_17419 ) ) ( not ( = ?auto_17418 ?auto_17419 ) ) )
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
      ?auto_17497 - DIRECTION
      ?auto_17493 - INSTRUMENT
      ?auto_17495 - SATELLITE
      ?auto_17498 - DIRECTION
      ?auto_17496 - MODE
      ?auto_17491 - DIRECTION
      ?auto_17494 - INSTRUMENT
      ?auto_17492 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_17489 ?auto_17497 ) ) ( ON_BOARD ?auto_17493 ?auto_17495 ) ( SUPPORTS ?auto_17493 ?auto_17490 ) ( not ( = ?auto_17489 ?auto_17498 ) ) ( HAVE_IMAGE ?auto_17497 ?auto_17496 ) ( not ( = ?auto_17497 ?auto_17498 ) ) ( not ( = ?auto_17496 ?auto_17490 ) ) ( CALIBRATION_TARGET ?auto_17493 ?auto_17498 ) ( not ( = ?auto_17498 ?auto_17491 ) ) ( not ( = ?auto_17489 ?auto_17491 ) ) ( not ( = ?auto_17497 ?auto_17491 ) ) ( ON_BOARD ?auto_17494 ?auto_17495 ) ( POWER_ON ?auto_17494 ) ( not ( = ?auto_17493 ?auto_17494 ) ) ( CALIBRATED ?auto_17494 ) ( SUPPORTS ?auto_17494 ?auto_17492 ) ( not ( = ?auto_17496 ?auto_17492 ) ) ( not ( = ?auto_17490 ?auto_17492 ) ) ( POINTING ?auto_17495 ?auto_17498 ) )
    :subtasks
    ( ( !TURN_TO ?auto_17495 ?auto_17491 ?auto_17498 )
      ( GET-2IMAGE ?auto_17497 ?auto_17496 ?auto_17489 ?auto_17490 )
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
      ?auto_17504 - INSTRUMENT
      ?auto_17503 - SATELLITE
      ?auto_17505 - DIRECTION
      ?auto_17507 - DIRECTION
      ?auto_17508 - INSTRUMENT
      ?auto_17506 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_17502 ?auto_17499 ) ) ( ON_BOARD ?auto_17504 ?auto_17503 ) ( SUPPORTS ?auto_17504 ?auto_17501 ) ( not ( = ?auto_17502 ?auto_17505 ) ) ( HAVE_IMAGE ?auto_17499 ?auto_17500 ) ( not ( = ?auto_17499 ?auto_17505 ) ) ( not ( = ?auto_17500 ?auto_17501 ) ) ( CALIBRATION_TARGET ?auto_17504 ?auto_17505 ) ( not ( = ?auto_17505 ?auto_17507 ) ) ( not ( = ?auto_17502 ?auto_17507 ) ) ( not ( = ?auto_17499 ?auto_17507 ) ) ( ON_BOARD ?auto_17508 ?auto_17503 ) ( POWER_ON ?auto_17508 ) ( not ( = ?auto_17504 ?auto_17508 ) ) ( CALIBRATED ?auto_17508 ) ( SUPPORTS ?auto_17508 ?auto_17506 ) ( not ( = ?auto_17500 ?auto_17506 ) ) ( not ( = ?auto_17501 ?auto_17506 ) ) ( POINTING ?auto_17503 ?auto_17505 ) )
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
      ?auto_17516 - DIRECTION
      ?auto_17517 - INSTRUMENT
      ?auto_17518 - SATELLITE
      ?auto_17513 - DIRECTION
      ?auto_17515 - MODE
      ?auto_17514 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17512 ?auto_17509 ) ) ( not ( = ?auto_17512 ?auto_17516 ) ) ( ON_BOARD ?auto_17517 ?auto_17518 ) ( SUPPORTS ?auto_17517 ?auto_17511 ) ( not ( = ?auto_17512 ?auto_17513 ) ) ( HAVE_IMAGE ?auto_17516 ?auto_17515 ) ( not ( = ?auto_17516 ?auto_17513 ) ) ( not ( = ?auto_17515 ?auto_17511 ) ) ( CALIBRATION_TARGET ?auto_17517 ?auto_17513 ) ( not ( = ?auto_17513 ?auto_17509 ) ) ( not ( = ?auto_17516 ?auto_17509 ) ) ( ON_BOARD ?auto_17514 ?auto_17518 ) ( POWER_ON ?auto_17514 ) ( not ( = ?auto_17517 ?auto_17514 ) ) ( CALIBRATED ?auto_17514 ) ( SUPPORTS ?auto_17514 ?auto_17510 ) ( not ( = ?auto_17515 ?auto_17510 ) ) ( not ( = ?auto_17511 ?auto_17510 ) ) ( POINTING ?auto_17518 ?auto_17513 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17516 ?auto_17515 ?auto_17512 ?auto_17511 )
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
      ?auto_17526 - INSTRUMENT
      ?auto_17527 - SATELLITE
      ?auto_17523 - DIRECTION
      ?auto_17525 - DIRECTION
      ?auto_17524 - INSTRUMENT
      ?auto_17528 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_17522 ?auto_17519 ) ) ( ON_BOARD ?auto_17526 ?auto_17527 ) ( SUPPORTS ?auto_17526 ?auto_17520 ) ( not ( = ?auto_17519 ?auto_17523 ) ) ( HAVE_IMAGE ?auto_17522 ?auto_17521 ) ( not ( = ?auto_17522 ?auto_17523 ) ) ( not ( = ?auto_17521 ?auto_17520 ) ) ( CALIBRATION_TARGET ?auto_17526 ?auto_17523 ) ( not ( = ?auto_17523 ?auto_17525 ) ) ( not ( = ?auto_17519 ?auto_17525 ) ) ( not ( = ?auto_17522 ?auto_17525 ) ) ( ON_BOARD ?auto_17524 ?auto_17527 ) ( POWER_ON ?auto_17524 ) ( not ( = ?auto_17526 ?auto_17524 ) ) ( CALIBRATED ?auto_17524 ) ( SUPPORTS ?auto_17524 ?auto_17528 ) ( not ( = ?auto_17521 ?auto_17528 ) ) ( not ( = ?auto_17520 ?auto_17528 ) ) ( POINTING ?auto_17527 ?auto_17523 ) )
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
      ?auto_17536 - DIRECTION
      ?auto_17537 - INSTRUMENT
      ?auto_17538 - SATELLITE
      ?auto_17533 - DIRECTION
      ?auto_17535 - MODE
      ?auto_17534 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17532 ?auto_17529 ) ) ( not ( = ?auto_17529 ?auto_17536 ) ) ( ON_BOARD ?auto_17537 ?auto_17538 ) ( SUPPORTS ?auto_17537 ?auto_17530 ) ( not ( = ?auto_17529 ?auto_17533 ) ) ( HAVE_IMAGE ?auto_17536 ?auto_17535 ) ( not ( = ?auto_17536 ?auto_17533 ) ) ( not ( = ?auto_17535 ?auto_17530 ) ) ( CALIBRATION_TARGET ?auto_17537 ?auto_17533 ) ( not ( = ?auto_17533 ?auto_17532 ) ) ( not ( = ?auto_17536 ?auto_17532 ) ) ( ON_BOARD ?auto_17534 ?auto_17538 ) ( POWER_ON ?auto_17534 ) ( not ( = ?auto_17537 ?auto_17534 ) ) ( CALIBRATED ?auto_17534 ) ( SUPPORTS ?auto_17534 ?auto_17531 ) ( not ( = ?auto_17535 ?auto_17531 ) ) ( not ( = ?auto_17530 ?auto_17531 ) ) ( POINTING ?auto_17538 ?auto_17533 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17536 ?auto_17535 ?auto_17529 ?auto_17530 )
      ( GET-2IMAGE-VERIFY ?auto_17529 ?auto_17530 ?auto_17532 ?auto_17531 ) )
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
    ( and ( not ( = ?auto_17566 ?auto_17563 ) ) ( not ( = ?auto_17568 ?auto_17563 ) ) ( not ( = ?auto_17568 ?auto_17566 ) ) ( ON_BOARD ?auto_17571 ?auto_17572 ) ( SUPPORTS ?auto_17571 ?auto_17567 ) ( not ( = ?auto_17568 ?auto_17569 ) ) ( HAVE_IMAGE ?auto_17563 ?auto_17564 ) ( not ( = ?auto_17563 ?auto_17569 ) ) ( not ( = ?auto_17564 ?auto_17567 ) ) ( CALIBRATION_TARGET ?auto_17571 ?auto_17569 ) ( not ( = ?auto_17569 ?auto_17566 ) ) ( ON_BOARD ?auto_17570 ?auto_17572 ) ( POWER_ON ?auto_17570 ) ( not ( = ?auto_17571 ?auto_17570 ) ) ( CALIBRATED ?auto_17570 ) ( SUPPORTS ?auto_17570 ?auto_17565 ) ( not ( = ?auto_17564 ?auto_17565 ) ) ( not ( = ?auto_17567 ?auto_17565 ) ) ( POINTING ?auto_17572 ?auto_17569 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17563 ?auto_17564 ?auto_17568 ?auto_17567 )
      ( GET-3IMAGE-VERIFY ?auto_17563 ?auto_17564 ?auto_17566 ?auto_17565 ?auto_17568 ?auto_17567 ) )
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
    ( and ( not ( = ?auto_17588 ?auto_17585 ) ) ( not ( = ?auto_17590 ?auto_17585 ) ) ( not ( = ?auto_17590 ?auto_17588 ) ) ( ON_BOARD ?auto_17593 ?auto_17594 ) ( SUPPORTS ?auto_17593 ?auto_17587 ) ( not ( = ?auto_17588 ?auto_17591 ) ) ( HAVE_IMAGE ?auto_17585 ?auto_17586 ) ( not ( = ?auto_17585 ?auto_17591 ) ) ( not ( = ?auto_17586 ?auto_17587 ) ) ( CALIBRATION_TARGET ?auto_17593 ?auto_17591 ) ( not ( = ?auto_17591 ?auto_17590 ) ) ( ON_BOARD ?auto_17592 ?auto_17594 ) ( POWER_ON ?auto_17592 ) ( not ( = ?auto_17593 ?auto_17592 ) ) ( CALIBRATED ?auto_17592 ) ( SUPPORTS ?auto_17592 ?auto_17589 ) ( not ( = ?auto_17586 ?auto_17589 ) ) ( not ( = ?auto_17587 ?auto_17589 ) ) ( POINTING ?auto_17594 ?auto_17591 ) )
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
    ( and ( not ( = ?auto_17610 ?auto_17607 ) ) ( not ( = ?auto_17612 ?auto_17607 ) ) ( not ( = ?auto_17612 ?auto_17610 ) ) ( ON_BOARD ?auto_17615 ?auto_17616 ) ( SUPPORTS ?auto_17615 ?auto_17611 ) ( not ( = ?auto_17612 ?auto_17613 ) ) ( HAVE_IMAGE ?auto_17610 ?auto_17609 ) ( not ( = ?auto_17610 ?auto_17613 ) ) ( not ( = ?auto_17609 ?auto_17611 ) ) ( CALIBRATION_TARGET ?auto_17615 ?auto_17613 ) ( not ( = ?auto_17613 ?auto_17607 ) ) ( ON_BOARD ?auto_17614 ?auto_17616 ) ( POWER_ON ?auto_17614 ) ( not ( = ?auto_17615 ?auto_17614 ) ) ( CALIBRATED ?auto_17614 ) ( SUPPORTS ?auto_17614 ?auto_17608 ) ( not ( = ?auto_17609 ?auto_17608 ) ) ( not ( = ?auto_17611 ?auto_17608 ) ) ( POINTING ?auto_17616 ?auto_17613 ) )
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
    ( and ( not ( = ?auto_17632 ?auto_17629 ) ) ( not ( = ?auto_17634 ?auto_17629 ) ) ( not ( = ?auto_17634 ?auto_17632 ) ) ( ON_BOARD ?auto_17637 ?auto_17638 ) ( SUPPORTS ?auto_17637 ?auto_17631 ) ( not ( = ?auto_17632 ?auto_17635 ) ) ( HAVE_IMAGE ?auto_17634 ?auto_17633 ) ( not ( = ?auto_17634 ?auto_17635 ) ) ( not ( = ?auto_17633 ?auto_17631 ) ) ( CALIBRATION_TARGET ?auto_17637 ?auto_17635 ) ( not ( = ?auto_17635 ?auto_17629 ) ) ( ON_BOARD ?auto_17636 ?auto_17638 ) ( POWER_ON ?auto_17636 ) ( not ( = ?auto_17637 ?auto_17636 ) ) ( CALIBRATED ?auto_17636 ) ( SUPPORTS ?auto_17636 ?auto_17630 ) ( not ( = ?auto_17633 ?auto_17630 ) ) ( not ( = ?auto_17631 ?auto_17630 ) ) ( POINTING ?auto_17638 ?auto_17635 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17634 ?auto_17633 ?auto_17632 ?auto_17631 )
      ( GET-3IMAGE-VERIFY ?auto_17629 ?auto_17630 ?auto_17632 ?auto_17631 ?auto_17634 ?auto_17633 ) )
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
    ( and ( not ( = ?auto_17678 ?auto_17675 ) ) ( not ( = ?auto_17680 ?auto_17675 ) ) ( not ( = ?auto_17680 ?auto_17678 ) ) ( ON_BOARD ?auto_17683 ?auto_17684 ) ( SUPPORTS ?auto_17683 ?auto_17676 ) ( not ( = ?auto_17675 ?auto_17681 ) ) ( HAVE_IMAGE ?auto_17678 ?auto_17677 ) ( not ( = ?auto_17678 ?auto_17681 ) ) ( not ( = ?auto_17677 ?auto_17676 ) ) ( CALIBRATION_TARGET ?auto_17683 ?auto_17681 ) ( not ( = ?auto_17681 ?auto_17680 ) ) ( ON_BOARD ?auto_17682 ?auto_17684 ) ( POWER_ON ?auto_17682 ) ( not ( = ?auto_17683 ?auto_17682 ) ) ( CALIBRATED ?auto_17682 ) ( SUPPORTS ?auto_17682 ?auto_17679 ) ( not ( = ?auto_17677 ?auto_17679 ) ) ( not ( = ?auto_17676 ?auto_17679 ) ) ( POINTING ?auto_17684 ?auto_17681 ) )
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
    ( and ( not ( = ?auto_17700 ?auto_17697 ) ) ( not ( = ?auto_17702 ?auto_17697 ) ) ( not ( = ?auto_17702 ?auto_17700 ) ) ( ON_BOARD ?auto_17705 ?auto_17706 ) ( SUPPORTS ?auto_17705 ?auto_17698 ) ( not ( = ?auto_17697 ?auto_17703 ) ) ( HAVE_IMAGE ?auto_17702 ?auto_17701 ) ( not ( = ?auto_17702 ?auto_17703 ) ) ( not ( = ?auto_17701 ?auto_17698 ) ) ( CALIBRATION_TARGET ?auto_17705 ?auto_17703 ) ( not ( = ?auto_17703 ?auto_17700 ) ) ( ON_BOARD ?auto_17704 ?auto_17706 ) ( POWER_ON ?auto_17704 ) ( not ( = ?auto_17705 ?auto_17704 ) ) ( CALIBRATED ?auto_17704 ) ( SUPPORTS ?auto_17704 ?auto_17699 ) ( not ( = ?auto_17701 ?auto_17699 ) ) ( not ( = ?auto_17698 ?auto_17699 ) ) ( POINTING ?auto_17706 ?auto_17703 ) )
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
      ?auto_17774 - DIRECTION
      ?auto_17776 - INSTRUMENT
      ?auto_17777 - SATELLITE
      ?auto_17771 - DIRECTION
      ?auto_17773 - MODE
      ?auto_17775 - DIRECTION
      ?auto_17772 - INSTRUMENT
      ?auto_17778 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_17769 ?auto_17774 ) ) ( ON_BOARD ?auto_17776 ?auto_17777 ) ( SUPPORTS ?auto_17776 ?auto_17770 ) ( not ( = ?auto_17769 ?auto_17771 ) ) ( HAVE_IMAGE ?auto_17774 ?auto_17773 ) ( not ( = ?auto_17774 ?auto_17771 ) ) ( not ( = ?auto_17773 ?auto_17770 ) ) ( CALIBRATION_TARGET ?auto_17776 ?auto_17771 ) ( not ( = ?auto_17771 ?auto_17775 ) ) ( not ( = ?auto_17769 ?auto_17775 ) ) ( not ( = ?auto_17774 ?auto_17775 ) ) ( ON_BOARD ?auto_17772 ?auto_17777 ) ( POWER_ON ?auto_17772 ) ( not ( = ?auto_17776 ?auto_17772 ) ) ( SUPPORTS ?auto_17772 ?auto_17778 ) ( not ( = ?auto_17773 ?auto_17778 ) ) ( not ( = ?auto_17770 ?auto_17778 ) ) ( POINTING ?auto_17777 ?auto_17771 ) ( CALIBRATION_TARGET ?auto_17772 ?auto_17771 ) ( NOT_CALIBRATED ?auto_17772 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_17777 ?auto_17772 ?auto_17771 )
      ( GET-2IMAGE ?auto_17774 ?auto_17773 ?auto_17769 ?auto_17770 )
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
      ?auto_17785 - INSTRUMENT
      ?auto_17788 - SATELLITE
      ?auto_17783 - DIRECTION
      ?auto_17784 - DIRECTION
      ?auto_17786 - INSTRUMENT
      ?auto_17787 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_17782 ?auto_17779 ) ) ( ON_BOARD ?auto_17785 ?auto_17788 ) ( SUPPORTS ?auto_17785 ?auto_17781 ) ( not ( = ?auto_17782 ?auto_17783 ) ) ( HAVE_IMAGE ?auto_17779 ?auto_17780 ) ( not ( = ?auto_17779 ?auto_17783 ) ) ( not ( = ?auto_17780 ?auto_17781 ) ) ( CALIBRATION_TARGET ?auto_17785 ?auto_17783 ) ( not ( = ?auto_17783 ?auto_17784 ) ) ( not ( = ?auto_17782 ?auto_17784 ) ) ( not ( = ?auto_17779 ?auto_17784 ) ) ( ON_BOARD ?auto_17786 ?auto_17788 ) ( POWER_ON ?auto_17786 ) ( not ( = ?auto_17785 ?auto_17786 ) ) ( SUPPORTS ?auto_17786 ?auto_17787 ) ( not ( = ?auto_17780 ?auto_17787 ) ) ( not ( = ?auto_17781 ?auto_17787 ) ) ( POINTING ?auto_17788 ?auto_17783 ) ( CALIBRATION_TARGET ?auto_17786 ?auto_17783 ) ( NOT_CALIBRATED ?auto_17786 ) )
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
      ?auto_17794 - DIRECTION
      ?auto_17798 - INSTRUMENT
      ?auto_17797 - SATELLITE
      ?auto_17796 - DIRECTION
      ?auto_17793 - MODE
      ?auto_17795 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17792 ?auto_17789 ) ) ( not ( = ?auto_17792 ?auto_17794 ) ) ( ON_BOARD ?auto_17798 ?auto_17797 ) ( SUPPORTS ?auto_17798 ?auto_17791 ) ( not ( = ?auto_17792 ?auto_17796 ) ) ( HAVE_IMAGE ?auto_17794 ?auto_17793 ) ( not ( = ?auto_17794 ?auto_17796 ) ) ( not ( = ?auto_17793 ?auto_17791 ) ) ( CALIBRATION_TARGET ?auto_17798 ?auto_17796 ) ( not ( = ?auto_17796 ?auto_17789 ) ) ( not ( = ?auto_17794 ?auto_17789 ) ) ( ON_BOARD ?auto_17795 ?auto_17797 ) ( POWER_ON ?auto_17795 ) ( not ( = ?auto_17798 ?auto_17795 ) ) ( SUPPORTS ?auto_17795 ?auto_17790 ) ( not ( = ?auto_17793 ?auto_17790 ) ) ( not ( = ?auto_17791 ?auto_17790 ) ) ( POINTING ?auto_17797 ?auto_17796 ) ( CALIBRATION_TARGET ?auto_17795 ?auto_17796 ) ( NOT_CALIBRATED ?auto_17795 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17794 ?auto_17793 ?auto_17792 ?auto_17791 )
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
      ?auto_17807 - SATELLITE
      ?auto_17805 - DIRECTION
      ?auto_17806 - DIRECTION
      ?auto_17803 - INSTRUMENT
      ?auto_17804 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_17802 ?auto_17799 ) ) ( ON_BOARD ?auto_17808 ?auto_17807 ) ( SUPPORTS ?auto_17808 ?auto_17800 ) ( not ( = ?auto_17799 ?auto_17805 ) ) ( HAVE_IMAGE ?auto_17802 ?auto_17801 ) ( not ( = ?auto_17802 ?auto_17805 ) ) ( not ( = ?auto_17801 ?auto_17800 ) ) ( CALIBRATION_TARGET ?auto_17808 ?auto_17805 ) ( not ( = ?auto_17805 ?auto_17806 ) ) ( not ( = ?auto_17799 ?auto_17806 ) ) ( not ( = ?auto_17802 ?auto_17806 ) ) ( ON_BOARD ?auto_17803 ?auto_17807 ) ( POWER_ON ?auto_17803 ) ( not ( = ?auto_17808 ?auto_17803 ) ) ( SUPPORTS ?auto_17803 ?auto_17804 ) ( not ( = ?auto_17801 ?auto_17804 ) ) ( not ( = ?auto_17800 ?auto_17804 ) ) ( POINTING ?auto_17807 ?auto_17805 ) ( CALIBRATION_TARGET ?auto_17803 ?auto_17805 ) ( NOT_CALIBRATED ?auto_17803 ) )
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
      ?auto_17814 - DIRECTION
      ?auto_17818 - INSTRUMENT
      ?auto_17817 - SATELLITE
      ?auto_17816 - DIRECTION
      ?auto_17813 - MODE
      ?auto_17815 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17812 ?auto_17809 ) ) ( not ( = ?auto_17809 ?auto_17814 ) ) ( ON_BOARD ?auto_17818 ?auto_17817 ) ( SUPPORTS ?auto_17818 ?auto_17810 ) ( not ( = ?auto_17809 ?auto_17816 ) ) ( HAVE_IMAGE ?auto_17814 ?auto_17813 ) ( not ( = ?auto_17814 ?auto_17816 ) ) ( not ( = ?auto_17813 ?auto_17810 ) ) ( CALIBRATION_TARGET ?auto_17818 ?auto_17816 ) ( not ( = ?auto_17816 ?auto_17812 ) ) ( not ( = ?auto_17814 ?auto_17812 ) ) ( ON_BOARD ?auto_17815 ?auto_17817 ) ( POWER_ON ?auto_17815 ) ( not ( = ?auto_17818 ?auto_17815 ) ) ( SUPPORTS ?auto_17815 ?auto_17811 ) ( not ( = ?auto_17813 ?auto_17811 ) ) ( not ( = ?auto_17810 ?auto_17811 ) ) ( POINTING ?auto_17817 ?auto_17816 ) ( CALIBRATION_TARGET ?auto_17815 ?auto_17816 ) ( NOT_CALIBRATED ?auto_17815 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17814 ?auto_17813 ?auto_17809 ?auto_17810 )
      ( GET-2IMAGE-VERIFY ?auto_17809 ?auto_17810 ?auto_17812 ?auto_17811 ) )
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
      ?auto_17851 - SATELLITE
      ?auto_17850 - DIRECTION
      ?auto_17849 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17846 ?auto_17843 ) ) ( not ( = ?auto_17848 ?auto_17843 ) ) ( not ( = ?auto_17848 ?auto_17846 ) ) ( ON_BOARD ?auto_17852 ?auto_17851 ) ( SUPPORTS ?auto_17852 ?auto_17847 ) ( not ( = ?auto_17848 ?auto_17850 ) ) ( HAVE_IMAGE ?auto_17843 ?auto_17844 ) ( not ( = ?auto_17843 ?auto_17850 ) ) ( not ( = ?auto_17844 ?auto_17847 ) ) ( CALIBRATION_TARGET ?auto_17852 ?auto_17850 ) ( not ( = ?auto_17850 ?auto_17846 ) ) ( ON_BOARD ?auto_17849 ?auto_17851 ) ( POWER_ON ?auto_17849 ) ( not ( = ?auto_17852 ?auto_17849 ) ) ( SUPPORTS ?auto_17849 ?auto_17845 ) ( not ( = ?auto_17844 ?auto_17845 ) ) ( not ( = ?auto_17847 ?auto_17845 ) ) ( POINTING ?auto_17851 ?auto_17850 ) ( CALIBRATION_TARGET ?auto_17849 ?auto_17850 ) ( NOT_CALIBRATED ?auto_17849 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17843 ?auto_17844 ?auto_17848 ?auto_17847 )
      ( GET-3IMAGE-VERIFY ?auto_17843 ?auto_17844 ?auto_17846 ?auto_17845 ?auto_17848 ?auto_17847 ) )
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
      ?auto_17873 - SATELLITE
      ?auto_17872 - DIRECTION
      ?auto_17871 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17868 ?auto_17865 ) ) ( not ( = ?auto_17870 ?auto_17865 ) ) ( not ( = ?auto_17870 ?auto_17868 ) ) ( ON_BOARD ?auto_17874 ?auto_17873 ) ( SUPPORTS ?auto_17874 ?auto_17867 ) ( not ( = ?auto_17868 ?auto_17872 ) ) ( HAVE_IMAGE ?auto_17865 ?auto_17866 ) ( not ( = ?auto_17865 ?auto_17872 ) ) ( not ( = ?auto_17866 ?auto_17867 ) ) ( CALIBRATION_TARGET ?auto_17874 ?auto_17872 ) ( not ( = ?auto_17872 ?auto_17870 ) ) ( ON_BOARD ?auto_17871 ?auto_17873 ) ( POWER_ON ?auto_17871 ) ( not ( = ?auto_17874 ?auto_17871 ) ) ( SUPPORTS ?auto_17871 ?auto_17869 ) ( not ( = ?auto_17866 ?auto_17869 ) ) ( not ( = ?auto_17867 ?auto_17869 ) ) ( POINTING ?auto_17873 ?auto_17872 ) ( CALIBRATION_TARGET ?auto_17871 ?auto_17872 ) ( NOT_CALIBRATED ?auto_17871 ) )
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
      ?auto_17895 - SATELLITE
      ?auto_17894 - DIRECTION
      ?auto_17893 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17890 ?auto_17887 ) ) ( not ( = ?auto_17892 ?auto_17887 ) ) ( not ( = ?auto_17892 ?auto_17890 ) ) ( ON_BOARD ?auto_17896 ?auto_17895 ) ( SUPPORTS ?auto_17896 ?auto_17891 ) ( not ( = ?auto_17892 ?auto_17894 ) ) ( HAVE_IMAGE ?auto_17890 ?auto_17889 ) ( not ( = ?auto_17890 ?auto_17894 ) ) ( not ( = ?auto_17889 ?auto_17891 ) ) ( CALIBRATION_TARGET ?auto_17896 ?auto_17894 ) ( not ( = ?auto_17894 ?auto_17887 ) ) ( ON_BOARD ?auto_17893 ?auto_17895 ) ( POWER_ON ?auto_17893 ) ( not ( = ?auto_17896 ?auto_17893 ) ) ( SUPPORTS ?auto_17893 ?auto_17888 ) ( not ( = ?auto_17889 ?auto_17888 ) ) ( not ( = ?auto_17891 ?auto_17888 ) ) ( POINTING ?auto_17895 ?auto_17894 ) ( CALIBRATION_TARGET ?auto_17893 ?auto_17894 ) ( NOT_CALIBRATED ?auto_17893 ) )
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
      ?auto_17917 - SATELLITE
      ?auto_17916 - DIRECTION
      ?auto_17915 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17912 ?auto_17909 ) ) ( not ( = ?auto_17914 ?auto_17909 ) ) ( not ( = ?auto_17914 ?auto_17912 ) ) ( ON_BOARD ?auto_17918 ?auto_17917 ) ( SUPPORTS ?auto_17918 ?auto_17911 ) ( not ( = ?auto_17912 ?auto_17916 ) ) ( HAVE_IMAGE ?auto_17914 ?auto_17913 ) ( not ( = ?auto_17914 ?auto_17916 ) ) ( not ( = ?auto_17913 ?auto_17911 ) ) ( CALIBRATION_TARGET ?auto_17918 ?auto_17916 ) ( not ( = ?auto_17916 ?auto_17909 ) ) ( ON_BOARD ?auto_17915 ?auto_17917 ) ( POWER_ON ?auto_17915 ) ( not ( = ?auto_17918 ?auto_17915 ) ) ( SUPPORTS ?auto_17915 ?auto_17910 ) ( not ( = ?auto_17913 ?auto_17910 ) ) ( not ( = ?auto_17911 ?auto_17910 ) ) ( POINTING ?auto_17917 ?auto_17916 ) ( CALIBRATION_TARGET ?auto_17915 ?auto_17916 ) ( NOT_CALIBRATED ?auto_17915 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_17914 ?auto_17913 ?auto_17912 ?auto_17911 )
      ( GET-3IMAGE-VERIFY ?auto_17909 ?auto_17910 ?auto_17912 ?auto_17911 ?auto_17914 ?auto_17913 ) )
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
      ?auto_17963 - SATELLITE
      ?auto_17962 - DIRECTION
      ?auto_17961 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17958 ?auto_17955 ) ) ( not ( = ?auto_17960 ?auto_17955 ) ) ( not ( = ?auto_17960 ?auto_17958 ) ) ( ON_BOARD ?auto_17964 ?auto_17963 ) ( SUPPORTS ?auto_17964 ?auto_17956 ) ( not ( = ?auto_17955 ?auto_17962 ) ) ( HAVE_IMAGE ?auto_17958 ?auto_17957 ) ( not ( = ?auto_17958 ?auto_17962 ) ) ( not ( = ?auto_17957 ?auto_17956 ) ) ( CALIBRATION_TARGET ?auto_17964 ?auto_17962 ) ( not ( = ?auto_17962 ?auto_17960 ) ) ( ON_BOARD ?auto_17961 ?auto_17963 ) ( POWER_ON ?auto_17961 ) ( not ( = ?auto_17964 ?auto_17961 ) ) ( SUPPORTS ?auto_17961 ?auto_17959 ) ( not ( = ?auto_17957 ?auto_17959 ) ) ( not ( = ?auto_17956 ?auto_17959 ) ) ( POINTING ?auto_17963 ?auto_17962 ) ( CALIBRATION_TARGET ?auto_17961 ?auto_17962 ) ( NOT_CALIBRATED ?auto_17961 ) )
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
      ?auto_17985 - SATELLITE
      ?auto_17984 - DIRECTION
      ?auto_17983 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_17980 ?auto_17977 ) ) ( not ( = ?auto_17982 ?auto_17977 ) ) ( not ( = ?auto_17982 ?auto_17980 ) ) ( ON_BOARD ?auto_17986 ?auto_17985 ) ( SUPPORTS ?auto_17986 ?auto_17978 ) ( not ( = ?auto_17977 ?auto_17984 ) ) ( HAVE_IMAGE ?auto_17982 ?auto_17981 ) ( not ( = ?auto_17982 ?auto_17984 ) ) ( not ( = ?auto_17981 ?auto_17978 ) ) ( CALIBRATION_TARGET ?auto_17986 ?auto_17984 ) ( not ( = ?auto_17984 ?auto_17980 ) ) ( ON_BOARD ?auto_17983 ?auto_17985 ) ( POWER_ON ?auto_17983 ) ( not ( = ?auto_17986 ?auto_17983 ) ) ( SUPPORTS ?auto_17983 ?auto_17979 ) ( not ( = ?auto_17981 ?auto_17979 ) ) ( not ( = ?auto_17978 ?auto_17979 ) ) ( POINTING ?auto_17985 ?auto_17984 ) ( CALIBRATION_TARGET ?auto_17983 ?auto_17984 ) ( NOT_CALIBRATED ?auto_17983 ) )
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
      ?auto_18052 - DIRECTION
      ?auto_18058 - INSTRUMENT
      ?auto_18057 - SATELLITE
      ?auto_18055 - DIRECTION
      ?auto_18051 - MODE
      ?auto_18056 - DIRECTION
      ?auto_18053 - INSTRUMENT
      ?auto_18054 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_18049 ?auto_18052 ) ) ( ON_BOARD ?auto_18058 ?auto_18057 ) ( SUPPORTS ?auto_18058 ?auto_18050 ) ( not ( = ?auto_18049 ?auto_18055 ) ) ( HAVE_IMAGE ?auto_18052 ?auto_18051 ) ( not ( = ?auto_18052 ?auto_18055 ) ) ( not ( = ?auto_18051 ?auto_18050 ) ) ( CALIBRATION_TARGET ?auto_18058 ?auto_18055 ) ( not ( = ?auto_18055 ?auto_18056 ) ) ( not ( = ?auto_18049 ?auto_18056 ) ) ( not ( = ?auto_18052 ?auto_18056 ) ) ( ON_BOARD ?auto_18053 ?auto_18057 ) ( not ( = ?auto_18058 ?auto_18053 ) ) ( SUPPORTS ?auto_18053 ?auto_18054 ) ( not ( = ?auto_18051 ?auto_18054 ) ) ( not ( = ?auto_18050 ?auto_18054 ) ) ( POINTING ?auto_18057 ?auto_18055 ) ( CALIBRATION_TARGET ?auto_18053 ?auto_18055 ) ( POWER_AVAIL ?auto_18057 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_18053 ?auto_18057 )
      ( GET-2IMAGE ?auto_18052 ?auto_18051 ?auto_18049 ?auto_18050 )
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
      ?auto_18063 - INSTRUMENT
      ?auto_18067 - SATELLITE
      ?auto_18066 - DIRECTION
      ?auto_18065 - DIRECTION
      ?auto_18068 - INSTRUMENT
      ?auto_18064 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_18062 ?auto_18059 ) ) ( ON_BOARD ?auto_18063 ?auto_18067 ) ( SUPPORTS ?auto_18063 ?auto_18061 ) ( not ( = ?auto_18062 ?auto_18066 ) ) ( HAVE_IMAGE ?auto_18059 ?auto_18060 ) ( not ( = ?auto_18059 ?auto_18066 ) ) ( not ( = ?auto_18060 ?auto_18061 ) ) ( CALIBRATION_TARGET ?auto_18063 ?auto_18066 ) ( not ( = ?auto_18066 ?auto_18065 ) ) ( not ( = ?auto_18062 ?auto_18065 ) ) ( not ( = ?auto_18059 ?auto_18065 ) ) ( ON_BOARD ?auto_18068 ?auto_18067 ) ( not ( = ?auto_18063 ?auto_18068 ) ) ( SUPPORTS ?auto_18068 ?auto_18064 ) ( not ( = ?auto_18060 ?auto_18064 ) ) ( not ( = ?auto_18061 ?auto_18064 ) ) ( POINTING ?auto_18067 ?auto_18066 ) ( CALIBRATION_TARGET ?auto_18068 ?auto_18066 ) ( POWER_AVAIL ?auto_18067 ) )
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
      ?auto_18075 - DIRECTION
      ?auto_18076 - INSTRUMENT
      ?auto_18077 - SATELLITE
      ?auto_18073 - DIRECTION
      ?auto_18074 - MODE
      ?auto_18078 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18072 ?auto_18069 ) ) ( not ( = ?auto_18072 ?auto_18075 ) ) ( ON_BOARD ?auto_18076 ?auto_18077 ) ( SUPPORTS ?auto_18076 ?auto_18071 ) ( not ( = ?auto_18072 ?auto_18073 ) ) ( HAVE_IMAGE ?auto_18075 ?auto_18074 ) ( not ( = ?auto_18075 ?auto_18073 ) ) ( not ( = ?auto_18074 ?auto_18071 ) ) ( CALIBRATION_TARGET ?auto_18076 ?auto_18073 ) ( not ( = ?auto_18073 ?auto_18069 ) ) ( not ( = ?auto_18075 ?auto_18069 ) ) ( ON_BOARD ?auto_18078 ?auto_18077 ) ( not ( = ?auto_18076 ?auto_18078 ) ) ( SUPPORTS ?auto_18078 ?auto_18070 ) ( not ( = ?auto_18074 ?auto_18070 ) ) ( not ( = ?auto_18071 ?auto_18070 ) ) ( POINTING ?auto_18077 ?auto_18073 ) ( CALIBRATION_TARGET ?auto_18078 ?auto_18073 ) ( POWER_AVAIL ?auto_18077 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18075 ?auto_18074 ?auto_18072 ?auto_18071 )
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
      ?auto_18086 - INSTRUMENT
      ?auto_18087 - SATELLITE
      ?auto_18084 - DIRECTION
      ?auto_18085 - DIRECTION
      ?auto_18088 - INSTRUMENT
      ?auto_18083 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_18082 ?auto_18079 ) ) ( ON_BOARD ?auto_18086 ?auto_18087 ) ( SUPPORTS ?auto_18086 ?auto_18080 ) ( not ( = ?auto_18079 ?auto_18084 ) ) ( HAVE_IMAGE ?auto_18082 ?auto_18081 ) ( not ( = ?auto_18082 ?auto_18084 ) ) ( not ( = ?auto_18081 ?auto_18080 ) ) ( CALIBRATION_TARGET ?auto_18086 ?auto_18084 ) ( not ( = ?auto_18084 ?auto_18085 ) ) ( not ( = ?auto_18079 ?auto_18085 ) ) ( not ( = ?auto_18082 ?auto_18085 ) ) ( ON_BOARD ?auto_18088 ?auto_18087 ) ( not ( = ?auto_18086 ?auto_18088 ) ) ( SUPPORTS ?auto_18088 ?auto_18083 ) ( not ( = ?auto_18081 ?auto_18083 ) ) ( not ( = ?auto_18080 ?auto_18083 ) ) ( POINTING ?auto_18087 ?auto_18084 ) ( CALIBRATION_TARGET ?auto_18088 ?auto_18084 ) ( POWER_AVAIL ?auto_18087 ) )
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
      ?auto_18095 - DIRECTION
      ?auto_18096 - INSTRUMENT
      ?auto_18097 - SATELLITE
      ?auto_18093 - DIRECTION
      ?auto_18094 - MODE
      ?auto_18098 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18092 ?auto_18089 ) ) ( not ( = ?auto_18089 ?auto_18095 ) ) ( ON_BOARD ?auto_18096 ?auto_18097 ) ( SUPPORTS ?auto_18096 ?auto_18090 ) ( not ( = ?auto_18089 ?auto_18093 ) ) ( HAVE_IMAGE ?auto_18095 ?auto_18094 ) ( not ( = ?auto_18095 ?auto_18093 ) ) ( not ( = ?auto_18094 ?auto_18090 ) ) ( CALIBRATION_TARGET ?auto_18096 ?auto_18093 ) ( not ( = ?auto_18093 ?auto_18092 ) ) ( not ( = ?auto_18095 ?auto_18092 ) ) ( ON_BOARD ?auto_18098 ?auto_18097 ) ( not ( = ?auto_18096 ?auto_18098 ) ) ( SUPPORTS ?auto_18098 ?auto_18091 ) ( not ( = ?auto_18094 ?auto_18091 ) ) ( not ( = ?auto_18090 ?auto_18091 ) ) ( POINTING ?auto_18097 ?auto_18093 ) ( CALIBRATION_TARGET ?auto_18098 ?auto_18093 ) ( POWER_AVAIL ?auto_18097 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18095 ?auto_18094 ?auto_18089 ?auto_18090 )
      ( GET-2IMAGE-VERIFY ?auto_18089 ?auto_18090 ?auto_18092 ?auto_18091 ) )
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
      ?auto_18130 - INSTRUMENT
      ?auto_18131 - SATELLITE
      ?auto_18129 - DIRECTION
      ?auto_18132 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18126 ?auto_18123 ) ) ( not ( = ?auto_18128 ?auto_18123 ) ) ( not ( = ?auto_18128 ?auto_18126 ) ) ( ON_BOARD ?auto_18130 ?auto_18131 ) ( SUPPORTS ?auto_18130 ?auto_18127 ) ( not ( = ?auto_18128 ?auto_18129 ) ) ( HAVE_IMAGE ?auto_18123 ?auto_18124 ) ( not ( = ?auto_18123 ?auto_18129 ) ) ( not ( = ?auto_18124 ?auto_18127 ) ) ( CALIBRATION_TARGET ?auto_18130 ?auto_18129 ) ( not ( = ?auto_18129 ?auto_18126 ) ) ( ON_BOARD ?auto_18132 ?auto_18131 ) ( not ( = ?auto_18130 ?auto_18132 ) ) ( SUPPORTS ?auto_18132 ?auto_18125 ) ( not ( = ?auto_18124 ?auto_18125 ) ) ( not ( = ?auto_18127 ?auto_18125 ) ) ( POINTING ?auto_18131 ?auto_18129 ) ( CALIBRATION_TARGET ?auto_18132 ?auto_18129 ) ( POWER_AVAIL ?auto_18131 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18123 ?auto_18124 ?auto_18128 ?auto_18127 )
      ( GET-3IMAGE-VERIFY ?auto_18123 ?auto_18124 ?auto_18126 ?auto_18125 ?auto_18128 ?auto_18127 ) )
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
      ?auto_18152 - INSTRUMENT
      ?auto_18153 - SATELLITE
      ?auto_18151 - DIRECTION
      ?auto_18154 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18148 ?auto_18145 ) ) ( not ( = ?auto_18150 ?auto_18145 ) ) ( not ( = ?auto_18150 ?auto_18148 ) ) ( ON_BOARD ?auto_18152 ?auto_18153 ) ( SUPPORTS ?auto_18152 ?auto_18147 ) ( not ( = ?auto_18148 ?auto_18151 ) ) ( HAVE_IMAGE ?auto_18145 ?auto_18146 ) ( not ( = ?auto_18145 ?auto_18151 ) ) ( not ( = ?auto_18146 ?auto_18147 ) ) ( CALIBRATION_TARGET ?auto_18152 ?auto_18151 ) ( not ( = ?auto_18151 ?auto_18150 ) ) ( ON_BOARD ?auto_18154 ?auto_18153 ) ( not ( = ?auto_18152 ?auto_18154 ) ) ( SUPPORTS ?auto_18154 ?auto_18149 ) ( not ( = ?auto_18146 ?auto_18149 ) ) ( not ( = ?auto_18147 ?auto_18149 ) ) ( POINTING ?auto_18153 ?auto_18151 ) ( CALIBRATION_TARGET ?auto_18154 ?auto_18151 ) ( POWER_AVAIL ?auto_18153 ) )
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
      ?auto_18174 - INSTRUMENT
      ?auto_18175 - SATELLITE
      ?auto_18173 - DIRECTION
      ?auto_18176 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18170 ?auto_18167 ) ) ( not ( = ?auto_18172 ?auto_18167 ) ) ( not ( = ?auto_18172 ?auto_18170 ) ) ( ON_BOARD ?auto_18174 ?auto_18175 ) ( SUPPORTS ?auto_18174 ?auto_18171 ) ( not ( = ?auto_18172 ?auto_18173 ) ) ( HAVE_IMAGE ?auto_18170 ?auto_18169 ) ( not ( = ?auto_18170 ?auto_18173 ) ) ( not ( = ?auto_18169 ?auto_18171 ) ) ( CALIBRATION_TARGET ?auto_18174 ?auto_18173 ) ( not ( = ?auto_18173 ?auto_18167 ) ) ( ON_BOARD ?auto_18176 ?auto_18175 ) ( not ( = ?auto_18174 ?auto_18176 ) ) ( SUPPORTS ?auto_18176 ?auto_18168 ) ( not ( = ?auto_18169 ?auto_18168 ) ) ( not ( = ?auto_18171 ?auto_18168 ) ) ( POINTING ?auto_18175 ?auto_18173 ) ( CALIBRATION_TARGET ?auto_18176 ?auto_18173 ) ( POWER_AVAIL ?auto_18175 ) )
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
      ?auto_18196 - INSTRUMENT
      ?auto_18197 - SATELLITE
      ?auto_18195 - DIRECTION
      ?auto_18198 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18192 ?auto_18189 ) ) ( not ( = ?auto_18194 ?auto_18189 ) ) ( not ( = ?auto_18194 ?auto_18192 ) ) ( ON_BOARD ?auto_18196 ?auto_18197 ) ( SUPPORTS ?auto_18196 ?auto_18191 ) ( not ( = ?auto_18192 ?auto_18195 ) ) ( HAVE_IMAGE ?auto_18194 ?auto_18193 ) ( not ( = ?auto_18194 ?auto_18195 ) ) ( not ( = ?auto_18193 ?auto_18191 ) ) ( CALIBRATION_TARGET ?auto_18196 ?auto_18195 ) ( not ( = ?auto_18195 ?auto_18189 ) ) ( ON_BOARD ?auto_18198 ?auto_18197 ) ( not ( = ?auto_18196 ?auto_18198 ) ) ( SUPPORTS ?auto_18198 ?auto_18190 ) ( not ( = ?auto_18193 ?auto_18190 ) ) ( not ( = ?auto_18191 ?auto_18190 ) ) ( POINTING ?auto_18197 ?auto_18195 ) ( CALIBRATION_TARGET ?auto_18198 ?auto_18195 ) ( POWER_AVAIL ?auto_18197 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18194 ?auto_18193 ?auto_18192 ?auto_18191 )
      ( GET-3IMAGE-VERIFY ?auto_18189 ?auto_18190 ?auto_18192 ?auto_18191 ?auto_18194 ?auto_18193 ) )
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
      ?auto_18242 - INSTRUMENT
      ?auto_18243 - SATELLITE
      ?auto_18241 - DIRECTION
      ?auto_18244 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18238 ?auto_18235 ) ) ( not ( = ?auto_18240 ?auto_18235 ) ) ( not ( = ?auto_18240 ?auto_18238 ) ) ( ON_BOARD ?auto_18242 ?auto_18243 ) ( SUPPORTS ?auto_18242 ?auto_18236 ) ( not ( = ?auto_18235 ?auto_18241 ) ) ( HAVE_IMAGE ?auto_18238 ?auto_18237 ) ( not ( = ?auto_18238 ?auto_18241 ) ) ( not ( = ?auto_18237 ?auto_18236 ) ) ( CALIBRATION_TARGET ?auto_18242 ?auto_18241 ) ( not ( = ?auto_18241 ?auto_18240 ) ) ( ON_BOARD ?auto_18244 ?auto_18243 ) ( not ( = ?auto_18242 ?auto_18244 ) ) ( SUPPORTS ?auto_18244 ?auto_18239 ) ( not ( = ?auto_18237 ?auto_18239 ) ) ( not ( = ?auto_18236 ?auto_18239 ) ) ( POINTING ?auto_18243 ?auto_18241 ) ( CALIBRATION_TARGET ?auto_18244 ?auto_18241 ) ( POWER_AVAIL ?auto_18243 ) )
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
      ?auto_18264 - INSTRUMENT
      ?auto_18265 - SATELLITE
      ?auto_18263 - DIRECTION
      ?auto_18266 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18260 ?auto_18257 ) ) ( not ( = ?auto_18262 ?auto_18257 ) ) ( not ( = ?auto_18262 ?auto_18260 ) ) ( ON_BOARD ?auto_18264 ?auto_18265 ) ( SUPPORTS ?auto_18264 ?auto_18258 ) ( not ( = ?auto_18257 ?auto_18263 ) ) ( HAVE_IMAGE ?auto_18262 ?auto_18261 ) ( not ( = ?auto_18262 ?auto_18263 ) ) ( not ( = ?auto_18261 ?auto_18258 ) ) ( CALIBRATION_TARGET ?auto_18264 ?auto_18263 ) ( not ( = ?auto_18263 ?auto_18260 ) ) ( ON_BOARD ?auto_18266 ?auto_18265 ) ( not ( = ?auto_18264 ?auto_18266 ) ) ( SUPPORTS ?auto_18266 ?auto_18259 ) ( not ( = ?auto_18261 ?auto_18259 ) ) ( not ( = ?auto_18258 ?auto_18259 ) ) ( POINTING ?auto_18265 ?auto_18263 ) ( CALIBRATION_TARGET ?auto_18266 ?auto_18263 ) ( POWER_AVAIL ?auto_18265 ) )
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
      ?auto_18335 - DIRECTION
      ?auto_18336 - INSTRUMENT
      ?auto_18337 - SATELLITE
      ?auto_18332 - DIRECTION
      ?auto_18334 - MODE
      ?auto_18333 - DIRECTION
      ?auto_18338 - INSTRUMENT
      ?auto_18331 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_18329 ?auto_18335 ) ) ( ON_BOARD ?auto_18336 ?auto_18337 ) ( SUPPORTS ?auto_18336 ?auto_18330 ) ( not ( = ?auto_18329 ?auto_18332 ) ) ( HAVE_IMAGE ?auto_18335 ?auto_18334 ) ( not ( = ?auto_18335 ?auto_18332 ) ) ( not ( = ?auto_18334 ?auto_18330 ) ) ( CALIBRATION_TARGET ?auto_18336 ?auto_18332 ) ( not ( = ?auto_18332 ?auto_18333 ) ) ( not ( = ?auto_18329 ?auto_18333 ) ) ( not ( = ?auto_18335 ?auto_18333 ) ) ( ON_BOARD ?auto_18338 ?auto_18337 ) ( not ( = ?auto_18336 ?auto_18338 ) ) ( SUPPORTS ?auto_18338 ?auto_18331 ) ( not ( = ?auto_18334 ?auto_18331 ) ) ( not ( = ?auto_18330 ?auto_18331 ) ) ( CALIBRATION_TARGET ?auto_18338 ?auto_18332 ) ( POWER_AVAIL ?auto_18337 ) ( POINTING ?auto_18337 ?auto_18335 ) )
    :subtasks
    ( ( !TURN_TO ?auto_18337 ?auto_18332 ?auto_18335 )
      ( GET-2IMAGE ?auto_18335 ?auto_18334 ?auto_18329 ?auto_18330 )
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
      ?auto_18343 - SATELLITE
      ?auto_18348 - DIRECTION
      ?auto_18347 - DIRECTION
      ?auto_18346 - INSTRUMENT
      ?auto_18345 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_18342 ?auto_18339 ) ) ( ON_BOARD ?auto_18344 ?auto_18343 ) ( SUPPORTS ?auto_18344 ?auto_18341 ) ( not ( = ?auto_18342 ?auto_18348 ) ) ( HAVE_IMAGE ?auto_18339 ?auto_18340 ) ( not ( = ?auto_18339 ?auto_18348 ) ) ( not ( = ?auto_18340 ?auto_18341 ) ) ( CALIBRATION_TARGET ?auto_18344 ?auto_18348 ) ( not ( = ?auto_18348 ?auto_18347 ) ) ( not ( = ?auto_18342 ?auto_18347 ) ) ( not ( = ?auto_18339 ?auto_18347 ) ) ( ON_BOARD ?auto_18346 ?auto_18343 ) ( not ( = ?auto_18344 ?auto_18346 ) ) ( SUPPORTS ?auto_18346 ?auto_18345 ) ( not ( = ?auto_18340 ?auto_18345 ) ) ( not ( = ?auto_18341 ?auto_18345 ) ) ( CALIBRATION_TARGET ?auto_18346 ?auto_18348 ) ( POWER_AVAIL ?auto_18343 ) ( POINTING ?auto_18343 ?auto_18339 ) )
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
      ?auto_18357 - DIRECTION
      ?auto_18353 - INSTRUMENT
      ?auto_18354 - SATELLITE
      ?auto_18358 - DIRECTION
      ?auto_18356 - MODE
      ?auto_18355 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18352 ?auto_18349 ) ) ( not ( = ?auto_18352 ?auto_18357 ) ) ( ON_BOARD ?auto_18353 ?auto_18354 ) ( SUPPORTS ?auto_18353 ?auto_18351 ) ( not ( = ?auto_18352 ?auto_18358 ) ) ( HAVE_IMAGE ?auto_18357 ?auto_18356 ) ( not ( = ?auto_18357 ?auto_18358 ) ) ( not ( = ?auto_18356 ?auto_18351 ) ) ( CALIBRATION_TARGET ?auto_18353 ?auto_18358 ) ( not ( = ?auto_18358 ?auto_18349 ) ) ( not ( = ?auto_18357 ?auto_18349 ) ) ( ON_BOARD ?auto_18355 ?auto_18354 ) ( not ( = ?auto_18353 ?auto_18355 ) ) ( SUPPORTS ?auto_18355 ?auto_18350 ) ( not ( = ?auto_18356 ?auto_18350 ) ) ( not ( = ?auto_18351 ?auto_18350 ) ) ( CALIBRATION_TARGET ?auto_18355 ?auto_18358 ) ( POWER_AVAIL ?auto_18354 ) ( POINTING ?auto_18354 ?auto_18357 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18357 ?auto_18356 ?auto_18352 ?auto_18351 )
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
      ?auto_18364 - INSTRUMENT
      ?auto_18365 - SATELLITE
      ?auto_18368 - DIRECTION
      ?auto_18363 - DIRECTION
      ?auto_18366 - INSTRUMENT
      ?auto_18367 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_18362 ?auto_18359 ) ) ( ON_BOARD ?auto_18364 ?auto_18365 ) ( SUPPORTS ?auto_18364 ?auto_18360 ) ( not ( = ?auto_18359 ?auto_18368 ) ) ( HAVE_IMAGE ?auto_18362 ?auto_18361 ) ( not ( = ?auto_18362 ?auto_18368 ) ) ( not ( = ?auto_18361 ?auto_18360 ) ) ( CALIBRATION_TARGET ?auto_18364 ?auto_18368 ) ( not ( = ?auto_18368 ?auto_18363 ) ) ( not ( = ?auto_18359 ?auto_18363 ) ) ( not ( = ?auto_18362 ?auto_18363 ) ) ( ON_BOARD ?auto_18366 ?auto_18365 ) ( not ( = ?auto_18364 ?auto_18366 ) ) ( SUPPORTS ?auto_18366 ?auto_18367 ) ( not ( = ?auto_18361 ?auto_18367 ) ) ( not ( = ?auto_18360 ?auto_18367 ) ) ( CALIBRATION_TARGET ?auto_18366 ?auto_18368 ) ( POWER_AVAIL ?auto_18365 ) ( POINTING ?auto_18365 ?auto_18362 ) )
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
      ?auto_18377 - DIRECTION
      ?auto_18373 - INSTRUMENT
      ?auto_18374 - SATELLITE
      ?auto_18378 - DIRECTION
      ?auto_18376 - MODE
      ?auto_18375 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18372 ?auto_18369 ) ) ( not ( = ?auto_18369 ?auto_18377 ) ) ( ON_BOARD ?auto_18373 ?auto_18374 ) ( SUPPORTS ?auto_18373 ?auto_18370 ) ( not ( = ?auto_18369 ?auto_18378 ) ) ( HAVE_IMAGE ?auto_18377 ?auto_18376 ) ( not ( = ?auto_18377 ?auto_18378 ) ) ( not ( = ?auto_18376 ?auto_18370 ) ) ( CALIBRATION_TARGET ?auto_18373 ?auto_18378 ) ( not ( = ?auto_18378 ?auto_18372 ) ) ( not ( = ?auto_18377 ?auto_18372 ) ) ( ON_BOARD ?auto_18375 ?auto_18374 ) ( not ( = ?auto_18373 ?auto_18375 ) ) ( SUPPORTS ?auto_18375 ?auto_18371 ) ( not ( = ?auto_18376 ?auto_18371 ) ) ( not ( = ?auto_18370 ?auto_18371 ) ) ( CALIBRATION_TARGET ?auto_18375 ?auto_18378 ) ( POWER_AVAIL ?auto_18374 ) ( POINTING ?auto_18374 ?auto_18377 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18377 ?auto_18376 ?auto_18369 ?auto_18370 )
      ( GET-2IMAGE-VERIFY ?auto_18369 ?auto_18370 ?auto_18372 ?auto_18371 ) )
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
      ?auto_18409 - INSTRUMENT
      ?auto_18410 - SATELLITE
      ?auto_18412 - DIRECTION
      ?auto_18411 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18406 ?auto_18403 ) ) ( not ( = ?auto_18408 ?auto_18403 ) ) ( not ( = ?auto_18408 ?auto_18406 ) ) ( ON_BOARD ?auto_18409 ?auto_18410 ) ( SUPPORTS ?auto_18409 ?auto_18407 ) ( not ( = ?auto_18408 ?auto_18412 ) ) ( HAVE_IMAGE ?auto_18403 ?auto_18404 ) ( not ( = ?auto_18403 ?auto_18412 ) ) ( not ( = ?auto_18404 ?auto_18407 ) ) ( CALIBRATION_TARGET ?auto_18409 ?auto_18412 ) ( not ( = ?auto_18412 ?auto_18406 ) ) ( ON_BOARD ?auto_18411 ?auto_18410 ) ( not ( = ?auto_18409 ?auto_18411 ) ) ( SUPPORTS ?auto_18411 ?auto_18405 ) ( not ( = ?auto_18404 ?auto_18405 ) ) ( not ( = ?auto_18407 ?auto_18405 ) ) ( CALIBRATION_TARGET ?auto_18411 ?auto_18412 ) ( POWER_AVAIL ?auto_18410 ) ( POINTING ?auto_18410 ?auto_18403 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18403 ?auto_18404 ?auto_18408 ?auto_18407 )
      ( GET-3IMAGE-VERIFY ?auto_18403 ?auto_18404 ?auto_18406 ?auto_18405 ?auto_18408 ?auto_18407 ) )
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
      ?auto_18431 - INSTRUMENT
      ?auto_18432 - SATELLITE
      ?auto_18434 - DIRECTION
      ?auto_18433 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18428 ?auto_18425 ) ) ( not ( = ?auto_18430 ?auto_18425 ) ) ( not ( = ?auto_18430 ?auto_18428 ) ) ( ON_BOARD ?auto_18431 ?auto_18432 ) ( SUPPORTS ?auto_18431 ?auto_18427 ) ( not ( = ?auto_18428 ?auto_18434 ) ) ( HAVE_IMAGE ?auto_18425 ?auto_18426 ) ( not ( = ?auto_18425 ?auto_18434 ) ) ( not ( = ?auto_18426 ?auto_18427 ) ) ( CALIBRATION_TARGET ?auto_18431 ?auto_18434 ) ( not ( = ?auto_18434 ?auto_18430 ) ) ( ON_BOARD ?auto_18433 ?auto_18432 ) ( not ( = ?auto_18431 ?auto_18433 ) ) ( SUPPORTS ?auto_18433 ?auto_18429 ) ( not ( = ?auto_18426 ?auto_18429 ) ) ( not ( = ?auto_18427 ?auto_18429 ) ) ( CALIBRATION_TARGET ?auto_18433 ?auto_18434 ) ( POWER_AVAIL ?auto_18432 ) ( POINTING ?auto_18432 ?auto_18425 ) )
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
      ?auto_18453 - INSTRUMENT
      ?auto_18454 - SATELLITE
      ?auto_18456 - DIRECTION
      ?auto_18455 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18450 ?auto_18447 ) ) ( not ( = ?auto_18452 ?auto_18447 ) ) ( not ( = ?auto_18452 ?auto_18450 ) ) ( ON_BOARD ?auto_18453 ?auto_18454 ) ( SUPPORTS ?auto_18453 ?auto_18451 ) ( not ( = ?auto_18452 ?auto_18456 ) ) ( HAVE_IMAGE ?auto_18450 ?auto_18449 ) ( not ( = ?auto_18450 ?auto_18456 ) ) ( not ( = ?auto_18449 ?auto_18451 ) ) ( CALIBRATION_TARGET ?auto_18453 ?auto_18456 ) ( not ( = ?auto_18456 ?auto_18447 ) ) ( ON_BOARD ?auto_18455 ?auto_18454 ) ( not ( = ?auto_18453 ?auto_18455 ) ) ( SUPPORTS ?auto_18455 ?auto_18448 ) ( not ( = ?auto_18449 ?auto_18448 ) ) ( not ( = ?auto_18451 ?auto_18448 ) ) ( CALIBRATION_TARGET ?auto_18455 ?auto_18456 ) ( POWER_AVAIL ?auto_18454 ) ( POINTING ?auto_18454 ?auto_18450 ) )
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
      ?auto_18475 - INSTRUMENT
      ?auto_18476 - SATELLITE
      ?auto_18478 - DIRECTION
      ?auto_18477 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18472 ?auto_18469 ) ) ( not ( = ?auto_18474 ?auto_18469 ) ) ( not ( = ?auto_18474 ?auto_18472 ) ) ( ON_BOARD ?auto_18475 ?auto_18476 ) ( SUPPORTS ?auto_18475 ?auto_18471 ) ( not ( = ?auto_18472 ?auto_18478 ) ) ( HAVE_IMAGE ?auto_18474 ?auto_18473 ) ( not ( = ?auto_18474 ?auto_18478 ) ) ( not ( = ?auto_18473 ?auto_18471 ) ) ( CALIBRATION_TARGET ?auto_18475 ?auto_18478 ) ( not ( = ?auto_18478 ?auto_18469 ) ) ( ON_BOARD ?auto_18477 ?auto_18476 ) ( not ( = ?auto_18475 ?auto_18477 ) ) ( SUPPORTS ?auto_18477 ?auto_18470 ) ( not ( = ?auto_18473 ?auto_18470 ) ) ( not ( = ?auto_18471 ?auto_18470 ) ) ( CALIBRATION_TARGET ?auto_18477 ?auto_18478 ) ( POWER_AVAIL ?auto_18476 ) ( POINTING ?auto_18476 ?auto_18474 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18474 ?auto_18473 ?auto_18472 ?auto_18471 )
      ( GET-3IMAGE-VERIFY ?auto_18469 ?auto_18470 ?auto_18472 ?auto_18471 ?auto_18474 ?auto_18473 ) )
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
      ?auto_18521 - INSTRUMENT
      ?auto_18522 - SATELLITE
      ?auto_18524 - DIRECTION
      ?auto_18523 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18518 ?auto_18515 ) ) ( not ( = ?auto_18520 ?auto_18515 ) ) ( not ( = ?auto_18520 ?auto_18518 ) ) ( ON_BOARD ?auto_18521 ?auto_18522 ) ( SUPPORTS ?auto_18521 ?auto_18516 ) ( not ( = ?auto_18515 ?auto_18524 ) ) ( HAVE_IMAGE ?auto_18518 ?auto_18517 ) ( not ( = ?auto_18518 ?auto_18524 ) ) ( not ( = ?auto_18517 ?auto_18516 ) ) ( CALIBRATION_TARGET ?auto_18521 ?auto_18524 ) ( not ( = ?auto_18524 ?auto_18520 ) ) ( ON_BOARD ?auto_18523 ?auto_18522 ) ( not ( = ?auto_18521 ?auto_18523 ) ) ( SUPPORTS ?auto_18523 ?auto_18519 ) ( not ( = ?auto_18517 ?auto_18519 ) ) ( not ( = ?auto_18516 ?auto_18519 ) ) ( CALIBRATION_TARGET ?auto_18523 ?auto_18524 ) ( POWER_AVAIL ?auto_18522 ) ( POINTING ?auto_18522 ?auto_18518 ) )
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
      ?auto_18543 - INSTRUMENT
      ?auto_18544 - SATELLITE
      ?auto_18546 - DIRECTION
      ?auto_18545 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18540 ?auto_18537 ) ) ( not ( = ?auto_18542 ?auto_18537 ) ) ( not ( = ?auto_18542 ?auto_18540 ) ) ( ON_BOARD ?auto_18543 ?auto_18544 ) ( SUPPORTS ?auto_18543 ?auto_18538 ) ( not ( = ?auto_18537 ?auto_18546 ) ) ( HAVE_IMAGE ?auto_18542 ?auto_18541 ) ( not ( = ?auto_18542 ?auto_18546 ) ) ( not ( = ?auto_18541 ?auto_18538 ) ) ( CALIBRATION_TARGET ?auto_18543 ?auto_18546 ) ( not ( = ?auto_18546 ?auto_18540 ) ) ( ON_BOARD ?auto_18545 ?auto_18544 ) ( not ( = ?auto_18543 ?auto_18545 ) ) ( SUPPORTS ?auto_18545 ?auto_18539 ) ( not ( = ?auto_18541 ?auto_18539 ) ) ( not ( = ?auto_18538 ?auto_18539 ) ) ( CALIBRATION_TARGET ?auto_18545 ?auto_18546 ) ( POWER_AVAIL ?auto_18544 ) ( POINTING ?auto_18544 ?auto_18542 ) )
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
      ?auto_18616 - DIRECTION
      ?auto_18612 - INSTRUMENT
      ?auto_18613 - SATELLITE
      ?auto_18618 - DIRECTION
      ?auto_18615 - MODE
      ?auto_18611 - DIRECTION
      ?auto_18614 - INSTRUMENT
      ?auto_18617 - MODE
      ?auto_18619 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18609 ?auto_18616 ) ) ( ON_BOARD ?auto_18612 ?auto_18613 ) ( SUPPORTS ?auto_18612 ?auto_18610 ) ( not ( = ?auto_18609 ?auto_18618 ) ) ( HAVE_IMAGE ?auto_18616 ?auto_18615 ) ( not ( = ?auto_18616 ?auto_18618 ) ) ( not ( = ?auto_18615 ?auto_18610 ) ) ( CALIBRATION_TARGET ?auto_18612 ?auto_18618 ) ( not ( = ?auto_18618 ?auto_18611 ) ) ( not ( = ?auto_18609 ?auto_18611 ) ) ( not ( = ?auto_18616 ?auto_18611 ) ) ( ON_BOARD ?auto_18614 ?auto_18613 ) ( not ( = ?auto_18612 ?auto_18614 ) ) ( SUPPORTS ?auto_18614 ?auto_18617 ) ( not ( = ?auto_18615 ?auto_18617 ) ) ( not ( = ?auto_18610 ?auto_18617 ) ) ( CALIBRATION_TARGET ?auto_18614 ?auto_18618 ) ( POINTING ?auto_18613 ?auto_18616 ) ( ON_BOARD ?auto_18619 ?auto_18613 ) ( POWER_ON ?auto_18619 ) ( not ( = ?auto_18612 ?auto_18619 ) ) ( not ( = ?auto_18614 ?auto_18619 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_18619 ?auto_18613 )
      ( GET-2IMAGE ?auto_18616 ?auto_18615 ?auto_18609 ?auto_18610 )
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
      ?auto_18625 - INSTRUMENT
      ?auto_18629 - SATELLITE
      ?auto_18630 - DIRECTION
      ?auto_18624 - DIRECTION
      ?auto_18627 - INSTRUMENT
      ?auto_18626 - MODE
      ?auto_18628 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18623 ?auto_18620 ) ) ( ON_BOARD ?auto_18625 ?auto_18629 ) ( SUPPORTS ?auto_18625 ?auto_18622 ) ( not ( = ?auto_18623 ?auto_18630 ) ) ( HAVE_IMAGE ?auto_18620 ?auto_18621 ) ( not ( = ?auto_18620 ?auto_18630 ) ) ( not ( = ?auto_18621 ?auto_18622 ) ) ( CALIBRATION_TARGET ?auto_18625 ?auto_18630 ) ( not ( = ?auto_18630 ?auto_18624 ) ) ( not ( = ?auto_18623 ?auto_18624 ) ) ( not ( = ?auto_18620 ?auto_18624 ) ) ( ON_BOARD ?auto_18627 ?auto_18629 ) ( not ( = ?auto_18625 ?auto_18627 ) ) ( SUPPORTS ?auto_18627 ?auto_18626 ) ( not ( = ?auto_18621 ?auto_18626 ) ) ( not ( = ?auto_18622 ?auto_18626 ) ) ( CALIBRATION_TARGET ?auto_18627 ?auto_18630 ) ( POINTING ?auto_18629 ?auto_18620 ) ( ON_BOARD ?auto_18628 ?auto_18629 ) ( POWER_ON ?auto_18628 ) ( not ( = ?auto_18625 ?auto_18628 ) ) ( not ( = ?auto_18627 ?auto_18628 ) ) )
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
      ?auto_18636 - DIRECTION
      ?auto_18637 - INSTRUMENT
      ?auto_18638 - SATELLITE
      ?auto_18641 - DIRECTION
      ?auto_18635 - MODE
      ?auto_18639 - INSTRUMENT
      ?auto_18640 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18634 ?auto_18631 ) ) ( not ( = ?auto_18634 ?auto_18636 ) ) ( ON_BOARD ?auto_18637 ?auto_18638 ) ( SUPPORTS ?auto_18637 ?auto_18633 ) ( not ( = ?auto_18634 ?auto_18641 ) ) ( HAVE_IMAGE ?auto_18636 ?auto_18635 ) ( not ( = ?auto_18636 ?auto_18641 ) ) ( not ( = ?auto_18635 ?auto_18633 ) ) ( CALIBRATION_TARGET ?auto_18637 ?auto_18641 ) ( not ( = ?auto_18641 ?auto_18631 ) ) ( not ( = ?auto_18636 ?auto_18631 ) ) ( ON_BOARD ?auto_18639 ?auto_18638 ) ( not ( = ?auto_18637 ?auto_18639 ) ) ( SUPPORTS ?auto_18639 ?auto_18632 ) ( not ( = ?auto_18635 ?auto_18632 ) ) ( not ( = ?auto_18633 ?auto_18632 ) ) ( CALIBRATION_TARGET ?auto_18639 ?auto_18641 ) ( POINTING ?auto_18638 ?auto_18636 ) ( ON_BOARD ?auto_18640 ?auto_18638 ) ( POWER_ON ?auto_18640 ) ( not ( = ?auto_18637 ?auto_18640 ) ) ( not ( = ?auto_18639 ?auto_18640 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18636 ?auto_18635 ?auto_18634 ?auto_18633 )
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
      ?auto_18646 - INSTRUMENT
      ?auto_18649 - SATELLITE
      ?auto_18652 - DIRECTION
      ?auto_18647 - DIRECTION
      ?auto_18650 - INSTRUMENT
      ?auto_18648 - MODE
      ?auto_18651 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18645 ?auto_18642 ) ) ( ON_BOARD ?auto_18646 ?auto_18649 ) ( SUPPORTS ?auto_18646 ?auto_18643 ) ( not ( = ?auto_18642 ?auto_18652 ) ) ( HAVE_IMAGE ?auto_18645 ?auto_18644 ) ( not ( = ?auto_18645 ?auto_18652 ) ) ( not ( = ?auto_18644 ?auto_18643 ) ) ( CALIBRATION_TARGET ?auto_18646 ?auto_18652 ) ( not ( = ?auto_18652 ?auto_18647 ) ) ( not ( = ?auto_18642 ?auto_18647 ) ) ( not ( = ?auto_18645 ?auto_18647 ) ) ( ON_BOARD ?auto_18650 ?auto_18649 ) ( not ( = ?auto_18646 ?auto_18650 ) ) ( SUPPORTS ?auto_18650 ?auto_18648 ) ( not ( = ?auto_18644 ?auto_18648 ) ) ( not ( = ?auto_18643 ?auto_18648 ) ) ( CALIBRATION_TARGET ?auto_18650 ?auto_18652 ) ( POINTING ?auto_18649 ?auto_18645 ) ( ON_BOARD ?auto_18651 ?auto_18649 ) ( POWER_ON ?auto_18651 ) ( not ( = ?auto_18646 ?auto_18651 ) ) ( not ( = ?auto_18650 ?auto_18651 ) ) )
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
      ?auto_18658 - DIRECTION
      ?auto_18659 - INSTRUMENT
      ?auto_18660 - SATELLITE
      ?auto_18663 - DIRECTION
      ?auto_18657 - MODE
      ?auto_18661 - INSTRUMENT
      ?auto_18662 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18656 ?auto_18653 ) ) ( not ( = ?auto_18653 ?auto_18658 ) ) ( ON_BOARD ?auto_18659 ?auto_18660 ) ( SUPPORTS ?auto_18659 ?auto_18654 ) ( not ( = ?auto_18653 ?auto_18663 ) ) ( HAVE_IMAGE ?auto_18658 ?auto_18657 ) ( not ( = ?auto_18658 ?auto_18663 ) ) ( not ( = ?auto_18657 ?auto_18654 ) ) ( CALIBRATION_TARGET ?auto_18659 ?auto_18663 ) ( not ( = ?auto_18663 ?auto_18656 ) ) ( not ( = ?auto_18658 ?auto_18656 ) ) ( ON_BOARD ?auto_18661 ?auto_18660 ) ( not ( = ?auto_18659 ?auto_18661 ) ) ( SUPPORTS ?auto_18661 ?auto_18655 ) ( not ( = ?auto_18657 ?auto_18655 ) ) ( not ( = ?auto_18654 ?auto_18655 ) ) ( CALIBRATION_TARGET ?auto_18661 ?auto_18663 ) ( POINTING ?auto_18660 ?auto_18658 ) ( ON_BOARD ?auto_18662 ?auto_18660 ) ( POWER_ON ?auto_18662 ) ( not ( = ?auto_18659 ?auto_18662 ) ) ( not ( = ?auto_18661 ?auto_18662 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18658 ?auto_18657 ?auto_18653 ?auto_18654 )
      ( GET-2IMAGE-VERIFY ?auto_18653 ?auto_18654 ?auto_18656 ?auto_18655 ) )
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
      ?auto_18696 - INSTRUMENT
      ?auto_18697 - SATELLITE
      ?auto_18700 - DIRECTION
      ?auto_18698 - INSTRUMENT
      ?auto_18699 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18693 ?auto_18690 ) ) ( not ( = ?auto_18695 ?auto_18690 ) ) ( not ( = ?auto_18695 ?auto_18693 ) ) ( ON_BOARD ?auto_18696 ?auto_18697 ) ( SUPPORTS ?auto_18696 ?auto_18694 ) ( not ( = ?auto_18695 ?auto_18700 ) ) ( HAVE_IMAGE ?auto_18690 ?auto_18691 ) ( not ( = ?auto_18690 ?auto_18700 ) ) ( not ( = ?auto_18691 ?auto_18694 ) ) ( CALIBRATION_TARGET ?auto_18696 ?auto_18700 ) ( not ( = ?auto_18700 ?auto_18693 ) ) ( ON_BOARD ?auto_18698 ?auto_18697 ) ( not ( = ?auto_18696 ?auto_18698 ) ) ( SUPPORTS ?auto_18698 ?auto_18692 ) ( not ( = ?auto_18691 ?auto_18692 ) ) ( not ( = ?auto_18694 ?auto_18692 ) ) ( CALIBRATION_TARGET ?auto_18698 ?auto_18700 ) ( POINTING ?auto_18697 ?auto_18690 ) ( ON_BOARD ?auto_18699 ?auto_18697 ) ( POWER_ON ?auto_18699 ) ( not ( = ?auto_18696 ?auto_18699 ) ) ( not ( = ?auto_18698 ?auto_18699 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18690 ?auto_18691 ?auto_18695 ?auto_18694 )
      ( GET-3IMAGE-VERIFY ?auto_18690 ?auto_18691 ?auto_18693 ?auto_18692 ?auto_18695 ?auto_18694 ) )
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
      ?auto_18720 - INSTRUMENT
      ?auto_18721 - SATELLITE
      ?auto_18724 - DIRECTION
      ?auto_18722 - INSTRUMENT
      ?auto_18723 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18717 ?auto_18714 ) ) ( not ( = ?auto_18719 ?auto_18714 ) ) ( not ( = ?auto_18719 ?auto_18717 ) ) ( ON_BOARD ?auto_18720 ?auto_18721 ) ( SUPPORTS ?auto_18720 ?auto_18716 ) ( not ( = ?auto_18717 ?auto_18724 ) ) ( HAVE_IMAGE ?auto_18714 ?auto_18715 ) ( not ( = ?auto_18714 ?auto_18724 ) ) ( not ( = ?auto_18715 ?auto_18716 ) ) ( CALIBRATION_TARGET ?auto_18720 ?auto_18724 ) ( not ( = ?auto_18724 ?auto_18719 ) ) ( ON_BOARD ?auto_18722 ?auto_18721 ) ( not ( = ?auto_18720 ?auto_18722 ) ) ( SUPPORTS ?auto_18722 ?auto_18718 ) ( not ( = ?auto_18715 ?auto_18718 ) ) ( not ( = ?auto_18716 ?auto_18718 ) ) ( CALIBRATION_TARGET ?auto_18722 ?auto_18724 ) ( POINTING ?auto_18721 ?auto_18714 ) ( ON_BOARD ?auto_18723 ?auto_18721 ) ( POWER_ON ?auto_18723 ) ( not ( = ?auto_18720 ?auto_18723 ) ) ( not ( = ?auto_18722 ?auto_18723 ) ) )
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
      ?auto_18744 - INSTRUMENT
      ?auto_18745 - SATELLITE
      ?auto_18748 - DIRECTION
      ?auto_18746 - INSTRUMENT
      ?auto_18747 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18741 ?auto_18738 ) ) ( not ( = ?auto_18743 ?auto_18738 ) ) ( not ( = ?auto_18743 ?auto_18741 ) ) ( ON_BOARD ?auto_18744 ?auto_18745 ) ( SUPPORTS ?auto_18744 ?auto_18742 ) ( not ( = ?auto_18743 ?auto_18748 ) ) ( HAVE_IMAGE ?auto_18741 ?auto_18740 ) ( not ( = ?auto_18741 ?auto_18748 ) ) ( not ( = ?auto_18740 ?auto_18742 ) ) ( CALIBRATION_TARGET ?auto_18744 ?auto_18748 ) ( not ( = ?auto_18748 ?auto_18738 ) ) ( ON_BOARD ?auto_18746 ?auto_18745 ) ( not ( = ?auto_18744 ?auto_18746 ) ) ( SUPPORTS ?auto_18746 ?auto_18739 ) ( not ( = ?auto_18740 ?auto_18739 ) ) ( not ( = ?auto_18742 ?auto_18739 ) ) ( CALIBRATION_TARGET ?auto_18746 ?auto_18748 ) ( POINTING ?auto_18745 ?auto_18741 ) ( ON_BOARD ?auto_18747 ?auto_18745 ) ( POWER_ON ?auto_18747 ) ( not ( = ?auto_18744 ?auto_18747 ) ) ( not ( = ?auto_18746 ?auto_18747 ) ) )
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
      ?auto_18768 - INSTRUMENT
      ?auto_18769 - SATELLITE
      ?auto_18772 - DIRECTION
      ?auto_18770 - INSTRUMENT
      ?auto_18771 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18765 ?auto_18762 ) ) ( not ( = ?auto_18767 ?auto_18762 ) ) ( not ( = ?auto_18767 ?auto_18765 ) ) ( ON_BOARD ?auto_18768 ?auto_18769 ) ( SUPPORTS ?auto_18768 ?auto_18764 ) ( not ( = ?auto_18765 ?auto_18772 ) ) ( HAVE_IMAGE ?auto_18767 ?auto_18766 ) ( not ( = ?auto_18767 ?auto_18772 ) ) ( not ( = ?auto_18766 ?auto_18764 ) ) ( CALIBRATION_TARGET ?auto_18768 ?auto_18772 ) ( not ( = ?auto_18772 ?auto_18762 ) ) ( ON_BOARD ?auto_18770 ?auto_18769 ) ( not ( = ?auto_18768 ?auto_18770 ) ) ( SUPPORTS ?auto_18770 ?auto_18763 ) ( not ( = ?auto_18766 ?auto_18763 ) ) ( not ( = ?auto_18764 ?auto_18763 ) ) ( CALIBRATION_TARGET ?auto_18770 ?auto_18772 ) ( POINTING ?auto_18769 ?auto_18767 ) ( ON_BOARD ?auto_18771 ?auto_18769 ) ( POWER_ON ?auto_18771 ) ( not ( = ?auto_18768 ?auto_18771 ) ) ( not ( = ?auto_18770 ?auto_18771 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_18767 ?auto_18766 ?auto_18765 ?auto_18764 )
      ( GET-3IMAGE-VERIFY ?auto_18762 ?auto_18763 ?auto_18765 ?auto_18764 ?auto_18767 ?auto_18766 ) )
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
      ?auto_18818 - INSTRUMENT
      ?auto_18819 - SATELLITE
      ?auto_18822 - DIRECTION
      ?auto_18820 - INSTRUMENT
      ?auto_18821 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18815 ?auto_18812 ) ) ( not ( = ?auto_18817 ?auto_18812 ) ) ( not ( = ?auto_18817 ?auto_18815 ) ) ( ON_BOARD ?auto_18818 ?auto_18819 ) ( SUPPORTS ?auto_18818 ?auto_18813 ) ( not ( = ?auto_18812 ?auto_18822 ) ) ( HAVE_IMAGE ?auto_18815 ?auto_18814 ) ( not ( = ?auto_18815 ?auto_18822 ) ) ( not ( = ?auto_18814 ?auto_18813 ) ) ( CALIBRATION_TARGET ?auto_18818 ?auto_18822 ) ( not ( = ?auto_18822 ?auto_18817 ) ) ( ON_BOARD ?auto_18820 ?auto_18819 ) ( not ( = ?auto_18818 ?auto_18820 ) ) ( SUPPORTS ?auto_18820 ?auto_18816 ) ( not ( = ?auto_18814 ?auto_18816 ) ) ( not ( = ?auto_18813 ?auto_18816 ) ) ( CALIBRATION_TARGET ?auto_18820 ?auto_18822 ) ( POINTING ?auto_18819 ?auto_18815 ) ( ON_BOARD ?auto_18821 ?auto_18819 ) ( POWER_ON ?auto_18821 ) ( not ( = ?auto_18818 ?auto_18821 ) ) ( not ( = ?auto_18820 ?auto_18821 ) ) )
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
      ?auto_18842 - INSTRUMENT
      ?auto_18843 - SATELLITE
      ?auto_18846 - DIRECTION
      ?auto_18844 - INSTRUMENT
      ?auto_18845 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18839 ?auto_18836 ) ) ( not ( = ?auto_18841 ?auto_18836 ) ) ( not ( = ?auto_18841 ?auto_18839 ) ) ( ON_BOARD ?auto_18842 ?auto_18843 ) ( SUPPORTS ?auto_18842 ?auto_18837 ) ( not ( = ?auto_18836 ?auto_18846 ) ) ( HAVE_IMAGE ?auto_18841 ?auto_18840 ) ( not ( = ?auto_18841 ?auto_18846 ) ) ( not ( = ?auto_18840 ?auto_18837 ) ) ( CALIBRATION_TARGET ?auto_18842 ?auto_18846 ) ( not ( = ?auto_18846 ?auto_18839 ) ) ( ON_BOARD ?auto_18844 ?auto_18843 ) ( not ( = ?auto_18842 ?auto_18844 ) ) ( SUPPORTS ?auto_18844 ?auto_18838 ) ( not ( = ?auto_18840 ?auto_18838 ) ) ( not ( = ?auto_18837 ?auto_18838 ) ) ( CALIBRATION_TARGET ?auto_18844 ?auto_18846 ) ( POINTING ?auto_18843 ?auto_18841 ) ( ON_BOARD ?auto_18845 ?auto_18843 ) ( POWER_ON ?auto_18845 ) ( not ( = ?auto_18842 ?auto_18845 ) ) ( not ( = ?auto_18844 ?auto_18845 ) ) )
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
      ?auto_18917 - DIRECTION
      ?auto_18918 - INSTRUMENT
      ?auto_18921 - SATELLITE
      ?auto_18924 - DIRECTION
      ?auto_18916 - MODE
      ?auto_18919 - DIRECTION
      ?auto_18922 - INSTRUMENT
      ?auto_18920 - MODE
      ?auto_18923 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18914 ?auto_18917 ) ) ( ON_BOARD ?auto_18918 ?auto_18921 ) ( SUPPORTS ?auto_18918 ?auto_18915 ) ( not ( = ?auto_18914 ?auto_18924 ) ) ( not ( = ?auto_18917 ?auto_18924 ) ) ( not ( = ?auto_18916 ?auto_18915 ) ) ( CALIBRATION_TARGET ?auto_18918 ?auto_18924 ) ( not ( = ?auto_18924 ?auto_18919 ) ) ( not ( = ?auto_18914 ?auto_18919 ) ) ( not ( = ?auto_18917 ?auto_18919 ) ) ( ON_BOARD ?auto_18922 ?auto_18921 ) ( not ( = ?auto_18918 ?auto_18922 ) ) ( SUPPORTS ?auto_18922 ?auto_18920 ) ( not ( = ?auto_18916 ?auto_18920 ) ) ( not ( = ?auto_18915 ?auto_18920 ) ) ( CALIBRATION_TARGET ?auto_18922 ?auto_18924 ) ( POINTING ?auto_18921 ?auto_18917 ) ( ON_BOARD ?auto_18923 ?auto_18921 ) ( POWER_ON ?auto_18923 ) ( not ( = ?auto_18918 ?auto_18923 ) ) ( not ( = ?auto_18922 ?auto_18923 ) ) ( CALIBRATED ?auto_18923 ) ( SUPPORTS ?auto_18923 ?auto_18916 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_18917 ?auto_18916 )
      ( GET-2IMAGE ?auto_18917 ?auto_18916 ?auto_18914 ?auto_18915 )
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
      ?auto_18934 - SATELLITE
      ?auto_18933 - DIRECTION
      ?auto_18929 - DIRECTION
      ?auto_18930 - INSTRUMENT
      ?auto_18931 - MODE
      ?auto_18932 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18928 ?auto_18925 ) ) ( ON_BOARD ?auto_18935 ?auto_18934 ) ( SUPPORTS ?auto_18935 ?auto_18927 ) ( not ( = ?auto_18928 ?auto_18933 ) ) ( not ( = ?auto_18925 ?auto_18933 ) ) ( not ( = ?auto_18926 ?auto_18927 ) ) ( CALIBRATION_TARGET ?auto_18935 ?auto_18933 ) ( not ( = ?auto_18933 ?auto_18929 ) ) ( not ( = ?auto_18928 ?auto_18929 ) ) ( not ( = ?auto_18925 ?auto_18929 ) ) ( ON_BOARD ?auto_18930 ?auto_18934 ) ( not ( = ?auto_18935 ?auto_18930 ) ) ( SUPPORTS ?auto_18930 ?auto_18931 ) ( not ( = ?auto_18926 ?auto_18931 ) ) ( not ( = ?auto_18927 ?auto_18931 ) ) ( CALIBRATION_TARGET ?auto_18930 ?auto_18933 ) ( POINTING ?auto_18934 ?auto_18925 ) ( ON_BOARD ?auto_18932 ?auto_18934 ) ( POWER_ON ?auto_18932 ) ( not ( = ?auto_18935 ?auto_18932 ) ) ( not ( = ?auto_18930 ?auto_18932 ) ) ( CALIBRATED ?auto_18932 ) ( SUPPORTS ?auto_18932 ?auto_18926 ) )
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
      ?auto_18946 - DIRECTION
      ?auto_18944 - INSTRUMENT
      ?auto_18943 - SATELLITE
      ?auto_18940 - DIRECTION
      ?auto_18945 - MODE
      ?auto_18942 - INSTRUMENT
      ?auto_18941 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18939 ?auto_18936 ) ) ( not ( = ?auto_18939 ?auto_18946 ) ) ( ON_BOARD ?auto_18944 ?auto_18943 ) ( SUPPORTS ?auto_18944 ?auto_18938 ) ( not ( = ?auto_18939 ?auto_18940 ) ) ( not ( = ?auto_18946 ?auto_18940 ) ) ( not ( = ?auto_18945 ?auto_18938 ) ) ( CALIBRATION_TARGET ?auto_18944 ?auto_18940 ) ( not ( = ?auto_18940 ?auto_18936 ) ) ( not ( = ?auto_18946 ?auto_18936 ) ) ( ON_BOARD ?auto_18942 ?auto_18943 ) ( not ( = ?auto_18944 ?auto_18942 ) ) ( SUPPORTS ?auto_18942 ?auto_18937 ) ( not ( = ?auto_18945 ?auto_18937 ) ) ( not ( = ?auto_18938 ?auto_18937 ) ) ( CALIBRATION_TARGET ?auto_18942 ?auto_18940 ) ( POINTING ?auto_18943 ?auto_18946 ) ( ON_BOARD ?auto_18941 ?auto_18943 ) ( POWER_ON ?auto_18941 ) ( not ( = ?auto_18944 ?auto_18941 ) ) ( not ( = ?auto_18942 ?auto_18941 ) ) ( CALIBRATED ?auto_18941 ) ( SUPPORTS ?auto_18941 ?auto_18945 ) )
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
      ?auto_18956 - INSTRUMENT
      ?auto_18955 - SATELLITE
      ?auto_18952 - DIRECTION
      ?auto_18951 - DIRECTION
      ?auto_18954 - INSTRUMENT
      ?auto_18957 - MODE
      ?auto_18953 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18950 ?auto_18947 ) ) ( ON_BOARD ?auto_18956 ?auto_18955 ) ( SUPPORTS ?auto_18956 ?auto_18948 ) ( not ( = ?auto_18947 ?auto_18952 ) ) ( not ( = ?auto_18950 ?auto_18952 ) ) ( not ( = ?auto_18949 ?auto_18948 ) ) ( CALIBRATION_TARGET ?auto_18956 ?auto_18952 ) ( not ( = ?auto_18952 ?auto_18951 ) ) ( not ( = ?auto_18947 ?auto_18951 ) ) ( not ( = ?auto_18950 ?auto_18951 ) ) ( ON_BOARD ?auto_18954 ?auto_18955 ) ( not ( = ?auto_18956 ?auto_18954 ) ) ( SUPPORTS ?auto_18954 ?auto_18957 ) ( not ( = ?auto_18949 ?auto_18957 ) ) ( not ( = ?auto_18948 ?auto_18957 ) ) ( CALIBRATION_TARGET ?auto_18954 ?auto_18952 ) ( POINTING ?auto_18955 ?auto_18950 ) ( ON_BOARD ?auto_18953 ?auto_18955 ) ( POWER_ON ?auto_18953 ) ( not ( = ?auto_18956 ?auto_18953 ) ) ( not ( = ?auto_18954 ?auto_18953 ) ) ( CALIBRATED ?auto_18953 ) ( SUPPORTS ?auto_18953 ?auto_18949 ) )
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
      ?auto_18968 - DIRECTION
      ?auto_18966 - INSTRUMENT
      ?auto_18965 - SATELLITE
      ?auto_18962 - DIRECTION
      ?auto_18967 - MODE
      ?auto_18964 - INSTRUMENT
      ?auto_18963 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18961 ?auto_18958 ) ) ( not ( = ?auto_18958 ?auto_18968 ) ) ( ON_BOARD ?auto_18966 ?auto_18965 ) ( SUPPORTS ?auto_18966 ?auto_18959 ) ( not ( = ?auto_18958 ?auto_18962 ) ) ( not ( = ?auto_18968 ?auto_18962 ) ) ( not ( = ?auto_18967 ?auto_18959 ) ) ( CALIBRATION_TARGET ?auto_18966 ?auto_18962 ) ( not ( = ?auto_18962 ?auto_18961 ) ) ( not ( = ?auto_18968 ?auto_18961 ) ) ( ON_BOARD ?auto_18964 ?auto_18965 ) ( not ( = ?auto_18966 ?auto_18964 ) ) ( SUPPORTS ?auto_18964 ?auto_18960 ) ( not ( = ?auto_18967 ?auto_18960 ) ) ( not ( = ?auto_18959 ?auto_18960 ) ) ( CALIBRATION_TARGET ?auto_18964 ?auto_18962 ) ( POINTING ?auto_18965 ?auto_18968 ) ( ON_BOARD ?auto_18963 ?auto_18965 ) ( POWER_ON ?auto_18963 ) ( not ( = ?auto_18966 ?auto_18963 ) ) ( not ( = ?auto_18964 ?auto_18963 ) ) ( CALIBRATED ?auto_18963 ) ( SUPPORTS ?auto_18963 ?auto_18967 ) )
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
      ?auto_19004 - SATELLITE
      ?auto_19001 - DIRECTION
      ?auto_19003 - INSTRUMENT
      ?auto_19002 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_18998 ?auto_18995 ) ) ( not ( = ?auto_19000 ?auto_18995 ) ) ( not ( = ?auto_19000 ?auto_18998 ) ) ( ON_BOARD ?auto_19005 ?auto_19004 ) ( SUPPORTS ?auto_19005 ?auto_18999 ) ( not ( = ?auto_19000 ?auto_19001 ) ) ( not ( = ?auto_18995 ?auto_19001 ) ) ( not ( = ?auto_18996 ?auto_18999 ) ) ( CALIBRATION_TARGET ?auto_19005 ?auto_19001 ) ( not ( = ?auto_19001 ?auto_18998 ) ) ( ON_BOARD ?auto_19003 ?auto_19004 ) ( not ( = ?auto_19005 ?auto_19003 ) ) ( SUPPORTS ?auto_19003 ?auto_18997 ) ( not ( = ?auto_18996 ?auto_18997 ) ) ( not ( = ?auto_18999 ?auto_18997 ) ) ( CALIBRATION_TARGET ?auto_19003 ?auto_19001 ) ( POINTING ?auto_19004 ?auto_18995 ) ( ON_BOARD ?auto_19002 ?auto_19004 ) ( POWER_ON ?auto_19002 ) ( not ( = ?auto_19005 ?auto_19002 ) ) ( not ( = ?auto_19003 ?auto_19002 ) ) ( CALIBRATED ?auto_19002 ) ( SUPPORTS ?auto_19002 ?auto_18996 ) )
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
      ?auto_19028 - SATELLITE
      ?auto_19025 - DIRECTION
      ?auto_19027 - INSTRUMENT
      ?auto_19026 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19022 ?auto_19019 ) ) ( not ( = ?auto_19024 ?auto_19019 ) ) ( not ( = ?auto_19024 ?auto_19022 ) ) ( ON_BOARD ?auto_19029 ?auto_19028 ) ( SUPPORTS ?auto_19029 ?auto_19021 ) ( not ( = ?auto_19022 ?auto_19025 ) ) ( not ( = ?auto_19019 ?auto_19025 ) ) ( not ( = ?auto_19020 ?auto_19021 ) ) ( CALIBRATION_TARGET ?auto_19029 ?auto_19025 ) ( not ( = ?auto_19025 ?auto_19024 ) ) ( ON_BOARD ?auto_19027 ?auto_19028 ) ( not ( = ?auto_19029 ?auto_19027 ) ) ( SUPPORTS ?auto_19027 ?auto_19023 ) ( not ( = ?auto_19020 ?auto_19023 ) ) ( not ( = ?auto_19021 ?auto_19023 ) ) ( CALIBRATION_TARGET ?auto_19027 ?auto_19025 ) ( POINTING ?auto_19028 ?auto_19019 ) ( ON_BOARD ?auto_19026 ?auto_19028 ) ( POWER_ON ?auto_19026 ) ( not ( = ?auto_19029 ?auto_19026 ) ) ( not ( = ?auto_19027 ?auto_19026 ) ) ( CALIBRATED ?auto_19026 ) ( SUPPORTS ?auto_19026 ?auto_19020 ) )
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
      ?auto_19052 - SATELLITE
      ?auto_19049 - DIRECTION
      ?auto_19051 - INSTRUMENT
      ?auto_19050 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19046 ?auto_19043 ) ) ( not ( = ?auto_19048 ?auto_19043 ) ) ( not ( = ?auto_19048 ?auto_19046 ) ) ( ON_BOARD ?auto_19053 ?auto_19052 ) ( SUPPORTS ?auto_19053 ?auto_19047 ) ( not ( = ?auto_19048 ?auto_19049 ) ) ( not ( = ?auto_19046 ?auto_19049 ) ) ( not ( = ?auto_19045 ?auto_19047 ) ) ( CALIBRATION_TARGET ?auto_19053 ?auto_19049 ) ( not ( = ?auto_19049 ?auto_19043 ) ) ( ON_BOARD ?auto_19051 ?auto_19052 ) ( not ( = ?auto_19053 ?auto_19051 ) ) ( SUPPORTS ?auto_19051 ?auto_19044 ) ( not ( = ?auto_19045 ?auto_19044 ) ) ( not ( = ?auto_19047 ?auto_19044 ) ) ( CALIBRATION_TARGET ?auto_19051 ?auto_19049 ) ( POINTING ?auto_19052 ?auto_19046 ) ( ON_BOARD ?auto_19050 ?auto_19052 ) ( POWER_ON ?auto_19050 ) ( not ( = ?auto_19053 ?auto_19050 ) ) ( not ( = ?auto_19051 ?auto_19050 ) ) ( CALIBRATED ?auto_19050 ) ( SUPPORTS ?auto_19050 ?auto_19045 ) )
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
      ?auto_19076 - SATELLITE
      ?auto_19073 - DIRECTION
      ?auto_19075 - INSTRUMENT
      ?auto_19074 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19070 ?auto_19067 ) ) ( not ( = ?auto_19072 ?auto_19067 ) ) ( not ( = ?auto_19072 ?auto_19070 ) ) ( ON_BOARD ?auto_19077 ?auto_19076 ) ( SUPPORTS ?auto_19077 ?auto_19069 ) ( not ( = ?auto_19070 ?auto_19073 ) ) ( not ( = ?auto_19072 ?auto_19073 ) ) ( not ( = ?auto_19071 ?auto_19069 ) ) ( CALIBRATION_TARGET ?auto_19077 ?auto_19073 ) ( not ( = ?auto_19073 ?auto_19067 ) ) ( ON_BOARD ?auto_19075 ?auto_19076 ) ( not ( = ?auto_19077 ?auto_19075 ) ) ( SUPPORTS ?auto_19075 ?auto_19068 ) ( not ( = ?auto_19071 ?auto_19068 ) ) ( not ( = ?auto_19069 ?auto_19068 ) ) ( CALIBRATION_TARGET ?auto_19075 ?auto_19073 ) ( POINTING ?auto_19076 ?auto_19072 ) ( ON_BOARD ?auto_19074 ?auto_19076 ) ( POWER_ON ?auto_19074 ) ( not ( = ?auto_19077 ?auto_19074 ) ) ( not ( = ?auto_19075 ?auto_19074 ) ) ( CALIBRATED ?auto_19074 ) ( SUPPORTS ?auto_19074 ?auto_19071 ) )
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
      ?auto_19126 - SATELLITE
      ?auto_19123 - DIRECTION
      ?auto_19125 - INSTRUMENT
      ?auto_19124 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19120 ?auto_19117 ) ) ( not ( = ?auto_19122 ?auto_19117 ) ) ( not ( = ?auto_19122 ?auto_19120 ) ) ( ON_BOARD ?auto_19127 ?auto_19126 ) ( SUPPORTS ?auto_19127 ?auto_19118 ) ( not ( = ?auto_19117 ?auto_19123 ) ) ( not ( = ?auto_19120 ?auto_19123 ) ) ( not ( = ?auto_19119 ?auto_19118 ) ) ( CALIBRATION_TARGET ?auto_19127 ?auto_19123 ) ( not ( = ?auto_19123 ?auto_19122 ) ) ( ON_BOARD ?auto_19125 ?auto_19126 ) ( not ( = ?auto_19127 ?auto_19125 ) ) ( SUPPORTS ?auto_19125 ?auto_19121 ) ( not ( = ?auto_19119 ?auto_19121 ) ) ( not ( = ?auto_19118 ?auto_19121 ) ) ( CALIBRATION_TARGET ?auto_19125 ?auto_19123 ) ( POINTING ?auto_19126 ?auto_19120 ) ( ON_BOARD ?auto_19124 ?auto_19126 ) ( POWER_ON ?auto_19124 ) ( not ( = ?auto_19127 ?auto_19124 ) ) ( not ( = ?auto_19125 ?auto_19124 ) ) ( CALIBRATED ?auto_19124 ) ( SUPPORTS ?auto_19124 ?auto_19119 ) )
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
      ?auto_19150 - SATELLITE
      ?auto_19147 - DIRECTION
      ?auto_19149 - INSTRUMENT
      ?auto_19148 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19144 ?auto_19141 ) ) ( not ( = ?auto_19146 ?auto_19141 ) ) ( not ( = ?auto_19146 ?auto_19144 ) ) ( ON_BOARD ?auto_19151 ?auto_19150 ) ( SUPPORTS ?auto_19151 ?auto_19142 ) ( not ( = ?auto_19141 ?auto_19147 ) ) ( not ( = ?auto_19146 ?auto_19147 ) ) ( not ( = ?auto_19145 ?auto_19142 ) ) ( CALIBRATION_TARGET ?auto_19151 ?auto_19147 ) ( not ( = ?auto_19147 ?auto_19144 ) ) ( ON_BOARD ?auto_19149 ?auto_19150 ) ( not ( = ?auto_19151 ?auto_19149 ) ) ( SUPPORTS ?auto_19149 ?auto_19143 ) ( not ( = ?auto_19145 ?auto_19143 ) ) ( not ( = ?auto_19142 ?auto_19143 ) ) ( CALIBRATION_TARGET ?auto_19149 ?auto_19147 ) ( POINTING ?auto_19150 ?auto_19146 ) ( ON_BOARD ?auto_19148 ?auto_19150 ) ( POWER_ON ?auto_19148 ) ( not ( = ?auto_19151 ?auto_19148 ) ) ( not ( = ?auto_19149 ?auto_19148 ) ) ( CALIBRATED ?auto_19148 ) ( SUPPORTS ?auto_19148 ?auto_19145 ) )
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
      ?auto_19229 - DIRECTION
      ?auto_19226 - INSTRUMENT
      ?auto_19225 - SATELLITE
      ?auto_19222 - DIRECTION
      ?auto_19228 - MODE
      ?auto_19221 - DIRECTION
      ?auto_19224 - INSTRUMENT
      ?auto_19227 - MODE
      ?auto_19223 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19219 ?auto_19229 ) ) ( ON_BOARD ?auto_19226 ?auto_19225 ) ( SUPPORTS ?auto_19226 ?auto_19220 ) ( not ( = ?auto_19219 ?auto_19222 ) ) ( not ( = ?auto_19229 ?auto_19222 ) ) ( not ( = ?auto_19228 ?auto_19220 ) ) ( CALIBRATION_TARGET ?auto_19226 ?auto_19222 ) ( not ( = ?auto_19222 ?auto_19221 ) ) ( not ( = ?auto_19219 ?auto_19221 ) ) ( not ( = ?auto_19229 ?auto_19221 ) ) ( ON_BOARD ?auto_19224 ?auto_19225 ) ( not ( = ?auto_19226 ?auto_19224 ) ) ( SUPPORTS ?auto_19224 ?auto_19227 ) ( not ( = ?auto_19228 ?auto_19227 ) ) ( not ( = ?auto_19220 ?auto_19227 ) ) ( CALIBRATION_TARGET ?auto_19224 ?auto_19222 ) ( ON_BOARD ?auto_19223 ?auto_19225 ) ( POWER_ON ?auto_19223 ) ( not ( = ?auto_19226 ?auto_19223 ) ) ( not ( = ?auto_19224 ?auto_19223 ) ) ( CALIBRATED ?auto_19223 ) ( SUPPORTS ?auto_19223 ?auto_19228 ) ( POINTING ?auto_19225 ?auto_19222 ) )
    :subtasks
    ( ( !TURN_TO ?auto_19225 ?auto_19229 ?auto_19222 )
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
      ?auto_19236 - INSTRUMENT
      ?auto_19234 - SATELLITE
      ?auto_19238 - DIRECTION
      ?auto_19240 - DIRECTION
      ?auto_19239 - INSTRUMENT
      ?auto_19235 - MODE
      ?auto_19237 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19233 ?auto_19230 ) ) ( ON_BOARD ?auto_19236 ?auto_19234 ) ( SUPPORTS ?auto_19236 ?auto_19232 ) ( not ( = ?auto_19233 ?auto_19238 ) ) ( not ( = ?auto_19230 ?auto_19238 ) ) ( not ( = ?auto_19231 ?auto_19232 ) ) ( CALIBRATION_TARGET ?auto_19236 ?auto_19238 ) ( not ( = ?auto_19238 ?auto_19240 ) ) ( not ( = ?auto_19233 ?auto_19240 ) ) ( not ( = ?auto_19230 ?auto_19240 ) ) ( ON_BOARD ?auto_19239 ?auto_19234 ) ( not ( = ?auto_19236 ?auto_19239 ) ) ( SUPPORTS ?auto_19239 ?auto_19235 ) ( not ( = ?auto_19231 ?auto_19235 ) ) ( not ( = ?auto_19232 ?auto_19235 ) ) ( CALIBRATION_TARGET ?auto_19239 ?auto_19238 ) ( ON_BOARD ?auto_19237 ?auto_19234 ) ( POWER_ON ?auto_19237 ) ( not ( = ?auto_19236 ?auto_19237 ) ) ( not ( = ?auto_19239 ?auto_19237 ) ) ( CALIBRATED ?auto_19237 ) ( SUPPORTS ?auto_19237 ?auto_19231 ) ( POINTING ?auto_19234 ?auto_19238 ) )
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
      ?auto_19251 - DIRECTION
      ?auto_19247 - INSTRUMENT
      ?auto_19246 - SATELLITE
      ?auto_19249 - DIRECTION
      ?auto_19250 - MODE
      ?auto_19248 - INSTRUMENT
      ?auto_19245 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19244 ?auto_19241 ) ) ( not ( = ?auto_19244 ?auto_19251 ) ) ( ON_BOARD ?auto_19247 ?auto_19246 ) ( SUPPORTS ?auto_19247 ?auto_19243 ) ( not ( = ?auto_19244 ?auto_19249 ) ) ( not ( = ?auto_19251 ?auto_19249 ) ) ( not ( = ?auto_19250 ?auto_19243 ) ) ( CALIBRATION_TARGET ?auto_19247 ?auto_19249 ) ( not ( = ?auto_19249 ?auto_19241 ) ) ( not ( = ?auto_19251 ?auto_19241 ) ) ( ON_BOARD ?auto_19248 ?auto_19246 ) ( not ( = ?auto_19247 ?auto_19248 ) ) ( SUPPORTS ?auto_19248 ?auto_19242 ) ( not ( = ?auto_19250 ?auto_19242 ) ) ( not ( = ?auto_19243 ?auto_19242 ) ) ( CALIBRATION_TARGET ?auto_19248 ?auto_19249 ) ( ON_BOARD ?auto_19245 ?auto_19246 ) ( POWER_ON ?auto_19245 ) ( not ( = ?auto_19247 ?auto_19245 ) ) ( not ( = ?auto_19248 ?auto_19245 ) ) ( CALIBRATED ?auto_19245 ) ( SUPPORTS ?auto_19245 ?auto_19250 ) ( POINTING ?auto_19246 ?auto_19249 ) )
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
      ?auto_19257 - SATELLITE
      ?auto_19262 - DIRECTION
      ?auto_19259 - DIRECTION
      ?auto_19261 - INSTRUMENT
      ?auto_19260 - MODE
      ?auto_19256 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19255 ?auto_19252 ) ) ( ON_BOARD ?auto_19258 ?auto_19257 ) ( SUPPORTS ?auto_19258 ?auto_19253 ) ( not ( = ?auto_19252 ?auto_19262 ) ) ( not ( = ?auto_19255 ?auto_19262 ) ) ( not ( = ?auto_19254 ?auto_19253 ) ) ( CALIBRATION_TARGET ?auto_19258 ?auto_19262 ) ( not ( = ?auto_19262 ?auto_19259 ) ) ( not ( = ?auto_19252 ?auto_19259 ) ) ( not ( = ?auto_19255 ?auto_19259 ) ) ( ON_BOARD ?auto_19261 ?auto_19257 ) ( not ( = ?auto_19258 ?auto_19261 ) ) ( SUPPORTS ?auto_19261 ?auto_19260 ) ( not ( = ?auto_19254 ?auto_19260 ) ) ( not ( = ?auto_19253 ?auto_19260 ) ) ( CALIBRATION_TARGET ?auto_19261 ?auto_19262 ) ( ON_BOARD ?auto_19256 ?auto_19257 ) ( POWER_ON ?auto_19256 ) ( not ( = ?auto_19258 ?auto_19256 ) ) ( not ( = ?auto_19261 ?auto_19256 ) ) ( CALIBRATED ?auto_19256 ) ( SUPPORTS ?auto_19256 ?auto_19254 ) ( POINTING ?auto_19257 ?auto_19262 ) )
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
      ?auto_19273 - DIRECTION
      ?auto_19269 - INSTRUMENT
      ?auto_19268 - SATELLITE
      ?auto_19271 - DIRECTION
      ?auto_19272 - MODE
      ?auto_19270 - INSTRUMENT
      ?auto_19267 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19266 ?auto_19263 ) ) ( not ( = ?auto_19263 ?auto_19273 ) ) ( ON_BOARD ?auto_19269 ?auto_19268 ) ( SUPPORTS ?auto_19269 ?auto_19264 ) ( not ( = ?auto_19263 ?auto_19271 ) ) ( not ( = ?auto_19273 ?auto_19271 ) ) ( not ( = ?auto_19272 ?auto_19264 ) ) ( CALIBRATION_TARGET ?auto_19269 ?auto_19271 ) ( not ( = ?auto_19271 ?auto_19266 ) ) ( not ( = ?auto_19273 ?auto_19266 ) ) ( ON_BOARD ?auto_19270 ?auto_19268 ) ( not ( = ?auto_19269 ?auto_19270 ) ) ( SUPPORTS ?auto_19270 ?auto_19265 ) ( not ( = ?auto_19272 ?auto_19265 ) ) ( not ( = ?auto_19264 ?auto_19265 ) ) ( CALIBRATION_TARGET ?auto_19270 ?auto_19271 ) ( ON_BOARD ?auto_19267 ?auto_19268 ) ( POWER_ON ?auto_19267 ) ( not ( = ?auto_19269 ?auto_19267 ) ) ( not ( = ?auto_19270 ?auto_19267 ) ) ( CALIBRATED ?auto_19267 ) ( SUPPORTS ?auto_19267 ?auto_19272 ) ( POINTING ?auto_19268 ?auto_19271 ) )
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
      ?auto_19307 - SATELLITE
      ?auto_19310 - DIRECTION
      ?auto_19309 - INSTRUMENT
      ?auto_19306 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19303 ?auto_19300 ) ) ( not ( = ?auto_19305 ?auto_19300 ) ) ( not ( = ?auto_19305 ?auto_19303 ) ) ( ON_BOARD ?auto_19308 ?auto_19307 ) ( SUPPORTS ?auto_19308 ?auto_19304 ) ( not ( = ?auto_19305 ?auto_19310 ) ) ( not ( = ?auto_19300 ?auto_19310 ) ) ( not ( = ?auto_19301 ?auto_19304 ) ) ( CALIBRATION_TARGET ?auto_19308 ?auto_19310 ) ( not ( = ?auto_19310 ?auto_19303 ) ) ( ON_BOARD ?auto_19309 ?auto_19307 ) ( not ( = ?auto_19308 ?auto_19309 ) ) ( SUPPORTS ?auto_19309 ?auto_19302 ) ( not ( = ?auto_19301 ?auto_19302 ) ) ( not ( = ?auto_19304 ?auto_19302 ) ) ( CALIBRATION_TARGET ?auto_19309 ?auto_19310 ) ( ON_BOARD ?auto_19306 ?auto_19307 ) ( POWER_ON ?auto_19306 ) ( not ( = ?auto_19308 ?auto_19306 ) ) ( not ( = ?auto_19309 ?auto_19306 ) ) ( CALIBRATED ?auto_19306 ) ( SUPPORTS ?auto_19306 ?auto_19301 ) ( POINTING ?auto_19307 ?auto_19310 ) )
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
      ?auto_19331 - SATELLITE
      ?auto_19334 - DIRECTION
      ?auto_19333 - INSTRUMENT
      ?auto_19330 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19327 ?auto_19324 ) ) ( not ( = ?auto_19329 ?auto_19324 ) ) ( not ( = ?auto_19329 ?auto_19327 ) ) ( ON_BOARD ?auto_19332 ?auto_19331 ) ( SUPPORTS ?auto_19332 ?auto_19326 ) ( not ( = ?auto_19327 ?auto_19334 ) ) ( not ( = ?auto_19324 ?auto_19334 ) ) ( not ( = ?auto_19325 ?auto_19326 ) ) ( CALIBRATION_TARGET ?auto_19332 ?auto_19334 ) ( not ( = ?auto_19334 ?auto_19329 ) ) ( ON_BOARD ?auto_19333 ?auto_19331 ) ( not ( = ?auto_19332 ?auto_19333 ) ) ( SUPPORTS ?auto_19333 ?auto_19328 ) ( not ( = ?auto_19325 ?auto_19328 ) ) ( not ( = ?auto_19326 ?auto_19328 ) ) ( CALIBRATION_TARGET ?auto_19333 ?auto_19334 ) ( ON_BOARD ?auto_19330 ?auto_19331 ) ( POWER_ON ?auto_19330 ) ( not ( = ?auto_19332 ?auto_19330 ) ) ( not ( = ?auto_19333 ?auto_19330 ) ) ( CALIBRATED ?auto_19330 ) ( SUPPORTS ?auto_19330 ?auto_19325 ) ( POINTING ?auto_19331 ?auto_19334 ) )
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
      ?auto_19355 - SATELLITE
      ?auto_19358 - DIRECTION
      ?auto_19357 - INSTRUMENT
      ?auto_19354 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19351 ?auto_19348 ) ) ( not ( = ?auto_19353 ?auto_19348 ) ) ( not ( = ?auto_19353 ?auto_19351 ) ) ( ON_BOARD ?auto_19356 ?auto_19355 ) ( SUPPORTS ?auto_19356 ?auto_19352 ) ( not ( = ?auto_19353 ?auto_19358 ) ) ( not ( = ?auto_19351 ?auto_19358 ) ) ( not ( = ?auto_19350 ?auto_19352 ) ) ( CALIBRATION_TARGET ?auto_19356 ?auto_19358 ) ( not ( = ?auto_19358 ?auto_19348 ) ) ( ON_BOARD ?auto_19357 ?auto_19355 ) ( not ( = ?auto_19356 ?auto_19357 ) ) ( SUPPORTS ?auto_19357 ?auto_19349 ) ( not ( = ?auto_19350 ?auto_19349 ) ) ( not ( = ?auto_19352 ?auto_19349 ) ) ( CALIBRATION_TARGET ?auto_19357 ?auto_19358 ) ( ON_BOARD ?auto_19354 ?auto_19355 ) ( POWER_ON ?auto_19354 ) ( not ( = ?auto_19356 ?auto_19354 ) ) ( not ( = ?auto_19357 ?auto_19354 ) ) ( CALIBRATED ?auto_19354 ) ( SUPPORTS ?auto_19354 ?auto_19350 ) ( POINTING ?auto_19355 ?auto_19358 ) )
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
      ?auto_19379 - SATELLITE
      ?auto_19382 - DIRECTION
      ?auto_19381 - INSTRUMENT
      ?auto_19378 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19375 ?auto_19372 ) ) ( not ( = ?auto_19377 ?auto_19372 ) ) ( not ( = ?auto_19377 ?auto_19375 ) ) ( ON_BOARD ?auto_19380 ?auto_19379 ) ( SUPPORTS ?auto_19380 ?auto_19374 ) ( not ( = ?auto_19375 ?auto_19382 ) ) ( not ( = ?auto_19377 ?auto_19382 ) ) ( not ( = ?auto_19376 ?auto_19374 ) ) ( CALIBRATION_TARGET ?auto_19380 ?auto_19382 ) ( not ( = ?auto_19382 ?auto_19372 ) ) ( ON_BOARD ?auto_19381 ?auto_19379 ) ( not ( = ?auto_19380 ?auto_19381 ) ) ( SUPPORTS ?auto_19381 ?auto_19373 ) ( not ( = ?auto_19376 ?auto_19373 ) ) ( not ( = ?auto_19374 ?auto_19373 ) ) ( CALIBRATION_TARGET ?auto_19381 ?auto_19382 ) ( ON_BOARD ?auto_19378 ?auto_19379 ) ( POWER_ON ?auto_19378 ) ( not ( = ?auto_19380 ?auto_19378 ) ) ( not ( = ?auto_19381 ?auto_19378 ) ) ( CALIBRATED ?auto_19378 ) ( SUPPORTS ?auto_19378 ?auto_19376 ) ( POINTING ?auto_19379 ?auto_19382 ) )
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
      ?auto_19429 - SATELLITE
      ?auto_19432 - DIRECTION
      ?auto_19431 - INSTRUMENT
      ?auto_19428 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19425 ?auto_19422 ) ) ( not ( = ?auto_19427 ?auto_19422 ) ) ( not ( = ?auto_19427 ?auto_19425 ) ) ( ON_BOARD ?auto_19430 ?auto_19429 ) ( SUPPORTS ?auto_19430 ?auto_19423 ) ( not ( = ?auto_19422 ?auto_19432 ) ) ( not ( = ?auto_19425 ?auto_19432 ) ) ( not ( = ?auto_19424 ?auto_19423 ) ) ( CALIBRATION_TARGET ?auto_19430 ?auto_19432 ) ( not ( = ?auto_19432 ?auto_19427 ) ) ( ON_BOARD ?auto_19431 ?auto_19429 ) ( not ( = ?auto_19430 ?auto_19431 ) ) ( SUPPORTS ?auto_19431 ?auto_19426 ) ( not ( = ?auto_19424 ?auto_19426 ) ) ( not ( = ?auto_19423 ?auto_19426 ) ) ( CALIBRATION_TARGET ?auto_19431 ?auto_19432 ) ( ON_BOARD ?auto_19428 ?auto_19429 ) ( POWER_ON ?auto_19428 ) ( not ( = ?auto_19430 ?auto_19428 ) ) ( not ( = ?auto_19431 ?auto_19428 ) ) ( CALIBRATED ?auto_19428 ) ( SUPPORTS ?auto_19428 ?auto_19424 ) ( POINTING ?auto_19429 ?auto_19432 ) )
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
      ?auto_19453 - SATELLITE
      ?auto_19456 - DIRECTION
      ?auto_19455 - INSTRUMENT
      ?auto_19452 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19449 ?auto_19446 ) ) ( not ( = ?auto_19451 ?auto_19446 ) ) ( not ( = ?auto_19451 ?auto_19449 ) ) ( ON_BOARD ?auto_19454 ?auto_19453 ) ( SUPPORTS ?auto_19454 ?auto_19447 ) ( not ( = ?auto_19446 ?auto_19456 ) ) ( not ( = ?auto_19451 ?auto_19456 ) ) ( not ( = ?auto_19450 ?auto_19447 ) ) ( CALIBRATION_TARGET ?auto_19454 ?auto_19456 ) ( not ( = ?auto_19456 ?auto_19449 ) ) ( ON_BOARD ?auto_19455 ?auto_19453 ) ( not ( = ?auto_19454 ?auto_19455 ) ) ( SUPPORTS ?auto_19455 ?auto_19448 ) ( not ( = ?auto_19450 ?auto_19448 ) ) ( not ( = ?auto_19447 ?auto_19448 ) ) ( CALIBRATION_TARGET ?auto_19455 ?auto_19456 ) ( ON_BOARD ?auto_19452 ?auto_19453 ) ( POWER_ON ?auto_19452 ) ( not ( = ?auto_19454 ?auto_19452 ) ) ( not ( = ?auto_19455 ?auto_19452 ) ) ( CALIBRATED ?auto_19452 ) ( SUPPORTS ?auto_19452 ?auto_19450 ) ( POINTING ?auto_19453 ?auto_19456 ) )
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
      ?auto_19534 - DIRECTION
      ?auto_19528 - INSTRUMENT
      ?auto_19527 - SATELLITE
      ?auto_19532 - DIRECTION
      ?auto_19533 - MODE
      ?auto_19529 - DIRECTION
      ?auto_19531 - INSTRUMENT
      ?auto_19530 - MODE
      ?auto_19526 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19524 ?auto_19534 ) ) ( ON_BOARD ?auto_19528 ?auto_19527 ) ( SUPPORTS ?auto_19528 ?auto_19525 ) ( not ( = ?auto_19524 ?auto_19532 ) ) ( not ( = ?auto_19534 ?auto_19532 ) ) ( not ( = ?auto_19533 ?auto_19525 ) ) ( CALIBRATION_TARGET ?auto_19528 ?auto_19532 ) ( not ( = ?auto_19532 ?auto_19529 ) ) ( not ( = ?auto_19524 ?auto_19529 ) ) ( not ( = ?auto_19534 ?auto_19529 ) ) ( ON_BOARD ?auto_19531 ?auto_19527 ) ( not ( = ?auto_19528 ?auto_19531 ) ) ( SUPPORTS ?auto_19531 ?auto_19530 ) ( not ( = ?auto_19533 ?auto_19530 ) ) ( not ( = ?auto_19525 ?auto_19530 ) ) ( CALIBRATION_TARGET ?auto_19531 ?auto_19532 ) ( ON_BOARD ?auto_19526 ?auto_19527 ) ( POWER_ON ?auto_19526 ) ( not ( = ?auto_19528 ?auto_19526 ) ) ( not ( = ?auto_19531 ?auto_19526 ) ) ( SUPPORTS ?auto_19526 ?auto_19533 ) ( POINTING ?auto_19527 ?auto_19532 ) ( CALIBRATION_TARGET ?auto_19526 ?auto_19532 ) ( NOT_CALIBRATED ?auto_19526 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_19527 ?auto_19526 ?auto_19532 )
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
      ?auto_19541 - INSTRUMENT
      ?auto_19540 - SATELLITE
      ?auto_19542 - DIRECTION
      ?auto_19543 - DIRECTION
      ?auto_19539 - INSTRUMENT
      ?auto_19544 - MODE
      ?auto_19545 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19538 ?auto_19535 ) ) ( ON_BOARD ?auto_19541 ?auto_19540 ) ( SUPPORTS ?auto_19541 ?auto_19537 ) ( not ( = ?auto_19538 ?auto_19542 ) ) ( not ( = ?auto_19535 ?auto_19542 ) ) ( not ( = ?auto_19536 ?auto_19537 ) ) ( CALIBRATION_TARGET ?auto_19541 ?auto_19542 ) ( not ( = ?auto_19542 ?auto_19543 ) ) ( not ( = ?auto_19538 ?auto_19543 ) ) ( not ( = ?auto_19535 ?auto_19543 ) ) ( ON_BOARD ?auto_19539 ?auto_19540 ) ( not ( = ?auto_19541 ?auto_19539 ) ) ( SUPPORTS ?auto_19539 ?auto_19544 ) ( not ( = ?auto_19536 ?auto_19544 ) ) ( not ( = ?auto_19537 ?auto_19544 ) ) ( CALIBRATION_TARGET ?auto_19539 ?auto_19542 ) ( ON_BOARD ?auto_19545 ?auto_19540 ) ( POWER_ON ?auto_19545 ) ( not ( = ?auto_19541 ?auto_19545 ) ) ( not ( = ?auto_19539 ?auto_19545 ) ) ( SUPPORTS ?auto_19545 ?auto_19536 ) ( POINTING ?auto_19540 ?auto_19542 ) ( CALIBRATION_TARGET ?auto_19545 ?auto_19542 ) ( NOT_CALIBRATED ?auto_19545 ) )
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
      ?auto_19556 - DIRECTION
      ?auto_19551 - INSTRUMENT
      ?auto_19552 - SATELLITE
      ?auto_19550 - DIRECTION
      ?auto_19555 - MODE
      ?auto_19553 - INSTRUMENT
      ?auto_19554 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19549 ?auto_19546 ) ) ( not ( = ?auto_19549 ?auto_19556 ) ) ( ON_BOARD ?auto_19551 ?auto_19552 ) ( SUPPORTS ?auto_19551 ?auto_19548 ) ( not ( = ?auto_19549 ?auto_19550 ) ) ( not ( = ?auto_19556 ?auto_19550 ) ) ( not ( = ?auto_19555 ?auto_19548 ) ) ( CALIBRATION_TARGET ?auto_19551 ?auto_19550 ) ( not ( = ?auto_19550 ?auto_19546 ) ) ( not ( = ?auto_19556 ?auto_19546 ) ) ( ON_BOARD ?auto_19553 ?auto_19552 ) ( not ( = ?auto_19551 ?auto_19553 ) ) ( SUPPORTS ?auto_19553 ?auto_19547 ) ( not ( = ?auto_19555 ?auto_19547 ) ) ( not ( = ?auto_19548 ?auto_19547 ) ) ( CALIBRATION_TARGET ?auto_19553 ?auto_19550 ) ( ON_BOARD ?auto_19554 ?auto_19552 ) ( POWER_ON ?auto_19554 ) ( not ( = ?auto_19551 ?auto_19554 ) ) ( not ( = ?auto_19553 ?auto_19554 ) ) ( SUPPORTS ?auto_19554 ?auto_19555 ) ( POINTING ?auto_19552 ?auto_19550 ) ( CALIBRATION_TARGET ?auto_19554 ?auto_19550 ) ( NOT_CALIBRATED ?auto_19554 ) )
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
      ?auto_19561 - DIRECTION
      ?auto_19564 - DIRECTION
      ?auto_19566 - INSTRUMENT
      ?auto_19563 - MODE
      ?auto_19567 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19560 ?auto_19557 ) ) ( ON_BOARD ?auto_19562 ?auto_19565 ) ( SUPPORTS ?auto_19562 ?auto_19558 ) ( not ( = ?auto_19557 ?auto_19561 ) ) ( not ( = ?auto_19560 ?auto_19561 ) ) ( not ( = ?auto_19559 ?auto_19558 ) ) ( CALIBRATION_TARGET ?auto_19562 ?auto_19561 ) ( not ( = ?auto_19561 ?auto_19564 ) ) ( not ( = ?auto_19557 ?auto_19564 ) ) ( not ( = ?auto_19560 ?auto_19564 ) ) ( ON_BOARD ?auto_19566 ?auto_19565 ) ( not ( = ?auto_19562 ?auto_19566 ) ) ( SUPPORTS ?auto_19566 ?auto_19563 ) ( not ( = ?auto_19559 ?auto_19563 ) ) ( not ( = ?auto_19558 ?auto_19563 ) ) ( CALIBRATION_TARGET ?auto_19566 ?auto_19561 ) ( ON_BOARD ?auto_19567 ?auto_19565 ) ( POWER_ON ?auto_19567 ) ( not ( = ?auto_19562 ?auto_19567 ) ) ( not ( = ?auto_19566 ?auto_19567 ) ) ( SUPPORTS ?auto_19567 ?auto_19559 ) ( POINTING ?auto_19565 ?auto_19561 ) ( CALIBRATION_TARGET ?auto_19567 ?auto_19561 ) ( NOT_CALIBRATED ?auto_19567 ) )
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
      ?auto_19578 - DIRECTION
      ?auto_19573 - INSTRUMENT
      ?auto_19574 - SATELLITE
      ?auto_19572 - DIRECTION
      ?auto_19577 - MODE
      ?auto_19575 - INSTRUMENT
      ?auto_19576 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19571 ?auto_19568 ) ) ( not ( = ?auto_19568 ?auto_19578 ) ) ( ON_BOARD ?auto_19573 ?auto_19574 ) ( SUPPORTS ?auto_19573 ?auto_19569 ) ( not ( = ?auto_19568 ?auto_19572 ) ) ( not ( = ?auto_19578 ?auto_19572 ) ) ( not ( = ?auto_19577 ?auto_19569 ) ) ( CALIBRATION_TARGET ?auto_19573 ?auto_19572 ) ( not ( = ?auto_19572 ?auto_19571 ) ) ( not ( = ?auto_19578 ?auto_19571 ) ) ( ON_BOARD ?auto_19575 ?auto_19574 ) ( not ( = ?auto_19573 ?auto_19575 ) ) ( SUPPORTS ?auto_19575 ?auto_19570 ) ( not ( = ?auto_19577 ?auto_19570 ) ) ( not ( = ?auto_19569 ?auto_19570 ) ) ( CALIBRATION_TARGET ?auto_19575 ?auto_19572 ) ( ON_BOARD ?auto_19576 ?auto_19574 ) ( POWER_ON ?auto_19576 ) ( not ( = ?auto_19573 ?auto_19576 ) ) ( not ( = ?auto_19575 ?auto_19576 ) ) ( SUPPORTS ?auto_19576 ?auto_19577 ) ( POINTING ?auto_19574 ?auto_19572 ) ( CALIBRATION_TARGET ?auto_19576 ?auto_19572 ) ( NOT_CALIBRATED ?auto_19576 ) )
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
      ?auto_19612 - INSTRUMENT
      ?auto_19613 - SATELLITE
      ?auto_19611 - DIRECTION
      ?auto_19614 - INSTRUMENT
      ?auto_19615 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19608 ?auto_19605 ) ) ( not ( = ?auto_19610 ?auto_19605 ) ) ( not ( = ?auto_19610 ?auto_19608 ) ) ( ON_BOARD ?auto_19612 ?auto_19613 ) ( SUPPORTS ?auto_19612 ?auto_19609 ) ( not ( = ?auto_19610 ?auto_19611 ) ) ( not ( = ?auto_19605 ?auto_19611 ) ) ( not ( = ?auto_19606 ?auto_19609 ) ) ( CALIBRATION_TARGET ?auto_19612 ?auto_19611 ) ( not ( = ?auto_19611 ?auto_19608 ) ) ( ON_BOARD ?auto_19614 ?auto_19613 ) ( not ( = ?auto_19612 ?auto_19614 ) ) ( SUPPORTS ?auto_19614 ?auto_19607 ) ( not ( = ?auto_19606 ?auto_19607 ) ) ( not ( = ?auto_19609 ?auto_19607 ) ) ( CALIBRATION_TARGET ?auto_19614 ?auto_19611 ) ( ON_BOARD ?auto_19615 ?auto_19613 ) ( POWER_ON ?auto_19615 ) ( not ( = ?auto_19612 ?auto_19615 ) ) ( not ( = ?auto_19614 ?auto_19615 ) ) ( SUPPORTS ?auto_19615 ?auto_19606 ) ( POINTING ?auto_19613 ?auto_19611 ) ( CALIBRATION_TARGET ?auto_19615 ?auto_19611 ) ( NOT_CALIBRATED ?auto_19615 ) )
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
      ?auto_19636 - INSTRUMENT
      ?auto_19637 - SATELLITE
      ?auto_19635 - DIRECTION
      ?auto_19638 - INSTRUMENT
      ?auto_19639 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19632 ?auto_19629 ) ) ( not ( = ?auto_19634 ?auto_19629 ) ) ( not ( = ?auto_19634 ?auto_19632 ) ) ( ON_BOARD ?auto_19636 ?auto_19637 ) ( SUPPORTS ?auto_19636 ?auto_19631 ) ( not ( = ?auto_19632 ?auto_19635 ) ) ( not ( = ?auto_19629 ?auto_19635 ) ) ( not ( = ?auto_19630 ?auto_19631 ) ) ( CALIBRATION_TARGET ?auto_19636 ?auto_19635 ) ( not ( = ?auto_19635 ?auto_19634 ) ) ( ON_BOARD ?auto_19638 ?auto_19637 ) ( not ( = ?auto_19636 ?auto_19638 ) ) ( SUPPORTS ?auto_19638 ?auto_19633 ) ( not ( = ?auto_19630 ?auto_19633 ) ) ( not ( = ?auto_19631 ?auto_19633 ) ) ( CALIBRATION_TARGET ?auto_19638 ?auto_19635 ) ( ON_BOARD ?auto_19639 ?auto_19637 ) ( POWER_ON ?auto_19639 ) ( not ( = ?auto_19636 ?auto_19639 ) ) ( not ( = ?auto_19638 ?auto_19639 ) ) ( SUPPORTS ?auto_19639 ?auto_19630 ) ( POINTING ?auto_19637 ?auto_19635 ) ( CALIBRATION_TARGET ?auto_19639 ?auto_19635 ) ( NOT_CALIBRATED ?auto_19639 ) )
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
      ?auto_19660 - INSTRUMENT
      ?auto_19661 - SATELLITE
      ?auto_19659 - DIRECTION
      ?auto_19662 - INSTRUMENT
      ?auto_19663 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19656 ?auto_19653 ) ) ( not ( = ?auto_19658 ?auto_19653 ) ) ( not ( = ?auto_19658 ?auto_19656 ) ) ( ON_BOARD ?auto_19660 ?auto_19661 ) ( SUPPORTS ?auto_19660 ?auto_19657 ) ( not ( = ?auto_19658 ?auto_19659 ) ) ( not ( = ?auto_19656 ?auto_19659 ) ) ( not ( = ?auto_19655 ?auto_19657 ) ) ( CALIBRATION_TARGET ?auto_19660 ?auto_19659 ) ( not ( = ?auto_19659 ?auto_19653 ) ) ( ON_BOARD ?auto_19662 ?auto_19661 ) ( not ( = ?auto_19660 ?auto_19662 ) ) ( SUPPORTS ?auto_19662 ?auto_19654 ) ( not ( = ?auto_19655 ?auto_19654 ) ) ( not ( = ?auto_19657 ?auto_19654 ) ) ( CALIBRATION_TARGET ?auto_19662 ?auto_19659 ) ( ON_BOARD ?auto_19663 ?auto_19661 ) ( POWER_ON ?auto_19663 ) ( not ( = ?auto_19660 ?auto_19663 ) ) ( not ( = ?auto_19662 ?auto_19663 ) ) ( SUPPORTS ?auto_19663 ?auto_19655 ) ( POINTING ?auto_19661 ?auto_19659 ) ( CALIBRATION_TARGET ?auto_19663 ?auto_19659 ) ( NOT_CALIBRATED ?auto_19663 ) )
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
      ?auto_19684 - INSTRUMENT
      ?auto_19685 - SATELLITE
      ?auto_19683 - DIRECTION
      ?auto_19686 - INSTRUMENT
      ?auto_19687 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19680 ?auto_19677 ) ) ( not ( = ?auto_19682 ?auto_19677 ) ) ( not ( = ?auto_19682 ?auto_19680 ) ) ( ON_BOARD ?auto_19684 ?auto_19685 ) ( SUPPORTS ?auto_19684 ?auto_19679 ) ( not ( = ?auto_19680 ?auto_19683 ) ) ( not ( = ?auto_19682 ?auto_19683 ) ) ( not ( = ?auto_19681 ?auto_19679 ) ) ( CALIBRATION_TARGET ?auto_19684 ?auto_19683 ) ( not ( = ?auto_19683 ?auto_19677 ) ) ( ON_BOARD ?auto_19686 ?auto_19685 ) ( not ( = ?auto_19684 ?auto_19686 ) ) ( SUPPORTS ?auto_19686 ?auto_19678 ) ( not ( = ?auto_19681 ?auto_19678 ) ) ( not ( = ?auto_19679 ?auto_19678 ) ) ( CALIBRATION_TARGET ?auto_19686 ?auto_19683 ) ( ON_BOARD ?auto_19687 ?auto_19685 ) ( POWER_ON ?auto_19687 ) ( not ( = ?auto_19684 ?auto_19687 ) ) ( not ( = ?auto_19686 ?auto_19687 ) ) ( SUPPORTS ?auto_19687 ?auto_19681 ) ( POINTING ?auto_19685 ?auto_19683 ) ( CALIBRATION_TARGET ?auto_19687 ?auto_19683 ) ( NOT_CALIBRATED ?auto_19687 ) )
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
      ?auto_19734 - INSTRUMENT
      ?auto_19735 - SATELLITE
      ?auto_19733 - DIRECTION
      ?auto_19736 - INSTRUMENT
      ?auto_19737 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19730 ?auto_19727 ) ) ( not ( = ?auto_19732 ?auto_19727 ) ) ( not ( = ?auto_19732 ?auto_19730 ) ) ( ON_BOARD ?auto_19734 ?auto_19735 ) ( SUPPORTS ?auto_19734 ?auto_19728 ) ( not ( = ?auto_19727 ?auto_19733 ) ) ( not ( = ?auto_19730 ?auto_19733 ) ) ( not ( = ?auto_19729 ?auto_19728 ) ) ( CALIBRATION_TARGET ?auto_19734 ?auto_19733 ) ( not ( = ?auto_19733 ?auto_19732 ) ) ( ON_BOARD ?auto_19736 ?auto_19735 ) ( not ( = ?auto_19734 ?auto_19736 ) ) ( SUPPORTS ?auto_19736 ?auto_19731 ) ( not ( = ?auto_19729 ?auto_19731 ) ) ( not ( = ?auto_19728 ?auto_19731 ) ) ( CALIBRATION_TARGET ?auto_19736 ?auto_19733 ) ( ON_BOARD ?auto_19737 ?auto_19735 ) ( POWER_ON ?auto_19737 ) ( not ( = ?auto_19734 ?auto_19737 ) ) ( not ( = ?auto_19736 ?auto_19737 ) ) ( SUPPORTS ?auto_19737 ?auto_19729 ) ( POINTING ?auto_19735 ?auto_19733 ) ( CALIBRATION_TARGET ?auto_19737 ?auto_19733 ) ( NOT_CALIBRATED ?auto_19737 ) )
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
      ?auto_19758 - INSTRUMENT
      ?auto_19759 - SATELLITE
      ?auto_19757 - DIRECTION
      ?auto_19760 - INSTRUMENT
      ?auto_19761 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19754 ?auto_19751 ) ) ( not ( = ?auto_19756 ?auto_19751 ) ) ( not ( = ?auto_19756 ?auto_19754 ) ) ( ON_BOARD ?auto_19758 ?auto_19759 ) ( SUPPORTS ?auto_19758 ?auto_19752 ) ( not ( = ?auto_19751 ?auto_19757 ) ) ( not ( = ?auto_19756 ?auto_19757 ) ) ( not ( = ?auto_19755 ?auto_19752 ) ) ( CALIBRATION_TARGET ?auto_19758 ?auto_19757 ) ( not ( = ?auto_19757 ?auto_19754 ) ) ( ON_BOARD ?auto_19760 ?auto_19759 ) ( not ( = ?auto_19758 ?auto_19760 ) ) ( SUPPORTS ?auto_19760 ?auto_19753 ) ( not ( = ?auto_19755 ?auto_19753 ) ) ( not ( = ?auto_19752 ?auto_19753 ) ) ( CALIBRATION_TARGET ?auto_19760 ?auto_19757 ) ( ON_BOARD ?auto_19761 ?auto_19759 ) ( POWER_ON ?auto_19761 ) ( not ( = ?auto_19758 ?auto_19761 ) ) ( not ( = ?auto_19760 ?auto_19761 ) ) ( SUPPORTS ?auto_19761 ?auto_19755 ) ( POINTING ?auto_19759 ?auto_19757 ) ( CALIBRATION_TARGET ?auto_19761 ?auto_19757 ) ( NOT_CALIBRATED ?auto_19761 ) )
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
      ?auto_19839 - DIRECTION
      ?auto_19832 - INSTRUMENT
      ?auto_19835 - SATELLITE
      ?auto_19831 - DIRECTION
      ?auto_19838 - MODE
      ?auto_19834 - DIRECTION
      ?auto_19836 - INSTRUMENT
      ?auto_19833 - MODE
      ?auto_19837 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19829 ?auto_19839 ) ) ( ON_BOARD ?auto_19832 ?auto_19835 ) ( SUPPORTS ?auto_19832 ?auto_19830 ) ( not ( = ?auto_19829 ?auto_19831 ) ) ( not ( = ?auto_19839 ?auto_19831 ) ) ( not ( = ?auto_19838 ?auto_19830 ) ) ( CALIBRATION_TARGET ?auto_19832 ?auto_19831 ) ( not ( = ?auto_19831 ?auto_19834 ) ) ( not ( = ?auto_19829 ?auto_19834 ) ) ( not ( = ?auto_19839 ?auto_19834 ) ) ( ON_BOARD ?auto_19836 ?auto_19835 ) ( not ( = ?auto_19832 ?auto_19836 ) ) ( SUPPORTS ?auto_19836 ?auto_19833 ) ( not ( = ?auto_19838 ?auto_19833 ) ) ( not ( = ?auto_19830 ?auto_19833 ) ) ( CALIBRATION_TARGET ?auto_19836 ?auto_19831 ) ( ON_BOARD ?auto_19837 ?auto_19835 ) ( not ( = ?auto_19832 ?auto_19837 ) ) ( not ( = ?auto_19836 ?auto_19837 ) ) ( SUPPORTS ?auto_19837 ?auto_19838 ) ( POINTING ?auto_19835 ?auto_19831 ) ( CALIBRATION_TARGET ?auto_19837 ?auto_19831 ) ( POWER_AVAIL ?auto_19835 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_19837 ?auto_19835 )
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
      ?auto_19848 - INSTRUMENT
      ?auto_19846 - SATELLITE
      ?auto_19850 - DIRECTION
      ?auto_19849 - DIRECTION
      ?auto_19844 - INSTRUMENT
      ?auto_19845 - MODE
      ?auto_19847 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19843 ?auto_19840 ) ) ( ON_BOARD ?auto_19848 ?auto_19846 ) ( SUPPORTS ?auto_19848 ?auto_19842 ) ( not ( = ?auto_19843 ?auto_19850 ) ) ( not ( = ?auto_19840 ?auto_19850 ) ) ( not ( = ?auto_19841 ?auto_19842 ) ) ( CALIBRATION_TARGET ?auto_19848 ?auto_19850 ) ( not ( = ?auto_19850 ?auto_19849 ) ) ( not ( = ?auto_19843 ?auto_19849 ) ) ( not ( = ?auto_19840 ?auto_19849 ) ) ( ON_BOARD ?auto_19844 ?auto_19846 ) ( not ( = ?auto_19848 ?auto_19844 ) ) ( SUPPORTS ?auto_19844 ?auto_19845 ) ( not ( = ?auto_19841 ?auto_19845 ) ) ( not ( = ?auto_19842 ?auto_19845 ) ) ( CALIBRATION_TARGET ?auto_19844 ?auto_19850 ) ( ON_BOARD ?auto_19847 ?auto_19846 ) ( not ( = ?auto_19848 ?auto_19847 ) ) ( not ( = ?auto_19844 ?auto_19847 ) ) ( SUPPORTS ?auto_19847 ?auto_19841 ) ( POINTING ?auto_19846 ?auto_19850 ) ( CALIBRATION_TARGET ?auto_19847 ?auto_19850 ) ( POWER_AVAIL ?auto_19846 ) )
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
      ?auto_19861 - DIRECTION
      ?auto_19857 - INSTRUMENT
      ?auto_19856 - SATELLITE
      ?auto_19855 - DIRECTION
      ?auto_19860 - MODE
      ?auto_19858 - INSTRUMENT
      ?auto_19859 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19854 ?auto_19851 ) ) ( not ( = ?auto_19854 ?auto_19861 ) ) ( ON_BOARD ?auto_19857 ?auto_19856 ) ( SUPPORTS ?auto_19857 ?auto_19853 ) ( not ( = ?auto_19854 ?auto_19855 ) ) ( not ( = ?auto_19861 ?auto_19855 ) ) ( not ( = ?auto_19860 ?auto_19853 ) ) ( CALIBRATION_TARGET ?auto_19857 ?auto_19855 ) ( not ( = ?auto_19855 ?auto_19851 ) ) ( not ( = ?auto_19861 ?auto_19851 ) ) ( ON_BOARD ?auto_19858 ?auto_19856 ) ( not ( = ?auto_19857 ?auto_19858 ) ) ( SUPPORTS ?auto_19858 ?auto_19852 ) ( not ( = ?auto_19860 ?auto_19852 ) ) ( not ( = ?auto_19853 ?auto_19852 ) ) ( CALIBRATION_TARGET ?auto_19858 ?auto_19855 ) ( ON_BOARD ?auto_19859 ?auto_19856 ) ( not ( = ?auto_19857 ?auto_19859 ) ) ( not ( = ?auto_19858 ?auto_19859 ) ) ( SUPPORTS ?auto_19859 ?auto_19860 ) ( POINTING ?auto_19856 ?auto_19855 ) ( CALIBRATION_TARGET ?auto_19859 ?auto_19855 ) ( POWER_AVAIL ?auto_19856 ) )
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
      ?auto_19868 - INSTRUMENT
      ?auto_19867 - SATELLITE
      ?auto_19866 - DIRECTION
      ?auto_19870 - DIRECTION
      ?auto_19871 - INSTRUMENT
      ?auto_19869 - MODE
      ?auto_19872 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19865 ?auto_19862 ) ) ( ON_BOARD ?auto_19868 ?auto_19867 ) ( SUPPORTS ?auto_19868 ?auto_19863 ) ( not ( = ?auto_19862 ?auto_19866 ) ) ( not ( = ?auto_19865 ?auto_19866 ) ) ( not ( = ?auto_19864 ?auto_19863 ) ) ( CALIBRATION_TARGET ?auto_19868 ?auto_19866 ) ( not ( = ?auto_19866 ?auto_19870 ) ) ( not ( = ?auto_19862 ?auto_19870 ) ) ( not ( = ?auto_19865 ?auto_19870 ) ) ( ON_BOARD ?auto_19871 ?auto_19867 ) ( not ( = ?auto_19868 ?auto_19871 ) ) ( SUPPORTS ?auto_19871 ?auto_19869 ) ( not ( = ?auto_19864 ?auto_19869 ) ) ( not ( = ?auto_19863 ?auto_19869 ) ) ( CALIBRATION_TARGET ?auto_19871 ?auto_19866 ) ( ON_BOARD ?auto_19872 ?auto_19867 ) ( not ( = ?auto_19868 ?auto_19872 ) ) ( not ( = ?auto_19871 ?auto_19872 ) ) ( SUPPORTS ?auto_19872 ?auto_19864 ) ( POINTING ?auto_19867 ?auto_19866 ) ( CALIBRATION_TARGET ?auto_19872 ?auto_19866 ) ( POWER_AVAIL ?auto_19867 ) )
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
      ?auto_19883 - DIRECTION
      ?auto_19879 - INSTRUMENT
      ?auto_19878 - SATELLITE
      ?auto_19877 - DIRECTION
      ?auto_19882 - MODE
      ?auto_19880 - INSTRUMENT
      ?auto_19881 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19876 ?auto_19873 ) ) ( not ( = ?auto_19873 ?auto_19883 ) ) ( ON_BOARD ?auto_19879 ?auto_19878 ) ( SUPPORTS ?auto_19879 ?auto_19874 ) ( not ( = ?auto_19873 ?auto_19877 ) ) ( not ( = ?auto_19883 ?auto_19877 ) ) ( not ( = ?auto_19882 ?auto_19874 ) ) ( CALIBRATION_TARGET ?auto_19879 ?auto_19877 ) ( not ( = ?auto_19877 ?auto_19876 ) ) ( not ( = ?auto_19883 ?auto_19876 ) ) ( ON_BOARD ?auto_19880 ?auto_19878 ) ( not ( = ?auto_19879 ?auto_19880 ) ) ( SUPPORTS ?auto_19880 ?auto_19875 ) ( not ( = ?auto_19882 ?auto_19875 ) ) ( not ( = ?auto_19874 ?auto_19875 ) ) ( CALIBRATION_TARGET ?auto_19880 ?auto_19877 ) ( ON_BOARD ?auto_19881 ?auto_19878 ) ( not ( = ?auto_19879 ?auto_19881 ) ) ( not ( = ?auto_19880 ?auto_19881 ) ) ( SUPPORTS ?auto_19881 ?auto_19882 ) ( POINTING ?auto_19878 ?auto_19877 ) ( CALIBRATION_TARGET ?auto_19881 ?auto_19877 ) ( POWER_AVAIL ?auto_19878 ) )
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
      ?auto_19918 - INSTRUMENT
      ?auto_19917 - SATELLITE
      ?auto_19916 - DIRECTION
      ?auto_19919 - INSTRUMENT
      ?auto_19920 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19913 ?auto_19910 ) ) ( not ( = ?auto_19915 ?auto_19910 ) ) ( not ( = ?auto_19915 ?auto_19913 ) ) ( ON_BOARD ?auto_19918 ?auto_19917 ) ( SUPPORTS ?auto_19918 ?auto_19914 ) ( not ( = ?auto_19915 ?auto_19916 ) ) ( not ( = ?auto_19910 ?auto_19916 ) ) ( not ( = ?auto_19911 ?auto_19914 ) ) ( CALIBRATION_TARGET ?auto_19918 ?auto_19916 ) ( not ( = ?auto_19916 ?auto_19913 ) ) ( ON_BOARD ?auto_19919 ?auto_19917 ) ( not ( = ?auto_19918 ?auto_19919 ) ) ( SUPPORTS ?auto_19919 ?auto_19912 ) ( not ( = ?auto_19911 ?auto_19912 ) ) ( not ( = ?auto_19914 ?auto_19912 ) ) ( CALIBRATION_TARGET ?auto_19919 ?auto_19916 ) ( ON_BOARD ?auto_19920 ?auto_19917 ) ( not ( = ?auto_19918 ?auto_19920 ) ) ( not ( = ?auto_19919 ?auto_19920 ) ) ( SUPPORTS ?auto_19920 ?auto_19911 ) ( POINTING ?auto_19917 ?auto_19916 ) ( CALIBRATION_TARGET ?auto_19920 ?auto_19916 ) ( POWER_AVAIL ?auto_19917 ) )
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
      ?auto_19942 - INSTRUMENT
      ?auto_19941 - SATELLITE
      ?auto_19940 - DIRECTION
      ?auto_19943 - INSTRUMENT
      ?auto_19944 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19937 ?auto_19934 ) ) ( not ( = ?auto_19939 ?auto_19934 ) ) ( not ( = ?auto_19939 ?auto_19937 ) ) ( ON_BOARD ?auto_19942 ?auto_19941 ) ( SUPPORTS ?auto_19942 ?auto_19936 ) ( not ( = ?auto_19937 ?auto_19940 ) ) ( not ( = ?auto_19934 ?auto_19940 ) ) ( not ( = ?auto_19935 ?auto_19936 ) ) ( CALIBRATION_TARGET ?auto_19942 ?auto_19940 ) ( not ( = ?auto_19940 ?auto_19939 ) ) ( ON_BOARD ?auto_19943 ?auto_19941 ) ( not ( = ?auto_19942 ?auto_19943 ) ) ( SUPPORTS ?auto_19943 ?auto_19938 ) ( not ( = ?auto_19935 ?auto_19938 ) ) ( not ( = ?auto_19936 ?auto_19938 ) ) ( CALIBRATION_TARGET ?auto_19943 ?auto_19940 ) ( ON_BOARD ?auto_19944 ?auto_19941 ) ( not ( = ?auto_19942 ?auto_19944 ) ) ( not ( = ?auto_19943 ?auto_19944 ) ) ( SUPPORTS ?auto_19944 ?auto_19935 ) ( POINTING ?auto_19941 ?auto_19940 ) ( CALIBRATION_TARGET ?auto_19944 ?auto_19940 ) ( POWER_AVAIL ?auto_19941 ) )
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
      ?auto_19966 - INSTRUMENT
      ?auto_19965 - SATELLITE
      ?auto_19964 - DIRECTION
      ?auto_19967 - INSTRUMENT
      ?auto_19968 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19961 ?auto_19958 ) ) ( not ( = ?auto_19963 ?auto_19958 ) ) ( not ( = ?auto_19963 ?auto_19961 ) ) ( ON_BOARD ?auto_19966 ?auto_19965 ) ( SUPPORTS ?auto_19966 ?auto_19962 ) ( not ( = ?auto_19963 ?auto_19964 ) ) ( not ( = ?auto_19961 ?auto_19964 ) ) ( not ( = ?auto_19960 ?auto_19962 ) ) ( CALIBRATION_TARGET ?auto_19966 ?auto_19964 ) ( not ( = ?auto_19964 ?auto_19958 ) ) ( ON_BOARD ?auto_19967 ?auto_19965 ) ( not ( = ?auto_19966 ?auto_19967 ) ) ( SUPPORTS ?auto_19967 ?auto_19959 ) ( not ( = ?auto_19960 ?auto_19959 ) ) ( not ( = ?auto_19962 ?auto_19959 ) ) ( CALIBRATION_TARGET ?auto_19967 ?auto_19964 ) ( ON_BOARD ?auto_19968 ?auto_19965 ) ( not ( = ?auto_19966 ?auto_19968 ) ) ( not ( = ?auto_19967 ?auto_19968 ) ) ( SUPPORTS ?auto_19968 ?auto_19960 ) ( POINTING ?auto_19965 ?auto_19964 ) ( CALIBRATION_TARGET ?auto_19968 ?auto_19964 ) ( POWER_AVAIL ?auto_19965 ) )
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
      ?auto_19990 - INSTRUMENT
      ?auto_19989 - SATELLITE
      ?auto_19988 - DIRECTION
      ?auto_19991 - INSTRUMENT
      ?auto_19992 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_19985 ?auto_19982 ) ) ( not ( = ?auto_19987 ?auto_19982 ) ) ( not ( = ?auto_19987 ?auto_19985 ) ) ( ON_BOARD ?auto_19990 ?auto_19989 ) ( SUPPORTS ?auto_19990 ?auto_19984 ) ( not ( = ?auto_19985 ?auto_19988 ) ) ( not ( = ?auto_19987 ?auto_19988 ) ) ( not ( = ?auto_19986 ?auto_19984 ) ) ( CALIBRATION_TARGET ?auto_19990 ?auto_19988 ) ( not ( = ?auto_19988 ?auto_19982 ) ) ( ON_BOARD ?auto_19991 ?auto_19989 ) ( not ( = ?auto_19990 ?auto_19991 ) ) ( SUPPORTS ?auto_19991 ?auto_19983 ) ( not ( = ?auto_19986 ?auto_19983 ) ) ( not ( = ?auto_19984 ?auto_19983 ) ) ( CALIBRATION_TARGET ?auto_19991 ?auto_19988 ) ( ON_BOARD ?auto_19992 ?auto_19989 ) ( not ( = ?auto_19990 ?auto_19992 ) ) ( not ( = ?auto_19991 ?auto_19992 ) ) ( SUPPORTS ?auto_19992 ?auto_19986 ) ( POINTING ?auto_19989 ?auto_19988 ) ( CALIBRATION_TARGET ?auto_19992 ?auto_19988 ) ( POWER_AVAIL ?auto_19989 ) )
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
      ?auto_20040 - INSTRUMENT
      ?auto_20039 - SATELLITE
      ?auto_20038 - DIRECTION
      ?auto_20041 - INSTRUMENT
      ?auto_20042 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_20035 ?auto_20032 ) ) ( not ( = ?auto_20037 ?auto_20032 ) ) ( not ( = ?auto_20037 ?auto_20035 ) ) ( ON_BOARD ?auto_20040 ?auto_20039 ) ( SUPPORTS ?auto_20040 ?auto_20033 ) ( not ( = ?auto_20032 ?auto_20038 ) ) ( not ( = ?auto_20035 ?auto_20038 ) ) ( not ( = ?auto_20034 ?auto_20033 ) ) ( CALIBRATION_TARGET ?auto_20040 ?auto_20038 ) ( not ( = ?auto_20038 ?auto_20037 ) ) ( ON_BOARD ?auto_20041 ?auto_20039 ) ( not ( = ?auto_20040 ?auto_20041 ) ) ( SUPPORTS ?auto_20041 ?auto_20036 ) ( not ( = ?auto_20034 ?auto_20036 ) ) ( not ( = ?auto_20033 ?auto_20036 ) ) ( CALIBRATION_TARGET ?auto_20041 ?auto_20038 ) ( ON_BOARD ?auto_20042 ?auto_20039 ) ( not ( = ?auto_20040 ?auto_20042 ) ) ( not ( = ?auto_20041 ?auto_20042 ) ) ( SUPPORTS ?auto_20042 ?auto_20034 ) ( POINTING ?auto_20039 ?auto_20038 ) ( CALIBRATION_TARGET ?auto_20042 ?auto_20038 ) ( POWER_AVAIL ?auto_20039 ) )
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
      ?auto_20064 - INSTRUMENT
      ?auto_20063 - SATELLITE
      ?auto_20062 - DIRECTION
      ?auto_20065 - INSTRUMENT
      ?auto_20066 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_20059 ?auto_20056 ) ) ( not ( = ?auto_20061 ?auto_20056 ) ) ( not ( = ?auto_20061 ?auto_20059 ) ) ( ON_BOARD ?auto_20064 ?auto_20063 ) ( SUPPORTS ?auto_20064 ?auto_20057 ) ( not ( = ?auto_20056 ?auto_20062 ) ) ( not ( = ?auto_20061 ?auto_20062 ) ) ( not ( = ?auto_20060 ?auto_20057 ) ) ( CALIBRATION_TARGET ?auto_20064 ?auto_20062 ) ( not ( = ?auto_20062 ?auto_20059 ) ) ( ON_BOARD ?auto_20065 ?auto_20063 ) ( not ( = ?auto_20064 ?auto_20065 ) ) ( SUPPORTS ?auto_20065 ?auto_20058 ) ( not ( = ?auto_20060 ?auto_20058 ) ) ( not ( = ?auto_20057 ?auto_20058 ) ) ( CALIBRATION_TARGET ?auto_20065 ?auto_20062 ) ( ON_BOARD ?auto_20066 ?auto_20063 ) ( not ( = ?auto_20064 ?auto_20066 ) ) ( not ( = ?auto_20065 ?auto_20066 ) ) ( SUPPORTS ?auto_20066 ?auto_20060 ) ( POINTING ?auto_20063 ?auto_20062 ) ( CALIBRATION_TARGET ?auto_20066 ?auto_20062 ) ( POWER_AVAIL ?auto_20063 ) )
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
      ?auto_20144 - DIRECTION
      ?auto_20138 - INSTRUMENT
      ?auto_20137 - SATELLITE
      ?auto_20136 - DIRECTION
      ?auto_20143 - MODE
      ?auto_20140 - DIRECTION
      ?auto_20141 - INSTRUMENT
      ?auto_20139 - MODE
      ?auto_20142 - INSTRUMENT
      ?auto_20145 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20134 ?auto_20144 ) ) ( ON_BOARD ?auto_20138 ?auto_20137 ) ( SUPPORTS ?auto_20138 ?auto_20135 ) ( not ( = ?auto_20134 ?auto_20136 ) ) ( not ( = ?auto_20144 ?auto_20136 ) ) ( not ( = ?auto_20143 ?auto_20135 ) ) ( CALIBRATION_TARGET ?auto_20138 ?auto_20136 ) ( not ( = ?auto_20136 ?auto_20140 ) ) ( not ( = ?auto_20134 ?auto_20140 ) ) ( not ( = ?auto_20144 ?auto_20140 ) ) ( ON_BOARD ?auto_20141 ?auto_20137 ) ( not ( = ?auto_20138 ?auto_20141 ) ) ( SUPPORTS ?auto_20141 ?auto_20139 ) ( not ( = ?auto_20143 ?auto_20139 ) ) ( not ( = ?auto_20135 ?auto_20139 ) ) ( CALIBRATION_TARGET ?auto_20141 ?auto_20136 ) ( ON_BOARD ?auto_20142 ?auto_20137 ) ( not ( = ?auto_20138 ?auto_20142 ) ) ( not ( = ?auto_20141 ?auto_20142 ) ) ( SUPPORTS ?auto_20142 ?auto_20143 ) ( CALIBRATION_TARGET ?auto_20142 ?auto_20136 ) ( POWER_AVAIL ?auto_20137 ) ( POINTING ?auto_20137 ?auto_20145 ) ( not ( = ?auto_20136 ?auto_20145 ) ) ( not ( = ?auto_20134 ?auto_20145 ) ) ( not ( = ?auto_20144 ?auto_20145 ) ) ( not ( = ?auto_20140 ?auto_20145 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_20137 ?auto_20136 ?auto_20145 )
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
      ?auto_20156 - INSTRUMENT
      ?auto_20154 - SATELLITE
      ?auto_20157 - DIRECTION
      ?auto_20151 - DIRECTION
      ?auto_20150 - INSTRUMENT
      ?auto_20152 - MODE
      ?auto_20155 - INSTRUMENT
      ?auto_20153 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20149 ?auto_20146 ) ) ( ON_BOARD ?auto_20156 ?auto_20154 ) ( SUPPORTS ?auto_20156 ?auto_20148 ) ( not ( = ?auto_20149 ?auto_20157 ) ) ( not ( = ?auto_20146 ?auto_20157 ) ) ( not ( = ?auto_20147 ?auto_20148 ) ) ( CALIBRATION_TARGET ?auto_20156 ?auto_20157 ) ( not ( = ?auto_20157 ?auto_20151 ) ) ( not ( = ?auto_20149 ?auto_20151 ) ) ( not ( = ?auto_20146 ?auto_20151 ) ) ( ON_BOARD ?auto_20150 ?auto_20154 ) ( not ( = ?auto_20156 ?auto_20150 ) ) ( SUPPORTS ?auto_20150 ?auto_20152 ) ( not ( = ?auto_20147 ?auto_20152 ) ) ( not ( = ?auto_20148 ?auto_20152 ) ) ( CALIBRATION_TARGET ?auto_20150 ?auto_20157 ) ( ON_BOARD ?auto_20155 ?auto_20154 ) ( not ( = ?auto_20156 ?auto_20155 ) ) ( not ( = ?auto_20150 ?auto_20155 ) ) ( SUPPORTS ?auto_20155 ?auto_20147 ) ( CALIBRATION_TARGET ?auto_20155 ?auto_20157 ) ( POWER_AVAIL ?auto_20154 ) ( POINTING ?auto_20154 ?auto_20153 ) ( not ( = ?auto_20157 ?auto_20153 ) ) ( not ( = ?auto_20149 ?auto_20153 ) ) ( not ( = ?auto_20146 ?auto_20153 ) ) ( not ( = ?auto_20151 ?auto_20153 ) ) )
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
      ?auto_20169 - DIRECTION
      ?auto_20166 - INSTRUMENT
      ?auto_20165 - SATELLITE
      ?auto_20163 - DIRECTION
      ?auto_20168 - MODE
      ?auto_20164 - INSTRUMENT
      ?auto_20167 - INSTRUMENT
      ?auto_20162 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20161 ?auto_20158 ) ) ( not ( = ?auto_20161 ?auto_20169 ) ) ( ON_BOARD ?auto_20166 ?auto_20165 ) ( SUPPORTS ?auto_20166 ?auto_20160 ) ( not ( = ?auto_20161 ?auto_20163 ) ) ( not ( = ?auto_20169 ?auto_20163 ) ) ( not ( = ?auto_20168 ?auto_20160 ) ) ( CALIBRATION_TARGET ?auto_20166 ?auto_20163 ) ( not ( = ?auto_20163 ?auto_20158 ) ) ( not ( = ?auto_20169 ?auto_20158 ) ) ( ON_BOARD ?auto_20164 ?auto_20165 ) ( not ( = ?auto_20166 ?auto_20164 ) ) ( SUPPORTS ?auto_20164 ?auto_20159 ) ( not ( = ?auto_20168 ?auto_20159 ) ) ( not ( = ?auto_20160 ?auto_20159 ) ) ( CALIBRATION_TARGET ?auto_20164 ?auto_20163 ) ( ON_BOARD ?auto_20167 ?auto_20165 ) ( not ( = ?auto_20166 ?auto_20167 ) ) ( not ( = ?auto_20164 ?auto_20167 ) ) ( SUPPORTS ?auto_20167 ?auto_20168 ) ( CALIBRATION_TARGET ?auto_20167 ?auto_20163 ) ( POWER_AVAIL ?auto_20165 ) ( POINTING ?auto_20165 ?auto_20162 ) ( not ( = ?auto_20163 ?auto_20162 ) ) ( not ( = ?auto_20161 ?auto_20162 ) ) ( not ( = ?auto_20169 ?auto_20162 ) ) ( not ( = ?auto_20158 ?auto_20162 ) ) )
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
      ?auto_20180 - INSTRUMENT
      ?auto_20179 - SATELLITE
      ?auto_20176 - DIRECTION
      ?auto_20177 - DIRECTION
      ?auto_20178 - INSTRUMENT
      ?auto_20174 - MODE
      ?auto_20181 - INSTRUMENT
      ?auto_20175 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20173 ?auto_20170 ) ) ( ON_BOARD ?auto_20180 ?auto_20179 ) ( SUPPORTS ?auto_20180 ?auto_20171 ) ( not ( = ?auto_20170 ?auto_20176 ) ) ( not ( = ?auto_20173 ?auto_20176 ) ) ( not ( = ?auto_20172 ?auto_20171 ) ) ( CALIBRATION_TARGET ?auto_20180 ?auto_20176 ) ( not ( = ?auto_20176 ?auto_20177 ) ) ( not ( = ?auto_20170 ?auto_20177 ) ) ( not ( = ?auto_20173 ?auto_20177 ) ) ( ON_BOARD ?auto_20178 ?auto_20179 ) ( not ( = ?auto_20180 ?auto_20178 ) ) ( SUPPORTS ?auto_20178 ?auto_20174 ) ( not ( = ?auto_20172 ?auto_20174 ) ) ( not ( = ?auto_20171 ?auto_20174 ) ) ( CALIBRATION_TARGET ?auto_20178 ?auto_20176 ) ( ON_BOARD ?auto_20181 ?auto_20179 ) ( not ( = ?auto_20180 ?auto_20181 ) ) ( not ( = ?auto_20178 ?auto_20181 ) ) ( SUPPORTS ?auto_20181 ?auto_20172 ) ( CALIBRATION_TARGET ?auto_20181 ?auto_20176 ) ( POWER_AVAIL ?auto_20179 ) ( POINTING ?auto_20179 ?auto_20175 ) ( not ( = ?auto_20176 ?auto_20175 ) ) ( not ( = ?auto_20170 ?auto_20175 ) ) ( not ( = ?auto_20173 ?auto_20175 ) ) ( not ( = ?auto_20177 ?auto_20175 ) ) )
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
      ?auto_20193 - DIRECTION
      ?auto_20190 - INSTRUMENT
      ?auto_20189 - SATELLITE
      ?auto_20187 - DIRECTION
      ?auto_20192 - MODE
      ?auto_20188 - INSTRUMENT
      ?auto_20191 - INSTRUMENT
      ?auto_20186 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20185 ?auto_20182 ) ) ( not ( = ?auto_20182 ?auto_20193 ) ) ( ON_BOARD ?auto_20190 ?auto_20189 ) ( SUPPORTS ?auto_20190 ?auto_20183 ) ( not ( = ?auto_20182 ?auto_20187 ) ) ( not ( = ?auto_20193 ?auto_20187 ) ) ( not ( = ?auto_20192 ?auto_20183 ) ) ( CALIBRATION_TARGET ?auto_20190 ?auto_20187 ) ( not ( = ?auto_20187 ?auto_20185 ) ) ( not ( = ?auto_20193 ?auto_20185 ) ) ( ON_BOARD ?auto_20188 ?auto_20189 ) ( not ( = ?auto_20190 ?auto_20188 ) ) ( SUPPORTS ?auto_20188 ?auto_20184 ) ( not ( = ?auto_20192 ?auto_20184 ) ) ( not ( = ?auto_20183 ?auto_20184 ) ) ( CALIBRATION_TARGET ?auto_20188 ?auto_20187 ) ( ON_BOARD ?auto_20191 ?auto_20189 ) ( not ( = ?auto_20190 ?auto_20191 ) ) ( not ( = ?auto_20188 ?auto_20191 ) ) ( SUPPORTS ?auto_20191 ?auto_20192 ) ( CALIBRATION_TARGET ?auto_20191 ?auto_20187 ) ( POWER_AVAIL ?auto_20189 ) ( POINTING ?auto_20189 ?auto_20186 ) ( not ( = ?auto_20187 ?auto_20186 ) ) ( not ( = ?auto_20182 ?auto_20186 ) ) ( not ( = ?auto_20193 ?auto_20186 ) ) ( not ( = ?auto_20185 ?auto_20186 ) ) )
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
      ?auto_20232 - INSTRUMENT
      ?auto_20231 - SATELLITE
      ?auto_20229 - DIRECTION
      ?auto_20230 - INSTRUMENT
      ?auto_20233 - INSTRUMENT
      ?auto_20228 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20225 ?auto_20222 ) ) ( not ( = ?auto_20227 ?auto_20222 ) ) ( not ( = ?auto_20227 ?auto_20225 ) ) ( ON_BOARD ?auto_20232 ?auto_20231 ) ( SUPPORTS ?auto_20232 ?auto_20226 ) ( not ( = ?auto_20227 ?auto_20229 ) ) ( not ( = ?auto_20222 ?auto_20229 ) ) ( not ( = ?auto_20223 ?auto_20226 ) ) ( CALIBRATION_TARGET ?auto_20232 ?auto_20229 ) ( not ( = ?auto_20229 ?auto_20225 ) ) ( ON_BOARD ?auto_20230 ?auto_20231 ) ( not ( = ?auto_20232 ?auto_20230 ) ) ( SUPPORTS ?auto_20230 ?auto_20224 ) ( not ( = ?auto_20223 ?auto_20224 ) ) ( not ( = ?auto_20226 ?auto_20224 ) ) ( CALIBRATION_TARGET ?auto_20230 ?auto_20229 ) ( ON_BOARD ?auto_20233 ?auto_20231 ) ( not ( = ?auto_20232 ?auto_20233 ) ) ( not ( = ?auto_20230 ?auto_20233 ) ) ( SUPPORTS ?auto_20233 ?auto_20223 ) ( CALIBRATION_TARGET ?auto_20233 ?auto_20229 ) ( POWER_AVAIL ?auto_20231 ) ( POINTING ?auto_20231 ?auto_20228 ) ( not ( = ?auto_20229 ?auto_20228 ) ) ( not ( = ?auto_20227 ?auto_20228 ) ) ( not ( = ?auto_20222 ?auto_20228 ) ) ( not ( = ?auto_20225 ?auto_20228 ) ) )
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
      ?auto_20258 - INSTRUMENT
      ?auto_20257 - SATELLITE
      ?auto_20255 - DIRECTION
      ?auto_20256 - INSTRUMENT
      ?auto_20259 - INSTRUMENT
      ?auto_20254 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20251 ?auto_20248 ) ) ( not ( = ?auto_20253 ?auto_20248 ) ) ( not ( = ?auto_20253 ?auto_20251 ) ) ( ON_BOARD ?auto_20258 ?auto_20257 ) ( SUPPORTS ?auto_20258 ?auto_20250 ) ( not ( = ?auto_20251 ?auto_20255 ) ) ( not ( = ?auto_20248 ?auto_20255 ) ) ( not ( = ?auto_20249 ?auto_20250 ) ) ( CALIBRATION_TARGET ?auto_20258 ?auto_20255 ) ( not ( = ?auto_20255 ?auto_20253 ) ) ( ON_BOARD ?auto_20256 ?auto_20257 ) ( not ( = ?auto_20258 ?auto_20256 ) ) ( SUPPORTS ?auto_20256 ?auto_20252 ) ( not ( = ?auto_20249 ?auto_20252 ) ) ( not ( = ?auto_20250 ?auto_20252 ) ) ( CALIBRATION_TARGET ?auto_20256 ?auto_20255 ) ( ON_BOARD ?auto_20259 ?auto_20257 ) ( not ( = ?auto_20258 ?auto_20259 ) ) ( not ( = ?auto_20256 ?auto_20259 ) ) ( SUPPORTS ?auto_20259 ?auto_20249 ) ( CALIBRATION_TARGET ?auto_20259 ?auto_20255 ) ( POWER_AVAIL ?auto_20257 ) ( POINTING ?auto_20257 ?auto_20254 ) ( not ( = ?auto_20255 ?auto_20254 ) ) ( not ( = ?auto_20251 ?auto_20254 ) ) ( not ( = ?auto_20248 ?auto_20254 ) ) ( not ( = ?auto_20253 ?auto_20254 ) ) )
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
      ?auto_20284 - INSTRUMENT
      ?auto_20283 - SATELLITE
      ?auto_20281 - DIRECTION
      ?auto_20282 - INSTRUMENT
      ?auto_20285 - INSTRUMENT
      ?auto_20280 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20277 ?auto_20274 ) ) ( not ( = ?auto_20279 ?auto_20274 ) ) ( not ( = ?auto_20279 ?auto_20277 ) ) ( ON_BOARD ?auto_20284 ?auto_20283 ) ( SUPPORTS ?auto_20284 ?auto_20278 ) ( not ( = ?auto_20279 ?auto_20281 ) ) ( not ( = ?auto_20277 ?auto_20281 ) ) ( not ( = ?auto_20276 ?auto_20278 ) ) ( CALIBRATION_TARGET ?auto_20284 ?auto_20281 ) ( not ( = ?auto_20281 ?auto_20274 ) ) ( ON_BOARD ?auto_20282 ?auto_20283 ) ( not ( = ?auto_20284 ?auto_20282 ) ) ( SUPPORTS ?auto_20282 ?auto_20275 ) ( not ( = ?auto_20276 ?auto_20275 ) ) ( not ( = ?auto_20278 ?auto_20275 ) ) ( CALIBRATION_TARGET ?auto_20282 ?auto_20281 ) ( ON_BOARD ?auto_20285 ?auto_20283 ) ( not ( = ?auto_20284 ?auto_20285 ) ) ( not ( = ?auto_20282 ?auto_20285 ) ) ( SUPPORTS ?auto_20285 ?auto_20276 ) ( CALIBRATION_TARGET ?auto_20285 ?auto_20281 ) ( POWER_AVAIL ?auto_20283 ) ( POINTING ?auto_20283 ?auto_20280 ) ( not ( = ?auto_20281 ?auto_20280 ) ) ( not ( = ?auto_20279 ?auto_20280 ) ) ( not ( = ?auto_20277 ?auto_20280 ) ) ( not ( = ?auto_20274 ?auto_20280 ) ) )
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
      ?auto_20310 - INSTRUMENT
      ?auto_20309 - SATELLITE
      ?auto_20307 - DIRECTION
      ?auto_20308 - INSTRUMENT
      ?auto_20311 - INSTRUMENT
      ?auto_20306 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20303 ?auto_20300 ) ) ( not ( = ?auto_20305 ?auto_20300 ) ) ( not ( = ?auto_20305 ?auto_20303 ) ) ( ON_BOARD ?auto_20310 ?auto_20309 ) ( SUPPORTS ?auto_20310 ?auto_20302 ) ( not ( = ?auto_20303 ?auto_20307 ) ) ( not ( = ?auto_20305 ?auto_20307 ) ) ( not ( = ?auto_20304 ?auto_20302 ) ) ( CALIBRATION_TARGET ?auto_20310 ?auto_20307 ) ( not ( = ?auto_20307 ?auto_20300 ) ) ( ON_BOARD ?auto_20308 ?auto_20309 ) ( not ( = ?auto_20310 ?auto_20308 ) ) ( SUPPORTS ?auto_20308 ?auto_20301 ) ( not ( = ?auto_20304 ?auto_20301 ) ) ( not ( = ?auto_20302 ?auto_20301 ) ) ( CALIBRATION_TARGET ?auto_20308 ?auto_20307 ) ( ON_BOARD ?auto_20311 ?auto_20309 ) ( not ( = ?auto_20310 ?auto_20311 ) ) ( not ( = ?auto_20308 ?auto_20311 ) ) ( SUPPORTS ?auto_20311 ?auto_20304 ) ( CALIBRATION_TARGET ?auto_20311 ?auto_20307 ) ( POWER_AVAIL ?auto_20309 ) ( POINTING ?auto_20309 ?auto_20306 ) ( not ( = ?auto_20307 ?auto_20306 ) ) ( not ( = ?auto_20303 ?auto_20306 ) ) ( not ( = ?auto_20305 ?auto_20306 ) ) ( not ( = ?auto_20300 ?auto_20306 ) ) )
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
      ?auto_20364 - INSTRUMENT
      ?auto_20363 - SATELLITE
      ?auto_20361 - DIRECTION
      ?auto_20362 - INSTRUMENT
      ?auto_20365 - INSTRUMENT
      ?auto_20360 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20357 ?auto_20354 ) ) ( not ( = ?auto_20359 ?auto_20354 ) ) ( not ( = ?auto_20359 ?auto_20357 ) ) ( ON_BOARD ?auto_20364 ?auto_20363 ) ( SUPPORTS ?auto_20364 ?auto_20355 ) ( not ( = ?auto_20354 ?auto_20361 ) ) ( not ( = ?auto_20357 ?auto_20361 ) ) ( not ( = ?auto_20356 ?auto_20355 ) ) ( CALIBRATION_TARGET ?auto_20364 ?auto_20361 ) ( not ( = ?auto_20361 ?auto_20359 ) ) ( ON_BOARD ?auto_20362 ?auto_20363 ) ( not ( = ?auto_20364 ?auto_20362 ) ) ( SUPPORTS ?auto_20362 ?auto_20358 ) ( not ( = ?auto_20356 ?auto_20358 ) ) ( not ( = ?auto_20355 ?auto_20358 ) ) ( CALIBRATION_TARGET ?auto_20362 ?auto_20361 ) ( ON_BOARD ?auto_20365 ?auto_20363 ) ( not ( = ?auto_20364 ?auto_20365 ) ) ( not ( = ?auto_20362 ?auto_20365 ) ) ( SUPPORTS ?auto_20365 ?auto_20356 ) ( CALIBRATION_TARGET ?auto_20365 ?auto_20361 ) ( POWER_AVAIL ?auto_20363 ) ( POINTING ?auto_20363 ?auto_20360 ) ( not ( = ?auto_20361 ?auto_20360 ) ) ( not ( = ?auto_20354 ?auto_20360 ) ) ( not ( = ?auto_20357 ?auto_20360 ) ) ( not ( = ?auto_20359 ?auto_20360 ) ) )
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
      ?auto_20390 - INSTRUMENT
      ?auto_20389 - SATELLITE
      ?auto_20387 - DIRECTION
      ?auto_20388 - INSTRUMENT
      ?auto_20391 - INSTRUMENT
      ?auto_20386 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20383 ?auto_20380 ) ) ( not ( = ?auto_20385 ?auto_20380 ) ) ( not ( = ?auto_20385 ?auto_20383 ) ) ( ON_BOARD ?auto_20390 ?auto_20389 ) ( SUPPORTS ?auto_20390 ?auto_20381 ) ( not ( = ?auto_20380 ?auto_20387 ) ) ( not ( = ?auto_20385 ?auto_20387 ) ) ( not ( = ?auto_20384 ?auto_20381 ) ) ( CALIBRATION_TARGET ?auto_20390 ?auto_20387 ) ( not ( = ?auto_20387 ?auto_20383 ) ) ( ON_BOARD ?auto_20388 ?auto_20389 ) ( not ( = ?auto_20390 ?auto_20388 ) ) ( SUPPORTS ?auto_20388 ?auto_20382 ) ( not ( = ?auto_20384 ?auto_20382 ) ) ( not ( = ?auto_20381 ?auto_20382 ) ) ( CALIBRATION_TARGET ?auto_20388 ?auto_20387 ) ( ON_BOARD ?auto_20391 ?auto_20389 ) ( not ( = ?auto_20390 ?auto_20391 ) ) ( not ( = ?auto_20388 ?auto_20391 ) ) ( SUPPORTS ?auto_20391 ?auto_20384 ) ( CALIBRATION_TARGET ?auto_20391 ?auto_20387 ) ( POWER_AVAIL ?auto_20389 ) ( POINTING ?auto_20389 ?auto_20386 ) ( not ( = ?auto_20387 ?auto_20386 ) ) ( not ( = ?auto_20380 ?auto_20386 ) ) ( not ( = ?auto_20385 ?auto_20386 ) ) ( not ( = ?auto_20383 ?auto_20386 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20385 ?auto_20384 ?auto_20380 ?auto_20381 )
      ( GET-3IMAGE-VERIFY ?auto_20380 ?auto_20381 ?auto_20383 ?auto_20382 ?auto_20385 ?auto_20384 ) )
  )

)

