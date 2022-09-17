( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_696 - SURFACE
      ?auto_697 - SURFACE
    )
    :vars
    (
      ?auto_698 - HOIST
      ?auto_699 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_698 ?auto_699 ) ( SURFACE-AT ?auto_697 ?auto_699 ) ( CLEAR ?auto_697 ) ( LIFTING ?auto_698 ?auto_696 ) ( IS-CRATE ?auto_696 ) ( not ( = ?auto_696 ?auto_697 ) ) )
    :subtasks
    ( ( !DROP ?auto_698 ?auto_696 ?auto_697 ?auto_699 )
      ( MAKE-ON-VERIFY ?auto_696 ?auto_697 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_700 - SURFACE
      ?auto_701 - SURFACE
    )
    :vars
    (
      ?auto_702 - HOIST
      ?auto_703 - PLACE
      ?auto_704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_702 ?auto_703 ) ( SURFACE-AT ?auto_701 ?auto_703 ) ( CLEAR ?auto_701 ) ( IS-CRATE ?auto_700 ) ( not ( = ?auto_700 ?auto_701 ) ) ( TRUCK-AT ?auto_704 ?auto_703 ) ( AVAILABLE ?auto_702 ) ( IN ?auto_700 ?auto_704 ) )
    :subtasks
    ( ( !UNLOAD ?auto_702 ?auto_700 ?auto_704 ?auto_703 )
      ( MAKE-ON ?auto_700 ?auto_701 )
      ( MAKE-ON-VERIFY ?auto_700 ?auto_701 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_705 - SURFACE
      ?auto_706 - SURFACE
    )
    :vars
    (
      ?auto_707 - HOIST
      ?auto_709 - PLACE
      ?auto_708 - TRUCK
      ?auto_710 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_707 ?auto_709 ) ( SURFACE-AT ?auto_706 ?auto_709 ) ( CLEAR ?auto_706 ) ( IS-CRATE ?auto_705 ) ( not ( = ?auto_705 ?auto_706 ) ) ( AVAILABLE ?auto_707 ) ( IN ?auto_705 ?auto_708 ) ( TRUCK-AT ?auto_708 ?auto_710 ) ( not ( = ?auto_710 ?auto_709 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_708 ?auto_710 ?auto_709 )
      ( MAKE-ON ?auto_705 ?auto_706 )
      ( MAKE-ON-VERIFY ?auto_705 ?auto_706 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_711 - SURFACE
      ?auto_712 - SURFACE
    )
    :vars
    (
      ?auto_716 - HOIST
      ?auto_715 - PLACE
      ?auto_713 - TRUCK
      ?auto_714 - PLACE
      ?auto_717 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_716 ?auto_715 ) ( SURFACE-AT ?auto_712 ?auto_715 ) ( CLEAR ?auto_712 ) ( IS-CRATE ?auto_711 ) ( not ( = ?auto_711 ?auto_712 ) ) ( AVAILABLE ?auto_716 ) ( TRUCK-AT ?auto_713 ?auto_714 ) ( not ( = ?auto_714 ?auto_715 ) ) ( HOIST-AT ?auto_717 ?auto_714 ) ( LIFTING ?auto_717 ?auto_711 ) ( not ( = ?auto_716 ?auto_717 ) ) )
    :subtasks
    ( ( !LOAD ?auto_717 ?auto_711 ?auto_713 ?auto_714 )
      ( MAKE-ON ?auto_711 ?auto_712 )
      ( MAKE-ON-VERIFY ?auto_711 ?auto_712 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_718 - SURFACE
      ?auto_719 - SURFACE
    )
    :vars
    (
      ?auto_722 - HOIST
      ?auto_723 - PLACE
      ?auto_724 - TRUCK
      ?auto_721 - PLACE
      ?auto_720 - HOIST
      ?auto_725 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_722 ?auto_723 ) ( SURFACE-AT ?auto_719 ?auto_723 ) ( CLEAR ?auto_719 ) ( IS-CRATE ?auto_718 ) ( not ( = ?auto_718 ?auto_719 ) ) ( AVAILABLE ?auto_722 ) ( TRUCK-AT ?auto_724 ?auto_721 ) ( not ( = ?auto_721 ?auto_723 ) ) ( HOIST-AT ?auto_720 ?auto_721 ) ( not ( = ?auto_722 ?auto_720 ) ) ( AVAILABLE ?auto_720 ) ( SURFACE-AT ?auto_718 ?auto_721 ) ( ON ?auto_718 ?auto_725 ) ( CLEAR ?auto_718 ) ( not ( = ?auto_718 ?auto_725 ) ) ( not ( = ?auto_719 ?auto_725 ) ) )
    :subtasks
    ( ( !LIFT ?auto_720 ?auto_718 ?auto_725 ?auto_721 )
      ( MAKE-ON ?auto_718 ?auto_719 )
      ( MAKE-ON-VERIFY ?auto_718 ?auto_719 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_726 - SURFACE
      ?auto_727 - SURFACE
    )
    :vars
    (
      ?auto_728 - HOIST
      ?auto_731 - PLACE
      ?auto_729 - PLACE
      ?auto_733 - HOIST
      ?auto_730 - SURFACE
      ?auto_732 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_728 ?auto_731 ) ( SURFACE-AT ?auto_727 ?auto_731 ) ( CLEAR ?auto_727 ) ( IS-CRATE ?auto_726 ) ( not ( = ?auto_726 ?auto_727 ) ) ( AVAILABLE ?auto_728 ) ( not ( = ?auto_729 ?auto_731 ) ) ( HOIST-AT ?auto_733 ?auto_729 ) ( not ( = ?auto_728 ?auto_733 ) ) ( AVAILABLE ?auto_733 ) ( SURFACE-AT ?auto_726 ?auto_729 ) ( ON ?auto_726 ?auto_730 ) ( CLEAR ?auto_726 ) ( not ( = ?auto_726 ?auto_730 ) ) ( not ( = ?auto_727 ?auto_730 ) ) ( TRUCK-AT ?auto_732 ?auto_731 ) )
    :subtasks
    ( ( !DRIVE ?auto_732 ?auto_731 ?auto_729 )
      ( MAKE-ON ?auto_726 ?auto_727 )
      ( MAKE-ON-VERIFY ?auto_726 ?auto_727 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_736 - SURFACE
      ?auto_737 - SURFACE
    )
    :vars
    (
      ?auto_738 - HOIST
      ?auto_739 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_738 ?auto_739 ) ( SURFACE-AT ?auto_737 ?auto_739 ) ( CLEAR ?auto_737 ) ( LIFTING ?auto_738 ?auto_736 ) ( IS-CRATE ?auto_736 ) ( not ( = ?auto_736 ?auto_737 ) ) )
    :subtasks
    ( ( !DROP ?auto_738 ?auto_736 ?auto_737 ?auto_739 )
      ( MAKE-ON-VERIFY ?auto_736 ?auto_737 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_740 - SURFACE
      ?auto_741 - SURFACE
    )
    :vars
    (
      ?auto_742 - HOIST
      ?auto_743 - PLACE
      ?auto_744 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_742 ?auto_743 ) ( SURFACE-AT ?auto_741 ?auto_743 ) ( CLEAR ?auto_741 ) ( IS-CRATE ?auto_740 ) ( not ( = ?auto_740 ?auto_741 ) ) ( TRUCK-AT ?auto_744 ?auto_743 ) ( AVAILABLE ?auto_742 ) ( IN ?auto_740 ?auto_744 ) )
    :subtasks
    ( ( !UNLOAD ?auto_742 ?auto_740 ?auto_744 ?auto_743 )
      ( MAKE-ON ?auto_740 ?auto_741 )
      ( MAKE-ON-VERIFY ?auto_740 ?auto_741 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_745 - SURFACE
      ?auto_746 - SURFACE
    )
    :vars
    (
      ?auto_749 - HOIST
      ?auto_747 - PLACE
      ?auto_748 - TRUCK
      ?auto_750 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_749 ?auto_747 ) ( SURFACE-AT ?auto_746 ?auto_747 ) ( CLEAR ?auto_746 ) ( IS-CRATE ?auto_745 ) ( not ( = ?auto_745 ?auto_746 ) ) ( AVAILABLE ?auto_749 ) ( IN ?auto_745 ?auto_748 ) ( TRUCK-AT ?auto_748 ?auto_750 ) ( not ( = ?auto_750 ?auto_747 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_748 ?auto_750 ?auto_747 )
      ( MAKE-ON ?auto_745 ?auto_746 )
      ( MAKE-ON-VERIFY ?auto_745 ?auto_746 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_751 - SURFACE
      ?auto_752 - SURFACE
    )
    :vars
    (
      ?auto_754 - HOIST
      ?auto_755 - PLACE
      ?auto_756 - TRUCK
      ?auto_753 - PLACE
      ?auto_757 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_754 ?auto_755 ) ( SURFACE-AT ?auto_752 ?auto_755 ) ( CLEAR ?auto_752 ) ( IS-CRATE ?auto_751 ) ( not ( = ?auto_751 ?auto_752 ) ) ( AVAILABLE ?auto_754 ) ( TRUCK-AT ?auto_756 ?auto_753 ) ( not ( = ?auto_753 ?auto_755 ) ) ( HOIST-AT ?auto_757 ?auto_753 ) ( LIFTING ?auto_757 ?auto_751 ) ( not ( = ?auto_754 ?auto_757 ) ) )
    :subtasks
    ( ( !LOAD ?auto_757 ?auto_751 ?auto_756 ?auto_753 )
      ( MAKE-ON ?auto_751 ?auto_752 )
      ( MAKE-ON-VERIFY ?auto_751 ?auto_752 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_758 - SURFACE
      ?auto_759 - SURFACE
    )
    :vars
    (
      ?auto_761 - HOIST
      ?auto_762 - PLACE
      ?auto_764 - TRUCK
      ?auto_760 - PLACE
      ?auto_763 - HOIST
      ?auto_765 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_761 ?auto_762 ) ( SURFACE-AT ?auto_759 ?auto_762 ) ( CLEAR ?auto_759 ) ( IS-CRATE ?auto_758 ) ( not ( = ?auto_758 ?auto_759 ) ) ( AVAILABLE ?auto_761 ) ( TRUCK-AT ?auto_764 ?auto_760 ) ( not ( = ?auto_760 ?auto_762 ) ) ( HOIST-AT ?auto_763 ?auto_760 ) ( not ( = ?auto_761 ?auto_763 ) ) ( AVAILABLE ?auto_763 ) ( SURFACE-AT ?auto_758 ?auto_760 ) ( ON ?auto_758 ?auto_765 ) ( CLEAR ?auto_758 ) ( not ( = ?auto_758 ?auto_765 ) ) ( not ( = ?auto_759 ?auto_765 ) ) )
    :subtasks
    ( ( !LIFT ?auto_763 ?auto_758 ?auto_765 ?auto_760 )
      ( MAKE-ON ?auto_758 ?auto_759 )
      ( MAKE-ON-VERIFY ?auto_758 ?auto_759 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_766 - SURFACE
      ?auto_767 - SURFACE
    )
    :vars
    (
      ?auto_773 - HOIST
      ?auto_772 - PLACE
      ?auto_769 - PLACE
      ?auto_768 - HOIST
      ?auto_771 - SURFACE
      ?auto_770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_773 ?auto_772 ) ( SURFACE-AT ?auto_767 ?auto_772 ) ( CLEAR ?auto_767 ) ( IS-CRATE ?auto_766 ) ( not ( = ?auto_766 ?auto_767 ) ) ( AVAILABLE ?auto_773 ) ( not ( = ?auto_769 ?auto_772 ) ) ( HOIST-AT ?auto_768 ?auto_769 ) ( not ( = ?auto_773 ?auto_768 ) ) ( AVAILABLE ?auto_768 ) ( SURFACE-AT ?auto_766 ?auto_769 ) ( ON ?auto_766 ?auto_771 ) ( CLEAR ?auto_766 ) ( not ( = ?auto_766 ?auto_771 ) ) ( not ( = ?auto_767 ?auto_771 ) ) ( TRUCK-AT ?auto_770 ?auto_772 ) )
    :subtasks
    ( ( !DRIVE ?auto_770 ?auto_772 ?auto_769 )
      ( MAKE-ON ?auto_766 ?auto_767 )
      ( MAKE-ON-VERIFY ?auto_766 ?auto_767 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_774 - SURFACE
      ?auto_775 - SURFACE
    )
    :vars
    (
      ?auto_776 - HOIST
      ?auto_781 - PLACE
      ?auto_778 - PLACE
      ?auto_779 - HOIST
      ?auto_780 - SURFACE
      ?auto_777 - TRUCK
      ?auto_782 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_776 ?auto_781 ) ( IS-CRATE ?auto_774 ) ( not ( = ?auto_774 ?auto_775 ) ) ( not ( = ?auto_778 ?auto_781 ) ) ( HOIST-AT ?auto_779 ?auto_778 ) ( not ( = ?auto_776 ?auto_779 ) ) ( AVAILABLE ?auto_779 ) ( SURFACE-AT ?auto_774 ?auto_778 ) ( ON ?auto_774 ?auto_780 ) ( CLEAR ?auto_774 ) ( not ( = ?auto_774 ?auto_780 ) ) ( not ( = ?auto_775 ?auto_780 ) ) ( TRUCK-AT ?auto_777 ?auto_781 ) ( SURFACE-AT ?auto_782 ?auto_781 ) ( CLEAR ?auto_782 ) ( LIFTING ?auto_776 ?auto_775 ) ( IS-CRATE ?auto_775 ) ( not ( = ?auto_774 ?auto_782 ) ) ( not ( = ?auto_775 ?auto_782 ) ) ( not ( = ?auto_780 ?auto_782 ) ) )
    :subtasks
    ( ( !DROP ?auto_776 ?auto_775 ?auto_782 ?auto_781 )
      ( MAKE-ON ?auto_774 ?auto_775 )
      ( MAKE-ON-VERIFY ?auto_774 ?auto_775 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_783 - SURFACE
      ?auto_784 - SURFACE
    )
    :vars
    (
      ?auto_791 - HOIST
      ?auto_789 - PLACE
      ?auto_787 - PLACE
      ?auto_786 - HOIST
      ?auto_785 - SURFACE
      ?auto_788 - TRUCK
      ?auto_790 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_791 ?auto_789 ) ( IS-CRATE ?auto_783 ) ( not ( = ?auto_783 ?auto_784 ) ) ( not ( = ?auto_787 ?auto_789 ) ) ( HOIST-AT ?auto_786 ?auto_787 ) ( not ( = ?auto_791 ?auto_786 ) ) ( AVAILABLE ?auto_786 ) ( SURFACE-AT ?auto_783 ?auto_787 ) ( ON ?auto_783 ?auto_785 ) ( CLEAR ?auto_783 ) ( not ( = ?auto_783 ?auto_785 ) ) ( not ( = ?auto_784 ?auto_785 ) ) ( TRUCK-AT ?auto_788 ?auto_789 ) ( SURFACE-AT ?auto_790 ?auto_789 ) ( CLEAR ?auto_790 ) ( IS-CRATE ?auto_784 ) ( not ( = ?auto_783 ?auto_790 ) ) ( not ( = ?auto_784 ?auto_790 ) ) ( not ( = ?auto_785 ?auto_790 ) ) ( AVAILABLE ?auto_791 ) ( IN ?auto_784 ?auto_788 ) )
    :subtasks
    ( ( !UNLOAD ?auto_791 ?auto_784 ?auto_788 ?auto_789 )
      ( MAKE-ON ?auto_783 ?auto_784 )
      ( MAKE-ON-VERIFY ?auto_783 ?auto_784 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_792 - SURFACE
      ?auto_793 - SURFACE
    )
    :vars
    (
      ?auto_800 - HOIST
      ?auto_798 - PLACE
      ?auto_796 - PLACE
      ?auto_797 - HOIST
      ?auto_795 - SURFACE
      ?auto_794 - SURFACE
      ?auto_799 - TRUCK
      ?auto_801 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_800 ?auto_798 ) ( IS-CRATE ?auto_792 ) ( not ( = ?auto_792 ?auto_793 ) ) ( not ( = ?auto_796 ?auto_798 ) ) ( HOIST-AT ?auto_797 ?auto_796 ) ( not ( = ?auto_800 ?auto_797 ) ) ( AVAILABLE ?auto_797 ) ( SURFACE-AT ?auto_792 ?auto_796 ) ( ON ?auto_792 ?auto_795 ) ( CLEAR ?auto_792 ) ( not ( = ?auto_792 ?auto_795 ) ) ( not ( = ?auto_793 ?auto_795 ) ) ( SURFACE-AT ?auto_794 ?auto_798 ) ( CLEAR ?auto_794 ) ( IS-CRATE ?auto_793 ) ( not ( = ?auto_792 ?auto_794 ) ) ( not ( = ?auto_793 ?auto_794 ) ) ( not ( = ?auto_795 ?auto_794 ) ) ( AVAILABLE ?auto_800 ) ( IN ?auto_793 ?auto_799 ) ( TRUCK-AT ?auto_799 ?auto_801 ) ( not ( = ?auto_801 ?auto_798 ) ) ( not ( = ?auto_796 ?auto_801 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_799 ?auto_801 ?auto_798 )
      ( MAKE-ON ?auto_792 ?auto_793 )
      ( MAKE-ON-VERIFY ?auto_792 ?auto_793 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_802 - SURFACE
      ?auto_803 - SURFACE
    )
    :vars
    (
      ?auto_804 - HOIST
      ?auto_811 - PLACE
      ?auto_806 - PLACE
      ?auto_807 - HOIST
      ?auto_810 - SURFACE
      ?auto_809 - SURFACE
      ?auto_805 - TRUCK
      ?auto_808 - PLACE
      ?auto_812 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_804 ?auto_811 ) ( IS-CRATE ?auto_802 ) ( not ( = ?auto_802 ?auto_803 ) ) ( not ( = ?auto_806 ?auto_811 ) ) ( HOIST-AT ?auto_807 ?auto_806 ) ( not ( = ?auto_804 ?auto_807 ) ) ( AVAILABLE ?auto_807 ) ( SURFACE-AT ?auto_802 ?auto_806 ) ( ON ?auto_802 ?auto_810 ) ( CLEAR ?auto_802 ) ( not ( = ?auto_802 ?auto_810 ) ) ( not ( = ?auto_803 ?auto_810 ) ) ( SURFACE-AT ?auto_809 ?auto_811 ) ( CLEAR ?auto_809 ) ( IS-CRATE ?auto_803 ) ( not ( = ?auto_802 ?auto_809 ) ) ( not ( = ?auto_803 ?auto_809 ) ) ( not ( = ?auto_810 ?auto_809 ) ) ( AVAILABLE ?auto_804 ) ( TRUCK-AT ?auto_805 ?auto_808 ) ( not ( = ?auto_808 ?auto_811 ) ) ( not ( = ?auto_806 ?auto_808 ) ) ( HOIST-AT ?auto_812 ?auto_808 ) ( LIFTING ?auto_812 ?auto_803 ) ( not ( = ?auto_804 ?auto_812 ) ) ( not ( = ?auto_807 ?auto_812 ) ) )
    :subtasks
    ( ( !LOAD ?auto_812 ?auto_803 ?auto_805 ?auto_808 )
      ( MAKE-ON ?auto_802 ?auto_803 )
      ( MAKE-ON-VERIFY ?auto_802 ?auto_803 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_813 - SURFACE
      ?auto_814 - SURFACE
    )
    :vars
    (
      ?auto_819 - HOIST
      ?auto_822 - PLACE
      ?auto_817 - PLACE
      ?auto_816 - HOIST
      ?auto_815 - SURFACE
      ?auto_823 - SURFACE
      ?auto_821 - TRUCK
      ?auto_820 - PLACE
      ?auto_818 - HOIST
      ?auto_824 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_819 ?auto_822 ) ( IS-CRATE ?auto_813 ) ( not ( = ?auto_813 ?auto_814 ) ) ( not ( = ?auto_817 ?auto_822 ) ) ( HOIST-AT ?auto_816 ?auto_817 ) ( not ( = ?auto_819 ?auto_816 ) ) ( AVAILABLE ?auto_816 ) ( SURFACE-AT ?auto_813 ?auto_817 ) ( ON ?auto_813 ?auto_815 ) ( CLEAR ?auto_813 ) ( not ( = ?auto_813 ?auto_815 ) ) ( not ( = ?auto_814 ?auto_815 ) ) ( SURFACE-AT ?auto_823 ?auto_822 ) ( CLEAR ?auto_823 ) ( IS-CRATE ?auto_814 ) ( not ( = ?auto_813 ?auto_823 ) ) ( not ( = ?auto_814 ?auto_823 ) ) ( not ( = ?auto_815 ?auto_823 ) ) ( AVAILABLE ?auto_819 ) ( TRUCK-AT ?auto_821 ?auto_820 ) ( not ( = ?auto_820 ?auto_822 ) ) ( not ( = ?auto_817 ?auto_820 ) ) ( HOIST-AT ?auto_818 ?auto_820 ) ( not ( = ?auto_819 ?auto_818 ) ) ( not ( = ?auto_816 ?auto_818 ) ) ( AVAILABLE ?auto_818 ) ( SURFACE-AT ?auto_814 ?auto_820 ) ( ON ?auto_814 ?auto_824 ) ( CLEAR ?auto_814 ) ( not ( = ?auto_813 ?auto_824 ) ) ( not ( = ?auto_814 ?auto_824 ) ) ( not ( = ?auto_815 ?auto_824 ) ) ( not ( = ?auto_823 ?auto_824 ) ) )
    :subtasks
    ( ( !LIFT ?auto_818 ?auto_814 ?auto_824 ?auto_820 )
      ( MAKE-ON ?auto_813 ?auto_814 )
      ( MAKE-ON-VERIFY ?auto_813 ?auto_814 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_825 - SURFACE
      ?auto_826 - SURFACE
    )
    :vars
    (
      ?auto_832 - HOIST
      ?auto_834 - PLACE
      ?auto_828 - PLACE
      ?auto_827 - HOIST
      ?auto_833 - SURFACE
      ?auto_830 - SURFACE
      ?auto_831 - PLACE
      ?auto_829 - HOIST
      ?auto_836 - SURFACE
      ?auto_835 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_832 ?auto_834 ) ( IS-CRATE ?auto_825 ) ( not ( = ?auto_825 ?auto_826 ) ) ( not ( = ?auto_828 ?auto_834 ) ) ( HOIST-AT ?auto_827 ?auto_828 ) ( not ( = ?auto_832 ?auto_827 ) ) ( AVAILABLE ?auto_827 ) ( SURFACE-AT ?auto_825 ?auto_828 ) ( ON ?auto_825 ?auto_833 ) ( CLEAR ?auto_825 ) ( not ( = ?auto_825 ?auto_833 ) ) ( not ( = ?auto_826 ?auto_833 ) ) ( SURFACE-AT ?auto_830 ?auto_834 ) ( CLEAR ?auto_830 ) ( IS-CRATE ?auto_826 ) ( not ( = ?auto_825 ?auto_830 ) ) ( not ( = ?auto_826 ?auto_830 ) ) ( not ( = ?auto_833 ?auto_830 ) ) ( AVAILABLE ?auto_832 ) ( not ( = ?auto_831 ?auto_834 ) ) ( not ( = ?auto_828 ?auto_831 ) ) ( HOIST-AT ?auto_829 ?auto_831 ) ( not ( = ?auto_832 ?auto_829 ) ) ( not ( = ?auto_827 ?auto_829 ) ) ( AVAILABLE ?auto_829 ) ( SURFACE-AT ?auto_826 ?auto_831 ) ( ON ?auto_826 ?auto_836 ) ( CLEAR ?auto_826 ) ( not ( = ?auto_825 ?auto_836 ) ) ( not ( = ?auto_826 ?auto_836 ) ) ( not ( = ?auto_833 ?auto_836 ) ) ( not ( = ?auto_830 ?auto_836 ) ) ( TRUCK-AT ?auto_835 ?auto_834 ) )
    :subtasks
    ( ( !DRIVE ?auto_835 ?auto_834 ?auto_831 )
      ( MAKE-ON ?auto_825 ?auto_826 )
      ( MAKE-ON-VERIFY ?auto_825 ?auto_826 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_839 - SURFACE
      ?auto_840 - SURFACE
    )
    :vars
    (
      ?auto_841 - HOIST
      ?auto_842 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_841 ?auto_842 ) ( SURFACE-AT ?auto_840 ?auto_842 ) ( CLEAR ?auto_840 ) ( LIFTING ?auto_841 ?auto_839 ) ( IS-CRATE ?auto_839 ) ( not ( = ?auto_839 ?auto_840 ) ) )
    :subtasks
    ( ( !DROP ?auto_841 ?auto_839 ?auto_840 ?auto_842 )
      ( MAKE-ON-VERIFY ?auto_839 ?auto_840 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_843 - SURFACE
      ?auto_844 - SURFACE
    )
    :vars
    (
      ?auto_845 - HOIST
      ?auto_846 - PLACE
      ?auto_847 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845 ?auto_846 ) ( SURFACE-AT ?auto_844 ?auto_846 ) ( CLEAR ?auto_844 ) ( IS-CRATE ?auto_843 ) ( not ( = ?auto_843 ?auto_844 ) ) ( TRUCK-AT ?auto_847 ?auto_846 ) ( AVAILABLE ?auto_845 ) ( IN ?auto_843 ?auto_847 ) )
    :subtasks
    ( ( !UNLOAD ?auto_845 ?auto_843 ?auto_847 ?auto_846 )
      ( MAKE-ON ?auto_843 ?auto_844 )
      ( MAKE-ON-VERIFY ?auto_843 ?auto_844 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_848 - SURFACE
      ?auto_849 - SURFACE
    )
    :vars
    (
      ?auto_850 - HOIST
      ?auto_851 - PLACE
      ?auto_852 - TRUCK
      ?auto_853 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_850 ?auto_851 ) ( SURFACE-AT ?auto_849 ?auto_851 ) ( CLEAR ?auto_849 ) ( IS-CRATE ?auto_848 ) ( not ( = ?auto_848 ?auto_849 ) ) ( AVAILABLE ?auto_850 ) ( IN ?auto_848 ?auto_852 ) ( TRUCK-AT ?auto_852 ?auto_853 ) ( not ( = ?auto_853 ?auto_851 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_852 ?auto_853 ?auto_851 )
      ( MAKE-ON ?auto_848 ?auto_849 )
      ( MAKE-ON-VERIFY ?auto_848 ?auto_849 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_854 - SURFACE
      ?auto_855 - SURFACE
    )
    :vars
    (
      ?auto_859 - HOIST
      ?auto_858 - PLACE
      ?auto_856 - TRUCK
      ?auto_857 - PLACE
      ?auto_860 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_859 ?auto_858 ) ( SURFACE-AT ?auto_855 ?auto_858 ) ( CLEAR ?auto_855 ) ( IS-CRATE ?auto_854 ) ( not ( = ?auto_854 ?auto_855 ) ) ( AVAILABLE ?auto_859 ) ( TRUCK-AT ?auto_856 ?auto_857 ) ( not ( = ?auto_857 ?auto_858 ) ) ( HOIST-AT ?auto_860 ?auto_857 ) ( LIFTING ?auto_860 ?auto_854 ) ( not ( = ?auto_859 ?auto_860 ) ) )
    :subtasks
    ( ( !LOAD ?auto_860 ?auto_854 ?auto_856 ?auto_857 )
      ( MAKE-ON ?auto_854 ?auto_855 )
      ( MAKE-ON-VERIFY ?auto_854 ?auto_855 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_861 - SURFACE
      ?auto_862 - SURFACE
    )
    :vars
    (
      ?auto_866 - HOIST
      ?auto_867 - PLACE
      ?auto_865 - TRUCK
      ?auto_863 - PLACE
      ?auto_864 - HOIST
      ?auto_868 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_866 ?auto_867 ) ( SURFACE-AT ?auto_862 ?auto_867 ) ( CLEAR ?auto_862 ) ( IS-CRATE ?auto_861 ) ( not ( = ?auto_861 ?auto_862 ) ) ( AVAILABLE ?auto_866 ) ( TRUCK-AT ?auto_865 ?auto_863 ) ( not ( = ?auto_863 ?auto_867 ) ) ( HOIST-AT ?auto_864 ?auto_863 ) ( not ( = ?auto_866 ?auto_864 ) ) ( AVAILABLE ?auto_864 ) ( SURFACE-AT ?auto_861 ?auto_863 ) ( ON ?auto_861 ?auto_868 ) ( CLEAR ?auto_861 ) ( not ( = ?auto_861 ?auto_868 ) ) ( not ( = ?auto_862 ?auto_868 ) ) )
    :subtasks
    ( ( !LIFT ?auto_864 ?auto_861 ?auto_868 ?auto_863 )
      ( MAKE-ON ?auto_861 ?auto_862 )
      ( MAKE-ON-VERIFY ?auto_861 ?auto_862 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_869 - SURFACE
      ?auto_870 - SURFACE
    )
    :vars
    (
      ?auto_872 - HOIST
      ?auto_873 - PLACE
      ?auto_876 - PLACE
      ?auto_874 - HOIST
      ?auto_871 - SURFACE
      ?auto_875 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_872 ?auto_873 ) ( SURFACE-AT ?auto_870 ?auto_873 ) ( CLEAR ?auto_870 ) ( IS-CRATE ?auto_869 ) ( not ( = ?auto_869 ?auto_870 ) ) ( AVAILABLE ?auto_872 ) ( not ( = ?auto_876 ?auto_873 ) ) ( HOIST-AT ?auto_874 ?auto_876 ) ( not ( = ?auto_872 ?auto_874 ) ) ( AVAILABLE ?auto_874 ) ( SURFACE-AT ?auto_869 ?auto_876 ) ( ON ?auto_869 ?auto_871 ) ( CLEAR ?auto_869 ) ( not ( = ?auto_869 ?auto_871 ) ) ( not ( = ?auto_870 ?auto_871 ) ) ( TRUCK-AT ?auto_875 ?auto_873 ) )
    :subtasks
    ( ( !DRIVE ?auto_875 ?auto_873 ?auto_876 )
      ( MAKE-ON ?auto_869 ?auto_870 )
      ( MAKE-ON-VERIFY ?auto_869 ?auto_870 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_877 - SURFACE
      ?auto_878 - SURFACE
    )
    :vars
    (
      ?auto_882 - HOIST
      ?auto_880 - PLACE
      ?auto_883 - PLACE
      ?auto_879 - HOIST
      ?auto_884 - SURFACE
      ?auto_881 - TRUCK
      ?auto_885 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_882 ?auto_880 ) ( IS-CRATE ?auto_877 ) ( not ( = ?auto_877 ?auto_878 ) ) ( not ( = ?auto_883 ?auto_880 ) ) ( HOIST-AT ?auto_879 ?auto_883 ) ( not ( = ?auto_882 ?auto_879 ) ) ( AVAILABLE ?auto_879 ) ( SURFACE-AT ?auto_877 ?auto_883 ) ( ON ?auto_877 ?auto_884 ) ( CLEAR ?auto_877 ) ( not ( = ?auto_877 ?auto_884 ) ) ( not ( = ?auto_878 ?auto_884 ) ) ( TRUCK-AT ?auto_881 ?auto_880 ) ( SURFACE-AT ?auto_885 ?auto_880 ) ( CLEAR ?auto_885 ) ( LIFTING ?auto_882 ?auto_878 ) ( IS-CRATE ?auto_878 ) ( not ( = ?auto_877 ?auto_885 ) ) ( not ( = ?auto_878 ?auto_885 ) ) ( not ( = ?auto_884 ?auto_885 ) ) )
    :subtasks
    ( ( !DROP ?auto_882 ?auto_878 ?auto_885 ?auto_880 )
      ( MAKE-ON ?auto_877 ?auto_878 )
      ( MAKE-ON-VERIFY ?auto_877 ?auto_878 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_886 - SURFACE
      ?auto_887 - SURFACE
    )
    :vars
    (
      ?auto_893 - HOIST
      ?auto_889 - PLACE
      ?auto_891 - PLACE
      ?auto_892 - HOIST
      ?auto_888 - SURFACE
      ?auto_890 - TRUCK
      ?auto_894 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_893 ?auto_889 ) ( IS-CRATE ?auto_886 ) ( not ( = ?auto_886 ?auto_887 ) ) ( not ( = ?auto_891 ?auto_889 ) ) ( HOIST-AT ?auto_892 ?auto_891 ) ( not ( = ?auto_893 ?auto_892 ) ) ( AVAILABLE ?auto_892 ) ( SURFACE-AT ?auto_886 ?auto_891 ) ( ON ?auto_886 ?auto_888 ) ( CLEAR ?auto_886 ) ( not ( = ?auto_886 ?auto_888 ) ) ( not ( = ?auto_887 ?auto_888 ) ) ( TRUCK-AT ?auto_890 ?auto_889 ) ( SURFACE-AT ?auto_894 ?auto_889 ) ( CLEAR ?auto_894 ) ( IS-CRATE ?auto_887 ) ( not ( = ?auto_886 ?auto_894 ) ) ( not ( = ?auto_887 ?auto_894 ) ) ( not ( = ?auto_888 ?auto_894 ) ) ( AVAILABLE ?auto_893 ) ( IN ?auto_887 ?auto_890 ) )
    :subtasks
    ( ( !UNLOAD ?auto_893 ?auto_887 ?auto_890 ?auto_889 )
      ( MAKE-ON ?auto_886 ?auto_887 )
      ( MAKE-ON-VERIFY ?auto_886 ?auto_887 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_895 - SURFACE
      ?auto_896 - SURFACE
    )
    :vars
    (
      ?auto_902 - HOIST
      ?auto_901 - PLACE
      ?auto_898 - PLACE
      ?auto_899 - HOIST
      ?auto_900 - SURFACE
      ?auto_903 - SURFACE
      ?auto_897 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_902 ?auto_901 ) ( IS-CRATE ?auto_895 ) ( not ( = ?auto_895 ?auto_896 ) ) ( not ( = ?auto_898 ?auto_901 ) ) ( HOIST-AT ?auto_899 ?auto_898 ) ( not ( = ?auto_902 ?auto_899 ) ) ( AVAILABLE ?auto_899 ) ( SURFACE-AT ?auto_895 ?auto_898 ) ( ON ?auto_895 ?auto_900 ) ( CLEAR ?auto_895 ) ( not ( = ?auto_895 ?auto_900 ) ) ( not ( = ?auto_896 ?auto_900 ) ) ( SURFACE-AT ?auto_903 ?auto_901 ) ( CLEAR ?auto_903 ) ( IS-CRATE ?auto_896 ) ( not ( = ?auto_895 ?auto_903 ) ) ( not ( = ?auto_896 ?auto_903 ) ) ( not ( = ?auto_900 ?auto_903 ) ) ( AVAILABLE ?auto_902 ) ( IN ?auto_896 ?auto_897 ) ( TRUCK-AT ?auto_897 ?auto_898 ) )
    :subtasks
    ( ( !DRIVE ?auto_897 ?auto_898 ?auto_901 )
      ( MAKE-ON ?auto_895 ?auto_896 )
      ( MAKE-ON-VERIFY ?auto_895 ?auto_896 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_904 - SURFACE
      ?auto_905 - SURFACE
    )
    :vars
    (
      ?auto_911 - HOIST
      ?auto_907 - PLACE
      ?auto_906 - PLACE
      ?auto_909 - HOIST
      ?auto_910 - SURFACE
      ?auto_908 - SURFACE
      ?auto_912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_911 ?auto_907 ) ( IS-CRATE ?auto_904 ) ( not ( = ?auto_904 ?auto_905 ) ) ( not ( = ?auto_906 ?auto_907 ) ) ( HOIST-AT ?auto_909 ?auto_906 ) ( not ( = ?auto_911 ?auto_909 ) ) ( SURFACE-AT ?auto_904 ?auto_906 ) ( ON ?auto_904 ?auto_910 ) ( CLEAR ?auto_904 ) ( not ( = ?auto_904 ?auto_910 ) ) ( not ( = ?auto_905 ?auto_910 ) ) ( SURFACE-AT ?auto_908 ?auto_907 ) ( CLEAR ?auto_908 ) ( IS-CRATE ?auto_905 ) ( not ( = ?auto_904 ?auto_908 ) ) ( not ( = ?auto_905 ?auto_908 ) ) ( not ( = ?auto_910 ?auto_908 ) ) ( AVAILABLE ?auto_911 ) ( TRUCK-AT ?auto_912 ?auto_906 ) ( LIFTING ?auto_909 ?auto_905 ) )
    :subtasks
    ( ( !LOAD ?auto_909 ?auto_905 ?auto_912 ?auto_906 )
      ( MAKE-ON ?auto_904 ?auto_905 )
      ( MAKE-ON-VERIFY ?auto_904 ?auto_905 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_913 - SURFACE
      ?auto_914 - SURFACE
    )
    :vars
    (
      ?auto_917 - HOIST
      ?auto_918 - PLACE
      ?auto_921 - PLACE
      ?auto_915 - HOIST
      ?auto_920 - SURFACE
      ?auto_919 - SURFACE
      ?auto_916 - TRUCK
      ?auto_922 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_917 ?auto_918 ) ( IS-CRATE ?auto_913 ) ( not ( = ?auto_913 ?auto_914 ) ) ( not ( = ?auto_921 ?auto_918 ) ) ( HOIST-AT ?auto_915 ?auto_921 ) ( not ( = ?auto_917 ?auto_915 ) ) ( SURFACE-AT ?auto_913 ?auto_921 ) ( ON ?auto_913 ?auto_920 ) ( CLEAR ?auto_913 ) ( not ( = ?auto_913 ?auto_920 ) ) ( not ( = ?auto_914 ?auto_920 ) ) ( SURFACE-AT ?auto_919 ?auto_918 ) ( CLEAR ?auto_919 ) ( IS-CRATE ?auto_914 ) ( not ( = ?auto_913 ?auto_919 ) ) ( not ( = ?auto_914 ?auto_919 ) ) ( not ( = ?auto_920 ?auto_919 ) ) ( AVAILABLE ?auto_917 ) ( TRUCK-AT ?auto_916 ?auto_921 ) ( AVAILABLE ?auto_915 ) ( SURFACE-AT ?auto_914 ?auto_921 ) ( ON ?auto_914 ?auto_922 ) ( CLEAR ?auto_914 ) ( not ( = ?auto_913 ?auto_922 ) ) ( not ( = ?auto_914 ?auto_922 ) ) ( not ( = ?auto_920 ?auto_922 ) ) ( not ( = ?auto_919 ?auto_922 ) ) )
    :subtasks
    ( ( !LIFT ?auto_915 ?auto_914 ?auto_922 ?auto_921 )
      ( MAKE-ON ?auto_913 ?auto_914 )
      ( MAKE-ON-VERIFY ?auto_913 ?auto_914 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_923 - SURFACE
      ?auto_924 - SURFACE
    )
    :vars
    (
      ?auto_926 - HOIST
      ?auto_929 - PLACE
      ?auto_925 - PLACE
      ?auto_928 - HOIST
      ?auto_931 - SURFACE
      ?auto_930 - SURFACE
      ?auto_932 - SURFACE
      ?auto_927 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_926 ?auto_929 ) ( IS-CRATE ?auto_923 ) ( not ( = ?auto_923 ?auto_924 ) ) ( not ( = ?auto_925 ?auto_929 ) ) ( HOIST-AT ?auto_928 ?auto_925 ) ( not ( = ?auto_926 ?auto_928 ) ) ( SURFACE-AT ?auto_923 ?auto_925 ) ( ON ?auto_923 ?auto_931 ) ( CLEAR ?auto_923 ) ( not ( = ?auto_923 ?auto_931 ) ) ( not ( = ?auto_924 ?auto_931 ) ) ( SURFACE-AT ?auto_930 ?auto_929 ) ( CLEAR ?auto_930 ) ( IS-CRATE ?auto_924 ) ( not ( = ?auto_923 ?auto_930 ) ) ( not ( = ?auto_924 ?auto_930 ) ) ( not ( = ?auto_931 ?auto_930 ) ) ( AVAILABLE ?auto_926 ) ( AVAILABLE ?auto_928 ) ( SURFACE-AT ?auto_924 ?auto_925 ) ( ON ?auto_924 ?auto_932 ) ( CLEAR ?auto_924 ) ( not ( = ?auto_923 ?auto_932 ) ) ( not ( = ?auto_924 ?auto_932 ) ) ( not ( = ?auto_931 ?auto_932 ) ) ( not ( = ?auto_930 ?auto_932 ) ) ( TRUCK-AT ?auto_927 ?auto_929 ) )
    :subtasks
    ( ( !DRIVE ?auto_927 ?auto_929 ?auto_925 )
      ( MAKE-ON ?auto_923 ?auto_924 )
      ( MAKE-ON-VERIFY ?auto_923 ?auto_924 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_933 - SURFACE
      ?auto_934 - SURFACE
    )
    :vars
    (
      ?auto_941 - HOIST
      ?auto_939 - PLACE
      ?auto_942 - PLACE
      ?auto_938 - HOIST
      ?auto_936 - SURFACE
      ?auto_940 - SURFACE
      ?auto_935 - SURFACE
      ?auto_937 - TRUCK
      ?auto_943 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_941 ?auto_939 ) ( IS-CRATE ?auto_933 ) ( not ( = ?auto_933 ?auto_934 ) ) ( not ( = ?auto_942 ?auto_939 ) ) ( HOIST-AT ?auto_938 ?auto_942 ) ( not ( = ?auto_941 ?auto_938 ) ) ( SURFACE-AT ?auto_933 ?auto_942 ) ( ON ?auto_933 ?auto_936 ) ( CLEAR ?auto_933 ) ( not ( = ?auto_933 ?auto_936 ) ) ( not ( = ?auto_934 ?auto_936 ) ) ( IS-CRATE ?auto_934 ) ( not ( = ?auto_933 ?auto_940 ) ) ( not ( = ?auto_934 ?auto_940 ) ) ( not ( = ?auto_936 ?auto_940 ) ) ( AVAILABLE ?auto_938 ) ( SURFACE-AT ?auto_934 ?auto_942 ) ( ON ?auto_934 ?auto_935 ) ( CLEAR ?auto_934 ) ( not ( = ?auto_933 ?auto_935 ) ) ( not ( = ?auto_934 ?auto_935 ) ) ( not ( = ?auto_936 ?auto_935 ) ) ( not ( = ?auto_940 ?auto_935 ) ) ( TRUCK-AT ?auto_937 ?auto_939 ) ( SURFACE-AT ?auto_943 ?auto_939 ) ( CLEAR ?auto_943 ) ( LIFTING ?auto_941 ?auto_940 ) ( IS-CRATE ?auto_940 ) ( not ( = ?auto_933 ?auto_943 ) ) ( not ( = ?auto_934 ?auto_943 ) ) ( not ( = ?auto_936 ?auto_943 ) ) ( not ( = ?auto_940 ?auto_943 ) ) ( not ( = ?auto_935 ?auto_943 ) ) )
    :subtasks
    ( ( !DROP ?auto_941 ?auto_940 ?auto_943 ?auto_939 )
      ( MAKE-ON ?auto_933 ?auto_934 )
      ( MAKE-ON-VERIFY ?auto_933 ?auto_934 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_944 - SURFACE
      ?auto_945 - SURFACE
    )
    :vars
    (
      ?auto_949 - HOIST
      ?auto_953 - PLACE
      ?auto_947 - PLACE
      ?auto_946 - HOIST
      ?auto_950 - SURFACE
      ?auto_952 - SURFACE
      ?auto_948 - SURFACE
      ?auto_951 - TRUCK
      ?auto_954 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_949 ?auto_953 ) ( IS-CRATE ?auto_944 ) ( not ( = ?auto_944 ?auto_945 ) ) ( not ( = ?auto_947 ?auto_953 ) ) ( HOIST-AT ?auto_946 ?auto_947 ) ( not ( = ?auto_949 ?auto_946 ) ) ( SURFACE-AT ?auto_944 ?auto_947 ) ( ON ?auto_944 ?auto_950 ) ( CLEAR ?auto_944 ) ( not ( = ?auto_944 ?auto_950 ) ) ( not ( = ?auto_945 ?auto_950 ) ) ( IS-CRATE ?auto_945 ) ( not ( = ?auto_944 ?auto_952 ) ) ( not ( = ?auto_945 ?auto_952 ) ) ( not ( = ?auto_950 ?auto_952 ) ) ( AVAILABLE ?auto_946 ) ( SURFACE-AT ?auto_945 ?auto_947 ) ( ON ?auto_945 ?auto_948 ) ( CLEAR ?auto_945 ) ( not ( = ?auto_944 ?auto_948 ) ) ( not ( = ?auto_945 ?auto_948 ) ) ( not ( = ?auto_950 ?auto_948 ) ) ( not ( = ?auto_952 ?auto_948 ) ) ( TRUCK-AT ?auto_951 ?auto_953 ) ( SURFACE-AT ?auto_954 ?auto_953 ) ( CLEAR ?auto_954 ) ( IS-CRATE ?auto_952 ) ( not ( = ?auto_944 ?auto_954 ) ) ( not ( = ?auto_945 ?auto_954 ) ) ( not ( = ?auto_950 ?auto_954 ) ) ( not ( = ?auto_952 ?auto_954 ) ) ( not ( = ?auto_948 ?auto_954 ) ) ( AVAILABLE ?auto_949 ) ( IN ?auto_952 ?auto_951 ) )
    :subtasks
    ( ( !UNLOAD ?auto_949 ?auto_952 ?auto_951 ?auto_953 )
      ( MAKE-ON ?auto_944 ?auto_945 )
      ( MAKE-ON-VERIFY ?auto_944 ?auto_945 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_955 - SURFACE
      ?auto_956 - SURFACE
    )
    :vars
    (
      ?auto_959 - HOIST
      ?auto_964 - PLACE
      ?auto_958 - PLACE
      ?auto_965 - HOIST
      ?auto_961 - SURFACE
      ?auto_963 - SURFACE
      ?auto_957 - SURFACE
      ?auto_960 - SURFACE
      ?auto_962 - TRUCK
      ?auto_966 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_959 ?auto_964 ) ( IS-CRATE ?auto_955 ) ( not ( = ?auto_955 ?auto_956 ) ) ( not ( = ?auto_958 ?auto_964 ) ) ( HOIST-AT ?auto_965 ?auto_958 ) ( not ( = ?auto_959 ?auto_965 ) ) ( SURFACE-AT ?auto_955 ?auto_958 ) ( ON ?auto_955 ?auto_961 ) ( CLEAR ?auto_955 ) ( not ( = ?auto_955 ?auto_961 ) ) ( not ( = ?auto_956 ?auto_961 ) ) ( IS-CRATE ?auto_956 ) ( not ( = ?auto_955 ?auto_963 ) ) ( not ( = ?auto_956 ?auto_963 ) ) ( not ( = ?auto_961 ?auto_963 ) ) ( AVAILABLE ?auto_965 ) ( SURFACE-AT ?auto_956 ?auto_958 ) ( ON ?auto_956 ?auto_957 ) ( CLEAR ?auto_956 ) ( not ( = ?auto_955 ?auto_957 ) ) ( not ( = ?auto_956 ?auto_957 ) ) ( not ( = ?auto_961 ?auto_957 ) ) ( not ( = ?auto_963 ?auto_957 ) ) ( SURFACE-AT ?auto_960 ?auto_964 ) ( CLEAR ?auto_960 ) ( IS-CRATE ?auto_963 ) ( not ( = ?auto_955 ?auto_960 ) ) ( not ( = ?auto_956 ?auto_960 ) ) ( not ( = ?auto_961 ?auto_960 ) ) ( not ( = ?auto_963 ?auto_960 ) ) ( not ( = ?auto_957 ?auto_960 ) ) ( AVAILABLE ?auto_959 ) ( IN ?auto_963 ?auto_962 ) ( TRUCK-AT ?auto_962 ?auto_966 ) ( not ( = ?auto_966 ?auto_964 ) ) ( not ( = ?auto_958 ?auto_966 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_962 ?auto_966 ?auto_964 )
      ( MAKE-ON ?auto_955 ?auto_956 )
      ( MAKE-ON-VERIFY ?auto_955 ?auto_956 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_967 - SURFACE
      ?auto_968 - SURFACE
    )
    :vars
    (
      ?auto_976 - HOIST
      ?auto_975 - PLACE
      ?auto_972 - PLACE
      ?auto_969 - HOIST
      ?auto_971 - SURFACE
      ?auto_977 - SURFACE
      ?auto_970 - SURFACE
      ?auto_973 - SURFACE
      ?auto_974 - TRUCK
      ?auto_978 - PLACE
      ?auto_979 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_976 ?auto_975 ) ( IS-CRATE ?auto_967 ) ( not ( = ?auto_967 ?auto_968 ) ) ( not ( = ?auto_972 ?auto_975 ) ) ( HOIST-AT ?auto_969 ?auto_972 ) ( not ( = ?auto_976 ?auto_969 ) ) ( SURFACE-AT ?auto_967 ?auto_972 ) ( ON ?auto_967 ?auto_971 ) ( CLEAR ?auto_967 ) ( not ( = ?auto_967 ?auto_971 ) ) ( not ( = ?auto_968 ?auto_971 ) ) ( IS-CRATE ?auto_968 ) ( not ( = ?auto_967 ?auto_977 ) ) ( not ( = ?auto_968 ?auto_977 ) ) ( not ( = ?auto_971 ?auto_977 ) ) ( AVAILABLE ?auto_969 ) ( SURFACE-AT ?auto_968 ?auto_972 ) ( ON ?auto_968 ?auto_970 ) ( CLEAR ?auto_968 ) ( not ( = ?auto_967 ?auto_970 ) ) ( not ( = ?auto_968 ?auto_970 ) ) ( not ( = ?auto_971 ?auto_970 ) ) ( not ( = ?auto_977 ?auto_970 ) ) ( SURFACE-AT ?auto_973 ?auto_975 ) ( CLEAR ?auto_973 ) ( IS-CRATE ?auto_977 ) ( not ( = ?auto_967 ?auto_973 ) ) ( not ( = ?auto_968 ?auto_973 ) ) ( not ( = ?auto_971 ?auto_973 ) ) ( not ( = ?auto_977 ?auto_973 ) ) ( not ( = ?auto_970 ?auto_973 ) ) ( AVAILABLE ?auto_976 ) ( TRUCK-AT ?auto_974 ?auto_978 ) ( not ( = ?auto_978 ?auto_975 ) ) ( not ( = ?auto_972 ?auto_978 ) ) ( HOIST-AT ?auto_979 ?auto_978 ) ( LIFTING ?auto_979 ?auto_977 ) ( not ( = ?auto_976 ?auto_979 ) ) ( not ( = ?auto_969 ?auto_979 ) ) )
    :subtasks
    ( ( !LOAD ?auto_979 ?auto_977 ?auto_974 ?auto_978 )
      ( MAKE-ON ?auto_967 ?auto_968 )
      ( MAKE-ON-VERIFY ?auto_967 ?auto_968 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_980 - SURFACE
      ?auto_981 - SURFACE
    )
    :vars
    (
      ?auto_988 - HOIST
      ?auto_990 - PLACE
      ?auto_985 - PLACE
      ?auto_987 - HOIST
      ?auto_989 - SURFACE
      ?auto_991 - SURFACE
      ?auto_986 - SURFACE
      ?auto_983 - SURFACE
      ?auto_984 - TRUCK
      ?auto_982 - PLACE
      ?auto_992 - HOIST
      ?auto_993 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_988 ?auto_990 ) ( IS-CRATE ?auto_980 ) ( not ( = ?auto_980 ?auto_981 ) ) ( not ( = ?auto_985 ?auto_990 ) ) ( HOIST-AT ?auto_987 ?auto_985 ) ( not ( = ?auto_988 ?auto_987 ) ) ( SURFACE-AT ?auto_980 ?auto_985 ) ( ON ?auto_980 ?auto_989 ) ( CLEAR ?auto_980 ) ( not ( = ?auto_980 ?auto_989 ) ) ( not ( = ?auto_981 ?auto_989 ) ) ( IS-CRATE ?auto_981 ) ( not ( = ?auto_980 ?auto_991 ) ) ( not ( = ?auto_981 ?auto_991 ) ) ( not ( = ?auto_989 ?auto_991 ) ) ( AVAILABLE ?auto_987 ) ( SURFACE-AT ?auto_981 ?auto_985 ) ( ON ?auto_981 ?auto_986 ) ( CLEAR ?auto_981 ) ( not ( = ?auto_980 ?auto_986 ) ) ( not ( = ?auto_981 ?auto_986 ) ) ( not ( = ?auto_989 ?auto_986 ) ) ( not ( = ?auto_991 ?auto_986 ) ) ( SURFACE-AT ?auto_983 ?auto_990 ) ( CLEAR ?auto_983 ) ( IS-CRATE ?auto_991 ) ( not ( = ?auto_980 ?auto_983 ) ) ( not ( = ?auto_981 ?auto_983 ) ) ( not ( = ?auto_989 ?auto_983 ) ) ( not ( = ?auto_991 ?auto_983 ) ) ( not ( = ?auto_986 ?auto_983 ) ) ( AVAILABLE ?auto_988 ) ( TRUCK-AT ?auto_984 ?auto_982 ) ( not ( = ?auto_982 ?auto_990 ) ) ( not ( = ?auto_985 ?auto_982 ) ) ( HOIST-AT ?auto_992 ?auto_982 ) ( not ( = ?auto_988 ?auto_992 ) ) ( not ( = ?auto_987 ?auto_992 ) ) ( AVAILABLE ?auto_992 ) ( SURFACE-AT ?auto_991 ?auto_982 ) ( ON ?auto_991 ?auto_993 ) ( CLEAR ?auto_991 ) ( not ( = ?auto_980 ?auto_993 ) ) ( not ( = ?auto_981 ?auto_993 ) ) ( not ( = ?auto_989 ?auto_993 ) ) ( not ( = ?auto_991 ?auto_993 ) ) ( not ( = ?auto_986 ?auto_993 ) ) ( not ( = ?auto_983 ?auto_993 ) ) )
    :subtasks
    ( ( !LIFT ?auto_992 ?auto_991 ?auto_993 ?auto_982 )
      ( MAKE-ON ?auto_980 ?auto_981 )
      ( MAKE-ON-VERIFY ?auto_980 ?auto_981 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_994 - SURFACE
      ?auto_995 - SURFACE
    )
    :vars
    (
      ?auto_999 - HOIST
      ?auto_1005 - PLACE
      ?auto_1002 - PLACE
      ?auto_1001 - HOIST
      ?auto_998 - SURFACE
      ?auto_1004 - SURFACE
      ?auto_1000 - SURFACE
      ?auto_996 - SURFACE
      ?auto_1006 - PLACE
      ?auto_1003 - HOIST
      ?auto_1007 - SURFACE
      ?auto_997 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_999 ?auto_1005 ) ( IS-CRATE ?auto_994 ) ( not ( = ?auto_994 ?auto_995 ) ) ( not ( = ?auto_1002 ?auto_1005 ) ) ( HOIST-AT ?auto_1001 ?auto_1002 ) ( not ( = ?auto_999 ?auto_1001 ) ) ( SURFACE-AT ?auto_994 ?auto_1002 ) ( ON ?auto_994 ?auto_998 ) ( CLEAR ?auto_994 ) ( not ( = ?auto_994 ?auto_998 ) ) ( not ( = ?auto_995 ?auto_998 ) ) ( IS-CRATE ?auto_995 ) ( not ( = ?auto_994 ?auto_1004 ) ) ( not ( = ?auto_995 ?auto_1004 ) ) ( not ( = ?auto_998 ?auto_1004 ) ) ( AVAILABLE ?auto_1001 ) ( SURFACE-AT ?auto_995 ?auto_1002 ) ( ON ?auto_995 ?auto_1000 ) ( CLEAR ?auto_995 ) ( not ( = ?auto_994 ?auto_1000 ) ) ( not ( = ?auto_995 ?auto_1000 ) ) ( not ( = ?auto_998 ?auto_1000 ) ) ( not ( = ?auto_1004 ?auto_1000 ) ) ( SURFACE-AT ?auto_996 ?auto_1005 ) ( CLEAR ?auto_996 ) ( IS-CRATE ?auto_1004 ) ( not ( = ?auto_994 ?auto_996 ) ) ( not ( = ?auto_995 ?auto_996 ) ) ( not ( = ?auto_998 ?auto_996 ) ) ( not ( = ?auto_1004 ?auto_996 ) ) ( not ( = ?auto_1000 ?auto_996 ) ) ( AVAILABLE ?auto_999 ) ( not ( = ?auto_1006 ?auto_1005 ) ) ( not ( = ?auto_1002 ?auto_1006 ) ) ( HOIST-AT ?auto_1003 ?auto_1006 ) ( not ( = ?auto_999 ?auto_1003 ) ) ( not ( = ?auto_1001 ?auto_1003 ) ) ( AVAILABLE ?auto_1003 ) ( SURFACE-AT ?auto_1004 ?auto_1006 ) ( ON ?auto_1004 ?auto_1007 ) ( CLEAR ?auto_1004 ) ( not ( = ?auto_994 ?auto_1007 ) ) ( not ( = ?auto_995 ?auto_1007 ) ) ( not ( = ?auto_998 ?auto_1007 ) ) ( not ( = ?auto_1004 ?auto_1007 ) ) ( not ( = ?auto_1000 ?auto_1007 ) ) ( not ( = ?auto_996 ?auto_1007 ) ) ( TRUCK-AT ?auto_997 ?auto_1005 ) )
    :subtasks
    ( ( !DRIVE ?auto_997 ?auto_1005 ?auto_1006 )
      ( MAKE-ON ?auto_994 ?auto_995 )
      ( MAKE-ON-VERIFY ?auto_994 ?auto_995 ) )
  )

)

