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
      ?auto_822 - SURFACE
      ?auto_823 - SURFACE
    )
    :vars
    (
      ?auto_824 - HOIST
      ?auto_825 - PLACE
      ?auto_827 - PLACE
      ?auto_828 - HOIST
      ?auto_829 - SURFACE
      ?auto_826 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_824 ?auto_825 ) ( SURFACE-AT ?auto_823 ?auto_825 ) ( CLEAR ?auto_823 ) ( IS-CRATE ?auto_822 ) ( AVAILABLE ?auto_824 ) ( not ( = ?auto_827 ?auto_825 ) ) ( HOIST-AT ?auto_828 ?auto_827 ) ( AVAILABLE ?auto_828 ) ( SURFACE-AT ?auto_822 ?auto_827 ) ( ON ?auto_822 ?auto_829 ) ( CLEAR ?auto_822 ) ( TRUCK-AT ?auto_826 ?auto_825 ) ( not ( = ?auto_822 ?auto_823 ) ) ( not ( = ?auto_822 ?auto_829 ) ) ( not ( = ?auto_823 ?auto_829 ) ) ( not ( = ?auto_824 ?auto_828 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_826 ?auto_825 ?auto_827 )
      ( !LIFT ?auto_828 ?auto_822 ?auto_829 ?auto_827 )
      ( !LOAD ?auto_828 ?auto_822 ?auto_826 ?auto_827 )
      ( !DRIVE ?auto_826 ?auto_827 ?auto_825 )
      ( !UNLOAD ?auto_824 ?auto_822 ?auto_826 ?auto_825 )
      ( !DROP ?auto_824 ?auto_822 ?auto_823 ?auto_825 )
      ( MAKE-ON-VERIFY ?auto_822 ?auto_823 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_832 - SURFACE
      ?auto_833 - SURFACE
    )
    :vars
    (
      ?auto_834 - HOIST
      ?auto_835 - PLACE
      ?auto_837 - PLACE
      ?auto_838 - HOIST
      ?auto_839 - SURFACE
      ?auto_836 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_834 ?auto_835 ) ( SURFACE-AT ?auto_833 ?auto_835 ) ( CLEAR ?auto_833 ) ( IS-CRATE ?auto_832 ) ( AVAILABLE ?auto_834 ) ( not ( = ?auto_837 ?auto_835 ) ) ( HOIST-AT ?auto_838 ?auto_837 ) ( AVAILABLE ?auto_838 ) ( SURFACE-AT ?auto_832 ?auto_837 ) ( ON ?auto_832 ?auto_839 ) ( CLEAR ?auto_832 ) ( TRUCK-AT ?auto_836 ?auto_835 ) ( not ( = ?auto_832 ?auto_833 ) ) ( not ( = ?auto_832 ?auto_839 ) ) ( not ( = ?auto_833 ?auto_839 ) ) ( not ( = ?auto_834 ?auto_838 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_836 ?auto_835 ?auto_837 )
      ( !LIFT ?auto_838 ?auto_832 ?auto_839 ?auto_837 )
      ( !LOAD ?auto_838 ?auto_832 ?auto_836 ?auto_837 )
      ( !DRIVE ?auto_836 ?auto_837 ?auto_835 )
      ( !UNLOAD ?auto_834 ?auto_832 ?auto_836 ?auto_835 )
      ( !DROP ?auto_834 ?auto_832 ?auto_833 ?auto_835 )
      ( MAKE-ON-VERIFY ?auto_832 ?auto_833 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_842 - SURFACE
      ?auto_843 - SURFACE
    )
    :vars
    (
      ?auto_844 - HOIST
      ?auto_845 - PLACE
      ?auto_847 - PLACE
      ?auto_848 - HOIST
      ?auto_849 - SURFACE
      ?auto_846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_844 ?auto_845 ) ( SURFACE-AT ?auto_843 ?auto_845 ) ( CLEAR ?auto_843 ) ( IS-CRATE ?auto_842 ) ( AVAILABLE ?auto_844 ) ( not ( = ?auto_847 ?auto_845 ) ) ( HOIST-AT ?auto_848 ?auto_847 ) ( AVAILABLE ?auto_848 ) ( SURFACE-AT ?auto_842 ?auto_847 ) ( ON ?auto_842 ?auto_849 ) ( CLEAR ?auto_842 ) ( TRUCK-AT ?auto_846 ?auto_845 ) ( not ( = ?auto_842 ?auto_843 ) ) ( not ( = ?auto_842 ?auto_849 ) ) ( not ( = ?auto_843 ?auto_849 ) ) ( not ( = ?auto_844 ?auto_848 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_846 ?auto_845 ?auto_847 )
      ( !LIFT ?auto_848 ?auto_842 ?auto_849 ?auto_847 )
      ( !LOAD ?auto_848 ?auto_842 ?auto_846 ?auto_847 )
      ( !DRIVE ?auto_846 ?auto_847 ?auto_845 )
      ( !UNLOAD ?auto_844 ?auto_842 ?auto_846 ?auto_845 )
      ( !DROP ?auto_844 ?auto_842 ?auto_843 ?auto_845 )
      ( MAKE-ON-VERIFY ?auto_842 ?auto_843 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_852 - SURFACE
      ?auto_853 - SURFACE
    )
    :vars
    (
      ?auto_854 - HOIST
      ?auto_855 - PLACE
      ?auto_857 - PLACE
      ?auto_858 - HOIST
      ?auto_859 - SURFACE
      ?auto_856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_854 ?auto_855 ) ( SURFACE-AT ?auto_853 ?auto_855 ) ( CLEAR ?auto_853 ) ( IS-CRATE ?auto_852 ) ( AVAILABLE ?auto_854 ) ( not ( = ?auto_857 ?auto_855 ) ) ( HOIST-AT ?auto_858 ?auto_857 ) ( AVAILABLE ?auto_858 ) ( SURFACE-AT ?auto_852 ?auto_857 ) ( ON ?auto_852 ?auto_859 ) ( CLEAR ?auto_852 ) ( TRUCK-AT ?auto_856 ?auto_855 ) ( not ( = ?auto_852 ?auto_853 ) ) ( not ( = ?auto_852 ?auto_859 ) ) ( not ( = ?auto_853 ?auto_859 ) ) ( not ( = ?auto_854 ?auto_858 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_856 ?auto_855 ?auto_857 )
      ( !LIFT ?auto_858 ?auto_852 ?auto_859 ?auto_857 )
      ( !LOAD ?auto_858 ?auto_852 ?auto_856 ?auto_857 )
      ( !DRIVE ?auto_856 ?auto_857 ?auto_855 )
      ( !UNLOAD ?auto_854 ?auto_852 ?auto_856 ?auto_855 )
      ( !DROP ?auto_854 ?auto_852 ?auto_853 ?auto_855 )
      ( MAKE-ON-VERIFY ?auto_852 ?auto_853 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_862 - SURFACE
      ?auto_863 - SURFACE
    )
    :vars
    (
      ?auto_864 - HOIST
      ?auto_865 - PLACE
      ?auto_867 - PLACE
      ?auto_868 - HOIST
      ?auto_869 - SURFACE
      ?auto_866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_864 ?auto_865 ) ( SURFACE-AT ?auto_863 ?auto_865 ) ( CLEAR ?auto_863 ) ( IS-CRATE ?auto_862 ) ( AVAILABLE ?auto_864 ) ( not ( = ?auto_867 ?auto_865 ) ) ( HOIST-AT ?auto_868 ?auto_867 ) ( AVAILABLE ?auto_868 ) ( SURFACE-AT ?auto_862 ?auto_867 ) ( ON ?auto_862 ?auto_869 ) ( CLEAR ?auto_862 ) ( TRUCK-AT ?auto_866 ?auto_865 ) ( not ( = ?auto_862 ?auto_863 ) ) ( not ( = ?auto_862 ?auto_869 ) ) ( not ( = ?auto_863 ?auto_869 ) ) ( not ( = ?auto_864 ?auto_868 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_866 ?auto_865 ?auto_867 )
      ( !LIFT ?auto_868 ?auto_862 ?auto_869 ?auto_867 )
      ( !LOAD ?auto_868 ?auto_862 ?auto_866 ?auto_867 )
      ( !DRIVE ?auto_866 ?auto_867 ?auto_865 )
      ( !UNLOAD ?auto_864 ?auto_862 ?auto_866 ?auto_865 )
      ( !DROP ?auto_864 ?auto_862 ?auto_863 ?auto_865 )
      ( MAKE-ON-VERIFY ?auto_862 ?auto_863 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_872 - SURFACE
      ?auto_873 - SURFACE
    )
    :vars
    (
      ?auto_874 - HOIST
      ?auto_875 - PLACE
      ?auto_877 - PLACE
      ?auto_878 - HOIST
      ?auto_879 - SURFACE
      ?auto_876 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_874 ?auto_875 ) ( SURFACE-AT ?auto_873 ?auto_875 ) ( CLEAR ?auto_873 ) ( IS-CRATE ?auto_872 ) ( AVAILABLE ?auto_874 ) ( not ( = ?auto_877 ?auto_875 ) ) ( HOIST-AT ?auto_878 ?auto_877 ) ( AVAILABLE ?auto_878 ) ( SURFACE-AT ?auto_872 ?auto_877 ) ( ON ?auto_872 ?auto_879 ) ( CLEAR ?auto_872 ) ( TRUCK-AT ?auto_876 ?auto_875 ) ( not ( = ?auto_872 ?auto_873 ) ) ( not ( = ?auto_872 ?auto_879 ) ) ( not ( = ?auto_873 ?auto_879 ) ) ( not ( = ?auto_874 ?auto_878 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_876 ?auto_875 ?auto_877 )
      ( !LIFT ?auto_878 ?auto_872 ?auto_879 ?auto_877 )
      ( !LOAD ?auto_878 ?auto_872 ?auto_876 ?auto_877 )
      ( !DRIVE ?auto_876 ?auto_877 ?auto_875 )
      ( !UNLOAD ?auto_874 ?auto_872 ?auto_876 ?auto_875 )
      ( !DROP ?auto_874 ?auto_872 ?auto_873 ?auto_875 )
      ( MAKE-ON-VERIFY ?auto_872 ?auto_873 ) )
  )

)

