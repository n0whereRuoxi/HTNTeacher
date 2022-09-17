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
      ?auto_236660 - DIRECTION
      ?auto_236661 - MODE
    )
    :vars
    (
      ?auto_236662 - INSTRUMENT
      ?auto_236663 - SATELLITE
      ?auto_236664 - DIRECTION
      ?auto_236665 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_236662 ?auto_236663 ) ( SUPPORTS ?auto_236662 ?auto_236661 ) ( not ( = ?auto_236660 ?auto_236664 ) ) ( CALIBRATION_TARGET ?auto_236662 ?auto_236664 ) ( POWER_AVAIL ?auto_236663 ) ( POINTING ?auto_236663 ?auto_236665 ) ( not ( = ?auto_236664 ?auto_236665 ) ) ( not ( = ?auto_236660 ?auto_236665 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_236663 ?auto_236664 ?auto_236665 )
      ( !SWITCH_ON ?auto_236662 ?auto_236663 )
      ( !CALIBRATE ?auto_236663 ?auto_236662 ?auto_236664 )
      ( !TURN_TO ?auto_236663 ?auto_236660 ?auto_236664 )
      ( !TAKE_IMAGE ?auto_236663 ?auto_236660 ?auto_236662 ?auto_236661 )
      ( GET-1IMAGE-VERIFY ?auto_236660 ?auto_236661 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_236668 - DIRECTION
      ?auto_236669 - MODE
    )
    :vars
    (
      ?auto_236670 - INSTRUMENT
      ?auto_236671 - SATELLITE
      ?auto_236672 - DIRECTION
      ?auto_236673 - DIRECTION
      ?auto_236674 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_236670 ?auto_236671 ) ( SUPPORTS ?auto_236670 ?auto_236669 ) ( not ( = ?auto_236668 ?auto_236672 ) ) ( CALIBRATION_TARGET ?auto_236670 ?auto_236672 ) ( POINTING ?auto_236671 ?auto_236673 ) ( not ( = ?auto_236672 ?auto_236673 ) ) ( ON_BOARD ?auto_236674 ?auto_236671 ) ( POWER_ON ?auto_236674 ) ( not ( = ?auto_236668 ?auto_236673 ) ) ( not ( = ?auto_236670 ?auto_236674 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_236674 ?auto_236671 )
      ( !TURN_TO ?auto_236671 ?auto_236672 ?auto_236673 )
      ( !SWITCH_ON ?auto_236670 ?auto_236671 )
      ( !CALIBRATE ?auto_236671 ?auto_236670 ?auto_236672 )
      ( !TURN_TO ?auto_236671 ?auto_236668 ?auto_236672 )
      ( !TAKE_IMAGE ?auto_236671 ?auto_236668 ?auto_236670 ?auto_236669 )
      ( GET-1IMAGE-VERIFY ?auto_236668 ?auto_236669 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_236687 - DIRECTION
      ?auto_236688 - MODE
      ?auto_236690 - DIRECTION
      ?auto_236689 - MODE
    )
    :vars
    (
      ?auto_236693 - INSTRUMENT
      ?auto_236692 - SATELLITE
      ?auto_236694 - DIRECTION
      ?auto_236691 - INSTRUMENT
      ?auto_236695 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_236693 ?auto_236692 ) ( SUPPORTS ?auto_236693 ?auto_236689 ) ( not ( = ?auto_236690 ?auto_236694 ) ) ( CALIBRATION_TARGET ?auto_236693 ?auto_236694 ) ( not ( = ?auto_236694 ?auto_236687 ) ) ( ON_BOARD ?auto_236691 ?auto_236692 ) ( not ( = ?auto_236690 ?auto_236687 ) ) ( not ( = ?auto_236693 ?auto_236691 ) ) ( SUPPORTS ?auto_236691 ?auto_236688 ) ( CALIBRATION_TARGET ?auto_236691 ?auto_236694 ) ( POWER_AVAIL ?auto_236692 ) ( POINTING ?auto_236692 ?auto_236695 ) ( not ( = ?auto_236694 ?auto_236695 ) ) ( not ( = ?auto_236687 ?auto_236695 ) ) ( not ( = ?auto_236688 ?auto_236689 ) ) ( not ( = ?auto_236690 ?auto_236695 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_236687 ?auto_236688 )
      ( GET-1IMAGE ?auto_236690 ?auto_236689 )
      ( GET-2IMAGE-VERIFY ?auto_236687 ?auto_236688 ?auto_236690 ?auto_236689 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_236696 - DIRECTION
      ?auto_236697 - MODE
      ?auto_236699 - DIRECTION
      ?auto_236698 - MODE
    )
    :vars
    (
      ?auto_236702 - INSTRUMENT
      ?auto_236701 - SATELLITE
      ?auto_236700 - DIRECTION
      ?auto_236704 - INSTRUMENT
      ?auto_236703 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_236702 ?auto_236701 ) ( SUPPORTS ?auto_236702 ?auto_236697 ) ( not ( = ?auto_236696 ?auto_236700 ) ) ( CALIBRATION_TARGET ?auto_236702 ?auto_236700 ) ( not ( = ?auto_236700 ?auto_236699 ) ) ( ON_BOARD ?auto_236704 ?auto_236701 ) ( not ( = ?auto_236696 ?auto_236699 ) ) ( not ( = ?auto_236702 ?auto_236704 ) ) ( SUPPORTS ?auto_236704 ?auto_236698 ) ( CALIBRATION_TARGET ?auto_236704 ?auto_236700 ) ( POWER_AVAIL ?auto_236701 ) ( POINTING ?auto_236701 ?auto_236703 ) ( not ( = ?auto_236700 ?auto_236703 ) ) ( not ( = ?auto_236699 ?auto_236703 ) ) ( not ( = ?auto_236698 ?auto_236697 ) ) ( not ( = ?auto_236696 ?auto_236703 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_236699 ?auto_236698 ?auto_236696 ?auto_236697 )
      ( GET-2IMAGE-VERIFY ?auto_236696 ?auto_236697 ?auto_236699 ?auto_236698 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_236718 - DIRECTION
      ?auto_236719 - MODE
    )
    :vars
    (
      ?auto_236720 - INSTRUMENT
      ?auto_236721 - SATELLITE
      ?auto_236722 - DIRECTION
      ?auto_236723 - DIRECTION
      ?auto_236724 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_236720 ?auto_236721 ) ( SUPPORTS ?auto_236720 ?auto_236719 ) ( not ( = ?auto_236718 ?auto_236722 ) ) ( CALIBRATION_TARGET ?auto_236720 ?auto_236722 ) ( POINTING ?auto_236721 ?auto_236723 ) ( not ( = ?auto_236722 ?auto_236723 ) ) ( ON_BOARD ?auto_236724 ?auto_236721 ) ( POWER_ON ?auto_236724 ) ( not ( = ?auto_236718 ?auto_236723 ) ) ( not ( = ?auto_236720 ?auto_236724 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_236724 ?auto_236721 )
      ( !TURN_TO ?auto_236721 ?auto_236722 ?auto_236723 )
      ( !SWITCH_ON ?auto_236720 ?auto_236721 )
      ( !CALIBRATE ?auto_236721 ?auto_236720 ?auto_236722 )
      ( !TURN_TO ?auto_236721 ?auto_236718 ?auto_236722 )
      ( !TAKE_IMAGE ?auto_236721 ?auto_236718 ?auto_236720 ?auto_236719 )
      ( GET-1IMAGE-VERIFY ?auto_236718 ?auto_236719 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_236853 - DIRECTION
      ?auto_236854 - MODE
      ?auto_236856 - DIRECTION
      ?auto_236855 - MODE
      ?auto_236857 - DIRECTION
      ?auto_236858 - MODE
    )
    :vars
    (
      ?auto_236862 - INSTRUMENT
      ?auto_236861 - SATELLITE
      ?auto_236859 - DIRECTION
      ?auto_236860 - INSTRUMENT
      ?auto_236863 - INSTRUMENT
      ?auto_236864 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_236862 ?auto_236861 ) ( SUPPORTS ?auto_236862 ?auto_236858 ) ( not ( = ?auto_236857 ?auto_236859 ) ) ( CALIBRATION_TARGET ?auto_236862 ?auto_236859 ) ( not ( = ?auto_236859 ?auto_236856 ) ) ( ON_BOARD ?auto_236860 ?auto_236861 ) ( not ( = ?auto_236857 ?auto_236856 ) ) ( not ( = ?auto_236862 ?auto_236860 ) ) ( SUPPORTS ?auto_236860 ?auto_236855 ) ( CALIBRATION_TARGET ?auto_236860 ?auto_236859 ) ( not ( = ?auto_236859 ?auto_236853 ) ) ( ON_BOARD ?auto_236863 ?auto_236861 ) ( not ( = ?auto_236856 ?auto_236853 ) ) ( not ( = ?auto_236860 ?auto_236863 ) ) ( SUPPORTS ?auto_236863 ?auto_236854 ) ( CALIBRATION_TARGET ?auto_236863 ?auto_236859 ) ( POWER_AVAIL ?auto_236861 ) ( POINTING ?auto_236861 ?auto_236864 ) ( not ( = ?auto_236859 ?auto_236864 ) ) ( not ( = ?auto_236853 ?auto_236864 ) ) ( not ( = ?auto_236854 ?auto_236855 ) ) ( not ( = ?auto_236856 ?auto_236864 ) ) ( not ( = ?auto_236853 ?auto_236857 ) ) ( not ( = ?auto_236854 ?auto_236858 ) ) ( not ( = ?auto_236855 ?auto_236858 ) ) ( not ( = ?auto_236857 ?auto_236864 ) ) ( not ( = ?auto_236862 ?auto_236863 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_236856 ?auto_236855 ?auto_236853 ?auto_236854 )
      ( GET-1IMAGE ?auto_236857 ?auto_236858 )
      ( GET-3IMAGE-VERIFY ?auto_236853 ?auto_236854 ?auto_236856 ?auto_236855 ?auto_236857 ?auto_236858 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_236879 - DIRECTION
      ?auto_236880 - MODE
      ?auto_236882 - DIRECTION
      ?auto_236881 - MODE
      ?auto_236883 - DIRECTION
      ?auto_236884 - MODE
    )
    :vars
    (
      ?auto_236886 - INSTRUMENT
      ?auto_236885 - SATELLITE
      ?auto_236888 - DIRECTION
      ?auto_236887 - INSTRUMENT
      ?auto_236889 - INSTRUMENT
      ?auto_236890 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_236886 ?auto_236885 ) ( SUPPORTS ?auto_236886 ?auto_236881 ) ( not ( = ?auto_236882 ?auto_236888 ) ) ( CALIBRATION_TARGET ?auto_236886 ?auto_236888 ) ( not ( = ?auto_236888 ?auto_236883 ) ) ( ON_BOARD ?auto_236887 ?auto_236885 ) ( not ( = ?auto_236882 ?auto_236883 ) ) ( not ( = ?auto_236886 ?auto_236887 ) ) ( SUPPORTS ?auto_236887 ?auto_236884 ) ( CALIBRATION_TARGET ?auto_236887 ?auto_236888 ) ( not ( = ?auto_236888 ?auto_236879 ) ) ( ON_BOARD ?auto_236889 ?auto_236885 ) ( not ( = ?auto_236883 ?auto_236879 ) ) ( not ( = ?auto_236887 ?auto_236889 ) ) ( SUPPORTS ?auto_236889 ?auto_236880 ) ( CALIBRATION_TARGET ?auto_236889 ?auto_236888 ) ( POWER_AVAIL ?auto_236885 ) ( POINTING ?auto_236885 ?auto_236890 ) ( not ( = ?auto_236888 ?auto_236890 ) ) ( not ( = ?auto_236879 ?auto_236890 ) ) ( not ( = ?auto_236880 ?auto_236884 ) ) ( not ( = ?auto_236883 ?auto_236890 ) ) ( not ( = ?auto_236879 ?auto_236882 ) ) ( not ( = ?auto_236880 ?auto_236881 ) ) ( not ( = ?auto_236884 ?auto_236881 ) ) ( not ( = ?auto_236882 ?auto_236890 ) ) ( not ( = ?auto_236886 ?auto_236889 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_236879 ?auto_236880 ?auto_236883 ?auto_236884 ?auto_236882 ?auto_236881 )
      ( GET-3IMAGE-VERIFY ?auto_236879 ?auto_236880 ?auto_236882 ?auto_236881 ?auto_236883 ?auto_236884 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_236905 - DIRECTION
      ?auto_236906 - MODE
      ?auto_236908 - DIRECTION
      ?auto_236907 - MODE
      ?auto_236909 - DIRECTION
      ?auto_236910 - MODE
    )
    :vars
    (
      ?auto_236913 - INSTRUMENT
      ?auto_236915 - SATELLITE
      ?auto_236911 - DIRECTION
      ?auto_236912 - INSTRUMENT
      ?auto_236916 - INSTRUMENT
      ?auto_236914 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_236913 ?auto_236915 ) ( SUPPORTS ?auto_236913 ?auto_236910 ) ( not ( = ?auto_236909 ?auto_236911 ) ) ( CALIBRATION_TARGET ?auto_236913 ?auto_236911 ) ( not ( = ?auto_236911 ?auto_236905 ) ) ( ON_BOARD ?auto_236912 ?auto_236915 ) ( not ( = ?auto_236909 ?auto_236905 ) ) ( not ( = ?auto_236913 ?auto_236912 ) ) ( SUPPORTS ?auto_236912 ?auto_236906 ) ( CALIBRATION_TARGET ?auto_236912 ?auto_236911 ) ( not ( = ?auto_236911 ?auto_236908 ) ) ( ON_BOARD ?auto_236916 ?auto_236915 ) ( not ( = ?auto_236905 ?auto_236908 ) ) ( not ( = ?auto_236912 ?auto_236916 ) ) ( SUPPORTS ?auto_236916 ?auto_236907 ) ( CALIBRATION_TARGET ?auto_236916 ?auto_236911 ) ( POWER_AVAIL ?auto_236915 ) ( POINTING ?auto_236915 ?auto_236914 ) ( not ( = ?auto_236911 ?auto_236914 ) ) ( not ( = ?auto_236908 ?auto_236914 ) ) ( not ( = ?auto_236907 ?auto_236906 ) ) ( not ( = ?auto_236905 ?auto_236914 ) ) ( not ( = ?auto_236908 ?auto_236909 ) ) ( not ( = ?auto_236907 ?auto_236910 ) ) ( not ( = ?auto_236906 ?auto_236910 ) ) ( not ( = ?auto_236909 ?auto_236914 ) ) ( not ( = ?auto_236913 ?auto_236916 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_236908 ?auto_236907 ?auto_236909 ?auto_236910 ?auto_236905 ?auto_236906 )
      ( GET-3IMAGE-VERIFY ?auto_236905 ?auto_236906 ?auto_236908 ?auto_236907 ?auto_236909 ?auto_236910 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_236931 - DIRECTION
      ?auto_236932 - MODE
      ?auto_236934 - DIRECTION
      ?auto_236933 - MODE
      ?auto_236935 - DIRECTION
      ?auto_236936 - MODE
    )
    :vars
    (
      ?auto_236939 - INSTRUMENT
      ?auto_236941 - SATELLITE
      ?auto_236937 - DIRECTION
      ?auto_236938 - INSTRUMENT
      ?auto_236942 - INSTRUMENT
      ?auto_236940 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_236939 ?auto_236941 ) ( SUPPORTS ?auto_236939 ?auto_236933 ) ( not ( = ?auto_236934 ?auto_236937 ) ) ( CALIBRATION_TARGET ?auto_236939 ?auto_236937 ) ( not ( = ?auto_236937 ?auto_236931 ) ) ( ON_BOARD ?auto_236938 ?auto_236941 ) ( not ( = ?auto_236934 ?auto_236931 ) ) ( not ( = ?auto_236939 ?auto_236938 ) ) ( SUPPORTS ?auto_236938 ?auto_236932 ) ( CALIBRATION_TARGET ?auto_236938 ?auto_236937 ) ( not ( = ?auto_236937 ?auto_236935 ) ) ( ON_BOARD ?auto_236942 ?auto_236941 ) ( not ( = ?auto_236931 ?auto_236935 ) ) ( not ( = ?auto_236938 ?auto_236942 ) ) ( SUPPORTS ?auto_236942 ?auto_236936 ) ( CALIBRATION_TARGET ?auto_236942 ?auto_236937 ) ( POWER_AVAIL ?auto_236941 ) ( POINTING ?auto_236941 ?auto_236940 ) ( not ( = ?auto_236937 ?auto_236940 ) ) ( not ( = ?auto_236935 ?auto_236940 ) ) ( not ( = ?auto_236936 ?auto_236932 ) ) ( not ( = ?auto_236931 ?auto_236940 ) ) ( not ( = ?auto_236935 ?auto_236934 ) ) ( not ( = ?auto_236936 ?auto_236933 ) ) ( not ( = ?auto_236932 ?auto_236933 ) ) ( not ( = ?auto_236934 ?auto_236940 ) ) ( not ( = ?auto_236939 ?auto_236942 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_236935 ?auto_236936 ?auto_236934 ?auto_236933 ?auto_236931 ?auto_236932 )
      ( GET-3IMAGE-VERIFY ?auto_236931 ?auto_236932 ?auto_236934 ?auto_236933 ?auto_236935 ?auto_236936 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_236985 - DIRECTION
      ?auto_236986 - MODE
      ?auto_236988 - DIRECTION
      ?auto_236987 - MODE
      ?auto_236989 - DIRECTION
      ?auto_236990 - MODE
    )
    :vars
    (
      ?auto_236993 - INSTRUMENT
      ?auto_236995 - SATELLITE
      ?auto_236991 - DIRECTION
      ?auto_236992 - INSTRUMENT
      ?auto_236996 - INSTRUMENT
      ?auto_236994 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_236993 ?auto_236995 ) ( SUPPORTS ?auto_236993 ?auto_236986 ) ( not ( = ?auto_236985 ?auto_236991 ) ) ( CALIBRATION_TARGET ?auto_236993 ?auto_236991 ) ( not ( = ?auto_236991 ?auto_236989 ) ) ( ON_BOARD ?auto_236992 ?auto_236995 ) ( not ( = ?auto_236985 ?auto_236989 ) ) ( not ( = ?auto_236993 ?auto_236992 ) ) ( SUPPORTS ?auto_236992 ?auto_236990 ) ( CALIBRATION_TARGET ?auto_236992 ?auto_236991 ) ( not ( = ?auto_236991 ?auto_236988 ) ) ( ON_BOARD ?auto_236996 ?auto_236995 ) ( not ( = ?auto_236989 ?auto_236988 ) ) ( not ( = ?auto_236992 ?auto_236996 ) ) ( SUPPORTS ?auto_236996 ?auto_236987 ) ( CALIBRATION_TARGET ?auto_236996 ?auto_236991 ) ( POWER_AVAIL ?auto_236995 ) ( POINTING ?auto_236995 ?auto_236994 ) ( not ( = ?auto_236991 ?auto_236994 ) ) ( not ( = ?auto_236988 ?auto_236994 ) ) ( not ( = ?auto_236987 ?auto_236990 ) ) ( not ( = ?auto_236989 ?auto_236994 ) ) ( not ( = ?auto_236988 ?auto_236985 ) ) ( not ( = ?auto_236987 ?auto_236986 ) ) ( not ( = ?auto_236990 ?auto_236986 ) ) ( not ( = ?auto_236985 ?auto_236994 ) ) ( not ( = ?auto_236993 ?auto_236996 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_236988 ?auto_236987 ?auto_236985 ?auto_236986 ?auto_236989 ?auto_236990 )
      ( GET-3IMAGE-VERIFY ?auto_236985 ?auto_236986 ?auto_236988 ?auto_236987 ?auto_236989 ?auto_236990 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_237011 - DIRECTION
      ?auto_237012 - MODE
      ?auto_237014 - DIRECTION
      ?auto_237013 - MODE
      ?auto_237015 - DIRECTION
      ?auto_237016 - MODE
    )
    :vars
    (
      ?auto_237019 - INSTRUMENT
      ?auto_237021 - SATELLITE
      ?auto_237017 - DIRECTION
      ?auto_237018 - INSTRUMENT
      ?auto_237022 - INSTRUMENT
      ?auto_237020 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_237019 ?auto_237021 ) ( SUPPORTS ?auto_237019 ?auto_237012 ) ( not ( = ?auto_237011 ?auto_237017 ) ) ( CALIBRATION_TARGET ?auto_237019 ?auto_237017 ) ( not ( = ?auto_237017 ?auto_237014 ) ) ( ON_BOARD ?auto_237018 ?auto_237021 ) ( not ( = ?auto_237011 ?auto_237014 ) ) ( not ( = ?auto_237019 ?auto_237018 ) ) ( SUPPORTS ?auto_237018 ?auto_237013 ) ( CALIBRATION_TARGET ?auto_237018 ?auto_237017 ) ( not ( = ?auto_237017 ?auto_237015 ) ) ( ON_BOARD ?auto_237022 ?auto_237021 ) ( not ( = ?auto_237014 ?auto_237015 ) ) ( not ( = ?auto_237018 ?auto_237022 ) ) ( SUPPORTS ?auto_237022 ?auto_237016 ) ( CALIBRATION_TARGET ?auto_237022 ?auto_237017 ) ( POWER_AVAIL ?auto_237021 ) ( POINTING ?auto_237021 ?auto_237020 ) ( not ( = ?auto_237017 ?auto_237020 ) ) ( not ( = ?auto_237015 ?auto_237020 ) ) ( not ( = ?auto_237016 ?auto_237013 ) ) ( not ( = ?auto_237014 ?auto_237020 ) ) ( not ( = ?auto_237015 ?auto_237011 ) ) ( not ( = ?auto_237016 ?auto_237012 ) ) ( not ( = ?auto_237013 ?auto_237012 ) ) ( not ( = ?auto_237011 ?auto_237020 ) ) ( not ( = ?auto_237019 ?auto_237022 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_237015 ?auto_237016 ?auto_237011 ?auto_237012 ?auto_237014 ?auto_237013 )
      ( GET-3IMAGE-VERIFY ?auto_237011 ?auto_237012 ?auto_237014 ?auto_237013 ?auto_237015 ?auto_237016 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_237097 - DIRECTION
      ?auto_237098 - MODE
    )
    :vars
    (
      ?auto_237099 - INSTRUMENT
      ?auto_237100 - SATELLITE
      ?auto_237101 - DIRECTION
      ?auto_237102 - DIRECTION
      ?auto_237103 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_237099 ?auto_237100 ) ( SUPPORTS ?auto_237099 ?auto_237098 ) ( not ( = ?auto_237097 ?auto_237101 ) ) ( CALIBRATION_TARGET ?auto_237099 ?auto_237101 ) ( POINTING ?auto_237100 ?auto_237102 ) ( not ( = ?auto_237101 ?auto_237102 ) ) ( ON_BOARD ?auto_237103 ?auto_237100 ) ( POWER_ON ?auto_237103 ) ( not ( = ?auto_237097 ?auto_237102 ) ) ( not ( = ?auto_237099 ?auto_237103 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_237103 ?auto_237100 )
      ( !TURN_TO ?auto_237100 ?auto_237101 ?auto_237102 )
      ( !SWITCH_ON ?auto_237099 ?auto_237100 )
      ( !CALIBRATE ?auto_237100 ?auto_237099 ?auto_237101 )
      ( !TURN_TO ?auto_237100 ?auto_237097 ?auto_237101 )
      ( !TAKE_IMAGE ?auto_237100 ?auto_237097 ?auto_237099 ?auto_237098 )
      ( GET-1IMAGE-VERIFY ?auto_237097 ?auto_237098 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_238663 - DIRECTION
      ?auto_238664 - MODE
      ?auto_238666 - DIRECTION
      ?auto_238665 - MODE
      ?auto_238667 - DIRECTION
      ?auto_238668 - MODE
      ?auto_238669 - DIRECTION
      ?auto_238670 - MODE
    )
    :vars
    (
      ?auto_238673 - INSTRUMENT
      ?auto_238672 - SATELLITE
      ?auto_238671 - DIRECTION
      ?auto_238674 - INSTRUMENT
      ?auto_238675 - INSTRUMENT
      ?auto_238677 - INSTRUMENT
      ?auto_238676 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_238673 ?auto_238672 ) ( SUPPORTS ?auto_238673 ?auto_238670 ) ( not ( = ?auto_238669 ?auto_238671 ) ) ( CALIBRATION_TARGET ?auto_238673 ?auto_238671 ) ( not ( = ?auto_238671 ?auto_238667 ) ) ( ON_BOARD ?auto_238674 ?auto_238672 ) ( not ( = ?auto_238669 ?auto_238667 ) ) ( not ( = ?auto_238673 ?auto_238674 ) ) ( SUPPORTS ?auto_238674 ?auto_238668 ) ( CALIBRATION_TARGET ?auto_238674 ?auto_238671 ) ( not ( = ?auto_238671 ?auto_238666 ) ) ( ON_BOARD ?auto_238675 ?auto_238672 ) ( not ( = ?auto_238667 ?auto_238666 ) ) ( not ( = ?auto_238674 ?auto_238675 ) ) ( SUPPORTS ?auto_238675 ?auto_238665 ) ( CALIBRATION_TARGET ?auto_238675 ?auto_238671 ) ( not ( = ?auto_238671 ?auto_238663 ) ) ( ON_BOARD ?auto_238677 ?auto_238672 ) ( not ( = ?auto_238666 ?auto_238663 ) ) ( not ( = ?auto_238675 ?auto_238677 ) ) ( SUPPORTS ?auto_238677 ?auto_238664 ) ( CALIBRATION_TARGET ?auto_238677 ?auto_238671 ) ( POWER_AVAIL ?auto_238672 ) ( POINTING ?auto_238672 ?auto_238676 ) ( not ( = ?auto_238671 ?auto_238676 ) ) ( not ( = ?auto_238663 ?auto_238676 ) ) ( not ( = ?auto_238664 ?auto_238665 ) ) ( not ( = ?auto_238666 ?auto_238676 ) ) ( not ( = ?auto_238663 ?auto_238667 ) ) ( not ( = ?auto_238664 ?auto_238668 ) ) ( not ( = ?auto_238665 ?auto_238668 ) ) ( not ( = ?auto_238667 ?auto_238676 ) ) ( not ( = ?auto_238674 ?auto_238677 ) ) ( not ( = ?auto_238663 ?auto_238669 ) ) ( not ( = ?auto_238664 ?auto_238670 ) ) ( not ( = ?auto_238666 ?auto_238669 ) ) ( not ( = ?auto_238665 ?auto_238670 ) ) ( not ( = ?auto_238668 ?auto_238670 ) ) ( not ( = ?auto_238669 ?auto_238676 ) ) ( not ( = ?auto_238673 ?auto_238675 ) ) ( not ( = ?auto_238673 ?auto_238677 ) ) )
    :subtasks
    ( ( GET-3IMAGE ?auto_238663 ?auto_238664 ?auto_238667 ?auto_238668 ?auto_238666 ?auto_238665 )
      ( GET-1IMAGE ?auto_238669 ?auto_238670 )
      ( GET-4IMAGE-VERIFY ?auto_238663 ?auto_238664 ?auto_238666 ?auto_238665 ?auto_238667 ?auto_238668 ?auto_238669 ?auto_238670 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_238712 - DIRECTION
      ?auto_238713 - MODE
      ?auto_238715 - DIRECTION
      ?auto_238714 - MODE
      ?auto_238716 - DIRECTION
      ?auto_238717 - MODE
      ?auto_238718 - DIRECTION
      ?auto_238719 - MODE
    )
    :vars
    (
      ?auto_238723 - INSTRUMENT
      ?auto_238724 - SATELLITE
      ?auto_238720 - DIRECTION
      ?auto_238721 - INSTRUMENT
      ?auto_238722 - INSTRUMENT
      ?auto_238726 - INSTRUMENT
      ?auto_238725 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_238723 ?auto_238724 ) ( SUPPORTS ?auto_238723 ?auto_238717 ) ( not ( = ?auto_238716 ?auto_238720 ) ) ( CALIBRATION_TARGET ?auto_238723 ?auto_238720 ) ( not ( = ?auto_238720 ?auto_238718 ) ) ( ON_BOARD ?auto_238721 ?auto_238724 ) ( not ( = ?auto_238716 ?auto_238718 ) ) ( not ( = ?auto_238723 ?auto_238721 ) ) ( SUPPORTS ?auto_238721 ?auto_238719 ) ( CALIBRATION_TARGET ?auto_238721 ?auto_238720 ) ( not ( = ?auto_238720 ?auto_238715 ) ) ( ON_BOARD ?auto_238722 ?auto_238724 ) ( not ( = ?auto_238718 ?auto_238715 ) ) ( not ( = ?auto_238721 ?auto_238722 ) ) ( SUPPORTS ?auto_238722 ?auto_238714 ) ( CALIBRATION_TARGET ?auto_238722 ?auto_238720 ) ( not ( = ?auto_238720 ?auto_238712 ) ) ( ON_BOARD ?auto_238726 ?auto_238724 ) ( not ( = ?auto_238715 ?auto_238712 ) ) ( not ( = ?auto_238722 ?auto_238726 ) ) ( SUPPORTS ?auto_238726 ?auto_238713 ) ( CALIBRATION_TARGET ?auto_238726 ?auto_238720 ) ( POWER_AVAIL ?auto_238724 ) ( POINTING ?auto_238724 ?auto_238725 ) ( not ( = ?auto_238720 ?auto_238725 ) ) ( not ( = ?auto_238712 ?auto_238725 ) ) ( not ( = ?auto_238713 ?auto_238714 ) ) ( not ( = ?auto_238715 ?auto_238725 ) ) ( not ( = ?auto_238712 ?auto_238718 ) ) ( not ( = ?auto_238713 ?auto_238719 ) ) ( not ( = ?auto_238714 ?auto_238719 ) ) ( not ( = ?auto_238718 ?auto_238725 ) ) ( not ( = ?auto_238721 ?auto_238726 ) ) ( not ( = ?auto_238712 ?auto_238716 ) ) ( not ( = ?auto_238713 ?auto_238717 ) ) ( not ( = ?auto_238715 ?auto_238716 ) ) ( not ( = ?auto_238714 ?auto_238717 ) ) ( not ( = ?auto_238719 ?auto_238717 ) ) ( not ( = ?auto_238716 ?auto_238725 ) ) ( not ( = ?auto_238723 ?auto_238722 ) ) ( not ( = ?auto_238723 ?auto_238726 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_238712 ?auto_238713 ?auto_238715 ?auto_238714 ?auto_238718 ?auto_238719 ?auto_238716 ?auto_238717 )
      ( GET-4IMAGE-VERIFY ?auto_238712 ?auto_238713 ?auto_238715 ?auto_238714 ?auto_238716 ?auto_238717 ?auto_238718 ?auto_238719 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_238761 - DIRECTION
      ?auto_238762 - MODE
      ?auto_238764 - DIRECTION
      ?auto_238763 - MODE
      ?auto_238765 - DIRECTION
      ?auto_238766 - MODE
      ?auto_238767 - DIRECTION
      ?auto_238768 - MODE
    )
    :vars
    (
      ?auto_238770 - INSTRUMENT
      ?auto_238769 - SATELLITE
      ?auto_238775 - DIRECTION
      ?auto_238771 - INSTRUMENT
      ?auto_238772 - INSTRUMENT
      ?auto_238773 - INSTRUMENT
      ?auto_238774 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_238770 ?auto_238769 ) ( SUPPORTS ?auto_238770 ?auto_238768 ) ( not ( = ?auto_238767 ?auto_238775 ) ) ( CALIBRATION_TARGET ?auto_238770 ?auto_238775 ) ( not ( = ?auto_238775 ?auto_238764 ) ) ( ON_BOARD ?auto_238771 ?auto_238769 ) ( not ( = ?auto_238767 ?auto_238764 ) ) ( not ( = ?auto_238770 ?auto_238771 ) ) ( SUPPORTS ?auto_238771 ?auto_238763 ) ( CALIBRATION_TARGET ?auto_238771 ?auto_238775 ) ( not ( = ?auto_238775 ?auto_238765 ) ) ( ON_BOARD ?auto_238772 ?auto_238769 ) ( not ( = ?auto_238764 ?auto_238765 ) ) ( not ( = ?auto_238771 ?auto_238772 ) ) ( SUPPORTS ?auto_238772 ?auto_238766 ) ( CALIBRATION_TARGET ?auto_238772 ?auto_238775 ) ( not ( = ?auto_238775 ?auto_238761 ) ) ( ON_BOARD ?auto_238773 ?auto_238769 ) ( not ( = ?auto_238765 ?auto_238761 ) ) ( not ( = ?auto_238772 ?auto_238773 ) ) ( SUPPORTS ?auto_238773 ?auto_238762 ) ( CALIBRATION_TARGET ?auto_238773 ?auto_238775 ) ( POWER_AVAIL ?auto_238769 ) ( POINTING ?auto_238769 ?auto_238774 ) ( not ( = ?auto_238775 ?auto_238774 ) ) ( not ( = ?auto_238761 ?auto_238774 ) ) ( not ( = ?auto_238762 ?auto_238766 ) ) ( not ( = ?auto_238765 ?auto_238774 ) ) ( not ( = ?auto_238761 ?auto_238764 ) ) ( not ( = ?auto_238762 ?auto_238763 ) ) ( not ( = ?auto_238766 ?auto_238763 ) ) ( not ( = ?auto_238764 ?auto_238774 ) ) ( not ( = ?auto_238771 ?auto_238773 ) ) ( not ( = ?auto_238761 ?auto_238767 ) ) ( not ( = ?auto_238762 ?auto_238768 ) ) ( not ( = ?auto_238765 ?auto_238767 ) ) ( not ( = ?auto_238766 ?auto_238768 ) ) ( not ( = ?auto_238763 ?auto_238768 ) ) ( not ( = ?auto_238767 ?auto_238774 ) ) ( not ( = ?auto_238770 ?auto_238772 ) ) ( not ( = ?auto_238770 ?auto_238773 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_238761 ?auto_238762 ?auto_238765 ?auto_238766 ?auto_238767 ?auto_238768 ?auto_238764 ?auto_238763 )
      ( GET-4IMAGE-VERIFY ?auto_238761 ?auto_238762 ?auto_238764 ?auto_238763 ?auto_238765 ?auto_238766 ?auto_238767 ?auto_238768 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_238810 - DIRECTION
      ?auto_238811 - MODE
      ?auto_238813 - DIRECTION
      ?auto_238812 - MODE
      ?auto_238814 - DIRECTION
      ?auto_238815 - MODE
      ?auto_238816 - DIRECTION
      ?auto_238817 - MODE
    )
    :vars
    (
      ?auto_238819 - INSTRUMENT
      ?auto_238818 - SATELLITE
      ?auto_238824 - DIRECTION
      ?auto_238820 - INSTRUMENT
      ?auto_238821 - INSTRUMENT
      ?auto_238822 - INSTRUMENT
      ?auto_238823 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_238819 ?auto_238818 ) ( SUPPORTS ?auto_238819 ?auto_238815 ) ( not ( = ?auto_238814 ?auto_238824 ) ) ( CALIBRATION_TARGET ?auto_238819 ?auto_238824 ) ( not ( = ?auto_238824 ?auto_238813 ) ) ( ON_BOARD ?auto_238820 ?auto_238818 ) ( not ( = ?auto_238814 ?auto_238813 ) ) ( not ( = ?auto_238819 ?auto_238820 ) ) ( SUPPORTS ?auto_238820 ?auto_238812 ) ( CALIBRATION_TARGET ?auto_238820 ?auto_238824 ) ( not ( = ?auto_238824 ?auto_238816 ) ) ( ON_BOARD ?auto_238821 ?auto_238818 ) ( not ( = ?auto_238813 ?auto_238816 ) ) ( not ( = ?auto_238820 ?auto_238821 ) ) ( SUPPORTS ?auto_238821 ?auto_238817 ) ( CALIBRATION_TARGET ?auto_238821 ?auto_238824 ) ( not ( = ?auto_238824 ?auto_238810 ) ) ( ON_BOARD ?auto_238822 ?auto_238818 ) ( not ( = ?auto_238816 ?auto_238810 ) ) ( not ( = ?auto_238821 ?auto_238822 ) ) ( SUPPORTS ?auto_238822 ?auto_238811 ) ( CALIBRATION_TARGET ?auto_238822 ?auto_238824 ) ( POWER_AVAIL ?auto_238818 ) ( POINTING ?auto_238818 ?auto_238823 ) ( not ( = ?auto_238824 ?auto_238823 ) ) ( not ( = ?auto_238810 ?auto_238823 ) ) ( not ( = ?auto_238811 ?auto_238817 ) ) ( not ( = ?auto_238816 ?auto_238823 ) ) ( not ( = ?auto_238810 ?auto_238813 ) ) ( not ( = ?auto_238811 ?auto_238812 ) ) ( not ( = ?auto_238817 ?auto_238812 ) ) ( not ( = ?auto_238813 ?auto_238823 ) ) ( not ( = ?auto_238820 ?auto_238822 ) ) ( not ( = ?auto_238810 ?auto_238814 ) ) ( not ( = ?auto_238811 ?auto_238815 ) ) ( not ( = ?auto_238816 ?auto_238814 ) ) ( not ( = ?auto_238817 ?auto_238815 ) ) ( not ( = ?auto_238812 ?auto_238815 ) ) ( not ( = ?auto_238814 ?auto_238823 ) ) ( not ( = ?auto_238819 ?auto_238821 ) ) ( not ( = ?auto_238819 ?auto_238822 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_238810 ?auto_238811 ?auto_238816 ?auto_238817 ?auto_238814 ?auto_238815 ?auto_238813 ?auto_238812 )
      ( GET-4IMAGE-VERIFY ?auto_238810 ?auto_238811 ?auto_238813 ?auto_238812 ?auto_238814 ?auto_238815 ?auto_238816 ?auto_238817 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_238965 - DIRECTION
      ?auto_238966 - MODE
      ?auto_238968 - DIRECTION
      ?auto_238967 - MODE
      ?auto_238969 - DIRECTION
      ?auto_238970 - MODE
      ?auto_238971 - DIRECTION
      ?auto_238972 - MODE
    )
    :vars
    (
      ?auto_238974 - INSTRUMENT
      ?auto_238973 - SATELLITE
      ?auto_238979 - DIRECTION
      ?auto_238975 - INSTRUMENT
      ?auto_238976 - INSTRUMENT
      ?auto_238977 - INSTRUMENT
      ?auto_238978 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_238974 ?auto_238973 ) ( SUPPORTS ?auto_238974 ?auto_238967 ) ( not ( = ?auto_238968 ?auto_238979 ) ) ( CALIBRATION_TARGET ?auto_238974 ?auto_238979 ) ( not ( = ?auto_238979 ?auto_238971 ) ) ( ON_BOARD ?auto_238975 ?auto_238973 ) ( not ( = ?auto_238968 ?auto_238971 ) ) ( not ( = ?auto_238974 ?auto_238975 ) ) ( SUPPORTS ?auto_238975 ?auto_238972 ) ( CALIBRATION_TARGET ?auto_238975 ?auto_238979 ) ( not ( = ?auto_238979 ?auto_238969 ) ) ( ON_BOARD ?auto_238976 ?auto_238973 ) ( not ( = ?auto_238971 ?auto_238969 ) ) ( not ( = ?auto_238975 ?auto_238976 ) ) ( SUPPORTS ?auto_238976 ?auto_238970 ) ( CALIBRATION_TARGET ?auto_238976 ?auto_238979 ) ( not ( = ?auto_238979 ?auto_238965 ) ) ( ON_BOARD ?auto_238977 ?auto_238973 ) ( not ( = ?auto_238969 ?auto_238965 ) ) ( not ( = ?auto_238976 ?auto_238977 ) ) ( SUPPORTS ?auto_238977 ?auto_238966 ) ( CALIBRATION_TARGET ?auto_238977 ?auto_238979 ) ( POWER_AVAIL ?auto_238973 ) ( POINTING ?auto_238973 ?auto_238978 ) ( not ( = ?auto_238979 ?auto_238978 ) ) ( not ( = ?auto_238965 ?auto_238978 ) ) ( not ( = ?auto_238966 ?auto_238970 ) ) ( not ( = ?auto_238969 ?auto_238978 ) ) ( not ( = ?auto_238965 ?auto_238971 ) ) ( not ( = ?auto_238966 ?auto_238972 ) ) ( not ( = ?auto_238970 ?auto_238972 ) ) ( not ( = ?auto_238971 ?auto_238978 ) ) ( not ( = ?auto_238975 ?auto_238977 ) ) ( not ( = ?auto_238965 ?auto_238968 ) ) ( not ( = ?auto_238966 ?auto_238967 ) ) ( not ( = ?auto_238969 ?auto_238968 ) ) ( not ( = ?auto_238970 ?auto_238967 ) ) ( not ( = ?auto_238972 ?auto_238967 ) ) ( not ( = ?auto_238968 ?auto_238978 ) ) ( not ( = ?auto_238974 ?auto_238976 ) ) ( not ( = ?auto_238974 ?auto_238977 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_238965 ?auto_238966 ?auto_238969 ?auto_238970 ?auto_238968 ?auto_238967 ?auto_238971 ?auto_238972 )
      ( GET-4IMAGE-VERIFY ?auto_238965 ?auto_238966 ?auto_238968 ?auto_238967 ?auto_238969 ?auto_238970 ?auto_238971 ?auto_238972 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_239014 - DIRECTION
      ?auto_239015 - MODE
      ?auto_239017 - DIRECTION
      ?auto_239016 - MODE
      ?auto_239018 - DIRECTION
      ?auto_239019 - MODE
      ?auto_239020 - DIRECTION
      ?auto_239021 - MODE
    )
    :vars
    (
      ?auto_239023 - INSTRUMENT
      ?auto_239022 - SATELLITE
      ?auto_239028 - DIRECTION
      ?auto_239024 - INSTRUMENT
      ?auto_239025 - INSTRUMENT
      ?auto_239026 - INSTRUMENT
      ?auto_239027 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_239023 ?auto_239022 ) ( SUPPORTS ?auto_239023 ?auto_239016 ) ( not ( = ?auto_239017 ?auto_239028 ) ) ( CALIBRATION_TARGET ?auto_239023 ?auto_239028 ) ( not ( = ?auto_239028 ?auto_239018 ) ) ( ON_BOARD ?auto_239024 ?auto_239022 ) ( not ( = ?auto_239017 ?auto_239018 ) ) ( not ( = ?auto_239023 ?auto_239024 ) ) ( SUPPORTS ?auto_239024 ?auto_239019 ) ( CALIBRATION_TARGET ?auto_239024 ?auto_239028 ) ( not ( = ?auto_239028 ?auto_239020 ) ) ( ON_BOARD ?auto_239025 ?auto_239022 ) ( not ( = ?auto_239018 ?auto_239020 ) ) ( not ( = ?auto_239024 ?auto_239025 ) ) ( SUPPORTS ?auto_239025 ?auto_239021 ) ( CALIBRATION_TARGET ?auto_239025 ?auto_239028 ) ( not ( = ?auto_239028 ?auto_239014 ) ) ( ON_BOARD ?auto_239026 ?auto_239022 ) ( not ( = ?auto_239020 ?auto_239014 ) ) ( not ( = ?auto_239025 ?auto_239026 ) ) ( SUPPORTS ?auto_239026 ?auto_239015 ) ( CALIBRATION_TARGET ?auto_239026 ?auto_239028 ) ( POWER_AVAIL ?auto_239022 ) ( POINTING ?auto_239022 ?auto_239027 ) ( not ( = ?auto_239028 ?auto_239027 ) ) ( not ( = ?auto_239014 ?auto_239027 ) ) ( not ( = ?auto_239015 ?auto_239021 ) ) ( not ( = ?auto_239020 ?auto_239027 ) ) ( not ( = ?auto_239014 ?auto_239018 ) ) ( not ( = ?auto_239015 ?auto_239019 ) ) ( not ( = ?auto_239021 ?auto_239019 ) ) ( not ( = ?auto_239018 ?auto_239027 ) ) ( not ( = ?auto_239024 ?auto_239026 ) ) ( not ( = ?auto_239014 ?auto_239017 ) ) ( not ( = ?auto_239015 ?auto_239016 ) ) ( not ( = ?auto_239020 ?auto_239017 ) ) ( not ( = ?auto_239021 ?auto_239016 ) ) ( not ( = ?auto_239019 ?auto_239016 ) ) ( not ( = ?auto_239017 ?auto_239027 ) ) ( not ( = ?auto_239023 ?auto_239025 ) ) ( not ( = ?auto_239023 ?auto_239026 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_239014 ?auto_239015 ?auto_239020 ?auto_239021 ?auto_239017 ?auto_239016 ?auto_239018 ?auto_239019 )
      ( GET-4IMAGE-VERIFY ?auto_239014 ?auto_239015 ?auto_239017 ?auto_239016 ?auto_239018 ?auto_239019 ?auto_239020 ?auto_239021 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_239169 - DIRECTION
      ?auto_239170 - MODE
      ?auto_239172 - DIRECTION
      ?auto_239171 - MODE
      ?auto_239173 - DIRECTION
      ?auto_239174 - MODE
      ?auto_239175 - DIRECTION
      ?auto_239176 - MODE
    )
    :vars
    (
      ?auto_239178 - INSTRUMENT
      ?auto_239177 - SATELLITE
      ?auto_239183 - DIRECTION
      ?auto_239179 - INSTRUMENT
      ?auto_239180 - INSTRUMENT
      ?auto_239181 - INSTRUMENT
      ?auto_239182 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_239178 ?auto_239177 ) ( SUPPORTS ?auto_239178 ?auto_239176 ) ( not ( = ?auto_239175 ?auto_239183 ) ) ( CALIBRATION_TARGET ?auto_239178 ?auto_239183 ) ( not ( = ?auto_239183 ?auto_239173 ) ) ( ON_BOARD ?auto_239179 ?auto_239177 ) ( not ( = ?auto_239175 ?auto_239173 ) ) ( not ( = ?auto_239178 ?auto_239179 ) ) ( SUPPORTS ?auto_239179 ?auto_239174 ) ( CALIBRATION_TARGET ?auto_239179 ?auto_239183 ) ( not ( = ?auto_239183 ?auto_239169 ) ) ( ON_BOARD ?auto_239180 ?auto_239177 ) ( not ( = ?auto_239173 ?auto_239169 ) ) ( not ( = ?auto_239179 ?auto_239180 ) ) ( SUPPORTS ?auto_239180 ?auto_239170 ) ( CALIBRATION_TARGET ?auto_239180 ?auto_239183 ) ( not ( = ?auto_239183 ?auto_239172 ) ) ( ON_BOARD ?auto_239181 ?auto_239177 ) ( not ( = ?auto_239169 ?auto_239172 ) ) ( not ( = ?auto_239180 ?auto_239181 ) ) ( SUPPORTS ?auto_239181 ?auto_239171 ) ( CALIBRATION_TARGET ?auto_239181 ?auto_239183 ) ( POWER_AVAIL ?auto_239177 ) ( POINTING ?auto_239177 ?auto_239182 ) ( not ( = ?auto_239183 ?auto_239182 ) ) ( not ( = ?auto_239172 ?auto_239182 ) ) ( not ( = ?auto_239171 ?auto_239170 ) ) ( not ( = ?auto_239169 ?auto_239182 ) ) ( not ( = ?auto_239172 ?auto_239173 ) ) ( not ( = ?auto_239171 ?auto_239174 ) ) ( not ( = ?auto_239170 ?auto_239174 ) ) ( not ( = ?auto_239173 ?auto_239182 ) ) ( not ( = ?auto_239179 ?auto_239181 ) ) ( not ( = ?auto_239172 ?auto_239175 ) ) ( not ( = ?auto_239171 ?auto_239176 ) ) ( not ( = ?auto_239169 ?auto_239175 ) ) ( not ( = ?auto_239170 ?auto_239176 ) ) ( not ( = ?auto_239174 ?auto_239176 ) ) ( not ( = ?auto_239175 ?auto_239182 ) ) ( not ( = ?auto_239178 ?auto_239180 ) ) ( not ( = ?auto_239178 ?auto_239181 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_239172 ?auto_239171 ?auto_239169 ?auto_239170 ?auto_239175 ?auto_239176 ?auto_239173 ?auto_239174 )
      ( GET-4IMAGE-VERIFY ?auto_239169 ?auto_239170 ?auto_239172 ?auto_239171 ?auto_239173 ?auto_239174 ?auto_239175 ?auto_239176 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_239218 - DIRECTION
      ?auto_239219 - MODE
      ?auto_239221 - DIRECTION
      ?auto_239220 - MODE
      ?auto_239222 - DIRECTION
      ?auto_239223 - MODE
      ?auto_239224 - DIRECTION
      ?auto_239225 - MODE
    )
    :vars
    (
      ?auto_239227 - INSTRUMENT
      ?auto_239226 - SATELLITE
      ?auto_239232 - DIRECTION
      ?auto_239228 - INSTRUMENT
      ?auto_239229 - INSTRUMENT
      ?auto_239230 - INSTRUMENT
      ?auto_239231 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_239227 ?auto_239226 ) ( SUPPORTS ?auto_239227 ?auto_239223 ) ( not ( = ?auto_239222 ?auto_239232 ) ) ( CALIBRATION_TARGET ?auto_239227 ?auto_239232 ) ( not ( = ?auto_239232 ?auto_239224 ) ) ( ON_BOARD ?auto_239228 ?auto_239226 ) ( not ( = ?auto_239222 ?auto_239224 ) ) ( not ( = ?auto_239227 ?auto_239228 ) ) ( SUPPORTS ?auto_239228 ?auto_239225 ) ( CALIBRATION_TARGET ?auto_239228 ?auto_239232 ) ( not ( = ?auto_239232 ?auto_239218 ) ) ( ON_BOARD ?auto_239229 ?auto_239226 ) ( not ( = ?auto_239224 ?auto_239218 ) ) ( not ( = ?auto_239228 ?auto_239229 ) ) ( SUPPORTS ?auto_239229 ?auto_239219 ) ( CALIBRATION_TARGET ?auto_239229 ?auto_239232 ) ( not ( = ?auto_239232 ?auto_239221 ) ) ( ON_BOARD ?auto_239230 ?auto_239226 ) ( not ( = ?auto_239218 ?auto_239221 ) ) ( not ( = ?auto_239229 ?auto_239230 ) ) ( SUPPORTS ?auto_239230 ?auto_239220 ) ( CALIBRATION_TARGET ?auto_239230 ?auto_239232 ) ( POWER_AVAIL ?auto_239226 ) ( POINTING ?auto_239226 ?auto_239231 ) ( not ( = ?auto_239232 ?auto_239231 ) ) ( not ( = ?auto_239221 ?auto_239231 ) ) ( not ( = ?auto_239220 ?auto_239219 ) ) ( not ( = ?auto_239218 ?auto_239231 ) ) ( not ( = ?auto_239221 ?auto_239224 ) ) ( not ( = ?auto_239220 ?auto_239225 ) ) ( not ( = ?auto_239219 ?auto_239225 ) ) ( not ( = ?auto_239224 ?auto_239231 ) ) ( not ( = ?auto_239228 ?auto_239230 ) ) ( not ( = ?auto_239221 ?auto_239222 ) ) ( not ( = ?auto_239220 ?auto_239223 ) ) ( not ( = ?auto_239218 ?auto_239222 ) ) ( not ( = ?auto_239219 ?auto_239223 ) ) ( not ( = ?auto_239225 ?auto_239223 ) ) ( not ( = ?auto_239222 ?auto_239231 ) ) ( not ( = ?auto_239227 ?auto_239229 ) ) ( not ( = ?auto_239227 ?auto_239230 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_239221 ?auto_239220 ?auto_239218 ?auto_239219 ?auto_239222 ?auto_239223 ?auto_239224 ?auto_239225 )
      ( GET-4IMAGE-VERIFY ?auto_239218 ?auto_239219 ?auto_239221 ?auto_239220 ?auto_239222 ?auto_239223 ?auto_239224 ?auto_239225 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_239375 - DIRECTION
      ?auto_239376 - MODE
      ?auto_239378 - DIRECTION
      ?auto_239377 - MODE
      ?auto_239379 - DIRECTION
      ?auto_239380 - MODE
      ?auto_239381 - DIRECTION
      ?auto_239382 - MODE
    )
    :vars
    (
      ?auto_239384 - INSTRUMENT
      ?auto_239383 - SATELLITE
      ?auto_239389 - DIRECTION
      ?auto_239385 - INSTRUMENT
      ?auto_239386 - INSTRUMENT
      ?auto_239387 - INSTRUMENT
      ?auto_239388 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_239384 ?auto_239383 ) ( SUPPORTS ?auto_239384 ?auto_239382 ) ( not ( = ?auto_239381 ?auto_239389 ) ) ( CALIBRATION_TARGET ?auto_239384 ?auto_239389 ) ( not ( = ?auto_239389 ?auto_239378 ) ) ( ON_BOARD ?auto_239385 ?auto_239383 ) ( not ( = ?auto_239381 ?auto_239378 ) ) ( not ( = ?auto_239384 ?auto_239385 ) ) ( SUPPORTS ?auto_239385 ?auto_239377 ) ( CALIBRATION_TARGET ?auto_239385 ?auto_239389 ) ( not ( = ?auto_239389 ?auto_239375 ) ) ( ON_BOARD ?auto_239386 ?auto_239383 ) ( not ( = ?auto_239378 ?auto_239375 ) ) ( not ( = ?auto_239385 ?auto_239386 ) ) ( SUPPORTS ?auto_239386 ?auto_239376 ) ( CALIBRATION_TARGET ?auto_239386 ?auto_239389 ) ( not ( = ?auto_239389 ?auto_239379 ) ) ( ON_BOARD ?auto_239387 ?auto_239383 ) ( not ( = ?auto_239375 ?auto_239379 ) ) ( not ( = ?auto_239386 ?auto_239387 ) ) ( SUPPORTS ?auto_239387 ?auto_239380 ) ( CALIBRATION_TARGET ?auto_239387 ?auto_239389 ) ( POWER_AVAIL ?auto_239383 ) ( POINTING ?auto_239383 ?auto_239388 ) ( not ( = ?auto_239389 ?auto_239388 ) ) ( not ( = ?auto_239379 ?auto_239388 ) ) ( not ( = ?auto_239380 ?auto_239376 ) ) ( not ( = ?auto_239375 ?auto_239388 ) ) ( not ( = ?auto_239379 ?auto_239378 ) ) ( not ( = ?auto_239380 ?auto_239377 ) ) ( not ( = ?auto_239376 ?auto_239377 ) ) ( not ( = ?auto_239378 ?auto_239388 ) ) ( not ( = ?auto_239385 ?auto_239387 ) ) ( not ( = ?auto_239379 ?auto_239381 ) ) ( not ( = ?auto_239380 ?auto_239382 ) ) ( not ( = ?auto_239375 ?auto_239381 ) ) ( not ( = ?auto_239376 ?auto_239382 ) ) ( not ( = ?auto_239377 ?auto_239382 ) ) ( not ( = ?auto_239381 ?auto_239388 ) ) ( not ( = ?auto_239384 ?auto_239386 ) ) ( not ( = ?auto_239384 ?auto_239387 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_239379 ?auto_239380 ?auto_239375 ?auto_239376 ?auto_239381 ?auto_239382 ?auto_239378 ?auto_239377 )
      ( GET-4IMAGE-VERIFY ?auto_239375 ?auto_239376 ?auto_239378 ?auto_239377 ?auto_239379 ?auto_239380 ?auto_239381 ?auto_239382 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_239424 - DIRECTION
      ?auto_239425 - MODE
      ?auto_239427 - DIRECTION
      ?auto_239426 - MODE
      ?auto_239428 - DIRECTION
      ?auto_239429 - MODE
      ?auto_239430 - DIRECTION
      ?auto_239431 - MODE
    )
    :vars
    (
      ?auto_239433 - INSTRUMENT
      ?auto_239432 - SATELLITE
      ?auto_239438 - DIRECTION
      ?auto_239434 - INSTRUMENT
      ?auto_239435 - INSTRUMENT
      ?auto_239436 - INSTRUMENT
      ?auto_239437 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_239433 ?auto_239432 ) ( SUPPORTS ?auto_239433 ?auto_239429 ) ( not ( = ?auto_239428 ?auto_239438 ) ) ( CALIBRATION_TARGET ?auto_239433 ?auto_239438 ) ( not ( = ?auto_239438 ?auto_239427 ) ) ( ON_BOARD ?auto_239434 ?auto_239432 ) ( not ( = ?auto_239428 ?auto_239427 ) ) ( not ( = ?auto_239433 ?auto_239434 ) ) ( SUPPORTS ?auto_239434 ?auto_239426 ) ( CALIBRATION_TARGET ?auto_239434 ?auto_239438 ) ( not ( = ?auto_239438 ?auto_239424 ) ) ( ON_BOARD ?auto_239435 ?auto_239432 ) ( not ( = ?auto_239427 ?auto_239424 ) ) ( not ( = ?auto_239434 ?auto_239435 ) ) ( SUPPORTS ?auto_239435 ?auto_239425 ) ( CALIBRATION_TARGET ?auto_239435 ?auto_239438 ) ( not ( = ?auto_239438 ?auto_239430 ) ) ( ON_BOARD ?auto_239436 ?auto_239432 ) ( not ( = ?auto_239424 ?auto_239430 ) ) ( not ( = ?auto_239435 ?auto_239436 ) ) ( SUPPORTS ?auto_239436 ?auto_239431 ) ( CALIBRATION_TARGET ?auto_239436 ?auto_239438 ) ( POWER_AVAIL ?auto_239432 ) ( POINTING ?auto_239432 ?auto_239437 ) ( not ( = ?auto_239438 ?auto_239437 ) ) ( not ( = ?auto_239430 ?auto_239437 ) ) ( not ( = ?auto_239431 ?auto_239425 ) ) ( not ( = ?auto_239424 ?auto_239437 ) ) ( not ( = ?auto_239430 ?auto_239427 ) ) ( not ( = ?auto_239431 ?auto_239426 ) ) ( not ( = ?auto_239425 ?auto_239426 ) ) ( not ( = ?auto_239427 ?auto_239437 ) ) ( not ( = ?auto_239434 ?auto_239436 ) ) ( not ( = ?auto_239430 ?auto_239428 ) ) ( not ( = ?auto_239431 ?auto_239429 ) ) ( not ( = ?auto_239424 ?auto_239428 ) ) ( not ( = ?auto_239425 ?auto_239429 ) ) ( not ( = ?auto_239426 ?auto_239429 ) ) ( not ( = ?auto_239428 ?auto_239437 ) ) ( not ( = ?auto_239433 ?auto_239435 ) ) ( not ( = ?auto_239433 ?auto_239436 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_239430 ?auto_239431 ?auto_239424 ?auto_239425 ?auto_239428 ?auto_239429 ?auto_239427 ?auto_239426 )
      ( GET-4IMAGE-VERIFY ?auto_239424 ?auto_239425 ?auto_239427 ?auto_239426 ?auto_239428 ?auto_239429 ?auto_239430 ?auto_239431 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_239524 - DIRECTION
      ?auto_239525 - MODE
      ?auto_239527 - DIRECTION
      ?auto_239526 - MODE
      ?auto_239528 - DIRECTION
      ?auto_239529 - MODE
      ?auto_239530 - DIRECTION
      ?auto_239531 - MODE
    )
    :vars
    (
      ?auto_239533 - INSTRUMENT
      ?auto_239532 - SATELLITE
      ?auto_239538 - DIRECTION
      ?auto_239534 - INSTRUMENT
      ?auto_239535 - INSTRUMENT
      ?auto_239536 - INSTRUMENT
      ?auto_239537 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_239533 ?auto_239532 ) ( SUPPORTS ?auto_239533 ?auto_239526 ) ( not ( = ?auto_239527 ?auto_239538 ) ) ( CALIBRATION_TARGET ?auto_239533 ?auto_239538 ) ( not ( = ?auto_239538 ?auto_239530 ) ) ( ON_BOARD ?auto_239534 ?auto_239532 ) ( not ( = ?auto_239527 ?auto_239530 ) ) ( not ( = ?auto_239533 ?auto_239534 ) ) ( SUPPORTS ?auto_239534 ?auto_239531 ) ( CALIBRATION_TARGET ?auto_239534 ?auto_239538 ) ( not ( = ?auto_239538 ?auto_239524 ) ) ( ON_BOARD ?auto_239535 ?auto_239532 ) ( not ( = ?auto_239530 ?auto_239524 ) ) ( not ( = ?auto_239534 ?auto_239535 ) ) ( SUPPORTS ?auto_239535 ?auto_239525 ) ( CALIBRATION_TARGET ?auto_239535 ?auto_239538 ) ( not ( = ?auto_239538 ?auto_239528 ) ) ( ON_BOARD ?auto_239536 ?auto_239532 ) ( not ( = ?auto_239524 ?auto_239528 ) ) ( not ( = ?auto_239535 ?auto_239536 ) ) ( SUPPORTS ?auto_239536 ?auto_239529 ) ( CALIBRATION_TARGET ?auto_239536 ?auto_239538 ) ( POWER_AVAIL ?auto_239532 ) ( POINTING ?auto_239532 ?auto_239537 ) ( not ( = ?auto_239538 ?auto_239537 ) ) ( not ( = ?auto_239528 ?auto_239537 ) ) ( not ( = ?auto_239529 ?auto_239525 ) ) ( not ( = ?auto_239524 ?auto_239537 ) ) ( not ( = ?auto_239528 ?auto_239530 ) ) ( not ( = ?auto_239529 ?auto_239531 ) ) ( not ( = ?auto_239525 ?auto_239531 ) ) ( not ( = ?auto_239530 ?auto_239537 ) ) ( not ( = ?auto_239534 ?auto_239536 ) ) ( not ( = ?auto_239528 ?auto_239527 ) ) ( not ( = ?auto_239529 ?auto_239526 ) ) ( not ( = ?auto_239524 ?auto_239527 ) ) ( not ( = ?auto_239525 ?auto_239526 ) ) ( not ( = ?auto_239531 ?auto_239526 ) ) ( not ( = ?auto_239527 ?auto_239537 ) ) ( not ( = ?auto_239533 ?auto_239535 ) ) ( not ( = ?auto_239533 ?auto_239536 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_239528 ?auto_239529 ?auto_239524 ?auto_239525 ?auto_239527 ?auto_239526 ?auto_239530 ?auto_239531 )
      ( GET-4IMAGE-VERIFY ?auto_239524 ?auto_239525 ?auto_239527 ?auto_239526 ?auto_239528 ?auto_239529 ?auto_239530 ?auto_239531 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_239628 - DIRECTION
      ?auto_239629 - MODE
      ?auto_239631 - DIRECTION
      ?auto_239630 - MODE
      ?auto_239632 - DIRECTION
      ?auto_239633 - MODE
      ?auto_239634 - DIRECTION
      ?auto_239635 - MODE
    )
    :vars
    (
      ?auto_239637 - INSTRUMENT
      ?auto_239636 - SATELLITE
      ?auto_239642 - DIRECTION
      ?auto_239638 - INSTRUMENT
      ?auto_239639 - INSTRUMENT
      ?auto_239640 - INSTRUMENT
      ?auto_239641 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_239637 ?auto_239636 ) ( SUPPORTS ?auto_239637 ?auto_239630 ) ( not ( = ?auto_239631 ?auto_239642 ) ) ( CALIBRATION_TARGET ?auto_239637 ?auto_239642 ) ( not ( = ?auto_239642 ?auto_239632 ) ) ( ON_BOARD ?auto_239638 ?auto_239636 ) ( not ( = ?auto_239631 ?auto_239632 ) ) ( not ( = ?auto_239637 ?auto_239638 ) ) ( SUPPORTS ?auto_239638 ?auto_239633 ) ( CALIBRATION_TARGET ?auto_239638 ?auto_239642 ) ( not ( = ?auto_239642 ?auto_239628 ) ) ( ON_BOARD ?auto_239639 ?auto_239636 ) ( not ( = ?auto_239632 ?auto_239628 ) ) ( not ( = ?auto_239638 ?auto_239639 ) ) ( SUPPORTS ?auto_239639 ?auto_239629 ) ( CALIBRATION_TARGET ?auto_239639 ?auto_239642 ) ( not ( = ?auto_239642 ?auto_239634 ) ) ( ON_BOARD ?auto_239640 ?auto_239636 ) ( not ( = ?auto_239628 ?auto_239634 ) ) ( not ( = ?auto_239639 ?auto_239640 ) ) ( SUPPORTS ?auto_239640 ?auto_239635 ) ( CALIBRATION_TARGET ?auto_239640 ?auto_239642 ) ( POWER_AVAIL ?auto_239636 ) ( POINTING ?auto_239636 ?auto_239641 ) ( not ( = ?auto_239642 ?auto_239641 ) ) ( not ( = ?auto_239634 ?auto_239641 ) ) ( not ( = ?auto_239635 ?auto_239629 ) ) ( not ( = ?auto_239628 ?auto_239641 ) ) ( not ( = ?auto_239634 ?auto_239632 ) ) ( not ( = ?auto_239635 ?auto_239633 ) ) ( not ( = ?auto_239629 ?auto_239633 ) ) ( not ( = ?auto_239632 ?auto_239641 ) ) ( not ( = ?auto_239638 ?auto_239640 ) ) ( not ( = ?auto_239634 ?auto_239631 ) ) ( not ( = ?auto_239635 ?auto_239630 ) ) ( not ( = ?auto_239628 ?auto_239631 ) ) ( not ( = ?auto_239629 ?auto_239630 ) ) ( not ( = ?auto_239633 ?auto_239630 ) ) ( not ( = ?auto_239631 ?auto_239641 ) ) ( not ( = ?auto_239637 ?auto_239639 ) ) ( not ( = ?auto_239637 ?auto_239640 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_239634 ?auto_239635 ?auto_239628 ?auto_239629 ?auto_239631 ?auto_239630 ?auto_239632 ?auto_239633 )
      ( GET-4IMAGE-VERIFY ?auto_239628 ?auto_239629 ?auto_239631 ?auto_239630 ?auto_239632 ?auto_239633 ?auto_239634 ?auto_239635 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_239783 - DIRECTION
      ?auto_239784 - MODE
      ?auto_239786 - DIRECTION
      ?auto_239785 - MODE
      ?auto_239787 - DIRECTION
      ?auto_239788 - MODE
      ?auto_239789 - DIRECTION
      ?auto_239790 - MODE
    )
    :vars
    (
      ?auto_239792 - INSTRUMENT
      ?auto_239791 - SATELLITE
      ?auto_239797 - DIRECTION
      ?auto_239793 - INSTRUMENT
      ?auto_239794 - INSTRUMENT
      ?auto_239795 - INSTRUMENT
      ?auto_239796 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_239792 ?auto_239791 ) ( SUPPORTS ?auto_239792 ?auto_239790 ) ( not ( = ?auto_239789 ?auto_239797 ) ) ( CALIBRATION_TARGET ?auto_239792 ?auto_239797 ) ( not ( = ?auto_239797 ?auto_239783 ) ) ( ON_BOARD ?auto_239793 ?auto_239791 ) ( not ( = ?auto_239789 ?auto_239783 ) ) ( not ( = ?auto_239792 ?auto_239793 ) ) ( SUPPORTS ?auto_239793 ?auto_239784 ) ( CALIBRATION_TARGET ?auto_239793 ?auto_239797 ) ( not ( = ?auto_239797 ?auto_239787 ) ) ( ON_BOARD ?auto_239794 ?auto_239791 ) ( not ( = ?auto_239783 ?auto_239787 ) ) ( not ( = ?auto_239793 ?auto_239794 ) ) ( SUPPORTS ?auto_239794 ?auto_239788 ) ( CALIBRATION_TARGET ?auto_239794 ?auto_239797 ) ( not ( = ?auto_239797 ?auto_239786 ) ) ( ON_BOARD ?auto_239795 ?auto_239791 ) ( not ( = ?auto_239787 ?auto_239786 ) ) ( not ( = ?auto_239794 ?auto_239795 ) ) ( SUPPORTS ?auto_239795 ?auto_239785 ) ( CALIBRATION_TARGET ?auto_239795 ?auto_239797 ) ( POWER_AVAIL ?auto_239791 ) ( POINTING ?auto_239791 ?auto_239796 ) ( not ( = ?auto_239797 ?auto_239796 ) ) ( not ( = ?auto_239786 ?auto_239796 ) ) ( not ( = ?auto_239785 ?auto_239788 ) ) ( not ( = ?auto_239787 ?auto_239796 ) ) ( not ( = ?auto_239786 ?auto_239783 ) ) ( not ( = ?auto_239785 ?auto_239784 ) ) ( not ( = ?auto_239788 ?auto_239784 ) ) ( not ( = ?auto_239783 ?auto_239796 ) ) ( not ( = ?auto_239793 ?auto_239795 ) ) ( not ( = ?auto_239786 ?auto_239789 ) ) ( not ( = ?auto_239785 ?auto_239790 ) ) ( not ( = ?auto_239787 ?auto_239789 ) ) ( not ( = ?auto_239788 ?auto_239790 ) ) ( not ( = ?auto_239784 ?auto_239790 ) ) ( not ( = ?auto_239789 ?auto_239796 ) ) ( not ( = ?auto_239792 ?auto_239794 ) ) ( not ( = ?auto_239792 ?auto_239795 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_239786 ?auto_239785 ?auto_239787 ?auto_239788 ?auto_239789 ?auto_239790 ?auto_239783 ?auto_239784 )
      ( GET-4IMAGE-VERIFY ?auto_239783 ?auto_239784 ?auto_239786 ?auto_239785 ?auto_239787 ?auto_239788 ?auto_239789 ?auto_239790 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_239832 - DIRECTION
      ?auto_239833 - MODE
      ?auto_239835 - DIRECTION
      ?auto_239834 - MODE
      ?auto_239836 - DIRECTION
      ?auto_239837 - MODE
      ?auto_239838 - DIRECTION
      ?auto_239839 - MODE
    )
    :vars
    (
      ?auto_239841 - INSTRUMENT
      ?auto_239840 - SATELLITE
      ?auto_239846 - DIRECTION
      ?auto_239842 - INSTRUMENT
      ?auto_239843 - INSTRUMENT
      ?auto_239844 - INSTRUMENT
      ?auto_239845 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_239841 ?auto_239840 ) ( SUPPORTS ?auto_239841 ?auto_239837 ) ( not ( = ?auto_239836 ?auto_239846 ) ) ( CALIBRATION_TARGET ?auto_239841 ?auto_239846 ) ( not ( = ?auto_239846 ?auto_239832 ) ) ( ON_BOARD ?auto_239842 ?auto_239840 ) ( not ( = ?auto_239836 ?auto_239832 ) ) ( not ( = ?auto_239841 ?auto_239842 ) ) ( SUPPORTS ?auto_239842 ?auto_239833 ) ( CALIBRATION_TARGET ?auto_239842 ?auto_239846 ) ( not ( = ?auto_239846 ?auto_239838 ) ) ( ON_BOARD ?auto_239843 ?auto_239840 ) ( not ( = ?auto_239832 ?auto_239838 ) ) ( not ( = ?auto_239842 ?auto_239843 ) ) ( SUPPORTS ?auto_239843 ?auto_239839 ) ( CALIBRATION_TARGET ?auto_239843 ?auto_239846 ) ( not ( = ?auto_239846 ?auto_239835 ) ) ( ON_BOARD ?auto_239844 ?auto_239840 ) ( not ( = ?auto_239838 ?auto_239835 ) ) ( not ( = ?auto_239843 ?auto_239844 ) ) ( SUPPORTS ?auto_239844 ?auto_239834 ) ( CALIBRATION_TARGET ?auto_239844 ?auto_239846 ) ( POWER_AVAIL ?auto_239840 ) ( POINTING ?auto_239840 ?auto_239845 ) ( not ( = ?auto_239846 ?auto_239845 ) ) ( not ( = ?auto_239835 ?auto_239845 ) ) ( not ( = ?auto_239834 ?auto_239839 ) ) ( not ( = ?auto_239838 ?auto_239845 ) ) ( not ( = ?auto_239835 ?auto_239832 ) ) ( not ( = ?auto_239834 ?auto_239833 ) ) ( not ( = ?auto_239839 ?auto_239833 ) ) ( not ( = ?auto_239832 ?auto_239845 ) ) ( not ( = ?auto_239842 ?auto_239844 ) ) ( not ( = ?auto_239835 ?auto_239836 ) ) ( not ( = ?auto_239834 ?auto_239837 ) ) ( not ( = ?auto_239838 ?auto_239836 ) ) ( not ( = ?auto_239839 ?auto_239837 ) ) ( not ( = ?auto_239833 ?auto_239837 ) ) ( not ( = ?auto_239836 ?auto_239845 ) ) ( not ( = ?auto_239841 ?auto_239843 ) ) ( not ( = ?auto_239841 ?auto_239844 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_239835 ?auto_239834 ?auto_239838 ?auto_239839 ?auto_239836 ?auto_239837 ?auto_239832 ?auto_239833 )
      ( GET-4IMAGE-VERIFY ?auto_239832 ?auto_239833 ?auto_239835 ?auto_239834 ?auto_239836 ?auto_239837 ?auto_239838 ?auto_239839 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_239881 - DIRECTION
      ?auto_239882 - MODE
      ?auto_239884 - DIRECTION
      ?auto_239883 - MODE
      ?auto_239885 - DIRECTION
      ?auto_239886 - MODE
      ?auto_239887 - DIRECTION
      ?auto_239888 - MODE
    )
    :vars
    (
      ?auto_239890 - INSTRUMENT
      ?auto_239889 - SATELLITE
      ?auto_239895 - DIRECTION
      ?auto_239891 - INSTRUMENT
      ?auto_239892 - INSTRUMENT
      ?auto_239893 - INSTRUMENT
      ?auto_239894 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_239890 ?auto_239889 ) ( SUPPORTS ?auto_239890 ?auto_239888 ) ( not ( = ?auto_239887 ?auto_239895 ) ) ( CALIBRATION_TARGET ?auto_239890 ?auto_239895 ) ( not ( = ?auto_239895 ?auto_239881 ) ) ( ON_BOARD ?auto_239891 ?auto_239889 ) ( not ( = ?auto_239887 ?auto_239881 ) ) ( not ( = ?auto_239890 ?auto_239891 ) ) ( SUPPORTS ?auto_239891 ?auto_239882 ) ( CALIBRATION_TARGET ?auto_239891 ?auto_239895 ) ( not ( = ?auto_239895 ?auto_239884 ) ) ( ON_BOARD ?auto_239892 ?auto_239889 ) ( not ( = ?auto_239881 ?auto_239884 ) ) ( not ( = ?auto_239891 ?auto_239892 ) ) ( SUPPORTS ?auto_239892 ?auto_239883 ) ( CALIBRATION_TARGET ?auto_239892 ?auto_239895 ) ( not ( = ?auto_239895 ?auto_239885 ) ) ( ON_BOARD ?auto_239893 ?auto_239889 ) ( not ( = ?auto_239884 ?auto_239885 ) ) ( not ( = ?auto_239892 ?auto_239893 ) ) ( SUPPORTS ?auto_239893 ?auto_239886 ) ( CALIBRATION_TARGET ?auto_239893 ?auto_239895 ) ( POWER_AVAIL ?auto_239889 ) ( POINTING ?auto_239889 ?auto_239894 ) ( not ( = ?auto_239895 ?auto_239894 ) ) ( not ( = ?auto_239885 ?auto_239894 ) ) ( not ( = ?auto_239886 ?auto_239883 ) ) ( not ( = ?auto_239884 ?auto_239894 ) ) ( not ( = ?auto_239885 ?auto_239881 ) ) ( not ( = ?auto_239886 ?auto_239882 ) ) ( not ( = ?auto_239883 ?auto_239882 ) ) ( not ( = ?auto_239881 ?auto_239894 ) ) ( not ( = ?auto_239891 ?auto_239893 ) ) ( not ( = ?auto_239885 ?auto_239887 ) ) ( not ( = ?auto_239886 ?auto_239888 ) ) ( not ( = ?auto_239884 ?auto_239887 ) ) ( not ( = ?auto_239883 ?auto_239888 ) ) ( not ( = ?auto_239882 ?auto_239888 ) ) ( not ( = ?auto_239887 ?auto_239894 ) ) ( not ( = ?auto_239890 ?auto_239892 ) ) ( not ( = ?auto_239890 ?auto_239893 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_239885 ?auto_239886 ?auto_239884 ?auto_239883 ?auto_239887 ?auto_239888 ?auto_239881 ?auto_239882 )
      ( GET-4IMAGE-VERIFY ?auto_239881 ?auto_239882 ?auto_239884 ?auto_239883 ?auto_239885 ?auto_239886 ?auto_239887 ?auto_239888 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_239930 - DIRECTION
      ?auto_239931 - MODE
      ?auto_239933 - DIRECTION
      ?auto_239932 - MODE
      ?auto_239934 - DIRECTION
      ?auto_239935 - MODE
      ?auto_239936 - DIRECTION
      ?auto_239937 - MODE
    )
    :vars
    (
      ?auto_239939 - INSTRUMENT
      ?auto_239938 - SATELLITE
      ?auto_239944 - DIRECTION
      ?auto_239940 - INSTRUMENT
      ?auto_239941 - INSTRUMENT
      ?auto_239942 - INSTRUMENT
      ?auto_239943 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_239939 ?auto_239938 ) ( SUPPORTS ?auto_239939 ?auto_239935 ) ( not ( = ?auto_239934 ?auto_239944 ) ) ( CALIBRATION_TARGET ?auto_239939 ?auto_239944 ) ( not ( = ?auto_239944 ?auto_239930 ) ) ( ON_BOARD ?auto_239940 ?auto_239938 ) ( not ( = ?auto_239934 ?auto_239930 ) ) ( not ( = ?auto_239939 ?auto_239940 ) ) ( SUPPORTS ?auto_239940 ?auto_239931 ) ( CALIBRATION_TARGET ?auto_239940 ?auto_239944 ) ( not ( = ?auto_239944 ?auto_239933 ) ) ( ON_BOARD ?auto_239941 ?auto_239938 ) ( not ( = ?auto_239930 ?auto_239933 ) ) ( not ( = ?auto_239940 ?auto_239941 ) ) ( SUPPORTS ?auto_239941 ?auto_239932 ) ( CALIBRATION_TARGET ?auto_239941 ?auto_239944 ) ( not ( = ?auto_239944 ?auto_239936 ) ) ( ON_BOARD ?auto_239942 ?auto_239938 ) ( not ( = ?auto_239933 ?auto_239936 ) ) ( not ( = ?auto_239941 ?auto_239942 ) ) ( SUPPORTS ?auto_239942 ?auto_239937 ) ( CALIBRATION_TARGET ?auto_239942 ?auto_239944 ) ( POWER_AVAIL ?auto_239938 ) ( POINTING ?auto_239938 ?auto_239943 ) ( not ( = ?auto_239944 ?auto_239943 ) ) ( not ( = ?auto_239936 ?auto_239943 ) ) ( not ( = ?auto_239937 ?auto_239932 ) ) ( not ( = ?auto_239933 ?auto_239943 ) ) ( not ( = ?auto_239936 ?auto_239930 ) ) ( not ( = ?auto_239937 ?auto_239931 ) ) ( not ( = ?auto_239932 ?auto_239931 ) ) ( not ( = ?auto_239930 ?auto_239943 ) ) ( not ( = ?auto_239940 ?auto_239942 ) ) ( not ( = ?auto_239936 ?auto_239934 ) ) ( not ( = ?auto_239937 ?auto_239935 ) ) ( not ( = ?auto_239933 ?auto_239934 ) ) ( not ( = ?auto_239932 ?auto_239935 ) ) ( not ( = ?auto_239931 ?auto_239935 ) ) ( not ( = ?auto_239934 ?auto_239943 ) ) ( not ( = ?auto_239939 ?auto_239941 ) ) ( not ( = ?auto_239939 ?auto_239942 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_239936 ?auto_239937 ?auto_239933 ?auto_239932 ?auto_239934 ?auto_239935 ?auto_239930 ?auto_239931 )
      ( GET-4IMAGE-VERIFY ?auto_239930 ?auto_239931 ?auto_239933 ?auto_239932 ?auto_239934 ?auto_239935 ?auto_239936 ?auto_239937 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_240138 - DIRECTION
      ?auto_240139 - MODE
      ?auto_240141 - DIRECTION
      ?auto_240140 - MODE
      ?auto_240142 - DIRECTION
      ?auto_240143 - MODE
      ?auto_240144 - DIRECTION
      ?auto_240145 - MODE
    )
    :vars
    (
      ?auto_240147 - INSTRUMENT
      ?auto_240146 - SATELLITE
      ?auto_240152 - DIRECTION
      ?auto_240148 - INSTRUMENT
      ?auto_240149 - INSTRUMENT
      ?auto_240150 - INSTRUMENT
      ?auto_240151 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_240147 ?auto_240146 ) ( SUPPORTS ?auto_240147 ?auto_240140 ) ( not ( = ?auto_240141 ?auto_240152 ) ) ( CALIBRATION_TARGET ?auto_240147 ?auto_240152 ) ( not ( = ?auto_240152 ?auto_240138 ) ) ( ON_BOARD ?auto_240148 ?auto_240146 ) ( not ( = ?auto_240141 ?auto_240138 ) ) ( not ( = ?auto_240147 ?auto_240148 ) ) ( SUPPORTS ?auto_240148 ?auto_240139 ) ( CALIBRATION_TARGET ?auto_240148 ?auto_240152 ) ( not ( = ?auto_240152 ?auto_240144 ) ) ( ON_BOARD ?auto_240149 ?auto_240146 ) ( not ( = ?auto_240138 ?auto_240144 ) ) ( not ( = ?auto_240148 ?auto_240149 ) ) ( SUPPORTS ?auto_240149 ?auto_240145 ) ( CALIBRATION_TARGET ?auto_240149 ?auto_240152 ) ( not ( = ?auto_240152 ?auto_240142 ) ) ( ON_BOARD ?auto_240150 ?auto_240146 ) ( not ( = ?auto_240144 ?auto_240142 ) ) ( not ( = ?auto_240149 ?auto_240150 ) ) ( SUPPORTS ?auto_240150 ?auto_240143 ) ( CALIBRATION_TARGET ?auto_240150 ?auto_240152 ) ( POWER_AVAIL ?auto_240146 ) ( POINTING ?auto_240146 ?auto_240151 ) ( not ( = ?auto_240152 ?auto_240151 ) ) ( not ( = ?auto_240142 ?auto_240151 ) ) ( not ( = ?auto_240143 ?auto_240145 ) ) ( not ( = ?auto_240144 ?auto_240151 ) ) ( not ( = ?auto_240142 ?auto_240138 ) ) ( not ( = ?auto_240143 ?auto_240139 ) ) ( not ( = ?auto_240145 ?auto_240139 ) ) ( not ( = ?auto_240138 ?auto_240151 ) ) ( not ( = ?auto_240148 ?auto_240150 ) ) ( not ( = ?auto_240142 ?auto_240141 ) ) ( not ( = ?auto_240143 ?auto_240140 ) ) ( not ( = ?auto_240144 ?auto_240141 ) ) ( not ( = ?auto_240145 ?auto_240140 ) ) ( not ( = ?auto_240139 ?auto_240140 ) ) ( not ( = ?auto_240141 ?auto_240151 ) ) ( not ( = ?auto_240147 ?auto_240149 ) ) ( not ( = ?auto_240147 ?auto_240150 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_240142 ?auto_240143 ?auto_240144 ?auto_240145 ?auto_240141 ?auto_240140 ?auto_240138 ?auto_240139 )
      ( GET-4IMAGE-VERIFY ?auto_240138 ?auto_240139 ?auto_240141 ?auto_240140 ?auto_240142 ?auto_240143 ?auto_240144 ?auto_240145 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_240187 - DIRECTION
      ?auto_240188 - MODE
      ?auto_240190 - DIRECTION
      ?auto_240189 - MODE
      ?auto_240191 - DIRECTION
      ?auto_240192 - MODE
      ?auto_240193 - DIRECTION
      ?auto_240194 - MODE
    )
    :vars
    (
      ?auto_240196 - INSTRUMENT
      ?auto_240195 - SATELLITE
      ?auto_240201 - DIRECTION
      ?auto_240197 - INSTRUMENT
      ?auto_240198 - INSTRUMENT
      ?auto_240199 - INSTRUMENT
      ?auto_240200 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_240196 ?auto_240195 ) ( SUPPORTS ?auto_240196 ?auto_240189 ) ( not ( = ?auto_240190 ?auto_240201 ) ) ( CALIBRATION_TARGET ?auto_240196 ?auto_240201 ) ( not ( = ?auto_240201 ?auto_240187 ) ) ( ON_BOARD ?auto_240197 ?auto_240195 ) ( not ( = ?auto_240190 ?auto_240187 ) ) ( not ( = ?auto_240196 ?auto_240197 ) ) ( SUPPORTS ?auto_240197 ?auto_240188 ) ( CALIBRATION_TARGET ?auto_240197 ?auto_240201 ) ( not ( = ?auto_240201 ?auto_240191 ) ) ( ON_BOARD ?auto_240198 ?auto_240195 ) ( not ( = ?auto_240187 ?auto_240191 ) ) ( not ( = ?auto_240197 ?auto_240198 ) ) ( SUPPORTS ?auto_240198 ?auto_240192 ) ( CALIBRATION_TARGET ?auto_240198 ?auto_240201 ) ( not ( = ?auto_240201 ?auto_240193 ) ) ( ON_BOARD ?auto_240199 ?auto_240195 ) ( not ( = ?auto_240191 ?auto_240193 ) ) ( not ( = ?auto_240198 ?auto_240199 ) ) ( SUPPORTS ?auto_240199 ?auto_240194 ) ( CALIBRATION_TARGET ?auto_240199 ?auto_240201 ) ( POWER_AVAIL ?auto_240195 ) ( POINTING ?auto_240195 ?auto_240200 ) ( not ( = ?auto_240201 ?auto_240200 ) ) ( not ( = ?auto_240193 ?auto_240200 ) ) ( not ( = ?auto_240194 ?auto_240192 ) ) ( not ( = ?auto_240191 ?auto_240200 ) ) ( not ( = ?auto_240193 ?auto_240187 ) ) ( not ( = ?auto_240194 ?auto_240188 ) ) ( not ( = ?auto_240192 ?auto_240188 ) ) ( not ( = ?auto_240187 ?auto_240200 ) ) ( not ( = ?auto_240197 ?auto_240199 ) ) ( not ( = ?auto_240193 ?auto_240190 ) ) ( not ( = ?auto_240194 ?auto_240189 ) ) ( not ( = ?auto_240191 ?auto_240190 ) ) ( not ( = ?auto_240192 ?auto_240189 ) ) ( not ( = ?auto_240188 ?auto_240189 ) ) ( not ( = ?auto_240190 ?auto_240200 ) ) ( not ( = ?auto_240196 ?auto_240198 ) ) ( not ( = ?auto_240196 ?auto_240199 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_240193 ?auto_240194 ?auto_240191 ?auto_240192 ?auto_240190 ?auto_240189 ?auto_240187 ?auto_240188 )
      ( GET-4IMAGE-VERIFY ?auto_240187 ?auto_240188 ?auto_240190 ?auto_240189 ?auto_240191 ?auto_240192 ?auto_240193 ?auto_240194 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_240503 - DIRECTION
      ?auto_240504 - MODE
      ?auto_240506 - DIRECTION
      ?auto_240505 - MODE
      ?auto_240507 - DIRECTION
      ?auto_240508 - MODE
      ?auto_240509 - DIRECTION
      ?auto_240510 - MODE
    )
    :vars
    (
      ?auto_240512 - INSTRUMENT
      ?auto_240511 - SATELLITE
      ?auto_240517 - DIRECTION
      ?auto_240513 - INSTRUMENT
      ?auto_240514 - INSTRUMENT
      ?auto_240515 - INSTRUMENT
      ?auto_240516 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_240512 ?auto_240511 ) ( SUPPORTS ?auto_240512 ?auto_240504 ) ( not ( = ?auto_240503 ?auto_240517 ) ) ( CALIBRATION_TARGET ?auto_240512 ?auto_240517 ) ( not ( = ?auto_240517 ?auto_240509 ) ) ( ON_BOARD ?auto_240513 ?auto_240511 ) ( not ( = ?auto_240503 ?auto_240509 ) ) ( not ( = ?auto_240512 ?auto_240513 ) ) ( SUPPORTS ?auto_240513 ?auto_240510 ) ( CALIBRATION_TARGET ?auto_240513 ?auto_240517 ) ( not ( = ?auto_240517 ?auto_240507 ) ) ( ON_BOARD ?auto_240514 ?auto_240511 ) ( not ( = ?auto_240509 ?auto_240507 ) ) ( not ( = ?auto_240513 ?auto_240514 ) ) ( SUPPORTS ?auto_240514 ?auto_240508 ) ( CALIBRATION_TARGET ?auto_240514 ?auto_240517 ) ( not ( = ?auto_240517 ?auto_240506 ) ) ( ON_BOARD ?auto_240515 ?auto_240511 ) ( not ( = ?auto_240507 ?auto_240506 ) ) ( not ( = ?auto_240514 ?auto_240515 ) ) ( SUPPORTS ?auto_240515 ?auto_240505 ) ( CALIBRATION_TARGET ?auto_240515 ?auto_240517 ) ( POWER_AVAIL ?auto_240511 ) ( POINTING ?auto_240511 ?auto_240516 ) ( not ( = ?auto_240517 ?auto_240516 ) ) ( not ( = ?auto_240506 ?auto_240516 ) ) ( not ( = ?auto_240505 ?auto_240508 ) ) ( not ( = ?auto_240507 ?auto_240516 ) ) ( not ( = ?auto_240506 ?auto_240509 ) ) ( not ( = ?auto_240505 ?auto_240510 ) ) ( not ( = ?auto_240508 ?auto_240510 ) ) ( not ( = ?auto_240509 ?auto_240516 ) ) ( not ( = ?auto_240513 ?auto_240515 ) ) ( not ( = ?auto_240506 ?auto_240503 ) ) ( not ( = ?auto_240505 ?auto_240504 ) ) ( not ( = ?auto_240507 ?auto_240503 ) ) ( not ( = ?auto_240508 ?auto_240504 ) ) ( not ( = ?auto_240510 ?auto_240504 ) ) ( not ( = ?auto_240503 ?auto_240516 ) ) ( not ( = ?auto_240512 ?auto_240514 ) ) ( not ( = ?auto_240512 ?auto_240515 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_240506 ?auto_240505 ?auto_240507 ?auto_240508 ?auto_240503 ?auto_240504 ?auto_240509 ?auto_240510 )
      ( GET-4IMAGE-VERIFY ?auto_240503 ?auto_240504 ?auto_240506 ?auto_240505 ?auto_240507 ?auto_240508 ?auto_240509 ?auto_240510 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_240552 - DIRECTION
      ?auto_240553 - MODE
      ?auto_240555 - DIRECTION
      ?auto_240554 - MODE
      ?auto_240556 - DIRECTION
      ?auto_240557 - MODE
      ?auto_240558 - DIRECTION
      ?auto_240559 - MODE
    )
    :vars
    (
      ?auto_240561 - INSTRUMENT
      ?auto_240560 - SATELLITE
      ?auto_240566 - DIRECTION
      ?auto_240562 - INSTRUMENT
      ?auto_240563 - INSTRUMENT
      ?auto_240564 - INSTRUMENT
      ?auto_240565 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_240561 ?auto_240560 ) ( SUPPORTS ?auto_240561 ?auto_240553 ) ( not ( = ?auto_240552 ?auto_240566 ) ) ( CALIBRATION_TARGET ?auto_240561 ?auto_240566 ) ( not ( = ?auto_240566 ?auto_240556 ) ) ( ON_BOARD ?auto_240562 ?auto_240560 ) ( not ( = ?auto_240552 ?auto_240556 ) ) ( not ( = ?auto_240561 ?auto_240562 ) ) ( SUPPORTS ?auto_240562 ?auto_240557 ) ( CALIBRATION_TARGET ?auto_240562 ?auto_240566 ) ( not ( = ?auto_240566 ?auto_240558 ) ) ( ON_BOARD ?auto_240563 ?auto_240560 ) ( not ( = ?auto_240556 ?auto_240558 ) ) ( not ( = ?auto_240562 ?auto_240563 ) ) ( SUPPORTS ?auto_240563 ?auto_240559 ) ( CALIBRATION_TARGET ?auto_240563 ?auto_240566 ) ( not ( = ?auto_240566 ?auto_240555 ) ) ( ON_BOARD ?auto_240564 ?auto_240560 ) ( not ( = ?auto_240558 ?auto_240555 ) ) ( not ( = ?auto_240563 ?auto_240564 ) ) ( SUPPORTS ?auto_240564 ?auto_240554 ) ( CALIBRATION_TARGET ?auto_240564 ?auto_240566 ) ( POWER_AVAIL ?auto_240560 ) ( POINTING ?auto_240560 ?auto_240565 ) ( not ( = ?auto_240566 ?auto_240565 ) ) ( not ( = ?auto_240555 ?auto_240565 ) ) ( not ( = ?auto_240554 ?auto_240559 ) ) ( not ( = ?auto_240558 ?auto_240565 ) ) ( not ( = ?auto_240555 ?auto_240556 ) ) ( not ( = ?auto_240554 ?auto_240557 ) ) ( not ( = ?auto_240559 ?auto_240557 ) ) ( not ( = ?auto_240556 ?auto_240565 ) ) ( not ( = ?auto_240562 ?auto_240564 ) ) ( not ( = ?auto_240555 ?auto_240552 ) ) ( not ( = ?auto_240554 ?auto_240553 ) ) ( not ( = ?auto_240558 ?auto_240552 ) ) ( not ( = ?auto_240559 ?auto_240553 ) ) ( not ( = ?auto_240557 ?auto_240553 ) ) ( not ( = ?auto_240552 ?auto_240565 ) ) ( not ( = ?auto_240561 ?auto_240563 ) ) ( not ( = ?auto_240561 ?auto_240564 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_240555 ?auto_240554 ?auto_240558 ?auto_240559 ?auto_240552 ?auto_240553 ?auto_240556 ?auto_240557 )
      ( GET-4IMAGE-VERIFY ?auto_240552 ?auto_240553 ?auto_240555 ?auto_240554 ?auto_240556 ?auto_240557 ?auto_240558 ?auto_240559 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_240707 - DIRECTION
      ?auto_240708 - MODE
      ?auto_240710 - DIRECTION
      ?auto_240709 - MODE
      ?auto_240711 - DIRECTION
      ?auto_240712 - MODE
      ?auto_240713 - DIRECTION
      ?auto_240714 - MODE
    )
    :vars
    (
      ?auto_240716 - INSTRUMENT
      ?auto_240715 - SATELLITE
      ?auto_240721 - DIRECTION
      ?auto_240717 - INSTRUMENT
      ?auto_240718 - INSTRUMENT
      ?auto_240719 - INSTRUMENT
      ?auto_240720 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_240716 ?auto_240715 ) ( SUPPORTS ?auto_240716 ?auto_240708 ) ( not ( = ?auto_240707 ?auto_240721 ) ) ( CALIBRATION_TARGET ?auto_240716 ?auto_240721 ) ( not ( = ?auto_240721 ?auto_240713 ) ) ( ON_BOARD ?auto_240717 ?auto_240715 ) ( not ( = ?auto_240707 ?auto_240713 ) ) ( not ( = ?auto_240716 ?auto_240717 ) ) ( SUPPORTS ?auto_240717 ?auto_240714 ) ( CALIBRATION_TARGET ?auto_240717 ?auto_240721 ) ( not ( = ?auto_240721 ?auto_240710 ) ) ( ON_BOARD ?auto_240718 ?auto_240715 ) ( not ( = ?auto_240713 ?auto_240710 ) ) ( not ( = ?auto_240717 ?auto_240718 ) ) ( SUPPORTS ?auto_240718 ?auto_240709 ) ( CALIBRATION_TARGET ?auto_240718 ?auto_240721 ) ( not ( = ?auto_240721 ?auto_240711 ) ) ( ON_BOARD ?auto_240719 ?auto_240715 ) ( not ( = ?auto_240710 ?auto_240711 ) ) ( not ( = ?auto_240718 ?auto_240719 ) ) ( SUPPORTS ?auto_240719 ?auto_240712 ) ( CALIBRATION_TARGET ?auto_240719 ?auto_240721 ) ( POWER_AVAIL ?auto_240715 ) ( POINTING ?auto_240715 ?auto_240720 ) ( not ( = ?auto_240721 ?auto_240720 ) ) ( not ( = ?auto_240711 ?auto_240720 ) ) ( not ( = ?auto_240712 ?auto_240709 ) ) ( not ( = ?auto_240710 ?auto_240720 ) ) ( not ( = ?auto_240711 ?auto_240713 ) ) ( not ( = ?auto_240712 ?auto_240714 ) ) ( not ( = ?auto_240709 ?auto_240714 ) ) ( not ( = ?auto_240713 ?auto_240720 ) ) ( not ( = ?auto_240717 ?auto_240719 ) ) ( not ( = ?auto_240711 ?auto_240707 ) ) ( not ( = ?auto_240712 ?auto_240708 ) ) ( not ( = ?auto_240710 ?auto_240707 ) ) ( not ( = ?auto_240709 ?auto_240708 ) ) ( not ( = ?auto_240714 ?auto_240708 ) ) ( not ( = ?auto_240707 ?auto_240720 ) ) ( not ( = ?auto_240716 ?auto_240718 ) ) ( not ( = ?auto_240716 ?auto_240719 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_240711 ?auto_240712 ?auto_240710 ?auto_240709 ?auto_240707 ?auto_240708 ?auto_240713 ?auto_240714 )
      ( GET-4IMAGE-VERIFY ?auto_240707 ?auto_240708 ?auto_240710 ?auto_240709 ?auto_240711 ?auto_240712 ?auto_240713 ?auto_240714 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_240811 - DIRECTION
      ?auto_240812 - MODE
      ?auto_240814 - DIRECTION
      ?auto_240813 - MODE
      ?auto_240815 - DIRECTION
      ?auto_240816 - MODE
      ?auto_240817 - DIRECTION
      ?auto_240818 - MODE
    )
    :vars
    (
      ?auto_240820 - INSTRUMENT
      ?auto_240819 - SATELLITE
      ?auto_240825 - DIRECTION
      ?auto_240821 - INSTRUMENT
      ?auto_240822 - INSTRUMENT
      ?auto_240823 - INSTRUMENT
      ?auto_240824 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_240820 ?auto_240819 ) ( SUPPORTS ?auto_240820 ?auto_240812 ) ( not ( = ?auto_240811 ?auto_240825 ) ) ( CALIBRATION_TARGET ?auto_240820 ?auto_240825 ) ( not ( = ?auto_240825 ?auto_240815 ) ) ( ON_BOARD ?auto_240821 ?auto_240819 ) ( not ( = ?auto_240811 ?auto_240815 ) ) ( not ( = ?auto_240820 ?auto_240821 ) ) ( SUPPORTS ?auto_240821 ?auto_240816 ) ( CALIBRATION_TARGET ?auto_240821 ?auto_240825 ) ( not ( = ?auto_240825 ?auto_240814 ) ) ( ON_BOARD ?auto_240822 ?auto_240819 ) ( not ( = ?auto_240815 ?auto_240814 ) ) ( not ( = ?auto_240821 ?auto_240822 ) ) ( SUPPORTS ?auto_240822 ?auto_240813 ) ( CALIBRATION_TARGET ?auto_240822 ?auto_240825 ) ( not ( = ?auto_240825 ?auto_240817 ) ) ( ON_BOARD ?auto_240823 ?auto_240819 ) ( not ( = ?auto_240814 ?auto_240817 ) ) ( not ( = ?auto_240822 ?auto_240823 ) ) ( SUPPORTS ?auto_240823 ?auto_240818 ) ( CALIBRATION_TARGET ?auto_240823 ?auto_240825 ) ( POWER_AVAIL ?auto_240819 ) ( POINTING ?auto_240819 ?auto_240824 ) ( not ( = ?auto_240825 ?auto_240824 ) ) ( not ( = ?auto_240817 ?auto_240824 ) ) ( not ( = ?auto_240818 ?auto_240813 ) ) ( not ( = ?auto_240814 ?auto_240824 ) ) ( not ( = ?auto_240817 ?auto_240815 ) ) ( not ( = ?auto_240818 ?auto_240816 ) ) ( not ( = ?auto_240813 ?auto_240816 ) ) ( not ( = ?auto_240815 ?auto_240824 ) ) ( not ( = ?auto_240821 ?auto_240823 ) ) ( not ( = ?auto_240817 ?auto_240811 ) ) ( not ( = ?auto_240818 ?auto_240812 ) ) ( not ( = ?auto_240814 ?auto_240811 ) ) ( not ( = ?auto_240813 ?auto_240812 ) ) ( not ( = ?auto_240816 ?auto_240812 ) ) ( not ( = ?auto_240811 ?auto_240824 ) ) ( not ( = ?auto_240820 ?auto_240822 ) ) ( not ( = ?auto_240820 ?auto_240823 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_240817 ?auto_240818 ?auto_240814 ?auto_240813 ?auto_240811 ?auto_240812 ?auto_240815 ?auto_240816 )
      ( GET-4IMAGE-VERIFY ?auto_240811 ?auto_240812 ?auto_240814 ?auto_240813 ?auto_240815 ?auto_240816 ?auto_240817 ?auto_240818 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_240966 - DIRECTION
      ?auto_240967 - MODE
      ?auto_240969 - DIRECTION
      ?auto_240968 - MODE
      ?auto_240970 - DIRECTION
      ?auto_240971 - MODE
      ?auto_240972 - DIRECTION
      ?auto_240973 - MODE
    )
    :vars
    (
      ?auto_240975 - INSTRUMENT
      ?auto_240974 - SATELLITE
      ?auto_240980 - DIRECTION
      ?auto_240976 - INSTRUMENT
      ?auto_240977 - INSTRUMENT
      ?auto_240978 - INSTRUMENT
      ?auto_240979 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_240975 ?auto_240974 ) ( SUPPORTS ?auto_240975 ?auto_240967 ) ( not ( = ?auto_240966 ?auto_240980 ) ) ( CALIBRATION_TARGET ?auto_240975 ?auto_240980 ) ( not ( = ?auto_240980 ?auto_240969 ) ) ( ON_BOARD ?auto_240976 ?auto_240974 ) ( not ( = ?auto_240966 ?auto_240969 ) ) ( not ( = ?auto_240975 ?auto_240976 ) ) ( SUPPORTS ?auto_240976 ?auto_240968 ) ( CALIBRATION_TARGET ?auto_240976 ?auto_240980 ) ( not ( = ?auto_240980 ?auto_240972 ) ) ( ON_BOARD ?auto_240977 ?auto_240974 ) ( not ( = ?auto_240969 ?auto_240972 ) ) ( not ( = ?auto_240976 ?auto_240977 ) ) ( SUPPORTS ?auto_240977 ?auto_240973 ) ( CALIBRATION_TARGET ?auto_240977 ?auto_240980 ) ( not ( = ?auto_240980 ?auto_240970 ) ) ( ON_BOARD ?auto_240978 ?auto_240974 ) ( not ( = ?auto_240972 ?auto_240970 ) ) ( not ( = ?auto_240977 ?auto_240978 ) ) ( SUPPORTS ?auto_240978 ?auto_240971 ) ( CALIBRATION_TARGET ?auto_240978 ?auto_240980 ) ( POWER_AVAIL ?auto_240974 ) ( POINTING ?auto_240974 ?auto_240979 ) ( not ( = ?auto_240980 ?auto_240979 ) ) ( not ( = ?auto_240970 ?auto_240979 ) ) ( not ( = ?auto_240971 ?auto_240973 ) ) ( not ( = ?auto_240972 ?auto_240979 ) ) ( not ( = ?auto_240970 ?auto_240969 ) ) ( not ( = ?auto_240971 ?auto_240968 ) ) ( not ( = ?auto_240973 ?auto_240968 ) ) ( not ( = ?auto_240969 ?auto_240979 ) ) ( not ( = ?auto_240976 ?auto_240978 ) ) ( not ( = ?auto_240970 ?auto_240966 ) ) ( not ( = ?auto_240971 ?auto_240967 ) ) ( not ( = ?auto_240972 ?auto_240966 ) ) ( not ( = ?auto_240973 ?auto_240967 ) ) ( not ( = ?auto_240968 ?auto_240967 ) ) ( not ( = ?auto_240966 ?auto_240979 ) ) ( not ( = ?auto_240975 ?auto_240977 ) ) ( not ( = ?auto_240975 ?auto_240978 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_240970 ?auto_240971 ?auto_240972 ?auto_240973 ?auto_240966 ?auto_240967 ?auto_240969 ?auto_240968 )
      ( GET-4IMAGE-VERIFY ?auto_240966 ?auto_240967 ?auto_240969 ?auto_240968 ?auto_240970 ?auto_240971 ?auto_240972 ?auto_240973 ) )
  )

  ( :method GET-4IMAGE
    :parameters
    (
      ?auto_241015 - DIRECTION
      ?auto_241016 - MODE
      ?auto_241018 - DIRECTION
      ?auto_241017 - MODE
      ?auto_241019 - DIRECTION
      ?auto_241020 - MODE
      ?auto_241021 - DIRECTION
      ?auto_241022 - MODE
    )
    :vars
    (
      ?auto_241024 - INSTRUMENT
      ?auto_241023 - SATELLITE
      ?auto_241029 - DIRECTION
      ?auto_241025 - INSTRUMENT
      ?auto_241026 - INSTRUMENT
      ?auto_241027 - INSTRUMENT
      ?auto_241028 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_241024 ?auto_241023 ) ( SUPPORTS ?auto_241024 ?auto_241016 ) ( not ( = ?auto_241015 ?auto_241029 ) ) ( CALIBRATION_TARGET ?auto_241024 ?auto_241029 ) ( not ( = ?auto_241029 ?auto_241018 ) ) ( ON_BOARD ?auto_241025 ?auto_241023 ) ( not ( = ?auto_241015 ?auto_241018 ) ) ( not ( = ?auto_241024 ?auto_241025 ) ) ( SUPPORTS ?auto_241025 ?auto_241017 ) ( CALIBRATION_TARGET ?auto_241025 ?auto_241029 ) ( not ( = ?auto_241029 ?auto_241019 ) ) ( ON_BOARD ?auto_241026 ?auto_241023 ) ( not ( = ?auto_241018 ?auto_241019 ) ) ( not ( = ?auto_241025 ?auto_241026 ) ) ( SUPPORTS ?auto_241026 ?auto_241020 ) ( CALIBRATION_TARGET ?auto_241026 ?auto_241029 ) ( not ( = ?auto_241029 ?auto_241021 ) ) ( ON_BOARD ?auto_241027 ?auto_241023 ) ( not ( = ?auto_241019 ?auto_241021 ) ) ( not ( = ?auto_241026 ?auto_241027 ) ) ( SUPPORTS ?auto_241027 ?auto_241022 ) ( CALIBRATION_TARGET ?auto_241027 ?auto_241029 ) ( POWER_AVAIL ?auto_241023 ) ( POINTING ?auto_241023 ?auto_241028 ) ( not ( = ?auto_241029 ?auto_241028 ) ) ( not ( = ?auto_241021 ?auto_241028 ) ) ( not ( = ?auto_241022 ?auto_241020 ) ) ( not ( = ?auto_241019 ?auto_241028 ) ) ( not ( = ?auto_241021 ?auto_241018 ) ) ( not ( = ?auto_241022 ?auto_241017 ) ) ( not ( = ?auto_241020 ?auto_241017 ) ) ( not ( = ?auto_241018 ?auto_241028 ) ) ( not ( = ?auto_241025 ?auto_241027 ) ) ( not ( = ?auto_241021 ?auto_241015 ) ) ( not ( = ?auto_241022 ?auto_241016 ) ) ( not ( = ?auto_241019 ?auto_241015 ) ) ( not ( = ?auto_241020 ?auto_241016 ) ) ( not ( = ?auto_241017 ?auto_241016 ) ) ( not ( = ?auto_241015 ?auto_241028 ) ) ( not ( = ?auto_241024 ?auto_241026 ) ) ( not ( = ?auto_241024 ?auto_241027 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_241021 ?auto_241022 ?auto_241019 ?auto_241020 ?auto_241015 ?auto_241016 ?auto_241018 ?auto_241017 )
      ( GET-4IMAGE-VERIFY ?auto_241015 ?auto_241016 ?auto_241018 ?auto_241017 ?auto_241019 ?auto_241020 ?auto_241021 ?auto_241022 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_241521 - DIRECTION
      ?auto_241522 - MODE
    )
    :vars
    (
      ?auto_241523 - INSTRUMENT
      ?auto_241524 - SATELLITE
      ?auto_241525 - DIRECTION
      ?auto_241526 - DIRECTION
      ?auto_241527 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_241523 ?auto_241524 ) ( SUPPORTS ?auto_241523 ?auto_241522 ) ( not ( = ?auto_241521 ?auto_241525 ) ) ( CALIBRATION_TARGET ?auto_241523 ?auto_241525 ) ( POINTING ?auto_241524 ?auto_241526 ) ( not ( = ?auto_241525 ?auto_241526 ) ) ( ON_BOARD ?auto_241527 ?auto_241524 ) ( POWER_ON ?auto_241527 ) ( not ( = ?auto_241521 ?auto_241526 ) ) ( not ( = ?auto_241523 ?auto_241527 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_241527 ?auto_241524 )
      ( !TURN_TO ?auto_241524 ?auto_241525 ?auto_241526 )
      ( !SWITCH_ON ?auto_241523 ?auto_241524 )
      ( !CALIBRATE ?auto_241524 ?auto_241523 ?auto_241525 )
      ( !TURN_TO ?auto_241524 ?auto_241521 ?auto_241525 )
      ( !TAKE_IMAGE ?auto_241524 ?auto_241521 ?auto_241523 ?auto_241522 )
      ( GET-1IMAGE-VERIFY ?auto_241521 ?auto_241522 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_264298 - DIRECTION
      ?auto_264299 - MODE
      ?auto_264301 - DIRECTION
      ?auto_264300 - MODE
      ?auto_264302 - DIRECTION
      ?auto_264303 - MODE
      ?auto_264304 - DIRECTION
      ?auto_264305 - MODE
      ?auto_264306 - DIRECTION
      ?auto_264307 - MODE
    )
    :vars
    (
      ?auto_264310 - INSTRUMENT
      ?auto_264311 - SATELLITE
      ?auto_264308 - DIRECTION
      ?auto_264309 - INSTRUMENT
      ?auto_264312 - INSTRUMENT
      ?auto_264313 - INSTRUMENT
      ?auto_264314 - INSTRUMENT
      ?auto_264315 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_264310 ?auto_264311 ) ( SUPPORTS ?auto_264310 ?auto_264307 ) ( not ( = ?auto_264306 ?auto_264308 ) ) ( CALIBRATION_TARGET ?auto_264310 ?auto_264308 ) ( not ( = ?auto_264308 ?auto_264304 ) ) ( ON_BOARD ?auto_264309 ?auto_264311 ) ( not ( = ?auto_264306 ?auto_264304 ) ) ( not ( = ?auto_264310 ?auto_264309 ) ) ( SUPPORTS ?auto_264309 ?auto_264305 ) ( CALIBRATION_TARGET ?auto_264309 ?auto_264308 ) ( not ( = ?auto_264308 ?auto_264302 ) ) ( ON_BOARD ?auto_264312 ?auto_264311 ) ( not ( = ?auto_264304 ?auto_264302 ) ) ( not ( = ?auto_264309 ?auto_264312 ) ) ( SUPPORTS ?auto_264312 ?auto_264303 ) ( CALIBRATION_TARGET ?auto_264312 ?auto_264308 ) ( not ( = ?auto_264308 ?auto_264301 ) ) ( ON_BOARD ?auto_264313 ?auto_264311 ) ( not ( = ?auto_264302 ?auto_264301 ) ) ( not ( = ?auto_264312 ?auto_264313 ) ) ( SUPPORTS ?auto_264313 ?auto_264300 ) ( CALIBRATION_TARGET ?auto_264313 ?auto_264308 ) ( not ( = ?auto_264308 ?auto_264298 ) ) ( ON_BOARD ?auto_264314 ?auto_264311 ) ( not ( = ?auto_264301 ?auto_264298 ) ) ( not ( = ?auto_264313 ?auto_264314 ) ) ( SUPPORTS ?auto_264314 ?auto_264299 ) ( CALIBRATION_TARGET ?auto_264314 ?auto_264308 ) ( POWER_AVAIL ?auto_264311 ) ( POINTING ?auto_264311 ?auto_264315 ) ( not ( = ?auto_264308 ?auto_264315 ) ) ( not ( = ?auto_264298 ?auto_264315 ) ) ( not ( = ?auto_264299 ?auto_264300 ) ) ( not ( = ?auto_264301 ?auto_264315 ) ) ( not ( = ?auto_264298 ?auto_264302 ) ) ( not ( = ?auto_264299 ?auto_264303 ) ) ( not ( = ?auto_264300 ?auto_264303 ) ) ( not ( = ?auto_264302 ?auto_264315 ) ) ( not ( = ?auto_264312 ?auto_264314 ) ) ( not ( = ?auto_264298 ?auto_264304 ) ) ( not ( = ?auto_264299 ?auto_264305 ) ) ( not ( = ?auto_264301 ?auto_264304 ) ) ( not ( = ?auto_264300 ?auto_264305 ) ) ( not ( = ?auto_264303 ?auto_264305 ) ) ( not ( = ?auto_264304 ?auto_264315 ) ) ( not ( = ?auto_264309 ?auto_264313 ) ) ( not ( = ?auto_264309 ?auto_264314 ) ) ( not ( = ?auto_264298 ?auto_264306 ) ) ( not ( = ?auto_264299 ?auto_264307 ) ) ( not ( = ?auto_264301 ?auto_264306 ) ) ( not ( = ?auto_264300 ?auto_264307 ) ) ( not ( = ?auto_264302 ?auto_264306 ) ) ( not ( = ?auto_264303 ?auto_264307 ) ) ( not ( = ?auto_264305 ?auto_264307 ) ) ( not ( = ?auto_264306 ?auto_264315 ) ) ( not ( = ?auto_264310 ?auto_264312 ) ) ( not ( = ?auto_264310 ?auto_264313 ) ) ( not ( = ?auto_264310 ?auto_264314 ) ) )
    :subtasks
    ( ( GET-4IMAGE ?auto_264298 ?auto_264299 ?auto_264301 ?auto_264300 ?auto_264304 ?auto_264305 ?auto_264302 ?auto_264303 )
      ( GET-1IMAGE ?auto_264306 ?auto_264307 )
      ( GET-5IMAGE-VERIFY ?auto_264298 ?auto_264299 ?auto_264301 ?auto_264300 ?auto_264302 ?auto_264303 ?auto_264304 ?auto_264305 ?auto_264306 ?auto_264307 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_264376 - DIRECTION
      ?auto_264377 - MODE
      ?auto_264379 - DIRECTION
      ?auto_264378 - MODE
      ?auto_264380 - DIRECTION
      ?auto_264381 - MODE
      ?auto_264382 - DIRECTION
      ?auto_264383 - MODE
      ?auto_264384 - DIRECTION
      ?auto_264385 - MODE
    )
    :vars
    (
      ?auto_264392 - INSTRUMENT
      ?auto_264391 - SATELLITE
      ?auto_264393 - DIRECTION
      ?auto_264387 - INSTRUMENT
      ?auto_264390 - INSTRUMENT
      ?auto_264386 - INSTRUMENT
      ?auto_264388 - INSTRUMENT
      ?auto_264389 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_264392 ?auto_264391 ) ( SUPPORTS ?auto_264392 ?auto_264383 ) ( not ( = ?auto_264382 ?auto_264393 ) ) ( CALIBRATION_TARGET ?auto_264392 ?auto_264393 ) ( not ( = ?auto_264393 ?auto_264384 ) ) ( ON_BOARD ?auto_264387 ?auto_264391 ) ( not ( = ?auto_264382 ?auto_264384 ) ) ( not ( = ?auto_264392 ?auto_264387 ) ) ( SUPPORTS ?auto_264387 ?auto_264385 ) ( CALIBRATION_TARGET ?auto_264387 ?auto_264393 ) ( not ( = ?auto_264393 ?auto_264380 ) ) ( ON_BOARD ?auto_264390 ?auto_264391 ) ( not ( = ?auto_264384 ?auto_264380 ) ) ( not ( = ?auto_264387 ?auto_264390 ) ) ( SUPPORTS ?auto_264390 ?auto_264381 ) ( CALIBRATION_TARGET ?auto_264390 ?auto_264393 ) ( not ( = ?auto_264393 ?auto_264379 ) ) ( ON_BOARD ?auto_264386 ?auto_264391 ) ( not ( = ?auto_264380 ?auto_264379 ) ) ( not ( = ?auto_264390 ?auto_264386 ) ) ( SUPPORTS ?auto_264386 ?auto_264378 ) ( CALIBRATION_TARGET ?auto_264386 ?auto_264393 ) ( not ( = ?auto_264393 ?auto_264376 ) ) ( ON_BOARD ?auto_264388 ?auto_264391 ) ( not ( = ?auto_264379 ?auto_264376 ) ) ( not ( = ?auto_264386 ?auto_264388 ) ) ( SUPPORTS ?auto_264388 ?auto_264377 ) ( CALIBRATION_TARGET ?auto_264388 ?auto_264393 ) ( POWER_AVAIL ?auto_264391 ) ( POINTING ?auto_264391 ?auto_264389 ) ( not ( = ?auto_264393 ?auto_264389 ) ) ( not ( = ?auto_264376 ?auto_264389 ) ) ( not ( = ?auto_264377 ?auto_264378 ) ) ( not ( = ?auto_264379 ?auto_264389 ) ) ( not ( = ?auto_264376 ?auto_264380 ) ) ( not ( = ?auto_264377 ?auto_264381 ) ) ( not ( = ?auto_264378 ?auto_264381 ) ) ( not ( = ?auto_264380 ?auto_264389 ) ) ( not ( = ?auto_264390 ?auto_264388 ) ) ( not ( = ?auto_264376 ?auto_264384 ) ) ( not ( = ?auto_264377 ?auto_264385 ) ) ( not ( = ?auto_264379 ?auto_264384 ) ) ( not ( = ?auto_264378 ?auto_264385 ) ) ( not ( = ?auto_264381 ?auto_264385 ) ) ( not ( = ?auto_264384 ?auto_264389 ) ) ( not ( = ?auto_264387 ?auto_264386 ) ) ( not ( = ?auto_264387 ?auto_264388 ) ) ( not ( = ?auto_264376 ?auto_264382 ) ) ( not ( = ?auto_264377 ?auto_264383 ) ) ( not ( = ?auto_264379 ?auto_264382 ) ) ( not ( = ?auto_264378 ?auto_264383 ) ) ( not ( = ?auto_264380 ?auto_264382 ) ) ( not ( = ?auto_264381 ?auto_264383 ) ) ( not ( = ?auto_264385 ?auto_264383 ) ) ( not ( = ?auto_264382 ?auto_264389 ) ) ( not ( = ?auto_264392 ?auto_264390 ) ) ( not ( = ?auto_264392 ?auto_264386 ) ) ( not ( = ?auto_264392 ?auto_264388 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_264376 ?auto_264377 ?auto_264379 ?auto_264378 ?auto_264380 ?auto_264381 ?auto_264384 ?auto_264385 ?auto_264382 ?auto_264383 )
      ( GET-5IMAGE-VERIFY ?auto_264376 ?auto_264377 ?auto_264379 ?auto_264378 ?auto_264380 ?auto_264381 ?auto_264382 ?auto_264383 ?auto_264384 ?auto_264385 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_264454 - DIRECTION
      ?auto_264455 - MODE
      ?auto_264457 - DIRECTION
      ?auto_264456 - MODE
      ?auto_264458 - DIRECTION
      ?auto_264459 - MODE
      ?auto_264460 - DIRECTION
      ?auto_264461 - MODE
      ?auto_264462 - DIRECTION
      ?auto_264463 - MODE
    )
    :vars
    (
      ?auto_264469 - INSTRUMENT
      ?auto_264471 - SATELLITE
      ?auto_264466 - DIRECTION
      ?auto_264470 - INSTRUMENT
      ?auto_264464 - INSTRUMENT
      ?auto_264468 - INSTRUMENT
      ?auto_264467 - INSTRUMENT
      ?auto_264465 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_264469 ?auto_264471 ) ( SUPPORTS ?auto_264469 ?auto_264463 ) ( not ( = ?auto_264462 ?auto_264466 ) ) ( CALIBRATION_TARGET ?auto_264469 ?auto_264466 ) ( not ( = ?auto_264466 ?auto_264458 ) ) ( ON_BOARD ?auto_264470 ?auto_264471 ) ( not ( = ?auto_264462 ?auto_264458 ) ) ( not ( = ?auto_264469 ?auto_264470 ) ) ( SUPPORTS ?auto_264470 ?auto_264459 ) ( CALIBRATION_TARGET ?auto_264470 ?auto_264466 ) ( not ( = ?auto_264466 ?auto_264460 ) ) ( ON_BOARD ?auto_264464 ?auto_264471 ) ( not ( = ?auto_264458 ?auto_264460 ) ) ( not ( = ?auto_264470 ?auto_264464 ) ) ( SUPPORTS ?auto_264464 ?auto_264461 ) ( CALIBRATION_TARGET ?auto_264464 ?auto_264466 ) ( not ( = ?auto_264466 ?auto_264457 ) ) ( ON_BOARD ?auto_264468 ?auto_264471 ) ( not ( = ?auto_264460 ?auto_264457 ) ) ( not ( = ?auto_264464 ?auto_264468 ) ) ( SUPPORTS ?auto_264468 ?auto_264456 ) ( CALIBRATION_TARGET ?auto_264468 ?auto_264466 ) ( not ( = ?auto_264466 ?auto_264454 ) ) ( ON_BOARD ?auto_264467 ?auto_264471 ) ( not ( = ?auto_264457 ?auto_264454 ) ) ( not ( = ?auto_264468 ?auto_264467 ) ) ( SUPPORTS ?auto_264467 ?auto_264455 ) ( CALIBRATION_TARGET ?auto_264467 ?auto_264466 ) ( POWER_AVAIL ?auto_264471 ) ( POINTING ?auto_264471 ?auto_264465 ) ( not ( = ?auto_264466 ?auto_264465 ) ) ( not ( = ?auto_264454 ?auto_264465 ) ) ( not ( = ?auto_264455 ?auto_264456 ) ) ( not ( = ?auto_264457 ?auto_264465 ) ) ( not ( = ?auto_264454 ?auto_264460 ) ) ( not ( = ?auto_264455 ?auto_264461 ) ) ( not ( = ?auto_264456 ?auto_264461 ) ) ( not ( = ?auto_264460 ?auto_264465 ) ) ( not ( = ?auto_264464 ?auto_264467 ) ) ( not ( = ?auto_264454 ?auto_264458 ) ) ( not ( = ?auto_264455 ?auto_264459 ) ) ( not ( = ?auto_264457 ?auto_264458 ) ) ( not ( = ?auto_264456 ?auto_264459 ) ) ( not ( = ?auto_264461 ?auto_264459 ) ) ( not ( = ?auto_264458 ?auto_264465 ) ) ( not ( = ?auto_264470 ?auto_264468 ) ) ( not ( = ?auto_264470 ?auto_264467 ) ) ( not ( = ?auto_264454 ?auto_264462 ) ) ( not ( = ?auto_264455 ?auto_264463 ) ) ( not ( = ?auto_264457 ?auto_264462 ) ) ( not ( = ?auto_264456 ?auto_264463 ) ) ( not ( = ?auto_264460 ?auto_264462 ) ) ( not ( = ?auto_264461 ?auto_264463 ) ) ( not ( = ?auto_264459 ?auto_264463 ) ) ( not ( = ?auto_264462 ?auto_264465 ) ) ( not ( = ?auto_264469 ?auto_264464 ) ) ( not ( = ?auto_264469 ?auto_264468 ) ) ( not ( = ?auto_264469 ?auto_264467 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_264454 ?auto_264455 ?auto_264457 ?auto_264456 ?auto_264460 ?auto_264461 ?auto_264462 ?auto_264463 ?auto_264458 ?auto_264459 )
      ( GET-5IMAGE-VERIFY ?auto_264454 ?auto_264455 ?auto_264457 ?auto_264456 ?auto_264458 ?auto_264459 ?auto_264460 ?auto_264461 ?auto_264462 ?auto_264463 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_264532 - DIRECTION
      ?auto_264533 - MODE
      ?auto_264535 - DIRECTION
      ?auto_264534 - MODE
      ?auto_264536 - DIRECTION
      ?auto_264537 - MODE
      ?auto_264538 - DIRECTION
      ?auto_264539 - MODE
      ?auto_264540 - DIRECTION
      ?auto_264541 - MODE
    )
    :vars
    (
      ?auto_264547 - INSTRUMENT
      ?auto_264549 - SATELLITE
      ?auto_264544 - DIRECTION
      ?auto_264548 - INSTRUMENT
      ?auto_264542 - INSTRUMENT
      ?auto_264546 - INSTRUMENT
      ?auto_264545 - INSTRUMENT
      ?auto_264543 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_264547 ?auto_264549 ) ( SUPPORTS ?auto_264547 ?auto_264539 ) ( not ( = ?auto_264538 ?auto_264544 ) ) ( CALIBRATION_TARGET ?auto_264547 ?auto_264544 ) ( not ( = ?auto_264544 ?auto_264536 ) ) ( ON_BOARD ?auto_264548 ?auto_264549 ) ( not ( = ?auto_264538 ?auto_264536 ) ) ( not ( = ?auto_264547 ?auto_264548 ) ) ( SUPPORTS ?auto_264548 ?auto_264537 ) ( CALIBRATION_TARGET ?auto_264548 ?auto_264544 ) ( not ( = ?auto_264544 ?auto_264540 ) ) ( ON_BOARD ?auto_264542 ?auto_264549 ) ( not ( = ?auto_264536 ?auto_264540 ) ) ( not ( = ?auto_264548 ?auto_264542 ) ) ( SUPPORTS ?auto_264542 ?auto_264541 ) ( CALIBRATION_TARGET ?auto_264542 ?auto_264544 ) ( not ( = ?auto_264544 ?auto_264535 ) ) ( ON_BOARD ?auto_264546 ?auto_264549 ) ( not ( = ?auto_264540 ?auto_264535 ) ) ( not ( = ?auto_264542 ?auto_264546 ) ) ( SUPPORTS ?auto_264546 ?auto_264534 ) ( CALIBRATION_TARGET ?auto_264546 ?auto_264544 ) ( not ( = ?auto_264544 ?auto_264532 ) ) ( ON_BOARD ?auto_264545 ?auto_264549 ) ( not ( = ?auto_264535 ?auto_264532 ) ) ( not ( = ?auto_264546 ?auto_264545 ) ) ( SUPPORTS ?auto_264545 ?auto_264533 ) ( CALIBRATION_TARGET ?auto_264545 ?auto_264544 ) ( POWER_AVAIL ?auto_264549 ) ( POINTING ?auto_264549 ?auto_264543 ) ( not ( = ?auto_264544 ?auto_264543 ) ) ( not ( = ?auto_264532 ?auto_264543 ) ) ( not ( = ?auto_264533 ?auto_264534 ) ) ( not ( = ?auto_264535 ?auto_264543 ) ) ( not ( = ?auto_264532 ?auto_264540 ) ) ( not ( = ?auto_264533 ?auto_264541 ) ) ( not ( = ?auto_264534 ?auto_264541 ) ) ( not ( = ?auto_264540 ?auto_264543 ) ) ( not ( = ?auto_264542 ?auto_264545 ) ) ( not ( = ?auto_264532 ?auto_264536 ) ) ( not ( = ?auto_264533 ?auto_264537 ) ) ( not ( = ?auto_264535 ?auto_264536 ) ) ( not ( = ?auto_264534 ?auto_264537 ) ) ( not ( = ?auto_264541 ?auto_264537 ) ) ( not ( = ?auto_264536 ?auto_264543 ) ) ( not ( = ?auto_264548 ?auto_264546 ) ) ( not ( = ?auto_264548 ?auto_264545 ) ) ( not ( = ?auto_264532 ?auto_264538 ) ) ( not ( = ?auto_264533 ?auto_264539 ) ) ( not ( = ?auto_264535 ?auto_264538 ) ) ( not ( = ?auto_264534 ?auto_264539 ) ) ( not ( = ?auto_264540 ?auto_264538 ) ) ( not ( = ?auto_264541 ?auto_264539 ) ) ( not ( = ?auto_264537 ?auto_264539 ) ) ( not ( = ?auto_264538 ?auto_264543 ) ) ( not ( = ?auto_264547 ?auto_264542 ) ) ( not ( = ?auto_264547 ?auto_264546 ) ) ( not ( = ?auto_264547 ?auto_264545 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_264532 ?auto_264533 ?auto_264535 ?auto_264534 ?auto_264540 ?auto_264541 ?auto_264538 ?auto_264539 ?auto_264536 ?auto_264537 )
      ( GET-5IMAGE-VERIFY ?auto_264532 ?auto_264533 ?auto_264535 ?auto_264534 ?auto_264536 ?auto_264537 ?auto_264538 ?auto_264539 ?auto_264540 ?auto_264541 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_264862 - DIRECTION
      ?auto_264863 - MODE
      ?auto_264865 - DIRECTION
      ?auto_264864 - MODE
      ?auto_264866 - DIRECTION
      ?auto_264867 - MODE
      ?auto_264868 - DIRECTION
      ?auto_264869 - MODE
      ?auto_264870 - DIRECTION
      ?auto_264871 - MODE
    )
    :vars
    (
      ?auto_264877 - INSTRUMENT
      ?auto_264879 - SATELLITE
      ?auto_264874 - DIRECTION
      ?auto_264878 - INSTRUMENT
      ?auto_264872 - INSTRUMENT
      ?auto_264876 - INSTRUMENT
      ?auto_264875 - INSTRUMENT
      ?auto_264873 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_264877 ?auto_264879 ) ( SUPPORTS ?auto_264877 ?auto_264867 ) ( not ( = ?auto_264866 ?auto_264874 ) ) ( CALIBRATION_TARGET ?auto_264877 ?auto_264874 ) ( not ( = ?auto_264874 ?auto_264870 ) ) ( ON_BOARD ?auto_264878 ?auto_264879 ) ( not ( = ?auto_264866 ?auto_264870 ) ) ( not ( = ?auto_264877 ?auto_264878 ) ) ( SUPPORTS ?auto_264878 ?auto_264871 ) ( CALIBRATION_TARGET ?auto_264878 ?auto_264874 ) ( not ( = ?auto_264874 ?auto_264868 ) ) ( ON_BOARD ?auto_264872 ?auto_264879 ) ( not ( = ?auto_264870 ?auto_264868 ) ) ( not ( = ?auto_264878 ?auto_264872 ) ) ( SUPPORTS ?auto_264872 ?auto_264869 ) ( CALIBRATION_TARGET ?auto_264872 ?auto_264874 ) ( not ( = ?auto_264874 ?auto_264865 ) ) ( ON_BOARD ?auto_264876 ?auto_264879 ) ( not ( = ?auto_264868 ?auto_264865 ) ) ( not ( = ?auto_264872 ?auto_264876 ) ) ( SUPPORTS ?auto_264876 ?auto_264864 ) ( CALIBRATION_TARGET ?auto_264876 ?auto_264874 ) ( not ( = ?auto_264874 ?auto_264862 ) ) ( ON_BOARD ?auto_264875 ?auto_264879 ) ( not ( = ?auto_264865 ?auto_264862 ) ) ( not ( = ?auto_264876 ?auto_264875 ) ) ( SUPPORTS ?auto_264875 ?auto_264863 ) ( CALIBRATION_TARGET ?auto_264875 ?auto_264874 ) ( POWER_AVAIL ?auto_264879 ) ( POINTING ?auto_264879 ?auto_264873 ) ( not ( = ?auto_264874 ?auto_264873 ) ) ( not ( = ?auto_264862 ?auto_264873 ) ) ( not ( = ?auto_264863 ?auto_264864 ) ) ( not ( = ?auto_264865 ?auto_264873 ) ) ( not ( = ?auto_264862 ?auto_264868 ) ) ( not ( = ?auto_264863 ?auto_264869 ) ) ( not ( = ?auto_264864 ?auto_264869 ) ) ( not ( = ?auto_264868 ?auto_264873 ) ) ( not ( = ?auto_264872 ?auto_264875 ) ) ( not ( = ?auto_264862 ?auto_264870 ) ) ( not ( = ?auto_264863 ?auto_264871 ) ) ( not ( = ?auto_264865 ?auto_264870 ) ) ( not ( = ?auto_264864 ?auto_264871 ) ) ( not ( = ?auto_264869 ?auto_264871 ) ) ( not ( = ?auto_264870 ?auto_264873 ) ) ( not ( = ?auto_264878 ?auto_264876 ) ) ( not ( = ?auto_264878 ?auto_264875 ) ) ( not ( = ?auto_264862 ?auto_264866 ) ) ( not ( = ?auto_264863 ?auto_264867 ) ) ( not ( = ?auto_264865 ?auto_264866 ) ) ( not ( = ?auto_264864 ?auto_264867 ) ) ( not ( = ?auto_264868 ?auto_264866 ) ) ( not ( = ?auto_264869 ?auto_264867 ) ) ( not ( = ?auto_264871 ?auto_264867 ) ) ( not ( = ?auto_264866 ?auto_264873 ) ) ( not ( = ?auto_264877 ?auto_264872 ) ) ( not ( = ?auto_264877 ?auto_264876 ) ) ( not ( = ?auto_264877 ?auto_264875 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_264862 ?auto_264863 ?auto_264865 ?auto_264864 ?auto_264868 ?auto_264869 ?auto_264866 ?auto_264867 ?auto_264870 ?auto_264871 )
      ( GET-5IMAGE-VERIFY ?auto_264862 ?auto_264863 ?auto_264865 ?auto_264864 ?auto_264866 ?auto_264867 ?auto_264868 ?auto_264869 ?auto_264870 ?auto_264871 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_264940 - DIRECTION
      ?auto_264941 - MODE
      ?auto_264943 - DIRECTION
      ?auto_264942 - MODE
      ?auto_264944 - DIRECTION
      ?auto_264945 - MODE
      ?auto_264946 - DIRECTION
      ?auto_264947 - MODE
      ?auto_264948 - DIRECTION
      ?auto_264949 - MODE
    )
    :vars
    (
      ?auto_264955 - INSTRUMENT
      ?auto_264957 - SATELLITE
      ?auto_264952 - DIRECTION
      ?auto_264956 - INSTRUMENT
      ?auto_264950 - INSTRUMENT
      ?auto_264954 - INSTRUMENT
      ?auto_264953 - INSTRUMENT
      ?auto_264951 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_264955 ?auto_264957 ) ( SUPPORTS ?auto_264955 ?auto_264945 ) ( not ( = ?auto_264944 ?auto_264952 ) ) ( CALIBRATION_TARGET ?auto_264955 ?auto_264952 ) ( not ( = ?auto_264952 ?auto_264946 ) ) ( ON_BOARD ?auto_264956 ?auto_264957 ) ( not ( = ?auto_264944 ?auto_264946 ) ) ( not ( = ?auto_264955 ?auto_264956 ) ) ( SUPPORTS ?auto_264956 ?auto_264947 ) ( CALIBRATION_TARGET ?auto_264956 ?auto_264952 ) ( not ( = ?auto_264952 ?auto_264948 ) ) ( ON_BOARD ?auto_264950 ?auto_264957 ) ( not ( = ?auto_264946 ?auto_264948 ) ) ( not ( = ?auto_264956 ?auto_264950 ) ) ( SUPPORTS ?auto_264950 ?auto_264949 ) ( CALIBRATION_TARGET ?auto_264950 ?auto_264952 ) ( not ( = ?auto_264952 ?auto_264943 ) ) ( ON_BOARD ?auto_264954 ?auto_264957 ) ( not ( = ?auto_264948 ?auto_264943 ) ) ( not ( = ?auto_264950 ?auto_264954 ) ) ( SUPPORTS ?auto_264954 ?auto_264942 ) ( CALIBRATION_TARGET ?auto_264954 ?auto_264952 ) ( not ( = ?auto_264952 ?auto_264940 ) ) ( ON_BOARD ?auto_264953 ?auto_264957 ) ( not ( = ?auto_264943 ?auto_264940 ) ) ( not ( = ?auto_264954 ?auto_264953 ) ) ( SUPPORTS ?auto_264953 ?auto_264941 ) ( CALIBRATION_TARGET ?auto_264953 ?auto_264952 ) ( POWER_AVAIL ?auto_264957 ) ( POINTING ?auto_264957 ?auto_264951 ) ( not ( = ?auto_264952 ?auto_264951 ) ) ( not ( = ?auto_264940 ?auto_264951 ) ) ( not ( = ?auto_264941 ?auto_264942 ) ) ( not ( = ?auto_264943 ?auto_264951 ) ) ( not ( = ?auto_264940 ?auto_264948 ) ) ( not ( = ?auto_264941 ?auto_264949 ) ) ( not ( = ?auto_264942 ?auto_264949 ) ) ( not ( = ?auto_264948 ?auto_264951 ) ) ( not ( = ?auto_264950 ?auto_264953 ) ) ( not ( = ?auto_264940 ?auto_264946 ) ) ( not ( = ?auto_264941 ?auto_264947 ) ) ( not ( = ?auto_264943 ?auto_264946 ) ) ( not ( = ?auto_264942 ?auto_264947 ) ) ( not ( = ?auto_264949 ?auto_264947 ) ) ( not ( = ?auto_264946 ?auto_264951 ) ) ( not ( = ?auto_264956 ?auto_264954 ) ) ( not ( = ?auto_264956 ?auto_264953 ) ) ( not ( = ?auto_264940 ?auto_264944 ) ) ( not ( = ?auto_264941 ?auto_264945 ) ) ( not ( = ?auto_264943 ?auto_264944 ) ) ( not ( = ?auto_264942 ?auto_264945 ) ) ( not ( = ?auto_264948 ?auto_264944 ) ) ( not ( = ?auto_264949 ?auto_264945 ) ) ( not ( = ?auto_264947 ?auto_264945 ) ) ( not ( = ?auto_264944 ?auto_264951 ) ) ( not ( = ?auto_264955 ?auto_264950 ) ) ( not ( = ?auto_264955 ?auto_264954 ) ) ( not ( = ?auto_264955 ?auto_264953 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_264940 ?auto_264941 ?auto_264943 ?auto_264942 ?auto_264948 ?auto_264949 ?auto_264944 ?auto_264945 ?auto_264946 ?auto_264947 )
      ( GET-5IMAGE-VERIFY ?auto_264940 ?auto_264941 ?auto_264943 ?auto_264942 ?auto_264944 ?auto_264945 ?auto_264946 ?auto_264947 ?auto_264948 ?auto_264949 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_265354 - DIRECTION
      ?auto_265355 - MODE
      ?auto_265357 - DIRECTION
      ?auto_265356 - MODE
      ?auto_265358 - DIRECTION
      ?auto_265359 - MODE
      ?auto_265360 - DIRECTION
      ?auto_265361 - MODE
      ?auto_265362 - DIRECTION
      ?auto_265363 - MODE
    )
    :vars
    (
      ?auto_265369 - INSTRUMENT
      ?auto_265371 - SATELLITE
      ?auto_265366 - DIRECTION
      ?auto_265370 - INSTRUMENT
      ?auto_265364 - INSTRUMENT
      ?auto_265368 - INSTRUMENT
      ?auto_265367 - INSTRUMENT
      ?auto_265365 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_265369 ?auto_265371 ) ( SUPPORTS ?auto_265369 ?auto_265363 ) ( not ( = ?auto_265362 ?auto_265366 ) ) ( CALIBRATION_TARGET ?auto_265369 ?auto_265366 ) ( not ( = ?auto_265366 ?auto_265360 ) ) ( ON_BOARD ?auto_265370 ?auto_265371 ) ( not ( = ?auto_265362 ?auto_265360 ) ) ( not ( = ?auto_265369 ?auto_265370 ) ) ( SUPPORTS ?auto_265370 ?auto_265361 ) ( CALIBRATION_TARGET ?auto_265370 ?auto_265366 ) ( not ( = ?auto_265366 ?auto_265357 ) ) ( ON_BOARD ?auto_265364 ?auto_265371 ) ( not ( = ?auto_265360 ?auto_265357 ) ) ( not ( = ?auto_265370 ?auto_265364 ) ) ( SUPPORTS ?auto_265364 ?auto_265356 ) ( CALIBRATION_TARGET ?auto_265364 ?auto_265366 ) ( not ( = ?auto_265366 ?auto_265358 ) ) ( ON_BOARD ?auto_265368 ?auto_265371 ) ( not ( = ?auto_265357 ?auto_265358 ) ) ( not ( = ?auto_265364 ?auto_265368 ) ) ( SUPPORTS ?auto_265368 ?auto_265359 ) ( CALIBRATION_TARGET ?auto_265368 ?auto_265366 ) ( not ( = ?auto_265366 ?auto_265354 ) ) ( ON_BOARD ?auto_265367 ?auto_265371 ) ( not ( = ?auto_265358 ?auto_265354 ) ) ( not ( = ?auto_265368 ?auto_265367 ) ) ( SUPPORTS ?auto_265367 ?auto_265355 ) ( CALIBRATION_TARGET ?auto_265367 ?auto_265366 ) ( POWER_AVAIL ?auto_265371 ) ( POINTING ?auto_265371 ?auto_265365 ) ( not ( = ?auto_265366 ?auto_265365 ) ) ( not ( = ?auto_265354 ?auto_265365 ) ) ( not ( = ?auto_265355 ?auto_265359 ) ) ( not ( = ?auto_265358 ?auto_265365 ) ) ( not ( = ?auto_265354 ?auto_265357 ) ) ( not ( = ?auto_265355 ?auto_265356 ) ) ( not ( = ?auto_265359 ?auto_265356 ) ) ( not ( = ?auto_265357 ?auto_265365 ) ) ( not ( = ?auto_265364 ?auto_265367 ) ) ( not ( = ?auto_265354 ?auto_265360 ) ) ( not ( = ?auto_265355 ?auto_265361 ) ) ( not ( = ?auto_265358 ?auto_265360 ) ) ( not ( = ?auto_265359 ?auto_265361 ) ) ( not ( = ?auto_265356 ?auto_265361 ) ) ( not ( = ?auto_265360 ?auto_265365 ) ) ( not ( = ?auto_265370 ?auto_265368 ) ) ( not ( = ?auto_265370 ?auto_265367 ) ) ( not ( = ?auto_265354 ?auto_265362 ) ) ( not ( = ?auto_265355 ?auto_265363 ) ) ( not ( = ?auto_265358 ?auto_265362 ) ) ( not ( = ?auto_265359 ?auto_265363 ) ) ( not ( = ?auto_265357 ?auto_265362 ) ) ( not ( = ?auto_265356 ?auto_265363 ) ) ( not ( = ?auto_265361 ?auto_265363 ) ) ( not ( = ?auto_265362 ?auto_265365 ) ) ( not ( = ?auto_265369 ?auto_265364 ) ) ( not ( = ?auto_265369 ?auto_265368 ) ) ( not ( = ?auto_265369 ?auto_265367 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_265354 ?auto_265355 ?auto_265358 ?auto_265359 ?auto_265357 ?auto_265356 ?auto_265362 ?auto_265363 ?auto_265360 ?auto_265361 )
      ( GET-5IMAGE-VERIFY ?auto_265354 ?auto_265355 ?auto_265357 ?auto_265356 ?auto_265358 ?auto_265359 ?auto_265360 ?auto_265361 ?auto_265362 ?auto_265363 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_265432 - DIRECTION
      ?auto_265433 - MODE
      ?auto_265435 - DIRECTION
      ?auto_265434 - MODE
      ?auto_265436 - DIRECTION
      ?auto_265437 - MODE
      ?auto_265438 - DIRECTION
      ?auto_265439 - MODE
      ?auto_265440 - DIRECTION
      ?auto_265441 - MODE
    )
    :vars
    (
      ?auto_265447 - INSTRUMENT
      ?auto_265449 - SATELLITE
      ?auto_265444 - DIRECTION
      ?auto_265448 - INSTRUMENT
      ?auto_265442 - INSTRUMENT
      ?auto_265446 - INSTRUMENT
      ?auto_265445 - INSTRUMENT
      ?auto_265443 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_265447 ?auto_265449 ) ( SUPPORTS ?auto_265447 ?auto_265439 ) ( not ( = ?auto_265438 ?auto_265444 ) ) ( CALIBRATION_TARGET ?auto_265447 ?auto_265444 ) ( not ( = ?auto_265444 ?auto_265440 ) ) ( ON_BOARD ?auto_265448 ?auto_265449 ) ( not ( = ?auto_265438 ?auto_265440 ) ) ( not ( = ?auto_265447 ?auto_265448 ) ) ( SUPPORTS ?auto_265448 ?auto_265441 ) ( CALIBRATION_TARGET ?auto_265448 ?auto_265444 ) ( not ( = ?auto_265444 ?auto_265435 ) ) ( ON_BOARD ?auto_265442 ?auto_265449 ) ( not ( = ?auto_265440 ?auto_265435 ) ) ( not ( = ?auto_265448 ?auto_265442 ) ) ( SUPPORTS ?auto_265442 ?auto_265434 ) ( CALIBRATION_TARGET ?auto_265442 ?auto_265444 ) ( not ( = ?auto_265444 ?auto_265436 ) ) ( ON_BOARD ?auto_265446 ?auto_265449 ) ( not ( = ?auto_265435 ?auto_265436 ) ) ( not ( = ?auto_265442 ?auto_265446 ) ) ( SUPPORTS ?auto_265446 ?auto_265437 ) ( CALIBRATION_TARGET ?auto_265446 ?auto_265444 ) ( not ( = ?auto_265444 ?auto_265432 ) ) ( ON_BOARD ?auto_265445 ?auto_265449 ) ( not ( = ?auto_265436 ?auto_265432 ) ) ( not ( = ?auto_265446 ?auto_265445 ) ) ( SUPPORTS ?auto_265445 ?auto_265433 ) ( CALIBRATION_TARGET ?auto_265445 ?auto_265444 ) ( POWER_AVAIL ?auto_265449 ) ( POINTING ?auto_265449 ?auto_265443 ) ( not ( = ?auto_265444 ?auto_265443 ) ) ( not ( = ?auto_265432 ?auto_265443 ) ) ( not ( = ?auto_265433 ?auto_265437 ) ) ( not ( = ?auto_265436 ?auto_265443 ) ) ( not ( = ?auto_265432 ?auto_265435 ) ) ( not ( = ?auto_265433 ?auto_265434 ) ) ( not ( = ?auto_265437 ?auto_265434 ) ) ( not ( = ?auto_265435 ?auto_265443 ) ) ( not ( = ?auto_265442 ?auto_265445 ) ) ( not ( = ?auto_265432 ?auto_265440 ) ) ( not ( = ?auto_265433 ?auto_265441 ) ) ( not ( = ?auto_265436 ?auto_265440 ) ) ( not ( = ?auto_265437 ?auto_265441 ) ) ( not ( = ?auto_265434 ?auto_265441 ) ) ( not ( = ?auto_265440 ?auto_265443 ) ) ( not ( = ?auto_265448 ?auto_265446 ) ) ( not ( = ?auto_265448 ?auto_265445 ) ) ( not ( = ?auto_265432 ?auto_265438 ) ) ( not ( = ?auto_265433 ?auto_265439 ) ) ( not ( = ?auto_265436 ?auto_265438 ) ) ( not ( = ?auto_265437 ?auto_265439 ) ) ( not ( = ?auto_265435 ?auto_265438 ) ) ( not ( = ?auto_265434 ?auto_265439 ) ) ( not ( = ?auto_265441 ?auto_265439 ) ) ( not ( = ?auto_265438 ?auto_265443 ) ) ( not ( = ?auto_265447 ?auto_265442 ) ) ( not ( = ?auto_265447 ?auto_265446 ) ) ( not ( = ?auto_265447 ?auto_265445 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_265432 ?auto_265433 ?auto_265436 ?auto_265437 ?auto_265435 ?auto_265434 ?auto_265438 ?auto_265439 ?auto_265440 ?auto_265441 )
      ( GET-5IMAGE-VERIFY ?auto_265432 ?auto_265433 ?auto_265435 ?auto_265434 ?auto_265436 ?auto_265437 ?auto_265438 ?auto_265439 ?auto_265440 ?auto_265441 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_265680 - DIRECTION
      ?auto_265681 - MODE
      ?auto_265683 - DIRECTION
      ?auto_265682 - MODE
      ?auto_265684 - DIRECTION
      ?auto_265685 - MODE
      ?auto_265686 - DIRECTION
      ?auto_265687 - MODE
      ?auto_265688 - DIRECTION
      ?auto_265689 - MODE
    )
    :vars
    (
      ?auto_265695 - INSTRUMENT
      ?auto_265697 - SATELLITE
      ?auto_265692 - DIRECTION
      ?auto_265696 - INSTRUMENT
      ?auto_265690 - INSTRUMENT
      ?auto_265694 - INSTRUMENT
      ?auto_265693 - INSTRUMENT
      ?auto_265691 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_265695 ?auto_265697 ) ( SUPPORTS ?auto_265695 ?auto_265689 ) ( not ( = ?auto_265688 ?auto_265692 ) ) ( CALIBRATION_TARGET ?auto_265695 ?auto_265692 ) ( not ( = ?auto_265692 ?auto_265684 ) ) ( ON_BOARD ?auto_265696 ?auto_265697 ) ( not ( = ?auto_265688 ?auto_265684 ) ) ( not ( = ?auto_265695 ?auto_265696 ) ) ( SUPPORTS ?auto_265696 ?auto_265685 ) ( CALIBRATION_TARGET ?auto_265696 ?auto_265692 ) ( not ( = ?auto_265692 ?auto_265683 ) ) ( ON_BOARD ?auto_265690 ?auto_265697 ) ( not ( = ?auto_265684 ?auto_265683 ) ) ( not ( = ?auto_265696 ?auto_265690 ) ) ( SUPPORTS ?auto_265690 ?auto_265682 ) ( CALIBRATION_TARGET ?auto_265690 ?auto_265692 ) ( not ( = ?auto_265692 ?auto_265686 ) ) ( ON_BOARD ?auto_265694 ?auto_265697 ) ( not ( = ?auto_265683 ?auto_265686 ) ) ( not ( = ?auto_265690 ?auto_265694 ) ) ( SUPPORTS ?auto_265694 ?auto_265687 ) ( CALIBRATION_TARGET ?auto_265694 ?auto_265692 ) ( not ( = ?auto_265692 ?auto_265680 ) ) ( ON_BOARD ?auto_265693 ?auto_265697 ) ( not ( = ?auto_265686 ?auto_265680 ) ) ( not ( = ?auto_265694 ?auto_265693 ) ) ( SUPPORTS ?auto_265693 ?auto_265681 ) ( CALIBRATION_TARGET ?auto_265693 ?auto_265692 ) ( POWER_AVAIL ?auto_265697 ) ( POINTING ?auto_265697 ?auto_265691 ) ( not ( = ?auto_265692 ?auto_265691 ) ) ( not ( = ?auto_265680 ?auto_265691 ) ) ( not ( = ?auto_265681 ?auto_265687 ) ) ( not ( = ?auto_265686 ?auto_265691 ) ) ( not ( = ?auto_265680 ?auto_265683 ) ) ( not ( = ?auto_265681 ?auto_265682 ) ) ( not ( = ?auto_265687 ?auto_265682 ) ) ( not ( = ?auto_265683 ?auto_265691 ) ) ( not ( = ?auto_265690 ?auto_265693 ) ) ( not ( = ?auto_265680 ?auto_265684 ) ) ( not ( = ?auto_265681 ?auto_265685 ) ) ( not ( = ?auto_265686 ?auto_265684 ) ) ( not ( = ?auto_265687 ?auto_265685 ) ) ( not ( = ?auto_265682 ?auto_265685 ) ) ( not ( = ?auto_265684 ?auto_265691 ) ) ( not ( = ?auto_265696 ?auto_265694 ) ) ( not ( = ?auto_265696 ?auto_265693 ) ) ( not ( = ?auto_265680 ?auto_265688 ) ) ( not ( = ?auto_265681 ?auto_265689 ) ) ( not ( = ?auto_265686 ?auto_265688 ) ) ( not ( = ?auto_265687 ?auto_265689 ) ) ( not ( = ?auto_265683 ?auto_265688 ) ) ( not ( = ?auto_265682 ?auto_265689 ) ) ( not ( = ?auto_265685 ?auto_265689 ) ) ( not ( = ?auto_265688 ?auto_265691 ) ) ( not ( = ?auto_265695 ?auto_265690 ) ) ( not ( = ?auto_265695 ?auto_265694 ) ) ( not ( = ?auto_265695 ?auto_265693 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_265680 ?auto_265681 ?auto_265686 ?auto_265687 ?auto_265683 ?auto_265682 ?auto_265688 ?auto_265689 ?auto_265684 ?auto_265685 )
      ( GET-5IMAGE-VERIFY ?auto_265680 ?auto_265681 ?auto_265683 ?auto_265682 ?auto_265684 ?auto_265685 ?auto_265686 ?auto_265687 ?auto_265688 ?auto_265689 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_265758 - DIRECTION
      ?auto_265759 - MODE
      ?auto_265761 - DIRECTION
      ?auto_265760 - MODE
      ?auto_265762 - DIRECTION
      ?auto_265763 - MODE
      ?auto_265764 - DIRECTION
      ?auto_265765 - MODE
      ?auto_265766 - DIRECTION
      ?auto_265767 - MODE
    )
    :vars
    (
      ?auto_265773 - INSTRUMENT
      ?auto_265775 - SATELLITE
      ?auto_265770 - DIRECTION
      ?auto_265774 - INSTRUMENT
      ?auto_265768 - INSTRUMENT
      ?auto_265772 - INSTRUMENT
      ?auto_265771 - INSTRUMENT
      ?auto_265769 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_265773 ?auto_265775 ) ( SUPPORTS ?auto_265773 ?auto_265765 ) ( not ( = ?auto_265764 ?auto_265770 ) ) ( CALIBRATION_TARGET ?auto_265773 ?auto_265770 ) ( not ( = ?auto_265770 ?auto_265762 ) ) ( ON_BOARD ?auto_265774 ?auto_265775 ) ( not ( = ?auto_265764 ?auto_265762 ) ) ( not ( = ?auto_265773 ?auto_265774 ) ) ( SUPPORTS ?auto_265774 ?auto_265763 ) ( CALIBRATION_TARGET ?auto_265774 ?auto_265770 ) ( not ( = ?auto_265770 ?auto_265761 ) ) ( ON_BOARD ?auto_265768 ?auto_265775 ) ( not ( = ?auto_265762 ?auto_265761 ) ) ( not ( = ?auto_265774 ?auto_265768 ) ) ( SUPPORTS ?auto_265768 ?auto_265760 ) ( CALIBRATION_TARGET ?auto_265768 ?auto_265770 ) ( not ( = ?auto_265770 ?auto_265766 ) ) ( ON_BOARD ?auto_265772 ?auto_265775 ) ( not ( = ?auto_265761 ?auto_265766 ) ) ( not ( = ?auto_265768 ?auto_265772 ) ) ( SUPPORTS ?auto_265772 ?auto_265767 ) ( CALIBRATION_TARGET ?auto_265772 ?auto_265770 ) ( not ( = ?auto_265770 ?auto_265758 ) ) ( ON_BOARD ?auto_265771 ?auto_265775 ) ( not ( = ?auto_265766 ?auto_265758 ) ) ( not ( = ?auto_265772 ?auto_265771 ) ) ( SUPPORTS ?auto_265771 ?auto_265759 ) ( CALIBRATION_TARGET ?auto_265771 ?auto_265770 ) ( POWER_AVAIL ?auto_265775 ) ( POINTING ?auto_265775 ?auto_265769 ) ( not ( = ?auto_265770 ?auto_265769 ) ) ( not ( = ?auto_265758 ?auto_265769 ) ) ( not ( = ?auto_265759 ?auto_265767 ) ) ( not ( = ?auto_265766 ?auto_265769 ) ) ( not ( = ?auto_265758 ?auto_265761 ) ) ( not ( = ?auto_265759 ?auto_265760 ) ) ( not ( = ?auto_265767 ?auto_265760 ) ) ( not ( = ?auto_265761 ?auto_265769 ) ) ( not ( = ?auto_265768 ?auto_265771 ) ) ( not ( = ?auto_265758 ?auto_265762 ) ) ( not ( = ?auto_265759 ?auto_265763 ) ) ( not ( = ?auto_265766 ?auto_265762 ) ) ( not ( = ?auto_265767 ?auto_265763 ) ) ( not ( = ?auto_265760 ?auto_265763 ) ) ( not ( = ?auto_265762 ?auto_265769 ) ) ( not ( = ?auto_265774 ?auto_265772 ) ) ( not ( = ?auto_265774 ?auto_265771 ) ) ( not ( = ?auto_265758 ?auto_265764 ) ) ( not ( = ?auto_265759 ?auto_265765 ) ) ( not ( = ?auto_265766 ?auto_265764 ) ) ( not ( = ?auto_265767 ?auto_265765 ) ) ( not ( = ?auto_265761 ?auto_265764 ) ) ( not ( = ?auto_265760 ?auto_265765 ) ) ( not ( = ?auto_265763 ?auto_265765 ) ) ( not ( = ?auto_265764 ?auto_265769 ) ) ( not ( = ?auto_265773 ?auto_265768 ) ) ( not ( = ?auto_265773 ?auto_265772 ) ) ( not ( = ?auto_265773 ?auto_265771 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_265758 ?auto_265759 ?auto_265766 ?auto_265767 ?auto_265761 ?auto_265760 ?auto_265764 ?auto_265765 ?auto_265762 ?auto_265763 )
      ( GET-5IMAGE-VERIFY ?auto_265758 ?auto_265759 ?auto_265761 ?auto_265760 ?auto_265762 ?auto_265763 ?auto_265764 ?auto_265765 ?auto_265766 ?auto_265767 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_266002 - DIRECTION
      ?auto_266003 - MODE
      ?auto_266005 - DIRECTION
      ?auto_266004 - MODE
      ?auto_266006 - DIRECTION
      ?auto_266007 - MODE
      ?auto_266008 - DIRECTION
      ?auto_266009 - MODE
      ?auto_266010 - DIRECTION
      ?auto_266011 - MODE
    )
    :vars
    (
      ?auto_266017 - INSTRUMENT
      ?auto_266019 - SATELLITE
      ?auto_266014 - DIRECTION
      ?auto_266018 - INSTRUMENT
      ?auto_266012 - INSTRUMENT
      ?auto_266016 - INSTRUMENT
      ?auto_266015 - INSTRUMENT
      ?auto_266013 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_266017 ?auto_266019 ) ( SUPPORTS ?auto_266017 ?auto_266007 ) ( not ( = ?auto_266006 ?auto_266014 ) ) ( CALIBRATION_TARGET ?auto_266017 ?auto_266014 ) ( not ( = ?auto_266014 ?auto_266010 ) ) ( ON_BOARD ?auto_266018 ?auto_266019 ) ( not ( = ?auto_266006 ?auto_266010 ) ) ( not ( = ?auto_266017 ?auto_266018 ) ) ( SUPPORTS ?auto_266018 ?auto_266011 ) ( CALIBRATION_TARGET ?auto_266018 ?auto_266014 ) ( not ( = ?auto_266014 ?auto_266005 ) ) ( ON_BOARD ?auto_266012 ?auto_266019 ) ( not ( = ?auto_266010 ?auto_266005 ) ) ( not ( = ?auto_266018 ?auto_266012 ) ) ( SUPPORTS ?auto_266012 ?auto_266004 ) ( CALIBRATION_TARGET ?auto_266012 ?auto_266014 ) ( not ( = ?auto_266014 ?auto_266008 ) ) ( ON_BOARD ?auto_266016 ?auto_266019 ) ( not ( = ?auto_266005 ?auto_266008 ) ) ( not ( = ?auto_266012 ?auto_266016 ) ) ( SUPPORTS ?auto_266016 ?auto_266009 ) ( CALIBRATION_TARGET ?auto_266016 ?auto_266014 ) ( not ( = ?auto_266014 ?auto_266002 ) ) ( ON_BOARD ?auto_266015 ?auto_266019 ) ( not ( = ?auto_266008 ?auto_266002 ) ) ( not ( = ?auto_266016 ?auto_266015 ) ) ( SUPPORTS ?auto_266015 ?auto_266003 ) ( CALIBRATION_TARGET ?auto_266015 ?auto_266014 ) ( POWER_AVAIL ?auto_266019 ) ( POINTING ?auto_266019 ?auto_266013 ) ( not ( = ?auto_266014 ?auto_266013 ) ) ( not ( = ?auto_266002 ?auto_266013 ) ) ( not ( = ?auto_266003 ?auto_266009 ) ) ( not ( = ?auto_266008 ?auto_266013 ) ) ( not ( = ?auto_266002 ?auto_266005 ) ) ( not ( = ?auto_266003 ?auto_266004 ) ) ( not ( = ?auto_266009 ?auto_266004 ) ) ( not ( = ?auto_266005 ?auto_266013 ) ) ( not ( = ?auto_266012 ?auto_266015 ) ) ( not ( = ?auto_266002 ?auto_266010 ) ) ( not ( = ?auto_266003 ?auto_266011 ) ) ( not ( = ?auto_266008 ?auto_266010 ) ) ( not ( = ?auto_266009 ?auto_266011 ) ) ( not ( = ?auto_266004 ?auto_266011 ) ) ( not ( = ?auto_266010 ?auto_266013 ) ) ( not ( = ?auto_266018 ?auto_266016 ) ) ( not ( = ?auto_266018 ?auto_266015 ) ) ( not ( = ?auto_266002 ?auto_266006 ) ) ( not ( = ?auto_266003 ?auto_266007 ) ) ( not ( = ?auto_266008 ?auto_266006 ) ) ( not ( = ?auto_266009 ?auto_266007 ) ) ( not ( = ?auto_266005 ?auto_266006 ) ) ( not ( = ?auto_266004 ?auto_266007 ) ) ( not ( = ?auto_266011 ?auto_266007 ) ) ( not ( = ?auto_266006 ?auto_266013 ) ) ( not ( = ?auto_266017 ?auto_266012 ) ) ( not ( = ?auto_266017 ?auto_266016 ) ) ( not ( = ?auto_266017 ?auto_266015 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_266002 ?auto_266003 ?auto_266008 ?auto_266009 ?auto_266005 ?auto_266004 ?auto_266006 ?auto_266007 ?auto_266010 ?auto_266011 )
      ( GET-5IMAGE-VERIFY ?auto_266002 ?auto_266003 ?auto_266005 ?auto_266004 ?auto_266006 ?auto_266007 ?auto_266008 ?auto_266009 ?auto_266010 ?auto_266011 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_266166 - DIRECTION
      ?auto_266167 - MODE
      ?auto_266169 - DIRECTION
      ?auto_266168 - MODE
      ?auto_266170 - DIRECTION
      ?auto_266171 - MODE
      ?auto_266172 - DIRECTION
      ?auto_266173 - MODE
      ?auto_266174 - DIRECTION
      ?auto_266175 - MODE
    )
    :vars
    (
      ?auto_266181 - INSTRUMENT
      ?auto_266183 - SATELLITE
      ?auto_266178 - DIRECTION
      ?auto_266182 - INSTRUMENT
      ?auto_266176 - INSTRUMENT
      ?auto_266180 - INSTRUMENT
      ?auto_266179 - INSTRUMENT
      ?auto_266177 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_266181 ?auto_266183 ) ( SUPPORTS ?auto_266181 ?auto_266171 ) ( not ( = ?auto_266170 ?auto_266178 ) ) ( CALIBRATION_TARGET ?auto_266181 ?auto_266178 ) ( not ( = ?auto_266178 ?auto_266172 ) ) ( ON_BOARD ?auto_266182 ?auto_266183 ) ( not ( = ?auto_266170 ?auto_266172 ) ) ( not ( = ?auto_266181 ?auto_266182 ) ) ( SUPPORTS ?auto_266182 ?auto_266173 ) ( CALIBRATION_TARGET ?auto_266182 ?auto_266178 ) ( not ( = ?auto_266178 ?auto_266169 ) ) ( ON_BOARD ?auto_266176 ?auto_266183 ) ( not ( = ?auto_266172 ?auto_266169 ) ) ( not ( = ?auto_266182 ?auto_266176 ) ) ( SUPPORTS ?auto_266176 ?auto_266168 ) ( CALIBRATION_TARGET ?auto_266176 ?auto_266178 ) ( not ( = ?auto_266178 ?auto_266174 ) ) ( ON_BOARD ?auto_266180 ?auto_266183 ) ( not ( = ?auto_266169 ?auto_266174 ) ) ( not ( = ?auto_266176 ?auto_266180 ) ) ( SUPPORTS ?auto_266180 ?auto_266175 ) ( CALIBRATION_TARGET ?auto_266180 ?auto_266178 ) ( not ( = ?auto_266178 ?auto_266166 ) ) ( ON_BOARD ?auto_266179 ?auto_266183 ) ( not ( = ?auto_266174 ?auto_266166 ) ) ( not ( = ?auto_266180 ?auto_266179 ) ) ( SUPPORTS ?auto_266179 ?auto_266167 ) ( CALIBRATION_TARGET ?auto_266179 ?auto_266178 ) ( POWER_AVAIL ?auto_266183 ) ( POINTING ?auto_266183 ?auto_266177 ) ( not ( = ?auto_266178 ?auto_266177 ) ) ( not ( = ?auto_266166 ?auto_266177 ) ) ( not ( = ?auto_266167 ?auto_266175 ) ) ( not ( = ?auto_266174 ?auto_266177 ) ) ( not ( = ?auto_266166 ?auto_266169 ) ) ( not ( = ?auto_266167 ?auto_266168 ) ) ( not ( = ?auto_266175 ?auto_266168 ) ) ( not ( = ?auto_266169 ?auto_266177 ) ) ( not ( = ?auto_266176 ?auto_266179 ) ) ( not ( = ?auto_266166 ?auto_266172 ) ) ( not ( = ?auto_266167 ?auto_266173 ) ) ( not ( = ?auto_266174 ?auto_266172 ) ) ( not ( = ?auto_266175 ?auto_266173 ) ) ( not ( = ?auto_266168 ?auto_266173 ) ) ( not ( = ?auto_266172 ?auto_266177 ) ) ( not ( = ?auto_266182 ?auto_266180 ) ) ( not ( = ?auto_266182 ?auto_266179 ) ) ( not ( = ?auto_266166 ?auto_266170 ) ) ( not ( = ?auto_266167 ?auto_266171 ) ) ( not ( = ?auto_266174 ?auto_266170 ) ) ( not ( = ?auto_266175 ?auto_266171 ) ) ( not ( = ?auto_266169 ?auto_266170 ) ) ( not ( = ?auto_266168 ?auto_266171 ) ) ( not ( = ?auto_266173 ?auto_266171 ) ) ( not ( = ?auto_266170 ?auto_266177 ) ) ( not ( = ?auto_266181 ?auto_266176 ) ) ( not ( = ?auto_266181 ?auto_266180 ) ) ( not ( = ?auto_266181 ?auto_266179 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_266166 ?auto_266167 ?auto_266174 ?auto_266175 ?auto_266169 ?auto_266168 ?auto_266170 ?auto_266171 ?auto_266172 ?auto_266173 )
      ( GET-5IMAGE-VERIFY ?auto_266166 ?auto_266167 ?auto_266169 ?auto_266168 ?auto_266170 ?auto_266171 ?auto_266172 ?auto_266173 ?auto_266174 ?auto_266175 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_266580 - DIRECTION
      ?auto_266581 - MODE
      ?auto_266583 - DIRECTION
      ?auto_266582 - MODE
      ?auto_266584 - DIRECTION
      ?auto_266585 - MODE
      ?auto_266586 - DIRECTION
      ?auto_266587 - MODE
      ?auto_266588 - DIRECTION
      ?auto_266589 - MODE
    )
    :vars
    (
      ?auto_266595 - INSTRUMENT
      ?auto_266597 - SATELLITE
      ?auto_266592 - DIRECTION
      ?auto_266596 - INSTRUMENT
      ?auto_266590 - INSTRUMENT
      ?auto_266594 - INSTRUMENT
      ?auto_266593 - INSTRUMENT
      ?auto_266591 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_266595 ?auto_266597 ) ( SUPPORTS ?auto_266595 ?auto_266589 ) ( not ( = ?auto_266588 ?auto_266592 ) ) ( CALIBRATION_TARGET ?auto_266595 ?auto_266592 ) ( not ( = ?auto_266592 ?auto_266583 ) ) ( ON_BOARD ?auto_266596 ?auto_266597 ) ( not ( = ?auto_266588 ?auto_266583 ) ) ( not ( = ?auto_266595 ?auto_266596 ) ) ( SUPPORTS ?auto_266596 ?auto_266582 ) ( CALIBRATION_TARGET ?auto_266596 ?auto_266592 ) ( not ( = ?auto_266592 ?auto_266586 ) ) ( ON_BOARD ?auto_266590 ?auto_266597 ) ( not ( = ?auto_266583 ?auto_266586 ) ) ( not ( = ?auto_266596 ?auto_266590 ) ) ( SUPPORTS ?auto_266590 ?auto_266587 ) ( CALIBRATION_TARGET ?auto_266590 ?auto_266592 ) ( not ( = ?auto_266592 ?auto_266584 ) ) ( ON_BOARD ?auto_266594 ?auto_266597 ) ( not ( = ?auto_266586 ?auto_266584 ) ) ( not ( = ?auto_266590 ?auto_266594 ) ) ( SUPPORTS ?auto_266594 ?auto_266585 ) ( CALIBRATION_TARGET ?auto_266594 ?auto_266592 ) ( not ( = ?auto_266592 ?auto_266580 ) ) ( ON_BOARD ?auto_266593 ?auto_266597 ) ( not ( = ?auto_266584 ?auto_266580 ) ) ( not ( = ?auto_266594 ?auto_266593 ) ) ( SUPPORTS ?auto_266593 ?auto_266581 ) ( CALIBRATION_TARGET ?auto_266593 ?auto_266592 ) ( POWER_AVAIL ?auto_266597 ) ( POINTING ?auto_266597 ?auto_266591 ) ( not ( = ?auto_266592 ?auto_266591 ) ) ( not ( = ?auto_266580 ?auto_266591 ) ) ( not ( = ?auto_266581 ?auto_266585 ) ) ( not ( = ?auto_266584 ?auto_266591 ) ) ( not ( = ?auto_266580 ?auto_266586 ) ) ( not ( = ?auto_266581 ?auto_266587 ) ) ( not ( = ?auto_266585 ?auto_266587 ) ) ( not ( = ?auto_266586 ?auto_266591 ) ) ( not ( = ?auto_266590 ?auto_266593 ) ) ( not ( = ?auto_266580 ?auto_266583 ) ) ( not ( = ?auto_266581 ?auto_266582 ) ) ( not ( = ?auto_266584 ?auto_266583 ) ) ( not ( = ?auto_266585 ?auto_266582 ) ) ( not ( = ?auto_266587 ?auto_266582 ) ) ( not ( = ?auto_266583 ?auto_266591 ) ) ( not ( = ?auto_266596 ?auto_266594 ) ) ( not ( = ?auto_266596 ?auto_266593 ) ) ( not ( = ?auto_266580 ?auto_266588 ) ) ( not ( = ?auto_266581 ?auto_266589 ) ) ( not ( = ?auto_266584 ?auto_266588 ) ) ( not ( = ?auto_266585 ?auto_266589 ) ) ( not ( = ?auto_266586 ?auto_266588 ) ) ( not ( = ?auto_266587 ?auto_266589 ) ) ( not ( = ?auto_266582 ?auto_266589 ) ) ( not ( = ?auto_266588 ?auto_266591 ) ) ( not ( = ?auto_266595 ?auto_266590 ) ) ( not ( = ?auto_266595 ?auto_266594 ) ) ( not ( = ?auto_266595 ?auto_266593 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_266580 ?auto_266581 ?auto_266584 ?auto_266585 ?auto_266586 ?auto_266587 ?auto_266588 ?auto_266589 ?auto_266583 ?auto_266582 )
      ( GET-5IMAGE-VERIFY ?auto_266580 ?auto_266581 ?auto_266583 ?auto_266582 ?auto_266584 ?auto_266585 ?auto_266586 ?auto_266587 ?auto_266588 ?auto_266589 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_266658 - DIRECTION
      ?auto_266659 - MODE
      ?auto_266661 - DIRECTION
      ?auto_266660 - MODE
      ?auto_266662 - DIRECTION
      ?auto_266663 - MODE
      ?auto_266664 - DIRECTION
      ?auto_266665 - MODE
      ?auto_266666 - DIRECTION
      ?auto_266667 - MODE
    )
    :vars
    (
      ?auto_266673 - INSTRUMENT
      ?auto_266675 - SATELLITE
      ?auto_266670 - DIRECTION
      ?auto_266674 - INSTRUMENT
      ?auto_266668 - INSTRUMENT
      ?auto_266672 - INSTRUMENT
      ?auto_266671 - INSTRUMENT
      ?auto_266669 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_266673 ?auto_266675 ) ( SUPPORTS ?auto_266673 ?auto_266665 ) ( not ( = ?auto_266664 ?auto_266670 ) ) ( CALIBRATION_TARGET ?auto_266673 ?auto_266670 ) ( not ( = ?auto_266670 ?auto_266661 ) ) ( ON_BOARD ?auto_266674 ?auto_266675 ) ( not ( = ?auto_266664 ?auto_266661 ) ) ( not ( = ?auto_266673 ?auto_266674 ) ) ( SUPPORTS ?auto_266674 ?auto_266660 ) ( CALIBRATION_TARGET ?auto_266674 ?auto_266670 ) ( not ( = ?auto_266670 ?auto_266666 ) ) ( ON_BOARD ?auto_266668 ?auto_266675 ) ( not ( = ?auto_266661 ?auto_266666 ) ) ( not ( = ?auto_266674 ?auto_266668 ) ) ( SUPPORTS ?auto_266668 ?auto_266667 ) ( CALIBRATION_TARGET ?auto_266668 ?auto_266670 ) ( not ( = ?auto_266670 ?auto_266662 ) ) ( ON_BOARD ?auto_266672 ?auto_266675 ) ( not ( = ?auto_266666 ?auto_266662 ) ) ( not ( = ?auto_266668 ?auto_266672 ) ) ( SUPPORTS ?auto_266672 ?auto_266663 ) ( CALIBRATION_TARGET ?auto_266672 ?auto_266670 ) ( not ( = ?auto_266670 ?auto_266658 ) ) ( ON_BOARD ?auto_266671 ?auto_266675 ) ( not ( = ?auto_266662 ?auto_266658 ) ) ( not ( = ?auto_266672 ?auto_266671 ) ) ( SUPPORTS ?auto_266671 ?auto_266659 ) ( CALIBRATION_TARGET ?auto_266671 ?auto_266670 ) ( POWER_AVAIL ?auto_266675 ) ( POINTING ?auto_266675 ?auto_266669 ) ( not ( = ?auto_266670 ?auto_266669 ) ) ( not ( = ?auto_266658 ?auto_266669 ) ) ( not ( = ?auto_266659 ?auto_266663 ) ) ( not ( = ?auto_266662 ?auto_266669 ) ) ( not ( = ?auto_266658 ?auto_266666 ) ) ( not ( = ?auto_266659 ?auto_266667 ) ) ( not ( = ?auto_266663 ?auto_266667 ) ) ( not ( = ?auto_266666 ?auto_266669 ) ) ( not ( = ?auto_266668 ?auto_266671 ) ) ( not ( = ?auto_266658 ?auto_266661 ) ) ( not ( = ?auto_266659 ?auto_266660 ) ) ( not ( = ?auto_266662 ?auto_266661 ) ) ( not ( = ?auto_266663 ?auto_266660 ) ) ( not ( = ?auto_266667 ?auto_266660 ) ) ( not ( = ?auto_266661 ?auto_266669 ) ) ( not ( = ?auto_266674 ?auto_266672 ) ) ( not ( = ?auto_266674 ?auto_266671 ) ) ( not ( = ?auto_266658 ?auto_266664 ) ) ( not ( = ?auto_266659 ?auto_266665 ) ) ( not ( = ?auto_266662 ?auto_266664 ) ) ( not ( = ?auto_266663 ?auto_266665 ) ) ( not ( = ?auto_266666 ?auto_266664 ) ) ( not ( = ?auto_266667 ?auto_266665 ) ) ( not ( = ?auto_266660 ?auto_266665 ) ) ( not ( = ?auto_266664 ?auto_266669 ) ) ( not ( = ?auto_266673 ?auto_266668 ) ) ( not ( = ?auto_266673 ?auto_266672 ) ) ( not ( = ?auto_266673 ?auto_266671 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_266658 ?auto_266659 ?auto_266662 ?auto_266663 ?auto_266666 ?auto_266667 ?auto_266664 ?auto_266665 ?auto_266661 ?auto_266660 )
      ( GET-5IMAGE-VERIFY ?auto_266658 ?auto_266659 ?auto_266661 ?auto_266660 ?auto_266662 ?auto_266663 ?auto_266664 ?auto_266665 ?auto_266666 ?auto_266667 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_266736 - DIRECTION
      ?auto_266737 - MODE
      ?auto_266739 - DIRECTION
      ?auto_266738 - MODE
      ?auto_266740 - DIRECTION
      ?auto_266741 - MODE
      ?auto_266742 - DIRECTION
      ?auto_266743 - MODE
      ?auto_266744 - DIRECTION
      ?auto_266745 - MODE
    )
    :vars
    (
      ?auto_266751 - INSTRUMENT
      ?auto_266753 - SATELLITE
      ?auto_266748 - DIRECTION
      ?auto_266752 - INSTRUMENT
      ?auto_266746 - INSTRUMENT
      ?auto_266750 - INSTRUMENT
      ?auto_266749 - INSTRUMENT
      ?auto_266747 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_266751 ?auto_266753 ) ( SUPPORTS ?auto_266751 ?auto_266745 ) ( not ( = ?auto_266744 ?auto_266748 ) ) ( CALIBRATION_TARGET ?auto_266751 ?auto_266748 ) ( not ( = ?auto_266748 ?auto_266739 ) ) ( ON_BOARD ?auto_266752 ?auto_266753 ) ( not ( = ?auto_266744 ?auto_266739 ) ) ( not ( = ?auto_266751 ?auto_266752 ) ) ( SUPPORTS ?auto_266752 ?auto_266738 ) ( CALIBRATION_TARGET ?auto_266752 ?auto_266748 ) ( not ( = ?auto_266748 ?auto_266740 ) ) ( ON_BOARD ?auto_266746 ?auto_266753 ) ( not ( = ?auto_266739 ?auto_266740 ) ) ( not ( = ?auto_266752 ?auto_266746 ) ) ( SUPPORTS ?auto_266746 ?auto_266741 ) ( CALIBRATION_TARGET ?auto_266746 ?auto_266748 ) ( not ( = ?auto_266748 ?auto_266742 ) ) ( ON_BOARD ?auto_266750 ?auto_266753 ) ( not ( = ?auto_266740 ?auto_266742 ) ) ( not ( = ?auto_266746 ?auto_266750 ) ) ( SUPPORTS ?auto_266750 ?auto_266743 ) ( CALIBRATION_TARGET ?auto_266750 ?auto_266748 ) ( not ( = ?auto_266748 ?auto_266736 ) ) ( ON_BOARD ?auto_266749 ?auto_266753 ) ( not ( = ?auto_266742 ?auto_266736 ) ) ( not ( = ?auto_266750 ?auto_266749 ) ) ( SUPPORTS ?auto_266749 ?auto_266737 ) ( CALIBRATION_TARGET ?auto_266749 ?auto_266748 ) ( POWER_AVAIL ?auto_266753 ) ( POINTING ?auto_266753 ?auto_266747 ) ( not ( = ?auto_266748 ?auto_266747 ) ) ( not ( = ?auto_266736 ?auto_266747 ) ) ( not ( = ?auto_266737 ?auto_266743 ) ) ( not ( = ?auto_266742 ?auto_266747 ) ) ( not ( = ?auto_266736 ?auto_266740 ) ) ( not ( = ?auto_266737 ?auto_266741 ) ) ( not ( = ?auto_266743 ?auto_266741 ) ) ( not ( = ?auto_266740 ?auto_266747 ) ) ( not ( = ?auto_266746 ?auto_266749 ) ) ( not ( = ?auto_266736 ?auto_266739 ) ) ( not ( = ?auto_266737 ?auto_266738 ) ) ( not ( = ?auto_266742 ?auto_266739 ) ) ( not ( = ?auto_266743 ?auto_266738 ) ) ( not ( = ?auto_266741 ?auto_266738 ) ) ( not ( = ?auto_266739 ?auto_266747 ) ) ( not ( = ?auto_266752 ?auto_266750 ) ) ( not ( = ?auto_266752 ?auto_266749 ) ) ( not ( = ?auto_266736 ?auto_266744 ) ) ( not ( = ?auto_266737 ?auto_266745 ) ) ( not ( = ?auto_266742 ?auto_266744 ) ) ( not ( = ?auto_266743 ?auto_266745 ) ) ( not ( = ?auto_266740 ?auto_266744 ) ) ( not ( = ?auto_266741 ?auto_266745 ) ) ( not ( = ?auto_266738 ?auto_266745 ) ) ( not ( = ?auto_266744 ?auto_266747 ) ) ( not ( = ?auto_266751 ?auto_266746 ) ) ( not ( = ?auto_266751 ?auto_266750 ) ) ( not ( = ?auto_266751 ?auto_266749 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_266736 ?auto_266737 ?auto_266742 ?auto_266743 ?auto_266740 ?auto_266741 ?auto_266744 ?auto_266745 ?auto_266739 ?auto_266738 )
      ( GET-5IMAGE-VERIFY ?auto_266736 ?auto_266737 ?auto_266739 ?auto_266738 ?auto_266740 ?auto_266741 ?auto_266742 ?auto_266743 ?auto_266744 ?auto_266745 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_266814 - DIRECTION
      ?auto_266815 - MODE
      ?auto_266817 - DIRECTION
      ?auto_266816 - MODE
      ?auto_266818 - DIRECTION
      ?auto_266819 - MODE
      ?auto_266820 - DIRECTION
      ?auto_266821 - MODE
      ?auto_266822 - DIRECTION
      ?auto_266823 - MODE
    )
    :vars
    (
      ?auto_266829 - INSTRUMENT
      ?auto_266831 - SATELLITE
      ?auto_266826 - DIRECTION
      ?auto_266830 - INSTRUMENT
      ?auto_266824 - INSTRUMENT
      ?auto_266828 - INSTRUMENT
      ?auto_266827 - INSTRUMENT
      ?auto_266825 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_266829 ?auto_266831 ) ( SUPPORTS ?auto_266829 ?auto_266821 ) ( not ( = ?auto_266820 ?auto_266826 ) ) ( CALIBRATION_TARGET ?auto_266829 ?auto_266826 ) ( not ( = ?auto_266826 ?auto_266817 ) ) ( ON_BOARD ?auto_266830 ?auto_266831 ) ( not ( = ?auto_266820 ?auto_266817 ) ) ( not ( = ?auto_266829 ?auto_266830 ) ) ( SUPPORTS ?auto_266830 ?auto_266816 ) ( CALIBRATION_TARGET ?auto_266830 ?auto_266826 ) ( not ( = ?auto_266826 ?auto_266818 ) ) ( ON_BOARD ?auto_266824 ?auto_266831 ) ( not ( = ?auto_266817 ?auto_266818 ) ) ( not ( = ?auto_266830 ?auto_266824 ) ) ( SUPPORTS ?auto_266824 ?auto_266819 ) ( CALIBRATION_TARGET ?auto_266824 ?auto_266826 ) ( not ( = ?auto_266826 ?auto_266822 ) ) ( ON_BOARD ?auto_266828 ?auto_266831 ) ( not ( = ?auto_266818 ?auto_266822 ) ) ( not ( = ?auto_266824 ?auto_266828 ) ) ( SUPPORTS ?auto_266828 ?auto_266823 ) ( CALIBRATION_TARGET ?auto_266828 ?auto_266826 ) ( not ( = ?auto_266826 ?auto_266814 ) ) ( ON_BOARD ?auto_266827 ?auto_266831 ) ( not ( = ?auto_266822 ?auto_266814 ) ) ( not ( = ?auto_266828 ?auto_266827 ) ) ( SUPPORTS ?auto_266827 ?auto_266815 ) ( CALIBRATION_TARGET ?auto_266827 ?auto_266826 ) ( POWER_AVAIL ?auto_266831 ) ( POINTING ?auto_266831 ?auto_266825 ) ( not ( = ?auto_266826 ?auto_266825 ) ) ( not ( = ?auto_266814 ?auto_266825 ) ) ( not ( = ?auto_266815 ?auto_266823 ) ) ( not ( = ?auto_266822 ?auto_266825 ) ) ( not ( = ?auto_266814 ?auto_266818 ) ) ( not ( = ?auto_266815 ?auto_266819 ) ) ( not ( = ?auto_266823 ?auto_266819 ) ) ( not ( = ?auto_266818 ?auto_266825 ) ) ( not ( = ?auto_266824 ?auto_266827 ) ) ( not ( = ?auto_266814 ?auto_266817 ) ) ( not ( = ?auto_266815 ?auto_266816 ) ) ( not ( = ?auto_266822 ?auto_266817 ) ) ( not ( = ?auto_266823 ?auto_266816 ) ) ( not ( = ?auto_266819 ?auto_266816 ) ) ( not ( = ?auto_266817 ?auto_266825 ) ) ( not ( = ?auto_266830 ?auto_266828 ) ) ( not ( = ?auto_266830 ?auto_266827 ) ) ( not ( = ?auto_266814 ?auto_266820 ) ) ( not ( = ?auto_266815 ?auto_266821 ) ) ( not ( = ?auto_266822 ?auto_266820 ) ) ( not ( = ?auto_266823 ?auto_266821 ) ) ( not ( = ?auto_266818 ?auto_266820 ) ) ( not ( = ?auto_266819 ?auto_266821 ) ) ( not ( = ?auto_266816 ?auto_266821 ) ) ( not ( = ?auto_266820 ?auto_266825 ) ) ( not ( = ?auto_266829 ?auto_266824 ) ) ( not ( = ?auto_266829 ?auto_266828 ) ) ( not ( = ?auto_266829 ?auto_266827 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_266814 ?auto_266815 ?auto_266822 ?auto_266823 ?auto_266818 ?auto_266819 ?auto_266820 ?auto_266821 ?auto_266817 ?auto_266816 )
      ( GET-5IMAGE-VERIFY ?auto_266814 ?auto_266815 ?auto_266817 ?auto_266816 ?auto_266818 ?auto_266819 ?auto_266820 ?auto_266821 ?auto_266822 ?auto_266823 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_267228 - DIRECTION
      ?auto_267229 - MODE
      ?auto_267231 - DIRECTION
      ?auto_267230 - MODE
      ?auto_267232 - DIRECTION
      ?auto_267233 - MODE
      ?auto_267234 - DIRECTION
      ?auto_267235 - MODE
      ?auto_267236 - DIRECTION
      ?auto_267237 - MODE
    )
    :vars
    (
      ?auto_267243 - INSTRUMENT
      ?auto_267245 - SATELLITE
      ?auto_267240 - DIRECTION
      ?auto_267244 - INSTRUMENT
      ?auto_267238 - INSTRUMENT
      ?auto_267242 - INSTRUMENT
      ?auto_267241 - INSTRUMENT
      ?auto_267239 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_267243 ?auto_267245 ) ( SUPPORTS ?auto_267243 ?auto_267233 ) ( not ( = ?auto_267232 ?auto_267240 ) ) ( CALIBRATION_TARGET ?auto_267243 ?auto_267240 ) ( not ( = ?auto_267240 ?auto_267231 ) ) ( ON_BOARD ?auto_267244 ?auto_267245 ) ( not ( = ?auto_267232 ?auto_267231 ) ) ( not ( = ?auto_267243 ?auto_267244 ) ) ( SUPPORTS ?auto_267244 ?auto_267230 ) ( CALIBRATION_TARGET ?auto_267244 ?auto_267240 ) ( not ( = ?auto_267240 ?auto_267236 ) ) ( ON_BOARD ?auto_267238 ?auto_267245 ) ( not ( = ?auto_267231 ?auto_267236 ) ) ( not ( = ?auto_267244 ?auto_267238 ) ) ( SUPPORTS ?auto_267238 ?auto_267237 ) ( CALIBRATION_TARGET ?auto_267238 ?auto_267240 ) ( not ( = ?auto_267240 ?auto_267234 ) ) ( ON_BOARD ?auto_267242 ?auto_267245 ) ( not ( = ?auto_267236 ?auto_267234 ) ) ( not ( = ?auto_267238 ?auto_267242 ) ) ( SUPPORTS ?auto_267242 ?auto_267235 ) ( CALIBRATION_TARGET ?auto_267242 ?auto_267240 ) ( not ( = ?auto_267240 ?auto_267228 ) ) ( ON_BOARD ?auto_267241 ?auto_267245 ) ( not ( = ?auto_267234 ?auto_267228 ) ) ( not ( = ?auto_267242 ?auto_267241 ) ) ( SUPPORTS ?auto_267241 ?auto_267229 ) ( CALIBRATION_TARGET ?auto_267241 ?auto_267240 ) ( POWER_AVAIL ?auto_267245 ) ( POINTING ?auto_267245 ?auto_267239 ) ( not ( = ?auto_267240 ?auto_267239 ) ) ( not ( = ?auto_267228 ?auto_267239 ) ) ( not ( = ?auto_267229 ?auto_267235 ) ) ( not ( = ?auto_267234 ?auto_267239 ) ) ( not ( = ?auto_267228 ?auto_267236 ) ) ( not ( = ?auto_267229 ?auto_267237 ) ) ( not ( = ?auto_267235 ?auto_267237 ) ) ( not ( = ?auto_267236 ?auto_267239 ) ) ( not ( = ?auto_267238 ?auto_267241 ) ) ( not ( = ?auto_267228 ?auto_267231 ) ) ( not ( = ?auto_267229 ?auto_267230 ) ) ( not ( = ?auto_267234 ?auto_267231 ) ) ( not ( = ?auto_267235 ?auto_267230 ) ) ( not ( = ?auto_267237 ?auto_267230 ) ) ( not ( = ?auto_267231 ?auto_267239 ) ) ( not ( = ?auto_267244 ?auto_267242 ) ) ( not ( = ?auto_267244 ?auto_267241 ) ) ( not ( = ?auto_267228 ?auto_267232 ) ) ( not ( = ?auto_267229 ?auto_267233 ) ) ( not ( = ?auto_267234 ?auto_267232 ) ) ( not ( = ?auto_267235 ?auto_267233 ) ) ( not ( = ?auto_267236 ?auto_267232 ) ) ( not ( = ?auto_267237 ?auto_267233 ) ) ( not ( = ?auto_267230 ?auto_267233 ) ) ( not ( = ?auto_267232 ?auto_267239 ) ) ( not ( = ?auto_267243 ?auto_267238 ) ) ( not ( = ?auto_267243 ?auto_267242 ) ) ( not ( = ?auto_267243 ?auto_267241 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_267228 ?auto_267229 ?auto_267234 ?auto_267235 ?auto_267236 ?auto_267237 ?auto_267232 ?auto_267233 ?auto_267231 ?auto_267230 )
      ( GET-5IMAGE-VERIFY ?auto_267228 ?auto_267229 ?auto_267231 ?auto_267230 ?auto_267232 ?auto_267233 ?auto_267234 ?auto_267235 ?auto_267236 ?auto_267237 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_267306 - DIRECTION
      ?auto_267307 - MODE
      ?auto_267309 - DIRECTION
      ?auto_267308 - MODE
      ?auto_267310 - DIRECTION
      ?auto_267311 - MODE
      ?auto_267312 - DIRECTION
      ?auto_267313 - MODE
      ?auto_267314 - DIRECTION
      ?auto_267315 - MODE
    )
    :vars
    (
      ?auto_267321 - INSTRUMENT
      ?auto_267323 - SATELLITE
      ?auto_267318 - DIRECTION
      ?auto_267322 - INSTRUMENT
      ?auto_267316 - INSTRUMENT
      ?auto_267320 - INSTRUMENT
      ?auto_267319 - INSTRUMENT
      ?auto_267317 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_267321 ?auto_267323 ) ( SUPPORTS ?auto_267321 ?auto_267311 ) ( not ( = ?auto_267310 ?auto_267318 ) ) ( CALIBRATION_TARGET ?auto_267321 ?auto_267318 ) ( not ( = ?auto_267318 ?auto_267309 ) ) ( ON_BOARD ?auto_267322 ?auto_267323 ) ( not ( = ?auto_267310 ?auto_267309 ) ) ( not ( = ?auto_267321 ?auto_267322 ) ) ( SUPPORTS ?auto_267322 ?auto_267308 ) ( CALIBRATION_TARGET ?auto_267322 ?auto_267318 ) ( not ( = ?auto_267318 ?auto_267312 ) ) ( ON_BOARD ?auto_267316 ?auto_267323 ) ( not ( = ?auto_267309 ?auto_267312 ) ) ( not ( = ?auto_267322 ?auto_267316 ) ) ( SUPPORTS ?auto_267316 ?auto_267313 ) ( CALIBRATION_TARGET ?auto_267316 ?auto_267318 ) ( not ( = ?auto_267318 ?auto_267314 ) ) ( ON_BOARD ?auto_267320 ?auto_267323 ) ( not ( = ?auto_267312 ?auto_267314 ) ) ( not ( = ?auto_267316 ?auto_267320 ) ) ( SUPPORTS ?auto_267320 ?auto_267315 ) ( CALIBRATION_TARGET ?auto_267320 ?auto_267318 ) ( not ( = ?auto_267318 ?auto_267306 ) ) ( ON_BOARD ?auto_267319 ?auto_267323 ) ( not ( = ?auto_267314 ?auto_267306 ) ) ( not ( = ?auto_267320 ?auto_267319 ) ) ( SUPPORTS ?auto_267319 ?auto_267307 ) ( CALIBRATION_TARGET ?auto_267319 ?auto_267318 ) ( POWER_AVAIL ?auto_267323 ) ( POINTING ?auto_267323 ?auto_267317 ) ( not ( = ?auto_267318 ?auto_267317 ) ) ( not ( = ?auto_267306 ?auto_267317 ) ) ( not ( = ?auto_267307 ?auto_267315 ) ) ( not ( = ?auto_267314 ?auto_267317 ) ) ( not ( = ?auto_267306 ?auto_267312 ) ) ( not ( = ?auto_267307 ?auto_267313 ) ) ( not ( = ?auto_267315 ?auto_267313 ) ) ( not ( = ?auto_267312 ?auto_267317 ) ) ( not ( = ?auto_267316 ?auto_267319 ) ) ( not ( = ?auto_267306 ?auto_267309 ) ) ( not ( = ?auto_267307 ?auto_267308 ) ) ( not ( = ?auto_267314 ?auto_267309 ) ) ( not ( = ?auto_267315 ?auto_267308 ) ) ( not ( = ?auto_267313 ?auto_267308 ) ) ( not ( = ?auto_267309 ?auto_267317 ) ) ( not ( = ?auto_267322 ?auto_267320 ) ) ( not ( = ?auto_267322 ?auto_267319 ) ) ( not ( = ?auto_267306 ?auto_267310 ) ) ( not ( = ?auto_267307 ?auto_267311 ) ) ( not ( = ?auto_267314 ?auto_267310 ) ) ( not ( = ?auto_267315 ?auto_267311 ) ) ( not ( = ?auto_267312 ?auto_267310 ) ) ( not ( = ?auto_267313 ?auto_267311 ) ) ( not ( = ?auto_267308 ?auto_267311 ) ) ( not ( = ?auto_267310 ?auto_267317 ) ) ( not ( = ?auto_267321 ?auto_267316 ) ) ( not ( = ?auto_267321 ?auto_267320 ) ) ( not ( = ?auto_267321 ?auto_267319 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_267306 ?auto_267307 ?auto_267314 ?auto_267315 ?auto_267312 ?auto_267313 ?auto_267310 ?auto_267311 ?auto_267309 ?auto_267308 )
      ( GET-5IMAGE-VERIFY ?auto_267306 ?auto_267307 ?auto_267309 ?auto_267308 ?auto_267310 ?auto_267311 ?auto_267312 ?auto_267313 ?auto_267314 ?auto_267315 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_268414 - DIRECTION
      ?auto_268415 - MODE
      ?auto_268417 - DIRECTION
      ?auto_268416 - MODE
      ?auto_268418 - DIRECTION
      ?auto_268419 - MODE
      ?auto_268420 - DIRECTION
      ?auto_268421 - MODE
      ?auto_268422 - DIRECTION
      ?auto_268423 - MODE
    )
    :vars
    (
      ?auto_268429 - INSTRUMENT
      ?auto_268431 - SATELLITE
      ?auto_268426 - DIRECTION
      ?auto_268430 - INSTRUMENT
      ?auto_268424 - INSTRUMENT
      ?auto_268428 - INSTRUMENT
      ?auto_268427 - INSTRUMENT
      ?auto_268425 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_268429 ?auto_268431 ) ( SUPPORTS ?auto_268429 ?auto_268416 ) ( not ( = ?auto_268417 ?auto_268426 ) ) ( CALIBRATION_TARGET ?auto_268429 ?auto_268426 ) ( not ( = ?auto_268426 ?auto_268422 ) ) ( ON_BOARD ?auto_268430 ?auto_268431 ) ( not ( = ?auto_268417 ?auto_268422 ) ) ( not ( = ?auto_268429 ?auto_268430 ) ) ( SUPPORTS ?auto_268430 ?auto_268423 ) ( CALIBRATION_TARGET ?auto_268430 ?auto_268426 ) ( not ( = ?auto_268426 ?auto_268420 ) ) ( ON_BOARD ?auto_268424 ?auto_268431 ) ( not ( = ?auto_268422 ?auto_268420 ) ) ( not ( = ?auto_268430 ?auto_268424 ) ) ( SUPPORTS ?auto_268424 ?auto_268421 ) ( CALIBRATION_TARGET ?auto_268424 ?auto_268426 ) ( not ( = ?auto_268426 ?auto_268418 ) ) ( ON_BOARD ?auto_268428 ?auto_268431 ) ( not ( = ?auto_268420 ?auto_268418 ) ) ( not ( = ?auto_268424 ?auto_268428 ) ) ( SUPPORTS ?auto_268428 ?auto_268419 ) ( CALIBRATION_TARGET ?auto_268428 ?auto_268426 ) ( not ( = ?auto_268426 ?auto_268414 ) ) ( ON_BOARD ?auto_268427 ?auto_268431 ) ( not ( = ?auto_268418 ?auto_268414 ) ) ( not ( = ?auto_268428 ?auto_268427 ) ) ( SUPPORTS ?auto_268427 ?auto_268415 ) ( CALIBRATION_TARGET ?auto_268427 ?auto_268426 ) ( POWER_AVAIL ?auto_268431 ) ( POINTING ?auto_268431 ?auto_268425 ) ( not ( = ?auto_268426 ?auto_268425 ) ) ( not ( = ?auto_268414 ?auto_268425 ) ) ( not ( = ?auto_268415 ?auto_268419 ) ) ( not ( = ?auto_268418 ?auto_268425 ) ) ( not ( = ?auto_268414 ?auto_268420 ) ) ( not ( = ?auto_268415 ?auto_268421 ) ) ( not ( = ?auto_268419 ?auto_268421 ) ) ( not ( = ?auto_268420 ?auto_268425 ) ) ( not ( = ?auto_268424 ?auto_268427 ) ) ( not ( = ?auto_268414 ?auto_268422 ) ) ( not ( = ?auto_268415 ?auto_268423 ) ) ( not ( = ?auto_268418 ?auto_268422 ) ) ( not ( = ?auto_268419 ?auto_268423 ) ) ( not ( = ?auto_268421 ?auto_268423 ) ) ( not ( = ?auto_268422 ?auto_268425 ) ) ( not ( = ?auto_268430 ?auto_268428 ) ) ( not ( = ?auto_268430 ?auto_268427 ) ) ( not ( = ?auto_268414 ?auto_268417 ) ) ( not ( = ?auto_268415 ?auto_268416 ) ) ( not ( = ?auto_268418 ?auto_268417 ) ) ( not ( = ?auto_268419 ?auto_268416 ) ) ( not ( = ?auto_268420 ?auto_268417 ) ) ( not ( = ?auto_268421 ?auto_268416 ) ) ( not ( = ?auto_268423 ?auto_268416 ) ) ( not ( = ?auto_268417 ?auto_268425 ) ) ( not ( = ?auto_268429 ?auto_268424 ) ) ( not ( = ?auto_268429 ?auto_268428 ) ) ( not ( = ?auto_268429 ?auto_268427 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_268414 ?auto_268415 ?auto_268418 ?auto_268419 ?auto_268420 ?auto_268421 ?auto_268417 ?auto_268416 ?auto_268422 ?auto_268423 )
      ( GET-5IMAGE-VERIFY ?auto_268414 ?auto_268415 ?auto_268417 ?auto_268416 ?auto_268418 ?auto_268419 ?auto_268420 ?auto_268421 ?auto_268422 ?auto_268423 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_268492 - DIRECTION
      ?auto_268493 - MODE
      ?auto_268495 - DIRECTION
      ?auto_268494 - MODE
      ?auto_268496 - DIRECTION
      ?auto_268497 - MODE
      ?auto_268498 - DIRECTION
      ?auto_268499 - MODE
      ?auto_268500 - DIRECTION
      ?auto_268501 - MODE
    )
    :vars
    (
      ?auto_268507 - INSTRUMENT
      ?auto_268509 - SATELLITE
      ?auto_268504 - DIRECTION
      ?auto_268508 - INSTRUMENT
      ?auto_268502 - INSTRUMENT
      ?auto_268506 - INSTRUMENT
      ?auto_268505 - INSTRUMENT
      ?auto_268503 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_268507 ?auto_268509 ) ( SUPPORTS ?auto_268507 ?auto_268494 ) ( not ( = ?auto_268495 ?auto_268504 ) ) ( CALIBRATION_TARGET ?auto_268507 ?auto_268504 ) ( not ( = ?auto_268504 ?auto_268498 ) ) ( ON_BOARD ?auto_268508 ?auto_268509 ) ( not ( = ?auto_268495 ?auto_268498 ) ) ( not ( = ?auto_268507 ?auto_268508 ) ) ( SUPPORTS ?auto_268508 ?auto_268499 ) ( CALIBRATION_TARGET ?auto_268508 ?auto_268504 ) ( not ( = ?auto_268504 ?auto_268500 ) ) ( ON_BOARD ?auto_268502 ?auto_268509 ) ( not ( = ?auto_268498 ?auto_268500 ) ) ( not ( = ?auto_268508 ?auto_268502 ) ) ( SUPPORTS ?auto_268502 ?auto_268501 ) ( CALIBRATION_TARGET ?auto_268502 ?auto_268504 ) ( not ( = ?auto_268504 ?auto_268496 ) ) ( ON_BOARD ?auto_268506 ?auto_268509 ) ( not ( = ?auto_268500 ?auto_268496 ) ) ( not ( = ?auto_268502 ?auto_268506 ) ) ( SUPPORTS ?auto_268506 ?auto_268497 ) ( CALIBRATION_TARGET ?auto_268506 ?auto_268504 ) ( not ( = ?auto_268504 ?auto_268492 ) ) ( ON_BOARD ?auto_268505 ?auto_268509 ) ( not ( = ?auto_268496 ?auto_268492 ) ) ( not ( = ?auto_268506 ?auto_268505 ) ) ( SUPPORTS ?auto_268505 ?auto_268493 ) ( CALIBRATION_TARGET ?auto_268505 ?auto_268504 ) ( POWER_AVAIL ?auto_268509 ) ( POINTING ?auto_268509 ?auto_268503 ) ( not ( = ?auto_268504 ?auto_268503 ) ) ( not ( = ?auto_268492 ?auto_268503 ) ) ( not ( = ?auto_268493 ?auto_268497 ) ) ( not ( = ?auto_268496 ?auto_268503 ) ) ( not ( = ?auto_268492 ?auto_268500 ) ) ( not ( = ?auto_268493 ?auto_268501 ) ) ( not ( = ?auto_268497 ?auto_268501 ) ) ( not ( = ?auto_268500 ?auto_268503 ) ) ( not ( = ?auto_268502 ?auto_268505 ) ) ( not ( = ?auto_268492 ?auto_268498 ) ) ( not ( = ?auto_268493 ?auto_268499 ) ) ( not ( = ?auto_268496 ?auto_268498 ) ) ( not ( = ?auto_268497 ?auto_268499 ) ) ( not ( = ?auto_268501 ?auto_268499 ) ) ( not ( = ?auto_268498 ?auto_268503 ) ) ( not ( = ?auto_268508 ?auto_268506 ) ) ( not ( = ?auto_268508 ?auto_268505 ) ) ( not ( = ?auto_268492 ?auto_268495 ) ) ( not ( = ?auto_268493 ?auto_268494 ) ) ( not ( = ?auto_268496 ?auto_268495 ) ) ( not ( = ?auto_268497 ?auto_268494 ) ) ( not ( = ?auto_268500 ?auto_268495 ) ) ( not ( = ?auto_268501 ?auto_268494 ) ) ( not ( = ?auto_268499 ?auto_268494 ) ) ( not ( = ?auto_268495 ?auto_268503 ) ) ( not ( = ?auto_268507 ?auto_268502 ) ) ( not ( = ?auto_268507 ?auto_268506 ) ) ( not ( = ?auto_268507 ?auto_268505 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_268492 ?auto_268493 ?auto_268496 ?auto_268497 ?auto_268500 ?auto_268501 ?auto_268495 ?auto_268494 ?auto_268498 ?auto_268499 )
      ( GET-5IMAGE-VERIFY ?auto_268492 ?auto_268493 ?auto_268495 ?auto_268494 ?auto_268496 ?auto_268497 ?auto_268498 ?auto_268499 ?auto_268500 ?auto_268501 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_268822 - DIRECTION
      ?auto_268823 - MODE
      ?auto_268825 - DIRECTION
      ?auto_268824 - MODE
      ?auto_268826 - DIRECTION
      ?auto_268827 - MODE
      ?auto_268828 - DIRECTION
      ?auto_268829 - MODE
      ?auto_268830 - DIRECTION
      ?auto_268831 - MODE
    )
    :vars
    (
      ?auto_268837 - INSTRUMENT
      ?auto_268839 - SATELLITE
      ?auto_268834 - DIRECTION
      ?auto_268838 - INSTRUMENT
      ?auto_268832 - INSTRUMENT
      ?auto_268836 - INSTRUMENT
      ?auto_268835 - INSTRUMENT
      ?auto_268833 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_268837 ?auto_268839 ) ( SUPPORTS ?auto_268837 ?auto_268824 ) ( not ( = ?auto_268825 ?auto_268834 ) ) ( CALIBRATION_TARGET ?auto_268837 ?auto_268834 ) ( not ( = ?auto_268834 ?auto_268830 ) ) ( ON_BOARD ?auto_268838 ?auto_268839 ) ( not ( = ?auto_268825 ?auto_268830 ) ) ( not ( = ?auto_268837 ?auto_268838 ) ) ( SUPPORTS ?auto_268838 ?auto_268831 ) ( CALIBRATION_TARGET ?auto_268838 ?auto_268834 ) ( not ( = ?auto_268834 ?auto_268826 ) ) ( ON_BOARD ?auto_268832 ?auto_268839 ) ( not ( = ?auto_268830 ?auto_268826 ) ) ( not ( = ?auto_268838 ?auto_268832 ) ) ( SUPPORTS ?auto_268832 ?auto_268827 ) ( CALIBRATION_TARGET ?auto_268832 ?auto_268834 ) ( not ( = ?auto_268834 ?auto_268828 ) ) ( ON_BOARD ?auto_268836 ?auto_268839 ) ( not ( = ?auto_268826 ?auto_268828 ) ) ( not ( = ?auto_268832 ?auto_268836 ) ) ( SUPPORTS ?auto_268836 ?auto_268829 ) ( CALIBRATION_TARGET ?auto_268836 ?auto_268834 ) ( not ( = ?auto_268834 ?auto_268822 ) ) ( ON_BOARD ?auto_268835 ?auto_268839 ) ( not ( = ?auto_268828 ?auto_268822 ) ) ( not ( = ?auto_268836 ?auto_268835 ) ) ( SUPPORTS ?auto_268835 ?auto_268823 ) ( CALIBRATION_TARGET ?auto_268835 ?auto_268834 ) ( POWER_AVAIL ?auto_268839 ) ( POINTING ?auto_268839 ?auto_268833 ) ( not ( = ?auto_268834 ?auto_268833 ) ) ( not ( = ?auto_268822 ?auto_268833 ) ) ( not ( = ?auto_268823 ?auto_268829 ) ) ( not ( = ?auto_268828 ?auto_268833 ) ) ( not ( = ?auto_268822 ?auto_268826 ) ) ( not ( = ?auto_268823 ?auto_268827 ) ) ( not ( = ?auto_268829 ?auto_268827 ) ) ( not ( = ?auto_268826 ?auto_268833 ) ) ( not ( = ?auto_268832 ?auto_268835 ) ) ( not ( = ?auto_268822 ?auto_268830 ) ) ( not ( = ?auto_268823 ?auto_268831 ) ) ( not ( = ?auto_268828 ?auto_268830 ) ) ( not ( = ?auto_268829 ?auto_268831 ) ) ( not ( = ?auto_268827 ?auto_268831 ) ) ( not ( = ?auto_268830 ?auto_268833 ) ) ( not ( = ?auto_268838 ?auto_268836 ) ) ( not ( = ?auto_268838 ?auto_268835 ) ) ( not ( = ?auto_268822 ?auto_268825 ) ) ( not ( = ?auto_268823 ?auto_268824 ) ) ( not ( = ?auto_268828 ?auto_268825 ) ) ( not ( = ?auto_268829 ?auto_268824 ) ) ( not ( = ?auto_268826 ?auto_268825 ) ) ( not ( = ?auto_268827 ?auto_268824 ) ) ( not ( = ?auto_268831 ?auto_268824 ) ) ( not ( = ?auto_268825 ?auto_268833 ) ) ( not ( = ?auto_268837 ?auto_268832 ) ) ( not ( = ?auto_268837 ?auto_268836 ) ) ( not ( = ?auto_268837 ?auto_268835 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_268822 ?auto_268823 ?auto_268828 ?auto_268829 ?auto_268826 ?auto_268827 ?auto_268825 ?auto_268824 ?auto_268830 ?auto_268831 )
      ( GET-5IMAGE-VERIFY ?auto_268822 ?auto_268823 ?auto_268825 ?auto_268824 ?auto_268826 ?auto_268827 ?auto_268828 ?auto_268829 ?auto_268830 ?auto_268831 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_268986 - DIRECTION
      ?auto_268987 - MODE
      ?auto_268989 - DIRECTION
      ?auto_268988 - MODE
      ?auto_268990 - DIRECTION
      ?auto_268991 - MODE
      ?auto_268992 - DIRECTION
      ?auto_268993 - MODE
      ?auto_268994 - DIRECTION
      ?auto_268995 - MODE
    )
    :vars
    (
      ?auto_269001 - INSTRUMENT
      ?auto_269003 - SATELLITE
      ?auto_268998 - DIRECTION
      ?auto_269002 - INSTRUMENT
      ?auto_268996 - INSTRUMENT
      ?auto_269000 - INSTRUMENT
      ?auto_268999 - INSTRUMENT
      ?auto_268997 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_269001 ?auto_269003 ) ( SUPPORTS ?auto_269001 ?auto_268988 ) ( not ( = ?auto_268989 ?auto_268998 ) ) ( CALIBRATION_TARGET ?auto_269001 ?auto_268998 ) ( not ( = ?auto_268998 ?auto_268992 ) ) ( ON_BOARD ?auto_269002 ?auto_269003 ) ( not ( = ?auto_268989 ?auto_268992 ) ) ( not ( = ?auto_269001 ?auto_269002 ) ) ( SUPPORTS ?auto_269002 ?auto_268993 ) ( CALIBRATION_TARGET ?auto_269002 ?auto_268998 ) ( not ( = ?auto_268998 ?auto_268990 ) ) ( ON_BOARD ?auto_268996 ?auto_269003 ) ( not ( = ?auto_268992 ?auto_268990 ) ) ( not ( = ?auto_269002 ?auto_268996 ) ) ( SUPPORTS ?auto_268996 ?auto_268991 ) ( CALIBRATION_TARGET ?auto_268996 ?auto_268998 ) ( not ( = ?auto_268998 ?auto_268994 ) ) ( ON_BOARD ?auto_269000 ?auto_269003 ) ( not ( = ?auto_268990 ?auto_268994 ) ) ( not ( = ?auto_268996 ?auto_269000 ) ) ( SUPPORTS ?auto_269000 ?auto_268995 ) ( CALIBRATION_TARGET ?auto_269000 ?auto_268998 ) ( not ( = ?auto_268998 ?auto_268986 ) ) ( ON_BOARD ?auto_268999 ?auto_269003 ) ( not ( = ?auto_268994 ?auto_268986 ) ) ( not ( = ?auto_269000 ?auto_268999 ) ) ( SUPPORTS ?auto_268999 ?auto_268987 ) ( CALIBRATION_TARGET ?auto_268999 ?auto_268998 ) ( POWER_AVAIL ?auto_269003 ) ( POINTING ?auto_269003 ?auto_268997 ) ( not ( = ?auto_268998 ?auto_268997 ) ) ( not ( = ?auto_268986 ?auto_268997 ) ) ( not ( = ?auto_268987 ?auto_268995 ) ) ( not ( = ?auto_268994 ?auto_268997 ) ) ( not ( = ?auto_268986 ?auto_268990 ) ) ( not ( = ?auto_268987 ?auto_268991 ) ) ( not ( = ?auto_268995 ?auto_268991 ) ) ( not ( = ?auto_268990 ?auto_268997 ) ) ( not ( = ?auto_268996 ?auto_268999 ) ) ( not ( = ?auto_268986 ?auto_268992 ) ) ( not ( = ?auto_268987 ?auto_268993 ) ) ( not ( = ?auto_268994 ?auto_268992 ) ) ( not ( = ?auto_268995 ?auto_268993 ) ) ( not ( = ?auto_268991 ?auto_268993 ) ) ( not ( = ?auto_268992 ?auto_268997 ) ) ( not ( = ?auto_269002 ?auto_269000 ) ) ( not ( = ?auto_269002 ?auto_268999 ) ) ( not ( = ?auto_268986 ?auto_268989 ) ) ( not ( = ?auto_268987 ?auto_268988 ) ) ( not ( = ?auto_268994 ?auto_268989 ) ) ( not ( = ?auto_268995 ?auto_268988 ) ) ( not ( = ?auto_268990 ?auto_268989 ) ) ( not ( = ?auto_268991 ?auto_268988 ) ) ( not ( = ?auto_268993 ?auto_268988 ) ) ( not ( = ?auto_268989 ?auto_268997 ) ) ( not ( = ?auto_269001 ?auto_268996 ) ) ( not ( = ?auto_269001 ?auto_269000 ) ) ( not ( = ?auto_269001 ?auto_268999 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_268986 ?auto_268987 ?auto_268994 ?auto_268995 ?auto_268990 ?auto_268991 ?auto_268989 ?auto_268988 ?auto_268992 ?auto_268993 )
      ( GET-5IMAGE-VERIFY ?auto_268986 ?auto_268987 ?auto_268989 ?auto_268988 ?auto_268990 ?auto_268991 ?auto_268992 ?auto_268993 ?auto_268994 ?auto_268995 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_269316 - DIRECTION
      ?auto_269317 - MODE
      ?auto_269319 - DIRECTION
      ?auto_269318 - MODE
      ?auto_269320 - DIRECTION
      ?auto_269321 - MODE
      ?auto_269322 - DIRECTION
      ?auto_269323 - MODE
      ?auto_269324 - DIRECTION
      ?auto_269325 - MODE
    )
    :vars
    (
      ?auto_269331 - INSTRUMENT
      ?auto_269333 - SATELLITE
      ?auto_269328 - DIRECTION
      ?auto_269332 - INSTRUMENT
      ?auto_269326 - INSTRUMENT
      ?auto_269330 - INSTRUMENT
      ?auto_269329 - INSTRUMENT
      ?auto_269327 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_269331 ?auto_269333 ) ( SUPPORTS ?auto_269331 ?auto_269318 ) ( not ( = ?auto_269319 ?auto_269328 ) ) ( CALIBRATION_TARGET ?auto_269331 ?auto_269328 ) ( not ( = ?auto_269328 ?auto_269320 ) ) ( ON_BOARD ?auto_269332 ?auto_269333 ) ( not ( = ?auto_269319 ?auto_269320 ) ) ( not ( = ?auto_269331 ?auto_269332 ) ) ( SUPPORTS ?auto_269332 ?auto_269321 ) ( CALIBRATION_TARGET ?auto_269332 ?auto_269328 ) ( not ( = ?auto_269328 ?auto_269324 ) ) ( ON_BOARD ?auto_269326 ?auto_269333 ) ( not ( = ?auto_269320 ?auto_269324 ) ) ( not ( = ?auto_269332 ?auto_269326 ) ) ( SUPPORTS ?auto_269326 ?auto_269325 ) ( CALIBRATION_TARGET ?auto_269326 ?auto_269328 ) ( not ( = ?auto_269328 ?auto_269322 ) ) ( ON_BOARD ?auto_269330 ?auto_269333 ) ( not ( = ?auto_269324 ?auto_269322 ) ) ( not ( = ?auto_269326 ?auto_269330 ) ) ( SUPPORTS ?auto_269330 ?auto_269323 ) ( CALIBRATION_TARGET ?auto_269330 ?auto_269328 ) ( not ( = ?auto_269328 ?auto_269316 ) ) ( ON_BOARD ?auto_269329 ?auto_269333 ) ( not ( = ?auto_269322 ?auto_269316 ) ) ( not ( = ?auto_269330 ?auto_269329 ) ) ( SUPPORTS ?auto_269329 ?auto_269317 ) ( CALIBRATION_TARGET ?auto_269329 ?auto_269328 ) ( POWER_AVAIL ?auto_269333 ) ( POINTING ?auto_269333 ?auto_269327 ) ( not ( = ?auto_269328 ?auto_269327 ) ) ( not ( = ?auto_269316 ?auto_269327 ) ) ( not ( = ?auto_269317 ?auto_269323 ) ) ( not ( = ?auto_269322 ?auto_269327 ) ) ( not ( = ?auto_269316 ?auto_269324 ) ) ( not ( = ?auto_269317 ?auto_269325 ) ) ( not ( = ?auto_269323 ?auto_269325 ) ) ( not ( = ?auto_269324 ?auto_269327 ) ) ( not ( = ?auto_269326 ?auto_269329 ) ) ( not ( = ?auto_269316 ?auto_269320 ) ) ( not ( = ?auto_269317 ?auto_269321 ) ) ( not ( = ?auto_269322 ?auto_269320 ) ) ( not ( = ?auto_269323 ?auto_269321 ) ) ( not ( = ?auto_269325 ?auto_269321 ) ) ( not ( = ?auto_269320 ?auto_269327 ) ) ( not ( = ?auto_269332 ?auto_269330 ) ) ( not ( = ?auto_269332 ?auto_269329 ) ) ( not ( = ?auto_269316 ?auto_269319 ) ) ( not ( = ?auto_269317 ?auto_269318 ) ) ( not ( = ?auto_269322 ?auto_269319 ) ) ( not ( = ?auto_269323 ?auto_269318 ) ) ( not ( = ?auto_269324 ?auto_269319 ) ) ( not ( = ?auto_269325 ?auto_269318 ) ) ( not ( = ?auto_269321 ?auto_269318 ) ) ( not ( = ?auto_269319 ?auto_269327 ) ) ( not ( = ?auto_269331 ?auto_269326 ) ) ( not ( = ?auto_269331 ?auto_269330 ) ) ( not ( = ?auto_269331 ?auto_269329 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_269316 ?auto_269317 ?auto_269322 ?auto_269323 ?auto_269324 ?auto_269325 ?auto_269319 ?auto_269318 ?auto_269320 ?auto_269321 )
      ( GET-5IMAGE-VERIFY ?auto_269316 ?auto_269317 ?auto_269319 ?auto_269318 ?auto_269320 ?auto_269321 ?auto_269322 ?auto_269323 ?auto_269324 ?auto_269325 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_269394 - DIRECTION
      ?auto_269395 - MODE
      ?auto_269397 - DIRECTION
      ?auto_269396 - MODE
      ?auto_269398 - DIRECTION
      ?auto_269399 - MODE
      ?auto_269400 - DIRECTION
      ?auto_269401 - MODE
      ?auto_269402 - DIRECTION
      ?auto_269403 - MODE
    )
    :vars
    (
      ?auto_269409 - INSTRUMENT
      ?auto_269411 - SATELLITE
      ?auto_269406 - DIRECTION
      ?auto_269410 - INSTRUMENT
      ?auto_269404 - INSTRUMENT
      ?auto_269408 - INSTRUMENT
      ?auto_269407 - INSTRUMENT
      ?auto_269405 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_269409 ?auto_269411 ) ( SUPPORTS ?auto_269409 ?auto_269396 ) ( not ( = ?auto_269397 ?auto_269406 ) ) ( CALIBRATION_TARGET ?auto_269409 ?auto_269406 ) ( not ( = ?auto_269406 ?auto_269398 ) ) ( ON_BOARD ?auto_269410 ?auto_269411 ) ( not ( = ?auto_269397 ?auto_269398 ) ) ( not ( = ?auto_269409 ?auto_269410 ) ) ( SUPPORTS ?auto_269410 ?auto_269399 ) ( CALIBRATION_TARGET ?auto_269410 ?auto_269406 ) ( not ( = ?auto_269406 ?auto_269400 ) ) ( ON_BOARD ?auto_269404 ?auto_269411 ) ( not ( = ?auto_269398 ?auto_269400 ) ) ( not ( = ?auto_269410 ?auto_269404 ) ) ( SUPPORTS ?auto_269404 ?auto_269401 ) ( CALIBRATION_TARGET ?auto_269404 ?auto_269406 ) ( not ( = ?auto_269406 ?auto_269402 ) ) ( ON_BOARD ?auto_269408 ?auto_269411 ) ( not ( = ?auto_269400 ?auto_269402 ) ) ( not ( = ?auto_269404 ?auto_269408 ) ) ( SUPPORTS ?auto_269408 ?auto_269403 ) ( CALIBRATION_TARGET ?auto_269408 ?auto_269406 ) ( not ( = ?auto_269406 ?auto_269394 ) ) ( ON_BOARD ?auto_269407 ?auto_269411 ) ( not ( = ?auto_269402 ?auto_269394 ) ) ( not ( = ?auto_269408 ?auto_269407 ) ) ( SUPPORTS ?auto_269407 ?auto_269395 ) ( CALIBRATION_TARGET ?auto_269407 ?auto_269406 ) ( POWER_AVAIL ?auto_269411 ) ( POINTING ?auto_269411 ?auto_269405 ) ( not ( = ?auto_269406 ?auto_269405 ) ) ( not ( = ?auto_269394 ?auto_269405 ) ) ( not ( = ?auto_269395 ?auto_269403 ) ) ( not ( = ?auto_269402 ?auto_269405 ) ) ( not ( = ?auto_269394 ?auto_269400 ) ) ( not ( = ?auto_269395 ?auto_269401 ) ) ( not ( = ?auto_269403 ?auto_269401 ) ) ( not ( = ?auto_269400 ?auto_269405 ) ) ( not ( = ?auto_269404 ?auto_269407 ) ) ( not ( = ?auto_269394 ?auto_269398 ) ) ( not ( = ?auto_269395 ?auto_269399 ) ) ( not ( = ?auto_269402 ?auto_269398 ) ) ( not ( = ?auto_269403 ?auto_269399 ) ) ( not ( = ?auto_269401 ?auto_269399 ) ) ( not ( = ?auto_269398 ?auto_269405 ) ) ( not ( = ?auto_269410 ?auto_269408 ) ) ( not ( = ?auto_269410 ?auto_269407 ) ) ( not ( = ?auto_269394 ?auto_269397 ) ) ( not ( = ?auto_269395 ?auto_269396 ) ) ( not ( = ?auto_269402 ?auto_269397 ) ) ( not ( = ?auto_269403 ?auto_269396 ) ) ( not ( = ?auto_269400 ?auto_269397 ) ) ( not ( = ?auto_269401 ?auto_269396 ) ) ( not ( = ?auto_269399 ?auto_269396 ) ) ( not ( = ?auto_269397 ?auto_269405 ) ) ( not ( = ?auto_269409 ?auto_269404 ) ) ( not ( = ?auto_269409 ?auto_269408 ) ) ( not ( = ?auto_269409 ?auto_269407 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_269394 ?auto_269395 ?auto_269402 ?auto_269403 ?auto_269400 ?auto_269401 ?auto_269397 ?auto_269396 ?auto_269398 ?auto_269399 )
      ( GET-5IMAGE-VERIFY ?auto_269394 ?auto_269395 ?auto_269397 ?auto_269396 ?auto_269398 ?auto_269399 ?auto_269400 ?auto_269401 ?auto_269402 ?auto_269403 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_270670 - DIRECTION
      ?auto_270671 - MODE
      ?auto_270673 - DIRECTION
      ?auto_270672 - MODE
      ?auto_270674 - DIRECTION
      ?auto_270675 - MODE
      ?auto_270676 - DIRECTION
      ?auto_270677 - MODE
      ?auto_270678 - DIRECTION
      ?auto_270679 - MODE
    )
    :vars
    (
      ?auto_270685 - INSTRUMENT
      ?auto_270687 - SATELLITE
      ?auto_270682 - DIRECTION
      ?auto_270686 - INSTRUMENT
      ?auto_270680 - INSTRUMENT
      ?auto_270684 - INSTRUMENT
      ?auto_270683 - INSTRUMENT
      ?auto_270681 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_270685 ?auto_270687 ) ( SUPPORTS ?auto_270685 ?auto_270679 ) ( not ( = ?auto_270678 ?auto_270682 ) ) ( CALIBRATION_TARGET ?auto_270685 ?auto_270682 ) ( not ( = ?auto_270682 ?auto_270676 ) ) ( ON_BOARD ?auto_270686 ?auto_270687 ) ( not ( = ?auto_270678 ?auto_270676 ) ) ( not ( = ?auto_270685 ?auto_270686 ) ) ( SUPPORTS ?auto_270686 ?auto_270677 ) ( CALIBRATION_TARGET ?auto_270686 ?auto_270682 ) ( not ( = ?auto_270682 ?auto_270674 ) ) ( ON_BOARD ?auto_270680 ?auto_270687 ) ( not ( = ?auto_270676 ?auto_270674 ) ) ( not ( = ?auto_270686 ?auto_270680 ) ) ( SUPPORTS ?auto_270680 ?auto_270675 ) ( CALIBRATION_TARGET ?auto_270680 ?auto_270682 ) ( not ( = ?auto_270682 ?auto_270670 ) ) ( ON_BOARD ?auto_270684 ?auto_270687 ) ( not ( = ?auto_270674 ?auto_270670 ) ) ( not ( = ?auto_270680 ?auto_270684 ) ) ( SUPPORTS ?auto_270684 ?auto_270671 ) ( CALIBRATION_TARGET ?auto_270684 ?auto_270682 ) ( not ( = ?auto_270682 ?auto_270673 ) ) ( ON_BOARD ?auto_270683 ?auto_270687 ) ( not ( = ?auto_270670 ?auto_270673 ) ) ( not ( = ?auto_270684 ?auto_270683 ) ) ( SUPPORTS ?auto_270683 ?auto_270672 ) ( CALIBRATION_TARGET ?auto_270683 ?auto_270682 ) ( POWER_AVAIL ?auto_270687 ) ( POINTING ?auto_270687 ?auto_270681 ) ( not ( = ?auto_270682 ?auto_270681 ) ) ( not ( = ?auto_270673 ?auto_270681 ) ) ( not ( = ?auto_270672 ?auto_270671 ) ) ( not ( = ?auto_270670 ?auto_270681 ) ) ( not ( = ?auto_270673 ?auto_270674 ) ) ( not ( = ?auto_270672 ?auto_270675 ) ) ( not ( = ?auto_270671 ?auto_270675 ) ) ( not ( = ?auto_270674 ?auto_270681 ) ) ( not ( = ?auto_270680 ?auto_270683 ) ) ( not ( = ?auto_270673 ?auto_270676 ) ) ( not ( = ?auto_270672 ?auto_270677 ) ) ( not ( = ?auto_270670 ?auto_270676 ) ) ( not ( = ?auto_270671 ?auto_270677 ) ) ( not ( = ?auto_270675 ?auto_270677 ) ) ( not ( = ?auto_270676 ?auto_270681 ) ) ( not ( = ?auto_270686 ?auto_270684 ) ) ( not ( = ?auto_270686 ?auto_270683 ) ) ( not ( = ?auto_270673 ?auto_270678 ) ) ( not ( = ?auto_270672 ?auto_270679 ) ) ( not ( = ?auto_270670 ?auto_270678 ) ) ( not ( = ?auto_270671 ?auto_270679 ) ) ( not ( = ?auto_270674 ?auto_270678 ) ) ( not ( = ?auto_270675 ?auto_270679 ) ) ( not ( = ?auto_270677 ?auto_270679 ) ) ( not ( = ?auto_270678 ?auto_270681 ) ) ( not ( = ?auto_270685 ?auto_270680 ) ) ( not ( = ?auto_270685 ?auto_270684 ) ) ( not ( = ?auto_270685 ?auto_270683 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_270673 ?auto_270672 ?auto_270670 ?auto_270671 ?auto_270674 ?auto_270675 ?auto_270678 ?auto_270679 ?auto_270676 ?auto_270677 )
      ( GET-5IMAGE-VERIFY ?auto_270670 ?auto_270671 ?auto_270673 ?auto_270672 ?auto_270674 ?auto_270675 ?auto_270676 ?auto_270677 ?auto_270678 ?auto_270679 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_270748 - DIRECTION
      ?auto_270749 - MODE
      ?auto_270751 - DIRECTION
      ?auto_270750 - MODE
      ?auto_270752 - DIRECTION
      ?auto_270753 - MODE
      ?auto_270754 - DIRECTION
      ?auto_270755 - MODE
      ?auto_270756 - DIRECTION
      ?auto_270757 - MODE
    )
    :vars
    (
      ?auto_270763 - INSTRUMENT
      ?auto_270765 - SATELLITE
      ?auto_270760 - DIRECTION
      ?auto_270764 - INSTRUMENT
      ?auto_270758 - INSTRUMENT
      ?auto_270762 - INSTRUMENT
      ?auto_270761 - INSTRUMENT
      ?auto_270759 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_270763 ?auto_270765 ) ( SUPPORTS ?auto_270763 ?auto_270755 ) ( not ( = ?auto_270754 ?auto_270760 ) ) ( CALIBRATION_TARGET ?auto_270763 ?auto_270760 ) ( not ( = ?auto_270760 ?auto_270756 ) ) ( ON_BOARD ?auto_270764 ?auto_270765 ) ( not ( = ?auto_270754 ?auto_270756 ) ) ( not ( = ?auto_270763 ?auto_270764 ) ) ( SUPPORTS ?auto_270764 ?auto_270757 ) ( CALIBRATION_TARGET ?auto_270764 ?auto_270760 ) ( not ( = ?auto_270760 ?auto_270752 ) ) ( ON_BOARD ?auto_270758 ?auto_270765 ) ( not ( = ?auto_270756 ?auto_270752 ) ) ( not ( = ?auto_270764 ?auto_270758 ) ) ( SUPPORTS ?auto_270758 ?auto_270753 ) ( CALIBRATION_TARGET ?auto_270758 ?auto_270760 ) ( not ( = ?auto_270760 ?auto_270748 ) ) ( ON_BOARD ?auto_270762 ?auto_270765 ) ( not ( = ?auto_270752 ?auto_270748 ) ) ( not ( = ?auto_270758 ?auto_270762 ) ) ( SUPPORTS ?auto_270762 ?auto_270749 ) ( CALIBRATION_TARGET ?auto_270762 ?auto_270760 ) ( not ( = ?auto_270760 ?auto_270751 ) ) ( ON_BOARD ?auto_270761 ?auto_270765 ) ( not ( = ?auto_270748 ?auto_270751 ) ) ( not ( = ?auto_270762 ?auto_270761 ) ) ( SUPPORTS ?auto_270761 ?auto_270750 ) ( CALIBRATION_TARGET ?auto_270761 ?auto_270760 ) ( POWER_AVAIL ?auto_270765 ) ( POINTING ?auto_270765 ?auto_270759 ) ( not ( = ?auto_270760 ?auto_270759 ) ) ( not ( = ?auto_270751 ?auto_270759 ) ) ( not ( = ?auto_270750 ?auto_270749 ) ) ( not ( = ?auto_270748 ?auto_270759 ) ) ( not ( = ?auto_270751 ?auto_270752 ) ) ( not ( = ?auto_270750 ?auto_270753 ) ) ( not ( = ?auto_270749 ?auto_270753 ) ) ( not ( = ?auto_270752 ?auto_270759 ) ) ( not ( = ?auto_270758 ?auto_270761 ) ) ( not ( = ?auto_270751 ?auto_270756 ) ) ( not ( = ?auto_270750 ?auto_270757 ) ) ( not ( = ?auto_270748 ?auto_270756 ) ) ( not ( = ?auto_270749 ?auto_270757 ) ) ( not ( = ?auto_270753 ?auto_270757 ) ) ( not ( = ?auto_270756 ?auto_270759 ) ) ( not ( = ?auto_270764 ?auto_270762 ) ) ( not ( = ?auto_270764 ?auto_270761 ) ) ( not ( = ?auto_270751 ?auto_270754 ) ) ( not ( = ?auto_270750 ?auto_270755 ) ) ( not ( = ?auto_270748 ?auto_270754 ) ) ( not ( = ?auto_270749 ?auto_270755 ) ) ( not ( = ?auto_270752 ?auto_270754 ) ) ( not ( = ?auto_270753 ?auto_270755 ) ) ( not ( = ?auto_270757 ?auto_270755 ) ) ( not ( = ?auto_270754 ?auto_270759 ) ) ( not ( = ?auto_270763 ?auto_270758 ) ) ( not ( = ?auto_270763 ?auto_270762 ) ) ( not ( = ?auto_270763 ?auto_270761 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_270751 ?auto_270750 ?auto_270748 ?auto_270749 ?auto_270752 ?auto_270753 ?auto_270754 ?auto_270755 ?auto_270756 ?auto_270757 )
      ( GET-5IMAGE-VERIFY ?auto_270748 ?auto_270749 ?auto_270751 ?auto_270750 ?auto_270752 ?auto_270753 ?auto_270754 ?auto_270755 ?auto_270756 ?auto_270757 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_270826 - DIRECTION
      ?auto_270827 - MODE
      ?auto_270829 - DIRECTION
      ?auto_270828 - MODE
      ?auto_270830 - DIRECTION
      ?auto_270831 - MODE
      ?auto_270832 - DIRECTION
      ?auto_270833 - MODE
      ?auto_270834 - DIRECTION
      ?auto_270835 - MODE
    )
    :vars
    (
      ?auto_270841 - INSTRUMENT
      ?auto_270843 - SATELLITE
      ?auto_270838 - DIRECTION
      ?auto_270842 - INSTRUMENT
      ?auto_270836 - INSTRUMENT
      ?auto_270840 - INSTRUMENT
      ?auto_270839 - INSTRUMENT
      ?auto_270837 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_270841 ?auto_270843 ) ( SUPPORTS ?auto_270841 ?auto_270835 ) ( not ( = ?auto_270834 ?auto_270838 ) ) ( CALIBRATION_TARGET ?auto_270841 ?auto_270838 ) ( not ( = ?auto_270838 ?auto_270830 ) ) ( ON_BOARD ?auto_270842 ?auto_270843 ) ( not ( = ?auto_270834 ?auto_270830 ) ) ( not ( = ?auto_270841 ?auto_270842 ) ) ( SUPPORTS ?auto_270842 ?auto_270831 ) ( CALIBRATION_TARGET ?auto_270842 ?auto_270838 ) ( not ( = ?auto_270838 ?auto_270832 ) ) ( ON_BOARD ?auto_270836 ?auto_270843 ) ( not ( = ?auto_270830 ?auto_270832 ) ) ( not ( = ?auto_270842 ?auto_270836 ) ) ( SUPPORTS ?auto_270836 ?auto_270833 ) ( CALIBRATION_TARGET ?auto_270836 ?auto_270838 ) ( not ( = ?auto_270838 ?auto_270826 ) ) ( ON_BOARD ?auto_270840 ?auto_270843 ) ( not ( = ?auto_270832 ?auto_270826 ) ) ( not ( = ?auto_270836 ?auto_270840 ) ) ( SUPPORTS ?auto_270840 ?auto_270827 ) ( CALIBRATION_TARGET ?auto_270840 ?auto_270838 ) ( not ( = ?auto_270838 ?auto_270829 ) ) ( ON_BOARD ?auto_270839 ?auto_270843 ) ( not ( = ?auto_270826 ?auto_270829 ) ) ( not ( = ?auto_270840 ?auto_270839 ) ) ( SUPPORTS ?auto_270839 ?auto_270828 ) ( CALIBRATION_TARGET ?auto_270839 ?auto_270838 ) ( POWER_AVAIL ?auto_270843 ) ( POINTING ?auto_270843 ?auto_270837 ) ( not ( = ?auto_270838 ?auto_270837 ) ) ( not ( = ?auto_270829 ?auto_270837 ) ) ( not ( = ?auto_270828 ?auto_270827 ) ) ( not ( = ?auto_270826 ?auto_270837 ) ) ( not ( = ?auto_270829 ?auto_270832 ) ) ( not ( = ?auto_270828 ?auto_270833 ) ) ( not ( = ?auto_270827 ?auto_270833 ) ) ( not ( = ?auto_270832 ?auto_270837 ) ) ( not ( = ?auto_270836 ?auto_270839 ) ) ( not ( = ?auto_270829 ?auto_270830 ) ) ( not ( = ?auto_270828 ?auto_270831 ) ) ( not ( = ?auto_270826 ?auto_270830 ) ) ( not ( = ?auto_270827 ?auto_270831 ) ) ( not ( = ?auto_270833 ?auto_270831 ) ) ( not ( = ?auto_270830 ?auto_270837 ) ) ( not ( = ?auto_270842 ?auto_270840 ) ) ( not ( = ?auto_270842 ?auto_270839 ) ) ( not ( = ?auto_270829 ?auto_270834 ) ) ( not ( = ?auto_270828 ?auto_270835 ) ) ( not ( = ?auto_270826 ?auto_270834 ) ) ( not ( = ?auto_270827 ?auto_270835 ) ) ( not ( = ?auto_270832 ?auto_270834 ) ) ( not ( = ?auto_270833 ?auto_270835 ) ) ( not ( = ?auto_270831 ?auto_270835 ) ) ( not ( = ?auto_270834 ?auto_270837 ) ) ( not ( = ?auto_270841 ?auto_270836 ) ) ( not ( = ?auto_270841 ?auto_270840 ) ) ( not ( = ?auto_270841 ?auto_270839 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_270829 ?auto_270828 ?auto_270826 ?auto_270827 ?auto_270832 ?auto_270833 ?auto_270834 ?auto_270835 ?auto_270830 ?auto_270831 )
      ( GET-5IMAGE-VERIFY ?auto_270826 ?auto_270827 ?auto_270829 ?auto_270828 ?auto_270830 ?auto_270831 ?auto_270832 ?auto_270833 ?auto_270834 ?auto_270835 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_270904 - DIRECTION
      ?auto_270905 - MODE
      ?auto_270907 - DIRECTION
      ?auto_270906 - MODE
      ?auto_270908 - DIRECTION
      ?auto_270909 - MODE
      ?auto_270910 - DIRECTION
      ?auto_270911 - MODE
      ?auto_270912 - DIRECTION
      ?auto_270913 - MODE
    )
    :vars
    (
      ?auto_270919 - INSTRUMENT
      ?auto_270921 - SATELLITE
      ?auto_270916 - DIRECTION
      ?auto_270920 - INSTRUMENT
      ?auto_270914 - INSTRUMENT
      ?auto_270918 - INSTRUMENT
      ?auto_270917 - INSTRUMENT
      ?auto_270915 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_270919 ?auto_270921 ) ( SUPPORTS ?auto_270919 ?auto_270911 ) ( not ( = ?auto_270910 ?auto_270916 ) ) ( CALIBRATION_TARGET ?auto_270919 ?auto_270916 ) ( not ( = ?auto_270916 ?auto_270908 ) ) ( ON_BOARD ?auto_270920 ?auto_270921 ) ( not ( = ?auto_270910 ?auto_270908 ) ) ( not ( = ?auto_270919 ?auto_270920 ) ) ( SUPPORTS ?auto_270920 ?auto_270909 ) ( CALIBRATION_TARGET ?auto_270920 ?auto_270916 ) ( not ( = ?auto_270916 ?auto_270912 ) ) ( ON_BOARD ?auto_270914 ?auto_270921 ) ( not ( = ?auto_270908 ?auto_270912 ) ) ( not ( = ?auto_270920 ?auto_270914 ) ) ( SUPPORTS ?auto_270914 ?auto_270913 ) ( CALIBRATION_TARGET ?auto_270914 ?auto_270916 ) ( not ( = ?auto_270916 ?auto_270904 ) ) ( ON_BOARD ?auto_270918 ?auto_270921 ) ( not ( = ?auto_270912 ?auto_270904 ) ) ( not ( = ?auto_270914 ?auto_270918 ) ) ( SUPPORTS ?auto_270918 ?auto_270905 ) ( CALIBRATION_TARGET ?auto_270918 ?auto_270916 ) ( not ( = ?auto_270916 ?auto_270907 ) ) ( ON_BOARD ?auto_270917 ?auto_270921 ) ( not ( = ?auto_270904 ?auto_270907 ) ) ( not ( = ?auto_270918 ?auto_270917 ) ) ( SUPPORTS ?auto_270917 ?auto_270906 ) ( CALIBRATION_TARGET ?auto_270917 ?auto_270916 ) ( POWER_AVAIL ?auto_270921 ) ( POINTING ?auto_270921 ?auto_270915 ) ( not ( = ?auto_270916 ?auto_270915 ) ) ( not ( = ?auto_270907 ?auto_270915 ) ) ( not ( = ?auto_270906 ?auto_270905 ) ) ( not ( = ?auto_270904 ?auto_270915 ) ) ( not ( = ?auto_270907 ?auto_270912 ) ) ( not ( = ?auto_270906 ?auto_270913 ) ) ( not ( = ?auto_270905 ?auto_270913 ) ) ( not ( = ?auto_270912 ?auto_270915 ) ) ( not ( = ?auto_270914 ?auto_270917 ) ) ( not ( = ?auto_270907 ?auto_270908 ) ) ( not ( = ?auto_270906 ?auto_270909 ) ) ( not ( = ?auto_270904 ?auto_270908 ) ) ( not ( = ?auto_270905 ?auto_270909 ) ) ( not ( = ?auto_270913 ?auto_270909 ) ) ( not ( = ?auto_270908 ?auto_270915 ) ) ( not ( = ?auto_270920 ?auto_270918 ) ) ( not ( = ?auto_270920 ?auto_270917 ) ) ( not ( = ?auto_270907 ?auto_270910 ) ) ( not ( = ?auto_270906 ?auto_270911 ) ) ( not ( = ?auto_270904 ?auto_270910 ) ) ( not ( = ?auto_270905 ?auto_270911 ) ) ( not ( = ?auto_270912 ?auto_270910 ) ) ( not ( = ?auto_270913 ?auto_270911 ) ) ( not ( = ?auto_270909 ?auto_270911 ) ) ( not ( = ?auto_270910 ?auto_270915 ) ) ( not ( = ?auto_270919 ?auto_270914 ) ) ( not ( = ?auto_270919 ?auto_270918 ) ) ( not ( = ?auto_270919 ?auto_270917 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_270907 ?auto_270906 ?auto_270904 ?auto_270905 ?auto_270912 ?auto_270913 ?auto_270910 ?auto_270911 ?auto_270908 ?auto_270909 )
      ( GET-5IMAGE-VERIFY ?auto_270904 ?auto_270905 ?auto_270907 ?auto_270906 ?auto_270908 ?auto_270909 ?auto_270910 ?auto_270911 ?auto_270912 ?auto_270913 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_271234 - DIRECTION
      ?auto_271235 - MODE
      ?auto_271237 - DIRECTION
      ?auto_271236 - MODE
      ?auto_271238 - DIRECTION
      ?auto_271239 - MODE
      ?auto_271240 - DIRECTION
      ?auto_271241 - MODE
      ?auto_271242 - DIRECTION
      ?auto_271243 - MODE
    )
    :vars
    (
      ?auto_271249 - INSTRUMENT
      ?auto_271251 - SATELLITE
      ?auto_271246 - DIRECTION
      ?auto_271250 - INSTRUMENT
      ?auto_271244 - INSTRUMENT
      ?auto_271248 - INSTRUMENT
      ?auto_271247 - INSTRUMENT
      ?auto_271245 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_271249 ?auto_271251 ) ( SUPPORTS ?auto_271249 ?auto_271239 ) ( not ( = ?auto_271238 ?auto_271246 ) ) ( CALIBRATION_TARGET ?auto_271249 ?auto_271246 ) ( not ( = ?auto_271246 ?auto_271242 ) ) ( ON_BOARD ?auto_271250 ?auto_271251 ) ( not ( = ?auto_271238 ?auto_271242 ) ) ( not ( = ?auto_271249 ?auto_271250 ) ) ( SUPPORTS ?auto_271250 ?auto_271243 ) ( CALIBRATION_TARGET ?auto_271250 ?auto_271246 ) ( not ( = ?auto_271246 ?auto_271240 ) ) ( ON_BOARD ?auto_271244 ?auto_271251 ) ( not ( = ?auto_271242 ?auto_271240 ) ) ( not ( = ?auto_271250 ?auto_271244 ) ) ( SUPPORTS ?auto_271244 ?auto_271241 ) ( CALIBRATION_TARGET ?auto_271244 ?auto_271246 ) ( not ( = ?auto_271246 ?auto_271234 ) ) ( ON_BOARD ?auto_271248 ?auto_271251 ) ( not ( = ?auto_271240 ?auto_271234 ) ) ( not ( = ?auto_271244 ?auto_271248 ) ) ( SUPPORTS ?auto_271248 ?auto_271235 ) ( CALIBRATION_TARGET ?auto_271248 ?auto_271246 ) ( not ( = ?auto_271246 ?auto_271237 ) ) ( ON_BOARD ?auto_271247 ?auto_271251 ) ( not ( = ?auto_271234 ?auto_271237 ) ) ( not ( = ?auto_271248 ?auto_271247 ) ) ( SUPPORTS ?auto_271247 ?auto_271236 ) ( CALIBRATION_TARGET ?auto_271247 ?auto_271246 ) ( POWER_AVAIL ?auto_271251 ) ( POINTING ?auto_271251 ?auto_271245 ) ( not ( = ?auto_271246 ?auto_271245 ) ) ( not ( = ?auto_271237 ?auto_271245 ) ) ( not ( = ?auto_271236 ?auto_271235 ) ) ( not ( = ?auto_271234 ?auto_271245 ) ) ( not ( = ?auto_271237 ?auto_271240 ) ) ( not ( = ?auto_271236 ?auto_271241 ) ) ( not ( = ?auto_271235 ?auto_271241 ) ) ( not ( = ?auto_271240 ?auto_271245 ) ) ( not ( = ?auto_271244 ?auto_271247 ) ) ( not ( = ?auto_271237 ?auto_271242 ) ) ( not ( = ?auto_271236 ?auto_271243 ) ) ( not ( = ?auto_271234 ?auto_271242 ) ) ( not ( = ?auto_271235 ?auto_271243 ) ) ( not ( = ?auto_271241 ?auto_271243 ) ) ( not ( = ?auto_271242 ?auto_271245 ) ) ( not ( = ?auto_271250 ?auto_271248 ) ) ( not ( = ?auto_271250 ?auto_271247 ) ) ( not ( = ?auto_271237 ?auto_271238 ) ) ( not ( = ?auto_271236 ?auto_271239 ) ) ( not ( = ?auto_271234 ?auto_271238 ) ) ( not ( = ?auto_271235 ?auto_271239 ) ) ( not ( = ?auto_271240 ?auto_271238 ) ) ( not ( = ?auto_271241 ?auto_271239 ) ) ( not ( = ?auto_271243 ?auto_271239 ) ) ( not ( = ?auto_271238 ?auto_271245 ) ) ( not ( = ?auto_271249 ?auto_271244 ) ) ( not ( = ?auto_271249 ?auto_271248 ) ) ( not ( = ?auto_271249 ?auto_271247 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_271237 ?auto_271236 ?auto_271234 ?auto_271235 ?auto_271240 ?auto_271241 ?auto_271238 ?auto_271239 ?auto_271242 ?auto_271243 )
      ( GET-5IMAGE-VERIFY ?auto_271234 ?auto_271235 ?auto_271237 ?auto_271236 ?auto_271238 ?auto_271239 ?auto_271240 ?auto_271241 ?auto_271242 ?auto_271243 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_271312 - DIRECTION
      ?auto_271313 - MODE
      ?auto_271315 - DIRECTION
      ?auto_271314 - MODE
      ?auto_271316 - DIRECTION
      ?auto_271317 - MODE
      ?auto_271318 - DIRECTION
      ?auto_271319 - MODE
      ?auto_271320 - DIRECTION
      ?auto_271321 - MODE
    )
    :vars
    (
      ?auto_271327 - INSTRUMENT
      ?auto_271329 - SATELLITE
      ?auto_271324 - DIRECTION
      ?auto_271328 - INSTRUMENT
      ?auto_271322 - INSTRUMENT
      ?auto_271326 - INSTRUMENT
      ?auto_271325 - INSTRUMENT
      ?auto_271323 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_271327 ?auto_271329 ) ( SUPPORTS ?auto_271327 ?auto_271317 ) ( not ( = ?auto_271316 ?auto_271324 ) ) ( CALIBRATION_TARGET ?auto_271327 ?auto_271324 ) ( not ( = ?auto_271324 ?auto_271318 ) ) ( ON_BOARD ?auto_271328 ?auto_271329 ) ( not ( = ?auto_271316 ?auto_271318 ) ) ( not ( = ?auto_271327 ?auto_271328 ) ) ( SUPPORTS ?auto_271328 ?auto_271319 ) ( CALIBRATION_TARGET ?auto_271328 ?auto_271324 ) ( not ( = ?auto_271324 ?auto_271320 ) ) ( ON_BOARD ?auto_271322 ?auto_271329 ) ( not ( = ?auto_271318 ?auto_271320 ) ) ( not ( = ?auto_271328 ?auto_271322 ) ) ( SUPPORTS ?auto_271322 ?auto_271321 ) ( CALIBRATION_TARGET ?auto_271322 ?auto_271324 ) ( not ( = ?auto_271324 ?auto_271312 ) ) ( ON_BOARD ?auto_271326 ?auto_271329 ) ( not ( = ?auto_271320 ?auto_271312 ) ) ( not ( = ?auto_271322 ?auto_271326 ) ) ( SUPPORTS ?auto_271326 ?auto_271313 ) ( CALIBRATION_TARGET ?auto_271326 ?auto_271324 ) ( not ( = ?auto_271324 ?auto_271315 ) ) ( ON_BOARD ?auto_271325 ?auto_271329 ) ( not ( = ?auto_271312 ?auto_271315 ) ) ( not ( = ?auto_271326 ?auto_271325 ) ) ( SUPPORTS ?auto_271325 ?auto_271314 ) ( CALIBRATION_TARGET ?auto_271325 ?auto_271324 ) ( POWER_AVAIL ?auto_271329 ) ( POINTING ?auto_271329 ?auto_271323 ) ( not ( = ?auto_271324 ?auto_271323 ) ) ( not ( = ?auto_271315 ?auto_271323 ) ) ( not ( = ?auto_271314 ?auto_271313 ) ) ( not ( = ?auto_271312 ?auto_271323 ) ) ( not ( = ?auto_271315 ?auto_271320 ) ) ( not ( = ?auto_271314 ?auto_271321 ) ) ( not ( = ?auto_271313 ?auto_271321 ) ) ( not ( = ?auto_271320 ?auto_271323 ) ) ( not ( = ?auto_271322 ?auto_271325 ) ) ( not ( = ?auto_271315 ?auto_271318 ) ) ( not ( = ?auto_271314 ?auto_271319 ) ) ( not ( = ?auto_271312 ?auto_271318 ) ) ( not ( = ?auto_271313 ?auto_271319 ) ) ( not ( = ?auto_271321 ?auto_271319 ) ) ( not ( = ?auto_271318 ?auto_271323 ) ) ( not ( = ?auto_271328 ?auto_271326 ) ) ( not ( = ?auto_271328 ?auto_271325 ) ) ( not ( = ?auto_271315 ?auto_271316 ) ) ( not ( = ?auto_271314 ?auto_271317 ) ) ( not ( = ?auto_271312 ?auto_271316 ) ) ( not ( = ?auto_271313 ?auto_271317 ) ) ( not ( = ?auto_271320 ?auto_271316 ) ) ( not ( = ?auto_271321 ?auto_271317 ) ) ( not ( = ?auto_271319 ?auto_271317 ) ) ( not ( = ?auto_271316 ?auto_271323 ) ) ( not ( = ?auto_271327 ?auto_271322 ) ) ( not ( = ?auto_271327 ?auto_271326 ) ) ( not ( = ?auto_271327 ?auto_271325 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_271315 ?auto_271314 ?auto_271312 ?auto_271313 ?auto_271320 ?auto_271321 ?auto_271316 ?auto_271317 ?auto_271318 ?auto_271319 )
      ( GET-5IMAGE-VERIFY ?auto_271312 ?auto_271313 ?auto_271315 ?auto_271314 ?auto_271316 ?auto_271317 ?auto_271318 ?auto_271319 ?auto_271320 ?auto_271321 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_272856 - DIRECTION
      ?auto_272857 - MODE
      ?auto_272859 - DIRECTION
      ?auto_272858 - MODE
      ?auto_272860 - DIRECTION
      ?auto_272861 - MODE
      ?auto_272862 - DIRECTION
      ?auto_272863 - MODE
      ?auto_272864 - DIRECTION
      ?auto_272865 - MODE
    )
    :vars
    (
      ?auto_272871 - INSTRUMENT
      ?auto_272873 - SATELLITE
      ?auto_272868 - DIRECTION
      ?auto_272872 - INSTRUMENT
      ?auto_272866 - INSTRUMENT
      ?auto_272870 - INSTRUMENT
      ?auto_272869 - INSTRUMENT
      ?auto_272867 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_272871 ?auto_272873 ) ( SUPPORTS ?auto_272871 ?auto_272865 ) ( not ( = ?auto_272864 ?auto_272868 ) ) ( CALIBRATION_TARGET ?auto_272871 ?auto_272868 ) ( not ( = ?auto_272868 ?auto_272862 ) ) ( ON_BOARD ?auto_272872 ?auto_272873 ) ( not ( = ?auto_272864 ?auto_272862 ) ) ( not ( = ?auto_272871 ?auto_272872 ) ) ( SUPPORTS ?auto_272872 ?auto_272863 ) ( CALIBRATION_TARGET ?auto_272872 ?auto_272868 ) ( not ( = ?auto_272868 ?auto_272859 ) ) ( ON_BOARD ?auto_272866 ?auto_272873 ) ( not ( = ?auto_272862 ?auto_272859 ) ) ( not ( = ?auto_272872 ?auto_272866 ) ) ( SUPPORTS ?auto_272866 ?auto_272858 ) ( CALIBRATION_TARGET ?auto_272866 ?auto_272868 ) ( not ( = ?auto_272868 ?auto_272856 ) ) ( ON_BOARD ?auto_272870 ?auto_272873 ) ( not ( = ?auto_272859 ?auto_272856 ) ) ( not ( = ?auto_272866 ?auto_272870 ) ) ( SUPPORTS ?auto_272870 ?auto_272857 ) ( CALIBRATION_TARGET ?auto_272870 ?auto_272868 ) ( not ( = ?auto_272868 ?auto_272860 ) ) ( ON_BOARD ?auto_272869 ?auto_272873 ) ( not ( = ?auto_272856 ?auto_272860 ) ) ( not ( = ?auto_272870 ?auto_272869 ) ) ( SUPPORTS ?auto_272869 ?auto_272861 ) ( CALIBRATION_TARGET ?auto_272869 ?auto_272868 ) ( POWER_AVAIL ?auto_272873 ) ( POINTING ?auto_272873 ?auto_272867 ) ( not ( = ?auto_272868 ?auto_272867 ) ) ( not ( = ?auto_272860 ?auto_272867 ) ) ( not ( = ?auto_272861 ?auto_272857 ) ) ( not ( = ?auto_272856 ?auto_272867 ) ) ( not ( = ?auto_272860 ?auto_272859 ) ) ( not ( = ?auto_272861 ?auto_272858 ) ) ( not ( = ?auto_272857 ?auto_272858 ) ) ( not ( = ?auto_272859 ?auto_272867 ) ) ( not ( = ?auto_272866 ?auto_272869 ) ) ( not ( = ?auto_272860 ?auto_272862 ) ) ( not ( = ?auto_272861 ?auto_272863 ) ) ( not ( = ?auto_272856 ?auto_272862 ) ) ( not ( = ?auto_272857 ?auto_272863 ) ) ( not ( = ?auto_272858 ?auto_272863 ) ) ( not ( = ?auto_272862 ?auto_272867 ) ) ( not ( = ?auto_272872 ?auto_272870 ) ) ( not ( = ?auto_272872 ?auto_272869 ) ) ( not ( = ?auto_272860 ?auto_272864 ) ) ( not ( = ?auto_272861 ?auto_272865 ) ) ( not ( = ?auto_272856 ?auto_272864 ) ) ( not ( = ?auto_272857 ?auto_272865 ) ) ( not ( = ?auto_272859 ?auto_272864 ) ) ( not ( = ?auto_272858 ?auto_272865 ) ) ( not ( = ?auto_272863 ?auto_272865 ) ) ( not ( = ?auto_272864 ?auto_272867 ) ) ( not ( = ?auto_272871 ?auto_272866 ) ) ( not ( = ?auto_272871 ?auto_272870 ) ) ( not ( = ?auto_272871 ?auto_272869 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_272860 ?auto_272861 ?auto_272856 ?auto_272857 ?auto_272859 ?auto_272858 ?auto_272864 ?auto_272865 ?auto_272862 ?auto_272863 )
      ( GET-5IMAGE-VERIFY ?auto_272856 ?auto_272857 ?auto_272859 ?auto_272858 ?auto_272860 ?auto_272861 ?auto_272862 ?auto_272863 ?auto_272864 ?auto_272865 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_272934 - DIRECTION
      ?auto_272935 - MODE
      ?auto_272937 - DIRECTION
      ?auto_272936 - MODE
      ?auto_272938 - DIRECTION
      ?auto_272939 - MODE
      ?auto_272940 - DIRECTION
      ?auto_272941 - MODE
      ?auto_272942 - DIRECTION
      ?auto_272943 - MODE
    )
    :vars
    (
      ?auto_272949 - INSTRUMENT
      ?auto_272951 - SATELLITE
      ?auto_272946 - DIRECTION
      ?auto_272950 - INSTRUMENT
      ?auto_272944 - INSTRUMENT
      ?auto_272948 - INSTRUMENT
      ?auto_272947 - INSTRUMENT
      ?auto_272945 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_272949 ?auto_272951 ) ( SUPPORTS ?auto_272949 ?auto_272941 ) ( not ( = ?auto_272940 ?auto_272946 ) ) ( CALIBRATION_TARGET ?auto_272949 ?auto_272946 ) ( not ( = ?auto_272946 ?auto_272942 ) ) ( ON_BOARD ?auto_272950 ?auto_272951 ) ( not ( = ?auto_272940 ?auto_272942 ) ) ( not ( = ?auto_272949 ?auto_272950 ) ) ( SUPPORTS ?auto_272950 ?auto_272943 ) ( CALIBRATION_TARGET ?auto_272950 ?auto_272946 ) ( not ( = ?auto_272946 ?auto_272937 ) ) ( ON_BOARD ?auto_272944 ?auto_272951 ) ( not ( = ?auto_272942 ?auto_272937 ) ) ( not ( = ?auto_272950 ?auto_272944 ) ) ( SUPPORTS ?auto_272944 ?auto_272936 ) ( CALIBRATION_TARGET ?auto_272944 ?auto_272946 ) ( not ( = ?auto_272946 ?auto_272934 ) ) ( ON_BOARD ?auto_272948 ?auto_272951 ) ( not ( = ?auto_272937 ?auto_272934 ) ) ( not ( = ?auto_272944 ?auto_272948 ) ) ( SUPPORTS ?auto_272948 ?auto_272935 ) ( CALIBRATION_TARGET ?auto_272948 ?auto_272946 ) ( not ( = ?auto_272946 ?auto_272938 ) ) ( ON_BOARD ?auto_272947 ?auto_272951 ) ( not ( = ?auto_272934 ?auto_272938 ) ) ( not ( = ?auto_272948 ?auto_272947 ) ) ( SUPPORTS ?auto_272947 ?auto_272939 ) ( CALIBRATION_TARGET ?auto_272947 ?auto_272946 ) ( POWER_AVAIL ?auto_272951 ) ( POINTING ?auto_272951 ?auto_272945 ) ( not ( = ?auto_272946 ?auto_272945 ) ) ( not ( = ?auto_272938 ?auto_272945 ) ) ( not ( = ?auto_272939 ?auto_272935 ) ) ( not ( = ?auto_272934 ?auto_272945 ) ) ( not ( = ?auto_272938 ?auto_272937 ) ) ( not ( = ?auto_272939 ?auto_272936 ) ) ( not ( = ?auto_272935 ?auto_272936 ) ) ( not ( = ?auto_272937 ?auto_272945 ) ) ( not ( = ?auto_272944 ?auto_272947 ) ) ( not ( = ?auto_272938 ?auto_272942 ) ) ( not ( = ?auto_272939 ?auto_272943 ) ) ( not ( = ?auto_272934 ?auto_272942 ) ) ( not ( = ?auto_272935 ?auto_272943 ) ) ( not ( = ?auto_272936 ?auto_272943 ) ) ( not ( = ?auto_272942 ?auto_272945 ) ) ( not ( = ?auto_272950 ?auto_272948 ) ) ( not ( = ?auto_272950 ?auto_272947 ) ) ( not ( = ?auto_272938 ?auto_272940 ) ) ( not ( = ?auto_272939 ?auto_272941 ) ) ( not ( = ?auto_272934 ?auto_272940 ) ) ( not ( = ?auto_272935 ?auto_272941 ) ) ( not ( = ?auto_272937 ?auto_272940 ) ) ( not ( = ?auto_272936 ?auto_272941 ) ) ( not ( = ?auto_272943 ?auto_272941 ) ) ( not ( = ?auto_272940 ?auto_272945 ) ) ( not ( = ?auto_272949 ?auto_272944 ) ) ( not ( = ?auto_272949 ?auto_272948 ) ) ( not ( = ?auto_272949 ?auto_272947 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_272938 ?auto_272939 ?auto_272934 ?auto_272935 ?auto_272937 ?auto_272936 ?auto_272940 ?auto_272941 ?auto_272942 ?auto_272943 )
      ( GET-5IMAGE-VERIFY ?auto_272934 ?auto_272935 ?auto_272937 ?auto_272936 ?auto_272938 ?auto_272939 ?auto_272940 ?auto_272941 ?auto_272942 ?auto_272943 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_273352 - DIRECTION
      ?auto_273353 - MODE
      ?auto_273355 - DIRECTION
      ?auto_273354 - MODE
      ?auto_273356 - DIRECTION
      ?auto_273357 - MODE
      ?auto_273358 - DIRECTION
      ?auto_273359 - MODE
      ?auto_273360 - DIRECTION
      ?auto_273361 - MODE
    )
    :vars
    (
      ?auto_273367 - INSTRUMENT
      ?auto_273369 - SATELLITE
      ?auto_273364 - DIRECTION
      ?auto_273368 - INSTRUMENT
      ?auto_273362 - INSTRUMENT
      ?auto_273366 - INSTRUMENT
      ?auto_273365 - INSTRUMENT
      ?auto_273363 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_273367 ?auto_273369 ) ( SUPPORTS ?auto_273367 ?auto_273361 ) ( not ( = ?auto_273360 ?auto_273364 ) ) ( CALIBRATION_TARGET ?auto_273367 ?auto_273364 ) ( not ( = ?auto_273364 ?auto_273356 ) ) ( ON_BOARD ?auto_273368 ?auto_273369 ) ( not ( = ?auto_273360 ?auto_273356 ) ) ( not ( = ?auto_273367 ?auto_273368 ) ) ( SUPPORTS ?auto_273368 ?auto_273357 ) ( CALIBRATION_TARGET ?auto_273368 ?auto_273364 ) ( not ( = ?auto_273364 ?auto_273355 ) ) ( ON_BOARD ?auto_273362 ?auto_273369 ) ( not ( = ?auto_273356 ?auto_273355 ) ) ( not ( = ?auto_273368 ?auto_273362 ) ) ( SUPPORTS ?auto_273362 ?auto_273354 ) ( CALIBRATION_TARGET ?auto_273362 ?auto_273364 ) ( not ( = ?auto_273364 ?auto_273352 ) ) ( ON_BOARD ?auto_273366 ?auto_273369 ) ( not ( = ?auto_273355 ?auto_273352 ) ) ( not ( = ?auto_273362 ?auto_273366 ) ) ( SUPPORTS ?auto_273366 ?auto_273353 ) ( CALIBRATION_TARGET ?auto_273366 ?auto_273364 ) ( not ( = ?auto_273364 ?auto_273358 ) ) ( ON_BOARD ?auto_273365 ?auto_273369 ) ( not ( = ?auto_273352 ?auto_273358 ) ) ( not ( = ?auto_273366 ?auto_273365 ) ) ( SUPPORTS ?auto_273365 ?auto_273359 ) ( CALIBRATION_TARGET ?auto_273365 ?auto_273364 ) ( POWER_AVAIL ?auto_273369 ) ( POINTING ?auto_273369 ?auto_273363 ) ( not ( = ?auto_273364 ?auto_273363 ) ) ( not ( = ?auto_273358 ?auto_273363 ) ) ( not ( = ?auto_273359 ?auto_273353 ) ) ( not ( = ?auto_273352 ?auto_273363 ) ) ( not ( = ?auto_273358 ?auto_273355 ) ) ( not ( = ?auto_273359 ?auto_273354 ) ) ( not ( = ?auto_273353 ?auto_273354 ) ) ( not ( = ?auto_273355 ?auto_273363 ) ) ( not ( = ?auto_273362 ?auto_273365 ) ) ( not ( = ?auto_273358 ?auto_273356 ) ) ( not ( = ?auto_273359 ?auto_273357 ) ) ( not ( = ?auto_273352 ?auto_273356 ) ) ( not ( = ?auto_273353 ?auto_273357 ) ) ( not ( = ?auto_273354 ?auto_273357 ) ) ( not ( = ?auto_273356 ?auto_273363 ) ) ( not ( = ?auto_273368 ?auto_273366 ) ) ( not ( = ?auto_273368 ?auto_273365 ) ) ( not ( = ?auto_273358 ?auto_273360 ) ) ( not ( = ?auto_273359 ?auto_273361 ) ) ( not ( = ?auto_273352 ?auto_273360 ) ) ( not ( = ?auto_273353 ?auto_273361 ) ) ( not ( = ?auto_273355 ?auto_273360 ) ) ( not ( = ?auto_273354 ?auto_273361 ) ) ( not ( = ?auto_273357 ?auto_273361 ) ) ( not ( = ?auto_273360 ?auto_273363 ) ) ( not ( = ?auto_273367 ?auto_273362 ) ) ( not ( = ?auto_273367 ?auto_273366 ) ) ( not ( = ?auto_273367 ?auto_273365 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_273358 ?auto_273359 ?auto_273352 ?auto_273353 ?auto_273355 ?auto_273354 ?auto_273360 ?auto_273361 ?auto_273356 ?auto_273357 )
      ( GET-5IMAGE-VERIFY ?auto_273352 ?auto_273353 ?auto_273355 ?auto_273354 ?auto_273356 ?auto_273357 ?auto_273358 ?auto_273359 ?auto_273360 ?auto_273361 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_273430 - DIRECTION
      ?auto_273431 - MODE
      ?auto_273433 - DIRECTION
      ?auto_273432 - MODE
      ?auto_273434 - DIRECTION
      ?auto_273435 - MODE
      ?auto_273436 - DIRECTION
      ?auto_273437 - MODE
      ?auto_273438 - DIRECTION
      ?auto_273439 - MODE
    )
    :vars
    (
      ?auto_273445 - INSTRUMENT
      ?auto_273447 - SATELLITE
      ?auto_273442 - DIRECTION
      ?auto_273446 - INSTRUMENT
      ?auto_273440 - INSTRUMENT
      ?auto_273444 - INSTRUMENT
      ?auto_273443 - INSTRUMENT
      ?auto_273441 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_273445 ?auto_273447 ) ( SUPPORTS ?auto_273445 ?auto_273437 ) ( not ( = ?auto_273436 ?auto_273442 ) ) ( CALIBRATION_TARGET ?auto_273445 ?auto_273442 ) ( not ( = ?auto_273442 ?auto_273434 ) ) ( ON_BOARD ?auto_273446 ?auto_273447 ) ( not ( = ?auto_273436 ?auto_273434 ) ) ( not ( = ?auto_273445 ?auto_273446 ) ) ( SUPPORTS ?auto_273446 ?auto_273435 ) ( CALIBRATION_TARGET ?auto_273446 ?auto_273442 ) ( not ( = ?auto_273442 ?auto_273433 ) ) ( ON_BOARD ?auto_273440 ?auto_273447 ) ( not ( = ?auto_273434 ?auto_273433 ) ) ( not ( = ?auto_273446 ?auto_273440 ) ) ( SUPPORTS ?auto_273440 ?auto_273432 ) ( CALIBRATION_TARGET ?auto_273440 ?auto_273442 ) ( not ( = ?auto_273442 ?auto_273430 ) ) ( ON_BOARD ?auto_273444 ?auto_273447 ) ( not ( = ?auto_273433 ?auto_273430 ) ) ( not ( = ?auto_273440 ?auto_273444 ) ) ( SUPPORTS ?auto_273444 ?auto_273431 ) ( CALIBRATION_TARGET ?auto_273444 ?auto_273442 ) ( not ( = ?auto_273442 ?auto_273438 ) ) ( ON_BOARD ?auto_273443 ?auto_273447 ) ( not ( = ?auto_273430 ?auto_273438 ) ) ( not ( = ?auto_273444 ?auto_273443 ) ) ( SUPPORTS ?auto_273443 ?auto_273439 ) ( CALIBRATION_TARGET ?auto_273443 ?auto_273442 ) ( POWER_AVAIL ?auto_273447 ) ( POINTING ?auto_273447 ?auto_273441 ) ( not ( = ?auto_273442 ?auto_273441 ) ) ( not ( = ?auto_273438 ?auto_273441 ) ) ( not ( = ?auto_273439 ?auto_273431 ) ) ( not ( = ?auto_273430 ?auto_273441 ) ) ( not ( = ?auto_273438 ?auto_273433 ) ) ( not ( = ?auto_273439 ?auto_273432 ) ) ( not ( = ?auto_273431 ?auto_273432 ) ) ( not ( = ?auto_273433 ?auto_273441 ) ) ( not ( = ?auto_273440 ?auto_273443 ) ) ( not ( = ?auto_273438 ?auto_273434 ) ) ( not ( = ?auto_273439 ?auto_273435 ) ) ( not ( = ?auto_273430 ?auto_273434 ) ) ( not ( = ?auto_273431 ?auto_273435 ) ) ( not ( = ?auto_273432 ?auto_273435 ) ) ( not ( = ?auto_273434 ?auto_273441 ) ) ( not ( = ?auto_273446 ?auto_273444 ) ) ( not ( = ?auto_273446 ?auto_273443 ) ) ( not ( = ?auto_273438 ?auto_273436 ) ) ( not ( = ?auto_273439 ?auto_273437 ) ) ( not ( = ?auto_273430 ?auto_273436 ) ) ( not ( = ?auto_273431 ?auto_273437 ) ) ( not ( = ?auto_273433 ?auto_273436 ) ) ( not ( = ?auto_273432 ?auto_273437 ) ) ( not ( = ?auto_273435 ?auto_273437 ) ) ( not ( = ?auto_273436 ?auto_273441 ) ) ( not ( = ?auto_273445 ?auto_273440 ) ) ( not ( = ?auto_273445 ?auto_273444 ) ) ( not ( = ?auto_273445 ?auto_273443 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_273438 ?auto_273439 ?auto_273430 ?auto_273431 ?auto_273433 ?auto_273432 ?auto_273436 ?auto_273437 ?auto_273434 ?auto_273435 )
      ( GET-5IMAGE-VERIFY ?auto_273430 ?auto_273431 ?auto_273433 ?auto_273432 ?auto_273434 ?auto_273435 ?auto_273436 ?auto_273437 ?auto_273438 ?auto_273439 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_273588 - DIRECTION
      ?auto_273589 - MODE
      ?auto_273591 - DIRECTION
      ?auto_273590 - MODE
      ?auto_273592 - DIRECTION
      ?auto_273593 - MODE
      ?auto_273594 - DIRECTION
      ?auto_273595 - MODE
      ?auto_273596 - DIRECTION
      ?auto_273597 - MODE
    )
    :vars
    (
      ?auto_273603 - INSTRUMENT
      ?auto_273605 - SATELLITE
      ?auto_273600 - DIRECTION
      ?auto_273604 - INSTRUMENT
      ?auto_273598 - INSTRUMENT
      ?auto_273602 - INSTRUMENT
      ?auto_273601 - INSTRUMENT
      ?auto_273599 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_273603 ?auto_273605 ) ( SUPPORTS ?auto_273603 ?auto_273593 ) ( not ( = ?auto_273592 ?auto_273600 ) ) ( CALIBRATION_TARGET ?auto_273603 ?auto_273600 ) ( not ( = ?auto_273600 ?auto_273596 ) ) ( ON_BOARD ?auto_273604 ?auto_273605 ) ( not ( = ?auto_273592 ?auto_273596 ) ) ( not ( = ?auto_273603 ?auto_273604 ) ) ( SUPPORTS ?auto_273604 ?auto_273597 ) ( CALIBRATION_TARGET ?auto_273604 ?auto_273600 ) ( not ( = ?auto_273600 ?auto_273591 ) ) ( ON_BOARD ?auto_273598 ?auto_273605 ) ( not ( = ?auto_273596 ?auto_273591 ) ) ( not ( = ?auto_273604 ?auto_273598 ) ) ( SUPPORTS ?auto_273598 ?auto_273590 ) ( CALIBRATION_TARGET ?auto_273598 ?auto_273600 ) ( not ( = ?auto_273600 ?auto_273588 ) ) ( ON_BOARD ?auto_273602 ?auto_273605 ) ( not ( = ?auto_273591 ?auto_273588 ) ) ( not ( = ?auto_273598 ?auto_273602 ) ) ( SUPPORTS ?auto_273602 ?auto_273589 ) ( CALIBRATION_TARGET ?auto_273602 ?auto_273600 ) ( not ( = ?auto_273600 ?auto_273594 ) ) ( ON_BOARD ?auto_273601 ?auto_273605 ) ( not ( = ?auto_273588 ?auto_273594 ) ) ( not ( = ?auto_273602 ?auto_273601 ) ) ( SUPPORTS ?auto_273601 ?auto_273595 ) ( CALIBRATION_TARGET ?auto_273601 ?auto_273600 ) ( POWER_AVAIL ?auto_273605 ) ( POINTING ?auto_273605 ?auto_273599 ) ( not ( = ?auto_273600 ?auto_273599 ) ) ( not ( = ?auto_273594 ?auto_273599 ) ) ( not ( = ?auto_273595 ?auto_273589 ) ) ( not ( = ?auto_273588 ?auto_273599 ) ) ( not ( = ?auto_273594 ?auto_273591 ) ) ( not ( = ?auto_273595 ?auto_273590 ) ) ( not ( = ?auto_273589 ?auto_273590 ) ) ( not ( = ?auto_273591 ?auto_273599 ) ) ( not ( = ?auto_273598 ?auto_273601 ) ) ( not ( = ?auto_273594 ?auto_273596 ) ) ( not ( = ?auto_273595 ?auto_273597 ) ) ( not ( = ?auto_273588 ?auto_273596 ) ) ( not ( = ?auto_273589 ?auto_273597 ) ) ( not ( = ?auto_273590 ?auto_273597 ) ) ( not ( = ?auto_273596 ?auto_273599 ) ) ( not ( = ?auto_273604 ?auto_273602 ) ) ( not ( = ?auto_273604 ?auto_273601 ) ) ( not ( = ?auto_273594 ?auto_273592 ) ) ( not ( = ?auto_273595 ?auto_273593 ) ) ( not ( = ?auto_273588 ?auto_273592 ) ) ( not ( = ?auto_273589 ?auto_273593 ) ) ( not ( = ?auto_273591 ?auto_273592 ) ) ( not ( = ?auto_273590 ?auto_273593 ) ) ( not ( = ?auto_273597 ?auto_273593 ) ) ( not ( = ?auto_273592 ?auto_273599 ) ) ( not ( = ?auto_273603 ?auto_273598 ) ) ( not ( = ?auto_273603 ?auto_273602 ) ) ( not ( = ?auto_273603 ?auto_273601 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_273594 ?auto_273595 ?auto_273588 ?auto_273589 ?auto_273591 ?auto_273590 ?auto_273592 ?auto_273593 ?auto_273596 ?auto_273597 )
      ( GET-5IMAGE-VERIFY ?auto_273588 ?auto_273589 ?auto_273591 ?auto_273590 ?auto_273592 ?auto_273593 ?auto_273594 ?auto_273595 ?auto_273596 ?auto_273597 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_273838 - DIRECTION
      ?auto_273839 - MODE
      ?auto_273841 - DIRECTION
      ?auto_273840 - MODE
      ?auto_273842 - DIRECTION
      ?auto_273843 - MODE
      ?auto_273844 - DIRECTION
      ?auto_273845 - MODE
      ?auto_273846 - DIRECTION
      ?auto_273847 - MODE
    )
    :vars
    (
      ?auto_273853 - INSTRUMENT
      ?auto_273855 - SATELLITE
      ?auto_273850 - DIRECTION
      ?auto_273854 - INSTRUMENT
      ?auto_273848 - INSTRUMENT
      ?auto_273852 - INSTRUMENT
      ?auto_273851 - INSTRUMENT
      ?auto_273849 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_273853 ?auto_273855 ) ( SUPPORTS ?auto_273853 ?auto_273843 ) ( not ( = ?auto_273842 ?auto_273850 ) ) ( CALIBRATION_TARGET ?auto_273853 ?auto_273850 ) ( not ( = ?auto_273850 ?auto_273844 ) ) ( ON_BOARD ?auto_273854 ?auto_273855 ) ( not ( = ?auto_273842 ?auto_273844 ) ) ( not ( = ?auto_273853 ?auto_273854 ) ) ( SUPPORTS ?auto_273854 ?auto_273845 ) ( CALIBRATION_TARGET ?auto_273854 ?auto_273850 ) ( not ( = ?auto_273850 ?auto_273841 ) ) ( ON_BOARD ?auto_273848 ?auto_273855 ) ( not ( = ?auto_273844 ?auto_273841 ) ) ( not ( = ?auto_273854 ?auto_273848 ) ) ( SUPPORTS ?auto_273848 ?auto_273840 ) ( CALIBRATION_TARGET ?auto_273848 ?auto_273850 ) ( not ( = ?auto_273850 ?auto_273838 ) ) ( ON_BOARD ?auto_273852 ?auto_273855 ) ( not ( = ?auto_273841 ?auto_273838 ) ) ( not ( = ?auto_273848 ?auto_273852 ) ) ( SUPPORTS ?auto_273852 ?auto_273839 ) ( CALIBRATION_TARGET ?auto_273852 ?auto_273850 ) ( not ( = ?auto_273850 ?auto_273846 ) ) ( ON_BOARD ?auto_273851 ?auto_273855 ) ( not ( = ?auto_273838 ?auto_273846 ) ) ( not ( = ?auto_273852 ?auto_273851 ) ) ( SUPPORTS ?auto_273851 ?auto_273847 ) ( CALIBRATION_TARGET ?auto_273851 ?auto_273850 ) ( POWER_AVAIL ?auto_273855 ) ( POINTING ?auto_273855 ?auto_273849 ) ( not ( = ?auto_273850 ?auto_273849 ) ) ( not ( = ?auto_273846 ?auto_273849 ) ) ( not ( = ?auto_273847 ?auto_273839 ) ) ( not ( = ?auto_273838 ?auto_273849 ) ) ( not ( = ?auto_273846 ?auto_273841 ) ) ( not ( = ?auto_273847 ?auto_273840 ) ) ( not ( = ?auto_273839 ?auto_273840 ) ) ( not ( = ?auto_273841 ?auto_273849 ) ) ( not ( = ?auto_273848 ?auto_273851 ) ) ( not ( = ?auto_273846 ?auto_273844 ) ) ( not ( = ?auto_273847 ?auto_273845 ) ) ( not ( = ?auto_273838 ?auto_273844 ) ) ( not ( = ?auto_273839 ?auto_273845 ) ) ( not ( = ?auto_273840 ?auto_273845 ) ) ( not ( = ?auto_273844 ?auto_273849 ) ) ( not ( = ?auto_273854 ?auto_273852 ) ) ( not ( = ?auto_273854 ?auto_273851 ) ) ( not ( = ?auto_273846 ?auto_273842 ) ) ( not ( = ?auto_273847 ?auto_273843 ) ) ( not ( = ?auto_273838 ?auto_273842 ) ) ( not ( = ?auto_273839 ?auto_273843 ) ) ( not ( = ?auto_273841 ?auto_273842 ) ) ( not ( = ?auto_273840 ?auto_273843 ) ) ( not ( = ?auto_273845 ?auto_273843 ) ) ( not ( = ?auto_273842 ?auto_273849 ) ) ( not ( = ?auto_273853 ?auto_273848 ) ) ( not ( = ?auto_273853 ?auto_273852 ) ) ( not ( = ?auto_273853 ?auto_273851 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_273846 ?auto_273847 ?auto_273838 ?auto_273839 ?auto_273841 ?auto_273840 ?auto_273842 ?auto_273843 ?auto_273844 ?auto_273845 )
      ( GET-5IMAGE-VERIFY ?auto_273838 ?auto_273839 ?auto_273841 ?auto_273840 ?auto_273842 ?auto_273843 ?auto_273844 ?auto_273845 ?auto_273846 ?auto_273847 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_274082 - DIRECTION
      ?auto_274083 - MODE
      ?auto_274085 - DIRECTION
      ?auto_274084 - MODE
      ?auto_274086 - DIRECTION
      ?auto_274087 - MODE
      ?auto_274088 - DIRECTION
      ?auto_274089 - MODE
      ?auto_274090 - DIRECTION
      ?auto_274091 - MODE
    )
    :vars
    (
      ?auto_274097 - INSTRUMENT
      ?auto_274099 - SATELLITE
      ?auto_274094 - DIRECTION
      ?auto_274098 - INSTRUMENT
      ?auto_274092 - INSTRUMENT
      ?auto_274096 - INSTRUMENT
      ?auto_274095 - INSTRUMENT
      ?auto_274093 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_274097 ?auto_274099 ) ( SUPPORTS ?auto_274097 ?auto_274091 ) ( not ( = ?auto_274090 ?auto_274094 ) ) ( CALIBRATION_TARGET ?auto_274097 ?auto_274094 ) ( not ( = ?auto_274094 ?auto_274085 ) ) ( ON_BOARD ?auto_274098 ?auto_274099 ) ( not ( = ?auto_274090 ?auto_274085 ) ) ( not ( = ?auto_274097 ?auto_274098 ) ) ( SUPPORTS ?auto_274098 ?auto_274084 ) ( CALIBRATION_TARGET ?auto_274098 ?auto_274094 ) ( not ( = ?auto_274094 ?auto_274088 ) ) ( ON_BOARD ?auto_274092 ?auto_274099 ) ( not ( = ?auto_274085 ?auto_274088 ) ) ( not ( = ?auto_274098 ?auto_274092 ) ) ( SUPPORTS ?auto_274092 ?auto_274089 ) ( CALIBRATION_TARGET ?auto_274092 ?auto_274094 ) ( not ( = ?auto_274094 ?auto_274082 ) ) ( ON_BOARD ?auto_274096 ?auto_274099 ) ( not ( = ?auto_274088 ?auto_274082 ) ) ( not ( = ?auto_274092 ?auto_274096 ) ) ( SUPPORTS ?auto_274096 ?auto_274083 ) ( CALIBRATION_TARGET ?auto_274096 ?auto_274094 ) ( not ( = ?auto_274094 ?auto_274086 ) ) ( ON_BOARD ?auto_274095 ?auto_274099 ) ( not ( = ?auto_274082 ?auto_274086 ) ) ( not ( = ?auto_274096 ?auto_274095 ) ) ( SUPPORTS ?auto_274095 ?auto_274087 ) ( CALIBRATION_TARGET ?auto_274095 ?auto_274094 ) ( POWER_AVAIL ?auto_274099 ) ( POINTING ?auto_274099 ?auto_274093 ) ( not ( = ?auto_274094 ?auto_274093 ) ) ( not ( = ?auto_274086 ?auto_274093 ) ) ( not ( = ?auto_274087 ?auto_274083 ) ) ( not ( = ?auto_274082 ?auto_274093 ) ) ( not ( = ?auto_274086 ?auto_274088 ) ) ( not ( = ?auto_274087 ?auto_274089 ) ) ( not ( = ?auto_274083 ?auto_274089 ) ) ( not ( = ?auto_274088 ?auto_274093 ) ) ( not ( = ?auto_274092 ?auto_274095 ) ) ( not ( = ?auto_274086 ?auto_274085 ) ) ( not ( = ?auto_274087 ?auto_274084 ) ) ( not ( = ?auto_274082 ?auto_274085 ) ) ( not ( = ?auto_274083 ?auto_274084 ) ) ( not ( = ?auto_274089 ?auto_274084 ) ) ( not ( = ?auto_274085 ?auto_274093 ) ) ( not ( = ?auto_274098 ?auto_274096 ) ) ( not ( = ?auto_274098 ?auto_274095 ) ) ( not ( = ?auto_274086 ?auto_274090 ) ) ( not ( = ?auto_274087 ?auto_274091 ) ) ( not ( = ?auto_274082 ?auto_274090 ) ) ( not ( = ?auto_274083 ?auto_274091 ) ) ( not ( = ?auto_274088 ?auto_274090 ) ) ( not ( = ?auto_274089 ?auto_274091 ) ) ( not ( = ?auto_274084 ?auto_274091 ) ) ( not ( = ?auto_274090 ?auto_274093 ) ) ( not ( = ?auto_274097 ?auto_274092 ) ) ( not ( = ?auto_274097 ?auto_274096 ) ) ( not ( = ?auto_274097 ?auto_274095 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_274086 ?auto_274087 ?auto_274082 ?auto_274083 ?auto_274088 ?auto_274089 ?auto_274090 ?auto_274091 ?auto_274085 ?auto_274084 )
      ( GET-5IMAGE-VERIFY ?auto_274082 ?auto_274083 ?auto_274085 ?auto_274084 ?auto_274086 ?auto_274087 ?auto_274088 ?auto_274089 ?auto_274090 ?auto_274091 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_274160 - DIRECTION
      ?auto_274161 - MODE
      ?auto_274163 - DIRECTION
      ?auto_274162 - MODE
      ?auto_274164 - DIRECTION
      ?auto_274165 - MODE
      ?auto_274166 - DIRECTION
      ?auto_274167 - MODE
      ?auto_274168 - DIRECTION
      ?auto_274169 - MODE
    )
    :vars
    (
      ?auto_274175 - INSTRUMENT
      ?auto_274177 - SATELLITE
      ?auto_274172 - DIRECTION
      ?auto_274176 - INSTRUMENT
      ?auto_274170 - INSTRUMENT
      ?auto_274174 - INSTRUMENT
      ?auto_274173 - INSTRUMENT
      ?auto_274171 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_274175 ?auto_274177 ) ( SUPPORTS ?auto_274175 ?auto_274167 ) ( not ( = ?auto_274166 ?auto_274172 ) ) ( CALIBRATION_TARGET ?auto_274175 ?auto_274172 ) ( not ( = ?auto_274172 ?auto_274163 ) ) ( ON_BOARD ?auto_274176 ?auto_274177 ) ( not ( = ?auto_274166 ?auto_274163 ) ) ( not ( = ?auto_274175 ?auto_274176 ) ) ( SUPPORTS ?auto_274176 ?auto_274162 ) ( CALIBRATION_TARGET ?auto_274176 ?auto_274172 ) ( not ( = ?auto_274172 ?auto_274168 ) ) ( ON_BOARD ?auto_274170 ?auto_274177 ) ( not ( = ?auto_274163 ?auto_274168 ) ) ( not ( = ?auto_274176 ?auto_274170 ) ) ( SUPPORTS ?auto_274170 ?auto_274169 ) ( CALIBRATION_TARGET ?auto_274170 ?auto_274172 ) ( not ( = ?auto_274172 ?auto_274160 ) ) ( ON_BOARD ?auto_274174 ?auto_274177 ) ( not ( = ?auto_274168 ?auto_274160 ) ) ( not ( = ?auto_274170 ?auto_274174 ) ) ( SUPPORTS ?auto_274174 ?auto_274161 ) ( CALIBRATION_TARGET ?auto_274174 ?auto_274172 ) ( not ( = ?auto_274172 ?auto_274164 ) ) ( ON_BOARD ?auto_274173 ?auto_274177 ) ( not ( = ?auto_274160 ?auto_274164 ) ) ( not ( = ?auto_274174 ?auto_274173 ) ) ( SUPPORTS ?auto_274173 ?auto_274165 ) ( CALIBRATION_TARGET ?auto_274173 ?auto_274172 ) ( POWER_AVAIL ?auto_274177 ) ( POINTING ?auto_274177 ?auto_274171 ) ( not ( = ?auto_274172 ?auto_274171 ) ) ( not ( = ?auto_274164 ?auto_274171 ) ) ( not ( = ?auto_274165 ?auto_274161 ) ) ( not ( = ?auto_274160 ?auto_274171 ) ) ( not ( = ?auto_274164 ?auto_274168 ) ) ( not ( = ?auto_274165 ?auto_274169 ) ) ( not ( = ?auto_274161 ?auto_274169 ) ) ( not ( = ?auto_274168 ?auto_274171 ) ) ( not ( = ?auto_274170 ?auto_274173 ) ) ( not ( = ?auto_274164 ?auto_274163 ) ) ( not ( = ?auto_274165 ?auto_274162 ) ) ( not ( = ?auto_274160 ?auto_274163 ) ) ( not ( = ?auto_274161 ?auto_274162 ) ) ( not ( = ?auto_274169 ?auto_274162 ) ) ( not ( = ?auto_274163 ?auto_274171 ) ) ( not ( = ?auto_274176 ?auto_274174 ) ) ( not ( = ?auto_274176 ?auto_274173 ) ) ( not ( = ?auto_274164 ?auto_274166 ) ) ( not ( = ?auto_274165 ?auto_274167 ) ) ( not ( = ?auto_274160 ?auto_274166 ) ) ( not ( = ?auto_274161 ?auto_274167 ) ) ( not ( = ?auto_274168 ?auto_274166 ) ) ( not ( = ?auto_274169 ?auto_274167 ) ) ( not ( = ?auto_274162 ?auto_274167 ) ) ( not ( = ?auto_274166 ?auto_274171 ) ) ( not ( = ?auto_274175 ?auto_274170 ) ) ( not ( = ?auto_274175 ?auto_274174 ) ) ( not ( = ?auto_274175 ?auto_274173 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_274164 ?auto_274165 ?auto_274160 ?auto_274161 ?auto_274168 ?auto_274169 ?auto_274166 ?auto_274167 ?auto_274163 ?auto_274162 )
      ( GET-5IMAGE-VERIFY ?auto_274160 ?auto_274161 ?auto_274163 ?auto_274162 ?auto_274164 ?auto_274165 ?auto_274166 ?auto_274167 ?auto_274168 ?auto_274169 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_274408 - DIRECTION
      ?auto_274409 - MODE
      ?auto_274411 - DIRECTION
      ?auto_274410 - MODE
      ?auto_274412 - DIRECTION
      ?auto_274413 - MODE
      ?auto_274414 - DIRECTION
      ?auto_274415 - MODE
      ?auto_274416 - DIRECTION
      ?auto_274417 - MODE
    )
    :vars
    (
      ?auto_274423 - INSTRUMENT
      ?auto_274425 - SATELLITE
      ?auto_274420 - DIRECTION
      ?auto_274424 - INSTRUMENT
      ?auto_274418 - INSTRUMENT
      ?auto_274422 - INSTRUMENT
      ?auto_274421 - INSTRUMENT
      ?auto_274419 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_274423 ?auto_274425 ) ( SUPPORTS ?auto_274423 ?auto_274417 ) ( not ( = ?auto_274416 ?auto_274420 ) ) ( CALIBRATION_TARGET ?auto_274423 ?auto_274420 ) ( not ( = ?auto_274420 ?auto_274411 ) ) ( ON_BOARD ?auto_274424 ?auto_274425 ) ( not ( = ?auto_274416 ?auto_274411 ) ) ( not ( = ?auto_274423 ?auto_274424 ) ) ( SUPPORTS ?auto_274424 ?auto_274410 ) ( CALIBRATION_TARGET ?auto_274424 ?auto_274420 ) ( not ( = ?auto_274420 ?auto_274412 ) ) ( ON_BOARD ?auto_274418 ?auto_274425 ) ( not ( = ?auto_274411 ?auto_274412 ) ) ( not ( = ?auto_274424 ?auto_274418 ) ) ( SUPPORTS ?auto_274418 ?auto_274413 ) ( CALIBRATION_TARGET ?auto_274418 ?auto_274420 ) ( not ( = ?auto_274420 ?auto_274408 ) ) ( ON_BOARD ?auto_274422 ?auto_274425 ) ( not ( = ?auto_274412 ?auto_274408 ) ) ( not ( = ?auto_274418 ?auto_274422 ) ) ( SUPPORTS ?auto_274422 ?auto_274409 ) ( CALIBRATION_TARGET ?auto_274422 ?auto_274420 ) ( not ( = ?auto_274420 ?auto_274414 ) ) ( ON_BOARD ?auto_274421 ?auto_274425 ) ( not ( = ?auto_274408 ?auto_274414 ) ) ( not ( = ?auto_274422 ?auto_274421 ) ) ( SUPPORTS ?auto_274421 ?auto_274415 ) ( CALIBRATION_TARGET ?auto_274421 ?auto_274420 ) ( POWER_AVAIL ?auto_274425 ) ( POINTING ?auto_274425 ?auto_274419 ) ( not ( = ?auto_274420 ?auto_274419 ) ) ( not ( = ?auto_274414 ?auto_274419 ) ) ( not ( = ?auto_274415 ?auto_274409 ) ) ( not ( = ?auto_274408 ?auto_274419 ) ) ( not ( = ?auto_274414 ?auto_274412 ) ) ( not ( = ?auto_274415 ?auto_274413 ) ) ( not ( = ?auto_274409 ?auto_274413 ) ) ( not ( = ?auto_274412 ?auto_274419 ) ) ( not ( = ?auto_274418 ?auto_274421 ) ) ( not ( = ?auto_274414 ?auto_274411 ) ) ( not ( = ?auto_274415 ?auto_274410 ) ) ( not ( = ?auto_274408 ?auto_274411 ) ) ( not ( = ?auto_274409 ?auto_274410 ) ) ( not ( = ?auto_274413 ?auto_274410 ) ) ( not ( = ?auto_274411 ?auto_274419 ) ) ( not ( = ?auto_274424 ?auto_274422 ) ) ( not ( = ?auto_274424 ?auto_274421 ) ) ( not ( = ?auto_274414 ?auto_274416 ) ) ( not ( = ?auto_274415 ?auto_274417 ) ) ( not ( = ?auto_274408 ?auto_274416 ) ) ( not ( = ?auto_274409 ?auto_274417 ) ) ( not ( = ?auto_274412 ?auto_274416 ) ) ( not ( = ?auto_274413 ?auto_274417 ) ) ( not ( = ?auto_274410 ?auto_274417 ) ) ( not ( = ?auto_274416 ?auto_274419 ) ) ( not ( = ?auto_274423 ?auto_274418 ) ) ( not ( = ?auto_274423 ?auto_274422 ) ) ( not ( = ?auto_274423 ?auto_274421 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_274414 ?auto_274415 ?auto_274408 ?auto_274409 ?auto_274412 ?auto_274413 ?auto_274416 ?auto_274417 ?auto_274411 ?auto_274410 )
      ( GET-5IMAGE-VERIFY ?auto_274408 ?auto_274409 ?auto_274411 ?auto_274410 ?auto_274412 ?auto_274413 ?auto_274414 ?auto_274415 ?auto_274416 ?auto_274417 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_274486 - DIRECTION
      ?auto_274487 - MODE
      ?auto_274489 - DIRECTION
      ?auto_274488 - MODE
      ?auto_274490 - DIRECTION
      ?auto_274491 - MODE
      ?auto_274492 - DIRECTION
      ?auto_274493 - MODE
      ?auto_274494 - DIRECTION
      ?auto_274495 - MODE
    )
    :vars
    (
      ?auto_274501 - INSTRUMENT
      ?auto_274503 - SATELLITE
      ?auto_274498 - DIRECTION
      ?auto_274502 - INSTRUMENT
      ?auto_274496 - INSTRUMENT
      ?auto_274500 - INSTRUMENT
      ?auto_274499 - INSTRUMENT
      ?auto_274497 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_274501 ?auto_274503 ) ( SUPPORTS ?auto_274501 ?auto_274493 ) ( not ( = ?auto_274492 ?auto_274498 ) ) ( CALIBRATION_TARGET ?auto_274501 ?auto_274498 ) ( not ( = ?auto_274498 ?auto_274489 ) ) ( ON_BOARD ?auto_274502 ?auto_274503 ) ( not ( = ?auto_274492 ?auto_274489 ) ) ( not ( = ?auto_274501 ?auto_274502 ) ) ( SUPPORTS ?auto_274502 ?auto_274488 ) ( CALIBRATION_TARGET ?auto_274502 ?auto_274498 ) ( not ( = ?auto_274498 ?auto_274490 ) ) ( ON_BOARD ?auto_274496 ?auto_274503 ) ( not ( = ?auto_274489 ?auto_274490 ) ) ( not ( = ?auto_274502 ?auto_274496 ) ) ( SUPPORTS ?auto_274496 ?auto_274491 ) ( CALIBRATION_TARGET ?auto_274496 ?auto_274498 ) ( not ( = ?auto_274498 ?auto_274486 ) ) ( ON_BOARD ?auto_274500 ?auto_274503 ) ( not ( = ?auto_274490 ?auto_274486 ) ) ( not ( = ?auto_274496 ?auto_274500 ) ) ( SUPPORTS ?auto_274500 ?auto_274487 ) ( CALIBRATION_TARGET ?auto_274500 ?auto_274498 ) ( not ( = ?auto_274498 ?auto_274494 ) ) ( ON_BOARD ?auto_274499 ?auto_274503 ) ( not ( = ?auto_274486 ?auto_274494 ) ) ( not ( = ?auto_274500 ?auto_274499 ) ) ( SUPPORTS ?auto_274499 ?auto_274495 ) ( CALIBRATION_TARGET ?auto_274499 ?auto_274498 ) ( POWER_AVAIL ?auto_274503 ) ( POINTING ?auto_274503 ?auto_274497 ) ( not ( = ?auto_274498 ?auto_274497 ) ) ( not ( = ?auto_274494 ?auto_274497 ) ) ( not ( = ?auto_274495 ?auto_274487 ) ) ( not ( = ?auto_274486 ?auto_274497 ) ) ( not ( = ?auto_274494 ?auto_274490 ) ) ( not ( = ?auto_274495 ?auto_274491 ) ) ( not ( = ?auto_274487 ?auto_274491 ) ) ( not ( = ?auto_274490 ?auto_274497 ) ) ( not ( = ?auto_274496 ?auto_274499 ) ) ( not ( = ?auto_274494 ?auto_274489 ) ) ( not ( = ?auto_274495 ?auto_274488 ) ) ( not ( = ?auto_274486 ?auto_274489 ) ) ( not ( = ?auto_274487 ?auto_274488 ) ) ( not ( = ?auto_274491 ?auto_274488 ) ) ( not ( = ?auto_274489 ?auto_274497 ) ) ( not ( = ?auto_274502 ?auto_274500 ) ) ( not ( = ?auto_274502 ?auto_274499 ) ) ( not ( = ?auto_274494 ?auto_274492 ) ) ( not ( = ?auto_274495 ?auto_274493 ) ) ( not ( = ?auto_274486 ?auto_274492 ) ) ( not ( = ?auto_274487 ?auto_274493 ) ) ( not ( = ?auto_274490 ?auto_274492 ) ) ( not ( = ?auto_274491 ?auto_274493 ) ) ( not ( = ?auto_274488 ?auto_274493 ) ) ( not ( = ?auto_274492 ?auto_274497 ) ) ( not ( = ?auto_274501 ?auto_274496 ) ) ( not ( = ?auto_274501 ?auto_274500 ) ) ( not ( = ?auto_274501 ?auto_274499 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_274494 ?auto_274495 ?auto_274486 ?auto_274487 ?auto_274490 ?auto_274491 ?auto_274492 ?auto_274493 ?auto_274489 ?auto_274488 )
      ( GET-5IMAGE-VERIFY ?auto_274486 ?auto_274487 ?auto_274489 ?auto_274488 ?auto_274490 ?auto_274491 ?auto_274492 ?auto_274493 ?auto_274494 ?auto_274495 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_274814 - DIRECTION
      ?auto_274815 - MODE
      ?auto_274817 - DIRECTION
      ?auto_274816 - MODE
      ?auto_274818 - DIRECTION
      ?auto_274819 - MODE
      ?auto_274820 - DIRECTION
      ?auto_274821 - MODE
      ?auto_274822 - DIRECTION
      ?auto_274823 - MODE
    )
    :vars
    (
      ?auto_274829 - INSTRUMENT
      ?auto_274831 - SATELLITE
      ?auto_274826 - DIRECTION
      ?auto_274830 - INSTRUMENT
      ?auto_274824 - INSTRUMENT
      ?auto_274828 - INSTRUMENT
      ?auto_274827 - INSTRUMENT
      ?auto_274825 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_274829 ?auto_274831 ) ( SUPPORTS ?auto_274829 ?auto_274819 ) ( not ( = ?auto_274818 ?auto_274826 ) ) ( CALIBRATION_TARGET ?auto_274829 ?auto_274826 ) ( not ( = ?auto_274826 ?auto_274817 ) ) ( ON_BOARD ?auto_274830 ?auto_274831 ) ( not ( = ?auto_274818 ?auto_274817 ) ) ( not ( = ?auto_274829 ?auto_274830 ) ) ( SUPPORTS ?auto_274830 ?auto_274816 ) ( CALIBRATION_TARGET ?auto_274830 ?auto_274826 ) ( not ( = ?auto_274826 ?auto_274822 ) ) ( ON_BOARD ?auto_274824 ?auto_274831 ) ( not ( = ?auto_274817 ?auto_274822 ) ) ( not ( = ?auto_274830 ?auto_274824 ) ) ( SUPPORTS ?auto_274824 ?auto_274823 ) ( CALIBRATION_TARGET ?auto_274824 ?auto_274826 ) ( not ( = ?auto_274826 ?auto_274814 ) ) ( ON_BOARD ?auto_274828 ?auto_274831 ) ( not ( = ?auto_274822 ?auto_274814 ) ) ( not ( = ?auto_274824 ?auto_274828 ) ) ( SUPPORTS ?auto_274828 ?auto_274815 ) ( CALIBRATION_TARGET ?auto_274828 ?auto_274826 ) ( not ( = ?auto_274826 ?auto_274820 ) ) ( ON_BOARD ?auto_274827 ?auto_274831 ) ( not ( = ?auto_274814 ?auto_274820 ) ) ( not ( = ?auto_274828 ?auto_274827 ) ) ( SUPPORTS ?auto_274827 ?auto_274821 ) ( CALIBRATION_TARGET ?auto_274827 ?auto_274826 ) ( POWER_AVAIL ?auto_274831 ) ( POINTING ?auto_274831 ?auto_274825 ) ( not ( = ?auto_274826 ?auto_274825 ) ) ( not ( = ?auto_274820 ?auto_274825 ) ) ( not ( = ?auto_274821 ?auto_274815 ) ) ( not ( = ?auto_274814 ?auto_274825 ) ) ( not ( = ?auto_274820 ?auto_274822 ) ) ( not ( = ?auto_274821 ?auto_274823 ) ) ( not ( = ?auto_274815 ?auto_274823 ) ) ( not ( = ?auto_274822 ?auto_274825 ) ) ( not ( = ?auto_274824 ?auto_274827 ) ) ( not ( = ?auto_274820 ?auto_274817 ) ) ( not ( = ?auto_274821 ?auto_274816 ) ) ( not ( = ?auto_274814 ?auto_274817 ) ) ( not ( = ?auto_274815 ?auto_274816 ) ) ( not ( = ?auto_274823 ?auto_274816 ) ) ( not ( = ?auto_274817 ?auto_274825 ) ) ( not ( = ?auto_274830 ?auto_274828 ) ) ( not ( = ?auto_274830 ?auto_274827 ) ) ( not ( = ?auto_274820 ?auto_274818 ) ) ( not ( = ?auto_274821 ?auto_274819 ) ) ( not ( = ?auto_274814 ?auto_274818 ) ) ( not ( = ?auto_274815 ?auto_274819 ) ) ( not ( = ?auto_274822 ?auto_274818 ) ) ( not ( = ?auto_274823 ?auto_274819 ) ) ( not ( = ?auto_274816 ?auto_274819 ) ) ( not ( = ?auto_274818 ?auto_274825 ) ) ( not ( = ?auto_274829 ?auto_274824 ) ) ( not ( = ?auto_274829 ?auto_274828 ) ) ( not ( = ?auto_274829 ?auto_274827 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_274820 ?auto_274821 ?auto_274814 ?auto_274815 ?auto_274822 ?auto_274823 ?auto_274818 ?auto_274819 ?auto_274817 ?auto_274816 )
      ( GET-5IMAGE-VERIFY ?auto_274814 ?auto_274815 ?auto_274817 ?auto_274816 ?auto_274818 ?auto_274819 ?auto_274820 ?auto_274821 ?auto_274822 ?auto_274823 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_274978 - DIRECTION
      ?auto_274979 - MODE
      ?auto_274981 - DIRECTION
      ?auto_274980 - MODE
      ?auto_274982 - DIRECTION
      ?auto_274983 - MODE
      ?auto_274984 - DIRECTION
      ?auto_274985 - MODE
      ?auto_274986 - DIRECTION
      ?auto_274987 - MODE
    )
    :vars
    (
      ?auto_274993 - INSTRUMENT
      ?auto_274995 - SATELLITE
      ?auto_274990 - DIRECTION
      ?auto_274994 - INSTRUMENT
      ?auto_274988 - INSTRUMENT
      ?auto_274992 - INSTRUMENT
      ?auto_274991 - INSTRUMENT
      ?auto_274989 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_274993 ?auto_274995 ) ( SUPPORTS ?auto_274993 ?auto_274983 ) ( not ( = ?auto_274982 ?auto_274990 ) ) ( CALIBRATION_TARGET ?auto_274993 ?auto_274990 ) ( not ( = ?auto_274990 ?auto_274981 ) ) ( ON_BOARD ?auto_274994 ?auto_274995 ) ( not ( = ?auto_274982 ?auto_274981 ) ) ( not ( = ?auto_274993 ?auto_274994 ) ) ( SUPPORTS ?auto_274994 ?auto_274980 ) ( CALIBRATION_TARGET ?auto_274994 ?auto_274990 ) ( not ( = ?auto_274990 ?auto_274984 ) ) ( ON_BOARD ?auto_274988 ?auto_274995 ) ( not ( = ?auto_274981 ?auto_274984 ) ) ( not ( = ?auto_274994 ?auto_274988 ) ) ( SUPPORTS ?auto_274988 ?auto_274985 ) ( CALIBRATION_TARGET ?auto_274988 ?auto_274990 ) ( not ( = ?auto_274990 ?auto_274978 ) ) ( ON_BOARD ?auto_274992 ?auto_274995 ) ( not ( = ?auto_274984 ?auto_274978 ) ) ( not ( = ?auto_274988 ?auto_274992 ) ) ( SUPPORTS ?auto_274992 ?auto_274979 ) ( CALIBRATION_TARGET ?auto_274992 ?auto_274990 ) ( not ( = ?auto_274990 ?auto_274986 ) ) ( ON_BOARD ?auto_274991 ?auto_274995 ) ( not ( = ?auto_274978 ?auto_274986 ) ) ( not ( = ?auto_274992 ?auto_274991 ) ) ( SUPPORTS ?auto_274991 ?auto_274987 ) ( CALIBRATION_TARGET ?auto_274991 ?auto_274990 ) ( POWER_AVAIL ?auto_274995 ) ( POINTING ?auto_274995 ?auto_274989 ) ( not ( = ?auto_274990 ?auto_274989 ) ) ( not ( = ?auto_274986 ?auto_274989 ) ) ( not ( = ?auto_274987 ?auto_274979 ) ) ( not ( = ?auto_274978 ?auto_274989 ) ) ( not ( = ?auto_274986 ?auto_274984 ) ) ( not ( = ?auto_274987 ?auto_274985 ) ) ( not ( = ?auto_274979 ?auto_274985 ) ) ( not ( = ?auto_274984 ?auto_274989 ) ) ( not ( = ?auto_274988 ?auto_274991 ) ) ( not ( = ?auto_274986 ?auto_274981 ) ) ( not ( = ?auto_274987 ?auto_274980 ) ) ( not ( = ?auto_274978 ?auto_274981 ) ) ( not ( = ?auto_274979 ?auto_274980 ) ) ( not ( = ?auto_274985 ?auto_274980 ) ) ( not ( = ?auto_274981 ?auto_274989 ) ) ( not ( = ?auto_274994 ?auto_274992 ) ) ( not ( = ?auto_274994 ?auto_274991 ) ) ( not ( = ?auto_274986 ?auto_274982 ) ) ( not ( = ?auto_274987 ?auto_274983 ) ) ( not ( = ?auto_274978 ?auto_274982 ) ) ( not ( = ?auto_274979 ?auto_274983 ) ) ( not ( = ?auto_274984 ?auto_274982 ) ) ( not ( = ?auto_274985 ?auto_274983 ) ) ( not ( = ?auto_274980 ?auto_274983 ) ) ( not ( = ?auto_274982 ?auto_274989 ) ) ( not ( = ?auto_274993 ?auto_274988 ) ) ( not ( = ?auto_274993 ?auto_274992 ) ) ( not ( = ?auto_274993 ?auto_274991 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_274986 ?auto_274987 ?auto_274978 ?auto_274979 ?auto_274984 ?auto_274985 ?auto_274982 ?auto_274983 ?auto_274981 ?auto_274980 )
      ( GET-5IMAGE-VERIFY ?auto_274978 ?auto_274979 ?auto_274981 ?auto_274980 ?auto_274982 ?auto_274983 ?auto_274984 ?auto_274985 ?auto_274986 ?auto_274987 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_275560 - DIRECTION
      ?auto_275561 - MODE
      ?auto_275563 - DIRECTION
      ?auto_275562 - MODE
      ?auto_275564 - DIRECTION
      ?auto_275565 - MODE
      ?auto_275566 - DIRECTION
      ?auto_275567 - MODE
      ?auto_275568 - DIRECTION
      ?auto_275569 - MODE
    )
    :vars
    (
      ?auto_275575 - INSTRUMENT
      ?auto_275577 - SATELLITE
      ?auto_275572 - DIRECTION
      ?auto_275576 - INSTRUMENT
      ?auto_275570 - INSTRUMENT
      ?auto_275574 - INSTRUMENT
      ?auto_275573 - INSTRUMENT
      ?auto_275571 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275575 ?auto_275577 ) ( SUPPORTS ?auto_275575 ?auto_275562 ) ( not ( = ?auto_275563 ?auto_275572 ) ) ( CALIBRATION_TARGET ?auto_275575 ?auto_275572 ) ( not ( = ?auto_275572 ?auto_275568 ) ) ( ON_BOARD ?auto_275576 ?auto_275577 ) ( not ( = ?auto_275563 ?auto_275568 ) ) ( not ( = ?auto_275575 ?auto_275576 ) ) ( SUPPORTS ?auto_275576 ?auto_275569 ) ( CALIBRATION_TARGET ?auto_275576 ?auto_275572 ) ( not ( = ?auto_275572 ?auto_275566 ) ) ( ON_BOARD ?auto_275570 ?auto_275577 ) ( not ( = ?auto_275568 ?auto_275566 ) ) ( not ( = ?auto_275576 ?auto_275570 ) ) ( SUPPORTS ?auto_275570 ?auto_275567 ) ( CALIBRATION_TARGET ?auto_275570 ?auto_275572 ) ( not ( = ?auto_275572 ?auto_275560 ) ) ( ON_BOARD ?auto_275574 ?auto_275577 ) ( not ( = ?auto_275566 ?auto_275560 ) ) ( not ( = ?auto_275570 ?auto_275574 ) ) ( SUPPORTS ?auto_275574 ?auto_275561 ) ( CALIBRATION_TARGET ?auto_275574 ?auto_275572 ) ( not ( = ?auto_275572 ?auto_275564 ) ) ( ON_BOARD ?auto_275573 ?auto_275577 ) ( not ( = ?auto_275560 ?auto_275564 ) ) ( not ( = ?auto_275574 ?auto_275573 ) ) ( SUPPORTS ?auto_275573 ?auto_275565 ) ( CALIBRATION_TARGET ?auto_275573 ?auto_275572 ) ( POWER_AVAIL ?auto_275577 ) ( POINTING ?auto_275577 ?auto_275571 ) ( not ( = ?auto_275572 ?auto_275571 ) ) ( not ( = ?auto_275564 ?auto_275571 ) ) ( not ( = ?auto_275565 ?auto_275561 ) ) ( not ( = ?auto_275560 ?auto_275571 ) ) ( not ( = ?auto_275564 ?auto_275566 ) ) ( not ( = ?auto_275565 ?auto_275567 ) ) ( not ( = ?auto_275561 ?auto_275567 ) ) ( not ( = ?auto_275566 ?auto_275571 ) ) ( not ( = ?auto_275570 ?auto_275573 ) ) ( not ( = ?auto_275564 ?auto_275568 ) ) ( not ( = ?auto_275565 ?auto_275569 ) ) ( not ( = ?auto_275560 ?auto_275568 ) ) ( not ( = ?auto_275561 ?auto_275569 ) ) ( not ( = ?auto_275567 ?auto_275569 ) ) ( not ( = ?auto_275568 ?auto_275571 ) ) ( not ( = ?auto_275576 ?auto_275574 ) ) ( not ( = ?auto_275576 ?auto_275573 ) ) ( not ( = ?auto_275564 ?auto_275563 ) ) ( not ( = ?auto_275565 ?auto_275562 ) ) ( not ( = ?auto_275560 ?auto_275563 ) ) ( not ( = ?auto_275561 ?auto_275562 ) ) ( not ( = ?auto_275566 ?auto_275563 ) ) ( not ( = ?auto_275567 ?auto_275562 ) ) ( not ( = ?auto_275569 ?auto_275562 ) ) ( not ( = ?auto_275563 ?auto_275571 ) ) ( not ( = ?auto_275575 ?auto_275570 ) ) ( not ( = ?auto_275575 ?auto_275574 ) ) ( not ( = ?auto_275575 ?auto_275573 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_275564 ?auto_275565 ?auto_275560 ?auto_275561 ?auto_275566 ?auto_275567 ?auto_275563 ?auto_275562 ?auto_275568 ?auto_275569 )
      ( GET-5IMAGE-VERIFY ?auto_275560 ?auto_275561 ?auto_275563 ?auto_275562 ?auto_275564 ?auto_275565 ?auto_275566 ?auto_275567 ?auto_275568 ?auto_275569 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_275638 - DIRECTION
      ?auto_275639 - MODE
      ?auto_275641 - DIRECTION
      ?auto_275640 - MODE
      ?auto_275642 - DIRECTION
      ?auto_275643 - MODE
      ?auto_275644 - DIRECTION
      ?auto_275645 - MODE
      ?auto_275646 - DIRECTION
      ?auto_275647 - MODE
    )
    :vars
    (
      ?auto_275653 - INSTRUMENT
      ?auto_275655 - SATELLITE
      ?auto_275650 - DIRECTION
      ?auto_275654 - INSTRUMENT
      ?auto_275648 - INSTRUMENT
      ?auto_275652 - INSTRUMENT
      ?auto_275651 - INSTRUMENT
      ?auto_275649 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_275653 ?auto_275655 ) ( SUPPORTS ?auto_275653 ?auto_275640 ) ( not ( = ?auto_275641 ?auto_275650 ) ) ( CALIBRATION_TARGET ?auto_275653 ?auto_275650 ) ( not ( = ?auto_275650 ?auto_275644 ) ) ( ON_BOARD ?auto_275654 ?auto_275655 ) ( not ( = ?auto_275641 ?auto_275644 ) ) ( not ( = ?auto_275653 ?auto_275654 ) ) ( SUPPORTS ?auto_275654 ?auto_275645 ) ( CALIBRATION_TARGET ?auto_275654 ?auto_275650 ) ( not ( = ?auto_275650 ?auto_275646 ) ) ( ON_BOARD ?auto_275648 ?auto_275655 ) ( not ( = ?auto_275644 ?auto_275646 ) ) ( not ( = ?auto_275654 ?auto_275648 ) ) ( SUPPORTS ?auto_275648 ?auto_275647 ) ( CALIBRATION_TARGET ?auto_275648 ?auto_275650 ) ( not ( = ?auto_275650 ?auto_275638 ) ) ( ON_BOARD ?auto_275652 ?auto_275655 ) ( not ( = ?auto_275646 ?auto_275638 ) ) ( not ( = ?auto_275648 ?auto_275652 ) ) ( SUPPORTS ?auto_275652 ?auto_275639 ) ( CALIBRATION_TARGET ?auto_275652 ?auto_275650 ) ( not ( = ?auto_275650 ?auto_275642 ) ) ( ON_BOARD ?auto_275651 ?auto_275655 ) ( not ( = ?auto_275638 ?auto_275642 ) ) ( not ( = ?auto_275652 ?auto_275651 ) ) ( SUPPORTS ?auto_275651 ?auto_275643 ) ( CALIBRATION_TARGET ?auto_275651 ?auto_275650 ) ( POWER_AVAIL ?auto_275655 ) ( POINTING ?auto_275655 ?auto_275649 ) ( not ( = ?auto_275650 ?auto_275649 ) ) ( not ( = ?auto_275642 ?auto_275649 ) ) ( not ( = ?auto_275643 ?auto_275639 ) ) ( not ( = ?auto_275638 ?auto_275649 ) ) ( not ( = ?auto_275642 ?auto_275646 ) ) ( not ( = ?auto_275643 ?auto_275647 ) ) ( not ( = ?auto_275639 ?auto_275647 ) ) ( not ( = ?auto_275646 ?auto_275649 ) ) ( not ( = ?auto_275648 ?auto_275651 ) ) ( not ( = ?auto_275642 ?auto_275644 ) ) ( not ( = ?auto_275643 ?auto_275645 ) ) ( not ( = ?auto_275638 ?auto_275644 ) ) ( not ( = ?auto_275639 ?auto_275645 ) ) ( not ( = ?auto_275647 ?auto_275645 ) ) ( not ( = ?auto_275644 ?auto_275649 ) ) ( not ( = ?auto_275654 ?auto_275652 ) ) ( not ( = ?auto_275654 ?auto_275651 ) ) ( not ( = ?auto_275642 ?auto_275641 ) ) ( not ( = ?auto_275643 ?auto_275640 ) ) ( not ( = ?auto_275638 ?auto_275641 ) ) ( not ( = ?auto_275639 ?auto_275640 ) ) ( not ( = ?auto_275646 ?auto_275641 ) ) ( not ( = ?auto_275647 ?auto_275640 ) ) ( not ( = ?auto_275645 ?auto_275640 ) ) ( not ( = ?auto_275641 ?auto_275649 ) ) ( not ( = ?auto_275653 ?auto_275648 ) ) ( not ( = ?auto_275653 ?auto_275652 ) ) ( not ( = ?auto_275653 ?auto_275651 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_275642 ?auto_275643 ?auto_275638 ?auto_275639 ?auto_275646 ?auto_275647 ?auto_275641 ?auto_275640 ?auto_275644 ?auto_275645 )
      ( GET-5IMAGE-VERIFY ?auto_275638 ?auto_275639 ?auto_275641 ?auto_275640 ?auto_275642 ?auto_275643 ?auto_275644 ?auto_275645 ?auto_275646 ?auto_275647 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_276408 - DIRECTION
      ?auto_276409 - MODE
      ?auto_276411 - DIRECTION
      ?auto_276410 - MODE
      ?auto_276412 - DIRECTION
      ?auto_276413 - MODE
      ?auto_276414 - DIRECTION
      ?auto_276415 - MODE
      ?auto_276416 - DIRECTION
      ?auto_276417 - MODE
    )
    :vars
    (
      ?auto_276423 - INSTRUMENT
      ?auto_276425 - SATELLITE
      ?auto_276420 - DIRECTION
      ?auto_276424 - INSTRUMENT
      ?auto_276418 - INSTRUMENT
      ?auto_276422 - INSTRUMENT
      ?auto_276421 - INSTRUMENT
      ?auto_276419 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_276423 ?auto_276425 ) ( SUPPORTS ?auto_276423 ?auto_276410 ) ( not ( = ?auto_276411 ?auto_276420 ) ) ( CALIBRATION_TARGET ?auto_276423 ?auto_276420 ) ( not ( = ?auto_276420 ?auto_276416 ) ) ( ON_BOARD ?auto_276424 ?auto_276425 ) ( not ( = ?auto_276411 ?auto_276416 ) ) ( not ( = ?auto_276423 ?auto_276424 ) ) ( SUPPORTS ?auto_276424 ?auto_276417 ) ( CALIBRATION_TARGET ?auto_276424 ?auto_276420 ) ( not ( = ?auto_276420 ?auto_276412 ) ) ( ON_BOARD ?auto_276418 ?auto_276425 ) ( not ( = ?auto_276416 ?auto_276412 ) ) ( not ( = ?auto_276424 ?auto_276418 ) ) ( SUPPORTS ?auto_276418 ?auto_276413 ) ( CALIBRATION_TARGET ?auto_276418 ?auto_276420 ) ( not ( = ?auto_276420 ?auto_276408 ) ) ( ON_BOARD ?auto_276422 ?auto_276425 ) ( not ( = ?auto_276412 ?auto_276408 ) ) ( not ( = ?auto_276418 ?auto_276422 ) ) ( SUPPORTS ?auto_276422 ?auto_276409 ) ( CALIBRATION_TARGET ?auto_276422 ?auto_276420 ) ( not ( = ?auto_276420 ?auto_276414 ) ) ( ON_BOARD ?auto_276421 ?auto_276425 ) ( not ( = ?auto_276408 ?auto_276414 ) ) ( not ( = ?auto_276422 ?auto_276421 ) ) ( SUPPORTS ?auto_276421 ?auto_276415 ) ( CALIBRATION_TARGET ?auto_276421 ?auto_276420 ) ( POWER_AVAIL ?auto_276425 ) ( POINTING ?auto_276425 ?auto_276419 ) ( not ( = ?auto_276420 ?auto_276419 ) ) ( not ( = ?auto_276414 ?auto_276419 ) ) ( not ( = ?auto_276415 ?auto_276409 ) ) ( not ( = ?auto_276408 ?auto_276419 ) ) ( not ( = ?auto_276414 ?auto_276412 ) ) ( not ( = ?auto_276415 ?auto_276413 ) ) ( not ( = ?auto_276409 ?auto_276413 ) ) ( not ( = ?auto_276412 ?auto_276419 ) ) ( not ( = ?auto_276418 ?auto_276421 ) ) ( not ( = ?auto_276414 ?auto_276416 ) ) ( not ( = ?auto_276415 ?auto_276417 ) ) ( not ( = ?auto_276408 ?auto_276416 ) ) ( not ( = ?auto_276409 ?auto_276417 ) ) ( not ( = ?auto_276413 ?auto_276417 ) ) ( not ( = ?auto_276416 ?auto_276419 ) ) ( not ( = ?auto_276424 ?auto_276422 ) ) ( not ( = ?auto_276424 ?auto_276421 ) ) ( not ( = ?auto_276414 ?auto_276411 ) ) ( not ( = ?auto_276415 ?auto_276410 ) ) ( not ( = ?auto_276408 ?auto_276411 ) ) ( not ( = ?auto_276409 ?auto_276410 ) ) ( not ( = ?auto_276412 ?auto_276411 ) ) ( not ( = ?auto_276413 ?auto_276410 ) ) ( not ( = ?auto_276417 ?auto_276410 ) ) ( not ( = ?auto_276411 ?auto_276419 ) ) ( not ( = ?auto_276423 ?auto_276418 ) ) ( not ( = ?auto_276423 ?auto_276422 ) ) ( not ( = ?auto_276423 ?auto_276421 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_276414 ?auto_276415 ?auto_276408 ?auto_276409 ?auto_276412 ?auto_276413 ?auto_276411 ?auto_276410 ?auto_276416 ?auto_276417 )
      ( GET-5IMAGE-VERIFY ?auto_276408 ?auto_276409 ?auto_276411 ?auto_276410 ?auto_276412 ?auto_276413 ?auto_276414 ?auto_276415 ?auto_276416 ?auto_276417 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_276658 - DIRECTION
      ?auto_276659 - MODE
      ?auto_276661 - DIRECTION
      ?auto_276660 - MODE
      ?auto_276662 - DIRECTION
      ?auto_276663 - MODE
      ?auto_276664 - DIRECTION
      ?auto_276665 - MODE
      ?auto_276666 - DIRECTION
      ?auto_276667 - MODE
    )
    :vars
    (
      ?auto_276673 - INSTRUMENT
      ?auto_276675 - SATELLITE
      ?auto_276670 - DIRECTION
      ?auto_276674 - INSTRUMENT
      ?auto_276668 - INSTRUMENT
      ?auto_276672 - INSTRUMENT
      ?auto_276671 - INSTRUMENT
      ?auto_276669 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_276673 ?auto_276675 ) ( SUPPORTS ?auto_276673 ?auto_276660 ) ( not ( = ?auto_276661 ?auto_276670 ) ) ( CALIBRATION_TARGET ?auto_276673 ?auto_276670 ) ( not ( = ?auto_276670 ?auto_276664 ) ) ( ON_BOARD ?auto_276674 ?auto_276675 ) ( not ( = ?auto_276661 ?auto_276664 ) ) ( not ( = ?auto_276673 ?auto_276674 ) ) ( SUPPORTS ?auto_276674 ?auto_276665 ) ( CALIBRATION_TARGET ?auto_276674 ?auto_276670 ) ( not ( = ?auto_276670 ?auto_276662 ) ) ( ON_BOARD ?auto_276668 ?auto_276675 ) ( not ( = ?auto_276664 ?auto_276662 ) ) ( not ( = ?auto_276674 ?auto_276668 ) ) ( SUPPORTS ?auto_276668 ?auto_276663 ) ( CALIBRATION_TARGET ?auto_276668 ?auto_276670 ) ( not ( = ?auto_276670 ?auto_276658 ) ) ( ON_BOARD ?auto_276672 ?auto_276675 ) ( not ( = ?auto_276662 ?auto_276658 ) ) ( not ( = ?auto_276668 ?auto_276672 ) ) ( SUPPORTS ?auto_276672 ?auto_276659 ) ( CALIBRATION_TARGET ?auto_276672 ?auto_276670 ) ( not ( = ?auto_276670 ?auto_276666 ) ) ( ON_BOARD ?auto_276671 ?auto_276675 ) ( not ( = ?auto_276658 ?auto_276666 ) ) ( not ( = ?auto_276672 ?auto_276671 ) ) ( SUPPORTS ?auto_276671 ?auto_276667 ) ( CALIBRATION_TARGET ?auto_276671 ?auto_276670 ) ( POWER_AVAIL ?auto_276675 ) ( POINTING ?auto_276675 ?auto_276669 ) ( not ( = ?auto_276670 ?auto_276669 ) ) ( not ( = ?auto_276666 ?auto_276669 ) ) ( not ( = ?auto_276667 ?auto_276659 ) ) ( not ( = ?auto_276658 ?auto_276669 ) ) ( not ( = ?auto_276666 ?auto_276662 ) ) ( not ( = ?auto_276667 ?auto_276663 ) ) ( not ( = ?auto_276659 ?auto_276663 ) ) ( not ( = ?auto_276662 ?auto_276669 ) ) ( not ( = ?auto_276668 ?auto_276671 ) ) ( not ( = ?auto_276666 ?auto_276664 ) ) ( not ( = ?auto_276667 ?auto_276665 ) ) ( not ( = ?auto_276658 ?auto_276664 ) ) ( not ( = ?auto_276659 ?auto_276665 ) ) ( not ( = ?auto_276663 ?auto_276665 ) ) ( not ( = ?auto_276664 ?auto_276669 ) ) ( not ( = ?auto_276674 ?auto_276672 ) ) ( not ( = ?auto_276674 ?auto_276671 ) ) ( not ( = ?auto_276666 ?auto_276661 ) ) ( not ( = ?auto_276667 ?auto_276660 ) ) ( not ( = ?auto_276658 ?auto_276661 ) ) ( not ( = ?auto_276659 ?auto_276660 ) ) ( not ( = ?auto_276662 ?auto_276661 ) ) ( not ( = ?auto_276663 ?auto_276660 ) ) ( not ( = ?auto_276665 ?auto_276660 ) ) ( not ( = ?auto_276661 ?auto_276669 ) ) ( not ( = ?auto_276673 ?auto_276668 ) ) ( not ( = ?auto_276673 ?auto_276672 ) ) ( not ( = ?auto_276673 ?auto_276671 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_276666 ?auto_276667 ?auto_276658 ?auto_276659 ?auto_276662 ?auto_276663 ?auto_276661 ?auto_276660 ?auto_276664 ?auto_276665 )
      ( GET-5IMAGE-VERIFY ?auto_276658 ?auto_276659 ?auto_276661 ?auto_276660 ?auto_276662 ?auto_276663 ?auto_276664 ?auto_276665 ?auto_276666 ?auto_276667 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_276902 - DIRECTION
      ?auto_276903 - MODE
      ?auto_276905 - DIRECTION
      ?auto_276904 - MODE
      ?auto_276906 - DIRECTION
      ?auto_276907 - MODE
      ?auto_276908 - DIRECTION
      ?auto_276909 - MODE
      ?auto_276910 - DIRECTION
      ?auto_276911 - MODE
    )
    :vars
    (
      ?auto_276917 - INSTRUMENT
      ?auto_276919 - SATELLITE
      ?auto_276914 - DIRECTION
      ?auto_276918 - INSTRUMENT
      ?auto_276912 - INSTRUMENT
      ?auto_276916 - INSTRUMENT
      ?auto_276915 - INSTRUMENT
      ?auto_276913 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_276917 ?auto_276919 ) ( SUPPORTS ?auto_276917 ?auto_276904 ) ( not ( = ?auto_276905 ?auto_276914 ) ) ( CALIBRATION_TARGET ?auto_276917 ?auto_276914 ) ( not ( = ?auto_276914 ?auto_276906 ) ) ( ON_BOARD ?auto_276918 ?auto_276919 ) ( not ( = ?auto_276905 ?auto_276906 ) ) ( not ( = ?auto_276917 ?auto_276918 ) ) ( SUPPORTS ?auto_276918 ?auto_276907 ) ( CALIBRATION_TARGET ?auto_276918 ?auto_276914 ) ( not ( = ?auto_276914 ?auto_276910 ) ) ( ON_BOARD ?auto_276912 ?auto_276919 ) ( not ( = ?auto_276906 ?auto_276910 ) ) ( not ( = ?auto_276918 ?auto_276912 ) ) ( SUPPORTS ?auto_276912 ?auto_276911 ) ( CALIBRATION_TARGET ?auto_276912 ?auto_276914 ) ( not ( = ?auto_276914 ?auto_276902 ) ) ( ON_BOARD ?auto_276916 ?auto_276919 ) ( not ( = ?auto_276910 ?auto_276902 ) ) ( not ( = ?auto_276912 ?auto_276916 ) ) ( SUPPORTS ?auto_276916 ?auto_276903 ) ( CALIBRATION_TARGET ?auto_276916 ?auto_276914 ) ( not ( = ?auto_276914 ?auto_276908 ) ) ( ON_BOARD ?auto_276915 ?auto_276919 ) ( not ( = ?auto_276902 ?auto_276908 ) ) ( not ( = ?auto_276916 ?auto_276915 ) ) ( SUPPORTS ?auto_276915 ?auto_276909 ) ( CALIBRATION_TARGET ?auto_276915 ?auto_276914 ) ( POWER_AVAIL ?auto_276919 ) ( POINTING ?auto_276919 ?auto_276913 ) ( not ( = ?auto_276914 ?auto_276913 ) ) ( not ( = ?auto_276908 ?auto_276913 ) ) ( not ( = ?auto_276909 ?auto_276903 ) ) ( not ( = ?auto_276902 ?auto_276913 ) ) ( not ( = ?auto_276908 ?auto_276910 ) ) ( not ( = ?auto_276909 ?auto_276911 ) ) ( not ( = ?auto_276903 ?auto_276911 ) ) ( not ( = ?auto_276910 ?auto_276913 ) ) ( not ( = ?auto_276912 ?auto_276915 ) ) ( not ( = ?auto_276908 ?auto_276906 ) ) ( not ( = ?auto_276909 ?auto_276907 ) ) ( not ( = ?auto_276902 ?auto_276906 ) ) ( not ( = ?auto_276903 ?auto_276907 ) ) ( not ( = ?auto_276911 ?auto_276907 ) ) ( not ( = ?auto_276906 ?auto_276913 ) ) ( not ( = ?auto_276918 ?auto_276916 ) ) ( not ( = ?auto_276918 ?auto_276915 ) ) ( not ( = ?auto_276908 ?auto_276905 ) ) ( not ( = ?auto_276909 ?auto_276904 ) ) ( not ( = ?auto_276902 ?auto_276905 ) ) ( not ( = ?auto_276903 ?auto_276904 ) ) ( not ( = ?auto_276910 ?auto_276905 ) ) ( not ( = ?auto_276911 ?auto_276904 ) ) ( not ( = ?auto_276907 ?auto_276904 ) ) ( not ( = ?auto_276905 ?auto_276913 ) ) ( not ( = ?auto_276917 ?auto_276912 ) ) ( not ( = ?auto_276917 ?auto_276916 ) ) ( not ( = ?auto_276917 ?auto_276915 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_276908 ?auto_276909 ?auto_276902 ?auto_276903 ?auto_276910 ?auto_276911 ?auto_276905 ?auto_276904 ?auto_276906 ?auto_276907 )
      ( GET-5IMAGE-VERIFY ?auto_276902 ?auto_276903 ?auto_276905 ?auto_276904 ?auto_276906 ?auto_276907 ?auto_276908 ?auto_276909 ?auto_276910 ?auto_276911 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_277066 - DIRECTION
      ?auto_277067 - MODE
      ?auto_277069 - DIRECTION
      ?auto_277068 - MODE
      ?auto_277070 - DIRECTION
      ?auto_277071 - MODE
      ?auto_277072 - DIRECTION
      ?auto_277073 - MODE
      ?auto_277074 - DIRECTION
      ?auto_277075 - MODE
    )
    :vars
    (
      ?auto_277081 - INSTRUMENT
      ?auto_277083 - SATELLITE
      ?auto_277078 - DIRECTION
      ?auto_277082 - INSTRUMENT
      ?auto_277076 - INSTRUMENT
      ?auto_277080 - INSTRUMENT
      ?auto_277079 - INSTRUMENT
      ?auto_277077 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_277081 ?auto_277083 ) ( SUPPORTS ?auto_277081 ?auto_277068 ) ( not ( = ?auto_277069 ?auto_277078 ) ) ( CALIBRATION_TARGET ?auto_277081 ?auto_277078 ) ( not ( = ?auto_277078 ?auto_277070 ) ) ( ON_BOARD ?auto_277082 ?auto_277083 ) ( not ( = ?auto_277069 ?auto_277070 ) ) ( not ( = ?auto_277081 ?auto_277082 ) ) ( SUPPORTS ?auto_277082 ?auto_277071 ) ( CALIBRATION_TARGET ?auto_277082 ?auto_277078 ) ( not ( = ?auto_277078 ?auto_277072 ) ) ( ON_BOARD ?auto_277076 ?auto_277083 ) ( not ( = ?auto_277070 ?auto_277072 ) ) ( not ( = ?auto_277082 ?auto_277076 ) ) ( SUPPORTS ?auto_277076 ?auto_277073 ) ( CALIBRATION_TARGET ?auto_277076 ?auto_277078 ) ( not ( = ?auto_277078 ?auto_277066 ) ) ( ON_BOARD ?auto_277080 ?auto_277083 ) ( not ( = ?auto_277072 ?auto_277066 ) ) ( not ( = ?auto_277076 ?auto_277080 ) ) ( SUPPORTS ?auto_277080 ?auto_277067 ) ( CALIBRATION_TARGET ?auto_277080 ?auto_277078 ) ( not ( = ?auto_277078 ?auto_277074 ) ) ( ON_BOARD ?auto_277079 ?auto_277083 ) ( not ( = ?auto_277066 ?auto_277074 ) ) ( not ( = ?auto_277080 ?auto_277079 ) ) ( SUPPORTS ?auto_277079 ?auto_277075 ) ( CALIBRATION_TARGET ?auto_277079 ?auto_277078 ) ( POWER_AVAIL ?auto_277083 ) ( POINTING ?auto_277083 ?auto_277077 ) ( not ( = ?auto_277078 ?auto_277077 ) ) ( not ( = ?auto_277074 ?auto_277077 ) ) ( not ( = ?auto_277075 ?auto_277067 ) ) ( not ( = ?auto_277066 ?auto_277077 ) ) ( not ( = ?auto_277074 ?auto_277072 ) ) ( not ( = ?auto_277075 ?auto_277073 ) ) ( not ( = ?auto_277067 ?auto_277073 ) ) ( not ( = ?auto_277072 ?auto_277077 ) ) ( not ( = ?auto_277076 ?auto_277079 ) ) ( not ( = ?auto_277074 ?auto_277070 ) ) ( not ( = ?auto_277075 ?auto_277071 ) ) ( not ( = ?auto_277066 ?auto_277070 ) ) ( not ( = ?auto_277067 ?auto_277071 ) ) ( not ( = ?auto_277073 ?auto_277071 ) ) ( not ( = ?auto_277070 ?auto_277077 ) ) ( not ( = ?auto_277082 ?auto_277080 ) ) ( not ( = ?auto_277082 ?auto_277079 ) ) ( not ( = ?auto_277074 ?auto_277069 ) ) ( not ( = ?auto_277075 ?auto_277068 ) ) ( not ( = ?auto_277066 ?auto_277069 ) ) ( not ( = ?auto_277067 ?auto_277068 ) ) ( not ( = ?auto_277072 ?auto_277069 ) ) ( not ( = ?auto_277073 ?auto_277068 ) ) ( not ( = ?auto_277071 ?auto_277068 ) ) ( not ( = ?auto_277069 ?auto_277077 ) ) ( not ( = ?auto_277081 ?auto_277076 ) ) ( not ( = ?auto_277081 ?auto_277080 ) ) ( not ( = ?auto_277081 ?auto_277079 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_277074 ?auto_277075 ?auto_277066 ?auto_277067 ?auto_277072 ?auto_277073 ?auto_277069 ?auto_277068 ?auto_277070 ?auto_277071 )
      ( GET-5IMAGE-VERIFY ?auto_277066 ?auto_277067 ?auto_277069 ?auto_277068 ?auto_277070 ?auto_277071 ?auto_277072 ?auto_277073 ?auto_277074 ?auto_277075 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_278172 - DIRECTION
      ?auto_278173 - MODE
      ?auto_278175 - DIRECTION
      ?auto_278174 - MODE
      ?auto_278176 - DIRECTION
      ?auto_278177 - MODE
      ?auto_278178 - DIRECTION
      ?auto_278179 - MODE
      ?auto_278180 - DIRECTION
      ?auto_278181 - MODE
    )
    :vars
    (
      ?auto_278187 - INSTRUMENT
      ?auto_278189 - SATELLITE
      ?auto_278184 - DIRECTION
      ?auto_278188 - INSTRUMENT
      ?auto_278182 - INSTRUMENT
      ?auto_278186 - INSTRUMENT
      ?auto_278185 - INSTRUMENT
      ?auto_278183 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_278187 ?auto_278189 ) ( SUPPORTS ?auto_278187 ?auto_278181 ) ( not ( = ?auto_278180 ?auto_278184 ) ) ( CALIBRATION_TARGET ?auto_278187 ?auto_278184 ) ( not ( = ?auto_278184 ?auto_278178 ) ) ( ON_BOARD ?auto_278188 ?auto_278189 ) ( not ( = ?auto_278180 ?auto_278178 ) ) ( not ( = ?auto_278187 ?auto_278188 ) ) ( SUPPORTS ?auto_278188 ?auto_278179 ) ( CALIBRATION_TARGET ?auto_278188 ?auto_278184 ) ( not ( = ?auto_278184 ?auto_278172 ) ) ( ON_BOARD ?auto_278182 ?auto_278189 ) ( not ( = ?auto_278178 ?auto_278172 ) ) ( not ( = ?auto_278188 ?auto_278182 ) ) ( SUPPORTS ?auto_278182 ?auto_278173 ) ( CALIBRATION_TARGET ?auto_278182 ?auto_278184 ) ( not ( = ?auto_278184 ?auto_278176 ) ) ( ON_BOARD ?auto_278186 ?auto_278189 ) ( not ( = ?auto_278172 ?auto_278176 ) ) ( not ( = ?auto_278182 ?auto_278186 ) ) ( SUPPORTS ?auto_278186 ?auto_278177 ) ( CALIBRATION_TARGET ?auto_278186 ?auto_278184 ) ( not ( = ?auto_278184 ?auto_278175 ) ) ( ON_BOARD ?auto_278185 ?auto_278189 ) ( not ( = ?auto_278176 ?auto_278175 ) ) ( not ( = ?auto_278186 ?auto_278185 ) ) ( SUPPORTS ?auto_278185 ?auto_278174 ) ( CALIBRATION_TARGET ?auto_278185 ?auto_278184 ) ( POWER_AVAIL ?auto_278189 ) ( POINTING ?auto_278189 ?auto_278183 ) ( not ( = ?auto_278184 ?auto_278183 ) ) ( not ( = ?auto_278175 ?auto_278183 ) ) ( not ( = ?auto_278174 ?auto_278177 ) ) ( not ( = ?auto_278176 ?auto_278183 ) ) ( not ( = ?auto_278175 ?auto_278172 ) ) ( not ( = ?auto_278174 ?auto_278173 ) ) ( not ( = ?auto_278177 ?auto_278173 ) ) ( not ( = ?auto_278172 ?auto_278183 ) ) ( not ( = ?auto_278182 ?auto_278185 ) ) ( not ( = ?auto_278175 ?auto_278178 ) ) ( not ( = ?auto_278174 ?auto_278179 ) ) ( not ( = ?auto_278176 ?auto_278178 ) ) ( not ( = ?auto_278177 ?auto_278179 ) ) ( not ( = ?auto_278173 ?auto_278179 ) ) ( not ( = ?auto_278178 ?auto_278183 ) ) ( not ( = ?auto_278188 ?auto_278186 ) ) ( not ( = ?auto_278188 ?auto_278185 ) ) ( not ( = ?auto_278175 ?auto_278180 ) ) ( not ( = ?auto_278174 ?auto_278181 ) ) ( not ( = ?auto_278176 ?auto_278180 ) ) ( not ( = ?auto_278177 ?auto_278181 ) ) ( not ( = ?auto_278172 ?auto_278180 ) ) ( not ( = ?auto_278173 ?auto_278181 ) ) ( not ( = ?auto_278179 ?auto_278181 ) ) ( not ( = ?auto_278180 ?auto_278183 ) ) ( not ( = ?auto_278187 ?auto_278182 ) ) ( not ( = ?auto_278187 ?auto_278186 ) ) ( not ( = ?auto_278187 ?auto_278185 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_278175 ?auto_278174 ?auto_278176 ?auto_278177 ?auto_278172 ?auto_278173 ?auto_278180 ?auto_278181 ?auto_278178 ?auto_278179 )
      ( GET-5IMAGE-VERIFY ?auto_278172 ?auto_278173 ?auto_278175 ?auto_278174 ?auto_278176 ?auto_278177 ?auto_278178 ?auto_278179 ?auto_278180 ?auto_278181 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_278250 - DIRECTION
      ?auto_278251 - MODE
      ?auto_278253 - DIRECTION
      ?auto_278252 - MODE
      ?auto_278254 - DIRECTION
      ?auto_278255 - MODE
      ?auto_278256 - DIRECTION
      ?auto_278257 - MODE
      ?auto_278258 - DIRECTION
      ?auto_278259 - MODE
    )
    :vars
    (
      ?auto_278265 - INSTRUMENT
      ?auto_278267 - SATELLITE
      ?auto_278262 - DIRECTION
      ?auto_278266 - INSTRUMENT
      ?auto_278260 - INSTRUMENT
      ?auto_278264 - INSTRUMENT
      ?auto_278263 - INSTRUMENT
      ?auto_278261 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_278265 ?auto_278267 ) ( SUPPORTS ?auto_278265 ?auto_278257 ) ( not ( = ?auto_278256 ?auto_278262 ) ) ( CALIBRATION_TARGET ?auto_278265 ?auto_278262 ) ( not ( = ?auto_278262 ?auto_278258 ) ) ( ON_BOARD ?auto_278266 ?auto_278267 ) ( not ( = ?auto_278256 ?auto_278258 ) ) ( not ( = ?auto_278265 ?auto_278266 ) ) ( SUPPORTS ?auto_278266 ?auto_278259 ) ( CALIBRATION_TARGET ?auto_278266 ?auto_278262 ) ( not ( = ?auto_278262 ?auto_278250 ) ) ( ON_BOARD ?auto_278260 ?auto_278267 ) ( not ( = ?auto_278258 ?auto_278250 ) ) ( not ( = ?auto_278266 ?auto_278260 ) ) ( SUPPORTS ?auto_278260 ?auto_278251 ) ( CALIBRATION_TARGET ?auto_278260 ?auto_278262 ) ( not ( = ?auto_278262 ?auto_278254 ) ) ( ON_BOARD ?auto_278264 ?auto_278267 ) ( not ( = ?auto_278250 ?auto_278254 ) ) ( not ( = ?auto_278260 ?auto_278264 ) ) ( SUPPORTS ?auto_278264 ?auto_278255 ) ( CALIBRATION_TARGET ?auto_278264 ?auto_278262 ) ( not ( = ?auto_278262 ?auto_278253 ) ) ( ON_BOARD ?auto_278263 ?auto_278267 ) ( not ( = ?auto_278254 ?auto_278253 ) ) ( not ( = ?auto_278264 ?auto_278263 ) ) ( SUPPORTS ?auto_278263 ?auto_278252 ) ( CALIBRATION_TARGET ?auto_278263 ?auto_278262 ) ( POWER_AVAIL ?auto_278267 ) ( POINTING ?auto_278267 ?auto_278261 ) ( not ( = ?auto_278262 ?auto_278261 ) ) ( not ( = ?auto_278253 ?auto_278261 ) ) ( not ( = ?auto_278252 ?auto_278255 ) ) ( not ( = ?auto_278254 ?auto_278261 ) ) ( not ( = ?auto_278253 ?auto_278250 ) ) ( not ( = ?auto_278252 ?auto_278251 ) ) ( not ( = ?auto_278255 ?auto_278251 ) ) ( not ( = ?auto_278250 ?auto_278261 ) ) ( not ( = ?auto_278260 ?auto_278263 ) ) ( not ( = ?auto_278253 ?auto_278258 ) ) ( not ( = ?auto_278252 ?auto_278259 ) ) ( not ( = ?auto_278254 ?auto_278258 ) ) ( not ( = ?auto_278255 ?auto_278259 ) ) ( not ( = ?auto_278251 ?auto_278259 ) ) ( not ( = ?auto_278258 ?auto_278261 ) ) ( not ( = ?auto_278266 ?auto_278264 ) ) ( not ( = ?auto_278266 ?auto_278263 ) ) ( not ( = ?auto_278253 ?auto_278256 ) ) ( not ( = ?auto_278252 ?auto_278257 ) ) ( not ( = ?auto_278254 ?auto_278256 ) ) ( not ( = ?auto_278255 ?auto_278257 ) ) ( not ( = ?auto_278250 ?auto_278256 ) ) ( not ( = ?auto_278251 ?auto_278257 ) ) ( not ( = ?auto_278259 ?auto_278257 ) ) ( not ( = ?auto_278256 ?auto_278261 ) ) ( not ( = ?auto_278265 ?auto_278260 ) ) ( not ( = ?auto_278265 ?auto_278264 ) ) ( not ( = ?auto_278265 ?auto_278263 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_278253 ?auto_278252 ?auto_278254 ?auto_278255 ?auto_278250 ?auto_278251 ?auto_278256 ?auto_278257 ?auto_278258 ?auto_278259 )
      ( GET-5IMAGE-VERIFY ?auto_278250 ?auto_278251 ?auto_278253 ?auto_278252 ?auto_278254 ?auto_278255 ?auto_278256 ?auto_278257 ?auto_278258 ?auto_278259 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_278498 - DIRECTION
      ?auto_278499 - MODE
      ?auto_278501 - DIRECTION
      ?auto_278500 - MODE
      ?auto_278502 - DIRECTION
      ?auto_278503 - MODE
      ?auto_278504 - DIRECTION
      ?auto_278505 - MODE
      ?auto_278506 - DIRECTION
      ?auto_278507 - MODE
    )
    :vars
    (
      ?auto_278513 - INSTRUMENT
      ?auto_278515 - SATELLITE
      ?auto_278510 - DIRECTION
      ?auto_278514 - INSTRUMENT
      ?auto_278508 - INSTRUMENT
      ?auto_278512 - INSTRUMENT
      ?auto_278511 - INSTRUMENT
      ?auto_278509 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_278513 ?auto_278515 ) ( SUPPORTS ?auto_278513 ?auto_278507 ) ( not ( = ?auto_278506 ?auto_278510 ) ) ( CALIBRATION_TARGET ?auto_278513 ?auto_278510 ) ( not ( = ?auto_278510 ?auto_278502 ) ) ( ON_BOARD ?auto_278514 ?auto_278515 ) ( not ( = ?auto_278506 ?auto_278502 ) ) ( not ( = ?auto_278513 ?auto_278514 ) ) ( SUPPORTS ?auto_278514 ?auto_278503 ) ( CALIBRATION_TARGET ?auto_278514 ?auto_278510 ) ( not ( = ?auto_278510 ?auto_278498 ) ) ( ON_BOARD ?auto_278508 ?auto_278515 ) ( not ( = ?auto_278502 ?auto_278498 ) ) ( not ( = ?auto_278514 ?auto_278508 ) ) ( SUPPORTS ?auto_278508 ?auto_278499 ) ( CALIBRATION_TARGET ?auto_278508 ?auto_278510 ) ( not ( = ?auto_278510 ?auto_278504 ) ) ( ON_BOARD ?auto_278512 ?auto_278515 ) ( not ( = ?auto_278498 ?auto_278504 ) ) ( not ( = ?auto_278508 ?auto_278512 ) ) ( SUPPORTS ?auto_278512 ?auto_278505 ) ( CALIBRATION_TARGET ?auto_278512 ?auto_278510 ) ( not ( = ?auto_278510 ?auto_278501 ) ) ( ON_BOARD ?auto_278511 ?auto_278515 ) ( not ( = ?auto_278504 ?auto_278501 ) ) ( not ( = ?auto_278512 ?auto_278511 ) ) ( SUPPORTS ?auto_278511 ?auto_278500 ) ( CALIBRATION_TARGET ?auto_278511 ?auto_278510 ) ( POWER_AVAIL ?auto_278515 ) ( POINTING ?auto_278515 ?auto_278509 ) ( not ( = ?auto_278510 ?auto_278509 ) ) ( not ( = ?auto_278501 ?auto_278509 ) ) ( not ( = ?auto_278500 ?auto_278505 ) ) ( not ( = ?auto_278504 ?auto_278509 ) ) ( not ( = ?auto_278501 ?auto_278498 ) ) ( not ( = ?auto_278500 ?auto_278499 ) ) ( not ( = ?auto_278505 ?auto_278499 ) ) ( not ( = ?auto_278498 ?auto_278509 ) ) ( not ( = ?auto_278508 ?auto_278511 ) ) ( not ( = ?auto_278501 ?auto_278502 ) ) ( not ( = ?auto_278500 ?auto_278503 ) ) ( not ( = ?auto_278504 ?auto_278502 ) ) ( not ( = ?auto_278505 ?auto_278503 ) ) ( not ( = ?auto_278499 ?auto_278503 ) ) ( not ( = ?auto_278502 ?auto_278509 ) ) ( not ( = ?auto_278514 ?auto_278512 ) ) ( not ( = ?auto_278514 ?auto_278511 ) ) ( not ( = ?auto_278501 ?auto_278506 ) ) ( not ( = ?auto_278500 ?auto_278507 ) ) ( not ( = ?auto_278504 ?auto_278506 ) ) ( not ( = ?auto_278505 ?auto_278507 ) ) ( not ( = ?auto_278498 ?auto_278506 ) ) ( not ( = ?auto_278499 ?auto_278507 ) ) ( not ( = ?auto_278503 ?auto_278507 ) ) ( not ( = ?auto_278506 ?auto_278509 ) ) ( not ( = ?auto_278513 ?auto_278508 ) ) ( not ( = ?auto_278513 ?auto_278512 ) ) ( not ( = ?auto_278513 ?auto_278511 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_278501 ?auto_278500 ?auto_278504 ?auto_278505 ?auto_278498 ?auto_278499 ?auto_278506 ?auto_278507 ?auto_278502 ?auto_278503 )
      ( GET-5IMAGE-VERIFY ?auto_278498 ?auto_278499 ?auto_278501 ?auto_278500 ?auto_278502 ?auto_278503 ?auto_278504 ?auto_278505 ?auto_278506 ?auto_278507 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_278576 - DIRECTION
      ?auto_278577 - MODE
      ?auto_278579 - DIRECTION
      ?auto_278578 - MODE
      ?auto_278580 - DIRECTION
      ?auto_278581 - MODE
      ?auto_278582 - DIRECTION
      ?auto_278583 - MODE
      ?auto_278584 - DIRECTION
      ?auto_278585 - MODE
    )
    :vars
    (
      ?auto_278591 - INSTRUMENT
      ?auto_278593 - SATELLITE
      ?auto_278588 - DIRECTION
      ?auto_278592 - INSTRUMENT
      ?auto_278586 - INSTRUMENT
      ?auto_278590 - INSTRUMENT
      ?auto_278589 - INSTRUMENT
      ?auto_278587 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_278591 ?auto_278593 ) ( SUPPORTS ?auto_278591 ?auto_278583 ) ( not ( = ?auto_278582 ?auto_278588 ) ) ( CALIBRATION_TARGET ?auto_278591 ?auto_278588 ) ( not ( = ?auto_278588 ?auto_278580 ) ) ( ON_BOARD ?auto_278592 ?auto_278593 ) ( not ( = ?auto_278582 ?auto_278580 ) ) ( not ( = ?auto_278591 ?auto_278592 ) ) ( SUPPORTS ?auto_278592 ?auto_278581 ) ( CALIBRATION_TARGET ?auto_278592 ?auto_278588 ) ( not ( = ?auto_278588 ?auto_278576 ) ) ( ON_BOARD ?auto_278586 ?auto_278593 ) ( not ( = ?auto_278580 ?auto_278576 ) ) ( not ( = ?auto_278592 ?auto_278586 ) ) ( SUPPORTS ?auto_278586 ?auto_278577 ) ( CALIBRATION_TARGET ?auto_278586 ?auto_278588 ) ( not ( = ?auto_278588 ?auto_278584 ) ) ( ON_BOARD ?auto_278590 ?auto_278593 ) ( not ( = ?auto_278576 ?auto_278584 ) ) ( not ( = ?auto_278586 ?auto_278590 ) ) ( SUPPORTS ?auto_278590 ?auto_278585 ) ( CALIBRATION_TARGET ?auto_278590 ?auto_278588 ) ( not ( = ?auto_278588 ?auto_278579 ) ) ( ON_BOARD ?auto_278589 ?auto_278593 ) ( not ( = ?auto_278584 ?auto_278579 ) ) ( not ( = ?auto_278590 ?auto_278589 ) ) ( SUPPORTS ?auto_278589 ?auto_278578 ) ( CALIBRATION_TARGET ?auto_278589 ?auto_278588 ) ( POWER_AVAIL ?auto_278593 ) ( POINTING ?auto_278593 ?auto_278587 ) ( not ( = ?auto_278588 ?auto_278587 ) ) ( not ( = ?auto_278579 ?auto_278587 ) ) ( not ( = ?auto_278578 ?auto_278585 ) ) ( not ( = ?auto_278584 ?auto_278587 ) ) ( not ( = ?auto_278579 ?auto_278576 ) ) ( not ( = ?auto_278578 ?auto_278577 ) ) ( not ( = ?auto_278585 ?auto_278577 ) ) ( not ( = ?auto_278576 ?auto_278587 ) ) ( not ( = ?auto_278586 ?auto_278589 ) ) ( not ( = ?auto_278579 ?auto_278580 ) ) ( not ( = ?auto_278578 ?auto_278581 ) ) ( not ( = ?auto_278584 ?auto_278580 ) ) ( not ( = ?auto_278585 ?auto_278581 ) ) ( not ( = ?auto_278577 ?auto_278581 ) ) ( not ( = ?auto_278580 ?auto_278587 ) ) ( not ( = ?auto_278592 ?auto_278590 ) ) ( not ( = ?auto_278592 ?auto_278589 ) ) ( not ( = ?auto_278579 ?auto_278582 ) ) ( not ( = ?auto_278578 ?auto_278583 ) ) ( not ( = ?auto_278584 ?auto_278582 ) ) ( not ( = ?auto_278585 ?auto_278583 ) ) ( not ( = ?auto_278576 ?auto_278582 ) ) ( not ( = ?auto_278577 ?auto_278583 ) ) ( not ( = ?auto_278581 ?auto_278583 ) ) ( not ( = ?auto_278582 ?auto_278587 ) ) ( not ( = ?auto_278591 ?auto_278586 ) ) ( not ( = ?auto_278591 ?auto_278590 ) ) ( not ( = ?auto_278591 ?auto_278589 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_278579 ?auto_278578 ?auto_278584 ?auto_278585 ?auto_278576 ?auto_278577 ?auto_278582 ?auto_278583 ?auto_278580 ?auto_278581 )
      ( GET-5IMAGE-VERIFY ?auto_278576 ?auto_278577 ?auto_278579 ?auto_278578 ?auto_278580 ?auto_278581 ?auto_278582 ?auto_278583 ?auto_278584 ?auto_278585 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_278820 - DIRECTION
      ?auto_278821 - MODE
      ?auto_278823 - DIRECTION
      ?auto_278822 - MODE
      ?auto_278824 - DIRECTION
      ?auto_278825 - MODE
      ?auto_278826 - DIRECTION
      ?auto_278827 - MODE
      ?auto_278828 - DIRECTION
      ?auto_278829 - MODE
    )
    :vars
    (
      ?auto_278835 - INSTRUMENT
      ?auto_278837 - SATELLITE
      ?auto_278832 - DIRECTION
      ?auto_278836 - INSTRUMENT
      ?auto_278830 - INSTRUMENT
      ?auto_278834 - INSTRUMENT
      ?auto_278833 - INSTRUMENT
      ?auto_278831 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_278835 ?auto_278837 ) ( SUPPORTS ?auto_278835 ?auto_278825 ) ( not ( = ?auto_278824 ?auto_278832 ) ) ( CALIBRATION_TARGET ?auto_278835 ?auto_278832 ) ( not ( = ?auto_278832 ?auto_278828 ) ) ( ON_BOARD ?auto_278836 ?auto_278837 ) ( not ( = ?auto_278824 ?auto_278828 ) ) ( not ( = ?auto_278835 ?auto_278836 ) ) ( SUPPORTS ?auto_278836 ?auto_278829 ) ( CALIBRATION_TARGET ?auto_278836 ?auto_278832 ) ( not ( = ?auto_278832 ?auto_278820 ) ) ( ON_BOARD ?auto_278830 ?auto_278837 ) ( not ( = ?auto_278828 ?auto_278820 ) ) ( not ( = ?auto_278836 ?auto_278830 ) ) ( SUPPORTS ?auto_278830 ?auto_278821 ) ( CALIBRATION_TARGET ?auto_278830 ?auto_278832 ) ( not ( = ?auto_278832 ?auto_278826 ) ) ( ON_BOARD ?auto_278834 ?auto_278837 ) ( not ( = ?auto_278820 ?auto_278826 ) ) ( not ( = ?auto_278830 ?auto_278834 ) ) ( SUPPORTS ?auto_278834 ?auto_278827 ) ( CALIBRATION_TARGET ?auto_278834 ?auto_278832 ) ( not ( = ?auto_278832 ?auto_278823 ) ) ( ON_BOARD ?auto_278833 ?auto_278837 ) ( not ( = ?auto_278826 ?auto_278823 ) ) ( not ( = ?auto_278834 ?auto_278833 ) ) ( SUPPORTS ?auto_278833 ?auto_278822 ) ( CALIBRATION_TARGET ?auto_278833 ?auto_278832 ) ( POWER_AVAIL ?auto_278837 ) ( POINTING ?auto_278837 ?auto_278831 ) ( not ( = ?auto_278832 ?auto_278831 ) ) ( not ( = ?auto_278823 ?auto_278831 ) ) ( not ( = ?auto_278822 ?auto_278827 ) ) ( not ( = ?auto_278826 ?auto_278831 ) ) ( not ( = ?auto_278823 ?auto_278820 ) ) ( not ( = ?auto_278822 ?auto_278821 ) ) ( not ( = ?auto_278827 ?auto_278821 ) ) ( not ( = ?auto_278820 ?auto_278831 ) ) ( not ( = ?auto_278830 ?auto_278833 ) ) ( not ( = ?auto_278823 ?auto_278828 ) ) ( not ( = ?auto_278822 ?auto_278829 ) ) ( not ( = ?auto_278826 ?auto_278828 ) ) ( not ( = ?auto_278827 ?auto_278829 ) ) ( not ( = ?auto_278821 ?auto_278829 ) ) ( not ( = ?auto_278828 ?auto_278831 ) ) ( not ( = ?auto_278836 ?auto_278834 ) ) ( not ( = ?auto_278836 ?auto_278833 ) ) ( not ( = ?auto_278823 ?auto_278824 ) ) ( not ( = ?auto_278822 ?auto_278825 ) ) ( not ( = ?auto_278826 ?auto_278824 ) ) ( not ( = ?auto_278827 ?auto_278825 ) ) ( not ( = ?auto_278820 ?auto_278824 ) ) ( not ( = ?auto_278821 ?auto_278825 ) ) ( not ( = ?auto_278829 ?auto_278825 ) ) ( not ( = ?auto_278824 ?auto_278831 ) ) ( not ( = ?auto_278835 ?auto_278830 ) ) ( not ( = ?auto_278835 ?auto_278834 ) ) ( not ( = ?auto_278835 ?auto_278833 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_278823 ?auto_278822 ?auto_278826 ?auto_278827 ?auto_278820 ?auto_278821 ?auto_278824 ?auto_278825 ?auto_278828 ?auto_278829 )
      ( GET-5IMAGE-VERIFY ?auto_278820 ?auto_278821 ?auto_278823 ?auto_278822 ?auto_278824 ?auto_278825 ?auto_278826 ?auto_278827 ?auto_278828 ?auto_278829 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_278984 - DIRECTION
      ?auto_278985 - MODE
      ?auto_278987 - DIRECTION
      ?auto_278986 - MODE
      ?auto_278988 - DIRECTION
      ?auto_278989 - MODE
      ?auto_278990 - DIRECTION
      ?auto_278991 - MODE
      ?auto_278992 - DIRECTION
      ?auto_278993 - MODE
    )
    :vars
    (
      ?auto_278999 - INSTRUMENT
      ?auto_279001 - SATELLITE
      ?auto_278996 - DIRECTION
      ?auto_279000 - INSTRUMENT
      ?auto_278994 - INSTRUMENT
      ?auto_278998 - INSTRUMENT
      ?auto_278997 - INSTRUMENT
      ?auto_278995 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_278999 ?auto_279001 ) ( SUPPORTS ?auto_278999 ?auto_278989 ) ( not ( = ?auto_278988 ?auto_278996 ) ) ( CALIBRATION_TARGET ?auto_278999 ?auto_278996 ) ( not ( = ?auto_278996 ?auto_278990 ) ) ( ON_BOARD ?auto_279000 ?auto_279001 ) ( not ( = ?auto_278988 ?auto_278990 ) ) ( not ( = ?auto_278999 ?auto_279000 ) ) ( SUPPORTS ?auto_279000 ?auto_278991 ) ( CALIBRATION_TARGET ?auto_279000 ?auto_278996 ) ( not ( = ?auto_278996 ?auto_278984 ) ) ( ON_BOARD ?auto_278994 ?auto_279001 ) ( not ( = ?auto_278990 ?auto_278984 ) ) ( not ( = ?auto_279000 ?auto_278994 ) ) ( SUPPORTS ?auto_278994 ?auto_278985 ) ( CALIBRATION_TARGET ?auto_278994 ?auto_278996 ) ( not ( = ?auto_278996 ?auto_278992 ) ) ( ON_BOARD ?auto_278998 ?auto_279001 ) ( not ( = ?auto_278984 ?auto_278992 ) ) ( not ( = ?auto_278994 ?auto_278998 ) ) ( SUPPORTS ?auto_278998 ?auto_278993 ) ( CALIBRATION_TARGET ?auto_278998 ?auto_278996 ) ( not ( = ?auto_278996 ?auto_278987 ) ) ( ON_BOARD ?auto_278997 ?auto_279001 ) ( not ( = ?auto_278992 ?auto_278987 ) ) ( not ( = ?auto_278998 ?auto_278997 ) ) ( SUPPORTS ?auto_278997 ?auto_278986 ) ( CALIBRATION_TARGET ?auto_278997 ?auto_278996 ) ( POWER_AVAIL ?auto_279001 ) ( POINTING ?auto_279001 ?auto_278995 ) ( not ( = ?auto_278996 ?auto_278995 ) ) ( not ( = ?auto_278987 ?auto_278995 ) ) ( not ( = ?auto_278986 ?auto_278993 ) ) ( not ( = ?auto_278992 ?auto_278995 ) ) ( not ( = ?auto_278987 ?auto_278984 ) ) ( not ( = ?auto_278986 ?auto_278985 ) ) ( not ( = ?auto_278993 ?auto_278985 ) ) ( not ( = ?auto_278984 ?auto_278995 ) ) ( not ( = ?auto_278994 ?auto_278997 ) ) ( not ( = ?auto_278987 ?auto_278990 ) ) ( not ( = ?auto_278986 ?auto_278991 ) ) ( not ( = ?auto_278992 ?auto_278990 ) ) ( not ( = ?auto_278993 ?auto_278991 ) ) ( not ( = ?auto_278985 ?auto_278991 ) ) ( not ( = ?auto_278990 ?auto_278995 ) ) ( not ( = ?auto_279000 ?auto_278998 ) ) ( not ( = ?auto_279000 ?auto_278997 ) ) ( not ( = ?auto_278987 ?auto_278988 ) ) ( not ( = ?auto_278986 ?auto_278989 ) ) ( not ( = ?auto_278992 ?auto_278988 ) ) ( not ( = ?auto_278993 ?auto_278989 ) ) ( not ( = ?auto_278984 ?auto_278988 ) ) ( not ( = ?auto_278985 ?auto_278989 ) ) ( not ( = ?auto_278991 ?auto_278989 ) ) ( not ( = ?auto_278988 ?auto_278995 ) ) ( not ( = ?auto_278999 ?auto_278994 ) ) ( not ( = ?auto_278999 ?auto_278998 ) ) ( not ( = ?auto_278999 ?auto_278997 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_278987 ?auto_278986 ?auto_278992 ?auto_278993 ?auto_278984 ?auto_278985 ?auto_278988 ?auto_278989 ?auto_278990 ?auto_278991 )
      ( GET-5IMAGE-VERIFY ?auto_278984 ?auto_278985 ?auto_278987 ?auto_278986 ?auto_278988 ?auto_278989 ?auto_278990 ?auto_278991 ?auto_278992 ?auto_278993 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_279228 - DIRECTION
      ?auto_279229 - MODE
      ?auto_279231 - DIRECTION
      ?auto_279230 - MODE
      ?auto_279232 - DIRECTION
      ?auto_279233 - MODE
      ?auto_279234 - DIRECTION
      ?auto_279235 - MODE
      ?auto_279236 - DIRECTION
      ?auto_279237 - MODE
    )
    :vars
    (
      ?auto_279243 - INSTRUMENT
      ?auto_279245 - SATELLITE
      ?auto_279240 - DIRECTION
      ?auto_279244 - INSTRUMENT
      ?auto_279238 - INSTRUMENT
      ?auto_279242 - INSTRUMENT
      ?auto_279241 - INSTRUMENT
      ?auto_279239 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_279243 ?auto_279245 ) ( SUPPORTS ?auto_279243 ?auto_279237 ) ( not ( = ?auto_279236 ?auto_279240 ) ) ( CALIBRATION_TARGET ?auto_279243 ?auto_279240 ) ( not ( = ?auto_279240 ?auto_279234 ) ) ( ON_BOARD ?auto_279244 ?auto_279245 ) ( not ( = ?auto_279236 ?auto_279234 ) ) ( not ( = ?auto_279243 ?auto_279244 ) ) ( SUPPORTS ?auto_279244 ?auto_279235 ) ( CALIBRATION_TARGET ?auto_279244 ?auto_279240 ) ( not ( = ?auto_279240 ?auto_279228 ) ) ( ON_BOARD ?auto_279238 ?auto_279245 ) ( not ( = ?auto_279234 ?auto_279228 ) ) ( not ( = ?auto_279244 ?auto_279238 ) ) ( SUPPORTS ?auto_279238 ?auto_279229 ) ( CALIBRATION_TARGET ?auto_279238 ?auto_279240 ) ( not ( = ?auto_279240 ?auto_279231 ) ) ( ON_BOARD ?auto_279242 ?auto_279245 ) ( not ( = ?auto_279228 ?auto_279231 ) ) ( not ( = ?auto_279238 ?auto_279242 ) ) ( SUPPORTS ?auto_279242 ?auto_279230 ) ( CALIBRATION_TARGET ?auto_279242 ?auto_279240 ) ( not ( = ?auto_279240 ?auto_279232 ) ) ( ON_BOARD ?auto_279241 ?auto_279245 ) ( not ( = ?auto_279231 ?auto_279232 ) ) ( not ( = ?auto_279242 ?auto_279241 ) ) ( SUPPORTS ?auto_279241 ?auto_279233 ) ( CALIBRATION_TARGET ?auto_279241 ?auto_279240 ) ( POWER_AVAIL ?auto_279245 ) ( POINTING ?auto_279245 ?auto_279239 ) ( not ( = ?auto_279240 ?auto_279239 ) ) ( not ( = ?auto_279232 ?auto_279239 ) ) ( not ( = ?auto_279233 ?auto_279230 ) ) ( not ( = ?auto_279231 ?auto_279239 ) ) ( not ( = ?auto_279232 ?auto_279228 ) ) ( not ( = ?auto_279233 ?auto_279229 ) ) ( not ( = ?auto_279230 ?auto_279229 ) ) ( not ( = ?auto_279228 ?auto_279239 ) ) ( not ( = ?auto_279238 ?auto_279241 ) ) ( not ( = ?auto_279232 ?auto_279234 ) ) ( not ( = ?auto_279233 ?auto_279235 ) ) ( not ( = ?auto_279231 ?auto_279234 ) ) ( not ( = ?auto_279230 ?auto_279235 ) ) ( not ( = ?auto_279229 ?auto_279235 ) ) ( not ( = ?auto_279234 ?auto_279239 ) ) ( not ( = ?auto_279244 ?auto_279242 ) ) ( not ( = ?auto_279244 ?auto_279241 ) ) ( not ( = ?auto_279232 ?auto_279236 ) ) ( not ( = ?auto_279233 ?auto_279237 ) ) ( not ( = ?auto_279231 ?auto_279236 ) ) ( not ( = ?auto_279230 ?auto_279237 ) ) ( not ( = ?auto_279228 ?auto_279236 ) ) ( not ( = ?auto_279229 ?auto_279237 ) ) ( not ( = ?auto_279235 ?auto_279237 ) ) ( not ( = ?auto_279236 ?auto_279239 ) ) ( not ( = ?auto_279243 ?auto_279238 ) ) ( not ( = ?auto_279243 ?auto_279242 ) ) ( not ( = ?auto_279243 ?auto_279241 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_279232 ?auto_279233 ?auto_279231 ?auto_279230 ?auto_279228 ?auto_279229 ?auto_279236 ?auto_279237 ?auto_279234 ?auto_279235 )
      ( GET-5IMAGE-VERIFY ?auto_279228 ?auto_279229 ?auto_279231 ?auto_279230 ?auto_279232 ?auto_279233 ?auto_279234 ?auto_279235 ?auto_279236 ?auto_279237 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_279306 - DIRECTION
      ?auto_279307 - MODE
      ?auto_279309 - DIRECTION
      ?auto_279308 - MODE
      ?auto_279310 - DIRECTION
      ?auto_279311 - MODE
      ?auto_279312 - DIRECTION
      ?auto_279313 - MODE
      ?auto_279314 - DIRECTION
      ?auto_279315 - MODE
    )
    :vars
    (
      ?auto_279321 - INSTRUMENT
      ?auto_279323 - SATELLITE
      ?auto_279318 - DIRECTION
      ?auto_279322 - INSTRUMENT
      ?auto_279316 - INSTRUMENT
      ?auto_279320 - INSTRUMENT
      ?auto_279319 - INSTRUMENT
      ?auto_279317 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_279321 ?auto_279323 ) ( SUPPORTS ?auto_279321 ?auto_279313 ) ( not ( = ?auto_279312 ?auto_279318 ) ) ( CALIBRATION_TARGET ?auto_279321 ?auto_279318 ) ( not ( = ?auto_279318 ?auto_279314 ) ) ( ON_BOARD ?auto_279322 ?auto_279323 ) ( not ( = ?auto_279312 ?auto_279314 ) ) ( not ( = ?auto_279321 ?auto_279322 ) ) ( SUPPORTS ?auto_279322 ?auto_279315 ) ( CALIBRATION_TARGET ?auto_279322 ?auto_279318 ) ( not ( = ?auto_279318 ?auto_279306 ) ) ( ON_BOARD ?auto_279316 ?auto_279323 ) ( not ( = ?auto_279314 ?auto_279306 ) ) ( not ( = ?auto_279322 ?auto_279316 ) ) ( SUPPORTS ?auto_279316 ?auto_279307 ) ( CALIBRATION_TARGET ?auto_279316 ?auto_279318 ) ( not ( = ?auto_279318 ?auto_279309 ) ) ( ON_BOARD ?auto_279320 ?auto_279323 ) ( not ( = ?auto_279306 ?auto_279309 ) ) ( not ( = ?auto_279316 ?auto_279320 ) ) ( SUPPORTS ?auto_279320 ?auto_279308 ) ( CALIBRATION_TARGET ?auto_279320 ?auto_279318 ) ( not ( = ?auto_279318 ?auto_279310 ) ) ( ON_BOARD ?auto_279319 ?auto_279323 ) ( not ( = ?auto_279309 ?auto_279310 ) ) ( not ( = ?auto_279320 ?auto_279319 ) ) ( SUPPORTS ?auto_279319 ?auto_279311 ) ( CALIBRATION_TARGET ?auto_279319 ?auto_279318 ) ( POWER_AVAIL ?auto_279323 ) ( POINTING ?auto_279323 ?auto_279317 ) ( not ( = ?auto_279318 ?auto_279317 ) ) ( not ( = ?auto_279310 ?auto_279317 ) ) ( not ( = ?auto_279311 ?auto_279308 ) ) ( not ( = ?auto_279309 ?auto_279317 ) ) ( not ( = ?auto_279310 ?auto_279306 ) ) ( not ( = ?auto_279311 ?auto_279307 ) ) ( not ( = ?auto_279308 ?auto_279307 ) ) ( not ( = ?auto_279306 ?auto_279317 ) ) ( not ( = ?auto_279316 ?auto_279319 ) ) ( not ( = ?auto_279310 ?auto_279314 ) ) ( not ( = ?auto_279311 ?auto_279315 ) ) ( not ( = ?auto_279309 ?auto_279314 ) ) ( not ( = ?auto_279308 ?auto_279315 ) ) ( not ( = ?auto_279307 ?auto_279315 ) ) ( not ( = ?auto_279314 ?auto_279317 ) ) ( not ( = ?auto_279322 ?auto_279320 ) ) ( not ( = ?auto_279322 ?auto_279319 ) ) ( not ( = ?auto_279310 ?auto_279312 ) ) ( not ( = ?auto_279311 ?auto_279313 ) ) ( not ( = ?auto_279309 ?auto_279312 ) ) ( not ( = ?auto_279308 ?auto_279313 ) ) ( not ( = ?auto_279306 ?auto_279312 ) ) ( not ( = ?auto_279307 ?auto_279313 ) ) ( not ( = ?auto_279315 ?auto_279313 ) ) ( not ( = ?auto_279312 ?auto_279317 ) ) ( not ( = ?auto_279321 ?auto_279316 ) ) ( not ( = ?auto_279321 ?auto_279320 ) ) ( not ( = ?auto_279321 ?auto_279319 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_279310 ?auto_279311 ?auto_279309 ?auto_279308 ?auto_279306 ?auto_279307 ?auto_279312 ?auto_279313 ?auto_279314 ?auto_279315 )
      ( GET-5IMAGE-VERIFY ?auto_279306 ?auto_279307 ?auto_279309 ?auto_279308 ?auto_279310 ?auto_279311 ?auto_279312 ?auto_279313 ?auto_279314 ?auto_279315 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_279724 - DIRECTION
      ?auto_279725 - MODE
      ?auto_279727 - DIRECTION
      ?auto_279726 - MODE
      ?auto_279728 - DIRECTION
      ?auto_279729 - MODE
      ?auto_279730 - DIRECTION
      ?auto_279731 - MODE
      ?auto_279732 - DIRECTION
      ?auto_279733 - MODE
    )
    :vars
    (
      ?auto_279739 - INSTRUMENT
      ?auto_279741 - SATELLITE
      ?auto_279736 - DIRECTION
      ?auto_279740 - INSTRUMENT
      ?auto_279734 - INSTRUMENT
      ?auto_279738 - INSTRUMENT
      ?auto_279737 - INSTRUMENT
      ?auto_279735 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_279739 ?auto_279741 ) ( SUPPORTS ?auto_279739 ?auto_279733 ) ( not ( = ?auto_279732 ?auto_279736 ) ) ( CALIBRATION_TARGET ?auto_279739 ?auto_279736 ) ( not ( = ?auto_279736 ?auto_279728 ) ) ( ON_BOARD ?auto_279740 ?auto_279741 ) ( not ( = ?auto_279732 ?auto_279728 ) ) ( not ( = ?auto_279739 ?auto_279740 ) ) ( SUPPORTS ?auto_279740 ?auto_279729 ) ( CALIBRATION_TARGET ?auto_279740 ?auto_279736 ) ( not ( = ?auto_279736 ?auto_279724 ) ) ( ON_BOARD ?auto_279734 ?auto_279741 ) ( not ( = ?auto_279728 ?auto_279724 ) ) ( not ( = ?auto_279740 ?auto_279734 ) ) ( SUPPORTS ?auto_279734 ?auto_279725 ) ( CALIBRATION_TARGET ?auto_279734 ?auto_279736 ) ( not ( = ?auto_279736 ?auto_279727 ) ) ( ON_BOARD ?auto_279738 ?auto_279741 ) ( not ( = ?auto_279724 ?auto_279727 ) ) ( not ( = ?auto_279734 ?auto_279738 ) ) ( SUPPORTS ?auto_279738 ?auto_279726 ) ( CALIBRATION_TARGET ?auto_279738 ?auto_279736 ) ( not ( = ?auto_279736 ?auto_279730 ) ) ( ON_BOARD ?auto_279737 ?auto_279741 ) ( not ( = ?auto_279727 ?auto_279730 ) ) ( not ( = ?auto_279738 ?auto_279737 ) ) ( SUPPORTS ?auto_279737 ?auto_279731 ) ( CALIBRATION_TARGET ?auto_279737 ?auto_279736 ) ( POWER_AVAIL ?auto_279741 ) ( POINTING ?auto_279741 ?auto_279735 ) ( not ( = ?auto_279736 ?auto_279735 ) ) ( not ( = ?auto_279730 ?auto_279735 ) ) ( not ( = ?auto_279731 ?auto_279726 ) ) ( not ( = ?auto_279727 ?auto_279735 ) ) ( not ( = ?auto_279730 ?auto_279724 ) ) ( not ( = ?auto_279731 ?auto_279725 ) ) ( not ( = ?auto_279726 ?auto_279725 ) ) ( not ( = ?auto_279724 ?auto_279735 ) ) ( not ( = ?auto_279734 ?auto_279737 ) ) ( not ( = ?auto_279730 ?auto_279728 ) ) ( not ( = ?auto_279731 ?auto_279729 ) ) ( not ( = ?auto_279727 ?auto_279728 ) ) ( not ( = ?auto_279726 ?auto_279729 ) ) ( not ( = ?auto_279725 ?auto_279729 ) ) ( not ( = ?auto_279728 ?auto_279735 ) ) ( not ( = ?auto_279740 ?auto_279738 ) ) ( not ( = ?auto_279740 ?auto_279737 ) ) ( not ( = ?auto_279730 ?auto_279732 ) ) ( not ( = ?auto_279731 ?auto_279733 ) ) ( not ( = ?auto_279727 ?auto_279732 ) ) ( not ( = ?auto_279726 ?auto_279733 ) ) ( not ( = ?auto_279724 ?auto_279732 ) ) ( not ( = ?auto_279725 ?auto_279733 ) ) ( not ( = ?auto_279729 ?auto_279733 ) ) ( not ( = ?auto_279732 ?auto_279735 ) ) ( not ( = ?auto_279739 ?auto_279734 ) ) ( not ( = ?auto_279739 ?auto_279738 ) ) ( not ( = ?auto_279739 ?auto_279737 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_279730 ?auto_279731 ?auto_279727 ?auto_279726 ?auto_279724 ?auto_279725 ?auto_279732 ?auto_279733 ?auto_279728 ?auto_279729 )
      ( GET-5IMAGE-VERIFY ?auto_279724 ?auto_279725 ?auto_279727 ?auto_279726 ?auto_279728 ?auto_279729 ?auto_279730 ?auto_279731 ?auto_279732 ?auto_279733 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_279802 - DIRECTION
      ?auto_279803 - MODE
      ?auto_279805 - DIRECTION
      ?auto_279804 - MODE
      ?auto_279806 - DIRECTION
      ?auto_279807 - MODE
      ?auto_279808 - DIRECTION
      ?auto_279809 - MODE
      ?auto_279810 - DIRECTION
      ?auto_279811 - MODE
    )
    :vars
    (
      ?auto_279817 - INSTRUMENT
      ?auto_279819 - SATELLITE
      ?auto_279814 - DIRECTION
      ?auto_279818 - INSTRUMENT
      ?auto_279812 - INSTRUMENT
      ?auto_279816 - INSTRUMENT
      ?auto_279815 - INSTRUMENT
      ?auto_279813 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_279817 ?auto_279819 ) ( SUPPORTS ?auto_279817 ?auto_279809 ) ( not ( = ?auto_279808 ?auto_279814 ) ) ( CALIBRATION_TARGET ?auto_279817 ?auto_279814 ) ( not ( = ?auto_279814 ?auto_279806 ) ) ( ON_BOARD ?auto_279818 ?auto_279819 ) ( not ( = ?auto_279808 ?auto_279806 ) ) ( not ( = ?auto_279817 ?auto_279818 ) ) ( SUPPORTS ?auto_279818 ?auto_279807 ) ( CALIBRATION_TARGET ?auto_279818 ?auto_279814 ) ( not ( = ?auto_279814 ?auto_279802 ) ) ( ON_BOARD ?auto_279812 ?auto_279819 ) ( not ( = ?auto_279806 ?auto_279802 ) ) ( not ( = ?auto_279818 ?auto_279812 ) ) ( SUPPORTS ?auto_279812 ?auto_279803 ) ( CALIBRATION_TARGET ?auto_279812 ?auto_279814 ) ( not ( = ?auto_279814 ?auto_279805 ) ) ( ON_BOARD ?auto_279816 ?auto_279819 ) ( not ( = ?auto_279802 ?auto_279805 ) ) ( not ( = ?auto_279812 ?auto_279816 ) ) ( SUPPORTS ?auto_279816 ?auto_279804 ) ( CALIBRATION_TARGET ?auto_279816 ?auto_279814 ) ( not ( = ?auto_279814 ?auto_279810 ) ) ( ON_BOARD ?auto_279815 ?auto_279819 ) ( not ( = ?auto_279805 ?auto_279810 ) ) ( not ( = ?auto_279816 ?auto_279815 ) ) ( SUPPORTS ?auto_279815 ?auto_279811 ) ( CALIBRATION_TARGET ?auto_279815 ?auto_279814 ) ( POWER_AVAIL ?auto_279819 ) ( POINTING ?auto_279819 ?auto_279813 ) ( not ( = ?auto_279814 ?auto_279813 ) ) ( not ( = ?auto_279810 ?auto_279813 ) ) ( not ( = ?auto_279811 ?auto_279804 ) ) ( not ( = ?auto_279805 ?auto_279813 ) ) ( not ( = ?auto_279810 ?auto_279802 ) ) ( not ( = ?auto_279811 ?auto_279803 ) ) ( not ( = ?auto_279804 ?auto_279803 ) ) ( not ( = ?auto_279802 ?auto_279813 ) ) ( not ( = ?auto_279812 ?auto_279815 ) ) ( not ( = ?auto_279810 ?auto_279806 ) ) ( not ( = ?auto_279811 ?auto_279807 ) ) ( not ( = ?auto_279805 ?auto_279806 ) ) ( not ( = ?auto_279804 ?auto_279807 ) ) ( not ( = ?auto_279803 ?auto_279807 ) ) ( not ( = ?auto_279806 ?auto_279813 ) ) ( not ( = ?auto_279818 ?auto_279816 ) ) ( not ( = ?auto_279818 ?auto_279815 ) ) ( not ( = ?auto_279810 ?auto_279808 ) ) ( not ( = ?auto_279811 ?auto_279809 ) ) ( not ( = ?auto_279805 ?auto_279808 ) ) ( not ( = ?auto_279804 ?auto_279809 ) ) ( not ( = ?auto_279802 ?auto_279808 ) ) ( not ( = ?auto_279803 ?auto_279809 ) ) ( not ( = ?auto_279807 ?auto_279809 ) ) ( not ( = ?auto_279808 ?auto_279813 ) ) ( not ( = ?auto_279817 ?auto_279812 ) ) ( not ( = ?auto_279817 ?auto_279816 ) ) ( not ( = ?auto_279817 ?auto_279815 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_279810 ?auto_279811 ?auto_279805 ?auto_279804 ?auto_279802 ?auto_279803 ?auto_279808 ?auto_279809 ?auto_279806 ?auto_279807 )
      ( GET-5IMAGE-VERIFY ?auto_279802 ?auto_279803 ?auto_279805 ?auto_279804 ?auto_279806 ?auto_279807 ?auto_279808 ?auto_279809 ?auto_279810 ?auto_279811 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_279960 - DIRECTION
      ?auto_279961 - MODE
      ?auto_279963 - DIRECTION
      ?auto_279962 - MODE
      ?auto_279964 - DIRECTION
      ?auto_279965 - MODE
      ?auto_279966 - DIRECTION
      ?auto_279967 - MODE
      ?auto_279968 - DIRECTION
      ?auto_279969 - MODE
    )
    :vars
    (
      ?auto_279975 - INSTRUMENT
      ?auto_279977 - SATELLITE
      ?auto_279972 - DIRECTION
      ?auto_279976 - INSTRUMENT
      ?auto_279970 - INSTRUMENT
      ?auto_279974 - INSTRUMENT
      ?auto_279973 - INSTRUMENT
      ?auto_279971 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_279975 ?auto_279977 ) ( SUPPORTS ?auto_279975 ?auto_279965 ) ( not ( = ?auto_279964 ?auto_279972 ) ) ( CALIBRATION_TARGET ?auto_279975 ?auto_279972 ) ( not ( = ?auto_279972 ?auto_279968 ) ) ( ON_BOARD ?auto_279976 ?auto_279977 ) ( not ( = ?auto_279964 ?auto_279968 ) ) ( not ( = ?auto_279975 ?auto_279976 ) ) ( SUPPORTS ?auto_279976 ?auto_279969 ) ( CALIBRATION_TARGET ?auto_279976 ?auto_279972 ) ( not ( = ?auto_279972 ?auto_279960 ) ) ( ON_BOARD ?auto_279970 ?auto_279977 ) ( not ( = ?auto_279968 ?auto_279960 ) ) ( not ( = ?auto_279976 ?auto_279970 ) ) ( SUPPORTS ?auto_279970 ?auto_279961 ) ( CALIBRATION_TARGET ?auto_279970 ?auto_279972 ) ( not ( = ?auto_279972 ?auto_279963 ) ) ( ON_BOARD ?auto_279974 ?auto_279977 ) ( not ( = ?auto_279960 ?auto_279963 ) ) ( not ( = ?auto_279970 ?auto_279974 ) ) ( SUPPORTS ?auto_279974 ?auto_279962 ) ( CALIBRATION_TARGET ?auto_279974 ?auto_279972 ) ( not ( = ?auto_279972 ?auto_279966 ) ) ( ON_BOARD ?auto_279973 ?auto_279977 ) ( not ( = ?auto_279963 ?auto_279966 ) ) ( not ( = ?auto_279974 ?auto_279973 ) ) ( SUPPORTS ?auto_279973 ?auto_279967 ) ( CALIBRATION_TARGET ?auto_279973 ?auto_279972 ) ( POWER_AVAIL ?auto_279977 ) ( POINTING ?auto_279977 ?auto_279971 ) ( not ( = ?auto_279972 ?auto_279971 ) ) ( not ( = ?auto_279966 ?auto_279971 ) ) ( not ( = ?auto_279967 ?auto_279962 ) ) ( not ( = ?auto_279963 ?auto_279971 ) ) ( not ( = ?auto_279966 ?auto_279960 ) ) ( not ( = ?auto_279967 ?auto_279961 ) ) ( not ( = ?auto_279962 ?auto_279961 ) ) ( not ( = ?auto_279960 ?auto_279971 ) ) ( not ( = ?auto_279970 ?auto_279973 ) ) ( not ( = ?auto_279966 ?auto_279968 ) ) ( not ( = ?auto_279967 ?auto_279969 ) ) ( not ( = ?auto_279963 ?auto_279968 ) ) ( not ( = ?auto_279962 ?auto_279969 ) ) ( not ( = ?auto_279961 ?auto_279969 ) ) ( not ( = ?auto_279968 ?auto_279971 ) ) ( not ( = ?auto_279976 ?auto_279974 ) ) ( not ( = ?auto_279976 ?auto_279973 ) ) ( not ( = ?auto_279966 ?auto_279964 ) ) ( not ( = ?auto_279967 ?auto_279965 ) ) ( not ( = ?auto_279963 ?auto_279964 ) ) ( not ( = ?auto_279962 ?auto_279965 ) ) ( not ( = ?auto_279960 ?auto_279964 ) ) ( not ( = ?auto_279961 ?auto_279965 ) ) ( not ( = ?auto_279969 ?auto_279965 ) ) ( not ( = ?auto_279964 ?auto_279971 ) ) ( not ( = ?auto_279975 ?auto_279970 ) ) ( not ( = ?auto_279975 ?auto_279974 ) ) ( not ( = ?auto_279975 ?auto_279973 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_279966 ?auto_279967 ?auto_279963 ?auto_279962 ?auto_279960 ?auto_279961 ?auto_279964 ?auto_279965 ?auto_279968 ?auto_279969 )
      ( GET-5IMAGE-VERIFY ?auto_279960 ?auto_279961 ?auto_279963 ?auto_279962 ?auto_279964 ?auto_279965 ?auto_279966 ?auto_279967 ?auto_279968 ?auto_279969 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_280210 - DIRECTION
      ?auto_280211 - MODE
      ?auto_280213 - DIRECTION
      ?auto_280212 - MODE
      ?auto_280214 - DIRECTION
      ?auto_280215 - MODE
      ?auto_280216 - DIRECTION
      ?auto_280217 - MODE
      ?auto_280218 - DIRECTION
      ?auto_280219 - MODE
    )
    :vars
    (
      ?auto_280225 - INSTRUMENT
      ?auto_280227 - SATELLITE
      ?auto_280222 - DIRECTION
      ?auto_280226 - INSTRUMENT
      ?auto_280220 - INSTRUMENT
      ?auto_280224 - INSTRUMENT
      ?auto_280223 - INSTRUMENT
      ?auto_280221 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_280225 ?auto_280227 ) ( SUPPORTS ?auto_280225 ?auto_280215 ) ( not ( = ?auto_280214 ?auto_280222 ) ) ( CALIBRATION_TARGET ?auto_280225 ?auto_280222 ) ( not ( = ?auto_280222 ?auto_280216 ) ) ( ON_BOARD ?auto_280226 ?auto_280227 ) ( not ( = ?auto_280214 ?auto_280216 ) ) ( not ( = ?auto_280225 ?auto_280226 ) ) ( SUPPORTS ?auto_280226 ?auto_280217 ) ( CALIBRATION_TARGET ?auto_280226 ?auto_280222 ) ( not ( = ?auto_280222 ?auto_280210 ) ) ( ON_BOARD ?auto_280220 ?auto_280227 ) ( not ( = ?auto_280216 ?auto_280210 ) ) ( not ( = ?auto_280226 ?auto_280220 ) ) ( SUPPORTS ?auto_280220 ?auto_280211 ) ( CALIBRATION_TARGET ?auto_280220 ?auto_280222 ) ( not ( = ?auto_280222 ?auto_280213 ) ) ( ON_BOARD ?auto_280224 ?auto_280227 ) ( not ( = ?auto_280210 ?auto_280213 ) ) ( not ( = ?auto_280220 ?auto_280224 ) ) ( SUPPORTS ?auto_280224 ?auto_280212 ) ( CALIBRATION_TARGET ?auto_280224 ?auto_280222 ) ( not ( = ?auto_280222 ?auto_280218 ) ) ( ON_BOARD ?auto_280223 ?auto_280227 ) ( not ( = ?auto_280213 ?auto_280218 ) ) ( not ( = ?auto_280224 ?auto_280223 ) ) ( SUPPORTS ?auto_280223 ?auto_280219 ) ( CALIBRATION_TARGET ?auto_280223 ?auto_280222 ) ( POWER_AVAIL ?auto_280227 ) ( POINTING ?auto_280227 ?auto_280221 ) ( not ( = ?auto_280222 ?auto_280221 ) ) ( not ( = ?auto_280218 ?auto_280221 ) ) ( not ( = ?auto_280219 ?auto_280212 ) ) ( not ( = ?auto_280213 ?auto_280221 ) ) ( not ( = ?auto_280218 ?auto_280210 ) ) ( not ( = ?auto_280219 ?auto_280211 ) ) ( not ( = ?auto_280212 ?auto_280211 ) ) ( not ( = ?auto_280210 ?auto_280221 ) ) ( not ( = ?auto_280220 ?auto_280223 ) ) ( not ( = ?auto_280218 ?auto_280216 ) ) ( not ( = ?auto_280219 ?auto_280217 ) ) ( not ( = ?auto_280213 ?auto_280216 ) ) ( not ( = ?auto_280212 ?auto_280217 ) ) ( not ( = ?auto_280211 ?auto_280217 ) ) ( not ( = ?auto_280216 ?auto_280221 ) ) ( not ( = ?auto_280226 ?auto_280224 ) ) ( not ( = ?auto_280226 ?auto_280223 ) ) ( not ( = ?auto_280218 ?auto_280214 ) ) ( not ( = ?auto_280219 ?auto_280215 ) ) ( not ( = ?auto_280213 ?auto_280214 ) ) ( not ( = ?auto_280212 ?auto_280215 ) ) ( not ( = ?auto_280210 ?auto_280214 ) ) ( not ( = ?auto_280211 ?auto_280215 ) ) ( not ( = ?auto_280217 ?auto_280215 ) ) ( not ( = ?auto_280214 ?auto_280221 ) ) ( not ( = ?auto_280225 ?auto_280220 ) ) ( not ( = ?auto_280225 ?auto_280224 ) ) ( not ( = ?auto_280225 ?auto_280223 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_280218 ?auto_280219 ?auto_280213 ?auto_280212 ?auto_280210 ?auto_280211 ?auto_280214 ?auto_280215 ?auto_280216 ?auto_280217 )
      ( GET-5IMAGE-VERIFY ?auto_280210 ?auto_280211 ?auto_280213 ?auto_280212 ?auto_280214 ?auto_280215 ?auto_280216 ?auto_280217 ?auto_280218 ?auto_280219 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_281754 - DIRECTION
      ?auto_281755 - MODE
      ?auto_281757 - DIRECTION
      ?auto_281756 - MODE
      ?auto_281758 - DIRECTION
      ?auto_281759 - MODE
      ?auto_281760 - DIRECTION
      ?auto_281761 - MODE
      ?auto_281762 - DIRECTION
      ?auto_281763 - MODE
    )
    :vars
    (
      ?auto_281769 - INSTRUMENT
      ?auto_281771 - SATELLITE
      ?auto_281766 - DIRECTION
      ?auto_281770 - INSTRUMENT
      ?auto_281764 - INSTRUMENT
      ?auto_281768 - INSTRUMENT
      ?auto_281767 - INSTRUMENT
      ?auto_281765 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_281769 ?auto_281771 ) ( SUPPORTS ?auto_281769 ?auto_281763 ) ( not ( = ?auto_281762 ?auto_281766 ) ) ( CALIBRATION_TARGET ?auto_281769 ?auto_281766 ) ( not ( = ?auto_281766 ?auto_281757 ) ) ( ON_BOARD ?auto_281770 ?auto_281771 ) ( not ( = ?auto_281762 ?auto_281757 ) ) ( not ( = ?auto_281769 ?auto_281770 ) ) ( SUPPORTS ?auto_281770 ?auto_281756 ) ( CALIBRATION_TARGET ?auto_281770 ?auto_281766 ) ( not ( = ?auto_281766 ?auto_281754 ) ) ( ON_BOARD ?auto_281764 ?auto_281771 ) ( not ( = ?auto_281757 ?auto_281754 ) ) ( not ( = ?auto_281770 ?auto_281764 ) ) ( SUPPORTS ?auto_281764 ?auto_281755 ) ( CALIBRATION_TARGET ?auto_281764 ?auto_281766 ) ( not ( = ?auto_281766 ?auto_281760 ) ) ( ON_BOARD ?auto_281768 ?auto_281771 ) ( not ( = ?auto_281754 ?auto_281760 ) ) ( not ( = ?auto_281764 ?auto_281768 ) ) ( SUPPORTS ?auto_281768 ?auto_281761 ) ( CALIBRATION_TARGET ?auto_281768 ?auto_281766 ) ( not ( = ?auto_281766 ?auto_281758 ) ) ( ON_BOARD ?auto_281767 ?auto_281771 ) ( not ( = ?auto_281760 ?auto_281758 ) ) ( not ( = ?auto_281768 ?auto_281767 ) ) ( SUPPORTS ?auto_281767 ?auto_281759 ) ( CALIBRATION_TARGET ?auto_281767 ?auto_281766 ) ( POWER_AVAIL ?auto_281771 ) ( POINTING ?auto_281771 ?auto_281765 ) ( not ( = ?auto_281766 ?auto_281765 ) ) ( not ( = ?auto_281758 ?auto_281765 ) ) ( not ( = ?auto_281759 ?auto_281761 ) ) ( not ( = ?auto_281760 ?auto_281765 ) ) ( not ( = ?auto_281758 ?auto_281754 ) ) ( not ( = ?auto_281759 ?auto_281755 ) ) ( not ( = ?auto_281761 ?auto_281755 ) ) ( not ( = ?auto_281754 ?auto_281765 ) ) ( not ( = ?auto_281764 ?auto_281767 ) ) ( not ( = ?auto_281758 ?auto_281757 ) ) ( not ( = ?auto_281759 ?auto_281756 ) ) ( not ( = ?auto_281760 ?auto_281757 ) ) ( not ( = ?auto_281761 ?auto_281756 ) ) ( not ( = ?auto_281755 ?auto_281756 ) ) ( not ( = ?auto_281757 ?auto_281765 ) ) ( not ( = ?auto_281770 ?auto_281768 ) ) ( not ( = ?auto_281770 ?auto_281767 ) ) ( not ( = ?auto_281758 ?auto_281762 ) ) ( not ( = ?auto_281759 ?auto_281763 ) ) ( not ( = ?auto_281760 ?auto_281762 ) ) ( not ( = ?auto_281761 ?auto_281763 ) ) ( not ( = ?auto_281754 ?auto_281762 ) ) ( not ( = ?auto_281755 ?auto_281763 ) ) ( not ( = ?auto_281756 ?auto_281763 ) ) ( not ( = ?auto_281762 ?auto_281765 ) ) ( not ( = ?auto_281769 ?auto_281764 ) ) ( not ( = ?auto_281769 ?auto_281768 ) ) ( not ( = ?auto_281769 ?auto_281767 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_281758 ?auto_281759 ?auto_281760 ?auto_281761 ?auto_281754 ?auto_281755 ?auto_281762 ?auto_281763 ?auto_281757 ?auto_281756 )
      ( GET-5IMAGE-VERIFY ?auto_281754 ?auto_281755 ?auto_281757 ?auto_281756 ?auto_281758 ?auto_281759 ?auto_281760 ?auto_281761 ?auto_281762 ?auto_281763 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_281832 - DIRECTION
      ?auto_281833 - MODE
      ?auto_281835 - DIRECTION
      ?auto_281834 - MODE
      ?auto_281836 - DIRECTION
      ?auto_281837 - MODE
      ?auto_281838 - DIRECTION
      ?auto_281839 - MODE
      ?auto_281840 - DIRECTION
      ?auto_281841 - MODE
    )
    :vars
    (
      ?auto_281847 - INSTRUMENT
      ?auto_281849 - SATELLITE
      ?auto_281844 - DIRECTION
      ?auto_281848 - INSTRUMENT
      ?auto_281842 - INSTRUMENT
      ?auto_281846 - INSTRUMENT
      ?auto_281845 - INSTRUMENT
      ?auto_281843 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_281847 ?auto_281849 ) ( SUPPORTS ?auto_281847 ?auto_281839 ) ( not ( = ?auto_281838 ?auto_281844 ) ) ( CALIBRATION_TARGET ?auto_281847 ?auto_281844 ) ( not ( = ?auto_281844 ?auto_281835 ) ) ( ON_BOARD ?auto_281848 ?auto_281849 ) ( not ( = ?auto_281838 ?auto_281835 ) ) ( not ( = ?auto_281847 ?auto_281848 ) ) ( SUPPORTS ?auto_281848 ?auto_281834 ) ( CALIBRATION_TARGET ?auto_281848 ?auto_281844 ) ( not ( = ?auto_281844 ?auto_281832 ) ) ( ON_BOARD ?auto_281842 ?auto_281849 ) ( not ( = ?auto_281835 ?auto_281832 ) ) ( not ( = ?auto_281848 ?auto_281842 ) ) ( SUPPORTS ?auto_281842 ?auto_281833 ) ( CALIBRATION_TARGET ?auto_281842 ?auto_281844 ) ( not ( = ?auto_281844 ?auto_281840 ) ) ( ON_BOARD ?auto_281846 ?auto_281849 ) ( not ( = ?auto_281832 ?auto_281840 ) ) ( not ( = ?auto_281842 ?auto_281846 ) ) ( SUPPORTS ?auto_281846 ?auto_281841 ) ( CALIBRATION_TARGET ?auto_281846 ?auto_281844 ) ( not ( = ?auto_281844 ?auto_281836 ) ) ( ON_BOARD ?auto_281845 ?auto_281849 ) ( not ( = ?auto_281840 ?auto_281836 ) ) ( not ( = ?auto_281846 ?auto_281845 ) ) ( SUPPORTS ?auto_281845 ?auto_281837 ) ( CALIBRATION_TARGET ?auto_281845 ?auto_281844 ) ( POWER_AVAIL ?auto_281849 ) ( POINTING ?auto_281849 ?auto_281843 ) ( not ( = ?auto_281844 ?auto_281843 ) ) ( not ( = ?auto_281836 ?auto_281843 ) ) ( not ( = ?auto_281837 ?auto_281841 ) ) ( not ( = ?auto_281840 ?auto_281843 ) ) ( not ( = ?auto_281836 ?auto_281832 ) ) ( not ( = ?auto_281837 ?auto_281833 ) ) ( not ( = ?auto_281841 ?auto_281833 ) ) ( not ( = ?auto_281832 ?auto_281843 ) ) ( not ( = ?auto_281842 ?auto_281845 ) ) ( not ( = ?auto_281836 ?auto_281835 ) ) ( not ( = ?auto_281837 ?auto_281834 ) ) ( not ( = ?auto_281840 ?auto_281835 ) ) ( not ( = ?auto_281841 ?auto_281834 ) ) ( not ( = ?auto_281833 ?auto_281834 ) ) ( not ( = ?auto_281835 ?auto_281843 ) ) ( not ( = ?auto_281848 ?auto_281846 ) ) ( not ( = ?auto_281848 ?auto_281845 ) ) ( not ( = ?auto_281836 ?auto_281838 ) ) ( not ( = ?auto_281837 ?auto_281839 ) ) ( not ( = ?auto_281840 ?auto_281838 ) ) ( not ( = ?auto_281841 ?auto_281839 ) ) ( not ( = ?auto_281832 ?auto_281838 ) ) ( not ( = ?auto_281833 ?auto_281839 ) ) ( not ( = ?auto_281834 ?auto_281839 ) ) ( not ( = ?auto_281838 ?auto_281843 ) ) ( not ( = ?auto_281847 ?auto_281842 ) ) ( not ( = ?auto_281847 ?auto_281846 ) ) ( not ( = ?auto_281847 ?auto_281845 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_281836 ?auto_281837 ?auto_281840 ?auto_281841 ?auto_281832 ?auto_281833 ?auto_281838 ?auto_281839 ?auto_281835 ?auto_281834 )
      ( GET-5IMAGE-VERIFY ?auto_281832 ?auto_281833 ?auto_281835 ?auto_281834 ?auto_281836 ?auto_281837 ?auto_281838 ?auto_281839 ?auto_281840 ?auto_281841 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_281910 - DIRECTION
      ?auto_281911 - MODE
      ?auto_281913 - DIRECTION
      ?auto_281912 - MODE
      ?auto_281914 - DIRECTION
      ?auto_281915 - MODE
      ?auto_281916 - DIRECTION
      ?auto_281917 - MODE
      ?auto_281918 - DIRECTION
      ?auto_281919 - MODE
    )
    :vars
    (
      ?auto_281925 - INSTRUMENT
      ?auto_281927 - SATELLITE
      ?auto_281922 - DIRECTION
      ?auto_281926 - INSTRUMENT
      ?auto_281920 - INSTRUMENT
      ?auto_281924 - INSTRUMENT
      ?auto_281923 - INSTRUMENT
      ?auto_281921 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_281925 ?auto_281927 ) ( SUPPORTS ?auto_281925 ?auto_281919 ) ( not ( = ?auto_281918 ?auto_281922 ) ) ( CALIBRATION_TARGET ?auto_281925 ?auto_281922 ) ( not ( = ?auto_281922 ?auto_281913 ) ) ( ON_BOARD ?auto_281926 ?auto_281927 ) ( not ( = ?auto_281918 ?auto_281913 ) ) ( not ( = ?auto_281925 ?auto_281926 ) ) ( SUPPORTS ?auto_281926 ?auto_281912 ) ( CALIBRATION_TARGET ?auto_281926 ?auto_281922 ) ( not ( = ?auto_281922 ?auto_281910 ) ) ( ON_BOARD ?auto_281920 ?auto_281927 ) ( not ( = ?auto_281913 ?auto_281910 ) ) ( not ( = ?auto_281926 ?auto_281920 ) ) ( SUPPORTS ?auto_281920 ?auto_281911 ) ( CALIBRATION_TARGET ?auto_281920 ?auto_281922 ) ( not ( = ?auto_281922 ?auto_281914 ) ) ( ON_BOARD ?auto_281924 ?auto_281927 ) ( not ( = ?auto_281910 ?auto_281914 ) ) ( not ( = ?auto_281920 ?auto_281924 ) ) ( SUPPORTS ?auto_281924 ?auto_281915 ) ( CALIBRATION_TARGET ?auto_281924 ?auto_281922 ) ( not ( = ?auto_281922 ?auto_281916 ) ) ( ON_BOARD ?auto_281923 ?auto_281927 ) ( not ( = ?auto_281914 ?auto_281916 ) ) ( not ( = ?auto_281924 ?auto_281923 ) ) ( SUPPORTS ?auto_281923 ?auto_281917 ) ( CALIBRATION_TARGET ?auto_281923 ?auto_281922 ) ( POWER_AVAIL ?auto_281927 ) ( POINTING ?auto_281927 ?auto_281921 ) ( not ( = ?auto_281922 ?auto_281921 ) ) ( not ( = ?auto_281916 ?auto_281921 ) ) ( not ( = ?auto_281917 ?auto_281915 ) ) ( not ( = ?auto_281914 ?auto_281921 ) ) ( not ( = ?auto_281916 ?auto_281910 ) ) ( not ( = ?auto_281917 ?auto_281911 ) ) ( not ( = ?auto_281915 ?auto_281911 ) ) ( not ( = ?auto_281910 ?auto_281921 ) ) ( not ( = ?auto_281920 ?auto_281923 ) ) ( not ( = ?auto_281916 ?auto_281913 ) ) ( not ( = ?auto_281917 ?auto_281912 ) ) ( not ( = ?auto_281914 ?auto_281913 ) ) ( not ( = ?auto_281915 ?auto_281912 ) ) ( not ( = ?auto_281911 ?auto_281912 ) ) ( not ( = ?auto_281913 ?auto_281921 ) ) ( not ( = ?auto_281926 ?auto_281924 ) ) ( not ( = ?auto_281926 ?auto_281923 ) ) ( not ( = ?auto_281916 ?auto_281918 ) ) ( not ( = ?auto_281917 ?auto_281919 ) ) ( not ( = ?auto_281914 ?auto_281918 ) ) ( not ( = ?auto_281915 ?auto_281919 ) ) ( not ( = ?auto_281910 ?auto_281918 ) ) ( not ( = ?auto_281911 ?auto_281919 ) ) ( not ( = ?auto_281912 ?auto_281919 ) ) ( not ( = ?auto_281918 ?auto_281921 ) ) ( not ( = ?auto_281925 ?auto_281920 ) ) ( not ( = ?auto_281925 ?auto_281924 ) ) ( not ( = ?auto_281925 ?auto_281923 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_281916 ?auto_281917 ?auto_281914 ?auto_281915 ?auto_281910 ?auto_281911 ?auto_281918 ?auto_281919 ?auto_281913 ?auto_281912 )
      ( GET-5IMAGE-VERIFY ?auto_281910 ?auto_281911 ?auto_281913 ?auto_281912 ?auto_281914 ?auto_281915 ?auto_281916 ?auto_281917 ?auto_281918 ?auto_281919 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_281988 - DIRECTION
      ?auto_281989 - MODE
      ?auto_281991 - DIRECTION
      ?auto_281990 - MODE
      ?auto_281992 - DIRECTION
      ?auto_281993 - MODE
      ?auto_281994 - DIRECTION
      ?auto_281995 - MODE
      ?auto_281996 - DIRECTION
      ?auto_281997 - MODE
    )
    :vars
    (
      ?auto_282003 - INSTRUMENT
      ?auto_282005 - SATELLITE
      ?auto_282000 - DIRECTION
      ?auto_282004 - INSTRUMENT
      ?auto_281998 - INSTRUMENT
      ?auto_282002 - INSTRUMENT
      ?auto_282001 - INSTRUMENT
      ?auto_281999 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282003 ?auto_282005 ) ( SUPPORTS ?auto_282003 ?auto_281995 ) ( not ( = ?auto_281994 ?auto_282000 ) ) ( CALIBRATION_TARGET ?auto_282003 ?auto_282000 ) ( not ( = ?auto_282000 ?auto_281991 ) ) ( ON_BOARD ?auto_282004 ?auto_282005 ) ( not ( = ?auto_281994 ?auto_281991 ) ) ( not ( = ?auto_282003 ?auto_282004 ) ) ( SUPPORTS ?auto_282004 ?auto_281990 ) ( CALIBRATION_TARGET ?auto_282004 ?auto_282000 ) ( not ( = ?auto_282000 ?auto_281988 ) ) ( ON_BOARD ?auto_281998 ?auto_282005 ) ( not ( = ?auto_281991 ?auto_281988 ) ) ( not ( = ?auto_282004 ?auto_281998 ) ) ( SUPPORTS ?auto_281998 ?auto_281989 ) ( CALIBRATION_TARGET ?auto_281998 ?auto_282000 ) ( not ( = ?auto_282000 ?auto_281992 ) ) ( ON_BOARD ?auto_282002 ?auto_282005 ) ( not ( = ?auto_281988 ?auto_281992 ) ) ( not ( = ?auto_281998 ?auto_282002 ) ) ( SUPPORTS ?auto_282002 ?auto_281993 ) ( CALIBRATION_TARGET ?auto_282002 ?auto_282000 ) ( not ( = ?auto_282000 ?auto_281996 ) ) ( ON_BOARD ?auto_282001 ?auto_282005 ) ( not ( = ?auto_281992 ?auto_281996 ) ) ( not ( = ?auto_282002 ?auto_282001 ) ) ( SUPPORTS ?auto_282001 ?auto_281997 ) ( CALIBRATION_TARGET ?auto_282001 ?auto_282000 ) ( POWER_AVAIL ?auto_282005 ) ( POINTING ?auto_282005 ?auto_281999 ) ( not ( = ?auto_282000 ?auto_281999 ) ) ( not ( = ?auto_281996 ?auto_281999 ) ) ( not ( = ?auto_281997 ?auto_281993 ) ) ( not ( = ?auto_281992 ?auto_281999 ) ) ( not ( = ?auto_281996 ?auto_281988 ) ) ( not ( = ?auto_281997 ?auto_281989 ) ) ( not ( = ?auto_281993 ?auto_281989 ) ) ( not ( = ?auto_281988 ?auto_281999 ) ) ( not ( = ?auto_281998 ?auto_282001 ) ) ( not ( = ?auto_281996 ?auto_281991 ) ) ( not ( = ?auto_281997 ?auto_281990 ) ) ( not ( = ?auto_281992 ?auto_281991 ) ) ( not ( = ?auto_281993 ?auto_281990 ) ) ( not ( = ?auto_281989 ?auto_281990 ) ) ( not ( = ?auto_281991 ?auto_281999 ) ) ( not ( = ?auto_282004 ?auto_282002 ) ) ( not ( = ?auto_282004 ?auto_282001 ) ) ( not ( = ?auto_281996 ?auto_281994 ) ) ( not ( = ?auto_281997 ?auto_281995 ) ) ( not ( = ?auto_281992 ?auto_281994 ) ) ( not ( = ?auto_281993 ?auto_281995 ) ) ( not ( = ?auto_281988 ?auto_281994 ) ) ( not ( = ?auto_281989 ?auto_281995 ) ) ( not ( = ?auto_281990 ?auto_281995 ) ) ( not ( = ?auto_281994 ?auto_281999 ) ) ( not ( = ?auto_282003 ?auto_281998 ) ) ( not ( = ?auto_282003 ?auto_282002 ) ) ( not ( = ?auto_282003 ?auto_282001 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_281996 ?auto_281997 ?auto_281992 ?auto_281993 ?auto_281988 ?auto_281989 ?auto_281994 ?auto_281995 ?auto_281991 ?auto_281990 )
      ( GET-5IMAGE-VERIFY ?auto_281988 ?auto_281989 ?auto_281991 ?auto_281990 ?auto_281992 ?auto_281993 ?auto_281994 ?auto_281995 ?auto_281996 ?auto_281997 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_282486 - DIRECTION
      ?auto_282487 - MODE
      ?auto_282489 - DIRECTION
      ?auto_282488 - MODE
      ?auto_282490 - DIRECTION
      ?auto_282491 - MODE
      ?auto_282492 - DIRECTION
      ?auto_282493 - MODE
      ?auto_282494 - DIRECTION
      ?auto_282495 - MODE
    )
    :vars
    (
      ?auto_282501 - INSTRUMENT
      ?auto_282503 - SATELLITE
      ?auto_282498 - DIRECTION
      ?auto_282502 - INSTRUMENT
      ?auto_282496 - INSTRUMENT
      ?auto_282500 - INSTRUMENT
      ?auto_282499 - INSTRUMENT
      ?auto_282497 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282501 ?auto_282503 ) ( SUPPORTS ?auto_282501 ?auto_282491 ) ( not ( = ?auto_282490 ?auto_282498 ) ) ( CALIBRATION_TARGET ?auto_282501 ?auto_282498 ) ( not ( = ?auto_282498 ?auto_282489 ) ) ( ON_BOARD ?auto_282502 ?auto_282503 ) ( not ( = ?auto_282490 ?auto_282489 ) ) ( not ( = ?auto_282501 ?auto_282502 ) ) ( SUPPORTS ?auto_282502 ?auto_282488 ) ( CALIBRATION_TARGET ?auto_282502 ?auto_282498 ) ( not ( = ?auto_282498 ?auto_282486 ) ) ( ON_BOARD ?auto_282496 ?auto_282503 ) ( not ( = ?auto_282489 ?auto_282486 ) ) ( not ( = ?auto_282502 ?auto_282496 ) ) ( SUPPORTS ?auto_282496 ?auto_282487 ) ( CALIBRATION_TARGET ?auto_282496 ?auto_282498 ) ( not ( = ?auto_282498 ?auto_282494 ) ) ( ON_BOARD ?auto_282500 ?auto_282503 ) ( not ( = ?auto_282486 ?auto_282494 ) ) ( not ( = ?auto_282496 ?auto_282500 ) ) ( SUPPORTS ?auto_282500 ?auto_282495 ) ( CALIBRATION_TARGET ?auto_282500 ?auto_282498 ) ( not ( = ?auto_282498 ?auto_282492 ) ) ( ON_BOARD ?auto_282499 ?auto_282503 ) ( not ( = ?auto_282494 ?auto_282492 ) ) ( not ( = ?auto_282500 ?auto_282499 ) ) ( SUPPORTS ?auto_282499 ?auto_282493 ) ( CALIBRATION_TARGET ?auto_282499 ?auto_282498 ) ( POWER_AVAIL ?auto_282503 ) ( POINTING ?auto_282503 ?auto_282497 ) ( not ( = ?auto_282498 ?auto_282497 ) ) ( not ( = ?auto_282492 ?auto_282497 ) ) ( not ( = ?auto_282493 ?auto_282495 ) ) ( not ( = ?auto_282494 ?auto_282497 ) ) ( not ( = ?auto_282492 ?auto_282486 ) ) ( not ( = ?auto_282493 ?auto_282487 ) ) ( not ( = ?auto_282495 ?auto_282487 ) ) ( not ( = ?auto_282486 ?auto_282497 ) ) ( not ( = ?auto_282496 ?auto_282499 ) ) ( not ( = ?auto_282492 ?auto_282489 ) ) ( not ( = ?auto_282493 ?auto_282488 ) ) ( not ( = ?auto_282494 ?auto_282489 ) ) ( not ( = ?auto_282495 ?auto_282488 ) ) ( not ( = ?auto_282487 ?auto_282488 ) ) ( not ( = ?auto_282489 ?auto_282497 ) ) ( not ( = ?auto_282502 ?auto_282500 ) ) ( not ( = ?auto_282502 ?auto_282499 ) ) ( not ( = ?auto_282492 ?auto_282490 ) ) ( not ( = ?auto_282493 ?auto_282491 ) ) ( not ( = ?auto_282494 ?auto_282490 ) ) ( not ( = ?auto_282495 ?auto_282491 ) ) ( not ( = ?auto_282486 ?auto_282490 ) ) ( not ( = ?auto_282487 ?auto_282491 ) ) ( not ( = ?auto_282488 ?auto_282491 ) ) ( not ( = ?auto_282490 ?auto_282497 ) ) ( not ( = ?auto_282501 ?auto_282496 ) ) ( not ( = ?auto_282501 ?auto_282500 ) ) ( not ( = ?auto_282501 ?auto_282499 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_282492 ?auto_282493 ?auto_282494 ?auto_282495 ?auto_282486 ?auto_282487 ?auto_282490 ?auto_282491 ?auto_282489 ?auto_282488 )
      ( GET-5IMAGE-VERIFY ?auto_282486 ?auto_282487 ?auto_282489 ?auto_282488 ?auto_282490 ?auto_282491 ?auto_282492 ?auto_282493 ?auto_282494 ?auto_282495 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_282564 - DIRECTION
      ?auto_282565 - MODE
      ?auto_282567 - DIRECTION
      ?auto_282566 - MODE
      ?auto_282568 - DIRECTION
      ?auto_282569 - MODE
      ?auto_282570 - DIRECTION
      ?auto_282571 - MODE
      ?auto_282572 - DIRECTION
      ?auto_282573 - MODE
    )
    :vars
    (
      ?auto_282579 - INSTRUMENT
      ?auto_282581 - SATELLITE
      ?auto_282576 - DIRECTION
      ?auto_282580 - INSTRUMENT
      ?auto_282574 - INSTRUMENT
      ?auto_282578 - INSTRUMENT
      ?auto_282577 - INSTRUMENT
      ?auto_282575 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_282579 ?auto_282581 ) ( SUPPORTS ?auto_282579 ?auto_282569 ) ( not ( = ?auto_282568 ?auto_282576 ) ) ( CALIBRATION_TARGET ?auto_282579 ?auto_282576 ) ( not ( = ?auto_282576 ?auto_282567 ) ) ( ON_BOARD ?auto_282580 ?auto_282581 ) ( not ( = ?auto_282568 ?auto_282567 ) ) ( not ( = ?auto_282579 ?auto_282580 ) ) ( SUPPORTS ?auto_282580 ?auto_282566 ) ( CALIBRATION_TARGET ?auto_282580 ?auto_282576 ) ( not ( = ?auto_282576 ?auto_282564 ) ) ( ON_BOARD ?auto_282574 ?auto_282581 ) ( not ( = ?auto_282567 ?auto_282564 ) ) ( not ( = ?auto_282580 ?auto_282574 ) ) ( SUPPORTS ?auto_282574 ?auto_282565 ) ( CALIBRATION_TARGET ?auto_282574 ?auto_282576 ) ( not ( = ?auto_282576 ?auto_282570 ) ) ( ON_BOARD ?auto_282578 ?auto_282581 ) ( not ( = ?auto_282564 ?auto_282570 ) ) ( not ( = ?auto_282574 ?auto_282578 ) ) ( SUPPORTS ?auto_282578 ?auto_282571 ) ( CALIBRATION_TARGET ?auto_282578 ?auto_282576 ) ( not ( = ?auto_282576 ?auto_282572 ) ) ( ON_BOARD ?auto_282577 ?auto_282581 ) ( not ( = ?auto_282570 ?auto_282572 ) ) ( not ( = ?auto_282578 ?auto_282577 ) ) ( SUPPORTS ?auto_282577 ?auto_282573 ) ( CALIBRATION_TARGET ?auto_282577 ?auto_282576 ) ( POWER_AVAIL ?auto_282581 ) ( POINTING ?auto_282581 ?auto_282575 ) ( not ( = ?auto_282576 ?auto_282575 ) ) ( not ( = ?auto_282572 ?auto_282575 ) ) ( not ( = ?auto_282573 ?auto_282571 ) ) ( not ( = ?auto_282570 ?auto_282575 ) ) ( not ( = ?auto_282572 ?auto_282564 ) ) ( not ( = ?auto_282573 ?auto_282565 ) ) ( not ( = ?auto_282571 ?auto_282565 ) ) ( not ( = ?auto_282564 ?auto_282575 ) ) ( not ( = ?auto_282574 ?auto_282577 ) ) ( not ( = ?auto_282572 ?auto_282567 ) ) ( not ( = ?auto_282573 ?auto_282566 ) ) ( not ( = ?auto_282570 ?auto_282567 ) ) ( not ( = ?auto_282571 ?auto_282566 ) ) ( not ( = ?auto_282565 ?auto_282566 ) ) ( not ( = ?auto_282567 ?auto_282575 ) ) ( not ( = ?auto_282580 ?auto_282578 ) ) ( not ( = ?auto_282580 ?auto_282577 ) ) ( not ( = ?auto_282572 ?auto_282568 ) ) ( not ( = ?auto_282573 ?auto_282569 ) ) ( not ( = ?auto_282570 ?auto_282568 ) ) ( not ( = ?auto_282571 ?auto_282569 ) ) ( not ( = ?auto_282564 ?auto_282568 ) ) ( not ( = ?auto_282565 ?auto_282569 ) ) ( not ( = ?auto_282566 ?auto_282569 ) ) ( not ( = ?auto_282568 ?auto_282575 ) ) ( not ( = ?auto_282579 ?auto_282574 ) ) ( not ( = ?auto_282579 ?auto_282578 ) ) ( not ( = ?auto_282579 ?auto_282577 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_282572 ?auto_282573 ?auto_282570 ?auto_282571 ?auto_282564 ?auto_282565 ?auto_282568 ?auto_282569 ?auto_282567 ?auto_282566 )
      ( GET-5IMAGE-VERIFY ?auto_282564 ?auto_282565 ?auto_282567 ?auto_282566 ?auto_282568 ?auto_282569 ?auto_282570 ?auto_282571 ?auto_282572 ?auto_282573 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_283146 - DIRECTION
      ?auto_283147 - MODE
      ?auto_283149 - DIRECTION
      ?auto_283148 - MODE
      ?auto_283150 - DIRECTION
      ?auto_283151 - MODE
      ?auto_283152 - DIRECTION
      ?auto_283153 - MODE
      ?auto_283154 - DIRECTION
      ?auto_283155 - MODE
    )
    :vars
    (
      ?auto_283161 - INSTRUMENT
      ?auto_283163 - SATELLITE
      ?auto_283158 - DIRECTION
      ?auto_283162 - INSTRUMENT
      ?auto_283156 - INSTRUMENT
      ?auto_283160 - INSTRUMENT
      ?auto_283159 - INSTRUMENT
      ?auto_283157 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_283161 ?auto_283163 ) ( SUPPORTS ?auto_283161 ?auto_283148 ) ( not ( = ?auto_283149 ?auto_283158 ) ) ( CALIBRATION_TARGET ?auto_283161 ?auto_283158 ) ( not ( = ?auto_283158 ?auto_283154 ) ) ( ON_BOARD ?auto_283162 ?auto_283163 ) ( not ( = ?auto_283149 ?auto_283154 ) ) ( not ( = ?auto_283161 ?auto_283162 ) ) ( SUPPORTS ?auto_283162 ?auto_283155 ) ( CALIBRATION_TARGET ?auto_283162 ?auto_283158 ) ( not ( = ?auto_283158 ?auto_283146 ) ) ( ON_BOARD ?auto_283156 ?auto_283163 ) ( not ( = ?auto_283154 ?auto_283146 ) ) ( not ( = ?auto_283162 ?auto_283156 ) ) ( SUPPORTS ?auto_283156 ?auto_283147 ) ( CALIBRATION_TARGET ?auto_283156 ?auto_283158 ) ( not ( = ?auto_283158 ?auto_283152 ) ) ( ON_BOARD ?auto_283160 ?auto_283163 ) ( not ( = ?auto_283146 ?auto_283152 ) ) ( not ( = ?auto_283156 ?auto_283160 ) ) ( SUPPORTS ?auto_283160 ?auto_283153 ) ( CALIBRATION_TARGET ?auto_283160 ?auto_283158 ) ( not ( = ?auto_283158 ?auto_283150 ) ) ( ON_BOARD ?auto_283159 ?auto_283163 ) ( not ( = ?auto_283152 ?auto_283150 ) ) ( not ( = ?auto_283160 ?auto_283159 ) ) ( SUPPORTS ?auto_283159 ?auto_283151 ) ( CALIBRATION_TARGET ?auto_283159 ?auto_283158 ) ( POWER_AVAIL ?auto_283163 ) ( POINTING ?auto_283163 ?auto_283157 ) ( not ( = ?auto_283158 ?auto_283157 ) ) ( not ( = ?auto_283150 ?auto_283157 ) ) ( not ( = ?auto_283151 ?auto_283153 ) ) ( not ( = ?auto_283152 ?auto_283157 ) ) ( not ( = ?auto_283150 ?auto_283146 ) ) ( not ( = ?auto_283151 ?auto_283147 ) ) ( not ( = ?auto_283153 ?auto_283147 ) ) ( not ( = ?auto_283146 ?auto_283157 ) ) ( not ( = ?auto_283156 ?auto_283159 ) ) ( not ( = ?auto_283150 ?auto_283154 ) ) ( not ( = ?auto_283151 ?auto_283155 ) ) ( not ( = ?auto_283152 ?auto_283154 ) ) ( not ( = ?auto_283153 ?auto_283155 ) ) ( not ( = ?auto_283147 ?auto_283155 ) ) ( not ( = ?auto_283154 ?auto_283157 ) ) ( not ( = ?auto_283162 ?auto_283160 ) ) ( not ( = ?auto_283162 ?auto_283159 ) ) ( not ( = ?auto_283150 ?auto_283149 ) ) ( not ( = ?auto_283151 ?auto_283148 ) ) ( not ( = ?auto_283152 ?auto_283149 ) ) ( not ( = ?auto_283153 ?auto_283148 ) ) ( not ( = ?auto_283146 ?auto_283149 ) ) ( not ( = ?auto_283147 ?auto_283148 ) ) ( not ( = ?auto_283155 ?auto_283148 ) ) ( not ( = ?auto_283149 ?auto_283157 ) ) ( not ( = ?auto_283161 ?auto_283156 ) ) ( not ( = ?auto_283161 ?auto_283160 ) ) ( not ( = ?auto_283161 ?auto_283159 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_283150 ?auto_283151 ?auto_283152 ?auto_283153 ?auto_283146 ?auto_283147 ?auto_283149 ?auto_283148 ?auto_283154 ?auto_283155 )
      ( GET-5IMAGE-VERIFY ?auto_283146 ?auto_283147 ?auto_283149 ?auto_283148 ?auto_283150 ?auto_283151 ?auto_283152 ?auto_283153 ?auto_283154 ?auto_283155 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_283310 - DIRECTION
      ?auto_283311 - MODE
      ?auto_283313 - DIRECTION
      ?auto_283312 - MODE
      ?auto_283314 - DIRECTION
      ?auto_283315 - MODE
      ?auto_283316 - DIRECTION
      ?auto_283317 - MODE
      ?auto_283318 - DIRECTION
      ?auto_283319 - MODE
    )
    :vars
    (
      ?auto_283325 - INSTRUMENT
      ?auto_283327 - SATELLITE
      ?auto_283322 - DIRECTION
      ?auto_283326 - INSTRUMENT
      ?auto_283320 - INSTRUMENT
      ?auto_283324 - INSTRUMENT
      ?auto_283323 - INSTRUMENT
      ?auto_283321 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_283325 ?auto_283327 ) ( SUPPORTS ?auto_283325 ?auto_283312 ) ( not ( = ?auto_283313 ?auto_283322 ) ) ( CALIBRATION_TARGET ?auto_283325 ?auto_283322 ) ( not ( = ?auto_283322 ?auto_283316 ) ) ( ON_BOARD ?auto_283326 ?auto_283327 ) ( not ( = ?auto_283313 ?auto_283316 ) ) ( not ( = ?auto_283325 ?auto_283326 ) ) ( SUPPORTS ?auto_283326 ?auto_283317 ) ( CALIBRATION_TARGET ?auto_283326 ?auto_283322 ) ( not ( = ?auto_283322 ?auto_283310 ) ) ( ON_BOARD ?auto_283320 ?auto_283327 ) ( not ( = ?auto_283316 ?auto_283310 ) ) ( not ( = ?auto_283326 ?auto_283320 ) ) ( SUPPORTS ?auto_283320 ?auto_283311 ) ( CALIBRATION_TARGET ?auto_283320 ?auto_283322 ) ( not ( = ?auto_283322 ?auto_283318 ) ) ( ON_BOARD ?auto_283324 ?auto_283327 ) ( not ( = ?auto_283310 ?auto_283318 ) ) ( not ( = ?auto_283320 ?auto_283324 ) ) ( SUPPORTS ?auto_283324 ?auto_283319 ) ( CALIBRATION_TARGET ?auto_283324 ?auto_283322 ) ( not ( = ?auto_283322 ?auto_283314 ) ) ( ON_BOARD ?auto_283323 ?auto_283327 ) ( not ( = ?auto_283318 ?auto_283314 ) ) ( not ( = ?auto_283324 ?auto_283323 ) ) ( SUPPORTS ?auto_283323 ?auto_283315 ) ( CALIBRATION_TARGET ?auto_283323 ?auto_283322 ) ( POWER_AVAIL ?auto_283327 ) ( POINTING ?auto_283327 ?auto_283321 ) ( not ( = ?auto_283322 ?auto_283321 ) ) ( not ( = ?auto_283314 ?auto_283321 ) ) ( not ( = ?auto_283315 ?auto_283319 ) ) ( not ( = ?auto_283318 ?auto_283321 ) ) ( not ( = ?auto_283314 ?auto_283310 ) ) ( not ( = ?auto_283315 ?auto_283311 ) ) ( not ( = ?auto_283319 ?auto_283311 ) ) ( not ( = ?auto_283310 ?auto_283321 ) ) ( not ( = ?auto_283320 ?auto_283323 ) ) ( not ( = ?auto_283314 ?auto_283316 ) ) ( not ( = ?auto_283315 ?auto_283317 ) ) ( not ( = ?auto_283318 ?auto_283316 ) ) ( not ( = ?auto_283319 ?auto_283317 ) ) ( not ( = ?auto_283311 ?auto_283317 ) ) ( not ( = ?auto_283316 ?auto_283321 ) ) ( not ( = ?auto_283326 ?auto_283324 ) ) ( not ( = ?auto_283326 ?auto_283323 ) ) ( not ( = ?auto_283314 ?auto_283313 ) ) ( not ( = ?auto_283315 ?auto_283312 ) ) ( not ( = ?auto_283318 ?auto_283313 ) ) ( not ( = ?auto_283319 ?auto_283312 ) ) ( not ( = ?auto_283310 ?auto_283313 ) ) ( not ( = ?auto_283311 ?auto_283312 ) ) ( not ( = ?auto_283317 ?auto_283312 ) ) ( not ( = ?auto_283313 ?auto_283321 ) ) ( not ( = ?auto_283325 ?auto_283320 ) ) ( not ( = ?auto_283325 ?auto_283324 ) ) ( not ( = ?auto_283325 ?auto_283323 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_283314 ?auto_283315 ?auto_283318 ?auto_283319 ?auto_283310 ?auto_283311 ?auto_283313 ?auto_283312 ?auto_283316 ?auto_283317 )
      ( GET-5IMAGE-VERIFY ?auto_283310 ?auto_283311 ?auto_283313 ?auto_283312 ?auto_283314 ?auto_283315 ?auto_283316 ?auto_283317 ?auto_283318 ?auto_283319 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_283554 - DIRECTION
      ?auto_283555 - MODE
      ?auto_283557 - DIRECTION
      ?auto_283556 - MODE
      ?auto_283558 - DIRECTION
      ?auto_283559 - MODE
      ?auto_283560 - DIRECTION
      ?auto_283561 - MODE
      ?auto_283562 - DIRECTION
      ?auto_283563 - MODE
    )
    :vars
    (
      ?auto_283569 - INSTRUMENT
      ?auto_283571 - SATELLITE
      ?auto_283566 - DIRECTION
      ?auto_283570 - INSTRUMENT
      ?auto_283564 - INSTRUMENT
      ?auto_283568 - INSTRUMENT
      ?auto_283567 - INSTRUMENT
      ?auto_283565 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_283569 ?auto_283571 ) ( SUPPORTS ?auto_283569 ?auto_283556 ) ( not ( = ?auto_283557 ?auto_283566 ) ) ( CALIBRATION_TARGET ?auto_283569 ?auto_283566 ) ( not ( = ?auto_283566 ?auto_283562 ) ) ( ON_BOARD ?auto_283570 ?auto_283571 ) ( not ( = ?auto_283557 ?auto_283562 ) ) ( not ( = ?auto_283569 ?auto_283570 ) ) ( SUPPORTS ?auto_283570 ?auto_283563 ) ( CALIBRATION_TARGET ?auto_283570 ?auto_283566 ) ( not ( = ?auto_283566 ?auto_283554 ) ) ( ON_BOARD ?auto_283564 ?auto_283571 ) ( not ( = ?auto_283562 ?auto_283554 ) ) ( not ( = ?auto_283570 ?auto_283564 ) ) ( SUPPORTS ?auto_283564 ?auto_283555 ) ( CALIBRATION_TARGET ?auto_283564 ?auto_283566 ) ( not ( = ?auto_283566 ?auto_283558 ) ) ( ON_BOARD ?auto_283568 ?auto_283571 ) ( not ( = ?auto_283554 ?auto_283558 ) ) ( not ( = ?auto_283564 ?auto_283568 ) ) ( SUPPORTS ?auto_283568 ?auto_283559 ) ( CALIBRATION_TARGET ?auto_283568 ?auto_283566 ) ( not ( = ?auto_283566 ?auto_283560 ) ) ( ON_BOARD ?auto_283567 ?auto_283571 ) ( not ( = ?auto_283558 ?auto_283560 ) ) ( not ( = ?auto_283568 ?auto_283567 ) ) ( SUPPORTS ?auto_283567 ?auto_283561 ) ( CALIBRATION_TARGET ?auto_283567 ?auto_283566 ) ( POWER_AVAIL ?auto_283571 ) ( POINTING ?auto_283571 ?auto_283565 ) ( not ( = ?auto_283566 ?auto_283565 ) ) ( not ( = ?auto_283560 ?auto_283565 ) ) ( not ( = ?auto_283561 ?auto_283559 ) ) ( not ( = ?auto_283558 ?auto_283565 ) ) ( not ( = ?auto_283560 ?auto_283554 ) ) ( not ( = ?auto_283561 ?auto_283555 ) ) ( not ( = ?auto_283559 ?auto_283555 ) ) ( not ( = ?auto_283554 ?auto_283565 ) ) ( not ( = ?auto_283564 ?auto_283567 ) ) ( not ( = ?auto_283560 ?auto_283562 ) ) ( not ( = ?auto_283561 ?auto_283563 ) ) ( not ( = ?auto_283558 ?auto_283562 ) ) ( not ( = ?auto_283559 ?auto_283563 ) ) ( not ( = ?auto_283555 ?auto_283563 ) ) ( not ( = ?auto_283562 ?auto_283565 ) ) ( not ( = ?auto_283570 ?auto_283568 ) ) ( not ( = ?auto_283570 ?auto_283567 ) ) ( not ( = ?auto_283560 ?auto_283557 ) ) ( not ( = ?auto_283561 ?auto_283556 ) ) ( not ( = ?auto_283558 ?auto_283557 ) ) ( not ( = ?auto_283559 ?auto_283556 ) ) ( not ( = ?auto_283554 ?auto_283557 ) ) ( not ( = ?auto_283555 ?auto_283556 ) ) ( not ( = ?auto_283563 ?auto_283556 ) ) ( not ( = ?auto_283557 ?auto_283565 ) ) ( not ( = ?auto_283569 ?auto_283564 ) ) ( not ( = ?auto_283569 ?auto_283568 ) ) ( not ( = ?auto_283569 ?auto_283567 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_283560 ?auto_283561 ?auto_283558 ?auto_283559 ?auto_283554 ?auto_283555 ?auto_283557 ?auto_283556 ?auto_283562 ?auto_283563 )
      ( GET-5IMAGE-VERIFY ?auto_283554 ?auto_283555 ?auto_283557 ?auto_283556 ?auto_283558 ?auto_283559 ?auto_283560 ?auto_283561 ?auto_283562 ?auto_283563 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_283804 - DIRECTION
      ?auto_283805 - MODE
      ?auto_283807 - DIRECTION
      ?auto_283806 - MODE
      ?auto_283808 - DIRECTION
      ?auto_283809 - MODE
      ?auto_283810 - DIRECTION
      ?auto_283811 - MODE
      ?auto_283812 - DIRECTION
      ?auto_283813 - MODE
    )
    :vars
    (
      ?auto_283819 - INSTRUMENT
      ?auto_283821 - SATELLITE
      ?auto_283816 - DIRECTION
      ?auto_283820 - INSTRUMENT
      ?auto_283814 - INSTRUMENT
      ?auto_283818 - INSTRUMENT
      ?auto_283817 - INSTRUMENT
      ?auto_283815 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_283819 ?auto_283821 ) ( SUPPORTS ?auto_283819 ?auto_283806 ) ( not ( = ?auto_283807 ?auto_283816 ) ) ( CALIBRATION_TARGET ?auto_283819 ?auto_283816 ) ( not ( = ?auto_283816 ?auto_283810 ) ) ( ON_BOARD ?auto_283820 ?auto_283821 ) ( not ( = ?auto_283807 ?auto_283810 ) ) ( not ( = ?auto_283819 ?auto_283820 ) ) ( SUPPORTS ?auto_283820 ?auto_283811 ) ( CALIBRATION_TARGET ?auto_283820 ?auto_283816 ) ( not ( = ?auto_283816 ?auto_283804 ) ) ( ON_BOARD ?auto_283814 ?auto_283821 ) ( not ( = ?auto_283810 ?auto_283804 ) ) ( not ( = ?auto_283820 ?auto_283814 ) ) ( SUPPORTS ?auto_283814 ?auto_283805 ) ( CALIBRATION_TARGET ?auto_283814 ?auto_283816 ) ( not ( = ?auto_283816 ?auto_283808 ) ) ( ON_BOARD ?auto_283818 ?auto_283821 ) ( not ( = ?auto_283804 ?auto_283808 ) ) ( not ( = ?auto_283814 ?auto_283818 ) ) ( SUPPORTS ?auto_283818 ?auto_283809 ) ( CALIBRATION_TARGET ?auto_283818 ?auto_283816 ) ( not ( = ?auto_283816 ?auto_283812 ) ) ( ON_BOARD ?auto_283817 ?auto_283821 ) ( not ( = ?auto_283808 ?auto_283812 ) ) ( not ( = ?auto_283818 ?auto_283817 ) ) ( SUPPORTS ?auto_283817 ?auto_283813 ) ( CALIBRATION_TARGET ?auto_283817 ?auto_283816 ) ( POWER_AVAIL ?auto_283821 ) ( POINTING ?auto_283821 ?auto_283815 ) ( not ( = ?auto_283816 ?auto_283815 ) ) ( not ( = ?auto_283812 ?auto_283815 ) ) ( not ( = ?auto_283813 ?auto_283809 ) ) ( not ( = ?auto_283808 ?auto_283815 ) ) ( not ( = ?auto_283812 ?auto_283804 ) ) ( not ( = ?auto_283813 ?auto_283805 ) ) ( not ( = ?auto_283809 ?auto_283805 ) ) ( not ( = ?auto_283804 ?auto_283815 ) ) ( not ( = ?auto_283814 ?auto_283817 ) ) ( not ( = ?auto_283812 ?auto_283810 ) ) ( not ( = ?auto_283813 ?auto_283811 ) ) ( not ( = ?auto_283808 ?auto_283810 ) ) ( not ( = ?auto_283809 ?auto_283811 ) ) ( not ( = ?auto_283805 ?auto_283811 ) ) ( not ( = ?auto_283810 ?auto_283815 ) ) ( not ( = ?auto_283820 ?auto_283818 ) ) ( not ( = ?auto_283820 ?auto_283817 ) ) ( not ( = ?auto_283812 ?auto_283807 ) ) ( not ( = ?auto_283813 ?auto_283806 ) ) ( not ( = ?auto_283808 ?auto_283807 ) ) ( not ( = ?auto_283809 ?auto_283806 ) ) ( not ( = ?auto_283804 ?auto_283807 ) ) ( not ( = ?auto_283805 ?auto_283806 ) ) ( not ( = ?auto_283811 ?auto_283806 ) ) ( not ( = ?auto_283807 ?auto_283815 ) ) ( not ( = ?auto_283819 ?auto_283814 ) ) ( not ( = ?auto_283819 ?auto_283818 ) ) ( not ( = ?auto_283819 ?auto_283817 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_283812 ?auto_283813 ?auto_283808 ?auto_283809 ?auto_283804 ?auto_283805 ?auto_283807 ?auto_283806 ?auto_283810 ?auto_283811 )
      ( GET-5IMAGE-VERIFY ?auto_283804 ?auto_283805 ?auto_283807 ?auto_283806 ?auto_283808 ?auto_283809 ?auto_283810 ?auto_283811 ?auto_283812 ?auto_283813 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_284574 - DIRECTION
      ?auto_284575 - MODE
      ?auto_284577 - DIRECTION
      ?auto_284576 - MODE
      ?auto_284578 - DIRECTION
      ?auto_284579 - MODE
      ?auto_284580 - DIRECTION
      ?auto_284581 - MODE
      ?auto_284582 - DIRECTION
      ?auto_284583 - MODE
    )
    :vars
    (
      ?auto_284589 - INSTRUMENT
      ?auto_284591 - SATELLITE
      ?auto_284586 - DIRECTION
      ?auto_284590 - INSTRUMENT
      ?auto_284584 - INSTRUMENT
      ?auto_284588 - INSTRUMENT
      ?auto_284587 - INSTRUMENT
      ?auto_284585 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_284589 ?auto_284591 ) ( SUPPORTS ?auto_284589 ?auto_284576 ) ( not ( = ?auto_284577 ?auto_284586 ) ) ( CALIBRATION_TARGET ?auto_284589 ?auto_284586 ) ( not ( = ?auto_284586 ?auto_284578 ) ) ( ON_BOARD ?auto_284590 ?auto_284591 ) ( not ( = ?auto_284577 ?auto_284578 ) ) ( not ( = ?auto_284589 ?auto_284590 ) ) ( SUPPORTS ?auto_284590 ?auto_284579 ) ( CALIBRATION_TARGET ?auto_284590 ?auto_284586 ) ( not ( = ?auto_284586 ?auto_284574 ) ) ( ON_BOARD ?auto_284584 ?auto_284591 ) ( not ( = ?auto_284578 ?auto_284574 ) ) ( not ( = ?auto_284590 ?auto_284584 ) ) ( SUPPORTS ?auto_284584 ?auto_284575 ) ( CALIBRATION_TARGET ?auto_284584 ?auto_284586 ) ( not ( = ?auto_284586 ?auto_284582 ) ) ( ON_BOARD ?auto_284588 ?auto_284591 ) ( not ( = ?auto_284574 ?auto_284582 ) ) ( not ( = ?auto_284584 ?auto_284588 ) ) ( SUPPORTS ?auto_284588 ?auto_284583 ) ( CALIBRATION_TARGET ?auto_284588 ?auto_284586 ) ( not ( = ?auto_284586 ?auto_284580 ) ) ( ON_BOARD ?auto_284587 ?auto_284591 ) ( not ( = ?auto_284582 ?auto_284580 ) ) ( not ( = ?auto_284588 ?auto_284587 ) ) ( SUPPORTS ?auto_284587 ?auto_284581 ) ( CALIBRATION_TARGET ?auto_284587 ?auto_284586 ) ( POWER_AVAIL ?auto_284591 ) ( POINTING ?auto_284591 ?auto_284585 ) ( not ( = ?auto_284586 ?auto_284585 ) ) ( not ( = ?auto_284580 ?auto_284585 ) ) ( not ( = ?auto_284581 ?auto_284583 ) ) ( not ( = ?auto_284582 ?auto_284585 ) ) ( not ( = ?auto_284580 ?auto_284574 ) ) ( not ( = ?auto_284581 ?auto_284575 ) ) ( not ( = ?auto_284583 ?auto_284575 ) ) ( not ( = ?auto_284574 ?auto_284585 ) ) ( not ( = ?auto_284584 ?auto_284587 ) ) ( not ( = ?auto_284580 ?auto_284578 ) ) ( not ( = ?auto_284581 ?auto_284579 ) ) ( not ( = ?auto_284582 ?auto_284578 ) ) ( not ( = ?auto_284583 ?auto_284579 ) ) ( not ( = ?auto_284575 ?auto_284579 ) ) ( not ( = ?auto_284578 ?auto_284585 ) ) ( not ( = ?auto_284590 ?auto_284588 ) ) ( not ( = ?auto_284590 ?auto_284587 ) ) ( not ( = ?auto_284580 ?auto_284577 ) ) ( not ( = ?auto_284581 ?auto_284576 ) ) ( not ( = ?auto_284582 ?auto_284577 ) ) ( not ( = ?auto_284583 ?auto_284576 ) ) ( not ( = ?auto_284574 ?auto_284577 ) ) ( not ( = ?auto_284575 ?auto_284576 ) ) ( not ( = ?auto_284579 ?auto_284576 ) ) ( not ( = ?auto_284577 ?auto_284585 ) ) ( not ( = ?auto_284589 ?auto_284584 ) ) ( not ( = ?auto_284589 ?auto_284588 ) ) ( not ( = ?auto_284589 ?auto_284587 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_284580 ?auto_284581 ?auto_284582 ?auto_284583 ?auto_284574 ?auto_284575 ?auto_284577 ?auto_284576 ?auto_284578 ?auto_284579 )
      ( GET-5IMAGE-VERIFY ?auto_284574 ?auto_284575 ?auto_284577 ?auto_284576 ?auto_284578 ?auto_284579 ?auto_284580 ?auto_284581 ?auto_284582 ?auto_284583 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_284652 - DIRECTION
      ?auto_284653 - MODE
      ?auto_284655 - DIRECTION
      ?auto_284654 - MODE
      ?auto_284656 - DIRECTION
      ?auto_284657 - MODE
      ?auto_284658 - DIRECTION
      ?auto_284659 - MODE
      ?auto_284660 - DIRECTION
      ?auto_284661 - MODE
    )
    :vars
    (
      ?auto_284667 - INSTRUMENT
      ?auto_284669 - SATELLITE
      ?auto_284664 - DIRECTION
      ?auto_284668 - INSTRUMENT
      ?auto_284662 - INSTRUMENT
      ?auto_284666 - INSTRUMENT
      ?auto_284665 - INSTRUMENT
      ?auto_284663 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_284667 ?auto_284669 ) ( SUPPORTS ?auto_284667 ?auto_284654 ) ( not ( = ?auto_284655 ?auto_284664 ) ) ( CALIBRATION_TARGET ?auto_284667 ?auto_284664 ) ( not ( = ?auto_284664 ?auto_284656 ) ) ( ON_BOARD ?auto_284668 ?auto_284669 ) ( not ( = ?auto_284655 ?auto_284656 ) ) ( not ( = ?auto_284667 ?auto_284668 ) ) ( SUPPORTS ?auto_284668 ?auto_284657 ) ( CALIBRATION_TARGET ?auto_284668 ?auto_284664 ) ( not ( = ?auto_284664 ?auto_284652 ) ) ( ON_BOARD ?auto_284662 ?auto_284669 ) ( not ( = ?auto_284656 ?auto_284652 ) ) ( not ( = ?auto_284668 ?auto_284662 ) ) ( SUPPORTS ?auto_284662 ?auto_284653 ) ( CALIBRATION_TARGET ?auto_284662 ?auto_284664 ) ( not ( = ?auto_284664 ?auto_284658 ) ) ( ON_BOARD ?auto_284666 ?auto_284669 ) ( not ( = ?auto_284652 ?auto_284658 ) ) ( not ( = ?auto_284662 ?auto_284666 ) ) ( SUPPORTS ?auto_284666 ?auto_284659 ) ( CALIBRATION_TARGET ?auto_284666 ?auto_284664 ) ( not ( = ?auto_284664 ?auto_284660 ) ) ( ON_BOARD ?auto_284665 ?auto_284669 ) ( not ( = ?auto_284658 ?auto_284660 ) ) ( not ( = ?auto_284666 ?auto_284665 ) ) ( SUPPORTS ?auto_284665 ?auto_284661 ) ( CALIBRATION_TARGET ?auto_284665 ?auto_284664 ) ( POWER_AVAIL ?auto_284669 ) ( POINTING ?auto_284669 ?auto_284663 ) ( not ( = ?auto_284664 ?auto_284663 ) ) ( not ( = ?auto_284660 ?auto_284663 ) ) ( not ( = ?auto_284661 ?auto_284659 ) ) ( not ( = ?auto_284658 ?auto_284663 ) ) ( not ( = ?auto_284660 ?auto_284652 ) ) ( not ( = ?auto_284661 ?auto_284653 ) ) ( not ( = ?auto_284659 ?auto_284653 ) ) ( not ( = ?auto_284652 ?auto_284663 ) ) ( not ( = ?auto_284662 ?auto_284665 ) ) ( not ( = ?auto_284660 ?auto_284656 ) ) ( not ( = ?auto_284661 ?auto_284657 ) ) ( not ( = ?auto_284658 ?auto_284656 ) ) ( not ( = ?auto_284659 ?auto_284657 ) ) ( not ( = ?auto_284653 ?auto_284657 ) ) ( not ( = ?auto_284656 ?auto_284663 ) ) ( not ( = ?auto_284668 ?auto_284666 ) ) ( not ( = ?auto_284668 ?auto_284665 ) ) ( not ( = ?auto_284660 ?auto_284655 ) ) ( not ( = ?auto_284661 ?auto_284654 ) ) ( not ( = ?auto_284658 ?auto_284655 ) ) ( not ( = ?auto_284659 ?auto_284654 ) ) ( not ( = ?auto_284652 ?auto_284655 ) ) ( not ( = ?auto_284653 ?auto_284654 ) ) ( not ( = ?auto_284657 ?auto_284654 ) ) ( not ( = ?auto_284655 ?auto_284663 ) ) ( not ( = ?auto_284667 ?auto_284662 ) ) ( not ( = ?auto_284667 ?auto_284666 ) ) ( not ( = ?auto_284667 ?auto_284665 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_284660 ?auto_284661 ?auto_284658 ?auto_284659 ?auto_284652 ?auto_284653 ?auto_284655 ?auto_284654 ?auto_284656 ?auto_284657 )
      ( GET-5IMAGE-VERIFY ?auto_284652 ?auto_284653 ?auto_284655 ?auto_284654 ?auto_284656 ?auto_284657 ?auto_284658 ?auto_284659 ?auto_284660 ?auto_284661 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_285844 - DIRECTION
      ?auto_285845 - MODE
      ?auto_285847 - DIRECTION
      ?auto_285846 - MODE
      ?auto_285848 - DIRECTION
      ?auto_285849 - MODE
      ?auto_285850 - DIRECTION
      ?auto_285851 - MODE
      ?auto_285852 - DIRECTION
      ?auto_285853 - MODE
    )
    :vars
    (
      ?auto_285859 - INSTRUMENT
      ?auto_285861 - SATELLITE
      ?auto_285856 - DIRECTION
      ?auto_285860 - INSTRUMENT
      ?auto_285854 - INSTRUMENT
      ?auto_285858 - INSTRUMENT
      ?auto_285857 - INSTRUMENT
      ?auto_285855 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_285859 ?auto_285861 ) ( SUPPORTS ?auto_285859 ?auto_285853 ) ( not ( = ?auto_285852 ?auto_285856 ) ) ( CALIBRATION_TARGET ?auto_285859 ?auto_285856 ) ( not ( = ?auto_285856 ?auto_285844 ) ) ( ON_BOARD ?auto_285860 ?auto_285861 ) ( not ( = ?auto_285852 ?auto_285844 ) ) ( not ( = ?auto_285859 ?auto_285860 ) ) ( SUPPORTS ?auto_285860 ?auto_285845 ) ( CALIBRATION_TARGET ?auto_285860 ?auto_285856 ) ( not ( = ?auto_285856 ?auto_285850 ) ) ( ON_BOARD ?auto_285854 ?auto_285861 ) ( not ( = ?auto_285844 ?auto_285850 ) ) ( not ( = ?auto_285860 ?auto_285854 ) ) ( SUPPORTS ?auto_285854 ?auto_285851 ) ( CALIBRATION_TARGET ?auto_285854 ?auto_285856 ) ( not ( = ?auto_285856 ?auto_285848 ) ) ( ON_BOARD ?auto_285858 ?auto_285861 ) ( not ( = ?auto_285850 ?auto_285848 ) ) ( not ( = ?auto_285854 ?auto_285858 ) ) ( SUPPORTS ?auto_285858 ?auto_285849 ) ( CALIBRATION_TARGET ?auto_285858 ?auto_285856 ) ( not ( = ?auto_285856 ?auto_285847 ) ) ( ON_BOARD ?auto_285857 ?auto_285861 ) ( not ( = ?auto_285848 ?auto_285847 ) ) ( not ( = ?auto_285858 ?auto_285857 ) ) ( SUPPORTS ?auto_285857 ?auto_285846 ) ( CALIBRATION_TARGET ?auto_285857 ?auto_285856 ) ( POWER_AVAIL ?auto_285861 ) ( POINTING ?auto_285861 ?auto_285855 ) ( not ( = ?auto_285856 ?auto_285855 ) ) ( not ( = ?auto_285847 ?auto_285855 ) ) ( not ( = ?auto_285846 ?auto_285849 ) ) ( not ( = ?auto_285848 ?auto_285855 ) ) ( not ( = ?auto_285847 ?auto_285850 ) ) ( not ( = ?auto_285846 ?auto_285851 ) ) ( not ( = ?auto_285849 ?auto_285851 ) ) ( not ( = ?auto_285850 ?auto_285855 ) ) ( not ( = ?auto_285854 ?auto_285857 ) ) ( not ( = ?auto_285847 ?auto_285844 ) ) ( not ( = ?auto_285846 ?auto_285845 ) ) ( not ( = ?auto_285848 ?auto_285844 ) ) ( not ( = ?auto_285849 ?auto_285845 ) ) ( not ( = ?auto_285851 ?auto_285845 ) ) ( not ( = ?auto_285844 ?auto_285855 ) ) ( not ( = ?auto_285860 ?auto_285858 ) ) ( not ( = ?auto_285860 ?auto_285857 ) ) ( not ( = ?auto_285847 ?auto_285852 ) ) ( not ( = ?auto_285846 ?auto_285853 ) ) ( not ( = ?auto_285848 ?auto_285852 ) ) ( not ( = ?auto_285849 ?auto_285853 ) ) ( not ( = ?auto_285850 ?auto_285852 ) ) ( not ( = ?auto_285851 ?auto_285853 ) ) ( not ( = ?auto_285845 ?auto_285853 ) ) ( not ( = ?auto_285852 ?auto_285855 ) ) ( not ( = ?auto_285859 ?auto_285854 ) ) ( not ( = ?auto_285859 ?auto_285858 ) ) ( not ( = ?auto_285859 ?auto_285857 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_285847 ?auto_285846 ?auto_285848 ?auto_285849 ?auto_285850 ?auto_285851 ?auto_285852 ?auto_285853 ?auto_285844 ?auto_285845 )
      ( GET-5IMAGE-VERIFY ?auto_285844 ?auto_285845 ?auto_285847 ?auto_285846 ?auto_285848 ?auto_285849 ?auto_285850 ?auto_285851 ?auto_285852 ?auto_285853 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_285922 - DIRECTION
      ?auto_285923 - MODE
      ?auto_285925 - DIRECTION
      ?auto_285924 - MODE
      ?auto_285926 - DIRECTION
      ?auto_285927 - MODE
      ?auto_285928 - DIRECTION
      ?auto_285929 - MODE
      ?auto_285930 - DIRECTION
      ?auto_285931 - MODE
    )
    :vars
    (
      ?auto_285937 - INSTRUMENT
      ?auto_285939 - SATELLITE
      ?auto_285934 - DIRECTION
      ?auto_285938 - INSTRUMENT
      ?auto_285932 - INSTRUMENT
      ?auto_285936 - INSTRUMENT
      ?auto_285935 - INSTRUMENT
      ?auto_285933 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_285937 ?auto_285939 ) ( SUPPORTS ?auto_285937 ?auto_285929 ) ( not ( = ?auto_285928 ?auto_285934 ) ) ( CALIBRATION_TARGET ?auto_285937 ?auto_285934 ) ( not ( = ?auto_285934 ?auto_285922 ) ) ( ON_BOARD ?auto_285938 ?auto_285939 ) ( not ( = ?auto_285928 ?auto_285922 ) ) ( not ( = ?auto_285937 ?auto_285938 ) ) ( SUPPORTS ?auto_285938 ?auto_285923 ) ( CALIBRATION_TARGET ?auto_285938 ?auto_285934 ) ( not ( = ?auto_285934 ?auto_285930 ) ) ( ON_BOARD ?auto_285932 ?auto_285939 ) ( not ( = ?auto_285922 ?auto_285930 ) ) ( not ( = ?auto_285938 ?auto_285932 ) ) ( SUPPORTS ?auto_285932 ?auto_285931 ) ( CALIBRATION_TARGET ?auto_285932 ?auto_285934 ) ( not ( = ?auto_285934 ?auto_285926 ) ) ( ON_BOARD ?auto_285936 ?auto_285939 ) ( not ( = ?auto_285930 ?auto_285926 ) ) ( not ( = ?auto_285932 ?auto_285936 ) ) ( SUPPORTS ?auto_285936 ?auto_285927 ) ( CALIBRATION_TARGET ?auto_285936 ?auto_285934 ) ( not ( = ?auto_285934 ?auto_285925 ) ) ( ON_BOARD ?auto_285935 ?auto_285939 ) ( not ( = ?auto_285926 ?auto_285925 ) ) ( not ( = ?auto_285936 ?auto_285935 ) ) ( SUPPORTS ?auto_285935 ?auto_285924 ) ( CALIBRATION_TARGET ?auto_285935 ?auto_285934 ) ( POWER_AVAIL ?auto_285939 ) ( POINTING ?auto_285939 ?auto_285933 ) ( not ( = ?auto_285934 ?auto_285933 ) ) ( not ( = ?auto_285925 ?auto_285933 ) ) ( not ( = ?auto_285924 ?auto_285927 ) ) ( not ( = ?auto_285926 ?auto_285933 ) ) ( not ( = ?auto_285925 ?auto_285930 ) ) ( not ( = ?auto_285924 ?auto_285931 ) ) ( not ( = ?auto_285927 ?auto_285931 ) ) ( not ( = ?auto_285930 ?auto_285933 ) ) ( not ( = ?auto_285932 ?auto_285935 ) ) ( not ( = ?auto_285925 ?auto_285922 ) ) ( not ( = ?auto_285924 ?auto_285923 ) ) ( not ( = ?auto_285926 ?auto_285922 ) ) ( not ( = ?auto_285927 ?auto_285923 ) ) ( not ( = ?auto_285931 ?auto_285923 ) ) ( not ( = ?auto_285922 ?auto_285933 ) ) ( not ( = ?auto_285938 ?auto_285936 ) ) ( not ( = ?auto_285938 ?auto_285935 ) ) ( not ( = ?auto_285925 ?auto_285928 ) ) ( not ( = ?auto_285924 ?auto_285929 ) ) ( not ( = ?auto_285926 ?auto_285928 ) ) ( not ( = ?auto_285927 ?auto_285929 ) ) ( not ( = ?auto_285930 ?auto_285928 ) ) ( not ( = ?auto_285931 ?auto_285929 ) ) ( not ( = ?auto_285923 ?auto_285929 ) ) ( not ( = ?auto_285928 ?auto_285933 ) ) ( not ( = ?auto_285937 ?auto_285932 ) ) ( not ( = ?auto_285937 ?auto_285936 ) ) ( not ( = ?auto_285937 ?auto_285935 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_285925 ?auto_285924 ?auto_285926 ?auto_285927 ?auto_285930 ?auto_285931 ?auto_285928 ?auto_285929 ?auto_285922 ?auto_285923 )
      ( GET-5IMAGE-VERIFY ?auto_285922 ?auto_285923 ?auto_285925 ?auto_285924 ?auto_285926 ?auto_285927 ?auto_285928 ?auto_285929 ?auto_285930 ?auto_285931 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_286000 - DIRECTION
      ?auto_286001 - MODE
      ?auto_286003 - DIRECTION
      ?auto_286002 - MODE
      ?auto_286004 - DIRECTION
      ?auto_286005 - MODE
      ?auto_286006 - DIRECTION
      ?auto_286007 - MODE
      ?auto_286008 - DIRECTION
      ?auto_286009 - MODE
    )
    :vars
    (
      ?auto_286015 - INSTRUMENT
      ?auto_286017 - SATELLITE
      ?auto_286012 - DIRECTION
      ?auto_286016 - INSTRUMENT
      ?auto_286010 - INSTRUMENT
      ?auto_286014 - INSTRUMENT
      ?auto_286013 - INSTRUMENT
      ?auto_286011 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_286015 ?auto_286017 ) ( SUPPORTS ?auto_286015 ?auto_286009 ) ( not ( = ?auto_286008 ?auto_286012 ) ) ( CALIBRATION_TARGET ?auto_286015 ?auto_286012 ) ( not ( = ?auto_286012 ?auto_286000 ) ) ( ON_BOARD ?auto_286016 ?auto_286017 ) ( not ( = ?auto_286008 ?auto_286000 ) ) ( not ( = ?auto_286015 ?auto_286016 ) ) ( SUPPORTS ?auto_286016 ?auto_286001 ) ( CALIBRATION_TARGET ?auto_286016 ?auto_286012 ) ( not ( = ?auto_286012 ?auto_286004 ) ) ( ON_BOARD ?auto_286010 ?auto_286017 ) ( not ( = ?auto_286000 ?auto_286004 ) ) ( not ( = ?auto_286016 ?auto_286010 ) ) ( SUPPORTS ?auto_286010 ?auto_286005 ) ( CALIBRATION_TARGET ?auto_286010 ?auto_286012 ) ( not ( = ?auto_286012 ?auto_286006 ) ) ( ON_BOARD ?auto_286014 ?auto_286017 ) ( not ( = ?auto_286004 ?auto_286006 ) ) ( not ( = ?auto_286010 ?auto_286014 ) ) ( SUPPORTS ?auto_286014 ?auto_286007 ) ( CALIBRATION_TARGET ?auto_286014 ?auto_286012 ) ( not ( = ?auto_286012 ?auto_286003 ) ) ( ON_BOARD ?auto_286013 ?auto_286017 ) ( not ( = ?auto_286006 ?auto_286003 ) ) ( not ( = ?auto_286014 ?auto_286013 ) ) ( SUPPORTS ?auto_286013 ?auto_286002 ) ( CALIBRATION_TARGET ?auto_286013 ?auto_286012 ) ( POWER_AVAIL ?auto_286017 ) ( POINTING ?auto_286017 ?auto_286011 ) ( not ( = ?auto_286012 ?auto_286011 ) ) ( not ( = ?auto_286003 ?auto_286011 ) ) ( not ( = ?auto_286002 ?auto_286007 ) ) ( not ( = ?auto_286006 ?auto_286011 ) ) ( not ( = ?auto_286003 ?auto_286004 ) ) ( not ( = ?auto_286002 ?auto_286005 ) ) ( not ( = ?auto_286007 ?auto_286005 ) ) ( not ( = ?auto_286004 ?auto_286011 ) ) ( not ( = ?auto_286010 ?auto_286013 ) ) ( not ( = ?auto_286003 ?auto_286000 ) ) ( not ( = ?auto_286002 ?auto_286001 ) ) ( not ( = ?auto_286006 ?auto_286000 ) ) ( not ( = ?auto_286007 ?auto_286001 ) ) ( not ( = ?auto_286005 ?auto_286001 ) ) ( not ( = ?auto_286000 ?auto_286011 ) ) ( not ( = ?auto_286016 ?auto_286014 ) ) ( not ( = ?auto_286016 ?auto_286013 ) ) ( not ( = ?auto_286003 ?auto_286008 ) ) ( not ( = ?auto_286002 ?auto_286009 ) ) ( not ( = ?auto_286006 ?auto_286008 ) ) ( not ( = ?auto_286007 ?auto_286009 ) ) ( not ( = ?auto_286004 ?auto_286008 ) ) ( not ( = ?auto_286005 ?auto_286009 ) ) ( not ( = ?auto_286001 ?auto_286009 ) ) ( not ( = ?auto_286008 ?auto_286011 ) ) ( not ( = ?auto_286015 ?auto_286010 ) ) ( not ( = ?auto_286015 ?auto_286014 ) ) ( not ( = ?auto_286015 ?auto_286013 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_286003 ?auto_286002 ?auto_286006 ?auto_286007 ?auto_286004 ?auto_286005 ?auto_286008 ?auto_286009 ?auto_286000 ?auto_286001 )
      ( GET-5IMAGE-VERIFY ?auto_286000 ?auto_286001 ?auto_286003 ?auto_286002 ?auto_286004 ?auto_286005 ?auto_286006 ?auto_286007 ?auto_286008 ?auto_286009 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_286078 - DIRECTION
      ?auto_286079 - MODE
      ?auto_286081 - DIRECTION
      ?auto_286080 - MODE
      ?auto_286082 - DIRECTION
      ?auto_286083 - MODE
      ?auto_286084 - DIRECTION
      ?auto_286085 - MODE
      ?auto_286086 - DIRECTION
      ?auto_286087 - MODE
    )
    :vars
    (
      ?auto_286093 - INSTRUMENT
      ?auto_286095 - SATELLITE
      ?auto_286090 - DIRECTION
      ?auto_286094 - INSTRUMENT
      ?auto_286088 - INSTRUMENT
      ?auto_286092 - INSTRUMENT
      ?auto_286091 - INSTRUMENT
      ?auto_286089 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_286093 ?auto_286095 ) ( SUPPORTS ?auto_286093 ?auto_286085 ) ( not ( = ?auto_286084 ?auto_286090 ) ) ( CALIBRATION_TARGET ?auto_286093 ?auto_286090 ) ( not ( = ?auto_286090 ?auto_286078 ) ) ( ON_BOARD ?auto_286094 ?auto_286095 ) ( not ( = ?auto_286084 ?auto_286078 ) ) ( not ( = ?auto_286093 ?auto_286094 ) ) ( SUPPORTS ?auto_286094 ?auto_286079 ) ( CALIBRATION_TARGET ?auto_286094 ?auto_286090 ) ( not ( = ?auto_286090 ?auto_286082 ) ) ( ON_BOARD ?auto_286088 ?auto_286095 ) ( not ( = ?auto_286078 ?auto_286082 ) ) ( not ( = ?auto_286094 ?auto_286088 ) ) ( SUPPORTS ?auto_286088 ?auto_286083 ) ( CALIBRATION_TARGET ?auto_286088 ?auto_286090 ) ( not ( = ?auto_286090 ?auto_286086 ) ) ( ON_BOARD ?auto_286092 ?auto_286095 ) ( not ( = ?auto_286082 ?auto_286086 ) ) ( not ( = ?auto_286088 ?auto_286092 ) ) ( SUPPORTS ?auto_286092 ?auto_286087 ) ( CALIBRATION_TARGET ?auto_286092 ?auto_286090 ) ( not ( = ?auto_286090 ?auto_286081 ) ) ( ON_BOARD ?auto_286091 ?auto_286095 ) ( not ( = ?auto_286086 ?auto_286081 ) ) ( not ( = ?auto_286092 ?auto_286091 ) ) ( SUPPORTS ?auto_286091 ?auto_286080 ) ( CALIBRATION_TARGET ?auto_286091 ?auto_286090 ) ( POWER_AVAIL ?auto_286095 ) ( POINTING ?auto_286095 ?auto_286089 ) ( not ( = ?auto_286090 ?auto_286089 ) ) ( not ( = ?auto_286081 ?auto_286089 ) ) ( not ( = ?auto_286080 ?auto_286087 ) ) ( not ( = ?auto_286086 ?auto_286089 ) ) ( not ( = ?auto_286081 ?auto_286082 ) ) ( not ( = ?auto_286080 ?auto_286083 ) ) ( not ( = ?auto_286087 ?auto_286083 ) ) ( not ( = ?auto_286082 ?auto_286089 ) ) ( not ( = ?auto_286088 ?auto_286091 ) ) ( not ( = ?auto_286081 ?auto_286078 ) ) ( not ( = ?auto_286080 ?auto_286079 ) ) ( not ( = ?auto_286086 ?auto_286078 ) ) ( not ( = ?auto_286087 ?auto_286079 ) ) ( not ( = ?auto_286083 ?auto_286079 ) ) ( not ( = ?auto_286078 ?auto_286089 ) ) ( not ( = ?auto_286094 ?auto_286092 ) ) ( not ( = ?auto_286094 ?auto_286091 ) ) ( not ( = ?auto_286081 ?auto_286084 ) ) ( not ( = ?auto_286080 ?auto_286085 ) ) ( not ( = ?auto_286086 ?auto_286084 ) ) ( not ( = ?auto_286087 ?auto_286085 ) ) ( not ( = ?auto_286082 ?auto_286084 ) ) ( not ( = ?auto_286083 ?auto_286085 ) ) ( not ( = ?auto_286079 ?auto_286085 ) ) ( not ( = ?auto_286084 ?auto_286089 ) ) ( not ( = ?auto_286093 ?auto_286088 ) ) ( not ( = ?auto_286093 ?auto_286092 ) ) ( not ( = ?auto_286093 ?auto_286091 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_286081 ?auto_286080 ?auto_286086 ?auto_286087 ?auto_286082 ?auto_286083 ?auto_286084 ?auto_286085 ?auto_286078 ?auto_286079 )
      ( GET-5IMAGE-VERIFY ?auto_286078 ?auto_286079 ?auto_286081 ?auto_286080 ?auto_286082 ?auto_286083 ?auto_286084 ?auto_286085 ?auto_286086 ?auto_286087 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_286492 - DIRECTION
      ?auto_286493 - MODE
      ?auto_286495 - DIRECTION
      ?auto_286494 - MODE
      ?auto_286496 - DIRECTION
      ?auto_286497 - MODE
      ?auto_286498 - DIRECTION
      ?auto_286499 - MODE
      ?auto_286500 - DIRECTION
      ?auto_286501 - MODE
    )
    :vars
    (
      ?auto_286507 - INSTRUMENT
      ?auto_286509 - SATELLITE
      ?auto_286504 - DIRECTION
      ?auto_286508 - INSTRUMENT
      ?auto_286502 - INSTRUMENT
      ?auto_286506 - INSTRUMENT
      ?auto_286505 - INSTRUMENT
      ?auto_286503 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_286507 ?auto_286509 ) ( SUPPORTS ?auto_286507 ?auto_286497 ) ( not ( = ?auto_286496 ?auto_286504 ) ) ( CALIBRATION_TARGET ?auto_286507 ?auto_286504 ) ( not ( = ?auto_286504 ?auto_286492 ) ) ( ON_BOARD ?auto_286508 ?auto_286509 ) ( not ( = ?auto_286496 ?auto_286492 ) ) ( not ( = ?auto_286507 ?auto_286508 ) ) ( SUPPORTS ?auto_286508 ?auto_286493 ) ( CALIBRATION_TARGET ?auto_286508 ?auto_286504 ) ( not ( = ?auto_286504 ?auto_286500 ) ) ( ON_BOARD ?auto_286502 ?auto_286509 ) ( not ( = ?auto_286492 ?auto_286500 ) ) ( not ( = ?auto_286508 ?auto_286502 ) ) ( SUPPORTS ?auto_286502 ?auto_286501 ) ( CALIBRATION_TARGET ?auto_286502 ?auto_286504 ) ( not ( = ?auto_286504 ?auto_286498 ) ) ( ON_BOARD ?auto_286506 ?auto_286509 ) ( not ( = ?auto_286500 ?auto_286498 ) ) ( not ( = ?auto_286502 ?auto_286506 ) ) ( SUPPORTS ?auto_286506 ?auto_286499 ) ( CALIBRATION_TARGET ?auto_286506 ?auto_286504 ) ( not ( = ?auto_286504 ?auto_286495 ) ) ( ON_BOARD ?auto_286505 ?auto_286509 ) ( not ( = ?auto_286498 ?auto_286495 ) ) ( not ( = ?auto_286506 ?auto_286505 ) ) ( SUPPORTS ?auto_286505 ?auto_286494 ) ( CALIBRATION_TARGET ?auto_286505 ?auto_286504 ) ( POWER_AVAIL ?auto_286509 ) ( POINTING ?auto_286509 ?auto_286503 ) ( not ( = ?auto_286504 ?auto_286503 ) ) ( not ( = ?auto_286495 ?auto_286503 ) ) ( not ( = ?auto_286494 ?auto_286499 ) ) ( not ( = ?auto_286498 ?auto_286503 ) ) ( not ( = ?auto_286495 ?auto_286500 ) ) ( not ( = ?auto_286494 ?auto_286501 ) ) ( not ( = ?auto_286499 ?auto_286501 ) ) ( not ( = ?auto_286500 ?auto_286503 ) ) ( not ( = ?auto_286502 ?auto_286505 ) ) ( not ( = ?auto_286495 ?auto_286492 ) ) ( not ( = ?auto_286494 ?auto_286493 ) ) ( not ( = ?auto_286498 ?auto_286492 ) ) ( not ( = ?auto_286499 ?auto_286493 ) ) ( not ( = ?auto_286501 ?auto_286493 ) ) ( not ( = ?auto_286492 ?auto_286503 ) ) ( not ( = ?auto_286508 ?auto_286506 ) ) ( not ( = ?auto_286508 ?auto_286505 ) ) ( not ( = ?auto_286495 ?auto_286496 ) ) ( not ( = ?auto_286494 ?auto_286497 ) ) ( not ( = ?auto_286498 ?auto_286496 ) ) ( not ( = ?auto_286499 ?auto_286497 ) ) ( not ( = ?auto_286500 ?auto_286496 ) ) ( not ( = ?auto_286501 ?auto_286497 ) ) ( not ( = ?auto_286493 ?auto_286497 ) ) ( not ( = ?auto_286496 ?auto_286503 ) ) ( not ( = ?auto_286507 ?auto_286502 ) ) ( not ( = ?auto_286507 ?auto_286506 ) ) ( not ( = ?auto_286507 ?auto_286505 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_286495 ?auto_286494 ?auto_286498 ?auto_286499 ?auto_286500 ?auto_286501 ?auto_286496 ?auto_286497 ?auto_286492 ?auto_286493 )
      ( GET-5IMAGE-VERIFY ?auto_286492 ?auto_286493 ?auto_286495 ?auto_286494 ?auto_286496 ?auto_286497 ?auto_286498 ?auto_286499 ?auto_286500 ?auto_286501 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_286570 - DIRECTION
      ?auto_286571 - MODE
      ?auto_286573 - DIRECTION
      ?auto_286572 - MODE
      ?auto_286574 - DIRECTION
      ?auto_286575 - MODE
      ?auto_286576 - DIRECTION
      ?auto_286577 - MODE
      ?auto_286578 - DIRECTION
      ?auto_286579 - MODE
    )
    :vars
    (
      ?auto_286585 - INSTRUMENT
      ?auto_286587 - SATELLITE
      ?auto_286582 - DIRECTION
      ?auto_286586 - INSTRUMENT
      ?auto_286580 - INSTRUMENT
      ?auto_286584 - INSTRUMENT
      ?auto_286583 - INSTRUMENT
      ?auto_286581 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_286585 ?auto_286587 ) ( SUPPORTS ?auto_286585 ?auto_286575 ) ( not ( = ?auto_286574 ?auto_286582 ) ) ( CALIBRATION_TARGET ?auto_286585 ?auto_286582 ) ( not ( = ?auto_286582 ?auto_286570 ) ) ( ON_BOARD ?auto_286586 ?auto_286587 ) ( not ( = ?auto_286574 ?auto_286570 ) ) ( not ( = ?auto_286585 ?auto_286586 ) ) ( SUPPORTS ?auto_286586 ?auto_286571 ) ( CALIBRATION_TARGET ?auto_286586 ?auto_286582 ) ( not ( = ?auto_286582 ?auto_286576 ) ) ( ON_BOARD ?auto_286580 ?auto_286587 ) ( not ( = ?auto_286570 ?auto_286576 ) ) ( not ( = ?auto_286586 ?auto_286580 ) ) ( SUPPORTS ?auto_286580 ?auto_286577 ) ( CALIBRATION_TARGET ?auto_286580 ?auto_286582 ) ( not ( = ?auto_286582 ?auto_286578 ) ) ( ON_BOARD ?auto_286584 ?auto_286587 ) ( not ( = ?auto_286576 ?auto_286578 ) ) ( not ( = ?auto_286580 ?auto_286584 ) ) ( SUPPORTS ?auto_286584 ?auto_286579 ) ( CALIBRATION_TARGET ?auto_286584 ?auto_286582 ) ( not ( = ?auto_286582 ?auto_286573 ) ) ( ON_BOARD ?auto_286583 ?auto_286587 ) ( not ( = ?auto_286578 ?auto_286573 ) ) ( not ( = ?auto_286584 ?auto_286583 ) ) ( SUPPORTS ?auto_286583 ?auto_286572 ) ( CALIBRATION_TARGET ?auto_286583 ?auto_286582 ) ( POWER_AVAIL ?auto_286587 ) ( POINTING ?auto_286587 ?auto_286581 ) ( not ( = ?auto_286582 ?auto_286581 ) ) ( not ( = ?auto_286573 ?auto_286581 ) ) ( not ( = ?auto_286572 ?auto_286579 ) ) ( not ( = ?auto_286578 ?auto_286581 ) ) ( not ( = ?auto_286573 ?auto_286576 ) ) ( not ( = ?auto_286572 ?auto_286577 ) ) ( not ( = ?auto_286579 ?auto_286577 ) ) ( not ( = ?auto_286576 ?auto_286581 ) ) ( not ( = ?auto_286580 ?auto_286583 ) ) ( not ( = ?auto_286573 ?auto_286570 ) ) ( not ( = ?auto_286572 ?auto_286571 ) ) ( not ( = ?auto_286578 ?auto_286570 ) ) ( not ( = ?auto_286579 ?auto_286571 ) ) ( not ( = ?auto_286577 ?auto_286571 ) ) ( not ( = ?auto_286570 ?auto_286581 ) ) ( not ( = ?auto_286586 ?auto_286584 ) ) ( not ( = ?auto_286586 ?auto_286583 ) ) ( not ( = ?auto_286573 ?auto_286574 ) ) ( not ( = ?auto_286572 ?auto_286575 ) ) ( not ( = ?auto_286578 ?auto_286574 ) ) ( not ( = ?auto_286579 ?auto_286575 ) ) ( not ( = ?auto_286576 ?auto_286574 ) ) ( not ( = ?auto_286577 ?auto_286575 ) ) ( not ( = ?auto_286571 ?auto_286575 ) ) ( not ( = ?auto_286574 ?auto_286581 ) ) ( not ( = ?auto_286585 ?auto_286580 ) ) ( not ( = ?auto_286585 ?auto_286584 ) ) ( not ( = ?auto_286585 ?auto_286583 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_286573 ?auto_286572 ?auto_286578 ?auto_286579 ?auto_286576 ?auto_286577 ?auto_286574 ?auto_286575 ?auto_286570 ?auto_286571 )
      ( GET-5IMAGE-VERIFY ?auto_286570 ?auto_286571 ?auto_286573 ?auto_286572 ?auto_286574 ?auto_286575 ?auto_286576 ?auto_286577 ?auto_286578 ?auto_286579 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_286900 - DIRECTION
      ?auto_286901 - MODE
      ?auto_286903 - DIRECTION
      ?auto_286902 - MODE
      ?auto_286904 - DIRECTION
      ?auto_286905 - MODE
      ?auto_286906 - DIRECTION
      ?auto_286907 - MODE
      ?auto_286908 - DIRECTION
      ?auto_286909 - MODE
    )
    :vars
    (
      ?auto_286915 - INSTRUMENT
      ?auto_286917 - SATELLITE
      ?auto_286912 - DIRECTION
      ?auto_286916 - INSTRUMENT
      ?auto_286910 - INSTRUMENT
      ?auto_286914 - INSTRUMENT
      ?auto_286913 - INSTRUMENT
      ?auto_286911 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_286915 ?auto_286917 ) ( SUPPORTS ?auto_286915 ?auto_286909 ) ( not ( = ?auto_286908 ?auto_286912 ) ) ( CALIBRATION_TARGET ?auto_286915 ?auto_286912 ) ( not ( = ?auto_286912 ?auto_286900 ) ) ( ON_BOARD ?auto_286916 ?auto_286917 ) ( not ( = ?auto_286908 ?auto_286900 ) ) ( not ( = ?auto_286915 ?auto_286916 ) ) ( SUPPORTS ?auto_286916 ?auto_286901 ) ( CALIBRATION_TARGET ?auto_286916 ?auto_286912 ) ( not ( = ?auto_286912 ?auto_286906 ) ) ( ON_BOARD ?auto_286910 ?auto_286917 ) ( not ( = ?auto_286900 ?auto_286906 ) ) ( not ( = ?auto_286916 ?auto_286910 ) ) ( SUPPORTS ?auto_286910 ?auto_286907 ) ( CALIBRATION_TARGET ?auto_286910 ?auto_286912 ) ( not ( = ?auto_286912 ?auto_286903 ) ) ( ON_BOARD ?auto_286914 ?auto_286917 ) ( not ( = ?auto_286906 ?auto_286903 ) ) ( not ( = ?auto_286910 ?auto_286914 ) ) ( SUPPORTS ?auto_286914 ?auto_286902 ) ( CALIBRATION_TARGET ?auto_286914 ?auto_286912 ) ( not ( = ?auto_286912 ?auto_286904 ) ) ( ON_BOARD ?auto_286913 ?auto_286917 ) ( not ( = ?auto_286903 ?auto_286904 ) ) ( not ( = ?auto_286914 ?auto_286913 ) ) ( SUPPORTS ?auto_286913 ?auto_286905 ) ( CALIBRATION_TARGET ?auto_286913 ?auto_286912 ) ( POWER_AVAIL ?auto_286917 ) ( POINTING ?auto_286917 ?auto_286911 ) ( not ( = ?auto_286912 ?auto_286911 ) ) ( not ( = ?auto_286904 ?auto_286911 ) ) ( not ( = ?auto_286905 ?auto_286902 ) ) ( not ( = ?auto_286903 ?auto_286911 ) ) ( not ( = ?auto_286904 ?auto_286906 ) ) ( not ( = ?auto_286905 ?auto_286907 ) ) ( not ( = ?auto_286902 ?auto_286907 ) ) ( not ( = ?auto_286906 ?auto_286911 ) ) ( not ( = ?auto_286910 ?auto_286913 ) ) ( not ( = ?auto_286904 ?auto_286900 ) ) ( not ( = ?auto_286905 ?auto_286901 ) ) ( not ( = ?auto_286903 ?auto_286900 ) ) ( not ( = ?auto_286902 ?auto_286901 ) ) ( not ( = ?auto_286907 ?auto_286901 ) ) ( not ( = ?auto_286900 ?auto_286911 ) ) ( not ( = ?auto_286916 ?auto_286914 ) ) ( not ( = ?auto_286916 ?auto_286913 ) ) ( not ( = ?auto_286904 ?auto_286908 ) ) ( not ( = ?auto_286905 ?auto_286909 ) ) ( not ( = ?auto_286903 ?auto_286908 ) ) ( not ( = ?auto_286902 ?auto_286909 ) ) ( not ( = ?auto_286906 ?auto_286908 ) ) ( not ( = ?auto_286907 ?auto_286909 ) ) ( not ( = ?auto_286901 ?auto_286909 ) ) ( not ( = ?auto_286908 ?auto_286911 ) ) ( not ( = ?auto_286915 ?auto_286910 ) ) ( not ( = ?auto_286915 ?auto_286914 ) ) ( not ( = ?auto_286915 ?auto_286913 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_286904 ?auto_286905 ?auto_286903 ?auto_286902 ?auto_286906 ?auto_286907 ?auto_286908 ?auto_286909 ?auto_286900 ?auto_286901 )
      ( GET-5IMAGE-VERIFY ?auto_286900 ?auto_286901 ?auto_286903 ?auto_286902 ?auto_286904 ?auto_286905 ?auto_286906 ?auto_286907 ?auto_286908 ?auto_286909 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_286978 - DIRECTION
      ?auto_286979 - MODE
      ?auto_286981 - DIRECTION
      ?auto_286980 - MODE
      ?auto_286982 - DIRECTION
      ?auto_286983 - MODE
      ?auto_286984 - DIRECTION
      ?auto_286985 - MODE
      ?auto_286986 - DIRECTION
      ?auto_286987 - MODE
    )
    :vars
    (
      ?auto_286993 - INSTRUMENT
      ?auto_286995 - SATELLITE
      ?auto_286990 - DIRECTION
      ?auto_286994 - INSTRUMENT
      ?auto_286988 - INSTRUMENT
      ?auto_286992 - INSTRUMENT
      ?auto_286991 - INSTRUMENT
      ?auto_286989 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_286993 ?auto_286995 ) ( SUPPORTS ?auto_286993 ?auto_286985 ) ( not ( = ?auto_286984 ?auto_286990 ) ) ( CALIBRATION_TARGET ?auto_286993 ?auto_286990 ) ( not ( = ?auto_286990 ?auto_286978 ) ) ( ON_BOARD ?auto_286994 ?auto_286995 ) ( not ( = ?auto_286984 ?auto_286978 ) ) ( not ( = ?auto_286993 ?auto_286994 ) ) ( SUPPORTS ?auto_286994 ?auto_286979 ) ( CALIBRATION_TARGET ?auto_286994 ?auto_286990 ) ( not ( = ?auto_286990 ?auto_286986 ) ) ( ON_BOARD ?auto_286988 ?auto_286995 ) ( not ( = ?auto_286978 ?auto_286986 ) ) ( not ( = ?auto_286994 ?auto_286988 ) ) ( SUPPORTS ?auto_286988 ?auto_286987 ) ( CALIBRATION_TARGET ?auto_286988 ?auto_286990 ) ( not ( = ?auto_286990 ?auto_286981 ) ) ( ON_BOARD ?auto_286992 ?auto_286995 ) ( not ( = ?auto_286986 ?auto_286981 ) ) ( not ( = ?auto_286988 ?auto_286992 ) ) ( SUPPORTS ?auto_286992 ?auto_286980 ) ( CALIBRATION_TARGET ?auto_286992 ?auto_286990 ) ( not ( = ?auto_286990 ?auto_286982 ) ) ( ON_BOARD ?auto_286991 ?auto_286995 ) ( not ( = ?auto_286981 ?auto_286982 ) ) ( not ( = ?auto_286992 ?auto_286991 ) ) ( SUPPORTS ?auto_286991 ?auto_286983 ) ( CALIBRATION_TARGET ?auto_286991 ?auto_286990 ) ( POWER_AVAIL ?auto_286995 ) ( POINTING ?auto_286995 ?auto_286989 ) ( not ( = ?auto_286990 ?auto_286989 ) ) ( not ( = ?auto_286982 ?auto_286989 ) ) ( not ( = ?auto_286983 ?auto_286980 ) ) ( not ( = ?auto_286981 ?auto_286989 ) ) ( not ( = ?auto_286982 ?auto_286986 ) ) ( not ( = ?auto_286983 ?auto_286987 ) ) ( not ( = ?auto_286980 ?auto_286987 ) ) ( not ( = ?auto_286986 ?auto_286989 ) ) ( not ( = ?auto_286988 ?auto_286991 ) ) ( not ( = ?auto_286982 ?auto_286978 ) ) ( not ( = ?auto_286983 ?auto_286979 ) ) ( not ( = ?auto_286981 ?auto_286978 ) ) ( not ( = ?auto_286980 ?auto_286979 ) ) ( not ( = ?auto_286987 ?auto_286979 ) ) ( not ( = ?auto_286978 ?auto_286989 ) ) ( not ( = ?auto_286994 ?auto_286992 ) ) ( not ( = ?auto_286994 ?auto_286991 ) ) ( not ( = ?auto_286982 ?auto_286984 ) ) ( not ( = ?auto_286983 ?auto_286985 ) ) ( not ( = ?auto_286981 ?auto_286984 ) ) ( not ( = ?auto_286980 ?auto_286985 ) ) ( not ( = ?auto_286986 ?auto_286984 ) ) ( not ( = ?auto_286987 ?auto_286985 ) ) ( not ( = ?auto_286979 ?auto_286985 ) ) ( not ( = ?auto_286984 ?auto_286989 ) ) ( not ( = ?auto_286993 ?auto_286988 ) ) ( not ( = ?auto_286993 ?auto_286992 ) ) ( not ( = ?auto_286993 ?auto_286991 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_286982 ?auto_286983 ?auto_286981 ?auto_286980 ?auto_286986 ?auto_286987 ?auto_286984 ?auto_286985 ?auto_286978 ?auto_286979 )
      ( GET-5IMAGE-VERIFY ?auto_286978 ?auto_286979 ?auto_286981 ?auto_286980 ?auto_286982 ?auto_286983 ?auto_286984 ?auto_286985 ?auto_286986 ?auto_286987 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_287226 - DIRECTION
      ?auto_287227 - MODE
      ?auto_287229 - DIRECTION
      ?auto_287228 - MODE
      ?auto_287230 - DIRECTION
      ?auto_287231 - MODE
      ?auto_287232 - DIRECTION
      ?auto_287233 - MODE
      ?auto_287234 - DIRECTION
      ?auto_287235 - MODE
    )
    :vars
    (
      ?auto_287241 - INSTRUMENT
      ?auto_287243 - SATELLITE
      ?auto_287238 - DIRECTION
      ?auto_287242 - INSTRUMENT
      ?auto_287236 - INSTRUMENT
      ?auto_287240 - INSTRUMENT
      ?auto_287239 - INSTRUMENT
      ?auto_287237 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_287241 ?auto_287243 ) ( SUPPORTS ?auto_287241 ?auto_287235 ) ( not ( = ?auto_287234 ?auto_287238 ) ) ( CALIBRATION_TARGET ?auto_287241 ?auto_287238 ) ( not ( = ?auto_287238 ?auto_287226 ) ) ( ON_BOARD ?auto_287242 ?auto_287243 ) ( not ( = ?auto_287234 ?auto_287226 ) ) ( not ( = ?auto_287241 ?auto_287242 ) ) ( SUPPORTS ?auto_287242 ?auto_287227 ) ( CALIBRATION_TARGET ?auto_287242 ?auto_287238 ) ( not ( = ?auto_287238 ?auto_287230 ) ) ( ON_BOARD ?auto_287236 ?auto_287243 ) ( not ( = ?auto_287226 ?auto_287230 ) ) ( not ( = ?auto_287242 ?auto_287236 ) ) ( SUPPORTS ?auto_287236 ?auto_287231 ) ( CALIBRATION_TARGET ?auto_287236 ?auto_287238 ) ( not ( = ?auto_287238 ?auto_287229 ) ) ( ON_BOARD ?auto_287240 ?auto_287243 ) ( not ( = ?auto_287230 ?auto_287229 ) ) ( not ( = ?auto_287236 ?auto_287240 ) ) ( SUPPORTS ?auto_287240 ?auto_287228 ) ( CALIBRATION_TARGET ?auto_287240 ?auto_287238 ) ( not ( = ?auto_287238 ?auto_287232 ) ) ( ON_BOARD ?auto_287239 ?auto_287243 ) ( not ( = ?auto_287229 ?auto_287232 ) ) ( not ( = ?auto_287240 ?auto_287239 ) ) ( SUPPORTS ?auto_287239 ?auto_287233 ) ( CALIBRATION_TARGET ?auto_287239 ?auto_287238 ) ( POWER_AVAIL ?auto_287243 ) ( POINTING ?auto_287243 ?auto_287237 ) ( not ( = ?auto_287238 ?auto_287237 ) ) ( not ( = ?auto_287232 ?auto_287237 ) ) ( not ( = ?auto_287233 ?auto_287228 ) ) ( not ( = ?auto_287229 ?auto_287237 ) ) ( not ( = ?auto_287232 ?auto_287230 ) ) ( not ( = ?auto_287233 ?auto_287231 ) ) ( not ( = ?auto_287228 ?auto_287231 ) ) ( not ( = ?auto_287230 ?auto_287237 ) ) ( not ( = ?auto_287236 ?auto_287239 ) ) ( not ( = ?auto_287232 ?auto_287226 ) ) ( not ( = ?auto_287233 ?auto_287227 ) ) ( not ( = ?auto_287229 ?auto_287226 ) ) ( not ( = ?auto_287228 ?auto_287227 ) ) ( not ( = ?auto_287231 ?auto_287227 ) ) ( not ( = ?auto_287226 ?auto_287237 ) ) ( not ( = ?auto_287242 ?auto_287240 ) ) ( not ( = ?auto_287242 ?auto_287239 ) ) ( not ( = ?auto_287232 ?auto_287234 ) ) ( not ( = ?auto_287233 ?auto_287235 ) ) ( not ( = ?auto_287229 ?auto_287234 ) ) ( not ( = ?auto_287228 ?auto_287235 ) ) ( not ( = ?auto_287230 ?auto_287234 ) ) ( not ( = ?auto_287231 ?auto_287235 ) ) ( not ( = ?auto_287227 ?auto_287235 ) ) ( not ( = ?auto_287234 ?auto_287237 ) ) ( not ( = ?auto_287241 ?auto_287236 ) ) ( not ( = ?auto_287241 ?auto_287240 ) ) ( not ( = ?auto_287241 ?auto_287239 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_287232 ?auto_287233 ?auto_287229 ?auto_287228 ?auto_287230 ?auto_287231 ?auto_287234 ?auto_287235 ?auto_287226 ?auto_287227 )
      ( GET-5IMAGE-VERIFY ?auto_287226 ?auto_287227 ?auto_287229 ?auto_287228 ?auto_287230 ?auto_287231 ?auto_287232 ?auto_287233 ?auto_287234 ?auto_287235 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_287304 - DIRECTION
      ?auto_287305 - MODE
      ?auto_287307 - DIRECTION
      ?auto_287306 - MODE
      ?auto_287308 - DIRECTION
      ?auto_287309 - MODE
      ?auto_287310 - DIRECTION
      ?auto_287311 - MODE
      ?auto_287312 - DIRECTION
      ?auto_287313 - MODE
    )
    :vars
    (
      ?auto_287319 - INSTRUMENT
      ?auto_287321 - SATELLITE
      ?auto_287316 - DIRECTION
      ?auto_287320 - INSTRUMENT
      ?auto_287314 - INSTRUMENT
      ?auto_287318 - INSTRUMENT
      ?auto_287317 - INSTRUMENT
      ?auto_287315 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_287319 ?auto_287321 ) ( SUPPORTS ?auto_287319 ?auto_287311 ) ( not ( = ?auto_287310 ?auto_287316 ) ) ( CALIBRATION_TARGET ?auto_287319 ?auto_287316 ) ( not ( = ?auto_287316 ?auto_287304 ) ) ( ON_BOARD ?auto_287320 ?auto_287321 ) ( not ( = ?auto_287310 ?auto_287304 ) ) ( not ( = ?auto_287319 ?auto_287320 ) ) ( SUPPORTS ?auto_287320 ?auto_287305 ) ( CALIBRATION_TARGET ?auto_287320 ?auto_287316 ) ( not ( = ?auto_287316 ?auto_287308 ) ) ( ON_BOARD ?auto_287314 ?auto_287321 ) ( not ( = ?auto_287304 ?auto_287308 ) ) ( not ( = ?auto_287320 ?auto_287314 ) ) ( SUPPORTS ?auto_287314 ?auto_287309 ) ( CALIBRATION_TARGET ?auto_287314 ?auto_287316 ) ( not ( = ?auto_287316 ?auto_287307 ) ) ( ON_BOARD ?auto_287318 ?auto_287321 ) ( not ( = ?auto_287308 ?auto_287307 ) ) ( not ( = ?auto_287314 ?auto_287318 ) ) ( SUPPORTS ?auto_287318 ?auto_287306 ) ( CALIBRATION_TARGET ?auto_287318 ?auto_287316 ) ( not ( = ?auto_287316 ?auto_287312 ) ) ( ON_BOARD ?auto_287317 ?auto_287321 ) ( not ( = ?auto_287307 ?auto_287312 ) ) ( not ( = ?auto_287318 ?auto_287317 ) ) ( SUPPORTS ?auto_287317 ?auto_287313 ) ( CALIBRATION_TARGET ?auto_287317 ?auto_287316 ) ( POWER_AVAIL ?auto_287321 ) ( POINTING ?auto_287321 ?auto_287315 ) ( not ( = ?auto_287316 ?auto_287315 ) ) ( not ( = ?auto_287312 ?auto_287315 ) ) ( not ( = ?auto_287313 ?auto_287306 ) ) ( not ( = ?auto_287307 ?auto_287315 ) ) ( not ( = ?auto_287312 ?auto_287308 ) ) ( not ( = ?auto_287313 ?auto_287309 ) ) ( not ( = ?auto_287306 ?auto_287309 ) ) ( not ( = ?auto_287308 ?auto_287315 ) ) ( not ( = ?auto_287314 ?auto_287317 ) ) ( not ( = ?auto_287312 ?auto_287304 ) ) ( not ( = ?auto_287313 ?auto_287305 ) ) ( not ( = ?auto_287307 ?auto_287304 ) ) ( not ( = ?auto_287306 ?auto_287305 ) ) ( not ( = ?auto_287309 ?auto_287305 ) ) ( not ( = ?auto_287304 ?auto_287315 ) ) ( not ( = ?auto_287320 ?auto_287318 ) ) ( not ( = ?auto_287320 ?auto_287317 ) ) ( not ( = ?auto_287312 ?auto_287310 ) ) ( not ( = ?auto_287313 ?auto_287311 ) ) ( not ( = ?auto_287307 ?auto_287310 ) ) ( not ( = ?auto_287306 ?auto_287311 ) ) ( not ( = ?auto_287308 ?auto_287310 ) ) ( not ( = ?auto_287309 ?auto_287311 ) ) ( not ( = ?auto_287305 ?auto_287311 ) ) ( not ( = ?auto_287310 ?auto_287315 ) ) ( not ( = ?auto_287319 ?auto_287314 ) ) ( not ( = ?auto_287319 ?auto_287318 ) ) ( not ( = ?auto_287319 ?auto_287317 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_287312 ?auto_287313 ?auto_287307 ?auto_287306 ?auto_287308 ?auto_287309 ?auto_287310 ?auto_287311 ?auto_287304 ?auto_287305 )
      ( GET-5IMAGE-VERIFY ?auto_287304 ?auto_287305 ?auto_287307 ?auto_287306 ?auto_287308 ?auto_287309 ?auto_287310 ?auto_287311 ?auto_287312 ?auto_287313 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_287632 - DIRECTION
      ?auto_287633 - MODE
      ?auto_287635 - DIRECTION
      ?auto_287634 - MODE
      ?auto_287636 - DIRECTION
      ?auto_287637 - MODE
      ?auto_287638 - DIRECTION
      ?auto_287639 - MODE
      ?auto_287640 - DIRECTION
      ?auto_287641 - MODE
    )
    :vars
    (
      ?auto_287647 - INSTRUMENT
      ?auto_287649 - SATELLITE
      ?auto_287644 - DIRECTION
      ?auto_287648 - INSTRUMENT
      ?auto_287642 - INSTRUMENT
      ?auto_287646 - INSTRUMENT
      ?auto_287645 - INSTRUMENT
      ?auto_287643 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_287647 ?auto_287649 ) ( SUPPORTS ?auto_287647 ?auto_287637 ) ( not ( = ?auto_287636 ?auto_287644 ) ) ( CALIBRATION_TARGET ?auto_287647 ?auto_287644 ) ( not ( = ?auto_287644 ?auto_287632 ) ) ( ON_BOARD ?auto_287648 ?auto_287649 ) ( not ( = ?auto_287636 ?auto_287632 ) ) ( not ( = ?auto_287647 ?auto_287648 ) ) ( SUPPORTS ?auto_287648 ?auto_287633 ) ( CALIBRATION_TARGET ?auto_287648 ?auto_287644 ) ( not ( = ?auto_287644 ?auto_287640 ) ) ( ON_BOARD ?auto_287642 ?auto_287649 ) ( not ( = ?auto_287632 ?auto_287640 ) ) ( not ( = ?auto_287648 ?auto_287642 ) ) ( SUPPORTS ?auto_287642 ?auto_287641 ) ( CALIBRATION_TARGET ?auto_287642 ?auto_287644 ) ( not ( = ?auto_287644 ?auto_287635 ) ) ( ON_BOARD ?auto_287646 ?auto_287649 ) ( not ( = ?auto_287640 ?auto_287635 ) ) ( not ( = ?auto_287642 ?auto_287646 ) ) ( SUPPORTS ?auto_287646 ?auto_287634 ) ( CALIBRATION_TARGET ?auto_287646 ?auto_287644 ) ( not ( = ?auto_287644 ?auto_287638 ) ) ( ON_BOARD ?auto_287645 ?auto_287649 ) ( not ( = ?auto_287635 ?auto_287638 ) ) ( not ( = ?auto_287646 ?auto_287645 ) ) ( SUPPORTS ?auto_287645 ?auto_287639 ) ( CALIBRATION_TARGET ?auto_287645 ?auto_287644 ) ( POWER_AVAIL ?auto_287649 ) ( POINTING ?auto_287649 ?auto_287643 ) ( not ( = ?auto_287644 ?auto_287643 ) ) ( not ( = ?auto_287638 ?auto_287643 ) ) ( not ( = ?auto_287639 ?auto_287634 ) ) ( not ( = ?auto_287635 ?auto_287643 ) ) ( not ( = ?auto_287638 ?auto_287640 ) ) ( not ( = ?auto_287639 ?auto_287641 ) ) ( not ( = ?auto_287634 ?auto_287641 ) ) ( not ( = ?auto_287640 ?auto_287643 ) ) ( not ( = ?auto_287642 ?auto_287645 ) ) ( not ( = ?auto_287638 ?auto_287632 ) ) ( not ( = ?auto_287639 ?auto_287633 ) ) ( not ( = ?auto_287635 ?auto_287632 ) ) ( not ( = ?auto_287634 ?auto_287633 ) ) ( not ( = ?auto_287641 ?auto_287633 ) ) ( not ( = ?auto_287632 ?auto_287643 ) ) ( not ( = ?auto_287648 ?auto_287646 ) ) ( not ( = ?auto_287648 ?auto_287645 ) ) ( not ( = ?auto_287638 ?auto_287636 ) ) ( not ( = ?auto_287639 ?auto_287637 ) ) ( not ( = ?auto_287635 ?auto_287636 ) ) ( not ( = ?auto_287634 ?auto_287637 ) ) ( not ( = ?auto_287640 ?auto_287636 ) ) ( not ( = ?auto_287641 ?auto_287637 ) ) ( not ( = ?auto_287633 ?auto_287637 ) ) ( not ( = ?auto_287636 ?auto_287643 ) ) ( not ( = ?auto_287647 ?auto_287642 ) ) ( not ( = ?auto_287647 ?auto_287646 ) ) ( not ( = ?auto_287647 ?auto_287645 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_287638 ?auto_287639 ?auto_287635 ?auto_287634 ?auto_287640 ?auto_287641 ?auto_287636 ?auto_287637 ?auto_287632 ?auto_287633 )
      ( GET-5IMAGE-VERIFY ?auto_287632 ?auto_287633 ?auto_287635 ?auto_287634 ?auto_287636 ?auto_287637 ?auto_287638 ?auto_287639 ?auto_287640 ?auto_287641 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_287796 - DIRECTION
      ?auto_287797 - MODE
      ?auto_287799 - DIRECTION
      ?auto_287798 - MODE
      ?auto_287800 - DIRECTION
      ?auto_287801 - MODE
      ?auto_287802 - DIRECTION
      ?auto_287803 - MODE
      ?auto_287804 - DIRECTION
      ?auto_287805 - MODE
    )
    :vars
    (
      ?auto_287811 - INSTRUMENT
      ?auto_287813 - SATELLITE
      ?auto_287808 - DIRECTION
      ?auto_287812 - INSTRUMENT
      ?auto_287806 - INSTRUMENT
      ?auto_287810 - INSTRUMENT
      ?auto_287809 - INSTRUMENT
      ?auto_287807 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_287811 ?auto_287813 ) ( SUPPORTS ?auto_287811 ?auto_287801 ) ( not ( = ?auto_287800 ?auto_287808 ) ) ( CALIBRATION_TARGET ?auto_287811 ?auto_287808 ) ( not ( = ?auto_287808 ?auto_287796 ) ) ( ON_BOARD ?auto_287812 ?auto_287813 ) ( not ( = ?auto_287800 ?auto_287796 ) ) ( not ( = ?auto_287811 ?auto_287812 ) ) ( SUPPORTS ?auto_287812 ?auto_287797 ) ( CALIBRATION_TARGET ?auto_287812 ?auto_287808 ) ( not ( = ?auto_287808 ?auto_287802 ) ) ( ON_BOARD ?auto_287806 ?auto_287813 ) ( not ( = ?auto_287796 ?auto_287802 ) ) ( not ( = ?auto_287812 ?auto_287806 ) ) ( SUPPORTS ?auto_287806 ?auto_287803 ) ( CALIBRATION_TARGET ?auto_287806 ?auto_287808 ) ( not ( = ?auto_287808 ?auto_287799 ) ) ( ON_BOARD ?auto_287810 ?auto_287813 ) ( not ( = ?auto_287802 ?auto_287799 ) ) ( not ( = ?auto_287806 ?auto_287810 ) ) ( SUPPORTS ?auto_287810 ?auto_287798 ) ( CALIBRATION_TARGET ?auto_287810 ?auto_287808 ) ( not ( = ?auto_287808 ?auto_287804 ) ) ( ON_BOARD ?auto_287809 ?auto_287813 ) ( not ( = ?auto_287799 ?auto_287804 ) ) ( not ( = ?auto_287810 ?auto_287809 ) ) ( SUPPORTS ?auto_287809 ?auto_287805 ) ( CALIBRATION_TARGET ?auto_287809 ?auto_287808 ) ( POWER_AVAIL ?auto_287813 ) ( POINTING ?auto_287813 ?auto_287807 ) ( not ( = ?auto_287808 ?auto_287807 ) ) ( not ( = ?auto_287804 ?auto_287807 ) ) ( not ( = ?auto_287805 ?auto_287798 ) ) ( not ( = ?auto_287799 ?auto_287807 ) ) ( not ( = ?auto_287804 ?auto_287802 ) ) ( not ( = ?auto_287805 ?auto_287803 ) ) ( not ( = ?auto_287798 ?auto_287803 ) ) ( not ( = ?auto_287802 ?auto_287807 ) ) ( not ( = ?auto_287806 ?auto_287809 ) ) ( not ( = ?auto_287804 ?auto_287796 ) ) ( not ( = ?auto_287805 ?auto_287797 ) ) ( not ( = ?auto_287799 ?auto_287796 ) ) ( not ( = ?auto_287798 ?auto_287797 ) ) ( not ( = ?auto_287803 ?auto_287797 ) ) ( not ( = ?auto_287796 ?auto_287807 ) ) ( not ( = ?auto_287812 ?auto_287810 ) ) ( not ( = ?auto_287812 ?auto_287809 ) ) ( not ( = ?auto_287804 ?auto_287800 ) ) ( not ( = ?auto_287805 ?auto_287801 ) ) ( not ( = ?auto_287799 ?auto_287800 ) ) ( not ( = ?auto_287798 ?auto_287801 ) ) ( not ( = ?auto_287802 ?auto_287800 ) ) ( not ( = ?auto_287803 ?auto_287801 ) ) ( not ( = ?auto_287797 ?auto_287801 ) ) ( not ( = ?auto_287800 ?auto_287807 ) ) ( not ( = ?auto_287811 ?auto_287806 ) ) ( not ( = ?auto_287811 ?auto_287810 ) ) ( not ( = ?auto_287811 ?auto_287809 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_287804 ?auto_287805 ?auto_287799 ?auto_287798 ?auto_287802 ?auto_287803 ?auto_287800 ?auto_287801 ?auto_287796 ?auto_287797 )
      ( GET-5IMAGE-VERIFY ?auto_287796 ?auto_287797 ?auto_287799 ?auto_287798 ?auto_287800 ?auto_287801 ?auto_287802 ?auto_287803 ?auto_287804 ?auto_287805 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_288126 - DIRECTION
      ?auto_288127 - MODE
      ?auto_288129 - DIRECTION
      ?auto_288128 - MODE
      ?auto_288130 - DIRECTION
      ?auto_288131 - MODE
      ?auto_288132 - DIRECTION
      ?auto_288133 - MODE
      ?auto_288134 - DIRECTION
      ?auto_288135 - MODE
    )
    :vars
    (
      ?auto_288141 - INSTRUMENT
      ?auto_288143 - SATELLITE
      ?auto_288138 - DIRECTION
      ?auto_288142 - INSTRUMENT
      ?auto_288136 - INSTRUMENT
      ?auto_288140 - INSTRUMENT
      ?auto_288139 - INSTRUMENT
      ?auto_288137 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_288141 ?auto_288143 ) ( SUPPORTS ?auto_288141 ?auto_288135 ) ( not ( = ?auto_288134 ?auto_288138 ) ) ( CALIBRATION_TARGET ?auto_288141 ?auto_288138 ) ( not ( = ?auto_288138 ?auto_288126 ) ) ( ON_BOARD ?auto_288142 ?auto_288143 ) ( not ( = ?auto_288134 ?auto_288126 ) ) ( not ( = ?auto_288141 ?auto_288142 ) ) ( SUPPORTS ?auto_288142 ?auto_288127 ) ( CALIBRATION_TARGET ?auto_288142 ?auto_288138 ) ( not ( = ?auto_288138 ?auto_288129 ) ) ( ON_BOARD ?auto_288136 ?auto_288143 ) ( not ( = ?auto_288126 ?auto_288129 ) ) ( not ( = ?auto_288142 ?auto_288136 ) ) ( SUPPORTS ?auto_288136 ?auto_288128 ) ( CALIBRATION_TARGET ?auto_288136 ?auto_288138 ) ( not ( = ?auto_288138 ?auto_288132 ) ) ( ON_BOARD ?auto_288140 ?auto_288143 ) ( not ( = ?auto_288129 ?auto_288132 ) ) ( not ( = ?auto_288136 ?auto_288140 ) ) ( SUPPORTS ?auto_288140 ?auto_288133 ) ( CALIBRATION_TARGET ?auto_288140 ?auto_288138 ) ( not ( = ?auto_288138 ?auto_288130 ) ) ( ON_BOARD ?auto_288139 ?auto_288143 ) ( not ( = ?auto_288132 ?auto_288130 ) ) ( not ( = ?auto_288140 ?auto_288139 ) ) ( SUPPORTS ?auto_288139 ?auto_288131 ) ( CALIBRATION_TARGET ?auto_288139 ?auto_288138 ) ( POWER_AVAIL ?auto_288143 ) ( POINTING ?auto_288143 ?auto_288137 ) ( not ( = ?auto_288138 ?auto_288137 ) ) ( not ( = ?auto_288130 ?auto_288137 ) ) ( not ( = ?auto_288131 ?auto_288133 ) ) ( not ( = ?auto_288132 ?auto_288137 ) ) ( not ( = ?auto_288130 ?auto_288129 ) ) ( not ( = ?auto_288131 ?auto_288128 ) ) ( not ( = ?auto_288133 ?auto_288128 ) ) ( not ( = ?auto_288129 ?auto_288137 ) ) ( not ( = ?auto_288136 ?auto_288139 ) ) ( not ( = ?auto_288130 ?auto_288126 ) ) ( not ( = ?auto_288131 ?auto_288127 ) ) ( not ( = ?auto_288132 ?auto_288126 ) ) ( not ( = ?auto_288133 ?auto_288127 ) ) ( not ( = ?auto_288128 ?auto_288127 ) ) ( not ( = ?auto_288126 ?auto_288137 ) ) ( not ( = ?auto_288142 ?auto_288140 ) ) ( not ( = ?auto_288142 ?auto_288139 ) ) ( not ( = ?auto_288130 ?auto_288134 ) ) ( not ( = ?auto_288131 ?auto_288135 ) ) ( not ( = ?auto_288132 ?auto_288134 ) ) ( not ( = ?auto_288133 ?auto_288135 ) ) ( not ( = ?auto_288129 ?auto_288134 ) ) ( not ( = ?auto_288128 ?auto_288135 ) ) ( not ( = ?auto_288127 ?auto_288135 ) ) ( not ( = ?auto_288134 ?auto_288137 ) ) ( not ( = ?auto_288141 ?auto_288136 ) ) ( not ( = ?auto_288141 ?auto_288140 ) ) ( not ( = ?auto_288141 ?auto_288139 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_288130 ?auto_288131 ?auto_288132 ?auto_288133 ?auto_288129 ?auto_288128 ?auto_288134 ?auto_288135 ?auto_288126 ?auto_288127 )
      ( GET-5IMAGE-VERIFY ?auto_288126 ?auto_288127 ?auto_288129 ?auto_288128 ?auto_288130 ?auto_288131 ?auto_288132 ?auto_288133 ?auto_288134 ?auto_288135 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_288204 - DIRECTION
      ?auto_288205 - MODE
      ?auto_288207 - DIRECTION
      ?auto_288206 - MODE
      ?auto_288208 - DIRECTION
      ?auto_288209 - MODE
      ?auto_288210 - DIRECTION
      ?auto_288211 - MODE
      ?auto_288212 - DIRECTION
      ?auto_288213 - MODE
    )
    :vars
    (
      ?auto_288219 - INSTRUMENT
      ?auto_288221 - SATELLITE
      ?auto_288216 - DIRECTION
      ?auto_288220 - INSTRUMENT
      ?auto_288214 - INSTRUMENT
      ?auto_288218 - INSTRUMENT
      ?auto_288217 - INSTRUMENT
      ?auto_288215 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_288219 ?auto_288221 ) ( SUPPORTS ?auto_288219 ?auto_288211 ) ( not ( = ?auto_288210 ?auto_288216 ) ) ( CALIBRATION_TARGET ?auto_288219 ?auto_288216 ) ( not ( = ?auto_288216 ?auto_288204 ) ) ( ON_BOARD ?auto_288220 ?auto_288221 ) ( not ( = ?auto_288210 ?auto_288204 ) ) ( not ( = ?auto_288219 ?auto_288220 ) ) ( SUPPORTS ?auto_288220 ?auto_288205 ) ( CALIBRATION_TARGET ?auto_288220 ?auto_288216 ) ( not ( = ?auto_288216 ?auto_288207 ) ) ( ON_BOARD ?auto_288214 ?auto_288221 ) ( not ( = ?auto_288204 ?auto_288207 ) ) ( not ( = ?auto_288220 ?auto_288214 ) ) ( SUPPORTS ?auto_288214 ?auto_288206 ) ( CALIBRATION_TARGET ?auto_288214 ?auto_288216 ) ( not ( = ?auto_288216 ?auto_288212 ) ) ( ON_BOARD ?auto_288218 ?auto_288221 ) ( not ( = ?auto_288207 ?auto_288212 ) ) ( not ( = ?auto_288214 ?auto_288218 ) ) ( SUPPORTS ?auto_288218 ?auto_288213 ) ( CALIBRATION_TARGET ?auto_288218 ?auto_288216 ) ( not ( = ?auto_288216 ?auto_288208 ) ) ( ON_BOARD ?auto_288217 ?auto_288221 ) ( not ( = ?auto_288212 ?auto_288208 ) ) ( not ( = ?auto_288218 ?auto_288217 ) ) ( SUPPORTS ?auto_288217 ?auto_288209 ) ( CALIBRATION_TARGET ?auto_288217 ?auto_288216 ) ( POWER_AVAIL ?auto_288221 ) ( POINTING ?auto_288221 ?auto_288215 ) ( not ( = ?auto_288216 ?auto_288215 ) ) ( not ( = ?auto_288208 ?auto_288215 ) ) ( not ( = ?auto_288209 ?auto_288213 ) ) ( not ( = ?auto_288212 ?auto_288215 ) ) ( not ( = ?auto_288208 ?auto_288207 ) ) ( not ( = ?auto_288209 ?auto_288206 ) ) ( not ( = ?auto_288213 ?auto_288206 ) ) ( not ( = ?auto_288207 ?auto_288215 ) ) ( not ( = ?auto_288214 ?auto_288217 ) ) ( not ( = ?auto_288208 ?auto_288204 ) ) ( not ( = ?auto_288209 ?auto_288205 ) ) ( not ( = ?auto_288212 ?auto_288204 ) ) ( not ( = ?auto_288213 ?auto_288205 ) ) ( not ( = ?auto_288206 ?auto_288205 ) ) ( not ( = ?auto_288204 ?auto_288215 ) ) ( not ( = ?auto_288220 ?auto_288218 ) ) ( not ( = ?auto_288220 ?auto_288217 ) ) ( not ( = ?auto_288208 ?auto_288210 ) ) ( not ( = ?auto_288209 ?auto_288211 ) ) ( not ( = ?auto_288212 ?auto_288210 ) ) ( not ( = ?auto_288213 ?auto_288211 ) ) ( not ( = ?auto_288207 ?auto_288210 ) ) ( not ( = ?auto_288206 ?auto_288211 ) ) ( not ( = ?auto_288205 ?auto_288211 ) ) ( not ( = ?auto_288210 ?auto_288215 ) ) ( not ( = ?auto_288219 ?auto_288214 ) ) ( not ( = ?auto_288219 ?auto_288218 ) ) ( not ( = ?auto_288219 ?auto_288217 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_288208 ?auto_288209 ?auto_288212 ?auto_288213 ?auto_288207 ?auto_288206 ?auto_288210 ?auto_288211 ?auto_288204 ?auto_288205 )
      ( GET-5IMAGE-VERIFY ?auto_288204 ?auto_288205 ?auto_288207 ?auto_288206 ?auto_288208 ?auto_288209 ?auto_288210 ?auto_288211 ?auto_288212 ?auto_288213 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_288282 - DIRECTION
      ?auto_288283 - MODE
      ?auto_288285 - DIRECTION
      ?auto_288284 - MODE
      ?auto_288286 - DIRECTION
      ?auto_288287 - MODE
      ?auto_288288 - DIRECTION
      ?auto_288289 - MODE
      ?auto_288290 - DIRECTION
      ?auto_288291 - MODE
    )
    :vars
    (
      ?auto_288297 - INSTRUMENT
      ?auto_288299 - SATELLITE
      ?auto_288294 - DIRECTION
      ?auto_288298 - INSTRUMENT
      ?auto_288292 - INSTRUMENT
      ?auto_288296 - INSTRUMENT
      ?auto_288295 - INSTRUMENT
      ?auto_288293 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_288297 ?auto_288299 ) ( SUPPORTS ?auto_288297 ?auto_288291 ) ( not ( = ?auto_288290 ?auto_288294 ) ) ( CALIBRATION_TARGET ?auto_288297 ?auto_288294 ) ( not ( = ?auto_288294 ?auto_288282 ) ) ( ON_BOARD ?auto_288298 ?auto_288299 ) ( not ( = ?auto_288290 ?auto_288282 ) ) ( not ( = ?auto_288297 ?auto_288298 ) ) ( SUPPORTS ?auto_288298 ?auto_288283 ) ( CALIBRATION_TARGET ?auto_288298 ?auto_288294 ) ( not ( = ?auto_288294 ?auto_288285 ) ) ( ON_BOARD ?auto_288292 ?auto_288299 ) ( not ( = ?auto_288282 ?auto_288285 ) ) ( not ( = ?auto_288298 ?auto_288292 ) ) ( SUPPORTS ?auto_288292 ?auto_288284 ) ( CALIBRATION_TARGET ?auto_288292 ?auto_288294 ) ( not ( = ?auto_288294 ?auto_288286 ) ) ( ON_BOARD ?auto_288296 ?auto_288299 ) ( not ( = ?auto_288285 ?auto_288286 ) ) ( not ( = ?auto_288292 ?auto_288296 ) ) ( SUPPORTS ?auto_288296 ?auto_288287 ) ( CALIBRATION_TARGET ?auto_288296 ?auto_288294 ) ( not ( = ?auto_288294 ?auto_288288 ) ) ( ON_BOARD ?auto_288295 ?auto_288299 ) ( not ( = ?auto_288286 ?auto_288288 ) ) ( not ( = ?auto_288296 ?auto_288295 ) ) ( SUPPORTS ?auto_288295 ?auto_288289 ) ( CALIBRATION_TARGET ?auto_288295 ?auto_288294 ) ( POWER_AVAIL ?auto_288299 ) ( POINTING ?auto_288299 ?auto_288293 ) ( not ( = ?auto_288294 ?auto_288293 ) ) ( not ( = ?auto_288288 ?auto_288293 ) ) ( not ( = ?auto_288289 ?auto_288287 ) ) ( not ( = ?auto_288286 ?auto_288293 ) ) ( not ( = ?auto_288288 ?auto_288285 ) ) ( not ( = ?auto_288289 ?auto_288284 ) ) ( not ( = ?auto_288287 ?auto_288284 ) ) ( not ( = ?auto_288285 ?auto_288293 ) ) ( not ( = ?auto_288292 ?auto_288295 ) ) ( not ( = ?auto_288288 ?auto_288282 ) ) ( not ( = ?auto_288289 ?auto_288283 ) ) ( not ( = ?auto_288286 ?auto_288282 ) ) ( not ( = ?auto_288287 ?auto_288283 ) ) ( not ( = ?auto_288284 ?auto_288283 ) ) ( not ( = ?auto_288282 ?auto_288293 ) ) ( not ( = ?auto_288298 ?auto_288296 ) ) ( not ( = ?auto_288298 ?auto_288295 ) ) ( not ( = ?auto_288288 ?auto_288290 ) ) ( not ( = ?auto_288289 ?auto_288291 ) ) ( not ( = ?auto_288286 ?auto_288290 ) ) ( not ( = ?auto_288287 ?auto_288291 ) ) ( not ( = ?auto_288285 ?auto_288290 ) ) ( not ( = ?auto_288284 ?auto_288291 ) ) ( not ( = ?auto_288283 ?auto_288291 ) ) ( not ( = ?auto_288290 ?auto_288293 ) ) ( not ( = ?auto_288297 ?auto_288292 ) ) ( not ( = ?auto_288297 ?auto_288296 ) ) ( not ( = ?auto_288297 ?auto_288295 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_288288 ?auto_288289 ?auto_288286 ?auto_288287 ?auto_288285 ?auto_288284 ?auto_288290 ?auto_288291 ?auto_288282 ?auto_288283 )
      ( GET-5IMAGE-VERIFY ?auto_288282 ?auto_288283 ?auto_288285 ?auto_288284 ?auto_288286 ?auto_288287 ?auto_288288 ?auto_288289 ?auto_288290 ?auto_288291 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_288360 - DIRECTION
      ?auto_288361 - MODE
      ?auto_288363 - DIRECTION
      ?auto_288362 - MODE
      ?auto_288364 - DIRECTION
      ?auto_288365 - MODE
      ?auto_288366 - DIRECTION
      ?auto_288367 - MODE
      ?auto_288368 - DIRECTION
      ?auto_288369 - MODE
    )
    :vars
    (
      ?auto_288375 - INSTRUMENT
      ?auto_288377 - SATELLITE
      ?auto_288372 - DIRECTION
      ?auto_288376 - INSTRUMENT
      ?auto_288370 - INSTRUMENT
      ?auto_288374 - INSTRUMENT
      ?auto_288373 - INSTRUMENT
      ?auto_288371 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_288375 ?auto_288377 ) ( SUPPORTS ?auto_288375 ?auto_288367 ) ( not ( = ?auto_288366 ?auto_288372 ) ) ( CALIBRATION_TARGET ?auto_288375 ?auto_288372 ) ( not ( = ?auto_288372 ?auto_288360 ) ) ( ON_BOARD ?auto_288376 ?auto_288377 ) ( not ( = ?auto_288366 ?auto_288360 ) ) ( not ( = ?auto_288375 ?auto_288376 ) ) ( SUPPORTS ?auto_288376 ?auto_288361 ) ( CALIBRATION_TARGET ?auto_288376 ?auto_288372 ) ( not ( = ?auto_288372 ?auto_288363 ) ) ( ON_BOARD ?auto_288370 ?auto_288377 ) ( not ( = ?auto_288360 ?auto_288363 ) ) ( not ( = ?auto_288376 ?auto_288370 ) ) ( SUPPORTS ?auto_288370 ?auto_288362 ) ( CALIBRATION_TARGET ?auto_288370 ?auto_288372 ) ( not ( = ?auto_288372 ?auto_288364 ) ) ( ON_BOARD ?auto_288374 ?auto_288377 ) ( not ( = ?auto_288363 ?auto_288364 ) ) ( not ( = ?auto_288370 ?auto_288374 ) ) ( SUPPORTS ?auto_288374 ?auto_288365 ) ( CALIBRATION_TARGET ?auto_288374 ?auto_288372 ) ( not ( = ?auto_288372 ?auto_288368 ) ) ( ON_BOARD ?auto_288373 ?auto_288377 ) ( not ( = ?auto_288364 ?auto_288368 ) ) ( not ( = ?auto_288374 ?auto_288373 ) ) ( SUPPORTS ?auto_288373 ?auto_288369 ) ( CALIBRATION_TARGET ?auto_288373 ?auto_288372 ) ( POWER_AVAIL ?auto_288377 ) ( POINTING ?auto_288377 ?auto_288371 ) ( not ( = ?auto_288372 ?auto_288371 ) ) ( not ( = ?auto_288368 ?auto_288371 ) ) ( not ( = ?auto_288369 ?auto_288365 ) ) ( not ( = ?auto_288364 ?auto_288371 ) ) ( not ( = ?auto_288368 ?auto_288363 ) ) ( not ( = ?auto_288369 ?auto_288362 ) ) ( not ( = ?auto_288365 ?auto_288362 ) ) ( not ( = ?auto_288363 ?auto_288371 ) ) ( not ( = ?auto_288370 ?auto_288373 ) ) ( not ( = ?auto_288368 ?auto_288360 ) ) ( not ( = ?auto_288369 ?auto_288361 ) ) ( not ( = ?auto_288364 ?auto_288360 ) ) ( not ( = ?auto_288365 ?auto_288361 ) ) ( not ( = ?auto_288362 ?auto_288361 ) ) ( not ( = ?auto_288360 ?auto_288371 ) ) ( not ( = ?auto_288376 ?auto_288374 ) ) ( not ( = ?auto_288376 ?auto_288373 ) ) ( not ( = ?auto_288368 ?auto_288366 ) ) ( not ( = ?auto_288369 ?auto_288367 ) ) ( not ( = ?auto_288364 ?auto_288366 ) ) ( not ( = ?auto_288365 ?auto_288367 ) ) ( not ( = ?auto_288363 ?auto_288366 ) ) ( not ( = ?auto_288362 ?auto_288367 ) ) ( not ( = ?auto_288361 ?auto_288367 ) ) ( not ( = ?auto_288366 ?auto_288371 ) ) ( not ( = ?auto_288375 ?auto_288370 ) ) ( not ( = ?auto_288375 ?auto_288374 ) ) ( not ( = ?auto_288375 ?auto_288373 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_288368 ?auto_288369 ?auto_288364 ?auto_288365 ?auto_288363 ?auto_288362 ?auto_288366 ?auto_288367 ?auto_288360 ?auto_288361 )
      ( GET-5IMAGE-VERIFY ?auto_288360 ?auto_288361 ?auto_288363 ?auto_288362 ?auto_288364 ?auto_288365 ?auto_288366 ?auto_288367 ?auto_288368 ?auto_288369 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_288858 - DIRECTION
      ?auto_288859 - MODE
      ?auto_288861 - DIRECTION
      ?auto_288860 - MODE
      ?auto_288862 - DIRECTION
      ?auto_288863 - MODE
      ?auto_288864 - DIRECTION
      ?auto_288865 - MODE
      ?auto_288866 - DIRECTION
      ?auto_288867 - MODE
    )
    :vars
    (
      ?auto_288873 - INSTRUMENT
      ?auto_288875 - SATELLITE
      ?auto_288870 - DIRECTION
      ?auto_288874 - INSTRUMENT
      ?auto_288868 - INSTRUMENT
      ?auto_288872 - INSTRUMENT
      ?auto_288871 - INSTRUMENT
      ?auto_288869 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_288873 ?auto_288875 ) ( SUPPORTS ?auto_288873 ?auto_288863 ) ( not ( = ?auto_288862 ?auto_288870 ) ) ( CALIBRATION_TARGET ?auto_288873 ?auto_288870 ) ( not ( = ?auto_288870 ?auto_288858 ) ) ( ON_BOARD ?auto_288874 ?auto_288875 ) ( not ( = ?auto_288862 ?auto_288858 ) ) ( not ( = ?auto_288873 ?auto_288874 ) ) ( SUPPORTS ?auto_288874 ?auto_288859 ) ( CALIBRATION_TARGET ?auto_288874 ?auto_288870 ) ( not ( = ?auto_288870 ?auto_288861 ) ) ( ON_BOARD ?auto_288868 ?auto_288875 ) ( not ( = ?auto_288858 ?auto_288861 ) ) ( not ( = ?auto_288874 ?auto_288868 ) ) ( SUPPORTS ?auto_288868 ?auto_288860 ) ( CALIBRATION_TARGET ?auto_288868 ?auto_288870 ) ( not ( = ?auto_288870 ?auto_288866 ) ) ( ON_BOARD ?auto_288872 ?auto_288875 ) ( not ( = ?auto_288861 ?auto_288866 ) ) ( not ( = ?auto_288868 ?auto_288872 ) ) ( SUPPORTS ?auto_288872 ?auto_288867 ) ( CALIBRATION_TARGET ?auto_288872 ?auto_288870 ) ( not ( = ?auto_288870 ?auto_288864 ) ) ( ON_BOARD ?auto_288871 ?auto_288875 ) ( not ( = ?auto_288866 ?auto_288864 ) ) ( not ( = ?auto_288872 ?auto_288871 ) ) ( SUPPORTS ?auto_288871 ?auto_288865 ) ( CALIBRATION_TARGET ?auto_288871 ?auto_288870 ) ( POWER_AVAIL ?auto_288875 ) ( POINTING ?auto_288875 ?auto_288869 ) ( not ( = ?auto_288870 ?auto_288869 ) ) ( not ( = ?auto_288864 ?auto_288869 ) ) ( not ( = ?auto_288865 ?auto_288867 ) ) ( not ( = ?auto_288866 ?auto_288869 ) ) ( not ( = ?auto_288864 ?auto_288861 ) ) ( not ( = ?auto_288865 ?auto_288860 ) ) ( not ( = ?auto_288867 ?auto_288860 ) ) ( not ( = ?auto_288861 ?auto_288869 ) ) ( not ( = ?auto_288868 ?auto_288871 ) ) ( not ( = ?auto_288864 ?auto_288858 ) ) ( not ( = ?auto_288865 ?auto_288859 ) ) ( not ( = ?auto_288866 ?auto_288858 ) ) ( not ( = ?auto_288867 ?auto_288859 ) ) ( not ( = ?auto_288860 ?auto_288859 ) ) ( not ( = ?auto_288858 ?auto_288869 ) ) ( not ( = ?auto_288874 ?auto_288872 ) ) ( not ( = ?auto_288874 ?auto_288871 ) ) ( not ( = ?auto_288864 ?auto_288862 ) ) ( not ( = ?auto_288865 ?auto_288863 ) ) ( not ( = ?auto_288866 ?auto_288862 ) ) ( not ( = ?auto_288867 ?auto_288863 ) ) ( not ( = ?auto_288861 ?auto_288862 ) ) ( not ( = ?auto_288860 ?auto_288863 ) ) ( not ( = ?auto_288859 ?auto_288863 ) ) ( not ( = ?auto_288862 ?auto_288869 ) ) ( not ( = ?auto_288873 ?auto_288868 ) ) ( not ( = ?auto_288873 ?auto_288872 ) ) ( not ( = ?auto_288873 ?auto_288871 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_288864 ?auto_288865 ?auto_288866 ?auto_288867 ?auto_288861 ?auto_288860 ?auto_288862 ?auto_288863 ?auto_288858 ?auto_288859 )
      ( GET-5IMAGE-VERIFY ?auto_288858 ?auto_288859 ?auto_288861 ?auto_288860 ?auto_288862 ?auto_288863 ?auto_288864 ?auto_288865 ?auto_288866 ?auto_288867 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_288936 - DIRECTION
      ?auto_288937 - MODE
      ?auto_288939 - DIRECTION
      ?auto_288938 - MODE
      ?auto_288940 - DIRECTION
      ?auto_288941 - MODE
      ?auto_288942 - DIRECTION
      ?auto_288943 - MODE
      ?auto_288944 - DIRECTION
      ?auto_288945 - MODE
    )
    :vars
    (
      ?auto_288951 - INSTRUMENT
      ?auto_288953 - SATELLITE
      ?auto_288948 - DIRECTION
      ?auto_288952 - INSTRUMENT
      ?auto_288946 - INSTRUMENT
      ?auto_288950 - INSTRUMENT
      ?auto_288949 - INSTRUMENT
      ?auto_288947 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_288951 ?auto_288953 ) ( SUPPORTS ?auto_288951 ?auto_288941 ) ( not ( = ?auto_288940 ?auto_288948 ) ) ( CALIBRATION_TARGET ?auto_288951 ?auto_288948 ) ( not ( = ?auto_288948 ?auto_288936 ) ) ( ON_BOARD ?auto_288952 ?auto_288953 ) ( not ( = ?auto_288940 ?auto_288936 ) ) ( not ( = ?auto_288951 ?auto_288952 ) ) ( SUPPORTS ?auto_288952 ?auto_288937 ) ( CALIBRATION_TARGET ?auto_288952 ?auto_288948 ) ( not ( = ?auto_288948 ?auto_288939 ) ) ( ON_BOARD ?auto_288946 ?auto_288953 ) ( not ( = ?auto_288936 ?auto_288939 ) ) ( not ( = ?auto_288952 ?auto_288946 ) ) ( SUPPORTS ?auto_288946 ?auto_288938 ) ( CALIBRATION_TARGET ?auto_288946 ?auto_288948 ) ( not ( = ?auto_288948 ?auto_288942 ) ) ( ON_BOARD ?auto_288950 ?auto_288953 ) ( not ( = ?auto_288939 ?auto_288942 ) ) ( not ( = ?auto_288946 ?auto_288950 ) ) ( SUPPORTS ?auto_288950 ?auto_288943 ) ( CALIBRATION_TARGET ?auto_288950 ?auto_288948 ) ( not ( = ?auto_288948 ?auto_288944 ) ) ( ON_BOARD ?auto_288949 ?auto_288953 ) ( not ( = ?auto_288942 ?auto_288944 ) ) ( not ( = ?auto_288950 ?auto_288949 ) ) ( SUPPORTS ?auto_288949 ?auto_288945 ) ( CALIBRATION_TARGET ?auto_288949 ?auto_288948 ) ( POWER_AVAIL ?auto_288953 ) ( POINTING ?auto_288953 ?auto_288947 ) ( not ( = ?auto_288948 ?auto_288947 ) ) ( not ( = ?auto_288944 ?auto_288947 ) ) ( not ( = ?auto_288945 ?auto_288943 ) ) ( not ( = ?auto_288942 ?auto_288947 ) ) ( not ( = ?auto_288944 ?auto_288939 ) ) ( not ( = ?auto_288945 ?auto_288938 ) ) ( not ( = ?auto_288943 ?auto_288938 ) ) ( not ( = ?auto_288939 ?auto_288947 ) ) ( not ( = ?auto_288946 ?auto_288949 ) ) ( not ( = ?auto_288944 ?auto_288936 ) ) ( not ( = ?auto_288945 ?auto_288937 ) ) ( not ( = ?auto_288942 ?auto_288936 ) ) ( not ( = ?auto_288943 ?auto_288937 ) ) ( not ( = ?auto_288938 ?auto_288937 ) ) ( not ( = ?auto_288936 ?auto_288947 ) ) ( not ( = ?auto_288952 ?auto_288950 ) ) ( not ( = ?auto_288952 ?auto_288949 ) ) ( not ( = ?auto_288944 ?auto_288940 ) ) ( not ( = ?auto_288945 ?auto_288941 ) ) ( not ( = ?auto_288942 ?auto_288940 ) ) ( not ( = ?auto_288943 ?auto_288941 ) ) ( not ( = ?auto_288939 ?auto_288940 ) ) ( not ( = ?auto_288938 ?auto_288941 ) ) ( not ( = ?auto_288937 ?auto_288941 ) ) ( not ( = ?auto_288940 ?auto_288947 ) ) ( not ( = ?auto_288951 ?auto_288946 ) ) ( not ( = ?auto_288951 ?auto_288950 ) ) ( not ( = ?auto_288951 ?auto_288949 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_288944 ?auto_288945 ?auto_288942 ?auto_288943 ?auto_288939 ?auto_288938 ?auto_288940 ?auto_288941 ?auto_288936 ?auto_288937 )
      ( GET-5IMAGE-VERIFY ?auto_288936 ?auto_288937 ?auto_288939 ?auto_288938 ?auto_288940 ?auto_288941 ?auto_288942 ?auto_288943 ?auto_288944 ?auto_288945 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_290818 - DIRECTION
      ?auto_290819 - MODE
      ?auto_290821 - DIRECTION
      ?auto_290820 - MODE
      ?auto_290822 - DIRECTION
      ?auto_290823 - MODE
      ?auto_290824 - DIRECTION
      ?auto_290825 - MODE
      ?auto_290826 - DIRECTION
      ?auto_290827 - MODE
    )
    :vars
    (
      ?auto_290833 - INSTRUMENT
      ?auto_290835 - SATELLITE
      ?auto_290830 - DIRECTION
      ?auto_290834 - INSTRUMENT
      ?auto_290828 - INSTRUMENT
      ?auto_290832 - INSTRUMENT
      ?auto_290831 - INSTRUMENT
      ?auto_290829 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_290833 ?auto_290835 ) ( SUPPORTS ?auto_290833 ?auto_290820 ) ( not ( = ?auto_290821 ?auto_290830 ) ) ( CALIBRATION_TARGET ?auto_290833 ?auto_290830 ) ( not ( = ?auto_290830 ?auto_290818 ) ) ( ON_BOARD ?auto_290834 ?auto_290835 ) ( not ( = ?auto_290821 ?auto_290818 ) ) ( not ( = ?auto_290833 ?auto_290834 ) ) ( SUPPORTS ?auto_290834 ?auto_290819 ) ( CALIBRATION_TARGET ?auto_290834 ?auto_290830 ) ( not ( = ?auto_290830 ?auto_290826 ) ) ( ON_BOARD ?auto_290828 ?auto_290835 ) ( not ( = ?auto_290818 ?auto_290826 ) ) ( not ( = ?auto_290834 ?auto_290828 ) ) ( SUPPORTS ?auto_290828 ?auto_290827 ) ( CALIBRATION_TARGET ?auto_290828 ?auto_290830 ) ( not ( = ?auto_290830 ?auto_290824 ) ) ( ON_BOARD ?auto_290832 ?auto_290835 ) ( not ( = ?auto_290826 ?auto_290824 ) ) ( not ( = ?auto_290828 ?auto_290832 ) ) ( SUPPORTS ?auto_290832 ?auto_290825 ) ( CALIBRATION_TARGET ?auto_290832 ?auto_290830 ) ( not ( = ?auto_290830 ?auto_290822 ) ) ( ON_BOARD ?auto_290831 ?auto_290835 ) ( not ( = ?auto_290824 ?auto_290822 ) ) ( not ( = ?auto_290832 ?auto_290831 ) ) ( SUPPORTS ?auto_290831 ?auto_290823 ) ( CALIBRATION_TARGET ?auto_290831 ?auto_290830 ) ( POWER_AVAIL ?auto_290835 ) ( POINTING ?auto_290835 ?auto_290829 ) ( not ( = ?auto_290830 ?auto_290829 ) ) ( not ( = ?auto_290822 ?auto_290829 ) ) ( not ( = ?auto_290823 ?auto_290825 ) ) ( not ( = ?auto_290824 ?auto_290829 ) ) ( not ( = ?auto_290822 ?auto_290826 ) ) ( not ( = ?auto_290823 ?auto_290827 ) ) ( not ( = ?auto_290825 ?auto_290827 ) ) ( not ( = ?auto_290826 ?auto_290829 ) ) ( not ( = ?auto_290828 ?auto_290831 ) ) ( not ( = ?auto_290822 ?auto_290818 ) ) ( not ( = ?auto_290823 ?auto_290819 ) ) ( not ( = ?auto_290824 ?auto_290818 ) ) ( not ( = ?auto_290825 ?auto_290819 ) ) ( not ( = ?auto_290827 ?auto_290819 ) ) ( not ( = ?auto_290818 ?auto_290829 ) ) ( not ( = ?auto_290834 ?auto_290832 ) ) ( not ( = ?auto_290834 ?auto_290831 ) ) ( not ( = ?auto_290822 ?auto_290821 ) ) ( not ( = ?auto_290823 ?auto_290820 ) ) ( not ( = ?auto_290824 ?auto_290821 ) ) ( not ( = ?auto_290825 ?auto_290820 ) ) ( not ( = ?auto_290826 ?auto_290821 ) ) ( not ( = ?auto_290827 ?auto_290820 ) ) ( not ( = ?auto_290819 ?auto_290820 ) ) ( not ( = ?auto_290821 ?auto_290829 ) ) ( not ( = ?auto_290833 ?auto_290828 ) ) ( not ( = ?auto_290833 ?auto_290832 ) ) ( not ( = ?auto_290833 ?auto_290831 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_290822 ?auto_290823 ?auto_290824 ?auto_290825 ?auto_290826 ?auto_290827 ?auto_290821 ?auto_290820 ?auto_290818 ?auto_290819 )
      ( GET-5IMAGE-VERIFY ?auto_290818 ?auto_290819 ?auto_290821 ?auto_290820 ?auto_290822 ?auto_290823 ?auto_290824 ?auto_290825 ?auto_290826 ?auto_290827 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_290896 - DIRECTION
      ?auto_290897 - MODE
      ?auto_290899 - DIRECTION
      ?auto_290898 - MODE
      ?auto_290900 - DIRECTION
      ?auto_290901 - MODE
      ?auto_290902 - DIRECTION
      ?auto_290903 - MODE
      ?auto_290904 - DIRECTION
      ?auto_290905 - MODE
    )
    :vars
    (
      ?auto_290911 - INSTRUMENT
      ?auto_290913 - SATELLITE
      ?auto_290908 - DIRECTION
      ?auto_290912 - INSTRUMENT
      ?auto_290906 - INSTRUMENT
      ?auto_290910 - INSTRUMENT
      ?auto_290909 - INSTRUMENT
      ?auto_290907 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_290911 ?auto_290913 ) ( SUPPORTS ?auto_290911 ?auto_290898 ) ( not ( = ?auto_290899 ?auto_290908 ) ) ( CALIBRATION_TARGET ?auto_290911 ?auto_290908 ) ( not ( = ?auto_290908 ?auto_290896 ) ) ( ON_BOARD ?auto_290912 ?auto_290913 ) ( not ( = ?auto_290899 ?auto_290896 ) ) ( not ( = ?auto_290911 ?auto_290912 ) ) ( SUPPORTS ?auto_290912 ?auto_290897 ) ( CALIBRATION_TARGET ?auto_290912 ?auto_290908 ) ( not ( = ?auto_290908 ?auto_290902 ) ) ( ON_BOARD ?auto_290906 ?auto_290913 ) ( not ( = ?auto_290896 ?auto_290902 ) ) ( not ( = ?auto_290912 ?auto_290906 ) ) ( SUPPORTS ?auto_290906 ?auto_290903 ) ( CALIBRATION_TARGET ?auto_290906 ?auto_290908 ) ( not ( = ?auto_290908 ?auto_290904 ) ) ( ON_BOARD ?auto_290910 ?auto_290913 ) ( not ( = ?auto_290902 ?auto_290904 ) ) ( not ( = ?auto_290906 ?auto_290910 ) ) ( SUPPORTS ?auto_290910 ?auto_290905 ) ( CALIBRATION_TARGET ?auto_290910 ?auto_290908 ) ( not ( = ?auto_290908 ?auto_290900 ) ) ( ON_BOARD ?auto_290909 ?auto_290913 ) ( not ( = ?auto_290904 ?auto_290900 ) ) ( not ( = ?auto_290910 ?auto_290909 ) ) ( SUPPORTS ?auto_290909 ?auto_290901 ) ( CALIBRATION_TARGET ?auto_290909 ?auto_290908 ) ( POWER_AVAIL ?auto_290913 ) ( POINTING ?auto_290913 ?auto_290907 ) ( not ( = ?auto_290908 ?auto_290907 ) ) ( not ( = ?auto_290900 ?auto_290907 ) ) ( not ( = ?auto_290901 ?auto_290905 ) ) ( not ( = ?auto_290904 ?auto_290907 ) ) ( not ( = ?auto_290900 ?auto_290902 ) ) ( not ( = ?auto_290901 ?auto_290903 ) ) ( not ( = ?auto_290905 ?auto_290903 ) ) ( not ( = ?auto_290902 ?auto_290907 ) ) ( not ( = ?auto_290906 ?auto_290909 ) ) ( not ( = ?auto_290900 ?auto_290896 ) ) ( not ( = ?auto_290901 ?auto_290897 ) ) ( not ( = ?auto_290904 ?auto_290896 ) ) ( not ( = ?auto_290905 ?auto_290897 ) ) ( not ( = ?auto_290903 ?auto_290897 ) ) ( not ( = ?auto_290896 ?auto_290907 ) ) ( not ( = ?auto_290912 ?auto_290910 ) ) ( not ( = ?auto_290912 ?auto_290909 ) ) ( not ( = ?auto_290900 ?auto_290899 ) ) ( not ( = ?auto_290901 ?auto_290898 ) ) ( not ( = ?auto_290904 ?auto_290899 ) ) ( not ( = ?auto_290905 ?auto_290898 ) ) ( not ( = ?auto_290902 ?auto_290899 ) ) ( not ( = ?auto_290903 ?auto_290898 ) ) ( not ( = ?auto_290897 ?auto_290898 ) ) ( not ( = ?auto_290899 ?auto_290907 ) ) ( not ( = ?auto_290911 ?auto_290906 ) ) ( not ( = ?auto_290911 ?auto_290910 ) ) ( not ( = ?auto_290911 ?auto_290909 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_290900 ?auto_290901 ?auto_290904 ?auto_290905 ?auto_290902 ?auto_290903 ?auto_290899 ?auto_290898 ?auto_290896 ?auto_290897 )
      ( GET-5IMAGE-VERIFY ?auto_290896 ?auto_290897 ?auto_290899 ?auto_290898 ?auto_290900 ?auto_290901 ?auto_290902 ?auto_290903 ?auto_290904 ?auto_290905 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_291226 - DIRECTION
      ?auto_291227 - MODE
      ?auto_291229 - DIRECTION
      ?auto_291228 - MODE
      ?auto_291230 - DIRECTION
      ?auto_291231 - MODE
      ?auto_291232 - DIRECTION
      ?auto_291233 - MODE
      ?auto_291234 - DIRECTION
      ?auto_291235 - MODE
    )
    :vars
    (
      ?auto_291241 - INSTRUMENT
      ?auto_291243 - SATELLITE
      ?auto_291238 - DIRECTION
      ?auto_291242 - INSTRUMENT
      ?auto_291236 - INSTRUMENT
      ?auto_291240 - INSTRUMENT
      ?auto_291239 - INSTRUMENT
      ?auto_291237 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_291241 ?auto_291243 ) ( SUPPORTS ?auto_291241 ?auto_291228 ) ( not ( = ?auto_291229 ?auto_291238 ) ) ( CALIBRATION_TARGET ?auto_291241 ?auto_291238 ) ( not ( = ?auto_291238 ?auto_291226 ) ) ( ON_BOARD ?auto_291242 ?auto_291243 ) ( not ( = ?auto_291229 ?auto_291226 ) ) ( not ( = ?auto_291241 ?auto_291242 ) ) ( SUPPORTS ?auto_291242 ?auto_291227 ) ( CALIBRATION_TARGET ?auto_291242 ?auto_291238 ) ( not ( = ?auto_291238 ?auto_291234 ) ) ( ON_BOARD ?auto_291236 ?auto_291243 ) ( not ( = ?auto_291226 ?auto_291234 ) ) ( not ( = ?auto_291242 ?auto_291236 ) ) ( SUPPORTS ?auto_291236 ?auto_291235 ) ( CALIBRATION_TARGET ?auto_291236 ?auto_291238 ) ( not ( = ?auto_291238 ?auto_291230 ) ) ( ON_BOARD ?auto_291240 ?auto_291243 ) ( not ( = ?auto_291234 ?auto_291230 ) ) ( not ( = ?auto_291236 ?auto_291240 ) ) ( SUPPORTS ?auto_291240 ?auto_291231 ) ( CALIBRATION_TARGET ?auto_291240 ?auto_291238 ) ( not ( = ?auto_291238 ?auto_291232 ) ) ( ON_BOARD ?auto_291239 ?auto_291243 ) ( not ( = ?auto_291230 ?auto_291232 ) ) ( not ( = ?auto_291240 ?auto_291239 ) ) ( SUPPORTS ?auto_291239 ?auto_291233 ) ( CALIBRATION_TARGET ?auto_291239 ?auto_291238 ) ( POWER_AVAIL ?auto_291243 ) ( POINTING ?auto_291243 ?auto_291237 ) ( not ( = ?auto_291238 ?auto_291237 ) ) ( not ( = ?auto_291232 ?auto_291237 ) ) ( not ( = ?auto_291233 ?auto_291231 ) ) ( not ( = ?auto_291230 ?auto_291237 ) ) ( not ( = ?auto_291232 ?auto_291234 ) ) ( not ( = ?auto_291233 ?auto_291235 ) ) ( not ( = ?auto_291231 ?auto_291235 ) ) ( not ( = ?auto_291234 ?auto_291237 ) ) ( not ( = ?auto_291236 ?auto_291239 ) ) ( not ( = ?auto_291232 ?auto_291226 ) ) ( not ( = ?auto_291233 ?auto_291227 ) ) ( not ( = ?auto_291230 ?auto_291226 ) ) ( not ( = ?auto_291231 ?auto_291227 ) ) ( not ( = ?auto_291235 ?auto_291227 ) ) ( not ( = ?auto_291226 ?auto_291237 ) ) ( not ( = ?auto_291242 ?auto_291240 ) ) ( not ( = ?auto_291242 ?auto_291239 ) ) ( not ( = ?auto_291232 ?auto_291229 ) ) ( not ( = ?auto_291233 ?auto_291228 ) ) ( not ( = ?auto_291230 ?auto_291229 ) ) ( not ( = ?auto_291231 ?auto_291228 ) ) ( not ( = ?auto_291234 ?auto_291229 ) ) ( not ( = ?auto_291235 ?auto_291228 ) ) ( not ( = ?auto_291227 ?auto_291228 ) ) ( not ( = ?auto_291229 ?auto_291237 ) ) ( not ( = ?auto_291241 ?auto_291236 ) ) ( not ( = ?auto_291241 ?auto_291240 ) ) ( not ( = ?auto_291241 ?auto_291239 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_291232 ?auto_291233 ?auto_291230 ?auto_291231 ?auto_291234 ?auto_291235 ?auto_291229 ?auto_291228 ?auto_291226 ?auto_291227 )
      ( GET-5IMAGE-VERIFY ?auto_291226 ?auto_291227 ?auto_291229 ?auto_291228 ?auto_291230 ?auto_291231 ?auto_291232 ?auto_291233 ?auto_291234 ?auto_291235 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_291390 - DIRECTION
      ?auto_291391 - MODE
      ?auto_291393 - DIRECTION
      ?auto_291392 - MODE
      ?auto_291394 - DIRECTION
      ?auto_291395 - MODE
      ?auto_291396 - DIRECTION
      ?auto_291397 - MODE
      ?auto_291398 - DIRECTION
      ?auto_291399 - MODE
    )
    :vars
    (
      ?auto_291405 - INSTRUMENT
      ?auto_291407 - SATELLITE
      ?auto_291402 - DIRECTION
      ?auto_291406 - INSTRUMENT
      ?auto_291400 - INSTRUMENT
      ?auto_291404 - INSTRUMENT
      ?auto_291403 - INSTRUMENT
      ?auto_291401 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_291405 ?auto_291407 ) ( SUPPORTS ?auto_291405 ?auto_291392 ) ( not ( = ?auto_291393 ?auto_291402 ) ) ( CALIBRATION_TARGET ?auto_291405 ?auto_291402 ) ( not ( = ?auto_291402 ?auto_291390 ) ) ( ON_BOARD ?auto_291406 ?auto_291407 ) ( not ( = ?auto_291393 ?auto_291390 ) ) ( not ( = ?auto_291405 ?auto_291406 ) ) ( SUPPORTS ?auto_291406 ?auto_291391 ) ( CALIBRATION_TARGET ?auto_291406 ?auto_291402 ) ( not ( = ?auto_291402 ?auto_291396 ) ) ( ON_BOARD ?auto_291400 ?auto_291407 ) ( not ( = ?auto_291390 ?auto_291396 ) ) ( not ( = ?auto_291406 ?auto_291400 ) ) ( SUPPORTS ?auto_291400 ?auto_291397 ) ( CALIBRATION_TARGET ?auto_291400 ?auto_291402 ) ( not ( = ?auto_291402 ?auto_291394 ) ) ( ON_BOARD ?auto_291404 ?auto_291407 ) ( not ( = ?auto_291396 ?auto_291394 ) ) ( not ( = ?auto_291400 ?auto_291404 ) ) ( SUPPORTS ?auto_291404 ?auto_291395 ) ( CALIBRATION_TARGET ?auto_291404 ?auto_291402 ) ( not ( = ?auto_291402 ?auto_291398 ) ) ( ON_BOARD ?auto_291403 ?auto_291407 ) ( not ( = ?auto_291394 ?auto_291398 ) ) ( not ( = ?auto_291404 ?auto_291403 ) ) ( SUPPORTS ?auto_291403 ?auto_291399 ) ( CALIBRATION_TARGET ?auto_291403 ?auto_291402 ) ( POWER_AVAIL ?auto_291407 ) ( POINTING ?auto_291407 ?auto_291401 ) ( not ( = ?auto_291402 ?auto_291401 ) ) ( not ( = ?auto_291398 ?auto_291401 ) ) ( not ( = ?auto_291399 ?auto_291395 ) ) ( not ( = ?auto_291394 ?auto_291401 ) ) ( not ( = ?auto_291398 ?auto_291396 ) ) ( not ( = ?auto_291399 ?auto_291397 ) ) ( not ( = ?auto_291395 ?auto_291397 ) ) ( not ( = ?auto_291396 ?auto_291401 ) ) ( not ( = ?auto_291400 ?auto_291403 ) ) ( not ( = ?auto_291398 ?auto_291390 ) ) ( not ( = ?auto_291399 ?auto_291391 ) ) ( not ( = ?auto_291394 ?auto_291390 ) ) ( not ( = ?auto_291395 ?auto_291391 ) ) ( not ( = ?auto_291397 ?auto_291391 ) ) ( not ( = ?auto_291390 ?auto_291401 ) ) ( not ( = ?auto_291406 ?auto_291404 ) ) ( not ( = ?auto_291406 ?auto_291403 ) ) ( not ( = ?auto_291398 ?auto_291393 ) ) ( not ( = ?auto_291399 ?auto_291392 ) ) ( not ( = ?auto_291394 ?auto_291393 ) ) ( not ( = ?auto_291395 ?auto_291392 ) ) ( not ( = ?auto_291396 ?auto_291393 ) ) ( not ( = ?auto_291397 ?auto_291392 ) ) ( not ( = ?auto_291391 ?auto_291392 ) ) ( not ( = ?auto_291393 ?auto_291401 ) ) ( not ( = ?auto_291405 ?auto_291400 ) ) ( not ( = ?auto_291405 ?auto_291404 ) ) ( not ( = ?auto_291405 ?auto_291403 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_291398 ?auto_291399 ?auto_291394 ?auto_291395 ?auto_291396 ?auto_291397 ?auto_291393 ?auto_291392 ?auto_291390 ?auto_291391 )
      ( GET-5IMAGE-VERIFY ?auto_291390 ?auto_291391 ?auto_291393 ?auto_291392 ?auto_291394 ?auto_291395 ?auto_291396 ?auto_291397 ?auto_291398 ?auto_291399 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_291720 - DIRECTION
      ?auto_291721 - MODE
      ?auto_291723 - DIRECTION
      ?auto_291722 - MODE
      ?auto_291724 - DIRECTION
      ?auto_291725 - MODE
      ?auto_291726 - DIRECTION
      ?auto_291727 - MODE
      ?auto_291728 - DIRECTION
      ?auto_291729 - MODE
    )
    :vars
    (
      ?auto_291735 - INSTRUMENT
      ?auto_291737 - SATELLITE
      ?auto_291732 - DIRECTION
      ?auto_291736 - INSTRUMENT
      ?auto_291730 - INSTRUMENT
      ?auto_291734 - INSTRUMENT
      ?auto_291733 - INSTRUMENT
      ?auto_291731 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_291735 ?auto_291737 ) ( SUPPORTS ?auto_291735 ?auto_291722 ) ( not ( = ?auto_291723 ?auto_291732 ) ) ( CALIBRATION_TARGET ?auto_291735 ?auto_291732 ) ( not ( = ?auto_291732 ?auto_291720 ) ) ( ON_BOARD ?auto_291736 ?auto_291737 ) ( not ( = ?auto_291723 ?auto_291720 ) ) ( not ( = ?auto_291735 ?auto_291736 ) ) ( SUPPORTS ?auto_291736 ?auto_291721 ) ( CALIBRATION_TARGET ?auto_291736 ?auto_291732 ) ( not ( = ?auto_291732 ?auto_291724 ) ) ( ON_BOARD ?auto_291730 ?auto_291737 ) ( not ( = ?auto_291720 ?auto_291724 ) ) ( not ( = ?auto_291736 ?auto_291730 ) ) ( SUPPORTS ?auto_291730 ?auto_291725 ) ( CALIBRATION_TARGET ?auto_291730 ?auto_291732 ) ( not ( = ?auto_291732 ?auto_291728 ) ) ( ON_BOARD ?auto_291734 ?auto_291737 ) ( not ( = ?auto_291724 ?auto_291728 ) ) ( not ( = ?auto_291730 ?auto_291734 ) ) ( SUPPORTS ?auto_291734 ?auto_291729 ) ( CALIBRATION_TARGET ?auto_291734 ?auto_291732 ) ( not ( = ?auto_291732 ?auto_291726 ) ) ( ON_BOARD ?auto_291733 ?auto_291737 ) ( not ( = ?auto_291728 ?auto_291726 ) ) ( not ( = ?auto_291734 ?auto_291733 ) ) ( SUPPORTS ?auto_291733 ?auto_291727 ) ( CALIBRATION_TARGET ?auto_291733 ?auto_291732 ) ( POWER_AVAIL ?auto_291737 ) ( POINTING ?auto_291737 ?auto_291731 ) ( not ( = ?auto_291732 ?auto_291731 ) ) ( not ( = ?auto_291726 ?auto_291731 ) ) ( not ( = ?auto_291727 ?auto_291729 ) ) ( not ( = ?auto_291728 ?auto_291731 ) ) ( not ( = ?auto_291726 ?auto_291724 ) ) ( not ( = ?auto_291727 ?auto_291725 ) ) ( not ( = ?auto_291729 ?auto_291725 ) ) ( not ( = ?auto_291724 ?auto_291731 ) ) ( not ( = ?auto_291730 ?auto_291733 ) ) ( not ( = ?auto_291726 ?auto_291720 ) ) ( not ( = ?auto_291727 ?auto_291721 ) ) ( not ( = ?auto_291728 ?auto_291720 ) ) ( not ( = ?auto_291729 ?auto_291721 ) ) ( not ( = ?auto_291725 ?auto_291721 ) ) ( not ( = ?auto_291720 ?auto_291731 ) ) ( not ( = ?auto_291736 ?auto_291734 ) ) ( not ( = ?auto_291736 ?auto_291733 ) ) ( not ( = ?auto_291726 ?auto_291723 ) ) ( not ( = ?auto_291727 ?auto_291722 ) ) ( not ( = ?auto_291728 ?auto_291723 ) ) ( not ( = ?auto_291729 ?auto_291722 ) ) ( not ( = ?auto_291724 ?auto_291723 ) ) ( not ( = ?auto_291725 ?auto_291722 ) ) ( not ( = ?auto_291721 ?auto_291722 ) ) ( not ( = ?auto_291723 ?auto_291731 ) ) ( not ( = ?auto_291735 ?auto_291730 ) ) ( not ( = ?auto_291735 ?auto_291734 ) ) ( not ( = ?auto_291735 ?auto_291733 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_291726 ?auto_291727 ?auto_291728 ?auto_291729 ?auto_291724 ?auto_291725 ?auto_291723 ?auto_291722 ?auto_291720 ?auto_291721 )
      ( GET-5IMAGE-VERIFY ?auto_291720 ?auto_291721 ?auto_291723 ?auto_291722 ?auto_291724 ?auto_291725 ?auto_291726 ?auto_291727 ?auto_291728 ?auto_291729 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_291798 - DIRECTION
      ?auto_291799 - MODE
      ?auto_291801 - DIRECTION
      ?auto_291800 - MODE
      ?auto_291802 - DIRECTION
      ?auto_291803 - MODE
      ?auto_291804 - DIRECTION
      ?auto_291805 - MODE
      ?auto_291806 - DIRECTION
      ?auto_291807 - MODE
    )
    :vars
    (
      ?auto_291813 - INSTRUMENT
      ?auto_291815 - SATELLITE
      ?auto_291810 - DIRECTION
      ?auto_291814 - INSTRUMENT
      ?auto_291808 - INSTRUMENT
      ?auto_291812 - INSTRUMENT
      ?auto_291811 - INSTRUMENT
      ?auto_291809 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_291813 ?auto_291815 ) ( SUPPORTS ?auto_291813 ?auto_291800 ) ( not ( = ?auto_291801 ?auto_291810 ) ) ( CALIBRATION_TARGET ?auto_291813 ?auto_291810 ) ( not ( = ?auto_291810 ?auto_291798 ) ) ( ON_BOARD ?auto_291814 ?auto_291815 ) ( not ( = ?auto_291801 ?auto_291798 ) ) ( not ( = ?auto_291813 ?auto_291814 ) ) ( SUPPORTS ?auto_291814 ?auto_291799 ) ( CALIBRATION_TARGET ?auto_291814 ?auto_291810 ) ( not ( = ?auto_291810 ?auto_291802 ) ) ( ON_BOARD ?auto_291808 ?auto_291815 ) ( not ( = ?auto_291798 ?auto_291802 ) ) ( not ( = ?auto_291814 ?auto_291808 ) ) ( SUPPORTS ?auto_291808 ?auto_291803 ) ( CALIBRATION_TARGET ?auto_291808 ?auto_291810 ) ( not ( = ?auto_291810 ?auto_291804 ) ) ( ON_BOARD ?auto_291812 ?auto_291815 ) ( not ( = ?auto_291802 ?auto_291804 ) ) ( not ( = ?auto_291808 ?auto_291812 ) ) ( SUPPORTS ?auto_291812 ?auto_291805 ) ( CALIBRATION_TARGET ?auto_291812 ?auto_291810 ) ( not ( = ?auto_291810 ?auto_291806 ) ) ( ON_BOARD ?auto_291811 ?auto_291815 ) ( not ( = ?auto_291804 ?auto_291806 ) ) ( not ( = ?auto_291812 ?auto_291811 ) ) ( SUPPORTS ?auto_291811 ?auto_291807 ) ( CALIBRATION_TARGET ?auto_291811 ?auto_291810 ) ( POWER_AVAIL ?auto_291815 ) ( POINTING ?auto_291815 ?auto_291809 ) ( not ( = ?auto_291810 ?auto_291809 ) ) ( not ( = ?auto_291806 ?auto_291809 ) ) ( not ( = ?auto_291807 ?auto_291805 ) ) ( not ( = ?auto_291804 ?auto_291809 ) ) ( not ( = ?auto_291806 ?auto_291802 ) ) ( not ( = ?auto_291807 ?auto_291803 ) ) ( not ( = ?auto_291805 ?auto_291803 ) ) ( not ( = ?auto_291802 ?auto_291809 ) ) ( not ( = ?auto_291808 ?auto_291811 ) ) ( not ( = ?auto_291806 ?auto_291798 ) ) ( not ( = ?auto_291807 ?auto_291799 ) ) ( not ( = ?auto_291804 ?auto_291798 ) ) ( not ( = ?auto_291805 ?auto_291799 ) ) ( not ( = ?auto_291803 ?auto_291799 ) ) ( not ( = ?auto_291798 ?auto_291809 ) ) ( not ( = ?auto_291814 ?auto_291812 ) ) ( not ( = ?auto_291814 ?auto_291811 ) ) ( not ( = ?auto_291806 ?auto_291801 ) ) ( not ( = ?auto_291807 ?auto_291800 ) ) ( not ( = ?auto_291804 ?auto_291801 ) ) ( not ( = ?auto_291805 ?auto_291800 ) ) ( not ( = ?auto_291802 ?auto_291801 ) ) ( not ( = ?auto_291803 ?auto_291800 ) ) ( not ( = ?auto_291799 ?auto_291800 ) ) ( not ( = ?auto_291801 ?auto_291809 ) ) ( not ( = ?auto_291813 ?auto_291808 ) ) ( not ( = ?auto_291813 ?auto_291812 ) ) ( not ( = ?auto_291813 ?auto_291811 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_291806 ?auto_291807 ?auto_291804 ?auto_291805 ?auto_291802 ?auto_291803 ?auto_291801 ?auto_291800 ?auto_291798 ?auto_291799 )
      ( GET-5IMAGE-VERIFY ?auto_291798 ?auto_291799 ?auto_291801 ?auto_291800 ?auto_291802 ?auto_291803 ?auto_291804 ?auto_291805 ?auto_291806 ?auto_291807 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_294124 - DIRECTION
      ?auto_294125 - MODE
      ?auto_294127 - DIRECTION
      ?auto_294126 - MODE
      ?auto_294128 - DIRECTION
      ?auto_294129 - MODE
      ?auto_294130 - DIRECTION
      ?auto_294131 - MODE
      ?auto_294132 - DIRECTION
      ?auto_294133 - MODE
    )
    :vars
    (
      ?auto_294139 - INSTRUMENT
      ?auto_294141 - SATELLITE
      ?auto_294136 - DIRECTION
      ?auto_294140 - INSTRUMENT
      ?auto_294134 - INSTRUMENT
      ?auto_294138 - INSTRUMENT
      ?auto_294137 - INSTRUMENT
      ?auto_294135 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_294139 ?auto_294141 ) ( SUPPORTS ?auto_294139 ?auto_294125 ) ( not ( = ?auto_294124 ?auto_294136 ) ) ( CALIBRATION_TARGET ?auto_294139 ?auto_294136 ) ( not ( = ?auto_294136 ?auto_294132 ) ) ( ON_BOARD ?auto_294140 ?auto_294141 ) ( not ( = ?auto_294124 ?auto_294132 ) ) ( not ( = ?auto_294139 ?auto_294140 ) ) ( SUPPORTS ?auto_294140 ?auto_294133 ) ( CALIBRATION_TARGET ?auto_294140 ?auto_294136 ) ( not ( = ?auto_294136 ?auto_294130 ) ) ( ON_BOARD ?auto_294134 ?auto_294141 ) ( not ( = ?auto_294132 ?auto_294130 ) ) ( not ( = ?auto_294140 ?auto_294134 ) ) ( SUPPORTS ?auto_294134 ?auto_294131 ) ( CALIBRATION_TARGET ?auto_294134 ?auto_294136 ) ( not ( = ?auto_294136 ?auto_294128 ) ) ( ON_BOARD ?auto_294138 ?auto_294141 ) ( not ( = ?auto_294130 ?auto_294128 ) ) ( not ( = ?auto_294134 ?auto_294138 ) ) ( SUPPORTS ?auto_294138 ?auto_294129 ) ( CALIBRATION_TARGET ?auto_294138 ?auto_294136 ) ( not ( = ?auto_294136 ?auto_294127 ) ) ( ON_BOARD ?auto_294137 ?auto_294141 ) ( not ( = ?auto_294128 ?auto_294127 ) ) ( not ( = ?auto_294138 ?auto_294137 ) ) ( SUPPORTS ?auto_294137 ?auto_294126 ) ( CALIBRATION_TARGET ?auto_294137 ?auto_294136 ) ( POWER_AVAIL ?auto_294141 ) ( POINTING ?auto_294141 ?auto_294135 ) ( not ( = ?auto_294136 ?auto_294135 ) ) ( not ( = ?auto_294127 ?auto_294135 ) ) ( not ( = ?auto_294126 ?auto_294129 ) ) ( not ( = ?auto_294128 ?auto_294135 ) ) ( not ( = ?auto_294127 ?auto_294130 ) ) ( not ( = ?auto_294126 ?auto_294131 ) ) ( not ( = ?auto_294129 ?auto_294131 ) ) ( not ( = ?auto_294130 ?auto_294135 ) ) ( not ( = ?auto_294134 ?auto_294137 ) ) ( not ( = ?auto_294127 ?auto_294132 ) ) ( not ( = ?auto_294126 ?auto_294133 ) ) ( not ( = ?auto_294128 ?auto_294132 ) ) ( not ( = ?auto_294129 ?auto_294133 ) ) ( not ( = ?auto_294131 ?auto_294133 ) ) ( not ( = ?auto_294132 ?auto_294135 ) ) ( not ( = ?auto_294140 ?auto_294138 ) ) ( not ( = ?auto_294140 ?auto_294137 ) ) ( not ( = ?auto_294127 ?auto_294124 ) ) ( not ( = ?auto_294126 ?auto_294125 ) ) ( not ( = ?auto_294128 ?auto_294124 ) ) ( not ( = ?auto_294129 ?auto_294125 ) ) ( not ( = ?auto_294130 ?auto_294124 ) ) ( not ( = ?auto_294131 ?auto_294125 ) ) ( not ( = ?auto_294133 ?auto_294125 ) ) ( not ( = ?auto_294124 ?auto_294135 ) ) ( not ( = ?auto_294139 ?auto_294134 ) ) ( not ( = ?auto_294139 ?auto_294138 ) ) ( not ( = ?auto_294139 ?auto_294137 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_294127 ?auto_294126 ?auto_294128 ?auto_294129 ?auto_294130 ?auto_294131 ?auto_294124 ?auto_294125 ?auto_294132 ?auto_294133 )
      ( GET-5IMAGE-VERIFY ?auto_294124 ?auto_294125 ?auto_294127 ?auto_294126 ?auto_294128 ?auto_294129 ?auto_294130 ?auto_294131 ?auto_294132 ?auto_294133 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_294202 - DIRECTION
      ?auto_294203 - MODE
      ?auto_294205 - DIRECTION
      ?auto_294204 - MODE
      ?auto_294206 - DIRECTION
      ?auto_294207 - MODE
      ?auto_294208 - DIRECTION
      ?auto_294209 - MODE
      ?auto_294210 - DIRECTION
      ?auto_294211 - MODE
    )
    :vars
    (
      ?auto_294217 - INSTRUMENT
      ?auto_294219 - SATELLITE
      ?auto_294214 - DIRECTION
      ?auto_294218 - INSTRUMENT
      ?auto_294212 - INSTRUMENT
      ?auto_294216 - INSTRUMENT
      ?auto_294215 - INSTRUMENT
      ?auto_294213 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_294217 ?auto_294219 ) ( SUPPORTS ?auto_294217 ?auto_294203 ) ( not ( = ?auto_294202 ?auto_294214 ) ) ( CALIBRATION_TARGET ?auto_294217 ?auto_294214 ) ( not ( = ?auto_294214 ?auto_294208 ) ) ( ON_BOARD ?auto_294218 ?auto_294219 ) ( not ( = ?auto_294202 ?auto_294208 ) ) ( not ( = ?auto_294217 ?auto_294218 ) ) ( SUPPORTS ?auto_294218 ?auto_294209 ) ( CALIBRATION_TARGET ?auto_294218 ?auto_294214 ) ( not ( = ?auto_294214 ?auto_294210 ) ) ( ON_BOARD ?auto_294212 ?auto_294219 ) ( not ( = ?auto_294208 ?auto_294210 ) ) ( not ( = ?auto_294218 ?auto_294212 ) ) ( SUPPORTS ?auto_294212 ?auto_294211 ) ( CALIBRATION_TARGET ?auto_294212 ?auto_294214 ) ( not ( = ?auto_294214 ?auto_294206 ) ) ( ON_BOARD ?auto_294216 ?auto_294219 ) ( not ( = ?auto_294210 ?auto_294206 ) ) ( not ( = ?auto_294212 ?auto_294216 ) ) ( SUPPORTS ?auto_294216 ?auto_294207 ) ( CALIBRATION_TARGET ?auto_294216 ?auto_294214 ) ( not ( = ?auto_294214 ?auto_294205 ) ) ( ON_BOARD ?auto_294215 ?auto_294219 ) ( not ( = ?auto_294206 ?auto_294205 ) ) ( not ( = ?auto_294216 ?auto_294215 ) ) ( SUPPORTS ?auto_294215 ?auto_294204 ) ( CALIBRATION_TARGET ?auto_294215 ?auto_294214 ) ( POWER_AVAIL ?auto_294219 ) ( POINTING ?auto_294219 ?auto_294213 ) ( not ( = ?auto_294214 ?auto_294213 ) ) ( not ( = ?auto_294205 ?auto_294213 ) ) ( not ( = ?auto_294204 ?auto_294207 ) ) ( not ( = ?auto_294206 ?auto_294213 ) ) ( not ( = ?auto_294205 ?auto_294210 ) ) ( not ( = ?auto_294204 ?auto_294211 ) ) ( not ( = ?auto_294207 ?auto_294211 ) ) ( not ( = ?auto_294210 ?auto_294213 ) ) ( not ( = ?auto_294212 ?auto_294215 ) ) ( not ( = ?auto_294205 ?auto_294208 ) ) ( not ( = ?auto_294204 ?auto_294209 ) ) ( not ( = ?auto_294206 ?auto_294208 ) ) ( not ( = ?auto_294207 ?auto_294209 ) ) ( not ( = ?auto_294211 ?auto_294209 ) ) ( not ( = ?auto_294208 ?auto_294213 ) ) ( not ( = ?auto_294218 ?auto_294216 ) ) ( not ( = ?auto_294218 ?auto_294215 ) ) ( not ( = ?auto_294205 ?auto_294202 ) ) ( not ( = ?auto_294204 ?auto_294203 ) ) ( not ( = ?auto_294206 ?auto_294202 ) ) ( not ( = ?auto_294207 ?auto_294203 ) ) ( not ( = ?auto_294210 ?auto_294202 ) ) ( not ( = ?auto_294211 ?auto_294203 ) ) ( not ( = ?auto_294209 ?auto_294203 ) ) ( not ( = ?auto_294202 ?auto_294213 ) ) ( not ( = ?auto_294217 ?auto_294212 ) ) ( not ( = ?auto_294217 ?auto_294216 ) ) ( not ( = ?auto_294217 ?auto_294215 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_294205 ?auto_294204 ?auto_294206 ?auto_294207 ?auto_294210 ?auto_294211 ?auto_294202 ?auto_294203 ?auto_294208 ?auto_294209 )
      ( GET-5IMAGE-VERIFY ?auto_294202 ?auto_294203 ?auto_294205 ?auto_294204 ?auto_294206 ?auto_294207 ?auto_294208 ?auto_294209 ?auto_294210 ?auto_294211 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_294532 - DIRECTION
      ?auto_294533 - MODE
      ?auto_294535 - DIRECTION
      ?auto_294534 - MODE
      ?auto_294536 - DIRECTION
      ?auto_294537 - MODE
      ?auto_294538 - DIRECTION
      ?auto_294539 - MODE
      ?auto_294540 - DIRECTION
      ?auto_294541 - MODE
    )
    :vars
    (
      ?auto_294547 - INSTRUMENT
      ?auto_294549 - SATELLITE
      ?auto_294544 - DIRECTION
      ?auto_294548 - INSTRUMENT
      ?auto_294542 - INSTRUMENT
      ?auto_294546 - INSTRUMENT
      ?auto_294545 - INSTRUMENT
      ?auto_294543 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_294547 ?auto_294549 ) ( SUPPORTS ?auto_294547 ?auto_294533 ) ( not ( = ?auto_294532 ?auto_294544 ) ) ( CALIBRATION_TARGET ?auto_294547 ?auto_294544 ) ( not ( = ?auto_294544 ?auto_294540 ) ) ( ON_BOARD ?auto_294548 ?auto_294549 ) ( not ( = ?auto_294532 ?auto_294540 ) ) ( not ( = ?auto_294547 ?auto_294548 ) ) ( SUPPORTS ?auto_294548 ?auto_294541 ) ( CALIBRATION_TARGET ?auto_294548 ?auto_294544 ) ( not ( = ?auto_294544 ?auto_294536 ) ) ( ON_BOARD ?auto_294542 ?auto_294549 ) ( not ( = ?auto_294540 ?auto_294536 ) ) ( not ( = ?auto_294548 ?auto_294542 ) ) ( SUPPORTS ?auto_294542 ?auto_294537 ) ( CALIBRATION_TARGET ?auto_294542 ?auto_294544 ) ( not ( = ?auto_294544 ?auto_294538 ) ) ( ON_BOARD ?auto_294546 ?auto_294549 ) ( not ( = ?auto_294536 ?auto_294538 ) ) ( not ( = ?auto_294542 ?auto_294546 ) ) ( SUPPORTS ?auto_294546 ?auto_294539 ) ( CALIBRATION_TARGET ?auto_294546 ?auto_294544 ) ( not ( = ?auto_294544 ?auto_294535 ) ) ( ON_BOARD ?auto_294545 ?auto_294549 ) ( not ( = ?auto_294538 ?auto_294535 ) ) ( not ( = ?auto_294546 ?auto_294545 ) ) ( SUPPORTS ?auto_294545 ?auto_294534 ) ( CALIBRATION_TARGET ?auto_294545 ?auto_294544 ) ( POWER_AVAIL ?auto_294549 ) ( POINTING ?auto_294549 ?auto_294543 ) ( not ( = ?auto_294544 ?auto_294543 ) ) ( not ( = ?auto_294535 ?auto_294543 ) ) ( not ( = ?auto_294534 ?auto_294539 ) ) ( not ( = ?auto_294538 ?auto_294543 ) ) ( not ( = ?auto_294535 ?auto_294536 ) ) ( not ( = ?auto_294534 ?auto_294537 ) ) ( not ( = ?auto_294539 ?auto_294537 ) ) ( not ( = ?auto_294536 ?auto_294543 ) ) ( not ( = ?auto_294542 ?auto_294545 ) ) ( not ( = ?auto_294535 ?auto_294540 ) ) ( not ( = ?auto_294534 ?auto_294541 ) ) ( not ( = ?auto_294538 ?auto_294540 ) ) ( not ( = ?auto_294539 ?auto_294541 ) ) ( not ( = ?auto_294537 ?auto_294541 ) ) ( not ( = ?auto_294540 ?auto_294543 ) ) ( not ( = ?auto_294548 ?auto_294546 ) ) ( not ( = ?auto_294548 ?auto_294545 ) ) ( not ( = ?auto_294535 ?auto_294532 ) ) ( not ( = ?auto_294534 ?auto_294533 ) ) ( not ( = ?auto_294538 ?auto_294532 ) ) ( not ( = ?auto_294539 ?auto_294533 ) ) ( not ( = ?auto_294536 ?auto_294532 ) ) ( not ( = ?auto_294537 ?auto_294533 ) ) ( not ( = ?auto_294541 ?auto_294533 ) ) ( not ( = ?auto_294532 ?auto_294543 ) ) ( not ( = ?auto_294547 ?auto_294542 ) ) ( not ( = ?auto_294547 ?auto_294546 ) ) ( not ( = ?auto_294547 ?auto_294545 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_294535 ?auto_294534 ?auto_294538 ?auto_294539 ?auto_294536 ?auto_294537 ?auto_294532 ?auto_294533 ?auto_294540 ?auto_294541 )
      ( GET-5IMAGE-VERIFY ?auto_294532 ?auto_294533 ?auto_294535 ?auto_294534 ?auto_294536 ?auto_294537 ?auto_294538 ?auto_294539 ?auto_294540 ?auto_294541 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_294696 - DIRECTION
      ?auto_294697 - MODE
      ?auto_294699 - DIRECTION
      ?auto_294698 - MODE
      ?auto_294700 - DIRECTION
      ?auto_294701 - MODE
      ?auto_294702 - DIRECTION
      ?auto_294703 - MODE
      ?auto_294704 - DIRECTION
      ?auto_294705 - MODE
    )
    :vars
    (
      ?auto_294711 - INSTRUMENT
      ?auto_294713 - SATELLITE
      ?auto_294708 - DIRECTION
      ?auto_294712 - INSTRUMENT
      ?auto_294706 - INSTRUMENT
      ?auto_294710 - INSTRUMENT
      ?auto_294709 - INSTRUMENT
      ?auto_294707 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_294711 ?auto_294713 ) ( SUPPORTS ?auto_294711 ?auto_294697 ) ( not ( = ?auto_294696 ?auto_294708 ) ) ( CALIBRATION_TARGET ?auto_294711 ?auto_294708 ) ( not ( = ?auto_294708 ?auto_294702 ) ) ( ON_BOARD ?auto_294712 ?auto_294713 ) ( not ( = ?auto_294696 ?auto_294702 ) ) ( not ( = ?auto_294711 ?auto_294712 ) ) ( SUPPORTS ?auto_294712 ?auto_294703 ) ( CALIBRATION_TARGET ?auto_294712 ?auto_294708 ) ( not ( = ?auto_294708 ?auto_294700 ) ) ( ON_BOARD ?auto_294706 ?auto_294713 ) ( not ( = ?auto_294702 ?auto_294700 ) ) ( not ( = ?auto_294712 ?auto_294706 ) ) ( SUPPORTS ?auto_294706 ?auto_294701 ) ( CALIBRATION_TARGET ?auto_294706 ?auto_294708 ) ( not ( = ?auto_294708 ?auto_294704 ) ) ( ON_BOARD ?auto_294710 ?auto_294713 ) ( not ( = ?auto_294700 ?auto_294704 ) ) ( not ( = ?auto_294706 ?auto_294710 ) ) ( SUPPORTS ?auto_294710 ?auto_294705 ) ( CALIBRATION_TARGET ?auto_294710 ?auto_294708 ) ( not ( = ?auto_294708 ?auto_294699 ) ) ( ON_BOARD ?auto_294709 ?auto_294713 ) ( not ( = ?auto_294704 ?auto_294699 ) ) ( not ( = ?auto_294710 ?auto_294709 ) ) ( SUPPORTS ?auto_294709 ?auto_294698 ) ( CALIBRATION_TARGET ?auto_294709 ?auto_294708 ) ( POWER_AVAIL ?auto_294713 ) ( POINTING ?auto_294713 ?auto_294707 ) ( not ( = ?auto_294708 ?auto_294707 ) ) ( not ( = ?auto_294699 ?auto_294707 ) ) ( not ( = ?auto_294698 ?auto_294705 ) ) ( not ( = ?auto_294704 ?auto_294707 ) ) ( not ( = ?auto_294699 ?auto_294700 ) ) ( not ( = ?auto_294698 ?auto_294701 ) ) ( not ( = ?auto_294705 ?auto_294701 ) ) ( not ( = ?auto_294700 ?auto_294707 ) ) ( not ( = ?auto_294706 ?auto_294709 ) ) ( not ( = ?auto_294699 ?auto_294702 ) ) ( not ( = ?auto_294698 ?auto_294703 ) ) ( not ( = ?auto_294704 ?auto_294702 ) ) ( not ( = ?auto_294705 ?auto_294703 ) ) ( not ( = ?auto_294701 ?auto_294703 ) ) ( not ( = ?auto_294702 ?auto_294707 ) ) ( not ( = ?auto_294712 ?auto_294710 ) ) ( not ( = ?auto_294712 ?auto_294709 ) ) ( not ( = ?auto_294699 ?auto_294696 ) ) ( not ( = ?auto_294698 ?auto_294697 ) ) ( not ( = ?auto_294704 ?auto_294696 ) ) ( not ( = ?auto_294705 ?auto_294697 ) ) ( not ( = ?auto_294700 ?auto_294696 ) ) ( not ( = ?auto_294701 ?auto_294697 ) ) ( not ( = ?auto_294703 ?auto_294697 ) ) ( not ( = ?auto_294696 ?auto_294707 ) ) ( not ( = ?auto_294711 ?auto_294706 ) ) ( not ( = ?auto_294711 ?auto_294710 ) ) ( not ( = ?auto_294711 ?auto_294709 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_294699 ?auto_294698 ?auto_294704 ?auto_294705 ?auto_294700 ?auto_294701 ?auto_294696 ?auto_294697 ?auto_294702 ?auto_294703 )
      ( GET-5IMAGE-VERIFY ?auto_294696 ?auto_294697 ?auto_294699 ?auto_294698 ?auto_294700 ?auto_294701 ?auto_294702 ?auto_294703 ?auto_294704 ?auto_294705 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_295026 - DIRECTION
      ?auto_295027 - MODE
      ?auto_295029 - DIRECTION
      ?auto_295028 - MODE
      ?auto_295030 - DIRECTION
      ?auto_295031 - MODE
      ?auto_295032 - DIRECTION
      ?auto_295033 - MODE
      ?auto_295034 - DIRECTION
      ?auto_295035 - MODE
    )
    :vars
    (
      ?auto_295041 - INSTRUMENT
      ?auto_295043 - SATELLITE
      ?auto_295038 - DIRECTION
      ?auto_295042 - INSTRUMENT
      ?auto_295036 - INSTRUMENT
      ?auto_295040 - INSTRUMENT
      ?auto_295039 - INSTRUMENT
      ?auto_295037 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_295041 ?auto_295043 ) ( SUPPORTS ?auto_295041 ?auto_295027 ) ( not ( = ?auto_295026 ?auto_295038 ) ) ( CALIBRATION_TARGET ?auto_295041 ?auto_295038 ) ( not ( = ?auto_295038 ?auto_295030 ) ) ( ON_BOARD ?auto_295042 ?auto_295043 ) ( not ( = ?auto_295026 ?auto_295030 ) ) ( not ( = ?auto_295041 ?auto_295042 ) ) ( SUPPORTS ?auto_295042 ?auto_295031 ) ( CALIBRATION_TARGET ?auto_295042 ?auto_295038 ) ( not ( = ?auto_295038 ?auto_295034 ) ) ( ON_BOARD ?auto_295036 ?auto_295043 ) ( not ( = ?auto_295030 ?auto_295034 ) ) ( not ( = ?auto_295042 ?auto_295036 ) ) ( SUPPORTS ?auto_295036 ?auto_295035 ) ( CALIBRATION_TARGET ?auto_295036 ?auto_295038 ) ( not ( = ?auto_295038 ?auto_295032 ) ) ( ON_BOARD ?auto_295040 ?auto_295043 ) ( not ( = ?auto_295034 ?auto_295032 ) ) ( not ( = ?auto_295036 ?auto_295040 ) ) ( SUPPORTS ?auto_295040 ?auto_295033 ) ( CALIBRATION_TARGET ?auto_295040 ?auto_295038 ) ( not ( = ?auto_295038 ?auto_295029 ) ) ( ON_BOARD ?auto_295039 ?auto_295043 ) ( not ( = ?auto_295032 ?auto_295029 ) ) ( not ( = ?auto_295040 ?auto_295039 ) ) ( SUPPORTS ?auto_295039 ?auto_295028 ) ( CALIBRATION_TARGET ?auto_295039 ?auto_295038 ) ( POWER_AVAIL ?auto_295043 ) ( POINTING ?auto_295043 ?auto_295037 ) ( not ( = ?auto_295038 ?auto_295037 ) ) ( not ( = ?auto_295029 ?auto_295037 ) ) ( not ( = ?auto_295028 ?auto_295033 ) ) ( not ( = ?auto_295032 ?auto_295037 ) ) ( not ( = ?auto_295029 ?auto_295034 ) ) ( not ( = ?auto_295028 ?auto_295035 ) ) ( not ( = ?auto_295033 ?auto_295035 ) ) ( not ( = ?auto_295034 ?auto_295037 ) ) ( not ( = ?auto_295036 ?auto_295039 ) ) ( not ( = ?auto_295029 ?auto_295030 ) ) ( not ( = ?auto_295028 ?auto_295031 ) ) ( not ( = ?auto_295032 ?auto_295030 ) ) ( not ( = ?auto_295033 ?auto_295031 ) ) ( not ( = ?auto_295035 ?auto_295031 ) ) ( not ( = ?auto_295030 ?auto_295037 ) ) ( not ( = ?auto_295042 ?auto_295040 ) ) ( not ( = ?auto_295042 ?auto_295039 ) ) ( not ( = ?auto_295029 ?auto_295026 ) ) ( not ( = ?auto_295028 ?auto_295027 ) ) ( not ( = ?auto_295032 ?auto_295026 ) ) ( not ( = ?auto_295033 ?auto_295027 ) ) ( not ( = ?auto_295034 ?auto_295026 ) ) ( not ( = ?auto_295035 ?auto_295027 ) ) ( not ( = ?auto_295031 ?auto_295027 ) ) ( not ( = ?auto_295026 ?auto_295037 ) ) ( not ( = ?auto_295041 ?auto_295036 ) ) ( not ( = ?auto_295041 ?auto_295040 ) ) ( not ( = ?auto_295041 ?auto_295039 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_295029 ?auto_295028 ?auto_295032 ?auto_295033 ?auto_295034 ?auto_295035 ?auto_295026 ?auto_295027 ?auto_295030 ?auto_295031 )
      ( GET-5IMAGE-VERIFY ?auto_295026 ?auto_295027 ?auto_295029 ?auto_295028 ?auto_295030 ?auto_295031 ?auto_295032 ?auto_295033 ?auto_295034 ?auto_295035 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_295104 - DIRECTION
      ?auto_295105 - MODE
      ?auto_295107 - DIRECTION
      ?auto_295106 - MODE
      ?auto_295108 - DIRECTION
      ?auto_295109 - MODE
      ?auto_295110 - DIRECTION
      ?auto_295111 - MODE
      ?auto_295112 - DIRECTION
      ?auto_295113 - MODE
    )
    :vars
    (
      ?auto_295119 - INSTRUMENT
      ?auto_295121 - SATELLITE
      ?auto_295116 - DIRECTION
      ?auto_295120 - INSTRUMENT
      ?auto_295114 - INSTRUMENT
      ?auto_295118 - INSTRUMENT
      ?auto_295117 - INSTRUMENT
      ?auto_295115 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_295119 ?auto_295121 ) ( SUPPORTS ?auto_295119 ?auto_295105 ) ( not ( = ?auto_295104 ?auto_295116 ) ) ( CALIBRATION_TARGET ?auto_295119 ?auto_295116 ) ( not ( = ?auto_295116 ?auto_295108 ) ) ( ON_BOARD ?auto_295120 ?auto_295121 ) ( not ( = ?auto_295104 ?auto_295108 ) ) ( not ( = ?auto_295119 ?auto_295120 ) ) ( SUPPORTS ?auto_295120 ?auto_295109 ) ( CALIBRATION_TARGET ?auto_295120 ?auto_295116 ) ( not ( = ?auto_295116 ?auto_295110 ) ) ( ON_BOARD ?auto_295114 ?auto_295121 ) ( not ( = ?auto_295108 ?auto_295110 ) ) ( not ( = ?auto_295120 ?auto_295114 ) ) ( SUPPORTS ?auto_295114 ?auto_295111 ) ( CALIBRATION_TARGET ?auto_295114 ?auto_295116 ) ( not ( = ?auto_295116 ?auto_295112 ) ) ( ON_BOARD ?auto_295118 ?auto_295121 ) ( not ( = ?auto_295110 ?auto_295112 ) ) ( not ( = ?auto_295114 ?auto_295118 ) ) ( SUPPORTS ?auto_295118 ?auto_295113 ) ( CALIBRATION_TARGET ?auto_295118 ?auto_295116 ) ( not ( = ?auto_295116 ?auto_295107 ) ) ( ON_BOARD ?auto_295117 ?auto_295121 ) ( not ( = ?auto_295112 ?auto_295107 ) ) ( not ( = ?auto_295118 ?auto_295117 ) ) ( SUPPORTS ?auto_295117 ?auto_295106 ) ( CALIBRATION_TARGET ?auto_295117 ?auto_295116 ) ( POWER_AVAIL ?auto_295121 ) ( POINTING ?auto_295121 ?auto_295115 ) ( not ( = ?auto_295116 ?auto_295115 ) ) ( not ( = ?auto_295107 ?auto_295115 ) ) ( not ( = ?auto_295106 ?auto_295113 ) ) ( not ( = ?auto_295112 ?auto_295115 ) ) ( not ( = ?auto_295107 ?auto_295110 ) ) ( not ( = ?auto_295106 ?auto_295111 ) ) ( not ( = ?auto_295113 ?auto_295111 ) ) ( not ( = ?auto_295110 ?auto_295115 ) ) ( not ( = ?auto_295114 ?auto_295117 ) ) ( not ( = ?auto_295107 ?auto_295108 ) ) ( not ( = ?auto_295106 ?auto_295109 ) ) ( not ( = ?auto_295112 ?auto_295108 ) ) ( not ( = ?auto_295113 ?auto_295109 ) ) ( not ( = ?auto_295111 ?auto_295109 ) ) ( not ( = ?auto_295108 ?auto_295115 ) ) ( not ( = ?auto_295120 ?auto_295118 ) ) ( not ( = ?auto_295120 ?auto_295117 ) ) ( not ( = ?auto_295107 ?auto_295104 ) ) ( not ( = ?auto_295106 ?auto_295105 ) ) ( not ( = ?auto_295112 ?auto_295104 ) ) ( not ( = ?auto_295113 ?auto_295105 ) ) ( not ( = ?auto_295110 ?auto_295104 ) ) ( not ( = ?auto_295111 ?auto_295105 ) ) ( not ( = ?auto_295109 ?auto_295105 ) ) ( not ( = ?auto_295104 ?auto_295115 ) ) ( not ( = ?auto_295119 ?auto_295114 ) ) ( not ( = ?auto_295119 ?auto_295118 ) ) ( not ( = ?auto_295119 ?auto_295117 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_295107 ?auto_295106 ?auto_295112 ?auto_295113 ?auto_295110 ?auto_295111 ?auto_295104 ?auto_295105 ?auto_295108 ?auto_295109 )
      ( GET-5IMAGE-VERIFY ?auto_295104 ?auto_295105 ?auto_295107 ?auto_295106 ?auto_295108 ?auto_295109 ?auto_295110 ?auto_295111 ?auto_295112 ?auto_295113 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_296212 - DIRECTION
      ?auto_296213 - MODE
      ?auto_296215 - DIRECTION
      ?auto_296214 - MODE
      ?auto_296216 - DIRECTION
      ?auto_296217 - MODE
      ?auto_296218 - DIRECTION
      ?auto_296219 - MODE
      ?auto_296220 - DIRECTION
      ?auto_296221 - MODE
    )
    :vars
    (
      ?auto_296227 - INSTRUMENT
      ?auto_296229 - SATELLITE
      ?auto_296224 - DIRECTION
      ?auto_296228 - INSTRUMENT
      ?auto_296222 - INSTRUMENT
      ?auto_296226 - INSTRUMENT
      ?auto_296225 - INSTRUMENT
      ?auto_296223 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_296227 ?auto_296229 ) ( SUPPORTS ?auto_296227 ?auto_296213 ) ( not ( = ?auto_296212 ?auto_296224 ) ) ( CALIBRATION_TARGET ?auto_296227 ?auto_296224 ) ( not ( = ?auto_296224 ?auto_296220 ) ) ( ON_BOARD ?auto_296228 ?auto_296229 ) ( not ( = ?auto_296212 ?auto_296220 ) ) ( not ( = ?auto_296227 ?auto_296228 ) ) ( SUPPORTS ?auto_296228 ?auto_296221 ) ( CALIBRATION_TARGET ?auto_296228 ?auto_296224 ) ( not ( = ?auto_296224 ?auto_296218 ) ) ( ON_BOARD ?auto_296222 ?auto_296229 ) ( not ( = ?auto_296220 ?auto_296218 ) ) ( not ( = ?auto_296228 ?auto_296222 ) ) ( SUPPORTS ?auto_296222 ?auto_296219 ) ( CALIBRATION_TARGET ?auto_296222 ?auto_296224 ) ( not ( = ?auto_296224 ?auto_296215 ) ) ( ON_BOARD ?auto_296226 ?auto_296229 ) ( not ( = ?auto_296218 ?auto_296215 ) ) ( not ( = ?auto_296222 ?auto_296226 ) ) ( SUPPORTS ?auto_296226 ?auto_296214 ) ( CALIBRATION_TARGET ?auto_296226 ?auto_296224 ) ( not ( = ?auto_296224 ?auto_296216 ) ) ( ON_BOARD ?auto_296225 ?auto_296229 ) ( not ( = ?auto_296215 ?auto_296216 ) ) ( not ( = ?auto_296226 ?auto_296225 ) ) ( SUPPORTS ?auto_296225 ?auto_296217 ) ( CALIBRATION_TARGET ?auto_296225 ?auto_296224 ) ( POWER_AVAIL ?auto_296229 ) ( POINTING ?auto_296229 ?auto_296223 ) ( not ( = ?auto_296224 ?auto_296223 ) ) ( not ( = ?auto_296216 ?auto_296223 ) ) ( not ( = ?auto_296217 ?auto_296214 ) ) ( not ( = ?auto_296215 ?auto_296223 ) ) ( not ( = ?auto_296216 ?auto_296218 ) ) ( not ( = ?auto_296217 ?auto_296219 ) ) ( not ( = ?auto_296214 ?auto_296219 ) ) ( not ( = ?auto_296218 ?auto_296223 ) ) ( not ( = ?auto_296222 ?auto_296225 ) ) ( not ( = ?auto_296216 ?auto_296220 ) ) ( not ( = ?auto_296217 ?auto_296221 ) ) ( not ( = ?auto_296215 ?auto_296220 ) ) ( not ( = ?auto_296214 ?auto_296221 ) ) ( not ( = ?auto_296219 ?auto_296221 ) ) ( not ( = ?auto_296220 ?auto_296223 ) ) ( not ( = ?auto_296228 ?auto_296226 ) ) ( not ( = ?auto_296228 ?auto_296225 ) ) ( not ( = ?auto_296216 ?auto_296212 ) ) ( not ( = ?auto_296217 ?auto_296213 ) ) ( not ( = ?auto_296215 ?auto_296212 ) ) ( not ( = ?auto_296214 ?auto_296213 ) ) ( not ( = ?auto_296218 ?auto_296212 ) ) ( not ( = ?auto_296219 ?auto_296213 ) ) ( not ( = ?auto_296221 ?auto_296213 ) ) ( not ( = ?auto_296212 ?auto_296223 ) ) ( not ( = ?auto_296227 ?auto_296222 ) ) ( not ( = ?auto_296227 ?auto_296226 ) ) ( not ( = ?auto_296227 ?auto_296225 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_296216 ?auto_296217 ?auto_296215 ?auto_296214 ?auto_296218 ?auto_296219 ?auto_296212 ?auto_296213 ?auto_296220 ?auto_296221 )
      ( GET-5IMAGE-VERIFY ?auto_296212 ?auto_296213 ?auto_296215 ?auto_296214 ?auto_296216 ?auto_296217 ?auto_296218 ?auto_296219 ?auto_296220 ?auto_296221 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_296290 - DIRECTION
      ?auto_296291 - MODE
      ?auto_296293 - DIRECTION
      ?auto_296292 - MODE
      ?auto_296294 - DIRECTION
      ?auto_296295 - MODE
      ?auto_296296 - DIRECTION
      ?auto_296297 - MODE
      ?auto_296298 - DIRECTION
      ?auto_296299 - MODE
    )
    :vars
    (
      ?auto_296305 - INSTRUMENT
      ?auto_296307 - SATELLITE
      ?auto_296302 - DIRECTION
      ?auto_296306 - INSTRUMENT
      ?auto_296300 - INSTRUMENT
      ?auto_296304 - INSTRUMENT
      ?auto_296303 - INSTRUMENT
      ?auto_296301 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_296305 ?auto_296307 ) ( SUPPORTS ?auto_296305 ?auto_296291 ) ( not ( = ?auto_296290 ?auto_296302 ) ) ( CALIBRATION_TARGET ?auto_296305 ?auto_296302 ) ( not ( = ?auto_296302 ?auto_296296 ) ) ( ON_BOARD ?auto_296306 ?auto_296307 ) ( not ( = ?auto_296290 ?auto_296296 ) ) ( not ( = ?auto_296305 ?auto_296306 ) ) ( SUPPORTS ?auto_296306 ?auto_296297 ) ( CALIBRATION_TARGET ?auto_296306 ?auto_296302 ) ( not ( = ?auto_296302 ?auto_296298 ) ) ( ON_BOARD ?auto_296300 ?auto_296307 ) ( not ( = ?auto_296296 ?auto_296298 ) ) ( not ( = ?auto_296306 ?auto_296300 ) ) ( SUPPORTS ?auto_296300 ?auto_296299 ) ( CALIBRATION_TARGET ?auto_296300 ?auto_296302 ) ( not ( = ?auto_296302 ?auto_296293 ) ) ( ON_BOARD ?auto_296304 ?auto_296307 ) ( not ( = ?auto_296298 ?auto_296293 ) ) ( not ( = ?auto_296300 ?auto_296304 ) ) ( SUPPORTS ?auto_296304 ?auto_296292 ) ( CALIBRATION_TARGET ?auto_296304 ?auto_296302 ) ( not ( = ?auto_296302 ?auto_296294 ) ) ( ON_BOARD ?auto_296303 ?auto_296307 ) ( not ( = ?auto_296293 ?auto_296294 ) ) ( not ( = ?auto_296304 ?auto_296303 ) ) ( SUPPORTS ?auto_296303 ?auto_296295 ) ( CALIBRATION_TARGET ?auto_296303 ?auto_296302 ) ( POWER_AVAIL ?auto_296307 ) ( POINTING ?auto_296307 ?auto_296301 ) ( not ( = ?auto_296302 ?auto_296301 ) ) ( not ( = ?auto_296294 ?auto_296301 ) ) ( not ( = ?auto_296295 ?auto_296292 ) ) ( not ( = ?auto_296293 ?auto_296301 ) ) ( not ( = ?auto_296294 ?auto_296298 ) ) ( not ( = ?auto_296295 ?auto_296299 ) ) ( not ( = ?auto_296292 ?auto_296299 ) ) ( not ( = ?auto_296298 ?auto_296301 ) ) ( not ( = ?auto_296300 ?auto_296303 ) ) ( not ( = ?auto_296294 ?auto_296296 ) ) ( not ( = ?auto_296295 ?auto_296297 ) ) ( not ( = ?auto_296293 ?auto_296296 ) ) ( not ( = ?auto_296292 ?auto_296297 ) ) ( not ( = ?auto_296299 ?auto_296297 ) ) ( not ( = ?auto_296296 ?auto_296301 ) ) ( not ( = ?auto_296306 ?auto_296304 ) ) ( not ( = ?auto_296306 ?auto_296303 ) ) ( not ( = ?auto_296294 ?auto_296290 ) ) ( not ( = ?auto_296295 ?auto_296291 ) ) ( not ( = ?auto_296293 ?auto_296290 ) ) ( not ( = ?auto_296292 ?auto_296291 ) ) ( not ( = ?auto_296298 ?auto_296290 ) ) ( not ( = ?auto_296299 ?auto_296291 ) ) ( not ( = ?auto_296297 ?auto_296291 ) ) ( not ( = ?auto_296290 ?auto_296301 ) ) ( not ( = ?auto_296305 ?auto_296300 ) ) ( not ( = ?auto_296305 ?auto_296304 ) ) ( not ( = ?auto_296305 ?auto_296303 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_296294 ?auto_296295 ?auto_296293 ?auto_296292 ?auto_296298 ?auto_296299 ?auto_296290 ?auto_296291 ?auto_296296 ?auto_296297 )
      ( GET-5IMAGE-VERIFY ?auto_296290 ?auto_296291 ?auto_296293 ?auto_296292 ?auto_296294 ?auto_296295 ?auto_296296 ?auto_296297 ?auto_296298 ?auto_296299 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_297060 - DIRECTION
      ?auto_297061 - MODE
      ?auto_297063 - DIRECTION
      ?auto_297062 - MODE
      ?auto_297064 - DIRECTION
      ?auto_297065 - MODE
      ?auto_297066 - DIRECTION
      ?auto_297067 - MODE
      ?auto_297068 - DIRECTION
      ?auto_297069 - MODE
    )
    :vars
    (
      ?auto_297075 - INSTRUMENT
      ?auto_297077 - SATELLITE
      ?auto_297072 - DIRECTION
      ?auto_297076 - INSTRUMENT
      ?auto_297070 - INSTRUMENT
      ?auto_297074 - INSTRUMENT
      ?auto_297073 - INSTRUMENT
      ?auto_297071 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_297075 ?auto_297077 ) ( SUPPORTS ?auto_297075 ?auto_297061 ) ( not ( = ?auto_297060 ?auto_297072 ) ) ( CALIBRATION_TARGET ?auto_297075 ?auto_297072 ) ( not ( = ?auto_297072 ?auto_297068 ) ) ( ON_BOARD ?auto_297076 ?auto_297077 ) ( not ( = ?auto_297060 ?auto_297068 ) ) ( not ( = ?auto_297075 ?auto_297076 ) ) ( SUPPORTS ?auto_297076 ?auto_297069 ) ( CALIBRATION_TARGET ?auto_297076 ?auto_297072 ) ( not ( = ?auto_297072 ?auto_297064 ) ) ( ON_BOARD ?auto_297070 ?auto_297077 ) ( not ( = ?auto_297068 ?auto_297064 ) ) ( not ( = ?auto_297076 ?auto_297070 ) ) ( SUPPORTS ?auto_297070 ?auto_297065 ) ( CALIBRATION_TARGET ?auto_297070 ?auto_297072 ) ( not ( = ?auto_297072 ?auto_297063 ) ) ( ON_BOARD ?auto_297074 ?auto_297077 ) ( not ( = ?auto_297064 ?auto_297063 ) ) ( not ( = ?auto_297070 ?auto_297074 ) ) ( SUPPORTS ?auto_297074 ?auto_297062 ) ( CALIBRATION_TARGET ?auto_297074 ?auto_297072 ) ( not ( = ?auto_297072 ?auto_297066 ) ) ( ON_BOARD ?auto_297073 ?auto_297077 ) ( not ( = ?auto_297063 ?auto_297066 ) ) ( not ( = ?auto_297074 ?auto_297073 ) ) ( SUPPORTS ?auto_297073 ?auto_297067 ) ( CALIBRATION_TARGET ?auto_297073 ?auto_297072 ) ( POWER_AVAIL ?auto_297077 ) ( POINTING ?auto_297077 ?auto_297071 ) ( not ( = ?auto_297072 ?auto_297071 ) ) ( not ( = ?auto_297066 ?auto_297071 ) ) ( not ( = ?auto_297067 ?auto_297062 ) ) ( not ( = ?auto_297063 ?auto_297071 ) ) ( not ( = ?auto_297066 ?auto_297064 ) ) ( not ( = ?auto_297067 ?auto_297065 ) ) ( not ( = ?auto_297062 ?auto_297065 ) ) ( not ( = ?auto_297064 ?auto_297071 ) ) ( not ( = ?auto_297070 ?auto_297073 ) ) ( not ( = ?auto_297066 ?auto_297068 ) ) ( not ( = ?auto_297067 ?auto_297069 ) ) ( not ( = ?auto_297063 ?auto_297068 ) ) ( not ( = ?auto_297062 ?auto_297069 ) ) ( not ( = ?auto_297065 ?auto_297069 ) ) ( not ( = ?auto_297068 ?auto_297071 ) ) ( not ( = ?auto_297076 ?auto_297074 ) ) ( not ( = ?auto_297076 ?auto_297073 ) ) ( not ( = ?auto_297066 ?auto_297060 ) ) ( not ( = ?auto_297067 ?auto_297061 ) ) ( not ( = ?auto_297063 ?auto_297060 ) ) ( not ( = ?auto_297062 ?auto_297061 ) ) ( not ( = ?auto_297064 ?auto_297060 ) ) ( not ( = ?auto_297065 ?auto_297061 ) ) ( not ( = ?auto_297069 ?auto_297061 ) ) ( not ( = ?auto_297060 ?auto_297071 ) ) ( not ( = ?auto_297075 ?auto_297070 ) ) ( not ( = ?auto_297075 ?auto_297074 ) ) ( not ( = ?auto_297075 ?auto_297073 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_297066 ?auto_297067 ?auto_297063 ?auto_297062 ?auto_297064 ?auto_297065 ?auto_297060 ?auto_297061 ?auto_297068 ?auto_297069 )
      ( GET-5IMAGE-VERIFY ?auto_297060 ?auto_297061 ?auto_297063 ?auto_297062 ?auto_297064 ?auto_297065 ?auto_297066 ?auto_297067 ?auto_297068 ?auto_297069 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_297310 - DIRECTION
      ?auto_297311 - MODE
      ?auto_297313 - DIRECTION
      ?auto_297312 - MODE
      ?auto_297314 - DIRECTION
      ?auto_297315 - MODE
      ?auto_297316 - DIRECTION
      ?auto_297317 - MODE
      ?auto_297318 - DIRECTION
      ?auto_297319 - MODE
    )
    :vars
    (
      ?auto_297325 - INSTRUMENT
      ?auto_297327 - SATELLITE
      ?auto_297322 - DIRECTION
      ?auto_297326 - INSTRUMENT
      ?auto_297320 - INSTRUMENT
      ?auto_297324 - INSTRUMENT
      ?auto_297323 - INSTRUMENT
      ?auto_297321 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_297325 ?auto_297327 ) ( SUPPORTS ?auto_297325 ?auto_297311 ) ( not ( = ?auto_297310 ?auto_297322 ) ) ( CALIBRATION_TARGET ?auto_297325 ?auto_297322 ) ( not ( = ?auto_297322 ?auto_297316 ) ) ( ON_BOARD ?auto_297326 ?auto_297327 ) ( not ( = ?auto_297310 ?auto_297316 ) ) ( not ( = ?auto_297325 ?auto_297326 ) ) ( SUPPORTS ?auto_297326 ?auto_297317 ) ( CALIBRATION_TARGET ?auto_297326 ?auto_297322 ) ( not ( = ?auto_297322 ?auto_297314 ) ) ( ON_BOARD ?auto_297320 ?auto_297327 ) ( not ( = ?auto_297316 ?auto_297314 ) ) ( not ( = ?auto_297326 ?auto_297320 ) ) ( SUPPORTS ?auto_297320 ?auto_297315 ) ( CALIBRATION_TARGET ?auto_297320 ?auto_297322 ) ( not ( = ?auto_297322 ?auto_297313 ) ) ( ON_BOARD ?auto_297324 ?auto_297327 ) ( not ( = ?auto_297314 ?auto_297313 ) ) ( not ( = ?auto_297320 ?auto_297324 ) ) ( SUPPORTS ?auto_297324 ?auto_297312 ) ( CALIBRATION_TARGET ?auto_297324 ?auto_297322 ) ( not ( = ?auto_297322 ?auto_297318 ) ) ( ON_BOARD ?auto_297323 ?auto_297327 ) ( not ( = ?auto_297313 ?auto_297318 ) ) ( not ( = ?auto_297324 ?auto_297323 ) ) ( SUPPORTS ?auto_297323 ?auto_297319 ) ( CALIBRATION_TARGET ?auto_297323 ?auto_297322 ) ( POWER_AVAIL ?auto_297327 ) ( POINTING ?auto_297327 ?auto_297321 ) ( not ( = ?auto_297322 ?auto_297321 ) ) ( not ( = ?auto_297318 ?auto_297321 ) ) ( not ( = ?auto_297319 ?auto_297312 ) ) ( not ( = ?auto_297313 ?auto_297321 ) ) ( not ( = ?auto_297318 ?auto_297314 ) ) ( not ( = ?auto_297319 ?auto_297315 ) ) ( not ( = ?auto_297312 ?auto_297315 ) ) ( not ( = ?auto_297314 ?auto_297321 ) ) ( not ( = ?auto_297320 ?auto_297323 ) ) ( not ( = ?auto_297318 ?auto_297316 ) ) ( not ( = ?auto_297319 ?auto_297317 ) ) ( not ( = ?auto_297313 ?auto_297316 ) ) ( not ( = ?auto_297312 ?auto_297317 ) ) ( not ( = ?auto_297315 ?auto_297317 ) ) ( not ( = ?auto_297316 ?auto_297321 ) ) ( not ( = ?auto_297326 ?auto_297324 ) ) ( not ( = ?auto_297326 ?auto_297323 ) ) ( not ( = ?auto_297318 ?auto_297310 ) ) ( not ( = ?auto_297319 ?auto_297311 ) ) ( not ( = ?auto_297313 ?auto_297310 ) ) ( not ( = ?auto_297312 ?auto_297311 ) ) ( not ( = ?auto_297314 ?auto_297310 ) ) ( not ( = ?auto_297315 ?auto_297311 ) ) ( not ( = ?auto_297317 ?auto_297311 ) ) ( not ( = ?auto_297310 ?auto_297321 ) ) ( not ( = ?auto_297325 ?auto_297320 ) ) ( not ( = ?auto_297325 ?auto_297324 ) ) ( not ( = ?auto_297325 ?auto_297323 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_297318 ?auto_297319 ?auto_297313 ?auto_297312 ?auto_297314 ?auto_297315 ?auto_297310 ?auto_297311 ?auto_297316 ?auto_297317 )
      ( GET-5IMAGE-VERIFY ?auto_297310 ?auto_297311 ?auto_297313 ?auto_297312 ?auto_297314 ?auto_297315 ?auto_297316 ?auto_297317 ?auto_297318 ?auto_297319 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_297554 - DIRECTION
      ?auto_297555 - MODE
      ?auto_297557 - DIRECTION
      ?auto_297556 - MODE
      ?auto_297558 - DIRECTION
      ?auto_297559 - MODE
      ?auto_297560 - DIRECTION
      ?auto_297561 - MODE
      ?auto_297562 - DIRECTION
      ?auto_297563 - MODE
    )
    :vars
    (
      ?auto_297569 - INSTRUMENT
      ?auto_297571 - SATELLITE
      ?auto_297566 - DIRECTION
      ?auto_297570 - INSTRUMENT
      ?auto_297564 - INSTRUMENT
      ?auto_297568 - INSTRUMENT
      ?auto_297567 - INSTRUMENT
      ?auto_297565 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_297569 ?auto_297571 ) ( SUPPORTS ?auto_297569 ?auto_297555 ) ( not ( = ?auto_297554 ?auto_297566 ) ) ( CALIBRATION_TARGET ?auto_297569 ?auto_297566 ) ( not ( = ?auto_297566 ?auto_297558 ) ) ( ON_BOARD ?auto_297570 ?auto_297571 ) ( not ( = ?auto_297554 ?auto_297558 ) ) ( not ( = ?auto_297569 ?auto_297570 ) ) ( SUPPORTS ?auto_297570 ?auto_297559 ) ( CALIBRATION_TARGET ?auto_297570 ?auto_297566 ) ( not ( = ?auto_297566 ?auto_297562 ) ) ( ON_BOARD ?auto_297564 ?auto_297571 ) ( not ( = ?auto_297558 ?auto_297562 ) ) ( not ( = ?auto_297570 ?auto_297564 ) ) ( SUPPORTS ?auto_297564 ?auto_297563 ) ( CALIBRATION_TARGET ?auto_297564 ?auto_297566 ) ( not ( = ?auto_297566 ?auto_297557 ) ) ( ON_BOARD ?auto_297568 ?auto_297571 ) ( not ( = ?auto_297562 ?auto_297557 ) ) ( not ( = ?auto_297564 ?auto_297568 ) ) ( SUPPORTS ?auto_297568 ?auto_297556 ) ( CALIBRATION_TARGET ?auto_297568 ?auto_297566 ) ( not ( = ?auto_297566 ?auto_297560 ) ) ( ON_BOARD ?auto_297567 ?auto_297571 ) ( not ( = ?auto_297557 ?auto_297560 ) ) ( not ( = ?auto_297568 ?auto_297567 ) ) ( SUPPORTS ?auto_297567 ?auto_297561 ) ( CALIBRATION_TARGET ?auto_297567 ?auto_297566 ) ( POWER_AVAIL ?auto_297571 ) ( POINTING ?auto_297571 ?auto_297565 ) ( not ( = ?auto_297566 ?auto_297565 ) ) ( not ( = ?auto_297560 ?auto_297565 ) ) ( not ( = ?auto_297561 ?auto_297556 ) ) ( not ( = ?auto_297557 ?auto_297565 ) ) ( not ( = ?auto_297560 ?auto_297562 ) ) ( not ( = ?auto_297561 ?auto_297563 ) ) ( not ( = ?auto_297556 ?auto_297563 ) ) ( not ( = ?auto_297562 ?auto_297565 ) ) ( not ( = ?auto_297564 ?auto_297567 ) ) ( not ( = ?auto_297560 ?auto_297558 ) ) ( not ( = ?auto_297561 ?auto_297559 ) ) ( not ( = ?auto_297557 ?auto_297558 ) ) ( not ( = ?auto_297556 ?auto_297559 ) ) ( not ( = ?auto_297563 ?auto_297559 ) ) ( not ( = ?auto_297558 ?auto_297565 ) ) ( not ( = ?auto_297570 ?auto_297568 ) ) ( not ( = ?auto_297570 ?auto_297567 ) ) ( not ( = ?auto_297560 ?auto_297554 ) ) ( not ( = ?auto_297561 ?auto_297555 ) ) ( not ( = ?auto_297557 ?auto_297554 ) ) ( not ( = ?auto_297556 ?auto_297555 ) ) ( not ( = ?auto_297562 ?auto_297554 ) ) ( not ( = ?auto_297563 ?auto_297555 ) ) ( not ( = ?auto_297559 ?auto_297555 ) ) ( not ( = ?auto_297554 ?auto_297565 ) ) ( not ( = ?auto_297569 ?auto_297564 ) ) ( not ( = ?auto_297569 ?auto_297568 ) ) ( not ( = ?auto_297569 ?auto_297567 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_297560 ?auto_297561 ?auto_297557 ?auto_297556 ?auto_297562 ?auto_297563 ?auto_297554 ?auto_297555 ?auto_297558 ?auto_297559 )
      ( GET-5IMAGE-VERIFY ?auto_297554 ?auto_297555 ?auto_297557 ?auto_297556 ?auto_297558 ?auto_297559 ?auto_297560 ?auto_297561 ?auto_297562 ?auto_297563 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_297718 - DIRECTION
      ?auto_297719 - MODE
      ?auto_297721 - DIRECTION
      ?auto_297720 - MODE
      ?auto_297722 - DIRECTION
      ?auto_297723 - MODE
      ?auto_297724 - DIRECTION
      ?auto_297725 - MODE
      ?auto_297726 - DIRECTION
      ?auto_297727 - MODE
    )
    :vars
    (
      ?auto_297733 - INSTRUMENT
      ?auto_297735 - SATELLITE
      ?auto_297730 - DIRECTION
      ?auto_297734 - INSTRUMENT
      ?auto_297728 - INSTRUMENT
      ?auto_297732 - INSTRUMENT
      ?auto_297731 - INSTRUMENT
      ?auto_297729 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_297733 ?auto_297735 ) ( SUPPORTS ?auto_297733 ?auto_297719 ) ( not ( = ?auto_297718 ?auto_297730 ) ) ( CALIBRATION_TARGET ?auto_297733 ?auto_297730 ) ( not ( = ?auto_297730 ?auto_297722 ) ) ( ON_BOARD ?auto_297734 ?auto_297735 ) ( not ( = ?auto_297718 ?auto_297722 ) ) ( not ( = ?auto_297733 ?auto_297734 ) ) ( SUPPORTS ?auto_297734 ?auto_297723 ) ( CALIBRATION_TARGET ?auto_297734 ?auto_297730 ) ( not ( = ?auto_297730 ?auto_297724 ) ) ( ON_BOARD ?auto_297728 ?auto_297735 ) ( not ( = ?auto_297722 ?auto_297724 ) ) ( not ( = ?auto_297734 ?auto_297728 ) ) ( SUPPORTS ?auto_297728 ?auto_297725 ) ( CALIBRATION_TARGET ?auto_297728 ?auto_297730 ) ( not ( = ?auto_297730 ?auto_297721 ) ) ( ON_BOARD ?auto_297732 ?auto_297735 ) ( not ( = ?auto_297724 ?auto_297721 ) ) ( not ( = ?auto_297728 ?auto_297732 ) ) ( SUPPORTS ?auto_297732 ?auto_297720 ) ( CALIBRATION_TARGET ?auto_297732 ?auto_297730 ) ( not ( = ?auto_297730 ?auto_297726 ) ) ( ON_BOARD ?auto_297731 ?auto_297735 ) ( not ( = ?auto_297721 ?auto_297726 ) ) ( not ( = ?auto_297732 ?auto_297731 ) ) ( SUPPORTS ?auto_297731 ?auto_297727 ) ( CALIBRATION_TARGET ?auto_297731 ?auto_297730 ) ( POWER_AVAIL ?auto_297735 ) ( POINTING ?auto_297735 ?auto_297729 ) ( not ( = ?auto_297730 ?auto_297729 ) ) ( not ( = ?auto_297726 ?auto_297729 ) ) ( not ( = ?auto_297727 ?auto_297720 ) ) ( not ( = ?auto_297721 ?auto_297729 ) ) ( not ( = ?auto_297726 ?auto_297724 ) ) ( not ( = ?auto_297727 ?auto_297725 ) ) ( not ( = ?auto_297720 ?auto_297725 ) ) ( not ( = ?auto_297724 ?auto_297729 ) ) ( not ( = ?auto_297728 ?auto_297731 ) ) ( not ( = ?auto_297726 ?auto_297722 ) ) ( not ( = ?auto_297727 ?auto_297723 ) ) ( not ( = ?auto_297721 ?auto_297722 ) ) ( not ( = ?auto_297720 ?auto_297723 ) ) ( not ( = ?auto_297725 ?auto_297723 ) ) ( not ( = ?auto_297722 ?auto_297729 ) ) ( not ( = ?auto_297734 ?auto_297732 ) ) ( not ( = ?auto_297734 ?auto_297731 ) ) ( not ( = ?auto_297726 ?auto_297718 ) ) ( not ( = ?auto_297727 ?auto_297719 ) ) ( not ( = ?auto_297721 ?auto_297718 ) ) ( not ( = ?auto_297720 ?auto_297719 ) ) ( not ( = ?auto_297724 ?auto_297718 ) ) ( not ( = ?auto_297725 ?auto_297719 ) ) ( not ( = ?auto_297723 ?auto_297719 ) ) ( not ( = ?auto_297718 ?auto_297729 ) ) ( not ( = ?auto_297733 ?auto_297728 ) ) ( not ( = ?auto_297733 ?auto_297732 ) ) ( not ( = ?auto_297733 ?auto_297731 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_297726 ?auto_297727 ?auto_297721 ?auto_297720 ?auto_297724 ?auto_297725 ?auto_297718 ?auto_297719 ?auto_297722 ?auto_297723 )
      ( GET-5IMAGE-VERIFY ?auto_297718 ?auto_297719 ?auto_297721 ?auto_297720 ?auto_297722 ?auto_297723 ?auto_297724 ?auto_297725 ?auto_297726 ?auto_297727 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_298740 - DIRECTION
      ?auto_298741 - MODE
      ?auto_298743 - DIRECTION
      ?auto_298742 - MODE
      ?auto_298744 - DIRECTION
      ?auto_298745 - MODE
      ?auto_298746 - DIRECTION
      ?auto_298747 - MODE
      ?auto_298748 - DIRECTION
      ?auto_298749 - MODE
    )
    :vars
    (
      ?auto_298755 - INSTRUMENT
      ?auto_298757 - SATELLITE
      ?auto_298752 - DIRECTION
      ?auto_298756 - INSTRUMENT
      ?auto_298750 - INSTRUMENT
      ?auto_298754 - INSTRUMENT
      ?auto_298753 - INSTRUMENT
      ?auto_298751 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_298755 ?auto_298757 ) ( SUPPORTS ?auto_298755 ?auto_298741 ) ( not ( = ?auto_298740 ?auto_298752 ) ) ( CALIBRATION_TARGET ?auto_298755 ?auto_298752 ) ( not ( = ?auto_298752 ?auto_298748 ) ) ( ON_BOARD ?auto_298756 ?auto_298757 ) ( not ( = ?auto_298740 ?auto_298748 ) ) ( not ( = ?auto_298755 ?auto_298756 ) ) ( SUPPORTS ?auto_298756 ?auto_298749 ) ( CALIBRATION_TARGET ?auto_298756 ?auto_298752 ) ( not ( = ?auto_298752 ?auto_298743 ) ) ( ON_BOARD ?auto_298750 ?auto_298757 ) ( not ( = ?auto_298748 ?auto_298743 ) ) ( not ( = ?auto_298756 ?auto_298750 ) ) ( SUPPORTS ?auto_298750 ?auto_298742 ) ( CALIBRATION_TARGET ?auto_298750 ?auto_298752 ) ( not ( = ?auto_298752 ?auto_298746 ) ) ( ON_BOARD ?auto_298754 ?auto_298757 ) ( not ( = ?auto_298743 ?auto_298746 ) ) ( not ( = ?auto_298750 ?auto_298754 ) ) ( SUPPORTS ?auto_298754 ?auto_298747 ) ( CALIBRATION_TARGET ?auto_298754 ?auto_298752 ) ( not ( = ?auto_298752 ?auto_298744 ) ) ( ON_BOARD ?auto_298753 ?auto_298757 ) ( not ( = ?auto_298746 ?auto_298744 ) ) ( not ( = ?auto_298754 ?auto_298753 ) ) ( SUPPORTS ?auto_298753 ?auto_298745 ) ( CALIBRATION_TARGET ?auto_298753 ?auto_298752 ) ( POWER_AVAIL ?auto_298757 ) ( POINTING ?auto_298757 ?auto_298751 ) ( not ( = ?auto_298752 ?auto_298751 ) ) ( not ( = ?auto_298744 ?auto_298751 ) ) ( not ( = ?auto_298745 ?auto_298747 ) ) ( not ( = ?auto_298746 ?auto_298751 ) ) ( not ( = ?auto_298744 ?auto_298743 ) ) ( not ( = ?auto_298745 ?auto_298742 ) ) ( not ( = ?auto_298747 ?auto_298742 ) ) ( not ( = ?auto_298743 ?auto_298751 ) ) ( not ( = ?auto_298750 ?auto_298753 ) ) ( not ( = ?auto_298744 ?auto_298748 ) ) ( not ( = ?auto_298745 ?auto_298749 ) ) ( not ( = ?auto_298746 ?auto_298748 ) ) ( not ( = ?auto_298747 ?auto_298749 ) ) ( not ( = ?auto_298742 ?auto_298749 ) ) ( not ( = ?auto_298748 ?auto_298751 ) ) ( not ( = ?auto_298756 ?auto_298754 ) ) ( not ( = ?auto_298756 ?auto_298753 ) ) ( not ( = ?auto_298744 ?auto_298740 ) ) ( not ( = ?auto_298745 ?auto_298741 ) ) ( not ( = ?auto_298746 ?auto_298740 ) ) ( not ( = ?auto_298747 ?auto_298741 ) ) ( not ( = ?auto_298743 ?auto_298740 ) ) ( not ( = ?auto_298742 ?auto_298741 ) ) ( not ( = ?auto_298749 ?auto_298741 ) ) ( not ( = ?auto_298740 ?auto_298751 ) ) ( not ( = ?auto_298755 ?auto_298750 ) ) ( not ( = ?auto_298755 ?auto_298754 ) ) ( not ( = ?auto_298755 ?auto_298753 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_298744 ?auto_298745 ?auto_298746 ?auto_298747 ?auto_298743 ?auto_298742 ?auto_298740 ?auto_298741 ?auto_298748 ?auto_298749 )
      ( GET-5IMAGE-VERIFY ?auto_298740 ?auto_298741 ?auto_298743 ?auto_298742 ?auto_298744 ?auto_298745 ?auto_298746 ?auto_298747 ?auto_298748 ?auto_298749 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_298904 - DIRECTION
      ?auto_298905 - MODE
      ?auto_298907 - DIRECTION
      ?auto_298906 - MODE
      ?auto_298908 - DIRECTION
      ?auto_298909 - MODE
      ?auto_298910 - DIRECTION
      ?auto_298911 - MODE
      ?auto_298912 - DIRECTION
      ?auto_298913 - MODE
    )
    :vars
    (
      ?auto_298919 - INSTRUMENT
      ?auto_298921 - SATELLITE
      ?auto_298916 - DIRECTION
      ?auto_298920 - INSTRUMENT
      ?auto_298914 - INSTRUMENT
      ?auto_298918 - INSTRUMENT
      ?auto_298917 - INSTRUMENT
      ?auto_298915 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_298919 ?auto_298921 ) ( SUPPORTS ?auto_298919 ?auto_298905 ) ( not ( = ?auto_298904 ?auto_298916 ) ) ( CALIBRATION_TARGET ?auto_298919 ?auto_298916 ) ( not ( = ?auto_298916 ?auto_298910 ) ) ( ON_BOARD ?auto_298920 ?auto_298921 ) ( not ( = ?auto_298904 ?auto_298910 ) ) ( not ( = ?auto_298919 ?auto_298920 ) ) ( SUPPORTS ?auto_298920 ?auto_298911 ) ( CALIBRATION_TARGET ?auto_298920 ?auto_298916 ) ( not ( = ?auto_298916 ?auto_298907 ) ) ( ON_BOARD ?auto_298914 ?auto_298921 ) ( not ( = ?auto_298910 ?auto_298907 ) ) ( not ( = ?auto_298920 ?auto_298914 ) ) ( SUPPORTS ?auto_298914 ?auto_298906 ) ( CALIBRATION_TARGET ?auto_298914 ?auto_298916 ) ( not ( = ?auto_298916 ?auto_298912 ) ) ( ON_BOARD ?auto_298918 ?auto_298921 ) ( not ( = ?auto_298907 ?auto_298912 ) ) ( not ( = ?auto_298914 ?auto_298918 ) ) ( SUPPORTS ?auto_298918 ?auto_298913 ) ( CALIBRATION_TARGET ?auto_298918 ?auto_298916 ) ( not ( = ?auto_298916 ?auto_298908 ) ) ( ON_BOARD ?auto_298917 ?auto_298921 ) ( not ( = ?auto_298912 ?auto_298908 ) ) ( not ( = ?auto_298918 ?auto_298917 ) ) ( SUPPORTS ?auto_298917 ?auto_298909 ) ( CALIBRATION_TARGET ?auto_298917 ?auto_298916 ) ( POWER_AVAIL ?auto_298921 ) ( POINTING ?auto_298921 ?auto_298915 ) ( not ( = ?auto_298916 ?auto_298915 ) ) ( not ( = ?auto_298908 ?auto_298915 ) ) ( not ( = ?auto_298909 ?auto_298913 ) ) ( not ( = ?auto_298912 ?auto_298915 ) ) ( not ( = ?auto_298908 ?auto_298907 ) ) ( not ( = ?auto_298909 ?auto_298906 ) ) ( not ( = ?auto_298913 ?auto_298906 ) ) ( not ( = ?auto_298907 ?auto_298915 ) ) ( not ( = ?auto_298914 ?auto_298917 ) ) ( not ( = ?auto_298908 ?auto_298910 ) ) ( not ( = ?auto_298909 ?auto_298911 ) ) ( not ( = ?auto_298912 ?auto_298910 ) ) ( not ( = ?auto_298913 ?auto_298911 ) ) ( not ( = ?auto_298906 ?auto_298911 ) ) ( not ( = ?auto_298910 ?auto_298915 ) ) ( not ( = ?auto_298920 ?auto_298918 ) ) ( not ( = ?auto_298920 ?auto_298917 ) ) ( not ( = ?auto_298908 ?auto_298904 ) ) ( not ( = ?auto_298909 ?auto_298905 ) ) ( not ( = ?auto_298912 ?auto_298904 ) ) ( not ( = ?auto_298913 ?auto_298905 ) ) ( not ( = ?auto_298907 ?auto_298904 ) ) ( not ( = ?auto_298906 ?auto_298905 ) ) ( not ( = ?auto_298911 ?auto_298905 ) ) ( not ( = ?auto_298904 ?auto_298915 ) ) ( not ( = ?auto_298919 ?auto_298914 ) ) ( not ( = ?auto_298919 ?auto_298918 ) ) ( not ( = ?auto_298919 ?auto_298917 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_298908 ?auto_298909 ?auto_298912 ?auto_298913 ?auto_298907 ?auto_298906 ?auto_298904 ?auto_298905 ?auto_298910 ?auto_298911 )
      ( GET-5IMAGE-VERIFY ?auto_298904 ?auto_298905 ?auto_298907 ?auto_298906 ?auto_298908 ?auto_298909 ?auto_298910 ?auto_298911 ?auto_298912 ?auto_298913 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_299148 - DIRECTION
      ?auto_299149 - MODE
      ?auto_299151 - DIRECTION
      ?auto_299150 - MODE
      ?auto_299152 - DIRECTION
      ?auto_299153 - MODE
      ?auto_299154 - DIRECTION
      ?auto_299155 - MODE
      ?auto_299156 - DIRECTION
      ?auto_299157 - MODE
    )
    :vars
    (
      ?auto_299163 - INSTRUMENT
      ?auto_299165 - SATELLITE
      ?auto_299160 - DIRECTION
      ?auto_299164 - INSTRUMENT
      ?auto_299158 - INSTRUMENT
      ?auto_299162 - INSTRUMENT
      ?auto_299161 - INSTRUMENT
      ?auto_299159 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_299163 ?auto_299165 ) ( SUPPORTS ?auto_299163 ?auto_299149 ) ( not ( = ?auto_299148 ?auto_299160 ) ) ( CALIBRATION_TARGET ?auto_299163 ?auto_299160 ) ( not ( = ?auto_299160 ?auto_299156 ) ) ( ON_BOARD ?auto_299164 ?auto_299165 ) ( not ( = ?auto_299148 ?auto_299156 ) ) ( not ( = ?auto_299163 ?auto_299164 ) ) ( SUPPORTS ?auto_299164 ?auto_299157 ) ( CALIBRATION_TARGET ?auto_299164 ?auto_299160 ) ( not ( = ?auto_299160 ?auto_299151 ) ) ( ON_BOARD ?auto_299158 ?auto_299165 ) ( not ( = ?auto_299156 ?auto_299151 ) ) ( not ( = ?auto_299164 ?auto_299158 ) ) ( SUPPORTS ?auto_299158 ?auto_299150 ) ( CALIBRATION_TARGET ?auto_299158 ?auto_299160 ) ( not ( = ?auto_299160 ?auto_299152 ) ) ( ON_BOARD ?auto_299162 ?auto_299165 ) ( not ( = ?auto_299151 ?auto_299152 ) ) ( not ( = ?auto_299158 ?auto_299162 ) ) ( SUPPORTS ?auto_299162 ?auto_299153 ) ( CALIBRATION_TARGET ?auto_299162 ?auto_299160 ) ( not ( = ?auto_299160 ?auto_299154 ) ) ( ON_BOARD ?auto_299161 ?auto_299165 ) ( not ( = ?auto_299152 ?auto_299154 ) ) ( not ( = ?auto_299162 ?auto_299161 ) ) ( SUPPORTS ?auto_299161 ?auto_299155 ) ( CALIBRATION_TARGET ?auto_299161 ?auto_299160 ) ( POWER_AVAIL ?auto_299165 ) ( POINTING ?auto_299165 ?auto_299159 ) ( not ( = ?auto_299160 ?auto_299159 ) ) ( not ( = ?auto_299154 ?auto_299159 ) ) ( not ( = ?auto_299155 ?auto_299153 ) ) ( not ( = ?auto_299152 ?auto_299159 ) ) ( not ( = ?auto_299154 ?auto_299151 ) ) ( not ( = ?auto_299155 ?auto_299150 ) ) ( not ( = ?auto_299153 ?auto_299150 ) ) ( not ( = ?auto_299151 ?auto_299159 ) ) ( not ( = ?auto_299158 ?auto_299161 ) ) ( not ( = ?auto_299154 ?auto_299156 ) ) ( not ( = ?auto_299155 ?auto_299157 ) ) ( not ( = ?auto_299152 ?auto_299156 ) ) ( not ( = ?auto_299153 ?auto_299157 ) ) ( not ( = ?auto_299150 ?auto_299157 ) ) ( not ( = ?auto_299156 ?auto_299159 ) ) ( not ( = ?auto_299164 ?auto_299162 ) ) ( not ( = ?auto_299164 ?auto_299161 ) ) ( not ( = ?auto_299154 ?auto_299148 ) ) ( not ( = ?auto_299155 ?auto_299149 ) ) ( not ( = ?auto_299152 ?auto_299148 ) ) ( not ( = ?auto_299153 ?auto_299149 ) ) ( not ( = ?auto_299151 ?auto_299148 ) ) ( not ( = ?auto_299150 ?auto_299149 ) ) ( not ( = ?auto_299157 ?auto_299149 ) ) ( not ( = ?auto_299148 ?auto_299159 ) ) ( not ( = ?auto_299163 ?auto_299158 ) ) ( not ( = ?auto_299163 ?auto_299162 ) ) ( not ( = ?auto_299163 ?auto_299161 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_299154 ?auto_299155 ?auto_299152 ?auto_299153 ?auto_299151 ?auto_299150 ?auto_299148 ?auto_299149 ?auto_299156 ?auto_299157 )
      ( GET-5IMAGE-VERIFY ?auto_299148 ?auto_299149 ?auto_299151 ?auto_299150 ?auto_299152 ?auto_299153 ?auto_299154 ?auto_299155 ?auto_299156 ?auto_299157 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_299398 - DIRECTION
      ?auto_299399 - MODE
      ?auto_299401 - DIRECTION
      ?auto_299400 - MODE
      ?auto_299402 - DIRECTION
      ?auto_299403 - MODE
      ?auto_299404 - DIRECTION
      ?auto_299405 - MODE
      ?auto_299406 - DIRECTION
      ?auto_299407 - MODE
    )
    :vars
    (
      ?auto_299413 - INSTRUMENT
      ?auto_299415 - SATELLITE
      ?auto_299410 - DIRECTION
      ?auto_299414 - INSTRUMENT
      ?auto_299408 - INSTRUMENT
      ?auto_299412 - INSTRUMENT
      ?auto_299411 - INSTRUMENT
      ?auto_299409 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_299413 ?auto_299415 ) ( SUPPORTS ?auto_299413 ?auto_299399 ) ( not ( = ?auto_299398 ?auto_299410 ) ) ( CALIBRATION_TARGET ?auto_299413 ?auto_299410 ) ( not ( = ?auto_299410 ?auto_299404 ) ) ( ON_BOARD ?auto_299414 ?auto_299415 ) ( not ( = ?auto_299398 ?auto_299404 ) ) ( not ( = ?auto_299413 ?auto_299414 ) ) ( SUPPORTS ?auto_299414 ?auto_299405 ) ( CALIBRATION_TARGET ?auto_299414 ?auto_299410 ) ( not ( = ?auto_299410 ?auto_299401 ) ) ( ON_BOARD ?auto_299408 ?auto_299415 ) ( not ( = ?auto_299404 ?auto_299401 ) ) ( not ( = ?auto_299414 ?auto_299408 ) ) ( SUPPORTS ?auto_299408 ?auto_299400 ) ( CALIBRATION_TARGET ?auto_299408 ?auto_299410 ) ( not ( = ?auto_299410 ?auto_299402 ) ) ( ON_BOARD ?auto_299412 ?auto_299415 ) ( not ( = ?auto_299401 ?auto_299402 ) ) ( not ( = ?auto_299408 ?auto_299412 ) ) ( SUPPORTS ?auto_299412 ?auto_299403 ) ( CALIBRATION_TARGET ?auto_299412 ?auto_299410 ) ( not ( = ?auto_299410 ?auto_299406 ) ) ( ON_BOARD ?auto_299411 ?auto_299415 ) ( not ( = ?auto_299402 ?auto_299406 ) ) ( not ( = ?auto_299412 ?auto_299411 ) ) ( SUPPORTS ?auto_299411 ?auto_299407 ) ( CALIBRATION_TARGET ?auto_299411 ?auto_299410 ) ( POWER_AVAIL ?auto_299415 ) ( POINTING ?auto_299415 ?auto_299409 ) ( not ( = ?auto_299410 ?auto_299409 ) ) ( not ( = ?auto_299406 ?auto_299409 ) ) ( not ( = ?auto_299407 ?auto_299403 ) ) ( not ( = ?auto_299402 ?auto_299409 ) ) ( not ( = ?auto_299406 ?auto_299401 ) ) ( not ( = ?auto_299407 ?auto_299400 ) ) ( not ( = ?auto_299403 ?auto_299400 ) ) ( not ( = ?auto_299401 ?auto_299409 ) ) ( not ( = ?auto_299408 ?auto_299411 ) ) ( not ( = ?auto_299406 ?auto_299404 ) ) ( not ( = ?auto_299407 ?auto_299405 ) ) ( not ( = ?auto_299402 ?auto_299404 ) ) ( not ( = ?auto_299403 ?auto_299405 ) ) ( not ( = ?auto_299400 ?auto_299405 ) ) ( not ( = ?auto_299404 ?auto_299409 ) ) ( not ( = ?auto_299414 ?auto_299412 ) ) ( not ( = ?auto_299414 ?auto_299411 ) ) ( not ( = ?auto_299406 ?auto_299398 ) ) ( not ( = ?auto_299407 ?auto_299399 ) ) ( not ( = ?auto_299402 ?auto_299398 ) ) ( not ( = ?auto_299403 ?auto_299399 ) ) ( not ( = ?auto_299401 ?auto_299398 ) ) ( not ( = ?auto_299400 ?auto_299399 ) ) ( not ( = ?auto_299405 ?auto_299399 ) ) ( not ( = ?auto_299398 ?auto_299409 ) ) ( not ( = ?auto_299413 ?auto_299408 ) ) ( not ( = ?auto_299413 ?auto_299412 ) ) ( not ( = ?auto_299413 ?auto_299411 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_299406 ?auto_299407 ?auto_299402 ?auto_299403 ?auto_299401 ?auto_299400 ?auto_299398 ?auto_299399 ?auto_299404 ?auto_299405 )
      ( GET-5IMAGE-VERIFY ?auto_299398 ?auto_299399 ?auto_299401 ?auto_299400 ?auto_299402 ?auto_299403 ?auto_299404 ?auto_299405 ?auto_299406 ?auto_299407 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_300168 - DIRECTION
      ?auto_300169 - MODE
      ?auto_300171 - DIRECTION
      ?auto_300170 - MODE
      ?auto_300172 - DIRECTION
      ?auto_300173 - MODE
      ?auto_300174 - DIRECTION
      ?auto_300175 - MODE
      ?auto_300176 - DIRECTION
      ?auto_300177 - MODE
    )
    :vars
    (
      ?auto_300183 - INSTRUMENT
      ?auto_300185 - SATELLITE
      ?auto_300180 - DIRECTION
      ?auto_300184 - INSTRUMENT
      ?auto_300178 - INSTRUMENT
      ?auto_300182 - INSTRUMENT
      ?auto_300181 - INSTRUMENT
      ?auto_300179 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_300183 ?auto_300185 ) ( SUPPORTS ?auto_300183 ?auto_300169 ) ( not ( = ?auto_300168 ?auto_300180 ) ) ( CALIBRATION_TARGET ?auto_300183 ?auto_300180 ) ( not ( = ?auto_300180 ?auto_300172 ) ) ( ON_BOARD ?auto_300184 ?auto_300185 ) ( not ( = ?auto_300168 ?auto_300172 ) ) ( not ( = ?auto_300183 ?auto_300184 ) ) ( SUPPORTS ?auto_300184 ?auto_300173 ) ( CALIBRATION_TARGET ?auto_300184 ?auto_300180 ) ( not ( = ?auto_300180 ?auto_300171 ) ) ( ON_BOARD ?auto_300178 ?auto_300185 ) ( not ( = ?auto_300172 ?auto_300171 ) ) ( not ( = ?auto_300184 ?auto_300178 ) ) ( SUPPORTS ?auto_300178 ?auto_300170 ) ( CALIBRATION_TARGET ?auto_300178 ?auto_300180 ) ( not ( = ?auto_300180 ?auto_300176 ) ) ( ON_BOARD ?auto_300182 ?auto_300185 ) ( not ( = ?auto_300171 ?auto_300176 ) ) ( not ( = ?auto_300178 ?auto_300182 ) ) ( SUPPORTS ?auto_300182 ?auto_300177 ) ( CALIBRATION_TARGET ?auto_300182 ?auto_300180 ) ( not ( = ?auto_300180 ?auto_300174 ) ) ( ON_BOARD ?auto_300181 ?auto_300185 ) ( not ( = ?auto_300176 ?auto_300174 ) ) ( not ( = ?auto_300182 ?auto_300181 ) ) ( SUPPORTS ?auto_300181 ?auto_300175 ) ( CALIBRATION_TARGET ?auto_300181 ?auto_300180 ) ( POWER_AVAIL ?auto_300185 ) ( POINTING ?auto_300185 ?auto_300179 ) ( not ( = ?auto_300180 ?auto_300179 ) ) ( not ( = ?auto_300174 ?auto_300179 ) ) ( not ( = ?auto_300175 ?auto_300177 ) ) ( not ( = ?auto_300176 ?auto_300179 ) ) ( not ( = ?auto_300174 ?auto_300171 ) ) ( not ( = ?auto_300175 ?auto_300170 ) ) ( not ( = ?auto_300177 ?auto_300170 ) ) ( not ( = ?auto_300171 ?auto_300179 ) ) ( not ( = ?auto_300178 ?auto_300181 ) ) ( not ( = ?auto_300174 ?auto_300172 ) ) ( not ( = ?auto_300175 ?auto_300173 ) ) ( not ( = ?auto_300176 ?auto_300172 ) ) ( not ( = ?auto_300177 ?auto_300173 ) ) ( not ( = ?auto_300170 ?auto_300173 ) ) ( not ( = ?auto_300172 ?auto_300179 ) ) ( not ( = ?auto_300184 ?auto_300182 ) ) ( not ( = ?auto_300184 ?auto_300181 ) ) ( not ( = ?auto_300174 ?auto_300168 ) ) ( not ( = ?auto_300175 ?auto_300169 ) ) ( not ( = ?auto_300176 ?auto_300168 ) ) ( not ( = ?auto_300177 ?auto_300169 ) ) ( not ( = ?auto_300171 ?auto_300168 ) ) ( not ( = ?auto_300170 ?auto_300169 ) ) ( not ( = ?auto_300173 ?auto_300169 ) ) ( not ( = ?auto_300168 ?auto_300179 ) ) ( not ( = ?auto_300183 ?auto_300178 ) ) ( not ( = ?auto_300183 ?auto_300182 ) ) ( not ( = ?auto_300183 ?auto_300181 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_300174 ?auto_300175 ?auto_300176 ?auto_300177 ?auto_300171 ?auto_300170 ?auto_300168 ?auto_300169 ?auto_300172 ?auto_300173 )
      ( GET-5IMAGE-VERIFY ?auto_300168 ?auto_300169 ?auto_300171 ?auto_300170 ?auto_300172 ?auto_300173 ?auto_300174 ?auto_300175 ?auto_300176 ?auto_300177 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_300246 - DIRECTION
      ?auto_300247 - MODE
      ?auto_300249 - DIRECTION
      ?auto_300248 - MODE
      ?auto_300250 - DIRECTION
      ?auto_300251 - MODE
      ?auto_300252 - DIRECTION
      ?auto_300253 - MODE
      ?auto_300254 - DIRECTION
      ?auto_300255 - MODE
    )
    :vars
    (
      ?auto_300261 - INSTRUMENT
      ?auto_300263 - SATELLITE
      ?auto_300258 - DIRECTION
      ?auto_300262 - INSTRUMENT
      ?auto_300256 - INSTRUMENT
      ?auto_300260 - INSTRUMENT
      ?auto_300259 - INSTRUMENT
      ?auto_300257 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_300261 ?auto_300263 ) ( SUPPORTS ?auto_300261 ?auto_300247 ) ( not ( = ?auto_300246 ?auto_300258 ) ) ( CALIBRATION_TARGET ?auto_300261 ?auto_300258 ) ( not ( = ?auto_300258 ?auto_300250 ) ) ( ON_BOARD ?auto_300262 ?auto_300263 ) ( not ( = ?auto_300246 ?auto_300250 ) ) ( not ( = ?auto_300261 ?auto_300262 ) ) ( SUPPORTS ?auto_300262 ?auto_300251 ) ( CALIBRATION_TARGET ?auto_300262 ?auto_300258 ) ( not ( = ?auto_300258 ?auto_300249 ) ) ( ON_BOARD ?auto_300256 ?auto_300263 ) ( not ( = ?auto_300250 ?auto_300249 ) ) ( not ( = ?auto_300262 ?auto_300256 ) ) ( SUPPORTS ?auto_300256 ?auto_300248 ) ( CALIBRATION_TARGET ?auto_300256 ?auto_300258 ) ( not ( = ?auto_300258 ?auto_300252 ) ) ( ON_BOARD ?auto_300260 ?auto_300263 ) ( not ( = ?auto_300249 ?auto_300252 ) ) ( not ( = ?auto_300256 ?auto_300260 ) ) ( SUPPORTS ?auto_300260 ?auto_300253 ) ( CALIBRATION_TARGET ?auto_300260 ?auto_300258 ) ( not ( = ?auto_300258 ?auto_300254 ) ) ( ON_BOARD ?auto_300259 ?auto_300263 ) ( not ( = ?auto_300252 ?auto_300254 ) ) ( not ( = ?auto_300260 ?auto_300259 ) ) ( SUPPORTS ?auto_300259 ?auto_300255 ) ( CALIBRATION_TARGET ?auto_300259 ?auto_300258 ) ( POWER_AVAIL ?auto_300263 ) ( POINTING ?auto_300263 ?auto_300257 ) ( not ( = ?auto_300258 ?auto_300257 ) ) ( not ( = ?auto_300254 ?auto_300257 ) ) ( not ( = ?auto_300255 ?auto_300253 ) ) ( not ( = ?auto_300252 ?auto_300257 ) ) ( not ( = ?auto_300254 ?auto_300249 ) ) ( not ( = ?auto_300255 ?auto_300248 ) ) ( not ( = ?auto_300253 ?auto_300248 ) ) ( not ( = ?auto_300249 ?auto_300257 ) ) ( not ( = ?auto_300256 ?auto_300259 ) ) ( not ( = ?auto_300254 ?auto_300250 ) ) ( not ( = ?auto_300255 ?auto_300251 ) ) ( not ( = ?auto_300252 ?auto_300250 ) ) ( not ( = ?auto_300253 ?auto_300251 ) ) ( not ( = ?auto_300248 ?auto_300251 ) ) ( not ( = ?auto_300250 ?auto_300257 ) ) ( not ( = ?auto_300262 ?auto_300260 ) ) ( not ( = ?auto_300262 ?auto_300259 ) ) ( not ( = ?auto_300254 ?auto_300246 ) ) ( not ( = ?auto_300255 ?auto_300247 ) ) ( not ( = ?auto_300252 ?auto_300246 ) ) ( not ( = ?auto_300253 ?auto_300247 ) ) ( not ( = ?auto_300249 ?auto_300246 ) ) ( not ( = ?auto_300248 ?auto_300247 ) ) ( not ( = ?auto_300251 ?auto_300247 ) ) ( not ( = ?auto_300246 ?auto_300257 ) ) ( not ( = ?auto_300261 ?auto_300256 ) ) ( not ( = ?auto_300261 ?auto_300260 ) ) ( not ( = ?auto_300261 ?auto_300259 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_300254 ?auto_300255 ?auto_300252 ?auto_300253 ?auto_300249 ?auto_300248 ?auto_300246 ?auto_300247 ?auto_300250 ?auto_300251 )
      ( GET-5IMAGE-VERIFY ?auto_300246 ?auto_300247 ?auto_300249 ?auto_300248 ?auto_300250 ?auto_300251 ?auto_300252 ?auto_300253 ?auto_300254 ?auto_300255 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_301354 - DIRECTION
      ?auto_301355 - MODE
      ?auto_301357 - DIRECTION
      ?auto_301356 - MODE
      ?auto_301358 - DIRECTION
      ?auto_301359 - MODE
      ?auto_301360 - DIRECTION
      ?auto_301361 - MODE
      ?auto_301362 - DIRECTION
      ?auto_301363 - MODE
    )
    :vars
    (
      ?auto_301369 - INSTRUMENT
      ?auto_301371 - SATELLITE
      ?auto_301366 - DIRECTION
      ?auto_301370 - INSTRUMENT
      ?auto_301364 - INSTRUMENT
      ?auto_301368 - INSTRUMENT
      ?auto_301367 - INSTRUMENT
      ?auto_301365 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_301369 ?auto_301371 ) ( SUPPORTS ?auto_301369 ?auto_301355 ) ( not ( = ?auto_301354 ?auto_301366 ) ) ( CALIBRATION_TARGET ?auto_301369 ?auto_301366 ) ( not ( = ?auto_301366 ?auto_301357 ) ) ( ON_BOARD ?auto_301370 ?auto_301371 ) ( not ( = ?auto_301354 ?auto_301357 ) ) ( not ( = ?auto_301369 ?auto_301370 ) ) ( SUPPORTS ?auto_301370 ?auto_301356 ) ( CALIBRATION_TARGET ?auto_301370 ?auto_301366 ) ( not ( = ?auto_301366 ?auto_301362 ) ) ( ON_BOARD ?auto_301364 ?auto_301371 ) ( not ( = ?auto_301357 ?auto_301362 ) ) ( not ( = ?auto_301370 ?auto_301364 ) ) ( SUPPORTS ?auto_301364 ?auto_301363 ) ( CALIBRATION_TARGET ?auto_301364 ?auto_301366 ) ( not ( = ?auto_301366 ?auto_301360 ) ) ( ON_BOARD ?auto_301368 ?auto_301371 ) ( not ( = ?auto_301362 ?auto_301360 ) ) ( not ( = ?auto_301364 ?auto_301368 ) ) ( SUPPORTS ?auto_301368 ?auto_301361 ) ( CALIBRATION_TARGET ?auto_301368 ?auto_301366 ) ( not ( = ?auto_301366 ?auto_301358 ) ) ( ON_BOARD ?auto_301367 ?auto_301371 ) ( not ( = ?auto_301360 ?auto_301358 ) ) ( not ( = ?auto_301368 ?auto_301367 ) ) ( SUPPORTS ?auto_301367 ?auto_301359 ) ( CALIBRATION_TARGET ?auto_301367 ?auto_301366 ) ( POWER_AVAIL ?auto_301371 ) ( POINTING ?auto_301371 ?auto_301365 ) ( not ( = ?auto_301366 ?auto_301365 ) ) ( not ( = ?auto_301358 ?auto_301365 ) ) ( not ( = ?auto_301359 ?auto_301361 ) ) ( not ( = ?auto_301360 ?auto_301365 ) ) ( not ( = ?auto_301358 ?auto_301362 ) ) ( not ( = ?auto_301359 ?auto_301363 ) ) ( not ( = ?auto_301361 ?auto_301363 ) ) ( not ( = ?auto_301362 ?auto_301365 ) ) ( not ( = ?auto_301364 ?auto_301367 ) ) ( not ( = ?auto_301358 ?auto_301357 ) ) ( not ( = ?auto_301359 ?auto_301356 ) ) ( not ( = ?auto_301360 ?auto_301357 ) ) ( not ( = ?auto_301361 ?auto_301356 ) ) ( not ( = ?auto_301363 ?auto_301356 ) ) ( not ( = ?auto_301357 ?auto_301365 ) ) ( not ( = ?auto_301370 ?auto_301368 ) ) ( not ( = ?auto_301370 ?auto_301367 ) ) ( not ( = ?auto_301358 ?auto_301354 ) ) ( not ( = ?auto_301359 ?auto_301355 ) ) ( not ( = ?auto_301360 ?auto_301354 ) ) ( not ( = ?auto_301361 ?auto_301355 ) ) ( not ( = ?auto_301362 ?auto_301354 ) ) ( not ( = ?auto_301363 ?auto_301355 ) ) ( not ( = ?auto_301356 ?auto_301355 ) ) ( not ( = ?auto_301354 ?auto_301365 ) ) ( not ( = ?auto_301369 ?auto_301364 ) ) ( not ( = ?auto_301369 ?auto_301368 ) ) ( not ( = ?auto_301369 ?auto_301367 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_301358 ?auto_301359 ?auto_301360 ?auto_301361 ?auto_301362 ?auto_301363 ?auto_301354 ?auto_301355 ?auto_301357 ?auto_301356 )
      ( GET-5IMAGE-VERIFY ?auto_301354 ?auto_301355 ?auto_301357 ?auto_301356 ?auto_301358 ?auto_301359 ?auto_301360 ?auto_301361 ?auto_301362 ?auto_301363 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_301432 - DIRECTION
      ?auto_301433 - MODE
      ?auto_301435 - DIRECTION
      ?auto_301434 - MODE
      ?auto_301436 - DIRECTION
      ?auto_301437 - MODE
      ?auto_301438 - DIRECTION
      ?auto_301439 - MODE
      ?auto_301440 - DIRECTION
      ?auto_301441 - MODE
    )
    :vars
    (
      ?auto_301447 - INSTRUMENT
      ?auto_301449 - SATELLITE
      ?auto_301444 - DIRECTION
      ?auto_301448 - INSTRUMENT
      ?auto_301442 - INSTRUMENT
      ?auto_301446 - INSTRUMENT
      ?auto_301445 - INSTRUMENT
      ?auto_301443 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_301447 ?auto_301449 ) ( SUPPORTS ?auto_301447 ?auto_301433 ) ( not ( = ?auto_301432 ?auto_301444 ) ) ( CALIBRATION_TARGET ?auto_301447 ?auto_301444 ) ( not ( = ?auto_301444 ?auto_301435 ) ) ( ON_BOARD ?auto_301448 ?auto_301449 ) ( not ( = ?auto_301432 ?auto_301435 ) ) ( not ( = ?auto_301447 ?auto_301448 ) ) ( SUPPORTS ?auto_301448 ?auto_301434 ) ( CALIBRATION_TARGET ?auto_301448 ?auto_301444 ) ( not ( = ?auto_301444 ?auto_301438 ) ) ( ON_BOARD ?auto_301442 ?auto_301449 ) ( not ( = ?auto_301435 ?auto_301438 ) ) ( not ( = ?auto_301448 ?auto_301442 ) ) ( SUPPORTS ?auto_301442 ?auto_301439 ) ( CALIBRATION_TARGET ?auto_301442 ?auto_301444 ) ( not ( = ?auto_301444 ?auto_301440 ) ) ( ON_BOARD ?auto_301446 ?auto_301449 ) ( not ( = ?auto_301438 ?auto_301440 ) ) ( not ( = ?auto_301442 ?auto_301446 ) ) ( SUPPORTS ?auto_301446 ?auto_301441 ) ( CALIBRATION_TARGET ?auto_301446 ?auto_301444 ) ( not ( = ?auto_301444 ?auto_301436 ) ) ( ON_BOARD ?auto_301445 ?auto_301449 ) ( not ( = ?auto_301440 ?auto_301436 ) ) ( not ( = ?auto_301446 ?auto_301445 ) ) ( SUPPORTS ?auto_301445 ?auto_301437 ) ( CALIBRATION_TARGET ?auto_301445 ?auto_301444 ) ( POWER_AVAIL ?auto_301449 ) ( POINTING ?auto_301449 ?auto_301443 ) ( not ( = ?auto_301444 ?auto_301443 ) ) ( not ( = ?auto_301436 ?auto_301443 ) ) ( not ( = ?auto_301437 ?auto_301441 ) ) ( not ( = ?auto_301440 ?auto_301443 ) ) ( not ( = ?auto_301436 ?auto_301438 ) ) ( not ( = ?auto_301437 ?auto_301439 ) ) ( not ( = ?auto_301441 ?auto_301439 ) ) ( not ( = ?auto_301438 ?auto_301443 ) ) ( not ( = ?auto_301442 ?auto_301445 ) ) ( not ( = ?auto_301436 ?auto_301435 ) ) ( not ( = ?auto_301437 ?auto_301434 ) ) ( not ( = ?auto_301440 ?auto_301435 ) ) ( not ( = ?auto_301441 ?auto_301434 ) ) ( not ( = ?auto_301439 ?auto_301434 ) ) ( not ( = ?auto_301435 ?auto_301443 ) ) ( not ( = ?auto_301448 ?auto_301446 ) ) ( not ( = ?auto_301448 ?auto_301445 ) ) ( not ( = ?auto_301436 ?auto_301432 ) ) ( not ( = ?auto_301437 ?auto_301433 ) ) ( not ( = ?auto_301440 ?auto_301432 ) ) ( not ( = ?auto_301441 ?auto_301433 ) ) ( not ( = ?auto_301438 ?auto_301432 ) ) ( not ( = ?auto_301439 ?auto_301433 ) ) ( not ( = ?auto_301434 ?auto_301433 ) ) ( not ( = ?auto_301432 ?auto_301443 ) ) ( not ( = ?auto_301447 ?auto_301442 ) ) ( not ( = ?auto_301447 ?auto_301446 ) ) ( not ( = ?auto_301447 ?auto_301445 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_301436 ?auto_301437 ?auto_301440 ?auto_301441 ?auto_301438 ?auto_301439 ?auto_301432 ?auto_301433 ?auto_301435 ?auto_301434 )
      ( GET-5IMAGE-VERIFY ?auto_301432 ?auto_301433 ?auto_301435 ?auto_301434 ?auto_301436 ?auto_301437 ?auto_301438 ?auto_301439 ?auto_301440 ?auto_301441 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_301762 - DIRECTION
      ?auto_301763 - MODE
      ?auto_301765 - DIRECTION
      ?auto_301764 - MODE
      ?auto_301766 - DIRECTION
      ?auto_301767 - MODE
      ?auto_301768 - DIRECTION
      ?auto_301769 - MODE
      ?auto_301770 - DIRECTION
      ?auto_301771 - MODE
    )
    :vars
    (
      ?auto_301777 - INSTRUMENT
      ?auto_301779 - SATELLITE
      ?auto_301774 - DIRECTION
      ?auto_301778 - INSTRUMENT
      ?auto_301772 - INSTRUMENT
      ?auto_301776 - INSTRUMENT
      ?auto_301775 - INSTRUMENT
      ?auto_301773 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_301777 ?auto_301779 ) ( SUPPORTS ?auto_301777 ?auto_301763 ) ( not ( = ?auto_301762 ?auto_301774 ) ) ( CALIBRATION_TARGET ?auto_301777 ?auto_301774 ) ( not ( = ?auto_301774 ?auto_301765 ) ) ( ON_BOARD ?auto_301778 ?auto_301779 ) ( not ( = ?auto_301762 ?auto_301765 ) ) ( not ( = ?auto_301777 ?auto_301778 ) ) ( SUPPORTS ?auto_301778 ?auto_301764 ) ( CALIBRATION_TARGET ?auto_301778 ?auto_301774 ) ( not ( = ?auto_301774 ?auto_301770 ) ) ( ON_BOARD ?auto_301772 ?auto_301779 ) ( not ( = ?auto_301765 ?auto_301770 ) ) ( not ( = ?auto_301778 ?auto_301772 ) ) ( SUPPORTS ?auto_301772 ?auto_301771 ) ( CALIBRATION_TARGET ?auto_301772 ?auto_301774 ) ( not ( = ?auto_301774 ?auto_301766 ) ) ( ON_BOARD ?auto_301776 ?auto_301779 ) ( not ( = ?auto_301770 ?auto_301766 ) ) ( not ( = ?auto_301772 ?auto_301776 ) ) ( SUPPORTS ?auto_301776 ?auto_301767 ) ( CALIBRATION_TARGET ?auto_301776 ?auto_301774 ) ( not ( = ?auto_301774 ?auto_301768 ) ) ( ON_BOARD ?auto_301775 ?auto_301779 ) ( not ( = ?auto_301766 ?auto_301768 ) ) ( not ( = ?auto_301776 ?auto_301775 ) ) ( SUPPORTS ?auto_301775 ?auto_301769 ) ( CALIBRATION_TARGET ?auto_301775 ?auto_301774 ) ( POWER_AVAIL ?auto_301779 ) ( POINTING ?auto_301779 ?auto_301773 ) ( not ( = ?auto_301774 ?auto_301773 ) ) ( not ( = ?auto_301768 ?auto_301773 ) ) ( not ( = ?auto_301769 ?auto_301767 ) ) ( not ( = ?auto_301766 ?auto_301773 ) ) ( not ( = ?auto_301768 ?auto_301770 ) ) ( not ( = ?auto_301769 ?auto_301771 ) ) ( not ( = ?auto_301767 ?auto_301771 ) ) ( not ( = ?auto_301770 ?auto_301773 ) ) ( not ( = ?auto_301772 ?auto_301775 ) ) ( not ( = ?auto_301768 ?auto_301765 ) ) ( not ( = ?auto_301769 ?auto_301764 ) ) ( not ( = ?auto_301766 ?auto_301765 ) ) ( not ( = ?auto_301767 ?auto_301764 ) ) ( not ( = ?auto_301771 ?auto_301764 ) ) ( not ( = ?auto_301765 ?auto_301773 ) ) ( not ( = ?auto_301778 ?auto_301776 ) ) ( not ( = ?auto_301778 ?auto_301775 ) ) ( not ( = ?auto_301768 ?auto_301762 ) ) ( not ( = ?auto_301769 ?auto_301763 ) ) ( not ( = ?auto_301766 ?auto_301762 ) ) ( not ( = ?auto_301767 ?auto_301763 ) ) ( not ( = ?auto_301770 ?auto_301762 ) ) ( not ( = ?auto_301771 ?auto_301763 ) ) ( not ( = ?auto_301764 ?auto_301763 ) ) ( not ( = ?auto_301762 ?auto_301773 ) ) ( not ( = ?auto_301777 ?auto_301772 ) ) ( not ( = ?auto_301777 ?auto_301776 ) ) ( not ( = ?auto_301777 ?auto_301775 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_301768 ?auto_301769 ?auto_301766 ?auto_301767 ?auto_301770 ?auto_301771 ?auto_301762 ?auto_301763 ?auto_301765 ?auto_301764 )
      ( GET-5IMAGE-VERIFY ?auto_301762 ?auto_301763 ?auto_301765 ?auto_301764 ?auto_301766 ?auto_301767 ?auto_301768 ?auto_301769 ?auto_301770 ?auto_301771 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_301926 - DIRECTION
      ?auto_301927 - MODE
      ?auto_301929 - DIRECTION
      ?auto_301928 - MODE
      ?auto_301930 - DIRECTION
      ?auto_301931 - MODE
      ?auto_301932 - DIRECTION
      ?auto_301933 - MODE
      ?auto_301934 - DIRECTION
      ?auto_301935 - MODE
    )
    :vars
    (
      ?auto_301941 - INSTRUMENT
      ?auto_301943 - SATELLITE
      ?auto_301938 - DIRECTION
      ?auto_301942 - INSTRUMENT
      ?auto_301936 - INSTRUMENT
      ?auto_301940 - INSTRUMENT
      ?auto_301939 - INSTRUMENT
      ?auto_301937 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_301941 ?auto_301943 ) ( SUPPORTS ?auto_301941 ?auto_301927 ) ( not ( = ?auto_301926 ?auto_301938 ) ) ( CALIBRATION_TARGET ?auto_301941 ?auto_301938 ) ( not ( = ?auto_301938 ?auto_301929 ) ) ( ON_BOARD ?auto_301942 ?auto_301943 ) ( not ( = ?auto_301926 ?auto_301929 ) ) ( not ( = ?auto_301941 ?auto_301942 ) ) ( SUPPORTS ?auto_301942 ?auto_301928 ) ( CALIBRATION_TARGET ?auto_301942 ?auto_301938 ) ( not ( = ?auto_301938 ?auto_301932 ) ) ( ON_BOARD ?auto_301936 ?auto_301943 ) ( not ( = ?auto_301929 ?auto_301932 ) ) ( not ( = ?auto_301942 ?auto_301936 ) ) ( SUPPORTS ?auto_301936 ?auto_301933 ) ( CALIBRATION_TARGET ?auto_301936 ?auto_301938 ) ( not ( = ?auto_301938 ?auto_301930 ) ) ( ON_BOARD ?auto_301940 ?auto_301943 ) ( not ( = ?auto_301932 ?auto_301930 ) ) ( not ( = ?auto_301936 ?auto_301940 ) ) ( SUPPORTS ?auto_301940 ?auto_301931 ) ( CALIBRATION_TARGET ?auto_301940 ?auto_301938 ) ( not ( = ?auto_301938 ?auto_301934 ) ) ( ON_BOARD ?auto_301939 ?auto_301943 ) ( not ( = ?auto_301930 ?auto_301934 ) ) ( not ( = ?auto_301940 ?auto_301939 ) ) ( SUPPORTS ?auto_301939 ?auto_301935 ) ( CALIBRATION_TARGET ?auto_301939 ?auto_301938 ) ( POWER_AVAIL ?auto_301943 ) ( POINTING ?auto_301943 ?auto_301937 ) ( not ( = ?auto_301938 ?auto_301937 ) ) ( not ( = ?auto_301934 ?auto_301937 ) ) ( not ( = ?auto_301935 ?auto_301931 ) ) ( not ( = ?auto_301930 ?auto_301937 ) ) ( not ( = ?auto_301934 ?auto_301932 ) ) ( not ( = ?auto_301935 ?auto_301933 ) ) ( not ( = ?auto_301931 ?auto_301933 ) ) ( not ( = ?auto_301932 ?auto_301937 ) ) ( not ( = ?auto_301936 ?auto_301939 ) ) ( not ( = ?auto_301934 ?auto_301929 ) ) ( not ( = ?auto_301935 ?auto_301928 ) ) ( not ( = ?auto_301930 ?auto_301929 ) ) ( not ( = ?auto_301931 ?auto_301928 ) ) ( not ( = ?auto_301933 ?auto_301928 ) ) ( not ( = ?auto_301929 ?auto_301937 ) ) ( not ( = ?auto_301942 ?auto_301940 ) ) ( not ( = ?auto_301942 ?auto_301939 ) ) ( not ( = ?auto_301934 ?auto_301926 ) ) ( not ( = ?auto_301935 ?auto_301927 ) ) ( not ( = ?auto_301930 ?auto_301926 ) ) ( not ( = ?auto_301931 ?auto_301927 ) ) ( not ( = ?auto_301932 ?auto_301926 ) ) ( not ( = ?auto_301933 ?auto_301927 ) ) ( not ( = ?auto_301928 ?auto_301927 ) ) ( not ( = ?auto_301926 ?auto_301937 ) ) ( not ( = ?auto_301941 ?auto_301936 ) ) ( not ( = ?auto_301941 ?auto_301940 ) ) ( not ( = ?auto_301941 ?auto_301939 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_301934 ?auto_301935 ?auto_301930 ?auto_301931 ?auto_301932 ?auto_301933 ?auto_301926 ?auto_301927 ?auto_301929 ?auto_301928 )
      ( GET-5IMAGE-VERIFY ?auto_301926 ?auto_301927 ?auto_301929 ?auto_301928 ?auto_301930 ?auto_301931 ?auto_301932 ?auto_301933 ?auto_301934 ?auto_301935 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_302256 - DIRECTION
      ?auto_302257 - MODE
      ?auto_302259 - DIRECTION
      ?auto_302258 - MODE
      ?auto_302260 - DIRECTION
      ?auto_302261 - MODE
      ?auto_302262 - DIRECTION
      ?auto_302263 - MODE
      ?auto_302264 - DIRECTION
      ?auto_302265 - MODE
    )
    :vars
    (
      ?auto_302271 - INSTRUMENT
      ?auto_302273 - SATELLITE
      ?auto_302268 - DIRECTION
      ?auto_302272 - INSTRUMENT
      ?auto_302266 - INSTRUMENT
      ?auto_302270 - INSTRUMENT
      ?auto_302269 - INSTRUMENT
      ?auto_302267 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_302271 ?auto_302273 ) ( SUPPORTS ?auto_302271 ?auto_302257 ) ( not ( = ?auto_302256 ?auto_302268 ) ) ( CALIBRATION_TARGET ?auto_302271 ?auto_302268 ) ( not ( = ?auto_302268 ?auto_302259 ) ) ( ON_BOARD ?auto_302272 ?auto_302273 ) ( not ( = ?auto_302256 ?auto_302259 ) ) ( not ( = ?auto_302271 ?auto_302272 ) ) ( SUPPORTS ?auto_302272 ?auto_302258 ) ( CALIBRATION_TARGET ?auto_302272 ?auto_302268 ) ( not ( = ?auto_302268 ?auto_302260 ) ) ( ON_BOARD ?auto_302266 ?auto_302273 ) ( not ( = ?auto_302259 ?auto_302260 ) ) ( not ( = ?auto_302272 ?auto_302266 ) ) ( SUPPORTS ?auto_302266 ?auto_302261 ) ( CALIBRATION_TARGET ?auto_302266 ?auto_302268 ) ( not ( = ?auto_302268 ?auto_302264 ) ) ( ON_BOARD ?auto_302270 ?auto_302273 ) ( not ( = ?auto_302260 ?auto_302264 ) ) ( not ( = ?auto_302266 ?auto_302270 ) ) ( SUPPORTS ?auto_302270 ?auto_302265 ) ( CALIBRATION_TARGET ?auto_302270 ?auto_302268 ) ( not ( = ?auto_302268 ?auto_302262 ) ) ( ON_BOARD ?auto_302269 ?auto_302273 ) ( not ( = ?auto_302264 ?auto_302262 ) ) ( not ( = ?auto_302270 ?auto_302269 ) ) ( SUPPORTS ?auto_302269 ?auto_302263 ) ( CALIBRATION_TARGET ?auto_302269 ?auto_302268 ) ( POWER_AVAIL ?auto_302273 ) ( POINTING ?auto_302273 ?auto_302267 ) ( not ( = ?auto_302268 ?auto_302267 ) ) ( not ( = ?auto_302262 ?auto_302267 ) ) ( not ( = ?auto_302263 ?auto_302265 ) ) ( not ( = ?auto_302264 ?auto_302267 ) ) ( not ( = ?auto_302262 ?auto_302260 ) ) ( not ( = ?auto_302263 ?auto_302261 ) ) ( not ( = ?auto_302265 ?auto_302261 ) ) ( not ( = ?auto_302260 ?auto_302267 ) ) ( not ( = ?auto_302266 ?auto_302269 ) ) ( not ( = ?auto_302262 ?auto_302259 ) ) ( not ( = ?auto_302263 ?auto_302258 ) ) ( not ( = ?auto_302264 ?auto_302259 ) ) ( not ( = ?auto_302265 ?auto_302258 ) ) ( not ( = ?auto_302261 ?auto_302258 ) ) ( not ( = ?auto_302259 ?auto_302267 ) ) ( not ( = ?auto_302272 ?auto_302270 ) ) ( not ( = ?auto_302272 ?auto_302269 ) ) ( not ( = ?auto_302262 ?auto_302256 ) ) ( not ( = ?auto_302263 ?auto_302257 ) ) ( not ( = ?auto_302264 ?auto_302256 ) ) ( not ( = ?auto_302265 ?auto_302257 ) ) ( not ( = ?auto_302260 ?auto_302256 ) ) ( not ( = ?auto_302261 ?auto_302257 ) ) ( not ( = ?auto_302258 ?auto_302257 ) ) ( not ( = ?auto_302256 ?auto_302267 ) ) ( not ( = ?auto_302271 ?auto_302266 ) ) ( not ( = ?auto_302271 ?auto_302270 ) ) ( not ( = ?auto_302271 ?auto_302269 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_302262 ?auto_302263 ?auto_302264 ?auto_302265 ?auto_302260 ?auto_302261 ?auto_302256 ?auto_302257 ?auto_302259 ?auto_302258 )
      ( GET-5IMAGE-VERIFY ?auto_302256 ?auto_302257 ?auto_302259 ?auto_302258 ?auto_302260 ?auto_302261 ?auto_302262 ?auto_302263 ?auto_302264 ?auto_302265 ) )
  )

  ( :method GET-5IMAGE
    :parameters
    (
      ?auto_302334 - DIRECTION
      ?auto_302335 - MODE
      ?auto_302337 - DIRECTION
      ?auto_302336 - MODE
      ?auto_302338 - DIRECTION
      ?auto_302339 - MODE
      ?auto_302340 - DIRECTION
      ?auto_302341 - MODE
      ?auto_302342 - DIRECTION
      ?auto_302343 - MODE
    )
    :vars
    (
      ?auto_302349 - INSTRUMENT
      ?auto_302351 - SATELLITE
      ?auto_302346 - DIRECTION
      ?auto_302350 - INSTRUMENT
      ?auto_302344 - INSTRUMENT
      ?auto_302348 - INSTRUMENT
      ?auto_302347 - INSTRUMENT
      ?auto_302345 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_302349 ?auto_302351 ) ( SUPPORTS ?auto_302349 ?auto_302335 ) ( not ( = ?auto_302334 ?auto_302346 ) ) ( CALIBRATION_TARGET ?auto_302349 ?auto_302346 ) ( not ( = ?auto_302346 ?auto_302337 ) ) ( ON_BOARD ?auto_302350 ?auto_302351 ) ( not ( = ?auto_302334 ?auto_302337 ) ) ( not ( = ?auto_302349 ?auto_302350 ) ) ( SUPPORTS ?auto_302350 ?auto_302336 ) ( CALIBRATION_TARGET ?auto_302350 ?auto_302346 ) ( not ( = ?auto_302346 ?auto_302338 ) ) ( ON_BOARD ?auto_302344 ?auto_302351 ) ( not ( = ?auto_302337 ?auto_302338 ) ) ( not ( = ?auto_302350 ?auto_302344 ) ) ( SUPPORTS ?auto_302344 ?auto_302339 ) ( CALIBRATION_TARGET ?auto_302344 ?auto_302346 ) ( not ( = ?auto_302346 ?auto_302340 ) ) ( ON_BOARD ?auto_302348 ?auto_302351 ) ( not ( = ?auto_302338 ?auto_302340 ) ) ( not ( = ?auto_302344 ?auto_302348 ) ) ( SUPPORTS ?auto_302348 ?auto_302341 ) ( CALIBRATION_TARGET ?auto_302348 ?auto_302346 ) ( not ( = ?auto_302346 ?auto_302342 ) ) ( ON_BOARD ?auto_302347 ?auto_302351 ) ( not ( = ?auto_302340 ?auto_302342 ) ) ( not ( = ?auto_302348 ?auto_302347 ) ) ( SUPPORTS ?auto_302347 ?auto_302343 ) ( CALIBRATION_TARGET ?auto_302347 ?auto_302346 ) ( POWER_AVAIL ?auto_302351 ) ( POINTING ?auto_302351 ?auto_302345 ) ( not ( = ?auto_302346 ?auto_302345 ) ) ( not ( = ?auto_302342 ?auto_302345 ) ) ( not ( = ?auto_302343 ?auto_302341 ) ) ( not ( = ?auto_302340 ?auto_302345 ) ) ( not ( = ?auto_302342 ?auto_302338 ) ) ( not ( = ?auto_302343 ?auto_302339 ) ) ( not ( = ?auto_302341 ?auto_302339 ) ) ( not ( = ?auto_302338 ?auto_302345 ) ) ( not ( = ?auto_302344 ?auto_302347 ) ) ( not ( = ?auto_302342 ?auto_302337 ) ) ( not ( = ?auto_302343 ?auto_302336 ) ) ( not ( = ?auto_302340 ?auto_302337 ) ) ( not ( = ?auto_302341 ?auto_302336 ) ) ( not ( = ?auto_302339 ?auto_302336 ) ) ( not ( = ?auto_302337 ?auto_302345 ) ) ( not ( = ?auto_302350 ?auto_302348 ) ) ( not ( = ?auto_302350 ?auto_302347 ) ) ( not ( = ?auto_302342 ?auto_302334 ) ) ( not ( = ?auto_302343 ?auto_302335 ) ) ( not ( = ?auto_302340 ?auto_302334 ) ) ( not ( = ?auto_302341 ?auto_302335 ) ) ( not ( = ?auto_302338 ?auto_302334 ) ) ( not ( = ?auto_302339 ?auto_302335 ) ) ( not ( = ?auto_302336 ?auto_302335 ) ) ( not ( = ?auto_302334 ?auto_302345 ) ) ( not ( = ?auto_302349 ?auto_302344 ) ) ( not ( = ?auto_302349 ?auto_302348 ) ) ( not ( = ?auto_302349 ?auto_302347 ) ) )
    :subtasks
    ( ( GET-5IMAGE ?auto_302342 ?auto_302343 ?auto_302340 ?auto_302341 ?auto_302338 ?auto_302339 ?auto_302334 ?auto_302335 ?auto_302337 ?auto_302336 )
      ( GET-5IMAGE-VERIFY ?auto_302334 ?auto_302335 ?auto_302337 ?auto_302336 ?auto_302338 ?auto_302339 ?auto_302340 ?auto_302341 ?auto_302342 ?auto_302343 ) )
  )

)

