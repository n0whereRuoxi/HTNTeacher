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

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_776 - SURFACE
      ?auto_777 - SURFACE
    )
    :vars
    (
      ?auto_778 - HOIST
      ?auto_779 - PLACE
      ?auto_781 - PLACE
      ?auto_782 - HOIST
      ?auto_783 - SURFACE
      ?auto_780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_778 ?auto_779 ) ( SURFACE-AT ?auto_776 ?auto_779 ) ( CLEAR ?auto_776 ) ( IS-CRATE ?auto_777 ) ( AVAILABLE ?auto_778 ) ( not ( = ?auto_781 ?auto_779 ) ) ( HOIST-AT ?auto_782 ?auto_781 ) ( AVAILABLE ?auto_782 ) ( SURFACE-AT ?auto_777 ?auto_781 ) ( ON ?auto_777 ?auto_783 ) ( CLEAR ?auto_777 ) ( TRUCK-AT ?auto_780 ?auto_779 ) ( not ( = ?auto_776 ?auto_777 ) ) ( not ( = ?auto_776 ?auto_783 ) ) ( not ( = ?auto_777 ?auto_783 ) ) ( not ( = ?auto_778 ?auto_782 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_780 ?auto_779 ?auto_781 )
      ( !LIFT ?auto_782 ?auto_777 ?auto_783 ?auto_781 )
      ( !LOAD ?auto_782 ?auto_777 ?auto_780 ?auto_781 )
      ( !DRIVE ?auto_780 ?auto_781 ?auto_779 )
      ( !UNLOAD ?auto_778 ?auto_777 ?auto_780 ?auto_779 )
      ( !DROP ?auto_778 ?auto_777 ?auto_776 ?auto_779 )
      ( MAKE-1CRATE-VERIFY ?auto_776 ?auto_777 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_786 - SURFACE
      ?auto_787 - SURFACE
    )
    :vars
    (
      ?auto_788 - HOIST
      ?auto_789 - PLACE
      ?auto_791 - PLACE
      ?auto_792 - HOIST
      ?auto_793 - SURFACE
      ?auto_790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_788 ?auto_789 ) ( SURFACE-AT ?auto_786 ?auto_789 ) ( CLEAR ?auto_786 ) ( IS-CRATE ?auto_787 ) ( AVAILABLE ?auto_788 ) ( not ( = ?auto_791 ?auto_789 ) ) ( HOIST-AT ?auto_792 ?auto_791 ) ( AVAILABLE ?auto_792 ) ( SURFACE-AT ?auto_787 ?auto_791 ) ( ON ?auto_787 ?auto_793 ) ( CLEAR ?auto_787 ) ( TRUCK-AT ?auto_790 ?auto_789 ) ( not ( = ?auto_786 ?auto_787 ) ) ( not ( = ?auto_786 ?auto_793 ) ) ( not ( = ?auto_787 ?auto_793 ) ) ( not ( = ?auto_788 ?auto_792 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_790 ?auto_789 ?auto_791 )
      ( !LIFT ?auto_792 ?auto_787 ?auto_793 ?auto_791 )
      ( !LOAD ?auto_792 ?auto_787 ?auto_790 ?auto_791 )
      ( !DRIVE ?auto_790 ?auto_791 ?auto_789 )
      ( !UNLOAD ?auto_788 ?auto_787 ?auto_790 ?auto_789 )
      ( !DROP ?auto_788 ?auto_787 ?auto_786 ?auto_789 )
      ( MAKE-1CRATE-VERIFY ?auto_786 ?auto_787 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_797 - SURFACE
      ?auto_798 - SURFACE
      ?auto_799 - SURFACE
    )
    :vars
    (
      ?auto_801 - HOIST
      ?auto_802 - PLACE
      ?auto_803 - PLACE
      ?auto_800 - HOIST
      ?auto_805 - SURFACE
      ?auto_806 - PLACE
      ?auto_807 - HOIST
      ?auto_808 - SURFACE
      ?auto_804 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_801 ?auto_802 ) ( IS-CRATE ?auto_799 ) ( not ( = ?auto_803 ?auto_802 ) ) ( HOIST-AT ?auto_800 ?auto_803 ) ( AVAILABLE ?auto_800 ) ( SURFACE-AT ?auto_799 ?auto_803 ) ( ON ?auto_799 ?auto_805 ) ( CLEAR ?auto_799 ) ( not ( = ?auto_798 ?auto_799 ) ) ( not ( = ?auto_798 ?auto_805 ) ) ( not ( = ?auto_799 ?auto_805 ) ) ( not ( = ?auto_801 ?auto_800 ) ) ( SURFACE-AT ?auto_797 ?auto_802 ) ( CLEAR ?auto_797 ) ( IS-CRATE ?auto_798 ) ( AVAILABLE ?auto_801 ) ( not ( = ?auto_806 ?auto_802 ) ) ( HOIST-AT ?auto_807 ?auto_806 ) ( AVAILABLE ?auto_807 ) ( SURFACE-AT ?auto_798 ?auto_806 ) ( ON ?auto_798 ?auto_808 ) ( CLEAR ?auto_798 ) ( TRUCK-AT ?auto_804 ?auto_802 ) ( not ( = ?auto_797 ?auto_798 ) ) ( not ( = ?auto_797 ?auto_808 ) ) ( not ( = ?auto_798 ?auto_808 ) ) ( not ( = ?auto_801 ?auto_807 ) ) ( not ( = ?auto_797 ?auto_799 ) ) ( not ( = ?auto_797 ?auto_805 ) ) ( not ( = ?auto_799 ?auto_808 ) ) ( not ( = ?auto_803 ?auto_806 ) ) ( not ( = ?auto_800 ?auto_807 ) ) ( not ( = ?auto_805 ?auto_808 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_797 ?auto_798 )
      ( MAKE-1CRATE ?auto_798 ?auto_799 )
      ( MAKE-2CRATE-VERIFY ?auto_797 ?auto_798 ?auto_799 ) )
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
      ?auto_816 - PLACE
      ?auto_817 - HOIST
      ?auto_818 - SURFACE
      ?auto_815 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_813 ?auto_814 ) ( SURFACE-AT ?auto_811 ?auto_814 ) ( CLEAR ?auto_811 ) ( IS-CRATE ?auto_812 ) ( AVAILABLE ?auto_813 ) ( not ( = ?auto_816 ?auto_814 ) ) ( HOIST-AT ?auto_817 ?auto_816 ) ( AVAILABLE ?auto_817 ) ( SURFACE-AT ?auto_812 ?auto_816 ) ( ON ?auto_812 ?auto_818 ) ( CLEAR ?auto_812 ) ( TRUCK-AT ?auto_815 ?auto_814 ) ( not ( = ?auto_811 ?auto_812 ) ) ( not ( = ?auto_811 ?auto_818 ) ) ( not ( = ?auto_812 ?auto_818 ) ) ( not ( = ?auto_813 ?auto_817 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_815 ?auto_814 ?auto_816 )
      ( !LIFT ?auto_817 ?auto_812 ?auto_818 ?auto_816 )
      ( !LOAD ?auto_817 ?auto_812 ?auto_815 ?auto_816 )
      ( !DRIVE ?auto_815 ?auto_816 ?auto_814 )
      ( !UNLOAD ?auto_813 ?auto_812 ?auto_815 ?auto_814 )
      ( !DROP ?auto_813 ?auto_812 ?auto_811 ?auto_814 )
      ( MAKE-1CRATE-VERIFY ?auto_811 ?auto_812 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_823 - SURFACE
      ?auto_824 - SURFACE
      ?auto_825 - SURFACE
      ?auto_826 - SURFACE
    )
    :vars
    (
      ?auto_829 - HOIST
      ?auto_831 - PLACE
      ?auto_830 - PLACE
      ?auto_827 - HOIST
      ?auto_828 - SURFACE
      ?auto_835 - PLACE
      ?auto_833 - HOIST
      ?auto_836 - SURFACE
      ?auto_834 - SURFACE
      ?auto_832 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_829 ?auto_831 ) ( IS-CRATE ?auto_826 ) ( not ( = ?auto_830 ?auto_831 ) ) ( HOIST-AT ?auto_827 ?auto_830 ) ( SURFACE-AT ?auto_826 ?auto_830 ) ( ON ?auto_826 ?auto_828 ) ( CLEAR ?auto_826 ) ( not ( = ?auto_825 ?auto_826 ) ) ( not ( = ?auto_825 ?auto_828 ) ) ( not ( = ?auto_826 ?auto_828 ) ) ( not ( = ?auto_829 ?auto_827 ) ) ( IS-CRATE ?auto_825 ) ( not ( = ?auto_835 ?auto_831 ) ) ( HOIST-AT ?auto_833 ?auto_835 ) ( AVAILABLE ?auto_833 ) ( SURFACE-AT ?auto_825 ?auto_835 ) ( ON ?auto_825 ?auto_836 ) ( CLEAR ?auto_825 ) ( not ( = ?auto_824 ?auto_825 ) ) ( not ( = ?auto_824 ?auto_836 ) ) ( not ( = ?auto_825 ?auto_836 ) ) ( not ( = ?auto_829 ?auto_833 ) ) ( SURFACE-AT ?auto_823 ?auto_831 ) ( CLEAR ?auto_823 ) ( IS-CRATE ?auto_824 ) ( AVAILABLE ?auto_829 ) ( AVAILABLE ?auto_827 ) ( SURFACE-AT ?auto_824 ?auto_830 ) ( ON ?auto_824 ?auto_834 ) ( CLEAR ?auto_824 ) ( TRUCK-AT ?auto_832 ?auto_831 ) ( not ( = ?auto_823 ?auto_824 ) ) ( not ( = ?auto_823 ?auto_834 ) ) ( not ( = ?auto_824 ?auto_834 ) ) ( not ( = ?auto_823 ?auto_825 ) ) ( not ( = ?auto_823 ?auto_836 ) ) ( not ( = ?auto_825 ?auto_834 ) ) ( not ( = ?auto_835 ?auto_830 ) ) ( not ( = ?auto_833 ?auto_827 ) ) ( not ( = ?auto_836 ?auto_834 ) ) ( not ( = ?auto_823 ?auto_826 ) ) ( not ( = ?auto_823 ?auto_828 ) ) ( not ( = ?auto_824 ?auto_826 ) ) ( not ( = ?auto_824 ?auto_828 ) ) ( not ( = ?auto_826 ?auto_836 ) ) ( not ( = ?auto_826 ?auto_834 ) ) ( not ( = ?auto_828 ?auto_836 ) ) ( not ( = ?auto_828 ?auto_834 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_823 ?auto_824 ?auto_825 )
      ( MAKE-1CRATE ?auto_825 ?auto_826 )
      ( MAKE-3CRATE-VERIFY ?auto_823 ?auto_824 ?auto_825 ?auto_826 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_839 - SURFACE
      ?auto_840 - SURFACE
    )
    :vars
    (
      ?auto_841 - HOIST
      ?auto_842 - PLACE
      ?auto_844 - PLACE
      ?auto_845 - HOIST
      ?auto_846 - SURFACE
      ?auto_843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_841 ?auto_842 ) ( SURFACE-AT ?auto_839 ?auto_842 ) ( CLEAR ?auto_839 ) ( IS-CRATE ?auto_840 ) ( AVAILABLE ?auto_841 ) ( not ( = ?auto_844 ?auto_842 ) ) ( HOIST-AT ?auto_845 ?auto_844 ) ( AVAILABLE ?auto_845 ) ( SURFACE-AT ?auto_840 ?auto_844 ) ( ON ?auto_840 ?auto_846 ) ( CLEAR ?auto_840 ) ( TRUCK-AT ?auto_843 ?auto_842 ) ( not ( = ?auto_839 ?auto_840 ) ) ( not ( = ?auto_839 ?auto_846 ) ) ( not ( = ?auto_840 ?auto_846 ) ) ( not ( = ?auto_841 ?auto_845 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_843 ?auto_842 ?auto_844 )
      ( !LIFT ?auto_845 ?auto_840 ?auto_846 ?auto_844 )
      ( !LOAD ?auto_845 ?auto_840 ?auto_843 ?auto_844 )
      ( !DRIVE ?auto_843 ?auto_844 ?auto_842 )
      ( !UNLOAD ?auto_841 ?auto_840 ?auto_843 ?auto_842 )
      ( !DROP ?auto_841 ?auto_840 ?auto_839 ?auto_842 )
      ( MAKE-1CRATE-VERIFY ?auto_839 ?auto_840 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_852 - SURFACE
      ?auto_853 - SURFACE
      ?auto_854 - SURFACE
      ?auto_855 - SURFACE
      ?auto_856 - SURFACE
    )
    :vars
    (
      ?auto_861 - HOIST
      ?auto_858 - PLACE
      ?auto_862 - PLACE
      ?auto_860 - HOIST
      ?auto_859 - SURFACE
      ?auto_863 - SURFACE
      ?auto_864 - PLACE
      ?auto_866 - HOIST
      ?auto_865 - SURFACE
      ?auto_867 - SURFACE
      ?auto_857 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_861 ?auto_858 ) ( IS-CRATE ?auto_856 ) ( not ( = ?auto_862 ?auto_858 ) ) ( HOIST-AT ?auto_860 ?auto_862 ) ( SURFACE-AT ?auto_856 ?auto_862 ) ( ON ?auto_856 ?auto_859 ) ( CLEAR ?auto_856 ) ( not ( = ?auto_855 ?auto_856 ) ) ( not ( = ?auto_855 ?auto_859 ) ) ( not ( = ?auto_856 ?auto_859 ) ) ( not ( = ?auto_861 ?auto_860 ) ) ( IS-CRATE ?auto_855 ) ( SURFACE-AT ?auto_855 ?auto_862 ) ( ON ?auto_855 ?auto_863 ) ( CLEAR ?auto_855 ) ( not ( = ?auto_854 ?auto_855 ) ) ( not ( = ?auto_854 ?auto_863 ) ) ( not ( = ?auto_855 ?auto_863 ) ) ( IS-CRATE ?auto_854 ) ( not ( = ?auto_864 ?auto_858 ) ) ( HOIST-AT ?auto_866 ?auto_864 ) ( AVAILABLE ?auto_866 ) ( SURFACE-AT ?auto_854 ?auto_864 ) ( ON ?auto_854 ?auto_865 ) ( CLEAR ?auto_854 ) ( not ( = ?auto_853 ?auto_854 ) ) ( not ( = ?auto_853 ?auto_865 ) ) ( not ( = ?auto_854 ?auto_865 ) ) ( not ( = ?auto_861 ?auto_866 ) ) ( SURFACE-AT ?auto_852 ?auto_858 ) ( CLEAR ?auto_852 ) ( IS-CRATE ?auto_853 ) ( AVAILABLE ?auto_861 ) ( AVAILABLE ?auto_860 ) ( SURFACE-AT ?auto_853 ?auto_862 ) ( ON ?auto_853 ?auto_867 ) ( CLEAR ?auto_853 ) ( TRUCK-AT ?auto_857 ?auto_858 ) ( not ( = ?auto_852 ?auto_853 ) ) ( not ( = ?auto_852 ?auto_867 ) ) ( not ( = ?auto_853 ?auto_867 ) ) ( not ( = ?auto_852 ?auto_854 ) ) ( not ( = ?auto_852 ?auto_865 ) ) ( not ( = ?auto_854 ?auto_867 ) ) ( not ( = ?auto_864 ?auto_862 ) ) ( not ( = ?auto_866 ?auto_860 ) ) ( not ( = ?auto_865 ?auto_867 ) ) ( not ( = ?auto_852 ?auto_855 ) ) ( not ( = ?auto_852 ?auto_863 ) ) ( not ( = ?auto_853 ?auto_855 ) ) ( not ( = ?auto_853 ?auto_863 ) ) ( not ( = ?auto_855 ?auto_865 ) ) ( not ( = ?auto_855 ?auto_867 ) ) ( not ( = ?auto_863 ?auto_865 ) ) ( not ( = ?auto_863 ?auto_867 ) ) ( not ( = ?auto_852 ?auto_856 ) ) ( not ( = ?auto_852 ?auto_859 ) ) ( not ( = ?auto_853 ?auto_856 ) ) ( not ( = ?auto_853 ?auto_859 ) ) ( not ( = ?auto_854 ?auto_856 ) ) ( not ( = ?auto_854 ?auto_859 ) ) ( not ( = ?auto_856 ?auto_863 ) ) ( not ( = ?auto_856 ?auto_865 ) ) ( not ( = ?auto_856 ?auto_867 ) ) ( not ( = ?auto_859 ?auto_863 ) ) ( not ( = ?auto_859 ?auto_865 ) ) ( not ( = ?auto_859 ?auto_867 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_852 ?auto_853 ?auto_854 ?auto_855 )
      ( MAKE-1CRATE ?auto_855 ?auto_856 )
      ( MAKE-4CRATE-VERIFY ?auto_852 ?auto_853 ?auto_854 ?auto_855 ?auto_856 ) )
  )

)

