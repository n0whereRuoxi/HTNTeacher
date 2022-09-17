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
      ?auto_23530 - DIRECTION
      ?auto_23531 - MODE
    )
    :vars
    (
      ?auto_23532 - INSTRUMENT
      ?auto_23533 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_23532 ) ( ON_BOARD ?auto_23532 ?auto_23533 ) ( SUPPORTS ?auto_23532 ?auto_23531 ) ( POWER_ON ?auto_23532 ) ( POINTING ?auto_23533 ?auto_23530 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_23533 ?auto_23530 ?auto_23532 ?auto_23531 )
      ( GET-1IMAGE-VERIFY ?auto_23530 ?auto_23531 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_23548 - DIRECTION
      ?auto_23549 - MODE
    )
    :vars
    (
      ?auto_23551 - INSTRUMENT
      ?auto_23550 - SATELLITE
      ?auto_23552 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_23551 ) ( ON_BOARD ?auto_23551 ?auto_23550 ) ( SUPPORTS ?auto_23551 ?auto_23549 ) ( POWER_ON ?auto_23551 ) ( POINTING ?auto_23550 ?auto_23552 ) ( not ( = ?auto_23548 ?auto_23552 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_23550 ?auto_23548 ?auto_23552 )
      ( GET-1IMAGE ?auto_23548 ?auto_23549 )
      ( GET-1IMAGE-VERIFY ?auto_23548 ?auto_23549 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_23569 - DIRECTION
      ?auto_23570 - MODE
    )
    :vars
    (
      ?auto_23572 - INSTRUMENT
      ?auto_23573 - SATELLITE
      ?auto_23571 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_23572 ?auto_23573 ) ( SUPPORTS ?auto_23572 ?auto_23570 ) ( POWER_ON ?auto_23572 ) ( POINTING ?auto_23573 ?auto_23571 ) ( not ( = ?auto_23569 ?auto_23571 ) ) ( CALIBRATION_TARGET ?auto_23572 ?auto_23571 ) ( NOT_CALIBRATED ?auto_23572 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_23573 ?auto_23572 ?auto_23571 )
      ( GET-1IMAGE ?auto_23569 ?auto_23570 )
      ( GET-1IMAGE-VERIFY ?auto_23569 ?auto_23570 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_23590 - DIRECTION
      ?auto_23591 - MODE
    )
    :vars
    (
      ?auto_23592 - INSTRUMENT
      ?auto_23593 - SATELLITE
      ?auto_23594 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_23592 ?auto_23593 ) ( SUPPORTS ?auto_23592 ?auto_23591 ) ( POINTING ?auto_23593 ?auto_23594 ) ( not ( = ?auto_23590 ?auto_23594 ) ) ( CALIBRATION_TARGET ?auto_23592 ?auto_23594 ) ( POWER_AVAIL ?auto_23593 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_23592 ?auto_23593 )
      ( GET-1IMAGE ?auto_23590 ?auto_23591 )
      ( GET-1IMAGE-VERIFY ?auto_23590 ?auto_23591 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_23611 - DIRECTION
      ?auto_23612 - MODE
    )
    :vars
    (
      ?auto_23613 - INSTRUMENT
      ?auto_23615 - SATELLITE
      ?auto_23614 - DIRECTION
      ?auto_23616 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_23613 ?auto_23615 ) ( SUPPORTS ?auto_23613 ?auto_23612 ) ( not ( = ?auto_23611 ?auto_23614 ) ) ( CALIBRATION_TARGET ?auto_23613 ?auto_23614 ) ( POWER_AVAIL ?auto_23615 ) ( POINTING ?auto_23615 ?auto_23616 ) ( not ( = ?auto_23614 ?auto_23616 ) ) ( not ( = ?auto_23611 ?auto_23616 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_23615 ?auto_23614 ?auto_23616 )
      ( GET-1IMAGE ?auto_23611 ?auto_23612 )
      ( GET-1IMAGE-VERIFY ?auto_23611 ?auto_23612 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23696 - DIRECTION
      ?auto_23697 - MODE
      ?auto_23698 - DIRECTION
      ?auto_23695 - MODE
    )
    :vars
    (
      ?auto_23699 - INSTRUMENT
      ?auto_23700 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_23699 ) ( ON_BOARD ?auto_23699 ?auto_23700 ) ( SUPPORTS ?auto_23699 ?auto_23695 ) ( POWER_ON ?auto_23699 ) ( POINTING ?auto_23700 ?auto_23698 ) ( HAVE_IMAGE ?auto_23696 ?auto_23697 ) ( not ( = ?auto_23696 ?auto_23698 ) ) ( not ( = ?auto_23697 ?auto_23695 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_23698 ?auto_23695 )
      ( GET-2IMAGE-VERIFY ?auto_23696 ?auto_23697 ?auto_23698 ?auto_23695 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23702 - DIRECTION
      ?auto_23703 - MODE
      ?auto_23704 - DIRECTION
      ?auto_23701 - MODE
    )
    :vars
    (
      ?auto_23705 - INSTRUMENT
      ?auto_23706 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_23705 ) ( ON_BOARD ?auto_23705 ?auto_23706 ) ( SUPPORTS ?auto_23705 ?auto_23703 ) ( POWER_ON ?auto_23705 ) ( POINTING ?auto_23706 ?auto_23702 ) ( HAVE_IMAGE ?auto_23704 ?auto_23701 ) ( not ( = ?auto_23702 ?auto_23704 ) ) ( not ( = ?auto_23703 ?auto_23701 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_23702 ?auto_23703 )
      ( GET-2IMAGE-VERIFY ?auto_23702 ?auto_23703 ?auto_23704 ?auto_23701 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23714 - DIRECTION
      ?auto_23715 - MODE
      ?auto_23716 - DIRECTION
      ?auto_23713 - MODE
      ?auto_23717 - DIRECTION
      ?auto_23718 - MODE
    )
    :vars
    (
      ?auto_23719 - INSTRUMENT
      ?auto_23720 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_23719 ) ( ON_BOARD ?auto_23719 ?auto_23720 ) ( SUPPORTS ?auto_23719 ?auto_23718 ) ( POWER_ON ?auto_23719 ) ( POINTING ?auto_23720 ?auto_23717 ) ( HAVE_IMAGE ?auto_23714 ?auto_23715 ) ( HAVE_IMAGE ?auto_23716 ?auto_23713 ) ( not ( = ?auto_23714 ?auto_23716 ) ) ( not ( = ?auto_23714 ?auto_23717 ) ) ( not ( = ?auto_23715 ?auto_23713 ) ) ( not ( = ?auto_23715 ?auto_23718 ) ) ( not ( = ?auto_23716 ?auto_23717 ) ) ( not ( = ?auto_23713 ?auto_23718 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_23717 ?auto_23718 )
      ( GET-3IMAGE-VERIFY ?auto_23714 ?auto_23715 ?auto_23716 ?auto_23713 ?auto_23717 ?auto_23718 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23722 - DIRECTION
      ?auto_23723 - MODE
      ?auto_23724 - DIRECTION
      ?auto_23721 - MODE
      ?auto_23725 - DIRECTION
      ?auto_23726 - MODE
    )
    :vars
    (
      ?auto_23727 - INSTRUMENT
      ?auto_23728 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_23727 ) ( ON_BOARD ?auto_23727 ?auto_23728 ) ( SUPPORTS ?auto_23727 ?auto_23721 ) ( POWER_ON ?auto_23727 ) ( POINTING ?auto_23728 ?auto_23724 ) ( HAVE_IMAGE ?auto_23722 ?auto_23723 ) ( HAVE_IMAGE ?auto_23725 ?auto_23726 ) ( not ( = ?auto_23722 ?auto_23724 ) ) ( not ( = ?auto_23722 ?auto_23725 ) ) ( not ( = ?auto_23723 ?auto_23721 ) ) ( not ( = ?auto_23723 ?auto_23726 ) ) ( not ( = ?auto_23724 ?auto_23725 ) ) ( not ( = ?auto_23721 ?auto_23726 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_23724 ?auto_23721 )
      ( GET-3IMAGE-VERIFY ?auto_23722 ?auto_23723 ?auto_23724 ?auto_23721 ?auto_23725 ?auto_23726 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23738 - DIRECTION
      ?auto_23739 - MODE
      ?auto_23740 - DIRECTION
      ?auto_23737 - MODE
      ?auto_23741 - DIRECTION
      ?auto_23742 - MODE
    )
    :vars
    (
      ?auto_23743 - INSTRUMENT
      ?auto_23744 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_23743 ) ( ON_BOARD ?auto_23743 ?auto_23744 ) ( SUPPORTS ?auto_23743 ?auto_23739 ) ( POWER_ON ?auto_23743 ) ( POINTING ?auto_23744 ?auto_23738 ) ( HAVE_IMAGE ?auto_23740 ?auto_23737 ) ( HAVE_IMAGE ?auto_23741 ?auto_23742 ) ( not ( = ?auto_23738 ?auto_23740 ) ) ( not ( = ?auto_23738 ?auto_23741 ) ) ( not ( = ?auto_23739 ?auto_23737 ) ) ( not ( = ?auto_23739 ?auto_23742 ) ) ( not ( = ?auto_23740 ?auto_23741 ) ) ( not ( = ?auto_23737 ?auto_23742 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_23738 ?auto_23739 )
      ( GET-3IMAGE-VERIFY ?auto_23738 ?auto_23739 ?auto_23740 ?auto_23737 ?auto_23741 ?auto_23742 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23775 - DIRECTION
      ?auto_23776 - MODE
      ?auto_23777 - DIRECTION
      ?auto_23774 - MODE
    )
    :vars
    (
      ?auto_23779 - INSTRUMENT
      ?auto_23778 - SATELLITE
      ?auto_23780 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_23779 ) ( ON_BOARD ?auto_23779 ?auto_23778 ) ( SUPPORTS ?auto_23779 ?auto_23774 ) ( POWER_ON ?auto_23779 ) ( POINTING ?auto_23778 ?auto_23780 ) ( not ( = ?auto_23777 ?auto_23780 ) ) ( HAVE_IMAGE ?auto_23775 ?auto_23776 ) ( not ( = ?auto_23775 ?auto_23777 ) ) ( not ( = ?auto_23775 ?auto_23780 ) ) ( not ( = ?auto_23776 ?auto_23774 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_23777 ?auto_23774 )
      ( GET-2IMAGE-VERIFY ?auto_23775 ?auto_23776 ?auto_23777 ?auto_23774 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23782 - DIRECTION
      ?auto_23783 - MODE
      ?auto_23784 - DIRECTION
      ?auto_23781 - MODE
    )
    :vars
    (
      ?auto_23786 - INSTRUMENT
      ?auto_23787 - SATELLITE
      ?auto_23785 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_23786 ) ( ON_BOARD ?auto_23786 ?auto_23787 ) ( SUPPORTS ?auto_23786 ?auto_23783 ) ( POWER_ON ?auto_23786 ) ( POINTING ?auto_23787 ?auto_23785 ) ( not ( = ?auto_23782 ?auto_23785 ) ) ( HAVE_IMAGE ?auto_23784 ?auto_23781 ) ( not ( = ?auto_23784 ?auto_23782 ) ) ( not ( = ?auto_23784 ?auto_23785 ) ) ( not ( = ?auto_23781 ?auto_23783 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23784 ?auto_23781 ?auto_23782 ?auto_23783 )
      ( GET-2IMAGE-VERIFY ?auto_23782 ?auto_23783 ?auto_23784 ?auto_23781 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23798 - DIRECTION
      ?auto_23799 - MODE
      ?auto_23800 - DIRECTION
      ?auto_23797 - MODE
      ?auto_23801 - DIRECTION
      ?auto_23802 - MODE
    )
    :vars
    (
      ?auto_23804 - INSTRUMENT
      ?auto_23805 - SATELLITE
      ?auto_23803 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_23804 ) ( ON_BOARD ?auto_23804 ?auto_23805 ) ( SUPPORTS ?auto_23804 ?auto_23802 ) ( POWER_ON ?auto_23804 ) ( POINTING ?auto_23805 ?auto_23803 ) ( not ( = ?auto_23801 ?auto_23803 ) ) ( HAVE_IMAGE ?auto_23798 ?auto_23797 ) ( not ( = ?auto_23798 ?auto_23801 ) ) ( not ( = ?auto_23798 ?auto_23803 ) ) ( not ( = ?auto_23797 ?auto_23802 ) ) ( HAVE_IMAGE ?auto_23798 ?auto_23799 ) ( HAVE_IMAGE ?auto_23800 ?auto_23797 ) ( not ( = ?auto_23798 ?auto_23800 ) ) ( not ( = ?auto_23799 ?auto_23797 ) ) ( not ( = ?auto_23799 ?auto_23802 ) ) ( not ( = ?auto_23800 ?auto_23801 ) ) ( not ( = ?auto_23800 ?auto_23803 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23798 ?auto_23797 ?auto_23801 ?auto_23802 )
      ( GET-3IMAGE-VERIFY ?auto_23798 ?auto_23799 ?auto_23800 ?auto_23797 ?auto_23801 ?auto_23802 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23807 - DIRECTION
      ?auto_23808 - MODE
      ?auto_23809 - DIRECTION
      ?auto_23806 - MODE
      ?auto_23810 - DIRECTION
      ?auto_23811 - MODE
    )
    :vars
    (
      ?auto_23813 - INSTRUMENT
      ?auto_23814 - SATELLITE
      ?auto_23812 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_23813 ) ( ON_BOARD ?auto_23813 ?auto_23814 ) ( SUPPORTS ?auto_23813 ?auto_23806 ) ( POWER_ON ?auto_23813 ) ( POINTING ?auto_23814 ?auto_23812 ) ( not ( = ?auto_23809 ?auto_23812 ) ) ( HAVE_IMAGE ?auto_23807 ?auto_23808 ) ( not ( = ?auto_23807 ?auto_23809 ) ) ( not ( = ?auto_23807 ?auto_23812 ) ) ( not ( = ?auto_23808 ?auto_23806 ) ) ( HAVE_IMAGE ?auto_23810 ?auto_23811 ) ( not ( = ?auto_23807 ?auto_23810 ) ) ( not ( = ?auto_23808 ?auto_23811 ) ) ( not ( = ?auto_23809 ?auto_23810 ) ) ( not ( = ?auto_23806 ?auto_23811 ) ) ( not ( = ?auto_23810 ?auto_23812 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23807 ?auto_23808 ?auto_23809 ?auto_23806 )
      ( GET-3IMAGE-VERIFY ?auto_23807 ?auto_23808 ?auto_23809 ?auto_23806 ?auto_23810 ?auto_23811 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23825 - DIRECTION
      ?auto_23826 - MODE
      ?auto_23827 - DIRECTION
      ?auto_23824 - MODE
      ?auto_23828 - DIRECTION
      ?auto_23829 - MODE
    )
    :vars
    (
      ?auto_23831 - INSTRUMENT
      ?auto_23832 - SATELLITE
      ?auto_23830 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_23831 ) ( ON_BOARD ?auto_23831 ?auto_23832 ) ( SUPPORTS ?auto_23831 ?auto_23826 ) ( POWER_ON ?auto_23831 ) ( POINTING ?auto_23832 ?auto_23830 ) ( not ( = ?auto_23825 ?auto_23830 ) ) ( HAVE_IMAGE ?auto_23827 ?auto_23824 ) ( not ( = ?auto_23827 ?auto_23825 ) ) ( not ( = ?auto_23827 ?auto_23830 ) ) ( not ( = ?auto_23824 ?auto_23826 ) ) ( HAVE_IMAGE ?auto_23828 ?auto_23829 ) ( not ( = ?auto_23825 ?auto_23828 ) ) ( not ( = ?auto_23826 ?auto_23829 ) ) ( not ( = ?auto_23827 ?auto_23828 ) ) ( not ( = ?auto_23824 ?auto_23829 ) ) ( not ( = ?auto_23828 ?auto_23830 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23827 ?auto_23824 ?auto_23825 ?auto_23826 )
      ( GET-3IMAGE-VERIFY ?auto_23825 ?auto_23826 ?auto_23827 ?auto_23824 ?auto_23828 ?auto_23829 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_23862 - DIRECTION
      ?auto_23863 - MODE
    )
    :vars
    (
      ?auto_23866 - INSTRUMENT
      ?auto_23867 - SATELLITE
      ?auto_23865 - DIRECTION
      ?auto_23864 - DIRECTION
      ?auto_23868 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_23866 ?auto_23867 ) ( SUPPORTS ?auto_23866 ?auto_23863 ) ( POWER_ON ?auto_23866 ) ( POINTING ?auto_23867 ?auto_23865 ) ( not ( = ?auto_23862 ?auto_23865 ) ) ( HAVE_IMAGE ?auto_23864 ?auto_23868 ) ( not ( = ?auto_23864 ?auto_23862 ) ) ( not ( = ?auto_23864 ?auto_23865 ) ) ( not ( = ?auto_23868 ?auto_23863 ) ) ( CALIBRATION_TARGET ?auto_23866 ?auto_23865 ) ( NOT_CALIBRATED ?auto_23866 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_23867 ?auto_23866 ?auto_23865 )
      ( GET-2IMAGE ?auto_23864 ?auto_23868 ?auto_23862 ?auto_23863 )
      ( GET-1IMAGE-VERIFY ?auto_23862 ?auto_23863 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23870 - DIRECTION
      ?auto_23871 - MODE
      ?auto_23872 - DIRECTION
      ?auto_23869 - MODE
    )
    :vars
    (
      ?auto_23875 - INSTRUMENT
      ?auto_23874 - SATELLITE
      ?auto_23873 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_23875 ?auto_23874 ) ( SUPPORTS ?auto_23875 ?auto_23869 ) ( POWER_ON ?auto_23875 ) ( POINTING ?auto_23874 ?auto_23873 ) ( not ( = ?auto_23872 ?auto_23873 ) ) ( HAVE_IMAGE ?auto_23870 ?auto_23871 ) ( not ( = ?auto_23870 ?auto_23872 ) ) ( not ( = ?auto_23870 ?auto_23873 ) ) ( not ( = ?auto_23871 ?auto_23869 ) ) ( CALIBRATION_TARGET ?auto_23875 ?auto_23873 ) ( NOT_CALIBRATED ?auto_23875 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_23872 ?auto_23869 )
      ( GET-2IMAGE-VERIFY ?auto_23870 ?auto_23871 ?auto_23872 ?auto_23869 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23877 - DIRECTION
      ?auto_23878 - MODE
      ?auto_23879 - DIRECTION
      ?auto_23876 - MODE
    )
    :vars
    (
      ?auto_23881 - INSTRUMENT
      ?auto_23880 - SATELLITE
      ?auto_23882 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_23881 ?auto_23880 ) ( SUPPORTS ?auto_23881 ?auto_23878 ) ( POWER_ON ?auto_23881 ) ( POINTING ?auto_23880 ?auto_23882 ) ( not ( = ?auto_23877 ?auto_23882 ) ) ( HAVE_IMAGE ?auto_23879 ?auto_23876 ) ( not ( = ?auto_23879 ?auto_23877 ) ) ( not ( = ?auto_23879 ?auto_23882 ) ) ( not ( = ?auto_23876 ?auto_23878 ) ) ( CALIBRATION_TARGET ?auto_23881 ?auto_23882 ) ( NOT_CALIBRATED ?auto_23881 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23879 ?auto_23876 ?auto_23877 ?auto_23878 )
      ( GET-2IMAGE-VERIFY ?auto_23877 ?auto_23878 ?auto_23879 ?auto_23876 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23893 - DIRECTION
      ?auto_23894 - MODE
      ?auto_23895 - DIRECTION
      ?auto_23892 - MODE
      ?auto_23896 - DIRECTION
      ?auto_23897 - MODE
    )
    :vars
    (
      ?auto_23899 - INSTRUMENT
      ?auto_23898 - SATELLITE
      ?auto_23900 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_23899 ?auto_23898 ) ( SUPPORTS ?auto_23899 ?auto_23897 ) ( POWER_ON ?auto_23899 ) ( POINTING ?auto_23898 ?auto_23900 ) ( not ( = ?auto_23896 ?auto_23900 ) ) ( HAVE_IMAGE ?auto_23893 ?auto_23892 ) ( not ( = ?auto_23893 ?auto_23896 ) ) ( not ( = ?auto_23893 ?auto_23900 ) ) ( not ( = ?auto_23892 ?auto_23897 ) ) ( CALIBRATION_TARGET ?auto_23899 ?auto_23900 ) ( NOT_CALIBRATED ?auto_23899 ) ( HAVE_IMAGE ?auto_23893 ?auto_23894 ) ( HAVE_IMAGE ?auto_23895 ?auto_23892 ) ( not ( = ?auto_23893 ?auto_23895 ) ) ( not ( = ?auto_23894 ?auto_23892 ) ) ( not ( = ?auto_23894 ?auto_23897 ) ) ( not ( = ?auto_23895 ?auto_23896 ) ) ( not ( = ?auto_23895 ?auto_23900 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23893 ?auto_23892 ?auto_23896 ?auto_23897 )
      ( GET-3IMAGE-VERIFY ?auto_23893 ?auto_23894 ?auto_23895 ?auto_23892 ?auto_23896 ?auto_23897 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23902 - DIRECTION
      ?auto_23903 - MODE
      ?auto_23904 - DIRECTION
      ?auto_23901 - MODE
      ?auto_23905 - DIRECTION
      ?auto_23906 - MODE
    )
    :vars
    (
      ?auto_23908 - INSTRUMENT
      ?auto_23907 - SATELLITE
      ?auto_23909 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_23908 ?auto_23907 ) ( SUPPORTS ?auto_23908 ?auto_23901 ) ( POWER_ON ?auto_23908 ) ( POINTING ?auto_23907 ?auto_23909 ) ( not ( = ?auto_23904 ?auto_23909 ) ) ( HAVE_IMAGE ?auto_23905 ?auto_23903 ) ( not ( = ?auto_23905 ?auto_23904 ) ) ( not ( = ?auto_23905 ?auto_23909 ) ) ( not ( = ?auto_23903 ?auto_23901 ) ) ( CALIBRATION_TARGET ?auto_23908 ?auto_23909 ) ( NOT_CALIBRATED ?auto_23908 ) ( HAVE_IMAGE ?auto_23902 ?auto_23903 ) ( HAVE_IMAGE ?auto_23905 ?auto_23906 ) ( not ( = ?auto_23902 ?auto_23904 ) ) ( not ( = ?auto_23902 ?auto_23905 ) ) ( not ( = ?auto_23902 ?auto_23909 ) ) ( not ( = ?auto_23903 ?auto_23906 ) ) ( not ( = ?auto_23901 ?auto_23906 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23905 ?auto_23903 ?auto_23904 ?auto_23901 )
      ( GET-3IMAGE-VERIFY ?auto_23902 ?auto_23903 ?auto_23904 ?auto_23901 ?auto_23905 ?auto_23906 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23920 - DIRECTION
      ?auto_23921 - MODE
      ?auto_23922 - DIRECTION
      ?auto_23919 - MODE
      ?auto_23923 - DIRECTION
      ?auto_23924 - MODE
    )
    :vars
    (
      ?auto_23926 - INSTRUMENT
      ?auto_23925 - SATELLITE
      ?auto_23927 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_23926 ?auto_23925 ) ( SUPPORTS ?auto_23926 ?auto_23921 ) ( POWER_ON ?auto_23926 ) ( POINTING ?auto_23925 ?auto_23927 ) ( not ( = ?auto_23920 ?auto_23927 ) ) ( HAVE_IMAGE ?auto_23923 ?auto_23924 ) ( not ( = ?auto_23923 ?auto_23920 ) ) ( not ( = ?auto_23923 ?auto_23927 ) ) ( not ( = ?auto_23924 ?auto_23921 ) ) ( CALIBRATION_TARGET ?auto_23926 ?auto_23927 ) ( NOT_CALIBRATED ?auto_23926 ) ( HAVE_IMAGE ?auto_23922 ?auto_23919 ) ( not ( = ?auto_23920 ?auto_23922 ) ) ( not ( = ?auto_23921 ?auto_23919 ) ) ( not ( = ?auto_23922 ?auto_23923 ) ) ( not ( = ?auto_23922 ?auto_23927 ) ) ( not ( = ?auto_23919 ?auto_23924 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23923 ?auto_23924 ?auto_23920 ?auto_23921 )
      ( GET-3IMAGE-VERIFY ?auto_23920 ?auto_23921 ?auto_23922 ?auto_23919 ?auto_23923 ?auto_23924 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_23957 - DIRECTION
      ?auto_23958 - MODE
    )
    :vars
    (
      ?auto_23961 - INSTRUMENT
      ?auto_23959 - SATELLITE
      ?auto_23963 - DIRECTION
      ?auto_23960 - DIRECTION
      ?auto_23962 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_23961 ?auto_23959 ) ( SUPPORTS ?auto_23961 ?auto_23958 ) ( POINTING ?auto_23959 ?auto_23963 ) ( not ( = ?auto_23957 ?auto_23963 ) ) ( HAVE_IMAGE ?auto_23960 ?auto_23962 ) ( not ( = ?auto_23960 ?auto_23957 ) ) ( not ( = ?auto_23960 ?auto_23963 ) ) ( not ( = ?auto_23962 ?auto_23958 ) ) ( CALIBRATION_TARGET ?auto_23961 ?auto_23963 ) ( POWER_AVAIL ?auto_23959 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_23961 ?auto_23959 )
      ( GET-2IMAGE ?auto_23960 ?auto_23962 ?auto_23957 ?auto_23958 )
      ( GET-1IMAGE-VERIFY ?auto_23957 ?auto_23958 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23965 - DIRECTION
      ?auto_23966 - MODE
      ?auto_23967 - DIRECTION
      ?auto_23964 - MODE
    )
    :vars
    (
      ?auto_23969 - INSTRUMENT
      ?auto_23968 - SATELLITE
      ?auto_23970 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_23969 ?auto_23968 ) ( SUPPORTS ?auto_23969 ?auto_23964 ) ( POINTING ?auto_23968 ?auto_23970 ) ( not ( = ?auto_23967 ?auto_23970 ) ) ( HAVE_IMAGE ?auto_23965 ?auto_23966 ) ( not ( = ?auto_23965 ?auto_23967 ) ) ( not ( = ?auto_23965 ?auto_23970 ) ) ( not ( = ?auto_23966 ?auto_23964 ) ) ( CALIBRATION_TARGET ?auto_23969 ?auto_23970 ) ( POWER_AVAIL ?auto_23968 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_23967 ?auto_23964 )
      ( GET-2IMAGE-VERIFY ?auto_23965 ?auto_23966 ?auto_23967 ?auto_23964 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23972 - DIRECTION
      ?auto_23973 - MODE
      ?auto_23974 - DIRECTION
      ?auto_23971 - MODE
    )
    :vars
    (
      ?auto_23975 - INSTRUMENT
      ?auto_23976 - SATELLITE
      ?auto_23977 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_23975 ?auto_23976 ) ( SUPPORTS ?auto_23975 ?auto_23973 ) ( POINTING ?auto_23976 ?auto_23977 ) ( not ( = ?auto_23972 ?auto_23977 ) ) ( HAVE_IMAGE ?auto_23974 ?auto_23971 ) ( not ( = ?auto_23974 ?auto_23972 ) ) ( not ( = ?auto_23974 ?auto_23977 ) ) ( not ( = ?auto_23971 ?auto_23973 ) ) ( CALIBRATION_TARGET ?auto_23975 ?auto_23977 ) ( POWER_AVAIL ?auto_23976 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23974 ?auto_23971 ?auto_23972 ?auto_23973 )
      ( GET-2IMAGE-VERIFY ?auto_23972 ?auto_23973 ?auto_23974 ?auto_23971 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23988 - DIRECTION
      ?auto_23989 - MODE
      ?auto_23990 - DIRECTION
      ?auto_23987 - MODE
      ?auto_23991 - DIRECTION
      ?auto_23992 - MODE
    )
    :vars
    (
      ?auto_23993 - INSTRUMENT
      ?auto_23994 - SATELLITE
      ?auto_23995 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_23993 ?auto_23994 ) ( SUPPORTS ?auto_23993 ?auto_23992 ) ( POINTING ?auto_23994 ?auto_23995 ) ( not ( = ?auto_23991 ?auto_23995 ) ) ( HAVE_IMAGE ?auto_23988 ?auto_23989 ) ( not ( = ?auto_23988 ?auto_23991 ) ) ( not ( = ?auto_23988 ?auto_23995 ) ) ( not ( = ?auto_23989 ?auto_23992 ) ) ( CALIBRATION_TARGET ?auto_23993 ?auto_23995 ) ( POWER_AVAIL ?auto_23994 ) ( HAVE_IMAGE ?auto_23990 ?auto_23987 ) ( not ( = ?auto_23988 ?auto_23990 ) ) ( not ( = ?auto_23989 ?auto_23987 ) ) ( not ( = ?auto_23990 ?auto_23991 ) ) ( not ( = ?auto_23990 ?auto_23995 ) ) ( not ( = ?auto_23987 ?auto_23992 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23988 ?auto_23989 ?auto_23991 ?auto_23992 )
      ( GET-3IMAGE-VERIFY ?auto_23988 ?auto_23989 ?auto_23990 ?auto_23987 ?auto_23991 ?auto_23992 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23997 - DIRECTION
      ?auto_23998 - MODE
      ?auto_23999 - DIRECTION
      ?auto_23996 - MODE
      ?auto_24000 - DIRECTION
      ?auto_24001 - MODE
    )
    :vars
    (
      ?auto_24002 - INSTRUMENT
      ?auto_24003 - SATELLITE
      ?auto_24004 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_24002 ?auto_24003 ) ( SUPPORTS ?auto_24002 ?auto_23996 ) ( POINTING ?auto_24003 ?auto_24004 ) ( not ( = ?auto_23999 ?auto_24004 ) ) ( HAVE_IMAGE ?auto_24000 ?auto_24001 ) ( not ( = ?auto_24000 ?auto_23999 ) ) ( not ( = ?auto_24000 ?auto_24004 ) ) ( not ( = ?auto_24001 ?auto_23996 ) ) ( CALIBRATION_TARGET ?auto_24002 ?auto_24004 ) ( POWER_AVAIL ?auto_24003 ) ( HAVE_IMAGE ?auto_23997 ?auto_23998 ) ( not ( = ?auto_23997 ?auto_23999 ) ) ( not ( = ?auto_23997 ?auto_24000 ) ) ( not ( = ?auto_23997 ?auto_24004 ) ) ( not ( = ?auto_23998 ?auto_23996 ) ) ( not ( = ?auto_23998 ?auto_24001 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24000 ?auto_24001 ?auto_23999 ?auto_23996 )
      ( GET-3IMAGE-VERIFY ?auto_23997 ?auto_23998 ?auto_23999 ?auto_23996 ?auto_24000 ?auto_24001 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24015 - DIRECTION
      ?auto_24016 - MODE
      ?auto_24017 - DIRECTION
      ?auto_24014 - MODE
      ?auto_24018 - DIRECTION
      ?auto_24019 - MODE
    )
    :vars
    (
      ?auto_24020 - INSTRUMENT
      ?auto_24021 - SATELLITE
      ?auto_24022 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_24020 ?auto_24021 ) ( SUPPORTS ?auto_24020 ?auto_24016 ) ( POINTING ?auto_24021 ?auto_24022 ) ( not ( = ?auto_24015 ?auto_24022 ) ) ( HAVE_IMAGE ?auto_24018 ?auto_24019 ) ( not ( = ?auto_24018 ?auto_24015 ) ) ( not ( = ?auto_24018 ?auto_24022 ) ) ( not ( = ?auto_24019 ?auto_24016 ) ) ( CALIBRATION_TARGET ?auto_24020 ?auto_24022 ) ( POWER_AVAIL ?auto_24021 ) ( HAVE_IMAGE ?auto_24017 ?auto_24014 ) ( not ( = ?auto_24015 ?auto_24017 ) ) ( not ( = ?auto_24016 ?auto_24014 ) ) ( not ( = ?auto_24017 ?auto_24018 ) ) ( not ( = ?auto_24017 ?auto_24022 ) ) ( not ( = ?auto_24014 ?auto_24019 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24018 ?auto_24019 ?auto_24015 ?auto_24016 )
      ( GET-3IMAGE-VERIFY ?auto_24015 ?auto_24016 ?auto_24017 ?auto_24014 ?auto_24018 ?auto_24019 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_24052 - DIRECTION
      ?auto_24053 - MODE
    )
    :vars
    (
      ?auto_24054 - INSTRUMENT
      ?auto_24055 - SATELLITE
      ?auto_24056 - DIRECTION
      ?auto_24057 - DIRECTION
      ?auto_24058 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_24054 ?auto_24055 ) ( SUPPORTS ?auto_24054 ?auto_24053 ) ( not ( = ?auto_24052 ?auto_24056 ) ) ( HAVE_IMAGE ?auto_24057 ?auto_24058 ) ( not ( = ?auto_24057 ?auto_24052 ) ) ( not ( = ?auto_24057 ?auto_24056 ) ) ( not ( = ?auto_24058 ?auto_24053 ) ) ( CALIBRATION_TARGET ?auto_24054 ?auto_24056 ) ( POWER_AVAIL ?auto_24055 ) ( POINTING ?auto_24055 ?auto_24057 ) )
    :subtasks
    ( ( !TURN_TO ?auto_24055 ?auto_24056 ?auto_24057 )
      ( GET-2IMAGE ?auto_24057 ?auto_24058 ?auto_24052 ?auto_24053 )
      ( GET-1IMAGE-VERIFY ?auto_24052 ?auto_24053 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24060 - DIRECTION
      ?auto_24061 - MODE
      ?auto_24062 - DIRECTION
      ?auto_24059 - MODE
    )
    :vars
    (
      ?auto_24064 - INSTRUMENT
      ?auto_24063 - SATELLITE
      ?auto_24065 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_24064 ?auto_24063 ) ( SUPPORTS ?auto_24064 ?auto_24059 ) ( not ( = ?auto_24062 ?auto_24065 ) ) ( HAVE_IMAGE ?auto_24060 ?auto_24061 ) ( not ( = ?auto_24060 ?auto_24062 ) ) ( not ( = ?auto_24060 ?auto_24065 ) ) ( not ( = ?auto_24061 ?auto_24059 ) ) ( CALIBRATION_TARGET ?auto_24064 ?auto_24065 ) ( POWER_AVAIL ?auto_24063 ) ( POINTING ?auto_24063 ?auto_24060 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_24062 ?auto_24059 )
      ( GET-2IMAGE-VERIFY ?auto_24060 ?auto_24061 ?auto_24062 ?auto_24059 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24067 - DIRECTION
      ?auto_24068 - MODE
      ?auto_24069 - DIRECTION
      ?auto_24066 - MODE
    )
    :vars
    (
      ?auto_24071 - INSTRUMENT
      ?auto_24070 - SATELLITE
      ?auto_24072 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_24071 ?auto_24070 ) ( SUPPORTS ?auto_24071 ?auto_24068 ) ( not ( = ?auto_24067 ?auto_24072 ) ) ( HAVE_IMAGE ?auto_24069 ?auto_24066 ) ( not ( = ?auto_24069 ?auto_24067 ) ) ( not ( = ?auto_24069 ?auto_24072 ) ) ( not ( = ?auto_24066 ?auto_24068 ) ) ( CALIBRATION_TARGET ?auto_24071 ?auto_24072 ) ( POWER_AVAIL ?auto_24070 ) ( POINTING ?auto_24070 ?auto_24069 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24069 ?auto_24066 ?auto_24067 ?auto_24068 )
      ( GET-2IMAGE-VERIFY ?auto_24067 ?auto_24068 ?auto_24069 ?auto_24066 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24083 - DIRECTION
      ?auto_24084 - MODE
      ?auto_24085 - DIRECTION
      ?auto_24082 - MODE
      ?auto_24086 - DIRECTION
      ?auto_24087 - MODE
    )
    :vars
    (
      ?auto_24089 - INSTRUMENT
      ?auto_24088 - SATELLITE
      ?auto_24090 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_24089 ?auto_24088 ) ( SUPPORTS ?auto_24089 ?auto_24087 ) ( not ( = ?auto_24086 ?auto_24090 ) ) ( HAVE_IMAGE ?auto_24085 ?auto_24082 ) ( not ( = ?auto_24085 ?auto_24086 ) ) ( not ( = ?auto_24085 ?auto_24090 ) ) ( not ( = ?auto_24082 ?auto_24087 ) ) ( CALIBRATION_TARGET ?auto_24089 ?auto_24090 ) ( POWER_AVAIL ?auto_24088 ) ( POINTING ?auto_24088 ?auto_24085 ) ( HAVE_IMAGE ?auto_24083 ?auto_24084 ) ( not ( = ?auto_24083 ?auto_24085 ) ) ( not ( = ?auto_24083 ?auto_24086 ) ) ( not ( = ?auto_24083 ?auto_24090 ) ) ( not ( = ?auto_24084 ?auto_24082 ) ) ( not ( = ?auto_24084 ?auto_24087 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24085 ?auto_24082 ?auto_24086 ?auto_24087 )
      ( GET-3IMAGE-VERIFY ?auto_24083 ?auto_24084 ?auto_24085 ?auto_24082 ?auto_24086 ?auto_24087 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24092 - DIRECTION
      ?auto_24093 - MODE
      ?auto_24094 - DIRECTION
      ?auto_24091 - MODE
      ?auto_24095 - DIRECTION
      ?auto_24096 - MODE
    )
    :vars
    (
      ?auto_24098 - INSTRUMENT
      ?auto_24097 - SATELLITE
      ?auto_24099 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_24098 ?auto_24097 ) ( SUPPORTS ?auto_24098 ?auto_24091 ) ( not ( = ?auto_24094 ?auto_24099 ) ) ( HAVE_IMAGE ?auto_24095 ?auto_24096 ) ( not ( = ?auto_24095 ?auto_24094 ) ) ( not ( = ?auto_24095 ?auto_24099 ) ) ( not ( = ?auto_24096 ?auto_24091 ) ) ( CALIBRATION_TARGET ?auto_24098 ?auto_24099 ) ( POWER_AVAIL ?auto_24097 ) ( POINTING ?auto_24097 ?auto_24095 ) ( HAVE_IMAGE ?auto_24092 ?auto_24093 ) ( not ( = ?auto_24092 ?auto_24094 ) ) ( not ( = ?auto_24092 ?auto_24095 ) ) ( not ( = ?auto_24092 ?auto_24099 ) ) ( not ( = ?auto_24093 ?auto_24091 ) ) ( not ( = ?auto_24093 ?auto_24096 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24095 ?auto_24096 ?auto_24094 ?auto_24091 )
      ( GET-3IMAGE-VERIFY ?auto_24092 ?auto_24093 ?auto_24094 ?auto_24091 ?auto_24095 ?auto_24096 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24110 - DIRECTION
      ?auto_24111 - MODE
      ?auto_24112 - DIRECTION
      ?auto_24109 - MODE
      ?auto_24113 - DIRECTION
      ?auto_24114 - MODE
    )
    :vars
    (
      ?auto_24116 - INSTRUMENT
      ?auto_24115 - SATELLITE
      ?auto_24117 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_24116 ?auto_24115 ) ( SUPPORTS ?auto_24116 ?auto_24111 ) ( not ( = ?auto_24110 ?auto_24117 ) ) ( HAVE_IMAGE ?auto_24113 ?auto_24114 ) ( not ( = ?auto_24113 ?auto_24110 ) ) ( not ( = ?auto_24113 ?auto_24117 ) ) ( not ( = ?auto_24114 ?auto_24111 ) ) ( CALIBRATION_TARGET ?auto_24116 ?auto_24117 ) ( POWER_AVAIL ?auto_24115 ) ( POINTING ?auto_24115 ?auto_24113 ) ( HAVE_IMAGE ?auto_24112 ?auto_24109 ) ( not ( = ?auto_24110 ?auto_24112 ) ) ( not ( = ?auto_24111 ?auto_24109 ) ) ( not ( = ?auto_24112 ?auto_24113 ) ) ( not ( = ?auto_24112 ?auto_24117 ) ) ( not ( = ?auto_24109 ?auto_24114 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24113 ?auto_24114 ?auto_24110 ?auto_24111 )
      ( GET-3IMAGE-VERIFY ?auto_24110 ?auto_24111 ?auto_24112 ?auto_24109 ?auto_24113 ?auto_24114 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_24147 - DIRECTION
      ?auto_24148 - MODE
    )
    :vars
    (
      ?auto_24151 - INSTRUMENT
      ?auto_24150 - SATELLITE
      ?auto_24152 - DIRECTION
      ?auto_24153 - DIRECTION
      ?auto_24149 - MODE
      ?auto_24154 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24151 ?auto_24150 ) ( SUPPORTS ?auto_24151 ?auto_24148 ) ( not ( = ?auto_24147 ?auto_24152 ) ) ( HAVE_IMAGE ?auto_24153 ?auto_24149 ) ( not ( = ?auto_24153 ?auto_24147 ) ) ( not ( = ?auto_24153 ?auto_24152 ) ) ( not ( = ?auto_24149 ?auto_24148 ) ) ( CALIBRATION_TARGET ?auto_24151 ?auto_24152 ) ( POINTING ?auto_24150 ?auto_24153 ) ( ON_BOARD ?auto_24154 ?auto_24150 ) ( POWER_ON ?auto_24154 ) ( not ( = ?auto_24151 ?auto_24154 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_24154 ?auto_24150 )
      ( GET-2IMAGE ?auto_24153 ?auto_24149 ?auto_24147 ?auto_24148 )
      ( GET-1IMAGE-VERIFY ?auto_24147 ?auto_24148 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24156 - DIRECTION
      ?auto_24157 - MODE
      ?auto_24158 - DIRECTION
      ?auto_24155 - MODE
    )
    :vars
    (
      ?auto_24159 - INSTRUMENT
      ?auto_24160 - SATELLITE
      ?auto_24161 - DIRECTION
      ?auto_24162 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24159 ?auto_24160 ) ( SUPPORTS ?auto_24159 ?auto_24155 ) ( not ( = ?auto_24158 ?auto_24161 ) ) ( HAVE_IMAGE ?auto_24156 ?auto_24157 ) ( not ( = ?auto_24156 ?auto_24158 ) ) ( not ( = ?auto_24156 ?auto_24161 ) ) ( not ( = ?auto_24157 ?auto_24155 ) ) ( CALIBRATION_TARGET ?auto_24159 ?auto_24161 ) ( POINTING ?auto_24160 ?auto_24156 ) ( ON_BOARD ?auto_24162 ?auto_24160 ) ( POWER_ON ?auto_24162 ) ( not ( = ?auto_24159 ?auto_24162 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_24158 ?auto_24155 )
      ( GET-2IMAGE-VERIFY ?auto_24156 ?auto_24157 ?auto_24158 ?auto_24155 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24164 - DIRECTION
      ?auto_24165 - MODE
      ?auto_24166 - DIRECTION
      ?auto_24163 - MODE
    )
    :vars
    (
      ?auto_24167 - INSTRUMENT
      ?auto_24168 - SATELLITE
      ?auto_24169 - DIRECTION
      ?auto_24170 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24167 ?auto_24168 ) ( SUPPORTS ?auto_24167 ?auto_24165 ) ( not ( = ?auto_24164 ?auto_24169 ) ) ( HAVE_IMAGE ?auto_24166 ?auto_24163 ) ( not ( = ?auto_24166 ?auto_24164 ) ) ( not ( = ?auto_24166 ?auto_24169 ) ) ( not ( = ?auto_24163 ?auto_24165 ) ) ( CALIBRATION_TARGET ?auto_24167 ?auto_24169 ) ( POINTING ?auto_24168 ?auto_24166 ) ( ON_BOARD ?auto_24170 ?auto_24168 ) ( POWER_ON ?auto_24170 ) ( not ( = ?auto_24167 ?auto_24170 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24166 ?auto_24163 ?auto_24164 ?auto_24165 )
      ( GET-2IMAGE-VERIFY ?auto_24164 ?auto_24165 ?auto_24166 ?auto_24163 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24182 - DIRECTION
      ?auto_24183 - MODE
      ?auto_24184 - DIRECTION
      ?auto_24181 - MODE
      ?auto_24185 - DIRECTION
      ?auto_24186 - MODE
    )
    :vars
    (
      ?auto_24187 - INSTRUMENT
      ?auto_24188 - SATELLITE
      ?auto_24189 - DIRECTION
      ?auto_24190 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24187 ?auto_24188 ) ( SUPPORTS ?auto_24187 ?auto_24186 ) ( not ( = ?auto_24185 ?auto_24189 ) ) ( HAVE_IMAGE ?auto_24184 ?auto_24183 ) ( not ( = ?auto_24184 ?auto_24185 ) ) ( not ( = ?auto_24184 ?auto_24189 ) ) ( not ( = ?auto_24183 ?auto_24186 ) ) ( CALIBRATION_TARGET ?auto_24187 ?auto_24189 ) ( POINTING ?auto_24188 ?auto_24184 ) ( ON_BOARD ?auto_24190 ?auto_24188 ) ( POWER_ON ?auto_24190 ) ( not ( = ?auto_24187 ?auto_24190 ) ) ( HAVE_IMAGE ?auto_24182 ?auto_24183 ) ( HAVE_IMAGE ?auto_24184 ?auto_24181 ) ( not ( = ?auto_24182 ?auto_24184 ) ) ( not ( = ?auto_24182 ?auto_24185 ) ) ( not ( = ?auto_24182 ?auto_24189 ) ) ( not ( = ?auto_24183 ?auto_24181 ) ) ( not ( = ?auto_24181 ?auto_24186 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24184 ?auto_24183 ?auto_24185 ?auto_24186 )
      ( GET-3IMAGE-VERIFY ?auto_24182 ?auto_24183 ?auto_24184 ?auto_24181 ?auto_24185 ?auto_24186 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24192 - DIRECTION
      ?auto_24193 - MODE
      ?auto_24194 - DIRECTION
      ?auto_24191 - MODE
      ?auto_24195 - DIRECTION
      ?auto_24196 - MODE
    )
    :vars
    (
      ?auto_24197 - INSTRUMENT
      ?auto_24198 - SATELLITE
      ?auto_24199 - DIRECTION
      ?auto_24200 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24197 ?auto_24198 ) ( SUPPORTS ?auto_24197 ?auto_24191 ) ( not ( = ?auto_24194 ?auto_24199 ) ) ( HAVE_IMAGE ?auto_24195 ?auto_24196 ) ( not ( = ?auto_24195 ?auto_24194 ) ) ( not ( = ?auto_24195 ?auto_24199 ) ) ( not ( = ?auto_24196 ?auto_24191 ) ) ( CALIBRATION_TARGET ?auto_24197 ?auto_24199 ) ( POINTING ?auto_24198 ?auto_24195 ) ( ON_BOARD ?auto_24200 ?auto_24198 ) ( POWER_ON ?auto_24200 ) ( not ( = ?auto_24197 ?auto_24200 ) ) ( HAVE_IMAGE ?auto_24192 ?auto_24193 ) ( not ( = ?auto_24192 ?auto_24194 ) ) ( not ( = ?auto_24192 ?auto_24195 ) ) ( not ( = ?auto_24192 ?auto_24199 ) ) ( not ( = ?auto_24193 ?auto_24191 ) ) ( not ( = ?auto_24193 ?auto_24196 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24195 ?auto_24196 ?auto_24194 ?auto_24191 )
      ( GET-3IMAGE-VERIFY ?auto_24192 ?auto_24193 ?auto_24194 ?auto_24191 ?auto_24195 ?auto_24196 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24212 - DIRECTION
      ?auto_24213 - MODE
      ?auto_24214 - DIRECTION
      ?auto_24211 - MODE
      ?auto_24215 - DIRECTION
      ?auto_24216 - MODE
    )
    :vars
    (
      ?auto_24217 - INSTRUMENT
      ?auto_24218 - SATELLITE
      ?auto_24219 - DIRECTION
      ?auto_24220 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24217 ?auto_24218 ) ( SUPPORTS ?auto_24217 ?auto_24213 ) ( not ( = ?auto_24212 ?auto_24219 ) ) ( HAVE_IMAGE ?auto_24215 ?auto_24216 ) ( not ( = ?auto_24215 ?auto_24212 ) ) ( not ( = ?auto_24215 ?auto_24219 ) ) ( not ( = ?auto_24216 ?auto_24213 ) ) ( CALIBRATION_TARGET ?auto_24217 ?auto_24219 ) ( POINTING ?auto_24218 ?auto_24215 ) ( ON_BOARD ?auto_24220 ?auto_24218 ) ( POWER_ON ?auto_24220 ) ( not ( = ?auto_24217 ?auto_24220 ) ) ( HAVE_IMAGE ?auto_24214 ?auto_24211 ) ( not ( = ?auto_24212 ?auto_24214 ) ) ( not ( = ?auto_24213 ?auto_24211 ) ) ( not ( = ?auto_24214 ?auto_24215 ) ) ( not ( = ?auto_24214 ?auto_24219 ) ) ( not ( = ?auto_24211 ?auto_24216 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24215 ?auto_24216 ?auto_24212 ?auto_24213 )
      ( GET-3IMAGE-VERIFY ?auto_24212 ?auto_24213 ?auto_24214 ?auto_24211 ?auto_24215 ?auto_24216 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_24253 - DIRECTION
      ?auto_24254 - MODE
    )
    :vars
    (
      ?auto_24255 - INSTRUMENT
      ?auto_24256 - SATELLITE
      ?auto_24257 - DIRECTION
      ?auto_24259 - DIRECTION
      ?auto_24260 - MODE
      ?auto_24258 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24255 ?auto_24256 ) ( SUPPORTS ?auto_24255 ?auto_24254 ) ( not ( = ?auto_24253 ?auto_24257 ) ) ( not ( = ?auto_24259 ?auto_24253 ) ) ( not ( = ?auto_24259 ?auto_24257 ) ) ( not ( = ?auto_24260 ?auto_24254 ) ) ( CALIBRATION_TARGET ?auto_24255 ?auto_24257 ) ( POINTING ?auto_24256 ?auto_24259 ) ( ON_BOARD ?auto_24258 ?auto_24256 ) ( POWER_ON ?auto_24258 ) ( not ( = ?auto_24255 ?auto_24258 ) ) ( CALIBRATED ?auto_24258 ) ( SUPPORTS ?auto_24258 ?auto_24260 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_24259 ?auto_24260 )
      ( GET-2IMAGE ?auto_24259 ?auto_24260 ?auto_24253 ?auto_24254 )
      ( GET-1IMAGE-VERIFY ?auto_24253 ?auto_24254 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24262 - DIRECTION
      ?auto_24263 - MODE
      ?auto_24264 - DIRECTION
      ?auto_24261 - MODE
    )
    :vars
    (
      ?auto_24267 - INSTRUMENT
      ?auto_24266 - SATELLITE
      ?auto_24265 - DIRECTION
      ?auto_24268 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24267 ?auto_24266 ) ( SUPPORTS ?auto_24267 ?auto_24261 ) ( not ( = ?auto_24264 ?auto_24265 ) ) ( not ( = ?auto_24262 ?auto_24264 ) ) ( not ( = ?auto_24262 ?auto_24265 ) ) ( not ( = ?auto_24263 ?auto_24261 ) ) ( CALIBRATION_TARGET ?auto_24267 ?auto_24265 ) ( POINTING ?auto_24266 ?auto_24262 ) ( ON_BOARD ?auto_24268 ?auto_24266 ) ( POWER_ON ?auto_24268 ) ( not ( = ?auto_24267 ?auto_24268 ) ) ( CALIBRATED ?auto_24268 ) ( SUPPORTS ?auto_24268 ?auto_24263 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_24264 ?auto_24261 )
      ( GET-2IMAGE-VERIFY ?auto_24262 ?auto_24263 ?auto_24264 ?auto_24261 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24270 - DIRECTION
      ?auto_24271 - MODE
      ?auto_24272 - DIRECTION
      ?auto_24269 - MODE
    )
    :vars
    (
      ?auto_24273 - INSTRUMENT
      ?auto_24275 - SATELLITE
      ?auto_24274 - DIRECTION
      ?auto_24276 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24273 ?auto_24275 ) ( SUPPORTS ?auto_24273 ?auto_24271 ) ( not ( = ?auto_24270 ?auto_24274 ) ) ( not ( = ?auto_24272 ?auto_24270 ) ) ( not ( = ?auto_24272 ?auto_24274 ) ) ( not ( = ?auto_24269 ?auto_24271 ) ) ( CALIBRATION_TARGET ?auto_24273 ?auto_24274 ) ( POINTING ?auto_24275 ?auto_24272 ) ( ON_BOARD ?auto_24276 ?auto_24275 ) ( POWER_ON ?auto_24276 ) ( not ( = ?auto_24273 ?auto_24276 ) ) ( CALIBRATED ?auto_24276 ) ( SUPPORTS ?auto_24276 ?auto_24269 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24272 ?auto_24269 ?auto_24270 ?auto_24271 )
      ( GET-2IMAGE-VERIFY ?auto_24270 ?auto_24271 ?auto_24272 ?auto_24269 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_24359 - DIRECTION
      ?auto_24360 - MODE
    )
    :vars
    (
      ?auto_24363 - INSTRUMENT
      ?auto_24365 - SATELLITE
      ?auto_24364 - DIRECTION
      ?auto_24361 - DIRECTION
      ?auto_24362 - MODE
      ?auto_24366 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24363 ?auto_24365 ) ( SUPPORTS ?auto_24363 ?auto_24360 ) ( not ( = ?auto_24359 ?auto_24364 ) ) ( not ( = ?auto_24361 ?auto_24359 ) ) ( not ( = ?auto_24361 ?auto_24364 ) ) ( not ( = ?auto_24362 ?auto_24360 ) ) ( CALIBRATION_TARGET ?auto_24363 ?auto_24364 ) ( ON_BOARD ?auto_24366 ?auto_24365 ) ( POWER_ON ?auto_24366 ) ( not ( = ?auto_24363 ?auto_24366 ) ) ( CALIBRATED ?auto_24366 ) ( SUPPORTS ?auto_24366 ?auto_24362 ) ( POINTING ?auto_24365 ?auto_24364 ) )
    :subtasks
    ( ( !TURN_TO ?auto_24365 ?auto_24361 ?auto_24364 )
      ( GET-2IMAGE ?auto_24361 ?auto_24362 ?auto_24359 ?auto_24360 )
      ( GET-1IMAGE-VERIFY ?auto_24359 ?auto_24360 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24368 - DIRECTION
      ?auto_24369 - MODE
      ?auto_24370 - DIRECTION
      ?auto_24367 - MODE
    )
    :vars
    (
      ?auto_24371 - INSTRUMENT
      ?auto_24372 - SATELLITE
      ?auto_24373 - DIRECTION
      ?auto_24374 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24371 ?auto_24372 ) ( SUPPORTS ?auto_24371 ?auto_24367 ) ( not ( = ?auto_24370 ?auto_24373 ) ) ( not ( = ?auto_24368 ?auto_24370 ) ) ( not ( = ?auto_24368 ?auto_24373 ) ) ( not ( = ?auto_24369 ?auto_24367 ) ) ( CALIBRATION_TARGET ?auto_24371 ?auto_24373 ) ( ON_BOARD ?auto_24374 ?auto_24372 ) ( POWER_ON ?auto_24374 ) ( not ( = ?auto_24371 ?auto_24374 ) ) ( CALIBRATED ?auto_24374 ) ( SUPPORTS ?auto_24374 ?auto_24369 ) ( POINTING ?auto_24372 ?auto_24373 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_24370 ?auto_24367 )
      ( GET-2IMAGE-VERIFY ?auto_24368 ?auto_24369 ?auto_24370 ?auto_24367 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24376 - DIRECTION
      ?auto_24377 - MODE
      ?auto_24378 - DIRECTION
      ?auto_24375 - MODE
    )
    :vars
    (
      ?auto_24379 - INSTRUMENT
      ?auto_24381 - SATELLITE
      ?auto_24380 - DIRECTION
      ?auto_24382 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24379 ?auto_24381 ) ( SUPPORTS ?auto_24379 ?auto_24377 ) ( not ( = ?auto_24376 ?auto_24380 ) ) ( not ( = ?auto_24378 ?auto_24376 ) ) ( not ( = ?auto_24378 ?auto_24380 ) ) ( not ( = ?auto_24375 ?auto_24377 ) ) ( CALIBRATION_TARGET ?auto_24379 ?auto_24380 ) ( ON_BOARD ?auto_24382 ?auto_24381 ) ( POWER_ON ?auto_24382 ) ( not ( = ?auto_24379 ?auto_24382 ) ) ( CALIBRATED ?auto_24382 ) ( SUPPORTS ?auto_24382 ?auto_24375 ) ( POINTING ?auto_24381 ?auto_24380 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24378 ?auto_24375 ?auto_24376 ?auto_24377 )
      ( GET-2IMAGE-VERIFY ?auto_24376 ?auto_24377 ?auto_24378 ?auto_24375 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_24465 - DIRECTION
      ?auto_24466 - MODE
    )
    :vars
    (
      ?auto_24467 - INSTRUMENT
      ?auto_24471 - SATELLITE
      ?auto_24470 - DIRECTION
      ?auto_24469 - DIRECTION
      ?auto_24468 - MODE
      ?auto_24472 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24467 ?auto_24471 ) ( SUPPORTS ?auto_24467 ?auto_24466 ) ( not ( = ?auto_24465 ?auto_24470 ) ) ( not ( = ?auto_24469 ?auto_24465 ) ) ( not ( = ?auto_24469 ?auto_24470 ) ) ( not ( = ?auto_24468 ?auto_24466 ) ) ( CALIBRATION_TARGET ?auto_24467 ?auto_24470 ) ( ON_BOARD ?auto_24472 ?auto_24471 ) ( POWER_ON ?auto_24472 ) ( not ( = ?auto_24467 ?auto_24472 ) ) ( SUPPORTS ?auto_24472 ?auto_24468 ) ( POINTING ?auto_24471 ?auto_24470 ) ( CALIBRATION_TARGET ?auto_24472 ?auto_24470 ) ( NOT_CALIBRATED ?auto_24472 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_24471 ?auto_24472 ?auto_24470 )
      ( GET-2IMAGE ?auto_24469 ?auto_24468 ?auto_24465 ?auto_24466 )
      ( GET-1IMAGE-VERIFY ?auto_24465 ?auto_24466 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24474 - DIRECTION
      ?auto_24475 - MODE
      ?auto_24476 - DIRECTION
      ?auto_24473 - MODE
    )
    :vars
    (
      ?auto_24477 - INSTRUMENT
      ?auto_24479 - SATELLITE
      ?auto_24478 - DIRECTION
      ?auto_24480 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24477 ?auto_24479 ) ( SUPPORTS ?auto_24477 ?auto_24473 ) ( not ( = ?auto_24476 ?auto_24478 ) ) ( not ( = ?auto_24474 ?auto_24476 ) ) ( not ( = ?auto_24474 ?auto_24478 ) ) ( not ( = ?auto_24475 ?auto_24473 ) ) ( CALIBRATION_TARGET ?auto_24477 ?auto_24478 ) ( ON_BOARD ?auto_24480 ?auto_24479 ) ( POWER_ON ?auto_24480 ) ( not ( = ?auto_24477 ?auto_24480 ) ) ( SUPPORTS ?auto_24480 ?auto_24475 ) ( POINTING ?auto_24479 ?auto_24478 ) ( CALIBRATION_TARGET ?auto_24480 ?auto_24478 ) ( NOT_CALIBRATED ?auto_24480 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_24476 ?auto_24473 )
      ( GET-2IMAGE-VERIFY ?auto_24474 ?auto_24475 ?auto_24476 ?auto_24473 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24482 - DIRECTION
      ?auto_24483 - MODE
      ?auto_24484 - DIRECTION
      ?auto_24481 - MODE
    )
    :vars
    (
      ?auto_24487 - INSTRUMENT
      ?auto_24488 - SATELLITE
      ?auto_24485 - DIRECTION
      ?auto_24486 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24487 ?auto_24488 ) ( SUPPORTS ?auto_24487 ?auto_24483 ) ( not ( = ?auto_24482 ?auto_24485 ) ) ( not ( = ?auto_24484 ?auto_24482 ) ) ( not ( = ?auto_24484 ?auto_24485 ) ) ( not ( = ?auto_24481 ?auto_24483 ) ) ( CALIBRATION_TARGET ?auto_24487 ?auto_24485 ) ( ON_BOARD ?auto_24486 ?auto_24488 ) ( POWER_ON ?auto_24486 ) ( not ( = ?auto_24487 ?auto_24486 ) ) ( SUPPORTS ?auto_24486 ?auto_24481 ) ( POINTING ?auto_24488 ?auto_24485 ) ( CALIBRATION_TARGET ?auto_24486 ?auto_24485 ) ( NOT_CALIBRATED ?auto_24486 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24484 ?auto_24481 ?auto_24482 ?auto_24483 )
      ( GET-2IMAGE-VERIFY ?auto_24482 ?auto_24483 ?auto_24484 ?auto_24481 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25096 - DIRECTION
      ?auto_25097 - MODE
      ?auto_25098 - DIRECTION
      ?auto_25095 - MODE
      ?auto_25099 - DIRECTION
      ?auto_25100 - MODE
    )
    :vars
    (
      ?auto_25102 - INSTRUMENT
      ?auto_25103 - SATELLITE
      ?auto_25101 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_25102 ) ( ON_BOARD ?auto_25102 ?auto_25103 ) ( SUPPORTS ?auto_25102 ?auto_25100 ) ( POWER_ON ?auto_25102 ) ( POINTING ?auto_25103 ?auto_25101 ) ( not ( = ?auto_25099 ?auto_25101 ) ) ( HAVE_IMAGE ?auto_25096 ?auto_25097 ) ( not ( = ?auto_25096 ?auto_25099 ) ) ( not ( = ?auto_25096 ?auto_25101 ) ) ( not ( = ?auto_25097 ?auto_25100 ) ) ( HAVE_IMAGE ?auto_25098 ?auto_25095 ) ( not ( = ?auto_25096 ?auto_25098 ) ) ( not ( = ?auto_25097 ?auto_25095 ) ) ( not ( = ?auto_25098 ?auto_25099 ) ) ( not ( = ?auto_25098 ?auto_25101 ) ) ( not ( = ?auto_25095 ?auto_25100 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25096 ?auto_25097 ?auto_25099 ?auto_25100 )
      ( GET-3IMAGE-VERIFY ?auto_25096 ?auto_25097 ?auto_25098 ?auto_25095 ?auto_25099 ?auto_25100 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25111 - DIRECTION
      ?auto_25112 - MODE
      ?auto_25113 - DIRECTION
      ?auto_25110 - MODE
      ?auto_25114 - DIRECTION
      ?auto_25115 - MODE
    )
    :vars
    (
      ?auto_25117 - INSTRUMENT
      ?auto_25118 - SATELLITE
      ?auto_25116 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_25117 ) ( ON_BOARD ?auto_25117 ?auto_25118 ) ( SUPPORTS ?auto_25117 ?auto_25110 ) ( POWER_ON ?auto_25117 ) ( POINTING ?auto_25118 ?auto_25116 ) ( not ( = ?auto_25113 ?auto_25116 ) ) ( HAVE_IMAGE ?auto_25114 ?auto_25112 ) ( not ( = ?auto_25114 ?auto_25113 ) ) ( not ( = ?auto_25114 ?auto_25116 ) ) ( not ( = ?auto_25112 ?auto_25110 ) ) ( HAVE_IMAGE ?auto_25111 ?auto_25112 ) ( HAVE_IMAGE ?auto_25114 ?auto_25115 ) ( not ( = ?auto_25111 ?auto_25113 ) ) ( not ( = ?auto_25111 ?auto_25114 ) ) ( not ( = ?auto_25111 ?auto_25116 ) ) ( not ( = ?auto_25112 ?auto_25115 ) ) ( not ( = ?auto_25110 ?auto_25115 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25114 ?auto_25112 ?auto_25113 ?auto_25110 )
      ( GET-3IMAGE-VERIFY ?auto_25111 ?auto_25112 ?auto_25113 ?auto_25110 ?auto_25114 ?auto_25115 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25144 - DIRECTION
      ?auto_25145 - MODE
      ?auto_25146 - DIRECTION
      ?auto_25143 - MODE
      ?auto_25147 - DIRECTION
      ?auto_25148 - MODE
    )
    :vars
    (
      ?auto_25152 - INSTRUMENT
      ?auto_25153 - SATELLITE
      ?auto_25151 - DIRECTION
      ?auto_25150 - DIRECTION
      ?auto_25149 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_25152 ) ( ON_BOARD ?auto_25152 ?auto_25153 ) ( SUPPORTS ?auto_25152 ?auto_25148 ) ( POWER_ON ?auto_25152 ) ( POINTING ?auto_25153 ?auto_25151 ) ( not ( = ?auto_25147 ?auto_25151 ) ) ( HAVE_IMAGE ?auto_25150 ?auto_25149 ) ( not ( = ?auto_25150 ?auto_25147 ) ) ( not ( = ?auto_25150 ?auto_25151 ) ) ( not ( = ?auto_25149 ?auto_25148 ) ) ( HAVE_IMAGE ?auto_25144 ?auto_25145 ) ( HAVE_IMAGE ?auto_25146 ?auto_25143 ) ( not ( = ?auto_25144 ?auto_25146 ) ) ( not ( = ?auto_25144 ?auto_25147 ) ) ( not ( = ?auto_25144 ?auto_25151 ) ) ( not ( = ?auto_25144 ?auto_25150 ) ) ( not ( = ?auto_25145 ?auto_25143 ) ) ( not ( = ?auto_25145 ?auto_25148 ) ) ( not ( = ?auto_25145 ?auto_25149 ) ) ( not ( = ?auto_25146 ?auto_25147 ) ) ( not ( = ?auto_25146 ?auto_25151 ) ) ( not ( = ?auto_25146 ?auto_25150 ) ) ( not ( = ?auto_25143 ?auto_25148 ) ) ( not ( = ?auto_25143 ?auto_25149 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25150 ?auto_25149 ?auto_25147 ?auto_25148 )
      ( GET-3IMAGE-VERIFY ?auto_25144 ?auto_25145 ?auto_25146 ?auto_25143 ?auto_25147 ?auto_25148 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25161 - DIRECTION
      ?auto_25162 - MODE
      ?auto_25163 - DIRECTION
      ?auto_25160 - MODE
      ?auto_25164 - DIRECTION
      ?auto_25165 - MODE
    )
    :vars
    (
      ?auto_25169 - INSTRUMENT
      ?auto_25170 - SATELLITE
      ?auto_25168 - DIRECTION
      ?auto_25167 - DIRECTION
      ?auto_25166 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_25169 ) ( ON_BOARD ?auto_25169 ?auto_25170 ) ( SUPPORTS ?auto_25169 ?auto_25160 ) ( POWER_ON ?auto_25169 ) ( POINTING ?auto_25170 ?auto_25168 ) ( not ( = ?auto_25163 ?auto_25168 ) ) ( HAVE_IMAGE ?auto_25167 ?auto_25166 ) ( not ( = ?auto_25167 ?auto_25163 ) ) ( not ( = ?auto_25167 ?auto_25168 ) ) ( not ( = ?auto_25166 ?auto_25160 ) ) ( HAVE_IMAGE ?auto_25161 ?auto_25162 ) ( HAVE_IMAGE ?auto_25164 ?auto_25165 ) ( not ( = ?auto_25161 ?auto_25163 ) ) ( not ( = ?auto_25161 ?auto_25164 ) ) ( not ( = ?auto_25161 ?auto_25168 ) ) ( not ( = ?auto_25161 ?auto_25167 ) ) ( not ( = ?auto_25162 ?auto_25160 ) ) ( not ( = ?auto_25162 ?auto_25165 ) ) ( not ( = ?auto_25162 ?auto_25166 ) ) ( not ( = ?auto_25163 ?auto_25164 ) ) ( not ( = ?auto_25160 ?auto_25165 ) ) ( not ( = ?auto_25164 ?auto_25168 ) ) ( not ( = ?auto_25164 ?auto_25167 ) ) ( not ( = ?auto_25165 ?auto_25166 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25167 ?auto_25166 ?auto_25163 ?auto_25160 )
      ( GET-3IMAGE-VERIFY ?auto_25161 ?auto_25162 ?auto_25163 ?auto_25160 ?auto_25164 ?auto_25165 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25213 - DIRECTION
      ?auto_25214 - MODE
      ?auto_25215 - DIRECTION
      ?auto_25212 - MODE
      ?auto_25216 - DIRECTION
      ?auto_25217 - MODE
    )
    :vars
    (
      ?auto_25221 - INSTRUMENT
      ?auto_25222 - SATELLITE
      ?auto_25220 - DIRECTION
      ?auto_25219 - DIRECTION
      ?auto_25218 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_25221 ) ( ON_BOARD ?auto_25221 ?auto_25222 ) ( SUPPORTS ?auto_25221 ?auto_25214 ) ( POWER_ON ?auto_25221 ) ( POINTING ?auto_25222 ?auto_25220 ) ( not ( = ?auto_25213 ?auto_25220 ) ) ( HAVE_IMAGE ?auto_25219 ?auto_25218 ) ( not ( = ?auto_25219 ?auto_25213 ) ) ( not ( = ?auto_25219 ?auto_25220 ) ) ( not ( = ?auto_25218 ?auto_25214 ) ) ( HAVE_IMAGE ?auto_25215 ?auto_25212 ) ( HAVE_IMAGE ?auto_25216 ?auto_25217 ) ( not ( = ?auto_25213 ?auto_25215 ) ) ( not ( = ?auto_25213 ?auto_25216 ) ) ( not ( = ?auto_25214 ?auto_25212 ) ) ( not ( = ?auto_25214 ?auto_25217 ) ) ( not ( = ?auto_25215 ?auto_25216 ) ) ( not ( = ?auto_25215 ?auto_25220 ) ) ( not ( = ?auto_25215 ?auto_25219 ) ) ( not ( = ?auto_25212 ?auto_25217 ) ) ( not ( = ?auto_25212 ?auto_25218 ) ) ( not ( = ?auto_25216 ?auto_25220 ) ) ( not ( = ?auto_25216 ?auto_25219 ) ) ( not ( = ?auto_25217 ?auto_25218 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25219 ?auto_25218 ?auto_25213 ?auto_25214 )
      ( GET-3IMAGE-VERIFY ?auto_25213 ?auto_25214 ?auto_25215 ?auto_25212 ?auto_25216 ?auto_25217 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25304 - DIRECTION
      ?auto_25305 - MODE
      ?auto_25306 - DIRECTION
      ?auto_25303 - MODE
      ?auto_25307 - DIRECTION
      ?auto_25308 - MODE
    )
    :vars
    (
      ?auto_25309 - INSTRUMENT
      ?auto_25311 - SATELLITE
      ?auto_25310 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25309 ?auto_25311 ) ( SUPPORTS ?auto_25309 ?auto_25308 ) ( POWER_ON ?auto_25309 ) ( POINTING ?auto_25311 ?auto_25310 ) ( not ( = ?auto_25307 ?auto_25310 ) ) ( HAVE_IMAGE ?auto_25306 ?auto_25305 ) ( not ( = ?auto_25306 ?auto_25307 ) ) ( not ( = ?auto_25306 ?auto_25310 ) ) ( not ( = ?auto_25305 ?auto_25308 ) ) ( CALIBRATION_TARGET ?auto_25309 ?auto_25310 ) ( NOT_CALIBRATED ?auto_25309 ) ( HAVE_IMAGE ?auto_25304 ?auto_25305 ) ( HAVE_IMAGE ?auto_25306 ?auto_25303 ) ( not ( = ?auto_25304 ?auto_25306 ) ) ( not ( = ?auto_25304 ?auto_25307 ) ) ( not ( = ?auto_25304 ?auto_25310 ) ) ( not ( = ?auto_25305 ?auto_25303 ) ) ( not ( = ?auto_25303 ?auto_25308 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25306 ?auto_25305 ?auto_25307 ?auto_25308 )
      ( GET-3IMAGE-VERIFY ?auto_25304 ?auto_25305 ?auto_25306 ?auto_25303 ?auto_25307 ?auto_25308 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25313 - DIRECTION
      ?auto_25314 - MODE
      ?auto_25315 - DIRECTION
      ?auto_25312 - MODE
      ?auto_25316 - DIRECTION
      ?auto_25317 - MODE
    )
    :vars
    (
      ?auto_25318 - INSTRUMENT
      ?auto_25320 - SATELLITE
      ?auto_25319 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25318 ?auto_25320 ) ( SUPPORTS ?auto_25318 ?auto_25317 ) ( POWER_ON ?auto_25318 ) ( POINTING ?auto_25320 ?auto_25319 ) ( not ( = ?auto_25316 ?auto_25319 ) ) ( HAVE_IMAGE ?auto_25313 ?auto_25314 ) ( not ( = ?auto_25313 ?auto_25316 ) ) ( not ( = ?auto_25313 ?auto_25319 ) ) ( not ( = ?auto_25314 ?auto_25317 ) ) ( CALIBRATION_TARGET ?auto_25318 ?auto_25319 ) ( NOT_CALIBRATED ?auto_25318 ) ( HAVE_IMAGE ?auto_25315 ?auto_25312 ) ( not ( = ?auto_25313 ?auto_25315 ) ) ( not ( = ?auto_25314 ?auto_25312 ) ) ( not ( = ?auto_25315 ?auto_25316 ) ) ( not ( = ?auto_25315 ?auto_25319 ) ) ( not ( = ?auto_25312 ?auto_25317 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25313 ?auto_25314 ?auto_25316 ?auto_25317 )
      ( GET-3IMAGE-VERIFY ?auto_25313 ?auto_25314 ?auto_25315 ?auto_25312 ?auto_25316 ?auto_25317 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25322 - DIRECTION
      ?auto_25323 - MODE
      ?auto_25324 - DIRECTION
      ?auto_25321 - MODE
      ?auto_25325 - DIRECTION
      ?auto_25326 - MODE
    )
    :vars
    (
      ?auto_25327 - INSTRUMENT
      ?auto_25329 - SATELLITE
      ?auto_25328 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25327 ?auto_25329 ) ( SUPPORTS ?auto_25327 ?auto_25321 ) ( POWER_ON ?auto_25327 ) ( POINTING ?auto_25329 ?auto_25328 ) ( not ( = ?auto_25324 ?auto_25328 ) ) ( HAVE_IMAGE ?auto_25325 ?auto_25326 ) ( not ( = ?auto_25325 ?auto_25324 ) ) ( not ( = ?auto_25325 ?auto_25328 ) ) ( not ( = ?auto_25326 ?auto_25321 ) ) ( CALIBRATION_TARGET ?auto_25327 ?auto_25328 ) ( NOT_CALIBRATED ?auto_25327 ) ( HAVE_IMAGE ?auto_25322 ?auto_25323 ) ( not ( = ?auto_25322 ?auto_25324 ) ) ( not ( = ?auto_25322 ?auto_25325 ) ) ( not ( = ?auto_25322 ?auto_25328 ) ) ( not ( = ?auto_25323 ?auto_25321 ) ) ( not ( = ?auto_25323 ?auto_25326 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25325 ?auto_25326 ?auto_25324 ?auto_25321 )
      ( GET-3IMAGE-VERIFY ?auto_25322 ?auto_25323 ?auto_25324 ?auto_25321 ?auto_25325 ?auto_25326 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25352 - DIRECTION
      ?auto_25353 - MODE
      ?auto_25354 - DIRECTION
      ?auto_25351 - MODE
      ?auto_25355 - DIRECTION
      ?auto_25356 - MODE
    )
    :vars
    (
      ?auto_25357 - INSTRUMENT
      ?auto_25359 - SATELLITE
      ?auto_25358 - DIRECTION
      ?auto_25360 - DIRECTION
      ?auto_25361 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_25357 ?auto_25359 ) ( SUPPORTS ?auto_25357 ?auto_25356 ) ( POWER_ON ?auto_25357 ) ( POINTING ?auto_25359 ?auto_25358 ) ( not ( = ?auto_25355 ?auto_25358 ) ) ( HAVE_IMAGE ?auto_25360 ?auto_25361 ) ( not ( = ?auto_25360 ?auto_25355 ) ) ( not ( = ?auto_25360 ?auto_25358 ) ) ( not ( = ?auto_25361 ?auto_25356 ) ) ( CALIBRATION_TARGET ?auto_25357 ?auto_25358 ) ( NOT_CALIBRATED ?auto_25357 ) ( HAVE_IMAGE ?auto_25352 ?auto_25353 ) ( HAVE_IMAGE ?auto_25354 ?auto_25351 ) ( not ( = ?auto_25352 ?auto_25354 ) ) ( not ( = ?auto_25352 ?auto_25355 ) ) ( not ( = ?auto_25352 ?auto_25358 ) ) ( not ( = ?auto_25352 ?auto_25360 ) ) ( not ( = ?auto_25353 ?auto_25351 ) ) ( not ( = ?auto_25353 ?auto_25356 ) ) ( not ( = ?auto_25353 ?auto_25361 ) ) ( not ( = ?auto_25354 ?auto_25355 ) ) ( not ( = ?auto_25354 ?auto_25358 ) ) ( not ( = ?auto_25354 ?auto_25360 ) ) ( not ( = ?auto_25351 ?auto_25356 ) ) ( not ( = ?auto_25351 ?auto_25361 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25360 ?auto_25361 ?auto_25355 ?auto_25356 )
      ( GET-3IMAGE-VERIFY ?auto_25352 ?auto_25353 ?auto_25354 ?auto_25351 ?auto_25355 ?auto_25356 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25369 - DIRECTION
      ?auto_25370 - MODE
      ?auto_25371 - DIRECTION
      ?auto_25368 - MODE
      ?auto_25372 - DIRECTION
      ?auto_25373 - MODE
    )
    :vars
    (
      ?auto_25374 - INSTRUMENT
      ?auto_25376 - SATELLITE
      ?auto_25375 - DIRECTION
      ?auto_25377 - DIRECTION
      ?auto_25378 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_25374 ?auto_25376 ) ( SUPPORTS ?auto_25374 ?auto_25368 ) ( POWER_ON ?auto_25374 ) ( POINTING ?auto_25376 ?auto_25375 ) ( not ( = ?auto_25371 ?auto_25375 ) ) ( HAVE_IMAGE ?auto_25377 ?auto_25378 ) ( not ( = ?auto_25377 ?auto_25371 ) ) ( not ( = ?auto_25377 ?auto_25375 ) ) ( not ( = ?auto_25378 ?auto_25368 ) ) ( CALIBRATION_TARGET ?auto_25374 ?auto_25375 ) ( NOT_CALIBRATED ?auto_25374 ) ( HAVE_IMAGE ?auto_25369 ?auto_25370 ) ( HAVE_IMAGE ?auto_25372 ?auto_25373 ) ( not ( = ?auto_25369 ?auto_25371 ) ) ( not ( = ?auto_25369 ?auto_25372 ) ) ( not ( = ?auto_25369 ?auto_25375 ) ) ( not ( = ?auto_25369 ?auto_25377 ) ) ( not ( = ?auto_25370 ?auto_25368 ) ) ( not ( = ?auto_25370 ?auto_25373 ) ) ( not ( = ?auto_25370 ?auto_25378 ) ) ( not ( = ?auto_25371 ?auto_25372 ) ) ( not ( = ?auto_25368 ?auto_25373 ) ) ( not ( = ?auto_25372 ?auto_25375 ) ) ( not ( = ?auto_25372 ?auto_25377 ) ) ( not ( = ?auto_25373 ?auto_25378 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25377 ?auto_25378 ?auto_25371 ?auto_25368 )
      ( GET-3IMAGE-VERIFY ?auto_25369 ?auto_25370 ?auto_25371 ?auto_25368 ?auto_25372 ?auto_25373 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25391 - DIRECTION
      ?auto_25392 - MODE
      ?auto_25393 - DIRECTION
      ?auto_25390 - MODE
      ?auto_25394 - DIRECTION
      ?auto_25395 - MODE
    )
    :vars
    (
      ?auto_25396 - INSTRUMENT
      ?auto_25398 - SATELLITE
      ?auto_25397 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25396 ?auto_25398 ) ( SUPPORTS ?auto_25396 ?auto_25392 ) ( POWER_ON ?auto_25396 ) ( POINTING ?auto_25398 ?auto_25397 ) ( not ( = ?auto_25391 ?auto_25397 ) ) ( HAVE_IMAGE ?auto_25393 ?auto_25395 ) ( not ( = ?auto_25393 ?auto_25391 ) ) ( not ( = ?auto_25393 ?auto_25397 ) ) ( not ( = ?auto_25395 ?auto_25392 ) ) ( CALIBRATION_TARGET ?auto_25396 ?auto_25397 ) ( NOT_CALIBRATED ?auto_25396 ) ( HAVE_IMAGE ?auto_25393 ?auto_25390 ) ( HAVE_IMAGE ?auto_25394 ?auto_25395 ) ( not ( = ?auto_25391 ?auto_25394 ) ) ( not ( = ?auto_25392 ?auto_25390 ) ) ( not ( = ?auto_25393 ?auto_25394 ) ) ( not ( = ?auto_25390 ?auto_25395 ) ) ( not ( = ?auto_25394 ?auto_25397 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25393 ?auto_25395 ?auto_25391 ?auto_25392 )
      ( GET-3IMAGE-VERIFY ?auto_25391 ?auto_25392 ?auto_25393 ?auto_25390 ?auto_25394 ?auto_25395 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25400 - DIRECTION
      ?auto_25401 - MODE
      ?auto_25402 - DIRECTION
      ?auto_25399 - MODE
      ?auto_25403 - DIRECTION
      ?auto_25404 - MODE
    )
    :vars
    (
      ?auto_25405 - INSTRUMENT
      ?auto_25407 - SATELLITE
      ?auto_25406 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25405 ?auto_25407 ) ( SUPPORTS ?auto_25405 ?auto_25401 ) ( POWER_ON ?auto_25405 ) ( POINTING ?auto_25407 ?auto_25406 ) ( not ( = ?auto_25400 ?auto_25406 ) ) ( HAVE_IMAGE ?auto_25402 ?auto_25399 ) ( not ( = ?auto_25402 ?auto_25400 ) ) ( not ( = ?auto_25402 ?auto_25406 ) ) ( not ( = ?auto_25399 ?auto_25401 ) ) ( CALIBRATION_TARGET ?auto_25405 ?auto_25406 ) ( NOT_CALIBRATED ?auto_25405 ) ( HAVE_IMAGE ?auto_25403 ?auto_25404 ) ( not ( = ?auto_25400 ?auto_25403 ) ) ( not ( = ?auto_25401 ?auto_25404 ) ) ( not ( = ?auto_25402 ?auto_25403 ) ) ( not ( = ?auto_25399 ?auto_25404 ) ) ( not ( = ?auto_25403 ?auto_25406 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25402 ?auto_25399 ?auto_25400 ?auto_25401 )
      ( GET-3IMAGE-VERIFY ?auto_25400 ?auto_25401 ?auto_25402 ?auto_25399 ?auto_25403 ?auto_25404 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25424 - DIRECTION
      ?auto_25425 - MODE
      ?auto_25426 - DIRECTION
      ?auto_25423 - MODE
      ?auto_25427 - DIRECTION
      ?auto_25428 - MODE
    )
    :vars
    (
      ?auto_25429 - INSTRUMENT
      ?auto_25431 - SATELLITE
      ?auto_25430 - DIRECTION
      ?auto_25432 - DIRECTION
      ?auto_25433 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_25429 ?auto_25431 ) ( SUPPORTS ?auto_25429 ?auto_25425 ) ( POWER_ON ?auto_25429 ) ( POINTING ?auto_25431 ?auto_25430 ) ( not ( = ?auto_25424 ?auto_25430 ) ) ( HAVE_IMAGE ?auto_25432 ?auto_25433 ) ( not ( = ?auto_25432 ?auto_25424 ) ) ( not ( = ?auto_25432 ?auto_25430 ) ) ( not ( = ?auto_25433 ?auto_25425 ) ) ( CALIBRATION_TARGET ?auto_25429 ?auto_25430 ) ( NOT_CALIBRATED ?auto_25429 ) ( HAVE_IMAGE ?auto_25426 ?auto_25423 ) ( HAVE_IMAGE ?auto_25427 ?auto_25428 ) ( not ( = ?auto_25424 ?auto_25426 ) ) ( not ( = ?auto_25424 ?auto_25427 ) ) ( not ( = ?auto_25425 ?auto_25423 ) ) ( not ( = ?auto_25425 ?auto_25428 ) ) ( not ( = ?auto_25426 ?auto_25427 ) ) ( not ( = ?auto_25426 ?auto_25430 ) ) ( not ( = ?auto_25426 ?auto_25432 ) ) ( not ( = ?auto_25423 ?auto_25428 ) ) ( not ( = ?auto_25423 ?auto_25433 ) ) ( not ( = ?auto_25427 ?auto_25430 ) ) ( not ( = ?auto_25427 ?auto_25432 ) ) ( not ( = ?auto_25428 ?auto_25433 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25432 ?auto_25433 ?auto_25424 ?auto_25425 )
      ( GET-3IMAGE-VERIFY ?auto_25424 ?auto_25425 ?auto_25426 ?auto_25423 ?auto_25427 ?auto_25428 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25530 - DIRECTION
      ?auto_25531 - MODE
      ?auto_25532 - DIRECTION
      ?auto_25529 - MODE
      ?auto_25533 - DIRECTION
      ?auto_25534 - MODE
    )
    :vars
    (
      ?auto_25535 - INSTRUMENT
      ?auto_25536 - SATELLITE
      ?auto_25537 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25535 ?auto_25536 ) ( SUPPORTS ?auto_25535 ?auto_25529 ) ( POINTING ?auto_25536 ?auto_25537 ) ( not ( = ?auto_25532 ?auto_25537 ) ) ( HAVE_IMAGE ?auto_25530 ?auto_25531 ) ( not ( = ?auto_25530 ?auto_25532 ) ) ( not ( = ?auto_25530 ?auto_25537 ) ) ( not ( = ?auto_25531 ?auto_25529 ) ) ( CALIBRATION_TARGET ?auto_25535 ?auto_25537 ) ( POWER_AVAIL ?auto_25536 ) ( HAVE_IMAGE ?auto_25533 ?auto_25534 ) ( not ( = ?auto_25530 ?auto_25533 ) ) ( not ( = ?auto_25531 ?auto_25534 ) ) ( not ( = ?auto_25532 ?auto_25533 ) ) ( not ( = ?auto_25529 ?auto_25534 ) ) ( not ( = ?auto_25533 ?auto_25537 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25530 ?auto_25531 ?auto_25532 ?auto_25529 )
      ( GET-3IMAGE-VERIFY ?auto_25530 ?auto_25531 ?auto_25532 ?auto_25529 ?auto_25533 ?auto_25534 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25560 - DIRECTION
      ?auto_25561 - MODE
      ?auto_25562 - DIRECTION
      ?auto_25559 - MODE
      ?auto_25563 - DIRECTION
      ?auto_25564 - MODE
    )
    :vars
    (
      ?auto_25566 - INSTRUMENT
      ?auto_25567 - SATELLITE
      ?auto_25568 - DIRECTION
      ?auto_25569 - DIRECTION
      ?auto_25565 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_25566 ?auto_25567 ) ( SUPPORTS ?auto_25566 ?auto_25564 ) ( POINTING ?auto_25567 ?auto_25568 ) ( not ( = ?auto_25563 ?auto_25568 ) ) ( HAVE_IMAGE ?auto_25569 ?auto_25565 ) ( not ( = ?auto_25569 ?auto_25563 ) ) ( not ( = ?auto_25569 ?auto_25568 ) ) ( not ( = ?auto_25565 ?auto_25564 ) ) ( CALIBRATION_TARGET ?auto_25566 ?auto_25568 ) ( POWER_AVAIL ?auto_25567 ) ( HAVE_IMAGE ?auto_25560 ?auto_25561 ) ( HAVE_IMAGE ?auto_25562 ?auto_25559 ) ( not ( = ?auto_25560 ?auto_25562 ) ) ( not ( = ?auto_25560 ?auto_25563 ) ) ( not ( = ?auto_25560 ?auto_25568 ) ) ( not ( = ?auto_25560 ?auto_25569 ) ) ( not ( = ?auto_25561 ?auto_25559 ) ) ( not ( = ?auto_25561 ?auto_25564 ) ) ( not ( = ?auto_25561 ?auto_25565 ) ) ( not ( = ?auto_25562 ?auto_25563 ) ) ( not ( = ?auto_25562 ?auto_25568 ) ) ( not ( = ?auto_25562 ?auto_25569 ) ) ( not ( = ?auto_25559 ?auto_25564 ) ) ( not ( = ?auto_25559 ?auto_25565 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25569 ?auto_25565 ?auto_25563 ?auto_25564 )
      ( GET-3IMAGE-VERIFY ?auto_25560 ?auto_25561 ?auto_25562 ?auto_25559 ?auto_25563 ?auto_25564 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25577 - DIRECTION
      ?auto_25578 - MODE
      ?auto_25579 - DIRECTION
      ?auto_25576 - MODE
      ?auto_25580 - DIRECTION
      ?auto_25581 - MODE
    )
    :vars
    (
      ?auto_25583 - INSTRUMENT
      ?auto_25584 - SATELLITE
      ?auto_25585 - DIRECTION
      ?auto_25586 - DIRECTION
      ?auto_25582 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_25583 ?auto_25584 ) ( SUPPORTS ?auto_25583 ?auto_25576 ) ( POINTING ?auto_25584 ?auto_25585 ) ( not ( = ?auto_25579 ?auto_25585 ) ) ( HAVE_IMAGE ?auto_25586 ?auto_25582 ) ( not ( = ?auto_25586 ?auto_25579 ) ) ( not ( = ?auto_25586 ?auto_25585 ) ) ( not ( = ?auto_25582 ?auto_25576 ) ) ( CALIBRATION_TARGET ?auto_25583 ?auto_25585 ) ( POWER_AVAIL ?auto_25584 ) ( HAVE_IMAGE ?auto_25577 ?auto_25578 ) ( HAVE_IMAGE ?auto_25580 ?auto_25581 ) ( not ( = ?auto_25577 ?auto_25579 ) ) ( not ( = ?auto_25577 ?auto_25580 ) ) ( not ( = ?auto_25577 ?auto_25585 ) ) ( not ( = ?auto_25577 ?auto_25586 ) ) ( not ( = ?auto_25578 ?auto_25576 ) ) ( not ( = ?auto_25578 ?auto_25581 ) ) ( not ( = ?auto_25578 ?auto_25582 ) ) ( not ( = ?auto_25579 ?auto_25580 ) ) ( not ( = ?auto_25576 ?auto_25581 ) ) ( not ( = ?auto_25580 ?auto_25585 ) ) ( not ( = ?auto_25580 ?auto_25586 ) ) ( not ( = ?auto_25581 ?auto_25582 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25586 ?auto_25582 ?auto_25579 ?auto_25576 )
      ( GET-3IMAGE-VERIFY ?auto_25577 ?auto_25578 ?auto_25579 ?auto_25576 ?auto_25580 ?auto_25581 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25629 - DIRECTION
      ?auto_25630 - MODE
      ?auto_25631 - DIRECTION
      ?auto_25628 - MODE
      ?auto_25632 - DIRECTION
      ?auto_25633 - MODE
    )
    :vars
    (
      ?auto_25635 - INSTRUMENT
      ?auto_25636 - SATELLITE
      ?auto_25637 - DIRECTION
      ?auto_25638 - DIRECTION
      ?auto_25634 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_25635 ?auto_25636 ) ( SUPPORTS ?auto_25635 ?auto_25630 ) ( POINTING ?auto_25636 ?auto_25637 ) ( not ( = ?auto_25629 ?auto_25637 ) ) ( HAVE_IMAGE ?auto_25638 ?auto_25634 ) ( not ( = ?auto_25638 ?auto_25629 ) ) ( not ( = ?auto_25638 ?auto_25637 ) ) ( not ( = ?auto_25634 ?auto_25630 ) ) ( CALIBRATION_TARGET ?auto_25635 ?auto_25637 ) ( POWER_AVAIL ?auto_25636 ) ( HAVE_IMAGE ?auto_25631 ?auto_25628 ) ( HAVE_IMAGE ?auto_25632 ?auto_25633 ) ( not ( = ?auto_25629 ?auto_25631 ) ) ( not ( = ?auto_25629 ?auto_25632 ) ) ( not ( = ?auto_25630 ?auto_25628 ) ) ( not ( = ?auto_25630 ?auto_25633 ) ) ( not ( = ?auto_25631 ?auto_25632 ) ) ( not ( = ?auto_25631 ?auto_25637 ) ) ( not ( = ?auto_25631 ?auto_25638 ) ) ( not ( = ?auto_25628 ?auto_25633 ) ) ( not ( = ?auto_25628 ?auto_25634 ) ) ( not ( = ?auto_25632 ?auto_25637 ) ) ( not ( = ?auto_25632 ?auto_25638 ) ) ( not ( = ?auto_25633 ?auto_25634 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25638 ?auto_25634 ?auto_25629 ?auto_25630 )
      ( GET-3IMAGE-VERIFY ?auto_25629 ?auto_25630 ?auto_25631 ?auto_25628 ?auto_25632 ?auto_25633 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_25681 - DIRECTION
      ?auto_25682 - MODE
    )
    :vars
    (
      ?auto_25684 - INSTRUMENT
      ?auto_25685 - SATELLITE
      ?auto_25686 - DIRECTION
      ?auto_25687 - DIRECTION
      ?auto_25683 - MODE
      ?auto_25688 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25684 ?auto_25685 ) ( SUPPORTS ?auto_25684 ?auto_25682 ) ( not ( = ?auto_25681 ?auto_25686 ) ) ( HAVE_IMAGE ?auto_25687 ?auto_25683 ) ( not ( = ?auto_25687 ?auto_25681 ) ) ( not ( = ?auto_25687 ?auto_25686 ) ) ( not ( = ?auto_25683 ?auto_25682 ) ) ( CALIBRATION_TARGET ?auto_25684 ?auto_25686 ) ( POWER_AVAIL ?auto_25685 ) ( POINTING ?auto_25685 ?auto_25688 ) ( not ( = ?auto_25686 ?auto_25688 ) ) ( not ( = ?auto_25681 ?auto_25688 ) ) ( not ( = ?auto_25687 ?auto_25688 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_25685 ?auto_25686 ?auto_25688 )
      ( GET-2IMAGE ?auto_25687 ?auto_25683 ?auto_25681 ?auto_25682 )
      ( GET-1IMAGE-VERIFY ?auto_25681 ?auto_25682 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25690 - DIRECTION
      ?auto_25691 - MODE
      ?auto_25692 - DIRECTION
      ?auto_25689 - MODE
    )
    :vars
    (
      ?auto_25694 - INSTRUMENT
      ?auto_25696 - SATELLITE
      ?auto_25695 - DIRECTION
      ?auto_25693 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25694 ?auto_25696 ) ( SUPPORTS ?auto_25694 ?auto_25689 ) ( not ( = ?auto_25692 ?auto_25695 ) ) ( HAVE_IMAGE ?auto_25690 ?auto_25691 ) ( not ( = ?auto_25690 ?auto_25692 ) ) ( not ( = ?auto_25690 ?auto_25695 ) ) ( not ( = ?auto_25691 ?auto_25689 ) ) ( CALIBRATION_TARGET ?auto_25694 ?auto_25695 ) ( POWER_AVAIL ?auto_25696 ) ( POINTING ?auto_25696 ?auto_25693 ) ( not ( = ?auto_25695 ?auto_25693 ) ) ( not ( = ?auto_25692 ?auto_25693 ) ) ( not ( = ?auto_25690 ?auto_25693 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_25692 ?auto_25689 )
      ( GET-2IMAGE-VERIFY ?auto_25690 ?auto_25691 ?auto_25692 ?auto_25689 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25698 - DIRECTION
      ?auto_25699 - MODE
      ?auto_25700 - DIRECTION
      ?auto_25697 - MODE
    )
    :vars
    (
      ?auto_25703 - INSTRUMENT
      ?auto_25702 - SATELLITE
      ?auto_25701 - DIRECTION
      ?auto_25704 - DIRECTION
      ?auto_25705 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_25703 ?auto_25702 ) ( SUPPORTS ?auto_25703 ?auto_25697 ) ( not ( = ?auto_25700 ?auto_25701 ) ) ( HAVE_IMAGE ?auto_25704 ?auto_25705 ) ( not ( = ?auto_25704 ?auto_25700 ) ) ( not ( = ?auto_25704 ?auto_25701 ) ) ( not ( = ?auto_25705 ?auto_25697 ) ) ( CALIBRATION_TARGET ?auto_25703 ?auto_25701 ) ( POWER_AVAIL ?auto_25702 ) ( POINTING ?auto_25702 ?auto_25698 ) ( not ( = ?auto_25701 ?auto_25698 ) ) ( not ( = ?auto_25700 ?auto_25698 ) ) ( not ( = ?auto_25704 ?auto_25698 ) ) ( HAVE_IMAGE ?auto_25698 ?auto_25699 ) ( not ( = ?auto_25699 ?auto_25697 ) ) ( not ( = ?auto_25699 ?auto_25705 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25704 ?auto_25705 ?auto_25700 ?auto_25697 )
      ( GET-2IMAGE-VERIFY ?auto_25698 ?auto_25699 ?auto_25700 ?auto_25697 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25707 - DIRECTION
      ?auto_25708 - MODE
      ?auto_25709 - DIRECTION
      ?auto_25706 - MODE
    )
    :vars
    (
      ?auto_25713 - INSTRUMENT
      ?auto_25711 - SATELLITE
      ?auto_25710 - DIRECTION
      ?auto_25712 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25713 ?auto_25711 ) ( SUPPORTS ?auto_25713 ?auto_25708 ) ( not ( = ?auto_25707 ?auto_25710 ) ) ( HAVE_IMAGE ?auto_25709 ?auto_25706 ) ( not ( = ?auto_25709 ?auto_25707 ) ) ( not ( = ?auto_25709 ?auto_25710 ) ) ( not ( = ?auto_25706 ?auto_25708 ) ) ( CALIBRATION_TARGET ?auto_25713 ?auto_25710 ) ( POWER_AVAIL ?auto_25711 ) ( POINTING ?auto_25711 ?auto_25712 ) ( not ( = ?auto_25710 ?auto_25712 ) ) ( not ( = ?auto_25707 ?auto_25712 ) ) ( not ( = ?auto_25709 ?auto_25712 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25709 ?auto_25706 ?auto_25707 ?auto_25708 )
      ( GET-2IMAGE-VERIFY ?auto_25707 ?auto_25708 ?auto_25709 ?auto_25706 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25715 - DIRECTION
      ?auto_25716 - MODE
      ?auto_25717 - DIRECTION
      ?auto_25714 - MODE
    )
    :vars
    (
      ?auto_25720 - INSTRUMENT
      ?auto_25719 - SATELLITE
      ?auto_25718 - DIRECTION
      ?auto_25721 - DIRECTION
      ?auto_25722 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_25720 ?auto_25719 ) ( SUPPORTS ?auto_25720 ?auto_25716 ) ( not ( = ?auto_25715 ?auto_25718 ) ) ( HAVE_IMAGE ?auto_25721 ?auto_25722 ) ( not ( = ?auto_25721 ?auto_25715 ) ) ( not ( = ?auto_25721 ?auto_25718 ) ) ( not ( = ?auto_25722 ?auto_25716 ) ) ( CALIBRATION_TARGET ?auto_25720 ?auto_25718 ) ( POWER_AVAIL ?auto_25719 ) ( POINTING ?auto_25719 ?auto_25717 ) ( not ( = ?auto_25718 ?auto_25717 ) ) ( not ( = ?auto_25715 ?auto_25717 ) ) ( not ( = ?auto_25721 ?auto_25717 ) ) ( HAVE_IMAGE ?auto_25717 ?auto_25714 ) ( not ( = ?auto_25716 ?auto_25714 ) ) ( not ( = ?auto_25714 ?auto_25722 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25721 ?auto_25722 ?auto_25715 ?auto_25716 )
      ( GET-2IMAGE-VERIFY ?auto_25715 ?auto_25716 ?auto_25717 ?auto_25714 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25734 - DIRECTION
      ?auto_25735 - MODE
      ?auto_25736 - DIRECTION
      ?auto_25733 - MODE
      ?auto_25737 - DIRECTION
      ?auto_25738 - MODE
    )
    :vars
    (
      ?auto_25742 - INSTRUMENT
      ?auto_25740 - SATELLITE
      ?auto_25739 - DIRECTION
      ?auto_25741 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25742 ?auto_25740 ) ( SUPPORTS ?auto_25742 ?auto_25738 ) ( not ( = ?auto_25737 ?auto_25739 ) ) ( HAVE_IMAGE ?auto_25736 ?auto_25735 ) ( not ( = ?auto_25736 ?auto_25737 ) ) ( not ( = ?auto_25736 ?auto_25739 ) ) ( not ( = ?auto_25735 ?auto_25738 ) ) ( CALIBRATION_TARGET ?auto_25742 ?auto_25739 ) ( POWER_AVAIL ?auto_25740 ) ( POINTING ?auto_25740 ?auto_25741 ) ( not ( = ?auto_25739 ?auto_25741 ) ) ( not ( = ?auto_25737 ?auto_25741 ) ) ( not ( = ?auto_25736 ?auto_25741 ) ) ( HAVE_IMAGE ?auto_25734 ?auto_25735 ) ( HAVE_IMAGE ?auto_25736 ?auto_25733 ) ( not ( = ?auto_25734 ?auto_25736 ) ) ( not ( = ?auto_25734 ?auto_25737 ) ) ( not ( = ?auto_25734 ?auto_25739 ) ) ( not ( = ?auto_25734 ?auto_25741 ) ) ( not ( = ?auto_25735 ?auto_25733 ) ) ( not ( = ?auto_25733 ?auto_25738 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25736 ?auto_25735 ?auto_25737 ?auto_25738 )
      ( GET-3IMAGE-VERIFY ?auto_25734 ?auto_25735 ?auto_25736 ?auto_25733 ?auto_25737 ?auto_25738 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25744 - DIRECTION
      ?auto_25745 - MODE
      ?auto_25746 - DIRECTION
      ?auto_25743 - MODE
      ?auto_25747 - DIRECTION
      ?auto_25748 - MODE
    )
    :vars
    (
      ?auto_25751 - INSTRUMENT
      ?auto_25750 - SATELLITE
      ?auto_25749 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25751 ?auto_25750 ) ( SUPPORTS ?auto_25751 ?auto_25748 ) ( not ( = ?auto_25747 ?auto_25749 ) ) ( HAVE_IMAGE ?auto_25744 ?auto_25745 ) ( not ( = ?auto_25744 ?auto_25747 ) ) ( not ( = ?auto_25744 ?auto_25749 ) ) ( not ( = ?auto_25745 ?auto_25748 ) ) ( CALIBRATION_TARGET ?auto_25751 ?auto_25749 ) ( POWER_AVAIL ?auto_25750 ) ( POINTING ?auto_25750 ?auto_25746 ) ( not ( = ?auto_25749 ?auto_25746 ) ) ( not ( = ?auto_25747 ?auto_25746 ) ) ( not ( = ?auto_25744 ?auto_25746 ) ) ( HAVE_IMAGE ?auto_25746 ?auto_25743 ) ( not ( = ?auto_25745 ?auto_25743 ) ) ( not ( = ?auto_25743 ?auto_25748 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25744 ?auto_25745 ?auto_25747 ?auto_25748 )
      ( GET-3IMAGE-VERIFY ?auto_25744 ?auto_25745 ?auto_25746 ?auto_25743 ?auto_25747 ?auto_25748 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25753 - DIRECTION
      ?auto_25754 - MODE
      ?auto_25755 - DIRECTION
      ?auto_25752 - MODE
      ?auto_25756 - DIRECTION
      ?auto_25757 - MODE
    )
    :vars
    (
      ?auto_25761 - INSTRUMENT
      ?auto_25759 - SATELLITE
      ?auto_25758 - DIRECTION
      ?auto_25760 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25761 ?auto_25759 ) ( SUPPORTS ?auto_25761 ?auto_25752 ) ( not ( = ?auto_25755 ?auto_25758 ) ) ( HAVE_IMAGE ?auto_25756 ?auto_25757 ) ( not ( = ?auto_25756 ?auto_25755 ) ) ( not ( = ?auto_25756 ?auto_25758 ) ) ( not ( = ?auto_25757 ?auto_25752 ) ) ( CALIBRATION_TARGET ?auto_25761 ?auto_25758 ) ( POWER_AVAIL ?auto_25759 ) ( POINTING ?auto_25759 ?auto_25760 ) ( not ( = ?auto_25758 ?auto_25760 ) ) ( not ( = ?auto_25755 ?auto_25760 ) ) ( not ( = ?auto_25756 ?auto_25760 ) ) ( HAVE_IMAGE ?auto_25753 ?auto_25754 ) ( not ( = ?auto_25753 ?auto_25755 ) ) ( not ( = ?auto_25753 ?auto_25756 ) ) ( not ( = ?auto_25753 ?auto_25758 ) ) ( not ( = ?auto_25753 ?auto_25760 ) ) ( not ( = ?auto_25754 ?auto_25752 ) ) ( not ( = ?auto_25754 ?auto_25757 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25756 ?auto_25757 ?auto_25755 ?auto_25752 )
      ( GET-3IMAGE-VERIFY ?auto_25753 ?auto_25754 ?auto_25755 ?auto_25752 ?auto_25756 ?auto_25757 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25763 - DIRECTION
      ?auto_25764 - MODE
      ?auto_25765 - DIRECTION
      ?auto_25762 - MODE
      ?auto_25766 - DIRECTION
      ?auto_25767 - MODE
    )
    :vars
    (
      ?auto_25770 - INSTRUMENT
      ?auto_25769 - SATELLITE
      ?auto_25768 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25770 ?auto_25769 ) ( SUPPORTS ?auto_25770 ?auto_25762 ) ( not ( = ?auto_25765 ?auto_25768 ) ) ( HAVE_IMAGE ?auto_25763 ?auto_25764 ) ( not ( = ?auto_25763 ?auto_25765 ) ) ( not ( = ?auto_25763 ?auto_25768 ) ) ( not ( = ?auto_25764 ?auto_25762 ) ) ( CALIBRATION_TARGET ?auto_25770 ?auto_25768 ) ( POWER_AVAIL ?auto_25769 ) ( POINTING ?auto_25769 ?auto_25766 ) ( not ( = ?auto_25768 ?auto_25766 ) ) ( not ( = ?auto_25765 ?auto_25766 ) ) ( not ( = ?auto_25763 ?auto_25766 ) ) ( HAVE_IMAGE ?auto_25766 ?auto_25767 ) ( not ( = ?auto_25764 ?auto_25767 ) ) ( not ( = ?auto_25762 ?auto_25767 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25763 ?auto_25764 ?auto_25765 ?auto_25762 )
      ( GET-3IMAGE-VERIFY ?auto_25763 ?auto_25764 ?auto_25765 ?auto_25762 ?auto_25766 ?auto_25767 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25782 - DIRECTION
      ?auto_25783 - MODE
      ?auto_25784 - DIRECTION
      ?auto_25781 - MODE
      ?auto_25785 - DIRECTION
      ?auto_25786 - MODE
    )
    :vars
    (
      ?auto_25789 - INSTRUMENT
      ?auto_25788 - SATELLITE
      ?auto_25787 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25789 ?auto_25788 ) ( SUPPORTS ?auto_25789 ?auto_25786 ) ( not ( = ?auto_25785 ?auto_25787 ) ) ( HAVE_IMAGE ?auto_25784 ?auto_25781 ) ( not ( = ?auto_25784 ?auto_25785 ) ) ( not ( = ?auto_25784 ?auto_25787 ) ) ( not ( = ?auto_25781 ?auto_25786 ) ) ( CALIBRATION_TARGET ?auto_25789 ?auto_25787 ) ( POWER_AVAIL ?auto_25788 ) ( POINTING ?auto_25788 ?auto_25782 ) ( not ( = ?auto_25787 ?auto_25782 ) ) ( not ( = ?auto_25785 ?auto_25782 ) ) ( not ( = ?auto_25784 ?auto_25782 ) ) ( HAVE_IMAGE ?auto_25782 ?auto_25783 ) ( not ( = ?auto_25783 ?auto_25781 ) ) ( not ( = ?auto_25783 ?auto_25786 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25784 ?auto_25781 ?auto_25785 ?auto_25786 )
      ( GET-3IMAGE-VERIFY ?auto_25782 ?auto_25783 ?auto_25784 ?auto_25781 ?auto_25785 ?auto_25786 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25791 - DIRECTION
      ?auto_25792 - MODE
      ?auto_25793 - DIRECTION
      ?auto_25790 - MODE
      ?auto_25794 - DIRECTION
      ?auto_25795 - MODE
    )
    :vars
    (
      ?auto_25798 - INSTRUMENT
      ?auto_25797 - SATELLITE
      ?auto_25796 - DIRECTION
      ?auto_25799 - DIRECTION
      ?auto_25800 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_25798 ?auto_25797 ) ( SUPPORTS ?auto_25798 ?auto_25795 ) ( not ( = ?auto_25794 ?auto_25796 ) ) ( HAVE_IMAGE ?auto_25799 ?auto_25800 ) ( not ( = ?auto_25799 ?auto_25794 ) ) ( not ( = ?auto_25799 ?auto_25796 ) ) ( not ( = ?auto_25800 ?auto_25795 ) ) ( CALIBRATION_TARGET ?auto_25798 ?auto_25796 ) ( POWER_AVAIL ?auto_25797 ) ( POINTING ?auto_25797 ?auto_25793 ) ( not ( = ?auto_25796 ?auto_25793 ) ) ( not ( = ?auto_25794 ?auto_25793 ) ) ( not ( = ?auto_25799 ?auto_25793 ) ) ( HAVE_IMAGE ?auto_25791 ?auto_25792 ) ( HAVE_IMAGE ?auto_25793 ?auto_25790 ) ( not ( = ?auto_25791 ?auto_25793 ) ) ( not ( = ?auto_25791 ?auto_25794 ) ) ( not ( = ?auto_25791 ?auto_25796 ) ) ( not ( = ?auto_25791 ?auto_25799 ) ) ( not ( = ?auto_25792 ?auto_25790 ) ) ( not ( = ?auto_25792 ?auto_25795 ) ) ( not ( = ?auto_25792 ?auto_25800 ) ) ( not ( = ?auto_25790 ?auto_25795 ) ) ( not ( = ?auto_25790 ?auto_25800 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25799 ?auto_25800 ?auto_25794 ?auto_25795 )
      ( GET-3IMAGE-VERIFY ?auto_25791 ?auto_25792 ?auto_25793 ?auto_25790 ?auto_25794 ?auto_25795 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25802 - DIRECTION
      ?auto_25803 - MODE
      ?auto_25804 - DIRECTION
      ?auto_25801 - MODE
      ?auto_25805 - DIRECTION
      ?auto_25806 - MODE
    )
    :vars
    (
      ?auto_25809 - INSTRUMENT
      ?auto_25808 - SATELLITE
      ?auto_25807 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25809 ?auto_25808 ) ( SUPPORTS ?auto_25809 ?auto_25801 ) ( not ( = ?auto_25804 ?auto_25807 ) ) ( HAVE_IMAGE ?auto_25805 ?auto_25806 ) ( not ( = ?auto_25805 ?auto_25804 ) ) ( not ( = ?auto_25805 ?auto_25807 ) ) ( not ( = ?auto_25806 ?auto_25801 ) ) ( CALIBRATION_TARGET ?auto_25809 ?auto_25807 ) ( POWER_AVAIL ?auto_25808 ) ( POINTING ?auto_25808 ?auto_25802 ) ( not ( = ?auto_25807 ?auto_25802 ) ) ( not ( = ?auto_25804 ?auto_25802 ) ) ( not ( = ?auto_25805 ?auto_25802 ) ) ( HAVE_IMAGE ?auto_25802 ?auto_25803 ) ( not ( = ?auto_25803 ?auto_25801 ) ) ( not ( = ?auto_25803 ?auto_25806 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25805 ?auto_25806 ?auto_25804 ?auto_25801 )
      ( GET-3IMAGE-VERIFY ?auto_25802 ?auto_25803 ?auto_25804 ?auto_25801 ?auto_25805 ?auto_25806 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25811 - DIRECTION
      ?auto_25812 - MODE
      ?auto_25813 - DIRECTION
      ?auto_25810 - MODE
      ?auto_25814 - DIRECTION
      ?auto_25815 - MODE
    )
    :vars
    (
      ?auto_25818 - INSTRUMENT
      ?auto_25817 - SATELLITE
      ?auto_25816 - DIRECTION
      ?auto_25819 - DIRECTION
      ?auto_25820 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_25818 ?auto_25817 ) ( SUPPORTS ?auto_25818 ?auto_25810 ) ( not ( = ?auto_25813 ?auto_25816 ) ) ( HAVE_IMAGE ?auto_25819 ?auto_25820 ) ( not ( = ?auto_25819 ?auto_25813 ) ) ( not ( = ?auto_25819 ?auto_25816 ) ) ( not ( = ?auto_25820 ?auto_25810 ) ) ( CALIBRATION_TARGET ?auto_25818 ?auto_25816 ) ( POWER_AVAIL ?auto_25817 ) ( POINTING ?auto_25817 ?auto_25811 ) ( not ( = ?auto_25816 ?auto_25811 ) ) ( not ( = ?auto_25813 ?auto_25811 ) ) ( not ( = ?auto_25819 ?auto_25811 ) ) ( HAVE_IMAGE ?auto_25811 ?auto_25812 ) ( HAVE_IMAGE ?auto_25814 ?auto_25815 ) ( not ( = ?auto_25811 ?auto_25814 ) ) ( not ( = ?auto_25812 ?auto_25810 ) ) ( not ( = ?auto_25812 ?auto_25815 ) ) ( not ( = ?auto_25812 ?auto_25820 ) ) ( not ( = ?auto_25813 ?auto_25814 ) ) ( not ( = ?auto_25810 ?auto_25815 ) ) ( not ( = ?auto_25814 ?auto_25816 ) ) ( not ( = ?auto_25814 ?auto_25819 ) ) ( not ( = ?auto_25815 ?auto_25820 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25819 ?auto_25820 ?auto_25813 ?auto_25810 )
      ( GET-3IMAGE-VERIFY ?auto_25811 ?auto_25812 ?auto_25813 ?auto_25810 ?auto_25814 ?auto_25815 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25833 - DIRECTION
      ?auto_25834 - MODE
      ?auto_25835 - DIRECTION
      ?auto_25832 - MODE
      ?auto_25836 - DIRECTION
      ?auto_25837 - MODE
    )
    :vars
    (
      ?auto_25841 - INSTRUMENT
      ?auto_25839 - SATELLITE
      ?auto_25838 - DIRECTION
      ?auto_25840 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25841 ?auto_25839 ) ( SUPPORTS ?auto_25841 ?auto_25834 ) ( not ( = ?auto_25833 ?auto_25838 ) ) ( HAVE_IMAGE ?auto_25835 ?auto_25837 ) ( not ( = ?auto_25835 ?auto_25833 ) ) ( not ( = ?auto_25835 ?auto_25838 ) ) ( not ( = ?auto_25837 ?auto_25834 ) ) ( CALIBRATION_TARGET ?auto_25841 ?auto_25838 ) ( POWER_AVAIL ?auto_25839 ) ( POINTING ?auto_25839 ?auto_25840 ) ( not ( = ?auto_25838 ?auto_25840 ) ) ( not ( = ?auto_25833 ?auto_25840 ) ) ( not ( = ?auto_25835 ?auto_25840 ) ) ( HAVE_IMAGE ?auto_25835 ?auto_25832 ) ( HAVE_IMAGE ?auto_25836 ?auto_25837 ) ( not ( = ?auto_25833 ?auto_25836 ) ) ( not ( = ?auto_25834 ?auto_25832 ) ) ( not ( = ?auto_25835 ?auto_25836 ) ) ( not ( = ?auto_25832 ?auto_25837 ) ) ( not ( = ?auto_25836 ?auto_25838 ) ) ( not ( = ?auto_25836 ?auto_25840 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25835 ?auto_25837 ?auto_25833 ?auto_25834 )
      ( GET-3IMAGE-VERIFY ?auto_25833 ?auto_25834 ?auto_25835 ?auto_25832 ?auto_25836 ?auto_25837 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25843 - DIRECTION
      ?auto_25844 - MODE
      ?auto_25845 - DIRECTION
      ?auto_25842 - MODE
      ?auto_25846 - DIRECTION
      ?auto_25847 - MODE
    )
    :vars
    (
      ?auto_25850 - INSTRUMENT
      ?auto_25849 - SATELLITE
      ?auto_25848 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25850 ?auto_25849 ) ( SUPPORTS ?auto_25850 ?auto_25844 ) ( not ( = ?auto_25843 ?auto_25848 ) ) ( HAVE_IMAGE ?auto_25845 ?auto_25842 ) ( not ( = ?auto_25845 ?auto_25843 ) ) ( not ( = ?auto_25845 ?auto_25848 ) ) ( not ( = ?auto_25842 ?auto_25844 ) ) ( CALIBRATION_TARGET ?auto_25850 ?auto_25848 ) ( POWER_AVAIL ?auto_25849 ) ( POINTING ?auto_25849 ?auto_25846 ) ( not ( = ?auto_25848 ?auto_25846 ) ) ( not ( = ?auto_25843 ?auto_25846 ) ) ( not ( = ?auto_25845 ?auto_25846 ) ) ( HAVE_IMAGE ?auto_25846 ?auto_25847 ) ( not ( = ?auto_25844 ?auto_25847 ) ) ( not ( = ?auto_25842 ?auto_25847 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25845 ?auto_25842 ?auto_25843 ?auto_25844 )
      ( GET-3IMAGE-VERIFY ?auto_25843 ?auto_25844 ?auto_25845 ?auto_25842 ?auto_25846 ?auto_25847 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25862 - DIRECTION
      ?auto_25863 - MODE
      ?auto_25864 - DIRECTION
      ?auto_25861 - MODE
      ?auto_25865 - DIRECTION
      ?auto_25866 - MODE
    )
    :vars
    (
      ?auto_25869 - INSTRUMENT
      ?auto_25868 - SATELLITE
      ?auto_25867 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_25869 ?auto_25868 ) ( SUPPORTS ?auto_25869 ?auto_25863 ) ( not ( = ?auto_25862 ?auto_25867 ) ) ( HAVE_IMAGE ?auto_25865 ?auto_25866 ) ( not ( = ?auto_25865 ?auto_25862 ) ) ( not ( = ?auto_25865 ?auto_25867 ) ) ( not ( = ?auto_25866 ?auto_25863 ) ) ( CALIBRATION_TARGET ?auto_25869 ?auto_25867 ) ( POWER_AVAIL ?auto_25868 ) ( POINTING ?auto_25868 ?auto_25864 ) ( not ( = ?auto_25867 ?auto_25864 ) ) ( not ( = ?auto_25862 ?auto_25864 ) ) ( not ( = ?auto_25865 ?auto_25864 ) ) ( HAVE_IMAGE ?auto_25864 ?auto_25861 ) ( not ( = ?auto_25863 ?auto_25861 ) ) ( not ( = ?auto_25861 ?auto_25866 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25865 ?auto_25866 ?auto_25862 ?auto_25863 )
      ( GET-3IMAGE-VERIFY ?auto_25862 ?auto_25863 ?auto_25864 ?auto_25861 ?auto_25865 ?auto_25866 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25871 - DIRECTION
      ?auto_25872 - MODE
      ?auto_25873 - DIRECTION
      ?auto_25870 - MODE
      ?auto_25874 - DIRECTION
      ?auto_25875 - MODE
    )
    :vars
    (
      ?auto_25878 - INSTRUMENT
      ?auto_25877 - SATELLITE
      ?auto_25876 - DIRECTION
      ?auto_25879 - DIRECTION
      ?auto_25880 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_25878 ?auto_25877 ) ( SUPPORTS ?auto_25878 ?auto_25872 ) ( not ( = ?auto_25871 ?auto_25876 ) ) ( HAVE_IMAGE ?auto_25879 ?auto_25880 ) ( not ( = ?auto_25879 ?auto_25871 ) ) ( not ( = ?auto_25879 ?auto_25876 ) ) ( not ( = ?auto_25880 ?auto_25872 ) ) ( CALIBRATION_TARGET ?auto_25878 ?auto_25876 ) ( POWER_AVAIL ?auto_25877 ) ( POINTING ?auto_25877 ?auto_25874 ) ( not ( = ?auto_25876 ?auto_25874 ) ) ( not ( = ?auto_25871 ?auto_25874 ) ) ( not ( = ?auto_25879 ?auto_25874 ) ) ( HAVE_IMAGE ?auto_25873 ?auto_25870 ) ( HAVE_IMAGE ?auto_25874 ?auto_25875 ) ( not ( = ?auto_25871 ?auto_25873 ) ) ( not ( = ?auto_25872 ?auto_25870 ) ) ( not ( = ?auto_25872 ?auto_25875 ) ) ( not ( = ?auto_25873 ?auto_25874 ) ) ( not ( = ?auto_25873 ?auto_25876 ) ) ( not ( = ?auto_25873 ?auto_25879 ) ) ( not ( = ?auto_25870 ?auto_25875 ) ) ( not ( = ?auto_25870 ?auto_25880 ) ) ( not ( = ?auto_25875 ?auto_25880 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25879 ?auto_25880 ?auto_25871 ?auto_25872 )
      ( GET-3IMAGE-VERIFY ?auto_25871 ?auto_25872 ?auto_25873 ?auto_25870 ?auto_25874 ?auto_25875 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_25925 - DIRECTION
      ?auto_25926 - MODE
    )
    :vars
    (
      ?auto_25930 - INSTRUMENT
      ?auto_25928 - SATELLITE
      ?auto_25927 - DIRECTION
      ?auto_25931 - DIRECTION
      ?auto_25932 - MODE
      ?auto_25929 - DIRECTION
      ?auto_25933 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25930 ?auto_25928 ) ( SUPPORTS ?auto_25930 ?auto_25926 ) ( not ( = ?auto_25925 ?auto_25927 ) ) ( HAVE_IMAGE ?auto_25931 ?auto_25932 ) ( not ( = ?auto_25931 ?auto_25925 ) ) ( not ( = ?auto_25931 ?auto_25927 ) ) ( not ( = ?auto_25932 ?auto_25926 ) ) ( CALIBRATION_TARGET ?auto_25930 ?auto_25927 ) ( POINTING ?auto_25928 ?auto_25929 ) ( not ( = ?auto_25927 ?auto_25929 ) ) ( not ( = ?auto_25925 ?auto_25929 ) ) ( not ( = ?auto_25931 ?auto_25929 ) ) ( ON_BOARD ?auto_25933 ?auto_25928 ) ( POWER_ON ?auto_25933 ) ( not ( = ?auto_25930 ?auto_25933 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_25933 ?auto_25928 )
      ( GET-2IMAGE ?auto_25931 ?auto_25932 ?auto_25925 ?auto_25926 )
      ( GET-1IMAGE-VERIFY ?auto_25925 ?auto_25926 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25935 - DIRECTION
      ?auto_25936 - MODE
      ?auto_25937 - DIRECTION
      ?auto_25934 - MODE
    )
    :vars
    (
      ?auto_25938 - INSTRUMENT
      ?auto_25939 - SATELLITE
      ?auto_25940 - DIRECTION
      ?auto_25941 - DIRECTION
      ?auto_25942 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25938 ?auto_25939 ) ( SUPPORTS ?auto_25938 ?auto_25934 ) ( not ( = ?auto_25937 ?auto_25940 ) ) ( HAVE_IMAGE ?auto_25935 ?auto_25936 ) ( not ( = ?auto_25935 ?auto_25937 ) ) ( not ( = ?auto_25935 ?auto_25940 ) ) ( not ( = ?auto_25936 ?auto_25934 ) ) ( CALIBRATION_TARGET ?auto_25938 ?auto_25940 ) ( POINTING ?auto_25939 ?auto_25941 ) ( not ( = ?auto_25940 ?auto_25941 ) ) ( not ( = ?auto_25937 ?auto_25941 ) ) ( not ( = ?auto_25935 ?auto_25941 ) ) ( ON_BOARD ?auto_25942 ?auto_25939 ) ( POWER_ON ?auto_25942 ) ( not ( = ?auto_25938 ?auto_25942 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_25937 ?auto_25934 )
      ( GET-2IMAGE-VERIFY ?auto_25935 ?auto_25936 ?auto_25937 ?auto_25934 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25944 - DIRECTION
      ?auto_25945 - MODE
      ?auto_25946 - DIRECTION
      ?auto_25943 - MODE
    )
    :vars
    (
      ?auto_25948 - INSTRUMENT
      ?auto_25947 - SATELLITE
      ?auto_25951 - DIRECTION
      ?auto_25952 - DIRECTION
      ?auto_25950 - MODE
      ?auto_25949 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25948 ?auto_25947 ) ( SUPPORTS ?auto_25948 ?auto_25943 ) ( not ( = ?auto_25946 ?auto_25951 ) ) ( HAVE_IMAGE ?auto_25952 ?auto_25950 ) ( not ( = ?auto_25952 ?auto_25946 ) ) ( not ( = ?auto_25952 ?auto_25951 ) ) ( not ( = ?auto_25950 ?auto_25943 ) ) ( CALIBRATION_TARGET ?auto_25948 ?auto_25951 ) ( POINTING ?auto_25947 ?auto_25944 ) ( not ( = ?auto_25951 ?auto_25944 ) ) ( not ( = ?auto_25946 ?auto_25944 ) ) ( not ( = ?auto_25952 ?auto_25944 ) ) ( ON_BOARD ?auto_25949 ?auto_25947 ) ( POWER_ON ?auto_25949 ) ( not ( = ?auto_25948 ?auto_25949 ) ) ( HAVE_IMAGE ?auto_25944 ?auto_25945 ) ( not ( = ?auto_25945 ?auto_25943 ) ) ( not ( = ?auto_25945 ?auto_25950 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25952 ?auto_25950 ?auto_25946 ?auto_25943 )
      ( GET-2IMAGE-VERIFY ?auto_25944 ?auto_25945 ?auto_25946 ?auto_25943 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25954 - DIRECTION
      ?auto_25955 - MODE
      ?auto_25956 - DIRECTION
      ?auto_25953 - MODE
    )
    :vars
    (
      ?auto_25959 - INSTRUMENT
      ?auto_25958 - SATELLITE
      ?auto_25961 - DIRECTION
      ?auto_25957 - DIRECTION
      ?auto_25960 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25959 ?auto_25958 ) ( SUPPORTS ?auto_25959 ?auto_25955 ) ( not ( = ?auto_25954 ?auto_25961 ) ) ( HAVE_IMAGE ?auto_25956 ?auto_25953 ) ( not ( = ?auto_25956 ?auto_25954 ) ) ( not ( = ?auto_25956 ?auto_25961 ) ) ( not ( = ?auto_25953 ?auto_25955 ) ) ( CALIBRATION_TARGET ?auto_25959 ?auto_25961 ) ( POINTING ?auto_25958 ?auto_25957 ) ( not ( = ?auto_25961 ?auto_25957 ) ) ( not ( = ?auto_25954 ?auto_25957 ) ) ( not ( = ?auto_25956 ?auto_25957 ) ) ( ON_BOARD ?auto_25960 ?auto_25958 ) ( POWER_ON ?auto_25960 ) ( not ( = ?auto_25959 ?auto_25960 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25956 ?auto_25953 ?auto_25954 ?auto_25955 )
      ( GET-2IMAGE-VERIFY ?auto_25954 ?auto_25955 ?auto_25956 ?auto_25953 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25963 - DIRECTION
      ?auto_25964 - MODE
      ?auto_25965 - DIRECTION
      ?auto_25962 - MODE
    )
    :vars
    (
      ?auto_25967 - INSTRUMENT
      ?auto_25966 - SATELLITE
      ?auto_25970 - DIRECTION
      ?auto_25971 - DIRECTION
      ?auto_25969 - MODE
      ?auto_25968 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25967 ?auto_25966 ) ( SUPPORTS ?auto_25967 ?auto_25964 ) ( not ( = ?auto_25963 ?auto_25970 ) ) ( HAVE_IMAGE ?auto_25971 ?auto_25969 ) ( not ( = ?auto_25971 ?auto_25963 ) ) ( not ( = ?auto_25971 ?auto_25970 ) ) ( not ( = ?auto_25969 ?auto_25964 ) ) ( CALIBRATION_TARGET ?auto_25967 ?auto_25970 ) ( POINTING ?auto_25966 ?auto_25965 ) ( not ( = ?auto_25970 ?auto_25965 ) ) ( not ( = ?auto_25963 ?auto_25965 ) ) ( not ( = ?auto_25971 ?auto_25965 ) ) ( ON_BOARD ?auto_25968 ?auto_25966 ) ( POWER_ON ?auto_25968 ) ( not ( = ?auto_25967 ?auto_25968 ) ) ( HAVE_IMAGE ?auto_25965 ?auto_25962 ) ( not ( = ?auto_25964 ?auto_25962 ) ) ( not ( = ?auto_25962 ?auto_25969 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25971 ?auto_25969 ?auto_25963 ?auto_25964 )
      ( GET-2IMAGE-VERIFY ?auto_25963 ?auto_25964 ?auto_25965 ?auto_25962 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25984 - DIRECTION
      ?auto_25985 - MODE
      ?auto_25986 - DIRECTION
      ?auto_25983 - MODE
      ?auto_25987 - DIRECTION
      ?auto_25988 - MODE
    )
    :vars
    (
      ?auto_25991 - INSTRUMENT
      ?auto_25990 - SATELLITE
      ?auto_25993 - DIRECTION
      ?auto_25989 - DIRECTION
      ?auto_25992 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25991 ?auto_25990 ) ( SUPPORTS ?auto_25991 ?auto_25988 ) ( not ( = ?auto_25987 ?auto_25993 ) ) ( HAVE_IMAGE ?auto_25984 ?auto_25983 ) ( not ( = ?auto_25984 ?auto_25987 ) ) ( not ( = ?auto_25984 ?auto_25993 ) ) ( not ( = ?auto_25983 ?auto_25988 ) ) ( CALIBRATION_TARGET ?auto_25991 ?auto_25993 ) ( POINTING ?auto_25990 ?auto_25989 ) ( not ( = ?auto_25993 ?auto_25989 ) ) ( not ( = ?auto_25987 ?auto_25989 ) ) ( not ( = ?auto_25984 ?auto_25989 ) ) ( ON_BOARD ?auto_25992 ?auto_25990 ) ( POWER_ON ?auto_25992 ) ( not ( = ?auto_25991 ?auto_25992 ) ) ( HAVE_IMAGE ?auto_25984 ?auto_25985 ) ( HAVE_IMAGE ?auto_25986 ?auto_25983 ) ( not ( = ?auto_25984 ?auto_25986 ) ) ( not ( = ?auto_25985 ?auto_25983 ) ) ( not ( = ?auto_25985 ?auto_25988 ) ) ( not ( = ?auto_25986 ?auto_25987 ) ) ( not ( = ?auto_25986 ?auto_25993 ) ) ( not ( = ?auto_25986 ?auto_25989 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25984 ?auto_25983 ?auto_25987 ?auto_25988 )
      ( GET-3IMAGE-VERIFY ?auto_25984 ?auto_25985 ?auto_25986 ?auto_25983 ?auto_25987 ?auto_25988 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25995 - DIRECTION
      ?auto_25996 - MODE
      ?auto_25997 - DIRECTION
      ?auto_25994 - MODE
      ?auto_25998 - DIRECTION
      ?auto_25999 - MODE
    )
    :vars
    (
      ?auto_26001 - INSTRUMENT
      ?auto_26000 - SATELLITE
      ?auto_26003 - DIRECTION
      ?auto_26002 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_26001 ?auto_26000 ) ( SUPPORTS ?auto_26001 ?auto_25999 ) ( not ( = ?auto_25998 ?auto_26003 ) ) ( HAVE_IMAGE ?auto_25995 ?auto_25996 ) ( not ( = ?auto_25995 ?auto_25998 ) ) ( not ( = ?auto_25995 ?auto_26003 ) ) ( not ( = ?auto_25996 ?auto_25999 ) ) ( CALIBRATION_TARGET ?auto_26001 ?auto_26003 ) ( POINTING ?auto_26000 ?auto_25997 ) ( not ( = ?auto_26003 ?auto_25997 ) ) ( not ( = ?auto_25998 ?auto_25997 ) ) ( not ( = ?auto_25995 ?auto_25997 ) ) ( ON_BOARD ?auto_26002 ?auto_26000 ) ( POWER_ON ?auto_26002 ) ( not ( = ?auto_26001 ?auto_26002 ) ) ( HAVE_IMAGE ?auto_25997 ?auto_25994 ) ( not ( = ?auto_25996 ?auto_25994 ) ) ( not ( = ?auto_25994 ?auto_25999 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25995 ?auto_25996 ?auto_25998 ?auto_25999 )
      ( GET-3IMAGE-VERIFY ?auto_25995 ?auto_25996 ?auto_25997 ?auto_25994 ?auto_25998 ?auto_25999 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26005 - DIRECTION
      ?auto_26006 - MODE
      ?auto_26007 - DIRECTION
      ?auto_26004 - MODE
      ?auto_26008 - DIRECTION
      ?auto_26009 - MODE
    )
    :vars
    (
      ?auto_26012 - INSTRUMENT
      ?auto_26011 - SATELLITE
      ?auto_26014 - DIRECTION
      ?auto_26010 - DIRECTION
      ?auto_26013 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_26012 ?auto_26011 ) ( SUPPORTS ?auto_26012 ?auto_26004 ) ( not ( = ?auto_26007 ?auto_26014 ) ) ( HAVE_IMAGE ?auto_26008 ?auto_26009 ) ( not ( = ?auto_26008 ?auto_26007 ) ) ( not ( = ?auto_26008 ?auto_26014 ) ) ( not ( = ?auto_26009 ?auto_26004 ) ) ( CALIBRATION_TARGET ?auto_26012 ?auto_26014 ) ( POINTING ?auto_26011 ?auto_26010 ) ( not ( = ?auto_26014 ?auto_26010 ) ) ( not ( = ?auto_26007 ?auto_26010 ) ) ( not ( = ?auto_26008 ?auto_26010 ) ) ( ON_BOARD ?auto_26013 ?auto_26011 ) ( POWER_ON ?auto_26013 ) ( not ( = ?auto_26012 ?auto_26013 ) ) ( HAVE_IMAGE ?auto_26005 ?auto_26006 ) ( not ( = ?auto_26005 ?auto_26007 ) ) ( not ( = ?auto_26005 ?auto_26008 ) ) ( not ( = ?auto_26005 ?auto_26014 ) ) ( not ( = ?auto_26005 ?auto_26010 ) ) ( not ( = ?auto_26006 ?auto_26004 ) ) ( not ( = ?auto_26006 ?auto_26009 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26008 ?auto_26009 ?auto_26007 ?auto_26004 )
      ( GET-3IMAGE-VERIFY ?auto_26005 ?auto_26006 ?auto_26007 ?auto_26004 ?auto_26008 ?auto_26009 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26016 - DIRECTION
      ?auto_26017 - MODE
      ?auto_26018 - DIRECTION
      ?auto_26015 - MODE
      ?auto_26019 - DIRECTION
      ?auto_26020 - MODE
    )
    :vars
    (
      ?auto_26022 - INSTRUMENT
      ?auto_26021 - SATELLITE
      ?auto_26024 - DIRECTION
      ?auto_26023 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_26022 ?auto_26021 ) ( SUPPORTS ?auto_26022 ?auto_26015 ) ( not ( = ?auto_26018 ?auto_26024 ) ) ( HAVE_IMAGE ?auto_26016 ?auto_26017 ) ( not ( = ?auto_26016 ?auto_26018 ) ) ( not ( = ?auto_26016 ?auto_26024 ) ) ( not ( = ?auto_26017 ?auto_26015 ) ) ( CALIBRATION_TARGET ?auto_26022 ?auto_26024 ) ( POINTING ?auto_26021 ?auto_26019 ) ( not ( = ?auto_26024 ?auto_26019 ) ) ( not ( = ?auto_26018 ?auto_26019 ) ) ( not ( = ?auto_26016 ?auto_26019 ) ) ( ON_BOARD ?auto_26023 ?auto_26021 ) ( POWER_ON ?auto_26023 ) ( not ( = ?auto_26022 ?auto_26023 ) ) ( HAVE_IMAGE ?auto_26019 ?auto_26020 ) ( not ( = ?auto_26017 ?auto_26020 ) ) ( not ( = ?auto_26015 ?auto_26020 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26016 ?auto_26017 ?auto_26018 ?auto_26015 )
      ( GET-3IMAGE-VERIFY ?auto_26016 ?auto_26017 ?auto_26018 ?auto_26015 ?auto_26019 ?auto_26020 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26037 - DIRECTION
      ?auto_26038 - MODE
      ?auto_26039 - DIRECTION
      ?auto_26036 - MODE
      ?auto_26040 - DIRECTION
      ?auto_26041 - MODE
    )
    :vars
    (
      ?auto_26043 - INSTRUMENT
      ?auto_26042 - SATELLITE
      ?auto_26045 - DIRECTION
      ?auto_26044 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_26043 ?auto_26042 ) ( SUPPORTS ?auto_26043 ?auto_26041 ) ( not ( = ?auto_26040 ?auto_26045 ) ) ( HAVE_IMAGE ?auto_26039 ?auto_26036 ) ( not ( = ?auto_26039 ?auto_26040 ) ) ( not ( = ?auto_26039 ?auto_26045 ) ) ( not ( = ?auto_26036 ?auto_26041 ) ) ( CALIBRATION_TARGET ?auto_26043 ?auto_26045 ) ( POINTING ?auto_26042 ?auto_26037 ) ( not ( = ?auto_26045 ?auto_26037 ) ) ( not ( = ?auto_26040 ?auto_26037 ) ) ( not ( = ?auto_26039 ?auto_26037 ) ) ( ON_BOARD ?auto_26044 ?auto_26042 ) ( POWER_ON ?auto_26044 ) ( not ( = ?auto_26043 ?auto_26044 ) ) ( HAVE_IMAGE ?auto_26037 ?auto_26038 ) ( not ( = ?auto_26038 ?auto_26036 ) ) ( not ( = ?auto_26038 ?auto_26041 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26039 ?auto_26036 ?auto_26040 ?auto_26041 )
      ( GET-3IMAGE-VERIFY ?auto_26037 ?auto_26038 ?auto_26039 ?auto_26036 ?auto_26040 ?auto_26041 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26047 - DIRECTION
      ?auto_26048 - MODE
      ?auto_26049 - DIRECTION
      ?auto_26046 - MODE
      ?auto_26050 - DIRECTION
      ?auto_26051 - MODE
    )
    :vars
    (
      ?auto_26053 - INSTRUMENT
      ?auto_26052 - SATELLITE
      ?auto_26056 - DIRECTION
      ?auto_26057 - DIRECTION
      ?auto_26055 - MODE
      ?auto_26054 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_26053 ?auto_26052 ) ( SUPPORTS ?auto_26053 ?auto_26051 ) ( not ( = ?auto_26050 ?auto_26056 ) ) ( HAVE_IMAGE ?auto_26057 ?auto_26055 ) ( not ( = ?auto_26057 ?auto_26050 ) ) ( not ( = ?auto_26057 ?auto_26056 ) ) ( not ( = ?auto_26055 ?auto_26051 ) ) ( CALIBRATION_TARGET ?auto_26053 ?auto_26056 ) ( POINTING ?auto_26052 ?auto_26049 ) ( not ( = ?auto_26056 ?auto_26049 ) ) ( not ( = ?auto_26050 ?auto_26049 ) ) ( not ( = ?auto_26057 ?auto_26049 ) ) ( ON_BOARD ?auto_26054 ?auto_26052 ) ( POWER_ON ?auto_26054 ) ( not ( = ?auto_26053 ?auto_26054 ) ) ( HAVE_IMAGE ?auto_26047 ?auto_26048 ) ( HAVE_IMAGE ?auto_26049 ?auto_26046 ) ( not ( = ?auto_26047 ?auto_26049 ) ) ( not ( = ?auto_26047 ?auto_26050 ) ) ( not ( = ?auto_26047 ?auto_26056 ) ) ( not ( = ?auto_26047 ?auto_26057 ) ) ( not ( = ?auto_26048 ?auto_26046 ) ) ( not ( = ?auto_26048 ?auto_26051 ) ) ( not ( = ?auto_26048 ?auto_26055 ) ) ( not ( = ?auto_26046 ?auto_26051 ) ) ( not ( = ?auto_26046 ?auto_26055 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26057 ?auto_26055 ?auto_26050 ?auto_26051 )
      ( GET-3IMAGE-VERIFY ?auto_26047 ?auto_26048 ?auto_26049 ?auto_26046 ?auto_26050 ?auto_26051 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26059 - DIRECTION
      ?auto_26060 - MODE
      ?auto_26061 - DIRECTION
      ?auto_26058 - MODE
      ?auto_26062 - DIRECTION
      ?auto_26063 - MODE
    )
    :vars
    (
      ?auto_26065 - INSTRUMENT
      ?auto_26064 - SATELLITE
      ?auto_26067 - DIRECTION
      ?auto_26066 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_26065 ?auto_26064 ) ( SUPPORTS ?auto_26065 ?auto_26058 ) ( not ( = ?auto_26061 ?auto_26067 ) ) ( HAVE_IMAGE ?auto_26062 ?auto_26063 ) ( not ( = ?auto_26062 ?auto_26061 ) ) ( not ( = ?auto_26062 ?auto_26067 ) ) ( not ( = ?auto_26063 ?auto_26058 ) ) ( CALIBRATION_TARGET ?auto_26065 ?auto_26067 ) ( POINTING ?auto_26064 ?auto_26059 ) ( not ( = ?auto_26067 ?auto_26059 ) ) ( not ( = ?auto_26061 ?auto_26059 ) ) ( not ( = ?auto_26062 ?auto_26059 ) ) ( ON_BOARD ?auto_26066 ?auto_26064 ) ( POWER_ON ?auto_26066 ) ( not ( = ?auto_26065 ?auto_26066 ) ) ( HAVE_IMAGE ?auto_26059 ?auto_26060 ) ( not ( = ?auto_26060 ?auto_26058 ) ) ( not ( = ?auto_26060 ?auto_26063 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26062 ?auto_26063 ?auto_26061 ?auto_26058 )
      ( GET-3IMAGE-VERIFY ?auto_26059 ?auto_26060 ?auto_26061 ?auto_26058 ?auto_26062 ?auto_26063 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26069 - DIRECTION
      ?auto_26070 - MODE
      ?auto_26071 - DIRECTION
      ?auto_26068 - MODE
      ?auto_26072 - DIRECTION
      ?auto_26073 - MODE
    )
    :vars
    (
      ?auto_26075 - INSTRUMENT
      ?auto_26074 - SATELLITE
      ?auto_26078 - DIRECTION
      ?auto_26079 - DIRECTION
      ?auto_26077 - MODE
      ?auto_26076 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_26075 ?auto_26074 ) ( SUPPORTS ?auto_26075 ?auto_26068 ) ( not ( = ?auto_26071 ?auto_26078 ) ) ( HAVE_IMAGE ?auto_26079 ?auto_26077 ) ( not ( = ?auto_26079 ?auto_26071 ) ) ( not ( = ?auto_26079 ?auto_26078 ) ) ( not ( = ?auto_26077 ?auto_26068 ) ) ( CALIBRATION_TARGET ?auto_26075 ?auto_26078 ) ( POINTING ?auto_26074 ?auto_26069 ) ( not ( = ?auto_26078 ?auto_26069 ) ) ( not ( = ?auto_26071 ?auto_26069 ) ) ( not ( = ?auto_26079 ?auto_26069 ) ) ( ON_BOARD ?auto_26076 ?auto_26074 ) ( POWER_ON ?auto_26076 ) ( not ( = ?auto_26075 ?auto_26076 ) ) ( HAVE_IMAGE ?auto_26069 ?auto_26070 ) ( HAVE_IMAGE ?auto_26072 ?auto_26073 ) ( not ( = ?auto_26069 ?auto_26072 ) ) ( not ( = ?auto_26070 ?auto_26068 ) ) ( not ( = ?auto_26070 ?auto_26073 ) ) ( not ( = ?auto_26070 ?auto_26077 ) ) ( not ( = ?auto_26071 ?auto_26072 ) ) ( not ( = ?auto_26068 ?auto_26073 ) ) ( not ( = ?auto_26072 ?auto_26078 ) ) ( not ( = ?auto_26072 ?auto_26079 ) ) ( not ( = ?auto_26073 ?auto_26077 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26079 ?auto_26077 ?auto_26071 ?auto_26068 )
      ( GET-3IMAGE-VERIFY ?auto_26069 ?auto_26070 ?auto_26071 ?auto_26068 ?auto_26072 ?auto_26073 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26093 - DIRECTION
      ?auto_26094 - MODE
      ?auto_26095 - DIRECTION
      ?auto_26092 - MODE
      ?auto_26096 - DIRECTION
      ?auto_26097 - MODE
    )
    :vars
    (
      ?auto_26100 - INSTRUMENT
      ?auto_26099 - SATELLITE
      ?auto_26102 - DIRECTION
      ?auto_26098 - DIRECTION
      ?auto_26101 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_26100 ?auto_26099 ) ( SUPPORTS ?auto_26100 ?auto_26094 ) ( not ( = ?auto_26093 ?auto_26102 ) ) ( HAVE_IMAGE ?auto_26096 ?auto_26097 ) ( not ( = ?auto_26096 ?auto_26093 ) ) ( not ( = ?auto_26096 ?auto_26102 ) ) ( not ( = ?auto_26097 ?auto_26094 ) ) ( CALIBRATION_TARGET ?auto_26100 ?auto_26102 ) ( POINTING ?auto_26099 ?auto_26098 ) ( not ( = ?auto_26102 ?auto_26098 ) ) ( not ( = ?auto_26093 ?auto_26098 ) ) ( not ( = ?auto_26096 ?auto_26098 ) ) ( ON_BOARD ?auto_26101 ?auto_26099 ) ( POWER_ON ?auto_26101 ) ( not ( = ?auto_26100 ?auto_26101 ) ) ( HAVE_IMAGE ?auto_26095 ?auto_26092 ) ( not ( = ?auto_26093 ?auto_26095 ) ) ( not ( = ?auto_26094 ?auto_26092 ) ) ( not ( = ?auto_26095 ?auto_26096 ) ) ( not ( = ?auto_26095 ?auto_26102 ) ) ( not ( = ?auto_26095 ?auto_26098 ) ) ( not ( = ?auto_26092 ?auto_26097 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26096 ?auto_26097 ?auto_26093 ?auto_26094 )
      ( GET-3IMAGE-VERIFY ?auto_26093 ?auto_26094 ?auto_26095 ?auto_26092 ?auto_26096 ?auto_26097 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26104 - DIRECTION
      ?auto_26105 - MODE
      ?auto_26106 - DIRECTION
      ?auto_26103 - MODE
      ?auto_26107 - DIRECTION
      ?auto_26108 - MODE
    )
    :vars
    (
      ?auto_26110 - INSTRUMENT
      ?auto_26109 - SATELLITE
      ?auto_26112 - DIRECTION
      ?auto_26111 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_26110 ?auto_26109 ) ( SUPPORTS ?auto_26110 ?auto_26105 ) ( not ( = ?auto_26104 ?auto_26112 ) ) ( HAVE_IMAGE ?auto_26106 ?auto_26103 ) ( not ( = ?auto_26106 ?auto_26104 ) ) ( not ( = ?auto_26106 ?auto_26112 ) ) ( not ( = ?auto_26103 ?auto_26105 ) ) ( CALIBRATION_TARGET ?auto_26110 ?auto_26112 ) ( POINTING ?auto_26109 ?auto_26107 ) ( not ( = ?auto_26112 ?auto_26107 ) ) ( not ( = ?auto_26104 ?auto_26107 ) ) ( not ( = ?auto_26106 ?auto_26107 ) ) ( ON_BOARD ?auto_26111 ?auto_26109 ) ( POWER_ON ?auto_26111 ) ( not ( = ?auto_26110 ?auto_26111 ) ) ( HAVE_IMAGE ?auto_26107 ?auto_26108 ) ( not ( = ?auto_26105 ?auto_26108 ) ) ( not ( = ?auto_26103 ?auto_26108 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26106 ?auto_26103 ?auto_26104 ?auto_26105 )
      ( GET-3IMAGE-VERIFY ?auto_26104 ?auto_26105 ?auto_26106 ?auto_26103 ?auto_26107 ?auto_26108 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26125 - DIRECTION
      ?auto_26126 - MODE
      ?auto_26127 - DIRECTION
      ?auto_26124 - MODE
      ?auto_26128 - DIRECTION
      ?auto_26129 - MODE
    )
    :vars
    (
      ?auto_26131 - INSTRUMENT
      ?auto_26130 - SATELLITE
      ?auto_26133 - DIRECTION
      ?auto_26132 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_26131 ?auto_26130 ) ( SUPPORTS ?auto_26131 ?auto_26126 ) ( not ( = ?auto_26125 ?auto_26133 ) ) ( HAVE_IMAGE ?auto_26128 ?auto_26129 ) ( not ( = ?auto_26128 ?auto_26125 ) ) ( not ( = ?auto_26128 ?auto_26133 ) ) ( not ( = ?auto_26129 ?auto_26126 ) ) ( CALIBRATION_TARGET ?auto_26131 ?auto_26133 ) ( POINTING ?auto_26130 ?auto_26127 ) ( not ( = ?auto_26133 ?auto_26127 ) ) ( not ( = ?auto_26125 ?auto_26127 ) ) ( not ( = ?auto_26128 ?auto_26127 ) ) ( ON_BOARD ?auto_26132 ?auto_26130 ) ( POWER_ON ?auto_26132 ) ( not ( = ?auto_26131 ?auto_26132 ) ) ( HAVE_IMAGE ?auto_26127 ?auto_26124 ) ( not ( = ?auto_26126 ?auto_26124 ) ) ( not ( = ?auto_26124 ?auto_26129 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26128 ?auto_26129 ?auto_26125 ?auto_26126 )
      ( GET-3IMAGE-VERIFY ?auto_26125 ?auto_26126 ?auto_26127 ?auto_26124 ?auto_26128 ?auto_26129 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26135 - DIRECTION
      ?auto_26136 - MODE
      ?auto_26137 - DIRECTION
      ?auto_26134 - MODE
      ?auto_26138 - DIRECTION
      ?auto_26139 - MODE
    )
    :vars
    (
      ?auto_26141 - INSTRUMENT
      ?auto_26140 - SATELLITE
      ?auto_26144 - DIRECTION
      ?auto_26145 - DIRECTION
      ?auto_26143 - MODE
      ?auto_26142 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_26141 ?auto_26140 ) ( SUPPORTS ?auto_26141 ?auto_26136 ) ( not ( = ?auto_26135 ?auto_26144 ) ) ( HAVE_IMAGE ?auto_26145 ?auto_26143 ) ( not ( = ?auto_26145 ?auto_26135 ) ) ( not ( = ?auto_26145 ?auto_26144 ) ) ( not ( = ?auto_26143 ?auto_26136 ) ) ( CALIBRATION_TARGET ?auto_26141 ?auto_26144 ) ( POINTING ?auto_26140 ?auto_26137 ) ( not ( = ?auto_26144 ?auto_26137 ) ) ( not ( = ?auto_26135 ?auto_26137 ) ) ( not ( = ?auto_26145 ?auto_26137 ) ) ( ON_BOARD ?auto_26142 ?auto_26140 ) ( POWER_ON ?auto_26142 ) ( not ( = ?auto_26141 ?auto_26142 ) ) ( HAVE_IMAGE ?auto_26137 ?auto_26134 ) ( HAVE_IMAGE ?auto_26138 ?auto_26139 ) ( not ( = ?auto_26135 ?auto_26138 ) ) ( not ( = ?auto_26136 ?auto_26134 ) ) ( not ( = ?auto_26136 ?auto_26139 ) ) ( not ( = ?auto_26137 ?auto_26138 ) ) ( not ( = ?auto_26134 ?auto_26139 ) ) ( not ( = ?auto_26134 ?auto_26143 ) ) ( not ( = ?auto_26138 ?auto_26144 ) ) ( not ( = ?auto_26138 ?auto_26145 ) ) ( not ( = ?auto_26139 ?auto_26143 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26145 ?auto_26143 ?auto_26135 ?auto_26136 )
      ( GET-3IMAGE-VERIFY ?auto_26135 ?auto_26136 ?auto_26137 ?auto_26134 ?auto_26138 ?auto_26139 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26257 - DIRECTION
      ?auto_26258 - MODE
      ?auto_26259 - DIRECTION
      ?auto_26256 - MODE
      ?auto_26260 - DIRECTION
      ?auto_26261 - MODE
    )
    :vars
    (
      ?auto_26263 - INSTRUMENT
      ?auto_26264 - SATELLITE
      ?auto_26266 - DIRECTION
      ?auto_26265 - DIRECTION
      ?auto_26262 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_26263 ?auto_26264 ) ( SUPPORTS ?auto_26263 ?auto_26256 ) ( not ( = ?auto_26259 ?auto_26266 ) ) ( HAVE_IMAGE ?auto_26257 ?auto_26258 ) ( not ( = ?auto_26257 ?auto_26259 ) ) ( not ( = ?auto_26257 ?auto_26266 ) ) ( not ( = ?auto_26258 ?auto_26256 ) ) ( CALIBRATION_TARGET ?auto_26263 ?auto_26266 ) ( POINTING ?auto_26264 ?auto_26265 ) ( not ( = ?auto_26266 ?auto_26265 ) ) ( not ( = ?auto_26259 ?auto_26265 ) ) ( not ( = ?auto_26257 ?auto_26265 ) ) ( ON_BOARD ?auto_26262 ?auto_26264 ) ( POWER_ON ?auto_26262 ) ( not ( = ?auto_26263 ?auto_26262 ) ) ( HAVE_IMAGE ?auto_26260 ?auto_26261 ) ( not ( = ?auto_26257 ?auto_26260 ) ) ( not ( = ?auto_26258 ?auto_26261 ) ) ( not ( = ?auto_26259 ?auto_26260 ) ) ( not ( = ?auto_26256 ?auto_26261 ) ) ( not ( = ?auto_26260 ?auto_26266 ) ) ( not ( = ?auto_26260 ?auto_26265 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26257 ?auto_26258 ?auto_26259 ?auto_26256 )
      ( GET-3IMAGE-VERIFY ?auto_26257 ?auto_26258 ?auto_26259 ?auto_26256 ?auto_26260 ?auto_26261 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26345 - DIRECTION
      ?auto_26346 - MODE
      ?auto_26347 - DIRECTION
      ?auto_26344 - MODE
      ?auto_26348 - DIRECTION
      ?auto_26349 - MODE
    )
    :vars
    (
      ?auto_26351 - INSTRUMENT
      ?auto_26352 - SATELLITE
      ?auto_26354 - DIRECTION
      ?auto_26353 - DIRECTION
      ?auto_26350 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_26351 ?auto_26352 ) ( SUPPORTS ?auto_26351 ?auto_26346 ) ( not ( = ?auto_26345 ?auto_26354 ) ) ( HAVE_IMAGE ?auto_26347 ?auto_26344 ) ( not ( = ?auto_26347 ?auto_26345 ) ) ( not ( = ?auto_26347 ?auto_26354 ) ) ( not ( = ?auto_26344 ?auto_26346 ) ) ( CALIBRATION_TARGET ?auto_26351 ?auto_26354 ) ( POINTING ?auto_26352 ?auto_26353 ) ( not ( = ?auto_26354 ?auto_26353 ) ) ( not ( = ?auto_26345 ?auto_26353 ) ) ( not ( = ?auto_26347 ?auto_26353 ) ) ( ON_BOARD ?auto_26350 ?auto_26352 ) ( POWER_ON ?auto_26350 ) ( not ( = ?auto_26351 ?auto_26350 ) ) ( HAVE_IMAGE ?auto_26348 ?auto_26349 ) ( not ( = ?auto_26345 ?auto_26348 ) ) ( not ( = ?auto_26346 ?auto_26349 ) ) ( not ( = ?auto_26347 ?auto_26348 ) ) ( not ( = ?auto_26344 ?auto_26349 ) ) ( not ( = ?auto_26348 ?auto_26354 ) ) ( not ( = ?auto_26348 ?auto_26353 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26347 ?auto_26344 ?auto_26345 ?auto_26346 )
      ( GET-3IMAGE-VERIFY ?auto_26345 ?auto_26346 ?auto_26347 ?auto_26344 ?auto_26348 ?auto_26349 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_26446 - DIRECTION
      ?auto_26447 - MODE
    )
    :vars
    (
      ?auto_26451 - INSTRUMENT
      ?auto_26452 - SATELLITE
      ?auto_26454 - DIRECTION
      ?auto_26448 - DIRECTION
      ?auto_26450 - MODE
      ?auto_26453 - DIRECTION
      ?auto_26449 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_26451 ?auto_26452 ) ( SUPPORTS ?auto_26451 ?auto_26447 ) ( not ( = ?auto_26446 ?auto_26454 ) ) ( HAVE_IMAGE ?auto_26448 ?auto_26450 ) ( not ( = ?auto_26448 ?auto_26446 ) ) ( not ( = ?auto_26448 ?auto_26454 ) ) ( not ( = ?auto_26450 ?auto_26447 ) ) ( CALIBRATION_TARGET ?auto_26451 ?auto_26454 ) ( not ( = ?auto_26454 ?auto_26453 ) ) ( not ( = ?auto_26446 ?auto_26453 ) ) ( not ( = ?auto_26448 ?auto_26453 ) ) ( ON_BOARD ?auto_26449 ?auto_26452 ) ( POWER_ON ?auto_26449 ) ( not ( = ?auto_26451 ?auto_26449 ) ) ( POINTING ?auto_26452 ?auto_26454 ) )
    :subtasks
    ( ( !TURN_TO ?auto_26452 ?auto_26453 ?auto_26454 )
      ( GET-2IMAGE ?auto_26448 ?auto_26450 ?auto_26446 ?auto_26447 )
      ( GET-1IMAGE-VERIFY ?auto_26446 ?auto_26447 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_26456 - DIRECTION
      ?auto_26457 - MODE
      ?auto_26458 - DIRECTION
      ?auto_26455 - MODE
    )
    :vars
    (
      ?auto_26460 - INSTRUMENT
      ?auto_26461 - SATELLITE
      ?auto_26463 - DIRECTION
      ?auto_26459 - DIRECTION
      ?auto_26462 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_26460 ?auto_26461 ) ( SUPPORTS ?auto_26460 ?auto_26455 ) ( not ( = ?auto_26458 ?auto_26463 ) ) ( HAVE_IMAGE ?auto_26456 ?auto_26457 ) ( not ( = ?auto_26456 ?auto_26458 ) ) ( not ( = ?auto_26456 ?auto_26463 ) ) ( not ( = ?auto_26457 ?auto_26455 ) ) ( CALIBRATION_TARGET ?auto_26460 ?auto_26463 ) ( not ( = ?auto_26463 ?auto_26459 ) ) ( not ( = ?auto_26458 ?auto_26459 ) ) ( not ( = ?auto_26456 ?auto_26459 ) ) ( ON_BOARD ?auto_26462 ?auto_26461 ) ( POWER_ON ?auto_26462 ) ( not ( = ?auto_26460 ?auto_26462 ) ) ( POINTING ?auto_26461 ?auto_26463 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_26458 ?auto_26455 )
      ( GET-2IMAGE-VERIFY ?auto_26456 ?auto_26457 ?auto_26458 ?auto_26455 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_26475 - DIRECTION
      ?auto_26476 - MODE
      ?auto_26477 - DIRECTION
      ?auto_26474 - MODE
    )
    :vars
    (
      ?auto_26480 - INSTRUMENT
      ?auto_26479 - SATELLITE
      ?auto_26482 - DIRECTION
      ?auto_26481 - DIRECTION
      ?auto_26478 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_26480 ?auto_26479 ) ( SUPPORTS ?auto_26480 ?auto_26476 ) ( not ( = ?auto_26475 ?auto_26482 ) ) ( HAVE_IMAGE ?auto_26477 ?auto_26474 ) ( not ( = ?auto_26477 ?auto_26475 ) ) ( not ( = ?auto_26477 ?auto_26482 ) ) ( not ( = ?auto_26474 ?auto_26476 ) ) ( CALIBRATION_TARGET ?auto_26480 ?auto_26482 ) ( not ( = ?auto_26482 ?auto_26481 ) ) ( not ( = ?auto_26475 ?auto_26481 ) ) ( not ( = ?auto_26477 ?auto_26481 ) ) ( ON_BOARD ?auto_26478 ?auto_26479 ) ( POWER_ON ?auto_26478 ) ( not ( = ?auto_26480 ?auto_26478 ) ) ( POINTING ?auto_26479 ?auto_26482 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26477 ?auto_26474 ?auto_26475 ?auto_26476 )
      ( GET-2IMAGE-VERIFY ?auto_26475 ?auto_26476 ?auto_26477 ?auto_26474 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26505 - DIRECTION
      ?auto_26506 - MODE
      ?auto_26507 - DIRECTION
      ?auto_26504 - MODE
      ?auto_26508 - DIRECTION
      ?auto_26509 - MODE
    )
    :vars
    (
      ?auto_26512 - INSTRUMENT
      ?auto_26511 - SATELLITE
      ?auto_26514 - DIRECTION
      ?auto_26513 - DIRECTION
      ?auto_26510 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_26512 ?auto_26511 ) ( SUPPORTS ?auto_26512 ?auto_26509 ) ( not ( = ?auto_26508 ?auto_26514 ) ) ( HAVE_IMAGE ?auto_26507 ?auto_26506 ) ( not ( = ?auto_26507 ?auto_26508 ) ) ( not ( = ?auto_26507 ?auto_26514 ) ) ( not ( = ?auto_26506 ?auto_26509 ) ) ( CALIBRATION_TARGET ?auto_26512 ?auto_26514 ) ( not ( = ?auto_26514 ?auto_26513 ) ) ( not ( = ?auto_26508 ?auto_26513 ) ) ( not ( = ?auto_26507 ?auto_26513 ) ) ( ON_BOARD ?auto_26510 ?auto_26511 ) ( POWER_ON ?auto_26510 ) ( not ( = ?auto_26512 ?auto_26510 ) ) ( POINTING ?auto_26511 ?auto_26514 ) ( HAVE_IMAGE ?auto_26505 ?auto_26506 ) ( HAVE_IMAGE ?auto_26507 ?auto_26504 ) ( not ( = ?auto_26505 ?auto_26507 ) ) ( not ( = ?auto_26505 ?auto_26508 ) ) ( not ( = ?auto_26505 ?auto_26514 ) ) ( not ( = ?auto_26505 ?auto_26513 ) ) ( not ( = ?auto_26506 ?auto_26504 ) ) ( not ( = ?auto_26504 ?auto_26509 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26507 ?auto_26506 ?auto_26508 ?auto_26509 )
      ( GET-3IMAGE-VERIFY ?auto_26505 ?auto_26506 ?auto_26507 ?auto_26504 ?auto_26508 ?auto_26509 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26526 - DIRECTION
      ?auto_26527 - MODE
      ?auto_26528 - DIRECTION
      ?auto_26525 - MODE
      ?auto_26529 - DIRECTION
      ?auto_26530 - MODE
    )
    :vars
    (
      ?auto_26533 - INSTRUMENT
      ?auto_26532 - SATELLITE
      ?auto_26535 - DIRECTION
      ?auto_26534 - DIRECTION
      ?auto_26531 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_26533 ?auto_26532 ) ( SUPPORTS ?auto_26533 ?auto_26525 ) ( not ( = ?auto_26528 ?auto_26535 ) ) ( HAVE_IMAGE ?auto_26529 ?auto_26527 ) ( not ( = ?auto_26529 ?auto_26528 ) ) ( not ( = ?auto_26529 ?auto_26535 ) ) ( not ( = ?auto_26527 ?auto_26525 ) ) ( CALIBRATION_TARGET ?auto_26533 ?auto_26535 ) ( not ( = ?auto_26535 ?auto_26534 ) ) ( not ( = ?auto_26528 ?auto_26534 ) ) ( not ( = ?auto_26529 ?auto_26534 ) ) ( ON_BOARD ?auto_26531 ?auto_26532 ) ( POWER_ON ?auto_26531 ) ( not ( = ?auto_26533 ?auto_26531 ) ) ( POINTING ?auto_26532 ?auto_26535 ) ( HAVE_IMAGE ?auto_26526 ?auto_26527 ) ( HAVE_IMAGE ?auto_26529 ?auto_26530 ) ( not ( = ?auto_26526 ?auto_26528 ) ) ( not ( = ?auto_26526 ?auto_26529 ) ) ( not ( = ?auto_26526 ?auto_26535 ) ) ( not ( = ?auto_26526 ?auto_26534 ) ) ( not ( = ?auto_26527 ?auto_26530 ) ) ( not ( = ?auto_26525 ?auto_26530 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26529 ?auto_26527 ?auto_26528 ?auto_26525 )
      ( GET-3IMAGE-VERIFY ?auto_26526 ?auto_26527 ?auto_26528 ?auto_26525 ?auto_26529 ?auto_26530 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26614 - DIRECTION
      ?auto_26615 - MODE
      ?auto_26616 - DIRECTION
      ?auto_26613 - MODE
      ?auto_26617 - DIRECTION
      ?auto_26618 - MODE
    )
    :vars
    (
      ?auto_26621 - INSTRUMENT
      ?auto_26620 - SATELLITE
      ?auto_26623 - DIRECTION
      ?auto_26622 - DIRECTION
      ?auto_26619 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_26621 ?auto_26620 ) ( SUPPORTS ?auto_26621 ?auto_26615 ) ( not ( = ?auto_26614 ?auto_26623 ) ) ( HAVE_IMAGE ?auto_26616 ?auto_26613 ) ( not ( = ?auto_26616 ?auto_26614 ) ) ( not ( = ?auto_26616 ?auto_26623 ) ) ( not ( = ?auto_26613 ?auto_26615 ) ) ( CALIBRATION_TARGET ?auto_26621 ?auto_26623 ) ( not ( = ?auto_26623 ?auto_26622 ) ) ( not ( = ?auto_26614 ?auto_26622 ) ) ( not ( = ?auto_26616 ?auto_26622 ) ) ( ON_BOARD ?auto_26619 ?auto_26620 ) ( POWER_ON ?auto_26619 ) ( not ( = ?auto_26621 ?auto_26619 ) ) ( POINTING ?auto_26620 ?auto_26623 ) ( HAVE_IMAGE ?auto_26617 ?auto_26618 ) ( not ( = ?auto_26614 ?auto_26617 ) ) ( not ( = ?auto_26615 ?auto_26618 ) ) ( not ( = ?auto_26616 ?auto_26617 ) ) ( not ( = ?auto_26613 ?auto_26618 ) ) ( not ( = ?auto_26617 ?auto_26623 ) ) ( not ( = ?auto_26617 ?auto_26622 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26616 ?auto_26613 ?auto_26614 ?auto_26615 )
      ( GET-3IMAGE-VERIFY ?auto_26614 ?auto_26615 ?auto_26616 ?auto_26613 ?auto_26617 ?auto_26618 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27022 - DIRECTION
      ?auto_27023 - MODE
      ?auto_27024 - DIRECTION
      ?auto_27021 - MODE
      ?auto_27025 - DIRECTION
      ?auto_27026 - MODE
    )
    :vars
    (
      ?auto_27029 - INSTRUMENT
      ?auto_27027 - SATELLITE
      ?auto_27028 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_27029 ?auto_27027 ) ( SUPPORTS ?auto_27029 ?auto_27026 ) ( POINTING ?auto_27027 ?auto_27028 ) ( not ( = ?auto_27025 ?auto_27028 ) ) ( HAVE_IMAGE ?auto_27022 ?auto_27021 ) ( not ( = ?auto_27022 ?auto_27025 ) ) ( not ( = ?auto_27022 ?auto_27028 ) ) ( not ( = ?auto_27021 ?auto_27026 ) ) ( CALIBRATION_TARGET ?auto_27029 ?auto_27028 ) ( POWER_AVAIL ?auto_27027 ) ( HAVE_IMAGE ?auto_27022 ?auto_27023 ) ( HAVE_IMAGE ?auto_27024 ?auto_27021 ) ( not ( = ?auto_27022 ?auto_27024 ) ) ( not ( = ?auto_27023 ?auto_27021 ) ) ( not ( = ?auto_27023 ?auto_27026 ) ) ( not ( = ?auto_27024 ?auto_27025 ) ) ( not ( = ?auto_27024 ?auto_27028 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27022 ?auto_27021 ?auto_27025 ?auto_27026 )
      ( GET-3IMAGE-VERIFY ?auto_27022 ?auto_27023 ?auto_27024 ?auto_27021 ?auto_27025 ?auto_27026 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27118 - DIRECTION
      ?auto_27119 - MODE
      ?auto_27120 - DIRECTION
      ?auto_27117 - MODE
      ?auto_27121 - DIRECTION
      ?auto_27122 - MODE
    )
    :vars
    (
      ?auto_27125 - INSTRUMENT
      ?auto_27123 - SATELLITE
      ?auto_27124 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_27125 ?auto_27123 ) ( SUPPORTS ?auto_27125 ?auto_27119 ) ( POINTING ?auto_27123 ?auto_27124 ) ( not ( = ?auto_27118 ?auto_27124 ) ) ( HAVE_IMAGE ?auto_27120 ?auto_27122 ) ( not ( = ?auto_27120 ?auto_27118 ) ) ( not ( = ?auto_27120 ?auto_27124 ) ) ( not ( = ?auto_27122 ?auto_27119 ) ) ( CALIBRATION_TARGET ?auto_27125 ?auto_27124 ) ( POWER_AVAIL ?auto_27123 ) ( HAVE_IMAGE ?auto_27120 ?auto_27117 ) ( HAVE_IMAGE ?auto_27121 ?auto_27122 ) ( not ( = ?auto_27118 ?auto_27121 ) ) ( not ( = ?auto_27119 ?auto_27117 ) ) ( not ( = ?auto_27120 ?auto_27121 ) ) ( not ( = ?auto_27117 ?auto_27122 ) ) ( not ( = ?auto_27121 ?auto_27124 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27120 ?auto_27122 ?auto_27118 ?auto_27119 )
      ( GET-3IMAGE-VERIFY ?auto_27118 ?auto_27119 ?auto_27120 ?auto_27117 ?auto_27121 ?auto_27122 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27244 - DIRECTION
      ?auto_27245 - MODE
      ?auto_27246 - DIRECTION
      ?auto_27243 - MODE
      ?auto_27247 - DIRECTION
      ?auto_27248 - MODE
    )
    :vars
    (
      ?auto_27250 - INSTRUMENT
      ?auto_27251 - SATELLITE
      ?auto_27249 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_27250 ?auto_27251 ) ( SUPPORTS ?auto_27250 ?auto_27248 ) ( not ( = ?auto_27247 ?auto_27249 ) ) ( HAVE_IMAGE ?auto_27244 ?auto_27243 ) ( not ( = ?auto_27244 ?auto_27247 ) ) ( not ( = ?auto_27244 ?auto_27249 ) ) ( not ( = ?auto_27243 ?auto_27248 ) ) ( CALIBRATION_TARGET ?auto_27250 ?auto_27249 ) ( POWER_AVAIL ?auto_27251 ) ( POINTING ?auto_27251 ?auto_27244 ) ( HAVE_IMAGE ?auto_27244 ?auto_27245 ) ( HAVE_IMAGE ?auto_27246 ?auto_27243 ) ( not ( = ?auto_27244 ?auto_27246 ) ) ( not ( = ?auto_27245 ?auto_27243 ) ) ( not ( = ?auto_27245 ?auto_27248 ) ) ( not ( = ?auto_27246 ?auto_27247 ) ) ( not ( = ?auto_27246 ?auto_27249 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27244 ?auto_27243 ?auto_27247 ?auto_27248 )
      ( GET-3IMAGE-VERIFY ?auto_27244 ?auto_27245 ?auto_27246 ?auto_27243 ?auto_27247 ?auto_27248 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27340 - DIRECTION
      ?auto_27341 - MODE
      ?auto_27342 - DIRECTION
      ?auto_27339 - MODE
      ?auto_27343 - DIRECTION
      ?auto_27344 - MODE
    )
    :vars
    (
      ?auto_27346 - INSTRUMENT
      ?auto_27347 - SATELLITE
      ?auto_27345 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_27346 ?auto_27347 ) ( SUPPORTS ?auto_27346 ?auto_27341 ) ( not ( = ?auto_27340 ?auto_27345 ) ) ( HAVE_IMAGE ?auto_27343 ?auto_27339 ) ( not ( = ?auto_27343 ?auto_27340 ) ) ( not ( = ?auto_27343 ?auto_27345 ) ) ( not ( = ?auto_27339 ?auto_27341 ) ) ( CALIBRATION_TARGET ?auto_27346 ?auto_27345 ) ( POWER_AVAIL ?auto_27347 ) ( POINTING ?auto_27347 ?auto_27343 ) ( HAVE_IMAGE ?auto_27342 ?auto_27339 ) ( HAVE_IMAGE ?auto_27343 ?auto_27344 ) ( not ( = ?auto_27340 ?auto_27342 ) ) ( not ( = ?auto_27341 ?auto_27344 ) ) ( not ( = ?auto_27342 ?auto_27343 ) ) ( not ( = ?auto_27342 ?auto_27345 ) ) ( not ( = ?auto_27339 ?auto_27344 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27343 ?auto_27339 ?auto_27340 ?auto_27341 )
      ( GET-3IMAGE-VERIFY ?auto_27340 ?auto_27341 ?auto_27342 ?auto_27339 ?auto_27343 ?auto_27344 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27469 - DIRECTION
      ?auto_27470 - MODE
      ?auto_27471 - DIRECTION
      ?auto_27468 - MODE
      ?auto_27472 - DIRECTION
      ?auto_27473 - MODE
    )
    :vars
    (
      ?auto_27476 - INSTRUMENT
      ?auto_27475 - SATELLITE
      ?auto_27477 - DIRECTION
      ?auto_27474 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_27476 ?auto_27475 ) ( SUPPORTS ?auto_27476 ?auto_27473 ) ( not ( = ?auto_27472 ?auto_27477 ) ) ( HAVE_IMAGE ?auto_27469 ?auto_27468 ) ( not ( = ?auto_27469 ?auto_27472 ) ) ( not ( = ?auto_27469 ?auto_27477 ) ) ( not ( = ?auto_27468 ?auto_27473 ) ) ( CALIBRATION_TARGET ?auto_27476 ?auto_27477 ) ( POINTING ?auto_27475 ?auto_27469 ) ( ON_BOARD ?auto_27474 ?auto_27475 ) ( POWER_ON ?auto_27474 ) ( not ( = ?auto_27476 ?auto_27474 ) ) ( HAVE_IMAGE ?auto_27469 ?auto_27470 ) ( HAVE_IMAGE ?auto_27471 ?auto_27468 ) ( not ( = ?auto_27469 ?auto_27471 ) ) ( not ( = ?auto_27470 ?auto_27468 ) ) ( not ( = ?auto_27470 ?auto_27473 ) ) ( not ( = ?auto_27471 ?auto_27472 ) ) ( not ( = ?auto_27471 ?auto_27477 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27469 ?auto_27468 ?auto_27472 ?auto_27473 )
      ( GET-3IMAGE-VERIFY ?auto_27469 ?auto_27470 ?auto_27471 ?auto_27468 ?auto_27472 ?auto_27473 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27489 - DIRECTION
      ?auto_27490 - MODE
      ?auto_27491 - DIRECTION
      ?auto_27488 - MODE
      ?auto_27492 - DIRECTION
      ?auto_27493 - MODE
    )
    :vars
    (
      ?auto_27496 - INSTRUMENT
      ?auto_27495 - SATELLITE
      ?auto_27497 - DIRECTION
      ?auto_27494 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_27496 ?auto_27495 ) ( SUPPORTS ?auto_27496 ?auto_27488 ) ( not ( = ?auto_27491 ?auto_27497 ) ) ( HAVE_IMAGE ?auto_27489 ?auto_27493 ) ( not ( = ?auto_27489 ?auto_27491 ) ) ( not ( = ?auto_27489 ?auto_27497 ) ) ( not ( = ?auto_27493 ?auto_27488 ) ) ( CALIBRATION_TARGET ?auto_27496 ?auto_27497 ) ( POINTING ?auto_27495 ?auto_27489 ) ( ON_BOARD ?auto_27494 ?auto_27495 ) ( POWER_ON ?auto_27494 ) ( not ( = ?auto_27496 ?auto_27494 ) ) ( HAVE_IMAGE ?auto_27489 ?auto_27490 ) ( HAVE_IMAGE ?auto_27492 ?auto_27493 ) ( not ( = ?auto_27489 ?auto_27492 ) ) ( not ( = ?auto_27490 ?auto_27488 ) ) ( not ( = ?auto_27490 ?auto_27493 ) ) ( not ( = ?auto_27491 ?auto_27492 ) ) ( not ( = ?auto_27492 ?auto_27497 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27489 ?auto_27493 ?auto_27491 ?auto_27488 )
      ( GET-3IMAGE-VERIFY ?auto_27489 ?auto_27490 ?auto_27491 ?auto_27488 ?auto_27492 ?auto_27493 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_27575 - DIRECTION
      ?auto_27576 - MODE
      ?auto_27577 - DIRECTION
      ?auto_27574 - MODE
      ?auto_27578 - DIRECTION
      ?auto_27579 - MODE
    )
    :vars
    (
      ?auto_27582 - INSTRUMENT
      ?auto_27581 - SATELLITE
      ?auto_27583 - DIRECTION
      ?auto_27580 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_27582 ?auto_27581 ) ( SUPPORTS ?auto_27582 ?auto_27576 ) ( not ( = ?auto_27575 ?auto_27583 ) ) ( HAVE_IMAGE ?auto_27577 ?auto_27574 ) ( not ( = ?auto_27577 ?auto_27575 ) ) ( not ( = ?auto_27577 ?auto_27583 ) ) ( not ( = ?auto_27574 ?auto_27576 ) ) ( CALIBRATION_TARGET ?auto_27582 ?auto_27583 ) ( POINTING ?auto_27581 ?auto_27577 ) ( ON_BOARD ?auto_27580 ?auto_27581 ) ( POWER_ON ?auto_27580 ) ( not ( = ?auto_27582 ?auto_27580 ) ) ( HAVE_IMAGE ?auto_27578 ?auto_27579 ) ( not ( = ?auto_27575 ?auto_27578 ) ) ( not ( = ?auto_27576 ?auto_27579 ) ) ( not ( = ?auto_27577 ?auto_27578 ) ) ( not ( = ?auto_27574 ?auto_27579 ) ) ( not ( = ?auto_27578 ?auto_27583 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_27577 ?auto_27574 ?auto_27575 ?auto_27576 )
      ( GET-3IMAGE-VERIFY ?auto_27575 ?auto_27576 ?auto_27577 ?auto_27574 ?auto_27578 ?auto_27579 ) )
  )

)

