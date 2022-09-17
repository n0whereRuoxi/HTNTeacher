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

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_759 - SURFACE
      ?auto_760 - SURFACE
    )
    :vars
    (
      ?auto_761 - HOIST
      ?auto_762 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_761 ?auto_762 ) ( SURFACE-AT ?auto_759 ?auto_762 ) ( CLEAR ?auto_759 ) ( LIFTING ?auto_761 ?auto_760 ) ( IS-CRATE ?auto_760 ) ( not ( = ?auto_759 ?auto_760 ) ) )
    :subtasks
    ( ( !DROP ?auto_761 ?auto_760 ?auto_759 ?auto_762 )
      ( MAKE-1CRATE-VERIFY ?auto_759 ?auto_760 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_763 - SURFACE
      ?auto_764 - SURFACE
    )
    :vars
    (
      ?auto_765 - HOIST
      ?auto_766 - PLACE
      ?auto_767 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_765 ?auto_766 ) ( SURFACE-AT ?auto_763 ?auto_766 ) ( CLEAR ?auto_763 ) ( IS-CRATE ?auto_764 ) ( not ( = ?auto_763 ?auto_764 ) ) ( TRUCK-AT ?auto_767 ?auto_766 ) ( AVAILABLE ?auto_765 ) ( IN ?auto_764 ?auto_767 ) )
    :subtasks
    ( ( !UNLOAD ?auto_765 ?auto_764 ?auto_767 ?auto_766 )
      ( MAKE-1CRATE ?auto_763 ?auto_764 )
      ( MAKE-1CRATE-VERIFY ?auto_763 ?auto_764 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_768 - SURFACE
      ?auto_769 - SURFACE
    )
    :vars
    (
      ?auto_772 - HOIST
      ?auto_771 - PLACE
      ?auto_770 - TRUCK
      ?auto_773 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_772 ?auto_771 ) ( SURFACE-AT ?auto_768 ?auto_771 ) ( CLEAR ?auto_768 ) ( IS-CRATE ?auto_769 ) ( not ( = ?auto_768 ?auto_769 ) ) ( AVAILABLE ?auto_772 ) ( IN ?auto_769 ?auto_770 ) ( TRUCK-AT ?auto_770 ?auto_773 ) ( not ( = ?auto_773 ?auto_771 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_770 ?auto_773 ?auto_771 )
      ( MAKE-1CRATE ?auto_768 ?auto_769 )
      ( MAKE-1CRATE-VERIFY ?auto_768 ?auto_769 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_774 - SURFACE
      ?auto_775 - SURFACE
    )
    :vars
    (
      ?auto_776 - HOIST
      ?auto_777 - PLACE
      ?auto_778 - TRUCK
      ?auto_779 - PLACE
      ?auto_780 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_776 ?auto_777 ) ( SURFACE-AT ?auto_774 ?auto_777 ) ( CLEAR ?auto_774 ) ( IS-CRATE ?auto_775 ) ( not ( = ?auto_774 ?auto_775 ) ) ( AVAILABLE ?auto_776 ) ( TRUCK-AT ?auto_778 ?auto_779 ) ( not ( = ?auto_779 ?auto_777 ) ) ( HOIST-AT ?auto_780 ?auto_779 ) ( LIFTING ?auto_780 ?auto_775 ) ( not ( = ?auto_776 ?auto_780 ) ) )
    :subtasks
    ( ( !LOAD ?auto_780 ?auto_775 ?auto_778 ?auto_779 )
      ( MAKE-1CRATE ?auto_774 ?auto_775 )
      ( MAKE-1CRATE-VERIFY ?auto_774 ?auto_775 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_781 - SURFACE
      ?auto_782 - SURFACE
    )
    :vars
    (
      ?auto_783 - HOIST
      ?auto_787 - PLACE
      ?auto_785 - TRUCK
      ?auto_786 - PLACE
      ?auto_784 - HOIST
      ?auto_788 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_783 ?auto_787 ) ( SURFACE-AT ?auto_781 ?auto_787 ) ( CLEAR ?auto_781 ) ( IS-CRATE ?auto_782 ) ( not ( = ?auto_781 ?auto_782 ) ) ( AVAILABLE ?auto_783 ) ( TRUCK-AT ?auto_785 ?auto_786 ) ( not ( = ?auto_786 ?auto_787 ) ) ( HOIST-AT ?auto_784 ?auto_786 ) ( not ( = ?auto_783 ?auto_784 ) ) ( AVAILABLE ?auto_784 ) ( SURFACE-AT ?auto_782 ?auto_786 ) ( ON ?auto_782 ?auto_788 ) ( CLEAR ?auto_782 ) ( not ( = ?auto_781 ?auto_788 ) ) ( not ( = ?auto_782 ?auto_788 ) ) )
    :subtasks
    ( ( !LIFT ?auto_784 ?auto_782 ?auto_788 ?auto_786 )
      ( MAKE-1CRATE ?auto_781 ?auto_782 )
      ( MAKE-1CRATE-VERIFY ?auto_781 ?auto_782 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_789 - SURFACE
      ?auto_790 - SURFACE
    )
    :vars
    (
      ?auto_793 - HOIST
      ?auto_792 - PLACE
      ?auto_796 - PLACE
      ?auto_791 - HOIST
      ?auto_794 - SURFACE
      ?auto_795 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_793 ?auto_792 ) ( SURFACE-AT ?auto_789 ?auto_792 ) ( CLEAR ?auto_789 ) ( IS-CRATE ?auto_790 ) ( not ( = ?auto_789 ?auto_790 ) ) ( AVAILABLE ?auto_793 ) ( not ( = ?auto_796 ?auto_792 ) ) ( HOIST-AT ?auto_791 ?auto_796 ) ( not ( = ?auto_793 ?auto_791 ) ) ( AVAILABLE ?auto_791 ) ( SURFACE-AT ?auto_790 ?auto_796 ) ( ON ?auto_790 ?auto_794 ) ( CLEAR ?auto_790 ) ( not ( = ?auto_789 ?auto_794 ) ) ( not ( = ?auto_790 ?auto_794 ) ) ( TRUCK-AT ?auto_795 ?auto_792 ) )
    :subtasks
    ( ( !DRIVE ?auto_795 ?auto_792 ?auto_796 )
      ( MAKE-1CRATE ?auto_789 ?auto_790 )
      ( MAKE-1CRATE-VERIFY ?auto_789 ?auto_790 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_802 - SURFACE
      ?auto_803 - SURFACE
    )
    :vars
    (
      ?auto_804 - HOIST
      ?auto_805 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_804 ?auto_805 ) ( SURFACE-AT ?auto_802 ?auto_805 ) ( CLEAR ?auto_802 ) ( LIFTING ?auto_804 ?auto_803 ) ( IS-CRATE ?auto_803 ) ( not ( = ?auto_802 ?auto_803 ) ) )
    :subtasks
    ( ( !DROP ?auto_804 ?auto_803 ?auto_802 ?auto_805 )
      ( MAKE-1CRATE-VERIFY ?auto_802 ?auto_803 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_806 - SURFACE
      ?auto_807 - SURFACE
      ?auto_808 - SURFACE
    )
    :vars
    (
      ?auto_809 - HOIST
      ?auto_810 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_809 ?auto_810 ) ( SURFACE-AT ?auto_807 ?auto_810 ) ( CLEAR ?auto_807 ) ( LIFTING ?auto_809 ?auto_808 ) ( IS-CRATE ?auto_808 ) ( not ( = ?auto_807 ?auto_808 ) ) ( ON ?auto_807 ?auto_806 ) ( not ( = ?auto_806 ?auto_807 ) ) ( not ( = ?auto_806 ?auto_808 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_807 ?auto_808 )
      ( MAKE-2CRATE-VERIFY ?auto_806 ?auto_807 ?auto_808 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_811 - SURFACE
      ?auto_812 - SURFACE
    )
    :vars
    (
      ?auto_813 - HOIST
      ?auto_814 - PLACE
      ?auto_815 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_813 ?auto_814 ) ( SURFACE-AT ?auto_811 ?auto_814 ) ( CLEAR ?auto_811 ) ( IS-CRATE ?auto_812 ) ( not ( = ?auto_811 ?auto_812 ) ) ( TRUCK-AT ?auto_815 ?auto_814 ) ( AVAILABLE ?auto_813 ) ( IN ?auto_812 ?auto_815 ) )
    :subtasks
    ( ( !UNLOAD ?auto_813 ?auto_812 ?auto_815 ?auto_814 )
      ( MAKE-1CRATE ?auto_811 ?auto_812 )
      ( MAKE-1CRATE-VERIFY ?auto_811 ?auto_812 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_816 - SURFACE
      ?auto_817 - SURFACE
      ?auto_818 - SURFACE
    )
    :vars
    (
      ?auto_820 - HOIST
      ?auto_821 - PLACE
      ?auto_819 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_820 ?auto_821 ) ( SURFACE-AT ?auto_817 ?auto_821 ) ( CLEAR ?auto_817 ) ( IS-CRATE ?auto_818 ) ( not ( = ?auto_817 ?auto_818 ) ) ( TRUCK-AT ?auto_819 ?auto_821 ) ( AVAILABLE ?auto_820 ) ( IN ?auto_818 ?auto_819 ) ( ON ?auto_817 ?auto_816 ) ( not ( = ?auto_816 ?auto_817 ) ) ( not ( = ?auto_816 ?auto_818 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_817 ?auto_818 )
      ( MAKE-2CRATE-VERIFY ?auto_816 ?auto_817 ?auto_818 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_822 - SURFACE
      ?auto_823 - SURFACE
    )
    :vars
    (
      ?auto_825 - HOIST
      ?auto_826 - PLACE
      ?auto_827 - TRUCK
      ?auto_824 - SURFACE
      ?auto_828 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_825 ?auto_826 ) ( SURFACE-AT ?auto_822 ?auto_826 ) ( CLEAR ?auto_822 ) ( IS-CRATE ?auto_823 ) ( not ( = ?auto_822 ?auto_823 ) ) ( AVAILABLE ?auto_825 ) ( IN ?auto_823 ?auto_827 ) ( ON ?auto_822 ?auto_824 ) ( not ( = ?auto_824 ?auto_822 ) ) ( not ( = ?auto_824 ?auto_823 ) ) ( TRUCK-AT ?auto_827 ?auto_828 ) ( not ( = ?auto_828 ?auto_826 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_827 ?auto_828 ?auto_826 )
      ( MAKE-2CRATE ?auto_824 ?auto_822 ?auto_823 )
      ( MAKE-1CRATE-VERIFY ?auto_822 ?auto_823 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_829 - SURFACE
      ?auto_830 - SURFACE
      ?auto_831 - SURFACE
    )
    :vars
    (
      ?auto_835 - HOIST
      ?auto_834 - PLACE
      ?auto_833 - TRUCK
      ?auto_832 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_835 ?auto_834 ) ( SURFACE-AT ?auto_830 ?auto_834 ) ( CLEAR ?auto_830 ) ( IS-CRATE ?auto_831 ) ( not ( = ?auto_830 ?auto_831 ) ) ( AVAILABLE ?auto_835 ) ( IN ?auto_831 ?auto_833 ) ( ON ?auto_830 ?auto_829 ) ( not ( = ?auto_829 ?auto_830 ) ) ( not ( = ?auto_829 ?auto_831 ) ) ( TRUCK-AT ?auto_833 ?auto_832 ) ( not ( = ?auto_832 ?auto_834 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_830 ?auto_831 )
      ( MAKE-2CRATE-VERIFY ?auto_829 ?auto_830 ?auto_831 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_836 - SURFACE
      ?auto_837 - SURFACE
    )
    :vars
    (
      ?auto_841 - HOIST
      ?auto_842 - PLACE
      ?auto_838 - SURFACE
      ?auto_840 - TRUCK
      ?auto_839 - PLACE
      ?auto_843 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_841 ?auto_842 ) ( SURFACE-AT ?auto_836 ?auto_842 ) ( CLEAR ?auto_836 ) ( IS-CRATE ?auto_837 ) ( not ( = ?auto_836 ?auto_837 ) ) ( AVAILABLE ?auto_841 ) ( ON ?auto_836 ?auto_838 ) ( not ( = ?auto_838 ?auto_836 ) ) ( not ( = ?auto_838 ?auto_837 ) ) ( TRUCK-AT ?auto_840 ?auto_839 ) ( not ( = ?auto_839 ?auto_842 ) ) ( HOIST-AT ?auto_843 ?auto_839 ) ( LIFTING ?auto_843 ?auto_837 ) ( not ( = ?auto_841 ?auto_843 ) ) )
    :subtasks
    ( ( !LOAD ?auto_843 ?auto_837 ?auto_840 ?auto_839 )
      ( MAKE-2CRATE ?auto_838 ?auto_836 ?auto_837 )
      ( MAKE-1CRATE-VERIFY ?auto_836 ?auto_837 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_844 - SURFACE
      ?auto_845 - SURFACE
      ?auto_846 - SURFACE
    )
    :vars
    (
      ?auto_848 - HOIST
      ?auto_850 - PLACE
      ?auto_851 - TRUCK
      ?auto_849 - PLACE
      ?auto_847 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_848 ?auto_850 ) ( SURFACE-AT ?auto_845 ?auto_850 ) ( CLEAR ?auto_845 ) ( IS-CRATE ?auto_846 ) ( not ( = ?auto_845 ?auto_846 ) ) ( AVAILABLE ?auto_848 ) ( ON ?auto_845 ?auto_844 ) ( not ( = ?auto_844 ?auto_845 ) ) ( not ( = ?auto_844 ?auto_846 ) ) ( TRUCK-AT ?auto_851 ?auto_849 ) ( not ( = ?auto_849 ?auto_850 ) ) ( HOIST-AT ?auto_847 ?auto_849 ) ( LIFTING ?auto_847 ?auto_846 ) ( not ( = ?auto_848 ?auto_847 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845 ?auto_846 )
      ( MAKE-2CRATE-VERIFY ?auto_844 ?auto_845 ?auto_846 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_852 - SURFACE
      ?auto_853 - SURFACE
    )
    :vars
    (
      ?auto_855 - HOIST
      ?auto_854 - PLACE
      ?auto_857 - SURFACE
      ?auto_856 - TRUCK
      ?auto_858 - PLACE
      ?auto_859 - HOIST
      ?auto_860 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_855 ?auto_854 ) ( SURFACE-AT ?auto_852 ?auto_854 ) ( CLEAR ?auto_852 ) ( IS-CRATE ?auto_853 ) ( not ( = ?auto_852 ?auto_853 ) ) ( AVAILABLE ?auto_855 ) ( ON ?auto_852 ?auto_857 ) ( not ( = ?auto_857 ?auto_852 ) ) ( not ( = ?auto_857 ?auto_853 ) ) ( TRUCK-AT ?auto_856 ?auto_858 ) ( not ( = ?auto_858 ?auto_854 ) ) ( HOIST-AT ?auto_859 ?auto_858 ) ( not ( = ?auto_855 ?auto_859 ) ) ( AVAILABLE ?auto_859 ) ( SURFACE-AT ?auto_853 ?auto_858 ) ( ON ?auto_853 ?auto_860 ) ( CLEAR ?auto_853 ) ( not ( = ?auto_852 ?auto_860 ) ) ( not ( = ?auto_853 ?auto_860 ) ) ( not ( = ?auto_857 ?auto_860 ) ) )
    :subtasks
    ( ( !LIFT ?auto_859 ?auto_853 ?auto_860 ?auto_858 )
      ( MAKE-2CRATE ?auto_857 ?auto_852 ?auto_853 )
      ( MAKE-1CRATE-VERIFY ?auto_852 ?auto_853 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_861 - SURFACE
      ?auto_862 - SURFACE
      ?auto_863 - SURFACE
    )
    :vars
    (
      ?auto_865 - HOIST
      ?auto_868 - PLACE
      ?auto_864 - TRUCK
      ?auto_869 - PLACE
      ?auto_866 - HOIST
      ?auto_867 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_865 ?auto_868 ) ( SURFACE-AT ?auto_862 ?auto_868 ) ( CLEAR ?auto_862 ) ( IS-CRATE ?auto_863 ) ( not ( = ?auto_862 ?auto_863 ) ) ( AVAILABLE ?auto_865 ) ( ON ?auto_862 ?auto_861 ) ( not ( = ?auto_861 ?auto_862 ) ) ( not ( = ?auto_861 ?auto_863 ) ) ( TRUCK-AT ?auto_864 ?auto_869 ) ( not ( = ?auto_869 ?auto_868 ) ) ( HOIST-AT ?auto_866 ?auto_869 ) ( not ( = ?auto_865 ?auto_866 ) ) ( AVAILABLE ?auto_866 ) ( SURFACE-AT ?auto_863 ?auto_869 ) ( ON ?auto_863 ?auto_867 ) ( CLEAR ?auto_863 ) ( not ( = ?auto_862 ?auto_867 ) ) ( not ( = ?auto_863 ?auto_867 ) ) ( not ( = ?auto_861 ?auto_867 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_862 ?auto_863 )
      ( MAKE-2CRATE-VERIFY ?auto_861 ?auto_862 ?auto_863 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_870 - SURFACE
      ?auto_871 - SURFACE
    )
    :vars
    (
      ?auto_874 - HOIST
      ?auto_872 - PLACE
      ?auto_875 - SURFACE
      ?auto_877 - PLACE
      ?auto_873 - HOIST
      ?auto_876 - SURFACE
      ?auto_878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_874 ?auto_872 ) ( SURFACE-AT ?auto_870 ?auto_872 ) ( CLEAR ?auto_870 ) ( IS-CRATE ?auto_871 ) ( not ( = ?auto_870 ?auto_871 ) ) ( AVAILABLE ?auto_874 ) ( ON ?auto_870 ?auto_875 ) ( not ( = ?auto_875 ?auto_870 ) ) ( not ( = ?auto_875 ?auto_871 ) ) ( not ( = ?auto_877 ?auto_872 ) ) ( HOIST-AT ?auto_873 ?auto_877 ) ( not ( = ?auto_874 ?auto_873 ) ) ( AVAILABLE ?auto_873 ) ( SURFACE-AT ?auto_871 ?auto_877 ) ( ON ?auto_871 ?auto_876 ) ( CLEAR ?auto_871 ) ( not ( = ?auto_870 ?auto_876 ) ) ( not ( = ?auto_871 ?auto_876 ) ) ( not ( = ?auto_875 ?auto_876 ) ) ( TRUCK-AT ?auto_878 ?auto_872 ) )
    :subtasks
    ( ( !DRIVE ?auto_878 ?auto_872 ?auto_877 )
      ( MAKE-2CRATE ?auto_875 ?auto_870 ?auto_871 )
      ( MAKE-1CRATE-VERIFY ?auto_870 ?auto_871 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_879 - SURFACE
      ?auto_880 - SURFACE
      ?auto_881 - SURFACE
    )
    :vars
    (
      ?auto_882 - HOIST
      ?auto_883 - PLACE
      ?auto_885 - PLACE
      ?auto_886 - HOIST
      ?auto_884 - SURFACE
      ?auto_887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_882 ?auto_883 ) ( SURFACE-AT ?auto_880 ?auto_883 ) ( CLEAR ?auto_880 ) ( IS-CRATE ?auto_881 ) ( not ( = ?auto_880 ?auto_881 ) ) ( AVAILABLE ?auto_882 ) ( ON ?auto_880 ?auto_879 ) ( not ( = ?auto_879 ?auto_880 ) ) ( not ( = ?auto_879 ?auto_881 ) ) ( not ( = ?auto_885 ?auto_883 ) ) ( HOIST-AT ?auto_886 ?auto_885 ) ( not ( = ?auto_882 ?auto_886 ) ) ( AVAILABLE ?auto_886 ) ( SURFACE-AT ?auto_881 ?auto_885 ) ( ON ?auto_881 ?auto_884 ) ( CLEAR ?auto_881 ) ( not ( = ?auto_880 ?auto_884 ) ) ( not ( = ?auto_881 ?auto_884 ) ) ( not ( = ?auto_879 ?auto_884 ) ) ( TRUCK-AT ?auto_887 ?auto_883 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_880 ?auto_881 )
      ( MAKE-2CRATE-VERIFY ?auto_879 ?auto_880 ?auto_881 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_888 - SURFACE
      ?auto_889 - SURFACE
    )
    :vars
    (
      ?auto_895 - HOIST
      ?auto_891 - PLACE
      ?auto_890 - SURFACE
      ?auto_896 - PLACE
      ?auto_894 - HOIST
      ?auto_892 - SURFACE
      ?auto_893 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_895 ?auto_891 ) ( IS-CRATE ?auto_889 ) ( not ( = ?auto_888 ?auto_889 ) ) ( not ( = ?auto_890 ?auto_888 ) ) ( not ( = ?auto_890 ?auto_889 ) ) ( not ( = ?auto_896 ?auto_891 ) ) ( HOIST-AT ?auto_894 ?auto_896 ) ( not ( = ?auto_895 ?auto_894 ) ) ( AVAILABLE ?auto_894 ) ( SURFACE-AT ?auto_889 ?auto_896 ) ( ON ?auto_889 ?auto_892 ) ( CLEAR ?auto_889 ) ( not ( = ?auto_888 ?auto_892 ) ) ( not ( = ?auto_889 ?auto_892 ) ) ( not ( = ?auto_890 ?auto_892 ) ) ( TRUCK-AT ?auto_893 ?auto_891 ) ( SURFACE-AT ?auto_890 ?auto_891 ) ( CLEAR ?auto_890 ) ( LIFTING ?auto_895 ?auto_888 ) ( IS-CRATE ?auto_888 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_890 ?auto_888 )
      ( MAKE-2CRATE ?auto_890 ?auto_888 ?auto_889 )
      ( MAKE-1CRATE-VERIFY ?auto_888 ?auto_889 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_897 - SURFACE
      ?auto_898 - SURFACE
      ?auto_899 - SURFACE
    )
    :vars
    (
      ?auto_905 - HOIST
      ?auto_901 - PLACE
      ?auto_903 - PLACE
      ?auto_902 - HOIST
      ?auto_900 - SURFACE
      ?auto_904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_905 ?auto_901 ) ( IS-CRATE ?auto_899 ) ( not ( = ?auto_898 ?auto_899 ) ) ( not ( = ?auto_897 ?auto_898 ) ) ( not ( = ?auto_897 ?auto_899 ) ) ( not ( = ?auto_903 ?auto_901 ) ) ( HOIST-AT ?auto_902 ?auto_903 ) ( not ( = ?auto_905 ?auto_902 ) ) ( AVAILABLE ?auto_902 ) ( SURFACE-AT ?auto_899 ?auto_903 ) ( ON ?auto_899 ?auto_900 ) ( CLEAR ?auto_899 ) ( not ( = ?auto_898 ?auto_900 ) ) ( not ( = ?auto_899 ?auto_900 ) ) ( not ( = ?auto_897 ?auto_900 ) ) ( TRUCK-AT ?auto_904 ?auto_901 ) ( SURFACE-AT ?auto_897 ?auto_901 ) ( CLEAR ?auto_897 ) ( LIFTING ?auto_905 ?auto_898 ) ( IS-CRATE ?auto_898 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_898 ?auto_899 )
      ( MAKE-2CRATE-VERIFY ?auto_897 ?auto_898 ?auto_899 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_906 - SURFACE
      ?auto_907 - SURFACE
    )
    :vars
    (
      ?auto_913 - HOIST
      ?auto_909 - PLACE
      ?auto_914 - SURFACE
      ?auto_910 - PLACE
      ?auto_908 - HOIST
      ?auto_911 - SURFACE
      ?auto_912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_913 ?auto_909 ) ( IS-CRATE ?auto_907 ) ( not ( = ?auto_906 ?auto_907 ) ) ( not ( = ?auto_914 ?auto_906 ) ) ( not ( = ?auto_914 ?auto_907 ) ) ( not ( = ?auto_910 ?auto_909 ) ) ( HOIST-AT ?auto_908 ?auto_910 ) ( not ( = ?auto_913 ?auto_908 ) ) ( AVAILABLE ?auto_908 ) ( SURFACE-AT ?auto_907 ?auto_910 ) ( ON ?auto_907 ?auto_911 ) ( CLEAR ?auto_907 ) ( not ( = ?auto_906 ?auto_911 ) ) ( not ( = ?auto_907 ?auto_911 ) ) ( not ( = ?auto_914 ?auto_911 ) ) ( TRUCK-AT ?auto_912 ?auto_909 ) ( SURFACE-AT ?auto_914 ?auto_909 ) ( CLEAR ?auto_914 ) ( IS-CRATE ?auto_906 ) ( AVAILABLE ?auto_913 ) ( IN ?auto_906 ?auto_912 ) )
    :subtasks
    ( ( !UNLOAD ?auto_913 ?auto_906 ?auto_912 ?auto_909 )
      ( MAKE-2CRATE ?auto_914 ?auto_906 ?auto_907 )
      ( MAKE-1CRATE-VERIFY ?auto_906 ?auto_907 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_915 - SURFACE
      ?auto_916 - SURFACE
      ?auto_917 - SURFACE
    )
    :vars
    (
      ?auto_918 - HOIST
      ?auto_919 - PLACE
      ?auto_921 - PLACE
      ?auto_920 - HOIST
      ?auto_923 - SURFACE
      ?auto_922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_918 ?auto_919 ) ( IS-CRATE ?auto_917 ) ( not ( = ?auto_916 ?auto_917 ) ) ( not ( = ?auto_915 ?auto_916 ) ) ( not ( = ?auto_915 ?auto_917 ) ) ( not ( = ?auto_921 ?auto_919 ) ) ( HOIST-AT ?auto_920 ?auto_921 ) ( not ( = ?auto_918 ?auto_920 ) ) ( AVAILABLE ?auto_920 ) ( SURFACE-AT ?auto_917 ?auto_921 ) ( ON ?auto_917 ?auto_923 ) ( CLEAR ?auto_917 ) ( not ( = ?auto_916 ?auto_923 ) ) ( not ( = ?auto_917 ?auto_923 ) ) ( not ( = ?auto_915 ?auto_923 ) ) ( TRUCK-AT ?auto_922 ?auto_919 ) ( SURFACE-AT ?auto_915 ?auto_919 ) ( CLEAR ?auto_915 ) ( IS-CRATE ?auto_916 ) ( AVAILABLE ?auto_918 ) ( IN ?auto_916 ?auto_922 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_916 ?auto_917 )
      ( MAKE-2CRATE-VERIFY ?auto_915 ?auto_916 ?auto_917 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_924 - SURFACE
      ?auto_925 - SURFACE
    )
    :vars
    (
      ?auto_932 - HOIST
      ?auto_931 - PLACE
      ?auto_927 - SURFACE
      ?auto_926 - PLACE
      ?auto_930 - HOIST
      ?auto_929 - SURFACE
      ?auto_928 - TRUCK
      ?auto_933 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_932 ?auto_931 ) ( IS-CRATE ?auto_925 ) ( not ( = ?auto_924 ?auto_925 ) ) ( not ( = ?auto_927 ?auto_924 ) ) ( not ( = ?auto_927 ?auto_925 ) ) ( not ( = ?auto_926 ?auto_931 ) ) ( HOIST-AT ?auto_930 ?auto_926 ) ( not ( = ?auto_932 ?auto_930 ) ) ( AVAILABLE ?auto_930 ) ( SURFACE-AT ?auto_925 ?auto_926 ) ( ON ?auto_925 ?auto_929 ) ( CLEAR ?auto_925 ) ( not ( = ?auto_924 ?auto_929 ) ) ( not ( = ?auto_925 ?auto_929 ) ) ( not ( = ?auto_927 ?auto_929 ) ) ( SURFACE-AT ?auto_927 ?auto_931 ) ( CLEAR ?auto_927 ) ( IS-CRATE ?auto_924 ) ( AVAILABLE ?auto_932 ) ( IN ?auto_924 ?auto_928 ) ( TRUCK-AT ?auto_928 ?auto_933 ) ( not ( = ?auto_933 ?auto_931 ) ) ( not ( = ?auto_926 ?auto_933 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_928 ?auto_933 ?auto_931 )
      ( MAKE-2CRATE ?auto_927 ?auto_924 ?auto_925 )
      ( MAKE-1CRATE-VERIFY ?auto_924 ?auto_925 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_934 - SURFACE
      ?auto_935 - SURFACE
      ?auto_936 - SURFACE
    )
    :vars
    (
      ?auto_939 - HOIST
      ?auto_940 - PLACE
      ?auto_937 - PLACE
      ?auto_941 - HOIST
      ?auto_942 - SURFACE
      ?auto_943 - TRUCK
      ?auto_938 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_939 ?auto_940 ) ( IS-CRATE ?auto_936 ) ( not ( = ?auto_935 ?auto_936 ) ) ( not ( = ?auto_934 ?auto_935 ) ) ( not ( = ?auto_934 ?auto_936 ) ) ( not ( = ?auto_937 ?auto_940 ) ) ( HOIST-AT ?auto_941 ?auto_937 ) ( not ( = ?auto_939 ?auto_941 ) ) ( AVAILABLE ?auto_941 ) ( SURFACE-AT ?auto_936 ?auto_937 ) ( ON ?auto_936 ?auto_942 ) ( CLEAR ?auto_936 ) ( not ( = ?auto_935 ?auto_942 ) ) ( not ( = ?auto_936 ?auto_942 ) ) ( not ( = ?auto_934 ?auto_942 ) ) ( SURFACE-AT ?auto_934 ?auto_940 ) ( CLEAR ?auto_934 ) ( IS-CRATE ?auto_935 ) ( AVAILABLE ?auto_939 ) ( IN ?auto_935 ?auto_943 ) ( TRUCK-AT ?auto_943 ?auto_938 ) ( not ( = ?auto_938 ?auto_940 ) ) ( not ( = ?auto_937 ?auto_938 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_935 ?auto_936 )
      ( MAKE-2CRATE-VERIFY ?auto_934 ?auto_935 ?auto_936 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_944 - SURFACE
      ?auto_945 - SURFACE
    )
    :vars
    (
      ?auto_951 - HOIST
      ?auto_950 - PLACE
      ?auto_953 - SURFACE
      ?auto_947 - PLACE
      ?auto_946 - HOIST
      ?auto_949 - SURFACE
      ?auto_952 - TRUCK
      ?auto_948 - PLACE
      ?auto_954 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_951 ?auto_950 ) ( IS-CRATE ?auto_945 ) ( not ( = ?auto_944 ?auto_945 ) ) ( not ( = ?auto_953 ?auto_944 ) ) ( not ( = ?auto_953 ?auto_945 ) ) ( not ( = ?auto_947 ?auto_950 ) ) ( HOIST-AT ?auto_946 ?auto_947 ) ( not ( = ?auto_951 ?auto_946 ) ) ( AVAILABLE ?auto_946 ) ( SURFACE-AT ?auto_945 ?auto_947 ) ( ON ?auto_945 ?auto_949 ) ( CLEAR ?auto_945 ) ( not ( = ?auto_944 ?auto_949 ) ) ( not ( = ?auto_945 ?auto_949 ) ) ( not ( = ?auto_953 ?auto_949 ) ) ( SURFACE-AT ?auto_953 ?auto_950 ) ( CLEAR ?auto_953 ) ( IS-CRATE ?auto_944 ) ( AVAILABLE ?auto_951 ) ( TRUCK-AT ?auto_952 ?auto_948 ) ( not ( = ?auto_948 ?auto_950 ) ) ( not ( = ?auto_947 ?auto_948 ) ) ( HOIST-AT ?auto_954 ?auto_948 ) ( LIFTING ?auto_954 ?auto_944 ) ( not ( = ?auto_951 ?auto_954 ) ) ( not ( = ?auto_946 ?auto_954 ) ) )
    :subtasks
    ( ( !LOAD ?auto_954 ?auto_944 ?auto_952 ?auto_948 )
      ( MAKE-2CRATE ?auto_953 ?auto_944 ?auto_945 )
      ( MAKE-1CRATE-VERIFY ?auto_944 ?auto_945 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_955 - SURFACE
      ?auto_956 - SURFACE
      ?auto_957 - SURFACE
    )
    :vars
    (
      ?auto_960 - HOIST
      ?auto_961 - PLACE
      ?auto_958 - PLACE
      ?auto_959 - HOIST
      ?auto_962 - SURFACE
      ?auto_963 - TRUCK
      ?auto_965 - PLACE
      ?auto_964 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_960 ?auto_961 ) ( IS-CRATE ?auto_957 ) ( not ( = ?auto_956 ?auto_957 ) ) ( not ( = ?auto_955 ?auto_956 ) ) ( not ( = ?auto_955 ?auto_957 ) ) ( not ( = ?auto_958 ?auto_961 ) ) ( HOIST-AT ?auto_959 ?auto_958 ) ( not ( = ?auto_960 ?auto_959 ) ) ( AVAILABLE ?auto_959 ) ( SURFACE-AT ?auto_957 ?auto_958 ) ( ON ?auto_957 ?auto_962 ) ( CLEAR ?auto_957 ) ( not ( = ?auto_956 ?auto_962 ) ) ( not ( = ?auto_957 ?auto_962 ) ) ( not ( = ?auto_955 ?auto_962 ) ) ( SURFACE-AT ?auto_955 ?auto_961 ) ( CLEAR ?auto_955 ) ( IS-CRATE ?auto_956 ) ( AVAILABLE ?auto_960 ) ( TRUCK-AT ?auto_963 ?auto_965 ) ( not ( = ?auto_965 ?auto_961 ) ) ( not ( = ?auto_958 ?auto_965 ) ) ( HOIST-AT ?auto_964 ?auto_965 ) ( LIFTING ?auto_964 ?auto_956 ) ( not ( = ?auto_960 ?auto_964 ) ) ( not ( = ?auto_959 ?auto_964 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_956 ?auto_957 )
      ( MAKE-2CRATE-VERIFY ?auto_955 ?auto_956 ?auto_957 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_966 - SURFACE
      ?auto_967 - SURFACE
    )
    :vars
    (
      ?auto_974 - HOIST
      ?auto_969 - PLACE
      ?auto_971 - SURFACE
      ?auto_968 - PLACE
      ?auto_973 - HOIST
      ?auto_976 - SURFACE
      ?auto_970 - TRUCK
      ?auto_975 - PLACE
      ?auto_972 - HOIST
      ?auto_977 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_974 ?auto_969 ) ( IS-CRATE ?auto_967 ) ( not ( = ?auto_966 ?auto_967 ) ) ( not ( = ?auto_971 ?auto_966 ) ) ( not ( = ?auto_971 ?auto_967 ) ) ( not ( = ?auto_968 ?auto_969 ) ) ( HOIST-AT ?auto_973 ?auto_968 ) ( not ( = ?auto_974 ?auto_973 ) ) ( AVAILABLE ?auto_973 ) ( SURFACE-AT ?auto_967 ?auto_968 ) ( ON ?auto_967 ?auto_976 ) ( CLEAR ?auto_967 ) ( not ( = ?auto_966 ?auto_976 ) ) ( not ( = ?auto_967 ?auto_976 ) ) ( not ( = ?auto_971 ?auto_976 ) ) ( SURFACE-AT ?auto_971 ?auto_969 ) ( CLEAR ?auto_971 ) ( IS-CRATE ?auto_966 ) ( AVAILABLE ?auto_974 ) ( TRUCK-AT ?auto_970 ?auto_975 ) ( not ( = ?auto_975 ?auto_969 ) ) ( not ( = ?auto_968 ?auto_975 ) ) ( HOIST-AT ?auto_972 ?auto_975 ) ( not ( = ?auto_974 ?auto_972 ) ) ( not ( = ?auto_973 ?auto_972 ) ) ( AVAILABLE ?auto_972 ) ( SURFACE-AT ?auto_966 ?auto_975 ) ( ON ?auto_966 ?auto_977 ) ( CLEAR ?auto_966 ) ( not ( = ?auto_966 ?auto_977 ) ) ( not ( = ?auto_967 ?auto_977 ) ) ( not ( = ?auto_971 ?auto_977 ) ) ( not ( = ?auto_976 ?auto_977 ) ) )
    :subtasks
    ( ( !LIFT ?auto_972 ?auto_966 ?auto_977 ?auto_975 )
      ( MAKE-2CRATE ?auto_971 ?auto_966 ?auto_967 )
      ( MAKE-1CRATE-VERIFY ?auto_966 ?auto_967 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_978 - SURFACE
      ?auto_979 - SURFACE
      ?auto_980 - SURFACE
    )
    :vars
    (
      ?auto_989 - HOIST
      ?auto_984 - PLACE
      ?auto_988 - PLACE
      ?auto_982 - HOIST
      ?auto_985 - SURFACE
      ?auto_983 - TRUCK
      ?auto_986 - PLACE
      ?auto_987 - HOIST
      ?auto_981 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_989 ?auto_984 ) ( IS-CRATE ?auto_980 ) ( not ( = ?auto_979 ?auto_980 ) ) ( not ( = ?auto_978 ?auto_979 ) ) ( not ( = ?auto_978 ?auto_980 ) ) ( not ( = ?auto_988 ?auto_984 ) ) ( HOIST-AT ?auto_982 ?auto_988 ) ( not ( = ?auto_989 ?auto_982 ) ) ( AVAILABLE ?auto_982 ) ( SURFACE-AT ?auto_980 ?auto_988 ) ( ON ?auto_980 ?auto_985 ) ( CLEAR ?auto_980 ) ( not ( = ?auto_979 ?auto_985 ) ) ( not ( = ?auto_980 ?auto_985 ) ) ( not ( = ?auto_978 ?auto_985 ) ) ( SURFACE-AT ?auto_978 ?auto_984 ) ( CLEAR ?auto_978 ) ( IS-CRATE ?auto_979 ) ( AVAILABLE ?auto_989 ) ( TRUCK-AT ?auto_983 ?auto_986 ) ( not ( = ?auto_986 ?auto_984 ) ) ( not ( = ?auto_988 ?auto_986 ) ) ( HOIST-AT ?auto_987 ?auto_986 ) ( not ( = ?auto_989 ?auto_987 ) ) ( not ( = ?auto_982 ?auto_987 ) ) ( AVAILABLE ?auto_987 ) ( SURFACE-AT ?auto_979 ?auto_986 ) ( ON ?auto_979 ?auto_981 ) ( CLEAR ?auto_979 ) ( not ( = ?auto_979 ?auto_981 ) ) ( not ( = ?auto_980 ?auto_981 ) ) ( not ( = ?auto_978 ?auto_981 ) ) ( not ( = ?auto_985 ?auto_981 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_979 ?auto_980 )
      ( MAKE-2CRATE-VERIFY ?auto_978 ?auto_979 ?auto_980 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_990 - SURFACE
      ?auto_991 - SURFACE
    )
    :vars
    (
      ?auto_998 - HOIST
      ?auto_992 - PLACE
      ?auto_1001 - SURFACE
      ?auto_994 - PLACE
      ?auto_993 - HOIST
      ?auto_999 - SURFACE
      ?auto_997 - PLACE
      ?auto_996 - HOIST
      ?auto_1000 - SURFACE
      ?auto_995 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_998 ?auto_992 ) ( IS-CRATE ?auto_991 ) ( not ( = ?auto_990 ?auto_991 ) ) ( not ( = ?auto_1001 ?auto_990 ) ) ( not ( = ?auto_1001 ?auto_991 ) ) ( not ( = ?auto_994 ?auto_992 ) ) ( HOIST-AT ?auto_993 ?auto_994 ) ( not ( = ?auto_998 ?auto_993 ) ) ( AVAILABLE ?auto_993 ) ( SURFACE-AT ?auto_991 ?auto_994 ) ( ON ?auto_991 ?auto_999 ) ( CLEAR ?auto_991 ) ( not ( = ?auto_990 ?auto_999 ) ) ( not ( = ?auto_991 ?auto_999 ) ) ( not ( = ?auto_1001 ?auto_999 ) ) ( SURFACE-AT ?auto_1001 ?auto_992 ) ( CLEAR ?auto_1001 ) ( IS-CRATE ?auto_990 ) ( AVAILABLE ?auto_998 ) ( not ( = ?auto_997 ?auto_992 ) ) ( not ( = ?auto_994 ?auto_997 ) ) ( HOIST-AT ?auto_996 ?auto_997 ) ( not ( = ?auto_998 ?auto_996 ) ) ( not ( = ?auto_993 ?auto_996 ) ) ( AVAILABLE ?auto_996 ) ( SURFACE-AT ?auto_990 ?auto_997 ) ( ON ?auto_990 ?auto_1000 ) ( CLEAR ?auto_990 ) ( not ( = ?auto_990 ?auto_1000 ) ) ( not ( = ?auto_991 ?auto_1000 ) ) ( not ( = ?auto_1001 ?auto_1000 ) ) ( not ( = ?auto_999 ?auto_1000 ) ) ( TRUCK-AT ?auto_995 ?auto_992 ) )
    :subtasks
    ( ( !DRIVE ?auto_995 ?auto_992 ?auto_997 )
      ( MAKE-2CRATE ?auto_1001 ?auto_990 ?auto_991 )
      ( MAKE-1CRATE-VERIFY ?auto_990 ?auto_991 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1002 - SURFACE
      ?auto_1003 - SURFACE
      ?auto_1004 - SURFACE
    )
    :vars
    (
      ?auto_1005 - HOIST
      ?auto_1008 - PLACE
      ?auto_1012 - PLACE
      ?auto_1006 - HOIST
      ?auto_1009 - SURFACE
      ?auto_1013 - PLACE
      ?auto_1011 - HOIST
      ?auto_1010 - SURFACE
      ?auto_1007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1005 ?auto_1008 ) ( IS-CRATE ?auto_1004 ) ( not ( = ?auto_1003 ?auto_1004 ) ) ( not ( = ?auto_1002 ?auto_1003 ) ) ( not ( = ?auto_1002 ?auto_1004 ) ) ( not ( = ?auto_1012 ?auto_1008 ) ) ( HOIST-AT ?auto_1006 ?auto_1012 ) ( not ( = ?auto_1005 ?auto_1006 ) ) ( AVAILABLE ?auto_1006 ) ( SURFACE-AT ?auto_1004 ?auto_1012 ) ( ON ?auto_1004 ?auto_1009 ) ( CLEAR ?auto_1004 ) ( not ( = ?auto_1003 ?auto_1009 ) ) ( not ( = ?auto_1004 ?auto_1009 ) ) ( not ( = ?auto_1002 ?auto_1009 ) ) ( SURFACE-AT ?auto_1002 ?auto_1008 ) ( CLEAR ?auto_1002 ) ( IS-CRATE ?auto_1003 ) ( AVAILABLE ?auto_1005 ) ( not ( = ?auto_1013 ?auto_1008 ) ) ( not ( = ?auto_1012 ?auto_1013 ) ) ( HOIST-AT ?auto_1011 ?auto_1013 ) ( not ( = ?auto_1005 ?auto_1011 ) ) ( not ( = ?auto_1006 ?auto_1011 ) ) ( AVAILABLE ?auto_1011 ) ( SURFACE-AT ?auto_1003 ?auto_1013 ) ( ON ?auto_1003 ?auto_1010 ) ( CLEAR ?auto_1003 ) ( not ( = ?auto_1003 ?auto_1010 ) ) ( not ( = ?auto_1004 ?auto_1010 ) ) ( not ( = ?auto_1002 ?auto_1010 ) ) ( not ( = ?auto_1009 ?auto_1010 ) ) ( TRUCK-AT ?auto_1007 ?auto_1008 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1003 ?auto_1004 )
      ( MAKE-2CRATE-VERIFY ?auto_1002 ?auto_1003 ?auto_1004 ) )
  )

)

