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
      ?auto_546 - DIRECTION
      ?auto_547 - MODE
    )
    :vars
    (
      ?auto_548 - INSTRUMENT
      ?auto_549 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_548 ) ( ON_BOARD ?auto_548 ?auto_549 ) ( SUPPORTS ?auto_548 ?auto_547 ) ( POWER_ON ?auto_548 ) ( POINTING ?auto_549 ?auto_546 ) )
    :subtasks
    ( ( !TAKE_IMAGE ?auto_549 ?auto_546 ?auto_548 ?auto_547 )
      ( GET-1IMAGE-VERIFY ?auto_546 ?auto_547 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_556 - DIRECTION
      ?auto_557 - MODE
    )
    :vars
    (
      ?auto_558 - INSTRUMENT
      ?auto_559 - SATELLITE
      ?auto_560 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_558 ) ( ON_BOARD ?auto_558 ?auto_559 ) ( SUPPORTS ?auto_558 ?auto_557 ) ( POWER_ON ?auto_558 ) ( POINTING ?auto_559 ?auto_560 ) ( not ( = ?auto_556 ?auto_560 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_559 ?auto_556 ?auto_560 )
      ( GET-1IMAGE ?auto_556 ?auto_557 )
      ( GET-1IMAGE-VERIFY ?auto_556 ?auto_557 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_568 - DIRECTION
      ?auto_569 - MODE
    )
    :vars
    (
      ?auto_571 - INSTRUMENT
      ?auto_570 - SATELLITE
      ?auto_572 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_571 ?auto_570 ) ( SUPPORTS ?auto_571 ?auto_569 ) ( POWER_ON ?auto_571 ) ( POINTING ?auto_570 ?auto_572 ) ( not ( = ?auto_568 ?auto_572 ) ) ( CALIBRATION_TARGET ?auto_571 ?auto_572 ) ( NOT_CALIBRATED ?auto_571 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_570 ?auto_571 ?auto_572 )
      ( GET-1IMAGE ?auto_568 ?auto_569 )
      ( GET-1IMAGE-VERIFY ?auto_568 ?auto_569 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_580 - DIRECTION
      ?auto_581 - MODE
    )
    :vars
    (
      ?auto_583 - INSTRUMENT
      ?auto_582 - SATELLITE
      ?auto_584 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_583 ?auto_582 ) ( SUPPORTS ?auto_583 ?auto_581 ) ( POINTING ?auto_582 ?auto_584 ) ( not ( = ?auto_580 ?auto_584 ) ) ( CALIBRATION_TARGET ?auto_583 ?auto_584 ) ( POWER_AVAIL ?auto_582 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_583 ?auto_582 )
      ( GET-1IMAGE ?auto_580 ?auto_581 )
      ( GET-1IMAGE-VERIFY ?auto_580 ?auto_581 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_592 - DIRECTION
      ?auto_593 - MODE
    )
    :vars
    (
      ?auto_594 - INSTRUMENT
      ?auto_595 - SATELLITE
      ?auto_596 - DIRECTION
      ?auto_597 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_594 ?auto_595 ) ( SUPPORTS ?auto_594 ?auto_593 ) ( not ( = ?auto_592 ?auto_596 ) ) ( CALIBRATION_TARGET ?auto_594 ?auto_596 ) ( POWER_AVAIL ?auto_595 ) ( POINTING ?auto_595 ?auto_597 ) ( not ( = ?auto_596 ?auto_597 ) ) ( not ( = ?auto_592 ?auto_597 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_595 ?auto_596 ?auto_597 )
      ( GET-1IMAGE ?auto_592 ?auto_593 )
      ( GET-1IMAGE-VERIFY ?auto_592 ?auto_593 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_625 - DIRECTION
      ?auto_626 - MODE
      ?auto_627 - DIRECTION
      ?auto_624 - MODE
    )
    :vars
    (
      ?auto_628 - INSTRUMENT
      ?auto_629 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_627 ?auto_625 ) ) ( CALIBRATED ?auto_628 ) ( ON_BOARD ?auto_628 ?auto_629 ) ( SUPPORTS ?auto_628 ?auto_624 ) ( POWER_ON ?auto_628 ) ( POINTING ?auto_629 ?auto_627 ) ( HAVE_IMAGE ?auto_625 ?auto_626 ) ( not ( = ?auto_626 ?auto_624 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_627 ?auto_624 )
      ( GET-2IMAGE-VERIFY ?auto_625 ?auto_626 ?auto_627 ?auto_624 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_631 - DIRECTION
      ?auto_632 - MODE
      ?auto_633 - DIRECTION
      ?auto_630 - MODE
    )
    :vars
    (
      ?auto_634 - INSTRUMENT
      ?auto_635 - SATELLITE
    )
    :precondition
    ( and ( not ( = ?auto_633 ?auto_631 ) ) ( CALIBRATED ?auto_634 ) ( ON_BOARD ?auto_634 ?auto_635 ) ( SUPPORTS ?auto_634 ?auto_632 ) ( POWER_ON ?auto_634 ) ( POINTING ?auto_635 ?auto_631 ) ( HAVE_IMAGE ?auto_633 ?auto_630 ) ( not ( = ?auto_632 ?auto_630 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_631 ?auto_632 )
      ( GET-2IMAGE-VERIFY ?auto_631 ?auto_632 ?auto_633 ?auto_630 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_648 - DIRECTION
      ?auto_649 - MODE
      ?auto_650 - DIRECTION
      ?auto_647 - MODE
    )
    :vars
    (
      ?auto_653 - INSTRUMENT
      ?auto_651 - SATELLITE
      ?auto_652 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_650 ?auto_648 ) ) ( CALIBRATED ?auto_653 ) ( ON_BOARD ?auto_653 ?auto_651 ) ( SUPPORTS ?auto_653 ?auto_647 ) ( POWER_ON ?auto_653 ) ( POINTING ?auto_651 ?auto_652 ) ( not ( = ?auto_650 ?auto_652 ) ) ( HAVE_IMAGE ?auto_648 ?auto_649 ) ( not ( = ?auto_648 ?auto_652 ) ) ( not ( = ?auto_649 ?auto_647 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_650 ?auto_647 )
      ( GET-2IMAGE-VERIFY ?auto_648 ?auto_649 ?auto_650 ?auto_647 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_655 - DIRECTION
      ?auto_656 - MODE
      ?auto_657 - DIRECTION
      ?auto_654 - MODE
    )
    :vars
    (
      ?auto_659 - INSTRUMENT
      ?auto_658 - SATELLITE
      ?auto_660 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_657 ?auto_655 ) ) ( CALIBRATED ?auto_659 ) ( ON_BOARD ?auto_659 ?auto_658 ) ( SUPPORTS ?auto_659 ?auto_656 ) ( POWER_ON ?auto_659 ) ( POINTING ?auto_658 ?auto_660 ) ( not ( = ?auto_655 ?auto_660 ) ) ( HAVE_IMAGE ?auto_657 ?auto_654 ) ( not ( = ?auto_657 ?auto_660 ) ) ( not ( = ?auto_654 ?auto_656 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_657 ?auto_654 ?auto_655 ?auto_656 )
      ( GET-2IMAGE-VERIFY ?auto_655 ?auto_656 ?auto_657 ?auto_654 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_670 - DIRECTION
      ?auto_671 - MODE
    )
    :vars
    (
      ?auto_672 - DIRECTION
      ?auto_674 - INSTRUMENT
      ?auto_673 - SATELLITE
      ?auto_675 - DIRECTION
      ?auto_676 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_670 ?auto_672 ) ) ( ON_BOARD ?auto_674 ?auto_673 ) ( SUPPORTS ?auto_674 ?auto_671 ) ( POWER_ON ?auto_674 ) ( POINTING ?auto_673 ?auto_675 ) ( not ( = ?auto_670 ?auto_675 ) ) ( HAVE_IMAGE ?auto_672 ?auto_676 ) ( not ( = ?auto_672 ?auto_675 ) ) ( not ( = ?auto_676 ?auto_671 ) ) ( CALIBRATION_TARGET ?auto_674 ?auto_675 ) ( NOT_CALIBRATED ?auto_674 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_673 ?auto_674 ?auto_675 )
      ( GET-2IMAGE ?auto_672 ?auto_676 ?auto_670 ?auto_671 )
      ( GET-1IMAGE-VERIFY ?auto_670 ?auto_671 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_678 - DIRECTION
      ?auto_679 - MODE
      ?auto_680 - DIRECTION
      ?auto_677 - MODE
    )
    :vars
    (
      ?auto_682 - INSTRUMENT
      ?auto_683 - SATELLITE
      ?auto_681 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_680 ?auto_678 ) ) ( ON_BOARD ?auto_682 ?auto_683 ) ( SUPPORTS ?auto_682 ?auto_677 ) ( POWER_ON ?auto_682 ) ( POINTING ?auto_683 ?auto_681 ) ( not ( = ?auto_680 ?auto_681 ) ) ( HAVE_IMAGE ?auto_678 ?auto_679 ) ( not ( = ?auto_678 ?auto_681 ) ) ( not ( = ?auto_679 ?auto_677 ) ) ( CALIBRATION_TARGET ?auto_682 ?auto_681 ) ( NOT_CALIBRATED ?auto_682 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_680 ?auto_677 )
      ( GET-2IMAGE-VERIFY ?auto_678 ?auto_679 ?auto_680 ?auto_677 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_685 - DIRECTION
      ?auto_686 - MODE
      ?auto_687 - DIRECTION
      ?auto_684 - MODE
    )
    :vars
    (
      ?auto_689 - INSTRUMENT
      ?auto_690 - SATELLITE
      ?auto_688 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_687 ?auto_685 ) ) ( ON_BOARD ?auto_689 ?auto_690 ) ( SUPPORTS ?auto_689 ?auto_686 ) ( POWER_ON ?auto_689 ) ( POINTING ?auto_690 ?auto_688 ) ( not ( = ?auto_685 ?auto_688 ) ) ( HAVE_IMAGE ?auto_687 ?auto_684 ) ( not ( = ?auto_687 ?auto_688 ) ) ( not ( = ?auto_684 ?auto_686 ) ) ( CALIBRATION_TARGET ?auto_689 ?auto_688 ) ( NOT_CALIBRATED ?auto_689 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_687 ?auto_684 ?auto_685 ?auto_686 )
      ( GET-2IMAGE-VERIFY ?auto_685 ?auto_686 ?auto_687 ?auto_684 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_700 - DIRECTION
      ?auto_701 - MODE
    )
    :vars
    (
      ?auto_702 - DIRECTION
      ?auto_705 - INSTRUMENT
      ?auto_706 - SATELLITE
      ?auto_704 - DIRECTION
      ?auto_703 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_700 ?auto_702 ) ) ( ON_BOARD ?auto_705 ?auto_706 ) ( SUPPORTS ?auto_705 ?auto_701 ) ( POINTING ?auto_706 ?auto_704 ) ( not ( = ?auto_700 ?auto_704 ) ) ( HAVE_IMAGE ?auto_702 ?auto_703 ) ( not ( = ?auto_702 ?auto_704 ) ) ( not ( = ?auto_703 ?auto_701 ) ) ( CALIBRATION_TARGET ?auto_705 ?auto_704 ) ( POWER_AVAIL ?auto_706 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_705 ?auto_706 )
      ( GET-2IMAGE ?auto_702 ?auto_703 ?auto_700 ?auto_701 )
      ( GET-1IMAGE-VERIFY ?auto_700 ?auto_701 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_708 - DIRECTION
      ?auto_709 - MODE
      ?auto_710 - DIRECTION
      ?auto_707 - MODE
    )
    :vars
    (
      ?auto_711 - INSTRUMENT
      ?auto_713 - SATELLITE
      ?auto_712 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_710 ?auto_708 ) ) ( ON_BOARD ?auto_711 ?auto_713 ) ( SUPPORTS ?auto_711 ?auto_707 ) ( POINTING ?auto_713 ?auto_712 ) ( not ( = ?auto_710 ?auto_712 ) ) ( HAVE_IMAGE ?auto_708 ?auto_709 ) ( not ( = ?auto_708 ?auto_712 ) ) ( not ( = ?auto_709 ?auto_707 ) ) ( CALIBRATION_TARGET ?auto_711 ?auto_712 ) ( POWER_AVAIL ?auto_713 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_710 ?auto_707 )
      ( GET-2IMAGE-VERIFY ?auto_708 ?auto_709 ?auto_710 ?auto_707 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_715 - DIRECTION
      ?auto_716 - MODE
      ?auto_717 - DIRECTION
      ?auto_714 - MODE
    )
    :vars
    (
      ?auto_718 - INSTRUMENT
      ?auto_719 - SATELLITE
      ?auto_720 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_717 ?auto_715 ) ) ( ON_BOARD ?auto_718 ?auto_719 ) ( SUPPORTS ?auto_718 ?auto_716 ) ( POINTING ?auto_719 ?auto_720 ) ( not ( = ?auto_715 ?auto_720 ) ) ( HAVE_IMAGE ?auto_717 ?auto_714 ) ( not ( = ?auto_717 ?auto_720 ) ) ( not ( = ?auto_714 ?auto_716 ) ) ( CALIBRATION_TARGET ?auto_718 ?auto_720 ) ( POWER_AVAIL ?auto_719 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_717 ?auto_714 ?auto_715 ?auto_716 )
      ( GET-2IMAGE-VERIFY ?auto_715 ?auto_716 ?auto_717 ?auto_714 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_730 - DIRECTION
      ?auto_731 - MODE
    )
    :vars
    (
      ?auto_733 - DIRECTION
      ?auto_732 - INSTRUMENT
      ?auto_734 - SATELLITE
      ?auto_735 - DIRECTION
      ?auto_736 - MODE
    )
    :precondition
    ( and ( not ( = ?auto_730 ?auto_733 ) ) ( ON_BOARD ?auto_732 ?auto_734 ) ( SUPPORTS ?auto_732 ?auto_731 ) ( not ( = ?auto_730 ?auto_735 ) ) ( HAVE_IMAGE ?auto_733 ?auto_736 ) ( not ( = ?auto_733 ?auto_735 ) ) ( not ( = ?auto_736 ?auto_731 ) ) ( CALIBRATION_TARGET ?auto_732 ?auto_735 ) ( POWER_AVAIL ?auto_734 ) ( POINTING ?auto_734 ?auto_733 ) )
    :subtasks
    ( ( !TURN_TO ?auto_734 ?auto_735 ?auto_733 )
      ( GET-2IMAGE ?auto_733 ?auto_736 ?auto_730 ?auto_731 )
      ( GET-1IMAGE-VERIFY ?auto_730 ?auto_731 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_738 - DIRECTION
      ?auto_739 - MODE
      ?auto_740 - DIRECTION
      ?auto_737 - MODE
    )
    :vars
    (
      ?auto_741 - INSTRUMENT
      ?auto_742 - SATELLITE
      ?auto_743 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_740 ?auto_738 ) ) ( ON_BOARD ?auto_741 ?auto_742 ) ( SUPPORTS ?auto_741 ?auto_737 ) ( not ( = ?auto_740 ?auto_743 ) ) ( HAVE_IMAGE ?auto_738 ?auto_739 ) ( not ( = ?auto_738 ?auto_743 ) ) ( not ( = ?auto_739 ?auto_737 ) ) ( CALIBRATION_TARGET ?auto_741 ?auto_743 ) ( POWER_AVAIL ?auto_742 ) ( POINTING ?auto_742 ?auto_738 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_740 ?auto_737 )
      ( GET-2IMAGE-VERIFY ?auto_738 ?auto_739 ?auto_740 ?auto_737 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_745 - DIRECTION
      ?auto_746 - MODE
      ?auto_747 - DIRECTION
      ?auto_744 - MODE
    )
    :vars
    (
      ?auto_748 - INSTRUMENT
      ?auto_749 - SATELLITE
      ?auto_750 - DIRECTION
    )
    :precondition
    ( and ( not ( = ?auto_747 ?auto_745 ) ) ( ON_BOARD ?auto_748 ?auto_749 ) ( SUPPORTS ?auto_748 ?auto_746 ) ( not ( = ?auto_745 ?auto_750 ) ) ( HAVE_IMAGE ?auto_747 ?auto_744 ) ( not ( = ?auto_747 ?auto_750 ) ) ( not ( = ?auto_744 ?auto_746 ) ) ( CALIBRATION_TARGET ?auto_748 ?auto_750 ) ( POWER_AVAIL ?auto_749 ) ( POINTING ?auto_749 ?auto_747 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_747 ?auto_744 ?auto_745 ?auto_746 )
      ( GET-2IMAGE-VERIFY ?auto_745 ?auto_746 ?auto_747 ?auto_744 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_760 - DIRECTION
      ?auto_761 - MODE
    )
    :vars
    (
      ?auto_763 - DIRECTION
      ?auto_762 - INSTRUMENT
      ?auto_765 - SATELLITE
      ?auto_766 - DIRECTION
      ?auto_764 - MODE
      ?auto_767 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_760 ?auto_763 ) ) ( ON_BOARD ?auto_762 ?auto_765 ) ( SUPPORTS ?auto_762 ?auto_761 ) ( not ( = ?auto_760 ?auto_766 ) ) ( HAVE_IMAGE ?auto_763 ?auto_764 ) ( not ( = ?auto_763 ?auto_766 ) ) ( not ( = ?auto_764 ?auto_761 ) ) ( CALIBRATION_TARGET ?auto_762 ?auto_766 ) ( POINTING ?auto_765 ?auto_763 ) ( ON_BOARD ?auto_767 ?auto_765 ) ( POWER_ON ?auto_767 ) ( not ( = ?auto_762 ?auto_767 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_767 ?auto_765 )
      ( GET-2IMAGE ?auto_763 ?auto_764 ?auto_760 ?auto_761 )
      ( GET-1IMAGE-VERIFY ?auto_760 ?auto_761 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_769 - DIRECTION
      ?auto_770 - MODE
      ?auto_771 - DIRECTION
      ?auto_768 - MODE
    )
    :vars
    (
      ?auto_774 - INSTRUMENT
      ?auto_773 - SATELLITE
      ?auto_772 - DIRECTION
      ?auto_775 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_771 ?auto_769 ) ) ( ON_BOARD ?auto_774 ?auto_773 ) ( SUPPORTS ?auto_774 ?auto_768 ) ( not ( = ?auto_771 ?auto_772 ) ) ( HAVE_IMAGE ?auto_769 ?auto_770 ) ( not ( = ?auto_769 ?auto_772 ) ) ( not ( = ?auto_770 ?auto_768 ) ) ( CALIBRATION_TARGET ?auto_774 ?auto_772 ) ( POINTING ?auto_773 ?auto_769 ) ( ON_BOARD ?auto_775 ?auto_773 ) ( POWER_ON ?auto_775 ) ( not ( = ?auto_774 ?auto_775 ) ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_771 ?auto_768 )
      ( GET-2IMAGE-VERIFY ?auto_769 ?auto_770 ?auto_771 ?auto_768 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_777 - DIRECTION
      ?auto_778 - MODE
      ?auto_779 - DIRECTION
      ?auto_776 - MODE
    )
    :vars
    (
      ?auto_780 - INSTRUMENT
      ?auto_783 - SATELLITE
      ?auto_782 - DIRECTION
      ?auto_781 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_779 ?auto_777 ) ) ( ON_BOARD ?auto_780 ?auto_783 ) ( SUPPORTS ?auto_780 ?auto_778 ) ( not ( = ?auto_777 ?auto_782 ) ) ( HAVE_IMAGE ?auto_779 ?auto_776 ) ( not ( = ?auto_779 ?auto_782 ) ) ( not ( = ?auto_776 ?auto_778 ) ) ( CALIBRATION_TARGET ?auto_780 ?auto_782 ) ( POINTING ?auto_783 ?auto_779 ) ( ON_BOARD ?auto_781 ?auto_783 ) ( POWER_ON ?auto_781 ) ( not ( = ?auto_780 ?auto_781 ) ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_779 ?auto_776 ?auto_777 ?auto_778 )
      ( GET-2IMAGE-VERIFY ?auto_777 ?auto_778 ?auto_779 ?auto_776 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_794 - DIRECTION
      ?auto_795 - MODE
    )
    :vars
    (
      ?auto_796 - DIRECTION
      ?auto_797 - INSTRUMENT
      ?auto_800 - SATELLITE
      ?auto_799 - DIRECTION
      ?auto_801 - MODE
      ?auto_798 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_794 ?auto_796 ) ) ( ON_BOARD ?auto_797 ?auto_800 ) ( SUPPORTS ?auto_797 ?auto_795 ) ( not ( = ?auto_794 ?auto_799 ) ) ( not ( = ?auto_796 ?auto_799 ) ) ( not ( = ?auto_801 ?auto_795 ) ) ( CALIBRATION_TARGET ?auto_797 ?auto_799 ) ( POINTING ?auto_800 ?auto_796 ) ( ON_BOARD ?auto_798 ?auto_800 ) ( POWER_ON ?auto_798 ) ( not ( = ?auto_797 ?auto_798 ) ) ( CALIBRATED ?auto_798 ) ( SUPPORTS ?auto_798 ?auto_801 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_796 ?auto_801 )
      ( GET-2IMAGE ?auto_796 ?auto_801 ?auto_794 ?auto_795 )
      ( GET-1IMAGE-VERIFY ?auto_794 ?auto_795 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_803 - DIRECTION
      ?auto_804 - MODE
      ?auto_805 - DIRECTION
      ?auto_802 - MODE
    )
    :vars
    (
      ?auto_807 - INSTRUMENT
      ?auto_806 - SATELLITE
      ?auto_809 - DIRECTION
      ?auto_808 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_805 ?auto_803 ) ) ( ON_BOARD ?auto_807 ?auto_806 ) ( SUPPORTS ?auto_807 ?auto_802 ) ( not ( = ?auto_805 ?auto_809 ) ) ( not ( = ?auto_803 ?auto_809 ) ) ( not ( = ?auto_804 ?auto_802 ) ) ( CALIBRATION_TARGET ?auto_807 ?auto_809 ) ( POINTING ?auto_806 ?auto_803 ) ( ON_BOARD ?auto_808 ?auto_806 ) ( POWER_ON ?auto_808 ) ( not ( = ?auto_807 ?auto_808 ) ) ( CALIBRATED ?auto_808 ) ( SUPPORTS ?auto_808 ?auto_804 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_805 ?auto_802 )
      ( GET-2IMAGE-VERIFY ?auto_803 ?auto_804 ?auto_805 ?auto_802 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_811 - DIRECTION
      ?auto_812 - MODE
      ?auto_813 - DIRECTION
      ?auto_810 - MODE
    )
    :vars
    (
      ?auto_814 - INSTRUMENT
      ?auto_815 - SATELLITE
      ?auto_817 - DIRECTION
      ?auto_816 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_813 ?auto_811 ) ) ( ON_BOARD ?auto_814 ?auto_815 ) ( SUPPORTS ?auto_814 ?auto_812 ) ( not ( = ?auto_811 ?auto_817 ) ) ( not ( = ?auto_813 ?auto_817 ) ) ( not ( = ?auto_810 ?auto_812 ) ) ( CALIBRATION_TARGET ?auto_814 ?auto_817 ) ( POINTING ?auto_815 ?auto_813 ) ( ON_BOARD ?auto_816 ?auto_815 ) ( POWER_ON ?auto_816 ) ( not ( = ?auto_814 ?auto_816 ) ) ( CALIBRATED ?auto_816 ) ( SUPPORTS ?auto_816 ?auto_810 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_813 ?auto_810 ?auto_811 ?auto_812 )
      ( GET-2IMAGE-VERIFY ?auto_811 ?auto_812 ?auto_813 ?auto_810 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_828 - DIRECTION
      ?auto_829 - MODE
    )
    :vars
    (
      ?auto_834 - DIRECTION
      ?auto_830 - INSTRUMENT
      ?auto_831 - SATELLITE
      ?auto_833 - DIRECTION
      ?auto_835 - MODE
      ?auto_832 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_828 ?auto_834 ) ) ( ON_BOARD ?auto_830 ?auto_831 ) ( SUPPORTS ?auto_830 ?auto_829 ) ( not ( = ?auto_828 ?auto_833 ) ) ( not ( = ?auto_834 ?auto_833 ) ) ( not ( = ?auto_835 ?auto_829 ) ) ( CALIBRATION_TARGET ?auto_830 ?auto_833 ) ( ON_BOARD ?auto_832 ?auto_831 ) ( POWER_ON ?auto_832 ) ( not ( = ?auto_830 ?auto_832 ) ) ( CALIBRATED ?auto_832 ) ( SUPPORTS ?auto_832 ?auto_835 ) ( POINTING ?auto_831 ?auto_833 ) )
    :subtasks
    ( ( !TURN_TO ?auto_831 ?auto_834 ?auto_833 )
      ( GET-2IMAGE ?auto_834 ?auto_835 ?auto_828 ?auto_829 )
      ( GET-1IMAGE-VERIFY ?auto_828 ?auto_829 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_837 - DIRECTION
      ?auto_838 - MODE
      ?auto_839 - DIRECTION
      ?auto_836 - MODE
    )
    :vars
    (
      ?auto_840 - INSTRUMENT
      ?auto_842 - SATELLITE
      ?auto_843 - DIRECTION
      ?auto_841 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_839 ?auto_837 ) ) ( ON_BOARD ?auto_840 ?auto_842 ) ( SUPPORTS ?auto_840 ?auto_836 ) ( not ( = ?auto_839 ?auto_843 ) ) ( not ( = ?auto_837 ?auto_843 ) ) ( not ( = ?auto_838 ?auto_836 ) ) ( CALIBRATION_TARGET ?auto_840 ?auto_843 ) ( ON_BOARD ?auto_841 ?auto_842 ) ( POWER_ON ?auto_841 ) ( not ( = ?auto_840 ?auto_841 ) ) ( CALIBRATED ?auto_841 ) ( SUPPORTS ?auto_841 ?auto_838 ) ( POINTING ?auto_842 ?auto_843 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_839 ?auto_836 )
      ( GET-2IMAGE-VERIFY ?auto_837 ?auto_838 ?auto_839 ?auto_836 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_845 - DIRECTION
      ?auto_846 - MODE
      ?auto_847 - DIRECTION
      ?auto_844 - MODE
    )
    :vars
    (
      ?auto_848 - INSTRUMENT
      ?auto_851 - SATELLITE
      ?auto_849 - DIRECTION
      ?auto_850 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_847 ?auto_845 ) ) ( ON_BOARD ?auto_848 ?auto_851 ) ( SUPPORTS ?auto_848 ?auto_846 ) ( not ( = ?auto_845 ?auto_849 ) ) ( not ( = ?auto_847 ?auto_849 ) ) ( not ( = ?auto_844 ?auto_846 ) ) ( CALIBRATION_TARGET ?auto_848 ?auto_849 ) ( ON_BOARD ?auto_850 ?auto_851 ) ( POWER_ON ?auto_850 ) ( not ( = ?auto_848 ?auto_850 ) ) ( CALIBRATED ?auto_850 ) ( SUPPORTS ?auto_850 ?auto_844 ) ( POINTING ?auto_851 ?auto_849 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_847 ?auto_844 ?auto_845 ?auto_846 )
      ( GET-2IMAGE-VERIFY ?auto_845 ?auto_846 ?auto_847 ?auto_844 ) )
  )

  ( :method GET-1IMAGE
    :parameters
    (
      ?auto_862 - DIRECTION
      ?auto_863 - MODE
    )
    :vars
    (
      ?auto_868 - DIRECTION
      ?auto_864 - INSTRUMENT
      ?auto_869 - SATELLITE
      ?auto_865 - DIRECTION
      ?auto_867 - MODE
      ?auto_866 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_862 ?auto_868 ) ) ( ON_BOARD ?auto_864 ?auto_869 ) ( SUPPORTS ?auto_864 ?auto_863 ) ( not ( = ?auto_862 ?auto_865 ) ) ( not ( = ?auto_868 ?auto_865 ) ) ( not ( = ?auto_867 ?auto_863 ) ) ( CALIBRATION_TARGET ?auto_864 ?auto_865 ) ( ON_BOARD ?auto_866 ?auto_869 ) ( POWER_ON ?auto_866 ) ( not ( = ?auto_864 ?auto_866 ) ) ( SUPPORTS ?auto_866 ?auto_867 ) ( POINTING ?auto_869 ?auto_865 ) ( CALIBRATION_TARGET ?auto_866 ?auto_865 ) ( NOT_CALIBRATED ?auto_866 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_869 ?auto_866 ?auto_865 )
      ( GET-2IMAGE ?auto_868 ?auto_867 ?auto_862 ?auto_863 )
      ( GET-1IMAGE-VERIFY ?auto_862 ?auto_863 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_871 - DIRECTION
      ?auto_872 - MODE
      ?auto_873 - DIRECTION
      ?auto_870 - MODE
    )
    :vars
    (
      ?auto_875 - INSTRUMENT
      ?auto_876 - SATELLITE
      ?auto_874 - DIRECTION
      ?auto_877 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_873 ?auto_871 ) ) ( ON_BOARD ?auto_875 ?auto_876 ) ( SUPPORTS ?auto_875 ?auto_870 ) ( not ( = ?auto_873 ?auto_874 ) ) ( not ( = ?auto_871 ?auto_874 ) ) ( not ( = ?auto_872 ?auto_870 ) ) ( CALIBRATION_TARGET ?auto_875 ?auto_874 ) ( ON_BOARD ?auto_877 ?auto_876 ) ( POWER_ON ?auto_877 ) ( not ( = ?auto_875 ?auto_877 ) ) ( SUPPORTS ?auto_877 ?auto_872 ) ( POINTING ?auto_876 ?auto_874 ) ( CALIBRATION_TARGET ?auto_877 ?auto_874 ) ( NOT_CALIBRATED ?auto_877 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_873 ?auto_870 )
      ( GET-2IMAGE-VERIFY ?auto_871 ?auto_872 ?auto_873 ?auto_870 ) )
  )

  ( :method GET-2IMAGE
    :parameters
    (
      ?auto_879 - DIRECTION
      ?auto_880 - MODE
      ?auto_881 - DIRECTION
      ?auto_878 - MODE
    )
    :vars
    (
      ?auto_884 - INSTRUMENT
      ?auto_885 - SATELLITE
      ?auto_883 - DIRECTION
      ?auto_882 - INSTRUMENT
    )
    :precondition
    ( and ( not ( = ?auto_881 ?auto_879 ) ) ( ON_BOARD ?auto_884 ?auto_885 ) ( SUPPORTS ?auto_884 ?auto_880 ) ( not ( = ?auto_879 ?auto_883 ) ) ( not ( = ?auto_881 ?auto_883 ) ) ( not ( = ?auto_878 ?auto_880 ) ) ( CALIBRATION_TARGET ?auto_884 ?auto_883 ) ( ON_BOARD ?auto_882 ?auto_885 ) ( POWER_ON ?auto_882 ) ( not ( = ?auto_884 ?auto_882 ) ) ( SUPPORTS ?auto_882 ?auto_878 ) ( POINTING ?auto_885 ?auto_883 ) ( CALIBRATION_TARGET ?auto_882 ?auto_883 ) ( NOT_CALIBRATED ?auto_882 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_881 ?auto_878 ?auto_879 ?auto_880 )
      ( GET-2IMAGE-VERIFY ?auto_879 ?auto_880 ?auto_881 ?auto_878 ) )
  )

)

