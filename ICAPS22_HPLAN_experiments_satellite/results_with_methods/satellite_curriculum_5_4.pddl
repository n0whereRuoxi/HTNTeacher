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
      ?auto_306606 - DIRECTION
      ?auto_306607 - MODE
    )
    :vars
    (
      ?auto_306608 - INSTRUMENT
      ?auto_306609 - SATELLITE
      ?auto_306610 - DIRECTION
      ?auto_306611 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_306608 ?auto_306609 ) ( SUPPORTS ?auto_306608 ?auto_306607 ) ( not ( = ?auto_306606 ?auto_306610 ) ) ( CALIBRATION_TARGET ?auto_306608 ?auto_306610 ) ( POWER_AVAIL ?auto_306609 ) ( POINTING ?auto_306609 ?auto_306611 ) ( not ( = ?auto_306610 ?auto_306611 ) ) ( not ( = ?auto_306606 ?auto_306611 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_306609 ?auto_306610 ?auto_306611 )
      ( !SWITCH_ON ?auto_306608 ?auto_306609 )
      ( !CALIBRATE ?auto_306609 ?auto_306608 ?auto_306610 )
      ( !TURN_TO ?auto_306609 ?auto_306606 ?auto_306610 )
      ( !TAKE_IMAGE ?auto_306609 ?auto_306606 ?auto_306608 ?auto_306607 )
      ( GET-1IMAGE-VERIFY ?auto_306606 ?auto_306607 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_306614 - DIRECTION
      ?auto_306615 - MODE
    )
    :vars
    (
      ?auto_306616 - INSTRUMENT
      ?auto_306617 - SATELLITE
      ?auto_306618 - DIRECTION
      ?auto_306619 - DIRECTION
      ?auto_306620 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_306616 ?auto_306617 ) ( SUPPORTS ?auto_306616 ?auto_306615 ) ( not ( = ?auto_306614 ?auto_306618 ) ) ( CALIBRATION_TARGET ?auto_306616 ?auto_306618 ) ( POINTING ?auto_306617 ?auto_306619 ) ( not ( = ?auto_306618 ?auto_306619 ) ) ( ON_BOARD ?auto_306620 ?auto_306617 ) ( POWER_ON ?auto_306620 ) ( not ( = ?auto_306614 ?auto_306619 ) ) ( not ( = ?auto_306616 ?auto_306620 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_306620 ?auto_306617 )
      ( !TURN_TO ?auto_306617 ?auto_306618 ?auto_306619 )
      ( !SWITCH_ON ?auto_306616 ?auto_306617 )
      ( !CALIBRATE ?auto_306617 ?auto_306616 ?auto_306618 )
      ( !TURN_TO ?auto_306617 ?auto_306614 ?auto_306618 )
      ( !TAKE_IMAGE ?auto_306617 ?auto_306614 ?auto_306616 ?auto_306615 )
      ( GET-1IMAGE-VERIFY ?auto_306614 ?auto_306615 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_306633 - DIRECTION
      ?auto_306634 - MODE
      ?auto_306636 - DIRECTION
      ?auto_306635 - MODE
    )
    :vars
    (
      ?auto_306640 - INSTRUMENT
      ?auto_306638 - SATELLITE
      ?auto_306639 - DIRECTION
      ?auto_306637 - INSTRUMENT
      ?auto_306641 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_306636 ?auto_306633 ) ) ( ON_BOARD ?auto_306640 ?auto_306638 ) ( SUPPORTS ?auto_306640 ?auto_306635 ) ( not ( = ?auto_306636 ?auto_306639 ) ) ( CALIBRATION_TARGET ?auto_306640 ?auto_306639 ) ( not ( = ?auto_306639 ?auto_306633 ) ) ( ON_BOARD ?auto_306637 ?auto_306638 ) ( not ( = ?auto_306640 ?auto_306637 ) ) ( SUPPORTS ?auto_306637 ?auto_306634 ) ( CALIBRATION_TARGET ?auto_306637 ?auto_306639 ) ( POWER_AVAIL ?auto_306638 ) ( POINTING ?auto_306638 ?auto_306641 ) ( not ( = ?auto_306639 ?auto_306641 ) ) ( not ( = ?auto_306633 ?auto_306641 ) ) ( not ( = ?auto_306634 ?auto_306635 ) ) ( not ( = ?auto_306636 ?auto_306641 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_306633 ?auto_306634 )
      ( GET-1IMAGE ?auto_306636 ?auto_306635 )
      ( GET-2IMAGE-VERIFY ?auto_306633 ?auto_306634 ?auto_306636 ?auto_306635 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_306642 - DIRECTION
      ?auto_306643 - MODE
      ?auto_306645 - DIRECTION
      ?auto_306644 - MODE
    )
    :vars
    (
      ?auto_306646 - INSTRUMENT
      ?auto_306648 - SATELLITE
      ?auto_306650 - DIRECTION
      ?auto_306649 - INSTRUMENT
      ?auto_306647 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_306645 ?auto_306642 ) ) ( ON_BOARD ?auto_306646 ?auto_306648 ) ( SUPPORTS ?auto_306646 ?auto_306643 ) ( not ( = ?auto_306642 ?auto_306650 ) ) ( CALIBRATION_TARGET ?auto_306646 ?auto_306650 ) ( not ( = ?auto_306650 ?auto_306645 ) ) ( ON_BOARD ?auto_306649 ?auto_306648 ) ( not ( = ?auto_306646 ?auto_306649 ) ) ( SUPPORTS ?auto_306649 ?auto_306644 ) ( CALIBRATION_TARGET ?auto_306649 ?auto_306650 ) ( POWER_AVAIL ?auto_306648 ) ( POINTING ?auto_306648 ?auto_306647 ) ( not ( = ?auto_306650 ?auto_306647 ) ) ( not ( = ?auto_306645 ?auto_306647 ) ) ( not ( = ?auto_306644 ?auto_306643 ) ) ( not ( = ?auto_306642 ?auto_306647 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_306645 ?auto_306644 ?auto_306642 ?auto_306643 )
      ( GET-2IMAGE-VERIFY ?auto_306642 ?auto_306643 ?auto_306645 ?auto_306644 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_306664 - DIRECTION
      ?auto_306665 - MODE
    )
    :vars
    (
      ?auto_306666 - INSTRUMENT
      ?auto_306667 - SATELLITE
      ?auto_306668 - DIRECTION
      ?auto_306669 - DIRECTION
      ?auto_306670 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_306666 ?auto_306667 ) ( SUPPORTS ?auto_306666 ?auto_306665 ) ( not ( = ?auto_306664 ?auto_306668 ) ) ( CALIBRATION_TARGET ?auto_306666 ?auto_306668 ) ( POINTING ?auto_306667 ?auto_306669 ) ( not ( = ?auto_306668 ?auto_306669 ) ) ( ON_BOARD ?auto_306670 ?auto_306667 ) ( POWER_ON ?auto_306670 ) ( not ( = ?auto_306664 ?auto_306669 ) ) ( not ( = ?auto_306666 ?auto_306670 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_306670 ?auto_306667 )
      ( !TURN_TO ?auto_306667 ?auto_306668 ?auto_306669 )
      ( !SWITCH_ON ?auto_306666 ?auto_306667 )
      ( !CALIBRATE ?auto_306667 ?auto_306666 ?auto_306668 )
      ( !TURN_TO ?auto_306667 ?auto_306664 ?auto_306668 )
      ( !TAKE_IMAGE ?auto_306667 ?auto_306664 ?auto_306666 ?auto_306665 )
      ( GET-1IMAGE-VERIFY ?auto_306664 ?auto_306665 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_306799 - DIRECTION
      ?auto_306800 - MODE
      ?auto_306802 - DIRECTION
      ?auto_306801 - MODE
      ?auto_306803 - DIRECTION
      ?auto_306804 - MODE
    )
    :vars
    (
      ?auto_306805 - INSTRUMENT
      ?auto_306808 - SATELLITE
      ?auto_306806 - DIRECTION
      ?auto_306807 - INSTRUMENT
      ?auto_306810 - INSTRUMENT
      ?auto_306809 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_306802 ?auto_306799 ) ) ( not ( = ?auto_306803 ?auto_306799 ) ) ( not ( = ?auto_306803 ?auto_306802 ) ) ( ON_BOARD ?auto_306805 ?auto_306808 ) ( SUPPORTS ?auto_306805 ?auto_306804 ) ( not ( = ?auto_306803 ?auto_306806 ) ) ( CALIBRATION_TARGET ?auto_306805 ?auto_306806 ) ( not ( = ?auto_306806 ?auto_306802 ) ) ( ON_BOARD ?auto_306807 ?auto_306808 ) ( not ( = ?auto_306805 ?auto_306807 ) ) ( SUPPORTS ?auto_306807 ?auto_306801 ) ( CALIBRATION_TARGET ?auto_306807 ?auto_306806 ) ( not ( = ?auto_306806 ?auto_306799 ) ) ( ON_BOARD ?auto_306810 ?auto_306808 ) ( not ( = ?auto_306807 ?auto_306810 ) ) ( SUPPORTS ?auto_306810 ?auto_306800 ) ( CALIBRATION_TARGET ?auto_306810 ?auto_306806 ) ( POWER_AVAIL ?auto_306808 ) ( POINTING ?auto_306808 ?auto_306809 ) ( not ( = ?auto_306806 ?auto_306809 ) ) ( not ( = ?auto_306799 ?auto_306809 ) ) ( not ( = ?auto_306800 ?auto_306801 ) ) ( not ( = ?auto_306802 ?auto_306809 ) ) ( not ( = ?auto_306800 ?auto_306804 ) ) ( not ( = ?auto_306801 ?auto_306804 ) ) ( not ( = ?auto_306803 ?auto_306809 ) ) ( not ( = ?auto_306805 ?auto_306810 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_306802 ?auto_306801 ?auto_306799 ?auto_306800 )
      ( GET-1IMAGE ?auto_306803 ?auto_306804 )
      ( GET-3IMAGE-VERIFY ?auto_306799 ?auto_306800 ?auto_306802 ?auto_306801 ?auto_306803 ?auto_306804 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_306825 - DIRECTION
      ?auto_306826 - MODE
      ?auto_306828 - DIRECTION
      ?auto_306827 - MODE
      ?auto_306829 - DIRECTION
      ?auto_306830 - MODE
    )
    :vars
    (
      ?auto_306834 - INSTRUMENT
      ?auto_306832 - SATELLITE
      ?auto_306833 - DIRECTION
      ?auto_306831 - INSTRUMENT
      ?auto_306836 - INSTRUMENT
      ?auto_306835 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_306828 ?auto_306825 ) ) ( not ( = ?auto_306829 ?auto_306825 ) ) ( not ( = ?auto_306829 ?auto_306828 ) ) ( ON_BOARD ?auto_306834 ?auto_306832 ) ( SUPPORTS ?auto_306834 ?auto_306827 ) ( not ( = ?auto_306828 ?auto_306833 ) ) ( CALIBRATION_TARGET ?auto_306834 ?auto_306833 ) ( not ( = ?auto_306833 ?auto_306829 ) ) ( ON_BOARD ?auto_306831 ?auto_306832 ) ( not ( = ?auto_306834 ?auto_306831 ) ) ( SUPPORTS ?auto_306831 ?auto_306830 ) ( CALIBRATION_TARGET ?auto_306831 ?auto_306833 ) ( not ( = ?auto_306833 ?auto_306825 ) ) ( ON_BOARD ?auto_306836 ?auto_306832 ) ( not ( = ?auto_306831 ?auto_306836 ) ) ( SUPPORTS ?auto_306836 ?auto_306826 ) ( CALIBRATION_TARGET ?auto_306836 ?auto_306833 ) ( POWER_AVAIL ?auto_306832 ) ( POINTING ?auto_306832 ?auto_306835 ) ( not ( = ?auto_306833 ?auto_306835 ) ) ( not ( = ?auto_306825 ?auto_306835 ) ) ( not ( = ?auto_306826 ?auto_306830 ) ) ( not ( = ?auto_306829 ?auto_306835 ) ) ( not ( = ?auto_306826 ?auto_306827 ) ) ( not ( = ?auto_306830 ?auto_306827 ) ) ( not ( = ?auto_306828 ?auto_306835 ) ) ( not ( = ?auto_306834 ?auto_306836 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_306825 ?auto_306826 ?auto_306829 ?auto_306830 ?auto_306828 ?auto_306827 )
      ( GET-3IMAGE-VERIFY ?auto_306825 ?auto_306826 ?auto_306828 ?auto_306827 ?auto_306829 ?auto_306830 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_306851 - DIRECTION
      ?auto_306852 - MODE
      ?auto_306854 - DIRECTION
      ?auto_306853 - MODE
      ?auto_306855 - DIRECTION
      ?auto_306856 - MODE
    )
    :vars
    (
      ?auto_306862 - INSTRUMENT
      ?auto_306859 - SATELLITE
      ?auto_306860 - DIRECTION
      ?auto_306858 - INSTRUMENT
      ?auto_306861 - INSTRUMENT
      ?auto_306857 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_306854 ?auto_306851 ) ) ( not ( = ?auto_306855 ?auto_306851 ) ) ( not ( = ?auto_306855 ?auto_306854 ) ) ( ON_BOARD ?auto_306862 ?auto_306859 ) ( SUPPORTS ?auto_306862 ?auto_306856 ) ( not ( = ?auto_306855 ?auto_306860 ) ) ( CALIBRATION_TARGET ?auto_306862 ?auto_306860 ) ( not ( = ?auto_306860 ?auto_306851 ) ) ( ON_BOARD ?auto_306858 ?auto_306859 ) ( not ( = ?auto_306862 ?auto_306858 ) ) ( SUPPORTS ?auto_306858 ?auto_306852 ) ( CALIBRATION_TARGET ?auto_306858 ?auto_306860 ) ( not ( = ?auto_306860 ?auto_306854 ) ) ( ON_BOARD ?auto_306861 ?auto_306859 ) ( not ( = ?auto_306858 ?auto_306861 ) ) ( SUPPORTS ?auto_306861 ?auto_306853 ) ( CALIBRATION_TARGET ?auto_306861 ?auto_306860 ) ( POWER_AVAIL ?auto_306859 ) ( POINTING ?auto_306859 ?auto_306857 ) ( not ( = ?auto_306860 ?auto_306857 ) ) ( not ( = ?auto_306854 ?auto_306857 ) ) ( not ( = ?auto_306853 ?auto_306852 ) ) ( not ( = ?auto_306851 ?auto_306857 ) ) ( not ( = ?auto_306853 ?auto_306856 ) ) ( not ( = ?auto_306852 ?auto_306856 ) ) ( not ( = ?auto_306855 ?auto_306857 ) ) ( not ( = ?auto_306862 ?auto_306861 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_306854 ?auto_306853 ?auto_306855 ?auto_306856 ?auto_306851 ?auto_306852 )
      ( GET-3IMAGE-VERIFY ?auto_306851 ?auto_306852 ?auto_306854 ?auto_306853 ?auto_306855 ?auto_306856 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_306877 - DIRECTION
      ?auto_306878 - MODE
      ?auto_306880 - DIRECTION
      ?auto_306879 - MODE
      ?auto_306881 - DIRECTION
      ?auto_306882 - MODE
    )
    :vars
    (
      ?auto_306888 - INSTRUMENT
      ?auto_306885 - SATELLITE
      ?auto_306886 - DIRECTION
      ?auto_306884 - INSTRUMENT
      ?auto_306887 - INSTRUMENT
      ?auto_306883 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_306880 ?auto_306877 ) ) ( not ( = ?auto_306881 ?auto_306877 ) ) ( not ( = ?auto_306881 ?auto_306880 ) ) ( ON_BOARD ?auto_306888 ?auto_306885 ) ( SUPPORTS ?auto_306888 ?auto_306879 ) ( not ( = ?auto_306880 ?auto_306886 ) ) ( CALIBRATION_TARGET ?auto_306888 ?auto_306886 ) ( not ( = ?auto_306886 ?auto_306877 ) ) ( ON_BOARD ?auto_306884 ?auto_306885 ) ( not ( = ?auto_306888 ?auto_306884 ) ) ( SUPPORTS ?auto_306884 ?auto_306878 ) ( CALIBRATION_TARGET ?auto_306884 ?auto_306886 ) ( not ( = ?auto_306886 ?auto_306881 ) ) ( ON_BOARD ?auto_306887 ?auto_306885 ) ( not ( = ?auto_306884 ?auto_306887 ) ) ( SUPPORTS ?auto_306887 ?auto_306882 ) ( CALIBRATION_TARGET ?auto_306887 ?auto_306886 ) ( POWER_AVAIL ?auto_306885 ) ( POINTING ?auto_306885 ?auto_306883 ) ( not ( = ?auto_306886 ?auto_306883 ) ) ( not ( = ?auto_306881 ?auto_306883 ) ) ( not ( = ?auto_306882 ?auto_306878 ) ) ( not ( = ?auto_306877 ?auto_306883 ) ) ( not ( = ?auto_306882 ?auto_306879 ) ) ( not ( = ?auto_306878 ?auto_306879 ) ) ( not ( = ?auto_306880 ?auto_306883 ) ) ( not ( = ?auto_306888 ?auto_306887 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_306881 ?auto_306882 ?auto_306880 ?auto_306879 ?auto_306877 ?auto_306878 )
      ( GET-3IMAGE-VERIFY ?auto_306877 ?auto_306878 ?auto_306880 ?auto_306879 ?auto_306881 ?auto_306882 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_306931 - DIRECTION
      ?auto_306932 - MODE
      ?auto_306934 - DIRECTION
      ?auto_306933 - MODE
      ?auto_306935 - DIRECTION
      ?auto_306936 - MODE
    )
    :vars
    (
      ?auto_306942 - INSTRUMENT
      ?auto_306939 - SATELLITE
      ?auto_306940 - DIRECTION
      ?auto_306938 - INSTRUMENT
      ?auto_306941 - INSTRUMENT
      ?auto_306937 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_306934 ?auto_306931 ) ) ( not ( = ?auto_306935 ?auto_306931 ) ) ( not ( = ?auto_306935 ?auto_306934 ) ) ( ON_BOARD ?auto_306942 ?auto_306939 ) ( SUPPORTS ?auto_306942 ?auto_306932 ) ( not ( = ?auto_306931 ?auto_306940 ) ) ( CALIBRATION_TARGET ?auto_306942 ?auto_306940 ) ( not ( = ?auto_306940 ?auto_306935 ) ) ( ON_BOARD ?auto_306938 ?auto_306939 ) ( not ( = ?auto_306942 ?auto_306938 ) ) ( SUPPORTS ?auto_306938 ?auto_306936 ) ( CALIBRATION_TARGET ?auto_306938 ?auto_306940 ) ( not ( = ?auto_306940 ?auto_306934 ) ) ( ON_BOARD ?auto_306941 ?auto_306939 ) ( not ( = ?auto_306938 ?auto_306941 ) ) ( SUPPORTS ?auto_306941 ?auto_306933 ) ( CALIBRATION_TARGET ?auto_306941 ?auto_306940 ) ( POWER_AVAIL ?auto_306939 ) ( POINTING ?auto_306939 ?auto_306937 ) ( not ( = ?auto_306940 ?auto_306937 ) ) ( not ( = ?auto_306934 ?auto_306937 ) ) ( not ( = ?auto_306933 ?auto_306936 ) ) ( not ( = ?auto_306935 ?auto_306937 ) ) ( not ( = ?auto_306933 ?auto_306932 ) ) ( not ( = ?auto_306936 ?auto_306932 ) ) ( not ( = ?auto_306931 ?auto_306937 ) ) ( not ( = ?auto_306942 ?auto_306941 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_306934 ?auto_306933 ?auto_306931 ?auto_306932 ?auto_306935 ?auto_306936 )
      ( GET-3IMAGE-VERIFY ?auto_306931 ?auto_306932 ?auto_306934 ?auto_306933 ?auto_306935 ?auto_306936 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_306957 - DIRECTION
      ?auto_306958 - MODE
      ?auto_306960 - DIRECTION
      ?auto_306959 - MODE
      ?auto_306961 - DIRECTION
      ?auto_306962 - MODE
    )
    :vars
    (
      ?auto_306968 - INSTRUMENT
      ?auto_306965 - SATELLITE
      ?auto_306966 - DIRECTION
      ?auto_306964 - INSTRUMENT
      ?auto_306967 - INSTRUMENT
      ?auto_306963 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_306960 ?auto_306957 ) ) ( not ( = ?auto_306961 ?auto_306957 ) ) ( not ( = ?auto_306961 ?auto_306960 ) ) ( ON_BOARD ?auto_306968 ?auto_306965 ) ( SUPPORTS ?auto_306968 ?auto_306958 ) ( not ( = ?auto_306957 ?auto_306966 ) ) ( CALIBRATION_TARGET ?auto_306968 ?auto_306966 ) ( not ( = ?auto_306966 ?auto_306960 ) ) ( ON_BOARD ?auto_306964 ?auto_306965 ) ( not ( = ?auto_306968 ?auto_306964 ) ) ( SUPPORTS ?auto_306964 ?auto_306959 ) ( CALIBRATION_TARGET ?auto_306964 ?auto_306966 ) ( not ( = ?auto_306966 ?auto_306961 ) ) ( ON_BOARD ?auto_306967 ?auto_306965 ) ( not ( = ?auto_306964 ?auto_306967 ) ) ( SUPPORTS ?auto_306967 ?auto_306962 ) ( CALIBRATION_TARGET ?auto_306967 ?auto_306966 ) ( POWER_AVAIL ?auto_306965 ) ( POINTING ?auto_306965 ?auto_306963 ) ( not ( = ?auto_306966 ?auto_306963 ) ) ( not ( = ?auto_306961 ?auto_306963 ) ) ( not ( = ?auto_306962 ?auto_306959 ) ) ( not ( = ?auto_306960 ?auto_306963 ) ) ( not ( = ?auto_306962 ?auto_306958 ) ) ( not ( = ?auto_306959 ?auto_306958 ) ) ( not ( = ?auto_306957 ?auto_306963 ) ) ( not ( = ?auto_306968 ?auto_306967 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_306961 ?auto_306962 ?auto_306957 ?auto_306958 ?auto_306960 ?auto_306959 )
      ( GET-3IMAGE-VERIFY ?auto_306957 ?auto_306958 ?auto_306960 ?auto_306959 ?auto_306961 ?auto_306962 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_307043 - DIRECTION
      ?auto_307044 - MODE
    )
    :vars
    (
      ?auto_307045 - INSTRUMENT
      ?auto_307046 - SATELLITE
      ?auto_307047 - DIRECTION
      ?auto_307048 - DIRECTION
      ?auto_307049 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_307045 ?auto_307046 ) ( SUPPORTS ?auto_307045 ?auto_307044 ) ( not ( = ?auto_307043 ?auto_307047 ) ) ( CALIBRATION_TARGET ?auto_307045 ?auto_307047 ) ( POINTING ?auto_307046 ?auto_307048 ) ( not ( = ?auto_307047 ?auto_307048 ) ) ( ON_BOARD ?auto_307049 ?auto_307046 ) ( POWER_ON ?auto_307049 ) ( not ( = ?auto_307043 ?auto_307048 ) ) ( not ( = ?auto_307045 ?auto_307049 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_307049 ?auto_307046 )
      ( !TURN_TO ?auto_307046 ?auto_307047 ?auto_307048 )
      ( !SWITCH_ON ?auto_307045 ?auto_307046 )
      ( !CALIBRATE ?auto_307046 ?auto_307045 ?auto_307047 )
      ( !TURN_TO ?auto_307046 ?auto_307043 ?auto_307047 )
      ( !TAKE_IMAGE ?auto_307046 ?auto_307043 ?auto_307045 ?auto_307044 )
      ( GET-1IMAGE-VERIFY ?auto_307043 ?auto_307044 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_308609 - DIRECTION
      ?auto_308610 - MODE
      ?auto_308612 - DIRECTION
      ?auto_308611 - MODE
      ?auto_308613 - DIRECTION
      ?auto_308614 - MODE
      ?auto_308615 - DIRECTION
      ?auto_308616 - MODE
    )
    :vars
    (
      ?auto_308619 - INSTRUMENT
      ?auto_308618 - SATELLITE
      ?auto_308617 - DIRECTION
      ?auto_308620 - INSTRUMENT
      ?auto_308622 - INSTRUMENT
      ?auto_308623 - INSTRUMENT
      ?auto_308621 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_308612 ?auto_308609 ) ) ( not ( = ?auto_308613 ?auto_308609 ) ) ( not ( = ?auto_308613 ?auto_308612 ) ) ( not ( = ?auto_308615 ?auto_308609 ) ) ( not ( = ?auto_308615 ?auto_308612 ) ) ( not ( = ?auto_308615 ?auto_308613 ) ) ( ON_BOARD ?auto_308619 ?auto_308618 ) ( SUPPORTS ?auto_308619 ?auto_308616 ) ( not ( = ?auto_308615 ?auto_308617 ) ) ( CALIBRATION_TARGET ?auto_308619 ?auto_308617 ) ( not ( = ?auto_308617 ?auto_308613 ) ) ( ON_BOARD ?auto_308620 ?auto_308618 ) ( not ( = ?auto_308619 ?auto_308620 ) ) ( SUPPORTS ?auto_308620 ?auto_308614 ) ( CALIBRATION_TARGET ?auto_308620 ?auto_308617 ) ( not ( = ?auto_308617 ?auto_308612 ) ) ( ON_BOARD ?auto_308622 ?auto_308618 ) ( not ( = ?auto_308620 ?auto_308622 ) ) ( SUPPORTS ?auto_308622 ?auto_308611 ) ( CALIBRATION_TARGET ?auto_308622 ?auto_308617 ) ( not ( = ?auto_308617 ?auto_308609 ) ) ( ON_BOARD ?auto_308623 ?auto_308618 ) ( not ( = ?auto_308622 ?auto_308623 ) ) ( SUPPORTS ?auto_308623 ?auto_308610 ) ( CALIBRATION_TARGET ?auto_308623 ?auto_308617 ) ( POWER_AVAIL ?auto_308618 ) ( POINTING ?auto_308618 ?auto_308621 ) ( not ( = ?auto_308617 ?auto_308621 ) ) ( not ( = ?auto_308609 ?auto_308621 ) ) ( not ( = ?auto_308610 ?auto_308611 ) ) ( not ( = ?auto_308612 ?auto_308621 ) ) ( not ( = ?auto_308610 ?auto_308614 ) ) ( not ( = ?auto_308611 ?auto_308614 ) ) ( not ( = ?auto_308613 ?auto_308621 ) ) ( not ( = ?auto_308620 ?auto_308623 ) ) ( not ( = ?auto_308610 ?auto_308616 ) ) ( not ( = ?auto_308611 ?auto_308616 ) ) ( not ( = ?auto_308614 ?auto_308616 ) ) ( not ( = ?auto_308615 ?auto_308621 ) ) ( not ( = ?auto_308619 ?auto_308622 ) ) ( not ( = ?auto_308619 ?auto_308623 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_308609 ?auto_308610 ?auto_308613 ?auto_308614 ?auto_308612 ?auto_308611 )
      ( GET-1IMAGE ?auto_308615 ?auto_308616 )
      ( GET-4IMAGE-VERIFY ?auto_308609 ?auto_308610 ?auto_308612 ?auto_308611 ?auto_308613 ?auto_308614 ?auto_308615 ?auto_308616 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_308658 - DIRECTION
      ?auto_308659 - MODE
      ?auto_308661 - DIRECTION
      ?auto_308660 - MODE
      ?auto_308662 - DIRECTION
      ?auto_308663 - MODE
      ?auto_308664 - DIRECTION
      ?auto_308665 - MODE
    )
    :vars
    (
      ?auto_308669 - INSTRUMENT
      ?auto_308671 - SATELLITE
      ?auto_308672 - DIRECTION
      ?auto_308667 - INSTRUMENT
      ?auto_308666 - INSTRUMENT
      ?auto_308670 - INSTRUMENT
      ?auto_308668 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_308661 ?auto_308658 ) ) ( not ( = ?auto_308662 ?auto_308658 ) ) ( not ( = ?auto_308662 ?auto_308661 ) ) ( not ( = ?auto_308664 ?auto_308658 ) ) ( not ( = ?auto_308664 ?auto_308661 ) ) ( not ( = ?auto_308664 ?auto_308662 ) ) ( ON_BOARD ?auto_308669 ?auto_308671 ) ( SUPPORTS ?auto_308669 ?auto_308663 ) ( not ( = ?auto_308662 ?auto_308672 ) ) ( CALIBRATION_TARGET ?auto_308669 ?auto_308672 ) ( not ( = ?auto_308672 ?auto_308664 ) ) ( ON_BOARD ?auto_308667 ?auto_308671 ) ( not ( = ?auto_308669 ?auto_308667 ) ) ( SUPPORTS ?auto_308667 ?auto_308665 ) ( CALIBRATION_TARGET ?auto_308667 ?auto_308672 ) ( not ( = ?auto_308672 ?auto_308661 ) ) ( ON_BOARD ?auto_308666 ?auto_308671 ) ( not ( = ?auto_308667 ?auto_308666 ) ) ( SUPPORTS ?auto_308666 ?auto_308660 ) ( CALIBRATION_TARGET ?auto_308666 ?auto_308672 ) ( not ( = ?auto_308672 ?auto_308658 ) ) ( ON_BOARD ?auto_308670 ?auto_308671 ) ( not ( = ?auto_308666 ?auto_308670 ) ) ( SUPPORTS ?auto_308670 ?auto_308659 ) ( CALIBRATION_TARGET ?auto_308670 ?auto_308672 ) ( POWER_AVAIL ?auto_308671 ) ( POINTING ?auto_308671 ?auto_308668 ) ( not ( = ?auto_308672 ?auto_308668 ) ) ( not ( = ?auto_308658 ?auto_308668 ) ) ( not ( = ?auto_308659 ?auto_308660 ) ) ( not ( = ?auto_308661 ?auto_308668 ) ) ( not ( = ?auto_308659 ?auto_308665 ) ) ( not ( = ?auto_308660 ?auto_308665 ) ) ( not ( = ?auto_308664 ?auto_308668 ) ) ( not ( = ?auto_308667 ?auto_308670 ) ) ( not ( = ?auto_308659 ?auto_308663 ) ) ( not ( = ?auto_308660 ?auto_308663 ) ) ( not ( = ?auto_308665 ?auto_308663 ) ) ( not ( = ?auto_308662 ?auto_308668 ) ) ( not ( = ?auto_308669 ?auto_308666 ) ) ( not ( = ?auto_308669 ?auto_308670 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_308658 ?auto_308659 ?auto_308661 ?auto_308660 ?auto_308664 ?auto_308665 ?auto_308662 ?auto_308663 )
      ( GET-4IMAGE-VERIFY ?auto_308658 ?auto_308659 ?auto_308661 ?auto_308660 ?auto_308662 ?auto_308663 ?auto_308664 ?auto_308665 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_308707 - DIRECTION
      ?auto_308708 - MODE
      ?auto_308710 - DIRECTION
      ?auto_308709 - MODE
      ?auto_308711 - DIRECTION
      ?auto_308712 - MODE
      ?auto_308713 - DIRECTION
      ?auto_308714 - MODE
    )
    :vars
    (
      ?auto_308716 - INSTRUMENT
      ?auto_308721 - SATELLITE
      ?auto_308715 - DIRECTION
      ?auto_308719 - INSTRUMENT
      ?auto_308720 - INSTRUMENT
      ?auto_308717 - INSTRUMENT
      ?auto_308718 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_308710 ?auto_308707 ) ) ( not ( = ?auto_308711 ?auto_308707 ) ) ( not ( = ?auto_308711 ?auto_308710 ) ) ( not ( = ?auto_308713 ?auto_308707 ) ) ( not ( = ?auto_308713 ?auto_308710 ) ) ( not ( = ?auto_308713 ?auto_308711 ) ) ( ON_BOARD ?auto_308716 ?auto_308721 ) ( SUPPORTS ?auto_308716 ?auto_308714 ) ( not ( = ?auto_308713 ?auto_308715 ) ) ( CALIBRATION_TARGET ?auto_308716 ?auto_308715 ) ( not ( = ?auto_308715 ?auto_308710 ) ) ( ON_BOARD ?auto_308719 ?auto_308721 ) ( not ( = ?auto_308716 ?auto_308719 ) ) ( SUPPORTS ?auto_308719 ?auto_308709 ) ( CALIBRATION_TARGET ?auto_308719 ?auto_308715 ) ( not ( = ?auto_308715 ?auto_308711 ) ) ( ON_BOARD ?auto_308720 ?auto_308721 ) ( not ( = ?auto_308719 ?auto_308720 ) ) ( SUPPORTS ?auto_308720 ?auto_308712 ) ( CALIBRATION_TARGET ?auto_308720 ?auto_308715 ) ( not ( = ?auto_308715 ?auto_308707 ) ) ( ON_BOARD ?auto_308717 ?auto_308721 ) ( not ( = ?auto_308720 ?auto_308717 ) ) ( SUPPORTS ?auto_308717 ?auto_308708 ) ( CALIBRATION_TARGET ?auto_308717 ?auto_308715 ) ( POWER_AVAIL ?auto_308721 ) ( POINTING ?auto_308721 ?auto_308718 ) ( not ( = ?auto_308715 ?auto_308718 ) ) ( not ( = ?auto_308707 ?auto_308718 ) ) ( not ( = ?auto_308708 ?auto_308712 ) ) ( not ( = ?auto_308711 ?auto_308718 ) ) ( not ( = ?auto_308708 ?auto_308709 ) ) ( not ( = ?auto_308712 ?auto_308709 ) ) ( not ( = ?auto_308710 ?auto_308718 ) ) ( not ( = ?auto_308719 ?auto_308717 ) ) ( not ( = ?auto_308708 ?auto_308714 ) ) ( not ( = ?auto_308712 ?auto_308714 ) ) ( not ( = ?auto_308709 ?auto_308714 ) ) ( not ( = ?auto_308713 ?auto_308718 ) ) ( not ( = ?auto_308716 ?auto_308720 ) ) ( not ( = ?auto_308716 ?auto_308717 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_308707 ?auto_308708 ?auto_308711 ?auto_308712 ?auto_308713 ?auto_308714 ?auto_308710 ?auto_308709 )
      ( GET-4IMAGE-VERIFY ?auto_308707 ?auto_308708 ?auto_308710 ?auto_308709 ?auto_308711 ?auto_308712 ?auto_308713 ?auto_308714 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_308756 - DIRECTION
      ?auto_308757 - MODE
      ?auto_308759 - DIRECTION
      ?auto_308758 - MODE
      ?auto_308760 - DIRECTION
      ?auto_308761 - MODE
      ?auto_308762 - DIRECTION
      ?auto_308763 - MODE
    )
    :vars
    (
      ?auto_308765 - INSTRUMENT
      ?auto_308770 - SATELLITE
      ?auto_308764 - DIRECTION
      ?auto_308768 - INSTRUMENT
      ?auto_308769 - INSTRUMENT
      ?auto_308766 - INSTRUMENT
      ?auto_308767 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_308759 ?auto_308756 ) ) ( not ( = ?auto_308760 ?auto_308756 ) ) ( not ( = ?auto_308760 ?auto_308759 ) ) ( not ( = ?auto_308762 ?auto_308756 ) ) ( not ( = ?auto_308762 ?auto_308759 ) ) ( not ( = ?auto_308762 ?auto_308760 ) ) ( ON_BOARD ?auto_308765 ?auto_308770 ) ( SUPPORTS ?auto_308765 ?auto_308761 ) ( not ( = ?auto_308760 ?auto_308764 ) ) ( CALIBRATION_TARGET ?auto_308765 ?auto_308764 ) ( not ( = ?auto_308764 ?auto_308759 ) ) ( ON_BOARD ?auto_308768 ?auto_308770 ) ( not ( = ?auto_308765 ?auto_308768 ) ) ( SUPPORTS ?auto_308768 ?auto_308758 ) ( CALIBRATION_TARGET ?auto_308768 ?auto_308764 ) ( not ( = ?auto_308764 ?auto_308762 ) ) ( ON_BOARD ?auto_308769 ?auto_308770 ) ( not ( = ?auto_308768 ?auto_308769 ) ) ( SUPPORTS ?auto_308769 ?auto_308763 ) ( CALIBRATION_TARGET ?auto_308769 ?auto_308764 ) ( not ( = ?auto_308764 ?auto_308756 ) ) ( ON_BOARD ?auto_308766 ?auto_308770 ) ( not ( = ?auto_308769 ?auto_308766 ) ) ( SUPPORTS ?auto_308766 ?auto_308757 ) ( CALIBRATION_TARGET ?auto_308766 ?auto_308764 ) ( POWER_AVAIL ?auto_308770 ) ( POINTING ?auto_308770 ?auto_308767 ) ( not ( = ?auto_308764 ?auto_308767 ) ) ( not ( = ?auto_308756 ?auto_308767 ) ) ( not ( = ?auto_308757 ?auto_308763 ) ) ( not ( = ?auto_308762 ?auto_308767 ) ) ( not ( = ?auto_308757 ?auto_308758 ) ) ( not ( = ?auto_308763 ?auto_308758 ) ) ( not ( = ?auto_308759 ?auto_308767 ) ) ( not ( = ?auto_308768 ?auto_308766 ) ) ( not ( = ?auto_308757 ?auto_308761 ) ) ( not ( = ?auto_308763 ?auto_308761 ) ) ( not ( = ?auto_308758 ?auto_308761 ) ) ( not ( = ?auto_308760 ?auto_308767 ) ) ( not ( = ?auto_308765 ?auto_308769 ) ) ( not ( = ?auto_308765 ?auto_308766 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_308756 ?auto_308757 ?auto_308762 ?auto_308763 ?auto_308760 ?auto_308761 ?auto_308759 ?auto_308758 )
      ( GET-4IMAGE-VERIFY ?auto_308756 ?auto_308757 ?auto_308759 ?auto_308758 ?auto_308760 ?auto_308761 ?auto_308762 ?auto_308763 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_308911 - DIRECTION
      ?auto_308912 - MODE
      ?auto_308914 - DIRECTION
      ?auto_308913 - MODE
      ?auto_308915 - DIRECTION
      ?auto_308916 - MODE
      ?auto_308917 - DIRECTION
      ?auto_308918 - MODE
    )
    :vars
    (
      ?auto_308920 - INSTRUMENT
      ?auto_308925 - SATELLITE
      ?auto_308919 - DIRECTION
      ?auto_308923 - INSTRUMENT
      ?auto_308924 - INSTRUMENT
      ?auto_308921 - INSTRUMENT
      ?auto_308922 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_308914 ?auto_308911 ) ) ( not ( = ?auto_308915 ?auto_308911 ) ) ( not ( = ?auto_308915 ?auto_308914 ) ) ( not ( = ?auto_308917 ?auto_308911 ) ) ( not ( = ?auto_308917 ?auto_308914 ) ) ( not ( = ?auto_308917 ?auto_308915 ) ) ( ON_BOARD ?auto_308920 ?auto_308925 ) ( SUPPORTS ?auto_308920 ?auto_308913 ) ( not ( = ?auto_308914 ?auto_308919 ) ) ( CALIBRATION_TARGET ?auto_308920 ?auto_308919 ) ( not ( = ?auto_308919 ?auto_308917 ) ) ( ON_BOARD ?auto_308923 ?auto_308925 ) ( not ( = ?auto_308920 ?auto_308923 ) ) ( SUPPORTS ?auto_308923 ?auto_308918 ) ( CALIBRATION_TARGET ?auto_308923 ?auto_308919 ) ( not ( = ?auto_308919 ?auto_308915 ) ) ( ON_BOARD ?auto_308924 ?auto_308925 ) ( not ( = ?auto_308923 ?auto_308924 ) ) ( SUPPORTS ?auto_308924 ?auto_308916 ) ( CALIBRATION_TARGET ?auto_308924 ?auto_308919 ) ( not ( = ?auto_308919 ?auto_308911 ) ) ( ON_BOARD ?auto_308921 ?auto_308925 ) ( not ( = ?auto_308924 ?auto_308921 ) ) ( SUPPORTS ?auto_308921 ?auto_308912 ) ( CALIBRATION_TARGET ?auto_308921 ?auto_308919 ) ( POWER_AVAIL ?auto_308925 ) ( POINTING ?auto_308925 ?auto_308922 ) ( not ( = ?auto_308919 ?auto_308922 ) ) ( not ( = ?auto_308911 ?auto_308922 ) ) ( not ( = ?auto_308912 ?auto_308916 ) ) ( not ( = ?auto_308915 ?auto_308922 ) ) ( not ( = ?auto_308912 ?auto_308918 ) ) ( not ( = ?auto_308916 ?auto_308918 ) ) ( not ( = ?auto_308917 ?auto_308922 ) ) ( not ( = ?auto_308923 ?auto_308921 ) ) ( not ( = ?auto_308912 ?auto_308913 ) ) ( not ( = ?auto_308916 ?auto_308913 ) ) ( not ( = ?auto_308918 ?auto_308913 ) ) ( not ( = ?auto_308914 ?auto_308922 ) ) ( not ( = ?auto_308920 ?auto_308924 ) ) ( not ( = ?auto_308920 ?auto_308921 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_308911 ?auto_308912 ?auto_308915 ?auto_308916 ?auto_308914 ?auto_308913 ?auto_308917 ?auto_308918 )
      ( GET-4IMAGE-VERIFY ?auto_308911 ?auto_308912 ?auto_308914 ?auto_308913 ?auto_308915 ?auto_308916 ?auto_308917 ?auto_308918 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_308960 - DIRECTION
      ?auto_308961 - MODE
      ?auto_308963 - DIRECTION
      ?auto_308962 - MODE
      ?auto_308964 - DIRECTION
      ?auto_308965 - MODE
      ?auto_308966 - DIRECTION
      ?auto_308967 - MODE
    )
    :vars
    (
      ?auto_308969 - INSTRUMENT
      ?auto_308974 - SATELLITE
      ?auto_308968 - DIRECTION
      ?auto_308972 - INSTRUMENT
      ?auto_308973 - INSTRUMENT
      ?auto_308970 - INSTRUMENT
      ?auto_308971 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_308963 ?auto_308960 ) ) ( not ( = ?auto_308964 ?auto_308960 ) ) ( not ( = ?auto_308964 ?auto_308963 ) ) ( not ( = ?auto_308966 ?auto_308960 ) ) ( not ( = ?auto_308966 ?auto_308963 ) ) ( not ( = ?auto_308966 ?auto_308964 ) ) ( ON_BOARD ?auto_308969 ?auto_308974 ) ( SUPPORTS ?auto_308969 ?auto_308962 ) ( not ( = ?auto_308963 ?auto_308968 ) ) ( CALIBRATION_TARGET ?auto_308969 ?auto_308968 ) ( not ( = ?auto_308968 ?auto_308964 ) ) ( ON_BOARD ?auto_308972 ?auto_308974 ) ( not ( = ?auto_308969 ?auto_308972 ) ) ( SUPPORTS ?auto_308972 ?auto_308965 ) ( CALIBRATION_TARGET ?auto_308972 ?auto_308968 ) ( not ( = ?auto_308968 ?auto_308966 ) ) ( ON_BOARD ?auto_308973 ?auto_308974 ) ( not ( = ?auto_308972 ?auto_308973 ) ) ( SUPPORTS ?auto_308973 ?auto_308967 ) ( CALIBRATION_TARGET ?auto_308973 ?auto_308968 ) ( not ( = ?auto_308968 ?auto_308960 ) ) ( ON_BOARD ?auto_308970 ?auto_308974 ) ( not ( = ?auto_308973 ?auto_308970 ) ) ( SUPPORTS ?auto_308970 ?auto_308961 ) ( CALIBRATION_TARGET ?auto_308970 ?auto_308968 ) ( POWER_AVAIL ?auto_308974 ) ( POINTING ?auto_308974 ?auto_308971 ) ( not ( = ?auto_308968 ?auto_308971 ) ) ( not ( = ?auto_308960 ?auto_308971 ) ) ( not ( = ?auto_308961 ?auto_308967 ) ) ( not ( = ?auto_308966 ?auto_308971 ) ) ( not ( = ?auto_308961 ?auto_308965 ) ) ( not ( = ?auto_308967 ?auto_308965 ) ) ( not ( = ?auto_308964 ?auto_308971 ) ) ( not ( = ?auto_308972 ?auto_308970 ) ) ( not ( = ?auto_308961 ?auto_308962 ) ) ( not ( = ?auto_308967 ?auto_308962 ) ) ( not ( = ?auto_308965 ?auto_308962 ) ) ( not ( = ?auto_308963 ?auto_308971 ) ) ( not ( = ?auto_308969 ?auto_308973 ) ) ( not ( = ?auto_308969 ?auto_308970 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_308960 ?auto_308961 ?auto_308966 ?auto_308967 ?auto_308963 ?auto_308962 ?auto_308964 ?auto_308965 )
      ( GET-4IMAGE-VERIFY ?auto_308960 ?auto_308961 ?auto_308963 ?auto_308962 ?auto_308964 ?auto_308965 ?auto_308966 ?auto_308967 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309115 - DIRECTION
      ?auto_309116 - MODE
      ?auto_309118 - DIRECTION
      ?auto_309117 - MODE
      ?auto_309119 - DIRECTION
      ?auto_309120 - MODE
      ?auto_309121 - DIRECTION
      ?auto_309122 - MODE
    )
    :vars
    (
      ?auto_309124 - INSTRUMENT
      ?auto_309129 - SATELLITE
      ?auto_309123 - DIRECTION
      ?auto_309127 - INSTRUMENT
      ?auto_309128 - INSTRUMENT
      ?auto_309125 - INSTRUMENT
      ?auto_309126 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_309118 ?auto_309115 ) ) ( not ( = ?auto_309119 ?auto_309115 ) ) ( not ( = ?auto_309119 ?auto_309118 ) ) ( not ( = ?auto_309121 ?auto_309115 ) ) ( not ( = ?auto_309121 ?auto_309118 ) ) ( not ( = ?auto_309121 ?auto_309119 ) ) ( ON_BOARD ?auto_309124 ?auto_309129 ) ( SUPPORTS ?auto_309124 ?auto_309122 ) ( not ( = ?auto_309121 ?auto_309123 ) ) ( CALIBRATION_TARGET ?auto_309124 ?auto_309123 ) ( not ( = ?auto_309123 ?auto_309119 ) ) ( ON_BOARD ?auto_309127 ?auto_309129 ) ( not ( = ?auto_309124 ?auto_309127 ) ) ( SUPPORTS ?auto_309127 ?auto_309120 ) ( CALIBRATION_TARGET ?auto_309127 ?auto_309123 ) ( not ( = ?auto_309123 ?auto_309115 ) ) ( ON_BOARD ?auto_309128 ?auto_309129 ) ( not ( = ?auto_309127 ?auto_309128 ) ) ( SUPPORTS ?auto_309128 ?auto_309116 ) ( CALIBRATION_TARGET ?auto_309128 ?auto_309123 ) ( not ( = ?auto_309123 ?auto_309118 ) ) ( ON_BOARD ?auto_309125 ?auto_309129 ) ( not ( = ?auto_309128 ?auto_309125 ) ) ( SUPPORTS ?auto_309125 ?auto_309117 ) ( CALIBRATION_TARGET ?auto_309125 ?auto_309123 ) ( POWER_AVAIL ?auto_309129 ) ( POINTING ?auto_309129 ?auto_309126 ) ( not ( = ?auto_309123 ?auto_309126 ) ) ( not ( = ?auto_309118 ?auto_309126 ) ) ( not ( = ?auto_309117 ?auto_309116 ) ) ( not ( = ?auto_309115 ?auto_309126 ) ) ( not ( = ?auto_309117 ?auto_309120 ) ) ( not ( = ?auto_309116 ?auto_309120 ) ) ( not ( = ?auto_309119 ?auto_309126 ) ) ( not ( = ?auto_309127 ?auto_309125 ) ) ( not ( = ?auto_309117 ?auto_309122 ) ) ( not ( = ?auto_309116 ?auto_309122 ) ) ( not ( = ?auto_309120 ?auto_309122 ) ) ( not ( = ?auto_309121 ?auto_309126 ) ) ( not ( = ?auto_309124 ?auto_309128 ) ) ( not ( = ?auto_309124 ?auto_309125 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_309118 ?auto_309117 ?auto_309115 ?auto_309116 ?auto_309121 ?auto_309122 ?auto_309119 ?auto_309120 )
      ( GET-4IMAGE-VERIFY ?auto_309115 ?auto_309116 ?auto_309118 ?auto_309117 ?auto_309119 ?auto_309120 ?auto_309121 ?auto_309122 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309164 - DIRECTION
      ?auto_309165 - MODE
      ?auto_309167 - DIRECTION
      ?auto_309166 - MODE
      ?auto_309168 - DIRECTION
      ?auto_309169 - MODE
      ?auto_309170 - DIRECTION
      ?auto_309171 - MODE
    )
    :vars
    (
      ?auto_309173 - INSTRUMENT
      ?auto_309178 - SATELLITE
      ?auto_309172 - DIRECTION
      ?auto_309176 - INSTRUMENT
      ?auto_309177 - INSTRUMENT
      ?auto_309174 - INSTRUMENT
      ?auto_309175 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_309167 ?auto_309164 ) ) ( not ( = ?auto_309168 ?auto_309164 ) ) ( not ( = ?auto_309168 ?auto_309167 ) ) ( not ( = ?auto_309170 ?auto_309164 ) ) ( not ( = ?auto_309170 ?auto_309167 ) ) ( not ( = ?auto_309170 ?auto_309168 ) ) ( ON_BOARD ?auto_309173 ?auto_309178 ) ( SUPPORTS ?auto_309173 ?auto_309169 ) ( not ( = ?auto_309168 ?auto_309172 ) ) ( CALIBRATION_TARGET ?auto_309173 ?auto_309172 ) ( not ( = ?auto_309172 ?auto_309170 ) ) ( ON_BOARD ?auto_309176 ?auto_309178 ) ( not ( = ?auto_309173 ?auto_309176 ) ) ( SUPPORTS ?auto_309176 ?auto_309171 ) ( CALIBRATION_TARGET ?auto_309176 ?auto_309172 ) ( not ( = ?auto_309172 ?auto_309164 ) ) ( ON_BOARD ?auto_309177 ?auto_309178 ) ( not ( = ?auto_309176 ?auto_309177 ) ) ( SUPPORTS ?auto_309177 ?auto_309165 ) ( CALIBRATION_TARGET ?auto_309177 ?auto_309172 ) ( not ( = ?auto_309172 ?auto_309167 ) ) ( ON_BOARD ?auto_309174 ?auto_309178 ) ( not ( = ?auto_309177 ?auto_309174 ) ) ( SUPPORTS ?auto_309174 ?auto_309166 ) ( CALIBRATION_TARGET ?auto_309174 ?auto_309172 ) ( POWER_AVAIL ?auto_309178 ) ( POINTING ?auto_309178 ?auto_309175 ) ( not ( = ?auto_309172 ?auto_309175 ) ) ( not ( = ?auto_309167 ?auto_309175 ) ) ( not ( = ?auto_309166 ?auto_309165 ) ) ( not ( = ?auto_309164 ?auto_309175 ) ) ( not ( = ?auto_309166 ?auto_309171 ) ) ( not ( = ?auto_309165 ?auto_309171 ) ) ( not ( = ?auto_309170 ?auto_309175 ) ) ( not ( = ?auto_309176 ?auto_309174 ) ) ( not ( = ?auto_309166 ?auto_309169 ) ) ( not ( = ?auto_309165 ?auto_309169 ) ) ( not ( = ?auto_309171 ?auto_309169 ) ) ( not ( = ?auto_309168 ?auto_309175 ) ) ( not ( = ?auto_309173 ?auto_309177 ) ) ( not ( = ?auto_309173 ?auto_309174 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_309167 ?auto_309166 ?auto_309164 ?auto_309165 ?auto_309168 ?auto_309169 ?auto_309170 ?auto_309171 )
      ( GET-4IMAGE-VERIFY ?auto_309164 ?auto_309165 ?auto_309167 ?auto_309166 ?auto_309168 ?auto_309169 ?auto_309170 ?auto_309171 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309321 - DIRECTION
      ?auto_309322 - MODE
      ?auto_309324 - DIRECTION
      ?auto_309323 - MODE
      ?auto_309325 - DIRECTION
      ?auto_309326 - MODE
      ?auto_309327 - DIRECTION
      ?auto_309328 - MODE
    )
    :vars
    (
      ?auto_309330 - INSTRUMENT
      ?auto_309335 - SATELLITE
      ?auto_309329 - DIRECTION
      ?auto_309333 - INSTRUMENT
      ?auto_309334 - INSTRUMENT
      ?auto_309331 - INSTRUMENT
      ?auto_309332 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_309324 ?auto_309321 ) ) ( not ( = ?auto_309325 ?auto_309321 ) ) ( not ( = ?auto_309325 ?auto_309324 ) ) ( not ( = ?auto_309327 ?auto_309321 ) ) ( not ( = ?auto_309327 ?auto_309324 ) ) ( not ( = ?auto_309327 ?auto_309325 ) ) ( ON_BOARD ?auto_309330 ?auto_309335 ) ( SUPPORTS ?auto_309330 ?auto_309328 ) ( not ( = ?auto_309327 ?auto_309329 ) ) ( CALIBRATION_TARGET ?auto_309330 ?auto_309329 ) ( not ( = ?auto_309329 ?auto_309324 ) ) ( ON_BOARD ?auto_309333 ?auto_309335 ) ( not ( = ?auto_309330 ?auto_309333 ) ) ( SUPPORTS ?auto_309333 ?auto_309323 ) ( CALIBRATION_TARGET ?auto_309333 ?auto_309329 ) ( not ( = ?auto_309329 ?auto_309321 ) ) ( ON_BOARD ?auto_309334 ?auto_309335 ) ( not ( = ?auto_309333 ?auto_309334 ) ) ( SUPPORTS ?auto_309334 ?auto_309322 ) ( CALIBRATION_TARGET ?auto_309334 ?auto_309329 ) ( not ( = ?auto_309329 ?auto_309325 ) ) ( ON_BOARD ?auto_309331 ?auto_309335 ) ( not ( = ?auto_309334 ?auto_309331 ) ) ( SUPPORTS ?auto_309331 ?auto_309326 ) ( CALIBRATION_TARGET ?auto_309331 ?auto_309329 ) ( POWER_AVAIL ?auto_309335 ) ( POINTING ?auto_309335 ?auto_309332 ) ( not ( = ?auto_309329 ?auto_309332 ) ) ( not ( = ?auto_309325 ?auto_309332 ) ) ( not ( = ?auto_309326 ?auto_309322 ) ) ( not ( = ?auto_309321 ?auto_309332 ) ) ( not ( = ?auto_309326 ?auto_309323 ) ) ( not ( = ?auto_309322 ?auto_309323 ) ) ( not ( = ?auto_309324 ?auto_309332 ) ) ( not ( = ?auto_309333 ?auto_309331 ) ) ( not ( = ?auto_309326 ?auto_309328 ) ) ( not ( = ?auto_309322 ?auto_309328 ) ) ( not ( = ?auto_309323 ?auto_309328 ) ) ( not ( = ?auto_309327 ?auto_309332 ) ) ( not ( = ?auto_309330 ?auto_309334 ) ) ( not ( = ?auto_309330 ?auto_309331 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_309325 ?auto_309326 ?auto_309321 ?auto_309322 ?auto_309327 ?auto_309328 ?auto_309324 ?auto_309323 )
      ( GET-4IMAGE-VERIFY ?auto_309321 ?auto_309322 ?auto_309324 ?auto_309323 ?auto_309325 ?auto_309326 ?auto_309327 ?auto_309328 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309370 - DIRECTION
      ?auto_309371 - MODE
      ?auto_309373 - DIRECTION
      ?auto_309372 - MODE
      ?auto_309374 - DIRECTION
      ?auto_309375 - MODE
      ?auto_309376 - DIRECTION
      ?auto_309377 - MODE
    )
    :vars
    (
      ?auto_309379 - INSTRUMENT
      ?auto_309384 - SATELLITE
      ?auto_309378 - DIRECTION
      ?auto_309382 - INSTRUMENT
      ?auto_309383 - INSTRUMENT
      ?auto_309380 - INSTRUMENT
      ?auto_309381 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_309373 ?auto_309370 ) ) ( not ( = ?auto_309374 ?auto_309370 ) ) ( not ( = ?auto_309374 ?auto_309373 ) ) ( not ( = ?auto_309376 ?auto_309370 ) ) ( not ( = ?auto_309376 ?auto_309373 ) ) ( not ( = ?auto_309376 ?auto_309374 ) ) ( ON_BOARD ?auto_309379 ?auto_309384 ) ( SUPPORTS ?auto_309379 ?auto_309375 ) ( not ( = ?auto_309374 ?auto_309378 ) ) ( CALIBRATION_TARGET ?auto_309379 ?auto_309378 ) ( not ( = ?auto_309378 ?auto_309373 ) ) ( ON_BOARD ?auto_309382 ?auto_309384 ) ( not ( = ?auto_309379 ?auto_309382 ) ) ( SUPPORTS ?auto_309382 ?auto_309372 ) ( CALIBRATION_TARGET ?auto_309382 ?auto_309378 ) ( not ( = ?auto_309378 ?auto_309370 ) ) ( ON_BOARD ?auto_309383 ?auto_309384 ) ( not ( = ?auto_309382 ?auto_309383 ) ) ( SUPPORTS ?auto_309383 ?auto_309371 ) ( CALIBRATION_TARGET ?auto_309383 ?auto_309378 ) ( not ( = ?auto_309378 ?auto_309376 ) ) ( ON_BOARD ?auto_309380 ?auto_309384 ) ( not ( = ?auto_309383 ?auto_309380 ) ) ( SUPPORTS ?auto_309380 ?auto_309377 ) ( CALIBRATION_TARGET ?auto_309380 ?auto_309378 ) ( POWER_AVAIL ?auto_309384 ) ( POINTING ?auto_309384 ?auto_309381 ) ( not ( = ?auto_309378 ?auto_309381 ) ) ( not ( = ?auto_309376 ?auto_309381 ) ) ( not ( = ?auto_309377 ?auto_309371 ) ) ( not ( = ?auto_309370 ?auto_309381 ) ) ( not ( = ?auto_309377 ?auto_309372 ) ) ( not ( = ?auto_309371 ?auto_309372 ) ) ( not ( = ?auto_309373 ?auto_309381 ) ) ( not ( = ?auto_309382 ?auto_309380 ) ) ( not ( = ?auto_309377 ?auto_309375 ) ) ( not ( = ?auto_309371 ?auto_309375 ) ) ( not ( = ?auto_309372 ?auto_309375 ) ) ( not ( = ?auto_309374 ?auto_309381 ) ) ( not ( = ?auto_309379 ?auto_309383 ) ) ( not ( = ?auto_309379 ?auto_309380 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_309376 ?auto_309377 ?auto_309370 ?auto_309371 ?auto_309374 ?auto_309375 ?auto_309373 ?auto_309372 )
      ( GET-4IMAGE-VERIFY ?auto_309370 ?auto_309371 ?auto_309373 ?auto_309372 ?auto_309374 ?auto_309375 ?auto_309376 ?auto_309377 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309470 - DIRECTION
      ?auto_309471 - MODE
      ?auto_309473 - DIRECTION
      ?auto_309472 - MODE
      ?auto_309474 - DIRECTION
      ?auto_309475 - MODE
      ?auto_309476 - DIRECTION
      ?auto_309477 - MODE
    )
    :vars
    (
      ?auto_309479 - INSTRUMENT
      ?auto_309484 - SATELLITE
      ?auto_309478 - DIRECTION
      ?auto_309482 - INSTRUMENT
      ?auto_309483 - INSTRUMENT
      ?auto_309480 - INSTRUMENT
      ?auto_309481 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_309473 ?auto_309470 ) ) ( not ( = ?auto_309474 ?auto_309470 ) ) ( not ( = ?auto_309474 ?auto_309473 ) ) ( not ( = ?auto_309476 ?auto_309470 ) ) ( not ( = ?auto_309476 ?auto_309473 ) ) ( not ( = ?auto_309476 ?auto_309474 ) ) ( ON_BOARD ?auto_309479 ?auto_309484 ) ( SUPPORTS ?auto_309479 ?auto_309472 ) ( not ( = ?auto_309473 ?auto_309478 ) ) ( CALIBRATION_TARGET ?auto_309479 ?auto_309478 ) ( not ( = ?auto_309478 ?auto_309476 ) ) ( ON_BOARD ?auto_309482 ?auto_309484 ) ( not ( = ?auto_309479 ?auto_309482 ) ) ( SUPPORTS ?auto_309482 ?auto_309477 ) ( CALIBRATION_TARGET ?auto_309482 ?auto_309478 ) ( not ( = ?auto_309478 ?auto_309470 ) ) ( ON_BOARD ?auto_309483 ?auto_309484 ) ( not ( = ?auto_309482 ?auto_309483 ) ) ( SUPPORTS ?auto_309483 ?auto_309471 ) ( CALIBRATION_TARGET ?auto_309483 ?auto_309478 ) ( not ( = ?auto_309478 ?auto_309474 ) ) ( ON_BOARD ?auto_309480 ?auto_309484 ) ( not ( = ?auto_309483 ?auto_309480 ) ) ( SUPPORTS ?auto_309480 ?auto_309475 ) ( CALIBRATION_TARGET ?auto_309480 ?auto_309478 ) ( POWER_AVAIL ?auto_309484 ) ( POINTING ?auto_309484 ?auto_309481 ) ( not ( = ?auto_309478 ?auto_309481 ) ) ( not ( = ?auto_309474 ?auto_309481 ) ) ( not ( = ?auto_309475 ?auto_309471 ) ) ( not ( = ?auto_309470 ?auto_309481 ) ) ( not ( = ?auto_309475 ?auto_309477 ) ) ( not ( = ?auto_309471 ?auto_309477 ) ) ( not ( = ?auto_309476 ?auto_309481 ) ) ( not ( = ?auto_309482 ?auto_309480 ) ) ( not ( = ?auto_309475 ?auto_309472 ) ) ( not ( = ?auto_309471 ?auto_309472 ) ) ( not ( = ?auto_309477 ?auto_309472 ) ) ( not ( = ?auto_309473 ?auto_309481 ) ) ( not ( = ?auto_309479 ?auto_309483 ) ) ( not ( = ?auto_309479 ?auto_309480 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_309474 ?auto_309475 ?auto_309470 ?auto_309471 ?auto_309473 ?auto_309472 ?auto_309476 ?auto_309477 )
      ( GET-4IMAGE-VERIFY ?auto_309470 ?auto_309471 ?auto_309473 ?auto_309472 ?auto_309474 ?auto_309475 ?auto_309476 ?auto_309477 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309574 - DIRECTION
      ?auto_309575 - MODE
      ?auto_309577 - DIRECTION
      ?auto_309576 - MODE
      ?auto_309578 - DIRECTION
      ?auto_309579 - MODE
      ?auto_309580 - DIRECTION
      ?auto_309581 - MODE
    )
    :vars
    (
      ?auto_309583 - INSTRUMENT
      ?auto_309588 - SATELLITE
      ?auto_309582 - DIRECTION
      ?auto_309586 - INSTRUMENT
      ?auto_309587 - INSTRUMENT
      ?auto_309584 - INSTRUMENT
      ?auto_309585 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_309577 ?auto_309574 ) ) ( not ( = ?auto_309578 ?auto_309574 ) ) ( not ( = ?auto_309578 ?auto_309577 ) ) ( not ( = ?auto_309580 ?auto_309574 ) ) ( not ( = ?auto_309580 ?auto_309577 ) ) ( not ( = ?auto_309580 ?auto_309578 ) ) ( ON_BOARD ?auto_309583 ?auto_309588 ) ( SUPPORTS ?auto_309583 ?auto_309576 ) ( not ( = ?auto_309577 ?auto_309582 ) ) ( CALIBRATION_TARGET ?auto_309583 ?auto_309582 ) ( not ( = ?auto_309582 ?auto_309578 ) ) ( ON_BOARD ?auto_309586 ?auto_309588 ) ( not ( = ?auto_309583 ?auto_309586 ) ) ( SUPPORTS ?auto_309586 ?auto_309579 ) ( CALIBRATION_TARGET ?auto_309586 ?auto_309582 ) ( not ( = ?auto_309582 ?auto_309574 ) ) ( ON_BOARD ?auto_309587 ?auto_309588 ) ( not ( = ?auto_309586 ?auto_309587 ) ) ( SUPPORTS ?auto_309587 ?auto_309575 ) ( CALIBRATION_TARGET ?auto_309587 ?auto_309582 ) ( not ( = ?auto_309582 ?auto_309580 ) ) ( ON_BOARD ?auto_309584 ?auto_309588 ) ( not ( = ?auto_309587 ?auto_309584 ) ) ( SUPPORTS ?auto_309584 ?auto_309581 ) ( CALIBRATION_TARGET ?auto_309584 ?auto_309582 ) ( POWER_AVAIL ?auto_309588 ) ( POINTING ?auto_309588 ?auto_309585 ) ( not ( = ?auto_309582 ?auto_309585 ) ) ( not ( = ?auto_309580 ?auto_309585 ) ) ( not ( = ?auto_309581 ?auto_309575 ) ) ( not ( = ?auto_309574 ?auto_309585 ) ) ( not ( = ?auto_309581 ?auto_309579 ) ) ( not ( = ?auto_309575 ?auto_309579 ) ) ( not ( = ?auto_309578 ?auto_309585 ) ) ( not ( = ?auto_309586 ?auto_309584 ) ) ( not ( = ?auto_309581 ?auto_309576 ) ) ( not ( = ?auto_309575 ?auto_309576 ) ) ( not ( = ?auto_309579 ?auto_309576 ) ) ( not ( = ?auto_309577 ?auto_309585 ) ) ( not ( = ?auto_309583 ?auto_309587 ) ) ( not ( = ?auto_309583 ?auto_309584 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_309580 ?auto_309581 ?auto_309574 ?auto_309575 ?auto_309577 ?auto_309576 ?auto_309578 ?auto_309579 )
      ( GET-4IMAGE-VERIFY ?auto_309574 ?auto_309575 ?auto_309577 ?auto_309576 ?auto_309578 ?auto_309579 ?auto_309580 ?auto_309581 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309729 - DIRECTION
      ?auto_309730 - MODE
      ?auto_309732 - DIRECTION
      ?auto_309731 - MODE
      ?auto_309733 - DIRECTION
      ?auto_309734 - MODE
      ?auto_309735 - DIRECTION
      ?auto_309736 - MODE
    )
    :vars
    (
      ?auto_309738 - INSTRUMENT
      ?auto_309743 - SATELLITE
      ?auto_309737 - DIRECTION
      ?auto_309741 - INSTRUMENT
      ?auto_309742 - INSTRUMENT
      ?auto_309739 - INSTRUMENT
      ?auto_309740 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_309732 ?auto_309729 ) ) ( not ( = ?auto_309733 ?auto_309729 ) ) ( not ( = ?auto_309733 ?auto_309732 ) ) ( not ( = ?auto_309735 ?auto_309729 ) ) ( not ( = ?auto_309735 ?auto_309732 ) ) ( not ( = ?auto_309735 ?auto_309733 ) ) ( ON_BOARD ?auto_309738 ?auto_309743 ) ( SUPPORTS ?auto_309738 ?auto_309736 ) ( not ( = ?auto_309735 ?auto_309737 ) ) ( CALIBRATION_TARGET ?auto_309738 ?auto_309737 ) ( not ( = ?auto_309737 ?auto_309729 ) ) ( ON_BOARD ?auto_309741 ?auto_309743 ) ( not ( = ?auto_309738 ?auto_309741 ) ) ( SUPPORTS ?auto_309741 ?auto_309730 ) ( CALIBRATION_TARGET ?auto_309741 ?auto_309737 ) ( not ( = ?auto_309737 ?auto_309733 ) ) ( ON_BOARD ?auto_309742 ?auto_309743 ) ( not ( = ?auto_309741 ?auto_309742 ) ) ( SUPPORTS ?auto_309742 ?auto_309734 ) ( CALIBRATION_TARGET ?auto_309742 ?auto_309737 ) ( not ( = ?auto_309737 ?auto_309732 ) ) ( ON_BOARD ?auto_309739 ?auto_309743 ) ( not ( = ?auto_309742 ?auto_309739 ) ) ( SUPPORTS ?auto_309739 ?auto_309731 ) ( CALIBRATION_TARGET ?auto_309739 ?auto_309737 ) ( POWER_AVAIL ?auto_309743 ) ( POINTING ?auto_309743 ?auto_309740 ) ( not ( = ?auto_309737 ?auto_309740 ) ) ( not ( = ?auto_309732 ?auto_309740 ) ) ( not ( = ?auto_309731 ?auto_309734 ) ) ( not ( = ?auto_309733 ?auto_309740 ) ) ( not ( = ?auto_309731 ?auto_309730 ) ) ( not ( = ?auto_309734 ?auto_309730 ) ) ( not ( = ?auto_309729 ?auto_309740 ) ) ( not ( = ?auto_309741 ?auto_309739 ) ) ( not ( = ?auto_309731 ?auto_309736 ) ) ( not ( = ?auto_309734 ?auto_309736 ) ) ( not ( = ?auto_309730 ?auto_309736 ) ) ( not ( = ?auto_309735 ?auto_309740 ) ) ( not ( = ?auto_309738 ?auto_309742 ) ) ( not ( = ?auto_309738 ?auto_309739 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_309732 ?auto_309731 ?auto_309733 ?auto_309734 ?auto_309735 ?auto_309736 ?auto_309729 ?auto_309730 )
      ( GET-4IMAGE-VERIFY ?auto_309729 ?auto_309730 ?auto_309732 ?auto_309731 ?auto_309733 ?auto_309734 ?auto_309735 ?auto_309736 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309778 - DIRECTION
      ?auto_309779 - MODE
      ?auto_309781 - DIRECTION
      ?auto_309780 - MODE
      ?auto_309782 - DIRECTION
      ?auto_309783 - MODE
      ?auto_309784 - DIRECTION
      ?auto_309785 - MODE
    )
    :vars
    (
      ?auto_309787 - INSTRUMENT
      ?auto_309792 - SATELLITE
      ?auto_309786 - DIRECTION
      ?auto_309790 - INSTRUMENT
      ?auto_309791 - INSTRUMENT
      ?auto_309788 - INSTRUMENT
      ?auto_309789 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_309781 ?auto_309778 ) ) ( not ( = ?auto_309782 ?auto_309778 ) ) ( not ( = ?auto_309782 ?auto_309781 ) ) ( not ( = ?auto_309784 ?auto_309778 ) ) ( not ( = ?auto_309784 ?auto_309781 ) ) ( not ( = ?auto_309784 ?auto_309782 ) ) ( ON_BOARD ?auto_309787 ?auto_309792 ) ( SUPPORTS ?auto_309787 ?auto_309783 ) ( not ( = ?auto_309782 ?auto_309786 ) ) ( CALIBRATION_TARGET ?auto_309787 ?auto_309786 ) ( not ( = ?auto_309786 ?auto_309778 ) ) ( ON_BOARD ?auto_309790 ?auto_309792 ) ( not ( = ?auto_309787 ?auto_309790 ) ) ( SUPPORTS ?auto_309790 ?auto_309779 ) ( CALIBRATION_TARGET ?auto_309790 ?auto_309786 ) ( not ( = ?auto_309786 ?auto_309784 ) ) ( ON_BOARD ?auto_309791 ?auto_309792 ) ( not ( = ?auto_309790 ?auto_309791 ) ) ( SUPPORTS ?auto_309791 ?auto_309785 ) ( CALIBRATION_TARGET ?auto_309791 ?auto_309786 ) ( not ( = ?auto_309786 ?auto_309781 ) ) ( ON_BOARD ?auto_309788 ?auto_309792 ) ( not ( = ?auto_309791 ?auto_309788 ) ) ( SUPPORTS ?auto_309788 ?auto_309780 ) ( CALIBRATION_TARGET ?auto_309788 ?auto_309786 ) ( POWER_AVAIL ?auto_309792 ) ( POINTING ?auto_309792 ?auto_309789 ) ( not ( = ?auto_309786 ?auto_309789 ) ) ( not ( = ?auto_309781 ?auto_309789 ) ) ( not ( = ?auto_309780 ?auto_309785 ) ) ( not ( = ?auto_309784 ?auto_309789 ) ) ( not ( = ?auto_309780 ?auto_309779 ) ) ( not ( = ?auto_309785 ?auto_309779 ) ) ( not ( = ?auto_309778 ?auto_309789 ) ) ( not ( = ?auto_309790 ?auto_309788 ) ) ( not ( = ?auto_309780 ?auto_309783 ) ) ( not ( = ?auto_309785 ?auto_309783 ) ) ( not ( = ?auto_309779 ?auto_309783 ) ) ( not ( = ?auto_309782 ?auto_309789 ) ) ( not ( = ?auto_309787 ?auto_309791 ) ) ( not ( = ?auto_309787 ?auto_309788 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_309781 ?auto_309780 ?auto_309784 ?auto_309785 ?auto_309782 ?auto_309783 ?auto_309778 ?auto_309779 )
      ( GET-4IMAGE-VERIFY ?auto_309778 ?auto_309779 ?auto_309781 ?auto_309780 ?auto_309782 ?auto_309783 ?auto_309784 ?auto_309785 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309827 - DIRECTION
      ?auto_309828 - MODE
      ?auto_309830 - DIRECTION
      ?auto_309829 - MODE
      ?auto_309831 - DIRECTION
      ?auto_309832 - MODE
      ?auto_309833 - DIRECTION
      ?auto_309834 - MODE
    )
    :vars
    (
      ?auto_309836 - INSTRUMENT
      ?auto_309841 - SATELLITE
      ?auto_309835 - DIRECTION
      ?auto_309839 - INSTRUMENT
      ?auto_309840 - INSTRUMENT
      ?auto_309837 - INSTRUMENT
      ?auto_309838 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_309830 ?auto_309827 ) ) ( not ( = ?auto_309831 ?auto_309827 ) ) ( not ( = ?auto_309831 ?auto_309830 ) ) ( not ( = ?auto_309833 ?auto_309827 ) ) ( not ( = ?auto_309833 ?auto_309830 ) ) ( not ( = ?auto_309833 ?auto_309831 ) ) ( ON_BOARD ?auto_309836 ?auto_309841 ) ( SUPPORTS ?auto_309836 ?auto_309834 ) ( not ( = ?auto_309833 ?auto_309835 ) ) ( CALIBRATION_TARGET ?auto_309836 ?auto_309835 ) ( not ( = ?auto_309835 ?auto_309827 ) ) ( ON_BOARD ?auto_309839 ?auto_309841 ) ( not ( = ?auto_309836 ?auto_309839 ) ) ( SUPPORTS ?auto_309839 ?auto_309828 ) ( CALIBRATION_TARGET ?auto_309839 ?auto_309835 ) ( not ( = ?auto_309835 ?auto_309830 ) ) ( ON_BOARD ?auto_309840 ?auto_309841 ) ( not ( = ?auto_309839 ?auto_309840 ) ) ( SUPPORTS ?auto_309840 ?auto_309829 ) ( CALIBRATION_TARGET ?auto_309840 ?auto_309835 ) ( not ( = ?auto_309835 ?auto_309831 ) ) ( ON_BOARD ?auto_309837 ?auto_309841 ) ( not ( = ?auto_309840 ?auto_309837 ) ) ( SUPPORTS ?auto_309837 ?auto_309832 ) ( CALIBRATION_TARGET ?auto_309837 ?auto_309835 ) ( POWER_AVAIL ?auto_309841 ) ( POINTING ?auto_309841 ?auto_309838 ) ( not ( = ?auto_309835 ?auto_309838 ) ) ( not ( = ?auto_309831 ?auto_309838 ) ) ( not ( = ?auto_309832 ?auto_309829 ) ) ( not ( = ?auto_309830 ?auto_309838 ) ) ( not ( = ?auto_309832 ?auto_309828 ) ) ( not ( = ?auto_309829 ?auto_309828 ) ) ( not ( = ?auto_309827 ?auto_309838 ) ) ( not ( = ?auto_309839 ?auto_309837 ) ) ( not ( = ?auto_309832 ?auto_309834 ) ) ( not ( = ?auto_309829 ?auto_309834 ) ) ( not ( = ?auto_309828 ?auto_309834 ) ) ( not ( = ?auto_309833 ?auto_309838 ) ) ( not ( = ?auto_309836 ?auto_309840 ) ) ( not ( = ?auto_309836 ?auto_309837 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_309831 ?auto_309832 ?auto_309830 ?auto_309829 ?auto_309833 ?auto_309834 ?auto_309827 ?auto_309828 )
      ( GET-4IMAGE-VERIFY ?auto_309827 ?auto_309828 ?auto_309830 ?auto_309829 ?auto_309831 ?auto_309832 ?auto_309833 ?auto_309834 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_309876 - DIRECTION
      ?auto_309877 - MODE
      ?auto_309879 - DIRECTION
      ?auto_309878 - MODE
      ?auto_309880 - DIRECTION
      ?auto_309881 - MODE
      ?auto_309882 - DIRECTION
      ?auto_309883 - MODE
    )
    :vars
    (
      ?auto_309885 - INSTRUMENT
      ?auto_309890 - SATELLITE
      ?auto_309884 - DIRECTION
      ?auto_309888 - INSTRUMENT
      ?auto_309889 - INSTRUMENT
      ?auto_309886 - INSTRUMENT
      ?auto_309887 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_309879 ?auto_309876 ) ) ( not ( = ?auto_309880 ?auto_309876 ) ) ( not ( = ?auto_309880 ?auto_309879 ) ) ( not ( = ?auto_309882 ?auto_309876 ) ) ( not ( = ?auto_309882 ?auto_309879 ) ) ( not ( = ?auto_309882 ?auto_309880 ) ) ( ON_BOARD ?auto_309885 ?auto_309890 ) ( SUPPORTS ?auto_309885 ?auto_309881 ) ( not ( = ?auto_309880 ?auto_309884 ) ) ( CALIBRATION_TARGET ?auto_309885 ?auto_309884 ) ( not ( = ?auto_309884 ?auto_309876 ) ) ( ON_BOARD ?auto_309888 ?auto_309890 ) ( not ( = ?auto_309885 ?auto_309888 ) ) ( SUPPORTS ?auto_309888 ?auto_309877 ) ( CALIBRATION_TARGET ?auto_309888 ?auto_309884 ) ( not ( = ?auto_309884 ?auto_309879 ) ) ( ON_BOARD ?auto_309889 ?auto_309890 ) ( not ( = ?auto_309888 ?auto_309889 ) ) ( SUPPORTS ?auto_309889 ?auto_309878 ) ( CALIBRATION_TARGET ?auto_309889 ?auto_309884 ) ( not ( = ?auto_309884 ?auto_309882 ) ) ( ON_BOARD ?auto_309886 ?auto_309890 ) ( not ( = ?auto_309889 ?auto_309886 ) ) ( SUPPORTS ?auto_309886 ?auto_309883 ) ( CALIBRATION_TARGET ?auto_309886 ?auto_309884 ) ( POWER_AVAIL ?auto_309890 ) ( POINTING ?auto_309890 ?auto_309887 ) ( not ( = ?auto_309884 ?auto_309887 ) ) ( not ( = ?auto_309882 ?auto_309887 ) ) ( not ( = ?auto_309883 ?auto_309878 ) ) ( not ( = ?auto_309879 ?auto_309887 ) ) ( not ( = ?auto_309883 ?auto_309877 ) ) ( not ( = ?auto_309878 ?auto_309877 ) ) ( not ( = ?auto_309876 ?auto_309887 ) ) ( not ( = ?auto_309888 ?auto_309886 ) ) ( not ( = ?auto_309883 ?auto_309881 ) ) ( not ( = ?auto_309878 ?auto_309881 ) ) ( not ( = ?auto_309877 ?auto_309881 ) ) ( not ( = ?auto_309880 ?auto_309887 ) ) ( not ( = ?auto_309885 ?auto_309889 ) ) ( not ( = ?auto_309885 ?auto_309886 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_309882 ?auto_309883 ?auto_309879 ?auto_309878 ?auto_309880 ?auto_309881 ?auto_309876 ?auto_309877 )
      ( GET-4IMAGE-VERIFY ?auto_309876 ?auto_309877 ?auto_309879 ?auto_309878 ?auto_309880 ?auto_309881 ?auto_309882 ?auto_309883 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310084 - DIRECTION
      ?auto_310085 - MODE
      ?auto_310087 - DIRECTION
      ?auto_310086 - MODE
      ?auto_310088 - DIRECTION
      ?auto_310089 - MODE
      ?auto_310090 - DIRECTION
      ?auto_310091 - MODE
    )
    :vars
    (
      ?auto_310093 - INSTRUMENT
      ?auto_310098 - SATELLITE
      ?auto_310092 - DIRECTION
      ?auto_310096 - INSTRUMENT
      ?auto_310097 - INSTRUMENT
      ?auto_310094 - INSTRUMENT
      ?auto_310095 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_310087 ?auto_310084 ) ) ( not ( = ?auto_310088 ?auto_310084 ) ) ( not ( = ?auto_310088 ?auto_310087 ) ) ( not ( = ?auto_310090 ?auto_310084 ) ) ( not ( = ?auto_310090 ?auto_310087 ) ) ( not ( = ?auto_310090 ?auto_310088 ) ) ( ON_BOARD ?auto_310093 ?auto_310098 ) ( SUPPORTS ?auto_310093 ?auto_310086 ) ( not ( = ?auto_310087 ?auto_310092 ) ) ( CALIBRATION_TARGET ?auto_310093 ?auto_310092 ) ( not ( = ?auto_310092 ?auto_310084 ) ) ( ON_BOARD ?auto_310096 ?auto_310098 ) ( not ( = ?auto_310093 ?auto_310096 ) ) ( SUPPORTS ?auto_310096 ?auto_310085 ) ( CALIBRATION_TARGET ?auto_310096 ?auto_310092 ) ( not ( = ?auto_310092 ?auto_310090 ) ) ( ON_BOARD ?auto_310097 ?auto_310098 ) ( not ( = ?auto_310096 ?auto_310097 ) ) ( SUPPORTS ?auto_310097 ?auto_310091 ) ( CALIBRATION_TARGET ?auto_310097 ?auto_310092 ) ( not ( = ?auto_310092 ?auto_310088 ) ) ( ON_BOARD ?auto_310094 ?auto_310098 ) ( not ( = ?auto_310097 ?auto_310094 ) ) ( SUPPORTS ?auto_310094 ?auto_310089 ) ( CALIBRATION_TARGET ?auto_310094 ?auto_310092 ) ( POWER_AVAIL ?auto_310098 ) ( POINTING ?auto_310098 ?auto_310095 ) ( not ( = ?auto_310092 ?auto_310095 ) ) ( not ( = ?auto_310088 ?auto_310095 ) ) ( not ( = ?auto_310089 ?auto_310091 ) ) ( not ( = ?auto_310090 ?auto_310095 ) ) ( not ( = ?auto_310089 ?auto_310085 ) ) ( not ( = ?auto_310091 ?auto_310085 ) ) ( not ( = ?auto_310084 ?auto_310095 ) ) ( not ( = ?auto_310096 ?auto_310094 ) ) ( not ( = ?auto_310089 ?auto_310086 ) ) ( not ( = ?auto_310091 ?auto_310086 ) ) ( not ( = ?auto_310085 ?auto_310086 ) ) ( not ( = ?auto_310087 ?auto_310095 ) ) ( not ( = ?auto_310093 ?auto_310097 ) ) ( not ( = ?auto_310093 ?auto_310094 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_310088 ?auto_310089 ?auto_310090 ?auto_310091 ?auto_310087 ?auto_310086 ?auto_310084 ?auto_310085 )
      ( GET-4IMAGE-VERIFY ?auto_310084 ?auto_310085 ?auto_310087 ?auto_310086 ?auto_310088 ?auto_310089 ?auto_310090 ?auto_310091 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310133 - DIRECTION
      ?auto_310134 - MODE
      ?auto_310136 - DIRECTION
      ?auto_310135 - MODE
      ?auto_310137 - DIRECTION
      ?auto_310138 - MODE
      ?auto_310139 - DIRECTION
      ?auto_310140 - MODE
    )
    :vars
    (
      ?auto_310142 - INSTRUMENT
      ?auto_310147 - SATELLITE
      ?auto_310141 - DIRECTION
      ?auto_310145 - INSTRUMENT
      ?auto_310146 - INSTRUMENT
      ?auto_310143 - INSTRUMENT
      ?auto_310144 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_310136 ?auto_310133 ) ) ( not ( = ?auto_310137 ?auto_310133 ) ) ( not ( = ?auto_310137 ?auto_310136 ) ) ( not ( = ?auto_310139 ?auto_310133 ) ) ( not ( = ?auto_310139 ?auto_310136 ) ) ( not ( = ?auto_310139 ?auto_310137 ) ) ( ON_BOARD ?auto_310142 ?auto_310147 ) ( SUPPORTS ?auto_310142 ?auto_310135 ) ( not ( = ?auto_310136 ?auto_310141 ) ) ( CALIBRATION_TARGET ?auto_310142 ?auto_310141 ) ( not ( = ?auto_310141 ?auto_310133 ) ) ( ON_BOARD ?auto_310145 ?auto_310147 ) ( not ( = ?auto_310142 ?auto_310145 ) ) ( SUPPORTS ?auto_310145 ?auto_310134 ) ( CALIBRATION_TARGET ?auto_310145 ?auto_310141 ) ( not ( = ?auto_310141 ?auto_310137 ) ) ( ON_BOARD ?auto_310146 ?auto_310147 ) ( not ( = ?auto_310145 ?auto_310146 ) ) ( SUPPORTS ?auto_310146 ?auto_310138 ) ( CALIBRATION_TARGET ?auto_310146 ?auto_310141 ) ( not ( = ?auto_310141 ?auto_310139 ) ) ( ON_BOARD ?auto_310143 ?auto_310147 ) ( not ( = ?auto_310146 ?auto_310143 ) ) ( SUPPORTS ?auto_310143 ?auto_310140 ) ( CALIBRATION_TARGET ?auto_310143 ?auto_310141 ) ( POWER_AVAIL ?auto_310147 ) ( POINTING ?auto_310147 ?auto_310144 ) ( not ( = ?auto_310141 ?auto_310144 ) ) ( not ( = ?auto_310139 ?auto_310144 ) ) ( not ( = ?auto_310140 ?auto_310138 ) ) ( not ( = ?auto_310137 ?auto_310144 ) ) ( not ( = ?auto_310140 ?auto_310134 ) ) ( not ( = ?auto_310138 ?auto_310134 ) ) ( not ( = ?auto_310133 ?auto_310144 ) ) ( not ( = ?auto_310145 ?auto_310143 ) ) ( not ( = ?auto_310140 ?auto_310135 ) ) ( not ( = ?auto_310138 ?auto_310135 ) ) ( not ( = ?auto_310134 ?auto_310135 ) ) ( not ( = ?auto_310136 ?auto_310144 ) ) ( not ( = ?auto_310142 ?auto_310146 ) ) ( not ( = ?auto_310142 ?auto_310143 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_310139 ?auto_310140 ?auto_310137 ?auto_310138 ?auto_310136 ?auto_310135 ?auto_310133 ?auto_310134 )
      ( GET-4IMAGE-VERIFY ?auto_310133 ?auto_310134 ?auto_310136 ?auto_310135 ?auto_310137 ?auto_310138 ?auto_310139 ?auto_310140 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310449 - DIRECTION
      ?auto_310450 - MODE
      ?auto_310452 - DIRECTION
      ?auto_310451 - MODE
      ?auto_310453 - DIRECTION
      ?auto_310454 - MODE
      ?auto_310455 - DIRECTION
      ?auto_310456 - MODE
    )
    :vars
    (
      ?auto_310458 - INSTRUMENT
      ?auto_310463 - SATELLITE
      ?auto_310457 - DIRECTION
      ?auto_310461 - INSTRUMENT
      ?auto_310462 - INSTRUMENT
      ?auto_310459 - INSTRUMENT
      ?auto_310460 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_310452 ?auto_310449 ) ) ( not ( = ?auto_310453 ?auto_310449 ) ) ( not ( = ?auto_310453 ?auto_310452 ) ) ( not ( = ?auto_310455 ?auto_310449 ) ) ( not ( = ?auto_310455 ?auto_310452 ) ) ( not ( = ?auto_310455 ?auto_310453 ) ) ( ON_BOARD ?auto_310458 ?auto_310463 ) ( SUPPORTS ?auto_310458 ?auto_310450 ) ( not ( = ?auto_310449 ?auto_310457 ) ) ( CALIBRATION_TARGET ?auto_310458 ?auto_310457 ) ( not ( = ?auto_310457 ?auto_310455 ) ) ( ON_BOARD ?auto_310461 ?auto_310463 ) ( not ( = ?auto_310458 ?auto_310461 ) ) ( SUPPORTS ?auto_310461 ?auto_310456 ) ( CALIBRATION_TARGET ?auto_310461 ?auto_310457 ) ( not ( = ?auto_310457 ?auto_310453 ) ) ( ON_BOARD ?auto_310462 ?auto_310463 ) ( not ( = ?auto_310461 ?auto_310462 ) ) ( SUPPORTS ?auto_310462 ?auto_310454 ) ( CALIBRATION_TARGET ?auto_310462 ?auto_310457 ) ( not ( = ?auto_310457 ?auto_310452 ) ) ( ON_BOARD ?auto_310459 ?auto_310463 ) ( not ( = ?auto_310462 ?auto_310459 ) ) ( SUPPORTS ?auto_310459 ?auto_310451 ) ( CALIBRATION_TARGET ?auto_310459 ?auto_310457 ) ( POWER_AVAIL ?auto_310463 ) ( POINTING ?auto_310463 ?auto_310460 ) ( not ( = ?auto_310457 ?auto_310460 ) ) ( not ( = ?auto_310452 ?auto_310460 ) ) ( not ( = ?auto_310451 ?auto_310454 ) ) ( not ( = ?auto_310453 ?auto_310460 ) ) ( not ( = ?auto_310451 ?auto_310456 ) ) ( not ( = ?auto_310454 ?auto_310456 ) ) ( not ( = ?auto_310455 ?auto_310460 ) ) ( not ( = ?auto_310461 ?auto_310459 ) ) ( not ( = ?auto_310451 ?auto_310450 ) ) ( not ( = ?auto_310454 ?auto_310450 ) ) ( not ( = ?auto_310456 ?auto_310450 ) ) ( not ( = ?auto_310449 ?auto_310460 ) ) ( not ( = ?auto_310458 ?auto_310462 ) ) ( not ( = ?auto_310458 ?auto_310459 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_310452 ?auto_310451 ?auto_310453 ?auto_310454 ?auto_310449 ?auto_310450 ?auto_310455 ?auto_310456 )
      ( GET-4IMAGE-VERIFY ?auto_310449 ?auto_310450 ?auto_310452 ?auto_310451 ?auto_310453 ?auto_310454 ?auto_310455 ?auto_310456 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310498 - DIRECTION
      ?auto_310499 - MODE
      ?auto_310501 - DIRECTION
      ?auto_310500 - MODE
      ?auto_310502 - DIRECTION
      ?auto_310503 - MODE
      ?auto_310504 - DIRECTION
      ?auto_310505 - MODE
    )
    :vars
    (
      ?auto_310507 - INSTRUMENT
      ?auto_310512 - SATELLITE
      ?auto_310506 - DIRECTION
      ?auto_310510 - INSTRUMENT
      ?auto_310511 - INSTRUMENT
      ?auto_310508 - INSTRUMENT
      ?auto_310509 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_310501 ?auto_310498 ) ) ( not ( = ?auto_310502 ?auto_310498 ) ) ( not ( = ?auto_310502 ?auto_310501 ) ) ( not ( = ?auto_310504 ?auto_310498 ) ) ( not ( = ?auto_310504 ?auto_310501 ) ) ( not ( = ?auto_310504 ?auto_310502 ) ) ( ON_BOARD ?auto_310507 ?auto_310512 ) ( SUPPORTS ?auto_310507 ?auto_310499 ) ( not ( = ?auto_310498 ?auto_310506 ) ) ( CALIBRATION_TARGET ?auto_310507 ?auto_310506 ) ( not ( = ?auto_310506 ?auto_310502 ) ) ( ON_BOARD ?auto_310510 ?auto_310512 ) ( not ( = ?auto_310507 ?auto_310510 ) ) ( SUPPORTS ?auto_310510 ?auto_310503 ) ( CALIBRATION_TARGET ?auto_310510 ?auto_310506 ) ( not ( = ?auto_310506 ?auto_310504 ) ) ( ON_BOARD ?auto_310511 ?auto_310512 ) ( not ( = ?auto_310510 ?auto_310511 ) ) ( SUPPORTS ?auto_310511 ?auto_310505 ) ( CALIBRATION_TARGET ?auto_310511 ?auto_310506 ) ( not ( = ?auto_310506 ?auto_310501 ) ) ( ON_BOARD ?auto_310508 ?auto_310512 ) ( not ( = ?auto_310511 ?auto_310508 ) ) ( SUPPORTS ?auto_310508 ?auto_310500 ) ( CALIBRATION_TARGET ?auto_310508 ?auto_310506 ) ( POWER_AVAIL ?auto_310512 ) ( POINTING ?auto_310512 ?auto_310509 ) ( not ( = ?auto_310506 ?auto_310509 ) ) ( not ( = ?auto_310501 ?auto_310509 ) ) ( not ( = ?auto_310500 ?auto_310505 ) ) ( not ( = ?auto_310504 ?auto_310509 ) ) ( not ( = ?auto_310500 ?auto_310503 ) ) ( not ( = ?auto_310505 ?auto_310503 ) ) ( not ( = ?auto_310502 ?auto_310509 ) ) ( not ( = ?auto_310510 ?auto_310508 ) ) ( not ( = ?auto_310500 ?auto_310499 ) ) ( not ( = ?auto_310505 ?auto_310499 ) ) ( not ( = ?auto_310503 ?auto_310499 ) ) ( not ( = ?auto_310498 ?auto_310509 ) ) ( not ( = ?auto_310507 ?auto_310511 ) ) ( not ( = ?auto_310507 ?auto_310508 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_310501 ?auto_310500 ?auto_310504 ?auto_310505 ?auto_310498 ?auto_310499 ?auto_310502 ?auto_310503 )
      ( GET-4IMAGE-VERIFY ?auto_310498 ?auto_310499 ?auto_310501 ?auto_310500 ?auto_310502 ?auto_310503 ?auto_310504 ?auto_310505 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310653 - DIRECTION
      ?auto_310654 - MODE
      ?auto_310656 - DIRECTION
      ?auto_310655 - MODE
      ?auto_310657 - DIRECTION
      ?auto_310658 - MODE
      ?auto_310659 - DIRECTION
      ?auto_310660 - MODE
    )
    :vars
    (
      ?auto_310662 - INSTRUMENT
      ?auto_310667 - SATELLITE
      ?auto_310661 - DIRECTION
      ?auto_310665 - INSTRUMENT
      ?auto_310666 - INSTRUMENT
      ?auto_310663 - INSTRUMENT
      ?auto_310664 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_310656 ?auto_310653 ) ) ( not ( = ?auto_310657 ?auto_310653 ) ) ( not ( = ?auto_310657 ?auto_310656 ) ) ( not ( = ?auto_310659 ?auto_310653 ) ) ( not ( = ?auto_310659 ?auto_310656 ) ) ( not ( = ?auto_310659 ?auto_310657 ) ) ( ON_BOARD ?auto_310662 ?auto_310667 ) ( SUPPORTS ?auto_310662 ?auto_310654 ) ( not ( = ?auto_310653 ?auto_310661 ) ) ( CALIBRATION_TARGET ?auto_310662 ?auto_310661 ) ( not ( = ?auto_310661 ?auto_310659 ) ) ( ON_BOARD ?auto_310665 ?auto_310667 ) ( not ( = ?auto_310662 ?auto_310665 ) ) ( SUPPORTS ?auto_310665 ?auto_310660 ) ( CALIBRATION_TARGET ?auto_310665 ?auto_310661 ) ( not ( = ?auto_310661 ?auto_310656 ) ) ( ON_BOARD ?auto_310666 ?auto_310667 ) ( not ( = ?auto_310665 ?auto_310666 ) ) ( SUPPORTS ?auto_310666 ?auto_310655 ) ( CALIBRATION_TARGET ?auto_310666 ?auto_310661 ) ( not ( = ?auto_310661 ?auto_310657 ) ) ( ON_BOARD ?auto_310663 ?auto_310667 ) ( not ( = ?auto_310666 ?auto_310663 ) ) ( SUPPORTS ?auto_310663 ?auto_310658 ) ( CALIBRATION_TARGET ?auto_310663 ?auto_310661 ) ( POWER_AVAIL ?auto_310667 ) ( POINTING ?auto_310667 ?auto_310664 ) ( not ( = ?auto_310661 ?auto_310664 ) ) ( not ( = ?auto_310657 ?auto_310664 ) ) ( not ( = ?auto_310658 ?auto_310655 ) ) ( not ( = ?auto_310656 ?auto_310664 ) ) ( not ( = ?auto_310658 ?auto_310660 ) ) ( not ( = ?auto_310655 ?auto_310660 ) ) ( not ( = ?auto_310659 ?auto_310664 ) ) ( not ( = ?auto_310665 ?auto_310663 ) ) ( not ( = ?auto_310658 ?auto_310654 ) ) ( not ( = ?auto_310655 ?auto_310654 ) ) ( not ( = ?auto_310660 ?auto_310654 ) ) ( not ( = ?auto_310653 ?auto_310664 ) ) ( not ( = ?auto_310662 ?auto_310666 ) ) ( not ( = ?auto_310662 ?auto_310663 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_310657 ?auto_310658 ?auto_310656 ?auto_310655 ?auto_310653 ?auto_310654 ?auto_310659 ?auto_310660 )
      ( GET-4IMAGE-VERIFY ?auto_310653 ?auto_310654 ?auto_310656 ?auto_310655 ?auto_310657 ?auto_310658 ?auto_310659 ?auto_310660 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310757 - DIRECTION
      ?auto_310758 - MODE
      ?auto_310760 - DIRECTION
      ?auto_310759 - MODE
      ?auto_310761 - DIRECTION
      ?auto_310762 - MODE
      ?auto_310763 - DIRECTION
      ?auto_310764 - MODE
    )
    :vars
    (
      ?auto_310766 - INSTRUMENT
      ?auto_310771 - SATELLITE
      ?auto_310765 - DIRECTION
      ?auto_310769 - INSTRUMENT
      ?auto_310770 - INSTRUMENT
      ?auto_310767 - INSTRUMENT
      ?auto_310768 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_310760 ?auto_310757 ) ) ( not ( = ?auto_310761 ?auto_310757 ) ) ( not ( = ?auto_310761 ?auto_310760 ) ) ( not ( = ?auto_310763 ?auto_310757 ) ) ( not ( = ?auto_310763 ?auto_310760 ) ) ( not ( = ?auto_310763 ?auto_310761 ) ) ( ON_BOARD ?auto_310766 ?auto_310771 ) ( SUPPORTS ?auto_310766 ?auto_310758 ) ( not ( = ?auto_310757 ?auto_310765 ) ) ( CALIBRATION_TARGET ?auto_310766 ?auto_310765 ) ( not ( = ?auto_310765 ?auto_310761 ) ) ( ON_BOARD ?auto_310769 ?auto_310771 ) ( not ( = ?auto_310766 ?auto_310769 ) ) ( SUPPORTS ?auto_310769 ?auto_310762 ) ( CALIBRATION_TARGET ?auto_310769 ?auto_310765 ) ( not ( = ?auto_310765 ?auto_310760 ) ) ( ON_BOARD ?auto_310770 ?auto_310771 ) ( not ( = ?auto_310769 ?auto_310770 ) ) ( SUPPORTS ?auto_310770 ?auto_310759 ) ( CALIBRATION_TARGET ?auto_310770 ?auto_310765 ) ( not ( = ?auto_310765 ?auto_310763 ) ) ( ON_BOARD ?auto_310767 ?auto_310771 ) ( not ( = ?auto_310770 ?auto_310767 ) ) ( SUPPORTS ?auto_310767 ?auto_310764 ) ( CALIBRATION_TARGET ?auto_310767 ?auto_310765 ) ( POWER_AVAIL ?auto_310771 ) ( POINTING ?auto_310771 ?auto_310768 ) ( not ( = ?auto_310765 ?auto_310768 ) ) ( not ( = ?auto_310763 ?auto_310768 ) ) ( not ( = ?auto_310764 ?auto_310759 ) ) ( not ( = ?auto_310760 ?auto_310768 ) ) ( not ( = ?auto_310764 ?auto_310762 ) ) ( not ( = ?auto_310759 ?auto_310762 ) ) ( not ( = ?auto_310761 ?auto_310768 ) ) ( not ( = ?auto_310769 ?auto_310767 ) ) ( not ( = ?auto_310764 ?auto_310758 ) ) ( not ( = ?auto_310759 ?auto_310758 ) ) ( not ( = ?auto_310762 ?auto_310758 ) ) ( not ( = ?auto_310757 ?auto_310768 ) ) ( not ( = ?auto_310766 ?auto_310770 ) ) ( not ( = ?auto_310766 ?auto_310767 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_310763 ?auto_310764 ?auto_310760 ?auto_310759 ?auto_310757 ?auto_310758 ?auto_310761 ?auto_310762 )
      ( GET-4IMAGE-VERIFY ?auto_310757 ?auto_310758 ?auto_310760 ?auto_310759 ?auto_310761 ?auto_310762 ?auto_310763 ?auto_310764 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310912 - DIRECTION
      ?auto_310913 - MODE
      ?auto_310915 - DIRECTION
      ?auto_310914 - MODE
      ?auto_310916 - DIRECTION
      ?auto_310917 - MODE
      ?auto_310918 - DIRECTION
      ?auto_310919 - MODE
    )
    :vars
    (
      ?auto_310921 - INSTRUMENT
      ?auto_310926 - SATELLITE
      ?auto_310920 - DIRECTION
      ?auto_310924 - INSTRUMENT
      ?auto_310925 - INSTRUMENT
      ?auto_310922 - INSTRUMENT
      ?auto_310923 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_310915 ?auto_310912 ) ) ( not ( = ?auto_310916 ?auto_310912 ) ) ( not ( = ?auto_310916 ?auto_310915 ) ) ( not ( = ?auto_310918 ?auto_310912 ) ) ( not ( = ?auto_310918 ?auto_310915 ) ) ( not ( = ?auto_310918 ?auto_310916 ) ) ( ON_BOARD ?auto_310921 ?auto_310926 ) ( SUPPORTS ?auto_310921 ?auto_310913 ) ( not ( = ?auto_310912 ?auto_310920 ) ) ( CALIBRATION_TARGET ?auto_310921 ?auto_310920 ) ( not ( = ?auto_310920 ?auto_310915 ) ) ( ON_BOARD ?auto_310924 ?auto_310926 ) ( not ( = ?auto_310921 ?auto_310924 ) ) ( SUPPORTS ?auto_310924 ?auto_310914 ) ( CALIBRATION_TARGET ?auto_310924 ?auto_310920 ) ( not ( = ?auto_310920 ?auto_310918 ) ) ( ON_BOARD ?auto_310925 ?auto_310926 ) ( not ( = ?auto_310924 ?auto_310925 ) ) ( SUPPORTS ?auto_310925 ?auto_310919 ) ( CALIBRATION_TARGET ?auto_310925 ?auto_310920 ) ( not ( = ?auto_310920 ?auto_310916 ) ) ( ON_BOARD ?auto_310922 ?auto_310926 ) ( not ( = ?auto_310925 ?auto_310922 ) ) ( SUPPORTS ?auto_310922 ?auto_310917 ) ( CALIBRATION_TARGET ?auto_310922 ?auto_310920 ) ( POWER_AVAIL ?auto_310926 ) ( POINTING ?auto_310926 ?auto_310923 ) ( not ( = ?auto_310920 ?auto_310923 ) ) ( not ( = ?auto_310916 ?auto_310923 ) ) ( not ( = ?auto_310917 ?auto_310919 ) ) ( not ( = ?auto_310918 ?auto_310923 ) ) ( not ( = ?auto_310917 ?auto_310914 ) ) ( not ( = ?auto_310919 ?auto_310914 ) ) ( not ( = ?auto_310915 ?auto_310923 ) ) ( not ( = ?auto_310924 ?auto_310922 ) ) ( not ( = ?auto_310917 ?auto_310913 ) ) ( not ( = ?auto_310919 ?auto_310913 ) ) ( not ( = ?auto_310914 ?auto_310913 ) ) ( not ( = ?auto_310912 ?auto_310923 ) ) ( not ( = ?auto_310921 ?auto_310925 ) ) ( not ( = ?auto_310921 ?auto_310922 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_310916 ?auto_310917 ?auto_310918 ?auto_310919 ?auto_310912 ?auto_310913 ?auto_310915 ?auto_310914 )
      ( GET-4IMAGE-VERIFY ?auto_310912 ?auto_310913 ?auto_310915 ?auto_310914 ?auto_310916 ?auto_310917 ?auto_310918 ?auto_310919 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_310961 - DIRECTION
      ?auto_310962 - MODE
      ?auto_310964 - DIRECTION
      ?auto_310963 - MODE
      ?auto_310965 - DIRECTION
      ?auto_310966 - MODE
      ?auto_310967 - DIRECTION
      ?auto_310968 - MODE
    )
    :vars
    (
      ?auto_310970 - INSTRUMENT
      ?auto_310975 - SATELLITE
      ?auto_310969 - DIRECTION
      ?auto_310973 - INSTRUMENT
      ?auto_310974 - INSTRUMENT
      ?auto_310971 - INSTRUMENT
      ?auto_310972 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_310964 ?auto_310961 ) ) ( not ( = ?auto_310965 ?auto_310961 ) ) ( not ( = ?auto_310965 ?auto_310964 ) ) ( not ( = ?auto_310967 ?auto_310961 ) ) ( not ( = ?auto_310967 ?auto_310964 ) ) ( not ( = ?auto_310967 ?auto_310965 ) ) ( ON_BOARD ?auto_310970 ?auto_310975 ) ( SUPPORTS ?auto_310970 ?auto_310962 ) ( not ( = ?auto_310961 ?auto_310969 ) ) ( CALIBRATION_TARGET ?auto_310970 ?auto_310969 ) ( not ( = ?auto_310969 ?auto_310964 ) ) ( ON_BOARD ?auto_310973 ?auto_310975 ) ( not ( = ?auto_310970 ?auto_310973 ) ) ( SUPPORTS ?auto_310973 ?auto_310963 ) ( CALIBRATION_TARGET ?auto_310973 ?auto_310969 ) ( not ( = ?auto_310969 ?auto_310965 ) ) ( ON_BOARD ?auto_310974 ?auto_310975 ) ( not ( = ?auto_310973 ?auto_310974 ) ) ( SUPPORTS ?auto_310974 ?auto_310966 ) ( CALIBRATION_TARGET ?auto_310974 ?auto_310969 ) ( not ( = ?auto_310969 ?auto_310967 ) ) ( ON_BOARD ?auto_310971 ?auto_310975 ) ( not ( = ?auto_310974 ?auto_310971 ) ) ( SUPPORTS ?auto_310971 ?auto_310968 ) ( CALIBRATION_TARGET ?auto_310971 ?auto_310969 ) ( POWER_AVAIL ?auto_310975 ) ( POINTING ?auto_310975 ?auto_310972 ) ( not ( = ?auto_310969 ?auto_310972 ) ) ( not ( = ?auto_310967 ?auto_310972 ) ) ( not ( = ?auto_310968 ?auto_310966 ) ) ( not ( = ?auto_310965 ?auto_310972 ) ) ( not ( = ?auto_310968 ?auto_310963 ) ) ( not ( = ?auto_310966 ?auto_310963 ) ) ( not ( = ?auto_310964 ?auto_310972 ) ) ( not ( = ?auto_310973 ?auto_310971 ) ) ( not ( = ?auto_310968 ?auto_310962 ) ) ( not ( = ?auto_310966 ?auto_310962 ) ) ( not ( = ?auto_310963 ?auto_310962 ) ) ( not ( = ?auto_310961 ?auto_310972 ) ) ( not ( = ?auto_310970 ?auto_310974 ) ) ( not ( = ?auto_310970 ?auto_310971 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_310967 ?auto_310968 ?auto_310965 ?auto_310966 ?auto_310961 ?auto_310962 ?auto_310964 ?auto_310963 )
      ( GET-4IMAGE-VERIFY ?auto_310961 ?auto_310962 ?auto_310964 ?auto_310963 ?auto_310965 ?auto_310966 ?auto_310967 ?auto_310968 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_311467 - DIRECTION
      ?auto_311468 - MODE
    )
    :vars
    (
      ?auto_311469 - INSTRUMENT
      ?auto_311470 - SATELLITE
      ?auto_311471 - DIRECTION
      ?auto_311472 - DIRECTION
      ?auto_311473 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_311469 ?auto_311470 ) ( SUPPORTS ?auto_311469 ?auto_311468 ) ( not ( = ?auto_311467 ?auto_311471 ) ) ( CALIBRATION_TARGET ?auto_311469 ?auto_311471 ) ( POINTING ?auto_311470 ?auto_311472 ) ( not ( = ?auto_311471 ?auto_311472 ) ) ( ON_BOARD ?auto_311473 ?auto_311470 ) ( POWER_ON ?auto_311473 ) ( not ( = ?auto_311467 ?auto_311472 ) ) ( not ( = ?auto_311469 ?auto_311473 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_311473 ?auto_311470 )
      ( !TURN_TO ?auto_311470 ?auto_311471 ?auto_311472 )
      ( !SWITCH_ON ?auto_311469 ?auto_311470 )
      ( !CALIBRATE ?auto_311470 ?auto_311469 ?auto_311471 )
      ( !TURN_TO ?auto_311470 ?auto_311467 ?auto_311471 )
      ( !TAKE_IMAGE ?auto_311470 ?auto_311467 ?auto_311469 ?auto_311468 )
      ( GET-1IMAGE-VERIFY ?auto_311467 ?auto_311468 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_334244 - DIRECTION
      ?auto_334245 - MODE
      ?auto_334247 - DIRECTION
      ?auto_334246 - MODE
      ?auto_334248 - DIRECTION
      ?auto_334249 - MODE
      ?auto_334250 - DIRECTION
      ?auto_334251 - MODE
      ?auto_334252 - DIRECTION
      ?auto_334253 - MODE
    )
    :vars
    (
      ?auto_334255 - INSTRUMENT
      ?auto_334256 - SATELLITE
      ?auto_334257 - DIRECTION
      ?auto_334254 - INSTRUMENT
      ?auto_334260 - INSTRUMENT
      ?auto_334261 - INSTRUMENT
      ?auto_334258 - INSTRUMENT
      ?auto_334259 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_334247 ?auto_334244 ) ) ( not ( = ?auto_334248 ?auto_334244 ) ) ( not ( = ?auto_334248 ?auto_334247 ) ) ( not ( = ?auto_334250 ?auto_334244 ) ) ( not ( = ?auto_334250 ?auto_334247 ) ) ( not ( = ?auto_334250 ?auto_334248 ) ) ( not ( = ?auto_334252 ?auto_334244 ) ) ( not ( = ?auto_334252 ?auto_334247 ) ) ( not ( = ?auto_334252 ?auto_334248 ) ) ( not ( = ?auto_334252 ?auto_334250 ) ) ( ON_BOARD ?auto_334255 ?auto_334256 ) ( SUPPORTS ?auto_334255 ?auto_334253 ) ( not ( = ?auto_334252 ?auto_334257 ) ) ( CALIBRATION_TARGET ?auto_334255 ?auto_334257 ) ( not ( = ?auto_334257 ?auto_334250 ) ) ( ON_BOARD ?auto_334254 ?auto_334256 ) ( not ( = ?auto_334255 ?auto_334254 ) ) ( SUPPORTS ?auto_334254 ?auto_334251 ) ( CALIBRATION_TARGET ?auto_334254 ?auto_334257 ) ( not ( = ?auto_334257 ?auto_334248 ) ) ( ON_BOARD ?auto_334260 ?auto_334256 ) ( not ( = ?auto_334254 ?auto_334260 ) ) ( SUPPORTS ?auto_334260 ?auto_334249 ) ( CALIBRATION_TARGET ?auto_334260 ?auto_334257 ) ( not ( = ?auto_334257 ?auto_334247 ) ) ( ON_BOARD ?auto_334261 ?auto_334256 ) ( not ( = ?auto_334260 ?auto_334261 ) ) ( SUPPORTS ?auto_334261 ?auto_334246 ) ( CALIBRATION_TARGET ?auto_334261 ?auto_334257 ) ( not ( = ?auto_334257 ?auto_334244 ) ) ( ON_BOARD ?auto_334258 ?auto_334256 ) ( not ( = ?auto_334261 ?auto_334258 ) ) ( SUPPORTS ?auto_334258 ?auto_334245 ) ( CALIBRATION_TARGET ?auto_334258 ?auto_334257 ) ( POWER_AVAIL ?auto_334256 ) ( POINTING ?auto_334256 ?auto_334259 ) ( not ( = ?auto_334257 ?auto_334259 ) ) ( not ( = ?auto_334244 ?auto_334259 ) ) ( not ( = ?auto_334245 ?auto_334246 ) ) ( not ( = ?auto_334247 ?auto_334259 ) ) ( not ( = ?auto_334245 ?auto_334249 ) ) ( not ( = ?auto_334246 ?auto_334249 ) ) ( not ( = ?auto_334248 ?auto_334259 ) ) ( not ( = ?auto_334260 ?auto_334258 ) ) ( not ( = ?auto_334245 ?auto_334251 ) ) ( not ( = ?auto_334246 ?auto_334251 ) ) ( not ( = ?auto_334249 ?auto_334251 ) ) ( not ( = ?auto_334250 ?auto_334259 ) ) ( not ( = ?auto_334254 ?auto_334261 ) ) ( not ( = ?auto_334254 ?auto_334258 ) ) ( not ( = ?auto_334245 ?auto_334253 ) ) ( not ( = ?auto_334246 ?auto_334253 ) ) ( not ( = ?auto_334249 ?auto_334253 ) ) ( not ( = ?auto_334251 ?auto_334253 ) ) ( not ( = ?auto_334252 ?auto_334259 ) ) ( not ( = ?auto_334255 ?auto_334260 ) ) ( not ( = ?auto_334255 ?auto_334261 ) ) ( not ( = ?auto_334255 ?auto_334258 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_334244 ?auto_334245 ?auto_334247 ?auto_334246 ?auto_334250 ?auto_334251 ?auto_334248 ?auto_334249 )
      ( GET-1IMAGE ?auto_334252 ?auto_334253 )
      ( GET-5IMAGE-VERIFY ?auto_334244 ?auto_334245 ?auto_334247 ?auto_334246 ?auto_334248 ?auto_334249 ?auto_334250 ?auto_334251 ?auto_334252 ?auto_334253 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_334322 - DIRECTION
      ?auto_334323 - MODE
      ?auto_334325 - DIRECTION
      ?auto_334324 - MODE
      ?auto_334326 - DIRECTION
      ?auto_334327 - MODE
      ?auto_334328 - DIRECTION
      ?auto_334329 - MODE
      ?auto_334330 - DIRECTION
      ?auto_334331 - MODE
    )
    :vars
    (
      ?auto_334332 - INSTRUMENT
      ?auto_334335 - SATELLITE
      ?auto_334334 - DIRECTION
      ?auto_334339 - INSTRUMENT
      ?auto_334336 - INSTRUMENT
      ?auto_334333 - INSTRUMENT
      ?auto_334338 - INSTRUMENT
      ?auto_334337 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_334325 ?auto_334322 ) ) ( not ( = ?auto_334326 ?auto_334322 ) ) ( not ( = ?auto_334326 ?auto_334325 ) ) ( not ( = ?auto_334328 ?auto_334322 ) ) ( not ( = ?auto_334328 ?auto_334325 ) ) ( not ( = ?auto_334328 ?auto_334326 ) ) ( not ( = ?auto_334330 ?auto_334322 ) ) ( not ( = ?auto_334330 ?auto_334325 ) ) ( not ( = ?auto_334330 ?auto_334326 ) ) ( not ( = ?auto_334330 ?auto_334328 ) ) ( ON_BOARD ?auto_334332 ?auto_334335 ) ( SUPPORTS ?auto_334332 ?auto_334329 ) ( not ( = ?auto_334328 ?auto_334334 ) ) ( CALIBRATION_TARGET ?auto_334332 ?auto_334334 ) ( not ( = ?auto_334334 ?auto_334330 ) ) ( ON_BOARD ?auto_334339 ?auto_334335 ) ( not ( = ?auto_334332 ?auto_334339 ) ) ( SUPPORTS ?auto_334339 ?auto_334331 ) ( CALIBRATION_TARGET ?auto_334339 ?auto_334334 ) ( not ( = ?auto_334334 ?auto_334326 ) ) ( ON_BOARD ?auto_334336 ?auto_334335 ) ( not ( = ?auto_334339 ?auto_334336 ) ) ( SUPPORTS ?auto_334336 ?auto_334327 ) ( CALIBRATION_TARGET ?auto_334336 ?auto_334334 ) ( not ( = ?auto_334334 ?auto_334325 ) ) ( ON_BOARD ?auto_334333 ?auto_334335 ) ( not ( = ?auto_334336 ?auto_334333 ) ) ( SUPPORTS ?auto_334333 ?auto_334324 ) ( CALIBRATION_TARGET ?auto_334333 ?auto_334334 ) ( not ( = ?auto_334334 ?auto_334322 ) ) ( ON_BOARD ?auto_334338 ?auto_334335 ) ( not ( = ?auto_334333 ?auto_334338 ) ) ( SUPPORTS ?auto_334338 ?auto_334323 ) ( CALIBRATION_TARGET ?auto_334338 ?auto_334334 ) ( POWER_AVAIL ?auto_334335 ) ( POINTING ?auto_334335 ?auto_334337 ) ( not ( = ?auto_334334 ?auto_334337 ) ) ( not ( = ?auto_334322 ?auto_334337 ) ) ( not ( = ?auto_334323 ?auto_334324 ) ) ( not ( = ?auto_334325 ?auto_334337 ) ) ( not ( = ?auto_334323 ?auto_334327 ) ) ( not ( = ?auto_334324 ?auto_334327 ) ) ( not ( = ?auto_334326 ?auto_334337 ) ) ( not ( = ?auto_334336 ?auto_334338 ) ) ( not ( = ?auto_334323 ?auto_334331 ) ) ( not ( = ?auto_334324 ?auto_334331 ) ) ( not ( = ?auto_334327 ?auto_334331 ) ) ( not ( = ?auto_334330 ?auto_334337 ) ) ( not ( = ?auto_334339 ?auto_334333 ) ) ( not ( = ?auto_334339 ?auto_334338 ) ) ( not ( = ?auto_334323 ?auto_334329 ) ) ( not ( = ?auto_334324 ?auto_334329 ) ) ( not ( = ?auto_334327 ?auto_334329 ) ) ( not ( = ?auto_334331 ?auto_334329 ) ) ( not ( = ?auto_334328 ?auto_334337 ) ) ( not ( = ?auto_334332 ?auto_334336 ) ) ( not ( = ?auto_334332 ?auto_334333 ) ) ( not ( = ?auto_334332 ?auto_334338 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_334322 ?auto_334323 ?auto_334325 ?auto_334324 ?auto_334326 ?auto_334327 ?auto_334330 ?auto_334331 ?auto_334328 ?auto_334329 )
      ( GET-5IMAGE-VERIFY ?auto_334322 ?auto_334323 ?auto_334325 ?auto_334324 ?auto_334326 ?auto_334327 ?auto_334328 ?auto_334329 ?auto_334330 ?auto_334331 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_334400 - DIRECTION
      ?auto_334401 - MODE
      ?auto_334403 - DIRECTION
      ?auto_334402 - MODE
      ?auto_334404 - DIRECTION
      ?auto_334405 - MODE
      ?auto_334406 - DIRECTION
      ?auto_334407 - MODE
      ?auto_334408 - DIRECTION
      ?auto_334409 - MODE
    )
    :vars
    (
      ?auto_334417 - INSTRUMENT
      ?auto_334410 - SATELLITE
      ?auto_334411 - DIRECTION
      ?auto_334416 - INSTRUMENT
      ?auto_334413 - INSTRUMENT
      ?auto_334414 - INSTRUMENT
      ?auto_334415 - INSTRUMENT
      ?auto_334412 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_334403 ?auto_334400 ) ) ( not ( = ?auto_334404 ?auto_334400 ) ) ( not ( = ?auto_334404 ?auto_334403 ) ) ( not ( = ?auto_334406 ?auto_334400 ) ) ( not ( = ?auto_334406 ?auto_334403 ) ) ( not ( = ?auto_334406 ?auto_334404 ) ) ( not ( = ?auto_334408 ?auto_334400 ) ) ( not ( = ?auto_334408 ?auto_334403 ) ) ( not ( = ?auto_334408 ?auto_334404 ) ) ( not ( = ?auto_334408 ?auto_334406 ) ) ( ON_BOARD ?auto_334417 ?auto_334410 ) ( SUPPORTS ?auto_334417 ?auto_334409 ) ( not ( = ?auto_334408 ?auto_334411 ) ) ( CALIBRATION_TARGET ?auto_334417 ?auto_334411 ) ( not ( = ?auto_334411 ?auto_334404 ) ) ( ON_BOARD ?auto_334416 ?auto_334410 ) ( not ( = ?auto_334417 ?auto_334416 ) ) ( SUPPORTS ?auto_334416 ?auto_334405 ) ( CALIBRATION_TARGET ?auto_334416 ?auto_334411 ) ( not ( = ?auto_334411 ?auto_334406 ) ) ( ON_BOARD ?auto_334413 ?auto_334410 ) ( not ( = ?auto_334416 ?auto_334413 ) ) ( SUPPORTS ?auto_334413 ?auto_334407 ) ( CALIBRATION_TARGET ?auto_334413 ?auto_334411 ) ( not ( = ?auto_334411 ?auto_334403 ) ) ( ON_BOARD ?auto_334414 ?auto_334410 ) ( not ( = ?auto_334413 ?auto_334414 ) ) ( SUPPORTS ?auto_334414 ?auto_334402 ) ( CALIBRATION_TARGET ?auto_334414 ?auto_334411 ) ( not ( = ?auto_334411 ?auto_334400 ) ) ( ON_BOARD ?auto_334415 ?auto_334410 ) ( not ( = ?auto_334414 ?auto_334415 ) ) ( SUPPORTS ?auto_334415 ?auto_334401 ) ( CALIBRATION_TARGET ?auto_334415 ?auto_334411 ) ( POWER_AVAIL ?auto_334410 ) ( POINTING ?auto_334410 ?auto_334412 ) ( not ( = ?auto_334411 ?auto_334412 ) ) ( not ( = ?auto_334400 ?auto_334412 ) ) ( not ( = ?auto_334401 ?auto_334402 ) ) ( not ( = ?auto_334403 ?auto_334412 ) ) ( not ( = ?auto_334401 ?auto_334407 ) ) ( not ( = ?auto_334402 ?auto_334407 ) ) ( not ( = ?auto_334406 ?auto_334412 ) ) ( not ( = ?auto_334413 ?auto_334415 ) ) ( not ( = ?auto_334401 ?auto_334405 ) ) ( not ( = ?auto_334402 ?auto_334405 ) ) ( not ( = ?auto_334407 ?auto_334405 ) ) ( not ( = ?auto_334404 ?auto_334412 ) ) ( not ( = ?auto_334416 ?auto_334414 ) ) ( not ( = ?auto_334416 ?auto_334415 ) ) ( not ( = ?auto_334401 ?auto_334409 ) ) ( not ( = ?auto_334402 ?auto_334409 ) ) ( not ( = ?auto_334407 ?auto_334409 ) ) ( not ( = ?auto_334405 ?auto_334409 ) ) ( not ( = ?auto_334408 ?auto_334412 ) ) ( not ( = ?auto_334417 ?auto_334413 ) ) ( not ( = ?auto_334417 ?auto_334414 ) ) ( not ( = ?auto_334417 ?auto_334415 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_334400 ?auto_334401 ?auto_334403 ?auto_334402 ?auto_334406 ?auto_334407 ?auto_334408 ?auto_334409 ?auto_334404 ?auto_334405 )
      ( GET-5IMAGE-VERIFY ?auto_334400 ?auto_334401 ?auto_334403 ?auto_334402 ?auto_334404 ?auto_334405 ?auto_334406 ?auto_334407 ?auto_334408 ?auto_334409 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_334478 - DIRECTION
      ?auto_334479 - MODE
      ?auto_334481 - DIRECTION
      ?auto_334480 - MODE
      ?auto_334482 - DIRECTION
      ?auto_334483 - MODE
      ?auto_334484 - DIRECTION
      ?auto_334485 - MODE
      ?auto_334486 - DIRECTION
      ?auto_334487 - MODE
    )
    :vars
    (
      ?auto_334495 - INSTRUMENT
      ?auto_334488 - SATELLITE
      ?auto_334489 - DIRECTION
      ?auto_334494 - INSTRUMENT
      ?auto_334491 - INSTRUMENT
      ?auto_334492 - INSTRUMENT
      ?auto_334493 - INSTRUMENT
      ?auto_334490 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_334481 ?auto_334478 ) ) ( not ( = ?auto_334482 ?auto_334478 ) ) ( not ( = ?auto_334482 ?auto_334481 ) ) ( not ( = ?auto_334484 ?auto_334478 ) ) ( not ( = ?auto_334484 ?auto_334481 ) ) ( not ( = ?auto_334484 ?auto_334482 ) ) ( not ( = ?auto_334486 ?auto_334478 ) ) ( not ( = ?auto_334486 ?auto_334481 ) ) ( not ( = ?auto_334486 ?auto_334482 ) ) ( not ( = ?auto_334486 ?auto_334484 ) ) ( ON_BOARD ?auto_334495 ?auto_334488 ) ( SUPPORTS ?auto_334495 ?auto_334485 ) ( not ( = ?auto_334484 ?auto_334489 ) ) ( CALIBRATION_TARGET ?auto_334495 ?auto_334489 ) ( not ( = ?auto_334489 ?auto_334482 ) ) ( ON_BOARD ?auto_334494 ?auto_334488 ) ( not ( = ?auto_334495 ?auto_334494 ) ) ( SUPPORTS ?auto_334494 ?auto_334483 ) ( CALIBRATION_TARGET ?auto_334494 ?auto_334489 ) ( not ( = ?auto_334489 ?auto_334486 ) ) ( ON_BOARD ?auto_334491 ?auto_334488 ) ( not ( = ?auto_334494 ?auto_334491 ) ) ( SUPPORTS ?auto_334491 ?auto_334487 ) ( CALIBRATION_TARGET ?auto_334491 ?auto_334489 ) ( not ( = ?auto_334489 ?auto_334481 ) ) ( ON_BOARD ?auto_334492 ?auto_334488 ) ( not ( = ?auto_334491 ?auto_334492 ) ) ( SUPPORTS ?auto_334492 ?auto_334480 ) ( CALIBRATION_TARGET ?auto_334492 ?auto_334489 ) ( not ( = ?auto_334489 ?auto_334478 ) ) ( ON_BOARD ?auto_334493 ?auto_334488 ) ( not ( = ?auto_334492 ?auto_334493 ) ) ( SUPPORTS ?auto_334493 ?auto_334479 ) ( CALIBRATION_TARGET ?auto_334493 ?auto_334489 ) ( POWER_AVAIL ?auto_334488 ) ( POINTING ?auto_334488 ?auto_334490 ) ( not ( = ?auto_334489 ?auto_334490 ) ) ( not ( = ?auto_334478 ?auto_334490 ) ) ( not ( = ?auto_334479 ?auto_334480 ) ) ( not ( = ?auto_334481 ?auto_334490 ) ) ( not ( = ?auto_334479 ?auto_334487 ) ) ( not ( = ?auto_334480 ?auto_334487 ) ) ( not ( = ?auto_334486 ?auto_334490 ) ) ( not ( = ?auto_334491 ?auto_334493 ) ) ( not ( = ?auto_334479 ?auto_334483 ) ) ( not ( = ?auto_334480 ?auto_334483 ) ) ( not ( = ?auto_334487 ?auto_334483 ) ) ( not ( = ?auto_334482 ?auto_334490 ) ) ( not ( = ?auto_334494 ?auto_334492 ) ) ( not ( = ?auto_334494 ?auto_334493 ) ) ( not ( = ?auto_334479 ?auto_334485 ) ) ( not ( = ?auto_334480 ?auto_334485 ) ) ( not ( = ?auto_334487 ?auto_334485 ) ) ( not ( = ?auto_334483 ?auto_334485 ) ) ( not ( = ?auto_334484 ?auto_334490 ) ) ( not ( = ?auto_334495 ?auto_334491 ) ) ( not ( = ?auto_334495 ?auto_334492 ) ) ( not ( = ?auto_334495 ?auto_334493 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_334478 ?auto_334479 ?auto_334481 ?auto_334480 ?auto_334486 ?auto_334487 ?auto_334484 ?auto_334485 ?auto_334482 ?auto_334483 )
      ( GET-5IMAGE-VERIFY ?auto_334478 ?auto_334479 ?auto_334481 ?auto_334480 ?auto_334482 ?auto_334483 ?auto_334484 ?auto_334485 ?auto_334486 ?auto_334487 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_334808 - DIRECTION
      ?auto_334809 - MODE
      ?auto_334811 - DIRECTION
      ?auto_334810 - MODE
      ?auto_334812 - DIRECTION
      ?auto_334813 - MODE
      ?auto_334814 - DIRECTION
      ?auto_334815 - MODE
      ?auto_334816 - DIRECTION
      ?auto_334817 - MODE
    )
    :vars
    (
      ?auto_334825 - INSTRUMENT
      ?auto_334818 - SATELLITE
      ?auto_334819 - DIRECTION
      ?auto_334824 - INSTRUMENT
      ?auto_334821 - INSTRUMENT
      ?auto_334822 - INSTRUMENT
      ?auto_334823 - INSTRUMENT
      ?auto_334820 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_334811 ?auto_334808 ) ) ( not ( = ?auto_334812 ?auto_334808 ) ) ( not ( = ?auto_334812 ?auto_334811 ) ) ( not ( = ?auto_334814 ?auto_334808 ) ) ( not ( = ?auto_334814 ?auto_334811 ) ) ( not ( = ?auto_334814 ?auto_334812 ) ) ( not ( = ?auto_334816 ?auto_334808 ) ) ( not ( = ?auto_334816 ?auto_334811 ) ) ( not ( = ?auto_334816 ?auto_334812 ) ) ( not ( = ?auto_334816 ?auto_334814 ) ) ( ON_BOARD ?auto_334825 ?auto_334818 ) ( SUPPORTS ?auto_334825 ?auto_334813 ) ( not ( = ?auto_334812 ?auto_334819 ) ) ( CALIBRATION_TARGET ?auto_334825 ?auto_334819 ) ( not ( = ?auto_334819 ?auto_334816 ) ) ( ON_BOARD ?auto_334824 ?auto_334818 ) ( not ( = ?auto_334825 ?auto_334824 ) ) ( SUPPORTS ?auto_334824 ?auto_334817 ) ( CALIBRATION_TARGET ?auto_334824 ?auto_334819 ) ( not ( = ?auto_334819 ?auto_334814 ) ) ( ON_BOARD ?auto_334821 ?auto_334818 ) ( not ( = ?auto_334824 ?auto_334821 ) ) ( SUPPORTS ?auto_334821 ?auto_334815 ) ( CALIBRATION_TARGET ?auto_334821 ?auto_334819 ) ( not ( = ?auto_334819 ?auto_334811 ) ) ( ON_BOARD ?auto_334822 ?auto_334818 ) ( not ( = ?auto_334821 ?auto_334822 ) ) ( SUPPORTS ?auto_334822 ?auto_334810 ) ( CALIBRATION_TARGET ?auto_334822 ?auto_334819 ) ( not ( = ?auto_334819 ?auto_334808 ) ) ( ON_BOARD ?auto_334823 ?auto_334818 ) ( not ( = ?auto_334822 ?auto_334823 ) ) ( SUPPORTS ?auto_334823 ?auto_334809 ) ( CALIBRATION_TARGET ?auto_334823 ?auto_334819 ) ( POWER_AVAIL ?auto_334818 ) ( POINTING ?auto_334818 ?auto_334820 ) ( not ( = ?auto_334819 ?auto_334820 ) ) ( not ( = ?auto_334808 ?auto_334820 ) ) ( not ( = ?auto_334809 ?auto_334810 ) ) ( not ( = ?auto_334811 ?auto_334820 ) ) ( not ( = ?auto_334809 ?auto_334815 ) ) ( not ( = ?auto_334810 ?auto_334815 ) ) ( not ( = ?auto_334814 ?auto_334820 ) ) ( not ( = ?auto_334821 ?auto_334823 ) ) ( not ( = ?auto_334809 ?auto_334817 ) ) ( not ( = ?auto_334810 ?auto_334817 ) ) ( not ( = ?auto_334815 ?auto_334817 ) ) ( not ( = ?auto_334816 ?auto_334820 ) ) ( not ( = ?auto_334824 ?auto_334822 ) ) ( not ( = ?auto_334824 ?auto_334823 ) ) ( not ( = ?auto_334809 ?auto_334813 ) ) ( not ( = ?auto_334810 ?auto_334813 ) ) ( not ( = ?auto_334815 ?auto_334813 ) ) ( not ( = ?auto_334817 ?auto_334813 ) ) ( not ( = ?auto_334812 ?auto_334820 ) ) ( not ( = ?auto_334825 ?auto_334821 ) ) ( not ( = ?auto_334825 ?auto_334822 ) ) ( not ( = ?auto_334825 ?auto_334823 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_334808 ?auto_334809 ?auto_334811 ?auto_334810 ?auto_334814 ?auto_334815 ?auto_334812 ?auto_334813 ?auto_334816 ?auto_334817 )
      ( GET-5IMAGE-VERIFY ?auto_334808 ?auto_334809 ?auto_334811 ?auto_334810 ?auto_334812 ?auto_334813 ?auto_334814 ?auto_334815 ?auto_334816 ?auto_334817 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_334886 - DIRECTION
      ?auto_334887 - MODE
      ?auto_334889 - DIRECTION
      ?auto_334888 - MODE
      ?auto_334890 - DIRECTION
      ?auto_334891 - MODE
      ?auto_334892 - DIRECTION
      ?auto_334893 - MODE
      ?auto_334894 - DIRECTION
      ?auto_334895 - MODE
    )
    :vars
    (
      ?auto_334903 - INSTRUMENT
      ?auto_334896 - SATELLITE
      ?auto_334897 - DIRECTION
      ?auto_334902 - INSTRUMENT
      ?auto_334899 - INSTRUMENT
      ?auto_334900 - INSTRUMENT
      ?auto_334901 - INSTRUMENT
      ?auto_334898 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_334889 ?auto_334886 ) ) ( not ( = ?auto_334890 ?auto_334886 ) ) ( not ( = ?auto_334890 ?auto_334889 ) ) ( not ( = ?auto_334892 ?auto_334886 ) ) ( not ( = ?auto_334892 ?auto_334889 ) ) ( not ( = ?auto_334892 ?auto_334890 ) ) ( not ( = ?auto_334894 ?auto_334886 ) ) ( not ( = ?auto_334894 ?auto_334889 ) ) ( not ( = ?auto_334894 ?auto_334890 ) ) ( not ( = ?auto_334894 ?auto_334892 ) ) ( ON_BOARD ?auto_334903 ?auto_334896 ) ( SUPPORTS ?auto_334903 ?auto_334891 ) ( not ( = ?auto_334890 ?auto_334897 ) ) ( CALIBRATION_TARGET ?auto_334903 ?auto_334897 ) ( not ( = ?auto_334897 ?auto_334892 ) ) ( ON_BOARD ?auto_334902 ?auto_334896 ) ( not ( = ?auto_334903 ?auto_334902 ) ) ( SUPPORTS ?auto_334902 ?auto_334893 ) ( CALIBRATION_TARGET ?auto_334902 ?auto_334897 ) ( not ( = ?auto_334897 ?auto_334894 ) ) ( ON_BOARD ?auto_334899 ?auto_334896 ) ( not ( = ?auto_334902 ?auto_334899 ) ) ( SUPPORTS ?auto_334899 ?auto_334895 ) ( CALIBRATION_TARGET ?auto_334899 ?auto_334897 ) ( not ( = ?auto_334897 ?auto_334889 ) ) ( ON_BOARD ?auto_334900 ?auto_334896 ) ( not ( = ?auto_334899 ?auto_334900 ) ) ( SUPPORTS ?auto_334900 ?auto_334888 ) ( CALIBRATION_TARGET ?auto_334900 ?auto_334897 ) ( not ( = ?auto_334897 ?auto_334886 ) ) ( ON_BOARD ?auto_334901 ?auto_334896 ) ( not ( = ?auto_334900 ?auto_334901 ) ) ( SUPPORTS ?auto_334901 ?auto_334887 ) ( CALIBRATION_TARGET ?auto_334901 ?auto_334897 ) ( POWER_AVAIL ?auto_334896 ) ( POINTING ?auto_334896 ?auto_334898 ) ( not ( = ?auto_334897 ?auto_334898 ) ) ( not ( = ?auto_334886 ?auto_334898 ) ) ( not ( = ?auto_334887 ?auto_334888 ) ) ( not ( = ?auto_334889 ?auto_334898 ) ) ( not ( = ?auto_334887 ?auto_334895 ) ) ( not ( = ?auto_334888 ?auto_334895 ) ) ( not ( = ?auto_334894 ?auto_334898 ) ) ( not ( = ?auto_334899 ?auto_334901 ) ) ( not ( = ?auto_334887 ?auto_334893 ) ) ( not ( = ?auto_334888 ?auto_334893 ) ) ( not ( = ?auto_334895 ?auto_334893 ) ) ( not ( = ?auto_334892 ?auto_334898 ) ) ( not ( = ?auto_334902 ?auto_334900 ) ) ( not ( = ?auto_334902 ?auto_334901 ) ) ( not ( = ?auto_334887 ?auto_334891 ) ) ( not ( = ?auto_334888 ?auto_334891 ) ) ( not ( = ?auto_334895 ?auto_334891 ) ) ( not ( = ?auto_334893 ?auto_334891 ) ) ( not ( = ?auto_334890 ?auto_334898 ) ) ( not ( = ?auto_334903 ?auto_334899 ) ) ( not ( = ?auto_334903 ?auto_334900 ) ) ( not ( = ?auto_334903 ?auto_334901 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_334886 ?auto_334887 ?auto_334889 ?auto_334888 ?auto_334894 ?auto_334895 ?auto_334890 ?auto_334891 ?auto_334892 ?auto_334893 )
      ( GET-5IMAGE-VERIFY ?auto_334886 ?auto_334887 ?auto_334889 ?auto_334888 ?auto_334890 ?auto_334891 ?auto_334892 ?auto_334893 ?auto_334894 ?auto_334895 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_335300 - DIRECTION
      ?auto_335301 - MODE
      ?auto_335303 - DIRECTION
      ?auto_335302 - MODE
      ?auto_335304 - DIRECTION
      ?auto_335305 - MODE
      ?auto_335306 - DIRECTION
      ?auto_335307 - MODE
      ?auto_335308 - DIRECTION
      ?auto_335309 - MODE
    )
    :vars
    (
      ?auto_335317 - INSTRUMENT
      ?auto_335310 - SATELLITE
      ?auto_335311 - DIRECTION
      ?auto_335316 - INSTRUMENT
      ?auto_335313 - INSTRUMENT
      ?auto_335314 - INSTRUMENT
      ?auto_335315 - INSTRUMENT
      ?auto_335312 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_335303 ?auto_335300 ) ) ( not ( = ?auto_335304 ?auto_335300 ) ) ( not ( = ?auto_335304 ?auto_335303 ) ) ( not ( = ?auto_335306 ?auto_335300 ) ) ( not ( = ?auto_335306 ?auto_335303 ) ) ( not ( = ?auto_335306 ?auto_335304 ) ) ( not ( = ?auto_335308 ?auto_335300 ) ) ( not ( = ?auto_335308 ?auto_335303 ) ) ( not ( = ?auto_335308 ?auto_335304 ) ) ( not ( = ?auto_335308 ?auto_335306 ) ) ( ON_BOARD ?auto_335317 ?auto_335310 ) ( SUPPORTS ?auto_335317 ?auto_335309 ) ( not ( = ?auto_335308 ?auto_335311 ) ) ( CALIBRATION_TARGET ?auto_335317 ?auto_335311 ) ( not ( = ?auto_335311 ?auto_335306 ) ) ( ON_BOARD ?auto_335316 ?auto_335310 ) ( not ( = ?auto_335317 ?auto_335316 ) ) ( SUPPORTS ?auto_335316 ?auto_335307 ) ( CALIBRATION_TARGET ?auto_335316 ?auto_335311 ) ( not ( = ?auto_335311 ?auto_335303 ) ) ( ON_BOARD ?auto_335313 ?auto_335310 ) ( not ( = ?auto_335316 ?auto_335313 ) ) ( SUPPORTS ?auto_335313 ?auto_335302 ) ( CALIBRATION_TARGET ?auto_335313 ?auto_335311 ) ( not ( = ?auto_335311 ?auto_335304 ) ) ( ON_BOARD ?auto_335314 ?auto_335310 ) ( not ( = ?auto_335313 ?auto_335314 ) ) ( SUPPORTS ?auto_335314 ?auto_335305 ) ( CALIBRATION_TARGET ?auto_335314 ?auto_335311 ) ( not ( = ?auto_335311 ?auto_335300 ) ) ( ON_BOARD ?auto_335315 ?auto_335310 ) ( not ( = ?auto_335314 ?auto_335315 ) ) ( SUPPORTS ?auto_335315 ?auto_335301 ) ( CALIBRATION_TARGET ?auto_335315 ?auto_335311 ) ( POWER_AVAIL ?auto_335310 ) ( POINTING ?auto_335310 ?auto_335312 ) ( not ( = ?auto_335311 ?auto_335312 ) ) ( not ( = ?auto_335300 ?auto_335312 ) ) ( not ( = ?auto_335301 ?auto_335305 ) ) ( not ( = ?auto_335304 ?auto_335312 ) ) ( not ( = ?auto_335301 ?auto_335302 ) ) ( not ( = ?auto_335305 ?auto_335302 ) ) ( not ( = ?auto_335303 ?auto_335312 ) ) ( not ( = ?auto_335313 ?auto_335315 ) ) ( not ( = ?auto_335301 ?auto_335307 ) ) ( not ( = ?auto_335305 ?auto_335307 ) ) ( not ( = ?auto_335302 ?auto_335307 ) ) ( not ( = ?auto_335306 ?auto_335312 ) ) ( not ( = ?auto_335316 ?auto_335314 ) ) ( not ( = ?auto_335316 ?auto_335315 ) ) ( not ( = ?auto_335301 ?auto_335309 ) ) ( not ( = ?auto_335305 ?auto_335309 ) ) ( not ( = ?auto_335302 ?auto_335309 ) ) ( not ( = ?auto_335307 ?auto_335309 ) ) ( not ( = ?auto_335308 ?auto_335312 ) ) ( not ( = ?auto_335317 ?auto_335313 ) ) ( not ( = ?auto_335317 ?auto_335314 ) ) ( not ( = ?auto_335317 ?auto_335315 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_335300 ?auto_335301 ?auto_335304 ?auto_335305 ?auto_335303 ?auto_335302 ?auto_335308 ?auto_335309 ?auto_335306 ?auto_335307 )
      ( GET-5IMAGE-VERIFY ?auto_335300 ?auto_335301 ?auto_335303 ?auto_335302 ?auto_335304 ?auto_335305 ?auto_335306 ?auto_335307 ?auto_335308 ?auto_335309 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_335378 - DIRECTION
      ?auto_335379 - MODE
      ?auto_335381 - DIRECTION
      ?auto_335380 - MODE
      ?auto_335382 - DIRECTION
      ?auto_335383 - MODE
      ?auto_335384 - DIRECTION
      ?auto_335385 - MODE
      ?auto_335386 - DIRECTION
      ?auto_335387 - MODE
    )
    :vars
    (
      ?auto_335395 - INSTRUMENT
      ?auto_335388 - SATELLITE
      ?auto_335389 - DIRECTION
      ?auto_335394 - INSTRUMENT
      ?auto_335391 - INSTRUMENT
      ?auto_335392 - INSTRUMENT
      ?auto_335393 - INSTRUMENT
      ?auto_335390 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_335381 ?auto_335378 ) ) ( not ( = ?auto_335382 ?auto_335378 ) ) ( not ( = ?auto_335382 ?auto_335381 ) ) ( not ( = ?auto_335384 ?auto_335378 ) ) ( not ( = ?auto_335384 ?auto_335381 ) ) ( not ( = ?auto_335384 ?auto_335382 ) ) ( not ( = ?auto_335386 ?auto_335378 ) ) ( not ( = ?auto_335386 ?auto_335381 ) ) ( not ( = ?auto_335386 ?auto_335382 ) ) ( not ( = ?auto_335386 ?auto_335384 ) ) ( ON_BOARD ?auto_335395 ?auto_335388 ) ( SUPPORTS ?auto_335395 ?auto_335385 ) ( not ( = ?auto_335384 ?auto_335389 ) ) ( CALIBRATION_TARGET ?auto_335395 ?auto_335389 ) ( not ( = ?auto_335389 ?auto_335386 ) ) ( ON_BOARD ?auto_335394 ?auto_335388 ) ( not ( = ?auto_335395 ?auto_335394 ) ) ( SUPPORTS ?auto_335394 ?auto_335387 ) ( CALIBRATION_TARGET ?auto_335394 ?auto_335389 ) ( not ( = ?auto_335389 ?auto_335381 ) ) ( ON_BOARD ?auto_335391 ?auto_335388 ) ( not ( = ?auto_335394 ?auto_335391 ) ) ( SUPPORTS ?auto_335391 ?auto_335380 ) ( CALIBRATION_TARGET ?auto_335391 ?auto_335389 ) ( not ( = ?auto_335389 ?auto_335382 ) ) ( ON_BOARD ?auto_335392 ?auto_335388 ) ( not ( = ?auto_335391 ?auto_335392 ) ) ( SUPPORTS ?auto_335392 ?auto_335383 ) ( CALIBRATION_TARGET ?auto_335392 ?auto_335389 ) ( not ( = ?auto_335389 ?auto_335378 ) ) ( ON_BOARD ?auto_335393 ?auto_335388 ) ( not ( = ?auto_335392 ?auto_335393 ) ) ( SUPPORTS ?auto_335393 ?auto_335379 ) ( CALIBRATION_TARGET ?auto_335393 ?auto_335389 ) ( POWER_AVAIL ?auto_335388 ) ( POINTING ?auto_335388 ?auto_335390 ) ( not ( = ?auto_335389 ?auto_335390 ) ) ( not ( = ?auto_335378 ?auto_335390 ) ) ( not ( = ?auto_335379 ?auto_335383 ) ) ( not ( = ?auto_335382 ?auto_335390 ) ) ( not ( = ?auto_335379 ?auto_335380 ) ) ( not ( = ?auto_335383 ?auto_335380 ) ) ( not ( = ?auto_335381 ?auto_335390 ) ) ( not ( = ?auto_335391 ?auto_335393 ) ) ( not ( = ?auto_335379 ?auto_335387 ) ) ( not ( = ?auto_335383 ?auto_335387 ) ) ( not ( = ?auto_335380 ?auto_335387 ) ) ( not ( = ?auto_335386 ?auto_335390 ) ) ( not ( = ?auto_335394 ?auto_335392 ) ) ( not ( = ?auto_335394 ?auto_335393 ) ) ( not ( = ?auto_335379 ?auto_335385 ) ) ( not ( = ?auto_335383 ?auto_335385 ) ) ( not ( = ?auto_335380 ?auto_335385 ) ) ( not ( = ?auto_335387 ?auto_335385 ) ) ( not ( = ?auto_335384 ?auto_335390 ) ) ( not ( = ?auto_335395 ?auto_335391 ) ) ( not ( = ?auto_335395 ?auto_335392 ) ) ( not ( = ?auto_335395 ?auto_335393 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_335378 ?auto_335379 ?auto_335382 ?auto_335383 ?auto_335381 ?auto_335380 ?auto_335384 ?auto_335385 ?auto_335386 ?auto_335387 )
      ( GET-5IMAGE-VERIFY ?auto_335378 ?auto_335379 ?auto_335381 ?auto_335380 ?auto_335382 ?auto_335383 ?auto_335384 ?auto_335385 ?auto_335386 ?auto_335387 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_335626 - DIRECTION
      ?auto_335627 - MODE
      ?auto_335629 - DIRECTION
      ?auto_335628 - MODE
      ?auto_335630 - DIRECTION
      ?auto_335631 - MODE
      ?auto_335632 - DIRECTION
      ?auto_335633 - MODE
      ?auto_335634 - DIRECTION
      ?auto_335635 - MODE
    )
    :vars
    (
      ?auto_335643 - INSTRUMENT
      ?auto_335636 - SATELLITE
      ?auto_335637 - DIRECTION
      ?auto_335642 - INSTRUMENT
      ?auto_335639 - INSTRUMENT
      ?auto_335640 - INSTRUMENT
      ?auto_335641 - INSTRUMENT
      ?auto_335638 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_335629 ?auto_335626 ) ) ( not ( = ?auto_335630 ?auto_335626 ) ) ( not ( = ?auto_335630 ?auto_335629 ) ) ( not ( = ?auto_335632 ?auto_335626 ) ) ( not ( = ?auto_335632 ?auto_335629 ) ) ( not ( = ?auto_335632 ?auto_335630 ) ) ( not ( = ?auto_335634 ?auto_335626 ) ) ( not ( = ?auto_335634 ?auto_335629 ) ) ( not ( = ?auto_335634 ?auto_335630 ) ) ( not ( = ?auto_335634 ?auto_335632 ) ) ( ON_BOARD ?auto_335643 ?auto_335636 ) ( SUPPORTS ?auto_335643 ?auto_335635 ) ( not ( = ?auto_335634 ?auto_335637 ) ) ( CALIBRATION_TARGET ?auto_335643 ?auto_335637 ) ( not ( = ?auto_335637 ?auto_335630 ) ) ( ON_BOARD ?auto_335642 ?auto_335636 ) ( not ( = ?auto_335643 ?auto_335642 ) ) ( SUPPORTS ?auto_335642 ?auto_335631 ) ( CALIBRATION_TARGET ?auto_335642 ?auto_335637 ) ( not ( = ?auto_335637 ?auto_335629 ) ) ( ON_BOARD ?auto_335639 ?auto_335636 ) ( not ( = ?auto_335642 ?auto_335639 ) ) ( SUPPORTS ?auto_335639 ?auto_335628 ) ( CALIBRATION_TARGET ?auto_335639 ?auto_335637 ) ( not ( = ?auto_335637 ?auto_335632 ) ) ( ON_BOARD ?auto_335640 ?auto_335636 ) ( not ( = ?auto_335639 ?auto_335640 ) ) ( SUPPORTS ?auto_335640 ?auto_335633 ) ( CALIBRATION_TARGET ?auto_335640 ?auto_335637 ) ( not ( = ?auto_335637 ?auto_335626 ) ) ( ON_BOARD ?auto_335641 ?auto_335636 ) ( not ( = ?auto_335640 ?auto_335641 ) ) ( SUPPORTS ?auto_335641 ?auto_335627 ) ( CALIBRATION_TARGET ?auto_335641 ?auto_335637 ) ( POWER_AVAIL ?auto_335636 ) ( POINTING ?auto_335636 ?auto_335638 ) ( not ( = ?auto_335637 ?auto_335638 ) ) ( not ( = ?auto_335626 ?auto_335638 ) ) ( not ( = ?auto_335627 ?auto_335633 ) ) ( not ( = ?auto_335632 ?auto_335638 ) ) ( not ( = ?auto_335627 ?auto_335628 ) ) ( not ( = ?auto_335633 ?auto_335628 ) ) ( not ( = ?auto_335629 ?auto_335638 ) ) ( not ( = ?auto_335639 ?auto_335641 ) ) ( not ( = ?auto_335627 ?auto_335631 ) ) ( not ( = ?auto_335633 ?auto_335631 ) ) ( not ( = ?auto_335628 ?auto_335631 ) ) ( not ( = ?auto_335630 ?auto_335638 ) ) ( not ( = ?auto_335642 ?auto_335640 ) ) ( not ( = ?auto_335642 ?auto_335641 ) ) ( not ( = ?auto_335627 ?auto_335635 ) ) ( not ( = ?auto_335633 ?auto_335635 ) ) ( not ( = ?auto_335628 ?auto_335635 ) ) ( not ( = ?auto_335631 ?auto_335635 ) ) ( not ( = ?auto_335634 ?auto_335638 ) ) ( not ( = ?auto_335643 ?auto_335639 ) ) ( not ( = ?auto_335643 ?auto_335640 ) ) ( not ( = ?auto_335643 ?auto_335641 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_335626 ?auto_335627 ?auto_335632 ?auto_335633 ?auto_335629 ?auto_335628 ?auto_335634 ?auto_335635 ?auto_335630 ?auto_335631 )
      ( GET-5IMAGE-VERIFY ?auto_335626 ?auto_335627 ?auto_335629 ?auto_335628 ?auto_335630 ?auto_335631 ?auto_335632 ?auto_335633 ?auto_335634 ?auto_335635 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_335704 - DIRECTION
      ?auto_335705 - MODE
      ?auto_335707 - DIRECTION
      ?auto_335706 - MODE
      ?auto_335708 - DIRECTION
      ?auto_335709 - MODE
      ?auto_335710 - DIRECTION
      ?auto_335711 - MODE
      ?auto_335712 - DIRECTION
      ?auto_335713 - MODE
    )
    :vars
    (
      ?auto_335721 - INSTRUMENT
      ?auto_335714 - SATELLITE
      ?auto_335715 - DIRECTION
      ?auto_335720 - INSTRUMENT
      ?auto_335717 - INSTRUMENT
      ?auto_335718 - INSTRUMENT
      ?auto_335719 - INSTRUMENT
      ?auto_335716 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_335707 ?auto_335704 ) ) ( not ( = ?auto_335708 ?auto_335704 ) ) ( not ( = ?auto_335708 ?auto_335707 ) ) ( not ( = ?auto_335710 ?auto_335704 ) ) ( not ( = ?auto_335710 ?auto_335707 ) ) ( not ( = ?auto_335710 ?auto_335708 ) ) ( not ( = ?auto_335712 ?auto_335704 ) ) ( not ( = ?auto_335712 ?auto_335707 ) ) ( not ( = ?auto_335712 ?auto_335708 ) ) ( not ( = ?auto_335712 ?auto_335710 ) ) ( ON_BOARD ?auto_335721 ?auto_335714 ) ( SUPPORTS ?auto_335721 ?auto_335711 ) ( not ( = ?auto_335710 ?auto_335715 ) ) ( CALIBRATION_TARGET ?auto_335721 ?auto_335715 ) ( not ( = ?auto_335715 ?auto_335708 ) ) ( ON_BOARD ?auto_335720 ?auto_335714 ) ( not ( = ?auto_335721 ?auto_335720 ) ) ( SUPPORTS ?auto_335720 ?auto_335709 ) ( CALIBRATION_TARGET ?auto_335720 ?auto_335715 ) ( not ( = ?auto_335715 ?auto_335707 ) ) ( ON_BOARD ?auto_335717 ?auto_335714 ) ( not ( = ?auto_335720 ?auto_335717 ) ) ( SUPPORTS ?auto_335717 ?auto_335706 ) ( CALIBRATION_TARGET ?auto_335717 ?auto_335715 ) ( not ( = ?auto_335715 ?auto_335712 ) ) ( ON_BOARD ?auto_335718 ?auto_335714 ) ( not ( = ?auto_335717 ?auto_335718 ) ) ( SUPPORTS ?auto_335718 ?auto_335713 ) ( CALIBRATION_TARGET ?auto_335718 ?auto_335715 ) ( not ( = ?auto_335715 ?auto_335704 ) ) ( ON_BOARD ?auto_335719 ?auto_335714 ) ( not ( = ?auto_335718 ?auto_335719 ) ) ( SUPPORTS ?auto_335719 ?auto_335705 ) ( CALIBRATION_TARGET ?auto_335719 ?auto_335715 ) ( POWER_AVAIL ?auto_335714 ) ( POINTING ?auto_335714 ?auto_335716 ) ( not ( = ?auto_335715 ?auto_335716 ) ) ( not ( = ?auto_335704 ?auto_335716 ) ) ( not ( = ?auto_335705 ?auto_335713 ) ) ( not ( = ?auto_335712 ?auto_335716 ) ) ( not ( = ?auto_335705 ?auto_335706 ) ) ( not ( = ?auto_335713 ?auto_335706 ) ) ( not ( = ?auto_335707 ?auto_335716 ) ) ( not ( = ?auto_335717 ?auto_335719 ) ) ( not ( = ?auto_335705 ?auto_335709 ) ) ( not ( = ?auto_335713 ?auto_335709 ) ) ( not ( = ?auto_335706 ?auto_335709 ) ) ( not ( = ?auto_335708 ?auto_335716 ) ) ( not ( = ?auto_335720 ?auto_335718 ) ) ( not ( = ?auto_335720 ?auto_335719 ) ) ( not ( = ?auto_335705 ?auto_335711 ) ) ( not ( = ?auto_335713 ?auto_335711 ) ) ( not ( = ?auto_335706 ?auto_335711 ) ) ( not ( = ?auto_335709 ?auto_335711 ) ) ( not ( = ?auto_335710 ?auto_335716 ) ) ( not ( = ?auto_335721 ?auto_335717 ) ) ( not ( = ?auto_335721 ?auto_335718 ) ) ( not ( = ?auto_335721 ?auto_335719 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_335704 ?auto_335705 ?auto_335712 ?auto_335713 ?auto_335707 ?auto_335706 ?auto_335710 ?auto_335711 ?auto_335708 ?auto_335709 )
      ( GET-5IMAGE-VERIFY ?auto_335704 ?auto_335705 ?auto_335707 ?auto_335706 ?auto_335708 ?auto_335709 ?auto_335710 ?auto_335711 ?auto_335712 ?auto_335713 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_335948 - DIRECTION
      ?auto_335949 - MODE
      ?auto_335951 - DIRECTION
      ?auto_335950 - MODE
      ?auto_335952 - DIRECTION
      ?auto_335953 - MODE
      ?auto_335954 - DIRECTION
      ?auto_335955 - MODE
      ?auto_335956 - DIRECTION
      ?auto_335957 - MODE
    )
    :vars
    (
      ?auto_335965 - INSTRUMENT
      ?auto_335958 - SATELLITE
      ?auto_335959 - DIRECTION
      ?auto_335964 - INSTRUMENT
      ?auto_335961 - INSTRUMENT
      ?auto_335962 - INSTRUMENT
      ?auto_335963 - INSTRUMENT
      ?auto_335960 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_335951 ?auto_335948 ) ) ( not ( = ?auto_335952 ?auto_335948 ) ) ( not ( = ?auto_335952 ?auto_335951 ) ) ( not ( = ?auto_335954 ?auto_335948 ) ) ( not ( = ?auto_335954 ?auto_335951 ) ) ( not ( = ?auto_335954 ?auto_335952 ) ) ( not ( = ?auto_335956 ?auto_335948 ) ) ( not ( = ?auto_335956 ?auto_335951 ) ) ( not ( = ?auto_335956 ?auto_335952 ) ) ( not ( = ?auto_335956 ?auto_335954 ) ) ( ON_BOARD ?auto_335965 ?auto_335958 ) ( SUPPORTS ?auto_335965 ?auto_335953 ) ( not ( = ?auto_335952 ?auto_335959 ) ) ( CALIBRATION_TARGET ?auto_335965 ?auto_335959 ) ( not ( = ?auto_335959 ?auto_335956 ) ) ( ON_BOARD ?auto_335964 ?auto_335958 ) ( not ( = ?auto_335965 ?auto_335964 ) ) ( SUPPORTS ?auto_335964 ?auto_335957 ) ( CALIBRATION_TARGET ?auto_335964 ?auto_335959 ) ( not ( = ?auto_335959 ?auto_335951 ) ) ( ON_BOARD ?auto_335961 ?auto_335958 ) ( not ( = ?auto_335964 ?auto_335961 ) ) ( SUPPORTS ?auto_335961 ?auto_335950 ) ( CALIBRATION_TARGET ?auto_335961 ?auto_335959 ) ( not ( = ?auto_335959 ?auto_335954 ) ) ( ON_BOARD ?auto_335962 ?auto_335958 ) ( not ( = ?auto_335961 ?auto_335962 ) ) ( SUPPORTS ?auto_335962 ?auto_335955 ) ( CALIBRATION_TARGET ?auto_335962 ?auto_335959 ) ( not ( = ?auto_335959 ?auto_335948 ) ) ( ON_BOARD ?auto_335963 ?auto_335958 ) ( not ( = ?auto_335962 ?auto_335963 ) ) ( SUPPORTS ?auto_335963 ?auto_335949 ) ( CALIBRATION_TARGET ?auto_335963 ?auto_335959 ) ( POWER_AVAIL ?auto_335958 ) ( POINTING ?auto_335958 ?auto_335960 ) ( not ( = ?auto_335959 ?auto_335960 ) ) ( not ( = ?auto_335948 ?auto_335960 ) ) ( not ( = ?auto_335949 ?auto_335955 ) ) ( not ( = ?auto_335954 ?auto_335960 ) ) ( not ( = ?auto_335949 ?auto_335950 ) ) ( not ( = ?auto_335955 ?auto_335950 ) ) ( not ( = ?auto_335951 ?auto_335960 ) ) ( not ( = ?auto_335961 ?auto_335963 ) ) ( not ( = ?auto_335949 ?auto_335957 ) ) ( not ( = ?auto_335955 ?auto_335957 ) ) ( not ( = ?auto_335950 ?auto_335957 ) ) ( not ( = ?auto_335956 ?auto_335960 ) ) ( not ( = ?auto_335964 ?auto_335962 ) ) ( not ( = ?auto_335964 ?auto_335963 ) ) ( not ( = ?auto_335949 ?auto_335953 ) ) ( not ( = ?auto_335955 ?auto_335953 ) ) ( not ( = ?auto_335950 ?auto_335953 ) ) ( not ( = ?auto_335957 ?auto_335953 ) ) ( not ( = ?auto_335952 ?auto_335960 ) ) ( not ( = ?auto_335965 ?auto_335961 ) ) ( not ( = ?auto_335965 ?auto_335962 ) ) ( not ( = ?auto_335965 ?auto_335963 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_335948 ?auto_335949 ?auto_335954 ?auto_335955 ?auto_335951 ?auto_335950 ?auto_335952 ?auto_335953 ?auto_335956 ?auto_335957 )
      ( GET-5IMAGE-VERIFY ?auto_335948 ?auto_335949 ?auto_335951 ?auto_335950 ?auto_335952 ?auto_335953 ?auto_335954 ?auto_335955 ?auto_335956 ?auto_335957 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_336112 - DIRECTION
      ?auto_336113 - MODE
      ?auto_336115 - DIRECTION
      ?auto_336114 - MODE
      ?auto_336116 - DIRECTION
      ?auto_336117 - MODE
      ?auto_336118 - DIRECTION
      ?auto_336119 - MODE
      ?auto_336120 - DIRECTION
      ?auto_336121 - MODE
    )
    :vars
    (
      ?auto_336129 - INSTRUMENT
      ?auto_336122 - SATELLITE
      ?auto_336123 - DIRECTION
      ?auto_336128 - INSTRUMENT
      ?auto_336125 - INSTRUMENT
      ?auto_336126 - INSTRUMENT
      ?auto_336127 - INSTRUMENT
      ?auto_336124 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_336115 ?auto_336112 ) ) ( not ( = ?auto_336116 ?auto_336112 ) ) ( not ( = ?auto_336116 ?auto_336115 ) ) ( not ( = ?auto_336118 ?auto_336112 ) ) ( not ( = ?auto_336118 ?auto_336115 ) ) ( not ( = ?auto_336118 ?auto_336116 ) ) ( not ( = ?auto_336120 ?auto_336112 ) ) ( not ( = ?auto_336120 ?auto_336115 ) ) ( not ( = ?auto_336120 ?auto_336116 ) ) ( not ( = ?auto_336120 ?auto_336118 ) ) ( ON_BOARD ?auto_336129 ?auto_336122 ) ( SUPPORTS ?auto_336129 ?auto_336117 ) ( not ( = ?auto_336116 ?auto_336123 ) ) ( CALIBRATION_TARGET ?auto_336129 ?auto_336123 ) ( not ( = ?auto_336123 ?auto_336118 ) ) ( ON_BOARD ?auto_336128 ?auto_336122 ) ( not ( = ?auto_336129 ?auto_336128 ) ) ( SUPPORTS ?auto_336128 ?auto_336119 ) ( CALIBRATION_TARGET ?auto_336128 ?auto_336123 ) ( not ( = ?auto_336123 ?auto_336115 ) ) ( ON_BOARD ?auto_336125 ?auto_336122 ) ( not ( = ?auto_336128 ?auto_336125 ) ) ( SUPPORTS ?auto_336125 ?auto_336114 ) ( CALIBRATION_TARGET ?auto_336125 ?auto_336123 ) ( not ( = ?auto_336123 ?auto_336120 ) ) ( ON_BOARD ?auto_336126 ?auto_336122 ) ( not ( = ?auto_336125 ?auto_336126 ) ) ( SUPPORTS ?auto_336126 ?auto_336121 ) ( CALIBRATION_TARGET ?auto_336126 ?auto_336123 ) ( not ( = ?auto_336123 ?auto_336112 ) ) ( ON_BOARD ?auto_336127 ?auto_336122 ) ( not ( = ?auto_336126 ?auto_336127 ) ) ( SUPPORTS ?auto_336127 ?auto_336113 ) ( CALIBRATION_TARGET ?auto_336127 ?auto_336123 ) ( POWER_AVAIL ?auto_336122 ) ( POINTING ?auto_336122 ?auto_336124 ) ( not ( = ?auto_336123 ?auto_336124 ) ) ( not ( = ?auto_336112 ?auto_336124 ) ) ( not ( = ?auto_336113 ?auto_336121 ) ) ( not ( = ?auto_336120 ?auto_336124 ) ) ( not ( = ?auto_336113 ?auto_336114 ) ) ( not ( = ?auto_336121 ?auto_336114 ) ) ( not ( = ?auto_336115 ?auto_336124 ) ) ( not ( = ?auto_336125 ?auto_336127 ) ) ( not ( = ?auto_336113 ?auto_336119 ) ) ( not ( = ?auto_336121 ?auto_336119 ) ) ( not ( = ?auto_336114 ?auto_336119 ) ) ( not ( = ?auto_336118 ?auto_336124 ) ) ( not ( = ?auto_336128 ?auto_336126 ) ) ( not ( = ?auto_336128 ?auto_336127 ) ) ( not ( = ?auto_336113 ?auto_336117 ) ) ( not ( = ?auto_336121 ?auto_336117 ) ) ( not ( = ?auto_336114 ?auto_336117 ) ) ( not ( = ?auto_336119 ?auto_336117 ) ) ( not ( = ?auto_336116 ?auto_336124 ) ) ( not ( = ?auto_336129 ?auto_336125 ) ) ( not ( = ?auto_336129 ?auto_336126 ) ) ( not ( = ?auto_336129 ?auto_336127 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_336112 ?auto_336113 ?auto_336120 ?auto_336121 ?auto_336115 ?auto_336114 ?auto_336116 ?auto_336117 ?auto_336118 ?auto_336119 )
      ( GET-5IMAGE-VERIFY ?auto_336112 ?auto_336113 ?auto_336115 ?auto_336114 ?auto_336116 ?auto_336117 ?auto_336118 ?auto_336119 ?auto_336120 ?auto_336121 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_336526 - DIRECTION
      ?auto_336527 - MODE
      ?auto_336529 - DIRECTION
      ?auto_336528 - MODE
      ?auto_336530 - DIRECTION
      ?auto_336531 - MODE
      ?auto_336532 - DIRECTION
      ?auto_336533 - MODE
      ?auto_336534 - DIRECTION
      ?auto_336535 - MODE
    )
    :vars
    (
      ?auto_336543 - INSTRUMENT
      ?auto_336536 - SATELLITE
      ?auto_336537 - DIRECTION
      ?auto_336542 - INSTRUMENT
      ?auto_336539 - INSTRUMENT
      ?auto_336540 - INSTRUMENT
      ?auto_336541 - INSTRUMENT
      ?auto_336538 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_336529 ?auto_336526 ) ) ( not ( = ?auto_336530 ?auto_336526 ) ) ( not ( = ?auto_336530 ?auto_336529 ) ) ( not ( = ?auto_336532 ?auto_336526 ) ) ( not ( = ?auto_336532 ?auto_336529 ) ) ( not ( = ?auto_336532 ?auto_336530 ) ) ( not ( = ?auto_336534 ?auto_336526 ) ) ( not ( = ?auto_336534 ?auto_336529 ) ) ( not ( = ?auto_336534 ?auto_336530 ) ) ( not ( = ?auto_336534 ?auto_336532 ) ) ( ON_BOARD ?auto_336543 ?auto_336536 ) ( SUPPORTS ?auto_336543 ?auto_336535 ) ( not ( = ?auto_336534 ?auto_336537 ) ) ( CALIBRATION_TARGET ?auto_336543 ?auto_336537 ) ( not ( = ?auto_336537 ?auto_336529 ) ) ( ON_BOARD ?auto_336542 ?auto_336536 ) ( not ( = ?auto_336543 ?auto_336542 ) ) ( SUPPORTS ?auto_336542 ?auto_336528 ) ( CALIBRATION_TARGET ?auto_336542 ?auto_336537 ) ( not ( = ?auto_336537 ?auto_336532 ) ) ( ON_BOARD ?auto_336539 ?auto_336536 ) ( not ( = ?auto_336542 ?auto_336539 ) ) ( SUPPORTS ?auto_336539 ?auto_336533 ) ( CALIBRATION_TARGET ?auto_336539 ?auto_336537 ) ( not ( = ?auto_336537 ?auto_336530 ) ) ( ON_BOARD ?auto_336540 ?auto_336536 ) ( not ( = ?auto_336539 ?auto_336540 ) ) ( SUPPORTS ?auto_336540 ?auto_336531 ) ( CALIBRATION_TARGET ?auto_336540 ?auto_336537 ) ( not ( = ?auto_336537 ?auto_336526 ) ) ( ON_BOARD ?auto_336541 ?auto_336536 ) ( not ( = ?auto_336540 ?auto_336541 ) ) ( SUPPORTS ?auto_336541 ?auto_336527 ) ( CALIBRATION_TARGET ?auto_336541 ?auto_336537 ) ( POWER_AVAIL ?auto_336536 ) ( POINTING ?auto_336536 ?auto_336538 ) ( not ( = ?auto_336537 ?auto_336538 ) ) ( not ( = ?auto_336526 ?auto_336538 ) ) ( not ( = ?auto_336527 ?auto_336531 ) ) ( not ( = ?auto_336530 ?auto_336538 ) ) ( not ( = ?auto_336527 ?auto_336533 ) ) ( not ( = ?auto_336531 ?auto_336533 ) ) ( not ( = ?auto_336532 ?auto_336538 ) ) ( not ( = ?auto_336539 ?auto_336541 ) ) ( not ( = ?auto_336527 ?auto_336528 ) ) ( not ( = ?auto_336531 ?auto_336528 ) ) ( not ( = ?auto_336533 ?auto_336528 ) ) ( not ( = ?auto_336529 ?auto_336538 ) ) ( not ( = ?auto_336542 ?auto_336540 ) ) ( not ( = ?auto_336542 ?auto_336541 ) ) ( not ( = ?auto_336527 ?auto_336535 ) ) ( not ( = ?auto_336531 ?auto_336535 ) ) ( not ( = ?auto_336533 ?auto_336535 ) ) ( not ( = ?auto_336528 ?auto_336535 ) ) ( not ( = ?auto_336534 ?auto_336538 ) ) ( not ( = ?auto_336543 ?auto_336539 ) ) ( not ( = ?auto_336543 ?auto_336540 ) ) ( not ( = ?auto_336543 ?auto_336541 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_336526 ?auto_336527 ?auto_336530 ?auto_336531 ?auto_336532 ?auto_336533 ?auto_336534 ?auto_336535 ?auto_336529 ?auto_336528 )
      ( GET-5IMAGE-VERIFY ?auto_336526 ?auto_336527 ?auto_336529 ?auto_336528 ?auto_336530 ?auto_336531 ?auto_336532 ?auto_336533 ?auto_336534 ?auto_336535 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_336604 - DIRECTION
      ?auto_336605 - MODE
      ?auto_336607 - DIRECTION
      ?auto_336606 - MODE
      ?auto_336608 - DIRECTION
      ?auto_336609 - MODE
      ?auto_336610 - DIRECTION
      ?auto_336611 - MODE
      ?auto_336612 - DIRECTION
      ?auto_336613 - MODE
    )
    :vars
    (
      ?auto_336621 - INSTRUMENT
      ?auto_336614 - SATELLITE
      ?auto_336615 - DIRECTION
      ?auto_336620 - INSTRUMENT
      ?auto_336617 - INSTRUMENT
      ?auto_336618 - INSTRUMENT
      ?auto_336619 - INSTRUMENT
      ?auto_336616 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_336607 ?auto_336604 ) ) ( not ( = ?auto_336608 ?auto_336604 ) ) ( not ( = ?auto_336608 ?auto_336607 ) ) ( not ( = ?auto_336610 ?auto_336604 ) ) ( not ( = ?auto_336610 ?auto_336607 ) ) ( not ( = ?auto_336610 ?auto_336608 ) ) ( not ( = ?auto_336612 ?auto_336604 ) ) ( not ( = ?auto_336612 ?auto_336607 ) ) ( not ( = ?auto_336612 ?auto_336608 ) ) ( not ( = ?auto_336612 ?auto_336610 ) ) ( ON_BOARD ?auto_336621 ?auto_336614 ) ( SUPPORTS ?auto_336621 ?auto_336611 ) ( not ( = ?auto_336610 ?auto_336615 ) ) ( CALIBRATION_TARGET ?auto_336621 ?auto_336615 ) ( not ( = ?auto_336615 ?auto_336607 ) ) ( ON_BOARD ?auto_336620 ?auto_336614 ) ( not ( = ?auto_336621 ?auto_336620 ) ) ( SUPPORTS ?auto_336620 ?auto_336606 ) ( CALIBRATION_TARGET ?auto_336620 ?auto_336615 ) ( not ( = ?auto_336615 ?auto_336612 ) ) ( ON_BOARD ?auto_336617 ?auto_336614 ) ( not ( = ?auto_336620 ?auto_336617 ) ) ( SUPPORTS ?auto_336617 ?auto_336613 ) ( CALIBRATION_TARGET ?auto_336617 ?auto_336615 ) ( not ( = ?auto_336615 ?auto_336608 ) ) ( ON_BOARD ?auto_336618 ?auto_336614 ) ( not ( = ?auto_336617 ?auto_336618 ) ) ( SUPPORTS ?auto_336618 ?auto_336609 ) ( CALIBRATION_TARGET ?auto_336618 ?auto_336615 ) ( not ( = ?auto_336615 ?auto_336604 ) ) ( ON_BOARD ?auto_336619 ?auto_336614 ) ( not ( = ?auto_336618 ?auto_336619 ) ) ( SUPPORTS ?auto_336619 ?auto_336605 ) ( CALIBRATION_TARGET ?auto_336619 ?auto_336615 ) ( POWER_AVAIL ?auto_336614 ) ( POINTING ?auto_336614 ?auto_336616 ) ( not ( = ?auto_336615 ?auto_336616 ) ) ( not ( = ?auto_336604 ?auto_336616 ) ) ( not ( = ?auto_336605 ?auto_336609 ) ) ( not ( = ?auto_336608 ?auto_336616 ) ) ( not ( = ?auto_336605 ?auto_336613 ) ) ( not ( = ?auto_336609 ?auto_336613 ) ) ( not ( = ?auto_336612 ?auto_336616 ) ) ( not ( = ?auto_336617 ?auto_336619 ) ) ( not ( = ?auto_336605 ?auto_336606 ) ) ( not ( = ?auto_336609 ?auto_336606 ) ) ( not ( = ?auto_336613 ?auto_336606 ) ) ( not ( = ?auto_336607 ?auto_336616 ) ) ( not ( = ?auto_336620 ?auto_336618 ) ) ( not ( = ?auto_336620 ?auto_336619 ) ) ( not ( = ?auto_336605 ?auto_336611 ) ) ( not ( = ?auto_336609 ?auto_336611 ) ) ( not ( = ?auto_336613 ?auto_336611 ) ) ( not ( = ?auto_336606 ?auto_336611 ) ) ( not ( = ?auto_336610 ?auto_336616 ) ) ( not ( = ?auto_336621 ?auto_336617 ) ) ( not ( = ?auto_336621 ?auto_336618 ) ) ( not ( = ?auto_336621 ?auto_336619 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_336604 ?auto_336605 ?auto_336608 ?auto_336609 ?auto_336612 ?auto_336613 ?auto_336610 ?auto_336611 ?auto_336607 ?auto_336606 )
      ( GET-5IMAGE-VERIFY ?auto_336604 ?auto_336605 ?auto_336607 ?auto_336606 ?auto_336608 ?auto_336609 ?auto_336610 ?auto_336611 ?auto_336612 ?auto_336613 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_336682 - DIRECTION
      ?auto_336683 - MODE
      ?auto_336685 - DIRECTION
      ?auto_336684 - MODE
      ?auto_336686 - DIRECTION
      ?auto_336687 - MODE
      ?auto_336688 - DIRECTION
      ?auto_336689 - MODE
      ?auto_336690 - DIRECTION
      ?auto_336691 - MODE
    )
    :vars
    (
      ?auto_336699 - INSTRUMENT
      ?auto_336692 - SATELLITE
      ?auto_336693 - DIRECTION
      ?auto_336698 - INSTRUMENT
      ?auto_336695 - INSTRUMENT
      ?auto_336696 - INSTRUMENT
      ?auto_336697 - INSTRUMENT
      ?auto_336694 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_336685 ?auto_336682 ) ) ( not ( = ?auto_336686 ?auto_336682 ) ) ( not ( = ?auto_336686 ?auto_336685 ) ) ( not ( = ?auto_336688 ?auto_336682 ) ) ( not ( = ?auto_336688 ?auto_336685 ) ) ( not ( = ?auto_336688 ?auto_336686 ) ) ( not ( = ?auto_336690 ?auto_336682 ) ) ( not ( = ?auto_336690 ?auto_336685 ) ) ( not ( = ?auto_336690 ?auto_336686 ) ) ( not ( = ?auto_336690 ?auto_336688 ) ) ( ON_BOARD ?auto_336699 ?auto_336692 ) ( SUPPORTS ?auto_336699 ?auto_336691 ) ( not ( = ?auto_336690 ?auto_336693 ) ) ( CALIBRATION_TARGET ?auto_336699 ?auto_336693 ) ( not ( = ?auto_336693 ?auto_336685 ) ) ( ON_BOARD ?auto_336698 ?auto_336692 ) ( not ( = ?auto_336699 ?auto_336698 ) ) ( SUPPORTS ?auto_336698 ?auto_336684 ) ( CALIBRATION_TARGET ?auto_336698 ?auto_336693 ) ( not ( = ?auto_336693 ?auto_336686 ) ) ( ON_BOARD ?auto_336695 ?auto_336692 ) ( not ( = ?auto_336698 ?auto_336695 ) ) ( SUPPORTS ?auto_336695 ?auto_336687 ) ( CALIBRATION_TARGET ?auto_336695 ?auto_336693 ) ( not ( = ?auto_336693 ?auto_336688 ) ) ( ON_BOARD ?auto_336696 ?auto_336692 ) ( not ( = ?auto_336695 ?auto_336696 ) ) ( SUPPORTS ?auto_336696 ?auto_336689 ) ( CALIBRATION_TARGET ?auto_336696 ?auto_336693 ) ( not ( = ?auto_336693 ?auto_336682 ) ) ( ON_BOARD ?auto_336697 ?auto_336692 ) ( not ( = ?auto_336696 ?auto_336697 ) ) ( SUPPORTS ?auto_336697 ?auto_336683 ) ( CALIBRATION_TARGET ?auto_336697 ?auto_336693 ) ( POWER_AVAIL ?auto_336692 ) ( POINTING ?auto_336692 ?auto_336694 ) ( not ( = ?auto_336693 ?auto_336694 ) ) ( not ( = ?auto_336682 ?auto_336694 ) ) ( not ( = ?auto_336683 ?auto_336689 ) ) ( not ( = ?auto_336688 ?auto_336694 ) ) ( not ( = ?auto_336683 ?auto_336687 ) ) ( not ( = ?auto_336689 ?auto_336687 ) ) ( not ( = ?auto_336686 ?auto_336694 ) ) ( not ( = ?auto_336695 ?auto_336697 ) ) ( not ( = ?auto_336683 ?auto_336684 ) ) ( not ( = ?auto_336689 ?auto_336684 ) ) ( not ( = ?auto_336687 ?auto_336684 ) ) ( not ( = ?auto_336685 ?auto_336694 ) ) ( not ( = ?auto_336698 ?auto_336696 ) ) ( not ( = ?auto_336698 ?auto_336697 ) ) ( not ( = ?auto_336683 ?auto_336691 ) ) ( not ( = ?auto_336689 ?auto_336691 ) ) ( not ( = ?auto_336687 ?auto_336691 ) ) ( not ( = ?auto_336684 ?auto_336691 ) ) ( not ( = ?auto_336690 ?auto_336694 ) ) ( not ( = ?auto_336699 ?auto_336695 ) ) ( not ( = ?auto_336699 ?auto_336696 ) ) ( not ( = ?auto_336699 ?auto_336697 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_336682 ?auto_336683 ?auto_336688 ?auto_336689 ?auto_336686 ?auto_336687 ?auto_336690 ?auto_336691 ?auto_336685 ?auto_336684 )
      ( GET-5IMAGE-VERIFY ?auto_336682 ?auto_336683 ?auto_336685 ?auto_336684 ?auto_336686 ?auto_336687 ?auto_336688 ?auto_336689 ?auto_336690 ?auto_336691 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_336760 - DIRECTION
      ?auto_336761 - MODE
      ?auto_336763 - DIRECTION
      ?auto_336762 - MODE
      ?auto_336764 - DIRECTION
      ?auto_336765 - MODE
      ?auto_336766 - DIRECTION
      ?auto_336767 - MODE
      ?auto_336768 - DIRECTION
      ?auto_336769 - MODE
    )
    :vars
    (
      ?auto_336777 - INSTRUMENT
      ?auto_336770 - SATELLITE
      ?auto_336771 - DIRECTION
      ?auto_336776 - INSTRUMENT
      ?auto_336773 - INSTRUMENT
      ?auto_336774 - INSTRUMENT
      ?auto_336775 - INSTRUMENT
      ?auto_336772 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_336763 ?auto_336760 ) ) ( not ( = ?auto_336764 ?auto_336760 ) ) ( not ( = ?auto_336764 ?auto_336763 ) ) ( not ( = ?auto_336766 ?auto_336760 ) ) ( not ( = ?auto_336766 ?auto_336763 ) ) ( not ( = ?auto_336766 ?auto_336764 ) ) ( not ( = ?auto_336768 ?auto_336760 ) ) ( not ( = ?auto_336768 ?auto_336763 ) ) ( not ( = ?auto_336768 ?auto_336764 ) ) ( not ( = ?auto_336768 ?auto_336766 ) ) ( ON_BOARD ?auto_336777 ?auto_336770 ) ( SUPPORTS ?auto_336777 ?auto_336767 ) ( not ( = ?auto_336766 ?auto_336771 ) ) ( CALIBRATION_TARGET ?auto_336777 ?auto_336771 ) ( not ( = ?auto_336771 ?auto_336763 ) ) ( ON_BOARD ?auto_336776 ?auto_336770 ) ( not ( = ?auto_336777 ?auto_336776 ) ) ( SUPPORTS ?auto_336776 ?auto_336762 ) ( CALIBRATION_TARGET ?auto_336776 ?auto_336771 ) ( not ( = ?auto_336771 ?auto_336764 ) ) ( ON_BOARD ?auto_336773 ?auto_336770 ) ( not ( = ?auto_336776 ?auto_336773 ) ) ( SUPPORTS ?auto_336773 ?auto_336765 ) ( CALIBRATION_TARGET ?auto_336773 ?auto_336771 ) ( not ( = ?auto_336771 ?auto_336768 ) ) ( ON_BOARD ?auto_336774 ?auto_336770 ) ( not ( = ?auto_336773 ?auto_336774 ) ) ( SUPPORTS ?auto_336774 ?auto_336769 ) ( CALIBRATION_TARGET ?auto_336774 ?auto_336771 ) ( not ( = ?auto_336771 ?auto_336760 ) ) ( ON_BOARD ?auto_336775 ?auto_336770 ) ( not ( = ?auto_336774 ?auto_336775 ) ) ( SUPPORTS ?auto_336775 ?auto_336761 ) ( CALIBRATION_TARGET ?auto_336775 ?auto_336771 ) ( POWER_AVAIL ?auto_336770 ) ( POINTING ?auto_336770 ?auto_336772 ) ( not ( = ?auto_336771 ?auto_336772 ) ) ( not ( = ?auto_336760 ?auto_336772 ) ) ( not ( = ?auto_336761 ?auto_336769 ) ) ( not ( = ?auto_336768 ?auto_336772 ) ) ( not ( = ?auto_336761 ?auto_336765 ) ) ( not ( = ?auto_336769 ?auto_336765 ) ) ( not ( = ?auto_336764 ?auto_336772 ) ) ( not ( = ?auto_336773 ?auto_336775 ) ) ( not ( = ?auto_336761 ?auto_336762 ) ) ( not ( = ?auto_336769 ?auto_336762 ) ) ( not ( = ?auto_336765 ?auto_336762 ) ) ( not ( = ?auto_336763 ?auto_336772 ) ) ( not ( = ?auto_336776 ?auto_336774 ) ) ( not ( = ?auto_336776 ?auto_336775 ) ) ( not ( = ?auto_336761 ?auto_336767 ) ) ( not ( = ?auto_336769 ?auto_336767 ) ) ( not ( = ?auto_336765 ?auto_336767 ) ) ( not ( = ?auto_336762 ?auto_336767 ) ) ( not ( = ?auto_336766 ?auto_336772 ) ) ( not ( = ?auto_336777 ?auto_336773 ) ) ( not ( = ?auto_336777 ?auto_336774 ) ) ( not ( = ?auto_336777 ?auto_336775 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_336760 ?auto_336761 ?auto_336768 ?auto_336769 ?auto_336764 ?auto_336765 ?auto_336766 ?auto_336767 ?auto_336763 ?auto_336762 )
      ( GET-5IMAGE-VERIFY ?auto_336760 ?auto_336761 ?auto_336763 ?auto_336762 ?auto_336764 ?auto_336765 ?auto_336766 ?auto_336767 ?auto_336768 ?auto_336769 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_337174 - DIRECTION
      ?auto_337175 - MODE
      ?auto_337177 - DIRECTION
      ?auto_337176 - MODE
      ?auto_337178 - DIRECTION
      ?auto_337179 - MODE
      ?auto_337180 - DIRECTION
      ?auto_337181 - MODE
      ?auto_337182 - DIRECTION
      ?auto_337183 - MODE
    )
    :vars
    (
      ?auto_337191 - INSTRUMENT
      ?auto_337184 - SATELLITE
      ?auto_337185 - DIRECTION
      ?auto_337190 - INSTRUMENT
      ?auto_337187 - INSTRUMENT
      ?auto_337188 - INSTRUMENT
      ?auto_337189 - INSTRUMENT
      ?auto_337186 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_337177 ?auto_337174 ) ) ( not ( = ?auto_337178 ?auto_337174 ) ) ( not ( = ?auto_337178 ?auto_337177 ) ) ( not ( = ?auto_337180 ?auto_337174 ) ) ( not ( = ?auto_337180 ?auto_337177 ) ) ( not ( = ?auto_337180 ?auto_337178 ) ) ( not ( = ?auto_337182 ?auto_337174 ) ) ( not ( = ?auto_337182 ?auto_337177 ) ) ( not ( = ?auto_337182 ?auto_337178 ) ) ( not ( = ?auto_337182 ?auto_337180 ) ) ( ON_BOARD ?auto_337191 ?auto_337184 ) ( SUPPORTS ?auto_337191 ?auto_337179 ) ( not ( = ?auto_337178 ?auto_337185 ) ) ( CALIBRATION_TARGET ?auto_337191 ?auto_337185 ) ( not ( = ?auto_337185 ?auto_337177 ) ) ( ON_BOARD ?auto_337190 ?auto_337184 ) ( not ( = ?auto_337191 ?auto_337190 ) ) ( SUPPORTS ?auto_337190 ?auto_337176 ) ( CALIBRATION_TARGET ?auto_337190 ?auto_337185 ) ( not ( = ?auto_337185 ?auto_337182 ) ) ( ON_BOARD ?auto_337187 ?auto_337184 ) ( not ( = ?auto_337190 ?auto_337187 ) ) ( SUPPORTS ?auto_337187 ?auto_337183 ) ( CALIBRATION_TARGET ?auto_337187 ?auto_337185 ) ( not ( = ?auto_337185 ?auto_337180 ) ) ( ON_BOARD ?auto_337188 ?auto_337184 ) ( not ( = ?auto_337187 ?auto_337188 ) ) ( SUPPORTS ?auto_337188 ?auto_337181 ) ( CALIBRATION_TARGET ?auto_337188 ?auto_337185 ) ( not ( = ?auto_337185 ?auto_337174 ) ) ( ON_BOARD ?auto_337189 ?auto_337184 ) ( not ( = ?auto_337188 ?auto_337189 ) ) ( SUPPORTS ?auto_337189 ?auto_337175 ) ( CALIBRATION_TARGET ?auto_337189 ?auto_337185 ) ( POWER_AVAIL ?auto_337184 ) ( POINTING ?auto_337184 ?auto_337186 ) ( not ( = ?auto_337185 ?auto_337186 ) ) ( not ( = ?auto_337174 ?auto_337186 ) ) ( not ( = ?auto_337175 ?auto_337181 ) ) ( not ( = ?auto_337180 ?auto_337186 ) ) ( not ( = ?auto_337175 ?auto_337183 ) ) ( not ( = ?auto_337181 ?auto_337183 ) ) ( not ( = ?auto_337182 ?auto_337186 ) ) ( not ( = ?auto_337187 ?auto_337189 ) ) ( not ( = ?auto_337175 ?auto_337176 ) ) ( not ( = ?auto_337181 ?auto_337176 ) ) ( not ( = ?auto_337183 ?auto_337176 ) ) ( not ( = ?auto_337177 ?auto_337186 ) ) ( not ( = ?auto_337190 ?auto_337188 ) ) ( not ( = ?auto_337190 ?auto_337189 ) ) ( not ( = ?auto_337175 ?auto_337179 ) ) ( not ( = ?auto_337181 ?auto_337179 ) ) ( not ( = ?auto_337183 ?auto_337179 ) ) ( not ( = ?auto_337176 ?auto_337179 ) ) ( not ( = ?auto_337178 ?auto_337186 ) ) ( not ( = ?auto_337191 ?auto_337187 ) ) ( not ( = ?auto_337191 ?auto_337188 ) ) ( not ( = ?auto_337191 ?auto_337189 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_337174 ?auto_337175 ?auto_337180 ?auto_337181 ?auto_337182 ?auto_337183 ?auto_337178 ?auto_337179 ?auto_337177 ?auto_337176 )
      ( GET-5IMAGE-VERIFY ?auto_337174 ?auto_337175 ?auto_337177 ?auto_337176 ?auto_337178 ?auto_337179 ?auto_337180 ?auto_337181 ?auto_337182 ?auto_337183 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_337252 - DIRECTION
      ?auto_337253 - MODE
      ?auto_337255 - DIRECTION
      ?auto_337254 - MODE
      ?auto_337256 - DIRECTION
      ?auto_337257 - MODE
      ?auto_337258 - DIRECTION
      ?auto_337259 - MODE
      ?auto_337260 - DIRECTION
      ?auto_337261 - MODE
    )
    :vars
    (
      ?auto_337269 - INSTRUMENT
      ?auto_337262 - SATELLITE
      ?auto_337263 - DIRECTION
      ?auto_337268 - INSTRUMENT
      ?auto_337265 - INSTRUMENT
      ?auto_337266 - INSTRUMENT
      ?auto_337267 - INSTRUMENT
      ?auto_337264 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_337255 ?auto_337252 ) ) ( not ( = ?auto_337256 ?auto_337252 ) ) ( not ( = ?auto_337256 ?auto_337255 ) ) ( not ( = ?auto_337258 ?auto_337252 ) ) ( not ( = ?auto_337258 ?auto_337255 ) ) ( not ( = ?auto_337258 ?auto_337256 ) ) ( not ( = ?auto_337260 ?auto_337252 ) ) ( not ( = ?auto_337260 ?auto_337255 ) ) ( not ( = ?auto_337260 ?auto_337256 ) ) ( not ( = ?auto_337260 ?auto_337258 ) ) ( ON_BOARD ?auto_337269 ?auto_337262 ) ( SUPPORTS ?auto_337269 ?auto_337257 ) ( not ( = ?auto_337256 ?auto_337263 ) ) ( CALIBRATION_TARGET ?auto_337269 ?auto_337263 ) ( not ( = ?auto_337263 ?auto_337255 ) ) ( ON_BOARD ?auto_337268 ?auto_337262 ) ( not ( = ?auto_337269 ?auto_337268 ) ) ( SUPPORTS ?auto_337268 ?auto_337254 ) ( CALIBRATION_TARGET ?auto_337268 ?auto_337263 ) ( not ( = ?auto_337263 ?auto_337258 ) ) ( ON_BOARD ?auto_337265 ?auto_337262 ) ( not ( = ?auto_337268 ?auto_337265 ) ) ( SUPPORTS ?auto_337265 ?auto_337259 ) ( CALIBRATION_TARGET ?auto_337265 ?auto_337263 ) ( not ( = ?auto_337263 ?auto_337260 ) ) ( ON_BOARD ?auto_337266 ?auto_337262 ) ( not ( = ?auto_337265 ?auto_337266 ) ) ( SUPPORTS ?auto_337266 ?auto_337261 ) ( CALIBRATION_TARGET ?auto_337266 ?auto_337263 ) ( not ( = ?auto_337263 ?auto_337252 ) ) ( ON_BOARD ?auto_337267 ?auto_337262 ) ( not ( = ?auto_337266 ?auto_337267 ) ) ( SUPPORTS ?auto_337267 ?auto_337253 ) ( CALIBRATION_TARGET ?auto_337267 ?auto_337263 ) ( POWER_AVAIL ?auto_337262 ) ( POINTING ?auto_337262 ?auto_337264 ) ( not ( = ?auto_337263 ?auto_337264 ) ) ( not ( = ?auto_337252 ?auto_337264 ) ) ( not ( = ?auto_337253 ?auto_337261 ) ) ( not ( = ?auto_337260 ?auto_337264 ) ) ( not ( = ?auto_337253 ?auto_337259 ) ) ( not ( = ?auto_337261 ?auto_337259 ) ) ( not ( = ?auto_337258 ?auto_337264 ) ) ( not ( = ?auto_337265 ?auto_337267 ) ) ( not ( = ?auto_337253 ?auto_337254 ) ) ( not ( = ?auto_337261 ?auto_337254 ) ) ( not ( = ?auto_337259 ?auto_337254 ) ) ( not ( = ?auto_337255 ?auto_337264 ) ) ( not ( = ?auto_337268 ?auto_337266 ) ) ( not ( = ?auto_337268 ?auto_337267 ) ) ( not ( = ?auto_337253 ?auto_337257 ) ) ( not ( = ?auto_337261 ?auto_337257 ) ) ( not ( = ?auto_337259 ?auto_337257 ) ) ( not ( = ?auto_337254 ?auto_337257 ) ) ( not ( = ?auto_337256 ?auto_337264 ) ) ( not ( = ?auto_337269 ?auto_337265 ) ) ( not ( = ?auto_337269 ?auto_337266 ) ) ( not ( = ?auto_337269 ?auto_337267 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_337252 ?auto_337253 ?auto_337260 ?auto_337261 ?auto_337258 ?auto_337259 ?auto_337256 ?auto_337257 ?auto_337255 ?auto_337254 )
      ( GET-5IMAGE-VERIFY ?auto_337252 ?auto_337253 ?auto_337255 ?auto_337254 ?auto_337256 ?auto_337257 ?auto_337258 ?auto_337259 ?auto_337260 ?auto_337261 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_338360 - DIRECTION
      ?auto_338361 - MODE
      ?auto_338363 - DIRECTION
      ?auto_338362 - MODE
      ?auto_338364 - DIRECTION
      ?auto_338365 - MODE
      ?auto_338366 - DIRECTION
      ?auto_338367 - MODE
      ?auto_338368 - DIRECTION
      ?auto_338369 - MODE
    )
    :vars
    (
      ?auto_338377 - INSTRUMENT
      ?auto_338370 - SATELLITE
      ?auto_338371 - DIRECTION
      ?auto_338376 - INSTRUMENT
      ?auto_338373 - INSTRUMENT
      ?auto_338374 - INSTRUMENT
      ?auto_338375 - INSTRUMENT
      ?auto_338372 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_338363 ?auto_338360 ) ) ( not ( = ?auto_338364 ?auto_338360 ) ) ( not ( = ?auto_338364 ?auto_338363 ) ) ( not ( = ?auto_338366 ?auto_338360 ) ) ( not ( = ?auto_338366 ?auto_338363 ) ) ( not ( = ?auto_338366 ?auto_338364 ) ) ( not ( = ?auto_338368 ?auto_338360 ) ) ( not ( = ?auto_338368 ?auto_338363 ) ) ( not ( = ?auto_338368 ?auto_338364 ) ) ( not ( = ?auto_338368 ?auto_338366 ) ) ( ON_BOARD ?auto_338377 ?auto_338370 ) ( SUPPORTS ?auto_338377 ?auto_338362 ) ( not ( = ?auto_338363 ?auto_338371 ) ) ( CALIBRATION_TARGET ?auto_338377 ?auto_338371 ) ( not ( = ?auto_338371 ?auto_338368 ) ) ( ON_BOARD ?auto_338376 ?auto_338370 ) ( not ( = ?auto_338377 ?auto_338376 ) ) ( SUPPORTS ?auto_338376 ?auto_338369 ) ( CALIBRATION_TARGET ?auto_338376 ?auto_338371 ) ( not ( = ?auto_338371 ?auto_338366 ) ) ( ON_BOARD ?auto_338373 ?auto_338370 ) ( not ( = ?auto_338376 ?auto_338373 ) ) ( SUPPORTS ?auto_338373 ?auto_338367 ) ( CALIBRATION_TARGET ?auto_338373 ?auto_338371 ) ( not ( = ?auto_338371 ?auto_338364 ) ) ( ON_BOARD ?auto_338374 ?auto_338370 ) ( not ( = ?auto_338373 ?auto_338374 ) ) ( SUPPORTS ?auto_338374 ?auto_338365 ) ( CALIBRATION_TARGET ?auto_338374 ?auto_338371 ) ( not ( = ?auto_338371 ?auto_338360 ) ) ( ON_BOARD ?auto_338375 ?auto_338370 ) ( not ( = ?auto_338374 ?auto_338375 ) ) ( SUPPORTS ?auto_338375 ?auto_338361 ) ( CALIBRATION_TARGET ?auto_338375 ?auto_338371 ) ( POWER_AVAIL ?auto_338370 ) ( POINTING ?auto_338370 ?auto_338372 ) ( not ( = ?auto_338371 ?auto_338372 ) ) ( not ( = ?auto_338360 ?auto_338372 ) ) ( not ( = ?auto_338361 ?auto_338365 ) ) ( not ( = ?auto_338364 ?auto_338372 ) ) ( not ( = ?auto_338361 ?auto_338367 ) ) ( not ( = ?auto_338365 ?auto_338367 ) ) ( not ( = ?auto_338366 ?auto_338372 ) ) ( not ( = ?auto_338373 ?auto_338375 ) ) ( not ( = ?auto_338361 ?auto_338369 ) ) ( not ( = ?auto_338365 ?auto_338369 ) ) ( not ( = ?auto_338367 ?auto_338369 ) ) ( not ( = ?auto_338368 ?auto_338372 ) ) ( not ( = ?auto_338376 ?auto_338374 ) ) ( not ( = ?auto_338376 ?auto_338375 ) ) ( not ( = ?auto_338361 ?auto_338362 ) ) ( not ( = ?auto_338365 ?auto_338362 ) ) ( not ( = ?auto_338367 ?auto_338362 ) ) ( not ( = ?auto_338369 ?auto_338362 ) ) ( not ( = ?auto_338363 ?auto_338372 ) ) ( not ( = ?auto_338377 ?auto_338373 ) ) ( not ( = ?auto_338377 ?auto_338374 ) ) ( not ( = ?auto_338377 ?auto_338375 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_338360 ?auto_338361 ?auto_338364 ?auto_338365 ?auto_338366 ?auto_338367 ?auto_338363 ?auto_338362 ?auto_338368 ?auto_338369 )
      ( GET-5IMAGE-VERIFY ?auto_338360 ?auto_338361 ?auto_338363 ?auto_338362 ?auto_338364 ?auto_338365 ?auto_338366 ?auto_338367 ?auto_338368 ?auto_338369 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_338438 - DIRECTION
      ?auto_338439 - MODE
      ?auto_338441 - DIRECTION
      ?auto_338440 - MODE
      ?auto_338442 - DIRECTION
      ?auto_338443 - MODE
      ?auto_338444 - DIRECTION
      ?auto_338445 - MODE
      ?auto_338446 - DIRECTION
      ?auto_338447 - MODE
    )
    :vars
    (
      ?auto_338455 - INSTRUMENT
      ?auto_338448 - SATELLITE
      ?auto_338449 - DIRECTION
      ?auto_338454 - INSTRUMENT
      ?auto_338451 - INSTRUMENT
      ?auto_338452 - INSTRUMENT
      ?auto_338453 - INSTRUMENT
      ?auto_338450 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_338441 ?auto_338438 ) ) ( not ( = ?auto_338442 ?auto_338438 ) ) ( not ( = ?auto_338442 ?auto_338441 ) ) ( not ( = ?auto_338444 ?auto_338438 ) ) ( not ( = ?auto_338444 ?auto_338441 ) ) ( not ( = ?auto_338444 ?auto_338442 ) ) ( not ( = ?auto_338446 ?auto_338438 ) ) ( not ( = ?auto_338446 ?auto_338441 ) ) ( not ( = ?auto_338446 ?auto_338442 ) ) ( not ( = ?auto_338446 ?auto_338444 ) ) ( ON_BOARD ?auto_338455 ?auto_338448 ) ( SUPPORTS ?auto_338455 ?auto_338440 ) ( not ( = ?auto_338441 ?auto_338449 ) ) ( CALIBRATION_TARGET ?auto_338455 ?auto_338449 ) ( not ( = ?auto_338449 ?auto_338444 ) ) ( ON_BOARD ?auto_338454 ?auto_338448 ) ( not ( = ?auto_338455 ?auto_338454 ) ) ( SUPPORTS ?auto_338454 ?auto_338445 ) ( CALIBRATION_TARGET ?auto_338454 ?auto_338449 ) ( not ( = ?auto_338449 ?auto_338446 ) ) ( ON_BOARD ?auto_338451 ?auto_338448 ) ( not ( = ?auto_338454 ?auto_338451 ) ) ( SUPPORTS ?auto_338451 ?auto_338447 ) ( CALIBRATION_TARGET ?auto_338451 ?auto_338449 ) ( not ( = ?auto_338449 ?auto_338442 ) ) ( ON_BOARD ?auto_338452 ?auto_338448 ) ( not ( = ?auto_338451 ?auto_338452 ) ) ( SUPPORTS ?auto_338452 ?auto_338443 ) ( CALIBRATION_TARGET ?auto_338452 ?auto_338449 ) ( not ( = ?auto_338449 ?auto_338438 ) ) ( ON_BOARD ?auto_338453 ?auto_338448 ) ( not ( = ?auto_338452 ?auto_338453 ) ) ( SUPPORTS ?auto_338453 ?auto_338439 ) ( CALIBRATION_TARGET ?auto_338453 ?auto_338449 ) ( POWER_AVAIL ?auto_338448 ) ( POINTING ?auto_338448 ?auto_338450 ) ( not ( = ?auto_338449 ?auto_338450 ) ) ( not ( = ?auto_338438 ?auto_338450 ) ) ( not ( = ?auto_338439 ?auto_338443 ) ) ( not ( = ?auto_338442 ?auto_338450 ) ) ( not ( = ?auto_338439 ?auto_338447 ) ) ( not ( = ?auto_338443 ?auto_338447 ) ) ( not ( = ?auto_338446 ?auto_338450 ) ) ( not ( = ?auto_338451 ?auto_338453 ) ) ( not ( = ?auto_338439 ?auto_338445 ) ) ( not ( = ?auto_338443 ?auto_338445 ) ) ( not ( = ?auto_338447 ?auto_338445 ) ) ( not ( = ?auto_338444 ?auto_338450 ) ) ( not ( = ?auto_338454 ?auto_338452 ) ) ( not ( = ?auto_338454 ?auto_338453 ) ) ( not ( = ?auto_338439 ?auto_338440 ) ) ( not ( = ?auto_338443 ?auto_338440 ) ) ( not ( = ?auto_338447 ?auto_338440 ) ) ( not ( = ?auto_338445 ?auto_338440 ) ) ( not ( = ?auto_338441 ?auto_338450 ) ) ( not ( = ?auto_338455 ?auto_338451 ) ) ( not ( = ?auto_338455 ?auto_338452 ) ) ( not ( = ?auto_338455 ?auto_338453 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_338438 ?auto_338439 ?auto_338442 ?auto_338443 ?auto_338446 ?auto_338447 ?auto_338441 ?auto_338440 ?auto_338444 ?auto_338445 )
      ( GET-5IMAGE-VERIFY ?auto_338438 ?auto_338439 ?auto_338441 ?auto_338440 ?auto_338442 ?auto_338443 ?auto_338444 ?auto_338445 ?auto_338446 ?auto_338447 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_338768 - DIRECTION
      ?auto_338769 - MODE
      ?auto_338771 - DIRECTION
      ?auto_338770 - MODE
      ?auto_338772 - DIRECTION
      ?auto_338773 - MODE
      ?auto_338774 - DIRECTION
      ?auto_338775 - MODE
      ?auto_338776 - DIRECTION
      ?auto_338777 - MODE
    )
    :vars
    (
      ?auto_338785 - INSTRUMENT
      ?auto_338778 - SATELLITE
      ?auto_338779 - DIRECTION
      ?auto_338784 - INSTRUMENT
      ?auto_338781 - INSTRUMENT
      ?auto_338782 - INSTRUMENT
      ?auto_338783 - INSTRUMENT
      ?auto_338780 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_338771 ?auto_338768 ) ) ( not ( = ?auto_338772 ?auto_338768 ) ) ( not ( = ?auto_338772 ?auto_338771 ) ) ( not ( = ?auto_338774 ?auto_338768 ) ) ( not ( = ?auto_338774 ?auto_338771 ) ) ( not ( = ?auto_338774 ?auto_338772 ) ) ( not ( = ?auto_338776 ?auto_338768 ) ) ( not ( = ?auto_338776 ?auto_338771 ) ) ( not ( = ?auto_338776 ?auto_338772 ) ) ( not ( = ?auto_338776 ?auto_338774 ) ) ( ON_BOARD ?auto_338785 ?auto_338778 ) ( SUPPORTS ?auto_338785 ?auto_338770 ) ( not ( = ?auto_338771 ?auto_338779 ) ) ( CALIBRATION_TARGET ?auto_338785 ?auto_338779 ) ( not ( = ?auto_338779 ?auto_338776 ) ) ( ON_BOARD ?auto_338784 ?auto_338778 ) ( not ( = ?auto_338785 ?auto_338784 ) ) ( SUPPORTS ?auto_338784 ?auto_338777 ) ( CALIBRATION_TARGET ?auto_338784 ?auto_338779 ) ( not ( = ?auto_338779 ?auto_338772 ) ) ( ON_BOARD ?auto_338781 ?auto_338778 ) ( not ( = ?auto_338784 ?auto_338781 ) ) ( SUPPORTS ?auto_338781 ?auto_338773 ) ( CALIBRATION_TARGET ?auto_338781 ?auto_338779 ) ( not ( = ?auto_338779 ?auto_338774 ) ) ( ON_BOARD ?auto_338782 ?auto_338778 ) ( not ( = ?auto_338781 ?auto_338782 ) ) ( SUPPORTS ?auto_338782 ?auto_338775 ) ( CALIBRATION_TARGET ?auto_338782 ?auto_338779 ) ( not ( = ?auto_338779 ?auto_338768 ) ) ( ON_BOARD ?auto_338783 ?auto_338778 ) ( not ( = ?auto_338782 ?auto_338783 ) ) ( SUPPORTS ?auto_338783 ?auto_338769 ) ( CALIBRATION_TARGET ?auto_338783 ?auto_338779 ) ( POWER_AVAIL ?auto_338778 ) ( POINTING ?auto_338778 ?auto_338780 ) ( not ( = ?auto_338779 ?auto_338780 ) ) ( not ( = ?auto_338768 ?auto_338780 ) ) ( not ( = ?auto_338769 ?auto_338775 ) ) ( not ( = ?auto_338774 ?auto_338780 ) ) ( not ( = ?auto_338769 ?auto_338773 ) ) ( not ( = ?auto_338775 ?auto_338773 ) ) ( not ( = ?auto_338772 ?auto_338780 ) ) ( not ( = ?auto_338781 ?auto_338783 ) ) ( not ( = ?auto_338769 ?auto_338777 ) ) ( not ( = ?auto_338775 ?auto_338777 ) ) ( not ( = ?auto_338773 ?auto_338777 ) ) ( not ( = ?auto_338776 ?auto_338780 ) ) ( not ( = ?auto_338784 ?auto_338782 ) ) ( not ( = ?auto_338784 ?auto_338783 ) ) ( not ( = ?auto_338769 ?auto_338770 ) ) ( not ( = ?auto_338775 ?auto_338770 ) ) ( not ( = ?auto_338773 ?auto_338770 ) ) ( not ( = ?auto_338777 ?auto_338770 ) ) ( not ( = ?auto_338771 ?auto_338780 ) ) ( not ( = ?auto_338785 ?auto_338781 ) ) ( not ( = ?auto_338785 ?auto_338782 ) ) ( not ( = ?auto_338785 ?auto_338783 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_338768 ?auto_338769 ?auto_338774 ?auto_338775 ?auto_338772 ?auto_338773 ?auto_338771 ?auto_338770 ?auto_338776 ?auto_338777 )
      ( GET-5IMAGE-VERIFY ?auto_338768 ?auto_338769 ?auto_338771 ?auto_338770 ?auto_338772 ?auto_338773 ?auto_338774 ?auto_338775 ?auto_338776 ?auto_338777 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_338932 - DIRECTION
      ?auto_338933 - MODE
      ?auto_338935 - DIRECTION
      ?auto_338934 - MODE
      ?auto_338936 - DIRECTION
      ?auto_338937 - MODE
      ?auto_338938 - DIRECTION
      ?auto_338939 - MODE
      ?auto_338940 - DIRECTION
      ?auto_338941 - MODE
    )
    :vars
    (
      ?auto_338949 - INSTRUMENT
      ?auto_338942 - SATELLITE
      ?auto_338943 - DIRECTION
      ?auto_338948 - INSTRUMENT
      ?auto_338945 - INSTRUMENT
      ?auto_338946 - INSTRUMENT
      ?auto_338947 - INSTRUMENT
      ?auto_338944 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_338935 ?auto_338932 ) ) ( not ( = ?auto_338936 ?auto_338932 ) ) ( not ( = ?auto_338936 ?auto_338935 ) ) ( not ( = ?auto_338938 ?auto_338932 ) ) ( not ( = ?auto_338938 ?auto_338935 ) ) ( not ( = ?auto_338938 ?auto_338936 ) ) ( not ( = ?auto_338940 ?auto_338932 ) ) ( not ( = ?auto_338940 ?auto_338935 ) ) ( not ( = ?auto_338940 ?auto_338936 ) ) ( not ( = ?auto_338940 ?auto_338938 ) ) ( ON_BOARD ?auto_338949 ?auto_338942 ) ( SUPPORTS ?auto_338949 ?auto_338934 ) ( not ( = ?auto_338935 ?auto_338943 ) ) ( CALIBRATION_TARGET ?auto_338949 ?auto_338943 ) ( not ( = ?auto_338943 ?auto_338938 ) ) ( ON_BOARD ?auto_338948 ?auto_338942 ) ( not ( = ?auto_338949 ?auto_338948 ) ) ( SUPPORTS ?auto_338948 ?auto_338939 ) ( CALIBRATION_TARGET ?auto_338948 ?auto_338943 ) ( not ( = ?auto_338943 ?auto_338936 ) ) ( ON_BOARD ?auto_338945 ?auto_338942 ) ( not ( = ?auto_338948 ?auto_338945 ) ) ( SUPPORTS ?auto_338945 ?auto_338937 ) ( CALIBRATION_TARGET ?auto_338945 ?auto_338943 ) ( not ( = ?auto_338943 ?auto_338940 ) ) ( ON_BOARD ?auto_338946 ?auto_338942 ) ( not ( = ?auto_338945 ?auto_338946 ) ) ( SUPPORTS ?auto_338946 ?auto_338941 ) ( CALIBRATION_TARGET ?auto_338946 ?auto_338943 ) ( not ( = ?auto_338943 ?auto_338932 ) ) ( ON_BOARD ?auto_338947 ?auto_338942 ) ( not ( = ?auto_338946 ?auto_338947 ) ) ( SUPPORTS ?auto_338947 ?auto_338933 ) ( CALIBRATION_TARGET ?auto_338947 ?auto_338943 ) ( POWER_AVAIL ?auto_338942 ) ( POINTING ?auto_338942 ?auto_338944 ) ( not ( = ?auto_338943 ?auto_338944 ) ) ( not ( = ?auto_338932 ?auto_338944 ) ) ( not ( = ?auto_338933 ?auto_338941 ) ) ( not ( = ?auto_338940 ?auto_338944 ) ) ( not ( = ?auto_338933 ?auto_338937 ) ) ( not ( = ?auto_338941 ?auto_338937 ) ) ( not ( = ?auto_338936 ?auto_338944 ) ) ( not ( = ?auto_338945 ?auto_338947 ) ) ( not ( = ?auto_338933 ?auto_338939 ) ) ( not ( = ?auto_338941 ?auto_338939 ) ) ( not ( = ?auto_338937 ?auto_338939 ) ) ( not ( = ?auto_338938 ?auto_338944 ) ) ( not ( = ?auto_338948 ?auto_338946 ) ) ( not ( = ?auto_338948 ?auto_338947 ) ) ( not ( = ?auto_338933 ?auto_338934 ) ) ( not ( = ?auto_338941 ?auto_338934 ) ) ( not ( = ?auto_338937 ?auto_338934 ) ) ( not ( = ?auto_338939 ?auto_338934 ) ) ( not ( = ?auto_338935 ?auto_338944 ) ) ( not ( = ?auto_338949 ?auto_338945 ) ) ( not ( = ?auto_338949 ?auto_338946 ) ) ( not ( = ?auto_338949 ?auto_338947 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_338932 ?auto_338933 ?auto_338940 ?auto_338941 ?auto_338936 ?auto_338937 ?auto_338935 ?auto_338934 ?auto_338938 ?auto_338939 )
      ( GET-5IMAGE-VERIFY ?auto_338932 ?auto_338933 ?auto_338935 ?auto_338934 ?auto_338936 ?auto_338937 ?auto_338938 ?auto_338939 ?auto_338940 ?auto_338941 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_339262 - DIRECTION
      ?auto_339263 - MODE
      ?auto_339265 - DIRECTION
      ?auto_339264 - MODE
      ?auto_339266 - DIRECTION
      ?auto_339267 - MODE
      ?auto_339268 - DIRECTION
      ?auto_339269 - MODE
      ?auto_339270 - DIRECTION
      ?auto_339271 - MODE
    )
    :vars
    (
      ?auto_339279 - INSTRUMENT
      ?auto_339272 - SATELLITE
      ?auto_339273 - DIRECTION
      ?auto_339278 - INSTRUMENT
      ?auto_339275 - INSTRUMENT
      ?auto_339276 - INSTRUMENT
      ?auto_339277 - INSTRUMENT
      ?auto_339274 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_339265 ?auto_339262 ) ) ( not ( = ?auto_339266 ?auto_339262 ) ) ( not ( = ?auto_339266 ?auto_339265 ) ) ( not ( = ?auto_339268 ?auto_339262 ) ) ( not ( = ?auto_339268 ?auto_339265 ) ) ( not ( = ?auto_339268 ?auto_339266 ) ) ( not ( = ?auto_339270 ?auto_339262 ) ) ( not ( = ?auto_339270 ?auto_339265 ) ) ( not ( = ?auto_339270 ?auto_339266 ) ) ( not ( = ?auto_339270 ?auto_339268 ) ) ( ON_BOARD ?auto_339279 ?auto_339272 ) ( SUPPORTS ?auto_339279 ?auto_339264 ) ( not ( = ?auto_339265 ?auto_339273 ) ) ( CALIBRATION_TARGET ?auto_339279 ?auto_339273 ) ( not ( = ?auto_339273 ?auto_339266 ) ) ( ON_BOARD ?auto_339278 ?auto_339272 ) ( not ( = ?auto_339279 ?auto_339278 ) ) ( SUPPORTS ?auto_339278 ?auto_339267 ) ( CALIBRATION_TARGET ?auto_339278 ?auto_339273 ) ( not ( = ?auto_339273 ?auto_339270 ) ) ( ON_BOARD ?auto_339275 ?auto_339272 ) ( not ( = ?auto_339278 ?auto_339275 ) ) ( SUPPORTS ?auto_339275 ?auto_339271 ) ( CALIBRATION_TARGET ?auto_339275 ?auto_339273 ) ( not ( = ?auto_339273 ?auto_339268 ) ) ( ON_BOARD ?auto_339276 ?auto_339272 ) ( not ( = ?auto_339275 ?auto_339276 ) ) ( SUPPORTS ?auto_339276 ?auto_339269 ) ( CALIBRATION_TARGET ?auto_339276 ?auto_339273 ) ( not ( = ?auto_339273 ?auto_339262 ) ) ( ON_BOARD ?auto_339277 ?auto_339272 ) ( not ( = ?auto_339276 ?auto_339277 ) ) ( SUPPORTS ?auto_339277 ?auto_339263 ) ( CALIBRATION_TARGET ?auto_339277 ?auto_339273 ) ( POWER_AVAIL ?auto_339272 ) ( POINTING ?auto_339272 ?auto_339274 ) ( not ( = ?auto_339273 ?auto_339274 ) ) ( not ( = ?auto_339262 ?auto_339274 ) ) ( not ( = ?auto_339263 ?auto_339269 ) ) ( not ( = ?auto_339268 ?auto_339274 ) ) ( not ( = ?auto_339263 ?auto_339271 ) ) ( not ( = ?auto_339269 ?auto_339271 ) ) ( not ( = ?auto_339270 ?auto_339274 ) ) ( not ( = ?auto_339275 ?auto_339277 ) ) ( not ( = ?auto_339263 ?auto_339267 ) ) ( not ( = ?auto_339269 ?auto_339267 ) ) ( not ( = ?auto_339271 ?auto_339267 ) ) ( not ( = ?auto_339266 ?auto_339274 ) ) ( not ( = ?auto_339278 ?auto_339276 ) ) ( not ( = ?auto_339278 ?auto_339277 ) ) ( not ( = ?auto_339263 ?auto_339264 ) ) ( not ( = ?auto_339269 ?auto_339264 ) ) ( not ( = ?auto_339271 ?auto_339264 ) ) ( not ( = ?auto_339267 ?auto_339264 ) ) ( not ( = ?auto_339265 ?auto_339274 ) ) ( not ( = ?auto_339279 ?auto_339275 ) ) ( not ( = ?auto_339279 ?auto_339276 ) ) ( not ( = ?auto_339279 ?auto_339277 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_339262 ?auto_339263 ?auto_339268 ?auto_339269 ?auto_339270 ?auto_339271 ?auto_339265 ?auto_339264 ?auto_339266 ?auto_339267 )
      ( GET-5IMAGE-VERIFY ?auto_339262 ?auto_339263 ?auto_339265 ?auto_339264 ?auto_339266 ?auto_339267 ?auto_339268 ?auto_339269 ?auto_339270 ?auto_339271 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_339340 - DIRECTION
      ?auto_339341 - MODE
      ?auto_339343 - DIRECTION
      ?auto_339342 - MODE
      ?auto_339344 - DIRECTION
      ?auto_339345 - MODE
      ?auto_339346 - DIRECTION
      ?auto_339347 - MODE
      ?auto_339348 - DIRECTION
      ?auto_339349 - MODE
    )
    :vars
    (
      ?auto_339357 - INSTRUMENT
      ?auto_339350 - SATELLITE
      ?auto_339351 - DIRECTION
      ?auto_339356 - INSTRUMENT
      ?auto_339353 - INSTRUMENT
      ?auto_339354 - INSTRUMENT
      ?auto_339355 - INSTRUMENT
      ?auto_339352 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_339343 ?auto_339340 ) ) ( not ( = ?auto_339344 ?auto_339340 ) ) ( not ( = ?auto_339344 ?auto_339343 ) ) ( not ( = ?auto_339346 ?auto_339340 ) ) ( not ( = ?auto_339346 ?auto_339343 ) ) ( not ( = ?auto_339346 ?auto_339344 ) ) ( not ( = ?auto_339348 ?auto_339340 ) ) ( not ( = ?auto_339348 ?auto_339343 ) ) ( not ( = ?auto_339348 ?auto_339344 ) ) ( not ( = ?auto_339348 ?auto_339346 ) ) ( ON_BOARD ?auto_339357 ?auto_339350 ) ( SUPPORTS ?auto_339357 ?auto_339342 ) ( not ( = ?auto_339343 ?auto_339351 ) ) ( CALIBRATION_TARGET ?auto_339357 ?auto_339351 ) ( not ( = ?auto_339351 ?auto_339344 ) ) ( ON_BOARD ?auto_339356 ?auto_339350 ) ( not ( = ?auto_339357 ?auto_339356 ) ) ( SUPPORTS ?auto_339356 ?auto_339345 ) ( CALIBRATION_TARGET ?auto_339356 ?auto_339351 ) ( not ( = ?auto_339351 ?auto_339346 ) ) ( ON_BOARD ?auto_339353 ?auto_339350 ) ( not ( = ?auto_339356 ?auto_339353 ) ) ( SUPPORTS ?auto_339353 ?auto_339347 ) ( CALIBRATION_TARGET ?auto_339353 ?auto_339351 ) ( not ( = ?auto_339351 ?auto_339348 ) ) ( ON_BOARD ?auto_339354 ?auto_339350 ) ( not ( = ?auto_339353 ?auto_339354 ) ) ( SUPPORTS ?auto_339354 ?auto_339349 ) ( CALIBRATION_TARGET ?auto_339354 ?auto_339351 ) ( not ( = ?auto_339351 ?auto_339340 ) ) ( ON_BOARD ?auto_339355 ?auto_339350 ) ( not ( = ?auto_339354 ?auto_339355 ) ) ( SUPPORTS ?auto_339355 ?auto_339341 ) ( CALIBRATION_TARGET ?auto_339355 ?auto_339351 ) ( POWER_AVAIL ?auto_339350 ) ( POINTING ?auto_339350 ?auto_339352 ) ( not ( = ?auto_339351 ?auto_339352 ) ) ( not ( = ?auto_339340 ?auto_339352 ) ) ( not ( = ?auto_339341 ?auto_339349 ) ) ( not ( = ?auto_339348 ?auto_339352 ) ) ( not ( = ?auto_339341 ?auto_339347 ) ) ( not ( = ?auto_339349 ?auto_339347 ) ) ( not ( = ?auto_339346 ?auto_339352 ) ) ( not ( = ?auto_339353 ?auto_339355 ) ) ( not ( = ?auto_339341 ?auto_339345 ) ) ( not ( = ?auto_339349 ?auto_339345 ) ) ( not ( = ?auto_339347 ?auto_339345 ) ) ( not ( = ?auto_339344 ?auto_339352 ) ) ( not ( = ?auto_339356 ?auto_339354 ) ) ( not ( = ?auto_339356 ?auto_339355 ) ) ( not ( = ?auto_339341 ?auto_339342 ) ) ( not ( = ?auto_339349 ?auto_339342 ) ) ( not ( = ?auto_339347 ?auto_339342 ) ) ( not ( = ?auto_339345 ?auto_339342 ) ) ( not ( = ?auto_339343 ?auto_339352 ) ) ( not ( = ?auto_339357 ?auto_339353 ) ) ( not ( = ?auto_339357 ?auto_339354 ) ) ( not ( = ?auto_339357 ?auto_339355 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_339340 ?auto_339341 ?auto_339348 ?auto_339349 ?auto_339346 ?auto_339347 ?auto_339343 ?auto_339342 ?auto_339344 ?auto_339345 )
      ( GET-5IMAGE-VERIFY ?auto_339340 ?auto_339341 ?auto_339343 ?auto_339342 ?auto_339344 ?auto_339345 ?auto_339346 ?auto_339347 ?auto_339348 ?auto_339349 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_340616 - DIRECTION
      ?auto_340617 - MODE
      ?auto_340619 - DIRECTION
      ?auto_340618 - MODE
      ?auto_340620 - DIRECTION
      ?auto_340621 - MODE
      ?auto_340622 - DIRECTION
      ?auto_340623 - MODE
      ?auto_340624 - DIRECTION
      ?auto_340625 - MODE
    )
    :vars
    (
      ?auto_340633 - INSTRUMENT
      ?auto_340626 - SATELLITE
      ?auto_340627 - DIRECTION
      ?auto_340632 - INSTRUMENT
      ?auto_340629 - INSTRUMENT
      ?auto_340630 - INSTRUMENT
      ?auto_340631 - INSTRUMENT
      ?auto_340628 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_340619 ?auto_340616 ) ) ( not ( = ?auto_340620 ?auto_340616 ) ) ( not ( = ?auto_340620 ?auto_340619 ) ) ( not ( = ?auto_340622 ?auto_340616 ) ) ( not ( = ?auto_340622 ?auto_340619 ) ) ( not ( = ?auto_340622 ?auto_340620 ) ) ( not ( = ?auto_340624 ?auto_340616 ) ) ( not ( = ?auto_340624 ?auto_340619 ) ) ( not ( = ?auto_340624 ?auto_340620 ) ) ( not ( = ?auto_340624 ?auto_340622 ) ) ( ON_BOARD ?auto_340633 ?auto_340626 ) ( SUPPORTS ?auto_340633 ?auto_340625 ) ( not ( = ?auto_340624 ?auto_340627 ) ) ( CALIBRATION_TARGET ?auto_340633 ?auto_340627 ) ( not ( = ?auto_340627 ?auto_340622 ) ) ( ON_BOARD ?auto_340632 ?auto_340626 ) ( not ( = ?auto_340633 ?auto_340632 ) ) ( SUPPORTS ?auto_340632 ?auto_340623 ) ( CALIBRATION_TARGET ?auto_340632 ?auto_340627 ) ( not ( = ?auto_340627 ?auto_340620 ) ) ( ON_BOARD ?auto_340629 ?auto_340626 ) ( not ( = ?auto_340632 ?auto_340629 ) ) ( SUPPORTS ?auto_340629 ?auto_340621 ) ( CALIBRATION_TARGET ?auto_340629 ?auto_340627 ) ( not ( = ?auto_340627 ?auto_340616 ) ) ( ON_BOARD ?auto_340630 ?auto_340626 ) ( not ( = ?auto_340629 ?auto_340630 ) ) ( SUPPORTS ?auto_340630 ?auto_340617 ) ( CALIBRATION_TARGET ?auto_340630 ?auto_340627 ) ( not ( = ?auto_340627 ?auto_340619 ) ) ( ON_BOARD ?auto_340631 ?auto_340626 ) ( not ( = ?auto_340630 ?auto_340631 ) ) ( SUPPORTS ?auto_340631 ?auto_340618 ) ( CALIBRATION_TARGET ?auto_340631 ?auto_340627 ) ( POWER_AVAIL ?auto_340626 ) ( POINTING ?auto_340626 ?auto_340628 ) ( not ( = ?auto_340627 ?auto_340628 ) ) ( not ( = ?auto_340619 ?auto_340628 ) ) ( not ( = ?auto_340618 ?auto_340617 ) ) ( not ( = ?auto_340616 ?auto_340628 ) ) ( not ( = ?auto_340618 ?auto_340621 ) ) ( not ( = ?auto_340617 ?auto_340621 ) ) ( not ( = ?auto_340620 ?auto_340628 ) ) ( not ( = ?auto_340629 ?auto_340631 ) ) ( not ( = ?auto_340618 ?auto_340623 ) ) ( not ( = ?auto_340617 ?auto_340623 ) ) ( not ( = ?auto_340621 ?auto_340623 ) ) ( not ( = ?auto_340622 ?auto_340628 ) ) ( not ( = ?auto_340632 ?auto_340630 ) ) ( not ( = ?auto_340632 ?auto_340631 ) ) ( not ( = ?auto_340618 ?auto_340625 ) ) ( not ( = ?auto_340617 ?auto_340625 ) ) ( not ( = ?auto_340621 ?auto_340625 ) ) ( not ( = ?auto_340623 ?auto_340625 ) ) ( not ( = ?auto_340624 ?auto_340628 ) ) ( not ( = ?auto_340633 ?auto_340629 ) ) ( not ( = ?auto_340633 ?auto_340630 ) ) ( not ( = ?auto_340633 ?auto_340631 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_340619 ?auto_340618 ?auto_340616 ?auto_340617 ?auto_340620 ?auto_340621 ?auto_340624 ?auto_340625 ?auto_340622 ?auto_340623 )
      ( GET-5IMAGE-VERIFY ?auto_340616 ?auto_340617 ?auto_340619 ?auto_340618 ?auto_340620 ?auto_340621 ?auto_340622 ?auto_340623 ?auto_340624 ?auto_340625 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_340694 - DIRECTION
      ?auto_340695 - MODE
      ?auto_340697 - DIRECTION
      ?auto_340696 - MODE
      ?auto_340698 - DIRECTION
      ?auto_340699 - MODE
      ?auto_340700 - DIRECTION
      ?auto_340701 - MODE
      ?auto_340702 - DIRECTION
      ?auto_340703 - MODE
    )
    :vars
    (
      ?auto_340711 - INSTRUMENT
      ?auto_340704 - SATELLITE
      ?auto_340705 - DIRECTION
      ?auto_340710 - INSTRUMENT
      ?auto_340707 - INSTRUMENT
      ?auto_340708 - INSTRUMENT
      ?auto_340709 - INSTRUMENT
      ?auto_340706 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_340697 ?auto_340694 ) ) ( not ( = ?auto_340698 ?auto_340694 ) ) ( not ( = ?auto_340698 ?auto_340697 ) ) ( not ( = ?auto_340700 ?auto_340694 ) ) ( not ( = ?auto_340700 ?auto_340697 ) ) ( not ( = ?auto_340700 ?auto_340698 ) ) ( not ( = ?auto_340702 ?auto_340694 ) ) ( not ( = ?auto_340702 ?auto_340697 ) ) ( not ( = ?auto_340702 ?auto_340698 ) ) ( not ( = ?auto_340702 ?auto_340700 ) ) ( ON_BOARD ?auto_340711 ?auto_340704 ) ( SUPPORTS ?auto_340711 ?auto_340701 ) ( not ( = ?auto_340700 ?auto_340705 ) ) ( CALIBRATION_TARGET ?auto_340711 ?auto_340705 ) ( not ( = ?auto_340705 ?auto_340702 ) ) ( ON_BOARD ?auto_340710 ?auto_340704 ) ( not ( = ?auto_340711 ?auto_340710 ) ) ( SUPPORTS ?auto_340710 ?auto_340703 ) ( CALIBRATION_TARGET ?auto_340710 ?auto_340705 ) ( not ( = ?auto_340705 ?auto_340698 ) ) ( ON_BOARD ?auto_340707 ?auto_340704 ) ( not ( = ?auto_340710 ?auto_340707 ) ) ( SUPPORTS ?auto_340707 ?auto_340699 ) ( CALIBRATION_TARGET ?auto_340707 ?auto_340705 ) ( not ( = ?auto_340705 ?auto_340694 ) ) ( ON_BOARD ?auto_340708 ?auto_340704 ) ( not ( = ?auto_340707 ?auto_340708 ) ) ( SUPPORTS ?auto_340708 ?auto_340695 ) ( CALIBRATION_TARGET ?auto_340708 ?auto_340705 ) ( not ( = ?auto_340705 ?auto_340697 ) ) ( ON_BOARD ?auto_340709 ?auto_340704 ) ( not ( = ?auto_340708 ?auto_340709 ) ) ( SUPPORTS ?auto_340709 ?auto_340696 ) ( CALIBRATION_TARGET ?auto_340709 ?auto_340705 ) ( POWER_AVAIL ?auto_340704 ) ( POINTING ?auto_340704 ?auto_340706 ) ( not ( = ?auto_340705 ?auto_340706 ) ) ( not ( = ?auto_340697 ?auto_340706 ) ) ( not ( = ?auto_340696 ?auto_340695 ) ) ( not ( = ?auto_340694 ?auto_340706 ) ) ( not ( = ?auto_340696 ?auto_340699 ) ) ( not ( = ?auto_340695 ?auto_340699 ) ) ( not ( = ?auto_340698 ?auto_340706 ) ) ( not ( = ?auto_340707 ?auto_340709 ) ) ( not ( = ?auto_340696 ?auto_340703 ) ) ( not ( = ?auto_340695 ?auto_340703 ) ) ( not ( = ?auto_340699 ?auto_340703 ) ) ( not ( = ?auto_340702 ?auto_340706 ) ) ( not ( = ?auto_340710 ?auto_340708 ) ) ( not ( = ?auto_340710 ?auto_340709 ) ) ( not ( = ?auto_340696 ?auto_340701 ) ) ( not ( = ?auto_340695 ?auto_340701 ) ) ( not ( = ?auto_340699 ?auto_340701 ) ) ( not ( = ?auto_340703 ?auto_340701 ) ) ( not ( = ?auto_340700 ?auto_340706 ) ) ( not ( = ?auto_340711 ?auto_340707 ) ) ( not ( = ?auto_340711 ?auto_340708 ) ) ( not ( = ?auto_340711 ?auto_340709 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_340697 ?auto_340696 ?auto_340694 ?auto_340695 ?auto_340698 ?auto_340699 ?auto_340700 ?auto_340701 ?auto_340702 ?auto_340703 )
      ( GET-5IMAGE-VERIFY ?auto_340694 ?auto_340695 ?auto_340697 ?auto_340696 ?auto_340698 ?auto_340699 ?auto_340700 ?auto_340701 ?auto_340702 ?auto_340703 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_340772 - DIRECTION
      ?auto_340773 - MODE
      ?auto_340775 - DIRECTION
      ?auto_340774 - MODE
      ?auto_340776 - DIRECTION
      ?auto_340777 - MODE
      ?auto_340778 - DIRECTION
      ?auto_340779 - MODE
      ?auto_340780 - DIRECTION
      ?auto_340781 - MODE
    )
    :vars
    (
      ?auto_340789 - INSTRUMENT
      ?auto_340782 - SATELLITE
      ?auto_340783 - DIRECTION
      ?auto_340788 - INSTRUMENT
      ?auto_340785 - INSTRUMENT
      ?auto_340786 - INSTRUMENT
      ?auto_340787 - INSTRUMENT
      ?auto_340784 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_340775 ?auto_340772 ) ) ( not ( = ?auto_340776 ?auto_340772 ) ) ( not ( = ?auto_340776 ?auto_340775 ) ) ( not ( = ?auto_340778 ?auto_340772 ) ) ( not ( = ?auto_340778 ?auto_340775 ) ) ( not ( = ?auto_340778 ?auto_340776 ) ) ( not ( = ?auto_340780 ?auto_340772 ) ) ( not ( = ?auto_340780 ?auto_340775 ) ) ( not ( = ?auto_340780 ?auto_340776 ) ) ( not ( = ?auto_340780 ?auto_340778 ) ) ( ON_BOARD ?auto_340789 ?auto_340782 ) ( SUPPORTS ?auto_340789 ?auto_340781 ) ( not ( = ?auto_340780 ?auto_340783 ) ) ( CALIBRATION_TARGET ?auto_340789 ?auto_340783 ) ( not ( = ?auto_340783 ?auto_340776 ) ) ( ON_BOARD ?auto_340788 ?auto_340782 ) ( not ( = ?auto_340789 ?auto_340788 ) ) ( SUPPORTS ?auto_340788 ?auto_340777 ) ( CALIBRATION_TARGET ?auto_340788 ?auto_340783 ) ( not ( = ?auto_340783 ?auto_340778 ) ) ( ON_BOARD ?auto_340785 ?auto_340782 ) ( not ( = ?auto_340788 ?auto_340785 ) ) ( SUPPORTS ?auto_340785 ?auto_340779 ) ( CALIBRATION_TARGET ?auto_340785 ?auto_340783 ) ( not ( = ?auto_340783 ?auto_340772 ) ) ( ON_BOARD ?auto_340786 ?auto_340782 ) ( not ( = ?auto_340785 ?auto_340786 ) ) ( SUPPORTS ?auto_340786 ?auto_340773 ) ( CALIBRATION_TARGET ?auto_340786 ?auto_340783 ) ( not ( = ?auto_340783 ?auto_340775 ) ) ( ON_BOARD ?auto_340787 ?auto_340782 ) ( not ( = ?auto_340786 ?auto_340787 ) ) ( SUPPORTS ?auto_340787 ?auto_340774 ) ( CALIBRATION_TARGET ?auto_340787 ?auto_340783 ) ( POWER_AVAIL ?auto_340782 ) ( POINTING ?auto_340782 ?auto_340784 ) ( not ( = ?auto_340783 ?auto_340784 ) ) ( not ( = ?auto_340775 ?auto_340784 ) ) ( not ( = ?auto_340774 ?auto_340773 ) ) ( not ( = ?auto_340772 ?auto_340784 ) ) ( not ( = ?auto_340774 ?auto_340779 ) ) ( not ( = ?auto_340773 ?auto_340779 ) ) ( not ( = ?auto_340778 ?auto_340784 ) ) ( not ( = ?auto_340785 ?auto_340787 ) ) ( not ( = ?auto_340774 ?auto_340777 ) ) ( not ( = ?auto_340773 ?auto_340777 ) ) ( not ( = ?auto_340779 ?auto_340777 ) ) ( not ( = ?auto_340776 ?auto_340784 ) ) ( not ( = ?auto_340788 ?auto_340786 ) ) ( not ( = ?auto_340788 ?auto_340787 ) ) ( not ( = ?auto_340774 ?auto_340781 ) ) ( not ( = ?auto_340773 ?auto_340781 ) ) ( not ( = ?auto_340779 ?auto_340781 ) ) ( not ( = ?auto_340777 ?auto_340781 ) ) ( not ( = ?auto_340780 ?auto_340784 ) ) ( not ( = ?auto_340789 ?auto_340785 ) ) ( not ( = ?auto_340789 ?auto_340786 ) ) ( not ( = ?auto_340789 ?auto_340787 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_340775 ?auto_340774 ?auto_340772 ?auto_340773 ?auto_340778 ?auto_340779 ?auto_340780 ?auto_340781 ?auto_340776 ?auto_340777 )
      ( GET-5IMAGE-VERIFY ?auto_340772 ?auto_340773 ?auto_340775 ?auto_340774 ?auto_340776 ?auto_340777 ?auto_340778 ?auto_340779 ?auto_340780 ?auto_340781 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_340850 - DIRECTION
      ?auto_340851 - MODE
      ?auto_340853 - DIRECTION
      ?auto_340852 - MODE
      ?auto_340854 - DIRECTION
      ?auto_340855 - MODE
      ?auto_340856 - DIRECTION
      ?auto_340857 - MODE
      ?auto_340858 - DIRECTION
      ?auto_340859 - MODE
    )
    :vars
    (
      ?auto_340867 - INSTRUMENT
      ?auto_340860 - SATELLITE
      ?auto_340861 - DIRECTION
      ?auto_340866 - INSTRUMENT
      ?auto_340863 - INSTRUMENT
      ?auto_340864 - INSTRUMENT
      ?auto_340865 - INSTRUMENT
      ?auto_340862 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_340853 ?auto_340850 ) ) ( not ( = ?auto_340854 ?auto_340850 ) ) ( not ( = ?auto_340854 ?auto_340853 ) ) ( not ( = ?auto_340856 ?auto_340850 ) ) ( not ( = ?auto_340856 ?auto_340853 ) ) ( not ( = ?auto_340856 ?auto_340854 ) ) ( not ( = ?auto_340858 ?auto_340850 ) ) ( not ( = ?auto_340858 ?auto_340853 ) ) ( not ( = ?auto_340858 ?auto_340854 ) ) ( not ( = ?auto_340858 ?auto_340856 ) ) ( ON_BOARD ?auto_340867 ?auto_340860 ) ( SUPPORTS ?auto_340867 ?auto_340857 ) ( not ( = ?auto_340856 ?auto_340861 ) ) ( CALIBRATION_TARGET ?auto_340867 ?auto_340861 ) ( not ( = ?auto_340861 ?auto_340854 ) ) ( ON_BOARD ?auto_340866 ?auto_340860 ) ( not ( = ?auto_340867 ?auto_340866 ) ) ( SUPPORTS ?auto_340866 ?auto_340855 ) ( CALIBRATION_TARGET ?auto_340866 ?auto_340861 ) ( not ( = ?auto_340861 ?auto_340858 ) ) ( ON_BOARD ?auto_340863 ?auto_340860 ) ( not ( = ?auto_340866 ?auto_340863 ) ) ( SUPPORTS ?auto_340863 ?auto_340859 ) ( CALIBRATION_TARGET ?auto_340863 ?auto_340861 ) ( not ( = ?auto_340861 ?auto_340850 ) ) ( ON_BOARD ?auto_340864 ?auto_340860 ) ( not ( = ?auto_340863 ?auto_340864 ) ) ( SUPPORTS ?auto_340864 ?auto_340851 ) ( CALIBRATION_TARGET ?auto_340864 ?auto_340861 ) ( not ( = ?auto_340861 ?auto_340853 ) ) ( ON_BOARD ?auto_340865 ?auto_340860 ) ( not ( = ?auto_340864 ?auto_340865 ) ) ( SUPPORTS ?auto_340865 ?auto_340852 ) ( CALIBRATION_TARGET ?auto_340865 ?auto_340861 ) ( POWER_AVAIL ?auto_340860 ) ( POINTING ?auto_340860 ?auto_340862 ) ( not ( = ?auto_340861 ?auto_340862 ) ) ( not ( = ?auto_340853 ?auto_340862 ) ) ( not ( = ?auto_340852 ?auto_340851 ) ) ( not ( = ?auto_340850 ?auto_340862 ) ) ( not ( = ?auto_340852 ?auto_340859 ) ) ( not ( = ?auto_340851 ?auto_340859 ) ) ( not ( = ?auto_340858 ?auto_340862 ) ) ( not ( = ?auto_340863 ?auto_340865 ) ) ( not ( = ?auto_340852 ?auto_340855 ) ) ( not ( = ?auto_340851 ?auto_340855 ) ) ( not ( = ?auto_340859 ?auto_340855 ) ) ( not ( = ?auto_340854 ?auto_340862 ) ) ( not ( = ?auto_340866 ?auto_340864 ) ) ( not ( = ?auto_340866 ?auto_340865 ) ) ( not ( = ?auto_340852 ?auto_340857 ) ) ( not ( = ?auto_340851 ?auto_340857 ) ) ( not ( = ?auto_340859 ?auto_340857 ) ) ( not ( = ?auto_340855 ?auto_340857 ) ) ( not ( = ?auto_340856 ?auto_340862 ) ) ( not ( = ?auto_340867 ?auto_340863 ) ) ( not ( = ?auto_340867 ?auto_340864 ) ) ( not ( = ?auto_340867 ?auto_340865 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_340853 ?auto_340852 ?auto_340850 ?auto_340851 ?auto_340858 ?auto_340859 ?auto_340856 ?auto_340857 ?auto_340854 ?auto_340855 )
      ( GET-5IMAGE-VERIFY ?auto_340850 ?auto_340851 ?auto_340853 ?auto_340852 ?auto_340854 ?auto_340855 ?auto_340856 ?auto_340857 ?auto_340858 ?auto_340859 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_341180 - DIRECTION
      ?auto_341181 - MODE
      ?auto_341183 - DIRECTION
      ?auto_341182 - MODE
      ?auto_341184 - DIRECTION
      ?auto_341185 - MODE
      ?auto_341186 - DIRECTION
      ?auto_341187 - MODE
      ?auto_341188 - DIRECTION
      ?auto_341189 - MODE
    )
    :vars
    (
      ?auto_341197 - INSTRUMENT
      ?auto_341190 - SATELLITE
      ?auto_341191 - DIRECTION
      ?auto_341196 - INSTRUMENT
      ?auto_341193 - INSTRUMENT
      ?auto_341194 - INSTRUMENT
      ?auto_341195 - INSTRUMENT
      ?auto_341192 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_341183 ?auto_341180 ) ) ( not ( = ?auto_341184 ?auto_341180 ) ) ( not ( = ?auto_341184 ?auto_341183 ) ) ( not ( = ?auto_341186 ?auto_341180 ) ) ( not ( = ?auto_341186 ?auto_341183 ) ) ( not ( = ?auto_341186 ?auto_341184 ) ) ( not ( = ?auto_341188 ?auto_341180 ) ) ( not ( = ?auto_341188 ?auto_341183 ) ) ( not ( = ?auto_341188 ?auto_341184 ) ) ( not ( = ?auto_341188 ?auto_341186 ) ) ( ON_BOARD ?auto_341197 ?auto_341190 ) ( SUPPORTS ?auto_341197 ?auto_341185 ) ( not ( = ?auto_341184 ?auto_341191 ) ) ( CALIBRATION_TARGET ?auto_341197 ?auto_341191 ) ( not ( = ?auto_341191 ?auto_341188 ) ) ( ON_BOARD ?auto_341196 ?auto_341190 ) ( not ( = ?auto_341197 ?auto_341196 ) ) ( SUPPORTS ?auto_341196 ?auto_341189 ) ( CALIBRATION_TARGET ?auto_341196 ?auto_341191 ) ( not ( = ?auto_341191 ?auto_341186 ) ) ( ON_BOARD ?auto_341193 ?auto_341190 ) ( not ( = ?auto_341196 ?auto_341193 ) ) ( SUPPORTS ?auto_341193 ?auto_341187 ) ( CALIBRATION_TARGET ?auto_341193 ?auto_341191 ) ( not ( = ?auto_341191 ?auto_341180 ) ) ( ON_BOARD ?auto_341194 ?auto_341190 ) ( not ( = ?auto_341193 ?auto_341194 ) ) ( SUPPORTS ?auto_341194 ?auto_341181 ) ( CALIBRATION_TARGET ?auto_341194 ?auto_341191 ) ( not ( = ?auto_341191 ?auto_341183 ) ) ( ON_BOARD ?auto_341195 ?auto_341190 ) ( not ( = ?auto_341194 ?auto_341195 ) ) ( SUPPORTS ?auto_341195 ?auto_341182 ) ( CALIBRATION_TARGET ?auto_341195 ?auto_341191 ) ( POWER_AVAIL ?auto_341190 ) ( POINTING ?auto_341190 ?auto_341192 ) ( not ( = ?auto_341191 ?auto_341192 ) ) ( not ( = ?auto_341183 ?auto_341192 ) ) ( not ( = ?auto_341182 ?auto_341181 ) ) ( not ( = ?auto_341180 ?auto_341192 ) ) ( not ( = ?auto_341182 ?auto_341187 ) ) ( not ( = ?auto_341181 ?auto_341187 ) ) ( not ( = ?auto_341186 ?auto_341192 ) ) ( not ( = ?auto_341193 ?auto_341195 ) ) ( not ( = ?auto_341182 ?auto_341189 ) ) ( not ( = ?auto_341181 ?auto_341189 ) ) ( not ( = ?auto_341187 ?auto_341189 ) ) ( not ( = ?auto_341188 ?auto_341192 ) ) ( not ( = ?auto_341196 ?auto_341194 ) ) ( not ( = ?auto_341196 ?auto_341195 ) ) ( not ( = ?auto_341182 ?auto_341185 ) ) ( not ( = ?auto_341181 ?auto_341185 ) ) ( not ( = ?auto_341187 ?auto_341185 ) ) ( not ( = ?auto_341189 ?auto_341185 ) ) ( not ( = ?auto_341184 ?auto_341192 ) ) ( not ( = ?auto_341197 ?auto_341193 ) ) ( not ( = ?auto_341197 ?auto_341194 ) ) ( not ( = ?auto_341197 ?auto_341195 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_341183 ?auto_341182 ?auto_341180 ?auto_341181 ?auto_341186 ?auto_341187 ?auto_341184 ?auto_341185 ?auto_341188 ?auto_341189 )
      ( GET-5IMAGE-VERIFY ?auto_341180 ?auto_341181 ?auto_341183 ?auto_341182 ?auto_341184 ?auto_341185 ?auto_341186 ?auto_341187 ?auto_341188 ?auto_341189 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_341258 - DIRECTION
      ?auto_341259 - MODE
      ?auto_341261 - DIRECTION
      ?auto_341260 - MODE
      ?auto_341262 - DIRECTION
      ?auto_341263 - MODE
      ?auto_341264 - DIRECTION
      ?auto_341265 - MODE
      ?auto_341266 - DIRECTION
      ?auto_341267 - MODE
    )
    :vars
    (
      ?auto_341275 - INSTRUMENT
      ?auto_341268 - SATELLITE
      ?auto_341269 - DIRECTION
      ?auto_341274 - INSTRUMENT
      ?auto_341271 - INSTRUMENT
      ?auto_341272 - INSTRUMENT
      ?auto_341273 - INSTRUMENT
      ?auto_341270 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_341261 ?auto_341258 ) ) ( not ( = ?auto_341262 ?auto_341258 ) ) ( not ( = ?auto_341262 ?auto_341261 ) ) ( not ( = ?auto_341264 ?auto_341258 ) ) ( not ( = ?auto_341264 ?auto_341261 ) ) ( not ( = ?auto_341264 ?auto_341262 ) ) ( not ( = ?auto_341266 ?auto_341258 ) ) ( not ( = ?auto_341266 ?auto_341261 ) ) ( not ( = ?auto_341266 ?auto_341262 ) ) ( not ( = ?auto_341266 ?auto_341264 ) ) ( ON_BOARD ?auto_341275 ?auto_341268 ) ( SUPPORTS ?auto_341275 ?auto_341263 ) ( not ( = ?auto_341262 ?auto_341269 ) ) ( CALIBRATION_TARGET ?auto_341275 ?auto_341269 ) ( not ( = ?auto_341269 ?auto_341264 ) ) ( ON_BOARD ?auto_341274 ?auto_341268 ) ( not ( = ?auto_341275 ?auto_341274 ) ) ( SUPPORTS ?auto_341274 ?auto_341265 ) ( CALIBRATION_TARGET ?auto_341274 ?auto_341269 ) ( not ( = ?auto_341269 ?auto_341266 ) ) ( ON_BOARD ?auto_341271 ?auto_341268 ) ( not ( = ?auto_341274 ?auto_341271 ) ) ( SUPPORTS ?auto_341271 ?auto_341267 ) ( CALIBRATION_TARGET ?auto_341271 ?auto_341269 ) ( not ( = ?auto_341269 ?auto_341258 ) ) ( ON_BOARD ?auto_341272 ?auto_341268 ) ( not ( = ?auto_341271 ?auto_341272 ) ) ( SUPPORTS ?auto_341272 ?auto_341259 ) ( CALIBRATION_TARGET ?auto_341272 ?auto_341269 ) ( not ( = ?auto_341269 ?auto_341261 ) ) ( ON_BOARD ?auto_341273 ?auto_341268 ) ( not ( = ?auto_341272 ?auto_341273 ) ) ( SUPPORTS ?auto_341273 ?auto_341260 ) ( CALIBRATION_TARGET ?auto_341273 ?auto_341269 ) ( POWER_AVAIL ?auto_341268 ) ( POINTING ?auto_341268 ?auto_341270 ) ( not ( = ?auto_341269 ?auto_341270 ) ) ( not ( = ?auto_341261 ?auto_341270 ) ) ( not ( = ?auto_341260 ?auto_341259 ) ) ( not ( = ?auto_341258 ?auto_341270 ) ) ( not ( = ?auto_341260 ?auto_341267 ) ) ( not ( = ?auto_341259 ?auto_341267 ) ) ( not ( = ?auto_341266 ?auto_341270 ) ) ( not ( = ?auto_341271 ?auto_341273 ) ) ( not ( = ?auto_341260 ?auto_341265 ) ) ( not ( = ?auto_341259 ?auto_341265 ) ) ( not ( = ?auto_341267 ?auto_341265 ) ) ( not ( = ?auto_341264 ?auto_341270 ) ) ( not ( = ?auto_341274 ?auto_341272 ) ) ( not ( = ?auto_341274 ?auto_341273 ) ) ( not ( = ?auto_341260 ?auto_341263 ) ) ( not ( = ?auto_341259 ?auto_341263 ) ) ( not ( = ?auto_341267 ?auto_341263 ) ) ( not ( = ?auto_341265 ?auto_341263 ) ) ( not ( = ?auto_341262 ?auto_341270 ) ) ( not ( = ?auto_341275 ?auto_341271 ) ) ( not ( = ?auto_341275 ?auto_341272 ) ) ( not ( = ?auto_341275 ?auto_341273 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_341261 ?auto_341260 ?auto_341258 ?auto_341259 ?auto_341266 ?auto_341267 ?auto_341262 ?auto_341263 ?auto_341264 ?auto_341265 )
      ( GET-5IMAGE-VERIFY ?auto_341258 ?auto_341259 ?auto_341261 ?auto_341260 ?auto_341262 ?auto_341263 ?auto_341264 ?auto_341265 ?auto_341266 ?auto_341267 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_342802 - DIRECTION
      ?auto_342803 - MODE
      ?auto_342805 - DIRECTION
      ?auto_342804 - MODE
      ?auto_342806 - DIRECTION
      ?auto_342807 - MODE
      ?auto_342808 - DIRECTION
      ?auto_342809 - MODE
      ?auto_342810 - DIRECTION
      ?auto_342811 - MODE
    )
    :vars
    (
      ?auto_342819 - INSTRUMENT
      ?auto_342812 - SATELLITE
      ?auto_342813 - DIRECTION
      ?auto_342818 - INSTRUMENT
      ?auto_342815 - INSTRUMENT
      ?auto_342816 - INSTRUMENT
      ?auto_342817 - INSTRUMENT
      ?auto_342814 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_342805 ?auto_342802 ) ) ( not ( = ?auto_342806 ?auto_342802 ) ) ( not ( = ?auto_342806 ?auto_342805 ) ) ( not ( = ?auto_342808 ?auto_342802 ) ) ( not ( = ?auto_342808 ?auto_342805 ) ) ( not ( = ?auto_342808 ?auto_342806 ) ) ( not ( = ?auto_342810 ?auto_342802 ) ) ( not ( = ?auto_342810 ?auto_342805 ) ) ( not ( = ?auto_342810 ?auto_342806 ) ) ( not ( = ?auto_342810 ?auto_342808 ) ) ( ON_BOARD ?auto_342819 ?auto_342812 ) ( SUPPORTS ?auto_342819 ?auto_342811 ) ( not ( = ?auto_342810 ?auto_342813 ) ) ( CALIBRATION_TARGET ?auto_342819 ?auto_342813 ) ( not ( = ?auto_342813 ?auto_342808 ) ) ( ON_BOARD ?auto_342818 ?auto_342812 ) ( not ( = ?auto_342819 ?auto_342818 ) ) ( SUPPORTS ?auto_342818 ?auto_342809 ) ( CALIBRATION_TARGET ?auto_342818 ?auto_342813 ) ( not ( = ?auto_342813 ?auto_342805 ) ) ( ON_BOARD ?auto_342815 ?auto_342812 ) ( not ( = ?auto_342818 ?auto_342815 ) ) ( SUPPORTS ?auto_342815 ?auto_342804 ) ( CALIBRATION_TARGET ?auto_342815 ?auto_342813 ) ( not ( = ?auto_342813 ?auto_342802 ) ) ( ON_BOARD ?auto_342816 ?auto_342812 ) ( not ( = ?auto_342815 ?auto_342816 ) ) ( SUPPORTS ?auto_342816 ?auto_342803 ) ( CALIBRATION_TARGET ?auto_342816 ?auto_342813 ) ( not ( = ?auto_342813 ?auto_342806 ) ) ( ON_BOARD ?auto_342817 ?auto_342812 ) ( not ( = ?auto_342816 ?auto_342817 ) ) ( SUPPORTS ?auto_342817 ?auto_342807 ) ( CALIBRATION_TARGET ?auto_342817 ?auto_342813 ) ( POWER_AVAIL ?auto_342812 ) ( POINTING ?auto_342812 ?auto_342814 ) ( not ( = ?auto_342813 ?auto_342814 ) ) ( not ( = ?auto_342806 ?auto_342814 ) ) ( not ( = ?auto_342807 ?auto_342803 ) ) ( not ( = ?auto_342802 ?auto_342814 ) ) ( not ( = ?auto_342807 ?auto_342804 ) ) ( not ( = ?auto_342803 ?auto_342804 ) ) ( not ( = ?auto_342805 ?auto_342814 ) ) ( not ( = ?auto_342815 ?auto_342817 ) ) ( not ( = ?auto_342807 ?auto_342809 ) ) ( not ( = ?auto_342803 ?auto_342809 ) ) ( not ( = ?auto_342804 ?auto_342809 ) ) ( not ( = ?auto_342808 ?auto_342814 ) ) ( not ( = ?auto_342818 ?auto_342816 ) ) ( not ( = ?auto_342818 ?auto_342817 ) ) ( not ( = ?auto_342807 ?auto_342811 ) ) ( not ( = ?auto_342803 ?auto_342811 ) ) ( not ( = ?auto_342804 ?auto_342811 ) ) ( not ( = ?auto_342809 ?auto_342811 ) ) ( not ( = ?auto_342810 ?auto_342814 ) ) ( not ( = ?auto_342819 ?auto_342815 ) ) ( not ( = ?auto_342819 ?auto_342816 ) ) ( not ( = ?auto_342819 ?auto_342817 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_342806 ?auto_342807 ?auto_342802 ?auto_342803 ?auto_342805 ?auto_342804 ?auto_342810 ?auto_342811 ?auto_342808 ?auto_342809 )
      ( GET-5IMAGE-VERIFY ?auto_342802 ?auto_342803 ?auto_342805 ?auto_342804 ?auto_342806 ?auto_342807 ?auto_342808 ?auto_342809 ?auto_342810 ?auto_342811 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_342880 - DIRECTION
      ?auto_342881 - MODE
      ?auto_342883 - DIRECTION
      ?auto_342882 - MODE
      ?auto_342884 - DIRECTION
      ?auto_342885 - MODE
      ?auto_342886 - DIRECTION
      ?auto_342887 - MODE
      ?auto_342888 - DIRECTION
      ?auto_342889 - MODE
    )
    :vars
    (
      ?auto_342897 - INSTRUMENT
      ?auto_342890 - SATELLITE
      ?auto_342891 - DIRECTION
      ?auto_342896 - INSTRUMENT
      ?auto_342893 - INSTRUMENT
      ?auto_342894 - INSTRUMENT
      ?auto_342895 - INSTRUMENT
      ?auto_342892 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_342883 ?auto_342880 ) ) ( not ( = ?auto_342884 ?auto_342880 ) ) ( not ( = ?auto_342884 ?auto_342883 ) ) ( not ( = ?auto_342886 ?auto_342880 ) ) ( not ( = ?auto_342886 ?auto_342883 ) ) ( not ( = ?auto_342886 ?auto_342884 ) ) ( not ( = ?auto_342888 ?auto_342880 ) ) ( not ( = ?auto_342888 ?auto_342883 ) ) ( not ( = ?auto_342888 ?auto_342884 ) ) ( not ( = ?auto_342888 ?auto_342886 ) ) ( ON_BOARD ?auto_342897 ?auto_342890 ) ( SUPPORTS ?auto_342897 ?auto_342887 ) ( not ( = ?auto_342886 ?auto_342891 ) ) ( CALIBRATION_TARGET ?auto_342897 ?auto_342891 ) ( not ( = ?auto_342891 ?auto_342888 ) ) ( ON_BOARD ?auto_342896 ?auto_342890 ) ( not ( = ?auto_342897 ?auto_342896 ) ) ( SUPPORTS ?auto_342896 ?auto_342889 ) ( CALIBRATION_TARGET ?auto_342896 ?auto_342891 ) ( not ( = ?auto_342891 ?auto_342883 ) ) ( ON_BOARD ?auto_342893 ?auto_342890 ) ( not ( = ?auto_342896 ?auto_342893 ) ) ( SUPPORTS ?auto_342893 ?auto_342882 ) ( CALIBRATION_TARGET ?auto_342893 ?auto_342891 ) ( not ( = ?auto_342891 ?auto_342880 ) ) ( ON_BOARD ?auto_342894 ?auto_342890 ) ( not ( = ?auto_342893 ?auto_342894 ) ) ( SUPPORTS ?auto_342894 ?auto_342881 ) ( CALIBRATION_TARGET ?auto_342894 ?auto_342891 ) ( not ( = ?auto_342891 ?auto_342884 ) ) ( ON_BOARD ?auto_342895 ?auto_342890 ) ( not ( = ?auto_342894 ?auto_342895 ) ) ( SUPPORTS ?auto_342895 ?auto_342885 ) ( CALIBRATION_TARGET ?auto_342895 ?auto_342891 ) ( POWER_AVAIL ?auto_342890 ) ( POINTING ?auto_342890 ?auto_342892 ) ( not ( = ?auto_342891 ?auto_342892 ) ) ( not ( = ?auto_342884 ?auto_342892 ) ) ( not ( = ?auto_342885 ?auto_342881 ) ) ( not ( = ?auto_342880 ?auto_342892 ) ) ( not ( = ?auto_342885 ?auto_342882 ) ) ( not ( = ?auto_342881 ?auto_342882 ) ) ( not ( = ?auto_342883 ?auto_342892 ) ) ( not ( = ?auto_342893 ?auto_342895 ) ) ( not ( = ?auto_342885 ?auto_342889 ) ) ( not ( = ?auto_342881 ?auto_342889 ) ) ( not ( = ?auto_342882 ?auto_342889 ) ) ( not ( = ?auto_342888 ?auto_342892 ) ) ( not ( = ?auto_342896 ?auto_342894 ) ) ( not ( = ?auto_342896 ?auto_342895 ) ) ( not ( = ?auto_342885 ?auto_342887 ) ) ( not ( = ?auto_342881 ?auto_342887 ) ) ( not ( = ?auto_342882 ?auto_342887 ) ) ( not ( = ?auto_342889 ?auto_342887 ) ) ( not ( = ?auto_342886 ?auto_342892 ) ) ( not ( = ?auto_342897 ?auto_342893 ) ) ( not ( = ?auto_342897 ?auto_342894 ) ) ( not ( = ?auto_342897 ?auto_342895 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_342884 ?auto_342885 ?auto_342880 ?auto_342881 ?auto_342883 ?auto_342882 ?auto_342886 ?auto_342887 ?auto_342888 ?auto_342889 )
      ( GET-5IMAGE-VERIFY ?auto_342880 ?auto_342881 ?auto_342883 ?auto_342882 ?auto_342884 ?auto_342885 ?auto_342886 ?auto_342887 ?auto_342888 ?auto_342889 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_343298 - DIRECTION
      ?auto_343299 - MODE
      ?auto_343301 - DIRECTION
      ?auto_343300 - MODE
      ?auto_343302 - DIRECTION
      ?auto_343303 - MODE
      ?auto_343304 - DIRECTION
      ?auto_343305 - MODE
      ?auto_343306 - DIRECTION
      ?auto_343307 - MODE
    )
    :vars
    (
      ?auto_343315 - INSTRUMENT
      ?auto_343308 - SATELLITE
      ?auto_343309 - DIRECTION
      ?auto_343314 - INSTRUMENT
      ?auto_343311 - INSTRUMENT
      ?auto_343312 - INSTRUMENT
      ?auto_343313 - INSTRUMENT
      ?auto_343310 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_343301 ?auto_343298 ) ) ( not ( = ?auto_343302 ?auto_343298 ) ) ( not ( = ?auto_343302 ?auto_343301 ) ) ( not ( = ?auto_343304 ?auto_343298 ) ) ( not ( = ?auto_343304 ?auto_343301 ) ) ( not ( = ?auto_343304 ?auto_343302 ) ) ( not ( = ?auto_343306 ?auto_343298 ) ) ( not ( = ?auto_343306 ?auto_343301 ) ) ( not ( = ?auto_343306 ?auto_343302 ) ) ( not ( = ?auto_343306 ?auto_343304 ) ) ( ON_BOARD ?auto_343315 ?auto_343308 ) ( SUPPORTS ?auto_343315 ?auto_343307 ) ( not ( = ?auto_343306 ?auto_343309 ) ) ( CALIBRATION_TARGET ?auto_343315 ?auto_343309 ) ( not ( = ?auto_343309 ?auto_343302 ) ) ( ON_BOARD ?auto_343314 ?auto_343308 ) ( not ( = ?auto_343315 ?auto_343314 ) ) ( SUPPORTS ?auto_343314 ?auto_343303 ) ( CALIBRATION_TARGET ?auto_343314 ?auto_343309 ) ( not ( = ?auto_343309 ?auto_343301 ) ) ( ON_BOARD ?auto_343311 ?auto_343308 ) ( not ( = ?auto_343314 ?auto_343311 ) ) ( SUPPORTS ?auto_343311 ?auto_343300 ) ( CALIBRATION_TARGET ?auto_343311 ?auto_343309 ) ( not ( = ?auto_343309 ?auto_343298 ) ) ( ON_BOARD ?auto_343312 ?auto_343308 ) ( not ( = ?auto_343311 ?auto_343312 ) ) ( SUPPORTS ?auto_343312 ?auto_343299 ) ( CALIBRATION_TARGET ?auto_343312 ?auto_343309 ) ( not ( = ?auto_343309 ?auto_343304 ) ) ( ON_BOARD ?auto_343313 ?auto_343308 ) ( not ( = ?auto_343312 ?auto_343313 ) ) ( SUPPORTS ?auto_343313 ?auto_343305 ) ( CALIBRATION_TARGET ?auto_343313 ?auto_343309 ) ( POWER_AVAIL ?auto_343308 ) ( POINTING ?auto_343308 ?auto_343310 ) ( not ( = ?auto_343309 ?auto_343310 ) ) ( not ( = ?auto_343304 ?auto_343310 ) ) ( not ( = ?auto_343305 ?auto_343299 ) ) ( not ( = ?auto_343298 ?auto_343310 ) ) ( not ( = ?auto_343305 ?auto_343300 ) ) ( not ( = ?auto_343299 ?auto_343300 ) ) ( not ( = ?auto_343301 ?auto_343310 ) ) ( not ( = ?auto_343311 ?auto_343313 ) ) ( not ( = ?auto_343305 ?auto_343303 ) ) ( not ( = ?auto_343299 ?auto_343303 ) ) ( not ( = ?auto_343300 ?auto_343303 ) ) ( not ( = ?auto_343302 ?auto_343310 ) ) ( not ( = ?auto_343314 ?auto_343312 ) ) ( not ( = ?auto_343314 ?auto_343313 ) ) ( not ( = ?auto_343305 ?auto_343307 ) ) ( not ( = ?auto_343299 ?auto_343307 ) ) ( not ( = ?auto_343300 ?auto_343307 ) ) ( not ( = ?auto_343303 ?auto_343307 ) ) ( not ( = ?auto_343306 ?auto_343310 ) ) ( not ( = ?auto_343315 ?auto_343311 ) ) ( not ( = ?auto_343315 ?auto_343312 ) ) ( not ( = ?auto_343315 ?auto_343313 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_343304 ?auto_343305 ?auto_343298 ?auto_343299 ?auto_343301 ?auto_343300 ?auto_343306 ?auto_343307 ?auto_343302 ?auto_343303 )
      ( GET-5IMAGE-VERIFY ?auto_343298 ?auto_343299 ?auto_343301 ?auto_343300 ?auto_343302 ?auto_343303 ?auto_343304 ?auto_343305 ?auto_343306 ?auto_343307 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_343376 - DIRECTION
      ?auto_343377 - MODE
      ?auto_343379 - DIRECTION
      ?auto_343378 - MODE
      ?auto_343380 - DIRECTION
      ?auto_343381 - MODE
      ?auto_343382 - DIRECTION
      ?auto_343383 - MODE
      ?auto_343384 - DIRECTION
      ?auto_343385 - MODE
    )
    :vars
    (
      ?auto_343393 - INSTRUMENT
      ?auto_343386 - SATELLITE
      ?auto_343387 - DIRECTION
      ?auto_343392 - INSTRUMENT
      ?auto_343389 - INSTRUMENT
      ?auto_343390 - INSTRUMENT
      ?auto_343391 - INSTRUMENT
      ?auto_343388 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_343379 ?auto_343376 ) ) ( not ( = ?auto_343380 ?auto_343376 ) ) ( not ( = ?auto_343380 ?auto_343379 ) ) ( not ( = ?auto_343382 ?auto_343376 ) ) ( not ( = ?auto_343382 ?auto_343379 ) ) ( not ( = ?auto_343382 ?auto_343380 ) ) ( not ( = ?auto_343384 ?auto_343376 ) ) ( not ( = ?auto_343384 ?auto_343379 ) ) ( not ( = ?auto_343384 ?auto_343380 ) ) ( not ( = ?auto_343384 ?auto_343382 ) ) ( ON_BOARD ?auto_343393 ?auto_343386 ) ( SUPPORTS ?auto_343393 ?auto_343383 ) ( not ( = ?auto_343382 ?auto_343387 ) ) ( CALIBRATION_TARGET ?auto_343393 ?auto_343387 ) ( not ( = ?auto_343387 ?auto_343380 ) ) ( ON_BOARD ?auto_343392 ?auto_343386 ) ( not ( = ?auto_343393 ?auto_343392 ) ) ( SUPPORTS ?auto_343392 ?auto_343381 ) ( CALIBRATION_TARGET ?auto_343392 ?auto_343387 ) ( not ( = ?auto_343387 ?auto_343379 ) ) ( ON_BOARD ?auto_343389 ?auto_343386 ) ( not ( = ?auto_343392 ?auto_343389 ) ) ( SUPPORTS ?auto_343389 ?auto_343378 ) ( CALIBRATION_TARGET ?auto_343389 ?auto_343387 ) ( not ( = ?auto_343387 ?auto_343376 ) ) ( ON_BOARD ?auto_343390 ?auto_343386 ) ( not ( = ?auto_343389 ?auto_343390 ) ) ( SUPPORTS ?auto_343390 ?auto_343377 ) ( CALIBRATION_TARGET ?auto_343390 ?auto_343387 ) ( not ( = ?auto_343387 ?auto_343384 ) ) ( ON_BOARD ?auto_343391 ?auto_343386 ) ( not ( = ?auto_343390 ?auto_343391 ) ) ( SUPPORTS ?auto_343391 ?auto_343385 ) ( CALIBRATION_TARGET ?auto_343391 ?auto_343387 ) ( POWER_AVAIL ?auto_343386 ) ( POINTING ?auto_343386 ?auto_343388 ) ( not ( = ?auto_343387 ?auto_343388 ) ) ( not ( = ?auto_343384 ?auto_343388 ) ) ( not ( = ?auto_343385 ?auto_343377 ) ) ( not ( = ?auto_343376 ?auto_343388 ) ) ( not ( = ?auto_343385 ?auto_343378 ) ) ( not ( = ?auto_343377 ?auto_343378 ) ) ( not ( = ?auto_343379 ?auto_343388 ) ) ( not ( = ?auto_343389 ?auto_343391 ) ) ( not ( = ?auto_343385 ?auto_343381 ) ) ( not ( = ?auto_343377 ?auto_343381 ) ) ( not ( = ?auto_343378 ?auto_343381 ) ) ( not ( = ?auto_343380 ?auto_343388 ) ) ( not ( = ?auto_343392 ?auto_343390 ) ) ( not ( = ?auto_343392 ?auto_343391 ) ) ( not ( = ?auto_343385 ?auto_343383 ) ) ( not ( = ?auto_343377 ?auto_343383 ) ) ( not ( = ?auto_343378 ?auto_343383 ) ) ( not ( = ?auto_343381 ?auto_343383 ) ) ( not ( = ?auto_343382 ?auto_343388 ) ) ( not ( = ?auto_343393 ?auto_343389 ) ) ( not ( = ?auto_343393 ?auto_343390 ) ) ( not ( = ?auto_343393 ?auto_343391 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_343384 ?auto_343385 ?auto_343376 ?auto_343377 ?auto_343379 ?auto_343378 ?auto_343382 ?auto_343383 ?auto_343380 ?auto_343381 )
      ( GET-5IMAGE-VERIFY ?auto_343376 ?auto_343377 ?auto_343379 ?auto_343378 ?auto_343380 ?auto_343381 ?auto_343382 ?auto_343383 ?auto_343384 ?auto_343385 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_343534 - DIRECTION
      ?auto_343535 - MODE
      ?auto_343537 - DIRECTION
      ?auto_343536 - MODE
      ?auto_343538 - DIRECTION
      ?auto_343539 - MODE
      ?auto_343540 - DIRECTION
      ?auto_343541 - MODE
      ?auto_343542 - DIRECTION
      ?auto_343543 - MODE
    )
    :vars
    (
      ?auto_343551 - INSTRUMENT
      ?auto_343544 - SATELLITE
      ?auto_343545 - DIRECTION
      ?auto_343550 - INSTRUMENT
      ?auto_343547 - INSTRUMENT
      ?auto_343548 - INSTRUMENT
      ?auto_343549 - INSTRUMENT
      ?auto_343546 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_343537 ?auto_343534 ) ) ( not ( = ?auto_343538 ?auto_343534 ) ) ( not ( = ?auto_343538 ?auto_343537 ) ) ( not ( = ?auto_343540 ?auto_343534 ) ) ( not ( = ?auto_343540 ?auto_343537 ) ) ( not ( = ?auto_343540 ?auto_343538 ) ) ( not ( = ?auto_343542 ?auto_343534 ) ) ( not ( = ?auto_343542 ?auto_343537 ) ) ( not ( = ?auto_343542 ?auto_343538 ) ) ( not ( = ?auto_343542 ?auto_343540 ) ) ( ON_BOARD ?auto_343551 ?auto_343544 ) ( SUPPORTS ?auto_343551 ?auto_343539 ) ( not ( = ?auto_343538 ?auto_343545 ) ) ( CALIBRATION_TARGET ?auto_343551 ?auto_343545 ) ( not ( = ?auto_343545 ?auto_343542 ) ) ( ON_BOARD ?auto_343550 ?auto_343544 ) ( not ( = ?auto_343551 ?auto_343550 ) ) ( SUPPORTS ?auto_343550 ?auto_343543 ) ( CALIBRATION_TARGET ?auto_343550 ?auto_343545 ) ( not ( = ?auto_343545 ?auto_343537 ) ) ( ON_BOARD ?auto_343547 ?auto_343544 ) ( not ( = ?auto_343550 ?auto_343547 ) ) ( SUPPORTS ?auto_343547 ?auto_343536 ) ( CALIBRATION_TARGET ?auto_343547 ?auto_343545 ) ( not ( = ?auto_343545 ?auto_343534 ) ) ( ON_BOARD ?auto_343548 ?auto_343544 ) ( not ( = ?auto_343547 ?auto_343548 ) ) ( SUPPORTS ?auto_343548 ?auto_343535 ) ( CALIBRATION_TARGET ?auto_343548 ?auto_343545 ) ( not ( = ?auto_343545 ?auto_343540 ) ) ( ON_BOARD ?auto_343549 ?auto_343544 ) ( not ( = ?auto_343548 ?auto_343549 ) ) ( SUPPORTS ?auto_343549 ?auto_343541 ) ( CALIBRATION_TARGET ?auto_343549 ?auto_343545 ) ( POWER_AVAIL ?auto_343544 ) ( POINTING ?auto_343544 ?auto_343546 ) ( not ( = ?auto_343545 ?auto_343546 ) ) ( not ( = ?auto_343540 ?auto_343546 ) ) ( not ( = ?auto_343541 ?auto_343535 ) ) ( not ( = ?auto_343534 ?auto_343546 ) ) ( not ( = ?auto_343541 ?auto_343536 ) ) ( not ( = ?auto_343535 ?auto_343536 ) ) ( not ( = ?auto_343537 ?auto_343546 ) ) ( not ( = ?auto_343547 ?auto_343549 ) ) ( not ( = ?auto_343541 ?auto_343543 ) ) ( not ( = ?auto_343535 ?auto_343543 ) ) ( not ( = ?auto_343536 ?auto_343543 ) ) ( not ( = ?auto_343542 ?auto_343546 ) ) ( not ( = ?auto_343550 ?auto_343548 ) ) ( not ( = ?auto_343550 ?auto_343549 ) ) ( not ( = ?auto_343541 ?auto_343539 ) ) ( not ( = ?auto_343535 ?auto_343539 ) ) ( not ( = ?auto_343536 ?auto_343539 ) ) ( not ( = ?auto_343543 ?auto_343539 ) ) ( not ( = ?auto_343538 ?auto_343546 ) ) ( not ( = ?auto_343551 ?auto_343547 ) ) ( not ( = ?auto_343551 ?auto_343548 ) ) ( not ( = ?auto_343551 ?auto_343549 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_343540 ?auto_343541 ?auto_343534 ?auto_343535 ?auto_343537 ?auto_343536 ?auto_343538 ?auto_343539 ?auto_343542 ?auto_343543 )
      ( GET-5IMAGE-VERIFY ?auto_343534 ?auto_343535 ?auto_343537 ?auto_343536 ?auto_343538 ?auto_343539 ?auto_343540 ?auto_343541 ?auto_343542 ?auto_343543 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_343784 - DIRECTION
      ?auto_343785 - MODE
      ?auto_343787 - DIRECTION
      ?auto_343786 - MODE
      ?auto_343788 - DIRECTION
      ?auto_343789 - MODE
      ?auto_343790 - DIRECTION
      ?auto_343791 - MODE
      ?auto_343792 - DIRECTION
      ?auto_343793 - MODE
    )
    :vars
    (
      ?auto_343801 - INSTRUMENT
      ?auto_343794 - SATELLITE
      ?auto_343795 - DIRECTION
      ?auto_343800 - INSTRUMENT
      ?auto_343797 - INSTRUMENT
      ?auto_343798 - INSTRUMENT
      ?auto_343799 - INSTRUMENT
      ?auto_343796 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_343787 ?auto_343784 ) ) ( not ( = ?auto_343788 ?auto_343784 ) ) ( not ( = ?auto_343788 ?auto_343787 ) ) ( not ( = ?auto_343790 ?auto_343784 ) ) ( not ( = ?auto_343790 ?auto_343787 ) ) ( not ( = ?auto_343790 ?auto_343788 ) ) ( not ( = ?auto_343792 ?auto_343784 ) ) ( not ( = ?auto_343792 ?auto_343787 ) ) ( not ( = ?auto_343792 ?auto_343788 ) ) ( not ( = ?auto_343792 ?auto_343790 ) ) ( ON_BOARD ?auto_343801 ?auto_343794 ) ( SUPPORTS ?auto_343801 ?auto_343789 ) ( not ( = ?auto_343788 ?auto_343795 ) ) ( CALIBRATION_TARGET ?auto_343801 ?auto_343795 ) ( not ( = ?auto_343795 ?auto_343790 ) ) ( ON_BOARD ?auto_343800 ?auto_343794 ) ( not ( = ?auto_343801 ?auto_343800 ) ) ( SUPPORTS ?auto_343800 ?auto_343791 ) ( CALIBRATION_TARGET ?auto_343800 ?auto_343795 ) ( not ( = ?auto_343795 ?auto_343787 ) ) ( ON_BOARD ?auto_343797 ?auto_343794 ) ( not ( = ?auto_343800 ?auto_343797 ) ) ( SUPPORTS ?auto_343797 ?auto_343786 ) ( CALIBRATION_TARGET ?auto_343797 ?auto_343795 ) ( not ( = ?auto_343795 ?auto_343784 ) ) ( ON_BOARD ?auto_343798 ?auto_343794 ) ( not ( = ?auto_343797 ?auto_343798 ) ) ( SUPPORTS ?auto_343798 ?auto_343785 ) ( CALIBRATION_TARGET ?auto_343798 ?auto_343795 ) ( not ( = ?auto_343795 ?auto_343792 ) ) ( ON_BOARD ?auto_343799 ?auto_343794 ) ( not ( = ?auto_343798 ?auto_343799 ) ) ( SUPPORTS ?auto_343799 ?auto_343793 ) ( CALIBRATION_TARGET ?auto_343799 ?auto_343795 ) ( POWER_AVAIL ?auto_343794 ) ( POINTING ?auto_343794 ?auto_343796 ) ( not ( = ?auto_343795 ?auto_343796 ) ) ( not ( = ?auto_343792 ?auto_343796 ) ) ( not ( = ?auto_343793 ?auto_343785 ) ) ( not ( = ?auto_343784 ?auto_343796 ) ) ( not ( = ?auto_343793 ?auto_343786 ) ) ( not ( = ?auto_343785 ?auto_343786 ) ) ( not ( = ?auto_343787 ?auto_343796 ) ) ( not ( = ?auto_343797 ?auto_343799 ) ) ( not ( = ?auto_343793 ?auto_343791 ) ) ( not ( = ?auto_343785 ?auto_343791 ) ) ( not ( = ?auto_343786 ?auto_343791 ) ) ( not ( = ?auto_343790 ?auto_343796 ) ) ( not ( = ?auto_343800 ?auto_343798 ) ) ( not ( = ?auto_343800 ?auto_343799 ) ) ( not ( = ?auto_343793 ?auto_343789 ) ) ( not ( = ?auto_343785 ?auto_343789 ) ) ( not ( = ?auto_343786 ?auto_343789 ) ) ( not ( = ?auto_343791 ?auto_343789 ) ) ( not ( = ?auto_343788 ?auto_343796 ) ) ( not ( = ?auto_343801 ?auto_343797 ) ) ( not ( = ?auto_343801 ?auto_343798 ) ) ( not ( = ?auto_343801 ?auto_343799 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_343792 ?auto_343793 ?auto_343784 ?auto_343785 ?auto_343787 ?auto_343786 ?auto_343788 ?auto_343789 ?auto_343790 ?auto_343791 )
      ( GET-5IMAGE-VERIFY ?auto_343784 ?auto_343785 ?auto_343787 ?auto_343786 ?auto_343788 ?auto_343789 ?auto_343790 ?auto_343791 ?auto_343792 ?auto_343793 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_344028 - DIRECTION
      ?auto_344029 - MODE
      ?auto_344031 - DIRECTION
      ?auto_344030 - MODE
      ?auto_344032 - DIRECTION
      ?auto_344033 - MODE
      ?auto_344034 - DIRECTION
      ?auto_344035 - MODE
      ?auto_344036 - DIRECTION
      ?auto_344037 - MODE
    )
    :vars
    (
      ?auto_344045 - INSTRUMENT
      ?auto_344038 - SATELLITE
      ?auto_344039 - DIRECTION
      ?auto_344044 - INSTRUMENT
      ?auto_344041 - INSTRUMENT
      ?auto_344042 - INSTRUMENT
      ?auto_344043 - INSTRUMENT
      ?auto_344040 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_344031 ?auto_344028 ) ) ( not ( = ?auto_344032 ?auto_344028 ) ) ( not ( = ?auto_344032 ?auto_344031 ) ) ( not ( = ?auto_344034 ?auto_344028 ) ) ( not ( = ?auto_344034 ?auto_344031 ) ) ( not ( = ?auto_344034 ?auto_344032 ) ) ( not ( = ?auto_344036 ?auto_344028 ) ) ( not ( = ?auto_344036 ?auto_344031 ) ) ( not ( = ?auto_344036 ?auto_344032 ) ) ( not ( = ?auto_344036 ?auto_344034 ) ) ( ON_BOARD ?auto_344045 ?auto_344038 ) ( SUPPORTS ?auto_344045 ?auto_344037 ) ( not ( = ?auto_344036 ?auto_344039 ) ) ( CALIBRATION_TARGET ?auto_344045 ?auto_344039 ) ( not ( = ?auto_344039 ?auto_344031 ) ) ( ON_BOARD ?auto_344044 ?auto_344038 ) ( not ( = ?auto_344045 ?auto_344044 ) ) ( SUPPORTS ?auto_344044 ?auto_344030 ) ( CALIBRATION_TARGET ?auto_344044 ?auto_344039 ) ( not ( = ?auto_344039 ?auto_344034 ) ) ( ON_BOARD ?auto_344041 ?auto_344038 ) ( not ( = ?auto_344044 ?auto_344041 ) ) ( SUPPORTS ?auto_344041 ?auto_344035 ) ( CALIBRATION_TARGET ?auto_344041 ?auto_344039 ) ( not ( = ?auto_344039 ?auto_344028 ) ) ( ON_BOARD ?auto_344042 ?auto_344038 ) ( not ( = ?auto_344041 ?auto_344042 ) ) ( SUPPORTS ?auto_344042 ?auto_344029 ) ( CALIBRATION_TARGET ?auto_344042 ?auto_344039 ) ( not ( = ?auto_344039 ?auto_344032 ) ) ( ON_BOARD ?auto_344043 ?auto_344038 ) ( not ( = ?auto_344042 ?auto_344043 ) ) ( SUPPORTS ?auto_344043 ?auto_344033 ) ( CALIBRATION_TARGET ?auto_344043 ?auto_344039 ) ( POWER_AVAIL ?auto_344038 ) ( POINTING ?auto_344038 ?auto_344040 ) ( not ( = ?auto_344039 ?auto_344040 ) ) ( not ( = ?auto_344032 ?auto_344040 ) ) ( not ( = ?auto_344033 ?auto_344029 ) ) ( not ( = ?auto_344028 ?auto_344040 ) ) ( not ( = ?auto_344033 ?auto_344035 ) ) ( not ( = ?auto_344029 ?auto_344035 ) ) ( not ( = ?auto_344034 ?auto_344040 ) ) ( not ( = ?auto_344041 ?auto_344043 ) ) ( not ( = ?auto_344033 ?auto_344030 ) ) ( not ( = ?auto_344029 ?auto_344030 ) ) ( not ( = ?auto_344035 ?auto_344030 ) ) ( not ( = ?auto_344031 ?auto_344040 ) ) ( not ( = ?auto_344044 ?auto_344042 ) ) ( not ( = ?auto_344044 ?auto_344043 ) ) ( not ( = ?auto_344033 ?auto_344037 ) ) ( not ( = ?auto_344029 ?auto_344037 ) ) ( not ( = ?auto_344035 ?auto_344037 ) ) ( not ( = ?auto_344030 ?auto_344037 ) ) ( not ( = ?auto_344036 ?auto_344040 ) ) ( not ( = ?auto_344045 ?auto_344041 ) ) ( not ( = ?auto_344045 ?auto_344042 ) ) ( not ( = ?auto_344045 ?auto_344043 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_344032 ?auto_344033 ?auto_344028 ?auto_344029 ?auto_344034 ?auto_344035 ?auto_344036 ?auto_344037 ?auto_344031 ?auto_344030 )
      ( GET-5IMAGE-VERIFY ?auto_344028 ?auto_344029 ?auto_344031 ?auto_344030 ?auto_344032 ?auto_344033 ?auto_344034 ?auto_344035 ?auto_344036 ?auto_344037 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_344106 - DIRECTION
      ?auto_344107 - MODE
      ?auto_344109 - DIRECTION
      ?auto_344108 - MODE
      ?auto_344110 - DIRECTION
      ?auto_344111 - MODE
      ?auto_344112 - DIRECTION
      ?auto_344113 - MODE
      ?auto_344114 - DIRECTION
      ?auto_344115 - MODE
    )
    :vars
    (
      ?auto_344123 - INSTRUMENT
      ?auto_344116 - SATELLITE
      ?auto_344117 - DIRECTION
      ?auto_344122 - INSTRUMENT
      ?auto_344119 - INSTRUMENT
      ?auto_344120 - INSTRUMENT
      ?auto_344121 - INSTRUMENT
      ?auto_344118 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_344109 ?auto_344106 ) ) ( not ( = ?auto_344110 ?auto_344106 ) ) ( not ( = ?auto_344110 ?auto_344109 ) ) ( not ( = ?auto_344112 ?auto_344106 ) ) ( not ( = ?auto_344112 ?auto_344109 ) ) ( not ( = ?auto_344112 ?auto_344110 ) ) ( not ( = ?auto_344114 ?auto_344106 ) ) ( not ( = ?auto_344114 ?auto_344109 ) ) ( not ( = ?auto_344114 ?auto_344110 ) ) ( not ( = ?auto_344114 ?auto_344112 ) ) ( ON_BOARD ?auto_344123 ?auto_344116 ) ( SUPPORTS ?auto_344123 ?auto_344113 ) ( not ( = ?auto_344112 ?auto_344117 ) ) ( CALIBRATION_TARGET ?auto_344123 ?auto_344117 ) ( not ( = ?auto_344117 ?auto_344109 ) ) ( ON_BOARD ?auto_344122 ?auto_344116 ) ( not ( = ?auto_344123 ?auto_344122 ) ) ( SUPPORTS ?auto_344122 ?auto_344108 ) ( CALIBRATION_TARGET ?auto_344122 ?auto_344117 ) ( not ( = ?auto_344117 ?auto_344114 ) ) ( ON_BOARD ?auto_344119 ?auto_344116 ) ( not ( = ?auto_344122 ?auto_344119 ) ) ( SUPPORTS ?auto_344119 ?auto_344115 ) ( CALIBRATION_TARGET ?auto_344119 ?auto_344117 ) ( not ( = ?auto_344117 ?auto_344106 ) ) ( ON_BOARD ?auto_344120 ?auto_344116 ) ( not ( = ?auto_344119 ?auto_344120 ) ) ( SUPPORTS ?auto_344120 ?auto_344107 ) ( CALIBRATION_TARGET ?auto_344120 ?auto_344117 ) ( not ( = ?auto_344117 ?auto_344110 ) ) ( ON_BOARD ?auto_344121 ?auto_344116 ) ( not ( = ?auto_344120 ?auto_344121 ) ) ( SUPPORTS ?auto_344121 ?auto_344111 ) ( CALIBRATION_TARGET ?auto_344121 ?auto_344117 ) ( POWER_AVAIL ?auto_344116 ) ( POINTING ?auto_344116 ?auto_344118 ) ( not ( = ?auto_344117 ?auto_344118 ) ) ( not ( = ?auto_344110 ?auto_344118 ) ) ( not ( = ?auto_344111 ?auto_344107 ) ) ( not ( = ?auto_344106 ?auto_344118 ) ) ( not ( = ?auto_344111 ?auto_344115 ) ) ( not ( = ?auto_344107 ?auto_344115 ) ) ( not ( = ?auto_344114 ?auto_344118 ) ) ( not ( = ?auto_344119 ?auto_344121 ) ) ( not ( = ?auto_344111 ?auto_344108 ) ) ( not ( = ?auto_344107 ?auto_344108 ) ) ( not ( = ?auto_344115 ?auto_344108 ) ) ( not ( = ?auto_344109 ?auto_344118 ) ) ( not ( = ?auto_344122 ?auto_344120 ) ) ( not ( = ?auto_344122 ?auto_344121 ) ) ( not ( = ?auto_344111 ?auto_344113 ) ) ( not ( = ?auto_344107 ?auto_344113 ) ) ( not ( = ?auto_344115 ?auto_344113 ) ) ( not ( = ?auto_344108 ?auto_344113 ) ) ( not ( = ?auto_344112 ?auto_344118 ) ) ( not ( = ?auto_344123 ?auto_344119 ) ) ( not ( = ?auto_344123 ?auto_344120 ) ) ( not ( = ?auto_344123 ?auto_344121 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_344110 ?auto_344111 ?auto_344106 ?auto_344107 ?auto_344114 ?auto_344115 ?auto_344112 ?auto_344113 ?auto_344109 ?auto_344108 )
      ( GET-5IMAGE-VERIFY ?auto_344106 ?auto_344107 ?auto_344109 ?auto_344108 ?auto_344110 ?auto_344111 ?auto_344112 ?auto_344113 ?auto_344114 ?auto_344115 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_344354 - DIRECTION
      ?auto_344355 - MODE
      ?auto_344357 - DIRECTION
      ?auto_344356 - MODE
      ?auto_344358 - DIRECTION
      ?auto_344359 - MODE
      ?auto_344360 - DIRECTION
      ?auto_344361 - MODE
      ?auto_344362 - DIRECTION
      ?auto_344363 - MODE
    )
    :vars
    (
      ?auto_344371 - INSTRUMENT
      ?auto_344364 - SATELLITE
      ?auto_344365 - DIRECTION
      ?auto_344370 - INSTRUMENT
      ?auto_344367 - INSTRUMENT
      ?auto_344368 - INSTRUMENT
      ?auto_344369 - INSTRUMENT
      ?auto_344366 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_344357 ?auto_344354 ) ) ( not ( = ?auto_344358 ?auto_344354 ) ) ( not ( = ?auto_344358 ?auto_344357 ) ) ( not ( = ?auto_344360 ?auto_344354 ) ) ( not ( = ?auto_344360 ?auto_344357 ) ) ( not ( = ?auto_344360 ?auto_344358 ) ) ( not ( = ?auto_344362 ?auto_344354 ) ) ( not ( = ?auto_344362 ?auto_344357 ) ) ( not ( = ?auto_344362 ?auto_344358 ) ) ( not ( = ?auto_344362 ?auto_344360 ) ) ( ON_BOARD ?auto_344371 ?auto_344364 ) ( SUPPORTS ?auto_344371 ?auto_344363 ) ( not ( = ?auto_344362 ?auto_344365 ) ) ( CALIBRATION_TARGET ?auto_344371 ?auto_344365 ) ( not ( = ?auto_344365 ?auto_344357 ) ) ( ON_BOARD ?auto_344370 ?auto_344364 ) ( not ( = ?auto_344371 ?auto_344370 ) ) ( SUPPORTS ?auto_344370 ?auto_344356 ) ( CALIBRATION_TARGET ?auto_344370 ?auto_344365 ) ( not ( = ?auto_344365 ?auto_344358 ) ) ( ON_BOARD ?auto_344367 ?auto_344364 ) ( not ( = ?auto_344370 ?auto_344367 ) ) ( SUPPORTS ?auto_344367 ?auto_344359 ) ( CALIBRATION_TARGET ?auto_344367 ?auto_344365 ) ( not ( = ?auto_344365 ?auto_344354 ) ) ( ON_BOARD ?auto_344368 ?auto_344364 ) ( not ( = ?auto_344367 ?auto_344368 ) ) ( SUPPORTS ?auto_344368 ?auto_344355 ) ( CALIBRATION_TARGET ?auto_344368 ?auto_344365 ) ( not ( = ?auto_344365 ?auto_344360 ) ) ( ON_BOARD ?auto_344369 ?auto_344364 ) ( not ( = ?auto_344368 ?auto_344369 ) ) ( SUPPORTS ?auto_344369 ?auto_344361 ) ( CALIBRATION_TARGET ?auto_344369 ?auto_344365 ) ( POWER_AVAIL ?auto_344364 ) ( POINTING ?auto_344364 ?auto_344366 ) ( not ( = ?auto_344365 ?auto_344366 ) ) ( not ( = ?auto_344360 ?auto_344366 ) ) ( not ( = ?auto_344361 ?auto_344355 ) ) ( not ( = ?auto_344354 ?auto_344366 ) ) ( not ( = ?auto_344361 ?auto_344359 ) ) ( not ( = ?auto_344355 ?auto_344359 ) ) ( not ( = ?auto_344358 ?auto_344366 ) ) ( not ( = ?auto_344367 ?auto_344369 ) ) ( not ( = ?auto_344361 ?auto_344356 ) ) ( not ( = ?auto_344355 ?auto_344356 ) ) ( not ( = ?auto_344359 ?auto_344356 ) ) ( not ( = ?auto_344357 ?auto_344366 ) ) ( not ( = ?auto_344370 ?auto_344368 ) ) ( not ( = ?auto_344370 ?auto_344369 ) ) ( not ( = ?auto_344361 ?auto_344363 ) ) ( not ( = ?auto_344355 ?auto_344363 ) ) ( not ( = ?auto_344359 ?auto_344363 ) ) ( not ( = ?auto_344356 ?auto_344363 ) ) ( not ( = ?auto_344362 ?auto_344366 ) ) ( not ( = ?auto_344371 ?auto_344367 ) ) ( not ( = ?auto_344371 ?auto_344368 ) ) ( not ( = ?auto_344371 ?auto_344369 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_344360 ?auto_344361 ?auto_344354 ?auto_344355 ?auto_344358 ?auto_344359 ?auto_344362 ?auto_344363 ?auto_344357 ?auto_344356 )
      ( GET-5IMAGE-VERIFY ?auto_344354 ?auto_344355 ?auto_344357 ?auto_344356 ?auto_344358 ?auto_344359 ?auto_344360 ?auto_344361 ?auto_344362 ?auto_344363 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_344432 - DIRECTION
      ?auto_344433 - MODE
      ?auto_344435 - DIRECTION
      ?auto_344434 - MODE
      ?auto_344436 - DIRECTION
      ?auto_344437 - MODE
      ?auto_344438 - DIRECTION
      ?auto_344439 - MODE
      ?auto_344440 - DIRECTION
      ?auto_344441 - MODE
    )
    :vars
    (
      ?auto_344449 - INSTRUMENT
      ?auto_344442 - SATELLITE
      ?auto_344443 - DIRECTION
      ?auto_344448 - INSTRUMENT
      ?auto_344445 - INSTRUMENT
      ?auto_344446 - INSTRUMENT
      ?auto_344447 - INSTRUMENT
      ?auto_344444 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_344435 ?auto_344432 ) ) ( not ( = ?auto_344436 ?auto_344432 ) ) ( not ( = ?auto_344436 ?auto_344435 ) ) ( not ( = ?auto_344438 ?auto_344432 ) ) ( not ( = ?auto_344438 ?auto_344435 ) ) ( not ( = ?auto_344438 ?auto_344436 ) ) ( not ( = ?auto_344440 ?auto_344432 ) ) ( not ( = ?auto_344440 ?auto_344435 ) ) ( not ( = ?auto_344440 ?auto_344436 ) ) ( not ( = ?auto_344440 ?auto_344438 ) ) ( ON_BOARD ?auto_344449 ?auto_344442 ) ( SUPPORTS ?auto_344449 ?auto_344439 ) ( not ( = ?auto_344438 ?auto_344443 ) ) ( CALIBRATION_TARGET ?auto_344449 ?auto_344443 ) ( not ( = ?auto_344443 ?auto_344435 ) ) ( ON_BOARD ?auto_344448 ?auto_344442 ) ( not ( = ?auto_344449 ?auto_344448 ) ) ( SUPPORTS ?auto_344448 ?auto_344434 ) ( CALIBRATION_TARGET ?auto_344448 ?auto_344443 ) ( not ( = ?auto_344443 ?auto_344436 ) ) ( ON_BOARD ?auto_344445 ?auto_344442 ) ( not ( = ?auto_344448 ?auto_344445 ) ) ( SUPPORTS ?auto_344445 ?auto_344437 ) ( CALIBRATION_TARGET ?auto_344445 ?auto_344443 ) ( not ( = ?auto_344443 ?auto_344432 ) ) ( ON_BOARD ?auto_344446 ?auto_344442 ) ( not ( = ?auto_344445 ?auto_344446 ) ) ( SUPPORTS ?auto_344446 ?auto_344433 ) ( CALIBRATION_TARGET ?auto_344446 ?auto_344443 ) ( not ( = ?auto_344443 ?auto_344440 ) ) ( ON_BOARD ?auto_344447 ?auto_344442 ) ( not ( = ?auto_344446 ?auto_344447 ) ) ( SUPPORTS ?auto_344447 ?auto_344441 ) ( CALIBRATION_TARGET ?auto_344447 ?auto_344443 ) ( POWER_AVAIL ?auto_344442 ) ( POINTING ?auto_344442 ?auto_344444 ) ( not ( = ?auto_344443 ?auto_344444 ) ) ( not ( = ?auto_344440 ?auto_344444 ) ) ( not ( = ?auto_344441 ?auto_344433 ) ) ( not ( = ?auto_344432 ?auto_344444 ) ) ( not ( = ?auto_344441 ?auto_344437 ) ) ( not ( = ?auto_344433 ?auto_344437 ) ) ( not ( = ?auto_344436 ?auto_344444 ) ) ( not ( = ?auto_344445 ?auto_344447 ) ) ( not ( = ?auto_344441 ?auto_344434 ) ) ( not ( = ?auto_344433 ?auto_344434 ) ) ( not ( = ?auto_344437 ?auto_344434 ) ) ( not ( = ?auto_344435 ?auto_344444 ) ) ( not ( = ?auto_344448 ?auto_344446 ) ) ( not ( = ?auto_344448 ?auto_344447 ) ) ( not ( = ?auto_344441 ?auto_344439 ) ) ( not ( = ?auto_344433 ?auto_344439 ) ) ( not ( = ?auto_344437 ?auto_344439 ) ) ( not ( = ?auto_344434 ?auto_344439 ) ) ( not ( = ?auto_344438 ?auto_344444 ) ) ( not ( = ?auto_344449 ?auto_344445 ) ) ( not ( = ?auto_344449 ?auto_344446 ) ) ( not ( = ?auto_344449 ?auto_344447 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_344440 ?auto_344441 ?auto_344432 ?auto_344433 ?auto_344436 ?auto_344437 ?auto_344438 ?auto_344439 ?auto_344435 ?auto_344434 )
      ( GET-5IMAGE-VERIFY ?auto_344432 ?auto_344433 ?auto_344435 ?auto_344434 ?auto_344436 ?auto_344437 ?auto_344438 ?auto_344439 ?auto_344440 ?auto_344441 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_344760 - DIRECTION
      ?auto_344761 - MODE
      ?auto_344763 - DIRECTION
      ?auto_344762 - MODE
      ?auto_344764 - DIRECTION
      ?auto_344765 - MODE
      ?auto_344766 - DIRECTION
      ?auto_344767 - MODE
      ?auto_344768 - DIRECTION
      ?auto_344769 - MODE
    )
    :vars
    (
      ?auto_344777 - INSTRUMENT
      ?auto_344770 - SATELLITE
      ?auto_344771 - DIRECTION
      ?auto_344776 - INSTRUMENT
      ?auto_344773 - INSTRUMENT
      ?auto_344774 - INSTRUMENT
      ?auto_344775 - INSTRUMENT
      ?auto_344772 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_344763 ?auto_344760 ) ) ( not ( = ?auto_344764 ?auto_344760 ) ) ( not ( = ?auto_344764 ?auto_344763 ) ) ( not ( = ?auto_344766 ?auto_344760 ) ) ( not ( = ?auto_344766 ?auto_344763 ) ) ( not ( = ?auto_344766 ?auto_344764 ) ) ( not ( = ?auto_344768 ?auto_344760 ) ) ( not ( = ?auto_344768 ?auto_344763 ) ) ( not ( = ?auto_344768 ?auto_344764 ) ) ( not ( = ?auto_344768 ?auto_344766 ) ) ( ON_BOARD ?auto_344777 ?auto_344770 ) ( SUPPORTS ?auto_344777 ?auto_344765 ) ( not ( = ?auto_344764 ?auto_344771 ) ) ( CALIBRATION_TARGET ?auto_344777 ?auto_344771 ) ( not ( = ?auto_344771 ?auto_344763 ) ) ( ON_BOARD ?auto_344776 ?auto_344770 ) ( not ( = ?auto_344777 ?auto_344776 ) ) ( SUPPORTS ?auto_344776 ?auto_344762 ) ( CALIBRATION_TARGET ?auto_344776 ?auto_344771 ) ( not ( = ?auto_344771 ?auto_344768 ) ) ( ON_BOARD ?auto_344773 ?auto_344770 ) ( not ( = ?auto_344776 ?auto_344773 ) ) ( SUPPORTS ?auto_344773 ?auto_344769 ) ( CALIBRATION_TARGET ?auto_344773 ?auto_344771 ) ( not ( = ?auto_344771 ?auto_344760 ) ) ( ON_BOARD ?auto_344774 ?auto_344770 ) ( not ( = ?auto_344773 ?auto_344774 ) ) ( SUPPORTS ?auto_344774 ?auto_344761 ) ( CALIBRATION_TARGET ?auto_344774 ?auto_344771 ) ( not ( = ?auto_344771 ?auto_344766 ) ) ( ON_BOARD ?auto_344775 ?auto_344770 ) ( not ( = ?auto_344774 ?auto_344775 ) ) ( SUPPORTS ?auto_344775 ?auto_344767 ) ( CALIBRATION_TARGET ?auto_344775 ?auto_344771 ) ( POWER_AVAIL ?auto_344770 ) ( POINTING ?auto_344770 ?auto_344772 ) ( not ( = ?auto_344771 ?auto_344772 ) ) ( not ( = ?auto_344766 ?auto_344772 ) ) ( not ( = ?auto_344767 ?auto_344761 ) ) ( not ( = ?auto_344760 ?auto_344772 ) ) ( not ( = ?auto_344767 ?auto_344769 ) ) ( not ( = ?auto_344761 ?auto_344769 ) ) ( not ( = ?auto_344768 ?auto_344772 ) ) ( not ( = ?auto_344773 ?auto_344775 ) ) ( not ( = ?auto_344767 ?auto_344762 ) ) ( not ( = ?auto_344761 ?auto_344762 ) ) ( not ( = ?auto_344769 ?auto_344762 ) ) ( not ( = ?auto_344763 ?auto_344772 ) ) ( not ( = ?auto_344776 ?auto_344774 ) ) ( not ( = ?auto_344776 ?auto_344775 ) ) ( not ( = ?auto_344767 ?auto_344765 ) ) ( not ( = ?auto_344761 ?auto_344765 ) ) ( not ( = ?auto_344769 ?auto_344765 ) ) ( not ( = ?auto_344762 ?auto_344765 ) ) ( not ( = ?auto_344764 ?auto_344772 ) ) ( not ( = ?auto_344777 ?auto_344773 ) ) ( not ( = ?auto_344777 ?auto_344774 ) ) ( not ( = ?auto_344777 ?auto_344775 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_344766 ?auto_344767 ?auto_344760 ?auto_344761 ?auto_344768 ?auto_344769 ?auto_344764 ?auto_344765 ?auto_344763 ?auto_344762 )
      ( GET-5IMAGE-VERIFY ?auto_344760 ?auto_344761 ?auto_344763 ?auto_344762 ?auto_344764 ?auto_344765 ?auto_344766 ?auto_344767 ?auto_344768 ?auto_344769 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_344924 - DIRECTION
      ?auto_344925 - MODE
      ?auto_344927 - DIRECTION
      ?auto_344926 - MODE
      ?auto_344928 - DIRECTION
      ?auto_344929 - MODE
      ?auto_344930 - DIRECTION
      ?auto_344931 - MODE
      ?auto_344932 - DIRECTION
      ?auto_344933 - MODE
    )
    :vars
    (
      ?auto_344941 - INSTRUMENT
      ?auto_344934 - SATELLITE
      ?auto_344935 - DIRECTION
      ?auto_344940 - INSTRUMENT
      ?auto_344937 - INSTRUMENT
      ?auto_344938 - INSTRUMENT
      ?auto_344939 - INSTRUMENT
      ?auto_344936 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_344927 ?auto_344924 ) ) ( not ( = ?auto_344928 ?auto_344924 ) ) ( not ( = ?auto_344928 ?auto_344927 ) ) ( not ( = ?auto_344930 ?auto_344924 ) ) ( not ( = ?auto_344930 ?auto_344927 ) ) ( not ( = ?auto_344930 ?auto_344928 ) ) ( not ( = ?auto_344932 ?auto_344924 ) ) ( not ( = ?auto_344932 ?auto_344927 ) ) ( not ( = ?auto_344932 ?auto_344928 ) ) ( not ( = ?auto_344932 ?auto_344930 ) ) ( ON_BOARD ?auto_344941 ?auto_344934 ) ( SUPPORTS ?auto_344941 ?auto_344929 ) ( not ( = ?auto_344928 ?auto_344935 ) ) ( CALIBRATION_TARGET ?auto_344941 ?auto_344935 ) ( not ( = ?auto_344935 ?auto_344927 ) ) ( ON_BOARD ?auto_344940 ?auto_344934 ) ( not ( = ?auto_344941 ?auto_344940 ) ) ( SUPPORTS ?auto_344940 ?auto_344926 ) ( CALIBRATION_TARGET ?auto_344940 ?auto_344935 ) ( not ( = ?auto_344935 ?auto_344930 ) ) ( ON_BOARD ?auto_344937 ?auto_344934 ) ( not ( = ?auto_344940 ?auto_344937 ) ) ( SUPPORTS ?auto_344937 ?auto_344931 ) ( CALIBRATION_TARGET ?auto_344937 ?auto_344935 ) ( not ( = ?auto_344935 ?auto_344924 ) ) ( ON_BOARD ?auto_344938 ?auto_344934 ) ( not ( = ?auto_344937 ?auto_344938 ) ) ( SUPPORTS ?auto_344938 ?auto_344925 ) ( CALIBRATION_TARGET ?auto_344938 ?auto_344935 ) ( not ( = ?auto_344935 ?auto_344932 ) ) ( ON_BOARD ?auto_344939 ?auto_344934 ) ( not ( = ?auto_344938 ?auto_344939 ) ) ( SUPPORTS ?auto_344939 ?auto_344933 ) ( CALIBRATION_TARGET ?auto_344939 ?auto_344935 ) ( POWER_AVAIL ?auto_344934 ) ( POINTING ?auto_344934 ?auto_344936 ) ( not ( = ?auto_344935 ?auto_344936 ) ) ( not ( = ?auto_344932 ?auto_344936 ) ) ( not ( = ?auto_344933 ?auto_344925 ) ) ( not ( = ?auto_344924 ?auto_344936 ) ) ( not ( = ?auto_344933 ?auto_344931 ) ) ( not ( = ?auto_344925 ?auto_344931 ) ) ( not ( = ?auto_344930 ?auto_344936 ) ) ( not ( = ?auto_344937 ?auto_344939 ) ) ( not ( = ?auto_344933 ?auto_344926 ) ) ( not ( = ?auto_344925 ?auto_344926 ) ) ( not ( = ?auto_344931 ?auto_344926 ) ) ( not ( = ?auto_344927 ?auto_344936 ) ) ( not ( = ?auto_344940 ?auto_344938 ) ) ( not ( = ?auto_344940 ?auto_344939 ) ) ( not ( = ?auto_344933 ?auto_344929 ) ) ( not ( = ?auto_344925 ?auto_344929 ) ) ( not ( = ?auto_344931 ?auto_344929 ) ) ( not ( = ?auto_344926 ?auto_344929 ) ) ( not ( = ?auto_344928 ?auto_344936 ) ) ( not ( = ?auto_344941 ?auto_344937 ) ) ( not ( = ?auto_344941 ?auto_344938 ) ) ( not ( = ?auto_344941 ?auto_344939 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_344932 ?auto_344933 ?auto_344924 ?auto_344925 ?auto_344930 ?auto_344931 ?auto_344928 ?auto_344929 ?auto_344927 ?auto_344926 )
      ( GET-5IMAGE-VERIFY ?auto_344924 ?auto_344925 ?auto_344927 ?auto_344926 ?auto_344928 ?auto_344929 ?auto_344930 ?auto_344931 ?auto_344932 ?auto_344933 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_345506 - DIRECTION
      ?auto_345507 - MODE
      ?auto_345509 - DIRECTION
      ?auto_345508 - MODE
      ?auto_345510 - DIRECTION
      ?auto_345511 - MODE
      ?auto_345512 - DIRECTION
      ?auto_345513 - MODE
      ?auto_345514 - DIRECTION
      ?auto_345515 - MODE
    )
    :vars
    (
      ?auto_345523 - INSTRUMENT
      ?auto_345516 - SATELLITE
      ?auto_345517 - DIRECTION
      ?auto_345522 - INSTRUMENT
      ?auto_345519 - INSTRUMENT
      ?auto_345520 - INSTRUMENT
      ?auto_345521 - INSTRUMENT
      ?auto_345518 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_345509 ?auto_345506 ) ) ( not ( = ?auto_345510 ?auto_345506 ) ) ( not ( = ?auto_345510 ?auto_345509 ) ) ( not ( = ?auto_345512 ?auto_345506 ) ) ( not ( = ?auto_345512 ?auto_345509 ) ) ( not ( = ?auto_345512 ?auto_345510 ) ) ( not ( = ?auto_345514 ?auto_345506 ) ) ( not ( = ?auto_345514 ?auto_345509 ) ) ( not ( = ?auto_345514 ?auto_345510 ) ) ( not ( = ?auto_345514 ?auto_345512 ) ) ( ON_BOARD ?auto_345523 ?auto_345516 ) ( SUPPORTS ?auto_345523 ?auto_345508 ) ( not ( = ?auto_345509 ?auto_345517 ) ) ( CALIBRATION_TARGET ?auto_345523 ?auto_345517 ) ( not ( = ?auto_345517 ?auto_345514 ) ) ( ON_BOARD ?auto_345522 ?auto_345516 ) ( not ( = ?auto_345523 ?auto_345522 ) ) ( SUPPORTS ?auto_345522 ?auto_345515 ) ( CALIBRATION_TARGET ?auto_345522 ?auto_345517 ) ( not ( = ?auto_345517 ?auto_345512 ) ) ( ON_BOARD ?auto_345519 ?auto_345516 ) ( not ( = ?auto_345522 ?auto_345519 ) ) ( SUPPORTS ?auto_345519 ?auto_345513 ) ( CALIBRATION_TARGET ?auto_345519 ?auto_345517 ) ( not ( = ?auto_345517 ?auto_345506 ) ) ( ON_BOARD ?auto_345520 ?auto_345516 ) ( not ( = ?auto_345519 ?auto_345520 ) ) ( SUPPORTS ?auto_345520 ?auto_345507 ) ( CALIBRATION_TARGET ?auto_345520 ?auto_345517 ) ( not ( = ?auto_345517 ?auto_345510 ) ) ( ON_BOARD ?auto_345521 ?auto_345516 ) ( not ( = ?auto_345520 ?auto_345521 ) ) ( SUPPORTS ?auto_345521 ?auto_345511 ) ( CALIBRATION_TARGET ?auto_345521 ?auto_345517 ) ( POWER_AVAIL ?auto_345516 ) ( POINTING ?auto_345516 ?auto_345518 ) ( not ( = ?auto_345517 ?auto_345518 ) ) ( not ( = ?auto_345510 ?auto_345518 ) ) ( not ( = ?auto_345511 ?auto_345507 ) ) ( not ( = ?auto_345506 ?auto_345518 ) ) ( not ( = ?auto_345511 ?auto_345513 ) ) ( not ( = ?auto_345507 ?auto_345513 ) ) ( not ( = ?auto_345512 ?auto_345518 ) ) ( not ( = ?auto_345519 ?auto_345521 ) ) ( not ( = ?auto_345511 ?auto_345515 ) ) ( not ( = ?auto_345507 ?auto_345515 ) ) ( not ( = ?auto_345513 ?auto_345515 ) ) ( not ( = ?auto_345514 ?auto_345518 ) ) ( not ( = ?auto_345522 ?auto_345520 ) ) ( not ( = ?auto_345522 ?auto_345521 ) ) ( not ( = ?auto_345511 ?auto_345508 ) ) ( not ( = ?auto_345507 ?auto_345508 ) ) ( not ( = ?auto_345513 ?auto_345508 ) ) ( not ( = ?auto_345515 ?auto_345508 ) ) ( not ( = ?auto_345509 ?auto_345518 ) ) ( not ( = ?auto_345523 ?auto_345519 ) ) ( not ( = ?auto_345523 ?auto_345520 ) ) ( not ( = ?auto_345523 ?auto_345521 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_345510 ?auto_345511 ?auto_345506 ?auto_345507 ?auto_345512 ?auto_345513 ?auto_345509 ?auto_345508 ?auto_345514 ?auto_345515 )
      ( GET-5IMAGE-VERIFY ?auto_345506 ?auto_345507 ?auto_345509 ?auto_345508 ?auto_345510 ?auto_345511 ?auto_345512 ?auto_345513 ?auto_345514 ?auto_345515 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_345584 - DIRECTION
      ?auto_345585 - MODE
      ?auto_345587 - DIRECTION
      ?auto_345586 - MODE
      ?auto_345588 - DIRECTION
      ?auto_345589 - MODE
      ?auto_345590 - DIRECTION
      ?auto_345591 - MODE
      ?auto_345592 - DIRECTION
      ?auto_345593 - MODE
    )
    :vars
    (
      ?auto_345601 - INSTRUMENT
      ?auto_345594 - SATELLITE
      ?auto_345595 - DIRECTION
      ?auto_345600 - INSTRUMENT
      ?auto_345597 - INSTRUMENT
      ?auto_345598 - INSTRUMENT
      ?auto_345599 - INSTRUMENT
      ?auto_345596 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_345587 ?auto_345584 ) ) ( not ( = ?auto_345588 ?auto_345584 ) ) ( not ( = ?auto_345588 ?auto_345587 ) ) ( not ( = ?auto_345590 ?auto_345584 ) ) ( not ( = ?auto_345590 ?auto_345587 ) ) ( not ( = ?auto_345590 ?auto_345588 ) ) ( not ( = ?auto_345592 ?auto_345584 ) ) ( not ( = ?auto_345592 ?auto_345587 ) ) ( not ( = ?auto_345592 ?auto_345588 ) ) ( not ( = ?auto_345592 ?auto_345590 ) ) ( ON_BOARD ?auto_345601 ?auto_345594 ) ( SUPPORTS ?auto_345601 ?auto_345586 ) ( not ( = ?auto_345587 ?auto_345595 ) ) ( CALIBRATION_TARGET ?auto_345601 ?auto_345595 ) ( not ( = ?auto_345595 ?auto_345590 ) ) ( ON_BOARD ?auto_345600 ?auto_345594 ) ( not ( = ?auto_345601 ?auto_345600 ) ) ( SUPPORTS ?auto_345600 ?auto_345591 ) ( CALIBRATION_TARGET ?auto_345600 ?auto_345595 ) ( not ( = ?auto_345595 ?auto_345592 ) ) ( ON_BOARD ?auto_345597 ?auto_345594 ) ( not ( = ?auto_345600 ?auto_345597 ) ) ( SUPPORTS ?auto_345597 ?auto_345593 ) ( CALIBRATION_TARGET ?auto_345597 ?auto_345595 ) ( not ( = ?auto_345595 ?auto_345584 ) ) ( ON_BOARD ?auto_345598 ?auto_345594 ) ( not ( = ?auto_345597 ?auto_345598 ) ) ( SUPPORTS ?auto_345598 ?auto_345585 ) ( CALIBRATION_TARGET ?auto_345598 ?auto_345595 ) ( not ( = ?auto_345595 ?auto_345588 ) ) ( ON_BOARD ?auto_345599 ?auto_345594 ) ( not ( = ?auto_345598 ?auto_345599 ) ) ( SUPPORTS ?auto_345599 ?auto_345589 ) ( CALIBRATION_TARGET ?auto_345599 ?auto_345595 ) ( POWER_AVAIL ?auto_345594 ) ( POINTING ?auto_345594 ?auto_345596 ) ( not ( = ?auto_345595 ?auto_345596 ) ) ( not ( = ?auto_345588 ?auto_345596 ) ) ( not ( = ?auto_345589 ?auto_345585 ) ) ( not ( = ?auto_345584 ?auto_345596 ) ) ( not ( = ?auto_345589 ?auto_345593 ) ) ( not ( = ?auto_345585 ?auto_345593 ) ) ( not ( = ?auto_345592 ?auto_345596 ) ) ( not ( = ?auto_345597 ?auto_345599 ) ) ( not ( = ?auto_345589 ?auto_345591 ) ) ( not ( = ?auto_345585 ?auto_345591 ) ) ( not ( = ?auto_345593 ?auto_345591 ) ) ( not ( = ?auto_345590 ?auto_345596 ) ) ( not ( = ?auto_345600 ?auto_345598 ) ) ( not ( = ?auto_345600 ?auto_345599 ) ) ( not ( = ?auto_345589 ?auto_345586 ) ) ( not ( = ?auto_345585 ?auto_345586 ) ) ( not ( = ?auto_345593 ?auto_345586 ) ) ( not ( = ?auto_345591 ?auto_345586 ) ) ( not ( = ?auto_345587 ?auto_345596 ) ) ( not ( = ?auto_345601 ?auto_345597 ) ) ( not ( = ?auto_345601 ?auto_345598 ) ) ( not ( = ?auto_345601 ?auto_345599 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_345588 ?auto_345589 ?auto_345584 ?auto_345585 ?auto_345592 ?auto_345593 ?auto_345587 ?auto_345586 ?auto_345590 ?auto_345591 )
      ( GET-5IMAGE-VERIFY ?auto_345584 ?auto_345585 ?auto_345587 ?auto_345586 ?auto_345588 ?auto_345589 ?auto_345590 ?auto_345591 ?auto_345592 ?auto_345593 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_346354 - DIRECTION
      ?auto_346355 - MODE
      ?auto_346357 - DIRECTION
      ?auto_346356 - MODE
      ?auto_346358 - DIRECTION
      ?auto_346359 - MODE
      ?auto_346360 - DIRECTION
      ?auto_346361 - MODE
      ?auto_346362 - DIRECTION
      ?auto_346363 - MODE
    )
    :vars
    (
      ?auto_346371 - INSTRUMENT
      ?auto_346364 - SATELLITE
      ?auto_346365 - DIRECTION
      ?auto_346370 - INSTRUMENT
      ?auto_346367 - INSTRUMENT
      ?auto_346368 - INSTRUMENT
      ?auto_346369 - INSTRUMENT
      ?auto_346366 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_346357 ?auto_346354 ) ) ( not ( = ?auto_346358 ?auto_346354 ) ) ( not ( = ?auto_346358 ?auto_346357 ) ) ( not ( = ?auto_346360 ?auto_346354 ) ) ( not ( = ?auto_346360 ?auto_346357 ) ) ( not ( = ?auto_346360 ?auto_346358 ) ) ( not ( = ?auto_346362 ?auto_346354 ) ) ( not ( = ?auto_346362 ?auto_346357 ) ) ( not ( = ?auto_346362 ?auto_346358 ) ) ( not ( = ?auto_346362 ?auto_346360 ) ) ( ON_BOARD ?auto_346371 ?auto_346364 ) ( SUPPORTS ?auto_346371 ?auto_346356 ) ( not ( = ?auto_346357 ?auto_346365 ) ) ( CALIBRATION_TARGET ?auto_346371 ?auto_346365 ) ( not ( = ?auto_346365 ?auto_346362 ) ) ( ON_BOARD ?auto_346370 ?auto_346364 ) ( not ( = ?auto_346371 ?auto_346370 ) ) ( SUPPORTS ?auto_346370 ?auto_346363 ) ( CALIBRATION_TARGET ?auto_346370 ?auto_346365 ) ( not ( = ?auto_346365 ?auto_346358 ) ) ( ON_BOARD ?auto_346367 ?auto_346364 ) ( not ( = ?auto_346370 ?auto_346367 ) ) ( SUPPORTS ?auto_346367 ?auto_346359 ) ( CALIBRATION_TARGET ?auto_346367 ?auto_346365 ) ( not ( = ?auto_346365 ?auto_346354 ) ) ( ON_BOARD ?auto_346368 ?auto_346364 ) ( not ( = ?auto_346367 ?auto_346368 ) ) ( SUPPORTS ?auto_346368 ?auto_346355 ) ( CALIBRATION_TARGET ?auto_346368 ?auto_346365 ) ( not ( = ?auto_346365 ?auto_346360 ) ) ( ON_BOARD ?auto_346369 ?auto_346364 ) ( not ( = ?auto_346368 ?auto_346369 ) ) ( SUPPORTS ?auto_346369 ?auto_346361 ) ( CALIBRATION_TARGET ?auto_346369 ?auto_346365 ) ( POWER_AVAIL ?auto_346364 ) ( POINTING ?auto_346364 ?auto_346366 ) ( not ( = ?auto_346365 ?auto_346366 ) ) ( not ( = ?auto_346360 ?auto_346366 ) ) ( not ( = ?auto_346361 ?auto_346355 ) ) ( not ( = ?auto_346354 ?auto_346366 ) ) ( not ( = ?auto_346361 ?auto_346359 ) ) ( not ( = ?auto_346355 ?auto_346359 ) ) ( not ( = ?auto_346358 ?auto_346366 ) ) ( not ( = ?auto_346367 ?auto_346369 ) ) ( not ( = ?auto_346361 ?auto_346363 ) ) ( not ( = ?auto_346355 ?auto_346363 ) ) ( not ( = ?auto_346359 ?auto_346363 ) ) ( not ( = ?auto_346362 ?auto_346366 ) ) ( not ( = ?auto_346370 ?auto_346368 ) ) ( not ( = ?auto_346370 ?auto_346369 ) ) ( not ( = ?auto_346361 ?auto_346356 ) ) ( not ( = ?auto_346355 ?auto_346356 ) ) ( not ( = ?auto_346359 ?auto_346356 ) ) ( not ( = ?auto_346363 ?auto_346356 ) ) ( not ( = ?auto_346357 ?auto_346366 ) ) ( not ( = ?auto_346371 ?auto_346367 ) ) ( not ( = ?auto_346371 ?auto_346368 ) ) ( not ( = ?auto_346371 ?auto_346369 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_346360 ?auto_346361 ?auto_346354 ?auto_346355 ?auto_346358 ?auto_346359 ?auto_346357 ?auto_346356 ?auto_346362 ?auto_346363 )
      ( GET-5IMAGE-VERIFY ?auto_346354 ?auto_346355 ?auto_346357 ?auto_346356 ?auto_346358 ?auto_346359 ?auto_346360 ?auto_346361 ?auto_346362 ?auto_346363 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_346604 - DIRECTION
      ?auto_346605 - MODE
      ?auto_346607 - DIRECTION
      ?auto_346606 - MODE
      ?auto_346608 - DIRECTION
      ?auto_346609 - MODE
      ?auto_346610 - DIRECTION
      ?auto_346611 - MODE
      ?auto_346612 - DIRECTION
      ?auto_346613 - MODE
    )
    :vars
    (
      ?auto_346621 - INSTRUMENT
      ?auto_346614 - SATELLITE
      ?auto_346615 - DIRECTION
      ?auto_346620 - INSTRUMENT
      ?auto_346617 - INSTRUMENT
      ?auto_346618 - INSTRUMENT
      ?auto_346619 - INSTRUMENT
      ?auto_346616 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_346607 ?auto_346604 ) ) ( not ( = ?auto_346608 ?auto_346604 ) ) ( not ( = ?auto_346608 ?auto_346607 ) ) ( not ( = ?auto_346610 ?auto_346604 ) ) ( not ( = ?auto_346610 ?auto_346607 ) ) ( not ( = ?auto_346610 ?auto_346608 ) ) ( not ( = ?auto_346612 ?auto_346604 ) ) ( not ( = ?auto_346612 ?auto_346607 ) ) ( not ( = ?auto_346612 ?auto_346608 ) ) ( not ( = ?auto_346612 ?auto_346610 ) ) ( ON_BOARD ?auto_346621 ?auto_346614 ) ( SUPPORTS ?auto_346621 ?auto_346606 ) ( not ( = ?auto_346607 ?auto_346615 ) ) ( CALIBRATION_TARGET ?auto_346621 ?auto_346615 ) ( not ( = ?auto_346615 ?auto_346610 ) ) ( ON_BOARD ?auto_346620 ?auto_346614 ) ( not ( = ?auto_346621 ?auto_346620 ) ) ( SUPPORTS ?auto_346620 ?auto_346611 ) ( CALIBRATION_TARGET ?auto_346620 ?auto_346615 ) ( not ( = ?auto_346615 ?auto_346608 ) ) ( ON_BOARD ?auto_346617 ?auto_346614 ) ( not ( = ?auto_346620 ?auto_346617 ) ) ( SUPPORTS ?auto_346617 ?auto_346609 ) ( CALIBRATION_TARGET ?auto_346617 ?auto_346615 ) ( not ( = ?auto_346615 ?auto_346604 ) ) ( ON_BOARD ?auto_346618 ?auto_346614 ) ( not ( = ?auto_346617 ?auto_346618 ) ) ( SUPPORTS ?auto_346618 ?auto_346605 ) ( CALIBRATION_TARGET ?auto_346618 ?auto_346615 ) ( not ( = ?auto_346615 ?auto_346612 ) ) ( ON_BOARD ?auto_346619 ?auto_346614 ) ( not ( = ?auto_346618 ?auto_346619 ) ) ( SUPPORTS ?auto_346619 ?auto_346613 ) ( CALIBRATION_TARGET ?auto_346619 ?auto_346615 ) ( POWER_AVAIL ?auto_346614 ) ( POINTING ?auto_346614 ?auto_346616 ) ( not ( = ?auto_346615 ?auto_346616 ) ) ( not ( = ?auto_346612 ?auto_346616 ) ) ( not ( = ?auto_346613 ?auto_346605 ) ) ( not ( = ?auto_346604 ?auto_346616 ) ) ( not ( = ?auto_346613 ?auto_346609 ) ) ( not ( = ?auto_346605 ?auto_346609 ) ) ( not ( = ?auto_346608 ?auto_346616 ) ) ( not ( = ?auto_346617 ?auto_346619 ) ) ( not ( = ?auto_346613 ?auto_346611 ) ) ( not ( = ?auto_346605 ?auto_346611 ) ) ( not ( = ?auto_346609 ?auto_346611 ) ) ( not ( = ?auto_346610 ?auto_346616 ) ) ( not ( = ?auto_346620 ?auto_346618 ) ) ( not ( = ?auto_346620 ?auto_346619 ) ) ( not ( = ?auto_346613 ?auto_346606 ) ) ( not ( = ?auto_346605 ?auto_346606 ) ) ( not ( = ?auto_346609 ?auto_346606 ) ) ( not ( = ?auto_346611 ?auto_346606 ) ) ( not ( = ?auto_346607 ?auto_346616 ) ) ( not ( = ?auto_346621 ?auto_346617 ) ) ( not ( = ?auto_346621 ?auto_346618 ) ) ( not ( = ?auto_346621 ?auto_346619 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_346612 ?auto_346613 ?auto_346604 ?auto_346605 ?auto_346608 ?auto_346609 ?auto_346607 ?auto_346606 ?auto_346610 ?auto_346611 )
      ( GET-5IMAGE-VERIFY ?auto_346604 ?auto_346605 ?auto_346607 ?auto_346606 ?auto_346608 ?auto_346609 ?auto_346610 ?auto_346611 ?auto_346612 ?auto_346613 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_346848 - DIRECTION
      ?auto_346849 - MODE
      ?auto_346851 - DIRECTION
      ?auto_346850 - MODE
      ?auto_346852 - DIRECTION
      ?auto_346853 - MODE
      ?auto_346854 - DIRECTION
      ?auto_346855 - MODE
      ?auto_346856 - DIRECTION
      ?auto_346857 - MODE
    )
    :vars
    (
      ?auto_346865 - INSTRUMENT
      ?auto_346858 - SATELLITE
      ?auto_346859 - DIRECTION
      ?auto_346864 - INSTRUMENT
      ?auto_346861 - INSTRUMENT
      ?auto_346862 - INSTRUMENT
      ?auto_346863 - INSTRUMENT
      ?auto_346860 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_346851 ?auto_346848 ) ) ( not ( = ?auto_346852 ?auto_346848 ) ) ( not ( = ?auto_346852 ?auto_346851 ) ) ( not ( = ?auto_346854 ?auto_346848 ) ) ( not ( = ?auto_346854 ?auto_346851 ) ) ( not ( = ?auto_346854 ?auto_346852 ) ) ( not ( = ?auto_346856 ?auto_346848 ) ) ( not ( = ?auto_346856 ?auto_346851 ) ) ( not ( = ?auto_346856 ?auto_346852 ) ) ( not ( = ?auto_346856 ?auto_346854 ) ) ( ON_BOARD ?auto_346865 ?auto_346858 ) ( SUPPORTS ?auto_346865 ?auto_346850 ) ( not ( = ?auto_346851 ?auto_346859 ) ) ( CALIBRATION_TARGET ?auto_346865 ?auto_346859 ) ( not ( = ?auto_346859 ?auto_346852 ) ) ( ON_BOARD ?auto_346864 ?auto_346858 ) ( not ( = ?auto_346865 ?auto_346864 ) ) ( SUPPORTS ?auto_346864 ?auto_346853 ) ( CALIBRATION_TARGET ?auto_346864 ?auto_346859 ) ( not ( = ?auto_346859 ?auto_346856 ) ) ( ON_BOARD ?auto_346861 ?auto_346858 ) ( not ( = ?auto_346864 ?auto_346861 ) ) ( SUPPORTS ?auto_346861 ?auto_346857 ) ( CALIBRATION_TARGET ?auto_346861 ?auto_346859 ) ( not ( = ?auto_346859 ?auto_346848 ) ) ( ON_BOARD ?auto_346862 ?auto_346858 ) ( not ( = ?auto_346861 ?auto_346862 ) ) ( SUPPORTS ?auto_346862 ?auto_346849 ) ( CALIBRATION_TARGET ?auto_346862 ?auto_346859 ) ( not ( = ?auto_346859 ?auto_346854 ) ) ( ON_BOARD ?auto_346863 ?auto_346858 ) ( not ( = ?auto_346862 ?auto_346863 ) ) ( SUPPORTS ?auto_346863 ?auto_346855 ) ( CALIBRATION_TARGET ?auto_346863 ?auto_346859 ) ( POWER_AVAIL ?auto_346858 ) ( POINTING ?auto_346858 ?auto_346860 ) ( not ( = ?auto_346859 ?auto_346860 ) ) ( not ( = ?auto_346854 ?auto_346860 ) ) ( not ( = ?auto_346855 ?auto_346849 ) ) ( not ( = ?auto_346848 ?auto_346860 ) ) ( not ( = ?auto_346855 ?auto_346857 ) ) ( not ( = ?auto_346849 ?auto_346857 ) ) ( not ( = ?auto_346856 ?auto_346860 ) ) ( not ( = ?auto_346861 ?auto_346863 ) ) ( not ( = ?auto_346855 ?auto_346853 ) ) ( not ( = ?auto_346849 ?auto_346853 ) ) ( not ( = ?auto_346857 ?auto_346853 ) ) ( not ( = ?auto_346852 ?auto_346860 ) ) ( not ( = ?auto_346864 ?auto_346862 ) ) ( not ( = ?auto_346864 ?auto_346863 ) ) ( not ( = ?auto_346855 ?auto_346850 ) ) ( not ( = ?auto_346849 ?auto_346850 ) ) ( not ( = ?auto_346857 ?auto_346850 ) ) ( not ( = ?auto_346853 ?auto_346850 ) ) ( not ( = ?auto_346851 ?auto_346860 ) ) ( not ( = ?auto_346865 ?auto_346861 ) ) ( not ( = ?auto_346865 ?auto_346862 ) ) ( not ( = ?auto_346865 ?auto_346863 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_346854 ?auto_346855 ?auto_346848 ?auto_346849 ?auto_346856 ?auto_346857 ?auto_346851 ?auto_346850 ?auto_346852 ?auto_346853 )
      ( GET-5IMAGE-VERIFY ?auto_346848 ?auto_346849 ?auto_346851 ?auto_346850 ?auto_346852 ?auto_346853 ?auto_346854 ?auto_346855 ?auto_346856 ?auto_346857 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_347012 - DIRECTION
      ?auto_347013 - MODE
      ?auto_347015 - DIRECTION
      ?auto_347014 - MODE
      ?auto_347016 - DIRECTION
      ?auto_347017 - MODE
      ?auto_347018 - DIRECTION
      ?auto_347019 - MODE
      ?auto_347020 - DIRECTION
      ?auto_347021 - MODE
    )
    :vars
    (
      ?auto_347029 - INSTRUMENT
      ?auto_347022 - SATELLITE
      ?auto_347023 - DIRECTION
      ?auto_347028 - INSTRUMENT
      ?auto_347025 - INSTRUMENT
      ?auto_347026 - INSTRUMENT
      ?auto_347027 - INSTRUMENT
      ?auto_347024 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_347015 ?auto_347012 ) ) ( not ( = ?auto_347016 ?auto_347012 ) ) ( not ( = ?auto_347016 ?auto_347015 ) ) ( not ( = ?auto_347018 ?auto_347012 ) ) ( not ( = ?auto_347018 ?auto_347015 ) ) ( not ( = ?auto_347018 ?auto_347016 ) ) ( not ( = ?auto_347020 ?auto_347012 ) ) ( not ( = ?auto_347020 ?auto_347015 ) ) ( not ( = ?auto_347020 ?auto_347016 ) ) ( not ( = ?auto_347020 ?auto_347018 ) ) ( ON_BOARD ?auto_347029 ?auto_347022 ) ( SUPPORTS ?auto_347029 ?auto_347014 ) ( not ( = ?auto_347015 ?auto_347023 ) ) ( CALIBRATION_TARGET ?auto_347029 ?auto_347023 ) ( not ( = ?auto_347023 ?auto_347016 ) ) ( ON_BOARD ?auto_347028 ?auto_347022 ) ( not ( = ?auto_347029 ?auto_347028 ) ) ( SUPPORTS ?auto_347028 ?auto_347017 ) ( CALIBRATION_TARGET ?auto_347028 ?auto_347023 ) ( not ( = ?auto_347023 ?auto_347018 ) ) ( ON_BOARD ?auto_347025 ?auto_347022 ) ( not ( = ?auto_347028 ?auto_347025 ) ) ( SUPPORTS ?auto_347025 ?auto_347019 ) ( CALIBRATION_TARGET ?auto_347025 ?auto_347023 ) ( not ( = ?auto_347023 ?auto_347012 ) ) ( ON_BOARD ?auto_347026 ?auto_347022 ) ( not ( = ?auto_347025 ?auto_347026 ) ) ( SUPPORTS ?auto_347026 ?auto_347013 ) ( CALIBRATION_TARGET ?auto_347026 ?auto_347023 ) ( not ( = ?auto_347023 ?auto_347020 ) ) ( ON_BOARD ?auto_347027 ?auto_347022 ) ( not ( = ?auto_347026 ?auto_347027 ) ) ( SUPPORTS ?auto_347027 ?auto_347021 ) ( CALIBRATION_TARGET ?auto_347027 ?auto_347023 ) ( POWER_AVAIL ?auto_347022 ) ( POINTING ?auto_347022 ?auto_347024 ) ( not ( = ?auto_347023 ?auto_347024 ) ) ( not ( = ?auto_347020 ?auto_347024 ) ) ( not ( = ?auto_347021 ?auto_347013 ) ) ( not ( = ?auto_347012 ?auto_347024 ) ) ( not ( = ?auto_347021 ?auto_347019 ) ) ( not ( = ?auto_347013 ?auto_347019 ) ) ( not ( = ?auto_347018 ?auto_347024 ) ) ( not ( = ?auto_347025 ?auto_347027 ) ) ( not ( = ?auto_347021 ?auto_347017 ) ) ( not ( = ?auto_347013 ?auto_347017 ) ) ( not ( = ?auto_347019 ?auto_347017 ) ) ( not ( = ?auto_347016 ?auto_347024 ) ) ( not ( = ?auto_347028 ?auto_347026 ) ) ( not ( = ?auto_347028 ?auto_347027 ) ) ( not ( = ?auto_347021 ?auto_347014 ) ) ( not ( = ?auto_347013 ?auto_347014 ) ) ( not ( = ?auto_347019 ?auto_347014 ) ) ( not ( = ?auto_347017 ?auto_347014 ) ) ( not ( = ?auto_347015 ?auto_347024 ) ) ( not ( = ?auto_347029 ?auto_347025 ) ) ( not ( = ?auto_347029 ?auto_347026 ) ) ( not ( = ?auto_347029 ?auto_347027 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_347020 ?auto_347021 ?auto_347012 ?auto_347013 ?auto_347018 ?auto_347019 ?auto_347015 ?auto_347014 ?auto_347016 ?auto_347017 )
      ( GET-5IMAGE-VERIFY ?auto_347012 ?auto_347013 ?auto_347015 ?auto_347014 ?auto_347016 ?auto_347017 ?auto_347018 ?auto_347019 ?auto_347020 ?auto_347021 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_348118 - DIRECTION
      ?auto_348119 - MODE
      ?auto_348121 - DIRECTION
      ?auto_348120 - MODE
      ?auto_348122 - DIRECTION
      ?auto_348123 - MODE
      ?auto_348124 - DIRECTION
      ?auto_348125 - MODE
      ?auto_348126 - DIRECTION
      ?auto_348127 - MODE
    )
    :vars
    (
      ?auto_348135 - INSTRUMENT
      ?auto_348128 - SATELLITE
      ?auto_348129 - DIRECTION
      ?auto_348134 - INSTRUMENT
      ?auto_348131 - INSTRUMENT
      ?auto_348132 - INSTRUMENT
      ?auto_348133 - INSTRUMENT
      ?auto_348130 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_348121 ?auto_348118 ) ) ( not ( = ?auto_348122 ?auto_348118 ) ) ( not ( = ?auto_348122 ?auto_348121 ) ) ( not ( = ?auto_348124 ?auto_348118 ) ) ( not ( = ?auto_348124 ?auto_348121 ) ) ( not ( = ?auto_348124 ?auto_348122 ) ) ( not ( = ?auto_348126 ?auto_348118 ) ) ( not ( = ?auto_348126 ?auto_348121 ) ) ( not ( = ?auto_348126 ?auto_348122 ) ) ( not ( = ?auto_348126 ?auto_348124 ) ) ( ON_BOARD ?auto_348135 ?auto_348128 ) ( SUPPORTS ?auto_348135 ?auto_348127 ) ( not ( = ?auto_348126 ?auto_348129 ) ) ( CALIBRATION_TARGET ?auto_348135 ?auto_348129 ) ( not ( = ?auto_348129 ?auto_348124 ) ) ( ON_BOARD ?auto_348134 ?auto_348128 ) ( not ( = ?auto_348135 ?auto_348134 ) ) ( SUPPORTS ?auto_348134 ?auto_348125 ) ( CALIBRATION_TARGET ?auto_348134 ?auto_348129 ) ( not ( = ?auto_348129 ?auto_348118 ) ) ( ON_BOARD ?auto_348131 ?auto_348128 ) ( not ( = ?auto_348134 ?auto_348131 ) ) ( SUPPORTS ?auto_348131 ?auto_348119 ) ( CALIBRATION_TARGET ?auto_348131 ?auto_348129 ) ( not ( = ?auto_348129 ?auto_348122 ) ) ( ON_BOARD ?auto_348132 ?auto_348128 ) ( not ( = ?auto_348131 ?auto_348132 ) ) ( SUPPORTS ?auto_348132 ?auto_348123 ) ( CALIBRATION_TARGET ?auto_348132 ?auto_348129 ) ( not ( = ?auto_348129 ?auto_348121 ) ) ( ON_BOARD ?auto_348133 ?auto_348128 ) ( not ( = ?auto_348132 ?auto_348133 ) ) ( SUPPORTS ?auto_348133 ?auto_348120 ) ( CALIBRATION_TARGET ?auto_348133 ?auto_348129 ) ( POWER_AVAIL ?auto_348128 ) ( POINTING ?auto_348128 ?auto_348130 ) ( not ( = ?auto_348129 ?auto_348130 ) ) ( not ( = ?auto_348121 ?auto_348130 ) ) ( not ( = ?auto_348120 ?auto_348123 ) ) ( not ( = ?auto_348122 ?auto_348130 ) ) ( not ( = ?auto_348120 ?auto_348119 ) ) ( not ( = ?auto_348123 ?auto_348119 ) ) ( not ( = ?auto_348118 ?auto_348130 ) ) ( not ( = ?auto_348131 ?auto_348133 ) ) ( not ( = ?auto_348120 ?auto_348125 ) ) ( not ( = ?auto_348123 ?auto_348125 ) ) ( not ( = ?auto_348119 ?auto_348125 ) ) ( not ( = ?auto_348124 ?auto_348130 ) ) ( not ( = ?auto_348134 ?auto_348132 ) ) ( not ( = ?auto_348134 ?auto_348133 ) ) ( not ( = ?auto_348120 ?auto_348127 ) ) ( not ( = ?auto_348123 ?auto_348127 ) ) ( not ( = ?auto_348119 ?auto_348127 ) ) ( not ( = ?auto_348125 ?auto_348127 ) ) ( not ( = ?auto_348126 ?auto_348130 ) ) ( not ( = ?auto_348135 ?auto_348131 ) ) ( not ( = ?auto_348135 ?auto_348132 ) ) ( not ( = ?auto_348135 ?auto_348133 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_348121 ?auto_348120 ?auto_348122 ?auto_348123 ?auto_348118 ?auto_348119 ?auto_348126 ?auto_348127 ?auto_348124 ?auto_348125 )
      ( GET-5IMAGE-VERIFY ?auto_348118 ?auto_348119 ?auto_348121 ?auto_348120 ?auto_348122 ?auto_348123 ?auto_348124 ?auto_348125 ?auto_348126 ?auto_348127 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_348196 - DIRECTION
      ?auto_348197 - MODE
      ?auto_348199 - DIRECTION
      ?auto_348198 - MODE
      ?auto_348200 - DIRECTION
      ?auto_348201 - MODE
      ?auto_348202 - DIRECTION
      ?auto_348203 - MODE
      ?auto_348204 - DIRECTION
      ?auto_348205 - MODE
    )
    :vars
    (
      ?auto_348213 - INSTRUMENT
      ?auto_348206 - SATELLITE
      ?auto_348207 - DIRECTION
      ?auto_348212 - INSTRUMENT
      ?auto_348209 - INSTRUMENT
      ?auto_348210 - INSTRUMENT
      ?auto_348211 - INSTRUMENT
      ?auto_348208 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_348199 ?auto_348196 ) ) ( not ( = ?auto_348200 ?auto_348196 ) ) ( not ( = ?auto_348200 ?auto_348199 ) ) ( not ( = ?auto_348202 ?auto_348196 ) ) ( not ( = ?auto_348202 ?auto_348199 ) ) ( not ( = ?auto_348202 ?auto_348200 ) ) ( not ( = ?auto_348204 ?auto_348196 ) ) ( not ( = ?auto_348204 ?auto_348199 ) ) ( not ( = ?auto_348204 ?auto_348200 ) ) ( not ( = ?auto_348204 ?auto_348202 ) ) ( ON_BOARD ?auto_348213 ?auto_348206 ) ( SUPPORTS ?auto_348213 ?auto_348203 ) ( not ( = ?auto_348202 ?auto_348207 ) ) ( CALIBRATION_TARGET ?auto_348213 ?auto_348207 ) ( not ( = ?auto_348207 ?auto_348204 ) ) ( ON_BOARD ?auto_348212 ?auto_348206 ) ( not ( = ?auto_348213 ?auto_348212 ) ) ( SUPPORTS ?auto_348212 ?auto_348205 ) ( CALIBRATION_TARGET ?auto_348212 ?auto_348207 ) ( not ( = ?auto_348207 ?auto_348196 ) ) ( ON_BOARD ?auto_348209 ?auto_348206 ) ( not ( = ?auto_348212 ?auto_348209 ) ) ( SUPPORTS ?auto_348209 ?auto_348197 ) ( CALIBRATION_TARGET ?auto_348209 ?auto_348207 ) ( not ( = ?auto_348207 ?auto_348200 ) ) ( ON_BOARD ?auto_348210 ?auto_348206 ) ( not ( = ?auto_348209 ?auto_348210 ) ) ( SUPPORTS ?auto_348210 ?auto_348201 ) ( CALIBRATION_TARGET ?auto_348210 ?auto_348207 ) ( not ( = ?auto_348207 ?auto_348199 ) ) ( ON_BOARD ?auto_348211 ?auto_348206 ) ( not ( = ?auto_348210 ?auto_348211 ) ) ( SUPPORTS ?auto_348211 ?auto_348198 ) ( CALIBRATION_TARGET ?auto_348211 ?auto_348207 ) ( POWER_AVAIL ?auto_348206 ) ( POINTING ?auto_348206 ?auto_348208 ) ( not ( = ?auto_348207 ?auto_348208 ) ) ( not ( = ?auto_348199 ?auto_348208 ) ) ( not ( = ?auto_348198 ?auto_348201 ) ) ( not ( = ?auto_348200 ?auto_348208 ) ) ( not ( = ?auto_348198 ?auto_348197 ) ) ( not ( = ?auto_348201 ?auto_348197 ) ) ( not ( = ?auto_348196 ?auto_348208 ) ) ( not ( = ?auto_348209 ?auto_348211 ) ) ( not ( = ?auto_348198 ?auto_348205 ) ) ( not ( = ?auto_348201 ?auto_348205 ) ) ( not ( = ?auto_348197 ?auto_348205 ) ) ( not ( = ?auto_348204 ?auto_348208 ) ) ( not ( = ?auto_348212 ?auto_348210 ) ) ( not ( = ?auto_348212 ?auto_348211 ) ) ( not ( = ?auto_348198 ?auto_348203 ) ) ( not ( = ?auto_348201 ?auto_348203 ) ) ( not ( = ?auto_348197 ?auto_348203 ) ) ( not ( = ?auto_348205 ?auto_348203 ) ) ( not ( = ?auto_348202 ?auto_348208 ) ) ( not ( = ?auto_348213 ?auto_348209 ) ) ( not ( = ?auto_348213 ?auto_348210 ) ) ( not ( = ?auto_348213 ?auto_348211 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_348199 ?auto_348198 ?auto_348200 ?auto_348201 ?auto_348196 ?auto_348197 ?auto_348202 ?auto_348203 ?auto_348204 ?auto_348205 )
      ( GET-5IMAGE-VERIFY ?auto_348196 ?auto_348197 ?auto_348199 ?auto_348198 ?auto_348200 ?auto_348201 ?auto_348202 ?auto_348203 ?auto_348204 ?auto_348205 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_348444 - DIRECTION
      ?auto_348445 - MODE
      ?auto_348447 - DIRECTION
      ?auto_348446 - MODE
      ?auto_348448 - DIRECTION
      ?auto_348449 - MODE
      ?auto_348450 - DIRECTION
      ?auto_348451 - MODE
      ?auto_348452 - DIRECTION
      ?auto_348453 - MODE
    )
    :vars
    (
      ?auto_348461 - INSTRUMENT
      ?auto_348454 - SATELLITE
      ?auto_348455 - DIRECTION
      ?auto_348460 - INSTRUMENT
      ?auto_348457 - INSTRUMENT
      ?auto_348458 - INSTRUMENT
      ?auto_348459 - INSTRUMENT
      ?auto_348456 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_348447 ?auto_348444 ) ) ( not ( = ?auto_348448 ?auto_348444 ) ) ( not ( = ?auto_348448 ?auto_348447 ) ) ( not ( = ?auto_348450 ?auto_348444 ) ) ( not ( = ?auto_348450 ?auto_348447 ) ) ( not ( = ?auto_348450 ?auto_348448 ) ) ( not ( = ?auto_348452 ?auto_348444 ) ) ( not ( = ?auto_348452 ?auto_348447 ) ) ( not ( = ?auto_348452 ?auto_348448 ) ) ( not ( = ?auto_348452 ?auto_348450 ) ) ( ON_BOARD ?auto_348461 ?auto_348454 ) ( SUPPORTS ?auto_348461 ?auto_348453 ) ( not ( = ?auto_348452 ?auto_348455 ) ) ( CALIBRATION_TARGET ?auto_348461 ?auto_348455 ) ( not ( = ?auto_348455 ?auto_348448 ) ) ( ON_BOARD ?auto_348460 ?auto_348454 ) ( not ( = ?auto_348461 ?auto_348460 ) ) ( SUPPORTS ?auto_348460 ?auto_348449 ) ( CALIBRATION_TARGET ?auto_348460 ?auto_348455 ) ( not ( = ?auto_348455 ?auto_348444 ) ) ( ON_BOARD ?auto_348457 ?auto_348454 ) ( not ( = ?auto_348460 ?auto_348457 ) ) ( SUPPORTS ?auto_348457 ?auto_348445 ) ( CALIBRATION_TARGET ?auto_348457 ?auto_348455 ) ( not ( = ?auto_348455 ?auto_348450 ) ) ( ON_BOARD ?auto_348458 ?auto_348454 ) ( not ( = ?auto_348457 ?auto_348458 ) ) ( SUPPORTS ?auto_348458 ?auto_348451 ) ( CALIBRATION_TARGET ?auto_348458 ?auto_348455 ) ( not ( = ?auto_348455 ?auto_348447 ) ) ( ON_BOARD ?auto_348459 ?auto_348454 ) ( not ( = ?auto_348458 ?auto_348459 ) ) ( SUPPORTS ?auto_348459 ?auto_348446 ) ( CALIBRATION_TARGET ?auto_348459 ?auto_348455 ) ( POWER_AVAIL ?auto_348454 ) ( POINTING ?auto_348454 ?auto_348456 ) ( not ( = ?auto_348455 ?auto_348456 ) ) ( not ( = ?auto_348447 ?auto_348456 ) ) ( not ( = ?auto_348446 ?auto_348451 ) ) ( not ( = ?auto_348450 ?auto_348456 ) ) ( not ( = ?auto_348446 ?auto_348445 ) ) ( not ( = ?auto_348451 ?auto_348445 ) ) ( not ( = ?auto_348444 ?auto_348456 ) ) ( not ( = ?auto_348457 ?auto_348459 ) ) ( not ( = ?auto_348446 ?auto_348449 ) ) ( not ( = ?auto_348451 ?auto_348449 ) ) ( not ( = ?auto_348445 ?auto_348449 ) ) ( not ( = ?auto_348448 ?auto_348456 ) ) ( not ( = ?auto_348460 ?auto_348458 ) ) ( not ( = ?auto_348460 ?auto_348459 ) ) ( not ( = ?auto_348446 ?auto_348453 ) ) ( not ( = ?auto_348451 ?auto_348453 ) ) ( not ( = ?auto_348445 ?auto_348453 ) ) ( not ( = ?auto_348449 ?auto_348453 ) ) ( not ( = ?auto_348452 ?auto_348456 ) ) ( not ( = ?auto_348461 ?auto_348457 ) ) ( not ( = ?auto_348461 ?auto_348458 ) ) ( not ( = ?auto_348461 ?auto_348459 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_348447 ?auto_348446 ?auto_348450 ?auto_348451 ?auto_348444 ?auto_348445 ?auto_348452 ?auto_348453 ?auto_348448 ?auto_348449 )
      ( GET-5IMAGE-VERIFY ?auto_348444 ?auto_348445 ?auto_348447 ?auto_348446 ?auto_348448 ?auto_348449 ?auto_348450 ?auto_348451 ?auto_348452 ?auto_348453 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_348522 - DIRECTION
      ?auto_348523 - MODE
      ?auto_348525 - DIRECTION
      ?auto_348524 - MODE
      ?auto_348526 - DIRECTION
      ?auto_348527 - MODE
      ?auto_348528 - DIRECTION
      ?auto_348529 - MODE
      ?auto_348530 - DIRECTION
      ?auto_348531 - MODE
    )
    :vars
    (
      ?auto_348539 - INSTRUMENT
      ?auto_348532 - SATELLITE
      ?auto_348533 - DIRECTION
      ?auto_348538 - INSTRUMENT
      ?auto_348535 - INSTRUMENT
      ?auto_348536 - INSTRUMENT
      ?auto_348537 - INSTRUMENT
      ?auto_348534 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_348525 ?auto_348522 ) ) ( not ( = ?auto_348526 ?auto_348522 ) ) ( not ( = ?auto_348526 ?auto_348525 ) ) ( not ( = ?auto_348528 ?auto_348522 ) ) ( not ( = ?auto_348528 ?auto_348525 ) ) ( not ( = ?auto_348528 ?auto_348526 ) ) ( not ( = ?auto_348530 ?auto_348522 ) ) ( not ( = ?auto_348530 ?auto_348525 ) ) ( not ( = ?auto_348530 ?auto_348526 ) ) ( not ( = ?auto_348530 ?auto_348528 ) ) ( ON_BOARD ?auto_348539 ?auto_348532 ) ( SUPPORTS ?auto_348539 ?auto_348529 ) ( not ( = ?auto_348528 ?auto_348533 ) ) ( CALIBRATION_TARGET ?auto_348539 ?auto_348533 ) ( not ( = ?auto_348533 ?auto_348526 ) ) ( ON_BOARD ?auto_348538 ?auto_348532 ) ( not ( = ?auto_348539 ?auto_348538 ) ) ( SUPPORTS ?auto_348538 ?auto_348527 ) ( CALIBRATION_TARGET ?auto_348538 ?auto_348533 ) ( not ( = ?auto_348533 ?auto_348522 ) ) ( ON_BOARD ?auto_348535 ?auto_348532 ) ( not ( = ?auto_348538 ?auto_348535 ) ) ( SUPPORTS ?auto_348535 ?auto_348523 ) ( CALIBRATION_TARGET ?auto_348535 ?auto_348533 ) ( not ( = ?auto_348533 ?auto_348530 ) ) ( ON_BOARD ?auto_348536 ?auto_348532 ) ( not ( = ?auto_348535 ?auto_348536 ) ) ( SUPPORTS ?auto_348536 ?auto_348531 ) ( CALIBRATION_TARGET ?auto_348536 ?auto_348533 ) ( not ( = ?auto_348533 ?auto_348525 ) ) ( ON_BOARD ?auto_348537 ?auto_348532 ) ( not ( = ?auto_348536 ?auto_348537 ) ) ( SUPPORTS ?auto_348537 ?auto_348524 ) ( CALIBRATION_TARGET ?auto_348537 ?auto_348533 ) ( POWER_AVAIL ?auto_348532 ) ( POINTING ?auto_348532 ?auto_348534 ) ( not ( = ?auto_348533 ?auto_348534 ) ) ( not ( = ?auto_348525 ?auto_348534 ) ) ( not ( = ?auto_348524 ?auto_348531 ) ) ( not ( = ?auto_348530 ?auto_348534 ) ) ( not ( = ?auto_348524 ?auto_348523 ) ) ( not ( = ?auto_348531 ?auto_348523 ) ) ( not ( = ?auto_348522 ?auto_348534 ) ) ( not ( = ?auto_348535 ?auto_348537 ) ) ( not ( = ?auto_348524 ?auto_348527 ) ) ( not ( = ?auto_348531 ?auto_348527 ) ) ( not ( = ?auto_348523 ?auto_348527 ) ) ( not ( = ?auto_348526 ?auto_348534 ) ) ( not ( = ?auto_348538 ?auto_348536 ) ) ( not ( = ?auto_348538 ?auto_348537 ) ) ( not ( = ?auto_348524 ?auto_348529 ) ) ( not ( = ?auto_348531 ?auto_348529 ) ) ( not ( = ?auto_348523 ?auto_348529 ) ) ( not ( = ?auto_348527 ?auto_348529 ) ) ( not ( = ?auto_348528 ?auto_348534 ) ) ( not ( = ?auto_348539 ?auto_348535 ) ) ( not ( = ?auto_348539 ?auto_348536 ) ) ( not ( = ?auto_348539 ?auto_348537 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_348525 ?auto_348524 ?auto_348530 ?auto_348531 ?auto_348522 ?auto_348523 ?auto_348528 ?auto_348529 ?auto_348526 ?auto_348527 )
      ( GET-5IMAGE-VERIFY ?auto_348522 ?auto_348523 ?auto_348525 ?auto_348524 ?auto_348526 ?auto_348527 ?auto_348528 ?auto_348529 ?auto_348530 ?auto_348531 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_348766 - DIRECTION
      ?auto_348767 - MODE
      ?auto_348769 - DIRECTION
      ?auto_348768 - MODE
      ?auto_348770 - DIRECTION
      ?auto_348771 - MODE
      ?auto_348772 - DIRECTION
      ?auto_348773 - MODE
      ?auto_348774 - DIRECTION
      ?auto_348775 - MODE
    )
    :vars
    (
      ?auto_348783 - INSTRUMENT
      ?auto_348776 - SATELLITE
      ?auto_348777 - DIRECTION
      ?auto_348782 - INSTRUMENT
      ?auto_348779 - INSTRUMENT
      ?auto_348780 - INSTRUMENT
      ?auto_348781 - INSTRUMENT
      ?auto_348778 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_348769 ?auto_348766 ) ) ( not ( = ?auto_348770 ?auto_348766 ) ) ( not ( = ?auto_348770 ?auto_348769 ) ) ( not ( = ?auto_348772 ?auto_348766 ) ) ( not ( = ?auto_348772 ?auto_348769 ) ) ( not ( = ?auto_348772 ?auto_348770 ) ) ( not ( = ?auto_348774 ?auto_348766 ) ) ( not ( = ?auto_348774 ?auto_348769 ) ) ( not ( = ?auto_348774 ?auto_348770 ) ) ( not ( = ?auto_348774 ?auto_348772 ) ) ( ON_BOARD ?auto_348783 ?auto_348776 ) ( SUPPORTS ?auto_348783 ?auto_348771 ) ( not ( = ?auto_348770 ?auto_348777 ) ) ( CALIBRATION_TARGET ?auto_348783 ?auto_348777 ) ( not ( = ?auto_348777 ?auto_348774 ) ) ( ON_BOARD ?auto_348782 ?auto_348776 ) ( not ( = ?auto_348783 ?auto_348782 ) ) ( SUPPORTS ?auto_348782 ?auto_348775 ) ( CALIBRATION_TARGET ?auto_348782 ?auto_348777 ) ( not ( = ?auto_348777 ?auto_348766 ) ) ( ON_BOARD ?auto_348779 ?auto_348776 ) ( not ( = ?auto_348782 ?auto_348779 ) ) ( SUPPORTS ?auto_348779 ?auto_348767 ) ( CALIBRATION_TARGET ?auto_348779 ?auto_348777 ) ( not ( = ?auto_348777 ?auto_348772 ) ) ( ON_BOARD ?auto_348780 ?auto_348776 ) ( not ( = ?auto_348779 ?auto_348780 ) ) ( SUPPORTS ?auto_348780 ?auto_348773 ) ( CALIBRATION_TARGET ?auto_348780 ?auto_348777 ) ( not ( = ?auto_348777 ?auto_348769 ) ) ( ON_BOARD ?auto_348781 ?auto_348776 ) ( not ( = ?auto_348780 ?auto_348781 ) ) ( SUPPORTS ?auto_348781 ?auto_348768 ) ( CALIBRATION_TARGET ?auto_348781 ?auto_348777 ) ( POWER_AVAIL ?auto_348776 ) ( POINTING ?auto_348776 ?auto_348778 ) ( not ( = ?auto_348777 ?auto_348778 ) ) ( not ( = ?auto_348769 ?auto_348778 ) ) ( not ( = ?auto_348768 ?auto_348773 ) ) ( not ( = ?auto_348772 ?auto_348778 ) ) ( not ( = ?auto_348768 ?auto_348767 ) ) ( not ( = ?auto_348773 ?auto_348767 ) ) ( not ( = ?auto_348766 ?auto_348778 ) ) ( not ( = ?auto_348779 ?auto_348781 ) ) ( not ( = ?auto_348768 ?auto_348775 ) ) ( not ( = ?auto_348773 ?auto_348775 ) ) ( not ( = ?auto_348767 ?auto_348775 ) ) ( not ( = ?auto_348774 ?auto_348778 ) ) ( not ( = ?auto_348782 ?auto_348780 ) ) ( not ( = ?auto_348782 ?auto_348781 ) ) ( not ( = ?auto_348768 ?auto_348771 ) ) ( not ( = ?auto_348773 ?auto_348771 ) ) ( not ( = ?auto_348767 ?auto_348771 ) ) ( not ( = ?auto_348775 ?auto_348771 ) ) ( not ( = ?auto_348770 ?auto_348778 ) ) ( not ( = ?auto_348783 ?auto_348779 ) ) ( not ( = ?auto_348783 ?auto_348780 ) ) ( not ( = ?auto_348783 ?auto_348781 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_348769 ?auto_348768 ?auto_348772 ?auto_348773 ?auto_348766 ?auto_348767 ?auto_348770 ?auto_348771 ?auto_348774 ?auto_348775 )
      ( GET-5IMAGE-VERIFY ?auto_348766 ?auto_348767 ?auto_348769 ?auto_348768 ?auto_348770 ?auto_348771 ?auto_348772 ?auto_348773 ?auto_348774 ?auto_348775 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_348930 - DIRECTION
      ?auto_348931 - MODE
      ?auto_348933 - DIRECTION
      ?auto_348932 - MODE
      ?auto_348934 - DIRECTION
      ?auto_348935 - MODE
      ?auto_348936 - DIRECTION
      ?auto_348937 - MODE
      ?auto_348938 - DIRECTION
      ?auto_348939 - MODE
    )
    :vars
    (
      ?auto_348947 - INSTRUMENT
      ?auto_348940 - SATELLITE
      ?auto_348941 - DIRECTION
      ?auto_348946 - INSTRUMENT
      ?auto_348943 - INSTRUMENT
      ?auto_348944 - INSTRUMENT
      ?auto_348945 - INSTRUMENT
      ?auto_348942 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_348933 ?auto_348930 ) ) ( not ( = ?auto_348934 ?auto_348930 ) ) ( not ( = ?auto_348934 ?auto_348933 ) ) ( not ( = ?auto_348936 ?auto_348930 ) ) ( not ( = ?auto_348936 ?auto_348933 ) ) ( not ( = ?auto_348936 ?auto_348934 ) ) ( not ( = ?auto_348938 ?auto_348930 ) ) ( not ( = ?auto_348938 ?auto_348933 ) ) ( not ( = ?auto_348938 ?auto_348934 ) ) ( not ( = ?auto_348938 ?auto_348936 ) ) ( ON_BOARD ?auto_348947 ?auto_348940 ) ( SUPPORTS ?auto_348947 ?auto_348935 ) ( not ( = ?auto_348934 ?auto_348941 ) ) ( CALIBRATION_TARGET ?auto_348947 ?auto_348941 ) ( not ( = ?auto_348941 ?auto_348936 ) ) ( ON_BOARD ?auto_348946 ?auto_348940 ) ( not ( = ?auto_348947 ?auto_348946 ) ) ( SUPPORTS ?auto_348946 ?auto_348937 ) ( CALIBRATION_TARGET ?auto_348946 ?auto_348941 ) ( not ( = ?auto_348941 ?auto_348930 ) ) ( ON_BOARD ?auto_348943 ?auto_348940 ) ( not ( = ?auto_348946 ?auto_348943 ) ) ( SUPPORTS ?auto_348943 ?auto_348931 ) ( CALIBRATION_TARGET ?auto_348943 ?auto_348941 ) ( not ( = ?auto_348941 ?auto_348938 ) ) ( ON_BOARD ?auto_348944 ?auto_348940 ) ( not ( = ?auto_348943 ?auto_348944 ) ) ( SUPPORTS ?auto_348944 ?auto_348939 ) ( CALIBRATION_TARGET ?auto_348944 ?auto_348941 ) ( not ( = ?auto_348941 ?auto_348933 ) ) ( ON_BOARD ?auto_348945 ?auto_348940 ) ( not ( = ?auto_348944 ?auto_348945 ) ) ( SUPPORTS ?auto_348945 ?auto_348932 ) ( CALIBRATION_TARGET ?auto_348945 ?auto_348941 ) ( POWER_AVAIL ?auto_348940 ) ( POINTING ?auto_348940 ?auto_348942 ) ( not ( = ?auto_348941 ?auto_348942 ) ) ( not ( = ?auto_348933 ?auto_348942 ) ) ( not ( = ?auto_348932 ?auto_348939 ) ) ( not ( = ?auto_348938 ?auto_348942 ) ) ( not ( = ?auto_348932 ?auto_348931 ) ) ( not ( = ?auto_348939 ?auto_348931 ) ) ( not ( = ?auto_348930 ?auto_348942 ) ) ( not ( = ?auto_348943 ?auto_348945 ) ) ( not ( = ?auto_348932 ?auto_348937 ) ) ( not ( = ?auto_348939 ?auto_348937 ) ) ( not ( = ?auto_348931 ?auto_348937 ) ) ( not ( = ?auto_348936 ?auto_348942 ) ) ( not ( = ?auto_348946 ?auto_348944 ) ) ( not ( = ?auto_348946 ?auto_348945 ) ) ( not ( = ?auto_348932 ?auto_348935 ) ) ( not ( = ?auto_348939 ?auto_348935 ) ) ( not ( = ?auto_348931 ?auto_348935 ) ) ( not ( = ?auto_348937 ?auto_348935 ) ) ( not ( = ?auto_348934 ?auto_348942 ) ) ( not ( = ?auto_348947 ?auto_348943 ) ) ( not ( = ?auto_348947 ?auto_348944 ) ) ( not ( = ?auto_348947 ?auto_348945 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_348933 ?auto_348932 ?auto_348938 ?auto_348939 ?auto_348930 ?auto_348931 ?auto_348934 ?auto_348935 ?auto_348936 ?auto_348937 )
      ( GET-5IMAGE-VERIFY ?auto_348930 ?auto_348931 ?auto_348933 ?auto_348932 ?auto_348934 ?auto_348935 ?auto_348936 ?auto_348937 ?auto_348938 ?auto_348939 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_349174 - DIRECTION
      ?auto_349175 - MODE
      ?auto_349177 - DIRECTION
      ?auto_349176 - MODE
      ?auto_349178 - DIRECTION
      ?auto_349179 - MODE
      ?auto_349180 - DIRECTION
      ?auto_349181 - MODE
      ?auto_349182 - DIRECTION
      ?auto_349183 - MODE
    )
    :vars
    (
      ?auto_349191 - INSTRUMENT
      ?auto_349184 - SATELLITE
      ?auto_349185 - DIRECTION
      ?auto_349190 - INSTRUMENT
      ?auto_349187 - INSTRUMENT
      ?auto_349188 - INSTRUMENT
      ?auto_349189 - INSTRUMENT
      ?auto_349186 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_349177 ?auto_349174 ) ) ( not ( = ?auto_349178 ?auto_349174 ) ) ( not ( = ?auto_349178 ?auto_349177 ) ) ( not ( = ?auto_349180 ?auto_349174 ) ) ( not ( = ?auto_349180 ?auto_349177 ) ) ( not ( = ?auto_349180 ?auto_349178 ) ) ( not ( = ?auto_349182 ?auto_349174 ) ) ( not ( = ?auto_349182 ?auto_349177 ) ) ( not ( = ?auto_349182 ?auto_349178 ) ) ( not ( = ?auto_349182 ?auto_349180 ) ) ( ON_BOARD ?auto_349191 ?auto_349184 ) ( SUPPORTS ?auto_349191 ?auto_349183 ) ( not ( = ?auto_349182 ?auto_349185 ) ) ( CALIBRATION_TARGET ?auto_349191 ?auto_349185 ) ( not ( = ?auto_349185 ?auto_349180 ) ) ( ON_BOARD ?auto_349190 ?auto_349184 ) ( not ( = ?auto_349191 ?auto_349190 ) ) ( SUPPORTS ?auto_349190 ?auto_349181 ) ( CALIBRATION_TARGET ?auto_349190 ?auto_349185 ) ( not ( = ?auto_349185 ?auto_349174 ) ) ( ON_BOARD ?auto_349187 ?auto_349184 ) ( not ( = ?auto_349190 ?auto_349187 ) ) ( SUPPORTS ?auto_349187 ?auto_349175 ) ( CALIBRATION_TARGET ?auto_349187 ?auto_349185 ) ( not ( = ?auto_349185 ?auto_349177 ) ) ( ON_BOARD ?auto_349188 ?auto_349184 ) ( not ( = ?auto_349187 ?auto_349188 ) ) ( SUPPORTS ?auto_349188 ?auto_349176 ) ( CALIBRATION_TARGET ?auto_349188 ?auto_349185 ) ( not ( = ?auto_349185 ?auto_349178 ) ) ( ON_BOARD ?auto_349189 ?auto_349184 ) ( not ( = ?auto_349188 ?auto_349189 ) ) ( SUPPORTS ?auto_349189 ?auto_349179 ) ( CALIBRATION_TARGET ?auto_349189 ?auto_349185 ) ( POWER_AVAIL ?auto_349184 ) ( POINTING ?auto_349184 ?auto_349186 ) ( not ( = ?auto_349185 ?auto_349186 ) ) ( not ( = ?auto_349178 ?auto_349186 ) ) ( not ( = ?auto_349179 ?auto_349176 ) ) ( not ( = ?auto_349177 ?auto_349186 ) ) ( not ( = ?auto_349179 ?auto_349175 ) ) ( not ( = ?auto_349176 ?auto_349175 ) ) ( not ( = ?auto_349174 ?auto_349186 ) ) ( not ( = ?auto_349187 ?auto_349189 ) ) ( not ( = ?auto_349179 ?auto_349181 ) ) ( not ( = ?auto_349176 ?auto_349181 ) ) ( not ( = ?auto_349175 ?auto_349181 ) ) ( not ( = ?auto_349180 ?auto_349186 ) ) ( not ( = ?auto_349190 ?auto_349188 ) ) ( not ( = ?auto_349190 ?auto_349189 ) ) ( not ( = ?auto_349179 ?auto_349183 ) ) ( not ( = ?auto_349176 ?auto_349183 ) ) ( not ( = ?auto_349175 ?auto_349183 ) ) ( not ( = ?auto_349181 ?auto_349183 ) ) ( not ( = ?auto_349182 ?auto_349186 ) ) ( not ( = ?auto_349191 ?auto_349187 ) ) ( not ( = ?auto_349191 ?auto_349188 ) ) ( not ( = ?auto_349191 ?auto_349189 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_349178 ?auto_349179 ?auto_349177 ?auto_349176 ?auto_349174 ?auto_349175 ?auto_349182 ?auto_349183 ?auto_349180 ?auto_349181 )
      ( GET-5IMAGE-VERIFY ?auto_349174 ?auto_349175 ?auto_349177 ?auto_349176 ?auto_349178 ?auto_349179 ?auto_349180 ?auto_349181 ?auto_349182 ?auto_349183 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_349252 - DIRECTION
      ?auto_349253 - MODE
      ?auto_349255 - DIRECTION
      ?auto_349254 - MODE
      ?auto_349256 - DIRECTION
      ?auto_349257 - MODE
      ?auto_349258 - DIRECTION
      ?auto_349259 - MODE
      ?auto_349260 - DIRECTION
      ?auto_349261 - MODE
    )
    :vars
    (
      ?auto_349269 - INSTRUMENT
      ?auto_349262 - SATELLITE
      ?auto_349263 - DIRECTION
      ?auto_349268 - INSTRUMENT
      ?auto_349265 - INSTRUMENT
      ?auto_349266 - INSTRUMENT
      ?auto_349267 - INSTRUMENT
      ?auto_349264 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_349255 ?auto_349252 ) ) ( not ( = ?auto_349256 ?auto_349252 ) ) ( not ( = ?auto_349256 ?auto_349255 ) ) ( not ( = ?auto_349258 ?auto_349252 ) ) ( not ( = ?auto_349258 ?auto_349255 ) ) ( not ( = ?auto_349258 ?auto_349256 ) ) ( not ( = ?auto_349260 ?auto_349252 ) ) ( not ( = ?auto_349260 ?auto_349255 ) ) ( not ( = ?auto_349260 ?auto_349256 ) ) ( not ( = ?auto_349260 ?auto_349258 ) ) ( ON_BOARD ?auto_349269 ?auto_349262 ) ( SUPPORTS ?auto_349269 ?auto_349259 ) ( not ( = ?auto_349258 ?auto_349263 ) ) ( CALIBRATION_TARGET ?auto_349269 ?auto_349263 ) ( not ( = ?auto_349263 ?auto_349260 ) ) ( ON_BOARD ?auto_349268 ?auto_349262 ) ( not ( = ?auto_349269 ?auto_349268 ) ) ( SUPPORTS ?auto_349268 ?auto_349261 ) ( CALIBRATION_TARGET ?auto_349268 ?auto_349263 ) ( not ( = ?auto_349263 ?auto_349252 ) ) ( ON_BOARD ?auto_349265 ?auto_349262 ) ( not ( = ?auto_349268 ?auto_349265 ) ) ( SUPPORTS ?auto_349265 ?auto_349253 ) ( CALIBRATION_TARGET ?auto_349265 ?auto_349263 ) ( not ( = ?auto_349263 ?auto_349255 ) ) ( ON_BOARD ?auto_349266 ?auto_349262 ) ( not ( = ?auto_349265 ?auto_349266 ) ) ( SUPPORTS ?auto_349266 ?auto_349254 ) ( CALIBRATION_TARGET ?auto_349266 ?auto_349263 ) ( not ( = ?auto_349263 ?auto_349256 ) ) ( ON_BOARD ?auto_349267 ?auto_349262 ) ( not ( = ?auto_349266 ?auto_349267 ) ) ( SUPPORTS ?auto_349267 ?auto_349257 ) ( CALIBRATION_TARGET ?auto_349267 ?auto_349263 ) ( POWER_AVAIL ?auto_349262 ) ( POINTING ?auto_349262 ?auto_349264 ) ( not ( = ?auto_349263 ?auto_349264 ) ) ( not ( = ?auto_349256 ?auto_349264 ) ) ( not ( = ?auto_349257 ?auto_349254 ) ) ( not ( = ?auto_349255 ?auto_349264 ) ) ( not ( = ?auto_349257 ?auto_349253 ) ) ( not ( = ?auto_349254 ?auto_349253 ) ) ( not ( = ?auto_349252 ?auto_349264 ) ) ( not ( = ?auto_349265 ?auto_349267 ) ) ( not ( = ?auto_349257 ?auto_349261 ) ) ( not ( = ?auto_349254 ?auto_349261 ) ) ( not ( = ?auto_349253 ?auto_349261 ) ) ( not ( = ?auto_349260 ?auto_349264 ) ) ( not ( = ?auto_349268 ?auto_349266 ) ) ( not ( = ?auto_349268 ?auto_349267 ) ) ( not ( = ?auto_349257 ?auto_349259 ) ) ( not ( = ?auto_349254 ?auto_349259 ) ) ( not ( = ?auto_349253 ?auto_349259 ) ) ( not ( = ?auto_349261 ?auto_349259 ) ) ( not ( = ?auto_349258 ?auto_349264 ) ) ( not ( = ?auto_349269 ?auto_349265 ) ) ( not ( = ?auto_349269 ?auto_349266 ) ) ( not ( = ?auto_349269 ?auto_349267 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_349256 ?auto_349257 ?auto_349255 ?auto_349254 ?auto_349252 ?auto_349253 ?auto_349258 ?auto_349259 ?auto_349260 ?auto_349261 )
      ( GET-5IMAGE-VERIFY ?auto_349252 ?auto_349253 ?auto_349255 ?auto_349254 ?auto_349256 ?auto_349257 ?auto_349258 ?auto_349259 ?auto_349260 ?auto_349261 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_349670 - DIRECTION
      ?auto_349671 - MODE
      ?auto_349673 - DIRECTION
      ?auto_349672 - MODE
      ?auto_349674 - DIRECTION
      ?auto_349675 - MODE
      ?auto_349676 - DIRECTION
      ?auto_349677 - MODE
      ?auto_349678 - DIRECTION
      ?auto_349679 - MODE
    )
    :vars
    (
      ?auto_349687 - INSTRUMENT
      ?auto_349680 - SATELLITE
      ?auto_349681 - DIRECTION
      ?auto_349686 - INSTRUMENT
      ?auto_349683 - INSTRUMENT
      ?auto_349684 - INSTRUMENT
      ?auto_349685 - INSTRUMENT
      ?auto_349682 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_349673 ?auto_349670 ) ) ( not ( = ?auto_349674 ?auto_349670 ) ) ( not ( = ?auto_349674 ?auto_349673 ) ) ( not ( = ?auto_349676 ?auto_349670 ) ) ( not ( = ?auto_349676 ?auto_349673 ) ) ( not ( = ?auto_349676 ?auto_349674 ) ) ( not ( = ?auto_349678 ?auto_349670 ) ) ( not ( = ?auto_349678 ?auto_349673 ) ) ( not ( = ?auto_349678 ?auto_349674 ) ) ( not ( = ?auto_349678 ?auto_349676 ) ) ( ON_BOARD ?auto_349687 ?auto_349680 ) ( SUPPORTS ?auto_349687 ?auto_349679 ) ( not ( = ?auto_349678 ?auto_349681 ) ) ( CALIBRATION_TARGET ?auto_349687 ?auto_349681 ) ( not ( = ?auto_349681 ?auto_349674 ) ) ( ON_BOARD ?auto_349686 ?auto_349680 ) ( not ( = ?auto_349687 ?auto_349686 ) ) ( SUPPORTS ?auto_349686 ?auto_349675 ) ( CALIBRATION_TARGET ?auto_349686 ?auto_349681 ) ( not ( = ?auto_349681 ?auto_349670 ) ) ( ON_BOARD ?auto_349683 ?auto_349680 ) ( not ( = ?auto_349686 ?auto_349683 ) ) ( SUPPORTS ?auto_349683 ?auto_349671 ) ( CALIBRATION_TARGET ?auto_349683 ?auto_349681 ) ( not ( = ?auto_349681 ?auto_349673 ) ) ( ON_BOARD ?auto_349684 ?auto_349680 ) ( not ( = ?auto_349683 ?auto_349684 ) ) ( SUPPORTS ?auto_349684 ?auto_349672 ) ( CALIBRATION_TARGET ?auto_349684 ?auto_349681 ) ( not ( = ?auto_349681 ?auto_349676 ) ) ( ON_BOARD ?auto_349685 ?auto_349680 ) ( not ( = ?auto_349684 ?auto_349685 ) ) ( SUPPORTS ?auto_349685 ?auto_349677 ) ( CALIBRATION_TARGET ?auto_349685 ?auto_349681 ) ( POWER_AVAIL ?auto_349680 ) ( POINTING ?auto_349680 ?auto_349682 ) ( not ( = ?auto_349681 ?auto_349682 ) ) ( not ( = ?auto_349676 ?auto_349682 ) ) ( not ( = ?auto_349677 ?auto_349672 ) ) ( not ( = ?auto_349673 ?auto_349682 ) ) ( not ( = ?auto_349677 ?auto_349671 ) ) ( not ( = ?auto_349672 ?auto_349671 ) ) ( not ( = ?auto_349670 ?auto_349682 ) ) ( not ( = ?auto_349683 ?auto_349685 ) ) ( not ( = ?auto_349677 ?auto_349675 ) ) ( not ( = ?auto_349672 ?auto_349675 ) ) ( not ( = ?auto_349671 ?auto_349675 ) ) ( not ( = ?auto_349674 ?auto_349682 ) ) ( not ( = ?auto_349686 ?auto_349684 ) ) ( not ( = ?auto_349686 ?auto_349685 ) ) ( not ( = ?auto_349677 ?auto_349679 ) ) ( not ( = ?auto_349672 ?auto_349679 ) ) ( not ( = ?auto_349671 ?auto_349679 ) ) ( not ( = ?auto_349675 ?auto_349679 ) ) ( not ( = ?auto_349678 ?auto_349682 ) ) ( not ( = ?auto_349687 ?auto_349683 ) ) ( not ( = ?auto_349687 ?auto_349684 ) ) ( not ( = ?auto_349687 ?auto_349685 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_349676 ?auto_349677 ?auto_349673 ?auto_349672 ?auto_349670 ?auto_349671 ?auto_349678 ?auto_349679 ?auto_349674 ?auto_349675 )
      ( GET-5IMAGE-VERIFY ?auto_349670 ?auto_349671 ?auto_349673 ?auto_349672 ?auto_349674 ?auto_349675 ?auto_349676 ?auto_349677 ?auto_349678 ?auto_349679 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_349748 - DIRECTION
      ?auto_349749 - MODE
      ?auto_349751 - DIRECTION
      ?auto_349750 - MODE
      ?auto_349752 - DIRECTION
      ?auto_349753 - MODE
      ?auto_349754 - DIRECTION
      ?auto_349755 - MODE
      ?auto_349756 - DIRECTION
      ?auto_349757 - MODE
    )
    :vars
    (
      ?auto_349765 - INSTRUMENT
      ?auto_349758 - SATELLITE
      ?auto_349759 - DIRECTION
      ?auto_349764 - INSTRUMENT
      ?auto_349761 - INSTRUMENT
      ?auto_349762 - INSTRUMENT
      ?auto_349763 - INSTRUMENT
      ?auto_349760 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_349751 ?auto_349748 ) ) ( not ( = ?auto_349752 ?auto_349748 ) ) ( not ( = ?auto_349752 ?auto_349751 ) ) ( not ( = ?auto_349754 ?auto_349748 ) ) ( not ( = ?auto_349754 ?auto_349751 ) ) ( not ( = ?auto_349754 ?auto_349752 ) ) ( not ( = ?auto_349756 ?auto_349748 ) ) ( not ( = ?auto_349756 ?auto_349751 ) ) ( not ( = ?auto_349756 ?auto_349752 ) ) ( not ( = ?auto_349756 ?auto_349754 ) ) ( ON_BOARD ?auto_349765 ?auto_349758 ) ( SUPPORTS ?auto_349765 ?auto_349755 ) ( not ( = ?auto_349754 ?auto_349759 ) ) ( CALIBRATION_TARGET ?auto_349765 ?auto_349759 ) ( not ( = ?auto_349759 ?auto_349752 ) ) ( ON_BOARD ?auto_349764 ?auto_349758 ) ( not ( = ?auto_349765 ?auto_349764 ) ) ( SUPPORTS ?auto_349764 ?auto_349753 ) ( CALIBRATION_TARGET ?auto_349764 ?auto_349759 ) ( not ( = ?auto_349759 ?auto_349748 ) ) ( ON_BOARD ?auto_349761 ?auto_349758 ) ( not ( = ?auto_349764 ?auto_349761 ) ) ( SUPPORTS ?auto_349761 ?auto_349749 ) ( CALIBRATION_TARGET ?auto_349761 ?auto_349759 ) ( not ( = ?auto_349759 ?auto_349751 ) ) ( ON_BOARD ?auto_349762 ?auto_349758 ) ( not ( = ?auto_349761 ?auto_349762 ) ) ( SUPPORTS ?auto_349762 ?auto_349750 ) ( CALIBRATION_TARGET ?auto_349762 ?auto_349759 ) ( not ( = ?auto_349759 ?auto_349756 ) ) ( ON_BOARD ?auto_349763 ?auto_349758 ) ( not ( = ?auto_349762 ?auto_349763 ) ) ( SUPPORTS ?auto_349763 ?auto_349757 ) ( CALIBRATION_TARGET ?auto_349763 ?auto_349759 ) ( POWER_AVAIL ?auto_349758 ) ( POINTING ?auto_349758 ?auto_349760 ) ( not ( = ?auto_349759 ?auto_349760 ) ) ( not ( = ?auto_349756 ?auto_349760 ) ) ( not ( = ?auto_349757 ?auto_349750 ) ) ( not ( = ?auto_349751 ?auto_349760 ) ) ( not ( = ?auto_349757 ?auto_349749 ) ) ( not ( = ?auto_349750 ?auto_349749 ) ) ( not ( = ?auto_349748 ?auto_349760 ) ) ( not ( = ?auto_349761 ?auto_349763 ) ) ( not ( = ?auto_349757 ?auto_349753 ) ) ( not ( = ?auto_349750 ?auto_349753 ) ) ( not ( = ?auto_349749 ?auto_349753 ) ) ( not ( = ?auto_349752 ?auto_349760 ) ) ( not ( = ?auto_349764 ?auto_349762 ) ) ( not ( = ?auto_349764 ?auto_349763 ) ) ( not ( = ?auto_349757 ?auto_349755 ) ) ( not ( = ?auto_349750 ?auto_349755 ) ) ( not ( = ?auto_349749 ?auto_349755 ) ) ( not ( = ?auto_349753 ?auto_349755 ) ) ( not ( = ?auto_349754 ?auto_349760 ) ) ( not ( = ?auto_349765 ?auto_349761 ) ) ( not ( = ?auto_349765 ?auto_349762 ) ) ( not ( = ?auto_349765 ?auto_349763 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_349756 ?auto_349757 ?auto_349751 ?auto_349750 ?auto_349748 ?auto_349749 ?auto_349754 ?auto_349755 ?auto_349752 ?auto_349753 )
      ( GET-5IMAGE-VERIFY ?auto_349748 ?auto_349749 ?auto_349751 ?auto_349750 ?auto_349752 ?auto_349753 ?auto_349754 ?auto_349755 ?auto_349756 ?auto_349757 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_349906 - DIRECTION
      ?auto_349907 - MODE
      ?auto_349909 - DIRECTION
      ?auto_349908 - MODE
      ?auto_349910 - DIRECTION
      ?auto_349911 - MODE
      ?auto_349912 - DIRECTION
      ?auto_349913 - MODE
      ?auto_349914 - DIRECTION
      ?auto_349915 - MODE
    )
    :vars
    (
      ?auto_349923 - INSTRUMENT
      ?auto_349916 - SATELLITE
      ?auto_349917 - DIRECTION
      ?auto_349922 - INSTRUMENT
      ?auto_349919 - INSTRUMENT
      ?auto_349920 - INSTRUMENT
      ?auto_349921 - INSTRUMENT
      ?auto_349918 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_349909 ?auto_349906 ) ) ( not ( = ?auto_349910 ?auto_349906 ) ) ( not ( = ?auto_349910 ?auto_349909 ) ) ( not ( = ?auto_349912 ?auto_349906 ) ) ( not ( = ?auto_349912 ?auto_349909 ) ) ( not ( = ?auto_349912 ?auto_349910 ) ) ( not ( = ?auto_349914 ?auto_349906 ) ) ( not ( = ?auto_349914 ?auto_349909 ) ) ( not ( = ?auto_349914 ?auto_349910 ) ) ( not ( = ?auto_349914 ?auto_349912 ) ) ( ON_BOARD ?auto_349923 ?auto_349916 ) ( SUPPORTS ?auto_349923 ?auto_349911 ) ( not ( = ?auto_349910 ?auto_349917 ) ) ( CALIBRATION_TARGET ?auto_349923 ?auto_349917 ) ( not ( = ?auto_349917 ?auto_349914 ) ) ( ON_BOARD ?auto_349922 ?auto_349916 ) ( not ( = ?auto_349923 ?auto_349922 ) ) ( SUPPORTS ?auto_349922 ?auto_349915 ) ( CALIBRATION_TARGET ?auto_349922 ?auto_349917 ) ( not ( = ?auto_349917 ?auto_349906 ) ) ( ON_BOARD ?auto_349919 ?auto_349916 ) ( not ( = ?auto_349922 ?auto_349919 ) ) ( SUPPORTS ?auto_349919 ?auto_349907 ) ( CALIBRATION_TARGET ?auto_349919 ?auto_349917 ) ( not ( = ?auto_349917 ?auto_349909 ) ) ( ON_BOARD ?auto_349920 ?auto_349916 ) ( not ( = ?auto_349919 ?auto_349920 ) ) ( SUPPORTS ?auto_349920 ?auto_349908 ) ( CALIBRATION_TARGET ?auto_349920 ?auto_349917 ) ( not ( = ?auto_349917 ?auto_349912 ) ) ( ON_BOARD ?auto_349921 ?auto_349916 ) ( not ( = ?auto_349920 ?auto_349921 ) ) ( SUPPORTS ?auto_349921 ?auto_349913 ) ( CALIBRATION_TARGET ?auto_349921 ?auto_349917 ) ( POWER_AVAIL ?auto_349916 ) ( POINTING ?auto_349916 ?auto_349918 ) ( not ( = ?auto_349917 ?auto_349918 ) ) ( not ( = ?auto_349912 ?auto_349918 ) ) ( not ( = ?auto_349913 ?auto_349908 ) ) ( not ( = ?auto_349909 ?auto_349918 ) ) ( not ( = ?auto_349913 ?auto_349907 ) ) ( not ( = ?auto_349908 ?auto_349907 ) ) ( not ( = ?auto_349906 ?auto_349918 ) ) ( not ( = ?auto_349919 ?auto_349921 ) ) ( not ( = ?auto_349913 ?auto_349915 ) ) ( not ( = ?auto_349908 ?auto_349915 ) ) ( not ( = ?auto_349907 ?auto_349915 ) ) ( not ( = ?auto_349914 ?auto_349918 ) ) ( not ( = ?auto_349922 ?auto_349920 ) ) ( not ( = ?auto_349922 ?auto_349921 ) ) ( not ( = ?auto_349913 ?auto_349911 ) ) ( not ( = ?auto_349908 ?auto_349911 ) ) ( not ( = ?auto_349907 ?auto_349911 ) ) ( not ( = ?auto_349915 ?auto_349911 ) ) ( not ( = ?auto_349910 ?auto_349918 ) ) ( not ( = ?auto_349923 ?auto_349919 ) ) ( not ( = ?auto_349923 ?auto_349920 ) ) ( not ( = ?auto_349923 ?auto_349921 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_349912 ?auto_349913 ?auto_349909 ?auto_349908 ?auto_349906 ?auto_349907 ?auto_349910 ?auto_349911 ?auto_349914 ?auto_349915 )
      ( GET-5IMAGE-VERIFY ?auto_349906 ?auto_349907 ?auto_349909 ?auto_349908 ?auto_349910 ?auto_349911 ?auto_349912 ?auto_349913 ?auto_349914 ?auto_349915 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_350156 - DIRECTION
      ?auto_350157 - MODE
      ?auto_350159 - DIRECTION
      ?auto_350158 - MODE
      ?auto_350160 - DIRECTION
      ?auto_350161 - MODE
      ?auto_350162 - DIRECTION
      ?auto_350163 - MODE
      ?auto_350164 - DIRECTION
      ?auto_350165 - MODE
    )
    :vars
    (
      ?auto_350173 - INSTRUMENT
      ?auto_350166 - SATELLITE
      ?auto_350167 - DIRECTION
      ?auto_350172 - INSTRUMENT
      ?auto_350169 - INSTRUMENT
      ?auto_350170 - INSTRUMENT
      ?auto_350171 - INSTRUMENT
      ?auto_350168 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_350159 ?auto_350156 ) ) ( not ( = ?auto_350160 ?auto_350156 ) ) ( not ( = ?auto_350160 ?auto_350159 ) ) ( not ( = ?auto_350162 ?auto_350156 ) ) ( not ( = ?auto_350162 ?auto_350159 ) ) ( not ( = ?auto_350162 ?auto_350160 ) ) ( not ( = ?auto_350164 ?auto_350156 ) ) ( not ( = ?auto_350164 ?auto_350159 ) ) ( not ( = ?auto_350164 ?auto_350160 ) ) ( not ( = ?auto_350164 ?auto_350162 ) ) ( ON_BOARD ?auto_350173 ?auto_350166 ) ( SUPPORTS ?auto_350173 ?auto_350161 ) ( not ( = ?auto_350160 ?auto_350167 ) ) ( CALIBRATION_TARGET ?auto_350173 ?auto_350167 ) ( not ( = ?auto_350167 ?auto_350162 ) ) ( ON_BOARD ?auto_350172 ?auto_350166 ) ( not ( = ?auto_350173 ?auto_350172 ) ) ( SUPPORTS ?auto_350172 ?auto_350163 ) ( CALIBRATION_TARGET ?auto_350172 ?auto_350167 ) ( not ( = ?auto_350167 ?auto_350156 ) ) ( ON_BOARD ?auto_350169 ?auto_350166 ) ( not ( = ?auto_350172 ?auto_350169 ) ) ( SUPPORTS ?auto_350169 ?auto_350157 ) ( CALIBRATION_TARGET ?auto_350169 ?auto_350167 ) ( not ( = ?auto_350167 ?auto_350159 ) ) ( ON_BOARD ?auto_350170 ?auto_350166 ) ( not ( = ?auto_350169 ?auto_350170 ) ) ( SUPPORTS ?auto_350170 ?auto_350158 ) ( CALIBRATION_TARGET ?auto_350170 ?auto_350167 ) ( not ( = ?auto_350167 ?auto_350164 ) ) ( ON_BOARD ?auto_350171 ?auto_350166 ) ( not ( = ?auto_350170 ?auto_350171 ) ) ( SUPPORTS ?auto_350171 ?auto_350165 ) ( CALIBRATION_TARGET ?auto_350171 ?auto_350167 ) ( POWER_AVAIL ?auto_350166 ) ( POINTING ?auto_350166 ?auto_350168 ) ( not ( = ?auto_350167 ?auto_350168 ) ) ( not ( = ?auto_350164 ?auto_350168 ) ) ( not ( = ?auto_350165 ?auto_350158 ) ) ( not ( = ?auto_350159 ?auto_350168 ) ) ( not ( = ?auto_350165 ?auto_350157 ) ) ( not ( = ?auto_350158 ?auto_350157 ) ) ( not ( = ?auto_350156 ?auto_350168 ) ) ( not ( = ?auto_350169 ?auto_350171 ) ) ( not ( = ?auto_350165 ?auto_350163 ) ) ( not ( = ?auto_350158 ?auto_350163 ) ) ( not ( = ?auto_350157 ?auto_350163 ) ) ( not ( = ?auto_350162 ?auto_350168 ) ) ( not ( = ?auto_350172 ?auto_350170 ) ) ( not ( = ?auto_350172 ?auto_350171 ) ) ( not ( = ?auto_350165 ?auto_350161 ) ) ( not ( = ?auto_350158 ?auto_350161 ) ) ( not ( = ?auto_350157 ?auto_350161 ) ) ( not ( = ?auto_350163 ?auto_350161 ) ) ( not ( = ?auto_350160 ?auto_350168 ) ) ( not ( = ?auto_350173 ?auto_350169 ) ) ( not ( = ?auto_350173 ?auto_350170 ) ) ( not ( = ?auto_350173 ?auto_350171 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_350164 ?auto_350165 ?auto_350159 ?auto_350158 ?auto_350156 ?auto_350157 ?auto_350160 ?auto_350161 ?auto_350162 ?auto_350163 )
      ( GET-5IMAGE-VERIFY ?auto_350156 ?auto_350157 ?auto_350159 ?auto_350158 ?auto_350160 ?auto_350161 ?auto_350162 ?auto_350163 ?auto_350164 ?auto_350165 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_351700 - DIRECTION
      ?auto_351701 - MODE
      ?auto_351703 - DIRECTION
      ?auto_351702 - MODE
      ?auto_351704 - DIRECTION
      ?auto_351705 - MODE
      ?auto_351706 - DIRECTION
      ?auto_351707 - MODE
      ?auto_351708 - DIRECTION
      ?auto_351709 - MODE
    )
    :vars
    (
      ?auto_351717 - INSTRUMENT
      ?auto_351710 - SATELLITE
      ?auto_351711 - DIRECTION
      ?auto_351716 - INSTRUMENT
      ?auto_351713 - INSTRUMENT
      ?auto_351714 - INSTRUMENT
      ?auto_351715 - INSTRUMENT
      ?auto_351712 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_351703 ?auto_351700 ) ) ( not ( = ?auto_351704 ?auto_351700 ) ) ( not ( = ?auto_351704 ?auto_351703 ) ) ( not ( = ?auto_351706 ?auto_351700 ) ) ( not ( = ?auto_351706 ?auto_351703 ) ) ( not ( = ?auto_351706 ?auto_351704 ) ) ( not ( = ?auto_351708 ?auto_351700 ) ) ( not ( = ?auto_351708 ?auto_351703 ) ) ( not ( = ?auto_351708 ?auto_351704 ) ) ( not ( = ?auto_351708 ?auto_351706 ) ) ( ON_BOARD ?auto_351717 ?auto_351710 ) ( SUPPORTS ?auto_351717 ?auto_351709 ) ( not ( = ?auto_351708 ?auto_351711 ) ) ( CALIBRATION_TARGET ?auto_351717 ?auto_351711 ) ( not ( = ?auto_351711 ?auto_351703 ) ) ( ON_BOARD ?auto_351716 ?auto_351710 ) ( not ( = ?auto_351717 ?auto_351716 ) ) ( SUPPORTS ?auto_351716 ?auto_351702 ) ( CALIBRATION_TARGET ?auto_351716 ?auto_351711 ) ( not ( = ?auto_351711 ?auto_351700 ) ) ( ON_BOARD ?auto_351713 ?auto_351710 ) ( not ( = ?auto_351716 ?auto_351713 ) ) ( SUPPORTS ?auto_351713 ?auto_351701 ) ( CALIBRATION_TARGET ?auto_351713 ?auto_351711 ) ( not ( = ?auto_351711 ?auto_351706 ) ) ( ON_BOARD ?auto_351714 ?auto_351710 ) ( not ( = ?auto_351713 ?auto_351714 ) ) ( SUPPORTS ?auto_351714 ?auto_351707 ) ( CALIBRATION_TARGET ?auto_351714 ?auto_351711 ) ( not ( = ?auto_351711 ?auto_351704 ) ) ( ON_BOARD ?auto_351715 ?auto_351710 ) ( not ( = ?auto_351714 ?auto_351715 ) ) ( SUPPORTS ?auto_351715 ?auto_351705 ) ( CALIBRATION_TARGET ?auto_351715 ?auto_351711 ) ( POWER_AVAIL ?auto_351710 ) ( POINTING ?auto_351710 ?auto_351712 ) ( not ( = ?auto_351711 ?auto_351712 ) ) ( not ( = ?auto_351704 ?auto_351712 ) ) ( not ( = ?auto_351705 ?auto_351707 ) ) ( not ( = ?auto_351706 ?auto_351712 ) ) ( not ( = ?auto_351705 ?auto_351701 ) ) ( not ( = ?auto_351707 ?auto_351701 ) ) ( not ( = ?auto_351700 ?auto_351712 ) ) ( not ( = ?auto_351713 ?auto_351715 ) ) ( not ( = ?auto_351705 ?auto_351702 ) ) ( not ( = ?auto_351707 ?auto_351702 ) ) ( not ( = ?auto_351701 ?auto_351702 ) ) ( not ( = ?auto_351703 ?auto_351712 ) ) ( not ( = ?auto_351716 ?auto_351714 ) ) ( not ( = ?auto_351716 ?auto_351715 ) ) ( not ( = ?auto_351705 ?auto_351709 ) ) ( not ( = ?auto_351707 ?auto_351709 ) ) ( not ( = ?auto_351701 ?auto_351709 ) ) ( not ( = ?auto_351702 ?auto_351709 ) ) ( not ( = ?auto_351708 ?auto_351712 ) ) ( not ( = ?auto_351717 ?auto_351713 ) ) ( not ( = ?auto_351717 ?auto_351714 ) ) ( not ( = ?auto_351717 ?auto_351715 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_351704 ?auto_351705 ?auto_351706 ?auto_351707 ?auto_351700 ?auto_351701 ?auto_351708 ?auto_351709 ?auto_351703 ?auto_351702 )
      ( GET-5IMAGE-VERIFY ?auto_351700 ?auto_351701 ?auto_351703 ?auto_351702 ?auto_351704 ?auto_351705 ?auto_351706 ?auto_351707 ?auto_351708 ?auto_351709 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_351778 - DIRECTION
      ?auto_351779 - MODE
      ?auto_351781 - DIRECTION
      ?auto_351780 - MODE
      ?auto_351782 - DIRECTION
      ?auto_351783 - MODE
      ?auto_351784 - DIRECTION
      ?auto_351785 - MODE
      ?auto_351786 - DIRECTION
      ?auto_351787 - MODE
    )
    :vars
    (
      ?auto_351795 - INSTRUMENT
      ?auto_351788 - SATELLITE
      ?auto_351789 - DIRECTION
      ?auto_351794 - INSTRUMENT
      ?auto_351791 - INSTRUMENT
      ?auto_351792 - INSTRUMENT
      ?auto_351793 - INSTRUMENT
      ?auto_351790 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_351781 ?auto_351778 ) ) ( not ( = ?auto_351782 ?auto_351778 ) ) ( not ( = ?auto_351782 ?auto_351781 ) ) ( not ( = ?auto_351784 ?auto_351778 ) ) ( not ( = ?auto_351784 ?auto_351781 ) ) ( not ( = ?auto_351784 ?auto_351782 ) ) ( not ( = ?auto_351786 ?auto_351778 ) ) ( not ( = ?auto_351786 ?auto_351781 ) ) ( not ( = ?auto_351786 ?auto_351782 ) ) ( not ( = ?auto_351786 ?auto_351784 ) ) ( ON_BOARD ?auto_351795 ?auto_351788 ) ( SUPPORTS ?auto_351795 ?auto_351785 ) ( not ( = ?auto_351784 ?auto_351789 ) ) ( CALIBRATION_TARGET ?auto_351795 ?auto_351789 ) ( not ( = ?auto_351789 ?auto_351781 ) ) ( ON_BOARD ?auto_351794 ?auto_351788 ) ( not ( = ?auto_351795 ?auto_351794 ) ) ( SUPPORTS ?auto_351794 ?auto_351780 ) ( CALIBRATION_TARGET ?auto_351794 ?auto_351789 ) ( not ( = ?auto_351789 ?auto_351778 ) ) ( ON_BOARD ?auto_351791 ?auto_351788 ) ( not ( = ?auto_351794 ?auto_351791 ) ) ( SUPPORTS ?auto_351791 ?auto_351779 ) ( CALIBRATION_TARGET ?auto_351791 ?auto_351789 ) ( not ( = ?auto_351789 ?auto_351786 ) ) ( ON_BOARD ?auto_351792 ?auto_351788 ) ( not ( = ?auto_351791 ?auto_351792 ) ) ( SUPPORTS ?auto_351792 ?auto_351787 ) ( CALIBRATION_TARGET ?auto_351792 ?auto_351789 ) ( not ( = ?auto_351789 ?auto_351782 ) ) ( ON_BOARD ?auto_351793 ?auto_351788 ) ( not ( = ?auto_351792 ?auto_351793 ) ) ( SUPPORTS ?auto_351793 ?auto_351783 ) ( CALIBRATION_TARGET ?auto_351793 ?auto_351789 ) ( POWER_AVAIL ?auto_351788 ) ( POINTING ?auto_351788 ?auto_351790 ) ( not ( = ?auto_351789 ?auto_351790 ) ) ( not ( = ?auto_351782 ?auto_351790 ) ) ( not ( = ?auto_351783 ?auto_351787 ) ) ( not ( = ?auto_351786 ?auto_351790 ) ) ( not ( = ?auto_351783 ?auto_351779 ) ) ( not ( = ?auto_351787 ?auto_351779 ) ) ( not ( = ?auto_351778 ?auto_351790 ) ) ( not ( = ?auto_351791 ?auto_351793 ) ) ( not ( = ?auto_351783 ?auto_351780 ) ) ( not ( = ?auto_351787 ?auto_351780 ) ) ( not ( = ?auto_351779 ?auto_351780 ) ) ( not ( = ?auto_351781 ?auto_351790 ) ) ( not ( = ?auto_351794 ?auto_351792 ) ) ( not ( = ?auto_351794 ?auto_351793 ) ) ( not ( = ?auto_351783 ?auto_351785 ) ) ( not ( = ?auto_351787 ?auto_351785 ) ) ( not ( = ?auto_351779 ?auto_351785 ) ) ( not ( = ?auto_351780 ?auto_351785 ) ) ( not ( = ?auto_351784 ?auto_351790 ) ) ( not ( = ?auto_351795 ?auto_351791 ) ) ( not ( = ?auto_351795 ?auto_351792 ) ) ( not ( = ?auto_351795 ?auto_351793 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_351782 ?auto_351783 ?auto_351786 ?auto_351787 ?auto_351778 ?auto_351779 ?auto_351784 ?auto_351785 ?auto_351781 ?auto_351780 )
      ( GET-5IMAGE-VERIFY ?auto_351778 ?auto_351779 ?auto_351781 ?auto_351780 ?auto_351782 ?auto_351783 ?auto_351784 ?auto_351785 ?auto_351786 ?auto_351787 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_351856 - DIRECTION
      ?auto_351857 - MODE
      ?auto_351859 - DIRECTION
      ?auto_351858 - MODE
      ?auto_351860 - DIRECTION
      ?auto_351861 - MODE
      ?auto_351862 - DIRECTION
      ?auto_351863 - MODE
      ?auto_351864 - DIRECTION
      ?auto_351865 - MODE
    )
    :vars
    (
      ?auto_351873 - INSTRUMENT
      ?auto_351866 - SATELLITE
      ?auto_351867 - DIRECTION
      ?auto_351872 - INSTRUMENT
      ?auto_351869 - INSTRUMENT
      ?auto_351870 - INSTRUMENT
      ?auto_351871 - INSTRUMENT
      ?auto_351868 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_351859 ?auto_351856 ) ) ( not ( = ?auto_351860 ?auto_351856 ) ) ( not ( = ?auto_351860 ?auto_351859 ) ) ( not ( = ?auto_351862 ?auto_351856 ) ) ( not ( = ?auto_351862 ?auto_351859 ) ) ( not ( = ?auto_351862 ?auto_351860 ) ) ( not ( = ?auto_351864 ?auto_351856 ) ) ( not ( = ?auto_351864 ?auto_351859 ) ) ( not ( = ?auto_351864 ?auto_351860 ) ) ( not ( = ?auto_351864 ?auto_351862 ) ) ( ON_BOARD ?auto_351873 ?auto_351866 ) ( SUPPORTS ?auto_351873 ?auto_351865 ) ( not ( = ?auto_351864 ?auto_351867 ) ) ( CALIBRATION_TARGET ?auto_351873 ?auto_351867 ) ( not ( = ?auto_351867 ?auto_351859 ) ) ( ON_BOARD ?auto_351872 ?auto_351866 ) ( not ( = ?auto_351873 ?auto_351872 ) ) ( SUPPORTS ?auto_351872 ?auto_351858 ) ( CALIBRATION_TARGET ?auto_351872 ?auto_351867 ) ( not ( = ?auto_351867 ?auto_351856 ) ) ( ON_BOARD ?auto_351869 ?auto_351866 ) ( not ( = ?auto_351872 ?auto_351869 ) ) ( SUPPORTS ?auto_351869 ?auto_351857 ) ( CALIBRATION_TARGET ?auto_351869 ?auto_351867 ) ( not ( = ?auto_351867 ?auto_351860 ) ) ( ON_BOARD ?auto_351870 ?auto_351866 ) ( not ( = ?auto_351869 ?auto_351870 ) ) ( SUPPORTS ?auto_351870 ?auto_351861 ) ( CALIBRATION_TARGET ?auto_351870 ?auto_351867 ) ( not ( = ?auto_351867 ?auto_351862 ) ) ( ON_BOARD ?auto_351871 ?auto_351866 ) ( not ( = ?auto_351870 ?auto_351871 ) ) ( SUPPORTS ?auto_351871 ?auto_351863 ) ( CALIBRATION_TARGET ?auto_351871 ?auto_351867 ) ( POWER_AVAIL ?auto_351866 ) ( POINTING ?auto_351866 ?auto_351868 ) ( not ( = ?auto_351867 ?auto_351868 ) ) ( not ( = ?auto_351862 ?auto_351868 ) ) ( not ( = ?auto_351863 ?auto_351861 ) ) ( not ( = ?auto_351860 ?auto_351868 ) ) ( not ( = ?auto_351863 ?auto_351857 ) ) ( not ( = ?auto_351861 ?auto_351857 ) ) ( not ( = ?auto_351856 ?auto_351868 ) ) ( not ( = ?auto_351869 ?auto_351871 ) ) ( not ( = ?auto_351863 ?auto_351858 ) ) ( not ( = ?auto_351861 ?auto_351858 ) ) ( not ( = ?auto_351857 ?auto_351858 ) ) ( not ( = ?auto_351859 ?auto_351868 ) ) ( not ( = ?auto_351872 ?auto_351870 ) ) ( not ( = ?auto_351872 ?auto_351871 ) ) ( not ( = ?auto_351863 ?auto_351865 ) ) ( not ( = ?auto_351861 ?auto_351865 ) ) ( not ( = ?auto_351857 ?auto_351865 ) ) ( not ( = ?auto_351858 ?auto_351865 ) ) ( not ( = ?auto_351864 ?auto_351868 ) ) ( not ( = ?auto_351873 ?auto_351869 ) ) ( not ( = ?auto_351873 ?auto_351870 ) ) ( not ( = ?auto_351873 ?auto_351871 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_351862 ?auto_351863 ?auto_351860 ?auto_351861 ?auto_351856 ?auto_351857 ?auto_351864 ?auto_351865 ?auto_351859 ?auto_351858 )
      ( GET-5IMAGE-VERIFY ?auto_351856 ?auto_351857 ?auto_351859 ?auto_351858 ?auto_351860 ?auto_351861 ?auto_351862 ?auto_351863 ?auto_351864 ?auto_351865 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_351934 - DIRECTION
      ?auto_351935 - MODE
      ?auto_351937 - DIRECTION
      ?auto_351936 - MODE
      ?auto_351938 - DIRECTION
      ?auto_351939 - MODE
      ?auto_351940 - DIRECTION
      ?auto_351941 - MODE
      ?auto_351942 - DIRECTION
      ?auto_351943 - MODE
    )
    :vars
    (
      ?auto_351951 - INSTRUMENT
      ?auto_351944 - SATELLITE
      ?auto_351945 - DIRECTION
      ?auto_351950 - INSTRUMENT
      ?auto_351947 - INSTRUMENT
      ?auto_351948 - INSTRUMENT
      ?auto_351949 - INSTRUMENT
      ?auto_351946 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_351937 ?auto_351934 ) ) ( not ( = ?auto_351938 ?auto_351934 ) ) ( not ( = ?auto_351938 ?auto_351937 ) ) ( not ( = ?auto_351940 ?auto_351934 ) ) ( not ( = ?auto_351940 ?auto_351937 ) ) ( not ( = ?auto_351940 ?auto_351938 ) ) ( not ( = ?auto_351942 ?auto_351934 ) ) ( not ( = ?auto_351942 ?auto_351937 ) ) ( not ( = ?auto_351942 ?auto_351938 ) ) ( not ( = ?auto_351942 ?auto_351940 ) ) ( ON_BOARD ?auto_351951 ?auto_351944 ) ( SUPPORTS ?auto_351951 ?auto_351941 ) ( not ( = ?auto_351940 ?auto_351945 ) ) ( CALIBRATION_TARGET ?auto_351951 ?auto_351945 ) ( not ( = ?auto_351945 ?auto_351937 ) ) ( ON_BOARD ?auto_351950 ?auto_351944 ) ( not ( = ?auto_351951 ?auto_351950 ) ) ( SUPPORTS ?auto_351950 ?auto_351936 ) ( CALIBRATION_TARGET ?auto_351950 ?auto_351945 ) ( not ( = ?auto_351945 ?auto_351934 ) ) ( ON_BOARD ?auto_351947 ?auto_351944 ) ( not ( = ?auto_351950 ?auto_351947 ) ) ( SUPPORTS ?auto_351947 ?auto_351935 ) ( CALIBRATION_TARGET ?auto_351947 ?auto_351945 ) ( not ( = ?auto_351945 ?auto_351938 ) ) ( ON_BOARD ?auto_351948 ?auto_351944 ) ( not ( = ?auto_351947 ?auto_351948 ) ) ( SUPPORTS ?auto_351948 ?auto_351939 ) ( CALIBRATION_TARGET ?auto_351948 ?auto_351945 ) ( not ( = ?auto_351945 ?auto_351942 ) ) ( ON_BOARD ?auto_351949 ?auto_351944 ) ( not ( = ?auto_351948 ?auto_351949 ) ) ( SUPPORTS ?auto_351949 ?auto_351943 ) ( CALIBRATION_TARGET ?auto_351949 ?auto_351945 ) ( POWER_AVAIL ?auto_351944 ) ( POINTING ?auto_351944 ?auto_351946 ) ( not ( = ?auto_351945 ?auto_351946 ) ) ( not ( = ?auto_351942 ?auto_351946 ) ) ( not ( = ?auto_351943 ?auto_351939 ) ) ( not ( = ?auto_351938 ?auto_351946 ) ) ( not ( = ?auto_351943 ?auto_351935 ) ) ( not ( = ?auto_351939 ?auto_351935 ) ) ( not ( = ?auto_351934 ?auto_351946 ) ) ( not ( = ?auto_351947 ?auto_351949 ) ) ( not ( = ?auto_351943 ?auto_351936 ) ) ( not ( = ?auto_351939 ?auto_351936 ) ) ( not ( = ?auto_351935 ?auto_351936 ) ) ( not ( = ?auto_351937 ?auto_351946 ) ) ( not ( = ?auto_351950 ?auto_351948 ) ) ( not ( = ?auto_351950 ?auto_351949 ) ) ( not ( = ?auto_351943 ?auto_351941 ) ) ( not ( = ?auto_351939 ?auto_351941 ) ) ( not ( = ?auto_351935 ?auto_351941 ) ) ( not ( = ?auto_351936 ?auto_351941 ) ) ( not ( = ?auto_351940 ?auto_351946 ) ) ( not ( = ?auto_351951 ?auto_351947 ) ) ( not ( = ?auto_351951 ?auto_351948 ) ) ( not ( = ?auto_351951 ?auto_351949 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_351942 ?auto_351943 ?auto_351938 ?auto_351939 ?auto_351934 ?auto_351935 ?auto_351940 ?auto_351941 ?auto_351937 ?auto_351936 )
      ( GET-5IMAGE-VERIFY ?auto_351934 ?auto_351935 ?auto_351937 ?auto_351936 ?auto_351938 ?auto_351939 ?auto_351940 ?auto_351941 ?auto_351942 ?auto_351943 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_352432 - DIRECTION
      ?auto_352433 - MODE
      ?auto_352435 - DIRECTION
      ?auto_352434 - MODE
      ?auto_352436 - DIRECTION
      ?auto_352437 - MODE
      ?auto_352438 - DIRECTION
      ?auto_352439 - MODE
      ?auto_352440 - DIRECTION
      ?auto_352441 - MODE
    )
    :vars
    (
      ?auto_352449 - INSTRUMENT
      ?auto_352442 - SATELLITE
      ?auto_352443 - DIRECTION
      ?auto_352448 - INSTRUMENT
      ?auto_352445 - INSTRUMENT
      ?auto_352446 - INSTRUMENT
      ?auto_352447 - INSTRUMENT
      ?auto_352444 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_352435 ?auto_352432 ) ) ( not ( = ?auto_352436 ?auto_352432 ) ) ( not ( = ?auto_352436 ?auto_352435 ) ) ( not ( = ?auto_352438 ?auto_352432 ) ) ( not ( = ?auto_352438 ?auto_352435 ) ) ( not ( = ?auto_352438 ?auto_352436 ) ) ( not ( = ?auto_352440 ?auto_352432 ) ) ( not ( = ?auto_352440 ?auto_352435 ) ) ( not ( = ?auto_352440 ?auto_352436 ) ) ( not ( = ?auto_352440 ?auto_352438 ) ) ( ON_BOARD ?auto_352449 ?auto_352442 ) ( SUPPORTS ?auto_352449 ?auto_352437 ) ( not ( = ?auto_352436 ?auto_352443 ) ) ( CALIBRATION_TARGET ?auto_352449 ?auto_352443 ) ( not ( = ?auto_352443 ?auto_352435 ) ) ( ON_BOARD ?auto_352448 ?auto_352442 ) ( not ( = ?auto_352449 ?auto_352448 ) ) ( SUPPORTS ?auto_352448 ?auto_352434 ) ( CALIBRATION_TARGET ?auto_352448 ?auto_352443 ) ( not ( = ?auto_352443 ?auto_352432 ) ) ( ON_BOARD ?auto_352445 ?auto_352442 ) ( not ( = ?auto_352448 ?auto_352445 ) ) ( SUPPORTS ?auto_352445 ?auto_352433 ) ( CALIBRATION_TARGET ?auto_352445 ?auto_352443 ) ( not ( = ?auto_352443 ?auto_352440 ) ) ( ON_BOARD ?auto_352446 ?auto_352442 ) ( not ( = ?auto_352445 ?auto_352446 ) ) ( SUPPORTS ?auto_352446 ?auto_352441 ) ( CALIBRATION_TARGET ?auto_352446 ?auto_352443 ) ( not ( = ?auto_352443 ?auto_352438 ) ) ( ON_BOARD ?auto_352447 ?auto_352442 ) ( not ( = ?auto_352446 ?auto_352447 ) ) ( SUPPORTS ?auto_352447 ?auto_352439 ) ( CALIBRATION_TARGET ?auto_352447 ?auto_352443 ) ( POWER_AVAIL ?auto_352442 ) ( POINTING ?auto_352442 ?auto_352444 ) ( not ( = ?auto_352443 ?auto_352444 ) ) ( not ( = ?auto_352438 ?auto_352444 ) ) ( not ( = ?auto_352439 ?auto_352441 ) ) ( not ( = ?auto_352440 ?auto_352444 ) ) ( not ( = ?auto_352439 ?auto_352433 ) ) ( not ( = ?auto_352441 ?auto_352433 ) ) ( not ( = ?auto_352432 ?auto_352444 ) ) ( not ( = ?auto_352445 ?auto_352447 ) ) ( not ( = ?auto_352439 ?auto_352434 ) ) ( not ( = ?auto_352441 ?auto_352434 ) ) ( not ( = ?auto_352433 ?auto_352434 ) ) ( not ( = ?auto_352435 ?auto_352444 ) ) ( not ( = ?auto_352448 ?auto_352446 ) ) ( not ( = ?auto_352448 ?auto_352447 ) ) ( not ( = ?auto_352439 ?auto_352437 ) ) ( not ( = ?auto_352441 ?auto_352437 ) ) ( not ( = ?auto_352433 ?auto_352437 ) ) ( not ( = ?auto_352434 ?auto_352437 ) ) ( not ( = ?auto_352436 ?auto_352444 ) ) ( not ( = ?auto_352449 ?auto_352445 ) ) ( not ( = ?auto_352449 ?auto_352446 ) ) ( not ( = ?auto_352449 ?auto_352447 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_352438 ?auto_352439 ?auto_352440 ?auto_352441 ?auto_352432 ?auto_352433 ?auto_352436 ?auto_352437 ?auto_352435 ?auto_352434 )
      ( GET-5IMAGE-VERIFY ?auto_352432 ?auto_352433 ?auto_352435 ?auto_352434 ?auto_352436 ?auto_352437 ?auto_352438 ?auto_352439 ?auto_352440 ?auto_352441 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_352510 - DIRECTION
      ?auto_352511 - MODE
      ?auto_352513 - DIRECTION
      ?auto_352512 - MODE
      ?auto_352514 - DIRECTION
      ?auto_352515 - MODE
      ?auto_352516 - DIRECTION
      ?auto_352517 - MODE
      ?auto_352518 - DIRECTION
      ?auto_352519 - MODE
    )
    :vars
    (
      ?auto_352527 - INSTRUMENT
      ?auto_352520 - SATELLITE
      ?auto_352521 - DIRECTION
      ?auto_352526 - INSTRUMENT
      ?auto_352523 - INSTRUMENT
      ?auto_352524 - INSTRUMENT
      ?auto_352525 - INSTRUMENT
      ?auto_352522 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_352513 ?auto_352510 ) ) ( not ( = ?auto_352514 ?auto_352510 ) ) ( not ( = ?auto_352514 ?auto_352513 ) ) ( not ( = ?auto_352516 ?auto_352510 ) ) ( not ( = ?auto_352516 ?auto_352513 ) ) ( not ( = ?auto_352516 ?auto_352514 ) ) ( not ( = ?auto_352518 ?auto_352510 ) ) ( not ( = ?auto_352518 ?auto_352513 ) ) ( not ( = ?auto_352518 ?auto_352514 ) ) ( not ( = ?auto_352518 ?auto_352516 ) ) ( ON_BOARD ?auto_352527 ?auto_352520 ) ( SUPPORTS ?auto_352527 ?auto_352515 ) ( not ( = ?auto_352514 ?auto_352521 ) ) ( CALIBRATION_TARGET ?auto_352527 ?auto_352521 ) ( not ( = ?auto_352521 ?auto_352513 ) ) ( ON_BOARD ?auto_352526 ?auto_352520 ) ( not ( = ?auto_352527 ?auto_352526 ) ) ( SUPPORTS ?auto_352526 ?auto_352512 ) ( CALIBRATION_TARGET ?auto_352526 ?auto_352521 ) ( not ( = ?auto_352521 ?auto_352510 ) ) ( ON_BOARD ?auto_352523 ?auto_352520 ) ( not ( = ?auto_352526 ?auto_352523 ) ) ( SUPPORTS ?auto_352523 ?auto_352511 ) ( CALIBRATION_TARGET ?auto_352523 ?auto_352521 ) ( not ( = ?auto_352521 ?auto_352516 ) ) ( ON_BOARD ?auto_352524 ?auto_352520 ) ( not ( = ?auto_352523 ?auto_352524 ) ) ( SUPPORTS ?auto_352524 ?auto_352517 ) ( CALIBRATION_TARGET ?auto_352524 ?auto_352521 ) ( not ( = ?auto_352521 ?auto_352518 ) ) ( ON_BOARD ?auto_352525 ?auto_352520 ) ( not ( = ?auto_352524 ?auto_352525 ) ) ( SUPPORTS ?auto_352525 ?auto_352519 ) ( CALIBRATION_TARGET ?auto_352525 ?auto_352521 ) ( POWER_AVAIL ?auto_352520 ) ( POINTING ?auto_352520 ?auto_352522 ) ( not ( = ?auto_352521 ?auto_352522 ) ) ( not ( = ?auto_352518 ?auto_352522 ) ) ( not ( = ?auto_352519 ?auto_352517 ) ) ( not ( = ?auto_352516 ?auto_352522 ) ) ( not ( = ?auto_352519 ?auto_352511 ) ) ( not ( = ?auto_352517 ?auto_352511 ) ) ( not ( = ?auto_352510 ?auto_352522 ) ) ( not ( = ?auto_352523 ?auto_352525 ) ) ( not ( = ?auto_352519 ?auto_352512 ) ) ( not ( = ?auto_352517 ?auto_352512 ) ) ( not ( = ?auto_352511 ?auto_352512 ) ) ( not ( = ?auto_352513 ?auto_352522 ) ) ( not ( = ?auto_352526 ?auto_352524 ) ) ( not ( = ?auto_352526 ?auto_352525 ) ) ( not ( = ?auto_352519 ?auto_352515 ) ) ( not ( = ?auto_352517 ?auto_352515 ) ) ( not ( = ?auto_352511 ?auto_352515 ) ) ( not ( = ?auto_352512 ?auto_352515 ) ) ( not ( = ?auto_352514 ?auto_352522 ) ) ( not ( = ?auto_352527 ?auto_352523 ) ) ( not ( = ?auto_352527 ?auto_352524 ) ) ( not ( = ?auto_352527 ?auto_352525 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_352518 ?auto_352519 ?auto_352516 ?auto_352517 ?auto_352510 ?auto_352511 ?auto_352514 ?auto_352515 ?auto_352513 ?auto_352512 )
      ( GET-5IMAGE-VERIFY ?auto_352510 ?auto_352511 ?auto_352513 ?auto_352512 ?auto_352514 ?auto_352515 ?auto_352516 ?auto_352517 ?auto_352518 ?auto_352519 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_353092 - DIRECTION
      ?auto_353093 - MODE
      ?auto_353095 - DIRECTION
      ?auto_353094 - MODE
      ?auto_353096 - DIRECTION
      ?auto_353097 - MODE
      ?auto_353098 - DIRECTION
      ?auto_353099 - MODE
      ?auto_353100 - DIRECTION
      ?auto_353101 - MODE
    )
    :vars
    (
      ?auto_353109 - INSTRUMENT
      ?auto_353102 - SATELLITE
      ?auto_353103 - DIRECTION
      ?auto_353108 - INSTRUMENT
      ?auto_353105 - INSTRUMENT
      ?auto_353106 - INSTRUMENT
      ?auto_353107 - INSTRUMENT
      ?auto_353104 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_353095 ?auto_353092 ) ) ( not ( = ?auto_353096 ?auto_353092 ) ) ( not ( = ?auto_353096 ?auto_353095 ) ) ( not ( = ?auto_353098 ?auto_353092 ) ) ( not ( = ?auto_353098 ?auto_353095 ) ) ( not ( = ?auto_353098 ?auto_353096 ) ) ( not ( = ?auto_353100 ?auto_353092 ) ) ( not ( = ?auto_353100 ?auto_353095 ) ) ( not ( = ?auto_353100 ?auto_353096 ) ) ( not ( = ?auto_353100 ?auto_353098 ) ) ( ON_BOARD ?auto_353109 ?auto_353102 ) ( SUPPORTS ?auto_353109 ?auto_353094 ) ( not ( = ?auto_353095 ?auto_353103 ) ) ( CALIBRATION_TARGET ?auto_353109 ?auto_353103 ) ( not ( = ?auto_353103 ?auto_353100 ) ) ( ON_BOARD ?auto_353108 ?auto_353102 ) ( not ( = ?auto_353109 ?auto_353108 ) ) ( SUPPORTS ?auto_353108 ?auto_353101 ) ( CALIBRATION_TARGET ?auto_353108 ?auto_353103 ) ( not ( = ?auto_353103 ?auto_353092 ) ) ( ON_BOARD ?auto_353105 ?auto_353102 ) ( not ( = ?auto_353108 ?auto_353105 ) ) ( SUPPORTS ?auto_353105 ?auto_353093 ) ( CALIBRATION_TARGET ?auto_353105 ?auto_353103 ) ( not ( = ?auto_353103 ?auto_353098 ) ) ( ON_BOARD ?auto_353106 ?auto_353102 ) ( not ( = ?auto_353105 ?auto_353106 ) ) ( SUPPORTS ?auto_353106 ?auto_353099 ) ( CALIBRATION_TARGET ?auto_353106 ?auto_353103 ) ( not ( = ?auto_353103 ?auto_353096 ) ) ( ON_BOARD ?auto_353107 ?auto_353102 ) ( not ( = ?auto_353106 ?auto_353107 ) ) ( SUPPORTS ?auto_353107 ?auto_353097 ) ( CALIBRATION_TARGET ?auto_353107 ?auto_353103 ) ( POWER_AVAIL ?auto_353102 ) ( POINTING ?auto_353102 ?auto_353104 ) ( not ( = ?auto_353103 ?auto_353104 ) ) ( not ( = ?auto_353096 ?auto_353104 ) ) ( not ( = ?auto_353097 ?auto_353099 ) ) ( not ( = ?auto_353098 ?auto_353104 ) ) ( not ( = ?auto_353097 ?auto_353093 ) ) ( not ( = ?auto_353099 ?auto_353093 ) ) ( not ( = ?auto_353092 ?auto_353104 ) ) ( not ( = ?auto_353105 ?auto_353107 ) ) ( not ( = ?auto_353097 ?auto_353101 ) ) ( not ( = ?auto_353099 ?auto_353101 ) ) ( not ( = ?auto_353093 ?auto_353101 ) ) ( not ( = ?auto_353100 ?auto_353104 ) ) ( not ( = ?auto_353108 ?auto_353106 ) ) ( not ( = ?auto_353108 ?auto_353107 ) ) ( not ( = ?auto_353097 ?auto_353094 ) ) ( not ( = ?auto_353099 ?auto_353094 ) ) ( not ( = ?auto_353093 ?auto_353094 ) ) ( not ( = ?auto_353101 ?auto_353094 ) ) ( not ( = ?auto_353095 ?auto_353104 ) ) ( not ( = ?auto_353109 ?auto_353105 ) ) ( not ( = ?auto_353109 ?auto_353106 ) ) ( not ( = ?auto_353109 ?auto_353107 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_353096 ?auto_353097 ?auto_353098 ?auto_353099 ?auto_353092 ?auto_353093 ?auto_353095 ?auto_353094 ?auto_353100 ?auto_353101 )
      ( GET-5IMAGE-VERIFY ?auto_353092 ?auto_353093 ?auto_353095 ?auto_353094 ?auto_353096 ?auto_353097 ?auto_353098 ?auto_353099 ?auto_353100 ?auto_353101 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_353256 - DIRECTION
      ?auto_353257 - MODE
      ?auto_353259 - DIRECTION
      ?auto_353258 - MODE
      ?auto_353260 - DIRECTION
      ?auto_353261 - MODE
      ?auto_353262 - DIRECTION
      ?auto_353263 - MODE
      ?auto_353264 - DIRECTION
      ?auto_353265 - MODE
    )
    :vars
    (
      ?auto_353273 - INSTRUMENT
      ?auto_353266 - SATELLITE
      ?auto_353267 - DIRECTION
      ?auto_353272 - INSTRUMENT
      ?auto_353269 - INSTRUMENT
      ?auto_353270 - INSTRUMENT
      ?auto_353271 - INSTRUMENT
      ?auto_353268 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_353259 ?auto_353256 ) ) ( not ( = ?auto_353260 ?auto_353256 ) ) ( not ( = ?auto_353260 ?auto_353259 ) ) ( not ( = ?auto_353262 ?auto_353256 ) ) ( not ( = ?auto_353262 ?auto_353259 ) ) ( not ( = ?auto_353262 ?auto_353260 ) ) ( not ( = ?auto_353264 ?auto_353256 ) ) ( not ( = ?auto_353264 ?auto_353259 ) ) ( not ( = ?auto_353264 ?auto_353260 ) ) ( not ( = ?auto_353264 ?auto_353262 ) ) ( ON_BOARD ?auto_353273 ?auto_353266 ) ( SUPPORTS ?auto_353273 ?auto_353258 ) ( not ( = ?auto_353259 ?auto_353267 ) ) ( CALIBRATION_TARGET ?auto_353273 ?auto_353267 ) ( not ( = ?auto_353267 ?auto_353262 ) ) ( ON_BOARD ?auto_353272 ?auto_353266 ) ( not ( = ?auto_353273 ?auto_353272 ) ) ( SUPPORTS ?auto_353272 ?auto_353263 ) ( CALIBRATION_TARGET ?auto_353272 ?auto_353267 ) ( not ( = ?auto_353267 ?auto_353256 ) ) ( ON_BOARD ?auto_353269 ?auto_353266 ) ( not ( = ?auto_353272 ?auto_353269 ) ) ( SUPPORTS ?auto_353269 ?auto_353257 ) ( CALIBRATION_TARGET ?auto_353269 ?auto_353267 ) ( not ( = ?auto_353267 ?auto_353264 ) ) ( ON_BOARD ?auto_353270 ?auto_353266 ) ( not ( = ?auto_353269 ?auto_353270 ) ) ( SUPPORTS ?auto_353270 ?auto_353265 ) ( CALIBRATION_TARGET ?auto_353270 ?auto_353267 ) ( not ( = ?auto_353267 ?auto_353260 ) ) ( ON_BOARD ?auto_353271 ?auto_353266 ) ( not ( = ?auto_353270 ?auto_353271 ) ) ( SUPPORTS ?auto_353271 ?auto_353261 ) ( CALIBRATION_TARGET ?auto_353271 ?auto_353267 ) ( POWER_AVAIL ?auto_353266 ) ( POINTING ?auto_353266 ?auto_353268 ) ( not ( = ?auto_353267 ?auto_353268 ) ) ( not ( = ?auto_353260 ?auto_353268 ) ) ( not ( = ?auto_353261 ?auto_353265 ) ) ( not ( = ?auto_353264 ?auto_353268 ) ) ( not ( = ?auto_353261 ?auto_353257 ) ) ( not ( = ?auto_353265 ?auto_353257 ) ) ( not ( = ?auto_353256 ?auto_353268 ) ) ( not ( = ?auto_353269 ?auto_353271 ) ) ( not ( = ?auto_353261 ?auto_353263 ) ) ( not ( = ?auto_353265 ?auto_353263 ) ) ( not ( = ?auto_353257 ?auto_353263 ) ) ( not ( = ?auto_353262 ?auto_353268 ) ) ( not ( = ?auto_353272 ?auto_353270 ) ) ( not ( = ?auto_353272 ?auto_353271 ) ) ( not ( = ?auto_353261 ?auto_353258 ) ) ( not ( = ?auto_353265 ?auto_353258 ) ) ( not ( = ?auto_353257 ?auto_353258 ) ) ( not ( = ?auto_353263 ?auto_353258 ) ) ( not ( = ?auto_353259 ?auto_353268 ) ) ( not ( = ?auto_353273 ?auto_353269 ) ) ( not ( = ?auto_353273 ?auto_353270 ) ) ( not ( = ?auto_353273 ?auto_353271 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_353260 ?auto_353261 ?auto_353264 ?auto_353265 ?auto_353256 ?auto_353257 ?auto_353259 ?auto_353258 ?auto_353262 ?auto_353263 )
      ( GET-5IMAGE-VERIFY ?auto_353256 ?auto_353257 ?auto_353259 ?auto_353258 ?auto_353260 ?auto_353261 ?auto_353262 ?auto_353263 ?auto_353264 ?auto_353265 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_353500 - DIRECTION
      ?auto_353501 - MODE
      ?auto_353503 - DIRECTION
      ?auto_353502 - MODE
      ?auto_353504 - DIRECTION
      ?auto_353505 - MODE
      ?auto_353506 - DIRECTION
      ?auto_353507 - MODE
      ?auto_353508 - DIRECTION
      ?auto_353509 - MODE
    )
    :vars
    (
      ?auto_353517 - INSTRUMENT
      ?auto_353510 - SATELLITE
      ?auto_353511 - DIRECTION
      ?auto_353516 - INSTRUMENT
      ?auto_353513 - INSTRUMENT
      ?auto_353514 - INSTRUMENT
      ?auto_353515 - INSTRUMENT
      ?auto_353512 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_353503 ?auto_353500 ) ) ( not ( = ?auto_353504 ?auto_353500 ) ) ( not ( = ?auto_353504 ?auto_353503 ) ) ( not ( = ?auto_353506 ?auto_353500 ) ) ( not ( = ?auto_353506 ?auto_353503 ) ) ( not ( = ?auto_353506 ?auto_353504 ) ) ( not ( = ?auto_353508 ?auto_353500 ) ) ( not ( = ?auto_353508 ?auto_353503 ) ) ( not ( = ?auto_353508 ?auto_353504 ) ) ( not ( = ?auto_353508 ?auto_353506 ) ) ( ON_BOARD ?auto_353517 ?auto_353510 ) ( SUPPORTS ?auto_353517 ?auto_353502 ) ( not ( = ?auto_353503 ?auto_353511 ) ) ( CALIBRATION_TARGET ?auto_353517 ?auto_353511 ) ( not ( = ?auto_353511 ?auto_353508 ) ) ( ON_BOARD ?auto_353516 ?auto_353510 ) ( not ( = ?auto_353517 ?auto_353516 ) ) ( SUPPORTS ?auto_353516 ?auto_353509 ) ( CALIBRATION_TARGET ?auto_353516 ?auto_353511 ) ( not ( = ?auto_353511 ?auto_353500 ) ) ( ON_BOARD ?auto_353513 ?auto_353510 ) ( not ( = ?auto_353516 ?auto_353513 ) ) ( SUPPORTS ?auto_353513 ?auto_353501 ) ( CALIBRATION_TARGET ?auto_353513 ?auto_353511 ) ( not ( = ?auto_353511 ?auto_353504 ) ) ( ON_BOARD ?auto_353514 ?auto_353510 ) ( not ( = ?auto_353513 ?auto_353514 ) ) ( SUPPORTS ?auto_353514 ?auto_353505 ) ( CALIBRATION_TARGET ?auto_353514 ?auto_353511 ) ( not ( = ?auto_353511 ?auto_353506 ) ) ( ON_BOARD ?auto_353515 ?auto_353510 ) ( not ( = ?auto_353514 ?auto_353515 ) ) ( SUPPORTS ?auto_353515 ?auto_353507 ) ( CALIBRATION_TARGET ?auto_353515 ?auto_353511 ) ( POWER_AVAIL ?auto_353510 ) ( POINTING ?auto_353510 ?auto_353512 ) ( not ( = ?auto_353511 ?auto_353512 ) ) ( not ( = ?auto_353506 ?auto_353512 ) ) ( not ( = ?auto_353507 ?auto_353505 ) ) ( not ( = ?auto_353504 ?auto_353512 ) ) ( not ( = ?auto_353507 ?auto_353501 ) ) ( not ( = ?auto_353505 ?auto_353501 ) ) ( not ( = ?auto_353500 ?auto_353512 ) ) ( not ( = ?auto_353513 ?auto_353515 ) ) ( not ( = ?auto_353507 ?auto_353509 ) ) ( not ( = ?auto_353505 ?auto_353509 ) ) ( not ( = ?auto_353501 ?auto_353509 ) ) ( not ( = ?auto_353508 ?auto_353512 ) ) ( not ( = ?auto_353516 ?auto_353514 ) ) ( not ( = ?auto_353516 ?auto_353515 ) ) ( not ( = ?auto_353507 ?auto_353502 ) ) ( not ( = ?auto_353505 ?auto_353502 ) ) ( not ( = ?auto_353501 ?auto_353502 ) ) ( not ( = ?auto_353509 ?auto_353502 ) ) ( not ( = ?auto_353503 ?auto_353512 ) ) ( not ( = ?auto_353517 ?auto_353513 ) ) ( not ( = ?auto_353517 ?auto_353514 ) ) ( not ( = ?auto_353517 ?auto_353515 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_353506 ?auto_353507 ?auto_353504 ?auto_353505 ?auto_353500 ?auto_353501 ?auto_353503 ?auto_353502 ?auto_353508 ?auto_353509 )
      ( GET-5IMAGE-VERIFY ?auto_353500 ?auto_353501 ?auto_353503 ?auto_353502 ?auto_353504 ?auto_353505 ?auto_353506 ?auto_353507 ?auto_353508 ?auto_353509 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_353750 - DIRECTION
      ?auto_353751 - MODE
      ?auto_353753 - DIRECTION
      ?auto_353752 - MODE
      ?auto_353754 - DIRECTION
      ?auto_353755 - MODE
      ?auto_353756 - DIRECTION
      ?auto_353757 - MODE
      ?auto_353758 - DIRECTION
      ?auto_353759 - MODE
    )
    :vars
    (
      ?auto_353767 - INSTRUMENT
      ?auto_353760 - SATELLITE
      ?auto_353761 - DIRECTION
      ?auto_353766 - INSTRUMENT
      ?auto_353763 - INSTRUMENT
      ?auto_353764 - INSTRUMENT
      ?auto_353765 - INSTRUMENT
      ?auto_353762 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_353753 ?auto_353750 ) ) ( not ( = ?auto_353754 ?auto_353750 ) ) ( not ( = ?auto_353754 ?auto_353753 ) ) ( not ( = ?auto_353756 ?auto_353750 ) ) ( not ( = ?auto_353756 ?auto_353753 ) ) ( not ( = ?auto_353756 ?auto_353754 ) ) ( not ( = ?auto_353758 ?auto_353750 ) ) ( not ( = ?auto_353758 ?auto_353753 ) ) ( not ( = ?auto_353758 ?auto_353754 ) ) ( not ( = ?auto_353758 ?auto_353756 ) ) ( ON_BOARD ?auto_353767 ?auto_353760 ) ( SUPPORTS ?auto_353767 ?auto_353752 ) ( not ( = ?auto_353753 ?auto_353761 ) ) ( CALIBRATION_TARGET ?auto_353767 ?auto_353761 ) ( not ( = ?auto_353761 ?auto_353756 ) ) ( ON_BOARD ?auto_353766 ?auto_353760 ) ( not ( = ?auto_353767 ?auto_353766 ) ) ( SUPPORTS ?auto_353766 ?auto_353757 ) ( CALIBRATION_TARGET ?auto_353766 ?auto_353761 ) ( not ( = ?auto_353761 ?auto_353750 ) ) ( ON_BOARD ?auto_353763 ?auto_353760 ) ( not ( = ?auto_353766 ?auto_353763 ) ) ( SUPPORTS ?auto_353763 ?auto_353751 ) ( CALIBRATION_TARGET ?auto_353763 ?auto_353761 ) ( not ( = ?auto_353761 ?auto_353754 ) ) ( ON_BOARD ?auto_353764 ?auto_353760 ) ( not ( = ?auto_353763 ?auto_353764 ) ) ( SUPPORTS ?auto_353764 ?auto_353755 ) ( CALIBRATION_TARGET ?auto_353764 ?auto_353761 ) ( not ( = ?auto_353761 ?auto_353758 ) ) ( ON_BOARD ?auto_353765 ?auto_353760 ) ( not ( = ?auto_353764 ?auto_353765 ) ) ( SUPPORTS ?auto_353765 ?auto_353759 ) ( CALIBRATION_TARGET ?auto_353765 ?auto_353761 ) ( POWER_AVAIL ?auto_353760 ) ( POINTING ?auto_353760 ?auto_353762 ) ( not ( = ?auto_353761 ?auto_353762 ) ) ( not ( = ?auto_353758 ?auto_353762 ) ) ( not ( = ?auto_353759 ?auto_353755 ) ) ( not ( = ?auto_353754 ?auto_353762 ) ) ( not ( = ?auto_353759 ?auto_353751 ) ) ( not ( = ?auto_353755 ?auto_353751 ) ) ( not ( = ?auto_353750 ?auto_353762 ) ) ( not ( = ?auto_353763 ?auto_353765 ) ) ( not ( = ?auto_353759 ?auto_353757 ) ) ( not ( = ?auto_353755 ?auto_353757 ) ) ( not ( = ?auto_353751 ?auto_353757 ) ) ( not ( = ?auto_353756 ?auto_353762 ) ) ( not ( = ?auto_353766 ?auto_353764 ) ) ( not ( = ?auto_353766 ?auto_353765 ) ) ( not ( = ?auto_353759 ?auto_353752 ) ) ( not ( = ?auto_353755 ?auto_353752 ) ) ( not ( = ?auto_353751 ?auto_353752 ) ) ( not ( = ?auto_353757 ?auto_353752 ) ) ( not ( = ?auto_353753 ?auto_353762 ) ) ( not ( = ?auto_353767 ?auto_353763 ) ) ( not ( = ?auto_353767 ?auto_353764 ) ) ( not ( = ?auto_353767 ?auto_353765 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_353758 ?auto_353759 ?auto_353754 ?auto_353755 ?auto_353750 ?auto_353751 ?auto_353753 ?auto_353752 ?auto_353756 ?auto_353757 )
      ( GET-5IMAGE-VERIFY ?auto_353750 ?auto_353751 ?auto_353753 ?auto_353752 ?auto_353754 ?auto_353755 ?auto_353756 ?auto_353757 ?auto_353758 ?auto_353759 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_354520 - DIRECTION
      ?auto_354521 - MODE
      ?auto_354523 - DIRECTION
      ?auto_354522 - MODE
      ?auto_354524 - DIRECTION
      ?auto_354525 - MODE
      ?auto_354526 - DIRECTION
      ?auto_354527 - MODE
      ?auto_354528 - DIRECTION
      ?auto_354529 - MODE
    )
    :vars
    (
      ?auto_354537 - INSTRUMENT
      ?auto_354530 - SATELLITE
      ?auto_354531 - DIRECTION
      ?auto_354536 - INSTRUMENT
      ?auto_354533 - INSTRUMENT
      ?auto_354534 - INSTRUMENT
      ?auto_354535 - INSTRUMENT
      ?auto_354532 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_354523 ?auto_354520 ) ) ( not ( = ?auto_354524 ?auto_354520 ) ) ( not ( = ?auto_354524 ?auto_354523 ) ) ( not ( = ?auto_354526 ?auto_354520 ) ) ( not ( = ?auto_354526 ?auto_354523 ) ) ( not ( = ?auto_354526 ?auto_354524 ) ) ( not ( = ?auto_354528 ?auto_354520 ) ) ( not ( = ?auto_354528 ?auto_354523 ) ) ( not ( = ?auto_354528 ?auto_354524 ) ) ( not ( = ?auto_354528 ?auto_354526 ) ) ( ON_BOARD ?auto_354537 ?auto_354530 ) ( SUPPORTS ?auto_354537 ?auto_354522 ) ( not ( = ?auto_354523 ?auto_354531 ) ) ( CALIBRATION_TARGET ?auto_354537 ?auto_354531 ) ( not ( = ?auto_354531 ?auto_354524 ) ) ( ON_BOARD ?auto_354536 ?auto_354530 ) ( not ( = ?auto_354537 ?auto_354536 ) ) ( SUPPORTS ?auto_354536 ?auto_354525 ) ( CALIBRATION_TARGET ?auto_354536 ?auto_354531 ) ( not ( = ?auto_354531 ?auto_354520 ) ) ( ON_BOARD ?auto_354533 ?auto_354530 ) ( not ( = ?auto_354536 ?auto_354533 ) ) ( SUPPORTS ?auto_354533 ?auto_354521 ) ( CALIBRATION_TARGET ?auto_354533 ?auto_354531 ) ( not ( = ?auto_354531 ?auto_354528 ) ) ( ON_BOARD ?auto_354534 ?auto_354530 ) ( not ( = ?auto_354533 ?auto_354534 ) ) ( SUPPORTS ?auto_354534 ?auto_354529 ) ( CALIBRATION_TARGET ?auto_354534 ?auto_354531 ) ( not ( = ?auto_354531 ?auto_354526 ) ) ( ON_BOARD ?auto_354535 ?auto_354530 ) ( not ( = ?auto_354534 ?auto_354535 ) ) ( SUPPORTS ?auto_354535 ?auto_354527 ) ( CALIBRATION_TARGET ?auto_354535 ?auto_354531 ) ( POWER_AVAIL ?auto_354530 ) ( POINTING ?auto_354530 ?auto_354532 ) ( not ( = ?auto_354531 ?auto_354532 ) ) ( not ( = ?auto_354526 ?auto_354532 ) ) ( not ( = ?auto_354527 ?auto_354529 ) ) ( not ( = ?auto_354528 ?auto_354532 ) ) ( not ( = ?auto_354527 ?auto_354521 ) ) ( not ( = ?auto_354529 ?auto_354521 ) ) ( not ( = ?auto_354520 ?auto_354532 ) ) ( not ( = ?auto_354533 ?auto_354535 ) ) ( not ( = ?auto_354527 ?auto_354525 ) ) ( not ( = ?auto_354529 ?auto_354525 ) ) ( not ( = ?auto_354521 ?auto_354525 ) ) ( not ( = ?auto_354524 ?auto_354532 ) ) ( not ( = ?auto_354536 ?auto_354534 ) ) ( not ( = ?auto_354536 ?auto_354535 ) ) ( not ( = ?auto_354527 ?auto_354522 ) ) ( not ( = ?auto_354529 ?auto_354522 ) ) ( not ( = ?auto_354521 ?auto_354522 ) ) ( not ( = ?auto_354525 ?auto_354522 ) ) ( not ( = ?auto_354523 ?auto_354532 ) ) ( not ( = ?auto_354537 ?auto_354533 ) ) ( not ( = ?auto_354537 ?auto_354534 ) ) ( not ( = ?auto_354537 ?auto_354535 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_354526 ?auto_354527 ?auto_354528 ?auto_354529 ?auto_354520 ?auto_354521 ?auto_354523 ?auto_354522 ?auto_354524 ?auto_354525 )
      ( GET-5IMAGE-VERIFY ?auto_354520 ?auto_354521 ?auto_354523 ?auto_354522 ?auto_354524 ?auto_354525 ?auto_354526 ?auto_354527 ?auto_354528 ?auto_354529 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_354598 - DIRECTION
      ?auto_354599 - MODE
      ?auto_354601 - DIRECTION
      ?auto_354600 - MODE
      ?auto_354602 - DIRECTION
      ?auto_354603 - MODE
      ?auto_354604 - DIRECTION
      ?auto_354605 - MODE
      ?auto_354606 - DIRECTION
      ?auto_354607 - MODE
    )
    :vars
    (
      ?auto_354615 - INSTRUMENT
      ?auto_354608 - SATELLITE
      ?auto_354609 - DIRECTION
      ?auto_354614 - INSTRUMENT
      ?auto_354611 - INSTRUMENT
      ?auto_354612 - INSTRUMENT
      ?auto_354613 - INSTRUMENT
      ?auto_354610 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_354601 ?auto_354598 ) ) ( not ( = ?auto_354602 ?auto_354598 ) ) ( not ( = ?auto_354602 ?auto_354601 ) ) ( not ( = ?auto_354604 ?auto_354598 ) ) ( not ( = ?auto_354604 ?auto_354601 ) ) ( not ( = ?auto_354604 ?auto_354602 ) ) ( not ( = ?auto_354606 ?auto_354598 ) ) ( not ( = ?auto_354606 ?auto_354601 ) ) ( not ( = ?auto_354606 ?auto_354602 ) ) ( not ( = ?auto_354606 ?auto_354604 ) ) ( ON_BOARD ?auto_354615 ?auto_354608 ) ( SUPPORTS ?auto_354615 ?auto_354600 ) ( not ( = ?auto_354601 ?auto_354609 ) ) ( CALIBRATION_TARGET ?auto_354615 ?auto_354609 ) ( not ( = ?auto_354609 ?auto_354602 ) ) ( ON_BOARD ?auto_354614 ?auto_354608 ) ( not ( = ?auto_354615 ?auto_354614 ) ) ( SUPPORTS ?auto_354614 ?auto_354603 ) ( CALIBRATION_TARGET ?auto_354614 ?auto_354609 ) ( not ( = ?auto_354609 ?auto_354598 ) ) ( ON_BOARD ?auto_354611 ?auto_354608 ) ( not ( = ?auto_354614 ?auto_354611 ) ) ( SUPPORTS ?auto_354611 ?auto_354599 ) ( CALIBRATION_TARGET ?auto_354611 ?auto_354609 ) ( not ( = ?auto_354609 ?auto_354604 ) ) ( ON_BOARD ?auto_354612 ?auto_354608 ) ( not ( = ?auto_354611 ?auto_354612 ) ) ( SUPPORTS ?auto_354612 ?auto_354605 ) ( CALIBRATION_TARGET ?auto_354612 ?auto_354609 ) ( not ( = ?auto_354609 ?auto_354606 ) ) ( ON_BOARD ?auto_354613 ?auto_354608 ) ( not ( = ?auto_354612 ?auto_354613 ) ) ( SUPPORTS ?auto_354613 ?auto_354607 ) ( CALIBRATION_TARGET ?auto_354613 ?auto_354609 ) ( POWER_AVAIL ?auto_354608 ) ( POINTING ?auto_354608 ?auto_354610 ) ( not ( = ?auto_354609 ?auto_354610 ) ) ( not ( = ?auto_354606 ?auto_354610 ) ) ( not ( = ?auto_354607 ?auto_354605 ) ) ( not ( = ?auto_354604 ?auto_354610 ) ) ( not ( = ?auto_354607 ?auto_354599 ) ) ( not ( = ?auto_354605 ?auto_354599 ) ) ( not ( = ?auto_354598 ?auto_354610 ) ) ( not ( = ?auto_354611 ?auto_354613 ) ) ( not ( = ?auto_354607 ?auto_354603 ) ) ( not ( = ?auto_354605 ?auto_354603 ) ) ( not ( = ?auto_354599 ?auto_354603 ) ) ( not ( = ?auto_354602 ?auto_354610 ) ) ( not ( = ?auto_354614 ?auto_354612 ) ) ( not ( = ?auto_354614 ?auto_354613 ) ) ( not ( = ?auto_354607 ?auto_354600 ) ) ( not ( = ?auto_354605 ?auto_354600 ) ) ( not ( = ?auto_354599 ?auto_354600 ) ) ( not ( = ?auto_354603 ?auto_354600 ) ) ( not ( = ?auto_354601 ?auto_354610 ) ) ( not ( = ?auto_354615 ?auto_354611 ) ) ( not ( = ?auto_354615 ?auto_354612 ) ) ( not ( = ?auto_354615 ?auto_354613 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_354606 ?auto_354607 ?auto_354604 ?auto_354605 ?auto_354598 ?auto_354599 ?auto_354601 ?auto_354600 ?auto_354602 ?auto_354603 )
      ( GET-5IMAGE-VERIFY ?auto_354598 ?auto_354599 ?auto_354601 ?auto_354600 ?auto_354602 ?auto_354603 ?auto_354604 ?auto_354605 ?auto_354606 ?auto_354607 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_355790 - DIRECTION
      ?auto_355791 - MODE
      ?auto_355793 - DIRECTION
      ?auto_355792 - MODE
      ?auto_355794 - DIRECTION
      ?auto_355795 - MODE
      ?auto_355796 - DIRECTION
      ?auto_355797 - MODE
      ?auto_355798 - DIRECTION
      ?auto_355799 - MODE
    )
    :vars
    (
      ?auto_355807 - INSTRUMENT
      ?auto_355800 - SATELLITE
      ?auto_355801 - DIRECTION
      ?auto_355806 - INSTRUMENT
      ?auto_355803 - INSTRUMENT
      ?auto_355804 - INSTRUMENT
      ?auto_355805 - INSTRUMENT
      ?auto_355802 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_355793 ?auto_355790 ) ) ( not ( = ?auto_355794 ?auto_355790 ) ) ( not ( = ?auto_355794 ?auto_355793 ) ) ( not ( = ?auto_355796 ?auto_355790 ) ) ( not ( = ?auto_355796 ?auto_355793 ) ) ( not ( = ?auto_355796 ?auto_355794 ) ) ( not ( = ?auto_355798 ?auto_355790 ) ) ( not ( = ?auto_355798 ?auto_355793 ) ) ( not ( = ?auto_355798 ?auto_355794 ) ) ( not ( = ?auto_355798 ?auto_355796 ) ) ( ON_BOARD ?auto_355807 ?auto_355800 ) ( SUPPORTS ?auto_355807 ?auto_355799 ) ( not ( = ?auto_355798 ?auto_355801 ) ) ( CALIBRATION_TARGET ?auto_355807 ?auto_355801 ) ( not ( = ?auto_355801 ?auto_355790 ) ) ( ON_BOARD ?auto_355806 ?auto_355800 ) ( not ( = ?auto_355807 ?auto_355806 ) ) ( SUPPORTS ?auto_355806 ?auto_355791 ) ( CALIBRATION_TARGET ?auto_355806 ?auto_355801 ) ( not ( = ?auto_355801 ?auto_355796 ) ) ( ON_BOARD ?auto_355803 ?auto_355800 ) ( not ( = ?auto_355806 ?auto_355803 ) ) ( SUPPORTS ?auto_355803 ?auto_355797 ) ( CALIBRATION_TARGET ?auto_355803 ?auto_355801 ) ( not ( = ?auto_355801 ?auto_355794 ) ) ( ON_BOARD ?auto_355804 ?auto_355800 ) ( not ( = ?auto_355803 ?auto_355804 ) ) ( SUPPORTS ?auto_355804 ?auto_355795 ) ( CALIBRATION_TARGET ?auto_355804 ?auto_355801 ) ( not ( = ?auto_355801 ?auto_355793 ) ) ( ON_BOARD ?auto_355805 ?auto_355800 ) ( not ( = ?auto_355804 ?auto_355805 ) ) ( SUPPORTS ?auto_355805 ?auto_355792 ) ( CALIBRATION_TARGET ?auto_355805 ?auto_355801 ) ( POWER_AVAIL ?auto_355800 ) ( POINTING ?auto_355800 ?auto_355802 ) ( not ( = ?auto_355801 ?auto_355802 ) ) ( not ( = ?auto_355793 ?auto_355802 ) ) ( not ( = ?auto_355792 ?auto_355795 ) ) ( not ( = ?auto_355794 ?auto_355802 ) ) ( not ( = ?auto_355792 ?auto_355797 ) ) ( not ( = ?auto_355795 ?auto_355797 ) ) ( not ( = ?auto_355796 ?auto_355802 ) ) ( not ( = ?auto_355803 ?auto_355805 ) ) ( not ( = ?auto_355792 ?auto_355791 ) ) ( not ( = ?auto_355795 ?auto_355791 ) ) ( not ( = ?auto_355797 ?auto_355791 ) ) ( not ( = ?auto_355790 ?auto_355802 ) ) ( not ( = ?auto_355806 ?auto_355804 ) ) ( not ( = ?auto_355806 ?auto_355805 ) ) ( not ( = ?auto_355792 ?auto_355799 ) ) ( not ( = ?auto_355795 ?auto_355799 ) ) ( not ( = ?auto_355797 ?auto_355799 ) ) ( not ( = ?auto_355791 ?auto_355799 ) ) ( not ( = ?auto_355798 ?auto_355802 ) ) ( not ( = ?auto_355807 ?auto_355803 ) ) ( not ( = ?auto_355807 ?auto_355804 ) ) ( not ( = ?auto_355807 ?auto_355805 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_355793 ?auto_355792 ?auto_355794 ?auto_355795 ?auto_355796 ?auto_355797 ?auto_355798 ?auto_355799 ?auto_355790 ?auto_355791 )
      ( GET-5IMAGE-VERIFY ?auto_355790 ?auto_355791 ?auto_355793 ?auto_355792 ?auto_355794 ?auto_355795 ?auto_355796 ?auto_355797 ?auto_355798 ?auto_355799 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_355868 - DIRECTION
      ?auto_355869 - MODE
      ?auto_355871 - DIRECTION
      ?auto_355870 - MODE
      ?auto_355872 - DIRECTION
      ?auto_355873 - MODE
      ?auto_355874 - DIRECTION
      ?auto_355875 - MODE
      ?auto_355876 - DIRECTION
      ?auto_355877 - MODE
    )
    :vars
    (
      ?auto_355885 - INSTRUMENT
      ?auto_355878 - SATELLITE
      ?auto_355879 - DIRECTION
      ?auto_355884 - INSTRUMENT
      ?auto_355881 - INSTRUMENT
      ?auto_355882 - INSTRUMENT
      ?auto_355883 - INSTRUMENT
      ?auto_355880 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_355871 ?auto_355868 ) ) ( not ( = ?auto_355872 ?auto_355868 ) ) ( not ( = ?auto_355872 ?auto_355871 ) ) ( not ( = ?auto_355874 ?auto_355868 ) ) ( not ( = ?auto_355874 ?auto_355871 ) ) ( not ( = ?auto_355874 ?auto_355872 ) ) ( not ( = ?auto_355876 ?auto_355868 ) ) ( not ( = ?auto_355876 ?auto_355871 ) ) ( not ( = ?auto_355876 ?auto_355872 ) ) ( not ( = ?auto_355876 ?auto_355874 ) ) ( ON_BOARD ?auto_355885 ?auto_355878 ) ( SUPPORTS ?auto_355885 ?auto_355875 ) ( not ( = ?auto_355874 ?auto_355879 ) ) ( CALIBRATION_TARGET ?auto_355885 ?auto_355879 ) ( not ( = ?auto_355879 ?auto_355868 ) ) ( ON_BOARD ?auto_355884 ?auto_355878 ) ( not ( = ?auto_355885 ?auto_355884 ) ) ( SUPPORTS ?auto_355884 ?auto_355869 ) ( CALIBRATION_TARGET ?auto_355884 ?auto_355879 ) ( not ( = ?auto_355879 ?auto_355876 ) ) ( ON_BOARD ?auto_355881 ?auto_355878 ) ( not ( = ?auto_355884 ?auto_355881 ) ) ( SUPPORTS ?auto_355881 ?auto_355877 ) ( CALIBRATION_TARGET ?auto_355881 ?auto_355879 ) ( not ( = ?auto_355879 ?auto_355872 ) ) ( ON_BOARD ?auto_355882 ?auto_355878 ) ( not ( = ?auto_355881 ?auto_355882 ) ) ( SUPPORTS ?auto_355882 ?auto_355873 ) ( CALIBRATION_TARGET ?auto_355882 ?auto_355879 ) ( not ( = ?auto_355879 ?auto_355871 ) ) ( ON_BOARD ?auto_355883 ?auto_355878 ) ( not ( = ?auto_355882 ?auto_355883 ) ) ( SUPPORTS ?auto_355883 ?auto_355870 ) ( CALIBRATION_TARGET ?auto_355883 ?auto_355879 ) ( POWER_AVAIL ?auto_355878 ) ( POINTING ?auto_355878 ?auto_355880 ) ( not ( = ?auto_355879 ?auto_355880 ) ) ( not ( = ?auto_355871 ?auto_355880 ) ) ( not ( = ?auto_355870 ?auto_355873 ) ) ( not ( = ?auto_355872 ?auto_355880 ) ) ( not ( = ?auto_355870 ?auto_355877 ) ) ( not ( = ?auto_355873 ?auto_355877 ) ) ( not ( = ?auto_355876 ?auto_355880 ) ) ( not ( = ?auto_355881 ?auto_355883 ) ) ( not ( = ?auto_355870 ?auto_355869 ) ) ( not ( = ?auto_355873 ?auto_355869 ) ) ( not ( = ?auto_355877 ?auto_355869 ) ) ( not ( = ?auto_355868 ?auto_355880 ) ) ( not ( = ?auto_355884 ?auto_355882 ) ) ( not ( = ?auto_355884 ?auto_355883 ) ) ( not ( = ?auto_355870 ?auto_355875 ) ) ( not ( = ?auto_355873 ?auto_355875 ) ) ( not ( = ?auto_355877 ?auto_355875 ) ) ( not ( = ?auto_355869 ?auto_355875 ) ) ( not ( = ?auto_355874 ?auto_355880 ) ) ( not ( = ?auto_355885 ?auto_355881 ) ) ( not ( = ?auto_355885 ?auto_355882 ) ) ( not ( = ?auto_355885 ?auto_355883 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_355871 ?auto_355870 ?auto_355872 ?auto_355873 ?auto_355876 ?auto_355877 ?auto_355874 ?auto_355875 ?auto_355868 ?auto_355869 )
      ( GET-5IMAGE-VERIFY ?auto_355868 ?auto_355869 ?auto_355871 ?auto_355870 ?auto_355872 ?auto_355873 ?auto_355874 ?auto_355875 ?auto_355876 ?auto_355877 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_355946 - DIRECTION
      ?auto_355947 - MODE
      ?auto_355949 - DIRECTION
      ?auto_355948 - MODE
      ?auto_355950 - DIRECTION
      ?auto_355951 - MODE
      ?auto_355952 - DIRECTION
      ?auto_355953 - MODE
      ?auto_355954 - DIRECTION
      ?auto_355955 - MODE
    )
    :vars
    (
      ?auto_355963 - INSTRUMENT
      ?auto_355956 - SATELLITE
      ?auto_355957 - DIRECTION
      ?auto_355962 - INSTRUMENT
      ?auto_355959 - INSTRUMENT
      ?auto_355960 - INSTRUMENT
      ?auto_355961 - INSTRUMENT
      ?auto_355958 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_355949 ?auto_355946 ) ) ( not ( = ?auto_355950 ?auto_355946 ) ) ( not ( = ?auto_355950 ?auto_355949 ) ) ( not ( = ?auto_355952 ?auto_355946 ) ) ( not ( = ?auto_355952 ?auto_355949 ) ) ( not ( = ?auto_355952 ?auto_355950 ) ) ( not ( = ?auto_355954 ?auto_355946 ) ) ( not ( = ?auto_355954 ?auto_355949 ) ) ( not ( = ?auto_355954 ?auto_355950 ) ) ( not ( = ?auto_355954 ?auto_355952 ) ) ( ON_BOARD ?auto_355963 ?auto_355956 ) ( SUPPORTS ?auto_355963 ?auto_355955 ) ( not ( = ?auto_355954 ?auto_355957 ) ) ( CALIBRATION_TARGET ?auto_355963 ?auto_355957 ) ( not ( = ?auto_355957 ?auto_355946 ) ) ( ON_BOARD ?auto_355962 ?auto_355956 ) ( not ( = ?auto_355963 ?auto_355962 ) ) ( SUPPORTS ?auto_355962 ?auto_355947 ) ( CALIBRATION_TARGET ?auto_355962 ?auto_355957 ) ( not ( = ?auto_355957 ?auto_355950 ) ) ( ON_BOARD ?auto_355959 ?auto_355956 ) ( not ( = ?auto_355962 ?auto_355959 ) ) ( SUPPORTS ?auto_355959 ?auto_355951 ) ( CALIBRATION_TARGET ?auto_355959 ?auto_355957 ) ( not ( = ?auto_355957 ?auto_355952 ) ) ( ON_BOARD ?auto_355960 ?auto_355956 ) ( not ( = ?auto_355959 ?auto_355960 ) ) ( SUPPORTS ?auto_355960 ?auto_355953 ) ( CALIBRATION_TARGET ?auto_355960 ?auto_355957 ) ( not ( = ?auto_355957 ?auto_355949 ) ) ( ON_BOARD ?auto_355961 ?auto_355956 ) ( not ( = ?auto_355960 ?auto_355961 ) ) ( SUPPORTS ?auto_355961 ?auto_355948 ) ( CALIBRATION_TARGET ?auto_355961 ?auto_355957 ) ( POWER_AVAIL ?auto_355956 ) ( POINTING ?auto_355956 ?auto_355958 ) ( not ( = ?auto_355957 ?auto_355958 ) ) ( not ( = ?auto_355949 ?auto_355958 ) ) ( not ( = ?auto_355948 ?auto_355953 ) ) ( not ( = ?auto_355952 ?auto_355958 ) ) ( not ( = ?auto_355948 ?auto_355951 ) ) ( not ( = ?auto_355953 ?auto_355951 ) ) ( not ( = ?auto_355950 ?auto_355958 ) ) ( not ( = ?auto_355959 ?auto_355961 ) ) ( not ( = ?auto_355948 ?auto_355947 ) ) ( not ( = ?auto_355953 ?auto_355947 ) ) ( not ( = ?auto_355951 ?auto_355947 ) ) ( not ( = ?auto_355946 ?auto_355958 ) ) ( not ( = ?auto_355962 ?auto_355960 ) ) ( not ( = ?auto_355962 ?auto_355961 ) ) ( not ( = ?auto_355948 ?auto_355955 ) ) ( not ( = ?auto_355953 ?auto_355955 ) ) ( not ( = ?auto_355951 ?auto_355955 ) ) ( not ( = ?auto_355947 ?auto_355955 ) ) ( not ( = ?auto_355954 ?auto_355958 ) ) ( not ( = ?auto_355963 ?auto_355959 ) ) ( not ( = ?auto_355963 ?auto_355960 ) ) ( not ( = ?auto_355963 ?auto_355961 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_355949 ?auto_355948 ?auto_355952 ?auto_355953 ?auto_355950 ?auto_355951 ?auto_355954 ?auto_355955 ?auto_355946 ?auto_355947 )
      ( GET-5IMAGE-VERIFY ?auto_355946 ?auto_355947 ?auto_355949 ?auto_355948 ?auto_355950 ?auto_355951 ?auto_355952 ?auto_355953 ?auto_355954 ?auto_355955 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_356024 - DIRECTION
      ?auto_356025 - MODE
      ?auto_356027 - DIRECTION
      ?auto_356026 - MODE
      ?auto_356028 - DIRECTION
      ?auto_356029 - MODE
      ?auto_356030 - DIRECTION
      ?auto_356031 - MODE
      ?auto_356032 - DIRECTION
      ?auto_356033 - MODE
    )
    :vars
    (
      ?auto_356041 - INSTRUMENT
      ?auto_356034 - SATELLITE
      ?auto_356035 - DIRECTION
      ?auto_356040 - INSTRUMENT
      ?auto_356037 - INSTRUMENT
      ?auto_356038 - INSTRUMENT
      ?auto_356039 - INSTRUMENT
      ?auto_356036 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_356027 ?auto_356024 ) ) ( not ( = ?auto_356028 ?auto_356024 ) ) ( not ( = ?auto_356028 ?auto_356027 ) ) ( not ( = ?auto_356030 ?auto_356024 ) ) ( not ( = ?auto_356030 ?auto_356027 ) ) ( not ( = ?auto_356030 ?auto_356028 ) ) ( not ( = ?auto_356032 ?auto_356024 ) ) ( not ( = ?auto_356032 ?auto_356027 ) ) ( not ( = ?auto_356032 ?auto_356028 ) ) ( not ( = ?auto_356032 ?auto_356030 ) ) ( ON_BOARD ?auto_356041 ?auto_356034 ) ( SUPPORTS ?auto_356041 ?auto_356031 ) ( not ( = ?auto_356030 ?auto_356035 ) ) ( CALIBRATION_TARGET ?auto_356041 ?auto_356035 ) ( not ( = ?auto_356035 ?auto_356024 ) ) ( ON_BOARD ?auto_356040 ?auto_356034 ) ( not ( = ?auto_356041 ?auto_356040 ) ) ( SUPPORTS ?auto_356040 ?auto_356025 ) ( CALIBRATION_TARGET ?auto_356040 ?auto_356035 ) ( not ( = ?auto_356035 ?auto_356028 ) ) ( ON_BOARD ?auto_356037 ?auto_356034 ) ( not ( = ?auto_356040 ?auto_356037 ) ) ( SUPPORTS ?auto_356037 ?auto_356029 ) ( CALIBRATION_TARGET ?auto_356037 ?auto_356035 ) ( not ( = ?auto_356035 ?auto_356032 ) ) ( ON_BOARD ?auto_356038 ?auto_356034 ) ( not ( = ?auto_356037 ?auto_356038 ) ) ( SUPPORTS ?auto_356038 ?auto_356033 ) ( CALIBRATION_TARGET ?auto_356038 ?auto_356035 ) ( not ( = ?auto_356035 ?auto_356027 ) ) ( ON_BOARD ?auto_356039 ?auto_356034 ) ( not ( = ?auto_356038 ?auto_356039 ) ) ( SUPPORTS ?auto_356039 ?auto_356026 ) ( CALIBRATION_TARGET ?auto_356039 ?auto_356035 ) ( POWER_AVAIL ?auto_356034 ) ( POINTING ?auto_356034 ?auto_356036 ) ( not ( = ?auto_356035 ?auto_356036 ) ) ( not ( = ?auto_356027 ?auto_356036 ) ) ( not ( = ?auto_356026 ?auto_356033 ) ) ( not ( = ?auto_356032 ?auto_356036 ) ) ( not ( = ?auto_356026 ?auto_356029 ) ) ( not ( = ?auto_356033 ?auto_356029 ) ) ( not ( = ?auto_356028 ?auto_356036 ) ) ( not ( = ?auto_356037 ?auto_356039 ) ) ( not ( = ?auto_356026 ?auto_356025 ) ) ( not ( = ?auto_356033 ?auto_356025 ) ) ( not ( = ?auto_356029 ?auto_356025 ) ) ( not ( = ?auto_356024 ?auto_356036 ) ) ( not ( = ?auto_356040 ?auto_356038 ) ) ( not ( = ?auto_356040 ?auto_356039 ) ) ( not ( = ?auto_356026 ?auto_356031 ) ) ( not ( = ?auto_356033 ?auto_356031 ) ) ( not ( = ?auto_356029 ?auto_356031 ) ) ( not ( = ?auto_356025 ?auto_356031 ) ) ( not ( = ?auto_356030 ?auto_356036 ) ) ( not ( = ?auto_356041 ?auto_356037 ) ) ( not ( = ?auto_356041 ?auto_356038 ) ) ( not ( = ?auto_356041 ?auto_356039 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_356027 ?auto_356026 ?auto_356032 ?auto_356033 ?auto_356028 ?auto_356029 ?auto_356030 ?auto_356031 ?auto_356024 ?auto_356025 )
      ( GET-5IMAGE-VERIFY ?auto_356024 ?auto_356025 ?auto_356027 ?auto_356026 ?auto_356028 ?auto_356029 ?auto_356030 ?auto_356031 ?auto_356032 ?auto_356033 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_356438 - DIRECTION
      ?auto_356439 - MODE
      ?auto_356441 - DIRECTION
      ?auto_356440 - MODE
      ?auto_356442 - DIRECTION
      ?auto_356443 - MODE
      ?auto_356444 - DIRECTION
      ?auto_356445 - MODE
      ?auto_356446 - DIRECTION
      ?auto_356447 - MODE
    )
    :vars
    (
      ?auto_356455 - INSTRUMENT
      ?auto_356448 - SATELLITE
      ?auto_356449 - DIRECTION
      ?auto_356454 - INSTRUMENT
      ?auto_356451 - INSTRUMENT
      ?auto_356452 - INSTRUMENT
      ?auto_356453 - INSTRUMENT
      ?auto_356450 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_356441 ?auto_356438 ) ) ( not ( = ?auto_356442 ?auto_356438 ) ) ( not ( = ?auto_356442 ?auto_356441 ) ) ( not ( = ?auto_356444 ?auto_356438 ) ) ( not ( = ?auto_356444 ?auto_356441 ) ) ( not ( = ?auto_356444 ?auto_356442 ) ) ( not ( = ?auto_356446 ?auto_356438 ) ) ( not ( = ?auto_356446 ?auto_356441 ) ) ( not ( = ?auto_356446 ?auto_356442 ) ) ( not ( = ?auto_356446 ?auto_356444 ) ) ( ON_BOARD ?auto_356455 ?auto_356448 ) ( SUPPORTS ?auto_356455 ?auto_356443 ) ( not ( = ?auto_356442 ?auto_356449 ) ) ( CALIBRATION_TARGET ?auto_356455 ?auto_356449 ) ( not ( = ?auto_356449 ?auto_356438 ) ) ( ON_BOARD ?auto_356454 ?auto_356448 ) ( not ( = ?auto_356455 ?auto_356454 ) ) ( SUPPORTS ?auto_356454 ?auto_356439 ) ( CALIBRATION_TARGET ?auto_356454 ?auto_356449 ) ( not ( = ?auto_356449 ?auto_356446 ) ) ( ON_BOARD ?auto_356451 ?auto_356448 ) ( not ( = ?auto_356454 ?auto_356451 ) ) ( SUPPORTS ?auto_356451 ?auto_356447 ) ( CALIBRATION_TARGET ?auto_356451 ?auto_356449 ) ( not ( = ?auto_356449 ?auto_356444 ) ) ( ON_BOARD ?auto_356452 ?auto_356448 ) ( not ( = ?auto_356451 ?auto_356452 ) ) ( SUPPORTS ?auto_356452 ?auto_356445 ) ( CALIBRATION_TARGET ?auto_356452 ?auto_356449 ) ( not ( = ?auto_356449 ?auto_356441 ) ) ( ON_BOARD ?auto_356453 ?auto_356448 ) ( not ( = ?auto_356452 ?auto_356453 ) ) ( SUPPORTS ?auto_356453 ?auto_356440 ) ( CALIBRATION_TARGET ?auto_356453 ?auto_356449 ) ( POWER_AVAIL ?auto_356448 ) ( POINTING ?auto_356448 ?auto_356450 ) ( not ( = ?auto_356449 ?auto_356450 ) ) ( not ( = ?auto_356441 ?auto_356450 ) ) ( not ( = ?auto_356440 ?auto_356445 ) ) ( not ( = ?auto_356444 ?auto_356450 ) ) ( not ( = ?auto_356440 ?auto_356447 ) ) ( not ( = ?auto_356445 ?auto_356447 ) ) ( not ( = ?auto_356446 ?auto_356450 ) ) ( not ( = ?auto_356451 ?auto_356453 ) ) ( not ( = ?auto_356440 ?auto_356439 ) ) ( not ( = ?auto_356445 ?auto_356439 ) ) ( not ( = ?auto_356447 ?auto_356439 ) ) ( not ( = ?auto_356438 ?auto_356450 ) ) ( not ( = ?auto_356454 ?auto_356452 ) ) ( not ( = ?auto_356454 ?auto_356453 ) ) ( not ( = ?auto_356440 ?auto_356443 ) ) ( not ( = ?auto_356445 ?auto_356443 ) ) ( not ( = ?auto_356447 ?auto_356443 ) ) ( not ( = ?auto_356439 ?auto_356443 ) ) ( not ( = ?auto_356442 ?auto_356450 ) ) ( not ( = ?auto_356455 ?auto_356451 ) ) ( not ( = ?auto_356455 ?auto_356452 ) ) ( not ( = ?auto_356455 ?auto_356453 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_356441 ?auto_356440 ?auto_356444 ?auto_356445 ?auto_356446 ?auto_356447 ?auto_356442 ?auto_356443 ?auto_356438 ?auto_356439 )
      ( GET-5IMAGE-VERIFY ?auto_356438 ?auto_356439 ?auto_356441 ?auto_356440 ?auto_356442 ?auto_356443 ?auto_356444 ?auto_356445 ?auto_356446 ?auto_356447 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_356516 - DIRECTION
      ?auto_356517 - MODE
      ?auto_356519 - DIRECTION
      ?auto_356518 - MODE
      ?auto_356520 - DIRECTION
      ?auto_356521 - MODE
      ?auto_356522 - DIRECTION
      ?auto_356523 - MODE
      ?auto_356524 - DIRECTION
      ?auto_356525 - MODE
    )
    :vars
    (
      ?auto_356533 - INSTRUMENT
      ?auto_356526 - SATELLITE
      ?auto_356527 - DIRECTION
      ?auto_356532 - INSTRUMENT
      ?auto_356529 - INSTRUMENT
      ?auto_356530 - INSTRUMENT
      ?auto_356531 - INSTRUMENT
      ?auto_356528 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_356519 ?auto_356516 ) ) ( not ( = ?auto_356520 ?auto_356516 ) ) ( not ( = ?auto_356520 ?auto_356519 ) ) ( not ( = ?auto_356522 ?auto_356516 ) ) ( not ( = ?auto_356522 ?auto_356519 ) ) ( not ( = ?auto_356522 ?auto_356520 ) ) ( not ( = ?auto_356524 ?auto_356516 ) ) ( not ( = ?auto_356524 ?auto_356519 ) ) ( not ( = ?auto_356524 ?auto_356520 ) ) ( not ( = ?auto_356524 ?auto_356522 ) ) ( ON_BOARD ?auto_356533 ?auto_356526 ) ( SUPPORTS ?auto_356533 ?auto_356521 ) ( not ( = ?auto_356520 ?auto_356527 ) ) ( CALIBRATION_TARGET ?auto_356533 ?auto_356527 ) ( not ( = ?auto_356527 ?auto_356516 ) ) ( ON_BOARD ?auto_356532 ?auto_356526 ) ( not ( = ?auto_356533 ?auto_356532 ) ) ( SUPPORTS ?auto_356532 ?auto_356517 ) ( CALIBRATION_TARGET ?auto_356532 ?auto_356527 ) ( not ( = ?auto_356527 ?auto_356522 ) ) ( ON_BOARD ?auto_356529 ?auto_356526 ) ( not ( = ?auto_356532 ?auto_356529 ) ) ( SUPPORTS ?auto_356529 ?auto_356523 ) ( CALIBRATION_TARGET ?auto_356529 ?auto_356527 ) ( not ( = ?auto_356527 ?auto_356524 ) ) ( ON_BOARD ?auto_356530 ?auto_356526 ) ( not ( = ?auto_356529 ?auto_356530 ) ) ( SUPPORTS ?auto_356530 ?auto_356525 ) ( CALIBRATION_TARGET ?auto_356530 ?auto_356527 ) ( not ( = ?auto_356527 ?auto_356519 ) ) ( ON_BOARD ?auto_356531 ?auto_356526 ) ( not ( = ?auto_356530 ?auto_356531 ) ) ( SUPPORTS ?auto_356531 ?auto_356518 ) ( CALIBRATION_TARGET ?auto_356531 ?auto_356527 ) ( POWER_AVAIL ?auto_356526 ) ( POINTING ?auto_356526 ?auto_356528 ) ( not ( = ?auto_356527 ?auto_356528 ) ) ( not ( = ?auto_356519 ?auto_356528 ) ) ( not ( = ?auto_356518 ?auto_356525 ) ) ( not ( = ?auto_356524 ?auto_356528 ) ) ( not ( = ?auto_356518 ?auto_356523 ) ) ( not ( = ?auto_356525 ?auto_356523 ) ) ( not ( = ?auto_356522 ?auto_356528 ) ) ( not ( = ?auto_356529 ?auto_356531 ) ) ( not ( = ?auto_356518 ?auto_356517 ) ) ( not ( = ?auto_356525 ?auto_356517 ) ) ( not ( = ?auto_356523 ?auto_356517 ) ) ( not ( = ?auto_356516 ?auto_356528 ) ) ( not ( = ?auto_356532 ?auto_356530 ) ) ( not ( = ?auto_356532 ?auto_356531 ) ) ( not ( = ?auto_356518 ?auto_356521 ) ) ( not ( = ?auto_356525 ?auto_356521 ) ) ( not ( = ?auto_356523 ?auto_356521 ) ) ( not ( = ?auto_356517 ?auto_356521 ) ) ( not ( = ?auto_356520 ?auto_356528 ) ) ( not ( = ?auto_356533 ?auto_356529 ) ) ( not ( = ?auto_356533 ?auto_356530 ) ) ( not ( = ?auto_356533 ?auto_356531 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_356519 ?auto_356518 ?auto_356524 ?auto_356525 ?auto_356522 ?auto_356523 ?auto_356520 ?auto_356521 ?auto_356516 ?auto_356517 )
      ( GET-5IMAGE-VERIFY ?auto_356516 ?auto_356517 ?auto_356519 ?auto_356518 ?auto_356520 ?auto_356521 ?auto_356522 ?auto_356523 ?auto_356524 ?auto_356525 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_356846 - DIRECTION
      ?auto_356847 - MODE
      ?auto_356849 - DIRECTION
      ?auto_356848 - MODE
      ?auto_356850 - DIRECTION
      ?auto_356851 - MODE
      ?auto_356852 - DIRECTION
      ?auto_356853 - MODE
      ?auto_356854 - DIRECTION
      ?auto_356855 - MODE
    )
    :vars
    (
      ?auto_356863 - INSTRUMENT
      ?auto_356856 - SATELLITE
      ?auto_356857 - DIRECTION
      ?auto_356862 - INSTRUMENT
      ?auto_356859 - INSTRUMENT
      ?auto_356860 - INSTRUMENT
      ?auto_356861 - INSTRUMENT
      ?auto_356858 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_356849 ?auto_356846 ) ) ( not ( = ?auto_356850 ?auto_356846 ) ) ( not ( = ?auto_356850 ?auto_356849 ) ) ( not ( = ?auto_356852 ?auto_356846 ) ) ( not ( = ?auto_356852 ?auto_356849 ) ) ( not ( = ?auto_356852 ?auto_356850 ) ) ( not ( = ?auto_356854 ?auto_356846 ) ) ( not ( = ?auto_356854 ?auto_356849 ) ) ( not ( = ?auto_356854 ?auto_356850 ) ) ( not ( = ?auto_356854 ?auto_356852 ) ) ( ON_BOARD ?auto_356863 ?auto_356856 ) ( SUPPORTS ?auto_356863 ?auto_356855 ) ( not ( = ?auto_356854 ?auto_356857 ) ) ( CALIBRATION_TARGET ?auto_356863 ?auto_356857 ) ( not ( = ?auto_356857 ?auto_356846 ) ) ( ON_BOARD ?auto_356862 ?auto_356856 ) ( not ( = ?auto_356863 ?auto_356862 ) ) ( SUPPORTS ?auto_356862 ?auto_356847 ) ( CALIBRATION_TARGET ?auto_356862 ?auto_356857 ) ( not ( = ?auto_356857 ?auto_356852 ) ) ( ON_BOARD ?auto_356859 ?auto_356856 ) ( not ( = ?auto_356862 ?auto_356859 ) ) ( SUPPORTS ?auto_356859 ?auto_356853 ) ( CALIBRATION_TARGET ?auto_356859 ?auto_356857 ) ( not ( = ?auto_356857 ?auto_356849 ) ) ( ON_BOARD ?auto_356860 ?auto_356856 ) ( not ( = ?auto_356859 ?auto_356860 ) ) ( SUPPORTS ?auto_356860 ?auto_356848 ) ( CALIBRATION_TARGET ?auto_356860 ?auto_356857 ) ( not ( = ?auto_356857 ?auto_356850 ) ) ( ON_BOARD ?auto_356861 ?auto_356856 ) ( not ( = ?auto_356860 ?auto_356861 ) ) ( SUPPORTS ?auto_356861 ?auto_356851 ) ( CALIBRATION_TARGET ?auto_356861 ?auto_356857 ) ( POWER_AVAIL ?auto_356856 ) ( POINTING ?auto_356856 ?auto_356858 ) ( not ( = ?auto_356857 ?auto_356858 ) ) ( not ( = ?auto_356850 ?auto_356858 ) ) ( not ( = ?auto_356851 ?auto_356848 ) ) ( not ( = ?auto_356849 ?auto_356858 ) ) ( not ( = ?auto_356851 ?auto_356853 ) ) ( not ( = ?auto_356848 ?auto_356853 ) ) ( not ( = ?auto_356852 ?auto_356858 ) ) ( not ( = ?auto_356859 ?auto_356861 ) ) ( not ( = ?auto_356851 ?auto_356847 ) ) ( not ( = ?auto_356848 ?auto_356847 ) ) ( not ( = ?auto_356853 ?auto_356847 ) ) ( not ( = ?auto_356846 ?auto_356858 ) ) ( not ( = ?auto_356862 ?auto_356860 ) ) ( not ( = ?auto_356862 ?auto_356861 ) ) ( not ( = ?auto_356851 ?auto_356855 ) ) ( not ( = ?auto_356848 ?auto_356855 ) ) ( not ( = ?auto_356853 ?auto_356855 ) ) ( not ( = ?auto_356847 ?auto_356855 ) ) ( not ( = ?auto_356854 ?auto_356858 ) ) ( not ( = ?auto_356863 ?auto_356859 ) ) ( not ( = ?auto_356863 ?auto_356860 ) ) ( not ( = ?auto_356863 ?auto_356861 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_356850 ?auto_356851 ?auto_356849 ?auto_356848 ?auto_356852 ?auto_356853 ?auto_356854 ?auto_356855 ?auto_356846 ?auto_356847 )
      ( GET-5IMAGE-VERIFY ?auto_356846 ?auto_356847 ?auto_356849 ?auto_356848 ?auto_356850 ?auto_356851 ?auto_356852 ?auto_356853 ?auto_356854 ?auto_356855 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_356924 - DIRECTION
      ?auto_356925 - MODE
      ?auto_356927 - DIRECTION
      ?auto_356926 - MODE
      ?auto_356928 - DIRECTION
      ?auto_356929 - MODE
      ?auto_356930 - DIRECTION
      ?auto_356931 - MODE
      ?auto_356932 - DIRECTION
      ?auto_356933 - MODE
    )
    :vars
    (
      ?auto_356941 - INSTRUMENT
      ?auto_356934 - SATELLITE
      ?auto_356935 - DIRECTION
      ?auto_356940 - INSTRUMENT
      ?auto_356937 - INSTRUMENT
      ?auto_356938 - INSTRUMENT
      ?auto_356939 - INSTRUMENT
      ?auto_356936 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_356927 ?auto_356924 ) ) ( not ( = ?auto_356928 ?auto_356924 ) ) ( not ( = ?auto_356928 ?auto_356927 ) ) ( not ( = ?auto_356930 ?auto_356924 ) ) ( not ( = ?auto_356930 ?auto_356927 ) ) ( not ( = ?auto_356930 ?auto_356928 ) ) ( not ( = ?auto_356932 ?auto_356924 ) ) ( not ( = ?auto_356932 ?auto_356927 ) ) ( not ( = ?auto_356932 ?auto_356928 ) ) ( not ( = ?auto_356932 ?auto_356930 ) ) ( ON_BOARD ?auto_356941 ?auto_356934 ) ( SUPPORTS ?auto_356941 ?auto_356931 ) ( not ( = ?auto_356930 ?auto_356935 ) ) ( CALIBRATION_TARGET ?auto_356941 ?auto_356935 ) ( not ( = ?auto_356935 ?auto_356924 ) ) ( ON_BOARD ?auto_356940 ?auto_356934 ) ( not ( = ?auto_356941 ?auto_356940 ) ) ( SUPPORTS ?auto_356940 ?auto_356925 ) ( CALIBRATION_TARGET ?auto_356940 ?auto_356935 ) ( not ( = ?auto_356935 ?auto_356932 ) ) ( ON_BOARD ?auto_356937 ?auto_356934 ) ( not ( = ?auto_356940 ?auto_356937 ) ) ( SUPPORTS ?auto_356937 ?auto_356933 ) ( CALIBRATION_TARGET ?auto_356937 ?auto_356935 ) ( not ( = ?auto_356935 ?auto_356927 ) ) ( ON_BOARD ?auto_356938 ?auto_356934 ) ( not ( = ?auto_356937 ?auto_356938 ) ) ( SUPPORTS ?auto_356938 ?auto_356926 ) ( CALIBRATION_TARGET ?auto_356938 ?auto_356935 ) ( not ( = ?auto_356935 ?auto_356928 ) ) ( ON_BOARD ?auto_356939 ?auto_356934 ) ( not ( = ?auto_356938 ?auto_356939 ) ) ( SUPPORTS ?auto_356939 ?auto_356929 ) ( CALIBRATION_TARGET ?auto_356939 ?auto_356935 ) ( POWER_AVAIL ?auto_356934 ) ( POINTING ?auto_356934 ?auto_356936 ) ( not ( = ?auto_356935 ?auto_356936 ) ) ( not ( = ?auto_356928 ?auto_356936 ) ) ( not ( = ?auto_356929 ?auto_356926 ) ) ( not ( = ?auto_356927 ?auto_356936 ) ) ( not ( = ?auto_356929 ?auto_356933 ) ) ( not ( = ?auto_356926 ?auto_356933 ) ) ( not ( = ?auto_356932 ?auto_356936 ) ) ( not ( = ?auto_356937 ?auto_356939 ) ) ( not ( = ?auto_356929 ?auto_356925 ) ) ( not ( = ?auto_356926 ?auto_356925 ) ) ( not ( = ?auto_356933 ?auto_356925 ) ) ( not ( = ?auto_356924 ?auto_356936 ) ) ( not ( = ?auto_356940 ?auto_356938 ) ) ( not ( = ?auto_356940 ?auto_356939 ) ) ( not ( = ?auto_356929 ?auto_356931 ) ) ( not ( = ?auto_356926 ?auto_356931 ) ) ( not ( = ?auto_356933 ?auto_356931 ) ) ( not ( = ?auto_356925 ?auto_356931 ) ) ( not ( = ?auto_356930 ?auto_356936 ) ) ( not ( = ?auto_356941 ?auto_356937 ) ) ( not ( = ?auto_356941 ?auto_356938 ) ) ( not ( = ?auto_356941 ?auto_356939 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_356928 ?auto_356929 ?auto_356927 ?auto_356926 ?auto_356932 ?auto_356933 ?auto_356930 ?auto_356931 ?auto_356924 ?auto_356925 )
      ( GET-5IMAGE-VERIFY ?auto_356924 ?auto_356925 ?auto_356927 ?auto_356926 ?auto_356928 ?auto_356929 ?auto_356930 ?auto_356931 ?auto_356932 ?auto_356933 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_357172 - DIRECTION
      ?auto_357173 - MODE
      ?auto_357175 - DIRECTION
      ?auto_357174 - MODE
      ?auto_357176 - DIRECTION
      ?auto_357177 - MODE
      ?auto_357178 - DIRECTION
      ?auto_357179 - MODE
      ?auto_357180 - DIRECTION
      ?auto_357181 - MODE
    )
    :vars
    (
      ?auto_357189 - INSTRUMENT
      ?auto_357182 - SATELLITE
      ?auto_357183 - DIRECTION
      ?auto_357188 - INSTRUMENT
      ?auto_357185 - INSTRUMENT
      ?auto_357186 - INSTRUMENT
      ?auto_357187 - INSTRUMENT
      ?auto_357184 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_357175 ?auto_357172 ) ) ( not ( = ?auto_357176 ?auto_357172 ) ) ( not ( = ?auto_357176 ?auto_357175 ) ) ( not ( = ?auto_357178 ?auto_357172 ) ) ( not ( = ?auto_357178 ?auto_357175 ) ) ( not ( = ?auto_357178 ?auto_357176 ) ) ( not ( = ?auto_357180 ?auto_357172 ) ) ( not ( = ?auto_357180 ?auto_357175 ) ) ( not ( = ?auto_357180 ?auto_357176 ) ) ( not ( = ?auto_357180 ?auto_357178 ) ) ( ON_BOARD ?auto_357189 ?auto_357182 ) ( SUPPORTS ?auto_357189 ?auto_357181 ) ( not ( = ?auto_357180 ?auto_357183 ) ) ( CALIBRATION_TARGET ?auto_357189 ?auto_357183 ) ( not ( = ?auto_357183 ?auto_357172 ) ) ( ON_BOARD ?auto_357188 ?auto_357182 ) ( not ( = ?auto_357189 ?auto_357188 ) ) ( SUPPORTS ?auto_357188 ?auto_357173 ) ( CALIBRATION_TARGET ?auto_357188 ?auto_357183 ) ( not ( = ?auto_357183 ?auto_357176 ) ) ( ON_BOARD ?auto_357185 ?auto_357182 ) ( not ( = ?auto_357188 ?auto_357185 ) ) ( SUPPORTS ?auto_357185 ?auto_357177 ) ( CALIBRATION_TARGET ?auto_357185 ?auto_357183 ) ( not ( = ?auto_357183 ?auto_357175 ) ) ( ON_BOARD ?auto_357186 ?auto_357182 ) ( not ( = ?auto_357185 ?auto_357186 ) ) ( SUPPORTS ?auto_357186 ?auto_357174 ) ( CALIBRATION_TARGET ?auto_357186 ?auto_357183 ) ( not ( = ?auto_357183 ?auto_357178 ) ) ( ON_BOARD ?auto_357187 ?auto_357182 ) ( not ( = ?auto_357186 ?auto_357187 ) ) ( SUPPORTS ?auto_357187 ?auto_357179 ) ( CALIBRATION_TARGET ?auto_357187 ?auto_357183 ) ( POWER_AVAIL ?auto_357182 ) ( POINTING ?auto_357182 ?auto_357184 ) ( not ( = ?auto_357183 ?auto_357184 ) ) ( not ( = ?auto_357178 ?auto_357184 ) ) ( not ( = ?auto_357179 ?auto_357174 ) ) ( not ( = ?auto_357175 ?auto_357184 ) ) ( not ( = ?auto_357179 ?auto_357177 ) ) ( not ( = ?auto_357174 ?auto_357177 ) ) ( not ( = ?auto_357176 ?auto_357184 ) ) ( not ( = ?auto_357185 ?auto_357187 ) ) ( not ( = ?auto_357179 ?auto_357173 ) ) ( not ( = ?auto_357174 ?auto_357173 ) ) ( not ( = ?auto_357177 ?auto_357173 ) ) ( not ( = ?auto_357172 ?auto_357184 ) ) ( not ( = ?auto_357188 ?auto_357186 ) ) ( not ( = ?auto_357188 ?auto_357187 ) ) ( not ( = ?auto_357179 ?auto_357181 ) ) ( not ( = ?auto_357174 ?auto_357181 ) ) ( not ( = ?auto_357177 ?auto_357181 ) ) ( not ( = ?auto_357173 ?auto_357181 ) ) ( not ( = ?auto_357180 ?auto_357184 ) ) ( not ( = ?auto_357189 ?auto_357185 ) ) ( not ( = ?auto_357189 ?auto_357186 ) ) ( not ( = ?auto_357189 ?auto_357187 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_357178 ?auto_357179 ?auto_357175 ?auto_357174 ?auto_357176 ?auto_357177 ?auto_357180 ?auto_357181 ?auto_357172 ?auto_357173 )
      ( GET-5IMAGE-VERIFY ?auto_357172 ?auto_357173 ?auto_357175 ?auto_357174 ?auto_357176 ?auto_357177 ?auto_357178 ?auto_357179 ?auto_357180 ?auto_357181 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_357250 - DIRECTION
      ?auto_357251 - MODE
      ?auto_357253 - DIRECTION
      ?auto_357252 - MODE
      ?auto_357254 - DIRECTION
      ?auto_357255 - MODE
      ?auto_357256 - DIRECTION
      ?auto_357257 - MODE
      ?auto_357258 - DIRECTION
      ?auto_357259 - MODE
    )
    :vars
    (
      ?auto_357267 - INSTRUMENT
      ?auto_357260 - SATELLITE
      ?auto_357261 - DIRECTION
      ?auto_357266 - INSTRUMENT
      ?auto_357263 - INSTRUMENT
      ?auto_357264 - INSTRUMENT
      ?auto_357265 - INSTRUMENT
      ?auto_357262 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_357253 ?auto_357250 ) ) ( not ( = ?auto_357254 ?auto_357250 ) ) ( not ( = ?auto_357254 ?auto_357253 ) ) ( not ( = ?auto_357256 ?auto_357250 ) ) ( not ( = ?auto_357256 ?auto_357253 ) ) ( not ( = ?auto_357256 ?auto_357254 ) ) ( not ( = ?auto_357258 ?auto_357250 ) ) ( not ( = ?auto_357258 ?auto_357253 ) ) ( not ( = ?auto_357258 ?auto_357254 ) ) ( not ( = ?auto_357258 ?auto_357256 ) ) ( ON_BOARD ?auto_357267 ?auto_357260 ) ( SUPPORTS ?auto_357267 ?auto_357257 ) ( not ( = ?auto_357256 ?auto_357261 ) ) ( CALIBRATION_TARGET ?auto_357267 ?auto_357261 ) ( not ( = ?auto_357261 ?auto_357250 ) ) ( ON_BOARD ?auto_357266 ?auto_357260 ) ( not ( = ?auto_357267 ?auto_357266 ) ) ( SUPPORTS ?auto_357266 ?auto_357251 ) ( CALIBRATION_TARGET ?auto_357266 ?auto_357261 ) ( not ( = ?auto_357261 ?auto_357254 ) ) ( ON_BOARD ?auto_357263 ?auto_357260 ) ( not ( = ?auto_357266 ?auto_357263 ) ) ( SUPPORTS ?auto_357263 ?auto_357255 ) ( CALIBRATION_TARGET ?auto_357263 ?auto_357261 ) ( not ( = ?auto_357261 ?auto_357253 ) ) ( ON_BOARD ?auto_357264 ?auto_357260 ) ( not ( = ?auto_357263 ?auto_357264 ) ) ( SUPPORTS ?auto_357264 ?auto_357252 ) ( CALIBRATION_TARGET ?auto_357264 ?auto_357261 ) ( not ( = ?auto_357261 ?auto_357258 ) ) ( ON_BOARD ?auto_357265 ?auto_357260 ) ( not ( = ?auto_357264 ?auto_357265 ) ) ( SUPPORTS ?auto_357265 ?auto_357259 ) ( CALIBRATION_TARGET ?auto_357265 ?auto_357261 ) ( POWER_AVAIL ?auto_357260 ) ( POINTING ?auto_357260 ?auto_357262 ) ( not ( = ?auto_357261 ?auto_357262 ) ) ( not ( = ?auto_357258 ?auto_357262 ) ) ( not ( = ?auto_357259 ?auto_357252 ) ) ( not ( = ?auto_357253 ?auto_357262 ) ) ( not ( = ?auto_357259 ?auto_357255 ) ) ( not ( = ?auto_357252 ?auto_357255 ) ) ( not ( = ?auto_357254 ?auto_357262 ) ) ( not ( = ?auto_357263 ?auto_357265 ) ) ( not ( = ?auto_357259 ?auto_357251 ) ) ( not ( = ?auto_357252 ?auto_357251 ) ) ( not ( = ?auto_357255 ?auto_357251 ) ) ( not ( = ?auto_357250 ?auto_357262 ) ) ( not ( = ?auto_357266 ?auto_357264 ) ) ( not ( = ?auto_357266 ?auto_357265 ) ) ( not ( = ?auto_357259 ?auto_357257 ) ) ( not ( = ?auto_357252 ?auto_357257 ) ) ( not ( = ?auto_357255 ?auto_357257 ) ) ( not ( = ?auto_357251 ?auto_357257 ) ) ( not ( = ?auto_357256 ?auto_357262 ) ) ( not ( = ?auto_357267 ?auto_357263 ) ) ( not ( = ?auto_357267 ?auto_357264 ) ) ( not ( = ?auto_357267 ?auto_357265 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_357258 ?auto_357259 ?auto_357253 ?auto_357252 ?auto_357254 ?auto_357255 ?auto_357256 ?auto_357257 ?auto_357250 ?auto_357251 )
      ( GET-5IMAGE-VERIFY ?auto_357250 ?auto_357251 ?auto_357253 ?auto_357252 ?auto_357254 ?auto_357255 ?auto_357256 ?auto_357257 ?auto_357258 ?auto_357259 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_357578 - DIRECTION
      ?auto_357579 - MODE
      ?auto_357581 - DIRECTION
      ?auto_357580 - MODE
      ?auto_357582 - DIRECTION
      ?auto_357583 - MODE
      ?auto_357584 - DIRECTION
      ?auto_357585 - MODE
      ?auto_357586 - DIRECTION
      ?auto_357587 - MODE
    )
    :vars
    (
      ?auto_357595 - INSTRUMENT
      ?auto_357588 - SATELLITE
      ?auto_357589 - DIRECTION
      ?auto_357594 - INSTRUMENT
      ?auto_357591 - INSTRUMENT
      ?auto_357592 - INSTRUMENT
      ?auto_357593 - INSTRUMENT
      ?auto_357590 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_357581 ?auto_357578 ) ) ( not ( = ?auto_357582 ?auto_357578 ) ) ( not ( = ?auto_357582 ?auto_357581 ) ) ( not ( = ?auto_357584 ?auto_357578 ) ) ( not ( = ?auto_357584 ?auto_357581 ) ) ( not ( = ?auto_357584 ?auto_357582 ) ) ( not ( = ?auto_357586 ?auto_357578 ) ) ( not ( = ?auto_357586 ?auto_357581 ) ) ( not ( = ?auto_357586 ?auto_357582 ) ) ( not ( = ?auto_357586 ?auto_357584 ) ) ( ON_BOARD ?auto_357595 ?auto_357588 ) ( SUPPORTS ?auto_357595 ?auto_357583 ) ( not ( = ?auto_357582 ?auto_357589 ) ) ( CALIBRATION_TARGET ?auto_357595 ?auto_357589 ) ( not ( = ?auto_357589 ?auto_357578 ) ) ( ON_BOARD ?auto_357594 ?auto_357588 ) ( not ( = ?auto_357595 ?auto_357594 ) ) ( SUPPORTS ?auto_357594 ?auto_357579 ) ( CALIBRATION_TARGET ?auto_357594 ?auto_357589 ) ( not ( = ?auto_357589 ?auto_357586 ) ) ( ON_BOARD ?auto_357591 ?auto_357588 ) ( not ( = ?auto_357594 ?auto_357591 ) ) ( SUPPORTS ?auto_357591 ?auto_357587 ) ( CALIBRATION_TARGET ?auto_357591 ?auto_357589 ) ( not ( = ?auto_357589 ?auto_357581 ) ) ( ON_BOARD ?auto_357592 ?auto_357588 ) ( not ( = ?auto_357591 ?auto_357592 ) ) ( SUPPORTS ?auto_357592 ?auto_357580 ) ( CALIBRATION_TARGET ?auto_357592 ?auto_357589 ) ( not ( = ?auto_357589 ?auto_357584 ) ) ( ON_BOARD ?auto_357593 ?auto_357588 ) ( not ( = ?auto_357592 ?auto_357593 ) ) ( SUPPORTS ?auto_357593 ?auto_357585 ) ( CALIBRATION_TARGET ?auto_357593 ?auto_357589 ) ( POWER_AVAIL ?auto_357588 ) ( POINTING ?auto_357588 ?auto_357590 ) ( not ( = ?auto_357589 ?auto_357590 ) ) ( not ( = ?auto_357584 ?auto_357590 ) ) ( not ( = ?auto_357585 ?auto_357580 ) ) ( not ( = ?auto_357581 ?auto_357590 ) ) ( not ( = ?auto_357585 ?auto_357587 ) ) ( not ( = ?auto_357580 ?auto_357587 ) ) ( not ( = ?auto_357586 ?auto_357590 ) ) ( not ( = ?auto_357591 ?auto_357593 ) ) ( not ( = ?auto_357585 ?auto_357579 ) ) ( not ( = ?auto_357580 ?auto_357579 ) ) ( not ( = ?auto_357587 ?auto_357579 ) ) ( not ( = ?auto_357578 ?auto_357590 ) ) ( not ( = ?auto_357594 ?auto_357592 ) ) ( not ( = ?auto_357594 ?auto_357593 ) ) ( not ( = ?auto_357585 ?auto_357583 ) ) ( not ( = ?auto_357580 ?auto_357583 ) ) ( not ( = ?auto_357587 ?auto_357583 ) ) ( not ( = ?auto_357579 ?auto_357583 ) ) ( not ( = ?auto_357582 ?auto_357590 ) ) ( not ( = ?auto_357595 ?auto_357591 ) ) ( not ( = ?auto_357595 ?auto_357592 ) ) ( not ( = ?auto_357595 ?auto_357593 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_357584 ?auto_357585 ?auto_357581 ?auto_357580 ?auto_357586 ?auto_357587 ?auto_357582 ?auto_357583 ?auto_357578 ?auto_357579 )
      ( GET-5IMAGE-VERIFY ?auto_357578 ?auto_357579 ?auto_357581 ?auto_357580 ?auto_357582 ?auto_357583 ?auto_357584 ?auto_357585 ?auto_357586 ?auto_357587 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_357742 - DIRECTION
      ?auto_357743 - MODE
      ?auto_357745 - DIRECTION
      ?auto_357744 - MODE
      ?auto_357746 - DIRECTION
      ?auto_357747 - MODE
      ?auto_357748 - DIRECTION
      ?auto_357749 - MODE
      ?auto_357750 - DIRECTION
      ?auto_357751 - MODE
    )
    :vars
    (
      ?auto_357759 - INSTRUMENT
      ?auto_357752 - SATELLITE
      ?auto_357753 - DIRECTION
      ?auto_357758 - INSTRUMENT
      ?auto_357755 - INSTRUMENT
      ?auto_357756 - INSTRUMENT
      ?auto_357757 - INSTRUMENT
      ?auto_357754 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_357745 ?auto_357742 ) ) ( not ( = ?auto_357746 ?auto_357742 ) ) ( not ( = ?auto_357746 ?auto_357745 ) ) ( not ( = ?auto_357748 ?auto_357742 ) ) ( not ( = ?auto_357748 ?auto_357745 ) ) ( not ( = ?auto_357748 ?auto_357746 ) ) ( not ( = ?auto_357750 ?auto_357742 ) ) ( not ( = ?auto_357750 ?auto_357745 ) ) ( not ( = ?auto_357750 ?auto_357746 ) ) ( not ( = ?auto_357750 ?auto_357748 ) ) ( ON_BOARD ?auto_357759 ?auto_357752 ) ( SUPPORTS ?auto_357759 ?auto_357747 ) ( not ( = ?auto_357746 ?auto_357753 ) ) ( CALIBRATION_TARGET ?auto_357759 ?auto_357753 ) ( not ( = ?auto_357753 ?auto_357742 ) ) ( ON_BOARD ?auto_357758 ?auto_357752 ) ( not ( = ?auto_357759 ?auto_357758 ) ) ( SUPPORTS ?auto_357758 ?auto_357743 ) ( CALIBRATION_TARGET ?auto_357758 ?auto_357753 ) ( not ( = ?auto_357753 ?auto_357748 ) ) ( ON_BOARD ?auto_357755 ?auto_357752 ) ( not ( = ?auto_357758 ?auto_357755 ) ) ( SUPPORTS ?auto_357755 ?auto_357749 ) ( CALIBRATION_TARGET ?auto_357755 ?auto_357753 ) ( not ( = ?auto_357753 ?auto_357745 ) ) ( ON_BOARD ?auto_357756 ?auto_357752 ) ( not ( = ?auto_357755 ?auto_357756 ) ) ( SUPPORTS ?auto_357756 ?auto_357744 ) ( CALIBRATION_TARGET ?auto_357756 ?auto_357753 ) ( not ( = ?auto_357753 ?auto_357750 ) ) ( ON_BOARD ?auto_357757 ?auto_357752 ) ( not ( = ?auto_357756 ?auto_357757 ) ) ( SUPPORTS ?auto_357757 ?auto_357751 ) ( CALIBRATION_TARGET ?auto_357757 ?auto_357753 ) ( POWER_AVAIL ?auto_357752 ) ( POINTING ?auto_357752 ?auto_357754 ) ( not ( = ?auto_357753 ?auto_357754 ) ) ( not ( = ?auto_357750 ?auto_357754 ) ) ( not ( = ?auto_357751 ?auto_357744 ) ) ( not ( = ?auto_357745 ?auto_357754 ) ) ( not ( = ?auto_357751 ?auto_357749 ) ) ( not ( = ?auto_357744 ?auto_357749 ) ) ( not ( = ?auto_357748 ?auto_357754 ) ) ( not ( = ?auto_357755 ?auto_357757 ) ) ( not ( = ?auto_357751 ?auto_357743 ) ) ( not ( = ?auto_357744 ?auto_357743 ) ) ( not ( = ?auto_357749 ?auto_357743 ) ) ( not ( = ?auto_357742 ?auto_357754 ) ) ( not ( = ?auto_357758 ?auto_357756 ) ) ( not ( = ?auto_357758 ?auto_357757 ) ) ( not ( = ?auto_357751 ?auto_357747 ) ) ( not ( = ?auto_357744 ?auto_357747 ) ) ( not ( = ?auto_357749 ?auto_357747 ) ) ( not ( = ?auto_357743 ?auto_357747 ) ) ( not ( = ?auto_357746 ?auto_357754 ) ) ( not ( = ?auto_357759 ?auto_357755 ) ) ( not ( = ?auto_357759 ?auto_357756 ) ) ( not ( = ?auto_357759 ?auto_357757 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_357750 ?auto_357751 ?auto_357745 ?auto_357744 ?auto_357748 ?auto_357749 ?auto_357746 ?auto_357747 ?auto_357742 ?auto_357743 )
      ( GET-5IMAGE-VERIFY ?auto_357742 ?auto_357743 ?auto_357745 ?auto_357744 ?auto_357746 ?auto_357747 ?auto_357748 ?auto_357749 ?auto_357750 ?auto_357751 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_358072 - DIRECTION
      ?auto_358073 - MODE
      ?auto_358075 - DIRECTION
      ?auto_358074 - MODE
      ?auto_358076 - DIRECTION
      ?auto_358077 - MODE
      ?auto_358078 - DIRECTION
      ?auto_358079 - MODE
      ?auto_358080 - DIRECTION
      ?auto_358081 - MODE
    )
    :vars
    (
      ?auto_358089 - INSTRUMENT
      ?auto_358082 - SATELLITE
      ?auto_358083 - DIRECTION
      ?auto_358088 - INSTRUMENT
      ?auto_358085 - INSTRUMENT
      ?auto_358086 - INSTRUMENT
      ?auto_358087 - INSTRUMENT
      ?auto_358084 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_358075 ?auto_358072 ) ) ( not ( = ?auto_358076 ?auto_358072 ) ) ( not ( = ?auto_358076 ?auto_358075 ) ) ( not ( = ?auto_358078 ?auto_358072 ) ) ( not ( = ?auto_358078 ?auto_358075 ) ) ( not ( = ?auto_358078 ?auto_358076 ) ) ( not ( = ?auto_358080 ?auto_358072 ) ) ( not ( = ?auto_358080 ?auto_358075 ) ) ( not ( = ?auto_358080 ?auto_358076 ) ) ( not ( = ?auto_358080 ?auto_358078 ) ) ( ON_BOARD ?auto_358089 ?auto_358082 ) ( SUPPORTS ?auto_358089 ?auto_358081 ) ( not ( = ?auto_358080 ?auto_358083 ) ) ( CALIBRATION_TARGET ?auto_358089 ?auto_358083 ) ( not ( = ?auto_358083 ?auto_358072 ) ) ( ON_BOARD ?auto_358088 ?auto_358082 ) ( not ( = ?auto_358089 ?auto_358088 ) ) ( SUPPORTS ?auto_358088 ?auto_358073 ) ( CALIBRATION_TARGET ?auto_358088 ?auto_358083 ) ( not ( = ?auto_358083 ?auto_358075 ) ) ( ON_BOARD ?auto_358085 ?auto_358082 ) ( not ( = ?auto_358088 ?auto_358085 ) ) ( SUPPORTS ?auto_358085 ?auto_358074 ) ( CALIBRATION_TARGET ?auto_358085 ?auto_358083 ) ( not ( = ?auto_358083 ?auto_358078 ) ) ( ON_BOARD ?auto_358086 ?auto_358082 ) ( not ( = ?auto_358085 ?auto_358086 ) ) ( SUPPORTS ?auto_358086 ?auto_358079 ) ( CALIBRATION_TARGET ?auto_358086 ?auto_358083 ) ( not ( = ?auto_358083 ?auto_358076 ) ) ( ON_BOARD ?auto_358087 ?auto_358082 ) ( not ( = ?auto_358086 ?auto_358087 ) ) ( SUPPORTS ?auto_358087 ?auto_358077 ) ( CALIBRATION_TARGET ?auto_358087 ?auto_358083 ) ( POWER_AVAIL ?auto_358082 ) ( POINTING ?auto_358082 ?auto_358084 ) ( not ( = ?auto_358083 ?auto_358084 ) ) ( not ( = ?auto_358076 ?auto_358084 ) ) ( not ( = ?auto_358077 ?auto_358079 ) ) ( not ( = ?auto_358078 ?auto_358084 ) ) ( not ( = ?auto_358077 ?auto_358074 ) ) ( not ( = ?auto_358079 ?auto_358074 ) ) ( not ( = ?auto_358075 ?auto_358084 ) ) ( not ( = ?auto_358085 ?auto_358087 ) ) ( not ( = ?auto_358077 ?auto_358073 ) ) ( not ( = ?auto_358079 ?auto_358073 ) ) ( not ( = ?auto_358074 ?auto_358073 ) ) ( not ( = ?auto_358072 ?auto_358084 ) ) ( not ( = ?auto_358088 ?auto_358086 ) ) ( not ( = ?auto_358088 ?auto_358087 ) ) ( not ( = ?auto_358077 ?auto_358081 ) ) ( not ( = ?auto_358079 ?auto_358081 ) ) ( not ( = ?auto_358074 ?auto_358081 ) ) ( not ( = ?auto_358073 ?auto_358081 ) ) ( not ( = ?auto_358080 ?auto_358084 ) ) ( not ( = ?auto_358089 ?auto_358085 ) ) ( not ( = ?auto_358089 ?auto_358086 ) ) ( not ( = ?auto_358089 ?auto_358087 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_358076 ?auto_358077 ?auto_358078 ?auto_358079 ?auto_358075 ?auto_358074 ?auto_358080 ?auto_358081 ?auto_358072 ?auto_358073 )
      ( GET-5IMAGE-VERIFY ?auto_358072 ?auto_358073 ?auto_358075 ?auto_358074 ?auto_358076 ?auto_358077 ?auto_358078 ?auto_358079 ?auto_358080 ?auto_358081 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_358150 - DIRECTION
      ?auto_358151 - MODE
      ?auto_358153 - DIRECTION
      ?auto_358152 - MODE
      ?auto_358154 - DIRECTION
      ?auto_358155 - MODE
      ?auto_358156 - DIRECTION
      ?auto_358157 - MODE
      ?auto_358158 - DIRECTION
      ?auto_358159 - MODE
    )
    :vars
    (
      ?auto_358167 - INSTRUMENT
      ?auto_358160 - SATELLITE
      ?auto_358161 - DIRECTION
      ?auto_358166 - INSTRUMENT
      ?auto_358163 - INSTRUMENT
      ?auto_358164 - INSTRUMENT
      ?auto_358165 - INSTRUMENT
      ?auto_358162 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_358153 ?auto_358150 ) ) ( not ( = ?auto_358154 ?auto_358150 ) ) ( not ( = ?auto_358154 ?auto_358153 ) ) ( not ( = ?auto_358156 ?auto_358150 ) ) ( not ( = ?auto_358156 ?auto_358153 ) ) ( not ( = ?auto_358156 ?auto_358154 ) ) ( not ( = ?auto_358158 ?auto_358150 ) ) ( not ( = ?auto_358158 ?auto_358153 ) ) ( not ( = ?auto_358158 ?auto_358154 ) ) ( not ( = ?auto_358158 ?auto_358156 ) ) ( ON_BOARD ?auto_358167 ?auto_358160 ) ( SUPPORTS ?auto_358167 ?auto_358157 ) ( not ( = ?auto_358156 ?auto_358161 ) ) ( CALIBRATION_TARGET ?auto_358167 ?auto_358161 ) ( not ( = ?auto_358161 ?auto_358150 ) ) ( ON_BOARD ?auto_358166 ?auto_358160 ) ( not ( = ?auto_358167 ?auto_358166 ) ) ( SUPPORTS ?auto_358166 ?auto_358151 ) ( CALIBRATION_TARGET ?auto_358166 ?auto_358161 ) ( not ( = ?auto_358161 ?auto_358153 ) ) ( ON_BOARD ?auto_358163 ?auto_358160 ) ( not ( = ?auto_358166 ?auto_358163 ) ) ( SUPPORTS ?auto_358163 ?auto_358152 ) ( CALIBRATION_TARGET ?auto_358163 ?auto_358161 ) ( not ( = ?auto_358161 ?auto_358158 ) ) ( ON_BOARD ?auto_358164 ?auto_358160 ) ( not ( = ?auto_358163 ?auto_358164 ) ) ( SUPPORTS ?auto_358164 ?auto_358159 ) ( CALIBRATION_TARGET ?auto_358164 ?auto_358161 ) ( not ( = ?auto_358161 ?auto_358154 ) ) ( ON_BOARD ?auto_358165 ?auto_358160 ) ( not ( = ?auto_358164 ?auto_358165 ) ) ( SUPPORTS ?auto_358165 ?auto_358155 ) ( CALIBRATION_TARGET ?auto_358165 ?auto_358161 ) ( POWER_AVAIL ?auto_358160 ) ( POINTING ?auto_358160 ?auto_358162 ) ( not ( = ?auto_358161 ?auto_358162 ) ) ( not ( = ?auto_358154 ?auto_358162 ) ) ( not ( = ?auto_358155 ?auto_358159 ) ) ( not ( = ?auto_358158 ?auto_358162 ) ) ( not ( = ?auto_358155 ?auto_358152 ) ) ( not ( = ?auto_358159 ?auto_358152 ) ) ( not ( = ?auto_358153 ?auto_358162 ) ) ( not ( = ?auto_358163 ?auto_358165 ) ) ( not ( = ?auto_358155 ?auto_358151 ) ) ( not ( = ?auto_358159 ?auto_358151 ) ) ( not ( = ?auto_358152 ?auto_358151 ) ) ( not ( = ?auto_358150 ?auto_358162 ) ) ( not ( = ?auto_358166 ?auto_358164 ) ) ( not ( = ?auto_358166 ?auto_358165 ) ) ( not ( = ?auto_358155 ?auto_358157 ) ) ( not ( = ?auto_358159 ?auto_358157 ) ) ( not ( = ?auto_358152 ?auto_358157 ) ) ( not ( = ?auto_358151 ?auto_358157 ) ) ( not ( = ?auto_358156 ?auto_358162 ) ) ( not ( = ?auto_358167 ?auto_358163 ) ) ( not ( = ?auto_358167 ?auto_358164 ) ) ( not ( = ?auto_358167 ?auto_358165 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_358154 ?auto_358155 ?auto_358158 ?auto_358159 ?auto_358153 ?auto_358152 ?auto_358156 ?auto_358157 ?auto_358150 ?auto_358151 )
      ( GET-5IMAGE-VERIFY ?auto_358150 ?auto_358151 ?auto_358153 ?auto_358152 ?auto_358154 ?auto_358155 ?auto_358156 ?auto_358157 ?auto_358158 ?auto_358159 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_358228 - DIRECTION
      ?auto_358229 - MODE
      ?auto_358231 - DIRECTION
      ?auto_358230 - MODE
      ?auto_358232 - DIRECTION
      ?auto_358233 - MODE
      ?auto_358234 - DIRECTION
      ?auto_358235 - MODE
      ?auto_358236 - DIRECTION
      ?auto_358237 - MODE
    )
    :vars
    (
      ?auto_358245 - INSTRUMENT
      ?auto_358238 - SATELLITE
      ?auto_358239 - DIRECTION
      ?auto_358244 - INSTRUMENT
      ?auto_358241 - INSTRUMENT
      ?auto_358242 - INSTRUMENT
      ?auto_358243 - INSTRUMENT
      ?auto_358240 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_358231 ?auto_358228 ) ) ( not ( = ?auto_358232 ?auto_358228 ) ) ( not ( = ?auto_358232 ?auto_358231 ) ) ( not ( = ?auto_358234 ?auto_358228 ) ) ( not ( = ?auto_358234 ?auto_358231 ) ) ( not ( = ?auto_358234 ?auto_358232 ) ) ( not ( = ?auto_358236 ?auto_358228 ) ) ( not ( = ?auto_358236 ?auto_358231 ) ) ( not ( = ?auto_358236 ?auto_358232 ) ) ( not ( = ?auto_358236 ?auto_358234 ) ) ( ON_BOARD ?auto_358245 ?auto_358238 ) ( SUPPORTS ?auto_358245 ?auto_358237 ) ( not ( = ?auto_358236 ?auto_358239 ) ) ( CALIBRATION_TARGET ?auto_358245 ?auto_358239 ) ( not ( = ?auto_358239 ?auto_358228 ) ) ( ON_BOARD ?auto_358244 ?auto_358238 ) ( not ( = ?auto_358245 ?auto_358244 ) ) ( SUPPORTS ?auto_358244 ?auto_358229 ) ( CALIBRATION_TARGET ?auto_358244 ?auto_358239 ) ( not ( = ?auto_358239 ?auto_358231 ) ) ( ON_BOARD ?auto_358241 ?auto_358238 ) ( not ( = ?auto_358244 ?auto_358241 ) ) ( SUPPORTS ?auto_358241 ?auto_358230 ) ( CALIBRATION_TARGET ?auto_358241 ?auto_358239 ) ( not ( = ?auto_358239 ?auto_358232 ) ) ( ON_BOARD ?auto_358242 ?auto_358238 ) ( not ( = ?auto_358241 ?auto_358242 ) ) ( SUPPORTS ?auto_358242 ?auto_358233 ) ( CALIBRATION_TARGET ?auto_358242 ?auto_358239 ) ( not ( = ?auto_358239 ?auto_358234 ) ) ( ON_BOARD ?auto_358243 ?auto_358238 ) ( not ( = ?auto_358242 ?auto_358243 ) ) ( SUPPORTS ?auto_358243 ?auto_358235 ) ( CALIBRATION_TARGET ?auto_358243 ?auto_358239 ) ( POWER_AVAIL ?auto_358238 ) ( POINTING ?auto_358238 ?auto_358240 ) ( not ( = ?auto_358239 ?auto_358240 ) ) ( not ( = ?auto_358234 ?auto_358240 ) ) ( not ( = ?auto_358235 ?auto_358233 ) ) ( not ( = ?auto_358232 ?auto_358240 ) ) ( not ( = ?auto_358235 ?auto_358230 ) ) ( not ( = ?auto_358233 ?auto_358230 ) ) ( not ( = ?auto_358231 ?auto_358240 ) ) ( not ( = ?auto_358241 ?auto_358243 ) ) ( not ( = ?auto_358235 ?auto_358229 ) ) ( not ( = ?auto_358233 ?auto_358229 ) ) ( not ( = ?auto_358230 ?auto_358229 ) ) ( not ( = ?auto_358228 ?auto_358240 ) ) ( not ( = ?auto_358244 ?auto_358242 ) ) ( not ( = ?auto_358244 ?auto_358243 ) ) ( not ( = ?auto_358235 ?auto_358237 ) ) ( not ( = ?auto_358233 ?auto_358237 ) ) ( not ( = ?auto_358230 ?auto_358237 ) ) ( not ( = ?auto_358229 ?auto_358237 ) ) ( not ( = ?auto_358236 ?auto_358240 ) ) ( not ( = ?auto_358245 ?auto_358241 ) ) ( not ( = ?auto_358245 ?auto_358242 ) ) ( not ( = ?auto_358245 ?auto_358243 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_358234 ?auto_358235 ?auto_358232 ?auto_358233 ?auto_358231 ?auto_358230 ?auto_358236 ?auto_358237 ?auto_358228 ?auto_358229 )
      ( GET-5IMAGE-VERIFY ?auto_358228 ?auto_358229 ?auto_358231 ?auto_358230 ?auto_358232 ?auto_358233 ?auto_358234 ?auto_358235 ?auto_358236 ?auto_358237 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_358306 - DIRECTION
      ?auto_358307 - MODE
      ?auto_358309 - DIRECTION
      ?auto_358308 - MODE
      ?auto_358310 - DIRECTION
      ?auto_358311 - MODE
      ?auto_358312 - DIRECTION
      ?auto_358313 - MODE
      ?auto_358314 - DIRECTION
      ?auto_358315 - MODE
    )
    :vars
    (
      ?auto_358323 - INSTRUMENT
      ?auto_358316 - SATELLITE
      ?auto_358317 - DIRECTION
      ?auto_358322 - INSTRUMENT
      ?auto_358319 - INSTRUMENT
      ?auto_358320 - INSTRUMENT
      ?auto_358321 - INSTRUMENT
      ?auto_358318 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_358309 ?auto_358306 ) ) ( not ( = ?auto_358310 ?auto_358306 ) ) ( not ( = ?auto_358310 ?auto_358309 ) ) ( not ( = ?auto_358312 ?auto_358306 ) ) ( not ( = ?auto_358312 ?auto_358309 ) ) ( not ( = ?auto_358312 ?auto_358310 ) ) ( not ( = ?auto_358314 ?auto_358306 ) ) ( not ( = ?auto_358314 ?auto_358309 ) ) ( not ( = ?auto_358314 ?auto_358310 ) ) ( not ( = ?auto_358314 ?auto_358312 ) ) ( ON_BOARD ?auto_358323 ?auto_358316 ) ( SUPPORTS ?auto_358323 ?auto_358313 ) ( not ( = ?auto_358312 ?auto_358317 ) ) ( CALIBRATION_TARGET ?auto_358323 ?auto_358317 ) ( not ( = ?auto_358317 ?auto_358306 ) ) ( ON_BOARD ?auto_358322 ?auto_358316 ) ( not ( = ?auto_358323 ?auto_358322 ) ) ( SUPPORTS ?auto_358322 ?auto_358307 ) ( CALIBRATION_TARGET ?auto_358322 ?auto_358317 ) ( not ( = ?auto_358317 ?auto_358309 ) ) ( ON_BOARD ?auto_358319 ?auto_358316 ) ( not ( = ?auto_358322 ?auto_358319 ) ) ( SUPPORTS ?auto_358319 ?auto_358308 ) ( CALIBRATION_TARGET ?auto_358319 ?auto_358317 ) ( not ( = ?auto_358317 ?auto_358310 ) ) ( ON_BOARD ?auto_358320 ?auto_358316 ) ( not ( = ?auto_358319 ?auto_358320 ) ) ( SUPPORTS ?auto_358320 ?auto_358311 ) ( CALIBRATION_TARGET ?auto_358320 ?auto_358317 ) ( not ( = ?auto_358317 ?auto_358314 ) ) ( ON_BOARD ?auto_358321 ?auto_358316 ) ( not ( = ?auto_358320 ?auto_358321 ) ) ( SUPPORTS ?auto_358321 ?auto_358315 ) ( CALIBRATION_TARGET ?auto_358321 ?auto_358317 ) ( POWER_AVAIL ?auto_358316 ) ( POINTING ?auto_358316 ?auto_358318 ) ( not ( = ?auto_358317 ?auto_358318 ) ) ( not ( = ?auto_358314 ?auto_358318 ) ) ( not ( = ?auto_358315 ?auto_358311 ) ) ( not ( = ?auto_358310 ?auto_358318 ) ) ( not ( = ?auto_358315 ?auto_358308 ) ) ( not ( = ?auto_358311 ?auto_358308 ) ) ( not ( = ?auto_358309 ?auto_358318 ) ) ( not ( = ?auto_358319 ?auto_358321 ) ) ( not ( = ?auto_358315 ?auto_358307 ) ) ( not ( = ?auto_358311 ?auto_358307 ) ) ( not ( = ?auto_358308 ?auto_358307 ) ) ( not ( = ?auto_358306 ?auto_358318 ) ) ( not ( = ?auto_358322 ?auto_358320 ) ) ( not ( = ?auto_358322 ?auto_358321 ) ) ( not ( = ?auto_358315 ?auto_358313 ) ) ( not ( = ?auto_358311 ?auto_358313 ) ) ( not ( = ?auto_358308 ?auto_358313 ) ) ( not ( = ?auto_358307 ?auto_358313 ) ) ( not ( = ?auto_358312 ?auto_358318 ) ) ( not ( = ?auto_358323 ?auto_358319 ) ) ( not ( = ?auto_358323 ?auto_358320 ) ) ( not ( = ?auto_358323 ?auto_358321 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_358314 ?auto_358315 ?auto_358310 ?auto_358311 ?auto_358309 ?auto_358308 ?auto_358312 ?auto_358313 ?auto_358306 ?auto_358307 )
      ( GET-5IMAGE-VERIFY ?auto_358306 ?auto_358307 ?auto_358309 ?auto_358308 ?auto_358310 ?auto_358311 ?auto_358312 ?auto_358313 ?auto_358314 ?auto_358315 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_358804 - DIRECTION
      ?auto_358805 - MODE
      ?auto_358807 - DIRECTION
      ?auto_358806 - MODE
      ?auto_358808 - DIRECTION
      ?auto_358809 - MODE
      ?auto_358810 - DIRECTION
      ?auto_358811 - MODE
      ?auto_358812 - DIRECTION
      ?auto_358813 - MODE
    )
    :vars
    (
      ?auto_358821 - INSTRUMENT
      ?auto_358814 - SATELLITE
      ?auto_358815 - DIRECTION
      ?auto_358820 - INSTRUMENT
      ?auto_358817 - INSTRUMENT
      ?auto_358818 - INSTRUMENT
      ?auto_358819 - INSTRUMENT
      ?auto_358816 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_358807 ?auto_358804 ) ) ( not ( = ?auto_358808 ?auto_358804 ) ) ( not ( = ?auto_358808 ?auto_358807 ) ) ( not ( = ?auto_358810 ?auto_358804 ) ) ( not ( = ?auto_358810 ?auto_358807 ) ) ( not ( = ?auto_358810 ?auto_358808 ) ) ( not ( = ?auto_358812 ?auto_358804 ) ) ( not ( = ?auto_358812 ?auto_358807 ) ) ( not ( = ?auto_358812 ?auto_358808 ) ) ( not ( = ?auto_358812 ?auto_358810 ) ) ( ON_BOARD ?auto_358821 ?auto_358814 ) ( SUPPORTS ?auto_358821 ?auto_358809 ) ( not ( = ?auto_358808 ?auto_358815 ) ) ( CALIBRATION_TARGET ?auto_358821 ?auto_358815 ) ( not ( = ?auto_358815 ?auto_358804 ) ) ( ON_BOARD ?auto_358820 ?auto_358814 ) ( not ( = ?auto_358821 ?auto_358820 ) ) ( SUPPORTS ?auto_358820 ?auto_358805 ) ( CALIBRATION_TARGET ?auto_358820 ?auto_358815 ) ( not ( = ?auto_358815 ?auto_358807 ) ) ( ON_BOARD ?auto_358817 ?auto_358814 ) ( not ( = ?auto_358820 ?auto_358817 ) ) ( SUPPORTS ?auto_358817 ?auto_358806 ) ( CALIBRATION_TARGET ?auto_358817 ?auto_358815 ) ( not ( = ?auto_358815 ?auto_358812 ) ) ( ON_BOARD ?auto_358818 ?auto_358814 ) ( not ( = ?auto_358817 ?auto_358818 ) ) ( SUPPORTS ?auto_358818 ?auto_358813 ) ( CALIBRATION_TARGET ?auto_358818 ?auto_358815 ) ( not ( = ?auto_358815 ?auto_358810 ) ) ( ON_BOARD ?auto_358819 ?auto_358814 ) ( not ( = ?auto_358818 ?auto_358819 ) ) ( SUPPORTS ?auto_358819 ?auto_358811 ) ( CALIBRATION_TARGET ?auto_358819 ?auto_358815 ) ( POWER_AVAIL ?auto_358814 ) ( POINTING ?auto_358814 ?auto_358816 ) ( not ( = ?auto_358815 ?auto_358816 ) ) ( not ( = ?auto_358810 ?auto_358816 ) ) ( not ( = ?auto_358811 ?auto_358813 ) ) ( not ( = ?auto_358812 ?auto_358816 ) ) ( not ( = ?auto_358811 ?auto_358806 ) ) ( not ( = ?auto_358813 ?auto_358806 ) ) ( not ( = ?auto_358807 ?auto_358816 ) ) ( not ( = ?auto_358817 ?auto_358819 ) ) ( not ( = ?auto_358811 ?auto_358805 ) ) ( not ( = ?auto_358813 ?auto_358805 ) ) ( not ( = ?auto_358806 ?auto_358805 ) ) ( not ( = ?auto_358804 ?auto_358816 ) ) ( not ( = ?auto_358820 ?auto_358818 ) ) ( not ( = ?auto_358820 ?auto_358819 ) ) ( not ( = ?auto_358811 ?auto_358809 ) ) ( not ( = ?auto_358813 ?auto_358809 ) ) ( not ( = ?auto_358806 ?auto_358809 ) ) ( not ( = ?auto_358805 ?auto_358809 ) ) ( not ( = ?auto_358808 ?auto_358816 ) ) ( not ( = ?auto_358821 ?auto_358817 ) ) ( not ( = ?auto_358821 ?auto_358818 ) ) ( not ( = ?auto_358821 ?auto_358819 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_358810 ?auto_358811 ?auto_358812 ?auto_358813 ?auto_358807 ?auto_358806 ?auto_358808 ?auto_358809 ?auto_358804 ?auto_358805 )
      ( GET-5IMAGE-VERIFY ?auto_358804 ?auto_358805 ?auto_358807 ?auto_358806 ?auto_358808 ?auto_358809 ?auto_358810 ?auto_358811 ?auto_358812 ?auto_358813 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_358882 - DIRECTION
      ?auto_358883 - MODE
      ?auto_358885 - DIRECTION
      ?auto_358884 - MODE
      ?auto_358886 - DIRECTION
      ?auto_358887 - MODE
      ?auto_358888 - DIRECTION
      ?auto_358889 - MODE
      ?auto_358890 - DIRECTION
      ?auto_358891 - MODE
    )
    :vars
    (
      ?auto_358899 - INSTRUMENT
      ?auto_358892 - SATELLITE
      ?auto_358893 - DIRECTION
      ?auto_358898 - INSTRUMENT
      ?auto_358895 - INSTRUMENT
      ?auto_358896 - INSTRUMENT
      ?auto_358897 - INSTRUMENT
      ?auto_358894 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_358885 ?auto_358882 ) ) ( not ( = ?auto_358886 ?auto_358882 ) ) ( not ( = ?auto_358886 ?auto_358885 ) ) ( not ( = ?auto_358888 ?auto_358882 ) ) ( not ( = ?auto_358888 ?auto_358885 ) ) ( not ( = ?auto_358888 ?auto_358886 ) ) ( not ( = ?auto_358890 ?auto_358882 ) ) ( not ( = ?auto_358890 ?auto_358885 ) ) ( not ( = ?auto_358890 ?auto_358886 ) ) ( not ( = ?auto_358890 ?auto_358888 ) ) ( ON_BOARD ?auto_358899 ?auto_358892 ) ( SUPPORTS ?auto_358899 ?auto_358887 ) ( not ( = ?auto_358886 ?auto_358893 ) ) ( CALIBRATION_TARGET ?auto_358899 ?auto_358893 ) ( not ( = ?auto_358893 ?auto_358882 ) ) ( ON_BOARD ?auto_358898 ?auto_358892 ) ( not ( = ?auto_358899 ?auto_358898 ) ) ( SUPPORTS ?auto_358898 ?auto_358883 ) ( CALIBRATION_TARGET ?auto_358898 ?auto_358893 ) ( not ( = ?auto_358893 ?auto_358885 ) ) ( ON_BOARD ?auto_358895 ?auto_358892 ) ( not ( = ?auto_358898 ?auto_358895 ) ) ( SUPPORTS ?auto_358895 ?auto_358884 ) ( CALIBRATION_TARGET ?auto_358895 ?auto_358893 ) ( not ( = ?auto_358893 ?auto_358888 ) ) ( ON_BOARD ?auto_358896 ?auto_358892 ) ( not ( = ?auto_358895 ?auto_358896 ) ) ( SUPPORTS ?auto_358896 ?auto_358889 ) ( CALIBRATION_TARGET ?auto_358896 ?auto_358893 ) ( not ( = ?auto_358893 ?auto_358890 ) ) ( ON_BOARD ?auto_358897 ?auto_358892 ) ( not ( = ?auto_358896 ?auto_358897 ) ) ( SUPPORTS ?auto_358897 ?auto_358891 ) ( CALIBRATION_TARGET ?auto_358897 ?auto_358893 ) ( POWER_AVAIL ?auto_358892 ) ( POINTING ?auto_358892 ?auto_358894 ) ( not ( = ?auto_358893 ?auto_358894 ) ) ( not ( = ?auto_358890 ?auto_358894 ) ) ( not ( = ?auto_358891 ?auto_358889 ) ) ( not ( = ?auto_358888 ?auto_358894 ) ) ( not ( = ?auto_358891 ?auto_358884 ) ) ( not ( = ?auto_358889 ?auto_358884 ) ) ( not ( = ?auto_358885 ?auto_358894 ) ) ( not ( = ?auto_358895 ?auto_358897 ) ) ( not ( = ?auto_358891 ?auto_358883 ) ) ( not ( = ?auto_358889 ?auto_358883 ) ) ( not ( = ?auto_358884 ?auto_358883 ) ) ( not ( = ?auto_358882 ?auto_358894 ) ) ( not ( = ?auto_358898 ?auto_358896 ) ) ( not ( = ?auto_358898 ?auto_358897 ) ) ( not ( = ?auto_358891 ?auto_358887 ) ) ( not ( = ?auto_358889 ?auto_358887 ) ) ( not ( = ?auto_358884 ?auto_358887 ) ) ( not ( = ?auto_358883 ?auto_358887 ) ) ( not ( = ?auto_358886 ?auto_358894 ) ) ( not ( = ?auto_358899 ?auto_358895 ) ) ( not ( = ?auto_358899 ?auto_358896 ) ) ( not ( = ?auto_358899 ?auto_358897 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_358890 ?auto_358891 ?auto_358888 ?auto_358889 ?auto_358885 ?auto_358884 ?auto_358886 ?auto_358887 ?auto_358882 ?auto_358883 )
      ( GET-5IMAGE-VERIFY ?auto_358882 ?auto_358883 ?auto_358885 ?auto_358884 ?auto_358886 ?auto_358887 ?auto_358888 ?auto_358889 ?auto_358890 ?auto_358891 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_360764 - DIRECTION
      ?auto_360765 - MODE
      ?auto_360767 - DIRECTION
      ?auto_360766 - MODE
      ?auto_360768 - DIRECTION
      ?auto_360769 - MODE
      ?auto_360770 - DIRECTION
      ?auto_360771 - MODE
      ?auto_360772 - DIRECTION
      ?auto_360773 - MODE
    )
    :vars
    (
      ?auto_360781 - INSTRUMENT
      ?auto_360774 - SATELLITE
      ?auto_360775 - DIRECTION
      ?auto_360780 - INSTRUMENT
      ?auto_360777 - INSTRUMENT
      ?auto_360778 - INSTRUMENT
      ?auto_360779 - INSTRUMENT
      ?auto_360776 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_360767 ?auto_360764 ) ) ( not ( = ?auto_360768 ?auto_360764 ) ) ( not ( = ?auto_360768 ?auto_360767 ) ) ( not ( = ?auto_360770 ?auto_360764 ) ) ( not ( = ?auto_360770 ?auto_360767 ) ) ( not ( = ?auto_360770 ?auto_360768 ) ) ( not ( = ?auto_360772 ?auto_360764 ) ) ( not ( = ?auto_360772 ?auto_360767 ) ) ( not ( = ?auto_360772 ?auto_360768 ) ) ( not ( = ?auto_360772 ?auto_360770 ) ) ( ON_BOARD ?auto_360781 ?auto_360774 ) ( SUPPORTS ?auto_360781 ?auto_360766 ) ( not ( = ?auto_360767 ?auto_360775 ) ) ( CALIBRATION_TARGET ?auto_360781 ?auto_360775 ) ( not ( = ?auto_360775 ?auto_360764 ) ) ( ON_BOARD ?auto_360780 ?auto_360774 ) ( not ( = ?auto_360781 ?auto_360780 ) ) ( SUPPORTS ?auto_360780 ?auto_360765 ) ( CALIBRATION_TARGET ?auto_360780 ?auto_360775 ) ( not ( = ?auto_360775 ?auto_360772 ) ) ( ON_BOARD ?auto_360777 ?auto_360774 ) ( not ( = ?auto_360780 ?auto_360777 ) ) ( SUPPORTS ?auto_360777 ?auto_360773 ) ( CALIBRATION_TARGET ?auto_360777 ?auto_360775 ) ( not ( = ?auto_360775 ?auto_360770 ) ) ( ON_BOARD ?auto_360778 ?auto_360774 ) ( not ( = ?auto_360777 ?auto_360778 ) ) ( SUPPORTS ?auto_360778 ?auto_360771 ) ( CALIBRATION_TARGET ?auto_360778 ?auto_360775 ) ( not ( = ?auto_360775 ?auto_360768 ) ) ( ON_BOARD ?auto_360779 ?auto_360774 ) ( not ( = ?auto_360778 ?auto_360779 ) ) ( SUPPORTS ?auto_360779 ?auto_360769 ) ( CALIBRATION_TARGET ?auto_360779 ?auto_360775 ) ( POWER_AVAIL ?auto_360774 ) ( POINTING ?auto_360774 ?auto_360776 ) ( not ( = ?auto_360775 ?auto_360776 ) ) ( not ( = ?auto_360768 ?auto_360776 ) ) ( not ( = ?auto_360769 ?auto_360771 ) ) ( not ( = ?auto_360770 ?auto_360776 ) ) ( not ( = ?auto_360769 ?auto_360773 ) ) ( not ( = ?auto_360771 ?auto_360773 ) ) ( not ( = ?auto_360772 ?auto_360776 ) ) ( not ( = ?auto_360777 ?auto_360779 ) ) ( not ( = ?auto_360769 ?auto_360765 ) ) ( not ( = ?auto_360771 ?auto_360765 ) ) ( not ( = ?auto_360773 ?auto_360765 ) ) ( not ( = ?auto_360764 ?auto_360776 ) ) ( not ( = ?auto_360780 ?auto_360778 ) ) ( not ( = ?auto_360780 ?auto_360779 ) ) ( not ( = ?auto_360769 ?auto_360766 ) ) ( not ( = ?auto_360771 ?auto_360766 ) ) ( not ( = ?auto_360773 ?auto_360766 ) ) ( not ( = ?auto_360765 ?auto_360766 ) ) ( not ( = ?auto_360767 ?auto_360776 ) ) ( not ( = ?auto_360781 ?auto_360777 ) ) ( not ( = ?auto_360781 ?auto_360778 ) ) ( not ( = ?auto_360781 ?auto_360779 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_360768 ?auto_360769 ?auto_360770 ?auto_360771 ?auto_360772 ?auto_360773 ?auto_360767 ?auto_360766 ?auto_360764 ?auto_360765 )
      ( GET-5IMAGE-VERIFY ?auto_360764 ?auto_360765 ?auto_360767 ?auto_360766 ?auto_360768 ?auto_360769 ?auto_360770 ?auto_360771 ?auto_360772 ?auto_360773 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_360842 - DIRECTION
      ?auto_360843 - MODE
      ?auto_360845 - DIRECTION
      ?auto_360844 - MODE
      ?auto_360846 - DIRECTION
      ?auto_360847 - MODE
      ?auto_360848 - DIRECTION
      ?auto_360849 - MODE
      ?auto_360850 - DIRECTION
      ?auto_360851 - MODE
    )
    :vars
    (
      ?auto_360859 - INSTRUMENT
      ?auto_360852 - SATELLITE
      ?auto_360853 - DIRECTION
      ?auto_360858 - INSTRUMENT
      ?auto_360855 - INSTRUMENT
      ?auto_360856 - INSTRUMENT
      ?auto_360857 - INSTRUMENT
      ?auto_360854 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_360845 ?auto_360842 ) ) ( not ( = ?auto_360846 ?auto_360842 ) ) ( not ( = ?auto_360846 ?auto_360845 ) ) ( not ( = ?auto_360848 ?auto_360842 ) ) ( not ( = ?auto_360848 ?auto_360845 ) ) ( not ( = ?auto_360848 ?auto_360846 ) ) ( not ( = ?auto_360850 ?auto_360842 ) ) ( not ( = ?auto_360850 ?auto_360845 ) ) ( not ( = ?auto_360850 ?auto_360846 ) ) ( not ( = ?auto_360850 ?auto_360848 ) ) ( ON_BOARD ?auto_360859 ?auto_360852 ) ( SUPPORTS ?auto_360859 ?auto_360844 ) ( not ( = ?auto_360845 ?auto_360853 ) ) ( CALIBRATION_TARGET ?auto_360859 ?auto_360853 ) ( not ( = ?auto_360853 ?auto_360842 ) ) ( ON_BOARD ?auto_360858 ?auto_360852 ) ( not ( = ?auto_360859 ?auto_360858 ) ) ( SUPPORTS ?auto_360858 ?auto_360843 ) ( CALIBRATION_TARGET ?auto_360858 ?auto_360853 ) ( not ( = ?auto_360853 ?auto_360848 ) ) ( ON_BOARD ?auto_360855 ?auto_360852 ) ( not ( = ?auto_360858 ?auto_360855 ) ) ( SUPPORTS ?auto_360855 ?auto_360849 ) ( CALIBRATION_TARGET ?auto_360855 ?auto_360853 ) ( not ( = ?auto_360853 ?auto_360850 ) ) ( ON_BOARD ?auto_360856 ?auto_360852 ) ( not ( = ?auto_360855 ?auto_360856 ) ) ( SUPPORTS ?auto_360856 ?auto_360851 ) ( CALIBRATION_TARGET ?auto_360856 ?auto_360853 ) ( not ( = ?auto_360853 ?auto_360846 ) ) ( ON_BOARD ?auto_360857 ?auto_360852 ) ( not ( = ?auto_360856 ?auto_360857 ) ) ( SUPPORTS ?auto_360857 ?auto_360847 ) ( CALIBRATION_TARGET ?auto_360857 ?auto_360853 ) ( POWER_AVAIL ?auto_360852 ) ( POINTING ?auto_360852 ?auto_360854 ) ( not ( = ?auto_360853 ?auto_360854 ) ) ( not ( = ?auto_360846 ?auto_360854 ) ) ( not ( = ?auto_360847 ?auto_360851 ) ) ( not ( = ?auto_360850 ?auto_360854 ) ) ( not ( = ?auto_360847 ?auto_360849 ) ) ( not ( = ?auto_360851 ?auto_360849 ) ) ( not ( = ?auto_360848 ?auto_360854 ) ) ( not ( = ?auto_360855 ?auto_360857 ) ) ( not ( = ?auto_360847 ?auto_360843 ) ) ( not ( = ?auto_360851 ?auto_360843 ) ) ( not ( = ?auto_360849 ?auto_360843 ) ) ( not ( = ?auto_360842 ?auto_360854 ) ) ( not ( = ?auto_360858 ?auto_360856 ) ) ( not ( = ?auto_360858 ?auto_360857 ) ) ( not ( = ?auto_360847 ?auto_360844 ) ) ( not ( = ?auto_360851 ?auto_360844 ) ) ( not ( = ?auto_360849 ?auto_360844 ) ) ( not ( = ?auto_360843 ?auto_360844 ) ) ( not ( = ?auto_360845 ?auto_360854 ) ) ( not ( = ?auto_360859 ?auto_360855 ) ) ( not ( = ?auto_360859 ?auto_360856 ) ) ( not ( = ?auto_360859 ?auto_360857 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_360846 ?auto_360847 ?auto_360850 ?auto_360851 ?auto_360848 ?auto_360849 ?auto_360845 ?auto_360844 ?auto_360842 ?auto_360843 )
      ( GET-5IMAGE-VERIFY ?auto_360842 ?auto_360843 ?auto_360845 ?auto_360844 ?auto_360846 ?auto_360847 ?auto_360848 ?auto_360849 ?auto_360850 ?auto_360851 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_361172 - DIRECTION
      ?auto_361173 - MODE
      ?auto_361175 - DIRECTION
      ?auto_361174 - MODE
      ?auto_361176 - DIRECTION
      ?auto_361177 - MODE
      ?auto_361178 - DIRECTION
      ?auto_361179 - MODE
      ?auto_361180 - DIRECTION
      ?auto_361181 - MODE
    )
    :vars
    (
      ?auto_361189 - INSTRUMENT
      ?auto_361182 - SATELLITE
      ?auto_361183 - DIRECTION
      ?auto_361188 - INSTRUMENT
      ?auto_361185 - INSTRUMENT
      ?auto_361186 - INSTRUMENT
      ?auto_361187 - INSTRUMENT
      ?auto_361184 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_361175 ?auto_361172 ) ) ( not ( = ?auto_361176 ?auto_361172 ) ) ( not ( = ?auto_361176 ?auto_361175 ) ) ( not ( = ?auto_361178 ?auto_361172 ) ) ( not ( = ?auto_361178 ?auto_361175 ) ) ( not ( = ?auto_361178 ?auto_361176 ) ) ( not ( = ?auto_361180 ?auto_361172 ) ) ( not ( = ?auto_361180 ?auto_361175 ) ) ( not ( = ?auto_361180 ?auto_361176 ) ) ( not ( = ?auto_361180 ?auto_361178 ) ) ( ON_BOARD ?auto_361189 ?auto_361182 ) ( SUPPORTS ?auto_361189 ?auto_361174 ) ( not ( = ?auto_361175 ?auto_361183 ) ) ( CALIBRATION_TARGET ?auto_361189 ?auto_361183 ) ( not ( = ?auto_361183 ?auto_361172 ) ) ( ON_BOARD ?auto_361188 ?auto_361182 ) ( not ( = ?auto_361189 ?auto_361188 ) ) ( SUPPORTS ?auto_361188 ?auto_361173 ) ( CALIBRATION_TARGET ?auto_361188 ?auto_361183 ) ( not ( = ?auto_361183 ?auto_361180 ) ) ( ON_BOARD ?auto_361185 ?auto_361182 ) ( not ( = ?auto_361188 ?auto_361185 ) ) ( SUPPORTS ?auto_361185 ?auto_361181 ) ( CALIBRATION_TARGET ?auto_361185 ?auto_361183 ) ( not ( = ?auto_361183 ?auto_361176 ) ) ( ON_BOARD ?auto_361186 ?auto_361182 ) ( not ( = ?auto_361185 ?auto_361186 ) ) ( SUPPORTS ?auto_361186 ?auto_361177 ) ( CALIBRATION_TARGET ?auto_361186 ?auto_361183 ) ( not ( = ?auto_361183 ?auto_361178 ) ) ( ON_BOARD ?auto_361187 ?auto_361182 ) ( not ( = ?auto_361186 ?auto_361187 ) ) ( SUPPORTS ?auto_361187 ?auto_361179 ) ( CALIBRATION_TARGET ?auto_361187 ?auto_361183 ) ( POWER_AVAIL ?auto_361182 ) ( POINTING ?auto_361182 ?auto_361184 ) ( not ( = ?auto_361183 ?auto_361184 ) ) ( not ( = ?auto_361178 ?auto_361184 ) ) ( not ( = ?auto_361179 ?auto_361177 ) ) ( not ( = ?auto_361176 ?auto_361184 ) ) ( not ( = ?auto_361179 ?auto_361181 ) ) ( not ( = ?auto_361177 ?auto_361181 ) ) ( not ( = ?auto_361180 ?auto_361184 ) ) ( not ( = ?auto_361185 ?auto_361187 ) ) ( not ( = ?auto_361179 ?auto_361173 ) ) ( not ( = ?auto_361177 ?auto_361173 ) ) ( not ( = ?auto_361181 ?auto_361173 ) ) ( not ( = ?auto_361172 ?auto_361184 ) ) ( not ( = ?auto_361188 ?auto_361186 ) ) ( not ( = ?auto_361188 ?auto_361187 ) ) ( not ( = ?auto_361179 ?auto_361174 ) ) ( not ( = ?auto_361177 ?auto_361174 ) ) ( not ( = ?auto_361181 ?auto_361174 ) ) ( not ( = ?auto_361173 ?auto_361174 ) ) ( not ( = ?auto_361175 ?auto_361184 ) ) ( not ( = ?auto_361189 ?auto_361185 ) ) ( not ( = ?auto_361189 ?auto_361186 ) ) ( not ( = ?auto_361189 ?auto_361187 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_361178 ?auto_361179 ?auto_361176 ?auto_361177 ?auto_361180 ?auto_361181 ?auto_361175 ?auto_361174 ?auto_361172 ?auto_361173 )
      ( GET-5IMAGE-VERIFY ?auto_361172 ?auto_361173 ?auto_361175 ?auto_361174 ?auto_361176 ?auto_361177 ?auto_361178 ?auto_361179 ?auto_361180 ?auto_361181 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_361336 - DIRECTION
      ?auto_361337 - MODE
      ?auto_361339 - DIRECTION
      ?auto_361338 - MODE
      ?auto_361340 - DIRECTION
      ?auto_361341 - MODE
      ?auto_361342 - DIRECTION
      ?auto_361343 - MODE
      ?auto_361344 - DIRECTION
      ?auto_361345 - MODE
    )
    :vars
    (
      ?auto_361353 - INSTRUMENT
      ?auto_361346 - SATELLITE
      ?auto_361347 - DIRECTION
      ?auto_361352 - INSTRUMENT
      ?auto_361349 - INSTRUMENT
      ?auto_361350 - INSTRUMENT
      ?auto_361351 - INSTRUMENT
      ?auto_361348 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_361339 ?auto_361336 ) ) ( not ( = ?auto_361340 ?auto_361336 ) ) ( not ( = ?auto_361340 ?auto_361339 ) ) ( not ( = ?auto_361342 ?auto_361336 ) ) ( not ( = ?auto_361342 ?auto_361339 ) ) ( not ( = ?auto_361342 ?auto_361340 ) ) ( not ( = ?auto_361344 ?auto_361336 ) ) ( not ( = ?auto_361344 ?auto_361339 ) ) ( not ( = ?auto_361344 ?auto_361340 ) ) ( not ( = ?auto_361344 ?auto_361342 ) ) ( ON_BOARD ?auto_361353 ?auto_361346 ) ( SUPPORTS ?auto_361353 ?auto_361338 ) ( not ( = ?auto_361339 ?auto_361347 ) ) ( CALIBRATION_TARGET ?auto_361353 ?auto_361347 ) ( not ( = ?auto_361347 ?auto_361336 ) ) ( ON_BOARD ?auto_361352 ?auto_361346 ) ( not ( = ?auto_361353 ?auto_361352 ) ) ( SUPPORTS ?auto_361352 ?auto_361337 ) ( CALIBRATION_TARGET ?auto_361352 ?auto_361347 ) ( not ( = ?auto_361347 ?auto_361342 ) ) ( ON_BOARD ?auto_361349 ?auto_361346 ) ( not ( = ?auto_361352 ?auto_361349 ) ) ( SUPPORTS ?auto_361349 ?auto_361343 ) ( CALIBRATION_TARGET ?auto_361349 ?auto_361347 ) ( not ( = ?auto_361347 ?auto_361340 ) ) ( ON_BOARD ?auto_361350 ?auto_361346 ) ( not ( = ?auto_361349 ?auto_361350 ) ) ( SUPPORTS ?auto_361350 ?auto_361341 ) ( CALIBRATION_TARGET ?auto_361350 ?auto_361347 ) ( not ( = ?auto_361347 ?auto_361344 ) ) ( ON_BOARD ?auto_361351 ?auto_361346 ) ( not ( = ?auto_361350 ?auto_361351 ) ) ( SUPPORTS ?auto_361351 ?auto_361345 ) ( CALIBRATION_TARGET ?auto_361351 ?auto_361347 ) ( POWER_AVAIL ?auto_361346 ) ( POINTING ?auto_361346 ?auto_361348 ) ( not ( = ?auto_361347 ?auto_361348 ) ) ( not ( = ?auto_361344 ?auto_361348 ) ) ( not ( = ?auto_361345 ?auto_361341 ) ) ( not ( = ?auto_361340 ?auto_361348 ) ) ( not ( = ?auto_361345 ?auto_361343 ) ) ( not ( = ?auto_361341 ?auto_361343 ) ) ( not ( = ?auto_361342 ?auto_361348 ) ) ( not ( = ?auto_361349 ?auto_361351 ) ) ( not ( = ?auto_361345 ?auto_361337 ) ) ( not ( = ?auto_361341 ?auto_361337 ) ) ( not ( = ?auto_361343 ?auto_361337 ) ) ( not ( = ?auto_361336 ?auto_361348 ) ) ( not ( = ?auto_361352 ?auto_361350 ) ) ( not ( = ?auto_361352 ?auto_361351 ) ) ( not ( = ?auto_361345 ?auto_361338 ) ) ( not ( = ?auto_361341 ?auto_361338 ) ) ( not ( = ?auto_361343 ?auto_361338 ) ) ( not ( = ?auto_361337 ?auto_361338 ) ) ( not ( = ?auto_361339 ?auto_361348 ) ) ( not ( = ?auto_361353 ?auto_361349 ) ) ( not ( = ?auto_361353 ?auto_361350 ) ) ( not ( = ?auto_361353 ?auto_361351 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_361344 ?auto_361345 ?auto_361340 ?auto_361341 ?auto_361342 ?auto_361343 ?auto_361339 ?auto_361338 ?auto_361336 ?auto_361337 )
      ( GET-5IMAGE-VERIFY ?auto_361336 ?auto_361337 ?auto_361339 ?auto_361338 ?auto_361340 ?auto_361341 ?auto_361342 ?auto_361343 ?auto_361344 ?auto_361345 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_361666 - DIRECTION
      ?auto_361667 - MODE
      ?auto_361669 - DIRECTION
      ?auto_361668 - MODE
      ?auto_361670 - DIRECTION
      ?auto_361671 - MODE
      ?auto_361672 - DIRECTION
      ?auto_361673 - MODE
      ?auto_361674 - DIRECTION
      ?auto_361675 - MODE
    )
    :vars
    (
      ?auto_361683 - INSTRUMENT
      ?auto_361676 - SATELLITE
      ?auto_361677 - DIRECTION
      ?auto_361682 - INSTRUMENT
      ?auto_361679 - INSTRUMENT
      ?auto_361680 - INSTRUMENT
      ?auto_361681 - INSTRUMENT
      ?auto_361678 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_361669 ?auto_361666 ) ) ( not ( = ?auto_361670 ?auto_361666 ) ) ( not ( = ?auto_361670 ?auto_361669 ) ) ( not ( = ?auto_361672 ?auto_361666 ) ) ( not ( = ?auto_361672 ?auto_361669 ) ) ( not ( = ?auto_361672 ?auto_361670 ) ) ( not ( = ?auto_361674 ?auto_361666 ) ) ( not ( = ?auto_361674 ?auto_361669 ) ) ( not ( = ?auto_361674 ?auto_361670 ) ) ( not ( = ?auto_361674 ?auto_361672 ) ) ( ON_BOARD ?auto_361683 ?auto_361676 ) ( SUPPORTS ?auto_361683 ?auto_361668 ) ( not ( = ?auto_361669 ?auto_361677 ) ) ( CALIBRATION_TARGET ?auto_361683 ?auto_361677 ) ( not ( = ?auto_361677 ?auto_361666 ) ) ( ON_BOARD ?auto_361682 ?auto_361676 ) ( not ( = ?auto_361683 ?auto_361682 ) ) ( SUPPORTS ?auto_361682 ?auto_361667 ) ( CALIBRATION_TARGET ?auto_361682 ?auto_361677 ) ( not ( = ?auto_361677 ?auto_361670 ) ) ( ON_BOARD ?auto_361679 ?auto_361676 ) ( not ( = ?auto_361682 ?auto_361679 ) ) ( SUPPORTS ?auto_361679 ?auto_361671 ) ( CALIBRATION_TARGET ?auto_361679 ?auto_361677 ) ( not ( = ?auto_361677 ?auto_361674 ) ) ( ON_BOARD ?auto_361680 ?auto_361676 ) ( not ( = ?auto_361679 ?auto_361680 ) ) ( SUPPORTS ?auto_361680 ?auto_361675 ) ( CALIBRATION_TARGET ?auto_361680 ?auto_361677 ) ( not ( = ?auto_361677 ?auto_361672 ) ) ( ON_BOARD ?auto_361681 ?auto_361676 ) ( not ( = ?auto_361680 ?auto_361681 ) ) ( SUPPORTS ?auto_361681 ?auto_361673 ) ( CALIBRATION_TARGET ?auto_361681 ?auto_361677 ) ( POWER_AVAIL ?auto_361676 ) ( POINTING ?auto_361676 ?auto_361678 ) ( not ( = ?auto_361677 ?auto_361678 ) ) ( not ( = ?auto_361672 ?auto_361678 ) ) ( not ( = ?auto_361673 ?auto_361675 ) ) ( not ( = ?auto_361674 ?auto_361678 ) ) ( not ( = ?auto_361673 ?auto_361671 ) ) ( not ( = ?auto_361675 ?auto_361671 ) ) ( not ( = ?auto_361670 ?auto_361678 ) ) ( not ( = ?auto_361679 ?auto_361681 ) ) ( not ( = ?auto_361673 ?auto_361667 ) ) ( not ( = ?auto_361675 ?auto_361667 ) ) ( not ( = ?auto_361671 ?auto_361667 ) ) ( not ( = ?auto_361666 ?auto_361678 ) ) ( not ( = ?auto_361682 ?auto_361680 ) ) ( not ( = ?auto_361682 ?auto_361681 ) ) ( not ( = ?auto_361673 ?auto_361668 ) ) ( not ( = ?auto_361675 ?auto_361668 ) ) ( not ( = ?auto_361671 ?auto_361668 ) ) ( not ( = ?auto_361667 ?auto_361668 ) ) ( not ( = ?auto_361669 ?auto_361678 ) ) ( not ( = ?auto_361683 ?auto_361679 ) ) ( not ( = ?auto_361683 ?auto_361680 ) ) ( not ( = ?auto_361683 ?auto_361681 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_361672 ?auto_361673 ?auto_361674 ?auto_361675 ?auto_361670 ?auto_361671 ?auto_361669 ?auto_361668 ?auto_361666 ?auto_361667 )
      ( GET-5IMAGE-VERIFY ?auto_361666 ?auto_361667 ?auto_361669 ?auto_361668 ?auto_361670 ?auto_361671 ?auto_361672 ?auto_361673 ?auto_361674 ?auto_361675 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_361744 - DIRECTION
      ?auto_361745 - MODE
      ?auto_361747 - DIRECTION
      ?auto_361746 - MODE
      ?auto_361748 - DIRECTION
      ?auto_361749 - MODE
      ?auto_361750 - DIRECTION
      ?auto_361751 - MODE
      ?auto_361752 - DIRECTION
      ?auto_361753 - MODE
    )
    :vars
    (
      ?auto_361761 - INSTRUMENT
      ?auto_361754 - SATELLITE
      ?auto_361755 - DIRECTION
      ?auto_361760 - INSTRUMENT
      ?auto_361757 - INSTRUMENT
      ?auto_361758 - INSTRUMENT
      ?auto_361759 - INSTRUMENT
      ?auto_361756 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_361747 ?auto_361744 ) ) ( not ( = ?auto_361748 ?auto_361744 ) ) ( not ( = ?auto_361748 ?auto_361747 ) ) ( not ( = ?auto_361750 ?auto_361744 ) ) ( not ( = ?auto_361750 ?auto_361747 ) ) ( not ( = ?auto_361750 ?auto_361748 ) ) ( not ( = ?auto_361752 ?auto_361744 ) ) ( not ( = ?auto_361752 ?auto_361747 ) ) ( not ( = ?auto_361752 ?auto_361748 ) ) ( not ( = ?auto_361752 ?auto_361750 ) ) ( ON_BOARD ?auto_361761 ?auto_361754 ) ( SUPPORTS ?auto_361761 ?auto_361746 ) ( not ( = ?auto_361747 ?auto_361755 ) ) ( CALIBRATION_TARGET ?auto_361761 ?auto_361755 ) ( not ( = ?auto_361755 ?auto_361744 ) ) ( ON_BOARD ?auto_361760 ?auto_361754 ) ( not ( = ?auto_361761 ?auto_361760 ) ) ( SUPPORTS ?auto_361760 ?auto_361745 ) ( CALIBRATION_TARGET ?auto_361760 ?auto_361755 ) ( not ( = ?auto_361755 ?auto_361748 ) ) ( ON_BOARD ?auto_361757 ?auto_361754 ) ( not ( = ?auto_361760 ?auto_361757 ) ) ( SUPPORTS ?auto_361757 ?auto_361749 ) ( CALIBRATION_TARGET ?auto_361757 ?auto_361755 ) ( not ( = ?auto_361755 ?auto_361750 ) ) ( ON_BOARD ?auto_361758 ?auto_361754 ) ( not ( = ?auto_361757 ?auto_361758 ) ) ( SUPPORTS ?auto_361758 ?auto_361751 ) ( CALIBRATION_TARGET ?auto_361758 ?auto_361755 ) ( not ( = ?auto_361755 ?auto_361752 ) ) ( ON_BOARD ?auto_361759 ?auto_361754 ) ( not ( = ?auto_361758 ?auto_361759 ) ) ( SUPPORTS ?auto_361759 ?auto_361753 ) ( CALIBRATION_TARGET ?auto_361759 ?auto_361755 ) ( POWER_AVAIL ?auto_361754 ) ( POINTING ?auto_361754 ?auto_361756 ) ( not ( = ?auto_361755 ?auto_361756 ) ) ( not ( = ?auto_361752 ?auto_361756 ) ) ( not ( = ?auto_361753 ?auto_361751 ) ) ( not ( = ?auto_361750 ?auto_361756 ) ) ( not ( = ?auto_361753 ?auto_361749 ) ) ( not ( = ?auto_361751 ?auto_361749 ) ) ( not ( = ?auto_361748 ?auto_361756 ) ) ( not ( = ?auto_361757 ?auto_361759 ) ) ( not ( = ?auto_361753 ?auto_361745 ) ) ( not ( = ?auto_361751 ?auto_361745 ) ) ( not ( = ?auto_361749 ?auto_361745 ) ) ( not ( = ?auto_361744 ?auto_361756 ) ) ( not ( = ?auto_361760 ?auto_361758 ) ) ( not ( = ?auto_361760 ?auto_361759 ) ) ( not ( = ?auto_361753 ?auto_361746 ) ) ( not ( = ?auto_361751 ?auto_361746 ) ) ( not ( = ?auto_361749 ?auto_361746 ) ) ( not ( = ?auto_361745 ?auto_361746 ) ) ( not ( = ?auto_361747 ?auto_361756 ) ) ( not ( = ?auto_361761 ?auto_361757 ) ) ( not ( = ?auto_361761 ?auto_361758 ) ) ( not ( = ?auto_361761 ?auto_361759 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_361752 ?auto_361753 ?auto_361750 ?auto_361751 ?auto_361748 ?auto_361749 ?auto_361747 ?auto_361746 ?auto_361744 ?auto_361745 )
      ( GET-5IMAGE-VERIFY ?auto_361744 ?auto_361745 ?auto_361747 ?auto_361746 ?auto_361748 ?auto_361749 ?auto_361750 ?auto_361751 ?auto_361752 ?auto_361753 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_364070 - DIRECTION
      ?auto_364071 - MODE
      ?auto_364073 - DIRECTION
      ?auto_364072 - MODE
      ?auto_364074 - DIRECTION
      ?auto_364075 - MODE
      ?auto_364076 - DIRECTION
      ?auto_364077 - MODE
      ?auto_364078 - DIRECTION
      ?auto_364079 - MODE
    )
    :vars
    (
      ?auto_364087 - INSTRUMENT
      ?auto_364080 - SATELLITE
      ?auto_364081 - DIRECTION
      ?auto_364086 - INSTRUMENT
      ?auto_364083 - INSTRUMENT
      ?auto_364084 - INSTRUMENT
      ?auto_364085 - INSTRUMENT
      ?auto_364082 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_364073 ?auto_364070 ) ) ( not ( = ?auto_364074 ?auto_364070 ) ) ( not ( = ?auto_364074 ?auto_364073 ) ) ( not ( = ?auto_364076 ?auto_364070 ) ) ( not ( = ?auto_364076 ?auto_364073 ) ) ( not ( = ?auto_364076 ?auto_364074 ) ) ( not ( = ?auto_364078 ?auto_364070 ) ) ( not ( = ?auto_364078 ?auto_364073 ) ) ( not ( = ?auto_364078 ?auto_364074 ) ) ( not ( = ?auto_364078 ?auto_364076 ) ) ( ON_BOARD ?auto_364087 ?auto_364080 ) ( SUPPORTS ?auto_364087 ?auto_364071 ) ( not ( = ?auto_364070 ?auto_364081 ) ) ( CALIBRATION_TARGET ?auto_364087 ?auto_364081 ) ( not ( = ?auto_364081 ?auto_364078 ) ) ( ON_BOARD ?auto_364086 ?auto_364080 ) ( not ( = ?auto_364087 ?auto_364086 ) ) ( SUPPORTS ?auto_364086 ?auto_364079 ) ( CALIBRATION_TARGET ?auto_364086 ?auto_364081 ) ( not ( = ?auto_364081 ?auto_364076 ) ) ( ON_BOARD ?auto_364083 ?auto_364080 ) ( not ( = ?auto_364086 ?auto_364083 ) ) ( SUPPORTS ?auto_364083 ?auto_364077 ) ( CALIBRATION_TARGET ?auto_364083 ?auto_364081 ) ( not ( = ?auto_364081 ?auto_364074 ) ) ( ON_BOARD ?auto_364084 ?auto_364080 ) ( not ( = ?auto_364083 ?auto_364084 ) ) ( SUPPORTS ?auto_364084 ?auto_364075 ) ( CALIBRATION_TARGET ?auto_364084 ?auto_364081 ) ( not ( = ?auto_364081 ?auto_364073 ) ) ( ON_BOARD ?auto_364085 ?auto_364080 ) ( not ( = ?auto_364084 ?auto_364085 ) ) ( SUPPORTS ?auto_364085 ?auto_364072 ) ( CALIBRATION_TARGET ?auto_364085 ?auto_364081 ) ( POWER_AVAIL ?auto_364080 ) ( POINTING ?auto_364080 ?auto_364082 ) ( not ( = ?auto_364081 ?auto_364082 ) ) ( not ( = ?auto_364073 ?auto_364082 ) ) ( not ( = ?auto_364072 ?auto_364075 ) ) ( not ( = ?auto_364074 ?auto_364082 ) ) ( not ( = ?auto_364072 ?auto_364077 ) ) ( not ( = ?auto_364075 ?auto_364077 ) ) ( not ( = ?auto_364076 ?auto_364082 ) ) ( not ( = ?auto_364083 ?auto_364085 ) ) ( not ( = ?auto_364072 ?auto_364079 ) ) ( not ( = ?auto_364075 ?auto_364079 ) ) ( not ( = ?auto_364077 ?auto_364079 ) ) ( not ( = ?auto_364078 ?auto_364082 ) ) ( not ( = ?auto_364086 ?auto_364084 ) ) ( not ( = ?auto_364086 ?auto_364085 ) ) ( not ( = ?auto_364072 ?auto_364071 ) ) ( not ( = ?auto_364075 ?auto_364071 ) ) ( not ( = ?auto_364077 ?auto_364071 ) ) ( not ( = ?auto_364079 ?auto_364071 ) ) ( not ( = ?auto_364070 ?auto_364082 ) ) ( not ( = ?auto_364087 ?auto_364083 ) ) ( not ( = ?auto_364087 ?auto_364084 ) ) ( not ( = ?auto_364087 ?auto_364085 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_364073 ?auto_364072 ?auto_364074 ?auto_364075 ?auto_364076 ?auto_364077 ?auto_364070 ?auto_364071 ?auto_364078 ?auto_364079 )
      ( GET-5IMAGE-VERIFY ?auto_364070 ?auto_364071 ?auto_364073 ?auto_364072 ?auto_364074 ?auto_364075 ?auto_364076 ?auto_364077 ?auto_364078 ?auto_364079 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_364148 - DIRECTION
      ?auto_364149 - MODE
      ?auto_364151 - DIRECTION
      ?auto_364150 - MODE
      ?auto_364152 - DIRECTION
      ?auto_364153 - MODE
      ?auto_364154 - DIRECTION
      ?auto_364155 - MODE
      ?auto_364156 - DIRECTION
      ?auto_364157 - MODE
    )
    :vars
    (
      ?auto_364165 - INSTRUMENT
      ?auto_364158 - SATELLITE
      ?auto_364159 - DIRECTION
      ?auto_364164 - INSTRUMENT
      ?auto_364161 - INSTRUMENT
      ?auto_364162 - INSTRUMENT
      ?auto_364163 - INSTRUMENT
      ?auto_364160 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_364151 ?auto_364148 ) ) ( not ( = ?auto_364152 ?auto_364148 ) ) ( not ( = ?auto_364152 ?auto_364151 ) ) ( not ( = ?auto_364154 ?auto_364148 ) ) ( not ( = ?auto_364154 ?auto_364151 ) ) ( not ( = ?auto_364154 ?auto_364152 ) ) ( not ( = ?auto_364156 ?auto_364148 ) ) ( not ( = ?auto_364156 ?auto_364151 ) ) ( not ( = ?auto_364156 ?auto_364152 ) ) ( not ( = ?auto_364156 ?auto_364154 ) ) ( ON_BOARD ?auto_364165 ?auto_364158 ) ( SUPPORTS ?auto_364165 ?auto_364149 ) ( not ( = ?auto_364148 ?auto_364159 ) ) ( CALIBRATION_TARGET ?auto_364165 ?auto_364159 ) ( not ( = ?auto_364159 ?auto_364154 ) ) ( ON_BOARD ?auto_364164 ?auto_364158 ) ( not ( = ?auto_364165 ?auto_364164 ) ) ( SUPPORTS ?auto_364164 ?auto_364155 ) ( CALIBRATION_TARGET ?auto_364164 ?auto_364159 ) ( not ( = ?auto_364159 ?auto_364156 ) ) ( ON_BOARD ?auto_364161 ?auto_364158 ) ( not ( = ?auto_364164 ?auto_364161 ) ) ( SUPPORTS ?auto_364161 ?auto_364157 ) ( CALIBRATION_TARGET ?auto_364161 ?auto_364159 ) ( not ( = ?auto_364159 ?auto_364152 ) ) ( ON_BOARD ?auto_364162 ?auto_364158 ) ( not ( = ?auto_364161 ?auto_364162 ) ) ( SUPPORTS ?auto_364162 ?auto_364153 ) ( CALIBRATION_TARGET ?auto_364162 ?auto_364159 ) ( not ( = ?auto_364159 ?auto_364151 ) ) ( ON_BOARD ?auto_364163 ?auto_364158 ) ( not ( = ?auto_364162 ?auto_364163 ) ) ( SUPPORTS ?auto_364163 ?auto_364150 ) ( CALIBRATION_TARGET ?auto_364163 ?auto_364159 ) ( POWER_AVAIL ?auto_364158 ) ( POINTING ?auto_364158 ?auto_364160 ) ( not ( = ?auto_364159 ?auto_364160 ) ) ( not ( = ?auto_364151 ?auto_364160 ) ) ( not ( = ?auto_364150 ?auto_364153 ) ) ( not ( = ?auto_364152 ?auto_364160 ) ) ( not ( = ?auto_364150 ?auto_364157 ) ) ( not ( = ?auto_364153 ?auto_364157 ) ) ( not ( = ?auto_364156 ?auto_364160 ) ) ( not ( = ?auto_364161 ?auto_364163 ) ) ( not ( = ?auto_364150 ?auto_364155 ) ) ( not ( = ?auto_364153 ?auto_364155 ) ) ( not ( = ?auto_364157 ?auto_364155 ) ) ( not ( = ?auto_364154 ?auto_364160 ) ) ( not ( = ?auto_364164 ?auto_364162 ) ) ( not ( = ?auto_364164 ?auto_364163 ) ) ( not ( = ?auto_364150 ?auto_364149 ) ) ( not ( = ?auto_364153 ?auto_364149 ) ) ( not ( = ?auto_364157 ?auto_364149 ) ) ( not ( = ?auto_364155 ?auto_364149 ) ) ( not ( = ?auto_364148 ?auto_364160 ) ) ( not ( = ?auto_364165 ?auto_364161 ) ) ( not ( = ?auto_364165 ?auto_364162 ) ) ( not ( = ?auto_364165 ?auto_364163 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_364151 ?auto_364150 ?auto_364152 ?auto_364153 ?auto_364156 ?auto_364157 ?auto_364148 ?auto_364149 ?auto_364154 ?auto_364155 )
      ( GET-5IMAGE-VERIFY ?auto_364148 ?auto_364149 ?auto_364151 ?auto_364150 ?auto_364152 ?auto_364153 ?auto_364154 ?auto_364155 ?auto_364156 ?auto_364157 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_364478 - DIRECTION
      ?auto_364479 - MODE
      ?auto_364481 - DIRECTION
      ?auto_364480 - MODE
      ?auto_364482 - DIRECTION
      ?auto_364483 - MODE
      ?auto_364484 - DIRECTION
      ?auto_364485 - MODE
      ?auto_364486 - DIRECTION
      ?auto_364487 - MODE
    )
    :vars
    (
      ?auto_364495 - INSTRUMENT
      ?auto_364488 - SATELLITE
      ?auto_364489 - DIRECTION
      ?auto_364494 - INSTRUMENT
      ?auto_364491 - INSTRUMENT
      ?auto_364492 - INSTRUMENT
      ?auto_364493 - INSTRUMENT
      ?auto_364490 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_364481 ?auto_364478 ) ) ( not ( = ?auto_364482 ?auto_364478 ) ) ( not ( = ?auto_364482 ?auto_364481 ) ) ( not ( = ?auto_364484 ?auto_364478 ) ) ( not ( = ?auto_364484 ?auto_364481 ) ) ( not ( = ?auto_364484 ?auto_364482 ) ) ( not ( = ?auto_364486 ?auto_364478 ) ) ( not ( = ?auto_364486 ?auto_364481 ) ) ( not ( = ?auto_364486 ?auto_364482 ) ) ( not ( = ?auto_364486 ?auto_364484 ) ) ( ON_BOARD ?auto_364495 ?auto_364488 ) ( SUPPORTS ?auto_364495 ?auto_364479 ) ( not ( = ?auto_364478 ?auto_364489 ) ) ( CALIBRATION_TARGET ?auto_364495 ?auto_364489 ) ( not ( = ?auto_364489 ?auto_364486 ) ) ( ON_BOARD ?auto_364494 ?auto_364488 ) ( not ( = ?auto_364495 ?auto_364494 ) ) ( SUPPORTS ?auto_364494 ?auto_364487 ) ( CALIBRATION_TARGET ?auto_364494 ?auto_364489 ) ( not ( = ?auto_364489 ?auto_364482 ) ) ( ON_BOARD ?auto_364491 ?auto_364488 ) ( not ( = ?auto_364494 ?auto_364491 ) ) ( SUPPORTS ?auto_364491 ?auto_364483 ) ( CALIBRATION_TARGET ?auto_364491 ?auto_364489 ) ( not ( = ?auto_364489 ?auto_364484 ) ) ( ON_BOARD ?auto_364492 ?auto_364488 ) ( not ( = ?auto_364491 ?auto_364492 ) ) ( SUPPORTS ?auto_364492 ?auto_364485 ) ( CALIBRATION_TARGET ?auto_364492 ?auto_364489 ) ( not ( = ?auto_364489 ?auto_364481 ) ) ( ON_BOARD ?auto_364493 ?auto_364488 ) ( not ( = ?auto_364492 ?auto_364493 ) ) ( SUPPORTS ?auto_364493 ?auto_364480 ) ( CALIBRATION_TARGET ?auto_364493 ?auto_364489 ) ( POWER_AVAIL ?auto_364488 ) ( POINTING ?auto_364488 ?auto_364490 ) ( not ( = ?auto_364489 ?auto_364490 ) ) ( not ( = ?auto_364481 ?auto_364490 ) ) ( not ( = ?auto_364480 ?auto_364485 ) ) ( not ( = ?auto_364484 ?auto_364490 ) ) ( not ( = ?auto_364480 ?auto_364483 ) ) ( not ( = ?auto_364485 ?auto_364483 ) ) ( not ( = ?auto_364482 ?auto_364490 ) ) ( not ( = ?auto_364491 ?auto_364493 ) ) ( not ( = ?auto_364480 ?auto_364487 ) ) ( not ( = ?auto_364485 ?auto_364487 ) ) ( not ( = ?auto_364483 ?auto_364487 ) ) ( not ( = ?auto_364486 ?auto_364490 ) ) ( not ( = ?auto_364494 ?auto_364492 ) ) ( not ( = ?auto_364494 ?auto_364493 ) ) ( not ( = ?auto_364480 ?auto_364479 ) ) ( not ( = ?auto_364485 ?auto_364479 ) ) ( not ( = ?auto_364483 ?auto_364479 ) ) ( not ( = ?auto_364487 ?auto_364479 ) ) ( not ( = ?auto_364478 ?auto_364490 ) ) ( not ( = ?auto_364495 ?auto_364491 ) ) ( not ( = ?auto_364495 ?auto_364492 ) ) ( not ( = ?auto_364495 ?auto_364493 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_364481 ?auto_364480 ?auto_364484 ?auto_364485 ?auto_364482 ?auto_364483 ?auto_364478 ?auto_364479 ?auto_364486 ?auto_364487 )
      ( GET-5IMAGE-VERIFY ?auto_364478 ?auto_364479 ?auto_364481 ?auto_364480 ?auto_364482 ?auto_364483 ?auto_364484 ?auto_364485 ?auto_364486 ?auto_364487 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_364642 - DIRECTION
      ?auto_364643 - MODE
      ?auto_364645 - DIRECTION
      ?auto_364644 - MODE
      ?auto_364646 - DIRECTION
      ?auto_364647 - MODE
      ?auto_364648 - DIRECTION
      ?auto_364649 - MODE
      ?auto_364650 - DIRECTION
      ?auto_364651 - MODE
    )
    :vars
    (
      ?auto_364659 - INSTRUMENT
      ?auto_364652 - SATELLITE
      ?auto_364653 - DIRECTION
      ?auto_364658 - INSTRUMENT
      ?auto_364655 - INSTRUMENT
      ?auto_364656 - INSTRUMENT
      ?auto_364657 - INSTRUMENT
      ?auto_364654 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_364645 ?auto_364642 ) ) ( not ( = ?auto_364646 ?auto_364642 ) ) ( not ( = ?auto_364646 ?auto_364645 ) ) ( not ( = ?auto_364648 ?auto_364642 ) ) ( not ( = ?auto_364648 ?auto_364645 ) ) ( not ( = ?auto_364648 ?auto_364646 ) ) ( not ( = ?auto_364650 ?auto_364642 ) ) ( not ( = ?auto_364650 ?auto_364645 ) ) ( not ( = ?auto_364650 ?auto_364646 ) ) ( not ( = ?auto_364650 ?auto_364648 ) ) ( ON_BOARD ?auto_364659 ?auto_364652 ) ( SUPPORTS ?auto_364659 ?auto_364643 ) ( not ( = ?auto_364642 ?auto_364653 ) ) ( CALIBRATION_TARGET ?auto_364659 ?auto_364653 ) ( not ( = ?auto_364653 ?auto_364648 ) ) ( ON_BOARD ?auto_364658 ?auto_364652 ) ( not ( = ?auto_364659 ?auto_364658 ) ) ( SUPPORTS ?auto_364658 ?auto_364649 ) ( CALIBRATION_TARGET ?auto_364658 ?auto_364653 ) ( not ( = ?auto_364653 ?auto_364646 ) ) ( ON_BOARD ?auto_364655 ?auto_364652 ) ( not ( = ?auto_364658 ?auto_364655 ) ) ( SUPPORTS ?auto_364655 ?auto_364647 ) ( CALIBRATION_TARGET ?auto_364655 ?auto_364653 ) ( not ( = ?auto_364653 ?auto_364650 ) ) ( ON_BOARD ?auto_364656 ?auto_364652 ) ( not ( = ?auto_364655 ?auto_364656 ) ) ( SUPPORTS ?auto_364656 ?auto_364651 ) ( CALIBRATION_TARGET ?auto_364656 ?auto_364653 ) ( not ( = ?auto_364653 ?auto_364645 ) ) ( ON_BOARD ?auto_364657 ?auto_364652 ) ( not ( = ?auto_364656 ?auto_364657 ) ) ( SUPPORTS ?auto_364657 ?auto_364644 ) ( CALIBRATION_TARGET ?auto_364657 ?auto_364653 ) ( POWER_AVAIL ?auto_364652 ) ( POINTING ?auto_364652 ?auto_364654 ) ( not ( = ?auto_364653 ?auto_364654 ) ) ( not ( = ?auto_364645 ?auto_364654 ) ) ( not ( = ?auto_364644 ?auto_364651 ) ) ( not ( = ?auto_364650 ?auto_364654 ) ) ( not ( = ?auto_364644 ?auto_364647 ) ) ( not ( = ?auto_364651 ?auto_364647 ) ) ( not ( = ?auto_364646 ?auto_364654 ) ) ( not ( = ?auto_364655 ?auto_364657 ) ) ( not ( = ?auto_364644 ?auto_364649 ) ) ( not ( = ?auto_364651 ?auto_364649 ) ) ( not ( = ?auto_364647 ?auto_364649 ) ) ( not ( = ?auto_364648 ?auto_364654 ) ) ( not ( = ?auto_364658 ?auto_364656 ) ) ( not ( = ?auto_364658 ?auto_364657 ) ) ( not ( = ?auto_364644 ?auto_364643 ) ) ( not ( = ?auto_364651 ?auto_364643 ) ) ( not ( = ?auto_364647 ?auto_364643 ) ) ( not ( = ?auto_364649 ?auto_364643 ) ) ( not ( = ?auto_364642 ?auto_364654 ) ) ( not ( = ?auto_364659 ?auto_364655 ) ) ( not ( = ?auto_364659 ?auto_364656 ) ) ( not ( = ?auto_364659 ?auto_364657 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_364645 ?auto_364644 ?auto_364650 ?auto_364651 ?auto_364646 ?auto_364647 ?auto_364642 ?auto_364643 ?auto_364648 ?auto_364649 )
      ( GET-5IMAGE-VERIFY ?auto_364642 ?auto_364643 ?auto_364645 ?auto_364644 ?auto_364646 ?auto_364647 ?auto_364648 ?auto_364649 ?auto_364650 ?auto_364651 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_364972 - DIRECTION
      ?auto_364973 - MODE
      ?auto_364975 - DIRECTION
      ?auto_364974 - MODE
      ?auto_364976 - DIRECTION
      ?auto_364977 - MODE
      ?auto_364978 - DIRECTION
      ?auto_364979 - MODE
      ?auto_364980 - DIRECTION
      ?auto_364981 - MODE
    )
    :vars
    (
      ?auto_364989 - INSTRUMENT
      ?auto_364982 - SATELLITE
      ?auto_364983 - DIRECTION
      ?auto_364988 - INSTRUMENT
      ?auto_364985 - INSTRUMENT
      ?auto_364986 - INSTRUMENT
      ?auto_364987 - INSTRUMENT
      ?auto_364984 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_364975 ?auto_364972 ) ) ( not ( = ?auto_364976 ?auto_364972 ) ) ( not ( = ?auto_364976 ?auto_364975 ) ) ( not ( = ?auto_364978 ?auto_364972 ) ) ( not ( = ?auto_364978 ?auto_364975 ) ) ( not ( = ?auto_364978 ?auto_364976 ) ) ( not ( = ?auto_364980 ?auto_364972 ) ) ( not ( = ?auto_364980 ?auto_364975 ) ) ( not ( = ?auto_364980 ?auto_364976 ) ) ( not ( = ?auto_364980 ?auto_364978 ) ) ( ON_BOARD ?auto_364989 ?auto_364982 ) ( SUPPORTS ?auto_364989 ?auto_364973 ) ( not ( = ?auto_364972 ?auto_364983 ) ) ( CALIBRATION_TARGET ?auto_364989 ?auto_364983 ) ( not ( = ?auto_364983 ?auto_364976 ) ) ( ON_BOARD ?auto_364988 ?auto_364982 ) ( not ( = ?auto_364989 ?auto_364988 ) ) ( SUPPORTS ?auto_364988 ?auto_364977 ) ( CALIBRATION_TARGET ?auto_364988 ?auto_364983 ) ( not ( = ?auto_364983 ?auto_364980 ) ) ( ON_BOARD ?auto_364985 ?auto_364982 ) ( not ( = ?auto_364988 ?auto_364985 ) ) ( SUPPORTS ?auto_364985 ?auto_364981 ) ( CALIBRATION_TARGET ?auto_364985 ?auto_364983 ) ( not ( = ?auto_364983 ?auto_364978 ) ) ( ON_BOARD ?auto_364986 ?auto_364982 ) ( not ( = ?auto_364985 ?auto_364986 ) ) ( SUPPORTS ?auto_364986 ?auto_364979 ) ( CALIBRATION_TARGET ?auto_364986 ?auto_364983 ) ( not ( = ?auto_364983 ?auto_364975 ) ) ( ON_BOARD ?auto_364987 ?auto_364982 ) ( not ( = ?auto_364986 ?auto_364987 ) ) ( SUPPORTS ?auto_364987 ?auto_364974 ) ( CALIBRATION_TARGET ?auto_364987 ?auto_364983 ) ( POWER_AVAIL ?auto_364982 ) ( POINTING ?auto_364982 ?auto_364984 ) ( not ( = ?auto_364983 ?auto_364984 ) ) ( not ( = ?auto_364975 ?auto_364984 ) ) ( not ( = ?auto_364974 ?auto_364979 ) ) ( not ( = ?auto_364978 ?auto_364984 ) ) ( not ( = ?auto_364974 ?auto_364981 ) ) ( not ( = ?auto_364979 ?auto_364981 ) ) ( not ( = ?auto_364980 ?auto_364984 ) ) ( not ( = ?auto_364985 ?auto_364987 ) ) ( not ( = ?auto_364974 ?auto_364977 ) ) ( not ( = ?auto_364979 ?auto_364977 ) ) ( not ( = ?auto_364981 ?auto_364977 ) ) ( not ( = ?auto_364976 ?auto_364984 ) ) ( not ( = ?auto_364988 ?auto_364986 ) ) ( not ( = ?auto_364988 ?auto_364987 ) ) ( not ( = ?auto_364974 ?auto_364973 ) ) ( not ( = ?auto_364979 ?auto_364973 ) ) ( not ( = ?auto_364981 ?auto_364973 ) ) ( not ( = ?auto_364977 ?auto_364973 ) ) ( not ( = ?auto_364972 ?auto_364984 ) ) ( not ( = ?auto_364989 ?auto_364985 ) ) ( not ( = ?auto_364989 ?auto_364986 ) ) ( not ( = ?auto_364989 ?auto_364987 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_364975 ?auto_364974 ?auto_364978 ?auto_364979 ?auto_364980 ?auto_364981 ?auto_364972 ?auto_364973 ?auto_364976 ?auto_364977 )
      ( GET-5IMAGE-VERIFY ?auto_364972 ?auto_364973 ?auto_364975 ?auto_364974 ?auto_364976 ?auto_364977 ?auto_364978 ?auto_364979 ?auto_364980 ?auto_364981 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_365050 - DIRECTION
      ?auto_365051 - MODE
      ?auto_365053 - DIRECTION
      ?auto_365052 - MODE
      ?auto_365054 - DIRECTION
      ?auto_365055 - MODE
      ?auto_365056 - DIRECTION
      ?auto_365057 - MODE
      ?auto_365058 - DIRECTION
      ?auto_365059 - MODE
    )
    :vars
    (
      ?auto_365067 - INSTRUMENT
      ?auto_365060 - SATELLITE
      ?auto_365061 - DIRECTION
      ?auto_365066 - INSTRUMENT
      ?auto_365063 - INSTRUMENT
      ?auto_365064 - INSTRUMENT
      ?auto_365065 - INSTRUMENT
      ?auto_365062 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_365053 ?auto_365050 ) ) ( not ( = ?auto_365054 ?auto_365050 ) ) ( not ( = ?auto_365054 ?auto_365053 ) ) ( not ( = ?auto_365056 ?auto_365050 ) ) ( not ( = ?auto_365056 ?auto_365053 ) ) ( not ( = ?auto_365056 ?auto_365054 ) ) ( not ( = ?auto_365058 ?auto_365050 ) ) ( not ( = ?auto_365058 ?auto_365053 ) ) ( not ( = ?auto_365058 ?auto_365054 ) ) ( not ( = ?auto_365058 ?auto_365056 ) ) ( ON_BOARD ?auto_365067 ?auto_365060 ) ( SUPPORTS ?auto_365067 ?auto_365051 ) ( not ( = ?auto_365050 ?auto_365061 ) ) ( CALIBRATION_TARGET ?auto_365067 ?auto_365061 ) ( not ( = ?auto_365061 ?auto_365054 ) ) ( ON_BOARD ?auto_365066 ?auto_365060 ) ( not ( = ?auto_365067 ?auto_365066 ) ) ( SUPPORTS ?auto_365066 ?auto_365055 ) ( CALIBRATION_TARGET ?auto_365066 ?auto_365061 ) ( not ( = ?auto_365061 ?auto_365056 ) ) ( ON_BOARD ?auto_365063 ?auto_365060 ) ( not ( = ?auto_365066 ?auto_365063 ) ) ( SUPPORTS ?auto_365063 ?auto_365057 ) ( CALIBRATION_TARGET ?auto_365063 ?auto_365061 ) ( not ( = ?auto_365061 ?auto_365058 ) ) ( ON_BOARD ?auto_365064 ?auto_365060 ) ( not ( = ?auto_365063 ?auto_365064 ) ) ( SUPPORTS ?auto_365064 ?auto_365059 ) ( CALIBRATION_TARGET ?auto_365064 ?auto_365061 ) ( not ( = ?auto_365061 ?auto_365053 ) ) ( ON_BOARD ?auto_365065 ?auto_365060 ) ( not ( = ?auto_365064 ?auto_365065 ) ) ( SUPPORTS ?auto_365065 ?auto_365052 ) ( CALIBRATION_TARGET ?auto_365065 ?auto_365061 ) ( POWER_AVAIL ?auto_365060 ) ( POINTING ?auto_365060 ?auto_365062 ) ( not ( = ?auto_365061 ?auto_365062 ) ) ( not ( = ?auto_365053 ?auto_365062 ) ) ( not ( = ?auto_365052 ?auto_365059 ) ) ( not ( = ?auto_365058 ?auto_365062 ) ) ( not ( = ?auto_365052 ?auto_365057 ) ) ( not ( = ?auto_365059 ?auto_365057 ) ) ( not ( = ?auto_365056 ?auto_365062 ) ) ( not ( = ?auto_365063 ?auto_365065 ) ) ( not ( = ?auto_365052 ?auto_365055 ) ) ( not ( = ?auto_365059 ?auto_365055 ) ) ( not ( = ?auto_365057 ?auto_365055 ) ) ( not ( = ?auto_365054 ?auto_365062 ) ) ( not ( = ?auto_365066 ?auto_365064 ) ) ( not ( = ?auto_365066 ?auto_365065 ) ) ( not ( = ?auto_365052 ?auto_365051 ) ) ( not ( = ?auto_365059 ?auto_365051 ) ) ( not ( = ?auto_365057 ?auto_365051 ) ) ( not ( = ?auto_365055 ?auto_365051 ) ) ( not ( = ?auto_365050 ?auto_365062 ) ) ( not ( = ?auto_365067 ?auto_365063 ) ) ( not ( = ?auto_365067 ?auto_365064 ) ) ( not ( = ?auto_365067 ?auto_365065 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_365053 ?auto_365052 ?auto_365058 ?auto_365059 ?auto_365056 ?auto_365057 ?auto_365050 ?auto_365051 ?auto_365054 ?auto_365055 )
      ( GET-5IMAGE-VERIFY ?auto_365050 ?auto_365051 ?auto_365053 ?auto_365052 ?auto_365054 ?auto_365055 ?auto_365056 ?auto_365057 ?auto_365058 ?auto_365059 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_366158 - DIRECTION
      ?auto_366159 - MODE
      ?auto_366161 - DIRECTION
      ?auto_366160 - MODE
      ?auto_366162 - DIRECTION
      ?auto_366163 - MODE
      ?auto_366164 - DIRECTION
      ?auto_366165 - MODE
      ?auto_366166 - DIRECTION
      ?auto_366167 - MODE
    )
    :vars
    (
      ?auto_366175 - INSTRUMENT
      ?auto_366168 - SATELLITE
      ?auto_366169 - DIRECTION
      ?auto_366174 - INSTRUMENT
      ?auto_366171 - INSTRUMENT
      ?auto_366172 - INSTRUMENT
      ?auto_366173 - INSTRUMENT
      ?auto_366170 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_366161 ?auto_366158 ) ) ( not ( = ?auto_366162 ?auto_366158 ) ) ( not ( = ?auto_366162 ?auto_366161 ) ) ( not ( = ?auto_366164 ?auto_366158 ) ) ( not ( = ?auto_366164 ?auto_366161 ) ) ( not ( = ?auto_366164 ?auto_366162 ) ) ( not ( = ?auto_366166 ?auto_366158 ) ) ( not ( = ?auto_366166 ?auto_366161 ) ) ( not ( = ?auto_366166 ?auto_366162 ) ) ( not ( = ?auto_366166 ?auto_366164 ) ) ( ON_BOARD ?auto_366175 ?auto_366168 ) ( SUPPORTS ?auto_366175 ?auto_366159 ) ( not ( = ?auto_366158 ?auto_366169 ) ) ( CALIBRATION_TARGET ?auto_366175 ?auto_366169 ) ( not ( = ?auto_366169 ?auto_366166 ) ) ( ON_BOARD ?auto_366174 ?auto_366168 ) ( not ( = ?auto_366175 ?auto_366174 ) ) ( SUPPORTS ?auto_366174 ?auto_366167 ) ( CALIBRATION_TARGET ?auto_366174 ?auto_366169 ) ( not ( = ?auto_366169 ?auto_366164 ) ) ( ON_BOARD ?auto_366171 ?auto_366168 ) ( not ( = ?auto_366174 ?auto_366171 ) ) ( SUPPORTS ?auto_366171 ?auto_366165 ) ( CALIBRATION_TARGET ?auto_366171 ?auto_366169 ) ( not ( = ?auto_366169 ?auto_366161 ) ) ( ON_BOARD ?auto_366172 ?auto_366168 ) ( not ( = ?auto_366171 ?auto_366172 ) ) ( SUPPORTS ?auto_366172 ?auto_366160 ) ( CALIBRATION_TARGET ?auto_366172 ?auto_366169 ) ( not ( = ?auto_366169 ?auto_366162 ) ) ( ON_BOARD ?auto_366173 ?auto_366168 ) ( not ( = ?auto_366172 ?auto_366173 ) ) ( SUPPORTS ?auto_366173 ?auto_366163 ) ( CALIBRATION_TARGET ?auto_366173 ?auto_366169 ) ( POWER_AVAIL ?auto_366168 ) ( POINTING ?auto_366168 ?auto_366170 ) ( not ( = ?auto_366169 ?auto_366170 ) ) ( not ( = ?auto_366162 ?auto_366170 ) ) ( not ( = ?auto_366163 ?auto_366160 ) ) ( not ( = ?auto_366161 ?auto_366170 ) ) ( not ( = ?auto_366163 ?auto_366165 ) ) ( not ( = ?auto_366160 ?auto_366165 ) ) ( not ( = ?auto_366164 ?auto_366170 ) ) ( not ( = ?auto_366171 ?auto_366173 ) ) ( not ( = ?auto_366163 ?auto_366167 ) ) ( not ( = ?auto_366160 ?auto_366167 ) ) ( not ( = ?auto_366165 ?auto_366167 ) ) ( not ( = ?auto_366166 ?auto_366170 ) ) ( not ( = ?auto_366174 ?auto_366172 ) ) ( not ( = ?auto_366174 ?auto_366173 ) ) ( not ( = ?auto_366163 ?auto_366159 ) ) ( not ( = ?auto_366160 ?auto_366159 ) ) ( not ( = ?auto_366165 ?auto_366159 ) ) ( not ( = ?auto_366167 ?auto_366159 ) ) ( not ( = ?auto_366158 ?auto_366170 ) ) ( not ( = ?auto_366175 ?auto_366171 ) ) ( not ( = ?auto_366175 ?auto_366172 ) ) ( not ( = ?auto_366175 ?auto_366173 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_366162 ?auto_366163 ?auto_366161 ?auto_366160 ?auto_366164 ?auto_366165 ?auto_366158 ?auto_366159 ?auto_366166 ?auto_366167 )
      ( GET-5IMAGE-VERIFY ?auto_366158 ?auto_366159 ?auto_366161 ?auto_366160 ?auto_366162 ?auto_366163 ?auto_366164 ?auto_366165 ?auto_366166 ?auto_366167 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_366236 - DIRECTION
      ?auto_366237 - MODE
      ?auto_366239 - DIRECTION
      ?auto_366238 - MODE
      ?auto_366240 - DIRECTION
      ?auto_366241 - MODE
      ?auto_366242 - DIRECTION
      ?auto_366243 - MODE
      ?auto_366244 - DIRECTION
      ?auto_366245 - MODE
    )
    :vars
    (
      ?auto_366253 - INSTRUMENT
      ?auto_366246 - SATELLITE
      ?auto_366247 - DIRECTION
      ?auto_366252 - INSTRUMENT
      ?auto_366249 - INSTRUMENT
      ?auto_366250 - INSTRUMENT
      ?auto_366251 - INSTRUMENT
      ?auto_366248 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_366239 ?auto_366236 ) ) ( not ( = ?auto_366240 ?auto_366236 ) ) ( not ( = ?auto_366240 ?auto_366239 ) ) ( not ( = ?auto_366242 ?auto_366236 ) ) ( not ( = ?auto_366242 ?auto_366239 ) ) ( not ( = ?auto_366242 ?auto_366240 ) ) ( not ( = ?auto_366244 ?auto_366236 ) ) ( not ( = ?auto_366244 ?auto_366239 ) ) ( not ( = ?auto_366244 ?auto_366240 ) ) ( not ( = ?auto_366244 ?auto_366242 ) ) ( ON_BOARD ?auto_366253 ?auto_366246 ) ( SUPPORTS ?auto_366253 ?auto_366237 ) ( not ( = ?auto_366236 ?auto_366247 ) ) ( CALIBRATION_TARGET ?auto_366253 ?auto_366247 ) ( not ( = ?auto_366247 ?auto_366242 ) ) ( ON_BOARD ?auto_366252 ?auto_366246 ) ( not ( = ?auto_366253 ?auto_366252 ) ) ( SUPPORTS ?auto_366252 ?auto_366243 ) ( CALIBRATION_TARGET ?auto_366252 ?auto_366247 ) ( not ( = ?auto_366247 ?auto_366244 ) ) ( ON_BOARD ?auto_366249 ?auto_366246 ) ( not ( = ?auto_366252 ?auto_366249 ) ) ( SUPPORTS ?auto_366249 ?auto_366245 ) ( CALIBRATION_TARGET ?auto_366249 ?auto_366247 ) ( not ( = ?auto_366247 ?auto_366239 ) ) ( ON_BOARD ?auto_366250 ?auto_366246 ) ( not ( = ?auto_366249 ?auto_366250 ) ) ( SUPPORTS ?auto_366250 ?auto_366238 ) ( CALIBRATION_TARGET ?auto_366250 ?auto_366247 ) ( not ( = ?auto_366247 ?auto_366240 ) ) ( ON_BOARD ?auto_366251 ?auto_366246 ) ( not ( = ?auto_366250 ?auto_366251 ) ) ( SUPPORTS ?auto_366251 ?auto_366241 ) ( CALIBRATION_TARGET ?auto_366251 ?auto_366247 ) ( POWER_AVAIL ?auto_366246 ) ( POINTING ?auto_366246 ?auto_366248 ) ( not ( = ?auto_366247 ?auto_366248 ) ) ( not ( = ?auto_366240 ?auto_366248 ) ) ( not ( = ?auto_366241 ?auto_366238 ) ) ( not ( = ?auto_366239 ?auto_366248 ) ) ( not ( = ?auto_366241 ?auto_366245 ) ) ( not ( = ?auto_366238 ?auto_366245 ) ) ( not ( = ?auto_366244 ?auto_366248 ) ) ( not ( = ?auto_366249 ?auto_366251 ) ) ( not ( = ?auto_366241 ?auto_366243 ) ) ( not ( = ?auto_366238 ?auto_366243 ) ) ( not ( = ?auto_366245 ?auto_366243 ) ) ( not ( = ?auto_366242 ?auto_366248 ) ) ( not ( = ?auto_366252 ?auto_366250 ) ) ( not ( = ?auto_366252 ?auto_366251 ) ) ( not ( = ?auto_366241 ?auto_366237 ) ) ( not ( = ?auto_366238 ?auto_366237 ) ) ( not ( = ?auto_366245 ?auto_366237 ) ) ( not ( = ?auto_366243 ?auto_366237 ) ) ( not ( = ?auto_366236 ?auto_366248 ) ) ( not ( = ?auto_366253 ?auto_366249 ) ) ( not ( = ?auto_366253 ?auto_366250 ) ) ( not ( = ?auto_366253 ?auto_366251 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_366240 ?auto_366241 ?auto_366239 ?auto_366238 ?auto_366244 ?auto_366245 ?auto_366236 ?auto_366237 ?auto_366242 ?auto_366243 )
      ( GET-5IMAGE-VERIFY ?auto_366236 ?auto_366237 ?auto_366239 ?auto_366238 ?auto_366240 ?auto_366241 ?auto_366242 ?auto_366243 ?auto_366244 ?auto_366245 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_367006 - DIRECTION
      ?auto_367007 - MODE
      ?auto_367009 - DIRECTION
      ?auto_367008 - MODE
      ?auto_367010 - DIRECTION
      ?auto_367011 - MODE
      ?auto_367012 - DIRECTION
      ?auto_367013 - MODE
      ?auto_367014 - DIRECTION
      ?auto_367015 - MODE
    )
    :vars
    (
      ?auto_367023 - INSTRUMENT
      ?auto_367016 - SATELLITE
      ?auto_367017 - DIRECTION
      ?auto_367022 - INSTRUMENT
      ?auto_367019 - INSTRUMENT
      ?auto_367020 - INSTRUMENT
      ?auto_367021 - INSTRUMENT
      ?auto_367018 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_367009 ?auto_367006 ) ) ( not ( = ?auto_367010 ?auto_367006 ) ) ( not ( = ?auto_367010 ?auto_367009 ) ) ( not ( = ?auto_367012 ?auto_367006 ) ) ( not ( = ?auto_367012 ?auto_367009 ) ) ( not ( = ?auto_367012 ?auto_367010 ) ) ( not ( = ?auto_367014 ?auto_367006 ) ) ( not ( = ?auto_367014 ?auto_367009 ) ) ( not ( = ?auto_367014 ?auto_367010 ) ) ( not ( = ?auto_367014 ?auto_367012 ) ) ( ON_BOARD ?auto_367023 ?auto_367016 ) ( SUPPORTS ?auto_367023 ?auto_367007 ) ( not ( = ?auto_367006 ?auto_367017 ) ) ( CALIBRATION_TARGET ?auto_367023 ?auto_367017 ) ( not ( = ?auto_367017 ?auto_367014 ) ) ( ON_BOARD ?auto_367022 ?auto_367016 ) ( not ( = ?auto_367023 ?auto_367022 ) ) ( SUPPORTS ?auto_367022 ?auto_367015 ) ( CALIBRATION_TARGET ?auto_367022 ?auto_367017 ) ( not ( = ?auto_367017 ?auto_367010 ) ) ( ON_BOARD ?auto_367019 ?auto_367016 ) ( not ( = ?auto_367022 ?auto_367019 ) ) ( SUPPORTS ?auto_367019 ?auto_367011 ) ( CALIBRATION_TARGET ?auto_367019 ?auto_367017 ) ( not ( = ?auto_367017 ?auto_367009 ) ) ( ON_BOARD ?auto_367020 ?auto_367016 ) ( not ( = ?auto_367019 ?auto_367020 ) ) ( SUPPORTS ?auto_367020 ?auto_367008 ) ( CALIBRATION_TARGET ?auto_367020 ?auto_367017 ) ( not ( = ?auto_367017 ?auto_367012 ) ) ( ON_BOARD ?auto_367021 ?auto_367016 ) ( not ( = ?auto_367020 ?auto_367021 ) ) ( SUPPORTS ?auto_367021 ?auto_367013 ) ( CALIBRATION_TARGET ?auto_367021 ?auto_367017 ) ( POWER_AVAIL ?auto_367016 ) ( POINTING ?auto_367016 ?auto_367018 ) ( not ( = ?auto_367017 ?auto_367018 ) ) ( not ( = ?auto_367012 ?auto_367018 ) ) ( not ( = ?auto_367013 ?auto_367008 ) ) ( not ( = ?auto_367009 ?auto_367018 ) ) ( not ( = ?auto_367013 ?auto_367011 ) ) ( not ( = ?auto_367008 ?auto_367011 ) ) ( not ( = ?auto_367010 ?auto_367018 ) ) ( not ( = ?auto_367019 ?auto_367021 ) ) ( not ( = ?auto_367013 ?auto_367015 ) ) ( not ( = ?auto_367008 ?auto_367015 ) ) ( not ( = ?auto_367011 ?auto_367015 ) ) ( not ( = ?auto_367014 ?auto_367018 ) ) ( not ( = ?auto_367022 ?auto_367020 ) ) ( not ( = ?auto_367022 ?auto_367021 ) ) ( not ( = ?auto_367013 ?auto_367007 ) ) ( not ( = ?auto_367008 ?auto_367007 ) ) ( not ( = ?auto_367011 ?auto_367007 ) ) ( not ( = ?auto_367015 ?auto_367007 ) ) ( not ( = ?auto_367006 ?auto_367018 ) ) ( not ( = ?auto_367023 ?auto_367019 ) ) ( not ( = ?auto_367023 ?auto_367020 ) ) ( not ( = ?auto_367023 ?auto_367021 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_367012 ?auto_367013 ?auto_367009 ?auto_367008 ?auto_367010 ?auto_367011 ?auto_367006 ?auto_367007 ?auto_367014 ?auto_367015 )
      ( GET-5IMAGE-VERIFY ?auto_367006 ?auto_367007 ?auto_367009 ?auto_367008 ?auto_367010 ?auto_367011 ?auto_367012 ?auto_367013 ?auto_367014 ?auto_367015 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_367256 - DIRECTION
      ?auto_367257 - MODE
      ?auto_367259 - DIRECTION
      ?auto_367258 - MODE
      ?auto_367260 - DIRECTION
      ?auto_367261 - MODE
      ?auto_367262 - DIRECTION
      ?auto_367263 - MODE
      ?auto_367264 - DIRECTION
      ?auto_367265 - MODE
    )
    :vars
    (
      ?auto_367273 - INSTRUMENT
      ?auto_367266 - SATELLITE
      ?auto_367267 - DIRECTION
      ?auto_367272 - INSTRUMENT
      ?auto_367269 - INSTRUMENT
      ?auto_367270 - INSTRUMENT
      ?auto_367271 - INSTRUMENT
      ?auto_367268 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_367259 ?auto_367256 ) ) ( not ( = ?auto_367260 ?auto_367256 ) ) ( not ( = ?auto_367260 ?auto_367259 ) ) ( not ( = ?auto_367262 ?auto_367256 ) ) ( not ( = ?auto_367262 ?auto_367259 ) ) ( not ( = ?auto_367262 ?auto_367260 ) ) ( not ( = ?auto_367264 ?auto_367256 ) ) ( not ( = ?auto_367264 ?auto_367259 ) ) ( not ( = ?auto_367264 ?auto_367260 ) ) ( not ( = ?auto_367264 ?auto_367262 ) ) ( ON_BOARD ?auto_367273 ?auto_367266 ) ( SUPPORTS ?auto_367273 ?auto_367257 ) ( not ( = ?auto_367256 ?auto_367267 ) ) ( CALIBRATION_TARGET ?auto_367273 ?auto_367267 ) ( not ( = ?auto_367267 ?auto_367262 ) ) ( ON_BOARD ?auto_367272 ?auto_367266 ) ( not ( = ?auto_367273 ?auto_367272 ) ) ( SUPPORTS ?auto_367272 ?auto_367263 ) ( CALIBRATION_TARGET ?auto_367272 ?auto_367267 ) ( not ( = ?auto_367267 ?auto_367260 ) ) ( ON_BOARD ?auto_367269 ?auto_367266 ) ( not ( = ?auto_367272 ?auto_367269 ) ) ( SUPPORTS ?auto_367269 ?auto_367261 ) ( CALIBRATION_TARGET ?auto_367269 ?auto_367267 ) ( not ( = ?auto_367267 ?auto_367259 ) ) ( ON_BOARD ?auto_367270 ?auto_367266 ) ( not ( = ?auto_367269 ?auto_367270 ) ) ( SUPPORTS ?auto_367270 ?auto_367258 ) ( CALIBRATION_TARGET ?auto_367270 ?auto_367267 ) ( not ( = ?auto_367267 ?auto_367264 ) ) ( ON_BOARD ?auto_367271 ?auto_367266 ) ( not ( = ?auto_367270 ?auto_367271 ) ) ( SUPPORTS ?auto_367271 ?auto_367265 ) ( CALIBRATION_TARGET ?auto_367271 ?auto_367267 ) ( POWER_AVAIL ?auto_367266 ) ( POINTING ?auto_367266 ?auto_367268 ) ( not ( = ?auto_367267 ?auto_367268 ) ) ( not ( = ?auto_367264 ?auto_367268 ) ) ( not ( = ?auto_367265 ?auto_367258 ) ) ( not ( = ?auto_367259 ?auto_367268 ) ) ( not ( = ?auto_367265 ?auto_367261 ) ) ( not ( = ?auto_367258 ?auto_367261 ) ) ( not ( = ?auto_367260 ?auto_367268 ) ) ( not ( = ?auto_367269 ?auto_367271 ) ) ( not ( = ?auto_367265 ?auto_367263 ) ) ( not ( = ?auto_367258 ?auto_367263 ) ) ( not ( = ?auto_367261 ?auto_367263 ) ) ( not ( = ?auto_367262 ?auto_367268 ) ) ( not ( = ?auto_367272 ?auto_367270 ) ) ( not ( = ?auto_367272 ?auto_367271 ) ) ( not ( = ?auto_367265 ?auto_367257 ) ) ( not ( = ?auto_367258 ?auto_367257 ) ) ( not ( = ?auto_367261 ?auto_367257 ) ) ( not ( = ?auto_367263 ?auto_367257 ) ) ( not ( = ?auto_367256 ?auto_367268 ) ) ( not ( = ?auto_367273 ?auto_367269 ) ) ( not ( = ?auto_367273 ?auto_367270 ) ) ( not ( = ?auto_367273 ?auto_367271 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_367264 ?auto_367265 ?auto_367259 ?auto_367258 ?auto_367260 ?auto_367261 ?auto_367256 ?auto_367257 ?auto_367262 ?auto_367263 )
      ( GET-5IMAGE-VERIFY ?auto_367256 ?auto_367257 ?auto_367259 ?auto_367258 ?auto_367260 ?auto_367261 ?auto_367262 ?auto_367263 ?auto_367264 ?auto_367265 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_367500 - DIRECTION
      ?auto_367501 - MODE
      ?auto_367503 - DIRECTION
      ?auto_367502 - MODE
      ?auto_367504 - DIRECTION
      ?auto_367505 - MODE
      ?auto_367506 - DIRECTION
      ?auto_367507 - MODE
      ?auto_367508 - DIRECTION
      ?auto_367509 - MODE
    )
    :vars
    (
      ?auto_367517 - INSTRUMENT
      ?auto_367510 - SATELLITE
      ?auto_367511 - DIRECTION
      ?auto_367516 - INSTRUMENT
      ?auto_367513 - INSTRUMENT
      ?auto_367514 - INSTRUMENT
      ?auto_367515 - INSTRUMENT
      ?auto_367512 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_367503 ?auto_367500 ) ) ( not ( = ?auto_367504 ?auto_367500 ) ) ( not ( = ?auto_367504 ?auto_367503 ) ) ( not ( = ?auto_367506 ?auto_367500 ) ) ( not ( = ?auto_367506 ?auto_367503 ) ) ( not ( = ?auto_367506 ?auto_367504 ) ) ( not ( = ?auto_367508 ?auto_367500 ) ) ( not ( = ?auto_367508 ?auto_367503 ) ) ( not ( = ?auto_367508 ?auto_367504 ) ) ( not ( = ?auto_367508 ?auto_367506 ) ) ( ON_BOARD ?auto_367517 ?auto_367510 ) ( SUPPORTS ?auto_367517 ?auto_367501 ) ( not ( = ?auto_367500 ?auto_367511 ) ) ( CALIBRATION_TARGET ?auto_367517 ?auto_367511 ) ( not ( = ?auto_367511 ?auto_367504 ) ) ( ON_BOARD ?auto_367516 ?auto_367510 ) ( not ( = ?auto_367517 ?auto_367516 ) ) ( SUPPORTS ?auto_367516 ?auto_367505 ) ( CALIBRATION_TARGET ?auto_367516 ?auto_367511 ) ( not ( = ?auto_367511 ?auto_367508 ) ) ( ON_BOARD ?auto_367513 ?auto_367510 ) ( not ( = ?auto_367516 ?auto_367513 ) ) ( SUPPORTS ?auto_367513 ?auto_367509 ) ( CALIBRATION_TARGET ?auto_367513 ?auto_367511 ) ( not ( = ?auto_367511 ?auto_367503 ) ) ( ON_BOARD ?auto_367514 ?auto_367510 ) ( not ( = ?auto_367513 ?auto_367514 ) ) ( SUPPORTS ?auto_367514 ?auto_367502 ) ( CALIBRATION_TARGET ?auto_367514 ?auto_367511 ) ( not ( = ?auto_367511 ?auto_367506 ) ) ( ON_BOARD ?auto_367515 ?auto_367510 ) ( not ( = ?auto_367514 ?auto_367515 ) ) ( SUPPORTS ?auto_367515 ?auto_367507 ) ( CALIBRATION_TARGET ?auto_367515 ?auto_367511 ) ( POWER_AVAIL ?auto_367510 ) ( POINTING ?auto_367510 ?auto_367512 ) ( not ( = ?auto_367511 ?auto_367512 ) ) ( not ( = ?auto_367506 ?auto_367512 ) ) ( not ( = ?auto_367507 ?auto_367502 ) ) ( not ( = ?auto_367503 ?auto_367512 ) ) ( not ( = ?auto_367507 ?auto_367509 ) ) ( not ( = ?auto_367502 ?auto_367509 ) ) ( not ( = ?auto_367508 ?auto_367512 ) ) ( not ( = ?auto_367513 ?auto_367515 ) ) ( not ( = ?auto_367507 ?auto_367505 ) ) ( not ( = ?auto_367502 ?auto_367505 ) ) ( not ( = ?auto_367509 ?auto_367505 ) ) ( not ( = ?auto_367504 ?auto_367512 ) ) ( not ( = ?auto_367516 ?auto_367514 ) ) ( not ( = ?auto_367516 ?auto_367515 ) ) ( not ( = ?auto_367507 ?auto_367501 ) ) ( not ( = ?auto_367502 ?auto_367501 ) ) ( not ( = ?auto_367509 ?auto_367501 ) ) ( not ( = ?auto_367505 ?auto_367501 ) ) ( not ( = ?auto_367500 ?auto_367512 ) ) ( not ( = ?auto_367517 ?auto_367513 ) ) ( not ( = ?auto_367517 ?auto_367514 ) ) ( not ( = ?auto_367517 ?auto_367515 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_367506 ?auto_367507 ?auto_367503 ?auto_367502 ?auto_367508 ?auto_367509 ?auto_367500 ?auto_367501 ?auto_367504 ?auto_367505 )
      ( GET-5IMAGE-VERIFY ?auto_367500 ?auto_367501 ?auto_367503 ?auto_367502 ?auto_367504 ?auto_367505 ?auto_367506 ?auto_367507 ?auto_367508 ?auto_367509 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_367664 - DIRECTION
      ?auto_367665 - MODE
      ?auto_367667 - DIRECTION
      ?auto_367666 - MODE
      ?auto_367668 - DIRECTION
      ?auto_367669 - MODE
      ?auto_367670 - DIRECTION
      ?auto_367671 - MODE
      ?auto_367672 - DIRECTION
      ?auto_367673 - MODE
    )
    :vars
    (
      ?auto_367681 - INSTRUMENT
      ?auto_367674 - SATELLITE
      ?auto_367675 - DIRECTION
      ?auto_367680 - INSTRUMENT
      ?auto_367677 - INSTRUMENT
      ?auto_367678 - INSTRUMENT
      ?auto_367679 - INSTRUMENT
      ?auto_367676 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_367667 ?auto_367664 ) ) ( not ( = ?auto_367668 ?auto_367664 ) ) ( not ( = ?auto_367668 ?auto_367667 ) ) ( not ( = ?auto_367670 ?auto_367664 ) ) ( not ( = ?auto_367670 ?auto_367667 ) ) ( not ( = ?auto_367670 ?auto_367668 ) ) ( not ( = ?auto_367672 ?auto_367664 ) ) ( not ( = ?auto_367672 ?auto_367667 ) ) ( not ( = ?auto_367672 ?auto_367668 ) ) ( not ( = ?auto_367672 ?auto_367670 ) ) ( ON_BOARD ?auto_367681 ?auto_367674 ) ( SUPPORTS ?auto_367681 ?auto_367665 ) ( not ( = ?auto_367664 ?auto_367675 ) ) ( CALIBRATION_TARGET ?auto_367681 ?auto_367675 ) ( not ( = ?auto_367675 ?auto_367668 ) ) ( ON_BOARD ?auto_367680 ?auto_367674 ) ( not ( = ?auto_367681 ?auto_367680 ) ) ( SUPPORTS ?auto_367680 ?auto_367669 ) ( CALIBRATION_TARGET ?auto_367680 ?auto_367675 ) ( not ( = ?auto_367675 ?auto_367670 ) ) ( ON_BOARD ?auto_367677 ?auto_367674 ) ( not ( = ?auto_367680 ?auto_367677 ) ) ( SUPPORTS ?auto_367677 ?auto_367671 ) ( CALIBRATION_TARGET ?auto_367677 ?auto_367675 ) ( not ( = ?auto_367675 ?auto_367667 ) ) ( ON_BOARD ?auto_367678 ?auto_367674 ) ( not ( = ?auto_367677 ?auto_367678 ) ) ( SUPPORTS ?auto_367678 ?auto_367666 ) ( CALIBRATION_TARGET ?auto_367678 ?auto_367675 ) ( not ( = ?auto_367675 ?auto_367672 ) ) ( ON_BOARD ?auto_367679 ?auto_367674 ) ( not ( = ?auto_367678 ?auto_367679 ) ) ( SUPPORTS ?auto_367679 ?auto_367673 ) ( CALIBRATION_TARGET ?auto_367679 ?auto_367675 ) ( POWER_AVAIL ?auto_367674 ) ( POINTING ?auto_367674 ?auto_367676 ) ( not ( = ?auto_367675 ?auto_367676 ) ) ( not ( = ?auto_367672 ?auto_367676 ) ) ( not ( = ?auto_367673 ?auto_367666 ) ) ( not ( = ?auto_367667 ?auto_367676 ) ) ( not ( = ?auto_367673 ?auto_367671 ) ) ( not ( = ?auto_367666 ?auto_367671 ) ) ( not ( = ?auto_367670 ?auto_367676 ) ) ( not ( = ?auto_367677 ?auto_367679 ) ) ( not ( = ?auto_367673 ?auto_367669 ) ) ( not ( = ?auto_367666 ?auto_367669 ) ) ( not ( = ?auto_367671 ?auto_367669 ) ) ( not ( = ?auto_367668 ?auto_367676 ) ) ( not ( = ?auto_367680 ?auto_367678 ) ) ( not ( = ?auto_367680 ?auto_367679 ) ) ( not ( = ?auto_367673 ?auto_367665 ) ) ( not ( = ?auto_367666 ?auto_367665 ) ) ( not ( = ?auto_367671 ?auto_367665 ) ) ( not ( = ?auto_367669 ?auto_367665 ) ) ( not ( = ?auto_367664 ?auto_367676 ) ) ( not ( = ?auto_367681 ?auto_367677 ) ) ( not ( = ?auto_367681 ?auto_367678 ) ) ( not ( = ?auto_367681 ?auto_367679 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_367672 ?auto_367673 ?auto_367667 ?auto_367666 ?auto_367670 ?auto_367671 ?auto_367664 ?auto_367665 ?auto_367668 ?auto_367669 )
      ( GET-5IMAGE-VERIFY ?auto_367664 ?auto_367665 ?auto_367667 ?auto_367666 ?auto_367668 ?auto_367669 ?auto_367670 ?auto_367671 ?auto_367672 ?auto_367673 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_368686 - DIRECTION
      ?auto_368687 - MODE
      ?auto_368689 - DIRECTION
      ?auto_368688 - MODE
      ?auto_368690 - DIRECTION
      ?auto_368691 - MODE
      ?auto_368692 - DIRECTION
      ?auto_368693 - MODE
      ?auto_368694 - DIRECTION
      ?auto_368695 - MODE
    )
    :vars
    (
      ?auto_368703 - INSTRUMENT
      ?auto_368696 - SATELLITE
      ?auto_368697 - DIRECTION
      ?auto_368702 - INSTRUMENT
      ?auto_368699 - INSTRUMENT
      ?auto_368700 - INSTRUMENT
      ?auto_368701 - INSTRUMENT
      ?auto_368698 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_368689 ?auto_368686 ) ) ( not ( = ?auto_368690 ?auto_368686 ) ) ( not ( = ?auto_368690 ?auto_368689 ) ) ( not ( = ?auto_368692 ?auto_368686 ) ) ( not ( = ?auto_368692 ?auto_368689 ) ) ( not ( = ?auto_368692 ?auto_368690 ) ) ( not ( = ?auto_368694 ?auto_368686 ) ) ( not ( = ?auto_368694 ?auto_368689 ) ) ( not ( = ?auto_368694 ?auto_368690 ) ) ( not ( = ?auto_368694 ?auto_368692 ) ) ( ON_BOARD ?auto_368703 ?auto_368696 ) ( SUPPORTS ?auto_368703 ?auto_368687 ) ( not ( = ?auto_368686 ?auto_368697 ) ) ( CALIBRATION_TARGET ?auto_368703 ?auto_368697 ) ( not ( = ?auto_368697 ?auto_368694 ) ) ( ON_BOARD ?auto_368702 ?auto_368696 ) ( not ( = ?auto_368703 ?auto_368702 ) ) ( SUPPORTS ?auto_368702 ?auto_368695 ) ( CALIBRATION_TARGET ?auto_368702 ?auto_368697 ) ( not ( = ?auto_368697 ?auto_368689 ) ) ( ON_BOARD ?auto_368699 ?auto_368696 ) ( not ( = ?auto_368702 ?auto_368699 ) ) ( SUPPORTS ?auto_368699 ?auto_368688 ) ( CALIBRATION_TARGET ?auto_368699 ?auto_368697 ) ( not ( = ?auto_368697 ?auto_368692 ) ) ( ON_BOARD ?auto_368700 ?auto_368696 ) ( not ( = ?auto_368699 ?auto_368700 ) ) ( SUPPORTS ?auto_368700 ?auto_368693 ) ( CALIBRATION_TARGET ?auto_368700 ?auto_368697 ) ( not ( = ?auto_368697 ?auto_368690 ) ) ( ON_BOARD ?auto_368701 ?auto_368696 ) ( not ( = ?auto_368700 ?auto_368701 ) ) ( SUPPORTS ?auto_368701 ?auto_368691 ) ( CALIBRATION_TARGET ?auto_368701 ?auto_368697 ) ( POWER_AVAIL ?auto_368696 ) ( POINTING ?auto_368696 ?auto_368698 ) ( not ( = ?auto_368697 ?auto_368698 ) ) ( not ( = ?auto_368690 ?auto_368698 ) ) ( not ( = ?auto_368691 ?auto_368693 ) ) ( not ( = ?auto_368692 ?auto_368698 ) ) ( not ( = ?auto_368691 ?auto_368688 ) ) ( not ( = ?auto_368693 ?auto_368688 ) ) ( not ( = ?auto_368689 ?auto_368698 ) ) ( not ( = ?auto_368699 ?auto_368701 ) ) ( not ( = ?auto_368691 ?auto_368695 ) ) ( not ( = ?auto_368693 ?auto_368695 ) ) ( not ( = ?auto_368688 ?auto_368695 ) ) ( not ( = ?auto_368694 ?auto_368698 ) ) ( not ( = ?auto_368702 ?auto_368700 ) ) ( not ( = ?auto_368702 ?auto_368701 ) ) ( not ( = ?auto_368691 ?auto_368687 ) ) ( not ( = ?auto_368693 ?auto_368687 ) ) ( not ( = ?auto_368688 ?auto_368687 ) ) ( not ( = ?auto_368695 ?auto_368687 ) ) ( not ( = ?auto_368686 ?auto_368698 ) ) ( not ( = ?auto_368703 ?auto_368699 ) ) ( not ( = ?auto_368703 ?auto_368700 ) ) ( not ( = ?auto_368703 ?auto_368701 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_368690 ?auto_368691 ?auto_368692 ?auto_368693 ?auto_368689 ?auto_368688 ?auto_368686 ?auto_368687 ?auto_368694 ?auto_368695 )
      ( GET-5IMAGE-VERIFY ?auto_368686 ?auto_368687 ?auto_368689 ?auto_368688 ?auto_368690 ?auto_368691 ?auto_368692 ?auto_368693 ?auto_368694 ?auto_368695 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_368850 - DIRECTION
      ?auto_368851 - MODE
      ?auto_368853 - DIRECTION
      ?auto_368852 - MODE
      ?auto_368854 - DIRECTION
      ?auto_368855 - MODE
      ?auto_368856 - DIRECTION
      ?auto_368857 - MODE
      ?auto_368858 - DIRECTION
      ?auto_368859 - MODE
    )
    :vars
    (
      ?auto_368867 - INSTRUMENT
      ?auto_368860 - SATELLITE
      ?auto_368861 - DIRECTION
      ?auto_368866 - INSTRUMENT
      ?auto_368863 - INSTRUMENT
      ?auto_368864 - INSTRUMENT
      ?auto_368865 - INSTRUMENT
      ?auto_368862 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_368853 ?auto_368850 ) ) ( not ( = ?auto_368854 ?auto_368850 ) ) ( not ( = ?auto_368854 ?auto_368853 ) ) ( not ( = ?auto_368856 ?auto_368850 ) ) ( not ( = ?auto_368856 ?auto_368853 ) ) ( not ( = ?auto_368856 ?auto_368854 ) ) ( not ( = ?auto_368858 ?auto_368850 ) ) ( not ( = ?auto_368858 ?auto_368853 ) ) ( not ( = ?auto_368858 ?auto_368854 ) ) ( not ( = ?auto_368858 ?auto_368856 ) ) ( ON_BOARD ?auto_368867 ?auto_368860 ) ( SUPPORTS ?auto_368867 ?auto_368851 ) ( not ( = ?auto_368850 ?auto_368861 ) ) ( CALIBRATION_TARGET ?auto_368867 ?auto_368861 ) ( not ( = ?auto_368861 ?auto_368856 ) ) ( ON_BOARD ?auto_368866 ?auto_368860 ) ( not ( = ?auto_368867 ?auto_368866 ) ) ( SUPPORTS ?auto_368866 ?auto_368857 ) ( CALIBRATION_TARGET ?auto_368866 ?auto_368861 ) ( not ( = ?auto_368861 ?auto_368853 ) ) ( ON_BOARD ?auto_368863 ?auto_368860 ) ( not ( = ?auto_368866 ?auto_368863 ) ) ( SUPPORTS ?auto_368863 ?auto_368852 ) ( CALIBRATION_TARGET ?auto_368863 ?auto_368861 ) ( not ( = ?auto_368861 ?auto_368858 ) ) ( ON_BOARD ?auto_368864 ?auto_368860 ) ( not ( = ?auto_368863 ?auto_368864 ) ) ( SUPPORTS ?auto_368864 ?auto_368859 ) ( CALIBRATION_TARGET ?auto_368864 ?auto_368861 ) ( not ( = ?auto_368861 ?auto_368854 ) ) ( ON_BOARD ?auto_368865 ?auto_368860 ) ( not ( = ?auto_368864 ?auto_368865 ) ) ( SUPPORTS ?auto_368865 ?auto_368855 ) ( CALIBRATION_TARGET ?auto_368865 ?auto_368861 ) ( POWER_AVAIL ?auto_368860 ) ( POINTING ?auto_368860 ?auto_368862 ) ( not ( = ?auto_368861 ?auto_368862 ) ) ( not ( = ?auto_368854 ?auto_368862 ) ) ( not ( = ?auto_368855 ?auto_368859 ) ) ( not ( = ?auto_368858 ?auto_368862 ) ) ( not ( = ?auto_368855 ?auto_368852 ) ) ( not ( = ?auto_368859 ?auto_368852 ) ) ( not ( = ?auto_368853 ?auto_368862 ) ) ( not ( = ?auto_368863 ?auto_368865 ) ) ( not ( = ?auto_368855 ?auto_368857 ) ) ( not ( = ?auto_368859 ?auto_368857 ) ) ( not ( = ?auto_368852 ?auto_368857 ) ) ( not ( = ?auto_368856 ?auto_368862 ) ) ( not ( = ?auto_368866 ?auto_368864 ) ) ( not ( = ?auto_368866 ?auto_368865 ) ) ( not ( = ?auto_368855 ?auto_368851 ) ) ( not ( = ?auto_368859 ?auto_368851 ) ) ( not ( = ?auto_368852 ?auto_368851 ) ) ( not ( = ?auto_368857 ?auto_368851 ) ) ( not ( = ?auto_368850 ?auto_368862 ) ) ( not ( = ?auto_368867 ?auto_368863 ) ) ( not ( = ?auto_368867 ?auto_368864 ) ) ( not ( = ?auto_368867 ?auto_368865 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_368854 ?auto_368855 ?auto_368858 ?auto_368859 ?auto_368853 ?auto_368852 ?auto_368850 ?auto_368851 ?auto_368856 ?auto_368857 )
      ( GET-5IMAGE-VERIFY ?auto_368850 ?auto_368851 ?auto_368853 ?auto_368852 ?auto_368854 ?auto_368855 ?auto_368856 ?auto_368857 ?auto_368858 ?auto_368859 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_369094 - DIRECTION
      ?auto_369095 - MODE
      ?auto_369097 - DIRECTION
      ?auto_369096 - MODE
      ?auto_369098 - DIRECTION
      ?auto_369099 - MODE
      ?auto_369100 - DIRECTION
      ?auto_369101 - MODE
      ?auto_369102 - DIRECTION
      ?auto_369103 - MODE
    )
    :vars
    (
      ?auto_369111 - INSTRUMENT
      ?auto_369104 - SATELLITE
      ?auto_369105 - DIRECTION
      ?auto_369110 - INSTRUMENT
      ?auto_369107 - INSTRUMENT
      ?auto_369108 - INSTRUMENT
      ?auto_369109 - INSTRUMENT
      ?auto_369106 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_369097 ?auto_369094 ) ) ( not ( = ?auto_369098 ?auto_369094 ) ) ( not ( = ?auto_369098 ?auto_369097 ) ) ( not ( = ?auto_369100 ?auto_369094 ) ) ( not ( = ?auto_369100 ?auto_369097 ) ) ( not ( = ?auto_369100 ?auto_369098 ) ) ( not ( = ?auto_369102 ?auto_369094 ) ) ( not ( = ?auto_369102 ?auto_369097 ) ) ( not ( = ?auto_369102 ?auto_369098 ) ) ( not ( = ?auto_369102 ?auto_369100 ) ) ( ON_BOARD ?auto_369111 ?auto_369104 ) ( SUPPORTS ?auto_369111 ?auto_369095 ) ( not ( = ?auto_369094 ?auto_369105 ) ) ( CALIBRATION_TARGET ?auto_369111 ?auto_369105 ) ( not ( = ?auto_369105 ?auto_369102 ) ) ( ON_BOARD ?auto_369110 ?auto_369104 ) ( not ( = ?auto_369111 ?auto_369110 ) ) ( SUPPORTS ?auto_369110 ?auto_369103 ) ( CALIBRATION_TARGET ?auto_369110 ?auto_369105 ) ( not ( = ?auto_369105 ?auto_369097 ) ) ( ON_BOARD ?auto_369107 ?auto_369104 ) ( not ( = ?auto_369110 ?auto_369107 ) ) ( SUPPORTS ?auto_369107 ?auto_369096 ) ( CALIBRATION_TARGET ?auto_369107 ?auto_369105 ) ( not ( = ?auto_369105 ?auto_369098 ) ) ( ON_BOARD ?auto_369108 ?auto_369104 ) ( not ( = ?auto_369107 ?auto_369108 ) ) ( SUPPORTS ?auto_369108 ?auto_369099 ) ( CALIBRATION_TARGET ?auto_369108 ?auto_369105 ) ( not ( = ?auto_369105 ?auto_369100 ) ) ( ON_BOARD ?auto_369109 ?auto_369104 ) ( not ( = ?auto_369108 ?auto_369109 ) ) ( SUPPORTS ?auto_369109 ?auto_369101 ) ( CALIBRATION_TARGET ?auto_369109 ?auto_369105 ) ( POWER_AVAIL ?auto_369104 ) ( POINTING ?auto_369104 ?auto_369106 ) ( not ( = ?auto_369105 ?auto_369106 ) ) ( not ( = ?auto_369100 ?auto_369106 ) ) ( not ( = ?auto_369101 ?auto_369099 ) ) ( not ( = ?auto_369098 ?auto_369106 ) ) ( not ( = ?auto_369101 ?auto_369096 ) ) ( not ( = ?auto_369099 ?auto_369096 ) ) ( not ( = ?auto_369097 ?auto_369106 ) ) ( not ( = ?auto_369107 ?auto_369109 ) ) ( not ( = ?auto_369101 ?auto_369103 ) ) ( not ( = ?auto_369099 ?auto_369103 ) ) ( not ( = ?auto_369096 ?auto_369103 ) ) ( not ( = ?auto_369102 ?auto_369106 ) ) ( not ( = ?auto_369110 ?auto_369108 ) ) ( not ( = ?auto_369110 ?auto_369109 ) ) ( not ( = ?auto_369101 ?auto_369095 ) ) ( not ( = ?auto_369099 ?auto_369095 ) ) ( not ( = ?auto_369096 ?auto_369095 ) ) ( not ( = ?auto_369103 ?auto_369095 ) ) ( not ( = ?auto_369094 ?auto_369106 ) ) ( not ( = ?auto_369111 ?auto_369107 ) ) ( not ( = ?auto_369111 ?auto_369108 ) ) ( not ( = ?auto_369111 ?auto_369109 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_369100 ?auto_369101 ?auto_369098 ?auto_369099 ?auto_369097 ?auto_369096 ?auto_369094 ?auto_369095 ?auto_369102 ?auto_369103 )
      ( GET-5IMAGE-VERIFY ?auto_369094 ?auto_369095 ?auto_369097 ?auto_369096 ?auto_369098 ?auto_369099 ?auto_369100 ?auto_369101 ?auto_369102 ?auto_369103 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_369344 - DIRECTION
      ?auto_369345 - MODE
      ?auto_369347 - DIRECTION
      ?auto_369346 - MODE
      ?auto_369348 - DIRECTION
      ?auto_369349 - MODE
      ?auto_369350 - DIRECTION
      ?auto_369351 - MODE
      ?auto_369352 - DIRECTION
      ?auto_369353 - MODE
    )
    :vars
    (
      ?auto_369361 - INSTRUMENT
      ?auto_369354 - SATELLITE
      ?auto_369355 - DIRECTION
      ?auto_369360 - INSTRUMENT
      ?auto_369357 - INSTRUMENT
      ?auto_369358 - INSTRUMENT
      ?auto_369359 - INSTRUMENT
      ?auto_369356 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_369347 ?auto_369344 ) ) ( not ( = ?auto_369348 ?auto_369344 ) ) ( not ( = ?auto_369348 ?auto_369347 ) ) ( not ( = ?auto_369350 ?auto_369344 ) ) ( not ( = ?auto_369350 ?auto_369347 ) ) ( not ( = ?auto_369350 ?auto_369348 ) ) ( not ( = ?auto_369352 ?auto_369344 ) ) ( not ( = ?auto_369352 ?auto_369347 ) ) ( not ( = ?auto_369352 ?auto_369348 ) ) ( not ( = ?auto_369352 ?auto_369350 ) ) ( ON_BOARD ?auto_369361 ?auto_369354 ) ( SUPPORTS ?auto_369361 ?auto_369345 ) ( not ( = ?auto_369344 ?auto_369355 ) ) ( CALIBRATION_TARGET ?auto_369361 ?auto_369355 ) ( not ( = ?auto_369355 ?auto_369350 ) ) ( ON_BOARD ?auto_369360 ?auto_369354 ) ( not ( = ?auto_369361 ?auto_369360 ) ) ( SUPPORTS ?auto_369360 ?auto_369351 ) ( CALIBRATION_TARGET ?auto_369360 ?auto_369355 ) ( not ( = ?auto_369355 ?auto_369347 ) ) ( ON_BOARD ?auto_369357 ?auto_369354 ) ( not ( = ?auto_369360 ?auto_369357 ) ) ( SUPPORTS ?auto_369357 ?auto_369346 ) ( CALIBRATION_TARGET ?auto_369357 ?auto_369355 ) ( not ( = ?auto_369355 ?auto_369348 ) ) ( ON_BOARD ?auto_369358 ?auto_369354 ) ( not ( = ?auto_369357 ?auto_369358 ) ) ( SUPPORTS ?auto_369358 ?auto_369349 ) ( CALIBRATION_TARGET ?auto_369358 ?auto_369355 ) ( not ( = ?auto_369355 ?auto_369352 ) ) ( ON_BOARD ?auto_369359 ?auto_369354 ) ( not ( = ?auto_369358 ?auto_369359 ) ) ( SUPPORTS ?auto_369359 ?auto_369353 ) ( CALIBRATION_TARGET ?auto_369359 ?auto_369355 ) ( POWER_AVAIL ?auto_369354 ) ( POINTING ?auto_369354 ?auto_369356 ) ( not ( = ?auto_369355 ?auto_369356 ) ) ( not ( = ?auto_369352 ?auto_369356 ) ) ( not ( = ?auto_369353 ?auto_369349 ) ) ( not ( = ?auto_369348 ?auto_369356 ) ) ( not ( = ?auto_369353 ?auto_369346 ) ) ( not ( = ?auto_369349 ?auto_369346 ) ) ( not ( = ?auto_369347 ?auto_369356 ) ) ( not ( = ?auto_369357 ?auto_369359 ) ) ( not ( = ?auto_369353 ?auto_369351 ) ) ( not ( = ?auto_369349 ?auto_369351 ) ) ( not ( = ?auto_369346 ?auto_369351 ) ) ( not ( = ?auto_369350 ?auto_369356 ) ) ( not ( = ?auto_369360 ?auto_369358 ) ) ( not ( = ?auto_369360 ?auto_369359 ) ) ( not ( = ?auto_369353 ?auto_369345 ) ) ( not ( = ?auto_369349 ?auto_369345 ) ) ( not ( = ?auto_369346 ?auto_369345 ) ) ( not ( = ?auto_369351 ?auto_369345 ) ) ( not ( = ?auto_369344 ?auto_369356 ) ) ( not ( = ?auto_369361 ?auto_369357 ) ) ( not ( = ?auto_369361 ?auto_369358 ) ) ( not ( = ?auto_369361 ?auto_369359 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_369352 ?auto_369353 ?auto_369348 ?auto_369349 ?auto_369347 ?auto_369346 ?auto_369344 ?auto_369345 ?auto_369350 ?auto_369351 )
      ( GET-5IMAGE-VERIFY ?auto_369344 ?auto_369345 ?auto_369347 ?auto_369346 ?auto_369348 ?auto_369349 ?auto_369350 ?auto_369351 ?auto_369352 ?auto_369353 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_370114 - DIRECTION
      ?auto_370115 - MODE
      ?auto_370117 - DIRECTION
      ?auto_370116 - MODE
      ?auto_370118 - DIRECTION
      ?auto_370119 - MODE
      ?auto_370120 - DIRECTION
      ?auto_370121 - MODE
      ?auto_370122 - DIRECTION
      ?auto_370123 - MODE
    )
    :vars
    (
      ?auto_370131 - INSTRUMENT
      ?auto_370124 - SATELLITE
      ?auto_370125 - DIRECTION
      ?auto_370130 - INSTRUMENT
      ?auto_370127 - INSTRUMENT
      ?auto_370128 - INSTRUMENT
      ?auto_370129 - INSTRUMENT
      ?auto_370126 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_370117 ?auto_370114 ) ) ( not ( = ?auto_370118 ?auto_370114 ) ) ( not ( = ?auto_370118 ?auto_370117 ) ) ( not ( = ?auto_370120 ?auto_370114 ) ) ( not ( = ?auto_370120 ?auto_370117 ) ) ( not ( = ?auto_370120 ?auto_370118 ) ) ( not ( = ?auto_370122 ?auto_370114 ) ) ( not ( = ?auto_370122 ?auto_370117 ) ) ( not ( = ?auto_370122 ?auto_370118 ) ) ( not ( = ?auto_370122 ?auto_370120 ) ) ( ON_BOARD ?auto_370131 ?auto_370124 ) ( SUPPORTS ?auto_370131 ?auto_370115 ) ( not ( = ?auto_370114 ?auto_370125 ) ) ( CALIBRATION_TARGET ?auto_370131 ?auto_370125 ) ( not ( = ?auto_370125 ?auto_370118 ) ) ( ON_BOARD ?auto_370130 ?auto_370124 ) ( not ( = ?auto_370131 ?auto_370130 ) ) ( SUPPORTS ?auto_370130 ?auto_370119 ) ( CALIBRATION_TARGET ?auto_370130 ?auto_370125 ) ( not ( = ?auto_370125 ?auto_370117 ) ) ( ON_BOARD ?auto_370127 ?auto_370124 ) ( not ( = ?auto_370130 ?auto_370127 ) ) ( SUPPORTS ?auto_370127 ?auto_370116 ) ( CALIBRATION_TARGET ?auto_370127 ?auto_370125 ) ( not ( = ?auto_370125 ?auto_370122 ) ) ( ON_BOARD ?auto_370128 ?auto_370124 ) ( not ( = ?auto_370127 ?auto_370128 ) ) ( SUPPORTS ?auto_370128 ?auto_370123 ) ( CALIBRATION_TARGET ?auto_370128 ?auto_370125 ) ( not ( = ?auto_370125 ?auto_370120 ) ) ( ON_BOARD ?auto_370129 ?auto_370124 ) ( not ( = ?auto_370128 ?auto_370129 ) ) ( SUPPORTS ?auto_370129 ?auto_370121 ) ( CALIBRATION_TARGET ?auto_370129 ?auto_370125 ) ( POWER_AVAIL ?auto_370124 ) ( POINTING ?auto_370124 ?auto_370126 ) ( not ( = ?auto_370125 ?auto_370126 ) ) ( not ( = ?auto_370120 ?auto_370126 ) ) ( not ( = ?auto_370121 ?auto_370123 ) ) ( not ( = ?auto_370122 ?auto_370126 ) ) ( not ( = ?auto_370121 ?auto_370116 ) ) ( not ( = ?auto_370123 ?auto_370116 ) ) ( not ( = ?auto_370117 ?auto_370126 ) ) ( not ( = ?auto_370127 ?auto_370129 ) ) ( not ( = ?auto_370121 ?auto_370119 ) ) ( not ( = ?auto_370123 ?auto_370119 ) ) ( not ( = ?auto_370116 ?auto_370119 ) ) ( not ( = ?auto_370118 ?auto_370126 ) ) ( not ( = ?auto_370130 ?auto_370128 ) ) ( not ( = ?auto_370130 ?auto_370129 ) ) ( not ( = ?auto_370121 ?auto_370115 ) ) ( not ( = ?auto_370123 ?auto_370115 ) ) ( not ( = ?auto_370116 ?auto_370115 ) ) ( not ( = ?auto_370119 ?auto_370115 ) ) ( not ( = ?auto_370114 ?auto_370126 ) ) ( not ( = ?auto_370131 ?auto_370127 ) ) ( not ( = ?auto_370131 ?auto_370128 ) ) ( not ( = ?auto_370131 ?auto_370129 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_370120 ?auto_370121 ?auto_370122 ?auto_370123 ?auto_370117 ?auto_370116 ?auto_370114 ?auto_370115 ?auto_370118 ?auto_370119 )
      ( GET-5IMAGE-VERIFY ?auto_370114 ?auto_370115 ?auto_370117 ?auto_370116 ?auto_370118 ?auto_370119 ?auto_370120 ?auto_370121 ?auto_370122 ?auto_370123 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_370192 - DIRECTION
      ?auto_370193 - MODE
      ?auto_370195 - DIRECTION
      ?auto_370194 - MODE
      ?auto_370196 - DIRECTION
      ?auto_370197 - MODE
      ?auto_370198 - DIRECTION
      ?auto_370199 - MODE
      ?auto_370200 - DIRECTION
      ?auto_370201 - MODE
    )
    :vars
    (
      ?auto_370209 - INSTRUMENT
      ?auto_370202 - SATELLITE
      ?auto_370203 - DIRECTION
      ?auto_370208 - INSTRUMENT
      ?auto_370205 - INSTRUMENT
      ?auto_370206 - INSTRUMENT
      ?auto_370207 - INSTRUMENT
      ?auto_370204 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_370195 ?auto_370192 ) ) ( not ( = ?auto_370196 ?auto_370192 ) ) ( not ( = ?auto_370196 ?auto_370195 ) ) ( not ( = ?auto_370198 ?auto_370192 ) ) ( not ( = ?auto_370198 ?auto_370195 ) ) ( not ( = ?auto_370198 ?auto_370196 ) ) ( not ( = ?auto_370200 ?auto_370192 ) ) ( not ( = ?auto_370200 ?auto_370195 ) ) ( not ( = ?auto_370200 ?auto_370196 ) ) ( not ( = ?auto_370200 ?auto_370198 ) ) ( ON_BOARD ?auto_370209 ?auto_370202 ) ( SUPPORTS ?auto_370209 ?auto_370193 ) ( not ( = ?auto_370192 ?auto_370203 ) ) ( CALIBRATION_TARGET ?auto_370209 ?auto_370203 ) ( not ( = ?auto_370203 ?auto_370196 ) ) ( ON_BOARD ?auto_370208 ?auto_370202 ) ( not ( = ?auto_370209 ?auto_370208 ) ) ( SUPPORTS ?auto_370208 ?auto_370197 ) ( CALIBRATION_TARGET ?auto_370208 ?auto_370203 ) ( not ( = ?auto_370203 ?auto_370195 ) ) ( ON_BOARD ?auto_370205 ?auto_370202 ) ( not ( = ?auto_370208 ?auto_370205 ) ) ( SUPPORTS ?auto_370205 ?auto_370194 ) ( CALIBRATION_TARGET ?auto_370205 ?auto_370203 ) ( not ( = ?auto_370203 ?auto_370198 ) ) ( ON_BOARD ?auto_370206 ?auto_370202 ) ( not ( = ?auto_370205 ?auto_370206 ) ) ( SUPPORTS ?auto_370206 ?auto_370199 ) ( CALIBRATION_TARGET ?auto_370206 ?auto_370203 ) ( not ( = ?auto_370203 ?auto_370200 ) ) ( ON_BOARD ?auto_370207 ?auto_370202 ) ( not ( = ?auto_370206 ?auto_370207 ) ) ( SUPPORTS ?auto_370207 ?auto_370201 ) ( CALIBRATION_TARGET ?auto_370207 ?auto_370203 ) ( POWER_AVAIL ?auto_370202 ) ( POINTING ?auto_370202 ?auto_370204 ) ( not ( = ?auto_370203 ?auto_370204 ) ) ( not ( = ?auto_370200 ?auto_370204 ) ) ( not ( = ?auto_370201 ?auto_370199 ) ) ( not ( = ?auto_370198 ?auto_370204 ) ) ( not ( = ?auto_370201 ?auto_370194 ) ) ( not ( = ?auto_370199 ?auto_370194 ) ) ( not ( = ?auto_370195 ?auto_370204 ) ) ( not ( = ?auto_370205 ?auto_370207 ) ) ( not ( = ?auto_370201 ?auto_370197 ) ) ( not ( = ?auto_370199 ?auto_370197 ) ) ( not ( = ?auto_370194 ?auto_370197 ) ) ( not ( = ?auto_370196 ?auto_370204 ) ) ( not ( = ?auto_370208 ?auto_370206 ) ) ( not ( = ?auto_370208 ?auto_370207 ) ) ( not ( = ?auto_370201 ?auto_370193 ) ) ( not ( = ?auto_370199 ?auto_370193 ) ) ( not ( = ?auto_370194 ?auto_370193 ) ) ( not ( = ?auto_370197 ?auto_370193 ) ) ( not ( = ?auto_370192 ?auto_370204 ) ) ( not ( = ?auto_370209 ?auto_370205 ) ) ( not ( = ?auto_370209 ?auto_370206 ) ) ( not ( = ?auto_370209 ?auto_370207 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_370200 ?auto_370201 ?auto_370198 ?auto_370199 ?auto_370195 ?auto_370194 ?auto_370192 ?auto_370193 ?auto_370196 ?auto_370197 )
      ( GET-5IMAGE-VERIFY ?auto_370192 ?auto_370193 ?auto_370195 ?auto_370194 ?auto_370196 ?auto_370197 ?auto_370198 ?auto_370199 ?auto_370200 ?auto_370201 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_371300 - DIRECTION
      ?auto_371301 - MODE
      ?auto_371303 - DIRECTION
      ?auto_371302 - MODE
      ?auto_371304 - DIRECTION
      ?auto_371305 - MODE
      ?auto_371306 - DIRECTION
      ?auto_371307 - MODE
      ?auto_371308 - DIRECTION
      ?auto_371309 - MODE
    )
    :vars
    (
      ?auto_371317 - INSTRUMENT
      ?auto_371310 - SATELLITE
      ?auto_371311 - DIRECTION
      ?auto_371316 - INSTRUMENT
      ?auto_371313 - INSTRUMENT
      ?auto_371314 - INSTRUMENT
      ?auto_371315 - INSTRUMENT
      ?auto_371312 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_371303 ?auto_371300 ) ) ( not ( = ?auto_371304 ?auto_371300 ) ) ( not ( = ?auto_371304 ?auto_371303 ) ) ( not ( = ?auto_371306 ?auto_371300 ) ) ( not ( = ?auto_371306 ?auto_371303 ) ) ( not ( = ?auto_371306 ?auto_371304 ) ) ( not ( = ?auto_371308 ?auto_371300 ) ) ( not ( = ?auto_371308 ?auto_371303 ) ) ( not ( = ?auto_371308 ?auto_371304 ) ) ( not ( = ?auto_371308 ?auto_371306 ) ) ( ON_BOARD ?auto_371317 ?auto_371310 ) ( SUPPORTS ?auto_371317 ?auto_371301 ) ( not ( = ?auto_371300 ?auto_371311 ) ) ( CALIBRATION_TARGET ?auto_371317 ?auto_371311 ) ( not ( = ?auto_371311 ?auto_371303 ) ) ( ON_BOARD ?auto_371316 ?auto_371310 ) ( not ( = ?auto_371317 ?auto_371316 ) ) ( SUPPORTS ?auto_371316 ?auto_371302 ) ( CALIBRATION_TARGET ?auto_371316 ?auto_371311 ) ( not ( = ?auto_371311 ?auto_371308 ) ) ( ON_BOARD ?auto_371313 ?auto_371310 ) ( not ( = ?auto_371316 ?auto_371313 ) ) ( SUPPORTS ?auto_371313 ?auto_371309 ) ( CALIBRATION_TARGET ?auto_371313 ?auto_371311 ) ( not ( = ?auto_371311 ?auto_371306 ) ) ( ON_BOARD ?auto_371314 ?auto_371310 ) ( not ( = ?auto_371313 ?auto_371314 ) ) ( SUPPORTS ?auto_371314 ?auto_371307 ) ( CALIBRATION_TARGET ?auto_371314 ?auto_371311 ) ( not ( = ?auto_371311 ?auto_371304 ) ) ( ON_BOARD ?auto_371315 ?auto_371310 ) ( not ( = ?auto_371314 ?auto_371315 ) ) ( SUPPORTS ?auto_371315 ?auto_371305 ) ( CALIBRATION_TARGET ?auto_371315 ?auto_371311 ) ( POWER_AVAIL ?auto_371310 ) ( POINTING ?auto_371310 ?auto_371312 ) ( not ( = ?auto_371311 ?auto_371312 ) ) ( not ( = ?auto_371304 ?auto_371312 ) ) ( not ( = ?auto_371305 ?auto_371307 ) ) ( not ( = ?auto_371306 ?auto_371312 ) ) ( not ( = ?auto_371305 ?auto_371309 ) ) ( not ( = ?auto_371307 ?auto_371309 ) ) ( not ( = ?auto_371308 ?auto_371312 ) ) ( not ( = ?auto_371313 ?auto_371315 ) ) ( not ( = ?auto_371305 ?auto_371302 ) ) ( not ( = ?auto_371307 ?auto_371302 ) ) ( not ( = ?auto_371309 ?auto_371302 ) ) ( not ( = ?auto_371303 ?auto_371312 ) ) ( not ( = ?auto_371316 ?auto_371314 ) ) ( not ( = ?auto_371316 ?auto_371315 ) ) ( not ( = ?auto_371305 ?auto_371301 ) ) ( not ( = ?auto_371307 ?auto_371301 ) ) ( not ( = ?auto_371309 ?auto_371301 ) ) ( not ( = ?auto_371302 ?auto_371301 ) ) ( not ( = ?auto_371300 ?auto_371312 ) ) ( not ( = ?auto_371317 ?auto_371313 ) ) ( not ( = ?auto_371317 ?auto_371314 ) ) ( not ( = ?auto_371317 ?auto_371315 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_371304 ?auto_371305 ?auto_371306 ?auto_371307 ?auto_371308 ?auto_371309 ?auto_371300 ?auto_371301 ?auto_371303 ?auto_371302 )
      ( GET-5IMAGE-VERIFY ?auto_371300 ?auto_371301 ?auto_371303 ?auto_371302 ?auto_371304 ?auto_371305 ?auto_371306 ?auto_371307 ?auto_371308 ?auto_371309 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_371378 - DIRECTION
      ?auto_371379 - MODE
      ?auto_371381 - DIRECTION
      ?auto_371380 - MODE
      ?auto_371382 - DIRECTION
      ?auto_371383 - MODE
      ?auto_371384 - DIRECTION
      ?auto_371385 - MODE
      ?auto_371386 - DIRECTION
      ?auto_371387 - MODE
    )
    :vars
    (
      ?auto_371395 - INSTRUMENT
      ?auto_371388 - SATELLITE
      ?auto_371389 - DIRECTION
      ?auto_371394 - INSTRUMENT
      ?auto_371391 - INSTRUMENT
      ?auto_371392 - INSTRUMENT
      ?auto_371393 - INSTRUMENT
      ?auto_371390 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_371381 ?auto_371378 ) ) ( not ( = ?auto_371382 ?auto_371378 ) ) ( not ( = ?auto_371382 ?auto_371381 ) ) ( not ( = ?auto_371384 ?auto_371378 ) ) ( not ( = ?auto_371384 ?auto_371381 ) ) ( not ( = ?auto_371384 ?auto_371382 ) ) ( not ( = ?auto_371386 ?auto_371378 ) ) ( not ( = ?auto_371386 ?auto_371381 ) ) ( not ( = ?auto_371386 ?auto_371382 ) ) ( not ( = ?auto_371386 ?auto_371384 ) ) ( ON_BOARD ?auto_371395 ?auto_371388 ) ( SUPPORTS ?auto_371395 ?auto_371379 ) ( not ( = ?auto_371378 ?auto_371389 ) ) ( CALIBRATION_TARGET ?auto_371395 ?auto_371389 ) ( not ( = ?auto_371389 ?auto_371381 ) ) ( ON_BOARD ?auto_371394 ?auto_371388 ) ( not ( = ?auto_371395 ?auto_371394 ) ) ( SUPPORTS ?auto_371394 ?auto_371380 ) ( CALIBRATION_TARGET ?auto_371394 ?auto_371389 ) ( not ( = ?auto_371389 ?auto_371384 ) ) ( ON_BOARD ?auto_371391 ?auto_371388 ) ( not ( = ?auto_371394 ?auto_371391 ) ) ( SUPPORTS ?auto_371391 ?auto_371385 ) ( CALIBRATION_TARGET ?auto_371391 ?auto_371389 ) ( not ( = ?auto_371389 ?auto_371386 ) ) ( ON_BOARD ?auto_371392 ?auto_371388 ) ( not ( = ?auto_371391 ?auto_371392 ) ) ( SUPPORTS ?auto_371392 ?auto_371387 ) ( CALIBRATION_TARGET ?auto_371392 ?auto_371389 ) ( not ( = ?auto_371389 ?auto_371382 ) ) ( ON_BOARD ?auto_371393 ?auto_371388 ) ( not ( = ?auto_371392 ?auto_371393 ) ) ( SUPPORTS ?auto_371393 ?auto_371383 ) ( CALIBRATION_TARGET ?auto_371393 ?auto_371389 ) ( POWER_AVAIL ?auto_371388 ) ( POINTING ?auto_371388 ?auto_371390 ) ( not ( = ?auto_371389 ?auto_371390 ) ) ( not ( = ?auto_371382 ?auto_371390 ) ) ( not ( = ?auto_371383 ?auto_371387 ) ) ( not ( = ?auto_371386 ?auto_371390 ) ) ( not ( = ?auto_371383 ?auto_371385 ) ) ( not ( = ?auto_371387 ?auto_371385 ) ) ( not ( = ?auto_371384 ?auto_371390 ) ) ( not ( = ?auto_371391 ?auto_371393 ) ) ( not ( = ?auto_371383 ?auto_371380 ) ) ( not ( = ?auto_371387 ?auto_371380 ) ) ( not ( = ?auto_371385 ?auto_371380 ) ) ( not ( = ?auto_371381 ?auto_371390 ) ) ( not ( = ?auto_371394 ?auto_371392 ) ) ( not ( = ?auto_371394 ?auto_371393 ) ) ( not ( = ?auto_371383 ?auto_371379 ) ) ( not ( = ?auto_371387 ?auto_371379 ) ) ( not ( = ?auto_371385 ?auto_371379 ) ) ( not ( = ?auto_371380 ?auto_371379 ) ) ( not ( = ?auto_371378 ?auto_371390 ) ) ( not ( = ?auto_371395 ?auto_371391 ) ) ( not ( = ?auto_371395 ?auto_371392 ) ) ( not ( = ?auto_371395 ?auto_371393 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_371382 ?auto_371383 ?auto_371386 ?auto_371387 ?auto_371384 ?auto_371385 ?auto_371378 ?auto_371379 ?auto_371381 ?auto_371380 )
      ( GET-5IMAGE-VERIFY ?auto_371378 ?auto_371379 ?auto_371381 ?auto_371380 ?auto_371382 ?auto_371383 ?auto_371384 ?auto_371385 ?auto_371386 ?auto_371387 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_371708 - DIRECTION
      ?auto_371709 - MODE
      ?auto_371711 - DIRECTION
      ?auto_371710 - MODE
      ?auto_371712 - DIRECTION
      ?auto_371713 - MODE
      ?auto_371714 - DIRECTION
      ?auto_371715 - MODE
      ?auto_371716 - DIRECTION
      ?auto_371717 - MODE
    )
    :vars
    (
      ?auto_371725 - INSTRUMENT
      ?auto_371718 - SATELLITE
      ?auto_371719 - DIRECTION
      ?auto_371724 - INSTRUMENT
      ?auto_371721 - INSTRUMENT
      ?auto_371722 - INSTRUMENT
      ?auto_371723 - INSTRUMENT
      ?auto_371720 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_371711 ?auto_371708 ) ) ( not ( = ?auto_371712 ?auto_371708 ) ) ( not ( = ?auto_371712 ?auto_371711 ) ) ( not ( = ?auto_371714 ?auto_371708 ) ) ( not ( = ?auto_371714 ?auto_371711 ) ) ( not ( = ?auto_371714 ?auto_371712 ) ) ( not ( = ?auto_371716 ?auto_371708 ) ) ( not ( = ?auto_371716 ?auto_371711 ) ) ( not ( = ?auto_371716 ?auto_371712 ) ) ( not ( = ?auto_371716 ?auto_371714 ) ) ( ON_BOARD ?auto_371725 ?auto_371718 ) ( SUPPORTS ?auto_371725 ?auto_371709 ) ( not ( = ?auto_371708 ?auto_371719 ) ) ( CALIBRATION_TARGET ?auto_371725 ?auto_371719 ) ( not ( = ?auto_371719 ?auto_371711 ) ) ( ON_BOARD ?auto_371724 ?auto_371718 ) ( not ( = ?auto_371725 ?auto_371724 ) ) ( SUPPORTS ?auto_371724 ?auto_371710 ) ( CALIBRATION_TARGET ?auto_371724 ?auto_371719 ) ( not ( = ?auto_371719 ?auto_371716 ) ) ( ON_BOARD ?auto_371721 ?auto_371718 ) ( not ( = ?auto_371724 ?auto_371721 ) ) ( SUPPORTS ?auto_371721 ?auto_371717 ) ( CALIBRATION_TARGET ?auto_371721 ?auto_371719 ) ( not ( = ?auto_371719 ?auto_371712 ) ) ( ON_BOARD ?auto_371722 ?auto_371718 ) ( not ( = ?auto_371721 ?auto_371722 ) ) ( SUPPORTS ?auto_371722 ?auto_371713 ) ( CALIBRATION_TARGET ?auto_371722 ?auto_371719 ) ( not ( = ?auto_371719 ?auto_371714 ) ) ( ON_BOARD ?auto_371723 ?auto_371718 ) ( not ( = ?auto_371722 ?auto_371723 ) ) ( SUPPORTS ?auto_371723 ?auto_371715 ) ( CALIBRATION_TARGET ?auto_371723 ?auto_371719 ) ( POWER_AVAIL ?auto_371718 ) ( POINTING ?auto_371718 ?auto_371720 ) ( not ( = ?auto_371719 ?auto_371720 ) ) ( not ( = ?auto_371714 ?auto_371720 ) ) ( not ( = ?auto_371715 ?auto_371713 ) ) ( not ( = ?auto_371712 ?auto_371720 ) ) ( not ( = ?auto_371715 ?auto_371717 ) ) ( not ( = ?auto_371713 ?auto_371717 ) ) ( not ( = ?auto_371716 ?auto_371720 ) ) ( not ( = ?auto_371721 ?auto_371723 ) ) ( not ( = ?auto_371715 ?auto_371710 ) ) ( not ( = ?auto_371713 ?auto_371710 ) ) ( not ( = ?auto_371717 ?auto_371710 ) ) ( not ( = ?auto_371711 ?auto_371720 ) ) ( not ( = ?auto_371724 ?auto_371722 ) ) ( not ( = ?auto_371724 ?auto_371723 ) ) ( not ( = ?auto_371715 ?auto_371709 ) ) ( not ( = ?auto_371713 ?auto_371709 ) ) ( not ( = ?auto_371717 ?auto_371709 ) ) ( not ( = ?auto_371710 ?auto_371709 ) ) ( not ( = ?auto_371708 ?auto_371720 ) ) ( not ( = ?auto_371725 ?auto_371721 ) ) ( not ( = ?auto_371725 ?auto_371722 ) ) ( not ( = ?auto_371725 ?auto_371723 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_371714 ?auto_371715 ?auto_371712 ?auto_371713 ?auto_371716 ?auto_371717 ?auto_371708 ?auto_371709 ?auto_371711 ?auto_371710 )
      ( GET-5IMAGE-VERIFY ?auto_371708 ?auto_371709 ?auto_371711 ?auto_371710 ?auto_371712 ?auto_371713 ?auto_371714 ?auto_371715 ?auto_371716 ?auto_371717 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_371872 - DIRECTION
      ?auto_371873 - MODE
      ?auto_371875 - DIRECTION
      ?auto_371874 - MODE
      ?auto_371876 - DIRECTION
      ?auto_371877 - MODE
      ?auto_371878 - DIRECTION
      ?auto_371879 - MODE
      ?auto_371880 - DIRECTION
      ?auto_371881 - MODE
    )
    :vars
    (
      ?auto_371889 - INSTRUMENT
      ?auto_371882 - SATELLITE
      ?auto_371883 - DIRECTION
      ?auto_371888 - INSTRUMENT
      ?auto_371885 - INSTRUMENT
      ?auto_371886 - INSTRUMENT
      ?auto_371887 - INSTRUMENT
      ?auto_371884 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_371875 ?auto_371872 ) ) ( not ( = ?auto_371876 ?auto_371872 ) ) ( not ( = ?auto_371876 ?auto_371875 ) ) ( not ( = ?auto_371878 ?auto_371872 ) ) ( not ( = ?auto_371878 ?auto_371875 ) ) ( not ( = ?auto_371878 ?auto_371876 ) ) ( not ( = ?auto_371880 ?auto_371872 ) ) ( not ( = ?auto_371880 ?auto_371875 ) ) ( not ( = ?auto_371880 ?auto_371876 ) ) ( not ( = ?auto_371880 ?auto_371878 ) ) ( ON_BOARD ?auto_371889 ?auto_371882 ) ( SUPPORTS ?auto_371889 ?auto_371873 ) ( not ( = ?auto_371872 ?auto_371883 ) ) ( CALIBRATION_TARGET ?auto_371889 ?auto_371883 ) ( not ( = ?auto_371883 ?auto_371875 ) ) ( ON_BOARD ?auto_371888 ?auto_371882 ) ( not ( = ?auto_371889 ?auto_371888 ) ) ( SUPPORTS ?auto_371888 ?auto_371874 ) ( CALIBRATION_TARGET ?auto_371888 ?auto_371883 ) ( not ( = ?auto_371883 ?auto_371878 ) ) ( ON_BOARD ?auto_371885 ?auto_371882 ) ( not ( = ?auto_371888 ?auto_371885 ) ) ( SUPPORTS ?auto_371885 ?auto_371879 ) ( CALIBRATION_TARGET ?auto_371885 ?auto_371883 ) ( not ( = ?auto_371883 ?auto_371876 ) ) ( ON_BOARD ?auto_371886 ?auto_371882 ) ( not ( = ?auto_371885 ?auto_371886 ) ) ( SUPPORTS ?auto_371886 ?auto_371877 ) ( CALIBRATION_TARGET ?auto_371886 ?auto_371883 ) ( not ( = ?auto_371883 ?auto_371880 ) ) ( ON_BOARD ?auto_371887 ?auto_371882 ) ( not ( = ?auto_371886 ?auto_371887 ) ) ( SUPPORTS ?auto_371887 ?auto_371881 ) ( CALIBRATION_TARGET ?auto_371887 ?auto_371883 ) ( POWER_AVAIL ?auto_371882 ) ( POINTING ?auto_371882 ?auto_371884 ) ( not ( = ?auto_371883 ?auto_371884 ) ) ( not ( = ?auto_371880 ?auto_371884 ) ) ( not ( = ?auto_371881 ?auto_371877 ) ) ( not ( = ?auto_371876 ?auto_371884 ) ) ( not ( = ?auto_371881 ?auto_371879 ) ) ( not ( = ?auto_371877 ?auto_371879 ) ) ( not ( = ?auto_371878 ?auto_371884 ) ) ( not ( = ?auto_371885 ?auto_371887 ) ) ( not ( = ?auto_371881 ?auto_371874 ) ) ( not ( = ?auto_371877 ?auto_371874 ) ) ( not ( = ?auto_371879 ?auto_371874 ) ) ( not ( = ?auto_371875 ?auto_371884 ) ) ( not ( = ?auto_371888 ?auto_371886 ) ) ( not ( = ?auto_371888 ?auto_371887 ) ) ( not ( = ?auto_371881 ?auto_371873 ) ) ( not ( = ?auto_371877 ?auto_371873 ) ) ( not ( = ?auto_371879 ?auto_371873 ) ) ( not ( = ?auto_371874 ?auto_371873 ) ) ( not ( = ?auto_371872 ?auto_371884 ) ) ( not ( = ?auto_371889 ?auto_371885 ) ) ( not ( = ?auto_371889 ?auto_371886 ) ) ( not ( = ?auto_371889 ?auto_371887 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_371880 ?auto_371881 ?auto_371876 ?auto_371877 ?auto_371878 ?auto_371879 ?auto_371872 ?auto_371873 ?auto_371875 ?auto_371874 )
      ( GET-5IMAGE-VERIFY ?auto_371872 ?auto_371873 ?auto_371875 ?auto_371874 ?auto_371876 ?auto_371877 ?auto_371878 ?auto_371879 ?auto_371880 ?auto_371881 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_372202 - DIRECTION
      ?auto_372203 - MODE
      ?auto_372205 - DIRECTION
      ?auto_372204 - MODE
      ?auto_372206 - DIRECTION
      ?auto_372207 - MODE
      ?auto_372208 - DIRECTION
      ?auto_372209 - MODE
      ?auto_372210 - DIRECTION
      ?auto_372211 - MODE
    )
    :vars
    (
      ?auto_372219 - INSTRUMENT
      ?auto_372212 - SATELLITE
      ?auto_372213 - DIRECTION
      ?auto_372218 - INSTRUMENT
      ?auto_372215 - INSTRUMENT
      ?auto_372216 - INSTRUMENT
      ?auto_372217 - INSTRUMENT
      ?auto_372214 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_372205 ?auto_372202 ) ) ( not ( = ?auto_372206 ?auto_372202 ) ) ( not ( = ?auto_372206 ?auto_372205 ) ) ( not ( = ?auto_372208 ?auto_372202 ) ) ( not ( = ?auto_372208 ?auto_372205 ) ) ( not ( = ?auto_372208 ?auto_372206 ) ) ( not ( = ?auto_372210 ?auto_372202 ) ) ( not ( = ?auto_372210 ?auto_372205 ) ) ( not ( = ?auto_372210 ?auto_372206 ) ) ( not ( = ?auto_372210 ?auto_372208 ) ) ( ON_BOARD ?auto_372219 ?auto_372212 ) ( SUPPORTS ?auto_372219 ?auto_372203 ) ( not ( = ?auto_372202 ?auto_372213 ) ) ( CALIBRATION_TARGET ?auto_372219 ?auto_372213 ) ( not ( = ?auto_372213 ?auto_372205 ) ) ( ON_BOARD ?auto_372218 ?auto_372212 ) ( not ( = ?auto_372219 ?auto_372218 ) ) ( SUPPORTS ?auto_372218 ?auto_372204 ) ( CALIBRATION_TARGET ?auto_372218 ?auto_372213 ) ( not ( = ?auto_372213 ?auto_372206 ) ) ( ON_BOARD ?auto_372215 ?auto_372212 ) ( not ( = ?auto_372218 ?auto_372215 ) ) ( SUPPORTS ?auto_372215 ?auto_372207 ) ( CALIBRATION_TARGET ?auto_372215 ?auto_372213 ) ( not ( = ?auto_372213 ?auto_372210 ) ) ( ON_BOARD ?auto_372216 ?auto_372212 ) ( not ( = ?auto_372215 ?auto_372216 ) ) ( SUPPORTS ?auto_372216 ?auto_372211 ) ( CALIBRATION_TARGET ?auto_372216 ?auto_372213 ) ( not ( = ?auto_372213 ?auto_372208 ) ) ( ON_BOARD ?auto_372217 ?auto_372212 ) ( not ( = ?auto_372216 ?auto_372217 ) ) ( SUPPORTS ?auto_372217 ?auto_372209 ) ( CALIBRATION_TARGET ?auto_372217 ?auto_372213 ) ( POWER_AVAIL ?auto_372212 ) ( POINTING ?auto_372212 ?auto_372214 ) ( not ( = ?auto_372213 ?auto_372214 ) ) ( not ( = ?auto_372208 ?auto_372214 ) ) ( not ( = ?auto_372209 ?auto_372211 ) ) ( not ( = ?auto_372210 ?auto_372214 ) ) ( not ( = ?auto_372209 ?auto_372207 ) ) ( not ( = ?auto_372211 ?auto_372207 ) ) ( not ( = ?auto_372206 ?auto_372214 ) ) ( not ( = ?auto_372215 ?auto_372217 ) ) ( not ( = ?auto_372209 ?auto_372204 ) ) ( not ( = ?auto_372211 ?auto_372204 ) ) ( not ( = ?auto_372207 ?auto_372204 ) ) ( not ( = ?auto_372205 ?auto_372214 ) ) ( not ( = ?auto_372218 ?auto_372216 ) ) ( not ( = ?auto_372218 ?auto_372217 ) ) ( not ( = ?auto_372209 ?auto_372203 ) ) ( not ( = ?auto_372211 ?auto_372203 ) ) ( not ( = ?auto_372207 ?auto_372203 ) ) ( not ( = ?auto_372204 ?auto_372203 ) ) ( not ( = ?auto_372202 ?auto_372214 ) ) ( not ( = ?auto_372219 ?auto_372215 ) ) ( not ( = ?auto_372219 ?auto_372216 ) ) ( not ( = ?auto_372219 ?auto_372217 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_372208 ?auto_372209 ?auto_372210 ?auto_372211 ?auto_372206 ?auto_372207 ?auto_372202 ?auto_372203 ?auto_372205 ?auto_372204 )
      ( GET-5IMAGE-VERIFY ?auto_372202 ?auto_372203 ?auto_372205 ?auto_372204 ?auto_372206 ?auto_372207 ?auto_372208 ?auto_372209 ?auto_372210 ?auto_372211 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_372280 - DIRECTION
      ?auto_372281 - MODE
      ?auto_372283 - DIRECTION
      ?auto_372282 - MODE
      ?auto_372284 - DIRECTION
      ?auto_372285 - MODE
      ?auto_372286 - DIRECTION
      ?auto_372287 - MODE
      ?auto_372288 - DIRECTION
      ?auto_372289 - MODE
    )
    :vars
    (
      ?auto_372297 - INSTRUMENT
      ?auto_372290 - SATELLITE
      ?auto_372291 - DIRECTION
      ?auto_372296 - INSTRUMENT
      ?auto_372293 - INSTRUMENT
      ?auto_372294 - INSTRUMENT
      ?auto_372295 - INSTRUMENT
      ?auto_372292 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_372283 ?auto_372280 ) ) ( not ( = ?auto_372284 ?auto_372280 ) ) ( not ( = ?auto_372284 ?auto_372283 ) ) ( not ( = ?auto_372286 ?auto_372280 ) ) ( not ( = ?auto_372286 ?auto_372283 ) ) ( not ( = ?auto_372286 ?auto_372284 ) ) ( not ( = ?auto_372288 ?auto_372280 ) ) ( not ( = ?auto_372288 ?auto_372283 ) ) ( not ( = ?auto_372288 ?auto_372284 ) ) ( not ( = ?auto_372288 ?auto_372286 ) ) ( ON_BOARD ?auto_372297 ?auto_372290 ) ( SUPPORTS ?auto_372297 ?auto_372281 ) ( not ( = ?auto_372280 ?auto_372291 ) ) ( CALIBRATION_TARGET ?auto_372297 ?auto_372291 ) ( not ( = ?auto_372291 ?auto_372283 ) ) ( ON_BOARD ?auto_372296 ?auto_372290 ) ( not ( = ?auto_372297 ?auto_372296 ) ) ( SUPPORTS ?auto_372296 ?auto_372282 ) ( CALIBRATION_TARGET ?auto_372296 ?auto_372291 ) ( not ( = ?auto_372291 ?auto_372284 ) ) ( ON_BOARD ?auto_372293 ?auto_372290 ) ( not ( = ?auto_372296 ?auto_372293 ) ) ( SUPPORTS ?auto_372293 ?auto_372285 ) ( CALIBRATION_TARGET ?auto_372293 ?auto_372291 ) ( not ( = ?auto_372291 ?auto_372286 ) ) ( ON_BOARD ?auto_372294 ?auto_372290 ) ( not ( = ?auto_372293 ?auto_372294 ) ) ( SUPPORTS ?auto_372294 ?auto_372287 ) ( CALIBRATION_TARGET ?auto_372294 ?auto_372291 ) ( not ( = ?auto_372291 ?auto_372288 ) ) ( ON_BOARD ?auto_372295 ?auto_372290 ) ( not ( = ?auto_372294 ?auto_372295 ) ) ( SUPPORTS ?auto_372295 ?auto_372289 ) ( CALIBRATION_TARGET ?auto_372295 ?auto_372291 ) ( POWER_AVAIL ?auto_372290 ) ( POINTING ?auto_372290 ?auto_372292 ) ( not ( = ?auto_372291 ?auto_372292 ) ) ( not ( = ?auto_372288 ?auto_372292 ) ) ( not ( = ?auto_372289 ?auto_372287 ) ) ( not ( = ?auto_372286 ?auto_372292 ) ) ( not ( = ?auto_372289 ?auto_372285 ) ) ( not ( = ?auto_372287 ?auto_372285 ) ) ( not ( = ?auto_372284 ?auto_372292 ) ) ( not ( = ?auto_372293 ?auto_372295 ) ) ( not ( = ?auto_372289 ?auto_372282 ) ) ( not ( = ?auto_372287 ?auto_372282 ) ) ( not ( = ?auto_372285 ?auto_372282 ) ) ( not ( = ?auto_372283 ?auto_372292 ) ) ( not ( = ?auto_372296 ?auto_372294 ) ) ( not ( = ?auto_372296 ?auto_372295 ) ) ( not ( = ?auto_372289 ?auto_372281 ) ) ( not ( = ?auto_372287 ?auto_372281 ) ) ( not ( = ?auto_372285 ?auto_372281 ) ) ( not ( = ?auto_372282 ?auto_372281 ) ) ( not ( = ?auto_372280 ?auto_372292 ) ) ( not ( = ?auto_372297 ?auto_372293 ) ) ( not ( = ?auto_372297 ?auto_372294 ) ) ( not ( = ?auto_372297 ?auto_372295 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_372288 ?auto_372289 ?auto_372286 ?auto_372287 ?auto_372284 ?auto_372285 ?auto_372280 ?auto_372281 ?auto_372283 ?auto_372282 )
      ( GET-5IMAGE-VERIFY ?auto_372280 ?auto_372281 ?auto_372283 ?auto_372282 ?auto_372284 ?auto_372285 ?auto_372286 ?auto_372287 ?auto_372288 ?auto_372289 ) )
  )

)

