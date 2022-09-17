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

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_569 - DIRECTION
      ?auto_570 - MODE
    )
    :vars
    (
      ?auto_571 - INSTRUMENT
      ?auto_572 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_571 ) ( ON_BOARD ?auto_571 ?auto_572 ) ( SUPPORTS ?auto_571 ?auto_570 ) ( POWER_ON ?auto_571 ) ( POINTING ?auto_572 ?auto_569 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_572 ?auto_569 ?auto_571 ?auto_570 )
      ( GET-1IMAGE-VERIFY ?auto_569 ?auto_570 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_579 - DIRECTION
      ?auto_580 - MODE
    )
    :vars
    (
      ?auto_582 - INSTRUMENT
      ?auto_581 - SATELLITE
      ?auto_583 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_582 ) ( ON_BOARD ?auto_582 ?auto_581 ) ( SUPPORTS ?auto_582 ?auto_580 ) ( POWER_ON ?auto_582 ) ( POINTING ?auto_581 ?auto_583 ) ( not ( = ?auto_579 ?auto_583 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_581 ?auto_579 ?auto_583 )
      ( GET-1IMAGE ?auto_579 ?auto_580 )
      ( GET-1IMAGE-VERIFY ?auto_579 ?auto_580 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_591 - DIRECTION
      ?auto_592 - MODE
    )
    :vars
    (
      ?auto_593 - INSTRUMENT
      ?auto_595 - SATELLITE
      ?auto_594 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_593 ?auto_595 ) ( SUPPORTS ?auto_593 ?auto_592 ) ( POWER_ON ?auto_593 ) ( POINTING ?auto_595 ?auto_594 ) ( not ( = ?auto_591 ?auto_594 ) ) ( CALIBRATION_TARGET ?auto_593 ?auto_594 ) ( NOT_CALIBRATED ?auto_593 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_595 ?auto_593 ?auto_594 )
      ( GET-1IMAGE ?auto_591 ?auto_592 )
      ( GET-1IMAGE-VERIFY ?auto_591 ?auto_592 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_603 - DIRECTION
      ?auto_604 - MODE
    )
    :vars
    (
      ?auto_605 - INSTRUMENT
      ?auto_606 - SATELLITE
      ?auto_607 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_605 ?auto_606 ) ( SUPPORTS ?auto_605 ?auto_604 ) ( POINTING ?auto_606 ?auto_607 ) ( not ( = ?auto_603 ?auto_607 ) ) ( CALIBRATION_TARGET ?auto_605 ?auto_607 ) ( POWER_AVAIL ?auto_606 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_605 ?auto_606 )
      ( GET-1IMAGE ?auto_603 ?auto_604 )
      ( GET-1IMAGE-VERIFY ?auto_603 ?auto_604 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_615 - DIRECTION
      ?auto_616 - MODE
    )
    :vars
    (
      ?auto_618 - INSTRUMENT
      ?auto_617 - SATELLITE
      ?auto_619 - DIRECTION
      ?auto_620 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_618 ?auto_617 ) ( SUPPORTS ?auto_618 ?auto_616 ) ( not ( = ?auto_615 ?auto_619 ) ) ( CALIBRATION_TARGET ?auto_618 ?auto_619 ) ( POWER_AVAIL ?auto_617 ) ( POINTING ?auto_617 ?auto_620 ) ( not ( = ?auto_619 ?auto_620 ) ) ( not ( = ?auto_615 ?auto_620 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_617 ?auto_619 ?auto_620 )
      ( GET-1IMAGE ?auto_615 ?auto_616 )
      ( GET-1IMAGE-VERIFY ?auto_615 ?auto_616 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_643 - DIRECTION
      ?auto_644 - MODE
    )
    :vars
    (
      ?auto_645 - INSTRUMENT
      ?auto_646 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_645 ) ( ON_BOARD ?auto_645 ?auto_646 ) ( SUPPORTS ?auto_645 ?auto_644 ) ( POWER_ON ?auto_645 ) ( POINTING ?auto_646 ?auto_643 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_646 ?auto_643 ?auto_645 ?auto_644 )
      ( GET-1IMAGE-VERIFY ?auto_643 ?auto_644 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_647 - DIRECTION
      ?auto_648 - MODE
      ?auto_650 - DIRECTION
      ?auto_649 - MODE
    )
    :vars
    (
      ?auto_651 - INSTRUMENT
      ?auto_652 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_650 ?auto_647 ) ) ( CALIBRATED ?auto_651 ) ( ON_BOARD ?auto_651 ?auto_652 ) ( SUPPORTS ?auto_651 ?auto_649 ) ( POWER_ON ?auto_651 ) ( POINTING ?auto_652 ?auto_650 ) ( HAVE_IMAGE ?auto_647 ?auto_648 ) ( not ( = ?auto_648 ?auto_649 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_650 ?auto_649 )
      ( GET-2IMAGE-VERIFY ?auto_647 ?auto_648 ?auto_650 ?auto_649 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_653 - DIRECTION
      ?auto_654 - MODE
      ?auto_656 - DIRECTION
      ?auto_655 - MODE
    )
    :vars
    (
      ?auto_657 - INSTRUMENT
      ?auto_658 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_656 ?auto_653 ) ) ( CALIBRATED ?auto_657 ) ( ON_BOARD ?auto_657 ?auto_658 ) ( SUPPORTS ?auto_657 ?auto_654 ) ( POWER_ON ?auto_657 ) ( POINTING ?auto_658 ?auto_653 ) ( HAVE_IMAGE ?auto_656 ?auto_655 ) ( not ( = ?auto_654 ?auto_655 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_653 ?auto_654 )
      ( GET-2IMAGE-VERIFY ?auto_653 ?auto_654 ?auto_656 ?auto_655 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_665 - DIRECTION
      ?auto_666 - MODE
    )
    :vars
    (
      ?auto_667 - INSTRUMENT
      ?auto_668 - SATELLITE
      ?auto_669 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_667 ) ( ON_BOARD ?auto_667 ?auto_668 ) ( SUPPORTS ?auto_667 ?auto_666 ) ( POWER_ON ?auto_667 ) ( POINTING ?auto_668 ?auto_669 ) ( not ( = ?auto_665 ?auto_669 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_668 ?auto_665 ?auto_669 )
      ( GET-1IMAGE ?auto_665 ?auto_666 )
      ( GET-1IMAGE-VERIFY ?auto_665 ?auto_666 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_670 - DIRECTION
      ?auto_671 - MODE
      ?auto_673 - DIRECTION
      ?auto_672 - MODE
    )
    :vars
    (
      ?auto_676 - INSTRUMENT
      ?auto_674 - SATELLITE
      ?auto_675 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_673 ?auto_670 ) ) ( CALIBRATED ?auto_676 ) ( ON_BOARD ?auto_676 ?auto_674 ) ( SUPPORTS ?auto_676 ?auto_672 ) ( POWER_ON ?auto_676 ) ( POINTING ?auto_674 ?auto_675 ) ( not ( = ?auto_673 ?auto_675 ) ) ( HAVE_IMAGE ?auto_670 ?auto_671 ) ( not ( = ?auto_670 ?auto_675 ) ) ( not ( = ?auto_671 ?auto_672 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_673 ?auto_672 )
      ( GET-2IMAGE-VERIFY ?auto_670 ?auto_671 ?auto_673 ?auto_672 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_677 - DIRECTION
      ?auto_678 - MODE
      ?auto_680 - DIRECTION
      ?auto_679 - MODE
    )
    :vars
    (
      ?auto_681 - INSTRUMENT
      ?auto_683 - SATELLITE
      ?auto_682 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_680 ?auto_677 ) ) ( CALIBRATED ?auto_681 ) ( ON_BOARD ?auto_681 ?auto_683 ) ( SUPPORTS ?auto_681 ?auto_678 ) ( POWER_ON ?auto_681 ) ( POINTING ?auto_683 ?auto_682 ) ( not ( = ?auto_677 ?auto_682 ) ) ( HAVE_IMAGE ?auto_680 ?auto_679 ) ( not ( = ?auto_680 ?auto_682 ) ) ( not ( = ?auto_679 ?auto_678 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_680 ?auto_679 ?auto_677 ?auto_678 )
      ( GET-2IMAGE-VERIFY ?auto_677 ?auto_678 ?auto_680 ?auto_679 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_693 - DIRECTION
      ?auto_694 - MODE
    )
    :vars
    (
      ?auto_695 - DIRECTION
      ?auto_696 - INSTRUMENT
      ?auto_698 - SATELLITE
      ?auto_697 - DIRECTION
      ?auto_699 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_693 ?auto_695 ) ) ( ON_BOARD ?auto_696 ?auto_698 ) ( SUPPORTS ?auto_696 ?auto_694 ) ( POWER_ON ?auto_696 ) ( POINTING ?auto_698 ?auto_697 ) ( not ( = ?auto_693 ?auto_697 ) ) ( HAVE_IMAGE ?auto_695 ?auto_699 ) ( not ( = ?auto_695 ?auto_697 ) ) ( not ( = ?auto_699 ?auto_694 ) ) ( CALIBRATION_TARGET ?auto_696 ?auto_697 ) ( NOT_CALIBRATED ?auto_696 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_698 ?auto_696 ?auto_697 )
      ( GET-2IMAGE ?auto_695 ?auto_699 ?auto_693 ?auto_694 )
      ( GET-1IMAGE-VERIFY ?auto_693 ?auto_694 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_700 - DIRECTION
      ?auto_701 - MODE
      ?auto_703 - DIRECTION
      ?auto_702 - MODE
    )
    :vars
    (
      ?auto_704 - INSTRUMENT
      ?auto_705 - SATELLITE
      ?auto_706 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_703 ?auto_700 ) ) ( ON_BOARD ?auto_704 ?auto_705 ) ( SUPPORTS ?auto_704 ?auto_702 ) ( POWER_ON ?auto_704 ) ( POINTING ?auto_705 ?auto_706 ) ( not ( = ?auto_703 ?auto_706 ) ) ( HAVE_IMAGE ?auto_700 ?auto_701 ) ( not ( = ?auto_700 ?auto_706 ) ) ( not ( = ?auto_701 ?auto_702 ) ) ( CALIBRATION_TARGET ?auto_704 ?auto_706 ) ( NOT_CALIBRATED ?auto_704 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_703 ?auto_702 )
      ( GET-2IMAGE-VERIFY ?auto_700 ?auto_701 ?auto_703 ?auto_702 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_707 - DIRECTION
      ?auto_708 - MODE
      ?auto_710 - DIRECTION
      ?auto_709 - MODE
    )
    :vars
    (
      ?auto_713 - INSTRUMENT
      ?auto_711 - SATELLITE
      ?auto_712 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_710 ?auto_707 ) ) ( ON_BOARD ?auto_713 ?auto_711 ) ( SUPPORTS ?auto_713 ?auto_708 ) ( POWER_ON ?auto_713 ) ( POINTING ?auto_711 ?auto_712 ) ( not ( = ?auto_707 ?auto_712 ) ) ( HAVE_IMAGE ?auto_710 ?auto_709 ) ( not ( = ?auto_710 ?auto_712 ) ) ( not ( = ?auto_709 ?auto_708 ) ) ( CALIBRATION_TARGET ?auto_713 ?auto_712 ) ( NOT_CALIBRATED ?auto_713 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_710 ?auto_709 ?auto_707 ?auto_708 )
      ( GET-2IMAGE-VERIFY ?auto_707 ?auto_708 ?auto_710 ?auto_709 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_723 - DIRECTION
      ?auto_724 - MODE
    )
    :vars
    (
      ?auto_729 - DIRECTION
      ?auto_727 - INSTRUMENT
      ?auto_725 - SATELLITE
      ?auto_726 - DIRECTION
      ?auto_728 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_723 ?auto_729 ) ) ( ON_BOARD ?auto_727 ?auto_725 ) ( SUPPORTS ?auto_727 ?auto_724 ) ( POINTING ?auto_725 ?auto_726 ) ( not ( = ?auto_723 ?auto_726 ) ) ( HAVE_IMAGE ?auto_729 ?auto_728 ) ( not ( = ?auto_729 ?auto_726 ) ) ( not ( = ?auto_728 ?auto_724 ) ) ( CALIBRATION_TARGET ?auto_727 ?auto_726 ) ( POWER_AVAIL ?auto_725 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_727 ?auto_725 )
      ( GET-2IMAGE ?auto_729 ?auto_728 ?auto_723 ?auto_724 )
      ( GET-1IMAGE-VERIFY ?auto_723 ?auto_724 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_730 - DIRECTION
      ?auto_731 - MODE
      ?auto_733 - DIRECTION
      ?auto_732 - MODE
    )
    :vars
    (
      ?auto_736 - INSTRUMENT
      ?auto_735 - SATELLITE
      ?auto_734 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_733 ?auto_730 ) ) ( ON_BOARD ?auto_736 ?auto_735 ) ( SUPPORTS ?auto_736 ?auto_732 ) ( POINTING ?auto_735 ?auto_734 ) ( not ( = ?auto_733 ?auto_734 ) ) ( HAVE_IMAGE ?auto_730 ?auto_731 ) ( not ( = ?auto_730 ?auto_734 ) ) ( not ( = ?auto_731 ?auto_732 ) ) ( CALIBRATION_TARGET ?auto_736 ?auto_734 ) ( POWER_AVAIL ?auto_735 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_733 ?auto_732 )
      ( GET-2IMAGE-VERIFY ?auto_730 ?auto_731 ?auto_733 ?auto_732 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_737 - DIRECTION
      ?auto_738 - MODE
      ?auto_740 - DIRECTION
      ?auto_739 - MODE
    )
    :vars
    (
      ?auto_743 - INSTRUMENT
      ?auto_741 - SATELLITE
      ?auto_742 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_740 ?auto_737 ) ) ( ON_BOARD ?auto_743 ?auto_741 ) ( SUPPORTS ?auto_743 ?auto_738 ) ( POINTING ?auto_741 ?auto_742 ) ( not ( = ?auto_737 ?auto_742 ) ) ( HAVE_IMAGE ?auto_740 ?auto_739 ) ( not ( = ?auto_740 ?auto_742 ) ) ( not ( = ?auto_739 ?auto_738 ) ) ( CALIBRATION_TARGET ?auto_743 ?auto_742 ) ( POWER_AVAIL ?auto_741 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_740 ?auto_739 ?auto_737 ?auto_738 )
      ( GET-2IMAGE-VERIFY ?auto_737 ?auto_738 ?auto_740 ?auto_739 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_753 - DIRECTION
      ?auto_754 - MODE
    )
    :vars
    (
      ?auto_759 - DIRECTION
      ?auto_757 - INSTRUMENT
      ?auto_755 - SATELLITE
      ?auto_756 - DIRECTION
      ?auto_758 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_753 ?auto_759 ) ) ( ON_BOARD ?auto_757 ?auto_755 ) ( SUPPORTS ?auto_757 ?auto_754 ) ( not ( = ?auto_753 ?auto_756 ) ) ( HAVE_IMAGE ?auto_759 ?auto_758 ) ( not ( = ?auto_759 ?auto_756 ) ) ( not ( = ?auto_758 ?auto_754 ) ) ( CALIBRATION_TARGET ?auto_757 ?auto_756 ) ( POWER_AVAIL ?auto_755 ) ( POINTING ?auto_755 ?auto_759 ) )
    :subtasks
    ( ( !TURN_TO ?auto_755 ?auto_756 ?auto_759 )
      ( GET-2IMAGE ?auto_759 ?auto_758 ?auto_753 ?auto_754 )
      ( GET-1IMAGE-VERIFY ?auto_753 ?auto_754 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_760 - DIRECTION
      ?auto_761 - MODE
      ?auto_763 - DIRECTION
      ?auto_762 - MODE
    )
    :vars
    (
      ?auto_766 - INSTRUMENT
      ?auto_765 - SATELLITE
      ?auto_764 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_763 ?auto_760 ) ) ( ON_BOARD ?auto_766 ?auto_765 ) ( SUPPORTS ?auto_766 ?auto_762 ) ( not ( = ?auto_763 ?auto_764 ) ) ( HAVE_IMAGE ?auto_760 ?auto_761 ) ( not ( = ?auto_760 ?auto_764 ) ) ( not ( = ?auto_761 ?auto_762 ) ) ( CALIBRATION_TARGET ?auto_766 ?auto_764 ) ( POWER_AVAIL ?auto_765 ) ( POINTING ?auto_765 ?auto_760 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_763 ?auto_762 )
      ( GET-2IMAGE-VERIFY ?auto_760 ?auto_761 ?auto_763 ?auto_762 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_767 - DIRECTION
      ?auto_768 - MODE
      ?auto_770 - DIRECTION
      ?auto_769 - MODE
    )
    :vars
    (
      ?auto_772 - INSTRUMENT
      ?auto_771 - SATELLITE
      ?auto_773 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_770 ?auto_767 ) ) ( ON_BOARD ?auto_772 ?auto_771 ) ( SUPPORTS ?auto_772 ?auto_768 ) ( not ( = ?auto_767 ?auto_773 ) ) ( HAVE_IMAGE ?auto_770 ?auto_769 ) ( not ( = ?auto_770 ?auto_773 ) ) ( not ( = ?auto_769 ?auto_768 ) ) ( CALIBRATION_TARGET ?auto_772 ?auto_773 ) ( POWER_AVAIL ?auto_771 ) ( POINTING ?auto_771 ?auto_770 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_770 ?auto_769 ?auto_767 ?auto_768 )
      ( GET-2IMAGE-VERIFY ?auto_767 ?auto_768 ?auto_770 ?auto_769 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_783 - DIRECTION
      ?auto_784 - MODE
    )
    :vars
    (
      ?auto_787 - DIRECTION
      ?auto_788 - INSTRUMENT
      ?auto_785 - SATELLITE
      ?auto_789 - DIRECTION
      ?auto_786 - MODE
      ?auto_790 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_783 ?auto_787 ) ) ( ON_BOARD ?auto_788 ?auto_785 ) ( SUPPORTS ?auto_788 ?auto_784 ) ( not ( = ?auto_783 ?auto_789 ) ) ( HAVE_IMAGE ?auto_787 ?auto_786 ) ( not ( = ?auto_787 ?auto_789 ) ) ( not ( = ?auto_786 ?auto_784 ) ) ( CALIBRATION_TARGET ?auto_788 ?auto_789 ) ( POINTING ?auto_785 ?auto_787 ) ( ON_BOARD ?auto_790 ?auto_785 ) ( POWER_ON ?auto_790 ) ( not ( = ?auto_788 ?auto_790 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_790 ?auto_785 )
      ( GET-2IMAGE ?auto_787 ?auto_786 ?auto_783 ?auto_784 )
      ( GET-1IMAGE-VERIFY ?auto_783 ?auto_784 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_791 - DIRECTION
      ?auto_792 - MODE
      ?auto_794 - DIRECTION
      ?auto_793 - MODE
    )
    :vars
    (
      ?auto_796 - INSTRUMENT
      ?auto_798 - SATELLITE
      ?auto_797 - DIRECTION
      ?auto_795 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_794 ?auto_791 ) ) ( ON_BOARD ?auto_796 ?auto_798 ) ( SUPPORTS ?auto_796 ?auto_793 ) ( not ( = ?auto_794 ?auto_797 ) ) ( HAVE_IMAGE ?auto_791 ?auto_792 ) ( not ( = ?auto_791 ?auto_797 ) ) ( not ( = ?auto_792 ?auto_793 ) ) ( CALIBRATION_TARGET ?auto_796 ?auto_797 ) ( POINTING ?auto_798 ?auto_791 ) ( ON_BOARD ?auto_795 ?auto_798 ) ( POWER_ON ?auto_795 ) ( not ( = ?auto_796 ?auto_795 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_794 ?auto_793 )
      ( GET-2IMAGE-VERIFY ?auto_791 ?auto_792 ?auto_794 ?auto_793 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_799 - DIRECTION
      ?auto_800 - MODE
      ?auto_802 - DIRECTION
      ?auto_801 - MODE
    )
    :vars
    (
      ?auto_804 - INSTRUMENT
      ?auto_805 - SATELLITE
      ?auto_803 - DIRECTION
      ?auto_806 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_802 ?auto_799 ) ) ( ON_BOARD ?auto_804 ?auto_805 ) ( SUPPORTS ?auto_804 ?auto_800 ) ( not ( = ?auto_799 ?auto_803 ) ) ( HAVE_IMAGE ?auto_802 ?auto_801 ) ( not ( = ?auto_802 ?auto_803 ) ) ( not ( = ?auto_801 ?auto_800 ) ) ( CALIBRATION_TARGET ?auto_804 ?auto_803 ) ( POINTING ?auto_805 ?auto_802 ) ( ON_BOARD ?auto_806 ?auto_805 ) ( POWER_ON ?auto_806 ) ( not ( = ?auto_804 ?auto_806 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_802 ?auto_801 ?auto_799 ?auto_800 )
      ( GET-2IMAGE-VERIFY ?auto_799 ?auto_800 ?auto_802 ?auto_801 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_817 - DIRECTION
      ?auto_818 - MODE
    )
    :vars
    (
      ?auto_822 - DIRECTION
      ?auto_820 - INSTRUMENT
      ?auto_823 - SATELLITE
      ?auto_819 - DIRECTION
      ?auto_821 - MODE
      ?auto_824 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_817 ?auto_822 ) ) ( ON_BOARD ?auto_820 ?auto_823 ) ( SUPPORTS ?auto_820 ?auto_818 ) ( not ( = ?auto_817 ?auto_819 ) ) ( not ( = ?auto_822 ?auto_819 ) ) ( not ( = ?auto_821 ?auto_818 ) ) ( CALIBRATION_TARGET ?auto_820 ?auto_819 ) ( POINTING ?auto_823 ?auto_822 ) ( ON_BOARD ?auto_824 ?auto_823 ) ( POWER_ON ?auto_824 ) ( not ( = ?auto_820 ?auto_824 ) ) ( CALIBRATED ?auto_824 ) ( SUPPORTS ?auto_824 ?auto_821 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_822 ?auto_821 )
      ( GET-2IMAGE ?auto_822 ?auto_821 ?auto_817 ?auto_818 )
      ( GET-1IMAGE-VERIFY ?auto_817 ?auto_818 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_825 - DIRECTION
      ?auto_826 - MODE
      ?auto_828 - DIRECTION
      ?auto_827 - MODE
    )
    :vars
    (
      ?auto_831 - INSTRUMENT
      ?auto_830 - SATELLITE
      ?auto_832 - DIRECTION
      ?auto_829 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_828 ?auto_825 ) ) ( ON_BOARD ?auto_831 ?auto_830 ) ( SUPPORTS ?auto_831 ?auto_827 ) ( not ( = ?auto_828 ?auto_832 ) ) ( not ( = ?auto_825 ?auto_832 ) ) ( not ( = ?auto_826 ?auto_827 ) ) ( CALIBRATION_TARGET ?auto_831 ?auto_832 ) ( POINTING ?auto_830 ?auto_825 ) ( ON_BOARD ?auto_829 ?auto_830 ) ( POWER_ON ?auto_829 ) ( not ( = ?auto_831 ?auto_829 ) ) ( CALIBRATED ?auto_829 ) ( SUPPORTS ?auto_829 ?auto_826 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_828 ?auto_827 )
      ( GET-2IMAGE-VERIFY ?auto_825 ?auto_826 ?auto_828 ?auto_827 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_833 - DIRECTION
      ?auto_834 - MODE
      ?auto_836 - DIRECTION
      ?auto_835 - MODE
    )
    :vars
    (
      ?auto_838 - INSTRUMENT
      ?auto_837 - SATELLITE
      ?auto_840 - DIRECTION
      ?auto_839 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_836 ?auto_833 ) ) ( ON_BOARD ?auto_838 ?auto_837 ) ( SUPPORTS ?auto_838 ?auto_834 ) ( not ( = ?auto_833 ?auto_840 ) ) ( not ( = ?auto_836 ?auto_840 ) ) ( not ( = ?auto_835 ?auto_834 ) ) ( CALIBRATION_TARGET ?auto_838 ?auto_840 ) ( POINTING ?auto_837 ?auto_836 ) ( ON_BOARD ?auto_839 ?auto_837 ) ( POWER_ON ?auto_839 ) ( not ( = ?auto_838 ?auto_839 ) ) ( CALIBRATED ?auto_839 ) ( SUPPORTS ?auto_839 ?auto_835 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_836 ?auto_835 ?auto_833 ?auto_834 )
      ( GET-2IMAGE-VERIFY ?auto_833 ?auto_834 ?auto_836 ?auto_835 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_851 - DIRECTION
      ?auto_852 - MODE
    )
    :vars
    (
      ?auto_858 - DIRECTION
      ?auto_854 - INSTRUMENT
      ?auto_853 - SATELLITE
      ?auto_856 - DIRECTION
      ?auto_857 - MODE
      ?auto_855 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_851 ?auto_858 ) ) ( ON_BOARD ?auto_854 ?auto_853 ) ( SUPPORTS ?auto_854 ?auto_852 ) ( not ( = ?auto_851 ?auto_856 ) ) ( not ( = ?auto_858 ?auto_856 ) ) ( not ( = ?auto_857 ?auto_852 ) ) ( CALIBRATION_TARGET ?auto_854 ?auto_856 ) ( ON_BOARD ?auto_855 ?auto_853 ) ( POWER_ON ?auto_855 ) ( not ( = ?auto_854 ?auto_855 ) ) ( CALIBRATED ?auto_855 ) ( SUPPORTS ?auto_855 ?auto_857 ) ( POINTING ?auto_853 ?auto_856 ) )
    :subtasks
    ( ( !TURN_TO ?auto_853 ?auto_858 ?auto_856 )
      ( GET-2IMAGE ?auto_858 ?auto_857 ?auto_851 ?auto_852 )
      ( GET-1IMAGE-VERIFY ?auto_851 ?auto_852 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_859 - DIRECTION
      ?auto_860 - MODE
      ?auto_862 - DIRECTION
      ?auto_861 - MODE
    )
    :vars
    (
      ?auto_866 - INSTRUMENT
      ?auto_863 - SATELLITE
      ?auto_865 - DIRECTION
      ?auto_864 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_862 ?auto_859 ) ) ( ON_BOARD ?auto_866 ?auto_863 ) ( SUPPORTS ?auto_866 ?auto_861 ) ( not ( = ?auto_862 ?auto_865 ) ) ( not ( = ?auto_859 ?auto_865 ) ) ( not ( = ?auto_860 ?auto_861 ) ) ( CALIBRATION_TARGET ?auto_866 ?auto_865 ) ( ON_BOARD ?auto_864 ?auto_863 ) ( POWER_ON ?auto_864 ) ( not ( = ?auto_866 ?auto_864 ) ) ( CALIBRATED ?auto_864 ) ( SUPPORTS ?auto_864 ?auto_860 ) ( POINTING ?auto_863 ?auto_865 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_862 ?auto_861 )
      ( GET-2IMAGE-VERIFY ?auto_859 ?auto_860 ?auto_862 ?auto_861 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_867 - DIRECTION
      ?auto_868 - MODE
      ?auto_870 - DIRECTION
      ?auto_869 - MODE
    )
    :vars
    (
      ?auto_872 - INSTRUMENT
      ?auto_871 - SATELLITE
      ?auto_874 - DIRECTION
      ?auto_873 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_870 ?auto_867 ) ) ( ON_BOARD ?auto_872 ?auto_871 ) ( SUPPORTS ?auto_872 ?auto_868 ) ( not ( = ?auto_867 ?auto_874 ) ) ( not ( = ?auto_870 ?auto_874 ) ) ( not ( = ?auto_869 ?auto_868 ) ) ( CALIBRATION_TARGET ?auto_872 ?auto_874 ) ( ON_BOARD ?auto_873 ?auto_871 ) ( POWER_ON ?auto_873 ) ( not ( = ?auto_872 ?auto_873 ) ) ( CALIBRATED ?auto_873 ) ( SUPPORTS ?auto_873 ?auto_869 ) ( POINTING ?auto_871 ?auto_874 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_870 ?auto_869 ?auto_867 ?auto_868 )
      ( GET-2IMAGE-VERIFY ?auto_867 ?auto_868 ?auto_870 ?auto_869 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_885 - DIRECTION
      ?auto_886 - MODE
    )
    :vars
    (
      ?auto_892 - DIRECTION
      ?auto_888 - INSTRUMENT
      ?auto_887 - SATELLITE
      ?auto_890 - DIRECTION
      ?auto_891 - MODE
      ?auto_889 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_885 ?auto_892 ) ) ( ON_BOARD ?auto_888 ?auto_887 ) ( SUPPORTS ?auto_888 ?auto_886 ) ( not ( = ?auto_885 ?auto_890 ) ) ( not ( = ?auto_892 ?auto_890 ) ) ( not ( = ?auto_891 ?auto_886 ) ) ( CALIBRATION_TARGET ?auto_888 ?auto_890 ) ( ON_BOARD ?auto_889 ?auto_887 ) ( POWER_ON ?auto_889 ) ( not ( = ?auto_888 ?auto_889 ) ) ( SUPPORTS ?auto_889 ?auto_891 ) ( POINTING ?auto_887 ?auto_890 ) ( CALIBRATION_TARGET ?auto_889 ?auto_890 ) ( NOT_CALIBRATED ?auto_889 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_887 ?auto_889 ?auto_890 )
      ( GET-2IMAGE ?auto_892 ?auto_891 ?auto_885 ?auto_886 )
      ( GET-1IMAGE-VERIFY ?auto_885 ?auto_886 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_893 - DIRECTION
      ?auto_894 - MODE
      ?auto_896 - DIRECTION
      ?auto_895 - MODE
    )
    :vars
    (
      ?auto_897 - INSTRUMENT
      ?auto_898 - SATELLITE
      ?auto_900 - DIRECTION
      ?auto_899 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_896 ?auto_893 ) ) ( ON_BOARD ?auto_897 ?auto_898 ) ( SUPPORTS ?auto_897 ?auto_895 ) ( not ( = ?auto_896 ?auto_900 ) ) ( not ( = ?auto_893 ?auto_900 ) ) ( not ( = ?auto_894 ?auto_895 ) ) ( CALIBRATION_TARGET ?auto_897 ?auto_900 ) ( ON_BOARD ?auto_899 ?auto_898 ) ( POWER_ON ?auto_899 ) ( not ( = ?auto_897 ?auto_899 ) ) ( SUPPORTS ?auto_899 ?auto_894 ) ( POINTING ?auto_898 ?auto_900 ) ( CALIBRATION_TARGET ?auto_899 ?auto_900 ) ( NOT_CALIBRATED ?auto_899 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_896 ?auto_895 )
      ( GET-2IMAGE-VERIFY ?auto_893 ?auto_894 ?auto_896 ?auto_895 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_901 - DIRECTION
      ?auto_902 - MODE
      ?auto_904 - DIRECTION
      ?auto_903 - MODE
    )
    :vars
    (
      ?auto_907 - INSTRUMENT
      ?auto_905 - SATELLITE
      ?auto_906 - DIRECTION
      ?auto_908 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_904 ?auto_901 ) ) ( ON_BOARD ?auto_907 ?auto_905 ) ( SUPPORTS ?auto_907 ?auto_902 ) ( not ( = ?auto_901 ?auto_906 ) ) ( not ( = ?auto_904 ?auto_906 ) ) ( not ( = ?auto_903 ?auto_902 ) ) ( CALIBRATION_TARGET ?auto_907 ?auto_906 ) ( ON_BOARD ?auto_908 ?auto_905 ) ( POWER_ON ?auto_908 ) ( not ( = ?auto_907 ?auto_908 ) ) ( SUPPORTS ?auto_908 ?auto_903 ) ( POINTING ?auto_905 ?auto_906 ) ( CALIBRATION_TARGET ?auto_908 ?auto_906 ) ( NOT_CALIBRATED ?auto_908 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_904 ?auto_903 ?auto_901 ?auto_902 )
      ( GET-2IMAGE-VERIFY ?auto_901 ?auto_902 ?auto_904 ?auto_903 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_919 - DIRECTION
      ?auto_920 - MODE
    )
    :vars
    (
      ?auto_926 - DIRECTION
      ?auto_923 - INSTRUMENT
      ?auto_921 - SATELLITE
      ?auto_922 - DIRECTION
      ?auto_925 - MODE
      ?auto_924 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_919 ?auto_926 ) ) ( ON_BOARD ?auto_923 ?auto_921 ) ( SUPPORTS ?auto_923 ?auto_920 ) ( not ( = ?auto_919 ?auto_922 ) ) ( not ( = ?auto_926 ?auto_922 ) ) ( not ( = ?auto_925 ?auto_920 ) ) ( CALIBRATION_TARGET ?auto_923 ?auto_922 ) ( ON_BOARD ?auto_924 ?auto_921 ) ( not ( = ?auto_923 ?auto_924 ) ) ( SUPPORTS ?auto_924 ?auto_925 ) ( POINTING ?auto_921 ?auto_922 ) ( CALIBRATION_TARGET ?auto_924 ?auto_922 ) ( POWER_AVAIL ?auto_921 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_924 ?auto_921 )
      ( GET-2IMAGE ?auto_926 ?auto_925 ?auto_919 ?auto_920 )
      ( GET-1IMAGE-VERIFY ?auto_919 ?auto_920 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_927 - DIRECTION
      ?auto_928 - MODE
      ?auto_930 - DIRECTION
      ?auto_929 - MODE
    )
    :vars
    (
      ?auto_931 - INSTRUMENT
      ?auto_933 - SATELLITE
      ?auto_932 - DIRECTION
      ?auto_934 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_930 ?auto_927 ) ) ( ON_BOARD ?auto_931 ?auto_933 ) ( SUPPORTS ?auto_931 ?auto_929 ) ( not ( = ?auto_930 ?auto_932 ) ) ( not ( = ?auto_927 ?auto_932 ) ) ( not ( = ?auto_928 ?auto_929 ) ) ( CALIBRATION_TARGET ?auto_931 ?auto_932 ) ( ON_BOARD ?auto_934 ?auto_933 ) ( not ( = ?auto_931 ?auto_934 ) ) ( SUPPORTS ?auto_934 ?auto_928 ) ( POINTING ?auto_933 ?auto_932 ) ( CALIBRATION_TARGET ?auto_934 ?auto_932 ) ( POWER_AVAIL ?auto_933 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_930 ?auto_929 )
      ( GET-2IMAGE-VERIFY ?auto_927 ?auto_928 ?auto_930 ?auto_929 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_935 - DIRECTION
      ?auto_936 - MODE
      ?auto_938 - DIRECTION
      ?auto_937 - MODE
    )
    :vars
    (
      ?auto_942 - INSTRUMENT
      ?auto_940 - SATELLITE
      ?auto_939 - DIRECTION
      ?auto_941 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_938 ?auto_935 ) ) ( ON_BOARD ?auto_942 ?auto_940 ) ( SUPPORTS ?auto_942 ?auto_936 ) ( not ( = ?auto_935 ?auto_939 ) ) ( not ( = ?auto_938 ?auto_939 ) ) ( not ( = ?auto_937 ?auto_936 ) ) ( CALIBRATION_TARGET ?auto_942 ?auto_939 ) ( ON_BOARD ?auto_941 ?auto_940 ) ( not ( = ?auto_942 ?auto_941 ) ) ( SUPPORTS ?auto_941 ?auto_937 ) ( POINTING ?auto_940 ?auto_939 ) ( CALIBRATION_TARGET ?auto_941 ?auto_939 ) ( POWER_AVAIL ?auto_940 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_938 ?auto_937 ?auto_935 ?auto_936 )
      ( GET-2IMAGE-VERIFY ?auto_935 ?auto_936 ?auto_938 ?auto_937 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_953 - DIRECTION
      ?auto_954 - MODE
    )
    :vars
    (
      ?auto_960 - DIRECTION
      ?auto_958 - INSTRUMENT
      ?auto_956 - SATELLITE
      ?auto_955 - DIRECTION
      ?auto_959 - MODE
      ?auto_957 - INSTRUMENT
      ?auto_961 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_953 ?auto_960 ) ) ( ON_BOARD ?auto_958 ?auto_956 ) ( SUPPORTS ?auto_958 ?auto_954 ) ( not ( = ?auto_953 ?auto_955 ) ) ( not ( = ?auto_960 ?auto_955 ) ) ( not ( = ?auto_959 ?auto_954 ) ) ( CALIBRATION_TARGET ?auto_958 ?auto_955 ) ( ON_BOARD ?auto_957 ?auto_956 ) ( not ( = ?auto_958 ?auto_957 ) ) ( SUPPORTS ?auto_957 ?auto_959 ) ( CALIBRATION_TARGET ?auto_957 ?auto_955 ) ( POWER_AVAIL ?auto_956 ) ( POINTING ?auto_956 ?auto_961 ) ( not ( = ?auto_955 ?auto_961 ) ) ( not ( = ?auto_953 ?auto_961 ) ) ( not ( = ?auto_960 ?auto_961 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_956 ?auto_955 ?auto_961 )
      ( GET-2IMAGE ?auto_960 ?auto_959 ?auto_953 ?auto_954 )
      ( GET-1IMAGE-VERIFY ?auto_953 ?auto_954 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_962 - DIRECTION
      ?auto_963 - MODE
      ?auto_965 - DIRECTION
      ?auto_964 - MODE
    )
    :vars
    (
      ?auto_968 - INSTRUMENT
      ?auto_966 - SATELLITE
      ?auto_970 - DIRECTION
      ?auto_967 - INSTRUMENT
      ?auto_969 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_965 ?auto_962 ) ) ( ON_BOARD ?auto_968 ?auto_966 ) ( SUPPORTS ?auto_968 ?auto_964 ) ( not ( = ?auto_965 ?auto_970 ) ) ( not ( = ?auto_962 ?auto_970 ) ) ( not ( = ?auto_963 ?auto_964 ) ) ( CALIBRATION_TARGET ?auto_968 ?auto_970 ) ( ON_BOARD ?auto_967 ?auto_966 ) ( not ( = ?auto_968 ?auto_967 ) ) ( SUPPORTS ?auto_967 ?auto_963 ) ( CALIBRATION_TARGET ?auto_967 ?auto_970 ) ( POWER_AVAIL ?auto_966 ) ( POINTING ?auto_966 ?auto_969 ) ( not ( = ?auto_970 ?auto_969 ) ) ( not ( = ?auto_965 ?auto_969 ) ) ( not ( = ?auto_962 ?auto_969 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_965 ?auto_964 )
      ( GET-2IMAGE-VERIFY ?auto_962 ?auto_963 ?auto_965 ?auto_964 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_971 - DIRECTION
      ?auto_972 - MODE
      ?auto_974 - DIRECTION
      ?auto_973 - MODE
    )
    :vars
    (
      ?auto_975 - INSTRUMENT
      ?auto_976 - SATELLITE
      ?auto_978 - DIRECTION
      ?auto_979 - INSTRUMENT
      ?auto_977 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_974 ?auto_971 ) ) ( ON_BOARD ?auto_975 ?auto_976 ) ( SUPPORTS ?auto_975 ?auto_972 ) ( not ( = ?auto_971 ?auto_978 ) ) ( not ( = ?auto_974 ?auto_978 ) ) ( not ( = ?auto_973 ?auto_972 ) ) ( CALIBRATION_TARGET ?auto_975 ?auto_978 ) ( ON_BOARD ?auto_979 ?auto_976 ) ( not ( = ?auto_975 ?auto_979 ) ) ( SUPPORTS ?auto_979 ?auto_973 ) ( CALIBRATION_TARGET ?auto_979 ?auto_978 ) ( POWER_AVAIL ?auto_976 ) ( POINTING ?auto_976 ?auto_977 ) ( not ( = ?auto_978 ?auto_977 ) ) ( not ( = ?auto_971 ?auto_977 ) ) ( not ( = ?auto_974 ?auto_977 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_974 ?auto_973 ?auto_971 ?auto_972 )
      ( GET-2IMAGE-VERIFY ?auto_971 ?auto_972 ?auto_974 ?auto_973 ) )
  )

)

