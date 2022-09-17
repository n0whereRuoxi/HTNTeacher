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

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-9CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-10CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-12CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10750 - SURFACE
      ?auto_10751 - SURFACE
    )
    :vars
    (
      ?auto_10752 - HOIST
      ?auto_10753 - PLACE
      ?auto_10755 - PLACE
      ?auto_10756 - HOIST
      ?auto_10757 - SURFACE
      ?auto_10754 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10752 ?auto_10753 ) ( SURFACE-AT ?auto_10750 ?auto_10753 ) ( CLEAR ?auto_10750 ) ( IS-CRATE ?auto_10751 ) ( AVAILABLE ?auto_10752 ) ( not ( = ?auto_10755 ?auto_10753 ) ) ( HOIST-AT ?auto_10756 ?auto_10755 ) ( AVAILABLE ?auto_10756 ) ( SURFACE-AT ?auto_10751 ?auto_10755 ) ( ON ?auto_10751 ?auto_10757 ) ( CLEAR ?auto_10751 ) ( TRUCK-AT ?auto_10754 ?auto_10753 ) ( not ( = ?auto_10750 ?auto_10751 ) ) ( not ( = ?auto_10750 ?auto_10757 ) ) ( not ( = ?auto_10751 ?auto_10757 ) ) ( not ( = ?auto_10752 ?auto_10756 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10754 ?auto_10753 ?auto_10755 )
      ( !LIFT ?auto_10756 ?auto_10751 ?auto_10757 ?auto_10755 )
      ( !LOAD ?auto_10756 ?auto_10751 ?auto_10754 ?auto_10755 )
      ( !DRIVE ?auto_10754 ?auto_10755 ?auto_10753 )
      ( !UNLOAD ?auto_10752 ?auto_10751 ?auto_10754 ?auto_10753 )
      ( !DROP ?auto_10752 ?auto_10751 ?auto_10750 ?auto_10753 )
      ( MAKE-1CRATE-VERIFY ?auto_10750 ?auto_10751 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10771 - SURFACE
      ?auto_10772 - SURFACE
      ?auto_10773 - SURFACE
    )
    :vars
    (
      ?auto_10776 - HOIST
      ?auto_10775 - PLACE
      ?auto_10779 - PLACE
      ?auto_10777 - HOIST
      ?auto_10778 - SURFACE
      ?auto_10780 - PLACE
      ?auto_10781 - HOIST
      ?auto_10782 - SURFACE
      ?auto_10774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10776 ?auto_10775 ) ( IS-CRATE ?auto_10773 ) ( not ( = ?auto_10779 ?auto_10775 ) ) ( HOIST-AT ?auto_10777 ?auto_10779 ) ( AVAILABLE ?auto_10777 ) ( SURFACE-AT ?auto_10773 ?auto_10779 ) ( ON ?auto_10773 ?auto_10778 ) ( CLEAR ?auto_10773 ) ( not ( = ?auto_10772 ?auto_10773 ) ) ( not ( = ?auto_10772 ?auto_10778 ) ) ( not ( = ?auto_10773 ?auto_10778 ) ) ( not ( = ?auto_10776 ?auto_10777 ) ) ( SURFACE-AT ?auto_10771 ?auto_10775 ) ( CLEAR ?auto_10771 ) ( IS-CRATE ?auto_10772 ) ( AVAILABLE ?auto_10776 ) ( not ( = ?auto_10780 ?auto_10775 ) ) ( HOIST-AT ?auto_10781 ?auto_10780 ) ( AVAILABLE ?auto_10781 ) ( SURFACE-AT ?auto_10772 ?auto_10780 ) ( ON ?auto_10772 ?auto_10782 ) ( CLEAR ?auto_10772 ) ( TRUCK-AT ?auto_10774 ?auto_10775 ) ( not ( = ?auto_10771 ?auto_10772 ) ) ( not ( = ?auto_10771 ?auto_10782 ) ) ( not ( = ?auto_10772 ?auto_10782 ) ) ( not ( = ?auto_10776 ?auto_10781 ) ) ( not ( = ?auto_10771 ?auto_10773 ) ) ( not ( = ?auto_10771 ?auto_10778 ) ) ( not ( = ?auto_10773 ?auto_10782 ) ) ( not ( = ?auto_10779 ?auto_10780 ) ) ( not ( = ?auto_10777 ?auto_10781 ) ) ( not ( = ?auto_10778 ?auto_10782 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10771 ?auto_10772 )
      ( MAKE-1CRATE ?auto_10772 ?auto_10773 )
      ( MAKE-2CRATE-VERIFY ?auto_10771 ?auto_10772 ?auto_10773 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10797 - SURFACE
      ?auto_10798 - SURFACE
      ?auto_10799 - SURFACE
      ?auto_10800 - SURFACE
    )
    :vars
    (
      ?auto_10803 - HOIST
      ?auto_10805 - PLACE
      ?auto_10804 - PLACE
      ?auto_10806 - HOIST
      ?auto_10802 - SURFACE
      ?auto_10809 - SURFACE
      ?auto_10810 - PLACE
      ?auto_10807 - HOIST
      ?auto_10808 - SURFACE
      ?auto_10801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10803 ?auto_10805 ) ( IS-CRATE ?auto_10800 ) ( not ( = ?auto_10804 ?auto_10805 ) ) ( HOIST-AT ?auto_10806 ?auto_10804 ) ( SURFACE-AT ?auto_10800 ?auto_10804 ) ( ON ?auto_10800 ?auto_10802 ) ( CLEAR ?auto_10800 ) ( not ( = ?auto_10799 ?auto_10800 ) ) ( not ( = ?auto_10799 ?auto_10802 ) ) ( not ( = ?auto_10800 ?auto_10802 ) ) ( not ( = ?auto_10803 ?auto_10806 ) ) ( IS-CRATE ?auto_10799 ) ( AVAILABLE ?auto_10806 ) ( SURFACE-AT ?auto_10799 ?auto_10804 ) ( ON ?auto_10799 ?auto_10809 ) ( CLEAR ?auto_10799 ) ( not ( = ?auto_10798 ?auto_10799 ) ) ( not ( = ?auto_10798 ?auto_10809 ) ) ( not ( = ?auto_10799 ?auto_10809 ) ) ( SURFACE-AT ?auto_10797 ?auto_10805 ) ( CLEAR ?auto_10797 ) ( IS-CRATE ?auto_10798 ) ( AVAILABLE ?auto_10803 ) ( not ( = ?auto_10810 ?auto_10805 ) ) ( HOIST-AT ?auto_10807 ?auto_10810 ) ( AVAILABLE ?auto_10807 ) ( SURFACE-AT ?auto_10798 ?auto_10810 ) ( ON ?auto_10798 ?auto_10808 ) ( CLEAR ?auto_10798 ) ( TRUCK-AT ?auto_10801 ?auto_10805 ) ( not ( = ?auto_10797 ?auto_10798 ) ) ( not ( = ?auto_10797 ?auto_10808 ) ) ( not ( = ?auto_10798 ?auto_10808 ) ) ( not ( = ?auto_10803 ?auto_10807 ) ) ( not ( = ?auto_10797 ?auto_10799 ) ) ( not ( = ?auto_10797 ?auto_10809 ) ) ( not ( = ?auto_10799 ?auto_10808 ) ) ( not ( = ?auto_10804 ?auto_10810 ) ) ( not ( = ?auto_10806 ?auto_10807 ) ) ( not ( = ?auto_10809 ?auto_10808 ) ) ( not ( = ?auto_10797 ?auto_10800 ) ) ( not ( = ?auto_10797 ?auto_10802 ) ) ( not ( = ?auto_10798 ?auto_10800 ) ) ( not ( = ?auto_10798 ?auto_10802 ) ) ( not ( = ?auto_10800 ?auto_10809 ) ) ( not ( = ?auto_10800 ?auto_10808 ) ) ( not ( = ?auto_10802 ?auto_10809 ) ) ( not ( = ?auto_10802 ?auto_10808 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10797 ?auto_10798 ?auto_10799 )
      ( MAKE-1CRATE ?auto_10799 ?auto_10800 )
      ( MAKE-3CRATE-VERIFY ?auto_10797 ?auto_10798 ?auto_10799 ?auto_10800 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10826 - SURFACE
      ?auto_10827 - SURFACE
      ?auto_10828 - SURFACE
      ?auto_10829 - SURFACE
      ?auto_10830 - SURFACE
    )
    :vars
    (
      ?auto_10836 - HOIST
      ?auto_10833 - PLACE
      ?auto_10835 - PLACE
      ?auto_10831 - HOIST
      ?auto_10832 - SURFACE
      ?auto_10837 - PLACE
      ?auto_10841 - HOIST
      ?auto_10838 - SURFACE
      ?auto_10842 - SURFACE
      ?auto_10843 - PLACE
      ?auto_10840 - HOIST
      ?auto_10839 - SURFACE
      ?auto_10834 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10836 ?auto_10833 ) ( IS-CRATE ?auto_10830 ) ( not ( = ?auto_10835 ?auto_10833 ) ) ( HOIST-AT ?auto_10831 ?auto_10835 ) ( AVAILABLE ?auto_10831 ) ( SURFACE-AT ?auto_10830 ?auto_10835 ) ( ON ?auto_10830 ?auto_10832 ) ( CLEAR ?auto_10830 ) ( not ( = ?auto_10829 ?auto_10830 ) ) ( not ( = ?auto_10829 ?auto_10832 ) ) ( not ( = ?auto_10830 ?auto_10832 ) ) ( not ( = ?auto_10836 ?auto_10831 ) ) ( IS-CRATE ?auto_10829 ) ( not ( = ?auto_10837 ?auto_10833 ) ) ( HOIST-AT ?auto_10841 ?auto_10837 ) ( SURFACE-AT ?auto_10829 ?auto_10837 ) ( ON ?auto_10829 ?auto_10838 ) ( CLEAR ?auto_10829 ) ( not ( = ?auto_10828 ?auto_10829 ) ) ( not ( = ?auto_10828 ?auto_10838 ) ) ( not ( = ?auto_10829 ?auto_10838 ) ) ( not ( = ?auto_10836 ?auto_10841 ) ) ( IS-CRATE ?auto_10828 ) ( AVAILABLE ?auto_10841 ) ( SURFACE-AT ?auto_10828 ?auto_10837 ) ( ON ?auto_10828 ?auto_10842 ) ( CLEAR ?auto_10828 ) ( not ( = ?auto_10827 ?auto_10828 ) ) ( not ( = ?auto_10827 ?auto_10842 ) ) ( not ( = ?auto_10828 ?auto_10842 ) ) ( SURFACE-AT ?auto_10826 ?auto_10833 ) ( CLEAR ?auto_10826 ) ( IS-CRATE ?auto_10827 ) ( AVAILABLE ?auto_10836 ) ( not ( = ?auto_10843 ?auto_10833 ) ) ( HOIST-AT ?auto_10840 ?auto_10843 ) ( AVAILABLE ?auto_10840 ) ( SURFACE-AT ?auto_10827 ?auto_10843 ) ( ON ?auto_10827 ?auto_10839 ) ( CLEAR ?auto_10827 ) ( TRUCK-AT ?auto_10834 ?auto_10833 ) ( not ( = ?auto_10826 ?auto_10827 ) ) ( not ( = ?auto_10826 ?auto_10839 ) ) ( not ( = ?auto_10827 ?auto_10839 ) ) ( not ( = ?auto_10836 ?auto_10840 ) ) ( not ( = ?auto_10826 ?auto_10828 ) ) ( not ( = ?auto_10826 ?auto_10842 ) ) ( not ( = ?auto_10828 ?auto_10839 ) ) ( not ( = ?auto_10837 ?auto_10843 ) ) ( not ( = ?auto_10841 ?auto_10840 ) ) ( not ( = ?auto_10842 ?auto_10839 ) ) ( not ( = ?auto_10826 ?auto_10829 ) ) ( not ( = ?auto_10826 ?auto_10838 ) ) ( not ( = ?auto_10827 ?auto_10829 ) ) ( not ( = ?auto_10827 ?auto_10838 ) ) ( not ( = ?auto_10829 ?auto_10842 ) ) ( not ( = ?auto_10829 ?auto_10839 ) ) ( not ( = ?auto_10838 ?auto_10842 ) ) ( not ( = ?auto_10838 ?auto_10839 ) ) ( not ( = ?auto_10826 ?auto_10830 ) ) ( not ( = ?auto_10826 ?auto_10832 ) ) ( not ( = ?auto_10827 ?auto_10830 ) ) ( not ( = ?auto_10827 ?auto_10832 ) ) ( not ( = ?auto_10828 ?auto_10830 ) ) ( not ( = ?auto_10828 ?auto_10832 ) ) ( not ( = ?auto_10830 ?auto_10838 ) ) ( not ( = ?auto_10830 ?auto_10842 ) ) ( not ( = ?auto_10830 ?auto_10839 ) ) ( not ( = ?auto_10835 ?auto_10837 ) ) ( not ( = ?auto_10835 ?auto_10843 ) ) ( not ( = ?auto_10831 ?auto_10841 ) ) ( not ( = ?auto_10831 ?auto_10840 ) ) ( not ( = ?auto_10832 ?auto_10838 ) ) ( not ( = ?auto_10832 ?auto_10842 ) ) ( not ( = ?auto_10832 ?auto_10839 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_10826 ?auto_10827 ?auto_10828 ?auto_10829 )
      ( MAKE-1CRATE ?auto_10829 ?auto_10830 )
      ( MAKE-4CRATE-VERIFY ?auto_10826 ?auto_10827 ?auto_10828 ?auto_10829 ?auto_10830 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_10860 - SURFACE
      ?auto_10861 - SURFACE
      ?auto_10862 - SURFACE
      ?auto_10863 - SURFACE
      ?auto_10864 - SURFACE
      ?auto_10865 - SURFACE
    )
    :vars
    (
      ?auto_10869 - HOIST
      ?auto_10871 - PLACE
      ?auto_10870 - PLACE
      ?auto_10867 - HOIST
      ?auto_10866 - SURFACE
      ?auto_10875 - PLACE
      ?auto_10878 - HOIST
      ?auto_10876 - SURFACE
      ?auto_10879 - SURFACE
      ?auto_10873 - SURFACE
      ?auto_10874 - PLACE
      ?auto_10872 - HOIST
      ?auto_10877 - SURFACE
      ?auto_10868 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10869 ?auto_10871 ) ( IS-CRATE ?auto_10865 ) ( not ( = ?auto_10870 ?auto_10871 ) ) ( HOIST-AT ?auto_10867 ?auto_10870 ) ( SURFACE-AT ?auto_10865 ?auto_10870 ) ( ON ?auto_10865 ?auto_10866 ) ( CLEAR ?auto_10865 ) ( not ( = ?auto_10864 ?auto_10865 ) ) ( not ( = ?auto_10864 ?auto_10866 ) ) ( not ( = ?auto_10865 ?auto_10866 ) ) ( not ( = ?auto_10869 ?auto_10867 ) ) ( IS-CRATE ?auto_10864 ) ( not ( = ?auto_10875 ?auto_10871 ) ) ( HOIST-AT ?auto_10878 ?auto_10875 ) ( AVAILABLE ?auto_10878 ) ( SURFACE-AT ?auto_10864 ?auto_10875 ) ( ON ?auto_10864 ?auto_10876 ) ( CLEAR ?auto_10864 ) ( not ( = ?auto_10863 ?auto_10864 ) ) ( not ( = ?auto_10863 ?auto_10876 ) ) ( not ( = ?auto_10864 ?auto_10876 ) ) ( not ( = ?auto_10869 ?auto_10878 ) ) ( IS-CRATE ?auto_10863 ) ( SURFACE-AT ?auto_10863 ?auto_10870 ) ( ON ?auto_10863 ?auto_10879 ) ( CLEAR ?auto_10863 ) ( not ( = ?auto_10862 ?auto_10863 ) ) ( not ( = ?auto_10862 ?auto_10879 ) ) ( not ( = ?auto_10863 ?auto_10879 ) ) ( IS-CRATE ?auto_10862 ) ( AVAILABLE ?auto_10867 ) ( SURFACE-AT ?auto_10862 ?auto_10870 ) ( ON ?auto_10862 ?auto_10873 ) ( CLEAR ?auto_10862 ) ( not ( = ?auto_10861 ?auto_10862 ) ) ( not ( = ?auto_10861 ?auto_10873 ) ) ( not ( = ?auto_10862 ?auto_10873 ) ) ( SURFACE-AT ?auto_10860 ?auto_10871 ) ( CLEAR ?auto_10860 ) ( IS-CRATE ?auto_10861 ) ( AVAILABLE ?auto_10869 ) ( not ( = ?auto_10874 ?auto_10871 ) ) ( HOIST-AT ?auto_10872 ?auto_10874 ) ( AVAILABLE ?auto_10872 ) ( SURFACE-AT ?auto_10861 ?auto_10874 ) ( ON ?auto_10861 ?auto_10877 ) ( CLEAR ?auto_10861 ) ( TRUCK-AT ?auto_10868 ?auto_10871 ) ( not ( = ?auto_10860 ?auto_10861 ) ) ( not ( = ?auto_10860 ?auto_10877 ) ) ( not ( = ?auto_10861 ?auto_10877 ) ) ( not ( = ?auto_10869 ?auto_10872 ) ) ( not ( = ?auto_10860 ?auto_10862 ) ) ( not ( = ?auto_10860 ?auto_10873 ) ) ( not ( = ?auto_10862 ?auto_10877 ) ) ( not ( = ?auto_10870 ?auto_10874 ) ) ( not ( = ?auto_10867 ?auto_10872 ) ) ( not ( = ?auto_10873 ?auto_10877 ) ) ( not ( = ?auto_10860 ?auto_10863 ) ) ( not ( = ?auto_10860 ?auto_10879 ) ) ( not ( = ?auto_10861 ?auto_10863 ) ) ( not ( = ?auto_10861 ?auto_10879 ) ) ( not ( = ?auto_10863 ?auto_10873 ) ) ( not ( = ?auto_10863 ?auto_10877 ) ) ( not ( = ?auto_10879 ?auto_10873 ) ) ( not ( = ?auto_10879 ?auto_10877 ) ) ( not ( = ?auto_10860 ?auto_10864 ) ) ( not ( = ?auto_10860 ?auto_10876 ) ) ( not ( = ?auto_10861 ?auto_10864 ) ) ( not ( = ?auto_10861 ?auto_10876 ) ) ( not ( = ?auto_10862 ?auto_10864 ) ) ( not ( = ?auto_10862 ?auto_10876 ) ) ( not ( = ?auto_10864 ?auto_10879 ) ) ( not ( = ?auto_10864 ?auto_10873 ) ) ( not ( = ?auto_10864 ?auto_10877 ) ) ( not ( = ?auto_10875 ?auto_10870 ) ) ( not ( = ?auto_10875 ?auto_10874 ) ) ( not ( = ?auto_10878 ?auto_10867 ) ) ( not ( = ?auto_10878 ?auto_10872 ) ) ( not ( = ?auto_10876 ?auto_10879 ) ) ( not ( = ?auto_10876 ?auto_10873 ) ) ( not ( = ?auto_10876 ?auto_10877 ) ) ( not ( = ?auto_10860 ?auto_10865 ) ) ( not ( = ?auto_10860 ?auto_10866 ) ) ( not ( = ?auto_10861 ?auto_10865 ) ) ( not ( = ?auto_10861 ?auto_10866 ) ) ( not ( = ?auto_10862 ?auto_10865 ) ) ( not ( = ?auto_10862 ?auto_10866 ) ) ( not ( = ?auto_10863 ?auto_10865 ) ) ( not ( = ?auto_10863 ?auto_10866 ) ) ( not ( = ?auto_10865 ?auto_10876 ) ) ( not ( = ?auto_10865 ?auto_10879 ) ) ( not ( = ?auto_10865 ?auto_10873 ) ) ( not ( = ?auto_10865 ?auto_10877 ) ) ( not ( = ?auto_10866 ?auto_10876 ) ) ( not ( = ?auto_10866 ?auto_10879 ) ) ( not ( = ?auto_10866 ?auto_10873 ) ) ( not ( = ?auto_10866 ?auto_10877 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_10860 ?auto_10861 ?auto_10862 ?auto_10863 ?auto_10864 )
      ( MAKE-1CRATE ?auto_10864 ?auto_10865 )
      ( MAKE-5CRATE-VERIFY ?auto_10860 ?auto_10861 ?auto_10862 ?auto_10863 ?auto_10864 ?auto_10865 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_10897 - SURFACE
      ?auto_10898 - SURFACE
      ?auto_10899 - SURFACE
      ?auto_10900 - SURFACE
      ?auto_10901 - SURFACE
      ?auto_10902 - SURFACE
      ?auto_10903 - SURFACE
    )
    :vars
    (
      ?auto_10908 - HOIST
      ?auto_10904 - PLACE
      ?auto_10905 - PLACE
      ?auto_10909 - HOIST
      ?auto_10907 - SURFACE
      ?auto_10911 - PLACE
      ?auto_10914 - HOIST
      ?auto_10910 - SURFACE
      ?auto_10918 - PLACE
      ?auto_10913 - HOIST
      ?auto_10917 - SURFACE
      ?auto_10912 - SURFACE
      ?auto_10915 - SURFACE
      ?auto_10920 - PLACE
      ?auto_10919 - HOIST
      ?auto_10916 - SURFACE
      ?auto_10906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10908 ?auto_10904 ) ( IS-CRATE ?auto_10903 ) ( not ( = ?auto_10905 ?auto_10904 ) ) ( HOIST-AT ?auto_10909 ?auto_10905 ) ( AVAILABLE ?auto_10909 ) ( SURFACE-AT ?auto_10903 ?auto_10905 ) ( ON ?auto_10903 ?auto_10907 ) ( CLEAR ?auto_10903 ) ( not ( = ?auto_10902 ?auto_10903 ) ) ( not ( = ?auto_10902 ?auto_10907 ) ) ( not ( = ?auto_10903 ?auto_10907 ) ) ( not ( = ?auto_10908 ?auto_10909 ) ) ( IS-CRATE ?auto_10902 ) ( not ( = ?auto_10911 ?auto_10904 ) ) ( HOIST-AT ?auto_10914 ?auto_10911 ) ( SURFACE-AT ?auto_10902 ?auto_10911 ) ( ON ?auto_10902 ?auto_10910 ) ( CLEAR ?auto_10902 ) ( not ( = ?auto_10901 ?auto_10902 ) ) ( not ( = ?auto_10901 ?auto_10910 ) ) ( not ( = ?auto_10902 ?auto_10910 ) ) ( not ( = ?auto_10908 ?auto_10914 ) ) ( IS-CRATE ?auto_10901 ) ( not ( = ?auto_10918 ?auto_10904 ) ) ( HOIST-AT ?auto_10913 ?auto_10918 ) ( AVAILABLE ?auto_10913 ) ( SURFACE-AT ?auto_10901 ?auto_10918 ) ( ON ?auto_10901 ?auto_10917 ) ( CLEAR ?auto_10901 ) ( not ( = ?auto_10900 ?auto_10901 ) ) ( not ( = ?auto_10900 ?auto_10917 ) ) ( not ( = ?auto_10901 ?auto_10917 ) ) ( not ( = ?auto_10908 ?auto_10913 ) ) ( IS-CRATE ?auto_10900 ) ( SURFACE-AT ?auto_10900 ?auto_10911 ) ( ON ?auto_10900 ?auto_10912 ) ( CLEAR ?auto_10900 ) ( not ( = ?auto_10899 ?auto_10900 ) ) ( not ( = ?auto_10899 ?auto_10912 ) ) ( not ( = ?auto_10900 ?auto_10912 ) ) ( IS-CRATE ?auto_10899 ) ( AVAILABLE ?auto_10914 ) ( SURFACE-AT ?auto_10899 ?auto_10911 ) ( ON ?auto_10899 ?auto_10915 ) ( CLEAR ?auto_10899 ) ( not ( = ?auto_10898 ?auto_10899 ) ) ( not ( = ?auto_10898 ?auto_10915 ) ) ( not ( = ?auto_10899 ?auto_10915 ) ) ( SURFACE-AT ?auto_10897 ?auto_10904 ) ( CLEAR ?auto_10897 ) ( IS-CRATE ?auto_10898 ) ( AVAILABLE ?auto_10908 ) ( not ( = ?auto_10920 ?auto_10904 ) ) ( HOIST-AT ?auto_10919 ?auto_10920 ) ( AVAILABLE ?auto_10919 ) ( SURFACE-AT ?auto_10898 ?auto_10920 ) ( ON ?auto_10898 ?auto_10916 ) ( CLEAR ?auto_10898 ) ( TRUCK-AT ?auto_10906 ?auto_10904 ) ( not ( = ?auto_10897 ?auto_10898 ) ) ( not ( = ?auto_10897 ?auto_10916 ) ) ( not ( = ?auto_10898 ?auto_10916 ) ) ( not ( = ?auto_10908 ?auto_10919 ) ) ( not ( = ?auto_10897 ?auto_10899 ) ) ( not ( = ?auto_10897 ?auto_10915 ) ) ( not ( = ?auto_10899 ?auto_10916 ) ) ( not ( = ?auto_10911 ?auto_10920 ) ) ( not ( = ?auto_10914 ?auto_10919 ) ) ( not ( = ?auto_10915 ?auto_10916 ) ) ( not ( = ?auto_10897 ?auto_10900 ) ) ( not ( = ?auto_10897 ?auto_10912 ) ) ( not ( = ?auto_10898 ?auto_10900 ) ) ( not ( = ?auto_10898 ?auto_10912 ) ) ( not ( = ?auto_10900 ?auto_10915 ) ) ( not ( = ?auto_10900 ?auto_10916 ) ) ( not ( = ?auto_10912 ?auto_10915 ) ) ( not ( = ?auto_10912 ?auto_10916 ) ) ( not ( = ?auto_10897 ?auto_10901 ) ) ( not ( = ?auto_10897 ?auto_10917 ) ) ( not ( = ?auto_10898 ?auto_10901 ) ) ( not ( = ?auto_10898 ?auto_10917 ) ) ( not ( = ?auto_10899 ?auto_10901 ) ) ( not ( = ?auto_10899 ?auto_10917 ) ) ( not ( = ?auto_10901 ?auto_10912 ) ) ( not ( = ?auto_10901 ?auto_10915 ) ) ( not ( = ?auto_10901 ?auto_10916 ) ) ( not ( = ?auto_10918 ?auto_10911 ) ) ( not ( = ?auto_10918 ?auto_10920 ) ) ( not ( = ?auto_10913 ?auto_10914 ) ) ( not ( = ?auto_10913 ?auto_10919 ) ) ( not ( = ?auto_10917 ?auto_10912 ) ) ( not ( = ?auto_10917 ?auto_10915 ) ) ( not ( = ?auto_10917 ?auto_10916 ) ) ( not ( = ?auto_10897 ?auto_10902 ) ) ( not ( = ?auto_10897 ?auto_10910 ) ) ( not ( = ?auto_10898 ?auto_10902 ) ) ( not ( = ?auto_10898 ?auto_10910 ) ) ( not ( = ?auto_10899 ?auto_10902 ) ) ( not ( = ?auto_10899 ?auto_10910 ) ) ( not ( = ?auto_10900 ?auto_10902 ) ) ( not ( = ?auto_10900 ?auto_10910 ) ) ( not ( = ?auto_10902 ?auto_10917 ) ) ( not ( = ?auto_10902 ?auto_10912 ) ) ( not ( = ?auto_10902 ?auto_10915 ) ) ( not ( = ?auto_10902 ?auto_10916 ) ) ( not ( = ?auto_10910 ?auto_10917 ) ) ( not ( = ?auto_10910 ?auto_10912 ) ) ( not ( = ?auto_10910 ?auto_10915 ) ) ( not ( = ?auto_10910 ?auto_10916 ) ) ( not ( = ?auto_10897 ?auto_10903 ) ) ( not ( = ?auto_10897 ?auto_10907 ) ) ( not ( = ?auto_10898 ?auto_10903 ) ) ( not ( = ?auto_10898 ?auto_10907 ) ) ( not ( = ?auto_10899 ?auto_10903 ) ) ( not ( = ?auto_10899 ?auto_10907 ) ) ( not ( = ?auto_10900 ?auto_10903 ) ) ( not ( = ?auto_10900 ?auto_10907 ) ) ( not ( = ?auto_10901 ?auto_10903 ) ) ( not ( = ?auto_10901 ?auto_10907 ) ) ( not ( = ?auto_10903 ?auto_10910 ) ) ( not ( = ?auto_10903 ?auto_10917 ) ) ( not ( = ?auto_10903 ?auto_10912 ) ) ( not ( = ?auto_10903 ?auto_10915 ) ) ( not ( = ?auto_10903 ?auto_10916 ) ) ( not ( = ?auto_10905 ?auto_10911 ) ) ( not ( = ?auto_10905 ?auto_10918 ) ) ( not ( = ?auto_10905 ?auto_10920 ) ) ( not ( = ?auto_10909 ?auto_10914 ) ) ( not ( = ?auto_10909 ?auto_10913 ) ) ( not ( = ?auto_10909 ?auto_10919 ) ) ( not ( = ?auto_10907 ?auto_10910 ) ) ( not ( = ?auto_10907 ?auto_10917 ) ) ( not ( = ?auto_10907 ?auto_10912 ) ) ( not ( = ?auto_10907 ?auto_10915 ) ) ( not ( = ?auto_10907 ?auto_10916 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_10897 ?auto_10898 ?auto_10899 ?auto_10900 ?auto_10901 ?auto_10902 )
      ( MAKE-1CRATE ?auto_10902 ?auto_10903 )
      ( MAKE-6CRATE-VERIFY ?auto_10897 ?auto_10898 ?auto_10899 ?auto_10900 ?auto_10901 ?auto_10902 ?auto_10903 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_10939 - SURFACE
      ?auto_10940 - SURFACE
      ?auto_10941 - SURFACE
      ?auto_10942 - SURFACE
      ?auto_10943 - SURFACE
      ?auto_10944 - SURFACE
      ?auto_10945 - SURFACE
      ?auto_10946 - SURFACE
    )
    :vars
    (
      ?auto_10949 - HOIST
      ?auto_10948 - PLACE
      ?auto_10947 - PLACE
      ?auto_10952 - HOIST
      ?auto_10951 - SURFACE
      ?auto_10956 - PLACE
      ?auto_10953 - HOIST
      ?auto_10958 - SURFACE
      ?auto_10963 - SURFACE
      ?auto_10959 - PLACE
      ?auto_10960 - HOIST
      ?auto_10955 - SURFACE
      ?auto_10954 - SURFACE
      ?auto_10957 - SURFACE
      ?auto_10964 - PLACE
      ?auto_10962 - HOIST
      ?auto_10961 - SURFACE
      ?auto_10950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10949 ?auto_10948 ) ( IS-CRATE ?auto_10946 ) ( not ( = ?auto_10947 ?auto_10948 ) ) ( HOIST-AT ?auto_10952 ?auto_10947 ) ( SURFACE-AT ?auto_10946 ?auto_10947 ) ( ON ?auto_10946 ?auto_10951 ) ( CLEAR ?auto_10946 ) ( not ( = ?auto_10945 ?auto_10946 ) ) ( not ( = ?auto_10945 ?auto_10951 ) ) ( not ( = ?auto_10946 ?auto_10951 ) ) ( not ( = ?auto_10949 ?auto_10952 ) ) ( IS-CRATE ?auto_10945 ) ( not ( = ?auto_10956 ?auto_10948 ) ) ( HOIST-AT ?auto_10953 ?auto_10956 ) ( AVAILABLE ?auto_10953 ) ( SURFACE-AT ?auto_10945 ?auto_10956 ) ( ON ?auto_10945 ?auto_10958 ) ( CLEAR ?auto_10945 ) ( not ( = ?auto_10944 ?auto_10945 ) ) ( not ( = ?auto_10944 ?auto_10958 ) ) ( not ( = ?auto_10945 ?auto_10958 ) ) ( not ( = ?auto_10949 ?auto_10953 ) ) ( IS-CRATE ?auto_10944 ) ( SURFACE-AT ?auto_10944 ?auto_10947 ) ( ON ?auto_10944 ?auto_10963 ) ( CLEAR ?auto_10944 ) ( not ( = ?auto_10943 ?auto_10944 ) ) ( not ( = ?auto_10943 ?auto_10963 ) ) ( not ( = ?auto_10944 ?auto_10963 ) ) ( IS-CRATE ?auto_10943 ) ( not ( = ?auto_10959 ?auto_10948 ) ) ( HOIST-AT ?auto_10960 ?auto_10959 ) ( AVAILABLE ?auto_10960 ) ( SURFACE-AT ?auto_10943 ?auto_10959 ) ( ON ?auto_10943 ?auto_10955 ) ( CLEAR ?auto_10943 ) ( not ( = ?auto_10942 ?auto_10943 ) ) ( not ( = ?auto_10942 ?auto_10955 ) ) ( not ( = ?auto_10943 ?auto_10955 ) ) ( not ( = ?auto_10949 ?auto_10960 ) ) ( IS-CRATE ?auto_10942 ) ( SURFACE-AT ?auto_10942 ?auto_10947 ) ( ON ?auto_10942 ?auto_10954 ) ( CLEAR ?auto_10942 ) ( not ( = ?auto_10941 ?auto_10942 ) ) ( not ( = ?auto_10941 ?auto_10954 ) ) ( not ( = ?auto_10942 ?auto_10954 ) ) ( IS-CRATE ?auto_10941 ) ( AVAILABLE ?auto_10952 ) ( SURFACE-AT ?auto_10941 ?auto_10947 ) ( ON ?auto_10941 ?auto_10957 ) ( CLEAR ?auto_10941 ) ( not ( = ?auto_10940 ?auto_10941 ) ) ( not ( = ?auto_10940 ?auto_10957 ) ) ( not ( = ?auto_10941 ?auto_10957 ) ) ( SURFACE-AT ?auto_10939 ?auto_10948 ) ( CLEAR ?auto_10939 ) ( IS-CRATE ?auto_10940 ) ( AVAILABLE ?auto_10949 ) ( not ( = ?auto_10964 ?auto_10948 ) ) ( HOIST-AT ?auto_10962 ?auto_10964 ) ( AVAILABLE ?auto_10962 ) ( SURFACE-AT ?auto_10940 ?auto_10964 ) ( ON ?auto_10940 ?auto_10961 ) ( CLEAR ?auto_10940 ) ( TRUCK-AT ?auto_10950 ?auto_10948 ) ( not ( = ?auto_10939 ?auto_10940 ) ) ( not ( = ?auto_10939 ?auto_10961 ) ) ( not ( = ?auto_10940 ?auto_10961 ) ) ( not ( = ?auto_10949 ?auto_10962 ) ) ( not ( = ?auto_10939 ?auto_10941 ) ) ( not ( = ?auto_10939 ?auto_10957 ) ) ( not ( = ?auto_10941 ?auto_10961 ) ) ( not ( = ?auto_10947 ?auto_10964 ) ) ( not ( = ?auto_10952 ?auto_10962 ) ) ( not ( = ?auto_10957 ?auto_10961 ) ) ( not ( = ?auto_10939 ?auto_10942 ) ) ( not ( = ?auto_10939 ?auto_10954 ) ) ( not ( = ?auto_10940 ?auto_10942 ) ) ( not ( = ?auto_10940 ?auto_10954 ) ) ( not ( = ?auto_10942 ?auto_10957 ) ) ( not ( = ?auto_10942 ?auto_10961 ) ) ( not ( = ?auto_10954 ?auto_10957 ) ) ( not ( = ?auto_10954 ?auto_10961 ) ) ( not ( = ?auto_10939 ?auto_10943 ) ) ( not ( = ?auto_10939 ?auto_10955 ) ) ( not ( = ?auto_10940 ?auto_10943 ) ) ( not ( = ?auto_10940 ?auto_10955 ) ) ( not ( = ?auto_10941 ?auto_10943 ) ) ( not ( = ?auto_10941 ?auto_10955 ) ) ( not ( = ?auto_10943 ?auto_10954 ) ) ( not ( = ?auto_10943 ?auto_10957 ) ) ( not ( = ?auto_10943 ?auto_10961 ) ) ( not ( = ?auto_10959 ?auto_10947 ) ) ( not ( = ?auto_10959 ?auto_10964 ) ) ( not ( = ?auto_10960 ?auto_10952 ) ) ( not ( = ?auto_10960 ?auto_10962 ) ) ( not ( = ?auto_10955 ?auto_10954 ) ) ( not ( = ?auto_10955 ?auto_10957 ) ) ( not ( = ?auto_10955 ?auto_10961 ) ) ( not ( = ?auto_10939 ?auto_10944 ) ) ( not ( = ?auto_10939 ?auto_10963 ) ) ( not ( = ?auto_10940 ?auto_10944 ) ) ( not ( = ?auto_10940 ?auto_10963 ) ) ( not ( = ?auto_10941 ?auto_10944 ) ) ( not ( = ?auto_10941 ?auto_10963 ) ) ( not ( = ?auto_10942 ?auto_10944 ) ) ( not ( = ?auto_10942 ?auto_10963 ) ) ( not ( = ?auto_10944 ?auto_10955 ) ) ( not ( = ?auto_10944 ?auto_10954 ) ) ( not ( = ?auto_10944 ?auto_10957 ) ) ( not ( = ?auto_10944 ?auto_10961 ) ) ( not ( = ?auto_10963 ?auto_10955 ) ) ( not ( = ?auto_10963 ?auto_10954 ) ) ( not ( = ?auto_10963 ?auto_10957 ) ) ( not ( = ?auto_10963 ?auto_10961 ) ) ( not ( = ?auto_10939 ?auto_10945 ) ) ( not ( = ?auto_10939 ?auto_10958 ) ) ( not ( = ?auto_10940 ?auto_10945 ) ) ( not ( = ?auto_10940 ?auto_10958 ) ) ( not ( = ?auto_10941 ?auto_10945 ) ) ( not ( = ?auto_10941 ?auto_10958 ) ) ( not ( = ?auto_10942 ?auto_10945 ) ) ( not ( = ?auto_10942 ?auto_10958 ) ) ( not ( = ?auto_10943 ?auto_10945 ) ) ( not ( = ?auto_10943 ?auto_10958 ) ) ( not ( = ?auto_10945 ?auto_10963 ) ) ( not ( = ?auto_10945 ?auto_10955 ) ) ( not ( = ?auto_10945 ?auto_10954 ) ) ( not ( = ?auto_10945 ?auto_10957 ) ) ( not ( = ?auto_10945 ?auto_10961 ) ) ( not ( = ?auto_10956 ?auto_10947 ) ) ( not ( = ?auto_10956 ?auto_10959 ) ) ( not ( = ?auto_10956 ?auto_10964 ) ) ( not ( = ?auto_10953 ?auto_10952 ) ) ( not ( = ?auto_10953 ?auto_10960 ) ) ( not ( = ?auto_10953 ?auto_10962 ) ) ( not ( = ?auto_10958 ?auto_10963 ) ) ( not ( = ?auto_10958 ?auto_10955 ) ) ( not ( = ?auto_10958 ?auto_10954 ) ) ( not ( = ?auto_10958 ?auto_10957 ) ) ( not ( = ?auto_10958 ?auto_10961 ) ) ( not ( = ?auto_10939 ?auto_10946 ) ) ( not ( = ?auto_10939 ?auto_10951 ) ) ( not ( = ?auto_10940 ?auto_10946 ) ) ( not ( = ?auto_10940 ?auto_10951 ) ) ( not ( = ?auto_10941 ?auto_10946 ) ) ( not ( = ?auto_10941 ?auto_10951 ) ) ( not ( = ?auto_10942 ?auto_10946 ) ) ( not ( = ?auto_10942 ?auto_10951 ) ) ( not ( = ?auto_10943 ?auto_10946 ) ) ( not ( = ?auto_10943 ?auto_10951 ) ) ( not ( = ?auto_10944 ?auto_10946 ) ) ( not ( = ?auto_10944 ?auto_10951 ) ) ( not ( = ?auto_10946 ?auto_10958 ) ) ( not ( = ?auto_10946 ?auto_10963 ) ) ( not ( = ?auto_10946 ?auto_10955 ) ) ( not ( = ?auto_10946 ?auto_10954 ) ) ( not ( = ?auto_10946 ?auto_10957 ) ) ( not ( = ?auto_10946 ?auto_10961 ) ) ( not ( = ?auto_10951 ?auto_10958 ) ) ( not ( = ?auto_10951 ?auto_10963 ) ) ( not ( = ?auto_10951 ?auto_10955 ) ) ( not ( = ?auto_10951 ?auto_10954 ) ) ( not ( = ?auto_10951 ?auto_10957 ) ) ( not ( = ?auto_10951 ?auto_10961 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_10939 ?auto_10940 ?auto_10941 ?auto_10942 ?auto_10943 ?auto_10944 ?auto_10945 )
      ( MAKE-1CRATE ?auto_10945 ?auto_10946 )
      ( MAKE-7CRATE-VERIFY ?auto_10939 ?auto_10940 ?auto_10941 ?auto_10942 ?auto_10943 ?auto_10944 ?auto_10945 ?auto_10946 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_10984 - SURFACE
      ?auto_10985 - SURFACE
      ?auto_10986 - SURFACE
      ?auto_10987 - SURFACE
      ?auto_10988 - SURFACE
      ?auto_10989 - SURFACE
      ?auto_10990 - SURFACE
      ?auto_10991 - SURFACE
      ?auto_10992 - SURFACE
    )
    :vars
    (
      ?auto_10998 - HOIST
      ?auto_10997 - PLACE
      ?auto_10993 - PLACE
      ?auto_10995 - HOIST
      ?auto_10994 - SURFACE
      ?auto_11000 - PLACE
      ?auto_11007 - HOIST
      ?auto_11002 - SURFACE
      ?auto_11004 - SURFACE
      ?auto_11009 - SURFACE
      ?auto_11011 - PLACE
      ?auto_11001 - HOIST
      ?auto_11003 - SURFACE
      ?auto_11008 - SURFACE
      ?auto_10999 - SURFACE
      ?auto_11006 - PLACE
      ?auto_11010 - HOIST
      ?auto_11005 - SURFACE
      ?auto_10996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10998 ?auto_10997 ) ( IS-CRATE ?auto_10992 ) ( not ( = ?auto_10993 ?auto_10997 ) ) ( HOIST-AT ?auto_10995 ?auto_10993 ) ( SURFACE-AT ?auto_10992 ?auto_10993 ) ( ON ?auto_10992 ?auto_10994 ) ( CLEAR ?auto_10992 ) ( not ( = ?auto_10991 ?auto_10992 ) ) ( not ( = ?auto_10991 ?auto_10994 ) ) ( not ( = ?auto_10992 ?auto_10994 ) ) ( not ( = ?auto_10998 ?auto_10995 ) ) ( IS-CRATE ?auto_10991 ) ( not ( = ?auto_11000 ?auto_10997 ) ) ( HOIST-AT ?auto_11007 ?auto_11000 ) ( SURFACE-AT ?auto_10991 ?auto_11000 ) ( ON ?auto_10991 ?auto_11002 ) ( CLEAR ?auto_10991 ) ( not ( = ?auto_10990 ?auto_10991 ) ) ( not ( = ?auto_10990 ?auto_11002 ) ) ( not ( = ?auto_10991 ?auto_11002 ) ) ( not ( = ?auto_10998 ?auto_11007 ) ) ( IS-CRATE ?auto_10990 ) ( AVAILABLE ?auto_10995 ) ( SURFACE-AT ?auto_10990 ?auto_10993 ) ( ON ?auto_10990 ?auto_11004 ) ( CLEAR ?auto_10990 ) ( not ( = ?auto_10989 ?auto_10990 ) ) ( not ( = ?auto_10989 ?auto_11004 ) ) ( not ( = ?auto_10990 ?auto_11004 ) ) ( IS-CRATE ?auto_10989 ) ( SURFACE-AT ?auto_10989 ?auto_11000 ) ( ON ?auto_10989 ?auto_11009 ) ( CLEAR ?auto_10989 ) ( not ( = ?auto_10988 ?auto_10989 ) ) ( not ( = ?auto_10988 ?auto_11009 ) ) ( not ( = ?auto_10989 ?auto_11009 ) ) ( IS-CRATE ?auto_10988 ) ( not ( = ?auto_11011 ?auto_10997 ) ) ( HOIST-AT ?auto_11001 ?auto_11011 ) ( AVAILABLE ?auto_11001 ) ( SURFACE-AT ?auto_10988 ?auto_11011 ) ( ON ?auto_10988 ?auto_11003 ) ( CLEAR ?auto_10988 ) ( not ( = ?auto_10987 ?auto_10988 ) ) ( not ( = ?auto_10987 ?auto_11003 ) ) ( not ( = ?auto_10988 ?auto_11003 ) ) ( not ( = ?auto_10998 ?auto_11001 ) ) ( IS-CRATE ?auto_10987 ) ( SURFACE-AT ?auto_10987 ?auto_11000 ) ( ON ?auto_10987 ?auto_11008 ) ( CLEAR ?auto_10987 ) ( not ( = ?auto_10986 ?auto_10987 ) ) ( not ( = ?auto_10986 ?auto_11008 ) ) ( not ( = ?auto_10987 ?auto_11008 ) ) ( IS-CRATE ?auto_10986 ) ( AVAILABLE ?auto_11007 ) ( SURFACE-AT ?auto_10986 ?auto_11000 ) ( ON ?auto_10986 ?auto_10999 ) ( CLEAR ?auto_10986 ) ( not ( = ?auto_10985 ?auto_10986 ) ) ( not ( = ?auto_10985 ?auto_10999 ) ) ( not ( = ?auto_10986 ?auto_10999 ) ) ( SURFACE-AT ?auto_10984 ?auto_10997 ) ( CLEAR ?auto_10984 ) ( IS-CRATE ?auto_10985 ) ( AVAILABLE ?auto_10998 ) ( not ( = ?auto_11006 ?auto_10997 ) ) ( HOIST-AT ?auto_11010 ?auto_11006 ) ( AVAILABLE ?auto_11010 ) ( SURFACE-AT ?auto_10985 ?auto_11006 ) ( ON ?auto_10985 ?auto_11005 ) ( CLEAR ?auto_10985 ) ( TRUCK-AT ?auto_10996 ?auto_10997 ) ( not ( = ?auto_10984 ?auto_10985 ) ) ( not ( = ?auto_10984 ?auto_11005 ) ) ( not ( = ?auto_10985 ?auto_11005 ) ) ( not ( = ?auto_10998 ?auto_11010 ) ) ( not ( = ?auto_10984 ?auto_10986 ) ) ( not ( = ?auto_10984 ?auto_10999 ) ) ( not ( = ?auto_10986 ?auto_11005 ) ) ( not ( = ?auto_11000 ?auto_11006 ) ) ( not ( = ?auto_11007 ?auto_11010 ) ) ( not ( = ?auto_10999 ?auto_11005 ) ) ( not ( = ?auto_10984 ?auto_10987 ) ) ( not ( = ?auto_10984 ?auto_11008 ) ) ( not ( = ?auto_10985 ?auto_10987 ) ) ( not ( = ?auto_10985 ?auto_11008 ) ) ( not ( = ?auto_10987 ?auto_10999 ) ) ( not ( = ?auto_10987 ?auto_11005 ) ) ( not ( = ?auto_11008 ?auto_10999 ) ) ( not ( = ?auto_11008 ?auto_11005 ) ) ( not ( = ?auto_10984 ?auto_10988 ) ) ( not ( = ?auto_10984 ?auto_11003 ) ) ( not ( = ?auto_10985 ?auto_10988 ) ) ( not ( = ?auto_10985 ?auto_11003 ) ) ( not ( = ?auto_10986 ?auto_10988 ) ) ( not ( = ?auto_10986 ?auto_11003 ) ) ( not ( = ?auto_10988 ?auto_11008 ) ) ( not ( = ?auto_10988 ?auto_10999 ) ) ( not ( = ?auto_10988 ?auto_11005 ) ) ( not ( = ?auto_11011 ?auto_11000 ) ) ( not ( = ?auto_11011 ?auto_11006 ) ) ( not ( = ?auto_11001 ?auto_11007 ) ) ( not ( = ?auto_11001 ?auto_11010 ) ) ( not ( = ?auto_11003 ?auto_11008 ) ) ( not ( = ?auto_11003 ?auto_10999 ) ) ( not ( = ?auto_11003 ?auto_11005 ) ) ( not ( = ?auto_10984 ?auto_10989 ) ) ( not ( = ?auto_10984 ?auto_11009 ) ) ( not ( = ?auto_10985 ?auto_10989 ) ) ( not ( = ?auto_10985 ?auto_11009 ) ) ( not ( = ?auto_10986 ?auto_10989 ) ) ( not ( = ?auto_10986 ?auto_11009 ) ) ( not ( = ?auto_10987 ?auto_10989 ) ) ( not ( = ?auto_10987 ?auto_11009 ) ) ( not ( = ?auto_10989 ?auto_11003 ) ) ( not ( = ?auto_10989 ?auto_11008 ) ) ( not ( = ?auto_10989 ?auto_10999 ) ) ( not ( = ?auto_10989 ?auto_11005 ) ) ( not ( = ?auto_11009 ?auto_11003 ) ) ( not ( = ?auto_11009 ?auto_11008 ) ) ( not ( = ?auto_11009 ?auto_10999 ) ) ( not ( = ?auto_11009 ?auto_11005 ) ) ( not ( = ?auto_10984 ?auto_10990 ) ) ( not ( = ?auto_10984 ?auto_11004 ) ) ( not ( = ?auto_10985 ?auto_10990 ) ) ( not ( = ?auto_10985 ?auto_11004 ) ) ( not ( = ?auto_10986 ?auto_10990 ) ) ( not ( = ?auto_10986 ?auto_11004 ) ) ( not ( = ?auto_10987 ?auto_10990 ) ) ( not ( = ?auto_10987 ?auto_11004 ) ) ( not ( = ?auto_10988 ?auto_10990 ) ) ( not ( = ?auto_10988 ?auto_11004 ) ) ( not ( = ?auto_10990 ?auto_11009 ) ) ( not ( = ?auto_10990 ?auto_11003 ) ) ( not ( = ?auto_10990 ?auto_11008 ) ) ( not ( = ?auto_10990 ?auto_10999 ) ) ( not ( = ?auto_10990 ?auto_11005 ) ) ( not ( = ?auto_10993 ?auto_11000 ) ) ( not ( = ?auto_10993 ?auto_11011 ) ) ( not ( = ?auto_10993 ?auto_11006 ) ) ( not ( = ?auto_10995 ?auto_11007 ) ) ( not ( = ?auto_10995 ?auto_11001 ) ) ( not ( = ?auto_10995 ?auto_11010 ) ) ( not ( = ?auto_11004 ?auto_11009 ) ) ( not ( = ?auto_11004 ?auto_11003 ) ) ( not ( = ?auto_11004 ?auto_11008 ) ) ( not ( = ?auto_11004 ?auto_10999 ) ) ( not ( = ?auto_11004 ?auto_11005 ) ) ( not ( = ?auto_10984 ?auto_10991 ) ) ( not ( = ?auto_10984 ?auto_11002 ) ) ( not ( = ?auto_10985 ?auto_10991 ) ) ( not ( = ?auto_10985 ?auto_11002 ) ) ( not ( = ?auto_10986 ?auto_10991 ) ) ( not ( = ?auto_10986 ?auto_11002 ) ) ( not ( = ?auto_10987 ?auto_10991 ) ) ( not ( = ?auto_10987 ?auto_11002 ) ) ( not ( = ?auto_10988 ?auto_10991 ) ) ( not ( = ?auto_10988 ?auto_11002 ) ) ( not ( = ?auto_10989 ?auto_10991 ) ) ( not ( = ?auto_10989 ?auto_11002 ) ) ( not ( = ?auto_10991 ?auto_11004 ) ) ( not ( = ?auto_10991 ?auto_11009 ) ) ( not ( = ?auto_10991 ?auto_11003 ) ) ( not ( = ?auto_10991 ?auto_11008 ) ) ( not ( = ?auto_10991 ?auto_10999 ) ) ( not ( = ?auto_10991 ?auto_11005 ) ) ( not ( = ?auto_11002 ?auto_11004 ) ) ( not ( = ?auto_11002 ?auto_11009 ) ) ( not ( = ?auto_11002 ?auto_11003 ) ) ( not ( = ?auto_11002 ?auto_11008 ) ) ( not ( = ?auto_11002 ?auto_10999 ) ) ( not ( = ?auto_11002 ?auto_11005 ) ) ( not ( = ?auto_10984 ?auto_10992 ) ) ( not ( = ?auto_10984 ?auto_10994 ) ) ( not ( = ?auto_10985 ?auto_10992 ) ) ( not ( = ?auto_10985 ?auto_10994 ) ) ( not ( = ?auto_10986 ?auto_10992 ) ) ( not ( = ?auto_10986 ?auto_10994 ) ) ( not ( = ?auto_10987 ?auto_10992 ) ) ( not ( = ?auto_10987 ?auto_10994 ) ) ( not ( = ?auto_10988 ?auto_10992 ) ) ( not ( = ?auto_10988 ?auto_10994 ) ) ( not ( = ?auto_10989 ?auto_10992 ) ) ( not ( = ?auto_10989 ?auto_10994 ) ) ( not ( = ?auto_10990 ?auto_10992 ) ) ( not ( = ?auto_10990 ?auto_10994 ) ) ( not ( = ?auto_10992 ?auto_11002 ) ) ( not ( = ?auto_10992 ?auto_11004 ) ) ( not ( = ?auto_10992 ?auto_11009 ) ) ( not ( = ?auto_10992 ?auto_11003 ) ) ( not ( = ?auto_10992 ?auto_11008 ) ) ( not ( = ?auto_10992 ?auto_10999 ) ) ( not ( = ?auto_10992 ?auto_11005 ) ) ( not ( = ?auto_10994 ?auto_11002 ) ) ( not ( = ?auto_10994 ?auto_11004 ) ) ( not ( = ?auto_10994 ?auto_11009 ) ) ( not ( = ?auto_10994 ?auto_11003 ) ) ( not ( = ?auto_10994 ?auto_11008 ) ) ( not ( = ?auto_10994 ?auto_10999 ) ) ( not ( = ?auto_10994 ?auto_11005 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_10984 ?auto_10985 ?auto_10986 ?auto_10987 ?auto_10988 ?auto_10989 ?auto_10990 ?auto_10991 )
      ( MAKE-1CRATE ?auto_10991 ?auto_10992 )
      ( MAKE-8CRATE-VERIFY ?auto_10984 ?auto_10985 ?auto_10986 ?auto_10987 ?auto_10988 ?auto_10989 ?auto_10990 ?auto_10991 ?auto_10992 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_11032 - SURFACE
      ?auto_11033 - SURFACE
      ?auto_11034 - SURFACE
      ?auto_11035 - SURFACE
      ?auto_11036 - SURFACE
      ?auto_11037 - SURFACE
      ?auto_11038 - SURFACE
      ?auto_11039 - SURFACE
      ?auto_11040 - SURFACE
      ?auto_11041 - SURFACE
    )
    :vars
    (
      ?auto_11044 - HOIST
      ?auto_11046 - PLACE
      ?auto_11045 - PLACE
      ?auto_11047 - HOIST
      ?auto_11043 - SURFACE
      ?auto_11055 - PLACE
      ?auto_11048 - HOIST
      ?auto_11054 - SURFACE
      ?auto_11060 - PLACE
      ?auto_11059 - HOIST
      ?auto_11052 - SURFACE
      ?auto_11056 - SURFACE
      ?auto_11049 - SURFACE
      ?auto_11053 - SURFACE
      ?auto_11061 - SURFACE
      ?auto_11057 - SURFACE
      ?auto_11051 - PLACE
      ?auto_11058 - HOIST
      ?auto_11050 - SURFACE
      ?auto_11042 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11044 ?auto_11046 ) ( IS-CRATE ?auto_11041 ) ( not ( = ?auto_11045 ?auto_11046 ) ) ( HOIST-AT ?auto_11047 ?auto_11045 ) ( SURFACE-AT ?auto_11041 ?auto_11045 ) ( ON ?auto_11041 ?auto_11043 ) ( CLEAR ?auto_11041 ) ( not ( = ?auto_11040 ?auto_11041 ) ) ( not ( = ?auto_11040 ?auto_11043 ) ) ( not ( = ?auto_11041 ?auto_11043 ) ) ( not ( = ?auto_11044 ?auto_11047 ) ) ( IS-CRATE ?auto_11040 ) ( not ( = ?auto_11055 ?auto_11046 ) ) ( HOIST-AT ?auto_11048 ?auto_11055 ) ( SURFACE-AT ?auto_11040 ?auto_11055 ) ( ON ?auto_11040 ?auto_11054 ) ( CLEAR ?auto_11040 ) ( not ( = ?auto_11039 ?auto_11040 ) ) ( not ( = ?auto_11039 ?auto_11054 ) ) ( not ( = ?auto_11040 ?auto_11054 ) ) ( not ( = ?auto_11044 ?auto_11048 ) ) ( IS-CRATE ?auto_11039 ) ( not ( = ?auto_11060 ?auto_11046 ) ) ( HOIST-AT ?auto_11059 ?auto_11060 ) ( SURFACE-AT ?auto_11039 ?auto_11060 ) ( ON ?auto_11039 ?auto_11052 ) ( CLEAR ?auto_11039 ) ( not ( = ?auto_11038 ?auto_11039 ) ) ( not ( = ?auto_11038 ?auto_11052 ) ) ( not ( = ?auto_11039 ?auto_11052 ) ) ( not ( = ?auto_11044 ?auto_11059 ) ) ( IS-CRATE ?auto_11038 ) ( AVAILABLE ?auto_11048 ) ( SURFACE-AT ?auto_11038 ?auto_11055 ) ( ON ?auto_11038 ?auto_11056 ) ( CLEAR ?auto_11038 ) ( not ( = ?auto_11037 ?auto_11038 ) ) ( not ( = ?auto_11037 ?auto_11056 ) ) ( not ( = ?auto_11038 ?auto_11056 ) ) ( IS-CRATE ?auto_11037 ) ( SURFACE-AT ?auto_11037 ?auto_11060 ) ( ON ?auto_11037 ?auto_11049 ) ( CLEAR ?auto_11037 ) ( not ( = ?auto_11036 ?auto_11037 ) ) ( not ( = ?auto_11036 ?auto_11049 ) ) ( not ( = ?auto_11037 ?auto_11049 ) ) ( IS-CRATE ?auto_11036 ) ( AVAILABLE ?auto_11047 ) ( SURFACE-AT ?auto_11036 ?auto_11045 ) ( ON ?auto_11036 ?auto_11053 ) ( CLEAR ?auto_11036 ) ( not ( = ?auto_11035 ?auto_11036 ) ) ( not ( = ?auto_11035 ?auto_11053 ) ) ( not ( = ?auto_11036 ?auto_11053 ) ) ( IS-CRATE ?auto_11035 ) ( SURFACE-AT ?auto_11035 ?auto_11060 ) ( ON ?auto_11035 ?auto_11061 ) ( CLEAR ?auto_11035 ) ( not ( = ?auto_11034 ?auto_11035 ) ) ( not ( = ?auto_11034 ?auto_11061 ) ) ( not ( = ?auto_11035 ?auto_11061 ) ) ( IS-CRATE ?auto_11034 ) ( AVAILABLE ?auto_11059 ) ( SURFACE-AT ?auto_11034 ?auto_11060 ) ( ON ?auto_11034 ?auto_11057 ) ( CLEAR ?auto_11034 ) ( not ( = ?auto_11033 ?auto_11034 ) ) ( not ( = ?auto_11033 ?auto_11057 ) ) ( not ( = ?auto_11034 ?auto_11057 ) ) ( SURFACE-AT ?auto_11032 ?auto_11046 ) ( CLEAR ?auto_11032 ) ( IS-CRATE ?auto_11033 ) ( AVAILABLE ?auto_11044 ) ( not ( = ?auto_11051 ?auto_11046 ) ) ( HOIST-AT ?auto_11058 ?auto_11051 ) ( AVAILABLE ?auto_11058 ) ( SURFACE-AT ?auto_11033 ?auto_11051 ) ( ON ?auto_11033 ?auto_11050 ) ( CLEAR ?auto_11033 ) ( TRUCK-AT ?auto_11042 ?auto_11046 ) ( not ( = ?auto_11032 ?auto_11033 ) ) ( not ( = ?auto_11032 ?auto_11050 ) ) ( not ( = ?auto_11033 ?auto_11050 ) ) ( not ( = ?auto_11044 ?auto_11058 ) ) ( not ( = ?auto_11032 ?auto_11034 ) ) ( not ( = ?auto_11032 ?auto_11057 ) ) ( not ( = ?auto_11034 ?auto_11050 ) ) ( not ( = ?auto_11060 ?auto_11051 ) ) ( not ( = ?auto_11059 ?auto_11058 ) ) ( not ( = ?auto_11057 ?auto_11050 ) ) ( not ( = ?auto_11032 ?auto_11035 ) ) ( not ( = ?auto_11032 ?auto_11061 ) ) ( not ( = ?auto_11033 ?auto_11035 ) ) ( not ( = ?auto_11033 ?auto_11061 ) ) ( not ( = ?auto_11035 ?auto_11057 ) ) ( not ( = ?auto_11035 ?auto_11050 ) ) ( not ( = ?auto_11061 ?auto_11057 ) ) ( not ( = ?auto_11061 ?auto_11050 ) ) ( not ( = ?auto_11032 ?auto_11036 ) ) ( not ( = ?auto_11032 ?auto_11053 ) ) ( not ( = ?auto_11033 ?auto_11036 ) ) ( not ( = ?auto_11033 ?auto_11053 ) ) ( not ( = ?auto_11034 ?auto_11036 ) ) ( not ( = ?auto_11034 ?auto_11053 ) ) ( not ( = ?auto_11036 ?auto_11061 ) ) ( not ( = ?auto_11036 ?auto_11057 ) ) ( not ( = ?auto_11036 ?auto_11050 ) ) ( not ( = ?auto_11045 ?auto_11060 ) ) ( not ( = ?auto_11045 ?auto_11051 ) ) ( not ( = ?auto_11047 ?auto_11059 ) ) ( not ( = ?auto_11047 ?auto_11058 ) ) ( not ( = ?auto_11053 ?auto_11061 ) ) ( not ( = ?auto_11053 ?auto_11057 ) ) ( not ( = ?auto_11053 ?auto_11050 ) ) ( not ( = ?auto_11032 ?auto_11037 ) ) ( not ( = ?auto_11032 ?auto_11049 ) ) ( not ( = ?auto_11033 ?auto_11037 ) ) ( not ( = ?auto_11033 ?auto_11049 ) ) ( not ( = ?auto_11034 ?auto_11037 ) ) ( not ( = ?auto_11034 ?auto_11049 ) ) ( not ( = ?auto_11035 ?auto_11037 ) ) ( not ( = ?auto_11035 ?auto_11049 ) ) ( not ( = ?auto_11037 ?auto_11053 ) ) ( not ( = ?auto_11037 ?auto_11061 ) ) ( not ( = ?auto_11037 ?auto_11057 ) ) ( not ( = ?auto_11037 ?auto_11050 ) ) ( not ( = ?auto_11049 ?auto_11053 ) ) ( not ( = ?auto_11049 ?auto_11061 ) ) ( not ( = ?auto_11049 ?auto_11057 ) ) ( not ( = ?auto_11049 ?auto_11050 ) ) ( not ( = ?auto_11032 ?auto_11038 ) ) ( not ( = ?auto_11032 ?auto_11056 ) ) ( not ( = ?auto_11033 ?auto_11038 ) ) ( not ( = ?auto_11033 ?auto_11056 ) ) ( not ( = ?auto_11034 ?auto_11038 ) ) ( not ( = ?auto_11034 ?auto_11056 ) ) ( not ( = ?auto_11035 ?auto_11038 ) ) ( not ( = ?auto_11035 ?auto_11056 ) ) ( not ( = ?auto_11036 ?auto_11038 ) ) ( not ( = ?auto_11036 ?auto_11056 ) ) ( not ( = ?auto_11038 ?auto_11049 ) ) ( not ( = ?auto_11038 ?auto_11053 ) ) ( not ( = ?auto_11038 ?auto_11061 ) ) ( not ( = ?auto_11038 ?auto_11057 ) ) ( not ( = ?auto_11038 ?auto_11050 ) ) ( not ( = ?auto_11055 ?auto_11060 ) ) ( not ( = ?auto_11055 ?auto_11045 ) ) ( not ( = ?auto_11055 ?auto_11051 ) ) ( not ( = ?auto_11048 ?auto_11059 ) ) ( not ( = ?auto_11048 ?auto_11047 ) ) ( not ( = ?auto_11048 ?auto_11058 ) ) ( not ( = ?auto_11056 ?auto_11049 ) ) ( not ( = ?auto_11056 ?auto_11053 ) ) ( not ( = ?auto_11056 ?auto_11061 ) ) ( not ( = ?auto_11056 ?auto_11057 ) ) ( not ( = ?auto_11056 ?auto_11050 ) ) ( not ( = ?auto_11032 ?auto_11039 ) ) ( not ( = ?auto_11032 ?auto_11052 ) ) ( not ( = ?auto_11033 ?auto_11039 ) ) ( not ( = ?auto_11033 ?auto_11052 ) ) ( not ( = ?auto_11034 ?auto_11039 ) ) ( not ( = ?auto_11034 ?auto_11052 ) ) ( not ( = ?auto_11035 ?auto_11039 ) ) ( not ( = ?auto_11035 ?auto_11052 ) ) ( not ( = ?auto_11036 ?auto_11039 ) ) ( not ( = ?auto_11036 ?auto_11052 ) ) ( not ( = ?auto_11037 ?auto_11039 ) ) ( not ( = ?auto_11037 ?auto_11052 ) ) ( not ( = ?auto_11039 ?auto_11056 ) ) ( not ( = ?auto_11039 ?auto_11049 ) ) ( not ( = ?auto_11039 ?auto_11053 ) ) ( not ( = ?auto_11039 ?auto_11061 ) ) ( not ( = ?auto_11039 ?auto_11057 ) ) ( not ( = ?auto_11039 ?auto_11050 ) ) ( not ( = ?auto_11052 ?auto_11056 ) ) ( not ( = ?auto_11052 ?auto_11049 ) ) ( not ( = ?auto_11052 ?auto_11053 ) ) ( not ( = ?auto_11052 ?auto_11061 ) ) ( not ( = ?auto_11052 ?auto_11057 ) ) ( not ( = ?auto_11052 ?auto_11050 ) ) ( not ( = ?auto_11032 ?auto_11040 ) ) ( not ( = ?auto_11032 ?auto_11054 ) ) ( not ( = ?auto_11033 ?auto_11040 ) ) ( not ( = ?auto_11033 ?auto_11054 ) ) ( not ( = ?auto_11034 ?auto_11040 ) ) ( not ( = ?auto_11034 ?auto_11054 ) ) ( not ( = ?auto_11035 ?auto_11040 ) ) ( not ( = ?auto_11035 ?auto_11054 ) ) ( not ( = ?auto_11036 ?auto_11040 ) ) ( not ( = ?auto_11036 ?auto_11054 ) ) ( not ( = ?auto_11037 ?auto_11040 ) ) ( not ( = ?auto_11037 ?auto_11054 ) ) ( not ( = ?auto_11038 ?auto_11040 ) ) ( not ( = ?auto_11038 ?auto_11054 ) ) ( not ( = ?auto_11040 ?auto_11052 ) ) ( not ( = ?auto_11040 ?auto_11056 ) ) ( not ( = ?auto_11040 ?auto_11049 ) ) ( not ( = ?auto_11040 ?auto_11053 ) ) ( not ( = ?auto_11040 ?auto_11061 ) ) ( not ( = ?auto_11040 ?auto_11057 ) ) ( not ( = ?auto_11040 ?auto_11050 ) ) ( not ( = ?auto_11054 ?auto_11052 ) ) ( not ( = ?auto_11054 ?auto_11056 ) ) ( not ( = ?auto_11054 ?auto_11049 ) ) ( not ( = ?auto_11054 ?auto_11053 ) ) ( not ( = ?auto_11054 ?auto_11061 ) ) ( not ( = ?auto_11054 ?auto_11057 ) ) ( not ( = ?auto_11054 ?auto_11050 ) ) ( not ( = ?auto_11032 ?auto_11041 ) ) ( not ( = ?auto_11032 ?auto_11043 ) ) ( not ( = ?auto_11033 ?auto_11041 ) ) ( not ( = ?auto_11033 ?auto_11043 ) ) ( not ( = ?auto_11034 ?auto_11041 ) ) ( not ( = ?auto_11034 ?auto_11043 ) ) ( not ( = ?auto_11035 ?auto_11041 ) ) ( not ( = ?auto_11035 ?auto_11043 ) ) ( not ( = ?auto_11036 ?auto_11041 ) ) ( not ( = ?auto_11036 ?auto_11043 ) ) ( not ( = ?auto_11037 ?auto_11041 ) ) ( not ( = ?auto_11037 ?auto_11043 ) ) ( not ( = ?auto_11038 ?auto_11041 ) ) ( not ( = ?auto_11038 ?auto_11043 ) ) ( not ( = ?auto_11039 ?auto_11041 ) ) ( not ( = ?auto_11039 ?auto_11043 ) ) ( not ( = ?auto_11041 ?auto_11054 ) ) ( not ( = ?auto_11041 ?auto_11052 ) ) ( not ( = ?auto_11041 ?auto_11056 ) ) ( not ( = ?auto_11041 ?auto_11049 ) ) ( not ( = ?auto_11041 ?auto_11053 ) ) ( not ( = ?auto_11041 ?auto_11061 ) ) ( not ( = ?auto_11041 ?auto_11057 ) ) ( not ( = ?auto_11041 ?auto_11050 ) ) ( not ( = ?auto_11043 ?auto_11054 ) ) ( not ( = ?auto_11043 ?auto_11052 ) ) ( not ( = ?auto_11043 ?auto_11056 ) ) ( not ( = ?auto_11043 ?auto_11049 ) ) ( not ( = ?auto_11043 ?auto_11053 ) ) ( not ( = ?auto_11043 ?auto_11061 ) ) ( not ( = ?auto_11043 ?auto_11057 ) ) ( not ( = ?auto_11043 ?auto_11050 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_11032 ?auto_11033 ?auto_11034 ?auto_11035 ?auto_11036 ?auto_11037 ?auto_11038 ?auto_11039 ?auto_11040 )
      ( MAKE-1CRATE ?auto_11040 ?auto_11041 )
      ( MAKE-9CRATE-VERIFY ?auto_11032 ?auto_11033 ?auto_11034 ?auto_11035 ?auto_11036 ?auto_11037 ?auto_11038 ?auto_11039 ?auto_11040 ?auto_11041 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_11083 - SURFACE
      ?auto_11084 - SURFACE
      ?auto_11085 - SURFACE
      ?auto_11086 - SURFACE
      ?auto_11087 - SURFACE
      ?auto_11088 - SURFACE
      ?auto_11089 - SURFACE
      ?auto_11090 - SURFACE
      ?auto_11091 - SURFACE
      ?auto_11092 - SURFACE
      ?auto_11093 - SURFACE
    )
    :vars
    (
      ?auto_11098 - HOIST
      ?auto_11099 - PLACE
      ?auto_11095 - PLACE
      ?auto_11096 - HOIST
      ?auto_11094 - SURFACE
      ?auto_11110 - PLACE
      ?auto_11106 - HOIST
      ?auto_11103 - SURFACE
      ?auto_11112 - PLACE
      ?auto_11104 - HOIST
      ?auto_11102 - SURFACE
      ?auto_11107 - SURFACE
      ?auto_11108 - SURFACE
      ?auto_11111 - SURFACE
      ?auto_11109 - SURFACE
      ?auto_11105 - SURFACE
      ?auto_11113 - SURFACE
      ?auto_11114 - PLACE
      ?auto_11100 - HOIST
      ?auto_11101 - SURFACE
      ?auto_11097 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11098 ?auto_11099 ) ( IS-CRATE ?auto_11093 ) ( not ( = ?auto_11095 ?auto_11099 ) ) ( HOIST-AT ?auto_11096 ?auto_11095 ) ( SURFACE-AT ?auto_11093 ?auto_11095 ) ( ON ?auto_11093 ?auto_11094 ) ( CLEAR ?auto_11093 ) ( not ( = ?auto_11092 ?auto_11093 ) ) ( not ( = ?auto_11092 ?auto_11094 ) ) ( not ( = ?auto_11093 ?auto_11094 ) ) ( not ( = ?auto_11098 ?auto_11096 ) ) ( IS-CRATE ?auto_11092 ) ( not ( = ?auto_11110 ?auto_11099 ) ) ( HOIST-AT ?auto_11106 ?auto_11110 ) ( SURFACE-AT ?auto_11092 ?auto_11110 ) ( ON ?auto_11092 ?auto_11103 ) ( CLEAR ?auto_11092 ) ( not ( = ?auto_11091 ?auto_11092 ) ) ( not ( = ?auto_11091 ?auto_11103 ) ) ( not ( = ?auto_11092 ?auto_11103 ) ) ( not ( = ?auto_11098 ?auto_11106 ) ) ( IS-CRATE ?auto_11091 ) ( not ( = ?auto_11112 ?auto_11099 ) ) ( HOIST-AT ?auto_11104 ?auto_11112 ) ( SURFACE-AT ?auto_11091 ?auto_11112 ) ( ON ?auto_11091 ?auto_11102 ) ( CLEAR ?auto_11091 ) ( not ( = ?auto_11090 ?auto_11091 ) ) ( not ( = ?auto_11090 ?auto_11102 ) ) ( not ( = ?auto_11091 ?auto_11102 ) ) ( not ( = ?auto_11098 ?auto_11104 ) ) ( IS-CRATE ?auto_11090 ) ( SURFACE-AT ?auto_11090 ?auto_11095 ) ( ON ?auto_11090 ?auto_11107 ) ( CLEAR ?auto_11090 ) ( not ( = ?auto_11089 ?auto_11090 ) ) ( not ( = ?auto_11089 ?auto_11107 ) ) ( not ( = ?auto_11090 ?auto_11107 ) ) ( IS-CRATE ?auto_11089 ) ( AVAILABLE ?auto_11104 ) ( SURFACE-AT ?auto_11089 ?auto_11112 ) ( ON ?auto_11089 ?auto_11108 ) ( CLEAR ?auto_11089 ) ( not ( = ?auto_11088 ?auto_11089 ) ) ( not ( = ?auto_11088 ?auto_11108 ) ) ( not ( = ?auto_11089 ?auto_11108 ) ) ( IS-CRATE ?auto_11088 ) ( SURFACE-AT ?auto_11088 ?auto_11095 ) ( ON ?auto_11088 ?auto_11111 ) ( CLEAR ?auto_11088 ) ( not ( = ?auto_11087 ?auto_11088 ) ) ( not ( = ?auto_11087 ?auto_11111 ) ) ( not ( = ?auto_11088 ?auto_11111 ) ) ( IS-CRATE ?auto_11087 ) ( AVAILABLE ?auto_11106 ) ( SURFACE-AT ?auto_11087 ?auto_11110 ) ( ON ?auto_11087 ?auto_11109 ) ( CLEAR ?auto_11087 ) ( not ( = ?auto_11086 ?auto_11087 ) ) ( not ( = ?auto_11086 ?auto_11109 ) ) ( not ( = ?auto_11087 ?auto_11109 ) ) ( IS-CRATE ?auto_11086 ) ( SURFACE-AT ?auto_11086 ?auto_11095 ) ( ON ?auto_11086 ?auto_11105 ) ( CLEAR ?auto_11086 ) ( not ( = ?auto_11085 ?auto_11086 ) ) ( not ( = ?auto_11085 ?auto_11105 ) ) ( not ( = ?auto_11086 ?auto_11105 ) ) ( IS-CRATE ?auto_11085 ) ( AVAILABLE ?auto_11096 ) ( SURFACE-AT ?auto_11085 ?auto_11095 ) ( ON ?auto_11085 ?auto_11113 ) ( CLEAR ?auto_11085 ) ( not ( = ?auto_11084 ?auto_11085 ) ) ( not ( = ?auto_11084 ?auto_11113 ) ) ( not ( = ?auto_11085 ?auto_11113 ) ) ( SURFACE-AT ?auto_11083 ?auto_11099 ) ( CLEAR ?auto_11083 ) ( IS-CRATE ?auto_11084 ) ( AVAILABLE ?auto_11098 ) ( not ( = ?auto_11114 ?auto_11099 ) ) ( HOIST-AT ?auto_11100 ?auto_11114 ) ( AVAILABLE ?auto_11100 ) ( SURFACE-AT ?auto_11084 ?auto_11114 ) ( ON ?auto_11084 ?auto_11101 ) ( CLEAR ?auto_11084 ) ( TRUCK-AT ?auto_11097 ?auto_11099 ) ( not ( = ?auto_11083 ?auto_11084 ) ) ( not ( = ?auto_11083 ?auto_11101 ) ) ( not ( = ?auto_11084 ?auto_11101 ) ) ( not ( = ?auto_11098 ?auto_11100 ) ) ( not ( = ?auto_11083 ?auto_11085 ) ) ( not ( = ?auto_11083 ?auto_11113 ) ) ( not ( = ?auto_11085 ?auto_11101 ) ) ( not ( = ?auto_11095 ?auto_11114 ) ) ( not ( = ?auto_11096 ?auto_11100 ) ) ( not ( = ?auto_11113 ?auto_11101 ) ) ( not ( = ?auto_11083 ?auto_11086 ) ) ( not ( = ?auto_11083 ?auto_11105 ) ) ( not ( = ?auto_11084 ?auto_11086 ) ) ( not ( = ?auto_11084 ?auto_11105 ) ) ( not ( = ?auto_11086 ?auto_11113 ) ) ( not ( = ?auto_11086 ?auto_11101 ) ) ( not ( = ?auto_11105 ?auto_11113 ) ) ( not ( = ?auto_11105 ?auto_11101 ) ) ( not ( = ?auto_11083 ?auto_11087 ) ) ( not ( = ?auto_11083 ?auto_11109 ) ) ( not ( = ?auto_11084 ?auto_11087 ) ) ( not ( = ?auto_11084 ?auto_11109 ) ) ( not ( = ?auto_11085 ?auto_11087 ) ) ( not ( = ?auto_11085 ?auto_11109 ) ) ( not ( = ?auto_11087 ?auto_11105 ) ) ( not ( = ?auto_11087 ?auto_11113 ) ) ( not ( = ?auto_11087 ?auto_11101 ) ) ( not ( = ?auto_11110 ?auto_11095 ) ) ( not ( = ?auto_11110 ?auto_11114 ) ) ( not ( = ?auto_11106 ?auto_11096 ) ) ( not ( = ?auto_11106 ?auto_11100 ) ) ( not ( = ?auto_11109 ?auto_11105 ) ) ( not ( = ?auto_11109 ?auto_11113 ) ) ( not ( = ?auto_11109 ?auto_11101 ) ) ( not ( = ?auto_11083 ?auto_11088 ) ) ( not ( = ?auto_11083 ?auto_11111 ) ) ( not ( = ?auto_11084 ?auto_11088 ) ) ( not ( = ?auto_11084 ?auto_11111 ) ) ( not ( = ?auto_11085 ?auto_11088 ) ) ( not ( = ?auto_11085 ?auto_11111 ) ) ( not ( = ?auto_11086 ?auto_11088 ) ) ( not ( = ?auto_11086 ?auto_11111 ) ) ( not ( = ?auto_11088 ?auto_11109 ) ) ( not ( = ?auto_11088 ?auto_11105 ) ) ( not ( = ?auto_11088 ?auto_11113 ) ) ( not ( = ?auto_11088 ?auto_11101 ) ) ( not ( = ?auto_11111 ?auto_11109 ) ) ( not ( = ?auto_11111 ?auto_11105 ) ) ( not ( = ?auto_11111 ?auto_11113 ) ) ( not ( = ?auto_11111 ?auto_11101 ) ) ( not ( = ?auto_11083 ?auto_11089 ) ) ( not ( = ?auto_11083 ?auto_11108 ) ) ( not ( = ?auto_11084 ?auto_11089 ) ) ( not ( = ?auto_11084 ?auto_11108 ) ) ( not ( = ?auto_11085 ?auto_11089 ) ) ( not ( = ?auto_11085 ?auto_11108 ) ) ( not ( = ?auto_11086 ?auto_11089 ) ) ( not ( = ?auto_11086 ?auto_11108 ) ) ( not ( = ?auto_11087 ?auto_11089 ) ) ( not ( = ?auto_11087 ?auto_11108 ) ) ( not ( = ?auto_11089 ?auto_11111 ) ) ( not ( = ?auto_11089 ?auto_11109 ) ) ( not ( = ?auto_11089 ?auto_11105 ) ) ( not ( = ?auto_11089 ?auto_11113 ) ) ( not ( = ?auto_11089 ?auto_11101 ) ) ( not ( = ?auto_11112 ?auto_11095 ) ) ( not ( = ?auto_11112 ?auto_11110 ) ) ( not ( = ?auto_11112 ?auto_11114 ) ) ( not ( = ?auto_11104 ?auto_11096 ) ) ( not ( = ?auto_11104 ?auto_11106 ) ) ( not ( = ?auto_11104 ?auto_11100 ) ) ( not ( = ?auto_11108 ?auto_11111 ) ) ( not ( = ?auto_11108 ?auto_11109 ) ) ( not ( = ?auto_11108 ?auto_11105 ) ) ( not ( = ?auto_11108 ?auto_11113 ) ) ( not ( = ?auto_11108 ?auto_11101 ) ) ( not ( = ?auto_11083 ?auto_11090 ) ) ( not ( = ?auto_11083 ?auto_11107 ) ) ( not ( = ?auto_11084 ?auto_11090 ) ) ( not ( = ?auto_11084 ?auto_11107 ) ) ( not ( = ?auto_11085 ?auto_11090 ) ) ( not ( = ?auto_11085 ?auto_11107 ) ) ( not ( = ?auto_11086 ?auto_11090 ) ) ( not ( = ?auto_11086 ?auto_11107 ) ) ( not ( = ?auto_11087 ?auto_11090 ) ) ( not ( = ?auto_11087 ?auto_11107 ) ) ( not ( = ?auto_11088 ?auto_11090 ) ) ( not ( = ?auto_11088 ?auto_11107 ) ) ( not ( = ?auto_11090 ?auto_11108 ) ) ( not ( = ?auto_11090 ?auto_11111 ) ) ( not ( = ?auto_11090 ?auto_11109 ) ) ( not ( = ?auto_11090 ?auto_11105 ) ) ( not ( = ?auto_11090 ?auto_11113 ) ) ( not ( = ?auto_11090 ?auto_11101 ) ) ( not ( = ?auto_11107 ?auto_11108 ) ) ( not ( = ?auto_11107 ?auto_11111 ) ) ( not ( = ?auto_11107 ?auto_11109 ) ) ( not ( = ?auto_11107 ?auto_11105 ) ) ( not ( = ?auto_11107 ?auto_11113 ) ) ( not ( = ?auto_11107 ?auto_11101 ) ) ( not ( = ?auto_11083 ?auto_11091 ) ) ( not ( = ?auto_11083 ?auto_11102 ) ) ( not ( = ?auto_11084 ?auto_11091 ) ) ( not ( = ?auto_11084 ?auto_11102 ) ) ( not ( = ?auto_11085 ?auto_11091 ) ) ( not ( = ?auto_11085 ?auto_11102 ) ) ( not ( = ?auto_11086 ?auto_11091 ) ) ( not ( = ?auto_11086 ?auto_11102 ) ) ( not ( = ?auto_11087 ?auto_11091 ) ) ( not ( = ?auto_11087 ?auto_11102 ) ) ( not ( = ?auto_11088 ?auto_11091 ) ) ( not ( = ?auto_11088 ?auto_11102 ) ) ( not ( = ?auto_11089 ?auto_11091 ) ) ( not ( = ?auto_11089 ?auto_11102 ) ) ( not ( = ?auto_11091 ?auto_11107 ) ) ( not ( = ?auto_11091 ?auto_11108 ) ) ( not ( = ?auto_11091 ?auto_11111 ) ) ( not ( = ?auto_11091 ?auto_11109 ) ) ( not ( = ?auto_11091 ?auto_11105 ) ) ( not ( = ?auto_11091 ?auto_11113 ) ) ( not ( = ?auto_11091 ?auto_11101 ) ) ( not ( = ?auto_11102 ?auto_11107 ) ) ( not ( = ?auto_11102 ?auto_11108 ) ) ( not ( = ?auto_11102 ?auto_11111 ) ) ( not ( = ?auto_11102 ?auto_11109 ) ) ( not ( = ?auto_11102 ?auto_11105 ) ) ( not ( = ?auto_11102 ?auto_11113 ) ) ( not ( = ?auto_11102 ?auto_11101 ) ) ( not ( = ?auto_11083 ?auto_11092 ) ) ( not ( = ?auto_11083 ?auto_11103 ) ) ( not ( = ?auto_11084 ?auto_11092 ) ) ( not ( = ?auto_11084 ?auto_11103 ) ) ( not ( = ?auto_11085 ?auto_11092 ) ) ( not ( = ?auto_11085 ?auto_11103 ) ) ( not ( = ?auto_11086 ?auto_11092 ) ) ( not ( = ?auto_11086 ?auto_11103 ) ) ( not ( = ?auto_11087 ?auto_11092 ) ) ( not ( = ?auto_11087 ?auto_11103 ) ) ( not ( = ?auto_11088 ?auto_11092 ) ) ( not ( = ?auto_11088 ?auto_11103 ) ) ( not ( = ?auto_11089 ?auto_11092 ) ) ( not ( = ?auto_11089 ?auto_11103 ) ) ( not ( = ?auto_11090 ?auto_11092 ) ) ( not ( = ?auto_11090 ?auto_11103 ) ) ( not ( = ?auto_11092 ?auto_11102 ) ) ( not ( = ?auto_11092 ?auto_11107 ) ) ( not ( = ?auto_11092 ?auto_11108 ) ) ( not ( = ?auto_11092 ?auto_11111 ) ) ( not ( = ?auto_11092 ?auto_11109 ) ) ( not ( = ?auto_11092 ?auto_11105 ) ) ( not ( = ?auto_11092 ?auto_11113 ) ) ( not ( = ?auto_11092 ?auto_11101 ) ) ( not ( = ?auto_11103 ?auto_11102 ) ) ( not ( = ?auto_11103 ?auto_11107 ) ) ( not ( = ?auto_11103 ?auto_11108 ) ) ( not ( = ?auto_11103 ?auto_11111 ) ) ( not ( = ?auto_11103 ?auto_11109 ) ) ( not ( = ?auto_11103 ?auto_11105 ) ) ( not ( = ?auto_11103 ?auto_11113 ) ) ( not ( = ?auto_11103 ?auto_11101 ) ) ( not ( = ?auto_11083 ?auto_11093 ) ) ( not ( = ?auto_11083 ?auto_11094 ) ) ( not ( = ?auto_11084 ?auto_11093 ) ) ( not ( = ?auto_11084 ?auto_11094 ) ) ( not ( = ?auto_11085 ?auto_11093 ) ) ( not ( = ?auto_11085 ?auto_11094 ) ) ( not ( = ?auto_11086 ?auto_11093 ) ) ( not ( = ?auto_11086 ?auto_11094 ) ) ( not ( = ?auto_11087 ?auto_11093 ) ) ( not ( = ?auto_11087 ?auto_11094 ) ) ( not ( = ?auto_11088 ?auto_11093 ) ) ( not ( = ?auto_11088 ?auto_11094 ) ) ( not ( = ?auto_11089 ?auto_11093 ) ) ( not ( = ?auto_11089 ?auto_11094 ) ) ( not ( = ?auto_11090 ?auto_11093 ) ) ( not ( = ?auto_11090 ?auto_11094 ) ) ( not ( = ?auto_11091 ?auto_11093 ) ) ( not ( = ?auto_11091 ?auto_11094 ) ) ( not ( = ?auto_11093 ?auto_11103 ) ) ( not ( = ?auto_11093 ?auto_11102 ) ) ( not ( = ?auto_11093 ?auto_11107 ) ) ( not ( = ?auto_11093 ?auto_11108 ) ) ( not ( = ?auto_11093 ?auto_11111 ) ) ( not ( = ?auto_11093 ?auto_11109 ) ) ( not ( = ?auto_11093 ?auto_11105 ) ) ( not ( = ?auto_11093 ?auto_11113 ) ) ( not ( = ?auto_11093 ?auto_11101 ) ) ( not ( = ?auto_11094 ?auto_11103 ) ) ( not ( = ?auto_11094 ?auto_11102 ) ) ( not ( = ?auto_11094 ?auto_11107 ) ) ( not ( = ?auto_11094 ?auto_11108 ) ) ( not ( = ?auto_11094 ?auto_11111 ) ) ( not ( = ?auto_11094 ?auto_11109 ) ) ( not ( = ?auto_11094 ?auto_11105 ) ) ( not ( = ?auto_11094 ?auto_11113 ) ) ( not ( = ?auto_11094 ?auto_11101 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_11083 ?auto_11084 ?auto_11085 ?auto_11086 ?auto_11087 ?auto_11088 ?auto_11089 ?auto_11090 ?auto_11091 ?auto_11092 )
      ( MAKE-1CRATE ?auto_11092 ?auto_11093 )
      ( MAKE-10CRATE-VERIFY ?auto_11083 ?auto_11084 ?auto_11085 ?auto_11086 ?auto_11087 ?auto_11088 ?auto_11089 ?auto_11090 ?auto_11091 ?auto_11092 ?auto_11093 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_11137 - SURFACE
      ?auto_11138 - SURFACE
      ?auto_11139 - SURFACE
      ?auto_11140 - SURFACE
      ?auto_11141 - SURFACE
      ?auto_11142 - SURFACE
      ?auto_11143 - SURFACE
      ?auto_11144 - SURFACE
      ?auto_11145 - SURFACE
      ?auto_11146 - SURFACE
      ?auto_11147 - SURFACE
      ?auto_11148 - SURFACE
    )
    :vars
    (
      ?auto_11153 - HOIST
      ?auto_11150 - PLACE
      ?auto_11149 - PLACE
      ?auto_11152 - HOIST
      ?auto_11151 - SURFACE
      ?auto_11155 - PLACE
      ?auto_11165 - HOIST
      ?auto_11158 - SURFACE
      ?auto_11160 - SURFACE
      ?auto_11161 - PLACE
      ?auto_11168 - HOIST
      ?auto_11157 - SURFACE
      ?auto_11166 - SURFACE
      ?auto_11156 - SURFACE
      ?auto_11164 - SURFACE
      ?auto_11162 - SURFACE
      ?auto_11163 - SURFACE
      ?auto_11170 - SURFACE
      ?auto_11159 - PLACE
      ?auto_11169 - HOIST
      ?auto_11167 - SURFACE
      ?auto_11154 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11153 ?auto_11150 ) ( IS-CRATE ?auto_11148 ) ( not ( = ?auto_11149 ?auto_11150 ) ) ( HOIST-AT ?auto_11152 ?auto_11149 ) ( SURFACE-AT ?auto_11148 ?auto_11149 ) ( ON ?auto_11148 ?auto_11151 ) ( CLEAR ?auto_11148 ) ( not ( = ?auto_11147 ?auto_11148 ) ) ( not ( = ?auto_11147 ?auto_11151 ) ) ( not ( = ?auto_11148 ?auto_11151 ) ) ( not ( = ?auto_11153 ?auto_11152 ) ) ( IS-CRATE ?auto_11147 ) ( not ( = ?auto_11155 ?auto_11150 ) ) ( HOIST-AT ?auto_11165 ?auto_11155 ) ( SURFACE-AT ?auto_11147 ?auto_11155 ) ( ON ?auto_11147 ?auto_11158 ) ( CLEAR ?auto_11147 ) ( not ( = ?auto_11146 ?auto_11147 ) ) ( not ( = ?auto_11146 ?auto_11158 ) ) ( not ( = ?auto_11147 ?auto_11158 ) ) ( not ( = ?auto_11153 ?auto_11165 ) ) ( IS-CRATE ?auto_11146 ) ( SURFACE-AT ?auto_11146 ?auto_11149 ) ( ON ?auto_11146 ?auto_11160 ) ( CLEAR ?auto_11146 ) ( not ( = ?auto_11145 ?auto_11146 ) ) ( not ( = ?auto_11145 ?auto_11160 ) ) ( not ( = ?auto_11146 ?auto_11160 ) ) ( IS-CRATE ?auto_11145 ) ( not ( = ?auto_11161 ?auto_11150 ) ) ( HOIST-AT ?auto_11168 ?auto_11161 ) ( SURFACE-AT ?auto_11145 ?auto_11161 ) ( ON ?auto_11145 ?auto_11157 ) ( CLEAR ?auto_11145 ) ( not ( = ?auto_11144 ?auto_11145 ) ) ( not ( = ?auto_11144 ?auto_11157 ) ) ( not ( = ?auto_11145 ?auto_11157 ) ) ( not ( = ?auto_11153 ?auto_11168 ) ) ( IS-CRATE ?auto_11144 ) ( SURFACE-AT ?auto_11144 ?auto_11155 ) ( ON ?auto_11144 ?auto_11166 ) ( CLEAR ?auto_11144 ) ( not ( = ?auto_11143 ?auto_11144 ) ) ( not ( = ?auto_11143 ?auto_11166 ) ) ( not ( = ?auto_11144 ?auto_11166 ) ) ( IS-CRATE ?auto_11143 ) ( AVAILABLE ?auto_11168 ) ( SURFACE-AT ?auto_11143 ?auto_11161 ) ( ON ?auto_11143 ?auto_11156 ) ( CLEAR ?auto_11143 ) ( not ( = ?auto_11142 ?auto_11143 ) ) ( not ( = ?auto_11142 ?auto_11156 ) ) ( not ( = ?auto_11143 ?auto_11156 ) ) ( IS-CRATE ?auto_11142 ) ( SURFACE-AT ?auto_11142 ?auto_11155 ) ( ON ?auto_11142 ?auto_11164 ) ( CLEAR ?auto_11142 ) ( not ( = ?auto_11141 ?auto_11142 ) ) ( not ( = ?auto_11141 ?auto_11164 ) ) ( not ( = ?auto_11142 ?auto_11164 ) ) ( IS-CRATE ?auto_11141 ) ( AVAILABLE ?auto_11152 ) ( SURFACE-AT ?auto_11141 ?auto_11149 ) ( ON ?auto_11141 ?auto_11162 ) ( CLEAR ?auto_11141 ) ( not ( = ?auto_11140 ?auto_11141 ) ) ( not ( = ?auto_11140 ?auto_11162 ) ) ( not ( = ?auto_11141 ?auto_11162 ) ) ( IS-CRATE ?auto_11140 ) ( SURFACE-AT ?auto_11140 ?auto_11155 ) ( ON ?auto_11140 ?auto_11163 ) ( CLEAR ?auto_11140 ) ( not ( = ?auto_11139 ?auto_11140 ) ) ( not ( = ?auto_11139 ?auto_11163 ) ) ( not ( = ?auto_11140 ?auto_11163 ) ) ( IS-CRATE ?auto_11139 ) ( AVAILABLE ?auto_11165 ) ( SURFACE-AT ?auto_11139 ?auto_11155 ) ( ON ?auto_11139 ?auto_11170 ) ( CLEAR ?auto_11139 ) ( not ( = ?auto_11138 ?auto_11139 ) ) ( not ( = ?auto_11138 ?auto_11170 ) ) ( not ( = ?auto_11139 ?auto_11170 ) ) ( SURFACE-AT ?auto_11137 ?auto_11150 ) ( CLEAR ?auto_11137 ) ( IS-CRATE ?auto_11138 ) ( AVAILABLE ?auto_11153 ) ( not ( = ?auto_11159 ?auto_11150 ) ) ( HOIST-AT ?auto_11169 ?auto_11159 ) ( AVAILABLE ?auto_11169 ) ( SURFACE-AT ?auto_11138 ?auto_11159 ) ( ON ?auto_11138 ?auto_11167 ) ( CLEAR ?auto_11138 ) ( TRUCK-AT ?auto_11154 ?auto_11150 ) ( not ( = ?auto_11137 ?auto_11138 ) ) ( not ( = ?auto_11137 ?auto_11167 ) ) ( not ( = ?auto_11138 ?auto_11167 ) ) ( not ( = ?auto_11153 ?auto_11169 ) ) ( not ( = ?auto_11137 ?auto_11139 ) ) ( not ( = ?auto_11137 ?auto_11170 ) ) ( not ( = ?auto_11139 ?auto_11167 ) ) ( not ( = ?auto_11155 ?auto_11159 ) ) ( not ( = ?auto_11165 ?auto_11169 ) ) ( not ( = ?auto_11170 ?auto_11167 ) ) ( not ( = ?auto_11137 ?auto_11140 ) ) ( not ( = ?auto_11137 ?auto_11163 ) ) ( not ( = ?auto_11138 ?auto_11140 ) ) ( not ( = ?auto_11138 ?auto_11163 ) ) ( not ( = ?auto_11140 ?auto_11170 ) ) ( not ( = ?auto_11140 ?auto_11167 ) ) ( not ( = ?auto_11163 ?auto_11170 ) ) ( not ( = ?auto_11163 ?auto_11167 ) ) ( not ( = ?auto_11137 ?auto_11141 ) ) ( not ( = ?auto_11137 ?auto_11162 ) ) ( not ( = ?auto_11138 ?auto_11141 ) ) ( not ( = ?auto_11138 ?auto_11162 ) ) ( not ( = ?auto_11139 ?auto_11141 ) ) ( not ( = ?auto_11139 ?auto_11162 ) ) ( not ( = ?auto_11141 ?auto_11163 ) ) ( not ( = ?auto_11141 ?auto_11170 ) ) ( not ( = ?auto_11141 ?auto_11167 ) ) ( not ( = ?auto_11149 ?auto_11155 ) ) ( not ( = ?auto_11149 ?auto_11159 ) ) ( not ( = ?auto_11152 ?auto_11165 ) ) ( not ( = ?auto_11152 ?auto_11169 ) ) ( not ( = ?auto_11162 ?auto_11163 ) ) ( not ( = ?auto_11162 ?auto_11170 ) ) ( not ( = ?auto_11162 ?auto_11167 ) ) ( not ( = ?auto_11137 ?auto_11142 ) ) ( not ( = ?auto_11137 ?auto_11164 ) ) ( not ( = ?auto_11138 ?auto_11142 ) ) ( not ( = ?auto_11138 ?auto_11164 ) ) ( not ( = ?auto_11139 ?auto_11142 ) ) ( not ( = ?auto_11139 ?auto_11164 ) ) ( not ( = ?auto_11140 ?auto_11142 ) ) ( not ( = ?auto_11140 ?auto_11164 ) ) ( not ( = ?auto_11142 ?auto_11162 ) ) ( not ( = ?auto_11142 ?auto_11163 ) ) ( not ( = ?auto_11142 ?auto_11170 ) ) ( not ( = ?auto_11142 ?auto_11167 ) ) ( not ( = ?auto_11164 ?auto_11162 ) ) ( not ( = ?auto_11164 ?auto_11163 ) ) ( not ( = ?auto_11164 ?auto_11170 ) ) ( not ( = ?auto_11164 ?auto_11167 ) ) ( not ( = ?auto_11137 ?auto_11143 ) ) ( not ( = ?auto_11137 ?auto_11156 ) ) ( not ( = ?auto_11138 ?auto_11143 ) ) ( not ( = ?auto_11138 ?auto_11156 ) ) ( not ( = ?auto_11139 ?auto_11143 ) ) ( not ( = ?auto_11139 ?auto_11156 ) ) ( not ( = ?auto_11140 ?auto_11143 ) ) ( not ( = ?auto_11140 ?auto_11156 ) ) ( not ( = ?auto_11141 ?auto_11143 ) ) ( not ( = ?auto_11141 ?auto_11156 ) ) ( not ( = ?auto_11143 ?auto_11164 ) ) ( not ( = ?auto_11143 ?auto_11162 ) ) ( not ( = ?auto_11143 ?auto_11163 ) ) ( not ( = ?auto_11143 ?auto_11170 ) ) ( not ( = ?auto_11143 ?auto_11167 ) ) ( not ( = ?auto_11161 ?auto_11155 ) ) ( not ( = ?auto_11161 ?auto_11149 ) ) ( not ( = ?auto_11161 ?auto_11159 ) ) ( not ( = ?auto_11168 ?auto_11165 ) ) ( not ( = ?auto_11168 ?auto_11152 ) ) ( not ( = ?auto_11168 ?auto_11169 ) ) ( not ( = ?auto_11156 ?auto_11164 ) ) ( not ( = ?auto_11156 ?auto_11162 ) ) ( not ( = ?auto_11156 ?auto_11163 ) ) ( not ( = ?auto_11156 ?auto_11170 ) ) ( not ( = ?auto_11156 ?auto_11167 ) ) ( not ( = ?auto_11137 ?auto_11144 ) ) ( not ( = ?auto_11137 ?auto_11166 ) ) ( not ( = ?auto_11138 ?auto_11144 ) ) ( not ( = ?auto_11138 ?auto_11166 ) ) ( not ( = ?auto_11139 ?auto_11144 ) ) ( not ( = ?auto_11139 ?auto_11166 ) ) ( not ( = ?auto_11140 ?auto_11144 ) ) ( not ( = ?auto_11140 ?auto_11166 ) ) ( not ( = ?auto_11141 ?auto_11144 ) ) ( not ( = ?auto_11141 ?auto_11166 ) ) ( not ( = ?auto_11142 ?auto_11144 ) ) ( not ( = ?auto_11142 ?auto_11166 ) ) ( not ( = ?auto_11144 ?auto_11156 ) ) ( not ( = ?auto_11144 ?auto_11164 ) ) ( not ( = ?auto_11144 ?auto_11162 ) ) ( not ( = ?auto_11144 ?auto_11163 ) ) ( not ( = ?auto_11144 ?auto_11170 ) ) ( not ( = ?auto_11144 ?auto_11167 ) ) ( not ( = ?auto_11166 ?auto_11156 ) ) ( not ( = ?auto_11166 ?auto_11164 ) ) ( not ( = ?auto_11166 ?auto_11162 ) ) ( not ( = ?auto_11166 ?auto_11163 ) ) ( not ( = ?auto_11166 ?auto_11170 ) ) ( not ( = ?auto_11166 ?auto_11167 ) ) ( not ( = ?auto_11137 ?auto_11145 ) ) ( not ( = ?auto_11137 ?auto_11157 ) ) ( not ( = ?auto_11138 ?auto_11145 ) ) ( not ( = ?auto_11138 ?auto_11157 ) ) ( not ( = ?auto_11139 ?auto_11145 ) ) ( not ( = ?auto_11139 ?auto_11157 ) ) ( not ( = ?auto_11140 ?auto_11145 ) ) ( not ( = ?auto_11140 ?auto_11157 ) ) ( not ( = ?auto_11141 ?auto_11145 ) ) ( not ( = ?auto_11141 ?auto_11157 ) ) ( not ( = ?auto_11142 ?auto_11145 ) ) ( not ( = ?auto_11142 ?auto_11157 ) ) ( not ( = ?auto_11143 ?auto_11145 ) ) ( not ( = ?auto_11143 ?auto_11157 ) ) ( not ( = ?auto_11145 ?auto_11166 ) ) ( not ( = ?auto_11145 ?auto_11156 ) ) ( not ( = ?auto_11145 ?auto_11164 ) ) ( not ( = ?auto_11145 ?auto_11162 ) ) ( not ( = ?auto_11145 ?auto_11163 ) ) ( not ( = ?auto_11145 ?auto_11170 ) ) ( not ( = ?auto_11145 ?auto_11167 ) ) ( not ( = ?auto_11157 ?auto_11166 ) ) ( not ( = ?auto_11157 ?auto_11156 ) ) ( not ( = ?auto_11157 ?auto_11164 ) ) ( not ( = ?auto_11157 ?auto_11162 ) ) ( not ( = ?auto_11157 ?auto_11163 ) ) ( not ( = ?auto_11157 ?auto_11170 ) ) ( not ( = ?auto_11157 ?auto_11167 ) ) ( not ( = ?auto_11137 ?auto_11146 ) ) ( not ( = ?auto_11137 ?auto_11160 ) ) ( not ( = ?auto_11138 ?auto_11146 ) ) ( not ( = ?auto_11138 ?auto_11160 ) ) ( not ( = ?auto_11139 ?auto_11146 ) ) ( not ( = ?auto_11139 ?auto_11160 ) ) ( not ( = ?auto_11140 ?auto_11146 ) ) ( not ( = ?auto_11140 ?auto_11160 ) ) ( not ( = ?auto_11141 ?auto_11146 ) ) ( not ( = ?auto_11141 ?auto_11160 ) ) ( not ( = ?auto_11142 ?auto_11146 ) ) ( not ( = ?auto_11142 ?auto_11160 ) ) ( not ( = ?auto_11143 ?auto_11146 ) ) ( not ( = ?auto_11143 ?auto_11160 ) ) ( not ( = ?auto_11144 ?auto_11146 ) ) ( not ( = ?auto_11144 ?auto_11160 ) ) ( not ( = ?auto_11146 ?auto_11157 ) ) ( not ( = ?auto_11146 ?auto_11166 ) ) ( not ( = ?auto_11146 ?auto_11156 ) ) ( not ( = ?auto_11146 ?auto_11164 ) ) ( not ( = ?auto_11146 ?auto_11162 ) ) ( not ( = ?auto_11146 ?auto_11163 ) ) ( not ( = ?auto_11146 ?auto_11170 ) ) ( not ( = ?auto_11146 ?auto_11167 ) ) ( not ( = ?auto_11160 ?auto_11157 ) ) ( not ( = ?auto_11160 ?auto_11166 ) ) ( not ( = ?auto_11160 ?auto_11156 ) ) ( not ( = ?auto_11160 ?auto_11164 ) ) ( not ( = ?auto_11160 ?auto_11162 ) ) ( not ( = ?auto_11160 ?auto_11163 ) ) ( not ( = ?auto_11160 ?auto_11170 ) ) ( not ( = ?auto_11160 ?auto_11167 ) ) ( not ( = ?auto_11137 ?auto_11147 ) ) ( not ( = ?auto_11137 ?auto_11158 ) ) ( not ( = ?auto_11138 ?auto_11147 ) ) ( not ( = ?auto_11138 ?auto_11158 ) ) ( not ( = ?auto_11139 ?auto_11147 ) ) ( not ( = ?auto_11139 ?auto_11158 ) ) ( not ( = ?auto_11140 ?auto_11147 ) ) ( not ( = ?auto_11140 ?auto_11158 ) ) ( not ( = ?auto_11141 ?auto_11147 ) ) ( not ( = ?auto_11141 ?auto_11158 ) ) ( not ( = ?auto_11142 ?auto_11147 ) ) ( not ( = ?auto_11142 ?auto_11158 ) ) ( not ( = ?auto_11143 ?auto_11147 ) ) ( not ( = ?auto_11143 ?auto_11158 ) ) ( not ( = ?auto_11144 ?auto_11147 ) ) ( not ( = ?auto_11144 ?auto_11158 ) ) ( not ( = ?auto_11145 ?auto_11147 ) ) ( not ( = ?auto_11145 ?auto_11158 ) ) ( not ( = ?auto_11147 ?auto_11160 ) ) ( not ( = ?auto_11147 ?auto_11157 ) ) ( not ( = ?auto_11147 ?auto_11166 ) ) ( not ( = ?auto_11147 ?auto_11156 ) ) ( not ( = ?auto_11147 ?auto_11164 ) ) ( not ( = ?auto_11147 ?auto_11162 ) ) ( not ( = ?auto_11147 ?auto_11163 ) ) ( not ( = ?auto_11147 ?auto_11170 ) ) ( not ( = ?auto_11147 ?auto_11167 ) ) ( not ( = ?auto_11158 ?auto_11160 ) ) ( not ( = ?auto_11158 ?auto_11157 ) ) ( not ( = ?auto_11158 ?auto_11166 ) ) ( not ( = ?auto_11158 ?auto_11156 ) ) ( not ( = ?auto_11158 ?auto_11164 ) ) ( not ( = ?auto_11158 ?auto_11162 ) ) ( not ( = ?auto_11158 ?auto_11163 ) ) ( not ( = ?auto_11158 ?auto_11170 ) ) ( not ( = ?auto_11158 ?auto_11167 ) ) ( not ( = ?auto_11137 ?auto_11148 ) ) ( not ( = ?auto_11137 ?auto_11151 ) ) ( not ( = ?auto_11138 ?auto_11148 ) ) ( not ( = ?auto_11138 ?auto_11151 ) ) ( not ( = ?auto_11139 ?auto_11148 ) ) ( not ( = ?auto_11139 ?auto_11151 ) ) ( not ( = ?auto_11140 ?auto_11148 ) ) ( not ( = ?auto_11140 ?auto_11151 ) ) ( not ( = ?auto_11141 ?auto_11148 ) ) ( not ( = ?auto_11141 ?auto_11151 ) ) ( not ( = ?auto_11142 ?auto_11148 ) ) ( not ( = ?auto_11142 ?auto_11151 ) ) ( not ( = ?auto_11143 ?auto_11148 ) ) ( not ( = ?auto_11143 ?auto_11151 ) ) ( not ( = ?auto_11144 ?auto_11148 ) ) ( not ( = ?auto_11144 ?auto_11151 ) ) ( not ( = ?auto_11145 ?auto_11148 ) ) ( not ( = ?auto_11145 ?auto_11151 ) ) ( not ( = ?auto_11146 ?auto_11148 ) ) ( not ( = ?auto_11146 ?auto_11151 ) ) ( not ( = ?auto_11148 ?auto_11158 ) ) ( not ( = ?auto_11148 ?auto_11160 ) ) ( not ( = ?auto_11148 ?auto_11157 ) ) ( not ( = ?auto_11148 ?auto_11166 ) ) ( not ( = ?auto_11148 ?auto_11156 ) ) ( not ( = ?auto_11148 ?auto_11164 ) ) ( not ( = ?auto_11148 ?auto_11162 ) ) ( not ( = ?auto_11148 ?auto_11163 ) ) ( not ( = ?auto_11148 ?auto_11170 ) ) ( not ( = ?auto_11148 ?auto_11167 ) ) ( not ( = ?auto_11151 ?auto_11158 ) ) ( not ( = ?auto_11151 ?auto_11160 ) ) ( not ( = ?auto_11151 ?auto_11157 ) ) ( not ( = ?auto_11151 ?auto_11166 ) ) ( not ( = ?auto_11151 ?auto_11156 ) ) ( not ( = ?auto_11151 ?auto_11164 ) ) ( not ( = ?auto_11151 ?auto_11162 ) ) ( not ( = ?auto_11151 ?auto_11163 ) ) ( not ( = ?auto_11151 ?auto_11170 ) ) ( not ( = ?auto_11151 ?auto_11167 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_11137 ?auto_11138 ?auto_11139 ?auto_11140 ?auto_11141 ?auto_11142 ?auto_11143 ?auto_11144 ?auto_11145 ?auto_11146 ?auto_11147 )
      ( MAKE-1CRATE ?auto_11147 ?auto_11148 )
      ( MAKE-11CRATE-VERIFY ?auto_11137 ?auto_11138 ?auto_11139 ?auto_11140 ?auto_11141 ?auto_11142 ?auto_11143 ?auto_11144 ?auto_11145 ?auto_11146 ?auto_11147 ?auto_11148 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_11194 - SURFACE
      ?auto_11195 - SURFACE
      ?auto_11196 - SURFACE
      ?auto_11197 - SURFACE
      ?auto_11198 - SURFACE
      ?auto_11199 - SURFACE
      ?auto_11200 - SURFACE
      ?auto_11201 - SURFACE
      ?auto_11202 - SURFACE
      ?auto_11203 - SURFACE
      ?auto_11204 - SURFACE
      ?auto_11205 - SURFACE
      ?auto_11206 - SURFACE
    )
    :vars
    (
      ?auto_11212 - HOIST
      ?auto_11211 - PLACE
      ?auto_11209 - PLACE
      ?auto_11208 - HOIST
      ?auto_11207 - SURFACE
      ?auto_11226 - PLACE
      ?auto_11220 - HOIST
      ?auto_11224 - SURFACE
      ?auto_11225 - PLACE
      ?auto_11222 - HOIST
      ?auto_11215 - SURFACE
      ?auto_11213 - SURFACE
      ?auto_11218 - SURFACE
      ?auto_11229 - SURFACE
      ?auto_11227 - SURFACE
      ?auto_11221 - SURFACE
      ?auto_11216 - SURFACE
      ?auto_11228 - SURFACE
      ?auto_11214 - SURFACE
      ?auto_11217 - PLACE
      ?auto_11223 - HOIST
      ?auto_11219 - SURFACE
      ?auto_11210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11212 ?auto_11211 ) ( IS-CRATE ?auto_11206 ) ( not ( = ?auto_11209 ?auto_11211 ) ) ( HOIST-AT ?auto_11208 ?auto_11209 ) ( SURFACE-AT ?auto_11206 ?auto_11209 ) ( ON ?auto_11206 ?auto_11207 ) ( CLEAR ?auto_11206 ) ( not ( = ?auto_11205 ?auto_11206 ) ) ( not ( = ?auto_11205 ?auto_11207 ) ) ( not ( = ?auto_11206 ?auto_11207 ) ) ( not ( = ?auto_11212 ?auto_11208 ) ) ( IS-CRATE ?auto_11205 ) ( not ( = ?auto_11226 ?auto_11211 ) ) ( HOIST-AT ?auto_11220 ?auto_11226 ) ( SURFACE-AT ?auto_11205 ?auto_11226 ) ( ON ?auto_11205 ?auto_11224 ) ( CLEAR ?auto_11205 ) ( not ( = ?auto_11204 ?auto_11205 ) ) ( not ( = ?auto_11204 ?auto_11224 ) ) ( not ( = ?auto_11205 ?auto_11224 ) ) ( not ( = ?auto_11212 ?auto_11220 ) ) ( IS-CRATE ?auto_11204 ) ( not ( = ?auto_11225 ?auto_11211 ) ) ( HOIST-AT ?auto_11222 ?auto_11225 ) ( SURFACE-AT ?auto_11204 ?auto_11225 ) ( ON ?auto_11204 ?auto_11215 ) ( CLEAR ?auto_11204 ) ( not ( = ?auto_11203 ?auto_11204 ) ) ( not ( = ?auto_11203 ?auto_11215 ) ) ( not ( = ?auto_11204 ?auto_11215 ) ) ( not ( = ?auto_11212 ?auto_11222 ) ) ( IS-CRATE ?auto_11203 ) ( SURFACE-AT ?auto_11203 ?auto_11226 ) ( ON ?auto_11203 ?auto_11213 ) ( CLEAR ?auto_11203 ) ( not ( = ?auto_11202 ?auto_11203 ) ) ( not ( = ?auto_11202 ?auto_11213 ) ) ( not ( = ?auto_11203 ?auto_11213 ) ) ( IS-CRATE ?auto_11202 ) ( SURFACE-AT ?auto_11202 ?auto_11209 ) ( ON ?auto_11202 ?auto_11218 ) ( CLEAR ?auto_11202 ) ( not ( = ?auto_11201 ?auto_11202 ) ) ( not ( = ?auto_11201 ?auto_11218 ) ) ( not ( = ?auto_11202 ?auto_11218 ) ) ( IS-CRATE ?auto_11201 ) ( SURFACE-AT ?auto_11201 ?auto_11225 ) ( ON ?auto_11201 ?auto_11229 ) ( CLEAR ?auto_11201 ) ( not ( = ?auto_11200 ?auto_11201 ) ) ( not ( = ?auto_11200 ?auto_11229 ) ) ( not ( = ?auto_11201 ?auto_11229 ) ) ( IS-CRATE ?auto_11200 ) ( AVAILABLE ?auto_11208 ) ( SURFACE-AT ?auto_11200 ?auto_11209 ) ( ON ?auto_11200 ?auto_11227 ) ( CLEAR ?auto_11200 ) ( not ( = ?auto_11199 ?auto_11200 ) ) ( not ( = ?auto_11199 ?auto_11227 ) ) ( not ( = ?auto_11200 ?auto_11227 ) ) ( IS-CRATE ?auto_11199 ) ( SURFACE-AT ?auto_11199 ?auto_11225 ) ( ON ?auto_11199 ?auto_11221 ) ( CLEAR ?auto_11199 ) ( not ( = ?auto_11198 ?auto_11199 ) ) ( not ( = ?auto_11198 ?auto_11221 ) ) ( not ( = ?auto_11199 ?auto_11221 ) ) ( IS-CRATE ?auto_11198 ) ( AVAILABLE ?auto_11220 ) ( SURFACE-AT ?auto_11198 ?auto_11226 ) ( ON ?auto_11198 ?auto_11216 ) ( CLEAR ?auto_11198 ) ( not ( = ?auto_11197 ?auto_11198 ) ) ( not ( = ?auto_11197 ?auto_11216 ) ) ( not ( = ?auto_11198 ?auto_11216 ) ) ( IS-CRATE ?auto_11197 ) ( SURFACE-AT ?auto_11197 ?auto_11225 ) ( ON ?auto_11197 ?auto_11228 ) ( CLEAR ?auto_11197 ) ( not ( = ?auto_11196 ?auto_11197 ) ) ( not ( = ?auto_11196 ?auto_11228 ) ) ( not ( = ?auto_11197 ?auto_11228 ) ) ( IS-CRATE ?auto_11196 ) ( AVAILABLE ?auto_11222 ) ( SURFACE-AT ?auto_11196 ?auto_11225 ) ( ON ?auto_11196 ?auto_11214 ) ( CLEAR ?auto_11196 ) ( not ( = ?auto_11195 ?auto_11196 ) ) ( not ( = ?auto_11195 ?auto_11214 ) ) ( not ( = ?auto_11196 ?auto_11214 ) ) ( SURFACE-AT ?auto_11194 ?auto_11211 ) ( CLEAR ?auto_11194 ) ( IS-CRATE ?auto_11195 ) ( AVAILABLE ?auto_11212 ) ( not ( = ?auto_11217 ?auto_11211 ) ) ( HOIST-AT ?auto_11223 ?auto_11217 ) ( AVAILABLE ?auto_11223 ) ( SURFACE-AT ?auto_11195 ?auto_11217 ) ( ON ?auto_11195 ?auto_11219 ) ( CLEAR ?auto_11195 ) ( TRUCK-AT ?auto_11210 ?auto_11211 ) ( not ( = ?auto_11194 ?auto_11195 ) ) ( not ( = ?auto_11194 ?auto_11219 ) ) ( not ( = ?auto_11195 ?auto_11219 ) ) ( not ( = ?auto_11212 ?auto_11223 ) ) ( not ( = ?auto_11194 ?auto_11196 ) ) ( not ( = ?auto_11194 ?auto_11214 ) ) ( not ( = ?auto_11196 ?auto_11219 ) ) ( not ( = ?auto_11225 ?auto_11217 ) ) ( not ( = ?auto_11222 ?auto_11223 ) ) ( not ( = ?auto_11214 ?auto_11219 ) ) ( not ( = ?auto_11194 ?auto_11197 ) ) ( not ( = ?auto_11194 ?auto_11228 ) ) ( not ( = ?auto_11195 ?auto_11197 ) ) ( not ( = ?auto_11195 ?auto_11228 ) ) ( not ( = ?auto_11197 ?auto_11214 ) ) ( not ( = ?auto_11197 ?auto_11219 ) ) ( not ( = ?auto_11228 ?auto_11214 ) ) ( not ( = ?auto_11228 ?auto_11219 ) ) ( not ( = ?auto_11194 ?auto_11198 ) ) ( not ( = ?auto_11194 ?auto_11216 ) ) ( not ( = ?auto_11195 ?auto_11198 ) ) ( not ( = ?auto_11195 ?auto_11216 ) ) ( not ( = ?auto_11196 ?auto_11198 ) ) ( not ( = ?auto_11196 ?auto_11216 ) ) ( not ( = ?auto_11198 ?auto_11228 ) ) ( not ( = ?auto_11198 ?auto_11214 ) ) ( not ( = ?auto_11198 ?auto_11219 ) ) ( not ( = ?auto_11226 ?auto_11225 ) ) ( not ( = ?auto_11226 ?auto_11217 ) ) ( not ( = ?auto_11220 ?auto_11222 ) ) ( not ( = ?auto_11220 ?auto_11223 ) ) ( not ( = ?auto_11216 ?auto_11228 ) ) ( not ( = ?auto_11216 ?auto_11214 ) ) ( not ( = ?auto_11216 ?auto_11219 ) ) ( not ( = ?auto_11194 ?auto_11199 ) ) ( not ( = ?auto_11194 ?auto_11221 ) ) ( not ( = ?auto_11195 ?auto_11199 ) ) ( not ( = ?auto_11195 ?auto_11221 ) ) ( not ( = ?auto_11196 ?auto_11199 ) ) ( not ( = ?auto_11196 ?auto_11221 ) ) ( not ( = ?auto_11197 ?auto_11199 ) ) ( not ( = ?auto_11197 ?auto_11221 ) ) ( not ( = ?auto_11199 ?auto_11216 ) ) ( not ( = ?auto_11199 ?auto_11228 ) ) ( not ( = ?auto_11199 ?auto_11214 ) ) ( not ( = ?auto_11199 ?auto_11219 ) ) ( not ( = ?auto_11221 ?auto_11216 ) ) ( not ( = ?auto_11221 ?auto_11228 ) ) ( not ( = ?auto_11221 ?auto_11214 ) ) ( not ( = ?auto_11221 ?auto_11219 ) ) ( not ( = ?auto_11194 ?auto_11200 ) ) ( not ( = ?auto_11194 ?auto_11227 ) ) ( not ( = ?auto_11195 ?auto_11200 ) ) ( not ( = ?auto_11195 ?auto_11227 ) ) ( not ( = ?auto_11196 ?auto_11200 ) ) ( not ( = ?auto_11196 ?auto_11227 ) ) ( not ( = ?auto_11197 ?auto_11200 ) ) ( not ( = ?auto_11197 ?auto_11227 ) ) ( not ( = ?auto_11198 ?auto_11200 ) ) ( not ( = ?auto_11198 ?auto_11227 ) ) ( not ( = ?auto_11200 ?auto_11221 ) ) ( not ( = ?auto_11200 ?auto_11216 ) ) ( not ( = ?auto_11200 ?auto_11228 ) ) ( not ( = ?auto_11200 ?auto_11214 ) ) ( not ( = ?auto_11200 ?auto_11219 ) ) ( not ( = ?auto_11209 ?auto_11225 ) ) ( not ( = ?auto_11209 ?auto_11226 ) ) ( not ( = ?auto_11209 ?auto_11217 ) ) ( not ( = ?auto_11208 ?auto_11222 ) ) ( not ( = ?auto_11208 ?auto_11220 ) ) ( not ( = ?auto_11208 ?auto_11223 ) ) ( not ( = ?auto_11227 ?auto_11221 ) ) ( not ( = ?auto_11227 ?auto_11216 ) ) ( not ( = ?auto_11227 ?auto_11228 ) ) ( not ( = ?auto_11227 ?auto_11214 ) ) ( not ( = ?auto_11227 ?auto_11219 ) ) ( not ( = ?auto_11194 ?auto_11201 ) ) ( not ( = ?auto_11194 ?auto_11229 ) ) ( not ( = ?auto_11195 ?auto_11201 ) ) ( not ( = ?auto_11195 ?auto_11229 ) ) ( not ( = ?auto_11196 ?auto_11201 ) ) ( not ( = ?auto_11196 ?auto_11229 ) ) ( not ( = ?auto_11197 ?auto_11201 ) ) ( not ( = ?auto_11197 ?auto_11229 ) ) ( not ( = ?auto_11198 ?auto_11201 ) ) ( not ( = ?auto_11198 ?auto_11229 ) ) ( not ( = ?auto_11199 ?auto_11201 ) ) ( not ( = ?auto_11199 ?auto_11229 ) ) ( not ( = ?auto_11201 ?auto_11227 ) ) ( not ( = ?auto_11201 ?auto_11221 ) ) ( not ( = ?auto_11201 ?auto_11216 ) ) ( not ( = ?auto_11201 ?auto_11228 ) ) ( not ( = ?auto_11201 ?auto_11214 ) ) ( not ( = ?auto_11201 ?auto_11219 ) ) ( not ( = ?auto_11229 ?auto_11227 ) ) ( not ( = ?auto_11229 ?auto_11221 ) ) ( not ( = ?auto_11229 ?auto_11216 ) ) ( not ( = ?auto_11229 ?auto_11228 ) ) ( not ( = ?auto_11229 ?auto_11214 ) ) ( not ( = ?auto_11229 ?auto_11219 ) ) ( not ( = ?auto_11194 ?auto_11202 ) ) ( not ( = ?auto_11194 ?auto_11218 ) ) ( not ( = ?auto_11195 ?auto_11202 ) ) ( not ( = ?auto_11195 ?auto_11218 ) ) ( not ( = ?auto_11196 ?auto_11202 ) ) ( not ( = ?auto_11196 ?auto_11218 ) ) ( not ( = ?auto_11197 ?auto_11202 ) ) ( not ( = ?auto_11197 ?auto_11218 ) ) ( not ( = ?auto_11198 ?auto_11202 ) ) ( not ( = ?auto_11198 ?auto_11218 ) ) ( not ( = ?auto_11199 ?auto_11202 ) ) ( not ( = ?auto_11199 ?auto_11218 ) ) ( not ( = ?auto_11200 ?auto_11202 ) ) ( not ( = ?auto_11200 ?auto_11218 ) ) ( not ( = ?auto_11202 ?auto_11229 ) ) ( not ( = ?auto_11202 ?auto_11227 ) ) ( not ( = ?auto_11202 ?auto_11221 ) ) ( not ( = ?auto_11202 ?auto_11216 ) ) ( not ( = ?auto_11202 ?auto_11228 ) ) ( not ( = ?auto_11202 ?auto_11214 ) ) ( not ( = ?auto_11202 ?auto_11219 ) ) ( not ( = ?auto_11218 ?auto_11229 ) ) ( not ( = ?auto_11218 ?auto_11227 ) ) ( not ( = ?auto_11218 ?auto_11221 ) ) ( not ( = ?auto_11218 ?auto_11216 ) ) ( not ( = ?auto_11218 ?auto_11228 ) ) ( not ( = ?auto_11218 ?auto_11214 ) ) ( not ( = ?auto_11218 ?auto_11219 ) ) ( not ( = ?auto_11194 ?auto_11203 ) ) ( not ( = ?auto_11194 ?auto_11213 ) ) ( not ( = ?auto_11195 ?auto_11203 ) ) ( not ( = ?auto_11195 ?auto_11213 ) ) ( not ( = ?auto_11196 ?auto_11203 ) ) ( not ( = ?auto_11196 ?auto_11213 ) ) ( not ( = ?auto_11197 ?auto_11203 ) ) ( not ( = ?auto_11197 ?auto_11213 ) ) ( not ( = ?auto_11198 ?auto_11203 ) ) ( not ( = ?auto_11198 ?auto_11213 ) ) ( not ( = ?auto_11199 ?auto_11203 ) ) ( not ( = ?auto_11199 ?auto_11213 ) ) ( not ( = ?auto_11200 ?auto_11203 ) ) ( not ( = ?auto_11200 ?auto_11213 ) ) ( not ( = ?auto_11201 ?auto_11203 ) ) ( not ( = ?auto_11201 ?auto_11213 ) ) ( not ( = ?auto_11203 ?auto_11218 ) ) ( not ( = ?auto_11203 ?auto_11229 ) ) ( not ( = ?auto_11203 ?auto_11227 ) ) ( not ( = ?auto_11203 ?auto_11221 ) ) ( not ( = ?auto_11203 ?auto_11216 ) ) ( not ( = ?auto_11203 ?auto_11228 ) ) ( not ( = ?auto_11203 ?auto_11214 ) ) ( not ( = ?auto_11203 ?auto_11219 ) ) ( not ( = ?auto_11213 ?auto_11218 ) ) ( not ( = ?auto_11213 ?auto_11229 ) ) ( not ( = ?auto_11213 ?auto_11227 ) ) ( not ( = ?auto_11213 ?auto_11221 ) ) ( not ( = ?auto_11213 ?auto_11216 ) ) ( not ( = ?auto_11213 ?auto_11228 ) ) ( not ( = ?auto_11213 ?auto_11214 ) ) ( not ( = ?auto_11213 ?auto_11219 ) ) ( not ( = ?auto_11194 ?auto_11204 ) ) ( not ( = ?auto_11194 ?auto_11215 ) ) ( not ( = ?auto_11195 ?auto_11204 ) ) ( not ( = ?auto_11195 ?auto_11215 ) ) ( not ( = ?auto_11196 ?auto_11204 ) ) ( not ( = ?auto_11196 ?auto_11215 ) ) ( not ( = ?auto_11197 ?auto_11204 ) ) ( not ( = ?auto_11197 ?auto_11215 ) ) ( not ( = ?auto_11198 ?auto_11204 ) ) ( not ( = ?auto_11198 ?auto_11215 ) ) ( not ( = ?auto_11199 ?auto_11204 ) ) ( not ( = ?auto_11199 ?auto_11215 ) ) ( not ( = ?auto_11200 ?auto_11204 ) ) ( not ( = ?auto_11200 ?auto_11215 ) ) ( not ( = ?auto_11201 ?auto_11204 ) ) ( not ( = ?auto_11201 ?auto_11215 ) ) ( not ( = ?auto_11202 ?auto_11204 ) ) ( not ( = ?auto_11202 ?auto_11215 ) ) ( not ( = ?auto_11204 ?auto_11213 ) ) ( not ( = ?auto_11204 ?auto_11218 ) ) ( not ( = ?auto_11204 ?auto_11229 ) ) ( not ( = ?auto_11204 ?auto_11227 ) ) ( not ( = ?auto_11204 ?auto_11221 ) ) ( not ( = ?auto_11204 ?auto_11216 ) ) ( not ( = ?auto_11204 ?auto_11228 ) ) ( not ( = ?auto_11204 ?auto_11214 ) ) ( not ( = ?auto_11204 ?auto_11219 ) ) ( not ( = ?auto_11215 ?auto_11213 ) ) ( not ( = ?auto_11215 ?auto_11218 ) ) ( not ( = ?auto_11215 ?auto_11229 ) ) ( not ( = ?auto_11215 ?auto_11227 ) ) ( not ( = ?auto_11215 ?auto_11221 ) ) ( not ( = ?auto_11215 ?auto_11216 ) ) ( not ( = ?auto_11215 ?auto_11228 ) ) ( not ( = ?auto_11215 ?auto_11214 ) ) ( not ( = ?auto_11215 ?auto_11219 ) ) ( not ( = ?auto_11194 ?auto_11205 ) ) ( not ( = ?auto_11194 ?auto_11224 ) ) ( not ( = ?auto_11195 ?auto_11205 ) ) ( not ( = ?auto_11195 ?auto_11224 ) ) ( not ( = ?auto_11196 ?auto_11205 ) ) ( not ( = ?auto_11196 ?auto_11224 ) ) ( not ( = ?auto_11197 ?auto_11205 ) ) ( not ( = ?auto_11197 ?auto_11224 ) ) ( not ( = ?auto_11198 ?auto_11205 ) ) ( not ( = ?auto_11198 ?auto_11224 ) ) ( not ( = ?auto_11199 ?auto_11205 ) ) ( not ( = ?auto_11199 ?auto_11224 ) ) ( not ( = ?auto_11200 ?auto_11205 ) ) ( not ( = ?auto_11200 ?auto_11224 ) ) ( not ( = ?auto_11201 ?auto_11205 ) ) ( not ( = ?auto_11201 ?auto_11224 ) ) ( not ( = ?auto_11202 ?auto_11205 ) ) ( not ( = ?auto_11202 ?auto_11224 ) ) ( not ( = ?auto_11203 ?auto_11205 ) ) ( not ( = ?auto_11203 ?auto_11224 ) ) ( not ( = ?auto_11205 ?auto_11215 ) ) ( not ( = ?auto_11205 ?auto_11213 ) ) ( not ( = ?auto_11205 ?auto_11218 ) ) ( not ( = ?auto_11205 ?auto_11229 ) ) ( not ( = ?auto_11205 ?auto_11227 ) ) ( not ( = ?auto_11205 ?auto_11221 ) ) ( not ( = ?auto_11205 ?auto_11216 ) ) ( not ( = ?auto_11205 ?auto_11228 ) ) ( not ( = ?auto_11205 ?auto_11214 ) ) ( not ( = ?auto_11205 ?auto_11219 ) ) ( not ( = ?auto_11224 ?auto_11215 ) ) ( not ( = ?auto_11224 ?auto_11213 ) ) ( not ( = ?auto_11224 ?auto_11218 ) ) ( not ( = ?auto_11224 ?auto_11229 ) ) ( not ( = ?auto_11224 ?auto_11227 ) ) ( not ( = ?auto_11224 ?auto_11221 ) ) ( not ( = ?auto_11224 ?auto_11216 ) ) ( not ( = ?auto_11224 ?auto_11228 ) ) ( not ( = ?auto_11224 ?auto_11214 ) ) ( not ( = ?auto_11224 ?auto_11219 ) ) ( not ( = ?auto_11194 ?auto_11206 ) ) ( not ( = ?auto_11194 ?auto_11207 ) ) ( not ( = ?auto_11195 ?auto_11206 ) ) ( not ( = ?auto_11195 ?auto_11207 ) ) ( not ( = ?auto_11196 ?auto_11206 ) ) ( not ( = ?auto_11196 ?auto_11207 ) ) ( not ( = ?auto_11197 ?auto_11206 ) ) ( not ( = ?auto_11197 ?auto_11207 ) ) ( not ( = ?auto_11198 ?auto_11206 ) ) ( not ( = ?auto_11198 ?auto_11207 ) ) ( not ( = ?auto_11199 ?auto_11206 ) ) ( not ( = ?auto_11199 ?auto_11207 ) ) ( not ( = ?auto_11200 ?auto_11206 ) ) ( not ( = ?auto_11200 ?auto_11207 ) ) ( not ( = ?auto_11201 ?auto_11206 ) ) ( not ( = ?auto_11201 ?auto_11207 ) ) ( not ( = ?auto_11202 ?auto_11206 ) ) ( not ( = ?auto_11202 ?auto_11207 ) ) ( not ( = ?auto_11203 ?auto_11206 ) ) ( not ( = ?auto_11203 ?auto_11207 ) ) ( not ( = ?auto_11204 ?auto_11206 ) ) ( not ( = ?auto_11204 ?auto_11207 ) ) ( not ( = ?auto_11206 ?auto_11224 ) ) ( not ( = ?auto_11206 ?auto_11215 ) ) ( not ( = ?auto_11206 ?auto_11213 ) ) ( not ( = ?auto_11206 ?auto_11218 ) ) ( not ( = ?auto_11206 ?auto_11229 ) ) ( not ( = ?auto_11206 ?auto_11227 ) ) ( not ( = ?auto_11206 ?auto_11221 ) ) ( not ( = ?auto_11206 ?auto_11216 ) ) ( not ( = ?auto_11206 ?auto_11228 ) ) ( not ( = ?auto_11206 ?auto_11214 ) ) ( not ( = ?auto_11206 ?auto_11219 ) ) ( not ( = ?auto_11207 ?auto_11224 ) ) ( not ( = ?auto_11207 ?auto_11215 ) ) ( not ( = ?auto_11207 ?auto_11213 ) ) ( not ( = ?auto_11207 ?auto_11218 ) ) ( not ( = ?auto_11207 ?auto_11229 ) ) ( not ( = ?auto_11207 ?auto_11227 ) ) ( not ( = ?auto_11207 ?auto_11221 ) ) ( not ( = ?auto_11207 ?auto_11216 ) ) ( not ( = ?auto_11207 ?auto_11228 ) ) ( not ( = ?auto_11207 ?auto_11214 ) ) ( not ( = ?auto_11207 ?auto_11219 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_11194 ?auto_11195 ?auto_11196 ?auto_11197 ?auto_11198 ?auto_11199 ?auto_11200 ?auto_11201 ?auto_11202 ?auto_11203 ?auto_11204 ?auto_11205 )
      ( MAKE-1CRATE ?auto_11205 ?auto_11206 )
      ( MAKE-12CRATE-VERIFY ?auto_11194 ?auto_11195 ?auto_11196 ?auto_11197 ?auto_11198 ?auto_11199 ?auto_11200 ?auto_11201 ?auto_11202 ?auto_11203 ?auto_11204 ?auto_11205 ?auto_11206 ) )
  )

)

