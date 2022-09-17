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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12841 - SURFACE
      ?auto_12842 - SURFACE
      ?auto_12843 - SURFACE
    )
    :vars
    (
      ?auto_12846 - HOIST
      ?auto_12845 - PLACE
      ?auto_12844 - PLACE
      ?auto_12848 - HOIST
      ?auto_12847 - SURFACE
      ?auto_12852 - PLACE
      ?auto_12850 - HOIST
      ?auto_12851 - SURFACE
      ?auto_12849 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12846 ?auto_12845 ) ( IS-CRATE ?auto_12843 ) ( not ( = ?auto_12844 ?auto_12845 ) ) ( HOIST-AT ?auto_12848 ?auto_12844 ) ( AVAILABLE ?auto_12848 ) ( SURFACE-AT ?auto_12843 ?auto_12844 ) ( ON ?auto_12843 ?auto_12847 ) ( CLEAR ?auto_12843 ) ( not ( = ?auto_12842 ?auto_12843 ) ) ( not ( = ?auto_12842 ?auto_12847 ) ) ( not ( = ?auto_12843 ?auto_12847 ) ) ( not ( = ?auto_12846 ?auto_12848 ) ) ( SURFACE-AT ?auto_12841 ?auto_12845 ) ( CLEAR ?auto_12841 ) ( IS-CRATE ?auto_12842 ) ( AVAILABLE ?auto_12846 ) ( not ( = ?auto_12852 ?auto_12845 ) ) ( HOIST-AT ?auto_12850 ?auto_12852 ) ( AVAILABLE ?auto_12850 ) ( SURFACE-AT ?auto_12842 ?auto_12852 ) ( ON ?auto_12842 ?auto_12851 ) ( CLEAR ?auto_12842 ) ( TRUCK-AT ?auto_12849 ?auto_12845 ) ( not ( = ?auto_12841 ?auto_12842 ) ) ( not ( = ?auto_12841 ?auto_12851 ) ) ( not ( = ?auto_12842 ?auto_12851 ) ) ( not ( = ?auto_12846 ?auto_12850 ) ) ( not ( = ?auto_12841 ?auto_12843 ) ) ( not ( = ?auto_12841 ?auto_12847 ) ) ( not ( = ?auto_12843 ?auto_12851 ) ) ( not ( = ?auto_12844 ?auto_12852 ) ) ( not ( = ?auto_12848 ?auto_12850 ) ) ( not ( = ?auto_12847 ?auto_12851 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12841 ?auto_12842 )
      ( MAKE-1CRATE ?auto_12842 ?auto_12843 )
      ( MAKE-2CRATE-VERIFY ?auto_12841 ?auto_12842 ?auto_12843 ) )
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
      ?auto_12875 - HOIST
      ?auto_12873 - PLACE
      ?auto_12874 - PLACE
      ?auto_12872 - HOIST
      ?auto_12876 - SURFACE
      ?auto_12878 - PLACE
      ?auto_12882 - HOIST
      ?auto_12877 - SURFACE
      ?auto_12881 - PLACE
      ?auto_12879 - HOIST
      ?auto_12880 - SURFACE
      ?auto_12871 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12875 ?auto_12873 ) ( IS-CRATE ?auto_12870 ) ( not ( = ?auto_12874 ?auto_12873 ) ) ( HOIST-AT ?auto_12872 ?auto_12874 ) ( AVAILABLE ?auto_12872 ) ( SURFACE-AT ?auto_12870 ?auto_12874 ) ( ON ?auto_12870 ?auto_12876 ) ( CLEAR ?auto_12870 ) ( not ( = ?auto_12869 ?auto_12870 ) ) ( not ( = ?auto_12869 ?auto_12876 ) ) ( not ( = ?auto_12870 ?auto_12876 ) ) ( not ( = ?auto_12875 ?auto_12872 ) ) ( IS-CRATE ?auto_12869 ) ( not ( = ?auto_12878 ?auto_12873 ) ) ( HOIST-AT ?auto_12882 ?auto_12878 ) ( AVAILABLE ?auto_12882 ) ( SURFACE-AT ?auto_12869 ?auto_12878 ) ( ON ?auto_12869 ?auto_12877 ) ( CLEAR ?auto_12869 ) ( not ( = ?auto_12868 ?auto_12869 ) ) ( not ( = ?auto_12868 ?auto_12877 ) ) ( not ( = ?auto_12869 ?auto_12877 ) ) ( not ( = ?auto_12875 ?auto_12882 ) ) ( SURFACE-AT ?auto_12867 ?auto_12873 ) ( CLEAR ?auto_12867 ) ( IS-CRATE ?auto_12868 ) ( AVAILABLE ?auto_12875 ) ( not ( = ?auto_12881 ?auto_12873 ) ) ( HOIST-AT ?auto_12879 ?auto_12881 ) ( AVAILABLE ?auto_12879 ) ( SURFACE-AT ?auto_12868 ?auto_12881 ) ( ON ?auto_12868 ?auto_12880 ) ( CLEAR ?auto_12868 ) ( TRUCK-AT ?auto_12871 ?auto_12873 ) ( not ( = ?auto_12867 ?auto_12868 ) ) ( not ( = ?auto_12867 ?auto_12880 ) ) ( not ( = ?auto_12868 ?auto_12880 ) ) ( not ( = ?auto_12875 ?auto_12879 ) ) ( not ( = ?auto_12867 ?auto_12869 ) ) ( not ( = ?auto_12867 ?auto_12877 ) ) ( not ( = ?auto_12869 ?auto_12880 ) ) ( not ( = ?auto_12878 ?auto_12881 ) ) ( not ( = ?auto_12882 ?auto_12879 ) ) ( not ( = ?auto_12877 ?auto_12880 ) ) ( not ( = ?auto_12867 ?auto_12870 ) ) ( not ( = ?auto_12867 ?auto_12876 ) ) ( not ( = ?auto_12868 ?auto_12870 ) ) ( not ( = ?auto_12868 ?auto_12876 ) ) ( not ( = ?auto_12870 ?auto_12877 ) ) ( not ( = ?auto_12870 ?auto_12880 ) ) ( not ( = ?auto_12874 ?auto_12878 ) ) ( not ( = ?auto_12874 ?auto_12881 ) ) ( not ( = ?auto_12872 ?auto_12882 ) ) ( not ( = ?auto_12872 ?auto_12879 ) ) ( not ( = ?auto_12876 ?auto_12877 ) ) ( not ( = ?auto_12876 ?auto_12880 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12867 ?auto_12868 ?auto_12869 )
      ( MAKE-1CRATE ?auto_12869 ?auto_12870 )
      ( MAKE-3CRATE-VERIFY ?auto_12867 ?auto_12868 ?auto_12869 ?auto_12870 ) )
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
      ?auto_12907 - HOIST
      ?auto_12904 - PLACE
      ?auto_12906 - PLACE
      ?auto_12908 - HOIST
      ?auto_12905 - SURFACE
      ?auto_12911 - PLACE
      ?auto_12909 - HOIST
      ?auto_12913 - SURFACE
      ?auto_12915 - PLACE
      ?auto_12910 - HOIST
      ?auto_12914 - SURFACE
      ?auto_12912 - SURFACE
      ?auto_12903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12907 ?auto_12904 ) ( IS-CRATE ?auto_12902 ) ( not ( = ?auto_12906 ?auto_12904 ) ) ( HOIST-AT ?auto_12908 ?auto_12906 ) ( SURFACE-AT ?auto_12902 ?auto_12906 ) ( ON ?auto_12902 ?auto_12905 ) ( CLEAR ?auto_12902 ) ( not ( = ?auto_12901 ?auto_12902 ) ) ( not ( = ?auto_12901 ?auto_12905 ) ) ( not ( = ?auto_12902 ?auto_12905 ) ) ( not ( = ?auto_12907 ?auto_12908 ) ) ( IS-CRATE ?auto_12901 ) ( not ( = ?auto_12911 ?auto_12904 ) ) ( HOIST-AT ?auto_12909 ?auto_12911 ) ( AVAILABLE ?auto_12909 ) ( SURFACE-AT ?auto_12901 ?auto_12911 ) ( ON ?auto_12901 ?auto_12913 ) ( CLEAR ?auto_12901 ) ( not ( = ?auto_12900 ?auto_12901 ) ) ( not ( = ?auto_12900 ?auto_12913 ) ) ( not ( = ?auto_12901 ?auto_12913 ) ) ( not ( = ?auto_12907 ?auto_12909 ) ) ( IS-CRATE ?auto_12900 ) ( not ( = ?auto_12915 ?auto_12904 ) ) ( HOIST-AT ?auto_12910 ?auto_12915 ) ( AVAILABLE ?auto_12910 ) ( SURFACE-AT ?auto_12900 ?auto_12915 ) ( ON ?auto_12900 ?auto_12914 ) ( CLEAR ?auto_12900 ) ( not ( = ?auto_12899 ?auto_12900 ) ) ( not ( = ?auto_12899 ?auto_12914 ) ) ( not ( = ?auto_12900 ?auto_12914 ) ) ( not ( = ?auto_12907 ?auto_12910 ) ) ( SURFACE-AT ?auto_12898 ?auto_12904 ) ( CLEAR ?auto_12898 ) ( IS-CRATE ?auto_12899 ) ( AVAILABLE ?auto_12907 ) ( AVAILABLE ?auto_12908 ) ( SURFACE-AT ?auto_12899 ?auto_12906 ) ( ON ?auto_12899 ?auto_12912 ) ( CLEAR ?auto_12899 ) ( TRUCK-AT ?auto_12903 ?auto_12904 ) ( not ( = ?auto_12898 ?auto_12899 ) ) ( not ( = ?auto_12898 ?auto_12912 ) ) ( not ( = ?auto_12899 ?auto_12912 ) ) ( not ( = ?auto_12898 ?auto_12900 ) ) ( not ( = ?auto_12898 ?auto_12914 ) ) ( not ( = ?auto_12900 ?auto_12912 ) ) ( not ( = ?auto_12915 ?auto_12906 ) ) ( not ( = ?auto_12910 ?auto_12908 ) ) ( not ( = ?auto_12914 ?auto_12912 ) ) ( not ( = ?auto_12898 ?auto_12901 ) ) ( not ( = ?auto_12898 ?auto_12913 ) ) ( not ( = ?auto_12899 ?auto_12901 ) ) ( not ( = ?auto_12899 ?auto_12913 ) ) ( not ( = ?auto_12901 ?auto_12914 ) ) ( not ( = ?auto_12901 ?auto_12912 ) ) ( not ( = ?auto_12911 ?auto_12915 ) ) ( not ( = ?auto_12911 ?auto_12906 ) ) ( not ( = ?auto_12909 ?auto_12910 ) ) ( not ( = ?auto_12909 ?auto_12908 ) ) ( not ( = ?auto_12913 ?auto_12914 ) ) ( not ( = ?auto_12913 ?auto_12912 ) ) ( not ( = ?auto_12898 ?auto_12902 ) ) ( not ( = ?auto_12898 ?auto_12905 ) ) ( not ( = ?auto_12899 ?auto_12902 ) ) ( not ( = ?auto_12899 ?auto_12905 ) ) ( not ( = ?auto_12900 ?auto_12902 ) ) ( not ( = ?auto_12900 ?auto_12905 ) ) ( not ( = ?auto_12902 ?auto_12913 ) ) ( not ( = ?auto_12902 ?auto_12914 ) ) ( not ( = ?auto_12902 ?auto_12912 ) ) ( not ( = ?auto_12905 ?auto_12913 ) ) ( not ( = ?auto_12905 ?auto_12914 ) ) ( not ( = ?auto_12905 ?auto_12912 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_12898 ?auto_12899 ?auto_12900 ?auto_12901 )
      ( MAKE-1CRATE ?auto_12901 ?auto_12902 )
      ( MAKE-4CRATE-VERIFY ?auto_12898 ?auto_12899 ?auto_12900 ?auto_12901 ?auto_12902 ) )
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
      ?auto_12938 - HOIST
      ?auto_12941 - PLACE
      ?auto_12943 - PLACE
      ?auto_12942 - HOIST
      ?auto_12940 - SURFACE
      ?auto_12949 - PLACE
      ?auto_12950 - HOIST
      ?auto_12952 - SURFACE
      ?auto_12948 - PLACE
      ?auto_12951 - HOIST
      ?auto_12945 - SURFACE
      ?auto_12953 - PLACE
      ?auto_12947 - HOIST
      ?auto_12946 - SURFACE
      ?auto_12944 - SURFACE
      ?auto_12939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12938 ?auto_12941 ) ( IS-CRATE ?auto_12937 ) ( not ( = ?auto_12943 ?auto_12941 ) ) ( HOIST-AT ?auto_12942 ?auto_12943 ) ( AVAILABLE ?auto_12942 ) ( SURFACE-AT ?auto_12937 ?auto_12943 ) ( ON ?auto_12937 ?auto_12940 ) ( CLEAR ?auto_12937 ) ( not ( = ?auto_12936 ?auto_12937 ) ) ( not ( = ?auto_12936 ?auto_12940 ) ) ( not ( = ?auto_12937 ?auto_12940 ) ) ( not ( = ?auto_12938 ?auto_12942 ) ) ( IS-CRATE ?auto_12936 ) ( not ( = ?auto_12949 ?auto_12941 ) ) ( HOIST-AT ?auto_12950 ?auto_12949 ) ( SURFACE-AT ?auto_12936 ?auto_12949 ) ( ON ?auto_12936 ?auto_12952 ) ( CLEAR ?auto_12936 ) ( not ( = ?auto_12935 ?auto_12936 ) ) ( not ( = ?auto_12935 ?auto_12952 ) ) ( not ( = ?auto_12936 ?auto_12952 ) ) ( not ( = ?auto_12938 ?auto_12950 ) ) ( IS-CRATE ?auto_12935 ) ( not ( = ?auto_12948 ?auto_12941 ) ) ( HOIST-AT ?auto_12951 ?auto_12948 ) ( AVAILABLE ?auto_12951 ) ( SURFACE-AT ?auto_12935 ?auto_12948 ) ( ON ?auto_12935 ?auto_12945 ) ( CLEAR ?auto_12935 ) ( not ( = ?auto_12934 ?auto_12935 ) ) ( not ( = ?auto_12934 ?auto_12945 ) ) ( not ( = ?auto_12935 ?auto_12945 ) ) ( not ( = ?auto_12938 ?auto_12951 ) ) ( IS-CRATE ?auto_12934 ) ( not ( = ?auto_12953 ?auto_12941 ) ) ( HOIST-AT ?auto_12947 ?auto_12953 ) ( AVAILABLE ?auto_12947 ) ( SURFACE-AT ?auto_12934 ?auto_12953 ) ( ON ?auto_12934 ?auto_12946 ) ( CLEAR ?auto_12934 ) ( not ( = ?auto_12933 ?auto_12934 ) ) ( not ( = ?auto_12933 ?auto_12946 ) ) ( not ( = ?auto_12934 ?auto_12946 ) ) ( not ( = ?auto_12938 ?auto_12947 ) ) ( SURFACE-AT ?auto_12932 ?auto_12941 ) ( CLEAR ?auto_12932 ) ( IS-CRATE ?auto_12933 ) ( AVAILABLE ?auto_12938 ) ( AVAILABLE ?auto_12950 ) ( SURFACE-AT ?auto_12933 ?auto_12949 ) ( ON ?auto_12933 ?auto_12944 ) ( CLEAR ?auto_12933 ) ( TRUCK-AT ?auto_12939 ?auto_12941 ) ( not ( = ?auto_12932 ?auto_12933 ) ) ( not ( = ?auto_12932 ?auto_12944 ) ) ( not ( = ?auto_12933 ?auto_12944 ) ) ( not ( = ?auto_12932 ?auto_12934 ) ) ( not ( = ?auto_12932 ?auto_12946 ) ) ( not ( = ?auto_12934 ?auto_12944 ) ) ( not ( = ?auto_12953 ?auto_12949 ) ) ( not ( = ?auto_12947 ?auto_12950 ) ) ( not ( = ?auto_12946 ?auto_12944 ) ) ( not ( = ?auto_12932 ?auto_12935 ) ) ( not ( = ?auto_12932 ?auto_12945 ) ) ( not ( = ?auto_12933 ?auto_12935 ) ) ( not ( = ?auto_12933 ?auto_12945 ) ) ( not ( = ?auto_12935 ?auto_12946 ) ) ( not ( = ?auto_12935 ?auto_12944 ) ) ( not ( = ?auto_12948 ?auto_12953 ) ) ( not ( = ?auto_12948 ?auto_12949 ) ) ( not ( = ?auto_12951 ?auto_12947 ) ) ( not ( = ?auto_12951 ?auto_12950 ) ) ( not ( = ?auto_12945 ?auto_12946 ) ) ( not ( = ?auto_12945 ?auto_12944 ) ) ( not ( = ?auto_12932 ?auto_12936 ) ) ( not ( = ?auto_12932 ?auto_12952 ) ) ( not ( = ?auto_12933 ?auto_12936 ) ) ( not ( = ?auto_12933 ?auto_12952 ) ) ( not ( = ?auto_12934 ?auto_12936 ) ) ( not ( = ?auto_12934 ?auto_12952 ) ) ( not ( = ?auto_12936 ?auto_12945 ) ) ( not ( = ?auto_12936 ?auto_12946 ) ) ( not ( = ?auto_12936 ?auto_12944 ) ) ( not ( = ?auto_12952 ?auto_12945 ) ) ( not ( = ?auto_12952 ?auto_12946 ) ) ( not ( = ?auto_12952 ?auto_12944 ) ) ( not ( = ?auto_12932 ?auto_12937 ) ) ( not ( = ?auto_12932 ?auto_12940 ) ) ( not ( = ?auto_12933 ?auto_12937 ) ) ( not ( = ?auto_12933 ?auto_12940 ) ) ( not ( = ?auto_12934 ?auto_12937 ) ) ( not ( = ?auto_12934 ?auto_12940 ) ) ( not ( = ?auto_12935 ?auto_12937 ) ) ( not ( = ?auto_12935 ?auto_12940 ) ) ( not ( = ?auto_12937 ?auto_12952 ) ) ( not ( = ?auto_12937 ?auto_12945 ) ) ( not ( = ?auto_12937 ?auto_12946 ) ) ( not ( = ?auto_12937 ?auto_12944 ) ) ( not ( = ?auto_12943 ?auto_12949 ) ) ( not ( = ?auto_12943 ?auto_12948 ) ) ( not ( = ?auto_12943 ?auto_12953 ) ) ( not ( = ?auto_12942 ?auto_12950 ) ) ( not ( = ?auto_12942 ?auto_12951 ) ) ( not ( = ?auto_12942 ?auto_12947 ) ) ( not ( = ?auto_12940 ?auto_12952 ) ) ( not ( = ?auto_12940 ?auto_12945 ) ) ( not ( = ?auto_12940 ?auto_12946 ) ) ( not ( = ?auto_12940 ?auto_12944 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_12932 ?auto_12933 ?auto_12934 ?auto_12935 ?auto_12936 )
      ( MAKE-1CRATE ?auto_12936 ?auto_12937 )
      ( MAKE-5CRATE-VERIFY ?auto_12932 ?auto_12933 ?auto_12934 ?auto_12935 ?auto_12936 ?auto_12937 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_12971 - SURFACE
      ?auto_12972 - SURFACE
      ?auto_12973 - SURFACE
      ?auto_12974 - SURFACE
      ?auto_12975 - SURFACE
      ?auto_12976 - SURFACE
      ?auto_12977 - SURFACE
    )
    :vars
    (
      ?auto_12979 - HOIST
      ?auto_12980 - PLACE
      ?auto_12982 - PLACE
      ?auto_12983 - HOIST
      ?auto_12981 - SURFACE
      ?auto_12992 - PLACE
      ?auto_12986 - HOIST
      ?auto_12985 - SURFACE
      ?auto_12984 - PLACE
      ?auto_12989 - HOIST
      ?auto_12993 - SURFACE
      ?auto_12991 - PLACE
      ?auto_12987 - HOIST
      ?auto_12988 - SURFACE
      ?auto_12996 - PLACE
      ?auto_12994 - HOIST
      ?auto_12995 - SURFACE
      ?auto_12990 - SURFACE
      ?auto_12978 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12979 ?auto_12980 ) ( IS-CRATE ?auto_12977 ) ( not ( = ?auto_12982 ?auto_12980 ) ) ( HOIST-AT ?auto_12983 ?auto_12982 ) ( AVAILABLE ?auto_12983 ) ( SURFACE-AT ?auto_12977 ?auto_12982 ) ( ON ?auto_12977 ?auto_12981 ) ( CLEAR ?auto_12977 ) ( not ( = ?auto_12976 ?auto_12977 ) ) ( not ( = ?auto_12976 ?auto_12981 ) ) ( not ( = ?auto_12977 ?auto_12981 ) ) ( not ( = ?auto_12979 ?auto_12983 ) ) ( IS-CRATE ?auto_12976 ) ( not ( = ?auto_12992 ?auto_12980 ) ) ( HOIST-AT ?auto_12986 ?auto_12992 ) ( AVAILABLE ?auto_12986 ) ( SURFACE-AT ?auto_12976 ?auto_12992 ) ( ON ?auto_12976 ?auto_12985 ) ( CLEAR ?auto_12976 ) ( not ( = ?auto_12975 ?auto_12976 ) ) ( not ( = ?auto_12975 ?auto_12985 ) ) ( not ( = ?auto_12976 ?auto_12985 ) ) ( not ( = ?auto_12979 ?auto_12986 ) ) ( IS-CRATE ?auto_12975 ) ( not ( = ?auto_12984 ?auto_12980 ) ) ( HOIST-AT ?auto_12989 ?auto_12984 ) ( SURFACE-AT ?auto_12975 ?auto_12984 ) ( ON ?auto_12975 ?auto_12993 ) ( CLEAR ?auto_12975 ) ( not ( = ?auto_12974 ?auto_12975 ) ) ( not ( = ?auto_12974 ?auto_12993 ) ) ( not ( = ?auto_12975 ?auto_12993 ) ) ( not ( = ?auto_12979 ?auto_12989 ) ) ( IS-CRATE ?auto_12974 ) ( not ( = ?auto_12991 ?auto_12980 ) ) ( HOIST-AT ?auto_12987 ?auto_12991 ) ( AVAILABLE ?auto_12987 ) ( SURFACE-AT ?auto_12974 ?auto_12991 ) ( ON ?auto_12974 ?auto_12988 ) ( CLEAR ?auto_12974 ) ( not ( = ?auto_12973 ?auto_12974 ) ) ( not ( = ?auto_12973 ?auto_12988 ) ) ( not ( = ?auto_12974 ?auto_12988 ) ) ( not ( = ?auto_12979 ?auto_12987 ) ) ( IS-CRATE ?auto_12973 ) ( not ( = ?auto_12996 ?auto_12980 ) ) ( HOIST-AT ?auto_12994 ?auto_12996 ) ( AVAILABLE ?auto_12994 ) ( SURFACE-AT ?auto_12973 ?auto_12996 ) ( ON ?auto_12973 ?auto_12995 ) ( CLEAR ?auto_12973 ) ( not ( = ?auto_12972 ?auto_12973 ) ) ( not ( = ?auto_12972 ?auto_12995 ) ) ( not ( = ?auto_12973 ?auto_12995 ) ) ( not ( = ?auto_12979 ?auto_12994 ) ) ( SURFACE-AT ?auto_12971 ?auto_12980 ) ( CLEAR ?auto_12971 ) ( IS-CRATE ?auto_12972 ) ( AVAILABLE ?auto_12979 ) ( AVAILABLE ?auto_12989 ) ( SURFACE-AT ?auto_12972 ?auto_12984 ) ( ON ?auto_12972 ?auto_12990 ) ( CLEAR ?auto_12972 ) ( TRUCK-AT ?auto_12978 ?auto_12980 ) ( not ( = ?auto_12971 ?auto_12972 ) ) ( not ( = ?auto_12971 ?auto_12990 ) ) ( not ( = ?auto_12972 ?auto_12990 ) ) ( not ( = ?auto_12971 ?auto_12973 ) ) ( not ( = ?auto_12971 ?auto_12995 ) ) ( not ( = ?auto_12973 ?auto_12990 ) ) ( not ( = ?auto_12996 ?auto_12984 ) ) ( not ( = ?auto_12994 ?auto_12989 ) ) ( not ( = ?auto_12995 ?auto_12990 ) ) ( not ( = ?auto_12971 ?auto_12974 ) ) ( not ( = ?auto_12971 ?auto_12988 ) ) ( not ( = ?auto_12972 ?auto_12974 ) ) ( not ( = ?auto_12972 ?auto_12988 ) ) ( not ( = ?auto_12974 ?auto_12995 ) ) ( not ( = ?auto_12974 ?auto_12990 ) ) ( not ( = ?auto_12991 ?auto_12996 ) ) ( not ( = ?auto_12991 ?auto_12984 ) ) ( not ( = ?auto_12987 ?auto_12994 ) ) ( not ( = ?auto_12987 ?auto_12989 ) ) ( not ( = ?auto_12988 ?auto_12995 ) ) ( not ( = ?auto_12988 ?auto_12990 ) ) ( not ( = ?auto_12971 ?auto_12975 ) ) ( not ( = ?auto_12971 ?auto_12993 ) ) ( not ( = ?auto_12972 ?auto_12975 ) ) ( not ( = ?auto_12972 ?auto_12993 ) ) ( not ( = ?auto_12973 ?auto_12975 ) ) ( not ( = ?auto_12973 ?auto_12993 ) ) ( not ( = ?auto_12975 ?auto_12988 ) ) ( not ( = ?auto_12975 ?auto_12995 ) ) ( not ( = ?auto_12975 ?auto_12990 ) ) ( not ( = ?auto_12993 ?auto_12988 ) ) ( not ( = ?auto_12993 ?auto_12995 ) ) ( not ( = ?auto_12993 ?auto_12990 ) ) ( not ( = ?auto_12971 ?auto_12976 ) ) ( not ( = ?auto_12971 ?auto_12985 ) ) ( not ( = ?auto_12972 ?auto_12976 ) ) ( not ( = ?auto_12972 ?auto_12985 ) ) ( not ( = ?auto_12973 ?auto_12976 ) ) ( not ( = ?auto_12973 ?auto_12985 ) ) ( not ( = ?auto_12974 ?auto_12976 ) ) ( not ( = ?auto_12974 ?auto_12985 ) ) ( not ( = ?auto_12976 ?auto_12993 ) ) ( not ( = ?auto_12976 ?auto_12988 ) ) ( not ( = ?auto_12976 ?auto_12995 ) ) ( not ( = ?auto_12976 ?auto_12990 ) ) ( not ( = ?auto_12992 ?auto_12984 ) ) ( not ( = ?auto_12992 ?auto_12991 ) ) ( not ( = ?auto_12992 ?auto_12996 ) ) ( not ( = ?auto_12986 ?auto_12989 ) ) ( not ( = ?auto_12986 ?auto_12987 ) ) ( not ( = ?auto_12986 ?auto_12994 ) ) ( not ( = ?auto_12985 ?auto_12993 ) ) ( not ( = ?auto_12985 ?auto_12988 ) ) ( not ( = ?auto_12985 ?auto_12995 ) ) ( not ( = ?auto_12985 ?auto_12990 ) ) ( not ( = ?auto_12971 ?auto_12977 ) ) ( not ( = ?auto_12971 ?auto_12981 ) ) ( not ( = ?auto_12972 ?auto_12977 ) ) ( not ( = ?auto_12972 ?auto_12981 ) ) ( not ( = ?auto_12973 ?auto_12977 ) ) ( not ( = ?auto_12973 ?auto_12981 ) ) ( not ( = ?auto_12974 ?auto_12977 ) ) ( not ( = ?auto_12974 ?auto_12981 ) ) ( not ( = ?auto_12975 ?auto_12977 ) ) ( not ( = ?auto_12975 ?auto_12981 ) ) ( not ( = ?auto_12977 ?auto_12985 ) ) ( not ( = ?auto_12977 ?auto_12993 ) ) ( not ( = ?auto_12977 ?auto_12988 ) ) ( not ( = ?auto_12977 ?auto_12995 ) ) ( not ( = ?auto_12977 ?auto_12990 ) ) ( not ( = ?auto_12982 ?auto_12992 ) ) ( not ( = ?auto_12982 ?auto_12984 ) ) ( not ( = ?auto_12982 ?auto_12991 ) ) ( not ( = ?auto_12982 ?auto_12996 ) ) ( not ( = ?auto_12983 ?auto_12986 ) ) ( not ( = ?auto_12983 ?auto_12989 ) ) ( not ( = ?auto_12983 ?auto_12987 ) ) ( not ( = ?auto_12983 ?auto_12994 ) ) ( not ( = ?auto_12981 ?auto_12985 ) ) ( not ( = ?auto_12981 ?auto_12993 ) ) ( not ( = ?auto_12981 ?auto_12988 ) ) ( not ( = ?auto_12981 ?auto_12995 ) ) ( not ( = ?auto_12981 ?auto_12990 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_12971 ?auto_12972 ?auto_12973 ?auto_12974 ?auto_12975 ?auto_12976 )
      ( MAKE-1CRATE ?auto_12976 ?auto_12977 )
      ( MAKE-6CRATE-VERIFY ?auto_12971 ?auto_12972 ?auto_12973 ?auto_12974 ?auto_12975 ?auto_12976 ?auto_12977 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_13015 - SURFACE
      ?auto_13016 - SURFACE
      ?auto_13017 - SURFACE
      ?auto_13018 - SURFACE
      ?auto_13019 - SURFACE
      ?auto_13020 - SURFACE
      ?auto_13021 - SURFACE
      ?auto_13022 - SURFACE
    )
    :vars
    (
      ?auto_13028 - HOIST
      ?auto_13027 - PLACE
      ?auto_13023 - PLACE
      ?auto_13024 - HOIST
      ?auto_13026 - SURFACE
      ?auto_13044 - PLACE
      ?auto_13043 - HOIST
      ?auto_13040 - SURFACE
      ?auto_13029 - PLACE
      ?auto_13037 - HOIST
      ?auto_13032 - SURFACE
      ?auto_13038 - PLACE
      ?auto_13030 - HOIST
      ?auto_13033 - SURFACE
      ?auto_13042 - PLACE
      ?auto_13034 - HOIST
      ?auto_13031 - SURFACE
      ?auto_13041 - PLACE
      ?auto_13036 - HOIST
      ?auto_13039 - SURFACE
      ?auto_13035 - SURFACE
      ?auto_13025 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13028 ?auto_13027 ) ( IS-CRATE ?auto_13022 ) ( not ( = ?auto_13023 ?auto_13027 ) ) ( HOIST-AT ?auto_13024 ?auto_13023 ) ( AVAILABLE ?auto_13024 ) ( SURFACE-AT ?auto_13022 ?auto_13023 ) ( ON ?auto_13022 ?auto_13026 ) ( CLEAR ?auto_13022 ) ( not ( = ?auto_13021 ?auto_13022 ) ) ( not ( = ?auto_13021 ?auto_13026 ) ) ( not ( = ?auto_13022 ?auto_13026 ) ) ( not ( = ?auto_13028 ?auto_13024 ) ) ( IS-CRATE ?auto_13021 ) ( not ( = ?auto_13044 ?auto_13027 ) ) ( HOIST-AT ?auto_13043 ?auto_13044 ) ( AVAILABLE ?auto_13043 ) ( SURFACE-AT ?auto_13021 ?auto_13044 ) ( ON ?auto_13021 ?auto_13040 ) ( CLEAR ?auto_13021 ) ( not ( = ?auto_13020 ?auto_13021 ) ) ( not ( = ?auto_13020 ?auto_13040 ) ) ( not ( = ?auto_13021 ?auto_13040 ) ) ( not ( = ?auto_13028 ?auto_13043 ) ) ( IS-CRATE ?auto_13020 ) ( not ( = ?auto_13029 ?auto_13027 ) ) ( HOIST-AT ?auto_13037 ?auto_13029 ) ( AVAILABLE ?auto_13037 ) ( SURFACE-AT ?auto_13020 ?auto_13029 ) ( ON ?auto_13020 ?auto_13032 ) ( CLEAR ?auto_13020 ) ( not ( = ?auto_13019 ?auto_13020 ) ) ( not ( = ?auto_13019 ?auto_13032 ) ) ( not ( = ?auto_13020 ?auto_13032 ) ) ( not ( = ?auto_13028 ?auto_13037 ) ) ( IS-CRATE ?auto_13019 ) ( not ( = ?auto_13038 ?auto_13027 ) ) ( HOIST-AT ?auto_13030 ?auto_13038 ) ( SURFACE-AT ?auto_13019 ?auto_13038 ) ( ON ?auto_13019 ?auto_13033 ) ( CLEAR ?auto_13019 ) ( not ( = ?auto_13018 ?auto_13019 ) ) ( not ( = ?auto_13018 ?auto_13033 ) ) ( not ( = ?auto_13019 ?auto_13033 ) ) ( not ( = ?auto_13028 ?auto_13030 ) ) ( IS-CRATE ?auto_13018 ) ( not ( = ?auto_13042 ?auto_13027 ) ) ( HOIST-AT ?auto_13034 ?auto_13042 ) ( AVAILABLE ?auto_13034 ) ( SURFACE-AT ?auto_13018 ?auto_13042 ) ( ON ?auto_13018 ?auto_13031 ) ( CLEAR ?auto_13018 ) ( not ( = ?auto_13017 ?auto_13018 ) ) ( not ( = ?auto_13017 ?auto_13031 ) ) ( not ( = ?auto_13018 ?auto_13031 ) ) ( not ( = ?auto_13028 ?auto_13034 ) ) ( IS-CRATE ?auto_13017 ) ( not ( = ?auto_13041 ?auto_13027 ) ) ( HOIST-AT ?auto_13036 ?auto_13041 ) ( AVAILABLE ?auto_13036 ) ( SURFACE-AT ?auto_13017 ?auto_13041 ) ( ON ?auto_13017 ?auto_13039 ) ( CLEAR ?auto_13017 ) ( not ( = ?auto_13016 ?auto_13017 ) ) ( not ( = ?auto_13016 ?auto_13039 ) ) ( not ( = ?auto_13017 ?auto_13039 ) ) ( not ( = ?auto_13028 ?auto_13036 ) ) ( SURFACE-AT ?auto_13015 ?auto_13027 ) ( CLEAR ?auto_13015 ) ( IS-CRATE ?auto_13016 ) ( AVAILABLE ?auto_13028 ) ( AVAILABLE ?auto_13030 ) ( SURFACE-AT ?auto_13016 ?auto_13038 ) ( ON ?auto_13016 ?auto_13035 ) ( CLEAR ?auto_13016 ) ( TRUCK-AT ?auto_13025 ?auto_13027 ) ( not ( = ?auto_13015 ?auto_13016 ) ) ( not ( = ?auto_13015 ?auto_13035 ) ) ( not ( = ?auto_13016 ?auto_13035 ) ) ( not ( = ?auto_13015 ?auto_13017 ) ) ( not ( = ?auto_13015 ?auto_13039 ) ) ( not ( = ?auto_13017 ?auto_13035 ) ) ( not ( = ?auto_13041 ?auto_13038 ) ) ( not ( = ?auto_13036 ?auto_13030 ) ) ( not ( = ?auto_13039 ?auto_13035 ) ) ( not ( = ?auto_13015 ?auto_13018 ) ) ( not ( = ?auto_13015 ?auto_13031 ) ) ( not ( = ?auto_13016 ?auto_13018 ) ) ( not ( = ?auto_13016 ?auto_13031 ) ) ( not ( = ?auto_13018 ?auto_13039 ) ) ( not ( = ?auto_13018 ?auto_13035 ) ) ( not ( = ?auto_13042 ?auto_13041 ) ) ( not ( = ?auto_13042 ?auto_13038 ) ) ( not ( = ?auto_13034 ?auto_13036 ) ) ( not ( = ?auto_13034 ?auto_13030 ) ) ( not ( = ?auto_13031 ?auto_13039 ) ) ( not ( = ?auto_13031 ?auto_13035 ) ) ( not ( = ?auto_13015 ?auto_13019 ) ) ( not ( = ?auto_13015 ?auto_13033 ) ) ( not ( = ?auto_13016 ?auto_13019 ) ) ( not ( = ?auto_13016 ?auto_13033 ) ) ( not ( = ?auto_13017 ?auto_13019 ) ) ( not ( = ?auto_13017 ?auto_13033 ) ) ( not ( = ?auto_13019 ?auto_13031 ) ) ( not ( = ?auto_13019 ?auto_13039 ) ) ( not ( = ?auto_13019 ?auto_13035 ) ) ( not ( = ?auto_13033 ?auto_13031 ) ) ( not ( = ?auto_13033 ?auto_13039 ) ) ( not ( = ?auto_13033 ?auto_13035 ) ) ( not ( = ?auto_13015 ?auto_13020 ) ) ( not ( = ?auto_13015 ?auto_13032 ) ) ( not ( = ?auto_13016 ?auto_13020 ) ) ( not ( = ?auto_13016 ?auto_13032 ) ) ( not ( = ?auto_13017 ?auto_13020 ) ) ( not ( = ?auto_13017 ?auto_13032 ) ) ( not ( = ?auto_13018 ?auto_13020 ) ) ( not ( = ?auto_13018 ?auto_13032 ) ) ( not ( = ?auto_13020 ?auto_13033 ) ) ( not ( = ?auto_13020 ?auto_13031 ) ) ( not ( = ?auto_13020 ?auto_13039 ) ) ( not ( = ?auto_13020 ?auto_13035 ) ) ( not ( = ?auto_13029 ?auto_13038 ) ) ( not ( = ?auto_13029 ?auto_13042 ) ) ( not ( = ?auto_13029 ?auto_13041 ) ) ( not ( = ?auto_13037 ?auto_13030 ) ) ( not ( = ?auto_13037 ?auto_13034 ) ) ( not ( = ?auto_13037 ?auto_13036 ) ) ( not ( = ?auto_13032 ?auto_13033 ) ) ( not ( = ?auto_13032 ?auto_13031 ) ) ( not ( = ?auto_13032 ?auto_13039 ) ) ( not ( = ?auto_13032 ?auto_13035 ) ) ( not ( = ?auto_13015 ?auto_13021 ) ) ( not ( = ?auto_13015 ?auto_13040 ) ) ( not ( = ?auto_13016 ?auto_13021 ) ) ( not ( = ?auto_13016 ?auto_13040 ) ) ( not ( = ?auto_13017 ?auto_13021 ) ) ( not ( = ?auto_13017 ?auto_13040 ) ) ( not ( = ?auto_13018 ?auto_13021 ) ) ( not ( = ?auto_13018 ?auto_13040 ) ) ( not ( = ?auto_13019 ?auto_13021 ) ) ( not ( = ?auto_13019 ?auto_13040 ) ) ( not ( = ?auto_13021 ?auto_13032 ) ) ( not ( = ?auto_13021 ?auto_13033 ) ) ( not ( = ?auto_13021 ?auto_13031 ) ) ( not ( = ?auto_13021 ?auto_13039 ) ) ( not ( = ?auto_13021 ?auto_13035 ) ) ( not ( = ?auto_13044 ?auto_13029 ) ) ( not ( = ?auto_13044 ?auto_13038 ) ) ( not ( = ?auto_13044 ?auto_13042 ) ) ( not ( = ?auto_13044 ?auto_13041 ) ) ( not ( = ?auto_13043 ?auto_13037 ) ) ( not ( = ?auto_13043 ?auto_13030 ) ) ( not ( = ?auto_13043 ?auto_13034 ) ) ( not ( = ?auto_13043 ?auto_13036 ) ) ( not ( = ?auto_13040 ?auto_13032 ) ) ( not ( = ?auto_13040 ?auto_13033 ) ) ( not ( = ?auto_13040 ?auto_13031 ) ) ( not ( = ?auto_13040 ?auto_13039 ) ) ( not ( = ?auto_13040 ?auto_13035 ) ) ( not ( = ?auto_13015 ?auto_13022 ) ) ( not ( = ?auto_13015 ?auto_13026 ) ) ( not ( = ?auto_13016 ?auto_13022 ) ) ( not ( = ?auto_13016 ?auto_13026 ) ) ( not ( = ?auto_13017 ?auto_13022 ) ) ( not ( = ?auto_13017 ?auto_13026 ) ) ( not ( = ?auto_13018 ?auto_13022 ) ) ( not ( = ?auto_13018 ?auto_13026 ) ) ( not ( = ?auto_13019 ?auto_13022 ) ) ( not ( = ?auto_13019 ?auto_13026 ) ) ( not ( = ?auto_13020 ?auto_13022 ) ) ( not ( = ?auto_13020 ?auto_13026 ) ) ( not ( = ?auto_13022 ?auto_13040 ) ) ( not ( = ?auto_13022 ?auto_13032 ) ) ( not ( = ?auto_13022 ?auto_13033 ) ) ( not ( = ?auto_13022 ?auto_13031 ) ) ( not ( = ?auto_13022 ?auto_13039 ) ) ( not ( = ?auto_13022 ?auto_13035 ) ) ( not ( = ?auto_13023 ?auto_13044 ) ) ( not ( = ?auto_13023 ?auto_13029 ) ) ( not ( = ?auto_13023 ?auto_13038 ) ) ( not ( = ?auto_13023 ?auto_13042 ) ) ( not ( = ?auto_13023 ?auto_13041 ) ) ( not ( = ?auto_13024 ?auto_13043 ) ) ( not ( = ?auto_13024 ?auto_13037 ) ) ( not ( = ?auto_13024 ?auto_13030 ) ) ( not ( = ?auto_13024 ?auto_13034 ) ) ( not ( = ?auto_13024 ?auto_13036 ) ) ( not ( = ?auto_13026 ?auto_13040 ) ) ( not ( = ?auto_13026 ?auto_13032 ) ) ( not ( = ?auto_13026 ?auto_13033 ) ) ( not ( = ?auto_13026 ?auto_13031 ) ) ( not ( = ?auto_13026 ?auto_13039 ) ) ( not ( = ?auto_13026 ?auto_13035 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_13015 ?auto_13016 ?auto_13017 ?auto_13018 ?auto_13019 ?auto_13020 ?auto_13021 )
      ( MAKE-1CRATE ?auto_13021 ?auto_13022 )
      ( MAKE-7CRATE-VERIFY ?auto_13015 ?auto_13016 ?auto_13017 ?auto_13018 ?auto_13019 ?auto_13020 ?auto_13021 ?auto_13022 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_13064 - SURFACE
      ?auto_13065 - SURFACE
      ?auto_13066 - SURFACE
      ?auto_13067 - SURFACE
      ?auto_13068 - SURFACE
      ?auto_13069 - SURFACE
      ?auto_13070 - SURFACE
      ?auto_13071 - SURFACE
      ?auto_13072 - SURFACE
    )
    :vars
    (
      ?auto_13077 - HOIST
      ?auto_13075 - PLACE
      ?auto_13076 - PLACE
      ?auto_13073 - HOIST
      ?auto_13074 - SURFACE
      ?auto_13079 - PLACE
      ?auto_13093 - HOIST
      ?auto_13092 - SURFACE
      ?auto_13091 - PLACE
      ?auto_13086 - HOIST
      ?auto_13097 - SURFACE
      ?auto_13087 - PLACE
      ?auto_13088 - HOIST
      ?auto_13094 - SURFACE
      ?auto_13089 - PLACE
      ?auto_13080 - HOIST
      ?auto_13096 - SURFACE
      ?auto_13084 - PLACE
      ?auto_13082 - HOIST
      ?auto_13085 - SURFACE
      ?auto_13083 - PLACE
      ?auto_13095 - HOIST
      ?auto_13081 - SURFACE
      ?auto_13090 - SURFACE
      ?auto_13078 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13077 ?auto_13075 ) ( IS-CRATE ?auto_13072 ) ( not ( = ?auto_13076 ?auto_13075 ) ) ( HOIST-AT ?auto_13073 ?auto_13076 ) ( AVAILABLE ?auto_13073 ) ( SURFACE-AT ?auto_13072 ?auto_13076 ) ( ON ?auto_13072 ?auto_13074 ) ( CLEAR ?auto_13072 ) ( not ( = ?auto_13071 ?auto_13072 ) ) ( not ( = ?auto_13071 ?auto_13074 ) ) ( not ( = ?auto_13072 ?auto_13074 ) ) ( not ( = ?auto_13077 ?auto_13073 ) ) ( IS-CRATE ?auto_13071 ) ( not ( = ?auto_13079 ?auto_13075 ) ) ( HOIST-AT ?auto_13093 ?auto_13079 ) ( AVAILABLE ?auto_13093 ) ( SURFACE-AT ?auto_13071 ?auto_13079 ) ( ON ?auto_13071 ?auto_13092 ) ( CLEAR ?auto_13071 ) ( not ( = ?auto_13070 ?auto_13071 ) ) ( not ( = ?auto_13070 ?auto_13092 ) ) ( not ( = ?auto_13071 ?auto_13092 ) ) ( not ( = ?auto_13077 ?auto_13093 ) ) ( IS-CRATE ?auto_13070 ) ( not ( = ?auto_13091 ?auto_13075 ) ) ( HOIST-AT ?auto_13086 ?auto_13091 ) ( AVAILABLE ?auto_13086 ) ( SURFACE-AT ?auto_13070 ?auto_13091 ) ( ON ?auto_13070 ?auto_13097 ) ( CLEAR ?auto_13070 ) ( not ( = ?auto_13069 ?auto_13070 ) ) ( not ( = ?auto_13069 ?auto_13097 ) ) ( not ( = ?auto_13070 ?auto_13097 ) ) ( not ( = ?auto_13077 ?auto_13086 ) ) ( IS-CRATE ?auto_13069 ) ( not ( = ?auto_13087 ?auto_13075 ) ) ( HOIST-AT ?auto_13088 ?auto_13087 ) ( AVAILABLE ?auto_13088 ) ( SURFACE-AT ?auto_13069 ?auto_13087 ) ( ON ?auto_13069 ?auto_13094 ) ( CLEAR ?auto_13069 ) ( not ( = ?auto_13068 ?auto_13069 ) ) ( not ( = ?auto_13068 ?auto_13094 ) ) ( not ( = ?auto_13069 ?auto_13094 ) ) ( not ( = ?auto_13077 ?auto_13088 ) ) ( IS-CRATE ?auto_13068 ) ( not ( = ?auto_13089 ?auto_13075 ) ) ( HOIST-AT ?auto_13080 ?auto_13089 ) ( SURFACE-AT ?auto_13068 ?auto_13089 ) ( ON ?auto_13068 ?auto_13096 ) ( CLEAR ?auto_13068 ) ( not ( = ?auto_13067 ?auto_13068 ) ) ( not ( = ?auto_13067 ?auto_13096 ) ) ( not ( = ?auto_13068 ?auto_13096 ) ) ( not ( = ?auto_13077 ?auto_13080 ) ) ( IS-CRATE ?auto_13067 ) ( not ( = ?auto_13084 ?auto_13075 ) ) ( HOIST-AT ?auto_13082 ?auto_13084 ) ( AVAILABLE ?auto_13082 ) ( SURFACE-AT ?auto_13067 ?auto_13084 ) ( ON ?auto_13067 ?auto_13085 ) ( CLEAR ?auto_13067 ) ( not ( = ?auto_13066 ?auto_13067 ) ) ( not ( = ?auto_13066 ?auto_13085 ) ) ( not ( = ?auto_13067 ?auto_13085 ) ) ( not ( = ?auto_13077 ?auto_13082 ) ) ( IS-CRATE ?auto_13066 ) ( not ( = ?auto_13083 ?auto_13075 ) ) ( HOIST-AT ?auto_13095 ?auto_13083 ) ( AVAILABLE ?auto_13095 ) ( SURFACE-AT ?auto_13066 ?auto_13083 ) ( ON ?auto_13066 ?auto_13081 ) ( CLEAR ?auto_13066 ) ( not ( = ?auto_13065 ?auto_13066 ) ) ( not ( = ?auto_13065 ?auto_13081 ) ) ( not ( = ?auto_13066 ?auto_13081 ) ) ( not ( = ?auto_13077 ?auto_13095 ) ) ( SURFACE-AT ?auto_13064 ?auto_13075 ) ( CLEAR ?auto_13064 ) ( IS-CRATE ?auto_13065 ) ( AVAILABLE ?auto_13077 ) ( AVAILABLE ?auto_13080 ) ( SURFACE-AT ?auto_13065 ?auto_13089 ) ( ON ?auto_13065 ?auto_13090 ) ( CLEAR ?auto_13065 ) ( TRUCK-AT ?auto_13078 ?auto_13075 ) ( not ( = ?auto_13064 ?auto_13065 ) ) ( not ( = ?auto_13064 ?auto_13090 ) ) ( not ( = ?auto_13065 ?auto_13090 ) ) ( not ( = ?auto_13064 ?auto_13066 ) ) ( not ( = ?auto_13064 ?auto_13081 ) ) ( not ( = ?auto_13066 ?auto_13090 ) ) ( not ( = ?auto_13083 ?auto_13089 ) ) ( not ( = ?auto_13095 ?auto_13080 ) ) ( not ( = ?auto_13081 ?auto_13090 ) ) ( not ( = ?auto_13064 ?auto_13067 ) ) ( not ( = ?auto_13064 ?auto_13085 ) ) ( not ( = ?auto_13065 ?auto_13067 ) ) ( not ( = ?auto_13065 ?auto_13085 ) ) ( not ( = ?auto_13067 ?auto_13081 ) ) ( not ( = ?auto_13067 ?auto_13090 ) ) ( not ( = ?auto_13084 ?auto_13083 ) ) ( not ( = ?auto_13084 ?auto_13089 ) ) ( not ( = ?auto_13082 ?auto_13095 ) ) ( not ( = ?auto_13082 ?auto_13080 ) ) ( not ( = ?auto_13085 ?auto_13081 ) ) ( not ( = ?auto_13085 ?auto_13090 ) ) ( not ( = ?auto_13064 ?auto_13068 ) ) ( not ( = ?auto_13064 ?auto_13096 ) ) ( not ( = ?auto_13065 ?auto_13068 ) ) ( not ( = ?auto_13065 ?auto_13096 ) ) ( not ( = ?auto_13066 ?auto_13068 ) ) ( not ( = ?auto_13066 ?auto_13096 ) ) ( not ( = ?auto_13068 ?auto_13085 ) ) ( not ( = ?auto_13068 ?auto_13081 ) ) ( not ( = ?auto_13068 ?auto_13090 ) ) ( not ( = ?auto_13096 ?auto_13085 ) ) ( not ( = ?auto_13096 ?auto_13081 ) ) ( not ( = ?auto_13096 ?auto_13090 ) ) ( not ( = ?auto_13064 ?auto_13069 ) ) ( not ( = ?auto_13064 ?auto_13094 ) ) ( not ( = ?auto_13065 ?auto_13069 ) ) ( not ( = ?auto_13065 ?auto_13094 ) ) ( not ( = ?auto_13066 ?auto_13069 ) ) ( not ( = ?auto_13066 ?auto_13094 ) ) ( not ( = ?auto_13067 ?auto_13069 ) ) ( not ( = ?auto_13067 ?auto_13094 ) ) ( not ( = ?auto_13069 ?auto_13096 ) ) ( not ( = ?auto_13069 ?auto_13085 ) ) ( not ( = ?auto_13069 ?auto_13081 ) ) ( not ( = ?auto_13069 ?auto_13090 ) ) ( not ( = ?auto_13087 ?auto_13089 ) ) ( not ( = ?auto_13087 ?auto_13084 ) ) ( not ( = ?auto_13087 ?auto_13083 ) ) ( not ( = ?auto_13088 ?auto_13080 ) ) ( not ( = ?auto_13088 ?auto_13082 ) ) ( not ( = ?auto_13088 ?auto_13095 ) ) ( not ( = ?auto_13094 ?auto_13096 ) ) ( not ( = ?auto_13094 ?auto_13085 ) ) ( not ( = ?auto_13094 ?auto_13081 ) ) ( not ( = ?auto_13094 ?auto_13090 ) ) ( not ( = ?auto_13064 ?auto_13070 ) ) ( not ( = ?auto_13064 ?auto_13097 ) ) ( not ( = ?auto_13065 ?auto_13070 ) ) ( not ( = ?auto_13065 ?auto_13097 ) ) ( not ( = ?auto_13066 ?auto_13070 ) ) ( not ( = ?auto_13066 ?auto_13097 ) ) ( not ( = ?auto_13067 ?auto_13070 ) ) ( not ( = ?auto_13067 ?auto_13097 ) ) ( not ( = ?auto_13068 ?auto_13070 ) ) ( not ( = ?auto_13068 ?auto_13097 ) ) ( not ( = ?auto_13070 ?auto_13094 ) ) ( not ( = ?auto_13070 ?auto_13096 ) ) ( not ( = ?auto_13070 ?auto_13085 ) ) ( not ( = ?auto_13070 ?auto_13081 ) ) ( not ( = ?auto_13070 ?auto_13090 ) ) ( not ( = ?auto_13091 ?auto_13087 ) ) ( not ( = ?auto_13091 ?auto_13089 ) ) ( not ( = ?auto_13091 ?auto_13084 ) ) ( not ( = ?auto_13091 ?auto_13083 ) ) ( not ( = ?auto_13086 ?auto_13088 ) ) ( not ( = ?auto_13086 ?auto_13080 ) ) ( not ( = ?auto_13086 ?auto_13082 ) ) ( not ( = ?auto_13086 ?auto_13095 ) ) ( not ( = ?auto_13097 ?auto_13094 ) ) ( not ( = ?auto_13097 ?auto_13096 ) ) ( not ( = ?auto_13097 ?auto_13085 ) ) ( not ( = ?auto_13097 ?auto_13081 ) ) ( not ( = ?auto_13097 ?auto_13090 ) ) ( not ( = ?auto_13064 ?auto_13071 ) ) ( not ( = ?auto_13064 ?auto_13092 ) ) ( not ( = ?auto_13065 ?auto_13071 ) ) ( not ( = ?auto_13065 ?auto_13092 ) ) ( not ( = ?auto_13066 ?auto_13071 ) ) ( not ( = ?auto_13066 ?auto_13092 ) ) ( not ( = ?auto_13067 ?auto_13071 ) ) ( not ( = ?auto_13067 ?auto_13092 ) ) ( not ( = ?auto_13068 ?auto_13071 ) ) ( not ( = ?auto_13068 ?auto_13092 ) ) ( not ( = ?auto_13069 ?auto_13071 ) ) ( not ( = ?auto_13069 ?auto_13092 ) ) ( not ( = ?auto_13071 ?auto_13097 ) ) ( not ( = ?auto_13071 ?auto_13094 ) ) ( not ( = ?auto_13071 ?auto_13096 ) ) ( not ( = ?auto_13071 ?auto_13085 ) ) ( not ( = ?auto_13071 ?auto_13081 ) ) ( not ( = ?auto_13071 ?auto_13090 ) ) ( not ( = ?auto_13079 ?auto_13091 ) ) ( not ( = ?auto_13079 ?auto_13087 ) ) ( not ( = ?auto_13079 ?auto_13089 ) ) ( not ( = ?auto_13079 ?auto_13084 ) ) ( not ( = ?auto_13079 ?auto_13083 ) ) ( not ( = ?auto_13093 ?auto_13086 ) ) ( not ( = ?auto_13093 ?auto_13088 ) ) ( not ( = ?auto_13093 ?auto_13080 ) ) ( not ( = ?auto_13093 ?auto_13082 ) ) ( not ( = ?auto_13093 ?auto_13095 ) ) ( not ( = ?auto_13092 ?auto_13097 ) ) ( not ( = ?auto_13092 ?auto_13094 ) ) ( not ( = ?auto_13092 ?auto_13096 ) ) ( not ( = ?auto_13092 ?auto_13085 ) ) ( not ( = ?auto_13092 ?auto_13081 ) ) ( not ( = ?auto_13092 ?auto_13090 ) ) ( not ( = ?auto_13064 ?auto_13072 ) ) ( not ( = ?auto_13064 ?auto_13074 ) ) ( not ( = ?auto_13065 ?auto_13072 ) ) ( not ( = ?auto_13065 ?auto_13074 ) ) ( not ( = ?auto_13066 ?auto_13072 ) ) ( not ( = ?auto_13066 ?auto_13074 ) ) ( not ( = ?auto_13067 ?auto_13072 ) ) ( not ( = ?auto_13067 ?auto_13074 ) ) ( not ( = ?auto_13068 ?auto_13072 ) ) ( not ( = ?auto_13068 ?auto_13074 ) ) ( not ( = ?auto_13069 ?auto_13072 ) ) ( not ( = ?auto_13069 ?auto_13074 ) ) ( not ( = ?auto_13070 ?auto_13072 ) ) ( not ( = ?auto_13070 ?auto_13074 ) ) ( not ( = ?auto_13072 ?auto_13092 ) ) ( not ( = ?auto_13072 ?auto_13097 ) ) ( not ( = ?auto_13072 ?auto_13094 ) ) ( not ( = ?auto_13072 ?auto_13096 ) ) ( not ( = ?auto_13072 ?auto_13085 ) ) ( not ( = ?auto_13072 ?auto_13081 ) ) ( not ( = ?auto_13072 ?auto_13090 ) ) ( not ( = ?auto_13076 ?auto_13079 ) ) ( not ( = ?auto_13076 ?auto_13091 ) ) ( not ( = ?auto_13076 ?auto_13087 ) ) ( not ( = ?auto_13076 ?auto_13089 ) ) ( not ( = ?auto_13076 ?auto_13084 ) ) ( not ( = ?auto_13076 ?auto_13083 ) ) ( not ( = ?auto_13073 ?auto_13093 ) ) ( not ( = ?auto_13073 ?auto_13086 ) ) ( not ( = ?auto_13073 ?auto_13088 ) ) ( not ( = ?auto_13073 ?auto_13080 ) ) ( not ( = ?auto_13073 ?auto_13082 ) ) ( not ( = ?auto_13073 ?auto_13095 ) ) ( not ( = ?auto_13074 ?auto_13092 ) ) ( not ( = ?auto_13074 ?auto_13097 ) ) ( not ( = ?auto_13074 ?auto_13094 ) ) ( not ( = ?auto_13074 ?auto_13096 ) ) ( not ( = ?auto_13074 ?auto_13085 ) ) ( not ( = ?auto_13074 ?auto_13081 ) ) ( not ( = ?auto_13074 ?auto_13090 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_13064 ?auto_13065 ?auto_13066 ?auto_13067 ?auto_13068 ?auto_13069 ?auto_13070 ?auto_13071 )
      ( MAKE-1CRATE ?auto_13071 ?auto_13072 )
      ( MAKE-8CRATE-VERIFY ?auto_13064 ?auto_13065 ?auto_13066 ?auto_13067 ?auto_13068 ?auto_13069 ?auto_13070 ?auto_13071 ?auto_13072 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_13118 - SURFACE
      ?auto_13119 - SURFACE
      ?auto_13120 - SURFACE
      ?auto_13121 - SURFACE
      ?auto_13122 - SURFACE
      ?auto_13123 - SURFACE
      ?auto_13124 - SURFACE
      ?auto_13125 - SURFACE
      ?auto_13126 - SURFACE
      ?auto_13127 - SURFACE
    )
    :vars
    (
      ?auto_13132 - HOIST
      ?auto_13131 - PLACE
      ?auto_13130 - PLACE
      ?auto_13129 - HOIST
      ?auto_13133 - SURFACE
      ?auto_13138 - PLACE
      ?auto_13155 - HOIST
      ?auto_13144 - SURFACE
      ?auto_13145 - PLACE
      ?auto_13142 - HOIST
      ?auto_13149 - SURFACE
      ?auto_13135 - PLACE
      ?auto_13146 - HOIST
      ?auto_13147 - SURFACE
      ?auto_13150 - PLACE
      ?auto_13143 - HOIST
      ?auto_13148 - SURFACE
      ?auto_13134 - PLACE
      ?auto_13141 - HOIST
      ?auto_13151 - SURFACE
      ?auto_13137 - PLACE
      ?auto_13153 - HOIST
      ?auto_13139 - SURFACE
      ?auto_13154 - PLACE
      ?auto_13140 - HOIST
      ?auto_13152 - SURFACE
      ?auto_13136 - SURFACE
      ?auto_13128 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13132 ?auto_13131 ) ( IS-CRATE ?auto_13127 ) ( not ( = ?auto_13130 ?auto_13131 ) ) ( HOIST-AT ?auto_13129 ?auto_13130 ) ( AVAILABLE ?auto_13129 ) ( SURFACE-AT ?auto_13127 ?auto_13130 ) ( ON ?auto_13127 ?auto_13133 ) ( CLEAR ?auto_13127 ) ( not ( = ?auto_13126 ?auto_13127 ) ) ( not ( = ?auto_13126 ?auto_13133 ) ) ( not ( = ?auto_13127 ?auto_13133 ) ) ( not ( = ?auto_13132 ?auto_13129 ) ) ( IS-CRATE ?auto_13126 ) ( not ( = ?auto_13138 ?auto_13131 ) ) ( HOIST-AT ?auto_13155 ?auto_13138 ) ( AVAILABLE ?auto_13155 ) ( SURFACE-AT ?auto_13126 ?auto_13138 ) ( ON ?auto_13126 ?auto_13144 ) ( CLEAR ?auto_13126 ) ( not ( = ?auto_13125 ?auto_13126 ) ) ( not ( = ?auto_13125 ?auto_13144 ) ) ( not ( = ?auto_13126 ?auto_13144 ) ) ( not ( = ?auto_13132 ?auto_13155 ) ) ( IS-CRATE ?auto_13125 ) ( not ( = ?auto_13145 ?auto_13131 ) ) ( HOIST-AT ?auto_13142 ?auto_13145 ) ( AVAILABLE ?auto_13142 ) ( SURFACE-AT ?auto_13125 ?auto_13145 ) ( ON ?auto_13125 ?auto_13149 ) ( CLEAR ?auto_13125 ) ( not ( = ?auto_13124 ?auto_13125 ) ) ( not ( = ?auto_13124 ?auto_13149 ) ) ( not ( = ?auto_13125 ?auto_13149 ) ) ( not ( = ?auto_13132 ?auto_13142 ) ) ( IS-CRATE ?auto_13124 ) ( not ( = ?auto_13135 ?auto_13131 ) ) ( HOIST-AT ?auto_13146 ?auto_13135 ) ( AVAILABLE ?auto_13146 ) ( SURFACE-AT ?auto_13124 ?auto_13135 ) ( ON ?auto_13124 ?auto_13147 ) ( CLEAR ?auto_13124 ) ( not ( = ?auto_13123 ?auto_13124 ) ) ( not ( = ?auto_13123 ?auto_13147 ) ) ( not ( = ?auto_13124 ?auto_13147 ) ) ( not ( = ?auto_13132 ?auto_13146 ) ) ( IS-CRATE ?auto_13123 ) ( not ( = ?auto_13150 ?auto_13131 ) ) ( HOIST-AT ?auto_13143 ?auto_13150 ) ( AVAILABLE ?auto_13143 ) ( SURFACE-AT ?auto_13123 ?auto_13150 ) ( ON ?auto_13123 ?auto_13148 ) ( CLEAR ?auto_13123 ) ( not ( = ?auto_13122 ?auto_13123 ) ) ( not ( = ?auto_13122 ?auto_13148 ) ) ( not ( = ?auto_13123 ?auto_13148 ) ) ( not ( = ?auto_13132 ?auto_13143 ) ) ( IS-CRATE ?auto_13122 ) ( not ( = ?auto_13134 ?auto_13131 ) ) ( HOIST-AT ?auto_13141 ?auto_13134 ) ( SURFACE-AT ?auto_13122 ?auto_13134 ) ( ON ?auto_13122 ?auto_13151 ) ( CLEAR ?auto_13122 ) ( not ( = ?auto_13121 ?auto_13122 ) ) ( not ( = ?auto_13121 ?auto_13151 ) ) ( not ( = ?auto_13122 ?auto_13151 ) ) ( not ( = ?auto_13132 ?auto_13141 ) ) ( IS-CRATE ?auto_13121 ) ( not ( = ?auto_13137 ?auto_13131 ) ) ( HOIST-AT ?auto_13153 ?auto_13137 ) ( AVAILABLE ?auto_13153 ) ( SURFACE-AT ?auto_13121 ?auto_13137 ) ( ON ?auto_13121 ?auto_13139 ) ( CLEAR ?auto_13121 ) ( not ( = ?auto_13120 ?auto_13121 ) ) ( not ( = ?auto_13120 ?auto_13139 ) ) ( not ( = ?auto_13121 ?auto_13139 ) ) ( not ( = ?auto_13132 ?auto_13153 ) ) ( IS-CRATE ?auto_13120 ) ( not ( = ?auto_13154 ?auto_13131 ) ) ( HOIST-AT ?auto_13140 ?auto_13154 ) ( AVAILABLE ?auto_13140 ) ( SURFACE-AT ?auto_13120 ?auto_13154 ) ( ON ?auto_13120 ?auto_13152 ) ( CLEAR ?auto_13120 ) ( not ( = ?auto_13119 ?auto_13120 ) ) ( not ( = ?auto_13119 ?auto_13152 ) ) ( not ( = ?auto_13120 ?auto_13152 ) ) ( not ( = ?auto_13132 ?auto_13140 ) ) ( SURFACE-AT ?auto_13118 ?auto_13131 ) ( CLEAR ?auto_13118 ) ( IS-CRATE ?auto_13119 ) ( AVAILABLE ?auto_13132 ) ( AVAILABLE ?auto_13141 ) ( SURFACE-AT ?auto_13119 ?auto_13134 ) ( ON ?auto_13119 ?auto_13136 ) ( CLEAR ?auto_13119 ) ( TRUCK-AT ?auto_13128 ?auto_13131 ) ( not ( = ?auto_13118 ?auto_13119 ) ) ( not ( = ?auto_13118 ?auto_13136 ) ) ( not ( = ?auto_13119 ?auto_13136 ) ) ( not ( = ?auto_13118 ?auto_13120 ) ) ( not ( = ?auto_13118 ?auto_13152 ) ) ( not ( = ?auto_13120 ?auto_13136 ) ) ( not ( = ?auto_13154 ?auto_13134 ) ) ( not ( = ?auto_13140 ?auto_13141 ) ) ( not ( = ?auto_13152 ?auto_13136 ) ) ( not ( = ?auto_13118 ?auto_13121 ) ) ( not ( = ?auto_13118 ?auto_13139 ) ) ( not ( = ?auto_13119 ?auto_13121 ) ) ( not ( = ?auto_13119 ?auto_13139 ) ) ( not ( = ?auto_13121 ?auto_13152 ) ) ( not ( = ?auto_13121 ?auto_13136 ) ) ( not ( = ?auto_13137 ?auto_13154 ) ) ( not ( = ?auto_13137 ?auto_13134 ) ) ( not ( = ?auto_13153 ?auto_13140 ) ) ( not ( = ?auto_13153 ?auto_13141 ) ) ( not ( = ?auto_13139 ?auto_13152 ) ) ( not ( = ?auto_13139 ?auto_13136 ) ) ( not ( = ?auto_13118 ?auto_13122 ) ) ( not ( = ?auto_13118 ?auto_13151 ) ) ( not ( = ?auto_13119 ?auto_13122 ) ) ( not ( = ?auto_13119 ?auto_13151 ) ) ( not ( = ?auto_13120 ?auto_13122 ) ) ( not ( = ?auto_13120 ?auto_13151 ) ) ( not ( = ?auto_13122 ?auto_13139 ) ) ( not ( = ?auto_13122 ?auto_13152 ) ) ( not ( = ?auto_13122 ?auto_13136 ) ) ( not ( = ?auto_13151 ?auto_13139 ) ) ( not ( = ?auto_13151 ?auto_13152 ) ) ( not ( = ?auto_13151 ?auto_13136 ) ) ( not ( = ?auto_13118 ?auto_13123 ) ) ( not ( = ?auto_13118 ?auto_13148 ) ) ( not ( = ?auto_13119 ?auto_13123 ) ) ( not ( = ?auto_13119 ?auto_13148 ) ) ( not ( = ?auto_13120 ?auto_13123 ) ) ( not ( = ?auto_13120 ?auto_13148 ) ) ( not ( = ?auto_13121 ?auto_13123 ) ) ( not ( = ?auto_13121 ?auto_13148 ) ) ( not ( = ?auto_13123 ?auto_13151 ) ) ( not ( = ?auto_13123 ?auto_13139 ) ) ( not ( = ?auto_13123 ?auto_13152 ) ) ( not ( = ?auto_13123 ?auto_13136 ) ) ( not ( = ?auto_13150 ?auto_13134 ) ) ( not ( = ?auto_13150 ?auto_13137 ) ) ( not ( = ?auto_13150 ?auto_13154 ) ) ( not ( = ?auto_13143 ?auto_13141 ) ) ( not ( = ?auto_13143 ?auto_13153 ) ) ( not ( = ?auto_13143 ?auto_13140 ) ) ( not ( = ?auto_13148 ?auto_13151 ) ) ( not ( = ?auto_13148 ?auto_13139 ) ) ( not ( = ?auto_13148 ?auto_13152 ) ) ( not ( = ?auto_13148 ?auto_13136 ) ) ( not ( = ?auto_13118 ?auto_13124 ) ) ( not ( = ?auto_13118 ?auto_13147 ) ) ( not ( = ?auto_13119 ?auto_13124 ) ) ( not ( = ?auto_13119 ?auto_13147 ) ) ( not ( = ?auto_13120 ?auto_13124 ) ) ( not ( = ?auto_13120 ?auto_13147 ) ) ( not ( = ?auto_13121 ?auto_13124 ) ) ( not ( = ?auto_13121 ?auto_13147 ) ) ( not ( = ?auto_13122 ?auto_13124 ) ) ( not ( = ?auto_13122 ?auto_13147 ) ) ( not ( = ?auto_13124 ?auto_13148 ) ) ( not ( = ?auto_13124 ?auto_13151 ) ) ( not ( = ?auto_13124 ?auto_13139 ) ) ( not ( = ?auto_13124 ?auto_13152 ) ) ( not ( = ?auto_13124 ?auto_13136 ) ) ( not ( = ?auto_13135 ?auto_13150 ) ) ( not ( = ?auto_13135 ?auto_13134 ) ) ( not ( = ?auto_13135 ?auto_13137 ) ) ( not ( = ?auto_13135 ?auto_13154 ) ) ( not ( = ?auto_13146 ?auto_13143 ) ) ( not ( = ?auto_13146 ?auto_13141 ) ) ( not ( = ?auto_13146 ?auto_13153 ) ) ( not ( = ?auto_13146 ?auto_13140 ) ) ( not ( = ?auto_13147 ?auto_13148 ) ) ( not ( = ?auto_13147 ?auto_13151 ) ) ( not ( = ?auto_13147 ?auto_13139 ) ) ( not ( = ?auto_13147 ?auto_13152 ) ) ( not ( = ?auto_13147 ?auto_13136 ) ) ( not ( = ?auto_13118 ?auto_13125 ) ) ( not ( = ?auto_13118 ?auto_13149 ) ) ( not ( = ?auto_13119 ?auto_13125 ) ) ( not ( = ?auto_13119 ?auto_13149 ) ) ( not ( = ?auto_13120 ?auto_13125 ) ) ( not ( = ?auto_13120 ?auto_13149 ) ) ( not ( = ?auto_13121 ?auto_13125 ) ) ( not ( = ?auto_13121 ?auto_13149 ) ) ( not ( = ?auto_13122 ?auto_13125 ) ) ( not ( = ?auto_13122 ?auto_13149 ) ) ( not ( = ?auto_13123 ?auto_13125 ) ) ( not ( = ?auto_13123 ?auto_13149 ) ) ( not ( = ?auto_13125 ?auto_13147 ) ) ( not ( = ?auto_13125 ?auto_13148 ) ) ( not ( = ?auto_13125 ?auto_13151 ) ) ( not ( = ?auto_13125 ?auto_13139 ) ) ( not ( = ?auto_13125 ?auto_13152 ) ) ( not ( = ?auto_13125 ?auto_13136 ) ) ( not ( = ?auto_13145 ?auto_13135 ) ) ( not ( = ?auto_13145 ?auto_13150 ) ) ( not ( = ?auto_13145 ?auto_13134 ) ) ( not ( = ?auto_13145 ?auto_13137 ) ) ( not ( = ?auto_13145 ?auto_13154 ) ) ( not ( = ?auto_13142 ?auto_13146 ) ) ( not ( = ?auto_13142 ?auto_13143 ) ) ( not ( = ?auto_13142 ?auto_13141 ) ) ( not ( = ?auto_13142 ?auto_13153 ) ) ( not ( = ?auto_13142 ?auto_13140 ) ) ( not ( = ?auto_13149 ?auto_13147 ) ) ( not ( = ?auto_13149 ?auto_13148 ) ) ( not ( = ?auto_13149 ?auto_13151 ) ) ( not ( = ?auto_13149 ?auto_13139 ) ) ( not ( = ?auto_13149 ?auto_13152 ) ) ( not ( = ?auto_13149 ?auto_13136 ) ) ( not ( = ?auto_13118 ?auto_13126 ) ) ( not ( = ?auto_13118 ?auto_13144 ) ) ( not ( = ?auto_13119 ?auto_13126 ) ) ( not ( = ?auto_13119 ?auto_13144 ) ) ( not ( = ?auto_13120 ?auto_13126 ) ) ( not ( = ?auto_13120 ?auto_13144 ) ) ( not ( = ?auto_13121 ?auto_13126 ) ) ( not ( = ?auto_13121 ?auto_13144 ) ) ( not ( = ?auto_13122 ?auto_13126 ) ) ( not ( = ?auto_13122 ?auto_13144 ) ) ( not ( = ?auto_13123 ?auto_13126 ) ) ( not ( = ?auto_13123 ?auto_13144 ) ) ( not ( = ?auto_13124 ?auto_13126 ) ) ( not ( = ?auto_13124 ?auto_13144 ) ) ( not ( = ?auto_13126 ?auto_13149 ) ) ( not ( = ?auto_13126 ?auto_13147 ) ) ( not ( = ?auto_13126 ?auto_13148 ) ) ( not ( = ?auto_13126 ?auto_13151 ) ) ( not ( = ?auto_13126 ?auto_13139 ) ) ( not ( = ?auto_13126 ?auto_13152 ) ) ( not ( = ?auto_13126 ?auto_13136 ) ) ( not ( = ?auto_13138 ?auto_13145 ) ) ( not ( = ?auto_13138 ?auto_13135 ) ) ( not ( = ?auto_13138 ?auto_13150 ) ) ( not ( = ?auto_13138 ?auto_13134 ) ) ( not ( = ?auto_13138 ?auto_13137 ) ) ( not ( = ?auto_13138 ?auto_13154 ) ) ( not ( = ?auto_13155 ?auto_13142 ) ) ( not ( = ?auto_13155 ?auto_13146 ) ) ( not ( = ?auto_13155 ?auto_13143 ) ) ( not ( = ?auto_13155 ?auto_13141 ) ) ( not ( = ?auto_13155 ?auto_13153 ) ) ( not ( = ?auto_13155 ?auto_13140 ) ) ( not ( = ?auto_13144 ?auto_13149 ) ) ( not ( = ?auto_13144 ?auto_13147 ) ) ( not ( = ?auto_13144 ?auto_13148 ) ) ( not ( = ?auto_13144 ?auto_13151 ) ) ( not ( = ?auto_13144 ?auto_13139 ) ) ( not ( = ?auto_13144 ?auto_13152 ) ) ( not ( = ?auto_13144 ?auto_13136 ) ) ( not ( = ?auto_13118 ?auto_13127 ) ) ( not ( = ?auto_13118 ?auto_13133 ) ) ( not ( = ?auto_13119 ?auto_13127 ) ) ( not ( = ?auto_13119 ?auto_13133 ) ) ( not ( = ?auto_13120 ?auto_13127 ) ) ( not ( = ?auto_13120 ?auto_13133 ) ) ( not ( = ?auto_13121 ?auto_13127 ) ) ( not ( = ?auto_13121 ?auto_13133 ) ) ( not ( = ?auto_13122 ?auto_13127 ) ) ( not ( = ?auto_13122 ?auto_13133 ) ) ( not ( = ?auto_13123 ?auto_13127 ) ) ( not ( = ?auto_13123 ?auto_13133 ) ) ( not ( = ?auto_13124 ?auto_13127 ) ) ( not ( = ?auto_13124 ?auto_13133 ) ) ( not ( = ?auto_13125 ?auto_13127 ) ) ( not ( = ?auto_13125 ?auto_13133 ) ) ( not ( = ?auto_13127 ?auto_13144 ) ) ( not ( = ?auto_13127 ?auto_13149 ) ) ( not ( = ?auto_13127 ?auto_13147 ) ) ( not ( = ?auto_13127 ?auto_13148 ) ) ( not ( = ?auto_13127 ?auto_13151 ) ) ( not ( = ?auto_13127 ?auto_13139 ) ) ( not ( = ?auto_13127 ?auto_13152 ) ) ( not ( = ?auto_13127 ?auto_13136 ) ) ( not ( = ?auto_13130 ?auto_13138 ) ) ( not ( = ?auto_13130 ?auto_13145 ) ) ( not ( = ?auto_13130 ?auto_13135 ) ) ( not ( = ?auto_13130 ?auto_13150 ) ) ( not ( = ?auto_13130 ?auto_13134 ) ) ( not ( = ?auto_13130 ?auto_13137 ) ) ( not ( = ?auto_13130 ?auto_13154 ) ) ( not ( = ?auto_13129 ?auto_13155 ) ) ( not ( = ?auto_13129 ?auto_13142 ) ) ( not ( = ?auto_13129 ?auto_13146 ) ) ( not ( = ?auto_13129 ?auto_13143 ) ) ( not ( = ?auto_13129 ?auto_13141 ) ) ( not ( = ?auto_13129 ?auto_13153 ) ) ( not ( = ?auto_13129 ?auto_13140 ) ) ( not ( = ?auto_13133 ?auto_13144 ) ) ( not ( = ?auto_13133 ?auto_13149 ) ) ( not ( = ?auto_13133 ?auto_13147 ) ) ( not ( = ?auto_13133 ?auto_13148 ) ) ( not ( = ?auto_13133 ?auto_13151 ) ) ( not ( = ?auto_13133 ?auto_13139 ) ) ( not ( = ?auto_13133 ?auto_13152 ) ) ( not ( = ?auto_13133 ?auto_13136 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_13118 ?auto_13119 ?auto_13120 ?auto_13121 ?auto_13122 ?auto_13123 ?auto_13124 ?auto_13125 ?auto_13126 )
      ( MAKE-1CRATE ?auto_13126 ?auto_13127 )
      ( MAKE-9CRATE-VERIFY ?auto_13118 ?auto_13119 ?auto_13120 ?auto_13121 ?auto_13122 ?auto_13123 ?auto_13124 ?auto_13125 ?auto_13126 ?auto_13127 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_13177 - SURFACE
      ?auto_13178 - SURFACE
      ?auto_13179 - SURFACE
      ?auto_13180 - SURFACE
      ?auto_13181 - SURFACE
      ?auto_13182 - SURFACE
      ?auto_13183 - SURFACE
      ?auto_13184 - SURFACE
      ?auto_13185 - SURFACE
      ?auto_13186 - SURFACE
      ?auto_13187 - SURFACE
    )
    :vars
    (
      ?auto_13192 - HOIST
      ?auto_13189 - PLACE
      ?auto_13190 - PLACE
      ?auto_13191 - HOIST
      ?auto_13193 - SURFACE
      ?auto_13209 - PLACE
      ?auto_13212 - HOIST
      ?auto_13194 - SURFACE
      ?auto_13205 - PLACE
      ?auto_13210 - HOIST
      ?auto_13214 - SURFACE
      ?auto_13195 - PLACE
      ?auto_13217 - HOIST
      ?auto_13198 - SURFACE
      ?auto_13206 - PLACE
      ?auto_13204 - HOIST
      ?auto_13216 - SURFACE
      ?auto_13215 - PLACE
      ?auto_13196 - HOIST
      ?auto_13213 - SURFACE
      ?auto_13207 - PLACE
      ?auto_13208 - HOIST
      ?auto_13199 - SURFACE
      ?auto_13200 - PLACE
      ?auto_13201 - HOIST
      ?auto_13197 - SURFACE
      ?auto_13202 - PLACE
      ?auto_13218 - HOIST
      ?auto_13203 - SURFACE
      ?auto_13211 - SURFACE
      ?auto_13188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13192 ?auto_13189 ) ( IS-CRATE ?auto_13187 ) ( not ( = ?auto_13190 ?auto_13189 ) ) ( HOIST-AT ?auto_13191 ?auto_13190 ) ( AVAILABLE ?auto_13191 ) ( SURFACE-AT ?auto_13187 ?auto_13190 ) ( ON ?auto_13187 ?auto_13193 ) ( CLEAR ?auto_13187 ) ( not ( = ?auto_13186 ?auto_13187 ) ) ( not ( = ?auto_13186 ?auto_13193 ) ) ( not ( = ?auto_13187 ?auto_13193 ) ) ( not ( = ?auto_13192 ?auto_13191 ) ) ( IS-CRATE ?auto_13186 ) ( not ( = ?auto_13209 ?auto_13189 ) ) ( HOIST-AT ?auto_13212 ?auto_13209 ) ( AVAILABLE ?auto_13212 ) ( SURFACE-AT ?auto_13186 ?auto_13209 ) ( ON ?auto_13186 ?auto_13194 ) ( CLEAR ?auto_13186 ) ( not ( = ?auto_13185 ?auto_13186 ) ) ( not ( = ?auto_13185 ?auto_13194 ) ) ( not ( = ?auto_13186 ?auto_13194 ) ) ( not ( = ?auto_13192 ?auto_13212 ) ) ( IS-CRATE ?auto_13185 ) ( not ( = ?auto_13205 ?auto_13189 ) ) ( HOIST-AT ?auto_13210 ?auto_13205 ) ( AVAILABLE ?auto_13210 ) ( SURFACE-AT ?auto_13185 ?auto_13205 ) ( ON ?auto_13185 ?auto_13214 ) ( CLEAR ?auto_13185 ) ( not ( = ?auto_13184 ?auto_13185 ) ) ( not ( = ?auto_13184 ?auto_13214 ) ) ( not ( = ?auto_13185 ?auto_13214 ) ) ( not ( = ?auto_13192 ?auto_13210 ) ) ( IS-CRATE ?auto_13184 ) ( not ( = ?auto_13195 ?auto_13189 ) ) ( HOIST-AT ?auto_13217 ?auto_13195 ) ( AVAILABLE ?auto_13217 ) ( SURFACE-AT ?auto_13184 ?auto_13195 ) ( ON ?auto_13184 ?auto_13198 ) ( CLEAR ?auto_13184 ) ( not ( = ?auto_13183 ?auto_13184 ) ) ( not ( = ?auto_13183 ?auto_13198 ) ) ( not ( = ?auto_13184 ?auto_13198 ) ) ( not ( = ?auto_13192 ?auto_13217 ) ) ( IS-CRATE ?auto_13183 ) ( not ( = ?auto_13206 ?auto_13189 ) ) ( HOIST-AT ?auto_13204 ?auto_13206 ) ( AVAILABLE ?auto_13204 ) ( SURFACE-AT ?auto_13183 ?auto_13206 ) ( ON ?auto_13183 ?auto_13216 ) ( CLEAR ?auto_13183 ) ( not ( = ?auto_13182 ?auto_13183 ) ) ( not ( = ?auto_13182 ?auto_13216 ) ) ( not ( = ?auto_13183 ?auto_13216 ) ) ( not ( = ?auto_13192 ?auto_13204 ) ) ( IS-CRATE ?auto_13182 ) ( not ( = ?auto_13215 ?auto_13189 ) ) ( HOIST-AT ?auto_13196 ?auto_13215 ) ( AVAILABLE ?auto_13196 ) ( SURFACE-AT ?auto_13182 ?auto_13215 ) ( ON ?auto_13182 ?auto_13213 ) ( CLEAR ?auto_13182 ) ( not ( = ?auto_13181 ?auto_13182 ) ) ( not ( = ?auto_13181 ?auto_13213 ) ) ( not ( = ?auto_13182 ?auto_13213 ) ) ( not ( = ?auto_13192 ?auto_13196 ) ) ( IS-CRATE ?auto_13181 ) ( not ( = ?auto_13207 ?auto_13189 ) ) ( HOIST-AT ?auto_13208 ?auto_13207 ) ( SURFACE-AT ?auto_13181 ?auto_13207 ) ( ON ?auto_13181 ?auto_13199 ) ( CLEAR ?auto_13181 ) ( not ( = ?auto_13180 ?auto_13181 ) ) ( not ( = ?auto_13180 ?auto_13199 ) ) ( not ( = ?auto_13181 ?auto_13199 ) ) ( not ( = ?auto_13192 ?auto_13208 ) ) ( IS-CRATE ?auto_13180 ) ( not ( = ?auto_13200 ?auto_13189 ) ) ( HOIST-AT ?auto_13201 ?auto_13200 ) ( AVAILABLE ?auto_13201 ) ( SURFACE-AT ?auto_13180 ?auto_13200 ) ( ON ?auto_13180 ?auto_13197 ) ( CLEAR ?auto_13180 ) ( not ( = ?auto_13179 ?auto_13180 ) ) ( not ( = ?auto_13179 ?auto_13197 ) ) ( not ( = ?auto_13180 ?auto_13197 ) ) ( not ( = ?auto_13192 ?auto_13201 ) ) ( IS-CRATE ?auto_13179 ) ( not ( = ?auto_13202 ?auto_13189 ) ) ( HOIST-AT ?auto_13218 ?auto_13202 ) ( AVAILABLE ?auto_13218 ) ( SURFACE-AT ?auto_13179 ?auto_13202 ) ( ON ?auto_13179 ?auto_13203 ) ( CLEAR ?auto_13179 ) ( not ( = ?auto_13178 ?auto_13179 ) ) ( not ( = ?auto_13178 ?auto_13203 ) ) ( not ( = ?auto_13179 ?auto_13203 ) ) ( not ( = ?auto_13192 ?auto_13218 ) ) ( SURFACE-AT ?auto_13177 ?auto_13189 ) ( CLEAR ?auto_13177 ) ( IS-CRATE ?auto_13178 ) ( AVAILABLE ?auto_13192 ) ( AVAILABLE ?auto_13208 ) ( SURFACE-AT ?auto_13178 ?auto_13207 ) ( ON ?auto_13178 ?auto_13211 ) ( CLEAR ?auto_13178 ) ( TRUCK-AT ?auto_13188 ?auto_13189 ) ( not ( = ?auto_13177 ?auto_13178 ) ) ( not ( = ?auto_13177 ?auto_13211 ) ) ( not ( = ?auto_13178 ?auto_13211 ) ) ( not ( = ?auto_13177 ?auto_13179 ) ) ( not ( = ?auto_13177 ?auto_13203 ) ) ( not ( = ?auto_13179 ?auto_13211 ) ) ( not ( = ?auto_13202 ?auto_13207 ) ) ( not ( = ?auto_13218 ?auto_13208 ) ) ( not ( = ?auto_13203 ?auto_13211 ) ) ( not ( = ?auto_13177 ?auto_13180 ) ) ( not ( = ?auto_13177 ?auto_13197 ) ) ( not ( = ?auto_13178 ?auto_13180 ) ) ( not ( = ?auto_13178 ?auto_13197 ) ) ( not ( = ?auto_13180 ?auto_13203 ) ) ( not ( = ?auto_13180 ?auto_13211 ) ) ( not ( = ?auto_13200 ?auto_13202 ) ) ( not ( = ?auto_13200 ?auto_13207 ) ) ( not ( = ?auto_13201 ?auto_13218 ) ) ( not ( = ?auto_13201 ?auto_13208 ) ) ( not ( = ?auto_13197 ?auto_13203 ) ) ( not ( = ?auto_13197 ?auto_13211 ) ) ( not ( = ?auto_13177 ?auto_13181 ) ) ( not ( = ?auto_13177 ?auto_13199 ) ) ( not ( = ?auto_13178 ?auto_13181 ) ) ( not ( = ?auto_13178 ?auto_13199 ) ) ( not ( = ?auto_13179 ?auto_13181 ) ) ( not ( = ?auto_13179 ?auto_13199 ) ) ( not ( = ?auto_13181 ?auto_13197 ) ) ( not ( = ?auto_13181 ?auto_13203 ) ) ( not ( = ?auto_13181 ?auto_13211 ) ) ( not ( = ?auto_13199 ?auto_13197 ) ) ( not ( = ?auto_13199 ?auto_13203 ) ) ( not ( = ?auto_13199 ?auto_13211 ) ) ( not ( = ?auto_13177 ?auto_13182 ) ) ( not ( = ?auto_13177 ?auto_13213 ) ) ( not ( = ?auto_13178 ?auto_13182 ) ) ( not ( = ?auto_13178 ?auto_13213 ) ) ( not ( = ?auto_13179 ?auto_13182 ) ) ( not ( = ?auto_13179 ?auto_13213 ) ) ( not ( = ?auto_13180 ?auto_13182 ) ) ( not ( = ?auto_13180 ?auto_13213 ) ) ( not ( = ?auto_13182 ?auto_13199 ) ) ( not ( = ?auto_13182 ?auto_13197 ) ) ( not ( = ?auto_13182 ?auto_13203 ) ) ( not ( = ?auto_13182 ?auto_13211 ) ) ( not ( = ?auto_13215 ?auto_13207 ) ) ( not ( = ?auto_13215 ?auto_13200 ) ) ( not ( = ?auto_13215 ?auto_13202 ) ) ( not ( = ?auto_13196 ?auto_13208 ) ) ( not ( = ?auto_13196 ?auto_13201 ) ) ( not ( = ?auto_13196 ?auto_13218 ) ) ( not ( = ?auto_13213 ?auto_13199 ) ) ( not ( = ?auto_13213 ?auto_13197 ) ) ( not ( = ?auto_13213 ?auto_13203 ) ) ( not ( = ?auto_13213 ?auto_13211 ) ) ( not ( = ?auto_13177 ?auto_13183 ) ) ( not ( = ?auto_13177 ?auto_13216 ) ) ( not ( = ?auto_13178 ?auto_13183 ) ) ( not ( = ?auto_13178 ?auto_13216 ) ) ( not ( = ?auto_13179 ?auto_13183 ) ) ( not ( = ?auto_13179 ?auto_13216 ) ) ( not ( = ?auto_13180 ?auto_13183 ) ) ( not ( = ?auto_13180 ?auto_13216 ) ) ( not ( = ?auto_13181 ?auto_13183 ) ) ( not ( = ?auto_13181 ?auto_13216 ) ) ( not ( = ?auto_13183 ?auto_13213 ) ) ( not ( = ?auto_13183 ?auto_13199 ) ) ( not ( = ?auto_13183 ?auto_13197 ) ) ( not ( = ?auto_13183 ?auto_13203 ) ) ( not ( = ?auto_13183 ?auto_13211 ) ) ( not ( = ?auto_13206 ?auto_13215 ) ) ( not ( = ?auto_13206 ?auto_13207 ) ) ( not ( = ?auto_13206 ?auto_13200 ) ) ( not ( = ?auto_13206 ?auto_13202 ) ) ( not ( = ?auto_13204 ?auto_13196 ) ) ( not ( = ?auto_13204 ?auto_13208 ) ) ( not ( = ?auto_13204 ?auto_13201 ) ) ( not ( = ?auto_13204 ?auto_13218 ) ) ( not ( = ?auto_13216 ?auto_13213 ) ) ( not ( = ?auto_13216 ?auto_13199 ) ) ( not ( = ?auto_13216 ?auto_13197 ) ) ( not ( = ?auto_13216 ?auto_13203 ) ) ( not ( = ?auto_13216 ?auto_13211 ) ) ( not ( = ?auto_13177 ?auto_13184 ) ) ( not ( = ?auto_13177 ?auto_13198 ) ) ( not ( = ?auto_13178 ?auto_13184 ) ) ( not ( = ?auto_13178 ?auto_13198 ) ) ( not ( = ?auto_13179 ?auto_13184 ) ) ( not ( = ?auto_13179 ?auto_13198 ) ) ( not ( = ?auto_13180 ?auto_13184 ) ) ( not ( = ?auto_13180 ?auto_13198 ) ) ( not ( = ?auto_13181 ?auto_13184 ) ) ( not ( = ?auto_13181 ?auto_13198 ) ) ( not ( = ?auto_13182 ?auto_13184 ) ) ( not ( = ?auto_13182 ?auto_13198 ) ) ( not ( = ?auto_13184 ?auto_13216 ) ) ( not ( = ?auto_13184 ?auto_13213 ) ) ( not ( = ?auto_13184 ?auto_13199 ) ) ( not ( = ?auto_13184 ?auto_13197 ) ) ( not ( = ?auto_13184 ?auto_13203 ) ) ( not ( = ?auto_13184 ?auto_13211 ) ) ( not ( = ?auto_13195 ?auto_13206 ) ) ( not ( = ?auto_13195 ?auto_13215 ) ) ( not ( = ?auto_13195 ?auto_13207 ) ) ( not ( = ?auto_13195 ?auto_13200 ) ) ( not ( = ?auto_13195 ?auto_13202 ) ) ( not ( = ?auto_13217 ?auto_13204 ) ) ( not ( = ?auto_13217 ?auto_13196 ) ) ( not ( = ?auto_13217 ?auto_13208 ) ) ( not ( = ?auto_13217 ?auto_13201 ) ) ( not ( = ?auto_13217 ?auto_13218 ) ) ( not ( = ?auto_13198 ?auto_13216 ) ) ( not ( = ?auto_13198 ?auto_13213 ) ) ( not ( = ?auto_13198 ?auto_13199 ) ) ( not ( = ?auto_13198 ?auto_13197 ) ) ( not ( = ?auto_13198 ?auto_13203 ) ) ( not ( = ?auto_13198 ?auto_13211 ) ) ( not ( = ?auto_13177 ?auto_13185 ) ) ( not ( = ?auto_13177 ?auto_13214 ) ) ( not ( = ?auto_13178 ?auto_13185 ) ) ( not ( = ?auto_13178 ?auto_13214 ) ) ( not ( = ?auto_13179 ?auto_13185 ) ) ( not ( = ?auto_13179 ?auto_13214 ) ) ( not ( = ?auto_13180 ?auto_13185 ) ) ( not ( = ?auto_13180 ?auto_13214 ) ) ( not ( = ?auto_13181 ?auto_13185 ) ) ( not ( = ?auto_13181 ?auto_13214 ) ) ( not ( = ?auto_13182 ?auto_13185 ) ) ( not ( = ?auto_13182 ?auto_13214 ) ) ( not ( = ?auto_13183 ?auto_13185 ) ) ( not ( = ?auto_13183 ?auto_13214 ) ) ( not ( = ?auto_13185 ?auto_13198 ) ) ( not ( = ?auto_13185 ?auto_13216 ) ) ( not ( = ?auto_13185 ?auto_13213 ) ) ( not ( = ?auto_13185 ?auto_13199 ) ) ( not ( = ?auto_13185 ?auto_13197 ) ) ( not ( = ?auto_13185 ?auto_13203 ) ) ( not ( = ?auto_13185 ?auto_13211 ) ) ( not ( = ?auto_13205 ?auto_13195 ) ) ( not ( = ?auto_13205 ?auto_13206 ) ) ( not ( = ?auto_13205 ?auto_13215 ) ) ( not ( = ?auto_13205 ?auto_13207 ) ) ( not ( = ?auto_13205 ?auto_13200 ) ) ( not ( = ?auto_13205 ?auto_13202 ) ) ( not ( = ?auto_13210 ?auto_13217 ) ) ( not ( = ?auto_13210 ?auto_13204 ) ) ( not ( = ?auto_13210 ?auto_13196 ) ) ( not ( = ?auto_13210 ?auto_13208 ) ) ( not ( = ?auto_13210 ?auto_13201 ) ) ( not ( = ?auto_13210 ?auto_13218 ) ) ( not ( = ?auto_13214 ?auto_13198 ) ) ( not ( = ?auto_13214 ?auto_13216 ) ) ( not ( = ?auto_13214 ?auto_13213 ) ) ( not ( = ?auto_13214 ?auto_13199 ) ) ( not ( = ?auto_13214 ?auto_13197 ) ) ( not ( = ?auto_13214 ?auto_13203 ) ) ( not ( = ?auto_13214 ?auto_13211 ) ) ( not ( = ?auto_13177 ?auto_13186 ) ) ( not ( = ?auto_13177 ?auto_13194 ) ) ( not ( = ?auto_13178 ?auto_13186 ) ) ( not ( = ?auto_13178 ?auto_13194 ) ) ( not ( = ?auto_13179 ?auto_13186 ) ) ( not ( = ?auto_13179 ?auto_13194 ) ) ( not ( = ?auto_13180 ?auto_13186 ) ) ( not ( = ?auto_13180 ?auto_13194 ) ) ( not ( = ?auto_13181 ?auto_13186 ) ) ( not ( = ?auto_13181 ?auto_13194 ) ) ( not ( = ?auto_13182 ?auto_13186 ) ) ( not ( = ?auto_13182 ?auto_13194 ) ) ( not ( = ?auto_13183 ?auto_13186 ) ) ( not ( = ?auto_13183 ?auto_13194 ) ) ( not ( = ?auto_13184 ?auto_13186 ) ) ( not ( = ?auto_13184 ?auto_13194 ) ) ( not ( = ?auto_13186 ?auto_13214 ) ) ( not ( = ?auto_13186 ?auto_13198 ) ) ( not ( = ?auto_13186 ?auto_13216 ) ) ( not ( = ?auto_13186 ?auto_13213 ) ) ( not ( = ?auto_13186 ?auto_13199 ) ) ( not ( = ?auto_13186 ?auto_13197 ) ) ( not ( = ?auto_13186 ?auto_13203 ) ) ( not ( = ?auto_13186 ?auto_13211 ) ) ( not ( = ?auto_13209 ?auto_13205 ) ) ( not ( = ?auto_13209 ?auto_13195 ) ) ( not ( = ?auto_13209 ?auto_13206 ) ) ( not ( = ?auto_13209 ?auto_13215 ) ) ( not ( = ?auto_13209 ?auto_13207 ) ) ( not ( = ?auto_13209 ?auto_13200 ) ) ( not ( = ?auto_13209 ?auto_13202 ) ) ( not ( = ?auto_13212 ?auto_13210 ) ) ( not ( = ?auto_13212 ?auto_13217 ) ) ( not ( = ?auto_13212 ?auto_13204 ) ) ( not ( = ?auto_13212 ?auto_13196 ) ) ( not ( = ?auto_13212 ?auto_13208 ) ) ( not ( = ?auto_13212 ?auto_13201 ) ) ( not ( = ?auto_13212 ?auto_13218 ) ) ( not ( = ?auto_13194 ?auto_13214 ) ) ( not ( = ?auto_13194 ?auto_13198 ) ) ( not ( = ?auto_13194 ?auto_13216 ) ) ( not ( = ?auto_13194 ?auto_13213 ) ) ( not ( = ?auto_13194 ?auto_13199 ) ) ( not ( = ?auto_13194 ?auto_13197 ) ) ( not ( = ?auto_13194 ?auto_13203 ) ) ( not ( = ?auto_13194 ?auto_13211 ) ) ( not ( = ?auto_13177 ?auto_13187 ) ) ( not ( = ?auto_13177 ?auto_13193 ) ) ( not ( = ?auto_13178 ?auto_13187 ) ) ( not ( = ?auto_13178 ?auto_13193 ) ) ( not ( = ?auto_13179 ?auto_13187 ) ) ( not ( = ?auto_13179 ?auto_13193 ) ) ( not ( = ?auto_13180 ?auto_13187 ) ) ( not ( = ?auto_13180 ?auto_13193 ) ) ( not ( = ?auto_13181 ?auto_13187 ) ) ( not ( = ?auto_13181 ?auto_13193 ) ) ( not ( = ?auto_13182 ?auto_13187 ) ) ( not ( = ?auto_13182 ?auto_13193 ) ) ( not ( = ?auto_13183 ?auto_13187 ) ) ( not ( = ?auto_13183 ?auto_13193 ) ) ( not ( = ?auto_13184 ?auto_13187 ) ) ( not ( = ?auto_13184 ?auto_13193 ) ) ( not ( = ?auto_13185 ?auto_13187 ) ) ( not ( = ?auto_13185 ?auto_13193 ) ) ( not ( = ?auto_13187 ?auto_13194 ) ) ( not ( = ?auto_13187 ?auto_13214 ) ) ( not ( = ?auto_13187 ?auto_13198 ) ) ( not ( = ?auto_13187 ?auto_13216 ) ) ( not ( = ?auto_13187 ?auto_13213 ) ) ( not ( = ?auto_13187 ?auto_13199 ) ) ( not ( = ?auto_13187 ?auto_13197 ) ) ( not ( = ?auto_13187 ?auto_13203 ) ) ( not ( = ?auto_13187 ?auto_13211 ) ) ( not ( = ?auto_13190 ?auto_13209 ) ) ( not ( = ?auto_13190 ?auto_13205 ) ) ( not ( = ?auto_13190 ?auto_13195 ) ) ( not ( = ?auto_13190 ?auto_13206 ) ) ( not ( = ?auto_13190 ?auto_13215 ) ) ( not ( = ?auto_13190 ?auto_13207 ) ) ( not ( = ?auto_13190 ?auto_13200 ) ) ( not ( = ?auto_13190 ?auto_13202 ) ) ( not ( = ?auto_13191 ?auto_13212 ) ) ( not ( = ?auto_13191 ?auto_13210 ) ) ( not ( = ?auto_13191 ?auto_13217 ) ) ( not ( = ?auto_13191 ?auto_13204 ) ) ( not ( = ?auto_13191 ?auto_13196 ) ) ( not ( = ?auto_13191 ?auto_13208 ) ) ( not ( = ?auto_13191 ?auto_13201 ) ) ( not ( = ?auto_13191 ?auto_13218 ) ) ( not ( = ?auto_13193 ?auto_13194 ) ) ( not ( = ?auto_13193 ?auto_13214 ) ) ( not ( = ?auto_13193 ?auto_13198 ) ) ( not ( = ?auto_13193 ?auto_13216 ) ) ( not ( = ?auto_13193 ?auto_13213 ) ) ( not ( = ?auto_13193 ?auto_13199 ) ) ( not ( = ?auto_13193 ?auto_13197 ) ) ( not ( = ?auto_13193 ?auto_13203 ) ) ( not ( = ?auto_13193 ?auto_13211 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_13177 ?auto_13178 ?auto_13179 ?auto_13180 ?auto_13181 ?auto_13182 ?auto_13183 ?auto_13184 ?auto_13185 ?auto_13186 )
      ( MAKE-1CRATE ?auto_13186 ?auto_13187 )
      ( MAKE-10CRATE-VERIFY ?auto_13177 ?auto_13178 ?auto_13179 ?auto_13180 ?auto_13181 ?auto_13182 ?auto_13183 ?auto_13184 ?auto_13185 ?auto_13186 ?auto_13187 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_13241 - SURFACE
      ?auto_13242 - SURFACE
      ?auto_13243 - SURFACE
      ?auto_13244 - SURFACE
      ?auto_13245 - SURFACE
      ?auto_13246 - SURFACE
      ?auto_13247 - SURFACE
      ?auto_13248 - SURFACE
      ?auto_13249 - SURFACE
      ?auto_13250 - SURFACE
      ?auto_13251 - SURFACE
      ?auto_13252 - SURFACE
    )
    :vars
    (
      ?auto_13257 - HOIST
      ?auto_13253 - PLACE
      ?auto_13255 - PLACE
      ?auto_13256 - HOIST
      ?auto_13258 - SURFACE
      ?auto_13281 - PLACE
      ?auto_13268 - HOIST
      ?auto_13269 - SURFACE
      ?auto_13273 - PLACE
      ?auto_13282 - HOIST
      ?auto_13267 - SURFACE
      ?auto_13259 - PLACE
      ?auto_13266 - HOIST
      ?auto_13261 - SURFACE
      ?auto_13280 - PLACE
      ?auto_13262 - HOIST
      ?auto_13276 - SURFACE
      ?auto_13274 - PLACE
      ?auto_13270 - HOIST
      ?auto_13260 - SURFACE
      ?auto_13277 - PLACE
      ?auto_13265 - HOIST
      ?auto_13264 - SURFACE
      ?auto_13272 - PLACE
      ?auto_13263 - HOIST
      ?auto_13284 - SURFACE
      ?auto_13278 - SURFACE
      ?auto_13283 - PLACE
      ?auto_13275 - HOIST
      ?auto_13271 - SURFACE
      ?auto_13279 - SURFACE
      ?auto_13254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13257 ?auto_13253 ) ( IS-CRATE ?auto_13252 ) ( not ( = ?auto_13255 ?auto_13253 ) ) ( HOIST-AT ?auto_13256 ?auto_13255 ) ( SURFACE-AT ?auto_13252 ?auto_13255 ) ( ON ?auto_13252 ?auto_13258 ) ( CLEAR ?auto_13252 ) ( not ( = ?auto_13251 ?auto_13252 ) ) ( not ( = ?auto_13251 ?auto_13258 ) ) ( not ( = ?auto_13252 ?auto_13258 ) ) ( not ( = ?auto_13257 ?auto_13256 ) ) ( IS-CRATE ?auto_13251 ) ( not ( = ?auto_13281 ?auto_13253 ) ) ( HOIST-AT ?auto_13268 ?auto_13281 ) ( AVAILABLE ?auto_13268 ) ( SURFACE-AT ?auto_13251 ?auto_13281 ) ( ON ?auto_13251 ?auto_13269 ) ( CLEAR ?auto_13251 ) ( not ( = ?auto_13250 ?auto_13251 ) ) ( not ( = ?auto_13250 ?auto_13269 ) ) ( not ( = ?auto_13251 ?auto_13269 ) ) ( not ( = ?auto_13257 ?auto_13268 ) ) ( IS-CRATE ?auto_13250 ) ( not ( = ?auto_13273 ?auto_13253 ) ) ( HOIST-AT ?auto_13282 ?auto_13273 ) ( AVAILABLE ?auto_13282 ) ( SURFACE-AT ?auto_13250 ?auto_13273 ) ( ON ?auto_13250 ?auto_13267 ) ( CLEAR ?auto_13250 ) ( not ( = ?auto_13249 ?auto_13250 ) ) ( not ( = ?auto_13249 ?auto_13267 ) ) ( not ( = ?auto_13250 ?auto_13267 ) ) ( not ( = ?auto_13257 ?auto_13282 ) ) ( IS-CRATE ?auto_13249 ) ( not ( = ?auto_13259 ?auto_13253 ) ) ( HOIST-AT ?auto_13266 ?auto_13259 ) ( AVAILABLE ?auto_13266 ) ( SURFACE-AT ?auto_13249 ?auto_13259 ) ( ON ?auto_13249 ?auto_13261 ) ( CLEAR ?auto_13249 ) ( not ( = ?auto_13248 ?auto_13249 ) ) ( not ( = ?auto_13248 ?auto_13261 ) ) ( not ( = ?auto_13249 ?auto_13261 ) ) ( not ( = ?auto_13257 ?auto_13266 ) ) ( IS-CRATE ?auto_13248 ) ( not ( = ?auto_13280 ?auto_13253 ) ) ( HOIST-AT ?auto_13262 ?auto_13280 ) ( AVAILABLE ?auto_13262 ) ( SURFACE-AT ?auto_13248 ?auto_13280 ) ( ON ?auto_13248 ?auto_13276 ) ( CLEAR ?auto_13248 ) ( not ( = ?auto_13247 ?auto_13248 ) ) ( not ( = ?auto_13247 ?auto_13276 ) ) ( not ( = ?auto_13248 ?auto_13276 ) ) ( not ( = ?auto_13257 ?auto_13262 ) ) ( IS-CRATE ?auto_13247 ) ( not ( = ?auto_13274 ?auto_13253 ) ) ( HOIST-AT ?auto_13270 ?auto_13274 ) ( AVAILABLE ?auto_13270 ) ( SURFACE-AT ?auto_13247 ?auto_13274 ) ( ON ?auto_13247 ?auto_13260 ) ( CLEAR ?auto_13247 ) ( not ( = ?auto_13246 ?auto_13247 ) ) ( not ( = ?auto_13246 ?auto_13260 ) ) ( not ( = ?auto_13247 ?auto_13260 ) ) ( not ( = ?auto_13257 ?auto_13270 ) ) ( IS-CRATE ?auto_13246 ) ( not ( = ?auto_13277 ?auto_13253 ) ) ( HOIST-AT ?auto_13265 ?auto_13277 ) ( AVAILABLE ?auto_13265 ) ( SURFACE-AT ?auto_13246 ?auto_13277 ) ( ON ?auto_13246 ?auto_13264 ) ( CLEAR ?auto_13246 ) ( not ( = ?auto_13245 ?auto_13246 ) ) ( not ( = ?auto_13245 ?auto_13264 ) ) ( not ( = ?auto_13246 ?auto_13264 ) ) ( not ( = ?auto_13257 ?auto_13265 ) ) ( IS-CRATE ?auto_13245 ) ( not ( = ?auto_13272 ?auto_13253 ) ) ( HOIST-AT ?auto_13263 ?auto_13272 ) ( SURFACE-AT ?auto_13245 ?auto_13272 ) ( ON ?auto_13245 ?auto_13284 ) ( CLEAR ?auto_13245 ) ( not ( = ?auto_13244 ?auto_13245 ) ) ( not ( = ?auto_13244 ?auto_13284 ) ) ( not ( = ?auto_13245 ?auto_13284 ) ) ( not ( = ?auto_13257 ?auto_13263 ) ) ( IS-CRATE ?auto_13244 ) ( AVAILABLE ?auto_13256 ) ( SURFACE-AT ?auto_13244 ?auto_13255 ) ( ON ?auto_13244 ?auto_13278 ) ( CLEAR ?auto_13244 ) ( not ( = ?auto_13243 ?auto_13244 ) ) ( not ( = ?auto_13243 ?auto_13278 ) ) ( not ( = ?auto_13244 ?auto_13278 ) ) ( IS-CRATE ?auto_13243 ) ( not ( = ?auto_13283 ?auto_13253 ) ) ( HOIST-AT ?auto_13275 ?auto_13283 ) ( AVAILABLE ?auto_13275 ) ( SURFACE-AT ?auto_13243 ?auto_13283 ) ( ON ?auto_13243 ?auto_13271 ) ( CLEAR ?auto_13243 ) ( not ( = ?auto_13242 ?auto_13243 ) ) ( not ( = ?auto_13242 ?auto_13271 ) ) ( not ( = ?auto_13243 ?auto_13271 ) ) ( not ( = ?auto_13257 ?auto_13275 ) ) ( SURFACE-AT ?auto_13241 ?auto_13253 ) ( CLEAR ?auto_13241 ) ( IS-CRATE ?auto_13242 ) ( AVAILABLE ?auto_13257 ) ( AVAILABLE ?auto_13263 ) ( SURFACE-AT ?auto_13242 ?auto_13272 ) ( ON ?auto_13242 ?auto_13279 ) ( CLEAR ?auto_13242 ) ( TRUCK-AT ?auto_13254 ?auto_13253 ) ( not ( = ?auto_13241 ?auto_13242 ) ) ( not ( = ?auto_13241 ?auto_13279 ) ) ( not ( = ?auto_13242 ?auto_13279 ) ) ( not ( = ?auto_13241 ?auto_13243 ) ) ( not ( = ?auto_13241 ?auto_13271 ) ) ( not ( = ?auto_13243 ?auto_13279 ) ) ( not ( = ?auto_13283 ?auto_13272 ) ) ( not ( = ?auto_13275 ?auto_13263 ) ) ( not ( = ?auto_13271 ?auto_13279 ) ) ( not ( = ?auto_13241 ?auto_13244 ) ) ( not ( = ?auto_13241 ?auto_13278 ) ) ( not ( = ?auto_13242 ?auto_13244 ) ) ( not ( = ?auto_13242 ?auto_13278 ) ) ( not ( = ?auto_13244 ?auto_13271 ) ) ( not ( = ?auto_13244 ?auto_13279 ) ) ( not ( = ?auto_13255 ?auto_13283 ) ) ( not ( = ?auto_13255 ?auto_13272 ) ) ( not ( = ?auto_13256 ?auto_13275 ) ) ( not ( = ?auto_13256 ?auto_13263 ) ) ( not ( = ?auto_13278 ?auto_13271 ) ) ( not ( = ?auto_13278 ?auto_13279 ) ) ( not ( = ?auto_13241 ?auto_13245 ) ) ( not ( = ?auto_13241 ?auto_13284 ) ) ( not ( = ?auto_13242 ?auto_13245 ) ) ( not ( = ?auto_13242 ?auto_13284 ) ) ( not ( = ?auto_13243 ?auto_13245 ) ) ( not ( = ?auto_13243 ?auto_13284 ) ) ( not ( = ?auto_13245 ?auto_13278 ) ) ( not ( = ?auto_13245 ?auto_13271 ) ) ( not ( = ?auto_13245 ?auto_13279 ) ) ( not ( = ?auto_13284 ?auto_13278 ) ) ( not ( = ?auto_13284 ?auto_13271 ) ) ( not ( = ?auto_13284 ?auto_13279 ) ) ( not ( = ?auto_13241 ?auto_13246 ) ) ( not ( = ?auto_13241 ?auto_13264 ) ) ( not ( = ?auto_13242 ?auto_13246 ) ) ( not ( = ?auto_13242 ?auto_13264 ) ) ( not ( = ?auto_13243 ?auto_13246 ) ) ( not ( = ?auto_13243 ?auto_13264 ) ) ( not ( = ?auto_13244 ?auto_13246 ) ) ( not ( = ?auto_13244 ?auto_13264 ) ) ( not ( = ?auto_13246 ?auto_13284 ) ) ( not ( = ?auto_13246 ?auto_13278 ) ) ( not ( = ?auto_13246 ?auto_13271 ) ) ( not ( = ?auto_13246 ?auto_13279 ) ) ( not ( = ?auto_13277 ?auto_13272 ) ) ( not ( = ?auto_13277 ?auto_13255 ) ) ( not ( = ?auto_13277 ?auto_13283 ) ) ( not ( = ?auto_13265 ?auto_13263 ) ) ( not ( = ?auto_13265 ?auto_13256 ) ) ( not ( = ?auto_13265 ?auto_13275 ) ) ( not ( = ?auto_13264 ?auto_13284 ) ) ( not ( = ?auto_13264 ?auto_13278 ) ) ( not ( = ?auto_13264 ?auto_13271 ) ) ( not ( = ?auto_13264 ?auto_13279 ) ) ( not ( = ?auto_13241 ?auto_13247 ) ) ( not ( = ?auto_13241 ?auto_13260 ) ) ( not ( = ?auto_13242 ?auto_13247 ) ) ( not ( = ?auto_13242 ?auto_13260 ) ) ( not ( = ?auto_13243 ?auto_13247 ) ) ( not ( = ?auto_13243 ?auto_13260 ) ) ( not ( = ?auto_13244 ?auto_13247 ) ) ( not ( = ?auto_13244 ?auto_13260 ) ) ( not ( = ?auto_13245 ?auto_13247 ) ) ( not ( = ?auto_13245 ?auto_13260 ) ) ( not ( = ?auto_13247 ?auto_13264 ) ) ( not ( = ?auto_13247 ?auto_13284 ) ) ( not ( = ?auto_13247 ?auto_13278 ) ) ( not ( = ?auto_13247 ?auto_13271 ) ) ( not ( = ?auto_13247 ?auto_13279 ) ) ( not ( = ?auto_13274 ?auto_13277 ) ) ( not ( = ?auto_13274 ?auto_13272 ) ) ( not ( = ?auto_13274 ?auto_13255 ) ) ( not ( = ?auto_13274 ?auto_13283 ) ) ( not ( = ?auto_13270 ?auto_13265 ) ) ( not ( = ?auto_13270 ?auto_13263 ) ) ( not ( = ?auto_13270 ?auto_13256 ) ) ( not ( = ?auto_13270 ?auto_13275 ) ) ( not ( = ?auto_13260 ?auto_13264 ) ) ( not ( = ?auto_13260 ?auto_13284 ) ) ( not ( = ?auto_13260 ?auto_13278 ) ) ( not ( = ?auto_13260 ?auto_13271 ) ) ( not ( = ?auto_13260 ?auto_13279 ) ) ( not ( = ?auto_13241 ?auto_13248 ) ) ( not ( = ?auto_13241 ?auto_13276 ) ) ( not ( = ?auto_13242 ?auto_13248 ) ) ( not ( = ?auto_13242 ?auto_13276 ) ) ( not ( = ?auto_13243 ?auto_13248 ) ) ( not ( = ?auto_13243 ?auto_13276 ) ) ( not ( = ?auto_13244 ?auto_13248 ) ) ( not ( = ?auto_13244 ?auto_13276 ) ) ( not ( = ?auto_13245 ?auto_13248 ) ) ( not ( = ?auto_13245 ?auto_13276 ) ) ( not ( = ?auto_13246 ?auto_13248 ) ) ( not ( = ?auto_13246 ?auto_13276 ) ) ( not ( = ?auto_13248 ?auto_13260 ) ) ( not ( = ?auto_13248 ?auto_13264 ) ) ( not ( = ?auto_13248 ?auto_13284 ) ) ( not ( = ?auto_13248 ?auto_13278 ) ) ( not ( = ?auto_13248 ?auto_13271 ) ) ( not ( = ?auto_13248 ?auto_13279 ) ) ( not ( = ?auto_13280 ?auto_13274 ) ) ( not ( = ?auto_13280 ?auto_13277 ) ) ( not ( = ?auto_13280 ?auto_13272 ) ) ( not ( = ?auto_13280 ?auto_13255 ) ) ( not ( = ?auto_13280 ?auto_13283 ) ) ( not ( = ?auto_13262 ?auto_13270 ) ) ( not ( = ?auto_13262 ?auto_13265 ) ) ( not ( = ?auto_13262 ?auto_13263 ) ) ( not ( = ?auto_13262 ?auto_13256 ) ) ( not ( = ?auto_13262 ?auto_13275 ) ) ( not ( = ?auto_13276 ?auto_13260 ) ) ( not ( = ?auto_13276 ?auto_13264 ) ) ( not ( = ?auto_13276 ?auto_13284 ) ) ( not ( = ?auto_13276 ?auto_13278 ) ) ( not ( = ?auto_13276 ?auto_13271 ) ) ( not ( = ?auto_13276 ?auto_13279 ) ) ( not ( = ?auto_13241 ?auto_13249 ) ) ( not ( = ?auto_13241 ?auto_13261 ) ) ( not ( = ?auto_13242 ?auto_13249 ) ) ( not ( = ?auto_13242 ?auto_13261 ) ) ( not ( = ?auto_13243 ?auto_13249 ) ) ( not ( = ?auto_13243 ?auto_13261 ) ) ( not ( = ?auto_13244 ?auto_13249 ) ) ( not ( = ?auto_13244 ?auto_13261 ) ) ( not ( = ?auto_13245 ?auto_13249 ) ) ( not ( = ?auto_13245 ?auto_13261 ) ) ( not ( = ?auto_13246 ?auto_13249 ) ) ( not ( = ?auto_13246 ?auto_13261 ) ) ( not ( = ?auto_13247 ?auto_13249 ) ) ( not ( = ?auto_13247 ?auto_13261 ) ) ( not ( = ?auto_13249 ?auto_13276 ) ) ( not ( = ?auto_13249 ?auto_13260 ) ) ( not ( = ?auto_13249 ?auto_13264 ) ) ( not ( = ?auto_13249 ?auto_13284 ) ) ( not ( = ?auto_13249 ?auto_13278 ) ) ( not ( = ?auto_13249 ?auto_13271 ) ) ( not ( = ?auto_13249 ?auto_13279 ) ) ( not ( = ?auto_13259 ?auto_13280 ) ) ( not ( = ?auto_13259 ?auto_13274 ) ) ( not ( = ?auto_13259 ?auto_13277 ) ) ( not ( = ?auto_13259 ?auto_13272 ) ) ( not ( = ?auto_13259 ?auto_13255 ) ) ( not ( = ?auto_13259 ?auto_13283 ) ) ( not ( = ?auto_13266 ?auto_13262 ) ) ( not ( = ?auto_13266 ?auto_13270 ) ) ( not ( = ?auto_13266 ?auto_13265 ) ) ( not ( = ?auto_13266 ?auto_13263 ) ) ( not ( = ?auto_13266 ?auto_13256 ) ) ( not ( = ?auto_13266 ?auto_13275 ) ) ( not ( = ?auto_13261 ?auto_13276 ) ) ( not ( = ?auto_13261 ?auto_13260 ) ) ( not ( = ?auto_13261 ?auto_13264 ) ) ( not ( = ?auto_13261 ?auto_13284 ) ) ( not ( = ?auto_13261 ?auto_13278 ) ) ( not ( = ?auto_13261 ?auto_13271 ) ) ( not ( = ?auto_13261 ?auto_13279 ) ) ( not ( = ?auto_13241 ?auto_13250 ) ) ( not ( = ?auto_13241 ?auto_13267 ) ) ( not ( = ?auto_13242 ?auto_13250 ) ) ( not ( = ?auto_13242 ?auto_13267 ) ) ( not ( = ?auto_13243 ?auto_13250 ) ) ( not ( = ?auto_13243 ?auto_13267 ) ) ( not ( = ?auto_13244 ?auto_13250 ) ) ( not ( = ?auto_13244 ?auto_13267 ) ) ( not ( = ?auto_13245 ?auto_13250 ) ) ( not ( = ?auto_13245 ?auto_13267 ) ) ( not ( = ?auto_13246 ?auto_13250 ) ) ( not ( = ?auto_13246 ?auto_13267 ) ) ( not ( = ?auto_13247 ?auto_13250 ) ) ( not ( = ?auto_13247 ?auto_13267 ) ) ( not ( = ?auto_13248 ?auto_13250 ) ) ( not ( = ?auto_13248 ?auto_13267 ) ) ( not ( = ?auto_13250 ?auto_13261 ) ) ( not ( = ?auto_13250 ?auto_13276 ) ) ( not ( = ?auto_13250 ?auto_13260 ) ) ( not ( = ?auto_13250 ?auto_13264 ) ) ( not ( = ?auto_13250 ?auto_13284 ) ) ( not ( = ?auto_13250 ?auto_13278 ) ) ( not ( = ?auto_13250 ?auto_13271 ) ) ( not ( = ?auto_13250 ?auto_13279 ) ) ( not ( = ?auto_13273 ?auto_13259 ) ) ( not ( = ?auto_13273 ?auto_13280 ) ) ( not ( = ?auto_13273 ?auto_13274 ) ) ( not ( = ?auto_13273 ?auto_13277 ) ) ( not ( = ?auto_13273 ?auto_13272 ) ) ( not ( = ?auto_13273 ?auto_13255 ) ) ( not ( = ?auto_13273 ?auto_13283 ) ) ( not ( = ?auto_13282 ?auto_13266 ) ) ( not ( = ?auto_13282 ?auto_13262 ) ) ( not ( = ?auto_13282 ?auto_13270 ) ) ( not ( = ?auto_13282 ?auto_13265 ) ) ( not ( = ?auto_13282 ?auto_13263 ) ) ( not ( = ?auto_13282 ?auto_13256 ) ) ( not ( = ?auto_13282 ?auto_13275 ) ) ( not ( = ?auto_13267 ?auto_13261 ) ) ( not ( = ?auto_13267 ?auto_13276 ) ) ( not ( = ?auto_13267 ?auto_13260 ) ) ( not ( = ?auto_13267 ?auto_13264 ) ) ( not ( = ?auto_13267 ?auto_13284 ) ) ( not ( = ?auto_13267 ?auto_13278 ) ) ( not ( = ?auto_13267 ?auto_13271 ) ) ( not ( = ?auto_13267 ?auto_13279 ) ) ( not ( = ?auto_13241 ?auto_13251 ) ) ( not ( = ?auto_13241 ?auto_13269 ) ) ( not ( = ?auto_13242 ?auto_13251 ) ) ( not ( = ?auto_13242 ?auto_13269 ) ) ( not ( = ?auto_13243 ?auto_13251 ) ) ( not ( = ?auto_13243 ?auto_13269 ) ) ( not ( = ?auto_13244 ?auto_13251 ) ) ( not ( = ?auto_13244 ?auto_13269 ) ) ( not ( = ?auto_13245 ?auto_13251 ) ) ( not ( = ?auto_13245 ?auto_13269 ) ) ( not ( = ?auto_13246 ?auto_13251 ) ) ( not ( = ?auto_13246 ?auto_13269 ) ) ( not ( = ?auto_13247 ?auto_13251 ) ) ( not ( = ?auto_13247 ?auto_13269 ) ) ( not ( = ?auto_13248 ?auto_13251 ) ) ( not ( = ?auto_13248 ?auto_13269 ) ) ( not ( = ?auto_13249 ?auto_13251 ) ) ( not ( = ?auto_13249 ?auto_13269 ) ) ( not ( = ?auto_13251 ?auto_13267 ) ) ( not ( = ?auto_13251 ?auto_13261 ) ) ( not ( = ?auto_13251 ?auto_13276 ) ) ( not ( = ?auto_13251 ?auto_13260 ) ) ( not ( = ?auto_13251 ?auto_13264 ) ) ( not ( = ?auto_13251 ?auto_13284 ) ) ( not ( = ?auto_13251 ?auto_13278 ) ) ( not ( = ?auto_13251 ?auto_13271 ) ) ( not ( = ?auto_13251 ?auto_13279 ) ) ( not ( = ?auto_13281 ?auto_13273 ) ) ( not ( = ?auto_13281 ?auto_13259 ) ) ( not ( = ?auto_13281 ?auto_13280 ) ) ( not ( = ?auto_13281 ?auto_13274 ) ) ( not ( = ?auto_13281 ?auto_13277 ) ) ( not ( = ?auto_13281 ?auto_13272 ) ) ( not ( = ?auto_13281 ?auto_13255 ) ) ( not ( = ?auto_13281 ?auto_13283 ) ) ( not ( = ?auto_13268 ?auto_13282 ) ) ( not ( = ?auto_13268 ?auto_13266 ) ) ( not ( = ?auto_13268 ?auto_13262 ) ) ( not ( = ?auto_13268 ?auto_13270 ) ) ( not ( = ?auto_13268 ?auto_13265 ) ) ( not ( = ?auto_13268 ?auto_13263 ) ) ( not ( = ?auto_13268 ?auto_13256 ) ) ( not ( = ?auto_13268 ?auto_13275 ) ) ( not ( = ?auto_13269 ?auto_13267 ) ) ( not ( = ?auto_13269 ?auto_13261 ) ) ( not ( = ?auto_13269 ?auto_13276 ) ) ( not ( = ?auto_13269 ?auto_13260 ) ) ( not ( = ?auto_13269 ?auto_13264 ) ) ( not ( = ?auto_13269 ?auto_13284 ) ) ( not ( = ?auto_13269 ?auto_13278 ) ) ( not ( = ?auto_13269 ?auto_13271 ) ) ( not ( = ?auto_13269 ?auto_13279 ) ) ( not ( = ?auto_13241 ?auto_13252 ) ) ( not ( = ?auto_13241 ?auto_13258 ) ) ( not ( = ?auto_13242 ?auto_13252 ) ) ( not ( = ?auto_13242 ?auto_13258 ) ) ( not ( = ?auto_13243 ?auto_13252 ) ) ( not ( = ?auto_13243 ?auto_13258 ) ) ( not ( = ?auto_13244 ?auto_13252 ) ) ( not ( = ?auto_13244 ?auto_13258 ) ) ( not ( = ?auto_13245 ?auto_13252 ) ) ( not ( = ?auto_13245 ?auto_13258 ) ) ( not ( = ?auto_13246 ?auto_13252 ) ) ( not ( = ?auto_13246 ?auto_13258 ) ) ( not ( = ?auto_13247 ?auto_13252 ) ) ( not ( = ?auto_13247 ?auto_13258 ) ) ( not ( = ?auto_13248 ?auto_13252 ) ) ( not ( = ?auto_13248 ?auto_13258 ) ) ( not ( = ?auto_13249 ?auto_13252 ) ) ( not ( = ?auto_13249 ?auto_13258 ) ) ( not ( = ?auto_13250 ?auto_13252 ) ) ( not ( = ?auto_13250 ?auto_13258 ) ) ( not ( = ?auto_13252 ?auto_13269 ) ) ( not ( = ?auto_13252 ?auto_13267 ) ) ( not ( = ?auto_13252 ?auto_13261 ) ) ( not ( = ?auto_13252 ?auto_13276 ) ) ( not ( = ?auto_13252 ?auto_13260 ) ) ( not ( = ?auto_13252 ?auto_13264 ) ) ( not ( = ?auto_13252 ?auto_13284 ) ) ( not ( = ?auto_13252 ?auto_13278 ) ) ( not ( = ?auto_13252 ?auto_13271 ) ) ( not ( = ?auto_13252 ?auto_13279 ) ) ( not ( = ?auto_13258 ?auto_13269 ) ) ( not ( = ?auto_13258 ?auto_13267 ) ) ( not ( = ?auto_13258 ?auto_13261 ) ) ( not ( = ?auto_13258 ?auto_13276 ) ) ( not ( = ?auto_13258 ?auto_13260 ) ) ( not ( = ?auto_13258 ?auto_13264 ) ) ( not ( = ?auto_13258 ?auto_13284 ) ) ( not ( = ?auto_13258 ?auto_13278 ) ) ( not ( = ?auto_13258 ?auto_13271 ) ) ( not ( = ?auto_13258 ?auto_13279 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_13241 ?auto_13242 ?auto_13243 ?auto_13244 ?auto_13245 ?auto_13246 ?auto_13247 ?auto_13248 ?auto_13249 ?auto_13250 ?auto_13251 )
      ( MAKE-1CRATE ?auto_13251 ?auto_13252 )
      ( MAKE-11CRATE-VERIFY ?auto_13241 ?auto_13242 ?auto_13243 ?auto_13244 ?auto_13245 ?auto_13246 ?auto_13247 ?auto_13248 ?auto_13249 ?auto_13250 ?auto_13251 ?auto_13252 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_13308 - SURFACE
      ?auto_13309 - SURFACE
      ?auto_13310 - SURFACE
      ?auto_13311 - SURFACE
      ?auto_13312 - SURFACE
      ?auto_13313 - SURFACE
      ?auto_13314 - SURFACE
      ?auto_13315 - SURFACE
      ?auto_13316 - SURFACE
      ?auto_13317 - SURFACE
      ?auto_13318 - SURFACE
      ?auto_13319 - SURFACE
      ?auto_13320 - SURFACE
    )
    :vars
    (
      ?auto_13323 - HOIST
      ?auto_13326 - PLACE
      ?auto_13325 - PLACE
      ?auto_13321 - HOIST
      ?auto_13322 - SURFACE
      ?auto_13343 - PLACE
      ?auto_13345 - HOIST
      ?auto_13346 - SURFACE
      ?auto_13340 - PLACE
      ?auto_13352 - HOIST
      ?auto_13353 - SURFACE
      ?auto_13344 - PLACE
      ?auto_13339 - HOIST
      ?auto_13338 - SURFACE
      ?auto_13332 - PLACE
      ?auto_13349 - HOIST
      ?auto_13347 - SURFACE
      ?auto_13330 - SURFACE
      ?auto_13334 - PLACE
      ?auto_13336 - HOIST
      ?auto_13328 - SURFACE
      ?auto_13331 - PLACE
      ?auto_13329 - HOIST
      ?auto_13342 - SURFACE
      ?auto_13327 - PLACE
      ?auto_13341 - HOIST
      ?auto_13348 - SURFACE
      ?auto_13337 - SURFACE
      ?auto_13350 - PLACE
      ?auto_13333 - HOIST
      ?auto_13335 - SURFACE
      ?auto_13351 - SURFACE
      ?auto_13324 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13323 ?auto_13326 ) ( IS-CRATE ?auto_13320 ) ( not ( = ?auto_13325 ?auto_13326 ) ) ( HOIST-AT ?auto_13321 ?auto_13325 ) ( SURFACE-AT ?auto_13320 ?auto_13325 ) ( ON ?auto_13320 ?auto_13322 ) ( CLEAR ?auto_13320 ) ( not ( = ?auto_13319 ?auto_13320 ) ) ( not ( = ?auto_13319 ?auto_13322 ) ) ( not ( = ?auto_13320 ?auto_13322 ) ) ( not ( = ?auto_13323 ?auto_13321 ) ) ( IS-CRATE ?auto_13319 ) ( not ( = ?auto_13343 ?auto_13326 ) ) ( HOIST-AT ?auto_13345 ?auto_13343 ) ( SURFACE-AT ?auto_13319 ?auto_13343 ) ( ON ?auto_13319 ?auto_13346 ) ( CLEAR ?auto_13319 ) ( not ( = ?auto_13318 ?auto_13319 ) ) ( not ( = ?auto_13318 ?auto_13346 ) ) ( not ( = ?auto_13319 ?auto_13346 ) ) ( not ( = ?auto_13323 ?auto_13345 ) ) ( IS-CRATE ?auto_13318 ) ( not ( = ?auto_13340 ?auto_13326 ) ) ( HOIST-AT ?auto_13352 ?auto_13340 ) ( AVAILABLE ?auto_13352 ) ( SURFACE-AT ?auto_13318 ?auto_13340 ) ( ON ?auto_13318 ?auto_13353 ) ( CLEAR ?auto_13318 ) ( not ( = ?auto_13317 ?auto_13318 ) ) ( not ( = ?auto_13317 ?auto_13353 ) ) ( not ( = ?auto_13318 ?auto_13353 ) ) ( not ( = ?auto_13323 ?auto_13352 ) ) ( IS-CRATE ?auto_13317 ) ( not ( = ?auto_13344 ?auto_13326 ) ) ( HOIST-AT ?auto_13339 ?auto_13344 ) ( AVAILABLE ?auto_13339 ) ( SURFACE-AT ?auto_13317 ?auto_13344 ) ( ON ?auto_13317 ?auto_13338 ) ( CLEAR ?auto_13317 ) ( not ( = ?auto_13316 ?auto_13317 ) ) ( not ( = ?auto_13316 ?auto_13338 ) ) ( not ( = ?auto_13317 ?auto_13338 ) ) ( not ( = ?auto_13323 ?auto_13339 ) ) ( IS-CRATE ?auto_13316 ) ( not ( = ?auto_13332 ?auto_13326 ) ) ( HOIST-AT ?auto_13349 ?auto_13332 ) ( AVAILABLE ?auto_13349 ) ( SURFACE-AT ?auto_13316 ?auto_13332 ) ( ON ?auto_13316 ?auto_13347 ) ( CLEAR ?auto_13316 ) ( not ( = ?auto_13315 ?auto_13316 ) ) ( not ( = ?auto_13315 ?auto_13347 ) ) ( not ( = ?auto_13316 ?auto_13347 ) ) ( not ( = ?auto_13323 ?auto_13349 ) ) ( IS-CRATE ?auto_13315 ) ( AVAILABLE ?auto_13321 ) ( SURFACE-AT ?auto_13315 ?auto_13325 ) ( ON ?auto_13315 ?auto_13330 ) ( CLEAR ?auto_13315 ) ( not ( = ?auto_13314 ?auto_13315 ) ) ( not ( = ?auto_13314 ?auto_13330 ) ) ( not ( = ?auto_13315 ?auto_13330 ) ) ( IS-CRATE ?auto_13314 ) ( not ( = ?auto_13334 ?auto_13326 ) ) ( HOIST-AT ?auto_13336 ?auto_13334 ) ( AVAILABLE ?auto_13336 ) ( SURFACE-AT ?auto_13314 ?auto_13334 ) ( ON ?auto_13314 ?auto_13328 ) ( CLEAR ?auto_13314 ) ( not ( = ?auto_13313 ?auto_13314 ) ) ( not ( = ?auto_13313 ?auto_13328 ) ) ( not ( = ?auto_13314 ?auto_13328 ) ) ( not ( = ?auto_13323 ?auto_13336 ) ) ( IS-CRATE ?auto_13313 ) ( not ( = ?auto_13331 ?auto_13326 ) ) ( HOIST-AT ?auto_13329 ?auto_13331 ) ( AVAILABLE ?auto_13329 ) ( SURFACE-AT ?auto_13313 ?auto_13331 ) ( ON ?auto_13313 ?auto_13342 ) ( CLEAR ?auto_13313 ) ( not ( = ?auto_13312 ?auto_13313 ) ) ( not ( = ?auto_13312 ?auto_13342 ) ) ( not ( = ?auto_13313 ?auto_13342 ) ) ( not ( = ?auto_13323 ?auto_13329 ) ) ( IS-CRATE ?auto_13312 ) ( not ( = ?auto_13327 ?auto_13326 ) ) ( HOIST-AT ?auto_13341 ?auto_13327 ) ( SURFACE-AT ?auto_13312 ?auto_13327 ) ( ON ?auto_13312 ?auto_13348 ) ( CLEAR ?auto_13312 ) ( not ( = ?auto_13311 ?auto_13312 ) ) ( not ( = ?auto_13311 ?auto_13348 ) ) ( not ( = ?auto_13312 ?auto_13348 ) ) ( not ( = ?auto_13323 ?auto_13341 ) ) ( IS-CRATE ?auto_13311 ) ( AVAILABLE ?auto_13345 ) ( SURFACE-AT ?auto_13311 ?auto_13343 ) ( ON ?auto_13311 ?auto_13337 ) ( CLEAR ?auto_13311 ) ( not ( = ?auto_13310 ?auto_13311 ) ) ( not ( = ?auto_13310 ?auto_13337 ) ) ( not ( = ?auto_13311 ?auto_13337 ) ) ( IS-CRATE ?auto_13310 ) ( not ( = ?auto_13350 ?auto_13326 ) ) ( HOIST-AT ?auto_13333 ?auto_13350 ) ( AVAILABLE ?auto_13333 ) ( SURFACE-AT ?auto_13310 ?auto_13350 ) ( ON ?auto_13310 ?auto_13335 ) ( CLEAR ?auto_13310 ) ( not ( = ?auto_13309 ?auto_13310 ) ) ( not ( = ?auto_13309 ?auto_13335 ) ) ( not ( = ?auto_13310 ?auto_13335 ) ) ( not ( = ?auto_13323 ?auto_13333 ) ) ( SURFACE-AT ?auto_13308 ?auto_13326 ) ( CLEAR ?auto_13308 ) ( IS-CRATE ?auto_13309 ) ( AVAILABLE ?auto_13323 ) ( AVAILABLE ?auto_13341 ) ( SURFACE-AT ?auto_13309 ?auto_13327 ) ( ON ?auto_13309 ?auto_13351 ) ( CLEAR ?auto_13309 ) ( TRUCK-AT ?auto_13324 ?auto_13326 ) ( not ( = ?auto_13308 ?auto_13309 ) ) ( not ( = ?auto_13308 ?auto_13351 ) ) ( not ( = ?auto_13309 ?auto_13351 ) ) ( not ( = ?auto_13308 ?auto_13310 ) ) ( not ( = ?auto_13308 ?auto_13335 ) ) ( not ( = ?auto_13310 ?auto_13351 ) ) ( not ( = ?auto_13350 ?auto_13327 ) ) ( not ( = ?auto_13333 ?auto_13341 ) ) ( not ( = ?auto_13335 ?auto_13351 ) ) ( not ( = ?auto_13308 ?auto_13311 ) ) ( not ( = ?auto_13308 ?auto_13337 ) ) ( not ( = ?auto_13309 ?auto_13311 ) ) ( not ( = ?auto_13309 ?auto_13337 ) ) ( not ( = ?auto_13311 ?auto_13335 ) ) ( not ( = ?auto_13311 ?auto_13351 ) ) ( not ( = ?auto_13343 ?auto_13350 ) ) ( not ( = ?auto_13343 ?auto_13327 ) ) ( not ( = ?auto_13345 ?auto_13333 ) ) ( not ( = ?auto_13345 ?auto_13341 ) ) ( not ( = ?auto_13337 ?auto_13335 ) ) ( not ( = ?auto_13337 ?auto_13351 ) ) ( not ( = ?auto_13308 ?auto_13312 ) ) ( not ( = ?auto_13308 ?auto_13348 ) ) ( not ( = ?auto_13309 ?auto_13312 ) ) ( not ( = ?auto_13309 ?auto_13348 ) ) ( not ( = ?auto_13310 ?auto_13312 ) ) ( not ( = ?auto_13310 ?auto_13348 ) ) ( not ( = ?auto_13312 ?auto_13337 ) ) ( not ( = ?auto_13312 ?auto_13335 ) ) ( not ( = ?auto_13312 ?auto_13351 ) ) ( not ( = ?auto_13348 ?auto_13337 ) ) ( not ( = ?auto_13348 ?auto_13335 ) ) ( not ( = ?auto_13348 ?auto_13351 ) ) ( not ( = ?auto_13308 ?auto_13313 ) ) ( not ( = ?auto_13308 ?auto_13342 ) ) ( not ( = ?auto_13309 ?auto_13313 ) ) ( not ( = ?auto_13309 ?auto_13342 ) ) ( not ( = ?auto_13310 ?auto_13313 ) ) ( not ( = ?auto_13310 ?auto_13342 ) ) ( not ( = ?auto_13311 ?auto_13313 ) ) ( not ( = ?auto_13311 ?auto_13342 ) ) ( not ( = ?auto_13313 ?auto_13348 ) ) ( not ( = ?auto_13313 ?auto_13337 ) ) ( not ( = ?auto_13313 ?auto_13335 ) ) ( not ( = ?auto_13313 ?auto_13351 ) ) ( not ( = ?auto_13331 ?auto_13327 ) ) ( not ( = ?auto_13331 ?auto_13343 ) ) ( not ( = ?auto_13331 ?auto_13350 ) ) ( not ( = ?auto_13329 ?auto_13341 ) ) ( not ( = ?auto_13329 ?auto_13345 ) ) ( not ( = ?auto_13329 ?auto_13333 ) ) ( not ( = ?auto_13342 ?auto_13348 ) ) ( not ( = ?auto_13342 ?auto_13337 ) ) ( not ( = ?auto_13342 ?auto_13335 ) ) ( not ( = ?auto_13342 ?auto_13351 ) ) ( not ( = ?auto_13308 ?auto_13314 ) ) ( not ( = ?auto_13308 ?auto_13328 ) ) ( not ( = ?auto_13309 ?auto_13314 ) ) ( not ( = ?auto_13309 ?auto_13328 ) ) ( not ( = ?auto_13310 ?auto_13314 ) ) ( not ( = ?auto_13310 ?auto_13328 ) ) ( not ( = ?auto_13311 ?auto_13314 ) ) ( not ( = ?auto_13311 ?auto_13328 ) ) ( not ( = ?auto_13312 ?auto_13314 ) ) ( not ( = ?auto_13312 ?auto_13328 ) ) ( not ( = ?auto_13314 ?auto_13342 ) ) ( not ( = ?auto_13314 ?auto_13348 ) ) ( not ( = ?auto_13314 ?auto_13337 ) ) ( not ( = ?auto_13314 ?auto_13335 ) ) ( not ( = ?auto_13314 ?auto_13351 ) ) ( not ( = ?auto_13334 ?auto_13331 ) ) ( not ( = ?auto_13334 ?auto_13327 ) ) ( not ( = ?auto_13334 ?auto_13343 ) ) ( not ( = ?auto_13334 ?auto_13350 ) ) ( not ( = ?auto_13336 ?auto_13329 ) ) ( not ( = ?auto_13336 ?auto_13341 ) ) ( not ( = ?auto_13336 ?auto_13345 ) ) ( not ( = ?auto_13336 ?auto_13333 ) ) ( not ( = ?auto_13328 ?auto_13342 ) ) ( not ( = ?auto_13328 ?auto_13348 ) ) ( not ( = ?auto_13328 ?auto_13337 ) ) ( not ( = ?auto_13328 ?auto_13335 ) ) ( not ( = ?auto_13328 ?auto_13351 ) ) ( not ( = ?auto_13308 ?auto_13315 ) ) ( not ( = ?auto_13308 ?auto_13330 ) ) ( not ( = ?auto_13309 ?auto_13315 ) ) ( not ( = ?auto_13309 ?auto_13330 ) ) ( not ( = ?auto_13310 ?auto_13315 ) ) ( not ( = ?auto_13310 ?auto_13330 ) ) ( not ( = ?auto_13311 ?auto_13315 ) ) ( not ( = ?auto_13311 ?auto_13330 ) ) ( not ( = ?auto_13312 ?auto_13315 ) ) ( not ( = ?auto_13312 ?auto_13330 ) ) ( not ( = ?auto_13313 ?auto_13315 ) ) ( not ( = ?auto_13313 ?auto_13330 ) ) ( not ( = ?auto_13315 ?auto_13328 ) ) ( not ( = ?auto_13315 ?auto_13342 ) ) ( not ( = ?auto_13315 ?auto_13348 ) ) ( not ( = ?auto_13315 ?auto_13337 ) ) ( not ( = ?auto_13315 ?auto_13335 ) ) ( not ( = ?auto_13315 ?auto_13351 ) ) ( not ( = ?auto_13325 ?auto_13334 ) ) ( not ( = ?auto_13325 ?auto_13331 ) ) ( not ( = ?auto_13325 ?auto_13327 ) ) ( not ( = ?auto_13325 ?auto_13343 ) ) ( not ( = ?auto_13325 ?auto_13350 ) ) ( not ( = ?auto_13321 ?auto_13336 ) ) ( not ( = ?auto_13321 ?auto_13329 ) ) ( not ( = ?auto_13321 ?auto_13341 ) ) ( not ( = ?auto_13321 ?auto_13345 ) ) ( not ( = ?auto_13321 ?auto_13333 ) ) ( not ( = ?auto_13330 ?auto_13328 ) ) ( not ( = ?auto_13330 ?auto_13342 ) ) ( not ( = ?auto_13330 ?auto_13348 ) ) ( not ( = ?auto_13330 ?auto_13337 ) ) ( not ( = ?auto_13330 ?auto_13335 ) ) ( not ( = ?auto_13330 ?auto_13351 ) ) ( not ( = ?auto_13308 ?auto_13316 ) ) ( not ( = ?auto_13308 ?auto_13347 ) ) ( not ( = ?auto_13309 ?auto_13316 ) ) ( not ( = ?auto_13309 ?auto_13347 ) ) ( not ( = ?auto_13310 ?auto_13316 ) ) ( not ( = ?auto_13310 ?auto_13347 ) ) ( not ( = ?auto_13311 ?auto_13316 ) ) ( not ( = ?auto_13311 ?auto_13347 ) ) ( not ( = ?auto_13312 ?auto_13316 ) ) ( not ( = ?auto_13312 ?auto_13347 ) ) ( not ( = ?auto_13313 ?auto_13316 ) ) ( not ( = ?auto_13313 ?auto_13347 ) ) ( not ( = ?auto_13314 ?auto_13316 ) ) ( not ( = ?auto_13314 ?auto_13347 ) ) ( not ( = ?auto_13316 ?auto_13330 ) ) ( not ( = ?auto_13316 ?auto_13328 ) ) ( not ( = ?auto_13316 ?auto_13342 ) ) ( not ( = ?auto_13316 ?auto_13348 ) ) ( not ( = ?auto_13316 ?auto_13337 ) ) ( not ( = ?auto_13316 ?auto_13335 ) ) ( not ( = ?auto_13316 ?auto_13351 ) ) ( not ( = ?auto_13332 ?auto_13325 ) ) ( not ( = ?auto_13332 ?auto_13334 ) ) ( not ( = ?auto_13332 ?auto_13331 ) ) ( not ( = ?auto_13332 ?auto_13327 ) ) ( not ( = ?auto_13332 ?auto_13343 ) ) ( not ( = ?auto_13332 ?auto_13350 ) ) ( not ( = ?auto_13349 ?auto_13321 ) ) ( not ( = ?auto_13349 ?auto_13336 ) ) ( not ( = ?auto_13349 ?auto_13329 ) ) ( not ( = ?auto_13349 ?auto_13341 ) ) ( not ( = ?auto_13349 ?auto_13345 ) ) ( not ( = ?auto_13349 ?auto_13333 ) ) ( not ( = ?auto_13347 ?auto_13330 ) ) ( not ( = ?auto_13347 ?auto_13328 ) ) ( not ( = ?auto_13347 ?auto_13342 ) ) ( not ( = ?auto_13347 ?auto_13348 ) ) ( not ( = ?auto_13347 ?auto_13337 ) ) ( not ( = ?auto_13347 ?auto_13335 ) ) ( not ( = ?auto_13347 ?auto_13351 ) ) ( not ( = ?auto_13308 ?auto_13317 ) ) ( not ( = ?auto_13308 ?auto_13338 ) ) ( not ( = ?auto_13309 ?auto_13317 ) ) ( not ( = ?auto_13309 ?auto_13338 ) ) ( not ( = ?auto_13310 ?auto_13317 ) ) ( not ( = ?auto_13310 ?auto_13338 ) ) ( not ( = ?auto_13311 ?auto_13317 ) ) ( not ( = ?auto_13311 ?auto_13338 ) ) ( not ( = ?auto_13312 ?auto_13317 ) ) ( not ( = ?auto_13312 ?auto_13338 ) ) ( not ( = ?auto_13313 ?auto_13317 ) ) ( not ( = ?auto_13313 ?auto_13338 ) ) ( not ( = ?auto_13314 ?auto_13317 ) ) ( not ( = ?auto_13314 ?auto_13338 ) ) ( not ( = ?auto_13315 ?auto_13317 ) ) ( not ( = ?auto_13315 ?auto_13338 ) ) ( not ( = ?auto_13317 ?auto_13347 ) ) ( not ( = ?auto_13317 ?auto_13330 ) ) ( not ( = ?auto_13317 ?auto_13328 ) ) ( not ( = ?auto_13317 ?auto_13342 ) ) ( not ( = ?auto_13317 ?auto_13348 ) ) ( not ( = ?auto_13317 ?auto_13337 ) ) ( not ( = ?auto_13317 ?auto_13335 ) ) ( not ( = ?auto_13317 ?auto_13351 ) ) ( not ( = ?auto_13344 ?auto_13332 ) ) ( not ( = ?auto_13344 ?auto_13325 ) ) ( not ( = ?auto_13344 ?auto_13334 ) ) ( not ( = ?auto_13344 ?auto_13331 ) ) ( not ( = ?auto_13344 ?auto_13327 ) ) ( not ( = ?auto_13344 ?auto_13343 ) ) ( not ( = ?auto_13344 ?auto_13350 ) ) ( not ( = ?auto_13339 ?auto_13349 ) ) ( not ( = ?auto_13339 ?auto_13321 ) ) ( not ( = ?auto_13339 ?auto_13336 ) ) ( not ( = ?auto_13339 ?auto_13329 ) ) ( not ( = ?auto_13339 ?auto_13341 ) ) ( not ( = ?auto_13339 ?auto_13345 ) ) ( not ( = ?auto_13339 ?auto_13333 ) ) ( not ( = ?auto_13338 ?auto_13347 ) ) ( not ( = ?auto_13338 ?auto_13330 ) ) ( not ( = ?auto_13338 ?auto_13328 ) ) ( not ( = ?auto_13338 ?auto_13342 ) ) ( not ( = ?auto_13338 ?auto_13348 ) ) ( not ( = ?auto_13338 ?auto_13337 ) ) ( not ( = ?auto_13338 ?auto_13335 ) ) ( not ( = ?auto_13338 ?auto_13351 ) ) ( not ( = ?auto_13308 ?auto_13318 ) ) ( not ( = ?auto_13308 ?auto_13353 ) ) ( not ( = ?auto_13309 ?auto_13318 ) ) ( not ( = ?auto_13309 ?auto_13353 ) ) ( not ( = ?auto_13310 ?auto_13318 ) ) ( not ( = ?auto_13310 ?auto_13353 ) ) ( not ( = ?auto_13311 ?auto_13318 ) ) ( not ( = ?auto_13311 ?auto_13353 ) ) ( not ( = ?auto_13312 ?auto_13318 ) ) ( not ( = ?auto_13312 ?auto_13353 ) ) ( not ( = ?auto_13313 ?auto_13318 ) ) ( not ( = ?auto_13313 ?auto_13353 ) ) ( not ( = ?auto_13314 ?auto_13318 ) ) ( not ( = ?auto_13314 ?auto_13353 ) ) ( not ( = ?auto_13315 ?auto_13318 ) ) ( not ( = ?auto_13315 ?auto_13353 ) ) ( not ( = ?auto_13316 ?auto_13318 ) ) ( not ( = ?auto_13316 ?auto_13353 ) ) ( not ( = ?auto_13318 ?auto_13338 ) ) ( not ( = ?auto_13318 ?auto_13347 ) ) ( not ( = ?auto_13318 ?auto_13330 ) ) ( not ( = ?auto_13318 ?auto_13328 ) ) ( not ( = ?auto_13318 ?auto_13342 ) ) ( not ( = ?auto_13318 ?auto_13348 ) ) ( not ( = ?auto_13318 ?auto_13337 ) ) ( not ( = ?auto_13318 ?auto_13335 ) ) ( not ( = ?auto_13318 ?auto_13351 ) ) ( not ( = ?auto_13340 ?auto_13344 ) ) ( not ( = ?auto_13340 ?auto_13332 ) ) ( not ( = ?auto_13340 ?auto_13325 ) ) ( not ( = ?auto_13340 ?auto_13334 ) ) ( not ( = ?auto_13340 ?auto_13331 ) ) ( not ( = ?auto_13340 ?auto_13327 ) ) ( not ( = ?auto_13340 ?auto_13343 ) ) ( not ( = ?auto_13340 ?auto_13350 ) ) ( not ( = ?auto_13352 ?auto_13339 ) ) ( not ( = ?auto_13352 ?auto_13349 ) ) ( not ( = ?auto_13352 ?auto_13321 ) ) ( not ( = ?auto_13352 ?auto_13336 ) ) ( not ( = ?auto_13352 ?auto_13329 ) ) ( not ( = ?auto_13352 ?auto_13341 ) ) ( not ( = ?auto_13352 ?auto_13345 ) ) ( not ( = ?auto_13352 ?auto_13333 ) ) ( not ( = ?auto_13353 ?auto_13338 ) ) ( not ( = ?auto_13353 ?auto_13347 ) ) ( not ( = ?auto_13353 ?auto_13330 ) ) ( not ( = ?auto_13353 ?auto_13328 ) ) ( not ( = ?auto_13353 ?auto_13342 ) ) ( not ( = ?auto_13353 ?auto_13348 ) ) ( not ( = ?auto_13353 ?auto_13337 ) ) ( not ( = ?auto_13353 ?auto_13335 ) ) ( not ( = ?auto_13353 ?auto_13351 ) ) ( not ( = ?auto_13308 ?auto_13319 ) ) ( not ( = ?auto_13308 ?auto_13346 ) ) ( not ( = ?auto_13309 ?auto_13319 ) ) ( not ( = ?auto_13309 ?auto_13346 ) ) ( not ( = ?auto_13310 ?auto_13319 ) ) ( not ( = ?auto_13310 ?auto_13346 ) ) ( not ( = ?auto_13311 ?auto_13319 ) ) ( not ( = ?auto_13311 ?auto_13346 ) ) ( not ( = ?auto_13312 ?auto_13319 ) ) ( not ( = ?auto_13312 ?auto_13346 ) ) ( not ( = ?auto_13313 ?auto_13319 ) ) ( not ( = ?auto_13313 ?auto_13346 ) ) ( not ( = ?auto_13314 ?auto_13319 ) ) ( not ( = ?auto_13314 ?auto_13346 ) ) ( not ( = ?auto_13315 ?auto_13319 ) ) ( not ( = ?auto_13315 ?auto_13346 ) ) ( not ( = ?auto_13316 ?auto_13319 ) ) ( not ( = ?auto_13316 ?auto_13346 ) ) ( not ( = ?auto_13317 ?auto_13319 ) ) ( not ( = ?auto_13317 ?auto_13346 ) ) ( not ( = ?auto_13319 ?auto_13353 ) ) ( not ( = ?auto_13319 ?auto_13338 ) ) ( not ( = ?auto_13319 ?auto_13347 ) ) ( not ( = ?auto_13319 ?auto_13330 ) ) ( not ( = ?auto_13319 ?auto_13328 ) ) ( not ( = ?auto_13319 ?auto_13342 ) ) ( not ( = ?auto_13319 ?auto_13348 ) ) ( not ( = ?auto_13319 ?auto_13337 ) ) ( not ( = ?auto_13319 ?auto_13335 ) ) ( not ( = ?auto_13319 ?auto_13351 ) ) ( not ( = ?auto_13346 ?auto_13353 ) ) ( not ( = ?auto_13346 ?auto_13338 ) ) ( not ( = ?auto_13346 ?auto_13347 ) ) ( not ( = ?auto_13346 ?auto_13330 ) ) ( not ( = ?auto_13346 ?auto_13328 ) ) ( not ( = ?auto_13346 ?auto_13342 ) ) ( not ( = ?auto_13346 ?auto_13348 ) ) ( not ( = ?auto_13346 ?auto_13337 ) ) ( not ( = ?auto_13346 ?auto_13335 ) ) ( not ( = ?auto_13346 ?auto_13351 ) ) ( not ( = ?auto_13308 ?auto_13320 ) ) ( not ( = ?auto_13308 ?auto_13322 ) ) ( not ( = ?auto_13309 ?auto_13320 ) ) ( not ( = ?auto_13309 ?auto_13322 ) ) ( not ( = ?auto_13310 ?auto_13320 ) ) ( not ( = ?auto_13310 ?auto_13322 ) ) ( not ( = ?auto_13311 ?auto_13320 ) ) ( not ( = ?auto_13311 ?auto_13322 ) ) ( not ( = ?auto_13312 ?auto_13320 ) ) ( not ( = ?auto_13312 ?auto_13322 ) ) ( not ( = ?auto_13313 ?auto_13320 ) ) ( not ( = ?auto_13313 ?auto_13322 ) ) ( not ( = ?auto_13314 ?auto_13320 ) ) ( not ( = ?auto_13314 ?auto_13322 ) ) ( not ( = ?auto_13315 ?auto_13320 ) ) ( not ( = ?auto_13315 ?auto_13322 ) ) ( not ( = ?auto_13316 ?auto_13320 ) ) ( not ( = ?auto_13316 ?auto_13322 ) ) ( not ( = ?auto_13317 ?auto_13320 ) ) ( not ( = ?auto_13317 ?auto_13322 ) ) ( not ( = ?auto_13318 ?auto_13320 ) ) ( not ( = ?auto_13318 ?auto_13322 ) ) ( not ( = ?auto_13320 ?auto_13346 ) ) ( not ( = ?auto_13320 ?auto_13353 ) ) ( not ( = ?auto_13320 ?auto_13338 ) ) ( not ( = ?auto_13320 ?auto_13347 ) ) ( not ( = ?auto_13320 ?auto_13330 ) ) ( not ( = ?auto_13320 ?auto_13328 ) ) ( not ( = ?auto_13320 ?auto_13342 ) ) ( not ( = ?auto_13320 ?auto_13348 ) ) ( not ( = ?auto_13320 ?auto_13337 ) ) ( not ( = ?auto_13320 ?auto_13335 ) ) ( not ( = ?auto_13320 ?auto_13351 ) ) ( not ( = ?auto_13322 ?auto_13346 ) ) ( not ( = ?auto_13322 ?auto_13353 ) ) ( not ( = ?auto_13322 ?auto_13338 ) ) ( not ( = ?auto_13322 ?auto_13347 ) ) ( not ( = ?auto_13322 ?auto_13330 ) ) ( not ( = ?auto_13322 ?auto_13328 ) ) ( not ( = ?auto_13322 ?auto_13342 ) ) ( not ( = ?auto_13322 ?auto_13348 ) ) ( not ( = ?auto_13322 ?auto_13337 ) ) ( not ( = ?auto_13322 ?auto_13335 ) ) ( not ( = ?auto_13322 ?auto_13351 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_13308 ?auto_13309 ?auto_13310 ?auto_13311 ?auto_13312 ?auto_13313 ?auto_13314 ?auto_13315 ?auto_13316 ?auto_13317 ?auto_13318 ?auto_13319 )
      ( MAKE-1CRATE ?auto_13319 ?auto_13320 )
      ( MAKE-12CRATE-VERIFY ?auto_13308 ?auto_13309 ?auto_13310 ?auto_13311 ?auto_13312 ?auto_13313 ?auto_13314 ?auto_13315 ?auto_13316 ?auto_13317 ?auto_13318 ?auto_13319 ?auto_13320 ) )
  )

)

