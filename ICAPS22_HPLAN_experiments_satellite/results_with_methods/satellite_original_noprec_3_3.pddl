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
      ?auto_20518 - INSTRUMENT
      ?auto_20517 - SATELLITE
      ?auto_20519 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20518 ?auto_20517 ) ( SUPPORTS ?auto_20518 ?auto_20516 ) ( POWER_ON ?auto_20518 ) ( POINTING ?auto_20517 ?auto_20519 ) ( not ( = ?auto_20515 ?auto_20519 ) ) ( CALIBRATION_TARGET ?auto_20518 ?auto_20519 ) ( NOT_CALIBRATED ?auto_20518 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_20517 ?auto_20518 ?auto_20519 )
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
      ?auto_20538 - INSTRUMENT
      ?auto_20539 - SATELLITE
      ?auto_20540 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20538 ?auto_20539 ) ( SUPPORTS ?auto_20538 ?auto_20537 ) ( POINTING ?auto_20539 ?auto_20540 ) ( not ( = ?auto_20536 ?auto_20540 ) ) ( CALIBRATION_TARGET ?auto_20538 ?auto_20540 ) ( POWER_AVAIL ?auto_20539 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_20538 ?auto_20539 )
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
      ?auto_20559 - SATELLITE
      ?auto_20561 - DIRECTION
      ?auto_20562 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20560 ?auto_20559 ) ( SUPPORTS ?auto_20560 ?auto_20558 ) ( not ( = ?auto_20557 ?auto_20561 ) ) ( CALIBRATION_TARGET ?auto_20560 ?auto_20561 ) ( POWER_AVAIL ?auto_20559 ) ( POINTING ?auto_20559 ?auto_20562 ) ( not ( = ?auto_20561 ?auto_20562 ) ) ( not ( = ?auto_20557 ?auto_20562 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_20559 ?auto_20561 ?auto_20562 )
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
      ?auto_20645 - INSTRUMENT
      ?auto_20646 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_20645 ) ( ON_BOARD ?auto_20645 ?auto_20646 ) ( SUPPORTS ?auto_20645 ?auto_20643 ) ( POWER_ON ?auto_20645 ) ( POINTING ?auto_20646 ?auto_20644 ) ( HAVE_IMAGE ?auto_20641 ?auto_20642 ) ( not ( = ?auto_20641 ?auto_20644 ) ) ( not ( = ?auto_20642 ?auto_20643 ) ) )
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
      ?auto_20651 - INSTRUMENT
      ?auto_20652 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_20651 ) ( ON_BOARD ?auto_20651 ?auto_20652 ) ( SUPPORTS ?auto_20651 ?auto_20648 ) ( POWER_ON ?auto_20651 ) ( POINTING ?auto_20652 ?auto_20647 ) ( HAVE_IMAGE ?auto_20650 ?auto_20649 ) ( not ( = ?auto_20647 ?auto_20650 ) ) ( not ( = ?auto_20648 ?auto_20649 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_20647 ?auto_20648 )
      ( GET-2IMAGE-VERIFY ?auto_20647 ?auto_20648 ?auto_20650 ?auto_20649 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20659 - DIRECTION
      ?auto_20660 - MODE
      ?auto_20662 - DIRECTION
      ?auto_20661 - MODE
      ?auto_20664 - DIRECTION
      ?auto_20663 - MODE
    )
    :vars
    (
      ?auto_20665 - INSTRUMENT
      ?auto_20666 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_20665 ) ( ON_BOARD ?auto_20665 ?auto_20666 ) ( SUPPORTS ?auto_20665 ?auto_20663 ) ( POWER_ON ?auto_20665 ) ( POINTING ?auto_20666 ?auto_20664 ) ( HAVE_IMAGE ?auto_20659 ?auto_20660 ) ( HAVE_IMAGE ?auto_20662 ?auto_20661 ) ( not ( = ?auto_20659 ?auto_20662 ) ) ( not ( = ?auto_20659 ?auto_20664 ) ) ( not ( = ?auto_20660 ?auto_20661 ) ) ( not ( = ?auto_20660 ?auto_20663 ) ) ( not ( = ?auto_20662 ?auto_20664 ) ) ( not ( = ?auto_20661 ?auto_20663 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_20664 ?auto_20663 )
      ( GET-3IMAGE-VERIFY ?auto_20659 ?auto_20660 ?auto_20662 ?auto_20661 ?auto_20664 ?auto_20663 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20667 - DIRECTION
      ?auto_20668 - MODE
      ?auto_20670 - DIRECTION
      ?auto_20669 - MODE
      ?auto_20672 - DIRECTION
      ?auto_20671 - MODE
    )
    :vars
    (
      ?auto_20673 - INSTRUMENT
      ?auto_20674 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_20673 ) ( ON_BOARD ?auto_20673 ?auto_20674 ) ( SUPPORTS ?auto_20673 ?auto_20669 ) ( POWER_ON ?auto_20673 ) ( POINTING ?auto_20674 ?auto_20670 ) ( HAVE_IMAGE ?auto_20667 ?auto_20668 ) ( HAVE_IMAGE ?auto_20672 ?auto_20671 ) ( not ( = ?auto_20667 ?auto_20670 ) ) ( not ( = ?auto_20667 ?auto_20672 ) ) ( not ( = ?auto_20668 ?auto_20669 ) ) ( not ( = ?auto_20668 ?auto_20671 ) ) ( not ( = ?auto_20670 ?auto_20672 ) ) ( not ( = ?auto_20669 ?auto_20671 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_20670 ?auto_20669 )
      ( GET-3IMAGE-VERIFY ?auto_20667 ?auto_20668 ?auto_20670 ?auto_20669 ?auto_20672 ?auto_20671 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20683 - DIRECTION
      ?auto_20684 - MODE
      ?auto_20686 - DIRECTION
      ?auto_20685 - MODE
      ?auto_20688 - DIRECTION
      ?auto_20687 - MODE
    )
    :vars
    (
      ?auto_20689 - INSTRUMENT
      ?auto_20690 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_20689 ) ( ON_BOARD ?auto_20689 ?auto_20690 ) ( SUPPORTS ?auto_20689 ?auto_20684 ) ( POWER_ON ?auto_20689 ) ( POINTING ?auto_20690 ?auto_20683 ) ( HAVE_IMAGE ?auto_20686 ?auto_20685 ) ( HAVE_IMAGE ?auto_20688 ?auto_20687 ) ( not ( = ?auto_20683 ?auto_20686 ) ) ( not ( = ?auto_20683 ?auto_20688 ) ) ( not ( = ?auto_20684 ?auto_20685 ) ) ( not ( = ?auto_20684 ?auto_20687 ) ) ( not ( = ?auto_20686 ?auto_20688 ) ) ( not ( = ?auto_20685 ?auto_20687 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_20683 ?auto_20684 )
      ( GET-3IMAGE-VERIFY ?auto_20683 ?auto_20684 ?auto_20686 ?auto_20685 ?auto_20688 ?auto_20687 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_20715 - DIRECTION
      ?auto_20716 - MODE
    )
    :vars
    (
      ?auto_20717 - INSTRUMENT
      ?auto_20718 - SATELLITE
      ?auto_20719 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_20717 ) ( ON_BOARD ?auto_20717 ?auto_20718 ) ( SUPPORTS ?auto_20717 ?auto_20716 ) ( POWER_ON ?auto_20717 ) ( POINTING ?auto_20718 ?auto_20719 ) ( not ( = ?auto_20715 ?auto_20719 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_20718 ?auto_20715 ?auto_20719 )
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
      ?auto_20725 - SATELLITE
      ?auto_20724 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_20726 ) ( ON_BOARD ?auto_20726 ?auto_20725 ) ( SUPPORTS ?auto_20726 ?auto_20722 ) ( POWER_ON ?auto_20726 ) ( POINTING ?auto_20725 ?auto_20724 ) ( not ( = ?auto_20723 ?auto_20724 ) ) ( HAVE_IMAGE ?auto_20720 ?auto_20721 ) ( not ( = ?auto_20720 ?auto_20723 ) ) ( not ( = ?auto_20720 ?auto_20724 ) ) ( not ( = ?auto_20721 ?auto_20722 ) ) )
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
      ?auto_20732 - INSTRUMENT
      ?auto_20733 - SATELLITE
      ?auto_20731 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_20732 ) ( ON_BOARD ?auto_20732 ?auto_20733 ) ( SUPPORTS ?auto_20732 ?auto_20728 ) ( POWER_ON ?auto_20732 ) ( POINTING ?auto_20733 ?auto_20731 ) ( not ( = ?auto_20727 ?auto_20731 ) ) ( HAVE_IMAGE ?auto_20730 ?auto_20729 ) ( not ( = ?auto_20730 ?auto_20727 ) ) ( not ( = ?auto_20730 ?auto_20731 ) ) ( not ( = ?auto_20729 ?auto_20728 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20730 ?auto_20729 ?auto_20727 ?auto_20728 )
      ( GET-2IMAGE-VERIFY ?auto_20727 ?auto_20728 ?auto_20730 ?auto_20729 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20743 - DIRECTION
      ?auto_20744 - MODE
      ?auto_20746 - DIRECTION
      ?auto_20745 - MODE
      ?auto_20748 - DIRECTION
      ?auto_20747 - MODE
    )
    :vars
    (
      ?auto_20750 - INSTRUMENT
      ?auto_20751 - SATELLITE
      ?auto_20749 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_20750 ) ( ON_BOARD ?auto_20750 ?auto_20751 ) ( SUPPORTS ?auto_20750 ?auto_20747 ) ( POWER_ON ?auto_20750 ) ( POINTING ?auto_20751 ?auto_20749 ) ( not ( = ?auto_20748 ?auto_20749 ) ) ( HAVE_IMAGE ?auto_20746 ?auto_20744 ) ( not ( = ?auto_20746 ?auto_20748 ) ) ( not ( = ?auto_20746 ?auto_20749 ) ) ( not ( = ?auto_20744 ?auto_20747 ) ) ( HAVE_IMAGE ?auto_20743 ?auto_20744 ) ( HAVE_IMAGE ?auto_20746 ?auto_20745 ) ( not ( = ?auto_20743 ?auto_20746 ) ) ( not ( = ?auto_20743 ?auto_20748 ) ) ( not ( = ?auto_20743 ?auto_20749 ) ) ( not ( = ?auto_20744 ?auto_20745 ) ) ( not ( = ?auto_20745 ?auto_20747 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20746 ?auto_20744 ?auto_20748 ?auto_20747 )
      ( GET-3IMAGE-VERIFY ?auto_20743 ?auto_20744 ?auto_20746 ?auto_20745 ?auto_20748 ?auto_20747 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20752 - DIRECTION
      ?auto_20753 - MODE
      ?auto_20755 - DIRECTION
      ?auto_20754 - MODE
      ?auto_20757 - DIRECTION
      ?auto_20756 - MODE
    )
    :vars
    (
      ?auto_20759 - INSTRUMENT
      ?auto_20760 - SATELLITE
      ?auto_20758 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_20759 ) ( ON_BOARD ?auto_20759 ?auto_20760 ) ( SUPPORTS ?auto_20759 ?auto_20754 ) ( POWER_ON ?auto_20759 ) ( POINTING ?auto_20760 ?auto_20758 ) ( not ( = ?auto_20755 ?auto_20758 ) ) ( HAVE_IMAGE ?auto_20752 ?auto_20756 ) ( not ( = ?auto_20752 ?auto_20755 ) ) ( not ( = ?auto_20752 ?auto_20758 ) ) ( not ( = ?auto_20756 ?auto_20754 ) ) ( HAVE_IMAGE ?auto_20752 ?auto_20753 ) ( HAVE_IMAGE ?auto_20757 ?auto_20756 ) ( not ( = ?auto_20752 ?auto_20757 ) ) ( not ( = ?auto_20753 ?auto_20754 ) ) ( not ( = ?auto_20753 ?auto_20756 ) ) ( not ( = ?auto_20755 ?auto_20757 ) ) ( not ( = ?auto_20757 ?auto_20758 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20752 ?auto_20756 ?auto_20755 ?auto_20754 )
      ( GET-3IMAGE-VERIFY ?auto_20752 ?auto_20753 ?auto_20755 ?auto_20754 ?auto_20757 ?auto_20756 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20770 - DIRECTION
      ?auto_20771 - MODE
      ?auto_20773 - DIRECTION
      ?auto_20772 - MODE
      ?auto_20775 - DIRECTION
      ?auto_20774 - MODE
    )
    :vars
    (
      ?auto_20777 - INSTRUMENT
      ?auto_20778 - SATELLITE
      ?auto_20776 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_20777 ) ( ON_BOARD ?auto_20777 ?auto_20778 ) ( SUPPORTS ?auto_20777 ?auto_20771 ) ( POWER_ON ?auto_20777 ) ( POINTING ?auto_20778 ?auto_20776 ) ( not ( = ?auto_20770 ?auto_20776 ) ) ( HAVE_IMAGE ?auto_20773 ?auto_20772 ) ( not ( = ?auto_20773 ?auto_20770 ) ) ( not ( = ?auto_20773 ?auto_20776 ) ) ( not ( = ?auto_20772 ?auto_20771 ) ) ( HAVE_IMAGE ?auto_20775 ?auto_20774 ) ( not ( = ?auto_20770 ?auto_20775 ) ) ( not ( = ?auto_20771 ?auto_20774 ) ) ( not ( = ?auto_20773 ?auto_20775 ) ) ( not ( = ?auto_20772 ?auto_20774 ) ) ( not ( = ?auto_20775 ?auto_20776 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20773 ?auto_20772 ?auto_20770 ?auto_20771 )
      ( GET-3IMAGE-VERIFY ?auto_20770 ?auto_20771 ?auto_20773 ?auto_20772 ?auto_20775 ?auto_20774 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_20808 - DIRECTION
      ?auto_20809 - MODE
    )
    :vars
    (
      ?auto_20811 - INSTRUMENT
      ?auto_20812 - SATELLITE
      ?auto_20810 - DIRECTION
      ?auto_20813 - DIRECTION
      ?auto_20814 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_20811 ?auto_20812 ) ( SUPPORTS ?auto_20811 ?auto_20809 ) ( POWER_ON ?auto_20811 ) ( POINTING ?auto_20812 ?auto_20810 ) ( not ( = ?auto_20808 ?auto_20810 ) ) ( HAVE_IMAGE ?auto_20813 ?auto_20814 ) ( not ( = ?auto_20813 ?auto_20808 ) ) ( not ( = ?auto_20813 ?auto_20810 ) ) ( not ( = ?auto_20814 ?auto_20809 ) ) ( CALIBRATION_TARGET ?auto_20811 ?auto_20810 ) ( NOT_CALIBRATED ?auto_20811 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_20812 ?auto_20811 ?auto_20810 )
      ( GET-2IMAGE ?auto_20813 ?auto_20814 ?auto_20808 ?auto_20809 )
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
      ?auto_20821 - INSTRUMENT
      ?auto_20820 - SATELLITE
      ?auto_20819 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20821 ?auto_20820 ) ( SUPPORTS ?auto_20821 ?auto_20817 ) ( POWER_ON ?auto_20821 ) ( POINTING ?auto_20820 ?auto_20819 ) ( not ( = ?auto_20818 ?auto_20819 ) ) ( HAVE_IMAGE ?auto_20815 ?auto_20816 ) ( not ( = ?auto_20815 ?auto_20818 ) ) ( not ( = ?auto_20815 ?auto_20819 ) ) ( not ( = ?auto_20816 ?auto_20817 ) ) ( CALIBRATION_TARGET ?auto_20821 ?auto_20819 ) ( NOT_CALIBRATED ?auto_20821 ) )
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
      ?auto_20826 - INSTRUMENT
      ?auto_20827 - SATELLITE
      ?auto_20828 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20826 ?auto_20827 ) ( SUPPORTS ?auto_20826 ?auto_20823 ) ( POWER_ON ?auto_20826 ) ( POINTING ?auto_20827 ?auto_20828 ) ( not ( = ?auto_20822 ?auto_20828 ) ) ( HAVE_IMAGE ?auto_20825 ?auto_20824 ) ( not ( = ?auto_20825 ?auto_20822 ) ) ( not ( = ?auto_20825 ?auto_20828 ) ) ( not ( = ?auto_20824 ?auto_20823 ) ) ( CALIBRATION_TARGET ?auto_20826 ?auto_20828 ) ( NOT_CALIBRATED ?auto_20826 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20825 ?auto_20824 ?auto_20822 ?auto_20823 )
      ( GET-2IMAGE-VERIFY ?auto_20822 ?auto_20823 ?auto_20825 ?auto_20824 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20838 - DIRECTION
      ?auto_20839 - MODE
      ?auto_20841 - DIRECTION
      ?auto_20840 - MODE
      ?auto_20843 - DIRECTION
      ?auto_20842 - MODE
    )
    :vars
    (
      ?auto_20844 - INSTRUMENT
      ?auto_20845 - SATELLITE
      ?auto_20846 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20844 ?auto_20845 ) ( SUPPORTS ?auto_20844 ?auto_20842 ) ( POWER_ON ?auto_20844 ) ( POINTING ?auto_20845 ?auto_20846 ) ( not ( = ?auto_20843 ?auto_20846 ) ) ( HAVE_IMAGE ?auto_20841 ?auto_20840 ) ( not ( = ?auto_20841 ?auto_20843 ) ) ( not ( = ?auto_20841 ?auto_20846 ) ) ( not ( = ?auto_20840 ?auto_20842 ) ) ( CALIBRATION_TARGET ?auto_20844 ?auto_20846 ) ( NOT_CALIBRATED ?auto_20844 ) ( HAVE_IMAGE ?auto_20838 ?auto_20839 ) ( not ( = ?auto_20838 ?auto_20841 ) ) ( not ( = ?auto_20838 ?auto_20843 ) ) ( not ( = ?auto_20838 ?auto_20846 ) ) ( not ( = ?auto_20839 ?auto_20840 ) ) ( not ( = ?auto_20839 ?auto_20842 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20841 ?auto_20840 ?auto_20843 ?auto_20842 )
      ( GET-3IMAGE-VERIFY ?auto_20838 ?auto_20839 ?auto_20841 ?auto_20840 ?auto_20843 ?auto_20842 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20847 - DIRECTION
      ?auto_20848 - MODE
      ?auto_20850 - DIRECTION
      ?auto_20849 - MODE
      ?auto_20852 - DIRECTION
      ?auto_20851 - MODE
    )
    :vars
    (
      ?auto_20853 - INSTRUMENT
      ?auto_20854 - SATELLITE
      ?auto_20855 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20853 ?auto_20854 ) ( SUPPORTS ?auto_20853 ?auto_20849 ) ( POWER_ON ?auto_20853 ) ( POINTING ?auto_20854 ?auto_20855 ) ( not ( = ?auto_20850 ?auto_20855 ) ) ( HAVE_IMAGE ?auto_20847 ?auto_20851 ) ( not ( = ?auto_20847 ?auto_20850 ) ) ( not ( = ?auto_20847 ?auto_20855 ) ) ( not ( = ?auto_20851 ?auto_20849 ) ) ( CALIBRATION_TARGET ?auto_20853 ?auto_20855 ) ( NOT_CALIBRATED ?auto_20853 ) ( HAVE_IMAGE ?auto_20847 ?auto_20848 ) ( HAVE_IMAGE ?auto_20852 ?auto_20851 ) ( not ( = ?auto_20847 ?auto_20852 ) ) ( not ( = ?auto_20848 ?auto_20849 ) ) ( not ( = ?auto_20848 ?auto_20851 ) ) ( not ( = ?auto_20850 ?auto_20852 ) ) ( not ( = ?auto_20852 ?auto_20855 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20847 ?auto_20851 ?auto_20850 ?auto_20849 )
      ( GET-3IMAGE-VERIFY ?auto_20847 ?auto_20848 ?auto_20850 ?auto_20849 ?auto_20852 ?auto_20851 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20865 - DIRECTION
      ?auto_20866 - MODE
      ?auto_20868 - DIRECTION
      ?auto_20867 - MODE
      ?auto_20870 - DIRECTION
      ?auto_20869 - MODE
    )
    :vars
    (
      ?auto_20871 - INSTRUMENT
      ?auto_20872 - SATELLITE
      ?auto_20873 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20871 ?auto_20872 ) ( SUPPORTS ?auto_20871 ?auto_20866 ) ( POWER_ON ?auto_20871 ) ( POINTING ?auto_20872 ?auto_20873 ) ( not ( = ?auto_20865 ?auto_20873 ) ) ( HAVE_IMAGE ?auto_20870 ?auto_20867 ) ( not ( = ?auto_20870 ?auto_20865 ) ) ( not ( = ?auto_20870 ?auto_20873 ) ) ( not ( = ?auto_20867 ?auto_20866 ) ) ( CALIBRATION_TARGET ?auto_20871 ?auto_20873 ) ( NOT_CALIBRATED ?auto_20871 ) ( HAVE_IMAGE ?auto_20868 ?auto_20867 ) ( HAVE_IMAGE ?auto_20870 ?auto_20869 ) ( not ( = ?auto_20865 ?auto_20868 ) ) ( not ( = ?auto_20866 ?auto_20869 ) ) ( not ( = ?auto_20868 ?auto_20870 ) ) ( not ( = ?auto_20868 ?auto_20873 ) ) ( not ( = ?auto_20867 ?auto_20869 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20870 ?auto_20867 ?auto_20865 ?auto_20866 )
      ( GET-3IMAGE-VERIFY ?auto_20865 ?auto_20866 ?auto_20868 ?auto_20867 ?auto_20870 ?auto_20869 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_20903 - DIRECTION
      ?auto_20904 - MODE
    )
    :vars
    (
      ?auto_20905 - INSTRUMENT
      ?auto_20906 - SATELLITE
      ?auto_20908 - DIRECTION
      ?auto_20907 - DIRECTION
      ?auto_20909 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_20905 ?auto_20906 ) ( SUPPORTS ?auto_20905 ?auto_20904 ) ( POINTING ?auto_20906 ?auto_20908 ) ( not ( = ?auto_20903 ?auto_20908 ) ) ( HAVE_IMAGE ?auto_20907 ?auto_20909 ) ( not ( = ?auto_20907 ?auto_20903 ) ) ( not ( = ?auto_20907 ?auto_20908 ) ) ( not ( = ?auto_20909 ?auto_20904 ) ) ( CALIBRATION_TARGET ?auto_20905 ?auto_20908 ) ( POWER_AVAIL ?auto_20906 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_20905 ?auto_20906 )
      ( GET-2IMAGE ?auto_20907 ?auto_20909 ?auto_20903 ?auto_20904 )
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
      ?auto_20914 - INSTRUMENT
      ?auto_20915 - SATELLITE
      ?auto_20916 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20914 ?auto_20915 ) ( SUPPORTS ?auto_20914 ?auto_20912 ) ( POINTING ?auto_20915 ?auto_20916 ) ( not ( = ?auto_20913 ?auto_20916 ) ) ( HAVE_IMAGE ?auto_20910 ?auto_20911 ) ( not ( = ?auto_20910 ?auto_20913 ) ) ( not ( = ?auto_20910 ?auto_20916 ) ) ( not ( = ?auto_20911 ?auto_20912 ) ) ( CALIBRATION_TARGET ?auto_20914 ?auto_20916 ) ( POWER_AVAIL ?auto_20915 ) )
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
    ( and ( ON_BOARD ?auto_20921 ?auto_20923 ) ( SUPPORTS ?auto_20921 ?auto_20918 ) ( POINTING ?auto_20923 ?auto_20922 ) ( not ( = ?auto_20917 ?auto_20922 ) ) ( HAVE_IMAGE ?auto_20920 ?auto_20919 ) ( not ( = ?auto_20920 ?auto_20917 ) ) ( not ( = ?auto_20920 ?auto_20922 ) ) ( not ( = ?auto_20919 ?auto_20918 ) ) ( CALIBRATION_TARGET ?auto_20921 ?auto_20922 ) ( POWER_AVAIL ?auto_20923 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20920 ?auto_20919 ?auto_20917 ?auto_20918 )
      ( GET-2IMAGE-VERIFY ?auto_20917 ?auto_20918 ?auto_20920 ?auto_20919 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20933 - DIRECTION
      ?auto_20934 - MODE
      ?auto_20936 - DIRECTION
      ?auto_20935 - MODE
      ?auto_20938 - DIRECTION
      ?auto_20937 - MODE
    )
    :vars
    (
      ?auto_20939 - INSTRUMENT
      ?auto_20941 - SATELLITE
      ?auto_20940 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20939 ?auto_20941 ) ( SUPPORTS ?auto_20939 ?auto_20937 ) ( POINTING ?auto_20941 ?auto_20940 ) ( not ( = ?auto_20938 ?auto_20940 ) ) ( HAVE_IMAGE ?auto_20933 ?auto_20934 ) ( not ( = ?auto_20933 ?auto_20938 ) ) ( not ( = ?auto_20933 ?auto_20940 ) ) ( not ( = ?auto_20934 ?auto_20937 ) ) ( CALIBRATION_TARGET ?auto_20939 ?auto_20940 ) ( POWER_AVAIL ?auto_20941 ) ( HAVE_IMAGE ?auto_20936 ?auto_20935 ) ( not ( = ?auto_20933 ?auto_20936 ) ) ( not ( = ?auto_20934 ?auto_20935 ) ) ( not ( = ?auto_20936 ?auto_20938 ) ) ( not ( = ?auto_20936 ?auto_20940 ) ) ( not ( = ?auto_20935 ?auto_20937 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20933 ?auto_20934 ?auto_20938 ?auto_20937 )
      ( GET-3IMAGE-VERIFY ?auto_20933 ?auto_20934 ?auto_20936 ?auto_20935 ?auto_20938 ?auto_20937 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20942 - DIRECTION
      ?auto_20943 - MODE
      ?auto_20945 - DIRECTION
      ?auto_20944 - MODE
      ?auto_20947 - DIRECTION
      ?auto_20946 - MODE
    )
    :vars
    (
      ?auto_20948 - INSTRUMENT
      ?auto_20950 - SATELLITE
      ?auto_20949 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20948 ?auto_20950 ) ( SUPPORTS ?auto_20948 ?auto_20944 ) ( POINTING ?auto_20950 ?auto_20949 ) ( not ( = ?auto_20945 ?auto_20949 ) ) ( HAVE_IMAGE ?auto_20942 ?auto_20943 ) ( not ( = ?auto_20942 ?auto_20945 ) ) ( not ( = ?auto_20942 ?auto_20949 ) ) ( not ( = ?auto_20943 ?auto_20944 ) ) ( CALIBRATION_TARGET ?auto_20948 ?auto_20949 ) ( POWER_AVAIL ?auto_20950 ) ( HAVE_IMAGE ?auto_20947 ?auto_20946 ) ( not ( = ?auto_20942 ?auto_20947 ) ) ( not ( = ?auto_20943 ?auto_20946 ) ) ( not ( = ?auto_20945 ?auto_20947 ) ) ( not ( = ?auto_20944 ?auto_20946 ) ) ( not ( = ?auto_20947 ?auto_20949 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20942 ?auto_20943 ?auto_20945 ?auto_20944 )
      ( GET-3IMAGE-VERIFY ?auto_20942 ?auto_20943 ?auto_20945 ?auto_20944 ?auto_20947 ?auto_20946 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_20960 - DIRECTION
      ?auto_20961 - MODE
      ?auto_20963 - DIRECTION
      ?auto_20962 - MODE
      ?auto_20965 - DIRECTION
      ?auto_20964 - MODE
    )
    :vars
    (
      ?auto_20966 - INSTRUMENT
      ?auto_20968 - SATELLITE
      ?auto_20967 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_20966 ?auto_20968 ) ( SUPPORTS ?auto_20966 ?auto_20961 ) ( POINTING ?auto_20968 ?auto_20967 ) ( not ( = ?auto_20960 ?auto_20967 ) ) ( HAVE_IMAGE ?auto_20963 ?auto_20964 ) ( not ( = ?auto_20963 ?auto_20960 ) ) ( not ( = ?auto_20963 ?auto_20967 ) ) ( not ( = ?auto_20964 ?auto_20961 ) ) ( CALIBRATION_TARGET ?auto_20966 ?auto_20967 ) ( POWER_AVAIL ?auto_20968 ) ( HAVE_IMAGE ?auto_20963 ?auto_20962 ) ( HAVE_IMAGE ?auto_20965 ?auto_20964 ) ( not ( = ?auto_20960 ?auto_20965 ) ) ( not ( = ?auto_20961 ?auto_20962 ) ) ( not ( = ?auto_20963 ?auto_20965 ) ) ( not ( = ?auto_20962 ?auto_20964 ) ) ( not ( = ?auto_20965 ?auto_20967 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_20963 ?auto_20964 ?auto_20960 ?auto_20961 )
      ( GET-3IMAGE-VERIFY ?auto_20960 ?auto_20961 ?auto_20963 ?auto_20962 ?auto_20965 ?auto_20964 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_20998 - DIRECTION
      ?auto_20999 - MODE
    )
    :vars
    (
      ?auto_21000 - INSTRUMENT
      ?auto_21003 - SATELLITE
      ?auto_21001 - DIRECTION
      ?auto_21002 - DIRECTION
      ?auto_21004 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_21000 ?auto_21003 ) ( SUPPORTS ?auto_21000 ?auto_20999 ) ( not ( = ?auto_20998 ?auto_21001 ) ) ( HAVE_IMAGE ?auto_21002 ?auto_21004 ) ( not ( = ?auto_21002 ?auto_20998 ) ) ( not ( = ?auto_21002 ?auto_21001 ) ) ( not ( = ?auto_21004 ?auto_20999 ) ) ( CALIBRATION_TARGET ?auto_21000 ?auto_21001 ) ( POWER_AVAIL ?auto_21003 ) ( POINTING ?auto_21003 ?auto_21002 ) )
    :subtasks
    ( ( !TURN_TO ?auto_21003 ?auto_21001 ?auto_21002 )
      ( GET-2IMAGE ?auto_21002 ?auto_21004 ?auto_20998 ?auto_20999 )
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
      ?auto_21009 - INSTRUMENT
      ?auto_21010 - SATELLITE
      ?auto_21011 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_21009 ?auto_21010 ) ( SUPPORTS ?auto_21009 ?auto_21007 ) ( not ( = ?auto_21008 ?auto_21011 ) ) ( HAVE_IMAGE ?auto_21005 ?auto_21006 ) ( not ( = ?auto_21005 ?auto_21008 ) ) ( not ( = ?auto_21005 ?auto_21011 ) ) ( not ( = ?auto_21006 ?auto_21007 ) ) ( CALIBRATION_TARGET ?auto_21009 ?auto_21011 ) ( POWER_AVAIL ?auto_21010 ) ( POINTING ?auto_21010 ?auto_21005 ) )
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
      ?auto_21016 - INSTRUMENT
      ?auto_21018 - SATELLITE
      ?auto_21017 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_21016 ?auto_21018 ) ( SUPPORTS ?auto_21016 ?auto_21013 ) ( not ( = ?auto_21012 ?auto_21017 ) ) ( HAVE_IMAGE ?auto_21015 ?auto_21014 ) ( not ( = ?auto_21015 ?auto_21012 ) ) ( not ( = ?auto_21015 ?auto_21017 ) ) ( not ( = ?auto_21014 ?auto_21013 ) ) ( CALIBRATION_TARGET ?auto_21016 ?auto_21017 ) ( POWER_AVAIL ?auto_21018 ) ( POINTING ?auto_21018 ?auto_21015 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21015 ?auto_21014 ?auto_21012 ?auto_21013 )
      ( GET-2IMAGE-VERIFY ?auto_21012 ?auto_21013 ?auto_21015 ?auto_21014 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21028 - DIRECTION
      ?auto_21029 - MODE
      ?auto_21031 - DIRECTION
      ?auto_21030 - MODE
      ?auto_21033 - DIRECTION
      ?auto_21032 - MODE
    )
    :vars
    (
      ?auto_21034 - INSTRUMENT
      ?auto_21036 - SATELLITE
      ?auto_21035 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_21034 ?auto_21036 ) ( SUPPORTS ?auto_21034 ?auto_21032 ) ( not ( = ?auto_21033 ?auto_21035 ) ) ( HAVE_IMAGE ?auto_21028 ?auto_21029 ) ( not ( = ?auto_21028 ?auto_21033 ) ) ( not ( = ?auto_21028 ?auto_21035 ) ) ( not ( = ?auto_21029 ?auto_21032 ) ) ( CALIBRATION_TARGET ?auto_21034 ?auto_21035 ) ( POWER_AVAIL ?auto_21036 ) ( POINTING ?auto_21036 ?auto_21028 ) ( HAVE_IMAGE ?auto_21031 ?auto_21030 ) ( not ( = ?auto_21028 ?auto_21031 ) ) ( not ( = ?auto_21029 ?auto_21030 ) ) ( not ( = ?auto_21031 ?auto_21033 ) ) ( not ( = ?auto_21031 ?auto_21035 ) ) ( not ( = ?auto_21030 ?auto_21032 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21028 ?auto_21029 ?auto_21033 ?auto_21032 )
      ( GET-3IMAGE-VERIFY ?auto_21028 ?auto_21029 ?auto_21031 ?auto_21030 ?auto_21033 ?auto_21032 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21037 - DIRECTION
      ?auto_21038 - MODE
      ?auto_21040 - DIRECTION
      ?auto_21039 - MODE
      ?auto_21042 - DIRECTION
      ?auto_21041 - MODE
    )
    :vars
    (
      ?auto_21043 - INSTRUMENT
      ?auto_21045 - SATELLITE
      ?auto_21044 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_21043 ?auto_21045 ) ( SUPPORTS ?auto_21043 ?auto_21039 ) ( not ( = ?auto_21040 ?auto_21044 ) ) ( HAVE_IMAGE ?auto_21037 ?auto_21038 ) ( not ( = ?auto_21037 ?auto_21040 ) ) ( not ( = ?auto_21037 ?auto_21044 ) ) ( not ( = ?auto_21038 ?auto_21039 ) ) ( CALIBRATION_TARGET ?auto_21043 ?auto_21044 ) ( POWER_AVAIL ?auto_21045 ) ( POINTING ?auto_21045 ?auto_21037 ) ( HAVE_IMAGE ?auto_21042 ?auto_21041 ) ( not ( = ?auto_21037 ?auto_21042 ) ) ( not ( = ?auto_21038 ?auto_21041 ) ) ( not ( = ?auto_21040 ?auto_21042 ) ) ( not ( = ?auto_21039 ?auto_21041 ) ) ( not ( = ?auto_21042 ?auto_21044 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21037 ?auto_21038 ?auto_21040 ?auto_21039 )
      ( GET-3IMAGE-VERIFY ?auto_21037 ?auto_21038 ?auto_21040 ?auto_21039 ?auto_21042 ?auto_21041 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21055 - DIRECTION
      ?auto_21056 - MODE
      ?auto_21058 - DIRECTION
      ?auto_21057 - MODE
      ?auto_21060 - DIRECTION
      ?auto_21059 - MODE
    )
    :vars
    (
      ?auto_21061 - INSTRUMENT
      ?auto_21063 - SATELLITE
      ?auto_21062 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_21061 ?auto_21063 ) ( SUPPORTS ?auto_21061 ?auto_21056 ) ( not ( = ?auto_21055 ?auto_21062 ) ) ( HAVE_IMAGE ?auto_21058 ?auto_21059 ) ( not ( = ?auto_21058 ?auto_21055 ) ) ( not ( = ?auto_21058 ?auto_21062 ) ) ( not ( = ?auto_21059 ?auto_21056 ) ) ( CALIBRATION_TARGET ?auto_21061 ?auto_21062 ) ( POWER_AVAIL ?auto_21063 ) ( POINTING ?auto_21063 ?auto_21058 ) ( HAVE_IMAGE ?auto_21058 ?auto_21057 ) ( HAVE_IMAGE ?auto_21060 ?auto_21059 ) ( not ( = ?auto_21055 ?auto_21060 ) ) ( not ( = ?auto_21056 ?auto_21057 ) ) ( not ( = ?auto_21058 ?auto_21060 ) ) ( not ( = ?auto_21057 ?auto_21059 ) ) ( not ( = ?auto_21060 ?auto_21062 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21058 ?auto_21059 ?auto_21055 ?auto_21056 )
      ( GET-3IMAGE-VERIFY ?auto_21055 ?auto_21056 ?auto_21058 ?auto_21057 ?auto_21060 ?auto_21059 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_21093 - DIRECTION
      ?auto_21094 - MODE
    )
    :vars
    (
      ?auto_21095 - INSTRUMENT
      ?auto_21099 - SATELLITE
      ?auto_21097 - DIRECTION
      ?auto_21096 - DIRECTION
      ?auto_21098 - MODE
      ?auto_21100 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21095 ?auto_21099 ) ( SUPPORTS ?auto_21095 ?auto_21094 ) ( not ( = ?auto_21093 ?auto_21097 ) ) ( HAVE_IMAGE ?auto_21096 ?auto_21098 ) ( not ( = ?auto_21096 ?auto_21093 ) ) ( not ( = ?auto_21096 ?auto_21097 ) ) ( not ( = ?auto_21098 ?auto_21094 ) ) ( CALIBRATION_TARGET ?auto_21095 ?auto_21097 ) ( POINTING ?auto_21099 ?auto_21096 ) ( ON_BOARD ?auto_21100 ?auto_21099 ) ( POWER_ON ?auto_21100 ) ( not ( = ?auto_21095 ?auto_21100 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_21100 ?auto_21099 )
      ( GET-2IMAGE ?auto_21096 ?auto_21098 ?auto_21093 ?auto_21094 )
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
      ?auto_21105 - SATELLITE
      ?auto_21108 - DIRECTION
      ?auto_21107 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21106 ?auto_21105 ) ( SUPPORTS ?auto_21106 ?auto_21103 ) ( not ( = ?auto_21104 ?auto_21108 ) ) ( HAVE_IMAGE ?auto_21101 ?auto_21102 ) ( not ( = ?auto_21101 ?auto_21104 ) ) ( not ( = ?auto_21101 ?auto_21108 ) ) ( not ( = ?auto_21102 ?auto_21103 ) ) ( CALIBRATION_TARGET ?auto_21106 ?auto_21108 ) ( POINTING ?auto_21105 ?auto_21101 ) ( ON_BOARD ?auto_21107 ?auto_21105 ) ( POWER_ON ?auto_21107 ) ( not ( = ?auto_21106 ?auto_21107 ) ) )
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
      ?auto_21114 - INSTRUMENT
      ?auto_21113 - SATELLITE
      ?auto_21115 - DIRECTION
      ?auto_21116 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21114 ?auto_21113 ) ( SUPPORTS ?auto_21114 ?auto_21110 ) ( not ( = ?auto_21109 ?auto_21115 ) ) ( HAVE_IMAGE ?auto_21112 ?auto_21111 ) ( not ( = ?auto_21112 ?auto_21109 ) ) ( not ( = ?auto_21112 ?auto_21115 ) ) ( not ( = ?auto_21111 ?auto_21110 ) ) ( CALIBRATION_TARGET ?auto_21114 ?auto_21115 ) ( POINTING ?auto_21113 ?auto_21112 ) ( ON_BOARD ?auto_21116 ?auto_21113 ) ( POWER_ON ?auto_21116 ) ( not ( = ?auto_21114 ?auto_21116 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21112 ?auto_21111 ?auto_21109 ?auto_21110 )
      ( GET-2IMAGE-VERIFY ?auto_21109 ?auto_21110 ?auto_21112 ?auto_21111 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21127 - DIRECTION
      ?auto_21128 - MODE
      ?auto_21130 - DIRECTION
      ?auto_21129 - MODE
      ?auto_21132 - DIRECTION
      ?auto_21131 - MODE
    )
    :vars
    (
      ?auto_21134 - INSTRUMENT
      ?auto_21133 - SATELLITE
      ?auto_21135 - DIRECTION
      ?auto_21136 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21134 ?auto_21133 ) ( SUPPORTS ?auto_21134 ?auto_21131 ) ( not ( = ?auto_21132 ?auto_21135 ) ) ( HAVE_IMAGE ?auto_21130 ?auto_21128 ) ( not ( = ?auto_21130 ?auto_21132 ) ) ( not ( = ?auto_21130 ?auto_21135 ) ) ( not ( = ?auto_21128 ?auto_21131 ) ) ( CALIBRATION_TARGET ?auto_21134 ?auto_21135 ) ( POINTING ?auto_21133 ?auto_21130 ) ( ON_BOARD ?auto_21136 ?auto_21133 ) ( POWER_ON ?auto_21136 ) ( not ( = ?auto_21134 ?auto_21136 ) ) ( HAVE_IMAGE ?auto_21127 ?auto_21128 ) ( HAVE_IMAGE ?auto_21130 ?auto_21129 ) ( not ( = ?auto_21127 ?auto_21130 ) ) ( not ( = ?auto_21127 ?auto_21132 ) ) ( not ( = ?auto_21127 ?auto_21135 ) ) ( not ( = ?auto_21128 ?auto_21129 ) ) ( not ( = ?auto_21129 ?auto_21131 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21130 ?auto_21128 ?auto_21132 ?auto_21131 )
      ( GET-3IMAGE-VERIFY ?auto_21127 ?auto_21128 ?auto_21130 ?auto_21129 ?auto_21132 ?auto_21131 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21137 - DIRECTION
      ?auto_21138 - MODE
      ?auto_21140 - DIRECTION
      ?auto_21139 - MODE
      ?auto_21142 - DIRECTION
      ?auto_21141 - MODE
    )
    :vars
    (
      ?auto_21144 - INSTRUMENT
      ?auto_21143 - SATELLITE
      ?auto_21145 - DIRECTION
      ?auto_21146 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21144 ?auto_21143 ) ( SUPPORTS ?auto_21144 ?auto_21139 ) ( not ( = ?auto_21140 ?auto_21145 ) ) ( HAVE_IMAGE ?auto_21142 ?auto_21138 ) ( not ( = ?auto_21142 ?auto_21140 ) ) ( not ( = ?auto_21142 ?auto_21145 ) ) ( not ( = ?auto_21138 ?auto_21139 ) ) ( CALIBRATION_TARGET ?auto_21144 ?auto_21145 ) ( POINTING ?auto_21143 ?auto_21142 ) ( ON_BOARD ?auto_21146 ?auto_21143 ) ( POWER_ON ?auto_21146 ) ( not ( = ?auto_21144 ?auto_21146 ) ) ( HAVE_IMAGE ?auto_21137 ?auto_21138 ) ( HAVE_IMAGE ?auto_21142 ?auto_21141 ) ( not ( = ?auto_21137 ?auto_21140 ) ) ( not ( = ?auto_21137 ?auto_21142 ) ) ( not ( = ?auto_21137 ?auto_21145 ) ) ( not ( = ?auto_21138 ?auto_21141 ) ) ( not ( = ?auto_21139 ?auto_21141 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21142 ?auto_21138 ?auto_21140 ?auto_21139 )
      ( GET-3IMAGE-VERIFY ?auto_21137 ?auto_21138 ?auto_21140 ?auto_21139 ?auto_21142 ?auto_21141 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21157 - DIRECTION
      ?auto_21158 - MODE
      ?auto_21160 - DIRECTION
      ?auto_21159 - MODE
      ?auto_21162 - DIRECTION
      ?auto_21161 - MODE
    )
    :vars
    (
      ?auto_21164 - INSTRUMENT
      ?auto_21163 - SATELLITE
      ?auto_21165 - DIRECTION
      ?auto_21166 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21164 ?auto_21163 ) ( SUPPORTS ?auto_21164 ?auto_21158 ) ( not ( = ?auto_21157 ?auto_21165 ) ) ( HAVE_IMAGE ?auto_21160 ?auto_21159 ) ( not ( = ?auto_21160 ?auto_21157 ) ) ( not ( = ?auto_21160 ?auto_21165 ) ) ( not ( = ?auto_21159 ?auto_21158 ) ) ( CALIBRATION_TARGET ?auto_21164 ?auto_21165 ) ( POINTING ?auto_21163 ?auto_21160 ) ( ON_BOARD ?auto_21166 ?auto_21163 ) ( POWER_ON ?auto_21166 ) ( not ( = ?auto_21164 ?auto_21166 ) ) ( HAVE_IMAGE ?auto_21162 ?auto_21161 ) ( not ( = ?auto_21157 ?auto_21162 ) ) ( not ( = ?auto_21158 ?auto_21161 ) ) ( not ( = ?auto_21160 ?auto_21162 ) ) ( not ( = ?auto_21159 ?auto_21161 ) ) ( not ( = ?auto_21162 ?auto_21165 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_21160 ?auto_21159 ?auto_21157 ?auto_21158 )
      ( GET-3IMAGE-VERIFY ?auto_21157 ?auto_21158 ?auto_21160 ?auto_21159 ?auto_21162 ?auto_21161 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_21199 - DIRECTION
      ?auto_21200 - MODE
    )
    :vars
    (
      ?auto_21202 - INSTRUMENT
      ?auto_21201 - SATELLITE
      ?auto_21203 - DIRECTION
      ?auto_21205 - DIRECTION
      ?auto_21204 - MODE
      ?auto_21206 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21202 ?auto_21201 ) ( SUPPORTS ?auto_21202 ?auto_21200 ) ( not ( = ?auto_21199 ?auto_21203 ) ) ( not ( = ?auto_21205 ?auto_21199 ) ) ( not ( = ?auto_21205 ?auto_21203 ) ) ( not ( = ?auto_21204 ?auto_21200 ) ) ( CALIBRATION_TARGET ?auto_21202 ?auto_21203 ) ( POINTING ?auto_21201 ?auto_21205 ) ( ON_BOARD ?auto_21206 ?auto_21201 ) ( POWER_ON ?auto_21206 ) ( not ( = ?auto_21202 ?auto_21206 ) ) ( CALIBRATED ?auto_21206 ) ( SUPPORTS ?auto_21206 ?auto_21204 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21205 ?auto_21204 )
      ( GET-2IMAGE ?auto_21205 ?auto_21204 ?auto_21199 ?auto_21200 )
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
      ?auto_21214 - SATELLITE
      ?auto_21212 - DIRECTION
      ?auto_21211 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21213 ?auto_21214 ) ( SUPPORTS ?auto_21213 ?auto_21209 ) ( not ( = ?auto_21210 ?auto_21212 ) ) ( not ( = ?auto_21207 ?auto_21210 ) ) ( not ( = ?auto_21207 ?auto_21212 ) ) ( not ( = ?auto_21208 ?auto_21209 ) ) ( CALIBRATION_TARGET ?auto_21213 ?auto_21212 ) ( POINTING ?auto_21214 ?auto_21207 ) ( ON_BOARD ?auto_21211 ?auto_21214 ) ( POWER_ON ?auto_21211 ) ( not ( = ?auto_21213 ?auto_21211 ) ) ( CALIBRATED ?auto_21211 ) ( SUPPORTS ?auto_21211 ?auto_21208 ) )
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
      ?auto_21220 - INSTRUMENT
      ?auto_21219 - SATELLITE
      ?auto_21221 - DIRECTION
      ?auto_21222 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21220 ?auto_21219 ) ( SUPPORTS ?auto_21220 ?auto_21216 ) ( not ( = ?auto_21215 ?auto_21221 ) ) ( not ( = ?auto_21218 ?auto_21215 ) ) ( not ( = ?auto_21218 ?auto_21221 ) ) ( not ( = ?auto_21217 ?auto_21216 ) ) ( CALIBRATION_TARGET ?auto_21220 ?auto_21221 ) ( POINTING ?auto_21219 ?auto_21218 ) ( ON_BOARD ?auto_21222 ?auto_21219 ) ( POWER_ON ?auto_21222 ) ( not ( = ?auto_21220 ?auto_21222 ) ) ( CALIBRATED ?auto_21222 ) ( SUPPORTS ?auto_21222 ?auto_21217 ) )
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
      ?auto_21309 - INSTRUMENT
      ?auto_21307 - SATELLITE
      ?auto_21311 - DIRECTION
      ?auto_21308 - DIRECTION
      ?auto_21310 - MODE
      ?auto_21312 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21309 ?auto_21307 ) ( SUPPORTS ?auto_21309 ?auto_21306 ) ( not ( = ?auto_21305 ?auto_21311 ) ) ( not ( = ?auto_21308 ?auto_21305 ) ) ( not ( = ?auto_21308 ?auto_21311 ) ) ( not ( = ?auto_21310 ?auto_21306 ) ) ( CALIBRATION_TARGET ?auto_21309 ?auto_21311 ) ( ON_BOARD ?auto_21312 ?auto_21307 ) ( POWER_ON ?auto_21312 ) ( not ( = ?auto_21309 ?auto_21312 ) ) ( CALIBRATED ?auto_21312 ) ( SUPPORTS ?auto_21312 ?auto_21310 ) ( POINTING ?auto_21307 ?auto_21311 ) )
    :subtasks
    ( ( !TURN_TO ?auto_21307 ?auto_21308 ?auto_21311 )
      ( GET-2IMAGE ?auto_21308 ?auto_21310 ?auto_21305 ?auto_21306 )
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
      ?auto_21320 - SATELLITE
      ?auto_21317 - DIRECTION
      ?auto_21318 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21319 ?auto_21320 ) ( SUPPORTS ?auto_21319 ?auto_21315 ) ( not ( = ?auto_21316 ?auto_21317 ) ) ( not ( = ?auto_21313 ?auto_21316 ) ) ( not ( = ?auto_21313 ?auto_21317 ) ) ( not ( = ?auto_21314 ?auto_21315 ) ) ( CALIBRATION_TARGET ?auto_21319 ?auto_21317 ) ( ON_BOARD ?auto_21318 ?auto_21320 ) ( POWER_ON ?auto_21318 ) ( not ( = ?auto_21319 ?auto_21318 ) ) ( CALIBRATED ?auto_21318 ) ( SUPPORTS ?auto_21318 ?auto_21314 ) ( POINTING ?auto_21320 ?auto_21317 ) )
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
      ?auto_21325 - INSTRUMENT
      ?auto_21327 - SATELLITE
      ?auto_21326 - DIRECTION
      ?auto_21328 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21325 ?auto_21327 ) ( SUPPORTS ?auto_21325 ?auto_21322 ) ( not ( = ?auto_21321 ?auto_21326 ) ) ( not ( = ?auto_21324 ?auto_21321 ) ) ( not ( = ?auto_21324 ?auto_21326 ) ) ( not ( = ?auto_21323 ?auto_21322 ) ) ( CALIBRATION_TARGET ?auto_21325 ?auto_21326 ) ( ON_BOARD ?auto_21328 ?auto_21327 ) ( POWER_ON ?auto_21328 ) ( not ( = ?auto_21325 ?auto_21328 ) ) ( CALIBRATED ?auto_21328 ) ( SUPPORTS ?auto_21328 ?auto_21323 ) ( POINTING ?auto_21327 ?auto_21326 ) )
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
      ?auto_21414 - INSTRUMENT
      ?auto_21416 - SATELLITE
      ?auto_21415 - DIRECTION
      ?auto_21413 - DIRECTION
      ?auto_21418 - MODE
      ?auto_21417 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21414 ?auto_21416 ) ( SUPPORTS ?auto_21414 ?auto_21412 ) ( not ( = ?auto_21411 ?auto_21415 ) ) ( not ( = ?auto_21413 ?auto_21411 ) ) ( not ( = ?auto_21413 ?auto_21415 ) ) ( not ( = ?auto_21418 ?auto_21412 ) ) ( CALIBRATION_TARGET ?auto_21414 ?auto_21415 ) ( ON_BOARD ?auto_21417 ?auto_21416 ) ( POWER_ON ?auto_21417 ) ( not ( = ?auto_21414 ?auto_21417 ) ) ( SUPPORTS ?auto_21417 ?auto_21418 ) ( POINTING ?auto_21416 ?auto_21415 ) ( CALIBRATION_TARGET ?auto_21417 ?auto_21415 ) ( NOT_CALIBRATED ?auto_21417 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_21416 ?auto_21417 ?auto_21415 )
      ( GET-2IMAGE ?auto_21413 ?auto_21418 ?auto_21411 ?auto_21412 )
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
      ?auto_21425 - INSTRUMENT
      ?auto_21423 - SATELLITE
      ?auto_21424 - DIRECTION
      ?auto_21426 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21425 ?auto_21423 ) ( SUPPORTS ?auto_21425 ?auto_21421 ) ( not ( = ?auto_21422 ?auto_21424 ) ) ( not ( = ?auto_21419 ?auto_21422 ) ) ( not ( = ?auto_21419 ?auto_21424 ) ) ( not ( = ?auto_21420 ?auto_21421 ) ) ( CALIBRATION_TARGET ?auto_21425 ?auto_21424 ) ( ON_BOARD ?auto_21426 ?auto_21423 ) ( POWER_ON ?auto_21426 ) ( not ( = ?auto_21425 ?auto_21426 ) ) ( SUPPORTS ?auto_21426 ?auto_21420 ) ( POINTING ?auto_21423 ?auto_21424 ) ( CALIBRATION_TARGET ?auto_21426 ?auto_21424 ) ( NOT_CALIBRATED ?auto_21426 ) )
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
      ?auto_21432 - SATELLITE
      ?auto_21433 - DIRECTION
      ?auto_21431 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21434 ?auto_21432 ) ( SUPPORTS ?auto_21434 ?auto_21428 ) ( not ( = ?auto_21427 ?auto_21433 ) ) ( not ( = ?auto_21430 ?auto_21427 ) ) ( not ( = ?auto_21430 ?auto_21433 ) ) ( not ( = ?auto_21429 ?auto_21428 ) ) ( CALIBRATION_TARGET ?auto_21434 ?auto_21433 ) ( ON_BOARD ?auto_21431 ?auto_21432 ) ( POWER_ON ?auto_21431 ) ( not ( = ?auto_21434 ?auto_21431 ) ) ( SUPPORTS ?auto_21431 ?auto_21429 ) ( POINTING ?auto_21432 ?auto_21433 ) ( CALIBRATION_TARGET ?auto_21431 ?auto_21433 ) ( NOT_CALIBRATED ?auto_21431 ) )
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
      ?auto_21524 - INSTRUMENT
      ?auto_21522 - SATELLITE
      ?auto_21523 - DIRECTION
      ?auto_21520 - DIRECTION
      ?auto_21519 - MODE
      ?auto_21521 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21524 ?auto_21522 ) ( SUPPORTS ?auto_21524 ?auto_21518 ) ( not ( = ?auto_21517 ?auto_21523 ) ) ( not ( = ?auto_21520 ?auto_21517 ) ) ( not ( = ?auto_21520 ?auto_21523 ) ) ( not ( = ?auto_21519 ?auto_21518 ) ) ( CALIBRATION_TARGET ?auto_21524 ?auto_21523 ) ( ON_BOARD ?auto_21521 ?auto_21522 ) ( not ( = ?auto_21524 ?auto_21521 ) ) ( SUPPORTS ?auto_21521 ?auto_21519 ) ( POINTING ?auto_21522 ?auto_21523 ) ( CALIBRATION_TARGET ?auto_21521 ?auto_21523 ) ( POWER_AVAIL ?auto_21522 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_21521 ?auto_21522 )
      ( GET-2IMAGE ?auto_21520 ?auto_21519 ?auto_21517 ?auto_21518 )
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
      ?auto_21532 - INSTRUMENT
      ?auto_21530 - SATELLITE
      ?auto_21531 - DIRECTION
      ?auto_21529 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21532 ?auto_21530 ) ( SUPPORTS ?auto_21532 ?auto_21527 ) ( not ( = ?auto_21528 ?auto_21531 ) ) ( not ( = ?auto_21525 ?auto_21528 ) ) ( not ( = ?auto_21525 ?auto_21531 ) ) ( not ( = ?auto_21526 ?auto_21527 ) ) ( CALIBRATION_TARGET ?auto_21532 ?auto_21531 ) ( ON_BOARD ?auto_21529 ?auto_21530 ) ( not ( = ?auto_21532 ?auto_21529 ) ) ( SUPPORTS ?auto_21529 ?auto_21526 ) ( POINTING ?auto_21530 ?auto_21531 ) ( CALIBRATION_TARGET ?auto_21529 ?auto_21531 ) ( POWER_AVAIL ?auto_21530 ) )
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
      ?auto_21537 - SATELLITE
      ?auto_21539 - DIRECTION
      ?auto_21540 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_21538 ?auto_21537 ) ( SUPPORTS ?auto_21538 ?auto_21534 ) ( not ( = ?auto_21533 ?auto_21539 ) ) ( not ( = ?auto_21536 ?auto_21533 ) ) ( not ( = ?auto_21536 ?auto_21539 ) ) ( not ( = ?auto_21535 ?auto_21534 ) ) ( CALIBRATION_TARGET ?auto_21538 ?auto_21539 ) ( ON_BOARD ?auto_21540 ?auto_21537 ) ( not ( = ?auto_21538 ?auto_21540 ) ) ( SUPPORTS ?auto_21540 ?auto_21535 ) ( POINTING ?auto_21537 ?auto_21539 ) ( CALIBRATION_TARGET ?auto_21540 ?auto_21539 ) ( POWER_AVAIL ?auto_21537 ) )
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
      ?auto_21628 - INSTRUMENT
      ?auto_21626 - SATELLITE
      ?auto_21629 - DIRECTION
      ?auto_21625 - DIRECTION
      ?auto_21627 - MODE
      ?auto_21630 - INSTRUMENT
      ?auto_21631 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_21628 ?auto_21626 ) ( SUPPORTS ?auto_21628 ?auto_21624 ) ( not ( = ?auto_21623 ?auto_21629 ) ) ( not ( = ?auto_21625 ?auto_21623 ) ) ( not ( = ?auto_21625 ?auto_21629 ) ) ( not ( = ?auto_21627 ?auto_21624 ) ) ( CALIBRATION_TARGET ?auto_21628 ?auto_21629 ) ( ON_BOARD ?auto_21630 ?auto_21626 ) ( not ( = ?auto_21628 ?auto_21630 ) ) ( SUPPORTS ?auto_21630 ?auto_21627 ) ( CALIBRATION_TARGET ?auto_21630 ?auto_21629 ) ( POWER_AVAIL ?auto_21626 ) ( POINTING ?auto_21626 ?auto_21631 ) ( not ( = ?auto_21629 ?auto_21631 ) ) ( not ( = ?auto_21623 ?auto_21631 ) ) ( not ( = ?auto_21625 ?auto_21631 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_21626 ?auto_21629 ?auto_21631 )
      ( GET-2IMAGE ?auto_21625 ?auto_21627 ?auto_21623 ?auto_21624 )
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
      ?auto_21636 - INSTRUMENT
      ?auto_21637 - SATELLITE
      ?auto_21638 - DIRECTION
      ?auto_21639 - INSTRUMENT
      ?auto_21640 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_21636 ?auto_21637 ) ( SUPPORTS ?auto_21636 ?auto_21634 ) ( not ( = ?auto_21635 ?auto_21638 ) ) ( not ( = ?auto_21632 ?auto_21635 ) ) ( not ( = ?auto_21632 ?auto_21638 ) ) ( not ( = ?auto_21633 ?auto_21634 ) ) ( CALIBRATION_TARGET ?auto_21636 ?auto_21638 ) ( ON_BOARD ?auto_21639 ?auto_21637 ) ( not ( = ?auto_21636 ?auto_21639 ) ) ( SUPPORTS ?auto_21639 ?auto_21633 ) ( CALIBRATION_TARGET ?auto_21639 ?auto_21638 ) ( POWER_AVAIL ?auto_21637 ) ( POINTING ?auto_21637 ?auto_21640 ) ( not ( = ?auto_21638 ?auto_21640 ) ) ( not ( = ?auto_21635 ?auto_21640 ) ) ( not ( = ?auto_21632 ?auto_21640 ) ) )
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
      ?auto_21645 - INSTRUMENT
      ?auto_21649 - SATELLITE
      ?auto_21646 - DIRECTION
      ?auto_21647 - INSTRUMENT
      ?auto_21648 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_21645 ?auto_21649 ) ( SUPPORTS ?auto_21645 ?auto_21642 ) ( not ( = ?auto_21641 ?auto_21646 ) ) ( not ( = ?auto_21644 ?auto_21641 ) ) ( not ( = ?auto_21644 ?auto_21646 ) ) ( not ( = ?auto_21643 ?auto_21642 ) ) ( CALIBRATION_TARGET ?auto_21645 ?auto_21646 ) ( ON_BOARD ?auto_21647 ?auto_21649 ) ( not ( = ?auto_21645 ?auto_21647 ) ) ( SUPPORTS ?auto_21647 ?auto_21643 ) ( CALIBRATION_TARGET ?auto_21647 ?auto_21646 ) ( POWER_AVAIL ?auto_21649 ) ( POINTING ?auto_21649 ?auto_21648 ) ( not ( = ?auto_21646 ?auto_21648 ) ) ( not ( = ?auto_21641 ?auto_21648 ) ) ( not ( = ?auto_21644 ?auto_21648 ) ) )
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
      ?auto_21884 - INSTRUMENT
      ?auto_21885 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_21884 ) ( ON_BOARD ?auto_21884 ?auto_21885 ) ( SUPPORTS ?auto_21884 ?auto_21882 ) ( POWER_ON ?auto_21884 ) ( POINTING ?auto_21885 ?auto_21883 ) ( HAVE_IMAGE ?auto_21880 ?auto_21881 ) ( not ( = ?auto_21880 ?auto_21883 ) ) ( not ( = ?auto_21881 ?auto_21882 ) ) )
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
      ?auto_21890 - INSTRUMENT
      ?auto_21891 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_21890 ) ( ON_BOARD ?auto_21890 ?auto_21891 ) ( SUPPORTS ?auto_21890 ?auto_21888 ) ( POWER_ON ?auto_21890 ) ( POINTING ?auto_21891 ?auto_21889 ) ( HAVE_IMAGE ?auto_21886 ?auto_21887 ) ( not ( = ?auto_21886 ?auto_21889 ) ) ( not ( = ?auto_21887 ?auto_21888 ) ) )
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
      ?auto_21896 - INSTRUMENT
      ?auto_21897 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_21896 ) ( ON_BOARD ?auto_21896 ?auto_21897 ) ( SUPPORTS ?auto_21896 ?auto_21893 ) ( POWER_ON ?auto_21896 ) ( POINTING ?auto_21897 ?auto_21892 ) ( HAVE_IMAGE ?auto_21895 ?auto_21894 ) ( not ( = ?auto_21892 ?auto_21895 ) ) ( not ( = ?auto_21893 ?auto_21894 ) ) )
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
      ?auto_21902 - INSTRUMENT
      ?auto_21903 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_21902 ) ( ON_BOARD ?auto_21902 ?auto_21903 ) ( SUPPORTS ?auto_21902 ?auto_21899 ) ( POWER_ON ?auto_21902 ) ( POINTING ?auto_21903 ?auto_21898 ) ( HAVE_IMAGE ?auto_21901 ?auto_21900 ) ( not ( = ?auto_21898 ?auto_21901 ) ) ( not ( = ?auto_21899 ?auto_21900 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21898 ?auto_21899 )
      ( GET-2IMAGE-VERIFY ?auto_21898 ?auto_21899 ?auto_21901 ?auto_21900 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21910 - DIRECTION
      ?auto_21911 - MODE
      ?auto_21913 - DIRECTION
      ?auto_21912 - MODE
      ?auto_21915 - DIRECTION
      ?auto_21914 - MODE
    )
    :vars
    (
      ?auto_21916 - INSTRUMENT
      ?auto_21917 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_21916 ) ( ON_BOARD ?auto_21916 ?auto_21917 ) ( SUPPORTS ?auto_21916 ?auto_21914 ) ( POWER_ON ?auto_21916 ) ( POINTING ?auto_21917 ?auto_21915 ) ( HAVE_IMAGE ?auto_21910 ?auto_21911 ) ( HAVE_IMAGE ?auto_21913 ?auto_21912 ) ( not ( = ?auto_21910 ?auto_21913 ) ) ( not ( = ?auto_21910 ?auto_21915 ) ) ( not ( = ?auto_21911 ?auto_21912 ) ) ( not ( = ?auto_21911 ?auto_21914 ) ) ( not ( = ?auto_21913 ?auto_21915 ) ) ( not ( = ?auto_21912 ?auto_21914 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21915 ?auto_21914 )
      ( GET-3IMAGE-VERIFY ?auto_21910 ?auto_21911 ?auto_21913 ?auto_21912 ?auto_21915 ?auto_21914 ) )
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
      ?auto_21924 - INSTRUMENT
      ?auto_21925 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_21924 ) ( ON_BOARD ?auto_21924 ?auto_21925 ) ( SUPPORTS ?auto_21924 ?auto_21922 ) ( POWER_ON ?auto_21924 ) ( POINTING ?auto_21925 ?auto_21923 ) ( HAVE_IMAGE ?auto_21918 ?auto_21919 ) ( HAVE_IMAGE ?auto_21921 ?auto_21920 ) ( not ( = ?auto_21918 ?auto_21921 ) ) ( not ( = ?auto_21918 ?auto_21923 ) ) ( not ( = ?auto_21919 ?auto_21920 ) ) ( not ( = ?auto_21919 ?auto_21922 ) ) ( not ( = ?auto_21921 ?auto_21923 ) ) ( not ( = ?auto_21920 ?auto_21922 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21923 ?auto_21922 )
      ( GET-3IMAGE-VERIFY ?auto_21918 ?auto_21919 ?auto_21921 ?auto_21920 ?auto_21923 ?auto_21922 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21926 - DIRECTION
      ?auto_21927 - MODE
      ?auto_21929 - DIRECTION
      ?auto_21928 - MODE
      ?auto_21931 - DIRECTION
      ?auto_21930 - MODE
    )
    :vars
    (
      ?auto_21932 - INSTRUMENT
      ?auto_21933 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_21932 ) ( ON_BOARD ?auto_21932 ?auto_21933 ) ( SUPPORTS ?auto_21932 ?auto_21928 ) ( POWER_ON ?auto_21932 ) ( POINTING ?auto_21933 ?auto_21929 ) ( HAVE_IMAGE ?auto_21926 ?auto_21927 ) ( HAVE_IMAGE ?auto_21931 ?auto_21930 ) ( not ( = ?auto_21926 ?auto_21929 ) ) ( not ( = ?auto_21926 ?auto_21931 ) ) ( not ( = ?auto_21927 ?auto_21928 ) ) ( not ( = ?auto_21927 ?auto_21930 ) ) ( not ( = ?auto_21929 ?auto_21931 ) ) ( not ( = ?auto_21928 ?auto_21930 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21929 ?auto_21928 )
      ( GET-3IMAGE-VERIFY ?auto_21926 ?auto_21927 ?auto_21929 ?auto_21928 ?auto_21931 ?auto_21930 ) )
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
      ?auto_21940 - INSTRUMENT
      ?auto_21941 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_21940 ) ( ON_BOARD ?auto_21940 ?auto_21941 ) ( SUPPORTS ?auto_21940 ?auto_21936 ) ( POWER_ON ?auto_21940 ) ( POINTING ?auto_21941 ?auto_21937 ) ( HAVE_IMAGE ?auto_21934 ?auto_21935 ) ( HAVE_IMAGE ?auto_21939 ?auto_21938 ) ( not ( = ?auto_21934 ?auto_21937 ) ) ( not ( = ?auto_21934 ?auto_21939 ) ) ( not ( = ?auto_21935 ?auto_21936 ) ) ( not ( = ?auto_21935 ?auto_21938 ) ) ( not ( = ?auto_21937 ?auto_21939 ) ) ( not ( = ?auto_21936 ?auto_21938 ) ) )
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
      ?auto_21956 - INSTRUMENT
      ?auto_21957 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_21956 ) ( ON_BOARD ?auto_21956 ?auto_21957 ) ( SUPPORTS ?auto_21956 ?auto_21954 ) ( POWER_ON ?auto_21956 ) ( POINTING ?auto_21957 ?auto_21955 ) ( HAVE_IMAGE ?auto_21950 ?auto_21951 ) ( HAVE_IMAGE ?auto_21953 ?auto_21952 ) ( not ( = ?auto_21950 ?auto_21953 ) ) ( not ( = ?auto_21950 ?auto_21955 ) ) ( not ( = ?auto_21951 ?auto_21952 ) ) ( not ( = ?auto_21951 ?auto_21954 ) ) ( not ( = ?auto_21953 ?auto_21955 ) ) ( not ( = ?auto_21952 ?auto_21954 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21955 ?auto_21954 )
      ( GET-3IMAGE-VERIFY ?auto_21950 ?auto_21951 ?auto_21953 ?auto_21952 ?auto_21955 ?auto_21954 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21958 - DIRECTION
      ?auto_21959 - MODE
      ?auto_21961 - DIRECTION
      ?auto_21960 - MODE
      ?auto_21963 - DIRECTION
      ?auto_21962 - MODE
    )
    :vars
    (
      ?auto_21964 - INSTRUMENT
      ?auto_21965 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_21964 ) ( ON_BOARD ?auto_21964 ?auto_21965 ) ( SUPPORTS ?auto_21964 ?auto_21962 ) ( POWER_ON ?auto_21964 ) ( POINTING ?auto_21965 ?auto_21963 ) ( HAVE_IMAGE ?auto_21958 ?auto_21959 ) ( HAVE_IMAGE ?auto_21961 ?auto_21960 ) ( not ( = ?auto_21958 ?auto_21961 ) ) ( not ( = ?auto_21958 ?auto_21963 ) ) ( not ( = ?auto_21959 ?auto_21960 ) ) ( not ( = ?auto_21959 ?auto_21962 ) ) ( not ( = ?auto_21961 ?auto_21963 ) ) ( not ( = ?auto_21960 ?auto_21962 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21963 ?auto_21962 )
      ( GET-3IMAGE-VERIFY ?auto_21958 ?auto_21959 ?auto_21961 ?auto_21960 ?auto_21963 ?auto_21962 ) )
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
      ?auto_21972 - INSTRUMENT
      ?auto_21973 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_21972 ) ( ON_BOARD ?auto_21972 ?auto_21973 ) ( SUPPORTS ?auto_21972 ?auto_21968 ) ( POWER_ON ?auto_21972 ) ( POINTING ?auto_21973 ?auto_21969 ) ( HAVE_IMAGE ?auto_21966 ?auto_21967 ) ( HAVE_IMAGE ?auto_21971 ?auto_21970 ) ( not ( = ?auto_21966 ?auto_21969 ) ) ( not ( = ?auto_21966 ?auto_21971 ) ) ( not ( = ?auto_21967 ?auto_21968 ) ) ( not ( = ?auto_21967 ?auto_21970 ) ) ( not ( = ?auto_21969 ?auto_21971 ) ) ( not ( = ?auto_21968 ?auto_21970 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21969 ?auto_21968 )
      ( GET-3IMAGE-VERIFY ?auto_21966 ?auto_21967 ?auto_21969 ?auto_21968 ?auto_21971 ?auto_21970 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21974 - DIRECTION
      ?auto_21975 - MODE
      ?auto_21977 - DIRECTION
      ?auto_21976 - MODE
      ?auto_21979 - DIRECTION
      ?auto_21978 - MODE
    )
    :vars
    (
      ?auto_21980 - INSTRUMENT
      ?auto_21981 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_21980 ) ( ON_BOARD ?auto_21980 ?auto_21981 ) ( SUPPORTS ?auto_21980 ?auto_21976 ) ( POWER_ON ?auto_21980 ) ( POINTING ?auto_21981 ?auto_21977 ) ( HAVE_IMAGE ?auto_21974 ?auto_21975 ) ( HAVE_IMAGE ?auto_21979 ?auto_21978 ) ( not ( = ?auto_21974 ?auto_21977 ) ) ( not ( = ?auto_21974 ?auto_21979 ) ) ( not ( = ?auto_21975 ?auto_21976 ) ) ( not ( = ?auto_21975 ?auto_21978 ) ) ( not ( = ?auto_21977 ?auto_21979 ) ) ( not ( = ?auto_21976 ?auto_21978 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21977 ?auto_21976 )
      ( GET-3IMAGE-VERIFY ?auto_21974 ?auto_21975 ?auto_21977 ?auto_21976 ?auto_21979 ?auto_21978 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_21990 - DIRECTION
      ?auto_21991 - MODE
      ?auto_21993 - DIRECTION
      ?auto_21992 - MODE
      ?auto_21995 - DIRECTION
      ?auto_21994 - MODE
    )
    :vars
    (
      ?auto_21996 - INSTRUMENT
      ?auto_21997 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_21996 ) ( ON_BOARD ?auto_21996 ?auto_21997 ) ( SUPPORTS ?auto_21996 ?auto_21991 ) ( POWER_ON ?auto_21996 ) ( POINTING ?auto_21997 ?auto_21990 ) ( HAVE_IMAGE ?auto_21993 ?auto_21992 ) ( HAVE_IMAGE ?auto_21995 ?auto_21994 ) ( not ( = ?auto_21990 ?auto_21993 ) ) ( not ( = ?auto_21990 ?auto_21995 ) ) ( not ( = ?auto_21991 ?auto_21992 ) ) ( not ( = ?auto_21991 ?auto_21994 ) ) ( not ( = ?auto_21993 ?auto_21995 ) ) ( not ( = ?auto_21992 ?auto_21994 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_21990 ?auto_21991 )
      ( GET-3IMAGE-VERIFY ?auto_21990 ?auto_21991 ?auto_21993 ?auto_21992 ?auto_21995 ?auto_21994 ) )
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
      ?auto_22004 - INSTRUMENT
      ?auto_22005 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_22004 ) ( ON_BOARD ?auto_22004 ?auto_22005 ) ( SUPPORTS ?auto_22004 ?auto_21999 ) ( POWER_ON ?auto_22004 ) ( POINTING ?auto_22005 ?auto_21998 ) ( HAVE_IMAGE ?auto_22001 ?auto_22000 ) ( HAVE_IMAGE ?auto_22003 ?auto_22002 ) ( not ( = ?auto_21998 ?auto_22001 ) ) ( not ( = ?auto_21998 ?auto_22003 ) ) ( not ( = ?auto_21999 ?auto_22000 ) ) ( not ( = ?auto_21999 ?auto_22002 ) ) ( not ( = ?auto_22001 ?auto_22003 ) ) ( not ( = ?auto_22000 ?auto_22002 ) ) )
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
      ?auto_22020 - INSTRUMENT
      ?auto_22021 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_22020 ) ( ON_BOARD ?auto_22020 ?auto_22021 ) ( SUPPORTS ?auto_22020 ?auto_22015 ) ( POWER_ON ?auto_22020 ) ( POINTING ?auto_22021 ?auto_22014 ) ( HAVE_IMAGE ?auto_22017 ?auto_22016 ) ( HAVE_IMAGE ?auto_22019 ?auto_22018 ) ( not ( = ?auto_22014 ?auto_22017 ) ) ( not ( = ?auto_22014 ?auto_22019 ) ) ( not ( = ?auto_22015 ?auto_22016 ) ) ( not ( = ?auto_22015 ?auto_22018 ) ) ( not ( = ?auto_22017 ?auto_22019 ) ) ( not ( = ?auto_22016 ?auto_22018 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_22014 ?auto_22015 )
      ( GET-3IMAGE-VERIFY ?auto_22014 ?auto_22015 ?auto_22017 ?auto_22016 ?auto_22019 ?auto_22018 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22022 - DIRECTION
      ?auto_22023 - MODE
      ?auto_22025 - DIRECTION
      ?auto_22024 - MODE
      ?auto_22027 - DIRECTION
      ?auto_22026 - MODE
    )
    :vars
    (
      ?auto_22028 - INSTRUMENT
      ?auto_22029 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_22028 ) ( ON_BOARD ?auto_22028 ?auto_22029 ) ( SUPPORTS ?auto_22028 ?auto_22023 ) ( POWER_ON ?auto_22028 ) ( POINTING ?auto_22029 ?auto_22022 ) ( HAVE_IMAGE ?auto_22025 ?auto_22024 ) ( HAVE_IMAGE ?auto_22027 ?auto_22026 ) ( not ( = ?auto_22022 ?auto_22025 ) ) ( not ( = ?auto_22022 ?auto_22027 ) ) ( not ( = ?auto_22023 ?auto_22024 ) ) ( not ( = ?auto_22023 ?auto_22026 ) ) ( not ( = ?auto_22025 ?auto_22027 ) ) ( not ( = ?auto_22024 ?auto_22026 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_22022 ?auto_22023 )
      ( GET-3IMAGE-VERIFY ?auto_22022 ?auto_22023 ?auto_22025 ?auto_22024 ?auto_22027 ?auto_22026 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_22062 - DIRECTION
      ?auto_22063 - MODE
    )
    :vars
    (
      ?auto_22064 - INSTRUMENT
      ?auto_22065 - SATELLITE
      ?auto_22066 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_22064 ) ( ON_BOARD ?auto_22064 ?auto_22065 ) ( SUPPORTS ?auto_22064 ?auto_22063 ) ( POWER_ON ?auto_22064 ) ( POINTING ?auto_22065 ?auto_22066 ) ( not ( = ?auto_22062 ?auto_22066 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_22065 ?auto_22062 ?auto_22066 )
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
      ?auto_22072 - INSTRUMENT
      ?auto_22073 - SATELLITE
      ?auto_22071 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_22072 ) ( ON_BOARD ?auto_22072 ?auto_22073 ) ( SUPPORTS ?auto_22072 ?auto_22069 ) ( POWER_ON ?auto_22072 ) ( POINTING ?auto_22073 ?auto_22071 ) ( not ( = ?auto_22070 ?auto_22071 ) ) ( HAVE_IMAGE ?auto_22067 ?auto_22068 ) ( not ( = ?auto_22067 ?auto_22070 ) ) ( not ( = ?auto_22067 ?auto_22071 ) ) ( not ( = ?auto_22068 ?auto_22069 ) ) )
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
      ?auto_22082 - INSTRUMENT
      ?auto_22080 - SATELLITE
      ?auto_22079 - DIRECTION
      ?auto_22081 - DIRECTION
      ?auto_22078 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_22082 ) ( ON_BOARD ?auto_22082 ?auto_22080 ) ( SUPPORTS ?auto_22082 ?auto_22076 ) ( POWER_ON ?auto_22082 ) ( POINTING ?auto_22080 ?auto_22079 ) ( not ( = ?auto_22077 ?auto_22079 ) ) ( HAVE_IMAGE ?auto_22081 ?auto_22078 ) ( not ( = ?auto_22081 ?auto_22077 ) ) ( not ( = ?auto_22081 ?auto_22079 ) ) ( not ( = ?auto_22078 ?auto_22076 ) ) ( HAVE_IMAGE ?auto_22074 ?auto_22075 ) ( not ( = ?auto_22074 ?auto_22077 ) ) ( not ( = ?auto_22074 ?auto_22079 ) ) ( not ( = ?auto_22074 ?auto_22081 ) ) ( not ( = ?auto_22075 ?auto_22076 ) ) ( not ( = ?auto_22075 ?auto_22078 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22081 ?auto_22078 ?auto_22077 ?auto_22076 )
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
      ?auto_22089 - INSTRUMENT
      ?auto_22088 - SATELLITE
      ?auto_22087 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_22089 ) ( ON_BOARD ?auto_22089 ?auto_22088 ) ( SUPPORTS ?auto_22089 ?auto_22084 ) ( POWER_ON ?auto_22089 ) ( POINTING ?auto_22088 ?auto_22087 ) ( not ( = ?auto_22083 ?auto_22087 ) ) ( HAVE_IMAGE ?auto_22086 ?auto_22085 ) ( not ( = ?auto_22086 ?auto_22083 ) ) ( not ( = ?auto_22086 ?auto_22087 ) ) ( not ( = ?auto_22085 ?auto_22084 ) ) )
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
      ?auto_22098 - INSTRUMENT
      ?auto_22096 - SATELLITE
      ?auto_22095 - DIRECTION
      ?auto_22097 - DIRECTION
      ?auto_22094 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_22098 ) ( ON_BOARD ?auto_22098 ?auto_22096 ) ( SUPPORTS ?auto_22098 ?auto_22091 ) ( POWER_ON ?auto_22098 ) ( POINTING ?auto_22096 ?auto_22095 ) ( not ( = ?auto_22090 ?auto_22095 ) ) ( HAVE_IMAGE ?auto_22097 ?auto_22094 ) ( not ( = ?auto_22097 ?auto_22090 ) ) ( not ( = ?auto_22097 ?auto_22095 ) ) ( not ( = ?auto_22094 ?auto_22091 ) ) ( HAVE_IMAGE ?auto_22093 ?auto_22092 ) ( not ( = ?auto_22090 ?auto_22093 ) ) ( not ( = ?auto_22091 ?auto_22092 ) ) ( not ( = ?auto_22093 ?auto_22095 ) ) ( not ( = ?auto_22093 ?auto_22097 ) ) ( not ( = ?auto_22092 ?auto_22094 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22097 ?auto_22094 ?auto_22090 ?auto_22091 )
      ( GET-2IMAGE-VERIFY ?auto_22090 ?auto_22091 ?auto_22093 ?auto_22092 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22108 - DIRECTION
      ?auto_22109 - MODE
      ?auto_22111 - DIRECTION
      ?auto_22110 - MODE
      ?auto_22113 - DIRECTION
      ?auto_22112 - MODE
    )
    :vars
    (
      ?auto_22116 - INSTRUMENT
      ?auto_22115 - SATELLITE
      ?auto_22114 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_22116 ) ( ON_BOARD ?auto_22116 ?auto_22115 ) ( SUPPORTS ?auto_22116 ?auto_22112 ) ( POWER_ON ?auto_22116 ) ( POINTING ?auto_22115 ?auto_22114 ) ( not ( = ?auto_22113 ?auto_22114 ) ) ( HAVE_IMAGE ?auto_22111 ?auto_22109 ) ( not ( = ?auto_22111 ?auto_22113 ) ) ( not ( = ?auto_22111 ?auto_22114 ) ) ( not ( = ?auto_22109 ?auto_22112 ) ) ( HAVE_IMAGE ?auto_22108 ?auto_22109 ) ( HAVE_IMAGE ?auto_22111 ?auto_22110 ) ( not ( = ?auto_22108 ?auto_22111 ) ) ( not ( = ?auto_22108 ?auto_22113 ) ) ( not ( = ?auto_22108 ?auto_22114 ) ) ( not ( = ?auto_22109 ?auto_22110 ) ) ( not ( = ?auto_22110 ?auto_22112 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22111 ?auto_22109 ?auto_22113 ?auto_22112 )
      ( GET-3IMAGE-VERIFY ?auto_22108 ?auto_22109 ?auto_22111 ?auto_22110 ?auto_22113 ?auto_22112 ) )
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
      ?auto_22125 - INSTRUMENT
      ?auto_22124 - SATELLITE
      ?auto_22123 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_22125 ) ( ON_BOARD ?auto_22125 ?auto_22124 ) ( SUPPORTS ?auto_22125 ?auto_22121 ) ( POWER_ON ?auto_22125 ) ( POINTING ?auto_22124 ?auto_22123 ) ( not ( = ?auto_22122 ?auto_22123 ) ) ( HAVE_IMAGE ?auto_22117 ?auto_22118 ) ( not ( = ?auto_22117 ?auto_22122 ) ) ( not ( = ?auto_22117 ?auto_22123 ) ) ( not ( = ?auto_22118 ?auto_22121 ) ) ( HAVE_IMAGE ?auto_22120 ?auto_22119 ) ( not ( = ?auto_22117 ?auto_22120 ) ) ( not ( = ?auto_22118 ?auto_22119 ) ) ( not ( = ?auto_22120 ?auto_22122 ) ) ( not ( = ?auto_22120 ?auto_22123 ) ) ( not ( = ?auto_22119 ?auto_22121 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22117 ?auto_22118 ?auto_22122 ?auto_22121 )
      ( GET-3IMAGE-VERIFY ?auto_22117 ?auto_22118 ?auto_22120 ?auto_22119 ?auto_22122 ?auto_22121 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22126 - DIRECTION
      ?auto_22127 - MODE
      ?auto_22129 - DIRECTION
      ?auto_22128 - MODE
      ?auto_22131 - DIRECTION
      ?auto_22130 - MODE
    )
    :vars
    (
      ?auto_22134 - INSTRUMENT
      ?auto_22133 - SATELLITE
      ?auto_22132 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_22134 ) ( ON_BOARD ?auto_22134 ?auto_22133 ) ( SUPPORTS ?auto_22134 ?auto_22128 ) ( POWER_ON ?auto_22134 ) ( POINTING ?auto_22133 ?auto_22132 ) ( not ( = ?auto_22129 ?auto_22132 ) ) ( HAVE_IMAGE ?auto_22131 ?auto_22130 ) ( not ( = ?auto_22131 ?auto_22129 ) ) ( not ( = ?auto_22131 ?auto_22132 ) ) ( not ( = ?auto_22130 ?auto_22128 ) ) ( HAVE_IMAGE ?auto_22126 ?auto_22127 ) ( not ( = ?auto_22126 ?auto_22129 ) ) ( not ( = ?auto_22126 ?auto_22131 ) ) ( not ( = ?auto_22126 ?auto_22132 ) ) ( not ( = ?auto_22127 ?auto_22128 ) ) ( not ( = ?auto_22127 ?auto_22130 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22131 ?auto_22130 ?auto_22129 ?auto_22128 )
      ( GET-3IMAGE-VERIFY ?auto_22126 ?auto_22127 ?auto_22129 ?auto_22128 ?auto_22131 ?auto_22130 ) )
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
      ?auto_22143 - INSTRUMENT
      ?auto_22142 - SATELLITE
      ?auto_22141 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_22143 ) ( ON_BOARD ?auto_22143 ?auto_22142 ) ( SUPPORTS ?auto_22143 ?auto_22137 ) ( POWER_ON ?auto_22143 ) ( POINTING ?auto_22142 ?auto_22141 ) ( not ( = ?auto_22138 ?auto_22141 ) ) ( HAVE_IMAGE ?auto_22135 ?auto_22136 ) ( not ( = ?auto_22135 ?auto_22138 ) ) ( not ( = ?auto_22135 ?auto_22141 ) ) ( not ( = ?auto_22136 ?auto_22137 ) ) ( HAVE_IMAGE ?auto_22140 ?auto_22139 ) ( not ( = ?auto_22135 ?auto_22140 ) ) ( not ( = ?auto_22136 ?auto_22139 ) ) ( not ( = ?auto_22138 ?auto_22140 ) ) ( not ( = ?auto_22137 ?auto_22139 ) ) ( not ( = ?auto_22140 ?auto_22141 ) ) )
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
      ?auto_22161 - INSTRUMENT
      ?auto_22160 - SATELLITE
      ?auto_22159 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_22161 ) ( ON_BOARD ?auto_22161 ?auto_22160 ) ( SUPPORTS ?auto_22161 ?auto_22157 ) ( POWER_ON ?auto_22161 ) ( POINTING ?auto_22160 ?auto_22159 ) ( not ( = ?auto_22158 ?auto_22159 ) ) ( HAVE_IMAGE ?auto_22156 ?auto_22155 ) ( not ( = ?auto_22156 ?auto_22158 ) ) ( not ( = ?auto_22156 ?auto_22159 ) ) ( not ( = ?auto_22155 ?auto_22157 ) ) ( HAVE_IMAGE ?auto_22153 ?auto_22154 ) ( not ( = ?auto_22153 ?auto_22156 ) ) ( not ( = ?auto_22153 ?auto_22158 ) ) ( not ( = ?auto_22153 ?auto_22159 ) ) ( not ( = ?auto_22154 ?auto_22155 ) ) ( not ( = ?auto_22154 ?auto_22157 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22156 ?auto_22155 ?auto_22158 ?auto_22157 )
      ( GET-3IMAGE-VERIFY ?auto_22153 ?auto_22154 ?auto_22156 ?auto_22155 ?auto_22158 ?auto_22157 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22162 - DIRECTION
      ?auto_22163 - MODE
      ?auto_22165 - DIRECTION
      ?auto_22164 - MODE
      ?auto_22167 - DIRECTION
      ?auto_22166 - MODE
    )
    :vars
    (
      ?auto_22172 - INSTRUMENT
      ?auto_22170 - SATELLITE
      ?auto_22169 - DIRECTION
      ?auto_22171 - DIRECTION
      ?auto_22168 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_22172 ) ( ON_BOARD ?auto_22172 ?auto_22170 ) ( SUPPORTS ?auto_22172 ?auto_22166 ) ( POWER_ON ?auto_22172 ) ( POINTING ?auto_22170 ?auto_22169 ) ( not ( = ?auto_22167 ?auto_22169 ) ) ( HAVE_IMAGE ?auto_22171 ?auto_22168 ) ( not ( = ?auto_22171 ?auto_22167 ) ) ( not ( = ?auto_22171 ?auto_22169 ) ) ( not ( = ?auto_22168 ?auto_22166 ) ) ( HAVE_IMAGE ?auto_22162 ?auto_22163 ) ( HAVE_IMAGE ?auto_22165 ?auto_22164 ) ( not ( = ?auto_22162 ?auto_22165 ) ) ( not ( = ?auto_22162 ?auto_22167 ) ) ( not ( = ?auto_22162 ?auto_22169 ) ) ( not ( = ?auto_22162 ?auto_22171 ) ) ( not ( = ?auto_22163 ?auto_22164 ) ) ( not ( = ?auto_22163 ?auto_22166 ) ) ( not ( = ?auto_22163 ?auto_22168 ) ) ( not ( = ?auto_22165 ?auto_22167 ) ) ( not ( = ?auto_22165 ?auto_22169 ) ) ( not ( = ?auto_22165 ?auto_22171 ) ) ( not ( = ?auto_22164 ?auto_22166 ) ) ( not ( = ?auto_22164 ?auto_22168 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22171 ?auto_22168 ?auto_22167 ?auto_22166 )
      ( GET-3IMAGE-VERIFY ?auto_22162 ?auto_22163 ?auto_22165 ?auto_22164 ?auto_22167 ?auto_22166 ) )
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
      ?auto_22181 - INSTRUMENT
      ?auto_22180 - SATELLITE
      ?auto_22179 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_22181 ) ( ON_BOARD ?auto_22181 ?auto_22180 ) ( SUPPORTS ?auto_22181 ?auto_22175 ) ( POWER_ON ?auto_22181 ) ( POINTING ?auto_22180 ?auto_22179 ) ( not ( = ?auto_22176 ?auto_22179 ) ) ( HAVE_IMAGE ?auto_22178 ?auto_22177 ) ( not ( = ?auto_22178 ?auto_22176 ) ) ( not ( = ?auto_22178 ?auto_22179 ) ) ( not ( = ?auto_22177 ?auto_22175 ) ) ( HAVE_IMAGE ?auto_22173 ?auto_22174 ) ( not ( = ?auto_22173 ?auto_22176 ) ) ( not ( = ?auto_22173 ?auto_22178 ) ) ( not ( = ?auto_22173 ?auto_22179 ) ) ( not ( = ?auto_22174 ?auto_22175 ) ) ( not ( = ?auto_22174 ?auto_22177 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22178 ?auto_22177 ?auto_22176 ?auto_22175 )
      ( GET-3IMAGE-VERIFY ?auto_22173 ?auto_22174 ?auto_22176 ?auto_22175 ?auto_22178 ?auto_22177 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22182 - DIRECTION
      ?auto_22183 - MODE
      ?auto_22185 - DIRECTION
      ?auto_22184 - MODE
      ?auto_22187 - DIRECTION
      ?auto_22186 - MODE
    )
    :vars
    (
      ?auto_22192 - INSTRUMENT
      ?auto_22190 - SATELLITE
      ?auto_22189 - DIRECTION
      ?auto_22191 - DIRECTION
      ?auto_22188 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_22192 ) ( ON_BOARD ?auto_22192 ?auto_22190 ) ( SUPPORTS ?auto_22192 ?auto_22184 ) ( POWER_ON ?auto_22192 ) ( POINTING ?auto_22190 ?auto_22189 ) ( not ( = ?auto_22185 ?auto_22189 ) ) ( HAVE_IMAGE ?auto_22191 ?auto_22188 ) ( not ( = ?auto_22191 ?auto_22185 ) ) ( not ( = ?auto_22191 ?auto_22189 ) ) ( not ( = ?auto_22188 ?auto_22184 ) ) ( HAVE_IMAGE ?auto_22182 ?auto_22183 ) ( HAVE_IMAGE ?auto_22187 ?auto_22186 ) ( not ( = ?auto_22182 ?auto_22185 ) ) ( not ( = ?auto_22182 ?auto_22187 ) ) ( not ( = ?auto_22182 ?auto_22189 ) ) ( not ( = ?auto_22182 ?auto_22191 ) ) ( not ( = ?auto_22183 ?auto_22184 ) ) ( not ( = ?auto_22183 ?auto_22186 ) ) ( not ( = ?auto_22183 ?auto_22188 ) ) ( not ( = ?auto_22185 ?auto_22187 ) ) ( not ( = ?auto_22184 ?auto_22186 ) ) ( not ( = ?auto_22187 ?auto_22189 ) ) ( not ( = ?auto_22187 ?auto_22191 ) ) ( not ( = ?auto_22186 ?auto_22188 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22191 ?auto_22188 ?auto_22185 ?auto_22184 )
      ( GET-3IMAGE-VERIFY ?auto_22182 ?auto_22183 ?auto_22185 ?auto_22184 ?auto_22187 ?auto_22186 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22204 - DIRECTION
      ?auto_22205 - MODE
      ?auto_22207 - DIRECTION
      ?auto_22206 - MODE
      ?auto_22209 - DIRECTION
      ?auto_22208 - MODE
    )
    :vars
    (
      ?auto_22212 - INSTRUMENT
      ?auto_22211 - SATELLITE
      ?auto_22210 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_22212 ) ( ON_BOARD ?auto_22212 ?auto_22211 ) ( SUPPORTS ?auto_22212 ?auto_22205 ) ( POWER_ON ?auto_22212 ) ( POINTING ?auto_22211 ?auto_22210 ) ( not ( = ?auto_22204 ?auto_22210 ) ) ( HAVE_IMAGE ?auto_22207 ?auto_22208 ) ( not ( = ?auto_22207 ?auto_22204 ) ) ( not ( = ?auto_22207 ?auto_22210 ) ) ( not ( = ?auto_22208 ?auto_22205 ) ) ( HAVE_IMAGE ?auto_22207 ?auto_22206 ) ( HAVE_IMAGE ?auto_22209 ?auto_22208 ) ( not ( = ?auto_22204 ?auto_22209 ) ) ( not ( = ?auto_22205 ?auto_22206 ) ) ( not ( = ?auto_22207 ?auto_22209 ) ) ( not ( = ?auto_22206 ?auto_22208 ) ) ( not ( = ?auto_22209 ?auto_22210 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22207 ?auto_22208 ?auto_22204 ?auto_22205 )
      ( GET-3IMAGE-VERIFY ?auto_22204 ?auto_22205 ?auto_22207 ?auto_22206 ?auto_22209 ?auto_22208 ) )
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
      ?auto_22221 - INSTRUMENT
      ?auto_22220 - SATELLITE
      ?auto_22219 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_22221 ) ( ON_BOARD ?auto_22221 ?auto_22220 ) ( SUPPORTS ?auto_22221 ?auto_22214 ) ( POWER_ON ?auto_22221 ) ( POINTING ?auto_22220 ?auto_22219 ) ( not ( = ?auto_22213 ?auto_22219 ) ) ( HAVE_IMAGE ?auto_22216 ?auto_22215 ) ( not ( = ?auto_22216 ?auto_22213 ) ) ( not ( = ?auto_22216 ?auto_22219 ) ) ( not ( = ?auto_22215 ?auto_22214 ) ) ( HAVE_IMAGE ?auto_22218 ?auto_22217 ) ( not ( = ?auto_22213 ?auto_22218 ) ) ( not ( = ?auto_22214 ?auto_22217 ) ) ( not ( = ?auto_22216 ?auto_22218 ) ) ( not ( = ?auto_22215 ?auto_22217 ) ) ( not ( = ?auto_22218 ?auto_22219 ) ) )
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
      ?auto_22239 - INSTRUMENT
      ?auto_22238 - SATELLITE
      ?auto_22237 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_22239 ) ( ON_BOARD ?auto_22239 ?auto_22238 ) ( SUPPORTS ?auto_22239 ?auto_22232 ) ( POWER_ON ?auto_22239 ) ( POINTING ?auto_22238 ?auto_22237 ) ( not ( = ?auto_22231 ?auto_22237 ) ) ( HAVE_IMAGE ?auto_22236 ?auto_22235 ) ( not ( = ?auto_22236 ?auto_22231 ) ) ( not ( = ?auto_22236 ?auto_22237 ) ) ( not ( = ?auto_22235 ?auto_22232 ) ) ( HAVE_IMAGE ?auto_22234 ?auto_22233 ) ( not ( = ?auto_22231 ?auto_22234 ) ) ( not ( = ?auto_22232 ?auto_22233 ) ) ( not ( = ?auto_22234 ?auto_22236 ) ) ( not ( = ?auto_22234 ?auto_22237 ) ) ( not ( = ?auto_22233 ?auto_22235 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22236 ?auto_22235 ?auto_22231 ?auto_22232 )
      ( GET-3IMAGE-VERIFY ?auto_22231 ?auto_22232 ?auto_22234 ?auto_22233 ?auto_22236 ?auto_22235 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22240 - DIRECTION
      ?auto_22241 - MODE
      ?auto_22243 - DIRECTION
      ?auto_22242 - MODE
      ?auto_22245 - DIRECTION
      ?auto_22244 - MODE
    )
    :vars
    (
      ?auto_22250 - INSTRUMENT
      ?auto_22248 - SATELLITE
      ?auto_22247 - DIRECTION
      ?auto_22249 - DIRECTION
      ?auto_22246 - MODE
    )
    :precondition
    ( and ( CALIBRATED ?auto_22250 ) ( ON_BOARD ?auto_22250 ?auto_22248 ) ( SUPPORTS ?auto_22250 ?auto_22241 ) ( POWER_ON ?auto_22250 ) ( POINTING ?auto_22248 ?auto_22247 ) ( not ( = ?auto_22240 ?auto_22247 ) ) ( HAVE_IMAGE ?auto_22249 ?auto_22246 ) ( not ( = ?auto_22249 ?auto_22240 ) ) ( not ( = ?auto_22249 ?auto_22247 ) ) ( not ( = ?auto_22246 ?auto_22241 ) ) ( HAVE_IMAGE ?auto_22243 ?auto_22242 ) ( HAVE_IMAGE ?auto_22245 ?auto_22244 ) ( not ( = ?auto_22240 ?auto_22243 ) ) ( not ( = ?auto_22240 ?auto_22245 ) ) ( not ( = ?auto_22241 ?auto_22242 ) ) ( not ( = ?auto_22241 ?auto_22244 ) ) ( not ( = ?auto_22243 ?auto_22245 ) ) ( not ( = ?auto_22243 ?auto_22247 ) ) ( not ( = ?auto_22243 ?auto_22249 ) ) ( not ( = ?auto_22242 ?auto_22244 ) ) ( not ( = ?auto_22242 ?auto_22246 ) ) ( not ( = ?auto_22245 ?auto_22247 ) ) ( not ( = ?auto_22245 ?auto_22249 ) ) ( not ( = ?auto_22244 ?auto_22246 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22249 ?auto_22246 ?auto_22240 ?auto_22241 )
      ( GET-3IMAGE-VERIFY ?auto_22240 ?auto_22241 ?auto_22243 ?auto_22242 ?auto_22245 ?auto_22244 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_22293 - DIRECTION
      ?auto_22294 - MODE
    )
    :vars
    (
      ?auto_22299 - INSTRUMENT
      ?auto_22297 - SATELLITE
      ?auto_22296 - DIRECTION
      ?auto_22298 - DIRECTION
      ?auto_22295 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_22299 ?auto_22297 ) ( SUPPORTS ?auto_22299 ?auto_22294 ) ( POWER_ON ?auto_22299 ) ( POINTING ?auto_22297 ?auto_22296 ) ( not ( = ?auto_22293 ?auto_22296 ) ) ( HAVE_IMAGE ?auto_22298 ?auto_22295 ) ( not ( = ?auto_22298 ?auto_22293 ) ) ( not ( = ?auto_22298 ?auto_22296 ) ) ( not ( = ?auto_22295 ?auto_22294 ) ) ( CALIBRATION_TARGET ?auto_22299 ?auto_22296 ) ( NOT_CALIBRATED ?auto_22299 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_22297 ?auto_22299 ?auto_22296 )
      ( GET-2IMAGE ?auto_22298 ?auto_22295 ?auto_22293 ?auto_22294 )
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
      ?auto_22305 - SATELLITE
      ?auto_22304 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22306 ?auto_22305 ) ( SUPPORTS ?auto_22306 ?auto_22302 ) ( POWER_ON ?auto_22306 ) ( POINTING ?auto_22305 ?auto_22304 ) ( not ( = ?auto_22303 ?auto_22304 ) ) ( HAVE_IMAGE ?auto_22300 ?auto_22301 ) ( not ( = ?auto_22300 ?auto_22303 ) ) ( not ( = ?auto_22300 ?auto_22304 ) ) ( not ( = ?auto_22301 ?auto_22302 ) ) ( CALIBRATION_TARGET ?auto_22306 ?auto_22304 ) ( NOT_CALIBRATED ?auto_22306 ) )
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
      ?auto_22315 - INSTRUMENT
      ?auto_22313 - SATELLITE
      ?auto_22312 - DIRECTION
      ?auto_22314 - DIRECTION
      ?auto_22311 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_22315 ?auto_22313 ) ( SUPPORTS ?auto_22315 ?auto_22309 ) ( POWER_ON ?auto_22315 ) ( POINTING ?auto_22313 ?auto_22312 ) ( not ( = ?auto_22310 ?auto_22312 ) ) ( HAVE_IMAGE ?auto_22314 ?auto_22311 ) ( not ( = ?auto_22314 ?auto_22310 ) ) ( not ( = ?auto_22314 ?auto_22312 ) ) ( not ( = ?auto_22311 ?auto_22309 ) ) ( CALIBRATION_TARGET ?auto_22315 ?auto_22312 ) ( NOT_CALIBRATED ?auto_22315 ) ( HAVE_IMAGE ?auto_22307 ?auto_22308 ) ( not ( = ?auto_22307 ?auto_22310 ) ) ( not ( = ?auto_22307 ?auto_22312 ) ) ( not ( = ?auto_22307 ?auto_22314 ) ) ( not ( = ?auto_22308 ?auto_22309 ) ) ( not ( = ?auto_22308 ?auto_22311 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22314 ?auto_22311 ?auto_22310 ?auto_22309 )
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
      ?auto_22322 - INSTRUMENT
      ?auto_22321 - SATELLITE
      ?auto_22320 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22322 ?auto_22321 ) ( SUPPORTS ?auto_22322 ?auto_22317 ) ( POWER_ON ?auto_22322 ) ( POINTING ?auto_22321 ?auto_22320 ) ( not ( = ?auto_22316 ?auto_22320 ) ) ( HAVE_IMAGE ?auto_22319 ?auto_22318 ) ( not ( = ?auto_22319 ?auto_22316 ) ) ( not ( = ?auto_22319 ?auto_22320 ) ) ( not ( = ?auto_22318 ?auto_22317 ) ) ( CALIBRATION_TARGET ?auto_22322 ?auto_22320 ) ( NOT_CALIBRATED ?auto_22322 ) )
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
      ?auto_22331 - INSTRUMENT
      ?auto_22329 - SATELLITE
      ?auto_22328 - DIRECTION
      ?auto_22330 - DIRECTION
      ?auto_22327 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_22331 ?auto_22329 ) ( SUPPORTS ?auto_22331 ?auto_22324 ) ( POWER_ON ?auto_22331 ) ( POINTING ?auto_22329 ?auto_22328 ) ( not ( = ?auto_22323 ?auto_22328 ) ) ( HAVE_IMAGE ?auto_22330 ?auto_22327 ) ( not ( = ?auto_22330 ?auto_22323 ) ) ( not ( = ?auto_22330 ?auto_22328 ) ) ( not ( = ?auto_22327 ?auto_22324 ) ) ( CALIBRATION_TARGET ?auto_22331 ?auto_22328 ) ( NOT_CALIBRATED ?auto_22331 ) ( HAVE_IMAGE ?auto_22326 ?auto_22325 ) ( not ( = ?auto_22323 ?auto_22326 ) ) ( not ( = ?auto_22324 ?auto_22325 ) ) ( not ( = ?auto_22326 ?auto_22328 ) ) ( not ( = ?auto_22326 ?auto_22330 ) ) ( not ( = ?auto_22325 ?auto_22327 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22330 ?auto_22327 ?auto_22323 ?auto_22324 )
      ( GET-2IMAGE-VERIFY ?auto_22323 ?auto_22324 ?auto_22326 ?auto_22325 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22341 - DIRECTION
      ?auto_22342 - MODE
      ?auto_22344 - DIRECTION
      ?auto_22343 - MODE
      ?auto_22346 - DIRECTION
      ?auto_22345 - MODE
    )
    :vars
    (
      ?auto_22349 - INSTRUMENT
      ?auto_22348 - SATELLITE
      ?auto_22347 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22349 ?auto_22348 ) ( SUPPORTS ?auto_22349 ?auto_22345 ) ( POWER_ON ?auto_22349 ) ( POINTING ?auto_22348 ?auto_22347 ) ( not ( = ?auto_22346 ?auto_22347 ) ) ( HAVE_IMAGE ?auto_22344 ?auto_22342 ) ( not ( = ?auto_22344 ?auto_22346 ) ) ( not ( = ?auto_22344 ?auto_22347 ) ) ( not ( = ?auto_22342 ?auto_22345 ) ) ( CALIBRATION_TARGET ?auto_22349 ?auto_22347 ) ( NOT_CALIBRATED ?auto_22349 ) ( HAVE_IMAGE ?auto_22341 ?auto_22342 ) ( HAVE_IMAGE ?auto_22344 ?auto_22343 ) ( not ( = ?auto_22341 ?auto_22344 ) ) ( not ( = ?auto_22341 ?auto_22346 ) ) ( not ( = ?auto_22341 ?auto_22347 ) ) ( not ( = ?auto_22342 ?auto_22343 ) ) ( not ( = ?auto_22343 ?auto_22345 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22344 ?auto_22342 ?auto_22346 ?auto_22345 )
      ( GET-3IMAGE-VERIFY ?auto_22341 ?auto_22342 ?auto_22344 ?auto_22343 ?auto_22346 ?auto_22345 ) )
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
      ?auto_22358 - INSTRUMENT
      ?auto_22357 - SATELLITE
      ?auto_22356 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22358 ?auto_22357 ) ( SUPPORTS ?auto_22358 ?auto_22354 ) ( POWER_ON ?auto_22358 ) ( POINTING ?auto_22357 ?auto_22356 ) ( not ( = ?auto_22355 ?auto_22356 ) ) ( HAVE_IMAGE ?auto_22350 ?auto_22351 ) ( not ( = ?auto_22350 ?auto_22355 ) ) ( not ( = ?auto_22350 ?auto_22356 ) ) ( not ( = ?auto_22351 ?auto_22354 ) ) ( CALIBRATION_TARGET ?auto_22358 ?auto_22356 ) ( NOT_CALIBRATED ?auto_22358 ) ( HAVE_IMAGE ?auto_22353 ?auto_22352 ) ( not ( = ?auto_22350 ?auto_22353 ) ) ( not ( = ?auto_22351 ?auto_22352 ) ) ( not ( = ?auto_22353 ?auto_22355 ) ) ( not ( = ?auto_22353 ?auto_22356 ) ) ( not ( = ?auto_22352 ?auto_22354 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22350 ?auto_22351 ?auto_22355 ?auto_22354 )
      ( GET-3IMAGE-VERIFY ?auto_22350 ?auto_22351 ?auto_22353 ?auto_22352 ?auto_22355 ?auto_22354 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22359 - DIRECTION
      ?auto_22360 - MODE
      ?auto_22362 - DIRECTION
      ?auto_22361 - MODE
      ?auto_22364 - DIRECTION
      ?auto_22363 - MODE
    )
    :vars
    (
      ?auto_22367 - INSTRUMENT
      ?auto_22366 - SATELLITE
      ?auto_22365 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22367 ?auto_22366 ) ( SUPPORTS ?auto_22367 ?auto_22361 ) ( POWER_ON ?auto_22367 ) ( POINTING ?auto_22366 ?auto_22365 ) ( not ( = ?auto_22362 ?auto_22365 ) ) ( HAVE_IMAGE ?auto_22364 ?auto_22363 ) ( not ( = ?auto_22364 ?auto_22362 ) ) ( not ( = ?auto_22364 ?auto_22365 ) ) ( not ( = ?auto_22363 ?auto_22361 ) ) ( CALIBRATION_TARGET ?auto_22367 ?auto_22365 ) ( NOT_CALIBRATED ?auto_22367 ) ( HAVE_IMAGE ?auto_22359 ?auto_22360 ) ( not ( = ?auto_22359 ?auto_22362 ) ) ( not ( = ?auto_22359 ?auto_22364 ) ) ( not ( = ?auto_22359 ?auto_22365 ) ) ( not ( = ?auto_22360 ?auto_22361 ) ) ( not ( = ?auto_22360 ?auto_22363 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22364 ?auto_22363 ?auto_22362 ?auto_22361 )
      ( GET-3IMAGE-VERIFY ?auto_22359 ?auto_22360 ?auto_22362 ?auto_22361 ?auto_22364 ?auto_22363 ) )
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
      ?auto_22376 - INSTRUMENT
      ?auto_22375 - SATELLITE
      ?auto_22374 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22376 ?auto_22375 ) ( SUPPORTS ?auto_22376 ?auto_22370 ) ( POWER_ON ?auto_22376 ) ( POINTING ?auto_22375 ?auto_22374 ) ( not ( = ?auto_22371 ?auto_22374 ) ) ( HAVE_IMAGE ?auto_22368 ?auto_22369 ) ( not ( = ?auto_22368 ?auto_22371 ) ) ( not ( = ?auto_22368 ?auto_22374 ) ) ( not ( = ?auto_22369 ?auto_22370 ) ) ( CALIBRATION_TARGET ?auto_22376 ?auto_22374 ) ( NOT_CALIBRATED ?auto_22376 ) ( HAVE_IMAGE ?auto_22373 ?auto_22372 ) ( not ( = ?auto_22368 ?auto_22373 ) ) ( not ( = ?auto_22369 ?auto_22372 ) ) ( not ( = ?auto_22371 ?auto_22373 ) ) ( not ( = ?auto_22370 ?auto_22372 ) ) ( not ( = ?auto_22373 ?auto_22374 ) ) )
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
      ?auto_22394 - INSTRUMENT
      ?auto_22393 - SATELLITE
      ?auto_22392 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22394 ?auto_22393 ) ( SUPPORTS ?auto_22394 ?auto_22390 ) ( POWER_ON ?auto_22394 ) ( POINTING ?auto_22393 ?auto_22392 ) ( not ( = ?auto_22391 ?auto_22392 ) ) ( HAVE_IMAGE ?auto_22389 ?auto_22388 ) ( not ( = ?auto_22389 ?auto_22391 ) ) ( not ( = ?auto_22389 ?auto_22392 ) ) ( not ( = ?auto_22388 ?auto_22390 ) ) ( CALIBRATION_TARGET ?auto_22394 ?auto_22392 ) ( NOT_CALIBRATED ?auto_22394 ) ( HAVE_IMAGE ?auto_22386 ?auto_22387 ) ( not ( = ?auto_22386 ?auto_22389 ) ) ( not ( = ?auto_22386 ?auto_22391 ) ) ( not ( = ?auto_22386 ?auto_22392 ) ) ( not ( = ?auto_22387 ?auto_22388 ) ) ( not ( = ?auto_22387 ?auto_22390 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22389 ?auto_22388 ?auto_22391 ?auto_22390 )
      ( GET-3IMAGE-VERIFY ?auto_22386 ?auto_22387 ?auto_22389 ?auto_22388 ?auto_22391 ?auto_22390 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22395 - DIRECTION
      ?auto_22396 - MODE
      ?auto_22398 - DIRECTION
      ?auto_22397 - MODE
      ?auto_22400 - DIRECTION
      ?auto_22399 - MODE
    )
    :vars
    (
      ?auto_22405 - INSTRUMENT
      ?auto_22403 - SATELLITE
      ?auto_22402 - DIRECTION
      ?auto_22404 - DIRECTION
      ?auto_22401 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_22405 ?auto_22403 ) ( SUPPORTS ?auto_22405 ?auto_22399 ) ( POWER_ON ?auto_22405 ) ( POINTING ?auto_22403 ?auto_22402 ) ( not ( = ?auto_22400 ?auto_22402 ) ) ( HAVE_IMAGE ?auto_22404 ?auto_22401 ) ( not ( = ?auto_22404 ?auto_22400 ) ) ( not ( = ?auto_22404 ?auto_22402 ) ) ( not ( = ?auto_22401 ?auto_22399 ) ) ( CALIBRATION_TARGET ?auto_22405 ?auto_22402 ) ( NOT_CALIBRATED ?auto_22405 ) ( HAVE_IMAGE ?auto_22395 ?auto_22396 ) ( HAVE_IMAGE ?auto_22398 ?auto_22397 ) ( not ( = ?auto_22395 ?auto_22398 ) ) ( not ( = ?auto_22395 ?auto_22400 ) ) ( not ( = ?auto_22395 ?auto_22402 ) ) ( not ( = ?auto_22395 ?auto_22404 ) ) ( not ( = ?auto_22396 ?auto_22397 ) ) ( not ( = ?auto_22396 ?auto_22399 ) ) ( not ( = ?auto_22396 ?auto_22401 ) ) ( not ( = ?auto_22398 ?auto_22400 ) ) ( not ( = ?auto_22398 ?auto_22402 ) ) ( not ( = ?auto_22398 ?auto_22404 ) ) ( not ( = ?auto_22397 ?auto_22399 ) ) ( not ( = ?auto_22397 ?auto_22401 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22404 ?auto_22401 ?auto_22400 ?auto_22399 )
      ( GET-3IMAGE-VERIFY ?auto_22395 ?auto_22396 ?auto_22398 ?auto_22397 ?auto_22400 ?auto_22399 ) )
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
      ?auto_22414 - INSTRUMENT
      ?auto_22413 - SATELLITE
      ?auto_22412 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22414 ?auto_22413 ) ( SUPPORTS ?auto_22414 ?auto_22408 ) ( POWER_ON ?auto_22414 ) ( POINTING ?auto_22413 ?auto_22412 ) ( not ( = ?auto_22409 ?auto_22412 ) ) ( HAVE_IMAGE ?auto_22411 ?auto_22410 ) ( not ( = ?auto_22411 ?auto_22409 ) ) ( not ( = ?auto_22411 ?auto_22412 ) ) ( not ( = ?auto_22410 ?auto_22408 ) ) ( CALIBRATION_TARGET ?auto_22414 ?auto_22412 ) ( NOT_CALIBRATED ?auto_22414 ) ( HAVE_IMAGE ?auto_22406 ?auto_22407 ) ( not ( = ?auto_22406 ?auto_22409 ) ) ( not ( = ?auto_22406 ?auto_22411 ) ) ( not ( = ?auto_22406 ?auto_22412 ) ) ( not ( = ?auto_22407 ?auto_22408 ) ) ( not ( = ?auto_22407 ?auto_22410 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22411 ?auto_22410 ?auto_22409 ?auto_22408 )
      ( GET-3IMAGE-VERIFY ?auto_22406 ?auto_22407 ?auto_22409 ?auto_22408 ?auto_22411 ?auto_22410 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22415 - DIRECTION
      ?auto_22416 - MODE
      ?auto_22418 - DIRECTION
      ?auto_22417 - MODE
      ?auto_22420 - DIRECTION
      ?auto_22419 - MODE
    )
    :vars
    (
      ?auto_22425 - INSTRUMENT
      ?auto_22423 - SATELLITE
      ?auto_22422 - DIRECTION
      ?auto_22424 - DIRECTION
      ?auto_22421 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_22425 ?auto_22423 ) ( SUPPORTS ?auto_22425 ?auto_22417 ) ( POWER_ON ?auto_22425 ) ( POINTING ?auto_22423 ?auto_22422 ) ( not ( = ?auto_22418 ?auto_22422 ) ) ( HAVE_IMAGE ?auto_22424 ?auto_22421 ) ( not ( = ?auto_22424 ?auto_22418 ) ) ( not ( = ?auto_22424 ?auto_22422 ) ) ( not ( = ?auto_22421 ?auto_22417 ) ) ( CALIBRATION_TARGET ?auto_22425 ?auto_22422 ) ( NOT_CALIBRATED ?auto_22425 ) ( HAVE_IMAGE ?auto_22415 ?auto_22416 ) ( HAVE_IMAGE ?auto_22420 ?auto_22419 ) ( not ( = ?auto_22415 ?auto_22418 ) ) ( not ( = ?auto_22415 ?auto_22420 ) ) ( not ( = ?auto_22415 ?auto_22422 ) ) ( not ( = ?auto_22415 ?auto_22424 ) ) ( not ( = ?auto_22416 ?auto_22417 ) ) ( not ( = ?auto_22416 ?auto_22419 ) ) ( not ( = ?auto_22416 ?auto_22421 ) ) ( not ( = ?auto_22418 ?auto_22420 ) ) ( not ( = ?auto_22417 ?auto_22419 ) ) ( not ( = ?auto_22420 ?auto_22422 ) ) ( not ( = ?auto_22420 ?auto_22424 ) ) ( not ( = ?auto_22419 ?auto_22421 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22424 ?auto_22421 ?auto_22418 ?auto_22417 )
      ( GET-3IMAGE-VERIFY ?auto_22415 ?auto_22416 ?auto_22418 ?auto_22417 ?auto_22420 ?auto_22419 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22437 - DIRECTION
      ?auto_22438 - MODE
      ?auto_22440 - DIRECTION
      ?auto_22439 - MODE
      ?auto_22442 - DIRECTION
      ?auto_22441 - MODE
    )
    :vars
    (
      ?auto_22445 - INSTRUMENT
      ?auto_22444 - SATELLITE
      ?auto_22443 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22445 ?auto_22444 ) ( SUPPORTS ?auto_22445 ?auto_22438 ) ( POWER_ON ?auto_22445 ) ( POINTING ?auto_22444 ?auto_22443 ) ( not ( = ?auto_22437 ?auto_22443 ) ) ( HAVE_IMAGE ?auto_22442 ?auto_22441 ) ( not ( = ?auto_22442 ?auto_22437 ) ) ( not ( = ?auto_22442 ?auto_22443 ) ) ( not ( = ?auto_22441 ?auto_22438 ) ) ( CALIBRATION_TARGET ?auto_22445 ?auto_22443 ) ( NOT_CALIBRATED ?auto_22445 ) ( HAVE_IMAGE ?auto_22440 ?auto_22439 ) ( not ( = ?auto_22437 ?auto_22440 ) ) ( not ( = ?auto_22438 ?auto_22439 ) ) ( not ( = ?auto_22440 ?auto_22442 ) ) ( not ( = ?auto_22440 ?auto_22443 ) ) ( not ( = ?auto_22439 ?auto_22441 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22442 ?auto_22441 ?auto_22437 ?auto_22438 )
      ( GET-3IMAGE-VERIFY ?auto_22437 ?auto_22438 ?auto_22440 ?auto_22439 ?auto_22442 ?auto_22441 ) )
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
      ?auto_22454 - INSTRUMENT
      ?auto_22453 - SATELLITE
      ?auto_22452 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22454 ?auto_22453 ) ( SUPPORTS ?auto_22454 ?auto_22447 ) ( POWER_ON ?auto_22454 ) ( POINTING ?auto_22453 ?auto_22452 ) ( not ( = ?auto_22446 ?auto_22452 ) ) ( HAVE_IMAGE ?auto_22449 ?auto_22448 ) ( not ( = ?auto_22449 ?auto_22446 ) ) ( not ( = ?auto_22449 ?auto_22452 ) ) ( not ( = ?auto_22448 ?auto_22447 ) ) ( CALIBRATION_TARGET ?auto_22454 ?auto_22452 ) ( NOT_CALIBRATED ?auto_22454 ) ( HAVE_IMAGE ?auto_22451 ?auto_22450 ) ( not ( = ?auto_22446 ?auto_22451 ) ) ( not ( = ?auto_22447 ?auto_22450 ) ) ( not ( = ?auto_22449 ?auto_22451 ) ) ( not ( = ?auto_22448 ?auto_22450 ) ) ( not ( = ?auto_22451 ?auto_22452 ) ) )
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
      ?auto_22472 - INSTRUMENT
      ?auto_22471 - SATELLITE
      ?auto_22470 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22472 ?auto_22471 ) ( SUPPORTS ?auto_22472 ?auto_22465 ) ( POWER_ON ?auto_22472 ) ( POINTING ?auto_22471 ?auto_22470 ) ( not ( = ?auto_22464 ?auto_22470 ) ) ( HAVE_IMAGE ?auto_22469 ?auto_22468 ) ( not ( = ?auto_22469 ?auto_22464 ) ) ( not ( = ?auto_22469 ?auto_22470 ) ) ( not ( = ?auto_22468 ?auto_22465 ) ) ( CALIBRATION_TARGET ?auto_22472 ?auto_22470 ) ( NOT_CALIBRATED ?auto_22472 ) ( HAVE_IMAGE ?auto_22467 ?auto_22466 ) ( not ( = ?auto_22464 ?auto_22467 ) ) ( not ( = ?auto_22465 ?auto_22466 ) ) ( not ( = ?auto_22467 ?auto_22469 ) ) ( not ( = ?auto_22467 ?auto_22470 ) ) ( not ( = ?auto_22466 ?auto_22468 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22469 ?auto_22468 ?auto_22464 ?auto_22465 )
      ( GET-3IMAGE-VERIFY ?auto_22464 ?auto_22465 ?auto_22467 ?auto_22466 ?auto_22469 ?auto_22468 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22473 - DIRECTION
      ?auto_22474 - MODE
      ?auto_22476 - DIRECTION
      ?auto_22475 - MODE
      ?auto_22478 - DIRECTION
      ?auto_22477 - MODE
    )
    :vars
    (
      ?auto_22483 - INSTRUMENT
      ?auto_22481 - SATELLITE
      ?auto_22480 - DIRECTION
      ?auto_22482 - DIRECTION
      ?auto_22479 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_22483 ?auto_22481 ) ( SUPPORTS ?auto_22483 ?auto_22474 ) ( POWER_ON ?auto_22483 ) ( POINTING ?auto_22481 ?auto_22480 ) ( not ( = ?auto_22473 ?auto_22480 ) ) ( HAVE_IMAGE ?auto_22482 ?auto_22479 ) ( not ( = ?auto_22482 ?auto_22473 ) ) ( not ( = ?auto_22482 ?auto_22480 ) ) ( not ( = ?auto_22479 ?auto_22474 ) ) ( CALIBRATION_TARGET ?auto_22483 ?auto_22480 ) ( NOT_CALIBRATED ?auto_22483 ) ( HAVE_IMAGE ?auto_22476 ?auto_22475 ) ( HAVE_IMAGE ?auto_22478 ?auto_22477 ) ( not ( = ?auto_22473 ?auto_22476 ) ) ( not ( = ?auto_22473 ?auto_22478 ) ) ( not ( = ?auto_22474 ?auto_22475 ) ) ( not ( = ?auto_22474 ?auto_22477 ) ) ( not ( = ?auto_22476 ?auto_22478 ) ) ( not ( = ?auto_22476 ?auto_22480 ) ) ( not ( = ?auto_22476 ?auto_22482 ) ) ( not ( = ?auto_22475 ?auto_22477 ) ) ( not ( = ?auto_22475 ?auto_22479 ) ) ( not ( = ?auto_22478 ?auto_22480 ) ) ( not ( = ?auto_22478 ?auto_22482 ) ) ( not ( = ?auto_22477 ?auto_22479 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22482 ?auto_22479 ?auto_22473 ?auto_22474 )
      ( GET-3IMAGE-VERIFY ?auto_22473 ?auto_22474 ?auto_22476 ?auto_22475 ?auto_22478 ?auto_22477 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_22526 - DIRECTION
      ?auto_22527 - MODE
    )
    :vars
    (
      ?auto_22532 - INSTRUMENT
      ?auto_22530 - SATELLITE
      ?auto_22529 - DIRECTION
      ?auto_22531 - DIRECTION
      ?auto_22528 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_22532 ?auto_22530 ) ( SUPPORTS ?auto_22532 ?auto_22527 ) ( POINTING ?auto_22530 ?auto_22529 ) ( not ( = ?auto_22526 ?auto_22529 ) ) ( HAVE_IMAGE ?auto_22531 ?auto_22528 ) ( not ( = ?auto_22531 ?auto_22526 ) ) ( not ( = ?auto_22531 ?auto_22529 ) ) ( not ( = ?auto_22528 ?auto_22527 ) ) ( CALIBRATION_TARGET ?auto_22532 ?auto_22529 ) ( POWER_AVAIL ?auto_22530 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_22532 ?auto_22530 )
      ( GET-2IMAGE ?auto_22531 ?auto_22528 ?auto_22526 ?auto_22527 )
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
      ?auto_22538 - INSTRUMENT
      ?auto_22537 - SATELLITE
      ?auto_22539 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22538 ?auto_22537 ) ( SUPPORTS ?auto_22538 ?auto_22535 ) ( POINTING ?auto_22537 ?auto_22539 ) ( not ( = ?auto_22536 ?auto_22539 ) ) ( HAVE_IMAGE ?auto_22533 ?auto_22534 ) ( not ( = ?auto_22533 ?auto_22536 ) ) ( not ( = ?auto_22533 ?auto_22539 ) ) ( not ( = ?auto_22534 ?auto_22535 ) ) ( CALIBRATION_TARGET ?auto_22538 ?auto_22539 ) ( POWER_AVAIL ?auto_22537 ) )
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
      ?auto_22544 - INSTRUMENT
      ?auto_22547 - SATELLITE
      ?auto_22548 - DIRECTION
      ?auto_22546 - DIRECTION
      ?auto_22545 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_22544 ?auto_22547 ) ( SUPPORTS ?auto_22544 ?auto_22542 ) ( POINTING ?auto_22547 ?auto_22548 ) ( not ( = ?auto_22543 ?auto_22548 ) ) ( HAVE_IMAGE ?auto_22546 ?auto_22545 ) ( not ( = ?auto_22546 ?auto_22543 ) ) ( not ( = ?auto_22546 ?auto_22548 ) ) ( not ( = ?auto_22545 ?auto_22542 ) ) ( CALIBRATION_TARGET ?auto_22544 ?auto_22548 ) ( POWER_AVAIL ?auto_22547 ) ( HAVE_IMAGE ?auto_22540 ?auto_22541 ) ( not ( = ?auto_22540 ?auto_22543 ) ) ( not ( = ?auto_22540 ?auto_22548 ) ) ( not ( = ?auto_22540 ?auto_22546 ) ) ( not ( = ?auto_22541 ?auto_22542 ) ) ( not ( = ?auto_22541 ?auto_22545 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22546 ?auto_22545 ?auto_22543 ?auto_22542 )
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
      ?auto_22553 - INSTRUMENT
      ?auto_22554 - SATELLITE
      ?auto_22555 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22553 ?auto_22554 ) ( SUPPORTS ?auto_22553 ?auto_22550 ) ( POINTING ?auto_22554 ?auto_22555 ) ( not ( = ?auto_22549 ?auto_22555 ) ) ( HAVE_IMAGE ?auto_22552 ?auto_22551 ) ( not ( = ?auto_22552 ?auto_22549 ) ) ( not ( = ?auto_22552 ?auto_22555 ) ) ( not ( = ?auto_22551 ?auto_22550 ) ) ( CALIBRATION_TARGET ?auto_22553 ?auto_22555 ) ( POWER_AVAIL ?auto_22554 ) )
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
      ?auto_22560 - INSTRUMENT
      ?auto_22563 - SATELLITE
      ?auto_22564 - DIRECTION
      ?auto_22562 - DIRECTION
      ?auto_22561 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_22560 ?auto_22563 ) ( SUPPORTS ?auto_22560 ?auto_22557 ) ( POINTING ?auto_22563 ?auto_22564 ) ( not ( = ?auto_22556 ?auto_22564 ) ) ( HAVE_IMAGE ?auto_22562 ?auto_22561 ) ( not ( = ?auto_22562 ?auto_22556 ) ) ( not ( = ?auto_22562 ?auto_22564 ) ) ( not ( = ?auto_22561 ?auto_22557 ) ) ( CALIBRATION_TARGET ?auto_22560 ?auto_22564 ) ( POWER_AVAIL ?auto_22563 ) ( HAVE_IMAGE ?auto_22559 ?auto_22558 ) ( not ( = ?auto_22556 ?auto_22559 ) ) ( not ( = ?auto_22557 ?auto_22558 ) ) ( not ( = ?auto_22559 ?auto_22564 ) ) ( not ( = ?auto_22559 ?auto_22562 ) ) ( not ( = ?auto_22558 ?auto_22561 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22562 ?auto_22561 ?auto_22556 ?auto_22557 )
      ( GET-2IMAGE-VERIFY ?auto_22556 ?auto_22557 ?auto_22559 ?auto_22558 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22574 - DIRECTION
      ?auto_22575 - MODE
      ?auto_22577 - DIRECTION
      ?auto_22576 - MODE
      ?auto_22579 - DIRECTION
      ?auto_22578 - MODE
    )
    :vars
    (
      ?auto_22580 - INSTRUMENT
      ?auto_22581 - SATELLITE
      ?auto_22582 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22580 ?auto_22581 ) ( SUPPORTS ?auto_22580 ?auto_22578 ) ( POINTING ?auto_22581 ?auto_22582 ) ( not ( = ?auto_22579 ?auto_22582 ) ) ( HAVE_IMAGE ?auto_22574 ?auto_22575 ) ( not ( = ?auto_22574 ?auto_22579 ) ) ( not ( = ?auto_22574 ?auto_22582 ) ) ( not ( = ?auto_22575 ?auto_22578 ) ) ( CALIBRATION_TARGET ?auto_22580 ?auto_22582 ) ( POWER_AVAIL ?auto_22581 ) ( HAVE_IMAGE ?auto_22577 ?auto_22576 ) ( not ( = ?auto_22574 ?auto_22577 ) ) ( not ( = ?auto_22575 ?auto_22576 ) ) ( not ( = ?auto_22577 ?auto_22579 ) ) ( not ( = ?auto_22577 ?auto_22582 ) ) ( not ( = ?auto_22576 ?auto_22578 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22574 ?auto_22575 ?auto_22579 ?auto_22578 )
      ( GET-3IMAGE-VERIFY ?auto_22574 ?auto_22575 ?auto_22577 ?auto_22576 ?auto_22579 ?auto_22578 ) )
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
      ?auto_22589 - INSTRUMENT
      ?auto_22590 - SATELLITE
      ?auto_22591 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22589 ?auto_22590 ) ( SUPPORTS ?auto_22589 ?auto_22587 ) ( POINTING ?auto_22590 ?auto_22591 ) ( not ( = ?auto_22588 ?auto_22591 ) ) ( HAVE_IMAGE ?auto_22583 ?auto_22584 ) ( not ( = ?auto_22583 ?auto_22588 ) ) ( not ( = ?auto_22583 ?auto_22591 ) ) ( not ( = ?auto_22584 ?auto_22587 ) ) ( CALIBRATION_TARGET ?auto_22589 ?auto_22591 ) ( POWER_AVAIL ?auto_22590 ) ( HAVE_IMAGE ?auto_22586 ?auto_22585 ) ( not ( = ?auto_22583 ?auto_22586 ) ) ( not ( = ?auto_22584 ?auto_22585 ) ) ( not ( = ?auto_22586 ?auto_22588 ) ) ( not ( = ?auto_22586 ?auto_22591 ) ) ( not ( = ?auto_22585 ?auto_22587 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22583 ?auto_22584 ?auto_22588 ?auto_22587 )
      ( GET-3IMAGE-VERIFY ?auto_22583 ?auto_22584 ?auto_22586 ?auto_22585 ?auto_22588 ?auto_22587 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22592 - DIRECTION
      ?auto_22593 - MODE
      ?auto_22595 - DIRECTION
      ?auto_22594 - MODE
      ?auto_22597 - DIRECTION
      ?auto_22596 - MODE
    )
    :vars
    (
      ?auto_22598 - INSTRUMENT
      ?auto_22599 - SATELLITE
      ?auto_22600 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22598 ?auto_22599 ) ( SUPPORTS ?auto_22598 ?auto_22594 ) ( POINTING ?auto_22599 ?auto_22600 ) ( not ( = ?auto_22595 ?auto_22600 ) ) ( HAVE_IMAGE ?auto_22597 ?auto_22596 ) ( not ( = ?auto_22597 ?auto_22595 ) ) ( not ( = ?auto_22597 ?auto_22600 ) ) ( not ( = ?auto_22596 ?auto_22594 ) ) ( CALIBRATION_TARGET ?auto_22598 ?auto_22600 ) ( POWER_AVAIL ?auto_22599 ) ( HAVE_IMAGE ?auto_22592 ?auto_22593 ) ( not ( = ?auto_22592 ?auto_22595 ) ) ( not ( = ?auto_22592 ?auto_22597 ) ) ( not ( = ?auto_22592 ?auto_22600 ) ) ( not ( = ?auto_22593 ?auto_22594 ) ) ( not ( = ?auto_22593 ?auto_22596 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22597 ?auto_22596 ?auto_22595 ?auto_22594 )
      ( GET-3IMAGE-VERIFY ?auto_22592 ?auto_22593 ?auto_22595 ?auto_22594 ?auto_22597 ?auto_22596 ) )
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
      ?auto_22607 - INSTRUMENT
      ?auto_22608 - SATELLITE
      ?auto_22609 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22607 ?auto_22608 ) ( SUPPORTS ?auto_22607 ?auto_22603 ) ( POINTING ?auto_22608 ?auto_22609 ) ( not ( = ?auto_22604 ?auto_22609 ) ) ( HAVE_IMAGE ?auto_22601 ?auto_22602 ) ( not ( = ?auto_22601 ?auto_22604 ) ) ( not ( = ?auto_22601 ?auto_22609 ) ) ( not ( = ?auto_22602 ?auto_22603 ) ) ( CALIBRATION_TARGET ?auto_22607 ?auto_22609 ) ( POWER_AVAIL ?auto_22608 ) ( HAVE_IMAGE ?auto_22606 ?auto_22605 ) ( not ( = ?auto_22601 ?auto_22606 ) ) ( not ( = ?auto_22602 ?auto_22605 ) ) ( not ( = ?auto_22604 ?auto_22606 ) ) ( not ( = ?auto_22603 ?auto_22605 ) ) ( not ( = ?auto_22606 ?auto_22609 ) ) )
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
      ?auto_22625 - INSTRUMENT
      ?auto_22626 - SATELLITE
      ?auto_22627 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22625 ?auto_22626 ) ( SUPPORTS ?auto_22625 ?auto_22623 ) ( POINTING ?auto_22626 ?auto_22627 ) ( not ( = ?auto_22624 ?auto_22627 ) ) ( HAVE_IMAGE ?auto_22622 ?auto_22621 ) ( not ( = ?auto_22622 ?auto_22624 ) ) ( not ( = ?auto_22622 ?auto_22627 ) ) ( not ( = ?auto_22621 ?auto_22623 ) ) ( CALIBRATION_TARGET ?auto_22625 ?auto_22627 ) ( POWER_AVAIL ?auto_22626 ) ( HAVE_IMAGE ?auto_22619 ?auto_22620 ) ( not ( = ?auto_22619 ?auto_22622 ) ) ( not ( = ?auto_22619 ?auto_22624 ) ) ( not ( = ?auto_22619 ?auto_22627 ) ) ( not ( = ?auto_22620 ?auto_22621 ) ) ( not ( = ?auto_22620 ?auto_22623 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22622 ?auto_22621 ?auto_22624 ?auto_22623 )
      ( GET-3IMAGE-VERIFY ?auto_22619 ?auto_22620 ?auto_22622 ?auto_22621 ?auto_22624 ?auto_22623 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22628 - DIRECTION
      ?auto_22629 - MODE
      ?auto_22631 - DIRECTION
      ?auto_22630 - MODE
      ?auto_22633 - DIRECTION
      ?auto_22632 - MODE
    )
    :vars
    (
      ?auto_22634 - INSTRUMENT
      ?auto_22637 - SATELLITE
      ?auto_22638 - DIRECTION
      ?auto_22636 - DIRECTION
      ?auto_22635 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_22634 ?auto_22637 ) ( SUPPORTS ?auto_22634 ?auto_22632 ) ( POINTING ?auto_22637 ?auto_22638 ) ( not ( = ?auto_22633 ?auto_22638 ) ) ( HAVE_IMAGE ?auto_22636 ?auto_22635 ) ( not ( = ?auto_22636 ?auto_22633 ) ) ( not ( = ?auto_22636 ?auto_22638 ) ) ( not ( = ?auto_22635 ?auto_22632 ) ) ( CALIBRATION_TARGET ?auto_22634 ?auto_22638 ) ( POWER_AVAIL ?auto_22637 ) ( HAVE_IMAGE ?auto_22628 ?auto_22629 ) ( HAVE_IMAGE ?auto_22631 ?auto_22630 ) ( not ( = ?auto_22628 ?auto_22631 ) ) ( not ( = ?auto_22628 ?auto_22633 ) ) ( not ( = ?auto_22628 ?auto_22638 ) ) ( not ( = ?auto_22628 ?auto_22636 ) ) ( not ( = ?auto_22629 ?auto_22630 ) ) ( not ( = ?auto_22629 ?auto_22632 ) ) ( not ( = ?auto_22629 ?auto_22635 ) ) ( not ( = ?auto_22631 ?auto_22633 ) ) ( not ( = ?auto_22631 ?auto_22638 ) ) ( not ( = ?auto_22631 ?auto_22636 ) ) ( not ( = ?auto_22630 ?auto_22632 ) ) ( not ( = ?auto_22630 ?auto_22635 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22636 ?auto_22635 ?auto_22633 ?auto_22632 )
      ( GET-3IMAGE-VERIFY ?auto_22628 ?auto_22629 ?auto_22631 ?auto_22630 ?auto_22633 ?auto_22632 ) )
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
      ?auto_22645 - INSTRUMENT
      ?auto_22646 - SATELLITE
      ?auto_22647 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22645 ?auto_22646 ) ( SUPPORTS ?auto_22645 ?auto_22641 ) ( POINTING ?auto_22646 ?auto_22647 ) ( not ( = ?auto_22642 ?auto_22647 ) ) ( HAVE_IMAGE ?auto_22644 ?auto_22643 ) ( not ( = ?auto_22644 ?auto_22642 ) ) ( not ( = ?auto_22644 ?auto_22647 ) ) ( not ( = ?auto_22643 ?auto_22641 ) ) ( CALIBRATION_TARGET ?auto_22645 ?auto_22647 ) ( POWER_AVAIL ?auto_22646 ) ( HAVE_IMAGE ?auto_22639 ?auto_22640 ) ( not ( = ?auto_22639 ?auto_22642 ) ) ( not ( = ?auto_22639 ?auto_22644 ) ) ( not ( = ?auto_22639 ?auto_22647 ) ) ( not ( = ?auto_22640 ?auto_22641 ) ) ( not ( = ?auto_22640 ?auto_22643 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22644 ?auto_22643 ?auto_22642 ?auto_22641 )
      ( GET-3IMAGE-VERIFY ?auto_22639 ?auto_22640 ?auto_22642 ?auto_22641 ?auto_22644 ?auto_22643 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22648 - DIRECTION
      ?auto_22649 - MODE
      ?auto_22651 - DIRECTION
      ?auto_22650 - MODE
      ?auto_22653 - DIRECTION
      ?auto_22652 - MODE
    )
    :vars
    (
      ?auto_22654 - INSTRUMENT
      ?auto_22657 - SATELLITE
      ?auto_22658 - DIRECTION
      ?auto_22656 - DIRECTION
      ?auto_22655 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_22654 ?auto_22657 ) ( SUPPORTS ?auto_22654 ?auto_22650 ) ( POINTING ?auto_22657 ?auto_22658 ) ( not ( = ?auto_22651 ?auto_22658 ) ) ( HAVE_IMAGE ?auto_22656 ?auto_22655 ) ( not ( = ?auto_22656 ?auto_22651 ) ) ( not ( = ?auto_22656 ?auto_22658 ) ) ( not ( = ?auto_22655 ?auto_22650 ) ) ( CALIBRATION_TARGET ?auto_22654 ?auto_22658 ) ( POWER_AVAIL ?auto_22657 ) ( HAVE_IMAGE ?auto_22648 ?auto_22649 ) ( HAVE_IMAGE ?auto_22653 ?auto_22652 ) ( not ( = ?auto_22648 ?auto_22651 ) ) ( not ( = ?auto_22648 ?auto_22653 ) ) ( not ( = ?auto_22648 ?auto_22658 ) ) ( not ( = ?auto_22648 ?auto_22656 ) ) ( not ( = ?auto_22649 ?auto_22650 ) ) ( not ( = ?auto_22649 ?auto_22652 ) ) ( not ( = ?auto_22649 ?auto_22655 ) ) ( not ( = ?auto_22651 ?auto_22653 ) ) ( not ( = ?auto_22650 ?auto_22652 ) ) ( not ( = ?auto_22653 ?auto_22658 ) ) ( not ( = ?auto_22653 ?auto_22656 ) ) ( not ( = ?auto_22652 ?auto_22655 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22656 ?auto_22655 ?auto_22651 ?auto_22650 )
      ( GET-3IMAGE-VERIFY ?auto_22648 ?auto_22649 ?auto_22651 ?auto_22650 ?auto_22653 ?auto_22652 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22670 - DIRECTION
      ?auto_22671 - MODE
      ?auto_22673 - DIRECTION
      ?auto_22672 - MODE
      ?auto_22675 - DIRECTION
      ?auto_22674 - MODE
    )
    :vars
    (
      ?auto_22676 - INSTRUMENT
      ?auto_22677 - SATELLITE
      ?auto_22678 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22676 ?auto_22677 ) ( SUPPORTS ?auto_22676 ?auto_22671 ) ( POINTING ?auto_22677 ?auto_22678 ) ( not ( = ?auto_22670 ?auto_22678 ) ) ( HAVE_IMAGE ?auto_22673 ?auto_22672 ) ( not ( = ?auto_22673 ?auto_22670 ) ) ( not ( = ?auto_22673 ?auto_22678 ) ) ( not ( = ?auto_22672 ?auto_22671 ) ) ( CALIBRATION_TARGET ?auto_22676 ?auto_22678 ) ( POWER_AVAIL ?auto_22677 ) ( HAVE_IMAGE ?auto_22675 ?auto_22674 ) ( not ( = ?auto_22670 ?auto_22675 ) ) ( not ( = ?auto_22671 ?auto_22674 ) ) ( not ( = ?auto_22673 ?auto_22675 ) ) ( not ( = ?auto_22672 ?auto_22674 ) ) ( not ( = ?auto_22675 ?auto_22678 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22673 ?auto_22672 ?auto_22670 ?auto_22671 )
      ( GET-3IMAGE-VERIFY ?auto_22670 ?auto_22671 ?auto_22673 ?auto_22672 ?auto_22675 ?auto_22674 ) )
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
      ?auto_22685 - INSTRUMENT
      ?auto_22686 - SATELLITE
      ?auto_22687 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22685 ?auto_22686 ) ( SUPPORTS ?auto_22685 ?auto_22680 ) ( POINTING ?auto_22686 ?auto_22687 ) ( not ( = ?auto_22679 ?auto_22687 ) ) ( HAVE_IMAGE ?auto_22682 ?auto_22681 ) ( not ( = ?auto_22682 ?auto_22679 ) ) ( not ( = ?auto_22682 ?auto_22687 ) ) ( not ( = ?auto_22681 ?auto_22680 ) ) ( CALIBRATION_TARGET ?auto_22685 ?auto_22687 ) ( POWER_AVAIL ?auto_22686 ) ( HAVE_IMAGE ?auto_22684 ?auto_22683 ) ( not ( = ?auto_22679 ?auto_22684 ) ) ( not ( = ?auto_22680 ?auto_22683 ) ) ( not ( = ?auto_22682 ?auto_22684 ) ) ( not ( = ?auto_22681 ?auto_22683 ) ) ( not ( = ?auto_22684 ?auto_22687 ) ) )
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
      ?auto_22703 - INSTRUMENT
      ?auto_22704 - SATELLITE
      ?auto_22705 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22703 ?auto_22704 ) ( SUPPORTS ?auto_22703 ?auto_22698 ) ( POINTING ?auto_22704 ?auto_22705 ) ( not ( = ?auto_22697 ?auto_22705 ) ) ( HAVE_IMAGE ?auto_22702 ?auto_22701 ) ( not ( = ?auto_22702 ?auto_22697 ) ) ( not ( = ?auto_22702 ?auto_22705 ) ) ( not ( = ?auto_22701 ?auto_22698 ) ) ( CALIBRATION_TARGET ?auto_22703 ?auto_22705 ) ( POWER_AVAIL ?auto_22704 ) ( HAVE_IMAGE ?auto_22700 ?auto_22699 ) ( not ( = ?auto_22697 ?auto_22700 ) ) ( not ( = ?auto_22698 ?auto_22699 ) ) ( not ( = ?auto_22700 ?auto_22702 ) ) ( not ( = ?auto_22700 ?auto_22705 ) ) ( not ( = ?auto_22699 ?auto_22701 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22702 ?auto_22701 ?auto_22697 ?auto_22698 )
      ( GET-3IMAGE-VERIFY ?auto_22697 ?auto_22698 ?auto_22700 ?auto_22699 ?auto_22702 ?auto_22701 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22706 - DIRECTION
      ?auto_22707 - MODE
      ?auto_22709 - DIRECTION
      ?auto_22708 - MODE
      ?auto_22711 - DIRECTION
      ?auto_22710 - MODE
    )
    :vars
    (
      ?auto_22712 - INSTRUMENT
      ?auto_22715 - SATELLITE
      ?auto_22716 - DIRECTION
      ?auto_22714 - DIRECTION
      ?auto_22713 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_22712 ?auto_22715 ) ( SUPPORTS ?auto_22712 ?auto_22707 ) ( POINTING ?auto_22715 ?auto_22716 ) ( not ( = ?auto_22706 ?auto_22716 ) ) ( HAVE_IMAGE ?auto_22714 ?auto_22713 ) ( not ( = ?auto_22714 ?auto_22706 ) ) ( not ( = ?auto_22714 ?auto_22716 ) ) ( not ( = ?auto_22713 ?auto_22707 ) ) ( CALIBRATION_TARGET ?auto_22712 ?auto_22716 ) ( POWER_AVAIL ?auto_22715 ) ( HAVE_IMAGE ?auto_22709 ?auto_22708 ) ( HAVE_IMAGE ?auto_22711 ?auto_22710 ) ( not ( = ?auto_22706 ?auto_22709 ) ) ( not ( = ?auto_22706 ?auto_22711 ) ) ( not ( = ?auto_22707 ?auto_22708 ) ) ( not ( = ?auto_22707 ?auto_22710 ) ) ( not ( = ?auto_22709 ?auto_22711 ) ) ( not ( = ?auto_22709 ?auto_22716 ) ) ( not ( = ?auto_22709 ?auto_22714 ) ) ( not ( = ?auto_22708 ?auto_22710 ) ) ( not ( = ?auto_22708 ?auto_22713 ) ) ( not ( = ?auto_22711 ?auto_22716 ) ) ( not ( = ?auto_22711 ?auto_22714 ) ) ( not ( = ?auto_22710 ?auto_22713 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22714 ?auto_22713 ?auto_22706 ?auto_22707 )
      ( GET-3IMAGE-VERIFY ?auto_22706 ?auto_22707 ?auto_22709 ?auto_22708 ?auto_22711 ?auto_22710 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_22759 - DIRECTION
      ?auto_22760 - MODE
    )
    :vars
    (
      ?auto_22761 - INSTRUMENT
      ?auto_22764 - SATELLITE
      ?auto_22765 - DIRECTION
      ?auto_22763 - DIRECTION
      ?auto_22762 - MODE
      ?auto_22766 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22761 ?auto_22764 ) ( SUPPORTS ?auto_22761 ?auto_22760 ) ( not ( = ?auto_22759 ?auto_22765 ) ) ( HAVE_IMAGE ?auto_22763 ?auto_22762 ) ( not ( = ?auto_22763 ?auto_22759 ) ) ( not ( = ?auto_22763 ?auto_22765 ) ) ( not ( = ?auto_22762 ?auto_22760 ) ) ( CALIBRATION_TARGET ?auto_22761 ?auto_22765 ) ( POWER_AVAIL ?auto_22764 ) ( POINTING ?auto_22764 ?auto_22766 ) ( not ( = ?auto_22765 ?auto_22766 ) ) ( not ( = ?auto_22759 ?auto_22766 ) ) ( not ( = ?auto_22763 ?auto_22766 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_22764 ?auto_22765 ?auto_22766 )
      ( GET-2IMAGE ?auto_22763 ?auto_22762 ?auto_22759 ?auto_22760 )
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
      ?auto_22774 - SATELLITE
      ?auto_22771 - DIRECTION
      ?auto_22773 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22772 ?auto_22774 ) ( SUPPORTS ?auto_22772 ?auto_22769 ) ( not ( = ?auto_22770 ?auto_22771 ) ) ( HAVE_IMAGE ?auto_22767 ?auto_22768 ) ( not ( = ?auto_22767 ?auto_22770 ) ) ( not ( = ?auto_22767 ?auto_22771 ) ) ( not ( = ?auto_22768 ?auto_22769 ) ) ( CALIBRATION_TARGET ?auto_22772 ?auto_22771 ) ( POWER_AVAIL ?auto_22774 ) ( POINTING ?auto_22774 ?auto_22773 ) ( not ( = ?auto_22771 ?auto_22773 ) ) ( not ( = ?auto_22770 ?auto_22773 ) ) ( not ( = ?auto_22767 ?auto_22773 ) ) )
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
      ?auto_22782 - INSTRUMENT
      ?auto_22781 - SATELLITE
      ?auto_22783 - DIRECTION
      ?auto_22780 - DIRECTION
      ?auto_22779 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_22782 ?auto_22781 ) ( SUPPORTS ?auto_22782 ?auto_22777 ) ( not ( = ?auto_22778 ?auto_22783 ) ) ( HAVE_IMAGE ?auto_22780 ?auto_22779 ) ( not ( = ?auto_22780 ?auto_22778 ) ) ( not ( = ?auto_22780 ?auto_22783 ) ) ( not ( = ?auto_22779 ?auto_22777 ) ) ( CALIBRATION_TARGET ?auto_22782 ?auto_22783 ) ( POWER_AVAIL ?auto_22781 ) ( POINTING ?auto_22781 ?auto_22775 ) ( not ( = ?auto_22783 ?auto_22775 ) ) ( not ( = ?auto_22778 ?auto_22775 ) ) ( not ( = ?auto_22780 ?auto_22775 ) ) ( HAVE_IMAGE ?auto_22775 ?auto_22776 ) ( not ( = ?auto_22776 ?auto_22777 ) ) ( not ( = ?auto_22776 ?auto_22779 ) ) )
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
      ?auto_22790 - INSTRUMENT
      ?auto_22789 - SATELLITE
      ?auto_22791 - DIRECTION
      ?auto_22788 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22790 ?auto_22789 ) ( SUPPORTS ?auto_22790 ?auto_22785 ) ( not ( = ?auto_22784 ?auto_22791 ) ) ( HAVE_IMAGE ?auto_22787 ?auto_22786 ) ( not ( = ?auto_22787 ?auto_22784 ) ) ( not ( = ?auto_22787 ?auto_22791 ) ) ( not ( = ?auto_22786 ?auto_22785 ) ) ( CALIBRATION_TARGET ?auto_22790 ?auto_22791 ) ( POWER_AVAIL ?auto_22789 ) ( POINTING ?auto_22789 ?auto_22788 ) ( not ( = ?auto_22791 ?auto_22788 ) ) ( not ( = ?auto_22784 ?auto_22788 ) ) ( not ( = ?auto_22787 ?auto_22788 ) ) )
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
      ?auto_22799 - INSTRUMENT
      ?auto_22798 - SATELLITE
      ?auto_22800 - DIRECTION
      ?auto_22797 - DIRECTION
      ?auto_22796 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_22799 ?auto_22798 ) ( SUPPORTS ?auto_22799 ?auto_22793 ) ( not ( = ?auto_22792 ?auto_22800 ) ) ( HAVE_IMAGE ?auto_22797 ?auto_22796 ) ( not ( = ?auto_22797 ?auto_22792 ) ) ( not ( = ?auto_22797 ?auto_22800 ) ) ( not ( = ?auto_22796 ?auto_22793 ) ) ( CALIBRATION_TARGET ?auto_22799 ?auto_22800 ) ( POWER_AVAIL ?auto_22798 ) ( POINTING ?auto_22798 ?auto_22795 ) ( not ( = ?auto_22800 ?auto_22795 ) ) ( not ( = ?auto_22792 ?auto_22795 ) ) ( not ( = ?auto_22797 ?auto_22795 ) ) ( HAVE_IMAGE ?auto_22795 ?auto_22794 ) ( not ( = ?auto_22793 ?auto_22794 ) ) ( not ( = ?auto_22794 ?auto_22796 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22797 ?auto_22796 ?auto_22792 ?auto_22793 )
      ( GET-2IMAGE-VERIFY ?auto_22792 ?auto_22793 ?auto_22795 ?auto_22794 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22811 - DIRECTION
      ?auto_22812 - MODE
      ?auto_22814 - DIRECTION
      ?auto_22813 - MODE
      ?auto_22816 - DIRECTION
      ?auto_22815 - MODE
    )
    :vars
    (
      ?auto_22819 - INSTRUMENT
      ?auto_22818 - SATELLITE
      ?auto_22820 - DIRECTION
      ?auto_22817 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22819 ?auto_22818 ) ( SUPPORTS ?auto_22819 ?auto_22815 ) ( not ( = ?auto_22816 ?auto_22820 ) ) ( HAVE_IMAGE ?auto_22814 ?auto_22812 ) ( not ( = ?auto_22814 ?auto_22816 ) ) ( not ( = ?auto_22814 ?auto_22820 ) ) ( not ( = ?auto_22812 ?auto_22815 ) ) ( CALIBRATION_TARGET ?auto_22819 ?auto_22820 ) ( POWER_AVAIL ?auto_22818 ) ( POINTING ?auto_22818 ?auto_22817 ) ( not ( = ?auto_22820 ?auto_22817 ) ) ( not ( = ?auto_22816 ?auto_22817 ) ) ( not ( = ?auto_22814 ?auto_22817 ) ) ( HAVE_IMAGE ?auto_22811 ?auto_22812 ) ( HAVE_IMAGE ?auto_22814 ?auto_22813 ) ( not ( = ?auto_22811 ?auto_22814 ) ) ( not ( = ?auto_22811 ?auto_22816 ) ) ( not ( = ?auto_22811 ?auto_22820 ) ) ( not ( = ?auto_22811 ?auto_22817 ) ) ( not ( = ?auto_22812 ?auto_22813 ) ) ( not ( = ?auto_22813 ?auto_22815 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22814 ?auto_22812 ?auto_22816 ?auto_22815 )
      ( GET-3IMAGE-VERIFY ?auto_22811 ?auto_22812 ?auto_22814 ?auto_22813 ?auto_22816 ?auto_22815 ) )
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
      ?auto_22828 - INSTRUMENT
      ?auto_22827 - SATELLITE
      ?auto_22829 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22828 ?auto_22827 ) ( SUPPORTS ?auto_22828 ?auto_22825 ) ( not ( = ?auto_22826 ?auto_22829 ) ) ( HAVE_IMAGE ?auto_22821 ?auto_22822 ) ( not ( = ?auto_22821 ?auto_22826 ) ) ( not ( = ?auto_22821 ?auto_22829 ) ) ( not ( = ?auto_22822 ?auto_22825 ) ) ( CALIBRATION_TARGET ?auto_22828 ?auto_22829 ) ( POWER_AVAIL ?auto_22827 ) ( POINTING ?auto_22827 ?auto_22824 ) ( not ( = ?auto_22829 ?auto_22824 ) ) ( not ( = ?auto_22826 ?auto_22824 ) ) ( not ( = ?auto_22821 ?auto_22824 ) ) ( HAVE_IMAGE ?auto_22824 ?auto_22823 ) ( not ( = ?auto_22822 ?auto_22823 ) ) ( not ( = ?auto_22823 ?auto_22825 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22821 ?auto_22822 ?auto_22826 ?auto_22825 )
      ( GET-3IMAGE-VERIFY ?auto_22821 ?auto_22822 ?auto_22824 ?auto_22823 ?auto_22826 ?auto_22825 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22830 - DIRECTION
      ?auto_22831 - MODE
      ?auto_22833 - DIRECTION
      ?auto_22832 - MODE
      ?auto_22835 - DIRECTION
      ?auto_22834 - MODE
    )
    :vars
    (
      ?auto_22838 - INSTRUMENT
      ?auto_22837 - SATELLITE
      ?auto_22839 - DIRECTION
      ?auto_22836 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22838 ?auto_22837 ) ( SUPPORTS ?auto_22838 ?auto_22832 ) ( not ( = ?auto_22833 ?auto_22839 ) ) ( HAVE_IMAGE ?auto_22835 ?auto_22834 ) ( not ( = ?auto_22835 ?auto_22833 ) ) ( not ( = ?auto_22835 ?auto_22839 ) ) ( not ( = ?auto_22834 ?auto_22832 ) ) ( CALIBRATION_TARGET ?auto_22838 ?auto_22839 ) ( POWER_AVAIL ?auto_22837 ) ( POINTING ?auto_22837 ?auto_22836 ) ( not ( = ?auto_22839 ?auto_22836 ) ) ( not ( = ?auto_22833 ?auto_22836 ) ) ( not ( = ?auto_22835 ?auto_22836 ) ) ( HAVE_IMAGE ?auto_22830 ?auto_22831 ) ( not ( = ?auto_22830 ?auto_22833 ) ) ( not ( = ?auto_22830 ?auto_22835 ) ) ( not ( = ?auto_22830 ?auto_22839 ) ) ( not ( = ?auto_22830 ?auto_22836 ) ) ( not ( = ?auto_22831 ?auto_22832 ) ) ( not ( = ?auto_22831 ?auto_22834 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22835 ?auto_22834 ?auto_22833 ?auto_22832 )
      ( GET-3IMAGE-VERIFY ?auto_22830 ?auto_22831 ?auto_22833 ?auto_22832 ?auto_22835 ?auto_22834 ) )
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
      ?auto_22847 - INSTRUMENT
      ?auto_22846 - SATELLITE
      ?auto_22848 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22847 ?auto_22846 ) ( SUPPORTS ?auto_22847 ?auto_22842 ) ( not ( = ?auto_22843 ?auto_22848 ) ) ( HAVE_IMAGE ?auto_22840 ?auto_22841 ) ( not ( = ?auto_22840 ?auto_22843 ) ) ( not ( = ?auto_22840 ?auto_22848 ) ) ( not ( = ?auto_22841 ?auto_22842 ) ) ( CALIBRATION_TARGET ?auto_22847 ?auto_22848 ) ( POWER_AVAIL ?auto_22846 ) ( POINTING ?auto_22846 ?auto_22845 ) ( not ( = ?auto_22848 ?auto_22845 ) ) ( not ( = ?auto_22843 ?auto_22845 ) ) ( not ( = ?auto_22840 ?auto_22845 ) ) ( HAVE_IMAGE ?auto_22845 ?auto_22844 ) ( not ( = ?auto_22841 ?auto_22844 ) ) ( not ( = ?auto_22842 ?auto_22844 ) ) )
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
      ?auto_22866 - INSTRUMENT
      ?auto_22865 - SATELLITE
      ?auto_22867 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22866 ?auto_22865 ) ( SUPPORTS ?auto_22866 ?auto_22863 ) ( not ( = ?auto_22864 ?auto_22867 ) ) ( HAVE_IMAGE ?auto_22862 ?auto_22861 ) ( not ( = ?auto_22862 ?auto_22864 ) ) ( not ( = ?auto_22862 ?auto_22867 ) ) ( not ( = ?auto_22861 ?auto_22863 ) ) ( CALIBRATION_TARGET ?auto_22866 ?auto_22867 ) ( POWER_AVAIL ?auto_22865 ) ( POINTING ?auto_22865 ?auto_22859 ) ( not ( = ?auto_22867 ?auto_22859 ) ) ( not ( = ?auto_22864 ?auto_22859 ) ) ( not ( = ?auto_22862 ?auto_22859 ) ) ( HAVE_IMAGE ?auto_22859 ?auto_22860 ) ( not ( = ?auto_22860 ?auto_22861 ) ) ( not ( = ?auto_22860 ?auto_22863 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22862 ?auto_22861 ?auto_22864 ?auto_22863 )
      ( GET-3IMAGE-VERIFY ?auto_22859 ?auto_22860 ?auto_22862 ?auto_22861 ?auto_22864 ?auto_22863 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22868 - DIRECTION
      ?auto_22869 - MODE
      ?auto_22871 - DIRECTION
      ?auto_22870 - MODE
      ?auto_22873 - DIRECTION
      ?auto_22872 - MODE
    )
    :vars
    (
      ?auto_22877 - INSTRUMENT
      ?auto_22876 - SATELLITE
      ?auto_22878 - DIRECTION
      ?auto_22875 - DIRECTION
      ?auto_22874 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_22877 ?auto_22876 ) ( SUPPORTS ?auto_22877 ?auto_22872 ) ( not ( = ?auto_22873 ?auto_22878 ) ) ( HAVE_IMAGE ?auto_22875 ?auto_22874 ) ( not ( = ?auto_22875 ?auto_22873 ) ) ( not ( = ?auto_22875 ?auto_22878 ) ) ( not ( = ?auto_22874 ?auto_22872 ) ) ( CALIBRATION_TARGET ?auto_22877 ?auto_22878 ) ( POWER_AVAIL ?auto_22876 ) ( POINTING ?auto_22876 ?auto_22871 ) ( not ( = ?auto_22878 ?auto_22871 ) ) ( not ( = ?auto_22873 ?auto_22871 ) ) ( not ( = ?auto_22875 ?auto_22871 ) ) ( HAVE_IMAGE ?auto_22868 ?auto_22869 ) ( HAVE_IMAGE ?auto_22871 ?auto_22870 ) ( not ( = ?auto_22868 ?auto_22871 ) ) ( not ( = ?auto_22868 ?auto_22873 ) ) ( not ( = ?auto_22868 ?auto_22878 ) ) ( not ( = ?auto_22868 ?auto_22875 ) ) ( not ( = ?auto_22869 ?auto_22870 ) ) ( not ( = ?auto_22869 ?auto_22872 ) ) ( not ( = ?auto_22869 ?auto_22874 ) ) ( not ( = ?auto_22870 ?auto_22872 ) ) ( not ( = ?auto_22870 ?auto_22874 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22875 ?auto_22874 ?auto_22873 ?auto_22872 )
      ( GET-3IMAGE-VERIFY ?auto_22868 ?auto_22869 ?auto_22871 ?auto_22870 ?auto_22873 ?auto_22872 ) )
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
      ?auto_22886 - INSTRUMENT
      ?auto_22885 - SATELLITE
      ?auto_22887 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22886 ?auto_22885 ) ( SUPPORTS ?auto_22886 ?auto_22881 ) ( not ( = ?auto_22882 ?auto_22887 ) ) ( HAVE_IMAGE ?auto_22884 ?auto_22883 ) ( not ( = ?auto_22884 ?auto_22882 ) ) ( not ( = ?auto_22884 ?auto_22887 ) ) ( not ( = ?auto_22883 ?auto_22881 ) ) ( CALIBRATION_TARGET ?auto_22886 ?auto_22887 ) ( POWER_AVAIL ?auto_22885 ) ( POINTING ?auto_22885 ?auto_22879 ) ( not ( = ?auto_22887 ?auto_22879 ) ) ( not ( = ?auto_22882 ?auto_22879 ) ) ( not ( = ?auto_22884 ?auto_22879 ) ) ( HAVE_IMAGE ?auto_22879 ?auto_22880 ) ( not ( = ?auto_22880 ?auto_22881 ) ) ( not ( = ?auto_22880 ?auto_22883 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22884 ?auto_22883 ?auto_22882 ?auto_22881 )
      ( GET-3IMAGE-VERIFY ?auto_22879 ?auto_22880 ?auto_22882 ?auto_22881 ?auto_22884 ?auto_22883 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22888 - DIRECTION
      ?auto_22889 - MODE
      ?auto_22891 - DIRECTION
      ?auto_22890 - MODE
      ?auto_22893 - DIRECTION
      ?auto_22892 - MODE
    )
    :vars
    (
      ?auto_22897 - INSTRUMENT
      ?auto_22896 - SATELLITE
      ?auto_22898 - DIRECTION
      ?auto_22895 - DIRECTION
      ?auto_22894 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_22897 ?auto_22896 ) ( SUPPORTS ?auto_22897 ?auto_22890 ) ( not ( = ?auto_22891 ?auto_22898 ) ) ( HAVE_IMAGE ?auto_22895 ?auto_22894 ) ( not ( = ?auto_22895 ?auto_22891 ) ) ( not ( = ?auto_22895 ?auto_22898 ) ) ( not ( = ?auto_22894 ?auto_22890 ) ) ( CALIBRATION_TARGET ?auto_22897 ?auto_22898 ) ( POWER_AVAIL ?auto_22896 ) ( POINTING ?auto_22896 ?auto_22893 ) ( not ( = ?auto_22898 ?auto_22893 ) ) ( not ( = ?auto_22891 ?auto_22893 ) ) ( not ( = ?auto_22895 ?auto_22893 ) ) ( HAVE_IMAGE ?auto_22888 ?auto_22889 ) ( HAVE_IMAGE ?auto_22893 ?auto_22892 ) ( not ( = ?auto_22888 ?auto_22891 ) ) ( not ( = ?auto_22888 ?auto_22893 ) ) ( not ( = ?auto_22888 ?auto_22898 ) ) ( not ( = ?auto_22888 ?auto_22895 ) ) ( not ( = ?auto_22889 ?auto_22890 ) ) ( not ( = ?auto_22889 ?auto_22892 ) ) ( not ( = ?auto_22889 ?auto_22894 ) ) ( not ( = ?auto_22890 ?auto_22892 ) ) ( not ( = ?auto_22892 ?auto_22894 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22895 ?auto_22894 ?auto_22891 ?auto_22890 )
      ( GET-3IMAGE-VERIFY ?auto_22888 ?auto_22889 ?auto_22891 ?auto_22890 ?auto_22893 ?auto_22892 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22910 - DIRECTION
      ?auto_22911 - MODE
      ?auto_22913 - DIRECTION
      ?auto_22912 - MODE
      ?auto_22915 - DIRECTION
      ?auto_22914 - MODE
    )
    :vars
    (
      ?auto_22918 - INSTRUMENT
      ?auto_22917 - SATELLITE
      ?auto_22919 - DIRECTION
      ?auto_22916 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22918 ?auto_22917 ) ( SUPPORTS ?auto_22918 ?auto_22911 ) ( not ( = ?auto_22910 ?auto_22919 ) ) ( HAVE_IMAGE ?auto_22913 ?auto_22912 ) ( not ( = ?auto_22913 ?auto_22910 ) ) ( not ( = ?auto_22913 ?auto_22919 ) ) ( not ( = ?auto_22912 ?auto_22911 ) ) ( CALIBRATION_TARGET ?auto_22918 ?auto_22919 ) ( POWER_AVAIL ?auto_22917 ) ( POINTING ?auto_22917 ?auto_22916 ) ( not ( = ?auto_22919 ?auto_22916 ) ) ( not ( = ?auto_22910 ?auto_22916 ) ) ( not ( = ?auto_22913 ?auto_22916 ) ) ( HAVE_IMAGE ?auto_22915 ?auto_22914 ) ( not ( = ?auto_22910 ?auto_22915 ) ) ( not ( = ?auto_22911 ?auto_22914 ) ) ( not ( = ?auto_22913 ?auto_22915 ) ) ( not ( = ?auto_22912 ?auto_22914 ) ) ( not ( = ?auto_22915 ?auto_22919 ) ) ( not ( = ?auto_22915 ?auto_22916 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22913 ?auto_22912 ?auto_22910 ?auto_22911 )
      ( GET-3IMAGE-VERIFY ?auto_22910 ?auto_22911 ?auto_22913 ?auto_22912 ?auto_22915 ?auto_22914 ) )
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
      ?auto_22927 - INSTRUMENT
      ?auto_22926 - SATELLITE
      ?auto_22928 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22927 ?auto_22926 ) ( SUPPORTS ?auto_22927 ?auto_22921 ) ( not ( = ?auto_22920 ?auto_22928 ) ) ( HAVE_IMAGE ?auto_22923 ?auto_22922 ) ( not ( = ?auto_22923 ?auto_22920 ) ) ( not ( = ?auto_22923 ?auto_22928 ) ) ( not ( = ?auto_22922 ?auto_22921 ) ) ( CALIBRATION_TARGET ?auto_22927 ?auto_22928 ) ( POWER_AVAIL ?auto_22926 ) ( POINTING ?auto_22926 ?auto_22925 ) ( not ( = ?auto_22928 ?auto_22925 ) ) ( not ( = ?auto_22920 ?auto_22925 ) ) ( not ( = ?auto_22923 ?auto_22925 ) ) ( HAVE_IMAGE ?auto_22925 ?auto_22924 ) ( not ( = ?auto_22921 ?auto_22924 ) ) ( not ( = ?auto_22922 ?auto_22924 ) ) )
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
      ?auto_22946 - INSTRUMENT
      ?auto_22945 - SATELLITE
      ?auto_22947 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_22946 ?auto_22945 ) ( SUPPORTS ?auto_22946 ?auto_22940 ) ( not ( = ?auto_22939 ?auto_22947 ) ) ( HAVE_IMAGE ?auto_22944 ?auto_22943 ) ( not ( = ?auto_22944 ?auto_22939 ) ) ( not ( = ?auto_22944 ?auto_22947 ) ) ( not ( = ?auto_22943 ?auto_22940 ) ) ( CALIBRATION_TARGET ?auto_22946 ?auto_22947 ) ( POWER_AVAIL ?auto_22945 ) ( POINTING ?auto_22945 ?auto_22942 ) ( not ( = ?auto_22947 ?auto_22942 ) ) ( not ( = ?auto_22939 ?auto_22942 ) ) ( not ( = ?auto_22944 ?auto_22942 ) ) ( HAVE_IMAGE ?auto_22942 ?auto_22941 ) ( not ( = ?auto_22940 ?auto_22941 ) ) ( not ( = ?auto_22941 ?auto_22943 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22944 ?auto_22943 ?auto_22939 ?auto_22940 )
      ( GET-3IMAGE-VERIFY ?auto_22939 ?auto_22940 ?auto_22942 ?auto_22941 ?auto_22944 ?auto_22943 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_22948 - DIRECTION
      ?auto_22949 - MODE
      ?auto_22951 - DIRECTION
      ?auto_22950 - MODE
      ?auto_22953 - DIRECTION
      ?auto_22952 - MODE
    )
    :vars
    (
      ?auto_22957 - INSTRUMENT
      ?auto_22956 - SATELLITE
      ?auto_22958 - DIRECTION
      ?auto_22955 - DIRECTION
      ?auto_22954 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_22957 ?auto_22956 ) ( SUPPORTS ?auto_22957 ?auto_22949 ) ( not ( = ?auto_22948 ?auto_22958 ) ) ( HAVE_IMAGE ?auto_22955 ?auto_22954 ) ( not ( = ?auto_22955 ?auto_22948 ) ) ( not ( = ?auto_22955 ?auto_22958 ) ) ( not ( = ?auto_22954 ?auto_22949 ) ) ( CALIBRATION_TARGET ?auto_22957 ?auto_22958 ) ( POWER_AVAIL ?auto_22956 ) ( POINTING ?auto_22956 ?auto_22953 ) ( not ( = ?auto_22958 ?auto_22953 ) ) ( not ( = ?auto_22948 ?auto_22953 ) ) ( not ( = ?auto_22955 ?auto_22953 ) ) ( HAVE_IMAGE ?auto_22951 ?auto_22950 ) ( HAVE_IMAGE ?auto_22953 ?auto_22952 ) ( not ( = ?auto_22948 ?auto_22951 ) ) ( not ( = ?auto_22949 ?auto_22950 ) ) ( not ( = ?auto_22949 ?auto_22952 ) ) ( not ( = ?auto_22951 ?auto_22953 ) ) ( not ( = ?auto_22951 ?auto_22958 ) ) ( not ( = ?auto_22951 ?auto_22955 ) ) ( not ( = ?auto_22950 ?auto_22952 ) ) ( not ( = ?auto_22950 ?auto_22954 ) ) ( not ( = ?auto_22952 ?auto_22954 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_22955 ?auto_22954 ?auto_22948 ?auto_22949 )
      ( GET-3IMAGE-VERIFY ?auto_22948 ?auto_22949 ?auto_22951 ?auto_22950 ?auto_22953 ?auto_22952 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_23003 - DIRECTION
      ?auto_23004 - MODE
    )
    :vars
    (
      ?auto_23009 - INSTRUMENT
      ?auto_23008 - SATELLITE
      ?auto_23010 - DIRECTION
      ?auto_23007 - DIRECTION
      ?auto_23006 - MODE
      ?auto_23005 - DIRECTION
      ?auto_23011 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23009 ?auto_23008 ) ( SUPPORTS ?auto_23009 ?auto_23004 ) ( not ( = ?auto_23003 ?auto_23010 ) ) ( HAVE_IMAGE ?auto_23007 ?auto_23006 ) ( not ( = ?auto_23007 ?auto_23003 ) ) ( not ( = ?auto_23007 ?auto_23010 ) ) ( not ( = ?auto_23006 ?auto_23004 ) ) ( CALIBRATION_TARGET ?auto_23009 ?auto_23010 ) ( POINTING ?auto_23008 ?auto_23005 ) ( not ( = ?auto_23010 ?auto_23005 ) ) ( not ( = ?auto_23003 ?auto_23005 ) ) ( not ( = ?auto_23007 ?auto_23005 ) ) ( ON_BOARD ?auto_23011 ?auto_23008 ) ( POWER_ON ?auto_23011 ) ( not ( = ?auto_23009 ?auto_23011 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_23011 ?auto_23008 )
      ( GET-2IMAGE ?auto_23007 ?auto_23006 ?auto_23003 ?auto_23004 )
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
      ?auto_23020 - INSTRUMENT
      ?auto_23019 - SATELLITE
      ?auto_23017 - DIRECTION
      ?auto_23016 - DIRECTION
      ?auto_23018 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23020 ?auto_23019 ) ( SUPPORTS ?auto_23020 ?auto_23014 ) ( not ( = ?auto_23015 ?auto_23017 ) ) ( HAVE_IMAGE ?auto_23012 ?auto_23013 ) ( not ( = ?auto_23012 ?auto_23015 ) ) ( not ( = ?auto_23012 ?auto_23017 ) ) ( not ( = ?auto_23013 ?auto_23014 ) ) ( CALIBRATION_TARGET ?auto_23020 ?auto_23017 ) ( POINTING ?auto_23019 ?auto_23016 ) ( not ( = ?auto_23017 ?auto_23016 ) ) ( not ( = ?auto_23015 ?auto_23016 ) ) ( not ( = ?auto_23012 ?auto_23016 ) ) ( ON_BOARD ?auto_23018 ?auto_23019 ) ( POWER_ON ?auto_23018 ) ( not ( = ?auto_23020 ?auto_23018 ) ) )
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
      ?auto_23028 - INSTRUMENT
      ?auto_23026 - SATELLITE
      ?auto_23027 - DIRECTION
      ?auto_23030 - DIRECTION
      ?auto_23029 - MODE
      ?auto_23025 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23028 ?auto_23026 ) ( SUPPORTS ?auto_23028 ?auto_23023 ) ( not ( = ?auto_23024 ?auto_23027 ) ) ( HAVE_IMAGE ?auto_23030 ?auto_23029 ) ( not ( = ?auto_23030 ?auto_23024 ) ) ( not ( = ?auto_23030 ?auto_23027 ) ) ( not ( = ?auto_23029 ?auto_23023 ) ) ( CALIBRATION_TARGET ?auto_23028 ?auto_23027 ) ( POINTING ?auto_23026 ?auto_23021 ) ( not ( = ?auto_23027 ?auto_23021 ) ) ( not ( = ?auto_23024 ?auto_23021 ) ) ( not ( = ?auto_23030 ?auto_23021 ) ) ( ON_BOARD ?auto_23025 ?auto_23026 ) ( POWER_ON ?auto_23025 ) ( not ( = ?auto_23028 ?auto_23025 ) ) ( HAVE_IMAGE ?auto_23021 ?auto_23022 ) ( not ( = ?auto_23022 ?auto_23023 ) ) ( not ( = ?auto_23022 ?auto_23029 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23030 ?auto_23029 ?auto_23024 ?auto_23023 )
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
      ?auto_23039 - INSTRUMENT
      ?auto_23036 - SATELLITE
      ?auto_23038 - DIRECTION
      ?auto_23037 - DIRECTION
      ?auto_23035 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23039 ?auto_23036 ) ( SUPPORTS ?auto_23039 ?auto_23032 ) ( not ( = ?auto_23031 ?auto_23038 ) ) ( HAVE_IMAGE ?auto_23034 ?auto_23033 ) ( not ( = ?auto_23034 ?auto_23031 ) ) ( not ( = ?auto_23034 ?auto_23038 ) ) ( not ( = ?auto_23033 ?auto_23032 ) ) ( CALIBRATION_TARGET ?auto_23039 ?auto_23038 ) ( POINTING ?auto_23036 ?auto_23037 ) ( not ( = ?auto_23038 ?auto_23037 ) ) ( not ( = ?auto_23031 ?auto_23037 ) ) ( not ( = ?auto_23034 ?auto_23037 ) ) ( ON_BOARD ?auto_23035 ?auto_23036 ) ( POWER_ON ?auto_23035 ) ( not ( = ?auto_23039 ?auto_23035 ) ) )
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
      ?auto_23047 - INSTRUMENT
      ?auto_23045 - SATELLITE
      ?auto_23046 - DIRECTION
      ?auto_23049 - DIRECTION
      ?auto_23048 - MODE
      ?auto_23044 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23047 ?auto_23045 ) ( SUPPORTS ?auto_23047 ?auto_23041 ) ( not ( = ?auto_23040 ?auto_23046 ) ) ( HAVE_IMAGE ?auto_23049 ?auto_23048 ) ( not ( = ?auto_23049 ?auto_23040 ) ) ( not ( = ?auto_23049 ?auto_23046 ) ) ( not ( = ?auto_23048 ?auto_23041 ) ) ( CALIBRATION_TARGET ?auto_23047 ?auto_23046 ) ( POINTING ?auto_23045 ?auto_23043 ) ( not ( = ?auto_23046 ?auto_23043 ) ) ( not ( = ?auto_23040 ?auto_23043 ) ) ( not ( = ?auto_23049 ?auto_23043 ) ) ( ON_BOARD ?auto_23044 ?auto_23045 ) ( POWER_ON ?auto_23044 ) ( not ( = ?auto_23047 ?auto_23044 ) ) ( HAVE_IMAGE ?auto_23043 ?auto_23042 ) ( not ( = ?auto_23041 ?auto_23042 ) ) ( not ( = ?auto_23042 ?auto_23048 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23049 ?auto_23048 ?auto_23040 ?auto_23041 )
      ( GET-2IMAGE-VERIFY ?auto_23040 ?auto_23041 ?auto_23043 ?auto_23042 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23061 - DIRECTION
      ?auto_23062 - MODE
      ?auto_23064 - DIRECTION
      ?auto_23063 - MODE
      ?auto_23066 - DIRECTION
      ?auto_23065 - MODE
    )
    :vars
    (
      ?auto_23071 - INSTRUMENT
      ?auto_23068 - SATELLITE
      ?auto_23070 - DIRECTION
      ?auto_23069 - DIRECTION
      ?auto_23067 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23071 ?auto_23068 ) ( SUPPORTS ?auto_23071 ?auto_23065 ) ( not ( = ?auto_23066 ?auto_23070 ) ) ( HAVE_IMAGE ?auto_23064 ?auto_23063 ) ( not ( = ?auto_23064 ?auto_23066 ) ) ( not ( = ?auto_23064 ?auto_23070 ) ) ( not ( = ?auto_23063 ?auto_23065 ) ) ( CALIBRATION_TARGET ?auto_23071 ?auto_23070 ) ( POINTING ?auto_23068 ?auto_23069 ) ( not ( = ?auto_23070 ?auto_23069 ) ) ( not ( = ?auto_23066 ?auto_23069 ) ) ( not ( = ?auto_23064 ?auto_23069 ) ) ( ON_BOARD ?auto_23067 ?auto_23068 ) ( POWER_ON ?auto_23067 ) ( not ( = ?auto_23071 ?auto_23067 ) ) ( HAVE_IMAGE ?auto_23061 ?auto_23062 ) ( not ( = ?auto_23061 ?auto_23064 ) ) ( not ( = ?auto_23061 ?auto_23066 ) ) ( not ( = ?auto_23061 ?auto_23070 ) ) ( not ( = ?auto_23061 ?auto_23069 ) ) ( not ( = ?auto_23062 ?auto_23063 ) ) ( not ( = ?auto_23062 ?auto_23065 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23064 ?auto_23063 ?auto_23066 ?auto_23065 )
      ( GET-3IMAGE-VERIFY ?auto_23061 ?auto_23062 ?auto_23064 ?auto_23063 ?auto_23066 ?auto_23065 ) )
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
      ?auto_23081 - INSTRUMENT
      ?auto_23079 - SATELLITE
      ?auto_23080 - DIRECTION
      ?auto_23078 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23081 ?auto_23079 ) ( SUPPORTS ?auto_23081 ?auto_23076 ) ( not ( = ?auto_23077 ?auto_23080 ) ) ( HAVE_IMAGE ?auto_23072 ?auto_23073 ) ( not ( = ?auto_23072 ?auto_23077 ) ) ( not ( = ?auto_23072 ?auto_23080 ) ) ( not ( = ?auto_23073 ?auto_23076 ) ) ( CALIBRATION_TARGET ?auto_23081 ?auto_23080 ) ( POINTING ?auto_23079 ?auto_23075 ) ( not ( = ?auto_23080 ?auto_23075 ) ) ( not ( = ?auto_23077 ?auto_23075 ) ) ( not ( = ?auto_23072 ?auto_23075 ) ) ( ON_BOARD ?auto_23078 ?auto_23079 ) ( POWER_ON ?auto_23078 ) ( not ( = ?auto_23081 ?auto_23078 ) ) ( HAVE_IMAGE ?auto_23075 ?auto_23074 ) ( not ( = ?auto_23073 ?auto_23074 ) ) ( not ( = ?auto_23074 ?auto_23076 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23072 ?auto_23073 ?auto_23077 ?auto_23076 )
      ( GET-3IMAGE-VERIFY ?auto_23072 ?auto_23073 ?auto_23075 ?auto_23074 ?auto_23077 ?auto_23076 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23082 - DIRECTION
      ?auto_23083 - MODE
      ?auto_23085 - DIRECTION
      ?auto_23084 - MODE
      ?auto_23087 - DIRECTION
      ?auto_23086 - MODE
    )
    :vars
    (
      ?auto_23092 - INSTRUMENT
      ?auto_23089 - SATELLITE
      ?auto_23091 - DIRECTION
      ?auto_23090 - DIRECTION
      ?auto_23088 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23092 ?auto_23089 ) ( SUPPORTS ?auto_23092 ?auto_23084 ) ( not ( = ?auto_23085 ?auto_23091 ) ) ( HAVE_IMAGE ?auto_23087 ?auto_23086 ) ( not ( = ?auto_23087 ?auto_23085 ) ) ( not ( = ?auto_23087 ?auto_23091 ) ) ( not ( = ?auto_23086 ?auto_23084 ) ) ( CALIBRATION_TARGET ?auto_23092 ?auto_23091 ) ( POINTING ?auto_23089 ?auto_23090 ) ( not ( = ?auto_23091 ?auto_23090 ) ) ( not ( = ?auto_23085 ?auto_23090 ) ) ( not ( = ?auto_23087 ?auto_23090 ) ) ( ON_BOARD ?auto_23088 ?auto_23089 ) ( POWER_ON ?auto_23088 ) ( not ( = ?auto_23092 ?auto_23088 ) ) ( HAVE_IMAGE ?auto_23082 ?auto_23083 ) ( not ( = ?auto_23082 ?auto_23085 ) ) ( not ( = ?auto_23082 ?auto_23087 ) ) ( not ( = ?auto_23082 ?auto_23091 ) ) ( not ( = ?auto_23082 ?auto_23090 ) ) ( not ( = ?auto_23083 ?auto_23084 ) ) ( not ( = ?auto_23083 ?auto_23086 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23087 ?auto_23086 ?auto_23085 ?auto_23084 )
      ( GET-3IMAGE-VERIFY ?auto_23082 ?auto_23083 ?auto_23085 ?auto_23084 ?auto_23087 ?auto_23086 ) )
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
      ?auto_23102 - INSTRUMENT
      ?auto_23100 - SATELLITE
      ?auto_23101 - DIRECTION
      ?auto_23099 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23102 ?auto_23100 ) ( SUPPORTS ?auto_23102 ?auto_23095 ) ( not ( = ?auto_23096 ?auto_23101 ) ) ( HAVE_IMAGE ?auto_23093 ?auto_23094 ) ( not ( = ?auto_23093 ?auto_23096 ) ) ( not ( = ?auto_23093 ?auto_23101 ) ) ( not ( = ?auto_23094 ?auto_23095 ) ) ( CALIBRATION_TARGET ?auto_23102 ?auto_23101 ) ( POINTING ?auto_23100 ?auto_23098 ) ( not ( = ?auto_23101 ?auto_23098 ) ) ( not ( = ?auto_23096 ?auto_23098 ) ) ( not ( = ?auto_23093 ?auto_23098 ) ) ( ON_BOARD ?auto_23099 ?auto_23100 ) ( POWER_ON ?auto_23099 ) ( not ( = ?auto_23102 ?auto_23099 ) ) ( HAVE_IMAGE ?auto_23098 ?auto_23097 ) ( not ( = ?auto_23094 ?auto_23097 ) ) ( not ( = ?auto_23095 ?auto_23097 ) ) )
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
      ?auto_23123 - INSTRUMENT
      ?auto_23121 - SATELLITE
      ?auto_23122 - DIRECTION
      ?auto_23120 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23123 ?auto_23121 ) ( SUPPORTS ?auto_23123 ?auto_23118 ) ( not ( = ?auto_23119 ?auto_23122 ) ) ( HAVE_IMAGE ?auto_23117 ?auto_23116 ) ( not ( = ?auto_23117 ?auto_23119 ) ) ( not ( = ?auto_23117 ?auto_23122 ) ) ( not ( = ?auto_23116 ?auto_23118 ) ) ( CALIBRATION_TARGET ?auto_23123 ?auto_23122 ) ( POINTING ?auto_23121 ?auto_23114 ) ( not ( = ?auto_23122 ?auto_23114 ) ) ( not ( = ?auto_23119 ?auto_23114 ) ) ( not ( = ?auto_23117 ?auto_23114 ) ) ( ON_BOARD ?auto_23120 ?auto_23121 ) ( POWER_ON ?auto_23120 ) ( not ( = ?auto_23123 ?auto_23120 ) ) ( HAVE_IMAGE ?auto_23114 ?auto_23115 ) ( not ( = ?auto_23115 ?auto_23116 ) ) ( not ( = ?auto_23115 ?auto_23118 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23117 ?auto_23116 ?auto_23119 ?auto_23118 )
      ( GET-3IMAGE-VERIFY ?auto_23114 ?auto_23115 ?auto_23117 ?auto_23116 ?auto_23119 ?auto_23118 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23124 - DIRECTION
      ?auto_23125 - MODE
      ?auto_23127 - DIRECTION
      ?auto_23126 - MODE
      ?auto_23129 - DIRECTION
      ?auto_23128 - MODE
    )
    :vars
    (
      ?auto_23133 - INSTRUMENT
      ?auto_23131 - SATELLITE
      ?auto_23132 - DIRECTION
      ?auto_23135 - DIRECTION
      ?auto_23134 - MODE
      ?auto_23130 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23133 ?auto_23131 ) ( SUPPORTS ?auto_23133 ?auto_23128 ) ( not ( = ?auto_23129 ?auto_23132 ) ) ( HAVE_IMAGE ?auto_23135 ?auto_23134 ) ( not ( = ?auto_23135 ?auto_23129 ) ) ( not ( = ?auto_23135 ?auto_23132 ) ) ( not ( = ?auto_23134 ?auto_23128 ) ) ( CALIBRATION_TARGET ?auto_23133 ?auto_23132 ) ( POINTING ?auto_23131 ?auto_23127 ) ( not ( = ?auto_23132 ?auto_23127 ) ) ( not ( = ?auto_23129 ?auto_23127 ) ) ( not ( = ?auto_23135 ?auto_23127 ) ) ( ON_BOARD ?auto_23130 ?auto_23131 ) ( POWER_ON ?auto_23130 ) ( not ( = ?auto_23133 ?auto_23130 ) ) ( HAVE_IMAGE ?auto_23124 ?auto_23125 ) ( HAVE_IMAGE ?auto_23127 ?auto_23126 ) ( not ( = ?auto_23124 ?auto_23127 ) ) ( not ( = ?auto_23124 ?auto_23129 ) ) ( not ( = ?auto_23124 ?auto_23132 ) ) ( not ( = ?auto_23124 ?auto_23135 ) ) ( not ( = ?auto_23125 ?auto_23126 ) ) ( not ( = ?auto_23125 ?auto_23128 ) ) ( not ( = ?auto_23125 ?auto_23134 ) ) ( not ( = ?auto_23126 ?auto_23128 ) ) ( not ( = ?auto_23126 ?auto_23134 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23135 ?auto_23134 ?auto_23129 ?auto_23128 )
      ( GET-3IMAGE-VERIFY ?auto_23124 ?auto_23125 ?auto_23127 ?auto_23126 ?auto_23129 ?auto_23128 ) )
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
      ?auto_23145 - INSTRUMENT
      ?auto_23143 - SATELLITE
      ?auto_23144 - DIRECTION
      ?auto_23142 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23145 ?auto_23143 ) ( SUPPORTS ?auto_23145 ?auto_23138 ) ( not ( = ?auto_23139 ?auto_23144 ) ) ( HAVE_IMAGE ?auto_23141 ?auto_23140 ) ( not ( = ?auto_23141 ?auto_23139 ) ) ( not ( = ?auto_23141 ?auto_23144 ) ) ( not ( = ?auto_23140 ?auto_23138 ) ) ( CALIBRATION_TARGET ?auto_23145 ?auto_23144 ) ( POINTING ?auto_23143 ?auto_23136 ) ( not ( = ?auto_23144 ?auto_23136 ) ) ( not ( = ?auto_23139 ?auto_23136 ) ) ( not ( = ?auto_23141 ?auto_23136 ) ) ( ON_BOARD ?auto_23142 ?auto_23143 ) ( POWER_ON ?auto_23142 ) ( not ( = ?auto_23145 ?auto_23142 ) ) ( HAVE_IMAGE ?auto_23136 ?auto_23137 ) ( not ( = ?auto_23137 ?auto_23138 ) ) ( not ( = ?auto_23137 ?auto_23140 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23141 ?auto_23140 ?auto_23139 ?auto_23138 )
      ( GET-3IMAGE-VERIFY ?auto_23136 ?auto_23137 ?auto_23139 ?auto_23138 ?auto_23141 ?auto_23140 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23146 - DIRECTION
      ?auto_23147 - MODE
      ?auto_23149 - DIRECTION
      ?auto_23148 - MODE
      ?auto_23151 - DIRECTION
      ?auto_23150 - MODE
    )
    :vars
    (
      ?auto_23155 - INSTRUMENT
      ?auto_23153 - SATELLITE
      ?auto_23154 - DIRECTION
      ?auto_23157 - DIRECTION
      ?auto_23156 - MODE
      ?auto_23152 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23155 ?auto_23153 ) ( SUPPORTS ?auto_23155 ?auto_23148 ) ( not ( = ?auto_23149 ?auto_23154 ) ) ( HAVE_IMAGE ?auto_23157 ?auto_23156 ) ( not ( = ?auto_23157 ?auto_23149 ) ) ( not ( = ?auto_23157 ?auto_23154 ) ) ( not ( = ?auto_23156 ?auto_23148 ) ) ( CALIBRATION_TARGET ?auto_23155 ?auto_23154 ) ( POINTING ?auto_23153 ?auto_23151 ) ( not ( = ?auto_23154 ?auto_23151 ) ) ( not ( = ?auto_23149 ?auto_23151 ) ) ( not ( = ?auto_23157 ?auto_23151 ) ) ( ON_BOARD ?auto_23152 ?auto_23153 ) ( POWER_ON ?auto_23152 ) ( not ( = ?auto_23155 ?auto_23152 ) ) ( HAVE_IMAGE ?auto_23146 ?auto_23147 ) ( HAVE_IMAGE ?auto_23151 ?auto_23150 ) ( not ( = ?auto_23146 ?auto_23149 ) ) ( not ( = ?auto_23146 ?auto_23151 ) ) ( not ( = ?auto_23146 ?auto_23154 ) ) ( not ( = ?auto_23146 ?auto_23157 ) ) ( not ( = ?auto_23147 ?auto_23148 ) ) ( not ( = ?auto_23147 ?auto_23150 ) ) ( not ( = ?auto_23147 ?auto_23156 ) ) ( not ( = ?auto_23148 ?auto_23150 ) ) ( not ( = ?auto_23150 ?auto_23156 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23157 ?auto_23156 ?auto_23149 ?auto_23148 )
      ( GET-3IMAGE-VERIFY ?auto_23146 ?auto_23147 ?auto_23149 ?auto_23148 ?auto_23151 ?auto_23150 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23170 - DIRECTION
      ?auto_23171 - MODE
      ?auto_23173 - DIRECTION
      ?auto_23172 - MODE
      ?auto_23175 - DIRECTION
      ?auto_23174 - MODE
    )
    :vars
    (
      ?auto_23180 - INSTRUMENT
      ?auto_23177 - SATELLITE
      ?auto_23179 - DIRECTION
      ?auto_23178 - DIRECTION
      ?auto_23176 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23180 ?auto_23177 ) ( SUPPORTS ?auto_23180 ?auto_23171 ) ( not ( = ?auto_23170 ?auto_23179 ) ) ( HAVE_IMAGE ?auto_23175 ?auto_23172 ) ( not ( = ?auto_23175 ?auto_23170 ) ) ( not ( = ?auto_23175 ?auto_23179 ) ) ( not ( = ?auto_23172 ?auto_23171 ) ) ( CALIBRATION_TARGET ?auto_23180 ?auto_23179 ) ( POINTING ?auto_23177 ?auto_23178 ) ( not ( = ?auto_23179 ?auto_23178 ) ) ( not ( = ?auto_23170 ?auto_23178 ) ) ( not ( = ?auto_23175 ?auto_23178 ) ) ( ON_BOARD ?auto_23176 ?auto_23177 ) ( POWER_ON ?auto_23176 ) ( not ( = ?auto_23180 ?auto_23176 ) ) ( HAVE_IMAGE ?auto_23173 ?auto_23172 ) ( HAVE_IMAGE ?auto_23175 ?auto_23174 ) ( not ( = ?auto_23170 ?auto_23173 ) ) ( not ( = ?auto_23171 ?auto_23174 ) ) ( not ( = ?auto_23173 ?auto_23175 ) ) ( not ( = ?auto_23173 ?auto_23179 ) ) ( not ( = ?auto_23173 ?auto_23178 ) ) ( not ( = ?auto_23172 ?auto_23174 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23175 ?auto_23172 ?auto_23170 ?auto_23171 )
      ( GET-3IMAGE-VERIFY ?auto_23170 ?auto_23171 ?auto_23173 ?auto_23172 ?auto_23175 ?auto_23174 ) )
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
      ?auto_23190 - INSTRUMENT
      ?auto_23188 - SATELLITE
      ?auto_23189 - DIRECTION
      ?auto_23187 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23190 ?auto_23188 ) ( SUPPORTS ?auto_23190 ?auto_23182 ) ( not ( = ?auto_23181 ?auto_23189 ) ) ( HAVE_IMAGE ?auto_23184 ?auto_23183 ) ( not ( = ?auto_23184 ?auto_23181 ) ) ( not ( = ?auto_23184 ?auto_23189 ) ) ( not ( = ?auto_23183 ?auto_23182 ) ) ( CALIBRATION_TARGET ?auto_23190 ?auto_23189 ) ( POINTING ?auto_23188 ?auto_23186 ) ( not ( = ?auto_23189 ?auto_23186 ) ) ( not ( = ?auto_23181 ?auto_23186 ) ) ( not ( = ?auto_23184 ?auto_23186 ) ) ( ON_BOARD ?auto_23187 ?auto_23188 ) ( POWER_ON ?auto_23187 ) ( not ( = ?auto_23190 ?auto_23187 ) ) ( HAVE_IMAGE ?auto_23186 ?auto_23185 ) ( not ( = ?auto_23182 ?auto_23185 ) ) ( not ( = ?auto_23183 ?auto_23185 ) ) )
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
      ?auto_23211 - INSTRUMENT
      ?auto_23209 - SATELLITE
      ?auto_23210 - DIRECTION
      ?auto_23208 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23211 ?auto_23209 ) ( SUPPORTS ?auto_23211 ?auto_23203 ) ( not ( = ?auto_23202 ?auto_23210 ) ) ( HAVE_IMAGE ?auto_23207 ?auto_23206 ) ( not ( = ?auto_23207 ?auto_23202 ) ) ( not ( = ?auto_23207 ?auto_23210 ) ) ( not ( = ?auto_23206 ?auto_23203 ) ) ( CALIBRATION_TARGET ?auto_23211 ?auto_23210 ) ( POINTING ?auto_23209 ?auto_23205 ) ( not ( = ?auto_23210 ?auto_23205 ) ) ( not ( = ?auto_23202 ?auto_23205 ) ) ( not ( = ?auto_23207 ?auto_23205 ) ) ( ON_BOARD ?auto_23208 ?auto_23209 ) ( POWER_ON ?auto_23208 ) ( not ( = ?auto_23211 ?auto_23208 ) ) ( HAVE_IMAGE ?auto_23205 ?auto_23204 ) ( not ( = ?auto_23203 ?auto_23204 ) ) ( not ( = ?auto_23204 ?auto_23206 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23207 ?auto_23206 ?auto_23202 ?auto_23203 )
      ( GET-3IMAGE-VERIFY ?auto_23202 ?auto_23203 ?auto_23205 ?auto_23204 ?auto_23207 ?auto_23206 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23212 - DIRECTION
      ?auto_23213 - MODE
      ?auto_23215 - DIRECTION
      ?auto_23214 - MODE
      ?auto_23217 - DIRECTION
      ?auto_23216 - MODE
    )
    :vars
    (
      ?auto_23221 - INSTRUMENT
      ?auto_23219 - SATELLITE
      ?auto_23220 - DIRECTION
      ?auto_23223 - DIRECTION
      ?auto_23222 - MODE
      ?auto_23218 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23221 ?auto_23219 ) ( SUPPORTS ?auto_23221 ?auto_23213 ) ( not ( = ?auto_23212 ?auto_23220 ) ) ( HAVE_IMAGE ?auto_23223 ?auto_23222 ) ( not ( = ?auto_23223 ?auto_23212 ) ) ( not ( = ?auto_23223 ?auto_23220 ) ) ( not ( = ?auto_23222 ?auto_23213 ) ) ( CALIBRATION_TARGET ?auto_23221 ?auto_23220 ) ( POINTING ?auto_23219 ?auto_23217 ) ( not ( = ?auto_23220 ?auto_23217 ) ) ( not ( = ?auto_23212 ?auto_23217 ) ) ( not ( = ?auto_23223 ?auto_23217 ) ) ( ON_BOARD ?auto_23218 ?auto_23219 ) ( POWER_ON ?auto_23218 ) ( not ( = ?auto_23221 ?auto_23218 ) ) ( HAVE_IMAGE ?auto_23215 ?auto_23214 ) ( HAVE_IMAGE ?auto_23217 ?auto_23216 ) ( not ( = ?auto_23212 ?auto_23215 ) ) ( not ( = ?auto_23213 ?auto_23214 ) ) ( not ( = ?auto_23213 ?auto_23216 ) ) ( not ( = ?auto_23215 ?auto_23217 ) ) ( not ( = ?auto_23215 ?auto_23220 ) ) ( not ( = ?auto_23215 ?auto_23223 ) ) ( not ( = ?auto_23214 ?auto_23216 ) ) ( not ( = ?auto_23214 ?auto_23222 ) ) ( not ( = ?auto_23216 ?auto_23222 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23223 ?auto_23222 ?auto_23212 ?auto_23213 )
      ( GET-3IMAGE-VERIFY ?auto_23212 ?auto_23213 ?auto_23215 ?auto_23214 ?auto_23217 ?auto_23216 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_23272 - DIRECTION
      ?auto_23273 - MODE
    )
    :vars
    (
      ?auto_23278 - INSTRUMENT
      ?auto_23275 - SATELLITE
      ?auto_23277 - DIRECTION
      ?auto_23280 - DIRECTION
      ?auto_23279 - MODE
      ?auto_23276 - DIRECTION
      ?auto_23274 - INSTRUMENT
      ?auto_23281 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_23278 ?auto_23275 ) ( SUPPORTS ?auto_23278 ?auto_23273 ) ( not ( = ?auto_23272 ?auto_23277 ) ) ( HAVE_IMAGE ?auto_23280 ?auto_23279 ) ( not ( = ?auto_23280 ?auto_23272 ) ) ( not ( = ?auto_23280 ?auto_23277 ) ) ( not ( = ?auto_23279 ?auto_23273 ) ) ( CALIBRATION_TARGET ?auto_23278 ?auto_23277 ) ( POINTING ?auto_23275 ?auto_23276 ) ( not ( = ?auto_23277 ?auto_23276 ) ) ( not ( = ?auto_23272 ?auto_23276 ) ) ( not ( = ?auto_23280 ?auto_23276 ) ) ( ON_BOARD ?auto_23274 ?auto_23275 ) ( POWER_ON ?auto_23274 ) ( not ( = ?auto_23278 ?auto_23274 ) ) ( CALIBRATED ?auto_23274 ) ( SUPPORTS ?auto_23274 ?auto_23281 ) ( not ( = ?auto_23279 ?auto_23281 ) ) ( not ( = ?auto_23273 ?auto_23281 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23280 ?auto_23279 ?auto_23276 ?auto_23281 )
      ( GET-2IMAGE ?auto_23280 ?auto_23279 ?auto_23272 ?auto_23273 )
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
      ?auto_23291 - INSTRUMENT
      ?auto_23287 - SATELLITE
      ?auto_23289 - DIRECTION
      ?auto_23286 - DIRECTION
      ?auto_23290 - INSTRUMENT
      ?auto_23288 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_23291 ?auto_23287 ) ( SUPPORTS ?auto_23291 ?auto_23284 ) ( not ( = ?auto_23285 ?auto_23289 ) ) ( HAVE_IMAGE ?auto_23282 ?auto_23283 ) ( not ( = ?auto_23282 ?auto_23285 ) ) ( not ( = ?auto_23282 ?auto_23289 ) ) ( not ( = ?auto_23283 ?auto_23284 ) ) ( CALIBRATION_TARGET ?auto_23291 ?auto_23289 ) ( POINTING ?auto_23287 ?auto_23286 ) ( not ( = ?auto_23289 ?auto_23286 ) ) ( not ( = ?auto_23285 ?auto_23286 ) ) ( not ( = ?auto_23282 ?auto_23286 ) ) ( ON_BOARD ?auto_23290 ?auto_23287 ) ( POWER_ON ?auto_23290 ) ( not ( = ?auto_23291 ?auto_23290 ) ) ( CALIBRATED ?auto_23290 ) ( SUPPORTS ?auto_23290 ?auto_23288 ) ( not ( = ?auto_23283 ?auto_23288 ) ) ( not ( = ?auto_23284 ?auto_23288 ) ) )
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
      ?auto_23301 - INSTRUMENT
      ?auto_23299 - SATELLITE
      ?auto_23296 - DIRECTION
      ?auto_23298 - DIRECTION
      ?auto_23297 - MODE
      ?auto_23300 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23301 ?auto_23299 ) ( SUPPORTS ?auto_23301 ?auto_23294 ) ( not ( = ?auto_23295 ?auto_23296 ) ) ( HAVE_IMAGE ?auto_23298 ?auto_23297 ) ( not ( = ?auto_23298 ?auto_23295 ) ) ( not ( = ?auto_23298 ?auto_23296 ) ) ( not ( = ?auto_23297 ?auto_23294 ) ) ( CALIBRATION_TARGET ?auto_23301 ?auto_23296 ) ( POINTING ?auto_23299 ?auto_23292 ) ( not ( = ?auto_23296 ?auto_23292 ) ) ( not ( = ?auto_23295 ?auto_23292 ) ) ( not ( = ?auto_23298 ?auto_23292 ) ) ( ON_BOARD ?auto_23300 ?auto_23299 ) ( POWER_ON ?auto_23300 ) ( not ( = ?auto_23301 ?auto_23300 ) ) ( CALIBRATED ?auto_23300 ) ( SUPPORTS ?auto_23300 ?auto_23293 ) ( not ( = ?auto_23297 ?auto_23293 ) ) ( not ( = ?auto_23294 ?auto_23293 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23298 ?auto_23297 ?auto_23295 ?auto_23294 )
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
      ?auto_23311 - INSTRUMENT
      ?auto_23307 - SATELLITE
      ?auto_23306 - DIRECTION
      ?auto_23308 - DIRECTION
      ?auto_23310 - INSTRUMENT
      ?auto_23309 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_23311 ?auto_23307 ) ( SUPPORTS ?auto_23311 ?auto_23303 ) ( not ( = ?auto_23302 ?auto_23306 ) ) ( HAVE_IMAGE ?auto_23305 ?auto_23304 ) ( not ( = ?auto_23305 ?auto_23302 ) ) ( not ( = ?auto_23305 ?auto_23306 ) ) ( not ( = ?auto_23304 ?auto_23303 ) ) ( CALIBRATION_TARGET ?auto_23311 ?auto_23306 ) ( POINTING ?auto_23307 ?auto_23308 ) ( not ( = ?auto_23306 ?auto_23308 ) ) ( not ( = ?auto_23302 ?auto_23308 ) ) ( not ( = ?auto_23305 ?auto_23308 ) ) ( ON_BOARD ?auto_23310 ?auto_23307 ) ( POWER_ON ?auto_23310 ) ( not ( = ?auto_23311 ?auto_23310 ) ) ( CALIBRATED ?auto_23310 ) ( SUPPORTS ?auto_23310 ?auto_23309 ) ( not ( = ?auto_23304 ?auto_23309 ) ) ( not ( = ?auto_23303 ?auto_23309 ) ) )
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
      ?auto_23321 - INSTRUMENT
      ?auto_23319 - SATELLITE
      ?auto_23316 - DIRECTION
      ?auto_23318 - DIRECTION
      ?auto_23317 - MODE
      ?auto_23320 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23321 ?auto_23319 ) ( SUPPORTS ?auto_23321 ?auto_23313 ) ( not ( = ?auto_23312 ?auto_23316 ) ) ( HAVE_IMAGE ?auto_23318 ?auto_23317 ) ( not ( = ?auto_23318 ?auto_23312 ) ) ( not ( = ?auto_23318 ?auto_23316 ) ) ( not ( = ?auto_23317 ?auto_23313 ) ) ( CALIBRATION_TARGET ?auto_23321 ?auto_23316 ) ( POINTING ?auto_23319 ?auto_23315 ) ( not ( = ?auto_23316 ?auto_23315 ) ) ( not ( = ?auto_23312 ?auto_23315 ) ) ( not ( = ?auto_23318 ?auto_23315 ) ) ( ON_BOARD ?auto_23320 ?auto_23319 ) ( POWER_ON ?auto_23320 ) ( not ( = ?auto_23321 ?auto_23320 ) ) ( CALIBRATED ?auto_23320 ) ( SUPPORTS ?auto_23320 ?auto_23314 ) ( not ( = ?auto_23317 ?auto_23314 ) ) ( not ( = ?auto_23313 ?auto_23314 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23318 ?auto_23317 ?auto_23312 ?auto_23313 )
      ( GET-2IMAGE-VERIFY ?auto_23312 ?auto_23313 ?auto_23315 ?auto_23314 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23334 - DIRECTION
      ?auto_23335 - MODE
      ?auto_23337 - DIRECTION
      ?auto_23336 - MODE
      ?auto_23339 - DIRECTION
      ?auto_23338 - MODE
    )
    :vars
    (
      ?auto_23345 - INSTRUMENT
      ?auto_23341 - SATELLITE
      ?auto_23340 - DIRECTION
      ?auto_23342 - DIRECTION
      ?auto_23344 - INSTRUMENT
      ?auto_23343 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_23345 ?auto_23341 ) ( SUPPORTS ?auto_23345 ?auto_23338 ) ( not ( = ?auto_23339 ?auto_23340 ) ) ( HAVE_IMAGE ?auto_23337 ?auto_23336 ) ( not ( = ?auto_23337 ?auto_23339 ) ) ( not ( = ?auto_23337 ?auto_23340 ) ) ( not ( = ?auto_23336 ?auto_23338 ) ) ( CALIBRATION_TARGET ?auto_23345 ?auto_23340 ) ( POINTING ?auto_23341 ?auto_23342 ) ( not ( = ?auto_23340 ?auto_23342 ) ) ( not ( = ?auto_23339 ?auto_23342 ) ) ( not ( = ?auto_23337 ?auto_23342 ) ) ( ON_BOARD ?auto_23344 ?auto_23341 ) ( POWER_ON ?auto_23344 ) ( not ( = ?auto_23345 ?auto_23344 ) ) ( CALIBRATED ?auto_23344 ) ( SUPPORTS ?auto_23344 ?auto_23343 ) ( not ( = ?auto_23336 ?auto_23343 ) ) ( not ( = ?auto_23338 ?auto_23343 ) ) ( HAVE_IMAGE ?auto_23334 ?auto_23335 ) ( not ( = ?auto_23334 ?auto_23337 ) ) ( not ( = ?auto_23334 ?auto_23339 ) ) ( not ( = ?auto_23334 ?auto_23340 ) ) ( not ( = ?auto_23334 ?auto_23342 ) ) ( not ( = ?auto_23335 ?auto_23336 ) ) ( not ( = ?auto_23335 ?auto_23338 ) ) ( not ( = ?auto_23335 ?auto_23343 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23337 ?auto_23336 ?auto_23339 ?auto_23338 )
      ( GET-3IMAGE-VERIFY ?auto_23334 ?auto_23335 ?auto_23337 ?auto_23336 ?auto_23339 ?auto_23338 ) )
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
      ?auto_23352 - DIRECTION
      ?auto_23354 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23355 ?auto_23353 ) ( SUPPORTS ?auto_23355 ?auto_23350 ) ( not ( = ?auto_23351 ?auto_23352 ) ) ( HAVE_IMAGE ?auto_23346 ?auto_23347 ) ( not ( = ?auto_23346 ?auto_23351 ) ) ( not ( = ?auto_23346 ?auto_23352 ) ) ( not ( = ?auto_23347 ?auto_23350 ) ) ( CALIBRATION_TARGET ?auto_23355 ?auto_23352 ) ( POINTING ?auto_23353 ?auto_23349 ) ( not ( = ?auto_23352 ?auto_23349 ) ) ( not ( = ?auto_23351 ?auto_23349 ) ) ( not ( = ?auto_23346 ?auto_23349 ) ) ( ON_BOARD ?auto_23354 ?auto_23353 ) ( POWER_ON ?auto_23354 ) ( not ( = ?auto_23355 ?auto_23354 ) ) ( CALIBRATED ?auto_23354 ) ( SUPPORTS ?auto_23354 ?auto_23348 ) ( not ( = ?auto_23347 ?auto_23348 ) ) ( not ( = ?auto_23350 ?auto_23348 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23346 ?auto_23347 ?auto_23351 ?auto_23350 )
      ( GET-3IMAGE-VERIFY ?auto_23346 ?auto_23347 ?auto_23349 ?auto_23348 ?auto_23351 ?auto_23350 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23356 - DIRECTION
      ?auto_23357 - MODE
      ?auto_23359 - DIRECTION
      ?auto_23358 - MODE
      ?auto_23361 - DIRECTION
      ?auto_23360 - MODE
    )
    :vars
    (
      ?auto_23367 - INSTRUMENT
      ?auto_23363 - SATELLITE
      ?auto_23362 - DIRECTION
      ?auto_23364 - DIRECTION
      ?auto_23366 - INSTRUMENT
      ?auto_23365 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_23367 ?auto_23363 ) ( SUPPORTS ?auto_23367 ?auto_23358 ) ( not ( = ?auto_23359 ?auto_23362 ) ) ( HAVE_IMAGE ?auto_23361 ?auto_23360 ) ( not ( = ?auto_23361 ?auto_23359 ) ) ( not ( = ?auto_23361 ?auto_23362 ) ) ( not ( = ?auto_23360 ?auto_23358 ) ) ( CALIBRATION_TARGET ?auto_23367 ?auto_23362 ) ( POINTING ?auto_23363 ?auto_23364 ) ( not ( = ?auto_23362 ?auto_23364 ) ) ( not ( = ?auto_23359 ?auto_23364 ) ) ( not ( = ?auto_23361 ?auto_23364 ) ) ( ON_BOARD ?auto_23366 ?auto_23363 ) ( POWER_ON ?auto_23366 ) ( not ( = ?auto_23367 ?auto_23366 ) ) ( CALIBRATED ?auto_23366 ) ( SUPPORTS ?auto_23366 ?auto_23365 ) ( not ( = ?auto_23360 ?auto_23365 ) ) ( not ( = ?auto_23358 ?auto_23365 ) ) ( HAVE_IMAGE ?auto_23356 ?auto_23357 ) ( not ( = ?auto_23356 ?auto_23359 ) ) ( not ( = ?auto_23356 ?auto_23361 ) ) ( not ( = ?auto_23356 ?auto_23362 ) ) ( not ( = ?auto_23356 ?auto_23364 ) ) ( not ( = ?auto_23357 ?auto_23358 ) ) ( not ( = ?auto_23357 ?auto_23360 ) ) ( not ( = ?auto_23357 ?auto_23365 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23361 ?auto_23360 ?auto_23359 ?auto_23358 )
      ( GET-3IMAGE-VERIFY ?auto_23356 ?auto_23357 ?auto_23359 ?auto_23358 ?auto_23361 ?auto_23360 ) )
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
      ?auto_23374 - DIRECTION
      ?auto_23376 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23377 ?auto_23375 ) ( SUPPORTS ?auto_23377 ?auto_23370 ) ( not ( = ?auto_23371 ?auto_23374 ) ) ( HAVE_IMAGE ?auto_23368 ?auto_23369 ) ( not ( = ?auto_23368 ?auto_23371 ) ) ( not ( = ?auto_23368 ?auto_23374 ) ) ( not ( = ?auto_23369 ?auto_23370 ) ) ( CALIBRATION_TARGET ?auto_23377 ?auto_23374 ) ( POINTING ?auto_23375 ?auto_23373 ) ( not ( = ?auto_23374 ?auto_23373 ) ) ( not ( = ?auto_23371 ?auto_23373 ) ) ( not ( = ?auto_23368 ?auto_23373 ) ) ( ON_BOARD ?auto_23376 ?auto_23375 ) ( POWER_ON ?auto_23376 ) ( not ( = ?auto_23377 ?auto_23376 ) ) ( CALIBRATED ?auto_23376 ) ( SUPPORTS ?auto_23376 ?auto_23372 ) ( not ( = ?auto_23369 ?auto_23372 ) ) ( not ( = ?auto_23370 ?auto_23372 ) ) )
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
      ?auto_23396 - DIRECTION
      ?auto_23398 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23399 ?auto_23397 ) ( SUPPORTS ?auto_23399 ?auto_23394 ) ( not ( = ?auto_23395 ?auto_23396 ) ) ( HAVE_IMAGE ?auto_23393 ?auto_23392 ) ( not ( = ?auto_23393 ?auto_23395 ) ) ( not ( = ?auto_23393 ?auto_23396 ) ) ( not ( = ?auto_23392 ?auto_23394 ) ) ( CALIBRATION_TARGET ?auto_23399 ?auto_23396 ) ( POINTING ?auto_23397 ?auto_23390 ) ( not ( = ?auto_23396 ?auto_23390 ) ) ( not ( = ?auto_23395 ?auto_23390 ) ) ( not ( = ?auto_23393 ?auto_23390 ) ) ( ON_BOARD ?auto_23398 ?auto_23397 ) ( POWER_ON ?auto_23398 ) ( not ( = ?auto_23399 ?auto_23398 ) ) ( CALIBRATED ?auto_23398 ) ( SUPPORTS ?auto_23398 ?auto_23391 ) ( not ( = ?auto_23392 ?auto_23391 ) ) ( not ( = ?auto_23394 ?auto_23391 ) ) )
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
      ?auto_23418 - DIRECTION
      ?auto_23420 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23421 ?auto_23419 ) ( SUPPORTS ?auto_23421 ?auto_23414 ) ( not ( = ?auto_23415 ?auto_23418 ) ) ( HAVE_IMAGE ?auto_23417 ?auto_23416 ) ( not ( = ?auto_23417 ?auto_23415 ) ) ( not ( = ?auto_23417 ?auto_23418 ) ) ( not ( = ?auto_23416 ?auto_23414 ) ) ( CALIBRATION_TARGET ?auto_23421 ?auto_23418 ) ( POINTING ?auto_23419 ?auto_23412 ) ( not ( = ?auto_23418 ?auto_23412 ) ) ( not ( = ?auto_23415 ?auto_23412 ) ) ( not ( = ?auto_23417 ?auto_23412 ) ) ( ON_BOARD ?auto_23420 ?auto_23419 ) ( POWER_ON ?auto_23420 ) ( not ( = ?auto_23421 ?auto_23420 ) ) ( CALIBRATED ?auto_23420 ) ( SUPPORTS ?auto_23420 ?auto_23413 ) ( not ( = ?auto_23416 ?auto_23413 ) ) ( not ( = ?auto_23414 ?auto_23413 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23417 ?auto_23416 ?auto_23415 ?auto_23414 )
      ( GET-3IMAGE-VERIFY ?auto_23412 ?auto_23413 ?auto_23415 ?auto_23414 ?auto_23417 ?auto_23416 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23446 - DIRECTION
      ?auto_23447 - MODE
      ?auto_23449 - DIRECTION
      ?auto_23448 - MODE
      ?auto_23451 - DIRECTION
      ?auto_23450 - MODE
    )
    :vars
    (
      ?auto_23457 - INSTRUMENT
      ?auto_23453 - SATELLITE
      ?auto_23452 - DIRECTION
      ?auto_23454 - DIRECTION
      ?auto_23456 - INSTRUMENT
      ?auto_23455 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_23457 ?auto_23453 ) ( SUPPORTS ?auto_23457 ?auto_23447 ) ( not ( = ?auto_23446 ?auto_23452 ) ) ( HAVE_IMAGE ?auto_23449 ?auto_23450 ) ( not ( = ?auto_23449 ?auto_23446 ) ) ( not ( = ?auto_23449 ?auto_23452 ) ) ( not ( = ?auto_23450 ?auto_23447 ) ) ( CALIBRATION_TARGET ?auto_23457 ?auto_23452 ) ( POINTING ?auto_23453 ?auto_23454 ) ( not ( = ?auto_23452 ?auto_23454 ) ) ( not ( = ?auto_23446 ?auto_23454 ) ) ( not ( = ?auto_23449 ?auto_23454 ) ) ( ON_BOARD ?auto_23456 ?auto_23453 ) ( POWER_ON ?auto_23456 ) ( not ( = ?auto_23457 ?auto_23456 ) ) ( CALIBRATED ?auto_23456 ) ( SUPPORTS ?auto_23456 ?auto_23455 ) ( not ( = ?auto_23450 ?auto_23455 ) ) ( not ( = ?auto_23447 ?auto_23455 ) ) ( HAVE_IMAGE ?auto_23449 ?auto_23448 ) ( HAVE_IMAGE ?auto_23451 ?auto_23450 ) ( not ( = ?auto_23446 ?auto_23451 ) ) ( not ( = ?auto_23447 ?auto_23448 ) ) ( not ( = ?auto_23449 ?auto_23451 ) ) ( not ( = ?auto_23448 ?auto_23450 ) ) ( not ( = ?auto_23448 ?auto_23455 ) ) ( not ( = ?auto_23451 ?auto_23452 ) ) ( not ( = ?auto_23451 ?auto_23454 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23449 ?auto_23450 ?auto_23446 ?auto_23447 )
      ( GET-3IMAGE-VERIFY ?auto_23446 ?auto_23447 ?auto_23449 ?auto_23448 ?auto_23451 ?auto_23450 ) )
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
      ?auto_23464 - DIRECTION
      ?auto_23466 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23467 ?auto_23465 ) ( SUPPORTS ?auto_23467 ?auto_23459 ) ( not ( = ?auto_23458 ?auto_23464 ) ) ( HAVE_IMAGE ?auto_23461 ?auto_23460 ) ( not ( = ?auto_23461 ?auto_23458 ) ) ( not ( = ?auto_23461 ?auto_23464 ) ) ( not ( = ?auto_23460 ?auto_23459 ) ) ( CALIBRATION_TARGET ?auto_23467 ?auto_23464 ) ( POINTING ?auto_23465 ?auto_23463 ) ( not ( = ?auto_23464 ?auto_23463 ) ) ( not ( = ?auto_23458 ?auto_23463 ) ) ( not ( = ?auto_23461 ?auto_23463 ) ) ( ON_BOARD ?auto_23466 ?auto_23465 ) ( POWER_ON ?auto_23466 ) ( not ( = ?auto_23467 ?auto_23466 ) ) ( CALIBRATED ?auto_23466 ) ( SUPPORTS ?auto_23466 ?auto_23462 ) ( not ( = ?auto_23460 ?auto_23462 ) ) ( not ( = ?auto_23459 ?auto_23462 ) ) )
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
      ?auto_23486 - DIRECTION
      ?auto_23488 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23489 ?auto_23487 ) ( SUPPORTS ?auto_23489 ?auto_23481 ) ( not ( = ?auto_23480 ?auto_23486 ) ) ( HAVE_IMAGE ?auto_23485 ?auto_23484 ) ( not ( = ?auto_23485 ?auto_23480 ) ) ( not ( = ?auto_23485 ?auto_23486 ) ) ( not ( = ?auto_23484 ?auto_23481 ) ) ( CALIBRATION_TARGET ?auto_23489 ?auto_23486 ) ( POINTING ?auto_23487 ?auto_23483 ) ( not ( = ?auto_23486 ?auto_23483 ) ) ( not ( = ?auto_23480 ?auto_23483 ) ) ( not ( = ?auto_23485 ?auto_23483 ) ) ( ON_BOARD ?auto_23488 ?auto_23487 ) ( POWER_ON ?auto_23488 ) ( not ( = ?auto_23489 ?auto_23488 ) ) ( CALIBRATED ?auto_23488 ) ( SUPPORTS ?auto_23488 ?auto_23482 ) ( not ( = ?auto_23484 ?auto_23482 ) ) ( not ( = ?auto_23481 ?auto_23482 ) ) )
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
      ?auto_23561 - INSTRUMENT
      ?auto_23557 - SATELLITE
      ?auto_23554 - DIRECTION
      ?auto_23556 - DIRECTION
      ?auto_23555 - MODE
      ?auto_23558 - DIRECTION
      ?auto_23560 - INSTRUMENT
      ?auto_23559 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_23561 ?auto_23557 ) ( SUPPORTS ?auto_23561 ?auto_23553 ) ( not ( = ?auto_23552 ?auto_23554 ) ) ( HAVE_IMAGE ?auto_23556 ?auto_23555 ) ( not ( = ?auto_23556 ?auto_23552 ) ) ( not ( = ?auto_23556 ?auto_23554 ) ) ( not ( = ?auto_23555 ?auto_23553 ) ) ( CALIBRATION_TARGET ?auto_23561 ?auto_23554 ) ( not ( = ?auto_23554 ?auto_23558 ) ) ( not ( = ?auto_23552 ?auto_23558 ) ) ( not ( = ?auto_23556 ?auto_23558 ) ) ( ON_BOARD ?auto_23560 ?auto_23557 ) ( POWER_ON ?auto_23560 ) ( not ( = ?auto_23561 ?auto_23560 ) ) ( CALIBRATED ?auto_23560 ) ( SUPPORTS ?auto_23560 ?auto_23559 ) ( not ( = ?auto_23555 ?auto_23559 ) ) ( not ( = ?auto_23553 ?auto_23559 ) ) ( POINTING ?auto_23557 ?auto_23554 ) )
    :subtasks
    ( ( !TURN_TO ?auto_23557 ?auto_23558 ?auto_23554 )
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
      ?auto_23567 - SATELLITE
      ?auto_23570 - DIRECTION
      ?auto_23569 - DIRECTION
      ?auto_23571 - INSTRUMENT
      ?auto_23568 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_23566 ?auto_23567 ) ( SUPPORTS ?auto_23566 ?auto_23564 ) ( not ( = ?auto_23565 ?auto_23570 ) ) ( HAVE_IMAGE ?auto_23562 ?auto_23563 ) ( not ( = ?auto_23562 ?auto_23565 ) ) ( not ( = ?auto_23562 ?auto_23570 ) ) ( not ( = ?auto_23563 ?auto_23564 ) ) ( CALIBRATION_TARGET ?auto_23566 ?auto_23570 ) ( not ( = ?auto_23570 ?auto_23569 ) ) ( not ( = ?auto_23565 ?auto_23569 ) ) ( not ( = ?auto_23562 ?auto_23569 ) ) ( ON_BOARD ?auto_23571 ?auto_23567 ) ( POWER_ON ?auto_23571 ) ( not ( = ?auto_23566 ?auto_23571 ) ) ( CALIBRATED ?auto_23571 ) ( SUPPORTS ?auto_23571 ?auto_23568 ) ( not ( = ?auto_23563 ?auto_23568 ) ) ( not ( = ?auto_23564 ?auto_23568 ) ) ( POINTING ?auto_23567 ?auto_23570 ) )
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
      ?auto_23577 - INSTRUMENT
      ?auto_23580 - SATELLITE
      ?auto_23578 - DIRECTION
      ?auto_23576 - DIRECTION
      ?auto_23581 - MODE
      ?auto_23579 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23577 ?auto_23580 ) ( SUPPORTS ?auto_23577 ?auto_23574 ) ( not ( = ?auto_23575 ?auto_23578 ) ) ( HAVE_IMAGE ?auto_23576 ?auto_23581 ) ( not ( = ?auto_23576 ?auto_23575 ) ) ( not ( = ?auto_23576 ?auto_23578 ) ) ( not ( = ?auto_23581 ?auto_23574 ) ) ( CALIBRATION_TARGET ?auto_23577 ?auto_23578 ) ( not ( = ?auto_23578 ?auto_23572 ) ) ( not ( = ?auto_23575 ?auto_23572 ) ) ( not ( = ?auto_23576 ?auto_23572 ) ) ( ON_BOARD ?auto_23579 ?auto_23580 ) ( POWER_ON ?auto_23579 ) ( not ( = ?auto_23577 ?auto_23579 ) ) ( CALIBRATED ?auto_23579 ) ( SUPPORTS ?auto_23579 ?auto_23573 ) ( not ( = ?auto_23581 ?auto_23573 ) ) ( not ( = ?auto_23574 ?auto_23573 ) ) ( POINTING ?auto_23580 ?auto_23578 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23576 ?auto_23581 ?auto_23575 ?auto_23574 )
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
      ?auto_23587 - INSTRUMENT
      ?auto_23590 - SATELLITE
      ?auto_23588 - DIRECTION
      ?auto_23586 - DIRECTION
      ?auto_23589 - INSTRUMENT
      ?auto_23591 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_23587 ?auto_23590 ) ( SUPPORTS ?auto_23587 ?auto_23583 ) ( not ( = ?auto_23582 ?auto_23588 ) ) ( HAVE_IMAGE ?auto_23585 ?auto_23584 ) ( not ( = ?auto_23585 ?auto_23582 ) ) ( not ( = ?auto_23585 ?auto_23588 ) ) ( not ( = ?auto_23584 ?auto_23583 ) ) ( CALIBRATION_TARGET ?auto_23587 ?auto_23588 ) ( not ( = ?auto_23588 ?auto_23586 ) ) ( not ( = ?auto_23582 ?auto_23586 ) ) ( not ( = ?auto_23585 ?auto_23586 ) ) ( ON_BOARD ?auto_23589 ?auto_23590 ) ( POWER_ON ?auto_23589 ) ( not ( = ?auto_23587 ?auto_23589 ) ) ( CALIBRATED ?auto_23589 ) ( SUPPORTS ?auto_23589 ?auto_23591 ) ( not ( = ?auto_23584 ?auto_23591 ) ) ( not ( = ?auto_23583 ?auto_23591 ) ) ( POINTING ?auto_23590 ?auto_23588 ) )
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
      ?auto_23597 - INSTRUMENT
      ?auto_23600 - SATELLITE
      ?auto_23598 - DIRECTION
      ?auto_23596 - DIRECTION
      ?auto_23601 - MODE
      ?auto_23599 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23597 ?auto_23600 ) ( SUPPORTS ?auto_23597 ?auto_23593 ) ( not ( = ?auto_23592 ?auto_23598 ) ) ( HAVE_IMAGE ?auto_23596 ?auto_23601 ) ( not ( = ?auto_23596 ?auto_23592 ) ) ( not ( = ?auto_23596 ?auto_23598 ) ) ( not ( = ?auto_23601 ?auto_23593 ) ) ( CALIBRATION_TARGET ?auto_23597 ?auto_23598 ) ( not ( = ?auto_23598 ?auto_23595 ) ) ( not ( = ?auto_23592 ?auto_23595 ) ) ( not ( = ?auto_23596 ?auto_23595 ) ) ( ON_BOARD ?auto_23599 ?auto_23600 ) ( POWER_ON ?auto_23599 ) ( not ( = ?auto_23597 ?auto_23599 ) ) ( CALIBRATED ?auto_23599 ) ( SUPPORTS ?auto_23599 ?auto_23594 ) ( not ( = ?auto_23601 ?auto_23594 ) ) ( not ( = ?auto_23593 ?auto_23594 ) ) ( POINTING ?auto_23600 ?auto_23598 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23596 ?auto_23601 ?auto_23592 ?auto_23593 )
      ( GET-2IMAGE-VERIFY ?auto_23592 ?auto_23593 ?auto_23595 ?auto_23594 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23614 - DIRECTION
      ?auto_23615 - MODE
      ?auto_23617 - DIRECTION
      ?auto_23616 - MODE
      ?auto_23619 - DIRECTION
      ?auto_23618 - MODE
    )
    :vars
    (
      ?auto_23621 - INSTRUMENT
      ?auto_23624 - SATELLITE
      ?auto_23622 - DIRECTION
      ?auto_23620 - DIRECTION
      ?auto_23623 - INSTRUMENT
      ?auto_23625 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_23621 ?auto_23624 ) ( SUPPORTS ?auto_23621 ?auto_23618 ) ( not ( = ?auto_23619 ?auto_23622 ) ) ( HAVE_IMAGE ?auto_23617 ?auto_23616 ) ( not ( = ?auto_23617 ?auto_23619 ) ) ( not ( = ?auto_23617 ?auto_23622 ) ) ( not ( = ?auto_23616 ?auto_23618 ) ) ( CALIBRATION_TARGET ?auto_23621 ?auto_23622 ) ( not ( = ?auto_23622 ?auto_23620 ) ) ( not ( = ?auto_23619 ?auto_23620 ) ) ( not ( = ?auto_23617 ?auto_23620 ) ) ( ON_BOARD ?auto_23623 ?auto_23624 ) ( POWER_ON ?auto_23623 ) ( not ( = ?auto_23621 ?auto_23623 ) ) ( CALIBRATED ?auto_23623 ) ( SUPPORTS ?auto_23623 ?auto_23625 ) ( not ( = ?auto_23616 ?auto_23625 ) ) ( not ( = ?auto_23618 ?auto_23625 ) ) ( POINTING ?auto_23624 ?auto_23622 ) ( HAVE_IMAGE ?auto_23614 ?auto_23615 ) ( not ( = ?auto_23614 ?auto_23617 ) ) ( not ( = ?auto_23614 ?auto_23619 ) ) ( not ( = ?auto_23614 ?auto_23622 ) ) ( not ( = ?auto_23614 ?auto_23620 ) ) ( not ( = ?auto_23615 ?auto_23616 ) ) ( not ( = ?auto_23615 ?auto_23618 ) ) ( not ( = ?auto_23615 ?auto_23625 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23617 ?auto_23616 ?auto_23619 ?auto_23618 )
      ( GET-3IMAGE-VERIFY ?auto_23614 ?auto_23615 ?auto_23617 ?auto_23616 ?auto_23619 ?auto_23618 ) )
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
      ?auto_23632 - INSTRUMENT
      ?auto_23635 - SATELLITE
      ?auto_23633 - DIRECTION
      ?auto_23634 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23632 ?auto_23635 ) ( SUPPORTS ?auto_23632 ?auto_23630 ) ( not ( = ?auto_23631 ?auto_23633 ) ) ( HAVE_IMAGE ?auto_23626 ?auto_23627 ) ( not ( = ?auto_23626 ?auto_23631 ) ) ( not ( = ?auto_23626 ?auto_23633 ) ) ( not ( = ?auto_23627 ?auto_23630 ) ) ( CALIBRATION_TARGET ?auto_23632 ?auto_23633 ) ( not ( = ?auto_23633 ?auto_23629 ) ) ( not ( = ?auto_23631 ?auto_23629 ) ) ( not ( = ?auto_23626 ?auto_23629 ) ) ( ON_BOARD ?auto_23634 ?auto_23635 ) ( POWER_ON ?auto_23634 ) ( not ( = ?auto_23632 ?auto_23634 ) ) ( CALIBRATED ?auto_23634 ) ( SUPPORTS ?auto_23634 ?auto_23628 ) ( not ( = ?auto_23627 ?auto_23628 ) ) ( not ( = ?auto_23630 ?auto_23628 ) ) ( POINTING ?auto_23635 ?auto_23633 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23626 ?auto_23627 ?auto_23631 ?auto_23630 )
      ( GET-3IMAGE-VERIFY ?auto_23626 ?auto_23627 ?auto_23629 ?auto_23628 ?auto_23631 ?auto_23630 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23636 - DIRECTION
      ?auto_23637 - MODE
      ?auto_23639 - DIRECTION
      ?auto_23638 - MODE
      ?auto_23641 - DIRECTION
      ?auto_23640 - MODE
    )
    :vars
    (
      ?auto_23643 - INSTRUMENT
      ?auto_23646 - SATELLITE
      ?auto_23644 - DIRECTION
      ?auto_23642 - DIRECTION
      ?auto_23645 - INSTRUMENT
      ?auto_23647 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_23643 ?auto_23646 ) ( SUPPORTS ?auto_23643 ?auto_23638 ) ( not ( = ?auto_23639 ?auto_23644 ) ) ( HAVE_IMAGE ?auto_23636 ?auto_23637 ) ( not ( = ?auto_23636 ?auto_23639 ) ) ( not ( = ?auto_23636 ?auto_23644 ) ) ( not ( = ?auto_23637 ?auto_23638 ) ) ( CALIBRATION_TARGET ?auto_23643 ?auto_23644 ) ( not ( = ?auto_23644 ?auto_23642 ) ) ( not ( = ?auto_23639 ?auto_23642 ) ) ( not ( = ?auto_23636 ?auto_23642 ) ) ( ON_BOARD ?auto_23645 ?auto_23646 ) ( POWER_ON ?auto_23645 ) ( not ( = ?auto_23643 ?auto_23645 ) ) ( CALIBRATED ?auto_23645 ) ( SUPPORTS ?auto_23645 ?auto_23647 ) ( not ( = ?auto_23637 ?auto_23647 ) ) ( not ( = ?auto_23638 ?auto_23647 ) ) ( POINTING ?auto_23646 ?auto_23644 ) ( HAVE_IMAGE ?auto_23641 ?auto_23640 ) ( not ( = ?auto_23636 ?auto_23641 ) ) ( not ( = ?auto_23637 ?auto_23640 ) ) ( not ( = ?auto_23639 ?auto_23641 ) ) ( not ( = ?auto_23638 ?auto_23640 ) ) ( not ( = ?auto_23641 ?auto_23644 ) ) ( not ( = ?auto_23641 ?auto_23642 ) ) ( not ( = ?auto_23640 ?auto_23647 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23636 ?auto_23637 ?auto_23639 ?auto_23638 )
      ( GET-3IMAGE-VERIFY ?auto_23636 ?auto_23637 ?auto_23639 ?auto_23638 ?auto_23641 ?auto_23640 ) )
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
      ?auto_23654 - INSTRUMENT
      ?auto_23657 - SATELLITE
      ?auto_23655 - DIRECTION
      ?auto_23656 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23654 ?auto_23657 ) ( SUPPORTS ?auto_23654 ?auto_23650 ) ( not ( = ?auto_23651 ?auto_23655 ) ) ( HAVE_IMAGE ?auto_23648 ?auto_23649 ) ( not ( = ?auto_23648 ?auto_23651 ) ) ( not ( = ?auto_23648 ?auto_23655 ) ) ( not ( = ?auto_23649 ?auto_23650 ) ) ( CALIBRATION_TARGET ?auto_23654 ?auto_23655 ) ( not ( = ?auto_23655 ?auto_23653 ) ) ( not ( = ?auto_23651 ?auto_23653 ) ) ( not ( = ?auto_23648 ?auto_23653 ) ) ( ON_BOARD ?auto_23656 ?auto_23657 ) ( POWER_ON ?auto_23656 ) ( not ( = ?auto_23654 ?auto_23656 ) ) ( CALIBRATED ?auto_23656 ) ( SUPPORTS ?auto_23656 ?auto_23652 ) ( not ( = ?auto_23649 ?auto_23652 ) ) ( not ( = ?auto_23650 ?auto_23652 ) ) ( POINTING ?auto_23657 ?auto_23655 ) )
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
      ?auto_23676 - INSTRUMENT
      ?auto_23679 - SATELLITE
      ?auto_23677 - DIRECTION
      ?auto_23678 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23676 ?auto_23679 ) ( SUPPORTS ?auto_23676 ?auto_23674 ) ( not ( = ?auto_23675 ?auto_23677 ) ) ( HAVE_IMAGE ?auto_23673 ?auto_23672 ) ( not ( = ?auto_23673 ?auto_23675 ) ) ( not ( = ?auto_23673 ?auto_23677 ) ) ( not ( = ?auto_23672 ?auto_23674 ) ) ( CALIBRATION_TARGET ?auto_23676 ?auto_23677 ) ( not ( = ?auto_23677 ?auto_23670 ) ) ( not ( = ?auto_23675 ?auto_23670 ) ) ( not ( = ?auto_23673 ?auto_23670 ) ) ( ON_BOARD ?auto_23678 ?auto_23679 ) ( POWER_ON ?auto_23678 ) ( not ( = ?auto_23676 ?auto_23678 ) ) ( CALIBRATED ?auto_23678 ) ( SUPPORTS ?auto_23678 ?auto_23671 ) ( not ( = ?auto_23672 ?auto_23671 ) ) ( not ( = ?auto_23674 ?auto_23671 ) ) ( POINTING ?auto_23679 ?auto_23677 ) )
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
      ?auto_23698 - INSTRUMENT
      ?auto_23701 - SATELLITE
      ?auto_23699 - DIRECTION
      ?auto_23700 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23698 ?auto_23701 ) ( SUPPORTS ?auto_23698 ?auto_23694 ) ( not ( = ?auto_23695 ?auto_23699 ) ) ( HAVE_IMAGE ?auto_23697 ?auto_23696 ) ( not ( = ?auto_23697 ?auto_23695 ) ) ( not ( = ?auto_23697 ?auto_23699 ) ) ( not ( = ?auto_23696 ?auto_23694 ) ) ( CALIBRATION_TARGET ?auto_23698 ?auto_23699 ) ( not ( = ?auto_23699 ?auto_23692 ) ) ( not ( = ?auto_23695 ?auto_23692 ) ) ( not ( = ?auto_23697 ?auto_23692 ) ) ( ON_BOARD ?auto_23700 ?auto_23701 ) ( POWER_ON ?auto_23700 ) ( not ( = ?auto_23698 ?auto_23700 ) ) ( CALIBRATED ?auto_23700 ) ( SUPPORTS ?auto_23700 ?auto_23693 ) ( not ( = ?auto_23696 ?auto_23693 ) ) ( not ( = ?auto_23694 ?auto_23693 ) ) ( POINTING ?auto_23701 ?auto_23699 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23697 ?auto_23696 ?auto_23695 ?auto_23694 )
      ( GET-3IMAGE-VERIFY ?auto_23692 ?auto_23693 ?auto_23695 ?auto_23694 ?auto_23697 ?auto_23696 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23726 - DIRECTION
      ?auto_23727 - MODE
      ?auto_23729 - DIRECTION
      ?auto_23728 - MODE
      ?auto_23731 - DIRECTION
      ?auto_23730 - MODE
    )
    :vars
    (
      ?auto_23733 - INSTRUMENT
      ?auto_23736 - SATELLITE
      ?auto_23734 - DIRECTION
      ?auto_23732 - DIRECTION
      ?auto_23735 - INSTRUMENT
      ?auto_23737 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_23733 ?auto_23736 ) ( SUPPORTS ?auto_23733 ?auto_23727 ) ( not ( = ?auto_23726 ?auto_23734 ) ) ( HAVE_IMAGE ?auto_23729 ?auto_23730 ) ( not ( = ?auto_23729 ?auto_23726 ) ) ( not ( = ?auto_23729 ?auto_23734 ) ) ( not ( = ?auto_23730 ?auto_23727 ) ) ( CALIBRATION_TARGET ?auto_23733 ?auto_23734 ) ( not ( = ?auto_23734 ?auto_23732 ) ) ( not ( = ?auto_23726 ?auto_23732 ) ) ( not ( = ?auto_23729 ?auto_23732 ) ) ( ON_BOARD ?auto_23735 ?auto_23736 ) ( POWER_ON ?auto_23735 ) ( not ( = ?auto_23733 ?auto_23735 ) ) ( CALIBRATED ?auto_23735 ) ( SUPPORTS ?auto_23735 ?auto_23737 ) ( not ( = ?auto_23730 ?auto_23737 ) ) ( not ( = ?auto_23727 ?auto_23737 ) ) ( POINTING ?auto_23736 ?auto_23734 ) ( HAVE_IMAGE ?auto_23729 ?auto_23728 ) ( HAVE_IMAGE ?auto_23731 ?auto_23730 ) ( not ( = ?auto_23726 ?auto_23731 ) ) ( not ( = ?auto_23727 ?auto_23728 ) ) ( not ( = ?auto_23729 ?auto_23731 ) ) ( not ( = ?auto_23728 ?auto_23730 ) ) ( not ( = ?auto_23728 ?auto_23737 ) ) ( not ( = ?auto_23731 ?auto_23734 ) ) ( not ( = ?auto_23731 ?auto_23732 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23729 ?auto_23730 ?auto_23726 ?auto_23727 )
      ( GET-3IMAGE-VERIFY ?auto_23726 ?auto_23727 ?auto_23729 ?auto_23728 ?auto_23731 ?auto_23730 ) )
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
      ?auto_23744 - INSTRUMENT
      ?auto_23747 - SATELLITE
      ?auto_23745 - DIRECTION
      ?auto_23746 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23744 ?auto_23747 ) ( SUPPORTS ?auto_23744 ?auto_23739 ) ( not ( = ?auto_23738 ?auto_23745 ) ) ( HAVE_IMAGE ?auto_23741 ?auto_23740 ) ( not ( = ?auto_23741 ?auto_23738 ) ) ( not ( = ?auto_23741 ?auto_23745 ) ) ( not ( = ?auto_23740 ?auto_23739 ) ) ( CALIBRATION_TARGET ?auto_23744 ?auto_23745 ) ( not ( = ?auto_23745 ?auto_23743 ) ) ( not ( = ?auto_23738 ?auto_23743 ) ) ( not ( = ?auto_23741 ?auto_23743 ) ) ( ON_BOARD ?auto_23746 ?auto_23747 ) ( POWER_ON ?auto_23746 ) ( not ( = ?auto_23744 ?auto_23746 ) ) ( CALIBRATED ?auto_23746 ) ( SUPPORTS ?auto_23746 ?auto_23742 ) ( not ( = ?auto_23740 ?auto_23742 ) ) ( not ( = ?auto_23739 ?auto_23742 ) ) ( POINTING ?auto_23747 ?auto_23745 ) )
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
      ?auto_23766 - INSTRUMENT
      ?auto_23769 - SATELLITE
      ?auto_23767 - DIRECTION
      ?auto_23768 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23766 ?auto_23769 ) ( SUPPORTS ?auto_23766 ?auto_23761 ) ( not ( = ?auto_23760 ?auto_23767 ) ) ( HAVE_IMAGE ?auto_23765 ?auto_23764 ) ( not ( = ?auto_23765 ?auto_23760 ) ) ( not ( = ?auto_23765 ?auto_23767 ) ) ( not ( = ?auto_23764 ?auto_23761 ) ) ( CALIBRATION_TARGET ?auto_23766 ?auto_23767 ) ( not ( = ?auto_23767 ?auto_23763 ) ) ( not ( = ?auto_23760 ?auto_23763 ) ) ( not ( = ?auto_23765 ?auto_23763 ) ) ( ON_BOARD ?auto_23768 ?auto_23769 ) ( POWER_ON ?auto_23768 ) ( not ( = ?auto_23766 ?auto_23768 ) ) ( CALIBRATED ?auto_23768 ) ( SUPPORTS ?auto_23768 ?auto_23762 ) ( not ( = ?auto_23764 ?auto_23762 ) ) ( not ( = ?auto_23761 ?auto_23762 ) ) ( POINTING ?auto_23769 ?auto_23767 ) )
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
      ?auto_23836 - INSTRUMENT
      ?auto_23839 - SATELLITE
      ?auto_23837 - DIRECTION
      ?auto_23834 - DIRECTION
      ?auto_23841 - MODE
      ?auto_23835 - DIRECTION
      ?auto_23838 - INSTRUMENT
      ?auto_23840 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_23836 ?auto_23839 ) ( SUPPORTS ?auto_23836 ?auto_23833 ) ( not ( = ?auto_23832 ?auto_23837 ) ) ( HAVE_IMAGE ?auto_23834 ?auto_23841 ) ( not ( = ?auto_23834 ?auto_23832 ) ) ( not ( = ?auto_23834 ?auto_23837 ) ) ( not ( = ?auto_23841 ?auto_23833 ) ) ( CALIBRATION_TARGET ?auto_23836 ?auto_23837 ) ( not ( = ?auto_23837 ?auto_23835 ) ) ( not ( = ?auto_23832 ?auto_23835 ) ) ( not ( = ?auto_23834 ?auto_23835 ) ) ( ON_BOARD ?auto_23838 ?auto_23839 ) ( POWER_ON ?auto_23838 ) ( not ( = ?auto_23836 ?auto_23838 ) ) ( SUPPORTS ?auto_23838 ?auto_23840 ) ( not ( = ?auto_23841 ?auto_23840 ) ) ( not ( = ?auto_23833 ?auto_23840 ) ) ( POINTING ?auto_23839 ?auto_23837 ) ( CALIBRATION_TARGET ?auto_23838 ?auto_23837 ) ( NOT_CALIBRATED ?auto_23838 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_23839 ?auto_23838 ?auto_23837 )
      ( GET-2IMAGE ?auto_23834 ?auto_23841 ?auto_23832 ?auto_23833 )
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
      ?auto_23850 - INSTRUMENT
      ?auto_23848 - SATELLITE
      ?auto_23846 - DIRECTION
      ?auto_23851 - DIRECTION
      ?auto_23849 - INSTRUMENT
      ?auto_23847 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_23850 ?auto_23848 ) ( SUPPORTS ?auto_23850 ?auto_23844 ) ( not ( = ?auto_23845 ?auto_23846 ) ) ( HAVE_IMAGE ?auto_23842 ?auto_23843 ) ( not ( = ?auto_23842 ?auto_23845 ) ) ( not ( = ?auto_23842 ?auto_23846 ) ) ( not ( = ?auto_23843 ?auto_23844 ) ) ( CALIBRATION_TARGET ?auto_23850 ?auto_23846 ) ( not ( = ?auto_23846 ?auto_23851 ) ) ( not ( = ?auto_23845 ?auto_23851 ) ) ( not ( = ?auto_23842 ?auto_23851 ) ) ( ON_BOARD ?auto_23849 ?auto_23848 ) ( POWER_ON ?auto_23849 ) ( not ( = ?auto_23850 ?auto_23849 ) ) ( SUPPORTS ?auto_23849 ?auto_23847 ) ( not ( = ?auto_23843 ?auto_23847 ) ) ( not ( = ?auto_23844 ?auto_23847 ) ) ( POINTING ?auto_23848 ?auto_23846 ) ( CALIBRATION_TARGET ?auto_23849 ?auto_23846 ) ( NOT_CALIBRATED ?auto_23849 ) )
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
      ?auto_23858 - INSTRUMENT
      ?auto_23857 - SATELLITE
      ?auto_23859 - DIRECTION
      ?auto_23856 - DIRECTION
      ?auto_23861 - MODE
      ?auto_23860 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23858 ?auto_23857 ) ( SUPPORTS ?auto_23858 ?auto_23854 ) ( not ( = ?auto_23855 ?auto_23859 ) ) ( HAVE_IMAGE ?auto_23856 ?auto_23861 ) ( not ( = ?auto_23856 ?auto_23855 ) ) ( not ( = ?auto_23856 ?auto_23859 ) ) ( not ( = ?auto_23861 ?auto_23854 ) ) ( CALIBRATION_TARGET ?auto_23858 ?auto_23859 ) ( not ( = ?auto_23859 ?auto_23852 ) ) ( not ( = ?auto_23855 ?auto_23852 ) ) ( not ( = ?auto_23856 ?auto_23852 ) ) ( ON_BOARD ?auto_23860 ?auto_23857 ) ( POWER_ON ?auto_23860 ) ( not ( = ?auto_23858 ?auto_23860 ) ) ( SUPPORTS ?auto_23860 ?auto_23853 ) ( not ( = ?auto_23861 ?auto_23853 ) ) ( not ( = ?auto_23854 ?auto_23853 ) ) ( POINTING ?auto_23857 ?auto_23859 ) ( CALIBRATION_TARGET ?auto_23860 ?auto_23859 ) ( NOT_CALIBRATED ?auto_23860 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23856 ?auto_23861 ?auto_23855 ?auto_23854 )
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
      ?auto_23868 - INSTRUMENT
      ?auto_23866 - SATELLITE
      ?auto_23870 - DIRECTION
      ?auto_23869 - DIRECTION
      ?auto_23871 - INSTRUMENT
      ?auto_23867 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_23868 ?auto_23866 ) ( SUPPORTS ?auto_23868 ?auto_23863 ) ( not ( = ?auto_23862 ?auto_23870 ) ) ( HAVE_IMAGE ?auto_23865 ?auto_23864 ) ( not ( = ?auto_23865 ?auto_23862 ) ) ( not ( = ?auto_23865 ?auto_23870 ) ) ( not ( = ?auto_23864 ?auto_23863 ) ) ( CALIBRATION_TARGET ?auto_23868 ?auto_23870 ) ( not ( = ?auto_23870 ?auto_23869 ) ) ( not ( = ?auto_23862 ?auto_23869 ) ) ( not ( = ?auto_23865 ?auto_23869 ) ) ( ON_BOARD ?auto_23871 ?auto_23866 ) ( POWER_ON ?auto_23871 ) ( not ( = ?auto_23868 ?auto_23871 ) ) ( SUPPORTS ?auto_23871 ?auto_23867 ) ( not ( = ?auto_23864 ?auto_23867 ) ) ( not ( = ?auto_23863 ?auto_23867 ) ) ( POINTING ?auto_23866 ?auto_23870 ) ( CALIBRATION_TARGET ?auto_23871 ?auto_23870 ) ( NOT_CALIBRATED ?auto_23871 ) )
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
      ?auto_23878 - INSTRUMENT
      ?auto_23877 - SATELLITE
      ?auto_23879 - DIRECTION
      ?auto_23876 - DIRECTION
      ?auto_23881 - MODE
      ?auto_23880 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23878 ?auto_23877 ) ( SUPPORTS ?auto_23878 ?auto_23873 ) ( not ( = ?auto_23872 ?auto_23879 ) ) ( HAVE_IMAGE ?auto_23876 ?auto_23881 ) ( not ( = ?auto_23876 ?auto_23872 ) ) ( not ( = ?auto_23876 ?auto_23879 ) ) ( not ( = ?auto_23881 ?auto_23873 ) ) ( CALIBRATION_TARGET ?auto_23878 ?auto_23879 ) ( not ( = ?auto_23879 ?auto_23875 ) ) ( not ( = ?auto_23872 ?auto_23875 ) ) ( not ( = ?auto_23876 ?auto_23875 ) ) ( ON_BOARD ?auto_23880 ?auto_23877 ) ( POWER_ON ?auto_23880 ) ( not ( = ?auto_23878 ?auto_23880 ) ) ( SUPPORTS ?auto_23880 ?auto_23874 ) ( not ( = ?auto_23881 ?auto_23874 ) ) ( not ( = ?auto_23873 ?auto_23874 ) ) ( POINTING ?auto_23877 ?auto_23879 ) ( CALIBRATION_TARGET ?auto_23880 ?auto_23879 ) ( NOT_CALIBRATED ?auto_23880 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23876 ?auto_23881 ?auto_23872 ?auto_23873 )
      ( GET-2IMAGE-VERIFY ?auto_23872 ?auto_23873 ?auto_23875 ?auto_23874 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23894 - DIRECTION
      ?auto_23895 - MODE
      ?auto_23897 - DIRECTION
      ?auto_23896 - MODE
      ?auto_23899 - DIRECTION
      ?auto_23898 - MODE
    )
    :vars
    (
      ?auto_23902 - INSTRUMENT
      ?auto_23900 - SATELLITE
      ?auto_23904 - DIRECTION
      ?auto_23903 - DIRECTION
      ?auto_23905 - INSTRUMENT
      ?auto_23901 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_23902 ?auto_23900 ) ( SUPPORTS ?auto_23902 ?auto_23898 ) ( not ( = ?auto_23899 ?auto_23904 ) ) ( HAVE_IMAGE ?auto_23894 ?auto_23896 ) ( not ( = ?auto_23894 ?auto_23899 ) ) ( not ( = ?auto_23894 ?auto_23904 ) ) ( not ( = ?auto_23896 ?auto_23898 ) ) ( CALIBRATION_TARGET ?auto_23902 ?auto_23904 ) ( not ( = ?auto_23904 ?auto_23903 ) ) ( not ( = ?auto_23899 ?auto_23903 ) ) ( not ( = ?auto_23894 ?auto_23903 ) ) ( ON_BOARD ?auto_23905 ?auto_23900 ) ( POWER_ON ?auto_23905 ) ( not ( = ?auto_23902 ?auto_23905 ) ) ( SUPPORTS ?auto_23905 ?auto_23901 ) ( not ( = ?auto_23896 ?auto_23901 ) ) ( not ( = ?auto_23898 ?auto_23901 ) ) ( POINTING ?auto_23900 ?auto_23904 ) ( CALIBRATION_TARGET ?auto_23905 ?auto_23904 ) ( NOT_CALIBRATED ?auto_23905 ) ( HAVE_IMAGE ?auto_23894 ?auto_23895 ) ( HAVE_IMAGE ?auto_23897 ?auto_23896 ) ( not ( = ?auto_23894 ?auto_23897 ) ) ( not ( = ?auto_23895 ?auto_23896 ) ) ( not ( = ?auto_23895 ?auto_23898 ) ) ( not ( = ?auto_23895 ?auto_23901 ) ) ( not ( = ?auto_23897 ?auto_23899 ) ) ( not ( = ?auto_23897 ?auto_23904 ) ) ( not ( = ?auto_23897 ?auto_23903 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23894 ?auto_23896 ?auto_23899 ?auto_23898 )
      ( GET-3IMAGE-VERIFY ?auto_23894 ?auto_23895 ?auto_23897 ?auto_23896 ?auto_23899 ?auto_23898 ) )
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
      ?auto_23912 - SATELLITE
      ?auto_23914 - DIRECTION
      ?auto_23915 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23913 ?auto_23912 ) ( SUPPORTS ?auto_23913 ?auto_23910 ) ( not ( = ?auto_23911 ?auto_23914 ) ) ( HAVE_IMAGE ?auto_23906 ?auto_23907 ) ( not ( = ?auto_23906 ?auto_23911 ) ) ( not ( = ?auto_23906 ?auto_23914 ) ) ( not ( = ?auto_23907 ?auto_23910 ) ) ( CALIBRATION_TARGET ?auto_23913 ?auto_23914 ) ( not ( = ?auto_23914 ?auto_23909 ) ) ( not ( = ?auto_23911 ?auto_23909 ) ) ( not ( = ?auto_23906 ?auto_23909 ) ) ( ON_BOARD ?auto_23915 ?auto_23912 ) ( POWER_ON ?auto_23915 ) ( not ( = ?auto_23913 ?auto_23915 ) ) ( SUPPORTS ?auto_23915 ?auto_23908 ) ( not ( = ?auto_23907 ?auto_23908 ) ) ( not ( = ?auto_23910 ?auto_23908 ) ) ( POINTING ?auto_23912 ?auto_23914 ) ( CALIBRATION_TARGET ?auto_23915 ?auto_23914 ) ( NOT_CALIBRATED ?auto_23915 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23906 ?auto_23907 ?auto_23911 ?auto_23910 )
      ( GET-3IMAGE-VERIFY ?auto_23906 ?auto_23907 ?auto_23909 ?auto_23908 ?auto_23911 ?auto_23910 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_23916 - DIRECTION
      ?auto_23917 - MODE
      ?auto_23919 - DIRECTION
      ?auto_23918 - MODE
      ?auto_23921 - DIRECTION
      ?auto_23920 - MODE
    )
    :vars
    (
      ?auto_23924 - INSTRUMENT
      ?auto_23922 - SATELLITE
      ?auto_23926 - DIRECTION
      ?auto_23925 - DIRECTION
      ?auto_23927 - INSTRUMENT
      ?auto_23923 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_23924 ?auto_23922 ) ( SUPPORTS ?auto_23924 ?auto_23918 ) ( not ( = ?auto_23919 ?auto_23926 ) ) ( HAVE_IMAGE ?auto_23916 ?auto_23917 ) ( not ( = ?auto_23916 ?auto_23919 ) ) ( not ( = ?auto_23916 ?auto_23926 ) ) ( not ( = ?auto_23917 ?auto_23918 ) ) ( CALIBRATION_TARGET ?auto_23924 ?auto_23926 ) ( not ( = ?auto_23926 ?auto_23925 ) ) ( not ( = ?auto_23919 ?auto_23925 ) ) ( not ( = ?auto_23916 ?auto_23925 ) ) ( ON_BOARD ?auto_23927 ?auto_23922 ) ( POWER_ON ?auto_23927 ) ( not ( = ?auto_23924 ?auto_23927 ) ) ( SUPPORTS ?auto_23927 ?auto_23923 ) ( not ( = ?auto_23917 ?auto_23923 ) ) ( not ( = ?auto_23918 ?auto_23923 ) ) ( POINTING ?auto_23922 ?auto_23926 ) ( CALIBRATION_TARGET ?auto_23927 ?auto_23926 ) ( NOT_CALIBRATED ?auto_23927 ) ( HAVE_IMAGE ?auto_23921 ?auto_23920 ) ( not ( = ?auto_23916 ?auto_23921 ) ) ( not ( = ?auto_23917 ?auto_23920 ) ) ( not ( = ?auto_23919 ?auto_23921 ) ) ( not ( = ?auto_23918 ?auto_23920 ) ) ( not ( = ?auto_23921 ?auto_23926 ) ) ( not ( = ?auto_23921 ?auto_23925 ) ) ( not ( = ?auto_23920 ?auto_23923 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23916 ?auto_23917 ?auto_23919 ?auto_23918 )
      ( GET-3IMAGE-VERIFY ?auto_23916 ?auto_23917 ?auto_23919 ?auto_23918 ?auto_23921 ?auto_23920 ) )
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
      ?auto_23934 - SATELLITE
      ?auto_23936 - DIRECTION
      ?auto_23937 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23935 ?auto_23934 ) ( SUPPORTS ?auto_23935 ?auto_23930 ) ( not ( = ?auto_23931 ?auto_23936 ) ) ( HAVE_IMAGE ?auto_23928 ?auto_23929 ) ( not ( = ?auto_23928 ?auto_23931 ) ) ( not ( = ?auto_23928 ?auto_23936 ) ) ( not ( = ?auto_23929 ?auto_23930 ) ) ( CALIBRATION_TARGET ?auto_23935 ?auto_23936 ) ( not ( = ?auto_23936 ?auto_23933 ) ) ( not ( = ?auto_23931 ?auto_23933 ) ) ( not ( = ?auto_23928 ?auto_23933 ) ) ( ON_BOARD ?auto_23937 ?auto_23934 ) ( POWER_ON ?auto_23937 ) ( not ( = ?auto_23935 ?auto_23937 ) ) ( SUPPORTS ?auto_23937 ?auto_23932 ) ( not ( = ?auto_23929 ?auto_23932 ) ) ( not ( = ?auto_23930 ?auto_23932 ) ) ( POINTING ?auto_23934 ?auto_23936 ) ( CALIBRATION_TARGET ?auto_23937 ?auto_23936 ) ( NOT_CALIBRATED ?auto_23937 ) )
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
      ?auto_23956 - SATELLITE
      ?auto_23958 - DIRECTION
      ?auto_23959 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23957 ?auto_23956 ) ( SUPPORTS ?auto_23957 ?auto_23954 ) ( not ( = ?auto_23955 ?auto_23958 ) ) ( HAVE_IMAGE ?auto_23953 ?auto_23952 ) ( not ( = ?auto_23953 ?auto_23955 ) ) ( not ( = ?auto_23953 ?auto_23958 ) ) ( not ( = ?auto_23952 ?auto_23954 ) ) ( CALIBRATION_TARGET ?auto_23957 ?auto_23958 ) ( not ( = ?auto_23958 ?auto_23950 ) ) ( not ( = ?auto_23955 ?auto_23950 ) ) ( not ( = ?auto_23953 ?auto_23950 ) ) ( ON_BOARD ?auto_23959 ?auto_23956 ) ( POWER_ON ?auto_23959 ) ( not ( = ?auto_23957 ?auto_23959 ) ) ( SUPPORTS ?auto_23959 ?auto_23951 ) ( not ( = ?auto_23952 ?auto_23951 ) ) ( not ( = ?auto_23954 ?auto_23951 ) ) ( POINTING ?auto_23956 ?auto_23958 ) ( CALIBRATION_TARGET ?auto_23959 ?auto_23958 ) ( NOT_CALIBRATED ?auto_23959 ) )
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
      ?auto_23978 - SATELLITE
      ?auto_23980 - DIRECTION
      ?auto_23981 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_23979 ?auto_23978 ) ( SUPPORTS ?auto_23979 ?auto_23974 ) ( not ( = ?auto_23975 ?auto_23980 ) ) ( HAVE_IMAGE ?auto_23977 ?auto_23976 ) ( not ( = ?auto_23977 ?auto_23975 ) ) ( not ( = ?auto_23977 ?auto_23980 ) ) ( not ( = ?auto_23976 ?auto_23974 ) ) ( CALIBRATION_TARGET ?auto_23979 ?auto_23980 ) ( not ( = ?auto_23980 ?auto_23972 ) ) ( not ( = ?auto_23975 ?auto_23972 ) ) ( not ( = ?auto_23977 ?auto_23972 ) ) ( ON_BOARD ?auto_23981 ?auto_23978 ) ( POWER_ON ?auto_23981 ) ( not ( = ?auto_23979 ?auto_23981 ) ) ( SUPPORTS ?auto_23981 ?auto_23973 ) ( not ( = ?auto_23976 ?auto_23973 ) ) ( not ( = ?auto_23974 ?auto_23973 ) ) ( POINTING ?auto_23978 ?auto_23980 ) ( CALIBRATION_TARGET ?auto_23981 ?auto_23980 ) ( NOT_CALIBRATED ?auto_23981 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_23977 ?auto_23976 ?auto_23975 ?auto_23974 )
      ( GET-3IMAGE-VERIFY ?auto_23972 ?auto_23973 ?auto_23975 ?auto_23974 ?auto_23977 ?auto_23976 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24006 - DIRECTION
      ?auto_24007 - MODE
      ?auto_24009 - DIRECTION
      ?auto_24008 - MODE
      ?auto_24011 - DIRECTION
      ?auto_24010 - MODE
    )
    :vars
    (
      ?auto_24014 - INSTRUMENT
      ?auto_24012 - SATELLITE
      ?auto_24016 - DIRECTION
      ?auto_24015 - DIRECTION
      ?auto_24017 - INSTRUMENT
      ?auto_24013 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_24014 ?auto_24012 ) ( SUPPORTS ?auto_24014 ?auto_24007 ) ( not ( = ?auto_24006 ?auto_24016 ) ) ( HAVE_IMAGE ?auto_24009 ?auto_24010 ) ( not ( = ?auto_24009 ?auto_24006 ) ) ( not ( = ?auto_24009 ?auto_24016 ) ) ( not ( = ?auto_24010 ?auto_24007 ) ) ( CALIBRATION_TARGET ?auto_24014 ?auto_24016 ) ( not ( = ?auto_24016 ?auto_24015 ) ) ( not ( = ?auto_24006 ?auto_24015 ) ) ( not ( = ?auto_24009 ?auto_24015 ) ) ( ON_BOARD ?auto_24017 ?auto_24012 ) ( POWER_ON ?auto_24017 ) ( not ( = ?auto_24014 ?auto_24017 ) ) ( SUPPORTS ?auto_24017 ?auto_24013 ) ( not ( = ?auto_24010 ?auto_24013 ) ) ( not ( = ?auto_24007 ?auto_24013 ) ) ( POINTING ?auto_24012 ?auto_24016 ) ( CALIBRATION_TARGET ?auto_24017 ?auto_24016 ) ( NOT_CALIBRATED ?auto_24017 ) ( HAVE_IMAGE ?auto_24009 ?auto_24008 ) ( HAVE_IMAGE ?auto_24011 ?auto_24010 ) ( not ( = ?auto_24006 ?auto_24011 ) ) ( not ( = ?auto_24007 ?auto_24008 ) ) ( not ( = ?auto_24009 ?auto_24011 ) ) ( not ( = ?auto_24008 ?auto_24010 ) ) ( not ( = ?auto_24008 ?auto_24013 ) ) ( not ( = ?auto_24011 ?auto_24016 ) ) ( not ( = ?auto_24011 ?auto_24015 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24009 ?auto_24010 ?auto_24006 ?auto_24007 )
      ( GET-3IMAGE-VERIFY ?auto_24006 ?auto_24007 ?auto_24009 ?auto_24008 ?auto_24011 ?auto_24010 ) )
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
      ?auto_24024 - SATELLITE
      ?auto_24026 - DIRECTION
      ?auto_24027 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24025 ?auto_24024 ) ( SUPPORTS ?auto_24025 ?auto_24019 ) ( not ( = ?auto_24018 ?auto_24026 ) ) ( HAVE_IMAGE ?auto_24021 ?auto_24020 ) ( not ( = ?auto_24021 ?auto_24018 ) ) ( not ( = ?auto_24021 ?auto_24026 ) ) ( not ( = ?auto_24020 ?auto_24019 ) ) ( CALIBRATION_TARGET ?auto_24025 ?auto_24026 ) ( not ( = ?auto_24026 ?auto_24023 ) ) ( not ( = ?auto_24018 ?auto_24023 ) ) ( not ( = ?auto_24021 ?auto_24023 ) ) ( ON_BOARD ?auto_24027 ?auto_24024 ) ( POWER_ON ?auto_24027 ) ( not ( = ?auto_24025 ?auto_24027 ) ) ( SUPPORTS ?auto_24027 ?auto_24022 ) ( not ( = ?auto_24020 ?auto_24022 ) ) ( not ( = ?auto_24019 ?auto_24022 ) ) ( POINTING ?auto_24024 ?auto_24026 ) ( CALIBRATION_TARGET ?auto_24027 ?auto_24026 ) ( NOT_CALIBRATED ?auto_24027 ) )
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
      ?auto_24046 - SATELLITE
      ?auto_24048 - DIRECTION
      ?auto_24049 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24047 ?auto_24046 ) ( SUPPORTS ?auto_24047 ?auto_24041 ) ( not ( = ?auto_24040 ?auto_24048 ) ) ( HAVE_IMAGE ?auto_24045 ?auto_24044 ) ( not ( = ?auto_24045 ?auto_24040 ) ) ( not ( = ?auto_24045 ?auto_24048 ) ) ( not ( = ?auto_24044 ?auto_24041 ) ) ( CALIBRATION_TARGET ?auto_24047 ?auto_24048 ) ( not ( = ?auto_24048 ?auto_24043 ) ) ( not ( = ?auto_24040 ?auto_24043 ) ) ( not ( = ?auto_24045 ?auto_24043 ) ) ( ON_BOARD ?auto_24049 ?auto_24046 ) ( POWER_ON ?auto_24049 ) ( not ( = ?auto_24047 ?auto_24049 ) ) ( SUPPORTS ?auto_24049 ?auto_24042 ) ( not ( = ?auto_24044 ?auto_24042 ) ) ( not ( = ?auto_24041 ?auto_24042 ) ) ( POINTING ?auto_24046 ?auto_24048 ) ( CALIBRATION_TARGET ?auto_24049 ?auto_24048 ) ( NOT_CALIBRATED ?auto_24049 ) )
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
      ?auto_24117 - INSTRUMENT
      ?auto_24115 - SATELLITE
      ?auto_24119 - DIRECTION
      ?auto_24114 - DIRECTION
      ?auto_24121 - MODE
      ?auto_24118 - DIRECTION
      ?auto_24120 - INSTRUMENT
      ?auto_24116 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_24117 ?auto_24115 ) ( SUPPORTS ?auto_24117 ?auto_24113 ) ( not ( = ?auto_24112 ?auto_24119 ) ) ( HAVE_IMAGE ?auto_24114 ?auto_24121 ) ( not ( = ?auto_24114 ?auto_24112 ) ) ( not ( = ?auto_24114 ?auto_24119 ) ) ( not ( = ?auto_24121 ?auto_24113 ) ) ( CALIBRATION_TARGET ?auto_24117 ?auto_24119 ) ( not ( = ?auto_24119 ?auto_24118 ) ) ( not ( = ?auto_24112 ?auto_24118 ) ) ( not ( = ?auto_24114 ?auto_24118 ) ) ( ON_BOARD ?auto_24120 ?auto_24115 ) ( not ( = ?auto_24117 ?auto_24120 ) ) ( SUPPORTS ?auto_24120 ?auto_24116 ) ( not ( = ?auto_24121 ?auto_24116 ) ) ( not ( = ?auto_24113 ?auto_24116 ) ) ( POINTING ?auto_24115 ?auto_24119 ) ( CALIBRATION_TARGET ?auto_24120 ?auto_24119 ) ( POWER_AVAIL ?auto_24115 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_24120 ?auto_24115 )
      ( GET-2IMAGE ?auto_24114 ?auto_24121 ?auto_24112 ?auto_24113 )
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
      ?auto_24129 - INSTRUMENT
      ?auto_24128 - SATELLITE
      ?auto_24127 - DIRECTION
      ?auto_24126 - DIRECTION
      ?auto_24130 - INSTRUMENT
      ?auto_24131 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_24129 ?auto_24128 ) ( SUPPORTS ?auto_24129 ?auto_24124 ) ( not ( = ?auto_24125 ?auto_24127 ) ) ( HAVE_IMAGE ?auto_24122 ?auto_24123 ) ( not ( = ?auto_24122 ?auto_24125 ) ) ( not ( = ?auto_24122 ?auto_24127 ) ) ( not ( = ?auto_24123 ?auto_24124 ) ) ( CALIBRATION_TARGET ?auto_24129 ?auto_24127 ) ( not ( = ?auto_24127 ?auto_24126 ) ) ( not ( = ?auto_24125 ?auto_24126 ) ) ( not ( = ?auto_24122 ?auto_24126 ) ) ( ON_BOARD ?auto_24130 ?auto_24128 ) ( not ( = ?auto_24129 ?auto_24130 ) ) ( SUPPORTS ?auto_24130 ?auto_24131 ) ( not ( = ?auto_24123 ?auto_24131 ) ) ( not ( = ?auto_24124 ?auto_24131 ) ) ( POINTING ?auto_24128 ?auto_24127 ) ( CALIBRATION_TARGET ?auto_24130 ?auto_24127 ) ( POWER_AVAIL ?auto_24128 ) )
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
      ?auto_24141 - INSTRUMENT
      ?auto_24140 - SATELLITE
      ?auto_24139 - DIRECTION
      ?auto_24137 - DIRECTION
      ?auto_24136 - MODE
      ?auto_24138 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24141 ?auto_24140 ) ( SUPPORTS ?auto_24141 ?auto_24134 ) ( not ( = ?auto_24135 ?auto_24139 ) ) ( HAVE_IMAGE ?auto_24137 ?auto_24136 ) ( not ( = ?auto_24137 ?auto_24135 ) ) ( not ( = ?auto_24137 ?auto_24139 ) ) ( not ( = ?auto_24136 ?auto_24134 ) ) ( CALIBRATION_TARGET ?auto_24141 ?auto_24139 ) ( not ( = ?auto_24139 ?auto_24132 ) ) ( not ( = ?auto_24135 ?auto_24132 ) ) ( not ( = ?auto_24137 ?auto_24132 ) ) ( ON_BOARD ?auto_24138 ?auto_24140 ) ( not ( = ?auto_24141 ?auto_24138 ) ) ( SUPPORTS ?auto_24138 ?auto_24133 ) ( not ( = ?auto_24136 ?auto_24133 ) ) ( not ( = ?auto_24134 ?auto_24133 ) ) ( POINTING ?auto_24140 ?auto_24139 ) ( CALIBRATION_TARGET ?auto_24138 ?auto_24139 ) ( POWER_AVAIL ?auto_24140 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24137 ?auto_24136 ?auto_24135 ?auto_24134 )
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
      ?auto_24151 - INSTRUMENT
      ?auto_24149 - SATELLITE
      ?auto_24147 - DIRECTION
      ?auto_24150 - DIRECTION
      ?auto_24146 - INSTRUMENT
      ?auto_24148 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_24151 ?auto_24149 ) ( SUPPORTS ?auto_24151 ?auto_24143 ) ( not ( = ?auto_24142 ?auto_24147 ) ) ( HAVE_IMAGE ?auto_24145 ?auto_24144 ) ( not ( = ?auto_24145 ?auto_24142 ) ) ( not ( = ?auto_24145 ?auto_24147 ) ) ( not ( = ?auto_24144 ?auto_24143 ) ) ( CALIBRATION_TARGET ?auto_24151 ?auto_24147 ) ( not ( = ?auto_24147 ?auto_24150 ) ) ( not ( = ?auto_24142 ?auto_24150 ) ) ( not ( = ?auto_24145 ?auto_24150 ) ) ( ON_BOARD ?auto_24146 ?auto_24149 ) ( not ( = ?auto_24151 ?auto_24146 ) ) ( SUPPORTS ?auto_24146 ?auto_24148 ) ( not ( = ?auto_24144 ?auto_24148 ) ) ( not ( = ?auto_24143 ?auto_24148 ) ) ( POINTING ?auto_24149 ?auto_24147 ) ( CALIBRATION_TARGET ?auto_24146 ?auto_24147 ) ( POWER_AVAIL ?auto_24149 ) )
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
      ?auto_24161 - INSTRUMENT
      ?auto_24160 - SATELLITE
      ?auto_24159 - DIRECTION
      ?auto_24157 - DIRECTION
      ?auto_24156 - MODE
      ?auto_24158 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24161 ?auto_24160 ) ( SUPPORTS ?auto_24161 ?auto_24153 ) ( not ( = ?auto_24152 ?auto_24159 ) ) ( HAVE_IMAGE ?auto_24157 ?auto_24156 ) ( not ( = ?auto_24157 ?auto_24152 ) ) ( not ( = ?auto_24157 ?auto_24159 ) ) ( not ( = ?auto_24156 ?auto_24153 ) ) ( CALIBRATION_TARGET ?auto_24161 ?auto_24159 ) ( not ( = ?auto_24159 ?auto_24155 ) ) ( not ( = ?auto_24152 ?auto_24155 ) ) ( not ( = ?auto_24157 ?auto_24155 ) ) ( ON_BOARD ?auto_24158 ?auto_24160 ) ( not ( = ?auto_24161 ?auto_24158 ) ) ( SUPPORTS ?auto_24158 ?auto_24154 ) ( not ( = ?auto_24156 ?auto_24154 ) ) ( not ( = ?auto_24153 ?auto_24154 ) ) ( POINTING ?auto_24160 ?auto_24159 ) ( CALIBRATION_TARGET ?auto_24158 ?auto_24159 ) ( POWER_AVAIL ?auto_24160 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24157 ?auto_24156 ?auto_24152 ?auto_24153 )
      ( GET-2IMAGE-VERIFY ?auto_24152 ?auto_24153 ?auto_24155 ?auto_24154 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24174 - DIRECTION
      ?auto_24175 - MODE
      ?auto_24177 - DIRECTION
      ?auto_24176 - MODE
      ?auto_24179 - DIRECTION
      ?auto_24178 - MODE
    )
    :vars
    (
      ?auto_24185 - INSTRUMENT
      ?auto_24183 - SATELLITE
      ?auto_24181 - DIRECTION
      ?auto_24184 - DIRECTION
      ?auto_24180 - INSTRUMENT
      ?auto_24182 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_24185 ?auto_24183 ) ( SUPPORTS ?auto_24185 ?auto_24178 ) ( not ( = ?auto_24179 ?auto_24181 ) ) ( HAVE_IMAGE ?auto_24174 ?auto_24175 ) ( not ( = ?auto_24174 ?auto_24179 ) ) ( not ( = ?auto_24174 ?auto_24181 ) ) ( not ( = ?auto_24175 ?auto_24178 ) ) ( CALIBRATION_TARGET ?auto_24185 ?auto_24181 ) ( not ( = ?auto_24181 ?auto_24184 ) ) ( not ( = ?auto_24179 ?auto_24184 ) ) ( not ( = ?auto_24174 ?auto_24184 ) ) ( ON_BOARD ?auto_24180 ?auto_24183 ) ( not ( = ?auto_24185 ?auto_24180 ) ) ( SUPPORTS ?auto_24180 ?auto_24182 ) ( not ( = ?auto_24175 ?auto_24182 ) ) ( not ( = ?auto_24178 ?auto_24182 ) ) ( POINTING ?auto_24183 ?auto_24181 ) ( CALIBRATION_TARGET ?auto_24180 ?auto_24181 ) ( POWER_AVAIL ?auto_24183 ) ( HAVE_IMAGE ?auto_24177 ?auto_24176 ) ( not ( = ?auto_24174 ?auto_24177 ) ) ( not ( = ?auto_24175 ?auto_24176 ) ) ( not ( = ?auto_24177 ?auto_24179 ) ) ( not ( = ?auto_24177 ?auto_24181 ) ) ( not ( = ?auto_24177 ?auto_24184 ) ) ( not ( = ?auto_24176 ?auto_24178 ) ) ( not ( = ?auto_24176 ?auto_24182 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24174 ?auto_24175 ?auto_24179 ?auto_24178 )
      ( GET-3IMAGE-VERIFY ?auto_24174 ?auto_24175 ?auto_24177 ?auto_24176 ?auto_24179 ?auto_24178 ) )
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
      ?auto_24195 - INSTRUMENT
      ?auto_24194 - SATELLITE
      ?auto_24193 - DIRECTION
      ?auto_24192 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24195 ?auto_24194 ) ( SUPPORTS ?auto_24195 ?auto_24190 ) ( not ( = ?auto_24191 ?auto_24193 ) ) ( HAVE_IMAGE ?auto_24186 ?auto_24187 ) ( not ( = ?auto_24186 ?auto_24191 ) ) ( not ( = ?auto_24186 ?auto_24193 ) ) ( not ( = ?auto_24187 ?auto_24190 ) ) ( CALIBRATION_TARGET ?auto_24195 ?auto_24193 ) ( not ( = ?auto_24193 ?auto_24189 ) ) ( not ( = ?auto_24191 ?auto_24189 ) ) ( not ( = ?auto_24186 ?auto_24189 ) ) ( ON_BOARD ?auto_24192 ?auto_24194 ) ( not ( = ?auto_24195 ?auto_24192 ) ) ( SUPPORTS ?auto_24192 ?auto_24188 ) ( not ( = ?auto_24187 ?auto_24188 ) ) ( not ( = ?auto_24190 ?auto_24188 ) ) ( POINTING ?auto_24194 ?auto_24193 ) ( CALIBRATION_TARGET ?auto_24192 ?auto_24193 ) ( POWER_AVAIL ?auto_24194 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24186 ?auto_24187 ?auto_24191 ?auto_24190 )
      ( GET-3IMAGE-VERIFY ?auto_24186 ?auto_24187 ?auto_24189 ?auto_24188 ?auto_24191 ?auto_24190 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24196 - DIRECTION
      ?auto_24197 - MODE
      ?auto_24199 - DIRECTION
      ?auto_24198 - MODE
      ?auto_24201 - DIRECTION
      ?auto_24200 - MODE
    )
    :vars
    (
      ?auto_24207 - INSTRUMENT
      ?auto_24205 - SATELLITE
      ?auto_24203 - DIRECTION
      ?auto_24206 - DIRECTION
      ?auto_24202 - INSTRUMENT
      ?auto_24204 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_24207 ?auto_24205 ) ( SUPPORTS ?auto_24207 ?auto_24198 ) ( not ( = ?auto_24199 ?auto_24203 ) ) ( HAVE_IMAGE ?auto_24201 ?auto_24200 ) ( not ( = ?auto_24201 ?auto_24199 ) ) ( not ( = ?auto_24201 ?auto_24203 ) ) ( not ( = ?auto_24200 ?auto_24198 ) ) ( CALIBRATION_TARGET ?auto_24207 ?auto_24203 ) ( not ( = ?auto_24203 ?auto_24206 ) ) ( not ( = ?auto_24199 ?auto_24206 ) ) ( not ( = ?auto_24201 ?auto_24206 ) ) ( ON_BOARD ?auto_24202 ?auto_24205 ) ( not ( = ?auto_24207 ?auto_24202 ) ) ( SUPPORTS ?auto_24202 ?auto_24204 ) ( not ( = ?auto_24200 ?auto_24204 ) ) ( not ( = ?auto_24198 ?auto_24204 ) ) ( POINTING ?auto_24205 ?auto_24203 ) ( CALIBRATION_TARGET ?auto_24202 ?auto_24203 ) ( POWER_AVAIL ?auto_24205 ) ( HAVE_IMAGE ?auto_24196 ?auto_24197 ) ( not ( = ?auto_24196 ?auto_24199 ) ) ( not ( = ?auto_24196 ?auto_24201 ) ) ( not ( = ?auto_24196 ?auto_24203 ) ) ( not ( = ?auto_24196 ?auto_24206 ) ) ( not ( = ?auto_24197 ?auto_24198 ) ) ( not ( = ?auto_24197 ?auto_24200 ) ) ( not ( = ?auto_24197 ?auto_24204 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24201 ?auto_24200 ?auto_24199 ?auto_24198 )
      ( GET-3IMAGE-VERIFY ?auto_24196 ?auto_24197 ?auto_24199 ?auto_24198 ?auto_24201 ?auto_24200 ) )
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
      ?auto_24217 - INSTRUMENT
      ?auto_24216 - SATELLITE
      ?auto_24215 - DIRECTION
      ?auto_24214 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24217 ?auto_24216 ) ( SUPPORTS ?auto_24217 ?auto_24210 ) ( not ( = ?auto_24211 ?auto_24215 ) ) ( HAVE_IMAGE ?auto_24208 ?auto_24209 ) ( not ( = ?auto_24208 ?auto_24211 ) ) ( not ( = ?auto_24208 ?auto_24215 ) ) ( not ( = ?auto_24209 ?auto_24210 ) ) ( CALIBRATION_TARGET ?auto_24217 ?auto_24215 ) ( not ( = ?auto_24215 ?auto_24213 ) ) ( not ( = ?auto_24211 ?auto_24213 ) ) ( not ( = ?auto_24208 ?auto_24213 ) ) ( ON_BOARD ?auto_24214 ?auto_24216 ) ( not ( = ?auto_24217 ?auto_24214 ) ) ( SUPPORTS ?auto_24214 ?auto_24212 ) ( not ( = ?auto_24209 ?auto_24212 ) ) ( not ( = ?auto_24210 ?auto_24212 ) ) ( POINTING ?auto_24216 ?auto_24215 ) ( CALIBRATION_TARGET ?auto_24214 ?auto_24215 ) ( POWER_AVAIL ?auto_24216 ) )
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
      ?auto_24239 - INSTRUMENT
      ?auto_24238 - SATELLITE
      ?auto_24237 - DIRECTION
      ?auto_24236 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24239 ?auto_24238 ) ( SUPPORTS ?auto_24239 ?auto_24234 ) ( not ( = ?auto_24235 ?auto_24237 ) ) ( HAVE_IMAGE ?auto_24233 ?auto_24232 ) ( not ( = ?auto_24233 ?auto_24235 ) ) ( not ( = ?auto_24233 ?auto_24237 ) ) ( not ( = ?auto_24232 ?auto_24234 ) ) ( CALIBRATION_TARGET ?auto_24239 ?auto_24237 ) ( not ( = ?auto_24237 ?auto_24230 ) ) ( not ( = ?auto_24235 ?auto_24230 ) ) ( not ( = ?auto_24233 ?auto_24230 ) ) ( ON_BOARD ?auto_24236 ?auto_24238 ) ( not ( = ?auto_24239 ?auto_24236 ) ) ( SUPPORTS ?auto_24236 ?auto_24231 ) ( not ( = ?auto_24232 ?auto_24231 ) ) ( not ( = ?auto_24234 ?auto_24231 ) ) ( POINTING ?auto_24238 ?auto_24237 ) ( CALIBRATION_TARGET ?auto_24236 ?auto_24237 ) ( POWER_AVAIL ?auto_24238 ) )
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
      ?auto_24261 - INSTRUMENT
      ?auto_24260 - SATELLITE
      ?auto_24259 - DIRECTION
      ?auto_24258 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24261 ?auto_24260 ) ( SUPPORTS ?auto_24261 ?auto_24254 ) ( not ( = ?auto_24255 ?auto_24259 ) ) ( HAVE_IMAGE ?auto_24257 ?auto_24256 ) ( not ( = ?auto_24257 ?auto_24255 ) ) ( not ( = ?auto_24257 ?auto_24259 ) ) ( not ( = ?auto_24256 ?auto_24254 ) ) ( CALIBRATION_TARGET ?auto_24261 ?auto_24259 ) ( not ( = ?auto_24259 ?auto_24252 ) ) ( not ( = ?auto_24255 ?auto_24252 ) ) ( not ( = ?auto_24257 ?auto_24252 ) ) ( ON_BOARD ?auto_24258 ?auto_24260 ) ( not ( = ?auto_24261 ?auto_24258 ) ) ( SUPPORTS ?auto_24258 ?auto_24253 ) ( not ( = ?auto_24256 ?auto_24253 ) ) ( not ( = ?auto_24254 ?auto_24253 ) ) ( POINTING ?auto_24260 ?auto_24259 ) ( CALIBRATION_TARGET ?auto_24258 ?auto_24259 ) ( POWER_AVAIL ?auto_24260 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24257 ?auto_24256 ?auto_24255 ?auto_24254 )
      ( GET-3IMAGE-VERIFY ?auto_24252 ?auto_24253 ?auto_24255 ?auto_24254 ?auto_24257 ?auto_24256 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24286 - DIRECTION
      ?auto_24287 - MODE
      ?auto_24289 - DIRECTION
      ?auto_24288 - MODE
      ?auto_24291 - DIRECTION
      ?auto_24290 - MODE
    )
    :vars
    (
      ?auto_24297 - INSTRUMENT
      ?auto_24295 - SATELLITE
      ?auto_24293 - DIRECTION
      ?auto_24296 - DIRECTION
      ?auto_24292 - INSTRUMENT
      ?auto_24294 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_24297 ?auto_24295 ) ( SUPPORTS ?auto_24297 ?auto_24287 ) ( not ( = ?auto_24286 ?auto_24293 ) ) ( HAVE_IMAGE ?auto_24289 ?auto_24290 ) ( not ( = ?auto_24289 ?auto_24286 ) ) ( not ( = ?auto_24289 ?auto_24293 ) ) ( not ( = ?auto_24290 ?auto_24287 ) ) ( CALIBRATION_TARGET ?auto_24297 ?auto_24293 ) ( not ( = ?auto_24293 ?auto_24296 ) ) ( not ( = ?auto_24286 ?auto_24296 ) ) ( not ( = ?auto_24289 ?auto_24296 ) ) ( ON_BOARD ?auto_24292 ?auto_24295 ) ( not ( = ?auto_24297 ?auto_24292 ) ) ( SUPPORTS ?auto_24292 ?auto_24294 ) ( not ( = ?auto_24290 ?auto_24294 ) ) ( not ( = ?auto_24287 ?auto_24294 ) ) ( POINTING ?auto_24295 ?auto_24293 ) ( CALIBRATION_TARGET ?auto_24292 ?auto_24293 ) ( POWER_AVAIL ?auto_24295 ) ( HAVE_IMAGE ?auto_24289 ?auto_24288 ) ( HAVE_IMAGE ?auto_24291 ?auto_24290 ) ( not ( = ?auto_24286 ?auto_24291 ) ) ( not ( = ?auto_24287 ?auto_24288 ) ) ( not ( = ?auto_24289 ?auto_24291 ) ) ( not ( = ?auto_24288 ?auto_24290 ) ) ( not ( = ?auto_24288 ?auto_24294 ) ) ( not ( = ?auto_24291 ?auto_24293 ) ) ( not ( = ?auto_24291 ?auto_24296 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24289 ?auto_24290 ?auto_24286 ?auto_24287 )
      ( GET-3IMAGE-VERIFY ?auto_24286 ?auto_24287 ?auto_24289 ?auto_24288 ?auto_24291 ?auto_24290 ) )
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
      ?auto_24307 - INSTRUMENT
      ?auto_24306 - SATELLITE
      ?auto_24305 - DIRECTION
      ?auto_24304 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24307 ?auto_24306 ) ( SUPPORTS ?auto_24307 ?auto_24299 ) ( not ( = ?auto_24298 ?auto_24305 ) ) ( HAVE_IMAGE ?auto_24301 ?auto_24300 ) ( not ( = ?auto_24301 ?auto_24298 ) ) ( not ( = ?auto_24301 ?auto_24305 ) ) ( not ( = ?auto_24300 ?auto_24299 ) ) ( CALIBRATION_TARGET ?auto_24307 ?auto_24305 ) ( not ( = ?auto_24305 ?auto_24303 ) ) ( not ( = ?auto_24298 ?auto_24303 ) ) ( not ( = ?auto_24301 ?auto_24303 ) ) ( ON_BOARD ?auto_24304 ?auto_24306 ) ( not ( = ?auto_24307 ?auto_24304 ) ) ( SUPPORTS ?auto_24304 ?auto_24302 ) ( not ( = ?auto_24300 ?auto_24302 ) ) ( not ( = ?auto_24299 ?auto_24302 ) ) ( POINTING ?auto_24306 ?auto_24305 ) ( CALIBRATION_TARGET ?auto_24304 ?auto_24305 ) ( POWER_AVAIL ?auto_24306 ) )
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
      ?auto_24329 - INSTRUMENT
      ?auto_24328 - SATELLITE
      ?auto_24327 - DIRECTION
      ?auto_24326 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24329 ?auto_24328 ) ( SUPPORTS ?auto_24329 ?auto_24321 ) ( not ( = ?auto_24320 ?auto_24327 ) ) ( HAVE_IMAGE ?auto_24325 ?auto_24324 ) ( not ( = ?auto_24325 ?auto_24320 ) ) ( not ( = ?auto_24325 ?auto_24327 ) ) ( not ( = ?auto_24324 ?auto_24321 ) ) ( CALIBRATION_TARGET ?auto_24329 ?auto_24327 ) ( not ( = ?auto_24327 ?auto_24323 ) ) ( not ( = ?auto_24320 ?auto_24323 ) ) ( not ( = ?auto_24325 ?auto_24323 ) ) ( ON_BOARD ?auto_24326 ?auto_24328 ) ( not ( = ?auto_24329 ?auto_24326 ) ) ( SUPPORTS ?auto_24326 ?auto_24322 ) ( not ( = ?auto_24324 ?auto_24322 ) ) ( not ( = ?auto_24321 ?auto_24322 ) ) ( POINTING ?auto_24328 ?auto_24327 ) ( CALIBRATION_TARGET ?auto_24326 ?auto_24327 ) ( POWER_AVAIL ?auto_24328 ) )
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
      ?auto_24401 - INSTRUMENT
      ?auto_24399 - SATELLITE
      ?auto_24397 - DIRECTION
      ?auto_24395 - DIRECTION
      ?auto_24394 - MODE
      ?auto_24400 - DIRECTION
      ?auto_24396 - INSTRUMENT
      ?auto_24398 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_24401 ?auto_24399 ) ( SUPPORTS ?auto_24401 ?auto_24393 ) ( not ( = ?auto_24392 ?auto_24397 ) ) ( HAVE_IMAGE ?auto_24395 ?auto_24394 ) ( not ( = ?auto_24395 ?auto_24392 ) ) ( not ( = ?auto_24395 ?auto_24397 ) ) ( not ( = ?auto_24394 ?auto_24393 ) ) ( CALIBRATION_TARGET ?auto_24401 ?auto_24397 ) ( not ( = ?auto_24397 ?auto_24400 ) ) ( not ( = ?auto_24392 ?auto_24400 ) ) ( not ( = ?auto_24395 ?auto_24400 ) ) ( ON_BOARD ?auto_24396 ?auto_24399 ) ( not ( = ?auto_24401 ?auto_24396 ) ) ( SUPPORTS ?auto_24396 ?auto_24398 ) ( not ( = ?auto_24394 ?auto_24398 ) ) ( not ( = ?auto_24393 ?auto_24398 ) ) ( CALIBRATION_TARGET ?auto_24396 ?auto_24397 ) ( POWER_AVAIL ?auto_24399 ) ( POINTING ?auto_24399 ?auto_24395 ) )
    :subtasks
    ( ( !TURN_TO ?auto_24399 ?auto_24397 ?auto_24395 )
      ( GET-2IMAGE ?auto_24395 ?auto_24394 ?auto_24392 ?auto_24393 )
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
      ?auto_24410 - INSTRUMENT
      ?auto_24411 - SATELLITE
      ?auto_24408 - DIRECTION
      ?auto_24409 - DIRECTION
      ?auto_24406 - INSTRUMENT
      ?auto_24407 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_24410 ?auto_24411 ) ( SUPPORTS ?auto_24410 ?auto_24404 ) ( not ( = ?auto_24405 ?auto_24408 ) ) ( HAVE_IMAGE ?auto_24402 ?auto_24403 ) ( not ( = ?auto_24402 ?auto_24405 ) ) ( not ( = ?auto_24402 ?auto_24408 ) ) ( not ( = ?auto_24403 ?auto_24404 ) ) ( CALIBRATION_TARGET ?auto_24410 ?auto_24408 ) ( not ( = ?auto_24408 ?auto_24409 ) ) ( not ( = ?auto_24405 ?auto_24409 ) ) ( not ( = ?auto_24402 ?auto_24409 ) ) ( ON_BOARD ?auto_24406 ?auto_24411 ) ( not ( = ?auto_24410 ?auto_24406 ) ) ( SUPPORTS ?auto_24406 ?auto_24407 ) ( not ( = ?auto_24403 ?auto_24407 ) ) ( not ( = ?auto_24404 ?auto_24407 ) ) ( CALIBRATION_TARGET ?auto_24406 ?auto_24408 ) ( POWER_AVAIL ?auto_24411 ) ( POINTING ?auto_24411 ?auto_24402 ) )
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
      ?auto_24416 - INSTRUMENT
      ?auto_24420 - SATELLITE
      ?auto_24421 - DIRECTION
      ?auto_24418 - DIRECTION
      ?auto_24417 - MODE
      ?auto_24419 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24416 ?auto_24420 ) ( SUPPORTS ?auto_24416 ?auto_24414 ) ( not ( = ?auto_24415 ?auto_24421 ) ) ( HAVE_IMAGE ?auto_24418 ?auto_24417 ) ( not ( = ?auto_24418 ?auto_24415 ) ) ( not ( = ?auto_24418 ?auto_24421 ) ) ( not ( = ?auto_24417 ?auto_24414 ) ) ( CALIBRATION_TARGET ?auto_24416 ?auto_24421 ) ( not ( = ?auto_24421 ?auto_24412 ) ) ( not ( = ?auto_24415 ?auto_24412 ) ) ( not ( = ?auto_24418 ?auto_24412 ) ) ( ON_BOARD ?auto_24419 ?auto_24420 ) ( not ( = ?auto_24416 ?auto_24419 ) ) ( SUPPORTS ?auto_24419 ?auto_24413 ) ( not ( = ?auto_24417 ?auto_24413 ) ) ( not ( = ?auto_24414 ?auto_24413 ) ) ( CALIBRATION_TARGET ?auto_24419 ?auto_24421 ) ( POWER_AVAIL ?auto_24420 ) ( POINTING ?auto_24420 ?auto_24418 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24418 ?auto_24417 ?auto_24415 ?auto_24414 )
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
      ?auto_24431 - DIRECTION
      ?auto_24428 - DIRECTION
      ?auto_24429 - INSTRUMENT
      ?auto_24426 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_24427 ?auto_24430 ) ( SUPPORTS ?auto_24427 ?auto_24423 ) ( not ( = ?auto_24422 ?auto_24431 ) ) ( HAVE_IMAGE ?auto_24425 ?auto_24424 ) ( not ( = ?auto_24425 ?auto_24422 ) ) ( not ( = ?auto_24425 ?auto_24431 ) ) ( not ( = ?auto_24424 ?auto_24423 ) ) ( CALIBRATION_TARGET ?auto_24427 ?auto_24431 ) ( not ( = ?auto_24431 ?auto_24428 ) ) ( not ( = ?auto_24422 ?auto_24428 ) ) ( not ( = ?auto_24425 ?auto_24428 ) ) ( ON_BOARD ?auto_24429 ?auto_24430 ) ( not ( = ?auto_24427 ?auto_24429 ) ) ( SUPPORTS ?auto_24429 ?auto_24426 ) ( not ( = ?auto_24424 ?auto_24426 ) ) ( not ( = ?auto_24423 ?auto_24426 ) ) ( CALIBRATION_TARGET ?auto_24429 ?auto_24431 ) ( POWER_AVAIL ?auto_24430 ) ( POINTING ?auto_24430 ?auto_24425 ) )
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
      ?auto_24436 - INSTRUMENT
      ?auto_24440 - SATELLITE
      ?auto_24441 - DIRECTION
      ?auto_24438 - DIRECTION
      ?auto_24437 - MODE
      ?auto_24439 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24436 ?auto_24440 ) ( SUPPORTS ?auto_24436 ?auto_24433 ) ( not ( = ?auto_24432 ?auto_24441 ) ) ( HAVE_IMAGE ?auto_24438 ?auto_24437 ) ( not ( = ?auto_24438 ?auto_24432 ) ) ( not ( = ?auto_24438 ?auto_24441 ) ) ( not ( = ?auto_24437 ?auto_24433 ) ) ( CALIBRATION_TARGET ?auto_24436 ?auto_24441 ) ( not ( = ?auto_24441 ?auto_24435 ) ) ( not ( = ?auto_24432 ?auto_24435 ) ) ( not ( = ?auto_24438 ?auto_24435 ) ) ( ON_BOARD ?auto_24439 ?auto_24440 ) ( not ( = ?auto_24436 ?auto_24439 ) ) ( SUPPORTS ?auto_24439 ?auto_24434 ) ( not ( = ?auto_24437 ?auto_24434 ) ) ( not ( = ?auto_24433 ?auto_24434 ) ) ( CALIBRATION_TARGET ?auto_24439 ?auto_24441 ) ( POWER_AVAIL ?auto_24440 ) ( POINTING ?auto_24440 ?auto_24438 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24438 ?auto_24437 ?auto_24432 ?auto_24433 )
      ( GET-2IMAGE-VERIFY ?auto_24432 ?auto_24433 ?auto_24435 ?auto_24434 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24454 - DIRECTION
      ?auto_24455 - MODE
      ?auto_24457 - DIRECTION
      ?auto_24456 - MODE
      ?auto_24459 - DIRECTION
      ?auto_24458 - MODE
    )
    :vars
    (
      ?auto_24461 - INSTRUMENT
      ?auto_24464 - SATELLITE
      ?auto_24465 - DIRECTION
      ?auto_24462 - DIRECTION
      ?auto_24463 - INSTRUMENT
      ?auto_24460 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_24461 ?auto_24464 ) ( SUPPORTS ?auto_24461 ?auto_24458 ) ( not ( = ?auto_24459 ?auto_24465 ) ) ( HAVE_IMAGE ?auto_24457 ?auto_24456 ) ( not ( = ?auto_24457 ?auto_24459 ) ) ( not ( = ?auto_24457 ?auto_24465 ) ) ( not ( = ?auto_24456 ?auto_24458 ) ) ( CALIBRATION_TARGET ?auto_24461 ?auto_24465 ) ( not ( = ?auto_24465 ?auto_24462 ) ) ( not ( = ?auto_24459 ?auto_24462 ) ) ( not ( = ?auto_24457 ?auto_24462 ) ) ( ON_BOARD ?auto_24463 ?auto_24464 ) ( not ( = ?auto_24461 ?auto_24463 ) ) ( SUPPORTS ?auto_24463 ?auto_24460 ) ( not ( = ?auto_24456 ?auto_24460 ) ) ( not ( = ?auto_24458 ?auto_24460 ) ) ( CALIBRATION_TARGET ?auto_24463 ?auto_24465 ) ( POWER_AVAIL ?auto_24464 ) ( POINTING ?auto_24464 ?auto_24457 ) ( HAVE_IMAGE ?auto_24454 ?auto_24455 ) ( not ( = ?auto_24454 ?auto_24457 ) ) ( not ( = ?auto_24454 ?auto_24459 ) ) ( not ( = ?auto_24454 ?auto_24465 ) ) ( not ( = ?auto_24454 ?auto_24462 ) ) ( not ( = ?auto_24455 ?auto_24456 ) ) ( not ( = ?auto_24455 ?auto_24458 ) ) ( not ( = ?auto_24455 ?auto_24460 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24457 ?auto_24456 ?auto_24459 ?auto_24458 )
      ( GET-3IMAGE-VERIFY ?auto_24454 ?auto_24455 ?auto_24457 ?auto_24456 ?auto_24459 ?auto_24458 ) )
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
      ?auto_24474 - SATELLITE
      ?auto_24475 - DIRECTION
      ?auto_24473 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24472 ?auto_24474 ) ( SUPPORTS ?auto_24472 ?auto_24470 ) ( not ( = ?auto_24471 ?auto_24475 ) ) ( HAVE_IMAGE ?auto_24466 ?auto_24467 ) ( not ( = ?auto_24466 ?auto_24471 ) ) ( not ( = ?auto_24466 ?auto_24475 ) ) ( not ( = ?auto_24467 ?auto_24470 ) ) ( CALIBRATION_TARGET ?auto_24472 ?auto_24475 ) ( not ( = ?auto_24475 ?auto_24469 ) ) ( not ( = ?auto_24471 ?auto_24469 ) ) ( not ( = ?auto_24466 ?auto_24469 ) ) ( ON_BOARD ?auto_24473 ?auto_24474 ) ( not ( = ?auto_24472 ?auto_24473 ) ) ( SUPPORTS ?auto_24473 ?auto_24468 ) ( not ( = ?auto_24467 ?auto_24468 ) ) ( not ( = ?auto_24470 ?auto_24468 ) ) ( CALIBRATION_TARGET ?auto_24473 ?auto_24475 ) ( POWER_AVAIL ?auto_24474 ) ( POINTING ?auto_24474 ?auto_24466 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24466 ?auto_24467 ?auto_24471 ?auto_24470 )
      ( GET-3IMAGE-VERIFY ?auto_24466 ?auto_24467 ?auto_24469 ?auto_24468 ?auto_24471 ?auto_24470 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24476 - DIRECTION
      ?auto_24477 - MODE
      ?auto_24479 - DIRECTION
      ?auto_24478 - MODE
      ?auto_24481 - DIRECTION
      ?auto_24480 - MODE
    )
    :vars
    (
      ?auto_24483 - INSTRUMENT
      ?auto_24486 - SATELLITE
      ?auto_24487 - DIRECTION
      ?auto_24484 - DIRECTION
      ?auto_24485 - INSTRUMENT
      ?auto_24482 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_24483 ?auto_24486 ) ( SUPPORTS ?auto_24483 ?auto_24478 ) ( not ( = ?auto_24479 ?auto_24487 ) ) ( HAVE_IMAGE ?auto_24476 ?auto_24477 ) ( not ( = ?auto_24476 ?auto_24479 ) ) ( not ( = ?auto_24476 ?auto_24487 ) ) ( not ( = ?auto_24477 ?auto_24478 ) ) ( CALIBRATION_TARGET ?auto_24483 ?auto_24487 ) ( not ( = ?auto_24487 ?auto_24484 ) ) ( not ( = ?auto_24479 ?auto_24484 ) ) ( not ( = ?auto_24476 ?auto_24484 ) ) ( ON_BOARD ?auto_24485 ?auto_24486 ) ( not ( = ?auto_24483 ?auto_24485 ) ) ( SUPPORTS ?auto_24485 ?auto_24482 ) ( not ( = ?auto_24477 ?auto_24482 ) ) ( not ( = ?auto_24478 ?auto_24482 ) ) ( CALIBRATION_TARGET ?auto_24485 ?auto_24487 ) ( POWER_AVAIL ?auto_24486 ) ( POINTING ?auto_24486 ?auto_24476 ) ( HAVE_IMAGE ?auto_24481 ?auto_24480 ) ( not ( = ?auto_24476 ?auto_24481 ) ) ( not ( = ?auto_24477 ?auto_24480 ) ) ( not ( = ?auto_24479 ?auto_24481 ) ) ( not ( = ?auto_24478 ?auto_24480 ) ) ( not ( = ?auto_24481 ?auto_24487 ) ) ( not ( = ?auto_24481 ?auto_24484 ) ) ( not ( = ?auto_24480 ?auto_24482 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24476 ?auto_24477 ?auto_24479 ?auto_24478 )
      ( GET-3IMAGE-VERIFY ?auto_24476 ?auto_24477 ?auto_24479 ?auto_24478 ?auto_24481 ?auto_24480 ) )
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
      ?auto_24496 - SATELLITE
      ?auto_24497 - DIRECTION
      ?auto_24495 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24494 ?auto_24496 ) ( SUPPORTS ?auto_24494 ?auto_24490 ) ( not ( = ?auto_24491 ?auto_24497 ) ) ( HAVE_IMAGE ?auto_24488 ?auto_24489 ) ( not ( = ?auto_24488 ?auto_24491 ) ) ( not ( = ?auto_24488 ?auto_24497 ) ) ( not ( = ?auto_24489 ?auto_24490 ) ) ( CALIBRATION_TARGET ?auto_24494 ?auto_24497 ) ( not ( = ?auto_24497 ?auto_24493 ) ) ( not ( = ?auto_24491 ?auto_24493 ) ) ( not ( = ?auto_24488 ?auto_24493 ) ) ( ON_BOARD ?auto_24495 ?auto_24496 ) ( not ( = ?auto_24494 ?auto_24495 ) ) ( SUPPORTS ?auto_24495 ?auto_24492 ) ( not ( = ?auto_24489 ?auto_24492 ) ) ( not ( = ?auto_24490 ?auto_24492 ) ) ( CALIBRATION_TARGET ?auto_24495 ?auto_24497 ) ( POWER_AVAIL ?auto_24496 ) ( POINTING ?auto_24496 ?auto_24488 ) )
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
      ?auto_24518 - SATELLITE
      ?auto_24519 - DIRECTION
      ?auto_24517 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24516 ?auto_24518 ) ( SUPPORTS ?auto_24516 ?auto_24514 ) ( not ( = ?auto_24515 ?auto_24519 ) ) ( HAVE_IMAGE ?auto_24513 ?auto_24512 ) ( not ( = ?auto_24513 ?auto_24515 ) ) ( not ( = ?auto_24513 ?auto_24519 ) ) ( not ( = ?auto_24512 ?auto_24514 ) ) ( CALIBRATION_TARGET ?auto_24516 ?auto_24519 ) ( not ( = ?auto_24519 ?auto_24510 ) ) ( not ( = ?auto_24515 ?auto_24510 ) ) ( not ( = ?auto_24513 ?auto_24510 ) ) ( ON_BOARD ?auto_24517 ?auto_24518 ) ( not ( = ?auto_24516 ?auto_24517 ) ) ( SUPPORTS ?auto_24517 ?auto_24511 ) ( not ( = ?auto_24512 ?auto_24511 ) ) ( not ( = ?auto_24514 ?auto_24511 ) ) ( CALIBRATION_TARGET ?auto_24517 ?auto_24519 ) ( POWER_AVAIL ?auto_24518 ) ( POINTING ?auto_24518 ?auto_24513 ) )
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
      ?auto_24540 - SATELLITE
      ?auto_24541 - DIRECTION
      ?auto_24539 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24538 ?auto_24540 ) ( SUPPORTS ?auto_24538 ?auto_24534 ) ( not ( = ?auto_24535 ?auto_24541 ) ) ( HAVE_IMAGE ?auto_24537 ?auto_24536 ) ( not ( = ?auto_24537 ?auto_24535 ) ) ( not ( = ?auto_24537 ?auto_24541 ) ) ( not ( = ?auto_24536 ?auto_24534 ) ) ( CALIBRATION_TARGET ?auto_24538 ?auto_24541 ) ( not ( = ?auto_24541 ?auto_24532 ) ) ( not ( = ?auto_24535 ?auto_24532 ) ) ( not ( = ?auto_24537 ?auto_24532 ) ) ( ON_BOARD ?auto_24539 ?auto_24540 ) ( not ( = ?auto_24538 ?auto_24539 ) ) ( SUPPORTS ?auto_24539 ?auto_24533 ) ( not ( = ?auto_24536 ?auto_24533 ) ) ( not ( = ?auto_24534 ?auto_24533 ) ) ( CALIBRATION_TARGET ?auto_24539 ?auto_24541 ) ( POWER_AVAIL ?auto_24540 ) ( POINTING ?auto_24540 ?auto_24537 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24537 ?auto_24536 ?auto_24535 ?auto_24534 )
      ( GET-3IMAGE-VERIFY ?auto_24532 ?auto_24533 ?auto_24535 ?auto_24534 ?auto_24537 ?auto_24536 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24566 - DIRECTION
      ?auto_24567 - MODE
      ?auto_24569 - DIRECTION
      ?auto_24568 - MODE
      ?auto_24571 - DIRECTION
      ?auto_24570 - MODE
    )
    :vars
    (
      ?auto_24573 - INSTRUMENT
      ?auto_24576 - SATELLITE
      ?auto_24577 - DIRECTION
      ?auto_24574 - DIRECTION
      ?auto_24575 - INSTRUMENT
      ?auto_24572 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_24573 ?auto_24576 ) ( SUPPORTS ?auto_24573 ?auto_24567 ) ( not ( = ?auto_24566 ?auto_24577 ) ) ( HAVE_IMAGE ?auto_24569 ?auto_24570 ) ( not ( = ?auto_24569 ?auto_24566 ) ) ( not ( = ?auto_24569 ?auto_24577 ) ) ( not ( = ?auto_24570 ?auto_24567 ) ) ( CALIBRATION_TARGET ?auto_24573 ?auto_24577 ) ( not ( = ?auto_24577 ?auto_24574 ) ) ( not ( = ?auto_24566 ?auto_24574 ) ) ( not ( = ?auto_24569 ?auto_24574 ) ) ( ON_BOARD ?auto_24575 ?auto_24576 ) ( not ( = ?auto_24573 ?auto_24575 ) ) ( SUPPORTS ?auto_24575 ?auto_24572 ) ( not ( = ?auto_24570 ?auto_24572 ) ) ( not ( = ?auto_24567 ?auto_24572 ) ) ( CALIBRATION_TARGET ?auto_24575 ?auto_24577 ) ( POWER_AVAIL ?auto_24576 ) ( POINTING ?auto_24576 ?auto_24569 ) ( HAVE_IMAGE ?auto_24569 ?auto_24568 ) ( HAVE_IMAGE ?auto_24571 ?auto_24570 ) ( not ( = ?auto_24566 ?auto_24571 ) ) ( not ( = ?auto_24567 ?auto_24568 ) ) ( not ( = ?auto_24569 ?auto_24571 ) ) ( not ( = ?auto_24568 ?auto_24570 ) ) ( not ( = ?auto_24568 ?auto_24572 ) ) ( not ( = ?auto_24571 ?auto_24577 ) ) ( not ( = ?auto_24571 ?auto_24574 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24569 ?auto_24570 ?auto_24566 ?auto_24567 )
      ( GET-3IMAGE-VERIFY ?auto_24566 ?auto_24567 ?auto_24569 ?auto_24568 ?auto_24571 ?auto_24570 ) )
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
      ?auto_24586 - SATELLITE
      ?auto_24587 - DIRECTION
      ?auto_24585 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24584 ?auto_24586 ) ( SUPPORTS ?auto_24584 ?auto_24579 ) ( not ( = ?auto_24578 ?auto_24587 ) ) ( HAVE_IMAGE ?auto_24581 ?auto_24580 ) ( not ( = ?auto_24581 ?auto_24578 ) ) ( not ( = ?auto_24581 ?auto_24587 ) ) ( not ( = ?auto_24580 ?auto_24579 ) ) ( CALIBRATION_TARGET ?auto_24584 ?auto_24587 ) ( not ( = ?auto_24587 ?auto_24583 ) ) ( not ( = ?auto_24578 ?auto_24583 ) ) ( not ( = ?auto_24581 ?auto_24583 ) ) ( ON_BOARD ?auto_24585 ?auto_24586 ) ( not ( = ?auto_24584 ?auto_24585 ) ) ( SUPPORTS ?auto_24585 ?auto_24582 ) ( not ( = ?auto_24580 ?auto_24582 ) ) ( not ( = ?auto_24579 ?auto_24582 ) ) ( CALIBRATION_TARGET ?auto_24585 ?auto_24587 ) ( POWER_AVAIL ?auto_24586 ) ( POINTING ?auto_24586 ?auto_24581 ) )
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
      ?auto_24608 - SATELLITE
      ?auto_24609 - DIRECTION
      ?auto_24607 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24606 ?auto_24608 ) ( SUPPORTS ?auto_24606 ?auto_24601 ) ( not ( = ?auto_24600 ?auto_24609 ) ) ( HAVE_IMAGE ?auto_24605 ?auto_24604 ) ( not ( = ?auto_24605 ?auto_24600 ) ) ( not ( = ?auto_24605 ?auto_24609 ) ) ( not ( = ?auto_24604 ?auto_24601 ) ) ( CALIBRATION_TARGET ?auto_24606 ?auto_24609 ) ( not ( = ?auto_24609 ?auto_24603 ) ) ( not ( = ?auto_24600 ?auto_24603 ) ) ( not ( = ?auto_24605 ?auto_24603 ) ) ( ON_BOARD ?auto_24607 ?auto_24608 ) ( not ( = ?auto_24606 ?auto_24607 ) ) ( SUPPORTS ?auto_24607 ?auto_24602 ) ( not ( = ?auto_24604 ?auto_24602 ) ) ( not ( = ?auto_24601 ?auto_24602 ) ) ( CALIBRATION_TARGET ?auto_24607 ?auto_24609 ) ( POWER_AVAIL ?auto_24608 ) ( POINTING ?auto_24608 ?auto_24605 ) )
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
      ?auto_24675 - INSTRUMENT
      ?auto_24680 - SATELLITE
      ?auto_24681 - DIRECTION
      ?auto_24677 - DIRECTION
      ?auto_24676 - MODE
      ?auto_24678 - DIRECTION
      ?auto_24679 - INSTRUMENT
      ?auto_24674 - MODE
      ?auto_24682 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24675 ?auto_24680 ) ( SUPPORTS ?auto_24675 ?auto_24673 ) ( not ( = ?auto_24672 ?auto_24681 ) ) ( HAVE_IMAGE ?auto_24677 ?auto_24676 ) ( not ( = ?auto_24677 ?auto_24672 ) ) ( not ( = ?auto_24677 ?auto_24681 ) ) ( not ( = ?auto_24676 ?auto_24673 ) ) ( CALIBRATION_TARGET ?auto_24675 ?auto_24681 ) ( not ( = ?auto_24681 ?auto_24678 ) ) ( not ( = ?auto_24672 ?auto_24678 ) ) ( not ( = ?auto_24677 ?auto_24678 ) ) ( ON_BOARD ?auto_24679 ?auto_24680 ) ( not ( = ?auto_24675 ?auto_24679 ) ) ( SUPPORTS ?auto_24679 ?auto_24674 ) ( not ( = ?auto_24676 ?auto_24674 ) ) ( not ( = ?auto_24673 ?auto_24674 ) ) ( CALIBRATION_TARGET ?auto_24679 ?auto_24681 ) ( POINTING ?auto_24680 ?auto_24677 ) ( ON_BOARD ?auto_24682 ?auto_24680 ) ( POWER_ON ?auto_24682 ) ( not ( = ?auto_24675 ?auto_24682 ) ) ( not ( = ?auto_24679 ?auto_24682 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_24682 ?auto_24680 )
      ( GET-2IMAGE ?auto_24677 ?auto_24676 ?auto_24672 ?auto_24673 )
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
      ?auto_24689 - INSTRUMENT
      ?auto_24687 - SATELLITE
      ?auto_24690 - DIRECTION
      ?auto_24693 - DIRECTION
      ?auto_24692 - INSTRUMENT
      ?auto_24688 - MODE
      ?auto_24691 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24689 ?auto_24687 ) ( SUPPORTS ?auto_24689 ?auto_24685 ) ( not ( = ?auto_24686 ?auto_24690 ) ) ( HAVE_IMAGE ?auto_24683 ?auto_24684 ) ( not ( = ?auto_24683 ?auto_24686 ) ) ( not ( = ?auto_24683 ?auto_24690 ) ) ( not ( = ?auto_24684 ?auto_24685 ) ) ( CALIBRATION_TARGET ?auto_24689 ?auto_24690 ) ( not ( = ?auto_24690 ?auto_24693 ) ) ( not ( = ?auto_24686 ?auto_24693 ) ) ( not ( = ?auto_24683 ?auto_24693 ) ) ( ON_BOARD ?auto_24692 ?auto_24687 ) ( not ( = ?auto_24689 ?auto_24692 ) ) ( SUPPORTS ?auto_24692 ?auto_24688 ) ( not ( = ?auto_24684 ?auto_24688 ) ) ( not ( = ?auto_24685 ?auto_24688 ) ) ( CALIBRATION_TARGET ?auto_24692 ?auto_24690 ) ( POINTING ?auto_24687 ?auto_24683 ) ( ON_BOARD ?auto_24691 ?auto_24687 ) ( POWER_ON ?auto_24691 ) ( not ( = ?auto_24689 ?auto_24691 ) ) ( not ( = ?auto_24692 ?auto_24691 ) ) )
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
      ?auto_24702 - INSTRUMENT
      ?auto_24703 - SATELLITE
      ?auto_24698 - DIRECTION
      ?auto_24700 - DIRECTION
      ?auto_24699 - MODE
      ?auto_24701 - INSTRUMENT
      ?auto_24704 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24702 ?auto_24703 ) ( SUPPORTS ?auto_24702 ?auto_24696 ) ( not ( = ?auto_24697 ?auto_24698 ) ) ( HAVE_IMAGE ?auto_24700 ?auto_24699 ) ( not ( = ?auto_24700 ?auto_24697 ) ) ( not ( = ?auto_24700 ?auto_24698 ) ) ( not ( = ?auto_24699 ?auto_24696 ) ) ( CALIBRATION_TARGET ?auto_24702 ?auto_24698 ) ( not ( = ?auto_24698 ?auto_24694 ) ) ( not ( = ?auto_24697 ?auto_24694 ) ) ( not ( = ?auto_24700 ?auto_24694 ) ) ( ON_BOARD ?auto_24701 ?auto_24703 ) ( not ( = ?auto_24702 ?auto_24701 ) ) ( SUPPORTS ?auto_24701 ?auto_24695 ) ( not ( = ?auto_24699 ?auto_24695 ) ) ( not ( = ?auto_24696 ?auto_24695 ) ) ( CALIBRATION_TARGET ?auto_24701 ?auto_24698 ) ( POINTING ?auto_24703 ?auto_24700 ) ( ON_BOARD ?auto_24704 ?auto_24703 ) ( POWER_ON ?auto_24704 ) ( not ( = ?auto_24702 ?auto_24704 ) ) ( not ( = ?auto_24701 ?auto_24704 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24700 ?auto_24699 ?auto_24697 ?auto_24696 )
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
      ?auto_24711 - INSTRUMENT
      ?auto_24713 - SATELLITE
      ?auto_24709 - DIRECTION
      ?auto_24712 - DIRECTION
      ?auto_24710 - INSTRUMENT
      ?auto_24714 - MODE
      ?auto_24715 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24711 ?auto_24713 ) ( SUPPORTS ?auto_24711 ?auto_24706 ) ( not ( = ?auto_24705 ?auto_24709 ) ) ( HAVE_IMAGE ?auto_24708 ?auto_24707 ) ( not ( = ?auto_24708 ?auto_24705 ) ) ( not ( = ?auto_24708 ?auto_24709 ) ) ( not ( = ?auto_24707 ?auto_24706 ) ) ( CALIBRATION_TARGET ?auto_24711 ?auto_24709 ) ( not ( = ?auto_24709 ?auto_24712 ) ) ( not ( = ?auto_24705 ?auto_24712 ) ) ( not ( = ?auto_24708 ?auto_24712 ) ) ( ON_BOARD ?auto_24710 ?auto_24713 ) ( not ( = ?auto_24711 ?auto_24710 ) ) ( SUPPORTS ?auto_24710 ?auto_24714 ) ( not ( = ?auto_24707 ?auto_24714 ) ) ( not ( = ?auto_24706 ?auto_24714 ) ) ( CALIBRATION_TARGET ?auto_24710 ?auto_24709 ) ( POINTING ?auto_24713 ?auto_24708 ) ( ON_BOARD ?auto_24715 ?auto_24713 ) ( POWER_ON ?auto_24715 ) ( not ( = ?auto_24711 ?auto_24715 ) ) ( not ( = ?auto_24710 ?auto_24715 ) ) )
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
      ?auto_24724 - INSTRUMENT
      ?auto_24725 - SATELLITE
      ?auto_24720 - DIRECTION
      ?auto_24722 - DIRECTION
      ?auto_24721 - MODE
      ?auto_24723 - INSTRUMENT
      ?auto_24726 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24724 ?auto_24725 ) ( SUPPORTS ?auto_24724 ?auto_24717 ) ( not ( = ?auto_24716 ?auto_24720 ) ) ( HAVE_IMAGE ?auto_24722 ?auto_24721 ) ( not ( = ?auto_24722 ?auto_24716 ) ) ( not ( = ?auto_24722 ?auto_24720 ) ) ( not ( = ?auto_24721 ?auto_24717 ) ) ( CALIBRATION_TARGET ?auto_24724 ?auto_24720 ) ( not ( = ?auto_24720 ?auto_24719 ) ) ( not ( = ?auto_24716 ?auto_24719 ) ) ( not ( = ?auto_24722 ?auto_24719 ) ) ( ON_BOARD ?auto_24723 ?auto_24725 ) ( not ( = ?auto_24724 ?auto_24723 ) ) ( SUPPORTS ?auto_24723 ?auto_24718 ) ( not ( = ?auto_24721 ?auto_24718 ) ) ( not ( = ?auto_24717 ?auto_24718 ) ) ( CALIBRATION_TARGET ?auto_24723 ?auto_24720 ) ( POINTING ?auto_24725 ?auto_24722 ) ( ON_BOARD ?auto_24726 ?auto_24725 ) ( POWER_ON ?auto_24726 ) ( not ( = ?auto_24724 ?auto_24726 ) ) ( not ( = ?auto_24723 ?auto_24726 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24722 ?auto_24721 ?auto_24716 ?auto_24717 )
      ( GET-2IMAGE-VERIFY ?auto_24716 ?auto_24717 ?auto_24719 ?auto_24718 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24740 - DIRECTION
      ?auto_24741 - MODE
      ?auto_24743 - DIRECTION
      ?auto_24742 - MODE
      ?auto_24745 - DIRECTION
      ?auto_24744 - MODE
    )
    :vars
    (
      ?auto_24748 - INSTRUMENT
      ?auto_24750 - SATELLITE
      ?auto_24746 - DIRECTION
      ?auto_24749 - DIRECTION
      ?auto_24747 - INSTRUMENT
      ?auto_24751 - MODE
      ?auto_24752 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24748 ?auto_24750 ) ( SUPPORTS ?auto_24748 ?auto_24744 ) ( not ( = ?auto_24745 ?auto_24746 ) ) ( HAVE_IMAGE ?auto_24740 ?auto_24741 ) ( not ( = ?auto_24740 ?auto_24745 ) ) ( not ( = ?auto_24740 ?auto_24746 ) ) ( not ( = ?auto_24741 ?auto_24744 ) ) ( CALIBRATION_TARGET ?auto_24748 ?auto_24746 ) ( not ( = ?auto_24746 ?auto_24749 ) ) ( not ( = ?auto_24745 ?auto_24749 ) ) ( not ( = ?auto_24740 ?auto_24749 ) ) ( ON_BOARD ?auto_24747 ?auto_24750 ) ( not ( = ?auto_24748 ?auto_24747 ) ) ( SUPPORTS ?auto_24747 ?auto_24751 ) ( not ( = ?auto_24741 ?auto_24751 ) ) ( not ( = ?auto_24744 ?auto_24751 ) ) ( CALIBRATION_TARGET ?auto_24747 ?auto_24746 ) ( POINTING ?auto_24750 ?auto_24740 ) ( ON_BOARD ?auto_24752 ?auto_24750 ) ( POWER_ON ?auto_24752 ) ( not ( = ?auto_24748 ?auto_24752 ) ) ( not ( = ?auto_24747 ?auto_24752 ) ) ( HAVE_IMAGE ?auto_24743 ?auto_24742 ) ( not ( = ?auto_24740 ?auto_24743 ) ) ( not ( = ?auto_24741 ?auto_24742 ) ) ( not ( = ?auto_24743 ?auto_24745 ) ) ( not ( = ?auto_24743 ?auto_24746 ) ) ( not ( = ?auto_24743 ?auto_24749 ) ) ( not ( = ?auto_24742 ?auto_24744 ) ) ( not ( = ?auto_24742 ?auto_24751 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24740 ?auto_24741 ?auto_24745 ?auto_24744 )
      ( GET-3IMAGE-VERIFY ?auto_24740 ?auto_24741 ?auto_24743 ?auto_24742 ?auto_24745 ?auto_24744 ) )
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
      ?auto_24761 - INSTRUMENT
      ?auto_24762 - SATELLITE
      ?auto_24759 - DIRECTION
      ?auto_24760 - INSTRUMENT
      ?auto_24763 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24761 ?auto_24762 ) ( SUPPORTS ?auto_24761 ?auto_24757 ) ( not ( = ?auto_24758 ?auto_24759 ) ) ( HAVE_IMAGE ?auto_24753 ?auto_24754 ) ( not ( = ?auto_24753 ?auto_24758 ) ) ( not ( = ?auto_24753 ?auto_24759 ) ) ( not ( = ?auto_24754 ?auto_24757 ) ) ( CALIBRATION_TARGET ?auto_24761 ?auto_24759 ) ( not ( = ?auto_24759 ?auto_24756 ) ) ( not ( = ?auto_24758 ?auto_24756 ) ) ( not ( = ?auto_24753 ?auto_24756 ) ) ( ON_BOARD ?auto_24760 ?auto_24762 ) ( not ( = ?auto_24761 ?auto_24760 ) ) ( SUPPORTS ?auto_24760 ?auto_24755 ) ( not ( = ?auto_24754 ?auto_24755 ) ) ( not ( = ?auto_24757 ?auto_24755 ) ) ( CALIBRATION_TARGET ?auto_24760 ?auto_24759 ) ( POINTING ?auto_24762 ?auto_24753 ) ( ON_BOARD ?auto_24763 ?auto_24762 ) ( POWER_ON ?auto_24763 ) ( not ( = ?auto_24761 ?auto_24763 ) ) ( not ( = ?auto_24760 ?auto_24763 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24753 ?auto_24754 ?auto_24758 ?auto_24757 )
      ( GET-3IMAGE-VERIFY ?auto_24753 ?auto_24754 ?auto_24756 ?auto_24755 ?auto_24758 ?auto_24757 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24764 - DIRECTION
      ?auto_24765 - MODE
      ?auto_24767 - DIRECTION
      ?auto_24766 - MODE
      ?auto_24769 - DIRECTION
      ?auto_24768 - MODE
    )
    :vars
    (
      ?auto_24772 - INSTRUMENT
      ?auto_24774 - SATELLITE
      ?auto_24770 - DIRECTION
      ?auto_24773 - DIRECTION
      ?auto_24771 - INSTRUMENT
      ?auto_24775 - MODE
      ?auto_24776 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24772 ?auto_24774 ) ( SUPPORTS ?auto_24772 ?auto_24766 ) ( not ( = ?auto_24767 ?auto_24770 ) ) ( HAVE_IMAGE ?auto_24769 ?auto_24768 ) ( not ( = ?auto_24769 ?auto_24767 ) ) ( not ( = ?auto_24769 ?auto_24770 ) ) ( not ( = ?auto_24768 ?auto_24766 ) ) ( CALIBRATION_TARGET ?auto_24772 ?auto_24770 ) ( not ( = ?auto_24770 ?auto_24773 ) ) ( not ( = ?auto_24767 ?auto_24773 ) ) ( not ( = ?auto_24769 ?auto_24773 ) ) ( ON_BOARD ?auto_24771 ?auto_24774 ) ( not ( = ?auto_24772 ?auto_24771 ) ) ( SUPPORTS ?auto_24771 ?auto_24775 ) ( not ( = ?auto_24768 ?auto_24775 ) ) ( not ( = ?auto_24766 ?auto_24775 ) ) ( CALIBRATION_TARGET ?auto_24771 ?auto_24770 ) ( POINTING ?auto_24774 ?auto_24769 ) ( ON_BOARD ?auto_24776 ?auto_24774 ) ( POWER_ON ?auto_24776 ) ( not ( = ?auto_24772 ?auto_24776 ) ) ( not ( = ?auto_24771 ?auto_24776 ) ) ( HAVE_IMAGE ?auto_24764 ?auto_24765 ) ( not ( = ?auto_24764 ?auto_24767 ) ) ( not ( = ?auto_24764 ?auto_24769 ) ) ( not ( = ?auto_24764 ?auto_24770 ) ) ( not ( = ?auto_24764 ?auto_24773 ) ) ( not ( = ?auto_24765 ?auto_24766 ) ) ( not ( = ?auto_24765 ?auto_24768 ) ) ( not ( = ?auto_24765 ?auto_24775 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24769 ?auto_24768 ?auto_24767 ?auto_24766 )
      ( GET-3IMAGE-VERIFY ?auto_24764 ?auto_24765 ?auto_24767 ?auto_24766 ?auto_24769 ?auto_24768 ) )
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
      ?auto_24785 - INSTRUMENT
      ?auto_24786 - SATELLITE
      ?auto_24783 - DIRECTION
      ?auto_24784 - INSTRUMENT
      ?auto_24787 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24785 ?auto_24786 ) ( SUPPORTS ?auto_24785 ?auto_24779 ) ( not ( = ?auto_24780 ?auto_24783 ) ) ( HAVE_IMAGE ?auto_24777 ?auto_24778 ) ( not ( = ?auto_24777 ?auto_24780 ) ) ( not ( = ?auto_24777 ?auto_24783 ) ) ( not ( = ?auto_24778 ?auto_24779 ) ) ( CALIBRATION_TARGET ?auto_24785 ?auto_24783 ) ( not ( = ?auto_24783 ?auto_24782 ) ) ( not ( = ?auto_24780 ?auto_24782 ) ) ( not ( = ?auto_24777 ?auto_24782 ) ) ( ON_BOARD ?auto_24784 ?auto_24786 ) ( not ( = ?auto_24785 ?auto_24784 ) ) ( SUPPORTS ?auto_24784 ?auto_24781 ) ( not ( = ?auto_24778 ?auto_24781 ) ) ( not ( = ?auto_24779 ?auto_24781 ) ) ( CALIBRATION_TARGET ?auto_24784 ?auto_24783 ) ( POINTING ?auto_24786 ?auto_24777 ) ( ON_BOARD ?auto_24787 ?auto_24786 ) ( POWER_ON ?auto_24787 ) ( not ( = ?auto_24785 ?auto_24787 ) ) ( not ( = ?auto_24784 ?auto_24787 ) ) )
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
      ?auto_24809 - INSTRUMENT
      ?auto_24810 - SATELLITE
      ?auto_24807 - DIRECTION
      ?auto_24808 - INSTRUMENT
      ?auto_24811 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24809 ?auto_24810 ) ( SUPPORTS ?auto_24809 ?auto_24805 ) ( not ( = ?auto_24806 ?auto_24807 ) ) ( HAVE_IMAGE ?auto_24804 ?auto_24803 ) ( not ( = ?auto_24804 ?auto_24806 ) ) ( not ( = ?auto_24804 ?auto_24807 ) ) ( not ( = ?auto_24803 ?auto_24805 ) ) ( CALIBRATION_TARGET ?auto_24809 ?auto_24807 ) ( not ( = ?auto_24807 ?auto_24801 ) ) ( not ( = ?auto_24806 ?auto_24801 ) ) ( not ( = ?auto_24804 ?auto_24801 ) ) ( ON_BOARD ?auto_24808 ?auto_24810 ) ( not ( = ?auto_24809 ?auto_24808 ) ) ( SUPPORTS ?auto_24808 ?auto_24802 ) ( not ( = ?auto_24803 ?auto_24802 ) ) ( not ( = ?auto_24805 ?auto_24802 ) ) ( CALIBRATION_TARGET ?auto_24808 ?auto_24807 ) ( POINTING ?auto_24810 ?auto_24804 ) ( ON_BOARD ?auto_24811 ?auto_24810 ) ( POWER_ON ?auto_24811 ) ( not ( = ?auto_24809 ?auto_24811 ) ) ( not ( = ?auto_24808 ?auto_24811 ) ) )
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
      ?auto_24833 - INSTRUMENT
      ?auto_24834 - SATELLITE
      ?auto_24831 - DIRECTION
      ?auto_24832 - INSTRUMENT
      ?auto_24835 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24833 ?auto_24834 ) ( SUPPORTS ?auto_24833 ?auto_24827 ) ( not ( = ?auto_24828 ?auto_24831 ) ) ( HAVE_IMAGE ?auto_24830 ?auto_24829 ) ( not ( = ?auto_24830 ?auto_24828 ) ) ( not ( = ?auto_24830 ?auto_24831 ) ) ( not ( = ?auto_24829 ?auto_24827 ) ) ( CALIBRATION_TARGET ?auto_24833 ?auto_24831 ) ( not ( = ?auto_24831 ?auto_24825 ) ) ( not ( = ?auto_24828 ?auto_24825 ) ) ( not ( = ?auto_24830 ?auto_24825 ) ) ( ON_BOARD ?auto_24832 ?auto_24834 ) ( not ( = ?auto_24833 ?auto_24832 ) ) ( SUPPORTS ?auto_24832 ?auto_24826 ) ( not ( = ?auto_24829 ?auto_24826 ) ) ( not ( = ?auto_24827 ?auto_24826 ) ) ( CALIBRATION_TARGET ?auto_24832 ?auto_24831 ) ( POINTING ?auto_24834 ?auto_24830 ) ( ON_BOARD ?auto_24835 ?auto_24834 ) ( POWER_ON ?auto_24835 ) ( not ( = ?auto_24833 ?auto_24835 ) ) ( not ( = ?auto_24832 ?auto_24835 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24830 ?auto_24829 ?auto_24828 ?auto_24827 )
      ( GET-3IMAGE-VERIFY ?auto_24825 ?auto_24826 ?auto_24828 ?auto_24827 ?auto_24830 ?auto_24829 ) )
  )

  ( :method GET-3IMAGE
    :parameters
    (
      ?auto_24862 - DIRECTION
      ?auto_24863 - MODE
      ?auto_24865 - DIRECTION
      ?auto_24864 - MODE
      ?auto_24867 - DIRECTION
      ?auto_24866 - MODE
    )
    :vars
    (
      ?auto_24870 - INSTRUMENT
      ?auto_24872 - SATELLITE
      ?auto_24868 - DIRECTION
      ?auto_24871 - DIRECTION
      ?auto_24869 - INSTRUMENT
      ?auto_24873 - MODE
      ?auto_24874 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24870 ?auto_24872 ) ( SUPPORTS ?auto_24870 ?auto_24863 ) ( not ( = ?auto_24862 ?auto_24868 ) ) ( HAVE_IMAGE ?auto_24867 ?auto_24866 ) ( not ( = ?auto_24867 ?auto_24862 ) ) ( not ( = ?auto_24867 ?auto_24868 ) ) ( not ( = ?auto_24866 ?auto_24863 ) ) ( CALIBRATION_TARGET ?auto_24870 ?auto_24868 ) ( not ( = ?auto_24868 ?auto_24871 ) ) ( not ( = ?auto_24862 ?auto_24871 ) ) ( not ( = ?auto_24867 ?auto_24871 ) ) ( ON_BOARD ?auto_24869 ?auto_24872 ) ( not ( = ?auto_24870 ?auto_24869 ) ) ( SUPPORTS ?auto_24869 ?auto_24873 ) ( not ( = ?auto_24866 ?auto_24873 ) ) ( not ( = ?auto_24863 ?auto_24873 ) ) ( CALIBRATION_TARGET ?auto_24869 ?auto_24868 ) ( POINTING ?auto_24872 ?auto_24867 ) ( ON_BOARD ?auto_24874 ?auto_24872 ) ( POWER_ON ?auto_24874 ) ( not ( = ?auto_24870 ?auto_24874 ) ) ( not ( = ?auto_24869 ?auto_24874 ) ) ( HAVE_IMAGE ?auto_24865 ?auto_24864 ) ( not ( = ?auto_24862 ?auto_24865 ) ) ( not ( = ?auto_24863 ?auto_24864 ) ) ( not ( = ?auto_24865 ?auto_24867 ) ) ( not ( = ?auto_24865 ?auto_24868 ) ) ( not ( = ?auto_24865 ?auto_24871 ) ) ( not ( = ?auto_24864 ?auto_24866 ) ) ( not ( = ?auto_24864 ?auto_24873 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_24867 ?auto_24866 ?auto_24862 ?auto_24863 )
      ( GET-3IMAGE-VERIFY ?auto_24862 ?auto_24863 ?auto_24865 ?auto_24864 ?auto_24867 ?auto_24866 ) )
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
      ?auto_24883 - INSTRUMENT
      ?auto_24884 - SATELLITE
      ?auto_24881 - DIRECTION
      ?auto_24882 - INSTRUMENT
      ?auto_24885 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24883 ?auto_24884 ) ( SUPPORTS ?auto_24883 ?auto_24876 ) ( not ( = ?auto_24875 ?auto_24881 ) ) ( HAVE_IMAGE ?auto_24878 ?auto_24877 ) ( not ( = ?auto_24878 ?auto_24875 ) ) ( not ( = ?auto_24878 ?auto_24881 ) ) ( not ( = ?auto_24877 ?auto_24876 ) ) ( CALIBRATION_TARGET ?auto_24883 ?auto_24881 ) ( not ( = ?auto_24881 ?auto_24880 ) ) ( not ( = ?auto_24875 ?auto_24880 ) ) ( not ( = ?auto_24878 ?auto_24880 ) ) ( ON_BOARD ?auto_24882 ?auto_24884 ) ( not ( = ?auto_24883 ?auto_24882 ) ) ( SUPPORTS ?auto_24882 ?auto_24879 ) ( not ( = ?auto_24877 ?auto_24879 ) ) ( not ( = ?auto_24876 ?auto_24879 ) ) ( CALIBRATION_TARGET ?auto_24882 ?auto_24881 ) ( POINTING ?auto_24884 ?auto_24878 ) ( ON_BOARD ?auto_24885 ?auto_24884 ) ( POWER_ON ?auto_24885 ) ( not ( = ?auto_24883 ?auto_24885 ) ) ( not ( = ?auto_24882 ?auto_24885 ) ) )
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
      ?auto_24907 - INSTRUMENT
      ?auto_24908 - SATELLITE
      ?auto_24905 - DIRECTION
      ?auto_24906 - INSTRUMENT
      ?auto_24909 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24907 ?auto_24908 ) ( SUPPORTS ?auto_24907 ?auto_24900 ) ( not ( = ?auto_24899 ?auto_24905 ) ) ( HAVE_IMAGE ?auto_24904 ?auto_24903 ) ( not ( = ?auto_24904 ?auto_24899 ) ) ( not ( = ?auto_24904 ?auto_24905 ) ) ( not ( = ?auto_24903 ?auto_24900 ) ) ( CALIBRATION_TARGET ?auto_24907 ?auto_24905 ) ( not ( = ?auto_24905 ?auto_24902 ) ) ( not ( = ?auto_24899 ?auto_24902 ) ) ( not ( = ?auto_24904 ?auto_24902 ) ) ( ON_BOARD ?auto_24906 ?auto_24908 ) ( not ( = ?auto_24907 ?auto_24906 ) ) ( SUPPORTS ?auto_24906 ?auto_24901 ) ( not ( = ?auto_24903 ?auto_24901 ) ) ( not ( = ?auto_24900 ?auto_24901 ) ) ( CALIBRATION_TARGET ?auto_24906 ?auto_24905 ) ( POINTING ?auto_24908 ?auto_24904 ) ( ON_BOARD ?auto_24909 ?auto_24908 ) ( POWER_ON ?auto_24909 ) ( not ( = ?auto_24907 ?auto_24909 ) ) ( not ( = ?auto_24906 ?auto_24909 ) ) )
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
      ?auto_24983 - INSTRUMENT
      ?auto_24985 - SATELLITE
      ?auto_24979 - DIRECTION
      ?auto_24981 - DIRECTION
      ?auto_24980 - MODE
      ?auto_24984 - DIRECTION
      ?auto_24982 - INSTRUMENT
      ?auto_24986 - MODE
      ?auto_24987 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24983 ?auto_24985 ) ( SUPPORTS ?auto_24983 ?auto_24978 ) ( not ( = ?auto_24977 ?auto_24979 ) ) ( not ( = ?auto_24981 ?auto_24977 ) ) ( not ( = ?auto_24981 ?auto_24979 ) ) ( not ( = ?auto_24980 ?auto_24978 ) ) ( CALIBRATION_TARGET ?auto_24983 ?auto_24979 ) ( not ( = ?auto_24979 ?auto_24984 ) ) ( not ( = ?auto_24977 ?auto_24984 ) ) ( not ( = ?auto_24981 ?auto_24984 ) ) ( ON_BOARD ?auto_24982 ?auto_24985 ) ( not ( = ?auto_24983 ?auto_24982 ) ) ( SUPPORTS ?auto_24982 ?auto_24986 ) ( not ( = ?auto_24980 ?auto_24986 ) ) ( not ( = ?auto_24978 ?auto_24986 ) ) ( CALIBRATION_TARGET ?auto_24982 ?auto_24979 ) ( POINTING ?auto_24985 ?auto_24981 ) ( ON_BOARD ?auto_24987 ?auto_24985 ) ( POWER_ON ?auto_24987 ) ( not ( = ?auto_24983 ?auto_24987 ) ) ( not ( = ?auto_24982 ?auto_24987 ) ) ( CALIBRATED ?auto_24987 ) ( SUPPORTS ?auto_24987 ?auto_24980 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_24981 ?auto_24980 )
      ( GET-2IMAGE ?auto_24981 ?auto_24980 ?auto_24977 ?auto_24978 )
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
      ?auto_24995 - INSTRUMENT
      ?auto_24993 - SATELLITE
      ?auto_24996 - DIRECTION
      ?auto_24997 - DIRECTION
      ?auto_24992 - INSTRUMENT
      ?auto_24994 - MODE
      ?auto_24998 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_24995 ?auto_24993 ) ( SUPPORTS ?auto_24995 ?auto_24990 ) ( not ( = ?auto_24991 ?auto_24996 ) ) ( not ( = ?auto_24988 ?auto_24991 ) ) ( not ( = ?auto_24988 ?auto_24996 ) ) ( not ( = ?auto_24989 ?auto_24990 ) ) ( CALIBRATION_TARGET ?auto_24995 ?auto_24996 ) ( not ( = ?auto_24996 ?auto_24997 ) ) ( not ( = ?auto_24991 ?auto_24997 ) ) ( not ( = ?auto_24988 ?auto_24997 ) ) ( ON_BOARD ?auto_24992 ?auto_24993 ) ( not ( = ?auto_24995 ?auto_24992 ) ) ( SUPPORTS ?auto_24992 ?auto_24994 ) ( not ( = ?auto_24989 ?auto_24994 ) ) ( not ( = ?auto_24990 ?auto_24994 ) ) ( CALIBRATION_TARGET ?auto_24992 ?auto_24996 ) ( POINTING ?auto_24993 ?auto_24988 ) ( ON_BOARD ?auto_24998 ?auto_24993 ) ( POWER_ON ?auto_24998 ) ( not ( = ?auto_24995 ?auto_24998 ) ) ( not ( = ?auto_24992 ?auto_24998 ) ) ( CALIBRATED ?auto_24998 ) ( SUPPORTS ?auto_24998 ?auto_24989 ) )
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
      ?auto_25005 - INSTRUMENT
      ?auto_25004 - SATELLITE
      ?auto_25006 - DIRECTION
      ?auto_25009 - DIRECTION
      ?auto_25008 - MODE
      ?auto_25003 - INSTRUMENT
      ?auto_25007 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25005 ?auto_25004 ) ( SUPPORTS ?auto_25005 ?auto_25001 ) ( not ( = ?auto_25002 ?auto_25006 ) ) ( not ( = ?auto_25009 ?auto_25002 ) ) ( not ( = ?auto_25009 ?auto_25006 ) ) ( not ( = ?auto_25008 ?auto_25001 ) ) ( CALIBRATION_TARGET ?auto_25005 ?auto_25006 ) ( not ( = ?auto_25006 ?auto_24999 ) ) ( not ( = ?auto_25002 ?auto_24999 ) ) ( not ( = ?auto_25009 ?auto_24999 ) ) ( ON_BOARD ?auto_25003 ?auto_25004 ) ( not ( = ?auto_25005 ?auto_25003 ) ) ( SUPPORTS ?auto_25003 ?auto_25000 ) ( not ( = ?auto_25008 ?auto_25000 ) ) ( not ( = ?auto_25001 ?auto_25000 ) ) ( CALIBRATION_TARGET ?auto_25003 ?auto_25006 ) ( POINTING ?auto_25004 ?auto_25009 ) ( ON_BOARD ?auto_25007 ?auto_25004 ) ( POWER_ON ?auto_25007 ) ( not ( = ?auto_25005 ?auto_25007 ) ) ( not ( = ?auto_25003 ?auto_25007 ) ) ( CALIBRATED ?auto_25007 ) ( SUPPORTS ?auto_25007 ?auto_25008 ) )
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
      ?auto_25017 - INSTRUMENT
      ?auto_25016 - SATELLITE
      ?auto_25018 - DIRECTION
      ?auto_25014 - DIRECTION
      ?auto_25015 - INSTRUMENT
      ?auto_25019 - MODE
      ?auto_25020 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25017 ?auto_25016 ) ( SUPPORTS ?auto_25017 ?auto_25011 ) ( not ( = ?auto_25010 ?auto_25018 ) ) ( not ( = ?auto_25013 ?auto_25010 ) ) ( not ( = ?auto_25013 ?auto_25018 ) ) ( not ( = ?auto_25012 ?auto_25011 ) ) ( CALIBRATION_TARGET ?auto_25017 ?auto_25018 ) ( not ( = ?auto_25018 ?auto_25014 ) ) ( not ( = ?auto_25010 ?auto_25014 ) ) ( not ( = ?auto_25013 ?auto_25014 ) ) ( ON_BOARD ?auto_25015 ?auto_25016 ) ( not ( = ?auto_25017 ?auto_25015 ) ) ( SUPPORTS ?auto_25015 ?auto_25019 ) ( not ( = ?auto_25012 ?auto_25019 ) ) ( not ( = ?auto_25011 ?auto_25019 ) ) ( CALIBRATION_TARGET ?auto_25015 ?auto_25018 ) ( POINTING ?auto_25016 ?auto_25013 ) ( ON_BOARD ?auto_25020 ?auto_25016 ) ( POWER_ON ?auto_25020 ) ( not ( = ?auto_25017 ?auto_25020 ) ) ( not ( = ?auto_25015 ?auto_25020 ) ) ( CALIBRATED ?auto_25020 ) ( SUPPORTS ?auto_25020 ?auto_25012 ) )
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
      ?auto_25027 - INSTRUMENT
      ?auto_25026 - SATELLITE
      ?auto_25028 - DIRECTION
      ?auto_25031 - DIRECTION
      ?auto_25030 - MODE
      ?auto_25025 - INSTRUMENT
      ?auto_25029 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25027 ?auto_25026 ) ( SUPPORTS ?auto_25027 ?auto_25022 ) ( not ( = ?auto_25021 ?auto_25028 ) ) ( not ( = ?auto_25031 ?auto_25021 ) ) ( not ( = ?auto_25031 ?auto_25028 ) ) ( not ( = ?auto_25030 ?auto_25022 ) ) ( CALIBRATION_TARGET ?auto_25027 ?auto_25028 ) ( not ( = ?auto_25028 ?auto_25024 ) ) ( not ( = ?auto_25021 ?auto_25024 ) ) ( not ( = ?auto_25031 ?auto_25024 ) ) ( ON_BOARD ?auto_25025 ?auto_25026 ) ( not ( = ?auto_25027 ?auto_25025 ) ) ( SUPPORTS ?auto_25025 ?auto_25023 ) ( not ( = ?auto_25030 ?auto_25023 ) ) ( not ( = ?auto_25022 ?auto_25023 ) ) ( CALIBRATION_TARGET ?auto_25025 ?auto_25028 ) ( POINTING ?auto_25026 ?auto_25031 ) ( ON_BOARD ?auto_25029 ?auto_25026 ) ( POWER_ON ?auto_25029 ) ( not ( = ?auto_25027 ?auto_25029 ) ) ( not ( = ?auto_25025 ?auto_25029 ) ) ( CALIBRATED ?auto_25029 ) ( SUPPORTS ?auto_25029 ?auto_25030 ) )
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
      ?auto_25066 - INSTRUMENT
      ?auto_25065 - SATELLITE
      ?auto_25067 - DIRECTION
      ?auto_25064 - INSTRUMENT
      ?auto_25068 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25066 ?auto_25065 ) ( SUPPORTS ?auto_25066 ?auto_25062 ) ( not ( = ?auto_25063 ?auto_25067 ) ) ( not ( = ?auto_25058 ?auto_25063 ) ) ( not ( = ?auto_25058 ?auto_25067 ) ) ( not ( = ?auto_25059 ?auto_25062 ) ) ( CALIBRATION_TARGET ?auto_25066 ?auto_25067 ) ( not ( = ?auto_25067 ?auto_25061 ) ) ( not ( = ?auto_25063 ?auto_25061 ) ) ( not ( = ?auto_25058 ?auto_25061 ) ) ( ON_BOARD ?auto_25064 ?auto_25065 ) ( not ( = ?auto_25066 ?auto_25064 ) ) ( SUPPORTS ?auto_25064 ?auto_25060 ) ( not ( = ?auto_25059 ?auto_25060 ) ) ( not ( = ?auto_25062 ?auto_25060 ) ) ( CALIBRATION_TARGET ?auto_25064 ?auto_25067 ) ( POINTING ?auto_25065 ?auto_25058 ) ( ON_BOARD ?auto_25068 ?auto_25065 ) ( POWER_ON ?auto_25068 ) ( not ( = ?auto_25066 ?auto_25068 ) ) ( not ( = ?auto_25064 ?auto_25068 ) ) ( CALIBRATED ?auto_25068 ) ( SUPPORTS ?auto_25068 ?auto_25059 ) )
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
      ?auto_25090 - INSTRUMENT
      ?auto_25089 - SATELLITE
      ?auto_25091 - DIRECTION
      ?auto_25088 - INSTRUMENT
      ?auto_25092 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25090 ?auto_25089 ) ( SUPPORTS ?auto_25090 ?auto_25084 ) ( not ( = ?auto_25085 ?auto_25091 ) ) ( not ( = ?auto_25082 ?auto_25085 ) ) ( not ( = ?auto_25082 ?auto_25091 ) ) ( not ( = ?auto_25083 ?auto_25084 ) ) ( CALIBRATION_TARGET ?auto_25090 ?auto_25091 ) ( not ( = ?auto_25091 ?auto_25087 ) ) ( not ( = ?auto_25085 ?auto_25087 ) ) ( not ( = ?auto_25082 ?auto_25087 ) ) ( ON_BOARD ?auto_25088 ?auto_25089 ) ( not ( = ?auto_25090 ?auto_25088 ) ) ( SUPPORTS ?auto_25088 ?auto_25086 ) ( not ( = ?auto_25083 ?auto_25086 ) ) ( not ( = ?auto_25084 ?auto_25086 ) ) ( CALIBRATION_TARGET ?auto_25088 ?auto_25091 ) ( POINTING ?auto_25089 ?auto_25082 ) ( ON_BOARD ?auto_25092 ?auto_25089 ) ( POWER_ON ?auto_25092 ) ( not ( = ?auto_25090 ?auto_25092 ) ) ( not ( = ?auto_25088 ?auto_25092 ) ) ( CALIBRATED ?auto_25092 ) ( SUPPORTS ?auto_25092 ?auto_25083 ) )
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
      ?auto_25114 - INSTRUMENT
      ?auto_25113 - SATELLITE
      ?auto_25115 - DIRECTION
      ?auto_25112 - INSTRUMENT
      ?auto_25116 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25114 ?auto_25113 ) ( SUPPORTS ?auto_25114 ?auto_25110 ) ( not ( = ?auto_25111 ?auto_25115 ) ) ( not ( = ?auto_25109 ?auto_25111 ) ) ( not ( = ?auto_25109 ?auto_25115 ) ) ( not ( = ?auto_25108 ?auto_25110 ) ) ( CALIBRATION_TARGET ?auto_25114 ?auto_25115 ) ( not ( = ?auto_25115 ?auto_25106 ) ) ( not ( = ?auto_25111 ?auto_25106 ) ) ( not ( = ?auto_25109 ?auto_25106 ) ) ( ON_BOARD ?auto_25112 ?auto_25113 ) ( not ( = ?auto_25114 ?auto_25112 ) ) ( SUPPORTS ?auto_25112 ?auto_25107 ) ( not ( = ?auto_25108 ?auto_25107 ) ) ( not ( = ?auto_25110 ?auto_25107 ) ) ( CALIBRATION_TARGET ?auto_25112 ?auto_25115 ) ( POINTING ?auto_25113 ?auto_25109 ) ( ON_BOARD ?auto_25116 ?auto_25113 ) ( POWER_ON ?auto_25116 ) ( not ( = ?auto_25114 ?auto_25116 ) ) ( not ( = ?auto_25112 ?auto_25116 ) ) ( CALIBRATED ?auto_25116 ) ( SUPPORTS ?auto_25116 ?auto_25108 ) )
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
      ?auto_25138 - INSTRUMENT
      ?auto_25137 - SATELLITE
      ?auto_25139 - DIRECTION
      ?auto_25136 - INSTRUMENT
      ?auto_25140 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25138 ?auto_25137 ) ( SUPPORTS ?auto_25138 ?auto_25132 ) ( not ( = ?auto_25133 ?auto_25139 ) ) ( not ( = ?auto_25135 ?auto_25133 ) ) ( not ( = ?auto_25135 ?auto_25139 ) ) ( not ( = ?auto_25134 ?auto_25132 ) ) ( CALIBRATION_TARGET ?auto_25138 ?auto_25139 ) ( not ( = ?auto_25139 ?auto_25130 ) ) ( not ( = ?auto_25133 ?auto_25130 ) ) ( not ( = ?auto_25135 ?auto_25130 ) ) ( ON_BOARD ?auto_25136 ?auto_25137 ) ( not ( = ?auto_25138 ?auto_25136 ) ) ( SUPPORTS ?auto_25136 ?auto_25131 ) ( not ( = ?auto_25134 ?auto_25131 ) ) ( not ( = ?auto_25132 ?auto_25131 ) ) ( CALIBRATION_TARGET ?auto_25136 ?auto_25139 ) ( POINTING ?auto_25137 ?auto_25135 ) ( ON_BOARD ?auto_25140 ?auto_25137 ) ( POWER_ON ?auto_25140 ) ( not ( = ?auto_25138 ?auto_25140 ) ) ( not ( = ?auto_25136 ?auto_25140 ) ) ( CALIBRATED ?auto_25140 ) ( SUPPORTS ?auto_25140 ?auto_25134 ) )
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
      ?auto_25188 - INSTRUMENT
      ?auto_25187 - SATELLITE
      ?auto_25189 - DIRECTION
      ?auto_25186 - INSTRUMENT
      ?auto_25190 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25188 ?auto_25187 ) ( SUPPORTS ?auto_25188 ?auto_25181 ) ( not ( = ?auto_25180 ?auto_25189 ) ) ( not ( = ?auto_25183 ?auto_25180 ) ) ( not ( = ?auto_25183 ?auto_25189 ) ) ( not ( = ?auto_25182 ?auto_25181 ) ) ( CALIBRATION_TARGET ?auto_25188 ?auto_25189 ) ( not ( = ?auto_25189 ?auto_25185 ) ) ( not ( = ?auto_25180 ?auto_25185 ) ) ( not ( = ?auto_25183 ?auto_25185 ) ) ( ON_BOARD ?auto_25186 ?auto_25187 ) ( not ( = ?auto_25188 ?auto_25186 ) ) ( SUPPORTS ?auto_25186 ?auto_25184 ) ( not ( = ?auto_25182 ?auto_25184 ) ) ( not ( = ?auto_25181 ?auto_25184 ) ) ( CALIBRATION_TARGET ?auto_25186 ?auto_25189 ) ( POINTING ?auto_25187 ?auto_25183 ) ( ON_BOARD ?auto_25190 ?auto_25187 ) ( POWER_ON ?auto_25190 ) ( not ( = ?auto_25188 ?auto_25190 ) ) ( not ( = ?auto_25186 ?auto_25190 ) ) ( CALIBRATED ?auto_25190 ) ( SUPPORTS ?auto_25190 ?auto_25182 ) )
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
      ?auto_25212 - INSTRUMENT
      ?auto_25211 - SATELLITE
      ?auto_25213 - DIRECTION
      ?auto_25210 - INSTRUMENT
      ?auto_25214 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25212 ?auto_25211 ) ( SUPPORTS ?auto_25212 ?auto_25205 ) ( not ( = ?auto_25204 ?auto_25213 ) ) ( not ( = ?auto_25209 ?auto_25204 ) ) ( not ( = ?auto_25209 ?auto_25213 ) ) ( not ( = ?auto_25208 ?auto_25205 ) ) ( CALIBRATION_TARGET ?auto_25212 ?auto_25213 ) ( not ( = ?auto_25213 ?auto_25207 ) ) ( not ( = ?auto_25204 ?auto_25207 ) ) ( not ( = ?auto_25209 ?auto_25207 ) ) ( ON_BOARD ?auto_25210 ?auto_25211 ) ( not ( = ?auto_25212 ?auto_25210 ) ) ( SUPPORTS ?auto_25210 ?auto_25206 ) ( not ( = ?auto_25208 ?auto_25206 ) ) ( not ( = ?auto_25205 ?auto_25206 ) ) ( CALIBRATION_TARGET ?auto_25210 ?auto_25213 ) ( POINTING ?auto_25211 ?auto_25209 ) ( ON_BOARD ?auto_25214 ?auto_25211 ) ( POWER_ON ?auto_25214 ) ( not ( = ?auto_25212 ?auto_25214 ) ) ( not ( = ?auto_25210 ?auto_25214 ) ) ( CALIBRATED ?auto_25214 ) ( SUPPORTS ?auto_25214 ?auto_25208 ) )
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
      ?auto_25287 - INSTRUMENT
      ?auto_25286 - SATELLITE
      ?auto_25288 - DIRECTION
      ?auto_25292 - DIRECTION
      ?auto_25291 - MODE
      ?auto_25284 - DIRECTION
      ?auto_25285 - INSTRUMENT
      ?auto_25289 - MODE
      ?auto_25290 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25287 ?auto_25286 ) ( SUPPORTS ?auto_25287 ?auto_25283 ) ( not ( = ?auto_25282 ?auto_25288 ) ) ( not ( = ?auto_25292 ?auto_25282 ) ) ( not ( = ?auto_25292 ?auto_25288 ) ) ( not ( = ?auto_25291 ?auto_25283 ) ) ( CALIBRATION_TARGET ?auto_25287 ?auto_25288 ) ( not ( = ?auto_25288 ?auto_25284 ) ) ( not ( = ?auto_25282 ?auto_25284 ) ) ( not ( = ?auto_25292 ?auto_25284 ) ) ( ON_BOARD ?auto_25285 ?auto_25286 ) ( not ( = ?auto_25287 ?auto_25285 ) ) ( SUPPORTS ?auto_25285 ?auto_25289 ) ( not ( = ?auto_25291 ?auto_25289 ) ) ( not ( = ?auto_25283 ?auto_25289 ) ) ( CALIBRATION_TARGET ?auto_25285 ?auto_25288 ) ( ON_BOARD ?auto_25290 ?auto_25286 ) ( POWER_ON ?auto_25290 ) ( not ( = ?auto_25287 ?auto_25290 ) ) ( not ( = ?auto_25285 ?auto_25290 ) ) ( CALIBRATED ?auto_25290 ) ( SUPPORTS ?auto_25290 ?auto_25291 ) ( POINTING ?auto_25286 ?auto_25288 ) )
    :subtasks
    ( ( !TURN_TO ?auto_25286 ?auto_25292 ?auto_25288 )
      ( GET-2IMAGE ?auto_25292 ?auto_25291 ?auto_25282 ?auto_25283 )
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
      ?auto_25298 - INSTRUMENT
      ?auto_25302 - SATELLITE
      ?auto_25297 - DIRECTION
      ?auto_25301 - DIRECTION
      ?auto_25299 - INSTRUMENT
      ?auto_25303 - MODE
      ?auto_25300 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25298 ?auto_25302 ) ( SUPPORTS ?auto_25298 ?auto_25295 ) ( not ( = ?auto_25296 ?auto_25297 ) ) ( not ( = ?auto_25293 ?auto_25296 ) ) ( not ( = ?auto_25293 ?auto_25297 ) ) ( not ( = ?auto_25294 ?auto_25295 ) ) ( CALIBRATION_TARGET ?auto_25298 ?auto_25297 ) ( not ( = ?auto_25297 ?auto_25301 ) ) ( not ( = ?auto_25296 ?auto_25301 ) ) ( not ( = ?auto_25293 ?auto_25301 ) ) ( ON_BOARD ?auto_25299 ?auto_25302 ) ( not ( = ?auto_25298 ?auto_25299 ) ) ( SUPPORTS ?auto_25299 ?auto_25303 ) ( not ( = ?auto_25294 ?auto_25303 ) ) ( not ( = ?auto_25295 ?auto_25303 ) ) ( CALIBRATION_TARGET ?auto_25299 ?auto_25297 ) ( ON_BOARD ?auto_25300 ?auto_25302 ) ( POWER_ON ?auto_25300 ) ( not ( = ?auto_25298 ?auto_25300 ) ) ( not ( = ?auto_25299 ?auto_25300 ) ) ( CALIBRATED ?auto_25300 ) ( SUPPORTS ?auto_25300 ?auto_25294 ) ( POINTING ?auto_25302 ?auto_25297 ) )
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
      ?auto_25311 - INSTRUMENT
      ?auto_25308 - SATELLITE
      ?auto_25312 - DIRECTION
      ?auto_25314 - DIRECTION
      ?auto_25313 - MODE
      ?auto_25309 - INSTRUMENT
      ?auto_25310 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25311 ?auto_25308 ) ( SUPPORTS ?auto_25311 ?auto_25306 ) ( not ( = ?auto_25307 ?auto_25312 ) ) ( not ( = ?auto_25314 ?auto_25307 ) ) ( not ( = ?auto_25314 ?auto_25312 ) ) ( not ( = ?auto_25313 ?auto_25306 ) ) ( CALIBRATION_TARGET ?auto_25311 ?auto_25312 ) ( not ( = ?auto_25312 ?auto_25304 ) ) ( not ( = ?auto_25307 ?auto_25304 ) ) ( not ( = ?auto_25314 ?auto_25304 ) ) ( ON_BOARD ?auto_25309 ?auto_25308 ) ( not ( = ?auto_25311 ?auto_25309 ) ) ( SUPPORTS ?auto_25309 ?auto_25305 ) ( not ( = ?auto_25313 ?auto_25305 ) ) ( not ( = ?auto_25306 ?auto_25305 ) ) ( CALIBRATION_TARGET ?auto_25309 ?auto_25312 ) ( ON_BOARD ?auto_25310 ?auto_25308 ) ( POWER_ON ?auto_25310 ) ( not ( = ?auto_25311 ?auto_25310 ) ) ( not ( = ?auto_25309 ?auto_25310 ) ) ( CALIBRATED ?auto_25310 ) ( SUPPORTS ?auto_25310 ?auto_25313 ) ( POINTING ?auto_25308 ?auto_25312 ) )
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
      ?auto_25323 - INSTRUMENT
      ?auto_25319 - SATELLITE
      ?auto_25325 - DIRECTION
      ?auto_25324 - DIRECTION
      ?auto_25320 - INSTRUMENT
      ?auto_25322 - MODE
      ?auto_25321 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25323 ?auto_25319 ) ( SUPPORTS ?auto_25323 ?auto_25316 ) ( not ( = ?auto_25315 ?auto_25325 ) ) ( not ( = ?auto_25318 ?auto_25315 ) ) ( not ( = ?auto_25318 ?auto_25325 ) ) ( not ( = ?auto_25317 ?auto_25316 ) ) ( CALIBRATION_TARGET ?auto_25323 ?auto_25325 ) ( not ( = ?auto_25325 ?auto_25324 ) ) ( not ( = ?auto_25315 ?auto_25324 ) ) ( not ( = ?auto_25318 ?auto_25324 ) ) ( ON_BOARD ?auto_25320 ?auto_25319 ) ( not ( = ?auto_25323 ?auto_25320 ) ) ( SUPPORTS ?auto_25320 ?auto_25322 ) ( not ( = ?auto_25317 ?auto_25322 ) ) ( not ( = ?auto_25316 ?auto_25322 ) ) ( CALIBRATION_TARGET ?auto_25320 ?auto_25325 ) ( ON_BOARD ?auto_25321 ?auto_25319 ) ( POWER_ON ?auto_25321 ) ( not ( = ?auto_25323 ?auto_25321 ) ) ( not ( = ?auto_25320 ?auto_25321 ) ) ( CALIBRATED ?auto_25321 ) ( SUPPORTS ?auto_25321 ?auto_25317 ) ( POINTING ?auto_25319 ?auto_25325 ) )
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
      ?auto_25333 - INSTRUMENT
      ?auto_25330 - SATELLITE
      ?auto_25334 - DIRECTION
      ?auto_25336 - DIRECTION
      ?auto_25335 - MODE
      ?auto_25331 - INSTRUMENT
      ?auto_25332 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25333 ?auto_25330 ) ( SUPPORTS ?auto_25333 ?auto_25327 ) ( not ( = ?auto_25326 ?auto_25334 ) ) ( not ( = ?auto_25336 ?auto_25326 ) ) ( not ( = ?auto_25336 ?auto_25334 ) ) ( not ( = ?auto_25335 ?auto_25327 ) ) ( CALIBRATION_TARGET ?auto_25333 ?auto_25334 ) ( not ( = ?auto_25334 ?auto_25329 ) ) ( not ( = ?auto_25326 ?auto_25329 ) ) ( not ( = ?auto_25336 ?auto_25329 ) ) ( ON_BOARD ?auto_25331 ?auto_25330 ) ( not ( = ?auto_25333 ?auto_25331 ) ) ( SUPPORTS ?auto_25331 ?auto_25328 ) ( not ( = ?auto_25335 ?auto_25328 ) ) ( not ( = ?auto_25327 ?auto_25328 ) ) ( CALIBRATION_TARGET ?auto_25331 ?auto_25334 ) ( ON_BOARD ?auto_25332 ?auto_25330 ) ( POWER_ON ?auto_25332 ) ( not ( = ?auto_25333 ?auto_25332 ) ) ( not ( = ?auto_25331 ?auto_25332 ) ) ( CALIBRATED ?auto_25332 ) ( SUPPORTS ?auto_25332 ?auto_25335 ) ( POINTING ?auto_25330 ?auto_25334 ) )
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
      ?auto_25372 - INSTRUMENT
      ?auto_25369 - SATELLITE
      ?auto_25373 - DIRECTION
      ?auto_25370 - INSTRUMENT
      ?auto_25371 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25372 ?auto_25369 ) ( SUPPORTS ?auto_25372 ?auto_25367 ) ( not ( = ?auto_25368 ?auto_25373 ) ) ( not ( = ?auto_25363 ?auto_25368 ) ) ( not ( = ?auto_25363 ?auto_25373 ) ) ( not ( = ?auto_25364 ?auto_25367 ) ) ( CALIBRATION_TARGET ?auto_25372 ?auto_25373 ) ( not ( = ?auto_25373 ?auto_25366 ) ) ( not ( = ?auto_25368 ?auto_25366 ) ) ( not ( = ?auto_25363 ?auto_25366 ) ) ( ON_BOARD ?auto_25370 ?auto_25369 ) ( not ( = ?auto_25372 ?auto_25370 ) ) ( SUPPORTS ?auto_25370 ?auto_25365 ) ( not ( = ?auto_25364 ?auto_25365 ) ) ( not ( = ?auto_25367 ?auto_25365 ) ) ( CALIBRATION_TARGET ?auto_25370 ?auto_25373 ) ( ON_BOARD ?auto_25371 ?auto_25369 ) ( POWER_ON ?auto_25371 ) ( not ( = ?auto_25372 ?auto_25371 ) ) ( not ( = ?auto_25370 ?auto_25371 ) ) ( CALIBRATED ?auto_25371 ) ( SUPPORTS ?auto_25371 ?auto_25364 ) ( POINTING ?auto_25369 ?auto_25373 ) )
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
      ?auto_25396 - INSTRUMENT
      ?auto_25393 - SATELLITE
      ?auto_25397 - DIRECTION
      ?auto_25394 - INSTRUMENT
      ?auto_25395 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25396 ?auto_25393 ) ( SUPPORTS ?auto_25396 ?auto_25389 ) ( not ( = ?auto_25390 ?auto_25397 ) ) ( not ( = ?auto_25387 ?auto_25390 ) ) ( not ( = ?auto_25387 ?auto_25397 ) ) ( not ( = ?auto_25388 ?auto_25389 ) ) ( CALIBRATION_TARGET ?auto_25396 ?auto_25397 ) ( not ( = ?auto_25397 ?auto_25392 ) ) ( not ( = ?auto_25390 ?auto_25392 ) ) ( not ( = ?auto_25387 ?auto_25392 ) ) ( ON_BOARD ?auto_25394 ?auto_25393 ) ( not ( = ?auto_25396 ?auto_25394 ) ) ( SUPPORTS ?auto_25394 ?auto_25391 ) ( not ( = ?auto_25388 ?auto_25391 ) ) ( not ( = ?auto_25389 ?auto_25391 ) ) ( CALIBRATION_TARGET ?auto_25394 ?auto_25397 ) ( ON_BOARD ?auto_25395 ?auto_25393 ) ( POWER_ON ?auto_25395 ) ( not ( = ?auto_25396 ?auto_25395 ) ) ( not ( = ?auto_25394 ?auto_25395 ) ) ( CALIBRATED ?auto_25395 ) ( SUPPORTS ?auto_25395 ?auto_25388 ) ( POINTING ?auto_25393 ?auto_25397 ) )
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
      ?auto_25420 - INSTRUMENT
      ?auto_25417 - SATELLITE
      ?auto_25421 - DIRECTION
      ?auto_25418 - INSTRUMENT
      ?auto_25419 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25420 ?auto_25417 ) ( SUPPORTS ?auto_25420 ?auto_25415 ) ( not ( = ?auto_25416 ?auto_25421 ) ) ( not ( = ?auto_25414 ?auto_25416 ) ) ( not ( = ?auto_25414 ?auto_25421 ) ) ( not ( = ?auto_25413 ?auto_25415 ) ) ( CALIBRATION_TARGET ?auto_25420 ?auto_25421 ) ( not ( = ?auto_25421 ?auto_25411 ) ) ( not ( = ?auto_25416 ?auto_25411 ) ) ( not ( = ?auto_25414 ?auto_25411 ) ) ( ON_BOARD ?auto_25418 ?auto_25417 ) ( not ( = ?auto_25420 ?auto_25418 ) ) ( SUPPORTS ?auto_25418 ?auto_25412 ) ( not ( = ?auto_25413 ?auto_25412 ) ) ( not ( = ?auto_25415 ?auto_25412 ) ) ( CALIBRATION_TARGET ?auto_25418 ?auto_25421 ) ( ON_BOARD ?auto_25419 ?auto_25417 ) ( POWER_ON ?auto_25419 ) ( not ( = ?auto_25420 ?auto_25419 ) ) ( not ( = ?auto_25418 ?auto_25419 ) ) ( CALIBRATED ?auto_25419 ) ( SUPPORTS ?auto_25419 ?auto_25413 ) ( POINTING ?auto_25417 ?auto_25421 ) )
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
      ?auto_25444 - INSTRUMENT
      ?auto_25441 - SATELLITE
      ?auto_25445 - DIRECTION
      ?auto_25442 - INSTRUMENT
      ?auto_25443 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25444 ?auto_25441 ) ( SUPPORTS ?auto_25444 ?auto_25437 ) ( not ( = ?auto_25438 ?auto_25445 ) ) ( not ( = ?auto_25440 ?auto_25438 ) ) ( not ( = ?auto_25440 ?auto_25445 ) ) ( not ( = ?auto_25439 ?auto_25437 ) ) ( CALIBRATION_TARGET ?auto_25444 ?auto_25445 ) ( not ( = ?auto_25445 ?auto_25435 ) ) ( not ( = ?auto_25438 ?auto_25435 ) ) ( not ( = ?auto_25440 ?auto_25435 ) ) ( ON_BOARD ?auto_25442 ?auto_25441 ) ( not ( = ?auto_25444 ?auto_25442 ) ) ( SUPPORTS ?auto_25442 ?auto_25436 ) ( not ( = ?auto_25439 ?auto_25436 ) ) ( not ( = ?auto_25437 ?auto_25436 ) ) ( CALIBRATION_TARGET ?auto_25442 ?auto_25445 ) ( ON_BOARD ?auto_25443 ?auto_25441 ) ( POWER_ON ?auto_25443 ) ( not ( = ?auto_25444 ?auto_25443 ) ) ( not ( = ?auto_25442 ?auto_25443 ) ) ( CALIBRATED ?auto_25443 ) ( SUPPORTS ?auto_25443 ?auto_25439 ) ( POINTING ?auto_25441 ?auto_25445 ) )
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
      ?auto_25494 - INSTRUMENT
      ?auto_25491 - SATELLITE
      ?auto_25495 - DIRECTION
      ?auto_25492 - INSTRUMENT
      ?auto_25493 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25494 ?auto_25491 ) ( SUPPORTS ?auto_25494 ?auto_25486 ) ( not ( = ?auto_25485 ?auto_25495 ) ) ( not ( = ?auto_25488 ?auto_25485 ) ) ( not ( = ?auto_25488 ?auto_25495 ) ) ( not ( = ?auto_25487 ?auto_25486 ) ) ( CALIBRATION_TARGET ?auto_25494 ?auto_25495 ) ( not ( = ?auto_25495 ?auto_25490 ) ) ( not ( = ?auto_25485 ?auto_25490 ) ) ( not ( = ?auto_25488 ?auto_25490 ) ) ( ON_BOARD ?auto_25492 ?auto_25491 ) ( not ( = ?auto_25494 ?auto_25492 ) ) ( SUPPORTS ?auto_25492 ?auto_25489 ) ( not ( = ?auto_25487 ?auto_25489 ) ) ( not ( = ?auto_25486 ?auto_25489 ) ) ( CALIBRATION_TARGET ?auto_25492 ?auto_25495 ) ( ON_BOARD ?auto_25493 ?auto_25491 ) ( POWER_ON ?auto_25493 ) ( not ( = ?auto_25494 ?auto_25493 ) ) ( not ( = ?auto_25492 ?auto_25493 ) ) ( CALIBRATED ?auto_25493 ) ( SUPPORTS ?auto_25493 ?auto_25487 ) ( POINTING ?auto_25491 ?auto_25495 ) )
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
      ?auto_25518 - INSTRUMENT
      ?auto_25515 - SATELLITE
      ?auto_25519 - DIRECTION
      ?auto_25516 - INSTRUMENT
      ?auto_25517 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25518 ?auto_25515 ) ( SUPPORTS ?auto_25518 ?auto_25510 ) ( not ( = ?auto_25509 ?auto_25519 ) ) ( not ( = ?auto_25514 ?auto_25509 ) ) ( not ( = ?auto_25514 ?auto_25519 ) ) ( not ( = ?auto_25513 ?auto_25510 ) ) ( CALIBRATION_TARGET ?auto_25518 ?auto_25519 ) ( not ( = ?auto_25519 ?auto_25512 ) ) ( not ( = ?auto_25509 ?auto_25512 ) ) ( not ( = ?auto_25514 ?auto_25512 ) ) ( ON_BOARD ?auto_25516 ?auto_25515 ) ( not ( = ?auto_25518 ?auto_25516 ) ) ( SUPPORTS ?auto_25516 ?auto_25511 ) ( not ( = ?auto_25513 ?auto_25511 ) ) ( not ( = ?auto_25510 ?auto_25511 ) ) ( CALIBRATION_TARGET ?auto_25516 ?auto_25519 ) ( ON_BOARD ?auto_25517 ?auto_25515 ) ( POWER_ON ?auto_25517 ) ( not ( = ?auto_25518 ?auto_25517 ) ) ( not ( = ?auto_25516 ?auto_25517 ) ) ( CALIBRATED ?auto_25517 ) ( SUPPORTS ?auto_25517 ?auto_25513 ) ( POINTING ?auto_25515 ?auto_25519 ) )
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
      ?auto_25593 - INSTRUMENT
      ?auto_25589 - SATELLITE
      ?auto_25595 - DIRECTION
      ?auto_25597 - DIRECTION
      ?auto_25596 - MODE
      ?auto_25594 - DIRECTION
      ?auto_25590 - INSTRUMENT
      ?auto_25592 - MODE
      ?auto_25591 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25593 ?auto_25589 ) ( SUPPORTS ?auto_25593 ?auto_25588 ) ( not ( = ?auto_25587 ?auto_25595 ) ) ( not ( = ?auto_25597 ?auto_25587 ) ) ( not ( = ?auto_25597 ?auto_25595 ) ) ( not ( = ?auto_25596 ?auto_25588 ) ) ( CALIBRATION_TARGET ?auto_25593 ?auto_25595 ) ( not ( = ?auto_25595 ?auto_25594 ) ) ( not ( = ?auto_25587 ?auto_25594 ) ) ( not ( = ?auto_25597 ?auto_25594 ) ) ( ON_BOARD ?auto_25590 ?auto_25589 ) ( not ( = ?auto_25593 ?auto_25590 ) ) ( SUPPORTS ?auto_25590 ?auto_25592 ) ( not ( = ?auto_25596 ?auto_25592 ) ) ( not ( = ?auto_25588 ?auto_25592 ) ) ( CALIBRATION_TARGET ?auto_25590 ?auto_25595 ) ( ON_BOARD ?auto_25591 ?auto_25589 ) ( POWER_ON ?auto_25591 ) ( not ( = ?auto_25593 ?auto_25591 ) ) ( not ( = ?auto_25590 ?auto_25591 ) ) ( SUPPORTS ?auto_25591 ?auto_25596 ) ( POINTING ?auto_25589 ?auto_25595 ) ( CALIBRATION_TARGET ?auto_25591 ?auto_25595 ) ( NOT_CALIBRATED ?auto_25591 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_25589 ?auto_25591 ?auto_25595 )
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
      ?auto_25605 - SATELLITE
      ?auto_25608 - DIRECTION
      ?auto_25607 - DIRECTION
      ?auto_25603 - INSTRUMENT
      ?auto_25602 - MODE
      ?auto_25606 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25604 ?auto_25605 ) ( SUPPORTS ?auto_25604 ?auto_25600 ) ( not ( = ?auto_25601 ?auto_25608 ) ) ( not ( = ?auto_25598 ?auto_25601 ) ) ( not ( = ?auto_25598 ?auto_25608 ) ) ( not ( = ?auto_25599 ?auto_25600 ) ) ( CALIBRATION_TARGET ?auto_25604 ?auto_25608 ) ( not ( = ?auto_25608 ?auto_25607 ) ) ( not ( = ?auto_25601 ?auto_25607 ) ) ( not ( = ?auto_25598 ?auto_25607 ) ) ( ON_BOARD ?auto_25603 ?auto_25605 ) ( not ( = ?auto_25604 ?auto_25603 ) ) ( SUPPORTS ?auto_25603 ?auto_25602 ) ( not ( = ?auto_25599 ?auto_25602 ) ) ( not ( = ?auto_25600 ?auto_25602 ) ) ( CALIBRATION_TARGET ?auto_25603 ?auto_25608 ) ( ON_BOARD ?auto_25606 ?auto_25605 ) ( POWER_ON ?auto_25606 ) ( not ( = ?auto_25604 ?auto_25606 ) ) ( not ( = ?auto_25603 ?auto_25606 ) ) ( SUPPORTS ?auto_25606 ?auto_25599 ) ( POINTING ?auto_25605 ?auto_25608 ) ( CALIBRATION_TARGET ?auto_25606 ?auto_25608 ) ( NOT_CALIBRATED ?auto_25606 ) )
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
      ?auto_25617 - INSTRUMENT
      ?auto_25616 - SATELLITE
      ?auto_25614 - DIRECTION
      ?auto_25619 - DIRECTION
      ?auto_25618 - MODE
      ?auto_25615 - INSTRUMENT
      ?auto_25613 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25617 ?auto_25616 ) ( SUPPORTS ?auto_25617 ?auto_25611 ) ( not ( = ?auto_25612 ?auto_25614 ) ) ( not ( = ?auto_25619 ?auto_25612 ) ) ( not ( = ?auto_25619 ?auto_25614 ) ) ( not ( = ?auto_25618 ?auto_25611 ) ) ( CALIBRATION_TARGET ?auto_25617 ?auto_25614 ) ( not ( = ?auto_25614 ?auto_25609 ) ) ( not ( = ?auto_25612 ?auto_25609 ) ) ( not ( = ?auto_25619 ?auto_25609 ) ) ( ON_BOARD ?auto_25615 ?auto_25616 ) ( not ( = ?auto_25617 ?auto_25615 ) ) ( SUPPORTS ?auto_25615 ?auto_25610 ) ( not ( = ?auto_25618 ?auto_25610 ) ) ( not ( = ?auto_25611 ?auto_25610 ) ) ( CALIBRATION_TARGET ?auto_25615 ?auto_25614 ) ( ON_BOARD ?auto_25613 ?auto_25616 ) ( POWER_ON ?auto_25613 ) ( not ( = ?auto_25617 ?auto_25613 ) ) ( not ( = ?auto_25615 ?auto_25613 ) ) ( SUPPORTS ?auto_25613 ?auto_25618 ) ( POINTING ?auto_25616 ?auto_25614 ) ( CALIBRATION_TARGET ?auto_25613 ?auto_25614 ) ( NOT_CALIBRATED ?auto_25613 ) )
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
      ?auto_25629 - INSTRUMENT
      ?auto_25628 - SATELLITE
      ?auto_25626 - DIRECTION
      ?auto_25630 - DIRECTION
      ?auto_25627 - INSTRUMENT
      ?auto_25624 - MODE
      ?auto_25625 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25629 ?auto_25628 ) ( SUPPORTS ?auto_25629 ?auto_25621 ) ( not ( = ?auto_25620 ?auto_25626 ) ) ( not ( = ?auto_25623 ?auto_25620 ) ) ( not ( = ?auto_25623 ?auto_25626 ) ) ( not ( = ?auto_25622 ?auto_25621 ) ) ( CALIBRATION_TARGET ?auto_25629 ?auto_25626 ) ( not ( = ?auto_25626 ?auto_25630 ) ) ( not ( = ?auto_25620 ?auto_25630 ) ) ( not ( = ?auto_25623 ?auto_25630 ) ) ( ON_BOARD ?auto_25627 ?auto_25628 ) ( not ( = ?auto_25629 ?auto_25627 ) ) ( SUPPORTS ?auto_25627 ?auto_25624 ) ( not ( = ?auto_25622 ?auto_25624 ) ) ( not ( = ?auto_25621 ?auto_25624 ) ) ( CALIBRATION_TARGET ?auto_25627 ?auto_25626 ) ( ON_BOARD ?auto_25625 ?auto_25628 ) ( POWER_ON ?auto_25625 ) ( not ( = ?auto_25629 ?auto_25625 ) ) ( not ( = ?auto_25627 ?auto_25625 ) ) ( SUPPORTS ?auto_25625 ?auto_25622 ) ( POINTING ?auto_25628 ?auto_25626 ) ( CALIBRATION_TARGET ?auto_25625 ?auto_25626 ) ( NOT_CALIBRATED ?auto_25625 ) )
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
      ?auto_25639 - INSTRUMENT
      ?auto_25638 - SATELLITE
      ?auto_25636 - DIRECTION
      ?auto_25641 - DIRECTION
      ?auto_25640 - MODE
      ?auto_25637 - INSTRUMENT
      ?auto_25635 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25639 ?auto_25638 ) ( SUPPORTS ?auto_25639 ?auto_25632 ) ( not ( = ?auto_25631 ?auto_25636 ) ) ( not ( = ?auto_25641 ?auto_25631 ) ) ( not ( = ?auto_25641 ?auto_25636 ) ) ( not ( = ?auto_25640 ?auto_25632 ) ) ( CALIBRATION_TARGET ?auto_25639 ?auto_25636 ) ( not ( = ?auto_25636 ?auto_25634 ) ) ( not ( = ?auto_25631 ?auto_25634 ) ) ( not ( = ?auto_25641 ?auto_25634 ) ) ( ON_BOARD ?auto_25637 ?auto_25638 ) ( not ( = ?auto_25639 ?auto_25637 ) ) ( SUPPORTS ?auto_25637 ?auto_25633 ) ( not ( = ?auto_25640 ?auto_25633 ) ) ( not ( = ?auto_25632 ?auto_25633 ) ) ( CALIBRATION_TARGET ?auto_25637 ?auto_25636 ) ( ON_BOARD ?auto_25635 ?auto_25638 ) ( POWER_ON ?auto_25635 ) ( not ( = ?auto_25639 ?auto_25635 ) ) ( not ( = ?auto_25637 ?auto_25635 ) ) ( SUPPORTS ?auto_25635 ?auto_25640 ) ( POINTING ?auto_25638 ?auto_25636 ) ( CALIBRATION_TARGET ?auto_25635 ?auto_25636 ) ( NOT_CALIBRATED ?auto_25635 ) )
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
      ?auto_25678 - INSTRUMENT
      ?auto_25677 - SATELLITE
      ?auto_25675 - DIRECTION
      ?auto_25676 - INSTRUMENT
      ?auto_25674 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25678 ?auto_25677 ) ( SUPPORTS ?auto_25678 ?auto_25672 ) ( not ( = ?auto_25673 ?auto_25675 ) ) ( not ( = ?auto_25668 ?auto_25673 ) ) ( not ( = ?auto_25668 ?auto_25675 ) ) ( not ( = ?auto_25669 ?auto_25672 ) ) ( CALIBRATION_TARGET ?auto_25678 ?auto_25675 ) ( not ( = ?auto_25675 ?auto_25671 ) ) ( not ( = ?auto_25673 ?auto_25671 ) ) ( not ( = ?auto_25668 ?auto_25671 ) ) ( ON_BOARD ?auto_25676 ?auto_25677 ) ( not ( = ?auto_25678 ?auto_25676 ) ) ( SUPPORTS ?auto_25676 ?auto_25670 ) ( not ( = ?auto_25669 ?auto_25670 ) ) ( not ( = ?auto_25672 ?auto_25670 ) ) ( CALIBRATION_TARGET ?auto_25676 ?auto_25675 ) ( ON_BOARD ?auto_25674 ?auto_25677 ) ( POWER_ON ?auto_25674 ) ( not ( = ?auto_25678 ?auto_25674 ) ) ( not ( = ?auto_25676 ?auto_25674 ) ) ( SUPPORTS ?auto_25674 ?auto_25669 ) ( POINTING ?auto_25677 ?auto_25675 ) ( CALIBRATION_TARGET ?auto_25674 ?auto_25675 ) ( NOT_CALIBRATED ?auto_25674 ) )
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
      ?auto_25702 - INSTRUMENT
      ?auto_25701 - SATELLITE
      ?auto_25699 - DIRECTION
      ?auto_25700 - INSTRUMENT
      ?auto_25698 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25702 ?auto_25701 ) ( SUPPORTS ?auto_25702 ?auto_25694 ) ( not ( = ?auto_25695 ?auto_25699 ) ) ( not ( = ?auto_25692 ?auto_25695 ) ) ( not ( = ?auto_25692 ?auto_25699 ) ) ( not ( = ?auto_25693 ?auto_25694 ) ) ( CALIBRATION_TARGET ?auto_25702 ?auto_25699 ) ( not ( = ?auto_25699 ?auto_25697 ) ) ( not ( = ?auto_25695 ?auto_25697 ) ) ( not ( = ?auto_25692 ?auto_25697 ) ) ( ON_BOARD ?auto_25700 ?auto_25701 ) ( not ( = ?auto_25702 ?auto_25700 ) ) ( SUPPORTS ?auto_25700 ?auto_25696 ) ( not ( = ?auto_25693 ?auto_25696 ) ) ( not ( = ?auto_25694 ?auto_25696 ) ) ( CALIBRATION_TARGET ?auto_25700 ?auto_25699 ) ( ON_BOARD ?auto_25698 ?auto_25701 ) ( POWER_ON ?auto_25698 ) ( not ( = ?auto_25702 ?auto_25698 ) ) ( not ( = ?auto_25700 ?auto_25698 ) ) ( SUPPORTS ?auto_25698 ?auto_25693 ) ( POINTING ?auto_25701 ?auto_25699 ) ( CALIBRATION_TARGET ?auto_25698 ?auto_25699 ) ( NOT_CALIBRATED ?auto_25698 ) )
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
      ?auto_25726 - INSTRUMENT
      ?auto_25725 - SATELLITE
      ?auto_25723 - DIRECTION
      ?auto_25724 - INSTRUMENT
      ?auto_25722 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25726 ?auto_25725 ) ( SUPPORTS ?auto_25726 ?auto_25720 ) ( not ( = ?auto_25721 ?auto_25723 ) ) ( not ( = ?auto_25719 ?auto_25721 ) ) ( not ( = ?auto_25719 ?auto_25723 ) ) ( not ( = ?auto_25718 ?auto_25720 ) ) ( CALIBRATION_TARGET ?auto_25726 ?auto_25723 ) ( not ( = ?auto_25723 ?auto_25716 ) ) ( not ( = ?auto_25721 ?auto_25716 ) ) ( not ( = ?auto_25719 ?auto_25716 ) ) ( ON_BOARD ?auto_25724 ?auto_25725 ) ( not ( = ?auto_25726 ?auto_25724 ) ) ( SUPPORTS ?auto_25724 ?auto_25717 ) ( not ( = ?auto_25718 ?auto_25717 ) ) ( not ( = ?auto_25720 ?auto_25717 ) ) ( CALIBRATION_TARGET ?auto_25724 ?auto_25723 ) ( ON_BOARD ?auto_25722 ?auto_25725 ) ( POWER_ON ?auto_25722 ) ( not ( = ?auto_25726 ?auto_25722 ) ) ( not ( = ?auto_25724 ?auto_25722 ) ) ( SUPPORTS ?auto_25722 ?auto_25718 ) ( POINTING ?auto_25725 ?auto_25723 ) ( CALIBRATION_TARGET ?auto_25722 ?auto_25723 ) ( NOT_CALIBRATED ?auto_25722 ) )
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
      ?auto_25750 - INSTRUMENT
      ?auto_25749 - SATELLITE
      ?auto_25747 - DIRECTION
      ?auto_25748 - INSTRUMENT
      ?auto_25746 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25750 ?auto_25749 ) ( SUPPORTS ?auto_25750 ?auto_25742 ) ( not ( = ?auto_25743 ?auto_25747 ) ) ( not ( = ?auto_25745 ?auto_25743 ) ) ( not ( = ?auto_25745 ?auto_25747 ) ) ( not ( = ?auto_25744 ?auto_25742 ) ) ( CALIBRATION_TARGET ?auto_25750 ?auto_25747 ) ( not ( = ?auto_25747 ?auto_25740 ) ) ( not ( = ?auto_25743 ?auto_25740 ) ) ( not ( = ?auto_25745 ?auto_25740 ) ) ( ON_BOARD ?auto_25748 ?auto_25749 ) ( not ( = ?auto_25750 ?auto_25748 ) ) ( SUPPORTS ?auto_25748 ?auto_25741 ) ( not ( = ?auto_25744 ?auto_25741 ) ) ( not ( = ?auto_25742 ?auto_25741 ) ) ( CALIBRATION_TARGET ?auto_25748 ?auto_25747 ) ( ON_BOARD ?auto_25746 ?auto_25749 ) ( POWER_ON ?auto_25746 ) ( not ( = ?auto_25750 ?auto_25746 ) ) ( not ( = ?auto_25748 ?auto_25746 ) ) ( SUPPORTS ?auto_25746 ?auto_25744 ) ( POINTING ?auto_25749 ?auto_25747 ) ( CALIBRATION_TARGET ?auto_25746 ?auto_25747 ) ( NOT_CALIBRATED ?auto_25746 ) )
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
      ?auto_25800 - INSTRUMENT
      ?auto_25799 - SATELLITE
      ?auto_25797 - DIRECTION
      ?auto_25798 - INSTRUMENT
      ?auto_25796 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25800 ?auto_25799 ) ( SUPPORTS ?auto_25800 ?auto_25791 ) ( not ( = ?auto_25790 ?auto_25797 ) ) ( not ( = ?auto_25793 ?auto_25790 ) ) ( not ( = ?auto_25793 ?auto_25797 ) ) ( not ( = ?auto_25792 ?auto_25791 ) ) ( CALIBRATION_TARGET ?auto_25800 ?auto_25797 ) ( not ( = ?auto_25797 ?auto_25795 ) ) ( not ( = ?auto_25790 ?auto_25795 ) ) ( not ( = ?auto_25793 ?auto_25795 ) ) ( ON_BOARD ?auto_25798 ?auto_25799 ) ( not ( = ?auto_25800 ?auto_25798 ) ) ( SUPPORTS ?auto_25798 ?auto_25794 ) ( not ( = ?auto_25792 ?auto_25794 ) ) ( not ( = ?auto_25791 ?auto_25794 ) ) ( CALIBRATION_TARGET ?auto_25798 ?auto_25797 ) ( ON_BOARD ?auto_25796 ?auto_25799 ) ( POWER_ON ?auto_25796 ) ( not ( = ?auto_25800 ?auto_25796 ) ) ( not ( = ?auto_25798 ?auto_25796 ) ) ( SUPPORTS ?auto_25796 ?auto_25792 ) ( POINTING ?auto_25799 ?auto_25797 ) ( CALIBRATION_TARGET ?auto_25796 ?auto_25797 ) ( NOT_CALIBRATED ?auto_25796 ) )
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
      ?auto_25824 - INSTRUMENT
      ?auto_25823 - SATELLITE
      ?auto_25821 - DIRECTION
      ?auto_25822 - INSTRUMENT
      ?auto_25820 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25824 ?auto_25823 ) ( SUPPORTS ?auto_25824 ?auto_25815 ) ( not ( = ?auto_25814 ?auto_25821 ) ) ( not ( = ?auto_25819 ?auto_25814 ) ) ( not ( = ?auto_25819 ?auto_25821 ) ) ( not ( = ?auto_25818 ?auto_25815 ) ) ( CALIBRATION_TARGET ?auto_25824 ?auto_25821 ) ( not ( = ?auto_25821 ?auto_25817 ) ) ( not ( = ?auto_25814 ?auto_25817 ) ) ( not ( = ?auto_25819 ?auto_25817 ) ) ( ON_BOARD ?auto_25822 ?auto_25823 ) ( not ( = ?auto_25824 ?auto_25822 ) ) ( SUPPORTS ?auto_25822 ?auto_25816 ) ( not ( = ?auto_25818 ?auto_25816 ) ) ( not ( = ?auto_25815 ?auto_25816 ) ) ( CALIBRATION_TARGET ?auto_25822 ?auto_25821 ) ( ON_BOARD ?auto_25820 ?auto_25823 ) ( POWER_ON ?auto_25820 ) ( not ( = ?auto_25824 ?auto_25820 ) ) ( not ( = ?auto_25822 ?auto_25820 ) ) ( SUPPORTS ?auto_25820 ?auto_25818 ) ( POINTING ?auto_25823 ?auto_25821 ) ( CALIBRATION_TARGET ?auto_25820 ?auto_25821 ) ( NOT_CALIBRATED ?auto_25820 ) )
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
      ?auto_25899 - INSTRUMENT
      ?auto_25898 - SATELLITE
      ?auto_25896 - DIRECTION
      ?auto_25902 - DIRECTION
      ?auto_25901 - MODE
      ?auto_25900 - DIRECTION
      ?auto_25897 - INSTRUMENT
      ?auto_25894 - MODE
      ?auto_25895 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25899 ?auto_25898 ) ( SUPPORTS ?auto_25899 ?auto_25893 ) ( not ( = ?auto_25892 ?auto_25896 ) ) ( not ( = ?auto_25902 ?auto_25892 ) ) ( not ( = ?auto_25902 ?auto_25896 ) ) ( not ( = ?auto_25901 ?auto_25893 ) ) ( CALIBRATION_TARGET ?auto_25899 ?auto_25896 ) ( not ( = ?auto_25896 ?auto_25900 ) ) ( not ( = ?auto_25892 ?auto_25900 ) ) ( not ( = ?auto_25902 ?auto_25900 ) ) ( ON_BOARD ?auto_25897 ?auto_25898 ) ( not ( = ?auto_25899 ?auto_25897 ) ) ( SUPPORTS ?auto_25897 ?auto_25894 ) ( not ( = ?auto_25901 ?auto_25894 ) ) ( not ( = ?auto_25893 ?auto_25894 ) ) ( CALIBRATION_TARGET ?auto_25897 ?auto_25896 ) ( ON_BOARD ?auto_25895 ?auto_25898 ) ( not ( = ?auto_25899 ?auto_25895 ) ) ( not ( = ?auto_25897 ?auto_25895 ) ) ( SUPPORTS ?auto_25895 ?auto_25901 ) ( POINTING ?auto_25898 ?auto_25896 ) ( CALIBRATION_TARGET ?auto_25895 ?auto_25896 ) ( POWER_AVAIL ?auto_25898 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_25895 ?auto_25898 )
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
      ?auto_25910 - INSTRUMENT
      ?auto_25911 - SATELLITE
      ?auto_25913 - DIRECTION
      ?auto_25909 - DIRECTION
      ?auto_25907 - INSTRUMENT
      ?auto_25908 - MODE
      ?auto_25912 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25910 ?auto_25911 ) ( SUPPORTS ?auto_25910 ?auto_25905 ) ( not ( = ?auto_25906 ?auto_25913 ) ) ( not ( = ?auto_25903 ?auto_25906 ) ) ( not ( = ?auto_25903 ?auto_25913 ) ) ( not ( = ?auto_25904 ?auto_25905 ) ) ( CALIBRATION_TARGET ?auto_25910 ?auto_25913 ) ( not ( = ?auto_25913 ?auto_25909 ) ) ( not ( = ?auto_25906 ?auto_25909 ) ) ( not ( = ?auto_25903 ?auto_25909 ) ) ( ON_BOARD ?auto_25907 ?auto_25911 ) ( not ( = ?auto_25910 ?auto_25907 ) ) ( SUPPORTS ?auto_25907 ?auto_25908 ) ( not ( = ?auto_25904 ?auto_25908 ) ) ( not ( = ?auto_25905 ?auto_25908 ) ) ( CALIBRATION_TARGET ?auto_25907 ?auto_25913 ) ( ON_BOARD ?auto_25912 ?auto_25911 ) ( not ( = ?auto_25910 ?auto_25912 ) ) ( not ( = ?auto_25907 ?auto_25912 ) ) ( SUPPORTS ?auto_25912 ?auto_25904 ) ( POINTING ?auto_25911 ?auto_25913 ) ( CALIBRATION_TARGET ?auto_25912 ?auto_25913 ) ( POWER_AVAIL ?auto_25911 ) )
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
      ?auto_25919 - INSTRUMENT
      ?auto_25921 - SATELLITE
      ?auto_25920 - DIRECTION
      ?auto_25924 - DIRECTION
      ?auto_25923 - MODE
      ?auto_25918 - INSTRUMENT
      ?auto_25922 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25919 ?auto_25921 ) ( SUPPORTS ?auto_25919 ?auto_25916 ) ( not ( = ?auto_25917 ?auto_25920 ) ) ( not ( = ?auto_25924 ?auto_25917 ) ) ( not ( = ?auto_25924 ?auto_25920 ) ) ( not ( = ?auto_25923 ?auto_25916 ) ) ( CALIBRATION_TARGET ?auto_25919 ?auto_25920 ) ( not ( = ?auto_25920 ?auto_25914 ) ) ( not ( = ?auto_25917 ?auto_25914 ) ) ( not ( = ?auto_25924 ?auto_25914 ) ) ( ON_BOARD ?auto_25918 ?auto_25921 ) ( not ( = ?auto_25919 ?auto_25918 ) ) ( SUPPORTS ?auto_25918 ?auto_25915 ) ( not ( = ?auto_25923 ?auto_25915 ) ) ( not ( = ?auto_25916 ?auto_25915 ) ) ( CALIBRATION_TARGET ?auto_25918 ?auto_25920 ) ( ON_BOARD ?auto_25922 ?auto_25921 ) ( not ( = ?auto_25919 ?auto_25922 ) ) ( not ( = ?auto_25918 ?auto_25922 ) ) ( SUPPORTS ?auto_25922 ?auto_25923 ) ( POINTING ?auto_25921 ?auto_25920 ) ( CALIBRATION_TARGET ?auto_25922 ?auto_25920 ) ( POWER_AVAIL ?auto_25921 ) )
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
      ?auto_25930 - INSTRUMENT
      ?auto_25932 - SATELLITE
      ?auto_25931 - DIRECTION
      ?auto_25933 - DIRECTION
      ?auto_25929 - INSTRUMENT
      ?auto_25934 - MODE
      ?auto_25935 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25930 ?auto_25932 ) ( SUPPORTS ?auto_25930 ?auto_25926 ) ( not ( = ?auto_25925 ?auto_25931 ) ) ( not ( = ?auto_25928 ?auto_25925 ) ) ( not ( = ?auto_25928 ?auto_25931 ) ) ( not ( = ?auto_25927 ?auto_25926 ) ) ( CALIBRATION_TARGET ?auto_25930 ?auto_25931 ) ( not ( = ?auto_25931 ?auto_25933 ) ) ( not ( = ?auto_25925 ?auto_25933 ) ) ( not ( = ?auto_25928 ?auto_25933 ) ) ( ON_BOARD ?auto_25929 ?auto_25932 ) ( not ( = ?auto_25930 ?auto_25929 ) ) ( SUPPORTS ?auto_25929 ?auto_25934 ) ( not ( = ?auto_25927 ?auto_25934 ) ) ( not ( = ?auto_25926 ?auto_25934 ) ) ( CALIBRATION_TARGET ?auto_25929 ?auto_25931 ) ( ON_BOARD ?auto_25935 ?auto_25932 ) ( not ( = ?auto_25930 ?auto_25935 ) ) ( not ( = ?auto_25929 ?auto_25935 ) ) ( SUPPORTS ?auto_25935 ?auto_25927 ) ( POINTING ?auto_25932 ?auto_25931 ) ( CALIBRATION_TARGET ?auto_25935 ?auto_25931 ) ( POWER_AVAIL ?auto_25932 ) )
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
      ?auto_25941 - INSTRUMENT
      ?auto_25943 - SATELLITE
      ?auto_25942 - DIRECTION
      ?auto_25946 - DIRECTION
      ?auto_25945 - MODE
      ?auto_25940 - INSTRUMENT
      ?auto_25944 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_25941 ?auto_25943 ) ( SUPPORTS ?auto_25941 ?auto_25937 ) ( not ( = ?auto_25936 ?auto_25942 ) ) ( not ( = ?auto_25946 ?auto_25936 ) ) ( not ( = ?auto_25946 ?auto_25942 ) ) ( not ( = ?auto_25945 ?auto_25937 ) ) ( CALIBRATION_TARGET ?auto_25941 ?auto_25942 ) ( not ( = ?auto_25942 ?auto_25939 ) ) ( not ( = ?auto_25936 ?auto_25939 ) ) ( not ( = ?auto_25946 ?auto_25939 ) ) ( ON_BOARD ?auto_25940 ?auto_25943 ) ( not ( = ?auto_25941 ?auto_25940 ) ) ( SUPPORTS ?auto_25940 ?auto_25938 ) ( not ( = ?auto_25945 ?auto_25938 ) ) ( not ( = ?auto_25937 ?auto_25938 ) ) ( CALIBRATION_TARGET ?auto_25940 ?auto_25942 ) ( ON_BOARD ?auto_25944 ?auto_25943 ) ( not ( = ?auto_25941 ?auto_25944 ) ) ( not ( = ?auto_25940 ?auto_25944 ) ) ( SUPPORTS ?auto_25944 ?auto_25945 ) ( POINTING ?auto_25943 ?auto_25942 ) ( CALIBRATION_TARGET ?auto_25944 ?auto_25942 ) ( POWER_AVAIL ?auto_25943 ) )
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
    ( and ( ON_BOARD ?auto_25980 ?auto_25982 ) ( SUPPORTS ?auto_25980 ?auto_25977 ) ( not ( = ?auto_25978 ?auto_25981 ) ) ( not ( = ?auto_25973 ?auto_25978 ) ) ( not ( = ?auto_25973 ?auto_25981 ) ) ( not ( = ?auto_25974 ?auto_25977 ) ) ( CALIBRATION_TARGET ?auto_25980 ?auto_25981 ) ( not ( = ?auto_25981 ?auto_25976 ) ) ( not ( = ?auto_25978 ?auto_25976 ) ) ( not ( = ?auto_25973 ?auto_25976 ) ) ( ON_BOARD ?auto_25979 ?auto_25982 ) ( not ( = ?auto_25980 ?auto_25979 ) ) ( SUPPORTS ?auto_25979 ?auto_25975 ) ( not ( = ?auto_25974 ?auto_25975 ) ) ( not ( = ?auto_25977 ?auto_25975 ) ) ( CALIBRATION_TARGET ?auto_25979 ?auto_25981 ) ( ON_BOARD ?auto_25983 ?auto_25982 ) ( not ( = ?auto_25980 ?auto_25983 ) ) ( not ( = ?auto_25979 ?auto_25983 ) ) ( SUPPORTS ?auto_25983 ?auto_25974 ) ( POINTING ?auto_25982 ?auto_25981 ) ( CALIBRATION_TARGET ?auto_25983 ?auto_25981 ) ( POWER_AVAIL ?auto_25982 ) )
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
    ( and ( ON_BOARD ?auto_26004 ?auto_26006 ) ( SUPPORTS ?auto_26004 ?auto_25999 ) ( not ( = ?auto_26000 ?auto_26005 ) ) ( not ( = ?auto_25997 ?auto_26000 ) ) ( not ( = ?auto_25997 ?auto_26005 ) ) ( not ( = ?auto_25998 ?auto_25999 ) ) ( CALIBRATION_TARGET ?auto_26004 ?auto_26005 ) ( not ( = ?auto_26005 ?auto_26002 ) ) ( not ( = ?auto_26000 ?auto_26002 ) ) ( not ( = ?auto_25997 ?auto_26002 ) ) ( ON_BOARD ?auto_26003 ?auto_26006 ) ( not ( = ?auto_26004 ?auto_26003 ) ) ( SUPPORTS ?auto_26003 ?auto_26001 ) ( not ( = ?auto_25998 ?auto_26001 ) ) ( not ( = ?auto_25999 ?auto_26001 ) ) ( CALIBRATION_TARGET ?auto_26003 ?auto_26005 ) ( ON_BOARD ?auto_26007 ?auto_26006 ) ( not ( = ?auto_26004 ?auto_26007 ) ) ( not ( = ?auto_26003 ?auto_26007 ) ) ( SUPPORTS ?auto_26007 ?auto_25998 ) ( POINTING ?auto_26006 ?auto_26005 ) ( CALIBRATION_TARGET ?auto_26007 ?auto_26005 ) ( POWER_AVAIL ?auto_26006 ) )
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
    ( and ( ON_BOARD ?auto_26028 ?auto_26030 ) ( SUPPORTS ?auto_26028 ?auto_26025 ) ( not ( = ?auto_26026 ?auto_26029 ) ) ( not ( = ?auto_26024 ?auto_26026 ) ) ( not ( = ?auto_26024 ?auto_26029 ) ) ( not ( = ?auto_26023 ?auto_26025 ) ) ( CALIBRATION_TARGET ?auto_26028 ?auto_26029 ) ( not ( = ?auto_26029 ?auto_26021 ) ) ( not ( = ?auto_26026 ?auto_26021 ) ) ( not ( = ?auto_26024 ?auto_26021 ) ) ( ON_BOARD ?auto_26027 ?auto_26030 ) ( not ( = ?auto_26028 ?auto_26027 ) ) ( SUPPORTS ?auto_26027 ?auto_26022 ) ( not ( = ?auto_26023 ?auto_26022 ) ) ( not ( = ?auto_26025 ?auto_26022 ) ) ( CALIBRATION_TARGET ?auto_26027 ?auto_26029 ) ( ON_BOARD ?auto_26031 ?auto_26030 ) ( not ( = ?auto_26028 ?auto_26031 ) ) ( not ( = ?auto_26027 ?auto_26031 ) ) ( SUPPORTS ?auto_26031 ?auto_26023 ) ( POINTING ?auto_26030 ?auto_26029 ) ( CALIBRATION_TARGET ?auto_26031 ?auto_26029 ) ( POWER_AVAIL ?auto_26030 ) )
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
    ( and ( ON_BOARD ?auto_26052 ?auto_26054 ) ( SUPPORTS ?auto_26052 ?auto_26047 ) ( not ( = ?auto_26048 ?auto_26053 ) ) ( not ( = ?auto_26050 ?auto_26048 ) ) ( not ( = ?auto_26050 ?auto_26053 ) ) ( not ( = ?auto_26049 ?auto_26047 ) ) ( CALIBRATION_TARGET ?auto_26052 ?auto_26053 ) ( not ( = ?auto_26053 ?auto_26045 ) ) ( not ( = ?auto_26048 ?auto_26045 ) ) ( not ( = ?auto_26050 ?auto_26045 ) ) ( ON_BOARD ?auto_26051 ?auto_26054 ) ( not ( = ?auto_26052 ?auto_26051 ) ) ( SUPPORTS ?auto_26051 ?auto_26046 ) ( not ( = ?auto_26049 ?auto_26046 ) ) ( not ( = ?auto_26047 ?auto_26046 ) ) ( CALIBRATION_TARGET ?auto_26051 ?auto_26053 ) ( ON_BOARD ?auto_26055 ?auto_26054 ) ( not ( = ?auto_26052 ?auto_26055 ) ) ( not ( = ?auto_26051 ?auto_26055 ) ) ( SUPPORTS ?auto_26055 ?auto_26049 ) ( POINTING ?auto_26054 ?auto_26053 ) ( CALIBRATION_TARGET ?auto_26055 ?auto_26053 ) ( POWER_AVAIL ?auto_26054 ) )
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
    ( and ( ON_BOARD ?auto_26102 ?auto_26104 ) ( SUPPORTS ?auto_26102 ?auto_26096 ) ( not ( = ?auto_26095 ?auto_26103 ) ) ( not ( = ?auto_26098 ?auto_26095 ) ) ( not ( = ?auto_26098 ?auto_26103 ) ) ( not ( = ?auto_26097 ?auto_26096 ) ) ( CALIBRATION_TARGET ?auto_26102 ?auto_26103 ) ( not ( = ?auto_26103 ?auto_26100 ) ) ( not ( = ?auto_26095 ?auto_26100 ) ) ( not ( = ?auto_26098 ?auto_26100 ) ) ( ON_BOARD ?auto_26101 ?auto_26104 ) ( not ( = ?auto_26102 ?auto_26101 ) ) ( SUPPORTS ?auto_26101 ?auto_26099 ) ( not ( = ?auto_26097 ?auto_26099 ) ) ( not ( = ?auto_26096 ?auto_26099 ) ) ( CALIBRATION_TARGET ?auto_26101 ?auto_26103 ) ( ON_BOARD ?auto_26105 ?auto_26104 ) ( not ( = ?auto_26102 ?auto_26105 ) ) ( not ( = ?auto_26101 ?auto_26105 ) ) ( SUPPORTS ?auto_26105 ?auto_26097 ) ( POINTING ?auto_26104 ?auto_26103 ) ( CALIBRATION_TARGET ?auto_26105 ?auto_26103 ) ( POWER_AVAIL ?auto_26104 ) )
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
    ( and ( ON_BOARD ?auto_26126 ?auto_26128 ) ( SUPPORTS ?auto_26126 ?auto_26120 ) ( not ( = ?auto_26119 ?auto_26127 ) ) ( not ( = ?auto_26124 ?auto_26119 ) ) ( not ( = ?auto_26124 ?auto_26127 ) ) ( not ( = ?auto_26123 ?auto_26120 ) ) ( CALIBRATION_TARGET ?auto_26126 ?auto_26127 ) ( not ( = ?auto_26127 ?auto_26122 ) ) ( not ( = ?auto_26119 ?auto_26122 ) ) ( not ( = ?auto_26124 ?auto_26122 ) ) ( ON_BOARD ?auto_26125 ?auto_26128 ) ( not ( = ?auto_26126 ?auto_26125 ) ) ( SUPPORTS ?auto_26125 ?auto_26121 ) ( not ( = ?auto_26123 ?auto_26121 ) ) ( not ( = ?auto_26120 ?auto_26121 ) ) ( CALIBRATION_TARGET ?auto_26125 ?auto_26127 ) ( ON_BOARD ?auto_26129 ?auto_26128 ) ( not ( = ?auto_26126 ?auto_26129 ) ) ( not ( = ?auto_26125 ?auto_26129 ) ) ( SUPPORTS ?auto_26129 ?auto_26123 ) ( POINTING ?auto_26128 ?auto_26127 ) ( CALIBRATION_TARGET ?auto_26129 ?auto_26127 ) ( POWER_AVAIL ?auto_26128 ) )
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
      ?auto_26200 - INSTRUMENT
      ?auto_26202 - SATELLITE
      ?auto_26201 - DIRECTION
      ?auto_26207 - DIRECTION
      ?auto_26206 - MODE
      ?auto_26203 - DIRECTION
      ?auto_26199 - INSTRUMENT
      ?auto_26204 - MODE
      ?auto_26205 - INSTRUMENT
      ?auto_26208 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26200 ?auto_26202 ) ( SUPPORTS ?auto_26200 ?auto_26198 ) ( not ( = ?auto_26197 ?auto_26201 ) ) ( not ( = ?auto_26207 ?auto_26197 ) ) ( not ( = ?auto_26207 ?auto_26201 ) ) ( not ( = ?auto_26206 ?auto_26198 ) ) ( CALIBRATION_TARGET ?auto_26200 ?auto_26201 ) ( not ( = ?auto_26201 ?auto_26203 ) ) ( not ( = ?auto_26197 ?auto_26203 ) ) ( not ( = ?auto_26207 ?auto_26203 ) ) ( ON_BOARD ?auto_26199 ?auto_26202 ) ( not ( = ?auto_26200 ?auto_26199 ) ) ( SUPPORTS ?auto_26199 ?auto_26204 ) ( not ( = ?auto_26206 ?auto_26204 ) ) ( not ( = ?auto_26198 ?auto_26204 ) ) ( CALIBRATION_TARGET ?auto_26199 ?auto_26201 ) ( ON_BOARD ?auto_26205 ?auto_26202 ) ( not ( = ?auto_26200 ?auto_26205 ) ) ( not ( = ?auto_26199 ?auto_26205 ) ) ( SUPPORTS ?auto_26205 ?auto_26206 ) ( CALIBRATION_TARGET ?auto_26205 ?auto_26201 ) ( POWER_AVAIL ?auto_26202 ) ( POINTING ?auto_26202 ?auto_26208 ) ( not ( = ?auto_26201 ?auto_26208 ) ) ( not ( = ?auto_26197 ?auto_26208 ) ) ( not ( = ?auto_26207 ?auto_26208 ) ) ( not ( = ?auto_26203 ?auto_26208 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_26202 ?auto_26201 ?auto_26208 )
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
      ?auto_26217 - INSTRUMENT
      ?auto_26216 - SATELLITE
      ?auto_26218 - DIRECTION
      ?auto_26214 - DIRECTION
      ?auto_26219 - INSTRUMENT
      ?auto_26215 - MODE
      ?auto_26213 - INSTRUMENT
      ?auto_26220 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26217 ?auto_26216 ) ( SUPPORTS ?auto_26217 ?auto_26211 ) ( not ( = ?auto_26212 ?auto_26218 ) ) ( not ( = ?auto_26209 ?auto_26212 ) ) ( not ( = ?auto_26209 ?auto_26218 ) ) ( not ( = ?auto_26210 ?auto_26211 ) ) ( CALIBRATION_TARGET ?auto_26217 ?auto_26218 ) ( not ( = ?auto_26218 ?auto_26214 ) ) ( not ( = ?auto_26212 ?auto_26214 ) ) ( not ( = ?auto_26209 ?auto_26214 ) ) ( ON_BOARD ?auto_26219 ?auto_26216 ) ( not ( = ?auto_26217 ?auto_26219 ) ) ( SUPPORTS ?auto_26219 ?auto_26215 ) ( not ( = ?auto_26210 ?auto_26215 ) ) ( not ( = ?auto_26211 ?auto_26215 ) ) ( CALIBRATION_TARGET ?auto_26219 ?auto_26218 ) ( ON_BOARD ?auto_26213 ?auto_26216 ) ( not ( = ?auto_26217 ?auto_26213 ) ) ( not ( = ?auto_26219 ?auto_26213 ) ) ( SUPPORTS ?auto_26213 ?auto_26210 ) ( CALIBRATION_TARGET ?auto_26213 ?auto_26218 ) ( POWER_AVAIL ?auto_26216 ) ( POINTING ?auto_26216 ?auto_26220 ) ( not ( = ?auto_26218 ?auto_26220 ) ) ( not ( = ?auto_26212 ?auto_26220 ) ) ( not ( = ?auto_26209 ?auto_26220 ) ) ( not ( = ?auto_26214 ?auto_26220 ) ) )
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
      ?auto_26225 - INSTRUMENT
      ?auto_26228 - SATELLITE
      ?auto_26230 - DIRECTION
      ?auto_26232 - DIRECTION
      ?auto_26231 - MODE
      ?auto_26229 - INSTRUMENT
      ?auto_26227 - INSTRUMENT
      ?auto_26226 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26225 ?auto_26228 ) ( SUPPORTS ?auto_26225 ?auto_26223 ) ( not ( = ?auto_26224 ?auto_26230 ) ) ( not ( = ?auto_26232 ?auto_26224 ) ) ( not ( = ?auto_26232 ?auto_26230 ) ) ( not ( = ?auto_26231 ?auto_26223 ) ) ( CALIBRATION_TARGET ?auto_26225 ?auto_26230 ) ( not ( = ?auto_26230 ?auto_26221 ) ) ( not ( = ?auto_26224 ?auto_26221 ) ) ( not ( = ?auto_26232 ?auto_26221 ) ) ( ON_BOARD ?auto_26229 ?auto_26228 ) ( not ( = ?auto_26225 ?auto_26229 ) ) ( SUPPORTS ?auto_26229 ?auto_26222 ) ( not ( = ?auto_26231 ?auto_26222 ) ) ( not ( = ?auto_26223 ?auto_26222 ) ) ( CALIBRATION_TARGET ?auto_26229 ?auto_26230 ) ( ON_BOARD ?auto_26227 ?auto_26228 ) ( not ( = ?auto_26225 ?auto_26227 ) ) ( not ( = ?auto_26229 ?auto_26227 ) ) ( SUPPORTS ?auto_26227 ?auto_26231 ) ( CALIBRATION_TARGET ?auto_26227 ?auto_26230 ) ( POWER_AVAIL ?auto_26228 ) ( POINTING ?auto_26228 ?auto_26226 ) ( not ( = ?auto_26230 ?auto_26226 ) ) ( not ( = ?auto_26224 ?auto_26226 ) ) ( not ( = ?auto_26232 ?auto_26226 ) ) ( not ( = ?auto_26221 ?auto_26226 ) ) )
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
      ?auto_26237 - INSTRUMENT
      ?auto_26242 - SATELLITE
      ?auto_26244 - DIRECTION
      ?auto_26238 - DIRECTION
      ?auto_26243 - INSTRUMENT
      ?auto_26241 - MODE
      ?auto_26240 - INSTRUMENT
      ?auto_26239 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26237 ?auto_26242 ) ( SUPPORTS ?auto_26237 ?auto_26234 ) ( not ( = ?auto_26233 ?auto_26244 ) ) ( not ( = ?auto_26236 ?auto_26233 ) ) ( not ( = ?auto_26236 ?auto_26244 ) ) ( not ( = ?auto_26235 ?auto_26234 ) ) ( CALIBRATION_TARGET ?auto_26237 ?auto_26244 ) ( not ( = ?auto_26244 ?auto_26238 ) ) ( not ( = ?auto_26233 ?auto_26238 ) ) ( not ( = ?auto_26236 ?auto_26238 ) ) ( ON_BOARD ?auto_26243 ?auto_26242 ) ( not ( = ?auto_26237 ?auto_26243 ) ) ( SUPPORTS ?auto_26243 ?auto_26241 ) ( not ( = ?auto_26235 ?auto_26241 ) ) ( not ( = ?auto_26234 ?auto_26241 ) ) ( CALIBRATION_TARGET ?auto_26243 ?auto_26244 ) ( ON_BOARD ?auto_26240 ?auto_26242 ) ( not ( = ?auto_26237 ?auto_26240 ) ) ( not ( = ?auto_26243 ?auto_26240 ) ) ( SUPPORTS ?auto_26240 ?auto_26235 ) ( CALIBRATION_TARGET ?auto_26240 ?auto_26244 ) ( POWER_AVAIL ?auto_26242 ) ( POINTING ?auto_26242 ?auto_26239 ) ( not ( = ?auto_26244 ?auto_26239 ) ) ( not ( = ?auto_26233 ?auto_26239 ) ) ( not ( = ?auto_26236 ?auto_26239 ) ) ( not ( = ?auto_26238 ?auto_26239 ) ) )
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
      ?auto_26249 - INSTRUMENT
      ?auto_26252 - SATELLITE
      ?auto_26254 - DIRECTION
      ?auto_26256 - DIRECTION
      ?auto_26255 - MODE
      ?auto_26253 - INSTRUMENT
      ?auto_26251 - INSTRUMENT
      ?auto_26250 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26249 ?auto_26252 ) ( SUPPORTS ?auto_26249 ?auto_26246 ) ( not ( = ?auto_26245 ?auto_26254 ) ) ( not ( = ?auto_26256 ?auto_26245 ) ) ( not ( = ?auto_26256 ?auto_26254 ) ) ( not ( = ?auto_26255 ?auto_26246 ) ) ( CALIBRATION_TARGET ?auto_26249 ?auto_26254 ) ( not ( = ?auto_26254 ?auto_26248 ) ) ( not ( = ?auto_26245 ?auto_26248 ) ) ( not ( = ?auto_26256 ?auto_26248 ) ) ( ON_BOARD ?auto_26253 ?auto_26252 ) ( not ( = ?auto_26249 ?auto_26253 ) ) ( SUPPORTS ?auto_26253 ?auto_26247 ) ( not ( = ?auto_26255 ?auto_26247 ) ) ( not ( = ?auto_26246 ?auto_26247 ) ) ( CALIBRATION_TARGET ?auto_26253 ?auto_26254 ) ( ON_BOARD ?auto_26251 ?auto_26252 ) ( not ( = ?auto_26249 ?auto_26251 ) ) ( not ( = ?auto_26253 ?auto_26251 ) ) ( SUPPORTS ?auto_26251 ?auto_26255 ) ( CALIBRATION_TARGET ?auto_26251 ?auto_26254 ) ( POWER_AVAIL ?auto_26252 ) ( POINTING ?auto_26252 ?auto_26250 ) ( not ( = ?auto_26254 ?auto_26250 ) ) ( not ( = ?auto_26245 ?auto_26250 ) ) ( not ( = ?auto_26256 ?auto_26250 ) ) ( not ( = ?auto_26248 ?auto_26250 ) ) )
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
      ?auto_26291 - INSTRUMENT
      ?auto_26294 - SATELLITE
      ?auto_26296 - DIRECTION
      ?auto_26295 - INSTRUMENT
      ?auto_26293 - INSTRUMENT
      ?auto_26292 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26291 ?auto_26294 ) ( SUPPORTS ?auto_26291 ?auto_26289 ) ( not ( = ?auto_26290 ?auto_26296 ) ) ( not ( = ?auto_26285 ?auto_26290 ) ) ( not ( = ?auto_26285 ?auto_26296 ) ) ( not ( = ?auto_26286 ?auto_26289 ) ) ( CALIBRATION_TARGET ?auto_26291 ?auto_26296 ) ( not ( = ?auto_26296 ?auto_26288 ) ) ( not ( = ?auto_26290 ?auto_26288 ) ) ( not ( = ?auto_26285 ?auto_26288 ) ) ( ON_BOARD ?auto_26295 ?auto_26294 ) ( not ( = ?auto_26291 ?auto_26295 ) ) ( SUPPORTS ?auto_26295 ?auto_26287 ) ( not ( = ?auto_26286 ?auto_26287 ) ) ( not ( = ?auto_26289 ?auto_26287 ) ) ( CALIBRATION_TARGET ?auto_26295 ?auto_26296 ) ( ON_BOARD ?auto_26293 ?auto_26294 ) ( not ( = ?auto_26291 ?auto_26293 ) ) ( not ( = ?auto_26295 ?auto_26293 ) ) ( SUPPORTS ?auto_26293 ?auto_26286 ) ( CALIBRATION_TARGET ?auto_26293 ?auto_26296 ) ( POWER_AVAIL ?auto_26294 ) ( POINTING ?auto_26294 ?auto_26292 ) ( not ( = ?auto_26296 ?auto_26292 ) ) ( not ( = ?auto_26290 ?auto_26292 ) ) ( not ( = ?auto_26285 ?auto_26292 ) ) ( not ( = ?auto_26288 ?auto_26292 ) ) )
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
      ?auto_26317 - INSTRUMENT
      ?auto_26320 - SATELLITE
      ?auto_26322 - DIRECTION
      ?auto_26321 - INSTRUMENT
      ?auto_26319 - INSTRUMENT
      ?auto_26318 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26317 ?auto_26320 ) ( SUPPORTS ?auto_26317 ?auto_26313 ) ( not ( = ?auto_26314 ?auto_26322 ) ) ( not ( = ?auto_26311 ?auto_26314 ) ) ( not ( = ?auto_26311 ?auto_26322 ) ) ( not ( = ?auto_26312 ?auto_26313 ) ) ( CALIBRATION_TARGET ?auto_26317 ?auto_26322 ) ( not ( = ?auto_26322 ?auto_26316 ) ) ( not ( = ?auto_26314 ?auto_26316 ) ) ( not ( = ?auto_26311 ?auto_26316 ) ) ( ON_BOARD ?auto_26321 ?auto_26320 ) ( not ( = ?auto_26317 ?auto_26321 ) ) ( SUPPORTS ?auto_26321 ?auto_26315 ) ( not ( = ?auto_26312 ?auto_26315 ) ) ( not ( = ?auto_26313 ?auto_26315 ) ) ( CALIBRATION_TARGET ?auto_26321 ?auto_26322 ) ( ON_BOARD ?auto_26319 ?auto_26320 ) ( not ( = ?auto_26317 ?auto_26319 ) ) ( not ( = ?auto_26321 ?auto_26319 ) ) ( SUPPORTS ?auto_26319 ?auto_26312 ) ( CALIBRATION_TARGET ?auto_26319 ?auto_26322 ) ( POWER_AVAIL ?auto_26320 ) ( POINTING ?auto_26320 ?auto_26318 ) ( not ( = ?auto_26322 ?auto_26318 ) ) ( not ( = ?auto_26314 ?auto_26318 ) ) ( not ( = ?auto_26311 ?auto_26318 ) ) ( not ( = ?auto_26316 ?auto_26318 ) ) )
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
      ?auto_26343 - INSTRUMENT
      ?auto_26346 - SATELLITE
      ?auto_26348 - DIRECTION
      ?auto_26347 - INSTRUMENT
      ?auto_26345 - INSTRUMENT
      ?auto_26344 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26343 ?auto_26346 ) ( SUPPORTS ?auto_26343 ?auto_26341 ) ( not ( = ?auto_26342 ?auto_26348 ) ) ( not ( = ?auto_26340 ?auto_26342 ) ) ( not ( = ?auto_26340 ?auto_26348 ) ) ( not ( = ?auto_26339 ?auto_26341 ) ) ( CALIBRATION_TARGET ?auto_26343 ?auto_26348 ) ( not ( = ?auto_26348 ?auto_26337 ) ) ( not ( = ?auto_26342 ?auto_26337 ) ) ( not ( = ?auto_26340 ?auto_26337 ) ) ( ON_BOARD ?auto_26347 ?auto_26346 ) ( not ( = ?auto_26343 ?auto_26347 ) ) ( SUPPORTS ?auto_26347 ?auto_26338 ) ( not ( = ?auto_26339 ?auto_26338 ) ) ( not ( = ?auto_26341 ?auto_26338 ) ) ( CALIBRATION_TARGET ?auto_26347 ?auto_26348 ) ( ON_BOARD ?auto_26345 ?auto_26346 ) ( not ( = ?auto_26343 ?auto_26345 ) ) ( not ( = ?auto_26347 ?auto_26345 ) ) ( SUPPORTS ?auto_26345 ?auto_26339 ) ( CALIBRATION_TARGET ?auto_26345 ?auto_26348 ) ( POWER_AVAIL ?auto_26346 ) ( POINTING ?auto_26346 ?auto_26344 ) ( not ( = ?auto_26348 ?auto_26344 ) ) ( not ( = ?auto_26342 ?auto_26344 ) ) ( not ( = ?auto_26340 ?auto_26344 ) ) ( not ( = ?auto_26337 ?auto_26344 ) ) )
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
      ?auto_26369 - INSTRUMENT
      ?auto_26372 - SATELLITE
      ?auto_26374 - DIRECTION
      ?auto_26373 - INSTRUMENT
      ?auto_26371 - INSTRUMENT
      ?auto_26370 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26369 ?auto_26372 ) ( SUPPORTS ?auto_26369 ?auto_26365 ) ( not ( = ?auto_26366 ?auto_26374 ) ) ( not ( = ?auto_26368 ?auto_26366 ) ) ( not ( = ?auto_26368 ?auto_26374 ) ) ( not ( = ?auto_26367 ?auto_26365 ) ) ( CALIBRATION_TARGET ?auto_26369 ?auto_26374 ) ( not ( = ?auto_26374 ?auto_26363 ) ) ( not ( = ?auto_26366 ?auto_26363 ) ) ( not ( = ?auto_26368 ?auto_26363 ) ) ( ON_BOARD ?auto_26373 ?auto_26372 ) ( not ( = ?auto_26369 ?auto_26373 ) ) ( SUPPORTS ?auto_26373 ?auto_26364 ) ( not ( = ?auto_26367 ?auto_26364 ) ) ( not ( = ?auto_26365 ?auto_26364 ) ) ( CALIBRATION_TARGET ?auto_26373 ?auto_26374 ) ( ON_BOARD ?auto_26371 ?auto_26372 ) ( not ( = ?auto_26369 ?auto_26371 ) ) ( not ( = ?auto_26373 ?auto_26371 ) ) ( SUPPORTS ?auto_26371 ?auto_26367 ) ( CALIBRATION_TARGET ?auto_26371 ?auto_26374 ) ( POWER_AVAIL ?auto_26372 ) ( POINTING ?auto_26372 ?auto_26370 ) ( not ( = ?auto_26374 ?auto_26370 ) ) ( not ( = ?auto_26366 ?auto_26370 ) ) ( not ( = ?auto_26368 ?auto_26370 ) ) ( not ( = ?auto_26363 ?auto_26370 ) ) )
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
      ?auto_26423 - INSTRUMENT
      ?auto_26426 - SATELLITE
      ?auto_26428 - DIRECTION
      ?auto_26427 - INSTRUMENT
      ?auto_26425 - INSTRUMENT
      ?auto_26424 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26423 ?auto_26426 ) ( SUPPORTS ?auto_26423 ?auto_26418 ) ( not ( = ?auto_26417 ?auto_26428 ) ) ( not ( = ?auto_26420 ?auto_26417 ) ) ( not ( = ?auto_26420 ?auto_26428 ) ) ( not ( = ?auto_26419 ?auto_26418 ) ) ( CALIBRATION_TARGET ?auto_26423 ?auto_26428 ) ( not ( = ?auto_26428 ?auto_26422 ) ) ( not ( = ?auto_26417 ?auto_26422 ) ) ( not ( = ?auto_26420 ?auto_26422 ) ) ( ON_BOARD ?auto_26427 ?auto_26426 ) ( not ( = ?auto_26423 ?auto_26427 ) ) ( SUPPORTS ?auto_26427 ?auto_26421 ) ( not ( = ?auto_26419 ?auto_26421 ) ) ( not ( = ?auto_26418 ?auto_26421 ) ) ( CALIBRATION_TARGET ?auto_26427 ?auto_26428 ) ( ON_BOARD ?auto_26425 ?auto_26426 ) ( not ( = ?auto_26423 ?auto_26425 ) ) ( not ( = ?auto_26427 ?auto_26425 ) ) ( SUPPORTS ?auto_26425 ?auto_26419 ) ( CALIBRATION_TARGET ?auto_26425 ?auto_26428 ) ( POWER_AVAIL ?auto_26426 ) ( POINTING ?auto_26426 ?auto_26424 ) ( not ( = ?auto_26428 ?auto_26424 ) ) ( not ( = ?auto_26417 ?auto_26424 ) ) ( not ( = ?auto_26420 ?auto_26424 ) ) ( not ( = ?auto_26422 ?auto_26424 ) ) )
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
      ?auto_26449 - INSTRUMENT
      ?auto_26452 - SATELLITE
      ?auto_26454 - DIRECTION
      ?auto_26453 - INSTRUMENT
      ?auto_26451 - INSTRUMENT
      ?auto_26450 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_26449 ?auto_26452 ) ( SUPPORTS ?auto_26449 ?auto_26444 ) ( not ( = ?auto_26443 ?auto_26454 ) ) ( not ( = ?auto_26448 ?auto_26443 ) ) ( not ( = ?auto_26448 ?auto_26454 ) ) ( not ( = ?auto_26447 ?auto_26444 ) ) ( CALIBRATION_TARGET ?auto_26449 ?auto_26454 ) ( not ( = ?auto_26454 ?auto_26446 ) ) ( not ( = ?auto_26443 ?auto_26446 ) ) ( not ( = ?auto_26448 ?auto_26446 ) ) ( ON_BOARD ?auto_26453 ?auto_26452 ) ( not ( = ?auto_26449 ?auto_26453 ) ) ( SUPPORTS ?auto_26453 ?auto_26445 ) ( not ( = ?auto_26447 ?auto_26445 ) ) ( not ( = ?auto_26444 ?auto_26445 ) ) ( CALIBRATION_TARGET ?auto_26453 ?auto_26454 ) ( ON_BOARD ?auto_26451 ?auto_26452 ) ( not ( = ?auto_26449 ?auto_26451 ) ) ( not ( = ?auto_26453 ?auto_26451 ) ) ( SUPPORTS ?auto_26451 ?auto_26447 ) ( CALIBRATION_TARGET ?auto_26451 ?auto_26454 ) ( POWER_AVAIL ?auto_26452 ) ( POINTING ?auto_26452 ?auto_26450 ) ( not ( = ?auto_26454 ?auto_26450 ) ) ( not ( = ?auto_26443 ?auto_26450 ) ) ( not ( = ?auto_26448 ?auto_26450 ) ) ( not ( = ?auto_26446 ?auto_26450 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_26448 ?auto_26447 ?auto_26443 ?auto_26444 )
      ( GET-3IMAGE-VERIFY ?auto_26443 ?auto_26444 ?auto_26446 ?auto_26445 ?auto_26448 ?auto_26447 ) )
  )

)

