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
      ?auto_594 - INSTRUMENT
      ?auto_595 - SATELLITE
      ?auto_593 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_594 ?auto_595 ) ( SUPPORTS ?auto_594 ?auto_592 ) ( POWER_ON ?auto_594 ) ( POINTING ?auto_595 ?auto_593 ) ( not ( = ?auto_591 ?auto_593 ) ) ( CALIBRATION_TARGET ?auto_594 ?auto_593 ) ( NOT_CALIBRATED ?auto_594 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_595 ?auto_594 ?auto_593 )
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
      ?auto_607 - INSTRUMENT
      ?auto_606 - SATELLITE
      ?auto_605 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_607 ?auto_606 ) ( SUPPORTS ?auto_607 ?auto_604 ) ( POINTING ?auto_606 ?auto_605 ) ( not ( = ?auto_603 ?auto_605 ) ) ( CALIBRATION_TARGET ?auto_607 ?auto_605 ) ( POWER_AVAIL ?auto_606 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_607 ?auto_606 )
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
      ?auto_619 - SATELLITE
      ?auto_617 - DIRECTION
      ?auto_620 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_618 ?auto_619 ) ( SUPPORTS ?auto_618 ?auto_616 ) ( not ( = ?auto_615 ?auto_617 ) ) ( CALIBRATION_TARGET ?auto_618 ?auto_617 ) ( POWER_AVAIL ?auto_619 ) ( POINTING ?auto_619 ?auto_620 ) ( not ( = ?auto_617 ?auto_620 ) ) ( not ( = ?auto_615 ?auto_620 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_619 ?auto_617 ?auto_620 )
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
    ( and ( CALIBRATED ?auto_651 ) ( ON_BOARD ?auto_651 ?auto_652 ) ( SUPPORTS ?auto_651 ?auto_649 ) ( POWER_ON ?auto_651 ) ( POINTING ?auto_652 ?auto_650 ) ( HAVE_IMAGE ?auto_647 ?auto_648 ) ( not ( = ?auto_647 ?auto_650 ) ) ( not ( = ?auto_648 ?auto_649 ) ) )
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
    ( and ( CALIBRATED ?auto_657 ) ( ON_BOARD ?auto_657 ?auto_658 ) ( SUPPORTS ?auto_657 ?auto_654 ) ( POWER_ON ?auto_657 ) ( POINTING ?auto_658 ?auto_653 ) ( HAVE_IMAGE ?auto_656 ?auto_655 ) ( not ( = ?auto_653 ?auto_656 ) ) ( not ( = ?auto_654 ?auto_655 ) ) )
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
      ?auto_675 - INSTRUMENT
      ?auto_676 - SATELLITE
      ?auto_674 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_675 ) ( ON_BOARD ?auto_675 ?auto_676 ) ( SUPPORTS ?auto_675 ?auto_672 ) ( POWER_ON ?auto_675 ) ( POINTING ?auto_676 ?auto_674 ) ( not ( = ?auto_673 ?auto_674 ) ) ( HAVE_IMAGE ?auto_670 ?auto_671 ) ( not ( = ?auto_670 ?auto_673 ) ) ( not ( = ?auto_670 ?auto_674 ) ) ( not ( = ?auto_671 ?auto_672 ) ) )
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
      ?auto_682 - INSTRUMENT
      ?auto_681 - SATELLITE
      ?auto_683 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_682 ) ( ON_BOARD ?auto_682 ?auto_681 ) ( SUPPORTS ?auto_682 ?auto_678 ) ( POWER_ON ?auto_682 ) ( POINTING ?auto_681 ?auto_683 ) ( not ( = ?auto_677 ?auto_683 ) ) ( HAVE_IMAGE ?auto_680 ?auto_679 ) ( not ( = ?auto_680 ?auto_677 ) ) ( not ( = ?auto_680 ?auto_683 ) ) ( not ( = ?auto_679 ?auto_678 ) ) )
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
      ?auto_696 - INSTRUMENT
      ?auto_695 - SATELLITE
      ?auto_697 - DIRECTION
      ?auto_698 - DIRECTION
      ?auto_699 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_696 ?auto_695 ) ( SUPPORTS ?auto_696 ?auto_694 ) ( POWER_ON ?auto_696 ) ( POINTING ?auto_695 ?auto_697 ) ( not ( = ?auto_693 ?auto_697 ) ) ( HAVE_IMAGE ?auto_698 ?auto_699 ) ( not ( = ?auto_698 ?auto_693 ) ) ( not ( = ?auto_698 ?auto_697 ) ) ( not ( = ?auto_699 ?auto_694 ) ) ( CALIBRATION_TARGET ?auto_696 ?auto_697 ) ( NOT_CALIBRATED ?auto_696 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_695 ?auto_696 ?auto_697 )
      ( GET-2IMAGE ?auto_698 ?auto_699 ?auto_693 ?auto_694 )
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
      ?auto_705 - INSTRUMENT
      ?auto_704 - SATELLITE
      ?auto_706 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_705 ?auto_704 ) ( SUPPORTS ?auto_705 ?auto_702 ) ( POWER_ON ?auto_705 ) ( POINTING ?auto_704 ?auto_706 ) ( not ( = ?auto_703 ?auto_706 ) ) ( HAVE_IMAGE ?auto_700 ?auto_701 ) ( not ( = ?auto_700 ?auto_703 ) ) ( not ( = ?auto_700 ?auto_706 ) ) ( not ( = ?auto_701 ?auto_702 ) ) ( CALIBRATION_TARGET ?auto_705 ?auto_706 ) ( NOT_CALIBRATED ?auto_705 ) )
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
      ?auto_711 - INSTRUMENT
      ?auto_713 - SATELLITE
      ?auto_712 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_711 ?auto_713 ) ( SUPPORTS ?auto_711 ?auto_708 ) ( POWER_ON ?auto_711 ) ( POINTING ?auto_713 ?auto_712 ) ( not ( = ?auto_707 ?auto_712 ) ) ( HAVE_IMAGE ?auto_710 ?auto_709 ) ( not ( = ?auto_710 ?auto_707 ) ) ( not ( = ?auto_710 ?auto_712 ) ) ( not ( = ?auto_709 ?auto_708 ) ) ( CALIBRATION_TARGET ?auto_711 ?auto_712 ) ( NOT_CALIBRATED ?auto_711 ) )
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
      ?auto_725 - INSTRUMENT
      ?auto_727 - SATELLITE
      ?auto_726 - DIRECTION
      ?auto_729 - DIRECTION
      ?auto_728 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_725 ?auto_727 ) ( SUPPORTS ?auto_725 ?auto_724 ) ( POINTING ?auto_727 ?auto_726 ) ( not ( = ?auto_723 ?auto_726 ) ) ( HAVE_IMAGE ?auto_729 ?auto_728 ) ( not ( = ?auto_729 ?auto_723 ) ) ( not ( = ?auto_729 ?auto_726 ) ) ( not ( = ?auto_728 ?auto_724 ) ) ( CALIBRATION_TARGET ?auto_725 ?auto_726 ) ( POWER_AVAIL ?auto_727 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_725 ?auto_727 )
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
      ?auto_734 - INSTRUMENT
      ?auto_736 - SATELLITE
      ?auto_735 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_734 ?auto_736 ) ( SUPPORTS ?auto_734 ?auto_732 ) ( POINTING ?auto_736 ?auto_735 ) ( not ( = ?auto_733 ?auto_735 ) ) ( HAVE_IMAGE ?auto_730 ?auto_731 ) ( not ( = ?auto_730 ?auto_733 ) ) ( not ( = ?auto_730 ?auto_735 ) ) ( not ( = ?auto_731 ?auto_732 ) ) ( CALIBRATION_TARGET ?auto_734 ?auto_735 ) ( POWER_AVAIL ?auto_736 ) )
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
      ?auto_742 - SATELLITE
      ?auto_741 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_743 ?auto_742 ) ( SUPPORTS ?auto_743 ?auto_738 ) ( POINTING ?auto_742 ?auto_741 ) ( not ( = ?auto_737 ?auto_741 ) ) ( HAVE_IMAGE ?auto_740 ?auto_739 ) ( not ( = ?auto_740 ?auto_737 ) ) ( not ( = ?auto_740 ?auto_741 ) ) ( not ( = ?auto_739 ?auto_738 ) ) ( CALIBRATION_TARGET ?auto_743 ?auto_741 ) ( POWER_AVAIL ?auto_742 ) )
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
      ?auto_757 - INSTRUMENT
      ?auto_756 - SATELLITE
      ?auto_755 - DIRECTION
      ?auto_759 - DIRECTION
      ?auto_758 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_757 ?auto_756 ) ( SUPPORTS ?auto_757 ?auto_754 ) ( not ( = ?auto_753 ?auto_755 ) ) ( HAVE_IMAGE ?auto_759 ?auto_758 ) ( not ( = ?auto_759 ?auto_753 ) ) ( not ( = ?auto_759 ?auto_755 ) ) ( not ( = ?auto_758 ?auto_754 ) ) ( CALIBRATION_TARGET ?auto_757 ?auto_755 ) ( POWER_AVAIL ?auto_756 ) ( POINTING ?auto_756 ?auto_759 ) )
    :subtasks
    ( ( !TURN_TO ?auto_756 ?auto_755 ?auto_759 )
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
      ?auto_765 - INSTRUMENT
      ?auto_766 - SATELLITE
      ?auto_764 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_765 ?auto_766 ) ( SUPPORTS ?auto_765 ?auto_762 ) ( not ( = ?auto_763 ?auto_764 ) ) ( HAVE_IMAGE ?auto_760 ?auto_761 ) ( not ( = ?auto_760 ?auto_763 ) ) ( not ( = ?auto_760 ?auto_764 ) ) ( not ( = ?auto_761 ?auto_762 ) ) ( CALIBRATION_TARGET ?auto_765 ?auto_764 ) ( POWER_AVAIL ?auto_766 ) ( POINTING ?auto_766 ?auto_760 ) )
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
      ?auto_771 - INSTRUMENT
      ?auto_772 - SATELLITE
      ?auto_773 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_771 ?auto_772 ) ( SUPPORTS ?auto_771 ?auto_768 ) ( not ( = ?auto_767 ?auto_773 ) ) ( HAVE_IMAGE ?auto_770 ?auto_769 ) ( not ( = ?auto_770 ?auto_767 ) ) ( not ( = ?auto_770 ?auto_773 ) ) ( not ( = ?auto_769 ?auto_768 ) ) ( CALIBRATION_TARGET ?auto_771 ?auto_773 ) ( POWER_AVAIL ?auto_772 ) ( POINTING ?auto_772 ?auto_770 ) )
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
      ?auto_785 - INSTRUMENT
      ?auto_788 - SATELLITE
      ?auto_789 - DIRECTION
      ?auto_787 - DIRECTION
      ?auto_786 - MODE
      ?auto_790 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_785 ?auto_788 ) ( SUPPORTS ?auto_785 ?auto_784 ) ( not ( = ?auto_783 ?auto_789 ) ) ( HAVE_IMAGE ?auto_787 ?auto_786 ) ( not ( = ?auto_787 ?auto_783 ) ) ( not ( = ?auto_787 ?auto_789 ) ) ( not ( = ?auto_786 ?auto_784 ) ) ( CALIBRATION_TARGET ?auto_785 ?auto_789 ) ( POINTING ?auto_788 ?auto_787 ) ( ON_BOARD ?auto_790 ?auto_788 ) ( POWER_ON ?auto_790 ) ( not ( = ?auto_785 ?auto_790 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_790 ?auto_788 )
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
      ?auto_798 - INSTRUMENT
      ?auto_796 - SATELLITE
      ?auto_797 - DIRECTION
      ?auto_795 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_798 ?auto_796 ) ( SUPPORTS ?auto_798 ?auto_793 ) ( not ( = ?auto_794 ?auto_797 ) ) ( HAVE_IMAGE ?auto_791 ?auto_792 ) ( not ( = ?auto_791 ?auto_794 ) ) ( not ( = ?auto_791 ?auto_797 ) ) ( not ( = ?auto_792 ?auto_793 ) ) ( CALIBRATION_TARGET ?auto_798 ?auto_797 ) ( POINTING ?auto_796 ?auto_791 ) ( ON_BOARD ?auto_795 ?auto_796 ) ( POWER_ON ?auto_795 ) ( not ( = ?auto_798 ?auto_795 ) ) )
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
      ?auto_803 - INSTRUMENT
      ?auto_806 - SATELLITE
      ?auto_804 - DIRECTION
      ?auto_805 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_803 ?auto_806 ) ( SUPPORTS ?auto_803 ?auto_800 ) ( not ( = ?auto_799 ?auto_804 ) ) ( HAVE_IMAGE ?auto_802 ?auto_801 ) ( not ( = ?auto_802 ?auto_799 ) ) ( not ( = ?auto_802 ?auto_804 ) ) ( not ( = ?auto_801 ?auto_800 ) ) ( CALIBRATION_TARGET ?auto_803 ?auto_804 ) ( POINTING ?auto_806 ?auto_802 ) ( ON_BOARD ?auto_805 ?auto_806 ) ( POWER_ON ?auto_805 ) ( not ( = ?auto_803 ?auto_805 ) ) )
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
      ?auto_820 - INSTRUMENT
      ?auto_823 - SATELLITE
      ?auto_821 - DIRECTION
      ?auto_819 - DIRECTION
      ?auto_824 - MODE
      ?auto_822 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_820 ?auto_823 ) ( SUPPORTS ?auto_820 ?auto_818 ) ( not ( = ?auto_817 ?auto_821 ) ) ( not ( = ?auto_819 ?auto_817 ) ) ( not ( = ?auto_819 ?auto_821 ) ) ( not ( = ?auto_824 ?auto_818 ) ) ( CALIBRATION_TARGET ?auto_820 ?auto_821 ) ( POINTING ?auto_823 ?auto_819 ) ( ON_BOARD ?auto_822 ?auto_823 ) ( POWER_ON ?auto_822 ) ( not ( = ?auto_820 ?auto_822 ) ) ( CALIBRATED ?auto_822 ) ( SUPPORTS ?auto_822 ?auto_824 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_819 ?auto_824 )
      ( GET-2IMAGE ?auto_819 ?auto_824 ?auto_817 ?auto_818 )
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
      ?auto_832 - INSTRUMENT
      ?auto_830 - SATELLITE
      ?auto_829 - DIRECTION
      ?auto_831 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_832 ?auto_830 ) ( SUPPORTS ?auto_832 ?auto_827 ) ( not ( = ?auto_828 ?auto_829 ) ) ( not ( = ?auto_825 ?auto_828 ) ) ( not ( = ?auto_825 ?auto_829 ) ) ( not ( = ?auto_826 ?auto_827 ) ) ( CALIBRATION_TARGET ?auto_832 ?auto_829 ) ( POINTING ?auto_830 ?auto_825 ) ( ON_BOARD ?auto_831 ?auto_830 ) ( POWER_ON ?auto_831 ) ( not ( = ?auto_832 ?auto_831 ) ) ( CALIBRATED ?auto_831 ) ( SUPPORTS ?auto_831 ?auto_826 ) )
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
      ?auto_839 - INSTRUMENT
      ?auto_838 - SATELLITE
      ?auto_840 - DIRECTION
      ?auto_837 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_839 ?auto_838 ) ( SUPPORTS ?auto_839 ?auto_834 ) ( not ( = ?auto_833 ?auto_840 ) ) ( not ( = ?auto_836 ?auto_833 ) ) ( not ( = ?auto_836 ?auto_840 ) ) ( not ( = ?auto_835 ?auto_834 ) ) ( CALIBRATION_TARGET ?auto_839 ?auto_840 ) ( POINTING ?auto_838 ?auto_836 ) ( ON_BOARD ?auto_837 ?auto_838 ) ( POWER_ON ?auto_837 ) ( not ( = ?auto_839 ?auto_837 ) ) ( CALIBRATED ?auto_837 ) ( SUPPORTS ?auto_837 ?auto_835 ) )
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
      ?auto_855 - INSTRUMENT
      ?auto_854 - SATELLITE
      ?auto_856 - DIRECTION
      ?auto_858 - DIRECTION
      ?auto_857 - MODE
      ?auto_853 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_855 ?auto_854 ) ( SUPPORTS ?auto_855 ?auto_852 ) ( not ( = ?auto_851 ?auto_856 ) ) ( not ( = ?auto_858 ?auto_851 ) ) ( not ( = ?auto_858 ?auto_856 ) ) ( not ( = ?auto_857 ?auto_852 ) ) ( CALIBRATION_TARGET ?auto_855 ?auto_856 ) ( ON_BOARD ?auto_853 ?auto_854 ) ( POWER_ON ?auto_853 ) ( not ( = ?auto_855 ?auto_853 ) ) ( CALIBRATED ?auto_853 ) ( SUPPORTS ?auto_853 ?auto_857 ) ( POINTING ?auto_854 ?auto_856 ) )
    :subtasks
    ( ( !TURN_TO ?auto_854 ?auto_858 ?auto_856 )
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
      ?auto_865 - SATELLITE
      ?auto_864 - DIRECTION
      ?auto_863 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_866 ?auto_865 ) ( SUPPORTS ?auto_866 ?auto_861 ) ( not ( = ?auto_862 ?auto_864 ) ) ( not ( = ?auto_859 ?auto_862 ) ) ( not ( = ?auto_859 ?auto_864 ) ) ( not ( = ?auto_860 ?auto_861 ) ) ( CALIBRATION_TARGET ?auto_866 ?auto_864 ) ( ON_BOARD ?auto_863 ?auto_865 ) ( POWER_ON ?auto_863 ) ( not ( = ?auto_866 ?auto_863 ) ) ( CALIBRATED ?auto_863 ) ( SUPPORTS ?auto_863 ?auto_860 ) ( POINTING ?auto_865 ?auto_864 ) )
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
      ?auto_874 - SATELLITE
      ?auto_873 - DIRECTION
      ?auto_871 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_872 ?auto_874 ) ( SUPPORTS ?auto_872 ?auto_868 ) ( not ( = ?auto_867 ?auto_873 ) ) ( not ( = ?auto_870 ?auto_867 ) ) ( not ( = ?auto_870 ?auto_873 ) ) ( not ( = ?auto_869 ?auto_868 ) ) ( CALIBRATION_TARGET ?auto_872 ?auto_873 ) ( ON_BOARD ?auto_871 ?auto_874 ) ( POWER_ON ?auto_871 ) ( not ( = ?auto_872 ?auto_871 ) ) ( CALIBRATED ?auto_871 ) ( SUPPORTS ?auto_871 ?auto_869 ) ( POINTING ?auto_874 ?auto_873 ) )
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
      ?auto_890 - INSTRUMENT
      ?auto_892 - SATELLITE
      ?auto_891 - DIRECTION
      ?auto_888 - DIRECTION
      ?auto_887 - MODE
      ?auto_889 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_890 ?auto_892 ) ( SUPPORTS ?auto_890 ?auto_886 ) ( not ( = ?auto_885 ?auto_891 ) ) ( not ( = ?auto_888 ?auto_885 ) ) ( not ( = ?auto_888 ?auto_891 ) ) ( not ( = ?auto_887 ?auto_886 ) ) ( CALIBRATION_TARGET ?auto_890 ?auto_891 ) ( ON_BOARD ?auto_889 ?auto_892 ) ( POWER_ON ?auto_889 ) ( not ( = ?auto_890 ?auto_889 ) ) ( SUPPORTS ?auto_889 ?auto_887 ) ( POINTING ?auto_892 ?auto_891 ) ( CALIBRATION_TARGET ?auto_889 ?auto_891 ) ( NOT_CALIBRATED ?auto_889 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_892 ?auto_889 ?auto_891 )
      ( GET-2IMAGE ?auto_888 ?auto_887 ?auto_885 ?auto_886 )
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
      ?auto_899 - INSTRUMENT
      ?auto_898 - SATELLITE
      ?auto_900 - DIRECTION
      ?auto_897 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_899 ?auto_898 ) ( SUPPORTS ?auto_899 ?auto_895 ) ( not ( = ?auto_896 ?auto_900 ) ) ( not ( = ?auto_893 ?auto_896 ) ) ( not ( = ?auto_893 ?auto_900 ) ) ( not ( = ?auto_894 ?auto_895 ) ) ( CALIBRATION_TARGET ?auto_899 ?auto_900 ) ( ON_BOARD ?auto_897 ?auto_898 ) ( POWER_ON ?auto_897 ) ( not ( = ?auto_899 ?auto_897 ) ) ( SUPPORTS ?auto_897 ?auto_894 ) ( POINTING ?auto_898 ?auto_900 ) ( CALIBRATION_TARGET ?auto_897 ?auto_900 ) ( NOT_CALIBRATED ?auto_897 ) )
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
      ?auto_908 - DIRECTION
      ?auto_906 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_907 ?auto_905 ) ( SUPPORTS ?auto_907 ?auto_902 ) ( not ( = ?auto_901 ?auto_908 ) ) ( not ( = ?auto_904 ?auto_901 ) ) ( not ( = ?auto_904 ?auto_908 ) ) ( not ( = ?auto_903 ?auto_902 ) ) ( CALIBRATION_TARGET ?auto_907 ?auto_908 ) ( ON_BOARD ?auto_906 ?auto_905 ) ( POWER_ON ?auto_906 ) ( not ( = ?auto_907 ?auto_906 ) ) ( SUPPORTS ?auto_906 ?auto_903 ) ( POINTING ?auto_905 ?auto_908 ) ( CALIBRATION_TARGET ?auto_906 ?auto_908 ) ( NOT_CALIBRATED ?auto_906 ) )
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
      ?auto_923 - INSTRUMENT
      ?auto_921 - SATELLITE
      ?auto_924 - DIRECTION
      ?auto_926 - DIRECTION
      ?auto_925 - MODE
      ?auto_922 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_923 ?auto_921 ) ( SUPPORTS ?auto_923 ?auto_920 ) ( not ( = ?auto_919 ?auto_924 ) ) ( not ( = ?auto_926 ?auto_919 ) ) ( not ( = ?auto_926 ?auto_924 ) ) ( not ( = ?auto_925 ?auto_920 ) ) ( CALIBRATION_TARGET ?auto_923 ?auto_924 ) ( ON_BOARD ?auto_922 ?auto_921 ) ( not ( = ?auto_923 ?auto_922 ) ) ( SUPPORTS ?auto_922 ?auto_925 ) ( POINTING ?auto_921 ?auto_924 ) ( CALIBRATION_TARGET ?auto_922 ?auto_924 ) ( POWER_AVAIL ?auto_921 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_922 ?auto_921 )
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
      ?auto_933 - INSTRUMENT
      ?auto_934 - SATELLITE
      ?auto_931 - DIRECTION
      ?auto_932 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_933 ?auto_934 ) ( SUPPORTS ?auto_933 ?auto_929 ) ( not ( = ?auto_930 ?auto_931 ) ) ( not ( = ?auto_927 ?auto_930 ) ) ( not ( = ?auto_927 ?auto_931 ) ) ( not ( = ?auto_928 ?auto_929 ) ) ( CALIBRATION_TARGET ?auto_933 ?auto_931 ) ( ON_BOARD ?auto_932 ?auto_934 ) ( not ( = ?auto_933 ?auto_932 ) ) ( SUPPORTS ?auto_932 ?auto_928 ) ( POINTING ?auto_934 ?auto_931 ) ( CALIBRATION_TARGET ?auto_932 ?auto_931 ) ( POWER_AVAIL ?auto_934 ) )
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
      ?auto_939 - INSTRUMENT
      ?auto_941 - SATELLITE
      ?auto_942 - DIRECTION
      ?auto_940 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_939 ?auto_941 ) ( SUPPORTS ?auto_939 ?auto_936 ) ( not ( = ?auto_935 ?auto_942 ) ) ( not ( = ?auto_938 ?auto_935 ) ) ( not ( = ?auto_938 ?auto_942 ) ) ( not ( = ?auto_937 ?auto_936 ) ) ( CALIBRATION_TARGET ?auto_939 ?auto_942 ) ( ON_BOARD ?auto_940 ?auto_941 ) ( not ( = ?auto_939 ?auto_940 ) ) ( SUPPORTS ?auto_940 ?auto_937 ) ( POINTING ?auto_941 ?auto_942 ) ( CALIBRATION_TARGET ?auto_940 ?auto_942 ) ( POWER_AVAIL ?auto_941 ) )
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
      ?auto_955 - INSTRUMENT
      ?auto_957 - SATELLITE
      ?auto_958 - DIRECTION
      ?auto_960 - DIRECTION
      ?auto_959 - MODE
      ?auto_956 - INSTRUMENT
      ?auto_961 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_955 ?auto_957 ) ( SUPPORTS ?auto_955 ?auto_954 ) ( not ( = ?auto_953 ?auto_958 ) ) ( not ( = ?auto_960 ?auto_953 ) ) ( not ( = ?auto_960 ?auto_958 ) ) ( not ( = ?auto_959 ?auto_954 ) ) ( CALIBRATION_TARGET ?auto_955 ?auto_958 ) ( ON_BOARD ?auto_956 ?auto_957 ) ( not ( = ?auto_955 ?auto_956 ) ) ( SUPPORTS ?auto_956 ?auto_959 ) ( CALIBRATION_TARGET ?auto_956 ?auto_958 ) ( POWER_AVAIL ?auto_957 ) ( POINTING ?auto_957 ?auto_961 ) ( not ( = ?auto_958 ?auto_961 ) ) ( not ( = ?auto_953 ?auto_961 ) ) ( not ( = ?auto_960 ?auto_961 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_957 ?auto_958 ?auto_961 )
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
      ?auto_970 - INSTRUMENT
      ?auto_968 - SATELLITE
      ?auto_966 - DIRECTION
      ?auto_967 - INSTRUMENT
      ?auto_969 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_970 ?auto_968 ) ( SUPPORTS ?auto_970 ?auto_964 ) ( not ( = ?auto_965 ?auto_966 ) ) ( not ( = ?auto_962 ?auto_965 ) ) ( not ( = ?auto_962 ?auto_966 ) ) ( not ( = ?auto_963 ?auto_964 ) ) ( CALIBRATION_TARGET ?auto_970 ?auto_966 ) ( ON_BOARD ?auto_967 ?auto_968 ) ( not ( = ?auto_970 ?auto_967 ) ) ( SUPPORTS ?auto_967 ?auto_963 ) ( CALIBRATION_TARGET ?auto_967 ?auto_966 ) ( POWER_AVAIL ?auto_968 ) ( POINTING ?auto_968 ?auto_969 ) ( not ( = ?auto_966 ?auto_969 ) ) ( not ( = ?auto_965 ?auto_969 ) ) ( not ( = ?auto_962 ?auto_969 ) ) )
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
      ?auto_978 - INSTRUMENT
      ?auto_976 - SATELLITE
      ?auto_975 - DIRECTION
      ?auto_979 - INSTRUMENT
      ?auto_977 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_978 ?auto_976 ) ( SUPPORTS ?auto_978 ?auto_972 ) ( not ( = ?auto_971 ?auto_975 ) ) ( not ( = ?auto_974 ?auto_971 ) ) ( not ( = ?auto_974 ?auto_975 ) ) ( not ( = ?auto_973 ?auto_972 ) ) ( CALIBRATION_TARGET ?auto_978 ?auto_975 ) ( ON_BOARD ?auto_979 ?auto_976 ) ( not ( = ?auto_978 ?auto_979 ) ) ( SUPPORTS ?auto_979 ?auto_973 ) ( CALIBRATION_TARGET ?auto_979 ?auto_975 ) ( POWER_AVAIL ?auto_976 ) ( POINTING ?auto_976 ?auto_977 ) ( not ( = ?auto_975 ?auto_977 ) ) ( not ( = ?auto_971 ?auto_977 ) ) ( not ( = ?auto_974 ?auto_977 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_974 ?auto_973 ?auto_971 ?auto_972 )
      ( GET-2IMAGE-VERIFY ?auto_971 ?auto_972 ?auto_974 ?auto_973 ) )
  )

)

