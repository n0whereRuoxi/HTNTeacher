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

  ( :method MAKE-13CRATE-VERIFY
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
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-14CRATE-VERIFY
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
      ?c13 - SURFACE
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-15CRATE-VERIFY
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
      ?c13 - SURFACE
      ?c14 - SURFACE
      ?c15 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( CLEAR ?c15 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22835 - SURFACE
      ?auto_22836 - SURFACE
    )
    :vars
    (
      ?auto_22837 - HOIST
      ?auto_22838 - PLACE
      ?auto_22840 - PLACE
      ?auto_22841 - HOIST
      ?auto_22842 - SURFACE
      ?auto_22839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22837 ?auto_22838 ) ( SURFACE-AT ?auto_22835 ?auto_22838 ) ( CLEAR ?auto_22835 ) ( IS-CRATE ?auto_22836 ) ( AVAILABLE ?auto_22837 ) ( not ( = ?auto_22840 ?auto_22838 ) ) ( HOIST-AT ?auto_22841 ?auto_22840 ) ( AVAILABLE ?auto_22841 ) ( SURFACE-AT ?auto_22836 ?auto_22840 ) ( ON ?auto_22836 ?auto_22842 ) ( CLEAR ?auto_22836 ) ( TRUCK-AT ?auto_22839 ?auto_22838 ) ( not ( = ?auto_22835 ?auto_22836 ) ) ( not ( = ?auto_22835 ?auto_22842 ) ) ( not ( = ?auto_22836 ?auto_22842 ) ) ( not ( = ?auto_22837 ?auto_22841 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22839 ?auto_22838 ?auto_22840 )
      ( !LIFT ?auto_22841 ?auto_22836 ?auto_22842 ?auto_22840 )
      ( !LOAD ?auto_22841 ?auto_22836 ?auto_22839 ?auto_22840 )
      ( !DRIVE ?auto_22839 ?auto_22840 ?auto_22838 )
      ( !UNLOAD ?auto_22837 ?auto_22836 ?auto_22839 ?auto_22838 )
      ( !DROP ?auto_22837 ?auto_22836 ?auto_22835 ?auto_22838 )
      ( MAKE-1CRATE-VERIFY ?auto_22835 ?auto_22836 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22845 - SURFACE
      ?auto_22846 - SURFACE
    )
    :vars
    (
      ?auto_22847 - HOIST
      ?auto_22848 - PLACE
      ?auto_22850 - PLACE
      ?auto_22851 - HOIST
      ?auto_22852 - SURFACE
      ?auto_22849 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22847 ?auto_22848 ) ( SURFACE-AT ?auto_22845 ?auto_22848 ) ( CLEAR ?auto_22845 ) ( IS-CRATE ?auto_22846 ) ( AVAILABLE ?auto_22847 ) ( not ( = ?auto_22850 ?auto_22848 ) ) ( HOIST-AT ?auto_22851 ?auto_22850 ) ( AVAILABLE ?auto_22851 ) ( SURFACE-AT ?auto_22846 ?auto_22850 ) ( ON ?auto_22846 ?auto_22852 ) ( CLEAR ?auto_22846 ) ( TRUCK-AT ?auto_22849 ?auto_22848 ) ( not ( = ?auto_22845 ?auto_22846 ) ) ( not ( = ?auto_22845 ?auto_22852 ) ) ( not ( = ?auto_22846 ?auto_22852 ) ) ( not ( = ?auto_22847 ?auto_22851 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22849 ?auto_22848 ?auto_22850 )
      ( !LIFT ?auto_22851 ?auto_22846 ?auto_22852 ?auto_22850 )
      ( !LOAD ?auto_22851 ?auto_22846 ?auto_22849 ?auto_22850 )
      ( !DRIVE ?auto_22849 ?auto_22850 ?auto_22848 )
      ( !UNLOAD ?auto_22847 ?auto_22846 ?auto_22849 ?auto_22848 )
      ( !DROP ?auto_22847 ?auto_22846 ?auto_22845 ?auto_22848 )
      ( MAKE-1CRATE-VERIFY ?auto_22845 ?auto_22846 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_22856 - SURFACE
      ?auto_22857 - SURFACE
      ?auto_22858 - SURFACE
    )
    :vars
    (
      ?auto_22859 - HOIST
      ?auto_22864 - PLACE
      ?auto_22861 - PLACE
      ?auto_22860 - HOIST
      ?auto_22863 - SURFACE
      ?auto_22866 - PLACE
      ?auto_22867 - HOIST
      ?auto_22865 - SURFACE
      ?auto_22862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22859 ?auto_22864 ) ( IS-CRATE ?auto_22858 ) ( not ( = ?auto_22861 ?auto_22864 ) ) ( HOIST-AT ?auto_22860 ?auto_22861 ) ( AVAILABLE ?auto_22860 ) ( SURFACE-AT ?auto_22858 ?auto_22861 ) ( ON ?auto_22858 ?auto_22863 ) ( CLEAR ?auto_22858 ) ( not ( = ?auto_22857 ?auto_22858 ) ) ( not ( = ?auto_22857 ?auto_22863 ) ) ( not ( = ?auto_22858 ?auto_22863 ) ) ( not ( = ?auto_22859 ?auto_22860 ) ) ( SURFACE-AT ?auto_22856 ?auto_22864 ) ( CLEAR ?auto_22856 ) ( IS-CRATE ?auto_22857 ) ( AVAILABLE ?auto_22859 ) ( not ( = ?auto_22866 ?auto_22864 ) ) ( HOIST-AT ?auto_22867 ?auto_22866 ) ( AVAILABLE ?auto_22867 ) ( SURFACE-AT ?auto_22857 ?auto_22866 ) ( ON ?auto_22857 ?auto_22865 ) ( CLEAR ?auto_22857 ) ( TRUCK-AT ?auto_22862 ?auto_22864 ) ( not ( = ?auto_22856 ?auto_22857 ) ) ( not ( = ?auto_22856 ?auto_22865 ) ) ( not ( = ?auto_22857 ?auto_22865 ) ) ( not ( = ?auto_22859 ?auto_22867 ) ) ( not ( = ?auto_22856 ?auto_22858 ) ) ( not ( = ?auto_22856 ?auto_22863 ) ) ( not ( = ?auto_22858 ?auto_22865 ) ) ( not ( = ?auto_22861 ?auto_22866 ) ) ( not ( = ?auto_22860 ?auto_22867 ) ) ( not ( = ?auto_22863 ?auto_22865 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_22856 ?auto_22857 )
      ( MAKE-1CRATE ?auto_22857 ?auto_22858 )
      ( MAKE-2CRATE-VERIFY ?auto_22856 ?auto_22857 ?auto_22858 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22870 - SURFACE
      ?auto_22871 - SURFACE
    )
    :vars
    (
      ?auto_22872 - HOIST
      ?auto_22873 - PLACE
      ?auto_22875 - PLACE
      ?auto_22876 - HOIST
      ?auto_22877 - SURFACE
      ?auto_22874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22872 ?auto_22873 ) ( SURFACE-AT ?auto_22870 ?auto_22873 ) ( CLEAR ?auto_22870 ) ( IS-CRATE ?auto_22871 ) ( AVAILABLE ?auto_22872 ) ( not ( = ?auto_22875 ?auto_22873 ) ) ( HOIST-AT ?auto_22876 ?auto_22875 ) ( AVAILABLE ?auto_22876 ) ( SURFACE-AT ?auto_22871 ?auto_22875 ) ( ON ?auto_22871 ?auto_22877 ) ( CLEAR ?auto_22871 ) ( TRUCK-AT ?auto_22874 ?auto_22873 ) ( not ( = ?auto_22870 ?auto_22871 ) ) ( not ( = ?auto_22870 ?auto_22877 ) ) ( not ( = ?auto_22871 ?auto_22877 ) ) ( not ( = ?auto_22872 ?auto_22876 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22874 ?auto_22873 ?auto_22875 )
      ( !LIFT ?auto_22876 ?auto_22871 ?auto_22877 ?auto_22875 )
      ( !LOAD ?auto_22876 ?auto_22871 ?auto_22874 ?auto_22875 )
      ( !DRIVE ?auto_22874 ?auto_22875 ?auto_22873 )
      ( !UNLOAD ?auto_22872 ?auto_22871 ?auto_22874 ?auto_22873 )
      ( !DROP ?auto_22872 ?auto_22871 ?auto_22870 ?auto_22873 )
      ( MAKE-1CRATE-VERIFY ?auto_22870 ?auto_22871 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_22882 - SURFACE
      ?auto_22883 - SURFACE
      ?auto_22884 - SURFACE
      ?auto_22885 - SURFACE
    )
    :vars
    (
      ?auto_22888 - HOIST
      ?auto_22886 - PLACE
      ?auto_22890 - PLACE
      ?auto_22889 - HOIST
      ?auto_22887 - SURFACE
      ?auto_22895 - PLACE
      ?auto_22893 - HOIST
      ?auto_22894 - SURFACE
      ?auto_22892 - PLACE
      ?auto_22896 - HOIST
      ?auto_22897 - SURFACE
      ?auto_22891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22888 ?auto_22886 ) ( IS-CRATE ?auto_22885 ) ( not ( = ?auto_22890 ?auto_22886 ) ) ( HOIST-AT ?auto_22889 ?auto_22890 ) ( AVAILABLE ?auto_22889 ) ( SURFACE-AT ?auto_22885 ?auto_22890 ) ( ON ?auto_22885 ?auto_22887 ) ( CLEAR ?auto_22885 ) ( not ( = ?auto_22884 ?auto_22885 ) ) ( not ( = ?auto_22884 ?auto_22887 ) ) ( not ( = ?auto_22885 ?auto_22887 ) ) ( not ( = ?auto_22888 ?auto_22889 ) ) ( IS-CRATE ?auto_22884 ) ( not ( = ?auto_22895 ?auto_22886 ) ) ( HOIST-AT ?auto_22893 ?auto_22895 ) ( AVAILABLE ?auto_22893 ) ( SURFACE-AT ?auto_22884 ?auto_22895 ) ( ON ?auto_22884 ?auto_22894 ) ( CLEAR ?auto_22884 ) ( not ( = ?auto_22883 ?auto_22884 ) ) ( not ( = ?auto_22883 ?auto_22894 ) ) ( not ( = ?auto_22884 ?auto_22894 ) ) ( not ( = ?auto_22888 ?auto_22893 ) ) ( SURFACE-AT ?auto_22882 ?auto_22886 ) ( CLEAR ?auto_22882 ) ( IS-CRATE ?auto_22883 ) ( AVAILABLE ?auto_22888 ) ( not ( = ?auto_22892 ?auto_22886 ) ) ( HOIST-AT ?auto_22896 ?auto_22892 ) ( AVAILABLE ?auto_22896 ) ( SURFACE-AT ?auto_22883 ?auto_22892 ) ( ON ?auto_22883 ?auto_22897 ) ( CLEAR ?auto_22883 ) ( TRUCK-AT ?auto_22891 ?auto_22886 ) ( not ( = ?auto_22882 ?auto_22883 ) ) ( not ( = ?auto_22882 ?auto_22897 ) ) ( not ( = ?auto_22883 ?auto_22897 ) ) ( not ( = ?auto_22888 ?auto_22896 ) ) ( not ( = ?auto_22882 ?auto_22884 ) ) ( not ( = ?auto_22882 ?auto_22894 ) ) ( not ( = ?auto_22884 ?auto_22897 ) ) ( not ( = ?auto_22895 ?auto_22892 ) ) ( not ( = ?auto_22893 ?auto_22896 ) ) ( not ( = ?auto_22894 ?auto_22897 ) ) ( not ( = ?auto_22882 ?auto_22885 ) ) ( not ( = ?auto_22882 ?auto_22887 ) ) ( not ( = ?auto_22883 ?auto_22885 ) ) ( not ( = ?auto_22883 ?auto_22887 ) ) ( not ( = ?auto_22885 ?auto_22894 ) ) ( not ( = ?auto_22885 ?auto_22897 ) ) ( not ( = ?auto_22890 ?auto_22895 ) ) ( not ( = ?auto_22890 ?auto_22892 ) ) ( not ( = ?auto_22889 ?auto_22893 ) ) ( not ( = ?auto_22889 ?auto_22896 ) ) ( not ( = ?auto_22887 ?auto_22894 ) ) ( not ( = ?auto_22887 ?auto_22897 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_22882 ?auto_22883 ?auto_22884 )
      ( MAKE-1CRATE ?auto_22884 ?auto_22885 )
      ( MAKE-3CRATE-VERIFY ?auto_22882 ?auto_22883 ?auto_22884 ?auto_22885 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22900 - SURFACE
      ?auto_22901 - SURFACE
    )
    :vars
    (
      ?auto_22902 - HOIST
      ?auto_22903 - PLACE
      ?auto_22905 - PLACE
      ?auto_22906 - HOIST
      ?auto_22907 - SURFACE
      ?auto_22904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22902 ?auto_22903 ) ( SURFACE-AT ?auto_22900 ?auto_22903 ) ( CLEAR ?auto_22900 ) ( IS-CRATE ?auto_22901 ) ( AVAILABLE ?auto_22902 ) ( not ( = ?auto_22905 ?auto_22903 ) ) ( HOIST-AT ?auto_22906 ?auto_22905 ) ( AVAILABLE ?auto_22906 ) ( SURFACE-AT ?auto_22901 ?auto_22905 ) ( ON ?auto_22901 ?auto_22907 ) ( CLEAR ?auto_22901 ) ( TRUCK-AT ?auto_22904 ?auto_22903 ) ( not ( = ?auto_22900 ?auto_22901 ) ) ( not ( = ?auto_22900 ?auto_22907 ) ) ( not ( = ?auto_22901 ?auto_22907 ) ) ( not ( = ?auto_22902 ?auto_22906 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22904 ?auto_22903 ?auto_22905 )
      ( !LIFT ?auto_22906 ?auto_22901 ?auto_22907 ?auto_22905 )
      ( !LOAD ?auto_22906 ?auto_22901 ?auto_22904 ?auto_22905 )
      ( !DRIVE ?auto_22904 ?auto_22905 ?auto_22903 )
      ( !UNLOAD ?auto_22902 ?auto_22901 ?auto_22904 ?auto_22903 )
      ( !DROP ?auto_22902 ?auto_22901 ?auto_22900 ?auto_22903 )
      ( MAKE-1CRATE-VERIFY ?auto_22900 ?auto_22901 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_22913 - SURFACE
      ?auto_22914 - SURFACE
      ?auto_22915 - SURFACE
      ?auto_22916 - SURFACE
      ?auto_22917 - SURFACE
    )
    :vars
    (
      ?auto_22923 - HOIST
      ?auto_22919 - PLACE
      ?auto_22920 - PLACE
      ?auto_22922 - HOIST
      ?auto_22921 - SURFACE
      ?auto_22932 - PLACE
      ?auto_22927 - HOIST
      ?auto_22931 - SURFACE
      ?auto_22929 - PLACE
      ?auto_22925 - HOIST
      ?auto_22930 - SURFACE
      ?auto_22928 - PLACE
      ?auto_22924 - HOIST
      ?auto_22926 - SURFACE
      ?auto_22918 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22923 ?auto_22919 ) ( IS-CRATE ?auto_22917 ) ( not ( = ?auto_22920 ?auto_22919 ) ) ( HOIST-AT ?auto_22922 ?auto_22920 ) ( AVAILABLE ?auto_22922 ) ( SURFACE-AT ?auto_22917 ?auto_22920 ) ( ON ?auto_22917 ?auto_22921 ) ( CLEAR ?auto_22917 ) ( not ( = ?auto_22916 ?auto_22917 ) ) ( not ( = ?auto_22916 ?auto_22921 ) ) ( not ( = ?auto_22917 ?auto_22921 ) ) ( not ( = ?auto_22923 ?auto_22922 ) ) ( IS-CRATE ?auto_22916 ) ( not ( = ?auto_22932 ?auto_22919 ) ) ( HOIST-AT ?auto_22927 ?auto_22932 ) ( AVAILABLE ?auto_22927 ) ( SURFACE-AT ?auto_22916 ?auto_22932 ) ( ON ?auto_22916 ?auto_22931 ) ( CLEAR ?auto_22916 ) ( not ( = ?auto_22915 ?auto_22916 ) ) ( not ( = ?auto_22915 ?auto_22931 ) ) ( not ( = ?auto_22916 ?auto_22931 ) ) ( not ( = ?auto_22923 ?auto_22927 ) ) ( IS-CRATE ?auto_22915 ) ( not ( = ?auto_22929 ?auto_22919 ) ) ( HOIST-AT ?auto_22925 ?auto_22929 ) ( AVAILABLE ?auto_22925 ) ( SURFACE-AT ?auto_22915 ?auto_22929 ) ( ON ?auto_22915 ?auto_22930 ) ( CLEAR ?auto_22915 ) ( not ( = ?auto_22914 ?auto_22915 ) ) ( not ( = ?auto_22914 ?auto_22930 ) ) ( not ( = ?auto_22915 ?auto_22930 ) ) ( not ( = ?auto_22923 ?auto_22925 ) ) ( SURFACE-AT ?auto_22913 ?auto_22919 ) ( CLEAR ?auto_22913 ) ( IS-CRATE ?auto_22914 ) ( AVAILABLE ?auto_22923 ) ( not ( = ?auto_22928 ?auto_22919 ) ) ( HOIST-AT ?auto_22924 ?auto_22928 ) ( AVAILABLE ?auto_22924 ) ( SURFACE-AT ?auto_22914 ?auto_22928 ) ( ON ?auto_22914 ?auto_22926 ) ( CLEAR ?auto_22914 ) ( TRUCK-AT ?auto_22918 ?auto_22919 ) ( not ( = ?auto_22913 ?auto_22914 ) ) ( not ( = ?auto_22913 ?auto_22926 ) ) ( not ( = ?auto_22914 ?auto_22926 ) ) ( not ( = ?auto_22923 ?auto_22924 ) ) ( not ( = ?auto_22913 ?auto_22915 ) ) ( not ( = ?auto_22913 ?auto_22930 ) ) ( not ( = ?auto_22915 ?auto_22926 ) ) ( not ( = ?auto_22929 ?auto_22928 ) ) ( not ( = ?auto_22925 ?auto_22924 ) ) ( not ( = ?auto_22930 ?auto_22926 ) ) ( not ( = ?auto_22913 ?auto_22916 ) ) ( not ( = ?auto_22913 ?auto_22931 ) ) ( not ( = ?auto_22914 ?auto_22916 ) ) ( not ( = ?auto_22914 ?auto_22931 ) ) ( not ( = ?auto_22916 ?auto_22930 ) ) ( not ( = ?auto_22916 ?auto_22926 ) ) ( not ( = ?auto_22932 ?auto_22929 ) ) ( not ( = ?auto_22932 ?auto_22928 ) ) ( not ( = ?auto_22927 ?auto_22925 ) ) ( not ( = ?auto_22927 ?auto_22924 ) ) ( not ( = ?auto_22931 ?auto_22930 ) ) ( not ( = ?auto_22931 ?auto_22926 ) ) ( not ( = ?auto_22913 ?auto_22917 ) ) ( not ( = ?auto_22913 ?auto_22921 ) ) ( not ( = ?auto_22914 ?auto_22917 ) ) ( not ( = ?auto_22914 ?auto_22921 ) ) ( not ( = ?auto_22915 ?auto_22917 ) ) ( not ( = ?auto_22915 ?auto_22921 ) ) ( not ( = ?auto_22917 ?auto_22931 ) ) ( not ( = ?auto_22917 ?auto_22930 ) ) ( not ( = ?auto_22917 ?auto_22926 ) ) ( not ( = ?auto_22920 ?auto_22932 ) ) ( not ( = ?auto_22920 ?auto_22929 ) ) ( not ( = ?auto_22920 ?auto_22928 ) ) ( not ( = ?auto_22922 ?auto_22927 ) ) ( not ( = ?auto_22922 ?auto_22925 ) ) ( not ( = ?auto_22922 ?auto_22924 ) ) ( not ( = ?auto_22921 ?auto_22931 ) ) ( not ( = ?auto_22921 ?auto_22930 ) ) ( not ( = ?auto_22921 ?auto_22926 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_22913 ?auto_22914 ?auto_22915 ?auto_22916 )
      ( MAKE-1CRATE ?auto_22916 ?auto_22917 )
      ( MAKE-4CRATE-VERIFY ?auto_22913 ?auto_22914 ?auto_22915 ?auto_22916 ?auto_22917 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22935 - SURFACE
      ?auto_22936 - SURFACE
    )
    :vars
    (
      ?auto_22937 - HOIST
      ?auto_22938 - PLACE
      ?auto_22940 - PLACE
      ?auto_22941 - HOIST
      ?auto_22942 - SURFACE
      ?auto_22939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22937 ?auto_22938 ) ( SURFACE-AT ?auto_22935 ?auto_22938 ) ( CLEAR ?auto_22935 ) ( IS-CRATE ?auto_22936 ) ( AVAILABLE ?auto_22937 ) ( not ( = ?auto_22940 ?auto_22938 ) ) ( HOIST-AT ?auto_22941 ?auto_22940 ) ( AVAILABLE ?auto_22941 ) ( SURFACE-AT ?auto_22936 ?auto_22940 ) ( ON ?auto_22936 ?auto_22942 ) ( CLEAR ?auto_22936 ) ( TRUCK-AT ?auto_22939 ?auto_22938 ) ( not ( = ?auto_22935 ?auto_22936 ) ) ( not ( = ?auto_22935 ?auto_22942 ) ) ( not ( = ?auto_22936 ?auto_22942 ) ) ( not ( = ?auto_22937 ?auto_22941 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22939 ?auto_22938 ?auto_22940 )
      ( !LIFT ?auto_22941 ?auto_22936 ?auto_22942 ?auto_22940 )
      ( !LOAD ?auto_22941 ?auto_22936 ?auto_22939 ?auto_22940 )
      ( !DRIVE ?auto_22939 ?auto_22940 ?auto_22938 )
      ( !UNLOAD ?auto_22937 ?auto_22936 ?auto_22939 ?auto_22938 )
      ( !DROP ?auto_22937 ?auto_22936 ?auto_22935 ?auto_22938 )
      ( MAKE-1CRATE-VERIFY ?auto_22935 ?auto_22936 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_22949 - SURFACE
      ?auto_22950 - SURFACE
      ?auto_22951 - SURFACE
      ?auto_22952 - SURFACE
      ?auto_22953 - SURFACE
      ?auto_22954 - SURFACE
    )
    :vars
    (
      ?auto_22958 - HOIST
      ?auto_22956 - PLACE
      ?auto_22955 - PLACE
      ?auto_22960 - HOIST
      ?auto_22959 - SURFACE
      ?auto_22966 - PLACE
      ?auto_22968 - HOIST
      ?auto_22971 - SURFACE
      ?auto_22962 - PLACE
      ?auto_22961 - HOIST
      ?auto_22963 - SURFACE
      ?auto_22969 - PLACE
      ?auto_22964 - HOIST
      ?auto_22967 - SURFACE
      ?auto_22970 - PLACE
      ?auto_22965 - HOIST
      ?auto_22972 - SURFACE
      ?auto_22957 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22958 ?auto_22956 ) ( IS-CRATE ?auto_22954 ) ( not ( = ?auto_22955 ?auto_22956 ) ) ( HOIST-AT ?auto_22960 ?auto_22955 ) ( AVAILABLE ?auto_22960 ) ( SURFACE-AT ?auto_22954 ?auto_22955 ) ( ON ?auto_22954 ?auto_22959 ) ( CLEAR ?auto_22954 ) ( not ( = ?auto_22953 ?auto_22954 ) ) ( not ( = ?auto_22953 ?auto_22959 ) ) ( not ( = ?auto_22954 ?auto_22959 ) ) ( not ( = ?auto_22958 ?auto_22960 ) ) ( IS-CRATE ?auto_22953 ) ( not ( = ?auto_22966 ?auto_22956 ) ) ( HOIST-AT ?auto_22968 ?auto_22966 ) ( AVAILABLE ?auto_22968 ) ( SURFACE-AT ?auto_22953 ?auto_22966 ) ( ON ?auto_22953 ?auto_22971 ) ( CLEAR ?auto_22953 ) ( not ( = ?auto_22952 ?auto_22953 ) ) ( not ( = ?auto_22952 ?auto_22971 ) ) ( not ( = ?auto_22953 ?auto_22971 ) ) ( not ( = ?auto_22958 ?auto_22968 ) ) ( IS-CRATE ?auto_22952 ) ( not ( = ?auto_22962 ?auto_22956 ) ) ( HOIST-AT ?auto_22961 ?auto_22962 ) ( AVAILABLE ?auto_22961 ) ( SURFACE-AT ?auto_22952 ?auto_22962 ) ( ON ?auto_22952 ?auto_22963 ) ( CLEAR ?auto_22952 ) ( not ( = ?auto_22951 ?auto_22952 ) ) ( not ( = ?auto_22951 ?auto_22963 ) ) ( not ( = ?auto_22952 ?auto_22963 ) ) ( not ( = ?auto_22958 ?auto_22961 ) ) ( IS-CRATE ?auto_22951 ) ( not ( = ?auto_22969 ?auto_22956 ) ) ( HOIST-AT ?auto_22964 ?auto_22969 ) ( AVAILABLE ?auto_22964 ) ( SURFACE-AT ?auto_22951 ?auto_22969 ) ( ON ?auto_22951 ?auto_22967 ) ( CLEAR ?auto_22951 ) ( not ( = ?auto_22950 ?auto_22951 ) ) ( not ( = ?auto_22950 ?auto_22967 ) ) ( not ( = ?auto_22951 ?auto_22967 ) ) ( not ( = ?auto_22958 ?auto_22964 ) ) ( SURFACE-AT ?auto_22949 ?auto_22956 ) ( CLEAR ?auto_22949 ) ( IS-CRATE ?auto_22950 ) ( AVAILABLE ?auto_22958 ) ( not ( = ?auto_22970 ?auto_22956 ) ) ( HOIST-AT ?auto_22965 ?auto_22970 ) ( AVAILABLE ?auto_22965 ) ( SURFACE-AT ?auto_22950 ?auto_22970 ) ( ON ?auto_22950 ?auto_22972 ) ( CLEAR ?auto_22950 ) ( TRUCK-AT ?auto_22957 ?auto_22956 ) ( not ( = ?auto_22949 ?auto_22950 ) ) ( not ( = ?auto_22949 ?auto_22972 ) ) ( not ( = ?auto_22950 ?auto_22972 ) ) ( not ( = ?auto_22958 ?auto_22965 ) ) ( not ( = ?auto_22949 ?auto_22951 ) ) ( not ( = ?auto_22949 ?auto_22967 ) ) ( not ( = ?auto_22951 ?auto_22972 ) ) ( not ( = ?auto_22969 ?auto_22970 ) ) ( not ( = ?auto_22964 ?auto_22965 ) ) ( not ( = ?auto_22967 ?auto_22972 ) ) ( not ( = ?auto_22949 ?auto_22952 ) ) ( not ( = ?auto_22949 ?auto_22963 ) ) ( not ( = ?auto_22950 ?auto_22952 ) ) ( not ( = ?auto_22950 ?auto_22963 ) ) ( not ( = ?auto_22952 ?auto_22967 ) ) ( not ( = ?auto_22952 ?auto_22972 ) ) ( not ( = ?auto_22962 ?auto_22969 ) ) ( not ( = ?auto_22962 ?auto_22970 ) ) ( not ( = ?auto_22961 ?auto_22964 ) ) ( not ( = ?auto_22961 ?auto_22965 ) ) ( not ( = ?auto_22963 ?auto_22967 ) ) ( not ( = ?auto_22963 ?auto_22972 ) ) ( not ( = ?auto_22949 ?auto_22953 ) ) ( not ( = ?auto_22949 ?auto_22971 ) ) ( not ( = ?auto_22950 ?auto_22953 ) ) ( not ( = ?auto_22950 ?auto_22971 ) ) ( not ( = ?auto_22951 ?auto_22953 ) ) ( not ( = ?auto_22951 ?auto_22971 ) ) ( not ( = ?auto_22953 ?auto_22963 ) ) ( not ( = ?auto_22953 ?auto_22967 ) ) ( not ( = ?auto_22953 ?auto_22972 ) ) ( not ( = ?auto_22966 ?auto_22962 ) ) ( not ( = ?auto_22966 ?auto_22969 ) ) ( not ( = ?auto_22966 ?auto_22970 ) ) ( not ( = ?auto_22968 ?auto_22961 ) ) ( not ( = ?auto_22968 ?auto_22964 ) ) ( not ( = ?auto_22968 ?auto_22965 ) ) ( not ( = ?auto_22971 ?auto_22963 ) ) ( not ( = ?auto_22971 ?auto_22967 ) ) ( not ( = ?auto_22971 ?auto_22972 ) ) ( not ( = ?auto_22949 ?auto_22954 ) ) ( not ( = ?auto_22949 ?auto_22959 ) ) ( not ( = ?auto_22950 ?auto_22954 ) ) ( not ( = ?auto_22950 ?auto_22959 ) ) ( not ( = ?auto_22951 ?auto_22954 ) ) ( not ( = ?auto_22951 ?auto_22959 ) ) ( not ( = ?auto_22952 ?auto_22954 ) ) ( not ( = ?auto_22952 ?auto_22959 ) ) ( not ( = ?auto_22954 ?auto_22971 ) ) ( not ( = ?auto_22954 ?auto_22963 ) ) ( not ( = ?auto_22954 ?auto_22967 ) ) ( not ( = ?auto_22954 ?auto_22972 ) ) ( not ( = ?auto_22955 ?auto_22966 ) ) ( not ( = ?auto_22955 ?auto_22962 ) ) ( not ( = ?auto_22955 ?auto_22969 ) ) ( not ( = ?auto_22955 ?auto_22970 ) ) ( not ( = ?auto_22960 ?auto_22968 ) ) ( not ( = ?auto_22960 ?auto_22961 ) ) ( not ( = ?auto_22960 ?auto_22964 ) ) ( not ( = ?auto_22960 ?auto_22965 ) ) ( not ( = ?auto_22959 ?auto_22971 ) ) ( not ( = ?auto_22959 ?auto_22963 ) ) ( not ( = ?auto_22959 ?auto_22967 ) ) ( not ( = ?auto_22959 ?auto_22972 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_22949 ?auto_22950 ?auto_22951 ?auto_22952 ?auto_22953 )
      ( MAKE-1CRATE ?auto_22953 ?auto_22954 )
      ( MAKE-5CRATE-VERIFY ?auto_22949 ?auto_22950 ?auto_22951 ?auto_22952 ?auto_22953 ?auto_22954 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_22975 - SURFACE
      ?auto_22976 - SURFACE
    )
    :vars
    (
      ?auto_22977 - HOIST
      ?auto_22978 - PLACE
      ?auto_22980 - PLACE
      ?auto_22981 - HOIST
      ?auto_22982 - SURFACE
      ?auto_22979 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22977 ?auto_22978 ) ( SURFACE-AT ?auto_22975 ?auto_22978 ) ( CLEAR ?auto_22975 ) ( IS-CRATE ?auto_22976 ) ( AVAILABLE ?auto_22977 ) ( not ( = ?auto_22980 ?auto_22978 ) ) ( HOIST-AT ?auto_22981 ?auto_22980 ) ( AVAILABLE ?auto_22981 ) ( SURFACE-AT ?auto_22976 ?auto_22980 ) ( ON ?auto_22976 ?auto_22982 ) ( CLEAR ?auto_22976 ) ( TRUCK-AT ?auto_22979 ?auto_22978 ) ( not ( = ?auto_22975 ?auto_22976 ) ) ( not ( = ?auto_22975 ?auto_22982 ) ) ( not ( = ?auto_22976 ?auto_22982 ) ) ( not ( = ?auto_22977 ?auto_22981 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_22979 ?auto_22978 ?auto_22980 )
      ( !LIFT ?auto_22981 ?auto_22976 ?auto_22982 ?auto_22980 )
      ( !LOAD ?auto_22981 ?auto_22976 ?auto_22979 ?auto_22980 )
      ( !DRIVE ?auto_22979 ?auto_22980 ?auto_22978 )
      ( !UNLOAD ?auto_22977 ?auto_22976 ?auto_22979 ?auto_22978 )
      ( !DROP ?auto_22977 ?auto_22976 ?auto_22975 ?auto_22978 )
      ( MAKE-1CRATE-VERIFY ?auto_22975 ?auto_22976 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_22990 - SURFACE
      ?auto_22991 - SURFACE
      ?auto_22992 - SURFACE
      ?auto_22993 - SURFACE
      ?auto_22994 - SURFACE
      ?auto_22996 - SURFACE
      ?auto_22995 - SURFACE
    )
    :vars
    (
      ?auto_22997 - HOIST
      ?auto_23002 - PLACE
      ?auto_22998 - PLACE
      ?auto_23000 - HOIST
      ?auto_23001 - SURFACE
      ?auto_23003 - PLACE
      ?auto_23008 - HOIST
      ?auto_23012 - SURFACE
      ?auto_23007 - PLACE
      ?auto_23013 - HOIST
      ?auto_23009 - SURFACE
      ?auto_23010 - PLACE
      ?auto_23006 - HOIST
      ?auto_23011 - SURFACE
      ?auto_23004 - PLACE
      ?auto_23017 - HOIST
      ?auto_23016 - SURFACE
      ?auto_23014 - PLACE
      ?auto_23005 - HOIST
      ?auto_23015 - SURFACE
      ?auto_22999 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_22997 ?auto_23002 ) ( IS-CRATE ?auto_22995 ) ( not ( = ?auto_22998 ?auto_23002 ) ) ( HOIST-AT ?auto_23000 ?auto_22998 ) ( AVAILABLE ?auto_23000 ) ( SURFACE-AT ?auto_22995 ?auto_22998 ) ( ON ?auto_22995 ?auto_23001 ) ( CLEAR ?auto_22995 ) ( not ( = ?auto_22996 ?auto_22995 ) ) ( not ( = ?auto_22996 ?auto_23001 ) ) ( not ( = ?auto_22995 ?auto_23001 ) ) ( not ( = ?auto_22997 ?auto_23000 ) ) ( IS-CRATE ?auto_22996 ) ( not ( = ?auto_23003 ?auto_23002 ) ) ( HOIST-AT ?auto_23008 ?auto_23003 ) ( AVAILABLE ?auto_23008 ) ( SURFACE-AT ?auto_22996 ?auto_23003 ) ( ON ?auto_22996 ?auto_23012 ) ( CLEAR ?auto_22996 ) ( not ( = ?auto_22994 ?auto_22996 ) ) ( not ( = ?auto_22994 ?auto_23012 ) ) ( not ( = ?auto_22996 ?auto_23012 ) ) ( not ( = ?auto_22997 ?auto_23008 ) ) ( IS-CRATE ?auto_22994 ) ( not ( = ?auto_23007 ?auto_23002 ) ) ( HOIST-AT ?auto_23013 ?auto_23007 ) ( AVAILABLE ?auto_23013 ) ( SURFACE-AT ?auto_22994 ?auto_23007 ) ( ON ?auto_22994 ?auto_23009 ) ( CLEAR ?auto_22994 ) ( not ( = ?auto_22993 ?auto_22994 ) ) ( not ( = ?auto_22993 ?auto_23009 ) ) ( not ( = ?auto_22994 ?auto_23009 ) ) ( not ( = ?auto_22997 ?auto_23013 ) ) ( IS-CRATE ?auto_22993 ) ( not ( = ?auto_23010 ?auto_23002 ) ) ( HOIST-AT ?auto_23006 ?auto_23010 ) ( AVAILABLE ?auto_23006 ) ( SURFACE-AT ?auto_22993 ?auto_23010 ) ( ON ?auto_22993 ?auto_23011 ) ( CLEAR ?auto_22993 ) ( not ( = ?auto_22992 ?auto_22993 ) ) ( not ( = ?auto_22992 ?auto_23011 ) ) ( not ( = ?auto_22993 ?auto_23011 ) ) ( not ( = ?auto_22997 ?auto_23006 ) ) ( IS-CRATE ?auto_22992 ) ( not ( = ?auto_23004 ?auto_23002 ) ) ( HOIST-AT ?auto_23017 ?auto_23004 ) ( AVAILABLE ?auto_23017 ) ( SURFACE-AT ?auto_22992 ?auto_23004 ) ( ON ?auto_22992 ?auto_23016 ) ( CLEAR ?auto_22992 ) ( not ( = ?auto_22991 ?auto_22992 ) ) ( not ( = ?auto_22991 ?auto_23016 ) ) ( not ( = ?auto_22992 ?auto_23016 ) ) ( not ( = ?auto_22997 ?auto_23017 ) ) ( SURFACE-AT ?auto_22990 ?auto_23002 ) ( CLEAR ?auto_22990 ) ( IS-CRATE ?auto_22991 ) ( AVAILABLE ?auto_22997 ) ( not ( = ?auto_23014 ?auto_23002 ) ) ( HOIST-AT ?auto_23005 ?auto_23014 ) ( AVAILABLE ?auto_23005 ) ( SURFACE-AT ?auto_22991 ?auto_23014 ) ( ON ?auto_22991 ?auto_23015 ) ( CLEAR ?auto_22991 ) ( TRUCK-AT ?auto_22999 ?auto_23002 ) ( not ( = ?auto_22990 ?auto_22991 ) ) ( not ( = ?auto_22990 ?auto_23015 ) ) ( not ( = ?auto_22991 ?auto_23015 ) ) ( not ( = ?auto_22997 ?auto_23005 ) ) ( not ( = ?auto_22990 ?auto_22992 ) ) ( not ( = ?auto_22990 ?auto_23016 ) ) ( not ( = ?auto_22992 ?auto_23015 ) ) ( not ( = ?auto_23004 ?auto_23014 ) ) ( not ( = ?auto_23017 ?auto_23005 ) ) ( not ( = ?auto_23016 ?auto_23015 ) ) ( not ( = ?auto_22990 ?auto_22993 ) ) ( not ( = ?auto_22990 ?auto_23011 ) ) ( not ( = ?auto_22991 ?auto_22993 ) ) ( not ( = ?auto_22991 ?auto_23011 ) ) ( not ( = ?auto_22993 ?auto_23016 ) ) ( not ( = ?auto_22993 ?auto_23015 ) ) ( not ( = ?auto_23010 ?auto_23004 ) ) ( not ( = ?auto_23010 ?auto_23014 ) ) ( not ( = ?auto_23006 ?auto_23017 ) ) ( not ( = ?auto_23006 ?auto_23005 ) ) ( not ( = ?auto_23011 ?auto_23016 ) ) ( not ( = ?auto_23011 ?auto_23015 ) ) ( not ( = ?auto_22990 ?auto_22994 ) ) ( not ( = ?auto_22990 ?auto_23009 ) ) ( not ( = ?auto_22991 ?auto_22994 ) ) ( not ( = ?auto_22991 ?auto_23009 ) ) ( not ( = ?auto_22992 ?auto_22994 ) ) ( not ( = ?auto_22992 ?auto_23009 ) ) ( not ( = ?auto_22994 ?auto_23011 ) ) ( not ( = ?auto_22994 ?auto_23016 ) ) ( not ( = ?auto_22994 ?auto_23015 ) ) ( not ( = ?auto_23007 ?auto_23010 ) ) ( not ( = ?auto_23007 ?auto_23004 ) ) ( not ( = ?auto_23007 ?auto_23014 ) ) ( not ( = ?auto_23013 ?auto_23006 ) ) ( not ( = ?auto_23013 ?auto_23017 ) ) ( not ( = ?auto_23013 ?auto_23005 ) ) ( not ( = ?auto_23009 ?auto_23011 ) ) ( not ( = ?auto_23009 ?auto_23016 ) ) ( not ( = ?auto_23009 ?auto_23015 ) ) ( not ( = ?auto_22990 ?auto_22996 ) ) ( not ( = ?auto_22990 ?auto_23012 ) ) ( not ( = ?auto_22991 ?auto_22996 ) ) ( not ( = ?auto_22991 ?auto_23012 ) ) ( not ( = ?auto_22992 ?auto_22996 ) ) ( not ( = ?auto_22992 ?auto_23012 ) ) ( not ( = ?auto_22993 ?auto_22996 ) ) ( not ( = ?auto_22993 ?auto_23012 ) ) ( not ( = ?auto_22996 ?auto_23009 ) ) ( not ( = ?auto_22996 ?auto_23011 ) ) ( not ( = ?auto_22996 ?auto_23016 ) ) ( not ( = ?auto_22996 ?auto_23015 ) ) ( not ( = ?auto_23003 ?auto_23007 ) ) ( not ( = ?auto_23003 ?auto_23010 ) ) ( not ( = ?auto_23003 ?auto_23004 ) ) ( not ( = ?auto_23003 ?auto_23014 ) ) ( not ( = ?auto_23008 ?auto_23013 ) ) ( not ( = ?auto_23008 ?auto_23006 ) ) ( not ( = ?auto_23008 ?auto_23017 ) ) ( not ( = ?auto_23008 ?auto_23005 ) ) ( not ( = ?auto_23012 ?auto_23009 ) ) ( not ( = ?auto_23012 ?auto_23011 ) ) ( not ( = ?auto_23012 ?auto_23016 ) ) ( not ( = ?auto_23012 ?auto_23015 ) ) ( not ( = ?auto_22990 ?auto_22995 ) ) ( not ( = ?auto_22990 ?auto_23001 ) ) ( not ( = ?auto_22991 ?auto_22995 ) ) ( not ( = ?auto_22991 ?auto_23001 ) ) ( not ( = ?auto_22992 ?auto_22995 ) ) ( not ( = ?auto_22992 ?auto_23001 ) ) ( not ( = ?auto_22993 ?auto_22995 ) ) ( not ( = ?auto_22993 ?auto_23001 ) ) ( not ( = ?auto_22994 ?auto_22995 ) ) ( not ( = ?auto_22994 ?auto_23001 ) ) ( not ( = ?auto_22995 ?auto_23012 ) ) ( not ( = ?auto_22995 ?auto_23009 ) ) ( not ( = ?auto_22995 ?auto_23011 ) ) ( not ( = ?auto_22995 ?auto_23016 ) ) ( not ( = ?auto_22995 ?auto_23015 ) ) ( not ( = ?auto_22998 ?auto_23003 ) ) ( not ( = ?auto_22998 ?auto_23007 ) ) ( not ( = ?auto_22998 ?auto_23010 ) ) ( not ( = ?auto_22998 ?auto_23004 ) ) ( not ( = ?auto_22998 ?auto_23014 ) ) ( not ( = ?auto_23000 ?auto_23008 ) ) ( not ( = ?auto_23000 ?auto_23013 ) ) ( not ( = ?auto_23000 ?auto_23006 ) ) ( not ( = ?auto_23000 ?auto_23017 ) ) ( not ( = ?auto_23000 ?auto_23005 ) ) ( not ( = ?auto_23001 ?auto_23012 ) ) ( not ( = ?auto_23001 ?auto_23009 ) ) ( not ( = ?auto_23001 ?auto_23011 ) ) ( not ( = ?auto_23001 ?auto_23016 ) ) ( not ( = ?auto_23001 ?auto_23015 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_22990 ?auto_22991 ?auto_22992 ?auto_22993 ?auto_22994 ?auto_22996 )
      ( MAKE-1CRATE ?auto_22996 ?auto_22995 )
      ( MAKE-6CRATE-VERIFY ?auto_22990 ?auto_22991 ?auto_22992 ?auto_22993 ?auto_22994 ?auto_22996 ?auto_22995 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23020 - SURFACE
      ?auto_23021 - SURFACE
    )
    :vars
    (
      ?auto_23022 - HOIST
      ?auto_23023 - PLACE
      ?auto_23025 - PLACE
      ?auto_23026 - HOIST
      ?auto_23027 - SURFACE
      ?auto_23024 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23022 ?auto_23023 ) ( SURFACE-AT ?auto_23020 ?auto_23023 ) ( CLEAR ?auto_23020 ) ( IS-CRATE ?auto_23021 ) ( AVAILABLE ?auto_23022 ) ( not ( = ?auto_23025 ?auto_23023 ) ) ( HOIST-AT ?auto_23026 ?auto_23025 ) ( AVAILABLE ?auto_23026 ) ( SURFACE-AT ?auto_23021 ?auto_23025 ) ( ON ?auto_23021 ?auto_23027 ) ( CLEAR ?auto_23021 ) ( TRUCK-AT ?auto_23024 ?auto_23023 ) ( not ( = ?auto_23020 ?auto_23021 ) ) ( not ( = ?auto_23020 ?auto_23027 ) ) ( not ( = ?auto_23021 ?auto_23027 ) ) ( not ( = ?auto_23022 ?auto_23026 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23024 ?auto_23023 ?auto_23025 )
      ( !LIFT ?auto_23026 ?auto_23021 ?auto_23027 ?auto_23025 )
      ( !LOAD ?auto_23026 ?auto_23021 ?auto_23024 ?auto_23025 )
      ( !DRIVE ?auto_23024 ?auto_23025 ?auto_23023 )
      ( !UNLOAD ?auto_23022 ?auto_23021 ?auto_23024 ?auto_23023 )
      ( !DROP ?auto_23022 ?auto_23021 ?auto_23020 ?auto_23023 )
      ( MAKE-1CRATE-VERIFY ?auto_23020 ?auto_23021 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_23036 - SURFACE
      ?auto_23037 - SURFACE
      ?auto_23038 - SURFACE
      ?auto_23039 - SURFACE
      ?auto_23040 - SURFACE
      ?auto_23042 - SURFACE
      ?auto_23041 - SURFACE
      ?auto_23043 - SURFACE
    )
    :vars
    (
      ?auto_23048 - HOIST
      ?auto_23044 - PLACE
      ?auto_23045 - PLACE
      ?auto_23046 - HOIST
      ?auto_23049 - SURFACE
      ?auto_23067 - PLACE
      ?auto_23060 - HOIST
      ?auto_23050 - SURFACE
      ?auto_23059 - PLACE
      ?auto_23062 - HOIST
      ?auto_23057 - SURFACE
      ?auto_23054 - PLACE
      ?auto_23056 - HOIST
      ?auto_23061 - SURFACE
      ?auto_23066 - PLACE
      ?auto_23052 - HOIST
      ?auto_23055 - SURFACE
      ?auto_23051 - PLACE
      ?auto_23058 - HOIST
      ?auto_23065 - SURFACE
      ?auto_23063 - PLACE
      ?auto_23053 - HOIST
      ?auto_23064 - SURFACE
      ?auto_23047 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23048 ?auto_23044 ) ( IS-CRATE ?auto_23043 ) ( not ( = ?auto_23045 ?auto_23044 ) ) ( HOIST-AT ?auto_23046 ?auto_23045 ) ( AVAILABLE ?auto_23046 ) ( SURFACE-AT ?auto_23043 ?auto_23045 ) ( ON ?auto_23043 ?auto_23049 ) ( CLEAR ?auto_23043 ) ( not ( = ?auto_23041 ?auto_23043 ) ) ( not ( = ?auto_23041 ?auto_23049 ) ) ( not ( = ?auto_23043 ?auto_23049 ) ) ( not ( = ?auto_23048 ?auto_23046 ) ) ( IS-CRATE ?auto_23041 ) ( not ( = ?auto_23067 ?auto_23044 ) ) ( HOIST-AT ?auto_23060 ?auto_23067 ) ( AVAILABLE ?auto_23060 ) ( SURFACE-AT ?auto_23041 ?auto_23067 ) ( ON ?auto_23041 ?auto_23050 ) ( CLEAR ?auto_23041 ) ( not ( = ?auto_23042 ?auto_23041 ) ) ( not ( = ?auto_23042 ?auto_23050 ) ) ( not ( = ?auto_23041 ?auto_23050 ) ) ( not ( = ?auto_23048 ?auto_23060 ) ) ( IS-CRATE ?auto_23042 ) ( not ( = ?auto_23059 ?auto_23044 ) ) ( HOIST-AT ?auto_23062 ?auto_23059 ) ( AVAILABLE ?auto_23062 ) ( SURFACE-AT ?auto_23042 ?auto_23059 ) ( ON ?auto_23042 ?auto_23057 ) ( CLEAR ?auto_23042 ) ( not ( = ?auto_23040 ?auto_23042 ) ) ( not ( = ?auto_23040 ?auto_23057 ) ) ( not ( = ?auto_23042 ?auto_23057 ) ) ( not ( = ?auto_23048 ?auto_23062 ) ) ( IS-CRATE ?auto_23040 ) ( not ( = ?auto_23054 ?auto_23044 ) ) ( HOIST-AT ?auto_23056 ?auto_23054 ) ( AVAILABLE ?auto_23056 ) ( SURFACE-AT ?auto_23040 ?auto_23054 ) ( ON ?auto_23040 ?auto_23061 ) ( CLEAR ?auto_23040 ) ( not ( = ?auto_23039 ?auto_23040 ) ) ( not ( = ?auto_23039 ?auto_23061 ) ) ( not ( = ?auto_23040 ?auto_23061 ) ) ( not ( = ?auto_23048 ?auto_23056 ) ) ( IS-CRATE ?auto_23039 ) ( not ( = ?auto_23066 ?auto_23044 ) ) ( HOIST-AT ?auto_23052 ?auto_23066 ) ( AVAILABLE ?auto_23052 ) ( SURFACE-AT ?auto_23039 ?auto_23066 ) ( ON ?auto_23039 ?auto_23055 ) ( CLEAR ?auto_23039 ) ( not ( = ?auto_23038 ?auto_23039 ) ) ( not ( = ?auto_23038 ?auto_23055 ) ) ( not ( = ?auto_23039 ?auto_23055 ) ) ( not ( = ?auto_23048 ?auto_23052 ) ) ( IS-CRATE ?auto_23038 ) ( not ( = ?auto_23051 ?auto_23044 ) ) ( HOIST-AT ?auto_23058 ?auto_23051 ) ( AVAILABLE ?auto_23058 ) ( SURFACE-AT ?auto_23038 ?auto_23051 ) ( ON ?auto_23038 ?auto_23065 ) ( CLEAR ?auto_23038 ) ( not ( = ?auto_23037 ?auto_23038 ) ) ( not ( = ?auto_23037 ?auto_23065 ) ) ( not ( = ?auto_23038 ?auto_23065 ) ) ( not ( = ?auto_23048 ?auto_23058 ) ) ( SURFACE-AT ?auto_23036 ?auto_23044 ) ( CLEAR ?auto_23036 ) ( IS-CRATE ?auto_23037 ) ( AVAILABLE ?auto_23048 ) ( not ( = ?auto_23063 ?auto_23044 ) ) ( HOIST-AT ?auto_23053 ?auto_23063 ) ( AVAILABLE ?auto_23053 ) ( SURFACE-AT ?auto_23037 ?auto_23063 ) ( ON ?auto_23037 ?auto_23064 ) ( CLEAR ?auto_23037 ) ( TRUCK-AT ?auto_23047 ?auto_23044 ) ( not ( = ?auto_23036 ?auto_23037 ) ) ( not ( = ?auto_23036 ?auto_23064 ) ) ( not ( = ?auto_23037 ?auto_23064 ) ) ( not ( = ?auto_23048 ?auto_23053 ) ) ( not ( = ?auto_23036 ?auto_23038 ) ) ( not ( = ?auto_23036 ?auto_23065 ) ) ( not ( = ?auto_23038 ?auto_23064 ) ) ( not ( = ?auto_23051 ?auto_23063 ) ) ( not ( = ?auto_23058 ?auto_23053 ) ) ( not ( = ?auto_23065 ?auto_23064 ) ) ( not ( = ?auto_23036 ?auto_23039 ) ) ( not ( = ?auto_23036 ?auto_23055 ) ) ( not ( = ?auto_23037 ?auto_23039 ) ) ( not ( = ?auto_23037 ?auto_23055 ) ) ( not ( = ?auto_23039 ?auto_23065 ) ) ( not ( = ?auto_23039 ?auto_23064 ) ) ( not ( = ?auto_23066 ?auto_23051 ) ) ( not ( = ?auto_23066 ?auto_23063 ) ) ( not ( = ?auto_23052 ?auto_23058 ) ) ( not ( = ?auto_23052 ?auto_23053 ) ) ( not ( = ?auto_23055 ?auto_23065 ) ) ( not ( = ?auto_23055 ?auto_23064 ) ) ( not ( = ?auto_23036 ?auto_23040 ) ) ( not ( = ?auto_23036 ?auto_23061 ) ) ( not ( = ?auto_23037 ?auto_23040 ) ) ( not ( = ?auto_23037 ?auto_23061 ) ) ( not ( = ?auto_23038 ?auto_23040 ) ) ( not ( = ?auto_23038 ?auto_23061 ) ) ( not ( = ?auto_23040 ?auto_23055 ) ) ( not ( = ?auto_23040 ?auto_23065 ) ) ( not ( = ?auto_23040 ?auto_23064 ) ) ( not ( = ?auto_23054 ?auto_23066 ) ) ( not ( = ?auto_23054 ?auto_23051 ) ) ( not ( = ?auto_23054 ?auto_23063 ) ) ( not ( = ?auto_23056 ?auto_23052 ) ) ( not ( = ?auto_23056 ?auto_23058 ) ) ( not ( = ?auto_23056 ?auto_23053 ) ) ( not ( = ?auto_23061 ?auto_23055 ) ) ( not ( = ?auto_23061 ?auto_23065 ) ) ( not ( = ?auto_23061 ?auto_23064 ) ) ( not ( = ?auto_23036 ?auto_23042 ) ) ( not ( = ?auto_23036 ?auto_23057 ) ) ( not ( = ?auto_23037 ?auto_23042 ) ) ( not ( = ?auto_23037 ?auto_23057 ) ) ( not ( = ?auto_23038 ?auto_23042 ) ) ( not ( = ?auto_23038 ?auto_23057 ) ) ( not ( = ?auto_23039 ?auto_23042 ) ) ( not ( = ?auto_23039 ?auto_23057 ) ) ( not ( = ?auto_23042 ?auto_23061 ) ) ( not ( = ?auto_23042 ?auto_23055 ) ) ( not ( = ?auto_23042 ?auto_23065 ) ) ( not ( = ?auto_23042 ?auto_23064 ) ) ( not ( = ?auto_23059 ?auto_23054 ) ) ( not ( = ?auto_23059 ?auto_23066 ) ) ( not ( = ?auto_23059 ?auto_23051 ) ) ( not ( = ?auto_23059 ?auto_23063 ) ) ( not ( = ?auto_23062 ?auto_23056 ) ) ( not ( = ?auto_23062 ?auto_23052 ) ) ( not ( = ?auto_23062 ?auto_23058 ) ) ( not ( = ?auto_23062 ?auto_23053 ) ) ( not ( = ?auto_23057 ?auto_23061 ) ) ( not ( = ?auto_23057 ?auto_23055 ) ) ( not ( = ?auto_23057 ?auto_23065 ) ) ( not ( = ?auto_23057 ?auto_23064 ) ) ( not ( = ?auto_23036 ?auto_23041 ) ) ( not ( = ?auto_23036 ?auto_23050 ) ) ( not ( = ?auto_23037 ?auto_23041 ) ) ( not ( = ?auto_23037 ?auto_23050 ) ) ( not ( = ?auto_23038 ?auto_23041 ) ) ( not ( = ?auto_23038 ?auto_23050 ) ) ( not ( = ?auto_23039 ?auto_23041 ) ) ( not ( = ?auto_23039 ?auto_23050 ) ) ( not ( = ?auto_23040 ?auto_23041 ) ) ( not ( = ?auto_23040 ?auto_23050 ) ) ( not ( = ?auto_23041 ?auto_23057 ) ) ( not ( = ?auto_23041 ?auto_23061 ) ) ( not ( = ?auto_23041 ?auto_23055 ) ) ( not ( = ?auto_23041 ?auto_23065 ) ) ( not ( = ?auto_23041 ?auto_23064 ) ) ( not ( = ?auto_23067 ?auto_23059 ) ) ( not ( = ?auto_23067 ?auto_23054 ) ) ( not ( = ?auto_23067 ?auto_23066 ) ) ( not ( = ?auto_23067 ?auto_23051 ) ) ( not ( = ?auto_23067 ?auto_23063 ) ) ( not ( = ?auto_23060 ?auto_23062 ) ) ( not ( = ?auto_23060 ?auto_23056 ) ) ( not ( = ?auto_23060 ?auto_23052 ) ) ( not ( = ?auto_23060 ?auto_23058 ) ) ( not ( = ?auto_23060 ?auto_23053 ) ) ( not ( = ?auto_23050 ?auto_23057 ) ) ( not ( = ?auto_23050 ?auto_23061 ) ) ( not ( = ?auto_23050 ?auto_23055 ) ) ( not ( = ?auto_23050 ?auto_23065 ) ) ( not ( = ?auto_23050 ?auto_23064 ) ) ( not ( = ?auto_23036 ?auto_23043 ) ) ( not ( = ?auto_23036 ?auto_23049 ) ) ( not ( = ?auto_23037 ?auto_23043 ) ) ( not ( = ?auto_23037 ?auto_23049 ) ) ( not ( = ?auto_23038 ?auto_23043 ) ) ( not ( = ?auto_23038 ?auto_23049 ) ) ( not ( = ?auto_23039 ?auto_23043 ) ) ( not ( = ?auto_23039 ?auto_23049 ) ) ( not ( = ?auto_23040 ?auto_23043 ) ) ( not ( = ?auto_23040 ?auto_23049 ) ) ( not ( = ?auto_23042 ?auto_23043 ) ) ( not ( = ?auto_23042 ?auto_23049 ) ) ( not ( = ?auto_23043 ?auto_23050 ) ) ( not ( = ?auto_23043 ?auto_23057 ) ) ( not ( = ?auto_23043 ?auto_23061 ) ) ( not ( = ?auto_23043 ?auto_23055 ) ) ( not ( = ?auto_23043 ?auto_23065 ) ) ( not ( = ?auto_23043 ?auto_23064 ) ) ( not ( = ?auto_23045 ?auto_23067 ) ) ( not ( = ?auto_23045 ?auto_23059 ) ) ( not ( = ?auto_23045 ?auto_23054 ) ) ( not ( = ?auto_23045 ?auto_23066 ) ) ( not ( = ?auto_23045 ?auto_23051 ) ) ( not ( = ?auto_23045 ?auto_23063 ) ) ( not ( = ?auto_23046 ?auto_23060 ) ) ( not ( = ?auto_23046 ?auto_23062 ) ) ( not ( = ?auto_23046 ?auto_23056 ) ) ( not ( = ?auto_23046 ?auto_23052 ) ) ( not ( = ?auto_23046 ?auto_23058 ) ) ( not ( = ?auto_23046 ?auto_23053 ) ) ( not ( = ?auto_23049 ?auto_23050 ) ) ( not ( = ?auto_23049 ?auto_23057 ) ) ( not ( = ?auto_23049 ?auto_23061 ) ) ( not ( = ?auto_23049 ?auto_23055 ) ) ( not ( = ?auto_23049 ?auto_23065 ) ) ( not ( = ?auto_23049 ?auto_23064 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_23036 ?auto_23037 ?auto_23038 ?auto_23039 ?auto_23040 ?auto_23042 ?auto_23041 )
      ( MAKE-1CRATE ?auto_23041 ?auto_23043 )
      ( MAKE-7CRATE-VERIFY ?auto_23036 ?auto_23037 ?auto_23038 ?auto_23039 ?auto_23040 ?auto_23042 ?auto_23041 ?auto_23043 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23070 - SURFACE
      ?auto_23071 - SURFACE
    )
    :vars
    (
      ?auto_23072 - HOIST
      ?auto_23073 - PLACE
      ?auto_23075 - PLACE
      ?auto_23076 - HOIST
      ?auto_23077 - SURFACE
      ?auto_23074 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23072 ?auto_23073 ) ( SURFACE-AT ?auto_23070 ?auto_23073 ) ( CLEAR ?auto_23070 ) ( IS-CRATE ?auto_23071 ) ( AVAILABLE ?auto_23072 ) ( not ( = ?auto_23075 ?auto_23073 ) ) ( HOIST-AT ?auto_23076 ?auto_23075 ) ( AVAILABLE ?auto_23076 ) ( SURFACE-AT ?auto_23071 ?auto_23075 ) ( ON ?auto_23071 ?auto_23077 ) ( CLEAR ?auto_23071 ) ( TRUCK-AT ?auto_23074 ?auto_23073 ) ( not ( = ?auto_23070 ?auto_23071 ) ) ( not ( = ?auto_23070 ?auto_23077 ) ) ( not ( = ?auto_23071 ?auto_23077 ) ) ( not ( = ?auto_23072 ?auto_23076 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23074 ?auto_23073 ?auto_23075 )
      ( !LIFT ?auto_23076 ?auto_23071 ?auto_23077 ?auto_23075 )
      ( !LOAD ?auto_23076 ?auto_23071 ?auto_23074 ?auto_23075 )
      ( !DRIVE ?auto_23074 ?auto_23075 ?auto_23073 )
      ( !UNLOAD ?auto_23072 ?auto_23071 ?auto_23074 ?auto_23073 )
      ( !DROP ?auto_23072 ?auto_23071 ?auto_23070 ?auto_23073 )
      ( MAKE-1CRATE-VERIFY ?auto_23070 ?auto_23071 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_23087 - SURFACE
      ?auto_23088 - SURFACE
      ?auto_23089 - SURFACE
      ?auto_23090 - SURFACE
      ?auto_23091 - SURFACE
      ?auto_23093 - SURFACE
      ?auto_23092 - SURFACE
      ?auto_23095 - SURFACE
      ?auto_23094 - SURFACE
    )
    :vars
    (
      ?auto_23100 - HOIST
      ?auto_23099 - PLACE
      ?auto_23097 - PLACE
      ?auto_23096 - HOIST
      ?auto_23098 - SURFACE
      ?auto_23119 - PLACE
      ?auto_23108 - HOIST
      ?auto_23118 - SURFACE
      ?auto_23109 - PLACE
      ?auto_23120 - HOIST
      ?auto_23110 - SURFACE
      ?auto_23121 - PLACE
      ?auto_23102 - HOIST
      ?auto_23104 - SURFACE
      ?auto_23107 - PLACE
      ?auto_23105 - HOIST
      ?auto_23122 - SURFACE
      ?auto_23113 - PLACE
      ?auto_23115 - HOIST
      ?auto_23106 - SURFACE
      ?auto_23116 - PLACE
      ?auto_23112 - HOIST
      ?auto_23111 - SURFACE
      ?auto_23103 - PLACE
      ?auto_23117 - HOIST
      ?auto_23114 - SURFACE
      ?auto_23101 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23100 ?auto_23099 ) ( IS-CRATE ?auto_23094 ) ( not ( = ?auto_23097 ?auto_23099 ) ) ( HOIST-AT ?auto_23096 ?auto_23097 ) ( AVAILABLE ?auto_23096 ) ( SURFACE-AT ?auto_23094 ?auto_23097 ) ( ON ?auto_23094 ?auto_23098 ) ( CLEAR ?auto_23094 ) ( not ( = ?auto_23095 ?auto_23094 ) ) ( not ( = ?auto_23095 ?auto_23098 ) ) ( not ( = ?auto_23094 ?auto_23098 ) ) ( not ( = ?auto_23100 ?auto_23096 ) ) ( IS-CRATE ?auto_23095 ) ( not ( = ?auto_23119 ?auto_23099 ) ) ( HOIST-AT ?auto_23108 ?auto_23119 ) ( AVAILABLE ?auto_23108 ) ( SURFACE-AT ?auto_23095 ?auto_23119 ) ( ON ?auto_23095 ?auto_23118 ) ( CLEAR ?auto_23095 ) ( not ( = ?auto_23092 ?auto_23095 ) ) ( not ( = ?auto_23092 ?auto_23118 ) ) ( not ( = ?auto_23095 ?auto_23118 ) ) ( not ( = ?auto_23100 ?auto_23108 ) ) ( IS-CRATE ?auto_23092 ) ( not ( = ?auto_23109 ?auto_23099 ) ) ( HOIST-AT ?auto_23120 ?auto_23109 ) ( AVAILABLE ?auto_23120 ) ( SURFACE-AT ?auto_23092 ?auto_23109 ) ( ON ?auto_23092 ?auto_23110 ) ( CLEAR ?auto_23092 ) ( not ( = ?auto_23093 ?auto_23092 ) ) ( not ( = ?auto_23093 ?auto_23110 ) ) ( not ( = ?auto_23092 ?auto_23110 ) ) ( not ( = ?auto_23100 ?auto_23120 ) ) ( IS-CRATE ?auto_23093 ) ( not ( = ?auto_23121 ?auto_23099 ) ) ( HOIST-AT ?auto_23102 ?auto_23121 ) ( AVAILABLE ?auto_23102 ) ( SURFACE-AT ?auto_23093 ?auto_23121 ) ( ON ?auto_23093 ?auto_23104 ) ( CLEAR ?auto_23093 ) ( not ( = ?auto_23091 ?auto_23093 ) ) ( not ( = ?auto_23091 ?auto_23104 ) ) ( not ( = ?auto_23093 ?auto_23104 ) ) ( not ( = ?auto_23100 ?auto_23102 ) ) ( IS-CRATE ?auto_23091 ) ( not ( = ?auto_23107 ?auto_23099 ) ) ( HOIST-AT ?auto_23105 ?auto_23107 ) ( AVAILABLE ?auto_23105 ) ( SURFACE-AT ?auto_23091 ?auto_23107 ) ( ON ?auto_23091 ?auto_23122 ) ( CLEAR ?auto_23091 ) ( not ( = ?auto_23090 ?auto_23091 ) ) ( not ( = ?auto_23090 ?auto_23122 ) ) ( not ( = ?auto_23091 ?auto_23122 ) ) ( not ( = ?auto_23100 ?auto_23105 ) ) ( IS-CRATE ?auto_23090 ) ( not ( = ?auto_23113 ?auto_23099 ) ) ( HOIST-AT ?auto_23115 ?auto_23113 ) ( AVAILABLE ?auto_23115 ) ( SURFACE-AT ?auto_23090 ?auto_23113 ) ( ON ?auto_23090 ?auto_23106 ) ( CLEAR ?auto_23090 ) ( not ( = ?auto_23089 ?auto_23090 ) ) ( not ( = ?auto_23089 ?auto_23106 ) ) ( not ( = ?auto_23090 ?auto_23106 ) ) ( not ( = ?auto_23100 ?auto_23115 ) ) ( IS-CRATE ?auto_23089 ) ( not ( = ?auto_23116 ?auto_23099 ) ) ( HOIST-AT ?auto_23112 ?auto_23116 ) ( AVAILABLE ?auto_23112 ) ( SURFACE-AT ?auto_23089 ?auto_23116 ) ( ON ?auto_23089 ?auto_23111 ) ( CLEAR ?auto_23089 ) ( not ( = ?auto_23088 ?auto_23089 ) ) ( not ( = ?auto_23088 ?auto_23111 ) ) ( not ( = ?auto_23089 ?auto_23111 ) ) ( not ( = ?auto_23100 ?auto_23112 ) ) ( SURFACE-AT ?auto_23087 ?auto_23099 ) ( CLEAR ?auto_23087 ) ( IS-CRATE ?auto_23088 ) ( AVAILABLE ?auto_23100 ) ( not ( = ?auto_23103 ?auto_23099 ) ) ( HOIST-AT ?auto_23117 ?auto_23103 ) ( AVAILABLE ?auto_23117 ) ( SURFACE-AT ?auto_23088 ?auto_23103 ) ( ON ?auto_23088 ?auto_23114 ) ( CLEAR ?auto_23088 ) ( TRUCK-AT ?auto_23101 ?auto_23099 ) ( not ( = ?auto_23087 ?auto_23088 ) ) ( not ( = ?auto_23087 ?auto_23114 ) ) ( not ( = ?auto_23088 ?auto_23114 ) ) ( not ( = ?auto_23100 ?auto_23117 ) ) ( not ( = ?auto_23087 ?auto_23089 ) ) ( not ( = ?auto_23087 ?auto_23111 ) ) ( not ( = ?auto_23089 ?auto_23114 ) ) ( not ( = ?auto_23116 ?auto_23103 ) ) ( not ( = ?auto_23112 ?auto_23117 ) ) ( not ( = ?auto_23111 ?auto_23114 ) ) ( not ( = ?auto_23087 ?auto_23090 ) ) ( not ( = ?auto_23087 ?auto_23106 ) ) ( not ( = ?auto_23088 ?auto_23090 ) ) ( not ( = ?auto_23088 ?auto_23106 ) ) ( not ( = ?auto_23090 ?auto_23111 ) ) ( not ( = ?auto_23090 ?auto_23114 ) ) ( not ( = ?auto_23113 ?auto_23116 ) ) ( not ( = ?auto_23113 ?auto_23103 ) ) ( not ( = ?auto_23115 ?auto_23112 ) ) ( not ( = ?auto_23115 ?auto_23117 ) ) ( not ( = ?auto_23106 ?auto_23111 ) ) ( not ( = ?auto_23106 ?auto_23114 ) ) ( not ( = ?auto_23087 ?auto_23091 ) ) ( not ( = ?auto_23087 ?auto_23122 ) ) ( not ( = ?auto_23088 ?auto_23091 ) ) ( not ( = ?auto_23088 ?auto_23122 ) ) ( not ( = ?auto_23089 ?auto_23091 ) ) ( not ( = ?auto_23089 ?auto_23122 ) ) ( not ( = ?auto_23091 ?auto_23106 ) ) ( not ( = ?auto_23091 ?auto_23111 ) ) ( not ( = ?auto_23091 ?auto_23114 ) ) ( not ( = ?auto_23107 ?auto_23113 ) ) ( not ( = ?auto_23107 ?auto_23116 ) ) ( not ( = ?auto_23107 ?auto_23103 ) ) ( not ( = ?auto_23105 ?auto_23115 ) ) ( not ( = ?auto_23105 ?auto_23112 ) ) ( not ( = ?auto_23105 ?auto_23117 ) ) ( not ( = ?auto_23122 ?auto_23106 ) ) ( not ( = ?auto_23122 ?auto_23111 ) ) ( not ( = ?auto_23122 ?auto_23114 ) ) ( not ( = ?auto_23087 ?auto_23093 ) ) ( not ( = ?auto_23087 ?auto_23104 ) ) ( not ( = ?auto_23088 ?auto_23093 ) ) ( not ( = ?auto_23088 ?auto_23104 ) ) ( not ( = ?auto_23089 ?auto_23093 ) ) ( not ( = ?auto_23089 ?auto_23104 ) ) ( not ( = ?auto_23090 ?auto_23093 ) ) ( not ( = ?auto_23090 ?auto_23104 ) ) ( not ( = ?auto_23093 ?auto_23122 ) ) ( not ( = ?auto_23093 ?auto_23106 ) ) ( not ( = ?auto_23093 ?auto_23111 ) ) ( not ( = ?auto_23093 ?auto_23114 ) ) ( not ( = ?auto_23121 ?auto_23107 ) ) ( not ( = ?auto_23121 ?auto_23113 ) ) ( not ( = ?auto_23121 ?auto_23116 ) ) ( not ( = ?auto_23121 ?auto_23103 ) ) ( not ( = ?auto_23102 ?auto_23105 ) ) ( not ( = ?auto_23102 ?auto_23115 ) ) ( not ( = ?auto_23102 ?auto_23112 ) ) ( not ( = ?auto_23102 ?auto_23117 ) ) ( not ( = ?auto_23104 ?auto_23122 ) ) ( not ( = ?auto_23104 ?auto_23106 ) ) ( not ( = ?auto_23104 ?auto_23111 ) ) ( not ( = ?auto_23104 ?auto_23114 ) ) ( not ( = ?auto_23087 ?auto_23092 ) ) ( not ( = ?auto_23087 ?auto_23110 ) ) ( not ( = ?auto_23088 ?auto_23092 ) ) ( not ( = ?auto_23088 ?auto_23110 ) ) ( not ( = ?auto_23089 ?auto_23092 ) ) ( not ( = ?auto_23089 ?auto_23110 ) ) ( not ( = ?auto_23090 ?auto_23092 ) ) ( not ( = ?auto_23090 ?auto_23110 ) ) ( not ( = ?auto_23091 ?auto_23092 ) ) ( not ( = ?auto_23091 ?auto_23110 ) ) ( not ( = ?auto_23092 ?auto_23104 ) ) ( not ( = ?auto_23092 ?auto_23122 ) ) ( not ( = ?auto_23092 ?auto_23106 ) ) ( not ( = ?auto_23092 ?auto_23111 ) ) ( not ( = ?auto_23092 ?auto_23114 ) ) ( not ( = ?auto_23109 ?auto_23121 ) ) ( not ( = ?auto_23109 ?auto_23107 ) ) ( not ( = ?auto_23109 ?auto_23113 ) ) ( not ( = ?auto_23109 ?auto_23116 ) ) ( not ( = ?auto_23109 ?auto_23103 ) ) ( not ( = ?auto_23120 ?auto_23102 ) ) ( not ( = ?auto_23120 ?auto_23105 ) ) ( not ( = ?auto_23120 ?auto_23115 ) ) ( not ( = ?auto_23120 ?auto_23112 ) ) ( not ( = ?auto_23120 ?auto_23117 ) ) ( not ( = ?auto_23110 ?auto_23104 ) ) ( not ( = ?auto_23110 ?auto_23122 ) ) ( not ( = ?auto_23110 ?auto_23106 ) ) ( not ( = ?auto_23110 ?auto_23111 ) ) ( not ( = ?auto_23110 ?auto_23114 ) ) ( not ( = ?auto_23087 ?auto_23095 ) ) ( not ( = ?auto_23087 ?auto_23118 ) ) ( not ( = ?auto_23088 ?auto_23095 ) ) ( not ( = ?auto_23088 ?auto_23118 ) ) ( not ( = ?auto_23089 ?auto_23095 ) ) ( not ( = ?auto_23089 ?auto_23118 ) ) ( not ( = ?auto_23090 ?auto_23095 ) ) ( not ( = ?auto_23090 ?auto_23118 ) ) ( not ( = ?auto_23091 ?auto_23095 ) ) ( not ( = ?auto_23091 ?auto_23118 ) ) ( not ( = ?auto_23093 ?auto_23095 ) ) ( not ( = ?auto_23093 ?auto_23118 ) ) ( not ( = ?auto_23095 ?auto_23110 ) ) ( not ( = ?auto_23095 ?auto_23104 ) ) ( not ( = ?auto_23095 ?auto_23122 ) ) ( not ( = ?auto_23095 ?auto_23106 ) ) ( not ( = ?auto_23095 ?auto_23111 ) ) ( not ( = ?auto_23095 ?auto_23114 ) ) ( not ( = ?auto_23119 ?auto_23109 ) ) ( not ( = ?auto_23119 ?auto_23121 ) ) ( not ( = ?auto_23119 ?auto_23107 ) ) ( not ( = ?auto_23119 ?auto_23113 ) ) ( not ( = ?auto_23119 ?auto_23116 ) ) ( not ( = ?auto_23119 ?auto_23103 ) ) ( not ( = ?auto_23108 ?auto_23120 ) ) ( not ( = ?auto_23108 ?auto_23102 ) ) ( not ( = ?auto_23108 ?auto_23105 ) ) ( not ( = ?auto_23108 ?auto_23115 ) ) ( not ( = ?auto_23108 ?auto_23112 ) ) ( not ( = ?auto_23108 ?auto_23117 ) ) ( not ( = ?auto_23118 ?auto_23110 ) ) ( not ( = ?auto_23118 ?auto_23104 ) ) ( not ( = ?auto_23118 ?auto_23122 ) ) ( not ( = ?auto_23118 ?auto_23106 ) ) ( not ( = ?auto_23118 ?auto_23111 ) ) ( not ( = ?auto_23118 ?auto_23114 ) ) ( not ( = ?auto_23087 ?auto_23094 ) ) ( not ( = ?auto_23087 ?auto_23098 ) ) ( not ( = ?auto_23088 ?auto_23094 ) ) ( not ( = ?auto_23088 ?auto_23098 ) ) ( not ( = ?auto_23089 ?auto_23094 ) ) ( not ( = ?auto_23089 ?auto_23098 ) ) ( not ( = ?auto_23090 ?auto_23094 ) ) ( not ( = ?auto_23090 ?auto_23098 ) ) ( not ( = ?auto_23091 ?auto_23094 ) ) ( not ( = ?auto_23091 ?auto_23098 ) ) ( not ( = ?auto_23093 ?auto_23094 ) ) ( not ( = ?auto_23093 ?auto_23098 ) ) ( not ( = ?auto_23092 ?auto_23094 ) ) ( not ( = ?auto_23092 ?auto_23098 ) ) ( not ( = ?auto_23094 ?auto_23118 ) ) ( not ( = ?auto_23094 ?auto_23110 ) ) ( not ( = ?auto_23094 ?auto_23104 ) ) ( not ( = ?auto_23094 ?auto_23122 ) ) ( not ( = ?auto_23094 ?auto_23106 ) ) ( not ( = ?auto_23094 ?auto_23111 ) ) ( not ( = ?auto_23094 ?auto_23114 ) ) ( not ( = ?auto_23097 ?auto_23119 ) ) ( not ( = ?auto_23097 ?auto_23109 ) ) ( not ( = ?auto_23097 ?auto_23121 ) ) ( not ( = ?auto_23097 ?auto_23107 ) ) ( not ( = ?auto_23097 ?auto_23113 ) ) ( not ( = ?auto_23097 ?auto_23116 ) ) ( not ( = ?auto_23097 ?auto_23103 ) ) ( not ( = ?auto_23096 ?auto_23108 ) ) ( not ( = ?auto_23096 ?auto_23120 ) ) ( not ( = ?auto_23096 ?auto_23102 ) ) ( not ( = ?auto_23096 ?auto_23105 ) ) ( not ( = ?auto_23096 ?auto_23115 ) ) ( not ( = ?auto_23096 ?auto_23112 ) ) ( not ( = ?auto_23096 ?auto_23117 ) ) ( not ( = ?auto_23098 ?auto_23118 ) ) ( not ( = ?auto_23098 ?auto_23110 ) ) ( not ( = ?auto_23098 ?auto_23104 ) ) ( not ( = ?auto_23098 ?auto_23122 ) ) ( not ( = ?auto_23098 ?auto_23106 ) ) ( not ( = ?auto_23098 ?auto_23111 ) ) ( not ( = ?auto_23098 ?auto_23114 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_23087 ?auto_23088 ?auto_23089 ?auto_23090 ?auto_23091 ?auto_23093 ?auto_23092 ?auto_23095 )
      ( MAKE-1CRATE ?auto_23095 ?auto_23094 )
      ( MAKE-8CRATE-VERIFY ?auto_23087 ?auto_23088 ?auto_23089 ?auto_23090 ?auto_23091 ?auto_23093 ?auto_23092 ?auto_23095 ?auto_23094 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23125 - SURFACE
      ?auto_23126 - SURFACE
    )
    :vars
    (
      ?auto_23127 - HOIST
      ?auto_23128 - PLACE
      ?auto_23130 - PLACE
      ?auto_23131 - HOIST
      ?auto_23132 - SURFACE
      ?auto_23129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23127 ?auto_23128 ) ( SURFACE-AT ?auto_23125 ?auto_23128 ) ( CLEAR ?auto_23125 ) ( IS-CRATE ?auto_23126 ) ( AVAILABLE ?auto_23127 ) ( not ( = ?auto_23130 ?auto_23128 ) ) ( HOIST-AT ?auto_23131 ?auto_23130 ) ( AVAILABLE ?auto_23131 ) ( SURFACE-AT ?auto_23126 ?auto_23130 ) ( ON ?auto_23126 ?auto_23132 ) ( CLEAR ?auto_23126 ) ( TRUCK-AT ?auto_23129 ?auto_23128 ) ( not ( = ?auto_23125 ?auto_23126 ) ) ( not ( = ?auto_23125 ?auto_23132 ) ) ( not ( = ?auto_23126 ?auto_23132 ) ) ( not ( = ?auto_23127 ?auto_23131 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23129 ?auto_23128 ?auto_23130 )
      ( !LIFT ?auto_23131 ?auto_23126 ?auto_23132 ?auto_23130 )
      ( !LOAD ?auto_23131 ?auto_23126 ?auto_23129 ?auto_23130 )
      ( !DRIVE ?auto_23129 ?auto_23130 ?auto_23128 )
      ( !UNLOAD ?auto_23127 ?auto_23126 ?auto_23129 ?auto_23128 )
      ( !DROP ?auto_23127 ?auto_23126 ?auto_23125 ?auto_23128 )
      ( MAKE-1CRATE-VERIFY ?auto_23125 ?auto_23126 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_23143 - SURFACE
      ?auto_23144 - SURFACE
      ?auto_23145 - SURFACE
      ?auto_23146 - SURFACE
      ?auto_23147 - SURFACE
      ?auto_23150 - SURFACE
      ?auto_23148 - SURFACE
      ?auto_23152 - SURFACE
      ?auto_23151 - SURFACE
      ?auto_23149 - SURFACE
    )
    :vars
    (
      ?auto_23154 - HOIST
      ?auto_23156 - PLACE
      ?auto_23155 - PLACE
      ?auto_23153 - HOIST
      ?auto_23157 - SURFACE
      ?auto_23159 - PLACE
      ?auto_23182 - HOIST
      ?auto_23161 - SURFACE
      ?auto_23162 - PLACE
      ?auto_23180 - HOIST
      ?auto_23164 - SURFACE
      ?auto_23175 - PLACE
      ?auto_23165 - HOIST
      ?auto_23169 - SURFACE
      ?auto_23167 - PLACE
      ?auto_23163 - HOIST
      ?auto_23160 - SURFACE
      ?auto_23181 - PLACE
      ?auto_23178 - HOIST
      ?auto_23166 - SURFACE
      ?auto_23172 - PLACE
      ?auto_23174 - HOIST
      ?auto_23179 - SURFACE
      ?auto_23176 - PLACE
      ?auto_23170 - HOIST
      ?auto_23171 - SURFACE
      ?auto_23177 - PLACE
      ?auto_23168 - HOIST
      ?auto_23173 - SURFACE
      ?auto_23158 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23154 ?auto_23156 ) ( IS-CRATE ?auto_23149 ) ( not ( = ?auto_23155 ?auto_23156 ) ) ( HOIST-AT ?auto_23153 ?auto_23155 ) ( AVAILABLE ?auto_23153 ) ( SURFACE-AT ?auto_23149 ?auto_23155 ) ( ON ?auto_23149 ?auto_23157 ) ( CLEAR ?auto_23149 ) ( not ( = ?auto_23151 ?auto_23149 ) ) ( not ( = ?auto_23151 ?auto_23157 ) ) ( not ( = ?auto_23149 ?auto_23157 ) ) ( not ( = ?auto_23154 ?auto_23153 ) ) ( IS-CRATE ?auto_23151 ) ( not ( = ?auto_23159 ?auto_23156 ) ) ( HOIST-AT ?auto_23182 ?auto_23159 ) ( AVAILABLE ?auto_23182 ) ( SURFACE-AT ?auto_23151 ?auto_23159 ) ( ON ?auto_23151 ?auto_23161 ) ( CLEAR ?auto_23151 ) ( not ( = ?auto_23152 ?auto_23151 ) ) ( not ( = ?auto_23152 ?auto_23161 ) ) ( not ( = ?auto_23151 ?auto_23161 ) ) ( not ( = ?auto_23154 ?auto_23182 ) ) ( IS-CRATE ?auto_23152 ) ( not ( = ?auto_23162 ?auto_23156 ) ) ( HOIST-AT ?auto_23180 ?auto_23162 ) ( AVAILABLE ?auto_23180 ) ( SURFACE-AT ?auto_23152 ?auto_23162 ) ( ON ?auto_23152 ?auto_23164 ) ( CLEAR ?auto_23152 ) ( not ( = ?auto_23148 ?auto_23152 ) ) ( not ( = ?auto_23148 ?auto_23164 ) ) ( not ( = ?auto_23152 ?auto_23164 ) ) ( not ( = ?auto_23154 ?auto_23180 ) ) ( IS-CRATE ?auto_23148 ) ( not ( = ?auto_23175 ?auto_23156 ) ) ( HOIST-AT ?auto_23165 ?auto_23175 ) ( AVAILABLE ?auto_23165 ) ( SURFACE-AT ?auto_23148 ?auto_23175 ) ( ON ?auto_23148 ?auto_23169 ) ( CLEAR ?auto_23148 ) ( not ( = ?auto_23150 ?auto_23148 ) ) ( not ( = ?auto_23150 ?auto_23169 ) ) ( not ( = ?auto_23148 ?auto_23169 ) ) ( not ( = ?auto_23154 ?auto_23165 ) ) ( IS-CRATE ?auto_23150 ) ( not ( = ?auto_23167 ?auto_23156 ) ) ( HOIST-AT ?auto_23163 ?auto_23167 ) ( AVAILABLE ?auto_23163 ) ( SURFACE-AT ?auto_23150 ?auto_23167 ) ( ON ?auto_23150 ?auto_23160 ) ( CLEAR ?auto_23150 ) ( not ( = ?auto_23147 ?auto_23150 ) ) ( not ( = ?auto_23147 ?auto_23160 ) ) ( not ( = ?auto_23150 ?auto_23160 ) ) ( not ( = ?auto_23154 ?auto_23163 ) ) ( IS-CRATE ?auto_23147 ) ( not ( = ?auto_23181 ?auto_23156 ) ) ( HOIST-AT ?auto_23178 ?auto_23181 ) ( AVAILABLE ?auto_23178 ) ( SURFACE-AT ?auto_23147 ?auto_23181 ) ( ON ?auto_23147 ?auto_23166 ) ( CLEAR ?auto_23147 ) ( not ( = ?auto_23146 ?auto_23147 ) ) ( not ( = ?auto_23146 ?auto_23166 ) ) ( not ( = ?auto_23147 ?auto_23166 ) ) ( not ( = ?auto_23154 ?auto_23178 ) ) ( IS-CRATE ?auto_23146 ) ( not ( = ?auto_23172 ?auto_23156 ) ) ( HOIST-AT ?auto_23174 ?auto_23172 ) ( AVAILABLE ?auto_23174 ) ( SURFACE-AT ?auto_23146 ?auto_23172 ) ( ON ?auto_23146 ?auto_23179 ) ( CLEAR ?auto_23146 ) ( not ( = ?auto_23145 ?auto_23146 ) ) ( not ( = ?auto_23145 ?auto_23179 ) ) ( not ( = ?auto_23146 ?auto_23179 ) ) ( not ( = ?auto_23154 ?auto_23174 ) ) ( IS-CRATE ?auto_23145 ) ( not ( = ?auto_23176 ?auto_23156 ) ) ( HOIST-AT ?auto_23170 ?auto_23176 ) ( AVAILABLE ?auto_23170 ) ( SURFACE-AT ?auto_23145 ?auto_23176 ) ( ON ?auto_23145 ?auto_23171 ) ( CLEAR ?auto_23145 ) ( not ( = ?auto_23144 ?auto_23145 ) ) ( not ( = ?auto_23144 ?auto_23171 ) ) ( not ( = ?auto_23145 ?auto_23171 ) ) ( not ( = ?auto_23154 ?auto_23170 ) ) ( SURFACE-AT ?auto_23143 ?auto_23156 ) ( CLEAR ?auto_23143 ) ( IS-CRATE ?auto_23144 ) ( AVAILABLE ?auto_23154 ) ( not ( = ?auto_23177 ?auto_23156 ) ) ( HOIST-AT ?auto_23168 ?auto_23177 ) ( AVAILABLE ?auto_23168 ) ( SURFACE-AT ?auto_23144 ?auto_23177 ) ( ON ?auto_23144 ?auto_23173 ) ( CLEAR ?auto_23144 ) ( TRUCK-AT ?auto_23158 ?auto_23156 ) ( not ( = ?auto_23143 ?auto_23144 ) ) ( not ( = ?auto_23143 ?auto_23173 ) ) ( not ( = ?auto_23144 ?auto_23173 ) ) ( not ( = ?auto_23154 ?auto_23168 ) ) ( not ( = ?auto_23143 ?auto_23145 ) ) ( not ( = ?auto_23143 ?auto_23171 ) ) ( not ( = ?auto_23145 ?auto_23173 ) ) ( not ( = ?auto_23176 ?auto_23177 ) ) ( not ( = ?auto_23170 ?auto_23168 ) ) ( not ( = ?auto_23171 ?auto_23173 ) ) ( not ( = ?auto_23143 ?auto_23146 ) ) ( not ( = ?auto_23143 ?auto_23179 ) ) ( not ( = ?auto_23144 ?auto_23146 ) ) ( not ( = ?auto_23144 ?auto_23179 ) ) ( not ( = ?auto_23146 ?auto_23171 ) ) ( not ( = ?auto_23146 ?auto_23173 ) ) ( not ( = ?auto_23172 ?auto_23176 ) ) ( not ( = ?auto_23172 ?auto_23177 ) ) ( not ( = ?auto_23174 ?auto_23170 ) ) ( not ( = ?auto_23174 ?auto_23168 ) ) ( not ( = ?auto_23179 ?auto_23171 ) ) ( not ( = ?auto_23179 ?auto_23173 ) ) ( not ( = ?auto_23143 ?auto_23147 ) ) ( not ( = ?auto_23143 ?auto_23166 ) ) ( not ( = ?auto_23144 ?auto_23147 ) ) ( not ( = ?auto_23144 ?auto_23166 ) ) ( not ( = ?auto_23145 ?auto_23147 ) ) ( not ( = ?auto_23145 ?auto_23166 ) ) ( not ( = ?auto_23147 ?auto_23179 ) ) ( not ( = ?auto_23147 ?auto_23171 ) ) ( not ( = ?auto_23147 ?auto_23173 ) ) ( not ( = ?auto_23181 ?auto_23172 ) ) ( not ( = ?auto_23181 ?auto_23176 ) ) ( not ( = ?auto_23181 ?auto_23177 ) ) ( not ( = ?auto_23178 ?auto_23174 ) ) ( not ( = ?auto_23178 ?auto_23170 ) ) ( not ( = ?auto_23178 ?auto_23168 ) ) ( not ( = ?auto_23166 ?auto_23179 ) ) ( not ( = ?auto_23166 ?auto_23171 ) ) ( not ( = ?auto_23166 ?auto_23173 ) ) ( not ( = ?auto_23143 ?auto_23150 ) ) ( not ( = ?auto_23143 ?auto_23160 ) ) ( not ( = ?auto_23144 ?auto_23150 ) ) ( not ( = ?auto_23144 ?auto_23160 ) ) ( not ( = ?auto_23145 ?auto_23150 ) ) ( not ( = ?auto_23145 ?auto_23160 ) ) ( not ( = ?auto_23146 ?auto_23150 ) ) ( not ( = ?auto_23146 ?auto_23160 ) ) ( not ( = ?auto_23150 ?auto_23166 ) ) ( not ( = ?auto_23150 ?auto_23179 ) ) ( not ( = ?auto_23150 ?auto_23171 ) ) ( not ( = ?auto_23150 ?auto_23173 ) ) ( not ( = ?auto_23167 ?auto_23181 ) ) ( not ( = ?auto_23167 ?auto_23172 ) ) ( not ( = ?auto_23167 ?auto_23176 ) ) ( not ( = ?auto_23167 ?auto_23177 ) ) ( not ( = ?auto_23163 ?auto_23178 ) ) ( not ( = ?auto_23163 ?auto_23174 ) ) ( not ( = ?auto_23163 ?auto_23170 ) ) ( not ( = ?auto_23163 ?auto_23168 ) ) ( not ( = ?auto_23160 ?auto_23166 ) ) ( not ( = ?auto_23160 ?auto_23179 ) ) ( not ( = ?auto_23160 ?auto_23171 ) ) ( not ( = ?auto_23160 ?auto_23173 ) ) ( not ( = ?auto_23143 ?auto_23148 ) ) ( not ( = ?auto_23143 ?auto_23169 ) ) ( not ( = ?auto_23144 ?auto_23148 ) ) ( not ( = ?auto_23144 ?auto_23169 ) ) ( not ( = ?auto_23145 ?auto_23148 ) ) ( not ( = ?auto_23145 ?auto_23169 ) ) ( not ( = ?auto_23146 ?auto_23148 ) ) ( not ( = ?auto_23146 ?auto_23169 ) ) ( not ( = ?auto_23147 ?auto_23148 ) ) ( not ( = ?auto_23147 ?auto_23169 ) ) ( not ( = ?auto_23148 ?auto_23160 ) ) ( not ( = ?auto_23148 ?auto_23166 ) ) ( not ( = ?auto_23148 ?auto_23179 ) ) ( not ( = ?auto_23148 ?auto_23171 ) ) ( not ( = ?auto_23148 ?auto_23173 ) ) ( not ( = ?auto_23175 ?auto_23167 ) ) ( not ( = ?auto_23175 ?auto_23181 ) ) ( not ( = ?auto_23175 ?auto_23172 ) ) ( not ( = ?auto_23175 ?auto_23176 ) ) ( not ( = ?auto_23175 ?auto_23177 ) ) ( not ( = ?auto_23165 ?auto_23163 ) ) ( not ( = ?auto_23165 ?auto_23178 ) ) ( not ( = ?auto_23165 ?auto_23174 ) ) ( not ( = ?auto_23165 ?auto_23170 ) ) ( not ( = ?auto_23165 ?auto_23168 ) ) ( not ( = ?auto_23169 ?auto_23160 ) ) ( not ( = ?auto_23169 ?auto_23166 ) ) ( not ( = ?auto_23169 ?auto_23179 ) ) ( not ( = ?auto_23169 ?auto_23171 ) ) ( not ( = ?auto_23169 ?auto_23173 ) ) ( not ( = ?auto_23143 ?auto_23152 ) ) ( not ( = ?auto_23143 ?auto_23164 ) ) ( not ( = ?auto_23144 ?auto_23152 ) ) ( not ( = ?auto_23144 ?auto_23164 ) ) ( not ( = ?auto_23145 ?auto_23152 ) ) ( not ( = ?auto_23145 ?auto_23164 ) ) ( not ( = ?auto_23146 ?auto_23152 ) ) ( not ( = ?auto_23146 ?auto_23164 ) ) ( not ( = ?auto_23147 ?auto_23152 ) ) ( not ( = ?auto_23147 ?auto_23164 ) ) ( not ( = ?auto_23150 ?auto_23152 ) ) ( not ( = ?auto_23150 ?auto_23164 ) ) ( not ( = ?auto_23152 ?auto_23169 ) ) ( not ( = ?auto_23152 ?auto_23160 ) ) ( not ( = ?auto_23152 ?auto_23166 ) ) ( not ( = ?auto_23152 ?auto_23179 ) ) ( not ( = ?auto_23152 ?auto_23171 ) ) ( not ( = ?auto_23152 ?auto_23173 ) ) ( not ( = ?auto_23162 ?auto_23175 ) ) ( not ( = ?auto_23162 ?auto_23167 ) ) ( not ( = ?auto_23162 ?auto_23181 ) ) ( not ( = ?auto_23162 ?auto_23172 ) ) ( not ( = ?auto_23162 ?auto_23176 ) ) ( not ( = ?auto_23162 ?auto_23177 ) ) ( not ( = ?auto_23180 ?auto_23165 ) ) ( not ( = ?auto_23180 ?auto_23163 ) ) ( not ( = ?auto_23180 ?auto_23178 ) ) ( not ( = ?auto_23180 ?auto_23174 ) ) ( not ( = ?auto_23180 ?auto_23170 ) ) ( not ( = ?auto_23180 ?auto_23168 ) ) ( not ( = ?auto_23164 ?auto_23169 ) ) ( not ( = ?auto_23164 ?auto_23160 ) ) ( not ( = ?auto_23164 ?auto_23166 ) ) ( not ( = ?auto_23164 ?auto_23179 ) ) ( not ( = ?auto_23164 ?auto_23171 ) ) ( not ( = ?auto_23164 ?auto_23173 ) ) ( not ( = ?auto_23143 ?auto_23151 ) ) ( not ( = ?auto_23143 ?auto_23161 ) ) ( not ( = ?auto_23144 ?auto_23151 ) ) ( not ( = ?auto_23144 ?auto_23161 ) ) ( not ( = ?auto_23145 ?auto_23151 ) ) ( not ( = ?auto_23145 ?auto_23161 ) ) ( not ( = ?auto_23146 ?auto_23151 ) ) ( not ( = ?auto_23146 ?auto_23161 ) ) ( not ( = ?auto_23147 ?auto_23151 ) ) ( not ( = ?auto_23147 ?auto_23161 ) ) ( not ( = ?auto_23150 ?auto_23151 ) ) ( not ( = ?auto_23150 ?auto_23161 ) ) ( not ( = ?auto_23148 ?auto_23151 ) ) ( not ( = ?auto_23148 ?auto_23161 ) ) ( not ( = ?auto_23151 ?auto_23164 ) ) ( not ( = ?auto_23151 ?auto_23169 ) ) ( not ( = ?auto_23151 ?auto_23160 ) ) ( not ( = ?auto_23151 ?auto_23166 ) ) ( not ( = ?auto_23151 ?auto_23179 ) ) ( not ( = ?auto_23151 ?auto_23171 ) ) ( not ( = ?auto_23151 ?auto_23173 ) ) ( not ( = ?auto_23159 ?auto_23162 ) ) ( not ( = ?auto_23159 ?auto_23175 ) ) ( not ( = ?auto_23159 ?auto_23167 ) ) ( not ( = ?auto_23159 ?auto_23181 ) ) ( not ( = ?auto_23159 ?auto_23172 ) ) ( not ( = ?auto_23159 ?auto_23176 ) ) ( not ( = ?auto_23159 ?auto_23177 ) ) ( not ( = ?auto_23182 ?auto_23180 ) ) ( not ( = ?auto_23182 ?auto_23165 ) ) ( not ( = ?auto_23182 ?auto_23163 ) ) ( not ( = ?auto_23182 ?auto_23178 ) ) ( not ( = ?auto_23182 ?auto_23174 ) ) ( not ( = ?auto_23182 ?auto_23170 ) ) ( not ( = ?auto_23182 ?auto_23168 ) ) ( not ( = ?auto_23161 ?auto_23164 ) ) ( not ( = ?auto_23161 ?auto_23169 ) ) ( not ( = ?auto_23161 ?auto_23160 ) ) ( not ( = ?auto_23161 ?auto_23166 ) ) ( not ( = ?auto_23161 ?auto_23179 ) ) ( not ( = ?auto_23161 ?auto_23171 ) ) ( not ( = ?auto_23161 ?auto_23173 ) ) ( not ( = ?auto_23143 ?auto_23149 ) ) ( not ( = ?auto_23143 ?auto_23157 ) ) ( not ( = ?auto_23144 ?auto_23149 ) ) ( not ( = ?auto_23144 ?auto_23157 ) ) ( not ( = ?auto_23145 ?auto_23149 ) ) ( not ( = ?auto_23145 ?auto_23157 ) ) ( not ( = ?auto_23146 ?auto_23149 ) ) ( not ( = ?auto_23146 ?auto_23157 ) ) ( not ( = ?auto_23147 ?auto_23149 ) ) ( not ( = ?auto_23147 ?auto_23157 ) ) ( not ( = ?auto_23150 ?auto_23149 ) ) ( not ( = ?auto_23150 ?auto_23157 ) ) ( not ( = ?auto_23148 ?auto_23149 ) ) ( not ( = ?auto_23148 ?auto_23157 ) ) ( not ( = ?auto_23152 ?auto_23149 ) ) ( not ( = ?auto_23152 ?auto_23157 ) ) ( not ( = ?auto_23149 ?auto_23161 ) ) ( not ( = ?auto_23149 ?auto_23164 ) ) ( not ( = ?auto_23149 ?auto_23169 ) ) ( not ( = ?auto_23149 ?auto_23160 ) ) ( not ( = ?auto_23149 ?auto_23166 ) ) ( not ( = ?auto_23149 ?auto_23179 ) ) ( not ( = ?auto_23149 ?auto_23171 ) ) ( not ( = ?auto_23149 ?auto_23173 ) ) ( not ( = ?auto_23155 ?auto_23159 ) ) ( not ( = ?auto_23155 ?auto_23162 ) ) ( not ( = ?auto_23155 ?auto_23175 ) ) ( not ( = ?auto_23155 ?auto_23167 ) ) ( not ( = ?auto_23155 ?auto_23181 ) ) ( not ( = ?auto_23155 ?auto_23172 ) ) ( not ( = ?auto_23155 ?auto_23176 ) ) ( not ( = ?auto_23155 ?auto_23177 ) ) ( not ( = ?auto_23153 ?auto_23182 ) ) ( not ( = ?auto_23153 ?auto_23180 ) ) ( not ( = ?auto_23153 ?auto_23165 ) ) ( not ( = ?auto_23153 ?auto_23163 ) ) ( not ( = ?auto_23153 ?auto_23178 ) ) ( not ( = ?auto_23153 ?auto_23174 ) ) ( not ( = ?auto_23153 ?auto_23170 ) ) ( not ( = ?auto_23153 ?auto_23168 ) ) ( not ( = ?auto_23157 ?auto_23161 ) ) ( not ( = ?auto_23157 ?auto_23164 ) ) ( not ( = ?auto_23157 ?auto_23169 ) ) ( not ( = ?auto_23157 ?auto_23160 ) ) ( not ( = ?auto_23157 ?auto_23166 ) ) ( not ( = ?auto_23157 ?auto_23179 ) ) ( not ( = ?auto_23157 ?auto_23171 ) ) ( not ( = ?auto_23157 ?auto_23173 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_23143 ?auto_23144 ?auto_23145 ?auto_23146 ?auto_23147 ?auto_23150 ?auto_23148 ?auto_23152 ?auto_23151 )
      ( MAKE-1CRATE ?auto_23151 ?auto_23149 )
      ( MAKE-9CRATE-VERIFY ?auto_23143 ?auto_23144 ?auto_23145 ?auto_23146 ?auto_23147 ?auto_23150 ?auto_23148 ?auto_23152 ?auto_23151 ?auto_23149 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23185 - SURFACE
      ?auto_23186 - SURFACE
    )
    :vars
    (
      ?auto_23187 - HOIST
      ?auto_23188 - PLACE
      ?auto_23190 - PLACE
      ?auto_23191 - HOIST
      ?auto_23192 - SURFACE
      ?auto_23189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23187 ?auto_23188 ) ( SURFACE-AT ?auto_23185 ?auto_23188 ) ( CLEAR ?auto_23185 ) ( IS-CRATE ?auto_23186 ) ( AVAILABLE ?auto_23187 ) ( not ( = ?auto_23190 ?auto_23188 ) ) ( HOIST-AT ?auto_23191 ?auto_23190 ) ( AVAILABLE ?auto_23191 ) ( SURFACE-AT ?auto_23186 ?auto_23190 ) ( ON ?auto_23186 ?auto_23192 ) ( CLEAR ?auto_23186 ) ( TRUCK-AT ?auto_23189 ?auto_23188 ) ( not ( = ?auto_23185 ?auto_23186 ) ) ( not ( = ?auto_23185 ?auto_23192 ) ) ( not ( = ?auto_23186 ?auto_23192 ) ) ( not ( = ?auto_23187 ?auto_23191 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23189 ?auto_23188 ?auto_23190 )
      ( !LIFT ?auto_23191 ?auto_23186 ?auto_23192 ?auto_23190 )
      ( !LOAD ?auto_23191 ?auto_23186 ?auto_23189 ?auto_23190 )
      ( !DRIVE ?auto_23189 ?auto_23190 ?auto_23188 )
      ( !UNLOAD ?auto_23187 ?auto_23186 ?auto_23189 ?auto_23188 )
      ( !DROP ?auto_23187 ?auto_23186 ?auto_23185 ?auto_23188 )
      ( MAKE-1CRATE-VERIFY ?auto_23185 ?auto_23186 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_23204 - SURFACE
      ?auto_23205 - SURFACE
      ?auto_23206 - SURFACE
      ?auto_23207 - SURFACE
      ?auto_23208 - SURFACE
      ?auto_23211 - SURFACE
      ?auto_23209 - SURFACE
      ?auto_23213 - SURFACE
      ?auto_23212 - SURFACE
      ?auto_23210 - SURFACE
      ?auto_23214 - SURFACE
    )
    :vars
    (
      ?auto_23219 - HOIST
      ?auto_23217 - PLACE
      ?auto_23218 - PLACE
      ?auto_23220 - HOIST
      ?auto_23216 - SURFACE
      ?auto_23221 - PLACE
      ?auto_23234 - HOIST
      ?auto_23244 - SURFACE
      ?auto_23233 - PLACE
      ?auto_23232 - HOIST
      ?auto_23241 - SURFACE
      ?auto_23238 - PLACE
      ?auto_23235 - HOIST
      ?auto_23225 - SURFACE
      ?auto_23242 - PLACE
      ?auto_23226 - HOIST
      ?auto_23240 - SURFACE
      ?auto_23236 - PLACE
      ?auto_23224 - HOIST
      ?auto_23223 - SURFACE
      ?auto_23227 - SURFACE
      ?auto_23229 - PLACE
      ?auto_23243 - HOIST
      ?auto_23228 - SURFACE
      ?auto_23239 - PLACE
      ?auto_23222 - HOIST
      ?auto_23237 - SURFACE
      ?auto_23231 - PLACE
      ?auto_23230 - HOIST
      ?auto_23245 - SURFACE
      ?auto_23215 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23219 ?auto_23217 ) ( IS-CRATE ?auto_23214 ) ( not ( = ?auto_23218 ?auto_23217 ) ) ( HOIST-AT ?auto_23220 ?auto_23218 ) ( SURFACE-AT ?auto_23214 ?auto_23218 ) ( ON ?auto_23214 ?auto_23216 ) ( CLEAR ?auto_23214 ) ( not ( = ?auto_23210 ?auto_23214 ) ) ( not ( = ?auto_23210 ?auto_23216 ) ) ( not ( = ?auto_23214 ?auto_23216 ) ) ( not ( = ?auto_23219 ?auto_23220 ) ) ( IS-CRATE ?auto_23210 ) ( not ( = ?auto_23221 ?auto_23217 ) ) ( HOIST-AT ?auto_23234 ?auto_23221 ) ( AVAILABLE ?auto_23234 ) ( SURFACE-AT ?auto_23210 ?auto_23221 ) ( ON ?auto_23210 ?auto_23244 ) ( CLEAR ?auto_23210 ) ( not ( = ?auto_23212 ?auto_23210 ) ) ( not ( = ?auto_23212 ?auto_23244 ) ) ( not ( = ?auto_23210 ?auto_23244 ) ) ( not ( = ?auto_23219 ?auto_23234 ) ) ( IS-CRATE ?auto_23212 ) ( not ( = ?auto_23233 ?auto_23217 ) ) ( HOIST-AT ?auto_23232 ?auto_23233 ) ( AVAILABLE ?auto_23232 ) ( SURFACE-AT ?auto_23212 ?auto_23233 ) ( ON ?auto_23212 ?auto_23241 ) ( CLEAR ?auto_23212 ) ( not ( = ?auto_23213 ?auto_23212 ) ) ( not ( = ?auto_23213 ?auto_23241 ) ) ( not ( = ?auto_23212 ?auto_23241 ) ) ( not ( = ?auto_23219 ?auto_23232 ) ) ( IS-CRATE ?auto_23213 ) ( not ( = ?auto_23238 ?auto_23217 ) ) ( HOIST-AT ?auto_23235 ?auto_23238 ) ( AVAILABLE ?auto_23235 ) ( SURFACE-AT ?auto_23213 ?auto_23238 ) ( ON ?auto_23213 ?auto_23225 ) ( CLEAR ?auto_23213 ) ( not ( = ?auto_23209 ?auto_23213 ) ) ( not ( = ?auto_23209 ?auto_23225 ) ) ( not ( = ?auto_23213 ?auto_23225 ) ) ( not ( = ?auto_23219 ?auto_23235 ) ) ( IS-CRATE ?auto_23209 ) ( not ( = ?auto_23242 ?auto_23217 ) ) ( HOIST-AT ?auto_23226 ?auto_23242 ) ( AVAILABLE ?auto_23226 ) ( SURFACE-AT ?auto_23209 ?auto_23242 ) ( ON ?auto_23209 ?auto_23240 ) ( CLEAR ?auto_23209 ) ( not ( = ?auto_23211 ?auto_23209 ) ) ( not ( = ?auto_23211 ?auto_23240 ) ) ( not ( = ?auto_23209 ?auto_23240 ) ) ( not ( = ?auto_23219 ?auto_23226 ) ) ( IS-CRATE ?auto_23211 ) ( not ( = ?auto_23236 ?auto_23217 ) ) ( HOIST-AT ?auto_23224 ?auto_23236 ) ( AVAILABLE ?auto_23224 ) ( SURFACE-AT ?auto_23211 ?auto_23236 ) ( ON ?auto_23211 ?auto_23223 ) ( CLEAR ?auto_23211 ) ( not ( = ?auto_23208 ?auto_23211 ) ) ( not ( = ?auto_23208 ?auto_23223 ) ) ( not ( = ?auto_23211 ?auto_23223 ) ) ( not ( = ?auto_23219 ?auto_23224 ) ) ( IS-CRATE ?auto_23208 ) ( AVAILABLE ?auto_23220 ) ( SURFACE-AT ?auto_23208 ?auto_23218 ) ( ON ?auto_23208 ?auto_23227 ) ( CLEAR ?auto_23208 ) ( not ( = ?auto_23207 ?auto_23208 ) ) ( not ( = ?auto_23207 ?auto_23227 ) ) ( not ( = ?auto_23208 ?auto_23227 ) ) ( IS-CRATE ?auto_23207 ) ( not ( = ?auto_23229 ?auto_23217 ) ) ( HOIST-AT ?auto_23243 ?auto_23229 ) ( AVAILABLE ?auto_23243 ) ( SURFACE-AT ?auto_23207 ?auto_23229 ) ( ON ?auto_23207 ?auto_23228 ) ( CLEAR ?auto_23207 ) ( not ( = ?auto_23206 ?auto_23207 ) ) ( not ( = ?auto_23206 ?auto_23228 ) ) ( not ( = ?auto_23207 ?auto_23228 ) ) ( not ( = ?auto_23219 ?auto_23243 ) ) ( IS-CRATE ?auto_23206 ) ( not ( = ?auto_23239 ?auto_23217 ) ) ( HOIST-AT ?auto_23222 ?auto_23239 ) ( AVAILABLE ?auto_23222 ) ( SURFACE-AT ?auto_23206 ?auto_23239 ) ( ON ?auto_23206 ?auto_23237 ) ( CLEAR ?auto_23206 ) ( not ( = ?auto_23205 ?auto_23206 ) ) ( not ( = ?auto_23205 ?auto_23237 ) ) ( not ( = ?auto_23206 ?auto_23237 ) ) ( not ( = ?auto_23219 ?auto_23222 ) ) ( SURFACE-AT ?auto_23204 ?auto_23217 ) ( CLEAR ?auto_23204 ) ( IS-CRATE ?auto_23205 ) ( AVAILABLE ?auto_23219 ) ( not ( = ?auto_23231 ?auto_23217 ) ) ( HOIST-AT ?auto_23230 ?auto_23231 ) ( AVAILABLE ?auto_23230 ) ( SURFACE-AT ?auto_23205 ?auto_23231 ) ( ON ?auto_23205 ?auto_23245 ) ( CLEAR ?auto_23205 ) ( TRUCK-AT ?auto_23215 ?auto_23217 ) ( not ( = ?auto_23204 ?auto_23205 ) ) ( not ( = ?auto_23204 ?auto_23245 ) ) ( not ( = ?auto_23205 ?auto_23245 ) ) ( not ( = ?auto_23219 ?auto_23230 ) ) ( not ( = ?auto_23204 ?auto_23206 ) ) ( not ( = ?auto_23204 ?auto_23237 ) ) ( not ( = ?auto_23206 ?auto_23245 ) ) ( not ( = ?auto_23239 ?auto_23231 ) ) ( not ( = ?auto_23222 ?auto_23230 ) ) ( not ( = ?auto_23237 ?auto_23245 ) ) ( not ( = ?auto_23204 ?auto_23207 ) ) ( not ( = ?auto_23204 ?auto_23228 ) ) ( not ( = ?auto_23205 ?auto_23207 ) ) ( not ( = ?auto_23205 ?auto_23228 ) ) ( not ( = ?auto_23207 ?auto_23237 ) ) ( not ( = ?auto_23207 ?auto_23245 ) ) ( not ( = ?auto_23229 ?auto_23239 ) ) ( not ( = ?auto_23229 ?auto_23231 ) ) ( not ( = ?auto_23243 ?auto_23222 ) ) ( not ( = ?auto_23243 ?auto_23230 ) ) ( not ( = ?auto_23228 ?auto_23237 ) ) ( not ( = ?auto_23228 ?auto_23245 ) ) ( not ( = ?auto_23204 ?auto_23208 ) ) ( not ( = ?auto_23204 ?auto_23227 ) ) ( not ( = ?auto_23205 ?auto_23208 ) ) ( not ( = ?auto_23205 ?auto_23227 ) ) ( not ( = ?auto_23206 ?auto_23208 ) ) ( not ( = ?auto_23206 ?auto_23227 ) ) ( not ( = ?auto_23208 ?auto_23228 ) ) ( not ( = ?auto_23208 ?auto_23237 ) ) ( not ( = ?auto_23208 ?auto_23245 ) ) ( not ( = ?auto_23218 ?auto_23229 ) ) ( not ( = ?auto_23218 ?auto_23239 ) ) ( not ( = ?auto_23218 ?auto_23231 ) ) ( not ( = ?auto_23220 ?auto_23243 ) ) ( not ( = ?auto_23220 ?auto_23222 ) ) ( not ( = ?auto_23220 ?auto_23230 ) ) ( not ( = ?auto_23227 ?auto_23228 ) ) ( not ( = ?auto_23227 ?auto_23237 ) ) ( not ( = ?auto_23227 ?auto_23245 ) ) ( not ( = ?auto_23204 ?auto_23211 ) ) ( not ( = ?auto_23204 ?auto_23223 ) ) ( not ( = ?auto_23205 ?auto_23211 ) ) ( not ( = ?auto_23205 ?auto_23223 ) ) ( not ( = ?auto_23206 ?auto_23211 ) ) ( not ( = ?auto_23206 ?auto_23223 ) ) ( not ( = ?auto_23207 ?auto_23211 ) ) ( not ( = ?auto_23207 ?auto_23223 ) ) ( not ( = ?auto_23211 ?auto_23227 ) ) ( not ( = ?auto_23211 ?auto_23228 ) ) ( not ( = ?auto_23211 ?auto_23237 ) ) ( not ( = ?auto_23211 ?auto_23245 ) ) ( not ( = ?auto_23236 ?auto_23218 ) ) ( not ( = ?auto_23236 ?auto_23229 ) ) ( not ( = ?auto_23236 ?auto_23239 ) ) ( not ( = ?auto_23236 ?auto_23231 ) ) ( not ( = ?auto_23224 ?auto_23220 ) ) ( not ( = ?auto_23224 ?auto_23243 ) ) ( not ( = ?auto_23224 ?auto_23222 ) ) ( not ( = ?auto_23224 ?auto_23230 ) ) ( not ( = ?auto_23223 ?auto_23227 ) ) ( not ( = ?auto_23223 ?auto_23228 ) ) ( not ( = ?auto_23223 ?auto_23237 ) ) ( not ( = ?auto_23223 ?auto_23245 ) ) ( not ( = ?auto_23204 ?auto_23209 ) ) ( not ( = ?auto_23204 ?auto_23240 ) ) ( not ( = ?auto_23205 ?auto_23209 ) ) ( not ( = ?auto_23205 ?auto_23240 ) ) ( not ( = ?auto_23206 ?auto_23209 ) ) ( not ( = ?auto_23206 ?auto_23240 ) ) ( not ( = ?auto_23207 ?auto_23209 ) ) ( not ( = ?auto_23207 ?auto_23240 ) ) ( not ( = ?auto_23208 ?auto_23209 ) ) ( not ( = ?auto_23208 ?auto_23240 ) ) ( not ( = ?auto_23209 ?auto_23223 ) ) ( not ( = ?auto_23209 ?auto_23227 ) ) ( not ( = ?auto_23209 ?auto_23228 ) ) ( not ( = ?auto_23209 ?auto_23237 ) ) ( not ( = ?auto_23209 ?auto_23245 ) ) ( not ( = ?auto_23242 ?auto_23236 ) ) ( not ( = ?auto_23242 ?auto_23218 ) ) ( not ( = ?auto_23242 ?auto_23229 ) ) ( not ( = ?auto_23242 ?auto_23239 ) ) ( not ( = ?auto_23242 ?auto_23231 ) ) ( not ( = ?auto_23226 ?auto_23224 ) ) ( not ( = ?auto_23226 ?auto_23220 ) ) ( not ( = ?auto_23226 ?auto_23243 ) ) ( not ( = ?auto_23226 ?auto_23222 ) ) ( not ( = ?auto_23226 ?auto_23230 ) ) ( not ( = ?auto_23240 ?auto_23223 ) ) ( not ( = ?auto_23240 ?auto_23227 ) ) ( not ( = ?auto_23240 ?auto_23228 ) ) ( not ( = ?auto_23240 ?auto_23237 ) ) ( not ( = ?auto_23240 ?auto_23245 ) ) ( not ( = ?auto_23204 ?auto_23213 ) ) ( not ( = ?auto_23204 ?auto_23225 ) ) ( not ( = ?auto_23205 ?auto_23213 ) ) ( not ( = ?auto_23205 ?auto_23225 ) ) ( not ( = ?auto_23206 ?auto_23213 ) ) ( not ( = ?auto_23206 ?auto_23225 ) ) ( not ( = ?auto_23207 ?auto_23213 ) ) ( not ( = ?auto_23207 ?auto_23225 ) ) ( not ( = ?auto_23208 ?auto_23213 ) ) ( not ( = ?auto_23208 ?auto_23225 ) ) ( not ( = ?auto_23211 ?auto_23213 ) ) ( not ( = ?auto_23211 ?auto_23225 ) ) ( not ( = ?auto_23213 ?auto_23240 ) ) ( not ( = ?auto_23213 ?auto_23223 ) ) ( not ( = ?auto_23213 ?auto_23227 ) ) ( not ( = ?auto_23213 ?auto_23228 ) ) ( not ( = ?auto_23213 ?auto_23237 ) ) ( not ( = ?auto_23213 ?auto_23245 ) ) ( not ( = ?auto_23238 ?auto_23242 ) ) ( not ( = ?auto_23238 ?auto_23236 ) ) ( not ( = ?auto_23238 ?auto_23218 ) ) ( not ( = ?auto_23238 ?auto_23229 ) ) ( not ( = ?auto_23238 ?auto_23239 ) ) ( not ( = ?auto_23238 ?auto_23231 ) ) ( not ( = ?auto_23235 ?auto_23226 ) ) ( not ( = ?auto_23235 ?auto_23224 ) ) ( not ( = ?auto_23235 ?auto_23220 ) ) ( not ( = ?auto_23235 ?auto_23243 ) ) ( not ( = ?auto_23235 ?auto_23222 ) ) ( not ( = ?auto_23235 ?auto_23230 ) ) ( not ( = ?auto_23225 ?auto_23240 ) ) ( not ( = ?auto_23225 ?auto_23223 ) ) ( not ( = ?auto_23225 ?auto_23227 ) ) ( not ( = ?auto_23225 ?auto_23228 ) ) ( not ( = ?auto_23225 ?auto_23237 ) ) ( not ( = ?auto_23225 ?auto_23245 ) ) ( not ( = ?auto_23204 ?auto_23212 ) ) ( not ( = ?auto_23204 ?auto_23241 ) ) ( not ( = ?auto_23205 ?auto_23212 ) ) ( not ( = ?auto_23205 ?auto_23241 ) ) ( not ( = ?auto_23206 ?auto_23212 ) ) ( not ( = ?auto_23206 ?auto_23241 ) ) ( not ( = ?auto_23207 ?auto_23212 ) ) ( not ( = ?auto_23207 ?auto_23241 ) ) ( not ( = ?auto_23208 ?auto_23212 ) ) ( not ( = ?auto_23208 ?auto_23241 ) ) ( not ( = ?auto_23211 ?auto_23212 ) ) ( not ( = ?auto_23211 ?auto_23241 ) ) ( not ( = ?auto_23209 ?auto_23212 ) ) ( not ( = ?auto_23209 ?auto_23241 ) ) ( not ( = ?auto_23212 ?auto_23225 ) ) ( not ( = ?auto_23212 ?auto_23240 ) ) ( not ( = ?auto_23212 ?auto_23223 ) ) ( not ( = ?auto_23212 ?auto_23227 ) ) ( not ( = ?auto_23212 ?auto_23228 ) ) ( not ( = ?auto_23212 ?auto_23237 ) ) ( not ( = ?auto_23212 ?auto_23245 ) ) ( not ( = ?auto_23233 ?auto_23238 ) ) ( not ( = ?auto_23233 ?auto_23242 ) ) ( not ( = ?auto_23233 ?auto_23236 ) ) ( not ( = ?auto_23233 ?auto_23218 ) ) ( not ( = ?auto_23233 ?auto_23229 ) ) ( not ( = ?auto_23233 ?auto_23239 ) ) ( not ( = ?auto_23233 ?auto_23231 ) ) ( not ( = ?auto_23232 ?auto_23235 ) ) ( not ( = ?auto_23232 ?auto_23226 ) ) ( not ( = ?auto_23232 ?auto_23224 ) ) ( not ( = ?auto_23232 ?auto_23220 ) ) ( not ( = ?auto_23232 ?auto_23243 ) ) ( not ( = ?auto_23232 ?auto_23222 ) ) ( not ( = ?auto_23232 ?auto_23230 ) ) ( not ( = ?auto_23241 ?auto_23225 ) ) ( not ( = ?auto_23241 ?auto_23240 ) ) ( not ( = ?auto_23241 ?auto_23223 ) ) ( not ( = ?auto_23241 ?auto_23227 ) ) ( not ( = ?auto_23241 ?auto_23228 ) ) ( not ( = ?auto_23241 ?auto_23237 ) ) ( not ( = ?auto_23241 ?auto_23245 ) ) ( not ( = ?auto_23204 ?auto_23210 ) ) ( not ( = ?auto_23204 ?auto_23244 ) ) ( not ( = ?auto_23205 ?auto_23210 ) ) ( not ( = ?auto_23205 ?auto_23244 ) ) ( not ( = ?auto_23206 ?auto_23210 ) ) ( not ( = ?auto_23206 ?auto_23244 ) ) ( not ( = ?auto_23207 ?auto_23210 ) ) ( not ( = ?auto_23207 ?auto_23244 ) ) ( not ( = ?auto_23208 ?auto_23210 ) ) ( not ( = ?auto_23208 ?auto_23244 ) ) ( not ( = ?auto_23211 ?auto_23210 ) ) ( not ( = ?auto_23211 ?auto_23244 ) ) ( not ( = ?auto_23209 ?auto_23210 ) ) ( not ( = ?auto_23209 ?auto_23244 ) ) ( not ( = ?auto_23213 ?auto_23210 ) ) ( not ( = ?auto_23213 ?auto_23244 ) ) ( not ( = ?auto_23210 ?auto_23241 ) ) ( not ( = ?auto_23210 ?auto_23225 ) ) ( not ( = ?auto_23210 ?auto_23240 ) ) ( not ( = ?auto_23210 ?auto_23223 ) ) ( not ( = ?auto_23210 ?auto_23227 ) ) ( not ( = ?auto_23210 ?auto_23228 ) ) ( not ( = ?auto_23210 ?auto_23237 ) ) ( not ( = ?auto_23210 ?auto_23245 ) ) ( not ( = ?auto_23221 ?auto_23233 ) ) ( not ( = ?auto_23221 ?auto_23238 ) ) ( not ( = ?auto_23221 ?auto_23242 ) ) ( not ( = ?auto_23221 ?auto_23236 ) ) ( not ( = ?auto_23221 ?auto_23218 ) ) ( not ( = ?auto_23221 ?auto_23229 ) ) ( not ( = ?auto_23221 ?auto_23239 ) ) ( not ( = ?auto_23221 ?auto_23231 ) ) ( not ( = ?auto_23234 ?auto_23232 ) ) ( not ( = ?auto_23234 ?auto_23235 ) ) ( not ( = ?auto_23234 ?auto_23226 ) ) ( not ( = ?auto_23234 ?auto_23224 ) ) ( not ( = ?auto_23234 ?auto_23220 ) ) ( not ( = ?auto_23234 ?auto_23243 ) ) ( not ( = ?auto_23234 ?auto_23222 ) ) ( not ( = ?auto_23234 ?auto_23230 ) ) ( not ( = ?auto_23244 ?auto_23241 ) ) ( not ( = ?auto_23244 ?auto_23225 ) ) ( not ( = ?auto_23244 ?auto_23240 ) ) ( not ( = ?auto_23244 ?auto_23223 ) ) ( not ( = ?auto_23244 ?auto_23227 ) ) ( not ( = ?auto_23244 ?auto_23228 ) ) ( not ( = ?auto_23244 ?auto_23237 ) ) ( not ( = ?auto_23244 ?auto_23245 ) ) ( not ( = ?auto_23204 ?auto_23214 ) ) ( not ( = ?auto_23204 ?auto_23216 ) ) ( not ( = ?auto_23205 ?auto_23214 ) ) ( not ( = ?auto_23205 ?auto_23216 ) ) ( not ( = ?auto_23206 ?auto_23214 ) ) ( not ( = ?auto_23206 ?auto_23216 ) ) ( not ( = ?auto_23207 ?auto_23214 ) ) ( not ( = ?auto_23207 ?auto_23216 ) ) ( not ( = ?auto_23208 ?auto_23214 ) ) ( not ( = ?auto_23208 ?auto_23216 ) ) ( not ( = ?auto_23211 ?auto_23214 ) ) ( not ( = ?auto_23211 ?auto_23216 ) ) ( not ( = ?auto_23209 ?auto_23214 ) ) ( not ( = ?auto_23209 ?auto_23216 ) ) ( not ( = ?auto_23213 ?auto_23214 ) ) ( not ( = ?auto_23213 ?auto_23216 ) ) ( not ( = ?auto_23212 ?auto_23214 ) ) ( not ( = ?auto_23212 ?auto_23216 ) ) ( not ( = ?auto_23214 ?auto_23244 ) ) ( not ( = ?auto_23214 ?auto_23241 ) ) ( not ( = ?auto_23214 ?auto_23225 ) ) ( not ( = ?auto_23214 ?auto_23240 ) ) ( not ( = ?auto_23214 ?auto_23223 ) ) ( not ( = ?auto_23214 ?auto_23227 ) ) ( not ( = ?auto_23214 ?auto_23228 ) ) ( not ( = ?auto_23214 ?auto_23237 ) ) ( not ( = ?auto_23214 ?auto_23245 ) ) ( not ( = ?auto_23216 ?auto_23244 ) ) ( not ( = ?auto_23216 ?auto_23241 ) ) ( not ( = ?auto_23216 ?auto_23225 ) ) ( not ( = ?auto_23216 ?auto_23240 ) ) ( not ( = ?auto_23216 ?auto_23223 ) ) ( not ( = ?auto_23216 ?auto_23227 ) ) ( not ( = ?auto_23216 ?auto_23228 ) ) ( not ( = ?auto_23216 ?auto_23237 ) ) ( not ( = ?auto_23216 ?auto_23245 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_23204 ?auto_23205 ?auto_23206 ?auto_23207 ?auto_23208 ?auto_23211 ?auto_23209 ?auto_23213 ?auto_23212 ?auto_23210 )
      ( MAKE-1CRATE ?auto_23210 ?auto_23214 )
      ( MAKE-10CRATE-VERIFY ?auto_23204 ?auto_23205 ?auto_23206 ?auto_23207 ?auto_23208 ?auto_23211 ?auto_23209 ?auto_23213 ?auto_23212 ?auto_23210 ?auto_23214 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23248 - SURFACE
      ?auto_23249 - SURFACE
    )
    :vars
    (
      ?auto_23250 - HOIST
      ?auto_23251 - PLACE
      ?auto_23253 - PLACE
      ?auto_23254 - HOIST
      ?auto_23255 - SURFACE
      ?auto_23252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23250 ?auto_23251 ) ( SURFACE-AT ?auto_23248 ?auto_23251 ) ( CLEAR ?auto_23248 ) ( IS-CRATE ?auto_23249 ) ( AVAILABLE ?auto_23250 ) ( not ( = ?auto_23253 ?auto_23251 ) ) ( HOIST-AT ?auto_23254 ?auto_23253 ) ( AVAILABLE ?auto_23254 ) ( SURFACE-AT ?auto_23249 ?auto_23253 ) ( ON ?auto_23249 ?auto_23255 ) ( CLEAR ?auto_23249 ) ( TRUCK-AT ?auto_23252 ?auto_23251 ) ( not ( = ?auto_23248 ?auto_23249 ) ) ( not ( = ?auto_23248 ?auto_23255 ) ) ( not ( = ?auto_23249 ?auto_23255 ) ) ( not ( = ?auto_23250 ?auto_23254 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23252 ?auto_23251 ?auto_23253 )
      ( !LIFT ?auto_23254 ?auto_23249 ?auto_23255 ?auto_23253 )
      ( !LOAD ?auto_23254 ?auto_23249 ?auto_23252 ?auto_23253 )
      ( !DRIVE ?auto_23252 ?auto_23253 ?auto_23251 )
      ( !UNLOAD ?auto_23250 ?auto_23249 ?auto_23252 ?auto_23251 )
      ( !DROP ?auto_23250 ?auto_23249 ?auto_23248 ?auto_23251 )
      ( MAKE-1CRATE-VERIFY ?auto_23248 ?auto_23249 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_23268 - SURFACE
      ?auto_23269 - SURFACE
      ?auto_23270 - SURFACE
      ?auto_23271 - SURFACE
      ?auto_23272 - SURFACE
      ?auto_23275 - SURFACE
      ?auto_23273 - SURFACE
      ?auto_23277 - SURFACE
      ?auto_23276 - SURFACE
      ?auto_23274 - SURFACE
      ?auto_23279 - SURFACE
      ?auto_23278 - SURFACE
    )
    :vars
    (
      ?auto_23281 - HOIST
      ?auto_23283 - PLACE
      ?auto_23285 - PLACE
      ?auto_23282 - HOIST
      ?auto_23284 - SURFACE
      ?auto_23304 - PLACE
      ?auto_23301 - HOIST
      ?auto_23312 - SURFACE
      ?auto_23309 - PLACE
      ?auto_23303 - HOIST
      ?auto_23295 - SURFACE
      ?auto_23302 - PLACE
      ?auto_23286 - HOIST
      ?auto_23293 - SURFACE
      ?auto_23296 - PLACE
      ?auto_23288 - HOIST
      ?auto_23297 - SURFACE
      ?auto_23294 - PLACE
      ?auto_23307 - HOIST
      ?auto_23291 - SURFACE
      ?auto_23298 - PLACE
      ?auto_23308 - HOIST
      ?auto_23305 - SURFACE
      ?auto_23300 - SURFACE
      ?auto_23313 - PLACE
      ?auto_23290 - HOIST
      ?auto_23292 - SURFACE
      ?auto_23306 - PLACE
      ?auto_23299 - HOIST
      ?auto_23287 - SURFACE
      ?auto_23310 - PLACE
      ?auto_23311 - HOIST
      ?auto_23289 - SURFACE
      ?auto_23280 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23281 ?auto_23283 ) ( IS-CRATE ?auto_23278 ) ( not ( = ?auto_23285 ?auto_23283 ) ) ( HOIST-AT ?auto_23282 ?auto_23285 ) ( AVAILABLE ?auto_23282 ) ( SURFACE-AT ?auto_23278 ?auto_23285 ) ( ON ?auto_23278 ?auto_23284 ) ( CLEAR ?auto_23278 ) ( not ( = ?auto_23279 ?auto_23278 ) ) ( not ( = ?auto_23279 ?auto_23284 ) ) ( not ( = ?auto_23278 ?auto_23284 ) ) ( not ( = ?auto_23281 ?auto_23282 ) ) ( IS-CRATE ?auto_23279 ) ( not ( = ?auto_23304 ?auto_23283 ) ) ( HOIST-AT ?auto_23301 ?auto_23304 ) ( SURFACE-AT ?auto_23279 ?auto_23304 ) ( ON ?auto_23279 ?auto_23312 ) ( CLEAR ?auto_23279 ) ( not ( = ?auto_23274 ?auto_23279 ) ) ( not ( = ?auto_23274 ?auto_23312 ) ) ( not ( = ?auto_23279 ?auto_23312 ) ) ( not ( = ?auto_23281 ?auto_23301 ) ) ( IS-CRATE ?auto_23274 ) ( not ( = ?auto_23309 ?auto_23283 ) ) ( HOIST-AT ?auto_23303 ?auto_23309 ) ( AVAILABLE ?auto_23303 ) ( SURFACE-AT ?auto_23274 ?auto_23309 ) ( ON ?auto_23274 ?auto_23295 ) ( CLEAR ?auto_23274 ) ( not ( = ?auto_23276 ?auto_23274 ) ) ( not ( = ?auto_23276 ?auto_23295 ) ) ( not ( = ?auto_23274 ?auto_23295 ) ) ( not ( = ?auto_23281 ?auto_23303 ) ) ( IS-CRATE ?auto_23276 ) ( not ( = ?auto_23302 ?auto_23283 ) ) ( HOIST-AT ?auto_23286 ?auto_23302 ) ( AVAILABLE ?auto_23286 ) ( SURFACE-AT ?auto_23276 ?auto_23302 ) ( ON ?auto_23276 ?auto_23293 ) ( CLEAR ?auto_23276 ) ( not ( = ?auto_23277 ?auto_23276 ) ) ( not ( = ?auto_23277 ?auto_23293 ) ) ( not ( = ?auto_23276 ?auto_23293 ) ) ( not ( = ?auto_23281 ?auto_23286 ) ) ( IS-CRATE ?auto_23277 ) ( not ( = ?auto_23296 ?auto_23283 ) ) ( HOIST-AT ?auto_23288 ?auto_23296 ) ( AVAILABLE ?auto_23288 ) ( SURFACE-AT ?auto_23277 ?auto_23296 ) ( ON ?auto_23277 ?auto_23297 ) ( CLEAR ?auto_23277 ) ( not ( = ?auto_23273 ?auto_23277 ) ) ( not ( = ?auto_23273 ?auto_23297 ) ) ( not ( = ?auto_23277 ?auto_23297 ) ) ( not ( = ?auto_23281 ?auto_23288 ) ) ( IS-CRATE ?auto_23273 ) ( not ( = ?auto_23294 ?auto_23283 ) ) ( HOIST-AT ?auto_23307 ?auto_23294 ) ( AVAILABLE ?auto_23307 ) ( SURFACE-AT ?auto_23273 ?auto_23294 ) ( ON ?auto_23273 ?auto_23291 ) ( CLEAR ?auto_23273 ) ( not ( = ?auto_23275 ?auto_23273 ) ) ( not ( = ?auto_23275 ?auto_23291 ) ) ( not ( = ?auto_23273 ?auto_23291 ) ) ( not ( = ?auto_23281 ?auto_23307 ) ) ( IS-CRATE ?auto_23275 ) ( not ( = ?auto_23298 ?auto_23283 ) ) ( HOIST-AT ?auto_23308 ?auto_23298 ) ( AVAILABLE ?auto_23308 ) ( SURFACE-AT ?auto_23275 ?auto_23298 ) ( ON ?auto_23275 ?auto_23305 ) ( CLEAR ?auto_23275 ) ( not ( = ?auto_23272 ?auto_23275 ) ) ( not ( = ?auto_23272 ?auto_23305 ) ) ( not ( = ?auto_23275 ?auto_23305 ) ) ( not ( = ?auto_23281 ?auto_23308 ) ) ( IS-CRATE ?auto_23272 ) ( AVAILABLE ?auto_23301 ) ( SURFACE-AT ?auto_23272 ?auto_23304 ) ( ON ?auto_23272 ?auto_23300 ) ( CLEAR ?auto_23272 ) ( not ( = ?auto_23271 ?auto_23272 ) ) ( not ( = ?auto_23271 ?auto_23300 ) ) ( not ( = ?auto_23272 ?auto_23300 ) ) ( IS-CRATE ?auto_23271 ) ( not ( = ?auto_23313 ?auto_23283 ) ) ( HOIST-AT ?auto_23290 ?auto_23313 ) ( AVAILABLE ?auto_23290 ) ( SURFACE-AT ?auto_23271 ?auto_23313 ) ( ON ?auto_23271 ?auto_23292 ) ( CLEAR ?auto_23271 ) ( not ( = ?auto_23270 ?auto_23271 ) ) ( not ( = ?auto_23270 ?auto_23292 ) ) ( not ( = ?auto_23271 ?auto_23292 ) ) ( not ( = ?auto_23281 ?auto_23290 ) ) ( IS-CRATE ?auto_23270 ) ( not ( = ?auto_23306 ?auto_23283 ) ) ( HOIST-AT ?auto_23299 ?auto_23306 ) ( AVAILABLE ?auto_23299 ) ( SURFACE-AT ?auto_23270 ?auto_23306 ) ( ON ?auto_23270 ?auto_23287 ) ( CLEAR ?auto_23270 ) ( not ( = ?auto_23269 ?auto_23270 ) ) ( not ( = ?auto_23269 ?auto_23287 ) ) ( not ( = ?auto_23270 ?auto_23287 ) ) ( not ( = ?auto_23281 ?auto_23299 ) ) ( SURFACE-AT ?auto_23268 ?auto_23283 ) ( CLEAR ?auto_23268 ) ( IS-CRATE ?auto_23269 ) ( AVAILABLE ?auto_23281 ) ( not ( = ?auto_23310 ?auto_23283 ) ) ( HOIST-AT ?auto_23311 ?auto_23310 ) ( AVAILABLE ?auto_23311 ) ( SURFACE-AT ?auto_23269 ?auto_23310 ) ( ON ?auto_23269 ?auto_23289 ) ( CLEAR ?auto_23269 ) ( TRUCK-AT ?auto_23280 ?auto_23283 ) ( not ( = ?auto_23268 ?auto_23269 ) ) ( not ( = ?auto_23268 ?auto_23289 ) ) ( not ( = ?auto_23269 ?auto_23289 ) ) ( not ( = ?auto_23281 ?auto_23311 ) ) ( not ( = ?auto_23268 ?auto_23270 ) ) ( not ( = ?auto_23268 ?auto_23287 ) ) ( not ( = ?auto_23270 ?auto_23289 ) ) ( not ( = ?auto_23306 ?auto_23310 ) ) ( not ( = ?auto_23299 ?auto_23311 ) ) ( not ( = ?auto_23287 ?auto_23289 ) ) ( not ( = ?auto_23268 ?auto_23271 ) ) ( not ( = ?auto_23268 ?auto_23292 ) ) ( not ( = ?auto_23269 ?auto_23271 ) ) ( not ( = ?auto_23269 ?auto_23292 ) ) ( not ( = ?auto_23271 ?auto_23287 ) ) ( not ( = ?auto_23271 ?auto_23289 ) ) ( not ( = ?auto_23313 ?auto_23306 ) ) ( not ( = ?auto_23313 ?auto_23310 ) ) ( not ( = ?auto_23290 ?auto_23299 ) ) ( not ( = ?auto_23290 ?auto_23311 ) ) ( not ( = ?auto_23292 ?auto_23287 ) ) ( not ( = ?auto_23292 ?auto_23289 ) ) ( not ( = ?auto_23268 ?auto_23272 ) ) ( not ( = ?auto_23268 ?auto_23300 ) ) ( not ( = ?auto_23269 ?auto_23272 ) ) ( not ( = ?auto_23269 ?auto_23300 ) ) ( not ( = ?auto_23270 ?auto_23272 ) ) ( not ( = ?auto_23270 ?auto_23300 ) ) ( not ( = ?auto_23272 ?auto_23292 ) ) ( not ( = ?auto_23272 ?auto_23287 ) ) ( not ( = ?auto_23272 ?auto_23289 ) ) ( not ( = ?auto_23304 ?auto_23313 ) ) ( not ( = ?auto_23304 ?auto_23306 ) ) ( not ( = ?auto_23304 ?auto_23310 ) ) ( not ( = ?auto_23301 ?auto_23290 ) ) ( not ( = ?auto_23301 ?auto_23299 ) ) ( not ( = ?auto_23301 ?auto_23311 ) ) ( not ( = ?auto_23300 ?auto_23292 ) ) ( not ( = ?auto_23300 ?auto_23287 ) ) ( not ( = ?auto_23300 ?auto_23289 ) ) ( not ( = ?auto_23268 ?auto_23275 ) ) ( not ( = ?auto_23268 ?auto_23305 ) ) ( not ( = ?auto_23269 ?auto_23275 ) ) ( not ( = ?auto_23269 ?auto_23305 ) ) ( not ( = ?auto_23270 ?auto_23275 ) ) ( not ( = ?auto_23270 ?auto_23305 ) ) ( not ( = ?auto_23271 ?auto_23275 ) ) ( not ( = ?auto_23271 ?auto_23305 ) ) ( not ( = ?auto_23275 ?auto_23300 ) ) ( not ( = ?auto_23275 ?auto_23292 ) ) ( not ( = ?auto_23275 ?auto_23287 ) ) ( not ( = ?auto_23275 ?auto_23289 ) ) ( not ( = ?auto_23298 ?auto_23304 ) ) ( not ( = ?auto_23298 ?auto_23313 ) ) ( not ( = ?auto_23298 ?auto_23306 ) ) ( not ( = ?auto_23298 ?auto_23310 ) ) ( not ( = ?auto_23308 ?auto_23301 ) ) ( not ( = ?auto_23308 ?auto_23290 ) ) ( not ( = ?auto_23308 ?auto_23299 ) ) ( not ( = ?auto_23308 ?auto_23311 ) ) ( not ( = ?auto_23305 ?auto_23300 ) ) ( not ( = ?auto_23305 ?auto_23292 ) ) ( not ( = ?auto_23305 ?auto_23287 ) ) ( not ( = ?auto_23305 ?auto_23289 ) ) ( not ( = ?auto_23268 ?auto_23273 ) ) ( not ( = ?auto_23268 ?auto_23291 ) ) ( not ( = ?auto_23269 ?auto_23273 ) ) ( not ( = ?auto_23269 ?auto_23291 ) ) ( not ( = ?auto_23270 ?auto_23273 ) ) ( not ( = ?auto_23270 ?auto_23291 ) ) ( not ( = ?auto_23271 ?auto_23273 ) ) ( not ( = ?auto_23271 ?auto_23291 ) ) ( not ( = ?auto_23272 ?auto_23273 ) ) ( not ( = ?auto_23272 ?auto_23291 ) ) ( not ( = ?auto_23273 ?auto_23305 ) ) ( not ( = ?auto_23273 ?auto_23300 ) ) ( not ( = ?auto_23273 ?auto_23292 ) ) ( not ( = ?auto_23273 ?auto_23287 ) ) ( not ( = ?auto_23273 ?auto_23289 ) ) ( not ( = ?auto_23294 ?auto_23298 ) ) ( not ( = ?auto_23294 ?auto_23304 ) ) ( not ( = ?auto_23294 ?auto_23313 ) ) ( not ( = ?auto_23294 ?auto_23306 ) ) ( not ( = ?auto_23294 ?auto_23310 ) ) ( not ( = ?auto_23307 ?auto_23308 ) ) ( not ( = ?auto_23307 ?auto_23301 ) ) ( not ( = ?auto_23307 ?auto_23290 ) ) ( not ( = ?auto_23307 ?auto_23299 ) ) ( not ( = ?auto_23307 ?auto_23311 ) ) ( not ( = ?auto_23291 ?auto_23305 ) ) ( not ( = ?auto_23291 ?auto_23300 ) ) ( not ( = ?auto_23291 ?auto_23292 ) ) ( not ( = ?auto_23291 ?auto_23287 ) ) ( not ( = ?auto_23291 ?auto_23289 ) ) ( not ( = ?auto_23268 ?auto_23277 ) ) ( not ( = ?auto_23268 ?auto_23297 ) ) ( not ( = ?auto_23269 ?auto_23277 ) ) ( not ( = ?auto_23269 ?auto_23297 ) ) ( not ( = ?auto_23270 ?auto_23277 ) ) ( not ( = ?auto_23270 ?auto_23297 ) ) ( not ( = ?auto_23271 ?auto_23277 ) ) ( not ( = ?auto_23271 ?auto_23297 ) ) ( not ( = ?auto_23272 ?auto_23277 ) ) ( not ( = ?auto_23272 ?auto_23297 ) ) ( not ( = ?auto_23275 ?auto_23277 ) ) ( not ( = ?auto_23275 ?auto_23297 ) ) ( not ( = ?auto_23277 ?auto_23291 ) ) ( not ( = ?auto_23277 ?auto_23305 ) ) ( not ( = ?auto_23277 ?auto_23300 ) ) ( not ( = ?auto_23277 ?auto_23292 ) ) ( not ( = ?auto_23277 ?auto_23287 ) ) ( not ( = ?auto_23277 ?auto_23289 ) ) ( not ( = ?auto_23296 ?auto_23294 ) ) ( not ( = ?auto_23296 ?auto_23298 ) ) ( not ( = ?auto_23296 ?auto_23304 ) ) ( not ( = ?auto_23296 ?auto_23313 ) ) ( not ( = ?auto_23296 ?auto_23306 ) ) ( not ( = ?auto_23296 ?auto_23310 ) ) ( not ( = ?auto_23288 ?auto_23307 ) ) ( not ( = ?auto_23288 ?auto_23308 ) ) ( not ( = ?auto_23288 ?auto_23301 ) ) ( not ( = ?auto_23288 ?auto_23290 ) ) ( not ( = ?auto_23288 ?auto_23299 ) ) ( not ( = ?auto_23288 ?auto_23311 ) ) ( not ( = ?auto_23297 ?auto_23291 ) ) ( not ( = ?auto_23297 ?auto_23305 ) ) ( not ( = ?auto_23297 ?auto_23300 ) ) ( not ( = ?auto_23297 ?auto_23292 ) ) ( not ( = ?auto_23297 ?auto_23287 ) ) ( not ( = ?auto_23297 ?auto_23289 ) ) ( not ( = ?auto_23268 ?auto_23276 ) ) ( not ( = ?auto_23268 ?auto_23293 ) ) ( not ( = ?auto_23269 ?auto_23276 ) ) ( not ( = ?auto_23269 ?auto_23293 ) ) ( not ( = ?auto_23270 ?auto_23276 ) ) ( not ( = ?auto_23270 ?auto_23293 ) ) ( not ( = ?auto_23271 ?auto_23276 ) ) ( not ( = ?auto_23271 ?auto_23293 ) ) ( not ( = ?auto_23272 ?auto_23276 ) ) ( not ( = ?auto_23272 ?auto_23293 ) ) ( not ( = ?auto_23275 ?auto_23276 ) ) ( not ( = ?auto_23275 ?auto_23293 ) ) ( not ( = ?auto_23273 ?auto_23276 ) ) ( not ( = ?auto_23273 ?auto_23293 ) ) ( not ( = ?auto_23276 ?auto_23297 ) ) ( not ( = ?auto_23276 ?auto_23291 ) ) ( not ( = ?auto_23276 ?auto_23305 ) ) ( not ( = ?auto_23276 ?auto_23300 ) ) ( not ( = ?auto_23276 ?auto_23292 ) ) ( not ( = ?auto_23276 ?auto_23287 ) ) ( not ( = ?auto_23276 ?auto_23289 ) ) ( not ( = ?auto_23302 ?auto_23296 ) ) ( not ( = ?auto_23302 ?auto_23294 ) ) ( not ( = ?auto_23302 ?auto_23298 ) ) ( not ( = ?auto_23302 ?auto_23304 ) ) ( not ( = ?auto_23302 ?auto_23313 ) ) ( not ( = ?auto_23302 ?auto_23306 ) ) ( not ( = ?auto_23302 ?auto_23310 ) ) ( not ( = ?auto_23286 ?auto_23288 ) ) ( not ( = ?auto_23286 ?auto_23307 ) ) ( not ( = ?auto_23286 ?auto_23308 ) ) ( not ( = ?auto_23286 ?auto_23301 ) ) ( not ( = ?auto_23286 ?auto_23290 ) ) ( not ( = ?auto_23286 ?auto_23299 ) ) ( not ( = ?auto_23286 ?auto_23311 ) ) ( not ( = ?auto_23293 ?auto_23297 ) ) ( not ( = ?auto_23293 ?auto_23291 ) ) ( not ( = ?auto_23293 ?auto_23305 ) ) ( not ( = ?auto_23293 ?auto_23300 ) ) ( not ( = ?auto_23293 ?auto_23292 ) ) ( not ( = ?auto_23293 ?auto_23287 ) ) ( not ( = ?auto_23293 ?auto_23289 ) ) ( not ( = ?auto_23268 ?auto_23274 ) ) ( not ( = ?auto_23268 ?auto_23295 ) ) ( not ( = ?auto_23269 ?auto_23274 ) ) ( not ( = ?auto_23269 ?auto_23295 ) ) ( not ( = ?auto_23270 ?auto_23274 ) ) ( not ( = ?auto_23270 ?auto_23295 ) ) ( not ( = ?auto_23271 ?auto_23274 ) ) ( not ( = ?auto_23271 ?auto_23295 ) ) ( not ( = ?auto_23272 ?auto_23274 ) ) ( not ( = ?auto_23272 ?auto_23295 ) ) ( not ( = ?auto_23275 ?auto_23274 ) ) ( not ( = ?auto_23275 ?auto_23295 ) ) ( not ( = ?auto_23273 ?auto_23274 ) ) ( not ( = ?auto_23273 ?auto_23295 ) ) ( not ( = ?auto_23277 ?auto_23274 ) ) ( not ( = ?auto_23277 ?auto_23295 ) ) ( not ( = ?auto_23274 ?auto_23293 ) ) ( not ( = ?auto_23274 ?auto_23297 ) ) ( not ( = ?auto_23274 ?auto_23291 ) ) ( not ( = ?auto_23274 ?auto_23305 ) ) ( not ( = ?auto_23274 ?auto_23300 ) ) ( not ( = ?auto_23274 ?auto_23292 ) ) ( not ( = ?auto_23274 ?auto_23287 ) ) ( not ( = ?auto_23274 ?auto_23289 ) ) ( not ( = ?auto_23309 ?auto_23302 ) ) ( not ( = ?auto_23309 ?auto_23296 ) ) ( not ( = ?auto_23309 ?auto_23294 ) ) ( not ( = ?auto_23309 ?auto_23298 ) ) ( not ( = ?auto_23309 ?auto_23304 ) ) ( not ( = ?auto_23309 ?auto_23313 ) ) ( not ( = ?auto_23309 ?auto_23306 ) ) ( not ( = ?auto_23309 ?auto_23310 ) ) ( not ( = ?auto_23303 ?auto_23286 ) ) ( not ( = ?auto_23303 ?auto_23288 ) ) ( not ( = ?auto_23303 ?auto_23307 ) ) ( not ( = ?auto_23303 ?auto_23308 ) ) ( not ( = ?auto_23303 ?auto_23301 ) ) ( not ( = ?auto_23303 ?auto_23290 ) ) ( not ( = ?auto_23303 ?auto_23299 ) ) ( not ( = ?auto_23303 ?auto_23311 ) ) ( not ( = ?auto_23295 ?auto_23293 ) ) ( not ( = ?auto_23295 ?auto_23297 ) ) ( not ( = ?auto_23295 ?auto_23291 ) ) ( not ( = ?auto_23295 ?auto_23305 ) ) ( not ( = ?auto_23295 ?auto_23300 ) ) ( not ( = ?auto_23295 ?auto_23292 ) ) ( not ( = ?auto_23295 ?auto_23287 ) ) ( not ( = ?auto_23295 ?auto_23289 ) ) ( not ( = ?auto_23268 ?auto_23279 ) ) ( not ( = ?auto_23268 ?auto_23312 ) ) ( not ( = ?auto_23269 ?auto_23279 ) ) ( not ( = ?auto_23269 ?auto_23312 ) ) ( not ( = ?auto_23270 ?auto_23279 ) ) ( not ( = ?auto_23270 ?auto_23312 ) ) ( not ( = ?auto_23271 ?auto_23279 ) ) ( not ( = ?auto_23271 ?auto_23312 ) ) ( not ( = ?auto_23272 ?auto_23279 ) ) ( not ( = ?auto_23272 ?auto_23312 ) ) ( not ( = ?auto_23275 ?auto_23279 ) ) ( not ( = ?auto_23275 ?auto_23312 ) ) ( not ( = ?auto_23273 ?auto_23279 ) ) ( not ( = ?auto_23273 ?auto_23312 ) ) ( not ( = ?auto_23277 ?auto_23279 ) ) ( not ( = ?auto_23277 ?auto_23312 ) ) ( not ( = ?auto_23276 ?auto_23279 ) ) ( not ( = ?auto_23276 ?auto_23312 ) ) ( not ( = ?auto_23279 ?auto_23295 ) ) ( not ( = ?auto_23279 ?auto_23293 ) ) ( not ( = ?auto_23279 ?auto_23297 ) ) ( not ( = ?auto_23279 ?auto_23291 ) ) ( not ( = ?auto_23279 ?auto_23305 ) ) ( not ( = ?auto_23279 ?auto_23300 ) ) ( not ( = ?auto_23279 ?auto_23292 ) ) ( not ( = ?auto_23279 ?auto_23287 ) ) ( not ( = ?auto_23279 ?auto_23289 ) ) ( not ( = ?auto_23312 ?auto_23295 ) ) ( not ( = ?auto_23312 ?auto_23293 ) ) ( not ( = ?auto_23312 ?auto_23297 ) ) ( not ( = ?auto_23312 ?auto_23291 ) ) ( not ( = ?auto_23312 ?auto_23305 ) ) ( not ( = ?auto_23312 ?auto_23300 ) ) ( not ( = ?auto_23312 ?auto_23292 ) ) ( not ( = ?auto_23312 ?auto_23287 ) ) ( not ( = ?auto_23312 ?auto_23289 ) ) ( not ( = ?auto_23268 ?auto_23278 ) ) ( not ( = ?auto_23268 ?auto_23284 ) ) ( not ( = ?auto_23269 ?auto_23278 ) ) ( not ( = ?auto_23269 ?auto_23284 ) ) ( not ( = ?auto_23270 ?auto_23278 ) ) ( not ( = ?auto_23270 ?auto_23284 ) ) ( not ( = ?auto_23271 ?auto_23278 ) ) ( not ( = ?auto_23271 ?auto_23284 ) ) ( not ( = ?auto_23272 ?auto_23278 ) ) ( not ( = ?auto_23272 ?auto_23284 ) ) ( not ( = ?auto_23275 ?auto_23278 ) ) ( not ( = ?auto_23275 ?auto_23284 ) ) ( not ( = ?auto_23273 ?auto_23278 ) ) ( not ( = ?auto_23273 ?auto_23284 ) ) ( not ( = ?auto_23277 ?auto_23278 ) ) ( not ( = ?auto_23277 ?auto_23284 ) ) ( not ( = ?auto_23276 ?auto_23278 ) ) ( not ( = ?auto_23276 ?auto_23284 ) ) ( not ( = ?auto_23274 ?auto_23278 ) ) ( not ( = ?auto_23274 ?auto_23284 ) ) ( not ( = ?auto_23278 ?auto_23312 ) ) ( not ( = ?auto_23278 ?auto_23295 ) ) ( not ( = ?auto_23278 ?auto_23293 ) ) ( not ( = ?auto_23278 ?auto_23297 ) ) ( not ( = ?auto_23278 ?auto_23291 ) ) ( not ( = ?auto_23278 ?auto_23305 ) ) ( not ( = ?auto_23278 ?auto_23300 ) ) ( not ( = ?auto_23278 ?auto_23292 ) ) ( not ( = ?auto_23278 ?auto_23287 ) ) ( not ( = ?auto_23278 ?auto_23289 ) ) ( not ( = ?auto_23285 ?auto_23304 ) ) ( not ( = ?auto_23285 ?auto_23309 ) ) ( not ( = ?auto_23285 ?auto_23302 ) ) ( not ( = ?auto_23285 ?auto_23296 ) ) ( not ( = ?auto_23285 ?auto_23294 ) ) ( not ( = ?auto_23285 ?auto_23298 ) ) ( not ( = ?auto_23285 ?auto_23313 ) ) ( not ( = ?auto_23285 ?auto_23306 ) ) ( not ( = ?auto_23285 ?auto_23310 ) ) ( not ( = ?auto_23282 ?auto_23301 ) ) ( not ( = ?auto_23282 ?auto_23303 ) ) ( not ( = ?auto_23282 ?auto_23286 ) ) ( not ( = ?auto_23282 ?auto_23288 ) ) ( not ( = ?auto_23282 ?auto_23307 ) ) ( not ( = ?auto_23282 ?auto_23308 ) ) ( not ( = ?auto_23282 ?auto_23290 ) ) ( not ( = ?auto_23282 ?auto_23299 ) ) ( not ( = ?auto_23282 ?auto_23311 ) ) ( not ( = ?auto_23284 ?auto_23312 ) ) ( not ( = ?auto_23284 ?auto_23295 ) ) ( not ( = ?auto_23284 ?auto_23293 ) ) ( not ( = ?auto_23284 ?auto_23297 ) ) ( not ( = ?auto_23284 ?auto_23291 ) ) ( not ( = ?auto_23284 ?auto_23305 ) ) ( not ( = ?auto_23284 ?auto_23300 ) ) ( not ( = ?auto_23284 ?auto_23292 ) ) ( not ( = ?auto_23284 ?auto_23287 ) ) ( not ( = ?auto_23284 ?auto_23289 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_23268 ?auto_23269 ?auto_23270 ?auto_23271 ?auto_23272 ?auto_23275 ?auto_23273 ?auto_23277 ?auto_23276 ?auto_23274 ?auto_23279 )
      ( MAKE-1CRATE ?auto_23279 ?auto_23278 )
      ( MAKE-11CRATE-VERIFY ?auto_23268 ?auto_23269 ?auto_23270 ?auto_23271 ?auto_23272 ?auto_23275 ?auto_23273 ?auto_23277 ?auto_23276 ?auto_23274 ?auto_23279 ?auto_23278 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23316 - SURFACE
      ?auto_23317 - SURFACE
    )
    :vars
    (
      ?auto_23318 - HOIST
      ?auto_23319 - PLACE
      ?auto_23321 - PLACE
      ?auto_23322 - HOIST
      ?auto_23323 - SURFACE
      ?auto_23320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23318 ?auto_23319 ) ( SURFACE-AT ?auto_23316 ?auto_23319 ) ( CLEAR ?auto_23316 ) ( IS-CRATE ?auto_23317 ) ( AVAILABLE ?auto_23318 ) ( not ( = ?auto_23321 ?auto_23319 ) ) ( HOIST-AT ?auto_23322 ?auto_23321 ) ( AVAILABLE ?auto_23322 ) ( SURFACE-AT ?auto_23317 ?auto_23321 ) ( ON ?auto_23317 ?auto_23323 ) ( CLEAR ?auto_23317 ) ( TRUCK-AT ?auto_23320 ?auto_23319 ) ( not ( = ?auto_23316 ?auto_23317 ) ) ( not ( = ?auto_23316 ?auto_23323 ) ) ( not ( = ?auto_23317 ?auto_23323 ) ) ( not ( = ?auto_23318 ?auto_23322 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23320 ?auto_23319 ?auto_23321 )
      ( !LIFT ?auto_23322 ?auto_23317 ?auto_23323 ?auto_23321 )
      ( !LOAD ?auto_23322 ?auto_23317 ?auto_23320 ?auto_23321 )
      ( !DRIVE ?auto_23320 ?auto_23321 ?auto_23319 )
      ( !UNLOAD ?auto_23318 ?auto_23317 ?auto_23320 ?auto_23319 )
      ( !DROP ?auto_23318 ?auto_23317 ?auto_23316 ?auto_23319 )
      ( MAKE-1CRATE-VERIFY ?auto_23316 ?auto_23317 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_23337 - SURFACE
      ?auto_23338 - SURFACE
      ?auto_23339 - SURFACE
      ?auto_23340 - SURFACE
      ?auto_23341 - SURFACE
      ?auto_23344 - SURFACE
      ?auto_23342 - SURFACE
      ?auto_23346 - SURFACE
      ?auto_23345 - SURFACE
      ?auto_23343 - SURFACE
      ?auto_23348 - SURFACE
      ?auto_23347 - SURFACE
      ?auto_23349 - SURFACE
    )
    :vars
    (
      ?auto_23353 - HOIST
      ?auto_23354 - PLACE
      ?auto_23350 - PLACE
      ?auto_23355 - HOIST
      ?auto_23352 - SURFACE
      ?auto_23356 - PLACE
      ?auto_23376 - HOIST
      ?auto_23361 - SURFACE
      ?auto_23363 - PLACE
      ?auto_23383 - HOIST
      ?auto_23372 - SURFACE
      ?auto_23369 - PLACE
      ?auto_23360 - HOIST
      ?auto_23386 - SURFACE
      ?auto_23380 - PLACE
      ?auto_23365 - HOIST
      ?auto_23357 - SURFACE
      ?auto_23385 - PLACE
      ?auto_23370 - HOIST
      ?auto_23377 - SURFACE
      ?auto_23371 - PLACE
      ?auto_23375 - HOIST
      ?auto_23379 - SURFACE
      ?auto_23358 - PLACE
      ?auto_23366 - HOIST
      ?auto_23378 - SURFACE
      ?auto_23373 - SURFACE
      ?auto_23367 - PLACE
      ?auto_23382 - HOIST
      ?auto_23381 - SURFACE
      ?auto_23374 - PLACE
      ?auto_23384 - HOIST
      ?auto_23362 - SURFACE
      ?auto_23368 - PLACE
      ?auto_23359 - HOIST
      ?auto_23364 - SURFACE
      ?auto_23351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23353 ?auto_23354 ) ( IS-CRATE ?auto_23349 ) ( not ( = ?auto_23350 ?auto_23354 ) ) ( HOIST-AT ?auto_23355 ?auto_23350 ) ( AVAILABLE ?auto_23355 ) ( SURFACE-AT ?auto_23349 ?auto_23350 ) ( ON ?auto_23349 ?auto_23352 ) ( CLEAR ?auto_23349 ) ( not ( = ?auto_23347 ?auto_23349 ) ) ( not ( = ?auto_23347 ?auto_23352 ) ) ( not ( = ?auto_23349 ?auto_23352 ) ) ( not ( = ?auto_23353 ?auto_23355 ) ) ( IS-CRATE ?auto_23347 ) ( not ( = ?auto_23356 ?auto_23354 ) ) ( HOIST-AT ?auto_23376 ?auto_23356 ) ( AVAILABLE ?auto_23376 ) ( SURFACE-AT ?auto_23347 ?auto_23356 ) ( ON ?auto_23347 ?auto_23361 ) ( CLEAR ?auto_23347 ) ( not ( = ?auto_23348 ?auto_23347 ) ) ( not ( = ?auto_23348 ?auto_23361 ) ) ( not ( = ?auto_23347 ?auto_23361 ) ) ( not ( = ?auto_23353 ?auto_23376 ) ) ( IS-CRATE ?auto_23348 ) ( not ( = ?auto_23363 ?auto_23354 ) ) ( HOIST-AT ?auto_23383 ?auto_23363 ) ( SURFACE-AT ?auto_23348 ?auto_23363 ) ( ON ?auto_23348 ?auto_23372 ) ( CLEAR ?auto_23348 ) ( not ( = ?auto_23343 ?auto_23348 ) ) ( not ( = ?auto_23343 ?auto_23372 ) ) ( not ( = ?auto_23348 ?auto_23372 ) ) ( not ( = ?auto_23353 ?auto_23383 ) ) ( IS-CRATE ?auto_23343 ) ( not ( = ?auto_23369 ?auto_23354 ) ) ( HOIST-AT ?auto_23360 ?auto_23369 ) ( AVAILABLE ?auto_23360 ) ( SURFACE-AT ?auto_23343 ?auto_23369 ) ( ON ?auto_23343 ?auto_23386 ) ( CLEAR ?auto_23343 ) ( not ( = ?auto_23345 ?auto_23343 ) ) ( not ( = ?auto_23345 ?auto_23386 ) ) ( not ( = ?auto_23343 ?auto_23386 ) ) ( not ( = ?auto_23353 ?auto_23360 ) ) ( IS-CRATE ?auto_23345 ) ( not ( = ?auto_23380 ?auto_23354 ) ) ( HOIST-AT ?auto_23365 ?auto_23380 ) ( AVAILABLE ?auto_23365 ) ( SURFACE-AT ?auto_23345 ?auto_23380 ) ( ON ?auto_23345 ?auto_23357 ) ( CLEAR ?auto_23345 ) ( not ( = ?auto_23346 ?auto_23345 ) ) ( not ( = ?auto_23346 ?auto_23357 ) ) ( not ( = ?auto_23345 ?auto_23357 ) ) ( not ( = ?auto_23353 ?auto_23365 ) ) ( IS-CRATE ?auto_23346 ) ( not ( = ?auto_23385 ?auto_23354 ) ) ( HOIST-AT ?auto_23370 ?auto_23385 ) ( AVAILABLE ?auto_23370 ) ( SURFACE-AT ?auto_23346 ?auto_23385 ) ( ON ?auto_23346 ?auto_23377 ) ( CLEAR ?auto_23346 ) ( not ( = ?auto_23342 ?auto_23346 ) ) ( not ( = ?auto_23342 ?auto_23377 ) ) ( not ( = ?auto_23346 ?auto_23377 ) ) ( not ( = ?auto_23353 ?auto_23370 ) ) ( IS-CRATE ?auto_23342 ) ( not ( = ?auto_23371 ?auto_23354 ) ) ( HOIST-AT ?auto_23375 ?auto_23371 ) ( AVAILABLE ?auto_23375 ) ( SURFACE-AT ?auto_23342 ?auto_23371 ) ( ON ?auto_23342 ?auto_23379 ) ( CLEAR ?auto_23342 ) ( not ( = ?auto_23344 ?auto_23342 ) ) ( not ( = ?auto_23344 ?auto_23379 ) ) ( not ( = ?auto_23342 ?auto_23379 ) ) ( not ( = ?auto_23353 ?auto_23375 ) ) ( IS-CRATE ?auto_23344 ) ( not ( = ?auto_23358 ?auto_23354 ) ) ( HOIST-AT ?auto_23366 ?auto_23358 ) ( AVAILABLE ?auto_23366 ) ( SURFACE-AT ?auto_23344 ?auto_23358 ) ( ON ?auto_23344 ?auto_23378 ) ( CLEAR ?auto_23344 ) ( not ( = ?auto_23341 ?auto_23344 ) ) ( not ( = ?auto_23341 ?auto_23378 ) ) ( not ( = ?auto_23344 ?auto_23378 ) ) ( not ( = ?auto_23353 ?auto_23366 ) ) ( IS-CRATE ?auto_23341 ) ( AVAILABLE ?auto_23383 ) ( SURFACE-AT ?auto_23341 ?auto_23363 ) ( ON ?auto_23341 ?auto_23373 ) ( CLEAR ?auto_23341 ) ( not ( = ?auto_23340 ?auto_23341 ) ) ( not ( = ?auto_23340 ?auto_23373 ) ) ( not ( = ?auto_23341 ?auto_23373 ) ) ( IS-CRATE ?auto_23340 ) ( not ( = ?auto_23367 ?auto_23354 ) ) ( HOIST-AT ?auto_23382 ?auto_23367 ) ( AVAILABLE ?auto_23382 ) ( SURFACE-AT ?auto_23340 ?auto_23367 ) ( ON ?auto_23340 ?auto_23381 ) ( CLEAR ?auto_23340 ) ( not ( = ?auto_23339 ?auto_23340 ) ) ( not ( = ?auto_23339 ?auto_23381 ) ) ( not ( = ?auto_23340 ?auto_23381 ) ) ( not ( = ?auto_23353 ?auto_23382 ) ) ( IS-CRATE ?auto_23339 ) ( not ( = ?auto_23374 ?auto_23354 ) ) ( HOIST-AT ?auto_23384 ?auto_23374 ) ( AVAILABLE ?auto_23384 ) ( SURFACE-AT ?auto_23339 ?auto_23374 ) ( ON ?auto_23339 ?auto_23362 ) ( CLEAR ?auto_23339 ) ( not ( = ?auto_23338 ?auto_23339 ) ) ( not ( = ?auto_23338 ?auto_23362 ) ) ( not ( = ?auto_23339 ?auto_23362 ) ) ( not ( = ?auto_23353 ?auto_23384 ) ) ( SURFACE-AT ?auto_23337 ?auto_23354 ) ( CLEAR ?auto_23337 ) ( IS-CRATE ?auto_23338 ) ( AVAILABLE ?auto_23353 ) ( not ( = ?auto_23368 ?auto_23354 ) ) ( HOIST-AT ?auto_23359 ?auto_23368 ) ( AVAILABLE ?auto_23359 ) ( SURFACE-AT ?auto_23338 ?auto_23368 ) ( ON ?auto_23338 ?auto_23364 ) ( CLEAR ?auto_23338 ) ( TRUCK-AT ?auto_23351 ?auto_23354 ) ( not ( = ?auto_23337 ?auto_23338 ) ) ( not ( = ?auto_23337 ?auto_23364 ) ) ( not ( = ?auto_23338 ?auto_23364 ) ) ( not ( = ?auto_23353 ?auto_23359 ) ) ( not ( = ?auto_23337 ?auto_23339 ) ) ( not ( = ?auto_23337 ?auto_23362 ) ) ( not ( = ?auto_23339 ?auto_23364 ) ) ( not ( = ?auto_23374 ?auto_23368 ) ) ( not ( = ?auto_23384 ?auto_23359 ) ) ( not ( = ?auto_23362 ?auto_23364 ) ) ( not ( = ?auto_23337 ?auto_23340 ) ) ( not ( = ?auto_23337 ?auto_23381 ) ) ( not ( = ?auto_23338 ?auto_23340 ) ) ( not ( = ?auto_23338 ?auto_23381 ) ) ( not ( = ?auto_23340 ?auto_23362 ) ) ( not ( = ?auto_23340 ?auto_23364 ) ) ( not ( = ?auto_23367 ?auto_23374 ) ) ( not ( = ?auto_23367 ?auto_23368 ) ) ( not ( = ?auto_23382 ?auto_23384 ) ) ( not ( = ?auto_23382 ?auto_23359 ) ) ( not ( = ?auto_23381 ?auto_23362 ) ) ( not ( = ?auto_23381 ?auto_23364 ) ) ( not ( = ?auto_23337 ?auto_23341 ) ) ( not ( = ?auto_23337 ?auto_23373 ) ) ( not ( = ?auto_23338 ?auto_23341 ) ) ( not ( = ?auto_23338 ?auto_23373 ) ) ( not ( = ?auto_23339 ?auto_23341 ) ) ( not ( = ?auto_23339 ?auto_23373 ) ) ( not ( = ?auto_23341 ?auto_23381 ) ) ( not ( = ?auto_23341 ?auto_23362 ) ) ( not ( = ?auto_23341 ?auto_23364 ) ) ( not ( = ?auto_23363 ?auto_23367 ) ) ( not ( = ?auto_23363 ?auto_23374 ) ) ( not ( = ?auto_23363 ?auto_23368 ) ) ( not ( = ?auto_23383 ?auto_23382 ) ) ( not ( = ?auto_23383 ?auto_23384 ) ) ( not ( = ?auto_23383 ?auto_23359 ) ) ( not ( = ?auto_23373 ?auto_23381 ) ) ( not ( = ?auto_23373 ?auto_23362 ) ) ( not ( = ?auto_23373 ?auto_23364 ) ) ( not ( = ?auto_23337 ?auto_23344 ) ) ( not ( = ?auto_23337 ?auto_23378 ) ) ( not ( = ?auto_23338 ?auto_23344 ) ) ( not ( = ?auto_23338 ?auto_23378 ) ) ( not ( = ?auto_23339 ?auto_23344 ) ) ( not ( = ?auto_23339 ?auto_23378 ) ) ( not ( = ?auto_23340 ?auto_23344 ) ) ( not ( = ?auto_23340 ?auto_23378 ) ) ( not ( = ?auto_23344 ?auto_23373 ) ) ( not ( = ?auto_23344 ?auto_23381 ) ) ( not ( = ?auto_23344 ?auto_23362 ) ) ( not ( = ?auto_23344 ?auto_23364 ) ) ( not ( = ?auto_23358 ?auto_23363 ) ) ( not ( = ?auto_23358 ?auto_23367 ) ) ( not ( = ?auto_23358 ?auto_23374 ) ) ( not ( = ?auto_23358 ?auto_23368 ) ) ( not ( = ?auto_23366 ?auto_23383 ) ) ( not ( = ?auto_23366 ?auto_23382 ) ) ( not ( = ?auto_23366 ?auto_23384 ) ) ( not ( = ?auto_23366 ?auto_23359 ) ) ( not ( = ?auto_23378 ?auto_23373 ) ) ( not ( = ?auto_23378 ?auto_23381 ) ) ( not ( = ?auto_23378 ?auto_23362 ) ) ( not ( = ?auto_23378 ?auto_23364 ) ) ( not ( = ?auto_23337 ?auto_23342 ) ) ( not ( = ?auto_23337 ?auto_23379 ) ) ( not ( = ?auto_23338 ?auto_23342 ) ) ( not ( = ?auto_23338 ?auto_23379 ) ) ( not ( = ?auto_23339 ?auto_23342 ) ) ( not ( = ?auto_23339 ?auto_23379 ) ) ( not ( = ?auto_23340 ?auto_23342 ) ) ( not ( = ?auto_23340 ?auto_23379 ) ) ( not ( = ?auto_23341 ?auto_23342 ) ) ( not ( = ?auto_23341 ?auto_23379 ) ) ( not ( = ?auto_23342 ?auto_23378 ) ) ( not ( = ?auto_23342 ?auto_23373 ) ) ( not ( = ?auto_23342 ?auto_23381 ) ) ( not ( = ?auto_23342 ?auto_23362 ) ) ( not ( = ?auto_23342 ?auto_23364 ) ) ( not ( = ?auto_23371 ?auto_23358 ) ) ( not ( = ?auto_23371 ?auto_23363 ) ) ( not ( = ?auto_23371 ?auto_23367 ) ) ( not ( = ?auto_23371 ?auto_23374 ) ) ( not ( = ?auto_23371 ?auto_23368 ) ) ( not ( = ?auto_23375 ?auto_23366 ) ) ( not ( = ?auto_23375 ?auto_23383 ) ) ( not ( = ?auto_23375 ?auto_23382 ) ) ( not ( = ?auto_23375 ?auto_23384 ) ) ( not ( = ?auto_23375 ?auto_23359 ) ) ( not ( = ?auto_23379 ?auto_23378 ) ) ( not ( = ?auto_23379 ?auto_23373 ) ) ( not ( = ?auto_23379 ?auto_23381 ) ) ( not ( = ?auto_23379 ?auto_23362 ) ) ( not ( = ?auto_23379 ?auto_23364 ) ) ( not ( = ?auto_23337 ?auto_23346 ) ) ( not ( = ?auto_23337 ?auto_23377 ) ) ( not ( = ?auto_23338 ?auto_23346 ) ) ( not ( = ?auto_23338 ?auto_23377 ) ) ( not ( = ?auto_23339 ?auto_23346 ) ) ( not ( = ?auto_23339 ?auto_23377 ) ) ( not ( = ?auto_23340 ?auto_23346 ) ) ( not ( = ?auto_23340 ?auto_23377 ) ) ( not ( = ?auto_23341 ?auto_23346 ) ) ( not ( = ?auto_23341 ?auto_23377 ) ) ( not ( = ?auto_23344 ?auto_23346 ) ) ( not ( = ?auto_23344 ?auto_23377 ) ) ( not ( = ?auto_23346 ?auto_23379 ) ) ( not ( = ?auto_23346 ?auto_23378 ) ) ( not ( = ?auto_23346 ?auto_23373 ) ) ( not ( = ?auto_23346 ?auto_23381 ) ) ( not ( = ?auto_23346 ?auto_23362 ) ) ( not ( = ?auto_23346 ?auto_23364 ) ) ( not ( = ?auto_23385 ?auto_23371 ) ) ( not ( = ?auto_23385 ?auto_23358 ) ) ( not ( = ?auto_23385 ?auto_23363 ) ) ( not ( = ?auto_23385 ?auto_23367 ) ) ( not ( = ?auto_23385 ?auto_23374 ) ) ( not ( = ?auto_23385 ?auto_23368 ) ) ( not ( = ?auto_23370 ?auto_23375 ) ) ( not ( = ?auto_23370 ?auto_23366 ) ) ( not ( = ?auto_23370 ?auto_23383 ) ) ( not ( = ?auto_23370 ?auto_23382 ) ) ( not ( = ?auto_23370 ?auto_23384 ) ) ( not ( = ?auto_23370 ?auto_23359 ) ) ( not ( = ?auto_23377 ?auto_23379 ) ) ( not ( = ?auto_23377 ?auto_23378 ) ) ( not ( = ?auto_23377 ?auto_23373 ) ) ( not ( = ?auto_23377 ?auto_23381 ) ) ( not ( = ?auto_23377 ?auto_23362 ) ) ( not ( = ?auto_23377 ?auto_23364 ) ) ( not ( = ?auto_23337 ?auto_23345 ) ) ( not ( = ?auto_23337 ?auto_23357 ) ) ( not ( = ?auto_23338 ?auto_23345 ) ) ( not ( = ?auto_23338 ?auto_23357 ) ) ( not ( = ?auto_23339 ?auto_23345 ) ) ( not ( = ?auto_23339 ?auto_23357 ) ) ( not ( = ?auto_23340 ?auto_23345 ) ) ( not ( = ?auto_23340 ?auto_23357 ) ) ( not ( = ?auto_23341 ?auto_23345 ) ) ( not ( = ?auto_23341 ?auto_23357 ) ) ( not ( = ?auto_23344 ?auto_23345 ) ) ( not ( = ?auto_23344 ?auto_23357 ) ) ( not ( = ?auto_23342 ?auto_23345 ) ) ( not ( = ?auto_23342 ?auto_23357 ) ) ( not ( = ?auto_23345 ?auto_23377 ) ) ( not ( = ?auto_23345 ?auto_23379 ) ) ( not ( = ?auto_23345 ?auto_23378 ) ) ( not ( = ?auto_23345 ?auto_23373 ) ) ( not ( = ?auto_23345 ?auto_23381 ) ) ( not ( = ?auto_23345 ?auto_23362 ) ) ( not ( = ?auto_23345 ?auto_23364 ) ) ( not ( = ?auto_23380 ?auto_23385 ) ) ( not ( = ?auto_23380 ?auto_23371 ) ) ( not ( = ?auto_23380 ?auto_23358 ) ) ( not ( = ?auto_23380 ?auto_23363 ) ) ( not ( = ?auto_23380 ?auto_23367 ) ) ( not ( = ?auto_23380 ?auto_23374 ) ) ( not ( = ?auto_23380 ?auto_23368 ) ) ( not ( = ?auto_23365 ?auto_23370 ) ) ( not ( = ?auto_23365 ?auto_23375 ) ) ( not ( = ?auto_23365 ?auto_23366 ) ) ( not ( = ?auto_23365 ?auto_23383 ) ) ( not ( = ?auto_23365 ?auto_23382 ) ) ( not ( = ?auto_23365 ?auto_23384 ) ) ( not ( = ?auto_23365 ?auto_23359 ) ) ( not ( = ?auto_23357 ?auto_23377 ) ) ( not ( = ?auto_23357 ?auto_23379 ) ) ( not ( = ?auto_23357 ?auto_23378 ) ) ( not ( = ?auto_23357 ?auto_23373 ) ) ( not ( = ?auto_23357 ?auto_23381 ) ) ( not ( = ?auto_23357 ?auto_23362 ) ) ( not ( = ?auto_23357 ?auto_23364 ) ) ( not ( = ?auto_23337 ?auto_23343 ) ) ( not ( = ?auto_23337 ?auto_23386 ) ) ( not ( = ?auto_23338 ?auto_23343 ) ) ( not ( = ?auto_23338 ?auto_23386 ) ) ( not ( = ?auto_23339 ?auto_23343 ) ) ( not ( = ?auto_23339 ?auto_23386 ) ) ( not ( = ?auto_23340 ?auto_23343 ) ) ( not ( = ?auto_23340 ?auto_23386 ) ) ( not ( = ?auto_23341 ?auto_23343 ) ) ( not ( = ?auto_23341 ?auto_23386 ) ) ( not ( = ?auto_23344 ?auto_23343 ) ) ( not ( = ?auto_23344 ?auto_23386 ) ) ( not ( = ?auto_23342 ?auto_23343 ) ) ( not ( = ?auto_23342 ?auto_23386 ) ) ( not ( = ?auto_23346 ?auto_23343 ) ) ( not ( = ?auto_23346 ?auto_23386 ) ) ( not ( = ?auto_23343 ?auto_23357 ) ) ( not ( = ?auto_23343 ?auto_23377 ) ) ( not ( = ?auto_23343 ?auto_23379 ) ) ( not ( = ?auto_23343 ?auto_23378 ) ) ( not ( = ?auto_23343 ?auto_23373 ) ) ( not ( = ?auto_23343 ?auto_23381 ) ) ( not ( = ?auto_23343 ?auto_23362 ) ) ( not ( = ?auto_23343 ?auto_23364 ) ) ( not ( = ?auto_23369 ?auto_23380 ) ) ( not ( = ?auto_23369 ?auto_23385 ) ) ( not ( = ?auto_23369 ?auto_23371 ) ) ( not ( = ?auto_23369 ?auto_23358 ) ) ( not ( = ?auto_23369 ?auto_23363 ) ) ( not ( = ?auto_23369 ?auto_23367 ) ) ( not ( = ?auto_23369 ?auto_23374 ) ) ( not ( = ?auto_23369 ?auto_23368 ) ) ( not ( = ?auto_23360 ?auto_23365 ) ) ( not ( = ?auto_23360 ?auto_23370 ) ) ( not ( = ?auto_23360 ?auto_23375 ) ) ( not ( = ?auto_23360 ?auto_23366 ) ) ( not ( = ?auto_23360 ?auto_23383 ) ) ( not ( = ?auto_23360 ?auto_23382 ) ) ( not ( = ?auto_23360 ?auto_23384 ) ) ( not ( = ?auto_23360 ?auto_23359 ) ) ( not ( = ?auto_23386 ?auto_23357 ) ) ( not ( = ?auto_23386 ?auto_23377 ) ) ( not ( = ?auto_23386 ?auto_23379 ) ) ( not ( = ?auto_23386 ?auto_23378 ) ) ( not ( = ?auto_23386 ?auto_23373 ) ) ( not ( = ?auto_23386 ?auto_23381 ) ) ( not ( = ?auto_23386 ?auto_23362 ) ) ( not ( = ?auto_23386 ?auto_23364 ) ) ( not ( = ?auto_23337 ?auto_23348 ) ) ( not ( = ?auto_23337 ?auto_23372 ) ) ( not ( = ?auto_23338 ?auto_23348 ) ) ( not ( = ?auto_23338 ?auto_23372 ) ) ( not ( = ?auto_23339 ?auto_23348 ) ) ( not ( = ?auto_23339 ?auto_23372 ) ) ( not ( = ?auto_23340 ?auto_23348 ) ) ( not ( = ?auto_23340 ?auto_23372 ) ) ( not ( = ?auto_23341 ?auto_23348 ) ) ( not ( = ?auto_23341 ?auto_23372 ) ) ( not ( = ?auto_23344 ?auto_23348 ) ) ( not ( = ?auto_23344 ?auto_23372 ) ) ( not ( = ?auto_23342 ?auto_23348 ) ) ( not ( = ?auto_23342 ?auto_23372 ) ) ( not ( = ?auto_23346 ?auto_23348 ) ) ( not ( = ?auto_23346 ?auto_23372 ) ) ( not ( = ?auto_23345 ?auto_23348 ) ) ( not ( = ?auto_23345 ?auto_23372 ) ) ( not ( = ?auto_23348 ?auto_23386 ) ) ( not ( = ?auto_23348 ?auto_23357 ) ) ( not ( = ?auto_23348 ?auto_23377 ) ) ( not ( = ?auto_23348 ?auto_23379 ) ) ( not ( = ?auto_23348 ?auto_23378 ) ) ( not ( = ?auto_23348 ?auto_23373 ) ) ( not ( = ?auto_23348 ?auto_23381 ) ) ( not ( = ?auto_23348 ?auto_23362 ) ) ( not ( = ?auto_23348 ?auto_23364 ) ) ( not ( = ?auto_23372 ?auto_23386 ) ) ( not ( = ?auto_23372 ?auto_23357 ) ) ( not ( = ?auto_23372 ?auto_23377 ) ) ( not ( = ?auto_23372 ?auto_23379 ) ) ( not ( = ?auto_23372 ?auto_23378 ) ) ( not ( = ?auto_23372 ?auto_23373 ) ) ( not ( = ?auto_23372 ?auto_23381 ) ) ( not ( = ?auto_23372 ?auto_23362 ) ) ( not ( = ?auto_23372 ?auto_23364 ) ) ( not ( = ?auto_23337 ?auto_23347 ) ) ( not ( = ?auto_23337 ?auto_23361 ) ) ( not ( = ?auto_23338 ?auto_23347 ) ) ( not ( = ?auto_23338 ?auto_23361 ) ) ( not ( = ?auto_23339 ?auto_23347 ) ) ( not ( = ?auto_23339 ?auto_23361 ) ) ( not ( = ?auto_23340 ?auto_23347 ) ) ( not ( = ?auto_23340 ?auto_23361 ) ) ( not ( = ?auto_23341 ?auto_23347 ) ) ( not ( = ?auto_23341 ?auto_23361 ) ) ( not ( = ?auto_23344 ?auto_23347 ) ) ( not ( = ?auto_23344 ?auto_23361 ) ) ( not ( = ?auto_23342 ?auto_23347 ) ) ( not ( = ?auto_23342 ?auto_23361 ) ) ( not ( = ?auto_23346 ?auto_23347 ) ) ( not ( = ?auto_23346 ?auto_23361 ) ) ( not ( = ?auto_23345 ?auto_23347 ) ) ( not ( = ?auto_23345 ?auto_23361 ) ) ( not ( = ?auto_23343 ?auto_23347 ) ) ( not ( = ?auto_23343 ?auto_23361 ) ) ( not ( = ?auto_23347 ?auto_23372 ) ) ( not ( = ?auto_23347 ?auto_23386 ) ) ( not ( = ?auto_23347 ?auto_23357 ) ) ( not ( = ?auto_23347 ?auto_23377 ) ) ( not ( = ?auto_23347 ?auto_23379 ) ) ( not ( = ?auto_23347 ?auto_23378 ) ) ( not ( = ?auto_23347 ?auto_23373 ) ) ( not ( = ?auto_23347 ?auto_23381 ) ) ( not ( = ?auto_23347 ?auto_23362 ) ) ( not ( = ?auto_23347 ?auto_23364 ) ) ( not ( = ?auto_23356 ?auto_23363 ) ) ( not ( = ?auto_23356 ?auto_23369 ) ) ( not ( = ?auto_23356 ?auto_23380 ) ) ( not ( = ?auto_23356 ?auto_23385 ) ) ( not ( = ?auto_23356 ?auto_23371 ) ) ( not ( = ?auto_23356 ?auto_23358 ) ) ( not ( = ?auto_23356 ?auto_23367 ) ) ( not ( = ?auto_23356 ?auto_23374 ) ) ( not ( = ?auto_23356 ?auto_23368 ) ) ( not ( = ?auto_23376 ?auto_23383 ) ) ( not ( = ?auto_23376 ?auto_23360 ) ) ( not ( = ?auto_23376 ?auto_23365 ) ) ( not ( = ?auto_23376 ?auto_23370 ) ) ( not ( = ?auto_23376 ?auto_23375 ) ) ( not ( = ?auto_23376 ?auto_23366 ) ) ( not ( = ?auto_23376 ?auto_23382 ) ) ( not ( = ?auto_23376 ?auto_23384 ) ) ( not ( = ?auto_23376 ?auto_23359 ) ) ( not ( = ?auto_23361 ?auto_23372 ) ) ( not ( = ?auto_23361 ?auto_23386 ) ) ( not ( = ?auto_23361 ?auto_23357 ) ) ( not ( = ?auto_23361 ?auto_23377 ) ) ( not ( = ?auto_23361 ?auto_23379 ) ) ( not ( = ?auto_23361 ?auto_23378 ) ) ( not ( = ?auto_23361 ?auto_23373 ) ) ( not ( = ?auto_23361 ?auto_23381 ) ) ( not ( = ?auto_23361 ?auto_23362 ) ) ( not ( = ?auto_23361 ?auto_23364 ) ) ( not ( = ?auto_23337 ?auto_23349 ) ) ( not ( = ?auto_23337 ?auto_23352 ) ) ( not ( = ?auto_23338 ?auto_23349 ) ) ( not ( = ?auto_23338 ?auto_23352 ) ) ( not ( = ?auto_23339 ?auto_23349 ) ) ( not ( = ?auto_23339 ?auto_23352 ) ) ( not ( = ?auto_23340 ?auto_23349 ) ) ( not ( = ?auto_23340 ?auto_23352 ) ) ( not ( = ?auto_23341 ?auto_23349 ) ) ( not ( = ?auto_23341 ?auto_23352 ) ) ( not ( = ?auto_23344 ?auto_23349 ) ) ( not ( = ?auto_23344 ?auto_23352 ) ) ( not ( = ?auto_23342 ?auto_23349 ) ) ( not ( = ?auto_23342 ?auto_23352 ) ) ( not ( = ?auto_23346 ?auto_23349 ) ) ( not ( = ?auto_23346 ?auto_23352 ) ) ( not ( = ?auto_23345 ?auto_23349 ) ) ( not ( = ?auto_23345 ?auto_23352 ) ) ( not ( = ?auto_23343 ?auto_23349 ) ) ( not ( = ?auto_23343 ?auto_23352 ) ) ( not ( = ?auto_23348 ?auto_23349 ) ) ( not ( = ?auto_23348 ?auto_23352 ) ) ( not ( = ?auto_23349 ?auto_23361 ) ) ( not ( = ?auto_23349 ?auto_23372 ) ) ( not ( = ?auto_23349 ?auto_23386 ) ) ( not ( = ?auto_23349 ?auto_23357 ) ) ( not ( = ?auto_23349 ?auto_23377 ) ) ( not ( = ?auto_23349 ?auto_23379 ) ) ( not ( = ?auto_23349 ?auto_23378 ) ) ( not ( = ?auto_23349 ?auto_23373 ) ) ( not ( = ?auto_23349 ?auto_23381 ) ) ( not ( = ?auto_23349 ?auto_23362 ) ) ( not ( = ?auto_23349 ?auto_23364 ) ) ( not ( = ?auto_23350 ?auto_23356 ) ) ( not ( = ?auto_23350 ?auto_23363 ) ) ( not ( = ?auto_23350 ?auto_23369 ) ) ( not ( = ?auto_23350 ?auto_23380 ) ) ( not ( = ?auto_23350 ?auto_23385 ) ) ( not ( = ?auto_23350 ?auto_23371 ) ) ( not ( = ?auto_23350 ?auto_23358 ) ) ( not ( = ?auto_23350 ?auto_23367 ) ) ( not ( = ?auto_23350 ?auto_23374 ) ) ( not ( = ?auto_23350 ?auto_23368 ) ) ( not ( = ?auto_23355 ?auto_23376 ) ) ( not ( = ?auto_23355 ?auto_23383 ) ) ( not ( = ?auto_23355 ?auto_23360 ) ) ( not ( = ?auto_23355 ?auto_23365 ) ) ( not ( = ?auto_23355 ?auto_23370 ) ) ( not ( = ?auto_23355 ?auto_23375 ) ) ( not ( = ?auto_23355 ?auto_23366 ) ) ( not ( = ?auto_23355 ?auto_23382 ) ) ( not ( = ?auto_23355 ?auto_23384 ) ) ( not ( = ?auto_23355 ?auto_23359 ) ) ( not ( = ?auto_23352 ?auto_23361 ) ) ( not ( = ?auto_23352 ?auto_23372 ) ) ( not ( = ?auto_23352 ?auto_23386 ) ) ( not ( = ?auto_23352 ?auto_23357 ) ) ( not ( = ?auto_23352 ?auto_23377 ) ) ( not ( = ?auto_23352 ?auto_23379 ) ) ( not ( = ?auto_23352 ?auto_23378 ) ) ( not ( = ?auto_23352 ?auto_23373 ) ) ( not ( = ?auto_23352 ?auto_23381 ) ) ( not ( = ?auto_23352 ?auto_23362 ) ) ( not ( = ?auto_23352 ?auto_23364 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_23337 ?auto_23338 ?auto_23339 ?auto_23340 ?auto_23341 ?auto_23344 ?auto_23342 ?auto_23346 ?auto_23345 ?auto_23343 ?auto_23348 ?auto_23347 )
      ( MAKE-1CRATE ?auto_23347 ?auto_23349 )
      ( MAKE-12CRATE-VERIFY ?auto_23337 ?auto_23338 ?auto_23339 ?auto_23340 ?auto_23341 ?auto_23344 ?auto_23342 ?auto_23346 ?auto_23345 ?auto_23343 ?auto_23348 ?auto_23347 ?auto_23349 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23389 - SURFACE
      ?auto_23390 - SURFACE
    )
    :vars
    (
      ?auto_23391 - HOIST
      ?auto_23392 - PLACE
      ?auto_23394 - PLACE
      ?auto_23395 - HOIST
      ?auto_23396 - SURFACE
      ?auto_23393 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23391 ?auto_23392 ) ( SURFACE-AT ?auto_23389 ?auto_23392 ) ( CLEAR ?auto_23389 ) ( IS-CRATE ?auto_23390 ) ( AVAILABLE ?auto_23391 ) ( not ( = ?auto_23394 ?auto_23392 ) ) ( HOIST-AT ?auto_23395 ?auto_23394 ) ( AVAILABLE ?auto_23395 ) ( SURFACE-AT ?auto_23390 ?auto_23394 ) ( ON ?auto_23390 ?auto_23396 ) ( CLEAR ?auto_23390 ) ( TRUCK-AT ?auto_23393 ?auto_23392 ) ( not ( = ?auto_23389 ?auto_23390 ) ) ( not ( = ?auto_23389 ?auto_23396 ) ) ( not ( = ?auto_23390 ?auto_23396 ) ) ( not ( = ?auto_23391 ?auto_23395 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23393 ?auto_23392 ?auto_23394 )
      ( !LIFT ?auto_23395 ?auto_23390 ?auto_23396 ?auto_23394 )
      ( !LOAD ?auto_23395 ?auto_23390 ?auto_23393 ?auto_23394 )
      ( !DRIVE ?auto_23393 ?auto_23394 ?auto_23392 )
      ( !UNLOAD ?auto_23391 ?auto_23390 ?auto_23393 ?auto_23392 )
      ( !DROP ?auto_23391 ?auto_23390 ?auto_23389 ?auto_23392 )
      ( MAKE-1CRATE-VERIFY ?auto_23389 ?auto_23390 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_23411 - SURFACE
      ?auto_23412 - SURFACE
      ?auto_23413 - SURFACE
      ?auto_23414 - SURFACE
      ?auto_23415 - SURFACE
      ?auto_23418 - SURFACE
      ?auto_23416 - SURFACE
      ?auto_23420 - SURFACE
      ?auto_23419 - SURFACE
      ?auto_23417 - SURFACE
      ?auto_23422 - SURFACE
      ?auto_23421 - SURFACE
      ?auto_23423 - SURFACE
      ?auto_23424 - SURFACE
    )
    :vars
    (
      ?auto_23427 - HOIST
      ?auto_23428 - PLACE
      ?auto_23426 - PLACE
      ?auto_23429 - HOIST
      ?auto_23425 - SURFACE
      ?auto_23437 - PLACE
      ?auto_23448 - HOIST
      ?auto_23457 - SURFACE
      ?auto_23431 - PLACE
      ?auto_23442 - HOIST
      ?auto_23451 - SURFACE
      ?auto_23456 - SURFACE
      ?auto_23454 - PLACE
      ?auto_23462 - HOIST
      ?auto_23439 - SURFACE
      ?auto_23447 - PLACE
      ?auto_23452 - HOIST
      ?auto_23445 - SURFACE
      ?auto_23461 - PLACE
      ?auto_23434 - HOIST
      ?auto_23453 - SURFACE
      ?auto_23444 - PLACE
      ?auto_23435 - HOIST
      ?auto_23459 - SURFACE
      ?auto_23450 - PLACE
      ?auto_23449 - HOIST
      ?auto_23433 - SURFACE
      ?auto_23458 - SURFACE
      ?auto_23441 - PLACE
      ?auto_23432 - HOIST
      ?auto_23455 - SURFACE
      ?auto_23438 - PLACE
      ?auto_23440 - HOIST
      ?auto_23446 - SURFACE
      ?auto_23436 - PLACE
      ?auto_23460 - HOIST
      ?auto_23443 - SURFACE
      ?auto_23430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23427 ?auto_23428 ) ( IS-CRATE ?auto_23424 ) ( not ( = ?auto_23426 ?auto_23428 ) ) ( HOIST-AT ?auto_23429 ?auto_23426 ) ( SURFACE-AT ?auto_23424 ?auto_23426 ) ( ON ?auto_23424 ?auto_23425 ) ( CLEAR ?auto_23424 ) ( not ( = ?auto_23423 ?auto_23424 ) ) ( not ( = ?auto_23423 ?auto_23425 ) ) ( not ( = ?auto_23424 ?auto_23425 ) ) ( not ( = ?auto_23427 ?auto_23429 ) ) ( IS-CRATE ?auto_23423 ) ( not ( = ?auto_23437 ?auto_23428 ) ) ( HOIST-AT ?auto_23448 ?auto_23437 ) ( AVAILABLE ?auto_23448 ) ( SURFACE-AT ?auto_23423 ?auto_23437 ) ( ON ?auto_23423 ?auto_23457 ) ( CLEAR ?auto_23423 ) ( not ( = ?auto_23421 ?auto_23423 ) ) ( not ( = ?auto_23421 ?auto_23457 ) ) ( not ( = ?auto_23423 ?auto_23457 ) ) ( not ( = ?auto_23427 ?auto_23448 ) ) ( IS-CRATE ?auto_23421 ) ( not ( = ?auto_23431 ?auto_23428 ) ) ( HOIST-AT ?auto_23442 ?auto_23431 ) ( AVAILABLE ?auto_23442 ) ( SURFACE-AT ?auto_23421 ?auto_23431 ) ( ON ?auto_23421 ?auto_23451 ) ( CLEAR ?auto_23421 ) ( not ( = ?auto_23422 ?auto_23421 ) ) ( not ( = ?auto_23422 ?auto_23451 ) ) ( not ( = ?auto_23421 ?auto_23451 ) ) ( not ( = ?auto_23427 ?auto_23442 ) ) ( IS-CRATE ?auto_23422 ) ( SURFACE-AT ?auto_23422 ?auto_23426 ) ( ON ?auto_23422 ?auto_23456 ) ( CLEAR ?auto_23422 ) ( not ( = ?auto_23417 ?auto_23422 ) ) ( not ( = ?auto_23417 ?auto_23456 ) ) ( not ( = ?auto_23422 ?auto_23456 ) ) ( IS-CRATE ?auto_23417 ) ( not ( = ?auto_23454 ?auto_23428 ) ) ( HOIST-AT ?auto_23462 ?auto_23454 ) ( AVAILABLE ?auto_23462 ) ( SURFACE-AT ?auto_23417 ?auto_23454 ) ( ON ?auto_23417 ?auto_23439 ) ( CLEAR ?auto_23417 ) ( not ( = ?auto_23419 ?auto_23417 ) ) ( not ( = ?auto_23419 ?auto_23439 ) ) ( not ( = ?auto_23417 ?auto_23439 ) ) ( not ( = ?auto_23427 ?auto_23462 ) ) ( IS-CRATE ?auto_23419 ) ( not ( = ?auto_23447 ?auto_23428 ) ) ( HOIST-AT ?auto_23452 ?auto_23447 ) ( AVAILABLE ?auto_23452 ) ( SURFACE-AT ?auto_23419 ?auto_23447 ) ( ON ?auto_23419 ?auto_23445 ) ( CLEAR ?auto_23419 ) ( not ( = ?auto_23420 ?auto_23419 ) ) ( not ( = ?auto_23420 ?auto_23445 ) ) ( not ( = ?auto_23419 ?auto_23445 ) ) ( not ( = ?auto_23427 ?auto_23452 ) ) ( IS-CRATE ?auto_23420 ) ( not ( = ?auto_23461 ?auto_23428 ) ) ( HOIST-AT ?auto_23434 ?auto_23461 ) ( AVAILABLE ?auto_23434 ) ( SURFACE-AT ?auto_23420 ?auto_23461 ) ( ON ?auto_23420 ?auto_23453 ) ( CLEAR ?auto_23420 ) ( not ( = ?auto_23416 ?auto_23420 ) ) ( not ( = ?auto_23416 ?auto_23453 ) ) ( not ( = ?auto_23420 ?auto_23453 ) ) ( not ( = ?auto_23427 ?auto_23434 ) ) ( IS-CRATE ?auto_23416 ) ( not ( = ?auto_23444 ?auto_23428 ) ) ( HOIST-AT ?auto_23435 ?auto_23444 ) ( AVAILABLE ?auto_23435 ) ( SURFACE-AT ?auto_23416 ?auto_23444 ) ( ON ?auto_23416 ?auto_23459 ) ( CLEAR ?auto_23416 ) ( not ( = ?auto_23418 ?auto_23416 ) ) ( not ( = ?auto_23418 ?auto_23459 ) ) ( not ( = ?auto_23416 ?auto_23459 ) ) ( not ( = ?auto_23427 ?auto_23435 ) ) ( IS-CRATE ?auto_23418 ) ( not ( = ?auto_23450 ?auto_23428 ) ) ( HOIST-AT ?auto_23449 ?auto_23450 ) ( AVAILABLE ?auto_23449 ) ( SURFACE-AT ?auto_23418 ?auto_23450 ) ( ON ?auto_23418 ?auto_23433 ) ( CLEAR ?auto_23418 ) ( not ( = ?auto_23415 ?auto_23418 ) ) ( not ( = ?auto_23415 ?auto_23433 ) ) ( not ( = ?auto_23418 ?auto_23433 ) ) ( not ( = ?auto_23427 ?auto_23449 ) ) ( IS-CRATE ?auto_23415 ) ( AVAILABLE ?auto_23429 ) ( SURFACE-AT ?auto_23415 ?auto_23426 ) ( ON ?auto_23415 ?auto_23458 ) ( CLEAR ?auto_23415 ) ( not ( = ?auto_23414 ?auto_23415 ) ) ( not ( = ?auto_23414 ?auto_23458 ) ) ( not ( = ?auto_23415 ?auto_23458 ) ) ( IS-CRATE ?auto_23414 ) ( not ( = ?auto_23441 ?auto_23428 ) ) ( HOIST-AT ?auto_23432 ?auto_23441 ) ( AVAILABLE ?auto_23432 ) ( SURFACE-AT ?auto_23414 ?auto_23441 ) ( ON ?auto_23414 ?auto_23455 ) ( CLEAR ?auto_23414 ) ( not ( = ?auto_23413 ?auto_23414 ) ) ( not ( = ?auto_23413 ?auto_23455 ) ) ( not ( = ?auto_23414 ?auto_23455 ) ) ( not ( = ?auto_23427 ?auto_23432 ) ) ( IS-CRATE ?auto_23413 ) ( not ( = ?auto_23438 ?auto_23428 ) ) ( HOIST-AT ?auto_23440 ?auto_23438 ) ( AVAILABLE ?auto_23440 ) ( SURFACE-AT ?auto_23413 ?auto_23438 ) ( ON ?auto_23413 ?auto_23446 ) ( CLEAR ?auto_23413 ) ( not ( = ?auto_23412 ?auto_23413 ) ) ( not ( = ?auto_23412 ?auto_23446 ) ) ( not ( = ?auto_23413 ?auto_23446 ) ) ( not ( = ?auto_23427 ?auto_23440 ) ) ( SURFACE-AT ?auto_23411 ?auto_23428 ) ( CLEAR ?auto_23411 ) ( IS-CRATE ?auto_23412 ) ( AVAILABLE ?auto_23427 ) ( not ( = ?auto_23436 ?auto_23428 ) ) ( HOIST-AT ?auto_23460 ?auto_23436 ) ( AVAILABLE ?auto_23460 ) ( SURFACE-AT ?auto_23412 ?auto_23436 ) ( ON ?auto_23412 ?auto_23443 ) ( CLEAR ?auto_23412 ) ( TRUCK-AT ?auto_23430 ?auto_23428 ) ( not ( = ?auto_23411 ?auto_23412 ) ) ( not ( = ?auto_23411 ?auto_23443 ) ) ( not ( = ?auto_23412 ?auto_23443 ) ) ( not ( = ?auto_23427 ?auto_23460 ) ) ( not ( = ?auto_23411 ?auto_23413 ) ) ( not ( = ?auto_23411 ?auto_23446 ) ) ( not ( = ?auto_23413 ?auto_23443 ) ) ( not ( = ?auto_23438 ?auto_23436 ) ) ( not ( = ?auto_23440 ?auto_23460 ) ) ( not ( = ?auto_23446 ?auto_23443 ) ) ( not ( = ?auto_23411 ?auto_23414 ) ) ( not ( = ?auto_23411 ?auto_23455 ) ) ( not ( = ?auto_23412 ?auto_23414 ) ) ( not ( = ?auto_23412 ?auto_23455 ) ) ( not ( = ?auto_23414 ?auto_23446 ) ) ( not ( = ?auto_23414 ?auto_23443 ) ) ( not ( = ?auto_23441 ?auto_23438 ) ) ( not ( = ?auto_23441 ?auto_23436 ) ) ( not ( = ?auto_23432 ?auto_23440 ) ) ( not ( = ?auto_23432 ?auto_23460 ) ) ( not ( = ?auto_23455 ?auto_23446 ) ) ( not ( = ?auto_23455 ?auto_23443 ) ) ( not ( = ?auto_23411 ?auto_23415 ) ) ( not ( = ?auto_23411 ?auto_23458 ) ) ( not ( = ?auto_23412 ?auto_23415 ) ) ( not ( = ?auto_23412 ?auto_23458 ) ) ( not ( = ?auto_23413 ?auto_23415 ) ) ( not ( = ?auto_23413 ?auto_23458 ) ) ( not ( = ?auto_23415 ?auto_23455 ) ) ( not ( = ?auto_23415 ?auto_23446 ) ) ( not ( = ?auto_23415 ?auto_23443 ) ) ( not ( = ?auto_23426 ?auto_23441 ) ) ( not ( = ?auto_23426 ?auto_23438 ) ) ( not ( = ?auto_23426 ?auto_23436 ) ) ( not ( = ?auto_23429 ?auto_23432 ) ) ( not ( = ?auto_23429 ?auto_23440 ) ) ( not ( = ?auto_23429 ?auto_23460 ) ) ( not ( = ?auto_23458 ?auto_23455 ) ) ( not ( = ?auto_23458 ?auto_23446 ) ) ( not ( = ?auto_23458 ?auto_23443 ) ) ( not ( = ?auto_23411 ?auto_23418 ) ) ( not ( = ?auto_23411 ?auto_23433 ) ) ( not ( = ?auto_23412 ?auto_23418 ) ) ( not ( = ?auto_23412 ?auto_23433 ) ) ( not ( = ?auto_23413 ?auto_23418 ) ) ( not ( = ?auto_23413 ?auto_23433 ) ) ( not ( = ?auto_23414 ?auto_23418 ) ) ( not ( = ?auto_23414 ?auto_23433 ) ) ( not ( = ?auto_23418 ?auto_23458 ) ) ( not ( = ?auto_23418 ?auto_23455 ) ) ( not ( = ?auto_23418 ?auto_23446 ) ) ( not ( = ?auto_23418 ?auto_23443 ) ) ( not ( = ?auto_23450 ?auto_23426 ) ) ( not ( = ?auto_23450 ?auto_23441 ) ) ( not ( = ?auto_23450 ?auto_23438 ) ) ( not ( = ?auto_23450 ?auto_23436 ) ) ( not ( = ?auto_23449 ?auto_23429 ) ) ( not ( = ?auto_23449 ?auto_23432 ) ) ( not ( = ?auto_23449 ?auto_23440 ) ) ( not ( = ?auto_23449 ?auto_23460 ) ) ( not ( = ?auto_23433 ?auto_23458 ) ) ( not ( = ?auto_23433 ?auto_23455 ) ) ( not ( = ?auto_23433 ?auto_23446 ) ) ( not ( = ?auto_23433 ?auto_23443 ) ) ( not ( = ?auto_23411 ?auto_23416 ) ) ( not ( = ?auto_23411 ?auto_23459 ) ) ( not ( = ?auto_23412 ?auto_23416 ) ) ( not ( = ?auto_23412 ?auto_23459 ) ) ( not ( = ?auto_23413 ?auto_23416 ) ) ( not ( = ?auto_23413 ?auto_23459 ) ) ( not ( = ?auto_23414 ?auto_23416 ) ) ( not ( = ?auto_23414 ?auto_23459 ) ) ( not ( = ?auto_23415 ?auto_23416 ) ) ( not ( = ?auto_23415 ?auto_23459 ) ) ( not ( = ?auto_23416 ?auto_23433 ) ) ( not ( = ?auto_23416 ?auto_23458 ) ) ( not ( = ?auto_23416 ?auto_23455 ) ) ( not ( = ?auto_23416 ?auto_23446 ) ) ( not ( = ?auto_23416 ?auto_23443 ) ) ( not ( = ?auto_23444 ?auto_23450 ) ) ( not ( = ?auto_23444 ?auto_23426 ) ) ( not ( = ?auto_23444 ?auto_23441 ) ) ( not ( = ?auto_23444 ?auto_23438 ) ) ( not ( = ?auto_23444 ?auto_23436 ) ) ( not ( = ?auto_23435 ?auto_23449 ) ) ( not ( = ?auto_23435 ?auto_23429 ) ) ( not ( = ?auto_23435 ?auto_23432 ) ) ( not ( = ?auto_23435 ?auto_23440 ) ) ( not ( = ?auto_23435 ?auto_23460 ) ) ( not ( = ?auto_23459 ?auto_23433 ) ) ( not ( = ?auto_23459 ?auto_23458 ) ) ( not ( = ?auto_23459 ?auto_23455 ) ) ( not ( = ?auto_23459 ?auto_23446 ) ) ( not ( = ?auto_23459 ?auto_23443 ) ) ( not ( = ?auto_23411 ?auto_23420 ) ) ( not ( = ?auto_23411 ?auto_23453 ) ) ( not ( = ?auto_23412 ?auto_23420 ) ) ( not ( = ?auto_23412 ?auto_23453 ) ) ( not ( = ?auto_23413 ?auto_23420 ) ) ( not ( = ?auto_23413 ?auto_23453 ) ) ( not ( = ?auto_23414 ?auto_23420 ) ) ( not ( = ?auto_23414 ?auto_23453 ) ) ( not ( = ?auto_23415 ?auto_23420 ) ) ( not ( = ?auto_23415 ?auto_23453 ) ) ( not ( = ?auto_23418 ?auto_23420 ) ) ( not ( = ?auto_23418 ?auto_23453 ) ) ( not ( = ?auto_23420 ?auto_23459 ) ) ( not ( = ?auto_23420 ?auto_23433 ) ) ( not ( = ?auto_23420 ?auto_23458 ) ) ( not ( = ?auto_23420 ?auto_23455 ) ) ( not ( = ?auto_23420 ?auto_23446 ) ) ( not ( = ?auto_23420 ?auto_23443 ) ) ( not ( = ?auto_23461 ?auto_23444 ) ) ( not ( = ?auto_23461 ?auto_23450 ) ) ( not ( = ?auto_23461 ?auto_23426 ) ) ( not ( = ?auto_23461 ?auto_23441 ) ) ( not ( = ?auto_23461 ?auto_23438 ) ) ( not ( = ?auto_23461 ?auto_23436 ) ) ( not ( = ?auto_23434 ?auto_23435 ) ) ( not ( = ?auto_23434 ?auto_23449 ) ) ( not ( = ?auto_23434 ?auto_23429 ) ) ( not ( = ?auto_23434 ?auto_23432 ) ) ( not ( = ?auto_23434 ?auto_23440 ) ) ( not ( = ?auto_23434 ?auto_23460 ) ) ( not ( = ?auto_23453 ?auto_23459 ) ) ( not ( = ?auto_23453 ?auto_23433 ) ) ( not ( = ?auto_23453 ?auto_23458 ) ) ( not ( = ?auto_23453 ?auto_23455 ) ) ( not ( = ?auto_23453 ?auto_23446 ) ) ( not ( = ?auto_23453 ?auto_23443 ) ) ( not ( = ?auto_23411 ?auto_23419 ) ) ( not ( = ?auto_23411 ?auto_23445 ) ) ( not ( = ?auto_23412 ?auto_23419 ) ) ( not ( = ?auto_23412 ?auto_23445 ) ) ( not ( = ?auto_23413 ?auto_23419 ) ) ( not ( = ?auto_23413 ?auto_23445 ) ) ( not ( = ?auto_23414 ?auto_23419 ) ) ( not ( = ?auto_23414 ?auto_23445 ) ) ( not ( = ?auto_23415 ?auto_23419 ) ) ( not ( = ?auto_23415 ?auto_23445 ) ) ( not ( = ?auto_23418 ?auto_23419 ) ) ( not ( = ?auto_23418 ?auto_23445 ) ) ( not ( = ?auto_23416 ?auto_23419 ) ) ( not ( = ?auto_23416 ?auto_23445 ) ) ( not ( = ?auto_23419 ?auto_23453 ) ) ( not ( = ?auto_23419 ?auto_23459 ) ) ( not ( = ?auto_23419 ?auto_23433 ) ) ( not ( = ?auto_23419 ?auto_23458 ) ) ( not ( = ?auto_23419 ?auto_23455 ) ) ( not ( = ?auto_23419 ?auto_23446 ) ) ( not ( = ?auto_23419 ?auto_23443 ) ) ( not ( = ?auto_23447 ?auto_23461 ) ) ( not ( = ?auto_23447 ?auto_23444 ) ) ( not ( = ?auto_23447 ?auto_23450 ) ) ( not ( = ?auto_23447 ?auto_23426 ) ) ( not ( = ?auto_23447 ?auto_23441 ) ) ( not ( = ?auto_23447 ?auto_23438 ) ) ( not ( = ?auto_23447 ?auto_23436 ) ) ( not ( = ?auto_23452 ?auto_23434 ) ) ( not ( = ?auto_23452 ?auto_23435 ) ) ( not ( = ?auto_23452 ?auto_23449 ) ) ( not ( = ?auto_23452 ?auto_23429 ) ) ( not ( = ?auto_23452 ?auto_23432 ) ) ( not ( = ?auto_23452 ?auto_23440 ) ) ( not ( = ?auto_23452 ?auto_23460 ) ) ( not ( = ?auto_23445 ?auto_23453 ) ) ( not ( = ?auto_23445 ?auto_23459 ) ) ( not ( = ?auto_23445 ?auto_23433 ) ) ( not ( = ?auto_23445 ?auto_23458 ) ) ( not ( = ?auto_23445 ?auto_23455 ) ) ( not ( = ?auto_23445 ?auto_23446 ) ) ( not ( = ?auto_23445 ?auto_23443 ) ) ( not ( = ?auto_23411 ?auto_23417 ) ) ( not ( = ?auto_23411 ?auto_23439 ) ) ( not ( = ?auto_23412 ?auto_23417 ) ) ( not ( = ?auto_23412 ?auto_23439 ) ) ( not ( = ?auto_23413 ?auto_23417 ) ) ( not ( = ?auto_23413 ?auto_23439 ) ) ( not ( = ?auto_23414 ?auto_23417 ) ) ( not ( = ?auto_23414 ?auto_23439 ) ) ( not ( = ?auto_23415 ?auto_23417 ) ) ( not ( = ?auto_23415 ?auto_23439 ) ) ( not ( = ?auto_23418 ?auto_23417 ) ) ( not ( = ?auto_23418 ?auto_23439 ) ) ( not ( = ?auto_23416 ?auto_23417 ) ) ( not ( = ?auto_23416 ?auto_23439 ) ) ( not ( = ?auto_23420 ?auto_23417 ) ) ( not ( = ?auto_23420 ?auto_23439 ) ) ( not ( = ?auto_23417 ?auto_23445 ) ) ( not ( = ?auto_23417 ?auto_23453 ) ) ( not ( = ?auto_23417 ?auto_23459 ) ) ( not ( = ?auto_23417 ?auto_23433 ) ) ( not ( = ?auto_23417 ?auto_23458 ) ) ( not ( = ?auto_23417 ?auto_23455 ) ) ( not ( = ?auto_23417 ?auto_23446 ) ) ( not ( = ?auto_23417 ?auto_23443 ) ) ( not ( = ?auto_23454 ?auto_23447 ) ) ( not ( = ?auto_23454 ?auto_23461 ) ) ( not ( = ?auto_23454 ?auto_23444 ) ) ( not ( = ?auto_23454 ?auto_23450 ) ) ( not ( = ?auto_23454 ?auto_23426 ) ) ( not ( = ?auto_23454 ?auto_23441 ) ) ( not ( = ?auto_23454 ?auto_23438 ) ) ( not ( = ?auto_23454 ?auto_23436 ) ) ( not ( = ?auto_23462 ?auto_23452 ) ) ( not ( = ?auto_23462 ?auto_23434 ) ) ( not ( = ?auto_23462 ?auto_23435 ) ) ( not ( = ?auto_23462 ?auto_23449 ) ) ( not ( = ?auto_23462 ?auto_23429 ) ) ( not ( = ?auto_23462 ?auto_23432 ) ) ( not ( = ?auto_23462 ?auto_23440 ) ) ( not ( = ?auto_23462 ?auto_23460 ) ) ( not ( = ?auto_23439 ?auto_23445 ) ) ( not ( = ?auto_23439 ?auto_23453 ) ) ( not ( = ?auto_23439 ?auto_23459 ) ) ( not ( = ?auto_23439 ?auto_23433 ) ) ( not ( = ?auto_23439 ?auto_23458 ) ) ( not ( = ?auto_23439 ?auto_23455 ) ) ( not ( = ?auto_23439 ?auto_23446 ) ) ( not ( = ?auto_23439 ?auto_23443 ) ) ( not ( = ?auto_23411 ?auto_23422 ) ) ( not ( = ?auto_23411 ?auto_23456 ) ) ( not ( = ?auto_23412 ?auto_23422 ) ) ( not ( = ?auto_23412 ?auto_23456 ) ) ( not ( = ?auto_23413 ?auto_23422 ) ) ( not ( = ?auto_23413 ?auto_23456 ) ) ( not ( = ?auto_23414 ?auto_23422 ) ) ( not ( = ?auto_23414 ?auto_23456 ) ) ( not ( = ?auto_23415 ?auto_23422 ) ) ( not ( = ?auto_23415 ?auto_23456 ) ) ( not ( = ?auto_23418 ?auto_23422 ) ) ( not ( = ?auto_23418 ?auto_23456 ) ) ( not ( = ?auto_23416 ?auto_23422 ) ) ( not ( = ?auto_23416 ?auto_23456 ) ) ( not ( = ?auto_23420 ?auto_23422 ) ) ( not ( = ?auto_23420 ?auto_23456 ) ) ( not ( = ?auto_23419 ?auto_23422 ) ) ( not ( = ?auto_23419 ?auto_23456 ) ) ( not ( = ?auto_23422 ?auto_23439 ) ) ( not ( = ?auto_23422 ?auto_23445 ) ) ( not ( = ?auto_23422 ?auto_23453 ) ) ( not ( = ?auto_23422 ?auto_23459 ) ) ( not ( = ?auto_23422 ?auto_23433 ) ) ( not ( = ?auto_23422 ?auto_23458 ) ) ( not ( = ?auto_23422 ?auto_23455 ) ) ( not ( = ?auto_23422 ?auto_23446 ) ) ( not ( = ?auto_23422 ?auto_23443 ) ) ( not ( = ?auto_23456 ?auto_23439 ) ) ( not ( = ?auto_23456 ?auto_23445 ) ) ( not ( = ?auto_23456 ?auto_23453 ) ) ( not ( = ?auto_23456 ?auto_23459 ) ) ( not ( = ?auto_23456 ?auto_23433 ) ) ( not ( = ?auto_23456 ?auto_23458 ) ) ( not ( = ?auto_23456 ?auto_23455 ) ) ( not ( = ?auto_23456 ?auto_23446 ) ) ( not ( = ?auto_23456 ?auto_23443 ) ) ( not ( = ?auto_23411 ?auto_23421 ) ) ( not ( = ?auto_23411 ?auto_23451 ) ) ( not ( = ?auto_23412 ?auto_23421 ) ) ( not ( = ?auto_23412 ?auto_23451 ) ) ( not ( = ?auto_23413 ?auto_23421 ) ) ( not ( = ?auto_23413 ?auto_23451 ) ) ( not ( = ?auto_23414 ?auto_23421 ) ) ( not ( = ?auto_23414 ?auto_23451 ) ) ( not ( = ?auto_23415 ?auto_23421 ) ) ( not ( = ?auto_23415 ?auto_23451 ) ) ( not ( = ?auto_23418 ?auto_23421 ) ) ( not ( = ?auto_23418 ?auto_23451 ) ) ( not ( = ?auto_23416 ?auto_23421 ) ) ( not ( = ?auto_23416 ?auto_23451 ) ) ( not ( = ?auto_23420 ?auto_23421 ) ) ( not ( = ?auto_23420 ?auto_23451 ) ) ( not ( = ?auto_23419 ?auto_23421 ) ) ( not ( = ?auto_23419 ?auto_23451 ) ) ( not ( = ?auto_23417 ?auto_23421 ) ) ( not ( = ?auto_23417 ?auto_23451 ) ) ( not ( = ?auto_23421 ?auto_23456 ) ) ( not ( = ?auto_23421 ?auto_23439 ) ) ( not ( = ?auto_23421 ?auto_23445 ) ) ( not ( = ?auto_23421 ?auto_23453 ) ) ( not ( = ?auto_23421 ?auto_23459 ) ) ( not ( = ?auto_23421 ?auto_23433 ) ) ( not ( = ?auto_23421 ?auto_23458 ) ) ( not ( = ?auto_23421 ?auto_23455 ) ) ( not ( = ?auto_23421 ?auto_23446 ) ) ( not ( = ?auto_23421 ?auto_23443 ) ) ( not ( = ?auto_23431 ?auto_23426 ) ) ( not ( = ?auto_23431 ?auto_23454 ) ) ( not ( = ?auto_23431 ?auto_23447 ) ) ( not ( = ?auto_23431 ?auto_23461 ) ) ( not ( = ?auto_23431 ?auto_23444 ) ) ( not ( = ?auto_23431 ?auto_23450 ) ) ( not ( = ?auto_23431 ?auto_23441 ) ) ( not ( = ?auto_23431 ?auto_23438 ) ) ( not ( = ?auto_23431 ?auto_23436 ) ) ( not ( = ?auto_23442 ?auto_23429 ) ) ( not ( = ?auto_23442 ?auto_23462 ) ) ( not ( = ?auto_23442 ?auto_23452 ) ) ( not ( = ?auto_23442 ?auto_23434 ) ) ( not ( = ?auto_23442 ?auto_23435 ) ) ( not ( = ?auto_23442 ?auto_23449 ) ) ( not ( = ?auto_23442 ?auto_23432 ) ) ( not ( = ?auto_23442 ?auto_23440 ) ) ( not ( = ?auto_23442 ?auto_23460 ) ) ( not ( = ?auto_23451 ?auto_23456 ) ) ( not ( = ?auto_23451 ?auto_23439 ) ) ( not ( = ?auto_23451 ?auto_23445 ) ) ( not ( = ?auto_23451 ?auto_23453 ) ) ( not ( = ?auto_23451 ?auto_23459 ) ) ( not ( = ?auto_23451 ?auto_23433 ) ) ( not ( = ?auto_23451 ?auto_23458 ) ) ( not ( = ?auto_23451 ?auto_23455 ) ) ( not ( = ?auto_23451 ?auto_23446 ) ) ( not ( = ?auto_23451 ?auto_23443 ) ) ( not ( = ?auto_23411 ?auto_23423 ) ) ( not ( = ?auto_23411 ?auto_23457 ) ) ( not ( = ?auto_23412 ?auto_23423 ) ) ( not ( = ?auto_23412 ?auto_23457 ) ) ( not ( = ?auto_23413 ?auto_23423 ) ) ( not ( = ?auto_23413 ?auto_23457 ) ) ( not ( = ?auto_23414 ?auto_23423 ) ) ( not ( = ?auto_23414 ?auto_23457 ) ) ( not ( = ?auto_23415 ?auto_23423 ) ) ( not ( = ?auto_23415 ?auto_23457 ) ) ( not ( = ?auto_23418 ?auto_23423 ) ) ( not ( = ?auto_23418 ?auto_23457 ) ) ( not ( = ?auto_23416 ?auto_23423 ) ) ( not ( = ?auto_23416 ?auto_23457 ) ) ( not ( = ?auto_23420 ?auto_23423 ) ) ( not ( = ?auto_23420 ?auto_23457 ) ) ( not ( = ?auto_23419 ?auto_23423 ) ) ( not ( = ?auto_23419 ?auto_23457 ) ) ( not ( = ?auto_23417 ?auto_23423 ) ) ( not ( = ?auto_23417 ?auto_23457 ) ) ( not ( = ?auto_23422 ?auto_23423 ) ) ( not ( = ?auto_23422 ?auto_23457 ) ) ( not ( = ?auto_23423 ?auto_23451 ) ) ( not ( = ?auto_23423 ?auto_23456 ) ) ( not ( = ?auto_23423 ?auto_23439 ) ) ( not ( = ?auto_23423 ?auto_23445 ) ) ( not ( = ?auto_23423 ?auto_23453 ) ) ( not ( = ?auto_23423 ?auto_23459 ) ) ( not ( = ?auto_23423 ?auto_23433 ) ) ( not ( = ?auto_23423 ?auto_23458 ) ) ( not ( = ?auto_23423 ?auto_23455 ) ) ( not ( = ?auto_23423 ?auto_23446 ) ) ( not ( = ?auto_23423 ?auto_23443 ) ) ( not ( = ?auto_23437 ?auto_23431 ) ) ( not ( = ?auto_23437 ?auto_23426 ) ) ( not ( = ?auto_23437 ?auto_23454 ) ) ( not ( = ?auto_23437 ?auto_23447 ) ) ( not ( = ?auto_23437 ?auto_23461 ) ) ( not ( = ?auto_23437 ?auto_23444 ) ) ( not ( = ?auto_23437 ?auto_23450 ) ) ( not ( = ?auto_23437 ?auto_23441 ) ) ( not ( = ?auto_23437 ?auto_23438 ) ) ( not ( = ?auto_23437 ?auto_23436 ) ) ( not ( = ?auto_23448 ?auto_23442 ) ) ( not ( = ?auto_23448 ?auto_23429 ) ) ( not ( = ?auto_23448 ?auto_23462 ) ) ( not ( = ?auto_23448 ?auto_23452 ) ) ( not ( = ?auto_23448 ?auto_23434 ) ) ( not ( = ?auto_23448 ?auto_23435 ) ) ( not ( = ?auto_23448 ?auto_23449 ) ) ( not ( = ?auto_23448 ?auto_23432 ) ) ( not ( = ?auto_23448 ?auto_23440 ) ) ( not ( = ?auto_23448 ?auto_23460 ) ) ( not ( = ?auto_23457 ?auto_23451 ) ) ( not ( = ?auto_23457 ?auto_23456 ) ) ( not ( = ?auto_23457 ?auto_23439 ) ) ( not ( = ?auto_23457 ?auto_23445 ) ) ( not ( = ?auto_23457 ?auto_23453 ) ) ( not ( = ?auto_23457 ?auto_23459 ) ) ( not ( = ?auto_23457 ?auto_23433 ) ) ( not ( = ?auto_23457 ?auto_23458 ) ) ( not ( = ?auto_23457 ?auto_23455 ) ) ( not ( = ?auto_23457 ?auto_23446 ) ) ( not ( = ?auto_23457 ?auto_23443 ) ) ( not ( = ?auto_23411 ?auto_23424 ) ) ( not ( = ?auto_23411 ?auto_23425 ) ) ( not ( = ?auto_23412 ?auto_23424 ) ) ( not ( = ?auto_23412 ?auto_23425 ) ) ( not ( = ?auto_23413 ?auto_23424 ) ) ( not ( = ?auto_23413 ?auto_23425 ) ) ( not ( = ?auto_23414 ?auto_23424 ) ) ( not ( = ?auto_23414 ?auto_23425 ) ) ( not ( = ?auto_23415 ?auto_23424 ) ) ( not ( = ?auto_23415 ?auto_23425 ) ) ( not ( = ?auto_23418 ?auto_23424 ) ) ( not ( = ?auto_23418 ?auto_23425 ) ) ( not ( = ?auto_23416 ?auto_23424 ) ) ( not ( = ?auto_23416 ?auto_23425 ) ) ( not ( = ?auto_23420 ?auto_23424 ) ) ( not ( = ?auto_23420 ?auto_23425 ) ) ( not ( = ?auto_23419 ?auto_23424 ) ) ( not ( = ?auto_23419 ?auto_23425 ) ) ( not ( = ?auto_23417 ?auto_23424 ) ) ( not ( = ?auto_23417 ?auto_23425 ) ) ( not ( = ?auto_23422 ?auto_23424 ) ) ( not ( = ?auto_23422 ?auto_23425 ) ) ( not ( = ?auto_23421 ?auto_23424 ) ) ( not ( = ?auto_23421 ?auto_23425 ) ) ( not ( = ?auto_23424 ?auto_23457 ) ) ( not ( = ?auto_23424 ?auto_23451 ) ) ( not ( = ?auto_23424 ?auto_23456 ) ) ( not ( = ?auto_23424 ?auto_23439 ) ) ( not ( = ?auto_23424 ?auto_23445 ) ) ( not ( = ?auto_23424 ?auto_23453 ) ) ( not ( = ?auto_23424 ?auto_23459 ) ) ( not ( = ?auto_23424 ?auto_23433 ) ) ( not ( = ?auto_23424 ?auto_23458 ) ) ( not ( = ?auto_23424 ?auto_23455 ) ) ( not ( = ?auto_23424 ?auto_23446 ) ) ( not ( = ?auto_23424 ?auto_23443 ) ) ( not ( = ?auto_23425 ?auto_23457 ) ) ( not ( = ?auto_23425 ?auto_23451 ) ) ( not ( = ?auto_23425 ?auto_23456 ) ) ( not ( = ?auto_23425 ?auto_23439 ) ) ( not ( = ?auto_23425 ?auto_23445 ) ) ( not ( = ?auto_23425 ?auto_23453 ) ) ( not ( = ?auto_23425 ?auto_23459 ) ) ( not ( = ?auto_23425 ?auto_23433 ) ) ( not ( = ?auto_23425 ?auto_23458 ) ) ( not ( = ?auto_23425 ?auto_23455 ) ) ( not ( = ?auto_23425 ?auto_23446 ) ) ( not ( = ?auto_23425 ?auto_23443 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_23411 ?auto_23412 ?auto_23413 ?auto_23414 ?auto_23415 ?auto_23418 ?auto_23416 ?auto_23420 ?auto_23419 ?auto_23417 ?auto_23422 ?auto_23421 ?auto_23423 )
      ( MAKE-1CRATE ?auto_23423 ?auto_23424 )
      ( MAKE-13CRATE-VERIFY ?auto_23411 ?auto_23412 ?auto_23413 ?auto_23414 ?auto_23415 ?auto_23418 ?auto_23416 ?auto_23420 ?auto_23419 ?auto_23417 ?auto_23422 ?auto_23421 ?auto_23423 ?auto_23424 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23465 - SURFACE
      ?auto_23466 - SURFACE
    )
    :vars
    (
      ?auto_23467 - HOIST
      ?auto_23468 - PLACE
      ?auto_23470 - PLACE
      ?auto_23471 - HOIST
      ?auto_23472 - SURFACE
      ?auto_23469 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23467 ?auto_23468 ) ( SURFACE-AT ?auto_23465 ?auto_23468 ) ( CLEAR ?auto_23465 ) ( IS-CRATE ?auto_23466 ) ( AVAILABLE ?auto_23467 ) ( not ( = ?auto_23470 ?auto_23468 ) ) ( HOIST-AT ?auto_23471 ?auto_23470 ) ( AVAILABLE ?auto_23471 ) ( SURFACE-AT ?auto_23466 ?auto_23470 ) ( ON ?auto_23466 ?auto_23472 ) ( CLEAR ?auto_23466 ) ( TRUCK-AT ?auto_23469 ?auto_23468 ) ( not ( = ?auto_23465 ?auto_23466 ) ) ( not ( = ?auto_23465 ?auto_23472 ) ) ( not ( = ?auto_23466 ?auto_23472 ) ) ( not ( = ?auto_23467 ?auto_23471 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23469 ?auto_23468 ?auto_23470 )
      ( !LIFT ?auto_23471 ?auto_23466 ?auto_23472 ?auto_23470 )
      ( !LOAD ?auto_23471 ?auto_23466 ?auto_23469 ?auto_23470 )
      ( !DRIVE ?auto_23469 ?auto_23470 ?auto_23468 )
      ( !UNLOAD ?auto_23467 ?auto_23466 ?auto_23469 ?auto_23468 )
      ( !DROP ?auto_23467 ?auto_23466 ?auto_23465 ?auto_23468 )
      ( MAKE-1CRATE-VERIFY ?auto_23465 ?auto_23466 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_23488 - SURFACE
      ?auto_23489 - SURFACE
      ?auto_23490 - SURFACE
      ?auto_23491 - SURFACE
      ?auto_23492 - SURFACE
      ?auto_23495 - SURFACE
      ?auto_23493 - SURFACE
      ?auto_23497 - SURFACE
      ?auto_23496 - SURFACE
      ?auto_23494 - SURFACE
      ?auto_23499 - SURFACE
      ?auto_23498 - SURFACE
      ?auto_23500 - SURFACE
      ?auto_23501 - SURFACE
      ?auto_23502 - SURFACE
    )
    :vars
    (
      ?auto_23503 - HOIST
      ?auto_23506 - PLACE
      ?auto_23507 - PLACE
      ?auto_23508 - HOIST
      ?auto_23504 - SURFACE
      ?auto_23516 - PLACE
      ?auto_23515 - HOIST
      ?auto_23514 - SURFACE
      ?auto_23521 - PLACE
      ?auto_23528 - HOIST
      ?auto_23534 - SURFACE
      ?auto_23513 - PLACE
      ?auto_23538 - HOIST
      ?auto_23539 - SURFACE
      ?auto_23531 - SURFACE
      ?auto_23520 - PLACE
      ?auto_23533 - HOIST
      ?auto_23511 - SURFACE
      ?auto_23525 - PLACE
      ?auto_23522 - HOIST
      ?auto_23518 - SURFACE
      ?auto_23535 - PLACE
      ?auto_23509 - HOIST
      ?auto_23537 - SURFACE
      ?auto_23512 - PLACE
      ?auto_23510 - HOIST
      ?auto_23536 - SURFACE
      ?auto_23530 - PLACE
      ?auto_23524 - HOIST
      ?auto_23529 - SURFACE
      ?auto_23543 - SURFACE
      ?auto_23542 - PLACE
      ?auto_23532 - HOIST
      ?auto_23517 - SURFACE
      ?auto_23541 - PLACE
      ?auto_23519 - HOIST
      ?auto_23526 - SURFACE
      ?auto_23523 - PLACE
      ?auto_23540 - HOIST
      ?auto_23527 - SURFACE
      ?auto_23505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23503 ?auto_23506 ) ( IS-CRATE ?auto_23502 ) ( not ( = ?auto_23507 ?auto_23506 ) ) ( HOIST-AT ?auto_23508 ?auto_23507 ) ( AVAILABLE ?auto_23508 ) ( SURFACE-AT ?auto_23502 ?auto_23507 ) ( ON ?auto_23502 ?auto_23504 ) ( CLEAR ?auto_23502 ) ( not ( = ?auto_23501 ?auto_23502 ) ) ( not ( = ?auto_23501 ?auto_23504 ) ) ( not ( = ?auto_23502 ?auto_23504 ) ) ( not ( = ?auto_23503 ?auto_23508 ) ) ( IS-CRATE ?auto_23501 ) ( not ( = ?auto_23516 ?auto_23506 ) ) ( HOIST-AT ?auto_23515 ?auto_23516 ) ( SURFACE-AT ?auto_23501 ?auto_23516 ) ( ON ?auto_23501 ?auto_23514 ) ( CLEAR ?auto_23501 ) ( not ( = ?auto_23500 ?auto_23501 ) ) ( not ( = ?auto_23500 ?auto_23514 ) ) ( not ( = ?auto_23501 ?auto_23514 ) ) ( not ( = ?auto_23503 ?auto_23515 ) ) ( IS-CRATE ?auto_23500 ) ( not ( = ?auto_23521 ?auto_23506 ) ) ( HOIST-AT ?auto_23528 ?auto_23521 ) ( AVAILABLE ?auto_23528 ) ( SURFACE-AT ?auto_23500 ?auto_23521 ) ( ON ?auto_23500 ?auto_23534 ) ( CLEAR ?auto_23500 ) ( not ( = ?auto_23498 ?auto_23500 ) ) ( not ( = ?auto_23498 ?auto_23534 ) ) ( not ( = ?auto_23500 ?auto_23534 ) ) ( not ( = ?auto_23503 ?auto_23528 ) ) ( IS-CRATE ?auto_23498 ) ( not ( = ?auto_23513 ?auto_23506 ) ) ( HOIST-AT ?auto_23538 ?auto_23513 ) ( AVAILABLE ?auto_23538 ) ( SURFACE-AT ?auto_23498 ?auto_23513 ) ( ON ?auto_23498 ?auto_23539 ) ( CLEAR ?auto_23498 ) ( not ( = ?auto_23499 ?auto_23498 ) ) ( not ( = ?auto_23499 ?auto_23539 ) ) ( not ( = ?auto_23498 ?auto_23539 ) ) ( not ( = ?auto_23503 ?auto_23538 ) ) ( IS-CRATE ?auto_23499 ) ( SURFACE-AT ?auto_23499 ?auto_23516 ) ( ON ?auto_23499 ?auto_23531 ) ( CLEAR ?auto_23499 ) ( not ( = ?auto_23494 ?auto_23499 ) ) ( not ( = ?auto_23494 ?auto_23531 ) ) ( not ( = ?auto_23499 ?auto_23531 ) ) ( IS-CRATE ?auto_23494 ) ( not ( = ?auto_23520 ?auto_23506 ) ) ( HOIST-AT ?auto_23533 ?auto_23520 ) ( AVAILABLE ?auto_23533 ) ( SURFACE-AT ?auto_23494 ?auto_23520 ) ( ON ?auto_23494 ?auto_23511 ) ( CLEAR ?auto_23494 ) ( not ( = ?auto_23496 ?auto_23494 ) ) ( not ( = ?auto_23496 ?auto_23511 ) ) ( not ( = ?auto_23494 ?auto_23511 ) ) ( not ( = ?auto_23503 ?auto_23533 ) ) ( IS-CRATE ?auto_23496 ) ( not ( = ?auto_23525 ?auto_23506 ) ) ( HOIST-AT ?auto_23522 ?auto_23525 ) ( AVAILABLE ?auto_23522 ) ( SURFACE-AT ?auto_23496 ?auto_23525 ) ( ON ?auto_23496 ?auto_23518 ) ( CLEAR ?auto_23496 ) ( not ( = ?auto_23497 ?auto_23496 ) ) ( not ( = ?auto_23497 ?auto_23518 ) ) ( not ( = ?auto_23496 ?auto_23518 ) ) ( not ( = ?auto_23503 ?auto_23522 ) ) ( IS-CRATE ?auto_23497 ) ( not ( = ?auto_23535 ?auto_23506 ) ) ( HOIST-AT ?auto_23509 ?auto_23535 ) ( AVAILABLE ?auto_23509 ) ( SURFACE-AT ?auto_23497 ?auto_23535 ) ( ON ?auto_23497 ?auto_23537 ) ( CLEAR ?auto_23497 ) ( not ( = ?auto_23493 ?auto_23497 ) ) ( not ( = ?auto_23493 ?auto_23537 ) ) ( not ( = ?auto_23497 ?auto_23537 ) ) ( not ( = ?auto_23503 ?auto_23509 ) ) ( IS-CRATE ?auto_23493 ) ( not ( = ?auto_23512 ?auto_23506 ) ) ( HOIST-AT ?auto_23510 ?auto_23512 ) ( AVAILABLE ?auto_23510 ) ( SURFACE-AT ?auto_23493 ?auto_23512 ) ( ON ?auto_23493 ?auto_23536 ) ( CLEAR ?auto_23493 ) ( not ( = ?auto_23495 ?auto_23493 ) ) ( not ( = ?auto_23495 ?auto_23536 ) ) ( not ( = ?auto_23493 ?auto_23536 ) ) ( not ( = ?auto_23503 ?auto_23510 ) ) ( IS-CRATE ?auto_23495 ) ( not ( = ?auto_23530 ?auto_23506 ) ) ( HOIST-AT ?auto_23524 ?auto_23530 ) ( AVAILABLE ?auto_23524 ) ( SURFACE-AT ?auto_23495 ?auto_23530 ) ( ON ?auto_23495 ?auto_23529 ) ( CLEAR ?auto_23495 ) ( not ( = ?auto_23492 ?auto_23495 ) ) ( not ( = ?auto_23492 ?auto_23529 ) ) ( not ( = ?auto_23495 ?auto_23529 ) ) ( not ( = ?auto_23503 ?auto_23524 ) ) ( IS-CRATE ?auto_23492 ) ( AVAILABLE ?auto_23515 ) ( SURFACE-AT ?auto_23492 ?auto_23516 ) ( ON ?auto_23492 ?auto_23543 ) ( CLEAR ?auto_23492 ) ( not ( = ?auto_23491 ?auto_23492 ) ) ( not ( = ?auto_23491 ?auto_23543 ) ) ( not ( = ?auto_23492 ?auto_23543 ) ) ( IS-CRATE ?auto_23491 ) ( not ( = ?auto_23542 ?auto_23506 ) ) ( HOIST-AT ?auto_23532 ?auto_23542 ) ( AVAILABLE ?auto_23532 ) ( SURFACE-AT ?auto_23491 ?auto_23542 ) ( ON ?auto_23491 ?auto_23517 ) ( CLEAR ?auto_23491 ) ( not ( = ?auto_23490 ?auto_23491 ) ) ( not ( = ?auto_23490 ?auto_23517 ) ) ( not ( = ?auto_23491 ?auto_23517 ) ) ( not ( = ?auto_23503 ?auto_23532 ) ) ( IS-CRATE ?auto_23490 ) ( not ( = ?auto_23541 ?auto_23506 ) ) ( HOIST-AT ?auto_23519 ?auto_23541 ) ( AVAILABLE ?auto_23519 ) ( SURFACE-AT ?auto_23490 ?auto_23541 ) ( ON ?auto_23490 ?auto_23526 ) ( CLEAR ?auto_23490 ) ( not ( = ?auto_23489 ?auto_23490 ) ) ( not ( = ?auto_23489 ?auto_23526 ) ) ( not ( = ?auto_23490 ?auto_23526 ) ) ( not ( = ?auto_23503 ?auto_23519 ) ) ( SURFACE-AT ?auto_23488 ?auto_23506 ) ( CLEAR ?auto_23488 ) ( IS-CRATE ?auto_23489 ) ( AVAILABLE ?auto_23503 ) ( not ( = ?auto_23523 ?auto_23506 ) ) ( HOIST-AT ?auto_23540 ?auto_23523 ) ( AVAILABLE ?auto_23540 ) ( SURFACE-AT ?auto_23489 ?auto_23523 ) ( ON ?auto_23489 ?auto_23527 ) ( CLEAR ?auto_23489 ) ( TRUCK-AT ?auto_23505 ?auto_23506 ) ( not ( = ?auto_23488 ?auto_23489 ) ) ( not ( = ?auto_23488 ?auto_23527 ) ) ( not ( = ?auto_23489 ?auto_23527 ) ) ( not ( = ?auto_23503 ?auto_23540 ) ) ( not ( = ?auto_23488 ?auto_23490 ) ) ( not ( = ?auto_23488 ?auto_23526 ) ) ( not ( = ?auto_23490 ?auto_23527 ) ) ( not ( = ?auto_23541 ?auto_23523 ) ) ( not ( = ?auto_23519 ?auto_23540 ) ) ( not ( = ?auto_23526 ?auto_23527 ) ) ( not ( = ?auto_23488 ?auto_23491 ) ) ( not ( = ?auto_23488 ?auto_23517 ) ) ( not ( = ?auto_23489 ?auto_23491 ) ) ( not ( = ?auto_23489 ?auto_23517 ) ) ( not ( = ?auto_23491 ?auto_23526 ) ) ( not ( = ?auto_23491 ?auto_23527 ) ) ( not ( = ?auto_23542 ?auto_23541 ) ) ( not ( = ?auto_23542 ?auto_23523 ) ) ( not ( = ?auto_23532 ?auto_23519 ) ) ( not ( = ?auto_23532 ?auto_23540 ) ) ( not ( = ?auto_23517 ?auto_23526 ) ) ( not ( = ?auto_23517 ?auto_23527 ) ) ( not ( = ?auto_23488 ?auto_23492 ) ) ( not ( = ?auto_23488 ?auto_23543 ) ) ( not ( = ?auto_23489 ?auto_23492 ) ) ( not ( = ?auto_23489 ?auto_23543 ) ) ( not ( = ?auto_23490 ?auto_23492 ) ) ( not ( = ?auto_23490 ?auto_23543 ) ) ( not ( = ?auto_23492 ?auto_23517 ) ) ( not ( = ?auto_23492 ?auto_23526 ) ) ( not ( = ?auto_23492 ?auto_23527 ) ) ( not ( = ?auto_23516 ?auto_23542 ) ) ( not ( = ?auto_23516 ?auto_23541 ) ) ( not ( = ?auto_23516 ?auto_23523 ) ) ( not ( = ?auto_23515 ?auto_23532 ) ) ( not ( = ?auto_23515 ?auto_23519 ) ) ( not ( = ?auto_23515 ?auto_23540 ) ) ( not ( = ?auto_23543 ?auto_23517 ) ) ( not ( = ?auto_23543 ?auto_23526 ) ) ( not ( = ?auto_23543 ?auto_23527 ) ) ( not ( = ?auto_23488 ?auto_23495 ) ) ( not ( = ?auto_23488 ?auto_23529 ) ) ( not ( = ?auto_23489 ?auto_23495 ) ) ( not ( = ?auto_23489 ?auto_23529 ) ) ( not ( = ?auto_23490 ?auto_23495 ) ) ( not ( = ?auto_23490 ?auto_23529 ) ) ( not ( = ?auto_23491 ?auto_23495 ) ) ( not ( = ?auto_23491 ?auto_23529 ) ) ( not ( = ?auto_23495 ?auto_23543 ) ) ( not ( = ?auto_23495 ?auto_23517 ) ) ( not ( = ?auto_23495 ?auto_23526 ) ) ( not ( = ?auto_23495 ?auto_23527 ) ) ( not ( = ?auto_23530 ?auto_23516 ) ) ( not ( = ?auto_23530 ?auto_23542 ) ) ( not ( = ?auto_23530 ?auto_23541 ) ) ( not ( = ?auto_23530 ?auto_23523 ) ) ( not ( = ?auto_23524 ?auto_23515 ) ) ( not ( = ?auto_23524 ?auto_23532 ) ) ( not ( = ?auto_23524 ?auto_23519 ) ) ( not ( = ?auto_23524 ?auto_23540 ) ) ( not ( = ?auto_23529 ?auto_23543 ) ) ( not ( = ?auto_23529 ?auto_23517 ) ) ( not ( = ?auto_23529 ?auto_23526 ) ) ( not ( = ?auto_23529 ?auto_23527 ) ) ( not ( = ?auto_23488 ?auto_23493 ) ) ( not ( = ?auto_23488 ?auto_23536 ) ) ( not ( = ?auto_23489 ?auto_23493 ) ) ( not ( = ?auto_23489 ?auto_23536 ) ) ( not ( = ?auto_23490 ?auto_23493 ) ) ( not ( = ?auto_23490 ?auto_23536 ) ) ( not ( = ?auto_23491 ?auto_23493 ) ) ( not ( = ?auto_23491 ?auto_23536 ) ) ( not ( = ?auto_23492 ?auto_23493 ) ) ( not ( = ?auto_23492 ?auto_23536 ) ) ( not ( = ?auto_23493 ?auto_23529 ) ) ( not ( = ?auto_23493 ?auto_23543 ) ) ( not ( = ?auto_23493 ?auto_23517 ) ) ( not ( = ?auto_23493 ?auto_23526 ) ) ( not ( = ?auto_23493 ?auto_23527 ) ) ( not ( = ?auto_23512 ?auto_23530 ) ) ( not ( = ?auto_23512 ?auto_23516 ) ) ( not ( = ?auto_23512 ?auto_23542 ) ) ( not ( = ?auto_23512 ?auto_23541 ) ) ( not ( = ?auto_23512 ?auto_23523 ) ) ( not ( = ?auto_23510 ?auto_23524 ) ) ( not ( = ?auto_23510 ?auto_23515 ) ) ( not ( = ?auto_23510 ?auto_23532 ) ) ( not ( = ?auto_23510 ?auto_23519 ) ) ( not ( = ?auto_23510 ?auto_23540 ) ) ( not ( = ?auto_23536 ?auto_23529 ) ) ( not ( = ?auto_23536 ?auto_23543 ) ) ( not ( = ?auto_23536 ?auto_23517 ) ) ( not ( = ?auto_23536 ?auto_23526 ) ) ( not ( = ?auto_23536 ?auto_23527 ) ) ( not ( = ?auto_23488 ?auto_23497 ) ) ( not ( = ?auto_23488 ?auto_23537 ) ) ( not ( = ?auto_23489 ?auto_23497 ) ) ( not ( = ?auto_23489 ?auto_23537 ) ) ( not ( = ?auto_23490 ?auto_23497 ) ) ( not ( = ?auto_23490 ?auto_23537 ) ) ( not ( = ?auto_23491 ?auto_23497 ) ) ( not ( = ?auto_23491 ?auto_23537 ) ) ( not ( = ?auto_23492 ?auto_23497 ) ) ( not ( = ?auto_23492 ?auto_23537 ) ) ( not ( = ?auto_23495 ?auto_23497 ) ) ( not ( = ?auto_23495 ?auto_23537 ) ) ( not ( = ?auto_23497 ?auto_23536 ) ) ( not ( = ?auto_23497 ?auto_23529 ) ) ( not ( = ?auto_23497 ?auto_23543 ) ) ( not ( = ?auto_23497 ?auto_23517 ) ) ( not ( = ?auto_23497 ?auto_23526 ) ) ( not ( = ?auto_23497 ?auto_23527 ) ) ( not ( = ?auto_23535 ?auto_23512 ) ) ( not ( = ?auto_23535 ?auto_23530 ) ) ( not ( = ?auto_23535 ?auto_23516 ) ) ( not ( = ?auto_23535 ?auto_23542 ) ) ( not ( = ?auto_23535 ?auto_23541 ) ) ( not ( = ?auto_23535 ?auto_23523 ) ) ( not ( = ?auto_23509 ?auto_23510 ) ) ( not ( = ?auto_23509 ?auto_23524 ) ) ( not ( = ?auto_23509 ?auto_23515 ) ) ( not ( = ?auto_23509 ?auto_23532 ) ) ( not ( = ?auto_23509 ?auto_23519 ) ) ( not ( = ?auto_23509 ?auto_23540 ) ) ( not ( = ?auto_23537 ?auto_23536 ) ) ( not ( = ?auto_23537 ?auto_23529 ) ) ( not ( = ?auto_23537 ?auto_23543 ) ) ( not ( = ?auto_23537 ?auto_23517 ) ) ( not ( = ?auto_23537 ?auto_23526 ) ) ( not ( = ?auto_23537 ?auto_23527 ) ) ( not ( = ?auto_23488 ?auto_23496 ) ) ( not ( = ?auto_23488 ?auto_23518 ) ) ( not ( = ?auto_23489 ?auto_23496 ) ) ( not ( = ?auto_23489 ?auto_23518 ) ) ( not ( = ?auto_23490 ?auto_23496 ) ) ( not ( = ?auto_23490 ?auto_23518 ) ) ( not ( = ?auto_23491 ?auto_23496 ) ) ( not ( = ?auto_23491 ?auto_23518 ) ) ( not ( = ?auto_23492 ?auto_23496 ) ) ( not ( = ?auto_23492 ?auto_23518 ) ) ( not ( = ?auto_23495 ?auto_23496 ) ) ( not ( = ?auto_23495 ?auto_23518 ) ) ( not ( = ?auto_23493 ?auto_23496 ) ) ( not ( = ?auto_23493 ?auto_23518 ) ) ( not ( = ?auto_23496 ?auto_23537 ) ) ( not ( = ?auto_23496 ?auto_23536 ) ) ( not ( = ?auto_23496 ?auto_23529 ) ) ( not ( = ?auto_23496 ?auto_23543 ) ) ( not ( = ?auto_23496 ?auto_23517 ) ) ( not ( = ?auto_23496 ?auto_23526 ) ) ( not ( = ?auto_23496 ?auto_23527 ) ) ( not ( = ?auto_23525 ?auto_23535 ) ) ( not ( = ?auto_23525 ?auto_23512 ) ) ( not ( = ?auto_23525 ?auto_23530 ) ) ( not ( = ?auto_23525 ?auto_23516 ) ) ( not ( = ?auto_23525 ?auto_23542 ) ) ( not ( = ?auto_23525 ?auto_23541 ) ) ( not ( = ?auto_23525 ?auto_23523 ) ) ( not ( = ?auto_23522 ?auto_23509 ) ) ( not ( = ?auto_23522 ?auto_23510 ) ) ( not ( = ?auto_23522 ?auto_23524 ) ) ( not ( = ?auto_23522 ?auto_23515 ) ) ( not ( = ?auto_23522 ?auto_23532 ) ) ( not ( = ?auto_23522 ?auto_23519 ) ) ( not ( = ?auto_23522 ?auto_23540 ) ) ( not ( = ?auto_23518 ?auto_23537 ) ) ( not ( = ?auto_23518 ?auto_23536 ) ) ( not ( = ?auto_23518 ?auto_23529 ) ) ( not ( = ?auto_23518 ?auto_23543 ) ) ( not ( = ?auto_23518 ?auto_23517 ) ) ( not ( = ?auto_23518 ?auto_23526 ) ) ( not ( = ?auto_23518 ?auto_23527 ) ) ( not ( = ?auto_23488 ?auto_23494 ) ) ( not ( = ?auto_23488 ?auto_23511 ) ) ( not ( = ?auto_23489 ?auto_23494 ) ) ( not ( = ?auto_23489 ?auto_23511 ) ) ( not ( = ?auto_23490 ?auto_23494 ) ) ( not ( = ?auto_23490 ?auto_23511 ) ) ( not ( = ?auto_23491 ?auto_23494 ) ) ( not ( = ?auto_23491 ?auto_23511 ) ) ( not ( = ?auto_23492 ?auto_23494 ) ) ( not ( = ?auto_23492 ?auto_23511 ) ) ( not ( = ?auto_23495 ?auto_23494 ) ) ( not ( = ?auto_23495 ?auto_23511 ) ) ( not ( = ?auto_23493 ?auto_23494 ) ) ( not ( = ?auto_23493 ?auto_23511 ) ) ( not ( = ?auto_23497 ?auto_23494 ) ) ( not ( = ?auto_23497 ?auto_23511 ) ) ( not ( = ?auto_23494 ?auto_23518 ) ) ( not ( = ?auto_23494 ?auto_23537 ) ) ( not ( = ?auto_23494 ?auto_23536 ) ) ( not ( = ?auto_23494 ?auto_23529 ) ) ( not ( = ?auto_23494 ?auto_23543 ) ) ( not ( = ?auto_23494 ?auto_23517 ) ) ( not ( = ?auto_23494 ?auto_23526 ) ) ( not ( = ?auto_23494 ?auto_23527 ) ) ( not ( = ?auto_23520 ?auto_23525 ) ) ( not ( = ?auto_23520 ?auto_23535 ) ) ( not ( = ?auto_23520 ?auto_23512 ) ) ( not ( = ?auto_23520 ?auto_23530 ) ) ( not ( = ?auto_23520 ?auto_23516 ) ) ( not ( = ?auto_23520 ?auto_23542 ) ) ( not ( = ?auto_23520 ?auto_23541 ) ) ( not ( = ?auto_23520 ?auto_23523 ) ) ( not ( = ?auto_23533 ?auto_23522 ) ) ( not ( = ?auto_23533 ?auto_23509 ) ) ( not ( = ?auto_23533 ?auto_23510 ) ) ( not ( = ?auto_23533 ?auto_23524 ) ) ( not ( = ?auto_23533 ?auto_23515 ) ) ( not ( = ?auto_23533 ?auto_23532 ) ) ( not ( = ?auto_23533 ?auto_23519 ) ) ( not ( = ?auto_23533 ?auto_23540 ) ) ( not ( = ?auto_23511 ?auto_23518 ) ) ( not ( = ?auto_23511 ?auto_23537 ) ) ( not ( = ?auto_23511 ?auto_23536 ) ) ( not ( = ?auto_23511 ?auto_23529 ) ) ( not ( = ?auto_23511 ?auto_23543 ) ) ( not ( = ?auto_23511 ?auto_23517 ) ) ( not ( = ?auto_23511 ?auto_23526 ) ) ( not ( = ?auto_23511 ?auto_23527 ) ) ( not ( = ?auto_23488 ?auto_23499 ) ) ( not ( = ?auto_23488 ?auto_23531 ) ) ( not ( = ?auto_23489 ?auto_23499 ) ) ( not ( = ?auto_23489 ?auto_23531 ) ) ( not ( = ?auto_23490 ?auto_23499 ) ) ( not ( = ?auto_23490 ?auto_23531 ) ) ( not ( = ?auto_23491 ?auto_23499 ) ) ( not ( = ?auto_23491 ?auto_23531 ) ) ( not ( = ?auto_23492 ?auto_23499 ) ) ( not ( = ?auto_23492 ?auto_23531 ) ) ( not ( = ?auto_23495 ?auto_23499 ) ) ( not ( = ?auto_23495 ?auto_23531 ) ) ( not ( = ?auto_23493 ?auto_23499 ) ) ( not ( = ?auto_23493 ?auto_23531 ) ) ( not ( = ?auto_23497 ?auto_23499 ) ) ( not ( = ?auto_23497 ?auto_23531 ) ) ( not ( = ?auto_23496 ?auto_23499 ) ) ( not ( = ?auto_23496 ?auto_23531 ) ) ( not ( = ?auto_23499 ?auto_23511 ) ) ( not ( = ?auto_23499 ?auto_23518 ) ) ( not ( = ?auto_23499 ?auto_23537 ) ) ( not ( = ?auto_23499 ?auto_23536 ) ) ( not ( = ?auto_23499 ?auto_23529 ) ) ( not ( = ?auto_23499 ?auto_23543 ) ) ( not ( = ?auto_23499 ?auto_23517 ) ) ( not ( = ?auto_23499 ?auto_23526 ) ) ( not ( = ?auto_23499 ?auto_23527 ) ) ( not ( = ?auto_23531 ?auto_23511 ) ) ( not ( = ?auto_23531 ?auto_23518 ) ) ( not ( = ?auto_23531 ?auto_23537 ) ) ( not ( = ?auto_23531 ?auto_23536 ) ) ( not ( = ?auto_23531 ?auto_23529 ) ) ( not ( = ?auto_23531 ?auto_23543 ) ) ( not ( = ?auto_23531 ?auto_23517 ) ) ( not ( = ?auto_23531 ?auto_23526 ) ) ( not ( = ?auto_23531 ?auto_23527 ) ) ( not ( = ?auto_23488 ?auto_23498 ) ) ( not ( = ?auto_23488 ?auto_23539 ) ) ( not ( = ?auto_23489 ?auto_23498 ) ) ( not ( = ?auto_23489 ?auto_23539 ) ) ( not ( = ?auto_23490 ?auto_23498 ) ) ( not ( = ?auto_23490 ?auto_23539 ) ) ( not ( = ?auto_23491 ?auto_23498 ) ) ( not ( = ?auto_23491 ?auto_23539 ) ) ( not ( = ?auto_23492 ?auto_23498 ) ) ( not ( = ?auto_23492 ?auto_23539 ) ) ( not ( = ?auto_23495 ?auto_23498 ) ) ( not ( = ?auto_23495 ?auto_23539 ) ) ( not ( = ?auto_23493 ?auto_23498 ) ) ( not ( = ?auto_23493 ?auto_23539 ) ) ( not ( = ?auto_23497 ?auto_23498 ) ) ( not ( = ?auto_23497 ?auto_23539 ) ) ( not ( = ?auto_23496 ?auto_23498 ) ) ( not ( = ?auto_23496 ?auto_23539 ) ) ( not ( = ?auto_23494 ?auto_23498 ) ) ( not ( = ?auto_23494 ?auto_23539 ) ) ( not ( = ?auto_23498 ?auto_23531 ) ) ( not ( = ?auto_23498 ?auto_23511 ) ) ( not ( = ?auto_23498 ?auto_23518 ) ) ( not ( = ?auto_23498 ?auto_23537 ) ) ( not ( = ?auto_23498 ?auto_23536 ) ) ( not ( = ?auto_23498 ?auto_23529 ) ) ( not ( = ?auto_23498 ?auto_23543 ) ) ( not ( = ?auto_23498 ?auto_23517 ) ) ( not ( = ?auto_23498 ?auto_23526 ) ) ( not ( = ?auto_23498 ?auto_23527 ) ) ( not ( = ?auto_23513 ?auto_23516 ) ) ( not ( = ?auto_23513 ?auto_23520 ) ) ( not ( = ?auto_23513 ?auto_23525 ) ) ( not ( = ?auto_23513 ?auto_23535 ) ) ( not ( = ?auto_23513 ?auto_23512 ) ) ( not ( = ?auto_23513 ?auto_23530 ) ) ( not ( = ?auto_23513 ?auto_23542 ) ) ( not ( = ?auto_23513 ?auto_23541 ) ) ( not ( = ?auto_23513 ?auto_23523 ) ) ( not ( = ?auto_23538 ?auto_23515 ) ) ( not ( = ?auto_23538 ?auto_23533 ) ) ( not ( = ?auto_23538 ?auto_23522 ) ) ( not ( = ?auto_23538 ?auto_23509 ) ) ( not ( = ?auto_23538 ?auto_23510 ) ) ( not ( = ?auto_23538 ?auto_23524 ) ) ( not ( = ?auto_23538 ?auto_23532 ) ) ( not ( = ?auto_23538 ?auto_23519 ) ) ( not ( = ?auto_23538 ?auto_23540 ) ) ( not ( = ?auto_23539 ?auto_23531 ) ) ( not ( = ?auto_23539 ?auto_23511 ) ) ( not ( = ?auto_23539 ?auto_23518 ) ) ( not ( = ?auto_23539 ?auto_23537 ) ) ( not ( = ?auto_23539 ?auto_23536 ) ) ( not ( = ?auto_23539 ?auto_23529 ) ) ( not ( = ?auto_23539 ?auto_23543 ) ) ( not ( = ?auto_23539 ?auto_23517 ) ) ( not ( = ?auto_23539 ?auto_23526 ) ) ( not ( = ?auto_23539 ?auto_23527 ) ) ( not ( = ?auto_23488 ?auto_23500 ) ) ( not ( = ?auto_23488 ?auto_23534 ) ) ( not ( = ?auto_23489 ?auto_23500 ) ) ( not ( = ?auto_23489 ?auto_23534 ) ) ( not ( = ?auto_23490 ?auto_23500 ) ) ( not ( = ?auto_23490 ?auto_23534 ) ) ( not ( = ?auto_23491 ?auto_23500 ) ) ( not ( = ?auto_23491 ?auto_23534 ) ) ( not ( = ?auto_23492 ?auto_23500 ) ) ( not ( = ?auto_23492 ?auto_23534 ) ) ( not ( = ?auto_23495 ?auto_23500 ) ) ( not ( = ?auto_23495 ?auto_23534 ) ) ( not ( = ?auto_23493 ?auto_23500 ) ) ( not ( = ?auto_23493 ?auto_23534 ) ) ( not ( = ?auto_23497 ?auto_23500 ) ) ( not ( = ?auto_23497 ?auto_23534 ) ) ( not ( = ?auto_23496 ?auto_23500 ) ) ( not ( = ?auto_23496 ?auto_23534 ) ) ( not ( = ?auto_23494 ?auto_23500 ) ) ( not ( = ?auto_23494 ?auto_23534 ) ) ( not ( = ?auto_23499 ?auto_23500 ) ) ( not ( = ?auto_23499 ?auto_23534 ) ) ( not ( = ?auto_23500 ?auto_23539 ) ) ( not ( = ?auto_23500 ?auto_23531 ) ) ( not ( = ?auto_23500 ?auto_23511 ) ) ( not ( = ?auto_23500 ?auto_23518 ) ) ( not ( = ?auto_23500 ?auto_23537 ) ) ( not ( = ?auto_23500 ?auto_23536 ) ) ( not ( = ?auto_23500 ?auto_23529 ) ) ( not ( = ?auto_23500 ?auto_23543 ) ) ( not ( = ?auto_23500 ?auto_23517 ) ) ( not ( = ?auto_23500 ?auto_23526 ) ) ( not ( = ?auto_23500 ?auto_23527 ) ) ( not ( = ?auto_23521 ?auto_23513 ) ) ( not ( = ?auto_23521 ?auto_23516 ) ) ( not ( = ?auto_23521 ?auto_23520 ) ) ( not ( = ?auto_23521 ?auto_23525 ) ) ( not ( = ?auto_23521 ?auto_23535 ) ) ( not ( = ?auto_23521 ?auto_23512 ) ) ( not ( = ?auto_23521 ?auto_23530 ) ) ( not ( = ?auto_23521 ?auto_23542 ) ) ( not ( = ?auto_23521 ?auto_23541 ) ) ( not ( = ?auto_23521 ?auto_23523 ) ) ( not ( = ?auto_23528 ?auto_23538 ) ) ( not ( = ?auto_23528 ?auto_23515 ) ) ( not ( = ?auto_23528 ?auto_23533 ) ) ( not ( = ?auto_23528 ?auto_23522 ) ) ( not ( = ?auto_23528 ?auto_23509 ) ) ( not ( = ?auto_23528 ?auto_23510 ) ) ( not ( = ?auto_23528 ?auto_23524 ) ) ( not ( = ?auto_23528 ?auto_23532 ) ) ( not ( = ?auto_23528 ?auto_23519 ) ) ( not ( = ?auto_23528 ?auto_23540 ) ) ( not ( = ?auto_23534 ?auto_23539 ) ) ( not ( = ?auto_23534 ?auto_23531 ) ) ( not ( = ?auto_23534 ?auto_23511 ) ) ( not ( = ?auto_23534 ?auto_23518 ) ) ( not ( = ?auto_23534 ?auto_23537 ) ) ( not ( = ?auto_23534 ?auto_23536 ) ) ( not ( = ?auto_23534 ?auto_23529 ) ) ( not ( = ?auto_23534 ?auto_23543 ) ) ( not ( = ?auto_23534 ?auto_23517 ) ) ( not ( = ?auto_23534 ?auto_23526 ) ) ( not ( = ?auto_23534 ?auto_23527 ) ) ( not ( = ?auto_23488 ?auto_23501 ) ) ( not ( = ?auto_23488 ?auto_23514 ) ) ( not ( = ?auto_23489 ?auto_23501 ) ) ( not ( = ?auto_23489 ?auto_23514 ) ) ( not ( = ?auto_23490 ?auto_23501 ) ) ( not ( = ?auto_23490 ?auto_23514 ) ) ( not ( = ?auto_23491 ?auto_23501 ) ) ( not ( = ?auto_23491 ?auto_23514 ) ) ( not ( = ?auto_23492 ?auto_23501 ) ) ( not ( = ?auto_23492 ?auto_23514 ) ) ( not ( = ?auto_23495 ?auto_23501 ) ) ( not ( = ?auto_23495 ?auto_23514 ) ) ( not ( = ?auto_23493 ?auto_23501 ) ) ( not ( = ?auto_23493 ?auto_23514 ) ) ( not ( = ?auto_23497 ?auto_23501 ) ) ( not ( = ?auto_23497 ?auto_23514 ) ) ( not ( = ?auto_23496 ?auto_23501 ) ) ( not ( = ?auto_23496 ?auto_23514 ) ) ( not ( = ?auto_23494 ?auto_23501 ) ) ( not ( = ?auto_23494 ?auto_23514 ) ) ( not ( = ?auto_23499 ?auto_23501 ) ) ( not ( = ?auto_23499 ?auto_23514 ) ) ( not ( = ?auto_23498 ?auto_23501 ) ) ( not ( = ?auto_23498 ?auto_23514 ) ) ( not ( = ?auto_23501 ?auto_23534 ) ) ( not ( = ?auto_23501 ?auto_23539 ) ) ( not ( = ?auto_23501 ?auto_23531 ) ) ( not ( = ?auto_23501 ?auto_23511 ) ) ( not ( = ?auto_23501 ?auto_23518 ) ) ( not ( = ?auto_23501 ?auto_23537 ) ) ( not ( = ?auto_23501 ?auto_23536 ) ) ( not ( = ?auto_23501 ?auto_23529 ) ) ( not ( = ?auto_23501 ?auto_23543 ) ) ( not ( = ?auto_23501 ?auto_23517 ) ) ( not ( = ?auto_23501 ?auto_23526 ) ) ( not ( = ?auto_23501 ?auto_23527 ) ) ( not ( = ?auto_23514 ?auto_23534 ) ) ( not ( = ?auto_23514 ?auto_23539 ) ) ( not ( = ?auto_23514 ?auto_23531 ) ) ( not ( = ?auto_23514 ?auto_23511 ) ) ( not ( = ?auto_23514 ?auto_23518 ) ) ( not ( = ?auto_23514 ?auto_23537 ) ) ( not ( = ?auto_23514 ?auto_23536 ) ) ( not ( = ?auto_23514 ?auto_23529 ) ) ( not ( = ?auto_23514 ?auto_23543 ) ) ( not ( = ?auto_23514 ?auto_23517 ) ) ( not ( = ?auto_23514 ?auto_23526 ) ) ( not ( = ?auto_23514 ?auto_23527 ) ) ( not ( = ?auto_23488 ?auto_23502 ) ) ( not ( = ?auto_23488 ?auto_23504 ) ) ( not ( = ?auto_23489 ?auto_23502 ) ) ( not ( = ?auto_23489 ?auto_23504 ) ) ( not ( = ?auto_23490 ?auto_23502 ) ) ( not ( = ?auto_23490 ?auto_23504 ) ) ( not ( = ?auto_23491 ?auto_23502 ) ) ( not ( = ?auto_23491 ?auto_23504 ) ) ( not ( = ?auto_23492 ?auto_23502 ) ) ( not ( = ?auto_23492 ?auto_23504 ) ) ( not ( = ?auto_23495 ?auto_23502 ) ) ( not ( = ?auto_23495 ?auto_23504 ) ) ( not ( = ?auto_23493 ?auto_23502 ) ) ( not ( = ?auto_23493 ?auto_23504 ) ) ( not ( = ?auto_23497 ?auto_23502 ) ) ( not ( = ?auto_23497 ?auto_23504 ) ) ( not ( = ?auto_23496 ?auto_23502 ) ) ( not ( = ?auto_23496 ?auto_23504 ) ) ( not ( = ?auto_23494 ?auto_23502 ) ) ( not ( = ?auto_23494 ?auto_23504 ) ) ( not ( = ?auto_23499 ?auto_23502 ) ) ( not ( = ?auto_23499 ?auto_23504 ) ) ( not ( = ?auto_23498 ?auto_23502 ) ) ( not ( = ?auto_23498 ?auto_23504 ) ) ( not ( = ?auto_23500 ?auto_23502 ) ) ( not ( = ?auto_23500 ?auto_23504 ) ) ( not ( = ?auto_23502 ?auto_23514 ) ) ( not ( = ?auto_23502 ?auto_23534 ) ) ( not ( = ?auto_23502 ?auto_23539 ) ) ( not ( = ?auto_23502 ?auto_23531 ) ) ( not ( = ?auto_23502 ?auto_23511 ) ) ( not ( = ?auto_23502 ?auto_23518 ) ) ( not ( = ?auto_23502 ?auto_23537 ) ) ( not ( = ?auto_23502 ?auto_23536 ) ) ( not ( = ?auto_23502 ?auto_23529 ) ) ( not ( = ?auto_23502 ?auto_23543 ) ) ( not ( = ?auto_23502 ?auto_23517 ) ) ( not ( = ?auto_23502 ?auto_23526 ) ) ( not ( = ?auto_23502 ?auto_23527 ) ) ( not ( = ?auto_23507 ?auto_23516 ) ) ( not ( = ?auto_23507 ?auto_23521 ) ) ( not ( = ?auto_23507 ?auto_23513 ) ) ( not ( = ?auto_23507 ?auto_23520 ) ) ( not ( = ?auto_23507 ?auto_23525 ) ) ( not ( = ?auto_23507 ?auto_23535 ) ) ( not ( = ?auto_23507 ?auto_23512 ) ) ( not ( = ?auto_23507 ?auto_23530 ) ) ( not ( = ?auto_23507 ?auto_23542 ) ) ( not ( = ?auto_23507 ?auto_23541 ) ) ( not ( = ?auto_23507 ?auto_23523 ) ) ( not ( = ?auto_23508 ?auto_23515 ) ) ( not ( = ?auto_23508 ?auto_23528 ) ) ( not ( = ?auto_23508 ?auto_23538 ) ) ( not ( = ?auto_23508 ?auto_23533 ) ) ( not ( = ?auto_23508 ?auto_23522 ) ) ( not ( = ?auto_23508 ?auto_23509 ) ) ( not ( = ?auto_23508 ?auto_23510 ) ) ( not ( = ?auto_23508 ?auto_23524 ) ) ( not ( = ?auto_23508 ?auto_23532 ) ) ( not ( = ?auto_23508 ?auto_23519 ) ) ( not ( = ?auto_23508 ?auto_23540 ) ) ( not ( = ?auto_23504 ?auto_23514 ) ) ( not ( = ?auto_23504 ?auto_23534 ) ) ( not ( = ?auto_23504 ?auto_23539 ) ) ( not ( = ?auto_23504 ?auto_23531 ) ) ( not ( = ?auto_23504 ?auto_23511 ) ) ( not ( = ?auto_23504 ?auto_23518 ) ) ( not ( = ?auto_23504 ?auto_23537 ) ) ( not ( = ?auto_23504 ?auto_23536 ) ) ( not ( = ?auto_23504 ?auto_23529 ) ) ( not ( = ?auto_23504 ?auto_23543 ) ) ( not ( = ?auto_23504 ?auto_23517 ) ) ( not ( = ?auto_23504 ?auto_23526 ) ) ( not ( = ?auto_23504 ?auto_23527 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_23488 ?auto_23489 ?auto_23490 ?auto_23491 ?auto_23492 ?auto_23495 ?auto_23493 ?auto_23497 ?auto_23496 ?auto_23494 ?auto_23499 ?auto_23498 ?auto_23500 ?auto_23501 )
      ( MAKE-1CRATE ?auto_23501 ?auto_23502 )
      ( MAKE-14CRATE-VERIFY ?auto_23488 ?auto_23489 ?auto_23490 ?auto_23491 ?auto_23492 ?auto_23495 ?auto_23493 ?auto_23497 ?auto_23496 ?auto_23494 ?auto_23499 ?auto_23498 ?auto_23500 ?auto_23501 ?auto_23502 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23546 - SURFACE
      ?auto_23547 - SURFACE
    )
    :vars
    (
      ?auto_23548 - HOIST
      ?auto_23549 - PLACE
      ?auto_23551 - PLACE
      ?auto_23552 - HOIST
      ?auto_23553 - SURFACE
      ?auto_23550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23548 ?auto_23549 ) ( SURFACE-AT ?auto_23546 ?auto_23549 ) ( CLEAR ?auto_23546 ) ( IS-CRATE ?auto_23547 ) ( AVAILABLE ?auto_23548 ) ( not ( = ?auto_23551 ?auto_23549 ) ) ( HOIST-AT ?auto_23552 ?auto_23551 ) ( AVAILABLE ?auto_23552 ) ( SURFACE-AT ?auto_23547 ?auto_23551 ) ( ON ?auto_23547 ?auto_23553 ) ( CLEAR ?auto_23547 ) ( TRUCK-AT ?auto_23550 ?auto_23549 ) ( not ( = ?auto_23546 ?auto_23547 ) ) ( not ( = ?auto_23546 ?auto_23553 ) ) ( not ( = ?auto_23547 ?auto_23553 ) ) ( not ( = ?auto_23548 ?auto_23552 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23550 ?auto_23549 ?auto_23551 )
      ( !LIFT ?auto_23552 ?auto_23547 ?auto_23553 ?auto_23551 )
      ( !LOAD ?auto_23552 ?auto_23547 ?auto_23550 ?auto_23551 )
      ( !DRIVE ?auto_23550 ?auto_23551 ?auto_23549 )
      ( !UNLOAD ?auto_23548 ?auto_23547 ?auto_23550 ?auto_23549 )
      ( !DROP ?auto_23548 ?auto_23547 ?auto_23546 ?auto_23549 )
      ( MAKE-1CRATE-VERIFY ?auto_23546 ?auto_23547 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_23570 - SURFACE
      ?auto_23571 - SURFACE
      ?auto_23572 - SURFACE
      ?auto_23573 - SURFACE
      ?auto_23574 - SURFACE
      ?auto_23577 - SURFACE
      ?auto_23575 - SURFACE
      ?auto_23579 - SURFACE
      ?auto_23578 - SURFACE
      ?auto_23576 - SURFACE
      ?auto_23581 - SURFACE
      ?auto_23580 - SURFACE
      ?auto_23582 - SURFACE
      ?auto_23584 - SURFACE
      ?auto_23585 - SURFACE
      ?auto_23583 - SURFACE
    )
    :vars
    (
      ?auto_23589 - HOIST
      ?auto_23590 - PLACE
      ?auto_23587 - PLACE
      ?auto_23588 - HOIST
      ?auto_23586 - SURFACE
      ?auto_23626 - PLACE
      ?auto_23620 - HOIST
      ?auto_23612 - SURFACE
      ?auto_23628 - PLACE
      ?auto_23615 - HOIST
      ?auto_23614 - SURFACE
      ?auto_23600 - PLACE
      ?auto_23629 - HOIST
      ?auto_23619 - SURFACE
      ?auto_23594 - PLACE
      ?auto_23592 - HOIST
      ?auto_23598 - SURFACE
      ?auto_23593 - SURFACE
      ?auto_23608 - PLACE
      ?auto_23621 - HOIST
      ?auto_23613 - SURFACE
      ?auto_23625 - PLACE
      ?auto_23596 - HOIST
      ?auto_23617 - SURFACE
      ?auto_23610 - PLACE
      ?auto_23627 - HOIST
      ?auto_23607 - SURFACE
      ?auto_23602 - PLACE
      ?auto_23622 - HOIST
      ?auto_23605 - SURFACE
      ?auto_23604 - PLACE
      ?auto_23609 - HOIST
      ?auto_23601 - SURFACE
      ?auto_23618 - SURFACE
      ?auto_23623 - PLACE
      ?auto_23597 - HOIST
      ?auto_23616 - SURFACE
      ?auto_23595 - PLACE
      ?auto_23599 - HOIST
      ?auto_23606 - SURFACE
      ?auto_23603 - PLACE
      ?auto_23624 - HOIST
      ?auto_23611 - SURFACE
      ?auto_23591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23589 ?auto_23590 ) ( IS-CRATE ?auto_23583 ) ( not ( = ?auto_23587 ?auto_23590 ) ) ( HOIST-AT ?auto_23588 ?auto_23587 ) ( AVAILABLE ?auto_23588 ) ( SURFACE-AT ?auto_23583 ?auto_23587 ) ( ON ?auto_23583 ?auto_23586 ) ( CLEAR ?auto_23583 ) ( not ( = ?auto_23585 ?auto_23583 ) ) ( not ( = ?auto_23585 ?auto_23586 ) ) ( not ( = ?auto_23583 ?auto_23586 ) ) ( not ( = ?auto_23589 ?auto_23588 ) ) ( IS-CRATE ?auto_23585 ) ( not ( = ?auto_23626 ?auto_23590 ) ) ( HOIST-AT ?auto_23620 ?auto_23626 ) ( AVAILABLE ?auto_23620 ) ( SURFACE-AT ?auto_23585 ?auto_23626 ) ( ON ?auto_23585 ?auto_23612 ) ( CLEAR ?auto_23585 ) ( not ( = ?auto_23584 ?auto_23585 ) ) ( not ( = ?auto_23584 ?auto_23612 ) ) ( not ( = ?auto_23585 ?auto_23612 ) ) ( not ( = ?auto_23589 ?auto_23620 ) ) ( IS-CRATE ?auto_23584 ) ( not ( = ?auto_23628 ?auto_23590 ) ) ( HOIST-AT ?auto_23615 ?auto_23628 ) ( SURFACE-AT ?auto_23584 ?auto_23628 ) ( ON ?auto_23584 ?auto_23614 ) ( CLEAR ?auto_23584 ) ( not ( = ?auto_23582 ?auto_23584 ) ) ( not ( = ?auto_23582 ?auto_23614 ) ) ( not ( = ?auto_23584 ?auto_23614 ) ) ( not ( = ?auto_23589 ?auto_23615 ) ) ( IS-CRATE ?auto_23582 ) ( not ( = ?auto_23600 ?auto_23590 ) ) ( HOIST-AT ?auto_23629 ?auto_23600 ) ( AVAILABLE ?auto_23629 ) ( SURFACE-AT ?auto_23582 ?auto_23600 ) ( ON ?auto_23582 ?auto_23619 ) ( CLEAR ?auto_23582 ) ( not ( = ?auto_23580 ?auto_23582 ) ) ( not ( = ?auto_23580 ?auto_23619 ) ) ( not ( = ?auto_23582 ?auto_23619 ) ) ( not ( = ?auto_23589 ?auto_23629 ) ) ( IS-CRATE ?auto_23580 ) ( not ( = ?auto_23594 ?auto_23590 ) ) ( HOIST-AT ?auto_23592 ?auto_23594 ) ( AVAILABLE ?auto_23592 ) ( SURFACE-AT ?auto_23580 ?auto_23594 ) ( ON ?auto_23580 ?auto_23598 ) ( CLEAR ?auto_23580 ) ( not ( = ?auto_23581 ?auto_23580 ) ) ( not ( = ?auto_23581 ?auto_23598 ) ) ( not ( = ?auto_23580 ?auto_23598 ) ) ( not ( = ?auto_23589 ?auto_23592 ) ) ( IS-CRATE ?auto_23581 ) ( SURFACE-AT ?auto_23581 ?auto_23628 ) ( ON ?auto_23581 ?auto_23593 ) ( CLEAR ?auto_23581 ) ( not ( = ?auto_23576 ?auto_23581 ) ) ( not ( = ?auto_23576 ?auto_23593 ) ) ( not ( = ?auto_23581 ?auto_23593 ) ) ( IS-CRATE ?auto_23576 ) ( not ( = ?auto_23608 ?auto_23590 ) ) ( HOIST-AT ?auto_23621 ?auto_23608 ) ( AVAILABLE ?auto_23621 ) ( SURFACE-AT ?auto_23576 ?auto_23608 ) ( ON ?auto_23576 ?auto_23613 ) ( CLEAR ?auto_23576 ) ( not ( = ?auto_23578 ?auto_23576 ) ) ( not ( = ?auto_23578 ?auto_23613 ) ) ( not ( = ?auto_23576 ?auto_23613 ) ) ( not ( = ?auto_23589 ?auto_23621 ) ) ( IS-CRATE ?auto_23578 ) ( not ( = ?auto_23625 ?auto_23590 ) ) ( HOIST-AT ?auto_23596 ?auto_23625 ) ( AVAILABLE ?auto_23596 ) ( SURFACE-AT ?auto_23578 ?auto_23625 ) ( ON ?auto_23578 ?auto_23617 ) ( CLEAR ?auto_23578 ) ( not ( = ?auto_23579 ?auto_23578 ) ) ( not ( = ?auto_23579 ?auto_23617 ) ) ( not ( = ?auto_23578 ?auto_23617 ) ) ( not ( = ?auto_23589 ?auto_23596 ) ) ( IS-CRATE ?auto_23579 ) ( not ( = ?auto_23610 ?auto_23590 ) ) ( HOIST-AT ?auto_23627 ?auto_23610 ) ( AVAILABLE ?auto_23627 ) ( SURFACE-AT ?auto_23579 ?auto_23610 ) ( ON ?auto_23579 ?auto_23607 ) ( CLEAR ?auto_23579 ) ( not ( = ?auto_23575 ?auto_23579 ) ) ( not ( = ?auto_23575 ?auto_23607 ) ) ( not ( = ?auto_23579 ?auto_23607 ) ) ( not ( = ?auto_23589 ?auto_23627 ) ) ( IS-CRATE ?auto_23575 ) ( not ( = ?auto_23602 ?auto_23590 ) ) ( HOIST-AT ?auto_23622 ?auto_23602 ) ( AVAILABLE ?auto_23622 ) ( SURFACE-AT ?auto_23575 ?auto_23602 ) ( ON ?auto_23575 ?auto_23605 ) ( CLEAR ?auto_23575 ) ( not ( = ?auto_23577 ?auto_23575 ) ) ( not ( = ?auto_23577 ?auto_23605 ) ) ( not ( = ?auto_23575 ?auto_23605 ) ) ( not ( = ?auto_23589 ?auto_23622 ) ) ( IS-CRATE ?auto_23577 ) ( not ( = ?auto_23604 ?auto_23590 ) ) ( HOIST-AT ?auto_23609 ?auto_23604 ) ( AVAILABLE ?auto_23609 ) ( SURFACE-AT ?auto_23577 ?auto_23604 ) ( ON ?auto_23577 ?auto_23601 ) ( CLEAR ?auto_23577 ) ( not ( = ?auto_23574 ?auto_23577 ) ) ( not ( = ?auto_23574 ?auto_23601 ) ) ( not ( = ?auto_23577 ?auto_23601 ) ) ( not ( = ?auto_23589 ?auto_23609 ) ) ( IS-CRATE ?auto_23574 ) ( AVAILABLE ?auto_23615 ) ( SURFACE-AT ?auto_23574 ?auto_23628 ) ( ON ?auto_23574 ?auto_23618 ) ( CLEAR ?auto_23574 ) ( not ( = ?auto_23573 ?auto_23574 ) ) ( not ( = ?auto_23573 ?auto_23618 ) ) ( not ( = ?auto_23574 ?auto_23618 ) ) ( IS-CRATE ?auto_23573 ) ( not ( = ?auto_23623 ?auto_23590 ) ) ( HOIST-AT ?auto_23597 ?auto_23623 ) ( AVAILABLE ?auto_23597 ) ( SURFACE-AT ?auto_23573 ?auto_23623 ) ( ON ?auto_23573 ?auto_23616 ) ( CLEAR ?auto_23573 ) ( not ( = ?auto_23572 ?auto_23573 ) ) ( not ( = ?auto_23572 ?auto_23616 ) ) ( not ( = ?auto_23573 ?auto_23616 ) ) ( not ( = ?auto_23589 ?auto_23597 ) ) ( IS-CRATE ?auto_23572 ) ( not ( = ?auto_23595 ?auto_23590 ) ) ( HOIST-AT ?auto_23599 ?auto_23595 ) ( AVAILABLE ?auto_23599 ) ( SURFACE-AT ?auto_23572 ?auto_23595 ) ( ON ?auto_23572 ?auto_23606 ) ( CLEAR ?auto_23572 ) ( not ( = ?auto_23571 ?auto_23572 ) ) ( not ( = ?auto_23571 ?auto_23606 ) ) ( not ( = ?auto_23572 ?auto_23606 ) ) ( not ( = ?auto_23589 ?auto_23599 ) ) ( SURFACE-AT ?auto_23570 ?auto_23590 ) ( CLEAR ?auto_23570 ) ( IS-CRATE ?auto_23571 ) ( AVAILABLE ?auto_23589 ) ( not ( = ?auto_23603 ?auto_23590 ) ) ( HOIST-AT ?auto_23624 ?auto_23603 ) ( AVAILABLE ?auto_23624 ) ( SURFACE-AT ?auto_23571 ?auto_23603 ) ( ON ?auto_23571 ?auto_23611 ) ( CLEAR ?auto_23571 ) ( TRUCK-AT ?auto_23591 ?auto_23590 ) ( not ( = ?auto_23570 ?auto_23571 ) ) ( not ( = ?auto_23570 ?auto_23611 ) ) ( not ( = ?auto_23571 ?auto_23611 ) ) ( not ( = ?auto_23589 ?auto_23624 ) ) ( not ( = ?auto_23570 ?auto_23572 ) ) ( not ( = ?auto_23570 ?auto_23606 ) ) ( not ( = ?auto_23572 ?auto_23611 ) ) ( not ( = ?auto_23595 ?auto_23603 ) ) ( not ( = ?auto_23599 ?auto_23624 ) ) ( not ( = ?auto_23606 ?auto_23611 ) ) ( not ( = ?auto_23570 ?auto_23573 ) ) ( not ( = ?auto_23570 ?auto_23616 ) ) ( not ( = ?auto_23571 ?auto_23573 ) ) ( not ( = ?auto_23571 ?auto_23616 ) ) ( not ( = ?auto_23573 ?auto_23606 ) ) ( not ( = ?auto_23573 ?auto_23611 ) ) ( not ( = ?auto_23623 ?auto_23595 ) ) ( not ( = ?auto_23623 ?auto_23603 ) ) ( not ( = ?auto_23597 ?auto_23599 ) ) ( not ( = ?auto_23597 ?auto_23624 ) ) ( not ( = ?auto_23616 ?auto_23606 ) ) ( not ( = ?auto_23616 ?auto_23611 ) ) ( not ( = ?auto_23570 ?auto_23574 ) ) ( not ( = ?auto_23570 ?auto_23618 ) ) ( not ( = ?auto_23571 ?auto_23574 ) ) ( not ( = ?auto_23571 ?auto_23618 ) ) ( not ( = ?auto_23572 ?auto_23574 ) ) ( not ( = ?auto_23572 ?auto_23618 ) ) ( not ( = ?auto_23574 ?auto_23616 ) ) ( not ( = ?auto_23574 ?auto_23606 ) ) ( not ( = ?auto_23574 ?auto_23611 ) ) ( not ( = ?auto_23628 ?auto_23623 ) ) ( not ( = ?auto_23628 ?auto_23595 ) ) ( not ( = ?auto_23628 ?auto_23603 ) ) ( not ( = ?auto_23615 ?auto_23597 ) ) ( not ( = ?auto_23615 ?auto_23599 ) ) ( not ( = ?auto_23615 ?auto_23624 ) ) ( not ( = ?auto_23618 ?auto_23616 ) ) ( not ( = ?auto_23618 ?auto_23606 ) ) ( not ( = ?auto_23618 ?auto_23611 ) ) ( not ( = ?auto_23570 ?auto_23577 ) ) ( not ( = ?auto_23570 ?auto_23601 ) ) ( not ( = ?auto_23571 ?auto_23577 ) ) ( not ( = ?auto_23571 ?auto_23601 ) ) ( not ( = ?auto_23572 ?auto_23577 ) ) ( not ( = ?auto_23572 ?auto_23601 ) ) ( not ( = ?auto_23573 ?auto_23577 ) ) ( not ( = ?auto_23573 ?auto_23601 ) ) ( not ( = ?auto_23577 ?auto_23618 ) ) ( not ( = ?auto_23577 ?auto_23616 ) ) ( not ( = ?auto_23577 ?auto_23606 ) ) ( not ( = ?auto_23577 ?auto_23611 ) ) ( not ( = ?auto_23604 ?auto_23628 ) ) ( not ( = ?auto_23604 ?auto_23623 ) ) ( not ( = ?auto_23604 ?auto_23595 ) ) ( not ( = ?auto_23604 ?auto_23603 ) ) ( not ( = ?auto_23609 ?auto_23615 ) ) ( not ( = ?auto_23609 ?auto_23597 ) ) ( not ( = ?auto_23609 ?auto_23599 ) ) ( not ( = ?auto_23609 ?auto_23624 ) ) ( not ( = ?auto_23601 ?auto_23618 ) ) ( not ( = ?auto_23601 ?auto_23616 ) ) ( not ( = ?auto_23601 ?auto_23606 ) ) ( not ( = ?auto_23601 ?auto_23611 ) ) ( not ( = ?auto_23570 ?auto_23575 ) ) ( not ( = ?auto_23570 ?auto_23605 ) ) ( not ( = ?auto_23571 ?auto_23575 ) ) ( not ( = ?auto_23571 ?auto_23605 ) ) ( not ( = ?auto_23572 ?auto_23575 ) ) ( not ( = ?auto_23572 ?auto_23605 ) ) ( not ( = ?auto_23573 ?auto_23575 ) ) ( not ( = ?auto_23573 ?auto_23605 ) ) ( not ( = ?auto_23574 ?auto_23575 ) ) ( not ( = ?auto_23574 ?auto_23605 ) ) ( not ( = ?auto_23575 ?auto_23601 ) ) ( not ( = ?auto_23575 ?auto_23618 ) ) ( not ( = ?auto_23575 ?auto_23616 ) ) ( not ( = ?auto_23575 ?auto_23606 ) ) ( not ( = ?auto_23575 ?auto_23611 ) ) ( not ( = ?auto_23602 ?auto_23604 ) ) ( not ( = ?auto_23602 ?auto_23628 ) ) ( not ( = ?auto_23602 ?auto_23623 ) ) ( not ( = ?auto_23602 ?auto_23595 ) ) ( not ( = ?auto_23602 ?auto_23603 ) ) ( not ( = ?auto_23622 ?auto_23609 ) ) ( not ( = ?auto_23622 ?auto_23615 ) ) ( not ( = ?auto_23622 ?auto_23597 ) ) ( not ( = ?auto_23622 ?auto_23599 ) ) ( not ( = ?auto_23622 ?auto_23624 ) ) ( not ( = ?auto_23605 ?auto_23601 ) ) ( not ( = ?auto_23605 ?auto_23618 ) ) ( not ( = ?auto_23605 ?auto_23616 ) ) ( not ( = ?auto_23605 ?auto_23606 ) ) ( not ( = ?auto_23605 ?auto_23611 ) ) ( not ( = ?auto_23570 ?auto_23579 ) ) ( not ( = ?auto_23570 ?auto_23607 ) ) ( not ( = ?auto_23571 ?auto_23579 ) ) ( not ( = ?auto_23571 ?auto_23607 ) ) ( not ( = ?auto_23572 ?auto_23579 ) ) ( not ( = ?auto_23572 ?auto_23607 ) ) ( not ( = ?auto_23573 ?auto_23579 ) ) ( not ( = ?auto_23573 ?auto_23607 ) ) ( not ( = ?auto_23574 ?auto_23579 ) ) ( not ( = ?auto_23574 ?auto_23607 ) ) ( not ( = ?auto_23577 ?auto_23579 ) ) ( not ( = ?auto_23577 ?auto_23607 ) ) ( not ( = ?auto_23579 ?auto_23605 ) ) ( not ( = ?auto_23579 ?auto_23601 ) ) ( not ( = ?auto_23579 ?auto_23618 ) ) ( not ( = ?auto_23579 ?auto_23616 ) ) ( not ( = ?auto_23579 ?auto_23606 ) ) ( not ( = ?auto_23579 ?auto_23611 ) ) ( not ( = ?auto_23610 ?auto_23602 ) ) ( not ( = ?auto_23610 ?auto_23604 ) ) ( not ( = ?auto_23610 ?auto_23628 ) ) ( not ( = ?auto_23610 ?auto_23623 ) ) ( not ( = ?auto_23610 ?auto_23595 ) ) ( not ( = ?auto_23610 ?auto_23603 ) ) ( not ( = ?auto_23627 ?auto_23622 ) ) ( not ( = ?auto_23627 ?auto_23609 ) ) ( not ( = ?auto_23627 ?auto_23615 ) ) ( not ( = ?auto_23627 ?auto_23597 ) ) ( not ( = ?auto_23627 ?auto_23599 ) ) ( not ( = ?auto_23627 ?auto_23624 ) ) ( not ( = ?auto_23607 ?auto_23605 ) ) ( not ( = ?auto_23607 ?auto_23601 ) ) ( not ( = ?auto_23607 ?auto_23618 ) ) ( not ( = ?auto_23607 ?auto_23616 ) ) ( not ( = ?auto_23607 ?auto_23606 ) ) ( not ( = ?auto_23607 ?auto_23611 ) ) ( not ( = ?auto_23570 ?auto_23578 ) ) ( not ( = ?auto_23570 ?auto_23617 ) ) ( not ( = ?auto_23571 ?auto_23578 ) ) ( not ( = ?auto_23571 ?auto_23617 ) ) ( not ( = ?auto_23572 ?auto_23578 ) ) ( not ( = ?auto_23572 ?auto_23617 ) ) ( not ( = ?auto_23573 ?auto_23578 ) ) ( not ( = ?auto_23573 ?auto_23617 ) ) ( not ( = ?auto_23574 ?auto_23578 ) ) ( not ( = ?auto_23574 ?auto_23617 ) ) ( not ( = ?auto_23577 ?auto_23578 ) ) ( not ( = ?auto_23577 ?auto_23617 ) ) ( not ( = ?auto_23575 ?auto_23578 ) ) ( not ( = ?auto_23575 ?auto_23617 ) ) ( not ( = ?auto_23578 ?auto_23607 ) ) ( not ( = ?auto_23578 ?auto_23605 ) ) ( not ( = ?auto_23578 ?auto_23601 ) ) ( not ( = ?auto_23578 ?auto_23618 ) ) ( not ( = ?auto_23578 ?auto_23616 ) ) ( not ( = ?auto_23578 ?auto_23606 ) ) ( not ( = ?auto_23578 ?auto_23611 ) ) ( not ( = ?auto_23625 ?auto_23610 ) ) ( not ( = ?auto_23625 ?auto_23602 ) ) ( not ( = ?auto_23625 ?auto_23604 ) ) ( not ( = ?auto_23625 ?auto_23628 ) ) ( not ( = ?auto_23625 ?auto_23623 ) ) ( not ( = ?auto_23625 ?auto_23595 ) ) ( not ( = ?auto_23625 ?auto_23603 ) ) ( not ( = ?auto_23596 ?auto_23627 ) ) ( not ( = ?auto_23596 ?auto_23622 ) ) ( not ( = ?auto_23596 ?auto_23609 ) ) ( not ( = ?auto_23596 ?auto_23615 ) ) ( not ( = ?auto_23596 ?auto_23597 ) ) ( not ( = ?auto_23596 ?auto_23599 ) ) ( not ( = ?auto_23596 ?auto_23624 ) ) ( not ( = ?auto_23617 ?auto_23607 ) ) ( not ( = ?auto_23617 ?auto_23605 ) ) ( not ( = ?auto_23617 ?auto_23601 ) ) ( not ( = ?auto_23617 ?auto_23618 ) ) ( not ( = ?auto_23617 ?auto_23616 ) ) ( not ( = ?auto_23617 ?auto_23606 ) ) ( not ( = ?auto_23617 ?auto_23611 ) ) ( not ( = ?auto_23570 ?auto_23576 ) ) ( not ( = ?auto_23570 ?auto_23613 ) ) ( not ( = ?auto_23571 ?auto_23576 ) ) ( not ( = ?auto_23571 ?auto_23613 ) ) ( not ( = ?auto_23572 ?auto_23576 ) ) ( not ( = ?auto_23572 ?auto_23613 ) ) ( not ( = ?auto_23573 ?auto_23576 ) ) ( not ( = ?auto_23573 ?auto_23613 ) ) ( not ( = ?auto_23574 ?auto_23576 ) ) ( not ( = ?auto_23574 ?auto_23613 ) ) ( not ( = ?auto_23577 ?auto_23576 ) ) ( not ( = ?auto_23577 ?auto_23613 ) ) ( not ( = ?auto_23575 ?auto_23576 ) ) ( not ( = ?auto_23575 ?auto_23613 ) ) ( not ( = ?auto_23579 ?auto_23576 ) ) ( not ( = ?auto_23579 ?auto_23613 ) ) ( not ( = ?auto_23576 ?auto_23617 ) ) ( not ( = ?auto_23576 ?auto_23607 ) ) ( not ( = ?auto_23576 ?auto_23605 ) ) ( not ( = ?auto_23576 ?auto_23601 ) ) ( not ( = ?auto_23576 ?auto_23618 ) ) ( not ( = ?auto_23576 ?auto_23616 ) ) ( not ( = ?auto_23576 ?auto_23606 ) ) ( not ( = ?auto_23576 ?auto_23611 ) ) ( not ( = ?auto_23608 ?auto_23625 ) ) ( not ( = ?auto_23608 ?auto_23610 ) ) ( not ( = ?auto_23608 ?auto_23602 ) ) ( not ( = ?auto_23608 ?auto_23604 ) ) ( not ( = ?auto_23608 ?auto_23628 ) ) ( not ( = ?auto_23608 ?auto_23623 ) ) ( not ( = ?auto_23608 ?auto_23595 ) ) ( not ( = ?auto_23608 ?auto_23603 ) ) ( not ( = ?auto_23621 ?auto_23596 ) ) ( not ( = ?auto_23621 ?auto_23627 ) ) ( not ( = ?auto_23621 ?auto_23622 ) ) ( not ( = ?auto_23621 ?auto_23609 ) ) ( not ( = ?auto_23621 ?auto_23615 ) ) ( not ( = ?auto_23621 ?auto_23597 ) ) ( not ( = ?auto_23621 ?auto_23599 ) ) ( not ( = ?auto_23621 ?auto_23624 ) ) ( not ( = ?auto_23613 ?auto_23617 ) ) ( not ( = ?auto_23613 ?auto_23607 ) ) ( not ( = ?auto_23613 ?auto_23605 ) ) ( not ( = ?auto_23613 ?auto_23601 ) ) ( not ( = ?auto_23613 ?auto_23618 ) ) ( not ( = ?auto_23613 ?auto_23616 ) ) ( not ( = ?auto_23613 ?auto_23606 ) ) ( not ( = ?auto_23613 ?auto_23611 ) ) ( not ( = ?auto_23570 ?auto_23581 ) ) ( not ( = ?auto_23570 ?auto_23593 ) ) ( not ( = ?auto_23571 ?auto_23581 ) ) ( not ( = ?auto_23571 ?auto_23593 ) ) ( not ( = ?auto_23572 ?auto_23581 ) ) ( not ( = ?auto_23572 ?auto_23593 ) ) ( not ( = ?auto_23573 ?auto_23581 ) ) ( not ( = ?auto_23573 ?auto_23593 ) ) ( not ( = ?auto_23574 ?auto_23581 ) ) ( not ( = ?auto_23574 ?auto_23593 ) ) ( not ( = ?auto_23577 ?auto_23581 ) ) ( not ( = ?auto_23577 ?auto_23593 ) ) ( not ( = ?auto_23575 ?auto_23581 ) ) ( not ( = ?auto_23575 ?auto_23593 ) ) ( not ( = ?auto_23579 ?auto_23581 ) ) ( not ( = ?auto_23579 ?auto_23593 ) ) ( not ( = ?auto_23578 ?auto_23581 ) ) ( not ( = ?auto_23578 ?auto_23593 ) ) ( not ( = ?auto_23581 ?auto_23613 ) ) ( not ( = ?auto_23581 ?auto_23617 ) ) ( not ( = ?auto_23581 ?auto_23607 ) ) ( not ( = ?auto_23581 ?auto_23605 ) ) ( not ( = ?auto_23581 ?auto_23601 ) ) ( not ( = ?auto_23581 ?auto_23618 ) ) ( not ( = ?auto_23581 ?auto_23616 ) ) ( not ( = ?auto_23581 ?auto_23606 ) ) ( not ( = ?auto_23581 ?auto_23611 ) ) ( not ( = ?auto_23593 ?auto_23613 ) ) ( not ( = ?auto_23593 ?auto_23617 ) ) ( not ( = ?auto_23593 ?auto_23607 ) ) ( not ( = ?auto_23593 ?auto_23605 ) ) ( not ( = ?auto_23593 ?auto_23601 ) ) ( not ( = ?auto_23593 ?auto_23618 ) ) ( not ( = ?auto_23593 ?auto_23616 ) ) ( not ( = ?auto_23593 ?auto_23606 ) ) ( not ( = ?auto_23593 ?auto_23611 ) ) ( not ( = ?auto_23570 ?auto_23580 ) ) ( not ( = ?auto_23570 ?auto_23598 ) ) ( not ( = ?auto_23571 ?auto_23580 ) ) ( not ( = ?auto_23571 ?auto_23598 ) ) ( not ( = ?auto_23572 ?auto_23580 ) ) ( not ( = ?auto_23572 ?auto_23598 ) ) ( not ( = ?auto_23573 ?auto_23580 ) ) ( not ( = ?auto_23573 ?auto_23598 ) ) ( not ( = ?auto_23574 ?auto_23580 ) ) ( not ( = ?auto_23574 ?auto_23598 ) ) ( not ( = ?auto_23577 ?auto_23580 ) ) ( not ( = ?auto_23577 ?auto_23598 ) ) ( not ( = ?auto_23575 ?auto_23580 ) ) ( not ( = ?auto_23575 ?auto_23598 ) ) ( not ( = ?auto_23579 ?auto_23580 ) ) ( not ( = ?auto_23579 ?auto_23598 ) ) ( not ( = ?auto_23578 ?auto_23580 ) ) ( not ( = ?auto_23578 ?auto_23598 ) ) ( not ( = ?auto_23576 ?auto_23580 ) ) ( not ( = ?auto_23576 ?auto_23598 ) ) ( not ( = ?auto_23580 ?auto_23593 ) ) ( not ( = ?auto_23580 ?auto_23613 ) ) ( not ( = ?auto_23580 ?auto_23617 ) ) ( not ( = ?auto_23580 ?auto_23607 ) ) ( not ( = ?auto_23580 ?auto_23605 ) ) ( not ( = ?auto_23580 ?auto_23601 ) ) ( not ( = ?auto_23580 ?auto_23618 ) ) ( not ( = ?auto_23580 ?auto_23616 ) ) ( not ( = ?auto_23580 ?auto_23606 ) ) ( not ( = ?auto_23580 ?auto_23611 ) ) ( not ( = ?auto_23594 ?auto_23628 ) ) ( not ( = ?auto_23594 ?auto_23608 ) ) ( not ( = ?auto_23594 ?auto_23625 ) ) ( not ( = ?auto_23594 ?auto_23610 ) ) ( not ( = ?auto_23594 ?auto_23602 ) ) ( not ( = ?auto_23594 ?auto_23604 ) ) ( not ( = ?auto_23594 ?auto_23623 ) ) ( not ( = ?auto_23594 ?auto_23595 ) ) ( not ( = ?auto_23594 ?auto_23603 ) ) ( not ( = ?auto_23592 ?auto_23615 ) ) ( not ( = ?auto_23592 ?auto_23621 ) ) ( not ( = ?auto_23592 ?auto_23596 ) ) ( not ( = ?auto_23592 ?auto_23627 ) ) ( not ( = ?auto_23592 ?auto_23622 ) ) ( not ( = ?auto_23592 ?auto_23609 ) ) ( not ( = ?auto_23592 ?auto_23597 ) ) ( not ( = ?auto_23592 ?auto_23599 ) ) ( not ( = ?auto_23592 ?auto_23624 ) ) ( not ( = ?auto_23598 ?auto_23593 ) ) ( not ( = ?auto_23598 ?auto_23613 ) ) ( not ( = ?auto_23598 ?auto_23617 ) ) ( not ( = ?auto_23598 ?auto_23607 ) ) ( not ( = ?auto_23598 ?auto_23605 ) ) ( not ( = ?auto_23598 ?auto_23601 ) ) ( not ( = ?auto_23598 ?auto_23618 ) ) ( not ( = ?auto_23598 ?auto_23616 ) ) ( not ( = ?auto_23598 ?auto_23606 ) ) ( not ( = ?auto_23598 ?auto_23611 ) ) ( not ( = ?auto_23570 ?auto_23582 ) ) ( not ( = ?auto_23570 ?auto_23619 ) ) ( not ( = ?auto_23571 ?auto_23582 ) ) ( not ( = ?auto_23571 ?auto_23619 ) ) ( not ( = ?auto_23572 ?auto_23582 ) ) ( not ( = ?auto_23572 ?auto_23619 ) ) ( not ( = ?auto_23573 ?auto_23582 ) ) ( not ( = ?auto_23573 ?auto_23619 ) ) ( not ( = ?auto_23574 ?auto_23582 ) ) ( not ( = ?auto_23574 ?auto_23619 ) ) ( not ( = ?auto_23577 ?auto_23582 ) ) ( not ( = ?auto_23577 ?auto_23619 ) ) ( not ( = ?auto_23575 ?auto_23582 ) ) ( not ( = ?auto_23575 ?auto_23619 ) ) ( not ( = ?auto_23579 ?auto_23582 ) ) ( not ( = ?auto_23579 ?auto_23619 ) ) ( not ( = ?auto_23578 ?auto_23582 ) ) ( not ( = ?auto_23578 ?auto_23619 ) ) ( not ( = ?auto_23576 ?auto_23582 ) ) ( not ( = ?auto_23576 ?auto_23619 ) ) ( not ( = ?auto_23581 ?auto_23582 ) ) ( not ( = ?auto_23581 ?auto_23619 ) ) ( not ( = ?auto_23582 ?auto_23598 ) ) ( not ( = ?auto_23582 ?auto_23593 ) ) ( not ( = ?auto_23582 ?auto_23613 ) ) ( not ( = ?auto_23582 ?auto_23617 ) ) ( not ( = ?auto_23582 ?auto_23607 ) ) ( not ( = ?auto_23582 ?auto_23605 ) ) ( not ( = ?auto_23582 ?auto_23601 ) ) ( not ( = ?auto_23582 ?auto_23618 ) ) ( not ( = ?auto_23582 ?auto_23616 ) ) ( not ( = ?auto_23582 ?auto_23606 ) ) ( not ( = ?auto_23582 ?auto_23611 ) ) ( not ( = ?auto_23600 ?auto_23594 ) ) ( not ( = ?auto_23600 ?auto_23628 ) ) ( not ( = ?auto_23600 ?auto_23608 ) ) ( not ( = ?auto_23600 ?auto_23625 ) ) ( not ( = ?auto_23600 ?auto_23610 ) ) ( not ( = ?auto_23600 ?auto_23602 ) ) ( not ( = ?auto_23600 ?auto_23604 ) ) ( not ( = ?auto_23600 ?auto_23623 ) ) ( not ( = ?auto_23600 ?auto_23595 ) ) ( not ( = ?auto_23600 ?auto_23603 ) ) ( not ( = ?auto_23629 ?auto_23592 ) ) ( not ( = ?auto_23629 ?auto_23615 ) ) ( not ( = ?auto_23629 ?auto_23621 ) ) ( not ( = ?auto_23629 ?auto_23596 ) ) ( not ( = ?auto_23629 ?auto_23627 ) ) ( not ( = ?auto_23629 ?auto_23622 ) ) ( not ( = ?auto_23629 ?auto_23609 ) ) ( not ( = ?auto_23629 ?auto_23597 ) ) ( not ( = ?auto_23629 ?auto_23599 ) ) ( not ( = ?auto_23629 ?auto_23624 ) ) ( not ( = ?auto_23619 ?auto_23598 ) ) ( not ( = ?auto_23619 ?auto_23593 ) ) ( not ( = ?auto_23619 ?auto_23613 ) ) ( not ( = ?auto_23619 ?auto_23617 ) ) ( not ( = ?auto_23619 ?auto_23607 ) ) ( not ( = ?auto_23619 ?auto_23605 ) ) ( not ( = ?auto_23619 ?auto_23601 ) ) ( not ( = ?auto_23619 ?auto_23618 ) ) ( not ( = ?auto_23619 ?auto_23616 ) ) ( not ( = ?auto_23619 ?auto_23606 ) ) ( not ( = ?auto_23619 ?auto_23611 ) ) ( not ( = ?auto_23570 ?auto_23584 ) ) ( not ( = ?auto_23570 ?auto_23614 ) ) ( not ( = ?auto_23571 ?auto_23584 ) ) ( not ( = ?auto_23571 ?auto_23614 ) ) ( not ( = ?auto_23572 ?auto_23584 ) ) ( not ( = ?auto_23572 ?auto_23614 ) ) ( not ( = ?auto_23573 ?auto_23584 ) ) ( not ( = ?auto_23573 ?auto_23614 ) ) ( not ( = ?auto_23574 ?auto_23584 ) ) ( not ( = ?auto_23574 ?auto_23614 ) ) ( not ( = ?auto_23577 ?auto_23584 ) ) ( not ( = ?auto_23577 ?auto_23614 ) ) ( not ( = ?auto_23575 ?auto_23584 ) ) ( not ( = ?auto_23575 ?auto_23614 ) ) ( not ( = ?auto_23579 ?auto_23584 ) ) ( not ( = ?auto_23579 ?auto_23614 ) ) ( not ( = ?auto_23578 ?auto_23584 ) ) ( not ( = ?auto_23578 ?auto_23614 ) ) ( not ( = ?auto_23576 ?auto_23584 ) ) ( not ( = ?auto_23576 ?auto_23614 ) ) ( not ( = ?auto_23581 ?auto_23584 ) ) ( not ( = ?auto_23581 ?auto_23614 ) ) ( not ( = ?auto_23580 ?auto_23584 ) ) ( not ( = ?auto_23580 ?auto_23614 ) ) ( not ( = ?auto_23584 ?auto_23619 ) ) ( not ( = ?auto_23584 ?auto_23598 ) ) ( not ( = ?auto_23584 ?auto_23593 ) ) ( not ( = ?auto_23584 ?auto_23613 ) ) ( not ( = ?auto_23584 ?auto_23617 ) ) ( not ( = ?auto_23584 ?auto_23607 ) ) ( not ( = ?auto_23584 ?auto_23605 ) ) ( not ( = ?auto_23584 ?auto_23601 ) ) ( not ( = ?auto_23584 ?auto_23618 ) ) ( not ( = ?auto_23584 ?auto_23616 ) ) ( not ( = ?auto_23584 ?auto_23606 ) ) ( not ( = ?auto_23584 ?auto_23611 ) ) ( not ( = ?auto_23614 ?auto_23619 ) ) ( not ( = ?auto_23614 ?auto_23598 ) ) ( not ( = ?auto_23614 ?auto_23593 ) ) ( not ( = ?auto_23614 ?auto_23613 ) ) ( not ( = ?auto_23614 ?auto_23617 ) ) ( not ( = ?auto_23614 ?auto_23607 ) ) ( not ( = ?auto_23614 ?auto_23605 ) ) ( not ( = ?auto_23614 ?auto_23601 ) ) ( not ( = ?auto_23614 ?auto_23618 ) ) ( not ( = ?auto_23614 ?auto_23616 ) ) ( not ( = ?auto_23614 ?auto_23606 ) ) ( not ( = ?auto_23614 ?auto_23611 ) ) ( not ( = ?auto_23570 ?auto_23585 ) ) ( not ( = ?auto_23570 ?auto_23612 ) ) ( not ( = ?auto_23571 ?auto_23585 ) ) ( not ( = ?auto_23571 ?auto_23612 ) ) ( not ( = ?auto_23572 ?auto_23585 ) ) ( not ( = ?auto_23572 ?auto_23612 ) ) ( not ( = ?auto_23573 ?auto_23585 ) ) ( not ( = ?auto_23573 ?auto_23612 ) ) ( not ( = ?auto_23574 ?auto_23585 ) ) ( not ( = ?auto_23574 ?auto_23612 ) ) ( not ( = ?auto_23577 ?auto_23585 ) ) ( not ( = ?auto_23577 ?auto_23612 ) ) ( not ( = ?auto_23575 ?auto_23585 ) ) ( not ( = ?auto_23575 ?auto_23612 ) ) ( not ( = ?auto_23579 ?auto_23585 ) ) ( not ( = ?auto_23579 ?auto_23612 ) ) ( not ( = ?auto_23578 ?auto_23585 ) ) ( not ( = ?auto_23578 ?auto_23612 ) ) ( not ( = ?auto_23576 ?auto_23585 ) ) ( not ( = ?auto_23576 ?auto_23612 ) ) ( not ( = ?auto_23581 ?auto_23585 ) ) ( not ( = ?auto_23581 ?auto_23612 ) ) ( not ( = ?auto_23580 ?auto_23585 ) ) ( not ( = ?auto_23580 ?auto_23612 ) ) ( not ( = ?auto_23582 ?auto_23585 ) ) ( not ( = ?auto_23582 ?auto_23612 ) ) ( not ( = ?auto_23585 ?auto_23614 ) ) ( not ( = ?auto_23585 ?auto_23619 ) ) ( not ( = ?auto_23585 ?auto_23598 ) ) ( not ( = ?auto_23585 ?auto_23593 ) ) ( not ( = ?auto_23585 ?auto_23613 ) ) ( not ( = ?auto_23585 ?auto_23617 ) ) ( not ( = ?auto_23585 ?auto_23607 ) ) ( not ( = ?auto_23585 ?auto_23605 ) ) ( not ( = ?auto_23585 ?auto_23601 ) ) ( not ( = ?auto_23585 ?auto_23618 ) ) ( not ( = ?auto_23585 ?auto_23616 ) ) ( not ( = ?auto_23585 ?auto_23606 ) ) ( not ( = ?auto_23585 ?auto_23611 ) ) ( not ( = ?auto_23626 ?auto_23628 ) ) ( not ( = ?auto_23626 ?auto_23600 ) ) ( not ( = ?auto_23626 ?auto_23594 ) ) ( not ( = ?auto_23626 ?auto_23608 ) ) ( not ( = ?auto_23626 ?auto_23625 ) ) ( not ( = ?auto_23626 ?auto_23610 ) ) ( not ( = ?auto_23626 ?auto_23602 ) ) ( not ( = ?auto_23626 ?auto_23604 ) ) ( not ( = ?auto_23626 ?auto_23623 ) ) ( not ( = ?auto_23626 ?auto_23595 ) ) ( not ( = ?auto_23626 ?auto_23603 ) ) ( not ( = ?auto_23620 ?auto_23615 ) ) ( not ( = ?auto_23620 ?auto_23629 ) ) ( not ( = ?auto_23620 ?auto_23592 ) ) ( not ( = ?auto_23620 ?auto_23621 ) ) ( not ( = ?auto_23620 ?auto_23596 ) ) ( not ( = ?auto_23620 ?auto_23627 ) ) ( not ( = ?auto_23620 ?auto_23622 ) ) ( not ( = ?auto_23620 ?auto_23609 ) ) ( not ( = ?auto_23620 ?auto_23597 ) ) ( not ( = ?auto_23620 ?auto_23599 ) ) ( not ( = ?auto_23620 ?auto_23624 ) ) ( not ( = ?auto_23612 ?auto_23614 ) ) ( not ( = ?auto_23612 ?auto_23619 ) ) ( not ( = ?auto_23612 ?auto_23598 ) ) ( not ( = ?auto_23612 ?auto_23593 ) ) ( not ( = ?auto_23612 ?auto_23613 ) ) ( not ( = ?auto_23612 ?auto_23617 ) ) ( not ( = ?auto_23612 ?auto_23607 ) ) ( not ( = ?auto_23612 ?auto_23605 ) ) ( not ( = ?auto_23612 ?auto_23601 ) ) ( not ( = ?auto_23612 ?auto_23618 ) ) ( not ( = ?auto_23612 ?auto_23616 ) ) ( not ( = ?auto_23612 ?auto_23606 ) ) ( not ( = ?auto_23612 ?auto_23611 ) ) ( not ( = ?auto_23570 ?auto_23583 ) ) ( not ( = ?auto_23570 ?auto_23586 ) ) ( not ( = ?auto_23571 ?auto_23583 ) ) ( not ( = ?auto_23571 ?auto_23586 ) ) ( not ( = ?auto_23572 ?auto_23583 ) ) ( not ( = ?auto_23572 ?auto_23586 ) ) ( not ( = ?auto_23573 ?auto_23583 ) ) ( not ( = ?auto_23573 ?auto_23586 ) ) ( not ( = ?auto_23574 ?auto_23583 ) ) ( not ( = ?auto_23574 ?auto_23586 ) ) ( not ( = ?auto_23577 ?auto_23583 ) ) ( not ( = ?auto_23577 ?auto_23586 ) ) ( not ( = ?auto_23575 ?auto_23583 ) ) ( not ( = ?auto_23575 ?auto_23586 ) ) ( not ( = ?auto_23579 ?auto_23583 ) ) ( not ( = ?auto_23579 ?auto_23586 ) ) ( not ( = ?auto_23578 ?auto_23583 ) ) ( not ( = ?auto_23578 ?auto_23586 ) ) ( not ( = ?auto_23576 ?auto_23583 ) ) ( not ( = ?auto_23576 ?auto_23586 ) ) ( not ( = ?auto_23581 ?auto_23583 ) ) ( not ( = ?auto_23581 ?auto_23586 ) ) ( not ( = ?auto_23580 ?auto_23583 ) ) ( not ( = ?auto_23580 ?auto_23586 ) ) ( not ( = ?auto_23582 ?auto_23583 ) ) ( not ( = ?auto_23582 ?auto_23586 ) ) ( not ( = ?auto_23584 ?auto_23583 ) ) ( not ( = ?auto_23584 ?auto_23586 ) ) ( not ( = ?auto_23583 ?auto_23612 ) ) ( not ( = ?auto_23583 ?auto_23614 ) ) ( not ( = ?auto_23583 ?auto_23619 ) ) ( not ( = ?auto_23583 ?auto_23598 ) ) ( not ( = ?auto_23583 ?auto_23593 ) ) ( not ( = ?auto_23583 ?auto_23613 ) ) ( not ( = ?auto_23583 ?auto_23617 ) ) ( not ( = ?auto_23583 ?auto_23607 ) ) ( not ( = ?auto_23583 ?auto_23605 ) ) ( not ( = ?auto_23583 ?auto_23601 ) ) ( not ( = ?auto_23583 ?auto_23618 ) ) ( not ( = ?auto_23583 ?auto_23616 ) ) ( not ( = ?auto_23583 ?auto_23606 ) ) ( not ( = ?auto_23583 ?auto_23611 ) ) ( not ( = ?auto_23587 ?auto_23626 ) ) ( not ( = ?auto_23587 ?auto_23628 ) ) ( not ( = ?auto_23587 ?auto_23600 ) ) ( not ( = ?auto_23587 ?auto_23594 ) ) ( not ( = ?auto_23587 ?auto_23608 ) ) ( not ( = ?auto_23587 ?auto_23625 ) ) ( not ( = ?auto_23587 ?auto_23610 ) ) ( not ( = ?auto_23587 ?auto_23602 ) ) ( not ( = ?auto_23587 ?auto_23604 ) ) ( not ( = ?auto_23587 ?auto_23623 ) ) ( not ( = ?auto_23587 ?auto_23595 ) ) ( not ( = ?auto_23587 ?auto_23603 ) ) ( not ( = ?auto_23588 ?auto_23620 ) ) ( not ( = ?auto_23588 ?auto_23615 ) ) ( not ( = ?auto_23588 ?auto_23629 ) ) ( not ( = ?auto_23588 ?auto_23592 ) ) ( not ( = ?auto_23588 ?auto_23621 ) ) ( not ( = ?auto_23588 ?auto_23596 ) ) ( not ( = ?auto_23588 ?auto_23627 ) ) ( not ( = ?auto_23588 ?auto_23622 ) ) ( not ( = ?auto_23588 ?auto_23609 ) ) ( not ( = ?auto_23588 ?auto_23597 ) ) ( not ( = ?auto_23588 ?auto_23599 ) ) ( not ( = ?auto_23588 ?auto_23624 ) ) ( not ( = ?auto_23586 ?auto_23612 ) ) ( not ( = ?auto_23586 ?auto_23614 ) ) ( not ( = ?auto_23586 ?auto_23619 ) ) ( not ( = ?auto_23586 ?auto_23598 ) ) ( not ( = ?auto_23586 ?auto_23593 ) ) ( not ( = ?auto_23586 ?auto_23613 ) ) ( not ( = ?auto_23586 ?auto_23617 ) ) ( not ( = ?auto_23586 ?auto_23607 ) ) ( not ( = ?auto_23586 ?auto_23605 ) ) ( not ( = ?auto_23586 ?auto_23601 ) ) ( not ( = ?auto_23586 ?auto_23618 ) ) ( not ( = ?auto_23586 ?auto_23616 ) ) ( not ( = ?auto_23586 ?auto_23606 ) ) ( not ( = ?auto_23586 ?auto_23611 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_23570 ?auto_23571 ?auto_23572 ?auto_23573 ?auto_23574 ?auto_23577 ?auto_23575 ?auto_23579 ?auto_23578 ?auto_23576 ?auto_23581 ?auto_23580 ?auto_23582 ?auto_23584 ?auto_23585 )
      ( MAKE-1CRATE ?auto_23585 ?auto_23583 )
      ( MAKE-15CRATE-VERIFY ?auto_23570 ?auto_23571 ?auto_23572 ?auto_23573 ?auto_23574 ?auto_23577 ?auto_23575 ?auto_23579 ?auto_23578 ?auto_23576 ?auto_23581 ?auto_23580 ?auto_23582 ?auto_23584 ?auto_23585 ?auto_23583 ) )
  )

)

