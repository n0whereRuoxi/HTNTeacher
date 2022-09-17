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
      ?auto_12820 - SURFACE
      ?auto_12821 - SURFACE
    )
    :vars
    (
      ?auto_12822 - HOIST
      ?auto_12823 - PLACE
      ?auto_12825 - PLACE
      ?auto_12826 - HOIST
      ?auto_12827 - SURFACE
      ?auto_12824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12822 ?auto_12823 ) ( SURFACE-AT ?auto_12820 ?auto_12823 ) ( CLEAR ?auto_12820 ) ( IS-CRATE ?auto_12821 ) ( AVAILABLE ?auto_12822 ) ( not ( = ?auto_12825 ?auto_12823 ) ) ( HOIST-AT ?auto_12826 ?auto_12825 ) ( AVAILABLE ?auto_12826 ) ( SURFACE-AT ?auto_12821 ?auto_12825 ) ( ON ?auto_12821 ?auto_12827 ) ( CLEAR ?auto_12821 ) ( TRUCK-AT ?auto_12824 ?auto_12823 ) ( not ( = ?auto_12820 ?auto_12821 ) ) ( not ( = ?auto_12820 ?auto_12827 ) ) ( not ( = ?auto_12821 ?auto_12827 ) ) ( not ( = ?auto_12822 ?auto_12826 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12824 ?auto_12823 ?auto_12825 )
      ( !LIFT ?auto_12826 ?auto_12821 ?auto_12827 ?auto_12825 )
      ( !LOAD ?auto_12826 ?auto_12821 ?auto_12824 ?auto_12825 )
      ( !DRIVE ?auto_12824 ?auto_12825 ?auto_12823 )
      ( !UNLOAD ?auto_12822 ?auto_12821 ?auto_12824 ?auto_12823 )
      ( !DROP ?auto_12822 ?auto_12821 ?auto_12820 ?auto_12823 )
      ( MAKE-1CRATE-VERIFY ?auto_12820 ?auto_12821 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12830 - SURFACE
      ?auto_12831 - SURFACE
    )
    :vars
    (
      ?auto_12832 - HOIST
      ?auto_12833 - PLACE
      ?auto_12835 - PLACE
      ?auto_12836 - HOIST
      ?auto_12837 - SURFACE
      ?auto_12834 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12832 ?auto_12833 ) ( SURFACE-AT ?auto_12830 ?auto_12833 ) ( CLEAR ?auto_12830 ) ( IS-CRATE ?auto_12831 ) ( AVAILABLE ?auto_12832 ) ( not ( = ?auto_12835 ?auto_12833 ) ) ( HOIST-AT ?auto_12836 ?auto_12835 ) ( AVAILABLE ?auto_12836 ) ( SURFACE-AT ?auto_12831 ?auto_12835 ) ( ON ?auto_12831 ?auto_12837 ) ( CLEAR ?auto_12831 ) ( TRUCK-AT ?auto_12834 ?auto_12833 ) ( not ( = ?auto_12830 ?auto_12831 ) ) ( not ( = ?auto_12830 ?auto_12837 ) ) ( not ( = ?auto_12831 ?auto_12837 ) ) ( not ( = ?auto_12832 ?auto_12836 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12834 ?auto_12833 ?auto_12835 )
      ( !LIFT ?auto_12836 ?auto_12831 ?auto_12837 ?auto_12835 )
      ( !LOAD ?auto_12836 ?auto_12831 ?auto_12834 ?auto_12835 )
      ( !DRIVE ?auto_12834 ?auto_12835 ?auto_12833 )
      ( !UNLOAD ?auto_12832 ?auto_12831 ?auto_12834 ?auto_12833 )
      ( !DROP ?auto_12832 ?auto_12831 ?auto_12830 ?auto_12833 )
      ( MAKE-1CRATE-VERIFY ?auto_12830 ?auto_12831 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12841 - SURFACE
      ?auto_12842 - SURFACE
      ?auto_12843 - SURFACE
    )
    :vars
    (
      ?auto_12845 - HOIST
      ?auto_12844 - PLACE
      ?auto_12847 - PLACE
      ?auto_12849 - HOIST
      ?auto_12848 - SURFACE
      ?auto_12850 - PLACE
      ?auto_12852 - HOIST
      ?auto_12851 - SURFACE
      ?auto_12846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12845 ?auto_12844 ) ( IS-CRATE ?auto_12843 ) ( not ( = ?auto_12847 ?auto_12844 ) ) ( HOIST-AT ?auto_12849 ?auto_12847 ) ( AVAILABLE ?auto_12849 ) ( SURFACE-AT ?auto_12843 ?auto_12847 ) ( ON ?auto_12843 ?auto_12848 ) ( CLEAR ?auto_12843 ) ( not ( = ?auto_12842 ?auto_12843 ) ) ( not ( = ?auto_12842 ?auto_12848 ) ) ( not ( = ?auto_12843 ?auto_12848 ) ) ( not ( = ?auto_12845 ?auto_12849 ) ) ( SURFACE-AT ?auto_12841 ?auto_12844 ) ( CLEAR ?auto_12841 ) ( IS-CRATE ?auto_12842 ) ( AVAILABLE ?auto_12845 ) ( not ( = ?auto_12850 ?auto_12844 ) ) ( HOIST-AT ?auto_12852 ?auto_12850 ) ( AVAILABLE ?auto_12852 ) ( SURFACE-AT ?auto_12842 ?auto_12850 ) ( ON ?auto_12842 ?auto_12851 ) ( CLEAR ?auto_12842 ) ( TRUCK-AT ?auto_12846 ?auto_12844 ) ( not ( = ?auto_12841 ?auto_12842 ) ) ( not ( = ?auto_12841 ?auto_12851 ) ) ( not ( = ?auto_12842 ?auto_12851 ) ) ( not ( = ?auto_12845 ?auto_12852 ) ) ( not ( = ?auto_12841 ?auto_12843 ) ) ( not ( = ?auto_12841 ?auto_12848 ) ) ( not ( = ?auto_12843 ?auto_12851 ) ) ( not ( = ?auto_12847 ?auto_12850 ) ) ( not ( = ?auto_12849 ?auto_12852 ) ) ( not ( = ?auto_12848 ?auto_12851 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12841 ?auto_12842 )
      ( MAKE-1CRATE ?auto_12842 ?auto_12843 )
      ( MAKE-2CRATE-VERIFY ?auto_12841 ?auto_12842 ?auto_12843 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12855 - SURFACE
      ?auto_12856 - SURFACE
    )
    :vars
    (
      ?auto_12857 - HOIST
      ?auto_12858 - PLACE
      ?auto_12860 - PLACE
      ?auto_12861 - HOIST
      ?auto_12862 - SURFACE
      ?auto_12859 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12857 ?auto_12858 ) ( SURFACE-AT ?auto_12855 ?auto_12858 ) ( CLEAR ?auto_12855 ) ( IS-CRATE ?auto_12856 ) ( AVAILABLE ?auto_12857 ) ( not ( = ?auto_12860 ?auto_12858 ) ) ( HOIST-AT ?auto_12861 ?auto_12860 ) ( AVAILABLE ?auto_12861 ) ( SURFACE-AT ?auto_12856 ?auto_12860 ) ( ON ?auto_12856 ?auto_12862 ) ( CLEAR ?auto_12856 ) ( TRUCK-AT ?auto_12859 ?auto_12858 ) ( not ( = ?auto_12855 ?auto_12856 ) ) ( not ( = ?auto_12855 ?auto_12862 ) ) ( not ( = ?auto_12856 ?auto_12862 ) ) ( not ( = ?auto_12857 ?auto_12861 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12859 ?auto_12858 ?auto_12860 )
      ( !LIFT ?auto_12861 ?auto_12856 ?auto_12862 ?auto_12860 )
      ( !LOAD ?auto_12861 ?auto_12856 ?auto_12859 ?auto_12860 )
      ( !DRIVE ?auto_12859 ?auto_12860 ?auto_12858 )
      ( !UNLOAD ?auto_12857 ?auto_12856 ?auto_12859 ?auto_12858 )
      ( !DROP ?auto_12857 ?auto_12856 ?auto_12855 ?auto_12858 )
      ( MAKE-1CRATE-VERIFY ?auto_12855 ?auto_12856 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12867 - SURFACE
      ?auto_12868 - SURFACE
      ?auto_12869 - SURFACE
      ?auto_12870 - SURFACE
    )
    :vars
    (
      ?auto_12873 - HOIST
      ?auto_12872 - PLACE
      ?auto_12876 - PLACE
      ?auto_12874 - HOIST
      ?auto_12875 - SURFACE
      ?auto_12878 - PLACE
      ?auto_12882 - HOIST
      ?auto_12880 - SURFACE
      ?auto_12881 - PLACE
      ?auto_12877 - HOIST
      ?auto_12879 - SURFACE
      ?auto_12871 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12873 ?auto_12872 ) ( IS-CRATE ?auto_12870 ) ( not ( = ?auto_12876 ?auto_12872 ) ) ( HOIST-AT ?auto_12874 ?auto_12876 ) ( AVAILABLE ?auto_12874 ) ( SURFACE-AT ?auto_12870 ?auto_12876 ) ( ON ?auto_12870 ?auto_12875 ) ( CLEAR ?auto_12870 ) ( not ( = ?auto_12869 ?auto_12870 ) ) ( not ( = ?auto_12869 ?auto_12875 ) ) ( not ( = ?auto_12870 ?auto_12875 ) ) ( not ( = ?auto_12873 ?auto_12874 ) ) ( IS-CRATE ?auto_12869 ) ( not ( = ?auto_12878 ?auto_12872 ) ) ( HOIST-AT ?auto_12882 ?auto_12878 ) ( AVAILABLE ?auto_12882 ) ( SURFACE-AT ?auto_12869 ?auto_12878 ) ( ON ?auto_12869 ?auto_12880 ) ( CLEAR ?auto_12869 ) ( not ( = ?auto_12868 ?auto_12869 ) ) ( not ( = ?auto_12868 ?auto_12880 ) ) ( not ( = ?auto_12869 ?auto_12880 ) ) ( not ( = ?auto_12873 ?auto_12882 ) ) ( SURFACE-AT ?auto_12867 ?auto_12872 ) ( CLEAR ?auto_12867 ) ( IS-CRATE ?auto_12868 ) ( AVAILABLE ?auto_12873 ) ( not ( = ?auto_12881 ?auto_12872 ) ) ( HOIST-AT ?auto_12877 ?auto_12881 ) ( AVAILABLE ?auto_12877 ) ( SURFACE-AT ?auto_12868 ?auto_12881 ) ( ON ?auto_12868 ?auto_12879 ) ( CLEAR ?auto_12868 ) ( TRUCK-AT ?auto_12871 ?auto_12872 ) ( not ( = ?auto_12867 ?auto_12868 ) ) ( not ( = ?auto_12867 ?auto_12879 ) ) ( not ( = ?auto_12868 ?auto_12879 ) ) ( not ( = ?auto_12873 ?auto_12877 ) ) ( not ( = ?auto_12867 ?auto_12869 ) ) ( not ( = ?auto_12867 ?auto_12880 ) ) ( not ( = ?auto_12869 ?auto_12879 ) ) ( not ( = ?auto_12878 ?auto_12881 ) ) ( not ( = ?auto_12882 ?auto_12877 ) ) ( not ( = ?auto_12880 ?auto_12879 ) ) ( not ( = ?auto_12867 ?auto_12870 ) ) ( not ( = ?auto_12867 ?auto_12875 ) ) ( not ( = ?auto_12868 ?auto_12870 ) ) ( not ( = ?auto_12868 ?auto_12875 ) ) ( not ( = ?auto_12870 ?auto_12880 ) ) ( not ( = ?auto_12870 ?auto_12879 ) ) ( not ( = ?auto_12876 ?auto_12878 ) ) ( not ( = ?auto_12876 ?auto_12881 ) ) ( not ( = ?auto_12874 ?auto_12882 ) ) ( not ( = ?auto_12874 ?auto_12877 ) ) ( not ( = ?auto_12875 ?auto_12880 ) ) ( not ( = ?auto_12875 ?auto_12879 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12867 ?auto_12868 ?auto_12869 )
      ( MAKE-1CRATE ?auto_12869 ?auto_12870 )
      ( MAKE-3CRATE-VERIFY ?auto_12867 ?auto_12868 ?auto_12869 ?auto_12870 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12885 - SURFACE
      ?auto_12886 - SURFACE
    )
    :vars
    (
      ?auto_12887 - HOIST
      ?auto_12888 - PLACE
      ?auto_12890 - PLACE
      ?auto_12891 - HOIST
      ?auto_12892 - SURFACE
      ?auto_12889 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12887 ?auto_12888 ) ( SURFACE-AT ?auto_12885 ?auto_12888 ) ( CLEAR ?auto_12885 ) ( IS-CRATE ?auto_12886 ) ( AVAILABLE ?auto_12887 ) ( not ( = ?auto_12890 ?auto_12888 ) ) ( HOIST-AT ?auto_12891 ?auto_12890 ) ( AVAILABLE ?auto_12891 ) ( SURFACE-AT ?auto_12886 ?auto_12890 ) ( ON ?auto_12886 ?auto_12892 ) ( CLEAR ?auto_12886 ) ( TRUCK-AT ?auto_12889 ?auto_12888 ) ( not ( = ?auto_12885 ?auto_12886 ) ) ( not ( = ?auto_12885 ?auto_12892 ) ) ( not ( = ?auto_12886 ?auto_12892 ) ) ( not ( = ?auto_12887 ?auto_12891 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12889 ?auto_12888 ?auto_12890 )
      ( !LIFT ?auto_12891 ?auto_12886 ?auto_12892 ?auto_12890 )
      ( !LOAD ?auto_12891 ?auto_12886 ?auto_12889 ?auto_12890 )
      ( !DRIVE ?auto_12889 ?auto_12890 ?auto_12888 )
      ( !UNLOAD ?auto_12887 ?auto_12886 ?auto_12889 ?auto_12888 )
      ( !DROP ?auto_12887 ?auto_12886 ?auto_12885 ?auto_12888 )
      ( MAKE-1CRATE-VERIFY ?auto_12885 ?auto_12886 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12898 - SURFACE
      ?auto_12899 - SURFACE
      ?auto_12900 - SURFACE
      ?auto_12901 - SURFACE
      ?auto_12902 - SURFACE
    )
    :vars
    (
      ?auto_12906 - HOIST
      ?auto_12904 - PLACE
      ?auto_12905 - PLACE
      ?auto_12903 - HOIST
      ?auto_12907 - SURFACE
      ?auto_12911 - PLACE
      ?auto_12909 - HOIST
      ?auto_12914 - SURFACE
      ?auto_12912 - PLACE
      ?auto_12910 - HOIST
      ?auto_12913 - SURFACE
      ?auto_12915 - SURFACE
      ?auto_12908 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12906 ?auto_12904 ) ( IS-CRATE ?auto_12902 ) ( not ( = ?auto_12905 ?auto_12904 ) ) ( HOIST-AT ?auto_12903 ?auto_12905 ) ( SURFACE-AT ?auto_12902 ?auto_12905 ) ( ON ?auto_12902 ?auto_12907 ) ( CLEAR ?auto_12902 ) ( not ( = ?auto_12901 ?auto_12902 ) ) ( not ( = ?auto_12901 ?auto_12907 ) ) ( not ( = ?auto_12902 ?auto_12907 ) ) ( not ( = ?auto_12906 ?auto_12903 ) ) ( IS-CRATE ?auto_12901 ) ( not ( = ?auto_12911 ?auto_12904 ) ) ( HOIST-AT ?auto_12909 ?auto_12911 ) ( AVAILABLE ?auto_12909 ) ( SURFACE-AT ?auto_12901 ?auto_12911 ) ( ON ?auto_12901 ?auto_12914 ) ( CLEAR ?auto_12901 ) ( not ( = ?auto_12900 ?auto_12901 ) ) ( not ( = ?auto_12900 ?auto_12914 ) ) ( not ( = ?auto_12901 ?auto_12914 ) ) ( not ( = ?auto_12906 ?auto_12909 ) ) ( IS-CRATE ?auto_12900 ) ( not ( = ?auto_12912 ?auto_12904 ) ) ( HOIST-AT ?auto_12910 ?auto_12912 ) ( AVAILABLE ?auto_12910 ) ( SURFACE-AT ?auto_12900 ?auto_12912 ) ( ON ?auto_12900 ?auto_12913 ) ( CLEAR ?auto_12900 ) ( not ( = ?auto_12899 ?auto_12900 ) ) ( not ( = ?auto_12899 ?auto_12913 ) ) ( not ( = ?auto_12900 ?auto_12913 ) ) ( not ( = ?auto_12906 ?auto_12910 ) ) ( SURFACE-AT ?auto_12898 ?auto_12904 ) ( CLEAR ?auto_12898 ) ( IS-CRATE ?auto_12899 ) ( AVAILABLE ?auto_12906 ) ( AVAILABLE ?auto_12903 ) ( SURFACE-AT ?auto_12899 ?auto_12905 ) ( ON ?auto_12899 ?auto_12915 ) ( CLEAR ?auto_12899 ) ( TRUCK-AT ?auto_12908 ?auto_12904 ) ( not ( = ?auto_12898 ?auto_12899 ) ) ( not ( = ?auto_12898 ?auto_12915 ) ) ( not ( = ?auto_12899 ?auto_12915 ) ) ( not ( = ?auto_12898 ?auto_12900 ) ) ( not ( = ?auto_12898 ?auto_12913 ) ) ( not ( = ?auto_12900 ?auto_12915 ) ) ( not ( = ?auto_12912 ?auto_12905 ) ) ( not ( = ?auto_12910 ?auto_12903 ) ) ( not ( = ?auto_12913 ?auto_12915 ) ) ( not ( = ?auto_12898 ?auto_12901 ) ) ( not ( = ?auto_12898 ?auto_12914 ) ) ( not ( = ?auto_12899 ?auto_12901 ) ) ( not ( = ?auto_12899 ?auto_12914 ) ) ( not ( = ?auto_12901 ?auto_12913 ) ) ( not ( = ?auto_12901 ?auto_12915 ) ) ( not ( = ?auto_12911 ?auto_12912 ) ) ( not ( = ?auto_12911 ?auto_12905 ) ) ( not ( = ?auto_12909 ?auto_12910 ) ) ( not ( = ?auto_12909 ?auto_12903 ) ) ( not ( = ?auto_12914 ?auto_12913 ) ) ( not ( = ?auto_12914 ?auto_12915 ) ) ( not ( = ?auto_12898 ?auto_12902 ) ) ( not ( = ?auto_12898 ?auto_12907 ) ) ( not ( = ?auto_12899 ?auto_12902 ) ) ( not ( = ?auto_12899 ?auto_12907 ) ) ( not ( = ?auto_12900 ?auto_12902 ) ) ( not ( = ?auto_12900 ?auto_12907 ) ) ( not ( = ?auto_12902 ?auto_12914 ) ) ( not ( = ?auto_12902 ?auto_12913 ) ) ( not ( = ?auto_12902 ?auto_12915 ) ) ( not ( = ?auto_12907 ?auto_12914 ) ) ( not ( = ?auto_12907 ?auto_12913 ) ) ( not ( = ?auto_12907 ?auto_12915 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_12898 ?auto_12899 ?auto_12900 ?auto_12901 )
      ( MAKE-1CRATE ?auto_12901 ?auto_12902 )
      ( MAKE-4CRATE-VERIFY ?auto_12898 ?auto_12899 ?auto_12900 ?auto_12901 ?auto_12902 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12918 - SURFACE
      ?auto_12919 - SURFACE
    )
    :vars
    (
      ?auto_12920 - HOIST
      ?auto_12921 - PLACE
      ?auto_12923 - PLACE
      ?auto_12924 - HOIST
      ?auto_12925 - SURFACE
      ?auto_12922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12920 ?auto_12921 ) ( SURFACE-AT ?auto_12918 ?auto_12921 ) ( CLEAR ?auto_12918 ) ( IS-CRATE ?auto_12919 ) ( AVAILABLE ?auto_12920 ) ( not ( = ?auto_12923 ?auto_12921 ) ) ( HOIST-AT ?auto_12924 ?auto_12923 ) ( AVAILABLE ?auto_12924 ) ( SURFACE-AT ?auto_12919 ?auto_12923 ) ( ON ?auto_12919 ?auto_12925 ) ( CLEAR ?auto_12919 ) ( TRUCK-AT ?auto_12922 ?auto_12921 ) ( not ( = ?auto_12918 ?auto_12919 ) ) ( not ( = ?auto_12918 ?auto_12925 ) ) ( not ( = ?auto_12919 ?auto_12925 ) ) ( not ( = ?auto_12920 ?auto_12924 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12922 ?auto_12921 ?auto_12923 )
      ( !LIFT ?auto_12924 ?auto_12919 ?auto_12925 ?auto_12923 )
      ( !LOAD ?auto_12924 ?auto_12919 ?auto_12922 ?auto_12923 )
      ( !DRIVE ?auto_12922 ?auto_12923 ?auto_12921 )
      ( !UNLOAD ?auto_12920 ?auto_12919 ?auto_12922 ?auto_12921 )
      ( !DROP ?auto_12920 ?auto_12919 ?auto_12918 ?auto_12921 )
      ( MAKE-1CRATE-VERIFY ?auto_12918 ?auto_12919 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_12932 - SURFACE
      ?auto_12933 - SURFACE
      ?auto_12934 - SURFACE
      ?auto_12935 - SURFACE
      ?auto_12936 - SURFACE
      ?auto_12937 - SURFACE
    )
    :vars
    (
      ?auto_12939 - HOIST
      ?auto_12941 - PLACE
      ?auto_12940 - PLACE
      ?auto_12938 - HOIST
      ?auto_12943 - SURFACE
      ?auto_12952 - PLACE
      ?auto_12949 - HOIST
      ?auto_12951 - SURFACE
      ?auto_12950 - PLACE
      ?auto_12946 - HOIST
      ?auto_12944 - SURFACE
      ?auto_12948 - PLACE
      ?auto_12953 - HOIST
      ?auto_12945 - SURFACE
      ?auto_12947 - SURFACE
      ?auto_12942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12939 ?auto_12941 ) ( IS-CRATE ?auto_12937 ) ( not ( = ?auto_12940 ?auto_12941 ) ) ( HOIST-AT ?auto_12938 ?auto_12940 ) ( AVAILABLE ?auto_12938 ) ( SURFACE-AT ?auto_12937 ?auto_12940 ) ( ON ?auto_12937 ?auto_12943 ) ( CLEAR ?auto_12937 ) ( not ( = ?auto_12936 ?auto_12937 ) ) ( not ( = ?auto_12936 ?auto_12943 ) ) ( not ( = ?auto_12937 ?auto_12943 ) ) ( not ( = ?auto_12939 ?auto_12938 ) ) ( IS-CRATE ?auto_12936 ) ( not ( = ?auto_12952 ?auto_12941 ) ) ( HOIST-AT ?auto_12949 ?auto_12952 ) ( SURFACE-AT ?auto_12936 ?auto_12952 ) ( ON ?auto_12936 ?auto_12951 ) ( CLEAR ?auto_12936 ) ( not ( = ?auto_12935 ?auto_12936 ) ) ( not ( = ?auto_12935 ?auto_12951 ) ) ( not ( = ?auto_12936 ?auto_12951 ) ) ( not ( = ?auto_12939 ?auto_12949 ) ) ( IS-CRATE ?auto_12935 ) ( not ( = ?auto_12950 ?auto_12941 ) ) ( HOIST-AT ?auto_12946 ?auto_12950 ) ( AVAILABLE ?auto_12946 ) ( SURFACE-AT ?auto_12935 ?auto_12950 ) ( ON ?auto_12935 ?auto_12944 ) ( CLEAR ?auto_12935 ) ( not ( = ?auto_12934 ?auto_12935 ) ) ( not ( = ?auto_12934 ?auto_12944 ) ) ( not ( = ?auto_12935 ?auto_12944 ) ) ( not ( = ?auto_12939 ?auto_12946 ) ) ( IS-CRATE ?auto_12934 ) ( not ( = ?auto_12948 ?auto_12941 ) ) ( HOIST-AT ?auto_12953 ?auto_12948 ) ( AVAILABLE ?auto_12953 ) ( SURFACE-AT ?auto_12934 ?auto_12948 ) ( ON ?auto_12934 ?auto_12945 ) ( CLEAR ?auto_12934 ) ( not ( = ?auto_12933 ?auto_12934 ) ) ( not ( = ?auto_12933 ?auto_12945 ) ) ( not ( = ?auto_12934 ?auto_12945 ) ) ( not ( = ?auto_12939 ?auto_12953 ) ) ( SURFACE-AT ?auto_12932 ?auto_12941 ) ( CLEAR ?auto_12932 ) ( IS-CRATE ?auto_12933 ) ( AVAILABLE ?auto_12939 ) ( AVAILABLE ?auto_12949 ) ( SURFACE-AT ?auto_12933 ?auto_12952 ) ( ON ?auto_12933 ?auto_12947 ) ( CLEAR ?auto_12933 ) ( TRUCK-AT ?auto_12942 ?auto_12941 ) ( not ( = ?auto_12932 ?auto_12933 ) ) ( not ( = ?auto_12932 ?auto_12947 ) ) ( not ( = ?auto_12933 ?auto_12947 ) ) ( not ( = ?auto_12932 ?auto_12934 ) ) ( not ( = ?auto_12932 ?auto_12945 ) ) ( not ( = ?auto_12934 ?auto_12947 ) ) ( not ( = ?auto_12948 ?auto_12952 ) ) ( not ( = ?auto_12953 ?auto_12949 ) ) ( not ( = ?auto_12945 ?auto_12947 ) ) ( not ( = ?auto_12932 ?auto_12935 ) ) ( not ( = ?auto_12932 ?auto_12944 ) ) ( not ( = ?auto_12933 ?auto_12935 ) ) ( not ( = ?auto_12933 ?auto_12944 ) ) ( not ( = ?auto_12935 ?auto_12945 ) ) ( not ( = ?auto_12935 ?auto_12947 ) ) ( not ( = ?auto_12950 ?auto_12948 ) ) ( not ( = ?auto_12950 ?auto_12952 ) ) ( not ( = ?auto_12946 ?auto_12953 ) ) ( not ( = ?auto_12946 ?auto_12949 ) ) ( not ( = ?auto_12944 ?auto_12945 ) ) ( not ( = ?auto_12944 ?auto_12947 ) ) ( not ( = ?auto_12932 ?auto_12936 ) ) ( not ( = ?auto_12932 ?auto_12951 ) ) ( not ( = ?auto_12933 ?auto_12936 ) ) ( not ( = ?auto_12933 ?auto_12951 ) ) ( not ( = ?auto_12934 ?auto_12936 ) ) ( not ( = ?auto_12934 ?auto_12951 ) ) ( not ( = ?auto_12936 ?auto_12944 ) ) ( not ( = ?auto_12936 ?auto_12945 ) ) ( not ( = ?auto_12936 ?auto_12947 ) ) ( not ( = ?auto_12951 ?auto_12944 ) ) ( not ( = ?auto_12951 ?auto_12945 ) ) ( not ( = ?auto_12951 ?auto_12947 ) ) ( not ( = ?auto_12932 ?auto_12937 ) ) ( not ( = ?auto_12932 ?auto_12943 ) ) ( not ( = ?auto_12933 ?auto_12937 ) ) ( not ( = ?auto_12933 ?auto_12943 ) ) ( not ( = ?auto_12934 ?auto_12937 ) ) ( not ( = ?auto_12934 ?auto_12943 ) ) ( not ( = ?auto_12935 ?auto_12937 ) ) ( not ( = ?auto_12935 ?auto_12943 ) ) ( not ( = ?auto_12937 ?auto_12951 ) ) ( not ( = ?auto_12937 ?auto_12944 ) ) ( not ( = ?auto_12937 ?auto_12945 ) ) ( not ( = ?auto_12937 ?auto_12947 ) ) ( not ( = ?auto_12940 ?auto_12952 ) ) ( not ( = ?auto_12940 ?auto_12950 ) ) ( not ( = ?auto_12940 ?auto_12948 ) ) ( not ( = ?auto_12938 ?auto_12949 ) ) ( not ( = ?auto_12938 ?auto_12946 ) ) ( not ( = ?auto_12938 ?auto_12953 ) ) ( not ( = ?auto_12943 ?auto_12951 ) ) ( not ( = ?auto_12943 ?auto_12944 ) ) ( not ( = ?auto_12943 ?auto_12945 ) ) ( not ( = ?auto_12943 ?auto_12947 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_12932 ?auto_12933 ?auto_12934 ?auto_12935 ?auto_12936 )
      ( MAKE-1CRATE ?auto_12936 ?auto_12937 )
      ( MAKE-5CRATE-VERIFY ?auto_12932 ?auto_12933 ?auto_12934 ?auto_12935 ?auto_12936 ?auto_12937 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12956 - SURFACE
      ?auto_12957 - SURFACE
    )
    :vars
    (
      ?auto_12958 - HOIST
      ?auto_12959 - PLACE
      ?auto_12961 - PLACE
      ?auto_12962 - HOIST
      ?auto_12963 - SURFACE
      ?auto_12960 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12958 ?auto_12959 ) ( SURFACE-AT ?auto_12956 ?auto_12959 ) ( CLEAR ?auto_12956 ) ( IS-CRATE ?auto_12957 ) ( AVAILABLE ?auto_12958 ) ( not ( = ?auto_12961 ?auto_12959 ) ) ( HOIST-AT ?auto_12962 ?auto_12961 ) ( AVAILABLE ?auto_12962 ) ( SURFACE-AT ?auto_12957 ?auto_12961 ) ( ON ?auto_12957 ?auto_12963 ) ( CLEAR ?auto_12957 ) ( TRUCK-AT ?auto_12960 ?auto_12959 ) ( not ( = ?auto_12956 ?auto_12957 ) ) ( not ( = ?auto_12956 ?auto_12963 ) ) ( not ( = ?auto_12957 ?auto_12963 ) ) ( not ( = ?auto_12958 ?auto_12962 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12960 ?auto_12959 ?auto_12961 )
      ( !LIFT ?auto_12962 ?auto_12957 ?auto_12963 ?auto_12961 )
      ( !LOAD ?auto_12962 ?auto_12957 ?auto_12960 ?auto_12961 )
      ( !DRIVE ?auto_12960 ?auto_12961 ?auto_12959 )
      ( !UNLOAD ?auto_12958 ?auto_12957 ?auto_12960 ?auto_12959 )
      ( !DROP ?auto_12958 ?auto_12957 ?auto_12956 ?auto_12959 )
      ( MAKE-1CRATE-VERIFY ?auto_12956 ?auto_12957 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_12971 - SURFACE
      ?auto_12972 - SURFACE
      ?auto_12973 - SURFACE
      ?auto_12974 - SURFACE
      ?auto_12975 - SURFACE
      ?auto_12977 - SURFACE
      ?auto_12976 - SURFACE
    )
    :vars
    (
      ?auto_12981 - HOIST
      ?auto_12982 - PLACE
      ?auto_12979 - PLACE
      ?auto_12978 - HOIST
      ?auto_12983 - SURFACE
      ?auto_12987 - PLACE
      ?auto_12989 - HOIST
      ?auto_12994 - SURFACE
      ?auto_12993 - PLACE
      ?auto_12992 - HOIST
      ?auto_12988 - SURFACE
      ?auto_12984 - PLACE
      ?auto_12995 - HOIST
      ?auto_12990 - SURFACE
      ?auto_12985 - PLACE
      ?auto_12986 - HOIST
      ?auto_12991 - SURFACE
      ?auto_12996 - SURFACE
      ?auto_12980 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12981 ?auto_12982 ) ( IS-CRATE ?auto_12976 ) ( not ( = ?auto_12979 ?auto_12982 ) ) ( HOIST-AT ?auto_12978 ?auto_12979 ) ( AVAILABLE ?auto_12978 ) ( SURFACE-AT ?auto_12976 ?auto_12979 ) ( ON ?auto_12976 ?auto_12983 ) ( CLEAR ?auto_12976 ) ( not ( = ?auto_12977 ?auto_12976 ) ) ( not ( = ?auto_12977 ?auto_12983 ) ) ( not ( = ?auto_12976 ?auto_12983 ) ) ( not ( = ?auto_12981 ?auto_12978 ) ) ( IS-CRATE ?auto_12977 ) ( not ( = ?auto_12987 ?auto_12982 ) ) ( HOIST-AT ?auto_12989 ?auto_12987 ) ( AVAILABLE ?auto_12989 ) ( SURFACE-AT ?auto_12977 ?auto_12987 ) ( ON ?auto_12977 ?auto_12994 ) ( CLEAR ?auto_12977 ) ( not ( = ?auto_12975 ?auto_12977 ) ) ( not ( = ?auto_12975 ?auto_12994 ) ) ( not ( = ?auto_12977 ?auto_12994 ) ) ( not ( = ?auto_12981 ?auto_12989 ) ) ( IS-CRATE ?auto_12975 ) ( not ( = ?auto_12993 ?auto_12982 ) ) ( HOIST-AT ?auto_12992 ?auto_12993 ) ( SURFACE-AT ?auto_12975 ?auto_12993 ) ( ON ?auto_12975 ?auto_12988 ) ( CLEAR ?auto_12975 ) ( not ( = ?auto_12974 ?auto_12975 ) ) ( not ( = ?auto_12974 ?auto_12988 ) ) ( not ( = ?auto_12975 ?auto_12988 ) ) ( not ( = ?auto_12981 ?auto_12992 ) ) ( IS-CRATE ?auto_12974 ) ( not ( = ?auto_12984 ?auto_12982 ) ) ( HOIST-AT ?auto_12995 ?auto_12984 ) ( AVAILABLE ?auto_12995 ) ( SURFACE-AT ?auto_12974 ?auto_12984 ) ( ON ?auto_12974 ?auto_12990 ) ( CLEAR ?auto_12974 ) ( not ( = ?auto_12973 ?auto_12974 ) ) ( not ( = ?auto_12973 ?auto_12990 ) ) ( not ( = ?auto_12974 ?auto_12990 ) ) ( not ( = ?auto_12981 ?auto_12995 ) ) ( IS-CRATE ?auto_12973 ) ( not ( = ?auto_12985 ?auto_12982 ) ) ( HOIST-AT ?auto_12986 ?auto_12985 ) ( AVAILABLE ?auto_12986 ) ( SURFACE-AT ?auto_12973 ?auto_12985 ) ( ON ?auto_12973 ?auto_12991 ) ( CLEAR ?auto_12973 ) ( not ( = ?auto_12972 ?auto_12973 ) ) ( not ( = ?auto_12972 ?auto_12991 ) ) ( not ( = ?auto_12973 ?auto_12991 ) ) ( not ( = ?auto_12981 ?auto_12986 ) ) ( SURFACE-AT ?auto_12971 ?auto_12982 ) ( CLEAR ?auto_12971 ) ( IS-CRATE ?auto_12972 ) ( AVAILABLE ?auto_12981 ) ( AVAILABLE ?auto_12992 ) ( SURFACE-AT ?auto_12972 ?auto_12993 ) ( ON ?auto_12972 ?auto_12996 ) ( CLEAR ?auto_12972 ) ( TRUCK-AT ?auto_12980 ?auto_12982 ) ( not ( = ?auto_12971 ?auto_12972 ) ) ( not ( = ?auto_12971 ?auto_12996 ) ) ( not ( = ?auto_12972 ?auto_12996 ) ) ( not ( = ?auto_12971 ?auto_12973 ) ) ( not ( = ?auto_12971 ?auto_12991 ) ) ( not ( = ?auto_12973 ?auto_12996 ) ) ( not ( = ?auto_12985 ?auto_12993 ) ) ( not ( = ?auto_12986 ?auto_12992 ) ) ( not ( = ?auto_12991 ?auto_12996 ) ) ( not ( = ?auto_12971 ?auto_12974 ) ) ( not ( = ?auto_12971 ?auto_12990 ) ) ( not ( = ?auto_12972 ?auto_12974 ) ) ( not ( = ?auto_12972 ?auto_12990 ) ) ( not ( = ?auto_12974 ?auto_12991 ) ) ( not ( = ?auto_12974 ?auto_12996 ) ) ( not ( = ?auto_12984 ?auto_12985 ) ) ( not ( = ?auto_12984 ?auto_12993 ) ) ( not ( = ?auto_12995 ?auto_12986 ) ) ( not ( = ?auto_12995 ?auto_12992 ) ) ( not ( = ?auto_12990 ?auto_12991 ) ) ( not ( = ?auto_12990 ?auto_12996 ) ) ( not ( = ?auto_12971 ?auto_12975 ) ) ( not ( = ?auto_12971 ?auto_12988 ) ) ( not ( = ?auto_12972 ?auto_12975 ) ) ( not ( = ?auto_12972 ?auto_12988 ) ) ( not ( = ?auto_12973 ?auto_12975 ) ) ( not ( = ?auto_12973 ?auto_12988 ) ) ( not ( = ?auto_12975 ?auto_12990 ) ) ( not ( = ?auto_12975 ?auto_12991 ) ) ( not ( = ?auto_12975 ?auto_12996 ) ) ( not ( = ?auto_12988 ?auto_12990 ) ) ( not ( = ?auto_12988 ?auto_12991 ) ) ( not ( = ?auto_12988 ?auto_12996 ) ) ( not ( = ?auto_12971 ?auto_12977 ) ) ( not ( = ?auto_12971 ?auto_12994 ) ) ( not ( = ?auto_12972 ?auto_12977 ) ) ( not ( = ?auto_12972 ?auto_12994 ) ) ( not ( = ?auto_12973 ?auto_12977 ) ) ( not ( = ?auto_12973 ?auto_12994 ) ) ( not ( = ?auto_12974 ?auto_12977 ) ) ( not ( = ?auto_12974 ?auto_12994 ) ) ( not ( = ?auto_12977 ?auto_12988 ) ) ( not ( = ?auto_12977 ?auto_12990 ) ) ( not ( = ?auto_12977 ?auto_12991 ) ) ( not ( = ?auto_12977 ?auto_12996 ) ) ( not ( = ?auto_12987 ?auto_12993 ) ) ( not ( = ?auto_12987 ?auto_12984 ) ) ( not ( = ?auto_12987 ?auto_12985 ) ) ( not ( = ?auto_12989 ?auto_12992 ) ) ( not ( = ?auto_12989 ?auto_12995 ) ) ( not ( = ?auto_12989 ?auto_12986 ) ) ( not ( = ?auto_12994 ?auto_12988 ) ) ( not ( = ?auto_12994 ?auto_12990 ) ) ( not ( = ?auto_12994 ?auto_12991 ) ) ( not ( = ?auto_12994 ?auto_12996 ) ) ( not ( = ?auto_12971 ?auto_12976 ) ) ( not ( = ?auto_12971 ?auto_12983 ) ) ( not ( = ?auto_12972 ?auto_12976 ) ) ( not ( = ?auto_12972 ?auto_12983 ) ) ( not ( = ?auto_12973 ?auto_12976 ) ) ( not ( = ?auto_12973 ?auto_12983 ) ) ( not ( = ?auto_12974 ?auto_12976 ) ) ( not ( = ?auto_12974 ?auto_12983 ) ) ( not ( = ?auto_12975 ?auto_12976 ) ) ( not ( = ?auto_12975 ?auto_12983 ) ) ( not ( = ?auto_12976 ?auto_12994 ) ) ( not ( = ?auto_12976 ?auto_12988 ) ) ( not ( = ?auto_12976 ?auto_12990 ) ) ( not ( = ?auto_12976 ?auto_12991 ) ) ( not ( = ?auto_12976 ?auto_12996 ) ) ( not ( = ?auto_12979 ?auto_12987 ) ) ( not ( = ?auto_12979 ?auto_12993 ) ) ( not ( = ?auto_12979 ?auto_12984 ) ) ( not ( = ?auto_12979 ?auto_12985 ) ) ( not ( = ?auto_12978 ?auto_12989 ) ) ( not ( = ?auto_12978 ?auto_12992 ) ) ( not ( = ?auto_12978 ?auto_12995 ) ) ( not ( = ?auto_12978 ?auto_12986 ) ) ( not ( = ?auto_12983 ?auto_12994 ) ) ( not ( = ?auto_12983 ?auto_12988 ) ) ( not ( = ?auto_12983 ?auto_12990 ) ) ( not ( = ?auto_12983 ?auto_12991 ) ) ( not ( = ?auto_12983 ?auto_12996 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_12971 ?auto_12972 ?auto_12973 ?auto_12974 ?auto_12975 ?auto_12977 )
      ( MAKE-1CRATE ?auto_12977 ?auto_12976 )
      ( MAKE-6CRATE-VERIFY ?auto_12971 ?auto_12972 ?auto_12973 ?auto_12974 ?auto_12975 ?auto_12977 ?auto_12976 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12999 - SURFACE
      ?auto_13000 - SURFACE
    )
    :vars
    (
      ?auto_13001 - HOIST
      ?auto_13002 - PLACE
      ?auto_13004 - PLACE
      ?auto_13005 - HOIST
      ?auto_13006 - SURFACE
      ?auto_13003 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13001 ?auto_13002 ) ( SURFACE-AT ?auto_12999 ?auto_13002 ) ( CLEAR ?auto_12999 ) ( IS-CRATE ?auto_13000 ) ( AVAILABLE ?auto_13001 ) ( not ( = ?auto_13004 ?auto_13002 ) ) ( HOIST-AT ?auto_13005 ?auto_13004 ) ( AVAILABLE ?auto_13005 ) ( SURFACE-AT ?auto_13000 ?auto_13004 ) ( ON ?auto_13000 ?auto_13006 ) ( CLEAR ?auto_13000 ) ( TRUCK-AT ?auto_13003 ?auto_13002 ) ( not ( = ?auto_12999 ?auto_13000 ) ) ( not ( = ?auto_12999 ?auto_13006 ) ) ( not ( = ?auto_13000 ?auto_13006 ) ) ( not ( = ?auto_13001 ?auto_13005 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13003 ?auto_13002 ?auto_13004 )
      ( !LIFT ?auto_13005 ?auto_13000 ?auto_13006 ?auto_13004 )
      ( !LOAD ?auto_13005 ?auto_13000 ?auto_13003 ?auto_13004 )
      ( !DRIVE ?auto_13003 ?auto_13004 ?auto_13002 )
      ( !UNLOAD ?auto_13001 ?auto_13000 ?auto_13003 ?auto_13002 )
      ( !DROP ?auto_13001 ?auto_13000 ?auto_12999 ?auto_13002 )
      ( MAKE-1CRATE-VERIFY ?auto_12999 ?auto_13000 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_13015 - SURFACE
      ?auto_13016 - SURFACE
      ?auto_13017 - SURFACE
      ?auto_13018 - SURFACE
      ?auto_13019 - SURFACE
      ?auto_13021 - SURFACE
      ?auto_13020 - SURFACE
      ?auto_13022 - SURFACE
    )
    :vars
    (
      ?auto_13026 - HOIST
      ?auto_13023 - PLACE
      ?auto_13024 - PLACE
      ?auto_13025 - HOIST
      ?auto_13028 - SURFACE
      ?auto_13041 - PLACE
      ?auto_13042 - HOIST
      ?auto_13039 - SURFACE
      ?auto_13037 - PLACE
      ?auto_13035 - HOIST
      ?auto_13029 - SURFACE
      ?auto_13030 - PLACE
      ?auto_13044 - HOIST
      ?auto_13036 - SURFACE
      ?auto_13043 - PLACE
      ?auto_13031 - HOIST
      ?auto_13034 - SURFACE
      ?auto_13040 - PLACE
      ?auto_13038 - HOIST
      ?auto_13033 - SURFACE
      ?auto_13032 - SURFACE
      ?auto_13027 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13026 ?auto_13023 ) ( IS-CRATE ?auto_13022 ) ( not ( = ?auto_13024 ?auto_13023 ) ) ( HOIST-AT ?auto_13025 ?auto_13024 ) ( AVAILABLE ?auto_13025 ) ( SURFACE-AT ?auto_13022 ?auto_13024 ) ( ON ?auto_13022 ?auto_13028 ) ( CLEAR ?auto_13022 ) ( not ( = ?auto_13020 ?auto_13022 ) ) ( not ( = ?auto_13020 ?auto_13028 ) ) ( not ( = ?auto_13022 ?auto_13028 ) ) ( not ( = ?auto_13026 ?auto_13025 ) ) ( IS-CRATE ?auto_13020 ) ( not ( = ?auto_13041 ?auto_13023 ) ) ( HOIST-AT ?auto_13042 ?auto_13041 ) ( AVAILABLE ?auto_13042 ) ( SURFACE-AT ?auto_13020 ?auto_13041 ) ( ON ?auto_13020 ?auto_13039 ) ( CLEAR ?auto_13020 ) ( not ( = ?auto_13021 ?auto_13020 ) ) ( not ( = ?auto_13021 ?auto_13039 ) ) ( not ( = ?auto_13020 ?auto_13039 ) ) ( not ( = ?auto_13026 ?auto_13042 ) ) ( IS-CRATE ?auto_13021 ) ( not ( = ?auto_13037 ?auto_13023 ) ) ( HOIST-AT ?auto_13035 ?auto_13037 ) ( AVAILABLE ?auto_13035 ) ( SURFACE-AT ?auto_13021 ?auto_13037 ) ( ON ?auto_13021 ?auto_13029 ) ( CLEAR ?auto_13021 ) ( not ( = ?auto_13019 ?auto_13021 ) ) ( not ( = ?auto_13019 ?auto_13029 ) ) ( not ( = ?auto_13021 ?auto_13029 ) ) ( not ( = ?auto_13026 ?auto_13035 ) ) ( IS-CRATE ?auto_13019 ) ( not ( = ?auto_13030 ?auto_13023 ) ) ( HOIST-AT ?auto_13044 ?auto_13030 ) ( SURFACE-AT ?auto_13019 ?auto_13030 ) ( ON ?auto_13019 ?auto_13036 ) ( CLEAR ?auto_13019 ) ( not ( = ?auto_13018 ?auto_13019 ) ) ( not ( = ?auto_13018 ?auto_13036 ) ) ( not ( = ?auto_13019 ?auto_13036 ) ) ( not ( = ?auto_13026 ?auto_13044 ) ) ( IS-CRATE ?auto_13018 ) ( not ( = ?auto_13043 ?auto_13023 ) ) ( HOIST-AT ?auto_13031 ?auto_13043 ) ( AVAILABLE ?auto_13031 ) ( SURFACE-AT ?auto_13018 ?auto_13043 ) ( ON ?auto_13018 ?auto_13034 ) ( CLEAR ?auto_13018 ) ( not ( = ?auto_13017 ?auto_13018 ) ) ( not ( = ?auto_13017 ?auto_13034 ) ) ( not ( = ?auto_13018 ?auto_13034 ) ) ( not ( = ?auto_13026 ?auto_13031 ) ) ( IS-CRATE ?auto_13017 ) ( not ( = ?auto_13040 ?auto_13023 ) ) ( HOIST-AT ?auto_13038 ?auto_13040 ) ( AVAILABLE ?auto_13038 ) ( SURFACE-AT ?auto_13017 ?auto_13040 ) ( ON ?auto_13017 ?auto_13033 ) ( CLEAR ?auto_13017 ) ( not ( = ?auto_13016 ?auto_13017 ) ) ( not ( = ?auto_13016 ?auto_13033 ) ) ( not ( = ?auto_13017 ?auto_13033 ) ) ( not ( = ?auto_13026 ?auto_13038 ) ) ( SURFACE-AT ?auto_13015 ?auto_13023 ) ( CLEAR ?auto_13015 ) ( IS-CRATE ?auto_13016 ) ( AVAILABLE ?auto_13026 ) ( AVAILABLE ?auto_13044 ) ( SURFACE-AT ?auto_13016 ?auto_13030 ) ( ON ?auto_13016 ?auto_13032 ) ( CLEAR ?auto_13016 ) ( TRUCK-AT ?auto_13027 ?auto_13023 ) ( not ( = ?auto_13015 ?auto_13016 ) ) ( not ( = ?auto_13015 ?auto_13032 ) ) ( not ( = ?auto_13016 ?auto_13032 ) ) ( not ( = ?auto_13015 ?auto_13017 ) ) ( not ( = ?auto_13015 ?auto_13033 ) ) ( not ( = ?auto_13017 ?auto_13032 ) ) ( not ( = ?auto_13040 ?auto_13030 ) ) ( not ( = ?auto_13038 ?auto_13044 ) ) ( not ( = ?auto_13033 ?auto_13032 ) ) ( not ( = ?auto_13015 ?auto_13018 ) ) ( not ( = ?auto_13015 ?auto_13034 ) ) ( not ( = ?auto_13016 ?auto_13018 ) ) ( not ( = ?auto_13016 ?auto_13034 ) ) ( not ( = ?auto_13018 ?auto_13033 ) ) ( not ( = ?auto_13018 ?auto_13032 ) ) ( not ( = ?auto_13043 ?auto_13040 ) ) ( not ( = ?auto_13043 ?auto_13030 ) ) ( not ( = ?auto_13031 ?auto_13038 ) ) ( not ( = ?auto_13031 ?auto_13044 ) ) ( not ( = ?auto_13034 ?auto_13033 ) ) ( not ( = ?auto_13034 ?auto_13032 ) ) ( not ( = ?auto_13015 ?auto_13019 ) ) ( not ( = ?auto_13015 ?auto_13036 ) ) ( not ( = ?auto_13016 ?auto_13019 ) ) ( not ( = ?auto_13016 ?auto_13036 ) ) ( not ( = ?auto_13017 ?auto_13019 ) ) ( not ( = ?auto_13017 ?auto_13036 ) ) ( not ( = ?auto_13019 ?auto_13034 ) ) ( not ( = ?auto_13019 ?auto_13033 ) ) ( not ( = ?auto_13019 ?auto_13032 ) ) ( not ( = ?auto_13036 ?auto_13034 ) ) ( not ( = ?auto_13036 ?auto_13033 ) ) ( not ( = ?auto_13036 ?auto_13032 ) ) ( not ( = ?auto_13015 ?auto_13021 ) ) ( not ( = ?auto_13015 ?auto_13029 ) ) ( not ( = ?auto_13016 ?auto_13021 ) ) ( not ( = ?auto_13016 ?auto_13029 ) ) ( not ( = ?auto_13017 ?auto_13021 ) ) ( not ( = ?auto_13017 ?auto_13029 ) ) ( not ( = ?auto_13018 ?auto_13021 ) ) ( not ( = ?auto_13018 ?auto_13029 ) ) ( not ( = ?auto_13021 ?auto_13036 ) ) ( not ( = ?auto_13021 ?auto_13034 ) ) ( not ( = ?auto_13021 ?auto_13033 ) ) ( not ( = ?auto_13021 ?auto_13032 ) ) ( not ( = ?auto_13037 ?auto_13030 ) ) ( not ( = ?auto_13037 ?auto_13043 ) ) ( not ( = ?auto_13037 ?auto_13040 ) ) ( not ( = ?auto_13035 ?auto_13044 ) ) ( not ( = ?auto_13035 ?auto_13031 ) ) ( not ( = ?auto_13035 ?auto_13038 ) ) ( not ( = ?auto_13029 ?auto_13036 ) ) ( not ( = ?auto_13029 ?auto_13034 ) ) ( not ( = ?auto_13029 ?auto_13033 ) ) ( not ( = ?auto_13029 ?auto_13032 ) ) ( not ( = ?auto_13015 ?auto_13020 ) ) ( not ( = ?auto_13015 ?auto_13039 ) ) ( not ( = ?auto_13016 ?auto_13020 ) ) ( not ( = ?auto_13016 ?auto_13039 ) ) ( not ( = ?auto_13017 ?auto_13020 ) ) ( not ( = ?auto_13017 ?auto_13039 ) ) ( not ( = ?auto_13018 ?auto_13020 ) ) ( not ( = ?auto_13018 ?auto_13039 ) ) ( not ( = ?auto_13019 ?auto_13020 ) ) ( not ( = ?auto_13019 ?auto_13039 ) ) ( not ( = ?auto_13020 ?auto_13029 ) ) ( not ( = ?auto_13020 ?auto_13036 ) ) ( not ( = ?auto_13020 ?auto_13034 ) ) ( not ( = ?auto_13020 ?auto_13033 ) ) ( not ( = ?auto_13020 ?auto_13032 ) ) ( not ( = ?auto_13041 ?auto_13037 ) ) ( not ( = ?auto_13041 ?auto_13030 ) ) ( not ( = ?auto_13041 ?auto_13043 ) ) ( not ( = ?auto_13041 ?auto_13040 ) ) ( not ( = ?auto_13042 ?auto_13035 ) ) ( not ( = ?auto_13042 ?auto_13044 ) ) ( not ( = ?auto_13042 ?auto_13031 ) ) ( not ( = ?auto_13042 ?auto_13038 ) ) ( not ( = ?auto_13039 ?auto_13029 ) ) ( not ( = ?auto_13039 ?auto_13036 ) ) ( not ( = ?auto_13039 ?auto_13034 ) ) ( not ( = ?auto_13039 ?auto_13033 ) ) ( not ( = ?auto_13039 ?auto_13032 ) ) ( not ( = ?auto_13015 ?auto_13022 ) ) ( not ( = ?auto_13015 ?auto_13028 ) ) ( not ( = ?auto_13016 ?auto_13022 ) ) ( not ( = ?auto_13016 ?auto_13028 ) ) ( not ( = ?auto_13017 ?auto_13022 ) ) ( not ( = ?auto_13017 ?auto_13028 ) ) ( not ( = ?auto_13018 ?auto_13022 ) ) ( not ( = ?auto_13018 ?auto_13028 ) ) ( not ( = ?auto_13019 ?auto_13022 ) ) ( not ( = ?auto_13019 ?auto_13028 ) ) ( not ( = ?auto_13021 ?auto_13022 ) ) ( not ( = ?auto_13021 ?auto_13028 ) ) ( not ( = ?auto_13022 ?auto_13039 ) ) ( not ( = ?auto_13022 ?auto_13029 ) ) ( not ( = ?auto_13022 ?auto_13036 ) ) ( not ( = ?auto_13022 ?auto_13034 ) ) ( not ( = ?auto_13022 ?auto_13033 ) ) ( not ( = ?auto_13022 ?auto_13032 ) ) ( not ( = ?auto_13024 ?auto_13041 ) ) ( not ( = ?auto_13024 ?auto_13037 ) ) ( not ( = ?auto_13024 ?auto_13030 ) ) ( not ( = ?auto_13024 ?auto_13043 ) ) ( not ( = ?auto_13024 ?auto_13040 ) ) ( not ( = ?auto_13025 ?auto_13042 ) ) ( not ( = ?auto_13025 ?auto_13035 ) ) ( not ( = ?auto_13025 ?auto_13044 ) ) ( not ( = ?auto_13025 ?auto_13031 ) ) ( not ( = ?auto_13025 ?auto_13038 ) ) ( not ( = ?auto_13028 ?auto_13039 ) ) ( not ( = ?auto_13028 ?auto_13029 ) ) ( not ( = ?auto_13028 ?auto_13036 ) ) ( not ( = ?auto_13028 ?auto_13034 ) ) ( not ( = ?auto_13028 ?auto_13033 ) ) ( not ( = ?auto_13028 ?auto_13032 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_13015 ?auto_13016 ?auto_13017 ?auto_13018 ?auto_13019 ?auto_13021 ?auto_13020 )
      ( MAKE-1CRATE ?auto_13020 ?auto_13022 )
      ( MAKE-7CRATE-VERIFY ?auto_13015 ?auto_13016 ?auto_13017 ?auto_13018 ?auto_13019 ?auto_13021 ?auto_13020 ?auto_13022 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13047 - SURFACE
      ?auto_13048 - SURFACE
    )
    :vars
    (
      ?auto_13049 - HOIST
      ?auto_13050 - PLACE
      ?auto_13052 - PLACE
      ?auto_13053 - HOIST
      ?auto_13054 - SURFACE
      ?auto_13051 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13049 ?auto_13050 ) ( SURFACE-AT ?auto_13047 ?auto_13050 ) ( CLEAR ?auto_13047 ) ( IS-CRATE ?auto_13048 ) ( AVAILABLE ?auto_13049 ) ( not ( = ?auto_13052 ?auto_13050 ) ) ( HOIST-AT ?auto_13053 ?auto_13052 ) ( AVAILABLE ?auto_13053 ) ( SURFACE-AT ?auto_13048 ?auto_13052 ) ( ON ?auto_13048 ?auto_13054 ) ( CLEAR ?auto_13048 ) ( TRUCK-AT ?auto_13051 ?auto_13050 ) ( not ( = ?auto_13047 ?auto_13048 ) ) ( not ( = ?auto_13047 ?auto_13054 ) ) ( not ( = ?auto_13048 ?auto_13054 ) ) ( not ( = ?auto_13049 ?auto_13053 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13051 ?auto_13050 ?auto_13052 )
      ( !LIFT ?auto_13053 ?auto_13048 ?auto_13054 ?auto_13052 )
      ( !LOAD ?auto_13053 ?auto_13048 ?auto_13051 ?auto_13052 )
      ( !DRIVE ?auto_13051 ?auto_13052 ?auto_13050 )
      ( !UNLOAD ?auto_13049 ?auto_13048 ?auto_13051 ?auto_13050 )
      ( !DROP ?auto_13049 ?auto_13048 ?auto_13047 ?auto_13050 )
      ( MAKE-1CRATE-VERIFY ?auto_13047 ?auto_13048 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_13064 - SURFACE
      ?auto_13065 - SURFACE
      ?auto_13066 - SURFACE
      ?auto_13067 - SURFACE
      ?auto_13068 - SURFACE
      ?auto_13070 - SURFACE
      ?auto_13069 - SURFACE
      ?auto_13072 - SURFACE
      ?auto_13071 - SURFACE
    )
    :vars
    (
      ?auto_13075 - HOIST
      ?auto_13073 - PLACE
      ?auto_13077 - PLACE
      ?auto_13078 - HOIST
      ?auto_13076 - SURFACE
      ?auto_13095 - PLACE
      ?auto_13094 - HOIST
      ?auto_13092 - SURFACE
      ?auto_13086 - PLACE
      ?auto_13087 - HOIST
      ?auto_13083 - SURFACE
      ?auto_13082 - PLACE
      ?auto_13089 - HOIST
      ?auto_13097 - SURFACE
      ?auto_13093 - PLACE
      ?auto_13079 - HOIST
      ?auto_13088 - SURFACE
      ?auto_13080 - PLACE
      ?auto_13081 - HOIST
      ?auto_13090 - SURFACE
      ?auto_13085 - PLACE
      ?auto_13084 - HOIST
      ?auto_13091 - SURFACE
      ?auto_13096 - SURFACE
      ?auto_13074 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13075 ?auto_13073 ) ( IS-CRATE ?auto_13071 ) ( not ( = ?auto_13077 ?auto_13073 ) ) ( HOIST-AT ?auto_13078 ?auto_13077 ) ( AVAILABLE ?auto_13078 ) ( SURFACE-AT ?auto_13071 ?auto_13077 ) ( ON ?auto_13071 ?auto_13076 ) ( CLEAR ?auto_13071 ) ( not ( = ?auto_13072 ?auto_13071 ) ) ( not ( = ?auto_13072 ?auto_13076 ) ) ( not ( = ?auto_13071 ?auto_13076 ) ) ( not ( = ?auto_13075 ?auto_13078 ) ) ( IS-CRATE ?auto_13072 ) ( not ( = ?auto_13095 ?auto_13073 ) ) ( HOIST-AT ?auto_13094 ?auto_13095 ) ( AVAILABLE ?auto_13094 ) ( SURFACE-AT ?auto_13072 ?auto_13095 ) ( ON ?auto_13072 ?auto_13092 ) ( CLEAR ?auto_13072 ) ( not ( = ?auto_13069 ?auto_13072 ) ) ( not ( = ?auto_13069 ?auto_13092 ) ) ( not ( = ?auto_13072 ?auto_13092 ) ) ( not ( = ?auto_13075 ?auto_13094 ) ) ( IS-CRATE ?auto_13069 ) ( not ( = ?auto_13086 ?auto_13073 ) ) ( HOIST-AT ?auto_13087 ?auto_13086 ) ( AVAILABLE ?auto_13087 ) ( SURFACE-AT ?auto_13069 ?auto_13086 ) ( ON ?auto_13069 ?auto_13083 ) ( CLEAR ?auto_13069 ) ( not ( = ?auto_13070 ?auto_13069 ) ) ( not ( = ?auto_13070 ?auto_13083 ) ) ( not ( = ?auto_13069 ?auto_13083 ) ) ( not ( = ?auto_13075 ?auto_13087 ) ) ( IS-CRATE ?auto_13070 ) ( not ( = ?auto_13082 ?auto_13073 ) ) ( HOIST-AT ?auto_13089 ?auto_13082 ) ( AVAILABLE ?auto_13089 ) ( SURFACE-AT ?auto_13070 ?auto_13082 ) ( ON ?auto_13070 ?auto_13097 ) ( CLEAR ?auto_13070 ) ( not ( = ?auto_13068 ?auto_13070 ) ) ( not ( = ?auto_13068 ?auto_13097 ) ) ( not ( = ?auto_13070 ?auto_13097 ) ) ( not ( = ?auto_13075 ?auto_13089 ) ) ( IS-CRATE ?auto_13068 ) ( not ( = ?auto_13093 ?auto_13073 ) ) ( HOIST-AT ?auto_13079 ?auto_13093 ) ( SURFACE-AT ?auto_13068 ?auto_13093 ) ( ON ?auto_13068 ?auto_13088 ) ( CLEAR ?auto_13068 ) ( not ( = ?auto_13067 ?auto_13068 ) ) ( not ( = ?auto_13067 ?auto_13088 ) ) ( not ( = ?auto_13068 ?auto_13088 ) ) ( not ( = ?auto_13075 ?auto_13079 ) ) ( IS-CRATE ?auto_13067 ) ( not ( = ?auto_13080 ?auto_13073 ) ) ( HOIST-AT ?auto_13081 ?auto_13080 ) ( AVAILABLE ?auto_13081 ) ( SURFACE-AT ?auto_13067 ?auto_13080 ) ( ON ?auto_13067 ?auto_13090 ) ( CLEAR ?auto_13067 ) ( not ( = ?auto_13066 ?auto_13067 ) ) ( not ( = ?auto_13066 ?auto_13090 ) ) ( not ( = ?auto_13067 ?auto_13090 ) ) ( not ( = ?auto_13075 ?auto_13081 ) ) ( IS-CRATE ?auto_13066 ) ( not ( = ?auto_13085 ?auto_13073 ) ) ( HOIST-AT ?auto_13084 ?auto_13085 ) ( AVAILABLE ?auto_13084 ) ( SURFACE-AT ?auto_13066 ?auto_13085 ) ( ON ?auto_13066 ?auto_13091 ) ( CLEAR ?auto_13066 ) ( not ( = ?auto_13065 ?auto_13066 ) ) ( not ( = ?auto_13065 ?auto_13091 ) ) ( not ( = ?auto_13066 ?auto_13091 ) ) ( not ( = ?auto_13075 ?auto_13084 ) ) ( SURFACE-AT ?auto_13064 ?auto_13073 ) ( CLEAR ?auto_13064 ) ( IS-CRATE ?auto_13065 ) ( AVAILABLE ?auto_13075 ) ( AVAILABLE ?auto_13079 ) ( SURFACE-AT ?auto_13065 ?auto_13093 ) ( ON ?auto_13065 ?auto_13096 ) ( CLEAR ?auto_13065 ) ( TRUCK-AT ?auto_13074 ?auto_13073 ) ( not ( = ?auto_13064 ?auto_13065 ) ) ( not ( = ?auto_13064 ?auto_13096 ) ) ( not ( = ?auto_13065 ?auto_13096 ) ) ( not ( = ?auto_13064 ?auto_13066 ) ) ( not ( = ?auto_13064 ?auto_13091 ) ) ( not ( = ?auto_13066 ?auto_13096 ) ) ( not ( = ?auto_13085 ?auto_13093 ) ) ( not ( = ?auto_13084 ?auto_13079 ) ) ( not ( = ?auto_13091 ?auto_13096 ) ) ( not ( = ?auto_13064 ?auto_13067 ) ) ( not ( = ?auto_13064 ?auto_13090 ) ) ( not ( = ?auto_13065 ?auto_13067 ) ) ( not ( = ?auto_13065 ?auto_13090 ) ) ( not ( = ?auto_13067 ?auto_13091 ) ) ( not ( = ?auto_13067 ?auto_13096 ) ) ( not ( = ?auto_13080 ?auto_13085 ) ) ( not ( = ?auto_13080 ?auto_13093 ) ) ( not ( = ?auto_13081 ?auto_13084 ) ) ( not ( = ?auto_13081 ?auto_13079 ) ) ( not ( = ?auto_13090 ?auto_13091 ) ) ( not ( = ?auto_13090 ?auto_13096 ) ) ( not ( = ?auto_13064 ?auto_13068 ) ) ( not ( = ?auto_13064 ?auto_13088 ) ) ( not ( = ?auto_13065 ?auto_13068 ) ) ( not ( = ?auto_13065 ?auto_13088 ) ) ( not ( = ?auto_13066 ?auto_13068 ) ) ( not ( = ?auto_13066 ?auto_13088 ) ) ( not ( = ?auto_13068 ?auto_13090 ) ) ( not ( = ?auto_13068 ?auto_13091 ) ) ( not ( = ?auto_13068 ?auto_13096 ) ) ( not ( = ?auto_13088 ?auto_13090 ) ) ( not ( = ?auto_13088 ?auto_13091 ) ) ( not ( = ?auto_13088 ?auto_13096 ) ) ( not ( = ?auto_13064 ?auto_13070 ) ) ( not ( = ?auto_13064 ?auto_13097 ) ) ( not ( = ?auto_13065 ?auto_13070 ) ) ( not ( = ?auto_13065 ?auto_13097 ) ) ( not ( = ?auto_13066 ?auto_13070 ) ) ( not ( = ?auto_13066 ?auto_13097 ) ) ( not ( = ?auto_13067 ?auto_13070 ) ) ( not ( = ?auto_13067 ?auto_13097 ) ) ( not ( = ?auto_13070 ?auto_13088 ) ) ( not ( = ?auto_13070 ?auto_13090 ) ) ( not ( = ?auto_13070 ?auto_13091 ) ) ( not ( = ?auto_13070 ?auto_13096 ) ) ( not ( = ?auto_13082 ?auto_13093 ) ) ( not ( = ?auto_13082 ?auto_13080 ) ) ( not ( = ?auto_13082 ?auto_13085 ) ) ( not ( = ?auto_13089 ?auto_13079 ) ) ( not ( = ?auto_13089 ?auto_13081 ) ) ( not ( = ?auto_13089 ?auto_13084 ) ) ( not ( = ?auto_13097 ?auto_13088 ) ) ( not ( = ?auto_13097 ?auto_13090 ) ) ( not ( = ?auto_13097 ?auto_13091 ) ) ( not ( = ?auto_13097 ?auto_13096 ) ) ( not ( = ?auto_13064 ?auto_13069 ) ) ( not ( = ?auto_13064 ?auto_13083 ) ) ( not ( = ?auto_13065 ?auto_13069 ) ) ( not ( = ?auto_13065 ?auto_13083 ) ) ( not ( = ?auto_13066 ?auto_13069 ) ) ( not ( = ?auto_13066 ?auto_13083 ) ) ( not ( = ?auto_13067 ?auto_13069 ) ) ( not ( = ?auto_13067 ?auto_13083 ) ) ( not ( = ?auto_13068 ?auto_13069 ) ) ( not ( = ?auto_13068 ?auto_13083 ) ) ( not ( = ?auto_13069 ?auto_13097 ) ) ( not ( = ?auto_13069 ?auto_13088 ) ) ( not ( = ?auto_13069 ?auto_13090 ) ) ( not ( = ?auto_13069 ?auto_13091 ) ) ( not ( = ?auto_13069 ?auto_13096 ) ) ( not ( = ?auto_13086 ?auto_13082 ) ) ( not ( = ?auto_13086 ?auto_13093 ) ) ( not ( = ?auto_13086 ?auto_13080 ) ) ( not ( = ?auto_13086 ?auto_13085 ) ) ( not ( = ?auto_13087 ?auto_13089 ) ) ( not ( = ?auto_13087 ?auto_13079 ) ) ( not ( = ?auto_13087 ?auto_13081 ) ) ( not ( = ?auto_13087 ?auto_13084 ) ) ( not ( = ?auto_13083 ?auto_13097 ) ) ( not ( = ?auto_13083 ?auto_13088 ) ) ( not ( = ?auto_13083 ?auto_13090 ) ) ( not ( = ?auto_13083 ?auto_13091 ) ) ( not ( = ?auto_13083 ?auto_13096 ) ) ( not ( = ?auto_13064 ?auto_13072 ) ) ( not ( = ?auto_13064 ?auto_13092 ) ) ( not ( = ?auto_13065 ?auto_13072 ) ) ( not ( = ?auto_13065 ?auto_13092 ) ) ( not ( = ?auto_13066 ?auto_13072 ) ) ( not ( = ?auto_13066 ?auto_13092 ) ) ( not ( = ?auto_13067 ?auto_13072 ) ) ( not ( = ?auto_13067 ?auto_13092 ) ) ( not ( = ?auto_13068 ?auto_13072 ) ) ( not ( = ?auto_13068 ?auto_13092 ) ) ( not ( = ?auto_13070 ?auto_13072 ) ) ( not ( = ?auto_13070 ?auto_13092 ) ) ( not ( = ?auto_13072 ?auto_13083 ) ) ( not ( = ?auto_13072 ?auto_13097 ) ) ( not ( = ?auto_13072 ?auto_13088 ) ) ( not ( = ?auto_13072 ?auto_13090 ) ) ( not ( = ?auto_13072 ?auto_13091 ) ) ( not ( = ?auto_13072 ?auto_13096 ) ) ( not ( = ?auto_13095 ?auto_13086 ) ) ( not ( = ?auto_13095 ?auto_13082 ) ) ( not ( = ?auto_13095 ?auto_13093 ) ) ( not ( = ?auto_13095 ?auto_13080 ) ) ( not ( = ?auto_13095 ?auto_13085 ) ) ( not ( = ?auto_13094 ?auto_13087 ) ) ( not ( = ?auto_13094 ?auto_13089 ) ) ( not ( = ?auto_13094 ?auto_13079 ) ) ( not ( = ?auto_13094 ?auto_13081 ) ) ( not ( = ?auto_13094 ?auto_13084 ) ) ( not ( = ?auto_13092 ?auto_13083 ) ) ( not ( = ?auto_13092 ?auto_13097 ) ) ( not ( = ?auto_13092 ?auto_13088 ) ) ( not ( = ?auto_13092 ?auto_13090 ) ) ( not ( = ?auto_13092 ?auto_13091 ) ) ( not ( = ?auto_13092 ?auto_13096 ) ) ( not ( = ?auto_13064 ?auto_13071 ) ) ( not ( = ?auto_13064 ?auto_13076 ) ) ( not ( = ?auto_13065 ?auto_13071 ) ) ( not ( = ?auto_13065 ?auto_13076 ) ) ( not ( = ?auto_13066 ?auto_13071 ) ) ( not ( = ?auto_13066 ?auto_13076 ) ) ( not ( = ?auto_13067 ?auto_13071 ) ) ( not ( = ?auto_13067 ?auto_13076 ) ) ( not ( = ?auto_13068 ?auto_13071 ) ) ( not ( = ?auto_13068 ?auto_13076 ) ) ( not ( = ?auto_13070 ?auto_13071 ) ) ( not ( = ?auto_13070 ?auto_13076 ) ) ( not ( = ?auto_13069 ?auto_13071 ) ) ( not ( = ?auto_13069 ?auto_13076 ) ) ( not ( = ?auto_13071 ?auto_13092 ) ) ( not ( = ?auto_13071 ?auto_13083 ) ) ( not ( = ?auto_13071 ?auto_13097 ) ) ( not ( = ?auto_13071 ?auto_13088 ) ) ( not ( = ?auto_13071 ?auto_13090 ) ) ( not ( = ?auto_13071 ?auto_13091 ) ) ( not ( = ?auto_13071 ?auto_13096 ) ) ( not ( = ?auto_13077 ?auto_13095 ) ) ( not ( = ?auto_13077 ?auto_13086 ) ) ( not ( = ?auto_13077 ?auto_13082 ) ) ( not ( = ?auto_13077 ?auto_13093 ) ) ( not ( = ?auto_13077 ?auto_13080 ) ) ( not ( = ?auto_13077 ?auto_13085 ) ) ( not ( = ?auto_13078 ?auto_13094 ) ) ( not ( = ?auto_13078 ?auto_13087 ) ) ( not ( = ?auto_13078 ?auto_13089 ) ) ( not ( = ?auto_13078 ?auto_13079 ) ) ( not ( = ?auto_13078 ?auto_13081 ) ) ( not ( = ?auto_13078 ?auto_13084 ) ) ( not ( = ?auto_13076 ?auto_13092 ) ) ( not ( = ?auto_13076 ?auto_13083 ) ) ( not ( = ?auto_13076 ?auto_13097 ) ) ( not ( = ?auto_13076 ?auto_13088 ) ) ( not ( = ?auto_13076 ?auto_13090 ) ) ( not ( = ?auto_13076 ?auto_13091 ) ) ( not ( = ?auto_13076 ?auto_13096 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_13064 ?auto_13065 ?auto_13066 ?auto_13067 ?auto_13068 ?auto_13070 ?auto_13069 ?auto_13072 )
      ( MAKE-1CRATE ?auto_13072 ?auto_13071 )
      ( MAKE-8CRATE-VERIFY ?auto_13064 ?auto_13065 ?auto_13066 ?auto_13067 ?auto_13068 ?auto_13070 ?auto_13069 ?auto_13072 ?auto_13071 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13100 - SURFACE
      ?auto_13101 - SURFACE
    )
    :vars
    (
      ?auto_13102 - HOIST
      ?auto_13103 - PLACE
      ?auto_13105 - PLACE
      ?auto_13106 - HOIST
      ?auto_13107 - SURFACE
      ?auto_13104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13102 ?auto_13103 ) ( SURFACE-AT ?auto_13100 ?auto_13103 ) ( CLEAR ?auto_13100 ) ( IS-CRATE ?auto_13101 ) ( AVAILABLE ?auto_13102 ) ( not ( = ?auto_13105 ?auto_13103 ) ) ( HOIST-AT ?auto_13106 ?auto_13105 ) ( AVAILABLE ?auto_13106 ) ( SURFACE-AT ?auto_13101 ?auto_13105 ) ( ON ?auto_13101 ?auto_13107 ) ( CLEAR ?auto_13101 ) ( TRUCK-AT ?auto_13104 ?auto_13103 ) ( not ( = ?auto_13100 ?auto_13101 ) ) ( not ( = ?auto_13100 ?auto_13107 ) ) ( not ( = ?auto_13101 ?auto_13107 ) ) ( not ( = ?auto_13102 ?auto_13106 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13104 ?auto_13103 ?auto_13105 )
      ( !LIFT ?auto_13106 ?auto_13101 ?auto_13107 ?auto_13105 )
      ( !LOAD ?auto_13106 ?auto_13101 ?auto_13104 ?auto_13105 )
      ( !DRIVE ?auto_13104 ?auto_13105 ?auto_13103 )
      ( !UNLOAD ?auto_13102 ?auto_13101 ?auto_13104 ?auto_13103 )
      ( !DROP ?auto_13102 ?auto_13101 ?auto_13100 ?auto_13103 )
      ( MAKE-1CRATE-VERIFY ?auto_13100 ?auto_13101 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_13118 - SURFACE
      ?auto_13119 - SURFACE
      ?auto_13120 - SURFACE
      ?auto_13121 - SURFACE
      ?auto_13122 - SURFACE
      ?auto_13125 - SURFACE
      ?auto_13123 - SURFACE
      ?auto_13127 - SURFACE
      ?auto_13126 - SURFACE
      ?auto_13124 - SURFACE
    )
    :vars
    (
      ?auto_13132 - HOIST
      ?auto_13131 - PLACE
      ?auto_13133 - PLACE
      ?auto_13130 - HOIST
      ?auto_13128 - SURFACE
      ?auto_13136 - PLACE
      ?auto_13155 - HOIST
      ?auto_13135 - SURFACE
      ?auto_13141 - PLACE
      ?auto_13143 - HOIST
      ?auto_13149 - SURFACE
      ?auto_13150 - PLACE
      ?auto_13144 - HOIST
      ?auto_13153 - SURFACE
      ?auto_13134 - PLACE
      ?auto_13145 - HOIST
      ?auto_13142 - SURFACE
      ?auto_13137 - PLACE
      ?auto_13140 - HOIST
      ?auto_13146 - SURFACE
      ?auto_13138 - PLACE
      ?auto_13154 - HOIST
      ?auto_13147 - SURFACE
      ?auto_13151 - PLACE
      ?auto_13152 - HOIST
      ?auto_13148 - SURFACE
      ?auto_13139 - SURFACE
      ?auto_13129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13132 ?auto_13131 ) ( IS-CRATE ?auto_13124 ) ( not ( = ?auto_13133 ?auto_13131 ) ) ( HOIST-AT ?auto_13130 ?auto_13133 ) ( AVAILABLE ?auto_13130 ) ( SURFACE-AT ?auto_13124 ?auto_13133 ) ( ON ?auto_13124 ?auto_13128 ) ( CLEAR ?auto_13124 ) ( not ( = ?auto_13126 ?auto_13124 ) ) ( not ( = ?auto_13126 ?auto_13128 ) ) ( not ( = ?auto_13124 ?auto_13128 ) ) ( not ( = ?auto_13132 ?auto_13130 ) ) ( IS-CRATE ?auto_13126 ) ( not ( = ?auto_13136 ?auto_13131 ) ) ( HOIST-AT ?auto_13155 ?auto_13136 ) ( AVAILABLE ?auto_13155 ) ( SURFACE-AT ?auto_13126 ?auto_13136 ) ( ON ?auto_13126 ?auto_13135 ) ( CLEAR ?auto_13126 ) ( not ( = ?auto_13127 ?auto_13126 ) ) ( not ( = ?auto_13127 ?auto_13135 ) ) ( not ( = ?auto_13126 ?auto_13135 ) ) ( not ( = ?auto_13132 ?auto_13155 ) ) ( IS-CRATE ?auto_13127 ) ( not ( = ?auto_13141 ?auto_13131 ) ) ( HOIST-AT ?auto_13143 ?auto_13141 ) ( AVAILABLE ?auto_13143 ) ( SURFACE-AT ?auto_13127 ?auto_13141 ) ( ON ?auto_13127 ?auto_13149 ) ( CLEAR ?auto_13127 ) ( not ( = ?auto_13123 ?auto_13127 ) ) ( not ( = ?auto_13123 ?auto_13149 ) ) ( not ( = ?auto_13127 ?auto_13149 ) ) ( not ( = ?auto_13132 ?auto_13143 ) ) ( IS-CRATE ?auto_13123 ) ( not ( = ?auto_13150 ?auto_13131 ) ) ( HOIST-AT ?auto_13144 ?auto_13150 ) ( AVAILABLE ?auto_13144 ) ( SURFACE-AT ?auto_13123 ?auto_13150 ) ( ON ?auto_13123 ?auto_13153 ) ( CLEAR ?auto_13123 ) ( not ( = ?auto_13125 ?auto_13123 ) ) ( not ( = ?auto_13125 ?auto_13153 ) ) ( not ( = ?auto_13123 ?auto_13153 ) ) ( not ( = ?auto_13132 ?auto_13144 ) ) ( IS-CRATE ?auto_13125 ) ( not ( = ?auto_13134 ?auto_13131 ) ) ( HOIST-AT ?auto_13145 ?auto_13134 ) ( AVAILABLE ?auto_13145 ) ( SURFACE-AT ?auto_13125 ?auto_13134 ) ( ON ?auto_13125 ?auto_13142 ) ( CLEAR ?auto_13125 ) ( not ( = ?auto_13122 ?auto_13125 ) ) ( not ( = ?auto_13122 ?auto_13142 ) ) ( not ( = ?auto_13125 ?auto_13142 ) ) ( not ( = ?auto_13132 ?auto_13145 ) ) ( IS-CRATE ?auto_13122 ) ( not ( = ?auto_13137 ?auto_13131 ) ) ( HOIST-AT ?auto_13140 ?auto_13137 ) ( SURFACE-AT ?auto_13122 ?auto_13137 ) ( ON ?auto_13122 ?auto_13146 ) ( CLEAR ?auto_13122 ) ( not ( = ?auto_13121 ?auto_13122 ) ) ( not ( = ?auto_13121 ?auto_13146 ) ) ( not ( = ?auto_13122 ?auto_13146 ) ) ( not ( = ?auto_13132 ?auto_13140 ) ) ( IS-CRATE ?auto_13121 ) ( not ( = ?auto_13138 ?auto_13131 ) ) ( HOIST-AT ?auto_13154 ?auto_13138 ) ( AVAILABLE ?auto_13154 ) ( SURFACE-AT ?auto_13121 ?auto_13138 ) ( ON ?auto_13121 ?auto_13147 ) ( CLEAR ?auto_13121 ) ( not ( = ?auto_13120 ?auto_13121 ) ) ( not ( = ?auto_13120 ?auto_13147 ) ) ( not ( = ?auto_13121 ?auto_13147 ) ) ( not ( = ?auto_13132 ?auto_13154 ) ) ( IS-CRATE ?auto_13120 ) ( not ( = ?auto_13151 ?auto_13131 ) ) ( HOIST-AT ?auto_13152 ?auto_13151 ) ( AVAILABLE ?auto_13152 ) ( SURFACE-AT ?auto_13120 ?auto_13151 ) ( ON ?auto_13120 ?auto_13148 ) ( CLEAR ?auto_13120 ) ( not ( = ?auto_13119 ?auto_13120 ) ) ( not ( = ?auto_13119 ?auto_13148 ) ) ( not ( = ?auto_13120 ?auto_13148 ) ) ( not ( = ?auto_13132 ?auto_13152 ) ) ( SURFACE-AT ?auto_13118 ?auto_13131 ) ( CLEAR ?auto_13118 ) ( IS-CRATE ?auto_13119 ) ( AVAILABLE ?auto_13132 ) ( AVAILABLE ?auto_13140 ) ( SURFACE-AT ?auto_13119 ?auto_13137 ) ( ON ?auto_13119 ?auto_13139 ) ( CLEAR ?auto_13119 ) ( TRUCK-AT ?auto_13129 ?auto_13131 ) ( not ( = ?auto_13118 ?auto_13119 ) ) ( not ( = ?auto_13118 ?auto_13139 ) ) ( not ( = ?auto_13119 ?auto_13139 ) ) ( not ( = ?auto_13118 ?auto_13120 ) ) ( not ( = ?auto_13118 ?auto_13148 ) ) ( not ( = ?auto_13120 ?auto_13139 ) ) ( not ( = ?auto_13151 ?auto_13137 ) ) ( not ( = ?auto_13152 ?auto_13140 ) ) ( not ( = ?auto_13148 ?auto_13139 ) ) ( not ( = ?auto_13118 ?auto_13121 ) ) ( not ( = ?auto_13118 ?auto_13147 ) ) ( not ( = ?auto_13119 ?auto_13121 ) ) ( not ( = ?auto_13119 ?auto_13147 ) ) ( not ( = ?auto_13121 ?auto_13148 ) ) ( not ( = ?auto_13121 ?auto_13139 ) ) ( not ( = ?auto_13138 ?auto_13151 ) ) ( not ( = ?auto_13138 ?auto_13137 ) ) ( not ( = ?auto_13154 ?auto_13152 ) ) ( not ( = ?auto_13154 ?auto_13140 ) ) ( not ( = ?auto_13147 ?auto_13148 ) ) ( not ( = ?auto_13147 ?auto_13139 ) ) ( not ( = ?auto_13118 ?auto_13122 ) ) ( not ( = ?auto_13118 ?auto_13146 ) ) ( not ( = ?auto_13119 ?auto_13122 ) ) ( not ( = ?auto_13119 ?auto_13146 ) ) ( not ( = ?auto_13120 ?auto_13122 ) ) ( not ( = ?auto_13120 ?auto_13146 ) ) ( not ( = ?auto_13122 ?auto_13147 ) ) ( not ( = ?auto_13122 ?auto_13148 ) ) ( not ( = ?auto_13122 ?auto_13139 ) ) ( not ( = ?auto_13146 ?auto_13147 ) ) ( not ( = ?auto_13146 ?auto_13148 ) ) ( not ( = ?auto_13146 ?auto_13139 ) ) ( not ( = ?auto_13118 ?auto_13125 ) ) ( not ( = ?auto_13118 ?auto_13142 ) ) ( not ( = ?auto_13119 ?auto_13125 ) ) ( not ( = ?auto_13119 ?auto_13142 ) ) ( not ( = ?auto_13120 ?auto_13125 ) ) ( not ( = ?auto_13120 ?auto_13142 ) ) ( not ( = ?auto_13121 ?auto_13125 ) ) ( not ( = ?auto_13121 ?auto_13142 ) ) ( not ( = ?auto_13125 ?auto_13146 ) ) ( not ( = ?auto_13125 ?auto_13147 ) ) ( not ( = ?auto_13125 ?auto_13148 ) ) ( not ( = ?auto_13125 ?auto_13139 ) ) ( not ( = ?auto_13134 ?auto_13137 ) ) ( not ( = ?auto_13134 ?auto_13138 ) ) ( not ( = ?auto_13134 ?auto_13151 ) ) ( not ( = ?auto_13145 ?auto_13140 ) ) ( not ( = ?auto_13145 ?auto_13154 ) ) ( not ( = ?auto_13145 ?auto_13152 ) ) ( not ( = ?auto_13142 ?auto_13146 ) ) ( not ( = ?auto_13142 ?auto_13147 ) ) ( not ( = ?auto_13142 ?auto_13148 ) ) ( not ( = ?auto_13142 ?auto_13139 ) ) ( not ( = ?auto_13118 ?auto_13123 ) ) ( not ( = ?auto_13118 ?auto_13153 ) ) ( not ( = ?auto_13119 ?auto_13123 ) ) ( not ( = ?auto_13119 ?auto_13153 ) ) ( not ( = ?auto_13120 ?auto_13123 ) ) ( not ( = ?auto_13120 ?auto_13153 ) ) ( not ( = ?auto_13121 ?auto_13123 ) ) ( not ( = ?auto_13121 ?auto_13153 ) ) ( not ( = ?auto_13122 ?auto_13123 ) ) ( not ( = ?auto_13122 ?auto_13153 ) ) ( not ( = ?auto_13123 ?auto_13142 ) ) ( not ( = ?auto_13123 ?auto_13146 ) ) ( not ( = ?auto_13123 ?auto_13147 ) ) ( not ( = ?auto_13123 ?auto_13148 ) ) ( not ( = ?auto_13123 ?auto_13139 ) ) ( not ( = ?auto_13150 ?auto_13134 ) ) ( not ( = ?auto_13150 ?auto_13137 ) ) ( not ( = ?auto_13150 ?auto_13138 ) ) ( not ( = ?auto_13150 ?auto_13151 ) ) ( not ( = ?auto_13144 ?auto_13145 ) ) ( not ( = ?auto_13144 ?auto_13140 ) ) ( not ( = ?auto_13144 ?auto_13154 ) ) ( not ( = ?auto_13144 ?auto_13152 ) ) ( not ( = ?auto_13153 ?auto_13142 ) ) ( not ( = ?auto_13153 ?auto_13146 ) ) ( not ( = ?auto_13153 ?auto_13147 ) ) ( not ( = ?auto_13153 ?auto_13148 ) ) ( not ( = ?auto_13153 ?auto_13139 ) ) ( not ( = ?auto_13118 ?auto_13127 ) ) ( not ( = ?auto_13118 ?auto_13149 ) ) ( not ( = ?auto_13119 ?auto_13127 ) ) ( not ( = ?auto_13119 ?auto_13149 ) ) ( not ( = ?auto_13120 ?auto_13127 ) ) ( not ( = ?auto_13120 ?auto_13149 ) ) ( not ( = ?auto_13121 ?auto_13127 ) ) ( not ( = ?auto_13121 ?auto_13149 ) ) ( not ( = ?auto_13122 ?auto_13127 ) ) ( not ( = ?auto_13122 ?auto_13149 ) ) ( not ( = ?auto_13125 ?auto_13127 ) ) ( not ( = ?auto_13125 ?auto_13149 ) ) ( not ( = ?auto_13127 ?auto_13153 ) ) ( not ( = ?auto_13127 ?auto_13142 ) ) ( not ( = ?auto_13127 ?auto_13146 ) ) ( not ( = ?auto_13127 ?auto_13147 ) ) ( not ( = ?auto_13127 ?auto_13148 ) ) ( not ( = ?auto_13127 ?auto_13139 ) ) ( not ( = ?auto_13141 ?auto_13150 ) ) ( not ( = ?auto_13141 ?auto_13134 ) ) ( not ( = ?auto_13141 ?auto_13137 ) ) ( not ( = ?auto_13141 ?auto_13138 ) ) ( not ( = ?auto_13141 ?auto_13151 ) ) ( not ( = ?auto_13143 ?auto_13144 ) ) ( not ( = ?auto_13143 ?auto_13145 ) ) ( not ( = ?auto_13143 ?auto_13140 ) ) ( not ( = ?auto_13143 ?auto_13154 ) ) ( not ( = ?auto_13143 ?auto_13152 ) ) ( not ( = ?auto_13149 ?auto_13153 ) ) ( not ( = ?auto_13149 ?auto_13142 ) ) ( not ( = ?auto_13149 ?auto_13146 ) ) ( not ( = ?auto_13149 ?auto_13147 ) ) ( not ( = ?auto_13149 ?auto_13148 ) ) ( not ( = ?auto_13149 ?auto_13139 ) ) ( not ( = ?auto_13118 ?auto_13126 ) ) ( not ( = ?auto_13118 ?auto_13135 ) ) ( not ( = ?auto_13119 ?auto_13126 ) ) ( not ( = ?auto_13119 ?auto_13135 ) ) ( not ( = ?auto_13120 ?auto_13126 ) ) ( not ( = ?auto_13120 ?auto_13135 ) ) ( not ( = ?auto_13121 ?auto_13126 ) ) ( not ( = ?auto_13121 ?auto_13135 ) ) ( not ( = ?auto_13122 ?auto_13126 ) ) ( not ( = ?auto_13122 ?auto_13135 ) ) ( not ( = ?auto_13125 ?auto_13126 ) ) ( not ( = ?auto_13125 ?auto_13135 ) ) ( not ( = ?auto_13123 ?auto_13126 ) ) ( not ( = ?auto_13123 ?auto_13135 ) ) ( not ( = ?auto_13126 ?auto_13149 ) ) ( not ( = ?auto_13126 ?auto_13153 ) ) ( not ( = ?auto_13126 ?auto_13142 ) ) ( not ( = ?auto_13126 ?auto_13146 ) ) ( not ( = ?auto_13126 ?auto_13147 ) ) ( not ( = ?auto_13126 ?auto_13148 ) ) ( not ( = ?auto_13126 ?auto_13139 ) ) ( not ( = ?auto_13136 ?auto_13141 ) ) ( not ( = ?auto_13136 ?auto_13150 ) ) ( not ( = ?auto_13136 ?auto_13134 ) ) ( not ( = ?auto_13136 ?auto_13137 ) ) ( not ( = ?auto_13136 ?auto_13138 ) ) ( not ( = ?auto_13136 ?auto_13151 ) ) ( not ( = ?auto_13155 ?auto_13143 ) ) ( not ( = ?auto_13155 ?auto_13144 ) ) ( not ( = ?auto_13155 ?auto_13145 ) ) ( not ( = ?auto_13155 ?auto_13140 ) ) ( not ( = ?auto_13155 ?auto_13154 ) ) ( not ( = ?auto_13155 ?auto_13152 ) ) ( not ( = ?auto_13135 ?auto_13149 ) ) ( not ( = ?auto_13135 ?auto_13153 ) ) ( not ( = ?auto_13135 ?auto_13142 ) ) ( not ( = ?auto_13135 ?auto_13146 ) ) ( not ( = ?auto_13135 ?auto_13147 ) ) ( not ( = ?auto_13135 ?auto_13148 ) ) ( not ( = ?auto_13135 ?auto_13139 ) ) ( not ( = ?auto_13118 ?auto_13124 ) ) ( not ( = ?auto_13118 ?auto_13128 ) ) ( not ( = ?auto_13119 ?auto_13124 ) ) ( not ( = ?auto_13119 ?auto_13128 ) ) ( not ( = ?auto_13120 ?auto_13124 ) ) ( not ( = ?auto_13120 ?auto_13128 ) ) ( not ( = ?auto_13121 ?auto_13124 ) ) ( not ( = ?auto_13121 ?auto_13128 ) ) ( not ( = ?auto_13122 ?auto_13124 ) ) ( not ( = ?auto_13122 ?auto_13128 ) ) ( not ( = ?auto_13125 ?auto_13124 ) ) ( not ( = ?auto_13125 ?auto_13128 ) ) ( not ( = ?auto_13123 ?auto_13124 ) ) ( not ( = ?auto_13123 ?auto_13128 ) ) ( not ( = ?auto_13127 ?auto_13124 ) ) ( not ( = ?auto_13127 ?auto_13128 ) ) ( not ( = ?auto_13124 ?auto_13135 ) ) ( not ( = ?auto_13124 ?auto_13149 ) ) ( not ( = ?auto_13124 ?auto_13153 ) ) ( not ( = ?auto_13124 ?auto_13142 ) ) ( not ( = ?auto_13124 ?auto_13146 ) ) ( not ( = ?auto_13124 ?auto_13147 ) ) ( not ( = ?auto_13124 ?auto_13148 ) ) ( not ( = ?auto_13124 ?auto_13139 ) ) ( not ( = ?auto_13133 ?auto_13136 ) ) ( not ( = ?auto_13133 ?auto_13141 ) ) ( not ( = ?auto_13133 ?auto_13150 ) ) ( not ( = ?auto_13133 ?auto_13134 ) ) ( not ( = ?auto_13133 ?auto_13137 ) ) ( not ( = ?auto_13133 ?auto_13138 ) ) ( not ( = ?auto_13133 ?auto_13151 ) ) ( not ( = ?auto_13130 ?auto_13155 ) ) ( not ( = ?auto_13130 ?auto_13143 ) ) ( not ( = ?auto_13130 ?auto_13144 ) ) ( not ( = ?auto_13130 ?auto_13145 ) ) ( not ( = ?auto_13130 ?auto_13140 ) ) ( not ( = ?auto_13130 ?auto_13154 ) ) ( not ( = ?auto_13130 ?auto_13152 ) ) ( not ( = ?auto_13128 ?auto_13135 ) ) ( not ( = ?auto_13128 ?auto_13149 ) ) ( not ( = ?auto_13128 ?auto_13153 ) ) ( not ( = ?auto_13128 ?auto_13142 ) ) ( not ( = ?auto_13128 ?auto_13146 ) ) ( not ( = ?auto_13128 ?auto_13147 ) ) ( not ( = ?auto_13128 ?auto_13148 ) ) ( not ( = ?auto_13128 ?auto_13139 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_13118 ?auto_13119 ?auto_13120 ?auto_13121 ?auto_13122 ?auto_13125 ?auto_13123 ?auto_13127 ?auto_13126 )
      ( MAKE-1CRATE ?auto_13126 ?auto_13124 )
      ( MAKE-9CRATE-VERIFY ?auto_13118 ?auto_13119 ?auto_13120 ?auto_13121 ?auto_13122 ?auto_13125 ?auto_13123 ?auto_13127 ?auto_13126 ?auto_13124 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13158 - SURFACE
      ?auto_13159 - SURFACE
    )
    :vars
    (
      ?auto_13160 - HOIST
      ?auto_13161 - PLACE
      ?auto_13163 - PLACE
      ?auto_13164 - HOIST
      ?auto_13165 - SURFACE
      ?auto_13162 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13160 ?auto_13161 ) ( SURFACE-AT ?auto_13158 ?auto_13161 ) ( CLEAR ?auto_13158 ) ( IS-CRATE ?auto_13159 ) ( AVAILABLE ?auto_13160 ) ( not ( = ?auto_13163 ?auto_13161 ) ) ( HOIST-AT ?auto_13164 ?auto_13163 ) ( AVAILABLE ?auto_13164 ) ( SURFACE-AT ?auto_13159 ?auto_13163 ) ( ON ?auto_13159 ?auto_13165 ) ( CLEAR ?auto_13159 ) ( TRUCK-AT ?auto_13162 ?auto_13161 ) ( not ( = ?auto_13158 ?auto_13159 ) ) ( not ( = ?auto_13158 ?auto_13165 ) ) ( not ( = ?auto_13159 ?auto_13165 ) ) ( not ( = ?auto_13160 ?auto_13164 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13162 ?auto_13161 ?auto_13163 )
      ( !LIFT ?auto_13164 ?auto_13159 ?auto_13165 ?auto_13163 )
      ( !LOAD ?auto_13164 ?auto_13159 ?auto_13162 ?auto_13163 )
      ( !DRIVE ?auto_13162 ?auto_13163 ?auto_13161 )
      ( !UNLOAD ?auto_13160 ?auto_13159 ?auto_13162 ?auto_13161 )
      ( !DROP ?auto_13160 ?auto_13159 ?auto_13158 ?auto_13161 )
      ( MAKE-1CRATE-VERIFY ?auto_13158 ?auto_13159 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_13177 - SURFACE
      ?auto_13178 - SURFACE
      ?auto_13179 - SURFACE
      ?auto_13180 - SURFACE
      ?auto_13181 - SURFACE
      ?auto_13184 - SURFACE
      ?auto_13182 - SURFACE
      ?auto_13186 - SURFACE
      ?auto_13185 - SURFACE
      ?auto_13183 - SURFACE
      ?auto_13187 - SURFACE
    )
    :vars
    (
      ?auto_13192 - HOIST
      ?auto_13188 - PLACE
      ?auto_13191 - PLACE
      ?auto_13193 - HOIST
      ?auto_13190 - SURFACE
      ?auto_13197 - PLACE
      ?auto_13209 - HOIST
      ?auto_13200 - SURFACE
      ?auto_13218 - PLACE
      ?auto_13199 - HOIST
      ?auto_13205 - SURFACE
      ?auto_13204 - PLACE
      ?auto_13202 - HOIST
      ?auto_13207 - SURFACE
      ?auto_13217 - PLACE
      ?auto_13198 - HOIST
      ?auto_13216 - SURFACE
      ?auto_13213 - PLACE
      ?auto_13206 - HOIST
      ?auto_13201 - SURFACE
      ?auto_13210 - PLACE
      ?auto_13194 - HOIST
      ?auto_13208 - SURFACE
      ?auto_13215 - PLACE
      ?auto_13196 - HOIST
      ?auto_13203 - SURFACE
      ?auto_13211 - PLACE
      ?auto_13214 - HOIST
      ?auto_13212 - SURFACE
      ?auto_13195 - SURFACE
      ?auto_13189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13192 ?auto_13188 ) ( IS-CRATE ?auto_13187 ) ( not ( = ?auto_13191 ?auto_13188 ) ) ( HOIST-AT ?auto_13193 ?auto_13191 ) ( AVAILABLE ?auto_13193 ) ( SURFACE-AT ?auto_13187 ?auto_13191 ) ( ON ?auto_13187 ?auto_13190 ) ( CLEAR ?auto_13187 ) ( not ( = ?auto_13183 ?auto_13187 ) ) ( not ( = ?auto_13183 ?auto_13190 ) ) ( not ( = ?auto_13187 ?auto_13190 ) ) ( not ( = ?auto_13192 ?auto_13193 ) ) ( IS-CRATE ?auto_13183 ) ( not ( = ?auto_13197 ?auto_13188 ) ) ( HOIST-AT ?auto_13209 ?auto_13197 ) ( AVAILABLE ?auto_13209 ) ( SURFACE-AT ?auto_13183 ?auto_13197 ) ( ON ?auto_13183 ?auto_13200 ) ( CLEAR ?auto_13183 ) ( not ( = ?auto_13185 ?auto_13183 ) ) ( not ( = ?auto_13185 ?auto_13200 ) ) ( not ( = ?auto_13183 ?auto_13200 ) ) ( not ( = ?auto_13192 ?auto_13209 ) ) ( IS-CRATE ?auto_13185 ) ( not ( = ?auto_13218 ?auto_13188 ) ) ( HOIST-AT ?auto_13199 ?auto_13218 ) ( AVAILABLE ?auto_13199 ) ( SURFACE-AT ?auto_13185 ?auto_13218 ) ( ON ?auto_13185 ?auto_13205 ) ( CLEAR ?auto_13185 ) ( not ( = ?auto_13186 ?auto_13185 ) ) ( not ( = ?auto_13186 ?auto_13205 ) ) ( not ( = ?auto_13185 ?auto_13205 ) ) ( not ( = ?auto_13192 ?auto_13199 ) ) ( IS-CRATE ?auto_13186 ) ( not ( = ?auto_13204 ?auto_13188 ) ) ( HOIST-AT ?auto_13202 ?auto_13204 ) ( AVAILABLE ?auto_13202 ) ( SURFACE-AT ?auto_13186 ?auto_13204 ) ( ON ?auto_13186 ?auto_13207 ) ( CLEAR ?auto_13186 ) ( not ( = ?auto_13182 ?auto_13186 ) ) ( not ( = ?auto_13182 ?auto_13207 ) ) ( not ( = ?auto_13186 ?auto_13207 ) ) ( not ( = ?auto_13192 ?auto_13202 ) ) ( IS-CRATE ?auto_13182 ) ( not ( = ?auto_13217 ?auto_13188 ) ) ( HOIST-AT ?auto_13198 ?auto_13217 ) ( AVAILABLE ?auto_13198 ) ( SURFACE-AT ?auto_13182 ?auto_13217 ) ( ON ?auto_13182 ?auto_13216 ) ( CLEAR ?auto_13182 ) ( not ( = ?auto_13184 ?auto_13182 ) ) ( not ( = ?auto_13184 ?auto_13216 ) ) ( not ( = ?auto_13182 ?auto_13216 ) ) ( not ( = ?auto_13192 ?auto_13198 ) ) ( IS-CRATE ?auto_13184 ) ( not ( = ?auto_13213 ?auto_13188 ) ) ( HOIST-AT ?auto_13206 ?auto_13213 ) ( AVAILABLE ?auto_13206 ) ( SURFACE-AT ?auto_13184 ?auto_13213 ) ( ON ?auto_13184 ?auto_13201 ) ( CLEAR ?auto_13184 ) ( not ( = ?auto_13181 ?auto_13184 ) ) ( not ( = ?auto_13181 ?auto_13201 ) ) ( not ( = ?auto_13184 ?auto_13201 ) ) ( not ( = ?auto_13192 ?auto_13206 ) ) ( IS-CRATE ?auto_13181 ) ( not ( = ?auto_13210 ?auto_13188 ) ) ( HOIST-AT ?auto_13194 ?auto_13210 ) ( SURFACE-AT ?auto_13181 ?auto_13210 ) ( ON ?auto_13181 ?auto_13208 ) ( CLEAR ?auto_13181 ) ( not ( = ?auto_13180 ?auto_13181 ) ) ( not ( = ?auto_13180 ?auto_13208 ) ) ( not ( = ?auto_13181 ?auto_13208 ) ) ( not ( = ?auto_13192 ?auto_13194 ) ) ( IS-CRATE ?auto_13180 ) ( not ( = ?auto_13215 ?auto_13188 ) ) ( HOIST-AT ?auto_13196 ?auto_13215 ) ( AVAILABLE ?auto_13196 ) ( SURFACE-AT ?auto_13180 ?auto_13215 ) ( ON ?auto_13180 ?auto_13203 ) ( CLEAR ?auto_13180 ) ( not ( = ?auto_13179 ?auto_13180 ) ) ( not ( = ?auto_13179 ?auto_13203 ) ) ( not ( = ?auto_13180 ?auto_13203 ) ) ( not ( = ?auto_13192 ?auto_13196 ) ) ( IS-CRATE ?auto_13179 ) ( not ( = ?auto_13211 ?auto_13188 ) ) ( HOIST-AT ?auto_13214 ?auto_13211 ) ( AVAILABLE ?auto_13214 ) ( SURFACE-AT ?auto_13179 ?auto_13211 ) ( ON ?auto_13179 ?auto_13212 ) ( CLEAR ?auto_13179 ) ( not ( = ?auto_13178 ?auto_13179 ) ) ( not ( = ?auto_13178 ?auto_13212 ) ) ( not ( = ?auto_13179 ?auto_13212 ) ) ( not ( = ?auto_13192 ?auto_13214 ) ) ( SURFACE-AT ?auto_13177 ?auto_13188 ) ( CLEAR ?auto_13177 ) ( IS-CRATE ?auto_13178 ) ( AVAILABLE ?auto_13192 ) ( AVAILABLE ?auto_13194 ) ( SURFACE-AT ?auto_13178 ?auto_13210 ) ( ON ?auto_13178 ?auto_13195 ) ( CLEAR ?auto_13178 ) ( TRUCK-AT ?auto_13189 ?auto_13188 ) ( not ( = ?auto_13177 ?auto_13178 ) ) ( not ( = ?auto_13177 ?auto_13195 ) ) ( not ( = ?auto_13178 ?auto_13195 ) ) ( not ( = ?auto_13177 ?auto_13179 ) ) ( not ( = ?auto_13177 ?auto_13212 ) ) ( not ( = ?auto_13179 ?auto_13195 ) ) ( not ( = ?auto_13211 ?auto_13210 ) ) ( not ( = ?auto_13214 ?auto_13194 ) ) ( not ( = ?auto_13212 ?auto_13195 ) ) ( not ( = ?auto_13177 ?auto_13180 ) ) ( not ( = ?auto_13177 ?auto_13203 ) ) ( not ( = ?auto_13178 ?auto_13180 ) ) ( not ( = ?auto_13178 ?auto_13203 ) ) ( not ( = ?auto_13180 ?auto_13212 ) ) ( not ( = ?auto_13180 ?auto_13195 ) ) ( not ( = ?auto_13215 ?auto_13211 ) ) ( not ( = ?auto_13215 ?auto_13210 ) ) ( not ( = ?auto_13196 ?auto_13214 ) ) ( not ( = ?auto_13196 ?auto_13194 ) ) ( not ( = ?auto_13203 ?auto_13212 ) ) ( not ( = ?auto_13203 ?auto_13195 ) ) ( not ( = ?auto_13177 ?auto_13181 ) ) ( not ( = ?auto_13177 ?auto_13208 ) ) ( not ( = ?auto_13178 ?auto_13181 ) ) ( not ( = ?auto_13178 ?auto_13208 ) ) ( not ( = ?auto_13179 ?auto_13181 ) ) ( not ( = ?auto_13179 ?auto_13208 ) ) ( not ( = ?auto_13181 ?auto_13203 ) ) ( not ( = ?auto_13181 ?auto_13212 ) ) ( not ( = ?auto_13181 ?auto_13195 ) ) ( not ( = ?auto_13208 ?auto_13203 ) ) ( not ( = ?auto_13208 ?auto_13212 ) ) ( not ( = ?auto_13208 ?auto_13195 ) ) ( not ( = ?auto_13177 ?auto_13184 ) ) ( not ( = ?auto_13177 ?auto_13201 ) ) ( not ( = ?auto_13178 ?auto_13184 ) ) ( not ( = ?auto_13178 ?auto_13201 ) ) ( not ( = ?auto_13179 ?auto_13184 ) ) ( not ( = ?auto_13179 ?auto_13201 ) ) ( not ( = ?auto_13180 ?auto_13184 ) ) ( not ( = ?auto_13180 ?auto_13201 ) ) ( not ( = ?auto_13184 ?auto_13208 ) ) ( not ( = ?auto_13184 ?auto_13203 ) ) ( not ( = ?auto_13184 ?auto_13212 ) ) ( not ( = ?auto_13184 ?auto_13195 ) ) ( not ( = ?auto_13213 ?auto_13210 ) ) ( not ( = ?auto_13213 ?auto_13215 ) ) ( not ( = ?auto_13213 ?auto_13211 ) ) ( not ( = ?auto_13206 ?auto_13194 ) ) ( not ( = ?auto_13206 ?auto_13196 ) ) ( not ( = ?auto_13206 ?auto_13214 ) ) ( not ( = ?auto_13201 ?auto_13208 ) ) ( not ( = ?auto_13201 ?auto_13203 ) ) ( not ( = ?auto_13201 ?auto_13212 ) ) ( not ( = ?auto_13201 ?auto_13195 ) ) ( not ( = ?auto_13177 ?auto_13182 ) ) ( not ( = ?auto_13177 ?auto_13216 ) ) ( not ( = ?auto_13178 ?auto_13182 ) ) ( not ( = ?auto_13178 ?auto_13216 ) ) ( not ( = ?auto_13179 ?auto_13182 ) ) ( not ( = ?auto_13179 ?auto_13216 ) ) ( not ( = ?auto_13180 ?auto_13182 ) ) ( not ( = ?auto_13180 ?auto_13216 ) ) ( not ( = ?auto_13181 ?auto_13182 ) ) ( not ( = ?auto_13181 ?auto_13216 ) ) ( not ( = ?auto_13182 ?auto_13201 ) ) ( not ( = ?auto_13182 ?auto_13208 ) ) ( not ( = ?auto_13182 ?auto_13203 ) ) ( not ( = ?auto_13182 ?auto_13212 ) ) ( not ( = ?auto_13182 ?auto_13195 ) ) ( not ( = ?auto_13217 ?auto_13213 ) ) ( not ( = ?auto_13217 ?auto_13210 ) ) ( not ( = ?auto_13217 ?auto_13215 ) ) ( not ( = ?auto_13217 ?auto_13211 ) ) ( not ( = ?auto_13198 ?auto_13206 ) ) ( not ( = ?auto_13198 ?auto_13194 ) ) ( not ( = ?auto_13198 ?auto_13196 ) ) ( not ( = ?auto_13198 ?auto_13214 ) ) ( not ( = ?auto_13216 ?auto_13201 ) ) ( not ( = ?auto_13216 ?auto_13208 ) ) ( not ( = ?auto_13216 ?auto_13203 ) ) ( not ( = ?auto_13216 ?auto_13212 ) ) ( not ( = ?auto_13216 ?auto_13195 ) ) ( not ( = ?auto_13177 ?auto_13186 ) ) ( not ( = ?auto_13177 ?auto_13207 ) ) ( not ( = ?auto_13178 ?auto_13186 ) ) ( not ( = ?auto_13178 ?auto_13207 ) ) ( not ( = ?auto_13179 ?auto_13186 ) ) ( not ( = ?auto_13179 ?auto_13207 ) ) ( not ( = ?auto_13180 ?auto_13186 ) ) ( not ( = ?auto_13180 ?auto_13207 ) ) ( not ( = ?auto_13181 ?auto_13186 ) ) ( not ( = ?auto_13181 ?auto_13207 ) ) ( not ( = ?auto_13184 ?auto_13186 ) ) ( not ( = ?auto_13184 ?auto_13207 ) ) ( not ( = ?auto_13186 ?auto_13216 ) ) ( not ( = ?auto_13186 ?auto_13201 ) ) ( not ( = ?auto_13186 ?auto_13208 ) ) ( not ( = ?auto_13186 ?auto_13203 ) ) ( not ( = ?auto_13186 ?auto_13212 ) ) ( not ( = ?auto_13186 ?auto_13195 ) ) ( not ( = ?auto_13204 ?auto_13217 ) ) ( not ( = ?auto_13204 ?auto_13213 ) ) ( not ( = ?auto_13204 ?auto_13210 ) ) ( not ( = ?auto_13204 ?auto_13215 ) ) ( not ( = ?auto_13204 ?auto_13211 ) ) ( not ( = ?auto_13202 ?auto_13198 ) ) ( not ( = ?auto_13202 ?auto_13206 ) ) ( not ( = ?auto_13202 ?auto_13194 ) ) ( not ( = ?auto_13202 ?auto_13196 ) ) ( not ( = ?auto_13202 ?auto_13214 ) ) ( not ( = ?auto_13207 ?auto_13216 ) ) ( not ( = ?auto_13207 ?auto_13201 ) ) ( not ( = ?auto_13207 ?auto_13208 ) ) ( not ( = ?auto_13207 ?auto_13203 ) ) ( not ( = ?auto_13207 ?auto_13212 ) ) ( not ( = ?auto_13207 ?auto_13195 ) ) ( not ( = ?auto_13177 ?auto_13185 ) ) ( not ( = ?auto_13177 ?auto_13205 ) ) ( not ( = ?auto_13178 ?auto_13185 ) ) ( not ( = ?auto_13178 ?auto_13205 ) ) ( not ( = ?auto_13179 ?auto_13185 ) ) ( not ( = ?auto_13179 ?auto_13205 ) ) ( not ( = ?auto_13180 ?auto_13185 ) ) ( not ( = ?auto_13180 ?auto_13205 ) ) ( not ( = ?auto_13181 ?auto_13185 ) ) ( not ( = ?auto_13181 ?auto_13205 ) ) ( not ( = ?auto_13184 ?auto_13185 ) ) ( not ( = ?auto_13184 ?auto_13205 ) ) ( not ( = ?auto_13182 ?auto_13185 ) ) ( not ( = ?auto_13182 ?auto_13205 ) ) ( not ( = ?auto_13185 ?auto_13207 ) ) ( not ( = ?auto_13185 ?auto_13216 ) ) ( not ( = ?auto_13185 ?auto_13201 ) ) ( not ( = ?auto_13185 ?auto_13208 ) ) ( not ( = ?auto_13185 ?auto_13203 ) ) ( not ( = ?auto_13185 ?auto_13212 ) ) ( not ( = ?auto_13185 ?auto_13195 ) ) ( not ( = ?auto_13218 ?auto_13204 ) ) ( not ( = ?auto_13218 ?auto_13217 ) ) ( not ( = ?auto_13218 ?auto_13213 ) ) ( not ( = ?auto_13218 ?auto_13210 ) ) ( not ( = ?auto_13218 ?auto_13215 ) ) ( not ( = ?auto_13218 ?auto_13211 ) ) ( not ( = ?auto_13199 ?auto_13202 ) ) ( not ( = ?auto_13199 ?auto_13198 ) ) ( not ( = ?auto_13199 ?auto_13206 ) ) ( not ( = ?auto_13199 ?auto_13194 ) ) ( not ( = ?auto_13199 ?auto_13196 ) ) ( not ( = ?auto_13199 ?auto_13214 ) ) ( not ( = ?auto_13205 ?auto_13207 ) ) ( not ( = ?auto_13205 ?auto_13216 ) ) ( not ( = ?auto_13205 ?auto_13201 ) ) ( not ( = ?auto_13205 ?auto_13208 ) ) ( not ( = ?auto_13205 ?auto_13203 ) ) ( not ( = ?auto_13205 ?auto_13212 ) ) ( not ( = ?auto_13205 ?auto_13195 ) ) ( not ( = ?auto_13177 ?auto_13183 ) ) ( not ( = ?auto_13177 ?auto_13200 ) ) ( not ( = ?auto_13178 ?auto_13183 ) ) ( not ( = ?auto_13178 ?auto_13200 ) ) ( not ( = ?auto_13179 ?auto_13183 ) ) ( not ( = ?auto_13179 ?auto_13200 ) ) ( not ( = ?auto_13180 ?auto_13183 ) ) ( not ( = ?auto_13180 ?auto_13200 ) ) ( not ( = ?auto_13181 ?auto_13183 ) ) ( not ( = ?auto_13181 ?auto_13200 ) ) ( not ( = ?auto_13184 ?auto_13183 ) ) ( not ( = ?auto_13184 ?auto_13200 ) ) ( not ( = ?auto_13182 ?auto_13183 ) ) ( not ( = ?auto_13182 ?auto_13200 ) ) ( not ( = ?auto_13186 ?auto_13183 ) ) ( not ( = ?auto_13186 ?auto_13200 ) ) ( not ( = ?auto_13183 ?auto_13205 ) ) ( not ( = ?auto_13183 ?auto_13207 ) ) ( not ( = ?auto_13183 ?auto_13216 ) ) ( not ( = ?auto_13183 ?auto_13201 ) ) ( not ( = ?auto_13183 ?auto_13208 ) ) ( not ( = ?auto_13183 ?auto_13203 ) ) ( not ( = ?auto_13183 ?auto_13212 ) ) ( not ( = ?auto_13183 ?auto_13195 ) ) ( not ( = ?auto_13197 ?auto_13218 ) ) ( not ( = ?auto_13197 ?auto_13204 ) ) ( not ( = ?auto_13197 ?auto_13217 ) ) ( not ( = ?auto_13197 ?auto_13213 ) ) ( not ( = ?auto_13197 ?auto_13210 ) ) ( not ( = ?auto_13197 ?auto_13215 ) ) ( not ( = ?auto_13197 ?auto_13211 ) ) ( not ( = ?auto_13209 ?auto_13199 ) ) ( not ( = ?auto_13209 ?auto_13202 ) ) ( not ( = ?auto_13209 ?auto_13198 ) ) ( not ( = ?auto_13209 ?auto_13206 ) ) ( not ( = ?auto_13209 ?auto_13194 ) ) ( not ( = ?auto_13209 ?auto_13196 ) ) ( not ( = ?auto_13209 ?auto_13214 ) ) ( not ( = ?auto_13200 ?auto_13205 ) ) ( not ( = ?auto_13200 ?auto_13207 ) ) ( not ( = ?auto_13200 ?auto_13216 ) ) ( not ( = ?auto_13200 ?auto_13201 ) ) ( not ( = ?auto_13200 ?auto_13208 ) ) ( not ( = ?auto_13200 ?auto_13203 ) ) ( not ( = ?auto_13200 ?auto_13212 ) ) ( not ( = ?auto_13200 ?auto_13195 ) ) ( not ( = ?auto_13177 ?auto_13187 ) ) ( not ( = ?auto_13177 ?auto_13190 ) ) ( not ( = ?auto_13178 ?auto_13187 ) ) ( not ( = ?auto_13178 ?auto_13190 ) ) ( not ( = ?auto_13179 ?auto_13187 ) ) ( not ( = ?auto_13179 ?auto_13190 ) ) ( not ( = ?auto_13180 ?auto_13187 ) ) ( not ( = ?auto_13180 ?auto_13190 ) ) ( not ( = ?auto_13181 ?auto_13187 ) ) ( not ( = ?auto_13181 ?auto_13190 ) ) ( not ( = ?auto_13184 ?auto_13187 ) ) ( not ( = ?auto_13184 ?auto_13190 ) ) ( not ( = ?auto_13182 ?auto_13187 ) ) ( not ( = ?auto_13182 ?auto_13190 ) ) ( not ( = ?auto_13186 ?auto_13187 ) ) ( not ( = ?auto_13186 ?auto_13190 ) ) ( not ( = ?auto_13185 ?auto_13187 ) ) ( not ( = ?auto_13185 ?auto_13190 ) ) ( not ( = ?auto_13187 ?auto_13200 ) ) ( not ( = ?auto_13187 ?auto_13205 ) ) ( not ( = ?auto_13187 ?auto_13207 ) ) ( not ( = ?auto_13187 ?auto_13216 ) ) ( not ( = ?auto_13187 ?auto_13201 ) ) ( not ( = ?auto_13187 ?auto_13208 ) ) ( not ( = ?auto_13187 ?auto_13203 ) ) ( not ( = ?auto_13187 ?auto_13212 ) ) ( not ( = ?auto_13187 ?auto_13195 ) ) ( not ( = ?auto_13191 ?auto_13197 ) ) ( not ( = ?auto_13191 ?auto_13218 ) ) ( not ( = ?auto_13191 ?auto_13204 ) ) ( not ( = ?auto_13191 ?auto_13217 ) ) ( not ( = ?auto_13191 ?auto_13213 ) ) ( not ( = ?auto_13191 ?auto_13210 ) ) ( not ( = ?auto_13191 ?auto_13215 ) ) ( not ( = ?auto_13191 ?auto_13211 ) ) ( not ( = ?auto_13193 ?auto_13209 ) ) ( not ( = ?auto_13193 ?auto_13199 ) ) ( not ( = ?auto_13193 ?auto_13202 ) ) ( not ( = ?auto_13193 ?auto_13198 ) ) ( not ( = ?auto_13193 ?auto_13206 ) ) ( not ( = ?auto_13193 ?auto_13194 ) ) ( not ( = ?auto_13193 ?auto_13196 ) ) ( not ( = ?auto_13193 ?auto_13214 ) ) ( not ( = ?auto_13190 ?auto_13200 ) ) ( not ( = ?auto_13190 ?auto_13205 ) ) ( not ( = ?auto_13190 ?auto_13207 ) ) ( not ( = ?auto_13190 ?auto_13216 ) ) ( not ( = ?auto_13190 ?auto_13201 ) ) ( not ( = ?auto_13190 ?auto_13208 ) ) ( not ( = ?auto_13190 ?auto_13203 ) ) ( not ( = ?auto_13190 ?auto_13212 ) ) ( not ( = ?auto_13190 ?auto_13195 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_13177 ?auto_13178 ?auto_13179 ?auto_13180 ?auto_13181 ?auto_13184 ?auto_13182 ?auto_13186 ?auto_13185 ?auto_13183 )
      ( MAKE-1CRATE ?auto_13183 ?auto_13187 )
      ( MAKE-10CRATE-VERIFY ?auto_13177 ?auto_13178 ?auto_13179 ?auto_13180 ?auto_13181 ?auto_13184 ?auto_13182 ?auto_13186 ?auto_13185 ?auto_13183 ?auto_13187 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13221 - SURFACE
      ?auto_13222 - SURFACE
    )
    :vars
    (
      ?auto_13223 - HOIST
      ?auto_13224 - PLACE
      ?auto_13226 - PLACE
      ?auto_13227 - HOIST
      ?auto_13228 - SURFACE
      ?auto_13225 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13223 ?auto_13224 ) ( SURFACE-AT ?auto_13221 ?auto_13224 ) ( CLEAR ?auto_13221 ) ( IS-CRATE ?auto_13222 ) ( AVAILABLE ?auto_13223 ) ( not ( = ?auto_13226 ?auto_13224 ) ) ( HOIST-AT ?auto_13227 ?auto_13226 ) ( AVAILABLE ?auto_13227 ) ( SURFACE-AT ?auto_13222 ?auto_13226 ) ( ON ?auto_13222 ?auto_13228 ) ( CLEAR ?auto_13222 ) ( TRUCK-AT ?auto_13225 ?auto_13224 ) ( not ( = ?auto_13221 ?auto_13222 ) ) ( not ( = ?auto_13221 ?auto_13228 ) ) ( not ( = ?auto_13222 ?auto_13228 ) ) ( not ( = ?auto_13223 ?auto_13227 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13225 ?auto_13224 ?auto_13226 )
      ( !LIFT ?auto_13227 ?auto_13222 ?auto_13228 ?auto_13226 )
      ( !LOAD ?auto_13227 ?auto_13222 ?auto_13225 ?auto_13226 )
      ( !DRIVE ?auto_13225 ?auto_13226 ?auto_13224 )
      ( !UNLOAD ?auto_13223 ?auto_13222 ?auto_13225 ?auto_13224 )
      ( !DROP ?auto_13223 ?auto_13222 ?auto_13221 ?auto_13224 )
      ( MAKE-1CRATE-VERIFY ?auto_13221 ?auto_13222 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_13241 - SURFACE
      ?auto_13242 - SURFACE
      ?auto_13243 - SURFACE
      ?auto_13244 - SURFACE
      ?auto_13245 - SURFACE
      ?auto_13248 - SURFACE
      ?auto_13246 - SURFACE
      ?auto_13250 - SURFACE
      ?auto_13249 - SURFACE
      ?auto_13247 - SURFACE
      ?auto_13252 - SURFACE
      ?auto_13251 - SURFACE
    )
    :vars
    (
      ?auto_13256 - HOIST
      ?auto_13258 - PLACE
      ?auto_13257 - PLACE
      ?auto_13255 - HOIST
      ?auto_13253 - SURFACE
      ?auto_13274 - PLACE
      ?auto_13273 - HOIST
      ?auto_13265 - SURFACE
      ?auto_13259 - PLACE
      ?auto_13269 - HOIST
      ?auto_13267 - SURFACE
      ?auto_13270 - PLACE
      ?auto_13283 - HOIST
      ?auto_13261 - SURFACE
      ?auto_13272 - PLACE
      ?auto_13284 - HOIST
      ?auto_13268 - SURFACE
      ?auto_13262 - PLACE
      ?auto_13276 - HOIST
      ?auto_13278 - SURFACE
      ?auto_13280 - PLACE
      ?auto_13271 - HOIST
      ?auto_13277 - SURFACE
      ?auto_13260 - PLACE
      ?auto_13281 - HOIST
      ?auto_13263 - SURFACE
      ?auto_13264 - SURFACE
      ?auto_13275 - PLACE
      ?auto_13279 - HOIST
      ?auto_13282 - SURFACE
      ?auto_13266 - SURFACE
      ?auto_13254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13256 ?auto_13258 ) ( IS-CRATE ?auto_13251 ) ( not ( = ?auto_13257 ?auto_13258 ) ) ( HOIST-AT ?auto_13255 ?auto_13257 ) ( SURFACE-AT ?auto_13251 ?auto_13257 ) ( ON ?auto_13251 ?auto_13253 ) ( CLEAR ?auto_13251 ) ( not ( = ?auto_13252 ?auto_13251 ) ) ( not ( = ?auto_13252 ?auto_13253 ) ) ( not ( = ?auto_13251 ?auto_13253 ) ) ( not ( = ?auto_13256 ?auto_13255 ) ) ( IS-CRATE ?auto_13252 ) ( not ( = ?auto_13274 ?auto_13258 ) ) ( HOIST-AT ?auto_13273 ?auto_13274 ) ( AVAILABLE ?auto_13273 ) ( SURFACE-AT ?auto_13252 ?auto_13274 ) ( ON ?auto_13252 ?auto_13265 ) ( CLEAR ?auto_13252 ) ( not ( = ?auto_13247 ?auto_13252 ) ) ( not ( = ?auto_13247 ?auto_13265 ) ) ( not ( = ?auto_13252 ?auto_13265 ) ) ( not ( = ?auto_13256 ?auto_13273 ) ) ( IS-CRATE ?auto_13247 ) ( not ( = ?auto_13259 ?auto_13258 ) ) ( HOIST-AT ?auto_13269 ?auto_13259 ) ( AVAILABLE ?auto_13269 ) ( SURFACE-AT ?auto_13247 ?auto_13259 ) ( ON ?auto_13247 ?auto_13267 ) ( CLEAR ?auto_13247 ) ( not ( = ?auto_13249 ?auto_13247 ) ) ( not ( = ?auto_13249 ?auto_13267 ) ) ( not ( = ?auto_13247 ?auto_13267 ) ) ( not ( = ?auto_13256 ?auto_13269 ) ) ( IS-CRATE ?auto_13249 ) ( not ( = ?auto_13270 ?auto_13258 ) ) ( HOIST-AT ?auto_13283 ?auto_13270 ) ( AVAILABLE ?auto_13283 ) ( SURFACE-AT ?auto_13249 ?auto_13270 ) ( ON ?auto_13249 ?auto_13261 ) ( CLEAR ?auto_13249 ) ( not ( = ?auto_13250 ?auto_13249 ) ) ( not ( = ?auto_13250 ?auto_13261 ) ) ( not ( = ?auto_13249 ?auto_13261 ) ) ( not ( = ?auto_13256 ?auto_13283 ) ) ( IS-CRATE ?auto_13250 ) ( not ( = ?auto_13272 ?auto_13258 ) ) ( HOIST-AT ?auto_13284 ?auto_13272 ) ( AVAILABLE ?auto_13284 ) ( SURFACE-AT ?auto_13250 ?auto_13272 ) ( ON ?auto_13250 ?auto_13268 ) ( CLEAR ?auto_13250 ) ( not ( = ?auto_13246 ?auto_13250 ) ) ( not ( = ?auto_13246 ?auto_13268 ) ) ( not ( = ?auto_13250 ?auto_13268 ) ) ( not ( = ?auto_13256 ?auto_13284 ) ) ( IS-CRATE ?auto_13246 ) ( not ( = ?auto_13262 ?auto_13258 ) ) ( HOIST-AT ?auto_13276 ?auto_13262 ) ( AVAILABLE ?auto_13276 ) ( SURFACE-AT ?auto_13246 ?auto_13262 ) ( ON ?auto_13246 ?auto_13278 ) ( CLEAR ?auto_13246 ) ( not ( = ?auto_13248 ?auto_13246 ) ) ( not ( = ?auto_13248 ?auto_13278 ) ) ( not ( = ?auto_13246 ?auto_13278 ) ) ( not ( = ?auto_13256 ?auto_13276 ) ) ( IS-CRATE ?auto_13248 ) ( not ( = ?auto_13280 ?auto_13258 ) ) ( HOIST-AT ?auto_13271 ?auto_13280 ) ( AVAILABLE ?auto_13271 ) ( SURFACE-AT ?auto_13248 ?auto_13280 ) ( ON ?auto_13248 ?auto_13277 ) ( CLEAR ?auto_13248 ) ( not ( = ?auto_13245 ?auto_13248 ) ) ( not ( = ?auto_13245 ?auto_13277 ) ) ( not ( = ?auto_13248 ?auto_13277 ) ) ( not ( = ?auto_13256 ?auto_13271 ) ) ( IS-CRATE ?auto_13245 ) ( not ( = ?auto_13260 ?auto_13258 ) ) ( HOIST-AT ?auto_13281 ?auto_13260 ) ( SURFACE-AT ?auto_13245 ?auto_13260 ) ( ON ?auto_13245 ?auto_13263 ) ( CLEAR ?auto_13245 ) ( not ( = ?auto_13244 ?auto_13245 ) ) ( not ( = ?auto_13244 ?auto_13263 ) ) ( not ( = ?auto_13245 ?auto_13263 ) ) ( not ( = ?auto_13256 ?auto_13281 ) ) ( IS-CRATE ?auto_13244 ) ( AVAILABLE ?auto_13255 ) ( SURFACE-AT ?auto_13244 ?auto_13257 ) ( ON ?auto_13244 ?auto_13264 ) ( CLEAR ?auto_13244 ) ( not ( = ?auto_13243 ?auto_13244 ) ) ( not ( = ?auto_13243 ?auto_13264 ) ) ( not ( = ?auto_13244 ?auto_13264 ) ) ( IS-CRATE ?auto_13243 ) ( not ( = ?auto_13275 ?auto_13258 ) ) ( HOIST-AT ?auto_13279 ?auto_13275 ) ( AVAILABLE ?auto_13279 ) ( SURFACE-AT ?auto_13243 ?auto_13275 ) ( ON ?auto_13243 ?auto_13282 ) ( CLEAR ?auto_13243 ) ( not ( = ?auto_13242 ?auto_13243 ) ) ( not ( = ?auto_13242 ?auto_13282 ) ) ( not ( = ?auto_13243 ?auto_13282 ) ) ( not ( = ?auto_13256 ?auto_13279 ) ) ( SURFACE-AT ?auto_13241 ?auto_13258 ) ( CLEAR ?auto_13241 ) ( IS-CRATE ?auto_13242 ) ( AVAILABLE ?auto_13256 ) ( AVAILABLE ?auto_13281 ) ( SURFACE-AT ?auto_13242 ?auto_13260 ) ( ON ?auto_13242 ?auto_13266 ) ( CLEAR ?auto_13242 ) ( TRUCK-AT ?auto_13254 ?auto_13258 ) ( not ( = ?auto_13241 ?auto_13242 ) ) ( not ( = ?auto_13241 ?auto_13266 ) ) ( not ( = ?auto_13242 ?auto_13266 ) ) ( not ( = ?auto_13241 ?auto_13243 ) ) ( not ( = ?auto_13241 ?auto_13282 ) ) ( not ( = ?auto_13243 ?auto_13266 ) ) ( not ( = ?auto_13275 ?auto_13260 ) ) ( not ( = ?auto_13279 ?auto_13281 ) ) ( not ( = ?auto_13282 ?auto_13266 ) ) ( not ( = ?auto_13241 ?auto_13244 ) ) ( not ( = ?auto_13241 ?auto_13264 ) ) ( not ( = ?auto_13242 ?auto_13244 ) ) ( not ( = ?auto_13242 ?auto_13264 ) ) ( not ( = ?auto_13244 ?auto_13282 ) ) ( not ( = ?auto_13244 ?auto_13266 ) ) ( not ( = ?auto_13257 ?auto_13275 ) ) ( not ( = ?auto_13257 ?auto_13260 ) ) ( not ( = ?auto_13255 ?auto_13279 ) ) ( not ( = ?auto_13255 ?auto_13281 ) ) ( not ( = ?auto_13264 ?auto_13282 ) ) ( not ( = ?auto_13264 ?auto_13266 ) ) ( not ( = ?auto_13241 ?auto_13245 ) ) ( not ( = ?auto_13241 ?auto_13263 ) ) ( not ( = ?auto_13242 ?auto_13245 ) ) ( not ( = ?auto_13242 ?auto_13263 ) ) ( not ( = ?auto_13243 ?auto_13245 ) ) ( not ( = ?auto_13243 ?auto_13263 ) ) ( not ( = ?auto_13245 ?auto_13264 ) ) ( not ( = ?auto_13245 ?auto_13282 ) ) ( not ( = ?auto_13245 ?auto_13266 ) ) ( not ( = ?auto_13263 ?auto_13264 ) ) ( not ( = ?auto_13263 ?auto_13282 ) ) ( not ( = ?auto_13263 ?auto_13266 ) ) ( not ( = ?auto_13241 ?auto_13248 ) ) ( not ( = ?auto_13241 ?auto_13277 ) ) ( not ( = ?auto_13242 ?auto_13248 ) ) ( not ( = ?auto_13242 ?auto_13277 ) ) ( not ( = ?auto_13243 ?auto_13248 ) ) ( not ( = ?auto_13243 ?auto_13277 ) ) ( not ( = ?auto_13244 ?auto_13248 ) ) ( not ( = ?auto_13244 ?auto_13277 ) ) ( not ( = ?auto_13248 ?auto_13263 ) ) ( not ( = ?auto_13248 ?auto_13264 ) ) ( not ( = ?auto_13248 ?auto_13282 ) ) ( not ( = ?auto_13248 ?auto_13266 ) ) ( not ( = ?auto_13280 ?auto_13260 ) ) ( not ( = ?auto_13280 ?auto_13257 ) ) ( not ( = ?auto_13280 ?auto_13275 ) ) ( not ( = ?auto_13271 ?auto_13281 ) ) ( not ( = ?auto_13271 ?auto_13255 ) ) ( not ( = ?auto_13271 ?auto_13279 ) ) ( not ( = ?auto_13277 ?auto_13263 ) ) ( not ( = ?auto_13277 ?auto_13264 ) ) ( not ( = ?auto_13277 ?auto_13282 ) ) ( not ( = ?auto_13277 ?auto_13266 ) ) ( not ( = ?auto_13241 ?auto_13246 ) ) ( not ( = ?auto_13241 ?auto_13278 ) ) ( not ( = ?auto_13242 ?auto_13246 ) ) ( not ( = ?auto_13242 ?auto_13278 ) ) ( not ( = ?auto_13243 ?auto_13246 ) ) ( not ( = ?auto_13243 ?auto_13278 ) ) ( not ( = ?auto_13244 ?auto_13246 ) ) ( not ( = ?auto_13244 ?auto_13278 ) ) ( not ( = ?auto_13245 ?auto_13246 ) ) ( not ( = ?auto_13245 ?auto_13278 ) ) ( not ( = ?auto_13246 ?auto_13277 ) ) ( not ( = ?auto_13246 ?auto_13263 ) ) ( not ( = ?auto_13246 ?auto_13264 ) ) ( not ( = ?auto_13246 ?auto_13282 ) ) ( not ( = ?auto_13246 ?auto_13266 ) ) ( not ( = ?auto_13262 ?auto_13280 ) ) ( not ( = ?auto_13262 ?auto_13260 ) ) ( not ( = ?auto_13262 ?auto_13257 ) ) ( not ( = ?auto_13262 ?auto_13275 ) ) ( not ( = ?auto_13276 ?auto_13271 ) ) ( not ( = ?auto_13276 ?auto_13281 ) ) ( not ( = ?auto_13276 ?auto_13255 ) ) ( not ( = ?auto_13276 ?auto_13279 ) ) ( not ( = ?auto_13278 ?auto_13277 ) ) ( not ( = ?auto_13278 ?auto_13263 ) ) ( not ( = ?auto_13278 ?auto_13264 ) ) ( not ( = ?auto_13278 ?auto_13282 ) ) ( not ( = ?auto_13278 ?auto_13266 ) ) ( not ( = ?auto_13241 ?auto_13250 ) ) ( not ( = ?auto_13241 ?auto_13268 ) ) ( not ( = ?auto_13242 ?auto_13250 ) ) ( not ( = ?auto_13242 ?auto_13268 ) ) ( not ( = ?auto_13243 ?auto_13250 ) ) ( not ( = ?auto_13243 ?auto_13268 ) ) ( not ( = ?auto_13244 ?auto_13250 ) ) ( not ( = ?auto_13244 ?auto_13268 ) ) ( not ( = ?auto_13245 ?auto_13250 ) ) ( not ( = ?auto_13245 ?auto_13268 ) ) ( not ( = ?auto_13248 ?auto_13250 ) ) ( not ( = ?auto_13248 ?auto_13268 ) ) ( not ( = ?auto_13250 ?auto_13278 ) ) ( not ( = ?auto_13250 ?auto_13277 ) ) ( not ( = ?auto_13250 ?auto_13263 ) ) ( not ( = ?auto_13250 ?auto_13264 ) ) ( not ( = ?auto_13250 ?auto_13282 ) ) ( not ( = ?auto_13250 ?auto_13266 ) ) ( not ( = ?auto_13272 ?auto_13262 ) ) ( not ( = ?auto_13272 ?auto_13280 ) ) ( not ( = ?auto_13272 ?auto_13260 ) ) ( not ( = ?auto_13272 ?auto_13257 ) ) ( not ( = ?auto_13272 ?auto_13275 ) ) ( not ( = ?auto_13284 ?auto_13276 ) ) ( not ( = ?auto_13284 ?auto_13271 ) ) ( not ( = ?auto_13284 ?auto_13281 ) ) ( not ( = ?auto_13284 ?auto_13255 ) ) ( not ( = ?auto_13284 ?auto_13279 ) ) ( not ( = ?auto_13268 ?auto_13278 ) ) ( not ( = ?auto_13268 ?auto_13277 ) ) ( not ( = ?auto_13268 ?auto_13263 ) ) ( not ( = ?auto_13268 ?auto_13264 ) ) ( not ( = ?auto_13268 ?auto_13282 ) ) ( not ( = ?auto_13268 ?auto_13266 ) ) ( not ( = ?auto_13241 ?auto_13249 ) ) ( not ( = ?auto_13241 ?auto_13261 ) ) ( not ( = ?auto_13242 ?auto_13249 ) ) ( not ( = ?auto_13242 ?auto_13261 ) ) ( not ( = ?auto_13243 ?auto_13249 ) ) ( not ( = ?auto_13243 ?auto_13261 ) ) ( not ( = ?auto_13244 ?auto_13249 ) ) ( not ( = ?auto_13244 ?auto_13261 ) ) ( not ( = ?auto_13245 ?auto_13249 ) ) ( not ( = ?auto_13245 ?auto_13261 ) ) ( not ( = ?auto_13248 ?auto_13249 ) ) ( not ( = ?auto_13248 ?auto_13261 ) ) ( not ( = ?auto_13246 ?auto_13249 ) ) ( not ( = ?auto_13246 ?auto_13261 ) ) ( not ( = ?auto_13249 ?auto_13268 ) ) ( not ( = ?auto_13249 ?auto_13278 ) ) ( not ( = ?auto_13249 ?auto_13277 ) ) ( not ( = ?auto_13249 ?auto_13263 ) ) ( not ( = ?auto_13249 ?auto_13264 ) ) ( not ( = ?auto_13249 ?auto_13282 ) ) ( not ( = ?auto_13249 ?auto_13266 ) ) ( not ( = ?auto_13270 ?auto_13272 ) ) ( not ( = ?auto_13270 ?auto_13262 ) ) ( not ( = ?auto_13270 ?auto_13280 ) ) ( not ( = ?auto_13270 ?auto_13260 ) ) ( not ( = ?auto_13270 ?auto_13257 ) ) ( not ( = ?auto_13270 ?auto_13275 ) ) ( not ( = ?auto_13283 ?auto_13284 ) ) ( not ( = ?auto_13283 ?auto_13276 ) ) ( not ( = ?auto_13283 ?auto_13271 ) ) ( not ( = ?auto_13283 ?auto_13281 ) ) ( not ( = ?auto_13283 ?auto_13255 ) ) ( not ( = ?auto_13283 ?auto_13279 ) ) ( not ( = ?auto_13261 ?auto_13268 ) ) ( not ( = ?auto_13261 ?auto_13278 ) ) ( not ( = ?auto_13261 ?auto_13277 ) ) ( not ( = ?auto_13261 ?auto_13263 ) ) ( not ( = ?auto_13261 ?auto_13264 ) ) ( not ( = ?auto_13261 ?auto_13282 ) ) ( not ( = ?auto_13261 ?auto_13266 ) ) ( not ( = ?auto_13241 ?auto_13247 ) ) ( not ( = ?auto_13241 ?auto_13267 ) ) ( not ( = ?auto_13242 ?auto_13247 ) ) ( not ( = ?auto_13242 ?auto_13267 ) ) ( not ( = ?auto_13243 ?auto_13247 ) ) ( not ( = ?auto_13243 ?auto_13267 ) ) ( not ( = ?auto_13244 ?auto_13247 ) ) ( not ( = ?auto_13244 ?auto_13267 ) ) ( not ( = ?auto_13245 ?auto_13247 ) ) ( not ( = ?auto_13245 ?auto_13267 ) ) ( not ( = ?auto_13248 ?auto_13247 ) ) ( not ( = ?auto_13248 ?auto_13267 ) ) ( not ( = ?auto_13246 ?auto_13247 ) ) ( not ( = ?auto_13246 ?auto_13267 ) ) ( not ( = ?auto_13250 ?auto_13247 ) ) ( not ( = ?auto_13250 ?auto_13267 ) ) ( not ( = ?auto_13247 ?auto_13261 ) ) ( not ( = ?auto_13247 ?auto_13268 ) ) ( not ( = ?auto_13247 ?auto_13278 ) ) ( not ( = ?auto_13247 ?auto_13277 ) ) ( not ( = ?auto_13247 ?auto_13263 ) ) ( not ( = ?auto_13247 ?auto_13264 ) ) ( not ( = ?auto_13247 ?auto_13282 ) ) ( not ( = ?auto_13247 ?auto_13266 ) ) ( not ( = ?auto_13259 ?auto_13270 ) ) ( not ( = ?auto_13259 ?auto_13272 ) ) ( not ( = ?auto_13259 ?auto_13262 ) ) ( not ( = ?auto_13259 ?auto_13280 ) ) ( not ( = ?auto_13259 ?auto_13260 ) ) ( not ( = ?auto_13259 ?auto_13257 ) ) ( not ( = ?auto_13259 ?auto_13275 ) ) ( not ( = ?auto_13269 ?auto_13283 ) ) ( not ( = ?auto_13269 ?auto_13284 ) ) ( not ( = ?auto_13269 ?auto_13276 ) ) ( not ( = ?auto_13269 ?auto_13271 ) ) ( not ( = ?auto_13269 ?auto_13281 ) ) ( not ( = ?auto_13269 ?auto_13255 ) ) ( not ( = ?auto_13269 ?auto_13279 ) ) ( not ( = ?auto_13267 ?auto_13261 ) ) ( not ( = ?auto_13267 ?auto_13268 ) ) ( not ( = ?auto_13267 ?auto_13278 ) ) ( not ( = ?auto_13267 ?auto_13277 ) ) ( not ( = ?auto_13267 ?auto_13263 ) ) ( not ( = ?auto_13267 ?auto_13264 ) ) ( not ( = ?auto_13267 ?auto_13282 ) ) ( not ( = ?auto_13267 ?auto_13266 ) ) ( not ( = ?auto_13241 ?auto_13252 ) ) ( not ( = ?auto_13241 ?auto_13265 ) ) ( not ( = ?auto_13242 ?auto_13252 ) ) ( not ( = ?auto_13242 ?auto_13265 ) ) ( not ( = ?auto_13243 ?auto_13252 ) ) ( not ( = ?auto_13243 ?auto_13265 ) ) ( not ( = ?auto_13244 ?auto_13252 ) ) ( not ( = ?auto_13244 ?auto_13265 ) ) ( not ( = ?auto_13245 ?auto_13252 ) ) ( not ( = ?auto_13245 ?auto_13265 ) ) ( not ( = ?auto_13248 ?auto_13252 ) ) ( not ( = ?auto_13248 ?auto_13265 ) ) ( not ( = ?auto_13246 ?auto_13252 ) ) ( not ( = ?auto_13246 ?auto_13265 ) ) ( not ( = ?auto_13250 ?auto_13252 ) ) ( not ( = ?auto_13250 ?auto_13265 ) ) ( not ( = ?auto_13249 ?auto_13252 ) ) ( not ( = ?auto_13249 ?auto_13265 ) ) ( not ( = ?auto_13252 ?auto_13267 ) ) ( not ( = ?auto_13252 ?auto_13261 ) ) ( not ( = ?auto_13252 ?auto_13268 ) ) ( not ( = ?auto_13252 ?auto_13278 ) ) ( not ( = ?auto_13252 ?auto_13277 ) ) ( not ( = ?auto_13252 ?auto_13263 ) ) ( not ( = ?auto_13252 ?auto_13264 ) ) ( not ( = ?auto_13252 ?auto_13282 ) ) ( not ( = ?auto_13252 ?auto_13266 ) ) ( not ( = ?auto_13274 ?auto_13259 ) ) ( not ( = ?auto_13274 ?auto_13270 ) ) ( not ( = ?auto_13274 ?auto_13272 ) ) ( not ( = ?auto_13274 ?auto_13262 ) ) ( not ( = ?auto_13274 ?auto_13280 ) ) ( not ( = ?auto_13274 ?auto_13260 ) ) ( not ( = ?auto_13274 ?auto_13257 ) ) ( not ( = ?auto_13274 ?auto_13275 ) ) ( not ( = ?auto_13273 ?auto_13269 ) ) ( not ( = ?auto_13273 ?auto_13283 ) ) ( not ( = ?auto_13273 ?auto_13284 ) ) ( not ( = ?auto_13273 ?auto_13276 ) ) ( not ( = ?auto_13273 ?auto_13271 ) ) ( not ( = ?auto_13273 ?auto_13281 ) ) ( not ( = ?auto_13273 ?auto_13255 ) ) ( not ( = ?auto_13273 ?auto_13279 ) ) ( not ( = ?auto_13265 ?auto_13267 ) ) ( not ( = ?auto_13265 ?auto_13261 ) ) ( not ( = ?auto_13265 ?auto_13268 ) ) ( not ( = ?auto_13265 ?auto_13278 ) ) ( not ( = ?auto_13265 ?auto_13277 ) ) ( not ( = ?auto_13265 ?auto_13263 ) ) ( not ( = ?auto_13265 ?auto_13264 ) ) ( not ( = ?auto_13265 ?auto_13282 ) ) ( not ( = ?auto_13265 ?auto_13266 ) ) ( not ( = ?auto_13241 ?auto_13251 ) ) ( not ( = ?auto_13241 ?auto_13253 ) ) ( not ( = ?auto_13242 ?auto_13251 ) ) ( not ( = ?auto_13242 ?auto_13253 ) ) ( not ( = ?auto_13243 ?auto_13251 ) ) ( not ( = ?auto_13243 ?auto_13253 ) ) ( not ( = ?auto_13244 ?auto_13251 ) ) ( not ( = ?auto_13244 ?auto_13253 ) ) ( not ( = ?auto_13245 ?auto_13251 ) ) ( not ( = ?auto_13245 ?auto_13253 ) ) ( not ( = ?auto_13248 ?auto_13251 ) ) ( not ( = ?auto_13248 ?auto_13253 ) ) ( not ( = ?auto_13246 ?auto_13251 ) ) ( not ( = ?auto_13246 ?auto_13253 ) ) ( not ( = ?auto_13250 ?auto_13251 ) ) ( not ( = ?auto_13250 ?auto_13253 ) ) ( not ( = ?auto_13249 ?auto_13251 ) ) ( not ( = ?auto_13249 ?auto_13253 ) ) ( not ( = ?auto_13247 ?auto_13251 ) ) ( not ( = ?auto_13247 ?auto_13253 ) ) ( not ( = ?auto_13251 ?auto_13265 ) ) ( not ( = ?auto_13251 ?auto_13267 ) ) ( not ( = ?auto_13251 ?auto_13261 ) ) ( not ( = ?auto_13251 ?auto_13268 ) ) ( not ( = ?auto_13251 ?auto_13278 ) ) ( not ( = ?auto_13251 ?auto_13277 ) ) ( not ( = ?auto_13251 ?auto_13263 ) ) ( not ( = ?auto_13251 ?auto_13264 ) ) ( not ( = ?auto_13251 ?auto_13282 ) ) ( not ( = ?auto_13251 ?auto_13266 ) ) ( not ( = ?auto_13253 ?auto_13265 ) ) ( not ( = ?auto_13253 ?auto_13267 ) ) ( not ( = ?auto_13253 ?auto_13261 ) ) ( not ( = ?auto_13253 ?auto_13268 ) ) ( not ( = ?auto_13253 ?auto_13278 ) ) ( not ( = ?auto_13253 ?auto_13277 ) ) ( not ( = ?auto_13253 ?auto_13263 ) ) ( not ( = ?auto_13253 ?auto_13264 ) ) ( not ( = ?auto_13253 ?auto_13282 ) ) ( not ( = ?auto_13253 ?auto_13266 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_13241 ?auto_13242 ?auto_13243 ?auto_13244 ?auto_13245 ?auto_13248 ?auto_13246 ?auto_13250 ?auto_13249 ?auto_13247 ?auto_13252 )
      ( MAKE-1CRATE ?auto_13252 ?auto_13251 )
      ( MAKE-11CRATE-VERIFY ?auto_13241 ?auto_13242 ?auto_13243 ?auto_13244 ?auto_13245 ?auto_13248 ?auto_13246 ?auto_13250 ?auto_13249 ?auto_13247 ?auto_13252 ?auto_13251 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13287 - SURFACE
      ?auto_13288 - SURFACE
    )
    :vars
    (
      ?auto_13289 - HOIST
      ?auto_13290 - PLACE
      ?auto_13292 - PLACE
      ?auto_13293 - HOIST
      ?auto_13294 - SURFACE
      ?auto_13291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13289 ?auto_13290 ) ( SURFACE-AT ?auto_13287 ?auto_13290 ) ( CLEAR ?auto_13287 ) ( IS-CRATE ?auto_13288 ) ( AVAILABLE ?auto_13289 ) ( not ( = ?auto_13292 ?auto_13290 ) ) ( HOIST-AT ?auto_13293 ?auto_13292 ) ( AVAILABLE ?auto_13293 ) ( SURFACE-AT ?auto_13288 ?auto_13292 ) ( ON ?auto_13288 ?auto_13294 ) ( CLEAR ?auto_13288 ) ( TRUCK-AT ?auto_13291 ?auto_13290 ) ( not ( = ?auto_13287 ?auto_13288 ) ) ( not ( = ?auto_13287 ?auto_13294 ) ) ( not ( = ?auto_13288 ?auto_13294 ) ) ( not ( = ?auto_13289 ?auto_13293 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13291 ?auto_13290 ?auto_13292 )
      ( !LIFT ?auto_13293 ?auto_13288 ?auto_13294 ?auto_13292 )
      ( !LOAD ?auto_13293 ?auto_13288 ?auto_13291 ?auto_13292 )
      ( !DRIVE ?auto_13291 ?auto_13292 ?auto_13290 )
      ( !UNLOAD ?auto_13289 ?auto_13288 ?auto_13291 ?auto_13290 )
      ( !DROP ?auto_13289 ?auto_13288 ?auto_13287 ?auto_13290 )
      ( MAKE-1CRATE-VERIFY ?auto_13287 ?auto_13288 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_13308 - SURFACE
      ?auto_13309 - SURFACE
      ?auto_13310 - SURFACE
      ?auto_13311 - SURFACE
      ?auto_13312 - SURFACE
      ?auto_13315 - SURFACE
      ?auto_13313 - SURFACE
      ?auto_13317 - SURFACE
      ?auto_13316 - SURFACE
      ?auto_13314 - SURFACE
      ?auto_13319 - SURFACE
      ?auto_13318 - SURFACE
      ?auto_13320 - SURFACE
    )
    :vars
    (
      ?auto_13322 - HOIST
      ?auto_13323 - PLACE
      ?auto_13325 - PLACE
      ?auto_13326 - HOIST
      ?auto_13324 - SURFACE
      ?auto_13347 - PLACE
      ?auto_13353 - HOIST
      ?auto_13327 - SURFACE
      ?auto_13331 - PLACE
      ?auto_13351 - HOIST
      ?auto_13333 - SURFACE
      ?auto_13343 - PLACE
      ?auto_13338 - HOIST
      ?auto_13332 - SURFACE
      ?auto_13349 - PLACE
      ?auto_13346 - HOIST
      ?auto_13329 - SURFACE
      ?auto_13339 - SURFACE
      ?auto_13342 - PLACE
      ?auto_13334 - HOIST
      ?auto_13350 - SURFACE
      ?auto_13337 - PLACE
      ?auto_13336 - HOIST
      ?auto_13341 - SURFACE
      ?auto_13340 - PLACE
      ?auto_13344 - HOIST
      ?auto_13348 - SURFACE
      ?auto_13352 - SURFACE
      ?auto_13330 - PLACE
      ?auto_13328 - HOIST
      ?auto_13345 - SURFACE
      ?auto_13335 - SURFACE
      ?auto_13321 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13322 ?auto_13323 ) ( IS-CRATE ?auto_13320 ) ( not ( = ?auto_13325 ?auto_13323 ) ) ( HOIST-AT ?auto_13326 ?auto_13325 ) ( SURFACE-AT ?auto_13320 ?auto_13325 ) ( ON ?auto_13320 ?auto_13324 ) ( CLEAR ?auto_13320 ) ( not ( = ?auto_13318 ?auto_13320 ) ) ( not ( = ?auto_13318 ?auto_13324 ) ) ( not ( = ?auto_13320 ?auto_13324 ) ) ( not ( = ?auto_13322 ?auto_13326 ) ) ( IS-CRATE ?auto_13318 ) ( not ( = ?auto_13347 ?auto_13323 ) ) ( HOIST-AT ?auto_13353 ?auto_13347 ) ( SURFACE-AT ?auto_13318 ?auto_13347 ) ( ON ?auto_13318 ?auto_13327 ) ( CLEAR ?auto_13318 ) ( not ( = ?auto_13319 ?auto_13318 ) ) ( not ( = ?auto_13319 ?auto_13327 ) ) ( not ( = ?auto_13318 ?auto_13327 ) ) ( not ( = ?auto_13322 ?auto_13353 ) ) ( IS-CRATE ?auto_13319 ) ( not ( = ?auto_13331 ?auto_13323 ) ) ( HOIST-AT ?auto_13351 ?auto_13331 ) ( AVAILABLE ?auto_13351 ) ( SURFACE-AT ?auto_13319 ?auto_13331 ) ( ON ?auto_13319 ?auto_13333 ) ( CLEAR ?auto_13319 ) ( not ( = ?auto_13314 ?auto_13319 ) ) ( not ( = ?auto_13314 ?auto_13333 ) ) ( not ( = ?auto_13319 ?auto_13333 ) ) ( not ( = ?auto_13322 ?auto_13351 ) ) ( IS-CRATE ?auto_13314 ) ( not ( = ?auto_13343 ?auto_13323 ) ) ( HOIST-AT ?auto_13338 ?auto_13343 ) ( AVAILABLE ?auto_13338 ) ( SURFACE-AT ?auto_13314 ?auto_13343 ) ( ON ?auto_13314 ?auto_13332 ) ( CLEAR ?auto_13314 ) ( not ( = ?auto_13316 ?auto_13314 ) ) ( not ( = ?auto_13316 ?auto_13332 ) ) ( not ( = ?auto_13314 ?auto_13332 ) ) ( not ( = ?auto_13322 ?auto_13338 ) ) ( IS-CRATE ?auto_13316 ) ( not ( = ?auto_13349 ?auto_13323 ) ) ( HOIST-AT ?auto_13346 ?auto_13349 ) ( AVAILABLE ?auto_13346 ) ( SURFACE-AT ?auto_13316 ?auto_13349 ) ( ON ?auto_13316 ?auto_13329 ) ( CLEAR ?auto_13316 ) ( not ( = ?auto_13317 ?auto_13316 ) ) ( not ( = ?auto_13317 ?auto_13329 ) ) ( not ( = ?auto_13316 ?auto_13329 ) ) ( not ( = ?auto_13322 ?auto_13346 ) ) ( IS-CRATE ?auto_13317 ) ( AVAILABLE ?auto_13326 ) ( SURFACE-AT ?auto_13317 ?auto_13325 ) ( ON ?auto_13317 ?auto_13339 ) ( CLEAR ?auto_13317 ) ( not ( = ?auto_13313 ?auto_13317 ) ) ( not ( = ?auto_13313 ?auto_13339 ) ) ( not ( = ?auto_13317 ?auto_13339 ) ) ( IS-CRATE ?auto_13313 ) ( not ( = ?auto_13342 ?auto_13323 ) ) ( HOIST-AT ?auto_13334 ?auto_13342 ) ( AVAILABLE ?auto_13334 ) ( SURFACE-AT ?auto_13313 ?auto_13342 ) ( ON ?auto_13313 ?auto_13350 ) ( CLEAR ?auto_13313 ) ( not ( = ?auto_13315 ?auto_13313 ) ) ( not ( = ?auto_13315 ?auto_13350 ) ) ( not ( = ?auto_13313 ?auto_13350 ) ) ( not ( = ?auto_13322 ?auto_13334 ) ) ( IS-CRATE ?auto_13315 ) ( not ( = ?auto_13337 ?auto_13323 ) ) ( HOIST-AT ?auto_13336 ?auto_13337 ) ( AVAILABLE ?auto_13336 ) ( SURFACE-AT ?auto_13315 ?auto_13337 ) ( ON ?auto_13315 ?auto_13341 ) ( CLEAR ?auto_13315 ) ( not ( = ?auto_13312 ?auto_13315 ) ) ( not ( = ?auto_13312 ?auto_13341 ) ) ( not ( = ?auto_13315 ?auto_13341 ) ) ( not ( = ?auto_13322 ?auto_13336 ) ) ( IS-CRATE ?auto_13312 ) ( not ( = ?auto_13340 ?auto_13323 ) ) ( HOIST-AT ?auto_13344 ?auto_13340 ) ( SURFACE-AT ?auto_13312 ?auto_13340 ) ( ON ?auto_13312 ?auto_13348 ) ( CLEAR ?auto_13312 ) ( not ( = ?auto_13311 ?auto_13312 ) ) ( not ( = ?auto_13311 ?auto_13348 ) ) ( not ( = ?auto_13312 ?auto_13348 ) ) ( not ( = ?auto_13322 ?auto_13344 ) ) ( IS-CRATE ?auto_13311 ) ( AVAILABLE ?auto_13353 ) ( SURFACE-AT ?auto_13311 ?auto_13347 ) ( ON ?auto_13311 ?auto_13352 ) ( CLEAR ?auto_13311 ) ( not ( = ?auto_13310 ?auto_13311 ) ) ( not ( = ?auto_13310 ?auto_13352 ) ) ( not ( = ?auto_13311 ?auto_13352 ) ) ( IS-CRATE ?auto_13310 ) ( not ( = ?auto_13330 ?auto_13323 ) ) ( HOIST-AT ?auto_13328 ?auto_13330 ) ( AVAILABLE ?auto_13328 ) ( SURFACE-AT ?auto_13310 ?auto_13330 ) ( ON ?auto_13310 ?auto_13345 ) ( CLEAR ?auto_13310 ) ( not ( = ?auto_13309 ?auto_13310 ) ) ( not ( = ?auto_13309 ?auto_13345 ) ) ( not ( = ?auto_13310 ?auto_13345 ) ) ( not ( = ?auto_13322 ?auto_13328 ) ) ( SURFACE-AT ?auto_13308 ?auto_13323 ) ( CLEAR ?auto_13308 ) ( IS-CRATE ?auto_13309 ) ( AVAILABLE ?auto_13322 ) ( AVAILABLE ?auto_13344 ) ( SURFACE-AT ?auto_13309 ?auto_13340 ) ( ON ?auto_13309 ?auto_13335 ) ( CLEAR ?auto_13309 ) ( TRUCK-AT ?auto_13321 ?auto_13323 ) ( not ( = ?auto_13308 ?auto_13309 ) ) ( not ( = ?auto_13308 ?auto_13335 ) ) ( not ( = ?auto_13309 ?auto_13335 ) ) ( not ( = ?auto_13308 ?auto_13310 ) ) ( not ( = ?auto_13308 ?auto_13345 ) ) ( not ( = ?auto_13310 ?auto_13335 ) ) ( not ( = ?auto_13330 ?auto_13340 ) ) ( not ( = ?auto_13328 ?auto_13344 ) ) ( not ( = ?auto_13345 ?auto_13335 ) ) ( not ( = ?auto_13308 ?auto_13311 ) ) ( not ( = ?auto_13308 ?auto_13352 ) ) ( not ( = ?auto_13309 ?auto_13311 ) ) ( not ( = ?auto_13309 ?auto_13352 ) ) ( not ( = ?auto_13311 ?auto_13345 ) ) ( not ( = ?auto_13311 ?auto_13335 ) ) ( not ( = ?auto_13347 ?auto_13330 ) ) ( not ( = ?auto_13347 ?auto_13340 ) ) ( not ( = ?auto_13353 ?auto_13328 ) ) ( not ( = ?auto_13353 ?auto_13344 ) ) ( not ( = ?auto_13352 ?auto_13345 ) ) ( not ( = ?auto_13352 ?auto_13335 ) ) ( not ( = ?auto_13308 ?auto_13312 ) ) ( not ( = ?auto_13308 ?auto_13348 ) ) ( not ( = ?auto_13309 ?auto_13312 ) ) ( not ( = ?auto_13309 ?auto_13348 ) ) ( not ( = ?auto_13310 ?auto_13312 ) ) ( not ( = ?auto_13310 ?auto_13348 ) ) ( not ( = ?auto_13312 ?auto_13352 ) ) ( not ( = ?auto_13312 ?auto_13345 ) ) ( not ( = ?auto_13312 ?auto_13335 ) ) ( not ( = ?auto_13348 ?auto_13352 ) ) ( not ( = ?auto_13348 ?auto_13345 ) ) ( not ( = ?auto_13348 ?auto_13335 ) ) ( not ( = ?auto_13308 ?auto_13315 ) ) ( not ( = ?auto_13308 ?auto_13341 ) ) ( not ( = ?auto_13309 ?auto_13315 ) ) ( not ( = ?auto_13309 ?auto_13341 ) ) ( not ( = ?auto_13310 ?auto_13315 ) ) ( not ( = ?auto_13310 ?auto_13341 ) ) ( not ( = ?auto_13311 ?auto_13315 ) ) ( not ( = ?auto_13311 ?auto_13341 ) ) ( not ( = ?auto_13315 ?auto_13348 ) ) ( not ( = ?auto_13315 ?auto_13352 ) ) ( not ( = ?auto_13315 ?auto_13345 ) ) ( not ( = ?auto_13315 ?auto_13335 ) ) ( not ( = ?auto_13337 ?auto_13340 ) ) ( not ( = ?auto_13337 ?auto_13347 ) ) ( not ( = ?auto_13337 ?auto_13330 ) ) ( not ( = ?auto_13336 ?auto_13344 ) ) ( not ( = ?auto_13336 ?auto_13353 ) ) ( not ( = ?auto_13336 ?auto_13328 ) ) ( not ( = ?auto_13341 ?auto_13348 ) ) ( not ( = ?auto_13341 ?auto_13352 ) ) ( not ( = ?auto_13341 ?auto_13345 ) ) ( not ( = ?auto_13341 ?auto_13335 ) ) ( not ( = ?auto_13308 ?auto_13313 ) ) ( not ( = ?auto_13308 ?auto_13350 ) ) ( not ( = ?auto_13309 ?auto_13313 ) ) ( not ( = ?auto_13309 ?auto_13350 ) ) ( not ( = ?auto_13310 ?auto_13313 ) ) ( not ( = ?auto_13310 ?auto_13350 ) ) ( not ( = ?auto_13311 ?auto_13313 ) ) ( not ( = ?auto_13311 ?auto_13350 ) ) ( not ( = ?auto_13312 ?auto_13313 ) ) ( not ( = ?auto_13312 ?auto_13350 ) ) ( not ( = ?auto_13313 ?auto_13341 ) ) ( not ( = ?auto_13313 ?auto_13348 ) ) ( not ( = ?auto_13313 ?auto_13352 ) ) ( not ( = ?auto_13313 ?auto_13345 ) ) ( not ( = ?auto_13313 ?auto_13335 ) ) ( not ( = ?auto_13342 ?auto_13337 ) ) ( not ( = ?auto_13342 ?auto_13340 ) ) ( not ( = ?auto_13342 ?auto_13347 ) ) ( not ( = ?auto_13342 ?auto_13330 ) ) ( not ( = ?auto_13334 ?auto_13336 ) ) ( not ( = ?auto_13334 ?auto_13344 ) ) ( not ( = ?auto_13334 ?auto_13353 ) ) ( not ( = ?auto_13334 ?auto_13328 ) ) ( not ( = ?auto_13350 ?auto_13341 ) ) ( not ( = ?auto_13350 ?auto_13348 ) ) ( not ( = ?auto_13350 ?auto_13352 ) ) ( not ( = ?auto_13350 ?auto_13345 ) ) ( not ( = ?auto_13350 ?auto_13335 ) ) ( not ( = ?auto_13308 ?auto_13317 ) ) ( not ( = ?auto_13308 ?auto_13339 ) ) ( not ( = ?auto_13309 ?auto_13317 ) ) ( not ( = ?auto_13309 ?auto_13339 ) ) ( not ( = ?auto_13310 ?auto_13317 ) ) ( not ( = ?auto_13310 ?auto_13339 ) ) ( not ( = ?auto_13311 ?auto_13317 ) ) ( not ( = ?auto_13311 ?auto_13339 ) ) ( not ( = ?auto_13312 ?auto_13317 ) ) ( not ( = ?auto_13312 ?auto_13339 ) ) ( not ( = ?auto_13315 ?auto_13317 ) ) ( not ( = ?auto_13315 ?auto_13339 ) ) ( not ( = ?auto_13317 ?auto_13350 ) ) ( not ( = ?auto_13317 ?auto_13341 ) ) ( not ( = ?auto_13317 ?auto_13348 ) ) ( not ( = ?auto_13317 ?auto_13352 ) ) ( not ( = ?auto_13317 ?auto_13345 ) ) ( not ( = ?auto_13317 ?auto_13335 ) ) ( not ( = ?auto_13325 ?auto_13342 ) ) ( not ( = ?auto_13325 ?auto_13337 ) ) ( not ( = ?auto_13325 ?auto_13340 ) ) ( not ( = ?auto_13325 ?auto_13347 ) ) ( not ( = ?auto_13325 ?auto_13330 ) ) ( not ( = ?auto_13326 ?auto_13334 ) ) ( not ( = ?auto_13326 ?auto_13336 ) ) ( not ( = ?auto_13326 ?auto_13344 ) ) ( not ( = ?auto_13326 ?auto_13353 ) ) ( not ( = ?auto_13326 ?auto_13328 ) ) ( not ( = ?auto_13339 ?auto_13350 ) ) ( not ( = ?auto_13339 ?auto_13341 ) ) ( not ( = ?auto_13339 ?auto_13348 ) ) ( not ( = ?auto_13339 ?auto_13352 ) ) ( not ( = ?auto_13339 ?auto_13345 ) ) ( not ( = ?auto_13339 ?auto_13335 ) ) ( not ( = ?auto_13308 ?auto_13316 ) ) ( not ( = ?auto_13308 ?auto_13329 ) ) ( not ( = ?auto_13309 ?auto_13316 ) ) ( not ( = ?auto_13309 ?auto_13329 ) ) ( not ( = ?auto_13310 ?auto_13316 ) ) ( not ( = ?auto_13310 ?auto_13329 ) ) ( not ( = ?auto_13311 ?auto_13316 ) ) ( not ( = ?auto_13311 ?auto_13329 ) ) ( not ( = ?auto_13312 ?auto_13316 ) ) ( not ( = ?auto_13312 ?auto_13329 ) ) ( not ( = ?auto_13315 ?auto_13316 ) ) ( not ( = ?auto_13315 ?auto_13329 ) ) ( not ( = ?auto_13313 ?auto_13316 ) ) ( not ( = ?auto_13313 ?auto_13329 ) ) ( not ( = ?auto_13316 ?auto_13339 ) ) ( not ( = ?auto_13316 ?auto_13350 ) ) ( not ( = ?auto_13316 ?auto_13341 ) ) ( not ( = ?auto_13316 ?auto_13348 ) ) ( not ( = ?auto_13316 ?auto_13352 ) ) ( not ( = ?auto_13316 ?auto_13345 ) ) ( not ( = ?auto_13316 ?auto_13335 ) ) ( not ( = ?auto_13349 ?auto_13325 ) ) ( not ( = ?auto_13349 ?auto_13342 ) ) ( not ( = ?auto_13349 ?auto_13337 ) ) ( not ( = ?auto_13349 ?auto_13340 ) ) ( not ( = ?auto_13349 ?auto_13347 ) ) ( not ( = ?auto_13349 ?auto_13330 ) ) ( not ( = ?auto_13346 ?auto_13326 ) ) ( not ( = ?auto_13346 ?auto_13334 ) ) ( not ( = ?auto_13346 ?auto_13336 ) ) ( not ( = ?auto_13346 ?auto_13344 ) ) ( not ( = ?auto_13346 ?auto_13353 ) ) ( not ( = ?auto_13346 ?auto_13328 ) ) ( not ( = ?auto_13329 ?auto_13339 ) ) ( not ( = ?auto_13329 ?auto_13350 ) ) ( not ( = ?auto_13329 ?auto_13341 ) ) ( not ( = ?auto_13329 ?auto_13348 ) ) ( not ( = ?auto_13329 ?auto_13352 ) ) ( not ( = ?auto_13329 ?auto_13345 ) ) ( not ( = ?auto_13329 ?auto_13335 ) ) ( not ( = ?auto_13308 ?auto_13314 ) ) ( not ( = ?auto_13308 ?auto_13332 ) ) ( not ( = ?auto_13309 ?auto_13314 ) ) ( not ( = ?auto_13309 ?auto_13332 ) ) ( not ( = ?auto_13310 ?auto_13314 ) ) ( not ( = ?auto_13310 ?auto_13332 ) ) ( not ( = ?auto_13311 ?auto_13314 ) ) ( not ( = ?auto_13311 ?auto_13332 ) ) ( not ( = ?auto_13312 ?auto_13314 ) ) ( not ( = ?auto_13312 ?auto_13332 ) ) ( not ( = ?auto_13315 ?auto_13314 ) ) ( not ( = ?auto_13315 ?auto_13332 ) ) ( not ( = ?auto_13313 ?auto_13314 ) ) ( not ( = ?auto_13313 ?auto_13332 ) ) ( not ( = ?auto_13317 ?auto_13314 ) ) ( not ( = ?auto_13317 ?auto_13332 ) ) ( not ( = ?auto_13314 ?auto_13329 ) ) ( not ( = ?auto_13314 ?auto_13339 ) ) ( not ( = ?auto_13314 ?auto_13350 ) ) ( not ( = ?auto_13314 ?auto_13341 ) ) ( not ( = ?auto_13314 ?auto_13348 ) ) ( not ( = ?auto_13314 ?auto_13352 ) ) ( not ( = ?auto_13314 ?auto_13345 ) ) ( not ( = ?auto_13314 ?auto_13335 ) ) ( not ( = ?auto_13343 ?auto_13349 ) ) ( not ( = ?auto_13343 ?auto_13325 ) ) ( not ( = ?auto_13343 ?auto_13342 ) ) ( not ( = ?auto_13343 ?auto_13337 ) ) ( not ( = ?auto_13343 ?auto_13340 ) ) ( not ( = ?auto_13343 ?auto_13347 ) ) ( not ( = ?auto_13343 ?auto_13330 ) ) ( not ( = ?auto_13338 ?auto_13346 ) ) ( not ( = ?auto_13338 ?auto_13326 ) ) ( not ( = ?auto_13338 ?auto_13334 ) ) ( not ( = ?auto_13338 ?auto_13336 ) ) ( not ( = ?auto_13338 ?auto_13344 ) ) ( not ( = ?auto_13338 ?auto_13353 ) ) ( not ( = ?auto_13338 ?auto_13328 ) ) ( not ( = ?auto_13332 ?auto_13329 ) ) ( not ( = ?auto_13332 ?auto_13339 ) ) ( not ( = ?auto_13332 ?auto_13350 ) ) ( not ( = ?auto_13332 ?auto_13341 ) ) ( not ( = ?auto_13332 ?auto_13348 ) ) ( not ( = ?auto_13332 ?auto_13352 ) ) ( not ( = ?auto_13332 ?auto_13345 ) ) ( not ( = ?auto_13332 ?auto_13335 ) ) ( not ( = ?auto_13308 ?auto_13319 ) ) ( not ( = ?auto_13308 ?auto_13333 ) ) ( not ( = ?auto_13309 ?auto_13319 ) ) ( not ( = ?auto_13309 ?auto_13333 ) ) ( not ( = ?auto_13310 ?auto_13319 ) ) ( not ( = ?auto_13310 ?auto_13333 ) ) ( not ( = ?auto_13311 ?auto_13319 ) ) ( not ( = ?auto_13311 ?auto_13333 ) ) ( not ( = ?auto_13312 ?auto_13319 ) ) ( not ( = ?auto_13312 ?auto_13333 ) ) ( not ( = ?auto_13315 ?auto_13319 ) ) ( not ( = ?auto_13315 ?auto_13333 ) ) ( not ( = ?auto_13313 ?auto_13319 ) ) ( not ( = ?auto_13313 ?auto_13333 ) ) ( not ( = ?auto_13317 ?auto_13319 ) ) ( not ( = ?auto_13317 ?auto_13333 ) ) ( not ( = ?auto_13316 ?auto_13319 ) ) ( not ( = ?auto_13316 ?auto_13333 ) ) ( not ( = ?auto_13319 ?auto_13332 ) ) ( not ( = ?auto_13319 ?auto_13329 ) ) ( not ( = ?auto_13319 ?auto_13339 ) ) ( not ( = ?auto_13319 ?auto_13350 ) ) ( not ( = ?auto_13319 ?auto_13341 ) ) ( not ( = ?auto_13319 ?auto_13348 ) ) ( not ( = ?auto_13319 ?auto_13352 ) ) ( not ( = ?auto_13319 ?auto_13345 ) ) ( not ( = ?auto_13319 ?auto_13335 ) ) ( not ( = ?auto_13331 ?auto_13343 ) ) ( not ( = ?auto_13331 ?auto_13349 ) ) ( not ( = ?auto_13331 ?auto_13325 ) ) ( not ( = ?auto_13331 ?auto_13342 ) ) ( not ( = ?auto_13331 ?auto_13337 ) ) ( not ( = ?auto_13331 ?auto_13340 ) ) ( not ( = ?auto_13331 ?auto_13347 ) ) ( not ( = ?auto_13331 ?auto_13330 ) ) ( not ( = ?auto_13351 ?auto_13338 ) ) ( not ( = ?auto_13351 ?auto_13346 ) ) ( not ( = ?auto_13351 ?auto_13326 ) ) ( not ( = ?auto_13351 ?auto_13334 ) ) ( not ( = ?auto_13351 ?auto_13336 ) ) ( not ( = ?auto_13351 ?auto_13344 ) ) ( not ( = ?auto_13351 ?auto_13353 ) ) ( not ( = ?auto_13351 ?auto_13328 ) ) ( not ( = ?auto_13333 ?auto_13332 ) ) ( not ( = ?auto_13333 ?auto_13329 ) ) ( not ( = ?auto_13333 ?auto_13339 ) ) ( not ( = ?auto_13333 ?auto_13350 ) ) ( not ( = ?auto_13333 ?auto_13341 ) ) ( not ( = ?auto_13333 ?auto_13348 ) ) ( not ( = ?auto_13333 ?auto_13352 ) ) ( not ( = ?auto_13333 ?auto_13345 ) ) ( not ( = ?auto_13333 ?auto_13335 ) ) ( not ( = ?auto_13308 ?auto_13318 ) ) ( not ( = ?auto_13308 ?auto_13327 ) ) ( not ( = ?auto_13309 ?auto_13318 ) ) ( not ( = ?auto_13309 ?auto_13327 ) ) ( not ( = ?auto_13310 ?auto_13318 ) ) ( not ( = ?auto_13310 ?auto_13327 ) ) ( not ( = ?auto_13311 ?auto_13318 ) ) ( not ( = ?auto_13311 ?auto_13327 ) ) ( not ( = ?auto_13312 ?auto_13318 ) ) ( not ( = ?auto_13312 ?auto_13327 ) ) ( not ( = ?auto_13315 ?auto_13318 ) ) ( not ( = ?auto_13315 ?auto_13327 ) ) ( not ( = ?auto_13313 ?auto_13318 ) ) ( not ( = ?auto_13313 ?auto_13327 ) ) ( not ( = ?auto_13317 ?auto_13318 ) ) ( not ( = ?auto_13317 ?auto_13327 ) ) ( not ( = ?auto_13316 ?auto_13318 ) ) ( not ( = ?auto_13316 ?auto_13327 ) ) ( not ( = ?auto_13314 ?auto_13318 ) ) ( not ( = ?auto_13314 ?auto_13327 ) ) ( not ( = ?auto_13318 ?auto_13333 ) ) ( not ( = ?auto_13318 ?auto_13332 ) ) ( not ( = ?auto_13318 ?auto_13329 ) ) ( not ( = ?auto_13318 ?auto_13339 ) ) ( not ( = ?auto_13318 ?auto_13350 ) ) ( not ( = ?auto_13318 ?auto_13341 ) ) ( not ( = ?auto_13318 ?auto_13348 ) ) ( not ( = ?auto_13318 ?auto_13352 ) ) ( not ( = ?auto_13318 ?auto_13345 ) ) ( not ( = ?auto_13318 ?auto_13335 ) ) ( not ( = ?auto_13327 ?auto_13333 ) ) ( not ( = ?auto_13327 ?auto_13332 ) ) ( not ( = ?auto_13327 ?auto_13329 ) ) ( not ( = ?auto_13327 ?auto_13339 ) ) ( not ( = ?auto_13327 ?auto_13350 ) ) ( not ( = ?auto_13327 ?auto_13341 ) ) ( not ( = ?auto_13327 ?auto_13348 ) ) ( not ( = ?auto_13327 ?auto_13352 ) ) ( not ( = ?auto_13327 ?auto_13345 ) ) ( not ( = ?auto_13327 ?auto_13335 ) ) ( not ( = ?auto_13308 ?auto_13320 ) ) ( not ( = ?auto_13308 ?auto_13324 ) ) ( not ( = ?auto_13309 ?auto_13320 ) ) ( not ( = ?auto_13309 ?auto_13324 ) ) ( not ( = ?auto_13310 ?auto_13320 ) ) ( not ( = ?auto_13310 ?auto_13324 ) ) ( not ( = ?auto_13311 ?auto_13320 ) ) ( not ( = ?auto_13311 ?auto_13324 ) ) ( not ( = ?auto_13312 ?auto_13320 ) ) ( not ( = ?auto_13312 ?auto_13324 ) ) ( not ( = ?auto_13315 ?auto_13320 ) ) ( not ( = ?auto_13315 ?auto_13324 ) ) ( not ( = ?auto_13313 ?auto_13320 ) ) ( not ( = ?auto_13313 ?auto_13324 ) ) ( not ( = ?auto_13317 ?auto_13320 ) ) ( not ( = ?auto_13317 ?auto_13324 ) ) ( not ( = ?auto_13316 ?auto_13320 ) ) ( not ( = ?auto_13316 ?auto_13324 ) ) ( not ( = ?auto_13314 ?auto_13320 ) ) ( not ( = ?auto_13314 ?auto_13324 ) ) ( not ( = ?auto_13319 ?auto_13320 ) ) ( not ( = ?auto_13319 ?auto_13324 ) ) ( not ( = ?auto_13320 ?auto_13327 ) ) ( not ( = ?auto_13320 ?auto_13333 ) ) ( not ( = ?auto_13320 ?auto_13332 ) ) ( not ( = ?auto_13320 ?auto_13329 ) ) ( not ( = ?auto_13320 ?auto_13339 ) ) ( not ( = ?auto_13320 ?auto_13350 ) ) ( not ( = ?auto_13320 ?auto_13341 ) ) ( not ( = ?auto_13320 ?auto_13348 ) ) ( not ( = ?auto_13320 ?auto_13352 ) ) ( not ( = ?auto_13320 ?auto_13345 ) ) ( not ( = ?auto_13320 ?auto_13335 ) ) ( not ( = ?auto_13324 ?auto_13327 ) ) ( not ( = ?auto_13324 ?auto_13333 ) ) ( not ( = ?auto_13324 ?auto_13332 ) ) ( not ( = ?auto_13324 ?auto_13329 ) ) ( not ( = ?auto_13324 ?auto_13339 ) ) ( not ( = ?auto_13324 ?auto_13350 ) ) ( not ( = ?auto_13324 ?auto_13341 ) ) ( not ( = ?auto_13324 ?auto_13348 ) ) ( not ( = ?auto_13324 ?auto_13352 ) ) ( not ( = ?auto_13324 ?auto_13345 ) ) ( not ( = ?auto_13324 ?auto_13335 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_13308 ?auto_13309 ?auto_13310 ?auto_13311 ?auto_13312 ?auto_13315 ?auto_13313 ?auto_13317 ?auto_13316 ?auto_13314 ?auto_13319 ?auto_13318 )
      ( MAKE-1CRATE ?auto_13318 ?auto_13320 )
      ( MAKE-12CRATE-VERIFY ?auto_13308 ?auto_13309 ?auto_13310 ?auto_13311 ?auto_13312 ?auto_13315 ?auto_13313 ?auto_13317 ?auto_13316 ?auto_13314 ?auto_13319 ?auto_13318 ?auto_13320 ) )
  )

)

