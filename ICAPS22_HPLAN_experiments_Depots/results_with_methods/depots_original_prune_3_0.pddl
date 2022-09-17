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
      ?auto_636 - SURFACE
      ?auto_637 - SURFACE
    )
    :vars
    (
      ?auto_638 - HOIST
      ?auto_639 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_638 ?auto_639 ) ( SURFACE-AT ?auto_637 ?auto_639 ) ( CLEAR ?auto_637 ) ( LIFTING ?auto_638 ?auto_636 ) ( IS-CRATE ?auto_636 ) ( not ( = ?auto_636 ?auto_637 ) ) )
    :subtasks
    ( ( !DROP ?auto_638 ?auto_636 ?auto_637 ?auto_639 )
      ( MAKE-ON-VERIFY ?auto_636 ?auto_637 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_640 - SURFACE
      ?auto_641 - SURFACE
    )
    :vars
    (
      ?auto_643 - HOIST
      ?auto_642 - PLACE
      ?auto_644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_643 ?auto_642 ) ( SURFACE-AT ?auto_641 ?auto_642 ) ( CLEAR ?auto_641 ) ( IS-CRATE ?auto_640 ) ( not ( = ?auto_640 ?auto_641 ) ) ( TRUCK-AT ?auto_644 ?auto_642 ) ( AVAILABLE ?auto_643 ) ( IN ?auto_640 ?auto_644 ) )
    :subtasks
    ( ( !UNLOAD ?auto_643 ?auto_640 ?auto_644 ?auto_642 )
      ( MAKE-ON ?auto_640 ?auto_641 )
      ( MAKE-ON-VERIFY ?auto_640 ?auto_641 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_645 - SURFACE
      ?auto_646 - SURFACE
    )
    :vars
    (
      ?auto_649 - HOIST
      ?auto_648 - PLACE
      ?auto_647 - TRUCK
      ?auto_650 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_649 ?auto_648 ) ( SURFACE-AT ?auto_646 ?auto_648 ) ( CLEAR ?auto_646 ) ( IS-CRATE ?auto_645 ) ( not ( = ?auto_645 ?auto_646 ) ) ( AVAILABLE ?auto_649 ) ( IN ?auto_645 ?auto_647 ) ( TRUCK-AT ?auto_647 ?auto_650 ) ( not ( = ?auto_650 ?auto_648 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_647 ?auto_650 ?auto_648 )
      ( MAKE-ON ?auto_645 ?auto_646 )
      ( MAKE-ON-VERIFY ?auto_645 ?auto_646 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_651 - SURFACE
      ?auto_652 - SURFACE
    )
    :vars
    (
      ?auto_655 - HOIST
      ?auto_654 - PLACE
      ?auto_656 - TRUCK
      ?auto_653 - PLACE
      ?auto_657 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_655 ?auto_654 ) ( SURFACE-AT ?auto_652 ?auto_654 ) ( CLEAR ?auto_652 ) ( IS-CRATE ?auto_651 ) ( not ( = ?auto_651 ?auto_652 ) ) ( AVAILABLE ?auto_655 ) ( TRUCK-AT ?auto_656 ?auto_653 ) ( not ( = ?auto_653 ?auto_654 ) ) ( HOIST-AT ?auto_657 ?auto_653 ) ( LIFTING ?auto_657 ?auto_651 ) ( not ( = ?auto_655 ?auto_657 ) ) )
    :subtasks
    ( ( !LOAD ?auto_657 ?auto_651 ?auto_656 ?auto_653 )
      ( MAKE-ON ?auto_651 ?auto_652 )
      ( MAKE-ON-VERIFY ?auto_651 ?auto_652 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_658 - SURFACE
      ?auto_659 - SURFACE
    )
    :vars
    (
      ?auto_664 - HOIST
      ?auto_661 - PLACE
      ?auto_662 - TRUCK
      ?auto_663 - PLACE
      ?auto_660 - HOIST
      ?auto_665 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_664 ?auto_661 ) ( SURFACE-AT ?auto_659 ?auto_661 ) ( CLEAR ?auto_659 ) ( IS-CRATE ?auto_658 ) ( not ( = ?auto_658 ?auto_659 ) ) ( AVAILABLE ?auto_664 ) ( TRUCK-AT ?auto_662 ?auto_663 ) ( not ( = ?auto_663 ?auto_661 ) ) ( HOIST-AT ?auto_660 ?auto_663 ) ( not ( = ?auto_664 ?auto_660 ) ) ( AVAILABLE ?auto_660 ) ( SURFACE-AT ?auto_658 ?auto_663 ) ( ON ?auto_658 ?auto_665 ) ( CLEAR ?auto_658 ) ( not ( = ?auto_658 ?auto_665 ) ) ( not ( = ?auto_659 ?auto_665 ) ) )
    :subtasks
    ( ( !LIFT ?auto_660 ?auto_658 ?auto_665 ?auto_663 )
      ( MAKE-ON ?auto_658 ?auto_659 )
      ( MAKE-ON-VERIFY ?auto_658 ?auto_659 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_666 - SURFACE
      ?auto_667 - SURFACE
    )
    :vars
    (
      ?auto_670 - HOIST
      ?auto_671 - PLACE
      ?auto_668 - PLACE
      ?auto_669 - HOIST
      ?auto_673 - SURFACE
      ?auto_672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_670 ?auto_671 ) ( SURFACE-AT ?auto_667 ?auto_671 ) ( CLEAR ?auto_667 ) ( IS-CRATE ?auto_666 ) ( not ( = ?auto_666 ?auto_667 ) ) ( AVAILABLE ?auto_670 ) ( not ( = ?auto_668 ?auto_671 ) ) ( HOIST-AT ?auto_669 ?auto_668 ) ( not ( = ?auto_670 ?auto_669 ) ) ( AVAILABLE ?auto_669 ) ( SURFACE-AT ?auto_666 ?auto_668 ) ( ON ?auto_666 ?auto_673 ) ( CLEAR ?auto_666 ) ( not ( = ?auto_666 ?auto_673 ) ) ( not ( = ?auto_667 ?auto_673 ) ) ( TRUCK-AT ?auto_672 ?auto_671 ) )
    :subtasks
    ( ( !DRIVE ?auto_672 ?auto_671 ?auto_668 )
      ( MAKE-ON ?auto_666 ?auto_667 )
      ( MAKE-ON-VERIFY ?auto_666 ?auto_667 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_714 - SURFACE
      ?auto_715 - SURFACE
    )
    :vars
    (
      ?auto_718 - HOIST
      ?auto_720 - PLACE
      ?auto_716 - PLACE
      ?auto_719 - HOIST
      ?auto_721 - SURFACE
      ?auto_717 - TRUCK
      ?auto_722 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_718 ?auto_720 ) ( IS-CRATE ?auto_714 ) ( not ( = ?auto_714 ?auto_715 ) ) ( not ( = ?auto_716 ?auto_720 ) ) ( HOIST-AT ?auto_719 ?auto_716 ) ( not ( = ?auto_718 ?auto_719 ) ) ( AVAILABLE ?auto_719 ) ( SURFACE-AT ?auto_714 ?auto_716 ) ( ON ?auto_714 ?auto_721 ) ( CLEAR ?auto_714 ) ( not ( = ?auto_714 ?auto_721 ) ) ( not ( = ?auto_715 ?auto_721 ) ) ( TRUCK-AT ?auto_717 ?auto_720 ) ( SURFACE-AT ?auto_722 ?auto_720 ) ( CLEAR ?auto_722 ) ( LIFTING ?auto_718 ?auto_715 ) ( IS-CRATE ?auto_715 ) ( not ( = ?auto_714 ?auto_722 ) ) ( not ( = ?auto_715 ?auto_722 ) ) ( not ( = ?auto_721 ?auto_722 ) ) )
    :subtasks
    ( ( !DROP ?auto_718 ?auto_715 ?auto_722 ?auto_720 )
      ( MAKE-ON ?auto_714 ?auto_715 )
      ( MAKE-ON-VERIFY ?auto_714 ?auto_715 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_723 - SURFACE
      ?auto_724 - SURFACE
    )
    :vars
    (
      ?auto_729 - HOIST
      ?auto_728 - PLACE
      ?auto_731 - PLACE
      ?auto_730 - HOIST
      ?auto_727 - SURFACE
      ?auto_725 - TRUCK
      ?auto_726 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_729 ?auto_728 ) ( IS-CRATE ?auto_723 ) ( not ( = ?auto_723 ?auto_724 ) ) ( not ( = ?auto_731 ?auto_728 ) ) ( HOIST-AT ?auto_730 ?auto_731 ) ( not ( = ?auto_729 ?auto_730 ) ) ( AVAILABLE ?auto_730 ) ( SURFACE-AT ?auto_723 ?auto_731 ) ( ON ?auto_723 ?auto_727 ) ( CLEAR ?auto_723 ) ( not ( = ?auto_723 ?auto_727 ) ) ( not ( = ?auto_724 ?auto_727 ) ) ( TRUCK-AT ?auto_725 ?auto_728 ) ( SURFACE-AT ?auto_726 ?auto_728 ) ( CLEAR ?auto_726 ) ( IS-CRATE ?auto_724 ) ( not ( = ?auto_723 ?auto_726 ) ) ( not ( = ?auto_724 ?auto_726 ) ) ( not ( = ?auto_727 ?auto_726 ) ) ( AVAILABLE ?auto_729 ) ( IN ?auto_724 ?auto_725 ) )
    :subtasks
    ( ( !UNLOAD ?auto_729 ?auto_724 ?auto_725 ?auto_728 )
      ( MAKE-ON ?auto_723 ?auto_724 )
      ( MAKE-ON-VERIFY ?auto_723 ?auto_724 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_738 - SURFACE
      ?auto_739 - SURFACE
    )
    :vars
    (
      ?auto_741 - HOIST
      ?auto_744 - PLACE
      ?auto_743 - PLACE
      ?auto_745 - HOIST
      ?auto_740 - SURFACE
      ?auto_742 - TRUCK
      ?auto_746 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_741 ?auto_744 ) ( SURFACE-AT ?auto_739 ?auto_744 ) ( CLEAR ?auto_739 ) ( IS-CRATE ?auto_738 ) ( not ( = ?auto_738 ?auto_739 ) ) ( AVAILABLE ?auto_741 ) ( not ( = ?auto_743 ?auto_744 ) ) ( HOIST-AT ?auto_745 ?auto_743 ) ( not ( = ?auto_741 ?auto_745 ) ) ( AVAILABLE ?auto_745 ) ( SURFACE-AT ?auto_738 ?auto_743 ) ( ON ?auto_738 ?auto_740 ) ( CLEAR ?auto_738 ) ( not ( = ?auto_738 ?auto_740 ) ) ( not ( = ?auto_739 ?auto_740 ) ) ( TRUCK-AT ?auto_742 ?auto_746 ) ( not ( = ?auto_746 ?auto_744 ) ) ( not ( = ?auto_743 ?auto_746 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_742 ?auto_746 ?auto_744 )
      ( MAKE-ON ?auto_738 ?auto_739 )
      ( MAKE-ON-VERIFY ?auto_738 ?auto_739 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_805 - SURFACE
      ?auto_806 - SURFACE
    )
    :vars
    (
      ?auto_807 - HOIST
      ?auto_812 - PLACE
      ?auto_813 - PLACE
      ?auto_809 - HOIST
      ?auto_811 - SURFACE
      ?auto_810 - SURFACE
      ?auto_808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_807 ?auto_812 ) ( IS-CRATE ?auto_805 ) ( not ( = ?auto_805 ?auto_806 ) ) ( not ( = ?auto_813 ?auto_812 ) ) ( HOIST-AT ?auto_809 ?auto_813 ) ( not ( = ?auto_807 ?auto_809 ) ) ( AVAILABLE ?auto_809 ) ( SURFACE-AT ?auto_805 ?auto_813 ) ( ON ?auto_805 ?auto_811 ) ( CLEAR ?auto_805 ) ( not ( = ?auto_805 ?auto_811 ) ) ( not ( = ?auto_806 ?auto_811 ) ) ( SURFACE-AT ?auto_810 ?auto_812 ) ( CLEAR ?auto_810 ) ( IS-CRATE ?auto_806 ) ( not ( = ?auto_805 ?auto_810 ) ) ( not ( = ?auto_806 ?auto_810 ) ) ( not ( = ?auto_811 ?auto_810 ) ) ( AVAILABLE ?auto_807 ) ( IN ?auto_806 ?auto_808 ) ( TRUCK-AT ?auto_808 ?auto_813 ) )
    :subtasks
    ( ( !DRIVE ?auto_808 ?auto_813 ?auto_812 )
      ( MAKE-ON ?auto_805 ?auto_806 )
      ( MAKE-ON-VERIFY ?auto_805 ?auto_806 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_814 - SURFACE
      ?auto_815 - SURFACE
    )
    :vars
    (
      ?auto_818 - HOIST
      ?auto_820 - PLACE
      ?auto_817 - PLACE
      ?auto_822 - HOIST
      ?auto_821 - SURFACE
      ?auto_819 - SURFACE
      ?auto_816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_818 ?auto_820 ) ( IS-CRATE ?auto_814 ) ( not ( = ?auto_814 ?auto_815 ) ) ( not ( = ?auto_817 ?auto_820 ) ) ( HOIST-AT ?auto_822 ?auto_817 ) ( not ( = ?auto_818 ?auto_822 ) ) ( SURFACE-AT ?auto_814 ?auto_817 ) ( ON ?auto_814 ?auto_821 ) ( CLEAR ?auto_814 ) ( not ( = ?auto_814 ?auto_821 ) ) ( not ( = ?auto_815 ?auto_821 ) ) ( SURFACE-AT ?auto_819 ?auto_820 ) ( CLEAR ?auto_819 ) ( IS-CRATE ?auto_815 ) ( not ( = ?auto_814 ?auto_819 ) ) ( not ( = ?auto_815 ?auto_819 ) ) ( not ( = ?auto_821 ?auto_819 ) ) ( AVAILABLE ?auto_818 ) ( TRUCK-AT ?auto_816 ?auto_817 ) ( LIFTING ?auto_822 ?auto_815 ) )
    :subtasks
    ( ( !LOAD ?auto_822 ?auto_815 ?auto_816 ?auto_817 )
      ( MAKE-ON ?auto_814 ?auto_815 )
      ( MAKE-ON-VERIFY ?auto_814 ?auto_815 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_823 - SURFACE
      ?auto_824 - SURFACE
    )
    :vars
    (
      ?auto_827 - HOIST
      ?auto_829 - PLACE
      ?auto_826 - PLACE
      ?auto_831 - HOIST
      ?auto_828 - SURFACE
      ?auto_830 - SURFACE
      ?auto_825 - TRUCK
      ?auto_832 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_827 ?auto_829 ) ( IS-CRATE ?auto_823 ) ( not ( = ?auto_823 ?auto_824 ) ) ( not ( = ?auto_826 ?auto_829 ) ) ( HOIST-AT ?auto_831 ?auto_826 ) ( not ( = ?auto_827 ?auto_831 ) ) ( SURFACE-AT ?auto_823 ?auto_826 ) ( ON ?auto_823 ?auto_828 ) ( CLEAR ?auto_823 ) ( not ( = ?auto_823 ?auto_828 ) ) ( not ( = ?auto_824 ?auto_828 ) ) ( SURFACE-AT ?auto_830 ?auto_829 ) ( CLEAR ?auto_830 ) ( IS-CRATE ?auto_824 ) ( not ( = ?auto_823 ?auto_830 ) ) ( not ( = ?auto_824 ?auto_830 ) ) ( not ( = ?auto_828 ?auto_830 ) ) ( AVAILABLE ?auto_827 ) ( TRUCK-AT ?auto_825 ?auto_826 ) ( AVAILABLE ?auto_831 ) ( SURFACE-AT ?auto_824 ?auto_826 ) ( ON ?auto_824 ?auto_832 ) ( CLEAR ?auto_824 ) ( not ( = ?auto_823 ?auto_832 ) ) ( not ( = ?auto_824 ?auto_832 ) ) ( not ( = ?auto_828 ?auto_832 ) ) ( not ( = ?auto_830 ?auto_832 ) ) )
    :subtasks
    ( ( !LIFT ?auto_831 ?auto_824 ?auto_832 ?auto_826 )
      ( MAKE-ON ?auto_823 ?auto_824 )
      ( MAKE-ON-VERIFY ?auto_823 ?auto_824 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_833 - SURFACE
      ?auto_834 - SURFACE
    )
    :vars
    (
      ?auto_836 - HOIST
      ?auto_835 - PLACE
      ?auto_839 - PLACE
      ?auto_842 - HOIST
      ?auto_838 - SURFACE
      ?auto_841 - SURFACE
      ?auto_837 - SURFACE
      ?auto_840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_836 ?auto_835 ) ( IS-CRATE ?auto_833 ) ( not ( = ?auto_833 ?auto_834 ) ) ( not ( = ?auto_839 ?auto_835 ) ) ( HOIST-AT ?auto_842 ?auto_839 ) ( not ( = ?auto_836 ?auto_842 ) ) ( SURFACE-AT ?auto_833 ?auto_839 ) ( ON ?auto_833 ?auto_838 ) ( CLEAR ?auto_833 ) ( not ( = ?auto_833 ?auto_838 ) ) ( not ( = ?auto_834 ?auto_838 ) ) ( SURFACE-AT ?auto_841 ?auto_835 ) ( CLEAR ?auto_841 ) ( IS-CRATE ?auto_834 ) ( not ( = ?auto_833 ?auto_841 ) ) ( not ( = ?auto_834 ?auto_841 ) ) ( not ( = ?auto_838 ?auto_841 ) ) ( AVAILABLE ?auto_836 ) ( AVAILABLE ?auto_842 ) ( SURFACE-AT ?auto_834 ?auto_839 ) ( ON ?auto_834 ?auto_837 ) ( CLEAR ?auto_834 ) ( not ( = ?auto_833 ?auto_837 ) ) ( not ( = ?auto_834 ?auto_837 ) ) ( not ( = ?auto_838 ?auto_837 ) ) ( not ( = ?auto_841 ?auto_837 ) ) ( TRUCK-AT ?auto_840 ?auto_835 ) )
    :subtasks
    ( ( !DRIVE ?auto_840 ?auto_835 ?auto_839 )
      ( MAKE-ON ?auto_833 ?auto_834 )
      ( MAKE-ON-VERIFY ?auto_833 ?auto_834 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_843 - SURFACE
      ?auto_844 - SURFACE
    )
    :vars
    (
      ?auto_850 - HOIST
      ?auto_849 - PLACE
      ?auto_845 - PLACE
      ?auto_852 - HOIST
      ?auto_848 - SURFACE
      ?auto_847 - SURFACE
      ?auto_851 - SURFACE
      ?auto_846 - TRUCK
      ?auto_853 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_850 ?auto_849 ) ( IS-CRATE ?auto_843 ) ( not ( = ?auto_843 ?auto_844 ) ) ( not ( = ?auto_845 ?auto_849 ) ) ( HOIST-AT ?auto_852 ?auto_845 ) ( not ( = ?auto_850 ?auto_852 ) ) ( SURFACE-AT ?auto_843 ?auto_845 ) ( ON ?auto_843 ?auto_848 ) ( CLEAR ?auto_843 ) ( not ( = ?auto_843 ?auto_848 ) ) ( not ( = ?auto_844 ?auto_848 ) ) ( IS-CRATE ?auto_844 ) ( not ( = ?auto_843 ?auto_847 ) ) ( not ( = ?auto_844 ?auto_847 ) ) ( not ( = ?auto_848 ?auto_847 ) ) ( AVAILABLE ?auto_852 ) ( SURFACE-AT ?auto_844 ?auto_845 ) ( ON ?auto_844 ?auto_851 ) ( CLEAR ?auto_844 ) ( not ( = ?auto_843 ?auto_851 ) ) ( not ( = ?auto_844 ?auto_851 ) ) ( not ( = ?auto_848 ?auto_851 ) ) ( not ( = ?auto_847 ?auto_851 ) ) ( TRUCK-AT ?auto_846 ?auto_849 ) ( SURFACE-AT ?auto_853 ?auto_849 ) ( CLEAR ?auto_853 ) ( LIFTING ?auto_850 ?auto_847 ) ( IS-CRATE ?auto_847 ) ( not ( = ?auto_843 ?auto_853 ) ) ( not ( = ?auto_844 ?auto_853 ) ) ( not ( = ?auto_848 ?auto_853 ) ) ( not ( = ?auto_847 ?auto_853 ) ) ( not ( = ?auto_851 ?auto_853 ) ) )
    :subtasks
    ( ( !DROP ?auto_850 ?auto_847 ?auto_853 ?auto_849 )
      ( MAKE-ON ?auto_843 ?auto_844 )
      ( MAKE-ON-VERIFY ?auto_843 ?auto_844 ) )
  )

)

