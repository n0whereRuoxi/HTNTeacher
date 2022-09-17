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
      ?auto_584 - INSTRUMENT
      ?auto_583 - SATELLITE
      ?auto_582 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_584 ?auto_583 ) ( SUPPORTS ?auto_584 ?auto_581 ) ( POINTING ?auto_583 ?auto_582 ) ( not ( = ?auto_580 ?auto_582 ) ) ( CALIBRATION_TARGET ?auto_584 ?auto_582 ) ( POWER_AVAIL ?auto_583 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_584 ?auto_583 )
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
      ?auto_596 - SATELLITE
      ?auto_595 - DIRECTION
      ?auto_597 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_594 ?auto_596 ) ( SUPPORTS ?auto_594 ?auto_593 ) ( not ( = ?auto_592 ?auto_595 ) ) ( CALIBRATION_TARGET ?auto_594 ?auto_595 ) ( POWER_AVAIL ?auto_596 ) ( POINTING ?auto_596 ?auto_597 ) ( not ( = ?auto_595 ?auto_597 ) ) ( not ( = ?auto_592 ?auto_597 ) ) )
    :subtasks
    ( ( !TURN_TO ?auto_596 ?auto_595 ?auto_597 )
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
      ?auto_629 - INSTRUMENT
      ?auto_628 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_629 ) ( ON_BOARD ?auto_629 ?auto_628 ) ( SUPPORTS ?auto_629 ?auto_624 ) ( POWER_ON ?auto_629 ) ( POINTING ?auto_628 ?auto_627 ) ( HAVE_IMAGE ?auto_625 ?auto_626 ) ( not ( = ?auto_625 ?auto_627 ) ) ( not ( = ?auto_626 ?auto_624 ) ) )
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
      ?auto_635 - INSTRUMENT
      ?auto_634 - SATELLITE
    )
    :precondition
    ( and ( CALIBRATED ?auto_635 ) ( ON_BOARD ?auto_635 ?auto_634 ) ( SUPPORTS ?auto_635 ?auto_632 ) ( POWER_ON ?auto_635 ) ( POINTING ?auto_634 ?auto_631 ) ( HAVE_IMAGE ?auto_633 ?auto_630 ) ( not ( = ?auto_631 ?auto_633 ) ) ( not ( = ?auto_632 ?auto_630 ) ) )
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
      ?auto_651 - INSTRUMENT
      ?auto_653 - SATELLITE
      ?auto_652 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_651 ) ( ON_BOARD ?auto_651 ?auto_653 ) ( SUPPORTS ?auto_651 ?auto_647 ) ( POWER_ON ?auto_651 ) ( POINTING ?auto_653 ?auto_652 ) ( not ( = ?auto_650 ?auto_652 ) ) ( HAVE_IMAGE ?auto_648 ?auto_649 ) ( not ( = ?auto_648 ?auto_650 ) ) ( not ( = ?auto_648 ?auto_652 ) ) ( not ( = ?auto_649 ?auto_647 ) ) )
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
      ?auto_658 - INSTRUMENT
      ?auto_659 - SATELLITE
      ?auto_660 - DIRECTION
    )
    :precondition
    ( and ( CALIBRATED ?auto_658 ) ( ON_BOARD ?auto_658 ?auto_659 ) ( SUPPORTS ?auto_658 ?auto_656 ) ( POWER_ON ?auto_658 ) ( POINTING ?auto_659 ?auto_660 ) ( not ( = ?auto_655 ?auto_660 ) ) ( HAVE_IMAGE ?auto_657 ?auto_654 ) ( not ( = ?auto_657 ?auto_655 ) ) ( not ( = ?auto_657 ?auto_660 ) ) ( not ( = ?auto_654 ?auto_656 ) ) )
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
      ?auto_673 - INSTRUMENT
      ?auto_674 - SATELLITE
      ?auto_675 - DIRECTION
      ?auto_676 - DIRECTION
      ?auto_672 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_673 ?auto_674 ) ( SUPPORTS ?auto_673 ?auto_671 ) ( POWER_ON ?auto_673 ) ( POINTING ?auto_674 ?auto_675 ) ( not ( = ?auto_670 ?auto_675 ) ) ( HAVE_IMAGE ?auto_676 ?auto_672 ) ( not ( = ?auto_676 ?auto_670 ) ) ( not ( = ?auto_676 ?auto_675 ) ) ( not ( = ?auto_672 ?auto_671 ) ) ( CALIBRATION_TARGET ?auto_673 ?auto_675 ) ( NOT_CALIBRATED ?auto_673 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_674 ?auto_673 ?auto_675 )
      ( GET-2IMAGE ?auto_676 ?auto_672 ?auto_670 ?auto_671 )
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
      ?auto_681 - INSTRUMENT
      ?auto_683 - SATELLITE
      ?auto_682 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_681 ?auto_683 ) ( SUPPORTS ?auto_681 ?auto_677 ) ( POWER_ON ?auto_681 ) ( POINTING ?auto_683 ?auto_682 ) ( not ( = ?auto_680 ?auto_682 ) ) ( HAVE_IMAGE ?auto_678 ?auto_679 ) ( not ( = ?auto_678 ?auto_680 ) ) ( not ( = ?auto_678 ?auto_682 ) ) ( not ( = ?auto_679 ?auto_677 ) ) ( CALIBRATION_TARGET ?auto_681 ?auto_682 ) ( NOT_CALIBRATED ?auto_681 ) )
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
      ?auto_688 - SATELLITE
      ?auto_690 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_689 ?auto_688 ) ( SUPPORTS ?auto_689 ?auto_686 ) ( POWER_ON ?auto_689 ) ( POINTING ?auto_688 ?auto_690 ) ( not ( = ?auto_685 ?auto_690 ) ) ( HAVE_IMAGE ?auto_687 ?auto_684 ) ( not ( = ?auto_687 ?auto_685 ) ) ( not ( = ?auto_687 ?auto_690 ) ) ( not ( = ?auto_684 ?auto_686 ) ) ( CALIBRATION_TARGET ?auto_689 ?auto_690 ) ( NOT_CALIBRATED ?auto_689 ) )
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
      ?auto_703 - INSTRUMENT
      ?auto_702 - SATELLITE
      ?auto_706 - DIRECTION
      ?auto_704 - DIRECTION
      ?auto_705 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_703 ?auto_702 ) ( SUPPORTS ?auto_703 ?auto_701 ) ( POINTING ?auto_702 ?auto_706 ) ( not ( = ?auto_700 ?auto_706 ) ) ( HAVE_IMAGE ?auto_704 ?auto_705 ) ( not ( = ?auto_704 ?auto_700 ) ) ( not ( = ?auto_704 ?auto_706 ) ) ( not ( = ?auto_705 ?auto_701 ) ) ( CALIBRATION_TARGET ?auto_703 ?auto_706 ) ( POWER_AVAIL ?auto_702 ) )
    :subtasks
    ( ( !SWITCH_ON ?auto_703 ?auto_702 )
      ( GET-2IMAGE ?auto_704 ?auto_705 ?auto_700 ?auto_701 )
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
      ?auto_712 - INSTRUMENT
      ?auto_713 - SATELLITE
      ?auto_711 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_712 ?auto_713 ) ( SUPPORTS ?auto_712 ?auto_707 ) ( POINTING ?auto_713 ?auto_711 ) ( not ( = ?auto_710 ?auto_711 ) ) ( HAVE_IMAGE ?auto_708 ?auto_709 ) ( not ( = ?auto_708 ?auto_710 ) ) ( not ( = ?auto_708 ?auto_711 ) ) ( not ( = ?auto_709 ?auto_707 ) ) ( CALIBRATION_TARGET ?auto_712 ?auto_711 ) ( POWER_AVAIL ?auto_713 ) )
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
      ?auto_720 - SATELLITE
      ?auto_719 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_718 ?auto_720 ) ( SUPPORTS ?auto_718 ?auto_716 ) ( POINTING ?auto_720 ?auto_719 ) ( not ( = ?auto_715 ?auto_719 ) ) ( HAVE_IMAGE ?auto_717 ?auto_714 ) ( not ( = ?auto_717 ?auto_715 ) ) ( not ( = ?auto_717 ?auto_719 ) ) ( not ( = ?auto_714 ?auto_716 ) ) ( CALIBRATION_TARGET ?auto_718 ?auto_719 ) ( POWER_AVAIL ?auto_720 ) )
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
      ?auto_732 - INSTRUMENT
      ?auto_736 - SATELLITE
      ?auto_734 - DIRECTION
      ?auto_735 - DIRECTION
      ?auto_733 - MODE
    )
    :precondition
    ( and ( ON_BOARD ?auto_732 ?auto_736 ) ( SUPPORTS ?auto_732 ?auto_731 ) ( not ( = ?auto_730 ?auto_734 ) ) ( HAVE_IMAGE ?auto_735 ?auto_733 ) ( not ( = ?auto_735 ?auto_730 ) ) ( not ( = ?auto_735 ?auto_734 ) ) ( not ( = ?auto_733 ?auto_731 ) ) ( CALIBRATION_TARGET ?auto_732 ?auto_734 ) ( POWER_AVAIL ?auto_736 ) ( POINTING ?auto_736 ?auto_735 ) )
    :subtasks
    ( ( !TURN_TO ?auto_736 ?auto_734 ?auto_735 )
      ( GET-2IMAGE ?auto_735 ?auto_733 ?auto_730 ?auto_731 )
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
      ?auto_743 - INSTRUMENT
      ?auto_742 - SATELLITE
      ?auto_741 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_743 ?auto_742 ) ( SUPPORTS ?auto_743 ?auto_737 ) ( not ( = ?auto_740 ?auto_741 ) ) ( HAVE_IMAGE ?auto_738 ?auto_739 ) ( not ( = ?auto_738 ?auto_740 ) ) ( not ( = ?auto_738 ?auto_741 ) ) ( not ( = ?auto_739 ?auto_737 ) ) ( CALIBRATION_TARGET ?auto_743 ?auto_741 ) ( POWER_AVAIL ?auto_742 ) ( POINTING ?auto_742 ?auto_738 ) )
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
      ?auto_749 - INSTRUMENT
      ?auto_750 - SATELLITE
      ?auto_748 - DIRECTION
    )
    :precondition
    ( and ( ON_BOARD ?auto_749 ?auto_750 ) ( SUPPORTS ?auto_749 ?auto_746 ) ( not ( = ?auto_745 ?auto_748 ) ) ( HAVE_IMAGE ?auto_747 ?auto_744 ) ( not ( = ?auto_747 ?auto_745 ) ) ( not ( = ?auto_747 ?auto_748 ) ) ( not ( = ?auto_744 ?auto_746 ) ) ( CALIBRATION_TARGET ?auto_749 ?auto_748 ) ( POWER_AVAIL ?auto_750 ) ( POINTING ?auto_750 ?auto_747 ) )
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
      ?auto_763 - INSTRUMENT
      ?auto_766 - SATELLITE
      ?auto_762 - DIRECTION
      ?auto_765 - DIRECTION
      ?auto_764 - MODE
      ?auto_767 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_763 ?auto_766 ) ( SUPPORTS ?auto_763 ?auto_761 ) ( not ( = ?auto_760 ?auto_762 ) ) ( HAVE_IMAGE ?auto_765 ?auto_764 ) ( not ( = ?auto_765 ?auto_760 ) ) ( not ( = ?auto_765 ?auto_762 ) ) ( not ( = ?auto_764 ?auto_761 ) ) ( CALIBRATION_TARGET ?auto_763 ?auto_762 ) ( POINTING ?auto_766 ?auto_765 ) ( ON_BOARD ?auto_767 ?auto_766 ) ( POWER_ON ?auto_767 ) ( not ( = ?auto_763 ?auto_767 ) ) )
    :subtasks
    ( ( !SWITCH_OFF ?auto_767 ?auto_766 )
      ( GET-2IMAGE ?auto_765 ?auto_764 ?auto_760 ?auto_761 )
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
      ?auto_772 - INSTRUMENT
      ?auto_775 - SATELLITE
      ?auto_773 - DIRECTION
      ?auto_774 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_772 ?auto_775 ) ( SUPPORTS ?auto_772 ?auto_768 ) ( not ( = ?auto_771 ?auto_773 ) ) ( HAVE_IMAGE ?auto_769 ?auto_770 ) ( not ( = ?auto_769 ?auto_771 ) ) ( not ( = ?auto_769 ?auto_773 ) ) ( not ( = ?auto_770 ?auto_768 ) ) ( CALIBRATION_TARGET ?auto_772 ?auto_773 ) ( POINTING ?auto_775 ?auto_769 ) ( ON_BOARD ?auto_774 ?auto_775 ) ( POWER_ON ?auto_774 ) ( not ( = ?auto_772 ?auto_774 ) ) )
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
      ?auto_783 - INSTRUMENT
      ?auto_782 - SATELLITE
      ?auto_781 - DIRECTION
      ?auto_780 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_783 ?auto_782 ) ( SUPPORTS ?auto_783 ?auto_778 ) ( not ( = ?auto_777 ?auto_781 ) ) ( HAVE_IMAGE ?auto_779 ?auto_776 ) ( not ( = ?auto_779 ?auto_777 ) ) ( not ( = ?auto_779 ?auto_781 ) ) ( not ( = ?auto_776 ?auto_778 ) ) ( CALIBRATION_TARGET ?auto_783 ?auto_781 ) ( POINTING ?auto_782 ?auto_779 ) ( ON_BOARD ?auto_780 ?auto_782 ) ( POWER_ON ?auto_780 ) ( not ( = ?auto_783 ?auto_780 ) ) )
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
      ?auto_799 - INSTRUMENT
      ?auto_798 - SATELLITE
      ?auto_797 - DIRECTION
      ?auto_800 - DIRECTION
      ?auto_801 - MODE
      ?auto_796 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_799 ?auto_798 ) ( SUPPORTS ?auto_799 ?auto_795 ) ( not ( = ?auto_794 ?auto_797 ) ) ( not ( = ?auto_800 ?auto_794 ) ) ( not ( = ?auto_800 ?auto_797 ) ) ( not ( = ?auto_801 ?auto_795 ) ) ( CALIBRATION_TARGET ?auto_799 ?auto_797 ) ( POINTING ?auto_798 ?auto_800 ) ( ON_BOARD ?auto_796 ?auto_798 ) ( POWER_ON ?auto_796 ) ( not ( = ?auto_799 ?auto_796 ) ) ( CALIBRATED ?auto_796 ) ( SUPPORTS ?auto_796 ?auto_801 ) )
    :subtasks
    ( ( GET-1IMAGE ?auto_800 ?auto_801 )
      ( GET-2IMAGE ?auto_800 ?auto_801 ?auto_794 ?auto_795 )
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
      ?auto_809 - INSTRUMENT
      ?auto_808 - SATELLITE
      ?auto_806 - DIRECTION
      ?auto_807 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_809 ?auto_808 ) ( SUPPORTS ?auto_809 ?auto_802 ) ( not ( = ?auto_805 ?auto_806 ) ) ( not ( = ?auto_803 ?auto_805 ) ) ( not ( = ?auto_803 ?auto_806 ) ) ( not ( = ?auto_804 ?auto_802 ) ) ( CALIBRATION_TARGET ?auto_809 ?auto_806 ) ( POINTING ?auto_808 ?auto_803 ) ( ON_BOARD ?auto_807 ?auto_808 ) ( POWER_ON ?auto_807 ) ( not ( = ?auto_809 ?auto_807 ) ) ( CALIBRATED ?auto_807 ) ( SUPPORTS ?auto_807 ?auto_804 ) )
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
      ?auto_815 - INSTRUMENT
      ?auto_814 - SATELLITE
      ?auto_817 - DIRECTION
      ?auto_816 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_815 ?auto_814 ) ( SUPPORTS ?auto_815 ?auto_812 ) ( not ( = ?auto_811 ?auto_817 ) ) ( not ( = ?auto_813 ?auto_811 ) ) ( not ( = ?auto_813 ?auto_817 ) ) ( not ( = ?auto_810 ?auto_812 ) ) ( CALIBRATION_TARGET ?auto_815 ?auto_817 ) ( POINTING ?auto_814 ?auto_813 ) ( ON_BOARD ?auto_816 ?auto_814 ) ( POWER_ON ?auto_816 ) ( not ( = ?auto_815 ?auto_816 ) ) ( CALIBRATED ?auto_816 ) ( SUPPORTS ?auto_816 ?auto_810 ) )
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
      ?auto_831 - INSTRUMENT
      ?auto_830 - SATELLITE
      ?auto_833 - DIRECTION
      ?auto_835 - DIRECTION
      ?auto_834 - MODE
      ?auto_832 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_831 ?auto_830 ) ( SUPPORTS ?auto_831 ?auto_829 ) ( not ( = ?auto_828 ?auto_833 ) ) ( not ( = ?auto_835 ?auto_828 ) ) ( not ( = ?auto_835 ?auto_833 ) ) ( not ( = ?auto_834 ?auto_829 ) ) ( CALIBRATION_TARGET ?auto_831 ?auto_833 ) ( ON_BOARD ?auto_832 ?auto_830 ) ( POWER_ON ?auto_832 ) ( not ( = ?auto_831 ?auto_832 ) ) ( CALIBRATED ?auto_832 ) ( SUPPORTS ?auto_832 ?auto_834 ) ( POINTING ?auto_830 ?auto_833 ) )
    :subtasks
    ( ( !TURN_TO ?auto_830 ?auto_835 ?auto_833 )
      ( GET-2IMAGE ?auto_835 ?auto_834 ?auto_828 ?auto_829 )
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
      ?auto_841 - INSTRUMENT
      ?auto_840 - SATELLITE
      ?auto_842 - DIRECTION
      ?auto_843 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_841 ?auto_840 ) ( SUPPORTS ?auto_841 ?auto_836 ) ( not ( = ?auto_839 ?auto_842 ) ) ( not ( = ?auto_837 ?auto_839 ) ) ( not ( = ?auto_837 ?auto_842 ) ) ( not ( = ?auto_838 ?auto_836 ) ) ( CALIBRATION_TARGET ?auto_841 ?auto_842 ) ( ON_BOARD ?auto_843 ?auto_840 ) ( POWER_ON ?auto_843 ) ( not ( = ?auto_841 ?auto_843 ) ) ( CALIBRATED ?auto_843 ) ( SUPPORTS ?auto_843 ?auto_838 ) ( POINTING ?auto_840 ?auto_842 ) )
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
      ?auto_849 - INSTRUMENT
      ?auto_848 - SATELLITE
      ?auto_851 - DIRECTION
      ?auto_850 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_849 ?auto_848 ) ( SUPPORTS ?auto_849 ?auto_846 ) ( not ( = ?auto_845 ?auto_851 ) ) ( not ( = ?auto_847 ?auto_845 ) ) ( not ( = ?auto_847 ?auto_851 ) ) ( not ( = ?auto_844 ?auto_846 ) ) ( CALIBRATION_TARGET ?auto_849 ?auto_851 ) ( ON_BOARD ?auto_850 ?auto_848 ) ( POWER_ON ?auto_850 ) ( not ( = ?auto_849 ?auto_850 ) ) ( CALIBRATED ?auto_850 ) ( SUPPORTS ?auto_850 ?auto_844 ) ( POINTING ?auto_848 ?auto_851 ) )
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
      ?auto_865 - INSTRUMENT
      ?auto_864 - SATELLITE
      ?auto_869 - DIRECTION
      ?auto_868 - DIRECTION
      ?auto_867 - MODE
      ?auto_866 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_865 ?auto_864 ) ( SUPPORTS ?auto_865 ?auto_863 ) ( not ( = ?auto_862 ?auto_869 ) ) ( not ( = ?auto_868 ?auto_862 ) ) ( not ( = ?auto_868 ?auto_869 ) ) ( not ( = ?auto_867 ?auto_863 ) ) ( CALIBRATION_TARGET ?auto_865 ?auto_869 ) ( ON_BOARD ?auto_866 ?auto_864 ) ( POWER_ON ?auto_866 ) ( not ( = ?auto_865 ?auto_866 ) ) ( SUPPORTS ?auto_866 ?auto_867 ) ( POINTING ?auto_864 ?auto_869 ) ( CALIBRATION_TARGET ?auto_866 ?auto_869 ) ( NOT_CALIBRATED ?auto_866 ) )
    :subtasks
    ( ( !CALIBRATE ?auto_864 ?auto_866 ?auto_869 )
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
      ?auto_876 - INSTRUMENT
      ?auto_877 - SATELLITE
      ?auto_875 - DIRECTION
      ?auto_874 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_876 ?auto_877 ) ( SUPPORTS ?auto_876 ?auto_870 ) ( not ( = ?auto_873 ?auto_875 ) ) ( not ( = ?auto_871 ?auto_873 ) ) ( not ( = ?auto_871 ?auto_875 ) ) ( not ( = ?auto_872 ?auto_870 ) ) ( CALIBRATION_TARGET ?auto_876 ?auto_875 ) ( ON_BOARD ?auto_874 ?auto_877 ) ( POWER_ON ?auto_874 ) ( not ( = ?auto_876 ?auto_874 ) ) ( SUPPORTS ?auto_874 ?auto_872 ) ( POINTING ?auto_877 ?auto_875 ) ( CALIBRATION_TARGET ?auto_874 ?auto_875 ) ( NOT_CALIBRATED ?auto_874 ) )
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
      ?auto_885 - INSTRUMENT
      ?auto_884 - SATELLITE
      ?auto_882 - DIRECTION
      ?auto_883 - INSTRUMENT
    )
    :precondition
    ( and ( ON_BOARD ?auto_885 ?auto_884 ) ( SUPPORTS ?auto_885 ?auto_880 ) ( not ( = ?auto_879 ?auto_882 ) ) ( not ( = ?auto_881 ?auto_879 ) ) ( not ( = ?auto_881 ?auto_882 ) ) ( not ( = ?auto_878 ?auto_880 ) ) ( CALIBRATION_TARGET ?auto_885 ?auto_882 ) ( ON_BOARD ?auto_883 ?auto_884 ) ( POWER_ON ?auto_883 ) ( not ( = ?auto_885 ?auto_883 ) ) ( SUPPORTS ?auto_883 ?auto_878 ) ( POINTING ?auto_884 ?auto_882 ) ( CALIBRATION_TARGET ?auto_883 ?auto_882 ) ( NOT_CALIBRATED ?auto_883 ) )
    :subtasks
    ( ( GET-2IMAGE ?auto_881 ?auto_878 ?auto_879 ?auto_880 )
      ( GET-2IMAGE-VERIFY ?auto_879 ?auto_880 ?auto_881 ?auto_878 ) )
  )

)

