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
      ?auto_20476 - DIRECTION
      ?auto_20477 - MODE
    )
    :vars
    (
      ?auto_20478 - INSTRUMENT
      ?auto_20479 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_20478 ) ( ON_BOARD ?auto_20478 ?auto_20479 ) ( SUPPORTS ?auto_20478 ?auto_20477 ) ( POWER_ON ?auto_20478 ) ( POINTING ?auto_20479 ?auto_20476 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_20479 ?auto_20476 ?auto_20478 ?auto_20477 )
      ( GET-1IMAGE-VERIFY ?auto_20476 ?auto_20477 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_20494 - DIRECTION
      ?auto_20495 - MODE
    )
    :vars
    (
      ?auto_20496 - INSTRUMENT
      ?auto_20497 - SATELLITE
      ?auto_20498 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_20496 ) ( ON_BOARD ?auto_20496 ?auto_20497 ) ( SUPPORTS ?auto_20496 ?auto_20495 ) ( POWER_ON ?auto_20496 ) ( POINTING ?auto_20497 ?auto_20498 ) ( not ( = ?auto_20494 ?auto_20498 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_20497 ?auto_20494 ?auto_20498 )
      ( GET-1IMAGE ?auto_20494 ?auto_20495 )
      ( GET-1IMAGE-VERIFY ?auto_20494 ?auto_20495 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_20515 - DIRECTION
      ?auto_20516 - MODE
    )
    :vars
    (
      ?auto_20519 - INSTRUMENT
      ?auto_20518 - SATELLITE
      ?auto_20517 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20519 ?auto_20518 ) ( SUPPORTS ?auto_20519 ?auto_20516 ) ( POWER_ON ?auto_20519 ) ( POINTING ?auto_20518 ?auto_20517 ) ( not ( = ?auto_20515 ?auto_20517 ) ) ( CALIBRATION_TARGET ?auto_20519 ?auto_20517 ) ( NOT_CALIBRATED ?auto_20519 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_20518 ?auto_20519 ?auto_20517 )
      ( GET-1IMAGE ?auto_20515 ?auto_20516 )
      ( GET-1IMAGE-VERIFY ?auto_20515 ?auto_20516 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_20536 - DIRECTION
      ?auto_20537 - MODE
    )
    :vars
    (
      ?auto_20540 - INSTRUMENT
      ?auto_20539 - SATELLITE
      ?auto_20538 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20540 ?auto_20539 ) ( SUPPORTS ?auto_20540 ?auto_20537 ) ( POINTING ?auto_20539 ?auto_20538 ) ( not ( = ?auto_20536 ?auto_20538 ) ) ( CALIBRATION_TARGET ?auto_20540 ?auto_20538 ) ( POWER_AVAIL ?auto_20539 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_20540 ?auto_20539 )
      ( GET-1IMAGE ?auto_20536 ?auto_20537 )
      ( GET-1IMAGE-VERIFY ?auto_20536 ?auto_20537 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_20557 - DIRECTION
      ?auto_20558 - MODE
    )
    :vars
    (
      ?auto_20560 - INSTRUMENT
      ?auto_20561 - SATELLITE
      ?auto_20559 - DIRECTION
      ?auto_20562 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20560 ?auto_20561 ) ( SUPPORTS ?auto_20560 ?auto_20558 ) ( not ( = ?auto_20557 ?auto_20559 ) ) ( CALIBRATION_TARGET ?auto_20560 ?auto_20559 ) ( POWER_AVAIL ?auto_20561 ) ( POINTING ?auto_20561 ?auto_20562 ) ( not ( = ?auto_20559 ?auto_20562 ) ) ( not ( = ?auto_20557 ?auto_20562 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_20561 ?auto_20559 ?auto_20562 )
      ( GET-1IMAGE ?auto_20557 ?auto_20558 )
      ( GET-1IMAGE-VERIFY ?auto_20557 ?auto_20558 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_20637 - DIRECTION
      ?auto_20638 - MODE
    )
    :vars
    (
      ?auto_20639 - INSTRUMENT
      ?auto_20640 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_20639 ) ( ON_BOARD ?auto_20639 ?auto_20640 ) ( SUPPORTS ?auto_20639 ?auto_20638 ) ( POWER_ON ?auto_20639 ) ( POINTING ?auto_20640 ?auto_20637 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_20640 ?auto_20637 ?auto_20639 ?auto_20638 )
      ( GET-1IMAGE-VERIFY ?auto_20637 ?auto_20638 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20641 - DIRECTION
      ?auto_20642 - MODE
      ?auto_20644 - DIRECTION
      ?auto_20643 - MODE
    )
    :vars
    (
      ?auto_20646 - INSTRUMENT
      ?auto_20645 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_20644 ?auto_20641 ) ) ( CALIBRATED ?auto_20646 ) ( ON_BOARD ?auto_20646 ?auto_20645 ) ( SUPPORTS ?auto_20646 ?auto_20643 ) ( POWER_ON ?auto_20646 ) ( POINTING ?auto_20645 ?auto_20644 ) ( HAVE_IMAGE ?auto_20641 ?auto_20642 ) ( not ( = ?auto_20642 ?auto_20643 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_20644 ?auto_20643 )
      ( GET-2IMAGE-VERIFY ?auto_20641 ?auto_20642 ?auto_20644 ?auto_20643 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20647 - DIRECTION
      ?auto_20648 - MODE
      ?auto_20650 - DIRECTION
      ?auto_20649 - MODE
    )
    :vars
    (
      ?auto_20652 - INSTRUMENT
      ?auto_20651 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_20650 ?auto_20647 ) ) ( CALIBRATED ?auto_20652 ) ( ON_BOARD ?auto_20652 ?auto_20651 ) ( SUPPORTS ?auto_20652 ?auto_20648 ) ( POWER_ON ?auto_20652 ) ( POINTING ?auto_20651 ?auto_20647 ) ( HAVE_IMAGE ?auto_20650 ?auto_20649 ) ( not ( = ?auto_20648 ?auto_20649 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_20647 ?auto_20648 )
      ( GET-2IMAGE-VERIFY ?auto_20647 ?auto_20648 ?auto_20650 ?auto_20649 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_20715 - DIRECTION
      ?auto_20716 - MODE
    )
    :vars
    (
      ?auto_20718 - INSTRUMENT
      ?auto_20717 - SATELLITE
      ?auto_20719 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_20718 ) ( ON_BOARD ?auto_20718 ?auto_20717 ) ( SUPPORTS ?auto_20718 ?auto_20716 ) ( POWER_ON ?auto_20718 ) ( POINTING ?auto_20717 ?auto_20719 ) ( not ( = ?auto_20715 ?auto_20719 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_20717 ?auto_20715 ?auto_20719 )
      ( GET-1IMAGE ?auto_20715 ?auto_20716 )
      ( GET-1IMAGE-VERIFY ?auto_20715 ?auto_20716 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20720 - DIRECTION
      ?auto_20721 - MODE
      ?auto_20723 - DIRECTION
      ?auto_20722 - MODE
    )
    :vars
    (
      ?auto_20726 - INSTRUMENT
      ?auto_20724 - SATELLITE
      ?auto_20725 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20723 ?auto_20720 ) ) ( CALIBRATED ?auto_20726 ) ( ON_BOARD ?auto_20726 ?auto_20724 ) ( SUPPORTS ?auto_20726 ?auto_20722 ) ( POWER_ON ?auto_20726 ) ( POINTING ?auto_20724 ?auto_20725 ) ( not ( = ?auto_20723 ?auto_20725 ) ) ( HAVE_IMAGE ?auto_20720 ?auto_20721 ) ( not ( = ?auto_20720 ?auto_20725 ) ) ( not ( = ?auto_20721 ?auto_20722 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_20723 ?auto_20722 )
      ( GET-2IMAGE-VERIFY ?auto_20720 ?auto_20721 ?auto_20723 ?auto_20722 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20727 - DIRECTION
      ?auto_20728 - MODE
      ?auto_20730 - DIRECTION
      ?auto_20729 - MODE
    )
    :vars
    (
      ?auto_20733 - INSTRUMENT
      ?auto_20731 - SATELLITE
      ?auto_20732 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20730 ?auto_20727 ) ) ( CALIBRATED ?auto_20733 ) ( ON_BOARD ?auto_20733 ?auto_20731 ) ( SUPPORTS ?auto_20733 ?auto_20728 ) ( POWER_ON ?auto_20733 ) ( POINTING ?auto_20731 ?auto_20732 ) ( not ( = ?auto_20727 ?auto_20732 ) ) ( HAVE_IMAGE ?auto_20730 ?auto_20729 ) ( not ( = ?auto_20730 ?auto_20732 ) ) ( not ( = ?auto_20729 ?auto_20728 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20730 ?auto_20729 ?auto_20727 ?auto_20728 )
      ( GET-2IMAGE-VERIFY ?auto_20727 ?auto_20728 ?auto_20730 ?auto_20729 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_20808 - DIRECTION
      ?auto_20809 - MODE
    )
    :vars
    (
      ?auto_20811 - DIRECTION
      ?auto_20814 - INSTRUMENT
      ?auto_20810 - SATELLITE
      ?auto_20813 - DIRECTION
      ?auto_20812 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_20808 ?auto_20811 ) ) ( ON_BOARD ?auto_20814 ?auto_20810 ) ( SUPPORTS ?auto_20814 ?auto_20809 ) ( POWER_ON ?auto_20814 ) ( POINTING ?auto_20810 ?auto_20813 ) ( not ( = ?auto_20808 ?auto_20813 ) ) ( HAVE_IMAGE ?auto_20811 ?auto_20812 ) ( not ( = ?auto_20811 ?auto_20813 ) ) ( not ( = ?auto_20812 ?auto_20809 ) ) ( CALIBRATION_TARGET ?auto_20814 ?auto_20813 ) ( NOT_CALIBRATED ?auto_20814 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_20810 ?auto_20814 ?auto_20813 )
      ( GET-2IMAGE ?auto_20811 ?auto_20812 ?auto_20808 ?auto_20809 )
      ( GET-1IMAGE-VERIFY ?auto_20808 ?auto_20809 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20815 - DIRECTION
      ?auto_20816 - MODE
      ?auto_20818 - DIRECTION
      ?auto_20817 - MODE
    )
    :vars
    (
      ?auto_20819 - INSTRUMENT
      ?auto_20820 - SATELLITE
      ?auto_20821 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20818 ?auto_20815 ) ) ( ON_BOARD ?auto_20819 ?auto_20820 ) ( SUPPORTS ?auto_20819 ?auto_20817 ) ( POWER_ON ?auto_20819 ) ( POINTING ?auto_20820 ?auto_20821 ) ( not ( = ?auto_20818 ?auto_20821 ) ) ( HAVE_IMAGE ?auto_20815 ?auto_20816 ) ( not ( = ?auto_20815 ?auto_20821 ) ) ( not ( = ?auto_20816 ?auto_20817 ) ) ( CALIBRATION_TARGET ?auto_20819 ?auto_20821 ) ( NOT_CALIBRATED ?auto_20819 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_20818 ?auto_20817 )
      ( GET-2IMAGE-VERIFY ?auto_20815 ?auto_20816 ?auto_20818 ?auto_20817 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20822 - DIRECTION
      ?auto_20823 - MODE
      ?auto_20825 - DIRECTION
      ?auto_20824 - MODE
    )
    :vars
    (
      ?auto_20828 - INSTRUMENT
      ?auto_20827 - SATELLITE
      ?auto_20826 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20825 ?auto_20822 ) ) ( ON_BOARD ?auto_20828 ?auto_20827 ) ( SUPPORTS ?auto_20828 ?auto_20823 ) ( POWER_ON ?auto_20828 ) ( POINTING ?auto_20827 ?auto_20826 ) ( not ( = ?auto_20822 ?auto_20826 ) ) ( HAVE_IMAGE ?auto_20825 ?auto_20824 ) ( not ( = ?auto_20825 ?auto_20826 ) ) ( not ( = ?auto_20824 ?auto_20823 ) ) ( CALIBRATION_TARGET ?auto_20828 ?auto_20826 ) ( NOT_CALIBRATED ?auto_20828 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20825 ?auto_20824 ?auto_20822 ?auto_20823 )
      ( GET-2IMAGE-VERIFY ?auto_20822 ?auto_20823 ?auto_20825 ?auto_20824 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_20903 - DIRECTION
      ?auto_20904 - MODE
    )
    :vars
    (
      ?auto_20909 - DIRECTION
      ?auto_20907 - INSTRUMENT
      ?auto_20906 - SATELLITE
      ?auto_20905 - DIRECTION
      ?auto_20908 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_20903 ?auto_20909 ) ) ( ON_BOARD ?auto_20907 ?auto_20906 ) ( SUPPORTS ?auto_20907 ?auto_20904 ) ( POINTING ?auto_20906 ?auto_20905 ) ( not ( = ?auto_20903 ?auto_20905 ) ) ( HAVE_IMAGE ?auto_20909 ?auto_20908 ) ( not ( = ?auto_20909 ?auto_20905 ) ) ( not ( = ?auto_20908 ?auto_20904 ) ) ( CALIBRATION_TARGET ?auto_20907 ?auto_20905 ) ( POWER_AVAIL ?auto_20906 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_20907 ?auto_20906 )
      ( GET-2IMAGE ?auto_20909 ?auto_20908 ?auto_20903 ?auto_20904 )
      ( GET-1IMAGE-VERIFY ?auto_20903 ?auto_20904 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20910 - DIRECTION
      ?auto_20911 - MODE
      ?auto_20913 - DIRECTION
      ?auto_20912 - MODE
    )
    :vars
    (
      ?auto_20916 - INSTRUMENT
      ?auto_20915 - SATELLITE
      ?auto_20914 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20913 ?auto_20910 ) ) ( ON_BOARD ?auto_20916 ?auto_20915 ) ( SUPPORTS ?auto_20916 ?auto_20912 ) ( POINTING ?auto_20915 ?auto_20914 ) ( not ( = ?auto_20913 ?auto_20914 ) ) ( HAVE_IMAGE ?auto_20910 ?auto_20911 ) ( not ( = ?auto_20910 ?auto_20914 ) ) ( not ( = ?auto_20911 ?auto_20912 ) ) ( CALIBRATION_TARGET ?auto_20916 ?auto_20914 ) ( POWER_AVAIL ?auto_20915 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_20913 ?auto_20912 )
      ( GET-2IMAGE-VERIFY ?auto_20910 ?auto_20911 ?auto_20913 ?auto_20912 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_20917 - DIRECTION
      ?auto_20918 - MODE
      ?auto_20920 - DIRECTION
      ?auto_20919 - MODE
    )
    :vars
    (
      ?auto_20921 - INSTRUMENT
      ?auto_20923 - SATELLITE
      ?auto_20922 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_20920 ?auto_20917 ) ) ( ON_BOARD ?auto_20921 ?auto_20923 ) ( SUPPORTS ?auto_20921 ?auto_20918 ) ( POINTING ?auto_20923 ?auto_20922 ) ( not ( = ?auto_20917 ?auto_20922 ) ) ( HAVE_IMAGE ?auto_20920 ?auto_20919 ) ( not ( = ?auto_20920 ?auto_20922 ) ) ( not ( = ?auto_20919 ?auto_20918 ) ) ( CALIBRATION_TARGET ?auto_20921 ?auto_20922 ) ( POWER_AVAIL ?auto_20923 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20920 ?auto_20919 ?auto_20917 ?auto_20918 )
      ( GET-2IMAGE-VERIFY ?auto_20917 ?auto_20918 ?auto_20920 ?auto_20919 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_20998 - DIRECTION
      ?auto_20999 - MODE
    )
    :vars
    (
      ?auto_21000 - DIRECTION
      ?auto_21001 - INSTRUMENT
      ?auto_21004 - SATELLITE
      ?auto_21003 - DIRECTION
      ?auto_21002 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_20998 ?auto_21000 ) ) ( ON_BOARD ?auto_21001 ?auto_21004 ) ( SUPPORTS ?auto_21001 ?auto_20999 ) ( not ( = ?auto_20998 ?auto_21003 ) ) ( HAVE_IMAGE ?auto_21000 ?auto_21002 ) ( not ( = ?auto_21000 ?auto_21003 ) ) ( not ( = ?auto_21002 ?auto_20999 ) ) ( CALIBRATION_TARGET ?auto_21001 ?auto_21003 ) ( POWER_AVAIL ?auto_21004 ) ( POINTING ?auto_21004 ?auto_21000 ) )
    :subtasks
    ( ( !TURN_TO ?auto_21004 ?auto_21003 ?auto_21000 )
      ( GET-2IMAGE ?auto_21000 ?auto_21002 ?auto_20998 ?auto_20999 )
      ( GET-1IMAGE-VERIFY ?auto_20998 ?auto_20999 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21005 - DIRECTION
      ?auto_21006 - MODE
      ?auto_21008 - DIRECTION
      ?auto_21007 - MODE
    )
    :vars
    (
      ?auto_21010 - INSTRUMENT
      ?auto_21009 - SATELLITE
      ?auto_21011 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_21008 ?auto_21005 ) ) ( ON_BOARD ?auto_21010 ?auto_21009 ) ( SUPPORTS ?auto_21010 ?auto_21007 ) ( not ( = ?auto_21008 ?auto_21011 ) ) ( HAVE_IMAGE ?auto_21005 ?auto_21006 ) ( not ( = ?auto_21005 ?auto_21011 ) ) ( not ( = ?auto_21006 ?auto_21007 ) ) ( CALIBRATION_TARGET ?auto_21010 ?auto_21011 ) ( POWER_AVAIL ?auto_21009 ) ( POINTING ?auto_21009 ?auto_21005 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21008 ?auto_21007 )
      ( GET-2IMAGE-VERIFY ?auto_21005 ?auto_21006 ?auto_21008 ?auto_21007 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21012 - DIRECTION
      ?auto_21013 - MODE
      ?auto_21015 - DIRECTION
      ?auto_21014 - MODE
    )
    :vars
    (
      ?auto_21018 - INSTRUMENT
      ?auto_21017 - SATELLITE
      ?auto_21016 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_21015 ?auto_21012 ) ) ( ON_BOARD ?auto_21018 ?auto_21017 ) ( SUPPORTS ?auto_21018 ?auto_21013 ) ( not ( = ?auto_21012 ?auto_21016 ) ) ( HAVE_IMAGE ?auto_21015 ?auto_21014 ) ( not ( = ?auto_21015 ?auto_21016 ) ) ( not ( = ?auto_21014 ?auto_21013 ) ) ( CALIBRATION_TARGET ?auto_21018 ?auto_21016 ) ( POWER_AVAIL ?auto_21017 ) ( POINTING ?auto_21017 ?auto_21015 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21015 ?auto_21014 ?auto_21012 ?auto_21013 )
      ( GET-2IMAGE-VERIFY ?auto_21012 ?auto_21013 ?auto_21015 ?auto_21014 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_21093 - DIRECTION
      ?auto_21094 - MODE
    )
    :vars
    (
      ?auto_21097 - DIRECTION
      ?auto_21099 - INSTRUMENT
      ?auto_21098 - SATELLITE
      ?auto_21096 - DIRECTION
      ?auto_21095 - MODE
      ?auto_21100 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_21093 ?auto_21097 ) ) ( ON_BOARD ?auto_21099 ?auto_21098 ) ( SUPPORTS ?auto_21099 ?auto_21094 ) ( not ( = ?auto_21093 ?auto_21096 ) ) ( HAVE_IMAGE ?auto_21097 ?auto_21095 ) ( not ( = ?auto_21097 ?auto_21096 ) ) ( not ( = ?auto_21095 ?auto_21094 ) ) ( CALIBRATION_TARGET ?auto_21099 ?auto_21096 ) ( POINTING ?auto_21098 ?auto_21097 ) ( ON_BOARD ?auto_21100 ?auto_21098 ) ( POWER_ON ?auto_21100 ) ( not ( = ?auto_21099 ?auto_21100 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_21100 ?auto_21098 )
      ( GET-2IMAGE ?auto_21097 ?auto_21095 ?auto_21093 ?auto_21094 )
      ( GET-1IMAGE-VERIFY ?auto_21093 ?auto_21094 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21101 - DIRECTION
      ?auto_21102 - MODE
      ?auto_21104 - DIRECTION
      ?auto_21103 - MODE
    )
    :vars
    (
      ?auto_21106 - INSTRUMENT
      ?auto_21108 - SATELLITE
      ?auto_21105 - DIRECTION
      ?auto_21107 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_21104 ?auto_21101 ) ) ( ON_BOARD ?auto_21106 ?auto_21108 ) ( SUPPORTS ?auto_21106 ?auto_21103 ) ( not ( = ?auto_21104 ?auto_21105 ) ) ( HAVE_IMAGE ?auto_21101 ?auto_21102 ) ( not ( = ?auto_21101 ?auto_21105 ) ) ( not ( = ?auto_21102 ?auto_21103 ) ) ( CALIBRATION_TARGET ?auto_21106 ?auto_21105 ) ( POINTING ?auto_21108 ?auto_21101 ) ( ON_BOARD ?auto_21107 ?auto_21108 ) ( POWER_ON ?auto_21107 ) ( not ( = ?auto_21106 ?auto_21107 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21104 ?auto_21103 )
      ( GET-2IMAGE-VERIFY ?auto_21101 ?auto_21102 ?auto_21104 ?auto_21103 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21109 - DIRECTION
      ?auto_21110 - MODE
      ?auto_21112 - DIRECTION
      ?auto_21111 - MODE
    )
    :vars
    (
      ?auto_21115 - INSTRUMENT
      ?auto_21114 - SATELLITE
      ?auto_21113 - DIRECTION
      ?auto_21116 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_21112 ?auto_21109 ) ) ( ON_BOARD ?auto_21115 ?auto_21114 ) ( SUPPORTS ?auto_21115 ?auto_21110 ) ( not ( = ?auto_21109 ?auto_21113 ) ) ( HAVE_IMAGE ?auto_21112 ?auto_21111 ) ( not ( = ?auto_21112 ?auto_21113 ) ) ( not ( = ?auto_21111 ?auto_21110 ) ) ( CALIBRATION_TARGET ?auto_21115 ?auto_21113 ) ( POINTING ?auto_21114 ?auto_21112 ) ( ON_BOARD ?auto_21116 ?auto_21114 ) ( POWER_ON ?auto_21116 ) ( not ( = ?auto_21115 ?auto_21116 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21112 ?auto_21111 ?auto_21109 ?auto_21110 )
      ( GET-2IMAGE-VERIFY ?auto_21109 ?auto_21110 ?auto_21112 ?auto_21111 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_21199 - DIRECTION
      ?auto_21200 - MODE
    )
    :vars
    (
      ?auto_21202 - DIRECTION
      ?auto_21204 - INSTRUMENT
      ?auto_21203 - SATELLITE
      ?auto_21201 - DIRECTION
      ?auto_21205 - MODE
      ?auto_21206 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_21199 ?auto_21202 ) ) ( ON_BOARD ?auto_21204 ?auto_21203 ) ( SUPPORTS ?auto_21204 ?auto_21200 ) ( not ( = ?auto_21199 ?auto_21201 ) ) ( not ( = ?auto_21202 ?auto_21201 ) ) ( not ( = ?auto_21205 ?auto_21200 ) ) ( CALIBRATION_TARGET ?auto_21204 ?auto_21201 ) ( POINTING ?auto_21203 ?auto_21202 ) ( ON_BOARD ?auto_21206 ?auto_21203 ) ( POWER_ON ?auto_21206 ) ( not ( = ?auto_21204 ?auto_21206 ) ) ( CALIBRATED ?auto_21206 ) ( SUPPORTS ?auto_21206 ?auto_21205 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21202 ?auto_21205 )
      ( GET-2IMAGE ?auto_21202 ?auto_21205 ?auto_21199 ?auto_21200 )
      ( GET-1IMAGE-VERIFY ?auto_21199 ?auto_21200 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21207 - DIRECTION
      ?auto_21208 - MODE
      ?auto_21210 - DIRECTION
      ?auto_21209 - MODE
    )
    :vars
    (
      ?auto_21213 - INSTRUMENT
      ?auto_21211 - SATELLITE
      ?auto_21214 - DIRECTION
      ?auto_21212 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_21210 ?auto_21207 ) ) ( ON_BOARD ?auto_21213 ?auto_21211 ) ( SUPPORTS ?auto_21213 ?auto_21209 ) ( not ( = ?auto_21210 ?auto_21214 ) ) ( not ( = ?auto_21207 ?auto_21214 ) ) ( not ( = ?auto_21208 ?auto_21209 ) ) ( CALIBRATION_TARGET ?auto_21213 ?auto_21214 ) ( POINTING ?auto_21211 ?auto_21207 ) ( ON_BOARD ?auto_21212 ?auto_21211 ) ( POWER_ON ?auto_21212 ) ( not ( = ?auto_21213 ?auto_21212 ) ) ( CALIBRATED ?auto_21212 ) ( SUPPORTS ?auto_21212 ?auto_21208 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21210 ?auto_21209 )
      ( GET-2IMAGE-VERIFY ?auto_21207 ?auto_21208 ?auto_21210 ?auto_21209 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21215 - DIRECTION
      ?auto_21216 - MODE
      ?auto_21218 - DIRECTION
      ?auto_21217 - MODE
    )
    :vars
    (
      ?auto_21221 - INSTRUMENT
      ?auto_21219 - SATELLITE
      ?auto_21222 - DIRECTION
      ?auto_21220 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_21218 ?auto_21215 ) ) ( ON_BOARD ?auto_21221 ?auto_21219 ) ( SUPPORTS ?auto_21221 ?auto_21216 ) ( not ( = ?auto_21215 ?auto_21222 ) ) ( not ( = ?auto_21218 ?auto_21222 ) ) ( not ( = ?auto_21217 ?auto_21216 ) ) ( CALIBRATION_TARGET ?auto_21221 ?auto_21222 ) ( POINTING ?auto_21219 ?auto_21218 ) ( ON_BOARD ?auto_21220 ?auto_21219 ) ( POWER_ON ?auto_21220 ) ( not ( = ?auto_21221 ?auto_21220 ) ) ( CALIBRATED ?auto_21220 ) ( SUPPORTS ?auto_21220 ?auto_21217 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21218 ?auto_21217 ?auto_21215 ?auto_21216 )
      ( GET-2IMAGE-VERIFY ?auto_21215 ?auto_21216 ?auto_21218 ?auto_21217 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_21305 - DIRECTION
      ?auto_21306 - MODE
    )
    :vars
    (
      ?auto_21309 - DIRECTION
      ?auto_21311 - INSTRUMENT
      ?auto_21307 - SATELLITE
      ?auto_21312 - DIRECTION
      ?auto_21310 - MODE
      ?auto_21308 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_21305 ?auto_21309 ) ) ( ON_BOARD ?auto_21311 ?auto_21307 ) ( SUPPORTS ?auto_21311 ?auto_21306 ) ( not ( = ?auto_21305 ?auto_21312 ) ) ( not ( = ?auto_21309 ?auto_21312 ) ) ( not ( = ?auto_21310 ?auto_21306 ) ) ( CALIBRATION_TARGET ?auto_21311 ?auto_21312 ) ( ON_BOARD ?auto_21308 ?auto_21307 ) ( POWER_ON ?auto_21308 ) ( not ( = ?auto_21311 ?auto_21308 ) ) ( CALIBRATED ?auto_21308 ) ( SUPPORTS ?auto_21308 ?auto_21310 ) ( POINTING ?auto_21307 ?auto_21312 ) )
    :subtasks
    ( ( !TURN_TO ?auto_21307 ?auto_21309 ?auto_21312 )
      ( GET-2IMAGE ?auto_21309 ?auto_21310 ?auto_21305 ?auto_21306 )
      ( GET-1IMAGE-VERIFY ?auto_21305 ?auto_21306 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21313 - DIRECTION
      ?auto_21314 - MODE
      ?auto_21316 - DIRECTION
      ?auto_21315 - MODE
    )
    :vars
    (
      ?auto_21319 - INSTRUMENT
      ?auto_21317 - SATELLITE
      ?auto_21318 - DIRECTION
      ?auto_21320 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_21316 ?auto_21313 ) ) ( ON_BOARD ?auto_21319 ?auto_21317 ) ( SUPPORTS ?auto_21319 ?auto_21315 ) ( not ( = ?auto_21316 ?auto_21318 ) ) ( not ( = ?auto_21313 ?auto_21318 ) ) ( not ( = ?auto_21314 ?auto_21315 ) ) ( CALIBRATION_TARGET ?auto_21319 ?auto_21318 ) ( ON_BOARD ?auto_21320 ?auto_21317 ) ( POWER_ON ?auto_21320 ) ( not ( = ?auto_21319 ?auto_21320 ) ) ( CALIBRATED ?auto_21320 ) ( SUPPORTS ?auto_21320 ?auto_21314 ) ( POINTING ?auto_21317 ?auto_21318 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21316 ?auto_21315 )
      ( GET-2IMAGE-VERIFY ?auto_21313 ?auto_21314 ?auto_21316 ?auto_21315 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21321 - DIRECTION
      ?auto_21322 - MODE
      ?auto_21324 - DIRECTION
      ?auto_21323 - MODE
    )
    :vars
    (
      ?auto_21326 - INSTRUMENT
      ?auto_21325 - SATELLITE
      ?auto_21327 - DIRECTION
      ?auto_21328 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_21324 ?auto_21321 ) ) ( ON_BOARD ?auto_21326 ?auto_21325 ) ( SUPPORTS ?auto_21326 ?auto_21322 ) ( not ( = ?auto_21321 ?auto_21327 ) ) ( not ( = ?auto_21324 ?auto_21327 ) ) ( not ( = ?auto_21323 ?auto_21322 ) ) ( CALIBRATION_TARGET ?auto_21326 ?auto_21327 ) ( ON_BOARD ?auto_21328 ?auto_21325 ) ( POWER_ON ?auto_21328 ) ( not ( = ?auto_21326 ?auto_21328 ) ) ( CALIBRATED ?auto_21328 ) ( SUPPORTS ?auto_21328 ?auto_21323 ) ( POINTING ?auto_21325 ?auto_21327 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21324 ?auto_21323 ?auto_21321 ?auto_21322 )
      ( GET-2IMAGE-VERIFY ?auto_21321 ?auto_21322 ?auto_21324 ?auto_21323 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_21411 - DIRECTION
      ?auto_21412 - MODE
    )
    :vars
    (
      ?auto_21415 - DIRECTION
      ?auto_21416 - INSTRUMENT
      ?auto_21414 - SATELLITE
      ?auto_21417 - DIRECTION
      ?auto_21413 - MODE
      ?auto_21418 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_21411 ?auto_21415 ) ) ( ON_BOARD ?auto_21416 ?auto_21414 ) ( SUPPORTS ?auto_21416 ?auto_21412 ) ( not ( = ?auto_21411 ?auto_21417 ) ) ( not ( = ?auto_21415 ?auto_21417 ) ) ( not ( = ?auto_21413 ?auto_21412 ) ) ( CALIBRATION_TARGET ?auto_21416 ?auto_21417 ) ( ON_BOARD ?auto_21418 ?auto_21414 ) ( POWER_ON ?auto_21418 ) ( not ( = ?auto_21416 ?auto_21418 ) ) ( SUPPORTS ?auto_21418 ?auto_21413 ) ( POINTING ?auto_21414 ?auto_21417 ) ( CALIBRATION_TARGET ?auto_21418 ?auto_21417 ) ( NOT_CALIBRATED ?auto_21418 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_21414 ?auto_21418 ?auto_21417 )
      ( GET-2IMAGE ?auto_21415 ?auto_21413 ?auto_21411 ?auto_21412 )
      ( GET-1IMAGE-VERIFY ?auto_21411 ?auto_21412 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21419 - DIRECTION
      ?auto_21420 - MODE
      ?auto_21422 - DIRECTION
      ?auto_21421 - MODE
    )
    :vars
    (
      ?auto_21426 - INSTRUMENT
      ?auto_21423 - SATELLITE
      ?auto_21424 - DIRECTION
      ?auto_21425 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_21422 ?auto_21419 ) ) ( ON_BOARD ?auto_21426 ?auto_21423 ) ( SUPPORTS ?auto_21426 ?auto_21421 ) ( not ( = ?auto_21422 ?auto_21424 ) ) ( not ( = ?auto_21419 ?auto_21424 ) ) ( not ( = ?auto_21420 ?auto_21421 ) ) ( CALIBRATION_TARGET ?auto_21426 ?auto_21424 ) ( ON_BOARD ?auto_21425 ?auto_21423 ) ( POWER_ON ?auto_21425 ) ( not ( = ?auto_21426 ?auto_21425 ) ) ( SUPPORTS ?auto_21425 ?auto_21420 ) ( POINTING ?auto_21423 ?auto_21424 ) ( CALIBRATION_TARGET ?auto_21425 ?auto_21424 ) ( NOT_CALIBRATED ?auto_21425 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21422 ?auto_21421 )
      ( GET-2IMAGE-VERIFY ?auto_21419 ?auto_21420 ?auto_21422 ?auto_21421 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21427 - DIRECTION
      ?auto_21428 - MODE
      ?auto_21430 - DIRECTION
      ?auto_21429 - MODE
    )
    :vars
    (
      ?auto_21434 - INSTRUMENT
      ?auto_21431 - SATELLITE
      ?auto_21433 - DIRECTION
      ?auto_21432 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_21430 ?auto_21427 ) ) ( ON_BOARD ?auto_21434 ?auto_21431 ) ( SUPPORTS ?auto_21434 ?auto_21428 ) ( not ( = ?auto_21427 ?auto_21433 ) ) ( not ( = ?auto_21430 ?auto_21433 ) ) ( not ( = ?auto_21429 ?auto_21428 ) ) ( CALIBRATION_TARGET ?auto_21434 ?auto_21433 ) ( ON_BOARD ?auto_21432 ?auto_21431 ) ( POWER_ON ?auto_21432 ) ( not ( = ?auto_21434 ?auto_21432 ) ) ( SUPPORTS ?auto_21432 ?auto_21429 ) ( POINTING ?auto_21431 ?auto_21433 ) ( CALIBRATION_TARGET ?auto_21432 ?auto_21433 ) ( NOT_CALIBRATED ?auto_21432 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21430 ?auto_21429 ?auto_21427 ?auto_21428 )
      ( GET-2IMAGE-VERIFY ?auto_21427 ?auto_21428 ?auto_21430 ?auto_21429 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_21517 - DIRECTION
      ?auto_21518 - MODE
    )
    :vars
    (
      ?auto_21521 - DIRECTION
      ?auto_21524 - INSTRUMENT
      ?auto_21519 - SATELLITE
      ?auto_21523 - DIRECTION
      ?auto_21522 - MODE
      ?auto_21520 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_21517 ?auto_21521 ) ) ( ON_BOARD ?auto_21524 ?auto_21519 ) ( SUPPORTS ?auto_21524 ?auto_21518 ) ( not ( = ?auto_21517 ?auto_21523 ) ) ( not ( = ?auto_21521 ?auto_21523 ) ) ( not ( = ?auto_21522 ?auto_21518 ) ) ( CALIBRATION_TARGET ?auto_21524 ?auto_21523 ) ( ON_BOARD ?auto_21520 ?auto_21519 ) ( not ( = ?auto_21524 ?auto_21520 ) ) ( SUPPORTS ?auto_21520 ?auto_21522 ) ( POINTING ?auto_21519 ?auto_21523 ) ( CALIBRATION_TARGET ?auto_21520 ?auto_21523 ) ( POWER_AVAIL ?auto_21519 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_21520 ?auto_21519 )
      ( GET-2IMAGE ?auto_21521 ?auto_21522 ?auto_21517 ?auto_21518 )
      ( GET-1IMAGE-VERIFY ?auto_21517 ?auto_21518 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21525 - DIRECTION
      ?auto_21526 - MODE
      ?auto_21528 - DIRECTION
      ?auto_21527 - MODE
    )
    :vars
    (
      ?auto_21529 - INSTRUMENT
      ?auto_21530 - SATELLITE
      ?auto_21532 - DIRECTION
      ?auto_21531 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_21528 ?auto_21525 ) ) ( ON_BOARD ?auto_21529 ?auto_21530 ) ( SUPPORTS ?auto_21529 ?auto_21527 ) ( not ( = ?auto_21528 ?auto_21532 ) ) ( not ( = ?auto_21525 ?auto_21532 ) ) ( not ( = ?auto_21526 ?auto_21527 ) ) ( CALIBRATION_TARGET ?auto_21529 ?auto_21532 ) ( ON_BOARD ?auto_21531 ?auto_21530 ) ( not ( = ?auto_21529 ?auto_21531 ) ) ( SUPPORTS ?auto_21531 ?auto_21526 ) ( POINTING ?auto_21530 ?auto_21532 ) ( CALIBRATION_TARGET ?auto_21531 ?auto_21532 ) ( POWER_AVAIL ?auto_21530 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21528 ?auto_21527 )
      ( GET-2IMAGE-VERIFY ?auto_21525 ?auto_21526 ?auto_21528 ?auto_21527 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21533 - DIRECTION
      ?auto_21534 - MODE
      ?auto_21536 - DIRECTION
      ?auto_21535 - MODE
    )
    :vars
    (
      ?auto_21538 - INSTRUMENT
      ?auto_21539 - SATELLITE
      ?auto_21537 - DIRECTION
      ?auto_21540 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_21536 ?auto_21533 ) ) ( ON_BOARD ?auto_21538 ?auto_21539 ) ( SUPPORTS ?auto_21538 ?auto_21534 ) ( not ( = ?auto_21533 ?auto_21537 ) ) ( not ( = ?auto_21536 ?auto_21537 ) ) ( not ( = ?auto_21535 ?auto_21534 ) ) ( CALIBRATION_TARGET ?auto_21538 ?auto_21537 ) ( ON_BOARD ?auto_21540 ?auto_21539 ) ( not ( = ?auto_21538 ?auto_21540 ) ) ( SUPPORTS ?auto_21540 ?auto_21535 ) ( POINTING ?auto_21539 ?auto_21537 ) ( CALIBRATION_TARGET ?auto_21540 ?auto_21537 ) ( POWER_AVAIL ?auto_21539 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21536 ?auto_21535 ?auto_21533 ?auto_21534 )
      ( GET-2IMAGE-VERIFY ?auto_21533 ?auto_21534 ?auto_21536 ?auto_21535 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_21623 - DIRECTION
      ?auto_21624 - MODE
    )
    :vars
    (
      ?auto_21629 - DIRECTION
      ?auto_21626 - INSTRUMENT
      ?auto_21628 - SATELLITE
      ?auto_21625 - DIRECTION
      ?auto_21627 - MODE
      ?auto_21630 - INSTRUMENT
      ?auto_21631 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_21623 ?auto_21629 ) ) ( ON_BOARD ?auto_21626 ?auto_21628 ) ( SUPPORTS ?auto_21626 ?auto_21624 ) ( not ( = ?auto_21623 ?auto_21625 ) ) ( not ( = ?auto_21629 ?auto_21625 ) ) ( not ( = ?auto_21627 ?auto_21624 ) ) ( CALIBRATION_TARGET ?auto_21626 ?auto_21625 ) ( ON_BOARD ?auto_21630 ?auto_21628 ) ( not ( = ?auto_21626 ?auto_21630 ) ) ( SUPPORTS ?auto_21630 ?auto_21627 ) ( CALIBRATION_TARGET ?auto_21630 ?auto_21625 ) ( POWER_AVAIL ?auto_21628 ) ( POINTING ?auto_21628 ?auto_21631 ) ( not ( = ?auto_21625 ?auto_21631 ) ) ( not ( = ?auto_21623 ?auto_21631 ) ) ( not ( = ?auto_21629 ?auto_21631 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_21628 ?auto_21625 ?auto_21631 )
      ( GET-2IMAGE ?auto_21629 ?auto_21627 ?auto_21623 ?auto_21624 )
      ( GET-1IMAGE-VERIFY ?auto_21623 ?auto_21624 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21632 - DIRECTION
      ?auto_21633 - MODE
      ?auto_21635 - DIRECTION
      ?auto_21634 - MODE
    )
    :vars
    (
      ?auto_21637 - INSTRUMENT
      ?auto_21639 - SATELLITE
      ?auto_21640 - DIRECTION
      ?auto_21638 - INSTRUMENT
      ?auto_21636 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_21635 ?auto_21632 ) ) ( ON_BOARD ?auto_21637 ?auto_21639 ) ( SUPPORTS ?auto_21637 ?auto_21634 ) ( not ( = ?auto_21635 ?auto_21640 ) ) ( not ( = ?auto_21632 ?auto_21640 ) ) ( not ( = ?auto_21633 ?auto_21634 ) ) ( CALIBRATION_TARGET ?auto_21637 ?auto_21640 ) ( ON_BOARD ?auto_21638 ?auto_21639 ) ( not ( = ?auto_21637 ?auto_21638 ) ) ( SUPPORTS ?auto_21638 ?auto_21633 ) ( CALIBRATION_TARGET ?auto_21638 ?auto_21640 ) ( POWER_AVAIL ?auto_21639 ) ( POINTING ?auto_21639 ?auto_21636 ) ( not ( = ?auto_21640 ?auto_21636 ) ) ( not ( = ?auto_21635 ?auto_21636 ) ) ( not ( = ?auto_21632 ?auto_21636 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21635 ?auto_21634 )
      ( GET-2IMAGE-VERIFY ?auto_21632 ?auto_21633 ?auto_21635 ?auto_21634 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21641 - DIRECTION
      ?auto_21642 - MODE
      ?auto_21644 - DIRECTION
      ?auto_21643 - MODE
    )
    :vars
    (
      ?auto_21649 - INSTRUMENT
      ?auto_21647 - SATELLITE
      ?auto_21645 - DIRECTION
      ?auto_21648 - INSTRUMENT
      ?auto_21646 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_21644 ?auto_21641 ) ) ( ON_BOARD ?auto_21649 ?auto_21647 ) ( SUPPORTS ?auto_21649 ?auto_21642 ) ( not ( = ?auto_21641 ?auto_21645 ) ) ( not ( = ?auto_21644 ?auto_21645 ) ) ( not ( = ?auto_21643 ?auto_21642 ) ) ( CALIBRATION_TARGET ?auto_21649 ?auto_21645 ) ( ON_BOARD ?auto_21648 ?auto_21647 ) ( not ( = ?auto_21649 ?auto_21648 ) ) ( SUPPORTS ?auto_21648 ?auto_21643 ) ( CALIBRATION_TARGET ?auto_21648 ?auto_21645 ) ( POWER_AVAIL ?auto_21647 ) ( POINTING ?auto_21647 ?auto_21646 ) ( not ( = ?auto_21645 ?auto_21646 ) ) ( not ( = ?auto_21641 ?auto_21646 ) ) ( not ( = ?auto_21644 ?auto_21646 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21644 ?auto_21643 ?auto_21641 ?auto_21642 )
      ( GET-2IMAGE-VERIFY ?auto_21641 ?auto_21642 ?auto_21644 ?auto_21643 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_21876 - DIRECTION
      ?auto_21877 - MODE
    )
    :vars
    (
      ?auto_21878 - INSTRUMENT
      ?auto_21879 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_21878 ) ( ON_BOARD ?auto_21878 ?auto_21879 ) ( SUPPORTS ?auto_21878 ?auto_21877 ) ( POWER_ON ?auto_21878 ) ( POINTING ?auto_21879 ?auto_21876 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_21879 ?auto_21876 ?auto_21878 ?auto_21877 )
      ( GET-1IMAGE-VERIFY ?auto_21876 ?auto_21877 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21880 - DIRECTION
      ?auto_21881 - MODE
      ?auto_21883 - DIRECTION
      ?auto_21882 - MODE
    )
    :vars
    (
      ?auto_21885 - INSTRUMENT
      ?auto_21884 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_21883 ?auto_21880 ) ) ( CALIBRATED ?auto_21885 ) ( ON_BOARD ?auto_21885 ?auto_21884 ) ( SUPPORTS ?auto_21885 ?auto_21882 ) ( POWER_ON ?auto_21885 ) ( POINTING ?auto_21884 ?auto_21883 ) ( HAVE_IMAGE ?auto_21880 ?auto_21881 ) ( not ( = ?auto_21881 ?auto_21882 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21883 ?auto_21882 )
      ( GET-2IMAGE-VERIFY ?auto_21880 ?auto_21881 ?auto_21883 ?auto_21882 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21886 - DIRECTION
      ?auto_21887 - MODE
      ?auto_21889 - DIRECTION
      ?auto_21888 - MODE
    )
    :vars
    (
      ?auto_21891 - INSTRUMENT
      ?auto_21890 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_21889 ?auto_21886 ) ) ( CALIBRATED ?auto_21891 ) ( ON_BOARD ?auto_21891 ?auto_21890 ) ( SUPPORTS ?auto_21891 ?auto_21888 ) ( POWER_ON ?auto_21891 ) ( POINTING ?auto_21890 ?auto_21889 ) ( HAVE_IMAGE ?auto_21886 ?auto_21887 ) ( not ( = ?auto_21887 ?auto_21888 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21889 ?auto_21888 )
      ( GET-2IMAGE-VERIFY ?auto_21886 ?auto_21887 ?auto_21889 ?auto_21888 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21892 - DIRECTION
      ?auto_21893 - MODE
      ?auto_21895 - DIRECTION
      ?auto_21894 - MODE
    )
    :vars
    (
      ?auto_21897 - INSTRUMENT
      ?auto_21896 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_21895 ?auto_21892 ) ) ( CALIBRATED ?auto_21897 ) ( ON_BOARD ?auto_21897 ?auto_21896 ) ( SUPPORTS ?auto_21897 ?auto_21893 ) ( POWER_ON ?auto_21897 ) ( POINTING ?auto_21896 ?auto_21892 ) ( HAVE_IMAGE ?auto_21895 ?auto_21894 ) ( not ( = ?auto_21893 ?auto_21894 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21892 ?auto_21893 )
      ( GET-2IMAGE-VERIFY ?auto_21892 ?auto_21893 ?auto_21895 ?auto_21894 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_21898 - DIRECTION
      ?auto_21899 - MODE
      ?auto_21901 - DIRECTION
      ?auto_21900 - MODE
    )
    :vars
    (
      ?auto_21903 - INSTRUMENT
      ?auto_21902 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_21901 ?auto_21898 ) ) ( CALIBRATED ?auto_21903 ) ( ON_BOARD ?auto_21903 ?auto_21902 ) ( SUPPORTS ?auto_21903 ?auto_21899 ) ( POWER_ON ?auto_21903 ) ( POINTING ?auto_21902 ?auto_21898 ) ( HAVE_IMAGE ?auto_21901 ?auto_21900 ) ( not ( = ?auto_21899 ?auto_21900 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21898 ?auto_21899 )
      ( GET-2IMAGE-VERIFY ?auto_21898 ?auto_21899 ?auto_21901 ?auto_21900 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21918 - DIRECTION
      ?auto_21919 - MODE
      ?auto_21921 - DIRECTION
      ?auto_21920 - MODE
      ?auto_21923 - DIRECTION
      ?auto_21922 - MODE
    )
    :vars
    (
      ?auto_21925 - INSTRUMENT
      ?auto_21924 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_21921 ?auto_21918 ) ) ( not ( = ?auto_21923 ?auto_21918 ) ) ( not ( = ?auto_21923 ?auto_21921 ) ) ( CALIBRATED ?auto_21925 ) ( ON_BOARD ?auto_21925 ?auto_21924 ) ( SUPPORTS ?auto_21925 ?auto_21922 ) ( POWER_ON ?auto_21925 ) ( POINTING ?auto_21924 ?auto_21923 ) ( HAVE_IMAGE ?auto_21918 ?auto_21919 ) ( HAVE_IMAGE ?auto_21921 ?auto_21920 ) ( not ( = ?auto_21919 ?auto_21920 ) ) ( not ( = ?auto_21919 ?auto_21922 ) ) ( not ( = ?auto_21920 ?auto_21922 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21923 ?auto_21922 )
      ( GET-3IMAGE-VERIFY ?auto_21918 ?auto_21919 ?auto_21921 ?auto_21920 ?auto_21923 ?auto_21922 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21934 - DIRECTION
      ?auto_21935 - MODE
      ?auto_21937 - DIRECTION
      ?auto_21936 - MODE
      ?auto_21939 - DIRECTION
      ?auto_21938 - MODE
    )
    :vars
    (
      ?auto_21941 - INSTRUMENT
      ?auto_21940 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_21937 ?auto_21934 ) ) ( not ( = ?auto_21939 ?auto_21934 ) ) ( not ( = ?auto_21939 ?auto_21937 ) ) ( CALIBRATED ?auto_21941 ) ( ON_BOARD ?auto_21941 ?auto_21940 ) ( SUPPORTS ?auto_21941 ?auto_21936 ) ( POWER_ON ?auto_21941 ) ( POINTING ?auto_21940 ?auto_21937 ) ( HAVE_IMAGE ?auto_21934 ?auto_21935 ) ( HAVE_IMAGE ?auto_21939 ?auto_21938 ) ( not ( = ?auto_21935 ?auto_21936 ) ) ( not ( = ?auto_21935 ?auto_21938 ) ) ( not ( = ?auto_21936 ?auto_21938 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21937 ?auto_21936 )
      ( GET-3IMAGE-VERIFY ?auto_21934 ?auto_21935 ?auto_21937 ?auto_21936 ?auto_21939 ?auto_21938 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21950 - DIRECTION
      ?auto_21951 - MODE
      ?auto_21953 - DIRECTION
      ?auto_21952 - MODE
      ?auto_21955 - DIRECTION
      ?auto_21954 - MODE
    )
    :vars
    (
      ?auto_21957 - INSTRUMENT
      ?auto_21956 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_21953 ?auto_21950 ) ) ( not ( = ?auto_21955 ?auto_21950 ) ) ( not ( = ?auto_21955 ?auto_21953 ) ) ( CALIBRATED ?auto_21957 ) ( ON_BOARD ?auto_21957 ?auto_21956 ) ( SUPPORTS ?auto_21957 ?auto_21954 ) ( POWER_ON ?auto_21957 ) ( POINTING ?auto_21956 ?auto_21955 ) ( HAVE_IMAGE ?auto_21950 ?auto_21951 ) ( HAVE_IMAGE ?auto_21953 ?auto_21952 ) ( not ( = ?auto_21951 ?auto_21952 ) ) ( not ( = ?auto_21951 ?auto_21954 ) ) ( not ( = ?auto_21952 ?auto_21954 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21955 ?auto_21954 )
      ( GET-3IMAGE-VERIFY ?auto_21950 ?auto_21951 ?auto_21953 ?auto_21952 ?auto_21955 ?auto_21954 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21966 - DIRECTION
      ?auto_21967 - MODE
      ?auto_21969 - DIRECTION
      ?auto_21968 - MODE
      ?auto_21971 - DIRECTION
      ?auto_21970 - MODE
    )
    :vars
    (
      ?auto_21973 - INSTRUMENT
      ?auto_21972 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_21969 ?auto_21966 ) ) ( not ( = ?auto_21971 ?auto_21966 ) ) ( not ( = ?auto_21971 ?auto_21969 ) ) ( CALIBRATED ?auto_21973 ) ( ON_BOARD ?auto_21973 ?auto_21972 ) ( SUPPORTS ?auto_21973 ?auto_21968 ) ( POWER_ON ?auto_21973 ) ( POINTING ?auto_21972 ?auto_21969 ) ( HAVE_IMAGE ?auto_21966 ?auto_21967 ) ( HAVE_IMAGE ?auto_21971 ?auto_21970 ) ( not ( = ?auto_21967 ?auto_21968 ) ) ( not ( = ?auto_21967 ?auto_21970 ) ) ( not ( = ?auto_21968 ?auto_21970 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21969 ?auto_21968 )
      ( GET-3IMAGE-VERIFY ?auto_21966 ?auto_21967 ?auto_21969 ?auto_21968 ?auto_21971 ?auto_21970 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21998 - DIRECTION
      ?auto_21999 - MODE
      ?auto_22001 - DIRECTION
      ?auto_22000 - MODE
      ?auto_22003 - DIRECTION
      ?auto_22002 - MODE
    )
    :vars
    (
      ?auto_22005 - INSTRUMENT
      ?auto_22004 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_22001 ?auto_21998 ) ) ( not ( = ?auto_22003 ?auto_21998 ) ) ( not ( = ?auto_22003 ?auto_22001 ) ) ( CALIBRATED ?auto_22005 ) ( ON_BOARD ?auto_22005 ?auto_22004 ) ( SUPPORTS ?auto_22005 ?auto_21999 ) ( POWER_ON ?auto_22005 ) ( POINTING ?auto_22004 ?auto_21998 ) ( HAVE_IMAGE ?auto_22001 ?auto_22000 ) ( HAVE_IMAGE ?auto_22003 ?auto_22002 ) ( not ( = ?auto_21999 ?auto_22000 ) ) ( not ( = ?auto_21999 ?auto_22002 ) ) ( not ( = ?auto_22000 ?auto_22002 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21998 ?auto_21999 )
      ( GET-3IMAGE-VERIFY ?auto_21998 ?auto_21999 ?auto_22001 ?auto_22000 ?auto_22003 ?auto_22002 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22014 - DIRECTION
      ?auto_22015 - MODE
      ?auto_22017 - DIRECTION
      ?auto_22016 - MODE
      ?auto_22019 - DIRECTION
      ?auto_22018 - MODE
    )
    :vars
    (
      ?auto_22021 - INSTRUMENT
      ?auto_22020 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_22017 ?auto_22014 ) ) ( not ( = ?auto_22019 ?auto_22014 ) ) ( not ( = ?auto_22019 ?auto_22017 ) ) ( CALIBRATED ?auto_22021 ) ( ON_BOARD ?auto_22021 ?auto_22020 ) ( SUPPORTS ?auto_22021 ?auto_22015 ) ( POWER_ON ?auto_22021 ) ( POINTING ?auto_22020 ?auto_22014 ) ( HAVE_IMAGE ?auto_22017 ?auto_22016 ) ( HAVE_IMAGE ?auto_22019 ?auto_22018 ) ( not ( = ?auto_22015 ?auto_22016 ) ) ( not ( = ?auto_22015 ?auto_22018 ) ) ( not ( = ?auto_22016 ?auto_22018 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_22014 ?auto_22015 )
      ( GET-3IMAGE-VERIFY ?auto_22014 ?auto_22015 ?auto_22017 ?auto_22016 ?auto_22019 ?auto_22018 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_22062 - DIRECTION
      ?auto_22063 - MODE
    )
    :vars
    (
      ?auto_22065 - INSTRUMENT
      ?auto_22064 - SATELLITE
      ?auto_22066 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_22065 ) ( ON_BOARD ?auto_22065 ?auto_22064 ) ( SUPPORTS ?auto_22065 ?auto_22063 ) ( POWER_ON ?auto_22065 ) ( POINTING ?auto_22064 ?auto_22066 ) ( not ( = ?auto_22062 ?auto_22066 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_22064 ?auto_22062 ?auto_22066 )
      ( GET-1IMAGE ?auto_22062 ?auto_22063 )
      ( GET-1IMAGE-VERIFY ?auto_22062 ?auto_22063 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_22067 - DIRECTION
      ?auto_22068 - MODE
      ?auto_22070 - DIRECTION
      ?auto_22069 - MODE
    )
    :vars
    (
      ?auto_22073 - INSTRUMENT
      ?auto_22071 - SATELLITE
      ?auto_22072 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22070 ?auto_22067 ) ) ( CALIBRATED ?auto_22073 ) ( ON_BOARD ?auto_22073 ?auto_22071 ) ( SUPPORTS ?auto_22073 ?auto_22069 ) ( POWER_ON ?auto_22073 ) ( POINTING ?auto_22071 ?auto_22072 ) ( not ( = ?auto_22070 ?auto_22072 ) ) ( HAVE_IMAGE ?auto_22067 ?auto_22068 ) ( not ( = ?auto_22067 ?auto_22072 ) ) ( not ( = ?auto_22068 ?auto_22069 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_22070 ?auto_22069 )
      ( GET-2IMAGE-VERIFY ?auto_22067 ?auto_22068 ?auto_22070 ?auto_22069 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_22074 - DIRECTION
      ?auto_22075 - MODE
      ?auto_22077 - DIRECTION
      ?auto_22076 - MODE
    )
    :vars
    (
      ?auto_22082 - DIRECTION
      ?auto_22080 - INSTRUMENT
      ?auto_22079 - SATELLITE
      ?auto_22081 - DIRECTION
      ?auto_22078 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_22077 ?auto_22074 ) ) ( not ( = ?auto_22077 ?auto_22082 ) ) ( CALIBRATED ?auto_22080 ) ( ON_BOARD ?auto_22080 ?auto_22079 ) ( SUPPORTS ?auto_22080 ?auto_22076 ) ( POWER_ON ?auto_22080 ) ( POINTING ?auto_22079 ?auto_22081 ) ( not ( = ?auto_22077 ?auto_22081 ) ) ( HAVE_IMAGE ?auto_22082 ?auto_22078 ) ( not ( = ?auto_22082 ?auto_22081 ) ) ( not ( = ?auto_22078 ?auto_22076 ) ) ( HAVE_IMAGE ?auto_22074 ?auto_22075 ) ( not ( = ?auto_22074 ?auto_22082 ) ) ( not ( = ?auto_22074 ?auto_22081 ) ) ( not ( = ?auto_22075 ?auto_22076 ) ) ( not ( = ?auto_22075 ?auto_22078 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22082 ?auto_22078 ?auto_22077 ?auto_22076 )
      ( GET-2IMAGE-VERIFY ?auto_22074 ?auto_22075 ?auto_22077 ?auto_22076 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_22083 - DIRECTION
      ?auto_22084 - MODE
      ?auto_22086 - DIRECTION
      ?auto_22085 - MODE
    )
    :vars
    (
      ?auto_22088 - INSTRUMENT
      ?auto_22087 - SATELLITE
      ?auto_22089 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22086 ?auto_22083 ) ) ( CALIBRATED ?auto_22088 ) ( ON_BOARD ?auto_22088 ?auto_22087 ) ( SUPPORTS ?auto_22088 ?auto_22084 ) ( POWER_ON ?auto_22088 ) ( POINTING ?auto_22087 ?auto_22089 ) ( not ( = ?auto_22083 ?auto_22089 ) ) ( HAVE_IMAGE ?auto_22086 ?auto_22085 ) ( not ( = ?auto_22086 ?auto_22089 ) ) ( not ( = ?auto_22085 ?auto_22084 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22086 ?auto_22085 ?auto_22083 ?auto_22084 )
      ( GET-2IMAGE-VERIFY ?auto_22083 ?auto_22084 ?auto_22086 ?auto_22085 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_22090 - DIRECTION
      ?auto_22091 - MODE
      ?auto_22093 - DIRECTION
      ?auto_22092 - MODE
    )
    :vars
    (
      ?auto_22098 - DIRECTION
      ?auto_22096 - INSTRUMENT
      ?auto_22095 - SATELLITE
      ?auto_22097 - DIRECTION
      ?auto_22094 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_22093 ?auto_22090 ) ) ( not ( = ?auto_22090 ?auto_22098 ) ) ( CALIBRATED ?auto_22096 ) ( ON_BOARD ?auto_22096 ?auto_22095 ) ( SUPPORTS ?auto_22096 ?auto_22091 ) ( POWER_ON ?auto_22096 ) ( POINTING ?auto_22095 ?auto_22097 ) ( not ( = ?auto_22090 ?auto_22097 ) ) ( HAVE_IMAGE ?auto_22098 ?auto_22094 ) ( not ( = ?auto_22098 ?auto_22097 ) ) ( not ( = ?auto_22094 ?auto_22091 ) ) ( HAVE_IMAGE ?auto_22093 ?auto_22092 ) ( not ( = ?auto_22091 ?auto_22092 ) ) ( not ( = ?auto_22093 ?auto_22098 ) ) ( not ( = ?auto_22093 ?auto_22097 ) ) ( not ( = ?auto_22092 ?auto_22094 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22098 ?auto_22094 ?auto_22090 ?auto_22091 )
      ( GET-2IMAGE-VERIFY ?auto_22090 ?auto_22091 ?auto_22093 ?auto_22092 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22117 - DIRECTION
      ?auto_22118 - MODE
      ?auto_22120 - DIRECTION
      ?auto_22119 - MODE
      ?auto_22122 - DIRECTION
      ?auto_22121 - MODE
    )
    :vars
    (
      ?auto_22124 - INSTRUMENT
      ?auto_22123 - SATELLITE
      ?auto_22125 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22120 ?auto_22117 ) ) ( not ( = ?auto_22122 ?auto_22117 ) ) ( not ( = ?auto_22122 ?auto_22120 ) ) ( CALIBRATED ?auto_22124 ) ( ON_BOARD ?auto_22124 ?auto_22123 ) ( SUPPORTS ?auto_22124 ?auto_22121 ) ( POWER_ON ?auto_22124 ) ( POINTING ?auto_22123 ?auto_22125 ) ( not ( = ?auto_22122 ?auto_22125 ) ) ( HAVE_IMAGE ?auto_22117 ?auto_22118 ) ( not ( = ?auto_22117 ?auto_22125 ) ) ( not ( = ?auto_22118 ?auto_22121 ) ) ( HAVE_IMAGE ?auto_22120 ?auto_22119 ) ( not ( = ?auto_22118 ?auto_22119 ) ) ( not ( = ?auto_22120 ?auto_22125 ) ) ( not ( = ?auto_22119 ?auto_22121 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22117 ?auto_22118 ?auto_22122 ?auto_22121 )
      ( GET-3IMAGE-VERIFY ?auto_22117 ?auto_22118 ?auto_22120 ?auto_22119 ?auto_22122 ?auto_22121 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22135 - DIRECTION
      ?auto_22136 - MODE
      ?auto_22138 - DIRECTION
      ?auto_22137 - MODE
      ?auto_22140 - DIRECTION
      ?auto_22139 - MODE
    )
    :vars
    (
      ?auto_22142 - INSTRUMENT
      ?auto_22141 - SATELLITE
      ?auto_22143 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22138 ?auto_22135 ) ) ( not ( = ?auto_22140 ?auto_22135 ) ) ( not ( = ?auto_22140 ?auto_22138 ) ) ( CALIBRATED ?auto_22142 ) ( ON_BOARD ?auto_22142 ?auto_22141 ) ( SUPPORTS ?auto_22142 ?auto_22137 ) ( POWER_ON ?auto_22142 ) ( POINTING ?auto_22141 ?auto_22143 ) ( not ( = ?auto_22138 ?auto_22143 ) ) ( HAVE_IMAGE ?auto_22135 ?auto_22136 ) ( not ( = ?auto_22135 ?auto_22143 ) ) ( not ( = ?auto_22136 ?auto_22137 ) ) ( HAVE_IMAGE ?auto_22140 ?auto_22139 ) ( not ( = ?auto_22136 ?auto_22139 ) ) ( not ( = ?auto_22137 ?auto_22139 ) ) ( not ( = ?auto_22140 ?auto_22143 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22135 ?auto_22136 ?auto_22138 ?auto_22137 )
      ( GET-3IMAGE-VERIFY ?auto_22135 ?auto_22136 ?auto_22138 ?auto_22137 ?auto_22140 ?auto_22139 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22153 - DIRECTION
      ?auto_22154 - MODE
      ?auto_22156 - DIRECTION
      ?auto_22155 - MODE
      ?auto_22158 - DIRECTION
      ?auto_22157 - MODE
    )
    :vars
    (
      ?auto_22160 - INSTRUMENT
      ?auto_22159 - SATELLITE
      ?auto_22161 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22156 ?auto_22153 ) ) ( not ( = ?auto_22158 ?auto_22153 ) ) ( not ( = ?auto_22158 ?auto_22156 ) ) ( CALIBRATED ?auto_22160 ) ( ON_BOARD ?auto_22160 ?auto_22159 ) ( SUPPORTS ?auto_22160 ?auto_22157 ) ( POWER_ON ?auto_22160 ) ( POINTING ?auto_22159 ?auto_22161 ) ( not ( = ?auto_22158 ?auto_22161 ) ) ( HAVE_IMAGE ?auto_22156 ?auto_22155 ) ( not ( = ?auto_22156 ?auto_22161 ) ) ( not ( = ?auto_22155 ?auto_22157 ) ) ( HAVE_IMAGE ?auto_22153 ?auto_22154 ) ( not ( = ?auto_22153 ?auto_22161 ) ) ( not ( = ?auto_22154 ?auto_22155 ) ) ( not ( = ?auto_22154 ?auto_22157 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22156 ?auto_22155 ?auto_22158 ?auto_22157 )
      ( GET-3IMAGE-VERIFY ?auto_22153 ?auto_22154 ?auto_22156 ?auto_22155 ?auto_22158 ?auto_22157 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22173 - DIRECTION
      ?auto_22174 - MODE
      ?auto_22176 - DIRECTION
      ?auto_22175 - MODE
      ?auto_22178 - DIRECTION
      ?auto_22177 - MODE
    )
    :vars
    (
      ?auto_22180 - INSTRUMENT
      ?auto_22179 - SATELLITE
      ?auto_22181 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22176 ?auto_22173 ) ) ( not ( = ?auto_22178 ?auto_22173 ) ) ( not ( = ?auto_22178 ?auto_22176 ) ) ( CALIBRATED ?auto_22180 ) ( ON_BOARD ?auto_22180 ?auto_22179 ) ( SUPPORTS ?auto_22180 ?auto_22175 ) ( POWER_ON ?auto_22180 ) ( POINTING ?auto_22179 ?auto_22181 ) ( not ( = ?auto_22176 ?auto_22181 ) ) ( HAVE_IMAGE ?auto_22178 ?auto_22177 ) ( not ( = ?auto_22178 ?auto_22181 ) ) ( not ( = ?auto_22177 ?auto_22175 ) ) ( HAVE_IMAGE ?auto_22173 ?auto_22174 ) ( not ( = ?auto_22173 ?auto_22181 ) ) ( not ( = ?auto_22174 ?auto_22175 ) ) ( not ( = ?auto_22174 ?auto_22177 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22178 ?auto_22177 ?auto_22176 ?auto_22175 )
      ( GET-3IMAGE-VERIFY ?auto_22173 ?auto_22174 ?auto_22176 ?auto_22175 ?auto_22178 ?auto_22177 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22213 - DIRECTION
      ?auto_22214 - MODE
      ?auto_22216 - DIRECTION
      ?auto_22215 - MODE
      ?auto_22218 - DIRECTION
      ?auto_22217 - MODE
    )
    :vars
    (
      ?auto_22220 - INSTRUMENT
      ?auto_22219 - SATELLITE
      ?auto_22221 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22216 ?auto_22213 ) ) ( not ( = ?auto_22218 ?auto_22213 ) ) ( not ( = ?auto_22218 ?auto_22216 ) ) ( CALIBRATED ?auto_22220 ) ( ON_BOARD ?auto_22220 ?auto_22219 ) ( SUPPORTS ?auto_22220 ?auto_22214 ) ( POWER_ON ?auto_22220 ) ( POINTING ?auto_22219 ?auto_22221 ) ( not ( = ?auto_22213 ?auto_22221 ) ) ( HAVE_IMAGE ?auto_22216 ?auto_22215 ) ( not ( = ?auto_22216 ?auto_22221 ) ) ( not ( = ?auto_22215 ?auto_22214 ) ) ( HAVE_IMAGE ?auto_22218 ?auto_22217 ) ( not ( = ?auto_22214 ?auto_22217 ) ) ( not ( = ?auto_22215 ?auto_22217 ) ) ( not ( = ?auto_22218 ?auto_22221 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22216 ?auto_22215 ?auto_22213 ?auto_22214 )
      ( GET-3IMAGE-VERIFY ?auto_22213 ?auto_22214 ?auto_22216 ?auto_22215 ?auto_22218 ?auto_22217 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22231 - DIRECTION
      ?auto_22232 - MODE
      ?auto_22234 - DIRECTION
      ?auto_22233 - MODE
      ?auto_22236 - DIRECTION
      ?auto_22235 - MODE
    )
    :vars
    (
      ?auto_22238 - INSTRUMENT
      ?auto_22237 - SATELLITE
      ?auto_22239 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22234 ?auto_22231 ) ) ( not ( = ?auto_22236 ?auto_22231 ) ) ( not ( = ?auto_22236 ?auto_22234 ) ) ( CALIBRATED ?auto_22238 ) ( ON_BOARD ?auto_22238 ?auto_22237 ) ( SUPPORTS ?auto_22238 ?auto_22232 ) ( POWER_ON ?auto_22238 ) ( POINTING ?auto_22237 ?auto_22239 ) ( not ( = ?auto_22231 ?auto_22239 ) ) ( HAVE_IMAGE ?auto_22236 ?auto_22235 ) ( not ( = ?auto_22236 ?auto_22239 ) ) ( not ( = ?auto_22235 ?auto_22232 ) ) ( HAVE_IMAGE ?auto_22234 ?auto_22233 ) ( not ( = ?auto_22232 ?auto_22233 ) ) ( not ( = ?auto_22234 ?auto_22239 ) ) ( not ( = ?auto_22233 ?auto_22235 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22236 ?auto_22235 ?auto_22231 ?auto_22232 )
      ( GET-3IMAGE-VERIFY ?auto_22231 ?auto_22232 ?auto_22234 ?auto_22233 ?auto_22236 ?auto_22235 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_22293 - DIRECTION
      ?auto_22294 - MODE
    )
    :vars
    (
      ?auto_22299 - DIRECTION
      ?auto_22297 - INSTRUMENT
      ?auto_22296 - SATELLITE
      ?auto_22298 - DIRECTION
      ?auto_22295 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_22293 ?auto_22299 ) ) ( ON_BOARD ?auto_22297 ?auto_22296 ) ( SUPPORTS ?auto_22297 ?auto_22294 ) ( POWER_ON ?auto_22297 ) ( POINTING ?auto_22296 ?auto_22298 ) ( not ( = ?auto_22293 ?auto_22298 ) ) ( HAVE_IMAGE ?auto_22299 ?auto_22295 ) ( not ( = ?auto_22299 ?auto_22298 ) ) ( not ( = ?auto_22295 ?auto_22294 ) ) ( CALIBRATION_TARGET ?auto_22297 ?auto_22298 ) ( NOT_CALIBRATED ?auto_22297 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_22296 ?auto_22297 ?auto_22298 )
      ( GET-2IMAGE ?auto_22299 ?auto_22295 ?auto_22293 ?auto_22294 )
      ( GET-1IMAGE-VERIFY ?auto_22293 ?auto_22294 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_22300 - DIRECTION
      ?auto_22301 - MODE
      ?auto_22303 - DIRECTION
      ?auto_22302 - MODE
    )
    :vars
    (
      ?auto_22306 - INSTRUMENT
      ?auto_22304 - SATELLITE
      ?auto_22305 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22303 ?auto_22300 ) ) ( ON_BOARD ?auto_22306 ?auto_22304 ) ( SUPPORTS ?auto_22306 ?auto_22302 ) ( POWER_ON ?auto_22306 ) ( POINTING ?auto_22304 ?auto_22305 ) ( not ( = ?auto_22303 ?auto_22305 ) ) ( HAVE_IMAGE ?auto_22300 ?auto_22301 ) ( not ( = ?auto_22300 ?auto_22305 ) ) ( not ( = ?auto_22301 ?auto_22302 ) ) ( CALIBRATION_TARGET ?auto_22306 ?auto_22305 ) ( NOT_CALIBRATED ?auto_22306 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_22303 ?auto_22302 )
      ( GET-2IMAGE-VERIFY ?auto_22300 ?auto_22301 ?auto_22303 ?auto_22302 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_22307 - DIRECTION
      ?auto_22308 - MODE
      ?auto_22310 - DIRECTION
      ?auto_22309 - MODE
    )
    :vars
    (
      ?auto_22312 - DIRECTION
      ?auto_22311 - INSTRUMENT
      ?auto_22314 - SATELLITE
      ?auto_22313 - DIRECTION
      ?auto_22315 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_22310 ?auto_22307 ) ) ( not ( = ?auto_22310 ?auto_22312 ) ) ( ON_BOARD ?auto_22311 ?auto_22314 ) ( SUPPORTS ?auto_22311 ?auto_22309 ) ( POWER_ON ?auto_22311 ) ( POINTING ?auto_22314 ?auto_22313 ) ( not ( = ?auto_22310 ?auto_22313 ) ) ( HAVE_IMAGE ?auto_22312 ?auto_22315 ) ( not ( = ?auto_22312 ?auto_22313 ) ) ( not ( = ?auto_22315 ?auto_22309 ) ) ( CALIBRATION_TARGET ?auto_22311 ?auto_22313 ) ( NOT_CALIBRATED ?auto_22311 ) ( HAVE_IMAGE ?auto_22307 ?auto_22308 ) ( not ( = ?auto_22307 ?auto_22312 ) ) ( not ( = ?auto_22307 ?auto_22313 ) ) ( not ( = ?auto_22308 ?auto_22309 ) ) ( not ( = ?auto_22308 ?auto_22315 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22312 ?auto_22315 ?auto_22310 ?auto_22309 )
      ( GET-2IMAGE-VERIFY ?auto_22307 ?auto_22308 ?auto_22310 ?auto_22309 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_22316 - DIRECTION
      ?auto_22317 - MODE
      ?auto_22319 - DIRECTION
      ?auto_22318 - MODE
    )
    :vars
    (
      ?auto_22320 - INSTRUMENT
      ?auto_22322 - SATELLITE
      ?auto_22321 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22319 ?auto_22316 ) ) ( ON_BOARD ?auto_22320 ?auto_22322 ) ( SUPPORTS ?auto_22320 ?auto_22317 ) ( POWER_ON ?auto_22320 ) ( POINTING ?auto_22322 ?auto_22321 ) ( not ( = ?auto_22316 ?auto_22321 ) ) ( HAVE_IMAGE ?auto_22319 ?auto_22318 ) ( not ( = ?auto_22319 ?auto_22321 ) ) ( not ( = ?auto_22318 ?auto_22317 ) ) ( CALIBRATION_TARGET ?auto_22320 ?auto_22321 ) ( NOT_CALIBRATED ?auto_22320 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22319 ?auto_22318 ?auto_22316 ?auto_22317 )
      ( GET-2IMAGE-VERIFY ?auto_22316 ?auto_22317 ?auto_22319 ?auto_22318 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_22323 - DIRECTION
      ?auto_22324 - MODE
      ?auto_22326 - DIRECTION
      ?auto_22325 - MODE
    )
    :vars
    (
      ?auto_22328 - DIRECTION
      ?auto_22327 - INSTRUMENT
      ?auto_22330 - SATELLITE
      ?auto_22329 - DIRECTION
      ?auto_22331 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_22326 ?auto_22323 ) ) ( not ( = ?auto_22323 ?auto_22328 ) ) ( ON_BOARD ?auto_22327 ?auto_22330 ) ( SUPPORTS ?auto_22327 ?auto_22324 ) ( POWER_ON ?auto_22327 ) ( POINTING ?auto_22330 ?auto_22329 ) ( not ( = ?auto_22323 ?auto_22329 ) ) ( HAVE_IMAGE ?auto_22328 ?auto_22331 ) ( not ( = ?auto_22328 ?auto_22329 ) ) ( not ( = ?auto_22331 ?auto_22324 ) ) ( CALIBRATION_TARGET ?auto_22327 ?auto_22329 ) ( NOT_CALIBRATED ?auto_22327 ) ( HAVE_IMAGE ?auto_22326 ?auto_22325 ) ( not ( = ?auto_22324 ?auto_22325 ) ) ( not ( = ?auto_22326 ?auto_22328 ) ) ( not ( = ?auto_22326 ?auto_22329 ) ) ( not ( = ?auto_22325 ?auto_22331 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22328 ?auto_22331 ?auto_22323 ?auto_22324 )
      ( GET-2IMAGE-VERIFY ?auto_22323 ?auto_22324 ?auto_22326 ?auto_22325 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22350 - DIRECTION
      ?auto_22351 - MODE
      ?auto_22353 - DIRECTION
      ?auto_22352 - MODE
      ?auto_22355 - DIRECTION
      ?auto_22354 - MODE
    )
    :vars
    (
      ?auto_22356 - INSTRUMENT
      ?auto_22358 - SATELLITE
      ?auto_22357 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22353 ?auto_22350 ) ) ( not ( = ?auto_22355 ?auto_22350 ) ) ( not ( = ?auto_22355 ?auto_22353 ) ) ( ON_BOARD ?auto_22356 ?auto_22358 ) ( SUPPORTS ?auto_22356 ?auto_22354 ) ( POWER_ON ?auto_22356 ) ( POINTING ?auto_22358 ?auto_22357 ) ( not ( = ?auto_22355 ?auto_22357 ) ) ( HAVE_IMAGE ?auto_22350 ?auto_22351 ) ( not ( = ?auto_22350 ?auto_22357 ) ) ( not ( = ?auto_22351 ?auto_22354 ) ) ( CALIBRATION_TARGET ?auto_22356 ?auto_22357 ) ( NOT_CALIBRATED ?auto_22356 ) ( HAVE_IMAGE ?auto_22353 ?auto_22352 ) ( not ( = ?auto_22351 ?auto_22352 ) ) ( not ( = ?auto_22353 ?auto_22357 ) ) ( not ( = ?auto_22352 ?auto_22354 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22350 ?auto_22351 ?auto_22355 ?auto_22354 )
      ( GET-3IMAGE-VERIFY ?auto_22350 ?auto_22351 ?auto_22353 ?auto_22352 ?auto_22355 ?auto_22354 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22368 - DIRECTION
      ?auto_22369 - MODE
      ?auto_22371 - DIRECTION
      ?auto_22370 - MODE
      ?auto_22373 - DIRECTION
      ?auto_22372 - MODE
    )
    :vars
    (
      ?auto_22374 - INSTRUMENT
      ?auto_22376 - SATELLITE
      ?auto_22375 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22371 ?auto_22368 ) ) ( not ( = ?auto_22373 ?auto_22368 ) ) ( not ( = ?auto_22373 ?auto_22371 ) ) ( ON_BOARD ?auto_22374 ?auto_22376 ) ( SUPPORTS ?auto_22374 ?auto_22370 ) ( POWER_ON ?auto_22374 ) ( POINTING ?auto_22376 ?auto_22375 ) ( not ( = ?auto_22371 ?auto_22375 ) ) ( HAVE_IMAGE ?auto_22368 ?auto_22369 ) ( not ( = ?auto_22368 ?auto_22375 ) ) ( not ( = ?auto_22369 ?auto_22370 ) ) ( CALIBRATION_TARGET ?auto_22374 ?auto_22375 ) ( NOT_CALIBRATED ?auto_22374 ) ( HAVE_IMAGE ?auto_22373 ?auto_22372 ) ( not ( = ?auto_22369 ?auto_22372 ) ) ( not ( = ?auto_22370 ?auto_22372 ) ) ( not ( = ?auto_22373 ?auto_22375 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22368 ?auto_22369 ?auto_22371 ?auto_22370 )
      ( GET-3IMAGE-VERIFY ?auto_22368 ?auto_22369 ?auto_22371 ?auto_22370 ?auto_22373 ?auto_22372 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22386 - DIRECTION
      ?auto_22387 - MODE
      ?auto_22389 - DIRECTION
      ?auto_22388 - MODE
      ?auto_22391 - DIRECTION
      ?auto_22390 - MODE
    )
    :vars
    (
      ?auto_22392 - INSTRUMENT
      ?auto_22394 - SATELLITE
      ?auto_22393 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22389 ?auto_22386 ) ) ( not ( = ?auto_22391 ?auto_22386 ) ) ( not ( = ?auto_22391 ?auto_22389 ) ) ( ON_BOARD ?auto_22392 ?auto_22394 ) ( SUPPORTS ?auto_22392 ?auto_22390 ) ( POWER_ON ?auto_22392 ) ( POINTING ?auto_22394 ?auto_22393 ) ( not ( = ?auto_22391 ?auto_22393 ) ) ( HAVE_IMAGE ?auto_22389 ?auto_22388 ) ( not ( = ?auto_22389 ?auto_22393 ) ) ( not ( = ?auto_22388 ?auto_22390 ) ) ( CALIBRATION_TARGET ?auto_22392 ?auto_22393 ) ( NOT_CALIBRATED ?auto_22392 ) ( HAVE_IMAGE ?auto_22386 ?auto_22387 ) ( not ( = ?auto_22386 ?auto_22393 ) ) ( not ( = ?auto_22387 ?auto_22388 ) ) ( not ( = ?auto_22387 ?auto_22390 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22389 ?auto_22388 ?auto_22391 ?auto_22390 )
      ( GET-3IMAGE-VERIFY ?auto_22386 ?auto_22387 ?auto_22389 ?auto_22388 ?auto_22391 ?auto_22390 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22406 - DIRECTION
      ?auto_22407 - MODE
      ?auto_22409 - DIRECTION
      ?auto_22408 - MODE
      ?auto_22411 - DIRECTION
      ?auto_22410 - MODE
    )
    :vars
    (
      ?auto_22412 - INSTRUMENT
      ?auto_22414 - SATELLITE
      ?auto_22413 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22409 ?auto_22406 ) ) ( not ( = ?auto_22411 ?auto_22406 ) ) ( not ( = ?auto_22411 ?auto_22409 ) ) ( ON_BOARD ?auto_22412 ?auto_22414 ) ( SUPPORTS ?auto_22412 ?auto_22408 ) ( POWER_ON ?auto_22412 ) ( POINTING ?auto_22414 ?auto_22413 ) ( not ( = ?auto_22409 ?auto_22413 ) ) ( HAVE_IMAGE ?auto_22411 ?auto_22410 ) ( not ( = ?auto_22411 ?auto_22413 ) ) ( not ( = ?auto_22410 ?auto_22408 ) ) ( CALIBRATION_TARGET ?auto_22412 ?auto_22413 ) ( NOT_CALIBRATED ?auto_22412 ) ( HAVE_IMAGE ?auto_22406 ?auto_22407 ) ( not ( = ?auto_22406 ?auto_22413 ) ) ( not ( = ?auto_22407 ?auto_22408 ) ) ( not ( = ?auto_22407 ?auto_22410 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22411 ?auto_22410 ?auto_22409 ?auto_22408 )
      ( GET-3IMAGE-VERIFY ?auto_22406 ?auto_22407 ?auto_22409 ?auto_22408 ?auto_22411 ?auto_22410 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22446 - DIRECTION
      ?auto_22447 - MODE
      ?auto_22449 - DIRECTION
      ?auto_22448 - MODE
      ?auto_22451 - DIRECTION
      ?auto_22450 - MODE
    )
    :vars
    (
      ?auto_22452 - INSTRUMENT
      ?auto_22454 - SATELLITE
      ?auto_22453 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22449 ?auto_22446 ) ) ( not ( = ?auto_22451 ?auto_22446 ) ) ( not ( = ?auto_22451 ?auto_22449 ) ) ( ON_BOARD ?auto_22452 ?auto_22454 ) ( SUPPORTS ?auto_22452 ?auto_22447 ) ( POWER_ON ?auto_22452 ) ( POINTING ?auto_22454 ?auto_22453 ) ( not ( = ?auto_22446 ?auto_22453 ) ) ( HAVE_IMAGE ?auto_22449 ?auto_22448 ) ( not ( = ?auto_22449 ?auto_22453 ) ) ( not ( = ?auto_22448 ?auto_22447 ) ) ( CALIBRATION_TARGET ?auto_22452 ?auto_22453 ) ( NOT_CALIBRATED ?auto_22452 ) ( HAVE_IMAGE ?auto_22451 ?auto_22450 ) ( not ( = ?auto_22447 ?auto_22450 ) ) ( not ( = ?auto_22448 ?auto_22450 ) ) ( not ( = ?auto_22451 ?auto_22453 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22449 ?auto_22448 ?auto_22446 ?auto_22447 )
      ( GET-3IMAGE-VERIFY ?auto_22446 ?auto_22447 ?auto_22449 ?auto_22448 ?auto_22451 ?auto_22450 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22464 - DIRECTION
      ?auto_22465 - MODE
      ?auto_22467 - DIRECTION
      ?auto_22466 - MODE
      ?auto_22469 - DIRECTION
      ?auto_22468 - MODE
    )
    :vars
    (
      ?auto_22470 - INSTRUMENT
      ?auto_22472 - SATELLITE
      ?auto_22471 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22467 ?auto_22464 ) ) ( not ( = ?auto_22469 ?auto_22464 ) ) ( not ( = ?auto_22469 ?auto_22467 ) ) ( ON_BOARD ?auto_22470 ?auto_22472 ) ( SUPPORTS ?auto_22470 ?auto_22465 ) ( POWER_ON ?auto_22470 ) ( POINTING ?auto_22472 ?auto_22471 ) ( not ( = ?auto_22464 ?auto_22471 ) ) ( HAVE_IMAGE ?auto_22469 ?auto_22468 ) ( not ( = ?auto_22469 ?auto_22471 ) ) ( not ( = ?auto_22468 ?auto_22465 ) ) ( CALIBRATION_TARGET ?auto_22470 ?auto_22471 ) ( NOT_CALIBRATED ?auto_22470 ) ( HAVE_IMAGE ?auto_22467 ?auto_22466 ) ( not ( = ?auto_22465 ?auto_22466 ) ) ( not ( = ?auto_22467 ?auto_22471 ) ) ( not ( = ?auto_22466 ?auto_22468 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22469 ?auto_22468 ?auto_22464 ?auto_22465 )
      ( GET-3IMAGE-VERIFY ?auto_22464 ?auto_22465 ?auto_22467 ?auto_22466 ?auto_22469 ?auto_22468 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_22526 - DIRECTION
      ?auto_22527 - MODE
    )
    :vars
    (
      ?auto_22529 - DIRECTION
      ?auto_22528 - INSTRUMENT
      ?auto_22531 - SATELLITE
      ?auto_22530 - DIRECTION
      ?auto_22532 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_22526 ?auto_22529 ) ) ( ON_BOARD ?auto_22528 ?auto_22531 ) ( SUPPORTS ?auto_22528 ?auto_22527 ) ( POINTING ?auto_22531 ?auto_22530 ) ( not ( = ?auto_22526 ?auto_22530 ) ) ( HAVE_IMAGE ?auto_22529 ?auto_22532 ) ( not ( = ?auto_22529 ?auto_22530 ) ) ( not ( = ?auto_22532 ?auto_22527 ) ) ( CALIBRATION_TARGET ?auto_22528 ?auto_22530 ) ( POWER_AVAIL ?auto_22531 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_22528 ?auto_22531 )
      ( GET-2IMAGE ?auto_22529 ?auto_22532 ?auto_22526 ?auto_22527 )
      ( GET-1IMAGE-VERIFY ?auto_22526 ?auto_22527 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_22533 - DIRECTION
      ?auto_22534 - MODE
      ?auto_22536 - DIRECTION
      ?auto_22535 - MODE
    )
    :vars
    (
      ?auto_22537 - INSTRUMENT
      ?auto_22538 - SATELLITE
      ?auto_22539 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22536 ?auto_22533 ) ) ( ON_BOARD ?auto_22537 ?auto_22538 ) ( SUPPORTS ?auto_22537 ?auto_22535 ) ( POINTING ?auto_22538 ?auto_22539 ) ( not ( = ?auto_22536 ?auto_22539 ) ) ( HAVE_IMAGE ?auto_22533 ?auto_22534 ) ( not ( = ?auto_22533 ?auto_22539 ) ) ( not ( = ?auto_22534 ?auto_22535 ) ) ( CALIBRATION_TARGET ?auto_22537 ?auto_22539 ) ( POWER_AVAIL ?auto_22538 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_22536 ?auto_22535 )
      ( GET-2IMAGE-VERIFY ?auto_22533 ?auto_22534 ?auto_22536 ?auto_22535 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_22540 - DIRECTION
      ?auto_22541 - MODE
      ?auto_22543 - DIRECTION
      ?auto_22542 - MODE
    )
    :vars
    (
      ?auto_22547 - DIRECTION
      ?auto_22548 - INSTRUMENT
      ?auto_22544 - SATELLITE
      ?auto_22545 - DIRECTION
      ?auto_22546 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_22543 ?auto_22540 ) ) ( not ( = ?auto_22543 ?auto_22547 ) ) ( ON_BOARD ?auto_22548 ?auto_22544 ) ( SUPPORTS ?auto_22548 ?auto_22542 ) ( POINTING ?auto_22544 ?auto_22545 ) ( not ( = ?auto_22543 ?auto_22545 ) ) ( HAVE_IMAGE ?auto_22547 ?auto_22546 ) ( not ( = ?auto_22547 ?auto_22545 ) ) ( not ( = ?auto_22546 ?auto_22542 ) ) ( CALIBRATION_TARGET ?auto_22548 ?auto_22545 ) ( POWER_AVAIL ?auto_22544 ) ( HAVE_IMAGE ?auto_22540 ?auto_22541 ) ( not ( = ?auto_22540 ?auto_22547 ) ) ( not ( = ?auto_22540 ?auto_22545 ) ) ( not ( = ?auto_22541 ?auto_22542 ) ) ( not ( = ?auto_22541 ?auto_22546 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22547 ?auto_22546 ?auto_22543 ?auto_22542 )
      ( GET-2IMAGE-VERIFY ?auto_22540 ?auto_22541 ?auto_22543 ?auto_22542 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_22549 - DIRECTION
      ?auto_22550 - MODE
      ?auto_22552 - DIRECTION
      ?auto_22551 - MODE
    )
    :vars
    (
      ?auto_22555 - INSTRUMENT
      ?auto_22553 - SATELLITE
      ?auto_22554 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22552 ?auto_22549 ) ) ( ON_BOARD ?auto_22555 ?auto_22553 ) ( SUPPORTS ?auto_22555 ?auto_22550 ) ( POINTING ?auto_22553 ?auto_22554 ) ( not ( = ?auto_22549 ?auto_22554 ) ) ( HAVE_IMAGE ?auto_22552 ?auto_22551 ) ( not ( = ?auto_22552 ?auto_22554 ) ) ( not ( = ?auto_22551 ?auto_22550 ) ) ( CALIBRATION_TARGET ?auto_22555 ?auto_22554 ) ( POWER_AVAIL ?auto_22553 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22552 ?auto_22551 ?auto_22549 ?auto_22550 )
      ( GET-2IMAGE-VERIFY ?auto_22549 ?auto_22550 ?auto_22552 ?auto_22551 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_22556 - DIRECTION
      ?auto_22557 - MODE
      ?auto_22559 - DIRECTION
      ?auto_22558 - MODE
    )
    :vars
    (
      ?auto_22563 - DIRECTION
      ?auto_22564 - INSTRUMENT
      ?auto_22560 - SATELLITE
      ?auto_22561 - DIRECTION
      ?auto_22562 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_22559 ?auto_22556 ) ) ( not ( = ?auto_22556 ?auto_22563 ) ) ( ON_BOARD ?auto_22564 ?auto_22560 ) ( SUPPORTS ?auto_22564 ?auto_22557 ) ( POINTING ?auto_22560 ?auto_22561 ) ( not ( = ?auto_22556 ?auto_22561 ) ) ( HAVE_IMAGE ?auto_22563 ?auto_22562 ) ( not ( = ?auto_22563 ?auto_22561 ) ) ( not ( = ?auto_22562 ?auto_22557 ) ) ( CALIBRATION_TARGET ?auto_22564 ?auto_22561 ) ( POWER_AVAIL ?auto_22560 ) ( HAVE_IMAGE ?auto_22559 ?auto_22558 ) ( not ( = ?auto_22557 ?auto_22558 ) ) ( not ( = ?auto_22559 ?auto_22563 ) ) ( not ( = ?auto_22559 ?auto_22561 ) ) ( not ( = ?auto_22558 ?auto_22562 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22563 ?auto_22562 ?auto_22556 ?auto_22557 )
      ( GET-2IMAGE-VERIFY ?auto_22556 ?auto_22557 ?auto_22559 ?auto_22558 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22583 - DIRECTION
      ?auto_22584 - MODE
      ?auto_22586 - DIRECTION
      ?auto_22585 - MODE
      ?auto_22588 - DIRECTION
      ?auto_22587 - MODE
    )
    :vars
    (
      ?auto_22591 - INSTRUMENT
      ?auto_22589 - SATELLITE
      ?auto_22590 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22586 ?auto_22583 ) ) ( not ( = ?auto_22588 ?auto_22583 ) ) ( not ( = ?auto_22588 ?auto_22586 ) ) ( ON_BOARD ?auto_22591 ?auto_22589 ) ( SUPPORTS ?auto_22591 ?auto_22587 ) ( POINTING ?auto_22589 ?auto_22590 ) ( not ( = ?auto_22588 ?auto_22590 ) ) ( HAVE_IMAGE ?auto_22583 ?auto_22584 ) ( not ( = ?auto_22583 ?auto_22590 ) ) ( not ( = ?auto_22584 ?auto_22587 ) ) ( CALIBRATION_TARGET ?auto_22591 ?auto_22590 ) ( POWER_AVAIL ?auto_22589 ) ( HAVE_IMAGE ?auto_22586 ?auto_22585 ) ( not ( = ?auto_22584 ?auto_22585 ) ) ( not ( = ?auto_22586 ?auto_22590 ) ) ( not ( = ?auto_22585 ?auto_22587 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22583 ?auto_22584 ?auto_22588 ?auto_22587 )
      ( GET-3IMAGE-VERIFY ?auto_22583 ?auto_22584 ?auto_22586 ?auto_22585 ?auto_22588 ?auto_22587 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22601 - DIRECTION
      ?auto_22602 - MODE
      ?auto_22604 - DIRECTION
      ?auto_22603 - MODE
      ?auto_22606 - DIRECTION
      ?auto_22605 - MODE
    )
    :vars
    (
      ?auto_22609 - INSTRUMENT
      ?auto_22607 - SATELLITE
      ?auto_22608 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22604 ?auto_22601 ) ) ( not ( = ?auto_22606 ?auto_22601 ) ) ( not ( = ?auto_22606 ?auto_22604 ) ) ( ON_BOARD ?auto_22609 ?auto_22607 ) ( SUPPORTS ?auto_22609 ?auto_22603 ) ( POINTING ?auto_22607 ?auto_22608 ) ( not ( = ?auto_22604 ?auto_22608 ) ) ( HAVE_IMAGE ?auto_22601 ?auto_22602 ) ( not ( = ?auto_22601 ?auto_22608 ) ) ( not ( = ?auto_22602 ?auto_22603 ) ) ( CALIBRATION_TARGET ?auto_22609 ?auto_22608 ) ( POWER_AVAIL ?auto_22607 ) ( HAVE_IMAGE ?auto_22606 ?auto_22605 ) ( not ( = ?auto_22602 ?auto_22605 ) ) ( not ( = ?auto_22603 ?auto_22605 ) ) ( not ( = ?auto_22606 ?auto_22608 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22601 ?auto_22602 ?auto_22604 ?auto_22603 )
      ( GET-3IMAGE-VERIFY ?auto_22601 ?auto_22602 ?auto_22604 ?auto_22603 ?auto_22606 ?auto_22605 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22619 - DIRECTION
      ?auto_22620 - MODE
      ?auto_22622 - DIRECTION
      ?auto_22621 - MODE
      ?auto_22624 - DIRECTION
      ?auto_22623 - MODE
    )
    :vars
    (
      ?auto_22627 - INSTRUMENT
      ?auto_22625 - SATELLITE
      ?auto_22626 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22622 ?auto_22619 ) ) ( not ( = ?auto_22624 ?auto_22619 ) ) ( not ( = ?auto_22624 ?auto_22622 ) ) ( ON_BOARD ?auto_22627 ?auto_22625 ) ( SUPPORTS ?auto_22627 ?auto_22623 ) ( POINTING ?auto_22625 ?auto_22626 ) ( not ( = ?auto_22624 ?auto_22626 ) ) ( HAVE_IMAGE ?auto_22622 ?auto_22621 ) ( not ( = ?auto_22622 ?auto_22626 ) ) ( not ( = ?auto_22621 ?auto_22623 ) ) ( CALIBRATION_TARGET ?auto_22627 ?auto_22626 ) ( POWER_AVAIL ?auto_22625 ) ( HAVE_IMAGE ?auto_22619 ?auto_22620 ) ( not ( = ?auto_22619 ?auto_22626 ) ) ( not ( = ?auto_22620 ?auto_22621 ) ) ( not ( = ?auto_22620 ?auto_22623 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22622 ?auto_22621 ?auto_22624 ?auto_22623 )
      ( GET-3IMAGE-VERIFY ?auto_22619 ?auto_22620 ?auto_22622 ?auto_22621 ?auto_22624 ?auto_22623 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22639 - DIRECTION
      ?auto_22640 - MODE
      ?auto_22642 - DIRECTION
      ?auto_22641 - MODE
      ?auto_22644 - DIRECTION
      ?auto_22643 - MODE
    )
    :vars
    (
      ?auto_22647 - INSTRUMENT
      ?auto_22645 - SATELLITE
      ?auto_22646 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22642 ?auto_22639 ) ) ( not ( = ?auto_22644 ?auto_22639 ) ) ( not ( = ?auto_22644 ?auto_22642 ) ) ( ON_BOARD ?auto_22647 ?auto_22645 ) ( SUPPORTS ?auto_22647 ?auto_22641 ) ( POINTING ?auto_22645 ?auto_22646 ) ( not ( = ?auto_22642 ?auto_22646 ) ) ( HAVE_IMAGE ?auto_22644 ?auto_22643 ) ( not ( = ?auto_22644 ?auto_22646 ) ) ( not ( = ?auto_22643 ?auto_22641 ) ) ( CALIBRATION_TARGET ?auto_22647 ?auto_22646 ) ( POWER_AVAIL ?auto_22645 ) ( HAVE_IMAGE ?auto_22639 ?auto_22640 ) ( not ( = ?auto_22639 ?auto_22646 ) ) ( not ( = ?auto_22640 ?auto_22641 ) ) ( not ( = ?auto_22640 ?auto_22643 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22644 ?auto_22643 ?auto_22642 ?auto_22641 )
      ( GET-3IMAGE-VERIFY ?auto_22639 ?auto_22640 ?auto_22642 ?auto_22641 ?auto_22644 ?auto_22643 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22679 - DIRECTION
      ?auto_22680 - MODE
      ?auto_22682 - DIRECTION
      ?auto_22681 - MODE
      ?auto_22684 - DIRECTION
      ?auto_22683 - MODE
    )
    :vars
    (
      ?auto_22687 - INSTRUMENT
      ?auto_22685 - SATELLITE
      ?auto_22686 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22682 ?auto_22679 ) ) ( not ( = ?auto_22684 ?auto_22679 ) ) ( not ( = ?auto_22684 ?auto_22682 ) ) ( ON_BOARD ?auto_22687 ?auto_22685 ) ( SUPPORTS ?auto_22687 ?auto_22680 ) ( POINTING ?auto_22685 ?auto_22686 ) ( not ( = ?auto_22679 ?auto_22686 ) ) ( HAVE_IMAGE ?auto_22682 ?auto_22681 ) ( not ( = ?auto_22682 ?auto_22686 ) ) ( not ( = ?auto_22681 ?auto_22680 ) ) ( CALIBRATION_TARGET ?auto_22687 ?auto_22686 ) ( POWER_AVAIL ?auto_22685 ) ( HAVE_IMAGE ?auto_22684 ?auto_22683 ) ( not ( = ?auto_22680 ?auto_22683 ) ) ( not ( = ?auto_22681 ?auto_22683 ) ) ( not ( = ?auto_22684 ?auto_22686 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22682 ?auto_22681 ?auto_22679 ?auto_22680 )
      ( GET-3IMAGE-VERIFY ?auto_22679 ?auto_22680 ?auto_22682 ?auto_22681 ?auto_22684 ?auto_22683 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22697 - DIRECTION
      ?auto_22698 - MODE
      ?auto_22700 - DIRECTION
      ?auto_22699 - MODE
      ?auto_22702 - DIRECTION
      ?auto_22701 - MODE
    )
    :vars
    (
      ?auto_22705 - INSTRUMENT
      ?auto_22703 - SATELLITE
      ?auto_22704 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22700 ?auto_22697 ) ) ( not ( = ?auto_22702 ?auto_22697 ) ) ( not ( = ?auto_22702 ?auto_22700 ) ) ( ON_BOARD ?auto_22705 ?auto_22703 ) ( SUPPORTS ?auto_22705 ?auto_22698 ) ( POINTING ?auto_22703 ?auto_22704 ) ( not ( = ?auto_22697 ?auto_22704 ) ) ( HAVE_IMAGE ?auto_22702 ?auto_22701 ) ( not ( = ?auto_22702 ?auto_22704 ) ) ( not ( = ?auto_22701 ?auto_22698 ) ) ( CALIBRATION_TARGET ?auto_22705 ?auto_22704 ) ( POWER_AVAIL ?auto_22703 ) ( HAVE_IMAGE ?auto_22700 ?auto_22699 ) ( not ( = ?auto_22698 ?auto_22699 ) ) ( not ( = ?auto_22700 ?auto_22704 ) ) ( not ( = ?auto_22699 ?auto_22701 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22702 ?auto_22701 ?auto_22697 ?auto_22698 )
      ( GET-3IMAGE-VERIFY ?auto_22697 ?auto_22698 ?auto_22700 ?auto_22699 ?auto_22702 ?auto_22701 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_22759 - DIRECTION
      ?auto_22760 - MODE
    )
    :vars
    (
      ?auto_22764 - DIRECTION
      ?auto_22765 - INSTRUMENT
      ?auto_22761 - SATELLITE
      ?auto_22762 - DIRECTION
      ?auto_22763 - MODE
      ?auto_22766 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22759 ?auto_22764 ) ) ( ON_BOARD ?auto_22765 ?auto_22761 ) ( SUPPORTS ?auto_22765 ?auto_22760 ) ( not ( = ?auto_22759 ?auto_22762 ) ) ( HAVE_IMAGE ?auto_22764 ?auto_22763 ) ( not ( = ?auto_22764 ?auto_22762 ) ) ( not ( = ?auto_22763 ?auto_22760 ) ) ( CALIBRATION_TARGET ?auto_22765 ?auto_22762 ) ( POWER_AVAIL ?auto_22761 ) ( POINTING ?auto_22761 ?auto_22766 ) ( not ( = ?auto_22762 ?auto_22766 ) ) ( not ( = ?auto_22759 ?auto_22766 ) ) ( not ( = ?auto_22764 ?auto_22766 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_22761 ?auto_22762 ?auto_22766 )
      ( GET-2IMAGE ?auto_22764 ?auto_22763 ?auto_22759 ?auto_22760 )
      ( GET-1IMAGE-VERIFY ?auto_22759 ?auto_22760 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_22767 - DIRECTION
      ?auto_22768 - MODE
      ?auto_22770 - DIRECTION
      ?auto_22769 - MODE
    )
    :vars
    (
      ?auto_22772 - INSTRUMENT
      ?auto_22771 - SATELLITE
      ?auto_22773 - DIRECTION
      ?auto_22774 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22770 ?auto_22767 ) ) ( ON_BOARD ?auto_22772 ?auto_22771 ) ( SUPPORTS ?auto_22772 ?auto_22769 ) ( not ( = ?auto_22770 ?auto_22773 ) ) ( HAVE_IMAGE ?auto_22767 ?auto_22768 ) ( not ( = ?auto_22767 ?auto_22773 ) ) ( not ( = ?auto_22768 ?auto_22769 ) ) ( CALIBRATION_TARGET ?auto_22772 ?auto_22773 ) ( POWER_AVAIL ?auto_22771 ) ( POINTING ?auto_22771 ?auto_22774 ) ( not ( = ?auto_22773 ?auto_22774 ) ) ( not ( = ?auto_22770 ?auto_22774 ) ) ( not ( = ?auto_22767 ?auto_22774 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_22770 ?auto_22769 )
      ( GET-2IMAGE-VERIFY ?auto_22767 ?auto_22768 ?auto_22770 ?auto_22769 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_22775 - DIRECTION
      ?auto_22776 - MODE
      ?auto_22778 - DIRECTION
      ?auto_22777 - MODE
    )
    :vars
    (
      ?auto_22780 - DIRECTION
      ?auto_22781 - INSTRUMENT
      ?auto_22783 - SATELLITE
      ?auto_22782 - DIRECTION
      ?auto_22779 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_22778 ?auto_22775 ) ) ( not ( = ?auto_22778 ?auto_22780 ) ) ( ON_BOARD ?auto_22781 ?auto_22783 ) ( SUPPORTS ?auto_22781 ?auto_22777 ) ( not ( = ?auto_22778 ?auto_22782 ) ) ( HAVE_IMAGE ?auto_22780 ?auto_22779 ) ( not ( = ?auto_22780 ?auto_22782 ) ) ( not ( = ?auto_22779 ?auto_22777 ) ) ( CALIBRATION_TARGET ?auto_22781 ?auto_22782 ) ( POWER_AVAIL ?auto_22783 ) ( POINTING ?auto_22783 ?auto_22775 ) ( not ( = ?auto_22782 ?auto_22775 ) ) ( not ( = ?auto_22780 ?auto_22775 ) ) ( HAVE_IMAGE ?auto_22775 ?auto_22776 ) ( not ( = ?auto_22776 ?auto_22777 ) ) ( not ( = ?auto_22776 ?auto_22779 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22780 ?auto_22779 ?auto_22778 ?auto_22777 )
      ( GET-2IMAGE-VERIFY ?auto_22775 ?auto_22776 ?auto_22778 ?auto_22777 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_22784 - DIRECTION
      ?auto_22785 - MODE
      ?auto_22787 - DIRECTION
      ?auto_22786 - MODE
    )
    :vars
    (
      ?auto_22788 - INSTRUMENT
      ?auto_22791 - SATELLITE
      ?auto_22789 - DIRECTION
      ?auto_22790 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22787 ?auto_22784 ) ) ( ON_BOARD ?auto_22788 ?auto_22791 ) ( SUPPORTS ?auto_22788 ?auto_22785 ) ( not ( = ?auto_22784 ?auto_22789 ) ) ( HAVE_IMAGE ?auto_22787 ?auto_22786 ) ( not ( = ?auto_22787 ?auto_22789 ) ) ( not ( = ?auto_22786 ?auto_22785 ) ) ( CALIBRATION_TARGET ?auto_22788 ?auto_22789 ) ( POWER_AVAIL ?auto_22791 ) ( POINTING ?auto_22791 ?auto_22790 ) ( not ( = ?auto_22789 ?auto_22790 ) ) ( not ( = ?auto_22784 ?auto_22790 ) ) ( not ( = ?auto_22787 ?auto_22790 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22787 ?auto_22786 ?auto_22784 ?auto_22785 )
      ( GET-2IMAGE-VERIFY ?auto_22784 ?auto_22785 ?auto_22787 ?auto_22786 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_22792 - DIRECTION
      ?auto_22793 - MODE
      ?auto_22795 - DIRECTION
      ?auto_22794 - MODE
    )
    :vars
    (
      ?auto_22797 - DIRECTION
      ?auto_22798 - INSTRUMENT
      ?auto_22800 - SATELLITE
      ?auto_22799 - DIRECTION
      ?auto_22796 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_22795 ?auto_22792 ) ) ( not ( = ?auto_22792 ?auto_22797 ) ) ( ON_BOARD ?auto_22798 ?auto_22800 ) ( SUPPORTS ?auto_22798 ?auto_22793 ) ( not ( = ?auto_22792 ?auto_22799 ) ) ( HAVE_IMAGE ?auto_22797 ?auto_22796 ) ( not ( = ?auto_22797 ?auto_22799 ) ) ( not ( = ?auto_22796 ?auto_22793 ) ) ( CALIBRATION_TARGET ?auto_22798 ?auto_22799 ) ( POWER_AVAIL ?auto_22800 ) ( POINTING ?auto_22800 ?auto_22795 ) ( not ( = ?auto_22799 ?auto_22795 ) ) ( not ( = ?auto_22797 ?auto_22795 ) ) ( HAVE_IMAGE ?auto_22795 ?auto_22794 ) ( not ( = ?auto_22793 ?auto_22794 ) ) ( not ( = ?auto_22794 ?auto_22796 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22797 ?auto_22796 ?auto_22792 ?auto_22793 )
      ( GET-2IMAGE-VERIFY ?auto_22792 ?auto_22793 ?auto_22795 ?auto_22794 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22821 - DIRECTION
      ?auto_22822 - MODE
      ?auto_22824 - DIRECTION
      ?auto_22823 - MODE
      ?auto_22826 - DIRECTION
      ?auto_22825 - MODE
    )
    :vars
    (
      ?auto_22827 - INSTRUMENT
      ?auto_22829 - SATELLITE
      ?auto_22828 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22824 ?auto_22821 ) ) ( not ( = ?auto_22826 ?auto_22821 ) ) ( not ( = ?auto_22826 ?auto_22824 ) ) ( ON_BOARD ?auto_22827 ?auto_22829 ) ( SUPPORTS ?auto_22827 ?auto_22825 ) ( not ( = ?auto_22826 ?auto_22828 ) ) ( HAVE_IMAGE ?auto_22821 ?auto_22822 ) ( not ( = ?auto_22821 ?auto_22828 ) ) ( not ( = ?auto_22822 ?auto_22825 ) ) ( CALIBRATION_TARGET ?auto_22827 ?auto_22828 ) ( POWER_AVAIL ?auto_22829 ) ( POINTING ?auto_22829 ?auto_22824 ) ( not ( = ?auto_22828 ?auto_22824 ) ) ( HAVE_IMAGE ?auto_22824 ?auto_22823 ) ( not ( = ?auto_22822 ?auto_22823 ) ) ( not ( = ?auto_22823 ?auto_22825 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22821 ?auto_22822 ?auto_22826 ?auto_22825 )
      ( GET-3IMAGE-VERIFY ?auto_22821 ?auto_22822 ?auto_22824 ?auto_22823 ?auto_22826 ?auto_22825 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22840 - DIRECTION
      ?auto_22841 - MODE
      ?auto_22843 - DIRECTION
      ?auto_22842 - MODE
      ?auto_22845 - DIRECTION
      ?auto_22844 - MODE
    )
    :vars
    (
      ?auto_22846 - INSTRUMENT
      ?auto_22848 - SATELLITE
      ?auto_22847 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22843 ?auto_22840 ) ) ( not ( = ?auto_22845 ?auto_22840 ) ) ( not ( = ?auto_22845 ?auto_22843 ) ) ( ON_BOARD ?auto_22846 ?auto_22848 ) ( SUPPORTS ?auto_22846 ?auto_22842 ) ( not ( = ?auto_22843 ?auto_22847 ) ) ( HAVE_IMAGE ?auto_22840 ?auto_22841 ) ( not ( = ?auto_22840 ?auto_22847 ) ) ( not ( = ?auto_22841 ?auto_22842 ) ) ( CALIBRATION_TARGET ?auto_22846 ?auto_22847 ) ( POWER_AVAIL ?auto_22848 ) ( POINTING ?auto_22848 ?auto_22845 ) ( not ( = ?auto_22847 ?auto_22845 ) ) ( HAVE_IMAGE ?auto_22845 ?auto_22844 ) ( not ( = ?auto_22841 ?auto_22844 ) ) ( not ( = ?auto_22842 ?auto_22844 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22840 ?auto_22841 ?auto_22843 ?auto_22842 )
      ( GET-3IMAGE-VERIFY ?auto_22840 ?auto_22841 ?auto_22843 ?auto_22842 ?auto_22845 ?auto_22844 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22859 - DIRECTION
      ?auto_22860 - MODE
      ?auto_22862 - DIRECTION
      ?auto_22861 - MODE
      ?auto_22864 - DIRECTION
      ?auto_22863 - MODE
    )
    :vars
    (
      ?auto_22865 - INSTRUMENT
      ?auto_22867 - SATELLITE
      ?auto_22866 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22862 ?auto_22859 ) ) ( not ( = ?auto_22864 ?auto_22859 ) ) ( not ( = ?auto_22864 ?auto_22862 ) ) ( ON_BOARD ?auto_22865 ?auto_22867 ) ( SUPPORTS ?auto_22865 ?auto_22863 ) ( not ( = ?auto_22864 ?auto_22866 ) ) ( HAVE_IMAGE ?auto_22862 ?auto_22861 ) ( not ( = ?auto_22862 ?auto_22866 ) ) ( not ( = ?auto_22861 ?auto_22863 ) ) ( CALIBRATION_TARGET ?auto_22865 ?auto_22866 ) ( POWER_AVAIL ?auto_22867 ) ( POINTING ?auto_22867 ?auto_22859 ) ( not ( = ?auto_22866 ?auto_22859 ) ) ( HAVE_IMAGE ?auto_22859 ?auto_22860 ) ( not ( = ?auto_22860 ?auto_22861 ) ) ( not ( = ?auto_22860 ?auto_22863 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22862 ?auto_22861 ?auto_22864 ?auto_22863 )
      ( GET-3IMAGE-VERIFY ?auto_22859 ?auto_22860 ?auto_22862 ?auto_22861 ?auto_22864 ?auto_22863 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22879 - DIRECTION
      ?auto_22880 - MODE
      ?auto_22882 - DIRECTION
      ?auto_22881 - MODE
      ?auto_22884 - DIRECTION
      ?auto_22883 - MODE
    )
    :vars
    (
      ?auto_22885 - INSTRUMENT
      ?auto_22887 - SATELLITE
      ?auto_22886 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22882 ?auto_22879 ) ) ( not ( = ?auto_22884 ?auto_22879 ) ) ( not ( = ?auto_22884 ?auto_22882 ) ) ( ON_BOARD ?auto_22885 ?auto_22887 ) ( SUPPORTS ?auto_22885 ?auto_22881 ) ( not ( = ?auto_22882 ?auto_22886 ) ) ( HAVE_IMAGE ?auto_22884 ?auto_22883 ) ( not ( = ?auto_22884 ?auto_22886 ) ) ( not ( = ?auto_22883 ?auto_22881 ) ) ( CALIBRATION_TARGET ?auto_22885 ?auto_22886 ) ( POWER_AVAIL ?auto_22887 ) ( POINTING ?auto_22887 ?auto_22879 ) ( not ( = ?auto_22886 ?auto_22879 ) ) ( HAVE_IMAGE ?auto_22879 ?auto_22880 ) ( not ( = ?auto_22880 ?auto_22881 ) ) ( not ( = ?auto_22880 ?auto_22883 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22884 ?auto_22883 ?auto_22882 ?auto_22881 )
      ( GET-3IMAGE-VERIFY ?auto_22879 ?auto_22880 ?auto_22882 ?auto_22881 ?auto_22884 ?auto_22883 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22920 - DIRECTION
      ?auto_22921 - MODE
      ?auto_22923 - DIRECTION
      ?auto_22922 - MODE
      ?auto_22925 - DIRECTION
      ?auto_22924 - MODE
    )
    :vars
    (
      ?auto_22926 - INSTRUMENT
      ?auto_22928 - SATELLITE
      ?auto_22927 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22923 ?auto_22920 ) ) ( not ( = ?auto_22925 ?auto_22920 ) ) ( not ( = ?auto_22925 ?auto_22923 ) ) ( ON_BOARD ?auto_22926 ?auto_22928 ) ( SUPPORTS ?auto_22926 ?auto_22921 ) ( not ( = ?auto_22920 ?auto_22927 ) ) ( HAVE_IMAGE ?auto_22923 ?auto_22922 ) ( not ( = ?auto_22923 ?auto_22927 ) ) ( not ( = ?auto_22922 ?auto_22921 ) ) ( CALIBRATION_TARGET ?auto_22926 ?auto_22927 ) ( POWER_AVAIL ?auto_22928 ) ( POINTING ?auto_22928 ?auto_22925 ) ( not ( = ?auto_22927 ?auto_22925 ) ) ( HAVE_IMAGE ?auto_22925 ?auto_22924 ) ( not ( = ?auto_22921 ?auto_22924 ) ) ( not ( = ?auto_22922 ?auto_22924 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22923 ?auto_22922 ?auto_22920 ?auto_22921 )
      ( GET-3IMAGE-VERIFY ?auto_22920 ?auto_22921 ?auto_22923 ?auto_22922 ?auto_22925 ?auto_22924 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22939 - DIRECTION
      ?auto_22940 - MODE
      ?auto_22942 - DIRECTION
      ?auto_22941 - MODE
      ?auto_22944 - DIRECTION
      ?auto_22943 - MODE
    )
    :vars
    (
      ?auto_22945 - INSTRUMENT
      ?auto_22947 - SATELLITE
      ?auto_22946 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_22942 ?auto_22939 ) ) ( not ( = ?auto_22944 ?auto_22939 ) ) ( not ( = ?auto_22944 ?auto_22942 ) ) ( ON_BOARD ?auto_22945 ?auto_22947 ) ( SUPPORTS ?auto_22945 ?auto_22940 ) ( not ( = ?auto_22939 ?auto_22946 ) ) ( HAVE_IMAGE ?auto_22944 ?auto_22943 ) ( not ( = ?auto_22944 ?auto_22946 ) ) ( not ( = ?auto_22943 ?auto_22940 ) ) ( CALIBRATION_TARGET ?auto_22945 ?auto_22946 ) ( POWER_AVAIL ?auto_22947 ) ( POINTING ?auto_22947 ?auto_22942 ) ( not ( = ?auto_22946 ?auto_22942 ) ) ( HAVE_IMAGE ?auto_22942 ?auto_22941 ) ( not ( = ?auto_22940 ?auto_22941 ) ) ( not ( = ?auto_22941 ?auto_22943 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22944 ?auto_22943 ?auto_22939 ?auto_22940 )
      ( GET-3IMAGE-VERIFY ?auto_22939 ?auto_22940 ?auto_22942 ?auto_22941 ?auto_22944 ?auto_22943 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_23003 - DIRECTION
      ?auto_23004 - MODE
    )
    :vars
    (
      ?auto_23006 - DIRECTION
      ?auto_23007 - INSTRUMENT
      ?auto_23010 - SATELLITE
      ?auto_23008 - DIRECTION
      ?auto_23005 - MODE
      ?auto_23009 - DIRECTION
      ?auto_23011 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23003 ?auto_23006 ) ) ( ON_BOARD ?auto_23007 ?auto_23010 ) ( SUPPORTS ?auto_23007 ?auto_23004 ) ( not ( = ?auto_23003 ?auto_23008 ) ) ( HAVE_IMAGE ?auto_23006 ?auto_23005 ) ( not ( = ?auto_23006 ?auto_23008 ) ) ( not ( = ?auto_23005 ?auto_23004 ) ) ( CALIBRATION_TARGET ?auto_23007 ?auto_23008 ) ( POINTING ?auto_23010 ?auto_23009 ) ( not ( = ?auto_23008 ?auto_23009 ) ) ( not ( = ?auto_23003 ?auto_23009 ) ) ( not ( = ?auto_23006 ?auto_23009 ) ) ( ON_BOARD ?auto_23011 ?auto_23010 ) ( POWER_ON ?auto_23011 ) ( not ( = ?auto_23007 ?auto_23011 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_23011 ?auto_23010 )
      ( GET-2IMAGE ?auto_23006 ?auto_23005 ?auto_23003 ?auto_23004 )
      ( GET-1IMAGE-VERIFY ?auto_23003 ?auto_23004 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23012 - DIRECTION
      ?auto_23013 - MODE
      ?auto_23015 - DIRECTION
      ?auto_23014 - MODE
    )
    :vars
    (
      ?auto_23018 - INSTRUMENT
      ?auto_23016 - SATELLITE
      ?auto_23020 - DIRECTION
      ?auto_23019 - DIRECTION
      ?auto_23017 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23015 ?auto_23012 ) ) ( ON_BOARD ?auto_23018 ?auto_23016 ) ( SUPPORTS ?auto_23018 ?auto_23014 ) ( not ( = ?auto_23015 ?auto_23020 ) ) ( HAVE_IMAGE ?auto_23012 ?auto_23013 ) ( not ( = ?auto_23012 ?auto_23020 ) ) ( not ( = ?auto_23013 ?auto_23014 ) ) ( CALIBRATION_TARGET ?auto_23018 ?auto_23020 ) ( POINTING ?auto_23016 ?auto_23019 ) ( not ( = ?auto_23020 ?auto_23019 ) ) ( not ( = ?auto_23015 ?auto_23019 ) ) ( not ( = ?auto_23012 ?auto_23019 ) ) ( ON_BOARD ?auto_23017 ?auto_23016 ) ( POWER_ON ?auto_23017 ) ( not ( = ?auto_23018 ?auto_23017 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_23015 ?auto_23014 )
      ( GET-2IMAGE-VERIFY ?auto_23012 ?auto_23013 ?auto_23015 ?auto_23014 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23021 - DIRECTION
      ?auto_23022 - MODE
      ?auto_23024 - DIRECTION
      ?auto_23023 - MODE
    )
    :vars
    (
      ?auto_23026 - DIRECTION
      ?auto_23027 - INSTRUMENT
      ?auto_23029 - SATELLITE
      ?auto_23028 - DIRECTION
      ?auto_23025 - MODE
      ?auto_23030 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23024 ?auto_23021 ) ) ( not ( = ?auto_23024 ?auto_23026 ) ) ( ON_BOARD ?auto_23027 ?auto_23029 ) ( SUPPORTS ?auto_23027 ?auto_23023 ) ( not ( = ?auto_23024 ?auto_23028 ) ) ( HAVE_IMAGE ?auto_23026 ?auto_23025 ) ( not ( = ?auto_23026 ?auto_23028 ) ) ( not ( = ?auto_23025 ?auto_23023 ) ) ( CALIBRATION_TARGET ?auto_23027 ?auto_23028 ) ( POINTING ?auto_23029 ?auto_23021 ) ( not ( = ?auto_23028 ?auto_23021 ) ) ( not ( = ?auto_23026 ?auto_23021 ) ) ( ON_BOARD ?auto_23030 ?auto_23029 ) ( POWER_ON ?auto_23030 ) ( not ( = ?auto_23027 ?auto_23030 ) ) ( HAVE_IMAGE ?auto_23021 ?auto_23022 ) ( not ( = ?auto_23022 ?auto_23023 ) ) ( not ( = ?auto_23022 ?auto_23025 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23026 ?auto_23025 ?auto_23024 ?auto_23023 )
      ( GET-2IMAGE-VERIFY ?auto_23021 ?auto_23022 ?auto_23024 ?auto_23023 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23031 - DIRECTION
      ?auto_23032 - MODE
      ?auto_23034 - DIRECTION
      ?auto_23033 - MODE
    )
    :vars
    (
      ?auto_23035 - INSTRUMENT
      ?auto_23037 - SATELLITE
      ?auto_23036 - DIRECTION
      ?auto_23038 - DIRECTION
      ?auto_23039 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23034 ?auto_23031 ) ) ( ON_BOARD ?auto_23035 ?auto_23037 ) ( SUPPORTS ?auto_23035 ?auto_23032 ) ( not ( = ?auto_23031 ?auto_23036 ) ) ( HAVE_IMAGE ?auto_23034 ?auto_23033 ) ( not ( = ?auto_23034 ?auto_23036 ) ) ( not ( = ?auto_23033 ?auto_23032 ) ) ( CALIBRATION_TARGET ?auto_23035 ?auto_23036 ) ( POINTING ?auto_23037 ?auto_23038 ) ( not ( = ?auto_23036 ?auto_23038 ) ) ( not ( = ?auto_23031 ?auto_23038 ) ) ( not ( = ?auto_23034 ?auto_23038 ) ) ( ON_BOARD ?auto_23039 ?auto_23037 ) ( POWER_ON ?auto_23039 ) ( not ( = ?auto_23035 ?auto_23039 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23034 ?auto_23033 ?auto_23031 ?auto_23032 )
      ( GET-2IMAGE-VERIFY ?auto_23031 ?auto_23032 ?auto_23034 ?auto_23033 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23040 - DIRECTION
      ?auto_23041 - MODE
      ?auto_23043 - DIRECTION
      ?auto_23042 - MODE
    )
    :vars
    (
      ?auto_23045 - DIRECTION
      ?auto_23046 - INSTRUMENT
      ?auto_23048 - SATELLITE
      ?auto_23047 - DIRECTION
      ?auto_23044 - MODE
      ?auto_23049 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23043 ?auto_23040 ) ) ( not ( = ?auto_23040 ?auto_23045 ) ) ( ON_BOARD ?auto_23046 ?auto_23048 ) ( SUPPORTS ?auto_23046 ?auto_23041 ) ( not ( = ?auto_23040 ?auto_23047 ) ) ( HAVE_IMAGE ?auto_23045 ?auto_23044 ) ( not ( = ?auto_23045 ?auto_23047 ) ) ( not ( = ?auto_23044 ?auto_23041 ) ) ( CALIBRATION_TARGET ?auto_23046 ?auto_23047 ) ( POINTING ?auto_23048 ?auto_23043 ) ( not ( = ?auto_23047 ?auto_23043 ) ) ( not ( = ?auto_23045 ?auto_23043 ) ) ( ON_BOARD ?auto_23049 ?auto_23048 ) ( POWER_ON ?auto_23049 ) ( not ( = ?auto_23046 ?auto_23049 ) ) ( HAVE_IMAGE ?auto_23043 ?auto_23042 ) ( not ( = ?auto_23041 ?auto_23042 ) ) ( not ( = ?auto_23042 ?auto_23044 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23045 ?auto_23044 ?auto_23040 ?auto_23041 )
      ( GET-2IMAGE-VERIFY ?auto_23040 ?auto_23041 ?auto_23043 ?auto_23042 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23072 - DIRECTION
      ?auto_23073 - MODE
      ?auto_23075 - DIRECTION
      ?auto_23074 - MODE
      ?auto_23077 - DIRECTION
      ?auto_23076 - MODE
    )
    :vars
    (
      ?auto_23078 - INSTRUMENT
      ?auto_23080 - SATELLITE
      ?auto_23079 - DIRECTION
      ?auto_23081 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23075 ?auto_23072 ) ) ( not ( = ?auto_23077 ?auto_23072 ) ) ( not ( = ?auto_23077 ?auto_23075 ) ) ( ON_BOARD ?auto_23078 ?auto_23080 ) ( SUPPORTS ?auto_23078 ?auto_23076 ) ( not ( = ?auto_23077 ?auto_23079 ) ) ( HAVE_IMAGE ?auto_23072 ?auto_23073 ) ( not ( = ?auto_23072 ?auto_23079 ) ) ( not ( = ?auto_23073 ?auto_23076 ) ) ( CALIBRATION_TARGET ?auto_23078 ?auto_23079 ) ( POINTING ?auto_23080 ?auto_23075 ) ( not ( = ?auto_23079 ?auto_23075 ) ) ( ON_BOARD ?auto_23081 ?auto_23080 ) ( POWER_ON ?auto_23081 ) ( not ( = ?auto_23078 ?auto_23081 ) ) ( HAVE_IMAGE ?auto_23075 ?auto_23074 ) ( not ( = ?auto_23073 ?auto_23074 ) ) ( not ( = ?auto_23074 ?auto_23076 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23072 ?auto_23073 ?auto_23077 ?auto_23076 )
      ( GET-3IMAGE-VERIFY ?auto_23072 ?auto_23073 ?auto_23075 ?auto_23074 ?auto_23077 ?auto_23076 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23093 - DIRECTION
      ?auto_23094 - MODE
      ?auto_23096 - DIRECTION
      ?auto_23095 - MODE
      ?auto_23098 - DIRECTION
      ?auto_23097 - MODE
    )
    :vars
    (
      ?auto_23099 - INSTRUMENT
      ?auto_23101 - SATELLITE
      ?auto_23100 - DIRECTION
      ?auto_23102 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23096 ?auto_23093 ) ) ( not ( = ?auto_23098 ?auto_23093 ) ) ( not ( = ?auto_23098 ?auto_23096 ) ) ( ON_BOARD ?auto_23099 ?auto_23101 ) ( SUPPORTS ?auto_23099 ?auto_23095 ) ( not ( = ?auto_23096 ?auto_23100 ) ) ( HAVE_IMAGE ?auto_23093 ?auto_23094 ) ( not ( = ?auto_23093 ?auto_23100 ) ) ( not ( = ?auto_23094 ?auto_23095 ) ) ( CALIBRATION_TARGET ?auto_23099 ?auto_23100 ) ( POINTING ?auto_23101 ?auto_23098 ) ( not ( = ?auto_23100 ?auto_23098 ) ) ( ON_BOARD ?auto_23102 ?auto_23101 ) ( POWER_ON ?auto_23102 ) ( not ( = ?auto_23099 ?auto_23102 ) ) ( HAVE_IMAGE ?auto_23098 ?auto_23097 ) ( not ( = ?auto_23094 ?auto_23097 ) ) ( not ( = ?auto_23095 ?auto_23097 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23093 ?auto_23094 ?auto_23096 ?auto_23095 )
      ( GET-3IMAGE-VERIFY ?auto_23093 ?auto_23094 ?auto_23096 ?auto_23095 ?auto_23098 ?auto_23097 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23114 - DIRECTION
      ?auto_23115 - MODE
      ?auto_23117 - DIRECTION
      ?auto_23116 - MODE
      ?auto_23119 - DIRECTION
      ?auto_23118 - MODE
    )
    :vars
    (
      ?auto_23120 - INSTRUMENT
      ?auto_23122 - SATELLITE
      ?auto_23121 - DIRECTION
      ?auto_23123 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23117 ?auto_23114 ) ) ( not ( = ?auto_23119 ?auto_23114 ) ) ( not ( = ?auto_23119 ?auto_23117 ) ) ( ON_BOARD ?auto_23120 ?auto_23122 ) ( SUPPORTS ?auto_23120 ?auto_23118 ) ( not ( = ?auto_23119 ?auto_23121 ) ) ( HAVE_IMAGE ?auto_23117 ?auto_23116 ) ( not ( = ?auto_23117 ?auto_23121 ) ) ( not ( = ?auto_23116 ?auto_23118 ) ) ( CALIBRATION_TARGET ?auto_23120 ?auto_23121 ) ( POINTING ?auto_23122 ?auto_23114 ) ( not ( = ?auto_23121 ?auto_23114 ) ) ( ON_BOARD ?auto_23123 ?auto_23122 ) ( POWER_ON ?auto_23123 ) ( not ( = ?auto_23120 ?auto_23123 ) ) ( HAVE_IMAGE ?auto_23114 ?auto_23115 ) ( not ( = ?auto_23115 ?auto_23116 ) ) ( not ( = ?auto_23115 ?auto_23118 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23117 ?auto_23116 ?auto_23119 ?auto_23118 )
      ( GET-3IMAGE-VERIFY ?auto_23114 ?auto_23115 ?auto_23117 ?auto_23116 ?auto_23119 ?auto_23118 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23136 - DIRECTION
      ?auto_23137 - MODE
      ?auto_23139 - DIRECTION
      ?auto_23138 - MODE
      ?auto_23141 - DIRECTION
      ?auto_23140 - MODE
    )
    :vars
    (
      ?auto_23142 - INSTRUMENT
      ?auto_23144 - SATELLITE
      ?auto_23143 - DIRECTION
      ?auto_23145 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23139 ?auto_23136 ) ) ( not ( = ?auto_23141 ?auto_23136 ) ) ( not ( = ?auto_23141 ?auto_23139 ) ) ( ON_BOARD ?auto_23142 ?auto_23144 ) ( SUPPORTS ?auto_23142 ?auto_23138 ) ( not ( = ?auto_23139 ?auto_23143 ) ) ( HAVE_IMAGE ?auto_23141 ?auto_23140 ) ( not ( = ?auto_23141 ?auto_23143 ) ) ( not ( = ?auto_23140 ?auto_23138 ) ) ( CALIBRATION_TARGET ?auto_23142 ?auto_23143 ) ( POINTING ?auto_23144 ?auto_23136 ) ( not ( = ?auto_23143 ?auto_23136 ) ) ( ON_BOARD ?auto_23145 ?auto_23144 ) ( POWER_ON ?auto_23145 ) ( not ( = ?auto_23142 ?auto_23145 ) ) ( HAVE_IMAGE ?auto_23136 ?auto_23137 ) ( not ( = ?auto_23137 ?auto_23138 ) ) ( not ( = ?auto_23137 ?auto_23140 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23141 ?auto_23140 ?auto_23139 ?auto_23138 )
      ( GET-3IMAGE-VERIFY ?auto_23136 ?auto_23137 ?auto_23139 ?auto_23138 ?auto_23141 ?auto_23140 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23181 - DIRECTION
      ?auto_23182 - MODE
      ?auto_23184 - DIRECTION
      ?auto_23183 - MODE
      ?auto_23186 - DIRECTION
      ?auto_23185 - MODE
    )
    :vars
    (
      ?auto_23187 - INSTRUMENT
      ?auto_23189 - SATELLITE
      ?auto_23188 - DIRECTION
      ?auto_23190 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23184 ?auto_23181 ) ) ( not ( = ?auto_23186 ?auto_23181 ) ) ( not ( = ?auto_23186 ?auto_23184 ) ) ( ON_BOARD ?auto_23187 ?auto_23189 ) ( SUPPORTS ?auto_23187 ?auto_23182 ) ( not ( = ?auto_23181 ?auto_23188 ) ) ( HAVE_IMAGE ?auto_23184 ?auto_23183 ) ( not ( = ?auto_23184 ?auto_23188 ) ) ( not ( = ?auto_23183 ?auto_23182 ) ) ( CALIBRATION_TARGET ?auto_23187 ?auto_23188 ) ( POINTING ?auto_23189 ?auto_23186 ) ( not ( = ?auto_23188 ?auto_23186 ) ) ( ON_BOARD ?auto_23190 ?auto_23189 ) ( POWER_ON ?auto_23190 ) ( not ( = ?auto_23187 ?auto_23190 ) ) ( HAVE_IMAGE ?auto_23186 ?auto_23185 ) ( not ( = ?auto_23182 ?auto_23185 ) ) ( not ( = ?auto_23183 ?auto_23185 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23184 ?auto_23183 ?auto_23181 ?auto_23182 )
      ( GET-3IMAGE-VERIFY ?auto_23181 ?auto_23182 ?auto_23184 ?auto_23183 ?auto_23186 ?auto_23185 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23202 - DIRECTION
      ?auto_23203 - MODE
      ?auto_23205 - DIRECTION
      ?auto_23204 - MODE
      ?auto_23207 - DIRECTION
      ?auto_23206 - MODE
    )
    :vars
    (
      ?auto_23208 - INSTRUMENT
      ?auto_23210 - SATELLITE
      ?auto_23209 - DIRECTION
      ?auto_23211 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23205 ?auto_23202 ) ) ( not ( = ?auto_23207 ?auto_23202 ) ) ( not ( = ?auto_23207 ?auto_23205 ) ) ( ON_BOARD ?auto_23208 ?auto_23210 ) ( SUPPORTS ?auto_23208 ?auto_23203 ) ( not ( = ?auto_23202 ?auto_23209 ) ) ( HAVE_IMAGE ?auto_23207 ?auto_23206 ) ( not ( = ?auto_23207 ?auto_23209 ) ) ( not ( = ?auto_23206 ?auto_23203 ) ) ( CALIBRATION_TARGET ?auto_23208 ?auto_23209 ) ( POINTING ?auto_23210 ?auto_23205 ) ( not ( = ?auto_23209 ?auto_23205 ) ) ( ON_BOARD ?auto_23211 ?auto_23210 ) ( POWER_ON ?auto_23211 ) ( not ( = ?auto_23208 ?auto_23211 ) ) ( HAVE_IMAGE ?auto_23205 ?auto_23204 ) ( not ( = ?auto_23203 ?auto_23204 ) ) ( not ( = ?auto_23204 ?auto_23206 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23207 ?auto_23206 ?auto_23202 ?auto_23203 )
      ( GET-3IMAGE-VERIFY ?auto_23202 ?auto_23203 ?auto_23205 ?auto_23204 ?auto_23207 ?auto_23206 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_23272 - DIRECTION
      ?auto_23273 - MODE
    )
    :vars
    (
      ?auto_23275 - DIRECTION
      ?auto_23276 - INSTRUMENT
      ?auto_23278 - SATELLITE
      ?auto_23277 - DIRECTION
      ?auto_23274 - MODE
      ?auto_23279 - DIRECTION
      ?auto_23280 - INSTRUMENT
      ?auto_23281 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_23272 ?auto_23275 ) ) ( ON_BOARD ?auto_23276 ?auto_23278 ) ( SUPPORTS ?auto_23276 ?auto_23273 ) ( not ( = ?auto_23272 ?auto_23277 ) ) ( HAVE_IMAGE ?auto_23275 ?auto_23274 ) ( not ( = ?auto_23275 ?auto_23277 ) ) ( not ( = ?auto_23274 ?auto_23273 ) ) ( CALIBRATION_TARGET ?auto_23276 ?auto_23277 ) ( POINTING ?auto_23278 ?auto_23279 ) ( not ( = ?auto_23277 ?auto_23279 ) ) ( not ( = ?auto_23272 ?auto_23279 ) ) ( not ( = ?auto_23275 ?auto_23279 ) ) ( ON_BOARD ?auto_23280 ?auto_23278 ) ( POWER_ON ?auto_23280 ) ( not ( = ?auto_23276 ?auto_23280 ) ) ( CALIBRATED ?auto_23280 ) ( SUPPORTS ?auto_23280 ?auto_23281 ) ( not ( = ?auto_23274 ?auto_23281 ) ) ( not ( = ?auto_23273 ?auto_23281 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23275 ?auto_23274 ?auto_23279 ?auto_23281 )
      ( GET-2IMAGE ?auto_23275 ?auto_23274 ?auto_23272 ?auto_23273 )
      ( GET-1IMAGE-VERIFY ?auto_23272 ?auto_23273 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23282 - DIRECTION
      ?auto_23283 - MODE
      ?auto_23285 - DIRECTION
      ?auto_23284 - MODE
    )
    :vars
    (
      ?auto_23286 - INSTRUMENT
      ?auto_23287 - SATELLITE
      ?auto_23288 - DIRECTION
      ?auto_23290 - DIRECTION
      ?auto_23291 - INSTRUMENT
      ?auto_23289 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_23285 ?auto_23282 ) ) ( ON_BOARD ?auto_23286 ?auto_23287 ) ( SUPPORTS ?auto_23286 ?auto_23284 ) ( not ( = ?auto_23285 ?auto_23288 ) ) ( HAVE_IMAGE ?auto_23282 ?auto_23283 ) ( not ( = ?auto_23282 ?auto_23288 ) ) ( not ( = ?auto_23283 ?auto_23284 ) ) ( CALIBRATION_TARGET ?auto_23286 ?auto_23288 ) ( POINTING ?auto_23287 ?auto_23290 ) ( not ( = ?auto_23288 ?auto_23290 ) ) ( not ( = ?auto_23285 ?auto_23290 ) ) ( not ( = ?auto_23282 ?auto_23290 ) ) ( ON_BOARD ?auto_23291 ?auto_23287 ) ( POWER_ON ?auto_23291 ) ( not ( = ?auto_23286 ?auto_23291 ) ) ( CALIBRATED ?auto_23291 ) ( SUPPORTS ?auto_23291 ?auto_23289 ) ( not ( = ?auto_23283 ?auto_23289 ) ) ( not ( = ?auto_23284 ?auto_23289 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_23285 ?auto_23284 )
      ( GET-2IMAGE-VERIFY ?auto_23282 ?auto_23283 ?auto_23285 ?auto_23284 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23292 - DIRECTION
      ?auto_23293 - MODE
      ?auto_23295 - DIRECTION
      ?auto_23294 - MODE
    )
    :vars
    (
      ?auto_23297 - DIRECTION
      ?auto_23301 - INSTRUMENT
      ?auto_23299 - SATELLITE
      ?auto_23300 - DIRECTION
      ?auto_23296 - MODE
      ?auto_23298 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23295 ?auto_23292 ) ) ( not ( = ?auto_23295 ?auto_23297 ) ) ( ON_BOARD ?auto_23301 ?auto_23299 ) ( SUPPORTS ?auto_23301 ?auto_23294 ) ( not ( = ?auto_23295 ?auto_23300 ) ) ( HAVE_IMAGE ?auto_23297 ?auto_23296 ) ( not ( = ?auto_23297 ?auto_23300 ) ) ( not ( = ?auto_23296 ?auto_23294 ) ) ( CALIBRATION_TARGET ?auto_23301 ?auto_23300 ) ( POINTING ?auto_23299 ?auto_23292 ) ( not ( = ?auto_23300 ?auto_23292 ) ) ( not ( = ?auto_23297 ?auto_23292 ) ) ( ON_BOARD ?auto_23298 ?auto_23299 ) ( POWER_ON ?auto_23298 ) ( not ( = ?auto_23301 ?auto_23298 ) ) ( CALIBRATED ?auto_23298 ) ( SUPPORTS ?auto_23298 ?auto_23293 ) ( not ( = ?auto_23296 ?auto_23293 ) ) ( not ( = ?auto_23294 ?auto_23293 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23297 ?auto_23296 ?auto_23295 ?auto_23294 )
      ( GET-2IMAGE-VERIFY ?auto_23292 ?auto_23293 ?auto_23295 ?auto_23294 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23302 - DIRECTION
      ?auto_23303 - MODE
      ?auto_23305 - DIRECTION
      ?auto_23304 - MODE
    )
    :vars
    (
      ?auto_23310 - INSTRUMENT
      ?auto_23308 - SATELLITE
      ?auto_23309 - DIRECTION
      ?auto_23306 - DIRECTION
      ?auto_23307 - INSTRUMENT
      ?auto_23311 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_23305 ?auto_23302 ) ) ( ON_BOARD ?auto_23310 ?auto_23308 ) ( SUPPORTS ?auto_23310 ?auto_23303 ) ( not ( = ?auto_23302 ?auto_23309 ) ) ( HAVE_IMAGE ?auto_23305 ?auto_23304 ) ( not ( = ?auto_23305 ?auto_23309 ) ) ( not ( = ?auto_23304 ?auto_23303 ) ) ( CALIBRATION_TARGET ?auto_23310 ?auto_23309 ) ( POINTING ?auto_23308 ?auto_23306 ) ( not ( = ?auto_23309 ?auto_23306 ) ) ( not ( = ?auto_23302 ?auto_23306 ) ) ( not ( = ?auto_23305 ?auto_23306 ) ) ( ON_BOARD ?auto_23307 ?auto_23308 ) ( POWER_ON ?auto_23307 ) ( not ( = ?auto_23310 ?auto_23307 ) ) ( CALIBRATED ?auto_23307 ) ( SUPPORTS ?auto_23307 ?auto_23311 ) ( not ( = ?auto_23304 ?auto_23311 ) ) ( not ( = ?auto_23303 ?auto_23311 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23305 ?auto_23304 ?auto_23302 ?auto_23303 )
      ( GET-2IMAGE-VERIFY ?auto_23302 ?auto_23303 ?auto_23305 ?auto_23304 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23312 - DIRECTION
      ?auto_23313 - MODE
      ?auto_23315 - DIRECTION
      ?auto_23314 - MODE
    )
    :vars
    (
      ?auto_23317 - DIRECTION
      ?auto_23321 - INSTRUMENT
      ?auto_23319 - SATELLITE
      ?auto_23320 - DIRECTION
      ?auto_23316 - MODE
      ?auto_23318 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23315 ?auto_23312 ) ) ( not ( = ?auto_23312 ?auto_23317 ) ) ( ON_BOARD ?auto_23321 ?auto_23319 ) ( SUPPORTS ?auto_23321 ?auto_23313 ) ( not ( = ?auto_23312 ?auto_23320 ) ) ( HAVE_IMAGE ?auto_23317 ?auto_23316 ) ( not ( = ?auto_23317 ?auto_23320 ) ) ( not ( = ?auto_23316 ?auto_23313 ) ) ( CALIBRATION_TARGET ?auto_23321 ?auto_23320 ) ( POINTING ?auto_23319 ?auto_23315 ) ( not ( = ?auto_23320 ?auto_23315 ) ) ( not ( = ?auto_23317 ?auto_23315 ) ) ( ON_BOARD ?auto_23318 ?auto_23319 ) ( POWER_ON ?auto_23318 ) ( not ( = ?auto_23321 ?auto_23318 ) ) ( CALIBRATED ?auto_23318 ) ( SUPPORTS ?auto_23318 ?auto_23314 ) ( not ( = ?auto_23316 ?auto_23314 ) ) ( not ( = ?auto_23313 ?auto_23314 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23317 ?auto_23316 ?auto_23312 ?auto_23313 )
      ( GET-2IMAGE-VERIFY ?auto_23312 ?auto_23313 ?auto_23315 ?auto_23314 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23346 - DIRECTION
      ?auto_23347 - MODE
      ?auto_23349 - DIRECTION
      ?auto_23348 - MODE
      ?auto_23351 - DIRECTION
      ?auto_23350 - MODE
    )
    :vars
    (
      ?auto_23355 - INSTRUMENT
      ?auto_23353 - SATELLITE
      ?auto_23354 - DIRECTION
      ?auto_23352 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23349 ?auto_23346 ) ) ( not ( = ?auto_23351 ?auto_23346 ) ) ( not ( = ?auto_23351 ?auto_23349 ) ) ( ON_BOARD ?auto_23355 ?auto_23353 ) ( SUPPORTS ?auto_23355 ?auto_23350 ) ( not ( = ?auto_23351 ?auto_23354 ) ) ( HAVE_IMAGE ?auto_23346 ?auto_23347 ) ( not ( = ?auto_23346 ?auto_23354 ) ) ( not ( = ?auto_23347 ?auto_23350 ) ) ( CALIBRATION_TARGET ?auto_23355 ?auto_23354 ) ( POINTING ?auto_23353 ?auto_23349 ) ( not ( = ?auto_23354 ?auto_23349 ) ) ( ON_BOARD ?auto_23352 ?auto_23353 ) ( POWER_ON ?auto_23352 ) ( not ( = ?auto_23355 ?auto_23352 ) ) ( CALIBRATED ?auto_23352 ) ( SUPPORTS ?auto_23352 ?auto_23348 ) ( not ( = ?auto_23347 ?auto_23348 ) ) ( not ( = ?auto_23350 ?auto_23348 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23346 ?auto_23347 ?auto_23351 ?auto_23350 )
      ( GET-3IMAGE-VERIFY ?auto_23346 ?auto_23347 ?auto_23349 ?auto_23348 ?auto_23351 ?auto_23350 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23368 - DIRECTION
      ?auto_23369 - MODE
      ?auto_23371 - DIRECTION
      ?auto_23370 - MODE
      ?auto_23373 - DIRECTION
      ?auto_23372 - MODE
    )
    :vars
    (
      ?auto_23377 - INSTRUMENT
      ?auto_23375 - SATELLITE
      ?auto_23376 - DIRECTION
      ?auto_23374 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23371 ?auto_23368 ) ) ( not ( = ?auto_23373 ?auto_23368 ) ) ( not ( = ?auto_23373 ?auto_23371 ) ) ( ON_BOARD ?auto_23377 ?auto_23375 ) ( SUPPORTS ?auto_23377 ?auto_23370 ) ( not ( = ?auto_23371 ?auto_23376 ) ) ( HAVE_IMAGE ?auto_23368 ?auto_23369 ) ( not ( = ?auto_23368 ?auto_23376 ) ) ( not ( = ?auto_23369 ?auto_23370 ) ) ( CALIBRATION_TARGET ?auto_23377 ?auto_23376 ) ( POINTING ?auto_23375 ?auto_23373 ) ( not ( = ?auto_23376 ?auto_23373 ) ) ( ON_BOARD ?auto_23374 ?auto_23375 ) ( POWER_ON ?auto_23374 ) ( not ( = ?auto_23377 ?auto_23374 ) ) ( CALIBRATED ?auto_23374 ) ( SUPPORTS ?auto_23374 ?auto_23372 ) ( not ( = ?auto_23369 ?auto_23372 ) ) ( not ( = ?auto_23370 ?auto_23372 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23368 ?auto_23369 ?auto_23371 ?auto_23370 )
      ( GET-3IMAGE-VERIFY ?auto_23368 ?auto_23369 ?auto_23371 ?auto_23370 ?auto_23373 ?auto_23372 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23390 - DIRECTION
      ?auto_23391 - MODE
      ?auto_23393 - DIRECTION
      ?auto_23392 - MODE
      ?auto_23395 - DIRECTION
      ?auto_23394 - MODE
    )
    :vars
    (
      ?auto_23399 - INSTRUMENT
      ?auto_23397 - SATELLITE
      ?auto_23398 - DIRECTION
      ?auto_23396 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23393 ?auto_23390 ) ) ( not ( = ?auto_23395 ?auto_23390 ) ) ( not ( = ?auto_23395 ?auto_23393 ) ) ( ON_BOARD ?auto_23399 ?auto_23397 ) ( SUPPORTS ?auto_23399 ?auto_23394 ) ( not ( = ?auto_23395 ?auto_23398 ) ) ( HAVE_IMAGE ?auto_23393 ?auto_23392 ) ( not ( = ?auto_23393 ?auto_23398 ) ) ( not ( = ?auto_23392 ?auto_23394 ) ) ( CALIBRATION_TARGET ?auto_23399 ?auto_23398 ) ( POINTING ?auto_23397 ?auto_23390 ) ( not ( = ?auto_23398 ?auto_23390 ) ) ( ON_BOARD ?auto_23396 ?auto_23397 ) ( POWER_ON ?auto_23396 ) ( not ( = ?auto_23399 ?auto_23396 ) ) ( CALIBRATED ?auto_23396 ) ( SUPPORTS ?auto_23396 ?auto_23391 ) ( not ( = ?auto_23392 ?auto_23391 ) ) ( not ( = ?auto_23394 ?auto_23391 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23393 ?auto_23392 ?auto_23395 ?auto_23394 )
      ( GET-3IMAGE-VERIFY ?auto_23390 ?auto_23391 ?auto_23393 ?auto_23392 ?auto_23395 ?auto_23394 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23412 - DIRECTION
      ?auto_23413 - MODE
      ?auto_23415 - DIRECTION
      ?auto_23414 - MODE
      ?auto_23417 - DIRECTION
      ?auto_23416 - MODE
    )
    :vars
    (
      ?auto_23421 - INSTRUMENT
      ?auto_23419 - SATELLITE
      ?auto_23420 - DIRECTION
      ?auto_23418 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23415 ?auto_23412 ) ) ( not ( = ?auto_23417 ?auto_23412 ) ) ( not ( = ?auto_23417 ?auto_23415 ) ) ( ON_BOARD ?auto_23421 ?auto_23419 ) ( SUPPORTS ?auto_23421 ?auto_23414 ) ( not ( = ?auto_23415 ?auto_23420 ) ) ( HAVE_IMAGE ?auto_23417 ?auto_23416 ) ( not ( = ?auto_23417 ?auto_23420 ) ) ( not ( = ?auto_23416 ?auto_23414 ) ) ( CALIBRATION_TARGET ?auto_23421 ?auto_23420 ) ( POINTING ?auto_23419 ?auto_23412 ) ( not ( = ?auto_23420 ?auto_23412 ) ) ( ON_BOARD ?auto_23418 ?auto_23419 ) ( POWER_ON ?auto_23418 ) ( not ( = ?auto_23421 ?auto_23418 ) ) ( CALIBRATED ?auto_23418 ) ( SUPPORTS ?auto_23418 ?auto_23413 ) ( not ( = ?auto_23416 ?auto_23413 ) ) ( not ( = ?auto_23414 ?auto_23413 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23417 ?auto_23416 ?auto_23415 ?auto_23414 )
      ( GET-3IMAGE-VERIFY ?auto_23412 ?auto_23413 ?auto_23415 ?auto_23414 ?auto_23417 ?auto_23416 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23458 - DIRECTION
      ?auto_23459 - MODE
      ?auto_23461 - DIRECTION
      ?auto_23460 - MODE
      ?auto_23463 - DIRECTION
      ?auto_23462 - MODE
    )
    :vars
    (
      ?auto_23467 - INSTRUMENT
      ?auto_23465 - SATELLITE
      ?auto_23466 - DIRECTION
      ?auto_23464 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23461 ?auto_23458 ) ) ( not ( = ?auto_23463 ?auto_23458 ) ) ( not ( = ?auto_23463 ?auto_23461 ) ) ( ON_BOARD ?auto_23467 ?auto_23465 ) ( SUPPORTS ?auto_23467 ?auto_23459 ) ( not ( = ?auto_23458 ?auto_23466 ) ) ( HAVE_IMAGE ?auto_23461 ?auto_23460 ) ( not ( = ?auto_23461 ?auto_23466 ) ) ( not ( = ?auto_23460 ?auto_23459 ) ) ( CALIBRATION_TARGET ?auto_23467 ?auto_23466 ) ( POINTING ?auto_23465 ?auto_23463 ) ( not ( = ?auto_23466 ?auto_23463 ) ) ( ON_BOARD ?auto_23464 ?auto_23465 ) ( POWER_ON ?auto_23464 ) ( not ( = ?auto_23467 ?auto_23464 ) ) ( CALIBRATED ?auto_23464 ) ( SUPPORTS ?auto_23464 ?auto_23462 ) ( not ( = ?auto_23460 ?auto_23462 ) ) ( not ( = ?auto_23459 ?auto_23462 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23461 ?auto_23460 ?auto_23458 ?auto_23459 )
      ( GET-3IMAGE-VERIFY ?auto_23458 ?auto_23459 ?auto_23461 ?auto_23460 ?auto_23463 ?auto_23462 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23480 - DIRECTION
      ?auto_23481 - MODE
      ?auto_23483 - DIRECTION
      ?auto_23482 - MODE
      ?auto_23485 - DIRECTION
      ?auto_23484 - MODE
    )
    :vars
    (
      ?auto_23489 - INSTRUMENT
      ?auto_23487 - SATELLITE
      ?auto_23488 - DIRECTION
      ?auto_23486 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23483 ?auto_23480 ) ) ( not ( = ?auto_23485 ?auto_23480 ) ) ( not ( = ?auto_23485 ?auto_23483 ) ) ( ON_BOARD ?auto_23489 ?auto_23487 ) ( SUPPORTS ?auto_23489 ?auto_23481 ) ( not ( = ?auto_23480 ?auto_23488 ) ) ( HAVE_IMAGE ?auto_23485 ?auto_23484 ) ( not ( = ?auto_23485 ?auto_23488 ) ) ( not ( = ?auto_23484 ?auto_23481 ) ) ( CALIBRATION_TARGET ?auto_23489 ?auto_23488 ) ( POINTING ?auto_23487 ?auto_23483 ) ( not ( = ?auto_23488 ?auto_23483 ) ) ( ON_BOARD ?auto_23486 ?auto_23487 ) ( POWER_ON ?auto_23486 ) ( not ( = ?auto_23489 ?auto_23486 ) ) ( CALIBRATED ?auto_23486 ) ( SUPPORTS ?auto_23486 ?auto_23482 ) ( not ( = ?auto_23484 ?auto_23482 ) ) ( not ( = ?auto_23481 ?auto_23482 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23485 ?auto_23484 ?auto_23480 ?auto_23481 )
      ( GET-3IMAGE-VERIFY ?auto_23480 ?auto_23481 ?auto_23483 ?auto_23482 ?auto_23485 ?auto_23484 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_23552 - DIRECTION
      ?auto_23553 - MODE
    )
    :vars
    (
      ?auto_23556 - DIRECTION
      ?auto_23560 - INSTRUMENT
      ?auto_23558 - SATELLITE
      ?auto_23559 - DIRECTION
      ?auto_23555 - MODE
      ?auto_23554 - DIRECTION
      ?auto_23557 - INSTRUMENT
      ?auto_23561 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_23552 ?auto_23556 ) ) ( ON_BOARD ?auto_23560 ?auto_23558 ) ( SUPPORTS ?auto_23560 ?auto_23553 ) ( not ( = ?auto_23552 ?auto_23559 ) ) ( HAVE_IMAGE ?auto_23556 ?auto_23555 ) ( not ( = ?auto_23556 ?auto_23559 ) ) ( not ( = ?auto_23555 ?auto_23553 ) ) ( CALIBRATION_TARGET ?auto_23560 ?auto_23559 ) ( not ( = ?auto_23559 ?auto_23554 ) ) ( not ( = ?auto_23552 ?auto_23554 ) ) ( not ( = ?auto_23556 ?auto_23554 ) ) ( ON_BOARD ?auto_23557 ?auto_23558 ) ( POWER_ON ?auto_23557 ) ( not ( = ?auto_23560 ?auto_23557 ) ) ( CALIBRATED ?auto_23557 ) ( SUPPORTS ?auto_23557 ?auto_23561 ) ( not ( = ?auto_23555 ?auto_23561 ) ) ( not ( = ?auto_23553 ?auto_23561 ) ) ( POINTING ?auto_23558 ?auto_23559 ) )
    :subtasks
    ( ( !TURN_TO ?auto_23558 ?auto_23554 ?auto_23559 )
      ( GET-2IMAGE ?auto_23556 ?auto_23555 ?auto_23552 ?auto_23553 )
      ( GET-1IMAGE-VERIFY ?auto_23552 ?auto_23553 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23562 - DIRECTION
      ?auto_23563 - MODE
      ?auto_23565 - DIRECTION
      ?auto_23564 - MODE
    )
    :vars
    (
      ?auto_23566 - INSTRUMENT
      ?auto_23568 - SATELLITE
      ?auto_23567 - DIRECTION
      ?auto_23571 - DIRECTION
      ?auto_23570 - INSTRUMENT
      ?auto_23569 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_23565 ?auto_23562 ) ) ( ON_BOARD ?auto_23566 ?auto_23568 ) ( SUPPORTS ?auto_23566 ?auto_23564 ) ( not ( = ?auto_23565 ?auto_23567 ) ) ( HAVE_IMAGE ?auto_23562 ?auto_23563 ) ( not ( = ?auto_23562 ?auto_23567 ) ) ( not ( = ?auto_23563 ?auto_23564 ) ) ( CALIBRATION_TARGET ?auto_23566 ?auto_23567 ) ( not ( = ?auto_23567 ?auto_23571 ) ) ( not ( = ?auto_23565 ?auto_23571 ) ) ( not ( = ?auto_23562 ?auto_23571 ) ) ( ON_BOARD ?auto_23570 ?auto_23568 ) ( POWER_ON ?auto_23570 ) ( not ( = ?auto_23566 ?auto_23570 ) ) ( CALIBRATED ?auto_23570 ) ( SUPPORTS ?auto_23570 ?auto_23569 ) ( not ( = ?auto_23563 ?auto_23569 ) ) ( not ( = ?auto_23564 ?auto_23569 ) ) ( POINTING ?auto_23568 ?auto_23567 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_23565 ?auto_23564 )
      ( GET-2IMAGE-VERIFY ?auto_23562 ?auto_23563 ?auto_23565 ?auto_23564 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23572 - DIRECTION
      ?auto_23573 - MODE
      ?auto_23575 - DIRECTION
      ?auto_23574 - MODE
    )
    :vars
    (
      ?auto_23578 - DIRECTION
      ?auto_23580 - INSTRUMENT
      ?auto_23581 - SATELLITE
      ?auto_23579 - DIRECTION
      ?auto_23577 - MODE
      ?auto_23576 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23575 ?auto_23572 ) ) ( not ( = ?auto_23575 ?auto_23578 ) ) ( ON_BOARD ?auto_23580 ?auto_23581 ) ( SUPPORTS ?auto_23580 ?auto_23574 ) ( not ( = ?auto_23575 ?auto_23579 ) ) ( HAVE_IMAGE ?auto_23578 ?auto_23577 ) ( not ( = ?auto_23578 ?auto_23579 ) ) ( not ( = ?auto_23577 ?auto_23574 ) ) ( CALIBRATION_TARGET ?auto_23580 ?auto_23579 ) ( not ( = ?auto_23579 ?auto_23572 ) ) ( not ( = ?auto_23578 ?auto_23572 ) ) ( ON_BOARD ?auto_23576 ?auto_23581 ) ( POWER_ON ?auto_23576 ) ( not ( = ?auto_23580 ?auto_23576 ) ) ( CALIBRATED ?auto_23576 ) ( SUPPORTS ?auto_23576 ?auto_23573 ) ( not ( = ?auto_23577 ?auto_23573 ) ) ( not ( = ?auto_23574 ?auto_23573 ) ) ( POINTING ?auto_23581 ?auto_23579 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23578 ?auto_23577 ?auto_23575 ?auto_23574 )
      ( GET-2IMAGE-VERIFY ?auto_23572 ?auto_23573 ?auto_23575 ?auto_23574 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23582 - DIRECTION
      ?auto_23583 - MODE
      ?auto_23585 - DIRECTION
      ?auto_23584 - MODE
    )
    :vars
    (
      ?auto_23589 - INSTRUMENT
      ?auto_23590 - SATELLITE
      ?auto_23588 - DIRECTION
      ?auto_23587 - DIRECTION
      ?auto_23586 - INSTRUMENT
      ?auto_23591 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_23585 ?auto_23582 ) ) ( ON_BOARD ?auto_23589 ?auto_23590 ) ( SUPPORTS ?auto_23589 ?auto_23583 ) ( not ( = ?auto_23582 ?auto_23588 ) ) ( HAVE_IMAGE ?auto_23585 ?auto_23584 ) ( not ( = ?auto_23585 ?auto_23588 ) ) ( not ( = ?auto_23584 ?auto_23583 ) ) ( CALIBRATION_TARGET ?auto_23589 ?auto_23588 ) ( not ( = ?auto_23588 ?auto_23587 ) ) ( not ( = ?auto_23582 ?auto_23587 ) ) ( not ( = ?auto_23585 ?auto_23587 ) ) ( ON_BOARD ?auto_23586 ?auto_23590 ) ( POWER_ON ?auto_23586 ) ( not ( = ?auto_23589 ?auto_23586 ) ) ( CALIBRATED ?auto_23586 ) ( SUPPORTS ?auto_23586 ?auto_23591 ) ( not ( = ?auto_23584 ?auto_23591 ) ) ( not ( = ?auto_23583 ?auto_23591 ) ) ( POINTING ?auto_23590 ?auto_23588 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23585 ?auto_23584 ?auto_23582 ?auto_23583 )
      ( GET-2IMAGE-VERIFY ?auto_23582 ?auto_23583 ?auto_23585 ?auto_23584 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23592 - DIRECTION
      ?auto_23593 - MODE
      ?auto_23595 - DIRECTION
      ?auto_23594 - MODE
    )
    :vars
    (
      ?auto_23598 - DIRECTION
      ?auto_23600 - INSTRUMENT
      ?auto_23601 - SATELLITE
      ?auto_23599 - DIRECTION
      ?auto_23597 - MODE
      ?auto_23596 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23595 ?auto_23592 ) ) ( not ( = ?auto_23592 ?auto_23598 ) ) ( ON_BOARD ?auto_23600 ?auto_23601 ) ( SUPPORTS ?auto_23600 ?auto_23593 ) ( not ( = ?auto_23592 ?auto_23599 ) ) ( HAVE_IMAGE ?auto_23598 ?auto_23597 ) ( not ( = ?auto_23598 ?auto_23599 ) ) ( not ( = ?auto_23597 ?auto_23593 ) ) ( CALIBRATION_TARGET ?auto_23600 ?auto_23599 ) ( not ( = ?auto_23599 ?auto_23595 ) ) ( not ( = ?auto_23598 ?auto_23595 ) ) ( ON_BOARD ?auto_23596 ?auto_23601 ) ( POWER_ON ?auto_23596 ) ( not ( = ?auto_23600 ?auto_23596 ) ) ( CALIBRATED ?auto_23596 ) ( SUPPORTS ?auto_23596 ?auto_23594 ) ( not ( = ?auto_23597 ?auto_23594 ) ) ( not ( = ?auto_23593 ?auto_23594 ) ) ( POINTING ?auto_23601 ?auto_23599 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23598 ?auto_23597 ?auto_23592 ?auto_23593 )
      ( GET-2IMAGE-VERIFY ?auto_23592 ?auto_23593 ?auto_23595 ?auto_23594 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23626 - DIRECTION
      ?auto_23627 - MODE
      ?auto_23629 - DIRECTION
      ?auto_23628 - MODE
      ?auto_23631 - DIRECTION
      ?auto_23630 - MODE
    )
    :vars
    (
      ?auto_23634 - INSTRUMENT
      ?auto_23635 - SATELLITE
      ?auto_23633 - DIRECTION
      ?auto_23632 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23629 ?auto_23626 ) ) ( not ( = ?auto_23631 ?auto_23626 ) ) ( not ( = ?auto_23631 ?auto_23629 ) ) ( ON_BOARD ?auto_23634 ?auto_23635 ) ( SUPPORTS ?auto_23634 ?auto_23630 ) ( not ( = ?auto_23631 ?auto_23633 ) ) ( HAVE_IMAGE ?auto_23626 ?auto_23627 ) ( not ( = ?auto_23626 ?auto_23633 ) ) ( not ( = ?auto_23627 ?auto_23630 ) ) ( CALIBRATION_TARGET ?auto_23634 ?auto_23633 ) ( not ( = ?auto_23633 ?auto_23629 ) ) ( ON_BOARD ?auto_23632 ?auto_23635 ) ( POWER_ON ?auto_23632 ) ( not ( = ?auto_23634 ?auto_23632 ) ) ( CALIBRATED ?auto_23632 ) ( SUPPORTS ?auto_23632 ?auto_23628 ) ( not ( = ?auto_23627 ?auto_23628 ) ) ( not ( = ?auto_23630 ?auto_23628 ) ) ( POINTING ?auto_23635 ?auto_23633 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23626 ?auto_23627 ?auto_23631 ?auto_23630 )
      ( GET-3IMAGE-VERIFY ?auto_23626 ?auto_23627 ?auto_23629 ?auto_23628 ?auto_23631 ?auto_23630 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23648 - DIRECTION
      ?auto_23649 - MODE
      ?auto_23651 - DIRECTION
      ?auto_23650 - MODE
      ?auto_23653 - DIRECTION
      ?auto_23652 - MODE
    )
    :vars
    (
      ?auto_23656 - INSTRUMENT
      ?auto_23657 - SATELLITE
      ?auto_23655 - DIRECTION
      ?auto_23654 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23651 ?auto_23648 ) ) ( not ( = ?auto_23653 ?auto_23648 ) ) ( not ( = ?auto_23653 ?auto_23651 ) ) ( ON_BOARD ?auto_23656 ?auto_23657 ) ( SUPPORTS ?auto_23656 ?auto_23650 ) ( not ( = ?auto_23651 ?auto_23655 ) ) ( HAVE_IMAGE ?auto_23648 ?auto_23649 ) ( not ( = ?auto_23648 ?auto_23655 ) ) ( not ( = ?auto_23649 ?auto_23650 ) ) ( CALIBRATION_TARGET ?auto_23656 ?auto_23655 ) ( not ( = ?auto_23655 ?auto_23653 ) ) ( ON_BOARD ?auto_23654 ?auto_23657 ) ( POWER_ON ?auto_23654 ) ( not ( = ?auto_23656 ?auto_23654 ) ) ( CALIBRATED ?auto_23654 ) ( SUPPORTS ?auto_23654 ?auto_23652 ) ( not ( = ?auto_23649 ?auto_23652 ) ) ( not ( = ?auto_23650 ?auto_23652 ) ) ( POINTING ?auto_23657 ?auto_23655 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23648 ?auto_23649 ?auto_23651 ?auto_23650 )
      ( GET-3IMAGE-VERIFY ?auto_23648 ?auto_23649 ?auto_23651 ?auto_23650 ?auto_23653 ?auto_23652 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23670 - DIRECTION
      ?auto_23671 - MODE
      ?auto_23673 - DIRECTION
      ?auto_23672 - MODE
      ?auto_23675 - DIRECTION
      ?auto_23674 - MODE
    )
    :vars
    (
      ?auto_23678 - INSTRUMENT
      ?auto_23679 - SATELLITE
      ?auto_23677 - DIRECTION
      ?auto_23676 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23673 ?auto_23670 ) ) ( not ( = ?auto_23675 ?auto_23670 ) ) ( not ( = ?auto_23675 ?auto_23673 ) ) ( ON_BOARD ?auto_23678 ?auto_23679 ) ( SUPPORTS ?auto_23678 ?auto_23674 ) ( not ( = ?auto_23675 ?auto_23677 ) ) ( HAVE_IMAGE ?auto_23673 ?auto_23672 ) ( not ( = ?auto_23673 ?auto_23677 ) ) ( not ( = ?auto_23672 ?auto_23674 ) ) ( CALIBRATION_TARGET ?auto_23678 ?auto_23677 ) ( not ( = ?auto_23677 ?auto_23670 ) ) ( ON_BOARD ?auto_23676 ?auto_23679 ) ( POWER_ON ?auto_23676 ) ( not ( = ?auto_23678 ?auto_23676 ) ) ( CALIBRATED ?auto_23676 ) ( SUPPORTS ?auto_23676 ?auto_23671 ) ( not ( = ?auto_23672 ?auto_23671 ) ) ( not ( = ?auto_23674 ?auto_23671 ) ) ( POINTING ?auto_23679 ?auto_23677 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23673 ?auto_23672 ?auto_23675 ?auto_23674 )
      ( GET-3IMAGE-VERIFY ?auto_23670 ?auto_23671 ?auto_23673 ?auto_23672 ?auto_23675 ?auto_23674 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23692 - DIRECTION
      ?auto_23693 - MODE
      ?auto_23695 - DIRECTION
      ?auto_23694 - MODE
      ?auto_23697 - DIRECTION
      ?auto_23696 - MODE
    )
    :vars
    (
      ?auto_23700 - INSTRUMENT
      ?auto_23701 - SATELLITE
      ?auto_23699 - DIRECTION
      ?auto_23698 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23695 ?auto_23692 ) ) ( not ( = ?auto_23697 ?auto_23692 ) ) ( not ( = ?auto_23697 ?auto_23695 ) ) ( ON_BOARD ?auto_23700 ?auto_23701 ) ( SUPPORTS ?auto_23700 ?auto_23694 ) ( not ( = ?auto_23695 ?auto_23699 ) ) ( HAVE_IMAGE ?auto_23697 ?auto_23696 ) ( not ( = ?auto_23697 ?auto_23699 ) ) ( not ( = ?auto_23696 ?auto_23694 ) ) ( CALIBRATION_TARGET ?auto_23700 ?auto_23699 ) ( not ( = ?auto_23699 ?auto_23692 ) ) ( ON_BOARD ?auto_23698 ?auto_23701 ) ( POWER_ON ?auto_23698 ) ( not ( = ?auto_23700 ?auto_23698 ) ) ( CALIBRATED ?auto_23698 ) ( SUPPORTS ?auto_23698 ?auto_23693 ) ( not ( = ?auto_23696 ?auto_23693 ) ) ( not ( = ?auto_23694 ?auto_23693 ) ) ( POINTING ?auto_23701 ?auto_23699 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23697 ?auto_23696 ?auto_23695 ?auto_23694 )
      ( GET-3IMAGE-VERIFY ?auto_23692 ?auto_23693 ?auto_23695 ?auto_23694 ?auto_23697 ?auto_23696 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23738 - DIRECTION
      ?auto_23739 - MODE
      ?auto_23741 - DIRECTION
      ?auto_23740 - MODE
      ?auto_23743 - DIRECTION
      ?auto_23742 - MODE
    )
    :vars
    (
      ?auto_23746 - INSTRUMENT
      ?auto_23747 - SATELLITE
      ?auto_23745 - DIRECTION
      ?auto_23744 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23741 ?auto_23738 ) ) ( not ( = ?auto_23743 ?auto_23738 ) ) ( not ( = ?auto_23743 ?auto_23741 ) ) ( ON_BOARD ?auto_23746 ?auto_23747 ) ( SUPPORTS ?auto_23746 ?auto_23739 ) ( not ( = ?auto_23738 ?auto_23745 ) ) ( HAVE_IMAGE ?auto_23741 ?auto_23740 ) ( not ( = ?auto_23741 ?auto_23745 ) ) ( not ( = ?auto_23740 ?auto_23739 ) ) ( CALIBRATION_TARGET ?auto_23746 ?auto_23745 ) ( not ( = ?auto_23745 ?auto_23743 ) ) ( ON_BOARD ?auto_23744 ?auto_23747 ) ( POWER_ON ?auto_23744 ) ( not ( = ?auto_23746 ?auto_23744 ) ) ( CALIBRATED ?auto_23744 ) ( SUPPORTS ?auto_23744 ?auto_23742 ) ( not ( = ?auto_23740 ?auto_23742 ) ) ( not ( = ?auto_23739 ?auto_23742 ) ) ( POINTING ?auto_23747 ?auto_23745 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23741 ?auto_23740 ?auto_23738 ?auto_23739 )
      ( GET-3IMAGE-VERIFY ?auto_23738 ?auto_23739 ?auto_23741 ?auto_23740 ?auto_23743 ?auto_23742 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23760 - DIRECTION
      ?auto_23761 - MODE
      ?auto_23763 - DIRECTION
      ?auto_23762 - MODE
      ?auto_23765 - DIRECTION
      ?auto_23764 - MODE
    )
    :vars
    (
      ?auto_23768 - INSTRUMENT
      ?auto_23769 - SATELLITE
      ?auto_23767 - DIRECTION
      ?auto_23766 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23763 ?auto_23760 ) ) ( not ( = ?auto_23765 ?auto_23760 ) ) ( not ( = ?auto_23765 ?auto_23763 ) ) ( ON_BOARD ?auto_23768 ?auto_23769 ) ( SUPPORTS ?auto_23768 ?auto_23761 ) ( not ( = ?auto_23760 ?auto_23767 ) ) ( HAVE_IMAGE ?auto_23765 ?auto_23764 ) ( not ( = ?auto_23765 ?auto_23767 ) ) ( not ( = ?auto_23764 ?auto_23761 ) ) ( CALIBRATION_TARGET ?auto_23768 ?auto_23767 ) ( not ( = ?auto_23767 ?auto_23763 ) ) ( ON_BOARD ?auto_23766 ?auto_23769 ) ( POWER_ON ?auto_23766 ) ( not ( = ?auto_23768 ?auto_23766 ) ) ( CALIBRATED ?auto_23766 ) ( SUPPORTS ?auto_23766 ?auto_23762 ) ( not ( = ?auto_23764 ?auto_23762 ) ) ( not ( = ?auto_23761 ?auto_23762 ) ) ( POINTING ?auto_23769 ?auto_23767 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23765 ?auto_23764 ?auto_23760 ?auto_23761 )
      ( GET-3IMAGE-VERIFY ?auto_23760 ?auto_23761 ?auto_23763 ?auto_23762 ?auto_23765 ?auto_23764 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_23832 - DIRECTION
      ?auto_23833 - MODE
    )
    :vars
    (
      ?auto_23837 - DIRECTION
      ?auto_23839 - INSTRUMENT
      ?auto_23840 - SATELLITE
      ?auto_23838 - DIRECTION
      ?auto_23836 - MODE
      ?auto_23835 - DIRECTION
      ?auto_23834 - INSTRUMENT
      ?auto_23841 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_23832 ?auto_23837 ) ) ( ON_BOARD ?auto_23839 ?auto_23840 ) ( SUPPORTS ?auto_23839 ?auto_23833 ) ( not ( = ?auto_23832 ?auto_23838 ) ) ( HAVE_IMAGE ?auto_23837 ?auto_23836 ) ( not ( = ?auto_23837 ?auto_23838 ) ) ( not ( = ?auto_23836 ?auto_23833 ) ) ( CALIBRATION_TARGET ?auto_23839 ?auto_23838 ) ( not ( = ?auto_23838 ?auto_23835 ) ) ( not ( = ?auto_23832 ?auto_23835 ) ) ( not ( = ?auto_23837 ?auto_23835 ) ) ( ON_BOARD ?auto_23834 ?auto_23840 ) ( POWER_ON ?auto_23834 ) ( not ( = ?auto_23839 ?auto_23834 ) ) ( SUPPORTS ?auto_23834 ?auto_23841 ) ( not ( = ?auto_23836 ?auto_23841 ) ) ( not ( = ?auto_23833 ?auto_23841 ) ) ( POINTING ?auto_23840 ?auto_23838 ) ( CALIBRATION_TARGET ?auto_23834 ?auto_23838 ) ( NOT_CALIBRATED ?auto_23834 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_23840 ?auto_23834 ?auto_23838 )
      ( GET-2IMAGE ?auto_23837 ?auto_23836 ?auto_23832 ?auto_23833 )
      ( GET-1IMAGE-VERIFY ?auto_23832 ?auto_23833 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23842 - DIRECTION
      ?auto_23843 - MODE
      ?auto_23845 - DIRECTION
      ?auto_23844 - MODE
    )
    :vars
    (
      ?auto_23846 - INSTRUMENT
      ?auto_23849 - SATELLITE
      ?auto_23851 - DIRECTION
      ?auto_23847 - DIRECTION
      ?auto_23850 - INSTRUMENT
      ?auto_23848 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_23845 ?auto_23842 ) ) ( ON_BOARD ?auto_23846 ?auto_23849 ) ( SUPPORTS ?auto_23846 ?auto_23844 ) ( not ( = ?auto_23845 ?auto_23851 ) ) ( HAVE_IMAGE ?auto_23842 ?auto_23843 ) ( not ( = ?auto_23842 ?auto_23851 ) ) ( not ( = ?auto_23843 ?auto_23844 ) ) ( CALIBRATION_TARGET ?auto_23846 ?auto_23851 ) ( not ( = ?auto_23851 ?auto_23847 ) ) ( not ( = ?auto_23845 ?auto_23847 ) ) ( not ( = ?auto_23842 ?auto_23847 ) ) ( ON_BOARD ?auto_23850 ?auto_23849 ) ( POWER_ON ?auto_23850 ) ( not ( = ?auto_23846 ?auto_23850 ) ) ( SUPPORTS ?auto_23850 ?auto_23848 ) ( not ( = ?auto_23843 ?auto_23848 ) ) ( not ( = ?auto_23844 ?auto_23848 ) ) ( POINTING ?auto_23849 ?auto_23851 ) ( CALIBRATION_TARGET ?auto_23850 ?auto_23851 ) ( NOT_CALIBRATED ?auto_23850 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_23845 ?auto_23844 )
      ( GET-2IMAGE-VERIFY ?auto_23842 ?auto_23843 ?auto_23845 ?auto_23844 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23852 - DIRECTION
      ?auto_23853 - MODE
      ?auto_23855 - DIRECTION
      ?auto_23854 - MODE
    )
    :vars
    (
      ?auto_23857 - DIRECTION
      ?auto_23859 - INSTRUMENT
      ?auto_23861 - SATELLITE
      ?auto_23858 - DIRECTION
      ?auto_23856 - MODE
      ?auto_23860 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23855 ?auto_23852 ) ) ( not ( = ?auto_23855 ?auto_23857 ) ) ( ON_BOARD ?auto_23859 ?auto_23861 ) ( SUPPORTS ?auto_23859 ?auto_23854 ) ( not ( = ?auto_23855 ?auto_23858 ) ) ( HAVE_IMAGE ?auto_23857 ?auto_23856 ) ( not ( = ?auto_23857 ?auto_23858 ) ) ( not ( = ?auto_23856 ?auto_23854 ) ) ( CALIBRATION_TARGET ?auto_23859 ?auto_23858 ) ( not ( = ?auto_23858 ?auto_23852 ) ) ( not ( = ?auto_23857 ?auto_23852 ) ) ( ON_BOARD ?auto_23860 ?auto_23861 ) ( POWER_ON ?auto_23860 ) ( not ( = ?auto_23859 ?auto_23860 ) ) ( SUPPORTS ?auto_23860 ?auto_23853 ) ( not ( = ?auto_23856 ?auto_23853 ) ) ( not ( = ?auto_23854 ?auto_23853 ) ) ( POINTING ?auto_23861 ?auto_23858 ) ( CALIBRATION_TARGET ?auto_23860 ?auto_23858 ) ( NOT_CALIBRATED ?auto_23860 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23857 ?auto_23856 ?auto_23855 ?auto_23854 )
      ( GET-2IMAGE-VERIFY ?auto_23852 ?auto_23853 ?auto_23855 ?auto_23854 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23862 - DIRECTION
      ?auto_23863 - MODE
      ?auto_23865 - DIRECTION
      ?auto_23864 - MODE
    )
    :vars
    (
      ?auto_23869 - INSTRUMENT
      ?auto_23871 - SATELLITE
      ?auto_23866 - DIRECTION
      ?auto_23867 - DIRECTION
      ?auto_23870 - INSTRUMENT
      ?auto_23868 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_23865 ?auto_23862 ) ) ( ON_BOARD ?auto_23869 ?auto_23871 ) ( SUPPORTS ?auto_23869 ?auto_23863 ) ( not ( = ?auto_23862 ?auto_23866 ) ) ( HAVE_IMAGE ?auto_23865 ?auto_23864 ) ( not ( = ?auto_23865 ?auto_23866 ) ) ( not ( = ?auto_23864 ?auto_23863 ) ) ( CALIBRATION_TARGET ?auto_23869 ?auto_23866 ) ( not ( = ?auto_23866 ?auto_23867 ) ) ( not ( = ?auto_23862 ?auto_23867 ) ) ( not ( = ?auto_23865 ?auto_23867 ) ) ( ON_BOARD ?auto_23870 ?auto_23871 ) ( POWER_ON ?auto_23870 ) ( not ( = ?auto_23869 ?auto_23870 ) ) ( SUPPORTS ?auto_23870 ?auto_23868 ) ( not ( = ?auto_23864 ?auto_23868 ) ) ( not ( = ?auto_23863 ?auto_23868 ) ) ( POINTING ?auto_23871 ?auto_23866 ) ( CALIBRATION_TARGET ?auto_23870 ?auto_23866 ) ( NOT_CALIBRATED ?auto_23870 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23865 ?auto_23864 ?auto_23862 ?auto_23863 )
      ( GET-2IMAGE-VERIFY ?auto_23862 ?auto_23863 ?auto_23865 ?auto_23864 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_23872 - DIRECTION
      ?auto_23873 - MODE
      ?auto_23875 - DIRECTION
      ?auto_23874 - MODE
    )
    :vars
    (
      ?auto_23877 - DIRECTION
      ?auto_23879 - INSTRUMENT
      ?auto_23881 - SATELLITE
      ?auto_23878 - DIRECTION
      ?auto_23876 - MODE
      ?auto_23880 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23875 ?auto_23872 ) ) ( not ( = ?auto_23872 ?auto_23877 ) ) ( ON_BOARD ?auto_23879 ?auto_23881 ) ( SUPPORTS ?auto_23879 ?auto_23873 ) ( not ( = ?auto_23872 ?auto_23878 ) ) ( HAVE_IMAGE ?auto_23877 ?auto_23876 ) ( not ( = ?auto_23877 ?auto_23878 ) ) ( not ( = ?auto_23876 ?auto_23873 ) ) ( CALIBRATION_TARGET ?auto_23879 ?auto_23878 ) ( not ( = ?auto_23878 ?auto_23875 ) ) ( not ( = ?auto_23877 ?auto_23875 ) ) ( ON_BOARD ?auto_23880 ?auto_23881 ) ( POWER_ON ?auto_23880 ) ( not ( = ?auto_23879 ?auto_23880 ) ) ( SUPPORTS ?auto_23880 ?auto_23874 ) ( not ( = ?auto_23876 ?auto_23874 ) ) ( not ( = ?auto_23873 ?auto_23874 ) ) ( POINTING ?auto_23881 ?auto_23878 ) ( CALIBRATION_TARGET ?auto_23880 ?auto_23878 ) ( NOT_CALIBRATED ?auto_23880 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23877 ?auto_23876 ?auto_23872 ?auto_23873 )
      ( GET-2IMAGE-VERIFY ?auto_23872 ?auto_23873 ?auto_23875 ?auto_23874 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23906 - DIRECTION
      ?auto_23907 - MODE
      ?auto_23909 - DIRECTION
      ?auto_23908 - MODE
      ?auto_23911 - DIRECTION
      ?auto_23910 - MODE
    )
    :vars
    (
      ?auto_23913 - INSTRUMENT
      ?auto_23915 - SATELLITE
      ?auto_23912 - DIRECTION
      ?auto_23914 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23909 ?auto_23906 ) ) ( not ( = ?auto_23911 ?auto_23906 ) ) ( not ( = ?auto_23911 ?auto_23909 ) ) ( ON_BOARD ?auto_23913 ?auto_23915 ) ( SUPPORTS ?auto_23913 ?auto_23910 ) ( not ( = ?auto_23911 ?auto_23912 ) ) ( HAVE_IMAGE ?auto_23906 ?auto_23907 ) ( not ( = ?auto_23906 ?auto_23912 ) ) ( not ( = ?auto_23907 ?auto_23910 ) ) ( CALIBRATION_TARGET ?auto_23913 ?auto_23912 ) ( not ( = ?auto_23912 ?auto_23909 ) ) ( ON_BOARD ?auto_23914 ?auto_23915 ) ( POWER_ON ?auto_23914 ) ( not ( = ?auto_23913 ?auto_23914 ) ) ( SUPPORTS ?auto_23914 ?auto_23908 ) ( not ( = ?auto_23907 ?auto_23908 ) ) ( not ( = ?auto_23910 ?auto_23908 ) ) ( POINTING ?auto_23915 ?auto_23912 ) ( CALIBRATION_TARGET ?auto_23914 ?auto_23912 ) ( NOT_CALIBRATED ?auto_23914 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23906 ?auto_23907 ?auto_23911 ?auto_23910 )
      ( GET-3IMAGE-VERIFY ?auto_23906 ?auto_23907 ?auto_23909 ?auto_23908 ?auto_23911 ?auto_23910 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23928 - DIRECTION
      ?auto_23929 - MODE
      ?auto_23931 - DIRECTION
      ?auto_23930 - MODE
      ?auto_23933 - DIRECTION
      ?auto_23932 - MODE
    )
    :vars
    (
      ?auto_23935 - INSTRUMENT
      ?auto_23937 - SATELLITE
      ?auto_23934 - DIRECTION
      ?auto_23936 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23931 ?auto_23928 ) ) ( not ( = ?auto_23933 ?auto_23928 ) ) ( not ( = ?auto_23933 ?auto_23931 ) ) ( ON_BOARD ?auto_23935 ?auto_23937 ) ( SUPPORTS ?auto_23935 ?auto_23930 ) ( not ( = ?auto_23931 ?auto_23934 ) ) ( HAVE_IMAGE ?auto_23928 ?auto_23929 ) ( not ( = ?auto_23928 ?auto_23934 ) ) ( not ( = ?auto_23929 ?auto_23930 ) ) ( CALIBRATION_TARGET ?auto_23935 ?auto_23934 ) ( not ( = ?auto_23934 ?auto_23933 ) ) ( ON_BOARD ?auto_23936 ?auto_23937 ) ( POWER_ON ?auto_23936 ) ( not ( = ?auto_23935 ?auto_23936 ) ) ( SUPPORTS ?auto_23936 ?auto_23932 ) ( not ( = ?auto_23929 ?auto_23932 ) ) ( not ( = ?auto_23930 ?auto_23932 ) ) ( POINTING ?auto_23937 ?auto_23934 ) ( CALIBRATION_TARGET ?auto_23936 ?auto_23934 ) ( NOT_CALIBRATED ?auto_23936 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23928 ?auto_23929 ?auto_23931 ?auto_23930 )
      ( GET-3IMAGE-VERIFY ?auto_23928 ?auto_23929 ?auto_23931 ?auto_23930 ?auto_23933 ?auto_23932 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23950 - DIRECTION
      ?auto_23951 - MODE
      ?auto_23953 - DIRECTION
      ?auto_23952 - MODE
      ?auto_23955 - DIRECTION
      ?auto_23954 - MODE
    )
    :vars
    (
      ?auto_23957 - INSTRUMENT
      ?auto_23959 - SATELLITE
      ?auto_23956 - DIRECTION
      ?auto_23958 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23953 ?auto_23950 ) ) ( not ( = ?auto_23955 ?auto_23950 ) ) ( not ( = ?auto_23955 ?auto_23953 ) ) ( ON_BOARD ?auto_23957 ?auto_23959 ) ( SUPPORTS ?auto_23957 ?auto_23954 ) ( not ( = ?auto_23955 ?auto_23956 ) ) ( HAVE_IMAGE ?auto_23953 ?auto_23952 ) ( not ( = ?auto_23953 ?auto_23956 ) ) ( not ( = ?auto_23952 ?auto_23954 ) ) ( CALIBRATION_TARGET ?auto_23957 ?auto_23956 ) ( not ( = ?auto_23956 ?auto_23950 ) ) ( ON_BOARD ?auto_23958 ?auto_23959 ) ( POWER_ON ?auto_23958 ) ( not ( = ?auto_23957 ?auto_23958 ) ) ( SUPPORTS ?auto_23958 ?auto_23951 ) ( not ( = ?auto_23952 ?auto_23951 ) ) ( not ( = ?auto_23954 ?auto_23951 ) ) ( POINTING ?auto_23959 ?auto_23956 ) ( CALIBRATION_TARGET ?auto_23958 ?auto_23956 ) ( NOT_CALIBRATED ?auto_23958 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23953 ?auto_23952 ?auto_23955 ?auto_23954 )
      ( GET-3IMAGE-VERIFY ?auto_23950 ?auto_23951 ?auto_23953 ?auto_23952 ?auto_23955 ?auto_23954 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23972 - DIRECTION
      ?auto_23973 - MODE
      ?auto_23975 - DIRECTION
      ?auto_23974 - MODE
      ?auto_23977 - DIRECTION
      ?auto_23976 - MODE
    )
    :vars
    (
      ?auto_23979 - INSTRUMENT
      ?auto_23981 - SATELLITE
      ?auto_23978 - DIRECTION
      ?auto_23980 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_23975 ?auto_23972 ) ) ( not ( = ?auto_23977 ?auto_23972 ) ) ( not ( = ?auto_23977 ?auto_23975 ) ) ( ON_BOARD ?auto_23979 ?auto_23981 ) ( SUPPORTS ?auto_23979 ?auto_23974 ) ( not ( = ?auto_23975 ?auto_23978 ) ) ( HAVE_IMAGE ?auto_23977 ?auto_23976 ) ( not ( = ?auto_23977 ?auto_23978 ) ) ( not ( = ?auto_23976 ?auto_23974 ) ) ( CALIBRATION_TARGET ?auto_23979 ?auto_23978 ) ( not ( = ?auto_23978 ?auto_23972 ) ) ( ON_BOARD ?auto_23980 ?auto_23981 ) ( POWER_ON ?auto_23980 ) ( not ( = ?auto_23979 ?auto_23980 ) ) ( SUPPORTS ?auto_23980 ?auto_23973 ) ( not ( = ?auto_23976 ?auto_23973 ) ) ( not ( = ?auto_23974 ?auto_23973 ) ) ( POINTING ?auto_23981 ?auto_23978 ) ( CALIBRATION_TARGET ?auto_23980 ?auto_23978 ) ( NOT_CALIBRATED ?auto_23980 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23977 ?auto_23976 ?auto_23975 ?auto_23974 )
      ( GET-3IMAGE-VERIFY ?auto_23972 ?auto_23973 ?auto_23975 ?auto_23974 ?auto_23977 ?auto_23976 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24018 - DIRECTION
      ?auto_24019 - MODE
      ?auto_24021 - DIRECTION
      ?auto_24020 - MODE
      ?auto_24023 - DIRECTION
      ?auto_24022 - MODE
    )
    :vars
    (
      ?auto_24025 - INSTRUMENT
      ?auto_24027 - SATELLITE
      ?auto_24024 - DIRECTION
      ?auto_24026 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24021 ?auto_24018 ) ) ( not ( = ?auto_24023 ?auto_24018 ) ) ( not ( = ?auto_24023 ?auto_24021 ) ) ( ON_BOARD ?auto_24025 ?auto_24027 ) ( SUPPORTS ?auto_24025 ?auto_24019 ) ( not ( = ?auto_24018 ?auto_24024 ) ) ( HAVE_IMAGE ?auto_24021 ?auto_24020 ) ( not ( = ?auto_24021 ?auto_24024 ) ) ( not ( = ?auto_24020 ?auto_24019 ) ) ( CALIBRATION_TARGET ?auto_24025 ?auto_24024 ) ( not ( = ?auto_24024 ?auto_24023 ) ) ( ON_BOARD ?auto_24026 ?auto_24027 ) ( POWER_ON ?auto_24026 ) ( not ( = ?auto_24025 ?auto_24026 ) ) ( SUPPORTS ?auto_24026 ?auto_24022 ) ( not ( = ?auto_24020 ?auto_24022 ) ) ( not ( = ?auto_24019 ?auto_24022 ) ) ( POINTING ?auto_24027 ?auto_24024 ) ( CALIBRATION_TARGET ?auto_24026 ?auto_24024 ) ( NOT_CALIBRATED ?auto_24026 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24021 ?auto_24020 ?auto_24018 ?auto_24019 )
      ( GET-3IMAGE-VERIFY ?auto_24018 ?auto_24019 ?auto_24021 ?auto_24020 ?auto_24023 ?auto_24022 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24040 - DIRECTION
      ?auto_24041 - MODE
      ?auto_24043 - DIRECTION
      ?auto_24042 - MODE
      ?auto_24045 - DIRECTION
      ?auto_24044 - MODE
    )
    :vars
    (
      ?auto_24047 - INSTRUMENT
      ?auto_24049 - SATELLITE
      ?auto_24046 - DIRECTION
      ?auto_24048 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24043 ?auto_24040 ) ) ( not ( = ?auto_24045 ?auto_24040 ) ) ( not ( = ?auto_24045 ?auto_24043 ) ) ( ON_BOARD ?auto_24047 ?auto_24049 ) ( SUPPORTS ?auto_24047 ?auto_24041 ) ( not ( = ?auto_24040 ?auto_24046 ) ) ( HAVE_IMAGE ?auto_24045 ?auto_24044 ) ( not ( = ?auto_24045 ?auto_24046 ) ) ( not ( = ?auto_24044 ?auto_24041 ) ) ( CALIBRATION_TARGET ?auto_24047 ?auto_24046 ) ( not ( = ?auto_24046 ?auto_24043 ) ) ( ON_BOARD ?auto_24048 ?auto_24049 ) ( POWER_ON ?auto_24048 ) ( not ( = ?auto_24047 ?auto_24048 ) ) ( SUPPORTS ?auto_24048 ?auto_24042 ) ( not ( = ?auto_24044 ?auto_24042 ) ) ( not ( = ?auto_24041 ?auto_24042 ) ) ( POINTING ?auto_24049 ?auto_24046 ) ( CALIBRATION_TARGET ?auto_24048 ?auto_24046 ) ( NOT_CALIBRATED ?auto_24048 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24045 ?auto_24044 ?auto_24040 ?auto_24041 )
      ( GET-3IMAGE-VERIFY ?auto_24040 ?auto_24041 ?auto_24043 ?auto_24042 ?auto_24045 ?auto_24044 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_24112 - DIRECTION
      ?auto_24113 - MODE
    )
    :vars
    (
      ?auto_24115 - DIRECTION
      ?auto_24119 - INSTRUMENT
      ?auto_24121 - SATELLITE
      ?auto_24116 - DIRECTION
      ?auto_24114 - MODE
      ?auto_24117 - DIRECTION
      ?auto_24120 - INSTRUMENT
      ?auto_24118 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_24112 ?auto_24115 ) ) ( ON_BOARD ?auto_24119 ?auto_24121 ) ( SUPPORTS ?auto_24119 ?auto_24113 ) ( not ( = ?auto_24112 ?auto_24116 ) ) ( HAVE_IMAGE ?auto_24115 ?auto_24114 ) ( not ( = ?auto_24115 ?auto_24116 ) ) ( not ( = ?auto_24114 ?auto_24113 ) ) ( CALIBRATION_TARGET ?auto_24119 ?auto_24116 ) ( not ( = ?auto_24116 ?auto_24117 ) ) ( not ( = ?auto_24112 ?auto_24117 ) ) ( not ( = ?auto_24115 ?auto_24117 ) ) ( ON_BOARD ?auto_24120 ?auto_24121 ) ( not ( = ?auto_24119 ?auto_24120 ) ) ( SUPPORTS ?auto_24120 ?auto_24118 ) ( not ( = ?auto_24114 ?auto_24118 ) ) ( not ( = ?auto_24113 ?auto_24118 ) ) ( POINTING ?auto_24121 ?auto_24116 ) ( CALIBRATION_TARGET ?auto_24120 ?auto_24116 ) ( POWER_AVAIL ?auto_24121 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_24120 ?auto_24121 )
      ( GET-2IMAGE ?auto_24115 ?auto_24114 ?auto_24112 ?auto_24113 )
      ( GET-1IMAGE-VERIFY ?auto_24112 ?auto_24113 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24122 - DIRECTION
      ?auto_24123 - MODE
      ?auto_24125 - DIRECTION
      ?auto_24124 - MODE
    )
    :vars
    (
      ?auto_24127 - INSTRUMENT
      ?auto_24131 - SATELLITE
      ?auto_24126 - DIRECTION
      ?auto_24128 - DIRECTION
      ?auto_24130 - INSTRUMENT
      ?auto_24129 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_24125 ?auto_24122 ) ) ( ON_BOARD ?auto_24127 ?auto_24131 ) ( SUPPORTS ?auto_24127 ?auto_24124 ) ( not ( = ?auto_24125 ?auto_24126 ) ) ( HAVE_IMAGE ?auto_24122 ?auto_24123 ) ( not ( = ?auto_24122 ?auto_24126 ) ) ( not ( = ?auto_24123 ?auto_24124 ) ) ( CALIBRATION_TARGET ?auto_24127 ?auto_24126 ) ( not ( = ?auto_24126 ?auto_24128 ) ) ( not ( = ?auto_24125 ?auto_24128 ) ) ( not ( = ?auto_24122 ?auto_24128 ) ) ( ON_BOARD ?auto_24130 ?auto_24131 ) ( not ( = ?auto_24127 ?auto_24130 ) ) ( SUPPORTS ?auto_24130 ?auto_24129 ) ( not ( = ?auto_24123 ?auto_24129 ) ) ( not ( = ?auto_24124 ?auto_24129 ) ) ( POINTING ?auto_24131 ?auto_24126 ) ( CALIBRATION_TARGET ?auto_24130 ?auto_24126 ) ( POWER_AVAIL ?auto_24131 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_24125 ?auto_24124 )
      ( GET-2IMAGE-VERIFY ?auto_24122 ?auto_24123 ?auto_24125 ?auto_24124 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24132 - DIRECTION
      ?auto_24133 - MODE
      ?auto_24135 - DIRECTION
      ?auto_24134 - MODE
    )
    :vars
    (
      ?auto_24140 - DIRECTION
      ?auto_24138 - INSTRUMENT
      ?auto_24141 - SATELLITE
      ?auto_24137 - DIRECTION
      ?auto_24139 - MODE
      ?auto_24136 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24135 ?auto_24132 ) ) ( not ( = ?auto_24135 ?auto_24140 ) ) ( ON_BOARD ?auto_24138 ?auto_24141 ) ( SUPPORTS ?auto_24138 ?auto_24134 ) ( not ( = ?auto_24135 ?auto_24137 ) ) ( HAVE_IMAGE ?auto_24140 ?auto_24139 ) ( not ( = ?auto_24140 ?auto_24137 ) ) ( not ( = ?auto_24139 ?auto_24134 ) ) ( CALIBRATION_TARGET ?auto_24138 ?auto_24137 ) ( not ( = ?auto_24137 ?auto_24132 ) ) ( not ( = ?auto_24140 ?auto_24132 ) ) ( ON_BOARD ?auto_24136 ?auto_24141 ) ( not ( = ?auto_24138 ?auto_24136 ) ) ( SUPPORTS ?auto_24136 ?auto_24133 ) ( not ( = ?auto_24139 ?auto_24133 ) ) ( not ( = ?auto_24134 ?auto_24133 ) ) ( POINTING ?auto_24141 ?auto_24137 ) ( CALIBRATION_TARGET ?auto_24136 ?auto_24137 ) ( POWER_AVAIL ?auto_24141 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24140 ?auto_24139 ?auto_24135 ?auto_24134 )
      ( GET-2IMAGE-VERIFY ?auto_24132 ?auto_24133 ?auto_24135 ?auto_24134 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24142 - DIRECTION
      ?auto_24143 - MODE
      ?auto_24145 - DIRECTION
      ?auto_24144 - MODE
    )
    :vars
    (
      ?auto_24149 - INSTRUMENT
      ?auto_24150 - SATELLITE
      ?auto_24148 - DIRECTION
      ?auto_24151 - DIRECTION
      ?auto_24147 - INSTRUMENT
      ?auto_24146 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_24145 ?auto_24142 ) ) ( ON_BOARD ?auto_24149 ?auto_24150 ) ( SUPPORTS ?auto_24149 ?auto_24143 ) ( not ( = ?auto_24142 ?auto_24148 ) ) ( HAVE_IMAGE ?auto_24145 ?auto_24144 ) ( not ( = ?auto_24145 ?auto_24148 ) ) ( not ( = ?auto_24144 ?auto_24143 ) ) ( CALIBRATION_TARGET ?auto_24149 ?auto_24148 ) ( not ( = ?auto_24148 ?auto_24151 ) ) ( not ( = ?auto_24142 ?auto_24151 ) ) ( not ( = ?auto_24145 ?auto_24151 ) ) ( ON_BOARD ?auto_24147 ?auto_24150 ) ( not ( = ?auto_24149 ?auto_24147 ) ) ( SUPPORTS ?auto_24147 ?auto_24146 ) ( not ( = ?auto_24144 ?auto_24146 ) ) ( not ( = ?auto_24143 ?auto_24146 ) ) ( POINTING ?auto_24150 ?auto_24148 ) ( CALIBRATION_TARGET ?auto_24147 ?auto_24148 ) ( POWER_AVAIL ?auto_24150 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24145 ?auto_24144 ?auto_24142 ?auto_24143 )
      ( GET-2IMAGE-VERIFY ?auto_24142 ?auto_24143 ?auto_24145 ?auto_24144 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24152 - DIRECTION
      ?auto_24153 - MODE
      ?auto_24155 - DIRECTION
      ?auto_24154 - MODE
    )
    :vars
    (
      ?auto_24160 - DIRECTION
      ?auto_24158 - INSTRUMENT
      ?auto_24161 - SATELLITE
      ?auto_24157 - DIRECTION
      ?auto_24159 - MODE
      ?auto_24156 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24155 ?auto_24152 ) ) ( not ( = ?auto_24152 ?auto_24160 ) ) ( ON_BOARD ?auto_24158 ?auto_24161 ) ( SUPPORTS ?auto_24158 ?auto_24153 ) ( not ( = ?auto_24152 ?auto_24157 ) ) ( HAVE_IMAGE ?auto_24160 ?auto_24159 ) ( not ( = ?auto_24160 ?auto_24157 ) ) ( not ( = ?auto_24159 ?auto_24153 ) ) ( CALIBRATION_TARGET ?auto_24158 ?auto_24157 ) ( not ( = ?auto_24157 ?auto_24155 ) ) ( not ( = ?auto_24160 ?auto_24155 ) ) ( ON_BOARD ?auto_24156 ?auto_24161 ) ( not ( = ?auto_24158 ?auto_24156 ) ) ( SUPPORTS ?auto_24156 ?auto_24154 ) ( not ( = ?auto_24159 ?auto_24154 ) ) ( not ( = ?auto_24153 ?auto_24154 ) ) ( POINTING ?auto_24161 ?auto_24157 ) ( CALIBRATION_TARGET ?auto_24156 ?auto_24157 ) ( POWER_AVAIL ?auto_24161 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24160 ?auto_24159 ?auto_24152 ?auto_24153 )
      ( GET-2IMAGE-VERIFY ?auto_24152 ?auto_24153 ?auto_24155 ?auto_24154 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24186 - DIRECTION
      ?auto_24187 - MODE
      ?auto_24189 - DIRECTION
      ?auto_24188 - MODE
      ?auto_24191 - DIRECTION
      ?auto_24190 - MODE
    )
    :vars
    (
      ?auto_24194 - INSTRUMENT
      ?auto_24195 - SATELLITE
      ?auto_24193 - DIRECTION
      ?auto_24192 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24189 ?auto_24186 ) ) ( not ( = ?auto_24191 ?auto_24186 ) ) ( not ( = ?auto_24191 ?auto_24189 ) ) ( ON_BOARD ?auto_24194 ?auto_24195 ) ( SUPPORTS ?auto_24194 ?auto_24190 ) ( not ( = ?auto_24191 ?auto_24193 ) ) ( HAVE_IMAGE ?auto_24186 ?auto_24187 ) ( not ( = ?auto_24186 ?auto_24193 ) ) ( not ( = ?auto_24187 ?auto_24190 ) ) ( CALIBRATION_TARGET ?auto_24194 ?auto_24193 ) ( not ( = ?auto_24193 ?auto_24189 ) ) ( ON_BOARD ?auto_24192 ?auto_24195 ) ( not ( = ?auto_24194 ?auto_24192 ) ) ( SUPPORTS ?auto_24192 ?auto_24188 ) ( not ( = ?auto_24187 ?auto_24188 ) ) ( not ( = ?auto_24190 ?auto_24188 ) ) ( POINTING ?auto_24195 ?auto_24193 ) ( CALIBRATION_TARGET ?auto_24192 ?auto_24193 ) ( POWER_AVAIL ?auto_24195 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24186 ?auto_24187 ?auto_24191 ?auto_24190 )
      ( GET-3IMAGE-VERIFY ?auto_24186 ?auto_24187 ?auto_24189 ?auto_24188 ?auto_24191 ?auto_24190 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24208 - DIRECTION
      ?auto_24209 - MODE
      ?auto_24211 - DIRECTION
      ?auto_24210 - MODE
      ?auto_24213 - DIRECTION
      ?auto_24212 - MODE
    )
    :vars
    (
      ?auto_24216 - INSTRUMENT
      ?auto_24217 - SATELLITE
      ?auto_24215 - DIRECTION
      ?auto_24214 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24211 ?auto_24208 ) ) ( not ( = ?auto_24213 ?auto_24208 ) ) ( not ( = ?auto_24213 ?auto_24211 ) ) ( ON_BOARD ?auto_24216 ?auto_24217 ) ( SUPPORTS ?auto_24216 ?auto_24210 ) ( not ( = ?auto_24211 ?auto_24215 ) ) ( HAVE_IMAGE ?auto_24208 ?auto_24209 ) ( not ( = ?auto_24208 ?auto_24215 ) ) ( not ( = ?auto_24209 ?auto_24210 ) ) ( CALIBRATION_TARGET ?auto_24216 ?auto_24215 ) ( not ( = ?auto_24215 ?auto_24213 ) ) ( ON_BOARD ?auto_24214 ?auto_24217 ) ( not ( = ?auto_24216 ?auto_24214 ) ) ( SUPPORTS ?auto_24214 ?auto_24212 ) ( not ( = ?auto_24209 ?auto_24212 ) ) ( not ( = ?auto_24210 ?auto_24212 ) ) ( POINTING ?auto_24217 ?auto_24215 ) ( CALIBRATION_TARGET ?auto_24214 ?auto_24215 ) ( POWER_AVAIL ?auto_24217 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24208 ?auto_24209 ?auto_24211 ?auto_24210 )
      ( GET-3IMAGE-VERIFY ?auto_24208 ?auto_24209 ?auto_24211 ?auto_24210 ?auto_24213 ?auto_24212 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24230 - DIRECTION
      ?auto_24231 - MODE
      ?auto_24233 - DIRECTION
      ?auto_24232 - MODE
      ?auto_24235 - DIRECTION
      ?auto_24234 - MODE
    )
    :vars
    (
      ?auto_24238 - INSTRUMENT
      ?auto_24239 - SATELLITE
      ?auto_24237 - DIRECTION
      ?auto_24236 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24233 ?auto_24230 ) ) ( not ( = ?auto_24235 ?auto_24230 ) ) ( not ( = ?auto_24235 ?auto_24233 ) ) ( ON_BOARD ?auto_24238 ?auto_24239 ) ( SUPPORTS ?auto_24238 ?auto_24234 ) ( not ( = ?auto_24235 ?auto_24237 ) ) ( HAVE_IMAGE ?auto_24233 ?auto_24232 ) ( not ( = ?auto_24233 ?auto_24237 ) ) ( not ( = ?auto_24232 ?auto_24234 ) ) ( CALIBRATION_TARGET ?auto_24238 ?auto_24237 ) ( not ( = ?auto_24237 ?auto_24230 ) ) ( ON_BOARD ?auto_24236 ?auto_24239 ) ( not ( = ?auto_24238 ?auto_24236 ) ) ( SUPPORTS ?auto_24236 ?auto_24231 ) ( not ( = ?auto_24232 ?auto_24231 ) ) ( not ( = ?auto_24234 ?auto_24231 ) ) ( POINTING ?auto_24239 ?auto_24237 ) ( CALIBRATION_TARGET ?auto_24236 ?auto_24237 ) ( POWER_AVAIL ?auto_24239 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24233 ?auto_24232 ?auto_24235 ?auto_24234 )
      ( GET-3IMAGE-VERIFY ?auto_24230 ?auto_24231 ?auto_24233 ?auto_24232 ?auto_24235 ?auto_24234 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24252 - DIRECTION
      ?auto_24253 - MODE
      ?auto_24255 - DIRECTION
      ?auto_24254 - MODE
      ?auto_24257 - DIRECTION
      ?auto_24256 - MODE
    )
    :vars
    (
      ?auto_24260 - INSTRUMENT
      ?auto_24261 - SATELLITE
      ?auto_24259 - DIRECTION
      ?auto_24258 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24255 ?auto_24252 ) ) ( not ( = ?auto_24257 ?auto_24252 ) ) ( not ( = ?auto_24257 ?auto_24255 ) ) ( ON_BOARD ?auto_24260 ?auto_24261 ) ( SUPPORTS ?auto_24260 ?auto_24254 ) ( not ( = ?auto_24255 ?auto_24259 ) ) ( HAVE_IMAGE ?auto_24257 ?auto_24256 ) ( not ( = ?auto_24257 ?auto_24259 ) ) ( not ( = ?auto_24256 ?auto_24254 ) ) ( CALIBRATION_TARGET ?auto_24260 ?auto_24259 ) ( not ( = ?auto_24259 ?auto_24252 ) ) ( ON_BOARD ?auto_24258 ?auto_24261 ) ( not ( = ?auto_24260 ?auto_24258 ) ) ( SUPPORTS ?auto_24258 ?auto_24253 ) ( not ( = ?auto_24256 ?auto_24253 ) ) ( not ( = ?auto_24254 ?auto_24253 ) ) ( POINTING ?auto_24261 ?auto_24259 ) ( CALIBRATION_TARGET ?auto_24258 ?auto_24259 ) ( POWER_AVAIL ?auto_24261 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24257 ?auto_24256 ?auto_24255 ?auto_24254 )
      ( GET-3IMAGE-VERIFY ?auto_24252 ?auto_24253 ?auto_24255 ?auto_24254 ?auto_24257 ?auto_24256 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24298 - DIRECTION
      ?auto_24299 - MODE
      ?auto_24301 - DIRECTION
      ?auto_24300 - MODE
      ?auto_24303 - DIRECTION
      ?auto_24302 - MODE
    )
    :vars
    (
      ?auto_24306 - INSTRUMENT
      ?auto_24307 - SATELLITE
      ?auto_24305 - DIRECTION
      ?auto_24304 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24301 ?auto_24298 ) ) ( not ( = ?auto_24303 ?auto_24298 ) ) ( not ( = ?auto_24303 ?auto_24301 ) ) ( ON_BOARD ?auto_24306 ?auto_24307 ) ( SUPPORTS ?auto_24306 ?auto_24299 ) ( not ( = ?auto_24298 ?auto_24305 ) ) ( HAVE_IMAGE ?auto_24301 ?auto_24300 ) ( not ( = ?auto_24301 ?auto_24305 ) ) ( not ( = ?auto_24300 ?auto_24299 ) ) ( CALIBRATION_TARGET ?auto_24306 ?auto_24305 ) ( not ( = ?auto_24305 ?auto_24303 ) ) ( ON_BOARD ?auto_24304 ?auto_24307 ) ( not ( = ?auto_24306 ?auto_24304 ) ) ( SUPPORTS ?auto_24304 ?auto_24302 ) ( not ( = ?auto_24300 ?auto_24302 ) ) ( not ( = ?auto_24299 ?auto_24302 ) ) ( POINTING ?auto_24307 ?auto_24305 ) ( CALIBRATION_TARGET ?auto_24304 ?auto_24305 ) ( POWER_AVAIL ?auto_24307 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24301 ?auto_24300 ?auto_24298 ?auto_24299 )
      ( GET-3IMAGE-VERIFY ?auto_24298 ?auto_24299 ?auto_24301 ?auto_24300 ?auto_24303 ?auto_24302 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24320 - DIRECTION
      ?auto_24321 - MODE
      ?auto_24323 - DIRECTION
      ?auto_24322 - MODE
      ?auto_24325 - DIRECTION
      ?auto_24324 - MODE
    )
    :vars
    (
      ?auto_24328 - INSTRUMENT
      ?auto_24329 - SATELLITE
      ?auto_24327 - DIRECTION
      ?auto_24326 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24323 ?auto_24320 ) ) ( not ( = ?auto_24325 ?auto_24320 ) ) ( not ( = ?auto_24325 ?auto_24323 ) ) ( ON_BOARD ?auto_24328 ?auto_24329 ) ( SUPPORTS ?auto_24328 ?auto_24321 ) ( not ( = ?auto_24320 ?auto_24327 ) ) ( HAVE_IMAGE ?auto_24325 ?auto_24324 ) ( not ( = ?auto_24325 ?auto_24327 ) ) ( not ( = ?auto_24324 ?auto_24321 ) ) ( CALIBRATION_TARGET ?auto_24328 ?auto_24327 ) ( not ( = ?auto_24327 ?auto_24323 ) ) ( ON_BOARD ?auto_24326 ?auto_24329 ) ( not ( = ?auto_24328 ?auto_24326 ) ) ( SUPPORTS ?auto_24326 ?auto_24322 ) ( not ( = ?auto_24324 ?auto_24322 ) ) ( not ( = ?auto_24321 ?auto_24322 ) ) ( POINTING ?auto_24329 ?auto_24327 ) ( CALIBRATION_TARGET ?auto_24326 ?auto_24327 ) ( POWER_AVAIL ?auto_24329 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24325 ?auto_24324 ?auto_24320 ?auto_24321 )
      ( GET-3IMAGE-VERIFY ?auto_24320 ?auto_24321 ?auto_24323 ?auto_24322 ?auto_24325 ?auto_24324 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_24392 - DIRECTION
      ?auto_24393 - MODE
    )
    :vars
    (
      ?auto_24399 - DIRECTION
      ?auto_24397 - INSTRUMENT
      ?auto_24400 - SATELLITE
      ?auto_24396 - DIRECTION
      ?auto_24398 - MODE
      ?auto_24401 - DIRECTION
      ?auto_24395 - INSTRUMENT
      ?auto_24394 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_24392 ?auto_24399 ) ) ( ON_BOARD ?auto_24397 ?auto_24400 ) ( SUPPORTS ?auto_24397 ?auto_24393 ) ( not ( = ?auto_24392 ?auto_24396 ) ) ( HAVE_IMAGE ?auto_24399 ?auto_24398 ) ( not ( = ?auto_24399 ?auto_24396 ) ) ( not ( = ?auto_24398 ?auto_24393 ) ) ( CALIBRATION_TARGET ?auto_24397 ?auto_24396 ) ( not ( = ?auto_24396 ?auto_24401 ) ) ( not ( = ?auto_24392 ?auto_24401 ) ) ( not ( = ?auto_24399 ?auto_24401 ) ) ( ON_BOARD ?auto_24395 ?auto_24400 ) ( not ( = ?auto_24397 ?auto_24395 ) ) ( SUPPORTS ?auto_24395 ?auto_24394 ) ( not ( = ?auto_24398 ?auto_24394 ) ) ( not ( = ?auto_24393 ?auto_24394 ) ) ( CALIBRATION_TARGET ?auto_24395 ?auto_24396 ) ( POWER_AVAIL ?auto_24400 ) ( POINTING ?auto_24400 ?auto_24399 ) )
    :subtasks
    ( ( !TURN_TO ?auto_24400 ?auto_24396 ?auto_24399 )
      ( GET-2IMAGE ?auto_24399 ?auto_24398 ?auto_24392 ?auto_24393 )
      ( GET-1IMAGE-VERIFY ?auto_24392 ?auto_24393 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24402 - DIRECTION
      ?auto_24403 - MODE
      ?auto_24405 - DIRECTION
      ?auto_24404 - MODE
    )
    :vars
    (
      ?auto_24411 - INSTRUMENT
      ?auto_24410 - SATELLITE
      ?auto_24409 - DIRECTION
      ?auto_24406 - DIRECTION
      ?auto_24407 - INSTRUMENT
      ?auto_24408 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_24405 ?auto_24402 ) ) ( ON_BOARD ?auto_24411 ?auto_24410 ) ( SUPPORTS ?auto_24411 ?auto_24404 ) ( not ( = ?auto_24405 ?auto_24409 ) ) ( HAVE_IMAGE ?auto_24402 ?auto_24403 ) ( not ( = ?auto_24402 ?auto_24409 ) ) ( not ( = ?auto_24403 ?auto_24404 ) ) ( CALIBRATION_TARGET ?auto_24411 ?auto_24409 ) ( not ( = ?auto_24409 ?auto_24406 ) ) ( not ( = ?auto_24405 ?auto_24406 ) ) ( not ( = ?auto_24402 ?auto_24406 ) ) ( ON_BOARD ?auto_24407 ?auto_24410 ) ( not ( = ?auto_24411 ?auto_24407 ) ) ( SUPPORTS ?auto_24407 ?auto_24408 ) ( not ( = ?auto_24403 ?auto_24408 ) ) ( not ( = ?auto_24404 ?auto_24408 ) ) ( CALIBRATION_TARGET ?auto_24407 ?auto_24409 ) ( POWER_AVAIL ?auto_24410 ) ( POINTING ?auto_24410 ?auto_24402 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_24405 ?auto_24404 )
      ( GET-2IMAGE-VERIFY ?auto_24402 ?auto_24403 ?auto_24405 ?auto_24404 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24412 - DIRECTION
      ?auto_24413 - MODE
      ?auto_24415 - DIRECTION
      ?auto_24414 - MODE
    )
    :vars
    (
      ?auto_24419 - DIRECTION
      ?auto_24416 - INSTRUMENT
      ?auto_24421 - SATELLITE
      ?auto_24417 - DIRECTION
      ?auto_24418 - MODE
      ?auto_24420 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24415 ?auto_24412 ) ) ( not ( = ?auto_24415 ?auto_24419 ) ) ( ON_BOARD ?auto_24416 ?auto_24421 ) ( SUPPORTS ?auto_24416 ?auto_24414 ) ( not ( = ?auto_24415 ?auto_24417 ) ) ( HAVE_IMAGE ?auto_24419 ?auto_24418 ) ( not ( = ?auto_24419 ?auto_24417 ) ) ( not ( = ?auto_24418 ?auto_24414 ) ) ( CALIBRATION_TARGET ?auto_24416 ?auto_24417 ) ( not ( = ?auto_24417 ?auto_24412 ) ) ( not ( = ?auto_24419 ?auto_24412 ) ) ( ON_BOARD ?auto_24420 ?auto_24421 ) ( not ( = ?auto_24416 ?auto_24420 ) ) ( SUPPORTS ?auto_24420 ?auto_24413 ) ( not ( = ?auto_24418 ?auto_24413 ) ) ( not ( = ?auto_24414 ?auto_24413 ) ) ( CALIBRATION_TARGET ?auto_24420 ?auto_24417 ) ( POWER_AVAIL ?auto_24421 ) ( POINTING ?auto_24421 ?auto_24419 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24419 ?auto_24418 ?auto_24415 ?auto_24414 )
      ( GET-2IMAGE-VERIFY ?auto_24412 ?auto_24413 ?auto_24415 ?auto_24414 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24422 - DIRECTION
      ?auto_24423 - MODE
      ?auto_24425 - DIRECTION
      ?auto_24424 - MODE
    )
    :vars
    (
      ?auto_24427 - INSTRUMENT
      ?auto_24430 - SATELLITE
      ?auto_24428 - DIRECTION
      ?auto_24431 - DIRECTION
      ?auto_24429 - INSTRUMENT
      ?auto_24426 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_24425 ?auto_24422 ) ) ( ON_BOARD ?auto_24427 ?auto_24430 ) ( SUPPORTS ?auto_24427 ?auto_24423 ) ( not ( = ?auto_24422 ?auto_24428 ) ) ( HAVE_IMAGE ?auto_24425 ?auto_24424 ) ( not ( = ?auto_24425 ?auto_24428 ) ) ( not ( = ?auto_24424 ?auto_24423 ) ) ( CALIBRATION_TARGET ?auto_24427 ?auto_24428 ) ( not ( = ?auto_24428 ?auto_24431 ) ) ( not ( = ?auto_24422 ?auto_24431 ) ) ( not ( = ?auto_24425 ?auto_24431 ) ) ( ON_BOARD ?auto_24429 ?auto_24430 ) ( not ( = ?auto_24427 ?auto_24429 ) ) ( SUPPORTS ?auto_24429 ?auto_24426 ) ( not ( = ?auto_24424 ?auto_24426 ) ) ( not ( = ?auto_24423 ?auto_24426 ) ) ( CALIBRATION_TARGET ?auto_24429 ?auto_24428 ) ( POWER_AVAIL ?auto_24430 ) ( POINTING ?auto_24430 ?auto_24425 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24425 ?auto_24424 ?auto_24422 ?auto_24423 )
      ( GET-2IMAGE-VERIFY ?auto_24422 ?auto_24423 ?auto_24425 ?auto_24424 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24432 - DIRECTION
      ?auto_24433 - MODE
      ?auto_24435 - DIRECTION
      ?auto_24434 - MODE
    )
    :vars
    (
      ?auto_24439 - DIRECTION
      ?auto_24436 - INSTRUMENT
      ?auto_24441 - SATELLITE
      ?auto_24437 - DIRECTION
      ?auto_24438 - MODE
      ?auto_24440 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24435 ?auto_24432 ) ) ( not ( = ?auto_24432 ?auto_24439 ) ) ( ON_BOARD ?auto_24436 ?auto_24441 ) ( SUPPORTS ?auto_24436 ?auto_24433 ) ( not ( = ?auto_24432 ?auto_24437 ) ) ( HAVE_IMAGE ?auto_24439 ?auto_24438 ) ( not ( = ?auto_24439 ?auto_24437 ) ) ( not ( = ?auto_24438 ?auto_24433 ) ) ( CALIBRATION_TARGET ?auto_24436 ?auto_24437 ) ( not ( = ?auto_24437 ?auto_24435 ) ) ( not ( = ?auto_24439 ?auto_24435 ) ) ( ON_BOARD ?auto_24440 ?auto_24441 ) ( not ( = ?auto_24436 ?auto_24440 ) ) ( SUPPORTS ?auto_24440 ?auto_24434 ) ( not ( = ?auto_24438 ?auto_24434 ) ) ( not ( = ?auto_24433 ?auto_24434 ) ) ( CALIBRATION_TARGET ?auto_24440 ?auto_24437 ) ( POWER_AVAIL ?auto_24441 ) ( POINTING ?auto_24441 ?auto_24439 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24439 ?auto_24438 ?auto_24432 ?auto_24433 )
      ( GET-2IMAGE-VERIFY ?auto_24432 ?auto_24433 ?auto_24435 ?auto_24434 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24466 - DIRECTION
      ?auto_24467 - MODE
      ?auto_24469 - DIRECTION
      ?auto_24468 - MODE
      ?auto_24471 - DIRECTION
      ?auto_24470 - MODE
    )
    :vars
    (
      ?auto_24472 - INSTRUMENT
      ?auto_24475 - SATELLITE
      ?auto_24473 - DIRECTION
      ?auto_24474 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24469 ?auto_24466 ) ) ( not ( = ?auto_24471 ?auto_24466 ) ) ( not ( = ?auto_24471 ?auto_24469 ) ) ( ON_BOARD ?auto_24472 ?auto_24475 ) ( SUPPORTS ?auto_24472 ?auto_24470 ) ( not ( = ?auto_24471 ?auto_24473 ) ) ( HAVE_IMAGE ?auto_24466 ?auto_24467 ) ( not ( = ?auto_24466 ?auto_24473 ) ) ( not ( = ?auto_24467 ?auto_24470 ) ) ( CALIBRATION_TARGET ?auto_24472 ?auto_24473 ) ( not ( = ?auto_24473 ?auto_24469 ) ) ( ON_BOARD ?auto_24474 ?auto_24475 ) ( not ( = ?auto_24472 ?auto_24474 ) ) ( SUPPORTS ?auto_24474 ?auto_24468 ) ( not ( = ?auto_24467 ?auto_24468 ) ) ( not ( = ?auto_24470 ?auto_24468 ) ) ( CALIBRATION_TARGET ?auto_24474 ?auto_24473 ) ( POWER_AVAIL ?auto_24475 ) ( POINTING ?auto_24475 ?auto_24466 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24466 ?auto_24467 ?auto_24471 ?auto_24470 )
      ( GET-3IMAGE-VERIFY ?auto_24466 ?auto_24467 ?auto_24469 ?auto_24468 ?auto_24471 ?auto_24470 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24488 - DIRECTION
      ?auto_24489 - MODE
      ?auto_24491 - DIRECTION
      ?auto_24490 - MODE
      ?auto_24493 - DIRECTION
      ?auto_24492 - MODE
    )
    :vars
    (
      ?auto_24494 - INSTRUMENT
      ?auto_24497 - SATELLITE
      ?auto_24495 - DIRECTION
      ?auto_24496 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24491 ?auto_24488 ) ) ( not ( = ?auto_24493 ?auto_24488 ) ) ( not ( = ?auto_24493 ?auto_24491 ) ) ( ON_BOARD ?auto_24494 ?auto_24497 ) ( SUPPORTS ?auto_24494 ?auto_24490 ) ( not ( = ?auto_24491 ?auto_24495 ) ) ( HAVE_IMAGE ?auto_24488 ?auto_24489 ) ( not ( = ?auto_24488 ?auto_24495 ) ) ( not ( = ?auto_24489 ?auto_24490 ) ) ( CALIBRATION_TARGET ?auto_24494 ?auto_24495 ) ( not ( = ?auto_24495 ?auto_24493 ) ) ( ON_BOARD ?auto_24496 ?auto_24497 ) ( not ( = ?auto_24494 ?auto_24496 ) ) ( SUPPORTS ?auto_24496 ?auto_24492 ) ( not ( = ?auto_24489 ?auto_24492 ) ) ( not ( = ?auto_24490 ?auto_24492 ) ) ( CALIBRATION_TARGET ?auto_24496 ?auto_24495 ) ( POWER_AVAIL ?auto_24497 ) ( POINTING ?auto_24497 ?auto_24488 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24488 ?auto_24489 ?auto_24491 ?auto_24490 )
      ( GET-3IMAGE-VERIFY ?auto_24488 ?auto_24489 ?auto_24491 ?auto_24490 ?auto_24493 ?auto_24492 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24510 - DIRECTION
      ?auto_24511 - MODE
      ?auto_24513 - DIRECTION
      ?auto_24512 - MODE
      ?auto_24515 - DIRECTION
      ?auto_24514 - MODE
    )
    :vars
    (
      ?auto_24516 - INSTRUMENT
      ?auto_24519 - SATELLITE
      ?auto_24517 - DIRECTION
      ?auto_24518 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24513 ?auto_24510 ) ) ( not ( = ?auto_24515 ?auto_24510 ) ) ( not ( = ?auto_24515 ?auto_24513 ) ) ( ON_BOARD ?auto_24516 ?auto_24519 ) ( SUPPORTS ?auto_24516 ?auto_24514 ) ( not ( = ?auto_24515 ?auto_24517 ) ) ( HAVE_IMAGE ?auto_24513 ?auto_24512 ) ( not ( = ?auto_24513 ?auto_24517 ) ) ( not ( = ?auto_24512 ?auto_24514 ) ) ( CALIBRATION_TARGET ?auto_24516 ?auto_24517 ) ( not ( = ?auto_24517 ?auto_24510 ) ) ( ON_BOARD ?auto_24518 ?auto_24519 ) ( not ( = ?auto_24516 ?auto_24518 ) ) ( SUPPORTS ?auto_24518 ?auto_24511 ) ( not ( = ?auto_24512 ?auto_24511 ) ) ( not ( = ?auto_24514 ?auto_24511 ) ) ( CALIBRATION_TARGET ?auto_24518 ?auto_24517 ) ( POWER_AVAIL ?auto_24519 ) ( POINTING ?auto_24519 ?auto_24513 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24513 ?auto_24512 ?auto_24515 ?auto_24514 )
      ( GET-3IMAGE-VERIFY ?auto_24510 ?auto_24511 ?auto_24513 ?auto_24512 ?auto_24515 ?auto_24514 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24532 - DIRECTION
      ?auto_24533 - MODE
      ?auto_24535 - DIRECTION
      ?auto_24534 - MODE
      ?auto_24537 - DIRECTION
      ?auto_24536 - MODE
    )
    :vars
    (
      ?auto_24538 - INSTRUMENT
      ?auto_24541 - SATELLITE
      ?auto_24539 - DIRECTION
      ?auto_24540 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24535 ?auto_24532 ) ) ( not ( = ?auto_24537 ?auto_24532 ) ) ( not ( = ?auto_24537 ?auto_24535 ) ) ( ON_BOARD ?auto_24538 ?auto_24541 ) ( SUPPORTS ?auto_24538 ?auto_24534 ) ( not ( = ?auto_24535 ?auto_24539 ) ) ( HAVE_IMAGE ?auto_24537 ?auto_24536 ) ( not ( = ?auto_24537 ?auto_24539 ) ) ( not ( = ?auto_24536 ?auto_24534 ) ) ( CALIBRATION_TARGET ?auto_24538 ?auto_24539 ) ( not ( = ?auto_24539 ?auto_24532 ) ) ( ON_BOARD ?auto_24540 ?auto_24541 ) ( not ( = ?auto_24538 ?auto_24540 ) ) ( SUPPORTS ?auto_24540 ?auto_24533 ) ( not ( = ?auto_24536 ?auto_24533 ) ) ( not ( = ?auto_24534 ?auto_24533 ) ) ( CALIBRATION_TARGET ?auto_24540 ?auto_24539 ) ( POWER_AVAIL ?auto_24541 ) ( POINTING ?auto_24541 ?auto_24537 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24537 ?auto_24536 ?auto_24535 ?auto_24534 )
      ( GET-3IMAGE-VERIFY ?auto_24532 ?auto_24533 ?auto_24535 ?auto_24534 ?auto_24537 ?auto_24536 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24578 - DIRECTION
      ?auto_24579 - MODE
      ?auto_24581 - DIRECTION
      ?auto_24580 - MODE
      ?auto_24583 - DIRECTION
      ?auto_24582 - MODE
    )
    :vars
    (
      ?auto_24584 - INSTRUMENT
      ?auto_24587 - SATELLITE
      ?auto_24585 - DIRECTION
      ?auto_24586 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24581 ?auto_24578 ) ) ( not ( = ?auto_24583 ?auto_24578 ) ) ( not ( = ?auto_24583 ?auto_24581 ) ) ( ON_BOARD ?auto_24584 ?auto_24587 ) ( SUPPORTS ?auto_24584 ?auto_24579 ) ( not ( = ?auto_24578 ?auto_24585 ) ) ( HAVE_IMAGE ?auto_24581 ?auto_24580 ) ( not ( = ?auto_24581 ?auto_24585 ) ) ( not ( = ?auto_24580 ?auto_24579 ) ) ( CALIBRATION_TARGET ?auto_24584 ?auto_24585 ) ( not ( = ?auto_24585 ?auto_24583 ) ) ( ON_BOARD ?auto_24586 ?auto_24587 ) ( not ( = ?auto_24584 ?auto_24586 ) ) ( SUPPORTS ?auto_24586 ?auto_24582 ) ( not ( = ?auto_24580 ?auto_24582 ) ) ( not ( = ?auto_24579 ?auto_24582 ) ) ( CALIBRATION_TARGET ?auto_24586 ?auto_24585 ) ( POWER_AVAIL ?auto_24587 ) ( POINTING ?auto_24587 ?auto_24581 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24581 ?auto_24580 ?auto_24578 ?auto_24579 )
      ( GET-3IMAGE-VERIFY ?auto_24578 ?auto_24579 ?auto_24581 ?auto_24580 ?auto_24583 ?auto_24582 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24600 - DIRECTION
      ?auto_24601 - MODE
      ?auto_24603 - DIRECTION
      ?auto_24602 - MODE
      ?auto_24605 - DIRECTION
      ?auto_24604 - MODE
    )
    :vars
    (
      ?auto_24606 - INSTRUMENT
      ?auto_24609 - SATELLITE
      ?auto_24607 - DIRECTION
      ?auto_24608 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24603 ?auto_24600 ) ) ( not ( = ?auto_24605 ?auto_24600 ) ) ( not ( = ?auto_24605 ?auto_24603 ) ) ( ON_BOARD ?auto_24606 ?auto_24609 ) ( SUPPORTS ?auto_24606 ?auto_24601 ) ( not ( = ?auto_24600 ?auto_24607 ) ) ( HAVE_IMAGE ?auto_24605 ?auto_24604 ) ( not ( = ?auto_24605 ?auto_24607 ) ) ( not ( = ?auto_24604 ?auto_24601 ) ) ( CALIBRATION_TARGET ?auto_24606 ?auto_24607 ) ( not ( = ?auto_24607 ?auto_24603 ) ) ( ON_BOARD ?auto_24608 ?auto_24609 ) ( not ( = ?auto_24606 ?auto_24608 ) ) ( SUPPORTS ?auto_24608 ?auto_24602 ) ( not ( = ?auto_24604 ?auto_24602 ) ) ( not ( = ?auto_24601 ?auto_24602 ) ) ( CALIBRATION_TARGET ?auto_24608 ?auto_24607 ) ( POWER_AVAIL ?auto_24609 ) ( POINTING ?auto_24609 ?auto_24605 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24605 ?auto_24604 ?auto_24600 ?auto_24601 )
      ( GET-3IMAGE-VERIFY ?auto_24600 ?auto_24601 ?auto_24603 ?auto_24602 ?auto_24605 ?auto_24604 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_24672 - DIRECTION
      ?auto_24673 - MODE
    )
    :vars
    (
      ?auto_24678 - DIRECTION
      ?auto_24675 - INSTRUMENT
      ?auto_24680 - SATELLITE
      ?auto_24676 - DIRECTION
      ?auto_24677 - MODE
      ?auto_24681 - DIRECTION
      ?auto_24679 - INSTRUMENT
      ?auto_24674 - MODE
      ?auto_24682 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24672 ?auto_24678 ) ) ( ON_BOARD ?auto_24675 ?auto_24680 ) ( SUPPORTS ?auto_24675 ?auto_24673 ) ( not ( = ?auto_24672 ?auto_24676 ) ) ( HAVE_IMAGE ?auto_24678 ?auto_24677 ) ( not ( = ?auto_24678 ?auto_24676 ) ) ( not ( = ?auto_24677 ?auto_24673 ) ) ( CALIBRATION_TARGET ?auto_24675 ?auto_24676 ) ( not ( = ?auto_24676 ?auto_24681 ) ) ( not ( = ?auto_24672 ?auto_24681 ) ) ( not ( = ?auto_24678 ?auto_24681 ) ) ( ON_BOARD ?auto_24679 ?auto_24680 ) ( not ( = ?auto_24675 ?auto_24679 ) ) ( SUPPORTS ?auto_24679 ?auto_24674 ) ( not ( = ?auto_24677 ?auto_24674 ) ) ( not ( = ?auto_24673 ?auto_24674 ) ) ( CALIBRATION_TARGET ?auto_24679 ?auto_24676 ) ( POINTING ?auto_24680 ?auto_24678 ) ( ON_BOARD ?auto_24682 ?auto_24680 ) ( POWER_ON ?auto_24682 ) ( not ( = ?auto_24675 ?auto_24682 ) ) ( not ( = ?auto_24679 ?auto_24682 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_24682 ?auto_24680 )
      ( GET-2IMAGE ?auto_24678 ?auto_24677 ?auto_24672 ?auto_24673 )
      ( GET-1IMAGE-VERIFY ?auto_24672 ?auto_24673 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24683 - DIRECTION
      ?auto_24684 - MODE
      ?auto_24686 - DIRECTION
      ?auto_24685 - MODE
    )
    :vars
    (
      ?auto_24692 - INSTRUMENT
      ?auto_24693 - SATELLITE
      ?auto_24687 - DIRECTION
      ?auto_24691 - DIRECTION
      ?auto_24689 - INSTRUMENT
      ?auto_24688 - MODE
      ?auto_24690 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24686 ?auto_24683 ) ) ( ON_BOARD ?auto_24692 ?auto_24693 ) ( SUPPORTS ?auto_24692 ?auto_24685 ) ( not ( = ?auto_24686 ?auto_24687 ) ) ( HAVE_IMAGE ?auto_24683 ?auto_24684 ) ( not ( = ?auto_24683 ?auto_24687 ) ) ( not ( = ?auto_24684 ?auto_24685 ) ) ( CALIBRATION_TARGET ?auto_24692 ?auto_24687 ) ( not ( = ?auto_24687 ?auto_24691 ) ) ( not ( = ?auto_24686 ?auto_24691 ) ) ( not ( = ?auto_24683 ?auto_24691 ) ) ( ON_BOARD ?auto_24689 ?auto_24693 ) ( not ( = ?auto_24692 ?auto_24689 ) ) ( SUPPORTS ?auto_24689 ?auto_24688 ) ( not ( = ?auto_24684 ?auto_24688 ) ) ( not ( = ?auto_24685 ?auto_24688 ) ) ( CALIBRATION_TARGET ?auto_24689 ?auto_24687 ) ( POINTING ?auto_24693 ?auto_24683 ) ( ON_BOARD ?auto_24690 ?auto_24693 ) ( POWER_ON ?auto_24690 ) ( not ( = ?auto_24692 ?auto_24690 ) ) ( not ( = ?auto_24689 ?auto_24690 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_24686 ?auto_24685 )
      ( GET-2IMAGE-VERIFY ?auto_24683 ?auto_24684 ?auto_24686 ?auto_24685 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24694 - DIRECTION
      ?auto_24695 - MODE
      ?auto_24697 - DIRECTION
      ?auto_24696 - MODE
    )
    :vars
    (
      ?auto_24703 - DIRECTION
      ?auto_24699 - INSTRUMENT
      ?auto_24700 - SATELLITE
      ?auto_24701 - DIRECTION
      ?auto_24702 - MODE
      ?auto_24698 - INSTRUMENT
      ?auto_24704 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24697 ?auto_24694 ) ) ( not ( = ?auto_24697 ?auto_24703 ) ) ( ON_BOARD ?auto_24699 ?auto_24700 ) ( SUPPORTS ?auto_24699 ?auto_24696 ) ( not ( = ?auto_24697 ?auto_24701 ) ) ( HAVE_IMAGE ?auto_24703 ?auto_24702 ) ( not ( = ?auto_24703 ?auto_24701 ) ) ( not ( = ?auto_24702 ?auto_24696 ) ) ( CALIBRATION_TARGET ?auto_24699 ?auto_24701 ) ( not ( = ?auto_24701 ?auto_24694 ) ) ( not ( = ?auto_24703 ?auto_24694 ) ) ( ON_BOARD ?auto_24698 ?auto_24700 ) ( not ( = ?auto_24699 ?auto_24698 ) ) ( SUPPORTS ?auto_24698 ?auto_24695 ) ( not ( = ?auto_24702 ?auto_24695 ) ) ( not ( = ?auto_24696 ?auto_24695 ) ) ( CALIBRATION_TARGET ?auto_24698 ?auto_24701 ) ( POINTING ?auto_24700 ?auto_24703 ) ( ON_BOARD ?auto_24704 ?auto_24700 ) ( POWER_ON ?auto_24704 ) ( not ( = ?auto_24699 ?auto_24704 ) ) ( not ( = ?auto_24698 ?auto_24704 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24703 ?auto_24702 ?auto_24697 ?auto_24696 )
      ( GET-2IMAGE-VERIFY ?auto_24694 ?auto_24695 ?auto_24697 ?auto_24696 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24705 - DIRECTION
      ?auto_24706 - MODE
      ?auto_24708 - DIRECTION
      ?auto_24707 - MODE
    )
    :vars
    (
      ?auto_24710 - INSTRUMENT
      ?auto_24711 - SATELLITE
      ?auto_24713 - DIRECTION
      ?auto_24714 - DIRECTION
      ?auto_24709 - INSTRUMENT
      ?auto_24712 - MODE
      ?auto_24715 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24708 ?auto_24705 ) ) ( ON_BOARD ?auto_24710 ?auto_24711 ) ( SUPPORTS ?auto_24710 ?auto_24706 ) ( not ( = ?auto_24705 ?auto_24713 ) ) ( HAVE_IMAGE ?auto_24708 ?auto_24707 ) ( not ( = ?auto_24708 ?auto_24713 ) ) ( not ( = ?auto_24707 ?auto_24706 ) ) ( CALIBRATION_TARGET ?auto_24710 ?auto_24713 ) ( not ( = ?auto_24713 ?auto_24714 ) ) ( not ( = ?auto_24705 ?auto_24714 ) ) ( not ( = ?auto_24708 ?auto_24714 ) ) ( ON_BOARD ?auto_24709 ?auto_24711 ) ( not ( = ?auto_24710 ?auto_24709 ) ) ( SUPPORTS ?auto_24709 ?auto_24712 ) ( not ( = ?auto_24707 ?auto_24712 ) ) ( not ( = ?auto_24706 ?auto_24712 ) ) ( CALIBRATION_TARGET ?auto_24709 ?auto_24713 ) ( POINTING ?auto_24711 ?auto_24708 ) ( ON_BOARD ?auto_24715 ?auto_24711 ) ( POWER_ON ?auto_24715 ) ( not ( = ?auto_24710 ?auto_24715 ) ) ( not ( = ?auto_24709 ?auto_24715 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24708 ?auto_24707 ?auto_24705 ?auto_24706 )
      ( GET-2IMAGE-VERIFY ?auto_24705 ?auto_24706 ?auto_24708 ?auto_24707 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24716 - DIRECTION
      ?auto_24717 - MODE
      ?auto_24719 - DIRECTION
      ?auto_24718 - MODE
    )
    :vars
    (
      ?auto_24725 - DIRECTION
      ?auto_24721 - INSTRUMENT
      ?auto_24722 - SATELLITE
      ?auto_24723 - DIRECTION
      ?auto_24724 - MODE
      ?auto_24720 - INSTRUMENT
      ?auto_24726 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24719 ?auto_24716 ) ) ( not ( = ?auto_24716 ?auto_24725 ) ) ( ON_BOARD ?auto_24721 ?auto_24722 ) ( SUPPORTS ?auto_24721 ?auto_24717 ) ( not ( = ?auto_24716 ?auto_24723 ) ) ( HAVE_IMAGE ?auto_24725 ?auto_24724 ) ( not ( = ?auto_24725 ?auto_24723 ) ) ( not ( = ?auto_24724 ?auto_24717 ) ) ( CALIBRATION_TARGET ?auto_24721 ?auto_24723 ) ( not ( = ?auto_24723 ?auto_24719 ) ) ( not ( = ?auto_24725 ?auto_24719 ) ) ( ON_BOARD ?auto_24720 ?auto_24722 ) ( not ( = ?auto_24721 ?auto_24720 ) ) ( SUPPORTS ?auto_24720 ?auto_24718 ) ( not ( = ?auto_24724 ?auto_24718 ) ) ( not ( = ?auto_24717 ?auto_24718 ) ) ( CALIBRATION_TARGET ?auto_24720 ?auto_24723 ) ( POINTING ?auto_24722 ?auto_24725 ) ( ON_BOARD ?auto_24726 ?auto_24722 ) ( POWER_ON ?auto_24726 ) ( not ( = ?auto_24721 ?auto_24726 ) ) ( not ( = ?auto_24720 ?auto_24726 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24725 ?auto_24724 ?auto_24716 ?auto_24717 )
      ( GET-2IMAGE-VERIFY ?auto_24716 ?auto_24717 ?auto_24719 ?auto_24718 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24753 - DIRECTION
      ?auto_24754 - MODE
      ?auto_24756 - DIRECTION
      ?auto_24755 - MODE
      ?auto_24758 - DIRECTION
      ?auto_24757 - MODE
    )
    :vars
    (
      ?auto_24760 - INSTRUMENT
      ?auto_24761 - SATELLITE
      ?auto_24762 - DIRECTION
      ?auto_24759 - INSTRUMENT
      ?auto_24763 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24756 ?auto_24753 ) ) ( not ( = ?auto_24758 ?auto_24753 ) ) ( not ( = ?auto_24758 ?auto_24756 ) ) ( ON_BOARD ?auto_24760 ?auto_24761 ) ( SUPPORTS ?auto_24760 ?auto_24757 ) ( not ( = ?auto_24758 ?auto_24762 ) ) ( HAVE_IMAGE ?auto_24753 ?auto_24754 ) ( not ( = ?auto_24753 ?auto_24762 ) ) ( not ( = ?auto_24754 ?auto_24757 ) ) ( CALIBRATION_TARGET ?auto_24760 ?auto_24762 ) ( not ( = ?auto_24762 ?auto_24756 ) ) ( ON_BOARD ?auto_24759 ?auto_24761 ) ( not ( = ?auto_24760 ?auto_24759 ) ) ( SUPPORTS ?auto_24759 ?auto_24755 ) ( not ( = ?auto_24754 ?auto_24755 ) ) ( not ( = ?auto_24757 ?auto_24755 ) ) ( CALIBRATION_TARGET ?auto_24759 ?auto_24762 ) ( POINTING ?auto_24761 ?auto_24753 ) ( ON_BOARD ?auto_24763 ?auto_24761 ) ( POWER_ON ?auto_24763 ) ( not ( = ?auto_24760 ?auto_24763 ) ) ( not ( = ?auto_24759 ?auto_24763 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24753 ?auto_24754 ?auto_24758 ?auto_24757 )
      ( GET-3IMAGE-VERIFY ?auto_24753 ?auto_24754 ?auto_24756 ?auto_24755 ?auto_24758 ?auto_24757 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24777 - DIRECTION
      ?auto_24778 - MODE
      ?auto_24780 - DIRECTION
      ?auto_24779 - MODE
      ?auto_24782 - DIRECTION
      ?auto_24781 - MODE
    )
    :vars
    (
      ?auto_24784 - INSTRUMENT
      ?auto_24785 - SATELLITE
      ?auto_24786 - DIRECTION
      ?auto_24783 - INSTRUMENT
      ?auto_24787 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24780 ?auto_24777 ) ) ( not ( = ?auto_24782 ?auto_24777 ) ) ( not ( = ?auto_24782 ?auto_24780 ) ) ( ON_BOARD ?auto_24784 ?auto_24785 ) ( SUPPORTS ?auto_24784 ?auto_24779 ) ( not ( = ?auto_24780 ?auto_24786 ) ) ( HAVE_IMAGE ?auto_24777 ?auto_24778 ) ( not ( = ?auto_24777 ?auto_24786 ) ) ( not ( = ?auto_24778 ?auto_24779 ) ) ( CALIBRATION_TARGET ?auto_24784 ?auto_24786 ) ( not ( = ?auto_24786 ?auto_24782 ) ) ( ON_BOARD ?auto_24783 ?auto_24785 ) ( not ( = ?auto_24784 ?auto_24783 ) ) ( SUPPORTS ?auto_24783 ?auto_24781 ) ( not ( = ?auto_24778 ?auto_24781 ) ) ( not ( = ?auto_24779 ?auto_24781 ) ) ( CALIBRATION_TARGET ?auto_24783 ?auto_24786 ) ( POINTING ?auto_24785 ?auto_24777 ) ( ON_BOARD ?auto_24787 ?auto_24785 ) ( POWER_ON ?auto_24787 ) ( not ( = ?auto_24784 ?auto_24787 ) ) ( not ( = ?auto_24783 ?auto_24787 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24777 ?auto_24778 ?auto_24780 ?auto_24779 )
      ( GET-3IMAGE-VERIFY ?auto_24777 ?auto_24778 ?auto_24780 ?auto_24779 ?auto_24782 ?auto_24781 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24801 - DIRECTION
      ?auto_24802 - MODE
      ?auto_24804 - DIRECTION
      ?auto_24803 - MODE
      ?auto_24806 - DIRECTION
      ?auto_24805 - MODE
    )
    :vars
    (
      ?auto_24808 - INSTRUMENT
      ?auto_24809 - SATELLITE
      ?auto_24810 - DIRECTION
      ?auto_24807 - INSTRUMENT
      ?auto_24811 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24804 ?auto_24801 ) ) ( not ( = ?auto_24806 ?auto_24801 ) ) ( not ( = ?auto_24806 ?auto_24804 ) ) ( ON_BOARD ?auto_24808 ?auto_24809 ) ( SUPPORTS ?auto_24808 ?auto_24805 ) ( not ( = ?auto_24806 ?auto_24810 ) ) ( HAVE_IMAGE ?auto_24804 ?auto_24803 ) ( not ( = ?auto_24804 ?auto_24810 ) ) ( not ( = ?auto_24803 ?auto_24805 ) ) ( CALIBRATION_TARGET ?auto_24808 ?auto_24810 ) ( not ( = ?auto_24810 ?auto_24801 ) ) ( ON_BOARD ?auto_24807 ?auto_24809 ) ( not ( = ?auto_24808 ?auto_24807 ) ) ( SUPPORTS ?auto_24807 ?auto_24802 ) ( not ( = ?auto_24803 ?auto_24802 ) ) ( not ( = ?auto_24805 ?auto_24802 ) ) ( CALIBRATION_TARGET ?auto_24807 ?auto_24810 ) ( POINTING ?auto_24809 ?auto_24804 ) ( ON_BOARD ?auto_24811 ?auto_24809 ) ( POWER_ON ?auto_24811 ) ( not ( = ?auto_24808 ?auto_24811 ) ) ( not ( = ?auto_24807 ?auto_24811 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24804 ?auto_24803 ?auto_24806 ?auto_24805 )
      ( GET-3IMAGE-VERIFY ?auto_24801 ?auto_24802 ?auto_24804 ?auto_24803 ?auto_24806 ?auto_24805 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24825 - DIRECTION
      ?auto_24826 - MODE
      ?auto_24828 - DIRECTION
      ?auto_24827 - MODE
      ?auto_24830 - DIRECTION
      ?auto_24829 - MODE
    )
    :vars
    (
      ?auto_24832 - INSTRUMENT
      ?auto_24833 - SATELLITE
      ?auto_24834 - DIRECTION
      ?auto_24831 - INSTRUMENT
      ?auto_24835 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24828 ?auto_24825 ) ) ( not ( = ?auto_24830 ?auto_24825 ) ) ( not ( = ?auto_24830 ?auto_24828 ) ) ( ON_BOARD ?auto_24832 ?auto_24833 ) ( SUPPORTS ?auto_24832 ?auto_24827 ) ( not ( = ?auto_24828 ?auto_24834 ) ) ( HAVE_IMAGE ?auto_24830 ?auto_24829 ) ( not ( = ?auto_24830 ?auto_24834 ) ) ( not ( = ?auto_24829 ?auto_24827 ) ) ( CALIBRATION_TARGET ?auto_24832 ?auto_24834 ) ( not ( = ?auto_24834 ?auto_24825 ) ) ( ON_BOARD ?auto_24831 ?auto_24833 ) ( not ( = ?auto_24832 ?auto_24831 ) ) ( SUPPORTS ?auto_24831 ?auto_24826 ) ( not ( = ?auto_24829 ?auto_24826 ) ) ( not ( = ?auto_24827 ?auto_24826 ) ) ( CALIBRATION_TARGET ?auto_24831 ?auto_24834 ) ( POINTING ?auto_24833 ?auto_24830 ) ( ON_BOARD ?auto_24835 ?auto_24833 ) ( POWER_ON ?auto_24835 ) ( not ( = ?auto_24832 ?auto_24835 ) ) ( not ( = ?auto_24831 ?auto_24835 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24830 ?auto_24829 ?auto_24828 ?auto_24827 )
      ( GET-3IMAGE-VERIFY ?auto_24825 ?auto_24826 ?auto_24828 ?auto_24827 ?auto_24830 ?auto_24829 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24875 - DIRECTION
      ?auto_24876 - MODE
      ?auto_24878 - DIRECTION
      ?auto_24877 - MODE
      ?auto_24880 - DIRECTION
      ?auto_24879 - MODE
    )
    :vars
    (
      ?auto_24882 - INSTRUMENT
      ?auto_24883 - SATELLITE
      ?auto_24884 - DIRECTION
      ?auto_24881 - INSTRUMENT
      ?auto_24885 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24878 ?auto_24875 ) ) ( not ( = ?auto_24880 ?auto_24875 ) ) ( not ( = ?auto_24880 ?auto_24878 ) ) ( ON_BOARD ?auto_24882 ?auto_24883 ) ( SUPPORTS ?auto_24882 ?auto_24876 ) ( not ( = ?auto_24875 ?auto_24884 ) ) ( HAVE_IMAGE ?auto_24878 ?auto_24877 ) ( not ( = ?auto_24878 ?auto_24884 ) ) ( not ( = ?auto_24877 ?auto_24876 ) ) ( CALIBRATION_TARGET ?auto_24882 ?auto_24884 ) ( not ( = ?auto_24884 ?auto_24880 ) ) ( ON_BOARD ?auto_24881 ?auto_24883 ) ( not ( = ?auto_24882 ?auto_24881 ) ) ( SUPPORTS ?auto_24881 ?auto_24879 ) ( not ( = ?auto_24877 ?auto_24879 ) ) ( not ( = ?auto_24876 ?auto_24879 ) ) ( CALIBRATION_TARGET ?auto_24881 ?auto_24884 ) ( POINTING ?auto_24883 ?auto_24878 ) ( ON_BOARD ?auto_24885 ?auto_24883 ) ( POWER_ON ?auto_24885 ) ( not ( = ?auto_24882 ?auto_24885 ) ) ( not ( = ?auto_24881 ?auto_24885 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24878 ?auto_24877 ?auto_24875 ?auto_24876 )
      ( GET-3IMAGE-VERIFY ?auto_24875 ?auto_24876 ?auto_24878 ?auto_24877 ?auto_24880 ?auto_24879 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24899 - DIRECTION
      ?auto_24900 - MODE
      ?auto_24902 - DIRECTION
      ?auto_24901 - MODE
      ?auto_24904 - DIRECTION
      ?auto_24903 - MODE
    )
    :vars
    (
      ?auto_24906 - INSTRUMENT
      ?auto_24907 - SATELLITE
      ?auto_24908 - DIRECTION
      ?auto_24905 - INSTRUMENT
      ?auto_24909 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24902 ?auto_24899 ) ) ( not ( = ?auto_24904 ?auto_24899 ) ) ( not ( = ?auto_24904 ?auto_24902 ) ) ( ON_BOARD ?auto_24906 ?auto_24907 ) ( SUPPORTS ?auto_24906 ?auto_24900 ) ( not ( = ?auto_24899 ?auto_24908 ) ) ( HAVE_IMAGE ?auto_24904 ?auto_24903 ) ( not ( = ?auto_24904 ?auto_24908 ) ) ( not ( = ?auto_24903 ?auto_24900 ) ) ( CALIBRATION_TARGET ?auto_24906 ?auto_24908 ) ( not ( = ?auto_24908 ?auto_24902 ) ) ( ON_BOARD ?auto_24905 ?auto_24907 ) ( not ( = ?auto_24906 ?auto_24905 ) ) ( SUPPORTS ?auto_24905 ?auto_24901 ) ( not ( = ?auto_24903 ?auto_24901 ) ) ( not ( = ?auto_24900 ?auto_24901 ) ) ( CALIBRATION_TARGET ?auto_24905 ?auto_24908 ) ( POINTING ?auto_24907 ?auto_24904 ) ( ON_BOARD ?auto_24909 ?auto_24907 ) ( POWER_ON ?auto_24909 ) ( not ( = ?auto_24906 ?auto_24909 ) ) ( not ( = ?auto_24905 ?auto_24909 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24904 ?auto_24903 ?auto_24899 ?auto_24900 )
      ( GET-3IMAGE-VERIFY ?auto_24899 ?auto_24900 ?auto_24902 ?auto_24901 ?auto_24904 ?auto_24903 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_24977 - DIRECTION
      ?auto_24978 - MODE
    )
    :vars
    (
      ?auto_24985 - DIRECTION
      ?auto_24980 - INSTRUMENT
      ?auto_24981 - SATELLITE
      ?auto_24983 - DIRECTION
      ?auto_24984 - MODE
      ?auto_24986 - DIRECTION
      ?auto_24979 - INSTRUMENT
      ?auto_24982 - MODE
      ?auto_24987 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24977 ?auto_24985 ) ) ( ON_BOARD ?auto_24980 ?auto_24981 ) ( SUPPORTS ?auto_24980 ?auto_24978 ) ( not ( = ?auto_24977 ?auto_24983 ) ) ( not ( = ?auto_24985 ?auto_24983 ) ) ( not ( = ?auto_24984 ?auto_24978 ) ) ( CALIBRATION_TARGET ?auto_24980 ?auto_24983 ) ( not ( = ?auto_24983 ?auto_24986 ) ) ( not ( = ?auto_24977 ?auto_24986 ) ) ( not ( = ?auto_24985 ?auto_24986 ) ) ( ON_BOARD ?auto_24979 ?auto_24981 ) ( not ( = ?auto_24980 ?auto_24979 ) ) ( SUPPORTS ?auto_24979 ?auto_24982 ) ( not ( = ?auto_24984 ?auto_24982 ) ) ( not ( = ?auto_24978 ?auto_24982 ) ) ( CALIBRATION_TARGET ?auto_24979 ?auto_24983 ) ( POINTING ?auto_24981 ?auto_24985 ) ( ON_BOARD ?auto_24987 ?auto_24981 ) ( POWER_ON ?auto_24987 ) ( not ( = ?auto_24980 ?auto_24987 ) ) ( not ( = ?auto_24979 ?auto_24987 ) ) ( CALIBRATED ?auto_24987 ) ( SUPPORTS ?auto_24987 ?auto_24984 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_24985 ?auto_24984 )
      ( GET-2IMAGE ?auto_24985 ?auto_24984 ?auto_24977 ?auto_24978 )
      ( GET-1IMAGE-VERIFY ?auto_24977 ?auto_24978 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24988 - DIRECTION
      ?auto_24989 - MODE
      ?auto_24991 - DIRECTION
      ?auto_24990 - MODE
    )
    :vars
    (
      ?auto_24996 - INSTRUMENT
      ?auto_24998 - SATELLITE
      ?auto_24994 - DIRECTION
      ?auto_24995 - DIRECTION
      ?auto_24993 - INSTRUMENT
      ?auto_24992 - MODE
      ?auto_24997 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_24991 ?auto_24988 ) ) ( ON_BOARD ?auto_24996 ?auto_24998 ) ( SUPPORTS ?auto_24996 ?auto_24990 ) ( not ( = ?auto_24991 ?auto_24994 ) ) ( not ( = ?auto_24988 ?auto_24994 ) ) ( not ( = ?auto_24989 ?auto_24990 ) ) ( CALIBRATION_TARGET ?auto_24996 ?auto_24994 ) ( not ( = ?auto_24994 ?auto_24995 ) ) ( not ( = ?auto_24991 ?auto_24995 ) ) ( not ( = ?auto_24988 ?auto_24995 ) ) ( ON_BOARD ?auto_24993 ?auto_24998 ) ( not ( = ?auto_24996 ?auto_24993 ) ) ( SUPPORTS ?auto_24993 ?auto_24992 ) ( not ( = ?auto_24989 ?auto_24992 ) ) ( not ( = ?auto_24990 ?auto_24992 ) ) ( CALIBRATION_TARGET ?auto_24993 ?auto_24994 ) ( POINTING ?auto_24998 ?auto_24988 ) ( ON_BOARD ?auto_24997 ?auto_24998 ) ( POWER_ON ?auto_24997 ) ( not ( = ?auto_24996 ?auto_24997 ) ) ( not ( = ?auto_24993 ?auto_24997 ) ) ( CALIBRATED ?auto_24997 ) ( SUPPORTS ?auto_24997 ?auto_24989 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_24991 ?auto_24990 )
      ( GET-2IMAGE-VERIFY ?auto_24988 ?auto_24989 ?auto_24991 ?auto_24990 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_24999 - DIRECTION
      ?auto_25000 - MODE
      ?auto_25002 - DIRECTION
      ?auto_25001 - MODE
    )
    :vars
    (
      ?auto_25009 - DIRECTION
      ?auto_25003 - INSTRUMENT
      ?auto_25006 - SATELLITE
      ?auto_25007 - DIRECTION
      ?auto_25008 - MODE
      ?auto_25004 - INSTRUMENT
      ?auto_25005 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25002 ?auto_24999 ) ) ( not ( = ?auto_25002 ?auto_25009 ) ) ( ON_BOARD ?auto_25003 ?auto_25006 ) ( SUPPORTS ?auto_25003 ?auto_25001 ) ( not ( = ?auto_25002 ?auto_25007 ) ) ( not ( = ?auto_25009 ?auto_25007 ) ) ( not ( = ?auto_25008 ?auto_25001 ) ) ( CALIBRATION_TARGET ?auto_25003 ?auto_25007 ) ( not ( = ?auto_25007 ?auto_24999 ) ) ( not ( = ?auto_25009 ?auto_24999 ) ) ( ON_BOARD ?auto_25004 ?auto_25006 ) ( not ( = ?auto_25003 ?auto_25004 ) ) ( SUPPORTS ?auto_25004 ?auto_25000 ) ( not ( = ?auto_25008 ?auto_25000 ) ) ( not ( = ?auto_25001 ?auto_25000 ) ) ( CALIBRATION_TARGET ?auto_25004 ?auto_25007 ) ( POINTING ?auto_25006 ?auto_25009 ) ( ON_BOARD ?auto_25005 ?auto_25006 ) ( POWER_ON ?auto_25005 ) ( not ( = ?auto_25003 ?auto_25005 ) ) ( not ( = ?auto_25004 ?auto_25005 ) ) ( CALIBRATED ?auto_25005 ) ( SUPPORTS ?auto_25005 ?auto_25008 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25009 ?auto_25008 ?auto_25002 ?auto_25001 )
      ( GET-2IMAGE-VERIFY ?auto_24999 ?auto_25000 ?auto_25002 ?auto_25001 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25010 - DIRECTION
      ?auto_25011 - MODE
      ?auto_25013 - DIRECTION
      ?auto_25012 - MODE
    )
    :vars
    (
      ?auto_25014 - INSTRUMENT
      ?auto_25018 - SATELLITE
      ?auto_25019 - DIRECTION
      ?auto_25015 - DIRECTION
      ?auto_25016 - INSTRUMENT
      ?auto_25020 - MODE
      ?auto_25017 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25013 ?auto_25010 ) ) ( ON_BOARD ?auto_25014 ?auto_25018 ) ( SUPPORTS ?auto_25014 ?auto_25011 ) ( not ( = ?auto_25010 ?auto_25019 ) ) ( not ( = ?auto_25013 ?auto_25019 ) ) ( not ( = ?auto_25012 ?auto_25011 ) ) ( CALIBRATION_TARGET ?auto_25014 ?auto_25019 ) ( not ( = ?auto_25019 ?auto_25015 ) ) ( not ( = ?auto_25010 ?auto_25015 ) ) ( not ( = ?auto_25013 ?auto_25015 ) ) ( ON_BOARD ?auto_25016 ?auto_25018 ) ( not ( = ?auto_25014 ?auto_25016 ) ) ( SUPPORTS ?auto_25016 ?auto_25020 ) ( not ( = ?auto_25012 ?auto_25020 ) ) ( not ( = ?auto_25011 ?auto_25020 ) ) ( CALIBRATION_TARGET ?auto_25016 ?auto_25019 ) ( POINTING ?auto_25018 ?auto_25013 ) ( ON_BOARD ?auto_25017 ?auto_25018 ) ( POWER_ON ?auto_25017 ) ( not ( = ?auto_25014 ?auto_25017 ) ) ( not ( = ?auto_25016 ?auto_25017 ) ) ( CALIBRATED ?auto_25017 ) ( SUPPORTS ?auto_25017 ?auto_25012 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25013 ?auto_25012 ?auto_25010 ?auto_25011 )
      ( GET-2IMAGE-VERIFY ?auto_25010 ?auto_25011 ?auto_25013 ?auto_25012 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25021 - DIRECTION
      ?auto_25022 - MODE
      ?auto_25024 - DIRECTION
      ?auto_25023 - MODE
    )
    :vars
    (
      ?auto_25031 - DIRECTION
      ?auto_25025 - INSTRUMENT
      ?auto_25028 - SATELLITE
      ?auto_25029 - DIRECTION
      ?auto_25030 - MODE
      ?auto_25026 - INSTRUMENT
      ?auto_25027 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25024 ?auto_25021 ) ) ( not ( = ?auto_25021 ?auto_25031 ) ) ( ON_BOARD ?auto_25025 ?auto_25028 ) ( SUPPORTS ?auto_25025 ?auto_25022 ) ( not ( = ?auto_25021 ?auto_25029 ) ) ( not ( = ?auto_25031 ?auto_25029 ) ) ( not ( = ?auto_25030 ?auto_25022 ) ) ( CALIBRATION_TARGET ?auto_25025 ?auto_25029 ) ( not ( = ?auto_25029 ?auto_25024 ) ) ( not ( = ?auto_25031 ?auto_25024 ) ) ( ON_BOARD ?auto_25026 ?auto_25028 ) ( not ( = ?auto_25025 ?auto_25026 ) ) ( SUPPORTS ?auto_25026 ?auto_25023 ) ( not ( = ?auto_25030 ?auto_25023 ) ) ( not ( = ?auto_25022 ?auto_25023 ) ) ( CALIBRATION_TARGET ?auto_25026 ?auto_25029 ) ( POINTING ?auto_25028 ?auto_25031 ) ( ON_BOARD ?auto_25027 ?auto_25028 ) ( POWER_ON ?auto_25027 ) ( not ( = ?auto_25025 ?auto_25027 ) ) ( not ( = ?auto_25026 ?auto_25027 ) ) ( CALIBRATED ?auto_25027 ) ( SUPPORTS ?auto_25027 ?auto_25030 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25031 ?auto_25030 ?auto_25021 ?auto_25022 )
      ( GET-2IMAGE-VERIFY ?auto_25021 ?auto_25022 ?auto_25024 ?auto_25023 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25058 - DIRECTION
      ?auto_25059 - MODE
      ?auto_25061 - DIRECTION
      ?auto_25060 - MODE
      ?auto_25063 - DIRECTION
      ?auto_25062 - MODE
    )
    :vars
    (
      ?auto_25064 - INSTRUMENT
      ?auto_25067 - SATELLITE
      ?auto_25068 - DIRECTION
      ?auto_25065 - INSTRUMENT
      ?auto_25066 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25061 ?auto_25058 ) ) ( not ( = ?auto_25063 ?auto_25058 ) ) ( not ( = ?auto_25063 ?auto_25061 ) ) ( ON_BOARD ?auto_25064 ?auto_25067 ) ( SUPPORTS ?auto_25064 ?auto_25062 ) ( not ( = ?auto_25063 ?auto_25068 ) ) ( not ( = ?auto_25058 ?auto_25068 ) ) ( not ( = ?auto_25059 ?auto_25062 ) ) ( CALIBRATION_TARGET ?auto_25064 ?auto_25068 ) ( not ( = ?auto_25068 ?auto_25061 ) ) ( ON_BOARD ?auto_25065 ?auto_25067 ) ( not ( = ?auto_25064 ?auto_25065 ) ) ( SUPPORTS ?auto_25065 ?auto_25060 ) ( not ( = ?auto_25059 ?auto_25060 ) ) ( not ( = ?auto_25062 ?auto_25060 ) ) ( CALIBRATION_TARGET ?auto_25065 ?auto_25068 ) ( POINTING ?auto_25067 ?auto_25058 ) ( ON_BOARD ?auto_25066 ?auto_25067 ) ( POWER_ON ?auto_25066 ) ( not ( = ?auto_25064 ?auto_25066 ) ) ( not ( = ?auto_25065 ?auto_25066 ) ) ( CALIBRATED ?auto_25066 ) ( SUPPORTS ?auto_25066 ?auto_25059 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25058 ?auto_25059 ?auto_25063 ?auto_25062 )
      ( GET-3IMAGE-VERIFY ?auto_25058 ?auto_25059 ?auto_25061 ?auto_25060 ?auto_25063 ?auto_25062 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25082 - DIRECTION
      ?auto_25083 - MODE
      ?auto_25085 - DIRECTION
      ?auto_25084 - MODE
      ?auto_25087 - DIRECTION
      ?auto_25086 - MODE
    )
    :vars
    (
      ?auto_25088 - INSTRUMENT
      ?auto_25091 - SATELLITE
      ?auto_25092 - DIRECTION
      ?auto_25089 - INSTRUMENT
      ?auto_25090 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25085 ?auto_25082 ) ) ( not ( = ?auto_25087 ?auto_25082 ) ) ( not ( = ?auto_25087 ?auto_25085 ) ) ( ON_BOARD ?auto_25088 ?auto_25091 ) ( SUPPORTS ?auto_25088 ?auto_25084 ) ( not ( = ?auto_25085 ?auto_25092 ) ) ( not ( = ?auto_25082 ?auto_25092 ) ) ( not ( = ?auto_25083 ?auto_25084 ) ) ( CALIBRATION_TARGET ?auto_25088 ?auto_25092 ) ( not ( = ?auto_25092 ?auto_25087 ) ) ( ON_BOARD ?auto_25089 ?auto_25091 ) ( not ( = ?auto_25088 ?auto_25089 ) ) ( SUPPORTS ?auto_25089 ?auto_25086 ) ( not ( = ?auto_25083 ?auto_25086 ) ) ( not ( = ?auto_25084 ?auto_25086 ) ) ( CALIBRATION_TARGET ?auto_25089 ?auto_25092 ) ( POINTING ?auto_25091 ?auto_25082 ) ( ON_BOARD ?auto_25090 ?auto_25091 ) ( POWER_ON ?auto_25090 ) ( not ( = ?auto_25088 ?auto_25090 ) ) ( not ( = ?auto_25089 ?auto_25090 ) ) ( CALIBRATED ?auto_25090 ) ( SUPPORTS ?auto_25090 ?auto_25083 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25082 ?auto_25083 ?auto_25085 ?auto_25084 )
      ( GET-3IMAGE-VERIFY ?auto_25082 ?auto_25083 ?auto_25085 ?auto_25084 ?auto_25087 ?auto_25086 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25106 - DIRECTION
      ?auto_25107 - MODE
      ?auto_25109 - DIRECTION
      ?auto_25108 - MODE
      ?auto_25111 - DIRECTION
      ?auto_25110 - MODE
    )
    :vars
    (
      ?auto_25112 - INSTRUMENT
      ?auto_25115 - SATELLITE
      ?auto_25116 - DIRECTION
      ?auto_25113 - INSTRUMENT
      ?auto_25114 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25109 ?auto_25106 ) ) ( not ( = ?auto_25111 ?auto_25106 ) ) ( not ( = ?auto_25111 ?auto_25109 ) ) ( ON_BOARD ?auto_25112 ?auto_25115 ) ( SUPPORTS ?auto_25112 ?auto_25110 ) ( not ( = ?auto_25111 ?auto_25116 ) ) ( not ( = ?auto_25109 ?auto_25116 ) ) ( not ( = ?auto_25108 ?auto_25110 ) ) ( CALIBRATION_TARGET ?auto_25112 ?auto_25116 ) ( not ( = ?auto_25116 ?auto_25106 ) ) ( ON_BOARD ?auto_25113 ?auto_25115 ) ( not ( = ?auto_25112 ?auto_25113 ) ) ( SUPPORTS ?auto_25113 ?auto_25107 ) ( not ( = ?auto_25108 ?auto_25107 ) ) ( not ( = ?auto_25110 ?auto_25107 ) ) ( CALIBRATION_TARGET ?auto_25113 ?auto_25116 ) ( POINTING ?auto_25115 ?auto_25109 ) ( ON_BOARD ?auto_25114 ?auto_25115 ) ( POWER_ON ?auto_25114 ) ( not ( = ?auto_25112 ?auto_25114 ) ) ( not ( = ?auto_25113 ?auto_25114 ) ) ( CALIBRATED ?auto_25114 ) ( SUPPORTS ?auto_25114 ?auto_25108 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25109 ?auto_25108 ?auto_25111 ?auto_25110 )
      ( GET-3IMAGE-VERIFY ?auto_25106 ?auto_25107 ?auto_25109 ?auto_25108 ?auto_25111 ?auto_25110 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25130 - DIRECTION
      ?auto_25131 - MODE
      ?auto_25133 - DIRECTION
      ?auto_25132 - MODE
      ?auto_25135 - DIRECTION
      ?auto_25134 - MODE
    )
    :vars
    (
      ?auto_25136 - INSTRUMENT
      ?auto_25139 - SATELLITE
      ?auto_25140 - DIRECTION
      ?auto_25137 - INSTRUMENT
      ?auto_25138 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25133 ?auto_25130 ) ) ( not ( = ?auto_25135 ?auto_25130 ) ) ( not ( = ?auto_25135 ?auto_25133 ) ) ( ON_BOARD ?auto_25136 ?auto_25139 ) ( SUPPORTS ?auto_25136 ?auto_25132 ) ( not ( = ?auto_25133 ?auto_25140 ) ) ( not ( = ?auto_25135 ?auto_25140 ) ) ( not ( = ?auto_25134 ?auto_25132 ) ) ( CALIBRATION_TARGET ?auto_25136 ?auto_25140 ) ( not ( = ?auto_25140 ?auto_25130 ) ) ( ON_BOARD ?auto_25137 ?auto_25139 ) ( not ( = ?auto_25136 ?auto_25137 ) ) ( SUPPORTS ?auto_25137 ?auto_25131 ) ( not ( = ?auto_25134 ?auto_25131 ) ) ( not ( = ?auto_25132 ?auto_25131 ) ) ( CALIBRATION_TARGET ?auto_25137 ?auto_25140 ) ( POINTING ?auto_25139 ?auto_25135 ) ( ON_BOARD ?auto_25138 ?auto_25139 ) ( POWER_ON ?auto_25138 ) ( not ( = ?auto_25136 ?auto_25138 ) ) ( not ( = ?auto_25137 ?auto_25138 ) ) ( CALIBRATED ?auto_25138 ) ( SUPPORTS ?auto_25138 ?auto_25134 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25135 ?auto_25134 ?auto_25133 ?auto_25132 )
      ( GET-3IMAGE-VERIFY ?auto_25130 ?auto_25131 ?auto_25133 ?auto_25132 ?auto_25135 ?auto_25134 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25180 - DIRECTION
      ?auto_25181 - MODE
      ?auto_25183 - DIRECTION
      ?auto_25182 - MODE
      ?auto_25185 - DIRECTION
      ?auto_25184 - MODE
    )
    :vars
    (
      ?auto_25186 - INSTRUMENT
      ?auto_25189 - SATELLITE
      ?auto_25190 - DIRECTION
      ?auto_25187 - INSTRUMENT
      ?auto_25188 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25183 ?auto_25180 ) ) ( not ( = ?auto_25185 ?auto_25180 ) ) ( not ( = ?auto_25185 ?auto_25183 ) ) ( ON_BOARD ?auto_25186 ?auto_25189 ) ( SUPPORTS ?auto_25186 ?auto_25181 ) ( not ( = ?auto_25180 ?auto_25190 ) ) ( not ( = ?auto_25183 ?auto_25190 ) ) ( not ( = ?auto_25182 ?auto_25181 ) ) ( CALIBRATION_TARGET ?auto_25186 ?auto_25190 ) ( not ( = ?auto_25190 ?auto_25185 ) ) ( ON_BOARD ?auto_25187 ?auto_25189 ) ( not ( = ?auto_25186 ?auto_25187 ) ) ( SUPPORTS ?auto_25187 ?auto_25184 ) ( not ( = ?auto_25182 ?auto_25184 ) ) ( not ( = ?auto_25181 ?auto_25184 ) ) ( CALIBRATION_TARGET ?auto_25187 ?auto_25190 ) ( POINTING ?auto_25189 ?auto_25183 ) ( ON_BOARD ?auto_25188 ?auto_25189 ) ( POWER_ON ?auto_25188 ) ( not ( = ?auto_25186 ?auto_25188 ) ) ( not ( = ?auto_25187 ?auto_25188 ) ) ( CALIBRATED ?auto_25188 ) ( SUPPORTS ?auto_25188 ?auto_25182 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25183 ?auto_25182 ?auto_25180 ?auto_25181 )
      ( GET-3IMAGE-VERIFY ?auto_25180 ?auto_25181 ?auto_25183 ?auto_25182 ?auto_25185 ?auto_25184 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25204 - DIRECTION
      ?auto_25205 - MODE
      ?auto_25207 - DIRECTION
      ?auto_25206 - MODE
      ?auto_25209 - DIRECTION
      ?auto_25208 - MODE
    )
    :vars
    (
      ?auto_25210 - INSTRUMENT
      ?auto_25213 - SATELLITE
      ?auto_25214 - DIRECTION
      ?auto_25211 - INSTRUMENT
      ?auto_25212 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25207 ?auto_25204 ) ) ( not ( = ?auto_25209 ?auto_25204 ) ) ( not ( = ?auto_25209 ?auto_25207 ) ) ( ON_BOARD ?auto_25210 ?auto_25213 ) ( SUPPORTS ?auto_25210 ?auto_25205 ) ( not ( = ?auto_25204 ?auto_25214 ) ) ( not ( = ?auto_25209 ?auto_25214 ) ) ( not ( = ?auto_25208 ?auto_25205 ) ) ( CALIBRATION_TARGET ?auto_25210 ?auto_25214 ) ( not ( = ?auto_25214 ?auto_25207 ) ) ( ON_BOARD ?auto_25211 ?auto_25213 ) ( not ( = ?auto_25210 ?auto_25211 ) ) ( SUPPORTS ?auto_25211 ?auto_25206 ) ( not ( = ?auto_25208 ?auto_25206 ) ) ( not ( = ?auto_25205 ?auto_25206 ) ) ( CALIBRATION_TARGET ?auto_25211 ?auto_25214 ) ( POINTING ?auto_25213 ?auto_25209 ) ( ON_BOARD ?auto_25212 ?auto_25213 ) ( POWER_ON ?auto_25212 ) ( not ( = ?auto_25210 ?auto_25212 ) ) ( not ( = ?auto_25211 ?auto_25212 ) ) ( CALIBRATED ?auto_25212 ) ( SUPPORTS ?auto_25212 ?auto_25208 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25209 ?auto_25208 ?auto_25204 ?auto_25205 )
      ( GET-3IMAGE-VERIFY ?auto_25204 ?auto_25205 ?auto_25207 ?auto_25206 ?auto_25209 ?auto_25208 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_25282 - DIRECTION
      ?auto_25283 - MODE
    )
    :vars
    (
      ?auto_25291 - DIRECTION
      ?auto_25284 - INSTRUMENT
      ?auto_25288 - SATELLITE
      ?auto_25289 - DIRECTION
      ?auto_25290 - MODE
      ?auto_25285 - DIRECTION
      ?auto_25286 - INSTRUMENT
      ?auto_25292 - MODE
      ?auto_25287 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25282 ?auto_25291 ) ) ( ON_BOARD ?auto_25284 ?auto_25288 ) ( SUPPORTS ?auto_25284 ?auto_25283 ) ( not ( = ?auto_25282 ?auto_25289 ) ) ( not ( = ?auto_25291 ?auto_25289 ) ) ( not ( = ?auto_25290 ?auto_25283 ) ) ( CALIBRATION_TARGET ?auto_25284 ?auto_25289 ) ( not ( = ?auto_25289 ?auto_25285 ) ) ( not ( = ?auto_25282 ?auto_25285 ) ) ( not ( = ?auto_25291 ?auto_25285 ) ) ( ON_BOARD ?auto_25286 ?auto_25288 ) ( not ( = ?auto_25284 ?auto_25286 ) ) ( SUPPORTS ?auto_25286 ?auto_25292 ) ( not ( = ?auto_25290 ?auto_25292 ) ) ( not ( = ?auto_25283 ?auto_25292 ) ) ( CALIBRATION_TARGET ?auto_25286 ?auto_25289 ) ( ON_BOARD ?auto_25287 ?auto_25288 ) ( POWER_ON ?auto_25287 ) ( not ( = ?auto_25284 ?auto_25287 ) ) ( not ( = ?auto_25286 ?auto_25287 ) ) ( CALIBRATED ?auto_25287 ) ( SUPPORTS ?auto_25287 ?auto_25290 ) ( POINTING ?auto_25288 ?auto_25289 ) )
    :subtasks
    ( ( !TURN_TO ?auto_25288 ?auto_25291 ?auto_25289 )
      ( GET-2IMAGE ?auto_25291 ?auto_25290 ?auto_25282 ?auto_25283 )
      ( GET-1IMAGE-VERIFY ?auto_25282 ?auto_25283 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25293 - DIRECTION
      ?auto_25294 - MODE
      ?auto_25296 - DIRECTION
      ?auto_25295 - MODE
    )
    :vars
    (
      ?auto_25303 - INSTRUMENT
      ?auto_25297 - SATELLITE
      ?auto_25298 - DIRECTION
      ?auto_25300 - DIRECTION
      ?auto_25299 - INSTRUMENT
      ?auto_25301 - MODE
      ?auto_25302 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25296 ?auto_25293 ) ) ( ON_BOARD ?auto_25303 ?auto_25297 ) ( SUPPORTS ?auto_25303 ?auto_25295 ) ( not ( = ?auto_25296 ?auto_25298 ) ) ( not ( = ?auto_25293 ?auto_25298 ) ) ( not ( = ?auto_25294 ?auto_25295 ) ) ( CALIBRATION_TARGET ?auto_25303 ?auto_25298 ) ( not ( = ?auto_25298 ?auto_25300 ) ) ( not ( = ?auto_25296 ?auto_25300 ) ) ( not ( = ?auto_25293 ?auto_25300 ) ) ( ON_BOARD ?auto_25299 ?auto_25297 ) ( not ( = ?auto_25303 ?auto_25299 ) ) ( SUPPORTS ?auto_25299 ?auto_25301 ) ( not ( = ?auto_25294 ?auto_25301 ) ) ( not ( = ?auto_25295 ?auto_25301 ) ) ( CALIBRATION_TARGET ?auto_25299 ?auto_25298 ) ( ON_BOARD ?auto_25302 ?auto_25297 ) ( POWER_ON ?auto_25302 ) ( not ( = ?auto_25303 ?auto_25302 ) ) ( not ( = ?auto_25299 ?auto_25302 ) ) ( CALIBRATED ?auto_25302 ) ( SUPPORTS ?auto_25302 ?auto_25294 ) ( POINTING ?auto_25297 ?auto_25298 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_25296 ?auto_25295 )
      ( GET-2IMAGE-VERIFY ?auto_25293 ?auto_25294 ?auto_25296 ?auto_25295 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25304 - DIRECTION
      ?auto_25305 - MODE
      ?auto_25307 - DIRECTION
      ?auto_25306 - MODE
    )
    :vars
    (
      ?auto_25314 - DIRECTION
      ?auto_25309 - INSTRUMENT
      ?auto_25310 - SATELLITE
      ?auto_25311 - DIRECTION
      ?auto_25313 - MODE
      ?auto_25308 - INSTRUMENT
      ?auto_25312 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25307 ?auto_25304 ) ) ( not ( = ?auto_25307 ?auto_25314 ) ) ( ON_BOARD ?auto_25309 ?auto_25310 ) ( SUPPORTS ?auto_25309 ?auto_25306 ) ( not ( = ?auto_25307 ?auto_25311 ) ) ( not ( = ?auto_25314 ?auto_25311 ) ) ( not ( = ?auto_25313 ?auto_25306 ) ) ( CALIBRATION_TARGET ?auto_25309 ?auto_25311 ) ( not ( = ?auto_25311 ?auto_25304 ) ) ( not ( = ?auto_25314 ?auto_25304 ) ) ( ON_BOARD ?auto_25308 ?auto_25310 ) ( not ( = ?auto_25309 ?auto_25308 ) ) ( SUPPORTS ?auto_25308 ?auto_25305 ) ( not ( = ?auto_25313 ?auto_25305 ) ) ( not ( = ?auto_25306 ?auto_25305 ) ) ( CALIBRATION_TARGET ?auto_25308 ?auto_25311 ) ( ON_BOARD ?auto_25312 ?auto_25310 ) ( POWER_ON ?auto_25312 ) ( not ( = ?auto_25309 ?auto_25312 ) ) ( not ( = ?auto_25308 ?auto_25312 ) ) ( CALIBRATED ?auto_25312 ) ( SUPPORTS ?auto_25312 ?auto_25313 ) ( POINTING ?auto_25310 ?auto_25311 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25314 ?auto_25313 ?auto_25307 ?auto_25306 )
      ( GET-2IMAGE-VERIFY ?auto_25304 ?auto_25305 ?auto_25307 ?auto_25306 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25315 - DIRECTION
      ?auto_25316 - MODE
      ?auto_25318 - DIRECTION
      ?auto_25317 - MODE
    )
    :vars
    (
      ?auto_25321 - INSTRUMENT
      ?auto_25322 - SATELLITE
      ?auto_25323 - DIRECTION
      ?auto_25319 - DIRECTION
      ?auto_25320 - INSTRUMENT
      ?auto_25325 - MODE
      ?auto_25324 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25318 ?auto_25315 ) ) ( ON_BOARD ?auto_25321 ?auto_25322 ) ( SUPPORTS ?auto_25321 ?auto_25316 ) ( not ( = ?auto_25315 ?auto_25323 ) ) ( not ( = ?auto_25318 ?auto_25323 ) ) ( not ( = ?auto_25317 ?auto_25316 ) ) ( CALIBRATION_TARGET ?auto_25321 ?auto_25323 ) ( not ( = ?auto_25323 ?auto_25319 ) ) ( not ( = ?auto_25315 ?auto_25319 ) ) ( not ( = ?auto_25318 ?auto_25319 ) ) ( ON_BOARD ?auto_25320 ?auto_25322 ) ( not ( = ?auto_25321 ?auto_25320 ) ) ( SUPPORTS ?auto_25320 ?auto_25325 ) ( not ( = ?auto_25317 ?auto_25325 ) ) ( not ( = ?auto_25316 ?auto_25325 ) ) ( CALIBRATION_TARGET ?auto_25320 ?auto_25323 ) ( ON_BOARD ?auto_25324 ?auto_25322 ) ( POWER_ON ?auto_25324 ) ( not ( = ?auto_25321 ?auto_25324 ) ) ( not ( = ?auto_25320 ?auto_25324 ) ) ( CALIBRATED ?auto_25324 ) ( SUPPORTS ?auto_25324 ?auto_25317 ) ( POINTING ?auto_25322 ?auto_25323 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25318 ?auto_25317 ?auto_25315 ?auto_25316 )
      ( GET-2IMAGE-VERIFY ?auto_25315 ?auto_25316 ?auto_25318 ?auto_25317 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25326 - DIRECTION
      ?auto_25327 - MODE
      ?auto_25329 - DIRECTION
      ?auto_25328 - MODE
    )
    :vars
    (
      ?auto_25336 - DIRECTION
      ?auto_25331 - INSTRUMENT
      ?auto_25332 - SATELLITE
      ?auto_25333 - DIRECTION
      ?auto_25335 - MODE
      ?auto_25330 - INSTRUMENT
      ?auto_25334 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25329 ?auto_25326 ) ) ( not ( = ?auto_25326 ?auto_25336 ) ) ( ON_BOARD ?auto_25331 ?auto_25332 ) ( SUPPORTS ?auto_25331 ?auto_25327 ) ( not ( = ?auto_25326 ?auto_25333 ) ) ( not ( = ?auto_25336 ?auto_25333 ) ) ( not ( = ?auto_25335 ?auto_25327 ) ) ( CALIBRATION_TARGET ?auto_25331 ?auto_25333 ) ( not ( = ?auto_25333 ?auto_25329 ) ) ( not ( = ?auto_25336 ?auto_25329 ) ) ( ON_BOARD ?auto_25330 ?auto_25332 ) ( not ( = ?auto_25331 ?auto_25330 ) ) ( SUPPORTS ?auto_25330 ?auto_25328 ) ( not ( = ?auto_25335 ?auto_25328 ) ) ( not ( = ?auto_25327 ?auto_25328 ) ) ( CALIBRATION_TARGET ?auto_25330 ?auto_25333 ) ( ON_BOARD ?auto_25334 ?auto_25332 ) ( POWER_ON ?auto_25334 ) ( not ( = ?auto_25331 ?auto_25334 ) ) ( not ( = ?auto_25330 ?auto_25334 ) ) ( CALIBRATED ?auto_25334 ) ( SUPPORTS ?auto_25334 ?auto_25335 ) ( POINTING ?auto_25332 ?auto_25333 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25336 ?auto_25335 ?auto_25326 ?auto_25327 )
      ( GET-2IMAGE-VERIFY ?auto_25326 ?auto_25327 ?auto_25329 ?auto_25328 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25363 - DIRECTION
      ?auto_25364 - MODE
      ?auto_25366 - DIRECTION
      ?auto_25365 - MODE
      ?auto_25368 - DIRECTION
      ?auto_25367 - MODE
    )
    :vars
    (
      ?auto_25370 - INSTRUMENT
      ?auto_25371 - SATELLITE
      ?auto_25372 - DIRECTION
      ?auto_25369 - INSTRUMENT
      ?auto_25373 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25366 ?auto_25363 ) ) ( not ( = ?auto_25368 ?auto_25363 ) ) ( not ( = ?auto_25368 ?auto_25366 ) ) ( ON_BOARD ?auto_25370 ?auto_25371 ) ( SUPPORTS ?auto_25370 ?auto_25367 ) ( not ( = ?auto_25368 ?auto_25372 ) ) ( not ( = ?auto_25363 ?auto_25372 ) ) ( not ( = ?auto_25364 ?auto_25367 ) ) ( CALIBRATION_TARGET ?auto_25370 ?auto_25372 ) ( not ( = ?auto_25372 ?auto_25366 ) ) ( ON_BOARD ?auto_25369 ?auto_25371 ) ( not ( = ?auto_25370 ?auto_25369 ) ) ( SUPPORTS ?auto_25369 ?auto_25365 ) ( not ( = ?auto_25364 ?auto_25365 ) ) ( not ( = ?auto_25367 ?auto_25365 ) ) ( CALIBRATION_TARGET ?auto_25369 ?auto_25372 ) ( ON_BOARD ?auto_25373 ?auto_25371 ) ( POWER_ON ?auto_25373 ) ( not ( = ?auto_25370 ?auto_25373 ) ) ( not ( = ?auto_25369 ?auto_25373 ) ) ( CALIBRATED ?auto_25373 ) ( SUPPORTS ?auto_25373 ?auto_25364 ) ( POINTING ?auto_25371 ?auto_25372 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25363 ?auto_25364 ?auto_25368 ?auto_25367 )
      ( GET-3IMAGE-VERIFY ?auto_25363 ?auto_25364 ?auto_25366 ?auto_25365 ?auto_25368 ?auto_25367 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25387 - DIRECTION
      ?auto_25388 - MODE
      ?auto_25390 - DIRECTION
      ?auto_25389 - MODE
      ?auto_25392 - DIRECTION
      ?auto_25391 - MODE
    )
    :vars
    (
      ?auto_25394 - INSTRUMENT
      ?auto_25395 - SATELLITE
      ?auto_25396 - DIRECTION
      ?auto_25393 - INSTRUMENT
      ?auto_25397 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25390 ?auto_25387 ) ) ( not ( = ?auto_25392 ?auto_25387 ) ) ( not ( = ?auto_25392 ?auto_25390 ) ) ( ON_BOARD ?auto_25394 ?auto_25395 ) ( SUPPORTS ?auto_25394 ?auto_25389 ) ( not ( = ?auto_25390 ?auto_25396 ) ) ( not ( = ?auto_25387 ?auto_25396 ) ) ( not ( = ?auto_25388 ?auto_25389 ) ) ( CALIBRATION_TARGET ?auto_25394 ?auto_25396 ) ( not ( = ?auto_25396 ?auto_25392 ) ) ( ON_BOARD ?auto_25393 ?auto_25395 ) ( not ( = ?auto_25394 ?auto_25393 ) ) ( SUPPORTS ?auto_25393 ?auto_25391 ) ( not ( = ?auto_25388 ?auto_25391 ) ) ( not ( = ?auto_25389 ?auto_25391 ) ) ( CALIBRATION_TARGET ?auto_25393 ?auto_25396 ) ( ON_BOARD ?auto_25397 ?auto_25395 ) ( POWER_ON ?auto_25397 ) ( not ( = ?auto_25394 ?auto_25397 ) ) ( not ( = ?auto_25393 ?auto_25397 ) ) ( CALIBRATED ?auto_25397 ) ( SUPPORTS ?auto_25397 ?auto_25388 ) ( POINTING ?auto_25395 ?auto_25396 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25387 ?auto_25388 ?auto_25390 ?auto_25389 )
      ( GET-3IMAGE-VERIFY ?auto_25387 ?auto_25388 ?auto_25390 ?auto_25389 ?auto_25392 ?auto_25391 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25411 - DIRECTION
      ?auto_25412 - MODE
      ?auto_25414 - DIRECTION
      ?auto_25413 - MODE
      ?auto_25416 - DIRECTION
      ?auto_25415 - MODE
    )
    :vars
    (
      ?auto_25418 - INSTRUMENT
      ?auto_25419 - SATELLITE
      ?auto_25420 - DIRECTION
      ?auto_25417 - INSTRUMENT
      ?auto_25421 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25414 ?auto_25411 ) ) ( not ( = ?auto_25416 ?auto_25411 ) ) ( not ( = ?auto_25416 ?auto_25414 ) ) ( ON_BOARD ?auto_25418 ?auto_25419 ) ( SUPPORTS ?auto_25418 ?auto_25415 ) ( not ( = ?auto_25416 ?auto_25420 ) ) ( not ( = ?auto_25414 ?auto_25420 ) ) ( not ( = ?auto_25413 ?auto_25415 ) ) ( CALIBRATION_TARGET ?auto_25418 ?auto_25420 ) ( not ( = ?auto_25420 ?auto_25411 ) ) ( ON_BOARD ?auto_25417 ?auto_25419 ) ( not ( = ?auto_25418 ?auto_25417 ) ) ( SUPPORTS ?auto_25417 ?auto_25412 ) ( not ( = ?auto_25413 ?auto_25412 ) ) ( not ( = ?auto_25415 ?auto_25412 ) ) ( CALIBRATION_TARGET ?auto_25417 ?auto_25420 ) ( ON_BOARD ?auto_25421 ?auto_25419 ) ( POWER_ON ?auto_25421 ) ( not ( = ?auto_25418 ?auto_25421 ) ) ( not ( = ?auto_25417 ?auto_25421 ) ) ( CALIBRATED ?auto_25421 ) ( SUPPORTS ?auto_25421 ?auto_25413 ) ( POINTING ?auto_25419 ?auto_25420 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25414 ?auto_25413 ?auto_25416 ?auto_25415 )
      ( GET-3IMAGE-VERIFY ?auto_25411 ?auto_25412 ?auto_25414 ?auto_25413 ?auto_25416 ?auto_25415 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25435 - DIRECTION
      ?auto_25436 - MODE
      ?auto_25438 - DIRECTION
      ?auto_25437 - MODE
      ?auto_25440 - DIRECTION
      ?auto_25439 - MODE
    )
    :vars
    (
      ?auto_25442 - INSTRUMENT
      ?auto_25443 - SATELLITE
      ?auto_25444 - DIRECTION
      ?auto_25441 - INSTRUMENT
      ?auto_25445 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25438 ?auto_25435 ) ) ( not ( = ?auto_25440 ?auto_25435 ) ) ( not ( = ?auto_25440 ?auto_25438 ) ) ( ON_BOARD ?auto_25442 ?auto_25443 ) ( SUPPORTS ?auto_25442 ?auto_25437 ) ( not ( = ?auto_25438 ?auto_25444 ) ) ( not ( = ?auto_25440 ?auto_25444 ) ) ( not ( = ?auto_25439 ?auto_25437 ) ) ( CALIBRATION_TARGET ?auto_25442 ?auto_25444 ) ( not ( = ?auto_25444 ?auto_25435 ) ) ( ON_BOARD ?auto_25441 ?auto_25443 ) ( not ( = ?auto_25442 ?auto_25441 ) ) ( SUPPORTS ?auto_25441 ?auto_25436 ) ( not ( = ?auto_25439 ?auto_25436 ) ) ( not ( = ?auto_25437 ?auto_25436 ) ) ( CALIBRATION_TARGET ?auto_25441 ?auto_25444 ) ( ON_BOARD ?auto_25445 ?auto_25443 ) ( POWER_ON ?auto_25445 ) ( not ( = ?auto_25442 ?auto_25445 ) ) ( not ( = ?auto_25441 ?auto_25445 ) ) ( CALIBRATED ?auto_25445 ) ( SUPPORTS ?auto_25445 ?auto_25439 ) ( POINTING ?auto_25443 ?auto_25444 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25440 ?auto_25439 ?auto_25438 ?auto_25437 )
      ( GET-3IMAGE-VERIFY ?auto_25435 ?auto_25436 ?auto_25438 ?auto_25437 ?auto_25440 ?auto_25439 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25485 - DIRECTION
      ?auto_25486 - MODE
      ?auto_25488 - DIRECTION
      ?auto_25487 - MODE
      ?auto_25490 - DIRECTION
      ?auto_25489 - MODE
    )
    :vars
    (
      ?auto_25492 - INSTRUMENT
      ?auto_25493 - SATELLITE
      ?auto_25494 - DIRECTION
      ?auto_25491 - INSTRUMENT
      ?auto_25495 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25488 ?auto_25485 ) ) ( not ( = ?auto_25490 ?auto_25485 ) ) ( not ( = ?auto_25490 ?auto_25488 ) ) ( ON_BOARD ?auto_25492 ?auto_25493 ) ( SUPPORTS ?auto_25492 ?auto_25486 ) ( not ( = ?auto_25485 ?auto_25494 ) ) ( not ( = ?auto_25488 ?auto_25494 ) ) ( not ( = ?auto_25487 ?auto_25486 ) ) ( CALIBRATION_TARGET ?auto_25492 ?auto_25494 ) ( not ( = ?auto_25494 ?auto_25490 ) ) ( ON_BOARD ?auto_25491 ?auto_25493 ) ( not ( = ?auto_25492 ?auto_25491 ) ) ( SUPPORTS ?auto_25491 ?auto_25489 ) ( not ( = ?auto_25487 ?auto_25489 ) ) ( not ( = ?auto_25486 ?auto_25489 ) ) ( CALIBRATION_TARGET ?auto_25491 ?auto_25494 ) ( ON_BOARD ?auto_25495 ?auto_25493 ) ( POWER_ON ?auto_25495 ) ( not ( = ?auto_25492 ?auto_25495 ) ) ( not ( = ?auto_25491 ?auto_25495 ) ) ( CALIBRATED ?auto_25495 ) ( SUPPORTS ?auto_25495 ?auto_25487 ) ( POINTING ?auto_25493 ?auto_25494 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25488 ?auto_25487 ?auto_25485 ?auto_25486 )
      ( GET-3IMAGE-VERIFY ?auto_25485 ?auto_25486 ?auto_25488 ?auto_25487 ?auto_25490 ?auto_25489 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25509 - DIRECTION
      ?auto_25510 - MODE
      ?auto_25512 - DIRECTION
      ?auto_25511 - MODE
      ?auto_25514 - DIRECTION
      ?auto_25513 - MODE
    )
    :vars
    (
      ?auto_25516 - INSTRUMENT
      ?auto_25517 - SATELLITE
      ?auto_25518 - DIRECTION
      ?auto_25515 - INSTRUMENT
      ?auto_25519 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25512 ?auto_25509 ) ) ( not ( = ?auto_25514 ?auto_25509 ) ) ( not ( = ?auto_25514 ?auto_25512 ) ) ( ON_BOARD ?auto_25516 ?auto_25517 ) ( SUPPORTS ?auto_25516 ?auto_25510 ) ( not ( = ?auto_25509 ?auto_25518 ) ) ( not ( = ?auto_25514 ?auto_25518 ) ) ( not ( = ?auto_25513 ?auto_25510 ) ) ( CALIBRATION_TARGET ?auto_25516 ?auto_25518 ) ( not ( = ?auto_25518 ?auto_25512 ) ) ( ON_BOARD ?auto_25515 ?auto_25517 ) ( not ( = ?auto_25516 ?auto_25515 ) ) ( SUPPORTS ?auto_25515 ?auto_25511 ) ( not ( = ?auto_25513 ?auto_25511 ) ) ( not ( = ?auto_25510 ?auto_25511 ) ) ( CALIBRATION_TARGET ?auto_25515 ?auto_25518 ) ( ON_BOARD ?auto_25519 ?auto_25517 ) ( POWER_ON ?auto_25519 ) ( not ( = ?auto_25516 ?auto_25519 ) ) ( not ( = ?auto_25515 ?auto_25519 ) ) ( CALIBRATED ?auto_25519 ) ( SUPPORTS ?auto_25519 ?auto_25513 ) ( POINTING ?auto_25517 ?auto_25518 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25514 ?auto_25513 ?auto_25509 ?auto_25510 )
      ( GET-3IMAGE-VERIFY ?auto_25509 ?auto_25510 ?auto_25512 ?auto_25511 ?auto_25514 ?auto_25513 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_25587 - DIRECTION
      ?auto_25588 - MODE
    )
    :vars
    (
      ?auto_25597 - DIRECTION
      ?auto_25591 - INSTRUMENT
      ?auto_25592 - SATELLITE
      ?auto_25593 - DIRECTION
      ?auto_25596 - MODE
      ?auto_25589 - DIRECTION
      ?auto_25590 - INSTRUMENT
      ?auto_25595 - MODE
      ?auto_25594 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25587 ?auto_25597 ) ) ( ON_BOARD ?auto_25591 ?auto_25592 ) ( SUPPORTS ?auto_25591 ?auto_25588 ) ( not ( = ?auto_25587 ?auto_25593 ) ) ( not ( = ?auto_25597 ?auto_25593 ) ) ( not ( = ?auto_25596 ?auto_25588 ) ) ( CALIBRATION_TARGET ?auto_25591 ?auto_25593 ) ( not ( = ?auto_25593 ?auto_25589 ) ) ( not ( = ?auto_25587 ?auto_25589 ) ) ( not ( = ?auto_25597 ?auto_25589 ) ) ( ON_BOARD ?auto_25590 ?auto_25592 ) ( not ( = ?auto_25591 ?auto_25590 ) ) ( SUPPORTS ?auto_25590 ?auto_25595 ) ( not ( = ?auto_25596 ?auto_25595 ) ) ( not ( = ?auto_25588 ?auto_25595 ) ) ( CALIBRATION_TARGET ?auto_25590 ?auto_25593 ) ( ON_BOARD ?auto_25594 ?auto_25592 ) ( POWER_ON ?auto_25594 ) ( not ( = ?auto_25591 ?auto_25594 ) ) ( not ( = ?auto_25590 ?auto_25594 ) ) ( SUPPORTS ?auto_25594 ?auto_25596 ) ( POINTING ?auto_25592 ?auto_25593 ) ( CALIBRATION_TARGET ?auto_25594 ?auto_25593 ) ( NOT_CALIBRATED ?auto_25594 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_25592 ?auto_25594 ?auto_25593 )
      ( GET-2IMAGE ?auto_25597 ?auto_25596 ?auto_25587 ?auto_25588 )
      ( GET-1IMAGE-VERIFY ?auto_25587 ?auto_25588 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25598 - DIRECTION
      ?auto_25599 - MODE
      ?auto_25601 - DIRECTION
      ?auto_25600 - MODE
    )
    :vars
    (
      ?auto_25604 - INSTRUMENT
      ?auto_25606 - SATELLITE
      ?auto_25607 - DIRECTION
      ?auto_25608 - DIRECTION
      ?auto_25603 - INSTRUMENT
      ?auto_25605 - MODE
      ?auto_25602 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25601 ?auto_25598 ) ) ( ON_BOARD ?auto_25604 ?auto_25606 ) ( SUPPORTS ?auto_25604 ?auto_25600 ) ( not ( = ?auto_25601 ?auto_25607 ) ) ( not ( = ?auto_25598 ?auto_25607 ) ) ( not ( = ?auto_25599 ?auto_25600 ) ) ( CALIBRATION_TARGET ?auto_25604 ?auto_25607 ) ( not ( = ?auto_25607 ?auto_25608 ) ) ( not ( = ?auto_25601 ?auto_25608 ) ) ( not ( = ?auto_25598 ?auto_25608 ) ) ( ON_BOARD ?auto_25603 ?auto_25606 ) ( not ( = ?auto_25604 ?auto_25603 ) ) ( SUPPORTS ?auto_25603 ?auto_25605 ) ( not ( = ?auto_25599 ?auto_25605 ) ) ( not ( = ?auto_25600 ?auto_25605 ) ) ( CALIBRATION_TARGET ?auto_25603 ?auto_25607 ) ( ON_BOARD ?auto_25602 ?auto_25606 ) ( POWER_ON ?auto_25602 ) ( not ( = ?auto_25604 ?auto_25602 ) ) ( not ( = ?auto_25603 ?auto_25602 ) ) ( SUPPORTS ?auto_25602 ?auto_25599 ) ( POINTING ?auto_25606 ?auto_25607 ) ( CALIBRATION_TARGET ?auto_25602 ?auto_25607 ) ( NOT_CALIBRATED ?auto_25602 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_25601 ?auto_25600 )
      ( GET-2IMAGE-VERIFY ?auto_25598 ?auto_25599 ?auto_25601 ?auto_25600 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25609 - DIRECTION
      ?auto_25610 - MODE
      ?auto_25612 - DIRECTION
      ?auto_25611 - MODE
    )
    :vars
    (
      ?auto_25619 - DIRECTION
      ?auto_25613 - INSTRUMENT
      ?auto_25615 - SATELLITE
      ?auto_25614 - DIRECTION
      ?auto_25618 - MODE
      ?auto_25616 - INSTRUMENT
      ?auto_25617 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25612 ?auto_25609 ) ) ( not ( = ?auto_25612 ?auto_25619 ) ) ( ON_BOARD ?auto_25613 ?auto_25615 ) ( SUPPORTS ?auto_25613 ?auto_25611 ) ( not ( = ?auto_25612 ?auto_25614 ) ) ( not ( = ?auto_25619 ?auto_25614 ) ) ( not ( = ?auto_25618 ?auto_25611 ) ) ( CALIBRATION_TARGET ?auto_25613 ?auto_25614 ) ( not ( = ?auto_25614 ?auto_25609 ) ) ( not ( = ?auto_25619 ?auto_25609 ) ) ( ON_BOARD ?auto_25616 ?auto_25615 ) ( not ( = ?auto_25613 ?auto_25616 ) ) ( SUPPORTS ?auto_25616 ?auto_25610 ) ( not ( = ?auto_25618 ?auto_25610 ) ) ( not ( = ?auto_25611 ?auto_25610 ) ) ( CALIBRATION_TARGET ?auto_25616 ?auto_25614 ) ( ON_BOARD ?auto_25617 ?auto_25615 ) ( POWER_ON ?auto_25617 ) ( not ( = ?auto_25613 ?auto_25617 ) ) ( not ( = ?auto_25616 ?auto_25617 ) ) ( SUPPORTS ?auto_25617 ?auto_25618 ) ( POINTING ?auto_25615 ?auto_25614 ) ( CALIBRATION_TARGET ?auto_25617 ?auto_25614 ) ( NOT_CALIBRATED ?auto_25617 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25619 ?auto_25618 ?auto_25612 ?auto_25611 )
      ( GET-2IMAGE-VERIFY ?auto_25609 ?auto_25610 ?auto_25612 ?auto_25611 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25620 - DIRECTION
      ?auto_25621 - MODE
      ?auto_25623 - DIRECTION
      ?auto_25622 - MODE
    )
    :vars
    (
      ?auto_25625 - INSTRUMENT
      ?auto_25627 - SATELLITE
      ?auto_25626 - DIRECTION
      ?auto_25630 - DIRECTION
      ?auto_25628 - INSTRUMENT
      ?auto_25624 - MODE
      ?auto_25629 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25623 ?auto_25620 ) ) ( ON_BOARD ?auto_25625 ?auto_25627 ) ( SUPPORTS ?auto_25625 ?auto_25621 ) ( not ( = ?auto_25620 ?auto_25626 ) ) ( not ( = ?auto_25623 ?auto_25626 ) ) ( not ( = ?auto_25622 ?auto_25621 ) ) ( CALIBRATION_TARGET ?auto_25625 ?auto_25626 ) ( not ( = ?auto_25626 ?auto_25630 ) ) ( not ( = ?auto_25620 ?auto_25630 ) ) ( not ( = ?auto_25623 ?auto_25630 ) ) ( ON_BOARD ?auto_25628 ?auto_25627 ) ( not ( = ?auto_25625 ?auto_25628 ) ) ( SUPPORTS ?auto_25628 ?auto_25624 ) ( not ( = ?auto_25622 ?auto_25624 ) ) ( not ( = ?auto_25621 ?auto_25624 ) ) ( CALIBRATION_TARGET ?auto_25628 ?auto_25626 ) ( ON_BOARD ?auto_25629 ?auto_25627 ) ( POWER_ON ?auto_25629 ) ( not ( = ?auto_25625 ?auto_25629 ) ) ( not ( = ?auto_25628 ?auto_25629 ) ) ( SUPPORTS ?auto_25629 ?auto_25622 ) ( POINTING ?auto_25627 ?auto_25626 ) ( CALIBRATION_TARGET ?auto_25629 ?auto_25626 ) ( NOT_CALIBRATED ?auto_25629 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25623 ?auto_25622 ?auto_25620 ?auto_25621 )
      ( GET-2IMAGE-VERIFY ?auto_25620 ?auto_25621 ?auto_25623 ?auto_25622 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25631 - DIRECTION
      ?auto_25632 - MODE
      ?auto_25634 - DIRECTION
      ?auto_25633 - MODE
    )
    :vars
    (
      ?auto_25641 - DIRECTION
      ?auto_25635 - INSTRUMENT
      ?auto_25637 - SATELLITE
      ?auto_25636 - DIRECTION
      ?auto_25640 - MODE
      ?auto_25638 - INSTRUMENT
      ?auto_25639 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25634 ?auto_25631 ) ) ( not ( = ?auto_25631 ?auto_25641 ) ) ( ON_BOARD ?auto_25635 ?auto_25637 ) ( SUPPORTS ?auto_25635 ?auto_25632 ) ( not ( = ?auto_25631 ?auto_25636 ) ) ( not ( = ?auto_25641 ?auto_25636 ) ) ( not ( = ?auto_25640 ?auto_25632 ) ) ( CALIBRATION_TARGET ?auto_25635 ?auto_25636 ) ( not ( = ?auto_25636 ?auto_25634 ) ) ( not ( = ?auto_25641 ?auto_25634 ) ) ( ON_BOARD ?auto_25638 ?auto_25637 ) ( not ( = ?auto_25635 ?auto_25638 ) ) ( SUPPORTS ?auto_25638 ?auto_25633 ) ( not ( = ?auto_25640 ?auto_25633 ) ) ( not ( = ?auto_25632 ?auto_25633 ) ) ( CALIBRATION_TARGET ?auto_25638 ?auto_25636 ) ( ON_BOARD ?auto_25639 ?auto_25637 ) ( POWER_ON ?auto_25639 ) ( not ( = ?auto_25635 ?auto_25639 ) ) ( not ( = ?auto_25638 ?auto_25639 ) ) ( SUPPORTS ?auto_25639 ?auto_25640 ) ( POINTING ?auto_25637 ?auto_25636 ) ( CALIBRATION_TARGET ?auto_25639 ?auto_25636 ) ( NOT_CALIBRATED ?auto_25639 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25641 ?auto_25640 ?auto_25631 ?auto_25632 )
      ( GET-2IMAGE-VERIFY ?auto_25631 ?auto_25632 ?auto_25634 ?auto_25633 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25668 - DIRECTION
      ?auto_25669 - MODE
      ?auto_25671 - DIRECTION
      ?auto_25670 - MODE
      ?auto_25673 - DIRECTION
      ?auto_25672 - MODE
    )
    :vars
    (
      ?auto_25674 - INSTRUMENT
      ?auto_25676 - SATELLITE
      ?auto_25675 - DIRECTION
      ?auto_25677 - INSTRUMENT
      ?auto_25678 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25671 ?auto_25668 ) ) ( not ( = ?auto_25673 ?auto_25668 ) ) ( not ( = ?auto_25673 ?auto_25671 ) ) ( ON_BOARD ?auto_25674 ?auto_25676 ) ( SUPPORTS ?auto_25674 ?auto_25672 ) ( not ( = ?auto_25673 ?auto_25675 ) ) ( not ( = ?auto_25668 ?auto_25675 ) ) ( not ( = ?auto_25669 ?auto_25672 ) ) ( CALIBRATION_TARGET ?auto_25674 ?auto_25675 ) ( not ( = ?auto_25675 ?auto_25671 ) ) ( ON_BOARD ?auto_25677 ?auto_25676 ) ( not ( = ?auto_25674 ?auto_25677 ) ) ( SUPPORTS ?auto_25677 ?auto_25670 ) ( not ( = ?auto_25669 ?auto_25670 ) ) ( not ( = ?auto_25672 ?auto_25670 ) ) ( CALIBRATION_TARGET ?auto_25677 ?auto_25675 ) ( ON_BOARD ?auto_25678 ?auto_25676 ) ( POWER_ON ?auto_25678 ) ( not ( = ?auto_25674 ?auto_25678 ) ) ( not ( = ?auto_25677 ?auto_25678 ) ) ( SUPPORTS ?auto_25678 ?auto_25669 ) ( POINTING ?auto_25676 ?auto_25675 ) ( CALIBRATION_TARGET ?auto_25678 ?auto_25675 ) ( NOT_CALIBRATED ?auto_25678 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25668 ?auto_25669 ?auto_25673 ?auto_25672 )
      ( GET-3IMAGE-VERIFY ?auto_25668 ?auto_25669 ?auto_25671 ?auto_25670 ?auto_25673 ?auto_25672 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25692 - DIRECTION
      ?auto_25693 - MODE
      ?auto_25695 - DIRECTION
      ?auto_25694 - MODE
      ?auto_25697 - DIRECTION
      ?auto_25696 - MODE
    )
    :vars
    (
      ?auto_25698 - INSTRUMENT
      ?auto_25700 - SATELLITE
      ?auto_25699 - DIRECTION
      ?auto_25701 - INSTRUMENT
      ?auto_25702 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25695 ?auto_25692 ) ) ( not ( = ?auto_25697 ?auto_25692 ) ) ( not ( = ?auto_25697 ?auto_25695 ) ) ( ON_BOARD ?auto_25698 ?auto_25700 ) ( SUPPORTS ?auto_25698 ?auto_25694 ) ( not ( = ?auto_25695 ?auto_25699 ) ) ( not ( = ?auto_25692 ?auto_25699 ) ) ( not ( = ?auto_25693 ?auto_25694 ) ) ( CALIBRATION_TARGET ?auto_25698 ?auto_25699 ) ( not ( = ?auto_25699 ?auto_25697 ) ) ( ON_BOARD ?auto_25701 ?auto_25700 ) ( not ( = ?auto_25698 ?auto_25701 ) ) ( SUPPORTS ?auto_25701 ?auto_25696 ) ( not ( = ?auto_25693 ?auto_25696 ) ) ( not ( = ?auto_25694 ?auto_25696 ) ) ( CALIBRATION_TARGET ?auto_25701 ?auto_25699 ) ( ON_BOARD ?auto_25702 ?auto_25700 ) ( POWER_ON ?auto_25702 ) ( not ( = ?auto_25698 ?auto_25702 ) ) ( not ( = ?auto_25701 ?auto_25702 ) ) ( SUPPORTS ?auto_25702 ?auto_25693 ) ( POINTING ?auto_25700 ?auto_25699 ) ( CALIBRATION_TARGET ?auto_25702 ?auto_25699 ) ( NOT_CALIBRATED ?auto_25702 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25692 ?auto_25693 ?auto_25695 ?auto_25694 )
      ( GET-3IMAGE-VERIFY ?auto_25692 ?auto_25693 ?auto_25695 ?auto_25694 ?auto_25697 ?auto_25696 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25716 - DIRECTION
      ?auto_25717 - MODE
      ?auto_25719 - DIRECTION
      ?auto_25718 - MODE
      ?auto_25721 - DIRECTION
      ?auto_25720 - MODE
    )
    :vars
    (
      ?auto_25722 - INSTRUMENT
      ?auto_25724 - SATELLITE
      ?auto_25723 - DIRECTION
      ?auto_25725 - INSTRUMENT
      ?auto_25726 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25719 ?auto_25716 ) ) ( not ( = ?auto_25721 ?auto_25716 ) ) ( not ( = ?auto_25721 ?auto_25719 ) ) ( ON_BOARD ?auto_25722 ?auto_25724 ) ( SUPPORTS ?auto_25722 ?auto_25720 ) ( not ( = ?auto_25721 ?auto_25723 ) ) ( not ( = ?auto_25719 ?auto_25723 ) ) ( not ( = ?auto_25718 ?auto_25720 ) ) ( CALIBRATION_TARGET ?auto_25722 ?auto_25723 ) ( not ( = ?auto_25723 ?auto_25716 ) ) ( ON_BOARD ?auto_25725 ?auto_25724 ) ( not ( = ?auto_25722 ?auto_25725 ) ) ( SUPPORTS ?auto_25725 ?auto_25717 ) ( not ( = ?auto_25718 ?auto_25717 ) ) ( not ( = ?auto_25720 ?auto_25717 ) ) ( CALIBRATION_TARGET ?auto_25725 ?auto_25723 ) ( ON_BOARD ?auto_25726 ?auto_25724 ) ( POWER_ON ?auto_25726 ) ( not ( = ?auto_25722 ?auto_25726 ) ) ( not ( = ?auto_25725 ?auto_25726 ) ) ( SUPPORTS ?auto_25726 ?auto_25718 ) ( POINTING ?auto_25724 ?auto_25723 ) ( CALIBRATION_TARGET ?auto_25726 ?auto_25723 ) ( NOT_CALIBRATED ?auto_25726 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25719 ?auto_25718 ?auto_25721 ?auto_25720 )
      ( GET-3IMAGE-VERIFY ?auto_25716 ?auto_25717 ?auto_25719 ?auto_25718 ?auto_25721 ?auto_25720 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25740 - DIRECTION
      ?auto_25741 - MODE
      ?auto_25743 - DIRECTION
      ?auto_25742 - MODE
      ?auto_25745 - DIRECTION
      ?auto_25744 - MODE
    )
    :vars
    (
      ?auto_25746 - INSTRUMENT
      ?auto_25748 - SATELLITE
      ?auto_25747 - DIRECTION
      ?auto_25749 - INSTRUMENT
      ?auto_25750 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25743 ?auto_25740 ) ) ( not ( = ?auto_25745 ?auto_25740 ) ) ( not ( = ?auto_25745 ?auto_25743 ) ) ( ON_BOARD ?auto_25746 ?auto_25748 ) ( SUPPORTS ?auto_25746 ?auto_25742 ) ( not ( = ?auto_25743 ?auto_25747 ) ) ( not ( = ?auto_25745 ?auto_25747 ) ) ( not ( = ?auto_25744 ?auto_25742 ) ) ( CALIBRATION_TARGET ?auto_25746 ?auto_25747 ) ( not ( = ?auto_25747 ?auto_25740 ) ) ( ON_BOARD ?auto_25749 ?auto_25748 ) ( not ( = ?auto_25746 ?auto_25749 ) ) ( SUPPORTS ?auto_25749 ?auto_25741 ) ( not ( = ?auto_25744 ?auto_25741 ) ) ( not ( = ?auto_25742 ?auto_25741 ) ) ( CALIBRATION_TARGET ?auto_25749 ?auto_25747 ) ( ON_BOARD ?auto_25750 ?auto_25748 ) ( POWER_ON ?auto_25750 ) ( not ( = ?auto_25746 ?auto_25750 ) ) ( not ( = ?auto_25749 ?auto_25750 ) ) ( SUPPORTS ?auto_25750 ?auto_25744 ) ( POINTING ?auto_25748 ?auto_25747 ) ( CALIBRATION_TARGET ?auto_25750 ?auto_25747 ) ( NOT_CALIBRATED ?auto_25750 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25745 ?auto_25744 ?auto_25743 ?auto_25742 )
      ( GET-3IMAGE-VERIFY ?auto_25740 ?auto_25741 ?auto_25743 ?auto_25742 ?auto_25745 ?auto_25744 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25790 - DIRECTION
      ?auto_25791 - MODE
      ?auto_25793 - DIRECTION
      ?auto_25792 - MODE
      ?auto_25795 - DIRECTION
      ?auto_25794 - MODE
    )
    :vars
    (
      ?auto_25796 - INSTRUMENT
      ?auto_25798 - SATELLITE
      ?auto_25797 - DIRECTION
      ?auto_25799 - INSTRUMENT
      ?auto_25800 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25793 ?auto_25790 ) ) ( not ( = ?auto_25795 ?auto_25790 ) ) ( not ( = ?auto_25795 ?auto_25793 ) ) ( ON_BOARD ?auto_25796 ?auto_25798 ) ( SUPPORTS ?auto_25796 ?auto_25791 ) ( not ( = ?auto_25790 ?auto_25797 ) ) ( not ( = ?auto_25793 ?auto_25797 ) ) ( not ( = ?auto_25792 ?auto_25791 ) ) ( CALIBRATION_TARGET ?auto_25796 ?auto_25797 ) ( not ( = ?auto_25797 ?auto_25795 ) ) ( ON_BOARD ?auto_25799 ?auto_25798 ) ( not ( = ?auto_25796 ?auto_25799 ) ) ( SUPPORTS ?auto_25799 ?auto_25794 ) ( not ( = ?auto_25792 ?auto_25794 ) ) ( not ( = ?auto_25791 ?auto_25794 ) ) ( CALIBRATION_TARGET ?auto_25799 ?auto_25797 ) ( ON_BOARD ?auto_25800 ?auto_25798 ) ( POWER_ON ?auto_25800 ) ( not ( = ?auto_25796 ?auto_25800 ) ) ( not ( = ?auto_25799 ?auto_25800 ) ) ( SUPPORTS ?auto_25800 ?auto_25792 ) ( POINTING ?auto_25798 ?auto_25797 ) ( CALIBRATION_TARGET ?auto_25800 ?auto_25797 ) ( NOT_CALIBRATED ?auto_25800 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25793 ?auto_25792 ?auto_25790 ?auto_25791 )
      ( GET-3IMAGE-VERIFY ?auto_25790 ?auto_25791 ?auto_25793 ?auto_25792 ?auto_25795 ?auto_25794 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25814 - DIRECTION
      ?auto_25815 - MODE
      ?auto_25817 - DIRECTION
      ?auto_25816 - MODE
      ?auto_25819 - DIRECTION
      ?auto_25818 - MODE
    )
    :vars
    (
      ?auto_25820 - INSTRUMENT
      ?auto_25822 - SATELLITE
      ?auto_25821 - DIRECTION
      ?auto_25823 - INSTRUMENT
      ?auto_25824 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25817 ?auto_25814 ) ) ( not ( = ?auto_25819 ?auto_25814 ) ) ( not ( = ?auto_25819 ?auto_25817 ) ) ( ON_BOARD ?auto_25820 ?auto_25822 ) ( SUPPORTS ?auto_25820 ?auto_25815 ) ( not ( = ?auto_25814 ?auto_25821 ) ) ( not ( = ?auto_25819 ?auto_25821 ) ) ( not ( = ?auto_25818 ?auto_25815 ) ) ( CALIBRATION_TARGET ?auto_25820 ?auto_25821 ) ( not ( = ?auto_25821 ?auto_25817 ) ) ( ON_BOARD ?auto_25823 ?auto_25822 ) ( not ( = ?auto_25820 ?auto_25823 ) ) ( SUPPORTS ?auto_25823 ?auto_25816 ) ( not ( = ?auto_25818 ?auto_25816 ) ) ( not ( = ?auto_25815 ?auto_25816 ) ) ( CALIBRATION_TARGET ?auto_25823 ?auto_25821 ) ( ON_BOARD ?auto_25824 ?auto_25822 ) ( POWER_ON ?auto_25824 ) ( not ( = ?auto_25820 ?auto_25824 ) ) ( not ( = ?auto_25823 ?auto_25824 ) ) ( SUPPORTS ?auto_25824 ?auto_25818 ) ( POINTING ?auto_25822 ?auto_25821 ) ( CALIBRATION_TARGET ?auto_25824 ?auto_25821 ) ( NOT_CALIBRATED ?auto_25824 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25819 ?auto_25818 ?auto_25814 ?auto_25815 )
      ( GET-3IMAGE-VERIFY ?auto_25814 ?auto_25815 ?auto_25817 ?auto_25816 ?auto_25819 ?auto_25818 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_25892 - DIRECTION
      ?auto_25893 - MODE
    )
    :vars
    (
      ?auto_25902 - DIRECTION
      ?auto_25895 - INSTRUMENT
      ?auto_25897 - SATELLITE
      ?auto_25896 - DIRECTION
      ?auto_25901 - MODE
      ?auto_25900 - DIRECTION
      ?auto_25898 - INSTRUMENT
      ?auto_25894 - MODE
      ?auto_25899 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25892 ?auto_25902 ) ) ( ON_BOARD ?auto_25895 ?auto_25897 ) ( SUPPORTS ?auto_25895 ?auto_25893 ) ( not ( = ?auto_25892 ?auto_25896 ) ) ( not ( = ?auto_25902 ?auto_25896 ) ) ( not ( = ?auto_25901 ?auto_25893 ) ) ( CALIBRATION_TARGET ?auto_25895 ?auto_25896 ) ( not ( = ?auto_25896 ?auto_25900 ) ) ( not ( = ?auto_25892 ?auto_25900 ) ) ( not ( = ?auto_25902 ?auto_25900 ) ) ( ON_BOARD ?auto_25898 ?auto_25897 ) ( not ( = ?auto_25895 ?auto_25898 ) ) ( SUPPORTS ?auto_25898 ?auto_25894 ) ( not ( = ?auto_25901 ?auto_25894 ) ) ( not ( = ?auto_25893 ?auto_25894 ) ) ( CALIBRATION_TARGET ?auto_25898 ?auto_25896 ) ( ON_BOARD ?auto_25899 ?auto_25897 ) ( not ( = ?auto_25895 ?auto_25899 ) ) ( not ( = ?auto_25898 ?auto_25899 ) ) ( SUPPORTS ?auto_25899 ?auto_25901 ) ( POINTING ?auto_25897 ?auto_25896 ) ( CALIBRATION_TARGET ?auto_25899 ?auto_25896 ) ( POWER_AVAIL ?auto_25897 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_25899 ?auto_25897 )
      ( GET-2IMAGE ?auto_25902 ?auto_25901 ?auto_25892 ?auto_25893 )
      ( GET-1IMAGE-VERIFY ?auto_25892 ?auto_25893 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25903 - DIRECTION
      ?auto_25904 - MODE
      ?auto_25906 - DIRECTION
      ?auto_25905 - MODE
    )
    :vars
    (
      ?auto_25911 - INSTRUMENT
      ?auto_25912 - SATELLITE
      ?auto_25908 - DIRECTION
      ?auto_25910 - DIRECTION
      ?auto_25909 - INSTRUMENT
      ?auto_25913 - MODE
      ?auto_25907 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25906 ?auto_25903 ) ) ( ON_BOARD ?auto_25911 ?auto_25912 ) ( SUPPORTS ?auto_25911 ?auto_25905 ) ( not ( = ?auto_25906 ?auto_25908 ) ) ( not ( = ?auto_25903 ?auto_25908 ) ) ( not ( = ?auto_25904 ?auto_25905 ) ) ( CALIBRATION_TARGET ?auto_25911 ?auto_25908 ) ( not ( = ?auto_25908 ?auto_25910 ) ) ( not ( = ?auto_25906 ?auto_25910 ) ) ( not ( = ?auto_25903 ?auto_25910 ) ) ( ON_BOARD ?auto_25909 ?auto_25912 ) ( not ( = ?auto_25911 ?auto_25909 ) ) ( SUPPORTS ?auto_25909 ?auto_25913 ) ( not ( = ?auto_25904 ?auto_25913 ) ) ( not ( = ?auto_25905 ?auto_25913 ) ) ( CALIBRATION_TARGET ?auto_25909 ?auto_25908 ) ( ON_BOARD ?auto_25907 ?auto_25912 ) ( not ( = ?auto_25911 ?auto_25907 ) ) ( not ( = ?auto_25909 ?auto_25907 ) ) ( SUPPORTS ?auto_25907 ?auto_25904 ) ( POINTING ?auto_25912 ?auto_25908 ) ( CALIBRATION_TARGET ?auto_25907 ?auto_25908 ) ( POWER_AVAIL ?auto_25912 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_25906 ?auto_25905 )
      ( GET-2IMAGE-VERIFY ?auto_25903 ?auto_25904 ?auto_25906 ?auto_25905 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25914 - DIRECTION
      ?auto_25915 - MODE
      ?auto_25917 - DIRECTION
      ?auto_25916 - MODE
    )
    :vars
    (
      ?auto_25924 - DIRECTION
      ?auto_25919 - INSTRUMENT
      ?auto_25921 - SATELLITE
      ?auto_25920 - DIRECTION
      ?auto_25923 - MODE
      ?auto_25918 - INSTRUMENT
      ?auto_25922 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25917 ?auto_25914 ) ) ( not ( = ?auto_25917 ?auto_25924 ) ) ( ON_BOARD ?auto_25919 ?auto_25921 ) ( SUPPORTS ?auto_25919 ?auto_25916 ) ( not ( = ?auto_25917 ?auto_25920 ) ) ( not ( = ?auto_25924 ?auto_25920 ) ) ( not ( = ?auto_25923 ?auto_25916 ) ) ( CALIBRATION_TARGET ?auto_25919 ?auto_25920 ) ( not ( = ?auto_25920 ?auto_25914 ) ) ( not ( = ?auto_25924 ?auto_25914 ) ) ( ON_BOARD ?auto_25918 ?auto_25921 ) ( not ( = ?auto_25919 ?auto_25918 ) ) ( SUPPORTS ?auto_25918 ?auto_25915 ) ( not ( = ?auto_25923 ?auto_25915 ) ) ( not ( = ?auto_25916 ?auto_25915 ) ) ( CALIBRATION_TARGET ?auto_25918 ?auto_25920 ) ( ON_BOARD ?auto_25922 ?auto_25921 ) ( not ( = ?auto_25919 ?auto_25922 ) ) ( not ( = ?auto_25918 ?auto_25922 ) ) ( SUPPORTS ?auto_25922 ?auto_25923 ) ( POINTING ?auto_25921 ?auto_25920 ) ( CALIBRATION_TARGET ?auto_25922 ?auto_25920 ) ( POWER_AVAIL ?auto_25921 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25924 ?auto_25923 ?auto_25917 ?auto_25916 )
      ( GET-2IMAGE-VERIFY ?auto_25914 ?auto_25915 ?auto_25917 ?auto_25916 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25925 - DIRECTION
      ?auto_25926 - MODE
      ?auto_25928 - DIRECTION
      ?auto_25927 - MODE
    )
    :vars
    (
      ?auto_25931 - INSTRUMENT
      ?auto_25933 - SATELLITE
      ?auto_25932 - DIRECTION
      ?auto_25935 - DIRECTION
      ?auto_25930 - INSTRUMENT
      ?auto_25929 - MODE
      ?auto_25934 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25928 ?auto_25925 ) ) ( ON_BOARD ?auto_25931 ?auto_25933 ) ( SUPPORTS ?auto_25931 ?auto_25926 ) ( not ( = ?auto_25925 ?auto_25932 ) ) ( not ( = ?auto_25928 ?auto_25932 ) ) ( not ( = ?auto_25927 ?auto_25926 ) ) ( CALIBRATION_TARGET ?auto_25931 ?auto_25932 ) ( not ( = ?auto_25932 ?auto_25935 ) ) ( not ( = ?auto_25925 ?auto_25935 ) ) ( not ( = ?auto_25928 ?auto_25935 ) ) ( ON_BOARD ?auto_25930 ?auto_25933 ) ( not ( = ?auto_25931 ?auto_25930 ) ) ( SUPPORTS ?auto_25930 ?auto_25929 ) ( not ( = ?auto_25927 ?auto_25929 ) ) ( not ( = ?auto_25926 ?auto_25929 ) ) ( CALIBRATION_TARGET ?auto_25930 ?auto_25932 ) ( ON_BOARD ?auto_25934 ?auto_25933 ) ( not ( = ?auto_25931 ?auto_25934 ) ) ( not ( = ?auto_25930 ?auto_25934 ) ) ( SUPPORTS ?auto_25934 ?auto_25927 ) ( POINTING ?auto_25933 ?auto_25932 ) ( CALIBRATION_TARGET ?auto_25934 ?auto_25932 ) ( POWER_AVAIL ?auto_25933 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25928 ?auto_25927 ?auto_25925 ?auto_25926 )
      ( GET-2IMAGE-VERIFY ?auto_25925 ?auto_25926 ?auto_25928 ?auto_25927 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_25936 - DIRECTION
      ?auto_25937 - MODE
      ?auto_25939 - DIRECTION
      ?auto_25938 - MODE
    )
    :vars
    (
      ?auto_25946 - DIRECTION
      ?auto_25941 - INSTRUMENT
      ?auto_25943 - SATELLITE
      ?auto_25942 - DIRECTION
      ?auto_25945 - MODE
      ?auto_25940 - INSTRUMENT
      ?auto_25944 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25939 ?auto_25936 ) ) ( not ( = ?auto_25936 ?auto_25946 ) ) ( ON_BOARD ?auto_25941 ?auto_25943 ) ( SUPPORTS ?auto_25941 ?auto_25937 ) ( not ( = ?auto_25936 ?auto_25942 ) ) ( not ( = ?auto_25946 ?auto_25942 ) ) ( not ( = ?auto_25945 ?auto_25937 ) ) ( CALIBRATION_TARGET ?auto_25941 ?auto_25942 ) ( not ( = ?auto_25942 ?auto_25939 ) ) ( not ( = ?auto_25946 ?auto_25939 ) ) ( ON_BOARD ?auto_25940 ?auto_25943 ) ( not ( = ?auto_25941 ?auto_25940 ) ) ( SUPPORTS ?auto_25940 ?auto_25938 ) ( not ( = ?auto_25945 ?auto_25938 ) ) ( not ( = ?auto_25937 ?auto_25938 ) ) ( CALIBRATION_TARGET ?auto_25940 ?auto_25942 ) ( ON_BOARD ?auto_25944 ?auto_25943 ) ( not ( = ?auto_25941 ?auto_25944 ) ) ( not ( = ?auto_25940 ?auto_25944 ) ) ( SUPPORTS ?auto_25944 ?auto_25945 ) ( POINTING ?auto_25943 ?auto_25942 ) ( CALIBRATION_TARGET ?auto_25944 ?auto_25942 ) ( POWER_AVAIL ?auto_25943 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25946 ?auto_25945 ?auto_25936 ?auto_25937 )
      ( GET-2IMAGE-VERIFY ?auto_25936 ?auto_25937 ?auto_25939 ?auto_25938 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25973 - DIRECTION
      ?auto_25974 - MODE
      ?auto_25976 - DIRECTION
      ?auto_25975 - MODE
      ?auto_25978 - DIRECTION
      ?auto_25977 - MODE
    )
    :vars
    (
      ?auto_25980 - INSTRUMENT
      ?auto_25982 - SATELLITE
      ?auto_25981 - DIRECTION
      ?auto_25979 - INSTRUMENT
      ?auto_25983 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_25976 ?auto_25973 ) ) ( not ( = ?auto_25978 ?auto_25973 ) ) ( not ( = ?auto_25978 ?auto_25976 ) ) ( ON_BOARD ?auto_25980 ?auto_25982 ) ( SUPPORTS ?auto_25980 ?auto_25977 ) ( not ( = ?auto_25978 ?auto_25981 ) ) ( not ( = ?auto_25973 ?auto_25981 ) ) ( not ( = ?auto_25974 ?auto_25977 ) ) ( CALIBRATION_TARGET ?auto_25980 ?auto_25981 ) ( not ( = ?auto_25981 ?auto_25976 ) ) ( ON_BOARD ?auto_25979 ?auto_25982 ) ( not ( = ?auto_25980 ?auto_25979 ) ) ( SUPPORTS ?auto_25979 ?auto_25975 ) ( not ( = ?auto_25974 ?auto_25975 ) ) ( not ( = ?auto_25977 ?auto_25975 ) ) ( CALIBRATION_TARGET ?auto_25979 ?auto_25981 ) ( ON_BOARD ?auto_25983 ?auto_25982 ) ( not ( = ?auto_25980 ?auto_25983 ) ) ( not ( = ?auto_25979 ?auto_25983 ) ) ( SUPPORTS ?auto_25983 ?auto_25974 ) ( POINTING ?auto_25982 ?auto_25981 ) ( CALIBRATION_TARGET ?auto_25983 ?auto_25981 ) ( POWER_AVAIL ?auto_25982 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25973 ?auto_25974 ?auto_25978 ?auto_25977 )
      ( GET-3IMAGE-VERIFY ?auto_25973 ?auto_25974 ?auto_25976 ?auto_25975 ?auto_25978 ?auto_25977 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_25997 - DIRECTION
      ?auto_25998 - MODE
      ?auto_26000 - DIRECTION
      ?auto_25999 - MODE
      ?auto_26002 - DIRECTION
      ?auto_26001 - MODE
    )
    :vars
    (
      ?auto_26004 - INSTRUMENT
      ?auto_26006 - SATELLITE
      ?auto_26005 - DIRECTION
      ?auto_26003 - INSTRUMENT
      ?auto_26007 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_26000 ?auto_25997 ) ) ( not ( = ?auto_26002 ?auto_25997 ) ) ( not ( = ?auto_26002 ?auto_26000 ) ) ( ON_BOARD ?auto_26004 ?auto_26006 ) ( SUPPORTS ?auto_26004 ?auto_25999 ) ( not ( = ?auto_26000 ?auto_26005 ) ) ( not ( = ?auto_25997 ?auto_26005 ) ) ( not ( = ?auto_25998 ?auto_25999 ) ) ( CALIBRATION_TARGET ?auto_26004 ?auto_26005 ) ( not ( = ?auto_26005 ?auto_26002 ) ) ( ON_BOARD ?auto_26003 ?auto_26006 ) ( not ( = ?auto_26004 ?auto_26003 ) ) ( SUPPORTS ?auto_26003 ?auto_26001 ) ( not ( = ?auto_25998 ?auto_26001 ) ) ( not ( = ?auto_25999 ?auto_26001 ) ) ( CALIBRATION_TARGET ?auto_26003 ?auto_26005 ) ( ON_BOARD ?auto_26007 ?auto_26006 ) ( not ( = ?auto_26004 ?auto_26007 ) ) ( not ( = ?auto_26003 ?auto_26007 ) ) ( SUPPORTS ?auto_26007 ?auto_25998 ) ( POINTING ?auto_26006 ?auto_26005 ) ( CALIBRATION_TARGET ?auto_26007 ?auto_26005 ) ( POWER_AVAIL ?auto_26006 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_25997 ?auto_25998 ?auto_26000 ?auto_25999 )
      ( GET-3IMAGE-VERIFY ?auto_25997 ?auto_25998 ?auto_26000 ?auto_25999 ?auto_26002 ?auto_26001 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26021 - DIRECTION
      ?auto_26022 - MODE
      ?auto_26024 - DIRECTION
      ?auto_26023 - MODE
      ?auto_26026 - DIRECTION
      ?auto_26025 - MODE
    )
    :vars
    (
      ?auto_26028 - INSTRUMENT
      ?auto_26030 - SATELLITE
      ?auto_26029 - DIRECTION
      ?auto_26027 - INSTRUMENT
      ?auto_26031 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_26024 ?auto_26021 ) ) ( not ( = ?auto_26026 ?auto_26021 ) ) ( not ( = ?auto_26026 ?auto_26024 ) ) ( ON_BOARD ?auto_26028 ?auto_26030 ) ( SUPPORTS ?auto_26028 ?auto_26025 ) ( not ( = ?auto_26026 ?auto_26029 ) ) ( not ( = ?auto_26024 ?auto_26029 ) ) ( not ( = ?auto_26023 ?auto_26025 ) ) ( CALIBRATION_TARGET ?auto_26028 ?auto_26029 ) ( not ( = ?auto_26029 ?auto_26021 ) ) ( ON_BOARD ?auto_26027 ?auto_26030 ) ( not ( = ?auto_26028 ?auto_26027 ) ) ( SUPPORTS ?auto_26027 ?auto_26022 ) ( not ( = ?auto_26023 ?auto_26022 ) ) ( not ( = ?auto_26025 ?auto_26022 ) ) ( CALIBRATION_TARGET ?auto_26027 ?auto_26029 ) ( ON_BOARD ?auto_26031 ?auto_26030 ) ( not ( = ?auto_26028 ?auto_26031 ) ) ( not ( = ?auto_26027 ?auto_26031 ) ) ( SUPPORTS ?auto_26031 ?auto_26023 ) ( POINTING ?auto_26030 ?auto_26029 ) ( CALIBRATION_TARGET ?auto_26031 ?auto_26029 ) ( POWER_AVAIL ?auto_26030 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26024 ?auto_26023 ?auto_26026 ?auto_26025 )
      ( GET-3IMAGE-VERIFY ?auto_26021 ?auto_26022 ?auto_26024 ?auto_26023 ?auto_26026 ?auto_26025 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26045 - DIRECTION
      ?auto_26046 - MODE
      ?auto_26048 - DIRECTION
      ?auto_26047 - MODE
      ?auto_26050 - DIRECTION
      ?auto_26049 - MODE
    )
    :vars
    (
      ?auto_26052 - INSTRUMENT
      ?auto_26054 - SATELLITE
      ?auto_26053 - DIRECTION
      ?auto_26051 - INSTRUMENT
      ?auto_26055 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_26048 ?auto_26045 ) ) ( not ( = ?auto_26050 ?auto_26045 ) ) ( not ( = ?auto_26050 ?auto_26048 ) ) ( ON_BOARD ?auto_26052 ?auto_26054 ) ( SUPPORTS ?auto_26052 ?auto_26047 ) ( not ( = ?auto_26048 ?auto_26053 ) ) ( not ( = ?auto_26050 ?auto_26053 ) ) ( not ( = ?auto_26049 ?auto_26047 ) ) ( CALIBRATION_TARGET ?auto_26052 ?auto_26053 ) ( not ( = ?auto_26053 ?auto_26045 ) ) ( ON_BOARD ?auto_26051 ?auto_26054 ) ( not ( = ?auto_26052 ?auto_26051 ) ) ( SUPPORTS ?auto_26051 ?auto_26046 ) ( not ( = ?auto_26049 ?auto_26046 ) ) ( not ( = ?auto_26047 ?auto_26046 ) ) ( CALIBRATION_TARGET ?auto_26051 ?auto_26053 ) ( ON_BOARD ?auto_26055 ?auto_26054 ) ( not ( = ?auto_26052 ?auto_26055 ) ) ( not ( = ?auto_26051 ?auto_26055 ) ) ( SUPPORTS ?auto_26055 ?auto_26049 ) ( POINTING ?auto_26054 ?auto_26053 ) ( CALIBRATION_TARGET ?auto_26055 ?auto_26053 ) ( POWER_AVAIL ?auto_26054 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26050 ?auto_26049 ?auto_26048 ?auto_26047 )
      ( GET-3IMAGE-VERIFY ?auto_26045 ?auto_26046 ?auto_26048 ?auto_26047 ?auto_26050 ?auto_26049 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26095 - DIRECTION
      ?auto_26096 - MODE
      ?auto_26098 - DIRECTION
      ?auto_26097 - MODE
      ?auto_26100 - DIRECTION
      ?auto_26099 - MODE
    )
    :vars
    (
      ?auto_26102 - INSTRUMENT
      ?auto_26104 - SATELLITE
      ?auto_26103 - DIRECTION
      ?auto_26101 - INSTRUMENT
      ?auto_26105 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_26098 ?auto_26095 ) ) ( not ( = ?auto_26100 ?auto_26095 ) ) ( not ( = ?auto_26100 ?auto_26098 ) ) ( ON_BOARD ?auto_26102 ?auto_26104 ) ( SUPPORTS ?auto_26102 ?auto_26096 ) ( not ( = ?auto_26095 ?auto_26103 ) ) ( not ( = ?auto_26098 ?auto_26103 ) ) ( not ( = ?auto_26097 ?auto_26096 ) ) ( CALIBRATION_TARGET ?auto_26102 ?auto_26103 ) ( not ( = ?auto_26103 ?auto_26100 ) ) ( ON_BOARD ?auto_26101 ?auto_26104 ) ( not ( = ?auto_26102 ?auto_26101 ) ) ( SUPPORTS ?auto_26101 ?auto_26099 ) ( not ( = ?auto_26097 ?auto_26099 ) ) ( not ( = ?auto_26096 ?auto_26099 ) ) ( CALIBRATION_TARGET ?auto_26101 ?auto_26103 ) ( ON_BOARD ?auto_26105 ?auto_26104 ) ( not ( = ?auto_26102 ?auto_26105 ) ) ( not ( = ?auto_26101 ?auto_26105 ) ) ( SUPPORTS ?auto_26105 ?auto_26097 ) ( POINTING ?auto_26104 ?auto_26103 ) ( CALIBRATION_TARGET ?auto_26105 ?auto_26103 ) ( POWER_AVAIL ?auto_26104 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26098 ?auto_26097 ?auto_26095 ?auto_26096 )
      ( GET-3IMAGE-VERIFY ?auto_26095 ?auto_26096 ?auto_26098 ?auto_26097 ?auto_26100 ?auto_26099 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26119 - DIRECTION
      ?auto_26120 - MODE
      ?auto_26122 - DIRECTION
      ?auto_26121 - MODE
      ?auto_26124 - DIRECTION
      ?auto_26123 - MODE
    )
    :vars
    (
      ?auto_26126 - INSTRUMENT
      ?auto_26128 - SATELLITE
      ?auto_26127 - DIRECTION
      ?auto_26125 - INSTRUMENT
      ?auto_26129 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_26122 ?auto_26119 ) ) ( not ( = ?auto_26124 ?auto_26119 ) ) ( not ( = ?auto_26124 ?auto_26122 ) ) ( ON_BOARD ?auto_26126 ?auto_26128 ) ( SUPPORTS ?auto_26126 ?auto_26120 ) ( not ( = ?auto_26119 ?auto_26127 ) ) ( not ( = ?auto_26124 ?auto_26127 ) ) ( not ( = ?auto_26123 ?auto_26120 ) ) ( CALIBRATION_TARGET ?auto_26126 ?auto_26127 ) ( not ( = ?auto_26127 ?auto_26122 ) ) ( ON_BOARD ?auto_26125 ?auto_26128 ) ( not ( = ?auto_26126 ?auto_26125 ) ) ( SUPPORTS ?auto_26125 ?auto_26121 ) ( not ( = ?auto_26123 ?auto_26121 ) ) ( not ( = ?auto_26120 ?auto_26121 ) ) ( CALIBRATION_TARGET ?auto_26125 ?auto_26127 ) ( ON_BOARD ?auto_26129 ?auto_26128 ) ( not ( = ?auto_26126 ?auto_26129 ) ) ( not ( = ?auto_26125 ?auto_26129 ) ) ( SUPPORTS ?auto_26129 ?auto_26123 ) ( POINTING ?auto_26128 ?auto_26127 ) ( CALIBRATION_TARGET ?auto_26129 ?auto_26127 ) ( POWER_AVAIL ?auto_26128 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26124 ?auto_26123 ?auto_26119 ?auto_26120 )
      ( GET-3IMAGE-VERIFY ?auto_26119 ?auto_26120 ?auto_26122 ?auto_26121 ?auto_26124 ?auto_26123 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_26197 - DIRECTION
      ?auto_26198 - MODE
    )
    :vars
    (
      ?auto_26207 - DIRECTION
      ?auto_26201 - INSTRUMENT
      ?auto_26203 - SATELLITE
      ?auto_26202 - DIRECTION
      ?auto_26206 - MODE
      ?auto_26205 - DIRECTION
      ?auto_26200 - INSTRUMENT
      ?auto_26199 - MODE
      ?auto_26204 - INSTRUMENT
      ?auto_26208 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_26197 ?auto_26207 ) ) ( ON_BOARD ?auto_26201 ?auto_26203 ) ( SUPPORTS ?auto_26201 ?auto_26198 ) ( not ( = ?auto_26197 ?auto_26202 ) ) ( not ( = ?auto_26207 ?auto_26202 ) ) ( not ( = ?auto_26206 ?auto_26198 ) ) ( CALIBRATION_TARGET ?auto_26201 ?auto_26202 ) ( not ( = ?auto_26202 ?auto_26205 ) ) ( not ( = ?auto_26197 ?auto_26205 ) ) ( not ( = ?auto_26207 ?auto_26205 ) ) ( ON_BOARD ?auto_26200 ?auto_26203 ) ( not ( = ?auto_26201 ?auto_26200 ) ) ( SUPPORTS ?auto_26200 ?auto_26199 ) ( not ( = ?auto_26206 ?auto_26199 ) ) ( not ( = ?auto_26198 ?auto_26199 ) ) ( CALIBRATION_TARGET ?auto_26200 ?auto_26202 ) ( ON_BOARD ?auto_26204 ?auto_26203 ) ( not ( = ?auto_26201 ?auto_26204 ) ) ( not ( = ?auto_26200 ?auto_26204 ) ) ( SUPPORTS ?auto_26204 ?auto_26206 ) ( CALIBRATION_TARGET ?auto_26204 ?auto_26202 ) ( POWER_AVAIL ?auto_26203 ) ( POINTING ?auto_26203 ?auto_26208 ) ( not ( = ?auto_26202 ?auto_26208 ) ) ( not ( = ?auto_26197 ?auto_26208 ) ) ( not ( = ?auto_26207 ?auto_26208 ) ) ( not ( = ?auto_26205 ?auto_26208 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_26203 ?auto_26202 ?auto_26208 )
      ( GET-2IMAGE ?auto_26207 ?auto_26206 ?auto_26197 ?auto_26198 )
      ( GET-1IMAGE-VERIFY ?auto_26197 ?auto_26198 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_26209 - DIRECTION
      ?auto_26210 - MODE
      ?auto_26212 - DIRECTION
      ?auto_26211 - MODE
    )
    :vars
    (
      ?auto_26219 - INSTRUMENT
      ?auto_26214 - SATELLITE
      ?auto_26215 - DIRECTION
      ?auto_26218 - DIRECTION
      ?auto_26217 - INSTRUMENT
      ?auto_26220 - MODE
      ?auto_26213 - INSTRUMENT
      ?auto_26216 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_26212 ?auto_26209 ) ) ( ON_BOARD ?auto_26219 ?auto_26214 ) ( SUPPORTS ?auto_26219 ?auto_26211 ) ( not ( = ?auto_26212 ?auto_26215 ) ) ( not ( = ?auto_26209 ?auto_26215 ) ) ( not ( = ?auto_26210 ?auto_26211 ) ) ( CALIBRATION_TARGET ?auto_26219 ?auto_26215 ) ( not ( = ?auto_26215 ?auto_26218 ) ) ( not ( = ?auto_26212 ?auto_26218 ) ) ( not ( = ?auto_26209 ?auto_26218 ) ) ( ON_BOARD ?auto_26217 ?auto_26214 ) ( not ( = ?auto_26219 ?auto_26217 ) ) ( SUPPORTS ?auto_26217 ?auto_26220 ) ( not ( = ?auto_26210 ?auto_26220 ) ) ( not ( = ?auto_26211 ?auto_26220 ) ) ( CALIBRATION_TARGET ?auto_26217 ?auto_26215 ) ( ON_BOARD ?auto_26213 ?auto_26214 ) ( not ( = ?auto_26219 ?auto_26213 ) ) ( not ( = ?auto_26217 ?auto_26213 ) ) ( SUPPORTS ?auto_26213 ?auto_26210 ) ( CALIBRATION_TARGET ?auto_26213 ?auto_26215 ) ( POWER_AVAIL ?auto_26214 ) ( POINTING ?auto_26214 ?auto_26216 ) ( not ( = ?auto_26215 ?auto_26216 ) ) ( not ( = ?auto_26212 ?auto_26216 ) ) ( not ( = ?auto_26209 ?auto_26216 ) ) ( not ( = ?auto_26218 ?auto_26216 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_26212 ?auto_26211 )
      ( GET-2IMAGE-VERIFY ?auto_26209 ?auto_26210 ?auto_26212 ?auto_26211 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_26221 - DIRECTION
      ?auto_26222 - MODE
      ?auto_26224 - DIRECTION
      ?auto_26223 - MODE
    )
    :vars
    (
      ?auto_26232 - DIRECTION
      ?auto_26230 - INSTRUMENT
      ?auto_26227 - SATELLITE
      ?auto_26225 - DIRECTION
      ?auto_26231 - MODE
      ?auto_26229 - INSTRUMENT
      ?auto_26228 - INSTRUMENT
      ?auto_26226 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_26224 ?auto_26221 ) ) ( not ( = ?auto_26224 ?auto_26232 ) ) ( ON_BOARD ?auto_26230 ?auto_26227 ) ( SUPPORTS ?auto_26230 ?auto_26223 ) ( not ( = ?auto_26224 ?auto_26225 ) ) ( not ( = ?auto_26232 ?auto_26225 ) ) ( not ( = ?auto_26231 ?auto_26223 ) ) ( CALIBRATION_TARGET ?auto_26230 ?auto_26225 ) ( not ( = ?auto_26225 ?auto_26221 ) ) ( not ( = ?auto_26232 ?auto_26221 ) ) ( ON_BOARD ?auto_26229 ?auto_26227 ) ( not ( = ?auto_26230 ?auto_26229 ) ) ( SUPPORTS ?auto_26229 ?auto_26222 ) ( not ( = ?auto_26231 ?auto_26222 ) ) ( not ( = ?auto_26223 ?auto_26222 ) ) ( CALIBRATION_TARGET ?auto_26229 ?auto_26225 ) ( ON_BOARD ?auto_26228 ?auto_26227 ) ( not ( = ?auto_26230 ?auto_26228 ) ) ( not ( = ?auto_26229 ?auto_26228 ) ) ( SUPPORTS ?auto_26228 ?auto_26231 ) ( CALIBRATION_TARGET ?auto_26228 ?auto_26225 ) ( POWER_AVAIL ?auto_26227 ) ( POINTING ?auto_26227 ?auto_26226 ) ( not ( = ?auto_26225 ?auto_26226 ) ) ( not ( = ?auto_26224 ?auto_26226 ) ) ( not ( = ?auto_26232 ?auto_26226 ) ) ( not ( = ?auto_26221 ?auto_26226 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26232 ?auto_26231 ?auto_26224 ?auto_26223 )
      ( GET-2IMAGE-VERIFY ?auto_26221 ?auto_26222 ?auto_26224 ?auto_26223 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_26233 - DIRECTION
      ?auto_26234 - MODE
      ?auto_26236 - DIRECTION
      ?auto_26235 - MODE
    )
    :vars
    (
      ?auto_26243 - INSTRUMENT
      ?auto_26240 - SATELLITE
      ?auto_26237 - DIRECTION
      ?auto_26244 - DIRECTION
      ?auto_26242 - INSTRUMENT
      ?auto_26239 - MODE
      ?auto_26241 - INSTRUMENT
      ?auto_26238 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_26236 ?auto_26233 ) ) ( ON_BOARD ?auto_26243 ?auto_26240 ) ( SUPPORTS ?auto_26243 ?auto_26234 ) ( not ( = ?auto_26233 ?auto_26237 ) ) ( not ( = ?auto_26236 ?auto_26237 ) ) ( not ( = ?auto_26235 ?auto_26234 ) ) ( CALIBRATION_TARGET ?auto_26243 ?auto_26237 ) ( not ( = ?auto_26237 ?auto_26244 ) ) ( not ( = ?auto_26233 ?auto_26244 ) ) ( not ( = ?auto_26236 ?auto_26244 ) ) ( ON_BOARD ?auto_26242 ?auto_26240 ) ( not ( = ?auto_26243 ?auto_26242 ) ) ( SUPPORTS ?auto_26242 ?auto_26239 ) ( not ( = ?auto_26235 ?auto_26239 ) ) ( not ( = ?auto_26234 ?auto_26239 ) ) ( CALIBRATION_TARGET ?auto_26242 ?auto_26237 ) ( ON_BOARD ?auto_26241 ?auto_26240 ) ( not ( = ?auto_26243 ?auto_26241 ) ) ( not ( = ?auto_26242 ?auto_26241 ) ) ( SUPPORTS ?auto_26241 ?auto_26235 ) ( CALIBRATION_TARGET ?auto_26241 ?auto_26237 ) ( POWER_AVAIL ?auto_26240 ) ( POINTING ?auto_26240 ?auto_26238 ) ( not ( = ?auto_26237 ?auto_26238 ) ) ( not ( = ?auto_26233 ?auto_26238 ) ) ( not ( = ?auto_26236 ?auto_26238 ) ) ( not ( = ?auto_26244 ?auto_26238 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26236 ?auto_26235 ?auto_26233 ?auto_26234 )
      ( GET-2IMAGE-VERIFY ?auto_26233 ?auto_26234 ?auto_26236 ?auto_26235 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_26245 - DIRECTION
      ?auto_26246 - MODE
      ?auto_26248 - DIRECTION
      ?auto_26247 - MODE
    )
    :vars
    (
      ?auto_26256 - DIRECTION
      ?auto_26254 - INSTRUMENT
      ?auto_26251 - SATELLITE
      ?auto_26249 - DIRECTION
      ?auto_26255 - MODE
      ?auto_26253 - INSTRUMENT
      ?auto_26252 - INSTRUMENT
      ?auto_26250 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_26248 ?auto_26245 ) ) ( not ( = ?auto_26245 ?auto_26256 ) ) ( ON_BOARD ?auto_26254 ?auto_26251 ) ( SUPPORTS ?auto_26254 ?auto_26246 ) ( not ( = ?auto_26245 ?auto_26249 ) ) ( not ( = ?auto_26256 ?auto_26249 ) ) ( not ( = ?auto_26255 ?auto_26246 ) ) ( CALIBRATION_TARGET ?auto_26254 ?auto_26249 ) ( not ( = ?auto_26249 ?auto_26248 ) ) ( not ( = ?auto_26256 ?auto_26248 ) ) ( ON_BOARD ?auto_26253 ?auto_26251 ) ( not ( = ?auto_26254 ?auto_26253 ) ) ( SUPPORTS ?auto_26253 ?auto_26247 ) ( not ( = ?auto_26255 ?auto_26247 ) ) ( not ( = ?auto_26246 ?auto_26247 ) ) ( CALIBRATION_TARGET ?auto_26253 ?auto_26249 ) ( ON_BOARD ?auto_26252 ?auto_26251 ) ( not ( = ?auto_26254 ?auto_26252 ) ) ( not ( = ?auto_26253 ?auto_26252 ) ) ( SUPPORTS ?auto_26252 ?auto_26255 ) ( CALIBRATION_TARGET ?auto_26252 ?auto_26249 ) ( POWER_AVAIL ?auto_26251 ) ( POINTING ?auto_26251 ?auto_26250 ) ( not ( = ?auto_26249 ?auto_26250 ) ) ( not ( = ?auto_26245 ?auto_26250 ) ) ( not ( = ?auto_26256 ?auto_26250 ) ) ( not ( = ?auto_26248 ?auto_26250 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26256 ?auto_26255 ?auto_26245 ?auto_26246 )
      ( GET-2IMAGE-VERIFY ?auto_26245 ?auto_26246 ?auto_26248 ?auto_26247 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26285 - DIRECTION
      ?auto_26286 - MODE
      ?auto_26288 - DIRECTION
      ?auto_26287 - MODE
      ?auto_26290 - DIRECTION
      ?auto_26289 - MODE
    )
    :vars
    (
      ?auto_26296 - INSTRUMENT
      ?auto_26293 - SATELLITE
      ?auto_26291 - DIRECTION
      ?auto_26295 - INSTRUMENT
      ?auto_26294 - INSTRUMENT
      ?auto_26292 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_26288 ?auto_26285 ) ) ( not ( = ?auto_26290 ?auto_26285 ) ) ( not ( = ?auto_26290 ?auto_26288 ) ) ( ON_BOARD ?auto_26296 ?auto_26293 ) ( SUPPORTS ?auto_26296 ?auto_26289 ) ( not ( = ?auto_26290 ?auto_26291 ) ) ( not ( = ?auto_26285 ?auto_26291 ) ) ( not ( = ?auto_26286 ?auto_26289 ) ) ( CALIBRATION_TARGET ?auto_26296 ?auto_26291 ) ( not ( = ?auto_26291 ?auto_26288 ) ) ( ON_BOARD ?auto_26295 ?auto_26293 ) ( not ( = ?auto_26296 ?auto_26295 ) ) ( SUPPORTS ?auto_26295 ?auto_26287 ) ( not ( = ?auto_26286 ?auto_26287 ) ) ( not ( = ?auto_26289 ?auto_26287 ) ) ( CALIBRATION_TARGET ?auto_26295 ?auto_26291 ) ( ON_BOARD ?auto_26294 ?auto_26293 ) ( not ( = ?auto_26296 ?auto_26294 ) ) ( not ( = ?auto_26295 ?auto_26294 ) ) ( SUPPORTS ?auto_26294 ?auto_26286 ) ( CALIBRATION_TARGET ?auto_26294 ?auto_26291 ) ( POWER_AVAIL ?auto_26293 ) ( POINTING ?auto_26293 ?auto_26292 ) ( not ( = ?auto_26291 ?auto_26292 ) ) ( not ( = ?auto_26290 ?auto_26292 ) ) ( not ( = ?auto_26285 ?auto_26292 ) ) ( not ( = ?auto_26288 ?auto_26292 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26285 ?auto_26286 ?auto_26290 ?auto_26289 )
      ( GET-3IMAGE-VERIFY ?auto_26285 ?auto_26286 ?auto_26288 ?auto_26287 ?auto_26290 ?auto_26289 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26311 - DIRECTION
      ?auto_26312 - MODE
      ?auto_26314 - DIRECTION
      ?auto_26313 - MODE
      ?auto_26316 - DIRECTION
      ?auto_26315 - MODE
    )
    :vars
    (
      ?auto_26322 - INSTRUMENT
      ?auto_26319 - SATELLITE
      ?auto_26317 - DIRECTION
      ?auto_26321 - INSTRUMENT
      ?auto_26320 - INSTRUMENT
      ?auto_26318 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_26314 ?auto_26311 ) ) ( not ( = ?auto_26316 ?auto_26311 ) ) ( not ( = ?auto_26316 ?auto_26314 ) ) ( ON_BOARD ?auto_26322 ?auto_26319 ) ( SUPPORTS ?auto_26322 ?auto_26313 ) ( not ( = ?auto_26314 ?auto_26317 ) ) ( not ( = ?auto_26311 ?auto_26317 ) ) ( not ( = ?auto_26312 ?auto_26313 ) ) ( CALIBRATION_TARGET ?auto_26322 ?auto_26317 ) ( not ( = ?auto_26317 ?auto_26316 ) ) ( ON_BOARD ?auto_26321 ?auto_26319 ) ( not ( = ?auto_26322 ?auto_26321 ) ) ( SUPPORTS ?auto_26321 ?auto_26315 ) ( not ( = ?auto_26312 ?auto_26315 ) ) ( not ( = ?auto_26313 ?auto_26315 ) ) ( CALIBRATION_TARGET ?auto_26321 ?auto_26317 ) ( ON_BOARD ?auto_26320 ?auto_26319 ) ( not ( = ?auto_26322 ?auto_26320 ) ) ( not ( = ?auto_26321 ?auto_26320 ) ) ( SUPPORTS ?auto_26320 ?auto_26312 ) ( CALIBRATION_TARGET ?auto_26320 ?auto_26317 ) ( POWER_AVAIL ?auto_26319 ) ( POINTING ?auto_26319 ?auto_26318 ) ( not ( = ?auto_26317 ?auto_26318 ) ) ( not ( = ?auto_26314 ?auto_26318 ) ) ( not ( = ?auto_26311 ?auto_26318 ) ) ( not ( = ?auto_26316 ?auto_26318 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26311 ?auto_26312 ?auto_26314 ?auto_26313 )
      ( GET-3IMAGE-VERIFY ?auto_26311 ?auto_26312 ?auto_26314 ?auto_26313 ?auto_26316 ?auto_26315 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26337 - DIRECTION
      ?auto_26338 - MODE
      ?auto_26340 - DIRECTION
      ?auto_26339 - MODE
      ?auto_26342 - DIRECTION
      ?auto_26341 - MODE
    )
    :vars
    (
      ?auto_26348 - INSTRUMENT
      ?auto_26345 - SATELLITE
      ?auto_26343 - DIRECTION
      ?auto_26347 - INSTRUMENT
      ?auto_26346 - INSTRUMENT
      ?auto_26344 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_26340 ?auto_26337 ) ) ( not ( = ?auto_26342 ?auto_26337 ) ) ( not ( = ?auto_26342 ?auto_26340 ) ) ( ON_BOARD ?auto_26348 ?auto_26345 ) ( SUPPORTS ?auto_26348 ?auto_26341 ) ( not ( = ?auto_26342 ?auto_26343 ) ) ( not ( = ?auto_26340 ?auto_26343 ) ) ( not ( = ?auto_26339 ?auto_26341 ) ) ( CALIBRATION_TARGET ?auto_26348 ?auto_26343 ) ( not ( = ?auto_26343 ?auto_26337 ) ) ( ON_BOARD ?auto_26347 ?auto_26345 ) ( not ( = ?auto_26348 ?auto_26347 ) ) ( SUPPORTS ?auto_26347 ?auto_26338 ) ( not ( = ?auto_26339 ?auto_26338 ) ) ( not ( = ?auto_26341 ?auto_26338 ) ) ( CALIBRATION_TARGET ?auto_26347 ?auto_26343 ) ( ON_BOARD ?auto_26346 ?auto_26345 ) ( not ( = ?auto_26348 ?auto_26346 ) ) ( not ( = ?auto_26347 ?auto_26346 ) ) ( SUPPORTS ?auto_26346 ?auto_26339 ) ( CALIBRATION_TARGET ?auto_26346 ?auto_26343 ) ( POWER_AVAIL ?auto_26345 ) ( POINTING ?auto_26345 ?auto_26344 ) ( not ( = ?auto_26343 ?auto_26344 ) ) ( not ( = ?auto_26342 ?auto_26344 ) ) ( not ( = ?auto_26340 ?auto_26344 ) ) ( not ( = ?auto_26337 ?auto_26344 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26340 ?auto_26339 ?auto_26342 ?auto_26341 )
      ( GET-3IMAGE-VERIFY ?auto_26337 ?auto_26338 ?auto_26340 ?auto_26339 ?auto_26342 ?auto_26341 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26363 - DIRECTION
      ?auto_26364 - MODE
      ?auto_26366 - DIRECTION
      ?auto_26365 - MODE
      ?auto_26368 - DIRECTION
      ?auto_26367 - MODE
    )
    :vars
    (
      ?auto_26374 - INSTRUMENT
      ?auto_26371 - SATELLITE
      ?auto_26369 - DIRECTION
      ?auto_26373 - INSTRUMENT
      ?auto_26372 - INSTRUMENT
      ?auto_26370 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_26366 ?auto_26363 ) ) ( not ( = ?auto_26368 ?auto_26363 ) ) ( not ( = ?auto_26368 ?auto_26366 ) ) ( ON_BOARD ?auto_26374 ?auto_26371 ) ( SUPPORTS ?auto_26374 ?auto_26365 ) ( not ( = ?auto_26366 ?auto_26369 ) ) ( not ( = ?auto_26368 ?auto_26369 ) ) ( not ( = ?auto_26367 ?auto_26365 ) ) ( CALIBRATION_TARGET ?auto_26374 ?auto_26369 ) ( not ( = ?auto_26369 ?auto_26363 ) ) ( ON_BOARD ?auto_26373 ?auto_26371 ) ( not ( = ?auto_26374 ?auto_26373 ) ) ( SUPPORTS ?auto_26373 ?auto_26364 ) ( not ( = ?auto_26367 ?auto_26364 ) ) ( not ( = ?auto_26365 ?auto_26364 ) ) ( CALIBRATION_TARGET ?auto_26373 ?auto_26369 ) ( ON_BOARD ?auto_26372 ?auto_26371 ) ( not ( = ?auto_26374 ?auto_26372 ) ) ( not ( = ?auto_26373 ?auto_26372 ) ) ( SUPPORTS ?auto_26372 ?auto_26367 ) ( CALIBRATION_TARGET ?auto_26372 ?auto_26369 ) ( POWER_AVAIL ?auto_26371 ) ( POINTING ?auto_26371 ?auto_26370 ) ( not ( = ?auto_26369 ?auto_26370 ) ) ( not ( = ?auto_26366 ?auto_26370 ) ) ( not ( = ?auto_26368 ?auto_26370 ) ) ( not ( = ?auto_26363 ?auto_26370 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26368 ?auto_26367 ?auto_26366 ?auto_26365 )
      ( GET-3IMAGE-VERIFY ?auto_26363 ?auto_26364 ?auto_26366 ?auto_26365 ?auto_26368 ?auto_26367 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26417 - DIRECTION
      ?auto_26418 - MODE
      ?auto_26420 - DIRECTION
      ?auto_26419 - MODE
      ?auto_26422 - DIRECTION
      ?auto_26421 - MODE
    )
    :vars
    (
      ?auto_26428 - INSTRUMENT
      ?auto_26425 - SATELLITE
      ?auto_26423 - DIRECTION
      ?auto_26427 - INSTRUMENT
      ?auto_26426 - INSTRUMENT
      ?auto_26424 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_26420 ?auto_26417 ) ) ( not ( = ?auto_26422 ?auto_26417 ) ) ( not ( = ?auto_26422 ?auto_26420 ) ) ( ON_BOARD ?auto_26428 ?auto_26425 ) ( SUPPORTS ?auto_26428 ?auto_26418 ) ( not ( = ?auto_26417 ?auto_26423 ) ) ( not ( = ?auto_26420 ?auto_26423 ) ) ( not ( = ?auto_26419 ?auto_26418 ) ) ( CALIBRATION_TARGET ?auto_26428 ?auto_26423 ) ( not ( = ?auto_26423 ?auto_26422 ) ) ( ON_BOARD ?auto_26427 ?auto_26425 ) ( not ( = ?auto_26428 ?auto_26427 ) ) ( SUPPORTS ?auto_26427 ?auto_26421 ) ( not ( = ?auto_26419 ?auto_26421 ) ) ( not ( = ?auto_26418 ?auto_26421 ) ) ( CALIBRATION_TARGET ?auto_26427 ?auto_26423 ) ( ON_BOARD ?auto_26426 ?auto_26425 ) ( not ( = ?auto_26428 ?auto_26426 ) ) ( not ( = ?auto_26427 ?auto_26426 ) ) ( SUPPORTS ?auto_26426 ?auto_26419 ) ( CALIBRATION_TARGET ?auto_26426 ?auto_26423 ) ( POWER_AVAIL ?auto_26425 ) ( POINTING ?auto_26425 ?auto_26424 ) ( not ( = ?auto_26423 ?auto_26424 ) ) ( not ( = ?auto_26417 ?auto_26424 ) ) ( not ( = ?auto_26420 ?auto_26424 ) ) ( not ( = ?auto_26422 ?auto_26424 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26420 ?auto_26419 ?auto_26417 ?auto_26418 )
      ( GET-3IMAGE-VERIFY ?auto_26417 ?auto_26418 ?auto_26420 ?auto_26419 ?auto_26422 ?auto_26421 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_26443 - DIRECTION
      ?auto_26444 - MODE
      ?auto_26446 - DIRECTION
      ?auto_26445 - MODE
      ?auto_26448 - DIRECTION
      ?auto_26447 - MODE
    )
    :vars
    (
      ?auto_26454 - INSTRUMENT
      ?auto_26451 - SATELLITE
      ?auto_26449 - DIRECTION
      ?auto_26453 - INSTRUMENT
      ?auto_26452 - INSTRUMENT
      ?auto_26450 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_26446 ?auto_26443 ) ) ( not ( = ?auto_26448 ?auto_26443 ) ) ( not ( = ?auto_26448 ?auto_26446 ) ) ( ON_BOARD ?auto_26454 ?auto_26451 ) ( SUPPORTS ?auto_26454 ?auto_26444 ) ( not ( = ?auto_26443 ?auto_26449 ) ) ( not ( = ?auto_26448 ?auto_26449 ) ) ( not ( = ?auto_26447 ?auto_26444 ) ) ( CALIBRATION_TARGET ?auto_26454 ?auto_26449 ) ( not ( = ?auto_26449 ?auto_26446 ) ) ( ON_BOARD ?auto_26453 ?auto_26451 ) ( not ( = ?auto_26454 ?auto_26453 ) ) ( SUPPORTS ?auto_26453 ?auto_26445 ) ( not ( = ?auto_26447 ?auto_26445 ) ) ( not ( = ?auto_26444 ?auto_26445 ) ) ( CALIBRATION_TARGET ?auto_26453 ?auto_26449 ) ( ON_BOARD ?auto_26452 ?auto_26451 ) ( not ( = ?auto_26454 ?auto_26452 ) ) ( not ( = ?auto_26453 ?auto_26452 ) ) ( SUPPORTS ?auto_26452 ?auto_26447 ) ( CALIBRATION_TARGET ?auto_26452 ?auto_26449 ) ( POWER_AVAIL ?auto_26451 ) ( POINTING ?auto_26451 ?auto_26450 ) ( not ( = ?auto_26449 ?auto_26450 ) ) ( not ( = ?auto_26443 ?auto_26450 ) ) ( not ( = ?auto_26448 ?auto_26450 ) ) ( not ( = ?auto_26446 ?auto_26450 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26448 ?auto_26447 ?auto_26443 ?auto_26444 )
      ( GET-3IMAGE-VERIFY ?auto_26443 ?auto_26444 ?auto_26446 ?auto_26445 ?auto_26448 ?auto_26447 ) )
  )

)

